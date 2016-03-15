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
#include "llvm/CodeGen/MachineBasicBlock.h"
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

    typedef struct RegisterOffsetPair {
        unsigned Register;
        std::vector<unsigned> Offsets;
    } RegisterOffsetPair;

    StringRef Name;
    unsigned Flags;         // See MemOperandFlags in MachineMemOperand.h

    std::vector<unsigned> PropagationRegisters;      // Used for knowing which registers propagate the variable information
    std::vector<RegisterOffsetPair> RegistersAndOffsets;

    std::vector<MachineBasicBlock::iterator> MemoryInstructions;

    std::vector<MachineBasicBlock::iterator> DefinitionInstructions;

    // Define whether this variable will be stored in multiple SPMs
    // Default: false
    bool MultipleStorage;

    std::vector<unsigned> Memories;
    int AllocationPriority;

    // Define whether these variable(vector) will dynamically change stored data
    // FIR application is a good example on how this can be achieved.
    bool DynamicAllocation;

    bool FirstStore;

    unsigned OffsetsPerBB;
    unsigned StorageUnits;
    unsigned NumUnits;
    unsigned InitialAddress;
    unsigned Size;
    unsigned NumElements;

    unsigned DataType;

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
    // Variable Type
    enum MemDataType {
        MDByte = 1,
        MDHalf = 2,
        MDFull = 4
    };

    SPMVariable() : Name(""), Flags(0), MultipleStorage(false), FirstStore(false), AllocationPriority(-1)  {
        PropagationRegisters.resize(0);
    }
    SPMVariable(StringRef Name) : Name(Name),
                                  Flags(0),
                                  MultipleStorage(false),
                                  FirstStore(false),
                                    AllocationPriority(-1) {
        PropagationRegisters.resize(0);
    }

//    SPMVariable(StringRef Name, unsigned Flags): Name(Name), Flags(Flags), MultipleStorage(false) {
//        PropagationRegisters.resize(0);
//    }
    SPMVariable(StringRef Name, unsigned Register, bool FirstStore,
                MachineBasicBlock::iterator Inst) : Name(Name),
                                                    Flags(0),
                                                    OffsetsPerBB(0),
                                                    MultipleStorage(false),
                                                    FirstStore(FirstStore),
                                                    AllocationPriority(-1),
                                                    DataType(0),
                                                    Size (1000) {
        PropagationRegisters.push_back(Register);
        RegistersAndOffsets.resize(0);
        MemoryInstructions.resize(0);
        DefinitionInstructions.resize(0);
        DefinitionInstructions.push_back(Inst);
    }

    StringRef getName() const { return Name; }
    unsigned getFlags() const  { return Flags; } 
    bool isLoad() const { return Flags & MOLoad; }
    bool isStore() const { return Flags & MOStore; }
    bool isVolatile() const { return Flags & MOVolatile; }
    bool isNonTemporal() const { return Flags & MONonTemporal; }
    bool isInvariant() const { return Flags & MOInvariant; }

    MachineBasicBlock::iterator getFirstDefinition() const { return DefinitionInstructions[0]; }

    bool isDefinitionInstruction(MachineBasicBlock::iterator Inst);

    bool isChar() const { return DataType & MDByte; }
    bool isShort() const { return DataType & MDHalf; }
    bool isInt() const { return DataType & MDFull; }

    void setDataType(unsigned flag) { DataType = flag; }

    void setFlags(unsigned flags) { Flags = flags; }
    void setLoad() { Flags |= MOLoad; }
    void setStore() { Flags |= MOStore; }

    void setSize(unsigned size) { Size = size; }

    bool isMultipleStorage() const { return MultipleStorage; }
    bool isDinamicallyAllocated() const  { return DynamicAllocation; }

    unsigned getMemoryUnit() {
        assert(AllocationPriority >= 0 && "Allocation was not performed.");
        if (MultipleStorage)
            return Memories[(AllocationPriority++)%Memories.size()];
        else
            return Memories[0];
    }

    unsigned getAdjustedOffset(int Offset) {
        return Offset%(Memories.size()*DataType);
    }

    void setMemoryUnits(std::vector<unsigned> Units) {
        if (AllocationPriority >= 0)
            return;
        AllocationPriority++;
        Memories = Units;
    }

    bool isNotAllocated() const { return AllocationPriority < 0; }
    
    unsigned getStorageUnits() const { return StorageUnits; }
    unsigned getNumUnits() const { return NumUnits; }
    unsigned getInitialAddress() const { return InitialAddress; }
    unsigned getSize() const { return Size; }
    unsigned getNumElements() const { return NumElements; }
    unsigned getMaxOffsetPerBB() const { return OffsetsPerBB; }

    unsigned getMaximumSPMs(unsigned IssueWidth) const { return OffsetsPerBB%IssueWidth; }

    void AddPropagationRegister(unsigned Register);
    void AddMemoryInstruction(MachineBasicBlock::iterator MI);
    void AddDefinitionInstruction(MachineBasicBlock::iterator MI);

    std::vector<unsigned> getPropagationRegisters() const { return PropagationRegisters; }
    std::vector<MachineBasicBlock::iterator> getMemoryInstructions() const { return MemoryInstructions; }

    void AddOffset(unsigned Register, unsigned Offset);
    void UpdateOffsetInfo();
    
    bool operator==(const SPMVariable& rhs);

};
    
}

#endif
