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

    if (this->getName() == rhs.getName() &&
//        this->getFlags() == rhs.getFlags() &&
        this->isMultipleStorage() == rhs.isMultipleStorage() &&
        this->isDinamicallyAllocated() == rhs.isDinamicallyAllocated() &&
        this->getNumUnits() == rhs.getNumUnits() &&
        this->getInitialAddress() == rhs.getInitialAddress() &&
        this->getSize() == rhs.getSize() &&
        this->getNumElements() == rhs.getNumElements())
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

bool SPMVariable::isDefinitionInstruction(MachineBasicBlock::iterator Inst) {

    DEBUG(dbgs() << "isDefinitionInstruction\n");
    for (auto def : DefinitionInstructions) {
        def->dump();
        Inst->dump();
        if (def == Inst) {
            DEBUG(dbgs() << "Same\n");
            return true;
        }
    }
    return false;
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
