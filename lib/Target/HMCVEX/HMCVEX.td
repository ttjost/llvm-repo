//===- HMCVEX.td - Describe the HMCVEX Target Machine ---------*- tblgen -*-==//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
// This is the top level entry point for the HMCVEX target.
//===----------------------------------------------------------------------===//
//
//===----------------------------------------------------------------------===//
// Target-independent interfaces
//===----------------------------------------------------------------------===//

include "llvm/Target/Target.td"

//===----------------------------------------------------------------------===//
// Register File Description
//===----------------------------------------------------------------------===//

include "HMCVEXRegisterInfo.td"
include "HMCVEXSchedule.td"
include "HMCVEXInstrInfo.td"

//===----------------------------------------------------------------------===//
// Calling Convention Description
//===----------------------------------------------------------------------===//

include "HMCVEXCallingConv.td"

//===----------------------------------------------------------------------===//
// Instruction Descriptions
//===----------------------------------------------------------------------===//

def     HMCVEXInstrInfo    :   InstrInfo;

// Without this will have error: 'hmc-vex' is not a recognized processor for
//  this target (ignoring processor)
//===----------------------------------------------------------------------===//
// HMCVEX Subtarget features                                                    //
//===----------------------------------------------------------------------===//

//def NoFeature     : SubtargetFeature<"hmc-vex", "HMCVEXArchVersion", "HMCVEX", "HMCVEX ISA Support", []>;

//===----------------------------------------------------------------------===//
// HMCVEX supported processors.
//===----------------------------------------------------------------------===//
class Proc<string Name, SchedMachineModel Model, list<SubtargetFeature> Features>
: ProcessorModel<Name, Model, Features>;

def: Proc<"simple-64issue", Simple64Issue64MemModel, []>;

def HMCVEXAsmParser : AsmParser {
    let ShouldEmitMatchRegisterName = 0;
}

def HMCVEXAsmParserVariant : AsmParserVariant {
    int Variant = 0;
    // Recognize hard coded registers.
    string RegisterPrefix = "$";
}

//===----------------------------------------------------------------------===//
// Target Declaration
//===----------------------------------------------------------------------===//

def HMCVEX : Target {
    let InstructionSet = HMCVEXInstrInfo;
}
