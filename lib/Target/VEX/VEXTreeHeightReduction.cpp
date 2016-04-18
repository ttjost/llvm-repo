//
//  TreeHeightReductionPass.cpp
//  LLVM
//
//  Created by Tiago Trevisan Jost on 4/17/16.
//
//

#include "VEX.h"
#include "llvm/IR/BasicBlock.h"
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
    
class VEXTreeHeightReductionPass : public BasicBlockPass {
    
    std::map<Instruction *, int> Heights;
    
public:
    static char ID;
    
    VEXTreeHeightReductionPass() : BasicBlockPass(ID) {
        
    }
    
    const char *getPassName() const override {
        return "VEX Tree Height Reduction Pass";
    }
    
    /// Iterate over the functions and promote the computation of interesting
    // sext instructions.
    bool runOnBasicBlock(BasicBlock &BB) override;
    
    void computeHeights(BasicBlock &BB);
    bool isValidOperation(Instruction* I);
    void computeHeight(Instruction* I);

    Instruction* getLaterDefiner(Instruction I);

};
    
}

bool VEXTreeHeightReductionPass::isValidOperation(Instruction* I) {

    if (!isa<BinaryOperator>(I))
        return false;

    BinaryOperator* AluInst = cast<BinaryOperator>(I);

    if (AluInst->getOpcode() == Instruction::Add ||
        AluInst->getOpcode() == Instruction::Mul)
        return true;

    return false;
}

void VEXTreeHeightReductionPass::computeHeight(Instruction* I) {

    if (isValidOperation(I) && Heights.find(I) == Heights.end()) {

        DEBUG(I->dump());

        int max = 0;
        Instruction *FirstOp, *SecondOp;

        FirstOp = dyn_cast<Instruction>(I->getOperand(0));
        SecondOp = dyn_cast<Instruction>(I->getOperand(1));

        if (FirstOp) {
            if (Heights.find(FirstOp) != Heights.end()) {
                max = max > Heights[FirstOp] ? max : Heights[FirstOp];
            }
        }

        if (SecondOp) {
            if (Heights.find(SecondOp) != Heights.end()) {
                max = max > Heights[SecondOp] ? max : Heights[SecondOp];
            }
        }
        Heights[I] = 1 + max;

        DEBUG(dbgs() << "Instruction: " << I->getName() << " Height: " << Heights[I] << "\n");
    }
}

void VEXTreeHeightReductionPass::computeHeights(BasicBlock &BB) {
    
    for (BasicBlock::iterator Inst = BB.begin(), InstE = BB.end(); Inst != InstE; ++Inst) {
        computeHeight(Inst);
    }
}

Instruction* VEXTreeHeightReductionPass::getLaterDefiner(Instruction I) {

    assert(isa<BinaryOperator>(I) && "Something wrong. Instruction should be BinaryOperator");

    Instruction *FirstOp = cast<Instruction>(I->getOperand(0));
    Instruction *SecondOp = cast<Instruction>(I->getOperand(1));

    if (Heights[SecondOp] > Heights[FirstOp])
        return SecondOp;
    else
        return FirstOp;
}

bool VEXTreeHeightReductionPass::meetsConditions(Instruction *I) {

    if (Instruction->getOpcode() == Instruction::Add ||
        Instruction->getOpcode() == Instruction::Sub)


    else if (Instruction->getOpcode() == Instruction::Mul)

}

bool VEXTreeHeightReductionPass::runOnBasicBlock(BasicBlock &BB) {
    
    DEBUG(dbgs() << "VEX Tree Height Reduction!\n ");
    computeHeights(BB);

    for (std::map<Instruction, int>::iterator it = Heights.begin(); it != Heights.end(); ++it) {

        if (meetsConditions(I))

        std::cout << it->first << " => " << it->second << '\n';

    }
    return false;
}

char VEXTreeHeightReductionPass::ID = 0;

BasicBlockPass *llvm::createVEXTreeHeightReductionPass() {
    return new VEXTreeHeightReductionPass();
}

