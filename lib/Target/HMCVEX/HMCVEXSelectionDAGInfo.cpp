//===-- HMCVEXSelectionDAGInfo.cpp - HMCVEX SelectionDAG Info -----------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file implements the HMCVEXSelectionDAGInfo class.
//
//===----------------------------------------------------------------------===//

#include "HMCVEXSelectionDAGInfo.h"

#include "HMCVEXTargetMachine.h"

using namespace llvm;

#define DEBUG_TYPE "HMCVEX-selectiondag"

HMCVEXSelectionDAGInfo::HMCVEXSelectionDAGInfo(const DataLayout &DL)
: TargetSelectionDAGInfo() {
    DEBUG(errs() << "selectiondaginfo\n");
}

HMCVEXSelectionDAGInfo::~HMCVEXSelectionDAGInfo() {
}
