//===-- VEXMCAsmInfo.cpp - VEX Asm Properties ---------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the declarations of the VEXMCAsmInfo properties.
//
//===----------------------------------------------------------------------===//

#include "VEXMCAsmInfo.h"

#include "llvm/MC/MCStreamer.h"
#include "llvm/ADT/Triple.h"

using namespace llvm;

void VEXMCAsmInfo::anchor() { }

VEXMCAsmInfo::VEXMCAsmInfo(StringRef TT) {
    Triple TheTriple(TT);
    if ((TheTriple.getArch() == Triple::vex))
        isNewScheduling = false;

    AlignmentIsInBytes          = false;
    LabelSuffix                 = "::";
    
    ZeroDirective               = "\t.skip\t";

    Data8bitsDirective          = "\t.data1\t";
    Data16bitsDirective         = "\t.data2\t";
    Data32bitsDirective         = "\t.data4\t";
    Data64bitsDirective         = "\t.data8\t";
    PrivateGlobalPrefix         = "$";
    CommentString               = "##";
    UseDataRegionDirectives     = true;
    HasDotTypeDotSizeDirective  = false;
    HasFunctionAlignment        = false;
    HasSingleParameterDotFile   = false;
    
    // We need this to omit the AsmPrinter from printing
    // an unwanted .globl <NameOfTheFunction> directive.
    // A Modification in MCAsmStreamer::EmitSymbolAttribute Function was also done.
    // See "case MCSA_Global:". I added a verification if GlobalDirective is nullptr.
    // This maybe a problem in the future, so we need to be aware of that.
    GlobalDirective             = nullptr;

}
