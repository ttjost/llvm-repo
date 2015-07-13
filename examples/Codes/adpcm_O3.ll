; ModuleID = '/home/jost/llvm_build/llvm/examples/Codes/adpcm.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.adpcm_state = type { i16, i8 }

@pcmdata = global [10 x i16] [i16 0, i16 0, i16 16, i16 16, i16 16, i16 24, i16 24, i16 24, i16 32, i16 32], align 16
@adpcmdata_ref = global [5 x i8] c"\00q\82\008", align 1
@pcmdata_2_ref = global [10 x i16] [i16 0, i16 0, i16 11, i16 17, i16 16, i16 23, i16 24, i16 25, i16 33, i16 32], align 16
@coder_state = common global %struct.adpcm_state zeroinitializer, align 2
@decoder_state = common global %struct.adpcm_state zeroinitializer, align 2
@adpcmdata = common global [5 x i8] zeroinitializer, align 1
@pcmdata_2 = common global [10 x i16] zeroinitializer, align 16
@stepsizeTable = internal unnamed_addr constant [89 x i32] [i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 16, i32 17, i32 19, i32 21, i32 23, i32 25, i32 28, i32 31, i32 34, i32 37, i32 41, i32 45, i32 50, i32 55, i32 60, i32 66, i32 73, i32 80, i32 88, i32 97, i32 107, i32 118, i32 130, i32 143, i32 157, i32 173, i32 190, i32 209, i32 230, i32 253, i32 279, i32 307, i32 337, i32 371, i32 408, i32 449, i32 494, i32 544, i32 598, i32 658, i32 724, i32 796, i32 876, i32 963, i32 1060, i32 1166, i32 1282, i32 1411, i32 1552, i32 1707, i32 1878, i32 2066, i32 2272, i32 2499, i32 2749, i32 3024, i32 3327, i32 3660, i32 4026, i32 4428, i32 4871, i32 5358, i32 5894, i32 6484, i32 7132, i32 7845, i32 8630, i32 9493, i32 10442, i32 11487, i32 12635, i32 13899, i32 15289, i32 16818, i32 18500, i32 20350, i32 22385, i32 24623, i32 27086, i32 29794, i32 32767], align 16
@indexTable = internal unnamed_addr constant [16 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 2, i32 4, i32 6, i32 8, i32 -1, i32 -1, i32 -1, i32 -1, i32 2, i32 4, i32 6, i32 8], align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  store i8 0, i8* getelementptr inbounds (%struct.adpcm_state, %struct.adpcm_state* @coder_state, i64 0, i32 1), align 2, !tbaa !1
  store i16 0, i16* getelementptr inbounds (%struct.adpcm_state, %struct.adpcm_state* @coder_state, i64 0, i32 0), align 2, !tbaa !6
  store i8 0, i8* getelementptr inbounds (%struct.adpcm_state, %struct.adpcm_state* @decoder_state, i64 0, i32 1), align 2, !tbaa !1
  store i16 0, i16* getelementptr inbounds (%struct.adpcm_state, %struct.adpcm_state* @decoder_state, i64 0, i32 0), align 2, !tbaa !6
  tail call void @adpcm_coder(i16* getelementptr inbounds ([10 x i16], [10 x i16]* @pcmdata, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @adpcmdata, i64 0, i64 0), i32 10, %struct.adpcm_state* @coder_state)
  %0 = load i16, i16* getelementptr inbounds (%struct.adpcm_state, %struct.adpcm_state* @decoder_state, i64 0, i32 0), align 2, !tbaa !6
  %conv.i = sext i16 %0 to i32
  %1 = load i8, i8* getelementptr inbounds (%struct.adpcm_state, %struct.adpcm_state* @decoder_state, i64 0, i32 1), align 2, !tbaa !1
  %conv2.i = sext i8 %1 to i32
  %idxprom.i = sext i8 %1 to i64
  %arrayidx.i = getelementptr inbounds [89 x i32], [89 x i32]* @stepsizeTable, i64 0, i64 %idxprom.i
  %2 = load i32, i32* %arrayidx.i, align 4, !tbaa !7
  br label %for.body.i

for.body.i:                                       ; preds = %if.end.i, %entry
  %bufferstep.093.i = phi i32 [ 0, %entry ], [ %lnot.ext.i, %if.end.i ]
  %inputbuffer.092.i = phi i32 [ undef, %entry ], [ %inputbuffer.1.i, %if.end.i ]
  %index.091.i = phi i32 [ %conv2.i, %entry ], [ %..add41.i, %if.end.i ]
  %valpred.090.i = phi i32 [ %conv.i, %entry ], [ %valpred.2.i, %if.end.i ]
  %step.089.i = phi i32 [ %2, %entry ], [ %7, %if.end.i ]
  %outp.088.i = phi i16* [ getelementptr inbounds ([10 x i16], [10 x i16]* @pcmdata_2, i64 0, i64 0), %entry ], [ %incdec.ptr53.i, %if.end.i ]
  %inp.087.i = phi i8* [ getelementptr inbounds ([5 x i8], [5 x i8]* @adpcmdata, i64 0, i64 0), %entry ], [ %inp.1.i, %if.end.i ]
  %len.addr.086.i = phi i32 [ 10, %entry ], [ %dec.i, %if.end.i ]
  %tobool.i = icmp ne i32 %bufferstep.093.i, 0
  br i1 %tobool.i, label %if.end.i, label %if.else.i

if.else.i:                                        ; preds = %for.body.i
  %incdec.ptr.i = getelementptr inbounds i8, i8* %inp.087.i, i64 1
  %3 = load i8, i8* %inp.087.i, align 1, !tbaa !9
  %conv4.i = sext i8 %3 to i32
  %shr83.i = lshr i32 %conv4.i, 4
  br label %if.end.i

if.end.i:                                         ; preds = %if.else.i, %for.body.i
  %inp.1.i = phi i8* [ %incdec.ptr.i, %if.else.i ], [ %inp.087.i, %for.body.i ]
  %delta.0.in.i = phi i32 [ %shr83.i, %if.else.i ], [ %inputbuffer.092.i, %for.body.i ]
  %inputbuffer.1.i = phi i32 [ %conv4.i, %if.else.i ], [ %inputbuffer.092.i, %for.body.i ]
  %delta.0.i = and i32 %delta.0.in.i, 15
  %4 = zext i1 %tobool.i to i32
  %lnot.ext.i = xor i32 %4, 1
  %shr7.i = ashr i32 %step.089.i, 3
  %and8.i = and i32 %delta.0.in.i, 4
  %tobool9.i = icmp eq i32 %and8.i, 0
  %add.i = select i1 %tobool9.i, i32 0, i32 %step.089.i
  %shr7.add.i = add nsw i32 %add.i, %shr7.i
  %and12.i = and i32 %delta.0.in.i, 2
  %tobool13.i = icmp eq i32 %and12.i, 0
  %shr15.i = ashr i32 %step.089.i, 1
  %add16.i = select i1 %tobool13.i, i32 0, i32 %shr15.i
  %vpdiff.1.i = add nsw i32 %shr7.add.i, %add16.i
  %and18.i = and i32 %delta.0.in.i, 1
  %tobool19.i = icmp eq i32 %and18.i, 0
  %shr21.i = ashr i32 %step.089.i, 2
  %add22.i = select i1 %tobool19.i, i32 0, i32 %shr21.i
  %vpdiff.2.i = add nsw i32 %vpdiff.1.i, %add22.i
  %and24.i = and i32 %delta.0.in.i, 8
  %tobool25.i = icmp eq i32 %and24.i, 0
  %5 = sub i32 0, %vpdiff.2.i
  %valpred.1.p.i = select i1 %tobool25.i, i32 %vpdiff.2.i, i32 %5
  %valpred.1.i = add i32 %valpred.1.p.i, %valpred.090.i
  %cmp30.i = icmp sgt i32 %valpred.1.i, 32767
  %cmp34.i = icmp slt i32 %valpred.1.i, -32768
  %.valpred.1.i = select i1 %cmp34.i, i32 -32768, i32 %valpred.1.i
  %valpred.2.i = select i1 %cmp30.i, i32 32767, i32 %.valpred.1.i
  %idxprom3984.i = zext i32 %delta.0.i to i64
  %arrayidx40.i = getelementptr inbounds [16 x i32], [16 x i32]* @indexTable, i64 0, i64 %idxprom3984.i
  %6 = load i32, i32* %arrayidx40.i, align 4, !tbaa !7
  %add41.i = add nsw i32 %6, %index.091.i
  %cmp42.i = icmp slt i32 %add41.i, 0
  %.add41.i = select i1 %cmp42.i, i32 0, i32 %add41.i
  %cmp46.i = icmp sgt i32 %.add41.i, 88
  %..add41.i = select i1 %cmp46.i, i32 88, i32 %.add41.i
  %idxprom50.i = sext i32 %..add41.i to i64
  %arrayidx51.i = getelementptr inbounds [89 x i32], [89 x i32]* @stepsizeTable, i64 0, i64 %idxprom50.i
  %7 = load i32, i32* %arrayidx51.i, align 4, !tbaa !7
  %conv52.i = trunc i32 %valpred.2.i to i16
  %incdec.ptr53.i = getelementptr inbounds i16, i16* %outp.088.i, i64 1
  store i16 %conv52.i, i16* %outp.088.i, align 2, !tbaa !10
  %dec.i = add nsw i32 %len.addr.086.i, -1
  %cmp.i = icmp sgt i32 %len.addr.086.i, 1
  br i1 %cmp.i, label %for.body.i, label %adpcm_decoder.exit

adpcm_decoder.exit:                               ; preds = %if.end.i
  %conv52.i.lcssa = phi i16 [ %conv52.i, %if.end.i ]
  %..add41.i.lcssa = phi i32 [ %..add41.i, %if.end.i ]
  store i16 %conv52.i.lcssa, i16* getelementptr inbounds (%struct.adpcm_state, %struct.adpcm_state* @decoder_state, i64 0, i32 0), align 2, !tbaa !6
  %conv56.i = trunc i32 %..add41.i.lcssa to i8
  store i8 %conv56.i, i8* getelementptr inbounds (%struct.adpcm_state, %struct.adpcm_state* @decoder_state, i64 0, i32 1), align 2, !tbaa !1
  %8 = load i16, i16* getelementptr inbounds (%struct.adpcm_state, %struct.adpcm_state* @coder_state, i64 0, i32 0), align 2, !tbaa !6
  %cmp = icmp eq i16 %8, 32
  %9 = load i8, i8* getelementptr inbounds (%struct.adpcm_state, %struct.adpcm_state* @coder_state, i64 0, i32 1), align 2
  %cmp3 = icmp eq i8 %9, 1
  %or.cond = and i1 %cmp, %cmp3
  br i1 %or.cond, label %if.end, label %return

if.end:                                           ; preds = %adpcm_decoder.exit
  %cmp6 = icmp eq i16 %conv52.i.lcssa, 32
  %cmp10 = icmp eq i8 %conv56.i, 1
  %or.cond27 = and i1 %cmp10, %cmp6
  br i1 %or.cond27, label %for.cond.preheader, label %return

for.cond.preheader:                               ; preds = %if.end
  %10 = load i16, i16* getelementptr inbounds ([10 x i16], [10 x i16]* @pcmdata_2, i64 0, i64 0), align 16, !tbaa !10
  %11 = load i16, i16* getelementptr inbounds ([10 x i16], [10 x i16]* @pcmdata_2_ref, i64 0, i64 0), align 16, !tbaa !10
  %cmp20 = icmp eq i16 %10, %11
  br i1 %cmp20, label %for.inc, label %return

for.inc:                                          ; preds = %for.cond.preheader
  %12 = load i16, i16* getelementptr inbounds ([10 x i16], [10 x i16]* @pcmdata_2, i64 0, i64 1), align 2, !tbaa !10
  %13 = load i16, i16* getelementptr inbounds ([10 x i16], [10 x i16]* @pcmdata_2_ref, i64 0, i64 1), align 2, !tbaa !10
  %cmp20.1 = icmp eq i16 %12, %13
  br i1 %cmp20.1, label %for.inc.1, label %return

return:                                           ; preds = %for.cond.preheader, %for.inc, %for.inc.1, %for.inc.2, %for.inc.3, %for.inc.4, %for.inc.5, %for.inc.6, %for.inc.7, %if.end, %adpcm_decoder.exit
  %retval.0 = phi i32 [ -3, %adpcm_decoder.exit ], [ -2, %if.end ], [ 0, %for.cond.preheader ], [ 1, %for.inc ], [ 2, %for.inc.1 ], [ 3, %for.inc.2 ], [ 4, %for.inc.3 ], [ 5, %for.inc.4 ], [ 6, %for.inc.5 ], [ 7, %for.inc.6 ], [ 8, %for.inc.7 ]
  ret i32 %retval.0

for.inc.1:                                        ; preds = %for.inc
  %14 = load i16, i16* getelementptr inbounds ([10 x i16], [10 x i16]* @pcmdata_2, i64 0, i64 2), align 4, !tbaa !10
  %15 = load i16, i16* getelementptr inbounds ([10 x i16], [10 x i16]* @pcmdata_2_ref, i64 0, i64 2), align 4, !tbaa !10
  %cmp20.2 = icmp eq i16 %14, %15
  br i1 %cmp20.2, label %for.inc.2, label %return

for.inc.2:                                        ; preds = %for.inc.1
  %16 = load i16, i16* getelementptr inbounds ([10 x i16], [10 x i16]* @pcmdata_2, i64 0, i64 3), align 2, !tbaa !10
  %17 = load i16, i16* getelementptr inbounds ([10 x i16], [10 x i16]* @pcmdata_2_ref, i64 0, i64 3), align 2, !tbaa !10
  %cmp20.3 = icmp eq i16 %16, %17
  br i1 %cmp20.3, label %for.inc.3, label %return

for.inc.3:                                        ; preds = %for.inc.2
  %18 = load i16, i16* getelementptr inbounds ([10 x i16], [10 x i16]* @pcmdata_2, i64 0, i64 4), align 8, !tbaa !10
  %19 = load i16, i16* getelementptr inbounds ([10 x i16], [10 x i16]* @pcmdata_2_ref, i64 0, i64 4), align 8, !tbaa !10
  %cmp20.4 = icmp eq i16 %18, %19
  br i1 %cmp20.4, label %for.inc.4, label %return

for.inc.4:                                        ; preds = %for.inc.3
  %20 = load i16, i16* getelementptr inbounds ([10 x i16], [10 x i16]* @pcmdata_2, i64 0, i64 5), align 2, !tbaa !10
  %21 = load i16, i16* getelementptr inbounds ([10 x i16], [10 x i16]* @pcmdata_2_ref, i64 0, i64 5), align 2, !tbaa !10
  %cmp20.5 = icmp eq i16 %20, %21
  br i1 %cmp20.5, label %for.inc.5, label %return

for.inc.5:                                        ; preds = %for.inc.4
  %22 = load i16, i16* getelementptr inbounds ([10 x i16], [10 x i16]* @pcmdata_2, i64 0, i64 6), align 4, !tbaa !10
  %23 = load i16, i16* getelementptr inbounds ([10 x i16], [10 x i16]* @pcmdata_2_ref, i64 0, i64 6), align 4, !tbaa !10
  %cmp20.6 = icmp eq i16 %22, %23
  br i1 %cmp20.6, label %for.inc.6, label %return

for.inc.6:                                        ; preds = %for.inc.5
  %24 = load i16, i16* getelementptr inbounds ([10 x i16], [10 x i16]* @pcmdata_2, i64 0, i64 7), align 2, !tbaa !10
  %25 = load i16, i16* getelementptr inbounds ([10 x i16], [10 x i16]* @pcmdata_2_ref, i64 0, i64 7), align 2, !tbaa !10
  %cmp20.7 = icmp eq i16 %24, %25
  br i1 %cmp20.7, label %for.inc.7, label %return

for.inc.7:                                        ; preds = %for.inc.6
  %26 = load i16, i16* getelementptr inbounds ([10 x i16], [10 x i16]* @pcmdata_2, i64 0, i64 8), align 16, !tbaa !10
  %27 = load i16, i16* getelementptr inbounds ([10 x i16], [10 x i16]* @pcmdata_2_ref, i64 0, i64 8), align 16, !tbaa !10
  %cmp20.8 = icmp eq i16 %26, %27
  br i1 %cmp20.8, label %for.inc.8, label %return

for.inc.8:                                        ; preds = %for.inc.7
  %28 = load i16, i16* getelementptr inbounds ([10 x i16], [10 x i16]* @pcmdata_2, i64 0, i64 9), align 2, !tbaa !10
  %29 = load i16, i16* getelementptr inbounds ([10 x i16], [10 x i16]* @pcmdata_2_ref, i64 0, i64 9), align 2, !tbaa !10
  %cmp20.9 = icmp eq i16 %28, %29
  %. = select i1 %cmp20.9, i32 -1, i32 9
  ret i32 %.
}

; Function Attrs: nounwind uwtable
define void @adpcm_coder(i16* nocapture readonly %indata, i8* nocapture %outdata, i32 %len, %struct.adpcm_state* nocapture %state) #0 {
entry:
  %valprev = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %state, i64 0, i32 0
  %0 = load i16, i16* %valprev, align 2, !tbaa !6
  %conv = sext i16 %0 to i32
  %index1 = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %state, i64 0, i32 1
  %1 = load i8, i8* %index1, align 1, !tbaa !1
  %conv2 = sext i8 %1 to i32
  %cmp114 = icmp sgt i32 %len, 0
  br i1 %cmp114, label %for.body.lr.ph, label %if.end68

for.body.lr.ph:                                   ; preds = %entry
  %idxprom = sext i8 %1 to i64
  %arrayidx = getelementptr inbounds [89 x i32], [89 x i32]* @stepsizeTable, i64 0, i64 %idxprom
  %2 = load i32, i32* %arrayidx, align 4, !tbaa !7
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %if.end62
  %bufferstep.0122 = phi i32 [ 1, %for.body.lr.ph ], [ %lnot.ext, %if.end62 ]
  %outputbuffer.0121 = phi i32 [ undef, %for.body.lr.ph ], [ %outputbuffer.1, %if.end62 ]
  %index.0120 = phi i32 [ %conv2, %for.body.lr.ph ], [ %..add44, %if.end62 ]
  %valpred.0119 = phi i32 [ %conv, %for.body.lr.ph ], [ %valpred.2, %if.end62 ]
  %step.0118 = phi i32 [ %2, %for.body.lr.ph ], [ %9, %if.end62 ]
  %len.addr.0117 = phi i32 [ %len, %for.body.lr.ph ], [ %dec, %if.end62 ]
  %outp.0116 = phi i8* [ %outdata, %for.body.lr.ph ], [ %outp.1, %if.end62 ]
  %inp.0115 = phi i16* [ %indata, %for.body.lr.ph ], [ %incdec.ptr, %if.end62 ]
  %incdec.ptr = getelementptr inbounds i16, i16* %inp.0115, i64 1
  %3 = load i16, i16* %inp.0115, align 2, !tbaa !10
  %conv4 = sext i16 %3 to i32
  %sub = sub nsw i32 %conv4, %valpred.0119
  %cmp5 = icmp sgt i32 %sub, -1
  %sub7 = sub nsw i32 0, %sub
  %4 = ashr i32 %sub, 31
  %5 = and i32 %4, 8
  %diff.0 = select i1 %cmp5, i32 %sub, i32 %sub7
  %shr = ashr i32 %step.0118, 3
  %cmp8 = icmp slt i32 %diff.0, %step.0118
  %delta.0 = select i1 %cmp8, i32 0, i32 4
  %sub11 = select i1 %cmp8, i32 0, i32 %step.0118
  %diff.1 = sub nsw i32 %diff.0, %sub11
  %vpdiff.0 = add nsw i32 %sub11, %shr
  %shr13 = ashr i32 %step.0118, 1
  %cmp14 = icmp slt i32 %diff.1, %shr13
  br i1 %cmp14, label %if.end19, label %if.then16

if.then16:                                        ; preds = %for.body
  %or = or i32 %delta.0, 2
  %sub17 = sub nsw i32 %diff.1, %shr13
  %add18 = add nsw i32 %vpdiff.0, %shr13
  br label %if.end19

if.end19:                                         ; preds = %for.body, %if.then16
  %delta.1 = phi i32 [ %or, %if.then16 ], [ %delta.0, %for.body ]
  %diff.2 = phi i32 [ %sub17, %if.then16 ], [ %diff.1, %for.body ]
  %vpdiff.1 = phi i32 [ %add18, %if.then16 ], [ %vpdiff.0, %for.body ]
  %shr20 = ashr i32 %step.0118, 2
  %cmp21 = icmp slt i32 %diff.2, %shr20
  %6 = zext i1 %cmp21 to i32
  %or24 = xor i32 %6, 1
  %add25 = select i1 %cmp21, i32 0, i32 %shr20
  %vpdiff.2 = add nsw i32 %add25, %vpdiff.1
  %7 = sub i32 0, %vpdiff.2
  %valpred.1.p = select i1 %cmp5, i32 %vpdiff.2, i32 %7
  %valpred.1 = add i32 %valpred.1.p, %valpred.0119
  %cmp32 = icmp sgt i32 %valpred.1, 32767
  %cmp36 = icmp slt i32 %valpred.1, -32768
  %.valpred.1 = select i1 %cmp36, i32 -32768, i32 %valpred.1
  %valpred.2 = select i1 %cmp32, i32 32767, i32 %.valpred.1
  %delta.2 = or i32 %delta.1, %5
  %or41 = or i32 %delta.2, %or24
  %idxprom42 = sext i32 %or41 to i64
  %arrayidx43 = getelementptr inbounds [16 x i32], [16 x i32]* @indexTable, i64 0, i64 %idxprom42
  %8 = load i32, i32* %arrayidx43, align 4, !tbaa !7
  %add44 = add nsw i32 %8, %index.0120
  %cmp45 = icmp slt i32 %add44, 0
  %.add44 = select i1 %cmp45, i32 0, i32 %add44
  %cmp49 = icmp sgt i32 %.add44, 88
  %..add44 = select i1 %cmp49, i32 88, i32 %.add44
  %idxprom53 = sext i32 %..add44 to i64
  %arrayidx54 = getelementptr inbounds [89 x i32], [89 x i32]* @stepsizeTable, i64 0, i64 %idxprom53
  %9 = load i32, i32* %arrayidx54, align 4, !tbaa !7
  %tobool55 = icmp ne i32 %bufferstep.0122, 0
  br i1 %tobool55, label %if.then56, label %if.else57

if.then56:                                        ; preds = %if.end19
  %shl = shl nsw i32 %or41, 4
  %and = and i32 %shl, 240
  br label %if.end62

if.else57:                                        ; preds = %if.end19
  %and58 = and i32 %or41, 15
  %or59 = or i32 %and58, %outputbuffer.0121
  %conv60 = trunc i32 %or59 to i8
  %incdec.ptr61 = getelementptr inbounds i8, i8* %outp.0116, i64 1
  store i8 %conv60, i8* %outp.0116, align 1, !tbaa !9
  br label %if.end62

if.end62:                                         ; preds = %if.else57, %if.then56
  %outp.1 = phi i8* [ %outp.0116, %if.then56 ], [ %incdec.ptr61, %if.else57 ]
  %outputbuffer.1 = phi i32 [ %and, %if.then56 ], [ %outputbuffer.0121, %if.else57 ]
  %10 = zext i1 %tobool55 to i32
  %lnot.ext = xor i32 %10, 1
  %dec = add nsw i32 %len.addr.0117, -1
  %cmp = icmp sgt i32 %len.addr.0117, 1
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %if.end62
  %outputbuffer.1.lcssa = phi i32 [ %outputbuffer.1, %if.end62 ]
  %outp.1.lcssa = phi i8* [ %outp.1, %if.end62 ]
  %tobool55.lcssa = phi i1 [ %tobool55, %if.end62 ]
  %..add44.lcssa = phi i32 [ %..add44, %if.end62 ]
  %valpred.2.lcssa = phi i32 [ %valpred.2, %if.end62 ]
  br i1 %tobool55.lcssa, label %if.then65, label %if.end68

if.then65:                                        ; preds = %for.end
  %conv66 = trunc i32 %outputbuffer.1.lcssa to i8
  store i8 %conv66, i8* %outp.1.lcssa, align 1, !tbaa !9
  br label %if.end68

if.end68:                                         ; preds = %entry, %for.end, %if.then65
  %valpred.0.lcssa128 = phi i32 [ %valpred.2.lcssa, %for.end ], [ %valpred.2.lcssa, %if.then65 ], [ %conv, %entry ]
  %index.0.lcssa127 = phi i32 [ %..add44.lcssa, %for.end ], [ %..add44.lcssa, %if.then65 ], [ %conv2, %entry ]
  %conv69 = trunc i32 %valpred.0.lcssa128 to i16
  store i16 %conv69, i16* %valprev, align 2, !tbaa !6
  %conv71 = trunc i32 %index.0.lcssa127 to i8
  store i8 %conv71, i8* %index1, align 1, !tbaa !1
  ret void
}

; Function Attrs: nounwind uwtable
define void @adpcm_decoder(i8* nocapture readonly %indata, i16* nocapture %outdata, i32 %len, %struct.adpcm_state* nocapture %state) #0 {
entry:
  %valprev = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %state, i64 0, i32 0
  %0 = load i16, i16* %valprev, align 2, !tbaa !6
  %conv = sext i16 %0 to i32
  %index1 = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %state, i64 0, i32 1
  %1 = load i8, i8* %index1, align 1, !tbaa !1
  %conv2 = sext i8 %1 to i32
  %cmp85 = icmp sgt i32 %len, 0
  br i1 %cmp85, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %idxprom = sext i8 %1 to i64
  %arrayidx = getelementptr inbounds [89 x i32], [89 x i32]* @stepsizeTable, i64 0, i64 %idxprom
  %2 = load i32, i32* %arrayidx, align 4, !tbaa !7
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %if.end
  %bufferstep.093 = phi i32 [ 0, %for.body.lr.ph ], [ %lnot.ext, %if.end ]
  %inputbuffer.092 = phi i32 [ undef, %for.body.lr.ph ], [ %inputbuffer.1, %if.end ]
  %index.091 = phi i32 [ %conv2, %for.body.lr.ph ], [ %..add41, %if.end ]
  %valpred.090 = phi i32 [ %conv, %for.body.lr.ph ], [ %valpred.2, %if.end ]
  %step.089 = phi i32 [ %2, %for.body.lr.ph ], [ %7, %if.end ]
  %outp.088 = phi i16* [ %outdata, %for.body.lr.ph ], [ %incdec.ptr53, %if.end ]
  %inp.087 = phi i8* [ %indata, %for.body.lr.ph ], [ %inp.1, %if.end ]
  %len.addr.086 = phi i32 [ %len, %for.body.lr.ph ], [ %dec, %if.end ]
  %tobool = icmp ne i32 %bufferstep.093, 0
  br i1 %tobool, label %if.end, label %if.else

if.else:                                          ; preds = %for.body
  %incdec.ptr = getelementptr inbounds i8, i8* %inp.087, i64 1
  %3 = load i8, i8* %inp.087, align 1, !tbaa !9
  %conv4 = sext i8 %3 to i32
  %shr83 = lshr i32 %conv4, 4
  br label %if.end

if.end:                                           ; preds = %for.body, %if.else
  %inp.1 = phi i8* [ %incdec.ptr, %if.else ], [ %inp.087, %for.body ]
  %delta.0.in = phi i32 [ %shr83, %if.else ], [ %inputbuffer.092, %for.body ]
  %inputbuffer.1 = phi i32 [ %conv4, %if.else ], [ %inputbuffer.092, %for.body ]
  %delta.0 = and i32 %delta.0.in, 15
  %4 = zext i1 %tobool to i32
  %lnot.ext = xor i32 %4, 1
  %shr7 = ashr i32 %step.089, 3
  %and8 = and i32 %delta.0.in, 4
  %tobool9 = icmp eq i32 %and8, 0
  %add = select i1 %tobool9, i32 0, i32 %step.089
  %shr7.add = add nsw i32 %add, %shr7
  %and12 = and i32 %delta.0.in, 2
  %tobool13 = icmp eq i32 %and12, 0
  %shr15 = ashr i32 %step.089, 1
  %add16 = select i1 %tobool13, i32 0, i32 %shr15
  %vpdiff.1 = add nsw i32 %shr7.add, %add16
  %and18 = and i32 %delta.0.in, 1
  %tobool19 = icmp eq i32 %and18, 0
  %shr21 = ashr i32 %step.089, 2
  %add22 = select i1 %tobool19, i32 0, i32 %shr21
  %vpdiff.2 = add nsw i32 %vpdiff.1, %add22
  %and24 = and i32 %delta.0.in, 8
  %tobool25 = icmp eq i32 %and24, 0
  %5 = sub i32 0, %vpdiff.2
  %valpred.1.p = select i1 %tobool25, i32 %vpdiff.2, i32 %5
  %valpred.1 = add i32 %valpred.1.p, %valpred.090
  %cmp30 = icmp sgt i32 %valpred.1, 32767
  %cmp34 = icmp slt i32 %valpred.1, -32768
  %.valpred.1 = select i1 %cmp34, i32 -32768, i32 %valpred.1
  %valpred.2 = select i1 %cmp30, i32 32767, i32 %.valpred.1
  %idxprom3984 = zext i32 %delta.0 to i64
  %arrayidx40 = getelementptr inbounds [16 x i32], [16 x i32]* @indexTable, i64 0, i64 %idxprom3984
  %6 = load i32, i32* %arrayidx40, align 4, !tbaa !7
  %add41 = add nsw i32 %6, %index.091
  %cmp42 = icmp slt i32 %add41, 0
  %.add41 = select i1 %cmp42, i32 0, i32 %add41
  %cmp46 = icmp sgt i32 %.add41, 88
  %..add41 = select i1 %cmp46, i32 88, i32 %.add41
  %idxprom50 = sext i32 %..add41 to i64
  %arrayidx51 = getelementptr inbounds [89 x i32], [89 x i32]* @stepsizeTable, i64 0, i64 %idxprom50
  %7 = load i32, i32* %arrayidx51, align 4, !tbaa !7
  %conv52 = trunc i32 %valpred.2 to i16
  %incdec.ptr53 = getelementptr inbounds i16, i16* %outp.088, i64 1
  store i16 %conv52, i16* %outp.088, align 2, !tbaa !10
  %dec = add nsw i32 %len.addr.086, -1
  %cmp = icmp sgt i32 %len.addr.086, 1
  br i1 %cmp, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %if.end
  %..add41.lcssa = phi i32 [ %..add41, %if.end ]
  %valpred.2.lcssa = phi i32 [ %valpred.2, %if.end ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %index.0.lcssa = phi i32 [ %conv2, %entry ], [ %..add41.lcssa, %for.end.loopexit ]
  %valpred.0.lcssa = phi i32 [ %conv, %entry ], [ %valpred.2.lcssa, %for.end.loopexit ]
  %conv54 = trunc i32 %valpred.0.lcssa to i16
  store i16 %conv54, i16* %valprev, align 2, !tbaa !6
  %conv56 = trunc i32 %index.0.lcssa to i8
  store i8 %conv56, i8* %index1, align 1, !tbaa !1
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
!1 = !{!2, !4, i64 2}
!2 = !{!"adpcm_state", !3, i64 0, !4, i64 2}
!3 = !{!"short", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!2, !3, i64 0}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !4, i64 0}
!9 = !{!4, !4, i64 0}
!10 = !{!3, !3, i64 0}
