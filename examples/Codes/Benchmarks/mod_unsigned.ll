; ModuleID = 'mod_unsigned.c'
target datalayout = "E-m:e-p:32:32-i64:64-f128:64-n32-S64"
target triple = "sparc-unknown-linux-gnu"

@ua = global i32 10, align 4
@ub = global i32 2, align 4
@uc = global i32 4, align 4
@ud = global i32 3, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@key = common global i32 0, align 4
@.str1 = private unnamed_addr constant [11 x i8] c"Div is %d\0A\00", align 1

; Function Attrs: nounwind
define i32 @division() #0 {
entry:
;  %0 = load i32, i32* @ua, align 4
;  %1 = load i32, i32* @ub, align 4
;  %rem = urem i32 %0, %1
;  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %rem)
;  %0 = load i32, i32* @ua, align 4
;  %1 = load i32, i32* @uc, align 4
;  %rem1 = urem i32 %0, %1
;  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %rem1)
  %0 = load i32, i32* @ua, align 4
  %1 = load i32, i32* @ud, align 4
  %rem3 = urem i32 %0, %1
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %rem3)
;  %6 = load i32, i32* @uc, align 4
;  %7 = load i32, i32* @ud, align 4
;  %rem5 = urem i32 %6, %7
;  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %rem5)
;  %8 = load i32, i32* @ua, align 4
;  %9 = load i32, i32* @ub, align 4
;  %rem7 = urem i32 %8, %9
;  %10 = load i32, i32* @ua, align 4
;  %11 = load i32, i32* @uc, align 4
;  %rem8 = urem i32 %10, %11
;  %add = add i32 %rem7, %rem8
;  %12 = load i32, i32* @ua, align 4
;  %13 = load i32, i32* @ud, align 4
;  %rem9 = urem i32 %12, %13
;  %add10 = add i32 %add, %rem9
;  %14 = load i32, i32* @uc, align 4
;  %15 = load i32, i32* @ud, align 4
;  %rem11 = urem i32 %14, %15
;  %add12 = add i32 %add10, %rem11
  ret i32 %rem3;%add12
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @division()
  store i32 %call, i32* @key, align 4
  %0 = load i32, i32* @key, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str1, i32 0, i32 0), i32 %0)
  ret i32 0
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+soft-float" "unsafe-fp-math"="false" "use-soft-float"="true" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+soft-float" "unsafe-fp-math"="false" "use-soft-float"="true" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
