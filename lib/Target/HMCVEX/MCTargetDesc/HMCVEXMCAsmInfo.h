//===-- HMCVEXMCAsmInfo.h - HMCVEX Asm Info ------------------------*- C++ -*--===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the declaration of the HMCVEXMCAsmInfo class.
//
//===----------------------------------------------------------------------===//

#ifndef HMCVEXTARGETASMINFO_H
#define HMCVEXTARGETASMINFO_H

#include "llvm/MC/MCAsmInfo.h"

namespace llvm {
    
    class Triple;
    
    class Target;

    class HMCVEXMCAsmInfo : public MCAsmInfo {
        virtual void anchor();

        bool isNewScheduling;
    public:
        explicit HMCVEXMCAsmInfo(const Triple &TT);
    };

} // namespace llvm

#endif
