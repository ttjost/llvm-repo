; ModuleID = 'ch7_2.cpp'
target datalayout = "E-m:m-i8:8:32-i16:16:32-i64:64-n32:64-S128"
target triple = "mips64-unknown-linux-gnu"

@b = global [4 x i8] c"abc\00", align 4
@.str = private unnamed_addr constant [7 x i8] c"%c %c\0A\00", align 1

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %0 = load i32, i32* bitcast ([4 x i8]* @b to i32*), align 4
  %1 = lshr i32 %0, 24
  %2 = lshr i32 %0, 8
  %conv1 = and i32 %2, 255
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 signext %1, i32 signext %conv1)
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i64 0, i64 0), i32 signext 96, i32 signext 125)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #0

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips64r2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
