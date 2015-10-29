//===-- VEXVLIWPacketizer.cpp - VEX VLIW Packetizer     -------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the pass required to bundle instructions together
// to create VLIW instructions. We bundle instruction by adding
// a TargetOpcode::Bundle instruction at the beginning of each bundle.
//
//===----------------------------------------------------------------------===//

#include "VEXSubtarget.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/DFAPacketizer.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineLoopInfo.h"
#include "llvm/CodeGen/MachineDominators.h"
#include "llvm/CodeGen/ScheduleDAG.h"
#include "llvm/MC/MCInstrInfo.h"

#define DEBUG_TYPE "vex-vliw-scheduling"

using namespace llvm;

namespace llvm {
    FunctionPass *createVEXPacketizer(bool EnableVLIWScheduling);
}

namespace {
class VEXPacketizer : public MachineFunctionPass {
    
    bool EnableVLIWScheduling;
    //MachineFunction::iterator currentMBB;
    
    bool canResourceResourcesForLongImmediate(MachineInstr *MI);

public:
    static char ID;

    VEXPacketizer(bool EnableVLIWScheduling) : MachineFunctionPass(ID),
                                               EnableVLIWScheduling(EnableVLIWScheduling)
                                               {}

    void getAnalysisUsage(AnalysisUsage &AU) const override {
        AU.setPreservesCFG();
        AU.addRequired<MachineDominatorTree>();
        //AU.addRequired<MachineBranchProbabilityInfo>();
        AU.addPreserved<MachineDominatorTree>();
        AU.addRequired<MachineLoopInfo>();
        AU.addPreserved<MachineLoopInfo>();

        MachineFunctionPass::getAnalysisUsage(AU);
    }
    
    bool runOnMachineFunction(MachineFunction &MF) override;
    
};


class VEXPacketizerList : public VLIWPacketizerList {

    MachineInstr *PseudoMI;
    
    std::map<SUnit *, unsigned> DataHazards;
    
    const MachineFunction &MF;
    
    SUnit* CurrentSUnit;
    
    bool TrueDependence;
    
    const VEXInstrInfo *VEXII;
    const VEXSubtarget* Subtarget;
    const InstrItineraryData *II;
    
public:
    VEXPacketizerList(MachineFunction &MF,
                      MachineLoopInfo &MLI)
                      : VLIWPacketizerList(MF, MLI, true),
                        MF(MF), TrueDependence(false) {
        VEXII = (const VEXInstrInfo *) TII;
        Subtarget = &MF.getSubtarget<VEXSubtarget>();
        II = static_cast<const VEXSubtarget *>(Subtarget)->getInstrItineraryData();
        DataHazards.clear();
    }

    bool isSoloInstruction(MachineInstr *MI) override;
    bool ignorePseudoInstruction(MachineInstr *MI, MachineBasicBlock *MBB) override;
    bool isLegalToPacketizeTogether(SUnit *SUI, SUnit *SUJ) override;
    void AdvanceCycle();
    MachineBasicBlock::iterator addToPacket(MachineInstr *MI) override;
    
    bool canReserveResourcesForLongImmediate (MachineBasicBlock::iterator MI);
    void reserveResourcesForLongImmediate (MachineBasicBlock::iterator MI);
    bool isLongImmediate(int64_t Immediate);

};

}

bool VEXPacketizerList::isLongImmediate(int64_t Immediate) {
    
    const int MAXIMUM_SHORTIMM = (1 << 8) - 1;
    const int MINIMUM_SHORTIMM = -(1 << 8);
    
    if (Immediate >= MINIMUM_SHORTIMM &&
        Immediate <= MAXIMUM_SHORTIMM) {
        return false;
    } else {
        return true;
    }
}

bool VEXPacketizerList::canReserveResourcesForLongImmediate (MachineBasicBlock::iterator MI) {
    
    MachineFunction *MF = MI->getParent()->getParent();
    
    PseudoMI = MF->CreateMachineInstr(VEXII->get(VEX::EXTIMM),
                                          MI->getDebugLoc());
        
    if (ResourceTracker->canReserveResources(PseudoMI)) {
        MI->getParent()->getParent()->DeleteMachineInstr(PseudoMI);
        return true;
    } else {
        MI->getParent()->getParent()->DeleteMachineInstr(PseudoMI);
        return false;
    }
}

void VEXPacketizerList::reserveResourcesForLongImmediate (MachineBasicBlock::iterator MI) {

    MachineFunction *MF = MI->getParent()->getParent();
    
    PseudoMI = MF->CreateMachineInstr(VEXII->get(VEX::EXTIMM),
                                      MI->getDebugLoc());
    
    if (ResourceTracker->canReserveResources(PseudoMI)) {
        DEBUG(errs() << "Reserving Issue to Long Immediate\n");
        ResourceTracker->reserveResources(PseudoMI);
        MI->getParent()->getParent()->DeleteMachineInstr(PseudoMI);
    } else {
        llvm_unreachable("can not reserve resources for constant extender.");
    }
}


// This function is extremely important on Packetizing Instruction to VEX
// First, we need to check if we should insert Bubbles (NoOps Instructions)
// Multiple Noops might be necessary, in case we have high-latency instructions
// and No other instruction can be issued in that cycle.
// Also, here we check if we can packetize instructions if long immediates
// in the Current Bundle. If not, ends packet and starts a new one.
MachineBasicBlock::iterator VEXPacketizerList::addToPacket(MachineInstr *MI) {
    
    // Get MBB from Instruction
    MachineFunction::iterator MBB = MI->getParent();
    MachineBasicBlock::iterator MII = MI;
    
    unsigned idx = MI->getDesc().getSchedClass();
    unsigned Latency = II->getStageLatency(idx);
    
    bool AddToHazardTable = false;
    
    if (Latency > 1) {
        MI->dump();
        DEBUG(errs() <<  "Latency is: " << Latency <<  "\n");
        AddToHazardTable = true;
    }
    
    // We should Advance Cycle only when a new packet is created
    // Note that this only means we should update the Latencies
    if (CurrentPacketMIs.size() == 0)
        AdvanceCycle();
    
    // We need to insert a NOP Here.
    if (TrueDependence) {
    
        // If we have multiple nops, we will insert them using this loop
        do {
            TrueDependence = false;
            
            MachineBasicBlock *MBB = MI->getParent();
            MachineInstr* NOP = BuildMI(*MBB, MI, MI->getDebugLoc(), VEXII->get(VEX::NOP));
            CurrentPacketMIs.push_back(NOP);
            endPacket(MBB, MI);
            
            SUnit* SUI = MIToSUnit[MI];
        
            for (std::map<SUnit *, unsigned>::iterator Inst = DataHazards.begin(),
                 E = DataHazards.end(); Inst != E; ++Inst) {
                SUnit* InstWithLatency = Inst->first;

                if (InstWithLatency->isSucc(SUI))
                    for (SDep dep : InstWithLatency->Succs)
                        if (dep.getSUnit() == SUI) {
                            if (dep.getKind() == SDep::Data) {
                                TrueDependence = true;
                            }
                        } else
                            continue;
            }
            
            AdvanceCycle();
            
        } while (TrueDependence);
    }
    
    TrueDependence = false;
    
    bool longImmediate = false;
    // Early Exit for Branches and Calls
    if(!(MI->isBranch() || MI->isCall()))
        for (unsigned i = 0, e = MI->getNumOperands(); i != e; ++i) {
            MachineOperand Op = MI->getOperand(i);
            longImmediate = (Op.isImm() && isLongImmediate(Op.getImm()))
                                || Op.isGlobal() || Op.isSymbol();
        
            if (longImmediate)
                break;
            else
                continue;
        }

    // Allocate Resource
    VLIWPacketizerList::addToPacket(MI);
    if (longImmediate) {
        if (canReserveResourcesForLongImmediate(MI)) {
            reserveResourcesForLongImmediate(MII);
        } else {
            endPacket(MBB, MI);
            VLIWPacketizerList::addToPacket(MI);
            reserveResourcesForLongImmediate(MI);
        }
        CurrentPacketMIs.push_back(MI);
    } else {
        CurrentPacketMIs.push_back(MI);
    }
    
    if (AddToHazardTable)
        DataHazards[MIToSUnit[MI]] = Latency-1;
    
    return MII;
}


// Needs to implement this so we can detect when a instruction
// has to be solo. This is normally true for inlineAsm, as well
// as EHLabel. Though
bool VEXPacketizerList::isSoloInstruction(MachineInstr *MI) {

    if (MI->getOpcode() == VEX::NOP)
        return true;
    
    if (MI->isInlineAsm()) {
        return true;
    }

    if (MI->isEHLabel()) {
        return true;
    }

    return false;
}

// ignorePseudoInstruction - Ignore bundling of pseudo instructions.
bool VEXPacketizerList::ignorePseudoInstruction(MachineInstr *MI,
                                                    MachineBasicBlock *MBB) {
    if (MI->isDebugValue())
        return true;
    
    // We must print out inline assembly
    if (MI->isInlineAsm())
        return false;
    
    // We check if MI has any functional units mapped to it.
    // If it doesn't, we ignore the instruction.
    const MCInstrDesc& TID = MI->getDesc();
    unsigned SchedClass = TID.getSchedClass();
    const InstrStage* IS =
    ResourceTracker->getInstrItins()->beginStage(SchedClass);
    unsigned FuncUnits = IS->getUnits();
    return !FuncUnits;
}

bool VEXPacketizerList::isLegalToPacketizeTogether(SUnit *SUI, SUnit *SUJ) {
    
   if (SUJ->isSucc(SUI)) {
        for (SDep dep : SUJ->Succs) {
            if (dep.getSUnit() == SUI) {
                if (dep.getKind() == SDep::Data) {
                    
                    unsigned idx = SUJ->getInstr()->getDesc().getSchedClass();
                    unsigned Latency = II->getStageLatency(idx);
                    
                    // We have a true dependence and we should not issue this
                    // instruction in the next cycle. We insert nops between them.
                    if (Latency > 1)
                        TrueDependence = true;
                    
                    return false;
                    
                } else if (dep.getKind() == SDep::Output)
                    return false;
            } else
                continue;
        }
    }
    
    if (SUJ->getInstr()->isCall() || SUJ->getInstr()->isBranch())
        return false;
    
    for (std::map<SUnit *, unsigned>::iterator Inst = DataHazards.begin(),
         E = DataHazards.end(); Inst != E; ++Inst) {
        SUnit* InstWithLatency = Inst->first;
        if (InstWithLatency->isSucc(SUI))
            for (SDep dep : InstWithLatency->Succs) {
                if (dep.getSUnit() == SUI) {
                    if (dep.getKind() == SDep::Data) {
                        TrueDependence = true;
                        return false;
                    }
                } else
                    continue;
            }
    }
    return true;    
}

void VEXPacketizerList::AdvanceCycle() {
    
    for (std::map<SUnit *, unsigned>::iterator Inst = DataHazards.begin(),
         E = DataHazards.end();
         Inst != E; ) {
        if (--Inst->second == 0)
            Inst = DataHazards.erase(Inst);
        else
            ++Inst;
    }
    return;
}

bool VEXPacketizer::runOnMachineFunction(MachineFunction &MF) {
    
    if (EnableVLIWScheduling)
        DEBUG(dbgs() << "VLIW Scheduling Enabled.\n");
    else
        return false;

    const TargetInstrInfo *TII = MF.getSubtarget().getInstrInfo();
    MachineLoopInfo &MLI = getAnalysis<MachineLoopInfo>();
    
    VEXPacketizerList Packetizer(MF, MLI);

    //
    // Loop over all basic blocks and remove KILL pseudo-instructions
    // These instructions confuse the dependence analysis. Consider:
    // D0 = ...   (Insn 0)
    // R0 = KILL R0, D0 (Insn 1)
    // R0 = ... (Insn 2)
    // Here, Insn 1 will result in the dependence graph not emitting an output
    // dependence between Insn 0 and Insn 2. This can lead to incorrect
    // packetization
    //
    for (MachineFunction::iterator MBB = MF.begin(), MBBe = MF.end();
         MBB != MBBe; ++MBB) {
        MachineBasicBlock::iterator End = MBB->end();
        MachineBasicBlock::iterator MI = MBB->begin();
        while (MI != End) {
            if (MI->isKill() || MI->isImplicitDef() || MI->isCFIInstruction()) {
                MachineBasicBlock::iterator DeleteMI = MI;
                ++MI;
                MBB->erase(DeleteMI);
                End = MBB->end();
                continue;
            }
            ++MI;
        }
    }

    //for (MachineFunction::iterator MBBI = MF.begin() , MBBE = MF.end(); MBBI != MBBE; ++MBBI)
    //    Packetizer.PacketizeMIs(MBBI.getNodePtrUnchecked(), MBBI->begin(), MBBI->end());

    // Loop over all of the basic blocks.
    for (MachineFunction::iterator MBB = MF.begin(), MBBe = MF.end();
         MBB != MBBe; ++MBB) {
        // Find scheduling regions and schedule / packetize each region.
        unsigned RemainingCount = MBB->size();
        for(MachineBasicBlock::iterator RegionEnd = MBB->end();
            RegionEnd != MBB->begin();) {
            // The next region starts above the previous region. Look backward in the
            // instruction stream until we find the nearest boundary.
            MachineBasicBlock::iterator I = RegionEnd;
            for(;I != MBB->begin(); --I, --RemainingCount) {
                if (TII->isSchedulingBoundary(std::prev(I), MBB, MF))
                break;
            }
            //currentMBB = MBB;
            
            I = MBB->begin();
            
            // Skip empty scheduling regions.
            if (I == RegionEnd) {
                RegionEnd = std::prev(RegionEnd);
                --RemainingCount;
                continue;
            }
            // Skip regions with one instruction.
            if (I == std::prev(RegionEnd)) {
                RegionEnd = std::prev(RegionEnd);
                continue;
            }

            Packetizer.PacketizeMIs(MBB, I, RegionEnd);
            RegionEnd = I;
        }
    }
    
    return true;
    
}


//===----------------------------------------------------------------------===//
//                         Public Constructor Functions
//===----------------------------------------------------------------------===//
FunctionPass *llvm::createVEXPacketizer(bool EnableVLIWScheduling) {
    return new VEXPacketizer(EnableVLIWScheduling);
}

char VEXPacketizer::ID = 0;
//static RegisterPass<VEXPacketizer> X("EnableVLIWScheduling", "Enable VLIW Scheduling");
