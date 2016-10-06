//===-- HMCVEXMachineFunctionInfo.cpp - Private data used for HMCVEX ----------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "HMCVEXMachineFunctionInfo.h"

#include "HMCVEXInstrInfo.h"
#include "HMCVEXSubtarget.h"
#include "llvm/IR/Function.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"

using namespace llvm;

// class HMCVEXCallEntry.
HMCVEXCallEntry::HMCVEXCallEntry(const StringRef &N){
#ifndef NDEBUG
    Name = N;
    Val = nullptr;
#endif
}

HMCVEXCallEntry::HMCVEXCallEntry(const GlobalValue *V){
#ifndef NDEBUG
    Val = V;
#endif
}

bool HMCVEXCallEntry::isConstant(const MachineFrameInfo *) const{
    return false;
}

bool HMCVEXCallEntry::isAliased(const MachineFrameInfo *) const{
    return false;
}

bool HMCVEXCallEntry::mayAlias(const MachineFrameInfo *) const{
    return false;
}

void HMCVEXCallEntry::printCustom(raw_ostream &O) const{
    O << "HMCVEXCallEntry: ";
#ifndef NDEBUG
    if(Val)
        O << Val->getName();
    else
        O << Name;
#endif
}

HMCVEXFunctionInfo::~HMCVEXFunctionInfo(){
    for(StringMap<const HMCVEXCallEntry *>::iterator
        I = ExternalCallEntries.begin(), E = ExternalCallEntries.end(); I != E;
        ++I)
        delete I->getValue();
    
    for (const auto &Entry : GlobalCallEntries)
        delete Entry.second;
}

void HMCVEXFunctionInfo::anchor() {}


