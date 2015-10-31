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
//
//#include "VEXReadFile.cpp"
//
//VEXReadFile::VEXReadFile(std::string ConfigurationFile,
//                      std::vector<StringRef> NumClasses) {
//    
//    for (int i = 0; i < DefaultLatencies.size; ++i) {
//        Latencies[i] = 0;
//    }
//    for (int i = 0; i < DefaultResources.size; ++i) {
//        Resources[i] = 0;
//    }
//    
//    ErrorOr<std::unique_ptr<MemoryBuffer>> FileOrErr =
//    MemoryBuffer::getFile(ConfigurationFile);
//    
//    if (std::error_code EC = FileOrErr.getError()) {
//        errs() << "WARNING: No File Specified.\nDefault configuration: \n" <<
//        "\tRES: IssueWidth 4\n\tRES: Alu 4\n\tRES: Store 1\n" <<
//        "\tRES: Load 1\n\tRES: Multiply 2\n\tDEL: Alu 0\n" <<
//        "\tDEL: Multiply 0\n\tDEL: Load 0\n\tRES: Reg 64\n";
//    }
//    
//}
//
//unsigned VEXReadFile::getIssueWidth() {
//    return IssueWidth;
//}
//
//std::vector<unsigned> VEXReadFile::getDelays() {
//    return Delays;
//}
//
//std::vector<unsigned> getResources() {
//    return Resources;
//}
//
//
//
//#endif
