; ModuleID = 'ch4_6.cpp'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

; Function Attrs: nounwind
define i32 @_Z11test_OptSltv() #0 {
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %f = alloca i32, align 4
  store i32 10, i32* %a, align 4
  store i32 1, i32* %b, align 4
  store i32 0, i32* %d, align 4
  store i32 0, i32* %e, align 4
  store i32 0, i32* %f, align 4
  %0 = load i32, i32* %a, align 4
  %cmp = icmp sgt i32 %0, 2
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* %d, align 4
  %1 = load i32, i32* %d, align 4
  %2 = load i32, i32* %b, align 4
  %cmp1 = icmp slt i32 %2, 1
  %conv2 = zext i1 %cmp1 to i32
  %add = add nsw i32 %1, %conv2
  store i32 %add, i32* %e, align 4
  %3 = load i32, i32* %e, align 4
  %4 = load i32, i32* %e, align 4
  %cmp3 = icmp sgt i32 %4, 1
  %conv4 = zext i1 %cmp3 to i32
  %add5 = add nsw i32 %3, %conv4
  store i32 %add5, i32* %e, align 4
  %5 = load i32, i32* %d, align 4
  %6 = load i32, i32* %e, align 4
  %add6 = add nsw i32 %5, %6
  store i32 %add6, i32* %f, align 4
  %7 = load i32, i32* %f, align 4
  ret i32 %7
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @_Z11test_OptSltv()
  store i32 %call, i32* %a, align 4
  %0 = load i32, i32* %a, align 4
  %add = add nsw i32 %0, 100
  ret i32 %add
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
