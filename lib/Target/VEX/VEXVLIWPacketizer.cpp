//===-- VEXPacketizer.cpp - VEX VLIW Packetizer     -------------------===//
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

#include "VEXInstrInfo.h"
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
    
public:
    VEXPacketizerList(MachineFunction &MF,
                      MachineLoopInfo &MLI)
                      : VLIWPacketizerList(MF, MLI, true) {}

    bool isSoloInstruction(MachineInstr *MI) override;
    bool ignorePseudoInstruction(MachineInstr *MI, MachineBasicBlock *MBB) override;
    bool isLegalToPacketizeTogether(SUnit *SUI, SUnit *SUJ) override;
    void initPacketizerState() override;
    MachineBasicBlock::iterator addToPacket(MachineInstr *MI);
    bool canReserveResourcesForLongImmediate (MachineBasicBlock::iterator MI,
                                              MachineOperand Op,
                                              bool &hasLongImmediate);
    void reserveResourcesForLongImmediate (MachineBasicBlock::iterator MI);
};

}

bool VEXPacketizerList::canReserveResourcesForLongImmediate (MachineBasicBlock::iterator MI,
                                                             MachineOperand Op,
                                                             bool &hasLongImmediate) {
    
    const VEXInstrInfo *QII = (const VEXInstrInfo *) TII;
    MachineFunction *MF = MI->getParent()->getParent();
    
    const int MAXIMUM_SHORTIMM = (1 << 8) - 1;
    const int MINIMUM_SHORTIMM = -(1 << 8);
    
    int Immediate = Op.getImm();
    
    if (Immediate >= MINIMUM_SHORTIMM &&
        Immediate <= MAXIMUM_SHORTIMM) {
        DEBUG(errs() << "Immediate fits in 9 bits, so we won't need to extend\n");
        return true;
    } else {
        hasLongImmediate = true;
        
        PseudoMI = MF->CreateMachineInstr(QII->get(VEX::EXTIMM),
                                          MI->getDebugLoc());
        
        if (ResourceTracker->canReserveResources(PseudoMI)) {
            MI->getParent()->getParent()->DeleteMachineInstr(PseudoMI);
            return true;
        } else {
            MI->getParent()->getParent()->DeleteMachineInstr(PseudoMI);
            return false;
            //llvm_unreachable("can not reserve resources for constant extender.");
        }
        DEBUG(errs() << "WARNING: Immediate does not fit in 9 bits.\n");
        return true;
    }
}

void VEXPacketizerList::reserveResourcesForLongImmediate (MachineBasicBlock::iterator MI) {

    const VEXInstrInfo *QII = (const VEXInstrInfo *) TII;
    MachineFunction *MF = MI->getParent()->getParent();
    
    PseudoMI = MF->CreateMachineInstr(QII->get(VEX::EXTIMM),
                                      MI->getDebugLoc());
    
    DEBUG(errs() << "Reserving Issue to Long Immediate");
    if (ResourceTracker->canReserveResources(PseudoMI)) {
        ResourceTracker->reserveResources(PseudoMI);
        MI->getParent()->getParent()->DeleteMachineInstr(PseudoMI);
    } else {
        llvm_unreachable("can not reserve resources for constant extender.");
    }
}

MachineBasicBlock::iterator VEXPacketizerList::addToPacket(MachineInstr *MI) {
    
    // Get MBB from Instruction
    MachineFunction::iterator MBB = MI->getParent();
    MachineBasicBlock::iterator MII = MI;
    
    bool canStillReserveResources = true;
    bool hasLongImmediate = false;
    for (unsigned i = 0, e = MI->getNumOperands(); i != e; ++i) {
        MachineOperand Op = MI->getOperand(i);
        
        if (Op.isImm() && !canReserveResourcesForLongImmediate(MII, Op, hasLongImmediate)) {
            canStillReserveResources = false;
            break;
        } else
            continue;
    }
    
    if (hasLongImmediate) {
        if (canStillReserveResources) {
            reserveResourcesForLongImmediate(MII);
        } else {
            endPacket(MBB, MI);
            VLIWPacketizerList::addToPacket(MI);
            reserveResourcesForLongImmediate(MI);
        }
        CurrentPacketMIs.push_back(MI);
    } else {
        CurrentPacketMIs.push_back(MI);
        ResourceTracker->reserveResources(MI);
        return MII;
    }
    return MII;
}


// Needs to implement this so we can detect when a instruction
// has to be solo. This is normally true for inlineAsm, as well
// as EHLabel. Though
bool VEXPacketizerList::isSoloInstruction(MachineInstr *MI) {

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
    
    // Uncomment this to generate single issue
    //return false;

    DEBUG(dbgs() << "Instruction Number:" << SUI->getInstr()->getOpcode() << "\n");
    
    if (SUJ->isSucc(SUI)) {
        for (SDep dep : SUJ->Succs) {
            if (dep.getSUnit() == SUI)
                if (dep.getKind() == SDep::Data)
                    return false;
            else
                continue;
        }
    }
    
    if (SUJ->getInstr()->isCall() || SUJ->getInstr()->isBranch())
        return false;
    return true;
}

void VEXPacketizerList::initPacketizerState() {
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
    DEBUG(errs() << "VLIW Scheduling Disabled.\n");
    return new VEXPacketizer(EnableVLIWScheduling);
}

char VEXPacketizer::ID = 0;
//static RegisterPass<VEXPacketizer> X("EnableVLIWScheduling", "Enable VLIW Scheduling");
