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
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

namespace llvm {
    FunctionPass *createVEXDataReuseTrackingPass();
}

namespace {
    
class VEXDataReuseTrackingPass: public FunctionPass {
    
    void getAnalysisUsage(AnalysisUsage &AU) const override;
    
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

}

bool VEXDataReuseTrackingPass::runOnFunction(Function &F) {
    
    errs() << F.getName() << "\n";
    
    for (auto MBB = F.begin(), MBBE = F.end(); MBBE != MBB; ++MBB) {
        if (LoadInst *Inst = dyn_cast<LoadInst>(&MBB->front())) {
            for (unsigned i = 0, e = Inst->getNumOperands(); i != e; ++i)
                Inst->getOperand(i)->dump();
            Inst->dump();
        }
    }
    return false;
}

char VEXDataReuseTrackingPass::ID = 0;
static RegisterPass<VEXDataReuseTrackingPass> X("VEXDataReuseTracking", "Data Reuse Tracking Pass", false, false);

FunctionPass *llvm::createVEXDataReuseTrackingPass() {
    return new VEXDataReuseTrackingPass();
}

