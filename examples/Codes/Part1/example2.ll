; ModuleID = 'example2.c'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 1, i32* %a, align 4
  %0 = load i32, i32* %a, align 4
  %add = add nsw i32 %0, 100
  store i32 %add, i32* %b, align 4
  %1 = load i32, i32* %b, align 4
  %2 = load i32, i32* %a, align 4
  %sub = sub nsw i32 %1, %2
  %add1 = add nsw i32 %sub, 1000
  store i32 %add1, i32* %c, align 4
  %3 = load i32, i32* %a, align 4
  %4 = load i32, i32* %b, align 4
  %add2 = add nsw i32 %3, %4
  %5 = load i32, i32* %c, align 4
  %add3 = add nsw i32 %add2, %5
  store i32 %add3, i32* %d, align 4
  %6 = load i32, i32* %d, align 4
  ret i32 %6
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
