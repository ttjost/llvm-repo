//===-- HMCVEX.h - Top-level interface for HMCVEX representation ----*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the entry points for global functions defined in
// the LLVM HMCVEX back-end.
//
//===----------------------------------------------------------------------===//

#ifndef TARGET_HMCVEX_H
#define TARGET_HMCVEX_H

//#include "HMCVEXConfig.h"
#include "MCTargetDesc/HMCVEXMCTargetDesc.h"
#include "llvm/Target/TargetMachine.h"
#include "llvm/Support/CommandLine.h"

namespace llvm {
    class HMCVEXTargetMachine;
    class FunctionPass;

    FunctionPass *createHMCVEXISelDag(HMCVEXTargetMachine &TM);
    
    BasicBlockPass *createHMCVEXTreeHeightReductionPass();

    ModulePass *createHMCVEXReorderFunctionsPass();
    
//    FunctionPass *createHMCVEXModuloScheduler(HMCVEXTargetMachine &TM);
    
    FunctionPass *createHMCVEXPostRAScheduler();

} // end namespace llvm;

#endif
