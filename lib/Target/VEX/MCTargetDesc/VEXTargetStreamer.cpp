//===-- VEXTargetStreamer.cpp - VEX Target Streamer ----------*- C++ -*--===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "VEXTargetStreamer.h"
#include "InstPrinter/VEXInstPrinter.h"
#include "llvm/Support/FormattedStream.h"

using namespace llvm;

VEXTargetStreamer::VEXTargetStreamer(MCStreamer &S) : MCTargetStreamer(S) {}

void VEXTargetStreamer::anchor() {}


VEXTargetAsmStreamer::VEXTargetAsmStreamer(MCStreamer &S,
                                           formatted_raw_ostream &OS)
    : VEXTargetStreamer(S), OS(OS) {}

//void VEXTargetAsmStreamer::EmitBytes(StringRef Data){

//    assert(getCurrentSection().first &&
//           "Cannot emit contents before setting section!");
//    if (Data.empty()) return;

//    if (Data.size() == 1) {
//      OS << MAI->getData8bitsDirective();
//      OS << (unsigned)(unsigned char)Data[0];
//      EmitEOL();
//      return;
//    }

//    // If the data ends with 0 and the target supports .asciz, use it, otherwise
//    // use .ascii
//    if (MAI->getAscizDirective() && Data.back() == 0) {
//      OS << MAI->getAscizDirective();
//      Data = Data.substr(0, Data.size()-1);
//    } else {
//      OS << MAI->getAsciiDirective();
//    }

//    PrintQuotedString(Data, OS);
//    EmitEOL();

//}


VEXTargetElfStreamer::VEXTargetElfStreamer(MCStreamer &S)
    : VEXTargetStreamer(S) {}

//void VEXTargetElfStreamer::EmitBytes(StringRef Data){


//}
