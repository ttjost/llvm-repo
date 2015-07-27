; ModuleID = 'ch8_2.cpp'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

; Function Attrs: nounwind
define i32 @_Z18test_DelUselessJMPv() #0 {
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 1, i32* %a, align 4
  store i32 -2, i32* %b, align 4
  store i32 3, i32* %c, align 4
  %0 = load i32, i32* %a, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %a, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %a, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* %b, align 4
  %cmp1 = icmp eq i32 %2, 0
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.end
  %3 = load i32, i32* %a, align 4
  %add = add nsw i32 %3, 3
  store i32 %add, i32* %a, align 4
  %4 = load i32, i32* %b, align 4
  %inc3 = add nsw i32 %4, 1
  store i32 %inc3, i32* %b, align 4
  br label %if.end8

if.else:                                          ; preds = %if.end
  %5 = load i32, i32* %b, align 4
  %cmp4 = icmp slt i32 %5, 0
  br i1 %cmp4, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.else
  %6 = load i32, i32* %a, align 4
  %7 = load i32, i32* %b, align 4
  %add6 = add nsw i32 %6, %7
  store i32 %add6, i32* %a, align 4
  %8 = load i32, i32* %b, align 4
  %dec = add nsw i32 %8, -1
  store i32 %dec, i32* %b, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %if.else
  br label %if.end8

if.end8:                                          ; preds = %if.end7, %if.then2
  %9 = load i32, i32* %c, align 4
  %cmp9 = icmp sgt i32 %9, 0
  br i1 %cmp9, label %if.then10, label %if.end13

if.then10:                                        ; preds = %if.end8
  %10 = load i32, i32* %a, align 4
  %11 = load i32, i32* %c, align 4
  %add11 = add nsw i32 %10, %11
  store i32 %add11, i32* %a, align 4
  %12 = load i32, i32* %c, align 4
  %inc12 = add nsw i32 %12, 1
  store i32 %inc12, i32* %c, align 4
  br label %if.end13

if.end13:                                         ; preds = %if.then10, %if.end8
  %13 = load i32, i32* %a, align 4
  ret i32 %13
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @_Z18test_DelUselessJMPv()
  ret i32 %call
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
