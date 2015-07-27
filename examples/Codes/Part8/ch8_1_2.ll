; ModuleID = 'ch8_1_2.cpp'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %p = alloca i32*, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %a, align 4
  store i32 1, i32* %b, align 4
  store i32* %a, i32** %p, align 4
  %0 = load i32*, i32** %p, align 4
  %1 = load i32, i32* %0, align 4
  %tobool = icmp ne i32 %1, 0
  %lnot = xor i1 %tobool, true
  %conv = zext i1 %lnot to i32
  store i32 %conv, i32* %b, align 4
  %2 = load i32, i32* %b, align 4
  %cmp = icmp eq i32 %2, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %a, align 4
  %4 = load i32, i32* %b, align 4
  %add = add nsw i32 %3, %4
  store i32 %add, i32* %a, align 4
  br label %if.end13

if.else:                                          ; preds = %entry
  %5 = load i32, i32* %b, align 4
  %cmp1 = icmp slt i32 %5, 0
  br i1 %cmp1, label %if.then2, label %if.else3

if.then2:                                         ; preds = %if.else
  %6 = load i32, i32* %a, align 4
  %sub = sub nsw i32 %6, 1
  store i32 %sub, i32* %a, align 4
  br label %if.end12

if.else3:                                         ; preds = %if.else
  %7 = load i32, i32* %b, align 4
  %cmp4 = icmp sgt i32 %7, 0
  br i1 %cmp4, label %if.then5, label %if.else7

if.then5:                                         ; preds = %if.else3
  %8 = load i32, i32* %a, align 4
  %add6 = add nsw i32 %8, 1
  store i32 %add6, i32* %a, align 4
  br label %if.end11

if.else7:                                         ; preds = %if.else3
  %9 = load i32, i32* %b, align 4
  %cmp8 = icmp ne i32 %9, 0
  br i1 %cmp8, label %if.then9, label %if.end

if.then9:                                         ; preds = %if.else7
  %10 = load i32, i32* %a, align 4
  %11 = load i32, i32* %b, align 4
  %sub10 = sub nsw i32 %10, %11
  store i32 %sub10, i32* %a, align 4
  br label %if.end

if.end:                                           ; preds = %if.then9, %if.else7
  br label %if.end11

if.end11:                                         ; preds = %if.end, %if.then5
  br label %if.end12

if.end12:                                         ; preds = %if.end11, %if.then2
  br label %if.end13

if.end13:                                         ; preds = %if.end12, %if.then
  %12 = load i32, i32* %a, align 4
  ret i32 %12
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
