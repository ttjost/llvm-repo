; ModuleID = 'ch7_2.cpp'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

%struct.Date = type { i16, i8, i8, i8, i8, i8 }

@b = global [4 x i8] c"abc\00", align 1
@_ZZ9test_charvE5date1 = private unnamed_addr constant %struct.Date { i16 2012, i8 11, i8 25, i8 9, i8 40, i8 15 }, align 2

; Function Attrs: nounwind
define i32 @_Z9test_charv() #0 {
entry:
  %a = alloca i8, align 1
  %c = alloca i8, align 1
  %date1 = alloca %struct.Date, align 2
  %m = alloca i8, align 1
  %s = alloca i8, align 1
  %0 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @b, i32 0, i32 1), align 1
  store i8 %0, i8* %a, align 1
  %1 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @b, i32 0, i32 1), align 1
  store i8 %1, i8* %c, align 1
  %2 = bitcast %struct.Date* %date1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %2, i8* bitcast (%struct.Date* @_ZZ9test_charvE5date1 to i8*), i32 8, i32 2, i1 false)
  %month = getelementptr inbounds %struct.Date, %struct.Date* %date1, i32 0, i32 1
  %3 = load i8, i8* %month, align 1
  store i8 %3, i8* %m, align 1
  %second = getelementptr inbounds %struct.Date, %struct.Date* %date1, i32 0, i32 5
  %4 = load i8, i8* %second, align 1
  store i8 %4, i8* %s, align 1
  %5 = load i8, i8* %m, align 1
  %conv = sext i8 %5 to i32
  %6 = load i8, i8* %s, align 1
  %conv1 = sext i8 %6 to i32
  %add = add nsw i32 %conv, %conv1
  ret i32 %add
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture, i8* nocapture readonly, i32, i32, i1) #1

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @_Z9test_charv()
  store i32 %call, i32* %a, align 4
  %0 = load i32, i32* %a, align 4
  ret i32 %0
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
