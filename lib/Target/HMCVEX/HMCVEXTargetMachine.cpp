//===-- HMCVEXTargetMachine.cpp - Define TargetMachine for HMCVEX -------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// Implements the info about HMCVEX target spec.
//
//===----------------------------------------------------------------------===//


#include "HMCVEXTargetMachine.h"
#include "HMCVEX.h"
#include "HMCVEXVLIWPacketizer.cpp"
#include "HMCVEXMachineScheduler.h"
#include "HexagonMachineScheduler.h"
#include "llvm/IR/PassManager.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/Support/TargetRegistry.h"
#include "llvm/CodeGen/TargetLoweringObjectFileImpl.h"
#include "llvm/Support/CommandLine.h"

using namespace llvm;

#define DEBUG_TYPE "HMCVEX-targetmachine"

static cl::opt<bool> EnableVLIWScheduling("enable-vliw-scheduling",
                                          cl::Hidden, cl::init(true),
                                          cl::desc("Enable VLIW Scheduling"));

cl::opt<bool> UseHexagonScheduler("enable-hexagonsched",
                                cl::Hidden, cl::init(true),
                                cl::desc("Enable Hexagon Scheduler"));

// This might never be used
// We will probably generate code for SPM right before Register Allocation
static cl::opt<bool> PreIsel("pre-isel",
                                cl::Hidden, cl::init(false),
                                cl::desc("Enable Code Generation for ScratchPad Memories before Instruction Selection"));

extern "C" void LLVMInitializeHMCVEXTarget() {
    
    // Register Target
    // Normal Scheduling
    RegisterTargetMachine<HMCVEXNormalTargetMachine> X(TheHMCVEXTarget);
    // New Scheduling
    RegisterTargetMachine<HMCVEXNewTargetMachine> Y(TheHMCVEXNewTarget);
    
}

static std::string computeDataLayout() {
    std::string Ret = "";
    
    Ret += "E";
    
    // Added MM_None
    //Ret += "-m:n";
    
    Ret += "-p:32:32";
    
    // 8 and 16 bit integers only need no have natural alignment, but try to
    // align them to 32 bits. 64 bit integers have natural alignment.
    Ret += "-i8:8:32-i16:16:32-i32:32-i64:64";
    
    // 32 bit registers are always available and the stack is at least 64 bit
    // aligned.
    Ret += "-f128:64-n32-S32";

    return Ret;
}

// DataLayout --> Little-endian, 32-bit pointer/ABI/alignment
// The Stack is alwats 32 bytes aligned
// On function prologue, the stack is created by decrementin
// its pointer. Once decremented, all references are done with positive
// offset from the stack/frame pointer, using StackGrowsUp enables
// an easier handling.
// Using CodeModel::Large enables differente CALL behavior
HMCVEXTargetMachine::
HMCVEXTargetMachine(const Target &T, const Triple TT,
                 StringRef CPU, StringRef FS, const TargetOptions &Options,
                 Reloc::Model RM, CodeModel::Model CM,
                 CodeGenOpt::Level OL,
                 bool isNewScheduling)
    // - Default is normal Scheduling
    : LLVMTargetMachine(T, computeDataLayout(), TT, CPU, FS, Options, RM, CM, OL),
        isNewScheduling(isNewScheduling),
        TLOF(make_unique<TargetLoweringObjectFileELF>()),
        Subtarget(TT, CPU, FS, isNewScheduling, EnableVLIWScheduling, RM, *this){
    initAsmInfo();
}

HMCVEXTargetMachine::~HMCVEXTargetMachine() {}

HMCVEXNormalTargetMachine::
HMCVEXNormalTargetMachine(const Target &T, const Triple TT,
                       StringRef CPU, StringRef FS, const TargetOptions &Options,
                       Reloc::Model RM, CodeModel::Model CM,
                       CodeGenOpt::Level OL)
: HMCVEXTargetMachine(T, TT, CPU, FS, Options, RM, CM, OL, false) {}

void HMCVEXNormalTargetMachine::anchor() {}

HMCVEXNewTargetMachine::
HMCVEXNewTargetMachine(const Target &T, const Triple TT,
                    StringRef CPU, StringRef FS, const TargetOptions &Options,
                    Reloc::Model RM, CodeModel::Model CM,
                    CodeGenOpt::Level OL)
: HMCVEXTargetMachine(T, TT, CPU, FS, Options, RM, CM, OL, true) {}

void HMCVEXNewTargetMachine::anchor() {}

//const HMCVEXSubtarget *
//HMCVEXTargetMachine::getSubtargetImpl(const Function &F) const {
//    if (Subtarget)
//        return Subtarget;
//    return &DefaultSubtarget;
//}

static ScheduleDAGInstrs *createHMCVEXVLIWMachineSched(MachineSchedContext *C) {
    if (UseHexagonScheduler)
        return new NewHMCVEXVLIWMachineScheduler(C, make_unique<NewHMCVEXConvergingVLIWScheduler>());
    else
        return new HMCVEXVLIWMachineScheduler(C, make_unique<ConvergingHMCVEXVLIWScheduler>());
}

static MachineSchedRegistry
SchedCustomRegistry("HMCVEX", "Run HMCVEX custom scheduler",
                    createHMCVEXVLIWMachineSched);

namespace {

// @ HMCVEXPassConfig{
//  HMCVEX Code Generator Pass Configuration Options
    class HMCVEXPassConfig : public TargetPassConfig {
    
    public:
        HMCVEXPassConfig(HMCVEXTargetMachine *TM, PassManagerBase &PM)
        : TargetPassConfig(TM, PM){
            substitutePass(&PostRASchedulerID, &PostMachineSchedulerID);
        }
        
        HMCVEXTargetMachine &getHMCVEXTargetMachine() const {
            return getTM<HMCVEXTargetMachine>();
        }
        
        const HMCVEXSubtarget &getHMCVEXSubtarget() const {
            return *getHMCVEXTargetMachine().getSubtargetImpl();
        }
        
        ScheduleDAGInstrs *
        createMachineScheduler(MachineSchedContext *C) const override {
            return createHMCVEXVLIWMachineSched(C);
        }
        
        bool addInstSelector() override;
        void addPreEmitPass() override;
        
    };
}

bool HMCVEXPassConfig::addInstSelector() {
    addPass(createHMCVEXISelDag(getHMCVEXTargetMachine()));
    return false;
}

void HMCVEXPassConfig::addPreEmitPass() {
        addPass(createHMCVEXPacketizer(EnableVLIWScheduling, getHMCVEXTargetMachine()), false);
}

TargetPassConfig *HMCVEXTargetMachine::createPassConfig(PassManagerBase &PM){
    return new HMCVEXPassConfig(this, PM);
}


