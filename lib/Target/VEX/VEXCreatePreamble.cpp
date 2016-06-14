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

#include "VEX.h"
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
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

//#define GET_INSTRINFO_HEADER
//#include "VEXGenInstrInfo.inc"


#define DEBUG_TYPE "vex-createpreamble"

using namespace llvm;

// Later, this will be known in compile time, with no hint.
extern cl::opt<int> LoopCounterPreamble;

//===----------------------------------------------------------------------===//
//
// This pass implements modifies Load and Store instructions to use SPMs.
//
//===----------------------------------------------------------------------===//

namespace {

class VEXCreatePreamble: public MachineFunctionPass {

    TargetMachine &TM;
    DataReuseInfo* DataInfo;

    LiveIntervals *LIS;
    MachineLoopInfo *MLI;

    unsigned MemFuncUnits;

    unsigned getSPMOpcodeFromDataType(unsigned DataType, unsigned Lane, bool isLoad);
    void InsertPreamble(MachineFunction &MF, DataReuseInfo::iterator Variable, MachineBasicBlock *PreambleMBB);
    unsigned getLoadOpcode(unsigned DataType);
    MachineBasicBlock* CreatePreamble(MachineFunction &MF, DataReuseInfo::iterator Variable);

public:
    static char ID;

    VEXCreatePreamble(TargetMachine &TM)
        : MachineFunctionPass(ID), TM(TM) {
        const VEXSubtarget &Subtarget = *static_cast<const VEXTargetMachine &>(TM).getSubtargetImpl();
        const VEXInstrInfo *TII = static_cast<const VEXInstrInfo *>(Subtarget.getInstrInfo());

        DataInfo = static_cast<const VEXTargetMachine &>(TM).getDataReuseInfo();
        unsigned issue = Subtarget.getInstrItineraryData()->SchedModel.IssueWidth > 8 ? 8 : Subtarget.getInstrItineraryData()->SchedModel.IssueWidth;
        DataInfo->setNumSPMs(issue);
        DataInfo->setIssueWidth(issue);
    }

    const char *getPassName() const override {
        return "VEX Create Preamble Pass";
    }

    void getAnalysisUsage(AnalysisUsage &AU) const override;

    bool runOnMachineFunction(MachineFunction &MF) override;

};

}

unsigned VEXCreatePreamble::getLoadOpcode(unsigned DataType) {

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

// Replaces Not-laned Opcode with a reference to the proper lane scheduled to.
unsigned VEXCreatePreamble::getSPMOpcodeFromDataType(unsigned DataType, unsigned Lane, bool isLoad) {
    
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

MachineBasicBlock* VEXCreatePreamble::CreatePreamble(MachineFunction &MF, DataReuseInfo::iterator Variable) {

    MachineBasicBlock::iterator FirstMemInstr = Variable->getFirstMemoryInstruction();

    MachineBasicBlock::iterator DefInstr = Variable->getFirstDefinition();

    if (!DefInstr)
        return nullptr;

    MachineFunction::iterator MBB = DefInstr->getParent();

    if (FirstMemInstr) {
        assert(DefInstr->getOperand(0).isDef() && "First Operand should be a Definition. Something is wrong");
        assert(DefInstr->getParent()->getParent() == &MF && "DefInstr is not defined in this MF, but somewhere else");

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
void VEXCreatePreamble::InsertPreamble(MachineFunction &MF, DataReuseInfo::iterator Variable, MachineBasicBlock *PreambleMBB) {
    
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

void VEXCreatePreamble::getAnalysisUsage(AnalysisUsage &AU) const {
    AU.addRequired<MachineLoopInfo>();
    AU.addPreserved<MachineLoopInfo>();
    AU.addRequired<LiveIntervals>();
    MachineFunctionPass::getAnalysisUsage(AU);
}

bool VEXCreatePreamble::runOnMachineFunction(MachineFunction &MF) {

    MLI = &getAnalysis<MachineLoopInfo>();
    LIS = &getAnalysis<LiveIntervals>();
    unsigned PreambleIt = 0;

    std::vector<MachineBasicBlock *> Preambles;
    for (DataReuseInfo::iterator Var = DataInfo->begin(), VarE = DataInfo->end();
         Var != VarE; ++Var) {
        if (Var->areLoadsRequired()) {
            DEBUG(dbgs() << "\nName:" << Var->getName()  << " requires previous Loads to scratchpads.\n");
            Preambles.push_back(CreatePreamble(MF, Var));
            InsertPreamble(MF, Var, Preambles[PreambleIt++]);
        } else {
            DEBUG(dbgs() << "\nName:" << Var->getName()  << "\n");
        }
    }
}

char VEXCreatePreamble::ID = 0;
MachineFunctionPass *llvm::createVEXCreatePreamble(VEXTargetMachine &TM) {
    return new VEXCreatePreamble(TM);
}
