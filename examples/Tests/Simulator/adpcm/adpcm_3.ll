; ModuleID = '/media/psf/Home/Dropbox/Universidade/Mestrado/llvm/examples/Tests/Simulator/powerstone/adpcm.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-pc-linux-gnu"

@rand.next = internal unnamed_addr global i32 1, align 4
@h = global [24 x i32] [i32 12, i32 -44, i32 -44, i32 212, i32 48, i32 -624, i32 128, i32 1448, i32 -840, i32 -3220, i32 3804, i32 15504, i32 15504, i32 3804, i32 -3220, i32 -840, i32 1448, i32 128, i32 -624, i32 48, i32 212, i32 -44, i32 -44, i32 12], align 4
@qq4_code4_table = global [16 x i32] [i32 0, i32 -20456, i32 -12896, i32 -8968, i32 -6288, i32 -4240, i32 -2584, i32 -1200, i32 20456, i32 12896, i32 8968, i32 6288, i32 4240, i32 2584, i32 1200, i32 0], align 4
@qq5_code5_table = global [32 x i32] [i32 -280, i32 -280, i32 -23352, i32 -17560, i32 -14120, i32 -11664, i32 -9752, i32 -8184, i32 -6864, i32 -5712, i32 -4696, i32 -3784, i32 -2960, i32 -2208, i32 -1520, i32 -880, i32 23352, i32 17560, i32 14120, i32 11664, i32 9752, i32 8184, i32 6864, i32 5712, i32 4696, i32 3784, i32 2960, i32 2208, i32 1520, i32 880, i32 280, i32 -280], align 4
@qq6_code6_table = global [64 x i32] [i32 -136, i32 -136, i32 -136, i32 -136, i32 -24808, i32 -21904, i32 -19008, i32 -16704, i32 -14984, i32 -13512, i32 -12280, i32 -11192, i32 -10232, i32 -9360, i32 -8576, i32 -7856, i32 -7192, i32 -6576, i32 -6000, i32 -5456, i32 -4944, i32 -4464, i32 -4008, i32 -3576, i32 -3168, i32 -2776, i32 -2400, i32 -2032, i32 -1688, i32 -1360, i32 -1040, i32 -728, i32 24808, i32 21904, i32 19008, i32 16704, i32 14984, i32 13512, i32 12280, i32 11192, i32 10232, i32 9360, i32 8576, i32 7856, i32 7192, i32 6576, i32 6000, i32 5456, i32 4944, i32 4464, i32 4008, i32 3576, i32 3168, i32 2776, i32 2400, i32 2032, i32 1688, i32 1360, i32 1040, i32 728, i32 432, i32 136, i32 -432, i32 -136], align 4
@wl_code_table = global [16 x i32] [i32 -60, i32 3042, i32 1198, i32 538, i32 334, i32 172, i32 58, i32 -30, i32 3042, i32 1198, i32 538, i32 334, i32 172, i32 58, i32 -30, i32 -60], align 4
@wl_table = global [8 x i32] [i32 -60, i32 -30, i32 58, i32 172, i32 334, i32 538, i32 1198, i32 3042], align 4
@ilb_table = global [32 x i32] [i32 2048, i32 2093, i32 2139, i32 2186, i32 2233, i32 2282, i32 2332, i32 2383, i32 2435, i32 2489, i32 2543, i32 2599, i32 2656, i32 2714, i32 2774, i32 2834, i32 2896, i32 2960, i32 3025, i32 3091, i32 3158, i32 3228, i32 3298, i32 3371, i32 3444, i32 3520, i32 3597, i32 3676, i32 3756, i32 3838, i32 3922, i32 4008], align 4
@decis_levl = global [30 x i32] [i32 280, i32 576, i32 880, i32 1200, i32 1520, i32 1864, i32 2208, i32 2584, i32 2960, i32 3376, i32 3784, i32 4240, i32 4696, i32 5200, i32 5712, i32 6288, i32 6864, i32 7520, i32 8184, i32 8968, i32 9752, i32 10712, i32 11664, i32 12896, i32 14120, i32 15840, i32 17560, i32 20456, i32 23352, i32 32767], align 4
@quant26bt_pos = global [31 x i32] [i32 61, i32 60, i32 59, i32 58, i32 57, i32 56, i32 55, i32 54, i32 53, i32 52, i32 51, i32 50, i32 49, i32 48, i32 47, i32 46, i32 45, i32 44, i32 43, i32 42, i32 41, i32 40, i32 39, i32 38, i32 37, i32 36, i32 35, i32 34, i32 33, i32 32, i32 32], align 4
@quant26bt_neg = global [31 x i32] [i32 63, i32 62, i32 31, i32 30, i32 29, i32 28, i32 27, i32 26, i32 25, i32 24, i32 23, i32 22, i32 21, i32 20, i32 19, i32 18, i32 17, i32 16, i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 4], align 4
@qq2_code2_table = global [4 x i32] [i32 -7408, i32 -1616, i32 7408, i32 1616], align 4
@wh_code_table = global [4 x i32] [i32 798, i32 -214, i32 798, i32 -214], align 4
@tqmf = common global [24 x i32] zeroinitializer, align 4
@xl = common global i32 0, align 4
@xh = common global i32 0, align 4
@delay_bpl = common global [6 x i32] zeroinitializer, align 4
@delay_dltx = common global [6 x i32] zeroinitializer, align 4
@szl = common global i32 0, align 4
@rlt1 = common global i32 0, align 4
@al1 = common global i32 0, align 4
@rlt2 = common global i32 0, align 4
@al2 = common global i32 0, align 4
@spl = common global i32 0, align 4
@sl = common global i32 0, align 4
@el = common global i32 0, align 4
@detl = common global i32 0, align 4
@il = common global i32 0, align 4
@dlt = common global i32 0, align 4
@nbl = common global i32 0, align 4
@plt = common global i32 0, align 4
@plt1 = common global i32 0, align 4
@plt2 = common global i32 0, align 4
@rlt = common global i32 0, align 4
@delay_bph = common global [6 x i32] zeroinitializer, align 4
@delay_dhx = common global [6 x i32] zeroinitializer, align 4
@szh = common global i32 0, align 4
@rh1 = common global i32 0, align 4
@ah1 = common global i32 0, align 4
@rh2 = common global i32 0, align 4
@ah2 = common global i32 0, align 4
@sph = common global i32 0, align 4
@sh = common global i32 0, align 4
@eh = common global i32 0, align 4
@ih = common global i32 0, align 4
@deth = common global i32 0, align 4
@dh = common global i32 0, align 4
@nbh = common global i32 0, align 4
@ph = common global i32 0, align 4
@ph1 = common global i32 0, align 4
@ph2 = common global i32 0, align 4
@yh = common global i32 0, align 4
@ilr = common global i32 0, align 4
@dec_del_bpl = common global [6 x i32] zeroinitializer, align 4
@dec_del_dltx = common global [6 x i32] zeroinitializer, align 4
@dec_szl = common global i32 0, align 4
@dec_rlt1 = common global i32 0, align 4
@dec_al1 = common global i32 0, align 4
@dec_rlt2 = common global i32 0, align 4
@dec_al2 = common global i32 0, align 4
@dec_spl = common global i32 0, align 4
@dec_sl = common global i32 0, align 4
@dec_detl = common global i32 0, align 4
@dec_dlt = common global i32 0, align 4
@dl = common global i32 0, align 4
@rl = common global i32 0, align 4
@dec_nbl = common global i32 0, align 4
@dec_plt = common global i32 0, align 4
@dec_plt1 = common global i32 0, align 4
@dec_plt2 = common global i32 0, align 4
@dec_rlt = common global i32 0, align 4
@dec_del_bph = common global [6 x i32] zeroinitializer, align 4
@dec_del_dhx = common global [6 x i32] zeroinitializer, align 4
@dec_szh = common global i32 0, align 4
@dec_rh1 = common global i32 0, align 4
@dec_ah1 = common global i32 0, align 4
@dec_rh2 = common global i32 0, align 4
@dec_ah2 = common global i32 0, align 4
@dec_sph = common global i32 0, align 4
@dec_sh = common global i32 0, align 4
@dec_deth = common global i32 0, align 4
@dec_dh = common global i32 0, align 4
@dec_nbh = common global i32 0, align 4
@dec_ph = common global i32 0, align 4
@dec_ph1 = common global i32 0, align 4
@dec_ph2 = common global i32 0, align 4
@rh = common global i32 0, align 4
@xd = common global i32 0, align 4
@xs = common global i32 0, align 4
@accumc = common global [11 x i32] zeroinitializer, align 4
@accumd = common global [11 x i32] zeroinitializer, align 4
@rs = common global i32 0, align 4
@yl = common global i32 0, align 4
@dec_yh = common global i32 0, align 4
@dec_rh = common global i32 0, align 4

; Function Attrs: nounwind readnone
define i32 @abs(i32 %x) #0 {
entry:
  %cmp = icmp slt i32 %x, 0
  %sub = sub nsw i32 0, %x
  %cond = select i1 %cmp, i32 %sub, i32 %x
  ret i32 %cond
}

; Function Attrs: nounwind
define i8* @memcpy(i8* %d, i8* nocapture readonly %s, i32 %t) #1 {
entry:
  %tobool5 = icmp eq i32 %t, 0
  br i1 %tobool5, label %while.end, label %overflow.checked

overflow.checked:                                 ; preds = %entry
  %n.vec = and i32 %t, -4
  %cmp.zero = icmp eq i32 %n.vec, 0
  %0 = add i32 %t, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %overflow.checked
  %scevgep9 = getelementptr i8, i8* %s, i32 %0
  %scevgep = getelementptr i8, i8* %d, i32 %0
  %bound0 = icmp uge i8* %scevgep9, %d
  %bound1 = icmp uge i8* %scevgep, %s
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8, i8* %s, i32 %n.vec
  %ptr.ind.end12 = getelementptr i8, i8* %d, i32 %n.vec
  %ind.end = sub i32 %t, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i32 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %next.gep = getelementptr i8, i8* %s, i32 %index
  %next.gep22 = getelementptr i8, i8* %d, i32 %index
  %1 = bitcast i8* %next.gep to i32*
  %wide.load31 = load i32, i32* %1, align 1, !tbaa !1
  %2 = bitcast i8* %next.gep22 to i32*
  store i32 %wide.load31, i32* %2, align 1, !tbaa !1
  %index.next = add i32 %index, 4
  %3 = icmp eq i32 %index.next, %n.vec
  br i1 %3, label %middle.block.loopexit, label %vector.body, !llvm.loop !4

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.memcheck, %overflow.checked
  %resume.val = phi i8* [ %s, %overflow.checked ], [ %s, %vector.memcheck ], [ %ptr.ind.end, %middle.block.loopexit ]
  %resume.val10 = phi i8* [ %d, %overflow.checked ], [ %d, %vector.memcheck ], [ %ptr.ind.end12, %middle.block.loopexit ]
  %resume.val13 = phi i32 [ %t, %overflow.checked ], [ %t, %vector.memcheck ], [ %ind.end, %middle.block.loopexit ]
  %new.indc.resume.val = phi i32 [ 0, %overflow.checked ], [ 0, %vector.memcheck ], [ %n.vec, %middle.block.loopexit ]
  %cmp.n = icmp eq i32 %new.indc.resume.val, %t
  br i1 %cmp.n, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %middle.block
  br label %while.body

while.body:                                       ; preds = %while.body.preheader, %while.body
  %ps.08 = phi i8* [ %incdec.ptr1, %while.body ], [ %resume.val, %while.body.preheader ]
  %pd.07 = phi i8* [ %incdec.ptr, %while.body ], [ %resume.val10, %while.body.preheader ]
  %t.addr.06 = phi i32 [ %dec, %while.body ], [ %resume.val13, %while.body.preheader ]
  %dec = add i32 %t.addr.06, -1
  %4 = load i8, i8* %ps.08, align 1, !tbaa !1
  store i8 %4, i8* %pd.07, align 1, !tbaa !1
  %incdec.ptr = getelementptr inbounds i8, i8* %pd.07, i32 1
  %incdec.ptr1 = getelementptr inbounds i8, i8* %ps.08, i32 1
  %tobool = icmp eq i32 %dec, 0
  br i1 %tobool, label %while.end.loopexit, label %while.body, !llvm.loop !7

while.end.loopexit:                               ; preds = %while.body
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %middle.block, %entry
  ret i8* %d
}

; Function Attrs: nounwind readonly
define i32 @strncmp(i8* nocapture readonly %s1, i8* nocapture readonly %s2, i32 %n) #2 {
entry:
  %cmp20 = icmp eq i32 %n, 0
  br i1 %cmp20, label %return, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.cond:                                         ; preds = %if.else
  %cmp = icmp ult i32 %inc, %n
  br i1 %cmp, label %for.body, label %return.loopexit

for.body:                                         ; preds = %for.body.preheader, %for.cond
  %i.021 = phi i32 [ %inc, %for.cond ], [ 0, %for.body.preheader ]
  %arrayidx = getelementptr inbounds i8, i8* %s1, i32 %i.021
  %0 = load i8, i8* %arrayidx, align 1, !tbaa !1
  %arrayidx1 = getelementptr inbounds i8, i8* %s2, i32 %i.021
  %1 = load i8, i8* %arrayidx1, align 1, !tbaa !1
  %cmp3 = icmp slt i8 %0, %1
  br i1 %cmp3, label %return.loopexit, label %if.else

if.else:                                          ; preds = %for.body
  %cmp9 = icmp sgt i8 %0, %1
  %inc = add nuw i32 %i.021, 1
  br i1 %cmp9, label %return.loopexit, label %for.cond

return.loopexit:                                  ; preds = %for.cond, %if.else, %for.body
  %retval.0.ph = phi i32 [ -1, %for.body ], [ 1, %if.else ], [ 0, %for.cond ]
  br label %return

return:                                           ; preds = %return.loopexit, %entry
  %retval.0 = phi i32 [ 0, %entry ], [ %retval.0.ph, %return.loopexit ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @rand() #1 {
entry:
  %0 = load i32, i32* @rand.next, align 4, !tbaa !8
  %mul = mul i32 %0, 1103515245
  %add = add i32 %mul, 12345
  store i32 %add, i32* @rand.next, align 4, !tbaa !8
  %div = lshr i32 %add, 16
  %rem = and i32 %div, 32767
  ret i32 %rem
}

; Function Attrs: nounwind
define i32 @encode(i32 %xin1, i32 %xin2) #1 {
entry:
  %0 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 0), align 4, !tbaa !10
  %1 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 0), align 4, !tbaa !10
  %mul = mul nsw i32 %1, %0
  %2 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 1), align 4, !tbaa !10
  %3 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 1), align 4, !tbaa !10
  %mul4 = mul nsw i32 %3, %2
  %4 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 2), align 4, !tbaa !10
  %5 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 2), align 4, !tbaa !10
  %mul7161 = mul nsw i32 %5, %4
  %add162 = add nsw i32 %mul7161, %mul
  %6 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 3), align 4, !tbaa !10
  %7 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 3), align 4, !tbaa !10
  %mul10 = mul nsw i32 %7, %6
  %add11 = add nsw i32 %mul10, %mul4
  %8 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 4), align 4, !tbaa !10
  %9 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 4), align 4, !tbaa !10
  %mul7 = mul nsw i32 %9, %8
  %add = add nsw i32 %mul7, %add162
  %10 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 5), align 4, !tbaa !10
  %11 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 5), align 4, !tbaa !10
  %mul10.1 = mul nsw i32 %11, %10
  %add11.1 = add nsw i32 %mul10.1, %add11
  %12 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 6), align 4, !tbaa !10
  %13 = load <4 x i32>, <4 x i32>* bitcast (i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 6) to <4 x i32>*), align 4, !tbaa !10
  %14 = extractelement <4 x i32> %13, i32 0
  %mul7.1 = mul nsw i32 %12, %14
  %add.1 = add nsw i32 %mul7.1, %add
  %15 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 7), align 4, !tbaa !10
  %16 = extractelement <4 x i32> %13, i32 1
  %mul10.2 = mul nsw i32 %15, %16
  %add11.2 = add nsw i32 %mul10.2, %add11.1
  %17 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 8), align 4, !tbaa !10
  %18 = extractelement <4 x i32> %13, i32 2
  %mul7.2 = mul nsw i32 %17, %18
  %add.2 = add nsw i32 %mul7.2, %add.1
  %19 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 9), align 4, !tbaa !10
  %20 = extractelement <4 x i32> %13, i32 3
  %mul10.3 = mul nsw i32 %19, %20
  %add11.3 = add nsw i32 %mul10.3, %add11.2
  %21 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 10), align 4, !tbaa !10
  %22 = load <4 x i32>, <4 x i32>* bitcast (i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 10) to <4 x i32>*), align 4, !tbaa !10
  %23 = extractelement <4 x i32> %22, i32 0
  %mul7.3 = mul nsw i32 %21, %23
  %add.3 = add nsw i32 %mul7.3, %add.2
  %24 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 11), align 4, !tbaa !10
  %25 = extractelement <4 x i32> %22, i32 1
  %mul10.4 = mul nsw i32 %24, %25
  %add11.4 = add nsw i32 %mul10.4, %add11.3
  %26 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 12), align 4, !tbaa !10
  %27 = extractelement <4 x i32> %22, i32 2
  %mul7.4 = mul nsw i32 %26, %27
  %add.4 = add nsw i32 %mul7.4, %add.3
  %28 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 13), align 4, !tbaa !10
  %29 = extractelement <4 x i32> %22, i32 3
  %mul10.5 = mul nsw i32 %28, %29
  %add11.5 = add nsw i32 %mul10.5, %add11.4
  %30 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 14), align 4, !tbaa !10
  %31 = load <4 x i32>, <4 x i32>* bitcast (i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 14) to <4 x i32>*), align 4, !tbaa !10
  %32 = extractelement <4 x i32> %31, i32 0
  %mul7.5 = mul nsw i32 %30, %32
  %add.5 = add nsw i32 %mul7.5, %add.4
  %33 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 15), align 4, !tbaa !10
  %34 = extractelement <4 x i32> %31, i32 1
  %mul10.6 = mul nsw i32 %33, %34
  %add11.6 = add nsw i32 %mul10.6, %add11.5
  %35 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 16), align 4, !tbaa !10
  %36 = extractelement <4 x i32> %31, i32 2
  %mul7.6 = mul nsw i32 %35, %36
  %add.6 = add nsw i32 %mul7.6, %add.5
  %37 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 17), align 4, !tbaa !10
  %38 = extractelement <4 x i32> %31, i32 3
  %mul10.7 = mul nsw i32 %37, %38
  %add11.7 = add nsw i32 %mul10.7, %add11.6
  %39 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 18), align 4, !tbaa !10
  %40 = load <4 x i32>, <4 x i32>* bitcast (i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 18) to <4 x i32>*), align 4, !tbaa !10
  %41 = extractelement <4 x i32> %40, i32 0
  %mul7.7 = mul nsw i32 %39, %41
  %add.7 = add nsw i32 %mul7.7, %add.6
  %42 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 19), align 4, !tbaa !10
  %43 = extractelement <4 x i32> %40, i32 1
  %mul10.8 = mul nsw i32 %42, %43
  %add11.8 = add nsw i32 %mul10.8, %add11.7
  %44 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 20), align 4, !tbaa !10
  %45 = extractelement <4 x i32> %40, i32 2
  %mul7.8 = mul nsw i32 %44, %45
  %add.8 = add nsw i32 %mul7.8, %add.7
  %46 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 21), align 4, !tbaa !10
  %47 = extractelement <4 x i32> %40, i32 3
  %mul10.9 = mul nsw i32 %46, %47
  %add11.9 = add nsw i32 %mul10.9, %add11.8
  %48 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 22), align 4, !tbaa !10
  %49 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 22), align 4, !tbaa !10
  %mul7.9 = mul nsw i32 %49, %48
  %add.9 = add nsw i32 %mul7.9, %add.8
  %50 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 23), align 4, !tbaa !10
  %51 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 23), align 4, !tbaa !10
  %mul17 = mul nsw i32 %51, %50
  store <4 x i32> %40, <4 x i32>* bitcast (i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 20) to <4 x i32>*), align 4, !tbaa !10
  store <4 x i32> %31, <4 x i32>* bitcast (i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 16) to <4 x i32>*), align 4, !tbaa !10
  store <4 x i32> %22, <4 x i32>* bitcast (i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 12) to <4 x i32>*), align 4, !tbaa !10
  store <4 x i32> %13, <4 x i32>* bitcast (i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 8) to <4 x i32>*), align 4, !tbaa !10
  store i32 %10, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 7), align 4, !tbaa !10
  store i32 %8, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 6), align 4, !tbaa !10
  %52 = load <4 x i32>, <4 x i32>* bitcast ([24 x i32]* @tqmf to <4 x i32>*), align 4, !tbaa !10
  store <4 x i32> %52, <4 x i32>* bitcast (i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 2) to <4 x i32>*), align 4, !tbaa !10
  %add18 = add nsw i32 %mul17, %add11.9
  store i32 %xin1, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 1), align 4, !tbaa !10
  store i32 %xin2, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 0), align 4, !tbaa !10
  %add28 = add nsw i32 %add18, %add.9
  %shr = ashr i32 %add28, 15
  store i32 %shr, i32* @xl, align 4, !tbaa !10
  %sub = sub nsw i32 %add.9, %add18
  %shr29 = ashr i32 %sub, 15
  store i32 %shr29, i32* @xh, align 4, !tbaa !10
  %53 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bpl, i32 0, i32 0), align 4, !tbaa !10
  %54 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dltx, i32 0, i32 0), align 4, !tbaa !10
  %mul.i = mul nsw i32 %54, %53
  %55 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bpl, i32 0, i32 1), align 4, !tbaa !10
  %56 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dltx, i32 0, i32 1), align 4, !tbaa !10
  %mul4.i = mul nsw i32 %56, %55
  %add.i = add nsw i32 %mul4.i, %mul.i
  %57 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bpl, i32 0, i32 2), align 4, !tbaa !10
  %58 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dltx, i32 0, i32 2), align 4, !tbaa !10
  %mul4.1.i = mul nsw i32 %58, %57
  %add.1.i = add nsw i32 %add.i, %mul4.1.i
  %59 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bpl, i32 0, i32 3), align 4, !tbaa !10
  %60 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dltx, i32 0, i32 3), align 4, !tbaa !10
  %mul4.2.i = mul nsw i32 %60, %59
  %add.2.i = add nsw i32 %add.1.i, %mul4.2.i
  %61 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bpl, i32 0, i32 4), align 4, !tbaa !10
  %62 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dltx, i32 0, i32 4), align 4, !tbaa !10
  %mul4.3.i = mul nsw i32 %62, %61
  %add.3.i = add nsw i32 %add.2.i, %mul4.3.i
  %63 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bpl, i32 0, i32 5), align 4, !tbaa !10
  %64 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dltx, i32 0, i32 5), align 4, !tbaa !10
  %mul4.4.i = mul nsw i32 %64, %63
  %add.4.i = add nsw i32 %add.3.i, %mul4.4.i
  %shr.i = ashr i32 %add.4.i, 14
  store i32 %shr.i, i32* @szl, align 4, !tbaa !10
  %65 = load i32, i32* @rlt1, align 4, !tbaa !10
  %66 = load i32, i32* @al1, align 4, !tbaa !10
  %67 = load i32, i32* @rlt2, align 4, !tbaa !10
  %68 = load i32, i32* @al2, align 4, !tbaa !10
  %mul1.i87 = mul i32 %66, %65
  %mul3.i = mul i32 %68, %67
  %tmp.i = add i32 %mul3.i, %mul1.i87
  %tmp6.i = shl i32 %tmp.i, 1
  %shr.i88 = ashr i32 %tmp6.i, 15
  store i32 %shr.i88, i32* @spl, align 4, !tbaa !10
  %add31 = add nsw i32 %shr.i88, %shr.i
  store i32 %add31, i32* @sl, align 4, !tbaa !10
  %sub32 = sub nsw i32 %shr, %add31
  store i32 %sub32, i32* @el, align 4, !tbaa !10
  %69 = load i32, i32* @detl, align 4, !tbaa !10
  %ispos.i = icmp sgt i32 %sub32, -1
  %neg.i = sub nsw i32 0, %sub32
  %70 = select i1 %ispos.i, i32 %sub32, i32 %neg.i
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc.i, %entry
  %mil.011.i = phi i32 [ 0, %entry ], [ %inc.i, %for.inc.i ]
  %arrayidx.i137 = getelementptr inbounds [30 x i32], [30 x i32]* @decis_levl, i32 0, i32 %mil.011.i
  %71 = load i32, i32* %arrayidx.i137, align 4, !tbaa !10
  %mul.i138 = mul nsw i32 %71, %69
  %shr.i139 = ashr i32 %mul.i138, 15
  %cmp1.i140 = icmp sgt i32 %70, %shr.i139
  br i1 %cmp1.i140, label %for.inc.i, label %quantl.exit

for.inc.i:                                        ; preds = %for.body.i
  %inc.i = add nuw nsw i32 %mil.011.i, 1
  %cmp.i141 = icmp slt i32 %inc.i, 30
  br i1 %cmp.i141, label %for.body.i, label %quantl.exit

quantl.exit:                                      ; preds = %for.body.i, %for.inc.i
  %mil.0.lcssa.i = phi i32 [ %mil.011.i, %for.body.i ], [ %inc.i, %for.inc.i ]
  %quant26bt_pos.quant26bt_neg.i = select i1 %ispos.i, [31 x i32]* @quant26bt_pos, [31 x i32]* @quant26bt_neg
  %ril.0.in.i = getelementptr inbounds [31 x i32], [31 x i32]* %quant26bt_pos.quant26bt_neg.i, i32 0, i32 %mil.0.lcssa.i
  %ril.0.i = load i32, i32* %ril.0.in.i, align 4
  store i32 %ril.0.i, i32* @il, align 4, !tbaa !10
  %shr34 = ashr i32 %ril.0.i, 2
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @qq4_code4_table, i32 0, i32 %shr34
  %72 = load i32, i32* %arrayidx, align 4, !tbaa !10
  %mul35 = mul nsw i32 %72, %69
  %shr36 = ashr i32 %mul35, 15
  store i32 %shr36, i32* @dlt, align 4, !tbaa !10
  %73 = load i32, i32* @nbl, align 4, !tbaa !10
  %mul.i149 = mul nsw i32 %73, 127
  %shr.i150 = ashr i32 %mul.i149, 7
  %arrayidx.i152 = getelementptr inbounds [16 x i32], [16 x i32]* @wl_code_table, i32 0, i32 %shr34
  %74 = load i32, i32* %arrayidx.i152, align 4, !tbaa !10
  %add.i153 = add nsw i32 %shr.i150, %74
  %cmp.i154 = icmp slt i32 %add.i153, 0
  %.add.i155 = select i1 %cmp.i154, i32 0, i32 %add.i153
  %cmp2.i = icmp sgt i32 %.add.i155, 18432
  %..add.i156 = select i1 %cmp2.i, i32 18432, i32 %.add.i155
  store i32 %..add.i156, i32* @nbl, align 4, !tbaa !10
  %shr4.i142 = lshr i32 %..add.i156, 6
  %and.i143 = and i32 %shr4.i142, 31
  %shr1.i144 = ashr i32 %..add.i156, 11
  %arrayidx.i145 = getelementptr inbounds [32 x i32], [32 x i32]* @ilb_table, i32 0, i32 %and.i143
  %75 = load i32, i32* %arrayidx.i145, align 4, !tbaa !10
  %sub.i146 = sub nsw i32 9, %shr1.i144
  %shr2.i147 = ashr i32 %75, %sub.i146
  %shl.i148 = shl i32 %shr2.i147, 3
  store i32 %shl.i148, i32* @detl, align 4, !tbaa !10
  %add39 = add nsw i32 %shr.i, %shr36
  store i32 %add39, i32* @plt, align 4, !tbaa !10
  tail call void @upzero(i32 %shr36, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dltx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bpl, i32 0, i32 0))
  %76 = load i32, i32* @al1, align 4, !tbaa !10
  %77 = load i32, i32* @al2, align 4, !tbaa !10
  %78 = load i32, i32* @plt, align 4, !tbaa !10
  %79 = load i32, i32* @plt1, align 4, !tbaa !10
  %80 = load i32, i32* @plt2, align 4, !tbaa !10
  %mul.i122 = shl nsw i32 %76, 2
  %mul1.i123 = mul nsw i32 %79, %78
  %cmp.i124 = icmp sgt i32 %mul1.i123, -1
  %sub.i125 = sub nsw i32 0, %mul.i122
  %sub.mul.i126 = select i1 %cmp.i124, i32 %sub.i125, i32 %mul.i122
  %shr.i127 = ashr i32 %sub.mul.i126, 7
  %mul2.i128 = mul nsw i32 %80, %78
  %81 = ashr i32 %mul2.i128, 31
  %82 = and i32 %81, -256
  %83 = or i32 %82, 128
  %mul7.i129 = mul nsw i32 %77, 127
  %shr8.i130 = ashr i32 %mul7.i129, 7
  %wd4.0.i131 = add nsw i32 %shr.i127, %shr8.i130
  %add9.i132 = add nsw i32 %wd4.0.i131, %83
  %cmp10.i133 = icmp sgt i32 %add9.i132, 12288
  %.add9.i134 = select i1 %cmp10.i133, i32 12288, i32 %add9.i132
  %cmp13.i135 = icmp slt i32 %.add9.i134, -12288
  %..add9.i136 = select i1 %cmp13.i135, i32 -12288, i32 %.add9.i134
  store i32 %..add9.i136, i32* @al2, align 4, !tbaa !10
  %mul.i112 = mul nsw i32 %76, 255
  %shr.i113 = ashr i32 %mul.i112, 8
  %84 = ashr i32 %mul1.i123, 31
  %85 = and i32 %84, -384
  %86 = add nsw i32 %shr.i113, 192
  %apl1.0.i115 = add nsw i32 %86, %85
  %sub2.i116 = sub nsw i32 15360, %..add9.i136
  %cmp3.i117 = icmp sgt i32 %apl1.0.i115, %sub2.i116
  %sub2.apl1.0.i118 = select i1 %cmp3.i117, i32 %sub2.i116, i32 %apl1.0.i115
  %sub6.i119 = sub nsw i32 0, %sub2.i116
  %cmp7.i120 = icmp slt i32 %sub2.apl1.0.i118, %sub6.i119
  %apl1.2.i121 = select i1 %cmp7.i120, i32 %sub6.i119, i32 %sub2.apl1.0.i118
  store i32 %apl1.2.i121, i32* @al1, align 4, !tbaa !10
  %87 = load i32, i32* @sl, align 4, !tbaa !10
  %88 = load i32, i32* @dlt, align 4, !tbaa !10
  %add42 = add nsw i32 %88, %87
  store i32 %add42, i32* @rlt, align 4, !tbaa !10
  %89 = load i32, i32* @rlt1, align 4, !tbaa !10
  store i32 %89, i32* @rlt2, align 4, !tbaa !10
  store i32 %add42, i32* @rlt1, align 4, !tbaa !10
  store i32 %79, i32* @plt2, align 4, !tbaa !10
  store i32 %78, i32* @plt1, align 4, !tbaa !10
  %90 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bph, i32 0, i32 0), align 4, !tbaa !10
  %91 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dhx, i32 0, i32 0), align 4, !tbaa !10
  %mul.i100 = mul nsw i32 %91, %90
  %92 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bph, i32 0, i32 1), align 4, !tbaa !10
  %93 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dhx, i32 0, i32 1), align 4, !tbaa !10
  %mul4.i101 = mul nsw i32 %93, %92
  %add.i102 = add nsw i32 %mul4.i101, %mul.i100
  %94 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bph, i32 0, i32 2), align 4, !tbaa !10
  %95 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dhx, i32 0, i32 2), align 4, !tbaa !10
  %mul4.1.i103 = mul nsw i32 %95, %94
  %add.1.i104 = add nsw i32 %add.i102, %mul4.1.i103
  %96 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bph, i32 0, i32 3), align 4, !tbaa !10
  %97 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dhx, i32 0, i32 3), align 4, !tbaa !10
  %mul4.2.i105 = mul nsw i32 %97, %96
  %add.2.i106 = add nsw i32 %add.1.i104, %mul4.2.i105
  %98 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bph, i32 0, i32 4), align 4, !tbaa !10
  %99 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dhx, i32 0, i32 4), align 4, !tbaa !10
  %mul4.3.i107 = mul nsw i32 %99, %98
  %add.3.i108 = add nsw i32 %add.2.i106, %mul4.3.i107
  %100 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bph, i32 0, i32 5), align 4, !tbaa !10
  %101 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dhx, i32 0, i32 5), align 4, !tbaa !10
  %mul4.4.i109 = mul nsw i32 %101, %100
  %add.4.i110 = add nsw i32 %add.3.i108, %mul4.4.i109
  %shr.i111 = ashr i32 %add.4.i110, 14
  store i32 %shr.i111, i32* @szh, align 4, !tbaa !10
  %102 = load i32, i32* @rh1, align 4, !tbaa !10
  %103 = load i32, i32* @ah1, align 4, !tbaa !10
  %104 = load i32, i32* @rh2, align 4, !tbaa !10
  %105 = load i32, i32* @ah2, align 4, !tbaa !10
  %mul1.i95 = mul i32 %103, %102
  %mul3.i96 = mul i32 %105, %104
  %tmp.i97 = add i32 %mul3.i96, %mul1.i95
  %tmp6.i98 = shl i32 %tmp.i97, 1
  %shr.i99 = ashr i32 %tmp6.i98, 15
  store i32 %shr.i99, i32* @sph, align 4, !tbaa !10
  %add45 = add nsw i32 %shr.i99, %shr.i111
  store i32 %add45, i32* @sh, align 4, !tbaa !10
  %106 = load i32, i32* @xh, align 4, !tbaa !10
  %sub46 = sub nsw i32 %106, %add45
  store i32 %sub46, i32* @eh, align 4, !tbaa !10
  %107 = ashr i32 %sub46, 31
  %108 = and i32 %107, -2
  %109 = add nsw i32 %108, 3
  store i32 %109, i32* @ih, align 4, !tbaa !10
  %110 = load i32, i32* @deth, align 4, !tbaa !10
  %mul48 = mul nsw i32 %110, 564
  %shr49 = ashr i32 %mul48, 12
  %ispos = icmp sgt i32 %sub46, -1
  %neg = sub i32 0, %sub46
  %111 = select i1 %ispos, i32 %sub46, i32 %neg
  %cmp51 = icmp sgt i32 %111, %shr49
  br i1 %cmp51, label %if.then52, label %if.end53

if.then52:                                        ; preds = %quantl.exit
  %dec = add nsw i32 %108, 2
  store i32 %dec, i32* @ih, align 4, !tbaa !10
  br label %if.end53

if.end53:                                         ; preds = %if.then52, %quantl.exit
  %112 = phi i32 [ %dec, %if.then52 ], [ %109, %quantl.exit ]
  %arrayidx54 = getelementptr inbounds [4 x i32], [4 x i32]* @qq2_code2_table, i32 0, i32 %112
  %113 = load i32, i32* %arrayidx54, align 4, !tbaa !10
  %mul55 = mul nsw i32 %113, %110
  %shr56 = ashr i32 %mul55, 15
  store i32 %shr56, i32* @dh, align 4, !tbaa !10
  %114 = load i32, i32* @nbh, align 4, !tbaa !10
  %mul.i90 = mul nsw i32 %114, 127
  %shr.i91 = ashr i32 %mul.i90, 7
  %arrayidx.i92 = getelementptr inbounds [4 x i32], [4 x i32]* @wh_code_table, i32 0, i32 %112
  %115 = load i32, i32* %arrayidx.i92, align 4, !tbaa !10
  %add.i93 = add nsw i32 %shr.i91, %115
  %cmp.i94 = icmp slt i32 %add.i93, 0
  %.add.i = select i1 %cmp.i94, i32 0, i32 %add.i93
  %cmp1.i = icmp sgt i32 %.add.i, 22528
  %..add.i = select i1 %cmp1.i, i32 22528, i32 %.add.i
  store i32 %..add.i, i32* @nbh, align 4, !tbaa !10
  %shr4.i = lshr i32 %..add.i, 6
  %and.i = and i32 %shr4.i, 31
  %shr1.i = ashr i32 %..add.i, 11
  %arrayidx.i = getelementptr inbounds [32 x i32], [32 x i32]* @ilb_table, i32 0, i32 %and.i
  %116 = load i32, i32* %arrayidx.i, align 4, !tbaa !10
  %sub.i89 = sub nsw i32 11, %shr1.i
  %shr2.i = ashr i32 %116, %sub.i89
  %shl.i = shl i32 %shr2.i, 3
  store i32 %shl.i, i32* @deth, align 4, !tbaa !10
  %add59 = add nsw i32 %shr.i111, %shr56
  store i32 %add59, i32* @ph, align 4, !tbaa !10
  tail call void @upzero(i32 %shr56, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dhx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bph, i32 0, i32 0))
  %117 = load i32, i32* @ah1, align 4, !tbaa !10
  %118 = load i32, i32* @ah2, align 4, !tbaa !10
  %119 = load i32, i32* @ph, align 4, !tbaa !10
  %120 = load i32, i32* @ph1, align 4, !tbaa !10
  %121 = load i32, i32* @ph2, align 4, !tbaa !10
  %mul.i84 = shl nsw i32 %117, 2
  %mul1.i85 = mul nsw i32 %120, %119
  %cmp.i = icmp sgt i32 %mul1.i85, -1
  %sub.i = sub nsw i32 0, %mul.i84
  %sub.mul.i = select i1 %cmp.i, i32 %sub.i, i32 %mul.i84
  %shr.i86 = ashr i32 %sub.mul.i, 7
  %mul2.i = mul nsw i32 %121, %119
  %122 = ashr i32 %mul2.i, 31
  %123 = and i32 %122, -256
  %124 = or i32 %123, 128
  %mul7.i = mul nsw i32 %118, 127
  %shr8.i = ashr i32 %mul7.i, 7
  %wd4.0.i = add nsw i32 %shr.i86, %shr8.i
  %add9.i = add nsw i32 %wd4.0.i, %124
  %cmp10.i = icmp sgt i32 %add9.i, 12288
  %.add9.i = select i1 %cmp10.i, i32 12288, i32 %add9.i
  %cmp13.i = icmp slt i32 %.add9.i, -12288
  %..add9.i = select i1 %cmp13.i, i32 -12288, i32 %.add9.i
  store i32 %..add9.i, i32* @ah2, align 4, !tbaa !10
  %mul.i82 = mul nsw i32 %117, 255
  %shr.i83 = ashr i32 %mul.i82, 8
  %125 = ashr i32 %mul1.i85, 31
  %126 = and i32 %125, -384
  %127 = add nsw i32 %shr.i83, 192
  %apl1.0.i = add nsw i32 %127, %126
  %sub2.i = sub nsw i32 15360, %..add9.i
  %cmp3.i = icmp sgt i32 %apl1.0.i, %sub2.i
  %sub2.apl1.0.i = select i1 %cmp3.i, i32 %sub2.i, i32 %apl1.0.i
  %sub6.i = sub nsw i32 0, %sub2.i
  %cmp7.i = icmp slt i32 %sub2.apl1.0.i, %sub6.i
  %apl1.2.i = select i1 %cmp7.i, i32 %sub6.i, i32 %sub2.apl1.0.i
  store i32 %apl1.2.i, i32* @ah1, align 4, !tbaa !10
  %128 = load i32, i32* @sh, align 4, !tbaa !10
  %129 = load i32, i32* @dh, align 4, !tbaa !10
  %add62 = add nsw i32 %129, %128
  store i32 %add62, i32* @yh, align 4, !tbaa !10
  %130 = load i32, i32* @rh1, align 4, !tbaa !10
  store i32 %130, i32* @rh2, align 4, !tbaa !10
  store i32 %add62, i32* @rh1, align 4, !tbaa !10
  store i32 %120, i32* @ph2, align 4, !tbaa !10
  store i32 %119, i32* @ph1, align 4, !tbaa !10
  %131 = load i32, i32* @il, align 4, !tbaa !10
  %132 = load i32, i32* @ih, align 4, !tbaa !10
  %shl = shl i32 %132, 6
  %or = or i32 %shl, %131
  ret i32 %or
}

; Function Attrs: nounwind readonly
define i32 @filtez(i32* nocapture readonly %bpl, i32* nocapture readonly %dlt) #2 {
entry:
  %0 = load i32, i32* %bpl, align 4, !tbaa !10
  %1 = load i32, i32* %dlt, align 4, !tbaa !10
  %mul = mul nsw i32 %1, %0
  %dlt.addr.013 = getelementptr inbounds i32, i32* %dlt, i32 1
  %bpl.addr.014 = getelementptr inbounds i32, i32* %bpl, i32 1
  %2 = load i32, i32* %bpl.addr.014, align 4, !tbaa !10
  %3 = load i32, i32* %dlt.addr.013, align 4, !tbaa !10
  %mul4 = mul nsw i32 %3, %2
  %add = add nsw i32 %mul4, %mul
  %dlt.addr.013.1 = getelementptr inbounds i32, i32* %dlt, i32 2
  %bpl.addr.014.1 = getelementptr inbounds i32, i32* %bpl, i32 2
  %4 = load i32, i32* %bpl.addr.014.1, align 4, !tbaa !10
  %5 = load i32, i32* %dlt.addr.013.1, align 4, !tbaa !10
  %mul4.1 = mul nsw i32 %5, %4
  %add.1 = add nsw i32 %mul4.1, %add
  %dlt.addr.013.2 = getelementptr inbounds i32, i32* %dlt, i32 3
  %bpl.addr.014.2 = getelementptr inbounds i32, i32* %bpl, i32 3
  %6 = load i32, i32* %bpl.addr.014.2, align 4, !tbaa !10
  %7 = load i32, i32* %dlt.addr.013.2, align 4, !tbaa !10
  %mul4.2 = mul nsw i32 %7, %6
  %add.2 = add nsw i32 %mul4.2, %add.1
  %dlt.addr.013.3 = getelementptr inbounds i32, i32* %dlt, i32 4
  %bpl.addr.014.3 = getelementptr inbounds i32, i32* %bpl, i32 4
  %8 = load i32, i32* %bpl.addr.014.3, align 4, !tbaa !10
  %9 = load i32, i32* %dlt.addr.013.3, align 4, !tbaa !10
  %mul4.3 = mul nsw i32 %9, %8
  %add.3 = add nsw i32 %mul4.3, %add.2
  %dlt.addr.013.4 = getelementptr inbounds i32, i32* %dlt, i32 5
  %bpl.addr.014.4 = getelementptr inbounds i32, i32* %bpl, i32 5
  %10 = load i32, i32* %bpl.addr.014.4, align 4, !tbaa !10
  %11 = load i32, i32* %dlt.addr.013.4, align 4, !tbaa !10
  %mul4.4 = mul nsw i32 %11, %10
  %add.4 = add nsw i32 %mul4.4, %add.3
  %shr = ashr i32 %add.4, 14
  ret i32 %shr
}

; Function Attrs: nounwind readnone
define i32 @filtep(i32 %rlt1, i32 %al1, i32 %rlt2, i32 %al2) #0 {
entry:
  %mul1 = mul i32 %al1, %rlt1
  %mul3 = mul i32 %al2, %rlt2
  %tmp = add i32 %mul3, %mul1
  %tmp6 = shl i32 %tmp, 1
  %shr = ashr i32 %tmp6, 15
  ret i32 %shr
}

; Function Attrs: nounwind readonly
define i32 @quantl(i32 %el, i32 %detl) #2 {
entry:
  %ispos = icmp sgt i32 %el, -1
  %neg = sub i32 0, %el
  %0 = select i1 %ispos, i32 %el, i32 %neg
  br label %for.body

for.body:                                         ; preds = %entry, %for.inc
  %mil.011 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %arrayidx = getelementptr inbounds [30 x i32], [30 x i32]* @decis_levl, i32 0, i32 %mil.011
  %1 = load i32, i32* %arrayidx, align 4, !tbaa !10
  %mul = mul nsw i32 %1, %detl
  %shr = ashr i32 %mul, 15
  %cmp1 = icmp sgt i32 %0, %shr
  br i1 %cmp1, label %for.inc, label %for.end

for.inc:                                          ; preds = %for.body
  %inc = add nuw nsw i32 %mil.011, 1
  %cmp = icmp slt i32 %inc, 30
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body, %for.inc
  %mil.0.lcssa = phi i32 [ %mil.011, %for.body ], [ %inc, %for.inc ]
  %quant26bt_pos.quant26bt_neg = select i1 %ispos, [31 x i32]* @quant26bt_pos, [31 x i32]* @quant26bt_neg
  %ril.0.in = getelementptr inbounds [31 x i32], [31 x i32]* %quant26bt_pos.quant26bt_neg, i32 0, i32 %mil.0.lcssa
  %ril.0 = load i32, i32* %ril.0.in, align 4
  ret i32 %ril.0
}

; Function Attrs: nounwind readonly
define i32 @logscl(i32 %il, i32 %nbl) #2 {
entry:
  %mul = mul nsw i32 %nbl, 127
  %shr = ashr i32 %mul, 7
  %shr1 = ashr i32 %il, 2
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @wl_code_table, i32 0, i32 %shr1
  %0 = load i32, i32* %arrayidx, align 4, !tbaa !10
  %add = add nsw i32 %0, %shr
  %cmp = icmp slt i32 %add, 0
  %.add = select i1 %cmp, i32 0, i32 %add
  %cmp2 = icmp sgt i32 %.add, 18432
  %..add = select i1 %cmp2, i32 18432, i32 %.add
  ret i32 %..add
}

; Function Attrs: nounwind readonly
define i32 @scalel(i32 %nbl, i32 %shift_constant) #2 {
entry:
  %shr4 = lshr i32 %nbl, 6
  %and = and i32 %shr4, 31
  %shr1 = ashr i32 %nbl, 11
  %arrayidx = getelementptr inbounds [32 x i32], [32 x i32]* @ilb_table, i32 0, i32 %and
  %0 = load i32, i32* %arrayidx, align 4, !tbaa !10
  %add = add nsw i32 %shift_constant, 1
  %sub = sub i32 %add, %shr1
  %shr2 = ashr i32 %0, %sub
  %shl = shl i32 %shr2, 3
  ret i32 %shl
}

; Function Attrs: nounwind
define void @upzero(i32 %dlt, i32* nocapture %dlti, i32* nocapture %bli) #1 {
entry:
  %cmp = icmp eq i32 %dlt, 0
  br i1 %cmp, label %for.cond.preheader, label %for.cond3.preheader

for.cond3.preheader:                              ; preds = %entry
  %0 = load i32, i32* %dlti, align 4, !tbaa !10
  %mul7 = mul nsw i32 %0, %dlt
  %1 = ashr i32 %mul7, 31
  %2 = and i32 %1, -256
  %3 = or i32 %2, 128
  %4 = load i32, i32* %bli, align 4, !tbaa !10
  %mul12 = mul nsw i32 %4, 255
  %shr13 = ashr i32 %mul12, 8
  %add = add nsw i32 %3, %shr13
  store i32 %add, i32* %bli, align 4, !tbaa !10
  %arrayidx6.1 = getelementptr inbounds i32, i32* %dlti, i32 1
  %5 = load i32, i32* %arrayidx6.1, align 4, !tbaa !10
  %mul7.1 = mul nsw i32 %5, %dlt
  %6 = ashr i32 %mul7.1, 31
  %7 = and i32 %6, -256
  %8 = or i32 %7, 128
  %arrayidx11.1 = getelementptr inbounds i32, i32* %bli, i32 1
  %9 = load i32, i32* %arrayidx11.1, align 4, !tbaa !10
  %mul12.1 = mul nsw i32 %9, 255
  %shr13.1 = ashr i32 %mul12.1, 8
  %add.1 = add nsw i32 %8, %shr13.1
  store i32 %add.1, i32* %arrayidx11.1, align 4, !tbaa !10
  %arrayidx6.2 = getelementptr inbounds i32, i32* %dlti, i32 2
  %10 = load i32, i32* %arrayidx6.2, align 4, !tbaa !10
  %mul7.2 = mul nsw i32 %10, %dlt
  %11 = ashr i32 %mul7.2, 31
  %12 = and i32 %11, -256
  %13 = or i32 %12, 128
  %arrayidx11.2 = getelementptr inbounds i32, i32* %bli, i32 2
  %14 = load i32, i32* %arrayidx11.2, align 4, !tbaa !10
  %mul12.2 = mul nsw i32 %14, 255
  %shr13.2 = ashr i32 %mul12.2, 8
  %add.2 = add nsw i32 %13, %shr13.2
  store i32 %add.2, i32* %arrayidx11.2, align 4, !tbaa !10
  %arrayidx6.3 = getelementptr inbounds i32, i32* %dlti, i32 3
  %15 = load i32, i32* %arrayidx6.3, align 4, !tbaa !10
  %mul7.3 = mul nsw i32 %15, %dlt
  %16 = ashr i32 %mul7.3, 31
  %17 = and i32 %16, -256
  %18 = or i32 %17, 128
  %arrayidx11.3 = getelementptr inbounds i32, i32* %bli, i32 3
  %19 = load i32, i32* %arrayidx11.3, align 4, !tbaa !10
  %mul12.3 = mul nsw i32 %19, 255
  %shr13.3 = ashr i32 %mul12.3, 8
  %add.3 = add nsw i32 %18, %shr13.3
  store i32 %add.3, i32* %arrayidx11.3, align 4, !tbaa !10
  %arrayidx6.4 = getelementptr inbounds i32, i32* %dlti, i32 4
  %20 = load i32, i32* %arrayidx6.4, align 4, !tbaa !10
  %mul7.4 = mul nsw i32 %20, %dlt
  %21 = ashr i32 %mul7.4, 31
  %22 = and i32 %21, -256
  %23 = or i32 %22, 128
  %arrayidx11.4 = getelementptr inbounds i32, i32* %bli, i32 4
  %24 = load i32, i32* %arrayidx11.4, align 4, !tbaa !10
  %mul12.4 = mul nsw i32 %24, 255
  %shr13.4 = ashr i32 %mul12.4, 8
  %add.4 = add nsw i32 %23, %shr13.4
  store i32 %add.4, i32* %arrayidx11.4, align 4, !tbaa !10
  %arrayidx6.5 = getelementptr inbounds i32, i32* %dlti, i32 5
  %25 = load i32, i32* %arrayidx6.5, align 4, !tbaa !10
  %mul7.5 = mul nsw i32 %25, %dlt
  %26 = ashr i32 %mul7.5, 31
  %27 = and i32 %26, -256
  %28 = or i32 %27, 128
  %arrayidx11.5 = getelementptr inbounds i32, i32* %bli, i32 5
  %29 = load i32, i32* %arrayidx11.5, align 4, !tbaa !10
  %mul12.5 = mul nsw i32 %29, 255
  %shr13.5 = ashr i32 %mul12.5, 8
  %add.5 = add nsw i32 %28, %shr13.5
  store i32 %add.5, i32* %arrayidx11.5, align 4, !tbaa !10
  br label %if.end18

for.cond.preheader:                               ; preds = %entry
  %30 = bitcast i32* %bli to <4 x i32>*
  %31 = load <4 x i32>, <4 x i32>* %30, align 4, !tbaa !10
  %32 = mul nsw <4 x i32> %31, <i32 255, i32 255, i32 255, i32 255>
  %33 = ashr <4 x i32> %32, <i32 8, i32 8, i32 8, i32 8>
  %34 = bitcast i32* %bli to <4 x i32>*
  store <4 x i32> %33, <4 x i32>* %34, align 4, !tbaa !10
  %arrayidx.4 = getelementptr inbounds i32, i32* %bli, i32 4
  %35 = load i32, i32* %arrayidx.4, align 4, !tbaa !10
  %mul.4 = mul nsw i32 %35, 255
  %shr.4 = ashr i32 %mul.4, 8
  store i32 %shr.4, i32* %arrayidx.4, align 4, !tbaa !10
  %arrayidx.5 = getelementptr inbounds i32, i32* %bli, i32 5
  %36 = load i32, i32* %arrayidx.5, align 4, !tbaa !10
  %mul.5 = mul nsw i32 %36, 255
  %shr.5 = ashr i32 %mul.5, 8
  store i32 %shr.5, i32* %arrayidx.5, align 4, !tbaa !10
  %.pre = getelementptr inbounds i32, i32* %dlti, i32 4
  %.pre53 = getelementptr inbounds i32, i32* %dlti, i32 5
  %.pre54 = getelementptr inbounds i32, i32* %dlti, i32 3
  %.pre55 = getelementptr inbounds i32, i32* %dlti, i32 2
  %.pre56 = getelementptr inbounds i32, i32* %dlti, i32 1
  br label %if.end18

if.end18:                                         ; preds = %for.cond3.preheader, %for.cond.preheader
  %arrayidx26.pre-phi = phi i32* [ %arrayidx6.1, %for.cond3.preheader ], [ %.pre56, %for.cond.preheader ]
  %arrayidx23.pre-phi = phi i32* [ %arrayidx6.2, %for.cond3.preheader ], [ %.pre55, %for.cond.preheader ]
  %arrayidx21.pre-phi = phi i32* [ %arrayidx6.3, %for.cond3.preheader ], [ %.pre54, %for.cond.preheader ]
  %arrayidx20.pre-phi = phi i32* [ %arrayidx6.5, %for.cond3.preheader ], [ %.pre53, %for.cond.preheader ]
  %arrayidx19.pre-phi = phi i32* [ %arrayidx6.4, %for.cond3.preheader ], [ %.pre, %for.cond.preheader ]
  %37 = load i32, i32* %arrayidx19.pre-phi, align 4, !tbaa !10
  store i32 %37, i32* %arrayidx20.pre-phi, align 4, !tbaa !10
  %38 = load i32, i32* %arrayidx21.pre-phi, align 4, !tbaa !10
  store i32 %38, i32* %arrayidx19.pre-phi, align 4, !tbaa !10
  %39 = load i32, i32* %arrayidx23.pre-phi, align 4, !tbaa !10
  store i32 %39, i32* %arrayidx21.pre-phi, align 4, !tbaa !10
  %40 = load i32, i32* %dlti, align 4, !tbaa !10
  store i32 %40, i32* %arrayidx26.pre-phi, align 4, !tbaa !10
  store i32 %dlt, i32* %dlti, align 4, !tbaa !10
  ret void
}

; Function Attrs: nounwind readnone
define i32 @uppol2(i32 %al1, i32 %al2, i32 %plt, i32 %plt1, i32 %plt2) #0 {
entry:
  %mul = shl nsw i32 %al1, 2
  %mul1 = mul nsw i32 %plt1, %plt
  %cmp = icmp sgt i32 %mul1, -1
  %sub = sub nsw i32 0, %mul
  %sub.mul = select i1 %cmp, i32 %sub, i32 %mul
  %shr = ashr i32 %sub.mul, 7
  %mul2 = mul nsw i32 %plt2, %plt
  %0 = ashr i32 %mul2, 31
  %1 = and i32 %0, -256
  %2 = or i32 %1, 128
  %mul7 = mul nsw i32 %al2, 127
  %shr8 = ashr i32 %mul7, 7
  %wd4.0 = add nsw i32 %shr, %shr8
  %add9 = add nsw i32 %wd4.0, %2
  %cmp10 = icmp sgt i32 %add9, 12288
  %.add9 = select i1 %cmp10, i32 12288, i32 %add9
  %cmp13 = icmp slt i32 %.add9, -12288
  %..add9 = select i1 %cmp13, i32 -12288, i32 %.add9
  ret i32 %..add9
}

; Function Attrs: nounwind readnone
define i32 @uppol1(i32 %al1, i32 %apl2, i32 %plt, i32 %plt1) #0 {
entry:
  %mul = mul nsw i32 %al1, 255
  %shr = ashr i32 %mul, 8
  %mul1 = mul nsw i32 %plt1, %plt
  %0 = ashr i32 %mul1, 31
  %1 = and i32 %0, -384
  %2 = add nsw i32 %shr, 192
  %apl1.0 = add nsw i32 %2, %1
  %sub2 = sub nsw i32 15360, %apl2
  %cmp3 = icmp sgt i32 %apl1.0, %sub2
  %sub2.apl1.0 = select i1 %cmp3, i32 %sub2, i32 %apl1.0
  %sub6 = sub nsw i32 0, %sub2
  %cmp7 = icmp slt i32 %sub2.apl1.0, %sub6
  %apl1.2 = select i1 %cmp7, i32 %sub6, i32 %sub2.apl1.0
  ret i32 %apl1.2
}

; Function Attrs: nounwind readonly
define i32 @logsch(i32 %ih, i32 %nbh) #2 {
entry:
  %mul = mul nsw i32 %nbh, 127
  %shr = ashr i32 %mul, 7
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* @wh_code_table, i32 0, i32 %ih
  %0 = load i32, i32* %arrayidx, align 4, !tbaa !10
  %add = add nsw i32 %0, %shr
  %cmp = icmp slt i32 %add, 0
  %.add = select i1 %cmp, i32 0, i32 %add
  %cmp1 = icmp sgt i32 %.add, 22528
  %..add = select i1 %cmp1, i32 22528, i32 %.add
  ret i32 %..add
}

; Function Attrs: nounwind
define void @decode(i32 %input, i32* nocapture %xout) #1 {
entry:
  %and = and i32 %input, 63
  store i32 %and, i32* @ilr, align 4, !tbaa !10
  %shr = ashr i32 %input, 6
  store i32 %shr, i32* @ih, align 4, !tbaa !10
  %0 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bpl, i32 0, i32 0), align 4, !tbaa !10
  %1 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dltx, i32 0, i32 0), align 4, !tbaa !10
  %mul.i = mul nsw i32 %1, %0
  %2 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bpl, i32 0, i32 1), align 4, !tbaa !10
  %3 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dltx, i32 0, i32 1), align 4, !tbaa !10
  %mul4.i = mul nsw i32 %3, %2
  %add.i = add nsw i32 %mul4.i, %mul.i
  %4 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bpl, i32 0, i32 2), align 4, !tbaa !10
  %5 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dltx, i32 0, i32 2), align 4, !tbaa !10
  %mul4.1.i = mul nsw i32 %5, %4
  %add.1.i = add nsw i32 %add.i, %mul4.1.i
  %6 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bpl, i32 0, i32 3), align 4, !tbaa !10
  %7 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dltx, i32 0, i32 3), align 4, !tbaa !10
  %mul4.2.i = mul nsw i32 %7, %6
  %add.2.i = add nsw i32 %add.1.i, %mul4.2.i
  %8 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bpl, i32 0, i32 4), align 4, !tbaa !10
  %9 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dltx, i32 0, i32 4), align 4, !tbaa !10
  %mul4.3.i = mul nsw i32 %9, %8
  %add.3.i = add nsw i32 %add.2.i, %mul4.3.i
  %10 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bpl, i32 0, i32 5), align 4, !tbaa !10
  %11 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dltx, i32 0, i32 5), align 4, !tbaa !10
  %mul4.4.i = mul nsw i32 %11, %10
  %add.4.i = add nsw i32 %add.3.i, %mul4.4.i
  %shr.i = ashr i32 %add.4.i, 14
  store i32 %shr.i, i32* @dec_szl, align 4, !tbaa !10
  %12 = load i32, i32* @dec_rlt1, align 4, !tbaa !10
  %13 = load i32, i32* @dec_al1, align 4, !tbaa !10
  %14 = load i32, i32* @dec_rlt2, align 4, !tbaa !10
  %15 = load i32, i32* @dec_al2, align 4, !tbaa !10
  %mul1.i85 = mul i32 %13, %12
  %mul3.i = mul i32 %15, %14
  %tmp.i = add i32 %mul3.i, %mul1.i85
  %tmp6.i = shl i32 %tmp.i, 1
  %shr.i86 = ashr i32 %tmp6.i, 15
  store i32 %shr.i86, i32* @dec_spl, align 4, !tbaa !10
  %add = add nsw i32 %shr.i86, %shr.i
  store i32 %add, i32* @dec_sl, align 4, !tbaa !10
  %16 = load i32, i32* @dec_detl, align 4, !tbaa !10
  %shr2164 = lshr i32 %and, 2
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @qq4_code4_table, i32 0, i32 %shr2164
  %17 = load i32, i32* %arrayidx, align 4, !tbaa !10
  %mul = mul nsw i32 %17, %16
  %shr3 = ashr i32 %mul, 15
  store i32 %shr3, i32* @dec_dlt, align 4, !tbaa !10
  %18 = load i32, i32* @il, align 4, !tbaa !10
  %arrayidx4 = getelementptr inbounds [64 x i32], [64 x i32]* @qq6_code6_table, i32 0, i32 %18
  %19 = load i32, i32* %arrayidx4, align 4, !tbaa !10
  %mul5 = mul nsw i32 %19, %16
  %shr6 = ashr i32 %mul5, 15
  store i32 %shr6, i32* @dl, align 4, !tbaa !10
  %add7 = add nsw i32 %shr6, %add
  store i32 %add7, i32* @rl, align 4, !tbaa !10
  %20 = load i32, i32* @dec_nbl, align 4, !tbaa !10
  %mul.i135 = mul nsw i32 %20, 127
  %shr.i136 = ashr i32 %mul.i135, 7
  %arrayidx.i138 = getelementptr inbounds [16 x i32], [16 x i32]* @wl_code_table, i32 0, i32 %shr2164
  %21 = load i32, i32* %arrayidx.i138, align 4, !tbaa !10
  %add.i139 = add nsw i32 %shr.i136, %21
  %cmp.i140 = icmp slt i32 %add.i139, 0
  %.add.i141 = select i1 %cmp.i140, i32 0, i32 %add.i139
  %cmp2.i = icmp sgt i32 %.add.i141, 18432
  %..add.i142 = select i1 %cmp2.i, i32 18432, i32 %.add.i141
  store i32 %..add.i142, i32* @dec_nbl, align 4, !tbaa !10
  %shr4.i143 = lshr i32 %..add.i142, 6
  %and.i144 = and i32 %shr4.i143, 31
  %shr1.i145 = ashr i32 %..add.i142, 11
  %arrayidx.i146 = getelementptr inbounds [32 x i32], [32 x i32]* @ilb_table, i32 0, i32 %and.i144
  %22 = load i32, i32* %arrayidx.i146, align 4, !tbaa !10
  %sub.i147 = sub nsw i32 9, %shr1.i145
  %shr2.i148 = ashr i32 %22, %sub.i147
  %shl.i149 = shl i32 %shr2.i148, 3
  store i32 %shl.i149, i32* @dec_detl, align 4, !tbaa !10
  %add10 = add nsw i32 %shr.i, %shr3
  store i32 %add10, i32* @dec_plt, align 4, !tbaa !10
  tail call void @upzero(i32 %shr3, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dltx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bpl, i32 0, i32 0))
  %23 = load i32, i32* @dec_al1, align 4, !tbaa !10
  %24 = load i32, i32* @dec_al2, align 4, !tbaa !10
  %25 = load i32, i32* @dec_plt, align 4, !tbaa !10
  %26 = load i32, i32* @dec_plt1, align 4, !tbaa !10
  %27 = load i32, i32* @dec_plt2, align 4, !tbaa !10
  %mul.i120 = shl nsw i32 %23, 2
  %mul1.i121 = mul nsw i32 %26, %25
  %cmp.i122 = icmp sgt i32 %mul1.i121, -1
  %sub.i123 = sub nsw i32 0, %mul.i120
  %sub.mul.i124 = select i1 %cmp.i122, i32 %sub.i123, i32 %mul.i120
  %shr.i125 = ashr i32 %sub.mul.i124, 7
  %mul2.i126 = mul nsw i32 %27, %25
  %28 = ashr i32 %mul2.i126, 31
  %29 = and i32 %28, -256
  %30 = or i32 %29, 128
  %mul7.i127 = mul nsw i32 %24, 127
  %shr8.i128 = ashr i32 %mul7.i127, 7
  %wd4.0.i129 = add nsw i32 %shr.i125, %shr8.i128
  %add9.i130 = add nsw i32 %wd4.0.i129, %30
  %cmp10.i131 = icmp sgt i32 %add9.i130, 12288
  %.add9.i132 = select i1 %cmp10.i131, i32 12288, i32 %add9.i130
  %cmp13.i133 = icmp slt i32 %.add9.i132, -12288
  %..add9.i134 = select i1 %cmp13.i133, i32 -12288, i32 %.add9.i132
  store i32 %..add9.i134, i32* @dec_al2, align 4, !tbaa !10
  %mul.i110 = mul nsw i32 %23, 255
  %shr.i111 = ashr i32 %mul.i110, 8
  %31 = ashr i32 %mul1.i121, 31
  %32 = and i32 %31, -384
  %33 = add nsw i32 %shr.i111, 192
  %apl1.0.i113 = add nsw i32 %33, %32
  %sub2.i114 = sub nsw i32 15360, %..add9.i134
  %cmp3.i115 = icmp sgt i32 %apl1.0.i113, %sub2.i114
  %sub2.apl1.0.i116 = select i1 %cmp3.i115, i32 %sub2.i114, i32 %apl1.0.i113
  %sub6.i117 = sub nsw i32 0, %sub2.i114
  %cmp7.i118 = icmp slt i32 %sub2.apl1.0.i116, %sub6.i117
  %apl1.2.i119 = select i1 %cmp7.i118, i32 %sub6.i117, i32 %sub2.apl1.0.i116
  store i32 %apl1.2.i119, i32* @dec_al1, align 4, !tbaa !10
  %34 = load i32, i32* @dec_sl, align 4, !tbaa !10
  %35 = load i32, i32* @dec_dlt, align 4, !tbaa !10
  %add13 = add nsw i32 %35, %34
  store i32 %add13, i32* @dec_rlt, align 4, !tbaa !10
  %36 = load i32, i32* @dec_rlt1, align 4, !tbaa !10
  store i32 %36, i32* @dec_rlt2, align 4, !tbaa !10
  store i32 %add13, i32* @dec_rlt1, align 4, !tbaa !10
  store i32 %26, i32* @dec_plt2, align 4, !tbaa !10
  store i32 %25, i32* @dec_plt1, align 4, !tbaa !10
  %37 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bph, i32 0, i32 0), align 4, !tbaa !10
  %38 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dhx, i32 0, i32 0), align 4, !tbaa !10
  %mul.i98 = mul nsw i32 %38, %37
  %39 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bph, i32 0, i32 1), align 4, !tbaa !10
  %40 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dhx, i32 0, i32 1), align 4, !tbaa !10
  %mul4.i99 = mul nsw i32 %40, %39
  %add.i100 = add nsw i32 %mul4.i99, %mul.i98
  %41 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bph, i32 0, i32 2), align 4, !tbaa !10
  %42 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dhx, i32 0, i32 2), align 4, !tbaa !10
  %mul4.1.i101 = mul nsw i32 %42, %41
  %add.1.i102 = add nsw i32 %add.i100, %mul4.1.i101
  %43 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bph, i32 0, i32 3), align 4, !tbaa !10
  %44 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dhx, i32 0, i32 3), align 4, !tbaa !10
  %mul4.2.i103 = mul nsw i32 %44, %43
  %add.2.i104 = add nsw i32 %add.1.i102, %mul4.2.i103
  %45 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bph, i32 0, i32 4), align 4, !tbaa !10
  %46 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dhx, i32 0, i32 4), align 4, !tbaa !10
  %mul4.3.i105 = mul nsw i32 %46, %45
  %add.3.i106 = add nsw i32 %add.2.i104, %mul4.3.i105
  %47 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bph, i32 0, i32 5), align 4, !tbaa !10
  %48 = load i32, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dhx, i32 0, i32 5), align 4, !tbaa !10
  %mul4.4.i107 = mul nsw i32 %48, %47
  %add.4.i108 = add nsw i32 %add.3.i106, %mul4.4.i107
  %shr.i109 = ashr i32 %add.4.i108, 14
  store i32 %shr.i109, i32* @dec_szh, align 4, !tbaa !10
  %49 = load i32, i32* @dec_rh1, align 4, !tbaa !10
  %50 = load i32, i32* @dec_ah1, align 4, !tbaa !10
  %51 = load i32, i32* @dec_rh2, align 4, !tbaa !10
  %52 = load i32, i32* @dec_ah2, align 4, !tbaa !10
  %mul1.i93 = mul i32 %50, %49
  %mul3.i94 = mul i32 %52, %51
  %tmp.i95 = add i32 %mul3.i94, %mul1.i93
  %tmp6.i96 = shl i32 %tmp.i95, 1
  %shr.i97 = ashr i32 %tmp6.i96, 15
  store i32 %shr.i97, i32* @dec_sph, align 4, !tbaa !10
  %add16 = add nsw i32 %shr.i97, %shr.i109
  store i32 %add16, i32* @dec_sh, align 4, !tbaa !10
  %53 = load i32, i32* @dec_deth, align 4, !tbaa !10
  %54 = load i32, i32* @ih, align 4, !tbaa !10
  %arrayidx17 = getelementptr inbounds [4 x i32], [4 x i32]* @qq2_code2_table, i32 0, i32 %54
  %55 = load i32, i32* %arrayidx17, align 4, !tbaa !10
  %mul18 = mul nsw i32 %55, %53
  %shr19 = ashr i32 %mul18, 15
  store i32 %shr19, i32* @dec_dh, align 4, !tbaa !10
  %56 = load i32, i32* @dec_nbh, align 4, !tbaa !10
  %mul.i88 = mul nsw i32 %56, 127
  %shr.i89 = ashr i32 %mul.i88, 7
  %arrayidx.i90 = getelementptr inbounds [4 x i32], [4 x i32]* @wh_code_table, i32 0, i32 %54
  %57 = load i32, i32* %arrayidx.i90, align 4, !tbaa !10
  %add.i91 = add nsw i32 %shr.i89, %57
  %cmp.i92 = icmp slt i32 %add.i91, 0
  %.add.i = select i1 %cmp.i92, i32 0, i32 %add.i91
  %cmp1.i = icmp sgt i32 %.add.i, 22528
  %..add.i = select i1 %cmp1.i, i32 22528, i32 %.add.i
  store i32 %..add.i, i32* @dec_nbh, align 4, !tbaa !10
  %shr4.i = lshr i32 %..add.i, 6
  %and.i = and i32 %shr4.i, 31
  %shr1.i = ashr i32 %..add.i, 11
  %arrayidx.i = getelementptr inbounds [32 x i32], [32 x i32]* @ilb_table, i32 0, i32 %and.i
  %58 = load i32, i32* %arrayidx.i, align 4, !tbaa !10
  %sub.i87 = sub nsw i32 11, %shr1.i
  %shr2.i = ashr i32 %58, %sub.i87
  %shl.i = shl i32 %shr2.i, 3
  store i32 %shl.i, i32* @dec_deth, align 4, !tbaa !10
  %add22 = add nsw i32 %shr.i109, %shr19
  store i32 %add22, i32* @dec_ph, align 4, !tbaa !10
  tail call void @upzero(i32 %shr19, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dhx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bph, i32 0, i32 0))
  %59 = load i32, i32* @dec_ah1, align 4, !tbaa !10
  %60 = load i32, i32* @dec_ah2, align 4, !tbaa !10
  %61 = load i32, i32* @dec_ph, align 4, !tbaa !10
  %62 = load i32, i32* @dec_ph1, align 4, !tbaa !10
  %63 = load i32, i32* @dec_ph2, align 4, !tbaa !10
  %mul.i82 = shl nsw i32 %59, 2
  %mul1.i83 = mul nsw i32 %62, %61
  %cmp.i = icmp sgt i32 %mul1.i83, -1
  %sub.i = sub nsw i32 0, %mul.i82
  %sub.mul.i = select i1 %cmp.i, i32 %sub.i, i32 %mul.i82
  %shr.i84 = ashr i32 %sub.mul.i, 7
  %mul2.i = mul nsw i32 %63, %61
  %64 = ashr i32 %mul2.i, 31
  %65 = and i32 %64, -256
  %66 = or i32 %65, 128
  %mul7.i = mul nsw i32 %60, 127
  %shr8.i = ashr i32 %mul7.i, 7
  %wd4.0.i = add nsw i32 %shr.i84, %shr8.i
  %add9.i = add nsw i32 %wd4.0.i, %66
  %cmp10.i = icmp sgt i32 %add9.i, 12288
  %.add9.i = select i1 %cmp10.i, i32 12288, i32 %add9.i
  %cmp13.i = icmp slt i32 %.add9.i, -12288
  %..add9.i = select i1 %cmp13.i, i32 -12288, i32 %.add9.i
  store i32 %..add9.i, i32* @dec_ah2, align 4, !tbaa !10
  %mul.i80 = mul nsw i32 %59, 255
  %shr.i81 = ashr i32 %mul.i80, 8
  %67 = ashr i32 %mul1.i83, 31
  %68 = and i32 %67, -384
  %69 = add nsw i32 %shr.i81, 192
  %apl1.0.i = add nsw i32 %69, %68
  %sub2.i = sub nsw i32 15360, %..add9.i
  %cmp3.i = icmp sgt i32 %apl1.0.i, %sub2.i
  %sub2.apl1.0.i = select i1 %cmp3.i, i32 %sub2.i, i32 %apl1.0.i
  %sub6.i = sub nsw i32 0, %sub2.i
  %cmp7.i = icmp slt i32 %sub2.apl1.0.i, %sub6.i
  %apl1.2.i = select i1 %cmp7.i, i32 %sub6.i, i32 %sub2.apl1.0.i
  store i32 %apl1.2.i, i32* @dec_ah1, align 4, !tbaa !10
  %70 = load i32, i32* @dec_sh, align 4, !tbaa !10
  %71 = load i32, i32* @dec_dh, align 4, !tbaa !10
  %add25 = add nsw i32 %71, %70
  store i32 %add25, i32* @rh, align 4, !tbaa !10
  %72 = load i32, i32* @dec_rh1, align 4, !tbaa !10
  store i32 %72, i32* @dec_rh2, align 4, !tbaa !10
  store i32 %add25, i32* @dec_rh1, align 4, !tbaa !10
  store i32 %62, i32* @dec_ph2, align 4, !tbaa !10
  store i32 %61, i32* @dec_ph1, align 4, !tbaa !10
  %73 = load i32, i32* @rl, align 4, !tbaa !10
  %sub = sub nsw i32 %73, %add25
  store i32 %sub, i32* @xd, align 4, !tbaa !10
  %add26 = add nsw i32 %add25, %73
  store i32 %add26, i32* @xs, align 4, !tbaa !10
  %74 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 0), align 4, !tbaa !10
  %mul27 = mul nsw i32 %sub, %74
  %75 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 1), align 4, !tbaa !10
  %mul29 = mul nsw i32 %75, %add26
  %76 = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i32 0, i32 0), align 4, !tbaa !10
  %77 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 2), align 4, !tbaa !10
  %mul32 = mul nsw i32 %77, %76
  %add33 = add nsw i32 %mul32, %mul27
  %78 = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i32 0, i32 0), align 4, !tbaa !10
  %79 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 3), align 4, !tbaa !10
  %mul36 = mul nsw i32 %79, %78
  %add37 = add nsw i32 %mul36, %mul29
  %80 = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i32 0, i32 1), align 4, !tbaa !10
  %81 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 4), align 4, !tbaa !10
  %mul32.1 = mul nsw i32 %81, %80
  %add33.1 = add nsw i32 %mul32.1, %add33
  %82 = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i32 0, i32 1), align 4, !tbaa !10
  %83 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 5), align 4, !tbaa !10
  %mul36.1 = mul nsw i32 %83, %82
  %add37.1 = add nsw i32 %mul36.1, %add37
  %84 = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i32 0, i32 2), align 4, !tbaa !10
  %85 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 6), align 4, !tbaa !10
  %mul32.2 = mul nsw i32 %85, %84
  %add33.2 = add nsw i32 %mul32.2, %add33.1
  %86 = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i32 0, i32 2), align 4, !tbaa !10
  %87 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 7), align 4, !tbaa !10
  %mul36.2 = mul nsw i32 %87, %86
  %add37.2 = add nsw i32 %mul36.2, %add37.1
  %88 = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i32 0, i32 3), align 4, !tbaa !10
  %89 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 8), align 4, !tbaa !10
  %mul32.3 = mul nsw i32 %89, %88
  %add33.3 = add nsw i32 %mul32.3, %add33.2
  %90 = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i32 0, i32 3), align 4, !tbaa !10
  %91 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 9), align 4, !tbaa !10
  %mul36.3 = mul nsw i32 %91, %90
  %add37.3 = add nsw i32 %mul36.3, %add37.2
  %92 = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i32 0, i32 4), align 4, !tbaa !10
  %93 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 10), align 4, !tbaa !10
  %mul32.4 = mul nsw i32 %93, %92
  %add33.4 = add nsw i32 %mul32.4, %add33.3
  %94 = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i32 0, i32 4), align 4, !tbaa !10
  %95 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 11), align 4, !tbaa !10
  %mul36.4 = mul nsw i32 %95, %94
  %add37.4 = add nsw i32 %mul36.4, %add37.3
  %96 = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i32 0, i32 5), align 4, !tbaa !10
  %97 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 12), align 4, !tbaa !10
  %mul32.5 = mul nsw i32 %97, %96
  %add33.5 = add nsw i32 %mul32.5, %add33.4
  %98 = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i32 0, i32 5), align 4, !tbaa !10
  %99 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 13), align 4, !tbaa !10
  %mul36.5 = mul nsw i32 %99, %98
  %add37.5 = add nsw i32 %mul36.5, %add37.4
  %100 = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i32 0, i32 6), align 4, !tbaa !10
  %101 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 14), align 4, !tbaa !10
  %mul32.6 = mul nsw i32 %101, %100
  %add33.6 = add nsw i32 %mul32.6, %add33.5
  %102 = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i32 0, i32 6), align 4, !tbaa !10
  %103 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 15), align 4, !tbaa !10
  %mul36.6 = mul nsw i32 %103, %102
  %add37.6 = add nsw i32 %mul36.6, %add37.5
  %104 = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i32 0, i32 7), align 4, !tbaa !10
  %105 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 16), align 4, !tbaa !10
  %mul32.7 = mul nsw i32 %105, %104
  %add33.7 = add nsw i32 %mul32.7, %add33.6
  %106 = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i32 0, i32 7), align 4, !tbaa !10
  %107 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 17), align 4, !tbaa !10
  %mul36.7 = mul nsw i32 %107, %106
  %add37.7 = add nsw i32 %mul36.7, %add37.6
  %108 = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i32 0, i32 8), align 4, !tbaa !10
  %109 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 18), align 4, !tbaa !10
  %mul32.8 = mul nsw i32 %109, %108
  %add33.8 = add nsw i32 %mul32.8, %add33.7
  %110 = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i32 0, i32 8), align 4, !tbaa !10
  %111 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 19), align 4, !tbaa !10
  %mul36.8 = mul nsw i32 %111, %110
  %add37.8 = add nsw i32 %mul36.8, %add37.7
  %112 = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i32 0, i32 9), align 4, !tbaa !10
  %113 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 20), align 4, !tbaa !10
  %mul32.9 = mul nsw i32 %113, %112
  %add33.9 = add nsw i32 %mul32.9, %add33.8
  %114 = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i32 0, i32 9), align 4, !tbaa !10
  %115 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 21), align 4, !tbaa !10
  %mul36.9 = mul nsw i32 %115, %114
  %add37.9 = add nsw i32 %mul36.9, %add37.8
  %116 = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i32 0, i32 10), align 4, !tbaa !10
  %117 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 22), align 4, !tbaa !10
  %mul39 = mul nsw i32 %117, %116
  %add40 = add nsw i32 %mul39, %add33.9
  %118 = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i32 0, i32 10), align 4, !tbaa !10
  %119 = load i32, i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 23), align 4, !tbaa !10
  %mul42 = mul nsw i32 %119, %118
  %add43 = add nsw i32 %mul42, %add37.9
  %shr44 = ashr i32 %add40, 14
  %arrayidx45 = getelementptr inbounds i32, i32* %xout, i32 1
  store i32 %shr44, i32* %arrayidx45, align 4, !tbaa !10
  %shr46 = ashr i32 %add43, 14
  %arrayidx47 = getelementptr inbounds i32, i32* %xout, i32 2
  store i32 %shr46, i32* %arrayidx47, align 4, !tbaa !10
  %120 = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i32 0, i32 9), align 4, !tbaa !10
  store i32 %120, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i32 0, i32 10), align 4, !tbaa !10
  %121 = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i32 0, i32 9), align 4, !tbaa !10
  store i32 %121, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i32 0, i32 10), align 4, !tbaa !10
  %122 = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i32 0, i32 8), align 4, !tbaa !10
  store i32 %122, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i32 0, i32 9), align 4, !tbaa !10
  %123 = load i32, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i32 0, i32 8), align 4, !tbaa !10
  store i32 %123, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i32 0, i32 9), align 4, !tbaa !10
  %124 = load <4 x i32>, <4 x i32>* bitcast (i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i32 0, i32 4) to <4 x i32>*), align 4, !tbaa !10
  store <4 x i32> %124, <4 x i32>* bitcast (i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i32 0, i32 5) to <4 x i32>*), align 4, !tbaa !10
  %125 = load <4 x i32>, <4 x i32>* bitcast (i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i32 0, i32 4) to <4 x i32>*), align 4, !tbaa !10
  store <4 x i32> %125, <4 x i32>* bitcast (i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i32 0, i32 5) to <4 x i32>*), align 4, !tbaa !10
  %126 = load <4 x i32>, <4 x i32>* bitcast ([11 x i32]* @accumc to <4 x i32>*), align 4, !tbaa !10
  store <4 x i32> %126, <4 x i32>* bitcast (i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i32 0, i32 1) to <4 x i32>*), align 4, !tbaa !10
  %127 = load <4 x i32>, <4 x i32>* bitcast ([11 x i32]* @accumd to <4 x i32>*), align 4, !tbaa !10
  store <4 x i32> %127, <4 x i32>* bitcast (i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i32 0, i32 1) to <4 x i32>*), align 4, !tbaa !10
  %128 = load i32, i32* @xd, align 4, !tbaa !10
  store i32 %128, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i32 0, i32 0), align 4, !tbaa !10
  %129 = load i32, i32* @xs, align 4, !tbaa !10
  store i32 %129, i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i32 0, i32 0), align 4, !tbaa !10
  ret void
}

; Function Attrs: nounwind
define void @reset() #1 {
entry:
  store i32 32, i32* @dec_detl, align 4, !tbaa !10
  store i32 32, i32* @detl, align 4, !tbaa !10
  store i32 8, i32* @dec_deth, align 4, !tbaa !10
  store i32 8, i32* @deth, align 4, !tbaa !10
  store i32 0, i32* @rlt2, align 4, !tbaa !10
  store i32 0, i32* @rlt1, align 4, !tbaa !10
  store i32 0, i32* @plt2, align 4, !tbaa !10
  store i32 0, i32* @plt1, align 4, !tbaa !10
  store i32 0, i32* @al2, align 4, !tbaa !10
  store i32 0, i32* @al1, align 4, !tbaa !10
  store i32 0, i32* @nbl, align 4, !tbaa !10
  store i32 0, i32* @rh2, align 4, !tbaa !10
  store i32 0, i32* @rh1, align 4, !tbaa !10
  store i32 0, i32* @ph2, align 4, !tbaa !10
  store i32 0, i32* @ph1, align 4, !tbaa !10
  store i32 0, i32* @ah2, align 4, !tbaa !10
  store i32 0, i32* @ah1, align 4, !tbaa !10
  store i32 0, i32* @nbh, align 4, !tbaa !10
  store i32 0, i32* @dec_rlt2, align 4, !tbaa !10
  store i32 0, i32* @dec_rlt1, align 4, !tbaa !10
  store i32 0, i32* @dec_plt2, align 4, !tbaa !10
  store i32 0, i32* @dec_plt1, align 4, !tbaa !10
  store i32 0, i32* @dec_al2, align 4, !tbaa !10
  store i32 0, i32* @dec_al1, align 4, !tbaa !10
  store i32 0, i32* @dec_nbl, align 4, !tbaa !10
  store i32 0, i32* @dec_rh2, align 4, !tbaa !10
  store i32 0, i32* @dec_rh1, align 4, !tbaa !10
  store i32 0, i32* @dec_ph2, align 4, !tbaa !10
  store i32 0, i32* @dec_ph1, align 4, !tbaa !10
  store i32 0, i32* @dec_ah2, align 4, !tbaa !10
  store i32 0, i32* @dec_ah1, align 4, !tbaa !10
  store i32 0, i32* @dec_nbh, align 4, !tbaa !10
  call void @llvm.memset.p0i8.i32(i8* bitcast ([6 x i32]* @delay_dltx to i8*), i8 0, i32 24, i32 4, i1 false)
  call void @llvm.memset.p0i8.i32(i8* bitcast ([6 x i32]* @delay_dhx to i8*), i8 0, i32 24, i32 4, i1 false)
  call void @llvm.memset.p0i8.i32(i8* bitcast ([6 x i32]* @dec_del_dltx to i8*), i8 0, i32 24, i32 4, i1 false)
  call void @llvm.memset.p0i8.i32(i8* bitcast ([6 x i32]* @dec_del_dhx to i8*), i8 0, i32 24, i32 4, i1 false)
  call void @llvm.memset.p0i8.i32(i8* bitcast ([6 x i32]* @delay_bpl to i8*), i8 0, i32 24, i32 4, i1 false)
  call void @llvm.memset.p0i8.i32(i8* bitcast ([6 x i32]* @delay_bph to i8*), i8 0, i32 24, i32 4, i1 false)
  call void @llvm.memset.p0i8.i32(i8* bitcast ([6 x i32]* @dec_del_bpl to i8*), i8 0, i32 24, i32 4, i1 false)
  call void @llvm.memset.p0i8.i32(i8* bitcast ([6 x i32]* @dec_del_bph to i8*), i8 0, i32 24, i32 4, i1 false)
  call void @llvm.memset.p0i8.i32(i8* bitcast ([24 x i32]* @tqmf to i8*), i8 0, i32 92, i32 4, i1 false)
  call void @llvm.memset.p0i8.i32(i8* bitcast ([11 x i32]* @accumc to i8*), i8 0, i32 44, i32 4, i1 false)
  call void @llvm.memset.p0i8.i32(i8* bitcast ([11 x i32]* @accumd to i8*), i8 0, i32 44, i32 4, i1 false)
  ret void
}

; Function Attrs: nounwind readonly
define i32 @invqxl(i32 %il, i32 %detl, i32* nocapture readonly %code_table, i32 %mode) #2 {
entry:
  %sub = add nsw i32 %mode, -1
  %shr = ashr i32 %il, %sub
  %arrayidx = getelementptr inbounds i32, i32* %code_table, i32 %shr
  %0 = load i32, i32* %arrayidx, align 4, !tbaa !10
  %mul = mul nsw i32 %0, %detl
  %shr1 = ashr i32 %mul, 15
  ret i32 %shr1
}

; Function Attrs: nounwind readonly
define i32 @invqah(i32 %ih, i32 %deth) #2 {
entry:
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* @qq2_code2_table, i32 0, i32 %ih
  %0 = load i32, i32* %arrayidx, align 4, !tbaa !10
  %mul = mul nsw i32 %0, %deth
  %shr = ashr i32 %mul, 15
  ret i32 %shr
}

; Function Attrs: nounwind
define i32 @main() #1 {
entry:
  %xout = alloca [3 x i32], align 4
  store i32 32, i32* @dec_detl, align 4, !tbaa !10
  store i32 32, i32* @detl, align 4, !tbaa !10
  store i32 8, i32* @dec_deth, align 4, !tbaa !10
  store i32 8, i32* @deth, align 4, !tbaa !10
  store i32 0, i32* @rlt2, align 4, !tbaa !10
  store i32 0, i32* @rlt1, align 4, !tbaa !10
  store i32 0, i32* @plt2, align 4, !tbaa !10
  store i32 0, i32* @plt1, align 4, !tbaa !10
  store i32 0, i32* @al2, align 4, !tbaa !10
  store i32 0, i32* @al1, align 4, !tbaa !10
  store i32 0, i32* @nbl, align 4, !tbaa !10
  store i32 0, i32* @rh2, align 4, !tbaa !10
  store i32 0, i32* @rh1, align 4, !tbaa !10
  store i32 0, i32* @ph2, align 4, !tbaa !10
  store i32 0, i32* @ph1, align 4, !tbaa !10
  store i32 0, i32* @ah2, align 4, !tbaa !10
  store i32 0, i32* @ah1, align 4, !tbaa !10
  store i32 0, i32* @nbh, align 4, !tbaa !10
  store i32 0, i32* @dec_rlt2, align 4, !tbaa !10
  store i32 0, i32* @dec_rlt1, align 4, !tbaa !10
  store i32 0, i32* @dec_plt2, align 4, !tbaa !10
  store i32 0, i32* @dec_plt1, align 4, !tbaa !10
  store i32 0, i32* @dec_al2, align 4, !tbaa !10
  store i32 0, i32* @dec_al1, align 4, !tbaa !10
  store i32 0, i32* @dec_nbl, align 4, !tbaa !10
  store i32 0, i32* @dec_rh2, align 4, !tbaa !10
  store i32 0, i32* @dec_rh1, align 4, !tbaa !10
  store i32 0, i32* @dec_ph2, align 4, !tbaa !10
  store i32 0, i32* @dec_ph1, align 4, !tbaa !10
  store i32 0, i32* @dec_ah2, align 4, !tbaa !10
  store i32 0, i32* @dec_ah1, align 4, !tbaa !10
  store i32 0, i32* @dec_nbh, align 4, !tbaa !10
  tail call void @llvm.memset.p0i8.i32(i8* bitcast ([6 x i32]* @delay_dltx to i8*), i8 0, i32 24, i32 4, i1 false) #3
  tail call void @llvm.memset.p0i8.i32(i8* bitcast ([6 x i32]* @delay_dhx to i8*), i8 0, i32 24, i32 4, i1 false) #3
  tail call void @llvm.memset.p0i8.i32(i8* bitcast ([6 x i32]* @dec_del_dltx to i8*), i8 0, i32 24, i32 4, i1 false) #3
  tail call void @llvm.memset.p0i8.i32(i8* bitcast ([6 x i32]* @dec_del_dhx to i8*), i8 0, i32 24, i32 4, i1 false) #3
  tail call void @llvm.memset.p0i8.i32(i8* bitcast ([6 x i32]* @delay_bpl to i8*), i8 0, i32 24, i32 4, i1 false) #3
  tail call void @llvm.memset.p0i8.i32(i8* bitcast ([6 x i32]* @delay_bph to i8*), i8 0, i32 24, i32 4, i1 false) #3
  tail call void @llvm.memset.p0i8.i32(i8* bitcast ([6 x i32]* @dec_del_bpl to i8*), i8 0, i32 24, i32 4, i1 false) #3
  tail call void @llvm.memset.p0i8.i32(i8* bitcast ([6 x i32]* @dec_del_bph to i8*), i8 0, i32 24, i32 4, i1 false) #3
  tail call void @llvm.memset.p0i8.i32(i8* bitcast ([24 x i32]* @tqmf to i8*), i8 0, i32 92, i32 4, i1 false) #3
  tail call void @llvm.memset.p0i8.i32(i8* bitcast ([11 x i32]* @accumc to i8*), i8 0, i32 44, i32 4, i1 false) #3
  tail call void @llvm.memset.p0i8.i32(i8* bitcast ([11 x i32]* @accumd to i8*), i8 0, i32 44, i32 4, i1 false) #3
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %xout, i32 0, i32 0
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %i.014 = phi i32 [ 0, %entry ], [ %add5, %for.body ]
  call void @decode(i32 0, i32* %arraydecay)
  %add5 = add nuw nsw i32 %i.014, 2
  %cmp = icmp slt i32 %add5, 100
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body
  %arrayidx6 = getelementptr inbounds [3 x i32], [3 x i32]* %xout, i32 0, i32 1
  %0 = load i32, i32* %arrayidx6, align 4, !tbaa !10
  %cmp7 = icmp eq i32 %0, 11113
  br i1 %cmp7, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %for.end
  %arrayidx8 = getelementptr inbounds [3 x i32], [3 x i32]* %xout, i32 0, i32 2
  %1 = load i32, i32* %arrayidx8, align 4, !tbaa !10
  %cmp9 = icmp eq i32 %1, -11197
  br i1 %cmp9, label %return, label %if.else

if.else:                                          ; preds = %land.lhs.true, %for.end
  br label %return

return:                                           ; preds = %land.lhs.true, %if.else
  %retval.0 = phi i32 [ 15, %if.else ], [ 66, %land.lhs.true ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i32(i8* nocapture, i8, i32, i32, i1) #3

attributes #0 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
!4 = distinct !{!4, !5, !6}
!5 = !{!"llvm.loop.vectorize.width", i32 1}
!6 = !{!"llvm.loop.interleave.count", i32 1}
!7 = distinct !{!7, !5, !6}
!8 = !{!9, !9, i64 0}
!9 = !{!"long", !2, i64 0}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !2, i64 0}
