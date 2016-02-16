; ModuleID = 'matrix_print.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@a = global [10 x [10 x i32]] [[10 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 -1, i32 1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1]], align 4
@b = global [10 x [10 x i32]] [[10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 -1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 -1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 1]], align 4
@c = global [10 x [10 x i32]] zeroinitializer, align 4
@result = global [10 x [10 x i32]] [[10 x i32] [i32 8, i32 4, i32 4, i32 0, i32 2, i32 4, i32 2, i32 4, i32 6, i32 4], [10 x i32] [i32 6, i32 10, i32 10, i32 6, i32 8, i32 6, i32 8, i32 10, i32 8, i32 10], [10 x i32] [i32 6, i32 10, i32 10, i32 6, i32 8, i32 6, i32 8, i32 10, i32 8, i32 10], [10 x i32] [i32 6, i32 10, i32 10, i32 6, i32 8, i32 6, i32 8, i32 10, i32 8, i32 10], [10 x i32] [i32 2, i32 6, i32 6, i32 2, i32 8, i32 2, i32 4, i32 6, i32 4, i32 6], [10 x i32] [i32 4, i32 8, i32 8, i32 4, i32 6, i32 4, i32 6, i32 8, i32 6, i32 8], [10 x i32] [i32 4, i32 8, i32 8, i32 4, i32 6, i32 4, i32 6, i32 8, i32 6, i32 8], [10 x i32] [i32 4, i32 8, i32 8, i32 4, i32 6, i32 4, i32 6, i32 8, i32 6, i32 8], [10 x i32] [i32 6, i32 10, i32 10, i32 6, i32 8, i32 6, i32 8, i32 10, i32 8, i32 10], [10 x i32] [i32 6, i32 10, i32 10, i32 6, i32 8, i32 6, i32 8, i32 10, i32 8, i32 10]], align 4
@str = private unnamed_addr constant [3 x i8] c"-1\00"
@str2 = private unnamed_addr constant [4 x i8] c"666\00"

; Function Attrs: nounwind
define i32 @matrix_mul() #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc15, %entry
  %i.031 = phi i32 [ 0, %entry ], [ %inc16, %for.inc15 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.end, %for.cond1.preheader
  %j.030 = phi i32 [ 0, %for.cond1.preheader ], [ %inc13, %for.end ]
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.cond4.preheader
  %var.029 = phi i32 [ 0, %for.cond4.preheader ], [ %add, %for.body6 ]
  %k.028 = phi i32 [ 0, %for.cond4.preheader ], [ %inc, %for.body6 ]
  %arrayidx7 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @a, i32 0, i32 %i.031, i32 %k.028
  %0 = load i32, i32* %arrayidx7, align 4, !tbaa !1
  %arrayidx9 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @b, i32 0, i32 %k.028, i32 %j.030
  %1 = load i32, i32* %arrayidx9, align 4, !tbaa !1
  %mul = mul nsw i32 %1, %0
  %add = add nsw i32 %mul, %var.029
  %inc = add nuw nsw i32 %k.028, 1
  %exitcond = icmp eq i32 %inc, 10
  br i1 %exitcond, label %for.end, label %for.body6

for.end:                                          ; preds = %for.body6
  %arrayidx11 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @c, i32 0, i32 %i.031, i32 %j.030
  store i32 %add, i32* %arrayidx11, align 4, !tbaa !1
  %inc13 = add nuw nsw i32 %j.030, 1
  %exitcond32 = icmp eq i32 %inc13, 10
  br i1 %exitcond32, label %for.inc15, label %for.cond4.preheader

for.inc15:                                        ; preds = %for.end
  %inc16 = add nuw nsw i32 %i.031, 1
  %exitcond33 = icmp eq i32 %inc16, 10
  br i1 %exitcond33, label %for.end17, label %for.cond1.preheader

for.end17:                                        ; preds = %for.inc15
  ret i32 0
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  br label %for.cond1.preheader.i.preheader

for.cond1.preheader.i.preheader:                  ; preds = %matrix_mul.exit, %entry
  %i.030 = phi i32 [ 0, %entry ], [ %inc, %matrix_mul.exit ]
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.cond1.preheader.i.preheader, %for.inc15.i
  %i.031.i = phi i32 [ %inc16.i, %for.inc15.i ], [ 0, %for.cond1.preheader.i.preheader ]
  br label %for.cond4.preheader.i

for.cond4.preheader.i:                            ; preds = %for.end.i, %for.cond1.preheader.i
  %j.030.i = phi i32 [ 0, %for.cond1.preheader.i ], [ %inc13.i, %for.end.i ]
  br label %for.body6.i

for.body6.i:                                      ; preds = %for.body6.i, %for.cond4.preheader.i
  %var.029.i = phi i32 [ 0, %for.cond4.preheader.i ], [ %add.i, %for.body6.i ]
  %k.028.i = phi i32 [ 0, %for.cond4.preheader.i ], [ %inc.i, %for.body6.i ]
  %arrayidx7.i = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @a, i32 0, i32 %i.031.i, i32 %k.028.i
  %0 = load i32, i32* %arrayidx7.i, align 4, !tbaa !1
  %arrayidx9.i = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @b, i32 0, i32 %k.028.i, i32 %j.030.i
  %1 = load i32, i32* %arrayidx9.i, align 4, !tbaa !1
  %mul.i = mul nsw i32 %1, %0
  %add.i = add nsw i32 %mul.i, %var.029.i
  %inc.i = add nuw nsw i32 %k.028.i, 1
  %exitcond.i = icmp eq i32 %inc.i, 10
  br i1 %exitcond.i, label %for.end.i, label %for.body6.i

for.end.i:                                        ; preds = %for.body6.i
  %arrayidx11.i = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @c, i32 0, i32 %i.031.i, i32 %j.030.i
  store i32 %add.i, i32* %arrayidx11.i, align 4, !tbaa !1
  %inc13.i = add nuw nsw i32 %j.030.i, 1
  %exitcond32.i = icmp eq i32 %inc13.i, 10
  br i1 %exitcond32.i, label %for.inc15.i, label %for.cond4.preheader.i

for.inc15.i:                                      ; preds = %for.end.i
  %inc16.i = add nuw nsw i32 %i.031.i, 1
  %exitcond33.i = icmp eq i32 %inc16.i, 10
  br i1 %exitcond33.i, label %matrix_mul.exit, label %for.cond1.preheader.i

matrix_mul.exit:                                  ; preds = %for.inc15.i
  %inc = add nuw nsw i32 %i.030, 1
  %exitcond = icmp eq i32 %inc, 1000
  br i1 %exitcond, label %for.cond4.preheader, label %for.cond1.preheader.i.preheader

for.cond4.preheader:                              ; preds = %matrix_mul.exit, %for.inc15
  %i.129 = phi i32 [ %inc16, %for.inc15 ], [ 0, %matrix_mul.exit ]
  br label %for.body6

for.cond4:                                        ; preds = %for.body6
  %cmp5 = icmp slt i32 %inc13, 10
  br i1 %cmp5, label %for.body6, label %for.inc15

for.body6:                                        ; preds = %for.cond4.preheader, %for.cond4
  %j.028 = phi i32 [ 0, %for.cond4.preheader ], [ %inc13, %for.cond4 ]
  %arrayidx7 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @c, i32 0, i32 %i.129, i32 %j.028
  %2 = load i32, i32* %arrayidx7, align 4, !tbaa !1
  %arrayidx9 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @result, i32 0, i32 %i.129, i32 %j.028
  %3 = load i32, i32* %arrayidx9, align 4, !tbaa !1
  %cmp10 = icmp eq i32 %2, %3
  %inc13 = add nuw nsw i32 %j.028, 1
  br i1 %cmp10, label %for.cond4, label %if.then

if.then:                                          ; preds = %for.body6
  %puts27 = tail call i32 @puts(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str2, i32 0, i32 0))
  br label %return

for.inc15:                                        ; preds = %for.cond4
  %inc16 = add nuw nsw i32 %i.129, 1
  %cmp2 = icmp slt i32 %inc16, 10
  br i1 %cmp2, label %for.cond4.preheader, label %for.end17

for.end17:                                        ; preds = %for.inc15
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str, i32 0, i32 0))
  br label %return

return:                                           ; preds = %for.end17, %if.then
  %retval.0 = phi i32 [ 666, %if.then ], [ -1, %for.end17 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
