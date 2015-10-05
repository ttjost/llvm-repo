//===- VEX.td - Describe the VEX Target Machine ---------*- tblgen -*-==//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
// This is the top level entry point for the VEX target.
//===----------------------------------------------------------------------===//
//
//===----------------------------------------------------------------------===//
// Target-independent interfaces
//===----------------------------------------------------------------------===//

include "llvm/Target/Target.td"

//===----------------------------------------------------------------------===//
// Register File Description
//===----------------------------------------------------------------------===//

include "VEXRegisterInfo.td"
include "VEXSchedule.td"
include "VEXInstrInfo.td"

//===----------------------------------------------------------------------===//
// Calling Convention Description
//===----------------------------------------------------------------------===//

include "VEXCallingConv.td"

//===----------------------------------------------------------------------===//
// Instruction Descriptions
//===----------------------------------------------------------------------===//

def     VEXInstrInfo    :   InstrInfo;

// Without this will have error: 'vex' is not a recognized processor for
//  this target (ignoring processor)
//===----------------------------------------------------------------------===//
// VEX Subtarget features                                                    //
//===----------------------------------------------------------------------===//

//def NoFeature     : SubtargetFeature<"VEX", "VEXArchVersion", "VEX", "VEX ISA Support", []>;

//===----------------------------------------------------------------------===//
// VEX supported processors.
//===----------------------------------------------------------------------===//
class Proc<string Name, list<SubtargetFeature> Features>
: Processor<Name, VEXGenericItineraries, Features>;

def: Proc<"VEX_I", []>;
def: Proc<"VEX_II", []>;

//#if CH >= CH11_1 1
def VEXAsmParser : AsmParser {
    let ShouldEmitMatchRegisterName = 0;
}

def VEXAsmParserVariant : AsmParserVariant {
    int Variant = 0;
    
    // Recognize hard coded registers.
    string RegisterPrefix = "$";
}
//#endif

//def VEXInstrInfo : InstrInfo;

//===----------------------------------------------------------------------===//
// Target Declaration
//===----------------------------------------------------------------------===//

def VEX : Target {
    let InstructionSet = VEXInstrInfo;
}