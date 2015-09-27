//===-- llvm/lib/Target/VEX/VEXSubtargetInfo.cpp ---------------------------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
//    Reads a configuration file and sets 
//
//

//#ifdef GET_SUBTARGETINFO_ENUM
//#undef GET_SUBTARGETINFO_ENUM
//namespace llvm {
//} // End llvm namespace
//#endif // GET_SUBTARGETINFO_ENUM

#include "llvm/ADT/StringExtras.h"
#include "llvm/ADT/StringSet.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/Regex.h"
#include <string>
#include <system_error>
#include <utility>

#ifdef GET_SUBTARGETINFO_MC_DESC
#undef GET_SUBTARGETINFO_MC_DESC
namespace llvm {
    
static cl::opt<std::string> ConfigurationFile("fmm",
                                              cl::Hidden, cl::desc("VEX Configuration File"));

// Sorted (by key) array of values for CPU subtype.
extern const llvm::SubtargetFeatureKV VEXSubTypeKV[] = {
    { "VEX_I", "Select the VEX_I processor", 0ULL, 0ULL },
    { "VEX_II", "Select the VEX_II processor", 0ULL, 0ULL }
};

//#ifdef DBGFIELD
//#error "<target>GenSubtargetInfo.inc requires a DBGFIELD macro"
//#endif
//#ifndef NDEBUG
//#define DBGFIELD(x) x,
//#else
//#define DBGFIELD(x)
#//endif

// Functional units for "VEXGenericItineraries"
// We statically define 16 Slots for architecture.
// However, we dynamically generate the correct number
// of Units to be used.
namespace VEXGenericItinerariesFU {
    const unsigned IUnit0 = 1 << 0;
    const unsigned IUnit1 = 1 << 1;
    const unsigned IUnit2 = 1 << 2;
    const unsigned IUnit3 = 1 << 3;
    const unsigned IUnit4 = 1 << 4;
    const unsigned IUnit5 = 1 << 5;
    const unsigned IUnit6 = 1 << 6;
    const unsigned IUnit7 = 1 << 7;
    const unsigned IUnit8 = 1 << 8;
    const unsigned IUnit9 = 1 << 9;
    const unsigned IUnit10 = 1 << 10;
    const unsigned IUnit11 = 1 << 11;
    const unsigned IUnit12 = 1 << 12;
    const unsigned IUnit13 = 1 << 13;
    const unsigned IUnit14 = 1 << 14;
    const unsigned IUnit15 = 1 << 15;
}

SmallVector<unsigned, 16> ItinerariesFU = { VEXGenericItinerariesFU::IUnit0,
                                            VEXGenericItinerariesFU::IUnit1,
                                            VEXGenericItinerariesFU::IUnit2,
                                            VEXGenericItinerariesFU::IUnit3,
                                            VEXGenericItinerariesFU::IUnit4,
                                            VEXGenericItinerariesFU::IUnit5,
                                            VEXGenericItinerariesFU::IUnit6,
                                            VEXGenericItinerariesFU::IUnit7,
                                            VEXGenericItinerariesFU::IUnit8,
                                            VEXGenericItinerariesFU::IUnit9,
                                            VEXGenericItinerariesFU::IUnit10,
                                            VEXGenericItinerariesFU::IUnit11,
                                            VEXGenericItinerariesFU::IUnit12,
                                            VEXGenericItinerariesFU::IUnit13,
                                            VEXGenericItinerariesFU::IUnit14,
                                            VEXGenericItinerariesFU::IUnit15};
    
llvm::InstrStage VEXStages[] = {
  { 0, 0, 0, llvm::InstrStage::Required }, // No itinerary
  { 1, VEXGenericItinerariesFU::IUnit1 | VEXGenericItinerariesFU::IUnit2 | VEXGenericItinerariesFU::IUnit0 | VEXGenericItinerariesFU::IUnit3, -1, (llvm::InstrStage::ReservationKinds)0 }, // 1
  { 1, VEXGenericItinerariesFU::IUnit3, -1, (llvm::InstrStage::ReservationKinds)0 }, // 2
  { 1, VEXGenericItinerariesFU::IUnit0, -1, (llvm::InstrStage::ReservationKinds)0 }, // 3
  { 1, VEXGenericItinerariesFU::IUnit1 | VEXGenericItinerariesFU::IUnit2, -1, (llvm::InstrStage::ReservationKinds)0 }, // 4
  { 0, 0, 0, llvm::InstrStage::Required } // End stages
};

//llvm::InstrStage VEXStages[] = {
//    { 0, 0, 0, llvm::InstrStage::Required }, // No itinerary
//    { 0, 0, 0, llvm::InstrStage::Required },
//    { 0, 0, 0, llvm::InstrStage::Required },
//    { 0, 0, 0, llvm::InstrStage::Required },
//    { 0, 0, 0, llvm::InstrStage::Required },
//    { 0, 0, 0, llvm::InstrStage::Required },
//    { 0, 0, 0, llvm::InstrStage::Required },
//    { 0, 0, 0, llvm::InstrStage::Required },
//    { 0, 0, 0, llvm::InstrStage::Required },
//    { 0, 0, 0, llvm::InstrStage::Required } // End stages
//};

    
extern const unsigned VEXOperandCycles[] = {
    0, // No itinerary
    0 // End operand cycles
};
    
extern const unsigned VEXForwardingPaths[] = {
    0, // No itinerary
    0 // End bypass tables
};

llvm::InstrItinerary VEXGenericItineraries[] = {
  { 0, 0, 0, 0, 0 }, // 0 NoInstrModel
  { 1, 1, 2, 0, 0 }, // 1 IIAlu
  { 1, 2, 3, 0, 0 }, // 2 IIBranch
  { 1, 3, 4, 0, 0 }, // 3 IILoad
  { 1, 4, 5, 0, 0 }, // 4 IIMul
  { 1, 3, 4, 0, 0 }, // 5 IIStore
  { 0, ~0U, ~0U, ~0U, ~0U } // end marker
};

//// Must be assigned dynamically
//llvm::InstrItinerary VEXGenericItineraries[] = {
//    { 0, 0, 0, 0, 0 }, // 0 NoInstrModel
//    { 1, 0, 0, 0, 0 }, // 1 IIAlu
//    { 1, 0, 0, 0, 0 }, // 2 IIBranch
//    { 1, 0, 0, 0, 0 }, // 3 IILoad
//    { 1, 0, 0, 0, 0 }, // 4 IIMul
//    { 1, 0, 0, 0, 0 }, // 5 IIStore
//    { 0, ~0U, ~0U, ~0U, ~0U } // end marker
//};

// ===============================================================
// Data tables for the new per-operand machine model.

// {ProcResourceIdx, Cycles}
extern const llvm::MCWriteProcResEntry VEXWriteProcResTable[] = {
    { 0,  0}, // Invalid
}; // VEXWriteProcResTable

// {Cycles, WriteResourceID}
extern const llvm::MCWriteLatencyEntry VEXWriteLatencyTable[] = {
    { 0,  0}, // Invalid
}; // VEXWriteLatencyTable

// {UseIdx, WriteResourceID, Cycles}
extern const llvm::MCReadAdvanceEntry VEXReadAdvanceTable[] = {
    {0,  0,  0}, // Invalid
}; // VEXReadAdvanceTable

// Default IssueWidth is 4 and Default Load latency is 2
llvm::MCSchedModel VEXSchedMachineModel = {
    4, // IssueWidth
    MCSchedModel::DefaultMicroOpBufferSize,
    MCSchedModel::DefaultLoopMicroOpBufferSize,
    1,
    MCSchedModel::DefaultHighLatency,
    MCSchedModel::DefaultMispredictPenalty,
    0, // PostRAScheduler
    1, // CompleteModel
    1, // Processor ID
    0, 0, 0, 0, // No instruction-level machine model.
    VEXGenericItineraries
};

// Sorted (by key) array of itineraries for CPU subtype.
extern const llvm::SubtargetInfoKV VEXProcSchedKV[] = {
    { "VEX_I", (const void *)&VEXSchedMachineModel },
    { "VEX_II", (const void *)&VEXSchedMachineModel }
};

#undef DBGFIELD
    

    
bool ConfigureMachineModel(unsigned &IssueWidth,
                           SmallVector<unsigned, 8> &Resources,
                           SmallVector<unsigned, 8> &Delays,
                           unsigned NumRegisters) {
        
    ErrorOr<std::unique_ptr<MemoryBuffer>> FileOrErr =
        MemoryBuffer::getFile(ConfigurationFile);
    
    if (std::error_code EC = FileOrErr.getError()) {
        errs() << "WARNING: No File Specified.\nDefault configuration: \n" <<
                    "\tRES: IssueWidth 4\n\tRES: Alu 4\n\tRES: Store 1\n" <<
                    "\tRES: Load 1\n\tRES: Multiply 2\n\tDEL: Alu 0\n" <<
                    "\tDEL: Multiply 0\n\tDEL: Load 0\n\tRES: Reg 64\n";
        return false;
    }
    
    SmallVector<StringRef, 16> Options = {"IssueWidth ", "Alu ",
                                          "Branch ", "Load ", "Store ",
                                          "Multiply ", "Reg "};
    
    int Pos, Value;
    StringRef Opt;
    SmallVector<StringRef, 16> Lines;
    FileOrErr.get()->getBuffer().split(Lines, "\n", -1, false);
    
    for (unsigned i = 0, e = Lines.size(); i != e; ++i)
        for (unsigned j = 0, f = Options.size(); j != f; ++j) {
            Pos = Lines[i].find_last_of("RES ");
            if (Pos != 0) {
                Opt = Lines[i].substr(Pos+1, StringRef::npos);
                
                for (unsigned k = 0; k < Options.size(); ++k) {
                    
                }
            }
            Pos = Lines[i].find_last_of("DEL ");
            if (Pos != 0) {
                Opt = Lines[i].substr(Pos+1, StringRef::npos);
                Opt.substr(Pos+1, StringRef::npos).getAsInteger(10, Value);
            }
        }
    
}
    
static inline void InitVEXMCSubtargetInfo(MCSubtargetInfo *II, StringRef TT, StringRef CPU, StringRef FS) {

    unsigned IssueWidth = 4;
    SmallVector<unsigned, 8> Resources(0);
    SmallVector<unsigned, 8> Delays(0);
    unsigned NumRegisters = 64;
    // Configure Information for each Type of Instruction
    bool FileConfigured = ConfigureMachineModel(IssueWidth, Resources, Delays, NumRegisters);
    
    if (FileConfigured)
    II->InitMCSubtargetInfo(TT, CPU, FS, None, VEXSubTypeKV,
                            VEXProcSchedKV, VEXWriteProcResTable, VEXWriteLatencyTable, VEXReadAdvanceTable,
                            VEXStages, VEXOperandCycles, VEXForwardingPaths);
}

} // End llvm namespace 
#endif // GET_SUBTARGETINFO_MC_DESC


#ifdef GET_SUBTARGETINFO_TARGET_DESC
#undef GET_SUBTARGETINFO_TARGET_DESC
#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"
// ParseSubtargetFeatures - Parses features string setting specified
// subtarget options.
void llvm::VEXSubtarget::ParseSubtargetFeatures(StringRef CPU, StringRef FS) {
    DEBUG(dbgs() << "\nFeatures:" << FS);
    DEBUG(dbgs() << "\nCPU:" << CPU << "\n\n");
}
#endif // GET_SUBTARGETINFO_TARGET_DESC


#ifdef GET_SUBTARGETINFO_HEADER
#undef GET_SUBTARGETINFO_HEADER
namespace llvm {

    class DFAPacketizer;

    struct VEXGenSubtargetInfo : public TargetSubtargetInfo {
        explicit VEXGenSubtargetInfo(StringRef TT, StringRef CPU, StringRef FS);

    public:
        unsigned resolveSchedClass(unsigned SchedClass, const MachineInstr *DefMI, const TargetSchedModel *SchedModel) const override;
        DFAPacketizer *createDFAPacketizer(const InstrItineraryData *IID) const;
    };
} // End llvm namespace 
#endif // GET_SUBTARGETINFO_HEADER


#ifdef GET_SUBTARGETINFO_CTOR
#undef GET_SUBTARGETINFO_CTOR
#include "llvm/CodeGen/TargetSchedule.h"
namespace llvm {

    extern const llvm::SubtargetFeatureKV VEXFeatureKV[];
    extern const llvm::SubtargetFeatureKV VEXSubTypeKV[];
    extern const llvm::SubtargetInfoKV VEXProcSchedKV[];
    extern const llvm::MCWriteProcResEntry VEXWriteProcResTable[];
    extern const llvm::MCWriteLatencyEntry VEXWriteLatencyTable[];
    extern const llvm::MCReadAdvanceEntry VEXReadAdvanceTable[];
    extern const llvm::InstrStage VEXStages[];
    extern const unsigned VEXOperandCycles[];
    extern const unsigned VEXForwardingPaths[];

    VEXGenSubtargetInfo::VEXGenSubtargetInfo(StringRef TT, StringRef CPU, StringRef FS)

        : TargetSubtargetInfo() {
            InitMCSubtargetInfo(TT, CPU, FS, None, makeArrayRef(VEXSubTypeKV, 2),
                                VEXProcSchedKV, VEXWriteProcResTable, VEXWriteLatencyTable, VEXReadAdvanceTable,
                                VEXStages, VEXOperandCycles, VEXForwardingPaths);
    }

    unsigned VEXGenSubtargetInfo
    ::resolveSchedClass(unsigned SchedClass, const MachineInstr *MI, const TargetSchedModel *SchedModel) const {
        report_fatal_error("Expected a variant SchedClass");
    } // VEXGenSubtargetInfo::resolveSchedClass
} // End llvm namespace 
#endif // GET_SUBTARGETINFO_CTOR

