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
            
        case VEXISD::WRAPPER:       return "VEXISD::WRAPPER";
        case VEXISD::PSEUDO_RET:    return "VEXISD::PSEUDO_RET";
        case VEXISD::PSEUDO_CALL:   return "VEXISD::PSEUDO_CALL";
            
            
        case VEXISD::MAX:           return "VEXISD::MAX";
        case VEXISD::MAXU:          return "VEXISD::MAXU";
        case VEXISD::MIN:           return "VEXISD::MIN";
        case VEXISD::MINU:          return "VEXISD::MINU";
            
        case VEXISD::ADDCG:         return "VEXISD::ADDCG";
        case VEXISD::DIVS:          return "VEXISD::DIVS";
            
        case VEXISD::ORC:           return "VEXISD::ORC";
        case VEXISD::SH1ADD:        return "VEXISD::SH1ADD";
            
        case VEXISD::MPYLL:         return "VEXISD::MPYLL";
        case VEXISD::MPYLLU:        return "VEXISD::MPYLLU";
        case VEXISD::MPYLH:         return "VEXISD::MPYLH";
        case VEXISD::MPYLHU:        return "VEXISD::MPYLHU";
        case VEXISD::MPYHH:         return "VEXISD::MPYHH";
        case VEXISD::MPYHHU:        return "VEXISD::MPYHHU";
        case VEXISD::MPYL:          return "VEXISD::MPYL";
        case VEXISD::MPYLU:         return "VEXISD::MPYLU";
        case VEXISD::MPYH:          return "VEXISD::MPYH";
        case VEXISD::MPYHU:         return "VEXISD::MPYHU";
        case VEXISD::MPYHS:         return "VEXISD::MPYHS";
        
        default:                return NULL;
    }
}

//@VEXTargetLowering
VEXTargetLowering::VEXTargetLowering(const VEXTargetMachine &TM,
                                     const VEXSubtarget &STI)
: TargetLowering(TM), Subtarget(STI){
    //- Set .align 2
    // It will emit .align 2 later
      setMinFunctionAlignment(1);

    setBooleanContents(ZeroOrOneBooleanContent);
    
    addRegisterClass(MVT::i32, &VEX::GPRegsRegClass);
    addRegisterClass(MVT::i1, &VEX::BrRegsRegClass);
    
    // must, computeRegisterProperties - Once all of the register classes are
    //  added, this allows us to compute derived properties we expose.
    computeRegisterProperties(STI.getRegisterInfo());
    
    setOperationAction(ISD::SIGN_EXTEND_INREG, MVT::i1, Expand);
    
    // Load extented operations for i1 types must be promoted
    for (MVT VT : MVT::integer_valuetypes()) {
        setLoadExtAction(ISD::EXTLOAD,  VT, MVT::i1,  Promote);
        setLoadExtAction(ISD::ZEXTLOAD, VT, MVT::i1,  Promote);
        setLoadExtAction(ISD::SEXTLOAD, VT, MVT::i1,  Promote);
    }

//    setOperationAction(ISD::ANY_EXTEND, MVT::i1, Promote);
//    setOperationAction(ISD::ANY_EXTEND, MVT::i8, Promote);
//    setOperationAction(ISD::ANY_EXTEND, MVT::i16, Promote);
    
    // See LowerConstant to see the reason for customizing i1 ISD::Constant
    setOperationAction(ISD::Constant, MVT::i1, Promote);
    setOperationAction(ISD::TRUNCATE, MVT::i1, Promote);
    setOperationAction(ISD::SETCC, MVT::i1, Promote);
    setOperationAction(ISD::SELECT, MVT::i1, Promote);
    
    setOperationAction(ISD::SELECT_CC, MVT::i1, Promote);
    setOperationAction(ISD::SELECT_CC, MVT::i8, Promote);
    setOperationAction(ISD::SELECT_CC, MVT::i16, Promote);
    setOperationAction(ISD::SELECT_CC, MVT::i32, Expand);
    setOperationAction(ISD::SELECT_CC, MVT::Other, Expand);
    
    setOperationAction(ISD::MUL, MVT::i16, Custom);
    setOperationAction(ISD::MUL, MVT::i32, Custom);

//    setOperationAction(ISD::ADDC, MVT::i32, Expand);
//    setOperationAction(ISD::SUBC, MVT::i32, Expand);

    setOperationAction(ISD::SDIV, MVT::i32, Custom);
    setOperationAction(ISD::UDIV, MVT::i32, Custom);
    setOperationAction(ISD::SREM, MVT::i32, Custom);
    setOperationAction(ISD::UREM, MVT::i32, Custom);
//    setOperationAction(ISD::SDIVREM, MVT::i32, Expand);
    
    
    setOperationAction(ISD::ADD, MVT::i1, Promote);
    setOperationAction(ISD::XOR, MVT::i1, Promote);
    setOperationAction(ISD::OR, MVT::i1, Promote);
    setOperationAction(ISD::AND, MVT::i1, Promote);
    
    setOperationAction(ISD::BR_CC, MVT::i1, Promote);
    setOperationAction(ISD::BR_CC, MVT::i8, Promote);
    setOperationAction(ISD::BR_CC, MVT::i16, Promote);
    setOperationAction(ISD::BR_CC, MVT::i32, Expand);
    setOperationAction(ISD::ROTL,  MVT::i32, Expand);
    setOperationAction(ISD::ROTR,  MVT::i32, Expand);
    
    setOperationAction(ISD::SHL_PARTS, MVT::i32, Expand);
    setOperationAction(ISD::SRA_PARTS, MVT::i32, Expand);
    setOperationAction(ISD::SRL_PARTS, MVT::i32, Expand);
    //setOperationAction(ISD::SETCC, MVT::i32, Custom);

    // Lower ADDE and ADDC
    setOperationAction(ISD::ADDE, MVT::i32, Custom);
    setOperationAction(ISD::ADDC, MVT::i32, Custom);
    setOperationAction(ISD::SUBE, MVT::i32, Custom);
    setOperationAction(ISD::SUBC, MVT::i32, Custom);
    
//    // 64-bit oprations
    setOperationAction(ISD::ADD, MVT::i64, Expand);
    setOperationAction(ISD::SUB, MVT::i64, Expand);
    setOperationAction(ISD::OR, MVT::i64, Expand);
    setOperationAction(ISD::AND, MVT::i64, Expand);
    setOperationAction(ISD::XOR, MVT::i64, Expand);
    setOperationAction(ISD::SRA, MVT::i64, Expand);
    setOperationAction(ISD::SRL, MVT::i64, Expand);
    
    
    // Lower
    setOperationAction(ISD::SMUL_LOHI, MVT::i32, Expand);
    setOperationAction(ISD::UMUL_LOHI, MVT::i32, Expand);
    
    setOperationAction(ISD::MULHU, MVT::i32, Custom);
    setOperationAction(ISD::MULHS, MVT::i32, Custom);
    setOperationAction(ISD::UMULO, MVT::i32, Custom);
    setOperationAction(ISD::SMULO, MVT::i32, Custom);
    
    setOperationAction(ISD::GlobalAddress, MVT::i8, Promote);
    setOperationAction(ISD::GlobalAddress, MVT::i16, Promote);
    setOperationAction(ISD::GlobalAddress, MVT::i32, Custom);
    setOperationAction(ISD::ExternalSymbol, MVT::i8, Promote);
    setOperationAction(ISD::ExternalSymbol, MVT::i16, Promote);
    setOperationAction(ISD::ExternalSymbol, MVT::i32, Custom);

    // Perform DAG Combination of certain instructions
    setTargetDAGCombine(ISD::SELECT);

    //setStackPointerRegisterToSaveRestore(VEX::Reg1);

    // This should be enable when we implement the VLIW Packetizer
    setSchedulingPreference(Sched::VLIW);
    
}

SDValue VEXTargetLowering::LowerOperation(SDValue Op, SelectionDAG &DAG) const {

    DEBUG(errs() << "Lower Operation\n");
    switch (Op.getOpcode()) {
        case ISD::GlobalAddress:        return LowerGlobalAddress(Op, DAG);
        case ISD::ExternalSymbol:       return LowerExternalSymbol(Op, DAG);
        //case ISD::Constant:             return LowerConstant(Op, DAG);
        case ISD::UMULO:
        case ISD::SMULO:
        case ISD::MULHS:
        case ISD::MULHU:
        case ISD::MUL:                  return LowerMUL(Op, DAG);
        case ISD::SUBE:
        case ISD::SUBC:
        case ISD::ADDE:
        case ISD::ADDC:                 return LowerADDSUBWithFlags(Op, DAG);
        case ISD::UDIV:                 return LowerUDIV(Op, DAG);
        case ISD::SDIV:                 return LowerSDIV(Op, DAG);
        case ISD::UREM:                 return LowerUREM(Op, DAG);
        case ISD::SREM:                 return LowerSREM(Op, DAG);
//        case ISD::SETCC:                return LowerSETCC(Op, DAG);
        default:
            break;
    }

    return Op;

}

bool VEXTargetLowering::isOffsetFoldingLegal(const GlobalAddressSDNode *GA) const {
    // The VEX Target isn't yet aware of offsets.
    return false;
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
    else
//        if (VA.getLocInfo() == CCValAssign::BCvt) {
//            // If this is a short vector argument loaded from the stack,
//            // extend from i64 to full vector size and then bitcast.
//            assert(VA.getLocVT() == MVT::i64);
//            assert(VA.getValVT().isVector());
//            Value = DAG.getNode(ISD::BUILD_VECTOR, DL, MVT::v2i64,
//                                Value, DAG.getUNDEF(MVT::i64));
//            Value = DAG.getNode(ISD::BITCAST, DL, VA.getValVT(), Value);
//        } else
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

    //DAG.dump();

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
        //llvm_unreachable("Target does not implement External Symbol yet!");
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

    // Add a register mask operand representing the call-preserved registers.
    const VEXRegisterInfo *TRI = Subtarget.getRegisterInfo();
    const uint32_t *Mask = TRI->getCallPreservedMask(CallConv);
    assert (Mask && "Missing call preserved mask for calling convention");
    Ops.push_back(DAG.getRegisterMask(Mask));

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
        SDValue RetValue = DAG.getCopyFromReg(Chain, DL, VA.getLocReg(),
                                   VA.getValVT(), Glue);
        Chain = RetValue.getValue(1);
        Glue = RetValue.getValue(2);

        // Convert the value of the return register into the value that's
        // being returned.
        InVals.push_back(convertLocVTToValVT(DAG, DL, VA, Chain, RetValue));
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

    if (IsVarArg)
        llvm_unreachable("Variable number of arguments not yet implemented!");

    //DAG.dump();
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
//            int FI = MFI->CreateFixedObject(LocVT.getSizeInBits()/8, VA.getLocMemOffset(), true);
            
//            // Create the SelectionDAG nodes corresponding to a load
//            // from this parameter. Unpromoted ints are passed
//            // as right-justified 8-byte values.
//            EVT PtrVT = getPointerTy();
//            SDValue FIN = DAG.getFrameIndex(FI, PtrVT);
            
//            if (VA.getLocVT() == MVT::i32)
//                FIN = DAG.getNode(ISD::ADD, DL, PtrVT, FIN,
//                                  DAG.getIntPtrConstant(4));
//            ArgValue = DAG.getLoad(LocVT, DL, Chain, FIN,
//                                   MachinePointerInfo::getFixedStack(FI), false, false, false, 0);
        }
        
        // Convert the value of the argument register into the value that's
        // being passed.
        InVals.push_back(convertLocVTToValVT(DAG, DL, VA, Chain, ArgValue));
    }
    
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
    
    //DAG.dump();
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
    for (unsigned i = 0, e = RVLocs.size() ; i != e; ++i){
        CCValAssign &VA = RVLocs[i];
        SDValue RetValue = OutVals[i];
        
        assert(VA.isRegLoc() && "Can only return in registers!");
        
        RetValue = convertValVTToLocVT(DAG, DL, VA, RetValue);
        Chain = DAG.getCopyToReg(Chain, DL, VA.getLocReg(), RetValue, Flag);
        
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


// For some reason, We need to handle MVT::i1 types and promote them manually.
// Not sure why this is not working automatically during tblgen phase, since
// it should automatically promote i1 to higher/handlable types.
//SDValue VEXTargetLowering::LowerConstant(SDValue Op, SelectionDAG &DAG) const {
//    
//    SDLoc dl(Op);
//    EVT ValueType = Op.getValueType();
//    uint64_t Val = cast<ConstantSDNode>(Op)->getZExtValue();
//    
//    if (ValueType == MVT::i1){
//        return DAG.getConstant(Val, MVT::i32);
//    }
//    return SDValue();
//}

//SDValue VEXTargetLowering::LowerSETCC(SDValue Op, SelectionDAG &DAG) const {
    
//    DEBUG(errs() << "Lower SETCC : \n");
//    SDLoc dl(Op);
    
//    SDValue lhs = Op.getOperand(0);
//    SDValue rhs = Op.getOperand(1);
//    SDValue cond = Op.getOperand(2);
    
//    ISD::CondCode CCOpcode = cast<CondCodeSDNode>(cond)->get();
//    return DAG.getNode(Op.getOpcode(), dl, MVT::i1, lhs, rhs, cond);
//}


// We should lower ADDE and ADDC instructions to ADDCG.
SDValue VEXTargetLowering::LowerADDSUBWithFlags(SDValue Op, SelectionDAG &DAG) const {

    DEBUG(errs() << "Legalizing ADDE or ADDC instruction\n");

    SDLoc dl(Op);

    bool CinFlag = Op.getOpcode() == ISD::ADDE ||  Op.getOpcode() == ISD::SUBE ? true : false;
    bool isSub = Op.getOpcode() == ISD::SUBC ||  Op.getOpcode() == ISD::SUBE ? true : false;
    
    SDValue lhs = Op.getOperand(0);
    SDValue rhs;
    SDVTList VTs = DAG.getVTList(Op.getValueType(), MVT::Glue);
    
    if (CinFlag) {

        if (isSub) {
            DEBUG(errs() << "SUBE instruction\n");
            SDValue ConstantZero = DAG.getConstant(0, MVT::i32);
            rhs = DAG.getNode(ISD::SUB, dl, MVT::i32, ConstantZero, Op.getOperand(1));
        } else {
            DEBUG(errs() << "ADDE instruction\n");
            rhs = Op.getOperand(1);
        }
        SDValue Op3 = Op.getOperand(2);
        return DAG.getNode(VEXISD::ADDCG, dl, VTs, lhs, rhs, Op3);
    } else {
        
        if (isSub) {
            DEBUG(errs() << "SUBC instruction\n");
            SDValue ConstantZero = DAG.getConstant(0, MVT::i32);
            rhs = DAG.getNode(ISD::SUB, dl, MVT::i32, ConstantZero, Op.getOperand(1));

        } else {
            DEBUG(errs() << "ADDC instruction\n");
            rhs = Op.getOperand(1);
        }
        SDValue Op3 = DAG.getConstant(0, MVT::i32);
        return DAG.getNode(VEXISD::ADDCG, dl, VTs, lhs, rhs, Op3);
    }
}

// FIXME: Can we use this function to generate code for both
// half and full mult instructions?
// VEX does not natively support 64 bit instructions, so we should
// not worry about the upper part of the result.
SDValue VEXTargetLowering::LowerMUL(SDValue Op, SelectionDAG &DAG) const {
    
    SDLoc dl(Op);

    SDValue lhs = Op.getOperand(0);
    SDValue rhs = Op.getOperand(1);
    unsigned Opc1, Opc2;
    
    bool isHalfMult = Op.getOpcode() == ISD::MUL ? true : false;

    EVT ValueType = Op.getValueType();
    
    // TODO: Do we need to change this?
    if (ValueType == MVT::i32){
        DEBUG(errs() << "ISD::MUL with MVT::i32");
        Opc1 = VEXISD::MPYLU;
        Opc2 = VEXISD::MPYHS;
    }else{
        DEBUG(errs() << "ISD::MUL with MVT::i16");
        return DAG.getNode(VEXISD::MPYLL, dl, ValueType, lhs, rhs);
    }

    SDValue FirstPart = DAG.getNode(Opc1, dl, ValueType, lhs, rhs);
    SDValue SecondPart = DAG.getNode(Opc2, dl, ValueType, lhs, rhs);
    
    return DAG.getNode(ISD::ADD, dl, ValueType, FirstPart, SecondPart);
}

SDValue VEXTargetLowering::LowerSDIV(SDValue Op, SelectionDAG &DAG) const {
    
    DEBUG(errs() << "ISD::SDIV Lowering\n");
    
    SDLoc DL(Op);
    
    SDVTList VTList = DAG.getVTList(MVT::i32, MVT::i1);
    
    SDValue Reg0 = DAG.getRegister(VEX::Reg0, MVT::i32);
    
    SDValue Zero = DAG.getConstant(0, MVT::i32);
    
//// This should be the code. But there is some problem in the RegAlloc Pass
//// that makes LLVM crash
//    SDValue CondCodeBr = DAG.getCondCode(ISD::SETNE);
//    SDValue BReg0 = DAG.getNode(ISD::SETCC, DL, MVT::i1,
//                                Reg0, Reg0, CondCodeBr);
    
    SDValue Dividend = Op.getOperand(0);
    SDValue Divisor = Op.getOperand(1);
    SDValue CondCode = DAG.getCondCode(ISD::SETLT);
    SDValue CmpDividend = DAG.getNode(ISD::SETCC, DL, MVT::i32,
                                          Dividend, Reg0, CondCode);
    SDValue CmpDivisor = DAG.getNode(ISD::SETCC, DL, MVT::i32,
                                         Divisor, Reg0, CondCode);
    
    SDValue CondCodeEq = DAG.getCondCode(ISD::SETEQ);
    SDValue CmpEq = DAG.getNode(ISD::SETCC, DL, MVT::i1,
                                CmpDividend, CmpDivisor, CondCodeEq);
    
    SDValue SubDividend = DAG.getNode(ISD::SUB, DL, MVT::i32, Reg0, Dividend);
    SDValue SubDivisor = DAG.getNode(ISD::SUB, DL, MVT::i32, Reg0, Divisor);
    SDValue SlctDividend = DAG.getNode(ISD::SELECT, DL, MVT::i32,
                                           CmpDividend, SubDividend, Dividend);
    SDValue SlctDivisor = DAG.getNode(ISD::SELECT, DL, MVT::i32,
                                          CmpDivisor, SubDivisor, Divisor);
    
    SmallVector<SDValue, 34> ADDCGNodes;
    SmallVector<SDValue, 32> DIVSNodes;
    
    ADDCGNodes.push_back(DAG.getNode(VEXISD::ADDCG, DL,
                                     VTList,
                                     SlctDividend, SlctDividend,
                                     Zero));
    
    ADDCGNodes.push_back(DAG.getNode(VEXISD::ADDCG, DL,
                                     VTList,
                                     ADDCGNodes[0].getValue(0),
                                     ADDCGNodes[0].getValue(0),
                                     Zero));
    
    DIVSNodes.push_back(DAG.getNode(VEXISD::DIVS, DL,
                                    VTList,
                                    Reg0, SlctDivisor,
                                    ADDCGNodes[0].getValue(1)));
    
    ADDCGNodes.push_back(DAG.getNode(VEXISD::ADDCG, DL,
                                     VTList,
                                     ADDCGNodes[1].getValue(0),
                                     ADDCGNodes[1].getValue(0),
                                     DIVSNodes[0].getValue(1)));
    
    for (unsigned i = 1; i < 32; i++) {
        DIVSNodes.push_back(DAG.getNode(VEXISD::DIVS, DL,
                                        VTList,
                                        DIVSNodes[i-1].getValue(0), SlctDivisor,
                                        ADDCGNodes[i].getValue(1)));
        
        ADDCGNodes.push_back(DAG.getNode(VEXISD::ADDCG, DL,
                                         VTList,
                                         ADDCGNodes[i+1].getValue(0),
                                         ADDCGNodes[i+1].getValue(0),
                                         DIVSNodes[i].getValue(1)));
    }
    
    SDValue ORC = DAG.getNode(VEXISD::ORC, DL, MVT::i32,
                              ADDCGNodes[33].getValue(0), Reg0);
    
    SDValue CondCodeRes = DAG.getCondCode(ISD::SETGE);
    
    SDValue CmpRes = DAG.getNode(ISD::SETCC, DL, MVT::i32,
                                 DIVSNodes[31].getValue(0),
                                 Reg0, CondCodeRes);
    
    SDValue SH1ADDNode = DAG.getNode(VEXISD::SH1ADD, DL,
                                     MVT::i32, ORC,
                                     CmpRes);
    
    SDValue SubRes = DAG.getNode(ISD::SUB, DL, MVT::i32, Reg0, SH1ADDNode);
    return DAG.getNode(ISD::SELECT, DL, MVT::i32, CmpEq, SH1ADDNode, SubRes);
}

SDValue VEXTargetLowering::LowerUDIV(SDValue Op, SelectionDAG &DAG) const {
    
    DEBUG(errs() << "ISD::UDIV Lowering\n");
    
    SDLoc DL(Op);
    
    SDVTList VTList = DAG.getVTList(MVT::i32, MVT::i1);
    
    SDValue Reg0 = DAG.getRegister(VEX::Reg0, MVT::i32);
    
    SDValue Zero = DAG.getConstant(0, MVT::i32);
    
//// This should be the code. But there is some problem in the RegAlloc Pass
//// that makes LLVM crash
//    SDValue CondCodeBr = DAG.getCondCode(ISD::SETNE);
//    SDValue BReg0 = DAG.getNode(ISD::SETCC, DL, MVT::i1,
//                                Reg0, Reg0, CondCodeBr);
    
    SDValue Dividend = Op.getOperand(0);
    SDValue Divisor = Op.getOperand(1);
    
    SDValue CondCode = DAG.getCondCode(ISD::SETUGE);
    SDValue CmpDividend = DAG.getNode(ISD::SETCC, DL, MVT::i32,
                                      Dividend, Divisor, CondCode);
    
    SDValue CondCodeDivisor = DAG.getCondCode(ISD::SETLT);
    SDValue CmpDivisor = DAG.getNode(ISD::SETCC, DL, MVT::i32,
                                     Divisor, Reg0, CondCodeDivisor);
    
    SDValue ShiftDividend = DAG.getNode(ISD::SRL, DL, MVT::i32,
                                        Dividend, CmpDivisor);
    SDValue ShiftDivisor = DAG.getNode(ISD::SRL, DL, MVT::i32,
                                        Divisor, CmpDivisor);
    
    SmallVector<SDValue, 34> ADDCGNodes;
    SmallVector<SDValue, 32> DIVSNodes;
    
    ADDCGNodes.push_back(DAG.getNode(VEXISD::ADDCG, DL,
                                     VTList,
                                     ShiftDividend, ShiftDividend,
                                     Zero));
    
    ADDCGNodes.push_back(DAG.getNode(VEXISD::ADDCG, DL,
                                     VTList,
                                     ADDCGNodes[0].getValue(0),
                                     ADDCGNodes[0].getValue(0),
                                     Zero));
    
    DIVSNodes.push_back(DAG.getNode(VEXISD::DIVS, DL,
                                    VTList,
                                    Reg0, ShiftDivisor,
                                    ADDCGNodes[0].getValue(1)));
    
    ADDCGNodes.push_back(DAG.getNode(VEXISD::ADDCG, DL,
                                     VTList,
                                     ADDCGNodes[1].getValue(0),
                                     ADDCGNodes[1].getValue(0),
                                     DIVSNodes[0].getValue(1)));
    
    for (unsigned i = 1; i < 32; i++) {
        DIVSNodes.push_back(DAG.getNode(VEXISD::DIVS, DL,
                                        VTList,
                                        DIVSNodes[i-1].getValue(0), ShiftDivisor,
                                        ADDCGNodes[i].getValue(1)));
        
        ADDCGNodes.push_back(DAG.getNode(VEXISD::ADDCG, DL,
                                         VTList,
                                         ADDCGNodes[i+1].getValue(0),
                                         ADDCGNodes[i+1].getValue(0),
                                         DIVSNodes[i].getValue(1)));
    }
    
    SDValue ORC = DAG.getNode(VEXISD::ORC, DL, MVT::i32,
                              ADDCGNodes[33].getValue(0), Reg0);
    
    SDValue CondCodeRes = DAG.getCondCode(ISD::SETGE);
    SDValue CmpRes = DAG.getNode(ISD::SETCC, DL, MVT::i1,
                                 DIVSNodes[31].getValue(0),
                                 Reg0, CondCodeRes);
    
    SDValue SH1ADDNode = DAG.getNode(VEXISD::SH1ADD, DL,
                                     MVT::i32, ORC,
                                     CmpRes);
    
    return DAG.getNode(ISD::SELECT, DL, MVT::i32, CmpDivisor, CmpDividend, SH1ADDNode);
}

SDValue VEXTargetLowering::LowerSREM(SDValue Op, SelectionDAG &DAG) const {
    
    DEBUG(errs() << "ISD::SREM Lowering\n");
    
    SDLoc DL(Op);
    
    SDVTList VTList = DAG.getVTList(MVT::i32, MVT::i1);
    
    SDValue Reg0 = DAG.getRegister(VEX::Reg0, MVT::i32);
    
    SDValue Zero = DAG.getConstant(0, MVT::i32);
    
//// This should be the code. But there is some problem in the RegAlloc Pass
//// that makes LLVM crash
//    SDValue CondCodeBr = DAG.getCondCode(ISD::SETNE);
//    SDValue BReg0 = DAG.getNode(ISD::SETCC, DL, MVT::i1,
//                                Reg0, Reg0, CondCodeBr);
    
    SDValue Dividend = Op.getOperand(0);
    SDValue Divisor = Op.getOperand(1);
    
    SDValue CondCode = DAG.getCondCode(ISD::SETLT);
    SDValue CmpDividend = DAG.getNode(ISD::SETCC, DL, MVT::i1,
                                      Dividend, Divisor, CondCode);
    SDValue CmpDivisor = DAG.getNode(ISD::SETCC, DL, MVT::i1,
                                     Divisor, Reg0, CondCode);
    
    SDValue SubDividend = DAG.getNode(ISD::SUB, DL, MVT::i32,
                                      Reg0, Dividend);
    SDValue SubDivisor = DAG.getNode(ISD::SUB, DL, MVT::i32,
                                     Reg0, Divisor);
    
    SDValue SelectDividend = DAG.getNode(ISD::SELECT, DL, MVT::i32,
                                         CmpDividend, SubDividend, Dividend);
    
    SDValue SelectDivisor = DAG.getNode(ISD::SELECT, DL, MVT::i32,
                                        CmpDivisor, SubDivisor, Divisor);
    
    SmallVector<SDValue, 34> ADDCGNodes;
    SmallVector<SDValue, 32> DIVSNodes;
    
    ADDCGNodes.push_back(DAG.getNode(VEXISD::ADDCG, DL,
                                     VTList,
                                     SelectDividend, SelectDividend,
                                     Zero));
    
    ADDCGNodes.push_back(DAG.getNode(VEXISD::ADDCG, DL,
                                     VTList,
                                     ADDCGNodes[0].getValue(0),
                                     ADDCGNodes[0].getValue(0),
                                     Zero));
    
    DIVSNodes.push_back(DAG.getNode(VEXISD::DIVS, DL,
                                    VTList,
                                    Reg0, SelectDivisor,
                                    ADDCGNodes[0].getValue(1)));
    
    ADDCGNodes.push_back(DAG.getNode(VEXISD::ADDCG, DL,
                                     VTList,
                                     ADDCGNodes[1].getValue(0),
                                     ADDCGNodes[1].getValue(0),
                                     DIVSNodes[0].getValue(1)));
    
    for (unsigned i = 1; i < 32; i++) {
        DIVSNodes.push_back(DAG.getNode(VEXISD::DIVS, DL,
                                        VTList,
                                        DIVSNodes[i-1].getValue(0), SelectDivisor,
                                        ADDCGNodes[i].getValue(1)));
        
        ADDCGNodes.push_back(DAG.getNode(VEXISD::ADDCG, DL,
                                         VTList,
                                         ADDCGNodes[i+1].getValue(0),
                                         ADDCGNodes[i+1].getValue(0),
                                         DIVSNodes[i].getValue(1)));
    }
    
    SDValue CondCodeRes = DAG.getCondCode(ISD::SETGE);
    SDValue CmpRes = DAG.getNode(ISD::SETCC, DL, MVT::i1,
                                 DIVSNodes[31].getValue(0),
                                 Reg0, CondCodeRes);
    
    SDValue AddRem = DAG.getNode(ISD::ADD, DL, MVT::i32,
                                 DIVSNodes[31].getValue(0),
                                 SelectDivisor);
    
    SDValue SelectRem1 = DAG.getNode(ISD::SELECT, DL, MVT::i32, CmpRes,
                                     DIVSNodes[31].getValue(0), AddRem);
    
    SDValue SubRem = DAG.getNode(ISD::SUB, DL, MVT::i32,
                                 Reg0, SelectRem1);
    
    return DAG.getNode(ISD::SELECT, DL, MVT::i32, CmpDividend,
                       SubRem, SelectRem1);
}

SDValue VEXTargetLowering::LowerUREM(SDValue Op, SelectionDAG &DAG) const {
    
    DEBUG(errs() << "ISD::UREM Lowering\n");
    
    SDLoc DL(Op);
    
    SDVTList VTList = DAG.getVTList(MVT::i32, MVT::i1);
    
    SDValue Reg0 = DAG.getRegister(VEX::Reg0, MVT::i32);
    
    SDValue Zero = DAG.getConstant(0, MVT::i32);
    
//// This should be the code. But there is some problem in the RegAlloc Pass
//// that makes LLVM crash
//    SDValue CondCodeBr = DAG.getCondCode(ISD::SETNE);
//    SDValue BReg0 = DAG.getNode(ISD::SETCC, DL, MVT::i1,
//                                Reg0, Reg0, CondCodeBr);
    
    SDValue Dividend = Op.getOperand(0);
    SDValue Divisor = Op.getOperand(1);
    
    SDValue CondCode = DAG.getCondCode(ISD::SETUGE);
    SDValue CmpDividend = DAG.getNode(ISD::SETCC, DL, MVT::i32,
                                      Dividend, Divisor, CondCode);
    
    SDValue CondCodeDivisor = DAG.getCondCode(ISD::SETLT);
    SDValue CmpDivisor = DAG.getNode(ISD::SETCC, DL, MVT::i32,
                                     Divisor, Reg0, CondCodeDivisor);
    
    SDValue ShiftDividend = DAG.getNode(ISD::SRL, DL, MVT::i32,
                                        Dividend, CmpDivisor);
    SDValue ShiftDivisor = DAG.getNode(ISD::SRL, DL, MVT::i32,
                                       Divisor, CmpDivisor);
    
    SDValue SubRem = DAG.getNode(ISD::SUB, DL, MVT::i32,
                                    Dividend, Divisor);
    
    SDValue SelectRem = DAG.getNode(ISD::SELECT, DL, MVT::i32,
                                    CmpDividend, SubRem, Divisor);
    
    SmallVector<SDValue, 34> ADDCGNodes;
    SmallVector<SDValue, 32> DIVSNodes;
    
    ADDCGNodes.push_back(DAG.getNode(VEXISD::ADDCG, DL,
                                     VTList,
                                     ShiftDividend, ShiftDividend,
                                     Zero));
    
    ADDCGNodes.push_back(DAG.getNode(VEXISD::ADDCG, DL,
                                     VTList,
                                     ADDCGNodes[0].getValue(0),
                                     ADDCGNodes[0].getValue(0),
                                     Zero));
    
    DIVSNodes.push_back(DAG.getNode(VEXISD::DIVS, DL,
                                    VTList,
                                    Reg0, ShiftDivisor,
                                    ADDCGNodes[0].getValue(1)));
    
    ADDCGNodes.push_back(DAG.getNode(VEXISD::ADDCG, DL,
                                     VTList,
                                     ADDCGNodes[1].getValue(0),
                                     ADDCGNodes[1].getValue(0),
                                     DIVSNodes[0].getValue(1)));
    
    for (unsigned i = 1; i < 32; i++) {
        DIVSNodes.push_back(DAG.getNode(VEXISD::DIVS, DL,
                                        VTList,
                                        DIVSNodes[i-1].getValue(0), ShiftDivisor,
                                        ADDCGNodes[i].getValue(1)));
        
        ADDCGNodes.push_back(DAG.getNode(VEXISD::ADDCG, DL,
                                         VTList,
                                         ADDCGNodes[i+1].getValue(0),
                                         ADDCGNodes[i+1].getValue(0),
                                         DIVSNodes[i].getValue(1)));
    }
    
    SDValue CondCodeRes = DAG.getCondCode(ISD::SETGE);
    SDValue CmpRes = DAG.getNode(ISD::SETCC, DL, MVT::i1,
                                 DIVSNodes[31].getValue(0),
                                 Reg0, CondCodeRes);
    
    SDValue AddRem = DAG.getNode(ISD::ADD, DL, MVT::i32,
                                 DIVSNodes[31].getValue(0),
                                 ShiftDivisor);
    
    SDValue SelectRem1 = DAG.getNode(ISD::SELECT, DL, MVT::i32, CmpRes,
                                     DIVSNodes[31].getValue(0), AddRem);
    
    return DAG.getNode(ISD::SELECT, DL, MVT::i32, CmpDivisor,
                                     SelectRem, SelectRem1);
}


SDValue CombineMinMax(SDLoc DL, EVT VT, SDValue lhs, SDValue rhs,
                      SDValue True, SDValue False,
                      SDValue CC, SelectionDAG &DAG) {
    
    if (!(lhs == True && rhs == False) && !(rhs == True && lhs == False))
        return SDValue();
    
    ISD::CondCode CCOpcode = cast<CondCodeSDNode>(CC)->get();
    
    switch (CCOpcode) {
        case ISD::SETULE:
        case ISD::SETULT: {
            unsigned Opc = (lhs == True) ? VEXISD::MINU : VEXISD::MAXU;
            return DAG.getNode(Opc, DL, VT, lhs, rhs);
        }
        case ISD::SETLE:
        case ISD::SETLT: {
            unsigned Opc = (lhs == True) ? VEXISD::MIN : VEXISD::MAX;
            return DAG.getNode(Opc, DL, VT, lhs, rhs);
        }
        case ISD::SETGT:
        case ISD::SETGE: {
            unsigned Opc = (lhs == True) ? VEXISD::MAX : VEXISD::MIN;
            return DAG.getNode(Opc, DL, VT, lhs, rhs);
        }
        case ISD::SETUGE:
        case ISD::SETUGT: {
            unsigned Opc = (lhs == True) ? VEXISD::MAXU : VEXISD::MINU;
            return DAG.getNode(Opc, DL, VT, lhs, rhs);
        }
        default:
            return SDValue();
    }
        
}

// We need this function to perform combination of DAG.
// Useful for instructions such as max and min, etc.
SDValue VEXTargetLowering::PerformDAGCombine(SDNode *N,
                                             DAGCombinerInfo &DCI) const {
    
    SelectionDAG &DAG = DCI.DAG;
    SDLoc DL(N);
    unsigned Opc = N->getOpcode();
    
    switch (Opc) {
        
        default:
            break;

        case ISD::SELECT:
            SDValue Cond = N->getOperand(0);
            
            if (Cond->getOpcode() == ISD::SETCC && Cond.hasOneUse()){
                EVT VT = N->getValueType(0);
                SDValue lhs = Cond.getOperand(0);
                SDValue rhs = Cond.getOperand(1);
                SDValue CC = Cond.getOperand(2);
            
                SDValue True = N->getOperand(1);
                SDValue False = N->getOperand(2);
                
                if (VT == MVT::i32)
                    return CombineMinMax(DL, VT, lhs, rhs, True, False, CC, DAG);
            }
    }
    
    return SDValue();
}


