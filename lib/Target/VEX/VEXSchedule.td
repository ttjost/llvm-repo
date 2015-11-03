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
// // Functional units
// //===----------------------------------------------------------------------===//
// def IUnit0    : FuncUnit;
// def IUnit1    : FuncUnit;
// def IUnit2    : FuncUnit;
// def IUnit3    : FuncUnit;
// def IUnit4    : FuncUnit;
// def IUnit5    : FuncUnit;
// def IUnit6    : FuncUnit;
// def IUnit7    : FuncUnit;
// def IUnit8    : FuncUnit;
// def IUnit9    : FuncUnit;
// def IUnit10    : FuncUnit;
// def IUnit11    : FuncUnit;
// def IUnit12    : FuncUnit;
// def IUnit13    : FuncUnit;
// def IUnit14    : FuncUnit;
// def IUnit15    : FuncUnit;

// //===----------------------------------------------------------------------===//
// // Instruction Itinerary classes used for VEX
// //===----------------------------------------------------------------------===//
// def IIAlu       : InstrItinClass;
// def IIBranch    : InstrItinClass;
// def IIMul       : InstrItinClass;
// def IILoad      : InstrItinClass;
// def IIStore     : InstrItinClass;

// //===----------------------------------------------------------------------===//
// // VEX Generic instruction itineraries.
// //===----------------------------------------------------------------------===//
// // http://llvm.org/docs/doxygen/html/structllvm_1_1InstrStage.html

// //                          FIXME:
// //      The latency of each class should be changed here.
// //
// //

// def VEXGenericItineraries : ProcessorItineraries<[IUnit0, IUnit1, IUnit2, IUnit3,
//                                                   IUnit4, IUnit5, IUnit6, IUnit7,
//                                                   IUnit8, IUnit9, IUnit10, IUnit11,
//                                                   IUnit12, IUnit13, IUnit14, IUnit15], [], [
// InstrItinData<IIMul              , [InstrStage<1,  [IUnit1, IUnit2]>]>,
// InstrItinData<IILoad             , [InstrStage<1,  [IUnit0]>]>,
// InstrItinData<IIStore            , [InstrStage<1,  [IUnit0]>]>,
// InstrItinData<IIBranch           , [InstrStage<1,  [IUnit3]>]>,
// InstrItinData<IIAlu              , [InstrStage<1,  [IUnit1, IUnit2, IUnit0, IUnit3,
//                                                     IUnit4, IUnit5, IUnit6, IUnit7,
//                                                     IUnit8, IUnit9, IUnit10, IUnit11,
//                                                     IUnit12, IUnit13, IUnit14, IUnit15]>]>
// ]>;


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

//===----------------------------------------------------------------------===//
// Instruction Itinerary classes used for VEX
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

//===----------------------------------------------------------------------===//
// VEX Generic instruction itineraries.
//===----------------------------------------------------------------------===//
// http://llvm.org/docs/doxygen/html/structllvm_1_1InstrStage.html

//                          FIXME:
//      The latency of each class should be changed here.
//
//

//def VEXGenericItineraries : ProcessorItineraries<[IUnit0, IUnit1, IUnit2, IUnit3], [], [
//InstrItinData<IIMul              , [InstrStage<1,  [IUnit1, IUnit2]>]>,
//InstrItinData<IILoad             , [InstrStage<1,  [IUnit0]>]>,
//InstrItinData<IIStore            , [InstrStage<1,  [IUnit0]>]>,
//InstrItinData<IIBranch           , [InstrStage<1,  [IUnit3]>]>,
//InstrItinData<IIAlu              , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
//InstrItinData<IIAll              , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>
//]>;

def rVEX2IssueItineraries : ProcessorItineraries<[IUnit0, IUnit1], [], [
InstrItinData<IIAll         , [InstrStage<1,  [IUnit0, IUnit1]>]>,
InstrItinData<IIAlu         , [InstrStage<1,  [IUnit0, IUnit1]>]>,
InstrItinData<IICmpBr       , [InstrStage<2,  [IUnit0, IUnit1]>]>,
InstrItinData<IICmpGr       , [InstrStage<1,  [IUnit0, IUnit1]>]>,
InstrItinData<IISelect      , [InstrStage<1,  [IUnit0, IUnit1]>]>,
InstrItinData<IIMultiply    , [InstrStage<2,  [IUnit0, IUnit1]>]>,
InstrItinData<IILoad        , [InstrStage<2,  [IUnit0]>]>,
InstrItinData<IILoadLr      , [InstrStage<4,  [IUnit0]>]>,
InstrItinData<IIStore       , [InstrStage<1,  [IUnit0]>]>,
InstrItinData<IIStoreLr     , [InstrStage<2,  [IUnit0]>]>,
InstrItinData<IICpGrBr      , [InstrStage<2,  [IUnit0, IUnit1]>]>,
InstrItinData<IICpBrGr      , [InstrStage<1,  [IUnit0, IUnit1]>]>,
InstrItinData<IICpLrGr      , [InstrStage<1,  [IUnit0, IUnit1]>]>,
InstrItinData<IICpGrLr      , [InstrStage<2,  [IUnit0, IUnit1]>]>,
InstrItinData<IIBranch      , [InstrStage<1,  [IUnit1]>]>
]>;

def rVEX4IssueItineraries : ProcessorItineraries<[IUnit0, IUnit1, IUnit2, IUnit3], [], [
InstrItinData<IIAll         , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IIAlu         , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IICmpBr       , [InstrStage<2,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IICmpGr       , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IISelect      , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IIMultiply    , [InstrStage<2,  [IUnit1, IUnit2]>]>,
InstrItinData<IILoad        , [InstrStage<2,  [IUnit0]>]>,
InstrItinData<IILoadLr      , [InstrStage<4,  [IUnit0]>]>,
InstrItinData<IIStore       , [InstrStage<1,  [IUnit0]>]>,
InstrItinData<IIStoreLr     , [InstrStage<2,  [IUnit0]>]>,
InstrItinData<IICpGrBr      , [InstrStage<2,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IICpBrGr      , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IICpLrGr      , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IICpGrLr      , [InstrStage<2,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IIBranch      , [InstrStage<1,  [IUnit3]>]>
]>;

def rVEX8IssueItineraries : ProcessorItineraries<[IUnit0, IUnit1, IUnit2, IUnit3,
                                                  IUnit4, IUnit5, IUnit6, IUnit7], [], [
InstrItinData<IIAll         , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3,
                                               IUnit4, IUnit5, IUnit6, IUnit7]>]>,
InstrItinData<IIAlu         , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3,
                                               IUnit4, IUnit5, IUnit6, IUnit7]>]>,
InstrItinData<IICmpBr       , [InstrStage<2,  [IUnit0, IUnit1, IUnit2, IUnit3,
                                               IUnit4, IUnit5, IUnit6, IUnit7]>]>,
InstrItinData<IICmpGr       , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3,
                                               IUnit4, IUnit5, IUnit6, IUnit7]>]>,
InstrItinData<IISelect      , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3,
                                               IUnit4, IUnit5, IUnit6, IUnit7]>]>,
InstrItinData<IIMultiply    , [InstrStage<2,  [IUnit1, IUnit2, IUnit3, IUnit4,
                                                IUnit5, IUnit6]>]>,
InstrItinData<IILoad        , [InstrStage<2,  [IUnit0]>]>,
InstrItinData<IILoadLr      , [InstrStage<4,  [IUnit0]>]>,
InstrItinData<IIStore       , [InstrStage<1,  [IUnit0]>]>,
InstrItinData<IIStoreLr     , [InstrStage<2,  [IUnit0]>]>,
InstrItinData<IICpGrBr      , [InstrStage<2,  [IUnit0, IUnit1, IUnit2, IUnit3,
                                               IUnit4, IUnit5, IUnit6, IUnit7]>]>,
InstrItinData<IICpBrGr      , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3,
                                               IUnit4, IUnit5, IUnit6, IUnit7]>]>,
InstrItinData<IICpLrGr      , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3,
                                               IUnit4, IUnit5, IUnit6, IUnit7]>]>,
InstrItinData<IICpGrLr      , [InstrStage<2,  [IUnit0, IUnit1, IUnit2, IUnit3,
                                               IUnit4, IUnit5, IUnit6, IUnit7]>]>,
InstrItinData<IIBranch      , [InstrStage<1,  [IUnit7]>]>
]>;

def rVEX8IssueGenericItineraries : ProcessorItineraries<[IUnit0, IUnit1, IUnit2, IUnit3,
IUnit4, IUnit5, IUnit6, IUnit7], [], [
InstrItinData<IIAll         , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3,
                                IUnit4, IUnit5, IUnit6, IUnit7]>]>,
InstrItinData<IIAlu         , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3,
                                IUnit4, IUnit5, IUnit6, IUnit7]>]>,
InstrItinData<IICmpBr       , [InstrStage<2,  [IUnit0, IUnit1, IUnit2, IUnit3,
                                IUnit4, IUnit5, IUnit6, IUnit7]>]>,
InstrItinData<IICmpGr       , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3,
                                IUnit4, IUnit5, IUnit6, IUnit7]>]>,
InstrItinData<IISelect      , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3,
                                IUnit4, IUnit5, IUnit6, IUnit7]>]>,
InstrItinData<IIMultiply    , [InstrStage<2,  [IUnit1, IUnit3, IUnit5, IUnit7]>]>,
InstrItinData<IILoad        , [InstrStage<2,  [IUnit0]>]>,
InstrItinData<IILoadLr      , [InstrStage<4,  [IUnit0]>]>,
InstrItinData<IIStore       , [InstrStage<1,  [IUnit0]>]>,
InstrItinData<IIStoreLr     , [InstrStage<2,  [IUnit0]>]>,
InstrItinData<IICpGrBr      , [InstrStage<2,  [IUnit0, IUnit1, IUnit2, IUnit3,
                                IUnit4, IUnit5, IUnit6, IUnit7]>]>,
InstrItinData<IICpBrGr      , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3,
                                IUnit4, IUnit5, IUnit6, IUnit7]>]>,
InstrItinData<IICpLrGr      , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3,
                                IUnit4, IUnit5, IUnit6, IUnit7]>]>,
InstrItinData<IICpGrLr      , [InstrStage<2,  [IUnit0, IUnit1, IUnit2, IUnit3,
                                IUnit4, IUnit5, IUnit6, IUnit7]>]>,
InstrItinData<IIBranch      , [InstrStage<1,  [IUnit7]>]>
]>;

def Simple2IssueItineraries : ProcessorItineraries<[IUnit0, IUnit1], [], [
InstrItinData<IIAll         , [InstrStage<1,  [IUnit0, IUnit1]>]>,
InstrItinData<IIAlu         , [InstrStage<1,  [IUnit0, IUnit1]>]>,
InstrItinData<IICmpBr       , [InstrStage<1,  [IUnit0, IUnit1]>]>,
InstrItinData<IICmpGr       , [InstrStage<1,  [IUnit0, IUnit1]>]>,
InstrItinData<IISelect      , [InstrStage<1,  [IUnit0, IUnit1]>]>,
InstrItinData<IIMultiply    , [InstrStage<1,  [IUnit0, IUnit1]>]>,
InstrItinData<IILoad        , [InstrStage<1,  [IUnit0]>]>,
InstrItinData<IILoadLr      , [InstrStage<1,  [IUnit0]>]>,
InstrItinData<IIStore       , [InstrStage<1,  [IUnit0]>]>,
InstrItinData<IIStoreLr     , [InstrStage<1,  [IUnit0]>]>,
InstrItinData<IICpGrBr      , [InstrStage<1,  [IUnit0, IUnit1]>]>,
InstrItinData<IICpBrGr      , [InstrStage<1,  [IUnit0, IUnit1]>]>,
InstrItinData<IICpLrGr      , [InstrStage<1,  [IUnit0, IUnit1]>]>,
InstrItinData<IICpGrLr      , [InstrStage<1,  [IUnit0, IUnit1]>]>,
InstrItinData<IIBranch      , [InstrStage<1,  [IUnit1]>]>
]>;

def Simple4IssueItineraries : ProcessorItineraries<[IUnit0, IUnit1, IUnit2, IUnit3], [], [
InstrItinData<IIAll         , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IIAlu         , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IICmpBr       , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IICmpGr       , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IISelect      , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IIMultiply    , [InstrStage<1,  [IUnit1, IUnit2]>]>,
InstrItinData<IILoad        , [InstrStage<1,  [IUnit0]>]>,
InstrItinData<IILoadLr      , [InstrStage<1,  [IUnit0]>]>,
InstrItinData<IIStore       , [InstrStage<1,  [IUnit0]>]>,
InstrItinData<IIStoreLr     , [InstrStage<1,  [IUnit0]>]>,
InstrItinData<IICpGrBr      , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IICpBrGr      , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IICpLrGr      , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IICpGrLr      , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IIBranch      , [InstrStage<1,  [IUnit3]>]>
]>;

def Simple4Issue4MemItineraries : ProcessorItineraries<[IUnit0, IUnit1, IUnit2, IUnit3], [], [
InstrItinData<IIAll         , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IIAlu         , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IICmpBr       , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IICmpGr       , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IISelect      , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IIMultiply    , [InstrStage<1,  [IUnit1, IUnit2]>]>,
InstrItinData<IILoad        , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IILoadLr      , [InstrStage<1,  [IUnit0]>]>,
InstrItinData<IIStore       , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IIStoreLr     , [InstrStage<1,  [IUnit0]>]>,
InstrItinData<IICpGrBr      , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IICpBrGr      , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IICpLrGr      , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IICpGrLr      , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IIBranch      , [InstrStage<1,  [IUnit3]>]>
]>;


def Simple8IssueItineraries : ProcessorItineraries<[IUnit0, IUnit1, IUnit2, IUnit3,
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
InstrItinData<IIMultiply    , [InstrStage<1,  [IUnit1, IUnit2, IUnit3, IUnit4,
                                               IUnit5, IUnit6]>]>,
InstrItinData<IILoad        , [InstrStage<1,  [IUnit0]>]>,
InstrItinData<IILoadLr      , [InstrStage<1,  [IUnit0]>]>,
InstrItinData<IIStore       , [InstrStage<1,  [IUnit0]>]>,
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

def Simple8Issue4MemItineraries : ProcessorItineraries<[IUnit0, IUnit1, IUnit2, IUnit3,
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
InstrItinData<IIMultiply    , [InstrStage<1,  [IUnit1, IUnit2, IUnit3, IUnit4,
IUnit5, IUnit6]>]>,
InstrItinData<IILoad        , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
InstrItinData<IILoadLr      , [InstrStage<1,  [IUnit0]>]>,
InstrItinData<IIStore       , [InstrStage<1,  [IUnit0, IUnit1, IUnit2, IUnit3]>]>,
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



def rVEX2IssueModel : SchedMachineModel {
    let IssueWidth = 2;
    let LoadLatency = 2;
    let Itineraries = rVEX2IssueItineraries;
}

def rVEX4IssueModel : SchedMachineModel {
    let IssueWidth = 4;
    let LoadLatency = 2;
    let Itineraries = rVEX4IssueItineraries;
}

def rVEX8IssueModel : SchedMachineModel {
    let IssueWidth = 8;
    let LoadLatency = 2;
    let Itineraries = rVEX8IssueItineraries;
}

def rVEXGenericModel : SchedMachineModel {
    let IssueWidth = 8;
    let LoadLatency = 2;
    let Itineraries = rVEX8IssueGenericItineraries;
}

def Simple2IssueModel : SchedMachineModel {
    let IssueWidth = 2;
    let LoadLatency = 1;
    let Itineraries = Simple2IssueItineraries;
}

def Simple4IssueModel : SchedMachineModel {
    let IssueWidth = 4;
    let LoadLatency = 1;
    let Itineraries = Simple4IssueItineraries;
}

def Simple8IssueModel : SchedMachineModel {
    let IssueWidth = 8;
    let LoadLatency = 1;
    let Itineraries = Simple8IssueItineraries;
}

def Simple4Issue4MemModel : SchedMachineModel {
    let IssueWidth = 4;
    let LoadLatency = 1;
    let Itineraries = Simple4Issue4MemItineraries;
}

def Simple8Issue4MemModel : SchedMachineModel {
    let IssueWidth = 8;
    let LoadLatency = 1;
    let Itineraries = Simple8Issue4MemItineraries;
}
