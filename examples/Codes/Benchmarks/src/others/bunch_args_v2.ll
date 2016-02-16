; ModuleID = 'bunch_args_v2.c'
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
@j = global i8 10, align 1
@k = global i16 -10, align 2
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind readnone
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
  %cmp = icmp sgt i32 %add1, %add9
  %add1.add9 = select i1 %cmp, i32 %add1, i32 %add9
  ret i32 %add1.add9
}

; Function Attrs: nounwind
define i32 @main() #1 {
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
  %div.i = sdiv i32 %0, %1
  %mul.i = mul nsw i32 %3, %2
  %add.i = add i32 %mul.i, %4
  %add1.i = add i32 %add.i, %div.i
  %conv.i = sext i8 %9 to i32
  %conv8.i = sext i16 %10 to i32
  %add3.i = add i32 %6, %5
  %add4.i = add i32 %add3.i, %7
  %add5.i = add i32 %add4.i, %8
  %add6.i = add i32 %add5.i, %conv.i
  %add7.i = add i32 %add6.i, %conv8.i
  %add9.i = add i32 %add7.i, %div.i
  %cmp.i = icmp sgt i32 %add1.i, %add9.i
  %add1.add9.i = select i1 %cmp.i, i32 %add1.i, i32 %add9.i
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %add1.add9.i) #2
  %11 = load i32, i32* @b, align 4, !tbaa !1
  %12 = load i32, i32* @c, align 4, !tbaa !1
  %13 = load i32, i32* @a, align 4, !tbaa !1
  %14 = load i32, i32* @d, align 4, !tbaa !1
  %15 = load i32, i32* @e, align 4, !tbaa !1
  %16 = load i32, i32* @f, align 4, !tbaa !1
  %17 = load i32, i32* @g, align 4, !tbaa !1
  %18 = load i32, i32* @h, align 4, !tbaa !1
  %19 = load i32, i32* @i, align 4, !tbaa !1
  %20 = load i8, i8* @j, align 1, !tbaa !5
  %21 = load i16, i16* @k, align 2, !tbaa !6
  %div.i4 = sdiv i32 %11, %12
  %mul.i5 = mul nsw i32 %14, %13
  %add.i6 = add i32 %mul.i5, %15
  %add1.i7 = add i32 %add.i6, %div.i4
  %conv.i8 = sext i8 %20 to i32
  %conv8.i9 = sext i16 %21 to i32
  %add3.i10 = add i32 %17, %16
  %add4.i11 = add i32 %add3.i10, %18
  %add5.i12 = add i32 %add4.i11, %19
  %add6.i13 = add i32 %add5.i12, %conv.i8
  %add7.i14 = add i32 %add6.i13, %conv8.i9
  %add9.i15 = add i32 %add7.i14, %div.i4
  %cmp.i16 = icmp sgt i32 %add1.i7, %add9.i15
  %add1.add9.i17 = select i1 %cmp.i16, i32 %add1.i7, i32 %add9.i15
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %add1.add9.i17) #2
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

attributes #0 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!3, !3, i64 0}
!6 = !{!7, !7, i64 0}
!7 = !{!"short", !3, i64 0}
