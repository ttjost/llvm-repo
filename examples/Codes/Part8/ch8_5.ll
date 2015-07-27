; ModuleID = 'ch8_5.cpp'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

@a1 = global i32 1, align 4
@b1 = global i32 2, align 4
@gI1 = global i32 100, align 4
@gJ1 = global i32 50, align 4

; Function Attrs: nounwind
define i32 @_Z22test_select_global_picv() #0 {
entry:
  %retval = alloca i32, align 4
  %0 = load volatile i32, i32* @a1, align 4
  %1 = load volatile i32, i32* @b1, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i32, i32* @gI1, align 4
  store i32 %2, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  %3 = load i32, i32* @gJ1, align 4
  store i32 %3, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %retval
  ret i32 %4
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @_Z22test_select_global_picv()
  ret i32 %call
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
