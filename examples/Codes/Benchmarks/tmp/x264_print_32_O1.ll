; ModuleID = 'x264_print.c'
target datalayout = "E-m:e-p:32:32-i64:64-f128:64-n32-S64"
target triple = "sparc-unknown-linux-gnu"

@fenc = global [256 x i8] c"\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F", align 1
@pix0 = global [256 x i8] c"\00\0B\16!,7BMXc\0Ao\D4\0D\0E\0F\0A\15 +6ALWb\09n\D3p\0D\0E\0F\14\1F*5@KVa\08\13\D27\D4\0D\0E\0F\0A\15*\22,7BMXcn\D3\8E\0D\0E\0F\14)4\03\04\05\06\07\08\09\0A\0B\0Cq\95\97\1E=>\03\04\05\06\07\12\09\0A\0B\0C{\94\98(GH\03\04\05\06\07\08\09\0A\0B\0C\8F\92\992QR\03\04\05\06\07\1C\5C\0A\0B\0C\87\8E\9A<[\5C\03\04\05\06\07\08\09\0A\0B\0C\89\9A\9BF\01\14\03\04\05\06\07\08\09\82\0B\0C\8A\8E\9CP\15>\03\04\05\06\07\1C\09\96\0B\0C\C1\9A\9DZ\1F\16\03\04\05\06\07\08\09\0A\0B\0Cq\AE\9E\00)\02+\04\05\06\07\08\09g\0B\0C\85\92\9F\0A\0B\02\17\04\05\06\07\08\09\0A\0B\0Cq\90s\14\1F\02!\04\05\06\07\12\09e\0B\0C{\8E\98\1E)\02+\04\05\06\07b\09\0A\0B\0C\85\8D\99", align 1
@pix1 = global [256 x i8] c"\00\0B\16!,7BMXc\0Ao\0C\0D\0E\0F\0A\15 +6ALWb\09n\0B\0C\0D\0E\0F\14\1F*5@KVa\08\13x\0B\0C\0D\0E\0F\0A\15*\22,7BMXcn\0B\8E\0D\0E\0F<[\5C\03\04\05\06\07\08\09\0A\0B\0C\0D\0FsF\01\14\03\04\05\06\07\08\09\82\0B\0C\0D\8E~P\15>\03\04\05\06\07\1C\09\96\0B\0C\C1\9Au\14)4\03\04\05\06\07\08\09\0A\0B\0Cq\95y\1E=>\03\04\05\06\07\12\09\0A\0B\0C{\94\5C(GH\03\04\05\06\07\08\00\0A\0B\0C{\92\0D2QR\03\04\05\06\07\02\5C\0A\01\0C}\8E\0EZ\1F\16\03\04\05\06\07\08\09\0A\0B\0C\0D\AE\12\00)\02+\04\05\06\07\08\09g\0B\0C{\92\13\0A\0B\02\17\04\05\06\07\08\09\0A\0B\0Cq\0E\0B\14\1F\02!\04\05\06\07\08\09e\0B\0C\0D\0C\0C\1E)\02+\04\05\06\07\5C\09\0A\0B\0C\0D\0B\0D", align 1
@pix2 = global [256 x i8] c"\00\0B\16!,7BMXc\0Ao\0C\0D\0E\0F\0A\15 +6ALWb\09n\0B\0C\0D\0E\0F\14\1F*5@KVa\08\13x\0B\0C\0D\0E\0F\0A\15*\22,7BMXcn\0B\8E\0D\0E\0F<[\5C\03\04\05\06\07\08\09\0Arz\0D\0FsF\01\14\03\04\05\06\07\08\09\82qy\0D\8E~P\15>\03\04\05\06\07\1C\09\96\0B\0C\C1\9Au\14)4\03\04\05\06\07\08\09\0A\0B\0Cq\95y\1E=>\03\04\05\06\07\12\09\0A\0B\0C{\A8\5C(GH\03\04\05\06\07\08\00\0A\0B~{\95\0D2QR\03\04\05\06\07\02\5C\0A\01\7F}\8E\0EZ\1F\16\03\04\05\06\07\08\09\0A\0B\81\0D\C2\12\00)\02+\04\05\06\07\08\09g\0B\0C\C1\C4\13\0A\0B\02\17\04\05\06\07\08\09\0A\0B\0Cq\0E\0B\14\1F\02!\04\05\06\07\08\09e\0B\0C\0D\0C\0C\1E)\02+\04\05\06\07\5C\09\0A\0B\0C\0D\0B\0D", align 1
@pix3 = global [256 x i8] c"\00\0B\16!,7BMXc\0Ao\0C\0D\0E\0F\0A\15 +6ALWb\09n\0B\0C\0D\0E\0F\14\1F*5@KVa\08\13x\0B\0C\0D\0E\0F\0A\15*\22,7BMXcn\0B\8E\0D\0E\0F<[\5C\03\04\05\06\07\08\09\0Arz\0D\0FsF\01\14\03\04\05\06\07\08\09\82qy\0D\8E~P\15>\03\04\05\06\07\1C\09\96\0B\0C\C1\9Au\14)4\03\04\05\06\07T_\0A\0B\0Cq\95y\1E=>\03\04\05\06\07\B7\09\0A\0B\0C{\A8\5C(GH\03\04\05\06\07\08\00\0A\0B~{\95\0D2QR\03\04\05\06\07\02\5C\0A\01\7F}\8E\0EZ\1F\16\03\04\05\06\07\08\5C\0A\0B\81\0D\C2\12\00)\02+\04\05\06\07\08[g\0B\0C\C1\C4\13\0A\0B\02\17\04\05\06\07\08\09\0A\0B\0Cq\0E\0B\14\1F\02!\04\05\06\07\08\09e\0B\0C\0D\0C\0C\1E)\02+\04\05\06\07\5C\09\0A\0B\0C\0D\0B\0D", align 1
@scores_temp = global [4 x i32] [i32 10370, i32 7067, i32 8000, i32 8492], align 4
@scores = global [4 x i32] zeroinitializer, align 4
@.str = private unnamed_addr constant [5 x i8] c"666\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"-1\0A\00", align 1
@str = private unnamed_addr constant [3 x i8] c"-1\00"
@str2 = private unnamed_addr constant [4 x i8] c"666\00"

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
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %i.017 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  tail call fastcc void @x264_pixel_sad_x4_16x16()
  %inc = add nuw nsw i32 %i.017, 1
  %exitcond = icmp eq i32 %inc, 1000
  br i1 %exitcond, label %for.body3, label %for.body

for.cond1:                                        ; preds = %for.body3
  %cmp2 = icmp slt i32 %inc7, 4
  br i1 %cmp2, label %for.body3, label %for.end8

for.body3:                                        ; preds = %for.body, %for.cond1
  %i.116 = phi i32 [ %inc7, %for.cond1 ], [ 0, %for.body ]
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* @scores, i32 0, i32 %i.116
  %0 = load i32, i32* %arrayidx, align 4, !tbaa !1
  %arrayidx4 = getelementptr inbounds [4 x i32], [4 x i32]* @scores_temp, i32 0, i32 %i.116
  %1 = load i32, i32* %arrayidx4, align 4, !tbaa !1
  %cmp5 = icmp eq i32 %0, %1
  %inc7 = add nuw nsw i32 %i.116, 1
  br i1 %cmp5, label %for.cond1, label %if.then

if.then:                                          ; preds = %for.body3
  %puts15 = tail call i32 @puts(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str2, i32 0, i32 0))
  br label %return

for.end8:                                         ; preds = %for.cond1
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str, i32 0, i32 0))
  br label %return

return:                                           ; preds = %for.end8, %if.then
  %retval.0 = phi i32 [ 666, %if.then ], [ -1, %for.end8 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define internal fastcc void @x264_pixel_sad_x4_16x16() #1 {
entry:
  %call = tail call fastcc i32 @x264_pixel_sad_16x16(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @pix0, i32 0, i32 0))
  store i32 %call, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @scores, i32 0, i32 0), align 4, !tbaa !1
  %call1 = tail call fastcc i32 @x264_pixel_sad_16x16(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @pix1, i32 0, i32 0))
  store i32 %call1, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @scores, i32 0, i32 1), align 4, !tbaa !1
  %call3 = tail call fastcc i32 @x264_pixel_sad_16x16(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @pix2, i32 0, i32 0))
  store i32 %call3, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @scores, i32 0, i32 2), align 4, !tbaa !1
  %call5 = tail call fastcc i32 @x264_pixel_sad_16x16(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @pix3, i32 0, i32 0))
  store i32 %call5, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @scores, i32 0, i32 3), align 4, !tbaa !1
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

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #3

attributes #0 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+soft-float" "unsafe-fp-math"="false" "use-soft-float"="true" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+soft-float" "unsafe-fp-math"="false" "use-soft-float"="true" }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+soft-float" "unsafe-fp-math"="false" "use-soft-float"="true" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!3, !3, i64 0}
