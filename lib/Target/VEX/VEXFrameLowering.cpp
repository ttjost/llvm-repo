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
// arguments, are negative numbers. This way, on eliminateFrameIndex it's
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
    
    assert(&MF.front() == &MBB && "Shrink-wrapping not yet supported");
    
    MachineBasicBlock::iterator MBBI = MBB.begin();
    MachineFrameInfo *MFI = MF.getFrameInfo();
    VEXFunctionInfo *VEXFI = MF.getInfo<VEXFunctionInfo>();

    
    const VEXInstrInfo &TII = *static_cast<const VEXInstrInfo *>(MF.getSubtarget().getInstrInfo());
    const VEXRegisterInfo *RegInfo = static_cast<const VEXRegisterInfo *>(MF.getSubtarget().getRegisterInfo());
    
    DebugLoc DL = MBBI != MBB.end() ? MBBI->getDebugLoc() : DebugLoc();
    
    // Get the number of bytes to allocate from the FrameInfo.
    uint64_t StackSize = MFI->getStackSize();
    
    // No need to allocate space on the stack
    if (StackSize == 0 && !MFI->adjustsStack()) return;
    
    uint64_t NumBytes = 0;
    
    MachineModuleInfo &MMI = MF.getMMI();
    const MCRegisterInfo *MRI = MMI.getContext().getRegisterInfo();
    
    // Adjust Stack
    TII.adjustStackPtr(VEXFI, VEX::Reg1, -StackSize, MBB, MBBI);
    
    const std::vector<CalleeSavedInfo> &CSI = MFI->getCalleeSavedInfo();
    
    // emit ".cfi_def_cfa_offset StackSize"
    // Is that really necessary???
    unsigned CFIIndex = MMI.addFrameInst(MCCFIInstruction::createDefCfaOffset(nullptr, -StackSize));
    BuildMI(MBB, MBBI, DL, TII.get(TargetOpcode::CFI_INSTRUCTION)).addCFIIndex(CFIIndex);
    
    if(CSI.size()){
        // Find the instruction past the last instruction that saves
        // a callee-saved register to the stack.
        for (unsigned i = 0; i < CSI.size(); ++i){
            ++MBBI;
            
            // Iterate over list of callee-saved registers and emit .cfi_offset directives
            for (std::vector<CalleeSavedInfo>::const_iterator I = CSI.begin(),
                 E = CSI.end(); I != E ; ++I){
                uint64_t Offset = MFI->getObjectOffset(I->getFrameIdx());
                unsigned Reg = I->getReg();
                {
                    // Reg is in VEXRegs
                    unsigned CFIIndex = MMI.addFrameInst(MCCFIInstruction::createOffset(nullptr, MRI->getDwarfRegNum(Reg, 1), Offset));
                    BuildMI(MBB, MBBI, DL, TII.get(TargetOpcode::CFI_INSTRUCTION)).addCFIIndex(CFIIndex);
                }
            }
        }
    }
    
//    if (hasFP(MF)){
//        // Calculated required stack adjustment
//        uint64_t FrameSize = StackSize - 2;
//        NumBytes = FrameSize - VEXFI
//        
//    }
    
}

void VEXFrameLowering::emitEpilogue(MachineFunction &MF,
                                       MachineBasicBlock &MBB) const {
    DEBUG(errs() << "EmitEpilogue\n");
    MachineBasicBlock::iterator MBBI = MBB.getLastNonDebugInstr();
    
    MachineFrameInfo *MFI = MF.getFrameInfo();
    const VEXInstrInfo &TII = *static_cast<const VEXInstrInfo *>(MF.getSubtarget().getInstrInfo());
    
    DebugLoc dl = MBBI->getDebugLoc();
    uint64_t StackSize = MFI->getStackSize();
    
    //if(!StackSize){
        BuildMI(MBB, MBBI, dl, TII.get(VEX::RET)).addReg(VEX::Reg1).addReg(VEX::Reg1).addImm(0).addReg(VEX::Lr);
        //MachineInstrBuilder MIB = BuildMI(MBB, MBBI, dl, TII.get(VEX::RET)).addReg(VEX::Reg1);
        //MIB->addOperand(VEX::Reg1);
    MBB.erase(MBBI);
    //}else{
     //   BuildMI(MBB, MBBI, dl)
    //}
    
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


