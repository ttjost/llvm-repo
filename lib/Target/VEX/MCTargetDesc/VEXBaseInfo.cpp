//===-- VEXBaseInfo.h - Top level definitions for VEX MC ------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains small standalone helper functions and enum definitions for
// the VEX target useful for the compiler back-end and the MC libraries.
//
//===----------------------------------------------------------------------===//
#ifndef VEXBASEINFO_CPP
#define VEXBASEINFO_CPP

#include "VEXBaseInfo.h"
#include "llvm/ADT/DenseSet.h"
#include <map>
#include <string>
#include <vector>

using namespace llvm;

//
// Constructors and destructors for State and DFA
//
VEXState::VEXState() :
stateNum(currentStateNum++), isInitial(false) {}

int VEXState::currentStateNum = 0;

VEXDFA::VEXDFA(): currentState(nullptr) {}

//
// addTransition - Add a transition from this state given the input InsnClass
//
void VEXState::addTransition(unsigned InsnClass, const VEXState *To) const {
    assert(!Transitions.count(InsnClass) &&
           "Cannot have multiple transitions for the same input");
    Transitions[InsnClass] = To;
}

//
// hasTransition - Returns true if there is a transition from this state
// given the input InsnClass
//
bool VEXState::hasTransition(unsigned InsnClass) const {
    return Transitions.count(InsnClass) > 0;
}

//
// AddInsnClass - Return all combinations of resource reservation
// which are possible from this state (PossibleStates).
//
void VEXState::AddInsnClass(unsigned InsnClass,
                         std::set<unsigned> &PossibleStates) const {
    //
    // Iterate over all resource states in currentState.
    //
    
    for (std::set<unsigned>::iterator SI = stateInfo.begin();
         SI != stateInfo.end(); ++SI) {
        unsigned thisState = *SI;
        
        //
        // Iterate over all possible resources used in InsnClass.
        // For ex: for InsnClass = 0x11, all resources = {0x01, 0x10}.
        //
        
        DenseSet<unsigned> VisitedResourceStates;
        for (unsigned int j = 0; j < sizeof(InsnClass) * 8; ++j) {
            if ((0x1 << j) & InsnClass) {
                //
                // For each possible resource used in InsnClass, generate the
                // resource state if that resource was used.
                //
                unsigned ResultingResourceState = thisState | (0x1 << j);
                //
                // Check if the resulting resource state can be accommodated in this
                // packet.
                // We compute ResultingResourceState OR thisState.
                // If the result of the OR is different than thisState, it implies
                // that there is at least one resource that can be used to schedule
                // InsnClass in the current packet.
                // Insert ResultingResourceState into PossibleStates only if we haven't
                // processed ResultingResourceState before.
                //
                if ((ResultingResourceState != thisState) &&
                    (VisitedResourceStates.count(ResultingResourceState) == 0)) {
                    VisitedResourceStates.insert(ResultingResourceState);
                    PossibleStates.insert(ResultingResourceState);
                }
            }
        }
    }
    
}


//
// canAddInsnClass - Quickly verifies if an instruction of type InsnClass is a
// valid transition from this state i.e., can an instruction of type InsnClass
// be added to the packet represented by this state.
//
bool VEXState::canAddInsnClass(unsigned InsnClass) const {
    for (std::set<unsigned>::const_iterator SI = stateInfo.begin();
         SI != stateInfo.end(); ++SI) {
        if (~*SI & InsnClass)
            return true;
    }
    return false;
}


const VEXState &VEXDFA::newState() {
    auto IterPair = states.insert(VEXState());
    assert(IterPair.second && "State already exists");
    return *IterPair.first;
}

//extern int VEXDFAStateInputTable[][2];
//extern unsigned int VEXDFAStateEntryTable[];

//
// writeTableAndAPI - Print out a table representing the DFA and the
// associated API to create a DFA packetizer.
//
// Format:
// DFAStateInputTable[][2] = pairs of <Input, Transition> for all valid
//                           transitions.
// DFAStateEntryTable[i] = Index of the first entry in DFAStateInputTable for
//                         the ith state.
//
//
void VEXDFA::UpdateTables() {
    VEXDFA::StateSet::iterator SI = states.begin();
    // This table provides a map to the beginning of the transitions for State s
    // in DFAStateInputTable.
    std::vector<int> StateEntry(states.size());
    
    // Tracks the total valid transitions encountered so far. It is used
    // to construct the StateEntry table.
    int ValidTransitions = 0;
    unsigned j = 0;
    for (unsigned i = 0; i < states.size(); ++i, ++SI) {
        assert ((SI->stateNum == (int) i) && "Mismatch in state numbers");
        StateEntry[i] = ValidTransitions;
        for (VEXState::TransitionMap::iterator
             II = SI->Transitions.begin(), IE = SI->Transitions.end();
             II != IE; ++II, ++j) {
            VEXDFAStateInputTable[j][0] = II->first;
            VEXDFAStateInputTable[j][1] = II->second->stateNum;
        }
        ValidTransitions += SI->Transitions.size();
        
        // If there are no valid transitions from this stage, we need a sentinel
        // transition.
        if (ValidTransitions == StateEntry[i]) {
            VEXDFAStateInputTable[j][0] = -1;
            VEXDFAStateInputTable[j][1] = -1;
            ++j;
            ++ValidTransitions;
        }
    }
    
    // Print out a sentinel entry at the end of the StateInputTable. This is
    // needed to iterate over StateInputTable in DFAPacketizer::ReadTable()
    VEXDFAStateInputTable[j][0] = -1;
    VEXDFAStateInputTable[j][1] = -1;
    unsigned numberOfStates = j+1;
    // Multiply i by 2 since each entry in DFAStateInputTable is a set of
    // two numbers.
    
    for (j = 0; j < states.size(); ++j)
        VEXDFAStateEntryTable[j] = StateEntry[j];
    
    // Print out the index to the sentinel entry in StateInputTable
    VEXDFAStateEntryTable[j] = ValidTransitions;
    
//    errs () << "VEXDFAStateInputTable[][2] = {";
//    for (unsigned i = 0; i < numberOfStates; ++i) {
//        errs() << "{" <<VEXDFAStateInputTable[i][0] << ", " << VEXDFAStateInputTable[i][1] <<"},";
//    }
//    errs () << "};\n";
//    
//    errs () << "VEXDFAStateEntryTable[] = {";
//    for (unsigned i = 0; i < numberOfStates; ++i) {
//        errs() << "" << VEXDFAStateEntryTable[i] << ", ";
//    }
//    errs () << "};\n";
}


#endif
