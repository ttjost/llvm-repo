; ModuleID = 'example3.c'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

@a = global i32 10, align 4
@b = global i32 20, align 4
@c = global i8 97, align 1

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %d = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load i32, i32* @a, align 4
  %cmp = icmp eq i32 %0, 10
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @b, align 4
  %2 = load i8, i8* @c, align 1
  %conv = sext i8 %2 to i32
  %add = add nsw i32 %1, %conv
  store i32 %add, i32* %d, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %3 = load i32, i32* @b, align 4
  %4 = load i8, i8* @c, align 1
  %conv1 = sext i8 %4 to i32
  %sub = sub nsw i32 %3, %conv1
  store i32 %sub, i32* %d, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %5 = load i32, i32* %d, align 4
  ret i32 %5
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}