//===-- VEXTargetMachine.cpp - Define TargetMachine for VEX -------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// Implements the info about VEX target spec.
//
//===----------------------------------------------------------------------===//

#include "VEXTargetMachine.h"
#include "VEX.h"
//#include "VEXSubtarget.h"
//#include "VEXTargetObjectFile.h"
#include "llvm/IR/PassManager.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/Support/TargetRegistry.h"
#include "llvm/CodeGen/TargetLoweringObjectFileImpl.h"

using namespace llvm;

#define DEBUG_TYPE "vex-targetmachine"

extern "C" void LLVMInitializeVEXTarget() {
    
    // Register Target
    // Normal Scheduling
    RegisterTargetMachine<VEXNormalTargetMachine> X(TheVEXTarget);
    // New Scheduling
    RegisterTargetMachine<VEXNewTargetMachine> Y(TheVEXNewTarget);
    
}

static std::string computeDataLayout() {
    std::string Ret = "";
    
    Ret += "e";
    
    Ret += "-m:m";
    
    Ret += "-p:32:32";
    
    // 8 and 16 bit integers only need no have natural alignment, but try to
    // align them to 32 bits. 64 bit integers have natural alignment.
    Ret += "-i8:8:32-i16:16:32-i64:64";
    
    // 32 bit registers are always available and the stack is at least 64 bit
    // aligned.
    Ret += "-n32-S64";
    
    DEBUG(errs() << "Target Machine\n");
    return Ret;
}

// DataLayout --> Little-endian, 32-bit pointer/ABI/alignment
// The Stack is alwats 32 bytes aligned
// On function prologue, the stack is created by decrementin
// its pointer. Once decremented, all references are done with positive
// offset from the stack/frame pointer, using StackGrowsUp enables
// an easier handling.
// Using CodeModel::Large enables differente CALL behavior
VEXTargetMachine::
VEXTargetMachine(const Target &T, StringRef TT,
                 StringRef CPU, StringRef FS, const TargetOptions &Options,
                 Reloc::Model RM, CodeModel::Model CM,
                 CodeGenOpt::Level OL,
                 bool isNewScheduling)
    // - Default is normal Scheduling
    : LLVMTargetMachine(T, computeDataLayout(), TT, CPU, FS, Options, RM, CM, OL),
        isNewScheduling(isNewScheduling),
        TLOF(make_unique<TargetLoweringObjectFileELF>()),
        Subtarget(TT, CPU, FS, isNewScheduling, RM, *this){
    DEBUG(errs() << "Target Machine  2\n");
    initAsmInfo();
}

VEXTargetMachine::~VEXTargetMachine() {}

VEXNormalTargetMachine::
VEXNormalTargetMachine(const Target &T, StringRef TT,
                       StringRef CPU, StringRef FS, const TargetOptions &Options,
                       Reloc::Model RM, CodeModel::Model CM,
                       CodeGenOpt::Level OL)
: VEXTargetMachine(T, TT, CPU, FS, Options, RM, CM, OL, false) {}

void VEXNormalTargetMachine::anchor() {}

VEXNewTargetMachine::
VEXNewTargetMachine(const Target &T, StringRef TT,
                    StringRef CPU, StringRef FS, const TargetOptions &Options,
                    Reloc::Model RM, CodeModel::Model CM,
                    CodeGenOpt::Level OL)
: VEXTargetMachine(T, TT, CPU, FS, Options, RM, CM, OL, true) {}

void VEXNewTargetMachine::anchor() {}

//const VEXSubtarget *
//VEXTargetMachine::getSubtargetImpl(const Function &F) const {
//    if (Subtarget)
//        return Subtarget;
//    return &DefaultSubtarget;
//}

namespace {

// @ VEXPassConfig{
//  VEX Code Generator Pass COnfiguration Options
    class VEXPassConfig : public TargetPassConfig {
    
    public:
        VEXPassConfig(VEXTargetMachine *TM, PassManagerBase &PM)
        : TargetPassConfig(TM, PM){}
        
        VEXTargetMachine &getVEXTargetMachine() const {
            return getTM<VEXTargetMachine>();
        }
        
//        const VEXSubtarget &getVEXSubtarget() const {
//            return *getVEXTargetMachine().getSubtargetImpl();
//        }
    
        bool addInstSelector() override;
    };
}

bool VEXPassConfig::addInstSelector(){
    addPass(createVEXISelDag(getVEXTargetMachine()));
    return false;
}

TargetPassConfig *VEXTargetMachine::createPassConfig(PassManagerBase &PM){
    return new VEXPassConfig(this, PM);
}




