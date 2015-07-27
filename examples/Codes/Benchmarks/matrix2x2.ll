; ModuleID = 'matrix2x2.c'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

@a = global [2 x [2 x i32]] [[2 x i32] [i32 0, i32 -1], [2 x i32] [i32 -1, i32 -1]], align 4
@b = global [2 x [2 x i32]] [[2 x i32] [i32 1, i32 1], [2 x i32] [i32 -1, i32 1]], align 4
@c = global [2 x [2 x i32]] zeroinitializer, align 4
@result = global [2 x [2 x i32]] [[2 x i32] [i32 1, i32 -1], [2 x i32] [i32 0, i32 -2]], align 4

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %var = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc15, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 2
  br i1 %cmp, label %for.body, label %for.end17

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc12, %for.body
  %1 = load i32, i32* %j, align 4
  %cmp2 = icmp slt i32 %1, 2
  br i1 %cmp2, label %for.body3, label %for.end14

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %var, align 4
  store i32 0, i32* %k, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body3
  %2 = load i32, i32* %k, align 4
  %cmp5 = icmp slt i32 %2, 2
  br i1 %cmp5, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond4
  %3 = load i32, i32* %k, align 4
  %4 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* @a, i32 0, i32 %4
  %arrayidx7 = getelementptr inbounds [2 x i32], [2 x i32]* %arrayidx, i32 0, i32 %3
  %5 = load i32, i32* %arrayidx7, align 4
  %6 = load i32, i32* %j, align 4
  %7 = load i32, i32* %k, align 4
  %arrayidx8 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* @b, i32 0, i32 %7
  %arrayidx9 = getelementptr inbounds [2 x i32], [2 x i32]* %arrayidx8, i32 0, i32 %6
  %8 = load i32, i32* %arrayidx9, align 4
  %mul = mul nsw i32 %5, %8
  %9 = load i32, i32* %var, align 4
  %add = add nsw i32 %9, %mul
  store i32 %add, i32* %var, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body6
  %10 = load i32, i32* %k, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  %11 = load i32, i32* %var, align 4
  %12 = load i32, i32* %j, align 4
  %13 = load i32, i32* %i, align 4
  %arrayidx10 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* @c, i32 0, i32 %13
  %arrayidx11 = getelementptr inbounds [2 x i32], [2 x i32]* %arrayidx10, i32 0, i32 %12
  store i32 %11, i32* %arrayidx11, align 4
  br label %for.inc12

for.inc12:                                        ; preds = %for.end
  %14 = load i32, i32* %j, align 4
  %inc13 = add nsw i32 %14, 1
  store i32 %inc13, i32* %j, align 4
  br label %for.cond1

for.end14:                                        ; preds = %for.cond1
  br label %for.inc15

for.inc15:                                        ; preds = %for.end14
  %15 = load i32, i32* %i, align 4
  %inc16 = add nsw i32 %15, 1
  store i32 %inc16, i32* %i, align 4
  br label %for.cond

for.end17:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond18

for.cond18:                                       ; preds = %for.inc34, %for.end17
  %16 = load i32, i32* %i, align 4
  %cmp19 = icmp slt i32 %16, 2
  br i1 %cmp19, label %for.body20, label %for.end36

for.body20:                                       ; preds = %for.cond18
  store i32 0, i32* %j, align 4
  br label %for.cond21

for.cond21:                                       ; preds = %for.inc31, %for.body20
  %17 = load i32, i32* %j, align 4
  %cmp22 = icmp slt i32 %17, 2
  br i1 %cmp22, label %for.body23, label %for.end33

for.body23:                                       ; preds = %for.cond21
  %18 = load i32, i32* %j, align 4
  %19 = load i32, i32* %i, align 4
  %arrayidx24 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* @c, i32 0, i32 %19
  %arrayidx25 = getelementptr inbounds [2 x i32], [2 x i32]* %arrayidx24, i32 0, i32 %18
  %20 = load i32, i32* %arrayidx25, align 4
  %21 = load i32, i32* %j, align 4
  %22 = load i32, i32* %i, align 4
  %arrayidx26 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* @result, i32 0, i32 %22
  %arrayidx27 = getelementptr inbounds [2 x i32], [2 x i32]* %arrayidx26, i32 0, i32 %21
  %23 = load i32, i32* %arrayidx27, align 4
  %cmp28 = icmp ne i32 %20, %23
  br i1 %cmp28, label %if.then, label %if.end

if.then:                                          ; preds = %for.body23
  %24 = load i32, i32* %i, align 4
  %mul29 = mul nsw i32 100, %24
  %25 = load i32, i32* %j, align 4
  %add30 = add nsw i32 %mul29, %25
  store i32 %add30, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body23
  br label %for.inc31

for.inc31:                                        ; preds = %if.end
  %26 = load i32, i32* %j, align 4
  %inc32 = add nsw i32 %26, 1
  store i32 %inc32, i32* %j, align 4
  br label %for.cond21

for.end33:                                        ; preds = %for.cond21
  br label %for.inc34

for.inc34:                                        ; preds = %for.end33
  %27 = load i32, i32* %i, align 4
  %inc35 = add nsw i32 %27, 1
  store i32 %inc35, i32* %i, align 4
  br label %for.cond18

for.end36:                                        ; preds = %for.cond18
  store i32 -1, i32* %retval
  br label %return

return:                                           ; preds = %for.end36, %if.then
  %28 = load i32, i32* %retval
  ret i32 %28
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
