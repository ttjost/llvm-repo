//===-- VEXISelLowering.h - VEX DAG Lowering Interface --------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file defines the interfaces that VEX uses to lower LLVM code into a
// selection DAG.
//
//===----------------------------------------------------------------------===//

#ifndef VEXISELLOWERING_H
#define VEXISELLOWERING_H

#include "VEX.h"
#include "llvm/CodeGen/CallingConvLower.h"
#include "llvm/CodeGen/SelectionDAG.h"
#include "llvm/IR/Function.h"
#include "llvm/Target/TargetLowering.h"
#include <deque>

namespace llvm {
    namespace VEXISD {
        enum NodeType{
            
            // Start the numbering from where ISD NodeType finishes.
            FIRST_NUMBER = ISD::BUILTIN_OP_END,
            
            //JmpLink,
            
            THREADPOINTER,
            
            RET,
            
            PSEUDO_RET,
            MAX,
            MAXU,
            MIN,
            MINU,

            PSEUDO_CALL,

            WRAPPER,
//            BR,
//            BRF,

            DYNALLOC,
            
            SYNC
            
        };
    }

//===--------------------------------------------------------------------===//
// TargetLowering Implementation
//===--------------------------------------------------------------------===//
class VEXFunctionInfo;
class VEXSubtarget;

//@ Class VEXTargetLowering
class VEXTargetLowering : public TargetLowering{

public:
    explicit VEXTargetLowering(const VEXTargetMachine &TM,
                               const VEXSubtarget &STI);
    
    static const VEXTargetLowering *create(const VEXTargetMachine &TM,
                                           const VEXSubtarget &STI);
    
    // getTargetNodeName - This method returns the name of a target specific
    // DAG node.
    const char *getTargetNodeName(unsigned Opcode) const override;
    
protected:
    /// ByValArgInfo - Byval argument information.
    struct ByValArgInfo{
        unsigned FirstIdx;  // Index of the first register used.
        unsigned NumRegs;   // Number of registers used for this argument.
        unsigned Address;   // Offset of the stack are used to pass this argument.
        
        ByValArgInfo() : FirstIdx(0), NumRegs(0), Address(0) {}
    };
    
protected:
    // Subtarget Info
    const VEXSubtarget &Subtarget;
    
private:
    
#if 0
    // Create a TargetConstantPool node.
    SDValue getTargetNode(ConstantPoolSDNode *N, EVT Ty, SelectionDAG &DAG,
                          unsigned Flag) const;
#endif
    
    SDValue LowerOperation(SDValue Op, SelectionDAG &DAG) const override;
    
    bool isOffsetFoldingLegal(const GlobalAddressSDNode *GA) const;

    // Custom Lowering of Instructions
    
    // Lower Operand specifics
    SDValue LowerGlobalAddress(SDValue Op, SelectionDAG &DAG) const;
    SDValue LowerJumpTable(SDValue Op, SelectionDAG &DAG) const;
    SDValue LowerExternalSymbol(SDValue Op, SelectionDAG &DAG) const;
    SDValue LowerConstant(SDValue Op, SelectionDAG &DAG) const;

    SDValue
    LowerCall(CallLoweringInfo &CLI,
                SmallVectorImpl<SDValue> &InVals) const override;
    
    //- must be exist even without function all
    SDValue
    LowerFormalArguments(SDValue Chain,
                         CallingConv::ID CallConv, bool IsVarArg,
                         const SmallVectorImpl<ISD::InputArg> &Ins,
                         SDLoc dl, SelectionDAG &DAG,
                         SmallVectorImpl<SDValue> &InVals) const override;
    
    SDValue
    LowerReturn(SDValue Chain,
                CallingConv::ID CallConv, bool IsVarArg,
                const SmallVectorImpl<ISD::OutputArg> &Outs,
                const SmallVectorImpl<SDValue> &OutVals,
                SDLoc dl, SelectionDAG &DAG) const override;
    
    //SDValue LowerBRCOND(SDValue Op, SelectionDAG &DAG) const;
    
    SDValue PerformDAGCombine(SDNode *N, DAGCombinerInfo &DCI) const;
    
};

}

#endif

