//===-- VEXPacketizer.cpp - VEX VLIW Packetizer     -------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the pass required to bundle instructions together
// to create VLIW instructions. We bundle instruction by adding
// a TargetOpcode::Bundle instruction at the beginning of each bundle.
//
//===----------------------------------------------------------------------===//

#include "VEXInstrInfo.h"
#include "VEXSubtarget.h"
#include "llvm/CodeGen/DFAPacketizer.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineLoopInfo.h"
#include "llvm/CodeGen/MachineDominators.h"

#define DEBUG_TYPE "vex-vliw-scheduling"

using namespace llvm;

namespace llvm {
    FunctionPass *createVEXPacketizer(bool EnableVLIWScheduling);
}

namespace {
class VEXPacketizer : public MachineFunctionPass {
    
    bool EnableVLIWScheduling;

public:
    static char ID;

    VEXPacketizer(bool EnableVLIWScheduling) : MachineFunctionPass(ID),
                                               EnableVLIWScheduling(EnableVLIWScheduling)
                                               {}

    void getAnalysisUsage(AnalysisUsage &AU) const override {
        AU.setPreservesCFG();
        AU.addRequired<MachineDominatorTree>();
        //AU.addRequired<MachineBranchProbabilityInfo>();
        AU.addPreserved<MachineDominatorTree>();
        AU.addRequired<MachineLoopInfo>();
        AU.addPreserved<MachineLoopInfo>();

        MachineFunctionPass::getAnalysisUsage(AU);
    }
    
    bool runOnMachineFunction(MachineFunction &MF) override;
    
};


class VEXPacketizerList : public VLIWPacketizerList {


public:
    VEXPacketizerList(MachineFunction &MF,
                      MachineLoopInfo &MLI)
                      : VLIWPacketizerList(MF, MLI, true) {}

    bool isSoloInstruction(MachineInstr *MI);

};

}

// Needs to implement this so we can detect when a instruction
// has to be solo. This is normally true for inlineAsm, as well
// as EHLabel. Though
bool VEXPacketizerList::isSoloInstruction(MachineInstr *MI) {

    DEBUG(dbgs() << "Instruction Number:" << MI->getOpcode() << "\n");

    if (MI->isInlineAsm()) {
        return true;
    }

    if (MI->isEHLabel()) {
        return true;
    }

    return false;
}

bool VEXPacketizer::runOnMachineFunction(MachineFunction &MF) {
    
    if (EnableVLIWScheduling)
        DEBUG(dbgs() << "VLIW Scheduling Enabled.\n");
    else
        return false;

    const TargetInstrInfo *TII = MF.getSubtarget().getInstrInfo();
    MachineLoopInfo &MLI = getAnalysis<MachineLoopInfo>();

    VEXPacketizerList Packetizer(MF, MLI);


    for (MachineFunction::iterator MBBI = MF.begin() , MBBE = MF.end(); MBBI != MBBE; ++MBBI)

        Packetizer.PacketizeMIs(MBBI.getNodePtrUnchecked(), MBBI->begin(), MBBI->end());
    
}


//===----------------------------------------------------------------------===//
//                         Public Constructor Functions
//===----------------------------------------------------------------------===//
FunctionPass *llvm::createVEXPacketizer(bool EnableVLIWScheduling) {
    DEBUG(errs() << "VLIW Scheduling Disabled.\n");
    return new VEXPacketizer(EnableVLIWScheduling);
}

char VEXPacketizer::ID = 0;
//static RegisterPass<VEXPacketizer> X("EnableVLIWScheduling", "Enable VLIW Scheduling");
