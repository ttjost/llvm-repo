; ModuleID = 'matrix_print.c'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

@a = global [10 x [10 x i32]] [[10 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 -1, i32 1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1]], align 4
@b = global [10 x [10 x i32]] [[10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 -1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 -1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 1]], align 4
@c = global [10 x [10 x i32]] zeroinitializer, align 4
@result = global [10 x [10 x i32]] [[10 x i32] [i32 8, i32 4, i32 4, i32 0, i32 2, i32 4, i32 2, i32 4, i32 6, i32 4], [10 x i32] [i32 6, i32 10, i32 10, i32 6, i32 8, i32 6, i32 8, i32 10, i32 8, i32 10], [10 x i32] [i32 6, i32 10, i32 10, i32 6, i32 8, i32 6, i32 8, i32 10, i32 8, i32 10], [10 x i32] [i32 6, i32 10, i32 10, i32 6, i32 8, i32 6, i32 8, i32 10, i32 8, i32 10], [10 x i32] [i32 2, i32 6, i32 6, i32 2, i32 8, i32 2, i32 4, i32 6, i32 4, i32 6], [10 x i32] [i32 4, i32 8, i32 8, i32 4, i32 6, i32 4, i32 6, i32 8, i32 6, i32 8], [10 x i32] [i32 4, i32 8, i32 8, i32 4, i32 6, i32 4, i32 6, i32 8, i32 6, i32 8], [10 x i32] [i32 4, i32 8, i32 8, i32 4, i32 6, i32 4, i32 6, i32 8, i32 6, i32 8], [10 x i32] [i32 6, i32 10, i32 10, i32 6, i32 8, i32 6, i32 8, i32 10, i32 8, i32 10], [10 x i32] [i32 6, i32 10, i32 10, i32 6, i32 8, i32 6, i32 8, i32 10, i32 8, i32 10]], align 4
@.str1 = private unnamed_addr constant [3 x i8] c"-1\00", align 1
@str = private unnamed_addr constant [4 x i8] c"666\00"

; Function Attrs: nounwind
define i32 @matrix_mul() #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc15, %entry
  %i.031 = phi i32 [ 0, %entry ], [ %inc16, %for.inc15 ]
  %arrayidx7 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @a, i32 0, i32 %i.031, i32 0
  %.pre = load i32, i32* %arrayidx7, align 4, !tbaa !1
  %arrayidx7.1.phi.trans.insert = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @a, i32 0, i32 %i.031, i32 1
  %.pre33 = load i32, i32* %arrayidx7.1.phi.trans.insert, align 4, !tbaa !1
  %arrayidx7.2.phi.trans.insert = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @a, i32 0, i32 %i.031, i32 2
  %.pre34 = load i32, i32* %arrayidx7.2.phi.trans.insert, align 4, !tbaa !1
  %arrayidx7.3.phi.trans.insert = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @a, i32 0, i32 %i.031, i32 3
  %.pre35 = load i32, i32* %arrayidx7.3.phi.trans.insert, align 4, !tbaa !1
  %arrayidx7.4.phi.trans.insert = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @a, i32 0, i32 %i.031, i32 4
  %.pre36 = load i32, i32* %arrayidx7.4.phi.trans.insert, align 4, !tbaa !1
  %arrayidx7.5.phi.trans.insert = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @a, i32 0, i32 %i.031, i32 5
  %.pre37 = load i32, i32* %arrayidx7.5.phi.trans.insert, align 4, !tbaa !1
  %arrayidx7.6.phi.trans.insert = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @a, i32 0, i32 %i.031, i32 6
  %.pre38 = load i32, i32* %arrayidx7.6.phi.trans.insert, align 4, !tbaa !1
  %arrayidx7.7.phi.trans.insert = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @a, i32 0, i32 %i.031, i32 7
  %.pre39 = load i32, i32* %arrayidx7.7.phi.trans.insert, align 4, !tbaa !1
  %arrayidx7.8.phi.trans.insert = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @a, i32 0, i32 %i.031, i32 8
  %.pre40 = load i32, i32* %arrayidx7.8.phi.trans.insert, align 4, !tbaa !1
  %arrayidx7.9.phi.trans.insert = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @a, i32 0, i32 %i.031, i32 9
  %.pre41 = load i32, i32* %arrayidx7.9.phi.trans.insert, align 4, !tbaa !1
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.cond4.preheader, %for.cond1.preheader
  %j.030 = phi i32 [ 0, %for.cond1.preheader ], [ %inc13, %for.cond4.preheader ]
  %arrayidx9 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @b, i32 0, i32 0, i32 %j.030
  %0 = load i32, i32* %arrayidx9, align 4, !tbaa !1
  %mul = mul nsw i32 %0, %.pre
  %arrayidx9.1 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @b, i32 0, i32 1, i32 %j.030
  %1 = load i32, i32* %arrayidx9.1, align 4, !tbaa !1
  %mul.1 = mul nsw i32 %1, %.pre33
  %add.1 = add nsw i32 %mul.1, %mul
  %arrayidx9.2 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @b, i32 0, i32 2, i32 %j.030
  %2 = load i32, i32* %arrayidx9.2, align 4, !tbaa !1
  %mul.2 = mul nsw i32 %2, %.pre34
  %add.2 = add nsw i32 %mul.2, %add.1
  %arrayidx9.3 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @b, i32 0, i32 3, i32 %j.030
  %3 = load i32, i32* %arrayidx9.3, align 4, !tbaa !1
  %mul.3 = mul nsw i32 %3, %.pre35
  %add.3 = add nsw i32 %mul.3, %add.2
  %arrayidx9.4 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @b, i32 0, i32 4, i32 %j.030
  %4 = load i32, i32* %arrayidx9.4, align 4, !tbaa !1
  %mul.4 = mul nsw i32 %4, %.pre36
  %add.4 = add nsw i32 %mul.4, %add.3
  %arrayidx9.5 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @b, i32 0, i32 5, i32 %j.030
  %5 = load i32, i32* %arrayidx9.5, align 4, !tbaa !1
  %mul.5 = mul nsw i32 %5, %.pre37
  %add.5 = add nsw i32 %mul.5, %add.4
  %arrayidx9.6 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @b, i32 0, i32 6, i32 %j.030
  %6 = load i32, i32* %arrayidx9.6, align 4, !tbaa !1
  %mul.6 = mul nsw i32 %6, %.pre38
  %add.6 = add nsw i32 %mul.6, %add.5
  %arrayidx9.7 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @b, i32 0, i32 7, i32 %j.030
  %7 = load i32, i32* %arrayidx9.7, align 4, !tbaa !1
  %mul.7 = mul nsw i32 %7, %.pre39
  %add.7 = add nsw i32 %mul.7, %add.6
  %arrayidx9.8 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @b, i32 0, i32 8, i32 %j.030
  %8 = load i32, i32* %arrayidx9.8, align 4, !tbaa !1
  %mul.8 = mul nsw i32 %8, %.pre40
  %add.8 = add nsw i32 %mul.8, %add.7
  %arrayidx9.9 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @b, i32 0, i32 9, i32 %j.030
  %9 = load i32, i32* %arrayidx9.9, align 4, !tbaa !1
  %mul.9 = mul nsw i32 %9, %.pre41
  %add.9 = add nsw i32 %mul.9, %add.8
  %arrayidx11 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @c, i32 0, i32 %i.031, i32 %j.030
  store i32 %add.9, i32* %arrayidx11, align 4, !tbaa !1
  %inc13 = add nuw nsw i32 %j.030, 1
  %exitcond = icmp eq i32 %inc13, 10
  br i1 %exitcond, label %for.inc15, label %for.cond4.preheader

for.inc15:                                        ; preds = %for.cond4.preheader
  %inc16 = add nuw nsw i32 %i.031, 1
  %exitcond32 = icmp eq i32 %inc16, 10
  br i1 %exitcond32, label %for.end17, label %for.cond1.preheader

for.end17:                                        ; preds = %for.inc15
  ret i32 0
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %i.029 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %call = tail call i32 @matrix_mul()
  %inc = add nuw nsw i32 %i.029, 1
  %exitcond = icmp eq i32 %inc, 1000
  br i1 %exitcond, label %for.cond4.preheader.preheader, label %for.body

for.cond4.preheader.preheader:                    ; preds = %for.body
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.cond4.9
  %i.128 = phi i32 [ %inc16, %for.cond4.9 ], [ 0, %for.cond4.preheader.preheader ]
  %arrayidx7 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @c, i32 0, i32 %i.128, i32 0
  %0 = load i32, i32* %arrayidx7, align 4, !tbaa !1
  %arrayidx9 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @result, i32 0, i32 %i.128, i32 0
  %1 = load i32, i32* %arrayidx9, align 4, !tbaa !1
  %cmp10 = icmp eq i32 %0, %1
  br i1 %cmp10, label %for.cond4, label %if.then

for.cond4:                                        ; preds = %for.cond4.preheader
  %arrayidx7.1 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @c, i32 0, i32 %i.128, i32 1
  %2 = load i32, i32* %arrayidx7.1, align 4, !tbaa !1
  %arrayidx9.1 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @result, i32 0, i32 %i.128, i32 1
  %3 = load i32, i32* %arrayidx9.1, align 4, !tbaa !1
  %cmp10.1 = icmp eq i32 %2, %3
  br i1 %cmp10.1, label %for.cond4.1, label %if.then

if.then:                                          ; preds = %for.cond4.8, %for.cond4.7, %for.cond4.6, %for.cond4.5, %for.cond4.4, %for.cond4.3, %for.cond4.2, %for.cond4.1, %for.cond4, %for.cond4.preheader
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0))
  br label %return

for.end17:                                        ; preds = %for.cond4.9
  %call18 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str1, i32 0, i32 0)) #1
  br label %return

return:                                           ; preds = %for.end17, %if.then
  %retval.0 = phi i32 [ 666, %if.then ], [ -1, %for.end17 ]
  ret i32 %retval.0

for.cond4.1:                                      ; preds = %for.cond4
  %arrayidx7.2 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @c, i32 0, i32 %i.128, i32 2
  %4 = load i32, i32* %arrayidx7.2, align 4, !tbaa !1
  %arrayidx9.2 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @result, i32 0, i32 %i.128, i32 2
  %5 = load i32, i32* %arrayidx9.2, align 4, !tbaa !1
  %cmp10.2 = icmp eq i32 %4, %5
  br i1 %cmp10.2, label %for.cond4.2, label %if.then

for.cond4.2:                                      ; preds = %for.cond4.1
  %arrayidx7.3 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @c, i32 0, i32 %i.128, i32 3
  %6 = load i32, i32* %arrayidx7.3, align 4, !tbaa !1
  %arrayidx9.3 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @result, i32 0, i32 %i.128, i32 3
  %7 = load i32, i32* %arrayidx9.3, align 4, !tbaa !1
  %cmp10.3 = icmp eq i32 %6, %7
  br i1 %cmp10.3, label %for.cond4.3, label %if.then

for.cond4.3:                                      ; preds = %for.cond4.2
  %arrayidx7.4 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @c, i32 0, i32 %i.128, i32 4
  %8 = load i32, i32* %arrayidx7.4, align 4, !tbaa !1
  %arrayidx9.4 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @result, i32 0, i32 %i.128, i32 4
  %9 = load i32, i32* %arrayidx9.4, align 4, !tbaa !1
  %cmp10.4 = icmp eq i32 %8, %9
  br i1 %cmp10.4, label %for.cond4.4, label %if.then

for.cond4.4:                                      ; preds = %for.cond4.3
  %arrayidx7.5 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @c, i32 0, i32 %i.128, i32 5
  %10 = load i32, i32* %arrayidx7.5, align 4, !tbaa !1
  %arrayidx9.5 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @result, i32 0, i32 %i.128, i32 5
  %11 = load i32, i32* %arrayidx9.5, align 4, !tbaa !1
  %cmp10.5 = icmp eq i32 %10, %11
  br i1 %cmp10.5, label %for.cond4.5, label %if.then

for.cond4.5:                                      ; preds = %for.cond4.4
  %arrayidx7.6 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @c, i32 0, i32 %i.128, i32 6
  %12 = load i32, i32* %arrayidx7.6, align 4, !tbaa !1
  %arrayidx9.6 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @result, i32 0, i32 %i.128, i32 6
  %13 = load i32, i32* %arrayidx9.6, align 4, !tbaa !1
  %cmp10.6 = icmp eq i32 %12, %13
  br i1 %cmp10.6, label %for.cond4.6, label %if.then

for.cond4.6:                                      ; preds = %for.cond4.5
  %arrayidx7.7 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @c, i32 0, i32 %i.128, i32 7
  %14 = load i32, i32* %arrayidx7.7, align 4, !tbaa !1
  %arrayidx9.7 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @result, i32 0, i32 %i.128, i32 7
  %15 = load i32, i32* %arrayidx9.7, align 4, !tbaa !1
  %cmp10.7 = icmp eq i32 %14, %15
  br i1 %cmp10.7, label %for.cond4.7, label %if.then

for.cond4.7:                                      ; preds = %for.cond4.6
  %arrayidx7.8 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @c, i32 0, i32 %i.128, i32 8
  %16 = load i32, i32* %arrayidx7.8, align 4, !tbaa !1
  %arrayidx9.8 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @result, i32 0, i32 %i.128, i32 8
  %17 = load i32, i32* %arrayidx9.8, align 4, !tbaa !1
  %cmp10.8 = icmp eq i32 %16, %17
  br i1 %cmp10.8, label %for.cond4.8, label %if.then

for.cond4.8:                                      ; preds = %for.cond4.7
  %arrayidx7.9 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @c, i32 0, i32 %i.128, i32 9
  %18 = load i32, i32* %arrayidx7.9, align 4, !tbaa !1
  %arrayidx9.9 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* @result, i32 0, i32 %i.128, i32 9
  %19 = load i32, i32* %arrayidx9.9, align 4, !tbaa !1
  %cmp10.9 = icmp eq i32 %18, %19
  br i1 %cmp10.9, label %for.cond4.9, label %if.then

for.cond4.9:                                      ; preds = %for.cond4.8
  %inc16 = add nuw nsw i32 %i.128, 1
  %cmp2 = icmp slt i32 %inc16, 10
  br i1 %cmp2, label %for.cond4.preheader, label %for.end17
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #0

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}