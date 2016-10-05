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

//===----------------------------------------------------------------------===//
// Functional units
//===----------------------------------------------------------------------===//

class FuncUnit;

def IUnit0    : FuncUnit;
def IUnit1    : FuncUnit;
def IUnit2    : FuncUnit;
def IUnit3    : FuncUnit;
def IUnit4    : FuncUnit;
def IUnit5    : FuncUnit;
def IUnit6    : FuncUnit;
def IUnit7    : FuncUnit;
def IUnit8    : FuncUnit;
def IUnit9    : FuncUnit;
def IUnit10    : FuncUnit;
def IUnit11    : FuncUnit;
def IUnit12    : FuncUnit;
def IUnit13    : FuncUnit;
def IUnit14    : FuncUnit;
def IUnit15    : FuncUnit;

//===----------------------------------------------------------------------===//
// Instruction Itinerary classes used for HMCVEX
//===----------------------------------------------------------------------===//
def IIAll       : InstrItinClass;
def IIAlu       : InstrItinClass;
def IICmpBr     : InstrItinClass;
def IICmpGr     : InstrItinClass;
def IISelect    : InstrItinClass;
def IIMultiply  : InstrItinClass;
def IILoad      : InstrItinClass;
def IILoadLr    : InstrItinClass;
def IIStore     : InstrItinClass;
def IIStoreLr   : InstrItinClass;
def IICpGrBr    : InstrItinClass;
def IICpBrGr    : InstrItinClass;
def IICpLrGr    : InstrItinClass;
def IICpGrLr    : InstrItinClass;
def IIBranch    : InstrItinClass;

def Simple8Issue8MemItineraries : ProcessorItineraries<[IUnit0, IUnit1, IUnit2, IUnit3,
IUnit4, IUnit5, IUnit6, IUnit7], [], [
InstrItinData<IIAll         , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3,
IUnit4, IUnit5, IUnit6, IUnit7]>]>,
InstrItinData<IIAlu         , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3,
IUnit4, IUnit5, IUnit6, IUnit7]>]>,
InstrItinData<IICmpBr       , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3,
IUnit4, IUnit5, IUnit6, IUnit7]>]>,
InstrItinData<IICmpGr       , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3,
IUnit4, IUnit5, IUnit6, IUnit7]>]>,
InstrItinData<IISelect      , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3,
IUnit4, IUnit5, IUnit6, IUnit7]>]>,
InstrItinData<IIMultiply    , [InstrStage<1,  [IUnit1, IUnit3, IUnit5, IUnit7, IUnit2, IUnit4, IUnit0, IUnit6]>]>,
InstrItinData<IILoad        , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3,
IUnit4, IUnit5, IUnit6, IUnit7]>]>,
InstrItinData<IILoadLr      , [InstrStage<1,  [IUnit0]>]>,
InstrItinData<IIStore       , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3,
IUnit4, IUnit5, IUnit6, IUnit7]>]>,
InstrItinData<IIStoreLr     , [InstrStage<1,  [IUnit0]>]>,
InstrItinData<IICpGrBr      , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3,
IUnit4, IUnit5, IUnit6, IUnit7]>]>,
InstrItinData<IICpBrGr      , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3,
IUnit4, IUnit5, IUnit6, IUnit7]>]>,
InstrItinData<IICpLrGr      , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3,
IUnit4, IUnit5, IUnit6, IUnit7]>]>,
InstrItinData<IICpGrLr      , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3,
IUnit4, IUnit5, IUnit6, IUnit7]>]>,
InstrItinData<IIBranch      , [InstrStage<1,  [IUnit7]>]>
]>;

def Simple8Issue8MemModel : SchedMachineModel {
    let IssueWidth = 8;
    let LoadLatency = 1;
    let Itineraries = Simple8Issue8MemItineraries;
}



