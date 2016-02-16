; ModuleID = 'inline.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

; Function Attrs: inlinehint nounwind
define void @__delay(i32 %loops) #0 {
entry:
  %loops.addr = alloca i32, align 4
  store i32 %loops, i32* %loops.addr, align 4
  %0 = load i32, i32* %loops.addr, align 4
  %1 = call i32 asm sideeffect "1:\0A\09c0\09 cmpeq \09$$b0.0 = $0, $$r0.0\0A;;\0A;;\0A\09c0\09 brf \09$$b0.0, 1b\0A\09c0\09 add \09$0 = $0, -1\0A;;\0A", "=&r,0,~{dirflag},~{fpsr},~{flags}"(i32 %0) #2, !srcloc !1
  store i32 %1, i32* %loops.addr, align 4
  ret void
}

; Function Attrs: nounwind
define i32 @main() #1 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @__delay(i32 1000)
  ret i32 0
}

attributes #0 = { inlinehint nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"}
!1 = !{i32 108, i32 113, i32 183, i32 223, i32 227, i32 283, i32 341}
