# Run This in QTCreator:
# -DCMAKE_INSTALL_PREFIX='~/llvm' -DLLVM_TARGETS_TO_BUILD=HMCVEX ~/Dropbox/Universidade/Mestrado/llvm

set (LLVM_TARGET_DEFINITIONS HMCVEX.td)

# Generate HMCVEXGEnRegisterInfo.inc and HMCVEXGenInstrInfo.inc which included by
#  your hand code C++ files.
# HMCVEXGenRegisterInfo.inc came from HMCVEXRegisterInfo.td, HMCVEXGenInstrInfo.inc
#  came from HMCVEXInstrInfo.td.

tablegen(LLVM HMCVEXGenRegisterInfo.inc -gen-register-info)
tablegen(LLVM HMCVEXGenInstrInfo.inc -gen-instr-info)
tablegen(LLVM HMCVEXGenSubtargetInfo.inc -gen-subtarget)
tablegen(LLVM HMCVEXGenPseudoLowering.inc -gen-pseudo-lowering)
tablegen(LLVM HMCVEXGenDFAPacketizer.inc -gen-dfa-packetizer)
tablegen(LLVM HMCVEXGenDAGISel.inc -gen-dag-isel)
tablegen(LLVM HMCVEXGenCallingConv.inc -gen-callingconv)
tablegen(LLVM HMCVEXGenCodeEmitter.inc -gen-emitter)
tablegen(LLVM HMCVEXGenAsmWriter.inc -gen-asm-writer)

# HMCVEXCommomTableGen must be defined
add_public_tablegen_target(HMCVEXCommonTableGen)

# HMCVEXCodeGen should match with LLVMBuild.txt HMCVEXCodeGen
add_llvm_target(HMCVEXCodeGen
  HMCVEXTargetMachine.cpp
  HMCVEXFrameLowering.cpp
  HMCVEXInstrInfo.cpp
  HMCVEXISelLowering.cpp
  HMCVEXMachineFunctionInfo.cpp
  HMCVEXRegisterInfo.cpp
  HMCVEXSubtarget.cpp
  HMCVEXMachineScheduler.cpp
  HMCVEXSelectionDAGInfo.cpp
  HMCVEXAsmPrinter.cpp
  HMCVEXMCInstLower.cpp
  HMCVEXISelDAGToDAG.cpp
  HMCVEXVLIWPacketizer.cpp
  HexagonMachineScheduler.cpp
  HMCVEXTreeHeightReduction.cpp
  )

# Should match with "subdirectories = MCTargetDesc TargetInfo" in LLVMBuild.txt
add_subdirectory(TargetInfo)
add_subdirectory(MCTargetDesc)
add_subdirectory(InstPrinter)

