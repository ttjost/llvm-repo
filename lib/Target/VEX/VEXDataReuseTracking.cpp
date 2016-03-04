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
#include "llvm/ADT/ilist.h"
#include "llvm/ADT/ilist_node.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Dominators.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Operator.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/Pass.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineInstr.h"
#include "llvm/CodeGen/MachineMemOperand.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/ScalarEvolutionExpressions.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"
#include "VEXTargetMachine.h"
#define GET_INSTRINFO_HEADER
#include "VEXGenInstrInfo.inc"

using namespace llvm;

namespace llvm {
    LoopPass *createVEXLoopInfoPass(VEXTargetMachine &TM);
    MachineFunctionPass *createVEXDataReuseTrackingPreRegAllocPass(VEXTargetMachine &TM);
}

namespace {
    
class VEXLoopInfoPass: public LoopPass {
    
    void getAnalysisUsage(AnalysisUsage &AU) const override;
    AliasAnalysis *AA;
    ScalarEvolution *SE;

public:
    static char ID;
    VEXLoopInfoPass()
    : LoopPass(ID) {
        
    }
    
    const char *getPassName() const override {
        return "VEX Loop Info Pass";
    }
    
    bool runOnLoop(Loop *L, LPPassManager &LPM) override;
    
};

}

void VEXLoopInfoPass::getAnalysisUsage(AnalysisUsage &AU) const {
    AU.addRequired<AliasAnalysis>();
    AU.addRequired<ScalarEvolution>();
    AU.addPreserved<ScalarEvolution>();
}

bool VEXLoopInfoPass::runOnLoop(Loop *L, LPPassManager &LPM) {
    AA = &getAnalysis<AliasAnalysis>();
    SE = &getAnalysis<ScalarEvolution>();

    unsigned TripCount;

    BasicBlock *ExitingBlock = L->getLoopLatch();
    if (!ExitingBlock || !L->isLoopExiting(ExitingBlock))
      ExitingBlock = L->getExitingBlock();

    if (ExitingBlock)
        TripCount = SE->getSmallConstantTripCount(L, ExitingBlock);

    dbgs() << "TripCount is: " << TripCount;

//    errs() << F.getName() << "\n";
    
//    for (auto MBB = F.begin(), MBBE = F.end(); MBBE != MBB; ++MBB) {
//        for (auto Inst = MBB->begin(), InstE = MBB->end(); Inst != InstE; ++Inst)
//        if (LoadInst *Inst = dyn_cast<LoadInst>(&MBB->front())) {
//            for (unsigned i = 0, e = Inst->getNumOperands(); i != e; ++i)
//                Inst->getOperand(i)->dump();
//            Inst->dump();
//        }
//    }
    return false;
}

char VEXLoopInfoPass::ID = 0;
//static RegisterPass<VEXDataReuseTrackingPass> X("VEXDataReuseTracking", "Data Reuse Tracking Pass", false, false);

LoopPass *llvm::createVEXLoopInfoPass(VEXTargetMachine &TM) {
    return new VEXLoopInfoPass();
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

    // This implements a trace that is need for each global variable
    // that should be replaced with SPM code.
    // Here, we will store all instructions that are need once we find
    // a new variable. We need this data structure in order to track
    // information about how the variable is incremented in a loop.
    // Such information will help retain information to construct the
    // SPMVariable object for that variable.
//    typedef std::deque<std::vector<MachineBasicBlock::iterator> > VariablesTraces;
    typedef std::deque<std::vector<unsigned> > VariableTraces;
    VariableTraces VarTraces;

    std::vector<unsigned> RegisterTrack;

    bool IsSPMVariable(MachineBasicBlock::iterator Inst,
                       unsigned &OperandIdx,
                       unsigned VirtualRegister);

    bool PropagatesSPMVariable(MachineBasicBlock::iterator Inst,
                               unsigned VirtualRegister);

public:
    static char ID;
    VEXDataReuseTrackingPreRegAllocPass(TargetMachine &TM)
        : MachineFunctionPass(ID), TM(TM) {
        RegisterTrack.resize(0);
//        VarTraces.resize()
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

// This method checks if there is a Scratchpad Variable within the instruction.
// OperandIdx where the SPMVariable Operand is and
// Virtual Register stores info about to which Virtual Register it will propagate the Variable.
// This is important because we may have multiple Loads and Stores that use the same Virtual Register
// at this point, therefore, we need to update information on lots of instructions.
bool VEXDataReuseTrackingPreRegAllocPass::IsSPMVariable(MachineBasicBlock::iterator Inst,
                                                        unsigned &OperandIdx,
                                                        unsigned VirtualRegister) {

    for (unsigned i = 0, e = Inst->getNumOperands();
         i != e; ++i) {

         if (Inst->getOperand(i).isGlobal()) {
            const GlobalValue *GV = Inst->getOperand(i).getGlobal();

            DEBUG(errs() << GV->getName() << " is a Global Variable");
            if (GV->getName().startswith("spm_")) {

                DEBUG(errs() << " And should be stored in the SPM\n");
                OperandIdx = i;

                if (Inst->getOperand(0).isDef())
                    VirtualRegister = Inst->getOperand(0).getReg();
                return true;
            }
         }
    }
    return false;

}

bool VEXDataReuseTrackingPreRegAllocPass::PropagatesSPMVariable(MachineBasicBlock::iterator Inst,
                                                                unsigned VirtualRegister) {
    for (unsigned i = 0, e = Inst->getNumOperands();
         i != e; ++i) {

        // Fast Iteration
        if (Inst->getOperand(i).isDef() || !Inst->getOperand(i).isReg())
            continue;

        unsigned Operand = Inst->getOperand(i).getReg();
        bool found = false;

        for (std::deque<std::vector<unsigned> >::iterator VarTraceVec = VarTraces.begin(),
             VarTraceVecEnd = VarTraces.end();
             VarTraceVec != VarTraceVecEnd && !found;
             ++VarTraceVec) {
            for (unsigned i = 0, e = VarTraceVec->size();
                 i != e && !found; ++i) {
                if ((*VarTraceVec).at(i) == Operand && Inst->getOperand(0).isDef()) {
                    (*VarTraceVec).at(e) = Inst->getOperand(0).getReg();
                    VirtualRegister = Inst->getOperand(0).getReg();
                    found  = true;
                }
            }
        }
    }
}

bool VEXDataReuseTrackingPreRegAllocPass::runOnMachineFunction(MachineFunction &MF) {
//    AA = &getAnalysis<AliasAnalysis>();
    errs() << MF.getName() << "\n";

    DataReuseInfo* DataInfo = static_cast<const VEXTargetMachine &>(TM).getDataReuseInfo();

    for (MachineFunction::iterator MBB = MF.begin(),
         MBBE = MF.end(); MBBE != MBB; ++MBB) {

        for (MachineBasicBlock::iterator Inst = MBB->begin(),
             InstE = MBB->end(); Inst != InstE; ++Inst) {

            unsigned OperandIdx, VirtualReg;
            bool SPMFound = false;
            if (IsSPMVariable(Inst, OperandIdx, VirtualReg)) {
                // A SPM Variable was found
                // Initiate a new node
                DEBUG(dbgs() << "New Variable found in Virtual Register " << VirtualReg);
                std::vector<unsigned> vec;
                vec.push_back(VirtualReg);
                VarTraces.push_back(vec);
                SPMFound = true;
            }

            if(PropagatesSPMVariable(Inst, VirtualReg)) {
                // It propagates another SPMVariable
                DEBUG(dbgs() << "Variable Propagation " << VirtualReg);
                SPMFound = true;
            }

            if (SPMFound) {
                unsigned MemOpcode = 0;
                if (Inst->mayLoad())
                    MemOpcode = VEX::STWSpm;

            }


            Inst->dump();

//            if (!Inst->memoperands_empty()) {
//                MachineMemOperand *MMO;
//                MMO = *Inst->memoperands_begin();
//                const Value *V = MMO->getValue();
//                if (V->getName().startswith("spm_")) {
//                    SPMVariable var(V->getName());
//                    if(Inst->mayLoad())
//                        var.setLoad();
//                    if(Inst->mayStore())
//                        var.setStore();
//                    DataInfo->AddVariable(var);
//                    Inst->dump();
//                    dbgs() << "Should be in the SPMs\n";
//                }
//            }

//            if (Inst->mayLoad() || Inst->mayStore()) {
//                for (unsigned i = 0, e = Inst->getNumOperands();
//                     i != e; ++i) {
//                    if (Inst->getOperand(i).isGlobal())
//                        errs() << "Is Global\n";
//                }
//            }
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
