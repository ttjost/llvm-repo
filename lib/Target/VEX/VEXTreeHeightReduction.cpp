//===-- VEXTreeHeightReduction.cpp - Tree Height Reduction Pass -------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// Implements the a Tree Height reduction pass for the VEX target.
//
// Reference: "Incremental For High Tree Height Reduction Level Synthesis"
//
//===----------------------------------------------------------------------===//
//  Created by Tiago Trevisan Jost on 4/17/16.


#include "VEX.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Operator.h"
#include "llvm/Pass.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"

#define DEBUG_TYPE "vex-thr"

using namespace llvm;

namespace {
    
class VEXTreeHeightReductionPass : public BasicBlockPass {
    
    std::map<Instruction *, int> Heights;
    BasicBlock *basicblock;
    
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

    Instruction* getLaterDefiner(Instruction* I);
    Instruction* getEarlierDefiner(Instruction* I);
    
    bool meetsConditions(Instruction *I);
    void associativityAnalysis(Instruction *I);
    
    Instruction* findHighestAvailableOperation(Instruction *I);
    
    Instruction* climbUp(unsigned Opcode, Instruction *FirstOp, Instruction *SecondOp);
    
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

Instruction* VEXTreeHeightReductionPass::getLaterDefiner(Instruction* I) {

    I->dump();
    assert(isa<BinaryOperator>(I) && "Something wrong. Instruction should be BinaryOperator");

    Instruction *FirstOp = cast<Instruction>(I->getOperand(0));
    Instruction *SecondOp = cast<Instruction>(I->getOperand(1));

    if (Heights[SecondOp] > Heights[FirstOp])
        return SecondOp;
    else
        return FirstOp;
}

Instruction* VEXTreeHeightReductionPass::getEarlierDefiner(Instruction* I) {
    
    assert(isa<BinaryOperator>(I) && "Something wrong. Instruction should be BinaryOperator");
    
    Instruction *FirstOp = dyn_cast<Instruction>(I->getOperand(0));
    Instruction *SecondOp = dyn_cast<Instruction>(I->getOperand(1));
    
    if (!FirstOp || (Heights.find(FirstOp) == Heights.end()))
        return nullptr;
    
    if (!SecondOp || (Heights.find(SecondOp) == Heights.end()))
        return nullptr;
    
    if (Heights[SecondOp] < Heights[FirstOp])
        return SecondOp;
    else
        return FirstOp;
}

/* ************************************************
 Necessary and sufficient conditions for an operation to be hoisted:
1. One of its definers must be available at least 
    two cycles earlier than itself on the path selected.
2. current-op’s later-definer has a definer which is available
    at least two cycles earlier than current_op’s cycle on that path.
3. If current-op is ADD or SUB then later-definer has to be either ADD
    or SUB. (These legal combinations constitute a ‘legal’ chain). If, 
    on the other hand, current-op is MUL, the later-definer might be 
    either MUL, ADD or SUB.
4  Both current-op and its definers have two uses variables.
5. All relevant nodes on the path (into which new operations
    are added) have free resources.
************************************************* */

bool VEXTreeHeightReductionPass::meetsConditions(Instruction *I) {
    
    Instruction* LaterDefiner = getLaterDefiner(I);
    Instruction* EarlierDefiner = getEarlierDefiner(I);
        
    if (!LaterDefiner || !EarlierDefiner)
        return false;
    
    // Condition 1
    if ((Heights[I] - Heights[EarlierDefiner] < 2) &&
        (Heights[I] - Heights[LaterDefiner] < 2))
        return false;
    
    // Condition2
    // Isn't condition 2 always satisfied?
    
    // Condition 3
    if (! ((LaterDefiner->getOpcode() == Instruction::Add ||
        LaterDefiner->getOpcode() == Instruction::Sub) &&
        (I->getOpcode() == Instruction::Add ||
        I->getOpcode() == Instruction::Sub))) {
        return false;
    }
    
    // Condition 4
    // I don't think this is really necessary.
    
    // Condition 5
    // We don't care about resources.
    
    return true;
}

Instruction *VEXTreeHeightReductionPass::findHighestAvailableOperation(Instruction *I) {
    for (std::map<Instruction *, int>::iterator it = Heights.begin(); it != Heights.end(); ++it) {
        if (Heights[it->first] == 1)
            continue;
        if (meetsConditions(it->first))
            return it->first;
    }
    return nullptr;
}

Instruction* VEXTreeHeightReductionPass::climbUp(unsigned Opcode, Instruction *FirstOp, Instruction *SecondOp) {
    
    
    
}

void VEXTreeHeightReductionPass::associativityAnalysis(Instruction *I) {
    
    if (I->getOpcode() == Instruction::Sub)
        llvm_unreachable("We do not implement subtraction yet. This is not difficult to support, though");
    
    Instruction *EarliestOp = findHighestAvailableOperation(I);
    
    if (EarliestOp && EarliestOp != I) {
        BasicBlock* BB = I->getParent();
//        climbUp(I->getOpcode(), getEarlierDefiner(EarliestOp), getEarlierDefiner(I));
        I->dump();
        EarliestOp->dump();
        IRBuilder<> Builder(I);
        Value* FirstAdd = Builder.CreateAdd(getEarlierDefiner(EarliestOp), getEarlierDefiner(I));
        EarliestOp->replaceAllUsesWith(FirstAdd);
        computeHeight(cast<Instruction>(FirstAdd));
        
        Value *SecondAdd = Builder.CreateAdd(FirstAdd, getLaterDefiner(EarliestOp));
        I->replaceAllUsesWith(SecondAdd);
        computeHeight(cast<Instruction>(SecondAdd));
        
//        BB->getInstList().insert(EarliestOp, cast<Instruction>(FirstAdd));
//        BB->getInstList().insert(I, SecondAdd);
        
        EarliestOp->eraseFromParent();
        I->eraseFromParent();
        
//        Heights.erase(EarliestOp);
//        Heights.erase(I);
    }
}

bool VEXTreeHeightReductionPass::runOnBasicBlock(BasicBlock &BB) {
    
    DEBUG(dbgs() << "VEX Tree Height Reduction!\n ");
    computeHeights(BB);

    for (std::map<Instruction *, int>::iterator it = Heights.begin(); it != Heights.end(); ++it) {
        if (Heights[it->first] == 1)
            continue;
        if (meetsConditions(it->first)) {
            DEBUG((it->first)->dump());
            associativityAnalysis(it->first);
        }

    }
    
    BB.dump();
//    for (Instruction *I = BB.begin(), *E = BB.end(); I != E; ++I)
//        I->dump();
    
    return false;
}

char VEXTreeHeightReductionPass::ID = 0;

BasicBlockPass *llvm::createVEXTreeHeightReductionPass() {
    return new VEXTreeHeightReductionPass();
}

