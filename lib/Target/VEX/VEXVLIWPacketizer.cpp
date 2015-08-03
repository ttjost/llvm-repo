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
#include "llvm/CodeGen/DFAPacketizer.h"
#include "llvm/CodeGen/MachineFunctionPass.h"

using namespace llvm;


class VEXPacketizer : MachineFunctionPass {
    
    
    bool runOnMachineFunction(MachineFunction &MF) override;
    
};




bool VEXPacketizer::runOnMachineFunction(MachineFunction &MF) {
    
    return false;
    
}

