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
    std::vector<SPMVariable> getVariables() const { return Variables; }

    bool AddVariable(SPMVariable Var);
    bool RemoveVariable(SPMVariable Var);
    bool RemoveVariable(StringRef Name);
    bool UpdateVariable(SPMVariable& Var);
    bool FindVariable(StringRef Name);

    SPMVariable getVariable(MachineBasicBlock::iterator MI);

    void AddOffset(StringRef Name, unsigned Register, unsigned Offset);
    void AddMemInstRef(StringRef Name, MachineBasicBlock::iterator newInst);

    typedef std::vector<SPMVariable>::iterator iterator;
    typedef std::vector<SPMVariable>::const_iterator const_iterator;

    SPMVariable             &front() { return Variables.front(); }
    const SPMVariable       &front() const { return Variables.front(); }
    SPMVariable             &back() { return *--end(); }
    const SPMVariable       &back() const { return *--end(); }

    iterator            var_begin() { return Variables.begin(); }
    const_iterator      var_begin() const { return Variables.begin(); }
    iterator            var_end() { return Variables.end(); }
    const_iterator      var_end() const { return Variables.end(); }

    iterator            begin() { return var_begin(); }
    const_iterator      begin() const { return var_begin(); }
    iterator            end() { return var_end(); }
    const_iterator      end() const { return var_end(); }

};
    
}


#endif
