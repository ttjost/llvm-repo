//===---------------        VEXDataReuseTracking.cpp        ---------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements a pass that keeps track on the reused data on the
// application.
//
//===----------------------------------------------------------------------===//

#include "llvm/ADT/DenseMap.h"
#include "llvm/ADT/SmallPtrSet.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Dominators.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Operator.h"
#include "llvm/Pass.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineInstr.h"
#include "llvm/CodeGen/MachineMemOperand.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

namespace llvm {
    FunctionPass *createVEXDataReuseTrackingPass();
    MachineFunctionPass *createVEXDataReuseTrackingPreRegAllocPass();
}

namespace {
    
class VEXDataReuseTrackingPass: public FunctionPass {
    
    void getAnalysisUsage(AnalysisUsage &AU) const override;
    AliasAnalysis *AA;
public:
    static char ID;
    VEXDataReuseTrackingPass()
    : FunctionPass(ID) {
        
    }
    
    const char *getPassName() const override {
        return "VEX Data Reuse Tracking Pass";
    }
    
    bool runOnFunction(Function &F) override;
    
};

}

void VEXDataReuseTrackingPass::getAnalysisUsage(AnalysisUsage &AU) const {
    AU.addRequired<AliasAnalysis>();
}

bool VEXDataReuseTrackingPass::runOnFunction(Function &F) {
    AA = &getAnalysis<AliasAnalysis>();
    errs() << F.getName() << "\n";
    
    for (auto MBB = F.begin(), MBBE = F.end(); MBBE != MBB; ++MBB) {
        for (auto Inst = MBB->begin(), InstE = MBB->end(); Inst != InstE; ++Inst)
//        if (LoadInst *Inst = dyn_cast<LoadInst>(&MBB->front())) {
//            for (unsigned i = 0, e = Inst->getNumOperands(); i != e; ++i)
//                Inst->getOperand(i)->dump();
            Inst->dump();
//        }
    }
    return false;
}

char VEXDataReuseTrackingPass::ID = 0;
static RegisterPass<VEXDataReuseTrackingPass> X("VEXDataReuseTracking", "Data Reuse Tracking Pass", false, false);

FunctionPass *llvm::createVEXDataReuseTrackingPass() {
    return new VEXDataReuseTrackingPass();
}

//===----------------------------------------------------------------------===//
//
// This pass implements modifies Load and Store instructions to use SPMs.
//
//===----------------------------------------------------------------------===//

namespace {
class VEXDataReuseTrackingPreRegAllocPass: public MachineFunctionPass {

//    void getAnalysisUsage(AnalysisUsage &AU) const override;
//    AliasAnalysis *AA;
public:
    static char ID;
    VEXDataReuseTrackingPreRegAllocPass()
    : MachineFunctionPass(ID) {

    }

    const char *getPassName() const override {
        return "VEX Data Reuse Tracking Pass";
    }

    bool runOnMachineFunction(MachineFunction &MF) override;

};

}

//void VEXDataReuseTrackingPreRegAllocPass::getAnalysisUsage(AnalysisUsage &AU) const {
////    AU.addRequired<AliasAnalysis>();
//}

bool VEXDataReuseTrackingPreRegAllocPass::runOnMachineFunction(MachineFunction &MF) {
//    AA = &getAnalysis<AliasAnalysis>();
    errs() << MF.getName() << "\n";

    for (auto MBB = MF.begin(), MBBE = MF.end(); MBBE != MBB; ++MBB) {
        for (auto Inst = MBB->begin(), InstE = MBB->end(); Inst != InstE; ++Inst) {

            if (Inst->mayLoad() || Inst->mayStore()) {
                Inst->dump();
                for (unsigned i = 0, e = Inst->getNumOperands();
                     i != e; ++i) {
                    if (Inst->getOperand(i).isGlobal())
                        errs() << "Is Global\n";
                }
                MachineMemOperand *MMO;
                MMO = *Inst->memoperands_begin();
                const Value *V = MMO->getValue();
                if (V->getName().startswith("spm_"))
                    dbgs() << "Should be in the SPMs";
            }
//        if (LoadInst *Inst = dyn_cast<LoadInst>(&MBB->front())) {
//            for (unsigned i = 0, e = Inst->getNumOperands(); i != e; ++i)
//                Inst->getOperand(i)->dump();
//            Inst->dump();
//        }
        }
    }
    return false;
}

char VEXDataReuseTrackingPreRegAllocPass::ID = 0;
static RegisterPass<VEXDataReuseTrackingPreRegAllocPass> Y("VEXDataReuseTrackingPreRegAlloc", "Data Reuse Tracking PreRegAlloc Pass", false, false);

MachineFunctionPass *llvm::createVEXDataReuseTrackingPreRegAllocPass() {
    return new VEXDataReuseTrackingPreRegAllocPass();
}
