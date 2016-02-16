; ModuleID = 'ch7_2.cpp'
target datalayout = "E-m:m-i8:8:32-i16:16:32-i64:64-n32:64-S128"
target triple = "mips64-unknown-linux-gnu"

%struct.Date = type { i16, i8, i8, i8, i8, i8 }

@b = global [4 x i8] c"abc\00", align 1
@_ZZ4mainE5date1 = private unnamed_addr constant %struct.Date { i16 2012, i8 96, i8 25, i8 9, i8 40, i8 125 }, align 2
@.str = private unnamed_addr constant [7 x i8] c"%c %c\0A\00", align 1

define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i8, align 1
  %c = alloca i8, align 1
  %date1 = alloca %struct.Date, align 2
  %m = alloca i8, align 1
  %s = alloca i8, align 1
  store i32 0, i32* %retval
  %0 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @b, i32 0, i64 1), align 1
  store i8 %0, i8* %a, align 1
  %1 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @b, i32 0, i64 1), align 1
  store i8 %1, i8* %c, align 1
  %2 = bitcast %struct.Date* %date1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast (%struct.Date* @_ZZ4mainE5date1 to i8*), i64 8, i32 2, i1 false)
  %month = getelementptr inbounds %struct.Date, %struct.Date* %date1, i32 0, i32 1
  %3 = load i8, i8* %month, align 1
  store i8 %3, i8* %m, align 1
  %second = getelementptr inbounds %struct.Date, %struct.Date* %date1, i32 0, i32 5
  %4 = load i8, i8* %second, align 1
  store i8 %4, i8* %s, align 1
  %5 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @b, i32 0, i64 0), align 1
  %conv = zext i8 %5 to i32
  %6 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @b, i32 0, i64 2), align 1
  %conv1 = zext i8 %6 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 signext %conv, i32 signext %conv1)
  %7 = load i8, i8* %m, align 1
  %conv2 = sext i8 %7 to i32
  %8 = load i8, i8* %s, align 1
  %conv3 = sext i8 %8 to i32
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 signext %conv2, i32 signext %conv3)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

declare i32 @printf(i8*, ...) #0

attributes #0 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips64r2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
