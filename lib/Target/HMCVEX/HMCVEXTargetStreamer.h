//===-- HMCVEXTargetStreamer.h - HMCVEX Target Streamer ----------*- C++ -*--===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#ifndef HMCVEXTARGETSTREAMER_H
#define HMCVEXTARGETSTREAMER_H

#include "llvm/MC/MCStreamer.h"
#include "llvm/MC/MCELFStreamer.h"


namespace llvm {

class HMCVEXTargetStreamer : public MCTargetStreamer {
    virtual void anchor();

public:
    HMCVEXTargetStreamer(MCStreamer &S);
    void EmitBytes(StringRef Data);

};

class HMCVEXTargetAsmStreamer : public HMCVEXTargetStreamer {
    formatted_raw_ostream &OS;

public:
    HMCVEXTargetAsmStreamer(MCStreamer &S, formatted_raw_ostream &OS);
    
    void EmitBytes(StringRef Data);
};

class HMCVEXTargetElfStreamer : public HMCVEXTargetStreamer {

public:
    HMCVEXTargetElfStreamer(MCStreamer &S);
};

}

#endif // HMCVEXTARGETSTREAMER_H
