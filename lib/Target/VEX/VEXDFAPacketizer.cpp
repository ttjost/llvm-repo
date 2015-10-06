///*===- TableGen'erated file -------------------------------------*- C++ -*-===*\
// |*                                                                            *|
// |*Target DFA Packetizer Tables                                                *|
// |*                                                                            *|
// |* Automatically generated file, do not edit!                                 *|
// |*                                                                            *|
// \*===----------------------------------------------------------------------===*/
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
//} // namespace
//
//#include "llvm/CodeGen/DFAPacketizer.h"
//namespace llvm {
////    DFAPacketizer *VEXGenSubtargetInfo::createDFAPacketizer(const InstrItineraryData *IID) const {
////        return new DFAPacketizer(IID, VEXDFAStateInputTable, VEXDFAStateEntryTable);
////    }
//    
//} // End llvm namespace 
