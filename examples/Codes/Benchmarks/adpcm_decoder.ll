; ModuleID = 'adpcm_decoder.c'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

%struct.adpcm_state = type { i16, i8 }

@pcmdata = global [10 x i16] [i16 0, i16 0, i16 16, i16 16, i16 16, i16 24, i16 24, i16 24, i16 32, i16 32], align 2
@adpcmdata_ref = global [5 x i8] c"\00q\82\008", align 1
@pcmdata_2_ref = global [10 x i16] [i16 0, i16 0, i16 11, i16 17, i16 16, i16 23, i16 24, i16 25, i16 33, i16 32], align 2
@stepsizeTable = internal unnamed_addr constant [89 x i32] [i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 16, i32 17, i32 19, i32 21, i32 23, i32 25, i32 28, i32 31, i32 34, i32 37, i32 41, i32 45, i32 50, i32 55, i32 60, i32 66, i32 73, i32 80, i32 88, i32 97, i32 107, i32 118, i32 130, i32 143, i32 157, i32 173, i32 190, i32 209, i32 230, i32 253, i32 279, i32 307, i32 337, i32 371, i32 408, i32 449, i32 494, i32 544, i32 598, i32 658, i32 724, i32 796, i32 876, i32 963, i32 1060, i32 1166, i32 1282, i32 1411, i32 1552, i32 1707, i32 1878, i32 2066, i32 2272, i32 2499, i32 2749, i32 3024, i32 3327, i32 3660, i32 4026, i32 4428, i32 4871, i32 5358, i32 5894, i32 6484, i32 7132, i32 7845, i32 8630, i32 9493, i32 10442, i32 11487, i32 12635, i32 13899, i32 15289, i32 16818, i32 18500, i32 20350, i32 22385, i32 24623, i32 27086, i32 29794, i32 32767], align 4
@indexTable = internal unnamed_addr constant [16 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 2, i32 4, i32 6, i32 8, i32 -1, i32 -1, i32 -1, i32 -1, i32 2, i32 4, i32 6, i32 8], align 4
@adpcmdata = common global [5 x i8] zeroinitializer, align 1
@pcmdata_2 = common global [10 x i16] zeroinitializer, align 2
@coder_state = common global %struct.adpcm_state zeroinitializer, align 2
@decoder_state = common global %struct.adpcm_state zeroinitializer, align 2

; Function Attrs: nounwind
define void @adpcm_decoder(i8* nocapture readonly %indata, i16* nocapture %outdata, i32 signext %len, %struct.adpcm_state* nocapture %state) #0 {
entry:
  %valprev = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %state, i32 0, i32 0
  %0 = load i16, i16* %valprev, align 2, !tbaa !1
  %conv = sext i16 %0 to i32
  %index1 = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %state, i32 0, i32 1
  %1 = load i8, i8* %index1, align 1, !tbaa !6
  %conv2 = sext i8 %1 to i32
  %cmp82 = icmp sgt i32 %len, 0
  br i1 %cmp82, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %arrayidx = getelementptr inbounds [89 x i32], [89 x i32]* @stepsizeTable, i32 0, i32 %conv2
  %2 = load i32, i32* %arrayidx, align 4, !tbaa !7
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %if.end
  %bufferstep.090 = phi i32 [ 0, %for.body.lr.ph ], [ %lnot.ext, %if.end ]
  %inputbuffer.089 = phi i32 [ undef, %for.body.lr.ph ], [ %inputbuffer.1, %if.end ]
  %index.088 = phi i32 [ %conv2, %for.body.lr.ph ], [ %..add40, %if.end ]
  %valpred.087 = phi i32 [ %conv, %for.body.lr.ph ], [ %valpred.2, %if.end ]
  %step.086 = phi i32 [ %2, %for.body.lr.ph ], [ %7, %if.end ]
  %outp.085 = phi i16* [ %outdata, %for.body.lr.ph ], [ %incdec.ptr51, %if.end ]
  %inp.084 = phi i8* [ %indata, %for.body.lr.ph ], [ %inp.1, %if.end ]
  %len.addr.083 = phi i32 [ %len, %for.body.lr.ph ], [ %dec, %if.end ]
  %tobool = icmp ne i32 %bufferstep.090, 0
  br i1 %tobool, label %if.end, label %if.else

if.else:                                          ; preds = %for.body
  %incdec.ptr = getelementptr inbounds i8, i8* %inp.084, i32 1
  %3 = load i8, i8* %inp.084, align 1, !tbaa !9
  %conv4 = sext i8 %3 to i32
  %shr81 = lshr i32 %conv4, 4
  br label %if.end

if.end:                                           ; preds = %for.body, %if.else
  %inp.1 = phi i8* [ %incdec.ptr, %if.else ], [ %inp.084, %for.body ]
  %delta.0.in = phi i32 [ %shr81, %if.else ], [ %inputbuffer.089, %for.body ]
  %inputbuffer.1 = phi i32 [ %conv4, %if.else ], [ %inputbuffer.089, %for.body ]
  %delta.0 = and i32 %delta.0.in, 15
  %4 = zext i1 %tobool to i32
  %lnot.ext = xor i32 %4, 1
  %shr7 = ashr i32 %step.086, 3
  %and8 = and i32 %delta.0.in, 4
  %tobool9 = icmp eq i32 %and8, 0
  %add = select i1 %tobool9, i32 0, i32 %step.086
  %shr7.add = add nsw i32 %add, %shr7
  %and12 = and i32 %delta.0.in, 2
  %tobool13 = icmp eq i32 %and12, 0
  %shr15 = ashr i32 %step.086, 1
  %add16 = select i1 %tobool13, i32 0, i32 %shr15
  %vpdiff.1 = add nsw i32 %shr7.add, %add16
  %and18 = and i32 %delta.0.in, 1
  %tobool19 = icmp eq i32 %and18, 0
  %shr21 = ashr i32 %step.086, 2
  %add22 = select i1 %tobool19, i32 0, i32 %shr21
  %vpdiff.2 = add nsw i32 %vpdiff.1, %add22
  %and24 = and i32 %delta.0.in, 8
  %tobool25 = icmp eq i32 %and24, 0
  %5 = sub i32 0, %vpdiff.2
  %valpred.1.p = select i1 %tobool25, i32 %vpdiff.2, i32 %5
  %valpred.1 = add i32 %valpred.1.p, %valpred.087
  %cmp30 = icmp sgt i32 %valpred.1, 32767
  %cmp34 = icmp slt i32 %valpred.1, -32768
  %.valpred.1 = select i1 %cmp34, i32 -32768, i32 %valpred.1
  %valpred.2 = select i1 %cmp30, i32 32767, i32 %.valpred.1
  %arrayidx39 = getelementptr inbounds [16 x i32], [16 x i32]* @indexTable, i32 0, i32 %delta.0
  %6 = load i32, i32* %arrayidx39, align 4, !tbaa !7
  %add40 = add nsw i32 %6, %index.088
  %cmp41 = icmp slt i32 %add40, 0
  %.add40 = select i1 %cmp41, i32 0, i32 %add40
  %cmp45 = icmp sgt i32 %.add40, 88
  %..add40 = select i1 %cmp45, i32 88, i32 %.add40
  %arrayidx49 = getelementptr inbounds [89 x i32], [89 x i32]* @stepsizeTable, i32 0, i32 %..add40
  %7 = load i32, i32* %arrayidx49, align 4, !tbaa !7
  %conv50 = trunc i32 %valpred.2 to i16
  %incdec.ptr51 = getelementptr inbounds i16, i16* %outp.085, i32 1
  store i16 %conv50, i16* %outp.085, align 2, !tbaa !10
  %dec = add nsw i32 %len.addr.083, -1
  %cmp = icmp sgt i32 %len.addr.083, 1
  br i1 %cmp, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %if.end
  %..add40.lcssa = phi i32 [ %..add40, %if.end ]
  %valpred.2.lcssa = phi i32 [ %valpred.2, %if.end ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %index.0.lcssa = phi i32 [ %conv2, %entry ], [ %..add40.lcssa, %for.end.loopexit ]
  %valpred.0.lcssa = phi i32 [ %conv, %entry ], [ %valpred.2.lcssa, %for.end.loopexit ]
  %conv52 = trunc i32 %valpred.0.lcssa to i16
  store i16 %conv52, i16* %valprev, align 2, !tbaa !1
  %conv54 = trunc i32 %index.0.lcssa to i8
  store i8 %conv54, i8* %index1, align 1, !tbaa !6
  ret void
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
!1 = !{!2, !3, i64 0}
!2 = !{!"adpcm_state", !3, i64 0, !4, i64 2}
!3 = !{!"short", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!2, !4, i64 2}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !4, i64 0}
!9 = !{!4, !4, i64 0}
!10 = !{!3, !3, i64 0}
