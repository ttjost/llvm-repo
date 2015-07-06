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

def immZExt5 : PatLeaf<(imm), [{
    return N->getZExtValue() == ((N->getZExtValue()) & 0x1f) ;
}]>;

def imm5Op  : Operand<i32>;

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


//===----------------------------------------------------------------------===//
// VEX Profiles and Nodes
//===----------------------------------------------------------------------===//

def VEXPseudoRet : SDNode<"VEXISD::PSEUDO_RET", SDTNone,
                   [SDNPHasChain, SDNPOptInGlue, SDNPVariadic]>;
                   
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
                   (outs GPRegs:$dst), (ins GPRegs:$s1, imm5Op:$s2),
                   !strconcat(OpcStr, " $dst = $s1, $s2"),
                   [(set GPRegs:$dst, (OpNode GPRegs:$s1, immZExt5:$s2))], Itin, isCommI>;
}

/// Type I
multiclass MOVInstr<string OpcStr, bits<8> Opcode, RegisterClass DstOp, RegisterClass SrcOp, InstrItinClass Itin> {
  def r  : MOV_r <Opcode,
                     (outs DstOp:$dst), (ins SrcOp:$s1),
                     !strconcat(OpcStr, " $dst = $s1"),
                     [(set DstOp:$dst, SrcOp:$s1)], Itin>;
  def i  : MOV_i <Opcode,
                   (outs DstOp:$dst), (ins imm32Op:$s1),
                   !strconcat(OpcStr, " $dst = $s1"),
                   [(set DstOp:$dst, imm32:$s1)], Itin>;
}

class CMPInstr_r<string OpcStr, bits<8> OpVal, PatFrag cond_op, InstrItinClass Itin>
    : InstVEX<(outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                !strconcat(OpcStr, " $dst = $s1, $s2"),
                [(set GPRegs:$dst, (cond_op GPRegs:$s1, GPRegs:$s2))], Itin>{
    let isCompare = 1;
}

class CMPInstr_i<string OpcStr, bits<8> OpVal, PatFrag cond_op, InstrItinClass Itin>
   : InstVEX<(outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                !strconcat(OpcStr, " $dst = $s1, $s2"),
                [(set GPRegs:$dst, (cond_op GPRegs:$s1, imm32:$s2))], Itin>{
    let isCompare = 1;
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
   : InstVEX<(outs GPRegs:$dst), (ins GPRegs:$sp, imm32Op:$imm, LrReg:$l0),
               !strconcat(OpcStr, " $dst = $sp, $imm, $l0"),
                [], Itin>{
    let isTerminator = 1;
    let isBarrier = 1;
    let isReturn = 1;
}

//class SetCC_R<bits<8> op, string instr_asm, PatFrag cond_op,
//              RegisterClass RC>:
//  TYPE2<op, (outs GPROut:$ra), (ins RC:$rb, RC:$rc),
//     !strconcat(instr_asm, "\t$ra, $rb, $rc"),
//     [(set GPROut:$ra, (cond_op RC:$rb, RC:$rc))],
//     IIAlu>  {
//  let shamt = 0;
//}

//class SetCC_I<bits<8> op, string instr_asm, PatFrag cond_op>:
//  TYPE2<op, (outs GPROut:$ra), (ins RC:$rb, imm32Op:$imm32),
//     !strconcat(instr_asm, "\t$ra, $rb, $imm32"),
//     [(set GPROut:$ra, (cond_op RC:$rb, imm32Op:$imm16))],
//    IIAlu>, Requires<[HasSlt]> {
//}

//===----------------------------------------------------------------------===//
// Instructions
//===----------------------------------------------------------------------===//

//                      PSEUDO Instructions
// These instructions will not generate code.
// They are used to ease the process of converting SelectionDAG Nodes
// real target instructions
def PSEUDO_RET : Pseudo<(outs), (ins) , [(VEXPseudoRet)]>{
    let isTerminator = 1;
    let isBarrier = 1;
    let isReturn = 1;
}


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
                          "sh1add",
                           [], IIAlu, 1>;
def SH1ADDi      : ArithLogic_i<0b01101010,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "sh1add",
                           [], IIAlu, 1>;

// SH2ADD Instruction
def SH2ADDr      : ArithLogic_r<0b01101100,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "sh2add",
                           [], IIAlu, 1>;
def SH2ADDi      : ArithLogic_i<0b01101100,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "sh2add",
                           [], IIAlu, 1>;

// SH3ADD Instruction
def SH3ADDr      : ArithLogic_r<0b01101101,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "sh3add",
                          [], IIAlu, 1>;
def SH3ADDi      : ArithLogic_i<0b01101101,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "sh3add",
                           [], IIAlu, 1>;

// SH4ADD Instruction
def SH4ADDr      : ArithLogic_r<0b01101110,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "sh3add",
                           [], IIAlu, 1>;
def SH4ADDi      : ArithLogic_i<0b01101110,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "sh3add",
                           [], IIAlu, 1>;
                                                     
// SHL Instruction 
//defm SHL    : ArithLogic<"shl", 0b01101111, shl, IIAlu>;
//def SHLr      : SHIFT_r<0b01101111,
//                        (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
//                        "shl",
//                       [(set GPRegs:$dst, (shl GPRegs:$s1, GPRegs:$s2))], IIAlu, 0>;
//def SHLi      : SHIFT_i<0b01101111,
//                        (outs GPRegs:$dst), (ins GPRegs:$s1, imm5Op:$s2),
//                        "shl",
//                        [(set GPRegs:$dst, (shl GPRegs:$s1, immZExt5:$s2))], IIAlu, 0>;

// SHR Instruction
//defm SHR    : SHIFTInstr<"shr", 0b00011000, sra, IIAlu>;

// SHRU Instruction
//defm SHRU   : SHIFTInstr<"shru", 0b00011001, srl, IIAlu>;

// XOR Instruction
defm XOR    : ArithLogicInstr<"xor", 0b00011111, xor, IIAlu, 1, 1>;

defm MOV    : MOVInstr<"mov", 0b00000000, GPRegs, GPRegs, IIAlu>;


// Create Pattern to "not" instruction
def : Pat<(not GPRegs:$in),
  (XORi GPRegs:$in, 1)>;

// Immediates
def : Pat<(i32 imm32:$in),
(MOVi imm:$in)>;
def : Pat<(i32 imm:$imm),
(MOVi imm:$imm)>;


//===----------------------------------------------------------------------===//
//                      Multiplication instructions
//===----------------------------------------------------------------------===//
def MPYLLr      : ArithLogic_r<0b00000000,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "mpyll",
                           [], IIMul, 1>;
def MPYLLi      : ArithLogic_i<0b00000000,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "mpyll",
                           [], IIMul, 1>;
                    
def MPYLLUr      : ArithLogic_r<0b00000001,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "mpyllu",
                           [], IIMul, 1>;
def MPYLLUi      : ArithLogic_i<0b00000001,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "mpyllu",
                           [], IIMul, 1>;
                           
def MPYLHr      : ArithLogic_r<0b00000010,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "mpylh",
                           [], IIMul, 1>;
def MPYLHi      : ArithLogic_i<0b00000010,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "mpylh",
                           [], IIMul, 1>;
                           
def MPYHHr      : ArithLogic_r<0b00000011,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "mpyhh",
                           [], IIMul, 1>;
def MPYHHi      : ArithLogic_i<0b00000011,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "mpyhh",
                           [], IIMul, 1>;

def MPYHHUr      : ArithLogic_r<0b00000100,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "mpyhhu",
                           [], IIMul, 1>;
def MPYHHUi      : ArithLogic_i<0b00000100,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "mpyhhu",
                           [], IIMul, 1>;
                    
def MPYLr      : ArithLogic_r<0b00000101,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "mpyl",
                           [], IIMul, 1>;
def MPYLi      : ArithLogic_i<0b00000101,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "mpyl",
                           [], IIMul, 1>;
                           
def MPYLUr      : ArithLogic_r<0b00000110,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "mpylu",
                           [], IIMul, 1>;
def MPYLUi      : ArithLogic_i<0b00000110,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "mpylu",
                           [], IIMul, 1>;
                           
def MPYHr      : ArithLogic_r<0b00000111,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "mpyh",
                           [], IIMul, 1>;
def MPYHi      : ArithLogic_i<0b00000111,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "mpyh",
                           [], IIMul, 1>;
                           
                           
def MPYHUr      : ArithLogic_r<0b00001001,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "mpyhu",
                           [], IIMul, 1>;
def MPYHUi      : ArithLogic_i<0b00001001,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "mpyhu",
                           [], IIMul, 1>;
                           
def MPYHSr      : ArithLogic_r<0b00001010,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, GPRegs:$s2),
                          "mpyhs",
                           [], IIMul, 1>;
def MPYHSi      : ArithLogic_i<0b00001010,
                          (outs GPRegs:$dst), (ins GPRegs:$s1, imm32Op:$s2),
                          "mpyhs",
                           [], IIMul, 1>;
                           
//===----------------------------------------------------------------------===//
//                      Compare instructions
//===----------------------------------------------------------------------===//
                           
def CMPEQr    : CMPInstr_r<"cmpeq", 0b01000000, seteq, IIAlu>;
def CMPEQi    : CMPInstr_i<"cmpeq", 0b01000000, seteq, IIAlu>;

def CMPGEr    : CMPInstr_r<"cmpge", 0b01000001, setge, IIAlu>;
def CMPGEi    : CMPInstr_i<"cmpge", 0b01000001, setge, IIAlu>;

def CMPGEUr   : CMPInstr_r<"cmpgeu", 0b01000010, setuge, IIAlu>;
def CMPGEUi   : CMPInstr_i<"cmpgeu", 0b01000010, setuge, IIAlu>;

def CMPGTr    : CMPInstr_r<"cmpgt", 0b01000011, setgt, IIAlu>;
def CMPGTi    : CMPInstr_i<"cmpgt", 0b01000011, setgt, IIAlu>;

def CMPGTUr   : CMPInstr_r<"cmpgtu", 0b01000100, setugt, IIAlu>;
def CMPGTUi   : CMPInstr_i<"cmpgtu", 0b01000100, setugt, IIAlu>;

def CMPLEr    : CMPInstr_r<"cmple", 0b01000101, setle, IIAlu>;
def CMPLEi    : CMPInstr_i<"cmple", 0b01000101, setle, IIAlu>;

def CMPLEUr   : CMPInstr_r<"cmpleu", 0b01000110, setule, IIAlu>;
def CMPLEUi   : CMPInstr_i<"cmpleu", 0b01000110, setule, IIAlu>;

def CMPLTr    : CMPInstr_r<"cmplt", 0b01000111, setlt, IIAlu>;
def CMPLTi    : CMPInstr_i<"cmplt", 0b01000111, setlt, IIAlu>;

def CMPLTUr   : CMPInstr_r<"cmpltu", 0b01001000, setult, IIAlu>;
def CMPLTUi   : CMPInstr_i<"cmpltu", 0b01001000, setult, IIAlu>;

def CMPNEr    : CMPInstr_r<"cmpne", 0b01001001, setne, IIAlu>;
def CMPNEi    : CMPInstr_i<"cmpne", 0b01001001, setne, IIAlu>;

//===----------------------------------------------------------------------===//
//                      Memory instructions
//===----------------------------------------------------------------------===//

def LDW       : LoadInstr<"ldw", 0b00010000, load_a, IILoad>;
def STW       : StoreInstr<"stw", 0b00010101, store_a, IIStore>;


//===----------------------------------------------------------------------===//
//                      Return/Call instructions
//===----------------------------------------------------------------------===//

def RET       : ReturnInstr<"return", 0b00100110, IIAlu>;

//===----------------------------------------------------------------------===//
//                      Branch instructions
//===----------------------------------------------------------------------===//






//
// JMPL Instruction.
//let isTerminator = 1, hasDelaySlot = 1, isBarrier = 1,
//    DecoderMethod = "DecodeJMPL" in {
//  defm JMPLrr: <2, 0b0111000, (outs GPRegs:$dst), (ins MEMrr:$addr),
//                  "jmpl $addr, $dst", []>;
//  defm JMPLri: F3_2<2, 0b0111000, (outs GPRegs:$dst), (ins MEMri:$addr),
//                  "jmpl $addr, $dst", []>;
//}

//include "VEXInstrVIS.td"
//include "VEXInstrAliases.td"
