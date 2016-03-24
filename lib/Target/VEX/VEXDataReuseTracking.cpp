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
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineInstr.h"
#include "llvm/CodeGen/MachineMemOperand.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineLoopInfo.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/LiveIntervalAnalysis.h"
//#include "llvm/Analysis/LoopPass.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

//#define GET_INSTRINFO_HEADER
//#include "VEXGenInstrInfo.inc"


#define DEBUG_TYPE "vex-datareuse"

using namespace llvm;

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

    void analyzeVariableDefinitionInstruction(SPMVariable &Var, MachineInstr *MI,
                                             unsigned Offset);

    unsigned getInstructionDataType(MachineBasicBlock::iterator Inst);

    unsigned getSPMOpcode(unsigned Opcode, unsigned Lane, bool isLoad);

    // After Inserting Preamble, we might need to update
    // PHI Instructions on the next BB, because their MBB operands,
    // should be the same as the CFG. When adding a MBB in between
    // two BBs, the next MBB will have incorrect MBB Operands in PHI Instructions.
    void FixPHIInstructionFromNextBB(MachineBasicBlock *MBB,
                                     MachineBasicBlock *PreviousMBB,
                                     MachineBasicBlock *UpdatedMBB);
    
    void InsertPreamble(MachineFunction &MF, SPMVariable &Variable);
    
    unsigned getLoadOpcode(unsigned DataType);
    unsigned getSPMStoreOpcode(unsigned Lane, unsigned DataType);

    void getMemoryOpcodes(SPMVariable &Variable, unsigned &LoadOpcode, unsigned &StoreOpcode);

    void getStoreOpcode(SPMVariable &Variable,
                        unsigned &LoadOpcode,
                        bool isSPM);
    void getLoadOpcode(SPMVariable &Variable,
                       unsigned &LoadOpcode,
                       bool isSPM);

public:
    static char ID;
    VEXDataReuseTracking(TargetMachine &TM)
        : MachineFunctionPass(ID), TM(TM) {
        const VEXSubtarget &Subtarget = *static_cast<const VEXTargetMachine &>(TM).getSubtargetImpl();
        const VEXInstrInfo *TII = static_cast<const VEXInstrInfo *>(Subtarget.getInstrInfo());

        DataInfo = static_cast<const VEXTargetMachine &>(TM).getDataReuseInfo();
        DataInfo->setIssueWidth(Subtarget.getInstrItineraryData()->SchedModel.IssueWidth);
        DataInfo->setNumSPMs(Subtarget.getInstrItineraryData()->SchedModel.IssueWidth);
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
    AU.addRequired<MachineLoopInfo>();
    AU.addPreserved<MachineLoopInfo>();

    AU.addRequired<LiveIntervals>();
    AU.addPreserved<LiveIntervals>();

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
        MachineOperand BaseReg = Inst->getOperand(1);
        MachineOperand ImmOperand = Inst->getOperand(2);
        assert(DstReg.isReg() && "Operand must be Register");

        newInstr = BuildMI(*MBB, Inst, Inst->getDebugLoc(),
                                                       TII->get(MemOpcode),
                                                       DstReg.getReg()).addOperand(BaseReg)
                                                                       .addOperand(ImmOperand)
                                                                       .addMemOperand(*Inst->memoperands_begin());
//        newInstr->dump();

        Inst->eraseFromParent();
        Inst = newInstr;
    } else {
            MachineOperand BaseReg = Inst->getOperand(0);
            MachineOperand SrcReg = Inst->getOperand(1);
            MachineOperand ImmOperand = Inst->getOperand(2);
            assert(BaseReg.isReg() && "Operand must be Register");

            newInstr =
                    BuildMI(*MBB, Inst, Inst->getDebugLoc(),
                            TII->get(MemOpcode)).addOperand(BaseReg)
                                                 .addOperand(SrcReg)
                                                 .addOperand(ImmOperand)
                                                 .addMemOperand(*Inst->memoperands_begin());
//            newInstr->dump();
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

void VEXDataReuseTracking::getMemoryOpcodes(SPMVariable &Variable,
                                            unsigned &LoadOpcode,
                                            unsigned &StoreOpcode) {

    unsigned Lane, Offset = 0;
    Variable.CalculateLaneAndOffset(Lane, Offset);

    DEBUG(dbgs() << "\Lane: " << Lane << "\n");

    if (Variable.getObjectSize() == SPMVariable::MDFull) {
        LoadOpcode = Lane + VEX::LDW0;
        StoreOpcode = Lane + VEX::STW0;
    } else if (Variable.getObjectSize() == SPMVariable::MDByte) {
        LoadOpcode = Lane + VEX::LDB0;
        StoreOpcode = Lane + VEX::STB0;
    } else if (Variable.getObjectSize() == SPMVariable::MDByteU) {
        LoadOpcode = Lane + VEX::LDBU0;
        StoreOpcode = Lane + VEX::STB0;
    } else if (Variable.getObjectSize() == SPMVariable::MDHalf) {
        LoadOpcode = Lane + VEX::LDH0;
        StoreOpcode = Lane + VEX::STH0;
    } else if (Variable.getObjectSize() == SPMVariable::MDHalfU) {
        LoadOpcode = Lane + VEX::LDHU0;
        StoreOpcode = Lane + VEX::STH0;
    } else
        llvm_unreachable("Incorrect Object Size for Variable.");
}

void VEXDataReuseTracking::getLoadOpcode(SPMVariable &Variable,
                                         unsigned &LoadOpcode,
                                         bool isSPM) {

    unsigned Lane, Offset = 0;
    Variable.CalculateLaneAndOffset(Lane, Offset);

    DEBUG(dbgs() << "\Lane: " << Lane << "\n");

    if (Variable.getObjectSize() == SPMVariable::MDFull) {
        isSPM ? LoadOpcode = VEX::LDW0 + Lane: LoadOpcode = VEX::LDW;
    } else if (Variable.getObjectSize() == SPMVariable::MDByte) {
        isSPM ? LoadOpcode = VEX::LDB0 + Lane: LoadOpcode = VEX::LDB;
    } else if (Variable.getObjectSize() == SPMVariable::MDByteU) {
        isSPM ? LoadOpcode = VEX::LDBU0 + Lane: LoadOpcode = VEX::LDBU;
    } else if (Variable.getObjectSize() == SPMVariable::MDHalf) {
        isSPM ? LoadOpcode = VEX::LDH0 + Lane: LoadOpcode = VEX::LDH;
    } else if (Variable.getObjectSize() == SPMVariable::MDHalfU) {
        isSPM ? LoadOpcode = VEX::LDHU0 + Lane: LoadOpcode = VEX::LDHU;
    } else
        llvm_unreachable("Incorrect Object Size for Variable.");
}

void VEXDataReuseTracking::getStoreOpcode(SPMVariable &Variable,
                                         unsigned &LoadOpcode,
                                         bool isSPM) {

    unsigned Lane, Offset = 0;
    Variable.CalculateLaneAndOffset(Lane, Offset);

    DEBUG(dbgs() << "\Lane: " << Lane << "\n");

    if (Variable.getObjectSize() == SPMVariable::MDFull) {
        isSPM ? LoadOpcode = VEX::STW0 + Lane: LoadOpcode = VEX::STW;
    } else if (Variable.getObjectSize() == SPMVariable::MDByte ||
               Variable.getObjectSize() == SPMVariable::MDByteU) {
        isSPM ? LoadOpcode = VEX::STB0 + Lane: LoadOpcode = VEX::STB;
    } else if (Variable.getObjectSize() == SPMVariable::MDHalf ||
               Variable.getObjectSize() == SPMVariable::MDHalfU) {
        isSPM ? LoadOpcode = VEX::STH0 + Lane: LoadOpcode = VEX::STH;
    } else
        llvm_unreachable("Incorrect Object Size for Variable.");
}

// After Inserting Preamble, we might need to update
// PHI Instructions on the next BB, because their MBB operands,
// should be the same as the CFG. When adding a MBB in between
// two BBs, the next MBB will have incorrect MBB Operands in PHI Instructions.
void VEXDataReuseTracking::FixPHIInstructionFromNextBB(MachineBasicBlock *MBB,
                                 MachineBasicBlock *PreviousMBB,
                                 MachineBasicBlock *UpdatedMBB) {
    
    const VEXSubtarget &Subtarget = *static_cast<const VEXTargetMachine &>(TM).getSubtargetImpl();
    const VEXInstrInfo *TII = static_cast<const VEXInstrInfo *>(Subtarget.getInstrInfo());
    
    MachineBasicBlock *MBBTrue, *MBBFalse;
    for (MachineBasicBlock::iterator Inst = MBB->begin();
         Inst->getOpcode() == VEX::PHI; ++Inst) {
     
        MachineOperand Op0 = Inst->getOperand(0);
        MachineOperand Op1 = Inst->getOperand(1);
        MachineOperand Op2 = Inst->getOperand(2);
        MachineOperand Op3 = Inst->getOperand(3);
        MachineOperand Op4 = Inst->getOperand(4);
        
        if (Op2.getMBB() == PreviousMBB) {
            MBBTrue = UpdatedMBB;
            MBBFalse = Op4.getMBB();
        } else if (Op4.getMBB() == PreviousMBB) {
            MBBTrue = Op2.getMBB();
            MBBFalse = UpdatedMBB;
        } else
            llvm_unreachable("PHI Instruction is incorrectly formed.");
        
        MachineBasicBlock::iterator TempInst = Inst;
        
        // Add PHI Instruction
        Inst = BuildMI(*MBB, TempInst, DebugLoc(), TII->get(VEX::PHI), Op0.getReg())
                    .addOperand(Op1)
                    .addMBB(MBBTrue)
                    .addOperand(Op3)
                    .addMBB(MBBFalse);
        
        TempInst->eraseFromParent();
    }
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
void VEXDataReuseTracking::InsertPreamble(MachineFunction &MF, SPMVariable &Variable) {

    MachineBasicBlock::iterator DefInstr = Variable.getFirstDefinition();
    
    assert(DefInstr->getOperand(0).isDef() && "First Operand should be a Definition. Something is wrong");

    const VEXSubtarget &Subtarget = *static_cast<const VEXTargetMachine &>(TM).getSubtargetImpl();
    const VEXInstrInfo *TII = static_cast<const VEXInstrInfo *>(Subtarget.getInstrInfo());

    MachineBasicBlock *MBB = DefInstr->getParent();

    // Create new Basic Block for Preamble
    MachineBasicBlock *PreambleMBB = MBB->SplitCriticalEdge(std::next(MachineFunction::iterator(MBB)), this);
    
    if (!PreambleMBB)
        llvm_unreachable("Error creating new basic block");

    MF.RenumberBlocks();
    PreambleMBB->addSuccessor(PreambleMBB);

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

    BuildMI(*MBB, DefInstr,DefInstr->getDebugLoc(),
                           TII->get(VEX::MOVi),
                           InductionRegTrue).addImm(0);


    unsigned GlobalMemVariableReg = RegInfo.createVirtualRegister(GPRegClass);
    unsigned GlobalMemVariableRegTrue = RegInfo.createVirtualRegister(GPRegClass);
    unsigned GlobalMemVariableRegFalse = RegInfo.createVirtualRegister(GPRegClass);
    BuildMI(*MBB, DefInstr,DefInstr->getDebugLoc(),
            TII->get(VEX::MOVi),GlobalMemVariableRegTrue).addGlobalAddress(Variable.getGlobalValue());

    unsigned SPMAddrReg = RegInfo.createVirtualRegister(GPRegClass);
    unsigned SPMAddrRegTrue = RegInfo.createVirtualRegister(GPRegClass);
    unsigned SPMAddrRegFalse = RegInfo.createVirtualRegister(GPRegClass);
    BuildMI(*MBB, DefInstr,DefInstr->getDebugLoc(),TII->get(VEX::MOVi),SPMAddrRegTrue).addImm(0);

    // Load from Memory
    unsigned LoadDst = RegInfo.createVirtualRegister(GPRegClass);
    unsigned LoadOpcode, StoreOpcode;

    getLoadOpcode(Variable, LoadOpcode, false);

    MachineMemOperand *MMOLoad =
      MF.getMachineMemOperand(MachinePointerInfo(), MachineMemOperand::MOLoad,
                              4, 4);

    // IMPORTANT: Add Instruction to LiveIntervalsAnalysis
    // TODO: How do we calculate this?
    unsigned NumIterations = 16;

    // Add PHI Instruction
    BuildMI(*PreambleMBB, PreambleMBB->begin(), DebugLoc(), TII->get(VEX::PHI), InductionReg)
        .addReg(InductionRegTrue)
        .addMBB(MBB)
        .addReg(InductionRegFalse)
        .addMBB(PreambleMBB);

    // Add PHI Instruction
    BuildMI(*PreambleMBB, PreambleMBB->begin(), DebugLoc(), TII->get(VEX::PHI), GlobalMemVariableReg)
        .addReg(GlobalMemVariableRegTrue)
        .addMBB(MBB)
        .addReg(GlobalMemVariableRegFalse)
        .addMBB(PreambleMBB);

    // Add PHI Instruction
    BuildMI(*PreambleMBB, PreambleMBB->begin(), DebugLoc(), TII->get(VEX::PHI), SPMAddrReg)
        .addReg(SPMAddrRegTrue)
        .addMBB(MBB)
        .addReg(SPMAddrRegFalse)
        .addMBB(PreambleMBB);

    // Comparison Instruction
    unsigned CMPBranchReg = RegInfo.createVirtualRegister(BrRegClass);
    BuildMI(PreambleMBB, DebugLoc(),TII->get(VEX::CMPLTBRegi),CMPBranchReg)
                                                        .addReg(InductionReg)
                                                        .addImm(NumIterations);

    // Add Instruction for next value
     BuildMI(PreambleMBB, DebugLoc(), TII->get(VEX::ADDi), GlobalMemVariableRegFalse)
                                                            .addReg(GlobalMemVariableReg)
                                                            .addImm(Variable.getDataSize());
    // Add Instruction for Induction Variable
    BuildMI(PreambleMBB, DebugLoc(), TII->get(VEX::ADDi),InductionRegFalse)
            .addReg(InductionReg)
            .addImm(1);

    // Load from Memory
    BuildMI(PreambleMBB, DebugLoc(), TII->get(LoadOpcode), LoadDst)
                                              .addReg(GlobalMemVariableReg)
                                              .addImm(0)
                                              .addMemOperand(MMOLoad);

    // Store to SPM
    MachineMemOperand *MMOStore =
            MF.getMachineMemOperand(MachinePointerInfo(), MachineMemOperand::MOStore,
                                    4, 4);

    getStoreOpcode(Variable, StoreOpcode, true);

    BuildMI(PreambleMBB, DebugLoc(),TII->get(StoreOpcode)).addReg(LoadDst)
                                                        .addReg(SPMAddrReg)
                                                        .addImm(0)
                                                        .addMemOperand(MMOStore);

    // Add Instruction for Induction Variable
    BuildMI(PreambleMBB, DebugLoc(), TII->get(VEX::ADDi),SPMAddrRegFalse)
                                                            .addReg(SPMAddrReg)
                                                            .addImm(Variable.getDataSize());

    BuildMI(PreambleMBB, DebugLoc(), TII->get(VEX::BR)).addReg(CMPBranchReg)
                                                       .addMBB(PreambleMBB);


    MachineBasicBlock::iterator LastInstPreamble = PreambleMBB->end();
    --LastInstPreamble;
    LIS->InsertMachineInstrRangeInMaps(PreambleMBB->begin(), LastInstPreamble);

}

bool VEXDataReuseTracking::runOnMachineFunction(MachineFunction &MF) {
    errs() << MF.getName() << "\n";

    LIS = &getAnalysis<LiveIntervals>();

    for (MachineFunction::iterator MBB = MF.begin(),
         MBBE = MF.end(); MBBE != MBB; ++MBB) {


        MBB->dump();

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
                MachineOperand Op = Inst->getOperand(1);
                assert(Op.isGlobal() && "Must be a Global Address");
                SPMVariable Variable(VariableName, DefinedRegister, Inst, Op.getGlobal());
                DataInfo->AddVariable(Variable);
                DEBUG(dbgs() << "New Variable found in Register " << DefinedRegister << "\n");
                SPMFound = true;
            }
            Inst->dump();
            // Checks whether the instruction propagates SPMVariable
            if(PropagatesSPMVariable(Inst, VariableName)) {
                // Replaces memory Instruction to SPM Instruction
                // when necessary
                Inst->dump();
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
    for (auto &Var : Variables) {

        // Update Global Variables Offset, with SPM Offsets which
        // tells where the Variable will be located in the SPM(s).
        std::vector<MachineBasicBlock::iterator> VarRelatedInstructions = Var.getDefinitionInstructions();
        unsigned Offset = DataInfo->getVarOffsetInSPM(Var);
        for (MachineBasicBlock::iterator Inst : VarRelatedInstructions)
            analyzeVariableDefinitionInstruction(Var, Inst, Offset);

        // Now we need to update every Memory Instruction traced
        // by its correspondent SPM Instruction.
        // We will tell exactly in which SPM the data will be stored.
        VarRelatedInstructions = Var.getMemoryInstructions();
        for (MachineBasicBlock::iterator Inst : VarRelatedInstructions) {
            unsigned Lane;
//          Offset = getInstructionOffset(Inst);
            Var.CalculateLaneAndOffset(Lane, Offset);
            DEBUG(dbgs() << "Lane:" << Lane << "\tOffset: " << Offset << "\n");
            analyzeMemoryInstruction(Inst, Lane, Offset);
        }

        if (Var.areLoadsRequired()) {
            DEBUG(dbgs() << "\nName:" << Var.getName()  << " requires previous Loads to scratchpads.\n");
            InsertPreamble(MF, Var);
        } else
            DEBUG(dbgs() << "\nName:" << Var.getName()  << "\n");
    }
    return false;
}

char VEXDataReuseTracking::ID = 0;
//static RegisterPass<VEXDataReuseTracking> Y("VEXDataReuseTrackingPreRegAlloc", "Data Reuse Tracking PreRegAlloc Pass", false, false);

MachineFunctionPass *llvm::createVEXDataReuseTracking(VEXTargetMachine &TM) {
    return new VEXDataReuseTracking(TM);
}
