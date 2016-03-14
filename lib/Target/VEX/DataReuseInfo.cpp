//===-- VEXMachineFunctionInfo.cpp - Private data used for VEX ----------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "DataReuseInfo.h"

#include "VEXSubtarget.h"
#include "llvm/IR/Function.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"

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

// Returns the ordering for the SPMs allocation
// Ordering allocation is: Lane1, Lane2, Lane3, Lane4 ... Lane0
// Lane 0 is the last one because regular memory instructions
// use this lane for execution.
std::vector<unsigned> DataReuseInfo::getAllocationPriorityForSPMs(SPMVariable Var) {

    if (IssueWidth == 2) {
        assert(NumSPMs < 2 && "Number of SPMs should be less or equal to 2.");
    } else if (IssueWidth == 4) {
        assert(NumSPMs < 4 && "Number of SPMs should be less or equal to 4.");
    } else if (IssueWidth == 8) {
        assert(NumSPMs < 8 && "Number of SPMs should be less or equal to 8.");
    } else
        llvm_unreachable("There is no support for a different Issue Width yet. Choose between 2, 4 and 8.");


    unsigned NumberOfSPMs = Var.getMaximumSPMs(IssueWidth);
    unsigned OffsetsPerSPMs = Var.getSize()/Var.getMaximumSPMs(IssueWidth);

    // Here we due a Circular buffer, that will make Lane0 the last lane.
//    for (unsigned i = 0; i < NumberOfSPMs; ++i) {
//        SPMs.push_back((++AllocationIndex)%IssueWidth);
//    }
//    return SPMs;
}

unsigned DataReuseInfo::getMemOffsetForVariable(SPMVariable Var) {

    if (Var.isNotAllocated()) {
//        getAllocationPriorityForSPMs(Var);

    } else {


    }
//    return Offset;
}

// This function gets the next avaiable offset to be used by the new SPM Variable.
unsigned DataReuseInfo::getAvailableOffset(unsigned Memory, int Size) {

    assert(Memory < MemoriesOffsets.size() && "Memory not available");

    unsigned Offset = MemoriesOffsets[Memory];
    MemoriesOffsets[Memory] += Size;

    return Offset;
}
