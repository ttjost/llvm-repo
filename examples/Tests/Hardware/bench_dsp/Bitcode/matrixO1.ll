; ModuleID = 'matrix.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@a = global [10 x [10 x i32]] [[10 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 -1, i32 1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1]], align 4
@b = global [10 x [10 x i32]] [[10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 -1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 -1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 1]], align 4
@c = global [10 x [10 x i32]] zeroinitializer, align 4
@result = global [10 x [10 x i32]] [[10 x i32] [i32 8, i32 4, i32 4, i32 0, i32 2, i32 4, i32 2, i32 4, i32 6, i32 4], [10 x i32] [i32 6, i32 10, i32 10, i32 6, i32 8, i32 6, i32 8, i32 10, i32 8, i32 10], [10 x i32] [i32 6, i32 10, i32 10, i32 6, i32 8, i32 6, i32 8, i32 10, i32 8, i32 10], [10 x i32] [i32 6, i32 10, i32 10, i32 6, i32 8, i32 6, i32 8, i32 10, i32 8, i32 10], [10 x i32] [i32 2, i32 6, i32 6, i32 2, i32 8, i32 2, i32 4, i32 6, i32 4, i32 6], [10 x i32] [i32 4, i32 8, i32 8, i32 4, i32 6, i32 4, i32 6, i32 8, i32 6, i32 8], [10 x i32] [i32 4, i32 8, i32 8, i32 4, i32 6, i32 4, i32 6, i32 8, i32 6, i32 8], [10 x i32] [i32 4, i32 8, i32 8, i32 4, i32 6, i32 4, i32 6, i32 8, i32 6, i32 8], [10 x i32] [i32 6, i32 10, i32 10, i32 6, i32 8, i32 6, i32 8, i32 10, i32 8, i32 10], [10 x i32] [i32 6, i32 10, i32 10, i32 6, i32 8, i32 6, i32 8, i32 10, i32 8, i32 10]], align 4

; Function Attrs: nounwind
define i32 @matrix_mul() #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc15, %entry
  %i.029 = phi i32 [ 0, %entry ], [ %inc16, %for.inc15 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc12, %for.cond1.preheader
  %j.028 = phi i32 [ 0, %for.cond1.preheader ], [ %inc13, %for.inc12 ]
  %arrayidx11 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @c, i32 0, i32 %i.029, i32 %j.028
  %arrayidx11.promoted = load i32, i32* %arrayidx11, align 4, !tbaa !1
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.cond4.preheader
  %0 = phi i32 [ %arrayidx11.promoted, %for.cond4.preheader ], [ %add, %for.body6 ]
  %k.027 = phi i32 [ 0, %for.cond4.preheader ], [ %inc, %for.body6 ]
  %arrayidx7 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @a, i32 0, i32 %i.029, i32 %k.027
  %1 = load i32, i32* %arrayidx7, align 4, !tbaa !1
  %arrayidx9 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @b, i32 0, i32 %k.027, i32 %j.028
  %2 = load i32, i32* %arrayidx9, align 4, !tbaa !1
  %mul = mul nsw i32 %2, %1
  %add = add nsw i32 %0, %mul
  %inc = add nuw nsw i32 %k.027, 1
  %exitcond = icmp eq i32 %inc, 10
  br i1 %exitcond, label %for.inc12, label %for.body6

for.inc12:                                        ; preds = %for.body6
  store i32 %add, i32* %arrayidx11, align 4, !tbaa !1
  %inc13 = add nuw nsw i32 %j.028, 1
  %exitcond30 = icmp eq i32 %inc13, 10
  br i1 %exitcond30, label %for.inc15, label %for.cond4.preheader

for.inc15:                                        ; preds = %for.inc12
  %inc16 = add nuw nsw i32 %i.029, 1
  %exitcond31 = icmp eq i32 %inc16, 10
  br i1 %exitcond31, label %for.end17, label %for.cond1.preheader

for.end17:                                        ; preds = %for.inc15
  ret i32 0
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %call = tail call i32 @matrix_mul()
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc8
  %i.019 = phi i32 [ 0, %entry ], [ %inc9, %for.inc8 ]
  br label %for.body3

for.cond1:                                        ; preds = %for.body3
  %cmp2 = icmp slt i32 %inc, 10
  br i1 %cmp2, label %for.body3, label %for.inc8

for.body3:                                        ; preds = %for.cond1.preheader, %for.cond1
  %j.018 = phi i32 [ 0, %for.cond1.preheader ], [ %inc, %for.cond1 ]
  %arrayidx4 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @c, i32 0, i32 %i.019, i32 %j.018
  %0 = load i32, i32* %arrayidx4, align 4, !tbaa !1
  %arrayidx6 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @result, i32 0, i32 %i.019, i32 %j.018
  %1 = load i32, i32* %arrayidx6, align 4, !tbaa !1
  %cmp7 = icmp eq i32 %0, %1
  %inc = add nuw nsw i32 %j.018, 1
  br i1 %cmp7, label %for.cond1, label %return

for.inc8:                                         ; preds = %for.cond1
  %inc9 = add nuw nsw i32 %i.019, 1
  %cmp = icmp slt i32 %inc9, 10
  br i1 %cmp, label %for.cond1.preheader, label %return

return:                                           ; preds = %for.inc8, %for.body3
  %retval.0 = phi i32 [ 1, %for.body3 ], [ -1, %for.inc8 ]
  ret i32 %retval.0
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
