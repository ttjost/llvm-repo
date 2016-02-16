; ModuleID = 'urem.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@a = global i32 -10, align 4
@b = global i32 2, align 4
@c = global i32 5, align 4
@ua = global i32 10, align 4
@ub = global i32 2, align 4
@uc = global i32 5, align 4
@.str = private unnamed_addr constant [4 x i8] c"-1\0A\00", align 1
@.str1 = private unnamed_addr constant [5 x i8] c"666\0A\00", align 1
@key = common global i32 0, align 4

; Function Attrs: noimplicitfloat nounwind
define i32 @division() #0 {
entry:
  %0 = load i32, i32* @ua, align 4
  %1 = load i32, i32* @uc, align 4
  %rem = urem i32 %0, %1
  %2 = load i32, i32* @ua, align 4
  %3 = load i32, i32* @ub, align 4
  %rem1 = urem i32 %2, %3
  %add = add i32 %rem, %rem1
  %4 = load i32, i32* @uc, align 4
  %5 = load i32, i32* @ub, align 4
  %rem2 = urem i32 %4, %5
  %add3 = add i32 %add, %rem2
  %6 = load i32, i32* @a, align 4
  %7 = load i32, i32* @b, align 4
  %rem4 = srem i32 %6, %7
  %add5 = add i32 %add3, %rem4
  store i32 %add5, i32* @ua, align 4
  %8 = load i32, i32* @ua, align 4
  ret i32 %8
}

; Function Attrs: noimplicitfloat nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @division() #2
  %cmp = icmp eq i32 %call, 7
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0)) #2
  br label %if.end

if.else:                                          ; preds = %entry
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str1, i32 0, i32 0)) #2
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret i32 0
}

; Function Attrs: noimplicitfloat
declare i32 @printf(i8*, ...) #1

attributes #0 = { noimplicitfloat nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noimplicitfloat "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noimplicitfloat }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
