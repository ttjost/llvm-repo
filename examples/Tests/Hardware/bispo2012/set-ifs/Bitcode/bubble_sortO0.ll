; ModuleID = 'bubble_sort.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@ar = global [64 x i32] [i32 -1155484576, i32 -723955400, i32 1033096058, i32 -1690734402, i32 -1557280266, i32 1327362106, i32 -1930858313, i32 502539523, i32 -1728529858, i32 -938301587, i32 1431162155, i32 1085665355, i32 1654374947, i32 -1661998771, i32 -65105105, i32 -73789608, i32 -518907128, i32 99135751, i32 -252332814, i32 755814641, i32 1180918287, i32 1344049776, i32 553609048, i32 1580443894, i32 629649304, i32 -1266264776, i32 99807007, i32 5955764, i32 -1946737912, i32 39620447, i32 -152527805, i32 -1877116806, i32 448784075, i32 1086124775, i32 -1609984092, i32 1227951724, i32 1764356251, i32 64111306, i32 -960731419, i32 -100082026, i32 -39845375, i32 -1339022546, i32 2092649110, i32 -568315836, i32 -1089884900, i32 -81839914, i32 -1146103148, i32 -1846688624, i32 -784703072, i32 55004124, i32 -691960657, i32 1770461755, i32 -2032810463, i32 -1177788003, i32 -432352882, i32 -65824064, i32 575267217, i32 -1949367821, i32 356750287, i32 798819494, i32 -92022521, i32 1318001577, i32 -1192467086, i32 -1412716779], align 4

; Function Attrs: nounwind
define void @bubblesort(i32* %ar, i32 %n) #0 {
entry:
  %ar.addr = alloca i32*, align 4
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %temp = alloca i32, align 4
  store i32* %ar, i32** %ar.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc12, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %n.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end14

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4
  %3 = load i32, i32* %n.addr, align 4
  %sub = sub nsw i32 %3, 1
  %cmp2 = icmp slt i32 %2, %sub
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %4 = load i32, i32* %j, align 4
  %5 = load i32*, i32** %ar.addr, align 4
  %arrayidx = getelementptr inbounds i32, i32* %5, i32 %4
  %6 = load i32, i32* %arrayidx, align 4
  %7 = load i32, i32* %j, align 4
  %add = add nsw i32 %7, 1
  %8 = load i32*, i32** %ar.addr, align 4
  %arrayidx4 = getelementptr inbounds i32, i32* %8, i32 %add
  %9 = load i32, i32* %arrayidx4, align 4
  %cmp5 = icmp sgt i32 %6, %9
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body3
  %10 = load i32, i32* %j, align 4
  %add6 = add nsw i32 %10, 1
  %11 = load i32*, i32** %ar.addr, align 4
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i32 %add6
  %12 = load i32, i32* %arrayidx7, align 4
  store i32 %12, i32* %temp, align 4
  %13 = load i32, i32* %j, align 4
  %14 = load i32*, i32** %ar.addr, align 4
  %arrayidx8 = getelementptr inbounds i32, i32* %14, i32 %13
  %15 = load i32, i32* %arrayidx8, align 4
  %16 = load i32, i32* %j, align 4
  %add9 = add nsw i32 %16, 1
  %17 = load i32*, i32** %ar.addr, align 4
  %arrayidx10 = getelementptr inbounds i32, i32* %17, i32 %add9
  store i32 %15, i32* %arrayidx10, align 4
  %18 = load i32, i32* %temp, align 4
  %19 = load i32, i32* %j, align 4
  %20 = load i32*, i32** %ar.addr, align 4
  %arrayidx11 = getelementptr inbounds i32, i32* %20, i32 %19
  store i32 %18, i32* %arrayidx11, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %21 = load i32, i32* %j, align 4
  %inc = add nsw i32 %21, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc12

for.inc12:                                        ; preds = %for.end
  %22 = load i32, i32* %i, align 4
  %inc13 = add nsw i32 %22, 1
  store i32 %inc13, i32* %i, align 4
  br label %for.cond

for.end14:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  call void @bubblesort(i32* getelementptr inbounds ([64 x i32], [64 x i32]* @ar, i32 0, i32 0), i32 64)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 63
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [64 x i32], [64 x i32]* @ar, i32 0, i32 %1
  %2 = load i32, i32* %arrayidx, align 4
  %3 = load i32, i32* %i, align 4
  %add = add nsw i32 %3, 1
  %arrayidx1 = getelementptr inbounds [64 x i32], [64 x i32]* @ar, i32 0, i32 %add
  %4 = load i32, i32* %arrayidx1, align 4
  %cmp2 = icmp sgt i32 %2, %4
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4
  %add3 = add nsw i32 %5, 10
  store i32 %add3, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %6 = load i32, i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 -1, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then
  %7 = load i32, i32* %retval
  ret i32 %7
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
