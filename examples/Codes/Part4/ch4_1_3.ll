; ModuleID = 'ch4_1_3.cpp'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

; Function Attrs: nounwind
define i32 @_Z16test_rotate_leftv() #0 {
entry:
  %a = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 2000, i32* %a, align 4
  %0 = load i32, i32* %a, align 4
  %shl = shl i32 %0, 30
  %1 = load i32, i32* %a, align 4
  %shr = lshr i32 %1, 2
  %or = or i32 %shl, %shr
  store i32 %or, i32* %result, align 4
  %2 = load i32, i32* %result, align 4
  ret i32 %2
}

; Function Attrs: nounwind
define i32 @_Z17test_rotate_left1ji(i32 zeroext %a, i32 signext %n) #0 {
entry:
  %a.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %1 = load i32, i32* %n.addr, align 4
  %shl = shl i32 %0, %1
  %2 = load i32, i32* %a.addr, align 4
  %3 = load i32, i32* %n.addr, align 4
  %sub = sub nsw i32 32, %3
  %shr = lshr i32 %2, %sub
  %or = or i32 %shl, %shr
  store i32 %or, i32* %result, align 4
  %4 = load i32, i32* %result, align 4
  ret i32 %4
}

; Function Attrs: nounwind
define i32 @_Z17test_rotate_rightji(i32 zeroext %a, i32 signext %n) #0 {
entry:
  %a.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %result = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %1 = load i32, i32* %n.addr, align 4
  %shr = lshr i32 %0, %1
  %2 = load i32, i32* %a.addr, align 4
  %3 = load i32, i32* %n.addr, align 4
  %sub = sub nsw i32 32, %3
  %shl = shl i32 %2, %sub
  %or = or i32 %shr, %shl
  store i32 %or, i32* %result, align 4
  %4 = load i32, i32* %result, align 4
  ret i32 %4
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @_Z16test_rotate_leftv()
  store i32 %call, i32* %a, align 4
  %0 = load i32, i32* %a, align 4
  %call1 = call i32 @_Z17test_rotate_left1ji(i32 zeroext %0, i32 signext 2)
  store i32 %call1, i32* %b, align 4
  %1 = load i32, i32* %b, align 4
  %call2 = call i32 @_Z17test_rotate_rightji(i32 zeroext %1, i32 signext 3)
  store i32 %call2, i32* %c, align 4
  %2 = load i32, i32* %c, align 4
  ret i32 %2
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
