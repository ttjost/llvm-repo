//===-- VEXVLIWPacketizer.cpp - VEX VLIW Packetizer     -------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "VEXSubtarget.h"
#include "VEXTargetMachine.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/DFAPacketizer.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineLoopInfo.h"
#include "llvm/CodeGen/MachineDominators.h"
#include "llvm/CodeGen/ScheduleDAG.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/Support/TargetRegistry.h"
#include "DataReuseInfo.h"

#define DEBUG_TYPE "vex-monitor"

using namespace llvm;

namespace llvm {
    FunctionPass *createSchedulerMonitor(VEXTargetMachine &TM);
}

namespace {
class VEXSchedulerMonitor : public MachineFunctionPass {

    TargetMachine &TM;

public:
    static char ID;

    VEXSchedulerMonitor(TargetMachine &TM) : MachineFunctionPass(ID),
                                               TM(TM)
                                               {}

    bool runOnMachineFunction(MachineFunction &MF) override;
};

}

bool VEXSchedulerMonitor::runOnMachineFunction(MachineFunction &MF) {
    
//    const VEXSubtarget* Subtarget = &MF.getSubtarget<VEXSubtarget>();
//    BBsInfo* SchedBBs = Subtarget->getSchedBBHeights();
//    
//    for (MachineFunction::iterator MBB = MF.begin(), MBBe = MF.end();
//         MBB != MBBe; ++MBB) {
//        SchedBBs->BBInfo[MBB->getName()] = MBB->size() - 1;
//    }
    
    const VEXSubtarget* Subtarget = &MF.getSubtarget<VEXSubtarget>();
    BBsInfo* SchedBBs = Subtarget->getSchedBBHeights();
    
    for (MachineFunction::iterator MBB = MF.begin(), MBBe = MF.end();
         MBB != MBBe; ++MBB) {
        int i = 0;
        for (MachineBasicBlock::iterator MI = MBB->begin(), MIE = MBB->end();
             MI != MIE; ++MI) {
            MachineBasicBlock::instr_iterator I = &*MI;
            ++I;
            if (I->isBranch()) {
                break;
            }
            ++i;
        }
        SchedBBs->BBInfo[MBB->getName()] = i;
    }
    
    BBsInfo* OptBBs = Subtarget->getOptBBHeights();
    
    for (auto BBInfo : SchedBBs->BBInfo) {
        if (BBInfo.first != "(null)") {
            DEBUG (errs() << "BB: " << BBInfo.first << "\n");
            DEBUG (errs() << "Opt Height: " <<  OptBBs->BBInfo[BBInfo.first] << "\n");
            DEBUG (errs() << "Sched Height: " << SchedBBs->BBInfo[BBInfo.first] << "\n\n");
        }
    }
    SchedBBs->BBInfo.clear();
    OptBBs->BBInfo.clear();

    return true;
}


//===----------------------------------------------------------------------===//
//                         Public Constructor Functions
//===----------------------------------------------------------------------===//
FunctionPass *llvm::createSchedulerMonitor(VEXTargetMachine &TM) {
    return new VEXSchedulerMonitor(TM);
}

char VEXSchedulerMonitor::ID = 0;
