; ModuleID = 'ch8_3.cpp'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

@a = global i32 1, align 4
@b = global i32 2, align 4

; Function Attrs: nounwind
define i32 @_Z8select_1v() #0 {
entry:
  %retval = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 0, i32* %c, align 4
  %0 = load volatile i32, i32* @a, align 4
  %1 = load volatile i32, i32* @b, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  store i32 2, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %2 = load i32, i32* %retval
  ret i32 %2
}

; Function Attrs: nounwind
define i32 @_Z8select_2v() #0 {
entry:
  %c = alloca i32, align 4
  store i32 0, i32* %c, align 4
  %0 = load volatile i32, i32* @a, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 1, i32* %c, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  store i32 3, i32* %c, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* %c, align 4
  ret i32 %1
}

; Function Attrs: nounwind
define i32 @_Z8select_3v() #0 {
entry:
  %c = alloca i32, align 4
  store i32 0, i32* %c, align 4
  %0 = load volatile i32, i32* @a, align 4
  %tobool = icmp ne i32 %0, 0
  %cond = select i1 %tobool, i32 3, i32 1
  store i32 %cond, i32* %c, align 4
  %1 = load i32, i32* %c, align 4
  ret i32 %1
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @_Z8select_1v()
  %call1 = call i32 @_Z8select_2v()
  %add = add nsw i32 %call, %call1
  %call2 = call i32 @_Z8select_3v()
  %add3 = add nsw i32 %add, %call2
  ret i32 %add3
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
