//
//  TreeHeightReductionPass.cpp
//  LLVM
//
//  Created by Tiago Trevisan Jost on 4/17/16.
//
//

#include "VEX.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Operator.h"
#include "llvm/Pass.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"

#define DEBUG_TYPE "vex-thr"

using namespace llvm;

namespace {
    
class VEXTreeHeightReductionPass : public FunctionPass {
    
    std::map<Instruction *, int> Heights;
    
public:
    static char ID;
    
    VEXTreeHeightReductionPass() : FunctionPass(ID) {
        
    }
    
    const char *getPassName() const override {
        return "VEX Tree Height Reduction Pass";
    }
    
    /// Iterate over the functions and promote the computation of interesting
    // sext instructions.
    bool runOnFunction(Function &F) override;
    
    void computeHeights(Function &F);

};
    
}

void VEXTreeHeightReductionPass::computeHeights(Function &F) {
    
    for (Function::iterator MBB = F.begin(), MBBE = F.end(); MBB != MBBE; ++MBB) {
        
        for (BasicBlock::iterator Inst = MBB->begin(), InstE = MBB->end(); Inst != InstE; ++Inst) {
            
            
            
        }
    }
    
}

bool VEXTreeHeightReductionPass::runOnFunction(llvm::Function &F) {
    
    DEBUG(dbgs() << F.getName());
    for (Function::iterator MBB = F.begin(), MBBE = F.end(); MBB != MBBE; ++MBB) {
        
        for (BasicBlock::iterator Inst = MBB->begin(), InstE = MBB->end(); Inst != InstE; ++Inst) {
            
            
            
        }
    }
    return false;
}

char VEXTreeHeightReductionPass::ID = 0;

FunctionPass *llvm::createVEXTreeHeightReductionPass() {
    return new VEXTreeHeightReductionPass();
}

