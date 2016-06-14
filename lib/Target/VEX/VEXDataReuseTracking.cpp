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

#include "VEXTargetMachine.h"
#include "llvm/Pass.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineInstr.h"
#include "llvm/CodeGen/MachineMemOperand.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineLoopInfo.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/LiveIntervalAnalysis.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/ScalarEvolutionExpander.h"
#include "llvm/Analysis/ScalarEvolutionExpressions.h"
//#include "llvm/Analysis/LoopPass.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

//#define GET_INSTRINFO_HEADER
//#include "VEXGenInstrInfo.inc"


#define DEBUG_TYPE "vex-datareuse"

using namespace llvm;

// Later, this will be known in compile time, with no hint.
static cl::opt<int> LoopCounterPreamble("counter-preamble",
                                cl::Hidden, cl::init(0),
                                cl::desc("Information about the number of iterations to be performed in preamble"));

namespace llvm {
    MachineFunctionPass *createVEXDataReuseTracking(VEXTargetMachine &TM);
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
    LiveIntervals *LIS;
    ScalarEvolution *SE;
    MachineLoopInfo *MLI;
    
    unsigned MemFuncUnits;

    bool IsSPMVariable (MachineBasicBlock::iterator Inst,
                        StringRef& VariableName,
                        unsigned& DefinedRegister);

    bool PropagatesSPMVariable (MachineBasicBlock::iterator Inst,
                                StringRef &VariableName);

    bool isSPMInstruction(unsigned Opcode);

    int64_t getInstructionOffset (MachineBasicBlock::iterator& Inst);

    void analyzeMemoryInstruction (MachineBasicBlock::iterator& Inst,
                                   unsigned Lane, unsigned Offset, unsigned BaseRegister);

    void  EvaluateVariableOffset(MachineBasicBlock::iterator Inst,
                                StringRef VariableName);

    void analyzeVariableDefinitionInstruction(SPMVariable &Var, MachineInstr *MI,
                                             unsigned Offset);

    unsigned getInstructionDataType(MachineBasicBlock::iterator Inst);

    unsigned getSPMOpcode(unsigned Opcode, unsigned Lane, bool isLoad);

    unsigned getSPMOpcodeFromDataType(unsigned DataType, unsigned Lane, bool isLoad);
    
    MachineBasicBlock* CreatePreamble(MachineFunction &MF, DataReuseInfo::iterator Variable);

    void InsertPreamble(MachineFunction &MF, DataReuseInfo::iterator Variable, MachineBasicBlock *PreambleMBB);
    
    unsigned getLoadOpcode(unsigned DataType);

//    void doInitialization();

public:
    static char ID;
    VEXDataReuseTracking(TargetMachine &TM)
        : MachineFunctionPass(ID), TM(TM) {
        const VEXSubtarget &Subtarget = *static_cast<const VEXTargetMachine &>(TM).getSubtargetImpl();
        const VEXInstrInfo *TII = static_cast<const VEXInstrInfo *>(Subtarget.getInstrInfo());

        DataInfo = static_cast<const VEXTargetMachine &>(TM).getDataReuseInfo();
        unsigned issue = Subtarget.getInstrItineraryData()->SchedModel.IssueWidth > 8 ? 8 : Subtarget.getInstrItineraryData()->SchedModel.IssueWidth;
        DataInfo->setNumSPMs(issue);
        DataInfo->setIssueWidth(issue);
    }

    const char *getPassName() const override {
        return "VEX Data Reuse Tracking Pass";
    }

    void getAnalysisUsage(AnalysisUsage &AU) const;

    bool runOnMachineFunction(MachineFunction &MF) override;

};

}

void VEXDataReuseTracking::getAnalysisUsage(AnalysisUsage &AU) const {
//    AU.addRequired<AliasAnalysis>();

//    AU.addRequired<LoopInfoWrapperPass>();
//    AU.addPreserved<LoopInfoWrapperPass>();

    AU.addRequired<MachineLoopInfo>();
    AU.addPreserved<MachineLoopInfo>();

    AU.addRequired<LiveIntervals>();
    AU.addPreserved<LiveIntervals>();

    AU.addRequired<ScalarEvolution>();

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
             Inst->getOpcode() == VEX::STH||
             Inst->getOpcode() == VEX::LDHExt)
        return SPMVariable::MDHalf;
    else if (Inst->getOpcode() == VEX::LDHU ||
             Inst->getOpcode() == VEX::LDBExt)
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
                        VarIdx->AddPropagationRegister(Inst->getOperand(0).getReg());
                    } else {
                        if (Inst->isCall()) {
                            VarIdx->AddPropagationCallRegister(Operand);
                        }
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

// Replaces Not-laned Opcode with a reference to the proper lane scheduled to.
unsigned VEXDataReuseTracking::getSPMOpcodeFromDataType(unsigned DataType, unsigned Lane, bool isLoad) {
    
    unsigned NewOpcode;
    switch(Lane) {
        case 0:
            if (isLoad) {
                if (DataType == SPMVariable::MDFull)
                    NewOpcode = VEX::LDW0;
                else if (DataType == SPMVariable::MDByte)
                    NewOpcode = VEX::LDB0;
                else if (DataType == SPMVariable::MDByteU)
                    NewOpcode = VEX::LDBU0;
                else if (DataType == SPMVariable::MDHalf)
                    NewOpcode = VEX::LDH0;
                else
                    NewOpcode = VEX::LDHU0;
            } else {
                if (DataType == SPMVariable::MDFull)
                    NewOpcode = VEX::STW0;
                else if (DataType == SPMVariable::MDHalf
                         || DataType == SPMVariable::MDHalfU)
                    NewOpcode = VEX::STH0;
                else
                    NewOpcode = VEX::STB0;
            }
            break;
        case 1:
            if (isLoad) {
                if (DataType == SPMVariable::MDFull)
                    NewOpcode = VEX::LDW1;
                else if (DataType == SPMVariable::MDByte)
                    NewOpcode = VEX::LDB1;
                else if (DataType == SPMVariable::MDByteU)
                    NewOpcode = VEX::LDBU1;
                else if (DataType == SPMVariable::MDHalf)
                    NewOpcode = VEX::LDH1;
                else
                    NewOpcode = VEX::LDHU1;
            } else {
                if (DataType == SPMVariable::MDFull)
                    NewOpcode = VEX::STW1;
                else if (DataType == SPMVariable::MDHalf
                         || DataType == SPMVariable::MDHalfU)
                    NewOpcode = VEX::STH1;
                else
                    NewOpcode = VEX::STB1;
            }
            break;
        case 2:
            if (isLoad) {
                if (DataType == SPMVariable::MDFull)
                    NewOpcode = VEX::LDW2;
                else if (DataType == SPMVariable::MDByte)
                    NewOpcode = VEX::LDB2;
                else if (DataType == SPMVariable::MDByteU)
                    NewOpcode = VEX::LDBU2;
                else if (DataType == SPMVariable::MDHalf)
                    NewOpcode = VEX::LDH2;
                else
                    NewOpcode = VEX::LDHU2;
            } else {
                if (DataType == SPMVariable::MDFull)
                    NewOpcode = VEX::STW2;
                else if (DataType == SPMVariable::MDHalf
                         || DataType == SPMVariable::MDHalfU)
                    NewOpcode = VEX::STH2;
                else
                    NewOpcode = VEX::STB2;
            }
            break;
        case 3:
            if (isLoad) {
                if (DataType == SPMVariable::MDFull)
                    NewOpcode = VEX::LDW3;
                else if (DataType == SPMVariable::MDByte)
                    NewOpcode = VEX::LDB3;
                else if (DataType == SPMVariable::MDByteU)
                    NewOpcode = VEX::LDBU3;
                else if (DataType == SPMVariable::MDHalf)
                    NewOpcode = VEX::LDH3;
                else
                    NewOpcode = VEX::LDHU3;
            } else {
                if (DataType == SPMVariable::MDFull)
                    NewOpcode = VEX::STW3;
                else if (DataType == SPMVariable::MDHalf
                         || DataType == SPMVariable::MDHalfU)
                    NewOpcode = VEX::STH3;
                else
                    NewOpcode = VEX::STB3;
            }
            break;
        case 4:
            if (isLoad) {
                if (DataType == SPMVariable::MDFull)
                    NewOpcode = VEX::LDW4;
                else if (DataType == SPMVariable::MDByte)
                    NewOpcode = VEX::LDB4;
                else if (DataType == SPMVariable::MDByteU)
                    NewOpcode = VEX::LDBU4;
                else if (DataType == SPMVariable::MDHalf)
                    NewOpcode = VEX::LDH4;
                else
                    NewOpcode = VEX::LDHU4;
            } else {
                if (DataType == SPMVariable::MDFull)
                    NewOpcode = VEX::STW4;
                else if (DataType == SPMVariable::MDHalf
                         || DataType == SPMVariable::MDHalfU)
                    NewOpcode = VEX::STH4;
                else
                    NewOpcode = VEX::STB4;
            }
            break;
        case 5:
            if (isLoad) {
                if (DataType == SPMVariable::MDFull)
                    NewOpcode = VEX::LDW5;
                else if (DataType == SPMVariable::MDByte)
                    NewOpcode = VEX::LDB5;
                else if (DataType == SPMVariable::MDByteU)
                    NewOpcode = VEX::LDBU5;
                else if (DataType == SPMVariable::MDHalf)
                    NewOpcode = VEX::LDH5;
                else
                    NewOpcode = VEX::LDHU5;
            } else {
                if (DataType == SPMVariable::MDFull)
                    NewOpcode = VEX::STW5;
                else if (DataType == SPMVariable::MDHalf
                         || DataType == SPMVariable::MDHalfU)
                    NewOpcode = VEX::STH5;
                else
                    NewOpcode = VEX::STB5;
            }
            break;
        case 6:
            if (isLoad) {
                if (DataType == SPMVariable::MDFull)
                    NewOpcode = VEX::LDW6;
                else if (DataType == SPMVariable::MDByte)
                    NewOpcode = VEX::LDB6;
                else if (DataType == SPMVariable::MDByteU)
                    NewOpcode = VEX::LDBU6;
                else if (DataType == SPMVariable::MDHalf)
                    NewOpcode = VEX::LDH6;
                else
                    NewOpcode = VEX::LDHU6;
            } else {
                if (DataType == SPMVariable::MDFull)
                    NewOpcode = VEX::STW6;
                else if (DataType == SPMVariable::MDHalf
                         || DataType == SPMVariable::MDHalfU)
                    NewOpcode = VEX::STH6;
                else
                    NewOpcode = VEX::STB6;
            }
            break;
        case 7:
            if (isLoad) {
                if (DataType == SPMVariable::MDFull)
                    NewOpcode = VEX::LDW7;
                else if (DataType == SPMVariable::MDByte)
                    NewOpcode = VEX::LDB7;
                else if (DataType == SPMVariable::MDByteU)
                    NewOpcode = VEX::LDBU7;
                else if (DataType == SPMVariable::MDHalf)
                    NewOpcode = VEX::LDH7;
                else
                    NewOpcode = VEX::LDHU7;
            } else {
                if (DataType == SPMVariable::MDFull)
                    NewOpcode = VEX::STW7;
                else if (DataType == SPMVariable::MDHalf
                         || DataType == SPMVariable::MDHalfU)
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
                                      unsigned Lane, unsigned Offset, unsigned BaseRegister) {

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
        MachineOperand BaseReg = Inst->getOperand(1);
        assert(DstReg.isReg() && "Operand must be Register");
        assert(BaseReg.isReg() && "Operand must be Register");
        
        if (BaseRegister == 0)
            BaseRegister = BaseReg.getReg();

        newInstr = BuildMI(*MBB, Inst, Inst->getDebugLoc(),
                                                       TII->get(MemOpcode),
                                                       DstReg.getReg()).addReg(BaseRegister)
                                                                       .addImm(Offset)
                                                                       .addMemOperand(*Inst->memoperands_begin());

        Inst->eraseFromParent();
        Inst = newInstr;
    } else {
        
        MachineOperand BaseReg = Inst->getOperand(0);
        MachineOperand SrcReg = Inst->getOperand(1);
        assert(BaseReg.isReg() && "Operand must be Register");
        assert(SrcReg.isReg() && "Operand must be Register");
        
        if (BaseRegister == 0)
            BaseRegister = BaseReg.getReg();
        
            newInstr =
                    BuildMI(*MBB, Inst, Inst->getDebugLoc(),
                            TII->get(MemOpcode)).addReg(BaseRegister)
                                                 .addOperand(SrcReg)
                                                 .addImm(Offset)
                                                 .addMemOperand(*Inst->memoperands_begin());
            Inst->eraseFromParent();
            Inst = newInstr;
        }
    DEBUG(dbgs() << "Finished Instruction Replacement \n");

}

void VEXDataReuseTracking::analyzeVariableDefinitionInstruction(SPMVariable &Var, MachineInstr *MI, unsigned Offset) {

    DEBUG(dbgs() << "Update offset for Scratchpad Variable\n");

    MachineOperand Op = MI->getOperand(1);
    assert(Op.isGlobal() && "Must be a Global Address");
    Op.ChangeToImmediate(Offset);
    MI->RemoveOperand(1);
    MI->addOperand(Op);
}

void VEXDataReuseTracking::EvaluateVariableOffset(MachineBasicBlock::iterator Inst,
                                                  StringRef VariableName) {

//    LoopInfo *LI = &getAnalysis<LoopInfoWrapperPass>().getLoopInfo();

    // If the BB belongs to a Loop
    // We should check if different addresses are
    // accessed in the same basic block.
    // Record this info in order to know how many SPMs will
    // be used to store the data structure for the variable
    MachineLoop* loop = MLI->getLoopFor(Inst->getParent());
    if (loop) {
        assert(DataInfo->FindVariable(VariableName) && " Variable not found.");
        MachineOperand MOReg = Inst->getOperand(1);
        MachineOperand MOImm = Inst->getOperand(2);

        assert (MOReg.isReg() && " MachineOperand should be Register");
        assert (MOImm.isImm() && " MachineOperand should be Immediate");
        DataInfo->AddOffset(VariableName, MOReg.getReg(), MOImm.getImm());
    }
}

MachineBasicBlock* VEXDataReuseTracking::CreatePreamble(MachineFunction &MF, DataReuseInfo::iterator Variable) {

    MachineBasicBlock::iterator FirstMemInstr = Variable->getFirstMemoryInstruction();

    if (!FirstMemInstr)
        return nullptr;

    MachineBasicBlock::iterator DefInstr = Variable->getFirstDefinition();
    MachineFunction::iterator MBB;

    if (!DefInstr) {
        MBB = MF.begin();
    } else {
        assert(DefInstr->getOperand(0).isDef() && "First Operand should be a Definition. Something is wrong");
        assert(DefInstr->getParent()->getParent() == &MF && "DefInstr is not defined in this MF, but somewhere else");

        MBB = DefInstr->getParent();
        if (DefInstr->getParent() == FirstMemInstr->getParent()) {
            do {
              --MBB;
            } while (MLI->getLoopFor(MBB));
        }
    }

    // Create new Basic Block for Preamble
    // This will do almost all tricks to create a BB in between two BBs.
    MachineBasicBlock *PreambleMBB = MBB->SplitCriticalEdge(*MBB->succ_begin(), this);

    if (!PreambleMBB)
        llvm_unreachable("Error creating new basic block");

    PreambleMBB->addSuccessor(PreambleMBB);
    MF.RenumberBlocks();

    Variable->setPreambleInserted();

    return PreambleMBB;
}


int NumberOfSetBits(unsigned i)
{
    // Java: use >>> instead of >>
    // C or C++: use uint32_t
    i = i - ((i >> 1) & 0x55555555);
    i = (i & 0x33333333) + ((i >> 2) & 0x33333333);
    return (((i + (i >> 4)) & 0x0F0F0F0F) * 0x01010101) >> 24;
}

// This function inserts the preamble code for the SPMs.
// We first need to store data into the SPMs in order to use them later on.
// The code generated for now will be in format of (we might need to optimize it later):
// PREAMBLE_COEF:
//      c0  ldw     $r0.12 = 0[$r0.10]
//      c0  cmplt   $b0.0 = $r0.13, 12
//      c0  add     $r0.10 = $r0.10, 4
//      c0  add     $r0.13 = $r0.13, 4
// ;;
//      c0  asm,0	$r0.11, 0, $r0.12
//      c0  br      $b0.0, PREAMBLE_COEF
// ;;
void VEXDataReuseTracking::InsertPreamble(MachineFunction &MF, DataReuseInfo::iterator Variable, MachineBasicBlock *PreambleMBB) {
    
    if (!(PreambleMBB || Variable->isPreambleInserted()))
        llvm_unreachable("Preamble was not inserted. Should not come to here.");

    const VEXSubtarget &Subtarget = *static_cast<const VEXTargetMachine &>(TM).getSubtargetImpl();
    const VEXInstrInfo *TII = static_cast<const VEXInstrInfo *>(Subtarget.getInstrInfo());

    MachineFunction::iterator MBB;
    MachineBasicBlock::pred_iterator PredMBB = PreambleMBB->pred_begin();

    if (*PredMBB == PreambleMBB) {
        ++PredMBB;
    }
    
    MBB = *PredMBB;

    if (!PreambleMBB)
        llvm_unreachable("Error creating new basic block");

    unsigned MaxOffsetPerBB = Variable->getMaxOffsetPerBB();
    unsigned NumMemories = Variable->getNumUnits();
    
    unsigned InternalOffset, ExternalLoopCounter, InternalLoopCounter;
    
    unsigned Temp = Variable->getConsecutiveDataPerSPM()*Variable->getDataSize();
    
    if (MaxOffsetPerBB > 1) {
        ExternalLoopCounter = LoopCounterPreamble/MaxOffsetPerBB;
        InternalLoopCounter = MaxOffsetPerBB/NumMemories;
        
        if (Variable->getConsecutiveDataPerSPM() > 1) {
            InternalOffset = Temp;
        } else {
            InternalOffset = InternalLoopCounter*Variable->getDataSize();
        }
    } else {
        InternalOffset = 1*Variable->getDataSize();
        InternalLoopCounter = 1;
        ExternalLoopCounter = LoopCounterPreamble;
    }
    
    // We need information about Register, in order to create new Virtual Register
    // Each class of Register (GPR or Branch) have to be created and are required
    // to create new VRegs.
    MachineRegisterInfo &RegInfo = MF.getRegInfo();
    const TargetRegisterClass *GPRegClass = &VEX::GPRegsRegClass;
    const TargetRegisterClass *BrRegClass = &VEX::BrRegsRegClass;

     // Create VReg for induction variable
    unsigned InductionReg = RegInfo.createVirtualRegister(GPRegClass);
    unsigned InductionRegTrue = RegInfo.createVirtualRegister(GPRegClass);
    unsigned InductionRegFalse = RegInfo.createVirtualRegister(GPRegClass);

    MachineBasicBlock::iterator LastNonTerminatorInstr = MBB->end();
    
    while (LastNonTerminatorInstr->isTerminator() && LastNonTerminatorInstr != MBB->begin())
        --LastNonTerminatorInstr;
    
    MachineInstr *Inst = BuildMI(*MBB, LastNonTerminatorInstr, DebugLoc(),
                           TII->get(VEX::MOVi),
                           InductionRegTrue).addImm(0);
    //LIS->InsertMachineInstrInMaps(Inst);
    unsigned GlobalMemVariableReg = RegInfo.createVirtualRegister(GPRegClass);
    unsigned GlobalMemVariableRegTrue = RegInfo.createVirtualRegister(GPRegClass);
    unsigned GlobalMemVariableRegFalse = RegInfo.createVirtualRegister(GPRegClass);
    Inst = BuildMI(*MBB, LastNonTerminatorInstr, DebugLoc(),
            TII->get(VEX::MOVi),GlobalMemVariableRegTrue).addGlobalAddress(Variable->getGlobalValue());
    LIS->InsertMachineInstrInMaps(Inst);

    unsigned SPMAddrReg = RegInfo.createVirtualRegister(GPRegClass);
    unsigned SPMAddrRegTrue = RegInfo.createVirtualRegister(GPRegClass);
    unsigned SPMAddrRegFalse = RegInfo.createVirtualRegister(GPRegClass);
    Inst = BuildMI(*MBB, LastNonTerminatorInstr, DebugLoc(),TII->get(VEX::MOVi),SPMAddrRegTrue).addImm(Variable->getInitialAddress());
    LIS->InsertMachineInstrInMaps(Inst);

    LastNonTerminatorInstr = PreambleMBB->getLastNonDebugInstr();

    while (LastNonTerminatorInstr->isTerminator() && LastNonTerminatorInstr != PreambleMBB->begin())
        --LastNonTerminatorInstr;

    MachineMemOperand *MMOLoad =
      MF.getMachineMemOperand(MachinePointerInfo(), MachineMemOperand::MOLoad,
                              4, 4);

    // TODO: For now, we pass this info in command line
    // How do we calculate this? Maybe with ScalarEvolution
    if (LoopCounterPreamble == 0)
        llvm_unreachable("You need to specify the number of iterations on the Preamble Loop.");

    // Add PHI Instruction
    Inst = BuildMI(*PreambleMBB, PreambleMBB->begin(), DebugLoc(), TII->get(VEX::PHI), InductionReg)
        .addReg(InductionRegTrue)
        .addMBB(MBB)
        .addReg(InductionRegFalse)
        .addMBB(PreambleMBB);
    LIS->InsertMachineInstrInMaps(Inst);

    // Add PHI Instruction
    Inst = BuildMI(*PreambleMBB, PreambleMBB->begin(), DebugLoc(), TII->get(VEX::PHI), GlobalMemVariableReg)
        .addReg(GlobalMemVariableRegTrue)
        .addMBB(MBB)
        .addReg(GlobalMemVariableRegFalse)
        .addMBB(PreambleMBB);
    LIS->InsertMachineInstrInMaps(Inst);

    // Add PHI Instruction
    Inst =BuildMI(*PreambleMBB, PreambleMBB->begin(), DebugLoc(), TII->get(VEX::PHI), SPMAddrReg)
        .addReg(SPMAddrRegTrue)
        .addMBB(MBB)
        .addReg(SPMAddrRegFalse)
        .addMBB(PreambleMBB);
    LIS->InsertMachineInstrInMaps(Inst);

    // Comparison Instruction
    unsigned CMPBranchReg = RegInfo.createVirtualRegister(BrRegClass);
    Inst = BuildMI(*PreambleMBB, LastNonTerminatorInstr, DebugLoc(),TII->get(VEX::CMPLTBRegi),CMPBranchReg)
                                                        .addReg(InductionReg)
                                                        .addImm(ExternalLoopCounter);
    LIS->InsertMachineInstrInMaps(Inst);

    // Add Instruction for next value
    Inst = BuildMI(*PreambleMBB, LastNonTerminatorInstr, DebugLoc(), TII->get(VEX::ADDi), GlobalMemVariableRegFalse)
                                                            .addReg(GlobalMemVariableReg)
                                                            .addImm(Variable->getDataSize());
    LIS->InsertMachineInstrInMaps(Inst);
    
    // Add Instruction for Induction Variable
    Inst = BuildMI(*PreambleMBB, LastNonTerminatorInstr, DebugLoc(), TII->get(VEX::ADDi),InductionRegFalse)
            .addReg(InductionReg)
            .addImm(1);
    LIS->InsertMachineInstrInMaps(Inst);
    
    unsigned SPMOffset = 0;
    unsigned GlobalOffset = 0;
    
    std::vector<unsigned> Memories = Variable->getMemories();
    
    // Load from Memory
    unsigned LoadDst[NumMemories];
    unsigned LoadOpcode, StoreOpcode;
    
    LoadOpcode = getLoadOpcode(Variable->getDataType());
    
    for (unsigned i = 0; i < InternalLoopCounter; ++i) {
            
        for (unsigned j = 0; j < NumMemories; ) {
            
            unsigned iterator = 0;
            do {
                LoadDst[j] = RegInfo.createVirtualRegister(GPRegClass);
            
                // Load from Memory
                Inst = BuildMI(*PreambleMBB, LastNonTerminatorInstr, DebugLoc(), TII->get(LoadOpcode), LoadDst[j++])
                                .addReg(GlobalMemVariableReg)
                                .addImm(GlobalOffset)
                            .addMemOperand(MMOLoad);
                LIS->InsertMachineInstrInMaps(Inst);
                GlobalOffset += InternalOffset;
                
            } while (++iterator < MemFuncUnits && j < NumMemories);
            
            // Store to SPM
            MachineMemOperand *MMOStore =
            MF.getMachineMemOperand(MachinePointerInfo(), MachineMemOperand::MOStore,
                                    4, 4);
            
            do {
                StoreOpcode = getSPMOpcodeFromDataType(Variable->getDataType(), Memories[j-iterator], false);
                
                Inst = BuildMI(*PreambleMBB, LastNonTerminatorInstr, DebugLoc(),TII->get(StoreOpcode)).addReg(LoadDst[j-iterator])
                                .addReg(SPMAddrReg)
                                .addImm(SPMOffset)
                            .addMemOperand(MMOStore);
                LIS->InsertMachineInstrInMaps(Inst);
                
            } while (--iterator > 0);
        }
        SPMOffset += Variable->getDataSize();
    }
        
        // Add Instruction for Induction Variable
        Inst = BuildMI(*PreambleMBB, LastNonTerminatorInstr, DebugLoc(), TII->get(VEX::ADDi),SPMAddrRegFalse)
        .addReg(SPMAddrReg)
        .addImm(InternalLoopCounter*Variable->getDataSize());
    LIS->InsertMachineInstrInMaps(Inst);

    Inst = BuildMI(*PreambleMBB, LastNonTerminatorInstr, DebugLoc(), TII->get(VEX::BR)).addReg(CMPBranchReg)
            .addMBB(PreambleMBB);
    LIS->InsertMachineInstrInMaps(Inst);

    DEBUG(PreambleMBB->dump());
}

int64_t VEXDataReuseTracking::getInstructionOffset (MachineBasicBlock::iterator& Inst) {
    for (unsigned i = 1, e = Inst->getNumOperands(); i != e ; ++i) {
        if (Inst->getOperand(i).isImm())
            return Inst->getOperand(i).getImm();
    }
    return 0;
}

bool VEXDataReuseTracking::isSPMInstruction(unsigned Opcode) {
    
    if (Opcode >= VEX::LDW0 && Opcode <= VEX::LDW7)
        return true;
    else if (Opcode >= VEX::LDB0 && Opcode <= VEX::LDB7)
        return true;
    else if (Opcode >= VEX::LDBU0 && Opcode <= VEX::LDBU7)
        return true;
    else if (Opcode >= VEX::LDH0 && Opcode <= VEX::LDH7)
        return true;
    else if (Opcode >= VEX::LDHU0 && Opcode <= VEX::LDHU7)
        return true;
    
    return false;
}

bool VEXDataReuseTracking::runOnMachineFunction(MachineFunction &MF) {
    DEBUG(dbgs() << "Function " << MF.getName() << "\n");

    // Here we reset Variables. We also consider variables
    // been propagated through call instructions.
    DataInfo->PropagateCallRegistersForVariables();

    LIS = &getAnalysis<LiveIntervals>();
    SE = &getAnalysis<ScalarEvolution>();
    MLI = &getAnalysis<MachineLoopInfo>();

    DEBUG(MF.dump());
    
    const VEXSubtarget &Subtarget = *static_cast<const VEXTargetMachine &>(TM).getSubtargetImpl();
    const VEXInstrInfo *TII = static_cast<const VEXInstrInfo *>(Subtarget.getInstrInfo());
    
    MachineInstr* Load = BuildMI(MF, DebugLoc(), TII->get(VEX::LDW));
    
    unsigned InsnClass = Load->getDesc().getSchedClass();
    const llvm::InstrStage *IS = Subtarget.getInstrItineraryData()->beginStage(InsnClass);

    MemFuncUnits = NumberOfSetBits(IS->getUnits());
    
    // Here we will perform a Breadth First Search
    // because we should perform the analysis on the variables,
    // respecting which BB have more probability on executing first.
    // This is important for some cases when PHI nodes do not propagate
    // properly the variable.
    std::deque<MachineFunction::iterator> BFSinMBBs(1, MF.begin());

    std::vector<bool> VisitedNodes(MF.size(), false);
    VisitedNodes[0] = true;
    
    MachineFunction::iterator MBB;
    while (!BFSinMBBs.empty()) {
        
        MBB = BFSinMBBs.front();
        BFSinMBBs.pop_front();
        
        for (MachineBasicBlock::succ_iterator SI = MBB->succ_begin(),
             SE = MBB->succ_end(); SI != SE; ++SI) {
            if (!VisitedNodes[(*(SI))->getNumber()]) {
                BFSinMBBs.push_back(*(SI));
                VisitedNodes[(*(SI))->getNumber()] = true;
            }
        }
        
        for (MachineBasicBlock::iterator Inst = MBB->begin(),
             InstE = MBB->end(); Inst != InstE; ++Inst) {

            unsigned DefinedRegister;

            if (Inst->isBranch())
                continue;

            bool SPMFound = false;
            StringRef VariableName;
            if (IsSPMVariable(Inst, VariableName, DefinedRegister)) {
                // A SPM Variable was found
                // Initiate a new node
                // and sets Variable as first store when necessary
                MachineOperand Op = Inst->getOperand(1);
                assert(Op.isGlobal() && "Must be a Global Address");
                SPMVariable Variable(VariableName, DefinedRegister, Inst, Op.getGlobal());
                DataInfo->AddVariable(Variable);
                DEBUG(dbgs() << "New Variable found in Register " << DefinedRegister << "\n");
                SPMFound = true;
            }
            // Checks whether the instruction propagates SPMVariable
            if(PropagatesSPMVariable(Inst, VariableName)) {
                // Replaces memory Instruction to SPM Instruction
                // when necessary
                DEBUG(Inst->dump());
                if (Inst->mayLoadOrStore()) {
                    EvaluateVariableOffset(Inst, VariableName);
                    DataInfo->AddMemInstRef(VariableName, Inst);
                    DataInfo->UpdateDataType(VariableName, getInstructionDataType(Inst));
                }
            }
        }
    }

    std::vector<MachineBasicBlock *> Preambles;
    for (DataReuseInfo::iterator Var = DataInfo->begin(), VarE = DataInfo->end();
         Var != VarE; ++Var) {
        if (Var->areLoadsRequired()) {
            Preambles.push_back(CreatePreamble(MF, Var));
        }
    }
    
    unsigned PreambleIt = 0;

    for (DataReuseInfo::iterator Var = DataInfo->begin(), VarE = DataInfo->end();
         Var != VarE; ++Var) {
        
        Var->UpdateOffsetInfo();
        
        // Update Global Variables Offset with SPM Offsets, which
        // tells where the Variable will be located in the SPM(s).
        std::vector<MachineBasicBlock::iterator> VarRelatedInstructions = Var->getDefinitionInstructions();
        int64_t Offset = (int64_t) DataInfo->getVarOffsetInSPM(*Var);

        if (!VarRelatedInstructions.empty())
            continue;

        Var->CalculateOffsetDistribution();
        
        std::set<MachineBasicBlock *> MBBs;
        
        for (MachineBasicBlock::iterator Inst : VarRelatedInstructions)
            analyzeVariableDefinitionInstruction(*Var, Inst, Offset);

        // Now we need to update every Memory Instruction traced
        // by its correspondent SPM Instruction.
        // We will tell exactly in which SPM the data will be stored.
        VarRelatedInstructions = Var->getMemoryInstructions();
        for (MachineBasicBlock::iterator Inst : VarRelatedInstructions) {
            // For now, we will set here the number of elements for this variable.
            // Since we only have one LoopCounter, all variables will have "the same"
            // number of elements. Of course, this will and should only have an effect
            // on the preamble insertion, since offsets are used similarly to the way
            // LLVM generates memory instructions. Therefore, we won't create new
            // instructions that manipulate wrong values
            // TODO:: Fix this to set every variable with its on proper loop counter
            Var->setNumElements(LoopCounterPreamble);
            unsigned Lane;
            
            Offset = getInstructionOffset(Inst);
            DEBUG(dbgs() << "\tOffset: " << Offset << "\n");
            Var->CalculateLaneAndOffset(Lane, Offset);
            DEBUG(dbgs() << "Lane:" << Lane << "\tOffset: " << Offset << "\n");
            
            MachineBasicBlock *MBB = Inst->getParent();
            
            unsigned BaseReg = 0;
            bool isLoop = false;
            for (MachineBasicBlock::pred_iterator SI = MBB->pred_begin(),
                 SE = MBB->pred_end(); SI != SE; ++SI) {
                
                if (*(SI) == MBB) {
                    isLoop = true;
                    break;
                }
            }
            
            if (Var->isMultipleStorage() && isLoop) {

                if (!(BaseReg = Var->FindBaseRegister(MBB))) {
                    MachineRegisterInfo &RegInfo = MF.getRegInfo();

                    BaseReg = RegInfo.createVirtualRegister(&VEX::GPRegsRegClass);
                    unsigned BaseRegTrue = RegInfo.createVirtualRegister(&VEX::GPRegsRegClass);
                    unsigned BaseRegFalse = RegInfo.createVirtualRegister(&VEX::GPRegsRegClass);
                    Var->AddBaseRegister(MBB, BaseReg);

                    MachineBasicBlock::pred_iterator SI = MBB->pred_begin();

                    if (*(SI) == MBB)
                        ++SI;

                    assert(*(SI) != MBB && "Cannot be the same BB");

                    MachineInstr* Inst = BuildMI(*(SI), DebugLoc(),
                            TII->get(VEX::MOVi),
                            BaseRegTrue).addImm(0);

                    // Terrible hack. Why can't we create more than one MOVi instruction?
                    // If we don't do like this, LLVM crashes, for some uncanny reason.
                    if (MBBs.empty())
                        LIS->InsertMachineInstrInMaps(Inst);

                    MachineBasicBlock::iterator LastInst = MBB->getLastNonDebugInstr();

                    while (LastInst->isTerminator() && LastInst != MBB->begin()) {
                        --LastInst;
                    }

                    // Add PHI Instruction
                    MachineInstr* Inst2 = BuildMI(*MBB, MBB->begin(), DebugLoc(), TII->get(VEX::PHI), BaseReg)
                    .addReg(BaseRegTrue)
                    .addMBB(*SI)
                    .addReg(BaseRegFalse)
                    .addMBB(MBB);

                    LIS->InsertMachineInstrInMaps(Inst2);

                    // Add Instruction for next value
                    MachineInstr* Inst3 = BuildMI(*MBB, LastInst, DebugLoc(), TII->get(VEX::ADDi), BaseRegFalse)
                    .addReg(BaseReg)
                    .addImm(Var->getMaxOffsetPerBB()/Var->getNumUnits()*Var->getDataSize());

                    LIS->InsertMachineInstrInMaps(Inst3);
                }
                MBBs.insert(MBB);
            }
            
            analyzeMemoryInstruction(Inst, Lane, Offset, BaseReg);
        }

        if (Var->areLoadsRequired()) {
            DEBUG(dbgs() << "\nName:" << Var->getName()  << " requires previous Loads to scratchpads.\n");
            InsertPreamble(MF, Var, Preambles[PreambleIt++]);
        } else
            DEBUG(dbgs() << "\nName:" << Var->getName()  << "\n");
    }
    
    for (MachineFunction::iterator MBB = MF.begin(), MBBE = MF.end(); MBB != MBBE; ++MBB)
        DEBUG(MBB->dump());
    
    return false;
    
}

char VEXDataReuseTracking::ID = 0;
//static RegisterPass<VEXDataReuseTracking> Y("VEXDataReuseTrackingPreRegAlloc", "Data Reuse Tracking PreRegAlloc Pass", false, false);

MachineFunctionPass *llvm::createVEXDataReuseTracking(VEXTargetMachine &TM) {
    return new VEXDataReuseTracking(TM);
}
