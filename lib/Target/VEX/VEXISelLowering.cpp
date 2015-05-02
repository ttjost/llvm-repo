//===-- VEXISelLowering.cpp - VEX DAG Lowering Implementation -----------===//
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

#include "VEXISelLowering.h"

#include "VEXMachineFunction.h"
#include "VEXTargetMachine.h"
#include "VEXSubtarget.h"

#include "llvm/ADT/Statistic.h"
#include "llvm/CodeGen/CallingConvLower.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/SelectionDAG.h"
#include "llvm/CodeGen/ValueTypes.h"
#include "llvm/IR/CallingConv.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

#define DEBUG_TYPE "vex-lower"

#if 0
SDValue VEXTargetLowering::getTargetNode(ConstantPoolSDNode *N, EVT Ty,
                                          SelectionDAG &DAG,
                                          unsigned Flag) const {
    return DAG.getTargetConstantPool(N->getConstVal(), Ty, N->getAlignment(),
                                     N->getOffset(), Flag);
}
#endif

const char *VEXTargetLowering::getTargetNodeName(unsigned Opcode) const {
    
    switch (Opcode) {
        case VEXISD::RET:       return "VEXISD::RET";
            
        case VEXISD::MAX:       return "VEXISD::MAX";
        
        case VEXISD::MAXU:      return "VEXISD::MAXU";
        
        case VEXISD::MIN:       return "VEXISD::MIN";
            
        case VEXISD::MINU:      return "VEXISD::MINU";
            
        case VEXISD::WRAPPER:   return "VEXISD::WRAPPER";
        
        default:                return NULL;
    }
}

//@VEXTargetLowering
VEXTargetLowering::VEXTargetLowering(const VEXTargetMachine &TM,
                                     const VEXSubtarget &STI)
: TargetLowering(TM), Subtarget(STI){
    //- Set .align 2
    // It will emit .align 2 later
      setMinFunctionAlignment(2);

    addRegisterClass(MVT::i32, &VEX::GPRegsRegClass);
    addRegisterClass(MVT::i32, &VEX::BrRegsRegClass);
    addRegisterClass(MVT::i32, &VEX::LrRegRegClass);
    
    // must, computeRegisterProperties - Once all of the register classes are
    //  added, this allows us to compute derived properties we expose.
    computeRegisterProperties(STI.getRegisterInfo());
    
    //setOperationAction(<#unsigned int Op#>, <#llvm::MVT VT#>, <#llvm::TargetLoweringBase::LegalizeAction Action#>)
    
    DEBUG(errs() << "1 : \n");
    DEBUG(errs() << "2 : \n");
    
}

//SDValue LowerOperation(SDValue Op, SelectionDAG &DAG) const {
//    
//    switch (Op.getOpcode()) {
//        case :
//            <#statements#>
//            break;
//            
//        default:
//            break;
//    }
//    
//}

SDValue LowerReturn(SDValue Chain, CallingConv::ID CallConv, bool isVarArg,
                    const SmallVectorImpl<ISD::OutputArg> &Outs,
                    const SmallVectorImpl<SDValue> &OutVals,
                    SDLoc dl, SelectionDAG &DAG) const {
    
}

//===----------------------------------------------------------------------===//
//  Lower helper functions
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
//  Misc Lower Operation implementation
//===----------------------------------------------------------------------===//

#include "VEXGenCallingConv.inc"

//===----------------------------------------------------------------------===//
//             Formal Arguments Calling Convention Implementation
//===----------------------------------------------------------------------===//

// @ LowerFormalArguments {
// LowerFormalArguments - transform physical registers into virtual registers
// and generate load operations for arguments places on the stack
SDValue
VEXTargetLowering::LowerFormalArguments(SDValue Chain,
                                        CallingConv::ID CallConv,
                                        bool IsVarArg,
                                        const SmallVectorImpl<ISD::InputArg> &Ins,
                                        SDLoc DL, SelectionDAG &DAG,
                                        SmallVectorImpl<SDValue> &InVals)
const {
    DEBUG(errs() << "LowerFormal : \n");
    return Chain;
    
                                        
}
// @LowerFormalArguments }

//===----------------------------------------------------------------------===//
//               Return Value Calling Convention Implementation
//===----------------------------------------------------------------------===//
SDValue
VEXTargetLowering::LowerReturn(SDValue Chain,
                               CallingConv::ID CallConv,
                               bool IsVarArg,
                               const SmallVectorImpl<ISD::OutputArg> &Outs,
                               const SmallVectorImpl<SDValue> &OutVals,
                               SDLoc DL, SelectionDAG &DAG) const {
    DEBUG(errs() << "LowerReturn : \n");
    return DAG.getNode(VEXISD::RET, DL, MVT::Other, Chain, DAG.getRegister(VEX::Lr, MVT::i32));
}


