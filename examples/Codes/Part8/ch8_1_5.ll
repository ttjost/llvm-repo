; ModuleID = 'ch8_1_5.cpp'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

@sBuffer = global [4 x i8] c"555\00", align 1

; Function Attrs: nounwind
define i32 @_Z10test_ctrl2v() #0 {
entry:
  %Result = alloca i32, align 4
  %Comparator = alloca i8, align 1
  %ByteToCompare = alloca i8, align 1
  store i32 0, i32* %Result, align 4
  %0 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @sBuffer, i32 0, i32 1), align 1
  store i8 %0, i8* %Comparator, align 1
  %1 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @sBuffer, i32 0, i32 0), align 1
  store i8 %1, i8* %ByteToCompare, align 1
  %2 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @sBuffer, i32 0, i32 0), align 1
  %conv = zext i8 %2 to i32
  switch i32 %conv, label %sw.epilog [
    i32 48, label %sw.bb
    i32 49, label %sw.bb3
    i32 50, label %sw.bb9
    i32 51, label %sw.bb15
    i32 52, label %sw.bb21
    i32 53, label %sw.bb27
  ]

sw.bb:                                            ; preds = %entry
  %3 = load i8, i8* %ByteToCompare, align 1
  %conv1 = zext i8 %3 to i32
  %4 = load i8, i8* %Comparator, align 1
  %conv2 = zext i8 %4 to i32
  %cmp = icmp eq i32 %conv1, %conv2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %sw.bb
  store i32 1, i32* %Result, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %sw.bb
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  %5 = load i8, i8* %ByteToCompare, align 1
  %conv4 = zext i8 %5 to i32
  %6 = load i8, i8* %Comparator, align 1
  %conv5 = zext i8 %6 to i32
  %cmp6 = icmp ne i32 %conv4, %conv5
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %sw.bb3
  store i32 1, i32* %Result, align 4
  br label %if.end8

if.end8:                                          ; preds = %if.then7, %sw.bb3
  br label %sw.epilog

sw.bb9:                                           ; preds = %entry
  %7 = load i8, i8* %ByteToCompare, align 1
  %conv10 = zext i8 %7 to i32
  %8 = load i8, i8* %Comparator, align 1
  %conv11 = zext i8 %8 to i32
  %cmp12 = icmp sgt i32 %conv10, %conv11
  br i1 %cmp12, label %if.then13, label %if.end14

if.then13:                                        ; preds = %sw.bb9
  store i32 1, i32* %Result, align 4
  br label %if.end14

if.end14:                                         ; preds = %if.then13, %sw.bb9
  br label %sw.epilog

sw.bb15:                                          ; preds = %entry
  %9 = load i8, i8* %ByteToCompare, align 1
  %conv16 = zext i8 %9 to i32
  %10 = load i8, i8* %Comparator, align 1
  %conv17 = zext i8 %10 to i32
  %cmp18 = icmp slt i32 %conv16, %conv17
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %sw.bb15
  store i32 1, i32* %Result, align 4
  br label %if.end20

if.end20:                                         ; preds = %if.then19, %sw.bb15
  br label %sw.epilog

sw.bb21:                                          ; preds = %entry
  %11 = load i8, i8* %ByteToCompare, align 1
  %conv22 = zext i8 %11 to i32
  %12 = load i8, i8* %Comparator, align 1
  %conv23 = zext i8 %12 to i32
  %cmp24 = icmp sge i32 %conv22, %conv23
  br i1 %cmp24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %sw.bb21
  store i32 1, i32* %Result, align 4
  br label %if.end26

if.end26:                                         ; preds = %if.then25, %sw.bb21
  br label %sw.epilog

sw.bb27:                                          ; preds = %entry
  %13 = load i8, i8* %ByteToCompare, align 1
  %conv28 = zext i8 %13 to i32
  %14 = load i8, i8* %Comparator, align 1
  %conv29 = zext i8 %14 to i32
  %cmp30 = icmp sle i32 %conv28, %conv29
  br i1 %cmp30, label %if.then31, label %if.end32

if.then31:                                        ; preds = %sw.bb27
  store i32 1, i32* %Result, align 4
  br label %if.end32

if.end32:                                         ; preds = %if.then31, %sw.bb27
  br label %sw.epilog

sw.epilog:                                        ; preds = %entry, %if.end32, %if.end26, %if.end20, %if.end14, %if.end8, %if.end
  %15 = load i32, i32* %Result, align 4
  ret i32 %15
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @_Z10test_ctrl2v()
  ret i32 %call
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
