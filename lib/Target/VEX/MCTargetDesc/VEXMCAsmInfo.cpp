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

    Data8bitsDirective          = "\t.data1\t";
    Data16bitsDirective         = "\t.data2\t";
    Data32bitsDirective         = "\t.data4\t";
    Data64bitsDirective         = "\t.data8\t";
    PrivateGlobalPrefix         = "$";
    CommentString               = "##";
    UseDataRegionDirectives     = true;

    //ZeroDirective               = "\t.space\t";
    //GPRel32Directive            = "\t.gpword\t";
    //GPRel64Directive            = "\t.gpdword\t";
    //WeakRefDirective            = "\t.weak\t";
    //UseAssignmentForEHBegin = true;

    //SupportsDebugInformation = true;
    //ExceptionsType = ExceptionHandling::DwarfCFI;
    //DwarfRegNumForCFI = true;

    //UseDataRegionDirectives = true;
}
