; ModuleID = 'compositing_print.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@image1 = global [200 x i8] c"`8z\BE\F6:\B7\03>m+K#M/X\08\07\F2\F1\0FpX\F6\988\1F\B4\08_Cz\CB\E7\A4l\9B\CA\E5\96\01.\96D\1C\D6\94\90\A0\DC\AF;!\9D\8E\C0\91\F3\CF\A6\07\A9r\15\C1+w\ACl}\C4\91\A2nL\C9\B3\0Cn\C8\A7Z\9AK\83@:f\CB\C2\CE\D8HtY\A6\0B-\FB\E6\B1\FA\DF\DB\E7VVB0\97D\EB\E5\AA\BA\8A}\02\E4\CE\0E\CD%\B3\14h\80\14p\159\83\B2\EB\BB\5C\9A\0D\BC\17\DB\1E\9E\DE#\F4\18_W\8B\15\E2#;\DC\9D\B1-pG\B7\0B9\EA\B7\F6\E3\FD\82\BD\85\B1\FDJ\06\8B'_\BC2Z\82U\8A\D06\FA\00hk\B1'\AA6\02\84\08\C4\DD\A5", align 1
@image2 = global [200 x i8] c"s\D8o\92\FC\F0\E5\DD\D5hr\12\BA~\B4\E4\B1\FC\A9;\81\98=6d\9E$s\FB\CC\EA\8D\81|G\E6C\08\B7\A5OiJ\02k!\B8\C0I[\B8\FB\F8O\91#\9C\EB\F0Ha\AF\FC\97\AC\D8\A8$\93\C0G\E9\8F\84e\0Ep\E7\D3j\90u\03IK\EB\96o\AE\D53]my\9A\D2\1A\F3\F8\94\94\A1|o\BC\C0)~oW\EE\A8\AFS\F3m#\F35\E2\C1fT\F9\C9\B1\AB\06\F4\D6\A1~\ED2>\01\00&\01\99\10\F9\EFD\CE\FD\EF\AF(\EFUD\FE\A3\BBf\1B\E0\17\FBb\88\0A*G\FCve\81\BER\A9\FDW\C0\04\15z_X\01i\DE]\8D\97\D1\EB\0C\8E\C7y\8C\12\9B\E0J\86\0Ae", align 1
@imageR = global [200 x i8] c"9\F8\90\17\EA\CD\5CN\0Fy\9C\BD\F4\EC$@\B7\1E\85^,\1F\8Eu\01m\157\22\85\F7T^\BC\5CxJN?xe\B7-\C7|AL.P\DE\9E\BCu7\87\FA|\04\8CcT\9D]\12\ED\D1\15\BD\1D\F6\BF\E1\C7A\1B>9W\A2\86\D6#\C8P\F4\EA\80R\07\9C\05\CF\FEk\D6N\ED\A1\01\8C\EB\AE\A4\B3=\80\B0\CB\B3\17\F0oRXI\C42 C\A7\A9\9B\C7%\A9\D7*/f\93j\8E;]\B6\14\CE\DB3\13qh\FD\13\CB\E2k\BE\B7\C1\96\1Fkl\1C\0B\DD\C7!\DFa\10\96k\96\EB\BD-\83\BA\EC\C1\FC2\90\98J+t\E8\0A\B6C\E3UtK*!%\83\84\E6\7F\CF\CA\84@\81&", align 1
@fades = global [10 x i8] c"L\98\85\EA\F0\84\8A(\A6s", align 1
@.str = private unnamed_addr constant [6 x i8] c"%lu, \00", align 1

; Function Attrs: nounwind
define void @compositing(i8* nocapture readonly %image1, i8* nocapture readonly %image2, i8* nocapture %imageR, i32 %nelem, i8 zeroext %fade) #0 {
entry:
  %cmp22 = icmp sgt i32 %nelem, 0
  br i1 %cmp22, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %conv4 = zext i8 %fade to i32
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %image1.addr.026 = phi i8* [ %image1, %for.body.lr.ph ], [ %incdec.ptr, %for.body ]
  %i.025 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %image2.addr.024 = phi i8* [ %image2, %for.body.lr.ph ], [ %incdec.ptr11, %for.body ]
  %imageR.addr.023 = phi i8* [ %imageR, %for.body.lr.ph ], [ %incdec.ptr12, %for.body ]
  %0 = load i8, i8* %image1.addr.026, align 1, !tbaa !1
  %conv = zext i8 %0 to i32
  %1 = load i8, i8* %image2.addr.024, align 1, !tbaa !1
  %conv1 = zext i8 %1 to i32
  %sub = sub nsw i32 %conv, %conv1
  %cmp2 = icmp slt i32 %sub, 0
  %.sub = select i1 %cmp2, i32 0, i32 %sub
  %mul = mul nsw i32 %.sub, %conv4
  %shr = ashr i32 %mul, 8
  %add = add nsw i32 %shr, %conv1
  %cmp6 = icmp sgt i32 %add, 255
  %2 = trunc i32 %add to i8
  %conv10 = select i1 %cmp6, i8 -1, i8 %2
  store i8 %conv10, i8* %imageR.addr.023, align 1, !tbaa !1
  %inc = add nuw nsw i32 %i.025, 1
  %incdec.ptr = getelementptr inbounds i8, i8* %image1.addr.026, i32 1
  %incdec.ptr11 = getelementptr inbounds i8, i8* %image2.addr.024, i32 1
  %incdec.ptr12 = getelementptr inbounds i8, i8* %imageR.addr.023, i32 1
  %exitcond = icmp eq i32 %inc, %nelem
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  ret void
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %i.014 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %arrayidx = getelementptr inbounds [10 x i8], [10 x i8]* @fades, i32 0, i32 %i.014
  %0 = load i8, i8* %arrayidx, align 1, !tbaa !1
  tail call void @compositing(i8* getelementptr inbounds ([200 x i8], [200 x i8]* @image1, i32 0, i32 0), i8* getelementptr inbounds ([200 x i8], [200 x i8]* @image2, i32 0, i32 0), i8* getelementptr inbounds ([200 x i8], [200 x i8]* @imageR, i32 0, i32 0), i32 200, i8 zeroext %0)
  %inc = add nuw nsw i32 %i.014, 1
  %exitcond15 = icmp eq i32 %inc, 10
  br i1 %exitcond15, label %for.body3, label %for.body

for.body3:                                        ; preds = %for.body, %for.body3
  %i.113 = phi i32 [ %inc6, %for.body3 ], [ 0, %for.body ]
  %arrayidx4 = getelementptr inbounds [200 x i8], [200 x i8]* @imageR, i32 0, i32 %i.113
  %1 = load i8, i8* %arrayidx4, align 1, !tbaa !1
  %conv = zext i8 %1 to i32
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 %conv) #1
  %inc6 = add nuw nsw i32 %i.113, 1
  %exitcond = icmp eq i32 %inc6, 200
  br i1 %exitcond, label %for.end7, label %for.body3

for.end7:                                         ; preds = %for.body3
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #0

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}