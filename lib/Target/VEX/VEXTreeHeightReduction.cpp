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
#include <deque>
#include <vector>
#include <map>

#define DEBUG_TYPE "vex-thr"

using namespace llvm;

namespace {
    
class VEXTreeHeightReductionPass : public BasicBlockPass {
    
    std::map<Instruction *, int> Heights;
    BasicBlock *basicblock;
    
    std::vector<Instruction *> Roots;
    std::deque<Value *> Leaves;

public:
    static char ID;
    
    VEXTreeHeightReductionPass() : BasicBlockPass(ID) {
        Heights.clear();
        Roots.clear();
        Leaves.clear();
    }
    
    const char *getPassName() const override {
        return "VEX Tree Height Reduction Pass";
    }
    
    /// Iterate over the functions and promote the computation of interesting
    // sext instructions.
    bool runOnBasicBlock(BasicBlock &BB) override;
    
    void sortHeights();
    void computeHeights(BasicBlock &BB);
    bool isValidOperation(Instruction* I);
    void computeHeight(Instruction* I);

    Instruction* getLaterDefiner(Instruction* I);
    Instruction* getEarlierDefiner(Instruction* I);
    
    bool meetsConditions(Instruction *I);
    void associativityAnalysis(Instruction *I);
    
    Instruction* findHighestAvailableOperation(Instruction *I);
    
    Instruction* climbUp(unsigned Opcode, Instruction *FirstOp, Instruction *SecondOp);

    // Huffman Optimization for Tree Height Reduction
    Instruction *getInstructionUse(Instruction *I);
    void BalanceTree(Instruction *I);
    bool isLeaf(Instruction *I);
    void getLeaves();
    void FindRoots();
    
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

template <typename T1, typename T2>
struct less_second {
    typedef std::pair<T1, T2> type;
    bool operator ()(type const& a, type const& b) const {
        return a.second < b.second;
    }
};

void VEXTreeHeightReductionPass::sortHeights() {

    // Here we create a vector in order to properly sort the heights of the tree;
    std::vector<std::pair<Instruction *, int> > sortedHeights;

    for (auto it = Heights.begin(); it != Heights.end(); ++it) {
        sortedHeights.push_back(*it);
    }
    std::sort(sortedHeights.begin(), sortedHeights.end(), less_second<Instruction *, int>());

    // We start over the construction with the correct order
    Heights.clear();

    for (unsigned i = 0, e = sortedHeights.size(); i != e; ++i) {
        Heights.insert(sortedHeights[i]);
    }

}

Instruction* VEXTreeHeightReductionPass::getLaterDefiner(Instruction* I) {

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

        DEBUG(dbgs() << "Reduce tree height!");
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
        
        Heights[EarliestOp] = 1;
        Heights[I] = 1;
    }
}

bool VEXTreeHeightReductionPass::isLeaf(Instruction *I) {

    if (Heights[I] == 1)
        return true;
    else
        return false;
}

void VEXTreeHeightReductionPass::getLeaves() {

    std::map<Instruction *, int>::iterator it = Heights.begin();
    std::map<Instruction *, int>::iterator itEnd = Heights.end();

    while (it->second == 1 && it != itEnd) {
        Leaves.push_back(it->first);
        ++it;
    }
}

void VEXTreeHeightReductionPass::BalanceTree(Instruction *I) {

    std::vector<Value *> WorkList;

    assert(I->getNumOperands() == 2 && "Number of Operands should be 2");
    WorkList.push_back(I->getOperand(0));
    WorkList.push_back(I->getOperand(1));

    while (!WorkList.empty()) {

        Instruction *T = cast<Instruction>(WorkList.back());
        WorkList.pop_back();

        if (std::find(Roots.begin(), Roots.end(), T) != Roots.end())
            llvm_unreachable("We do not implement subtraction yet. This is not difficult to support, though");
        else
            if (!isLeaf(I) && T->getOpcode() == I->getOpcode()) {
                assert(T->getNumOperands() == 2 && "Number of Operands should be 2");
                WorkList.push_back(T->getOperand(0));
                WorkList.push_back(T->getOperand(1));
            }
    }

    IRBuilder<> Builder(I);
    Value *R1;

    while (!Leaves.empty()) {
        Instruction *Ra1 = dyn_cast<Instruction>(Leaves.front());
        Leaves.pop_front();
        Instruction *Rb1 = cast<Instruction>(Leaves.front());
        Leaves.pop_front();

        R1 = Builder.CreateAdd(Ra1, Rb1);

        Leaves.push_back(R1);
    }

    I->replaceAllUsesWith(R1);

    for (std::map<Instruction *, int>::iterator it = Heights.begin(); it != Heights.end(); ++it) {
        (it->first)->eraseFromParent();
    }
}

Instruction *VEXTreeHeightReductionPass::getInstructionUse(Instruction *I) {

    for (std::map<Instruction *, int>::iterator it = Heights.begin(); it != Heights.end(); ++it) {
        Instruction *InstrUse = it->first;
        Instruction *Op1 = dyn_cast<Instruction>(InstrUse->getOperand(0));
        Instruction *Op2 = dyn_cast<Instruction>(InstrUse->getOperand(1));

        if (Op1 == I || Op2 == I) {
            return InstrUse;
        }
    }
    I->dump();
    llvm_unreachable("This should never be reached. We must always find a Use of this Instruction within our Tree.");
}

void VEXTreeHeightReductionPass::FindRoots() {

    // We sure must insert the last node as root
    Roots.push_back(Heights.rbegin()->first);

    for (std::map<Instruction *, int>::reverse_iterator it = Heights.rbegin(); it != Heights.rend(); ++it) {
        Instruction *I = it->first;

        if (isLeaf(I))
            continue;

        Instruction* InstrUse = getInstructionUse(I);
        if ((InstrUse->getOpcode() != I->getOpcode())) {
             llvm_unreachable("This should not be reached by our examples right now. We'll deal with this later.");
        }
    }

    while (!Roots.empty()) {
        BalanceTree(Roots.back());
        Roots.pop_back();
    }
}

bool VEXTreeHeightReductionPass::runOnBasicBlock(BasicBlock &BB) {
    
    DEBUG(dbgs() << "VEX Tree Height Reduction!\n");
    BB.dump();
    computeHeights(BB);

    sortHeights();

    getLeaves();

    if (!Heights.empty()) {

        DEBUG(dbgs() << "All nodes: ");
        for (std::map<Instruction *, int>::reverse_iterator it = Heights.rbegin(); it != Heights.rend(); ++it) {
            DEBUG((it->first)->dump());
        }

        DEBUG(dbgs() << "\nLeaves: ");
        for (auto it : Leaves) {
//            DEBUG(it->dump());
        }

        FindRoots();
    }

    if (!Heights.empty())
        FindRoots();
    
    BB.dump();
    
    return false;
}

char VEXTreeHeightReductionPass::ID = 0;

BasicBlockPass *llvm::createVEXTreeHeightReductionPass() {
    return new VEXTreeHeightReductionPass();
}

