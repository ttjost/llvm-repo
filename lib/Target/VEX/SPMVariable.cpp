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
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;


#define DEBUG_TYPE "spmvariable"

bool SPMVariable::operator==(const SPMVariable& rhs) {

    if (this->getName() == rhs.getName() /*&&
//        this->getFlags() == rhs.getFlags() &&
        this->isMultipleStorage() == rhs.isMultipleStorage() &&
        this->isDinamicallyAllocated() == rhs.isDinamicallyAllocated() &&
        this->getNumUnits() == rhs.getNumUnits() &&
        this->getInitialAddress() == rhs.getInitialAddress() &&
        this->getSize() == rhs.getSize() &&
        this->getNumElements() == rhs.getNumElements()*/)
        return true;
    else
        return false;
}

void SPMVariable::AddPropagationRegister(unsigned Register) {

    for (unsigned i = 0, e = PropagationRegisters.size(); i != e; ++i) {
        if (PropagationRegisters[i] == Register)
            return;
    }
    std::vector<unsigned>::iterator it = PropagationRegisters.begin();
    PropagationRegisters.insert(it, Register);
}

void SPMVariable::AddMemoryInstruction(MachineBasicBlock::iterator MI) {
    if (MemoryInstructions.empty() && MI->mayLoad())
        LoadsRequired = true;
    MemoryInstructions.push_back(MI);
}

void SPMVariable::AddDefinitionInstruction(MachineBasicBlock::iterator MI) {
    DefinitionInstructions.push_back(MI);
}

void SPMVariable::AddBaseRegister(MachineBasicBlock *MBB, unsigned BaseRegister) {
    BaseRegs[MBB] = BaseRegister;
}

unsigned SPMVariable::FindBaseRegister(MachineBasicBlock *MBB) {
    std::map<MachineBasicBlock *, unsigned>::iterator it;
    
    it = BaseRegs.find(MBB);
    
    if (it != BaseRegs.end())
        return BaseRegs[MBB];
    else
        return 0;
}

bool SPMVariable::isDefinitionInstruction(MachineBasicBlock::iterator Inst) {

    DEBUG(dbgs() << "isDefinitionInstruction\n");
    for (auto def : DefinitionInstructions) {
        DEBUG(def->dump());
        DEBUG(Inst->dump());
        if (def == Inst) {
            DEBUG(dbgs() << "Same\n");
            return true;
        }
    }
    return false;
}

// Return Lane and Offset for that Value in Scratchpad
// We only need to worry about this when using Multiple Storages.
// Otherwise, finding out Lane and Offset is straightforward.
void SPMVariable::CalculateLaneAndOffset(unsigned &Lane, unsigned &Offset) {
    
    if (!MultipleStorage) {
        Lane = Memories[0];
        return;
    }
    
    if (ConsecutiveDataPerSPM == 1) {
        
        Lane = ((Offset - MinimumOffset) % (DataSize * NumMemories)) / DataSize;
        Offset = ((Offset - MinimumOffset) / (DataSize * NumMemories)) * DataSize;

    } else {
        unsigned Row, Column, Temp;

        Row = ((Offset-MinimumOffset)/DataSize)%OffsetsPerBB;
        Column = ((Offset-MinimumOffset)/DataSize)/OffsetsPerBB;

        Temp = Row*OffsetsPerBB + Column;

        Lane = Temp%NumMemories;
        Offset = (Temp/NumMemories)*DataSize;

    }
    Lane = Memories[Lane];
}

unsigned SPMVariable::getMaximumSPMs(unsigned IssueWidth) {
    for (unsigned i = IssueWidth; i != 0 ; --i)
        if (OffsetsPerBB%i == 0) {
            NumUnits = i;
            return i;
        }
    llvm_unreachable("Could not find a unit!");
}

unsigned SPMVariable::getMemoryUnit() {
    assert(AllocationPriority >= 0 && "Allocation was not performed.");
    if (MultipleStorage)
        return Memories[(AllocationPriority++)%Memories.size()];
    else
        return Memories[0];
}

void SPMVariable::CalculateOffsetDistribution() {
    
    unsigned OffsetDistance = UINT_MAX;
    
    std::set<int> SortedOffsets;
    
    for (unsigned i = 0, e = MemoryInstructions.size(); i != e; ++i) {
        for (unsigned j = 1, EndOp = MemoryInstructions[i]->getNumOperands(); j != EndOp; ++j)
            if (MemoryInstructions[i]->getOperand(j).isImm()) {
                SortedOffsets.insert(MemoryInstructions[i]->getOperand(j).getImm());
                break;
            }
    }
    
    auto itBegin = SortedOffsets.begin();
    int MinOffset = *itBegin;
    int TempOffset = *itBegin;
    for(auto it = ++itBegin; it != SortedOffsets.end(); ++it) {
        
        if (MinOffset > TempOffset)
            MinOffset = TempOffset;
        
        unsigned distance = std::abs(*it - TempOffset);
        
        TempOffset = *it;
        
        if (distance < OffsetDistance)
            OffsetDistance = distance;
    }
    
    ConsecutiveDataPerSPM = OffsetDistance/DataSize;
    MinimumOffset = MinOffset;
    
}

void SPMVariable::setMemoryUnits(std::vector<unsigned> Units) {
    if (AllocationPriority >= 0)
        return;
    AllocationPriority++;
    Memories = Units;
    NumMemories = Memories.size();
    
    if (NumMemories > 1)
        MultipleStorage = true;
    else
        MultipleStorage = false;
}

void SPMVariable::setNumElements(unsigned Elements) {
    NumElements = Elements;
}

void SPMVariable::AddOffset(unsigned Register, unsigned Offset) {

    int RegisterPosition = -1;
    for (unsigned i = 0, e = RegistersAndOffsets.size(); i != e; ++i) {
        if (RegistersAndOffsets[i].Register == Register) {
            RegisterPosition = i;
            for (unsigned j = 0, e = RegistersAndOffsets.size(); j != e; ++j)
                if (RegistersAndOffsets[i].Offsets[j] == Offset)
                    return;
        }
    }

    if (RegisterPosition != -1) {
        RegistersAndOffsets[RegisterPosition].Offsets.push_back(Offset);
    }else {
        RegistersAndOffsets.push_back({Register, {Offset} } );
    }
}

void SPMVariable::UpdateOffsetInfo() {

    for (unsigned i = 0, e = RegistersAndOffsets.size(); i != e; ++i) {
        if (RegistersAndOffsets[i].Offsets.size() > OffsetsPerBB)
            OffsetsPerBB = RegistersAndOffsets[i].Offsets.size();
    }
    RegistersAndOffsets.resize(0);
}
