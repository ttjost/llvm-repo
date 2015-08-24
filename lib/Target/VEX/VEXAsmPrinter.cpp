//===-- VEXAsmPrinter.cpp - VEX LLVM Assembly Printer -------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains a printer that converts from our internal representation
// of machine-dependent LLVM code to GAS-format VEX assembly language.
//
//===----------------------------------------------------------------------===//

#include "VEXAsmPrinter.h"

#include "InstPrinter/VEXInstPrinter.h"

#include "MCTargetDesc/VEXBaseInfo.h"

#include "VEX.h"
#include "VEXInstrInfo.h"
#include "VEXTargetStreamer.h"
#include "llvm/ADT/SmallString.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/ADT/Twine.h"
#include "llvm/CodeGen/MachineConstantPool.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineInstr.h"
#include "llvm/CodeGen/MachineMemOperand.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Mangler.h"
#include "llvm/MC/MCAsmInfo.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCStreamer.h"
#include "llvm/MC/MCSymbol.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/TargetRegistry.h"
#include "llvm/Target/TargetOptions.h"

using namespace llvm;

#define DEBUG_TYPE "vex-asm-printer"


// FIXME :  Verify if this is correct for our VEX architecture

bool VEXAsmPrinter::runOnMachineFunction(MachineFunction &MF){
    Subtarget = &MF.getSubtarget<VEXSubtarget>();

    DEBUG(errs() << "\n\nVEX asm Printer\n\n");
    VEXFI = MF.getInfo<VEXFunctionInfo>();
    AsmPrinter::runOnMachineFunction(MF);
    return true;
}

//Emit Instruction must exists or will have run time error
void VEXAsmPrinter::EmitInstruction(const MachineInstr *MI){
    if(MI->isDebugValue()){
        SmallString<128> Str;
        raw_svector_ostream OS(Str);

        PrintDebugValueComment(MI, OS);
        return;
    }

    DEBUG(errs() << "Emitting instruction " << MI->getOpcode() << "\n");
    
    MCInst TmpInst0;

    if (MI->isBundle()){
        MachineBasicBlock::const_instr_iterator I = MI;
        MachineBasicBlock::const_instr_iterator E = MI->getParent()->instr_end();

        SmallVector<MCInst, 16> TmpInst;
        unsigned i;
        TmpInst0.setOpcode(I->getOpcode());
        for (++I, i = 0; E != I && I->isInsideBundle(); ++I){
            if (!I->isCFIInstruction()) {
                MCInst Tmp;
                TmpInst.push_back(Tmp);
                MCInstLowering.Lower(I, TmpInst0, TmpInst[i++], I->isInsideBundle());
            }
        }
        for (unsigned i = 0, e = TmpInst0.getNumOperands();
             i != e ; ++i){
                // printInstruction(mi, O) defined in VEXGenAsmWriter.inc which came from
                // VEX.td indicate.
                if (TmpInst0.getOperand(i).isInst())
                    DEBUG(dbgs() << "IS INSTRUCTION\n");
                else
                    DEBUG(dbgs() << "NO INSTRUCTION\n");
                const MCInst *inst = TmpInst0.getOperand(i).getInst();
                DEBUG(dbgs() << inst->getOpcode() << " \n");
        }
        OutStreamer.EmitInstruction(TmpInst0, getSubtargetInfo());
    } else {
        MCInstLowering.Lower(MI, TmpInst0, TmpInst0, false);
        OutStreamer.EmitInstruction(TmpInst0, getSubtargetInfo());
    }

//    do{
//        MCInstLowering.Lower(I, TmpInst0);
//        OutStreamer.EmitInstruction(TmpInst0, getSubtargetInfo());
//    }while((++I != E) && I->isInsideBundle()); //
    DEBUG(errs() << "Done emitting\n");
}

// Create a bitmask with all callee saved registers for CPU
// registers. For CPU registers consider LR, GP and BR register for saving if necessary
void VEXAsmPrinter::printSavedRegsBitmask(raw_ostream &O){
    // CPU Saved Registers Bitmasks
    unsigned CPUBitmask = 0;

    int CPUTopSavedRegOff;

    // set the CPU bitmasks
    const MachineFrameInfo *MFI = MF->getFrameInfo();
    const std::vector<CalleeSavedInfo> &CSI = MFI->getCalleeSavedInfo();
    // size of stack area to which FP(?) callee-saved registers are saved.
    //unsigned CPURegSize = VEX::B

    unsigned i = 0, e = CSI.size();
    // Set CPU Bitmask
    for (; i != e; ++i){
        unsigned Reg = CSI[i].getReg();
        unsigned RegNum = getVEXRegisterNumbering(Reg);
        CPUBitmask |= (1 << RegNum);
    }

    // FIXME !!!!! Is this really 0?
    CPUTopSavedRegOff = 0;

    //Print CPUBitmask
    O << "\t.mask \t"; printHex32(CPUBitmask, O);
    O << "," << CPUTopSavedRegOff << '\n';
}

// Print a 32 bit hex number with all numbers.
void VEXAsmPrinter::printHex32(unsigned Value, raw_ostream &O) {
  O << "0x";
  for (int i = 7; i >= 0; i--)
    O.write_hex((Value & (0xF << (i*4))) >> (i*4));
}

//===----------------------------------------------------------------------===//
// Frame and Set directives (NOT USED)
//===----------------------------------------------------------------------===//
//->	.frame	$sp,8,$lr
//	.mask 	0x00000000,0
//	.set	noreorder
//	.set	nomacro
/// Frame Directive
void VEXAsmPrinter::emitFrameDirective(){
    const TargetRegisterInfo &RI = *MF->getSubtarget().getRegisterInfo();

    unsigned stackReg = RI.getFrameRegister(*MF);
    unsigned returnReg = RI.getRARegister();
    unsigned stackSize = MF->getFrameInfo()->getStackSize();

//    if(OutStreamer.hasRawTextSupport())
//        OutStreamer.EmitRawText("\t.frame\t$" +
//                                StringRef(VEXInstPrinter::getRegisterName(stackReg)).lower() +
//                                "," + Twine(stackSize) + ", $" +
//                                StringRef(VEXInstPrinter::getRegisterName(returnReg)).lower());
}

const char *VEXAsmPrinter::getCurrentABIString() const {
    return "abi32";
}

// .entry caller, sp=$r0.1, rl=$l0.0, asize=80, arg()
// main:
void VEXAsmPrinter::EmitFunctionEntryLabel() {
//    if(OutStreamer.hasRawTextSupport())
    unsigned stackSize = MF->getFrameInfo()->getStackSize();
    OutStreamer.EmitRawText(".section .text \n.proc \n.entry caller, sp=$r0.1, rl=$l0.0, asize=-" +
                            Twine(stackSize) +
                            ", arg()");
    OutStreamer.EmitLabel(CurrentFnSym);
}

// FIXME : Should this be implemented

//  .frame  $sp,8,$pc
//  .mask   0x00000000,0
//->  .set  noreorder
//->  .set  nomacro
/// EmitFunctionBodyStart - Targets can override this to emit stuff before
/// the first basic block in the function.
void VEXAsmPrinter::EmitFunctionBodyStart() {
    MCInstLowering.Initialize(&MF->getContext());
    emitFrameDirective();

//    if (OutStreamer.hasRawTextSupport()) {
//        SmallString<128> Str;
//        raw_svector_ostream OS(Str);
//        printSavedRegsBitmask(OS);
//        OutStreamer.EmitRawText(OS.str());
//        OutStreamer.EmitRawText(StringRef("\t.set\tnoreorder"));
//        OutStreamer.EmitRawText(StringRef("\t.set\tnomacro"));
//
//        if (VEXFI->getEmitNOAT())
//            OutStreamer.EmitRawText(StringRef("\t.set\tnoat"));
//    }
}

/// EmitFunctionBodyEnd - Targets can override this to emit stuff after
/// the last basic block in the function.
///
/// .endp
void VEXAsmPrinter::EmitFunctionBodyEnd() {
    // There are instruction for this macros, but they must
    // always be at the function end, and we can't emit and
    // break with BB logic.
    OutStreamer.EmitRawText(".endp\n");
}

// FIXME : Is this correct?
//  .section .mdebug.abi32
//  .previous
void VEXAsmPrinter::EmitStartOfAsmFile(Module &M){

//    // Tell the assembler which ABI we are using
//    if(OutStreamer.hasRawTextSupport())
//        OutStreamer.EmitRawText("\t.section .mdebug." +
//                                Twine(getCurrentABIString()));
//
//    // return to previous section
//    if(OutStreamer.hasRawTextSupport())
//        OutStreamer.EmitRawText(StringRef("\t.previous"));
}

// FIXME :  Is this algorithm correct?
MachineLocation VEXAsmPrinter::getDebugValueLocation(const MachineInstr *MI) const{
    //Handles frame address emit in VEXInstrInfo::emitFrameIndexDebugValue.
    assert(MI->getNumOperands() == 4 && "Invalid no. of machine operands!");
    assert(MI->getOperand(0).isReg() && MI->getOperand(1).isImm() &&
           "Unexpected MachineOperand types");
    return MachineLocation(MI->getOperand(0).getReg(),
                           MI->getOperand(1).getImm());
}

void VEXAsmPrinter::PrintDebugValueComment(const MachineInstr *MI,
                                           raw_ostream &OS) {
  // TODO: implement
  OS << "PrintDebugValueComment()";
}

// PROBABLY THIS IS NOT USED
bool VEXAsmPrinter::PrintAsmOperand(const MachineInstr *MI, unsigned OpNo,
                                    unsigned AsmVariant, const char *ExtraCode,
                                    raw_ostream &O){
    // Does this asm operand have a single letter operand modifier?
    if (ExtraCode && ExtraCode[0]) {
        if (ExtraCode[1] != 0) return true; // Unknown modifier.
        
        const MachineOperand &MO = MI->getOperand(OpNo);
        switch (ExtraCode[0]) {
            default:
                return true;  // Unknown modifier.
            case 'c': // Substitute immediate value without immediate syntax
                if (MO.getType() != MachineOperand::MO_Immediate)
                    return true;
                O << MO.getImm();
                return false;
            case 'n':  // Negate the immediate constant.
                if (MO.getType() != MachineOperand::MO_Immediate)
                    return true;
                O << -MO.getImm();
                return false;
        }
    }
    return true;
}

// Force static initialization.
extern "C" void LLVMInitializeVEXAsmPrinter() {
  RegisterAsmPrinter<VEXAsmPrinter> X(TheVEXTarget);
  RegisterAsmPrinter<VEXAsmPrinter> Y(TheVEXNewTarget);
}

