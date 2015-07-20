; ModuleID = 'function.c'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

@global_a = global i32 50, align 4
@global_b = global i32 100, align 4
@global_c = global i32 1000, align 4

; Function Attrs: nounwind readonly
define i32 @sum(i32 signext %a, i32 signext %b) #0 {
entry:
  %add = add nsw i32 %b, %a
  %0 = load i32, i32* @global_a, align 4, !tbaa !1
  %add1 = add nsw i32 %add, %0
  ret i32 %add1
}

; Function Attrs: nounwind readonly
define i32 @main() #0 {
entry:
  %0 = load i32, i32* @global_b, align 4, !tbaa !1
  %1 = load i32, i32* @global_c, align 4, !tbaa !1
  %2 = load i32, i32* @global_a, align 4, !tbaa !1
  %factor = mul i32 %2, 3
  %add1.i5 = add i32 %0, 30
  %add.i3 = add i32 %add1.i5, %1
  %add1.i4 = add i32 %add.i3, %factor
  ret i32 %add1.i4
}

attributes #0 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
