//===---------------        VEXDataReuseTracking.cpp        ---------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements a pass that keeps track on the reused data on the
// application.
//
//===----------------------------------------------------------------------===//

#include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/SmallPtrSet.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/ilist.h"
#include "llvm/ADT/ilist_node.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Dominators.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Operator.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/Pass.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineInstr.h"
#include "llvm/CodeGen/MachineMemOperand.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineLoopInfo.h"
//#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/ScalarEvolutionExpressions.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"
#include "VEXTargetMachine.h"

//#define GET_INSTRINFO_HEADER
//#include "VEXGenInstrInfo.inc"

#define DEBUG_TYPE "vex-datareuse"

using namespace llvm;

namespace llvm {
    MachineFunctionPass *createVEXDataReuseTrackingPostRegAlloc(VEXTargetMachine &TM);
    MachineFunctionPass *createVEXDataReuseTracking(VEXTargetMachine &TM);
}

namespace {
    
class VEXDataReuseTrackingPostRegAlloc: public MachineFunctionPass {
    
//    void getAnalysisUsage(AnalysisUsage &AU) const override;
//    AliasAnalysis *AA;
//    ScalarEvolution *SE;

    TargetMachine &TM;
    DataReuseInfo* DataInfo;

public:
    static char ID;
    VEXDataReuseTrackingPostRegAlloc(TargetMachine &TM)
    : MachineFunctionPass(ID), TM(TM) {
        const VEXSubtarget &Subtarget = *static_cast<const VEXTargetMachine &>(TM).getSubtargetImpl();
        const VEXInstrInfo *TII = static_cast<const VEXInstrInfo *>(Subtarget.getInstrInfo());

        DataInfo = static_cast<const VEXTargetMachine &>(TM).getDataReuseInfo();
    }
    
    const char *getPassName() const override {
        return "VEX Data Reuse Tracking Pos RegAlloc";
    }
    
    bool runOnMachineFunction(MachineFunction &MF) override;
    
};
}

//void VEXDataReuseTrackingPostRegAlloc::getAnalysisUsage(AnalysisUsage &AU) const {
//    AU.addRequired<AliasAnalysis>();
//    AU.addRequired<ScalarEvolution>();
//    AU.addPreserved<ScalarEvolution>();
//}

bool VEXDataReuseTrackingPostRegAlloc::runOnMachineFunction(MachineFunction &MF) {

    DEBUG(dbgs() << " Initiating VEXDataReuseTrackingPostRegAlloc Pass");

    DEBUG(dbgs() << "Size: " << DataInfo->getVariables().size() << "\n");
    for (DataReuseInfo::iterator VarIdx = DataInfo->begin(),
         VarEnd = DataInfo->end(); VarIdx != VarEnd; ++VarIdx) {
        std::vector<MachineBasicBlock::iterator> MIs = VarIdx->getMemoryInstructions();
        for(MachineBasicBlock::iterator MI : MIs)
            MI->dump();
    }

    DEBUG(dbgs() << " Finalizing VEXDataReuseTrackingPostRegAlloc Pass");
    return false;
}

char VEXDataReuseTrackingPostRegAlloc::ID = 0;
//static RegisterPass<VEXDataReuseTrackingPass> X("VEXDataReuseTracking", "Data Reuse Tracking Pass", false, false);

MachineFunctionPass *llvm::createVEXDataReuseTrackingPostRegAlloc(VEXTargetMachine &TM) {
    return new VEXDataReuseTrackingPostRegAlloc(TM);
}

//===----------------------------------------------------------------------===//
//
// This pass implements modifies Load and Store instructions to use SPMs.
//
//===----------------------------------------------------------------------===//

namespace {
class VEXDataReuseTracking: public MachineFunctionPass {

//    void getAnalysisUsage(AnalysisUsage &AU) const override;
//    AliasAnalysis *AA;
    TargetMachine &TM;
    DataReuseInfo* DataInfo;

    // This implements a trace that is need for each global variable
    // that should be replaced with SPM code.
    // Here, we will store all instructions that are need once we find
    // a new variable. We need this data structure in order to track
    // information about how the variable is incremented in a loop.
    // Such information will help retain information to construct the
    // SPMVariable object for that variable.
//    typedef std::deque<std::vector<MachineBasicBlock::iterator> > VariablesTraces;
//    typedef std::deque<std::vector<unsigned> > VariableTraces;
//    VariableTraces VarTraces;

    std::vector<unsigned> RegisterTrack;

    bool IsSPMVariable (MachineBasicBlock::iterator Inst,
                        StringRef& VariableName,
                        unsigned& DefinedRegister);

    bool PropagatesSPMVariable (MachineBasicBlock::iterator Inst,
                                StringRef &VariableName);

    void ReplaceMemoryInstruction (StringRef VariableName,
                                   MachineFunction::iterator& MBB,
                                   MachineBasicBlock::iterator& Inst);

   void  EvaluateVariableOffset(MachineBasicBlock::iterator Inst,
                                StringRef VariableName);

public:
    static char ID;
    VEXDataReuseTracking(TargetMachine &TM)
        : MachineFunctionPass(ID), TM(TM) {
        const VEXSubtarget &Subtarget = *static_cast<const VEXTargetMachine &>(TM).getSubtargetImpl();
        const VEXInstrInfo *TII = static_cast<const VEXInstrInfo *>(Subtarget.getInstrInfo());

        DataInfo = static_cast<const VEXTargetMachine &>(TM).getDataReuseInfo();

        RegisterTrack.resize(0);
//        VarTraces.resize()
    }

    const char *getPassName() const override {
        return "VEX Data Reuse Tracking Pass";
    }

    void getAnalysisUsage(AnalysisUsage &AU) const;

    bool runOnMachineFunction(MachineFunction &MF) override;

};

}

void VEXDataReuseTracking::getAnalysisUsage(AnalysisUsage &AU) const {
    AU.addRequired<AliasAnalysis>();
    AU.addRequired<MachineLoopInfo>();
    AU.addPreserved<MachineLoopInfo>();
    MachineFunctionPass::getAnalysisUsage(AU);
}

// This method checks if there is a Scratchpad Variable within the instruction.
// OperandIdx is where the SPMVariable Operand is and
// Virtual Register stores info about to which Virtual Register it will propagate the Variable.
// This is important because we may have multiple Loads and Stores that use the same Virtual Register
// at this point, therefore, we need to update information on lots of instructions.
bool VEXDataReuseTracking::IsSPMVariable(MachineBasicBlock::iterator Inst,
                                         StringRef& VariableName,
                                         unsigned& DefinedRegister) {

    for (unsigned i = 0, e = Inst->getNumOperands();
         i != e; ++i) {

         if (Inst->getOperand(i).isGlobal()) {
            const GlobalValue *GV = Inst->getOperand(i).getGlobal();

            DEBUG(errs() << GV->getName() << " is a Global Variable");
            if (GV->getName().startswith("spm_")) {
                DEBUG(errs() << " and should be stored in the SPM\n");
                assert(Inst->getOperand(0).isDef() && " It should be a register definition");
                VariableName = GV->getName();
                DefinedRegister = Inst->getOperand(0).getReg();
                return true;
            }
         }
    }
    return false;
}

bool VEXDataReuseTracking::PropagatesSPMVariable(MachineBasicBlock::iterator Inst,
                                                 StringRef &VariableName) {

    bool AnyPropagationFound = false;
    for (unsigned i = 0, e = Inst->getNumOperands();
         i != e; ++i) {

        // Fast Iteration
        if (!Inst->getOperand(i).isReg())
            continue;

        if (Inst->getOperand(i).isDef())
            continue;

        unsigned Operand = Inst->getOperand(i).getReg();
        bool inInstructionPropagationFound = false;

        for (DataReuseInfo::iterator VarIdx = DataInfo->begin(),
             VarEnd = DataInfo->end(); VarIdx != VarEnd; ++VarIdx) {

            std::vector<unsigned> Vector = VarIdx->getPropagationRegisters();

            for (unsigned i = 0, e = Vector.size();
                 i != e && !inInstructionPropagationFound; ++i) {

                if (Vector[i] == Operand) {
                    if (Inst->getOperand(0).isReg() &&
                        Inst->getOperand(0).isDef() &&
                        !Inst->mayLoad()) {
                        DEBUG(dbgs() << " Variable is Propagated through register " << Inst->getOperand(0).getReg() << "\n");
                        VarIdx->AddPropagationRegister(Inst->getOperand(0).getReg());
                    }
                    inInstructionPropagationFound  = true;
                    VariableName = VarIdx->getName();
                }
            }
        }
        AnyPropagationFound |= inInstructionPropagationFound;
    }
    if (AnyPropagationFound)
        return true;
    return false;
}

void VEXDataReuseTracking::
            ReplaceMemoryInstruction (StringRef VariableName,
                                      MachineFunction::iterator& MBB,
                                      MachineBasicBlock::iterator& Inst) {

    const VEXSubtarget &Subtarget = *static_cast<const VEXTargetMachine &>(TM).getSubtargetImpl();
    const VEXInstrInfo *TII = static_cast<const VEXInstrInfo *>(Subtarget.getInstrInfo());

    DEBUG(dbgs() << "Initialize Instruction Replacement \n");

    unsigned MemOpcode = 0;

    MachineBasicBlock::iterator newInstr;

    if (Inst->mayLoad()) {
        if (Inst->getOpcode() == VEX::LDW)
            MemOpcode = VEX::LDWSpm;
        else if (Inst->getOpcode() == VEX::LDH)
            MemOpcode = VEX::LDHSpm;
        else if (Inst->getOpcode() == VEX::LDB)
            MemOpcode = VEX::LDBSpm;
        else
            assert(false && " Wrong Opcode for Load Instruction.");

        MachineOperand DstReg = Inst->getOperand(0);
        MachineOperand FrameIndex = Inst->getOperand(1);
        MachineOperand MemOperand = Inst->getOperand(2);
        assert(DstReg.isReg() && "Operand must be Register");

        newInstr = BuildMI(*MBB, Inst, Inst->getDebugLoc(),
                                                       TII->get(MemOpcode),
                                                       DstReg.getReg()).addOperand(FrameIndex)
                                                                       .addOperand(MemOperand)
                                                                       .addMemOperand(*Inst->memoperands_begin());
        newInstr->dump();

        Inst->eraseFromParent();
        Inst = newInstr;
    } else {
        if (Inst->mayStore()) {
            if (Inst->getOpcode() == VEX::STW)
                MemOpcode = VEX::STWSpm;
            else if (Inst->getOpcode() == VEX::STH)
                MemOpcode = VEX::STHSpm;
            else if (Inst->getOpcode() == VEX::STB)
                MemOpcode = VEX::STBSpm;
            else
                assert(false && " Wrong Opcode for Store Instruction.");

            MachineOperand BaseReg = Inst->getOperand(0);
            MachineOperand FrameIndex = Inst->getOperand(1);
            MachineOperand MemOperand = Inst->getOperand(2);
            assert(BaseReg.isReg() && "Operand must be Register");

            newInstr =
                    BuildMI(*MBB, Inst, Inst->getDebugLoc(),
                            TII->get(MemOpcode)).addOperand(BaseReg)
                                                 .addOperand(FrameIndex)
                                                 .addOperand(MemOperand)
                                                 .addMemOperand(*Inst->memoperands_begin());
            newInstr->dump();
            Inst->eraseFromParent();
            Inst = newInstr;
        } else {
            assert(false && "Instruction should be a load or store.");
        }
    }

    DataInfo->AddMemInstRef(VariableName, newInstr);

    DEBUG(dbgs() << "Finished Instruction Replacement \n");

}

void VEXDataReuseTracking::EvaluateVariableOffset(MachineBasicBlock::iterator Inst,
                                                  StringRef VariableName) {

    MachineLoopInfo &MLI = getAnalysis<MachineLoopInfo>();

    // If the BB belongs to a Loop
    // We should check if different addresses are
    // accessed in the same basic block.
    // Record this info in order to know how many SPMs will
    // be used to store the data structure for the variable
    MachineLoop* loop = MLI.getLoopFor(Inst->getParent());
    if (loop) {
        DEBUG(dbgs() << "\n\nInstruction is Inside Loop\n\n");

        assert(DataInfo->FindVariable(VariableName) && " Variable not found.");
        MachineOperand MOReg = Inst->getOperand(1);
        MachineOperand MOImm = Inst->getOperand(2);

        assert (MOReg.isReg() && " MachineOperand should be Register");
        assert (MOImm.isImm() && " MachineOperand should be Immediate");

        DEBUG(dbgs() << "\tRegister: " << MOReg.getReg() << "\n");
        DEBUG(dbgs() << "\tOffset: " << MOImm.getImm() << "\n");
        DataInfo->AddOffset(VariableName, MOReg.getReg(), MOImm.getImm());
    }
}

bool VEXDataReuseTracking::runOnMachineFunction(MachineFunction &MF) {
//    AA = &getAnalysis<AliasAnalysis>();
    errs() << MF.getName() << "\n";

    const VEXSubtarget &Subtarget = *static_cast<const VEXTargetMachine &>(TM).getSubtargetImpl();
    const VEXInstrInfo *TII = static_cast<const VEXInstrInfo *>(Subtarget.getInstrInfo());

    for (MachineFunction::iterator MBB = MF.begin(),
         MBBE = MF.end(); MBBE != MBB; ++MBB) {

        for (MachineBasicBlock::iterator Inst = MBB->begin(),
             InstE = MBB->end(); Inst != InstE; ++Inst) {

            unsigned DefinedRegister;

            if (Inst->isBranch() || Inst->isCall())
                continue;
            DEBUG(dbgs() << "\n");
            Inst->dump();

            bool SPMFound = false;
            StringRef VariableName;
            if (IsSPMVariable(Inst, VariableName, DefinedRegister)) {
                // A SPM Variable was found
                // Initiate a new node
                // and sets Variable as first store when necessary
                SPMVariable Variable(VariableName, DefinedRegister, Inst->mayStore());
                DataInfo->AddVariable(Variable);
                DEBUG(dbgs() << "New Variable found in Register " << DefinedRegister << "\n");
                SPMFound = true;
            } else {
                DEBUG(dbgs() << " Variable not found \n");
            }


            // Checks whether the instruction propagates SPMVariable
            if(PropagatesSPMVariable(Inst, VariableName)) {
                // Replaces memory Instruction to SPM Instruction
                // when necessary
                if (Inst->mayLoadOrStore()) {
                    EvaluateVariableOffset(Inst, VariableName);
                    ReplaceMemoryInstruction(VariableName, MBB, Inst);
                }
            }
        }
        for (DataReuseInfo::iterator VarIdx = DataInfo->begin(),
             VarEnd = DataInfo->end(); VarIdx != VarEnd; ++VarIdx) {
            VarIdx->UpdateOffsetInfo();
        }
    }

    std::vector<SPMVariable> Variables = DataInfo->getVariables();
    for (auto Var : Variables)
        DEBUG(dbgs() << "Name:" << Var.getName() << "\tOffset: " << Var.getMaxOffsetPerBB() << "\n");
    return false;
}

char VEXDataReuseTracking::ID = 0;
//static RegisterPass<VEXDataReuseTracking> Y("VEXDataReuseTrackingPreRegAlloc", "Data Reuse Tracking PreRegAlloc Pass", false, false);

MachineFunctionPass *llvm::createVEXDataReuseTracking(VEXTargetMachine &TM) {
    return new VEXDataReuseTracking(TM);
}
