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
#include "llvm/CodeGen/MachineRegisterInfo.h"
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
        const InstrItineraryData *II = Subtarget.getInstrItineraryData();

        DataInfo = static_cast<const VEXTargetMachine &>(TM).getDataReuseInfo();
        DataInfo->setNumSPMs(II->SchedModel.IssueWidth);
        DataInfo->setIssueWidth(II->SchedModel.IssueWidth);
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
//        std::vector<MachineBasicBlock::iterator> MIs = VarIdx->getMemoryInstructions();
//        for(MachineBasicBlock::iterator MI : MIs)
//            MI->dump();
    }

    DEBUG(dbgs() << " Finalizing VEXDataReuseTrackingPostRegAlloc Pass\n");
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

    unsigned getInstructionOffset (MachineBasicBlock::iterator& Inst);

    void analyzeMemoryInstruction (MachineBasicBlock::iterator& Inst,
                                   unsigned Lane, unsigned Offset);

   void  EvaluateVariableOffset(MachineBasicBlock::iterator Inst,
                                StringRef VariableName);

   void analyzeVariableDefinitionInstruction(MachineInstr *MI,
                                             unsigned Offset);

   unsigned getInstructionDataType(MachineBasicBlock::iterator Inst);

   unsigned getSPMOpcode(unsigned Opcode, unsigned Lane, bool isLoad);

   void InsertPreamble(MachineFunction &MF, SPMVariable Variable);

   unsigned getLoadOpcode(unsigned DataType);
   unsigned getSPMStoreOpcode(unsigned Lane, unsigned DataType);

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

unsigned VEXDataReuseTracking::getLoadOpcode(unsigned DataType) {

    if (DataType == SPMVariable::MDFull)
        return VEX::LDW;
    else if (DataType == SPMVariable::MDByte)
        return VEX::LDB;
    else if (DataType == SPMVariable::MDByteU)
        return VEX::LDBU;
    else if (DataType == SPMVariable::MDHalf)
        return VEX::LDH;
    else if (SPMVariable::MDHalfU)
        return VEX::LDHU;

    llvm_unreachable("Wrong instruction for Load or Store");
}

// IMPORTANT:
// Look the way we are Returning the Opcode.
// Since the Instruction Opcodes are defined all together,
// we can use addition to reach other Lanes, starting at Lane0
unsigned VEXDataReuseTracking::getSPMStoreOpcode(unsigned Lane, unsigned DataType) {

    if (DataType == SPMVariable::MDFull)
        return VEX::LDW0+Lane;
    else if (DataType == SPMVariable::MDByte)
        return VEX::LDB0+Lane;
    else if (DataType == SPMVariable::MDByteU)
        return VEX::LDBU0+Lane;
    else if (DataType == SPMVariable::MDHalf)
        return VEX::LDH0+Lane;
    else if (SPMVariable::MDHalfU)
        return VEX::LDHU0+Lane;

    llvm_unreachable("Wrong instruction for Load or Store");
}

unsigned VEXDataReuseTracking::getInstructionDataType(MachineBasicBlock::iterator Inst) {

    assert(Inst->mayLoadOrStore() && "Instruction should be a load or store");

    if (Inst->getOpcode() == VEX::LDW ||
        Inst->getOpcode() == VEX::STW)
        return SPMVariable::MDFull;
    else if (Inst->getOpcode() == VEX::LDB ||
             Inst->getOpcode() == VEX::STB)
        return SPMVariable::MDByte;
    else if (Inst->getOpcode() == VEX::LDBU)
        return SPMVariable::MDByteU;
    else if (Inst->getOpcode() == VEX::LDH ||
             Inst->getOpcode() == VEX::STH)
        return SPMVariable::MDHalf;
    else if (Inst->getOpcode() == VEX::LDHU)
        return SPMVariable::MDHalfU;

    llvm_unreachable("Wrong instruction for Load or Store");
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

//            DEBUG(errs() << GV->getName() << " is a Global Variable");
            if (GV->getName().startswith("spm_")) {
//                DEBUG(errs() << " and should be stored in the SPM\n");
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
//                        DEBUG(dbgs() << " Variable is Propagated through register " << Inst->getOperand(0).getReg() << "\n");
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

// Replaces Not-laned Opcode with a reference to the proper lane scheduled to.
unsigned VEXDataReuseTracking::getSPMOpcode(unsigned Opcode, unsigned Lane, bool isLoad) {

    unsigned NewOpcode;
    switch(Lane) {
        case 0:
            if (isLoad) {
                if (Opcode == VEX::LDW)
                    NewOpcode = VEX::LDW0;
                else if (Opcode == VEX::LDH)
                    NewOpcode = VEX::LDH0;
                else if (Opcode == VEX::LDHU)
                    NewOpcode = VEX::LDHU0;
                else if (Opcode == VEX::LDB)
                    NewOpcode = VEX::LDB0;
                else
                    NewOpcode = VEX::LDBU0;
            } else {
                if (Opcode == VEX::STW)
                    NewOpcode = VEX::STW0;
                else if (Opcode == VEX::STH)
                    NewOpcode = VEX::STH0;
                else
                    NewOpcode = VEX::STB0;
            }
            break;
        case 1:
            if (isLoad) {
                if (Opcode == VEX::LDW)
                    NewOpcode = VEX::LDW1;
                else if (Opcode == VEX::LDH)
                    NewOpcode = VEX::LDH1;
                else if (Opcode == VEX::LDHU)
                    NewOpcode = VEX::LDHU1;
                else if (Opcode == VEX::LDB)
                    NewOpcode = VEX::LDB1;
                else
                    //    bool isDefinitionVariable(MachineBasicBlock::iterator Inst);
                    NewOpcode = VEX::LDBU1;
            } else {
                if (Opcode == VEX::STW)
                    NewOpcode = VEX::STW1;
                else if (Opcode == VEX::STH)
                    NewOpcode = VEX::STH1;
                else
                    NewOpcode = VEX::STB1;
            }
            break;
        case 2:
            if (isLoad) {
                if (Opcode == VEX::LDW)
                    NewOpcode = VEX::LDW2;
                else if (Opcode == VEX::LDH)
                    NewOpcode = VEX::LDH2;
                else if (Opcode == VEX::LDHU)
                    NewOpcode = VEX::LDHU2;
                else if (Opcode == VEX::LDB)
                    NewOpcode = VEX::LDB2;
                else
                    NewOpcode = VEX::LDBU2;
            } else {
                if (Opcode == VEX::STW)
                    NewOpcode = VEX::STW2;
                else if (Opcode == VEX::STH)
                    NewOpcode = VEX::STH2;
                else
                    NewOpcode = VEX::STB2;
            }
            break;
        case 3:
            if (isLoad) {
                if (Opcode == VEX::LDW)
                    NewOpcode = VEX::LDW3;
                else if (Opcode == VEX::LDH)
                    NewOpcode = VEX::LDH3;
                else if (Opcode == VEX::LDHU)
                    NewOpcode = VEX::LDHU3;
                else if (Opcode == VEX::LDB)
                    NewOpcode = VEX::LDB3;
                else
                    NewOpcode = VEX::LDBU3;
            } else {
                if (Opcode == VEX::STW)
                    NewOpcode = VEX::STW3;
                else if (Opcode == VEX::STH)
                    NewOpcode = VEX::STH3;
                else
                    NewOpcode = VEX::STB3;
            }
            break;
        case 4:
            if (isLoad) {
                if (Opcode == VEX::LDW)
                    NewOpcode = VEX::LDW4;
                else if (Opcode == VEX::LDH)
                    NewOpcode = VEX::LDH4;
                else if (Opcode == VEX::LDHU)
                    NewOpcode = VEX::LDHU4;
                else if (Opcode == VEX::LDB)
                    NewOpcode = VEX::LDB4;
                else
                    NewOpcode = VEX::LDBU4;
            } else {
                if (Opcode == VEX::STW)
                    NewOpcode = VEX::STW4;
                else if (Opcode == VEX::STH)
                    NewOpcode = VEX::STH4;
                else
                    NewOpcode = VEX::STB4;
            }
            break;
        case 5:
            if (isLoad) {
                if (Opcode == VEX::LDW)
                    NewOpcode = VEX::LDW5;
                else if (Opcode == VEX::LDH)
                    NewOpcode = VEX::LDH5;
                else if (Opcode == VEX::LDHU)
                    NewOpcode = VEX::LDHU5;
                else if (Opcode == VEX::LDB)
                    NewOpcode = VEX::LDB5;
                else
                    NewOpcode = VEX::LDBU5;
            } else {
                if (Opcode == VEX::STW)
                    NewOpcode = VEX::STW5;
                else if (Opcode == VEX::STH)
                    NewOpcode = VEX::STH5;
                else
                    NewOpcode = VEX::STB5;
            }
            break;
        case 6:
            if (isLoad) {
                if (Opcode == VEX::LDW)
                    NewOpcode = VEX::LDW6;
                else if (Opcode == VEX::LDH)
                    NewOpcode = VEX::LDH6;
                else if (Opcode == VEX::LDHU)
                    NewOpcode = VEX::LDHU6;
                else if (Opcode == VEX::LDB)
                    NewOpcode = VEX::LDB6;
                else
                    NewOpcode = VEX::LDBU6;
            } else {
                if (Opcode == VEX::STW)
                    NewOpcode = VEX::STW6;
                else if (Opcode == VEX::STH)
                    NewOpcode = VEX::STH6;
                else
                    NewOpcode = VEX::STB6;
            }
            break;
        case 7:
            if (isLoad) {
                if (Opcode == VEX::LDW)
                    NewOpcode = VEX::LDW7;
                else if (Opcode == VEX::LDH)
                    NewOpcode = VEX::LDH7;
                else if (Opcode == VEX::LDHU)
                    NewOpcode = VEX::LDHU7;
                else if (Opcode == VEX::LDB)
                    NewOpcode = VEX::LDB7;
                else
                    NewOpcode = VEX::LDBU7;
            } else {
                if (Opcode == VEX::STW)
                    NewOpcode = VEX::STW7;
                else if (Opcode == VEX::STH)
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

void VEXDataReuseTracking::
            analyzeMemoryInstruction (MachineBasicBlock::iterator& Inst,
                                      unsigned Lane, unsigned Offset) {

    const VEXSubtarget &Subtarget = *static_cast<const VEXTargetMachine &>(TM).getSubtargetImpl();
    const VEXInstrInfo *TII = static_cast<const VEXInstrInfo *>(Subtarget.getInstrInfo());

    DEBUG(dbgs() << "Initialize Instruction Replacement \n");

    unsigned MemOpcode = 0;

    MachineBasicBlock *MBB =  Inst->getParent();
    MachineBasicBlock::iterator newInstr;

    assert(Inst->mayLoadOrStore() && "Instruction is neither Load nor Store");

    MemOpcode = getSPMOpcode(Inst->getOpcode(), Lane, Inst->mayLoad());

    if (Inst->mayLoad()) {

        MachineOperand DstReg = Inst->getOperand(0);
        MachineOperand FrameIndex = Inst->getOperand(1);
        MachineOperand MemOperand = Inst->getOperand(2);
        assert(DstReg.isReg() && "Operand must be Register");

        newInstr = BuildMI(*MBB, Inst, Inst->getDebugLoc(),
                                                       TII->get(MemOpcode),
                                                       DstReg.getReg()).addOperand(FrameIndex)
                                                                       .addOperand(MemOperand)
                                                                       .addMemOperand(*Inst->memoperands_begin());
//        newInstr->dump();

        Inst->eraseFromParent();
        Inst = newInstr;
    } else {
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
//            newInstr->dump();
            Inst->eraseFromParent();
            Inst = newInstr;
        }
    DEBUG(dbgs() << "Finished Instruction Replacement \n");

}

void VEXDataReuseTracking::analyzeVariableDefinitionInstruction(MachineInstr *MI, unsigned Offset) {

    DEBUG(dbgs() << "Update offset for Scratchpad Variable\n");

    MachineOperand Op = MI->getOperand(1);
    assert(Op.isGlobal() && "Must be a Global Address");
    Op.ChangeToImmediate(Offset);
    MI->RemoveOperand(1);
    MI->addOperand(Op);
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
//        DEBUG(dbgs() << "\n\nInstruction is Inside Loop\n\n");

        assert(DataInfo->FindVariable(VariableName) && " Variable not found.");
        MachineOperand MOReg = Inst->getOperand(1);
        MachineOperand MOImm = Inst->getOperand(2);

        assert (MOReg.isReg() && " MachineOperand should be Register");
        assert (MOImm.isImm() && " MachineOperand should be Immediate");

//        DEBUG(dbgs() << "\tRegister: " << MOReg.getReg() << "\n");
//        DEBUG(dbgs() << "\tOffset: " << MOImm.getImm() << "\n");
        DataInfo->AddOffset(VariableName, MOReg.getReg(), MOImm.getImm());
    }
}

void VEXDataReuseTracking::InsertPreamble(MachineFunction &MF, SPMVariable Variable) {

    MachineBasicBlock::iterator DefInstr = Variable.getFirstDefinition();

    assert(DefInstr->getOperand(0).isDef() && "First Operand should be a Definition. Something is wrong");

    const VEXSubtarget &Subtarget = *static_cast<const VEXTargetMachine &>(TM).getSubtargetImpl();
    const VEXInstrInfo *TII = static_cast<const VEXInstrInfo *>(Subtarget.getInstrInfo());

    MachineBasicBlock *MBB = DefInstr->getParent();
    MachineBasicBlock *PreambleMBB = MF.CreateMachineBasicBlock(MBB->getBasicBlock());

//    MF.insert(std::next(MachineFunction::iterator(MBB)), PreambleMBB);

    MachineRegisterInfo &RegInfo = MF.getRegInfo();
    const TargetRegisterClass *GPRegClass = &VEX::GPRegsRegClass;
    const TargetRegisterClass *BrRegClass = &VEX::BrRegsRegClass;

     // Create VReg for induction variable
    unsigned InductionReg = RegInfo.createVirtualRegister(GPRegClass);
    BuildMI(*MBB, DefInstr,
            DefInstr->getDebugLoc(),
            TII->get(VEX::MOVi),
            InductionReg).addImm(0);

    // Iniatiate building the BB which will Load from Memory and
    // Store data to SPMs.
//    BuildMI(PreambleMBB, DebugLoc(), TII->get(VEX::LDW))
    // TODO: How do we calculate this?
    unsigned NumIterations = 16;

    DEBUG(dbgs() << "Starting Preamble Insertion \n");
    for (MachineBasicBlock::iterator Inst = PreambleMBB->begin(),
         InstE = PreambleMBB->end(); Inst != InstE; ++Inst) {
        Inst->dump();
    }
    DEBUG(dbgs() << "Ending Preamble Insertion \n");
}

bool VEXDataReuseTracking::runOnMachineFunction(MachineFunction &MF) {
    errs() << MF.getName() << "\n";

    for (MachineFunction::iterator MBB = MF.begin(),
         MBBE = MF.end(); MBBE != MBB; ++MBB) {

        for (MachineBasicBlock::iterator Inst = MBB->begin(),
             InstE = MBB->end(); Inst != InstE; ++Inst) {

            unsigned DefinedRegister;

            if (Inst->isBranch() || Inst->isCall())
                continue;

            bool SPMFound = false;
            StringRef VariableName;
            if (IsSPMVariable(Inst, VariableName, DefinedRegister)) {
                // A SPM Variable was found
                // Initiate a new node
                // and sets Variable as first store when necessary
                SPMVariable Variable(VariableName, DefinedRegister, Inst);
                DataInfo->AddVariable(Variable);
//                DEBUG(dbgs() << "New Variable found in Register " << DefinedRegister << "\n");
                SPMFound = true;
            }

            // Checks whether the instruction propagates SPMVariable
            if(PropagatesSPMVariable(Inst, VariableName)) {
                // Replaces memory Instruction to SPM Instruction
                // when necessary
                if (Inst->mayLoadOrStore()) {
                    EvaluateVariableOffset(Inst, VariableName);
                    DataInfo->AddMemInstRef(VariableName, Inst);
                    DataInfo->UpdateDataType(VariableName, getInstructionDataType(Inst));
                }
            }
        }
        for (DataReuseInfo::iterator VarIdx = DataInfo->begin(),
             VarEnd = DataInfo->end(); VarIdx != VarEnd; ++VarIdx) {
            VarIdx->UpdateOffsetInfo();
        }
    }

    std::vector<SPMVariable> Variables = DataInfo->getVariables();
    for (auto Var : Variables) {

        if (Var.areLoadsRequired()) {
            DEBUG(dbgs() << "\nName:" << Var.getName()  << " requires previous Loads to scratchpads.\n");
            InsertPreamble(MF, Var);
        } else
            DEBUG(dbgs() << "\nName:" << Var.getName()  << "\n");

        // Update Global Variables Offset, with SPM Offsets which
        // tells where the Variable will be located in the SPM(s).
        std::vector<MachineBasicBlock::iterator> VarRelatedInstructions = Var.getDefinitionInstructions();
        unsigned Offset = DataInfo->getVarOffsetInSPM(Var);
        for (MachineBasicBlock::iterator Inst : VarRelatedInstructions)
            analyzeVariableDefinitionInstruction(Inst, Offset);

        // Now we need to update every Memory Instruction traced
        // by its correspondent SPM Instruction.
        // We will tell exactly in which SPM the data will be stored.
        VarRelatedInstructions = Var.getMemoryInstructions();
        for (MachineBasicBlock::iterator Inst : VarRelatedInstructions) {
            unsigned Lane;
//          Offset = getInstructionOffset(Inst);
            Var.CalculateLaneAndOffset(Lane, Offset);
            DEBUG(dbgs() << "Lane:" << Lane << "\tOffset: " << Offset << "\n");
            Inst->dump();
            analyzeMemoryInstruction(Inst, Lane, Offset);
            Inst->dump();
        }
    }
    return false;
}

char VEXDataReuseTracking::ID = 0;
//static RegisterPass<VEXDataReuseTracking> Y("VEXDataReuseTrackingPreRegAlloc", "Data Reuse Tracking PreRegAlloc Pass", false, false);

MachineFunctionPass *llvm::createVEXDataReuseTracking(VEXTargetMachine &TM) {
    return new VEXDataReuseTracking(TM);
}
