//=== VEXInstPrinter.h - Convert VEX MCInst to assembly syntax -*- C++ -*-==//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This class prints a VEX MCInst to a .s file.
//
//===----------------------------------------------------------------------===//

#ifndef VEXINSTPRINTER_H
#define VEXINSTPRINTER_H

#include "llvm/MC/MCInstPrinter.h"

#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

#define DEBUG_TYPE "vex-instprinter"

namespace llvm {
    
    class TargetMachine;
    
    class VEXInstPrinter : public MCInstPrinter{
        
    public:
        VEXInstPrinter(const MCAsmInfo &mai, const MCInstrInfo &mii,
                       const MCRegisterInfo &mri)
            : MCInstPrinter(mai, mii, mri) {
            }
        
        // Autogenerated by tblgen.
        void printInstruction(const MCInst *mi, raw_ostream &O);
        static const char *getRegisterName(unsigned RegNo);
        
        void printRegName(raw_ostream &O, unsigned RegNo) const override;
        void printInst(const MCInst *mi, raw_ostream &O, StringRef Annot,
                       const MCSubtargetInfo &STI) override;
        
        bool printAliasInstr(const MCInst *mi, raw_ostream &OS);
        void printCustomAliasOperand(const MCInst *mi, unsigned OpIdx,
                                     unsigned PrintMethodIdx, raw_ostream &O);
        
    private:
        void printOperand(const MCInst *mi, unsigned OpNo, raw_ostream &O);
        void printUnsignedImm(const MCInst *mi, int opNum, raw_ostream &O);
        void printMemOperand(const MCInst *mi, int opNum, raw_ostream &O);
        
        void printMemOperandEA(const MCInst *MI, int opNum, raw_ostream &O);
        
    };
}


#endif
