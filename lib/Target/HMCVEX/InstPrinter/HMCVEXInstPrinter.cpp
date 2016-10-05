//===-- HMCVEXInstPrinter.cpp - Convert HMCVEX MCInst to assembly syntax ------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This class prints an HMCVEX MCInst to a .s file.
//
//===----------------------------------------------------------------------===//

#include "HMCVEXInstPrinter.h"

#include "HMCVEXInstrInfo.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCSymbol.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/CommandLine.h"

using namespace llvm;

#define DEBUG_TYPE "HMCVEX-inst-printer"

#define PRINT_ALIAS_INSTR
#include "HMCVEXGenAsmWriter.inc"

void HMCVEXInstPrinter::printRegName(raw_ostream &OS, unsigned RegNo) const {
    //getRegisterName(RegNo) defined in HMCVEXGenAsmWriter.inc which came from
    // HMCVEX.td indicate.
    OS << '$' << StringRef(getRegisterName(RegNo)).lower();
}

void HMCVEXInstPrinter::printInst(const MCInst *mi, raw_ostream &O,
                               StringRef Annot, const MCSubtargetInfo &STI) {
    // Try to print any aliases first.
    if (EnableVLIWScheduling){

        if (mi->getOpcode() == TargetOpcode::BUNDLE && EnableVLIWScheduling) {
            DEBUG(dbgs() << "INSTPRINTER IS BUNDLE\n");
            
            for (unsigned i = 0, e = mi->getNumOperands();
                 i != e ; ++i){
                const MCInst *inst = mi->getOperand(i).getInst();

                if (inst->getOpcode() == HMCVEX::CALL || inst->getOpcode() == HMCVEX::ICALL)
                    printCallDirective(inst, O);
                else if (inst->getOpcode() == HMCVEX::RET)
                    printReturnDirective(inst, O);
            }

            for (unsigned i = 0, e = mi->getNumOperands();
                 i != e ; ++i){
                if (!printAliasInstr(mi, O)){
                    // printInstruction(mi, O) defined in HMCVEXGenAsmWriter.inc which came from
                    // HMCVEX.td indicate.
                    if (mi->getOperand(i).isInst())
                        DEBUG(dbgs() << "IS INSTRUCTION\n");
                    else
                        DEBUG(dbgs() << "NO INSTRUCTION\n");
                    
                    const MCInst *inst = mi->getOperand(i).getInst();
                    if (inst->getOpcode() != 0) {
                        O << "\tc0";
                        printInstruction(inst, O);
                    }
                }
                O << "\n";
            }
            O << ";;";
        } else {
            DEBUG(dbgs() << "INSTPRINTER\n");
            if (!printAliasInstr(mi, O)){
                // printInstruction(mi, O) defined in HMCVEXGenAsmWriter.inc which came from
                // HMCVEX.td indicate.
                
                if (mi->getOpcode() == HMCVEX::CALL || mi->getOpcode() == HMCVEX::ICALL)
                    printCallDirective(mi, O);
                else if (mi->getOpcode() == HMCVEX::RET)
                    printReturnDirective(mi, O);
                
                if (mi->getOpcode() != 0) {
                    if (!(mi->getOpcode() == HMCVEX::NOP)) {
                        O << "\tc0";
                        printInstruction(mi, O);
                        O << "\n";
                    }
                    O << ";;";
                }
            }
        }
    } else {
        DEBUG(dbgs() << "SINGLE ISSUE PRINTER\n");
        if (!printAliasInstr(mi, O)){
            // printInstruction(mi, O) defined in HMCVEXGenAsmWriter.inc which came from
            // HMCVEX.td indicate.
            
            if (mi->getOpcode() == HMCVEX::CALL)
                printCallDirective(mi, O);
            else if (mi->getOpcode() == HMCVEX::RET)
                printReturnDirective(mi, O);
            
            O << "\tc0";
            printInstruction(mi, O);
        }
    }
    //printAnnotation(O, Annot);
}

void HMCVEXInstPrinter::printReturnDirective(const MCInst *MI, raw_ostream &O) {
    O << ".return ret(";

    if (MI->getOperand(MI->getNumOperands()-1).isImm()) {
        unsigned numOperands = MI->getOperand(MI->getNumOperands()-1).getImm();
        unsigned startReg = 3;
        int i;

        for (i = 0; i < numOperands - 1 && i < 8; ++i) {
            O << "$r0." << i+startReg << ":u32,";
        }
        O << "$r0." << i+startReg << ":u32";
    }
    O << ")\n";
}

void HMCVEXInstPrinter::printCallDirective(const MCInst *MI, raw_ostream &O) {
    O << ".call ";
    unsigned indexReturn;
    if (MI->getOperand(0).isExpr()) {
        indexReturn = 1;
        const MCExpr *Expr = MI->getOperand(0).getExpr();
        const MCSymbolRefExpr *SRE = dyn_cast<MCSymbolRefExpr>(Expr);
        O << SRE->getSymbol().getName();
    } else {
        indexReturn = 0;
        O << "$l0.0";
    }

    O << ", caller, arg(";
    if (indexReturn < MI->getNumOperands()) {
        unsigned numOperands = MI->getOperand(indexReturn).getImm();
        unsigned startReg = 3;
        int i;
        for (i = 0; i < numOperands - 1 && i < 8; ++i) {
            O << "$r0." << i+startReg << ":u32,";
        }
        O << "$r0." << i+startReg << ":u32";
        ++indexReturn;
    }
    O << "), ret(";
    if (indexReturn < MI->getNumOperands()) {
        unsigned numOperands = MI->getOperand(indexReturn).getImm();
        unsigned startReg = 3;
        int i;
        for (i = 0; i < numOperands - 1 && i < 7; ++i) {
            O << "$r0." << i+startReg << ":u32,";
        }
        O << "$r0." << i+startReg << ":u32";
    }
    O << ")\n";
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

//    if((Kind == MCSymbolRefExpr::VK_HMCVEX_GPOFF_HI) ||
//        (Kind == MCSymbolRefExpr::VK_HMCVEX_GPOFF_LO))
//        OS << ")))";
//    else
    if(Kind != MCSymbolRefExpr::VK_None)
        OS << ")";
}

void HMCVEXInstPrinter::printOperand(const MCInst *mi, unsigned OpNo,
                                  raw_ostream &O){
    const MCOperand &Op = mi->getOperand(OpNo);

     if(Op.isReg()){
        printRegName(O, Op.getReg());
        return;
    }
    if(Op.isImm()){
        O << (int)Op.getImm();
        return;
    }

    assert(Op.isExpr() && "unknown operand kind in printOperand");
    printExpr(Op.getExpr(), O);
}

void HMCVEXInstPrinter::printUnsignedImm(const MCInst *mi, int opNum,
                                      raw_ostream &O){
    const MCOperand &MO = mi->getOperand(opNum);
    if(MO.isImm())
        O << (unsigned short int)MO.getImm();
    else
        printOperand(mi, opNum, O);
}


void HMCVEXInstPrinter::printMemOperand(const MCInst *mi, int opNum, raw_ostream &O){
    // Load/Store memory operands -- imm($reg)
    printOperand(mi, opNum+1, O);
    O << "[";
    printOperand(mi, opNum, O);
    O << "]";
}

void HMCVEXInstPrinter::printMemOperandEA(const MCInst *mi, int opNum, raw_ostream &O){
    // when using stack locations for not load/store instructions
    // print the same way as all normal 3 operand instructions.
    printOperand(mi, opNum, O);
    O << ", ";
    printOperand(mi, opNum+1, O);
    return;
}
