//===-- HMCVEXTargetStreamer.cpp - HMCVEX Target Streamer ----------*- C++ -*--===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "HMCVEXTargetStreamer.h"
#include "InstPrinter/HMCVEXInstPrinter.h"
#include "llvm/Support/FormattedStream.h"

using namespace llvm;

HMCVEXTargetStreamer::HMCVEXTargetStreamer(MCStreamer &S) : MCTargetStreamer(S) {}

void HMCVEXTargetStreamer::anchor() {}

void HMCVEXTargetStreamer::EmitBytes(StringRef Data) {}


HMCVEXTargetAsmStreamer::HMCVEXTargetAsmStreamer(MCStreamer &S,
                                           formatted_raw_ostream &OS)
    : HMCVEXTargetStreamer(S), OS(OS) {}

void HMCVEXTargetAsmStreamer::EmitBytes(StringRef Data) {

        OS << (unsigned)(unsigned char)Data[0] << "Testesssssssssssssss";

}


HMCVEXTargetElfStreamer::HMCVEXTargetElfStreamer(MCStreamer &S)
    : HMCVEXTargetStreamer(S) {}

//void HMCVEXTargetElfStreamer::EmitBytes(StringRef Data){


//}
