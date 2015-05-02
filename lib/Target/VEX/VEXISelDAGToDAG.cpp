//===-- VEXISelDAGToDAG.cpp - Top-level interface for VEX representation ----*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
//  This file defines an instruction selector for the VEX Target
//
//===----------------------------------------------------------------------===//

#include "VEXISelDAGToDAG.h"
#include "VEX.h"

#include "VEXMachineFunction.h"
#include "VEXRegisterInfo.h"
#include "VEXSubtarget.h"
#include "VEXTargetMachine.h"
#include "MCTargetDesc/VEXBaseInfo.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/IR/Type.h"
#include "llvm/CodeGen/MachineConstantPool.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/SelectionDAGISel.h"
#include "llvm/CodeGen/SelectionDAGNodes.h"
#include "llvm/Target/TargetMachine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

#define DEBUG_TYPE "vex-isel"

//===----------------------------------------------------------------------===//
// Instruction Selector Implementation
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// VEXDAGToDAGISel - VEX specific code to select VEX machine
// instructions for SelectionDAG operations.
//===----------------------------------------------------------------------===//

bool VEXDAGToDAGISel::runOnMachineFunction(MachineFunction &MF){
    DEBUG(errs() << "Testing the debug message\n\n");
    bool Ret = SelectionDAGISel::runOnMachineFunction(MF);
    DEBUG(errs() << "Testing the debug message\n\n");

    return Ret;
}


bool VEXDAGToDAGISel::SelectAddr(SDValue Addr, SDValue &Base, SDValue &Offset) {
    if (FrameIndexSDNode *FIN = dyn_cast<FrameIndexSDNode>(Addr)) {
        Base = CurDAG->getTargetFrameIndex(FIN->getIndex(), TLI->getPointerTy());
        Offset = CurDAG->getTargetConstant(0, MVT::i32);
        return true;
    }
    if (Addr.getOpcode() == ISD::TargetExternalSymbol ||
        Addr.getOpcode() == ISD::TargetGlobalAddress ||
        Addr.getOpcode() == ISD::TargetGlobalTLSAddress)
        return false;  // direct calls.
    
    if (Addr.getOpcode() == ISD::ADD) {
        if (ConstantSDNode *CN = dyn_cast<ConstantSDNode>(Addr.getOperand(1))) {
            if (isInt<13>(CN->getSExtValue())) {
                if (FrameIndexSDNode *FIN =
                    dyn_cast<FrameIndexSDNode>(Addr.getOperand(0))) {
                    // Constant offset from frame ref.
                    Base =
                    CurDAG->getTargetFrameIndex(FIN->getIndex(), TLI->getPointerTy());
                } else {
                    Base = Addr.getOperand(0);
                }
                Offset = CurDAG->getTargetConstant(CN->getZExtValue(), MVT::i32);
                return true;
            }
        }
//        if (Addr.getOperand(0).getOpcode() == SPISD::Lo) {
//            Base = Addr.getOperand(1);
//            Offset = Addr.getOperand(0).getOperand(0);
//            return true;
//        }
//        if (Addr.getOperand(1).getOpcode() == SPISD::Lo) {
//            Base = Addr.getOperand(0);
//            Offset = Addr.getOperand(1).getOperand(0);
//            return true;
//        }
    }
    Base = Addr;
    Offset = CurDAG->getTargetConstant(0, MVT::i32);
    return true;
}
// Select instructions not customized!
// Used for expanded, promoted and normal instructions
SDNode * VEXDAGToDAGISel::Select(SDNode *Node){

    unsigned Opcode = Node->getOpcode();

    DEBUG(errs() << "Selecting New node\n");

    // Dump information about the Node being selected
    DEBUG(errs() << "Selecting: "; Node->dump(CurDAG); errs() << "\n");

    // If we have a custom node, we already have selected!
    if(Node->isMachineOpcode()){
        DEBUG(errs() << "== "; Node->dump(CurDAG); errs() << "\n");
        Node->setNodeId(-1);
        return nullptr;
    }

    // See if subclasses can handle this node
    std::pair<bool, SDNode*> Ret = selectNode(Node);
    DEBUG(errs() << "finished selectNode\n");
    if(Ret.first)
        return Ret.second;
    DEBUG(errs() << "part 2");
    // Select the default instruction
    SDNode *ResNode = SelectCode(Node);
    
    DEBUG(errs() << "part 3");
    DEBUG(errs() << "=>");
    if(ResNode == NULL || ResNode == Node)
        DEBUG(Node->dump(CurDAG));
    else
        DEBUG(ResNode->dump(CurDAG));
    DEBUG(errs() << "\n");
    
    return ResNode;

}

std::pair<bool, SDNode*> VEXDAGToDAGISel::selectNode(SDNode *Node){
    
    unsigned Opcode = Node->getOpcode();

    SDLoc DL(Node);

    // Instruction Selection not handled by the auto-generated
    // tablegen selection should be handled here.
    SDNode *Result;

    EVT NodeTy = Node->getValueType(0);
    unsigned MultOpc;

    switch(Opcode){
            case VEX::RET:
            
            break;
        default: break;
    }

    return std::make_pair(false, nullptr);

}

// createVEXISelDag - This pass converts a legalized DAG into a
// VEX-specific DAG, ready for instruction scheduling.
FunctionPass *llvm::createVEXISelDag(VEXTargetMachine &TM){
    return new VEXDAGToDAGISel(TM);
}
