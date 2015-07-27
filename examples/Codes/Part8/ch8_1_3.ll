; ModuleID = 'ch8_1_3.cpp'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 5, i32* %b, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp eq i32 %0, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %a, align 4
  %2 = load i32, i32* %i, align 4
  %add = add nsw i32 %1, %2
  store i32 %add, i32* %a, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc5, %for.end
  %4 = load i32, i32* %i, align 4
  %cmp2 = icmp ne i32 %4, 3
  br i1 %cmp2, label %for.body3, label %for.end7

for.body3:                                        ; preds = %for.cond1
  %5 = load i32, i32* %a, align 4
  %6 = load i32, i32* %i, align 4
  %add4 = add nsw i32 %5, %6
  store i32 %add4, i32* %a, align 4
  br label %for.inc5

for.inc5:                                         ; preds = %for.body3
  %7 = load i32, i32* %i, align 4
  %inc6 = add nsw i32 %7, 1
  store i32 %inc6, i32* %i, align 4
  br label %for.cond1

for.end7:                                         ; preds = %for.cond1
  store i32 0, i32* %i, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc12, %for.end7
  %8 = load i32, i32* %i, align 4
  %cmp9 = icmp sgt i32 %8, 3
  br i1 %cmp9, label %for.body10, label %for.end14

for.body10:                                       ; preds = %for.cond8
  %9 = load i32, i32* %a, align 4
  %10 = load i32, i32* %i, align 4
  %add11 = add nsw i32 %9, %10
  store i32 %add11, i32* %a, align 4
  br label %for.inc12

for.inc12:                                        ; preds = %for.body10
  %11 = load i32, i32* %i, align 4
  %inc13 = add nsw i32 %11, 1
  store i32 %inc13, i32* %i, align 4
  br label %for.cond8

for.end14:                                        ; preds = %for.cond8
  store i32 0, i32* %i, align 4
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc19, %for.end14
  %12 = load i32, i32* %i, align 4
  %cmp16 = icmp sgt i32 %12, 3
  br i1 %cmp16, label %for.body17, label %for.end21

for.body17:                                       ; preds = %for.cond15
  %13 = load i32, i32* %a, align 4
  %14 = load i32, i32* %i, align 4
  %add18 = add nsw i32 %13, %14
  store i32 %add18, i32* %a, align 4
  br label %for.inc19

for.inc19:                                        ; preds = %for.body17
  %15 = load i32, i32* %i, align 4
  %inc20 = add nsw i32 %15, 1
  store i32 %inc20, i32* %i, align 4
  br label %for.cond15

for.end21:                                        ; preds = %for.cond15
  store i32 0, i32* %i, align 4
  br label %for.cond22

for.cond22:                                       ; preds = %for.inc26, %for.end21
  %16 = load i32, i32* %i, align 4
  %17 = load i32, i32* %b, align 4
  %cmp23 = icmp eq i32 %16, %17
  br i1 %cmp23, label %for.body24, label %for.end28

for.body24:                                       ; preds = %for.cond22
  %18 = load i32, i32* %a, align 4
  %inc25 = add nsw i32 %18, 1
  store i32 %inc25, i32* %a, align 4
  br label %for.inc26

for.inc26:                                        ; preds = %for.body24
  %19 = load i32, i32* %i, align 4
  %inc27 = add nsw i32 %19, 1
  store i32 %inc27, i32* %i, align 4
  br label %for.cond22

for.end28:                                        ; preds = %for.cond22
  store i32 0, i32* %i, align 4
  br label %for.cond29

for.cond29:                                       ; preds = %for.inc33, %for.end28
  %20 = load i32, i32* %i, align 4
  %21 = load i32, i32* %b, align 4
  %cmp30 = icmp ne i32 %20, %21
  br i1 %cmp30, label %for.body31, label %for.end35

for.body31:                                       ; preds = %for.cond29
  %22 = load i32, i32* %a, align 4
  %inc32 = add nsw i32 %22, 1
  store i32 %inc32, i32* %a, align 4
  br label %for.inc33

for.inc33:                                        ; preds = %for.body31
  %23 = load i32, i32* %i, align 4
  %inc34 = add nsw i32 %23, 1
  store i32 %inc34, i32* %i, align 4
  br label %for.cond29

for.end35:                                        ; preds = %for.cond29
  store i32 0, i32* %i, align 4
  br label %for.cond36

for.cond36:                                       ; preds = %for.inc40, %for.end35
  %24 = load i32, i32* %i, align 4
  %25 = load i32, i32* %b, align 4
  %cmp37 = icmp slt i32 %24, %25
  br i1 %cmp37, label %for.body38, label %for.end42

for.body38:                                       ; preds = %for.cond36
  %26 = load i32, i32* %a, align 4
  %inc39 = add nsw i32 %26, 1
  store i32 %inc39, i32* %a, align 4
  br label %for.inc40

for.inc40:                                        ; preds = %for.body38
  %27 = load i32, i32* %i, align 4
  %inc41 = add nsw i32 %27, 1
  store i32 %inc41, i32* %i, align 4
  br label %for.cond36

for.end42:                                        ; preds = %for.cond36
  store i32 7, i32* %i, align 4
  br label %for.cond43

for.cond43:                                       ; preds = %for.inc46, %for.end42
  %28 = load i32, i32* %i, align 4
  %29 = load i32, i32* %b, align 4
  %cmp44 = icmp sgt i32 %28, %29
  br i1 %cmp44, label %for.body45, label %for.end48

for.body45:                                       ; preds = %for.cond43
  %30 = load i32, i32* %a, align 4
  %dec = add nsw i32 %30, -1
  store i32 %dec, i32* %a, align 4
  br label %for.inc46

for.inc46:                                        ; preds = %for.body45
  %31 = load i32, i32* %i, align 4
  %dec47 = add nsw i32 %31, -1
  store i32 %dec47, i32* %i, align 4
  br label %for.cond43

for.end48:                                        ; preds = %for.cond43
  store i32 0, i32* %i, align 4
  br label %for.cond49

for.cond49:                                       ; preds = %for.inc53, %for.end48
  %32 = load i32, i32* %i, align 4
  %33 = load i32, i32* %b, align 4
  %cmp50 = icmp sle i32 %32, %33
  br i1 %cmp50, label %for.body51, label %for.end55

for.body51:                                       ; preds = %for.cond49
  %34 = load i32, i32* %a, align 4
  %inc52 = add nsw i32 %34, 1
  store i32 %inc52, i32* %a, align 4
  br label %for.inc53

for.inc53:                                        ; preds = %for.body51
  %35 = load i32, i32* %i, align 4
  %inc54 = add nsw i32 %35, 1
  store i32 %inc54, i32* %i, align 4
  br label %for.cond49

for.end55:                                        ; preds = %for.cond49
  br label %label_1

label_1:                                          ; preds = %if.then71, %for.end55
  store i32 7, i32* %i, align 4
  br label %for.cond56

for.cond56:                                       ; preds = %for.inc60, %label_1
  %36 = load i32, i32* %i, align 4
  %37 = load i32, i32* %b, align 4
  %cmp57 = icmp sge i32 %36, %37
  br i1 %cmp57, label %for.body58, label %for.end62

for.body58:                                       ; preds = %for.cond56
  %38 = load i32, i32* %a, align 4
  %dec59 = add nsw i32 %38, -1
  store i32 %dec59, i32* %a, align 4
  br label %for.inc60

for.inc60:                                        ; preds = %for.body58
  %39 = load i32, i32* %i, align 4
  %dec61 = add nsw i32 %39, -1
  store i32 %dec61, i32* %i, align 4
  br label %for.cond56

for.end62:                                        ; preds = %for.cond56
  br label %while.cond

while.cond:                                       ; preds = %if.end69, %if.then, %for.end62
  %40 = load i32, i32* %i, align 4
  %cmp63 = icmp slt i32 %40, 7
  br i1 %cmp63, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %41 = load i32, i32* %a, align 4
  %inc64 = add nsw i32 %41, 1
  store i32 %inc64, i32* %a, align 4
  %42 = load i32, i32* %i, align 4
  %inc65 = add nsw i32 %42, 1
  store i32 %inc65, i32* %i, align 4
  %43 = load i32, i32* %a, align 4
  %cmp66 = icmp sge i32 %43, 4
  br i1 %cmp66, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  br label %while.cond

if.else:                                          ; preds = %while.body
  %44 = load i32, i32* %a, align 4
  %cmp67 = icmp eq i32 %44, 3
  br i1 %cmp67, label %if.then68, label %if.end

if.then68:                                        ; preds = %if.else
  br label %while.end

if.end:                                           ; preds = %if.else
  br label %if.end69

if.end69:                                         ; preds = %if.end
  br label %while.cond

while.end:                                        ; preds = %if.then68, %while.cond
  %45 = load i32, i32* %a, align 4
  %cmp70 = icmp eq i32 %45, 3
  br i1 %cmp70, label %if.then71, label %if.end72

if.then71:                                        ; preds = %while.end
  br label %label_1

if.end72:                                         ; preds = %while.end
  %46 = load i32, i32* %a, align 4
  switch i32 %46, label %sw.default [
    i32 1, label %sw.bb
    i32 2, label %sw.bb74
  ]

sw.bb:                                            ; preds = %if.end72
  %47 = load i32, i32* %a, align 4
  %add73 = add nsw i32 %47, 1
  store i32 %add73, i32* %a, align 4
  br label %sw.epilog

sw.bb74:                                          ; preds = %if.end72
  %48 = load i32, i32* %a, align 4
  %add75 = add nsw i32 %48, 2
  store i32 %add75, i32* %a, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %if.end72
  %49 = load i32, i32* %a, align 4
  %add76 = add nsw i32 %49, 8
  store i32 %add76, i32* %a, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb74, %sw.bb
  %50 = load i32, i32* %a, align 4
  ret i32 %50
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
