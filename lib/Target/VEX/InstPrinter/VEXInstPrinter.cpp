//===-- VEXInstPrinter.cpp - Convert VEX MCInst to assembly syntax ------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This class prints an VEX MCInst to a .s file.
//
//===----------------------------------------------------------------------===//

#include "VEXInstPrinter.h"

#include "VEXInstrInfo.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCSymbol.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

#define DEBUG_TYPE "asm-printer"

#define PRINT_ALIAS_INSTR
#include "VEXGenAsmWriter.inc"

void VEXInstPrinter::printRegName(raw_ostream &OS, unsigned RegNo) const {
    //getRegisterName(RegNo) defined in VEXGenAsmWriter.inc which came from
    // VEX.td indicate.
    OS << '$' << StringRef(getRegisterName(RegNo)).lower();
}

void VEXInstPrinter::printInst(const MCInst *mi, raw_ostream &O,
                               StringRef Annot, const MCSubtargetInfo &STI){
    // Try to print any aliases first.
    if (!printAliasInstr(mi, O))
        // printInstruction(mi, O) defined in VEXGenAsmWriter.inc which came from
        // VEX.td indicate.
        O << "\tc0";
        printInstruction(mi, O);
    printAnnotation(O, Annot);
}

static void printExpr(const MCExpr *Expr, raw_ostream &OS){
    
    int Offset = 0;
    const MCSymbolRefExpr *SRE;
    
    if(const MCBinaryExpr *BE = dyn_cast<MCBinaryExpr>(Expr)){
        SRE = dyn_cast<MCSymbolRefExpr>(BE->getLHS());
        const MCConstantExpr *CE = dyn_cast<MCConstantExpr>(BE->getRHS());
        assert(SRE && CE && "Binary expression must be sym+const.");
        Offset = CE->getValue();
    }
    else if(!(SRE = dyn_cast<MCSymbolRefExpr>(Expr)))
        assert(false && "Unexpected MCExpr type");
    
    MCSymbolRefExpr::VariantKind Kind  = SRE->getKind();
    
    switch (Kind) {
        case MCSymbolRefExpr::VK_None:
            break;
            
        default:
            llvm_unreachable("Invalid Kind!");
            break;
    }
    OS << SRE->getSymbol();
    
    if(Offset) {
        if(Offset > 0)
            OS << '+';
        OS << Offset;
    }
    
    if((Kind == MCSymbolRefExpr::VK_VEX_GPOFF_HI) ||
       (Kind == MCSymbolRefExpr::VK_VEX_GPOFF_LO))
        OS << ")))";
    else if(Kind != MCSymbolRefExpr::VK_None)
        OS << ")";
    
}

void VEXInstPrinter::printOperand(const MCInst *mi, unsigned OpNo,
                                  raw_ostream &O){
    const MCOperand &Op = mi->getOperand(OpNo);
    
    if(Op.isReg()){
        printRegName(O, Op.getReg());
        return;
    }
    if(Op.isImm()){
        O << Op.getImm();
        return;
    }
    
    assert(Op.isExpr() && "unknown operand kind in printOperand");
    printExpr(Op.getExpr(), O);
}

void VEXInstPrinter::printUnsignedImm(const MCInst *mi, int opNum,
                                      raw_ostream &O){
    const MCOperand &MO = mi->getOperand(opNum);
    if(MO.isImm())
        O << (unsigned short int)MO.getImm();
    else
        printOperand(mi, opNum, O);
}


void VEXInstPrinter::printMemOperand(const MCInst *mi, int opNum, raw_ostream &O){
    // Load/Store memory operands -- imm($reg)
    printOperand(mi, opNum+1, O);
    O << "[";
    printOperand(mi, opNum, O);
    O << "]";
}

void VEXInstPrinter::printMemOperandEA(const MCInst *mi, int opNum, raw_ostream &O){
    // when using stack locations for not load/store instructions
    // print the same way as all normal 3 operand instructions.
    printOperand(mi, opNum, O);
    O << ", ";
    printOperand(mi, opNum+1, O);
    return;
}
