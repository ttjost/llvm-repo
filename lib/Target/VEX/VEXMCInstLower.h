//===-- VEXMCInstLower.h - Lower MachineInstr to MCInst -------*- C++ -*--===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#ifndef VEXMCINSTLOWER_H
#define VEXMCINSTLOWER_H

#include "llvm/ADT/SmallVector.h"
#include "llvm/CodeGen/MachineOperand.h"
#include "llvm/Support/Compiler.h"

namespace llvm {
    class MCContext;
    class MCInst;
    class MCOperand;
    class MachineInstr;
    class MachineFunction;
    class VEXAsmPrinter;
    
    // VEXInstLower - This class is used to lower an MachineInstr into an MCInst
    class LLVM_LIBRARY_VISIBILITY VEXMCInstLower{
        
        typedef MachineOperand::MachineOperandType MachineOperandType;
        MCContext *Ctx;
        VEXAsmPrinter &AsmPrinter;
        
    public:
        VEXMCInstLower(VEXAsmPrinter &asmprinter);
        void Initialize(MCContext* C);
        void Lower(const MachineInstr *MI, MCInst &OutMI) const;
        MCOperand LowerOperand(const MachineOperand &MO, unsigned offset = 0) const;
    };
}

#endif
