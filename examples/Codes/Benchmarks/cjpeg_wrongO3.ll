; ModuleID = 'cjpeg_wrong.c'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

@data = global [8 x [8 x i32]] [[8 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8], [8 x i32] [i32 11, i32 22, i32 33, i32 40, i32 51, i32 62, i32 73, i32 84], [8 x i32] [i32 12, i32 23, i32 34, i32 41, i32 52, i32 63, i32 74, i32 85], [8 x i32] [i32 13, i32 24, i32 35, i32 42, i32 53, i32 64, i32 75, i32 86], [8 x i32] [i32 14, i32 25, i32 36, i32 43, i32 54, i32 65, i32 76, i32 87], [8 x i32] [i32 15, i32 26, i32 37, i32 44, i32 55, i32 66, i32 77, i32 88], [8 x i32] [i32 16, i32 27, i32 38, i32 45, i32 56, i32 67, i32 78, i32 89], [8 x i32] [i32 17, i32 28, i32 39, i32 46, i32 57, i32 68, i32 79, i32 80]], align 4
@data_ref = global [8 x [8 x i32]] [[8 x i32] [i32 2826, i32 -1313, i32 22, i32 -151, i32 -38, i32 -45, i32 9, i32 10], [8 x i32] [i32 -592, i32 215, i32 11, i32 12, i32 19, i32 -1, i32 4, i32 -6], [8 x i32] [i32 -447, i32 239, i32 -24, i32 43, i32 -8, i32 20, i32 -9, i32 3], [8 x i32] [i32 -394, i32 182, i32 9, i32 11, i32 16, i32 -1, i32 4, i32 -5], [8 x i32] [i32 -342, i32 183, i32 -18, i32 33, i32 -6, i32 15, i32 -7, i32 2], [8 x i32] [i32 -258, i32 122, i32 6, i32 7, i32 11, i32 -1, i32 2, i32 -3], [8 x i32] [i32 -185, i32 99, i32 -10, i32 18, i32 -3, i32 8, i32 -4, i32 1], [8 x i32] [i32 -90, i32 43, i32 2, i32 2, i32 4, i32 1, i32 1, i32 -1]], align 4
@i = global i32 0, align 4
@a = global i32 0, align 4

; Function Attrs: nounwind
define void @jpeg_fdct_islow(i32* nocapture %data) #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %ctr.0316 = phi i32 [ 7, %entry ], [ %dec, %for.body ]
  %dataptr.0315 = phi i32* [ %data, %entry ], [ %add.ptr, %for.body ]
  %0 = load i32, i32* %dataptr.0315, align 4, !tbaa !1
  %arrayidx1 = getelementptr inbounds i32, i32* %dataptr.0315, i32 7
  %1 = load i32, i32* %arrayidx1, align 4, !tbaa !1
  %add = add nsw i32 %1, %0
  %sub = sub nsw i32 %0, %1
  %arrayidx4 = getelementptr inbounds i32, i32* %dataptr.0315, i32 1
  %2 = load i32, i32* %arrayidx4, align 4, !tbaa !1
  %arrayidx5 = getelementptr inbounds i32, i32* %dataptr.0315, i32 6
  %3 = load i32, i32* %arrayidx5, align 4, !tbaa !1
  %add6 = add nsw i32 %3, %2
  %sub9 = sub nsw i32 %2, %3
  %arrayidx10 = getelementptr inbounds i32, i32* %dataptr.0315, i32 2
  %4 = load i32, i32* %arrayidx10, align 4, !tbaa !1
  %arrayidx11 = getelementptr inbounds i32, i32* %dataptr.0315, i32 5
  %5 = load i32, i32* %arrayidx11, align 4, !tbaa !1
  %add12 = add nsw i32 %5, %4
  %sub15 = sub nsw i32 %4, %5
  %arrayidx16 = getelementptr inbounds i32, i32* %dataptr.0315, i32 3
  %6 = load i32, i32* %arrayidx16, align 4, !tbaa !1
  %arrayidx17 = getelementptr inbounds i32, i32* %dataptr.0315, i32 4
  %7 = load i32, i32* %arrayidx17, align 4, !tbaa !1
  %add18 = add nsw i32 %7, %6
  %sub21 = sub nsw i32 %6, %7
  %add22 = add nsw i32 %add18, %add
  %sub23 = sub nsw i32 %add, %add18
  %add24 = add nsw i32 %add12, %add6
  %sub25 = sub nsw i32 %add6, %add12
  %add26 = add nsw i32 %add22, %add24
  %shl = shl i32 %add26, 1
  store i32 %shl, i32* %dataptr.0315, align 4, !tbaa !1
  %sub28 = sub nsw i32 %add22, %add24
  %shl29 = shl i32 %sub28, 1
  store i32 %shl29, i32* %arrayidx17, align 4, !tbaa !1
  %add31 = add nsw i32 %sub23, %sub25
  %mul = mul nsw i32 %add31, 4433
  %mul32 = mul nsw i32 %sub23, 6270
  %add33 = add i32 %mul32, 2048
  %add34 = add i32 %add33, %mul
  %shr = ashr i32 %add34, 12
  store i32 %shr, i32* %arrayidx10, align 4, !tbaa !1
  %8 = mul i32 %sub25, -15137
  %add37307 = add i32 %8, 2048
  %add38 = add i32 %add37307, %mul
  %shr39 = ashr i32 %add38, 12
  store i32 %shr39, i32* %arrayidx5, align 4, !tbaa !1
  %add41 = add nsw i32 %sub21, %sub
  %add42 = add nsw i32 %sub15, %sub9
  %add43 = add nsw i32 %sub21, %sub9
  %add44 = add nsw i32 %sub15, %sub
  %add45 = add nsw i32 %add43, %add44
  %mul46 = mul nsw i32 %add45, 9633
  %mul47 = mul nsw i32 %sub21, 2446
  %mul48 = mul nsw i32 %sub15, 16819
  %mul49 = mul nsw i32 %sub9, 25172
  %mul50 = mul nsw i32 %sub, 12299
  %mul51 = mul nsw i32 %add41, -7373
  %mul52 = mul nsw i32 %add42, -20995
  %9 = mul i32 %add43, -16069
  %add55308 = add i32 %mul46, %9
  %10 = mul i32 %add44, -3196
  %add56309 = add i32 %mul46, %10
  %add57 = add i32 %mul47, 2048
  %add58 = add i32 %add57, %mul51
  %add59 = add i32 %add58, %add55308
  %shr60 = ashr i32 %add59, 12
  store i32 %shr60, i32* %arrayidx1, align 4, !tbaa !1
  %add62 = add i32 %mul48, 2048
  %add63 = add i32 %add62, %mul52
  %add64 = add i32 %add63, %add56309
  %shr65 = ashr i32 %add64, 12
  store i32 %shr65, i32* %arrayidx11, align 4, !tbaa !1
  %add67 = add i32 %mul49, 2048
  %add68 = add i32 %add67, %mul52
  %add69 = add i32 %add68, %add55308
  %shr70 = ashr i32 %add69, 12
  store i32 %shr70, i32* %arrayidx16, align 4, !tbaa !1
  %add72 = add i32 %mul50, 2048
  %add73 = add i32 %add72, %mul51
  %add74 = add i32 %add73, %add56309
  %shr75 = ashr i32 %add74, 12
  store i32 %shr75, i32* %arrayidx4, align 4, !tbaa !1
  %add.ptr = getelementptr inbounds i32, i32* %dataptr.0315, i32 8
  %dec = add nsw i32 %ctr.0316, -1
  %cmp = icmp sgt i32 %ctr.0316, 0
  br i1 %cmp, label %for.body, label %for.body79.preheader

for.body79.preheader:                             ; preds = %for.body
  br label %for.body79

for.body79:                                       ; preds = %for.body79.preheader, %for.body79
  %ctr.1314 = phi i32 [ %dec165, %for.body79 ], [ 7, %for.body79.preheader ]
  %dataptr.1313 = phi i32* [ %incdec.ptr, %for.body79 ], [ %data, %for.body79.preheader ]
  %11 = load i32, i32* %dataptr.1313, align 4, !tbaa !1
  %arrayidx81 = getelementptr inbounds i32, i32* %dataptr.1313, i32 56
  %12 = load i32, i32* %arrayidx81, align 4, !tbaa !1
  %add82 = add nsw i32 %12, %11
  %sub85 = sub nsw i32 %11, %12
  %arrayidx86 = getelementptr inbounds i32, i32* %dataptr.1313, i32 8
  %13 = load i32, i32* %arrayidx86, align 4, !tbaa !1
  %arrayidx87 = getelementptr inbounds i32, i32* %dataptr.1313, i32 48
  %14 = load i32, i32* %arrayidx87, align 4, !tbaa !1
  %add88 = add nsw i32 %14, %13
  %sub91 = sub nsw i32 %13, %14
  %arrayidx92 = getelementptr inbounds i32, i32* %dataptr.1313, i32 16
  %15 = load i32, i32* %arrayidx92, align 4, !tbaa !1
  %arrayidx93 = getelementptr inbounds i32, i32* %dataptr.1313, i32 40
  %16 = load i32, i32* %arrayidx93, align 4, !tbaa !1
  %add94 = add nsw i32 %16, %15
  %sub97 = sub nsw i32 %15, %16
  %arrayidx98 = getelementptr inbounds i32, i32* %dataptr.1313, i32 24
  %17 = load i32, i32* %arrayidx98, align 4, !tbaa !1
  %arrayidx99 = getelementptr inbounds i32, i32* %dataptr.1313, i32 32
  %18 = load i32, i32* %arrayidx99, align 4, !tbaa !1
  %add100 = add nsw i32 %18, %17
  %sub103 = sub nsw i32 %17, %18
  %add104 = add nsw i32 %add100, %add82
  %sub105 = sub nsw i32 %add82, %add100
  %add106 = add nsw i32 %add94, %add88
  %sub107 = sub nsw i32 %add88, %add94
  %add108 = add i32 %add106, 1
  %add109 = add i32 %add108, %add104
  %shr110 = ashr i32 %add109, 1
  store i32 %shr110, i32* %dataptr.1313, align 4, !tbaa !1
  %sub112 = sub i32 1, %add106
  %add113 = add i32 %sub112, %add104
  %shr114 = ashr i32 %add113, 1
  store i32 %shr114, i32* %arrayidx99, align 4, !tbaa !1
  %add116 = add nsw i32 %sub105, %sub107
  %mul117 = mul nsw i32 %add116, 4433
  %mul118 = mul nsw i32 %sub105, 6270
  %add119 = add i32 %mul118, 8192
  %add120 = add i32 %add119, %mul117
  %shr121 = ashr i32 %add120, 14
  store i32 %shr121, i32* %arrayidx92, align 4, !tbaa !1
  %19 = mul i32 %sub107, -15137
  %add124310 = add i32 %19, 8192
  %add125 = add i32 %add124310, %mul117
  %shr126 = ashr i32 %add125, 14
  store i32 %shr126, i32* %arrayidx87, align 4, !tbaa !1
  %add128 = add nsw i32 %sub103, %sub85
  %add129 = add nsw i32 %sub97, %sub91
  %add130 = add nsw i32 %sub103, %sub91
  %add131 = add nsw i32 %sub97, %sub85
  %add132 = add nsw i32 %add130, %add131
  %mul133 = mul nsw i32 %add132, 9633
  %mul134 = mul nsw i32 %sub103, 2446
  %mul135 = mul nsw i32 %sub97, 16819
  %mul136 = mul nsw i32 %sub91, 25172
  %mul137 = mul nsw i32 %sub85, 12299
  %mul138 = mul nsw i32 %add128, -7373
  %mul139 = mul nsw i32 %add129, -20995
  %20 = mul i32 %add130, -16069
  %add142311 = add i32 %mul133, %20
  %21 = mul i32 %add131, -3196
  %add143312 = add i32 %mul133, %21
  %add144 = add i32 %mul134, 8192
  %add145 = add i32 %add144, %mul138
  %add146 = add i32 %add145, %add142311
  %shr147 = ashr i32 %add146, 14
  store i32 %shr147, i32* %arrayidx81, align 4, !tbaa !1
  %add149 = add i32 %mul135, 8192
  %add150 = add i32 %add149, %mul139
  %add151 = add i32 %add150, %add143312
  %shr152 = ashr i32 %add151, 14
  store i32 %shr152, i32* %arrayidx93, align 4, !tbaa !1
  %add154 = add i32 %mul136, 8192
  %add155 = add i32 %add154, %mul139
  %add156 = add i32 %add155, %add142311
  %shr157 = ashr i32 %add156, 14
  store i32 %shr157, i32* %arrayidx98, align 4, !tbaa !1
  %add159 = add i32 %mul137, 8192
  %add160 = add i32 %add159, %mul138
  %add161 = add i32 %add160, %add143312
  %shr162 = ashr i32 %add161, 14
  store i32 %shr162, i32* %arrayidx86, align 4, !tbaa !1
  %incdec.ptr = getelementptr inbounds i32, i32* %dataptr.1313, i32 1
  %dec165 = add nsw i32 %ctr.1314, -1
  %cmp78 = icmp sgt i32 %ctr.1314, 0
  br i1 %cmp78, label %for.body79, label %for.end166

for.end166:                                       ; preds = %for.body79
  ret void
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  store i32 0, i32* @i, align 4, !tbaa !5
  br label %for.body

for.body:                                         ; preds = %entry, %for.inc17
  %position.036 = phi i32 [ -1, %entry ], [ %position.4, %for.inc17 ]
  %isEqual.035 = phi i32 [ 1, %entry ], [ %isEqual.4, %for.inc17 ]
  tail call void @jpeg_fdct_islow(i32* getelementptr inbounds ([8 x [8 x i32]], [8 x [8 x i32]]* @data, i32 0, i32 0, i32 0))
  %0 = load i32, i32* @i, align 4, !tbaa !5
  %cmp1 = icmp eq i32 %0, 0
  br i1 %cmp1, label %for.cond5.preheader.preheader, label %for.inc17

for.cond5.preheader.preheader:                    ; preds = %for.body
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.cond5.preheader.preheader, %for.cond5.preheader
  %position.134 = phi i32 [ %position.2.mul.7, %for.cond5.preheader ], [ %position.036, %for.cond5.preheader.preheader ]
  %isEqual.133 = phi i32 [ %isEqual.2..7, %for.cond5.preheader ], [ %isEqual.035, %for.cond5.preheader.preheader ]
  %j.032 = phi i32 [ %inc14, %for.cond5.preheader ], [ 0, %for.cond5.preheader.preheader ]
  %arrayidx8 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data, i32 0, i32 %j.032, i32 0
  %1 = load i32, i32* %arrayidx8, align 4, !tbaa !1
  %arrayidx10 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data_ref, i32 0, i32 %j.032, i32 0
  %2 = load i32, i32* %arrayidx10, align 4, !tbaa !1
  %cmp11 = icmp eq i32 %1, %2
  %position.2.mul = select i1 %cmp11, i32 %position.134, i32 0
  %arrayidx8.1 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data, i32 0, i32 %j.032, i32 1
  %3 = load i32, i32* %arrayidx8.1, align 4, !tbaa !1
  %arrayidx10.1 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data_ref, i32 0, i32 %j.032, i32 1
  %4 = load i32, i32* %arrayidx10.1, align 4, !tbaa !1
  %cmp11.1 = icmp eq i32 %3, %4
  %5 = and i1 %cmp11.1, %cmp11
  %position.2.mul.1 = select i1 %cmp11.1, i32 %position.2.mul, i32 %j.032
  %arrayidx8.2 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data, i32 0, i32 %j.032, i32 2
  %6 = load i32, i32* %arrayidx8.2, align 4, !tbaa !1
  %arrayidx10.2 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data_ref, i32 0, i32 %j.032, i32 2
  %7 = load i32, i32* %arrayidx10.2, align 4, !tbaa !1
  %cmp11.2 = icmp eq i32 %6, %7
  %mul.2 = shl nuw nsw i32 %j.032, 1
  %8 = and i1 %cmp11.2, %5
  %position.2.mul.2 = select i1 %cmp11.2, i32 %position.2.mul.1, i32 %mul.2
  %arrayidx8.3 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data, i32 0, i32 %j.032, i32 3
  %9 = load i32, i32* %arrayidx8.3, align 4, !tbaa !1
  %arrayidx10.3 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data_ref, i32 0, i32 %j.032, i32 3
  %10 = load i32, i32* %arrayidx10.3, align 4, !tbaa !1
  %cmp11.3 = icmp eq i32 %9, %10
  %mul.3 = mul nuw nsw i32 %j.032, 3
  %11 = and i1 %cmp11.3, %8
  %position.2.mul.3 = select i1 %cmp11.3, i32 %position.2.mul.2, i32 %mul.3
  %arrayidx8.4 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data, i32 0, i32 %j.032, i32 4
  %12 = load i32, i32* %arrayidx8.4, align 4, !tbaa !1
  %arrayidx10.4 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data_ref, i32 0, i32 %j.032, i32 4
  %13 = load i32, i32* %arrayidx10.4, align 4, !tbaa !1
  %cmp11.4 = icmp eq i32 %12, %13
  %mul.4 = shl nuw nsw i32 %j.032, 2
  %14 = and i1 %cmp11.4, %11
  %position.2.mul.4 = select i1 %cmp11.4, i32 %position.2.mul.3, i32 %mul.4
  %arrayidx8.5 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data, i32 0, i32 %j.032, i32 5
  %15 = load i32, i32* %arrayidx8.5, align 4, !tbaa !1
  %arrayidx10.5 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data_ref, i32 0, i32 %j.032, i32 5
  %16 = load i32, i32* %arrayidx10.5, align 4, !tbaa !1
  %cmp11.5 = icmp eq i32 %15, %16
  %mul.5 = mul nuw nsw i32 %j.032, 5
  %17 = and i1 %cmp11.5, %14
  %position.2.mul.5 = select i1 %cmp11.5, i32 %position.2.mul.4, i32 %mul.5
  %arrayidx8.6 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data, i32 0, i32 %j.032, i32 6
  %18 = load i32, i32* %arrayidx8.6, align 4, !tbaa !1
  %arrayidx10.6 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data_ref, i32 0, i32 %j.032, i32 6
  %19 = load i32, i32* %arrayidx10.6, align 4, !tbaa !1
  %cmp11.6 = icmp eq i32 %18, %19
  %mul.6 = mul nuw nsw i32 %j.032, 6
  %20 = and i1 %cmp11.6, %17
  %position.2.mul.6 = select i1 %cmp11.6, i32 %position.2.mul.5, i32 %mul.6
  %arrayidx8.7 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data, i32 0, i32 %j.032, i32 7
  %21 = load i32, i32* %arrayidx8.7, align 4, !tbaa !1
  %arrayidx10.7 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data_ref, i32 0, i32 %j.032, i32 7
  %22 = load i32, i32* %arrayidx10.7, align 4, !tbaa !1
  %cmp11.7 = icmp eq i32 %21, %22
  %mul.7 = mul nuw nsw i32 %j.032, 7
  %23 = and i1 %cmp11.7, %20
  %isEqual.2..7 = select i1 %23, i32 %isEqual.133, i32 0
  %position.2.mul.7 = select i1 %cmp11.7, i32 %position.2.mul.6, i32 %mul.7
  %inc14 = add nuw nsw i32 %j.032, 1
  %exitcond = icmp eq i32 %inc14, 8
  br i1 %exitcond, label %for.inc17.loopexit, label %for.cond5.preheader

for.inc17.loopexit:                               ; preds = %for.cond5.preheader
  %position.2.mul.7.lcssa = phi i32 [ %position.2.mul.7, %for.cond5.preheader ]
  %isEqual.2..7.lcssa = phi i32 [ %isEqual.2..7, %for.cond5.preheader ]
  br label %for.inc17

for.inc17:                                        ; preds = %for.inc17.loopexit, %for.body
  %isEqual.4 = phi i32 [ %isEqual.035, %for.body ], [ %isEqual.2..7.lcssa, %for.inc17.loopexit ]
  %position.4 = phi i32 [ %position.036, %for.body ], [ %position.2.mul.7.lcssa, %for.inc17.loopexit ]
  %inc18 = add nsw i32 %0, 1
  store i32 %inc18, i32* @i, align 4, !tbaa !5
  %cmp = icmp slt i32 %inc18, 1000
  br i1 %cmp, label %for.body, label %for.end19

for.end19:                                        ; preds = %for.inc17
  %position.4.lcssa = phi i32 [ %position.4, %for.inc17 ]
  %isEqual.4.lcssa = phi i32 [ %isEqual.4, %for.inc17 ]
  %tobool = icmp eq i32 %isEqual.4.lcssa, 0
  %position.0. = select i1 %tobool, i32 %position.4.lcssa, i32 -1
  ret i32 %position.0.
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"long", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !3, i64 0}
