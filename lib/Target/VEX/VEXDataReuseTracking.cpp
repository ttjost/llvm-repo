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
#include "VEXTargetMachine.h"

using namespace llvm;

namespace llvm {
    FunctionPass *createVEXDataReuseTrackingPass(VEXTargetMachine &TM);
    MachineFunctionPass *createVEXDataReuseTrackingPreRegAllocPass(VEXTargetMachine &TM);
}

namespace {
    
class VEXDataReuseTrackingPass: public FunctionPass {
    
    void getAnalysisUsage(AnalysisUsage &AU) const override;
    AliasAnalysis *AA;
    TargetMachine &TM;

public:
    static char ID;
    VEXDataReuseTrackingPass(TargetMachine &TM)
    : FunctionPass(ID), TM(TM) {
        
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
//static RegisterPass<VEXDataReuseTrackingPass> X("VEXDataReuseTracking", "Data Reuse Tracking Pass", false, false);

FunctionPass *llvm::createVEXDataReuseTrackingPass(VEXTargetMachine &TM) {
    return new VEXDataReuseTrackingPass(TM);
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
    TargetMachine &TM;

public:
    static char ID;
    VEXDataReuseTrackingPreRegAllocPass(TargetMachine &TM)
        : MachineFunctionPass(ID), TM(TM) {

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

    DataReuseInfo* DataInfo = static_cast<const VEXTargetMachine &>(TM).getDataReuseInfo();

    for (auto MBB = MF.begin(), MBBE = MF.end(); MBBE != MBB; ++MBB) {
        for (auto Inst = MBB->begin(), InstE = MBB->end(); Inst != InstE; ++Inst) {

            Inst->dump();
            if (Inst->mayLoad() || Inst->mayStore()) {
//                for (unsigned i = 0, e = Inst->getNumOperands();
//                     i != e; ++i) {
//                    if (Inst->getOperand(i).isGlobal())
//                        errs() << "Is Global\n";
//                }

                MachineMemOperand *MMO;
                MMO = *Inst->memoperands_begin();
                const Value *V = MMO->getValue();
                if (V->getName().startswith("spm_")){
                    SPMVariable var(V->getName());
                    if(Inst->mayLoad())
                        var.setLoad();
                    if(Inst->mayStore())
                        var.setStore();
                    DataInfo->AddVariable(var);
                    Inst->dump();
                    dbgs() << "Should be in the SPMs\n";
                }
            }
//        if (LoadInst *Inst = dyn_cast<LoadInst>(&MBB->front())) {
//            for (unsigned i = 0, e = Inst->getNumOperands(); i != e; ++i)
//                Inst->getOperand(i)->dump();
//            Inst->dump();
//        }
        }
    }
    std::vector<SPMVariable> Variables = DataInfo->getVariables();
    for (auto Var : Variables)
        dbgs() << "Name:" << Var.getName();
    return false;
}

char VEXDataReuseTrackingPreRegAllocPass::ID = 0;
//static RegisterPass<VEXDataReuseTrackingPreRegAllocPass> Y("VEXDataReuseTrackingPreRegAlloc", "Data Reuse Tracking PreRegAlloc Pass", false, false);

MachineFunctionPass *llvm::createVEXDataReuseTrackingPreRegAllocPass(VEXTargetMachine &TM) {
    return new VEXDataReuseTrackingPreRegAllocPass(TM);
}
