//===-- HMCVEXTargetInfo.cpp - HMCVEX Target Implementation -------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "HMCVEX.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/TargetRegistry.h"
using namespace llvm;

Target llvm::TheHMCVEXTarget;
Target llvm::TheHMCVEXNewTarget;

extern "C" void LLVMInitializeHMCVEXTargetInfo() {
    RegisterTarget<Triple::hmcvex,
        /*HasJIT=*/false> X(TheHMCVEXTarget, "hmc-vex", "HMC VEX");
    
//    RegisterTarget<Triple::HMCVEXnew,
//        /*HasJIT=*/false> Y(TheHMCVEXNewTarget,"HMCVEXnew", "HMCVEX New Scheduling");

}
