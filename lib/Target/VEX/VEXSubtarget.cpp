//===-- VEXSubtarget.cpp - VEX Subtarget Information --------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements the VEX specific subclass of TargetSubtargetInfo.
//
//===----------------------------------------------------------------------===//

#include "VEXMachineFunction.h"
#include "VEX.h"
#include "VEXRegisterInfo.h"
#include "VEXSubtarget.h"
#include "VEXFrameLowering.h"

#include "VEXTargetMachine.h"
#include "llvm/IR/Attributes.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/TargetRegistry.h"

using namespace llvm;

#define DEBUG_TYPE "vex-subtarget"

#define GET_SUBTARGETINFO_TARGET_DESC
#define GET_SUBTARGETINFO_CTOR
#include "VEXGenSubtargetInfo.inc"

static cl::opt<bool>
EnableVEXCalls("vex-calls", cl::Hidden,
               cl::desc("VEX Call: use stack only to pass arguments."),
               cl::init(false));

extern bool FixGlobalBaseReg;

// Select the VEX CPU for the given triple and cpu name.
// FIXME : Merge with the copy in VEXMCTargetDesc.cpp
static StringRef selectVEXCPU(Triple TT, StringRef CPU){
    if(CPU.empty() || CPU == "generic"){
        if (TT.getArch() == Triple::vex || TT.getArch() == Triple::vexnew)
            CPU = "VEX_I";
    }
    return CPU;
}

void VEXSubtarget::anchor() {
}

// VEXSubtarget::VEXSubtarget
VEXSubtarget::VEXSubtarget(const std::string &TT, const std::string &CPU,
                           const std::string &FS, bool isNewScheduling,
                           Reloc::Model _RM,
                           VEXTargetMachine &_TM):
    VEXGenSubtargetInfo(TT, CPU, FS),
    VEXABI(ABI32), isNewScheduling(isNewScheduling), RM(_RM), TargetTriple(TT),
    TSInfo(*_TM.getDataLayout()),
    InstrInfo(*this),
    FrameLowering(),
    TLInfo(_TM, *this) {
        DEBUG(errs() << "Subtaget\n");
        
}

VEXSubtarget &VEXSubtarget::initializeSubtargetDependencies(StringRef CPU, StringRef FS,
                                                            const TargetMachine *TM){
    std::string CPUName = selectVEXCPU(TargetTriple, CPU);
    
    if (CPUName == "help")
        CPUName = "VEX_I";

    if (CPUName == "VEX_I")
        VEXArchVersion = VEX_I;
    
    else if (CPUName == "VEX_II")
        VEXArchVersion = VEX_II;
    
    if (!isVEXI() && !isVEXII()) {
        errs() << "-mcpu must be empty(default:VEX_II), VEX_I or VEX_II" << "\n";
    }
    
    // Parse features string.
    ParseSubtargetFeatures(CPUName, FS);
    // Initialize scheduling itinerary for the specified CPU.
    InstrItins = getInstrItineraryForCPU(CPUName);
    
    return *this;
    
}

bool VEXSubtarget::abiUsesSoftFloat() const {
//  return TM->Options.UseSoftFloat;
    return true;
}




