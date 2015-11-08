//===-- VEXInstrInfo.cpp - VEX Instruction Information ------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the VEX implementation of the TargetInstrInfo class.
//
//===----------------------------------------------------------------------===//

#include "VEXInstrInfo.h"

#include "VEXTargetMachine.h"
#include "VEXMachineFunctionInfo.h"
#include "VEXFrameLowering.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/TargetRegistry.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"


#define DEBUG_TYPE "vex-instrinfo"
using namespace llvm;

#define GET_INSTRINFO_CTOR_DTOR
#include "VEXGenInstrInfo.inc"

#include "VEXGenDFAPacketizer.inc"
//#include "VEXSubtargetInfo.cpp"

cl::opt<bool> isHPCompiler("hp-compiler",
                            cl::Hidden, cl::desc("Compiling for HP Compiler"));

//@VEXInstrInfo(){
VEXInstrInfo::VEXInstrInfo(const VEXSubtarget &STI) : Subtarget(STI), RI(STI) {
    DEBUG(errs() << "InstrInfo \n");
}

// Emit instructions to copy a pair of physical registers.
void VEXInstrInfo::copyPhysReg(MachineBasicBlock &MBB,
                               MachineBasicBlock::iterator MI, DebugLoc DL,
                               unsigned DestReg, unsigned SrcReg,
                               bool KillSrc) const {

    unsigned Opc = 0;
    
    // GP Register is Destination
    if (VEX::GPRegsRegClass.contains(DestReg)){
        if(VEX::BrRegsRegClass.contains(SrcReg))
            Opc = VEX::MFB;
        else
            if(VEX::GPRegsRegClass.contains(SrcReg))
                Opc = VEX::MOVr;
            else
                Opc = VEX::MFL;
    } else
        if(VEX::BrRegsRegClass.contains(DestReg)){
            if (VEX::GPRegsRegClass.contains(SrcReg))
                Opc = VEX::MTB;
            else
                if(VEX::BrRegsRegClass.contains(SrcReg)) {
                    // I think this is a better solution.
                    MachineFunction *MF = MBB.getParent();
                    MachineRegisterInfo &MRI = MF->getRegInfo();
//                    unsigned Reg = MRI.createVirtualRegister(&VEX::GPRegsRegClass);
                    
                    // TODO: Is there a better way of doing this?
                    unsigned Reg = 0;
                    for (Reg = VEX::Reg11 ; Reg < VEX::Reg63; ++Reg) {
                        if (!MBB.isLiveIn(Reg))
                            break;
                    }
                    
                    if (!Reg)
                        llvm_unreachable("CopyPhysReg Method: There is no more Register Available.");
                    
                    BuildMI(MBB, MI, DL, get(VEX::MFB), Reg).addReg(SrcReg, getKillRegState(KillSrc));
                    BuildMI(MBB, MI, DL, get(VEX::MTB), DestReg).addReg(Reg);
                    return;
                } else
                        llvm_unreachable("Impossible to Copy from Link Register to Branch register.");
                
        } else {
            if(VEX::LrRegRegClass.contains(DestReg)) {
                if (VEX::GPRegsRegClass.contains(SrcReg))
                    Opc = VEX::MTL;
                else
                    llvm_unreachable("Impossible to Copy from Branch Register to Link register.");
            }
        }
    BuildMI(MBB, MI, DL, get(Opc), DestReg).addReg(SrcReg, getKillRegState(KillSrc));

}

bool VEXInstrInfo::expandPostRAPseudo(MachineBasicBlock::iterator MI) const {
    
    MachineBasicBlock &MBB = *MI->getParent();
    MachineFunction &MF = *MBB.getParent();
    DEBUG(errs() << "\n\n" << MI->getDesc().getOpcode() <<"\n\n");
    
    switch(MI->getDesc().getOpcode()) {
        default:
            return false;
        case VEX::PSEUDO_RET:
        {
            DEBUG(errs() << "\nReplacing PSEUDO_RET\n");
//            const VEXSubtarget* Subtarget = MF.getSubtarget<VEXSubtarget>();
//            const VEXFrameLowering* FrameLowering = Subtarget.getFrameLowering<VEXFrameLowering>();
            int StackSize = MF.getFrameInfo()->getStackSize() == 0 ? 0 : RoundUpToAlignment(MF.getFrameInfo()->getStackSize() + 16, 32);
            BuildMI(MBB, MI, MI->getDebugLoc(), get(VEX::RET)).addReg(VEX::Reg1).addReg(VEX::Reg1).addImm(StackSize).addReg(VEX::Lr);
            MBB.erase(MI);
            break;
        }
        case VEX::PSEUDO_TCALL:
        {
            DEBUG(errs() << "\nReplacing PSEUDO_TAILCALL\n");
            //            const VEXSubtarget* Subtarget = MF.getSubtarget<VEXSubtarget>();
            //            const VEXFrameLowering* FrameLowering = Subtarget.getFrameLowering<VEXFrameLowering>();
            int StackSize = MF.getFrameInfo()->getStackSize() == 0 ? 0 : RoundUpToAlignment(MF.getFrameInfo()->getStackSize() + 16, 32);
            BuildMI(MBB, MI, MI->getDebugLoc(), get(VEX::ADDi), VEX::Reg1).addReg(VEX::Reg1).addImm(StackSize);
            
            unsigned Opcode;
            if (isHPCompiler)
                Opcode = VEX::CALL;
            else
                Opcode = VEX::GOTO;
            
            BuildMI(MBB, MI, MI->getDebugLoc(), get(Opcode)).addOperand(MI->getOperand(0));
            MBB.erase(MI);
            break;
        }
        case VEX::STWPseudo:
        {
            DEBUG(errs() << "\nReplacing STWPseudo with MFB and STW\n");
            MachineOperand DstReg = MI->getOperand(0);
            MachineOperand SrcReg = MI->getOperand(1);
            MachineOperand MemOperand = MI->getOperand(2);
            MachineOperand FrameIndex = MI->getOperand(3);
            assert(DstReg.isReg() && "Operand must be Register");
            assert(SrcReg.isReg() && "Operand must be Register");
            
            BuildMI(MBB, MI, MI->getDebugLoc(), get(VEX::MFB), DstReg.getReg()).addOperand(SrcReg);
            BuildMI(MBB, MI, MI->getDebugLoc(), get(VEX::STW))
                    .addOperand(DstReg)
                    .addOperand(MemOperand)
                    .addOperand(FrameIndex);
            MBB.erase(MI);
            break;
        }
        case VEX::LDWPseudo:
        {
            DEBUG(errs() << "\nReplacing LDWPseudo with MFB and STW\n");
            MachineOperand DstRegLast = MI->getOperand(0);
            MachineOperand DstRegFirst = MI->getOperand(1);
            MachineOperand FrameIndex = MI->getOperand(2);
            MachineOperand MemOperand = MI->getOperand(3);
            assert(DstRegLast.isReg() && "Operand must be Register");
            assert(DstRegFirst.isReg() && "Operand must be Register");
            
            BuildMI(MBB, MI, MI->getDebugLoc(), get(VEX::LDW), DstRegFirst.getReg())
                    .addOperand(FrameIndex)
                    .addOperand(MemOperand);
            BuildMI(MBB, MI, MI->getDebugLoc(), get(VEX::MTB), DstRegLast.getReg())
                    .addOperand(DstRegFirst);
            MBB.erase(MI);
            break;
        }
    }

    return true;
}

void VEXInstrInfo::loadRegFromStackSlot(MachineBasicBlock &MBB,
                                        MachineBasicBlock::iterator MI,
                                        unsigned DestReg, int FrameIndex,
                                        const TargetRegisterClass *RC,
                                        const TargetRegisterInfo *TRI) const {

    DebugLoc DL;

    if (MI != MBB.end()) DL = MI->getDebugLoc();

    MachineFunction &MF = *MBB.getParent();
    MachineFrameInfo &MFI = *MF.getFrameInfo();

    MachineMemOperand *MMO =
            MF.getMachineMemOperand(MachinePointerInfo::getFixedStack(FrameIndex),
                                    MachineMemOperand::MOLoad,
                                    MFI.getObjectSize(FrameIndex),
                                    MFI.getObjectAlignment(FrameIndex));

    // On the order of operands here: think [FrameIndex + 0] = SrcReg.
    if (RC == &VEX::GPRegsRegClass)
        BuildMI(MBB, MI, DL, get(VEX::LDW), DestReg)
                .addFrameIndex(FrameIndex).addImm(0)
                .addMemOperand(MMO);
    else
        // We cannot directly Spill/Fill with Branch Registers
        // First, we need to Load from Stack to a GPReg and then Move to Branch
        if (RC == &VEX::BrRegsRegClass) {
            MachineRegisterInfo &MRI = MF.getRegInfo();
            unsigned Reg = MRI.createVirtualRegister(&VEX::GPRegsRegClass);
            BuildMI(MBB, MI, DL, get(VEX::LDWPseudo), DestReg)
                    .addReg(Reg, RegState::Define)
                    .addFrameIndex(FrameIndex).addImm(0)
                    .addMemOperand(MMO);
            
        } else {
            if (RC == &VEX::LrRegRegClass) {
                BuildMI(MBB, MI, DL, get(VEX::LDWLr), DestReg)
                        .addFrameIndex(FrameIndex).addImm(0)
                        .addMemOperand(MMO);
            } else
                llvm_unreachable("Can't store this register to stack slot. Register Class Unknown.");
        }
}

void VEXInstrInfo::storeRegToStackSlot(MachineBasicBlock &MBB,
                         MachineBasicBlock::iterator MI,
                         unsigned SrcReg, bool isKill, int FrameIndex,
                         const TargetRegisterClass *RC,
                         const TargetRegisterInfo *TRI) const {

    DebugLoc DL;

    if (MI != MBB.end()) DL = MI->getDebugLoc();

    MachineFunction &MF = *MBB.getParent();
    MachineFrameInfo &MFI = *MF.getFrameInfo();

    MachineMemOperand *MMO =
            MF.getMachineMemOperand(MachinePointerInfo::getFixedStack(FrameIndex),
                                    MachineMemOperand::MOStore,
                                    MFI.getObjectSize(FrameIndex),
                                    MFI.getObjectAlignment(FrameIndex));

    // On the order of operands here: think [FrameIndex + 0] = SrcReg.
    if (RC == &VEX::GPRegsRegClass)
        BuildMI(MBB, MI, DL, get(VEX::STW))
                .addReg(SrcReg, getKillRegState(isKill))
                .addMemOperand(MMO)
                .addFrameIndex(FrameIndex).addImm(0);
    else
        // We cannot directly Spill/Fill with Branch Registers
        // First, we send to a Move From Branch and then Store in Stack
        if (RC == &VEX::BrRegsRegClass) {
            MachineRegisterInfo &MRI = MF.getRegInfo();
            unsigned DstReg = MRI.createVirtualRegister(&VEX::GPRegsRegClass);
            BuildMI(MBB, MI, DL, get(VEX::STWPseudo), DstReg)
                                .addReg(SrcReg, getKillRegState(isKill))
                                .addMemOperand(MMO)
                                .addFrameIndex(FrameIndex).addImm(0);
        } else {
            if (RC == &VEX::LrRegRegClass) {
                BuildMI(MBB, MI, DL, get(VEX::STWLr))
                        .addReg(SrcReg, getKillRegState(isKill))
                        .addMemOperand(MMO)
                        .addFrameIndex(FrameIndex).addImm(0);
            } else
                llvm_unreachable("Can't store this register to stack slot. Register Class Unknown.");
        }
}

void VEXInstrInfo::makeFrame(unsigned SP, int64_t FrameSize,
                             MachineBasicBlock &MBB,
                             MachineBasicBlock::iterator I) const {
    DebugLoc DL = I != MBB.end() ? I->getDebugLoc() : DebugLoc();
    MachineFunction &MF = *MBB.getParent();
    MachineFrameInfo *MFI = MF.getFrameInfo();
    const BitVector Reserved = RI.getReservedRegs(MF);

}

void VEXInstrInfo::adjustStackPtr(VEXFunctionInfo *VEXFI, unsigned SP, uint64_t Amount,
                                  MachineBasicBlock &MBB, MachineBasicBlock::iterator I) const{
    
    
    DebugLoc DL = I != MBB.end() ? I->getDebugLoc() : DebugLoc();
    
    unsigned add = VEX::ADDi;
    
    // TODO : What happens when stacksize is greater than 16 bits? or even 8 bits?
    BuildMI(MBB, I, DL, get(add), SP).addReg(SP).addImm(Amount);
    
}

// Insert Branch Code into the end of the specified MachineBasicBlock
unsigned VEXInstrInfo::InsertBranch(MachineBasicBlock &MBB, MachineBasicBlock *TBB,
                                    MachineBasicBlock *FBB,
                                    const SmallVectorImpl<MachineOperand> &Cond,
                                    DebugLoc DL) const {

    assert(!FBB && "Does not handle InsertBranch for this case");
    //MachineInstr *MI = BuildMI(*MBB.getParent(), DL, get(VEX::GOTO)).addMBB(TBB);
    BuildMI(&MBB, DL, get(VEX::GOTO)).addMBB(TBB);

    return 1;
}

void VEXInstrInfo::insertNoop(MachineBasicBlock &MBB,
                                 MachineBasicBlock::iterator MI) const {
    BuildMI(MBB, MI, MI->getDebugLoc(), get(VEX::NOP));
}

bool VEXInstrInfo::AnalyzeBranch(MachineBasicBlock &MBB,
                                 MachineBasicBlock *&TBB,
                                 MachineBasicBlock *&FBB,
                                 SmallVectorImpl< MachineOperand > &Cond,
                                 bool AllowModify) const {
    return true;

//    TBB = nullptr;
//    FBB = nullptr;

//    MachineBasicBlock::iterator LastInst = MBB.end();

//    if (LastInst == MBB.begin())
//    //if (LastInst = MBB.begin() || !isUnpredicatedTerminator(--LastOpc)
//        return false;

//    unsigned LastOpc = LastInst->getOpcode();

////    // If it is a BUNDLE, then check if there is a
////    // branch instruction in it.
////    if (LastOpc == TargetOpcode::BUNDLE)
//////        for (unsigned i = 0, e = LastInst->getNumOperands();
//////             i != e; i++){
//////            if (LastInst->getOperand(i) == VEX::GOTO ||
//////                LastInst->getOperand(i) == VEX::BR ||
//////                LastInst->getOperand(i) == VEX::BRF){
////                LastOpc = LastInst->getOpcode();
////                //LastInst = LastInst->getOperand(i);
//////            }
//////        }

//    if (LastOpc == VEX::GOTO) {
//      TBB = LastInst->getOperand(0).getMBB();
//      return false;
//    }

//    MachineBasicBlock::iterator SecondLastInst = --LastInst;
//    LastInst = MBB.end();
//    unsigned SecondLastOpc = SecondLastInst->getOpcode();

////    // If it is a BUNDLE, then check if there is a
////    // branch instruction in it.
////    if (SecondLastOpc == TargetOpcode::BUNDLE)
//////        for (unsigned i = 0, e = SecondLastInst->getNumOperands();
//////             i != e; i++){
//////            if (SecondLastInst->getOperand(i) == VEX::GOTO ||
//////                SecondLastInst->getOperand(i) == VEX::BR ||
//////                SecondLastInst->getOperand(i) == VEX::BRF){
////                SecondLastOpc = SecondLastInst->getOpcode();
//////                //SecondLastInst = SecondLastInst->getOperand(i);
//////                break;
//////            }
//////        }

//    if ((SecondLastOpc == VEX::GOTO) &&
//        (LastOpc == VEX::GOTO)) {
//      TBB = SecondLastInst->getOperand(0).getMBB();
//      LastInst->eraseFromParent();
//      return false;
//    }

//    if (LastOpc == VEX::BR) {
//      // Block ends with fall-through condbranch.
//      TBB = LastInst->getOperand(0).getMBB();
//      Cond.push_back(LastInst->getOperand(1));
//      Cond.push_back(LastInst->getOperand(2));
//      return false;
//    }

//    if ((SecondLastOpc == VEX::BR && LastOpc == VEX::GOTO)) {
//      TBB =  SecondLastInst->getOperand(0).getMBB();
//      Cond.push_back(SecondLastInst->getOperand(1));
//      Cond.push_back(SecondLastInst->getOperand(2));
//      FBB = LastInst->getOperand(0).getMBB();
//      return false;
//    }
}


// Used by the VLIW Scheduler
DFAPacketizer* VEXInstrInfo::CreateTargetScheduleState
(const TargetSubtargetInfo &STI) const{
    const InstrItineraryData *II = STI.getInstrItineraryData();
    DEBUG(errs() << "Creating the DFAPacketizer!\n");
    return static_cast<const VEXSubtarget &>(STI).createDFAPacketizer(II);
}

// CreateTargetPostRAHazardRecognizer - Return the postRA hazard recognizer
// to use for this target when scheduling the DAG.
//ScheduleHazardRecognizer *VEXInstrInfo::CreateTargetPostRAHazardRecognizer(const InstrItineraryData *II,
//                                                                            const ScheduleDAG *DAG) const {
//    
//    return new VEXHazardRecognizer(II, DAG, "PostRA");
//}
////
//// Default implementation of CreateTargetMIHazardRecognizer.
//ScheduleHazardRecognizer *VEXInstrInfo::CreateTargetMIHazardRecognizer( const InstrItineraryData *II,
//                                                                        const ScheduleDAG *DAG) const {
//    
//    return new VEXHazardRecognizer(II, DAG, "misched");
//}

//ScheduleHazardRecognizer *VEXInstrInfo::CreateTargetHazardRecognizer(const TargetSubtargetInfo *STI,
//                                                       const ScheduleDAG *DAG)  const {
//    const InstrItineraryData *II =
//        static_cast<const VEXSubtarget *>(STI)->getInstrItineraryData();
//    return new VEXHazardRecognizer(II, DAG, "SDNodes");
//}

/// CreateTargetPostRAHazardRecognizer - Return the postRA hazard recognizer
/// to use for this target when scheduling the DAG.
//ScheduleHazardRecognizer *
//VEXInstrInfo::CreateTargetPostRAHazardRecognizer(const TargetSubtargetInfo *STI,
//                                           const ScheduleDAG *DAG) const {
//    // Dummy hazard recognizer allows all instructions to issue.
//    const InstrItineraryData *II =
//        static_cast<const VEXSubtarget *>(STI)->getInstrItineraryData();
//    return new ScoreboardHazardRecognizer(II, DAG, "pre-RA-sched");
//}

