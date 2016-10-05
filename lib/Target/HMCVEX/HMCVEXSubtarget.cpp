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

extern cl::opt<bool> GenericBinary;


extern bool FixGlobalBaseReg;

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
    
    if (GenericBinary) {
        errs() << "Generating Generic Binary.\n\t-mcpu=rHMCVEX-generic\n";
        CPU = "rHMCVEX-generic";
    } else if (CPU == "rHMCVEX-default") {
        errs() << "clang: warning: unknown target CPU: assuming '-mcpu=rHMCVEX-4issue'\n" << "\n";
        CPU = "rHMCVEX-4issue";
    } else if (CPU == "help" || CPU.empty()) {
        errs() << "-mcpu=<cpu-name>\n\tOptions: rHMCVEX-[2|4|8]issue, simple-[2|4|8]issue.\n\tDefault: rHMCVEX-4issue\n" << "\n";
        CPU = "rHMCVEX-4issue";
    }
    
    if (CPU == "rHMCVEX-2issue")
        HMCVEXArchVersion = rHMCVEX_2issue;
    else if (CPU == "rHMCVEX-4issue")
        HMCVEXArchVersion = rHMCVEX_4issue;
    else if (CPU == "rHMCVEX-8issue")
        HMCVEXArchVersion = rHMCVEX_8issue;
    else if (CPU == "simple-2issue")
        HMCVEXArchVersion = simple_2issue;
    else if (CPU == "simple-4issue")
        HMCVEXArchVersion = simple_4issue;
    else if (CPU == "simple-8issue")
        HMCVEXArchVersion = simple_8issue;
    
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




