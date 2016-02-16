; ModuleID = 'conv_3x3_print.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@inptr = constant [450 x i8] c"`8z\BE\F6:\B7\03>m+K#M/X\08\07\F2\F1\0FpX\F6\988\1F\B4\08_Cz\CB\E7\A4l\9B\CA\E5\96\01.\96D\1C\D6\94\90\A0\DC\AF;!\9D\8E\C0\91\F3\CF\A6\07\A9r\15\C1+w\ACl}\C4\91\A2nL\C9\B3\0Cn\C8\A7Z\9AK\83@:f\CB\C2\CE\D8HtY\A6\0B-\FB\E6\B1\FA\DF\DB\E7VVB0\97D\EB\E5\AA\BA\8A}\02\E4\CE\0E\CD%\B3\14h\80\14p\159\83\B2\EB\BB\5C\9A\0D\BC\17\DB\1E\9E\DE#\F4\18_W\8B\15\E2#;\DC\9D\B1-pG\B7\0B9\EA\B7\F6\E3\FD\82\BD\85\B1\FDJ\06\8B'_\BC2Z\82U\8A\D06\FA\00hk\B1'\AA6\02\84\08\C4\DD\A5f\8C\BAx\DC\C4\01\D9\BA\15\ADl\CC\91+\AC\DE\E4\87D\82\C9\CA\9D\10\C0\9D\B7\ED\FD1<\10\A3b\D2\C21\1A\B0\A4<\F3t\F6^ 2\15n\8D\D0E\F1C\90\B1\CF\11\ED\AFIh\ABG*\86)\F5<\D7\F9\AE\FD\97\B2 \92\BB\04>\FC\11\0C\FB\89\A6\E8T\8Cg\8E\94P\0A\D9\D3I.\E4\BF\8C\C0\9B\9E\80\A1\8E\93\D5\85\08\1F\B5\1E`\EA:x\8E\C3\1F\A6\00\E5\B9\9E\AE|'alg\C8^~>\ED\18q\95\CF\06(\82\C3\B94\5C\ABDi\C5\AF\D7\AD\EB-\AD\13\0A\ED('4\999\8BTk\05\C2p(\C5K-L\ED\F1\98\86\90a#f\02\FD\ECT\BE\EFE\C4\8A\7Fp\A7\D8\A9\AA$o\EAj\87JZ\EAy\C0\FF\E6q\E4_\A3j.V2\D6Z*\F5\D2\90\DCb\9A\C4\C0\06>_O\CD\95\1E<\80r:\C4\8E\15\C9J\0E\E4", align 1
@mask = constant [9 x i8] c"s\D8o\92\FC\F0\E5\DD\D5", align 1
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind
define void @IMG_conv_3x3_c(i8* nocapture readonly %inptr, i8* nocapture %outptr, i32 %x_dim, i8* nocapture readonly %mask, i32 %shift) #0 {
entry:
  %cmp63 = icmp sgt i32 %x_dim, 0
  br i1 %cmp63, label %for.cond2.preheader.lr.ph, label %for.end39

for.cond2.preheader.lr.ph:                        ; preds = %entry
  %add.ptr.sum = shl i32 %x_dim, 1
  %add.ptr1 = getelementptr inbounds i8, i8* %inptr, i32 %add.ptr.sum
  %add.ptr = getelementptr inbounds i8, i8* %inptr, i32 %x_dim
  %arrayidx11 = getelementptr inbounds i8, i8* %mask, i32 3
  %arrayidx14 = getelementptr inbounds i8, i8* %mask, i32 6
  %arrayidx9.1 = getelementptr inbounds i8, i8* %mask, i32 1
  %arrayidx11.1 = getelementptr inbounds i8, i8* %mask, i32 4
  %arrayidx14.1 = getelementptr inbounds i8, i8* %mask, i32 7
  %arrayidx9.2 = getelementptr inbounds i8, i8* %mask, i32 2
  %arrayidx11.2 = getelementptr inbounds i8, i8* %mask, i32 5
  %arrayidx14.2 = getelementptr inbounds i8, i8* %mask, i32 8
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.cond2.preheader, %for.cond2.preheader.lr.ph
  %j.068 = phi i32 [ 0, %for.cond2.preheader.lr.ph ], [ %inc38, %for.cond2.preheader ]
  %IN1.067 = phi i8* [ %inptr, %for.cond2.preheader.lr.ph ], [ %arrayidx.1, %for.cond2.preheader ]
  %IN2.066 = phi i8* [ %add.ptr, %for.cond2.preheader.lr.ph ], [ %arrayidx5.1, %for.cond2.preheader ]
  %IN3.065 = phi i8* [ %add.ptr1, %for.cond2.preheader.lr.ph ], [ %arrayidx7.1, %for.cond2.preheader ]
  %OUT.064 = phi i8* [ %outptr, %for.cond2.preheader.lr.ph ], [ %incdec.ptr36, %for.cond2.preheader ]
  %0 = load i8, i8* %IN1.067, align 1, !tbaa !1
  %1 = load i8, i8* %IN2.066, align 1, !tbaa !1
  %2 = load i8, i8* %IN3.065, align 1, !tbaa !1
  %3 = load i8, i8* %mask, align 1, !tbaa !1
  %4 = load i8, i8* %arrayidx11, align 1, !tbaa !1
  %5 = load i8, i8* %arrayidx14, align 1, !tbaa !1
  %conv16 = zext i8 %0 to i32
  %conv17 = sext i8 %3 to i32
  %mul = mul nsw i32 %conv17, %conv16
  %conv18 = zext i8 %1 to i32
  %conv19 = sext i8 %4 to i32
  %mul20 = mul nsw i32 %conv19, %conv18
  %conv21 = zext i8 %2 to i32
  %conv22 = sext i8 %5 to i32
  %mul23 = mul nsw i32 %conv22, %conv21
  %add25 = add i32 %mul, %mul20
  %add26 = add i32 %add25, %mul23
  %arrayidx.1 = getelementptr inbounds i8, i8* %IN1.067, i32 1
  %6 = load i8, i8* %arrayidx.1, align 1, !tbaa !1
  %arrayidx5.1 = getelementptr inbounds i8, i8* %IN2.066, i32 1
  %7 = load i8, i8* %arrayidx5.1, align 1, !tbaa !1
  %arrayidx7.1 = getelementptr inbounds i8, i8* %IN3.065, i32 1
  %8 = load i8, i8* %arrayidx7.1, align 1, !tbaa !1
  %9 = load i8, i8* %arrayidx9.1, align 1, !tbaa !1
  %10 = load i8, i8* %arrayidx11.1, align 1, !tbaa !1
  %11 = load i8, i8* %arrayidx14.1, align 1, !tbaa !1
  %conv16.1 = zext i8 %6 to i32
  %conv17.1 = sext i8 %9 to i32
  %mul.1 = mul nsw i32 %conv17.1, %conv16.1
  %conv18.1 = zext i8 %7 to i32
  %conv19.1 = sext i8 %10 to i32
  %mul20.1 = mul nsw i32 %conv19.1, %conv18.1
  %conv21.1 = zext i8 %8 to i32
  %conv22.1 = sext i8 %11 to i32
  %mul23.1 = mul nsw i32 %conv22.1, %conv21.1
  %add24.1 = add i32 %mul.1, %add26
  %add25.1 = add i32 %add24.1, %mul20.1
  %add26.1 = add i32 %add25.1, %mul23.1
  %arrayidx.2 = getelementptr inbounds i8, i8* %IN1.067, i32 2
  %12 = load i8, i8* %arrayidx.2, align 1, !tbaa !1
  %arrayidx5.2 = getelementptr inbounds i8, i8* %IN2.066, i32 2
  %13 = load i8, i8* %arrayidx5.2, align 1, !tbaa !1
  %arrayidx7.2 = getelementptr inbounds i8, i8* %IN3.065, i32 2
  %14 = load i8, i8* %arrayidx7.2, align 1, !tbaa !1
  %15 = load i8, i8* %arrayidx9.2, align 1, !tbaa !1
  %16 = load i8, i8* %arrayidx11.2, align 1, !tbaa !1
  %17 = load i8, i8* %arrayidx14.2, align 1, !tbaa !1
  %conv16.2 = zext i8 %12 to i32
  %conv17.2 = sext i8 %15 to i32
  %mul.2 = mul nsw i32 %conv17.2, %conv16.2
  %conv18.2 = zext i8 %13 to i32
  %conv19.2 = sext i8 %16 to i32
  %mul20.2 = mul nsw i32 %conv19.2, %conv18.2
  %conv21.2 = zext i8 %14 to i32
  %conv22.2 = sext i8 %17 to i32
  %mul23.2 = mul nsw i32 %conv22.2, %conv21.2
  %add24.2 = add i32 %mul.2, %add26.1
  %add25.2 = add i32 %add24.2, %mul20.2
  %add26.2 = add i32 %add25.2, %mul23.2
  %shr = ashr i32 %add26.2, %shift
  %cmp29 = icmp slt i32 %shr, 0
  %.shr = select i1 %cmp29, i32 0, i32 %shr
  %cmp31 = icmp sgt i32 %.shr, 255
  %18 = trunc i32 %.shr to i8
  %conv35 = select i1 %cmp31, i8 -1, i8 %18
  %incdec.ptr36 = getelementptr inbounds i8, i8* %OUT.064, i32 1
  store i8 %conv35, i8* %OUT.064, align 1, !tbaa !1
  %inc38 = add nuw nsw i32 %j.068, 1
  %exitcond = icmp eq i32 %inc38, %x_dim
  br i1 %exitcond, label %for.end39.loopexit, label %for.cond2.preheader

for.end39.loopexit:                               ; preds = %for.cond2.preheader
  br label %for.end39

for.end39:                                        ; preds = %for.end39.loopexit, %entry
  ret void
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %outptr = alloca [150 x i8], align 1
  %0 = getelementptr inbounds [150 x i8], [150 x i8]* %outptr, i32 0, i32 0
  call void @llvm.lifetime.start(i64 150, i8* %0) #1
  call void @IMG_conv_3x3_c(i8* getelementptr inbounds ([450 x i8], [450 x i8]* @inptr, i32 0, i32 0), i8* %0, i32 150, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @mask, i32 0, i32 0), i32 0)
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %i.03 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %outptr, i32 0, i32 %i.03
  %1 = load i8, i8* %arrayidx, align 1, !tbaa !1
  %conv = zext i8 %1 to i32
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv) #1
  %inc = add nuw nsw i32 %i.03, 1
  %exitcond = icmp eq i32 %inc, 150
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  call void @llvm.lifetime.end(i64 150, i8* %0) #1
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #0

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
