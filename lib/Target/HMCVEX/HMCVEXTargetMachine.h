//
//  HMCVEXTargetMachine.h
//  LLVM
//
//  Created by Tiago Trevisan Jost on 4/16/15.
//
//

#ifndef LLVM_HMCVEXTARGETMACHINE_H
#define LLVM_HMCVEXTARGETMACHINE_H

//#include "HMCVEXConfig.h"

#include "HMCVEXSubtarget.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/CodeGen/SelectionDAGISel.h"
#include "llvm/Target/TargetFrameLowering.h"
#include "llvm/Target/TargetMachine.h"
#include "llvm/CodeGen/TargetLoweringObjectFileImpl.h"

namespace llvm {
    
    class formatted_raw_ostream;
    class HMCVEXRegisterInfo;
    
class HMCVEXTargetMachine : public LLVMTargetMachine{
    
private:
    bool isNewScheduling;

    HMCVEXSubtarget Subtarget;
    
    mutable StringMap<std::unique_ptr<HMCVEXSubtarget>> SubtargetMap;

    std::unique_ptr<TargetLoweringObjectFile> TLOF;

public:
    HMCVEXTargetMachine(const Target &T, const Triple TT, StringRef CPU,
                      StringRef FS, const TargetOptions &Options,
                      Reloc::Model RM, CodeModel::Model CM,
                      CodeGenOpt::Level OL, bool isNewScheduling);
    ~HMCVEXTargetMachine() override;

    const HMCVEXSubtarget *getSubtargetImpl() const {
        return &Subtarget;
    }
    
    const HMCVEXSubtarget *getSubtargetImpl(const Function &) const override {
        return &Subtarget;
    }

    // \brief Reset the subtarget for the HMCVEX target.
    void resetSubtarget(MachineFunction *MF);
    
    // Pass Pipeline Configuration
    virtual TargetPassConfig *createPassConfig(PassManagerBase &PM);
    
    bool isNewSchedulingAlgorithm() const { return isNewScheduling; }

    //bool isVLIWScheduling() const { return EnableVLIWScheduling; }

    TargetLoweringObjectFile *getObjFileLowering() const override {
      return TLOF.get();
    }

};
 
// HMCVEXRegTargetMachine - HMCVEX (Normal Scheduling) Target Machine
class HMCVEXNormalTargetMachine : public HMCVEXTargetMachine{
    virtual void anchor();
public:
    HMCVEXNormalTargetMachine(const Target &T, const Triple TT,
                           StringRef CPU, StringRef FS, const TargetOptions &Options,
                           Reloc::Model RM, CodeModel::Model CM,
                           CodeGenOpt::Level OL);
};
    
// HMCVEXRegTargetMachine - HMCVEX (New Scheduling) Target Machine
class HMCVEXNewTargetMachine : public HMCVEXTargetMachine{
    virtual void anchor();
public:
    HMCVEXNewTargetMachine(const Target &T, const Triple TT,
                        StringRef CPU, StringRef FS, const TargetOptions &Options,
                        Reloc::Model RM, CodeModel::Model CM,
                        CodeGenOpt::Level OL);
};
    
}


#endif
