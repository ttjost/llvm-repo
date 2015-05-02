//===-- VEXRegisterInfo.cpp - VEX Register Information -== --------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the VEX implementation of the TargetRegisterInfo class.
//
//===----------------------------------------------------------------------===//

#include "VEXRegisterInfo.h"

#include "VEX.h"
#include "VEXSubtarget.h"
#include "VEXMachineFunction.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Type.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"


#define DEBUG_TYPE "vex-reginfo"

#define GET_REGINFO_TARGET_DESC
#include "VEXGenRegisterInfo.inc"

using namespace llvm;

VEXRegisterInfo::VEXRegisterInfo(const VEXSubtarget &ST)
    : VEXGenRegisterInfo(VEX::Lr), Subtarget(ST) {
        DEBUG(errs() << "Register Info\n");
}

//===----------------------------------------------------------------------===//
// Callee Saved Registers methods
//===----------------------------------------------------------------------===//
// VEX Callee Saved Registers
// In VEXCallConv.td
// def CSR: CalleeSavedRegs<(add Lr, (sequece "Reg%u", 57, 6))>
// llc create CSR_SaveList and CSR_RegMask from above defined.
const uint16_t* VEXRegisterInfo::
getCalleeSavedRegs(const MachineFunction *MF) const{
    return CSR_SaveList;
}

const uint32_t*
VEXRegisterInfo::getCallPreservedMask(CallingConv::ID) const {
    return CSR_RegMask;
}

// pure virtual method
// @getReserved Regs
BitVector VEXRegisterInfo::
getReservedRegs(const MachineFunction &MF) const {
// @getReservedRegs body
    // FIXME : Verify if this is correct
    static const uint16_t ReservedVEXRegs[] = {
        VEX::Reg0, VEX::Lr, VEX::Reg1
    };
    BitVector Reserved(getNumRegs());
    typedef TargetRegisterClass::iterator RegIter;

    for(unsigned I = 0; I < array_lengthof(ReservedVEXRegs); ++I)
        Reserved.set(ReservedVEXRegs[I]);

    return Reserved;
}

//@EliminateFrameIndex
// - If no EliminateFrameIndex(), it will hang on run.
// pure virtual method
// FrameIndex represent objects inside an abstract stack.
// We must replace FrameIndex with an stack/frame pointer.
// direct reference.
void VEXRegisterInfo::
eliminateFrameIndex(MachineBasicBlock::iterator II, int SPAdj,
                    unsigned FIOperandNum, RegScavenger *RS) const {

}

// pure virtual method
unsigned VEXRegisterInfo::
getFrameRegister(const MachineFunction &MF) const{
    const TargetFrameLowering *TFI = MF.getSubtarget().getFrameLowering();

    // FIXME : Is there a frame pointer register?
    return TFI->hasFP(MF) ? (VEX::Reg1) : (VEX::Reg1);
}





