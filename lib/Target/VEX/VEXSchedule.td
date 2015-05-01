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

//===----------------------------------------------------------------------===//
// Functional units
//===----------------------------------------------------------------------===//
def IALU    : FuncUnit;
def IMUL    : FuncUnit;
def IMEM    : FuncUnit;

//===----------------------------------------------------------------------===//
// Instruction Itinerary classes used for VEX
//===----------------------------------------------------------------------===//
def IIAlu       : InstrItinClass;
def IIBranch    : InstrItinClass;
def IIMul       : InstrItinClass;
def IILoad      : InstrItinClass;
def IIStore     : InstrItinClass;

//===----------------------------------------------------------------------===//
// VEX Generic instruction itineraries.
//===----------------------------------------------------------------------===//
// http://llvm.org/docs/doxygen/html/structllvm_1_1InstrStage.html

//                          FIXME:
//      The latency of each class should be changed here.    
//
//
def VEXGenericItineraries : ProcessorItineraries<[IALU, IMUL, IMEM], [], [
InstrItinData<IIAlu              , [InstrStage<1,  [IALU]>]>,
InstrItinData<IIMul              , [InstrStage<1,  [IMUL]>]>,
InstrItinData<IILoad             , [InstrStage<3,  [IMEM]>]>,
InstrItinData<IIStore            , [InstrStage<1,  [IMEM]>]>,
InstrItinData<IIBranch           , [InstrStage<1,  [IALU]>]>
//#endif
]>;
