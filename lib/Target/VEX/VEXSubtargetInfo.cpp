////===-- llvm/lib/Target/VEX/VEXSubtargetInfo.cpp ---------------------------*- C++ -*-===//
////
////                     The LLVM Compiler Infrastructure
////
//// This file is distributed under the University of Illinois Open Source
//// License. See LICENSE.TXT for details.
////
////===----------------------------------------------------------------------===//
////
////    Reads a configuration file and sets 
////
////
//
//#ifdef GET_SUBTARGETINFO_ENUM
//#undef GET_SUBTARGETINFO_ENUM
//namespace llvm {
//} // End llvm namespace
//#endif // GET_SUBTARGETINFO_ENUM
//
//#include "llvm/ADT/StringExtras.h"
//#include "llvm/ADT/StringSet.h"
//#include "llvm/Support/MemoryBuffer.h"
//#include "llvm/Support/Regex.h"
//#include <string>
//#include <map>
//#include <system_error>
//#include <utility>
//#include "llvm/Support/Debug.h"
//#include "llvm/Support/ErrorHandling.h"
//#include "llvm/Support/raw_ostream.h"
//
//
//#define DEBUG_TYPE "vex-subtargetinfo"
//
//#ifdef GET_SUBTARGETINFO_MC_DESC
//#undef GET_SUBTARGETINFO_MC_DESC
//namespace llvm {
//    
//static cl::opt<std::string> ConfigurationFile("fmm",
//                                              cl::Hidden, cl::desc("VEX Configuration File"));
//
//// Sorted (by key) array of values for CPU subtype.
//extern const llvm::SubtargetFeatureKV VEXSubTypeKV[] = {
//    { "VEX_I", "Select the VEX_I processor", 0ULL, 0ULL },
//    { "VEX_II", "Select the VEX_II processor", 0ULL, 0ULL }
//};
//
////#ifdef DBGFIELD
////#error "<target>GenSubtargetInfo.inc requires a DBGFIELD macro"
////#endif
////#ifndef NDEBUG
////#define DBGFIELD(x) x,
////#else
////#define DBGFIELD(x)
//#//endif
//
//// Functional units for "VEXGenericItineraries"
//// We statically define 16 Slots for architecture.
//// However, we dynamically generate the correct number
//// of Units to be used.
//namespace VEXGenericItinerariesFU {
//    const unsigned IUnit0 = 1 << 0;
//    const unsigned IUnit1 = 1 << 1;
//    const unsigned IUnit2 = 1 << 2;
//    const unsigned IUnit3 = 1 << 3;
//    const unsigned IUnit4 = 1 << 4;
//    const unsigned IUnit5 = 1 << 5;
//    const unsigned IUnit6 = 1 << 6;
//    const unsigned IUnit7 = 1 << 7;
//    const unsigned IUnit8 = 1 << 8;
//    const unsigned IUnit9 = 1 << 9;
//    const unsigned IUnit10 = 1 << 10;
//    const unsigned IUnit11 = 1 << 11;
//    const unsigned IUnit12 = 1 << 12;
//    const unsigned IUnit13 = 1 << 13;
//    const unsigned IUnit14 = 1 << 14;
//    const unsigned IUnit15 = 1 << 15;
//}
//
//SmallVector<unsigned, 16> ItinerariesFU = { VEXGenericItinerariesFU::IUnit0,
//                                            VEXGenericItinerariesFU::IUnit1,
//                                            VEXGenericItinerariesFU::IUnit2,
//                                            VEXGenericItinerariesFU::IUnit3,
//                                            VEXGenericItinerariesFU::IUnit4,
//                                            VEXGenericItinerariesFU::IUnit5,
//                                            VEXGenericItinerariesFU::IUnit6,
//                                            VEXGenericItinerariesFU::IUnit7,
//                                            VEXGenericItinerariesFU::IUnit8,
//                                            VEXGenericItinerariesFU::IUnit9,
//                                            VEXGenericItinerariesFU::IUnit10,
//                                            VEXGenericItinerariesFU::IUnit11,
//                                            VEXGenericItinerariesFU::IUnit12,
//                                            VEXGenericItinerariesFU::IUnit13,
//                                            VEXGenericItinerariesFU::IUnit14,
//                                            VEXGenericItinerariesFU::IUnit15};
//    
//    llvm::InstrStage VEXStages[] = {
//        { 0, 0, 0, llvm::InstrStage::Required }, // No itinerary
//        { 0, 0, 0, llvm::InstrStage::Required }, // No itinerary
//        { 0, 0, 0, llvm::InstrStage::Required }, // No itinerary
//        { 0, 0, 0, llvm::InstrStage::Required }, // No itinerary
//        { 0, 0, 0, llvm::InstrStage::Required }, // No itinerary
//        { 0, 0, 0, llvm::InstrStage::Required }, // No itinerary
//        { 0, 0, 0, llvm::InstrStage::Required }, // No itinerary
//        { 0, 0, 0, llvm::InstrStage::Required } // End stages
//    };
//
//    extern const unsigned VEXOperandCycles[] = {
//        0, // No itinerary
//        0 // End operand cycles
//    };
//    extern const unsigned VEXForwardingPaths[] = {
//        0, // No itinerary
//        0 // End bypass tables
//    };
//    
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
//
////    extern const llvm::InstrStage VEXStages[] = {
////        { 0, 0, 0, llvm::InstrStage::Required }, // No itinerary
////        { 1, VEXGenericItinerariesFU::IUnit0 | VEXGenericItinerariesFU::IUnit1 | VEXGenericItinerariesFU::IUnit2 | VEXGenericItinerariesFU::IUnit3, -1, (llvm::InstrStage::ReservationKinds)0 }, // 1
////        { 1, VEXGenericItinerariesFU::IUnit3, -1, (llvm::InstrStage::ReservationKinds)0 }, // 2
////        { 1, VEXGenericItinerariesFU::IUnit0, -1, (llvm::InstrStage::ReservationKinds)0 }, // 3
////        { 1, VEXGenericItinerariesFU::IUnit1 | VEXGenericItinerariesFU::IUnit2, -1, (llvm::InstrStage::ReservationKinds)0 }, // 4
////        { 0, 0, 0, llvm::InstrStage::Required } // End stages
////    };
////    extern const unsigned VEXOperandCycles[] = {
////        0, // No itinerary
////        0 // End operand cycles
////    };
////    extern const unsigned VEXForwardingPaths[] = {
////        0, // No itinerary
////        0 // End bypass tables
////    };
////    
////    static const llvm::InstrItinerary VEXGenericItineraries[] = {
////        { 0, 0, 0, 0, 0 }, // 0 NoInstrModel
////        { 1, 1, 2, 0, 0 }, // 1 IIAlu
////        { 1, 2, 3, 0, 0 }, // 2 IIBranch
////        { 1, 1, 2, 0, 0 }, // 3 IIAll
////        { 1, 3, 4, 0, 0 }, // 4 IILoad
////        { 1, 4, 5, 0, 0 }, // 5 IIMul
////        { 1, 3, 4, 0, 0 }, // 6 IIStore
////        { 0, ~0U, ~0U, ~0U, ~0U } // end marker
////    };
//    
//// ===============================================================
//// Data tables for the new per-operand machine model.
//
//// {ProcResourceIdx, Cycles}
//extern const llvm::MCWriteProcResEntry VEXWriteProcResTable[] = {
//    { 0,  0}, // Invalid
//}; // VEXWriteProcResTable
//
//// {Cycles, WriteResourceID}
//extern const llvm::MCWriteLatencyEntry VEXWriteLatencyTable[] = {
//    { 0,  0}, // Invalid
//}; // VEXWriteLatencyTable
//
//// {UseIdx, WriteResourceID, Cycles}
//extern const llvm::MCReadAdvanceEntry VEXReadAdvanceTable[] = {
//    {0,  0,  0}, // Invalid
//}; // VEXReadAdvanceTable
//
//// Default IssueWidth is 4 and Default Load latency is 2
//llvm::MCSchedModel VEXSchedMachineModel = {
//    4, // IssueWidth
//    MCSchedModel::DefaultMicroOpBufferSize,
//    MCSchedModel::DefaultLoopMicroOpBufferSize,
//    1,
//    MCSchedModel::DefaultHighLatency,
//    MCSchedModel::DefaultMispredictPenalty,
//    0, // PostRAScheduler
//    1, // CompleteModel
//    1, // Processor ID
//    0, 0, 0, 0, // No instruction-level machine model.
//    VEXGenericItineraries
//};
//
//// Sorted (by key) array of itineraries for CPU subtype.
//extern const llvm::SubtargetInfoKV VEXProcSchedKV[] = {
//    { "VEX_I", (const void *)&VEXSchedMachineModel },
//    { "VEX_II", (const void *)&VEXSchedMachineModel }
//};
//
//#undef DBGFIELD
//    
//const SmallVector<unsigned, 16> DefaultResConfig = {4, 1, 4, 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
//const SmallVector<unsigned, 16> DefaultDelConfig = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
//    
//struct ConfigInfo {
//    unsigned IssueWidth;
//    SmallVector<unsigned, 16> Resources;
//    SmallVector<unsigned, 16> Delays;
//    unsigned NumRegisters;
//    
//    std::map<std::string, unsigned> NameToBitsMap;
//        
//    ConfigInfo() {
//        IssueWidth = 4;
//        Resources = DefaultResConfig;
//        Delays = DefaultDelConfig;
//        NumRegisters = 64;
//    }
//};
//    
//void ConfigureMachineModel(unsigned &IssueWidth,
//                           SmallVector<unsigned, 16> &Resources,
//                           SmallVector<unsigned, 16> &Delays,
//                           unsigned &NumRegisters,
//                           std::map<std::string, unsigned> &NameToBitsMap) {
//    
//    ErrorOr<std::unique_ptr<MemoryBuffer>> FileOrErr =
//    MemoryBuffer::getFile(ConfigurationFile);
//    
//    if (std::error_code EC = FileOrErr.getError()) {
//        errs() << "WARNING: No File Specified.\nDefault configuration: \n" <<
//        "\tRES: IssueWidth 4\n\tRES: Alu 4\n\tRES: Store 1\n" <<
//        "\tRES: Load 1\n\tRES: Multiply 2\n\tDEL: Alu 0\n" <<
//        "\tDEL: Multiply 0\n\tDEL: Load 0\n\tRES: Reg 64\n";
//    } else {
//        
//        SmallVector<StringRef, 16> Options = {  "Alu", "Branch",
//            "All", "Load",
//            "Multiply", "Store",
//            "AddOtherType1", "AddOtherType2",
//            "AddOtherType3", "AddOtherType4",
//            "AddOtherType5", "AddOtherType6",
//            "AddOtherType7", "AddOtherType8",
//            "AddOtherType9", "AddOtherType10" };
//        size_t Pos;
//        unsigned Value;
//        StringRef Opt;
//        SmallVector<StringRef, 16> Lines;
//        FileOrErr.get()->getBuffer().split(Lines, "\n", -1, false);
//        
//        bool isResource = false;
//        for (unsigned i = 0, e = Lines.size(); i != e; ++i) {
//            Pos = Lines[i].find("RES: ");
//            if (Pos != StringRef::npos) {
//                isResource = true;
//            } else {
//                Pos = Lines[i].find("DEL: ");
//                if (Pos != StringRef::npos) {
//                    isResource = false;
//                } else {
//                    Pos = Lines[i].find("IssueWidth ");
//                    if (Lines[i].find("IssueWidth ") != StringRef::npos) {
//                        Lines[i].substr(Pos+11, StringRef::npos).getAsInteger(10, IssueWidth);
//                        continue;
//                    } else {
//                        Pos = Lines[i].find("Reg ");
//                        if (Lines[i].find("Reg ") != StringRef::npos) {
//                            Lines[i].substr(Pos+1, StringRef::npos).getAsInteger(10, NumRegisters);
//                            continue;
//                        } else
//                            continue;
//                    }
//                }
//            }
//            
//            SmallVector<StringRef, 4> LineInfo;
//            Lines[i].substr(Pos+5, StringRef::npos).split(LineInfo, " ", -1, false);
//            for (unsigned j = 0, k = Options.size(); j != k; ++j) {
//                if (Options[j] == LineInfo[0]) {
//                    LineInfo[1].getAsInteger(10, Value);
//                    if (isResource)
//                        Resources[j] = Value;
//                    else
//                        Delays[j] = Value;
//                }
//            }
//            //if (!found)
//            //    assert("Parameter" + LineInfo[0] + " not found. Check configuration file.");
//            
//        }
//    }
//    
//    // Set What Units Each Instruction Class will use
//    {
//        unsigned i;
//        unsigned totalUnitsPerType;
//        unsigned DelayPerType;
//        unsigned Units;
//        
//        // Alu
//        i = 0;
//        totalUnitsPerType = Resources[i];
//        DelayPerType = Delays[i];
//        Units = 0;
//        for (unsigned j = 0; j < totalUnitsPerType; ++j) {
//            Units |= ItinerariesFU[j];
//        }
//        //VEXStages[i+1] = {DelayPerType, Units, -1, (llvm::InstrStage::ReservationKinds)0};
//        NameToBitsMap["Alu"] = Units;
//        
//        // Branch
//        i++;
//        totalUnitsPerType = Resources[i];
//        DelayPerType = Delays[i];
//        Units = 0;
//        for (unsigned j = IssueWidth-totalUnitsPerType; j < IssueWidth; ++j) {
//            Units |= ItinerariesFU[j];
//        }
//        //VEXStages[i+1] = {DelayPerType, Units, -1, (llvm::InstrStage::ReservationKinds)0};
//        NameToBitsMap["Branch"] = Units;
//        
//        // All Units
//        i++;
//        totalUnitsPerType = Resources[i];
//        DelayPerType = Delays[i];
//        Units = 0;
//        for (unsigned j = 0; j < IssueWidth; ++j) {
//            Units |= ItinerariesFU[j];
//        }
//        //VEXStages[i+1] = {DelayPerType, Units, -1, (llvm::InstrStage::ReservationKinds)0};
//        NameToBitsMap["All"] = Units;
//        
//        // Load
//        i++;
//        totalUnitsPerType = Resources[i];
//        DelayPerType = Delays[i];
//        Units = 0;
//        for (unsigned j = 0; j < totalUnitsPerType; ++j) {
//            Units |= ItinerariesFU[j];
//        }
//        //VEXStages[i+1] = {DelayPerType, Units, -1, (llvm::InstrStage::ReservationKinds)0};
//        unsigned memoryUnits = totalUnitsPerType;
//        NameToBitsMap["Load"] = Units;
//        
//        // Multiply
//        i++;
//        totalUnitsPerType = Resources[i];
//        DelayPerType = Delays[i];
//        Units = 0;
//        for (unsigned j = memoryUnits; j < memoryUnits+totalUnitsPerType; ++j) {
//            Units |= ItinerariesFU[j];
//        }
//        //VEXStages[i+1] = {DelayPerType, Units, -1, (llvm::InstrStage::ReservationKinds)0};
//        NameToBitsMap["Multiply"] = Units;
//        
//        // Store
//        i++;
//        totalUnitsPerType = Resources[i];
//        DelayPerType = Delays[i];
//        Units = 0;
//        for (unsigned j = 0; j < totalUnitsPerType; ++j) {
//            Units |= ItinerariesFU[j];
//        }
//        //VEXStages[i+1] = {DelayPerType, Units, -1, (llvm::InstrStage::ReservationKinds)0};
//        NameToBitsMap["Store"] = Units;
//    }
//    
//    //    errs() << "Configuration Loaded: \n" << "\tRES: IssueWidth " << IssueWidth << "\n";
//    //        Resources[2] = IssueWidth;
//    //    for (unsigned i = 0; i < 6; ++i)
//    //        errs () << "\tRES: " << Options[i] << " " << Resources[i] << "\n";
//    //    for (unsigned i = 0; i < 6; ++i)
//    //        errs () << "\tDEL: " << Options[i] << " " << Delays[i] << "\n";
//    //    
//    //    errs () << "\tReg " << NumRegisters << "\n";
//    
//    VEXSchedMachineModel.IssueWidth = IssueWidth;
//    
//}
//    
//void UpdateItinerariesTables(SmallVector<unsigned, 16> &Delays, std::map<std::string, unsigned> NameToBitsMap) {
//    
//    SmallVector<StringRef, 16> Options = {"Alu", "Branch",
//        "All", "Load",
//        "Multiply", "Store",
//        "AddOtherType1", "AddOtherType2",
//        "AddOtherType3", "AddOtherType4",
//        "AddOtherType5", "AddOtherType6",
//        "AddOtherType7", "AddOtherType8",
//        "AddOtherType9", "AddOtherType10" };
//    
//    std::map<unsigned, unsigned> StageToUnitsMap;
//    // Check to see if stage already exists and create if it doesn't
//    unsigned FindStage = 0, StageCount = 1, j = 1;
//    for (unsigned i = 0; i < 6; ++i) {
//        FindStage = StageToUnitsMap[NameToBitsMap[Options[i]]];
//        if (FindStage == 0) {
//            VEXStages[j++] = { Delays[i], NameToBitsMap[Options[i]], -1, (llvm::InstrStage::ReservationKinds)0};
//            // Emit as { cycles, u1 | u2 | ... | un, timeinc }, // indices
//            //StageTable += ItinStageString + ", // " + itostr(StageCount);
////            if (NStages > 1)
////                StageTable += "-" + itostr(StageCount + NStages - 1);
//            // Record Itin class number.
//            StageToUnitsMap[NameToBitsMap[Options[i]]] = FindStage = StageCount;
//            StageCount += 1;
//        }
//    
////        // Check to see if operand cycle already exists and create if it doesn't
//        unsigned FindOperandCycle = 0, NOperandCycles;
////        if (NOperandCycles > 0) {
//            FindOperandCycle = StageToUnitsMap[NameToBitsMap[Options[i]]];
////            if (FindOperandCycle == 0) {
////            // Emit as  cycle, // index
/////            OperandCycleTable += ItinOperandCycleString + ", // ";
//////            std::string OperandIdxComment = itostr(OperandCycleCount);
//////            if (NOperandCycles > 1)
//////                OperandIdxComment += "-"
//////                + itostr(OperandCycleCount + NOperandCycles - 1);
//////            OperandCycleTable += OperandIdxComment + "\n";
////            // Record Itin class number.
//            VEXGenericItineraries[i+1] = {1, FindOperandCycle, FindOperandCycle+1, 0, 0};
////            ItinOperandMap[ItinOperandCycleString] =
////            FindOperandCycle = OperandCycleCount;
////            // Emit as bypass, // index
////            BypassTable += ItinBypassString + ", // " + OperandIdxComment + "\n";
////            OperandCycleCount += NOperandCycles;
////        }
//    }
////    errs() << "VEXStages[] = { ";
////    for (unsigned i = 0; i < 6; ++i) {
////        errs() << VEXStages[i].getCycles() << ", " << VEXStages[i].getUnits() << ", " << VEXStages[i].getNextCycles() << ", " << VEXStages[i].getReservationKind() << "},\n";
////    }
////    errs() << "}\n";
////    
////    
////    errs() << "VEXGenericItineraries[] = { ";
////    for (unsigned i = 0; i < 8; ++i) {
////        errs() << VEXGenericItineraries[i].NumMicroOps << ", " << VEXGenericItineraries[i].FirstStage << ", " << VEXGenericItineraries[i].LastStage << ", " << VEXGenericItineraries[i].FirstOperandCycle << ", " << VEXGenericItineraries[i].LastOperandCycle << "},\n";
////    }
////    errs() << "}\n";
//    
//}
//    
//static inline void InitVEXMCSubtargetInfo(MCSubtargetInfo *II, StringRef TT, StringRef CPU, StringRef FS) {
//    
//    SmallVector<StringRef, 16> Options = {"Alu", "Branch",
//        "Load", "Store",
//        "Multiply", "AddOtherType0",
//        "AddOtherType1", "AddOtherType2",
//        "AddOtherType3", "AddOtherType4",
//        "AddOtherType5", "AddOtherType6",
//        "AddOtherType7", "AddOtherType8",
//        "AddOtherType9", "AddOtherType10" };
//
////    SmallVector<StringRef, 16> Offset = {"Alu", "Branch",
////        "Load", "Store",
////        "Multiply", "AddOtherType0",
////        "AddOtherType1", "AddOtherType2",
////        "AddOtherType3", "AddOtherType4",
////        "AddOtherType5", "AddOtherType6",
////        "AddOtherType7", "AddOtherType8",
////        "AddOtherType9", "AddOtherType10" };
//    
//    II->InitMCSubtargetInfo(TT, CPU, FS, None, VEXSubTypeKV,
//                            VEXProcSchedKV, VEXWriteProcResTable, VEXWriteLatencyTable, VEXReadAdvanceTable,
//                            VEXStages, VEXOperandCycles, VEXForwardingPaths);
//}
//
//} // End llvm namespace 
//#endif // GET_SUBTARGETINFO_MC_DESC
//
//
//#ifdef GET_SUBTARGETINFO_TARGET_DESC
//#undef GET_SUBTARGETINFO_TARGET_DESC
//#include "llvm/Support/Debug.h"
//#include "llvm/Support/raw_ostream.h"
//// ParseSubtargetFeatures - Parses features string setting specified
//// subtarget options.
//void llvm::VEXSubtarget::ParseSubtargetFeatures(StringRef CPU, StringRef FS) {
//    DEBUG(dbgs() << "\nFeatures:" << FS);
//    DEBUG(dbgs() << "\nCPU:" << CPU << "\n\n");
//}
//#endif // GET_SUBTARGETINFO_TARGET_DESC
//
//#ifdef GET_SUBTARGETINFO_HEADER
//#undef GET_SUBTARGETINFO_HEADER
//namespace llvm {
//
//    class DFAPacketizer;
//
//    struct VEXGenSubtargetInfo : public TargetSubtargetInfo {
//        explicit VEXGenSubtargetInfo(StringRef TT, StringRef CPU, StringRef FS);
//
//    public:
//        unsigned resolveSchedClass(unsigned SchedClass, const MachineInstr *DefMI, const TargetSchedModel *SchedModel) const override;
//        DFAPacketizer *createDFAPacketizer(const InstrItineraryData *IID) const;
//    };
//    
//    
//} // End llvm namespace 
//#endif // GET_SUBTARGETINFO_HEADER
//
//
//#ifdef GET_SUBTARGETINFO_CTOR
//#undef GET_SUBTARGETINFO_CTOR
//#include "llvm/CodeGen/TargetSchedule.h"
//#include "llvm/CodeGen/DFAPacketizer.h"
////#include "MCTargetDesc/VEXBaseInfo.h"
//namespace llvm {
//
//    extern const llvm::SubtargetFeatureKV VEXFeatureKV[];
//    extern const llvm::SubtargetFeatureKV VEXSubTypeKV[];
//    extern const llvm::SubtargetInfoKV VEXProcSchedKV[];
//    extern const llvm::MCWriteProcResEntry VEXWriteProcResTable[];
//    extern const llvm::MCWriteLatencyEntry VEXWriteLatencyTable[];
//    extern const llvm::MCReadAdvanceEntry VEXReadAdvanceTable[];
//    extern const llvm::InstrStage VEXStages[];
//    extern const unsigned VEXOperandCycles[];
//    extern const unsigned VEXForwardingPaths[];
//    extern int VEXDFAStateInputTable[][2];
//    extern unsigned int VEXDFAStateEntryTable[];
//
//    VEXGenSubtargetInfo::VEXGenSubtargetInfo(StringRef TT, StringRef CPU, StringRef FS)
//
//        : TargetSubtargetInfo() {
//            InitMCSubtargetInfo(TT, CPU, FS, None, makeArrayRef(VEXSubTypeKV, 2),
//                                VEXProcSchedKV, VEXWriteProcResTable, VEXWriteLatencyTable, VEXReadAdvanceTable,
//                                VEXStages, VEXOperandCycles, VEXForwardingPaths);
//    }
//
//    unsigned VEXGenSubtargetInfo
//    ::resolveSchedClass(unsigned SchedClass, const MachineInstr *MI, const TargetSchedModel *SchedModel) const {
//        report_fatal_error("Expected a variant SchedClass");
//    } // VEXGenSubtargetInfo::resolveSchedClass
//    
//    DFAPacketizer *VEXGenSubtargetInfo::createDFAPacketizer(const InstrItineraryData *IID) const {
////        errs () << "VEXDFAStateInputTable[][2] = {";
////        for (unsigned i = 0; i < 64; ++i) {
////            errs() << "{" <<VEXDFAStateInputTable[i][0] << ", " << VEXDFAStateInputTable[i][1] <<"},";
////        }
////        errs () << "};\n";
////        
////        errs () << "VEXDFAStateEntryTable[] = {";
////        for (unsigned i = 0; i < 64; ++i) {
////            errs() << "" << VEXDFAStateEntryTable[i] << ", ";
////        }
////        errs () << "};\n";
//        
//        return new DFAPacketizer(IID, VEXDFAStateInputTable, VEXDFAStateEntryTable);
//    }
//    
//} // End llvm namespace
//#endif // GET_SUBTARGETINFO_CTOR
//
