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
        if (Variables[i] == Var)
            return false;
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

