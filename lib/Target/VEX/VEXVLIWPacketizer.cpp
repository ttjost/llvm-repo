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
#include "VEXTargetMachine.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/DFAPacketizer.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineLoopInfo.h"
#include "llvm/CodeGen/MachineDominators.h"
#include "llvm/CodeGen/ScheduleDAG.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/Support/TargetRegistry.h"
#include "DataReuseInfo.h"

#define DEBUG_TYPE "vex-vliw-packetizer"

using namespace llvm;

cl::opt<bool> GenericBinary("generic-binary",
                            cl::Hidden, cl::desc("Enable Generic Binary"));


namespace llvm {
    FunctionPass *createVEXPacketizer(bool EnableVLIWScheduling, VEXTargetMachine &TM);
}

namespace {
class VEXPacketizer : public MachineFunctionPass {
    
    bool EnableVLIWScheduling;
    
    bool canResourceResourcesForLongImmediate(MachineInstr *MI);

    TargetMachine &TM;

public:
    static char ID;

    VEXPacketizer(TargetMachine &TM,
                  bool EnableVLIWScheduling) : MachineFunctionPass(ID),
                                               TM(TM),
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
    
    
    const VEXInstrInfo *VEXII;
    const VEXSubtarget* Subtarget;
    const InstrItineraryData *II;
    TargetMachine &TM;

    // Circular buffer for the allocation of SPMs,
    // such that we can store data more uniformly.
//    unsigned AllocationIndex;

//    std::map<unsigned, unsigned>

    // Methods to handle ScratchPads
    DataReuseInfo* DataInfo;
    std::vector<SPMVariable> Variables;

    bool isStoreSPM(MachineBasicBlock::iterator Inst);
    bool isLoadSPM(MachineBasicBlock::iterator Inst);
    bool isLoadSPM(unsigned Opcode);
    void analyzeSPMInstruction(MachineInstr *MI);
    void analyzeVariableConditions(MachineInstr *MI);

    unsigned FindVariable(MachineBasicBlock::iterator MI);
    unsigned FindVariableThroughDefinition(MachineBasicBlock::iterator MI);
    unsigned getSPMOpcode(unsigned Opcode, unsigned Lane);
    void ReplaceSPMInstruction(MachineInstr *MI);

public:
    VEXPacketizerList(TargetMachine &TM,
                      MachineFunction &MF,
                      MachineLoopInfo &MLI)
                      : TM(TM),
                        VLIWPacketizerList(MF, MLI, true) {
        VEXII = (const VEXInstrInfo *) TII;
        Subtarget = &MF.getSubtarget<VEXSubtarget>();
        II = static_cast<const VEXSubtarget *>(Subtarget)->getInstrItineraryData();
        DataHazards.clear();

        // Get Data Reuse Information used for Scratchpads
        DataInfo = static_cast<VEXTargetMachine &>(TM).getDataReuseInfo();
        DataInfo->setNumSPMs(II->SchedModel.IssueWidth);
        Variables = DataInfo->getVariables();

        DEBUG(dbgs() << " Initiating VLIWPacketizer Pass");

        DEBUG(dbgs() << "Size: " << DataInfo->getVariables().size() << "\n");
        for (DataReuseInfo::iterator VarIdx = DataInfo->begin(),
             VarEnd = DataInfo->end(); VarIdx != VarEnd; ++VarIdx) {
            std::vector<MachineBasicBlock::iterator> MIs = VarIdx->getMemoryInstructions();
            for(MachineBasicBlock::iterator MI : MIs)
                MI->dump();
        }

        DEBUG(dbgs() << " Finalizing VLIWPacketizer Pass");
    }

    bool isSoloInstruction(MachineInstr *MI) override;
    bool ignorePseudoInstruction(MachineInstr *MI, MachineBasicBlock *MBB) override;
    bool isLegalToPacketizeTogether(SUnit *SUI, SUnit *SUJ) override;
    void AdvanceCycle();
    MachineBasicBlock::iterator addToPacket(MachineInstr *MI) override;
    
    bool canReserveResourcesForLongImmediate (MachineBasicBlock::iterator MI);
    void reserveResourcesForLongImmediate (MachineBasicBlock::iterator MI);
    bool isLongImmediate(int64_t Immediate);

    void clearHazardTable();
};

}

// Returns true if this is a StoreSPM instruction
bool VEXPacketizerList::isStoreSPM(MachineBasicBlock::iterator Inst) {

    if (Inst->getOpcode() == VEX::STWSpm ||
        Inst->getOpcode() == VEX::STHSpm ||
        Inst->getOpcode() == VEX::STBSpm)
        return true;
    else
        return false;
}

// Returns true if this is a LoadSPM instruction
bool VEXPacketizerList::isLoadSPM(MachineBasicBlock::iterator Inst) {

    if (Inst->getOpcode() == VEX::LDWSpm ||
        Inst->getOpcode() == VEX::LDHSpm ||
        Inst->getOpcode() == VEX::LDHUSpm ||
        Inst->getOpcode() == VEX::LDBSpm ||
        Inst->getOpcode() == VEX::LDBUSpm)
        return true;
    else
        return false;
}

// Returns true if this is a LoadSPM instruction (Another Version)
bool VEXPacketizerList::isLoadSPM(unsigned Opcode) {

    if (Opcode == VEX::LDWSpm ||
        Opcode == VEX::LDHSpm ||
        Opcode == VEX::LDHUSpm ||
        Opcode == VEX::LDBSpm ||
        Opcode == VEX::LDBUSpm)
        return true;
    else
        return false;
}

// Replaces Not-laned Opcode with a reference to the proper lane scheduled to.
unsigned VEXPacketizerList::getSPMOpcode(unsigned Opcode, unsigned Lane) {

    unsigned NewOpcode;
    bool isLoad = isLoadSPM(Opcode);
    switch(Lane) {
        case 0:
            if (isLoad) {
                if (Opcode == VEX::LDWSpm)
                    NewOpcode = VEX::LDW0;
                else if (Opcode == VEX::LDHSpm)
                    NewOpcode = VEX::LDH0;
                else if (Opcode == VEX::LDHUSpm)
                    NewOpcode = VEX::LDHU0;
                else if (Opcode == VEX::LDBSpm)
                    NewOpcode = VEX::LDB0;
                else
                    NewOpcode = VEX::LDBU0;
            } else {
                if (Opcode == VEX::STWSpm)
                    NewOpcode = VEX::STW0;
                else if (Opcode == VEX::STHSpm)
                    NewOpcode = VEX::STH0;
                else
                    NewOpcode = VEX::STB0;
            }
            break;
        case 1:
            if (isLoad) {
                if (Opcode == VEX::LDWSpm)
                    NewOpcode = VEX::LDW1;
                else if (Opcode == VEX::LDHSpm)
                    NewOpcode = VEX::LDH1;
                else if (Opcode == VEX::LDHUSpm)
                    NewOpcode = VEX::LDHU1;
                else if (Opcode == VEX::LDBSpm)
                    NewOpcode = VEX::LDB1;
                else
                    //    bool isDefinitionSPMVariable(MachineBasicBlock::iterator Inst);
                    NewOpcode = VEX::LDBU1;
            } else {
                if (Opcode == VEX::STWSpm)
                    NewOpcode = VEX::STW1;
                else if (Opcode == VEX::STHSpm)
                    NewOpcode = VEX::STH1;
                else
                    NewOpcode = VEX::STB1;
            }
            break;
        case 2:
            if (isLoad) {
                if (Opcode == VEX::LDWSpm)
                    NewOpcode = VEX::LDW2;
                else if (Opcode == VEX::LDHSpm)
                    NewOpcode = VEX::LDH2;
                else if (Opcode == VEX::LDHUSpm)
                    NewOpcode = VEX::LDHU2;
                else if (Opcode == VEX::LDBSpm)
                    NewOpcode = VEX::LDB2;
                else
                    NewOpcode = VEX::LDBU2;
            } else {
                if (Opcode == VEX::STWSpm)
                    NewOpcode = VEX::STW2;
                else if (Opcode == VEX::STHSpm)
                    NewOpcode = VEX::STH2;
                else
                    NewOpcode = VEX::STB2;
            }
            break;
        case 3:
            if (isLoad) {
                if (Opcode == VEX::LDWSpm)
                    NewOpcode = VEX::LDW3;
                else if (Opcode == VEX::LDHSpm)
                    NewOpcode = VEX::LDH3;
                else if (Opcode == VEX::LDHUSpm)
                    NewOpcode = VEX::LDHU3;
                else if (Opcode == VEX::LDBSpm)
                    NewOpcode = VEX::LDB3;
                else
                    NewOpcode = VEX::LDBU3;
            } else {
                if (Opcode == VEX::STWSpm)
                    NewOpcode = VEX::STW3;
                else if (Opcode == VEX::STHSpm)
                    NewOpcode = VEX::STH3;
                else
                    NewOpcode = VEX::STB3;
            }
            break;
        case 4:
            if (isLoad) {
                if (Opcode == VEX::LDWSpm)
                    NewOpcode = VEX::LDW4;
                else if (Opcode == VEX::LDHSpm)
                    NewOpcode = VEX::LDH4;
                else if (Opcode == VEX::LDHUSpm)
                    NewOpcode = VEX::LDHU4;
                else if (Opcode == VEX::LDBSpm)
                    NewOpcode = VEX::LDB4;
                else
                    NewOpcode = VEX::LDBU4;
            } else {
                if (Opcode == VEX::STWSpm)
                    NewOpcode = VEX::STW4;
                else if (Opcode == VEX::STHSpm)
                    NewOpcode = VEX::STH4;
                else
                    NewOpcode = VEX::STB4;
            }
            break;
        case 5:
            if (isLoad) {
                if (Opcode == VEX::LDWSpm)
                    NewOpcode = VEX::LDW5;
                else if (Opcode == VEX::LDHSpm)
                    NewOpcode = VEX::LDH5;
                else if (Opcode == VEX::LDHUSpm)
                    NewOpcode = VEX::LDHU5;
                else if (Opcode == VEX::LDBSpm)
                    NewOpcode = VEX::LDB5;
                else
                    NewOpcode = VEX::LDBU5;
            } else {
                if (Opcode == VEX::STWSpm)
                    NewOpcode = VEX::STW5;
                else if (Opcode == VEX::STHSpm)
                    NewOpcode = VEX::STH5;
                else
                    NewOpcode = VEX::STB5;
            }
            break;
        case 6:
            if (isLoad) {
                if (Opcode == VEX::LDWSpm)
                    NewOpcode = VEX::LDW6;
                else if (Opcode == VEX::LDHSpm)
                    NewOpcode = VEX::LDH6;
                else if (Opcode == VEX::LDHUSpm)
                    NewOpcode = VEX::LDHU6;
                else if (Opcode == VEX::LDBSpm)
                    NewOpcode = VEX::LDB6;
                else
                    NewOpcode = VEX::LDBU6;
            } else {
                if (Opcode == VEX::STWSpm)
                    NewOpcode = VEX::STW6;
                else if (Opcode == VEX::STHSpm)
                    NewOpcode = VEX::STH6;
                else
                    NewOpcode = VEX::STB6;
            }
            break;
        case 7:
            if (isLoad) {
                if (Opcode == VEX::LDWSpm)
                    NewOpcode = VEX::LDW7;
                else if (Opcode == VEX::LDHSpm)
                    NewOpcode = VEX::LDH7;
                else if (Opcode == VEX::LDHUSpm)
                    NewOpcode = VEX::LDHU7;
                else if (Opcode == VEX::LDBSpm)
                    NewOpcode = VEX::LDB7;
                else
                    NewOpcode = VEX::LDBU7;
            } else {
                if (Opcode == VEX::STWSpm)
                    NewOpcode = VEX::STW7;
                else if (Opcode == VEX::STHSpm)
                    NewOpcode = VEX::STH7;
                else
                    NewOpcode = VEX::STB7;
            }
            break;
        default:
            llvm_unreachable("Wrong Lane!");
            break;
    }
    return NewOpcode;
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

unsigned VEXPacketizerList::FindVariable(MachineBasicBlock::iterator MI) {

    for (unsigned i = 0, e = Variables.size(); i != e; ++i) {
        std::vector<MachineBasicBlock::iterator> Insts = Variables[i].getMemoryInstructions();

        for (unsigned j = 0, endj = Insts.size(); j != endj; ++j) {
            if (Insts[j] == MI) {
                return i;
            }
        }
    }
    return -1;
}

unsigned VEXPacketizerList::FindVariableThroughDefinition(MachineBasicBlock::iterator MI) {

    for (unsigned i = 0, e = Variables.size(); i != e; ++i) {
        Variables[i].isDefinitionInstruction(MI);
                return i;
    }
    return -1;
}


void VEXPacketizerList::analyzeVariableConditions(MachineInstr *MI) {

    unsigned VariablePosition;
    if ((VariablePosition = FindVariableThroughDefinition(MI)) < 0)
        llvm_unreachable("Error finding variable.");

    SPMVariable &Var = Variables[VariablePosition];




}

void VEXPacketizerList::analyzeSPMInstruction(MachineInstr *MI) {

    unsigned VariablePosition;
    if ((VariablePosition = FindVariable(MI)) < 0)
        llvm_unreachable("Error finding variable.");

    SPMVariable &Var = Variables[VariablePosition];

    DEBUG(dbgs() << "Variable Name is: " <<  Var.getName() << "\n");

    unsigned IssueWidth = II->SchedModel.IssueWidth;

    DEBUG(dbgs() << " We may use: ");

    std::vector<unsigned> SPMs;
    if (Var.isNotAllocated()) {
//        SPMs = getAllocationPriorityForSPMs(Var.getMaximumSPMs(IssueWidth));
        Var.setMemoryUnits(SPMs);
        for (unsigned i : SPMs)
          DEBUG(dbgs() << "SPM " << i << "\n");
    } /*else {
        unsigned MemUnit = Var.getMemoryUnit();
        DEBUG(dbgs() << MemUnit << "\n");
        DEBUG(dbgs() << "SPM was already allocated " << Var.getMemoryUnit() << "\n");
    }*/

    unsigned MemUnit = Var.getMemoryUnit();
    DEBUG(dbgs() << MemUnit << "\n");

}

void VEXPacketizerList::ReplaceSPMInstruction(MachineInstr *MI) {

    unsigned VariablePosition;
    if ((VariablePosition = FindVariable(MI)) < 0)
        llvm_unreachable("Error finding variable.");

    SPMVariable &Var = Variables[VariablePosition];



}


// This function is extremely important when Packetizing Instructions
// First, we need to check if we should insert Bubbles (NoOps Instructions)
// Multiple Noops might be necessary, in case we have high-latency instructions
// and No other instruction can be issued in that cycle.
// Also, here we check if we can packetize instructions with long immediates
// in the Current Bundle. If not, end packet and start a new one.
MachineBasicBlock::iterator VEXPacketizerList::addToPacket(MachineInstr *MI) {
    
    // Get MBB from Instruction
    MachineFunction::iterator MBB = MI->getParent();
    MachineBasicBlock::iterator MII = MI;
    
    unsigned idx = MI->getDesc().getSchedClass();
    unsigned Latency = II->getStageLatency(idx);
    
    bool AddToHazardTable = false;
    
    if (Latency > 1) {
        DEBUG(errs() <<  "Latency is: " << Latency <<  "\n");
        assert(!(isStoreSPM(MI) || isLoadSPM(MI)) && "Cannot handle latencies greater than 1 for SPM Instructions just yet.");
        AddToHazardTable = true;
    }
    
    // We should Advance Cycle only when a new packet is created
    // Note that this only means we should update the Latencies
    if (CurrentPacketMIs.size() == 0)
        AdvanceCycle();
    
    // We need to insert a NOP Here.
    // If we have multiple nops, we will insert them using this loop
    bool Dependence;
    do {
        Dependence = false;

        SUnit* SUI = MIToSUnit[MI];
        for (std::map<SUnit *, unsigned>::iterator Inst = DataHazards.begin(),
             E = DataHazards.end(); Inst != E; ++Inst) {
             SUnit* InstWithLatency = Inst->first;
            //InstWithLatency->getInstr()->dump();
            if (InstWithLatency->isSucc(SUI))
                for (SDep dep : InstWithLatency->Succs)
                    if (dep.getSUnit() == SUI) {
                        if (dep.getKind() == SDep::Data) {
                            Dependence = true;
                        }
                    } else
                        continue;
        }
        if (Dependence) {
            MachineBasicBlock *MBB = MI->getParent();
            MachineInstr* NOP = BuildMI(*MBB, MI, MI->getDebugLoc(), VEXII->get(VEX::NOP));
            CurrentPacketMIs.push_back(NOP);
            endPacket(MBB, MI);
            AdvanceCycle();
        }
    } while (Dependence);
    
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


    // TODO: Will Variable Definition always be like this?
    // Probably not when we have function calls.
    if (MI->getOpcode() != VEX::MOVi)
        analyzeVariableConditions(MI);

    // Handles SPM Instructions
    if (isStoreSPM(MI) || isLoadSPM(MI)) {
        analyzeSPMInstruction(MI);
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
        DataHazards[MIToSUnit[MI]] = Latency;
    
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
    
    // Fast escape for Calls.
    // We can always Packetize Calls with the earlier instruction
//    if (SUI->getInstr()->isCall())
//        return true;
    
    if (SUJ->isSucc(SUI)) {
        for (SDep dep : SUJ->Succs) {
            if (dep.getSUnit() == SUI) {
                if (dep.getKind() == SDep::Data) {
                    return false;
                    
                } else if (dep.getKind() == SDep::Output) {
                    return false;
                } else if (GenericBinary && dep.getKind() == SDep::Anti) {
                    return false;
                }
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
                        return false;
                    }
                } else
                    continue;
            }
    }
    return true;    
}

void VEXPacketizerList::AdvanceCycle() {
    
    for (std::map<SUnit *, unsigned>::iterator Inst = DataHazards.begin();
         Inst != DataHazards.end(); ) {
        std::map<SUnit *, unsigned>::iterator thisInst = Inst++;
        if (--thisInst->second == 0)
            Inst = DataHazards.erase(thisInst);
    }
    return;
}

void VEXPacketizerList::clearHazardTable() {
    DataHazards.clear();
}

bool VEXPacketizer::runOnMachineFunction(MachineFunction &MF) {
    
    if (EnableVLIWScheduling)
        DEBUG(dbgs() << "VLIW Scheduling Enabled.\n");
    else
        return false;

    const TargetInstrInfo *TII = MF.getSubtarget().getInstrInfo();
    MachineLoopInfo &MLI = getAnalysis<MachineLoopInfo>();
    
    VEXPacketizerList Packetizer(TM, MF, MLI);

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
            
            Packetizer.clearHazardTable();

            Packetizer.PacketizeMIs(MBB, I, RegionEnd);
            RegionEnd = I;
        }
    }
    return true;
    
}


//===----------------------------------------------------------------------===//
//                         Public Constructor Functions
//===----------------------------------------------------------------------===//
FunctionPass *llvm::createVEXPacketizer(bool EnableVLIWScheduling, VEXTargetMachine &TM) {
    return new VEXPacketizer(TM, EnableVLIWScheduling);
}

char VEXPacketizer::ID = 0;
//static RegisterPass<VEXPacketizer> X("EnableVLIWScheduling", "Enable VLIW Scheduling");
