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


bool SPMVariable::operator==(const SPMVariable& rhs) {

    if (this->getName() == rhs.getName() &&
        this->getFlags() == rhs.getFlags() &&
        this->isMultipleStorage() == rhs.isMultipleStorage() &&
        this->isDinamicallyAllocated() == rhs.isDinamicallyAllocated() &&
        this->getStorageUnits() == rhs.getStorageUnits() &&
        this->getNumUnits() == rhs.getNumUnits() &&
        this->getInitialAddress() == rhs.getInitialAddress() &&
        this->getSize() == rhs.getSize() &&
        this->getNumElements() == rhs.getNumElements())
        return true;
    else
        return false;
}

