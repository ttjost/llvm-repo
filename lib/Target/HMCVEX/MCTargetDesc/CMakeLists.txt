# MCTargetDesc/CMakeLists.txt
add_llvm_library(LLVMHMCVEXDesc
  HMCVEXMCAsmInfo.cpp
  HMCVEXMCTargetDesc.cpp
  HMCVEXTargetStreamer.cpp
  HMCVEXBaseInfo.cpp
  )
