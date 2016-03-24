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

#include "llvm/CodeGen/MachineBasicBlock.h"
#include "llvm/IR/GlobalValue.h"

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

    const GlobalValue *GV;

    std::vector<MachineBasicBlock::iterator> MemoryInstructions;

    std::vector<MachineBasicBlock::iterator> DefinitionInstructions;

    // Define whether this variable will be stored in multiple SPMs
    // Default: false
    bool MultipleStorage;

    std::vector<unsigned> Memories;
    unsigned NumMemories;
    int AllocationPriority;

    // Define whether these variable(vector) will dynamically change stored data
    // FIR application is a good example on how this can be achieved.
    bool DynamicAllocation;

    bool LoadsRequired;

    unsigned OffsetsPerBB;
    unsigned NumUnits;
    unsigned InitialAddress;
    unsigned Size;
    unsigned NumElements;

    unsigned DataType;
    unsigned DataSize;

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
        MDByteU = 2,
        MDHalf = 3,
        MDHalfU = 4,
        MDFull = 5
    };

    SPMVariable() : Name(""), Flags(0), MultipleStorage(false), LoadsRequired(false), AllocationPriority(-1)  {
        PropagationRegisters.resize(0);
    }
    SPMVariable(StringRef Name) : Name(Name),
                                  Flags(0),
                                  MultipleStorage(false),
                                  LoadsRequired(false),
                                    AllocationPriority(-1) {
        PropagationRegisters.resize(0);
    }

//    SPMVariable(StringRef Name, unsigned Flags): Name(Name), Flags(Flags), MultipleStorage(false) {
//        PropagationRegisters.resize(0);
//    }
    SPMVariable(StringRef Name, unsigned Register,
                MachineBasicBlock::iterator Inst,
                const GlobalValue *V) : Name(Name),
                                                    Flags(0),
                                                    OffsetsPerBB(0),
                                                    MultipleStorage(false),
                                                    LoadsRequired(false),
                                                    AllocationPriority(-1),
                                                    DataType(0),
                                                    Size (1000),
                                                    GV (V) {
        PropagationRegisters.push_back(Register);
        RegistersAndOffsets.resize(0);
        MemoryInstructions.resize(0);
        DefinitionInstructions.resize(0);
        DefinitionInstructions.push_back(Inst);
    }

    const GlobalValue *getGlobalValue() const { return GV; }

    StringRef getName() const { return Name; }
    unsigned getFlags() const  { return Flags; } 
    bool isLoad() const { return Flags & MOLoad; }
    bool isStore() const { return Flags & MOStore; }
    bool isVolatile() const { return Flags & MOVolatile; }
    bool isNonTemporal() const { return Flags & MONonTemporal; }
    bool isInvariant() const { return Flags & MOInvariant; }

    bool isDefinitionInstruction(MachineBasicBlock::iterator Inst);

    bool isChar() const { return (DataType & MDByte) || (DataType & MDByteU); }
    bool isShort() const { return (DataType & MDHalf) || (DataType & MDHalfU); }
    bool isInt() const { return DataType & MDFull; }

    unsigned getDataSize() const { return DataSize; }

    void setDataSize() {
        if (DataType == MDFull)
            DataSize = 4;
        else if ((DataType == MDByte) || (DataType == MDByteU))
            DataSize = 1;
        else if ((DataType == MDHalf) || (DataType == MDHalfU))
            DataSize = 2;
    }

    void setDataType(unsigned flag) {
        DataType = flag;
        setDataSize();
    }

    void setFlags(unsigned flags) { Flags = flags; }
    void setLoad() { Flags |= MOLoad; }
    void setStore() { Flags |= MOStore; }

    void setSize(unsigned size) { Size = size; }

    void setInitialAddress(unsigned Addr) { InitialAddress = Addr; }

    bool isMultipleStorage() const { return MultipleStorage; }
    bool isDinamicallyAllocated() const  { return DynamicAllocation; }

    unsigned getMemoryUnit() {
        assert(AllocationPriority >= 0 && "Allocation was not performed.");
        if (MultipleStorage)
            return Memories[(AllocationPriority++)%Memories.size()];
        else
            return Memories[0];
    }

    void CalculateLaneAndOffset(unsigned &Lane, unsigned &Offset) {

//        assert(Offset > 0 && "Only positive offset for now.");

        Lane = (Offset%(NumMemories*DataSize))/DataSize;
        Lane = (Lane + Memories[0]);
        Offset = Offset/(NumMemories*DataSize)*DataSize;
    }

    void setMemoryUnits(std::vector<unsigned> Units) {
        if (AllocationPriority >= 0)
            return;
        AllocationPriority++;
        Memories = Units;
        NumMemories = Memories.size();
    }

    bool isNotAllocated() const { return AllocationPriority < 0; }
    
    unsigned getNumUnits() const { return NumUnits; }
    unsigned getInitialAddress() const { return InitialAddress; }
    unsigned getSize() const { return Size; }
    unsigned getNumElements() const { return NumElements; }
    unsigned getMaxOffsetPerBB() const { return OffsetsPerBB; }

    bool areLoadsRequired() const { return LoadsRequired; }

    unsigned getMaximumSPMs(unsigned IssueWidth) {
        for (unsigned i = IssueWidth; i != 0 ; --i)
            if (OffsetsPerBB%i == 0) {
                NumUnits = i;
                return i;
            }
        llvm_unreachable("Could not find a unit!");
    }

    void AddPropagationRegister(unsigned Register);
    void AddMemoryInstruction(MachineBasicBlock::iterator MI);
    void AddDefinitionInstruction(MachineBasicBlock::iterator MI);

    unsigned getDataType() {
        return DataType;
    }

    std::vector<unsigned> getPropagationRegisters() const { return PropagationRegisters; }
    std::vector<MachineBasicBlock::iterator> getMemoryInstructions() const { return MemoryInstructions; }
    MachineBasicBlock::iterator getFirstMemoryInstruction() const { return MemoryInstructions[0]; }

    MachineBasicBlock::iterator getFirstDefinition() const { return DefinitionInstructions[0]; }
    std::vector<MachineBasicBlock::iterator> getDefinitionInstructions() const { return DefinitionInstructions; }

    void AddOffset(unsigned Register, unsigned Offset);
    void UpdateOffsetInfo();
    
    bool operator==(const SPMVariable& rhs);
};
    
}

#endif
