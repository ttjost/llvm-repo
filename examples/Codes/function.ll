; ModuleID = 'function.c'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

@global_a = global i32 50, align 4
@global_b = global i32 100, align 4
@global_c = global i32 1000, align 4

; Function Attrs: nounwind
define i32 @sum(i32 signext %a, i32 signext %b) #0 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %1 = load i32, i32* %b.addr, align 4
  %add = add nsw i32 %0, %1
  %2 = load i32, i32* @global_a, align 4
  %add1 = add nsw i32 %add, %2
  ret i32 %add1
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 10, i32* %a, align 4
  store i32 20, i32* %b, align 4
  %0 = load i32, i32* @global_b, align 4
  %1 = load i32, i32* @global_c, align 4
  %call = call i32 @sum(i32 signext %0, i32 signext %1)
  store i32 %call, i32* %c, align 4
  %2 = load i32, i32* %a, align 4
  %3 = load i32, i32* %b, align 4
  %call1 = call i32 @sum(i32 signext %2, i32 signext %3)
  store i32 %call1, i32* %d, align 4
  %4 = load i32, i32* %c, align 4
  %5 = load i32, i32* %d, align 4
  %call2 = call i32 @sum(i32 signext %4, i32 signext %5)
  ret i32 %call2
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
