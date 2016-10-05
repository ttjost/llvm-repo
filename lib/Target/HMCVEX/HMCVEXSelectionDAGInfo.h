//===-- HMCVEXSelectionDAGInfo.h - HMCVEX SelectionDAG Info ---------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file defines the HMCVEX subclass for TargetSelectionDAGInfo.
//
//===----------------------------------------------------------------------===//

#ifndef HMCVEXSELECTIONDAGINFO_H
#define HMCVEXSELECTIONDAGINFO_H

#include "llvm/Target/TargetSelectionDAGInfo.h"

namespace llvm {
    
    class HMCVEXTargetMachine;
    
    class HMCVEXSelectionDAGInfo : public TargetSelectionDAGInfo {
    public:
        explicit HMCVEXSelectionDAGInfo(const DataLayout &DL);
        ~HMCVEXSelectionDAGInfo();
    };
}


#endif
