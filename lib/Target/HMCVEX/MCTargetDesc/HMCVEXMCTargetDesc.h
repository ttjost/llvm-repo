//===-- HMCVEXMCTargetDesc.h - HMCVEX Target Descriptions -----------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file provides HMCVEX specific target descriptions.
//
//===----------------------------------------------------------------------===//

#ifndef HMCVEXMCTARGETDESC_H
#define HMCVEXMCTARGETDESC_H

//#include "HMCVEXConfig.h"
#include "llvm/Support/DataTypes.h"

namespace llvm{

    class MCAsmBackend;
    class MCCodeEmitter;
    class MCContext;
    class MCInstrInfo;
    class MCObjectWriter;
    class MCRegisterInfo;
    class MCSubtargetInfo;
    class StringRef;
    class raw_ostream;
    
    class Target;

    extern Target TheHMCVEXTarget;
    extern Target TheHMCVEXNewTarget;

} // end llvm namespace

// Define symbolic names for HMCVEX registers. This defines a mapping from
// register name to register number
#define GET_REGINFO_ENUM
#include "HMCVEXGenRegisterInfo.inc"

// Defines symbolic names for the HMCVEX Instructions
#define GET_INSTRINFO_ENUM
#include "HMCVEXGenInstrInfo.inc"

#define GET_SUBTARGETINFO_ENUM
#include "HMCVEXGenSubtargetInfo.inc"
//#include "../HMCVEXSubtargetInfo.cpp"

#endif
