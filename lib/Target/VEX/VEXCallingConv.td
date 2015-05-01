//===-- VEXCallingConv.td - Calling Conventions VEX ----*- tablegen -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This describes the calling conventions for the VEX architectures.
//
//===----------------------------------------------------------------------===/


def CC_VEX_StackModel : CallingConv<[
  CCAssignToStack<4, 4>
]>;

def CC_VEX_Address : CallingConv<[
  CCIfType<[i8, i16], CCPromoteToType<i32>>,
  CCAssignToReg<[Reg3, Reg4, Reg5, Reg6, Reg7, Reg8, Reg9, Reg10]>,
  CCDelegateTo<CC_VEX_StackModel>
]>;

def CSR: CalleeSavedRegs<(add Lr, (sequence "Reg%u", 57, 6))>;
