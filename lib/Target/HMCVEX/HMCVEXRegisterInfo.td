//===----------------------------------------------------------------------===//
//  Declarations that describe the HMCVEX register file
//===----------------------------------------------------------------------===//


class HMCVEXReg<bits<16> Enc, string n> : Register<n> {
  let HWEncoding = Enc;
  let Namespace = "HMCVEX";
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
foreach I = 0-511 in
  def Reg#I : HMCVEXGPR<I, "r0."#I>, DwarfRegNum<[I]>;

// Branch Registers
foreach I = 0-7 in
  def BrReg#I : Br<I, "b0."#I >, DwarfRegNum<[!add(I, 513)]>;
  
// Define Link Register
def Lr    :  Lr<0, "l0.0">, DwarfRegNum<[64]>;


def GPRegs : RegisterClass<"HMCVEX", [i32], 32, (add Lr, (sequence "Reg%u", 0, 511))>;

// We need to set Size to 32. Otherwise, LLVM will set to 0 causing problems
// with in Register Allocation Pass.
def BrRegs  : RegisterClass<"HMCVEX", [i1], 32, (sequence "BrReg%u", 0, 7)> {
    let Size = 32;
}

def LrReg   : RegisterClass<"HMCVEX", [i32], 32, (add Lr)> {
}
