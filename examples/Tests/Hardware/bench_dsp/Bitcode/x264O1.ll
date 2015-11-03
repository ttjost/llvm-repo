; ModuleID = 'x264.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@fenc = global [256 x i8] c"\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F", align 1
@pix0 = global [256 x i8] zeroinitializer, align 1
@pix1 = global [256 x i8] zeroinitializer, align 1
@pix2 = global [256 x i8] zeroinitializer, align 1
@pix3 = global [256 x i8] zeroinitializer, align 1

; Function Attrs: nounwind readnone
define i32 @abs(i32 %a) #0 {
entry:
  %cmp = icmp slt i32 %a, 0
  %sub = sub nsw i32 0, %a
  %retval.0 = select i1 %cmp, i32 %sub, i32 %a
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @main() #1 {
entry:
  %scores = alloca [4 x i32], align 4
  %arraydecay = getelementptr inbounds [4 x i32], [4 x i32]* %scores, i32 0, i32 0
  call fastcc void @x264_pixel_sad_x4_16x16(i32* %arraydecay)
  br label %for.body

for.body:                                         ; preds = %entry, %for.inc
  %i.04 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* %scores, i32 0, i32 %i.04
  %0 = load i32, i32* %arrayidx, align 4, !tbaa !1
  %cmp1 = icmp eq i32 %0, 1920
  br i1 %cmp1, label %for.inc, label %return

for.inc:                                          ; preds = %for.body
  %inc = add nuw nsw i32 %i.04, 1
  %cmp = icmp slt i32 %inc, 4
  br i1 %cmp, label %for.body, label %return

return:                                           ; preds = %for.inc, %for.body
  %retval.0 = phi i32 [ %i.04, %for.body ], [ -1, %for.inc ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define internal fastcc void @x264_pixel_sad_x4_16x16(i32* nocapture %scores) #1 {
entry:
  %call = tail call fastcc i32 @x264_pixel_sad_16x16(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @pix0, i32 0, i32 0))
  store i32 %call, i32* %scores, align 4, !tbaa !1
  %call1 = tail call fastcc i32 @x264_pixel_sad_16x16(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @pix1, i32 0, i32 0))
  %arrayidx2 = getelementptr inbounds i32, i32* %scores, i32 1
  store i32 %call1, i32* %arrayidx2, align 4, !tbaa !1
  %call3 = tail call fastcc i32 @x264_pixel_sad_16x16(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @pix2, i32 0, i32 0))
  %arrayidx4 = getelementptr inbounds i32, i32* %scores, i32 2
  store i32 %call3, i32* %arrayidx4, align 4, !tbaa !1
  %call5 = tail call fastcc i32 @x264_pixel_sad_16x16(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @pix3, i32 0, i32 0))
  %arrayidx6 = getelementptr inbounds i32, i32* %scores, i32 3
  store i32 %call5, i32* %arrayidx6, align 4, !tbaa !1
  ret void
}

; Function Attrs: nounwind readonly
define internal fastcc i32 @x264_pixel_sad_16x16(i8* nocapture readonly %pix2) #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end, %entry
  %y.06 = phi i32 [ 0, %entry ], [ %inc8, %for.end ]
  %i_sum.05 = phi i32 [ 0, %entry ], [ %add, %for.end ]
  %pix1.addr.04 = phi i8* [ getelementptr inbounds ([256 x i8], [256 x i8]* @fenc, i32 0, i32 0), %entry ], [ %add.ptr, %for.end ]
  %pix2.addr.03 = phi i8* [ %pix2, %entry ], [ %add.ptr6, %for.end ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %x.02 = phi i32 [ 0, %for.cond1.preheader ], [ %inc, %for.body3 ]
  %i_sum.11 = phi i32 [ %i_sum.05, %for.cond1.preheader ], [ %add, %for.body3 ]
  %arrayidx = getelementptr inbounds i8, i8* %pix1.addr.04, i32 %x.02
  %0 = load i8, i8* %arrayidx, align 1, !tbaa !5
  %conv = zext i8 %0 to i32
  %arrayidx4 = getelementptr inbounds i8, i8* %pix2.addr.03, i32 %x.02
  %1 = load i8, i8* %arrayidx4, align 1, !tbaa !5
  %conv5 = zext i8 %1 to i32
  %sub = sub nsw i32 %conv, %conv5
  %ispos = icmp sgt i32 %sub, -1
  %neg = sub nsw i32 0, %sub
  %2 = select i1 %ispos, i32 %sub, i32 %neg
  %add = add nsw i32 %2, %i_sum.11
  %inc = add nuw nsw i32 %x.02, 1
  %exitcond = icmp eq i32 %inc, 16
  br i1 %exitcond, label %for.end, label %for.body3

for.end:                                          ; preds = %for.body3
  %add.ptr = getelementptr inbounds i8, i8* %pix1.addr.04, i32 16
  %add.ptr6 = getelementptr inbounds i8, i8* %pix2.addr.03, i32 16
  %inc8 = add nuw nsw i32 %y.06, 1
  %exitcond7 = icmp eq i32 %inc8, 16
  br i1 %exitcond7, label %for.end9, label %for.cond1.preheader

for.end9:                                         ; preds = %for.end
  ret i32 %add
}

attributes #0 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!3, !3, i64 0}
