#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

namespace {
    struct ReplaceHelloName : public FunctionPass  {

        static char ID;
    
        ReplaceHelloName() : FunctionPass(ID) {}
    
        bool runOnFunction(Function &F) override{
        
            StringRef name = F.getName();
            
            if(name.find("hello")){
                errs() << "Has hello\n";
            }
            return false;
        }
    };
}

char ReplaceHelloName::ID = 0;

static RegisterPass<ReplaceHelloName> X("replaceHello",  "Replace Hello Pass", false, false);



