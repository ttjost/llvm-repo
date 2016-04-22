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

    // We have two vectors with the same content. However, we sort them differently
    // Here we create a vector in order to properly sort the heights of the tree;
    std::multimap<unsigned, Instruction *> HeightsByLevel;
    std::map<Instruction *, unsigned> HeightsByInstrOrder;

    std::vector<Instruction *> Roots;
    std::deque<Value *> Leaves;

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

    // Huffman Optimization for Tree Height Reduction
    void BalanceTree(Instruction *I);
    bool isLeaf(Instruction *I);
    void ReplaceAllLeaves();
    void removeUnrelatedNodes();
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

    if (isValidOperation(I) && HeightsByInstrOrder.find(I) == HeightsByInstrOrder.end()) {

        unsigned max = 0;
        Instruction *FirstOp, *SecondOp;

        FirstOp = dyn_cast<Instruction>(I->getOperand(0));
        SecondOp = dyn_cast<Instruction>(I->getOperand(1));

        if (FirstOp) {
            if (HeightsByInstrOrder.find(FirstOp) != HeightsByInstrOrder.end()) {
                max = max > HeightsByInstrOrder[FirstOp] ? max : HeightsByInstrOrder[FirstOp];
            }
        }

        if (SecondOp) {
            if (HeightsByInstrOrder.find(SecondOp) != HeightsByInstrOrder.end()) {
                max = max > HeightsByInstrOrder[SecondOp] ? max : HeightsByInstrOrder[SecondOp];
            }
        }
        HeightsByInstrOrder[I] = 1 + max;
        HeightsByLevel.insert(std::pair<unsigned, Instruction *>(1 + max, I));

        DEBUG(dbgs() << "Instruction: " << I->getName() << " Height: " << HeightsByInstrOrder[I] << "\n");
    }
}

void VEXTreeHeightReductionPass::computeHeights(BasicBlock &BB) {
    
    for (BasicBlock::iterator Inst = BB.begin(), InstE = BB.end(); Inst != InstE; ++Inst) {
        computeHeight(Inst);
    }
}

bool VEXTreeHeightReductionPass::isLeaf(Instruction *I) {

    if (HeightsByInstrOrder[I] == 1)
        return true;
    else
        return false;
}

void VEXTreeHeightReductionPass::ReplaceAllLeaves() {

    std::multimap<unsigned, Instruction *>::iterator it = HeightsByLevel.begin();
    std::multimap<unsigned, Instruction *>::iterator itEnd = HeightsByLevel.end();
    
//    Instruction *NewInstr;
//    IRBuilder<> Builder(HeightsByLevel.rbegin()->second);
    while (it->first == 1 && it != itEnd) {
        Instruction *I = it->second;

//        NewInstr = I->clone();
//        Builder.Insert(NewInstr);
//        I->replaceAllUsesWith(NewInstr);
//        I->eraseFromParent();
//        Leaves.push_back(cast<Instruction>(NewInstr));
        Leaves.push_back(cast<Instruction>(I));
        ++it;
    }
}

void VEXTreeHeightReductionPass::removeUnrelatedNodes() {
    
    unsigned LastLevel = HeightsByLevel.rbegin()->first;
    for (std::multimap<unsigned, Instruction *>::iterator it = HeightsByLevel.begin();
         it != HeightsByLevel.end();) {
        
        bool isPresented = false;
        
        if (it->first == LastLevel) {
            ++it;
            isPresented = true;
            continue;
        }
        
        for (Value::use_iterator i = (it->second)->use_begin(),
             e = (it->second)->use_end(); i != e; ++i) {
                
             Instruction *Use = cast<Instruction>(i->getUser());
             if (HeightsByInstrOrder.find(Use) != HeightsByInstrOrder.end())
                 isPresented = true;
        }
        
        if (!isPresented) {
            std::multimap<unsigned, Instruction *>::iterator tempIt = it++;
            HeightsByLevel.erase(tempIt);
            HeightsByInstrOrder.erase(tempIt->second);
        } else
            ++it;
    }
    
}

void VEXTreeHeightReductionPass::BalanceTree(Instruction *I) {

    std::vector<Instruction *> WorkList;

    assert(I->getNumOperands() == 2 && "Number of Operands should be 2");
    WorkList.push_back(dyn_cast<Instruction>(I->getOperand(0)));
    WorkList.push_back(dyn_cast<Instruction>(I->getOperand(1)));

    while (!WorkList.empty()) {

        Instruction *T = WorkList.back();
        WorkList.pop_back();

        if (std::find(Roots.begin(), Roots.end(), T) != Roots.end())
            llvm_unreachable("We do not implement subtraction yet. This is not difficult to support, though");
        else
            if (!isLeaf(I) && T->getOpcode() == I->getOpcode()) {
                assert(T->getNumOperands() == 2 && "Number of Operands should be 2");
                WorkList.push_back(dyn_cast<Instruction>(T->getOperand(0)));
                WorkList.push_back(dyn_cast<Instruction>(T->getOperand(1)));
            }
    }

    IRBuilder<> Builder(I);
    Value *R1;

    while (Leaves.size() > 1) {
        Instruction *Ra1 = dyn_cast<Instruction>(Leaves.front());
        Leaves.pop_front();
        Instruction *Rb1 = cast<Instruction>(Leaves.front());
        Leaves.pop_front();

        R1 = Builder.CreateAdd(Ra1, Rb1);

        Leaves.push_back(R1);
    }

    I->replaceAllUsesWith(R1);

    for (std::multimap<unsigned, Instruction *>::reverse_iterator it = HeightsByLevel.rbegin(); it != HeightsByLevel.rend(); ++it) {
        if (it->first != 1)
            (it->second)->eraseFromParent();
    }
}

void VEXTreeHeightReductionPass::FindRoots() {

    // We sure must insert the last node as root
    Roots.push_back(HeightsByLevel.rbegin()->second);

    for (std::map<Instruction *, unsigned>::reverse_iterator it = HeightsByInstrOrder.rbegin(); it != HeightsByInstrOrder.rend(); ++it) {
        Instruction *I = it->first;

        if (isLeaf(I))
            continue;
        
        for (Value::use_iterator i = I->use_begin(), e = I->use_end(); i != e; ++i) {
            
        }
        if (I->getNumUses() > 1) {
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
    DEBUG(BB.dump());
    
    HeightsByLevel.clear();
    HeightsByInstrOrder.clear();
    Roots.clear();
    Leaves.clear();
    
    computeHeights(BB);
    
    // There is no way to improve over trees with 3 or less nodes.
    // We just leave the way it is.
    if (HeightsByLevel.size() > 3) {
        
        removeUnrelatedNodes();
        ReplaceAllLeaves();
        FindRoots();
        
        return true;
    }
    
    
    return false;
}

char VEXTreeHeightReductionPass::ID = 0;

BasicBlockPass *llvm::createVEXTreeHeightReductionPass() {
    return new VEXTreeHeightReductionPass();
}

