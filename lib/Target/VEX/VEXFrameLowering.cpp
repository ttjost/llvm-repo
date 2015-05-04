//===-- VEXFrameLowering.cpp - VEX Frame Information --------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the VEX implementation of TargetFrameLowering class.
//
//===----------------------------------------------------------------------===//

#include "VEXFrameLowering.h"

#include "VEXInstrInfo.h"
#include "VEXMachineFunction.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineModuleInfo.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Target/TargetOptions.h"

#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/Debug.h"

using namespace llvm;

#define DEBUG_TYPE "vex-framelower"

// ---------------------------------------------------------------------------
//                                  FIXME
// ---------------------------------------------------------------------------
//  Verify this part to describe with precision how Prologue, Epilogue
//  and CALL should be implemented. Fix this in order to describe VEX properly.

// - emitPrologue() and emitEpilogue() must exist for main().

//===----------------------------------------------------------------------===//
//
// Stack Frame Processing methods
// +----------------------------+
//
// The Stack is allocated decrementing the stack pointer on
// the first instruction of a function prologue. Once decremented,
// all stack references are done thought a positive offset
// from the stack/frame pointer, so the stack is considering
// to grow up! Otherwise terrible hacks would have to be made
// to get this stack ABI compliant :)
//
// The stack frame required by the ABI (after call):
// Offset
//
// 0            -----------
// 4            Args to pass
// .            saved $reg (some register)
// .            Alloca allocations
// .            Local Area
// .            CPU "Callee Saved" Registers
// .            saved FP
// .            saved RA
// StackSize    -----------
//
// Offset  - offset from sp after stack allocation on function prologue
//
// The sp is the stack pointer subtracted/added from the stack size
// at the Prologue/Epilogue
//
// References to the precious stack (to obtain arguments) are done
// with offsets that exceeds the stack size: (stacksize+(4*(num_arg - 1)))
//
// Examples:
// - reference to the actual stack frame
//   for any local area var there is something like : FI >= 0, StackOffset : 4
//      stw REGX, 4(SP)
//
// - reference to previous stack frame
//   suppose there's a load to the 5th arguments : FI < 0, StackOffset: 16.
//      The emitted instruction will be something like:
//          ldw REGX, 16+StackSize(SP)
//
// Since the total stack size is unknown on LowerFormalArguments, all
// stack references (ObjectOffset) created to reference the function
// arguments, are negative numbers. This way, on eliminateFramIndex it's
// possible to detect those references and the offsets are adjusted to
// their real location.
//
//===----------------------------------------------------------------------===//

//- Must have, hasFP() is pure virtual of parent
//  hasFP - Return true if the specified function should have a dedicated frame
//  pointer register. This is true if the function has variable sized allocas or
//  if frame pointer elimination is disabled.

bool VEXFrameLowering::hasReservedCallFrame(const MachineFunction &MF) const {
    return !MF.getFrameInfo()->hasVarSizedObjects();
}

void VEXFrameLowering::emitPrologue(MachineFunction &MF) const {
    DEBUG(errs() << "EmitPrologue\n");
    
    MachineBasicBlock &MBB = MF.front();
    MachineFrameInfo *MFI = MF.getFrameInfo();
    
    
}

void VEXFrameLowering::emitEpilogue(MachineFunction &MF,
                                       MachineBasicBlock &MBB) const {
    DEBUG(errs() << "EmitEpilogue\n");
}

// FIXME: Can we eleminate these in favour of generic code?
bool
VEXFrameLowering::spillCalleeSavedRegisters(MachineBasicBlock &MBB,
                                               MachineBasicBlock::iterator MI,
                                               const std::vector<CalleeSavedInfo> &CSI,
                                               const TargetRegisterInfo *TRI) const {
    
    return true;
}

bool
VEXFrameLowering::restoreCalleeSavedRegisters(MachineBasicBlock &MBB,
                                                 MachineBasicBlock::iterator MI,
                                                 const std::vector<CalleeSavedInfo> &CSI,
                                                 const TargetRegisterInfo *TRI) const {

    return true;
}

void VEXFrameLowering::
eliminateCallFramePseudoInstr(MachineFunction &MF, MachineBasicBlock &MBB,
                              MachineBasicBlock::iterator I) const {
    
}

void
VEXFrameLowering::processFunctionBeforeFrameFinalized(MachineFunction &MF,
                                                         RegScavenger *) const {
    
}

bool VEXFrameLowering::hasFP(const MachineFunction &MF) const{
    const MachineFrameInfo *MFI = MF.getFrameInfo();
    return MF.getTarget().Options.DisableFramePointerElim(MF) ||
            MFI->hasVarSizedObjects() || MFI->isFrameAddressTaken();
}


