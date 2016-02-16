; ModuleID = 'bunch_args_v1.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@a = global i32 100, align 4
@b = global i32 2, align 4
@c = global i32 10, align 4
@d = global i32 10, align 4
@e = global i32 10, align 4
@f = global i32 10, align 4
@g = global i32 10, align 4
@h = global i32 10, align 4
@i = global i32 10, align 4
@j = global i32 10, align 4
@k = global i32 10, align 4
@.str = private unnamed_addr constant [18 x i8] c"%d/%d+%d*%d+%d  \0A\00", align 1
@.str1 = private unnamed_addr constant [27 x i8] c"%d/%d+%d+%d+%d+%d+%d+%d \0A \00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind
define i32 @func(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g, i32 %h, i32 %i, i32 %j, i32 %k) #0 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %e.addr = alloca i32, align 4
  %f.addr = alloca i32, align 4
  %g.addr = alloca i32, align 4
  %h.addr = alloca i32, align 4
  %i.addr = alloca i32, align 4
  %j.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %res1 = alloca i32, align 4
  %res2 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %e, i32* %e.addr, align 4
  store i32 %f, i32* %f.addr, align 4
  store i32 %g, i32* %g.addr, align 4
  store i32 %h, i32* %h.addr, align 4
  store i32 %i, i32* %i.addr, align 4
  store i32 %j, i32* %j.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %1 = load i32, i32* %b.addr, align 4
  %div = sdiv i32 %0, %1
  %2 = load i32, i32* %c.addr, align 4
  %3 = load i32, i32* %d.addr, align 4
  %mul = mul nsw i32 %2, %3
  %add = add nsw i32 %div, %mul
  %4 = load i32, i32* %e.addr, align 4
  %add1 = add nsw i32 %add, %4
  store i32 %add1, i32* %res1, align 4
  %5 = load i32, i32* %a.addr, align 4
  %6 = load i32, i32* %b.addr, align 4
  %div2 = sdiv i32 %5, %6
  %7 = load i32, i32* %f.addr, align 4
  %add3 = add nsw i32 %div2, %7
  %8 = load i32, i32* %g.addr, align 4
  %add4 = add nsw i32 %add3, %8
  %9 = load i32, i32* %h.addr, align 4
  %add5 = add nsw i32 %add4, %9
  %10 = load i32, i32* %i.addr, align 4
  %add6 = add nsw i32 %add5, %10
  %11 = load i32, i32* %j.addr, align 4
  %add7 = add nsw i32 %add6, %11
  %12 = load i32, i32* %k.addr, align 4
  %add8 = add nsw i32 %add7, %12
  store i32 %add8, i32* %res2, align 4
  %13 = load i32, i32* %a.addr, align 4
  %14 = load i32, i32* %b.addr, align 4
  %15 = load i32, i32* %c.addr, align 4
  %16 = load i32, i32* %d.addr, align 4
  %17 = load i32, i32* %e.addr, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i32 0, i32 0), i32 %13, i32 %14, i32 %15, i32 %16, i32 %17)
  %18 = load i32, i32* %a.addr, align 4
  %19 = load i32, i32* %b.addr, align 4
  %20 = load i32, i32* %f.addr, align 4
  %21 = load i32, i32* %g.addr, align 4
  %22 = load i32, i32* %h.addr, align 4
  %23 = load i32, i32* %i.addr, align 4
  %24 = load i32, i32* %j.addr, align 4
  %25 = load i32, i32* %k.addr, align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str1, i32 0, i32 0), i32 %18, i32 %19, i32 %20, i32 %21, i32 %22, i32 %23, i32 %24, i32 %25)
  %26 = load i32, i32* %res1, align 4
  %27 = load i32, i32* %res2, align 4
  %cmp = icmp sgt i32 %26, %27
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %28 = load i32, i32* %res1, align 4
  store i32 %28, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %29 = load i32, i32* %res2, align 4
  store i32 %29, i32* %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %30 = load i32, i32* %retval
  ret i32 %30
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %0 = load i32, i32* @a, align 4
  %1 = load i32, i32* @b, align 4
  %2 = load i32, i32* @c, align 4
  %3 = load i32, i32* @d, align 4
  %4 = load i32, i32* @e, align 4
  %5 = load i32, i32* @f, align 4
  %6 = load i32, i32* @g, align 4
  %7 = load i32, i32* @h, align 4
  %8 = load i32, i32* @i, align 4
  %9 = load i32, i32* @j, align 4
  %10 = load i32, i32* @k, align 4
  %call = call i32 @func(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10)
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str2, i32 0, i32 0), i32 %call)
  %11 = load i32, i32* @c, align 4
  %12 = load i32, i32* @b, align 4
  %13 = load i32, i32* @a, align 4
  %14 = load i32, i32* @d, align 4
  %15 = load i32, i32* @e, align 4
  %16 = load i32, i32* @f, align 4
  %17 = load i32, i32* @g, align 4
  %18 = load i32, i32* @h, align 4
  %19 = load i32, i32* @i, align 4
  %20 = load i32, i32* @j, align 4
  %21 = load i32, i32* @k, align 4
  %call2 = call i32 @func(i32 %11, i32 %12, i32 %13, i32 %14, i32 %15, i32 %16, i32 %17, i32 %18, i32 %19, i32 %20, i32 %21)
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str2, i32 0, i32 0), i32 %call2)
  ret i32 0
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"}
