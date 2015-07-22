; ModuleID = 'ch6_1.cpp'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

@gStart = global i32 3, align 4
@gI = global i32 100, align 4
@global_a = global i32 100, align 4

; Function Attrs: nounwind
define i32 @_Z11test_globalv() #0 {
entry:
  %c = alloca i32, align 4
  store i32 0, i32* %c, align 4
  %0 = load i32, i32* @gI, align 4
  store i32 %0, i32* %c, align 4
  %1 = load i32, i32* %c, align 4
  ret i32 %1
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load i32, i32* @global_a, align 4
  %call = call i32 @_Z11test_globalv()
  %add = add nsw i32 %0, %call
  store i32 %add, i32* %a, align 4
  %1 = load i32, i32* %a, align 4
  ret i32 %1
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
