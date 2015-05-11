//===-- VEXMCInstLower.cpp - Convert VEX MachineInstr to MCInst ---------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains code to lower VEX MachineInstrs to their corresponding
// MCInst records.
//
//===----------------------------------------------------------------------===//

#include "VEXMCInstLower.h"

#include "VEXAsmPrinter.h"
#include "VEXInstrInfo.h"
#include "MCTargetDesc/VEXBaseInfo.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineInstr.h"
#include "llvm/CodeGen/MachineOperand.h"
#include "llvm/IR/Mangler.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/MC/MCInst.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"


#define DEBUG_TYPE "vex-mcinslower"

using namespace llvm;

VEXMCInstLower::VEXMCInstLower(VEXAsmPrinter &asmprinter)
: AsmPrinter(asmprinter) {
    DEBUG(errs() << "MCInstLower\n");
}

void VEXMCInstLower::Initialize(MCContext *C){
    Ctx = C;
}

static void CreateMCInst(MCInst &Inst, unsigned Opc, const MCOperand& Opnd0,
                         const MCOperand& Opnd1, const MCOperand Opnd2 = MCOperand()){
    Inst.setOpcode(Opc);
    Inst.addOperand(Opnd0);
    Inst.addOperand(Opnd1);
    if(Opnd2.isValid())
        Inst.addOperand(Opnd2);
}

// LowerOperand
MCOperand VEXMCInstLower::LowerOperand(const MachineOperand &MO,
                                       unsigned Offset) const {
    MachineOperandType MOTy = MO.getType();
    
    switch (MOTy) {
        case MachineOperand::MO_Register:
            // Ignore all implicit register operands
            if(MO.isImplicit()) break;
            return MCOperand::CreateReg(MO.getReg());
        case MachineOperand::MO_Immediate:
            return MCOperand::CreateImm(MO.getImm() + Offset);
        case MachineOperand::MO_RegisterMask:
            break;
        default:
            llvm_unreachable("unknown operand type");
            break;
    }
    return MCOperand();
}

void VEXMCInstLower::Lower(const MachineInstr *MI, MCInst &OutMI) const{
    OutMI.setOpcode(MI->getOpcode());
    
    DEBUG(errs() << "MCInstLower::Lower\n");
    for(unsigned i = 0, e = MI->getNumOperands(); i != e ; ++i){
        const MachineOperand &MO = MI->getOperand(i);
        MCOperand MCOp = LowerOperand(MO);
        
        if(MCOp.isValid())
            OutMI.addOperand(MCOp);
    }
}
