; ModuleID = 'division_signed.c'
target datalayout = "E-m:e-p:32:32-i64:64-f128:64-n32-S64"
target triple = "sparc-unknown-linux-gnu"

@a = global i32 10, align 4
@b = global i32 -10, align 4
@c = global i32 5, align 4
@d = global i32 -2, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@key = common global i32 0, align 4
@.str1 = private unnamed_addr constant [11 x i8] c"Div is %d\0A\00", align 1

; Function Attrs: nounwind
define i32 @division() #0 {
entry:
  %0 = load i32, i32* @a, align 4
  %1 = load i32, i32* @b, align 4
  %div = sdiv i32 %0, %1
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %div)
  %2 = load i32, i32* @a, align 4
  %3 = load i32, i32* @c, align 4
  %div1 = sdiv i32 %2, %3
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %div1)
;  %4 = load i32, i32* @b, align 4
;  %5 = load i32, i32* @c, align 4
;  %div3 = sdiv i32 %4, %5
;  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %div3)
;  %6 = load i32, i32* @b, align 4
;  %7 = load i32, i32* @d, align 4
;  %div5 = sdiv i32 %6, %7
;  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %div5)
;  %8 = load i32, i32* @a, align 4
;  %9 = load i32, i32* @b, align 4
;  %div7 = sdiv i32 %8, %9
;  %10 = load i32, i32* @a, align 4
;  %11 = load i32, i32* @c, align 4
;  %div8 = sdiv i32 %10, %11
;  %add = add nsw i32 %div7, %div8
;  %12 = load i32, i32* @b, align 4
;;  %13 = load i32, i32* @c, align 4
;  %div9 = sdiv i32 %12, %13
;  %add10 = add nsw i32 %add, %div9
;  %14 = load i32, i32* @b, align 4
;  %15 = load i32, i32* @d, align 4
;  %div11 = sdiv i32 %14, %15
;  %add12 = add nsw i32 %add10, %div11
;  store i32 %add12, i32* @a, align 4
;  %4 = load i32, i32* @a, align 4
  ret i32 %div1
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
