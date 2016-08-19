//===-- VEXAsmPrinter.h - VEX LLVM Assembly Printer ----------*- C++ -*--===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// VEX Assembly printer class.
//
//===----------------------------------------------------------------------===//

#ifndef VEXASMPRINTER_H
#define VEXASMPRINTER_H

#include "VEX.h"
#include "VEXMachineFunctionInfo.h"
#include "InstPrinter/VEXInstPrinter.h"
#include "VEXInstrInfo.h"
#include "VEXMCInstLower.h"
#include "VEXTargetMachine.h"
#include "llvm/CodeGen/AsmPrinter.h"
#include "llvm/CodeGen/MachineConstantPool.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineInstr.h"
#include "llvm/CodeGen/MachineModuleInfo.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Mangler.h"
#include "llvm/IR/Module.h"
#include "llvm/MC/MCAsmInfo.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCStreamer.h"
#include "llvm/MC/MCSymbol.h"
#include "llvm/Support/TargetRegistry.h"
#include "llvm/Support/raw_ostream.h"

#include <set>
#include <string>

namespace llvm{

class MCStreamer;
class MachineInstr;
class MachineBasicBlock;
class Module;
class raw_ostream;

class LLVM_LIBRARY_VISIBILITY VEXAsmPrinter : public AsmPrinter {

    void EmitInstrWithMacroNoAT(const MachineInstr *MI);

    bool lowerOperand(const MachineOperand &MO, MCOperand &MCOp);
    
    std::set<std::string> FunctionsCalledByCallee;

    FunctionInfo* FunctionsArguments;
    FunctionInfo* FunctionsCalled;
    FunctionInfo* FunctionsReturns;

public:

    const VEXSubtarget *Subtarget;
    const VEXFunctionInfo *VEXFI;
    VEXMCInstLower MCInstLowering;

    VEXAsmPrinter(TargetMachine &TM, std::unique_ptr<MCStreamer> Streamer)
        : AsmPrinter(TM, std::move(Streamer)), MCInstLowering(*this) {
    }

    virtual const char *getPassName() const{
        return "VEX Assembly Printer";
    }

    virtual bool runOnMachineFunction(MachineFunction &MF);

    // EmitInstruction() must exists or will have run time error.
    void EmitInstruction(const MachineInstr *MI);
    void printSavedRegsBitmask(raw_ostream &O);
    void printHex32(unsigned int Value, raw_ostream &O);
    void emitFrameDirective();
    const char* getCurrentABIString() const;
    void EmitFunctionEntryLabel() override;
    void EmitFunctionBodyStart() override;
    void EmitFunctionBodyEnd() override;
    void EmitStartOfAsmFile(Module &M);
    void EmitEndOfAsmFile(Module &M);
    virtual MachineLocation getDebugValueLocation(const MachineInstr *MI) const;
    void PrintDebugValueComment(const MachineInstr *MI, raw_ostream &OS);
    bool PrintAsmOperand(const MachineInstr *MI, unsigned OpNo,
                         unsigned AsmVariant, const char *ExtraCode,
                         raw_ostream &OS) override;
};

}

#endif
