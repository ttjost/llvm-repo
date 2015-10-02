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
#ifndef VEXBASEINFO_H
#define VEXBASEINFO_H

#include "VEXMCTargetDesc.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/Support/DataTypes.h"
#include "llvm/Support/ErrorHandling.h"
#include <map>
#include <set>

namespace llvm {

/// getVEXRegisterNumbering - Given the enum value for some register,
/// return the number that it corresponds to.
inline static unsigned getVEXRegisterNumbering(unsigned RegEnum)
{
  switch (RegEnum) {
  case VEX::Reg0:
    return 0;
  case VEX::Reg1:
    return 1;
  case VEX::Reg2:
    return 2;
  case VEX::Reg3:
    return 3;
  case VEX::Reg4:
    return 4;
  case VEX::Reg5:
    return 5;
  case VEX::Reg6:
    return 6;
  case VEX::Reg7:
    return 7;
  case VEX::Reg8:
    return 8;
  case VEX::Reg9:
    return 9;
  case VEX::Reg10:
    return 10;
  case VEX::Reg11:
    return 11;
  case VEX::Reg12:
    return 12;
  case VEX::Reg13:
    return 13;
  case VEX::Reg14:
    return 14;
  case VEX::Reg15:
    return 15;
  case VEX::Reg16:
    return 16;
  case VEX::Reg17:
    return 17;
  case VEX::Reg18:
    return 18;
  case VEX::Reg19:
    return 19;
  case VEX::Reg20:
    return 20;
  case VEX::Reg21:
    return 21;
  case VEX::Reg22:
    return 22;
  case VEX::Reg23:
    return 23;
  case VEX::Reg24:
    return 24;
  case VEX::Reg25:
    return 25;
  case VEX::Reg26:
    return 26;
  case VEX::Reg27:
    return 27;
  case VEX::Reg28:
    return 28;
  case VEX::Reg29:
    return 29;
  case VEX::Reg30:
    return 30;
  case VEX::Reg31:
    return 31;
  case VEX::Reg32:
    return 32;
  case VEX::Reg33:
    return 33;
  case VEX::Reg34:
    return 34;
  case VEX::Reg35:
    return 35;
  case VEX::Reg36:
    return 36;
  case VEX::Reg37:
    return 37;
  case VEX::Reg38:
    return 38;
  case VEX::Reg39:
    return 39;
  case VEX::Reg40:
    return 40;
  case VEX::Reg41:
    return 41;
  case VEX::Reg42:
    return 42;
  case VEX::Reg43:
    return 43;
  case VEX::Reg44:
    return 44;
  case VEX::Reg45:
    return 45;
  case VEX::Reg46:
    return 46;
  case VEX::Reg47:
    return 47;
  case VEX::Reg48:
    return 48;
  case VEX::Reg49:
    return 49;
  case VEX::Reg50:
    return 50;
  case VEX::Reg51:
    return 51;
  case VEX::Reg52:
    return 52;
  case VEX::Reg53:
    return 53;
  case VEX::Reg54:
    return 54;
  case VEX::Reg55:
    return 55;
  case VEX::Reg56:
    return 56;
  case VEX::Reg57:
    return 57;
  case VEX::Reg58:
    return 58;
  case VEX::Reg59:
    return 59;
  case VEX::Reg60:
    return 60;
  case VEX::Reg61:
    return 61;
  case VEX::Reg62:
    return 62;
  case VEX::Reg63:
    return 63;
  case VEX::BrReg0:
    return 0;
  case VEX::BrReg1:
    return 1;
  case VEX::BrReg2:
    return 2;
  case VEX::BrReg3:
    return 3;
  case VEX::BrReg4:
    return 4;
  case VEX::BrReg5:
    return 5;
  case VEX::BrReg6:
    return 6;
  case VEX::BrReg7:
    return 7;
  case VEX::Lr:
    return 64;
  default: llvm_unreachable("Unknown register number!");
  }
}

    extern int VEXDFAStateInputTable[][2];
    extern unsigned int VEXDFAStateEntryTable[];

//
//
// State represents the usage of machine resources if the packet contains
// a set of instruction classes.
//
// Specifically, currentState is a set of bit-masks.
// The nth bit in a bit-mask indicates whether the nth resource is being used
// by this state. The set of bit-masks in a state represent the different
// possible outcomes of transitioning to this state.
// For example: consider a two resource architecture: resource L and resource M
// with three instruction classes: L, M, and L_or_M.
// From the initial state (currentState = 0x00), if we add instruction class
// L_or_M we will transition to a state with currentState = [0x01, 0x10]. This
// represents the possible resource states that can result from adding a L_or_M
// instruction
//
// Another way of thinking about this transition is we are mapping a NDFA with
// two states [0x01] and [0x10] into a DFA with a single state [0x01, 0x10].
//
// A State instance also contains a collection of transitions from that state:
// a map from inputs to new states.
//
class VEXState {
 public:
  static int currentStateNum;
  // stateNum is the only member used for equality/ordering, all other members
  // can be mutated even in const State objects.
  const int stateNum;
  mutable bool isInitial;
  mutable std::set<unsigned> stateInfo;
  typedef std::map<unsigned, const VEXState *> TransitionMap;
  mutable TransitionMap Transitions;

  VEXState();

  bool operator<(const VEXState &s) const {
    return stateNum < s.stateNum;
  }

  //
  // canAddInsnClass - Returns true if an instruction of type InsnClass is a
  // valid transition from this state, i.e., can an instruction of type InsnClass
  // be added to the packet represented by this state.
  //
  // PossibleStates is the set of valid resource states that ensue from valid
  // transitions.
  //
  bool canAddInsnClass(unsigned InsnClass) const;
  //
  // AddInsnClass - Return all combinations of resource reservation
  // which are possible from this state (PossibleStates).
  //
  void AddInsnClass(unsigned InsnClass, std::set<unsigned> &PossibleStates) const;
  // 
  // addTransition - Add a transition from this state given the input InsnClass
  //
  void addTransition(unsigned InsnClass, const VEXState *To) const;
  //
  // hasTransition - Returns true if there is a transition from this state
  // given the input InsnClass
  //
  bool hasTransition(unsigned InsnClass) const;
};
    
    
//
// class DFA: deterministic finite automaton for processor resource tracking.
//
class VEXDFA {
public:
  VEXDFA();

  // Set of states. Need to keep this sorted to emit the transition table.
  typedef std::set<VEXState> StateSet;
  StateSet states;

  VEXState *currentState;

  //
  // Modify the DFA.
  //
  const VEXState &newState();

  //
  // writeTable: Print out a table representing the DFA.
  //
  void UpdateTables();
};


}

#endif
