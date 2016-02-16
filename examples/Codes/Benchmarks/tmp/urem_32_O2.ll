; ModuleID = 'urem.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@a = global i32 -10, align 4
@b = global i32 2, align 4
@c = global i32 5, align 4
@ua = global i32 10, align 4
@ub = global i32 2, align 4
@uc = global i32 5, align 4
@key = common global i32 0, align 4
@str = private unnamed_addr constant [4 x i8] c"666\00"
@str2 = private unnamed_addr constant [3 x i8] c"-1\00"

; Function Attrs: noimplicitfloat nounwind
define i32 @division() #0 {
entry:
  %0 = load i32, i32* @ua, align 4, !tbaa !1
  %1 = load i32, i32* @uc, align 4, !tbaa !1
  %rem = urem i32 %0, %1
  %2 = load i32, i32* @ub, align 4, !tbaa !1
  %rem1 = urem i32 %0, %2
  %add = add i32 %rem1, %rem
  %rem2 = urem i32 %1, %2
  %add3 = add i32 %add, %rem2
  %3 = load i32, i32* @a, align 4, !tbaa !1
  %4 = load i32, i32* @b, align 4, !tbaa !1
  %rem4 = srem i32 %3, %4
  %add5 = add i32 %add3, %rem4
  store i32 %add5, i32* @ua, align 4, !tbaa !1
  ret i32 %add5
}

; Function Attrs: noimplicitfloat nounwind
define i32 @main() #0 {
entry:
  %0 = load i32, i32* @ua, align 4, !tbaa !1
  %1 = load i32, i32* @uc, align 4, !tbaa !1
  %rem.i = urem i32 %0, %1
  %2 = load i32, i32* @ub, align 4, !tbaa !1
  %rem1.i = urem i32 %0, %2
  %add.i = add i32 %rem1.i, %rem.i
  %rem2.i = urem i32 %1, %2
  %add3.i = add i32 %add.i, %rem2.i
  %3 = load i32, i32* @a, align 4, !tbaa !1
  %4 = load i32, i32* @b, align 4, !tbaa !1
  %rem4.i = srem i32 %3, %4
  %add5.i = add i32 %add3.i, %rem4.i
  store i32 %add5.i, i32* @ua, align 4, !tbaa !1
  %cmp = icmp eq i32 %add5.i, 7
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %puts3 = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str2, i32 0, i32 0))
  br label %if.end

if.else:                                          ; preds = %entry
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #1

attributes #0 = { noimplicitfloat nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
