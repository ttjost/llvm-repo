; ModuleID = 'ch9_incoming.cpp'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

; Function Attrs: nounwind
define i32 @_Z5sum_iiii(i32 signext %x1, i32 signext %x2, i32 signext %x3) #0 {
entry:
  %x1.addr = alloca i32, align 4
  %x2.addr = alloca i32, align 4
  %x3.addr = alloca i32, align 4
  %sum = alloca i32, align 4
  store i32 %x1, i32* %x1.addr, align 4
  store i32 %x2, i32* %x2.addr, align 4
  store i32 %x3, i32* %x3.addr, align 4
  %0 = load i32, i32* %x1.addr, align 4
  %1 = load i32, i32* %x2.addr, align 4
  %add = add nsw i32 %0, %1
  %2 = load i32, i32* %x3.addr, align 4
  %add1 = add nsw i32 %add, %2
  store i32 %add1, i32* %sum, align 4
  %3 = load i32, i32* %sum, align 4
  ret i32 %3
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @_Z5sum_iiii(i32 signext 10, i32 signext 20, i32 signext 25)
  ret i32 %call
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
