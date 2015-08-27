; ModuleID = 'cjpeg_print.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@data = global [8 x [8 x i64]] [[8 x i64] [i64 1, i64 2, i64 3, i64 4, i64 5, i64 6, i64 7, i64 8], [8 x i64] [i64 11, i64 22, i64 33, i64 40, i64 51, i64 62, i64 73, i64 84], [8 x i64] [i64 12, i64 23, i64 34, i64 41, i64 52, i64 63, i64 74, i64 85], [8 x i64] [i64 13, i64 24, i64 35, i64 42, i64 53, i64 64, i64 75, i64 86], [8 x i64] [i64 14, i64 25, i64 36, i64 43, i64 54, i64 65, i64 76, i64 87], [8 x i64] [i64 15, i64 26, i64 37, i64 44, i64 55, i64 66, i64 77, i64 88], [8 x i64] [i64 16, i64 27, i64 38, i64 45, i64 56, i64 67, i64 78, i64 89], [8 x i64] [i64 17, i64 28, i64 39, i64 46, i64 57, i64 68, i64 79, i64 80]], align 16
@data_ref = global [8 x [8 x i64]] [[8 x i64] [i64 2826, i64 -1313, i64 22, i64 -151, i64 -38, i64 -45, i64 9, i64 10], [8 x i64] [i64 -592, i64 215, i64 11, i64 12, i64 19, i64 -1, i64 4, i64 -6], [8 x i64] [i64 -447, i64 239, i64 -24, i64 43, i64 -8, i64 20, i64 -9, i64 3], [8 x i64] [i64 -394, i64 182, i64 9, i64 11, i64 16, i64 -1, i64 4, i64 -5], [8 x i64] [i64 -342, i64 183, i64 -18, i64 33, i64 -6, i64 15, i64 -7, i64 2], [8 x i64] [i64 -258, i64 122, i64 6, i64 7, i64 11, i64 -1, i64 2, i64 -3], [8 x i64] [i64 -185, i64 99, i64 -10, i64 18, i64 -3, i64 8, i64 -4, i64 1], [8 x i64] [i64 -90, i64 43, i64 2, i64 2, i64 4, i64 0, i64 1, i64 -1]], align 16
@i = global i32 0, align 4
@a = global i32 0, align 4
@.str = private unnamed_addr constant [5 x i8] c"%d!\0A\00", align 1
@str = private unnamed_addr constant [9 x i8] c"Success!\00"

; Function Attrs: nounwind uwtable
define void @jpeg_fdct_islow(i64* nocapture %data) #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %ctr.0316 = phi i32 [ 7, %entry ], [ %dec, %for.body ]
  %dataptr.0315 = phi i64* [ %data, %entry ], [ %add.ptr, %for.body ]
  %0 = load i64, i64* %dataptr.0315, align 8, !tbaa !1
  %arrayidx1 = getelementptr inbounds i64, i64* %dataptr.0315, i64 7
  %1 = load i64, i64* %arrayidx1, align 8, !tbaa !1
  %add = add nsw i64 %1, %0
  %sub = sub nsw i64 %0, %1
  %arrayidx4 = getelementptr inbounds i64, i64* %dataptr.0315, i64 1
  %2 = load i64, i64* %arrayidx4, align 8, !tbaa !1
  %arrayidx5 = getelementptr inbounds i64, i64* %dataptr.0315, i64 6
  %3 = load i64, i64* %arrayidx5, align 8, !tbaa !1
  %add6 = add nsw i64 %3, %2
  %sub9 = sub nsw i64 %2, %3
  %arrayidx10 = getelementptr inbounds i64, i64* %dataptr.0315, i64 2
  %4 = load i64, i64* %arrayidx10, align 8, !tbaa !1
  %arrayidx11 = getelementptr inbounds i64, i64* %dataptr.0315, i64 5
  %5 = load i64, i64* %arrayidx11, align 8, !tbaa !1
  %add12 = add nsw i64 %5, %4
  %sub15 = sub nsw i64 %4, %5
  %arrayidx16 = getelementptr inbounds i64, i64* %dataptr.0315, i64 3
  %6 = load i64, i64* %arrayidx16, align 8, !tbaa !1
  %arrayidx17 = getelementptr inbounds i64, i64* %dataptr.0315, i64 4
  %7 = load i64, i64* %arrayidx17, align 8, !tbaa !1
  %add18 = add nsw i64 %7, %6
  %sub21 = sub nsw i64 %6, %7
  %add22 = add nsw i64 %add18, %add
  %sub23 = sub nsw i64 %add, %add18
  %add24 = add nsw i64 %add12, %add6
  %sub25 = sub nsw i64 %add6, %add12
  %add26 = add nsw i64 %add22, %add24
  %shl = shl i64 %add26, 1
  store i64 %shl, i64* %dataptr.0315, align 8, !tbaa !1
  %sub28 = sub nsw i64 %add22, %add24
  %shl29 = shl i64 %sub28, 1
  store i64 %shl29, i64* %arrayidx17, align 8, !tbaa !1
  %add31 = add nsw i64 %sub23, %sub25
  %mul = mul nsw i64 %add31, 4433
  %mul32 = mul nsw i64 %sub23, 6270
  %add33 = add i64 %mul32, 2048
  %add34 = add i64 %add33, %mul
  %shr = ashr i64 %add34, 12
  store i64 %shr, i64* %arrayidx10, align 8, !tbaa !1
  %8 = mul i64 %sub25, -15137
  %add37307 = add i64 %8, 2048
  %add38 = add i64 %add37307, %mul
  %shr39 = ashr i64 %add38, 12
  store i64 %shr39, i64* %arrayidx5, align 8, !tbaa !1
  %add41 = add nsw i64 %sub21, %sub
  %add42 = add nsw i64 %sub15, %sub9
  %add43 = add nsw i64 %sub21, %sub9
  %add44 = add nsw i64 %sub15, %sub
  %add45 = add nsw i64 %add43, %add44
  %mul46 = mul nsw i64 %add45, 9633
  %mul47 = mul nsw i64 %sub21, 2446
  %mul48 = mul nsw i64 %sub15, 16819
  %mul49 = mul nsw i64 %sub9, 25172
  %mul50 = mul nsw i64 %sub, 12299
  %mul51 = mul nsw i64 %add41, -7373
  %mul52 = mul nsw i64 %add42, -20995
  %9 = mul i64 %add43, -16069
  %add55308 = add i64 %mul46, %9
  %10 = mul i64 %add44, -3196
  %add56309 = add i64 %mul46, %10
  %add57 = add i64 %mul47, 2048
  %add58 = add i64 %add57, %mul51
  %add59 = add i64 %add58, %add55308
  %shr60 = ashr i64 %add59, 12
  store i64 %shr60, i64* %arrayidx1, align 8, !tbaa !1
  %add62 = add i64 %mul48, 2048
  %add63 = add i64 %add62, %mul52
  %add64 = add i64 %add63, %add56309
  %shr65 = ashr i64 %add64, 12
  store i64 %shr65, i64* %arrayidx11, align 8, !tbaa !1
  %add67 = add i64 %mul49, 2048
  %add68 = add i64 %add67, %mul52
  %add69 = add i64 %add68, %add55308
  %shr70 = ashr i64 %add69, 12
  store i64 %shr70, i64* %arrayidx16, align 8, !tbaa !1
  %add72 = add i64 %mul50, 2048
  %add73 = add i64 %add72, %mul51
  %add74 = add i64 %add73, %add56309
  %shr75 = ashr i64 %add74, 12
  store i64 %shr75, i64* %arrayidx4, align 8, !tbaa !1
  %add.ptr = getelementptr inbounds i64, i64* %dataptr.0315, i64 8
  %dec = add nsw i32 %ctr.0316, -1
  %cmp = icmp sgt i32 %ctr.0316, 0
  br i1 %cmp, label %for.body, label %for.body79.preheader

for.body79.preheader:                             ; preds = %for.body
  br label %for.body79

for.body79:                                       ; preds = %for.body79.preheader, %for.body79
  %ctr.1314 = phi i32 [ %dec165, %for.body79 ], [ 7, %for.body79.preheader ]
  %dataptr.1313 = phi i64* [ %incdec.ptr, %for.body79 ], [ %data, %for.body79.preheader ]
  %11 = load i64, i64* %dataptr.1313, align 8, !tbaa !1
  %arrayidx81 = getelementptr inbounds i64, i64* %dataptr.1313, i64 56
  %12 = load i64, i64* %arrayidx81, align 8, !tbaa !1
  %add82 = add nsw i64 %12, %11
  %sub85 = sub nsw i64 %11, %12
  %arrayidx86 = getelementptr inbounds i64, i64* %dataptr.1313, i64 8
  %13 = load i64, i64* %arrayidx86, align 8, !tbaa !1
  %arrayidx87 = getelementptr inbounds i64, i64* %dataptr.1313, i64 48
  %14 = load i64, i64* %arrayidx87, align 8, !tbaa !1
  %add88 = add nsw i64 %14, %13
  %sub91 = sub nsw i64 %13, %14
  %arrayidx92 = getelementptr inbounds i64, i64* %dataptr.1313, i64 16
  %15 = load i64, i64* %arrayidx92, align 8, !tbaa !1
  %arrayidx93 = getelementptr inbounds i64, i64* %dataptr.1313, i64 40
  %16 = load i64, i64* %arrayidx93, align 8, !tbaa !1
  %add94 = add nsw i64 %16, %15
  %sub97 = sub nsw i64 %15, %16
  %arrayidx98 = getelementptr inbounds i64, i64* %dataptr.1313, i64 24
  %17 = load i64, i64* %arrayidx98, align 8, !tbaa !1
  %arrayidx99 = getelementptr inbounds i64, i64* %dataptr.1313, i64 32
  %18 = load i64, i64* %arrayidx99, align 8, !tbaa !1
  %add100 = add nsw i64 %18, %17
  %sub103 = sub nsw i64 %17, %18
  %add104 = add nsw i64 %add100, %add82
  %sub105 = sub nsw i64 %add82, %add100
  %add106 = add nsw i64 %add94, %add88
  %sub107 = sub nsw i64 %add88, %add94
  %add108 = add i64 %add106, 1
  %add109 = add i64 %add108, %add104
  %shr110 = ashr i64 %add109, 1
  store i64 %shr110, i64* %dataptr.1313, align 8, !tbaa !1
  %sub112 = sub i64 1, %add106
  %add113 = add i64 %sub112, %add104
  %shr114 = ashr i64 %add113, 1
  store i64 %shr114, i64* %arrayidx99, align 8, !tbaa !1
  %add116 = add nsw i64 %sub105, %sub107
  %mul117 = mul nsw i64 %add116, 4433
  %mul118 = mul nsw i64 %sub105, 6270
  %add119 = add i64 %mul118, 8192
  %add120 = add i64 %add119, %mul117
  %shr121 = ashr i64 %add120, 14
  store i64 %shr121, i64* %arrayidx92, align 8, !tbaa !1
  %19 = mul i64 %sub107, -15137
  %add124310 = add i64 %19, 8192
  %add125 = add i64 %add124310, %mul117
  %shr126 = ashr i64 %add125, 14
  store i64 %shr126, i64* %arrayidx87, align 8, !tbaa !1
  %add128 = add nsw i64 %sub103, %sub85
  %add129 = add nsw i64 %sub97, %sub91
  %add130 = add nsw i64 %sub103, %sub91
  %add131 = add nsw i64 %sub97, %sub85
  %add132 = add nsw i64 %add130, %add131
  %mul133 = mul nsw i64 %add132, 9633
  %mul134 = mul nsw i64 %sub103, 2446
  %mul135 = mul nsw i64 %sub97, 16819
  %mul136 = mul nsw i64 %sub91, 25172
  %mul137 = mul nsw i64 %sub85, 12299
  %mul138 = mul nsw i64 %add128, -7373
  %mul139 = mul nsw i64 %add129, -20995
  %20 = mul i64 %add130, -16069
  %add142311 = add i64 %mul133, %20
  %21 = mul i64 %add131, -3196
  %add143312 = add i64 %mul133, %21
  %add144 = add i64 %mul134, 8192
  %add145 = add i64 %add144, %mul138
  %add146 = add i64 %add145, %add142311
  %shr147 = ashr i64 %add146, 14
  store i64 %shr147, i64* %arrayidx81, align 8, !tbaa !1
  %add149 = add i64 %mul135, 8192
  %add150 = add i64 %add149, %mul139
  %add151 = add i64 %add150, %add143312
  %shr152 = ashr i64 %add151, 14
  store i64 %shr152, i64* %arrayidx93, align 8, !tbaa !1
  %add154 = add i64 %mul136, 8192
  %add155 = add i64 %add154, %mul139
  %add156 = add i64 %add155, %add142311
  %shr157 = ashr i64 %add156, 14
  store i64 %shr157, i64* %arrayidx98, align 8, !tbaa !1
  %add159 = add i64 %mul137, 8192
  %add160 = add i64 %add159, %mul138
  %add161 = add i64 %add160, %add143312
  %shr162 = ashr i64 %add161, 14
  store i64 %shr162, i64* %arrayidx86, align 8, !tbaa !1
  %incdec.ptr = getelementptr inbounds i64, i64* %dataptr.1313, i64 1
  %dec165 = add nsw i32 %ctr.1314, -1
  %cmp78 = icmp sgt i32 %ctr.1314, 0
  br i1 %cmp78, label %for.body79, label %for.end166

for.end166:                                       ; preds = %for.body79
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  store i32 0, i32* @i, align 4, !tbaa !5
  br label %for.body

for.body:                                         ; preds = %entry, %for.inc21
  tail call void @jpeg_fdct_islow(i64* getelementptr inbounds ([8 x [8 x i64]], [8 x [8 x i64]]* @data, i64 0, i64 0, i64 0))
  %0 = load i32, i32* @i, align 4, !tbaa !5
  %cmp1 = icmp eq i32 %0, 0
  br i1 %cmp1, label %for.cond5.preheader.preheader, label %for.inc21

for.cond5.preheader.preheader:                    ; preds = %for.body
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.cond5.preheader.preheader, %for.inc.7
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.7 ], [ 0, %for.cond5.preheader.preheader ]
  %arrayidx9 = getelementptr inbounds [8 x [8 x i64]], [8 x [8 x i64]]* @data, i64 0, i64 %indvars.iv, i64 0
  %1 = load i64, i64* %arrayidx9, align 16, !tbaa !1
  %arrayidx13 = getelementptr inbounds [8 x [8 x i64]], [8 x [8 x i64]]* @data_ref, i64 0, i64 %indvars.iv, i64 0
  %2 = load i64, i64* %arrayidx13, align 16, !tbaa !1
  %cmp14 = icmp eq i64 %1, %2
  br i1 %cmp14, label %for.inc, label %if.then15

if.then15:                                        ; preds = %for.inc.6, %for.inc.5, %for.inc.4, %for.inc.3, %for.inc.2, %for.inc.1, %for.inc, %for.cond5.preheader
  %indvars.iv.lcssa = phi i64 [ %indvars.iv, %for.inc.6 ], [ %indvars.iv, %for.inc.5 ], [ %indvars.iv, %for.inc.4 ], [ %indvars.iv, %for.inc.3 ], [ %indvars.iv, %for.inc.2 ], [ %indvars.iv, %for.inc.1 ], [ %indvars.iv, %for.inc ], [ %indvars.iv, %for.cond5.preheader ]
  %k.037.lcssa.wide = phi i32 [ 0, %for.cond5.preheader ], [ 1, %for.inc ], [ 2, %for.inc.1 ], [ 3, %for.inc.2 ], [ 4, %for.inc.3 ], [ 5, %for.inc.4 ], [ 6, %for.inc.5 ], [ 7, %for.inc.6 ]
  %3 = trunc i64 %indvars.iv.lcssa to i32
  %add = add nsw i32 %k.037.lcssa.wide, %3
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i32 %add) #2
  br label %return

for.inc:                                          ; preds = %for.cond5.preheader
  %arrayidx9.1 = getelementptr inbounds [8 x [8 x i64]], [8 x [8 x i64]]* @data, i64 0, i64 %indvars.iv, i64 1
  %4 = load i64, i64* %arrayidx9.1, align 8, !tbaa !1
  %arrayidx13.1 = getelementptr inbounds [8 x [8 x i64]], [8 x [8 x i64]]* @data_ref, i64 0, i64 %indvars.iv, i64 1
  %5 = load i64, i64* %arrayidx13.1, align 8, !tbaa !1
  %cmp14.1 = icmp eq i64 %4, %5
  br i1 %cmp14.1, label %for.inc.1, label %if.then15

for.inc21.loopexit:                               ; preds = %for.inc.7
  br label %for.inc21

for.inc21:                                        ; preds = %for.inc21.loopexit, %for.body
  %inc22 = add nsw i32 %0, 1
  store i32 %inc22, i32* @i, align 4, !tbaa !5
  %cmp = icmp slt i32 %inc22, 1000
  br i1 %cmp, label %for.body, label %for.end23

for.end23:                                        ; preds = %for.inc21
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @str, i64 0, i64 0))
  br label %return

return:                                           ; preds = %for.end23, %if.then15
  %retval.0 = phi i32 [ %add, %if.then15 ], [ -1, %for.end23 ]
  ret i32 %retval.0

for.inc.1:                                        ; preds = %for.inc
  %arrayidx9.2 = getelementptr inbounds [8 x [8 x i64]], [8 x [8 x i64]]* @data, i64 0, i64 %indvars.iv, i64 2
  %6 = load i64, i64* %arrayidx9.2, align 16, !tbaa !1
  %arrayidx13.2 = getelementptr inbounds [8 x [8 x i64]], [8 x [8 x i64]]* @data_ref, i64 0, i64 %indvars.iv, i64 2
  %7 = load i64, i64* %arrayidx13.2, align 16, !tbaa !1
  %cmp14.2 = icmp eq i64 %6, %7
  br i1 %cmp14.2, label %for.inc.2, label %if.then15

for.inc.2:                                        ; preds = %for.inc.1
  %arrayidx9.3 = getelementptr inbounds [8 x [8 x i64]], [8 x [8 x i64]]* @data, i64 0, i64 %indvars.iv, i64 3
  %8 = load i64, i64* %arrayidx9.3, align 8, !tbaa !1
  %arrayidx13.3 = getelementptr inbounds [8 x [8 x i64]], [8 x [8 x i64]]* @data_ref, i64 0, i64 %indvars.iv, i64 3
  %9 = load i64, i64* %arrayidx13.3, align 8, !tbaa !1
  %cmp14.3 = icmp eq i64 %8, %9
  br i1 %cmp14.3, label %for.inc.3, label %if.then15

for.inc.3:                                        ; preds = %for.inc.2
  %arrayidx9.4 = getelementptr inbounds [8 x [8 x i64]], [8 x [8 x i64]]* @data, i64 0, i64 %indvars.iv, i64 4
  %10 = load i64, i64* %arrayidx9.4, align 16, !tbaa !1
  %arrayidx13.4 = getelementptr inbounds [8 x [8 x i64]], [8 x [8 x i64]]* @data_ref, i64 0, i64 %indvars.iv, i64 4
  %11 = load i64, i64* %arrayidx13.4, align 16, !tbaa !1
  %cmp14.4 = icmp eq i64 %10, %11
  br i1 %cmp14.4, label %for.inc.4, label %if.then15

for.inc.4:                                        ; preds = %for.inc.3
  %arrayidx9.5 = getelementptr inbounds [8 x [8 x i64]], [8 x [8 x i64]]* @data, i64 0, i64 %indvars.iv, i64 5
  %12 = load i64, i64* %arrayidx9.5, align 8, !tbaa !1
  %arrayidx13.5 = getelementptr inbounds [8 x [8 x i64]], [8 x [8 x i64]]* @data_ref, i64 0, i64 %indvars.iv, i64 5
  %13 = load i64, i64* %arrayidx13.5, align 8, !tbaa !1
  %cmp14.5 = icmp eq i64 %12, %13
  br i1 %cmp14.5, label %for.inc.5, label %if.then15

for.inc.5:                                        ; preds = %for.inc.4
  %arrayidx9.6 = getelementptr inbounds [8 x [8 x i64]], [8 x [8 x i64]]* @data, i64 0, i64 %indvars.iv, i64 6
  %14 = load i64, i64* %arrayidx9.6, align 16, !tbaa !1
  %arrayidx13.6 = getelementptr inbounds [8 x [8 x i64]], [8 x [8 x i64]]* @data_ref, i64 0, i64 %indvars.iv, i64 6
  %15 = load i64, i64* %arrayidx13.6, align 16, !tbaa !1
  %cmp14.6 = icmp eq i64 %14, %15
  br i1 %cmp14.6, label %for.inc.6, label %if.then15

for.inc.6:                                        ; preds = %for.inc.5
  %arrayidx9.7 = getelementptr inbounds [8 x [8 x i64]], [8 x [8 x i64]]* @data, i64 0, i64 %indvars.iv, i64 7
  %16 = load i64, i64* %arrayidx9.7, align 8, !tbaa !1
  %arrayidx13.7 = getelementptr inbounds [8 x [8 x i64]], [8 x [8 x i64]]* @data_ref, i64 0, i64 %indvars.iv, i64 7
  %17 = load i64, i64* %arrayidx13.7, align 8, !tbaa !1
  %cmp14.7 = icmp eq i64 %16, %17
  br i1 %cmp14.7, label %for.inc.7, label %if.then15

for.inc.7:                                        ; preds = %for.inc.6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %cmp3 = icmp slt i64 %indvars.iv.next, 8
  br i1 %cmp3, label %for.cond5.preheader, label %for.inc21.loopexit
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"long", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !3, i64 0}
