//===-- HMCVEXRegisterInfo.cpp - HMCVEX Register Information -== --------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the HMCVEX implementation of the TargetRegisterInfo class.
//
//===----------------------------------------------------------------------===//

#include "HMCVEXRegisterInfo.h"

#include "HMCVEX.h"
#include "HMCVEXSubtarget.h"
#include "HMCVEXMachineFunctionInfo.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Type.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"


#define DEBUG_TYPE "HMCVEX-register"

#define GET_REGINFO_TARGET_DESC
#include "HMCVEXGenRegisterInfo.inc"

using namespace llvm;

cl::opt<bool> is32Reg("is32Reg",
                            cl::Hidden, cl::desc("Enable 32 Registers instead of 64"));

HMCVEXRegisterInfo::HMCVEXRegisterInfo(const HMCVEXSubtarget &ST)
    : HMCVEXGenRegisterInfo(HMCVEX::Lr), Subtarget(ST) {
        DEBUG(errs() << "Register Info\n");
}

//===----------------------------------------------------------------------===//
// Callee Saved Registers methods
//===----------------------------------------------------------------------===//
// HMCVEX Callee Saved Registers
// In HMCVEXCallConv.td
// def CSR: CalleeSavedRegs<(add Lr, (sequece "Reg%u", 57, 6))>
// llc create CSR_SaveList and CSR_RegMask from above defined.
const uint16_t* HMCVEXRegisterInfo::
getCalleeSavedRegs(const MachineFunction *MF) const{
    if (is32Reg) {
        static const MCPhysReg CSR_List[] = { HMCVEX::Reg25, HMCVEX::Reg26, HMCVEX::Reg27, HMCVEX::Reg28, HMCVEX::Reg29, HMCVEX::Reg30, HMCVEX::Reg31, HMCVEX::Lr, 0 };
        return CSR_List;
    }
    return CSR_SaveList;
}

const uint32_t*
HMCVEXRegisterInfo::getCallPreservedMask(CallingConv::ID) const {
    return CSR_RegMask;
}

const TargetRegisterClass *HMCVEXRegisterInfo::getPointerRegClass(const MachineFunction &MF,
                                              unsigned Kind) const {
    return &HMCVEX::GPRegsRegClass;
}

// pure virtual method
// @getReserved Regs
BitVector HMCVEXRegisterInfo::
getReservedRegs(const MachineFunction &MF) const {
// @getReservedRegs body
    // FIXME : Verify if this is correct
//    static const uint16_t ReservedHMCVEXRegs[] = {
//        HMCVEX::Reg0, HMCVEX::Lr, HMCVEX::Reg1, HMCVEX::Reg2, HMCVEX::Reg3,
//        HMCVEX::Reg4, HMCVEX::Reg5, HMCVEX::Reg6, HMCVEX::Reg7, HMCVEX::Reg8,
//        HMCVEX::Reg9, HMCVEX::Reg10
//    };
    // We don't need to reserve registers Reg3 to Reg10. We can still use them.
    std::vector<uint16_t> ReservedHMCVEXRegs = {
            HMCVEX::Reg0, HMCVEX::Lr, HMCVEX::Reg1
    };
    
    if (is32Reg) {
        for (unsigned i = HMCVEX::Reg32; i < HMCVEX::NUM_TARGET_REGS; ++i)
            ReservedHMCVEXRegs.push_back(i);
    }

    BitVector Reserved(getNumRegs());
    typedef TargetRegisterClass::iterator RegIter;

    for(unsigned I = 0; I < ReservedHMCVEXRegs.size(); ++I)
        Reserved.set(ReservedHMCVEXRegs[I]);

    return Reserved;
}

//@EliminateFrameIndex
// - If no EliminateFrameIndex(), it will hang on run.
// pure virtual method
// FrameIndex represent objects inside an abstract stack.
// We must replace FrameIndex with an stack/frame pointer.
// direct reference.
void HMCVEXRegisterInfo::
eliminateFrameIndex(MachineBasicBlock::iterator II, int SPAdj,
                    unsigned FIOperandNum, RegScavenger *RS) const {

    assert(SPAdj == 0 && "Unexpected");

    MachineInstr &MI = *II;
    MachineBasicBlock &MBB = *MI.getParent();
    MachineFunction &MF = *MBB.getParent();
    const TargetFrameLowering *TFI = MF.getSubtarget().getFrameLowering();
    DebugLoc dl = MI.getDebugLoc();

    int FrameIndex = MI.getOperand(FIOperandNum).getIndex();

    unsigned BasePtr = HMCVEX::Reg1;
    
    // We need to fix the offset by subtracting 12. Otherwise,
    // variadic functions get all messed up.
    int Offset = TFI->getFrameIndexOffset(MF, FrameIndex);
    //int Offset = MF.getFrameInfo()->getObjectOffset(FrameIndex);

    // Skip the saved PC
    //Offset += 4;

//    if(TFI->hasFP(MF))
//        Offset += MF.getFrameInfo()->getStackSize();
//    else
//        Offset += 4;

    // Fold imm into offset
    Offset += MI.getOperand(FIOperandNum + 1).getImm();

    if(MI.getOpcode() == HMCVEX::ADDi){
        // This is actually "load effective address" of the stack slot
        // instruction. We have only two-address instructions, thus we need to
        // expand it into mov + add
        const TargetInstrInfo &TII = *MF.getSubtarget().getInstrInfo();

        //MI.setDesc(TII.get());
        if(Offset == 0)
            return;

        // we need to materialize the offset via add instruction
        unsigned DstReg = MI.getOperand(0).getReg();
        if(Offset < 0)
            BuildMI(MBB, std::next(II), dl, TII.get(HMCVEX::SUBi), DstReg)
                    .addReg(DstReg).addImm(-Offset);
        else
            BuildMI(MBB, std::next(II), dl, TII.get(HMCVEX::ADDi), DstReg)
                    .addReg(DstReg).addImm(Offset);
        return;
    }
    MI.getOperand(FIOperandNum).ChangeToRegister(BasePtr, false);
    MI.getOperand(FIOperandNum + 1).ChangeToImmediate(Offset);
}

// pure virtual method
unsigned HMCVEXRegisterInfo::
getFrameRegister(const MachineFunction &MF) const{
    const TargetFrameLowering *TFI = MF.getSubtarget().getFrameLowering();

    // FIXME : Is there a frame pointer register?
    //return TFI->hasFP(MF) ? (HMCVEX::Reg1) : (HMCVEX::Reg1);
    return HMCVEX::Reg1;
}


// We only need to change the allocation order and
// call the target-independent getRegAllocationHints function
void HMCVEXRegisterInfo::
    getRegAllocationHints(unsigned VirtReg,
                           ArrayRef<MCPhysReg> Order,
                           SmallVectorImpl<MCPhysReg> &Hints,
                           const MachineFunction &MF,
                           const VirtRegMap *VRM) const {
    
//    Order.
    TargetRegisterInfo::getRegAllocationHints(VirtReg, Order, Hints, MF, VRM);
        
    
}

