; ModuleID = 'var_arg_v1.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@.str = private unnamed_addr constant [26 x i8] c"The largest value is: %d\0A\00", align 1

; Function Attrs: nounwind
define i32 @FindMax(i32 %n, ...) #0 {
entry:
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %val = alloca i32, align 4
  %largest = alloca i32, align 4
  %vl = alloca i8*, align 4
  store i32 %n, i32* %n.addr, align 4
  %vl1 = bitcast i8** %vl to i8*
  call void @llvm.va_start(i8* %vl1)
  %ap.cur = load i8*, i8** %vl
  %0 = bitcast i8* %ap.cur to i32*
  %ap.next = getelementptr i8, i8* %ap.cur, i32 4
  store i8* %ap.next, i8** %vl
  %1 = load i32, i32* %0
  store i32 %1, i32* %largest, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* %n.addr, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %ap.cur2 = load i8*, i8** %vl
  %4 = bitcast i8* %ap.cur2 to i32*
  %ap.next3 = getelementptr i8, i8* %ap.cur2, i32 4
  store i8* %ap.next3, i8** %vl
  %5 = load i32, i32* %4
  store i32 %5, i32* %val, align 4
  %6 = load i32, i32* %largest, align 4
  %7 = load i32, i32* %val, align 4
  %cmp4 = icmp sgt i32 %6, %7
  br i1 %cmp4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  %8 = load i32, i32* %largest, align 4
  br label %cond.end

cond.false:                                       ; preds = %for.body
  %9 = load i32, i32* %val, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %8, %cond.true ], [ %9, %cond.false ]
  store i32 %cond, i32* %largest, align 4
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %vl5 = bitcast i8** %vl to i8*
  call void @llvm.va_end(i8* %vl5)
  %11 = load i32, i32* %largest, align 4
  ret i32 %11
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #1

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #1

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %m = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 (i32, ...)* @FindMax(i32 4, i32 702, i32 422, i32 631, i32 834)
  store i32 %call, i32* %m, align 4
  %0 = load i32, i32* %m, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str, i32 0, i32 0), i32 %0)
  ret i32 0
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"}
