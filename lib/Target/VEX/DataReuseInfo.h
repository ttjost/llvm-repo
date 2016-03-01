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

#ifndef DATEREUSEINFO_H
#define DATEREUSEINFO_H

//#include "llvm/ADT/StringMap.h"
//#include "llvm/CodeGen/MachineFrameInfo.h"
//#include "llvm/CodeGen/MachineFunction.h"
//#include "llvm/CodeGen/MachineMemOperand.h"
//#include "llvm/CodeGen/PseudoSourceValue.h"
//#include "llvm/IR/GlobalValue.h"
//#include "llvm/IR/ValueMap.h"
//#include "llvm/Target/TargetFrameLowering.h"
//#include "llvm/Target/TargetMachine.h"
#include <vector>
#include <map>
#include <string>
#include <utility>
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"
#include "SPMVariable.h"

#define DEBUG_TYPE "datareuseinfo"

namespace llvm {

class DataReuseInfo {

    std::vector<SPMVariable> Variables;
    unsigned NumSPMs;

public:
    DataReuseInfo() { Variables.resize(0); }

    unsigned getNumSPMs() { return NumSPMs; }
    std::vector<SPMVariable> const getVariables() { return Variables; }

    bool AddVariable(SPMVariable Var);
    bool RemoveVariable(SPMVariable Var);
    bool RemoveVariable(StringRef Name);
    bool UpdateVariable(SPMVariable& Var);

    bool FindVariable(StringRef Name);

};
    
}


#endif
