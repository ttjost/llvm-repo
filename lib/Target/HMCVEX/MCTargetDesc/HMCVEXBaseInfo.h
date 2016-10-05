//===-- HMCVEXBaseInfo.h - Top level definitions for HMCVEX MC ------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains small standalone helper functions and enum definitions for
// the HMCVEX target useful for the compiler back-end and the MC libraries.
//
//===----------------------------------------------------------------------===//
#ifndef HMCVEXBASEINFO_H
#define HMCVEXBASEINFO_H

#include "llvm/Support/ErrorHandling.h"

namespace llvm {

/// getHMCVEXRegisterNumbering - Given the enum value for some register,
/// return the number that it corresponds to.
inline static unsigned getHMCVEXRegisterNumbering(unsigned RegEnum)
{
  switch (RegEnum) {
  case HMCVEX::Reg0:
    return 0;
  case HMCVEX::Reg1:
    return 1;
  case HMCVEX::Reg2:
    return 2;
  case HMCVEX::Reg3:
    return 3;
  case HMCVEX::Reg4:
    return 4;
  case HMCVEX::Reg5:
    return 5;
  case HMCVEX::Reg6:
    return 6;
  case HMCVEX::Reg7:
    return 7;
  case HMCVEX::Reg8:
    return 8;
  case HMCVEX::Reg9:
    return 9;
  case HMCVEX::Reg10:
    return 10;
  case HMCVEX::Reg11:
    return 11;
  case HMCVEX::Reg12:
    return 12;
  case HMCVEX::Reg13:
    return 13;
  case HMCVEX::Reg14:
    return 14;
  case HMCVEX::Reg15:
    return 15;
  case HMCVEX::Reg16:
    return 16;
  case HMCVEX::Reg17:
    return 17;
  case HMCVEX::Reg18:
    return 18;
  case HMCVEX::Reg19:
    return 19;
  case HMCVEX::Reg20:
    return 20;
  case HMCVEX::Reg21:
    return 21;
  case HMCVEX::Reg22:
    return 22;
  case HMCVEX::Reg23:
    return 23;
  case HMCVEX::Reg24:
    return 24;
  case HMCVEX::Reg25:
    return 25;
  case HMCVEX::Reg26:
    return 26;
  case HMCVEX::Reg27:
    return 27;
  case HMCVEX::Reg28:
    return 28;
  case HMCVEX::Reg29:
    return 29;
  case HMCVEX::Reg30:
    return 30;
  case HMCVEX::Reg31:
    return 31;
  case HMCVEX::Reg32:
    return 32;
  case HMCVEX::Reg33:
    return 33;
  case HMCVEX::Reg34:
    return 34;
  case HMCVEX::Reg35:
    return 35;
  case HMCVEX::Reg36:
    return 36;
  case HMCVEX::Reg37:
    return 37;
  case HMCVEX::Reg38:
    return 38;
  case HMCVEX::Reg39:
    return 39;
  case HMCVEX::Reg40:
    return 40;
  case HMCVEX::Reg41:
    return 41;
  case HMCVEX::Reg42:
    return 42;
  case HMCVEX::Reg43:
    return 43;
  case HMCVEX::Reg44:
    return 44;
  case HMCVEX::Reg45:
    return 45;
  case HMCVEX::Reg46:
    return 46;
  case HMCVEX::Reg47:
    return 47;
  case HMCVEX::Reg48:
    return 48;
  case HMCVEX::Reg49:
    return 49;
  case HMCVEX::Reg50:
    return 50;
  case HMCVEX::Reg51:
    return 51;
  case HMCVEX::Reg52:
    return 52;
  case HMCVEX::Reg53:
    return 53;
  case HMCVEX::Reg54:
    return 54;
  case HMCVEX::Reg55:
    return 55;
  case HMCVEX::Reg56:
    return 56;
  case HMCVEX::Reg57:
    return 57;
  case HMCVEX::Reg58:
    return 58;
  case HMCVEX::Reg59:
    return 59;
  case HMCVEX::Reg60:
    return 60;
  case HMCVEX::Reg61:
    return 61;
  case HMCVEX::Reg62:
    return 62;
  case HMCVEX::Reg63:
    return 63;
  case HMCVEX::BrReg0:
    return 0;
  case HMCVEX::BrReg1:
    return 1;
  case HMCVEX::BrReg2:
    return 2;
  case HMCVEX::BrReg3:
    return 3;
  case HMCVEX::BrReg4:
    return 4;
  case HMCVEX::BrReg5:
    return 5;
  case HMCVEX::BrReg6:
    return 6;
  case HMCVEX::BrReg7:
    return 7;
  case HMCVEX::Lr:
    return 64;
  default: llvm_unreachable("Unknown register number!");
  }
}

extern int HMCVEXDFAStateInputTable[][2];
extern unsigned int HMCVEXDFAStateEntryTable[];




}

#endif
