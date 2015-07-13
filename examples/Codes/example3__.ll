; ModuleID = 'example3.c'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

@a = global i32 1, align 4
@b = global i32 20, align 4
@c = global i8 97, align 4

; Function Attrs: nounwind readonly
define i32 @main() #0 {
entry:
  %0 = load i32, i32* @a, align 4, !tbaa !1
  %cmp = icmp eq i32 %0, 10
  %1 = load i32, i32* @b, align 4, !tbaa !1
  %2 = load i8, i8* @c, align 4, !tbaa !5
  %conv = sext i8 %2 to i32
  %3 = sub nsw i32 0, %conv
  %d.0.p = select i1 %cmp, i32 %conv, i32 %3
  %d.0 = add i32 %d.0.p, %1
  ret i32 %d.0
}

attributes #0 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!3, !3, i64 0}
