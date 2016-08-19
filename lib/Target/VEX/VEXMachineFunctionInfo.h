//===-- VEXMachineFunctionInfo.h - Private data used for VEX ----*- C++ -*-=//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file declares the VEX specific subclass of MachineFunctionInfo.
//
//===----------------------------------------------------------------------===//

#ifndef VEXMACHINEFUNCTION_H
#define VEXMACHINEFUNCTION_H

#include "llvm/ADT/StringMap.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineMemOperand.h"
#include "llvm/CodeGen/PseudoSourceValue.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/ValueMap.h"
#include "llvm/Target/TargetFrameLowering.h"
#include "llvm/Target/TargetMachine.h"
#include <map>
#include <string>
#include <utility>

#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

#define DEBUG_TYPE "vex-machinefunction"

namespace llvm {

struct FunctionInfo {
    std::multimap<std::string, unsigned> info;
};
    
    /// brief A class derived from PseudoSourceValue that represents a GOT entry
    /// resolved by lazy-binding.
    
    class VEXCallEntry : public PseudoSourceValue{
        
    public:
        explicit VEXCallEntry(const StringRef &N);
        explicit VEXCallEntry(const GlobalValue *V);
        bool isConstant(const MachineFrameInfo *) const override;
        bool isAliased(const MachineFrameInfo *) const override;
        bool mayAlias(const MachineFrameInfo *) const override;
        
    private:
        void printCustom(raw_ostream &O) const override;
#ifndef NDEBUG
        std::string Name;
        const GlobalValue *Val;
#endif
    };
    
    // VEXFunctionInfo - This class is derived from MachineFunction private
    // VEX target-specific information for each MachineFunction;
    class VEXFunctionInfo : public MachineFunctionInfo {
    public:
        VEXFunctionInfo (MachineFunction &MF)
        : MF(MF), VarArgsFrameIndex(0),
          MaxCallFrameSize(0), IsVarArgFunction(false),
          EmitNOAT(false),
            FunctionReturns(make_unique<FunctionInfo>()),
            FunctionArguments(make_unique<FunctionInfo>()),
            FunctionCalled(make_unique<FunctionInfo>()){
            DEBUG(errs() << "Machine Function");
        }
        ~VEXFunctionInfo();
        
        int getVarArgsFrameIndex() const {return VarArgsFrameIndex; }
        void setVarArgsFrameIndex(int index) { VarArgsFrameIndex = index; IsVarArgFunction = true;}
        bool isVarArgFunction() { return IsVarArgFunction; }
        
        bool getEmitNOAT() const { return EmitNOAT; }
        void setEmitNOAT() { EmitNOAT = true; }

        unsigned getSRetReturnReg() const { return SRetReturnReg; }
        void setSRetReturnReg(unsigned Reg) { SRetReturnReg = Reg; }

        FunctionInfo* getFunctionReturns() const {
            FunctionReturns.get();
        }

        FunctionInfo* getFunctionArguments() const {
            FunctionArguments.get();
        }

        FunctionInfo* getFunctionCalled() const {
            FunctionCalled.get();
        }

        void addFunctionArgument(std::string Function, unsigned numArguments, bool IsVarArg = false) {
            if (FunctionArguments->info.find(Function) == FunctionArguments->info.end() || IsVarArg)
                FunctionArguments->info.insert(std::pair<std::string, unsigned>(Function, numArguments));
        }

        void addFunctionCalled(std::string Function, unsigned numArguments, bool IsVarArg = false) {
            if (FunctionCalled->info.find(Function) == FunctionCalled->info.end() || IsVarArg)
                FunctionCalled->info.insert(std::pair<std::string, unsigned>(Function, numArguments));
        }

        void addFunctionReturn(std::string Function, unsigned numReturns) {
            if (FunctionReturns->info.find(Function) != FunctionReturns->info.end())
                assert(FunctionReturns->info.find(Function)->second == numReturns && "Number of returns do not match. Something is wrong");
            else
                FunctionReturns->info.insert(std::pair<std::string, unsigned>(Function, numReturns));
        }

    private:
        virtual void anchor();

        bool EmitNOAT;

        std::unique_ptr<FunctionInfo> FunctionReturns;
        std::unique_ptr<FunctionInfo> FunctionArguments;
        std::unique_ptr<FunctionInfo> FunctionCalled;

        MachineFunction& MF;
        
        // VarArgsFrameIndex - FrameIndex for start of varargs area.
        int VarArgsFrameIndex;
        bool IsVarArgFunction;
        
        unsigned MaxCallFrameSize;

        /// SRetReturnReg - Some subtargets require that sret lowering includes
        /// returning the value of the returned struct in a register. This field
        /// holds the virtual register into which the sret argument is passed.
        unsigned SRetReturnReg;
        
        // VEXCallEntry maps.
        StringMap<const VEXCallEntry *> ExternalCallEntries;
        ValueMap<const GlobalValue *, const VEXCallEntry *> GlobalCallEntries;
        
        
    };
    
}




#endif
