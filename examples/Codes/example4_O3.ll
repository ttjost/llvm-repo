; ModuleID = '/home/jost/llvm_build/llvm/examples/Codes/example4.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global i32 1, align 4
@b = global i32 20, align 4
@c = global i8 97, align 1

; Function Attrs: nounwind readonly uwtable
define i32 @main() #0 {
entry:
  %0 = load i32, i32* @a, align 4, !tbaa !1
  %cmp = icmp eq i32 %0, 10
  %1 = load i32, i32* @b, align 4, !tbaa !1
  br i1 %cmp, label %if.then, label %return

if.then:                                          ; preds = %entry
  %2 = load i8, i8* @c, align 1, !tbaa !5
  %conv = sext i8 %2 to i32
  %add = add nsw i32 %conv, %1
  br label %return

return:                                           ; preds = %entry, %if.then
  %retval.0 = phi i32 [ %add, %if.then ], [ %1, %entry ]
  ret i32 %retval.0
}

attributes #0 = { nounwind readonly uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!3, !3, i64 0}
