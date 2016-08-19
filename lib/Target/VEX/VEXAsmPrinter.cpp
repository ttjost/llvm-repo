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

    FunctionsArguments = VEXFI->getFunctionArguments();
    FunctionsReturns = VEXFI->getFunctionReturns();
    FunctionsCalled = VEXFI->getFunctionCalled();

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
        for (++I, i = 0; E != I && I->isInsideBundle(); ++I) {
            if (I->isCFIInstruction() ||
                I->isDebugValue() ||
                I->isImplicitDef()) {
                continue;
            } else {
                unsigned numValReturn = 0;
                unsigned numValArgument = 0;

                if (I->isCall()) {
                    std::string FunctionName;

                    if (I->getOperand(0).isGlobal()) {
                        FunctionsCalledByCallee.insert(I->getOperand(0).getGlobal()->getName().str());
                        FunctionName = I->getOperand(0).getGlobal()->getName().str();
                    } else if (I->getOperand(0).isSymbol()) {
                        FunctionsCalledByCallee.insert(std::string(I->getOperand(0).getSymbolName()));
                        FunctionName = std::string(I->getOperand(0).getSymbolName());
                    }
                    std::multimap<std::string, unsigned>::iterator it = FunctionsArguments->info.find(FunctionName);

                    if (it == FunctionsArguments->info.end()) {
                        it = FunctionsCalled->info.find(FunctionName);
                        numValArgument = (*it).second;
                        numValReturn = FunctionsReturns->info.find(FunctionName)->second;

                    } else {
                        numValArgument = (*it).second;
                        numValReturn = FunctionsReturns->info.find(FunctionName)->second;
                    }

                    dbgs() << "Func: " << FunctionName << " NumValArg: " << numValArgument << " NumReturn: " << numValReturn << "\n";

                } else if (I->isReturn()) {
                    numValReturn = FunctionsReturns->info.find(MF->getName().str())->second;
                }

                MCInst Tmp;
                TmpInst.push_back(Tmp);
                MCInstLowering.Lower(I, TmpInst0, TmpInst[i++], I->isInsideBundle(), numValArgument, numValReturn);
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
        OutStreamer->EmitInstruction(TmpInst0, getSubtargetInfo());
    } else {
        unsigned numValReturn = 0;
        unsigned numValArgument = 0;

        if (MI->isCall()) {
            std::string FunctionName;

            if (MI->getOperand(0).isGlobal()) {
                FunctionsCalledByCallee.insert(MI->getOperand(0).getGlobal()->getName().str());
                FunctionName = MI->getOperand(0).getGlobal()->getName().str();
            } else if (MI->getOperand(0).isSymbol()) {
                FunctionsCalledByCallee.insert(std::string(MI->getOperand(0).getSymbolName()));
                FunctionName = std::string(MI->getOperand(0).getSymbolName());
            }
            std::multimap<std::string, unsigned>::iterator it = FunctionsArguments->info.find(FunctionName);

            if (it == FunctionsArguments->info.end()) {
                it = FunctionsCalled->info.find(FunctionName);
                numValArgument = (*it).second;
                numValReturn = FunctionsReturns->info.find(FunctionName)->second;

            } else {
                numValArgument = (*it).second;
                numValReturn = FunctionsReturns->info.find(FunctionName)->second;
            }
            dbgs() << "Func: " << FunctionName << " NumValArg: " << numValArgument << " NumReturn: " << numValReturn << "\n";

        } else if (MI->isReturn()) {
            numValReturn = FunctionsReturns->info.find(MF->getName().str())->second;
        }

        MCInstLowering.Lower(MI, TmpInst0, TmpInst0, false, numValReturn, numValArgument);
        OutStreamer->EmitInstruction(TmpInst0, getSubtargetInfo());
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
    unsigned StackSize = MF->getFrameInfo()->getStackSize() == 0 ? 0 : RoundUpToAlignment(MF->getFrameInfo()->getStackSize(), 32);
    OutStreamer->EmitRawText(".section .text \n.proc \n.entry caller, sp=$r0.1, rl=$l0.0, asize=-" +
                            Twine(StackSize) +
                            ", arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32)");
    OutStreamer->EmitRawText(Twine(CurrentFnSym->getName())+"::");
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
    OutStreamer->EmitRawText(".endp\n");
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

void VEXAsmPrinter::EmitEndOfAsmFile(Module &M) {
    
//    for (Module::iterator I = M.begin(), E = M.end(); I != E; ++I) {
//        if (I->isDeclaration()) {
//            OutStreamer->EmitRawText(".import " + I->getName() + "\n");
//            OutStreamer->EmitRawText(".type " + I->getName() + ", @function\n");
//        }
//    }
    for(StringRef FuncCall: FunctionsCalledByCallee) {
        OutStreamer->EmitRawText(".import " + FuncCall.str() + "\n");
        OutStreamer->EmitRawText(".type " + FuncCall.str() + ", @function\n");
    }
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
    if (ExtraCode && ExtraCode[0]) {
        if (ExtraCode[1] != 0) return true; // Unknown modifier.
        
        switch (ExtraCode[0]) {
            default:
                // See if this is a generic print operand
                return AsmPrinter::PrintAsmOperand(MI, OpNo, AsmVariant, ExtraCode, O);
            case 'r':
                break;
        }
    }
    
    const MachineOperand &MO = MI->getOperand(OpNo);
    switch (MO.getType()) {
        default:
            return true;  // Unknown modifier.
        case MachineOperand::MO_Immediate: // Substitute immediate value without immediate syntax
            O << MO.getImm();
            return false;
        case MachineOperand::MO_Register:
            O << "$" << StringRef(VEXInstPrinter::getRegisterName(MO.getReg())).lower();
            return false;
    }
    
    return false;
}

// Force static initialization.
extern "C" void LLVMInitializeVEXAsmPrinter() {
  RegisterAsmPrinter<VEXAsmPrinter> X(TheVEXTarget);
  RegisterAsmPrinter<VEXAsmPrinter> Y(TheVEXNewTarget);
}

