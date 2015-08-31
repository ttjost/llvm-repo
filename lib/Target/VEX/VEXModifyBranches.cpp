//===-----------------        VEXModifyBranches.cpp        ---------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements a pass that remove unnecessary GOTO instructions from code
// and also replaces VEX::BR instructions with VEX::BRF.
//
//===----------------------------------------------------------------------===//

#include "VEX.h"
#include "VEXTargetMachine.h"
#include "VEXInstrInfo.h"
#include "llvm/Pass.h"
#include "llvm/CodeGen/MachineBasicBlock.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/Debug.h"
#include "llvm/IR/DebugLoc.h"


#define DEBUG_TYPE "vex-modifybranches"

using namespace llvm;

namespace llvm {
    FunctionPass *createVEXModifyBranchesPass(VEXTargetMachine &TM);
}

namespace {

class ModifyBranchesPass : public MachineFunctionPass {

private:
    TargetMachine &TM;

public:
    static char ID;
    ModifyBranchesPass(TargetMachine &TM) :  MachineFunctionPass(ID),
                                                    TM(TM) {}

    virtual bool runOnMachineFunction(MachineFunction &MF) {

        MachineFunction::iterator OneBeforeLastBB = MF.end();
        --OneBeforeLastBB;
        MachineFunction::iterator OneAfterIteratorBB = MF.begin();
        ++OneAfterIteratorBB;

        for (MachineFunction::iterator MBBI = MF.begin();
             MBBI != OneBeforeLastBB; ++MBBI, ++OneAfterIteratorBB) {

            for (MachineBasicBlock::iterator InstrIter = MBBI->end(),
                 InstrBegin = MBBI->begin(); InstrIter != InstrBegin;) {

                if (InstrIter->isBranch()) {
                    if (InstrIter->getOpcode() == VEX::GOTO){
                        DEBUG(errs() << "Is a GOTO instruction\n");

                        if (InstrIter->getOperand(0).getMBB() == OneAfterIteratorBB){
                            DEBUG(errs() << "We can remove this goto!\n");
                            MachineBasicBlock::iterator ErasedInst = InstrIter;
                            --InstrIter;
                            ErasedInst->eraseFromParent();
                            DEBUG(errs() << "REMOVED!\n");
                        } else {
                            --InstrIter;

                            MachineBasicBlock::iterator BranchInstr = InstrIter;
                            //--BranchInstr;


                            const VEXInstrInfo *TII =
                              static_cast<const VEXInstrInfo *>(TM.getSubtargetImpl()->getInstrInfo());
                            if (BranchInstr->getOpcode() == VEX::BR) {
                                DEBUG(errs() << "It is a VEX::BR instruction!\n");
//                                MachineBasicBlock::iterator NewBranchInstr = BuildMI(MBBI, InstrIter,
//                                                                                     InstrIter->getDebugLoc(),
//                                                                                     TII->get(VEX::BRF));
//                                NewBranchInstr
                            }
                        }
                    } else
                        --InstrIter;
                } else {
                    --InstrIter;
                }
            }
        }
    }

};
}

FunctionPass *llvm::createVEXModifyBranchesPass(VEXTargetMachine &TM) {
    return new ModifyBranchesPass(TM);
}

char ModifyBranchesPass::ID = 0;
//static RegisterPass<ModifyBranchesPass> X("modifybranches", "Modify Branches in VEX Target");
