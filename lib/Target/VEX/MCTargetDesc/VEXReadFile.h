////===-- VEXBaseInfo.h - Top level definitions for VEX MC ------*- C++ -*-===//
////
////                     The LLVM Compiler Infrastructure
////
//// This file is distributed under the University of Illinois Open Source
//// License. See LICENSE.TXT for details.
////
////===----------------------------------------------------------------------===//
////
//// This file contains small standalone helper functions and enum definitions for
//// the VEX target useful for the compiler back-end and the MC libraries.
////
////===----------------------------------------------------------------------===//
//#ifndef VEXREADFILE_H
//#define VEXREADFILE_H
//
//#include "llvm/Support/MemoryBuffer.h"
//#include "llvm/Support/Regex.h"
//
//namespace llvm {
//
//class VEXReadFile {
//    
//    unsigned IssueWidth;
//    std::map<StringRef, unsigned>  Latencies;
//    std::map<StringRef, unsigned> Resources;
//    
//    std::map<StringRef, unsigned>  DefaultLatencies = {
//        { "Alu" , 1 },
//        { "Branch", 1 },
//        { "CmpBr", 1 },
//        { "CmpGr", 1 },
//        { "All", 1 },
//        { "Load", 1 },
//        { "LoadLr", 1 },
//        { "CpBrGr", 1 },
//        { "CpGrLr", 1 },
//        { "Multiply", 1 },
//        { "CpGrBr", 1 },
//        { "CpLrGr", 1 },
//        { "Select", 1 },
//        { "Store", 1},
//        { "StoreLr", 1} };
//
//    std::map<StringRef, unsigned> DefaultResources = {
//        { "MemLoad" , 1 },
//        { "MemStore", 1 },
//        { "Alu", 4 },
//        { "Mpy", 2 }
//    };
//    
//public:
//    ReadFile(std::string ConfigurationFile, std::vector<StringRef> NumClasses);
//    
//    unsigned getIssueWidth();
//    std::vector<unsigned> getDelays();
//    std::vector<unsigned> getResources();
//    
//};
//
//}// end namespace llvm
//
//#endif
