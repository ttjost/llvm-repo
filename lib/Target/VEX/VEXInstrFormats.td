//===-- VEXInstrFormats.td - VEX Instruction Formats ---*- tablegen -*-===//

class InstVEX<dag outs, dag ins, string asmstr, list<dag> pattern, InstrItinClass itin>
          : Instruction {
  field bits<32> Inst;

  let Namespace = "VEX";
  let Size = 4;

  bits<8> op;
  let Inst{31-24} = op;               // Top two bits are the 'op' field

  dag OutOperandList = outs;
  dag InOperandList = ins;
  let AsmString   = asmstr;
  let Pattern = pattern;

  let Itinerary = itin;

  let DecoderNamespace = "VEX";
  field bits<32> SoftFail = 0;
}

//===----------------------------------------------------------------------===//
// Format TYPE 1 instruction classes in the VEX
//===----------------------------------------------------------------------===//

// TYPE 1 instructions
class TYPE1<dag outs, dag ins, string asmstr, list<dag> pattern, InstrItinClass Itin, bit isCommR = 0, bit isCommI = 0>
   : InstVEX<outs, ins, asmstr, pattern, Itin> {
  bits<6>  s1;
  
  bits<6>  dst;
  
  let Inst{16-11} = s1;
  let Inst{22-17} = dst;
}

class TYPE1_r<bits<8> OpVal, dag outs, dag ins, string asmstr, list<dag> pattern, InstrItinClass Itin, bit isComm>
   : TYPE1<outs, ins, asmstr, pattern, Itin> {
  bits<8> op;
  bits<6>  s2;
  
  let op = OpVal;
  let Inst{10-5} = s2;
  
  let isCommutable = isComm;
  
}

class TYPE1_i<bits<8> OpVal, dag outs, dag ins, string asmstr, list<dag> pattern, InstrItinClass Itin, bit isComm>
   : TYPE1<outs, ins, asmstr, pattern, Itin> {
  bits<8>  op;
  bits<9>  imm;
  
  let op = OpVal;
  let Inst{10-2} = imm;
  
  let isCommutable = isComm;
}

// TYPE 1 instructions
class SHIFT<dag outs, dag ins, string asmstr, list<dag> pattern, InstrItinClass Itin, bit isCommR = 0, bit isCommI = 0>
: InstVEX<outs, ins, asmstr, pattern, Itin> {
bits<6>  s1;

bits<6>  dst;

let Inst{16-11} = s1;
let Inst{22-17} = dst;
}

class SHIFT_r<bits<8> OpVal, dag outs, dag ins, string asmstr, list<dag> pattern, InstrItinClass Itin, bit isComm>
: TYPE1<outs, ins, asmstr, pattern, Itin> {
bits<8> op;
bits<6>  s2;

let op = OpVal;
let Inst{10-5} = s2;

let isCommutable = isComm;

}

class SHIFT_i<bits<8> OpVal, dag outs, dag ins, string asmstr, list<dag> pattern, InstrItinClass Itin, bit isComm>
: TYPE1<outs, ins, asmstr, pattern, Itin> {
bits<8>  op;
bits<9>  imm;

let op = OpVal;
let Inst{10-2} = imm;

let isCommutable = isComm;
}

