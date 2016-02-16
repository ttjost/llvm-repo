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
  %arrayidx7 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @a, i32 0, i32 %i.029, i32 0
  %.pre = load i32, i32* %arrayidx7, align 4, !tbaa !1
  %arrayidx7.1.phi.trans.insert = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @a, i32 0, i32 %i.029, i32 1
  %.pre31 = load i32, i32* %arrayidx7.1.phi.trans.insert, align 4, !tbaa !1
  %arrayidx7.2.phi.trans.insert = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @a, i32 0, i32 %i.029, i32 2
  %.pre32 = load i32, i32* %arrayidx7.2.phi.trans.insert, align 4, !tbaa !1
  %arrayidx7.3.phi.trans.insert = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @a, i32 0, i32 %i.029, i32 3
  %.pre33 = load i32, i32* %arrayidx7.3.phi.trans.insert, align 4, !tbaa !1
  %arrayidx7.4.phi.trans.insert = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @a, i32 0, i32 %i.029, i32 4
  %.pre34 = load i32, i32* %arrayidx7.4.phi.trans.insert, align 4, !tbaa !1
  %arrayidx7.5.phi.trans.insert = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @a, i32 0, i32 %i.029, i32 5
  %.pre35 = load i32, i32* %arrayidx7.5.phi.trans.insert, align 4, !tbaa !1
  %arrayidx7.6.phi.trans.insert = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @a, i32 0, i32 %i.029, i32 6
  %.pre36 = load i32, i32* %arrayidx7.6.phi.trans.insert, align 4, !tbaa !1
  %arrayidx7.7.phi.trans.insert = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @a, i32 0, i32 %i.029, i32 7
  %.pre37 = load i32, i32* %arrayidx7.7.phi.trans.insert, align 4, !tbaa !1
  %arrayidx7.8.phi.trans.insert = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @a, i32 0, i32 %i.029, i32 8
  %.pre38 = load i32, i32* %arrayidx7.8.phi.trans.insert, align 4, !tbaa !1
  %arrayidx7.9.phi.trans.insert = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @a, i32 0, i32 %i.029, i32 9
  %.pre39 = load i32, i32* %arrayidx7.9.phi.trans.insert, align 4, !tbaa !1
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.cond4.preheader, %for.cond1.preheader
  %j.028 = phi i32 [ 0, %for.cond1.preheader ], [ %inc13, %for.cond4.preheader ]
  %arrayidx11 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @c, i32 0, i32 %i.029, i32 %j.028
  %arrayidx11.promoted = load i32, i32* %arrayidx11, align 4, !tbaa !1
  %arrayidx9 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @b, i32 0, i32 0, i32 %j.028
  %0 = load i32, i32* %arrayidx9, align 4, !tbaa !1
  %mul = mul nsw i32 %0, %.pre
  %add = add nsw i32 %arrayidx11.promoted, %mul
  %arrayidx9.1 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @b, i32 0, i32 1, i32 %j.028
  %1 = load i32, i32* %arrayidx9.1, align 4, !tbaa !1
  %mul.1 = mul nsw i32 %1, %.pre31
  %add.1 = add nsw i32 %add, %mul.1
  %arrayidx9.2 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @b, i32 0, i32 2, i32 %j.028
  %2 = load i32, i32* %arrayidx9.2, align 4, !tbaa !1
  %mul.2 = mul nsw i32 %2, %.pre32
  %add.2 = add nsw i32 %add.1, %mul.2
  %arrayidx9.3 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @b, i32 0, i32 3, i32 %j.028
  %3 = load i32, i32* %arrayidx9.3, align 4, !tbaa !1
  %mul.3 = mul nsw i32 %3, %.pre33
  %add.3 = add nsw i32 %add.2, %mul.3
  %arrayidx9.4 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @b, i32 0, i32 4, i32 %j.028
  %4 = load i32, i32* %arrayidx9.4, align 4, !tbaa !1
  %mul.4 = mul nsw i32 %4, %.pre34
  %add.4 = add nsw i32 %add.3, %mul.4
  %arrayidx9.5 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @b, i32 0, i32 5, i32 %j.028
  %5 = load i32, i32* %arrayidx9.5, align 4, !tbaa !1
  %mul.5 = mul nsw i32 %5, %.pre35
  %add.5 = add nsw i32 %add.4, %mul.5
  %arrayidx9.6 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @b, i32 0, i32 6, i32 %j.028
  %6 = load i32, i32* %arrayidx9.6, align 4, !tbaa !1
  %mul.6 = mul nsw i32 %6, %.pre36
  %add.6 = add nsw i32 %add.5, %mul.6
  %arrayidx9.7 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @b, i32 0, i32 7, i32 %j.028
  %7 = load i32, i32* %arrayidx9.7, align 4, !tbaa !1
  %mul.7 = mul nsw i32 %7, %.pre37
  %add.7 = add nsw i32 %add.6, %mul.7
  %arrayidx9.8 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @b, i32 0, i32 8, i32 %j.028
  %8 = load i32, i32* %arrayidx9.8, align 4, !tbaa !1
  %mul.8 = mul nsw i32 %8, %.pre38
  %add.8 = add nsw i32 %add.7, %mul.8
  %arrayidx9.9 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @b, i32 0, i32 9, i32 %j.028
  %9 = load i32, i32* %arrayidx9.9, align 4, !tbaa !1
  %mul.9 = mul nsw i32 %9, %.pre39
  %add.9 = add nsw i32 %add.8, %mul.9
  store i32 %add.9, i32* %arrayidx11, align 4, !tbaa !1
  %inc13 = add nuw nsw i32 %j.028, 1
  %exitcond = icmp eq i32 %inc13, 10
  br i1 %exitcond, label %for.inc15, label %for.cond4.preheader

for.inc15:                                        ; preds = %for.cond4.preheader
  %inc16 = add nuw nsw i32 %i.029, 1
  %exitcond30 = icmp eq i32 %inc16, 10
  br i1 %exitcond30, label %for.end17, label %for.cond1.preheader

for.end17:                                        ; preds = %for.inc15
  ret i32 0
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %call = tail call i32 @matrix_mul()
  ret i32 0
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
