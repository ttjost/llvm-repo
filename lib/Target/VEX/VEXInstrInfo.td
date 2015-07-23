//===-- VEXInstrInfo.td - Target Description for VEX Target -----------===//
//
// This file describes the VEX instructions in TableGen format.
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Instruction format superclass
//===----------------------------------------------------------------------===//

include "VEXInstrFormats.td"

//===----------------------------------------------------------------------===//
// Instruction Pattern Stuff
//===----------------------------------------------------------------------===//

//def simm9Op : Operand<i32> {
//  let DecoderMethod = "DecodeSIMM9";
//}

def imm32   : PatLeaf<(imm), [{ return isInt<32>(N->getSExtValue()); }]>;
def imm32Op : Operand<i32>;

def immZExt5 : PatLeaf<(imm32), [{
    return N->getZExtValue() == ((N->getZExtValue()) & 0x1f) ;
}]>;

def imm5Op  : Operand<i32>;

// Node immediate is zero (e.g. insve.d)
def imms : PatLeaf<(imm), [{ return isInt<1>(N->getSExtValue()); }]>;
def immSExt8  : PatLeaf<(imm), [{ return isInt<8>(N->getSExtValue()); }]>;
def immSExt16  : PatLeaf<(imm), [{ return isInt<16>(N->getSExtValue()); }]>;

// Node immediate is zero (e.g. insve.d)
def immz : PatLeaf<(imm), [{ return isInt<1>(N->getZExtValue()); }]>;
def immZExt8  : PatLeaf<(imm), [{ return isInt<8>(N->getZExtValue()); }]>;
def immZExt16  : PatLeaf<(imm), [{ return isInt<16>(N->getZExtValue()); }]>;

def ADDR : ComplexPattern<iPTR, 2, "SelectAddr", [frameindex], []>;

// Address operands

def VEXMEMriAsmOperand : AsmOperandClass {
  let Name = "MEMri";
  let ParserMethod = "parseMEMOperand";
} 

def MEM : Operand<iPTR> {
  let PrintMethod = "printMemOperand";
  let MIOperandInfo = (ops ptr_rc, imm32Op);
  let ParserMatchClass = VEXMEMriAsmOperand;
}

def brtarget : Operand<OtherVT> {
// Methods used by Assembler and Disassembler.
  let EncoderMethod = "getBranchTargetOpValue";
  let DecoderMethod = "DecodeBranchTarget";
}

//===----------------------------------------------------------------------===//
// VEX Profiles and Nodes
//===----------------------------------------------------------------------===//


//===----------------------------------------------------------------------===//
// Type Profiles.
//===----------------------------------------------------------------------===//

//def SDT_VEXBranchCond : SDTypeProfile <0, 2, [SDTCisInt<0>, SDTCisVT<1, OtherVT> ]>;

def SDT_VEXWrapper : SDTypeProfile <1, 1, [SDTCisSameAs<0, 1>,
                                           SDTCisPtrTy<0>]>;

def SDT_VEXPseudoCall         : SDTypeProfile<0, -1, [SDTCisVT<0, iPTR>]>;
def SDT_VEXCallSeqStart : SDCallSeqStart<[SDTCisVT<0, i32>]>;
def SDT_VEXCallSeqEnd   : SDCallSeqEnd<[SDTCisVT<0, i32>, SDTCisVT<1, i32>]>;

//===----------------------------------------------------------------------===//
// VEX Specific Node Definitions.
//===----------------------------------------------------------------------===//

def VEXPseudoRet : SDNode<"VEXISD::PSEUDO_RET", SDTNone,
                          [SDNPHasChain, SDNPOptInGlue, SDNPVariadic]>;

def VEXWrapper : SDNode<"VEXISD::WRAPPER", SDT_VEXWrapper>;

def VEXPseudoCall    : SDNode<"VEXISD::PSEUDO_CALL", SDT_VEXPseudoCall,
                        [SDNPHasChain, SDNPOutGlue,
                        SDNPOptInGlue, SDNPVariadic]>;

def VEXCallseq_start :  SDNode<"ISD::CALLSEQ_START", SDT_VEXCallSeqStart,
                               [SDNPHasChain, SDNPOutGlue]>;

def VEXCallseq_end: SDNode<"ISD::CALLSEQ_END",   SDT_VEXCallSeqEnd,
                           [SDNPHasChain, SDNPOptInGlue, SDNPOutGlue]>;

// **************************************************************
//                       NOT USED
//
//def VEXBr       : SDNode<"VEXISD::BR", SDT_VEXBranchCond,
//                    [SDNPHasChain, SDNPOptInGlue]>;
//
//def VEXBrf       : SDNode<"VEXISD::BRF", SDT_VEXBranchCond,
//                    [SDNPHasChain, SDNPOptInGlue]>;
// **************************************************************

def VEXMax   : SDNode<"VEXISD::MAX", SDTIntBinOp>;
def VEXMaxu  : SDNode<"VEXISD::MAXU", SDTIntBinOp>;
def VEXMin   : SDNode<"VEXISD::MIN", SDTIntBinOp>;
def VEXMinu  : SDNode<"VEXISD::MINU", SDTIntBinOp>;


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
                   (outs DstOp:$dst), (ins imm32Op:$s1),
                   !strconcat(OpcStr, " $dst = $s1"),
                   [], Itin>;
}

let isCompare = 1 in {

multiclass CMPInstr<string OpcStr, bits<8> OpVal, PatFrag cond_op, InstrItinClass Itin>{

def Regr : InstVEX<(outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                    !strconcat(OpcStr, " $dst = $s1, $s2"),
                    [(set GPRegs:$dst, (cond_op GPRegs:$s1, GPRegs:$s2))], Itin>;
def Regi : InstVEX<(outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                    !strconcat(OpcStr, " $dst = $s1, $s2"),
                    [(set GPRegs:$dst, (cond_op GPRegs:$s1, imm32:$s2))], Itin>;

def BRegr: InstVEX<(outs BrRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                    !strconcat(OpcStr, " $dst = $s1, $s2"),
                    [(set BrRegs:$dst, (cond_op GPRegs:$s1, GPRegs:$s2))], Itin>;

def BRegi : InstVEX<(outs BrRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                    !strconcat(OpcStr, " $dst = $s1, $s2"),
                    [(set BrRegs:$dst, (cond_op GPRegs:$s1, imm32:$s2))], Itin>;
}
}

class LoadInstr<string OpcStr, bits<8> OpVal, PatFrag OpNode, InstrItinClass Itin>
    : InstVEX<(outs GPRegs:$dst), (ins MEM:$addr),
                !strconcat(OpcStr, " $dst = $addr"),
                [(set GPRegs:$dst, (OpNode ADDR:$addr))], Itin>{
//    let DecoderMethod = "DecodeMem";
    let canFoldAsLoad = 1;
    let mayLoad = 1;
}

class StoreInstr<string OpcStr, bits<8> OpVal, PatFrag OpNode, InstrItinClass Itin>
    : InstVEX<(outs), (ins GPRegs:$s1, MEM:$addr),
                !strconcat(OpcStr, " $addr = $s1"),
                [(OpNode GPRegs:$s1, ADDR:$addr)], Itin>{
//    let DecoderMethod = "DecodeMem";
    let mayStore = 1;
}

class ReturnInstr<string OpcStr, bits<8> OpVal, InstrItinClass Itin>
   : InstVEX<(outs GPRegs:$dst), (ins GPRegs:$sp, imm32Op:$imm, GPRegs:$l0),
               !strconcat(OpcStr, " $dst = $sp, $imm, $l0"),
                [], Itin>{
    let isTerminator = 1;
    let isBarrier = 1;
    let isReturn = 1;
}

class BranchInstr<string OpcStr, bits<8> OpVal, SDNode OpNode, InstrItinClass Itin>
: InstVEX<(outs), (ins BrRegs:$s1, brtarget:$offset),
!strconcat(OpcStr, " $s1, $offset"),
[(OpNode BrRegs:$s1, bb:$offset)], Itin>{
    let isTerminator = 1;
    let isBarrier = 1;
    let isBranch = 1;
}

class CallInstr<string OpcStr, bits<8> OpVal, InstrItinClass Itin>
: InstVEX<(outs), (ins GPRegs:$lr, imm32Op:$offset),
    !strconcat(OpcStr, " $lr = $offset"),
    [], Itin>{
    let isTerminator = 1;
    let isBarrier = 1;
    let isBranch = 1;
}

class JumpInstr<string OpcStr, bits<8> OpVal, SDNode OpNode, InstrItinClass Itin>
: InstVEX<(outs), (ins brtarget:$offset),
!strconcat(OpcStr, " $offset"),
[(OpNode bb:$offset)], Itin>{
    let isTerminator = 1;
    let isBarrier = 1;
    let isBranch = 1;
}

multiclass SelectInstr<string OpcStr, bits<8> OpVal, InstrItinClass Itin> {

def r  : InstVEX<(outs GPRegs:$dst), (ins BrRegs:$cond, GPRegs:$s1, GPRegs:$s2),
                 !strconcat(OpcStr, "slct $dst = $cond, "),
                 [(set GPRegs:$dst, (select BrRegs:$cond, GPRegs:$s1, GPRegs:$s2))], Itin>;
def i  : InstVEX<(outs GPRegs:$dst), (ins BrRegs:$cond, GPRegs:$s1, imm32Op:$s2),
                 !strconcat(OpcStr, "slct $dst = $cond, "),
                 [(set GPRegs:$dst, (select BrRegs:$cond, GPRegs:$s1, imm32:$s2))], Itin>;
                 
def rz  : InstVEX<(outs GPRegs:$dst), (ins BrRegs:$cond, GPRegs:$s1, GPRegs:$s2),
                 !strconcat(OpcStr, "slctf $dst = $cond, "),
                 [(set GPRegs:$dst, (select (not BrRegs:$cond), GPRegs:$s1, GPRegs:$s2))], Itin>;
def iz  : InstVEX<(outs GPRegs:$dst), (ins BrRegs:$cond, GPRegs:$s1, imm32Op:$s2),
                 !strconcat(OpcStr, "slctf $dst = $cond, "),
                 [(set GPRegs:$dst, (select (not BrRegs:$cond), GPRegs:$s1, imm32:$s2))], Itin>;
}

//===----------------------------------------------------------------------===//
// Instructions
//===----------------------------------------------------------------------===//


// Pattern Fragments
//def zextloadi32i1 : PatFrag<(ops node:$ptr), (i32 (zextloadi1 node:$ptr))>;
//def  extloadi32i1 : PatFrag<(ops node:$ptr), (i32 ( extloadi1 node:$ptr))>;

//                      PSEUDO Instructions
// These instructions will not generate code.
// They are used to ease the process of converting SelectionDAG Nodes
// to real target instructions
def PSEUDO_RET : Pseudo<(outs), (ins) , [(VEXPseudoRet)]>{
    let isTerminator = 1;
    let isBarrier = 1;
    let isReturn = 1;
}

def ADJCALLSTACKDOWN : Pseudo<(outs), (ins imm32Op:$amt),
                              [(VEXCallseq_start timm:$amt)],
                              "#ADJCALLSTACKDOWN">;

def ADJCALLSTACKUP : Pseudo<(outs), (ins imm32Op:$amt1, imm32Op:$amt2),
                              [(VEXCallseq_end timm:$amt1, timm:$amt2)],
                              "#ADJCALLSTACKUP">;

// TYPE I Instruction Definitions

// ADD Instruction
defm ADD    : ArithLogicInstr<"add", 0b01100010, add, IIAlu, 1, 1>;

// AND Instruction
defm AND    : ArithLogicInstr<"and", 0b01100011, and, IIAlu, 1, 1>;

// SUB Instruction
defm SUB    : ArithLogicInstr<"sub", 0b01100011, sub, IIAlu, 1, 1>;

// ANDC Instruction
def ANDCr      : ArithLogic_r<0b01100100,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "andc",
                           [(set GPRegs:$dst, (and GPRegs:$s2, (not GPRegs:$s1)))], IIAlu, 1>;
def ANDCi      : ArithLogic_i<0b01100100,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "andc",
                           [(set GPRegs:$dst, (and (not GPRegs:$s1), imm32:$s2))], IIAlu, 1>;
           
// MAX Instruction
//defm MAX    : TYPE_1<"max", 0b01100101, max>;
def MAXr      : ArithLogic_r<0b01100100,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "max",
                          [(set GPRegs:$dst, (VEXMax GPRegs:$s1, GPRegs:$s2))], IIAlu, 0>;
def MAXi      : ArithLogic_i<0b01100100,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "max",
                           [(set GPRegs:$dst, (VEXMax GPRegs:$s1, imm32:$s2))], IIAlu, 0>;
                           
//defm MAXU   : TYPE_1<"maxu", 0b01100110, maxu>;
def MAXUr      : ArithLogic_r<0b01100110,
                        (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                        "max",
                        [(set GPRegs:$dst, (VEXMax GPRegs:$s1, GPRegs:$s2))], IIAlu, 0>;
def MAXUi      : ArithLogic_i<0b01100110,
                        (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                        "max",
                        [(set GPRegs:$dst, (VEXMaxu GPRegs:$s1, imm32:$s2))], IIAlu, 0>;

def MINr      : ArithLogic_r<0b01100100,
                        (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                        "min",
                        [(set GPRegs:$dst, (VEXMin GPRegs:$s1, GPRegs:$s2))], IIAlu, 0>;
def MINi      : ArithLogic_i<0b01100100,
                        (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                        "min",
                        [(set GPRegs:$dst, (VEXMin GPRegs:$s1, imm32:$s2))], IIAlu, 0>;

//defm MAXU   : TYPE_1<"maxu", 0b01100110, maxu>;
def MINUr      : ArithLogic_r<0b01101000,
                        (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                        "minu",
                        [(set GPRegs:$dst, (VEXMinu GPRegs:$s1, GPRegs:$s2))], IIAlu, 0>;
def MINUi      : ArithLogic_i<0b01101000,
                        (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                        "minu",
                        [(set GPRegs:$dst, (VEXMinu GPRegs:$s1, imm32:$s2))], IIAlu, 0>;

// OR Instruction
defm OR     : ArithLogicInstr<"or", 0b01101001, or, IIAlu>;

// ORC Instruction
def ORCr      : ArithLogic_r<0b01101010,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "orc",
                           [(set GPRegs:$dst, (or GPRegs:$s2, (not GPRegs:$s1)))], IIAlu, 1>;
def ORCi      : ArithLogic_i<0b01101010,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "orc",
                           [(set GPRegs:$dst, (or (not GPRegs:$s1), imm32:$s2))], IIAlu, 1>;

// SH1ADD Instruction
def SH1ADDr      : ArithLogic_r<0b01101011,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "sh1add $dst = $s1, $s2",
                           [], IIAlu, 1>;

def SH1ADDi      : ArithLogic_i<0b01101010,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "sh1add $dst = $s1, $s2",
                           [], IIAlu, 1>;

// SH2ADD Instruction
def SH2ADDr      : ArithLogic_r<0b01101100,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "sh2add $dst = $s1, $s2",
                           [], IIAlu, 1>;
def SH2ADDi      : ArithLogic_i<0b01101100,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "sh2add $dst = $s1, $s2",
                           [], IIAlu, 1>;

// SH3ADD Instruction
def SH3ADDr      : ArithLogic_r<0b01101101,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "sh3add $dst = $s1, $s2",
                          [], IIAlu, 1>;
def SH3ADDi      : ArithLogic_i<0b01101101,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "sh3add $dst = $s1, $s2",
                           [], IIAlu, 1>;

// SH4ADD Instruction
def SH4ADDr      : ArithLogic_r<0b01101110,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "sh4add $dst = $s1, $s2",
                           [], IIAlu, 1>;
def SH4ADDi      : ArithLogic_i<0b01101110,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "sh4add $dst = $s1, $s2",
                           [], IIAlu, 1>;
                                                     
// SHL Instruction 
//defm SHL    : ArithLogic<"shl", 0b01101111, shl, IIAlu>;
def SHLr      : SHIFT_r<0b01101111,
                        (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                        "shl $dst = $s1, $s2",
                       [(set GPRegs:$dst, (shl GPRegs:$s1, GPRegs:$s2))], IIAlu, 0>;
def SHLi      : SHIFT_i<0b01101111,
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
                    "mtb $dst = $s1", [], IIAlu>;

def MFB     : MOV_r<0b00000000,
                    (outs GPRegs:$dst), (ins BrRegs:$s1),
                    "mfb $dst = $s1", [], IIAlu>;

// Select Instructions
defm slct   : SelectInstr<"slct", 0b00000000, IIAlu>;


// Create Pattern to "not" instruction
def : Pat<(not GPRegs:$in),
  (XORi GPRegs:$in, 1)>;

// Immediates
def : Pat<(i32 imm32:$in),
(MOVi imm:$in)>;
def : Pat<(i32 imm:$imm),
(MOVi imm:$imm)>;

// Handle FrameIndex. Similar to LEA_ADDri from Sparc Architecture
//let isCodeGenOnly = 1 in {
//def LEA_ADDri   : InstVEX<(outs GPRegs:$dst), (ins MEM:$addr),
//                          "add $dst = $addr, $addr",
//                          [(set iPTR:$dst, ADDR:$addr)],
//                          IIAlu>;
//}

// Move Between Regs


//===----------------------------------------------------------------------===//
//                      Multiplication instructions
//===----------------------------------------------------------------------===//
def MPYLLr      : ArithLogic_r<0b00000000,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "mpyll $dst = $s1, $s2",
                           [], IIMul, 1>;
def MPYLLi      : ArithLogic_i<0b00000000,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "mpyll $dst = $s1, $s2",
                           [], IIMul, 1>;
                    
def MPYLLUr      : ArithLogic_r<0b00000001,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "mpyllu $dst = $s1, $s2",
                           [], IIMul, 1>;
def MPYLLUi      : ArithLogic_i<0b00000001,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "mpyllu $dst = $s1, $s2",
                           [], IIMul, 1>;
                           
def MPYLHr      : ArithLogic_r<0b00000010,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "mpylh $dst = $s1, $s2",
                           [], IIMul, 1>;
def MPYLHi      : ArithLogic_i<0b00000010,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "mpylh $dst = $s1, $s2",
                           [], IIMul, 1>;
                           
def MPYHHr      : ArithLogic_r<0b00000011,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "mpyhh $dst = $s1, $s2",
                           [], IIMul, 1>;
def MPYHHi      : ArithLogic_i<0b00000011,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "mpyhh $dst = $s1, $s2",
                           [], IIMul, 1>;

def MPYHHUr      : ArithLogic_r<0b00000100,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "mpyhhu $dst = $s1, $s2",
                           [], IIMul, 1>;
def MPYHHUi      : ArithLogic_i<0b00000100,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "mpyhhu $dst = $s1, $s2",
                           [], IIMul, 1>;
                    
def MPYLr      : ArithLogic_r<0b00000101,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "mpyl $dst = $s1, $s2",
                           [], IIMul, 1>;
def MPYLi      : ArithLogic_i<0b00000101,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "mpyl $dst = $s1, $s2",
                           [], IIMul, 1>;
                           
def MPYLUr      : ArithLogic_r<0b00000110,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "mpylu $dst = $s1, $s2",
                           [], IIMul, 1>;
def MPYLUi      : ArithLogic_i<0b00000110,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "mpylu $dst = $s1, $s2",
                           [], IIMul, 1>;
                           
def MPYHr      : ArithLogic_r<0b00000111,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "mpyh $dst = $s1, $s2",
                           [], IIMul, 1>;
def MPYHi      : ArithLogic_i<0b00000111,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "mpyh $dst = $s1, $s2",
                           [], IIMul, 1>;
                           
                           
def MPYHUr      : ArithLogic_r<0b00001001,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "mpyhu $dst = $s1, $s2",
                           [], IIMul, 1>;
def MPYHUi      : ArithLogic_i<0b00001001,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "mpyhu $dst = $s1, $s2",
                           [], IIMul, 1>;
                           
def MPYHSr      : ArithLogic_r<0b00001010,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "mpyhs $dst = $s1, $s2",
                           [], IIMul, 1>;
def MPYHSi      : ArithLogic_i<0b00001010,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "mpyhs $dst = $s1, $s2",
                           [], IIMul, 1>;
                           
//===----------------------------------------------------------------------===//
//                      Compare instructions
//===----------------------------------------------------------------------===//
// TODO: Fix these CMP Instructions. Should have both BRegs and GPRegs
// as a result to the set*** DAG operation. For now, it only pattern matches
// with i1 type. It should also do the same for i32.

defm CMPEQ  : CMPInstr<"cmpeq", 0b01000000, seteq, IIAlu>;
defm CMPGE  : CMPInstr<"cmpge", 0b01000001, setge, IIAlu>;
defm CMPGEU : CMPInstr<"cmpgeu", 0b01000010, setuge, IIAlu>;
defm CMPGT  : CMPInstr<"cmpgt", 0b01000011, setgt, IIAlu>;
defm CMPGTU : CMPInstr<"cmpgtu", 0b01000100, setugt, IIAlu>;
defm CMPLE  : CMPInstr<"cmple", 0b01000101, setle, IIAlu>;
defm CMPLEU : CMPInstr<"cmpleu", 0b01000110, setule, IIAlu>;
defm CMPLT  : CMPInstr<"cmplt", 0b01000111, setlt, IIAlu>;
defm CMPLTU : CMPInstr<"cmpltu", 0b01001000, setult, IIAlu>;
defm CMPNE  : CMPInstr<"cmpne", 0b01001001, setne, IIAlu>;


//===----------------------------------------------------------------------===//
//                      Memory instructions
//===----------------------------------------------------------------------===//

def LDW       : LoadInstr<"ldw", 0b00010000, load_a, IILoad>;
def STW       : StoreInstr<"stw", 0b00010101, store_a, IIStore>;

def LDH       : LoadInstr<"ldw", 0b00010000, sextloadi16, IILoad>;
def LDHU      : LoadInstr<"ldw", 0b00010000, zextloadi16, IILoad>;
def STH       : StoreInstr<"stw", 0b00010101, truncstorei16, IIStore>;

def LDB       : LoadInstr<"ldw", 0b00010000, sextloadi8, IILoad>;
def LDBU      : LoadInstr<"ldw", 0b00010000, zextloadi8, IILoad>;
def STB       : StoreInstr<"stw", 0b00010101, truncstorei8, IIStore>;


//===----------------------------------------------------------------------===//
//                      Return/Call instructions
//===----------------------------------------------------------------------===//

def RET       : ReturnInstr<"return", 0b00100110, IIAlu>;

//===----------------------------------------------------------------------===//
//                      Branch and Call instructions
//===----------------------------------------------------------------------===//

def BR        : BranchInstr<"br", 0b00000000, brcond, IIAlu>;
//def BRF       : BranchInstr<"brf", 0b00000000, brcond, IIAlu>;

def GOTO      : JumpInstr<"goto", 0b00000000, br, IIAlu>;

let isCall = 1 in {
def CALL      : InstVEX<(outs), (ins i32imm:$offset),
                        "call $$l0.0 = $offset",
                        [(VEXPseudoCall imm:$offset)], IIAlu>;
}

//===----------------------------------------------------------------------===//
//                       Non-Instruction Patterns
//===----------------------------------------------------------------------===//

def : Pat<(mul GPRegs:$lhs, GPRegs:$rhs), (ADDr (MPYLUr $lhs, $rhs), (MPYHSr $lhs, $rhs))>;
def : Pat<(mul GPRegs:$lhs, GPRegs:$rhs), (ADDr (MPYLUi $lhs, $rhs), (MPYHSi $lhs, $rhs))>;

// 1-to-32-bit extension
def : Pat<(i32 (anyext BrRegs:$src)), (MFB BrRegs:$src)>;
def : Pat<(i32 (zext BrRegs:$src)), (MFB BrRegs:$src)>;
def : Pat<(i32 (sext BrRegs:$src)), (MFB BrRegs:$src)>;

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
def : Pat<(i1 (trunc GPRegs:$src)), (MTB GPRegs:$src)>;

// Sign extend in register
//def : Pat<(i32 (sext_inreg GPRegs:$src, i1)), (MTB GPRegs:$src)>;

def : Pat<(extloadi8 ADDR:$addr), (LDBU ADDR:$addr)>;
def : Pat<(extloadi16 ADDR:$addr), (LDBU ADDR:$addr)>;

def : Pat<(i32 (VEXWrapper tglobaladdr:$dst)), (MOVi tglobaladdr:$dst)>;
def : Pat<(i32 (VEXWrapper texternalsym:$dst)), (MOVi texternalsym:$dst)>;
def : Pat<(i32 (VEXWrapper tblockaddress:$dst)), (MOVi tblockaddress:$dst)>;

//def : Pat<(zext BrRegs:$node), (MFB BrRegs:$node)>;

//def : Pat<(i32 (zext i8:$node)), (MOVi GPRegs:$node)>;

def : Pat<(brcond i32:$cond, bb:$offset), (BR (MTB i32:$cond), bb:$offset)>;

// Calls
def : Pat<(VEXPseudoCall (VEXWrapper tglobaladdr:$dst)),
            (CALL tglobaladdr:$dst)>;

def : Pat<(VEXPseudoCall (i32 tglobaladdr:$dst)),
          (CALL tglobaladdr:$dst)>;

def : Pat<(VEXPseudoCall (i32 texternalsym:$dst)),
          (CALL texternalsym:$dst)>;

//include "VEXInstrVIS.td"
//include "VEXInstrAliases.td"
