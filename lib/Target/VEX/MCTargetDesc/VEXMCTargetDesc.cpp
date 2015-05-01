//===-- VEXMCTargetDesc.cpp - VEX Target Descriptions -------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file provides VEX specific target descriptions.
//
//===----------------------------------------------------------------------===//

#include "VEXMCTargetDesc.h"

#include "llvm/MC/MachineLocation.h"
#include "llvm/MC/MCCodeGenInfo.h"
#include "llvm/MC/MCELFStreamer.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCRegisterInfo.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/MC/MCSymbol.h"

#include "llvm/ADT/STLExtras.h"

#include "llvm/Support/CommandLine.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/FormattedStream.h"
#include "llvm/Support/TargetRegistry.h"

#include "InstPrinter/VEXInstPrinter.h"
#include "VEXMCAsmInfo.h"

using namespace llvm;

#define GET_INSTRINFO_MC_DESC
#include "VEXGenInstrInfo.inc"

#define GET_SUBTARGETINFO_MC_DESC
#include "VEXGenSubtargetInfo.inc"

#define GET_REGINFO_MC_DESC
#include "VEXGenRegisterInfo.inc"

// Select the VEX Architecture Feature for the given triple and cpu name
// The function will be called at command 'llvm-objdump -d' for VEX elf input
// FIXME:  Is this really necessary?
static StringRef selectVEXArchFeature(StringRef TT, StringRef CPU){
    std::string VEXArchFeature;

    if(CPU.empty() || CPU == "generic"){
        Triple TheTriple(TT);
        if(TheTriple.getArch() == Triple::vex ||
           TheTriple.getArch() == Triple::vexnew)
            if(CPU.empty() || CPU == "vex_I")
                VEXArchFeature = "+vexI";
            else if (CPU == "VEX_II")
                VEXArchFeature = "+vexII";
    }
    return VEXArchFeature;
}

static MCInstrInfo *createVEXMCInstrInfo(){
    MCInstrInfo *X = new MCInstrInfo();
    InitVEXMCInstrInfo(X);  // defined in VEXGenRegisterInfo.inc
    return X;
}

static MCRegisterInfo *createVEXMCRegisterInfo(StringRef TT){
    MCRegisterInfo *X = new MCRegisterInfo();
    InitVEXMCRegisterInfo(X, VEX::Lr);   // defined in VEXGenRegisterInfo.inc
    return X;
}

static MCSubtargetInfo *createVEXMCSubtargetInfo(StringRef TT, StringRef CPU,
                                                 StringRef FS){
    std::string ArchFS = selectVEXArchFeature(TT, CPU);
    if(!FS.empty())
        if(ArchFS.empty())
            ArchFS = ArchFS + "," + FS.str();
        else
            ArchFS = FS;
    MCSubtargetInfo *X = new MCSubtargetInfo();
    InitVEXMCSubtargetInfo(X, TT, CPU, ArchFS); // defined in VEXGenRegisterInfo.inc
    return X;
}

static MCAsmInfo *createVEXMCAsmInfo(const MCRegisterInfo &MRI, StringRef TT){

    MCAsmInfo *MAI = new VEXMCAsmInfo(TT);
    unsigned stack_pointer = MRI.getDwarfRegNum(VEX::Reg1, true);

    MCCFIInstruction Inst = MCCFIInstruction::createDefCfa(0, stack_pointer, 0);
    MAI->addInitialFrameState(Inst);

    return MAI;
}

static MCCodeGenInfo *createVEXMCCodeGenInfo(StringRef TT, Reloc::Model RM,
                                             CodeModel::Model CM,
                                             CodeGenOpt::Level OL){
    MCCodeGenInfo *X = new MCCodeGenInfo();

    if(CM == CodeModel::JITDefault)
        RM = Reloc::Static;
    else if(RM == CodeModel::Default)
        RM = Reloc::PIC_;
    X->InitMCCodeGenInfo(RM,CM, OL);    // defined in lib/MC/MCCodeGenInfo.cpp
    return X;
}

static MCInstPrinter *createVEXMCInstPrinter(const Triple &T,
                                             unsigned SyntaxVariant,
                                             const MCAsmInfo &MAI,
                                             const MCInstrInfo &MII,
                                             const MCRegisterInfo &MRI){
    return new VEXInstPrinter(MAI, MII, MRI);
}

//LLVMInitializeVEXTargetMC
extern "C" void LLVMInitializeVEXTargetMC(){

    // Register the MC asm info.
    RegisterMCAsmInfoFn X(TheVEXTarget, createVEXMCAsmInfo);
    RegisterMCAsmInfoFn Y(TheVEXNewTarget, createVEXMCAsmInfo);

    // Register the MC codegen Info.
    TargetRegistry::RegisterMCCodeGenInfo(TheVEXTarget, createVEXMCCodeGenInfo);
    TargetRegistry::RegisterMCCodeGenInfo(TheVEXNewTarget, createVEXMCCodeGenInfo);

    // Register the MC instruction info
    TargetRegistry::RegisterMCInstrInfo(TheVEXTarget, createVEXMCInstrInfo);
    TargetRegistry::RegisterMCInstrInfo(TheVEXNewTarget, createVEXMCInstrInfo);

    // Register the MC Register Info
    TargetRegistry::RegisterMCRegInfo(TheVEXTarget, createVEXMCRegisterInfo);
    TargetRegistry::RegisterMCRegInfo(TheVEXNewTarget, createVEXMCRegisterInfo);

    // Register the MC SubtargetInfo
    TargetRegistry::RegisterMCSubtargetInfo(TheVEXTarget, createVEXMCSubtargetInfo);
    TargetRegistry::RegisterMCSubtargetInfo(TheVEXNewTarget, createVEXMCSubtargetInfo);

    // Register the MC InstPrinter
    TargetRegistry::RegisterMCInstPrinter(TheVEXTarget, createVEXMCInstPrinter);
    TargetRegistry::RegisterMCInstPrinter(TheVEXNewTarget, createVEXMCInstPrinter);

}
