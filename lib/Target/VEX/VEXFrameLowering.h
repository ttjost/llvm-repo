//===-- VEXFrameLowering.h - Define frame lowering for Cpu0 ----*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
//
//
//===----------------------------------------------------------------------===//

#ifndef VEX_FRAMEINFO_H
#define VEX_FRAMEINFO_H

#include "VEX.h"

#include "llvm/Target/TargetFrameLowering.h"

#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

#define DEBUG_TYPE "vex-isel"

namespace llvm {

class VEXSubtarget;

class VEXFrameLowering : public TargetFrameLowering {

protected:
    const VEXSubtarget &STI;

public:
    explicit VEXFrameLowering(const VEXSubtarget &sti)
    :   TargetFrameLowering(StackGrowsDown,8,0,8 /**sti.stackAlignment(), 0, *sti.stackAlignment()*/),
    STI(sti){
        DEBUG(errs() << "Frame Lowering");
    }

    static const VEXFrameLowering *create(const VEXSubtarget &ST);
    
    bool hasFP(const MachineFunction &MF) const override;

};
    
} // End llvm namespace

#endif
