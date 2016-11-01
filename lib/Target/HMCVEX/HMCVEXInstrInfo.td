//===-- HMCVEXInstrInfo.td - Target Description for HMCVEX Target -----------===//
//
// This file describes the HMCVEX instructions in TableGen format.
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Instruction format superclass
//===----------------------------------------------------------------------===//

include "HMCVEXInstrFormats.td"

//===----------------------------------------------------------------------===//
// Instruction Pattern Stuff
//===----------------------------------------------------------------------===//

//def simm9Op : Operand<i32> {
//  let DecoderMethod = "DecodeSIMM9";
//}

def imm32   : PatLeaf<(imm), [{ return isInt<32>(N->getSExtValue()); }]>;
def imm32Op : Operand<i32>;

//def immZExt5 : PatLeaf<(imm32), [{
//    return N->getZExtValue() == ((N->getZExtValue()) & 0x1f) ;
//}]>;

//def imm5Op  : Operand<i32>;

//// Node immediate is zero (e.g. insve.d)
//def imms : PatLeaf<(imm), [{ return isInt<1>(N->getSExtValue()); }]>;
//def immSExt8  : PatLeaf<(imm), [{ return isInt<8>(N->getSExtValue()); }]>;
//def immSExt16  : PatLeaf<(imm), [{ return isInt<16>(N->getSExtValue()); }]>;

//// Node immediate is zero (e.g. insve.d)
//def immz : PatLeaf<(imm), [{ return isInt<1>(N->getZExtValue()); }]>;
//def immZExt8  : PatLeaf<(imm), [{ return isInt<8>(N->getZExtValue()); }]>;
//def immZExt16  : PatLeaf<(imm), [{ return isInt<16>(N->getZExtValue()); }]>;

def ADDR : ComplexPattern<iPTR, 2, "SelectAddr", [frameindex], []>;

// Address operands

def HMCVEXMEMriAsmOperand : AsmOperandClass {
  let Name = "MEMri";
  let ParserMethod = "parseMEMOperand";
}

def MEM : Operand<iPTR> {
  let PrintMethod = "printMemOperand";
  let MIOperandInfo = (ops ptr_rc, imm32Op);
  let ParserMatchClass = HMCVEXMEMriAsmOperand;
}

// Used for FrameIndex Node. We need another print method, so we
// define printMemOperandEA which will be called in HMCVEXInstPrinter class
def ADDR_FI : Operand<i32> {
  let PrintMethod = "printMemOperandEA";
  let MIOperandInfo = (ops GPRegs, imm32Op);
  let EncoderMethod = "getMemEncoding";
}

def brtarget : Operand<OtherVT> {
// Methods used by Assembler and Disassembler.
  let EncoderMethod = "getBranchTargetOpValue";
  let DecoderMethod = "DecodeBranchTarget";
}

//===----------------------------------------------------------------------===//
// HMCVEX Profiles and Nodes
//===----------------------------------------------------------------------===//


//===----------------------------------------------------------------------===//
// Type Profiles.
//===----------------------------------------------------------------------===//

//def SDT_HMCVEXBranchCond : SDTypeProfile <0, 2, [SDTCisInt<0>, SDTCisVT<1, OtherVT> ]>;

def SDT_HMCVEXWrapper : SDTypeProfile <1, 1, [SDTCisSameAs<0, 1>,
                                           SDTCisPtrTy<0>]>;

def SDT_HMCVEXMov : SDTypeProfile <1, 1, [SDTCisSameAs<0, 1>,
                                    SDTCisInt<0>]>;

def SDT_HMCVEXAdd : SDTypeProfile <1, 2, [SDTCisSameAs<0, 1>,
SDTCisInt<0>]>;

def SDT_HMCVEXTWORESULT : SDTypeProfile<2, 3,
                                     [SDTCisSameAs<0, 2>,
                                     SDTCisSameAs<0, 3>,
                                     SDTCisInt<0>,
                                     SDTCisVT<1, i1>,
                                     SDTCisVT<4, i1>]>;

def SDT_HMCVEXSLCT : SDTypeProfile<1, 3,
                                    [SDTCisSameAs<0, 2>,
                                        SDTCisSameAs<0, 3>,
                                        SDTCisInt<0>,
                                        SDTCisVT<1, i1>]>;

def SDT_HMCVEXPseudoCall         : SDTypeProfile<0, -1, [SDTCisVT<0, iPTR>]>;
def SDT_HMCVEXPseudoTailCall     : SDTypeProfile<0, -1, [SDTCisVT<0, iPTR>]>;
def SDT_HMCVEXCallSeqStart : SDCallSeqStart<[SDTCisVT<0, i32>]>;
def SDT_HMCVEXCallSeqEnd   : SDCallSeqEnd<[SDTCisVT<0, i32>, SDTCisVT<1, i32>]>;

//===----------------------------------------------------------------------===//
// HMCVEX Specific Node Definitions.
//===----------------------------------------------------------------------===//

def HMCVEXPseudoRet : SDNode<"HMCVEXISD::PSEUDO_RET", SDTNone,
                          [SDNPHasChain, SDNPOptInGlue, SDNPVariadic]>;

def HMCVEXMov : SDNode<"HMCVEXISD::MOV", SDT_HMCVEXMov>;

def HMCVEXAdd : SDNode<"HMCVEXISD::ADD", SDT_HMCVEXAdd>;


def HMCVEXADDCG    : SDNode<"HMCVEXISD::ADDCG", SDT_HMCVEXTWORESULT>;
def HMCVEXDIVS     : SDNode<"HMCVEXISD::DIVS", SDT_HMCVEXTWORESULT>;

def HMCVEXWrapper : SDNode<"HMCVEXISD::WRAPPER", SDT_HMCVEXWrapper>;

def HMCVEXPseudoCall    : SDNode<"HMCVEXISD::PSEUDO_CALL", SDT_HMCVEXPseudoCall,
                        [SDNPHasChain, SDNPOutGlue,
                        SDNPOptInGlue, SDNPVariadic]>;

def HMCVEXPseudoTailCall    : SDNode<"HMCVEXISD::PSEUDO_TAILCALL", SDT_HMCVEXPseudoTailCall,
                                [SDNPHasChain, SDNPOutGlue,
                                SDNPOptInGlue, SDNPVariadic]>;

def HMCVEXCallseq_start :  SDNode<"ISD::CALLSEQ_START", SDT_HMCVEXCallSeqStart,
                               [SDNPHasChain, SDNPOutGlue]>;

def HMCVEXCallseq_end: SDNode<"ISD::CALLSEQ_END",   SDT_HMCVEXCallSeqEnd,
                           [SDNPHasChain, SDNPOptInGlue, SDNPOutGlue]>;

// **************************************************************
//                       NOT USED
//
//def HMCVEXBr       : SDNode<"HMCVEXISD::BR", SDT_HMCVEXBranchCond,
//                    [SDNPHasChain, SDNPOptInGlue]>;
//
//def HMCVEXBrf       : SDNode<"HMCVEXISD::BRF", SDT_HMCVEXBranchCond,
//                    [SDNPHasChain, SDNPOptInGlue]>;
// **************************************************************

def HMCVEXMax   : SDNode<"HMCVEXISD::MAX", SDTIntBinOp>;
def HMCVEXMaxu  : SDNode<"HMCVEXISD::MAXU", SDTIntBinOp>;
def HMCVEXMin   : SDNode<"HMCVEXISD::MIN", SDTIntBinOp>;
def HMCVEXMinu  : SDNode<"HMCVEXISD::MINU", SDTIntBinOp>;

def HMCVEXOrc      : SDNode<"HMCVEXISD::ORC", SDTIntBinOp>;
def HMCVEXSh1Add   : SDNode<"HMCVEXISD::SH1ADD", SDTIntBinOp>;

def HMCVEXSlct     : SDNode<"HMCVEXISD::SLCT", SDT_HMCVEXSLCT>;

def HMCVEXMPYLL    : SDNode<"HMCVEXISD::MPYLL", SDTIntBinOp>;
def HMCVEXMPYLLU   : SDNode<"HMCVEXISD::MPYLLU", SDTIntBinOp>;
def HMCVEXMPYLH    : SDNode<"HMCVEXISD::MPYLH", SDTIntBinOp>;
def HMCVEXMPYLHU   : SDNode<"HMCVEXISD::MPYLHU", SDTIntBinOp>;
def HMCVEXMPYHH    : SDNode<"HMCVEXISD::MPYHH", SDTIntBinOp>;
def HMCVEXMPYHHU   : SDNode<"HMCVEXISD::MPYHHU", SDTIntBinOp>;
def HMCVEXMPYL     : SDNode<"HMCVEXISD::MPYL", SDTIntBinOp>;
def HMCVEXMPYLU    : SDNode<"HMCVEXISD::MPYLU", SDTIntBinOp>;
def HMCVEXMPYH     : SDNode<"HMCVEXISD::MPYH", SDTIntBinOp>;
def HMCVEXMPYHU    : SDNode<"HMCVEXISD::MPYHU", SDTIntBinOp>;
def HMCVEXMPYHS    : SDNode<"HMCVEXISD::MPYHS", SDTIntBinOp>;


//===----------------------------------------------------------------------===//
// Instruction Class Templates
//===----------------------------------------------------------------------===//

class AlignedLoad<PatFrag Node> :
PatFrag<(ops node:$ptr), (Node node:$ptr), [{
    LoadSDNode *LD = cast<LoadSDNode>(N);
    return LD->getMemoryVT().getSizeInBits()/8 <= LD->getAlignment();
}]>;

class AlignedStore<PatFrag Node> :
PatFrag<(ops node:$val, node:$ptr), (Node node:$val, node:$ptr), [{
    StoreSDNode *SD = cast<StoreSDNode>(N);
    return SD->getMemoryVT().getSizeInBits()/8 <= SD->getAlignment();
}]>;

// Load/Store PatFrags.
def load_a          : AlignedLoad<load>;
def store_a         : AlignedStore<store>;

/// Type I
multiclass ArithLogicInstr<string OpcStr, bits<8> Opcode, SDNode OpNode, InstrItinClass Itin, bit isCommR = 0, bit isCommI = 0> {
  def r  : ArithLogic_r <Opcode,
                      (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                      !strconcat(OpcStr, " $dst = $s1, $s2"),
                      [(set GPRegs:$dst, (OpNode GPRegs:$s1, GPRegs:$s2))], Itin, isCommR>;
  def i  : ArithLogic_i <Opcode,
                      (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                      !strconcat(OpcStr, " $dst = $s1, $s2"),
                      [(set GPRegs:$dst, (OpNode GPRegs:$s1, imm32:$s2))], Itin, isCommI>;

}

multiclass ArithLogicInstrVec<string OpcStr, bits<8> Opcode, RegisterClass DstOp, RegisterClass SrcOp, SDNode OpNode, InstrItinClass Itin, bit isCommR = 0, bit isCommI = 0> {
    def r  : ArithLogic_r <Opcode,
    (outs DstOp:$dst), (ins SrcOp:$s1, SrcOp:$s2),
    !strconcat(OpcStr, " $dst = $s1, $s2"),
    [(set DstOp:$dst, (OpNode SrcOp:$s1, SrcOp:$s2))], Itin, isCommR>;
}


/// Type I
multiclass SHIFTInstr<string OpcStr, bits<8> Opcode, SDNode OpNode, InstrItinClass Itin, bit isCommR = 0, bit isCommI = 0> {
  def r  : SHIFT_r <Opcode,
                     (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                     !strconcat(OpcStr, " $dst = $s1, $s2"),
                     [(set GPRegs:$dst, (OpNode GPRegs:$s1, GPRegs:$s2))], Itin, isCommR>;
  def i  : SHIFT_i <Opcode,
                   (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                   !strconcat(OpcStr, " $dst = $s1, $s2"),
                   [(set GPRegs:$dst, (OpNode GPRegs:$s1, i32:$s2))], Itin, isCommI>;
}

/// Type I
multiclass MOVInstr<string OpcStr, bits<8> Opcode, RegisterClass DstOp, RegisterClass SrcOp, InstrItinClass Itin> {
  def r  : MOV_r <Opcode,
                     (outs DstOp:$dst), (ins SrcOp:$s1),
                     !strconcat(OpcStr, " $dst = $s1"),
                     [], Itin>;
  def i  : MOV_i <Opcode,
                     (outs DstOp:$dst), (ins i32imm:$s1),
                     !strconcat(OpcStr, " $dst = $s1"),
                     [], Itin>{
    let isMoveImm = 1;
    }
}

let isCompare = 1 in {

multiclass CMPInstr<string OpcStr, bits<8> OpVal, PatFrag cond_op,
                    InstrItinClass ItinBrReg, InstrItinClass ItinGPReg>{

def BRegr: InstHMCVEX<(outs BrRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                    !strconcat(OpcStr, " $dst = $s1, $s2"),
                    [(set BrRegs:$dst, (cond_op GPRegs:$s1, GPRegs:$s2))], ItinBrReg>;

def BRegi : InstHMCVEX<(outs BrRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                    !strconcat(OpcStr, " $dst = $s1, $s2"),
                    [(set BrRegs:$dst, (cond_op GPRegs:$s1, imm32:$s2))], ItinBrReg>;

def Regr : InstHMCVEX<(outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                    !strconcat(OpcStr, " $dst = $s1, $s2"),
                    [(set GPRegs:$dst, (cond_op GPRegs:$s1, GPRegs:$s2))], ItinGPReg>;
def Regi : InstHMCVEX<(outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                    !strconcat(OpcStr, " $dst = $s1, $s2"),
                    [(set GPRegs:$dst, (cond_op GPRegs:$s1, imm32:$s2))], ItinGPReg>;

}
}

class LoadInstr<string OpcStr, bits<8> OpVal, PatFrag OpNode, InstrItinClass Itin>
    : InstHMCVEX<(outs GPRegs:$dst), (ins MEM:$addr),
                !strconcat(OpcStr, " $dst = $addr"),
                [(set GPRegs:$dst, (OpNode ADDR:$addr))], Itin>{
//    let DecoderMethod = "DecodeMem";
    let canFoldAsLoad = 1;
    let mayLoad = 1;
}

class LoadInstrLr<string OpcStr, bits<8> OpVal, PatFrag OpNode, InstrItinClass Itin>
    : InstHMCVEX<(outs LrReg:$dst), (ins MEM:$addr),
                !strconcat(OpcStr, " $dst = $addr"),
                [(set LrReg:$dst, (OpNode ADDR:$addr))], Itin>{
    //    let DecoderMethod = "DecodeMem";
    let canFoldAsLoad = 1;
    let mayLoad = 1;
}

class LoadInstrVec<string OpcStr, bits<8> OpVal, RegisterClass RC, PatFrag OpNode, InstrItinClass Itin>
    : InstHMCVEX<(outs RC:$dst), (ins MEM:$addr),
                !strconcat(OpcStr, " $dst = $addr"),
                [(set RC:$dst, (OpNode ADDR:$addr))], Itin>{
//    let DecoderMethod = "DecodeMem";
    let canFoldAsLoad = 1;
    let mayLoad = 1;
}

class StoreInstr<string OpcStr, bits<8> OpVal, PatFrag OpNode, InstrItinClass Itin>
    : InstHMCVEX<(outs), (ins GPRegs:$s1, MEM:$addr),
                !strconcat(OpcStr, " $addr = $s1"),
                [(OpNode GPRegs:$s1, ADDR:$addr)], Itin>{
    //    let DecoderMethod = "DecodeMem";
    let mayStore = 1;
}

class StoreInstrLr<string OpcStr, bits<8> OpVal, PatFrag OpNode, InstrItinClass Itin>
    : InstHMCVEX<(outs), (ins LrReg:$s1, MEM:$addr),
                !strconcat(OpcStr, " $addr = $s1"),
                [(OpNode LrReg:$s1, ADDR:$addr)], Itin>{
    //    let DecoderMethod = "DecodeMem";
    let mayStore = 1;
}

class StoreInstrVec<string OpcStr, bits<8> OpVal, RegisterClass RC, PatFrag OpNode, InstrItinClass Itin>
    : InstHMCVEX<(outs), (ins RC:$s1, MEM:$addr),
                !strconcat(OpcStr, " $addr = $s1"),
                [(OpNode RC:$s1, ADDR:$addr)], Itin>{
    //    let DecoderMethod = "DecodeMem";
    let mayStore = 1;
}

class ExtendInstr<string OpcStr, bits<8> OpVal, SDNode OpNode, InstrItinClass Itin>
    : InstHMCVEX<(outs GPRegs:$dst), (ins GPRegs:$s1),
              !strconcat(OpcStr, " $dst = $s1"),
              [], Itin>{
}

class ExtendImmediateInstr<InstrItinClass Itin>
    : InstHMCVEX<(outs), (ins),
            "longimmediate",
            [], Itin>{
}

class TwoResultInstr<string OpcStr, bits<8> OpVal, SDNode OpNode, InstrItinClass Itin>
    : InstHMCVEX<(outs GPRegs:$dst1, BrRegs:$cout ), (ins GPRegs:$s1, GPRegs:$s2, BrRegs:$cin),
              !strconcat(OpcStr, " $dst1, $cout = $s1, $s2, $cin"),
              [(set GPRegs:$dst1, BrRegs:$cout, (OpNode GPRegs:$s1, GPRegs:$s2, BrRegs:$cin))],
              Itin>{
}

class ReturnInstr<string OpcStr, bits<8> OpVal, InstrItinClass Itin>
   : InstHMCVEX<(outs GPRegs:$dst), (ins GPRegs:$sp, imm32Op:$imm, GPRegs:$l0),
               !strconcat(OpcStr, " $dst = $sp, $imm, $l0"),
                [], Itin>{
    let isTerminator = 1;
    let isBarrier = 1;
    let isReturn = 1;
}

let isTerminator = 1, isBranch = 1 in {
multiclass BranchInstr<string OpcStr1, string OpcStr2, bits<8> OpVal, SDNode OpNode, InstrItinClass Itin>{
def R : InstHMCVEX<(outs), (ins BrRegs:$s1, brtarget:$offset),
                !strconcat(OpcStr1, " $s1, $offset"),
                [(OpNode BrRegs:$s1, bb:$offset)], Itin>;

def RF : InstHMCVEX<(outs), (ins BrRegs:$s1, brtarget:$offset),
                 !strconcat(OpcStr2, " $s1, $offset"),
                 [(OpNode (not BrRegs:$s1), bb:$offset)], Itin>;
}
}

class CallInstr<string OpcStr, bits<8> OpVal, InstrItinClass Itin>
: InstHMCVEX<(outs), (ins GPRegs:$lr, imm32Op:$offset),
    !strconcat(OpcStr, " $lr = $offset"),
    [], Itin>{
    let isTerminator = 1;
    let isBarrier = 1;
    let isBranch = 1;
}

class JumpInstr<string OpcStr, bits<8> OpVal, SDNode OpNode, InstrItinClass Itin>
: InstHMCVEX<(outs), (ins brtarget:$offset),
!strconcat(OpcStr, " $offset"),
[(OpNode bb:$offset)], Itin>{
    let isTerminator = 1;
    let isBarrier = 1;
    let isBranch = 1;
}

multiclass SelectInstr<bits<8> OpVal, InstrItinClass Itin> {

def r  : InstHMCVEX<(outs GPRegs:$dst), (ins BrRegs:$cond, GPRegs:$s1, GPRegs:$s2),
                 "slct $dst = $cond, $s1, $s2",
                 [(set GPRegs:$dst, (select BrRegs:$cond, GPRegs:$s1, GPRegs:$s2))], Itin>;
def i  : InstHMCVEX<(outs GPRegs:$dst), (ins BrRegs:$cond, GPRegs:$s1, imm32Op:$s2),
                 "slct $dst = $cond, $s1, $s2",
                 [(set GPRegs:$dst, (select BrRegs:$cond, GPRegs:$s1, imm32:$s2))], Itin>;

def Fr  : InstHMCVEX<(outs GPRegs:$dst), (ins BrRegs:$cond, GPRegs:$s1, GPRegs:$s2),
                 "slctf $dst = $cond, $s1, $s2",
                 [(set GPRegs:$dst, (select (not BrRegs:$cond), GPRegs:$s1, GPRegs:$s2))], Itin>;
def Fi  : InstHMCVEX<(outs GPRegs:$dst), (ins BrRegs:$cond, GPRegs:$s1, imm32Op:$s2),
                 "slctf $dst = $cond, $s1, $s2",
                 [(set GPRegs:$dst, (select (not BrRegs:$cond), GPRegs:$s1, imm32:$s2))], Itin>;
}

//===----------------------------------------------------------------------===//
// Instructions
//===----------------------------------------------------------------------===//

def NOP : Pseudo<(outs), (ins) , [], "nop">;

// Look at how NOP Instruction for lanes 10 to 15 are named.
// This happens to keep an order on instruction opcodes.
def NOPInstr0 : InstHMCVEX<(outs), (ins GPRegs:$src1, GPRegs:$src2),
                        "nop0 $src1 , $src2", [], IIAll>;
def NOPInstr1 : InstHMCVEX<(outs), (ins GPRegs:$src1, GPRegs:$src2),
                        "nop1 $src1, $src2", [], IIAll>;
def NOPInstr2 : InstHMCVEX<(outs), (ins GPRegs:$src1, GPRegs:$src2),
                        "nop2 $src1, $src2", [], IIAll>;
def NOPInstr3 : InstHMCVEX<(outs), (ins GPRegs:$src1, GPRegs:$src2),
                        "nop3 $src1, $src2", [], IIAll>;
def NOPInstr4 : InstHMCVEX<(outs), (ins GPRegs:$src1, GPRegs:$src2),
                        "nop4 $src1, $src2", [], IIAll>;
def NOPInstr5 : InstHMCVEX<(outs), (ins GPRegs:$src1, GPRegs:$src2),
                        "nop5 $src1, $src2", [], IIAll>;
def NOPInstr6 : InstHMCVEX<(outs), (ins GPRegs:$src1, GPRegs:$src2),
                        "nop6 $src1, $src2", [], IIAll>;
def NOPInstr7 : InstHMCVEX<(outs), (ins GPRegs:$src1, GPRegs:$src2),
                        "nop7 $src1, $src2", [], IIAll>;
def NOPInstr8 : InstHMCVEX<(outs), (ins GPRegs:$src1, GPRegs:$src2),
                        "nop8 $src1, $src2", [], IIAll>;
def NOPInstr9 : InstHMCVEX<(outs), (ins GPRegs:$src1, GPRegs:$src2),
                        "nop9 $src1, $src2", [], IIAll>;
def NOPInstr_10 : InstHMCVEX<(outs), (ins GPRegs:$src1, GPRegs:$src2),
                        "nop10 $src1, $src2", [], IIAll>;
def NOPInstr_11 : InstHMCVEX<(outs), (ins GPRegs:$src1, GPRegs:$src2),
                        "nop11 $src1, $src2", [], IIAll>;
def NOPInstr_12 : InstHMCVEX<(outs), (ins GPRegs:$src1, GPRegs:$src2),
                        "nop12 $src1, $src2", [], IIAll>;
def NOPInstr_13 : InstHMCVEX<(outs), (ins GPRegs:$src1, GPRegs:$src2),
                        "nop13 $src1, $src2", [], IIAll>;
def NOPInstr_14 : InstHMCVEX<(outs), (ins GPRegs:$src1, GPRegs:$src2),
                        "nop14 $src1, $src2", [], IIAll>;
def NOPInstr_15 : InstHMCVEX<(outs), (ins GPRegs:$src1, GPRegs:$src2),
                        "nop15 $src1, $src2", [], IIAll>;
def NOPInstr_16 : InstHMCVEX<(outs), (ins GPRegs:$src1, GPRegs:$src2),
                        "nop16 $src1, $src2", [], IIAll>;


// Pattern Fragments
def zext8 : PatFrag<(ops node:$ptr), (i32 (zext (i8 node:$ptr)))>;
//def zextloadi32i1 : PatFrag<(ops node:$ptr), (i32 (zextloadi1 node:$ptr))>;
//def  extloadi32i1 : PatFrag<(ops node:$ptr), (i32 ( extloadi1 node:$ptr))>;

//                      PSEUDO Instructions
// These instructions will not generate code.
// They are used to ease the process of converting SelectionDAG Nodes
// to real target instructions
def PSEUDO_RET : Pseudo<(outs), (ins) , [(HMCVEXPseudoRet)]>{
    let isTerminator = 1;
    let isBarrier = 1;
    let isReturn = 1;
}

def PSEUDO_TCALL : Pseudo<(outs), (ins i32imm:$offset), [(HMCVEXPseudoTailCall imm:$offset)]> {
    let isTerminator = 1;
    let isBarrier = 1;
    let isReturn = 1;
    let isCall = 1;
}

def ADJCALLSTACKDOWN : Pseudo<(outs), (ins imm32Op:$amt),
                              [(HMCVEXCallseq_start timm:$amt)],
                              "#ADJCALLSTACKDOWN">;

def ADJCALLSTACKUP : Pseudo<(outs), (ins imm32Op:$amt1, imm32Op:$amt2),
                              [(HMCVEXCallseq_end timm:$amt1, timm:$amt2)],
                              "#ADJCALLSTACKUP">;

defm ADD128  : ArithLogicInstrVec<"add128", 0b00000000, HMCRegs128, HMCRegs128, HMCVEXAdd, IIAlu, 1, 1>;
defm ADD256  : ArithLogicInstrVec<"add256", 0b00000000, HMCRegs256, HMCRegs256, HMCVEXAdd, IIAlu, 1, 1>;

// ADD Instruction
defm ADD    : ArithLogicInstr<"add", 0b01100010, add, IIAlu, 1, 1>;


// AND Instruction
defm AND    : ArithLogicInstr<"and", 0b01100011, and, IIAlu, 1, 1>;

// SUB Instruction
defm SUB    : ArithLogicInstr<"sub", 0b01100011, sub, IIAlu, 1, 1>;

// ANDC Instruction
def ANDCr      : ArithLogic_r<0b01100100,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "andc $dst = $s1, $s2",
                           [(set GPRegs:$dst, (and (not GPRegs:$s1), GPRegs:$s2))], IIAlu, 0>;
def ANDCi      : ArithLogic_i<0b01100100,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "andc $dst = $s1, $s2",
                           [(set GPRegs:$dst, (and (not GPRegs:$s1), imm32:$s2))], IIAlu, 0>;

// MAX/MIN Instructions
defm MAX    : ArithLogicInstr<"max", 0b01100101, HMCVEXMax, IIAlu>;

defm MAXU   : ArithLogicInstr<"maxu", 0b01100110, HMCVEXMaxu, IIAlu>;

defm MIN    : ArithLogicInstr<"min", 0b01100100, HMCVEXMin, IIAlu>;

defm MINU   : ArithLogicInstr<"minu", 0b01101000, HMCVEXMinu, IIAlu>;

// OR Instruction
defm OR     : ArithLogicInstr<"or", 0b01101001, or, IIAlu>;

// ORC Instruction
def ORCr      : ArithLogic_r<0b01101010,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "orc $dst = $s1, $s2",
                           [(set GPRegs:$dst, (or GPRegs:$s2, (not GPRegs:$s1)))], IIAlu, 0>;
def ORCi      : ArithLogic_i<0b01101010,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "orc $dst = $s1, $s2",
                           [(set GPRegs:$dst, (or (not GPRegs:$s1), imm32:$s2))], IIAlu, 0>;

// SH1ADD Instruction
def SH1ADDr      : ArithLogic_r<0b01101011,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "sh1add $dst = $s1, $s2",
                           [], IIAlu, 0>;
def SH1ADDi      : ArithLogic_i<0b01101010,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "sh1add $dst = $s1, $s2",
                           [], IIAlu, 0>;

// SH2ADD Instruction
def SH2ADDr      : ArithLogic_r<0b01101100,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "sh2add $dst = $s1, $s2",
                           [], IIAlu, 0>;
def SH2ADDi      : ArithLogic_i<0b01101100,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "sh2add $dst = $s1, $s2",
                           [], IIAlu, 0>;

// SH3ADD Instruction
def SH3ADDr      : ArithLogic_r<0b01101101,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "sh3add $dst = $s1, $s2",
                          [], IIAlu, 0>;
def SH3ADDi      : ArithLogic_i<0b01101101,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "sh3add $dst = $s1, $s2",
                           [], IIAlu, 0>;

// SH4ADD Instruction
def SH4ADDr      : ArithLogic_r<0b01101110,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "sh4add $dst = $s1, $s2",
                           [], IIAlu, 0>;
def SH4ADDi      : ArithLogic_i<0b01101110,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "sh4add $dst = $s1, $s2",
                           [], IIAlu, 0>;

// SHL Instruction
def SHLr        : SHIFT_r<0b01101111,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "shl $dst = $s1, $s2",
                          [(set GPRegs:$dst, (shl GPRegs:$s1, GPRegs:$s2))], IIAlu, 0>;
def SHLi        : SHIFT_i<0b01101111,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "shl $dst = $s1, $s2",
                          [(set GPRegs:$dst, (shl GPRegs:$s1, i32:$s2))], IIAlu, 0>;

// SHR Instruction
defm SHR    : SHIFTInstr<"shr", 0b00011000, sra, IIAlu>;

// SHRU Instruction
defm SHRU   : SHIFTInstr<"shru", 0b00011001, srl, IIAlu>;

// XOR Instruction
defm XOR    : ArithLogicInstr<"xor", 0b00011111, xor, IIAlu, 1, 1>;

defm MOV    : MOVInstr<"mov", 0b00000000, GPRegs, GPRegs, IIAlu>;

def MTB     : MOV_r<0b00000000,
                    (outs BrRegs:$dst), (ins GPRegs:$s1),
                    "mtb $dst = $s1", [], IICpGrBr>;

def MFB     : MOV_r<0b00000000,
                    (outs GPRegs:$dst), (ins BrRegs:$s1),
                    "mfb $dst = $s1", [], IICpBrGr>;

def MFL     : MOV_r<0b00000000,
                    (outs GPRegs:$dst), (ins LrReg:$s1),
                    "mfl $dst = $s1", [], IICpGrLr>;

def MTL     : MOV_r<0b00000000,
                   (outs LrReg:$dst), (ins GPRegs:$s1),
                    "mtl $dst = $s1", [], IICpLrGr>;

// Extend Byte/Half Instructions
def SXTB    : ExtendInstr<"sxtb", 0b00000000, add, IIAlu>;
def ZXTB    : ExtendInstr<"zxtb", 0b00000000, add, IIAlu>;

def SXTH    : ExtendInstr<"sxth", 0b00000000, add, IIAlu>;
def ZXTH    : ExtendInstr<"zxth", 0b00000000, add, IIAlu>;

// Used to Extend Immediate from 9 to 32 bits.
// This will be used in the HMCVEXVLIWPacketizer.cpp file
let isCodeGenOnly = 1, isPseudo = 1 in {
    def EXTIMM  : ExtendImmediateInstr<IIAll>;
}

def DIVS    : TwoResultInstr<"divs", 0b00000000, HMCVEXDIVS, IIAlu>;

// We need to set earlyclobber so we don't use the same registers
// as both sources and destination in the instruction.
// Using such causes some unwanted behaviour in the program
let Constraints = "@earlyclobber $dst1" in
def ADDCG   : TwoResultInstr<"addcg", 0b00000000, HMCVEXADDCG, IIAlu>;


// Select Instructions
defm SLCT   : SelectInstr<0b00000000, IISelect>;


// Create Pattern to "not" instruction
def : Pat<(not GPRegs:$in),
          (XORi GPRegs:$in, -1)>;

def : Pat<(i32 (sext_inreg GPRegs:$src, i8)),
          (SXTB GPRegs:$src)>;

def: Pat<(and (i32 GPRegs:$src1), 0xFF),
         (ZXTB GPRegs:$src1)>;

def: Pat<(and (i32 GPRegs:$src1), 0xFFFF),
         (ZXTH GPRegs:$src1)>;

def : Pat<(i32 (sext_inreg GPRegs:$src, i16)),
          (SXTH GPRegs:$src)>;

// Immediates
def : Pat<(i32 imm32:$in),
          (MOVi imm:$in)>;
def : Pat<(i32 imm:$imm),
          (MOVi imm:$imm)>;

def : Pat<(HMCVEXMov GPRegs:$src),
            (MOVr GPRegs:$src)>;
def : Pat<(HMCVEXMov imm:$in),
            (MOVi imm:$in)>;

// Carry patterns
def : Pat<(subc GPRegs:$lhs, GPRegs:$rhs),
          (SUBr GPRegs:$lhs, GPRegs:$rhs)>;
def : Pat<(addc GPRegs:$lhs, GPRegs:$rhs),
          (ADDr GPRegs:$lhs, GPRegs:$rhs)>;
def : Pat<(addc  GPRegs:$src, imm32:$imm),
          (ADDi GPRegs:$src, imm32:$imm)>;

// Used for ISD::SDIV and ISD::UDIV Instructions
def : Pat<(HMCVEXOrc GPRegs:$lhs, GPRegs:$rhs),
          (ORCr GPRegs:$lhs, GPRegs:$rhs)>;
def : Pat<(HMCVEXSh1Add GPRegs:$lhs, GPRegs:$rhs),
          (SH1ADDr GPRegs:$lhs, GPRegs:$rhs)>;

def : Pat<(HMCVEXSlct BrRegs:$cond, GPRegs:$s1, GPRegs:$s2),
            (SLCTr BrRegs:$cond, GPRegs:$s1, GPRegs:$s2)>;

//def : Pat<(i1 imm:$imm),
//(MOVi imm:$imm)>;

// Handle FrameIndex. Similar to LEA_ADDri from Sparc Architecture
let isCodeGenOnly = 1 in {
def LEA_ADDri   : InstHMCVEX<(outs GPRegs:$dst), (ins ADDR_FI:$addr),
                          "add $dst = $addr",
                          [(set iPTR:$dst, ADDR:$addr)],
                          IIAlu>;
}

// Move Between Regs


//===----------------------------------------------------------------------===//
//                      Multiplication instructions
//===----------------------------------------------------------------------===//

defm MPYLL      : ArithLogicInstr<"mpyll", 0b00000000, HMCVEXMPYLL, IIMultiply, 1, 1>;

defm MPYLLU     : ArithLogicInstr<"mpyllu", 0b00000001, HMCVEXMPYLLU, IIMultiply, 1, 1>;

defm MPYLH      : ArithLogicInstr<"mpylh", 0b00000010, HMCVEXMPYLH, IIMultiply, 1, 1>;

defm MPYLHU     : ArithLogicInstr<"mpylhu", 0b00000010, HMCVEXMPYLHU, IIMultiply, 1, 1>;

defm MPYHH      : ArithLogicInstr<"mpyhh", 0b00000011, HMCVEXMPYHH, IIMultiply, 1, 1>;

defm MPYHHU     : ArithLogicInstr<"mpyhhu", 0b00000100, HMCVEXMPYHHU, IIMultiply, 1, 1>;

defm MPYL       : ArithLogicInstr<"mpyl", 0b00000101, HMCVEXMPYL, IIMultiply, 1, 1>;

defm MPYLU      : ArithLogicInstr<"mpylu", 0b00000110, HMCVEXMPYLU, IIMultiply, 1, 1>;

defm MPYH       : ArithLogicInstr<"mpyh", 0b00000111, HMCVEXMPYH, IIMultiply, 1, 1>;

defm MPYHU      : ArithLogicInstr<"mpyhh", 0b00001001, HMCVEXMPYHU, IIMultiply, 1, 1>;

defm MPYHS      : ArithLogicInstr<"mpyhs", 0b00001010, HMCVEXMPYHS, IIMultiply, 1, 1>;

//===----------------------------------------------------------------------===//
//                      Compare instructions
//===----------------------------------------------------------------------===//
// TODO: Fix these CMP Instructions. Should have both BRegs and GPRegs
// as a result to the set*** DAG operation. For now, it only pattern matches
// with i1 type. It should also do the same for i32.

defm CMPEQ  : CMPInstr<"cmpeq", 0b01000000, seteq, IICmpBr, IICmpGr>;
defm CMPGE  : CMPInstr<"cmpge", 0b01000001, setge, IICmpBr, IICmpGr>;
defm CMPGEU : CMPInstr<"cmpgeu", 0b01000010, setuge, IICmpBr, IICmpGr>;
defm CMPGT  : CMPInstr<"cmpgt", 0b01000011, setgt, IICmpBr, IICmpGr>;
defm CMPGTU : CMPInstr<"cmpgtu", 0b01000100, setugt, IICmpBr, IICmpGr>;
defm CMPLE  : CMPInstr<"cmple", 0b01000101, setle, IICmpBr, IICmpGr>;
defm CMPLEU : CMPInstr<"cmpleu", 0b01000110, setule, IICmpBr, IICmpGr>;
defm CMPLT  : CMPInstr<"cmplt", 0b01000111, setlt, IICmpBr, IICmpGr>;
defm CMPLTU : CMPInstr<"cmpltu", 0b01001000, setult, IICmpBr, IICmpGr>;
defm CMPNE  : CMPInstr<"cmpne", 0b01001001, setne, IICmpBr, IICmpGr>;


//===----------------------------------------------------------------------===//
//                      Memory instructions
//===----------------------------------------------------------------------===//

// Vector Instructions
def LDWVec128       : LoadInstrVec<"ldwvec128", 0b00010000, HMCRegs128, load_a, IILoad>;
def LDWVec256       : LoadInstrVec<"ldwvec256", 0b00010000, HMCRegs256, load_a, IILoad>;

def STWVec128       : StoreInstrVec<"stwvec128", 0b00010101, HMCRegs128, store_a, IIStore>;
def STWVec256       : StoreInstrVec<"stwvec256", 0b00010101, HMCRegs256, store_a, IIStore>;


def LDW       : LoadInstr<"ldw", 0b00010000, load_a, IILoad>;
def STW       : StoreInstr<"stw", 0b00010101, store_a, IIStore>;

def LDWLr     : LoadInstrLr<"ldw", 0b00010000, load_a, IILoadLr>;
def STWLr     : StoreInstrLr<"stw", 0b00010101, store_a, IIStoreLr>;

def LDWPseudo : Pseudo<(outs GPRegs:$dst1, BrRegs:$dst2),
                        (ins MEM:$addr),
                        []>{
    let mayLoad = 1;
}

def STWPseudo : Pseudo<(outs GPRegs:$dst),
                        (ins BrRegs:$s1, MEM:$addr),
                        []>{
    let mayStore = 1;
}

def LDHExt    : LoadInstr<"ldh", 0b00010000, extloadi16, IILoad>;
def LDH       : LoadInstr<"ldh", 0b00010000, sextloadi16, IILoad>;
def LDHU      : LoadInstr<"ldhu", 0b00010000, zextloadi16, IILoad>;
def STH       : StoreInstr<"sth", 0b00010101, truncstorei16, IIStore>;

def LDBExt    : LoadInstr<"ldb", 0b00010000, extloadi8, IILoad>;
def LDB       : LoadInstr<"ldb", 0b00010000, sextloadi8, IILoad>;
def LDBU      : LoadInstr<"ldbu", 0b00010000, zextloadi8, IILoad>;
def STB       : StoreInstr<"stb", 0b00010101, truncstorei8, IIStore>;

//===----------------------------------------------------------------------===//
//                      Return/Call instructions
//===----------------------------------------------------------------------===//

def RET       : ReturnInstr<"return", 0b00100110, IIBranch>;

//===----------------------------------------------------------------------===//
//                      Branch and Call instructions
//===----------------------------------------------------------------------===//

defm B        : BranchInstr<"br", "brf", 0b00000000, brcond, IIBranch>;

def GOTO      : JumpInstr<"goto", 0b00000000, br, IIBranch>;

let isCall = 1, Defs = [Lr] in {
def CALL      : InstHMCVEX<(outs), (ins i32imm:$offset),
                        "call $$l0.0 = $offset",
                        [(HMCVEXPseudoCall imm:$offset)], IIBranch>;
}

let isCall = 1 in {
    def ICALL      : InstHMCVEX<(outs), (ins i32imm:$offset),
    "icall $$l0.0 = $offset",
    [(HMCVEXPseudoCall imm:$offset)], IIBranch>;
}

//===----------------------------------------------------------------------===//
//                       Non-Instruction Patterns
//===----------------------------------------------------------------------===//

//def : Pat<(mul GPRegs:$lhs, GPRegs:$rhs), (ADDr (MPYLUr $lhs, $rhs), (MPYHSr $lhs, $rhs))>;
//def : Pat<(mul GPRegs:$lhs, GPRegs:$rhs), (ADDr (MPYLUi $lhs, $rhs), (MPYHSi $lhs, $rhs))>;

def : Pat<(select GPRegs:$cond, GPRegs:$s1, GPRegs:$s2),
            (SLCTr (MTB GPRegs:$cond), GPRegs:$s1, GPRegs:$s2)>;
def : Pat<(select GPRegs:$cond, GPRegs:$s1, imm32:$s2),
            (SLCTi (MTB GPRegs:$cond), GPRegs:$s1, imm32:$s2)>;

//def : Pat<(select GPRegs:$cond, GPRegs:$s1, imm32:$s2),
//         (SLCTFr (not (MTB GPRegs:$cond)), GPRegs:$s1, imm32:$s2)>;
//def : Pat<(select GPRegs:$cond, GPRegs:$s1, imm32:$s2),
//          (SLCTFi (not (MTB GPRegs:$cond)), GPRegs:$s1, imm32:$s2)>;

// 1-to-32-bit extension
def : Pat<(i32 (anyext (i1 BrRegs:$src))), (MFB BrRegs:$src)>;
def : Pat<(i32 (zext (i1 BrRegs:$src))), (MFB BrRegs:$src)>;
def : Pat<(i32 (sext (i1 BrRegs:$src))), (MFB BrRegs:$src)>;

// Shift and add Instructions
def : Pat<(add (shl GPRegs:$lhs, (i32 1)), GPRegs:$rhs), (SH1ADDr GPRegs:$lhs, GPRegs:$rhs)>;
def : Pat<(add (shl GPRegs:$lhs, (i32 2)), GPRegs:$rhs), (SH2ADDr GPRegs:$lhs, GPRegs:$rhs)>;
def : Pat<(add (shl GPRegs:$lhs, (i32 3)), GPRegs:$rhs), (SH3ADDr GPRegs:$lhs, GPRegs:$rhs)>;
def : Pat<(add (shl GPRegs:$lhs, (i32 4)), GPRegs:$rhs), (SH4ADDr GPRegs:$lhs, GPRegs:$rhs)>;

def : Pat<(add (shl GPRegs:$lhs, (i32 1)), i32:$rhs), (SH1ADDi GPRegs:$lhs, i32:$rhs)>;
def : Pat<(add (shl GPRegs:$lhs, (i32 2)), i32:$rhs), (SH2ADDi GPRegs:$lhs, i32:$rhs)>;
def : Pat<(add (shl GPRegs:$lhs, (i32 3)), i32:$rhs), (SH3ADDi GPRegs:$lhs, i32:$rhs)>;
def : Pat<(add (shl GPRegs:$lhs, (i32 4)), i32:$rhs), (SH4ADDi GPRegs:$lhs, i32:$rhs)>;

// truncs
def : Pat<(i32 (extloadi1 ADDR:$addr)), (LDBU ADDR:$addr)>;
def : Pat<(i32 (extloadi8 ADDR:$addr)), (LDBU ADDR:$addr)>;
def : Pat<(i32 (extloadi16 ADDR:$addr)), (LDHU ADDR:$addr)>;

def : Pat<(i32 (zextloadi1 ADDR:$addr)), (LDBU ADDR:$addr)>;
def : Pat<(i32 (zextloadi8 ADDR:$addr)), (LDBU ADDR:$addr)>;
def : Pat<(i32 (zextloadi16 ADDR:$addr)), (LDHU ADDR:$addr)>;

def : Pat<(i32 (sextloadi1 ADDR:$addr)), (LDB ADDR:$addr)>;
def : Pat<(i32 (sextloadi8 ADDR:$addr)), (LDB ADDR:$addr)>;
def : Pat<(i32 (sextloadi16 ADDR:$addr)), (LDH ADDR:$addr)>;

def : Pat<(i32 (HMCVEXWrapper tglobaladdr:$dst)), (MOVi tglobaladdr:$dst)>;
def : Pat<(i32 (HMCVEXWrapper texternalsym:$dst)), (MOVi texternalsym:$dst)>;
def : Pat<(i32 (HMCVEXWrapper externalsym:$dst)), (MOVi texternalsym:$dst)>;
def : Pat<(i32 (HMCVEXWrapper tblockaddress:$dst)), (MOVi tblockaddress:$dst)>;

def : Pat<(i1 (trunc GPRegs:$src)), (MTB GPRegs:$src)>;

//def : Pat<(zext BrRegs:$node), (MFB BrRegs:$node)>;

//def : Pat<(i32 (zext i8:$node)), (MOVi GPRegs:$node)>;

def : Pat<(brcond i32:$cond, bb:$offset), (BR (MTB i32:$cond), bb:$offset)>;

// Calls
def : Pat<(HMCVEXPseudoCall (HMCVEXWrapper tglobaladdr:$dst)),
            (CALL tglobaladdr:$dst)>;

def : Pat<(HMCVEXPseudoCall (i32 tglobaladdr:$dst)),
          (CALL tglobaladdr:$dst)>;

def : Pat<(HMCVEXPseudoCall (i32 texternalsym:$dst)),
          (CALL texternalsym:$dst)>;

def : Pat<(HMCVEXPseudoCall (HMCVEXWrapper texternalsym:$dst)),
            (CALL texternalsym:$dst)>;

def : Pat<(HMCVEXPseudoCall Lr),
            (CALL Lr)>;

// TODO: Is this correct?
// Tail Call

def : Pat<(HMCVEXPseudoTailCall (HMCVEXWrapper tglobaladdr:$dst)),
            (PSEUDO_TCALL tglobaladdr:$dst)>;

def : Pat<(HMCVEXPseudoTailCall (i32 tglobaladdr:$dst)),
            (PSEUDO_TCALL tglobaladdr:$dst)>;

def : Pat<(HMCVEXPseudoTailCall (HMCVEXWrapper tglobaladdr:$dst)),
            (PSEUDO_TCALL tglobaladdr:$dst)>;

def : Pat<(HMCVEXPseudoTailCall (HMCVEXWrapper texternalsym:$dst)),
            (PSEUDO_TCALL texternalsym:$dst)>;

//include "HMCVEXInstrVIS.td"
//include "HMCVEXInstrAliases.td"
