//===-- VEXInstrInfo.h - VEX Instruction Information ----------*- C++ -*-===//
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

#ifndef VEXINSTRUCTIONINFO_H
#define VEXINSTRUCTIONINFO_H

#include "VEX.h"
#include "VEXRegisterInfo.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "VEXMachineFunctionInfo.h"
#include "llvm/Target/TargetInstrInfo.h"

#define GET_INSTRINFO_HEADER
#include "VEXGenInstrInfo.inc"

namespace llvm{

    class VEXInstrInfo : public VEXGenInstrInfo{
        const VEXRegisterInfo RI;

    protected:
        const VEXSubtarget &Subtarget;
        
    public:
        explicit VEXInstrInfo(const VEXSubtarget &STI);
        
        /// getRegisterInfo - TargetInstrInfo is a superset of MRegister info. As
        /// such, whenever a client has an instance of instruction info, it should
        /// always be able to get register info as well (through this method).
        ///
        
        const VEXRegisterInfo &getRegisterInfo() const { return RI; }

        void copyPhysReg(MachineBasicBlock &MBB,
                         MachineBasicBlock::iterator MI, DebugLoc DL,
                         unsigned DestReg, unsigned SrcReg,
                         bool KillSrc) const;
        
        bool expandPostRAPseudo (MachineBasicBlock::iterator MI) const;

        void loadRegFromStackSlot(MachineBasicBlock &MBB,
                                  MachineBasicBlock::iterator MI,
                                  unsigned DestReg, int FrameIndex,
                                  const TargetRegisterClass *RC,
                                  const TargetRegisterInfo *TRI) const;

        void storeRegToStackSlot(MachineBasicBlock &MBB,
                                 MachineBasicBlock::iterator MI,
                                 unsigned SrcReg, bool isKill, int FrameIndex,
                                 const TargetRegisterClass *RC,
                                 const TargetRegisterInfo *TRI) const;
        
        // Use in EmitPrologue to adjust SP by FrameSize bytes and save
        void makeFrame(unsigned SP, int64_t FrameSize,
                                     MachineBasicBlock &MBB,
                                     MachineBasicBlock::iterator I) const;

        // Adjust SP by Amount bytes
        void adjustStackPtr(VEXFunctionInfo *VEXFI, unsigned SP, uint64_t Amount,
                            MachineBasicBlock &MBB, MachineBasicBlock::iterator I)
        const;

        // Used by the VLIW Scheduler.
        DFAPacketizer* CreateTargetScheduleState(const TargetSubtargetInfo &STI) const;
    };
    
}

#endif
