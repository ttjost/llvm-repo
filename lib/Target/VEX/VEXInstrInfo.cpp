//===-- VEXInstrInfo.cpp - VEX Instruction Information ------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the VEX implementation of the TargetInstrInfo class.
//
//===----------------------------------------------------------------------===//

#include "VEXInstrInfo.h"

#include "VEXTargetMachine.h"
#include "VEXMachineFunction.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/TargetRegistry.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"


#define DEBUG_TYPE "vex-instrinfo"
using namespace llvm;

#define GET_INSTRINFO_CTOR_DTOR
#include "VEXGenInstrInfo.inc"

//@VEXInstrInfo(){
VEXInstrInfo::VEXInstrInfo(const VEXSubtarget &STI) : Subtarget(STI), RI(STI) {
    DEBUG(errs() << "InstrInfo \n");
}

// Emit instructions to copy a pair of physical registers.
void VEXInstrInfo::copyPhysReg(MachineBasicBlock &MBB,
                               MachineBasicBlock::iterator MI, DebugLoc DL,
                               unsigned DestReg, unsigned SrcReg,
                               bool KillSrc) const {

    unsigned Opc = 0;
    
    // GP Register is Destination
    if (VEX::GPRegsRegClass.contains(DestReg)){
        if(VEX::BrRegsRegClass.contains(SrcReg)){
            //Opc = VEX::MFB;
        }else
            if(VEX::GPRegsRegClass.contains(SrcReg)){
            Opc = VEX::MOVr;
        }
    }else if(VEX::BrRegsRegClass.contains(DestReg)){
        if (VEX::GPRegsRegClass.contains(SrcReg)){
            //Opc = VEX::MTB;
        }else
            if(VEX::BrRegsRegClass.contains(SrcReg)){
            llvm_unreachable("Impossible reg-to-reg copy. BrReg to BrReg");
        }
    }
    
    BuildMI(MBB, MI, DL, get(Opc), DestReg).addReg(SrcReg, getKillRegState(KillSrc));
    
}

bool VEXInstrInfo::expandPostRAPseudo(MachineBasicBlock::iterator MI) const {
    
    MachineBasicBlock &MBB = *MI->getParent();
    DEBUG(errs() << "\n\n" << MI->getDesc().getOpcode() <<"\n\n");
    
    switch(MI->getDesc().getOpcode()) {
        default:
            return false;
        case VEX::PSEUDO_RET:
            DEBUG(errs() << "\n\nReplacing PSEUDO_RET\n\n");
            BuildMI(MBB, MI, MI->getDebugLoc(), get(VEX::RET)).addReg(VEX::Lr);
            break;
    }
    
    MBB.erase(MI);
    return true;
    
}


