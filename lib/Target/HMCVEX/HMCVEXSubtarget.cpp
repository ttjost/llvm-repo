//===-- HMCVEXSubtarget.cpp - HMCVEX Subtarget Information --------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements the HMCVEX specific subclass of TargetSubtargetInfo.
//
//===----------------------------------------------------------------------===//

#include "HMCVEXMachineFunctionInfo.h"
#include "HMCVEX.h"
#include "HMCVEXRegisterInfo.h"
#include "HMCVEXSubtarget.h"
#include "HMCVEXFrameLowering.h"

#include "HMCVEXTargetMachine.h"
#include "llvm/IR/Attributes.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/TargetRegistry.h"

using namespace llvm;

#define DEBUG_TYPE "HMCVEX-subtarget"

#define GET_SUBTARGETINFO_TARGET_DESC
#define GET_SUBTARGETINFO_CTOR
//#include "HMCVEXSubtargetInfo.cpp"
#include "HMCVEXGenSubtargetInfo.inc"


static cl::opt<bool>
EnableHMCVEXCalls("HMCVEX-calls", cl::Hidden,
               cl::desc("HMCVEX Call: use stack only to pass arguments."),
               cl::init(false));

cl::opt<bool> DisableHMCVEXMISched("disable-HMCVEX-misched",
                                       cl::Hidden, cl::ZeroOrMore, cl::init(false),
                                       cl::desc("Disable HMCVEX MI Scheduling"));

//// Select the HMCVEX CPU for the given triple and cpu name.
//// FIXME : Merge with the copy in HMCVEXMCTargetDesc.cpp
//static StringRef selectHMCVEXCPU(Triple TT, StringRef CPU){
//    if(CPU.empty() || CPU == "generic"){
//        if (TT.getArch() == Triple::HMCVEX)
//            CPU = "rHMCVEX-4issue";
//    }
//    return CPU;
//}

// HMCVEXSubtarget::HMCVEXSubtarget
HMCVEXSubtarget::HMCVEXSubtarget(const Triple &TT, const std::string &CPU,
                           const std::string &FS, bool isNewScheduling,
                           bool EnableVLIWScheduling, Reloc::Model _RM,
                           HMCVEXTargetMachine &_TM):
    HMCVEXGenSubtargetInfo(TT, CPU, FS),
    HMCVEXABI(ABI32),
    AllocationOrder(0),
    isNewScheduling(isNewScheduling),
    EnableVLIWScheduling(EnableVLIWScheduling),
    RM(_RM), TargetTriple(TT),
    TSInfo(*_TM.getDataLayout()),
    InstrInfo(initializeSubtargetDependencies(CPU, FS)),
    FrameLowering(),
    TLInfo(_TM, *this),
    OptBBHeights(make_unique<BBsInfo>()),
    SchedBBHeights(make_unique<BBsInfo>()) {
        DEBUG(errs() << "Subtarget\n");
        
}

HMCVEXSubtarget &HMCVEXSubtarget::initializeSubtargetDependencies(StringRef CPU,
                                                            StringRef FS){
    
//    if (CPU == "") {
//        errs() << "clang: warning: unknown target CPU: assuming '-mcpu=simple-64issue. '\n" << "\n";
//    }

    HMCVEXArchVersion = simple_64issue;
    CPU = "simple-64issue";
    
    // Parse features string.
    ParseSubtargetFeatures(CPU, FS);
    // Initialize scheduling itinerary for the specified CPU.
    InstrItins = getInstrItineraryForCPU(CPU);
    
    return *this;
    
}

bool HMCVEXSubtarget::enableMachineScheduler() const {
    return true;
}

bool HMCVEXSubtarget::abiUsesSoftFloat() const {
//  return TM->Options.UseSoftFloat;
    return true;
}




