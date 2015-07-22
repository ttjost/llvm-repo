; ModuleID = 'for.c'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

@a = common global [100 x i32] zeroinitializer, align 4
@b = common global [100 x i32] zeroinitializer, align 4

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 100
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* @a, i32 0, i32 %2
  store i32 %1, i32* %arrayidx, align 4
  %3 = load i32, i32* %i, align 4
  %sub = sub nsw i32 100, %3
  %4 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds [100 x i32], [100 x i32]* @b, i32 0, i32 %4
  store i32 %sub, i32* %arrayidx1, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc8, %for.end
  %6 = load i32, i32* %i, align 4
  %cmp3 = icmp slt i32 %6, 100
  br i1 %cmp3, label %for.body4, label %for.end10

for.body4:                                        ; preds = %for.cond2
  %7 = load i32, i32* %i, align 4
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* @a, i32 0, i32 %7
  %8 = load i32, i32* %arrayidx5, align 4
  %9 = load i32, i32* %i, align 4
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* @b, i32 0, i32 %9
  %10 = load i32, i32* %arrayidx6, align 4
  %cmp7 = icmp eq i32 %8, %10
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %11 = load i32, i32* %i, align 4
  store i32 %11, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body4
  br label %for.inc8

for.inc8:                                         ; preds = %if.end
  %12 = load i32, i32* %i, align 4
  %inc9 = add nsw i32 %12, 1
  store i32 %inc9, i32* %i, align 4
  br label %for.cond2

for.end10:                                        ; preds = %for.cond2
  store i32 -1, i32* %retval
  br label %return

return:                                           ; preds = %for.end10, %if.then
  %13 = load i32, i32* %retval
  ret i32 %13
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
