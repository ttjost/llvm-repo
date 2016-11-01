//===----------------------------------------------------------------------===//
//  Declarations that describe the HMCVEX register file
//===----------------------------------------------------------------------===//


class HMCVEXReg<bits<16> Enc, string n, list<Register> subregs = [] > : Register<n> {
  let HWEncoding = Enc;
  let Namespace = "HMCVEX";
  let SubRegs = subregs;
}

let Namespace = "HMCVEX" in {
    foreach I = 0-7 in
        def sub#I       : SubRegIndex<32, !shl(I,5)>;
}

// Defining class for Registers

// Registers are identified with 5-bit ID numbers.
// Gr - 32-bit integer general purpose registers
class HMCVEXGPR<bits<16> Enc, string n> : HMCVEXReg<Enc, n>;

// Br - 32-bit branch registers
class Br<bits<16> Enc, string n> : HMCVEXReg<Enc, n>;

// Class for Link Register
class Lr<bits<16> Enc, string n> : HMCVEXReg<Enc, n>;

// Defining General Purpose registers
// TODO: Make parametrizable
// TODO: General purpose Registers
foreach I = 0-600 in
  def Reg#I : HMCVEXGPR<I, "r0."#I>, DwarfRegNum<[I]>;

// Branch Registers
foreach I = 0-7 in
  def BrReg#I : Br<I, "b0."#I >, DwarfRegNum<[!add(I, 513)]>;
  
// Define Link Register
def Lr    :  Lr<0, "l0.0">, DwarfRegNum<[514]>;


def GPRegs : RegisterClass<"HMCVEX", [i32], 32, (add Lr, (sequence "Reg%u", 0, 511))>;

// We need to set Size to 32. Otherwise, LLVM will set to 0 causing problems
// with in Register Allocation Pass.
def BrRegs  : RegisterClass<"HMCVEX", [i1], 32, (sequence "BrReg%u", 0, 7)> {
    let Size = 32;
}

def LrReg   : RegisterClass<"HMCVEX", [i32], 32, (add Lr)> {
}


let SubRegIndices = [sub0, sub1, sub2, sub3], CoveredBySubRegs = 1 in {
    foreach I = 0-127 in
        def HMCReg128_#I : HMCVEXReg<!shl(I,2), "HMCReg"#I, [!cast<Register>("Reg"#!add(!shl(I,2), 10)), !cast<Register>("Reg"#!add(!add(!shl(I,2), 1), 10)), !cast<Register>("Reg"#!add(!add(!shl(I,2), 2), 10)), !cast<Register>("Reg"#!add(!add(!shl(I,2), 3), 10))]>;
}

let SubRegIndices = [sub0, sub1, sub2, sub3, sub4, sub5, sub6, sub7], CoveredBySubRegs = 1 in {
    foreach I = 0-63 in
    def HMCReg256_#I : HMCVEXReg<!shl(I,2), "HMCReg"#I, [!cast<Register>("Reg"#!add(!shl(I,2), 10)), !cast<Register>("Reg"#!add(!add(!shl(I,2), 1), 10)), !cast<Register>("Reg"#!add(!add(!shl(I,2), 2), 10)), !cast<Register>("Reg"#!add(!add(!shl(I,2), 3), 10)), !cast<Register>("Reg"#!add(!add(!shl(I,2), 4), 10)), !cast<Register>("Reg"#!add(!add(!shl(I,2), 5), 10)), !cast<Register>("Reg"#!add(!add(!shl(I,2), 6), 10)), !cast<Register>("Reg"#!add(!add(!shl(I,2), 7), 10))]>;
}

def HMCRegs128 : RegisterClass<"HMCVEX", [v4i32], 128, (sequence "HMCReg128_%u", 0, 127)> {
}

def HMCRegs256 : RegisterClass<"HMCVEX", [v8i32], 256, (sequence "HMCReg256_%u", 0, 63)> {
}


