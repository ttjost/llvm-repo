; ModuleID = 'x264.c'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

@fenc = global [256 x i8] c"\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F", align 1
@pix0 = global [256 x i8] c"\00\0B\16!,7BMXc\0Ao\D4\0D\0E\0F\0A\15 +6ALWb\09n\D3p\0D\0E\0F\14\1F*5@KVa\08\13\D27\D4\0D\0E\0F\0A\15*\22,7BMXcn\D3\8E\0D\0E\0F\14)4\03\04\05\06\07\08\09\0A\0B\0Cq\95\97\1E=>\03\04\05\06\07\12\09\0A\0B\0C{\94\98(GH\03\04\05\06\07\08\09\0A\0B\0C\8F\92\992QR\03\04\05\06\07\1C\5C\0A\0B\0C\87\8E\9A<[\5C\03\04\05\06\07\08\09\0A\0B\0C\89\9A\9BF\01\14\03\04\05\06\07\08\09\82\0B\0C\8A\8E\9CP\15>\03\04\05\06\07\1C\09\96\0B\0C\C1\9A\9DZ\1F\16\03\04\05\06\07\08\09\0A\0B\0Cq\AE\9E\00)\02+\04\05\06\07\08\09g\0B\0C\85\92\9F\0A\0B\02\17\04\05\06\07\08\09\0A\0B\0Cq\90s\14\1F\02!\04\05\06\07\12\09e\0B\0C{\8E\98\1E)\02+\04\05\06\07b\09\0A\0B\0C\85\8D\99", align 1
@pix1 = global [256 x i8] c"\00\0B\16!,7BMXc\0Ao\0C\0D\0E\0F\0A\15 +6ALWb\09n\0B\0C\0D\0E\0F\14\1F*5@KVa\08\13x\0B\0C\0D\0E\0F\0A\15*\22,7BMXcn\0B\8E\0D\0E\0F<[\5C\03\04\05\06\07\08\09\0A\0B\0C\0D\0FsF\01\14\03\04\05\06\07\08\09\82\0B\0C\0D\8E~P\15>\03\04\05\06\07\1C\09\96\0B\0C\C1\9Au\14)4\03\04\05\06\07\08\09\0A\0B\0Cq\95y\1E=>\03\04\05\06\07\12\09\0A\0B\0C{\94\5C(GH\03\04\05\06\07\08\00\0A\0B\0C{\92\0D2QR\03\04\05\06\07\02\5C\0A\01\0C}\8E\0EZ\1F\16\03\04\05\06\07\08\09\0A\0B\0C\0D\AE\12\00)\02+\04\05\06\07\08\09g\0B\0C{\92\13\0A\0B\02\17\04\05\06\07\08\09\0A\0B\0Cq\0E\0B\14\1F\02!\04\05\06\07\08\09e\0B\0C\0D\0C\0C\1E)\02+\04\05\06\07\5C\09\0A\0B\0C\0D\0B\0D", align 1
@pix2 = global [256 x i8] c"\00\0B\16!,7BMXc\0Ao\0C\0D\0E\0F\0A\15 +6ALWb\09n\0B\0C\0D\0E\0F\14\1F*5@KVa\08\13x\0B\0C\0D\0E\0F\0A\15*\22,7BMXcn\0B\8E\0D\0E\0F<[\5C\03\04\05\06\07\08\09\0Arz\0D\0FsF\01\14\03\04\05\06\07\08\09\82qy\0D\8E~P\15>\03\04\05\06\07\1C\09\96\0B\0C\C1\9Au\14)4\03\04\05\06\07\08\09\0A\0B\0Cq\95y\1E=>\03\04\05\06\07\12\09\0A\0B\0C{\A8\5C(GH\03\04\05\06\07\08\00\0A\0B~{\95\0D2QR\03\04\05\06\07\02\5C\0A\01\7F}\8E\0EZ\1F\16\03\04\05\06\07\08\09\0A\0B\81\0D\C2\12\00)\02+\04\05\06\07\08\09g\0B\0C\C1\C4\13\0A\0B\02\17\04\05\06\07\08\09\0A\0B\0Cq\0E\0B\14\1F\02!\04\05\06\07\08\09e\0B\0C\0D\0C\0C\1E)\02+\04\05\06\07\5C\09\0A\0B\0C\0D\0B\0D", align 1
@pix3 = global [256 x i8] c"\00\0B\16!,7BMXc\0Ao\0C\0D\0E\0F\0A\15 +6ALWb\09n\0B\0C\0D\0E\0F\14\1F*5@KVa\08\13x\0B\0C\0D\0E\0F\0A\15*\22,7BMXcn\0B\8E\0D\0E\0F<[\5C\03\04\05\06\07\08\09\0Arz\0D\0FsF\01\14\03\04\05\06\07\08\09\82qy\0D\8E~P\15>\03\04\05\06\07\1C\09\96\0B\0C\C1\9Au\14)4\03\04\05\06\07T_\0A\0B\0Cq\95y\1E=>\03\04\05\06\07\B7\09\0A\0B\0C{\A8\5C(GH\03\04\05\06\07\08\00\0A\0B~{\95\0D2QR\03\04\05\06\07\02\5C\0A\01\7F}\8E\0EZ\1F\16\03\04\05\06\07\08\5C\0A\0B\81\0D\C2\12\00)\02+\04\05\06\07\08[g\0B\0C\C1\C4\13\0A\0B\02\17\04\05\06\07\08\09\0A\0B\0Cq\0E\0B\14\1F\02!\04\05\06\07\08\09e\0B\0C\0D\0C\0C\1E)\02+\04\05\06\07\5C\09\0A\0B\0C\0D\0B\0D", align 1
@scores_temp = global [4 x i32] [i32 10370, i32 7067, i32 8000, i32 8492], align 4
@scores = global [4 x i32] zeroinitializer, align 4

; Function Attrs: nounwind readnone
define i32 @abs(i32 signext %a) #0 {
entry:
  %cmp = icmp slt i32 %a, 0
  %sub = sub nsw i32 0, %a
  %retval.0 = select i1 %cmp, i32 %sub, i32 %a
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @main() #1 {
entry:
  br label %for.cond1.preheader.i.i.preheader

for.cond1.preheader.i.i.preheader:                ; preds = %x264_pixel_sad_x4_16x16.exit, %entry
  %i.016 = phi i32 [ 0, %entry ], [ %inc, %x264_pixel_sad_x4_16x16.exit ]
  br label %for.cond1.preheader.i.i

for.cond1.preheader:                              ; preds = %x264_pixel_sad_x4_16x16.exit
  %add.i15.i.lcssa.lcssa.lcssa = phi i32 [ %add.i15.i.lcssa.lcssa, %x264_pixel_sad_x4_16x16.exit ]
  %add.i39.i.lcssa.lcssa.lcssa = phi i32 [ %add.i39.i.lcssa.lcssa, %x264_pixel_sad_x4_16x16.exit ]
  %add.i63.i.lcssa.lcssa.lcssa = phi i32 [ %add.i63.i.lcssa.lcssa, %x264_pixel_sad_x4_16x16.exit ]
  %add.i.i.lcssa.lcssa.lcssa = phi i32 [ %add.i.i.lcssa.lcssa, %x264_pixel_sad_x4_16x16.exit ]
  %0 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @scores_temp, i32 0, i32 0), align 4, !tbaa !1
  %cmp5 = icmp eq i32 %add.i.i.lcssa.lcssa.lcssa, %0
  br i1 %cmp5, label %for.inc6, label %return

for.cond1.preheader.i.i:                          ; preds = %for.cond1.preheader.i.i.preheader, %for.end.i.i
  %y.06.i.i = phi i32 [ %inc8.i.i, %for.end.i.i ], [ 0, %for.cond1.preheader.i.i.preheader ]
  %i_sum.05.i.i = phi i32 [ %add.i.i.lcssa, %for.end.i.i ], [ 0, %for.cond1.preheader.i.i.preheader ]
  %pix1.addr.04.i.i = phi i8* [ %add.ptr.i.i, %for.end.i.i ], [ getelementptr inbounds ([256 x i8], [256 x i8]* @fenc, i32 0, i32 0), %for.cond1.preheader.i.i.preheader ]
  %pix2.addr.03.i.i = phi i8* [ %add.ptr6.i.i, %for.end.i.i ], [ getelementptr inbounds ([256 x i8], [256 x i8]* @pix0, i32 0, i32 0), %for.cond1.preheader.i.i.preheader ]
  br label %for.body3.i.i

for.body3.i.i:                                    ; preds = %for.body3.i.i, %for.cond1.preheader.i.i
  %x.02.i.i = phi i32 [ 0, %for.cond1.preheader.i.i ], [ %inc.i.i, %for.body3.i.i ]
  %i_sum.11.i.i = phi i32 [ %i_sum.05.i.i, %for.cond1.preheader.i.i ], [ %add.i.i, %for.body3.i.i ]
  %arrayidx.i.i = getelementptr inbounds i8, i8* %pix1.addr.04.i.i, i32 %x.02.i.i
  %1 = load i8, i8* %arrayidx.i.i, align 1, !tbaa !5
  %conv.i.i = zext i8 %1 to i32
  %arrayidx4.i.i = getelementptr inbounds i8, i8* %pix2.addr.03.i.i, i32 %x.02.i.i
  %2 = load i8, i8* %arrayidx4.i.i, align 1, !tbaa !5
  %conv5.i.i = zext i8 %2 to i32
  %sub.i.i = sub nsw i32 %conv.i.i, %conv5.i.i
  %ispos.i.i = icmp sgt i32 %sub.i.i, -1
  %neg.i.i = sub nsw i32 0, %sub.i.i
  %3 = select i1 %ispos.i.i, i32 %sub.i.i, i32 %neg.i.i
  %add.i.i = add nsw i32 %3, %i_sum.11.i.i
  %inc.i.i = add nuw nsw i32 %x.02.i.i, 1
  %exitcond.i.i = icmp eq i32 %inc.i.i, 16
  br i1 %exitcond.i.i, label %for.end.i.i, label %for.body3.i.i

for.end.i.i:                                      ; preds = %for.body3.i.i
  %add.i.i.lcssa = phi i32 [ %add.i.i, %for.body3.i.i ]
  %add.ptr.i.i = getelementptr inbounds i8, i8* %pix1.addr.04.i.i, i32 16
  %add.ptr6.i.i = getelementptr inbounds i8, i8* %pix2.addr.03.i.i, i32 16
  %inc8.i.i = add nuw nsw i32 %y.06.i.i, 1
  %exitcond7.i.i = icmp eq i32 %inc8.i.i, 16
  br i1 %exitcond7.i.i, label %x264_pixel_sad_16x16.exit.i, label %for.cond1.preheader.i.i

x264_pixel_sad_16x16.exit.i:                      ; preds = %for.end.i.i
  %add.i.i.lcssa.lcssa = phi i32 [ %add.i.i.lcssa, %for.end.i.i ]
  store i32 %add.i.i.lcssa.lcssa, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @scores, i32 0, i32 0), align 4, !tbaa !1
  br label %for.cond1.preheader.i53.i

for.cond1.preheader.i53.i:                        ; preds = %for.end.i71.i, %x264_pixel_sad_16x16.exit.i
  %y.06.i49.i = phi i32 [ 0, %x264_pixel_sad_16x16.exit.i ], [ %inc8.i69.i, %for.end.i71.i ]
  %i_sum.05.i50.i = phi i32 [ 0, %x264_pixel_sad_16x16.exit.i ], [ %add.i63.i.lcssa, %for.end.i71.i ]
  %pix1.addr.04.i51.i = phi i8* [ getelementptr inbounds ([256 x i8], [256 x i8]* @fenc, i32 0, i32 0), %x264_pixel_sad_16x16.exit.i ], [ %add.ptr.i67.i, %for.end.i71.i ]
  %pix2.addr.03.i52.i = phi i8* [ getelementptr inbounds ([256 x i8], [256 x i8]* @pix1, i32 0, i32 0), %x264_pixel_sad_16x16.exit.i ], [ %add.ptr6.i68.i, %for.end.i71.i ]
  br label %for.body3.i66.i

for.body3.i66.i:                                  ; preds = %for.body3.i66.i, %for.cond1.preheader.i53.i
  %x.02.i54.i = phi i32 [ 0, %for.cond1.preheader.i53.i ], [ %inc.i64.i, %for.body3.i66.i ]
  %i_sum.11.i55.i = phi i32 [ %i_sum.05.i50.i, %for.cond1.preheader.i53.i ], [ %add.i63.i, %for.body3.i66.i ]
  %arrayidx.i56.i = getelementptr inbounds i8, i8* %pix1.addr.04.i51.i, i32 %x.02.i54.i
  %4 = load i8, i8* %arrayidx.i56.i, align 1, !tbaa !5
  %conv.i57.i = zext i8 %4 to i32
  %arrayidx4.i58.i = getelementptr inbounds i8, i8* %pix2.addr.03.i52.i, i32 %x.02.i54.i
  %5 = load i8, i8* %arrayidx4.i58.i, align 1, !tbaa !5
  %conv5.i59.i = zext i8 %5 to i32
  %sub.i60.i = sub nsw i32 %conv.i57.i, %conv5.i59.i
  %ispos.i61.i = icmp sgt i32 %sub.i60.i, -1
  %neg.i62.i = sub nsw i32 0, %sub.i60.i
  %6 = select i1 %ispos.i61.i, i32 %sub.i60.i, i32 %neg.i62.i
  %add.i63.i = add nsw i32 %6, %i_sum.11.i55.i
  %inc.i64.i = add nuw nsw i32 %x.02.i54.i, 1
  %exitcond.i65.i = icmp eq i32 %inc.i64.i, 16
  br i1 %exitcond.i65.i, label %for.end.i71.i, label %for.body3.i66.i

for.end.i71.i:                                    ; preds = %for.body3.i66.i
  %add.i63.i.lcssa = phi i32 [ %add.i63.i, %for.body3.i66.i ]
  %add.ptr.i67.i = getelementptr inbounds i8, i8* %pix1.addr.04.i51.i, i32 16
  %add.ptr6.i68.i = getelementptr inbounds i8, i8* %pix2.addr.03.i52.i, i32 16
  %inc8.i69.i = add nuw nsw i32 %y.06.i49.i, 1
  %exitcond7.i70.i = icmp eq i32 %inc8.i69.i, 16
  br i1 %exitcond7.i70.i, label %x264_pixel_sad_16x16.exit72.i, label %for.cond1.preheader.i53.i

x264_pixel_sad_16x16.exit72.i:                    ; preds = %for.end.i71.i
  %add.i63.i.lcssa.lcssa = phi i32 [ %add.i63.i.lcssa, %for.end.i71.i ]
  store i32 %add.i63.i.lcssa.lcssa, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @scores, i32 0, i32 1), align 4, !tbaa !1
  br label %for.cond1.preheader.i29.i

for.cond1.preheader.i29.i:                        ; preds = %for.end.i47.i, %x264_pixel_sad_16x16.exit72.i
  %y.06.i25.i = phi i32 [ 0, %x264_pixel_sad_16x16.exit72.i ], [ %inc8.i45.i, %for.end.i47.i ]
  %i_sum.05.i26.i = phi i32 [ 0, %x264_pixel_sad_16x16.exit72.i ], [ %add.i39.i.lcssa, %for.end.i47.i ]
  %pix1.addr.04.i27.i = phi i8* [ getelementptr inbounds ([256 x i8], [256 x i8]* @fenc, i32 0, i32 0), %x264_pixel_sad_16x16.exit72.i ], [ %add.ptr.i43.i, %for.end.i47.i ]
  %pix2.addr.03.i28.i = phi i8* [ getelementptr inbounds ([256 x i8], [256 x i8]* @pix2, i32 0, i32 0), %x264_pixel_sad_16x16.exit72.i ], [ %add.ptr6.i44.i, %for.end.i47.i ]
  br label %for.body3.i42.i

for.body3.i42.i:                                  ; preds = %for.body3.i42.i, %for.cond1.preheader.i29.i
  %x.02.i30.i = phi i32 [ 0, %for.cond1.preheader.i29.i ], [ %inc.i40.i, %for.body3.i42.i ]
  %i_sum.11.i31.i = phi i32 [ %i_sum.05.i26.i, %for.cond1.preheader.i29.i ], [ %add.i39.i, %for.body3.i42.i ]
  %arrayidx.i32.i = getelementptr inbounds i8, i8* %pix1.addr.04.i27.i, i32 %x.02.i30.i
  %7 = load i8, i8* %arrayidx.i32.i, align 1, !tbaa !5
  %conv.i33.i = zext i8 %7 to i32
  %arrayidx4.i34.i = getelementptr inbounds i8, i8* %pix2.addr.03.i28.i, i32 %x.02.i30.i
  %8 = load i8, i8* %arrayidx4.i34.i, align 1, !tbaa !5
  %conv5.i35.i = zext i8 %8 to i32
  %sub.i36.i = sub nsw i32 %conv.i33.i, %conv5.i35.i
  %ispos.i37.i = icmp sgt i32 %sub.i36.i, -1
  %neg.i38.i = sub nsw i32 0, %sub.i36.i
  %9 = select i1 %ispos.i37.i, i32 %sub.i36.i, i32 %neg.i38.i
  %add.i39.i = add nsw i32 %9, %i_sum.11.i31.i
  %inc.i40.i = add nuw nsw i32 %x.02.i30.i, 1
  %exitcond.i41.i = icmp eq i32 %inc.i40.i, 16
  br i1 %exitcond.i41.i, label %for.end.i47.i, label %for.body3.i42.i

for.end.i47.i:                                    ; preds = %for.body3.i42.i
  %add.i39.i.lcssa = phi i32 [ %add.i39.i, %for.body3.i42.i ]
  %add.ptr.i43.i = getelementptr inbounds i8, i8* %pix1.addr.04.i27.i, i32 16
  %add.ptr6.i44.i = getelementptr inbounds i8, i8* %pix2.addr.03.i28.i, i32 16
  %inc8.i45.i = add nuw nsw i32 %y.06.i25.i, 1
  %exitcond7.i46.i = icmp eq i32 %inc8.i45.i, 16
  br i1 %exitcond7.i46.i, label %x264_pixel_sad_16x16.exit48.i, label %for.cond1.preheader.i29.i

x264_pixel_sad_16x16.exit48.i:                    ; preds = %for.end.i47.i
  %add.i39.i.lcssa.lcssa = phi i32 [ %add.i39.i.lcssa, %for.end.i47.i ]
  store i32 %add.i39.i.lcssa.lcssa, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @scores, i32 0, i32 2), align 4, !tbaa !1
  br label %for.cond1.preheader.i5.i

for.cond1.preheader.i5.i:                         ; preds = %for.end.i23.i, %x264_pixel_sad_16x16.exit48.i
  %y.06.i1.i = phi i32 [ 0, %x264_pixel_sad_16x16.exit48.i ], [ %inc8.i21.i, %for.end.i23.i ]
  %i_sum.05.i2.i = phi i32 [ 0, %x264_pixel_sad_16x16.exit48.i ], [ %add.i15.i.lcssa, %for.end.i23.i ]
  %pix1.addr.04.i3.i = phi i8* [ getelementptr inbounds ([256 x i8], [256 x i8]* @fenc, i32 0, i32 0), %x264_pixel_sad_16x16.exit48.i ], [ %add.ptr.i19.i, %for.end.i23.i ]
  %pix2.addr.03.i4.i = phi i8* [ getelementptr inbounds ([256 x i8], [256 x i8]* @pix3, i32 0, i32 0), %x264_pixel_sad_16x16.exit48.i ], [ %add.ptr6.i20.i, %for.end.i23.i ]
  br label %for.body3.i18.i

for.body3.i18.i:                                  ; preds = %for.body3.i18.i, %for.cond1.preheader.i5.i
  %x.02.i6.i = phi i32 [ 0, %for.cond1.preheader.i5.i ], [ %inc.i16.i, %for.body3.i18.i ]
  %i_sum.11.i7.i = phi i32 [ %i_sum.05.i2.i, %for.cond1.preheader.i5.i ], [ %add.i15.i, %for.body3.i18.i ]
  %arrayidx.i8.i = getelementptr inbounds i8, i8* %pix1.addr.04.i3.i, i32 %x.02.i6.i
  %10 = load i8, i8* %arrayidx.i8.i, align 1, !tbaa !5
  %conv.i9.i = zext i8 %10 to i32
  %arrayidx4.i10.i = getelementptr inbounds i8, i8* %pix2.addr.03.i4.i, i32 %x.02.i6.i
  %11 = load i8, i8* %arrayidx4.i10.i, align 1, !tbaa !5
  %conv5.i11.i = zext i8 %11 to i32
  %sub.i12.i = sub nsw i32 %conv.i9.i, %conv5.i11.i
  %ispos.i13.i = icmp sgt i32 %sub.i12.i, -1
  %neg.i14.i = sub nsw i32 0, %sub.i12.i
  %12 = select i1 %ispos.i13.i, i32 %sub.i12.i, i32 %neg.i14.i
  %add.i15.i = add nsw i32 %12, %i_sum.11.i7.i
  %inc.i16.i = add nuw nsw i32 %x.02.i6.i, 1
  %exitcond.i17.i = icmp eq i32 %inc.i16.i, 16
  br i1 %exitcond.i17.i, label %for.end.i23.i, label %for.body3.i18.i

for.end.i23.i:                                    ; preds = %for.body3.i18.i
  %add.i15.i.lcssa = phi i32 [ %add.i15.i, %for.body3.i18.i ]
  %add.ptr.i19.i = getelementptr inbounds i8, i8* %pix1.addr.04.i3.i, i32 16
  %add.ptr6.i20.i = getelementptr inbounds i8, i8* %pix2.addr.03.i4.i, i32 16
  %inc8.i21.i = add nuw nsw i32 %y.06.i1.i, 1
  %exitcond7.i22.i = icmp eq i32 %inc8.i21.i, 16
  br i1 %exitcond7.i22.i, label %x264_pixel_sad_x4_16x16.exit, label %for.cond1.preheader.i5.i

x264_pixel_sad_x4_16x16.exit:                     ; preds = %for.end.i23.i
  %add.i15.i.lcssa.lcssa = phi i32 [ %add.i15.i.lcssa, %for.end.i23.i ]
  store i32 %add.i15.i.lcssa.lcssa, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @scores, i32 0, i32 3), align 4, !tbaa !1
  %inc = add nuw nsw i32 %i.016, 1
  %exitcond = icmp eq i32 %inc, 1000
  br i1 %exitcond, label %for.cond1.preheader, label %for.cond1.preheader.i.i.preheader

for.inc6:                                         ; preds = %for.cond1.preheader
  %13 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @scores_temp, i32 0, i32 1), align 4, !tbaa !1
  %cmp5.1 = icmp eq i32 %add.i63.i.lcssa.lcssa.lcssa, %13
  br i1 %cmp5.1, label %for.inc6.1, label %return

return:                                           ; preds = %for.cond1.preheader, %for.inc6, %for.inc6.1
  %retval.0 = phi i32 [ 0, %for.cond1.preheader ], [ 100, %for.inc6 ], [ 200, %for.inc6.1 ]
  ret i32 %retval.0

for.inc6.1:                                       ; preds = %for.inc6
  %14 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @scores_temp, i32 0, i32 2), align 4, !tbaa !1
  %cmp5.2 = icmp eq i32 %add.i39.i.lcssa.lcssa.lcssa, %14
  br i1 %cmp5.2, label %for.inc6.2, label %return

for.inc6.2:                                       ; preds = %for.inc6.1
  %15 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @scores_temp, i32 0, i32 3), align 4, !tbaa !1
  %cmp5.3 = icmp eq i32 %add.i15.i.lcssa.lcssa.lcssa, %15
  %. = select i1 %cmp5.3, i32 -1, i32 300
  ret i32 %.
}

attributes #0 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!3, !3, i64 0}
