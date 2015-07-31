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
def IALU1    : FuncUnit;
def IALU2    : FuncUnit;
def IALU3    : FuncUnit;
def IALU4    : FuncUnit;
def IALU5    : FuncUnit;
def IALU6    : FuncUnit;
def IBR     : FuncUnit;
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
//def VEXGenericItineraries : ProcessorItineraries<[IALU1, IALU2, IALU3, IALU4,
//                                                  IALU5, IALU6, IMUL, IBR, IMEM],
def VEXGenericItineraries : ProcessorItineraries<[IALU1, IALU2, IMUL, IMEM],
                                                  [], [
//InstrItinData<IIAlu              , [InstrStage<1,  [IALU1, IALU2, IALU3, IALU4, IALU5, IALU6]>]>,
InstrItinData<IIAlu              , [InstrStage<1,  [IALU1, IALU2]>]>,
InstrItinData<IIMul              , [InstrStage<1,  [IMUL]>]>,
InstrItinData<IILoad             , [InstrStage<3,  [IMEM]>]>,
InstrItinData<IIStore            , [InstrStage<1,  [IMEM]>]>,
//InstrItinData<IIBranch           , [InstrStage<1,  [IBR]>]>
InstrItinData<IIBranch           , [InstrStage<1,  [IALU1]>]>
]>;
