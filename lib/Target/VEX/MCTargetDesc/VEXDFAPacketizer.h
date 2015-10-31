///*===- TableGen'erated file -------------------------------------*- C++ -*-===*\
// |*                                                                            *|
// |*Target DFA Packetizer Tables                                                *|
// |*                                                                            *|
// |* Automatically generated file, do not edit!                                 *|
// |*                                                                            *|
// \*===----------------------------------------------------------------------===*/
//
//#include "MCTargetDesc/VEXMCTargetDesc.h"
//#include "llvm/MC/MCExpr.h"
//#include "llvm/Support/DataTypes.h"
//#include "llvm/Support/ErrorHandling.h"
//#include <map>
//#include <set>
//
//namespace llvm {
//    
////    const int VEXDFAStateInputTable[][2] = {
////        {1, 2},    {6, 1},    {8, 3},    {15, 4},
////        {1, 18},    {6, 20},    {8, 15},    {15, 5},
////        {6, 18},    {8, 16},    {15, 6},
////        {1, 16},    {6, 15},    {15, 7},
////        {1, 6},    {6, 5},    {8, 7},    {15, 8},
////        {1, 10},    {6, 14},    {8, 11},    {15, 9},
////        {6, 10},    {8, 13},    {15, 10},
////        {1, 13},    {6, 11},    {15, 11},
////        {1, 10},    {6, 9},    {8, 11},    {15, 9},
////        {1, 12},    {6, 12},    {8, 12},    {15, 12},
////        {6, 12},    {8, 12},    {15, 12},
////        {1, 12},    {6, 12},    {15, 12},
////        {-1, -1},
////        {6, 12},    {15, 12},
////        {1, 12},    {8, 12},    {15, 12},
////        {1, 13},    {6, 17},    {15, 11},
////        {6, 13},    {15, 13},
////        {1, 12},    {15, 12},
////        {6, 19},    {8, 13},    {15, 10},
////        {8, 12},    {15, 12},
////        {1, 19},    {8, 17},    {15, 14},
////        {-1, -1}
////    };
////    
////    const unsigned int VEXDFAStateEntryTable[] = {
////        0, 4, 8, 11, 14, 18, 22, 25, 28, 32, 36, 39, 42, 43, 45, 48, 51, 53, 55, 58, 60, 63,
////    };
//
//    int VEXDFAStateInputTable[][2] = {
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//        {0, 0}, {0, 0}, {0, 0}, {0, 0},
//    };
//    
//    unsigned int VEXDFAStateEntryTable[] = {
//        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0,
//        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0,
//        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0,
//        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0,
//        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0,
//        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0,
//        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0,
//        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0
//    };
//
////
////
//// State represents the usage of machine resources if the packet contains
//// a set of instruction classes.
////
//// Specifically, currentState is a set of bit-masks.
//// The nth bit in a bit-mask indicates whether the nth resource is being used
//// by this state. The set of bit-masks in a state represent the different
//// possible outcomes of transitioning to this state.
//// For example: consider a two resource architecture: resource L and resource M
//// with three instruction classes: L, M, and L_or_M.
//// From the initial state (currentState = 0x00), if we add instruction class
//// L_or_M we will transition to a state with currentState = [0x01, 0x10]. This
//// represents the possible resource states that can result from adding a L_or_M
//// instruction
////
//// Another way of thinking about this transition is we are mapping a NDFA with
//// two states [0x01] and [0x10] into a DFA with a single state [0x01, 0x10].
////
//// A State instance also contains a collection of transitions from that state:
//// a map from inputs to new states.
////
//class VEXState {
//public:
//    static int currentStateNum;
//    // stateNum is the only member used for equality/ordering, all other members
//    // can be mutated even in const State objects.
//    const int stateNum;
//    mutable bool isInitial;
//    mutable std::set<unsigned> stateInfo;
//    typedef std::map<unsigned, const VEXState *> TransitionMap;
//    mutable TransitionMap Transitions;
//    
//    VEXState();
//    
//    bool operator<(const VEXState &s) const {
//        return stateNum < s.stateNum;
//    }
//    
//    //
//    // canAddInsnClass - Returns true if an instruction of type InsnClass is a
//    // valid transition from this state, i.e., can an instruction of type InsnClass
//    // be added to the packet represented by this state.
//    //
//    // PossibleStates is the set of valid resource states that ensue from valid
//    // transitions.
//    //
//    bool canAddInsnClass(unsigned InsnClass) const;
//    //
//    // AddInsnClass - Return all combinations of resource reservation
//    // which are possible from this state (PossibleStates).
//    //
//    void AddInsnClass(unsigned InsnClass, std::set<unsigned> &PossibleStates) const;
//    //
//    // addTransition - Add a transition from this state given the input InsnClass
//    //
//    void addTransition(unsigned InsnClass, const VEXState *To) const;
//    //
//    // hasTransition - Returns true if there is a transition from this state
//    // given the input InsnClass
//    //
//    bool hasTransition(unsigned InsnClass) const;
//};
//
//
////
//// class DFA: deterministic finite automaton for processor resource tracking.
////
//class VEXDFA {
//public:
//    VEXDFA();
//    
//    // Set of states. Need to keep this sorted to emit the transition table.
//    typedef std::set<VEXState> StateSet;
//    StateSet states;
//    
//    VEXState *currentState;
//    
//    //
//    // Modify the DFA.
//    //
//    const VEXState &newState();
//    
//    //
//    // writeTable: Print out a table representing the DFA.
//    //
//    void UpdateTables();
//};
//
//
//#include "llvm/CodeGen/DFAPacketizer.h"
//namespace llvm {
////    DFAPacketizer *VEXGenSubtargetInfo::createDFAPacketizer(const InstrItineraryData *IID) const {
////        return new DFAPacketizer(IID, VEXDFAStateInputTable, VEXDFAStateEntryTable);
////    }
//    
//} // End llvm namespace 
