//===-- VEXMachineFunctionInfo.h - Private data used for VEX ----*- C++ -*-=//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file declares the VEX specific subclass of MachineFunctionInfo.
//
//===----------------------------------------------------------------------===//

#ifndef SPMVARIABLE_H
#define SPMVARIABLE_H

#include "llvm/ADT/StringMap.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineMemOperand.h"
#include "llvm/CodeGen/PseudoSourceValue.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/ValueMap.h"
#include "llvm/Target/TargetFrameLowering.h"
#include "llvm/Target/TargetMachine.h"
#include <map>
#include <string>
#include <utility>

#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

#define DEBUG_TYPE "datareuseinfo"

namespace llvm {

// This class defines a variable that will be stored in one or more Scratchpads
// A variable can be either a vector/matrix or a single value. However, priority
// is always given to vectors, since ILP can be better explored with them.
class SPMVariable {

    StringRef Name;
    unsigned Flags;         // See MemOperandFlags in MachineMemOperand.h

    // Define whether this variable will be stored in multiple SPMs
    // Default: false
    bool MultipleStorage;

    // Define whether these variable(vector) will dynamically change stored data
    // FIR application is a good example on how this can be achieved.
    bool DynamicAllocation;

    unsigned StorageUnits;
    unsigned NumUnits;
    unsigned InitialAddress;
    unsigned Size;
    unsigned NumElements;

    /// Flags values. These may be or'd together.
    enum MemOperandFlags {
      /// The memory access reads data.
      MOLoad = 1,
      /// The memory access writes data.
      MOStore = 2,
      /// The memory access is volatile.
      MOVolatile = 4,
      /// The memory access is non-temporal.
      MONonTemporal = 8,
      /// The memory access is invariant.
      MOInvariant = 16,
      // Target hints allow target passes to annotate memory operations.
      MOTargetStartBit = 5,
      MOTargetNumBits = 3,
      // This is the number of bits we need to represent flags.
      MOMaxBits = 8
    };

public:
    SPMVariable() : Name(""), Flags(0), MultipleStorage(false) {}
    SPMVariable(StringRef Name) : Name(Name), Flags(0), MultipleStorage(false) {}
    SPMVariable(StringRef Name, unsigned Flags): Name(Name), Flags(Flags), MultipleStorage(false) {}

    StringRef getName() const { return Name; }
    unsigned getFlags() const  { return Flags; } 
    bool isLoad() const { return Flags & MOLoad; }
    bool isStore() const { return Flags & MOStore; }
    bool isVolatile() const { return Flags & MOVolatile; }
    bool isNonTemporal() const { return Flags & MONonTemporal; }
    bool isInvariant() const { return Flags & MOInvariant; }

    bool isMultipleStorage() const { return MultipleStorage; }
    bool isDinamicallyAllocated() const  { return DynamicAllocation; }
    
    unsigned getStorageUnits() const { return StorageUnits; }
    unsigned getNumUnits() const { return NumUnits; }
    unsigned getInitialAddress() const { return InitialAddress; }
    unsigned getSize() const { return Size; }
    unsigned getNumElements() const { return NumElements; }
    
    //bool operator==(const SPMVariable& lhs, const SPMVariable& rhs);

};
    
}

#endif
