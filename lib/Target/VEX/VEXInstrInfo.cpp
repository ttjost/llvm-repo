//===-- VEXInstrInfo.cpp - VEX Instruction Information ------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the VEX implementation of the TargetInstrInfo class.
//
//===----------------------------------------------------------------------===//

#include "VEXInstrInfo.h"

#include "VEXTargetMachine.h"
#include "VEXMachineFunction.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/TargetRegistry.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"


#define DEBUG_TYPE "vex-isel"
using namespace llvm;

#define GET_INSTRINFO_CTOR_DTOR
#include "VEXGenInstrInfo.inc"

//@VEXInstrInfo(){
VEXInstrInfo::VEXInstrInfo(const VEXSubtarget &STI) : Subtarget(STI), RI(STI) {
    DEBUG(errs() << "InstrInfo \n");
}


