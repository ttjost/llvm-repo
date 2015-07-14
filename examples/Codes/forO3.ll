; ModuleID = 'for.c'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

@a = common global [100 x i32] zeroinitializer, align 4
@b = common global [100 x i32] zeroinitializer, align 4

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %i.021 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* @a, i32 0, i32 %i.021
  store i32 %i.021, i32* %arrayidx, align 4, !tbaa !1
  %sub = sub nuw nsw i32 100, %i.021
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* @b, i32 0, i32 %i.021
  store i32 %sub, i32* %arrayidx1, align 4, !tbaa !1
  %inc = add nuw nsw i32 %i.021, 1
  %exitcond = icmp eq i32 %inc, 100
  br i1 %exitcond, label %for.body4.preheader, label %for.body

for.body4.preheader:                              ; preds = %for.body
  br label %for.body4

for.cond2:                                        ; preds = %for.body4
  %cmp3 = icmp slt i32 %inc9, 100
  br i1 %cmp3, label %for.body4, label %return

for.body4:                                        ; preds = %for.body4.preheader, %for.cond2
  %i.120 = phi i32 [ %inc9, %for.cond2 ], [ 0, %for.body4.preheader ]
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* @a, i32 0, i32 %i.120
  %0 = load i32, i32* %arrayidx5, align 4, !tbaa !1
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* @b, i32 0, i32 %i.120
  %1 = load i32, i32* %arrayidx6, align 4, !tbaa !1
  %cmp7 = icmp eq i32 %0, %1
  %inc9 = add nuw nsw i32 %i.120, 1
  br i1 %cmp7, label %return, label %for.cond2

return:                                           ; preds = %for.cond2, %for.body4
  %retval.0 = phi i32 [ 3, %for.body4 ], [ 1, %for.cond2 ]
  ret i32 %retval.0
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
