; ModuleID = '/home/hugo/Documents/uni/thesis/vex_benchmark/memset.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

; Function Attrs: nounwind
define i8* @memset(i8* %b, i32 %c, i32 %len) #0 {
entry:
  %b.addr = alloca i8*, align 4
  %c.addr = alloca i32, align 4
  %len.addr = alloca i32, align 4
  %bb = alloca i8*, align 4
  %bc = alloca i8*, align 4
  %ci = alloca i32, align 4
  %bi = alloca i32*, align 4
  %bc14 = alloca i8*, align 4
  store i8* %b, i8** %b.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  %0 = load i8*, i8** %b.addr, align 4
  store i8* %0, i8** %bb, align 4
  %1 = load i8*, i8** %bb, align 4
  store i8* %1, i8** %bc, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i8*, i8** %bc, align 4
  %3 = ptrtoint i8* %2 to i32
  %and = and i32 %3, 3
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.cond
  %4 = load i32, i32* %len.addr, align 4
  %cmp = icmp ugt i32 %4, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond
  %5 = phi i1 [ false, %for.cond ], [ %cmp, %land.rhs ]
  br i1 %5, label %for.body, label %for.end

for.body:                                         ; preds = %land.end
  %6 = load i32, i32* %c.addr, align 4
  %conv = trunc i32 %6 to i8
  %7 = load i8*, i8** %bc, align 4
  store i8 %conv, i8* %7, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %len.addr, align 4
  %dec = add i32 %8, -1
  store i32 %dec, i32* %len.addr, align 4
  %9 = load i8*, i8** %bc, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %9, i32 1
  store i8* %incdec.ptr, i8** %bc, align 4
  br label %for.cond

for.end:                                          ; preds = %land.end
  %10 = load i8*, i8** %bc, align 4
  store i8* %10, i8** %bb, align 4
  %11 = load i32, i32* %len.addr, align 4
  %cmp1 = icmp ugt i32 %11, 3
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  %12 = load i32, i32* %c.addr, align 4
  %shl = shl i32 %12, 24
  %13 = load i32, i32* %c.addr, align 4
  %shl3 = shl i32 %13, 16
  %or = or i32 %shl, %shl3
  %14 = load i32, i32* %c.addr, align 4
  %shl4 = shl i32 %14, 8
  %or5 = or i32 %or, %shl4
  %15 = load i32, i32* %c.addr, align 4
  %or6 = or i32 %or5, %15
  store i32 %or6, i32* %ci, align 4
  %16 = load i8*, i8** %bb, align 4
  %17 = bitcast i8* %16 to i32*
  store i32* %17, i32** %bi, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc11, %if.then
  %18 = load i32, i32* %len.addr, align 4
  %cmp8 = icmp ugt i32 %18, 3
  br i1 %cmp8, label %for.body10, label %for.end13

for.body10:                                       ; preds = %for.cond7
  %19 = load i32, i32* %ci, align 4
  %20 = load i32*, i32** %bi, align 4
  store i32 %19, i32* %20, align 4
  br label %for.inc11

for.inc11:                                        ; preds = %for.body10
  %21 = load i32, i32* %len.addr, align 4
  %sub = sub i32 %21, 4
  store i32 %sub, i32* %len.addr, align 4
  %22 = load i32*, i32** %bi, align 4
  %incdec.ptr12 = getelementptr inbounds i32, i32* %22, i32 1
  store i32* %incdec.ptr12, i32** %bi, align 4
  br label %for.cond7

for.end13:                                        ; preds = %for.cond7
  %23 = load i32*, i32** %bi, align 4
  %24 = bitcast i32* %23 to i8*
  store i8* %24, i8** %bb, align 4
  br label %if.end

if.end:                                           ; preds = %for.end13, %for.end
  %25 = load i8*, i8** %bb, align 4
  store i8* %25, i8** %bc14, align 4
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc20, %if.end
  %26 = load i32, i32* %len.addr, align 4
  %cmp16 = icmp ugt i32 %26, 0
  br i1 %cmp16, label %for.body18, label %for.end23

for.body18:                                       ; preds = %for.cond15
  %27 = load i32, i32* %c.addr, align 4
  %conv19 = trunc i32 %27 to i8
  %28 = load i8*, i8** %bc14, align 4
  store i8 %conv19, i8* %28, align 1
  br label %for.inc20

for.inc20:                                        ; preds = %for.body18
  %29 = load i32, i32* %len.addr, align 4
  %dec21 = add i32 %29, -1
  store i32 %dec21, i32* %len.addr, align 4
  %30 = load i8*, i8** %bc14, align 4
  %incdec.ptr22 = getelementptr inbounds i8, i8* %30, i32 1
  store i8* %incdec.ptr22, i8** %bc14, align 4
  br label %for.cond15

for.end23:                                        ; preds = %for.cond15
  %31 = load i8*, i8** %b.addr, align 4
  ret i8* %31
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
