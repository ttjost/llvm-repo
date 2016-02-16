; ModuleID = 'bunch_args_v2.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@a = global i32 100, align 4
@b = global i32 2, align 4
@c = global i32 101, align 4
@d = global i32 106, align 4
@e = global i32 110, align 4
@f = global i32 116, align 4
@g = global i32 111, align 4
@h = global i32 121, align 4
@i = global i32 131, align 4
@j = global i8 -115, align 1
@k = global i16 -10, align 2
@.str = private unnamed_addr constant [15 x i8] c"%d  %d   =>   \00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind
define i32 @func(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g, i32 %h, i32 %i, i8 signext %j, i16 signext %k) #0 {
entry:
  %div = sdiv i32 %a, %b
  %mul = mul nsw i32 %d, %c
  %add = add i32 %mul, %e
  %add1 = add i32 %add, %div
  %conv = sext i8 %j to i32
  %conv8 = sext i16 %k to i32
  %add3 = add i32 %g, %f
  %add4 = add i32 %add3, %h
  %add5 = add i32 %add4, %i
  %add6 = add i32 %add5, %conv
  %add7 = add i32 %add6, %conv8
  %add9 = add i32 %add7, %div
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), i32 %add1, i32 %add9) #1
  %cmp = icmp sgt i32 %add1, %add9
  %add1.add9 = select i1 %cmp, i32 %add1, i32 %add9
  ret i32 %add1.add9
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #0

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %0 = load i32, i32* @a, align 4, !tbaa !1
  %1 = load i32, i32* @b, align 4, !tbaa !1
  %2 = load i32, i32* @c, align 4, !tbaa !1
  %3 = load i32, i32* @d, align 4, !tbaa !1
  %4 = load i32, i32* @e, align 4, !tbaa !1
  %5 = load i32, i32* @f, align 4, !tbaa !1
  %6 = load i32, i32* @g, align 4, !tbaa !1
  %7 = load i32, i32* @h, align 4, !tbaa !1
  %8 = load i32, i32* @i, align 4, !tbaa !1
  %9 = load i8, i8* @j, align 1, !tbaa !5
  %10 = load i16, i16* @k, align 2, !tbaa !6
  %call = tail call i32 @func(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i8 signext %9, i16 signext %10)
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str1, i32 0, i32 0), i32 %call) #1
  %11 = load i32, i32* @c, align 4, !tbaa !1
  %12 = load i32, i32* @b, align 4, !tbaa !1
  %13 = load i32, i32* @a, align 4, !tbaa !1
  %14 = load i32, i32* @d, align 4, !tbaa !1
  %15 = load i32, i32* @e, align 4, !tbaa !1
  %16 = load i32, i32* @f, align 4, !tbaa !1
  %17 = load i32, i32* @g, align 4, !tbaa !1
  %18 = load i32, i32* @h, align 4, !tbaa !1
  %19 = load i32, i32* @i, align 4, !tbaa !1
  %20 = load i8, i8* @j, align 1, !tbaa !5
  %21 = load i16, i16* @k, align 2, !tbaa !6
  %call2 = tail call i32 @func(i32 %11, i32 %12, i32 %13, i32 %14, i32 %15, i32 %16, i32 %17, i32 %18, i32 %19, i8 signext %20, i16 signext %21)
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str1, i32 0, i32 0), i32 %call2) #1
  ret i32 0
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!3, !3, i64 0}
!6 = !{!7, !7, i64 0}
!7 = !{!"short", !3, i64 0}
