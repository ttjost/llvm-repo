; ModuleID = 'division_unsigned.c'
target datalayout = "E-m:e-p:32:32-i64:64-f128:64-n32-S64"
target triple = "sparc-unknown-linux-gnu"

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
  %div = udiv i32 %0, %1
  %2 = load i32, i32* @ua, align 4
  %3 = load i32, i32* @ub, align 4
  %div1 = udiv i32 %2, %3
  %add = add i32 %div, %div1
  ret i32 %add
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

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+soft-float" "unsafe-fp-math"="false" "use-soft-float"="true" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+soft-float" "unsafe-fp-math"="false" "use-soft-float"="true" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
