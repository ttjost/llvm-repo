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

#include "VEXMachineFunctionInfo.h"
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
            
        case VEXISD::PSEUDO_RET: return "VEXISD::PSEUDO_RET";

//        case VEXISD::BR:        return "VEXISD::BR";

//        case VEXISD::BRF:        return "VEXISD::BRF";
        
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
    addRegisterClass(MVT::i1, &VEX::BrRegsRegClass);
    //addRegisterClass(MVT::i32, &VEX::LrRegRegClass);
    
    // must, computeRegisterProperties - Once all of the register classes are
    //  added, this allows us to compute derived properties we expose.
    computeRegisterProperties(STI.getRegisterInfo());

    setOperationAction(ISD::BR_CC, MVT::i32, Promote);
    setOperationAction(ISD::GlobalAddress, MVT::i32, Custom);

    //setSchedulingPreference(Sched::VLIW);
    
}

SDValue VEXTargetLowering::LowerOperation(SDValue Op, SelectionDAG &DAG) const {

    DEBUG(errs() << "Lower Operation\n");
    switch (Op.getOpcode()) {
        case ISD::GlobalAddress:        return lowerGlobalAddress(Op, DAG);
        default:
            break;
    }

    return Op;

}

//===----------------------------------------------------------------------===//
//  Misc Lower Operation implementation
//===----------------------------------------------------------------------===//

#include "VEXGenCallingConv.inc"

//===----------------------------------------------------------------------===//
//  Lower helper functions
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
//                              Auxiliar methods
//===----------------------------------------------------------------------===//
static void AnalyzeRetResult(CCState &State,
                             const SmallVectorImpl<ISD::InputArg> &Ins){
    State.AnalyzeCallResult(Ins, RetCC_VEX);
}

static void AnalyzeRetResult(CCState &State,
                             const SmallVectorImpl<ISD::OutputArg> &Outs){
    State.AnalyzeReturn(Outs, RetCC_VEX);
}

template<typename ArgT>
static void AnalyzeReturnValues(CCState &State,
                                SmallVectorImpl<CCValAssign> &RVLocs,
                                const SmallVectorImpl<ArgT> &Args){
    AnalyzeRetResult(State, Args);
}

// Value is a value that has been passed to us in the location described by VA
// (and so has type VA.getLocVT()).  Convert Value to VA.getValVT(), chaining
// any loads onto Chain.
// TODO: Is that really neccessary?
static SDValue convertLocVTToValVT(SelectionDAG &DAG, SDLoc DL,
                                   CCValAssign &VA, SDValue Chain,
                                   SDValue Value){
    // If the argument has been promoted from a smaller type,
    // insert an assertion to capture this.
    if (VA.getLocInfo() == CCValAssign::SExt)
        Value = DAG.getNode(ISD::AssertSext, DL, VA.getLocVT(), Value,
                            DAG.getValueType(VA.getValVT()));
   else if (VA.getLocInfo() == CCValAssign::ZExt)
            Value = DAG.getNode(ISD::AssertZext, DL, VA.getLocVT(), Value,
                                DAG.getValueType(VA.getValVT()));

    if (VA.isExtInLoc())
        Value = DAG.getNode(ISD::TRUNCATE, DL, VA.getValVT(), Value);
    else if (VA.getLocInfo() == CCValAssign::Indirect)
        Value = DAG.getLoad(VA.getValVT(), DL, Chain, Value,
                            MachinePointerInfo(), false, false, false, 0);
    else if (VA.getLocInfo() == CCValAssign::BCvt) {
        // If this is a short vector argument loaded from the stack,
        // extend from i64 to full vector size and then bitcast.
        assert(VA.getLocVT() == MVT::i64);
        assert(VA.getValVT().isVector());
        Value = DAG.getNode(ISD::BUILD_VECTOR, DL, MVT::v2i64,
                            Value, DAG.getUNDEF(MVT::i64));
        Value = DAG.getNode(ISD::BITCAST, DL, VA.getValVT(), Value);
    } else
        assert(VA.getLocInfo() == CCValAssign::Full && "Unsupported getLocInfo");

    return Value;
}

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
    DEBUG(errs() << "LowerFormalArguments\n");

    MachineFunction &MF = DAG.getMachineFunction();
    MachineFrameInfo *MFI = MF.getFrameInfo();
    MachineRegisterInfo &MRI = MF.getRegInfo();;
    
    VEXFunctionInfo *FuncInfo = MF.getInfo<VEXFunctionInfo>();
    
    auto *TFL = static_cast<const VEXFrameLowering *>(Subtarget.getFrameLowering());
    
    // Assign locations to all of ht eincoming arguments.
    SmallVector<CCValAssign, 16> ArgLocs;
    CCState CCInfo(CallConv, IsVarArg, MF, ArgLocs, *DAG.getContext());
    
    CCInfo.AnalyzeFormalArguments(Ins, CC_VEX_Address);
    
    unsigned NumFixedGPRs = 0;
    
    for (unsigned I = 0, E = ArgLocs.size(); I != E; ++I){
        SDValue ArgValue;
        CCValAssign &VA = ArgLocs[I];
        EVT LocVT = VA.getLocVT();
        
        if (VA.isRegLoc()){
            // Arguments passed in registers
            const TargetRegisterClass *RC;
            switch (LocVT.getSimpleVT().SimpleTy) {
                default:
                    // Integers smaller than i32 should be promoted
                    // TOCHECK : Is that correct?
                    // TODO: Check if We need to pass any other types as argument registers
                    // For now, we only accept i8, i16 and i32 into argument registers
                    llvm_unreachable("Unexpected argument type");
                    break;
                    
                case MVT::i8:
                    NumFixedGPRs += 1;
                    RC = &VEX::GPRegsRegClass;
                    break;
                
                case MVT::i16:
                    NumFixedGPRs += 1;
                    RC = &VEX::GPRegsRegClass;
                    break;
                
                case MVT::i32:
                    NumFixedGPRs += 1;
                    RC = &VEX::GPRegsRegClass;
                    break;
            }
            
            unsigned VReg = MRI.createVirtualRegister(RC);
            MRI.addLiveIn(VA.getLocReg(), VReg);
            ArgValue = DAG.getCopyFromReg(Chain, DL, VReg, LocVT);
        }else{
            assert(VA.isMemLoc() && "Argument not register or memory");
            
            // Create the frame index object for this incoming parameter.
            int FI = MFI->CreateFixedObject(LocVT.getSizeInBits()/8, VA.getLocMemOffset(), true);
            
            // Create the SelectionDAG nodes corresponding to a load
            // from this parameter. Unpromoted ints are passed
            // as right-justified 8-byte values.
            EVT PtrVT = getPointerTy();
            SDValue FIN = DAG.getFrameIndex(FI, PtrVT);
            
            if (VA.getLocVT() == MVT::i32)
                FIN = DAG.getNode(ISD::ADD, DL, PtrVT, FIN,
                                  DAG.getIntPtrConstant(4));
            ArgValue = DAG.getLoad(LocVT, DL, Chain, FIN,
                                   MachinePointerInfo::getFixedStack(FI), false, false, false, 0);
        }
        
        // Convert the value of the argument register into the value that's
        // being passed.
        InVals.push_back(convertLocVTToValVT(DAG, DL, VA, Chain, ArgValue));
    }

    if (IsVarArg)
        llvm_unreachable("Variable number of arguments not yet implemented!");
    
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
    
    // CCValAssign - represent the assignment of the return value to a location
    SmallVector<CCValAssign, 16> RVLocs;
    
    // CCState - Info about the registers and stack slot.
    CCState CCInfo(CallConv, IsVarArg, DAG.getMachineFunction(), RVLocs,
                   *DAG.getContext());
    
    // Analyze return values.
    AnalyzeReturnValues(CCInfo, RVLocs, Outs);
    
    SDValue Flag;
    SmallVector<SDValue, 8> RetOps(1, Chain);
    
    // Copy the result values into the output registers.
    for (unsigned i = 0; i != RVLocs.size(); ++i){
        CCValAssign &VA = RVLocs[i];
        assert(VA.isRegLoc() && "Can only return in registers!");
        
        Chain = DAG.getCopyToReg(Chain, DL, VA.getLocReg(), OutVals[i], Flag);
        
        // Guarantee that all emitted copies are stuck together,
        // avoiding something bad.
        Flag = Chain.getValue(1);
        RetOps.push_back(DAG.getRegister(VA.getLocReg(), VA.getLocVT()));
    }
    
    RetOps[0] = Chain; // Update Chain.
    
    // Add the flag if we have it.
    if (Flag.getNode())
        RetOps.push_back(Flag);
    
    return DAG.getNode(VEXISD::PSEUDO_RET, DL, MVT::Other, RetOps);
}

SDValue VEXTargetLowering::lowerGlobalAddress(SDValue Op, SelectionDAG &DAG) const{

    const GlobalValue *GV = cast<GlobalAddressSDNode>(Op)->getGlobal();

    int64_t Offset = cast<GlobalAddressSDNode>(Op)->getOffset();

    // Create TargetGlobalAddress node, folding in the constant offset.
    SDValue Result = DAG.getTargetGlobalAddress(GV, SDLoc(Op),
                                                getPointerTy(), Offset);

    return DAG.getNode(VEXISD::WRAPPER, SDLoc(Op),
                       getPointerTy(), Result);

}
