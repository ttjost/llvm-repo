//===-- VEXMachineFunctionInfo.cpp - Private data used for VEX ----------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "SPMVariable.h"

#include "VEXSubtarget.h"
#include "llvm/IR/Function.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"

using namespace llvm;


bool operator==(const SPMVariable& lhs, const SPMVariable& rhs) {

    if (lhs.getName() == rhs.getName() &&
        lhs.getFlags() == rhs.getFlags() &&
        lhs.isMultipleStorage() == rhs.isMultipleStorage() &&
        lhs.isDinamicallyAllocated() == rhs.isDinamicallyAllocated() &&
        lhs.getStorageUnits() == rhs.getStorageUnits() &&
        lhs.getNumUnits() == rhs.getNumUnits() &&
        lhs.getInitialAddress() == rhs.getInitialAddress() &&
        lhs.getSize() == rhs.getSize() &&
        lhs.getNumElements() == rhs.getNumElements())
        return true;
    else
        return false;
}

