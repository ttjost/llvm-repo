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
        case VEXISD::RET:           return "VEXISD::RET";
            
        case VEXISD::MAX:           return "VEXISD::MAX";
        
        case VEXISD::MAXU:          return "VEXISD::MAXU";
        
        case VEXISD::MIN:           return "VEXISD::MIN";
            
        case VEXISD::MINU:          return "VEXISD::MINU";
            
        case VEXISD::WRAPPER:       return "VEXISD::WRAPPER";
            
        case VEXISD::PSEUDO_RET:    return "VEXISD::PSEUDO_RET";

//        case VEXISD::BR:            return "VEXISD::BR";

//        case VEXISD::BRF:           return "VEXISD::BRF";

//        case VEXISD::CALL:   return "VEXISD::CALL";
        case VEXISD::PSEUDO_CALL:   return "VEXISD::PSEUDO_CALL";
        
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
        case ISD::GlobalAddress:        return LowerGlobalAddress(Op, DAG);
        case ISD::ExternalSymbol:       return LowerExternalSymbol(Op, DAG);
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

// Value is a value of type VA.getValVT() that we need to copy into
// the location described by VA.  Return a copy of Value converted to
// VA.getValVT().  The caller is responsible for handling indirect values.
static SDValue convertValVTToLocVT(SelectionDAG &DAG, SDLoc DL,
                                   CCValAssign &VA, SDValue Value) {


    switch (VA.getLocInfo()) {
    case CCValAssign::SExt:
        return DAG.getNode(ISD::SIGN_EXTEND, DL, VA.getLocVT(), Value);
    case CCValAssign::ZExt:
        return DAG.getNode(ISD::ZERO_EXTEND, DL, VA.getLocVT(), Value);
    case CCValAssign::AExt:
        return DAG.getNode(ISD::ANY_EXTEND, DL, VA.getLocVT(), Value);
    case CCValAssign::Full:
        return Value;
    default:
        llvm_unreachable("Cannot convert type!");
    }
}


SDValue
VEXTargetLowering::LowerCall(CallLoweringInfo &CLI,
            SmallVectorImpl<SDValue> &InVals) const {

    SelectionDAG &DAG = CLI.DAG;

    DAG.dump();

    SDLoc &DL = CLI.DL;
    SmallVectorImpl<ISD::OutputArg> &Outs = CLI.Outs;
    SmallVectorImpl<SDValue> &OutVals = CLI.OutVals;
    SmallVectorImpl<ISD::InputArg> &Ins = CLI.Ins;
    SDValue Chain = CLI.Chain;
    SDValue Callee = CLI.Callee;
    CallingConv::ID CallConv = CLI.CallConv;
    bool IsVarArg = CLI.IsVarArg;
    MachineFunction &MF = DAG.getMachineFunction();
    EVT PtrVT = getPointerTy();
    bool &IsTailCall = CLI.IsTailCall;

    // Analyze the operands of the call, assigning locations to each operand.
    SmallVector<CCValAssign, 16> ArgLocs;
    CCState ArgCCInfo(CallConv, IsVarArg, MF, ArgLocs, *DAG.getContext());
    ArgCCInfo.AnalyzeCallOperands(Outs, CC_VEX_Address);

    // Get a count of how many bytes are to be pushed on to the stack.
    unsigned NumBytes = ArgCCInfo.getNextStackOffset();

    // Mark the start of the call.
    if (!IsTailCall)
        Chain = DAG.getCALLSEQ_START(Chain,
                                     DAG.getConstant(NumBytes, PtrVT, true),
                                     DL);
    else
        llvm_unreachable("Target does not yet support Tail Calls.");

    // Copy argument values to their designated locations.
    SmallVector<std::pair<unsigned, SDValue>, 10> RegsToPass;
    SmallVector<SDValue, 8> MemOpChains;
    SDValue StackPtr;

    for (unsigned I = 0, E = ArgLocs.size(); I != E; ++I){
        CCValAssign &VA = ArgLocs[I];
        SDValue ArgValue = OutVals[I];

        if (VA.getLocInfo() == CCValAssign::Indirect) {
            // Store the argument in a stack slot and pass its address.
            SDValue SpillSlot = DAG.CreateStackTemporary(VA.getValVT());
            int FI = cast<FrameIndexSDNode>(SpillSlot)->getIndex();
            MemOpChains.push_back(DAG.getStore(Chain, DL, ArgValue, SpillSlot,
                                               MachinePointerInfo::getFixedStack(FI),
                                               false, false, 0));
            ArgValue = SpillSlot;
        }else
            ArgValue = convertValVTToLocVT(DAG, DL, VA, ArgValue);

        if (VA.isRegLoc())
            // Queue up the argument copies and emit them at the end.
            RegsToPass.push_back(std::make_pair(VA.getLocReg(), ArgValue));
        else{
            //assert(VA.isMemLoc() && "Argument not register or memory");
            llvm_unreachable("Argument not register or memory");
        }
    }

    // Join the stores, which are independent of one another.
    if (!MemOpChains.empty())
        Chain = DAG.getNode(ISD::TokenFactor, DL, MVT::Other, MemOpChains);

    // Accept direct calls by converting symbolic call address to the
    // associated Target* opcodes.
    SDValue Glue;
    if (auto *G = dyn_cast<GlobalAddressSDNode>(Callee)) {
        Callee = DAG.getTargetGlobalAddress(G->getGlobal(), DL, MVT::i32);
        Callee = DAG.getNode(VEXISD::WRAPPER, DL, PtrVT, Callee);
    }else if (auto *E = dyn_cast<ExternalSymbolSDNode>(Callee)) {
        llvm_unreachable("Target does not implement External Symbol yet!");
        Callee = DAG.getTargetExternalSymbol(E->getSymbol(), MVT::i32);
        Callee = DAG.getNode(VEXISD::WRAPPER, DL, PtrVT, Callee);
    } else if (IsTailCall) {
        llvm_unreachable("Target does not implement tail calls!");
    }

    // Build a sequence of copy-to-reg nodes, chained and glued together.
    for (unsigned I = 0, E = RegsToPass.size(); I != E; ++I) {
        Chain = DAG.getCopyToReg(Chain, DL, RegsToPass[I].first,
                                 RegsToPass[I].second, Glue);
        Glue = Chain.getValue(1);
    }

    // The first call operand is the chain and the second is the target address.
    SmallVector<SDValue, 8> Ops;
    Ops.push_back(Chain);
    Ops.push_back(Callee);

    // Add argument registers to the end of the list so that they are
    // known live into the call.
    for (unsigned I = 0, E = RegsToPass.size(); I != E; ++I)
        Ops.push_back(DAG.getRegister(RegsToPass[I].first,
                                      RegsToPass[I].second.getValueType()));

//    // Add a register mask operand representing the call-preserved registers.
//    const VEXRegisterInfo *TRI = Subtarget.getRegisterInfo();
//    const uint32_t *Mask = TRI->getCallPreservedMask(CallConv);
//    assert (Mask && "Missing call preserved mask for calling convention");
//    Ops.push_back(DAG.getRegisterMask(Mask));

//    // Glue the call to the argument copies, if any.
    if (Glue.getNode())
        Ops.push_back(Glue);

    // Emit the Call.
    SDVTList NodeTys = DAG.getVTList(MVT::Other, MVT::Glue);

    Chain = DAG.getNode(VEXISD::PSEUDO_CALL, DL, NodeTys, Ops);
    Glue = Chain.getValue(1);

    // Mark the end of the call, which is glued to the call itself.
    Chain = DAG.getCALLSEQ_END(Chain,
                               DAG.getConstant(NumBytes, PtrVT, true),
                               DAG.getConstant(0, PtrVT, true),
                               Glue, DL);
    Glue = Chain.getValue(1);

    // Assign locations to each value returned by this call.
    SmallVector<CCValAssign, 16> RetLocs;
    CCState RetCCInfo(CallConv, IsVarArg, MF, RetLocs, *DAG.getContext());

    AnalyzeRetResult(RetCCInfo, Ins);

    // Copy all of the result registers out of their specified physreg.
    for (unsigned I = 0, E = RetLocs.size(); I != E; ++I) {
        CCValAssign &VA = RetLocs[I];

        // Copy the value out, gluing the copy to the end of the call sequence.
        Chain = DAG.getCopyFromReg(Chain, DL, VA.getLocReg(),
                                   VA.getValVT(), Glue).getValue(1);
        Glue = Chain.getValue(2);

        // Convert the value of the return register into the value that's
        // being returned.
        InVals.push_back(Chain.getValue(0));
    }

    return Chain;

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

    DAG.dump();
    MachineFunction &MF = DAG.getMachineFunction();
    MachineFrameInfo *MFI = MF.getFrameInfo();
    MachineRegisterInfo &MRI = MF.getRegInfo();;
    
    VEXFunctionInfo *FuncInfo = MF.getInfo<VEXFunctionInfo>();
    
    auto *TFL = static_cast<const VEXFrameLowering *>(Subtarget.getFrameLowering());
    
    // Assign locations to all of the incoming arguments.
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
            llvm_unreachable("Not yet implemented!");
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
    
    DAG.dump();
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

SDValue VEXTargetLowering::LowerGlobalAddress(SDValue Op, SelectionDAG &DAG) const{

    const GlobalValue *GV = cast<GlobalAddressSDNode>(Op)->getGlobal();

    int64_t Offset = cast<GlobalAddressSDNode>(Op)->getOffset();

    // Create TargetGlobalAddress node, folding in the constant offset.
    SDValue Result = DAG.getTargetGlobalAddress(GV, SDLoc(Op),
                                                getPointerTy(), Offset);

    return DAG.getNode(VEXISD::WRAPPER, SDLoc(Op),
                       getPointerTy(), Result);

}

SDValue VEXTargetLowering::LowerExternalSymbol(SDValue Op, SelectionDAG &DAG) const{

    SDLoc dl(Op);
    const char *Sym = cast<ExternalSymbolSDNode>(Op)->getSymbol();

    // Create TargetGlobalAddress node, folding in the constant offset.
    SDValue Result = DAG.getTargetExternalSymbol(Sym, getPointerTy());

    return DAG.getNode(VEXISD::WRAPPER, dl,
                       getPointerTy(), Result);
}


