//===-- VEXMachineFunctionInfo.cpp - Private data used for VEX ----------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "DataReuseInfo.h"

#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;


bool DataReuseInfo::AddVariable(SPMVariable Var) {

    for (unsigned i = 0, e = Variables.size();
         i != e; ++i) {
        if (Variables[i] == Var) {
            Variables[i].AddDefinitionInstruction(Var.getFirstDefinition());
            return false;
        }
    }
    Variables.push_back(Var);
    return true;
}

bool DataReuseInfo::RemoveVariable(SPMVariable Var) {

    for (std::vector<SPMVariable>::iterator i = Variables.begin(), e = Variables.end();
         i != e; ++i) {
        if (*i == Var) {
            Variables.erase(i);
            return true;
        }
    }
    return false;
}

bool DataReuseInfo::RemoveVariable(StringRef Name) {

    for (std::vector<SPMVariable>::iterator i = Variables.begin(), e = Variables.end();
         i != e; ++i) {
        if ((*i).getName() == Name) {
            Variables.erase(i);
            return true;
        }
    }
    return false;
}

bool DataReuseInfo::UpdateVariable(SPMVariable& Var) {

    for (unsigned i = 0, e = Variables.size();
         i != e; ++i) {
        if (Variables[i] == Var) {
            Variables[i] = Var;
            return true;
        }
    }
    return false;
}

bool DataReuseInfo::FindVariable(StringRef Name) {

    for(std::vector<SPMVariable>::iterator i = Variables.begin(),
        e = Variables.end(); i != e; ++i) {
        if ((*i).getName() == Name) {
            return true;
        }
    }
    return false;
}

void DataReuseInfo::AddOffset(StringRef Name, unsigned Register, unsigned Offset) {
    for(std::vector<SPMVariable>::iterator i = Variables.begin(),
        e = Variables.end(); i != e; ++i) {
        if ((*i).getName() == Name) {
            i->AddOffset(Register, Offset);
        }
    }
}

void DataReuseInfo::UpdateDataType(StringRef Name, unsigned DataType) {
    for(std::vector<SPMVariable>::iterator i = Variables.begin(),
        e = Variables.end(); i != e; ++i) {
        if ((*i).getName() == Name) {
            i->setDataType(DataType);
        }
    }
}


void DataReuseInfo::AddMemInstRef(StringRef Name, MachineBasicBlock::iterator newInst) {
    for(std::vector<SPMVariable>::iterator i = Variables.begin(),
        e = Variables.end(); i != e; ++i) {
        if ((*i).getName() == Name) {
            i->AddMemoryInstruction(newInst);
        }
    }
}

SPMVariable DataReuseInfo::getVariable(MachineBasicBlock::iterator MI) {

    for(std::vector<SPMVariable>::iterator i = Variables.begin(),
        e = Variables.end(); i != e; ++i) {

        std::vector<MachineBasicBlock::iterator> MemInsts = i->getMemoryInstructions();
        for (MachineBasicBlock::iterator Inst : MemInsts) {

            if (Inst == MI) {
                return (*i);
            }
        }
    }
}

// Gives priority to memories with small offsets, other than higher
// This will make the algorithm more fair and allow not to allocate
// all variables in the same scratchpad.
// It is hard-coded that External Memory is located in Lane0, therefore,
// priority will be given starting at 1 and finishing at 0;
// Vector will contain the positions where the SPMs are located
// TODO: Better if we split this function into two.
// For now, let it leave this way.
unsigned DataReuseInfo::getOffsetAndUpdateMemories(SPMVariable &Var, unsigned NumberOfSPMs, unsigned OffsetSize) {

    std::vector<unsigned> Mem;
    Mem.resize(0);
    // We should give priority to Memory 1, so we iterate from 1 to 0 (as in a circular buffer).
    unsigned FirstMem = 1;
    unsigned MinimumOffset = MemoriesOffsets[1];
    for (unsigned i = 1, e = MemoriesOffsets.size(); i != 0 ; i=(i+1)%e) {
        if (MemoriesOffsets[i] < MinimumOffset) {
            FirstMem = i;
            MinimumOffset = MemoriesOffsets[i];
        }
    }

    unsigned Temp = FirstMem;
    for (unsigned i = 0, e = MemoriesOffsets.size(); i != NumberOfSPMs ; i++) {
        MemoriesOffsets[Temp] += OffsetSize;
        Temp%=e;
        Mem.push_back(Temp++);
    }
    unsigned InitialAddress = MemoriesOffsets[FirstMem] - OffsetSize;

    Var.setInitialAddress(InitialAddress);
    Var.setMemoryUnits(Mem);

    return MemoriesOffsets[FirstMem] - OffsetSize;
}

// Returns the ordering for the SPMs allocation
// Ordering allocation is: Lane1, Lane2, Lane3, Lane4 ... Lane0
// Lane 0 is the last one because regular memory instructions
// use this lane for execution.
unsigned DataReuseInfo::AllocateSPMs(SPMVariable &Var) {

    if (IssueWidth == 2) {
        assert(NumSPMs <= 2 && "Number of SPMs should be less or equal to 2.");
    } else if (IssueWidth == 4) {
        assert(NumSPMs <= 4 && "Number of SPMs should be less or equal to 4.");
    } else if (IssueWidth == 8) {
        assert(NumSPMs <= 8 && "Number of SPMs should be less or equal to 8.");
    } else
        llvm_unreachable("There is no support for a different Issue Width yet. Choose between 2, 4 and 8.");


    unsigned NumberOfSPMs = Var.getMaximumSPMs(IssueWidth);
    unsigned OffsetsPerSPMs = Var.getSize()/NumberOfSPMs;

    return getOffsetAndUpdateMemories(Var, NumberOfSPMs, OffsetsPerSPMs);
}

unsigned DataReuseInfo::getVarOffsetInSPM(SPMVariable& Var) {

    if (Var.isNotAllocated()) {
        return AllocateSPMs(Var);
    } else {
        return Var.getInitialAddress();
    }
}

// This function gets the next avaiable offset to be used by the new SPM Variable.
unsigned DataReuseInfo::getAvailableOffset(unsigned Memory, int Size) {

    assert(Memory < MemoriesOffsets.size() && "Memory not available");

    unsigned Offset = MemoriesOffsets[Memory];
    MemoriesOffsets[Memory] += Size;

    return Offset;
}
