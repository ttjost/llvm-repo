; ModuleID = 'urem.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@a = global i32 -10, align 4
@b = global i32 2, align 4
@c = global i32 5, align 4
@ua = global i32 10, align 4
@ub = global i32 2, align 4
@uc = global i32 5, align 4
@key = common global i32 0, align 4
@.str = private unnamed_addr constant [12 x i8] c"\0ADiv is %d\0A\00", align 1

; Function Attrs: nounwind
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
  %8 = load i32, i32* @a, align 4
  %9 = load i32, i32* @c, align 4
  %rem6 = srem i32 %8, %9
  %add7 = add i32 %add5, %rem6
  %10 = load i32, i32* @a, align 4
  %11 = load i32, i32* @ua, align 4
  %rem8 = urem i32 %10, %11
  %add9 = add i32 %add7, %rem8
  %12 = load i32, i32* @a, align 4
  %13 = load i32, i32* @ub, align 4
  %rem10 = urem i32 %12, %13
  %add11 = add i32 %add9, %rem10
  store i32 %add11, i32* @ua, align 4
  %14 = load i32, i32* @ua, align 4
  ret i32 %14
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @division()
  store i32 %call, i32* @key, align 4
  %0 = load i32, i32* @key, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 %0)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
