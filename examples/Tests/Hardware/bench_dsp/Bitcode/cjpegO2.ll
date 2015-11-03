; ModuleID = 'cjpeg.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@data = global [8 x [8 x i32]] [[8 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8], [8 x i32] [i32 11, i32 22, i32 33, i32 40, i32 51, i32 62, i32 73, i32 84], [8 x i32] [i32 12, i32 23, i32 34, i32 41, i32 52, i32 63, i32 74, i32 85], [8 x i32] [i32 13, i32 24, i32 35, i32 42, i32 53, i32 64, i32 75, i32 86], [8 x i32] [i32 14, i32 25, i32 36, i32 43, i32 54, i32 65, i32 76, i32 87], [8 x i32] [i32 15, i32 26, i32 37, i32 44, i32 55, i32 66, i32 77, i32 88], [8 x i32] [i32 16, i32 27, i32 38, i32 45, i32 56, i32 67, i32 78, i32 89], [8 x i32] [i32 17, i32 28, i32 39, i32 46, i32 57, i32 68, i32 79, i32 80]], align 4
@data_ref = global [8 x [8 x i32]] [[8 x i32] [i32 2826, i32 -1313, i32 22, i32 -151, i32 -38, i32 -45, i32 9, i32 10], [8 x i32] [i32 -592, i32 215, i32 11, i32 12, i32 19, i32 -1, i32 4, i32 -6], [8 x i32] [i32 -447, i32 239, i32 -24, i32 43, i32 -8, i32 20, i32 -9, i32 3], [8 x i32] [i32 -394, i32 182, i32 9, i32 11, i32 16, i32 -1, i32 4, i32 -5], [8 x i32] [i32 -342, i32 183, i32 -18, i32 33, i32 -6, i32 15, i32 -7, i32 2], [8 x i32] [i32 -258, i32 122, i32 6, i32 7, i32 11, i32 -1, i32 2, i32 -3], [8 x i32] [i32 -185, i32 99, i32 -10, i32 18, i32 -3, i32 8, i32 -4, i32 1], [8 x i32] [i32 -90, i32 43, i32 2, i32 2, i32 4, i32 0, i32 1, i32 -1]], align 4
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
  tail call void @jpeg_fdct_islow(i32* getelementptr inbounds ([8 x [8 x i32]], [8 x [8 x i32]]* @data, i32 0, i32 0, i32 0))
  %0 = load i32, i32* @i, align 4, !tbaa !5
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %for.cond2.preheader.preheader, label %return

for.cond2.preheader.preheader:                    ; preds = %entry
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.cond2.preheader.preheader, %for.inc.7
  %j.025 = phi i32 [ %inc11, %for.inc.7 ], [ 0, %for.cond2.preheader.preheader ]
  %arrayidx5 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data, i32 0, i32 %j.025, i32 0
  %1 = load i32, i32* %arrayidx5, align 4, !tbaa !1
  %arrayidx7 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data_ref, i32 0, i32 %j.025, i32 0
  %2 = load i32, i32* %arrayidx7, align 4, !tbaa !1
  %cmp8 = icmp eq i32 %1, %2
  br i1 %cmp8, label %for.inc, label %if.then9

if.then9:                                         ; preds = %for.inc.6, %for.inc.5, %for.inc.4, %for.inc.3, %for.inc.2, %for.inc.1, %for.inc, %for.cond2.preheader
  %j.025.lcssa = phi i32 [ %j.025, %for.inc.6 ], [ %j.025, %for.inc.5 ], [ %j.025, %for.inc.4 ], [ %j.025, %for.inc.3 ], [ %j.025, %for.inc.2 ], [ %j.025, %for.inc.1 ], [ %j.025, %for.inc ], [ %j.025, %for.cond2.preheader ]
  %k.024.lcssa = phi i32 [ 0, %for.cond2.preheader ], [ 1, %for.inc ], [ 2, %for.inc.1 ], [ 3, %for.inc.2 ], [ 4, %for.inc.3 ], [ 5, %for.inc.4 ], [ 6, %for.inc.5 ], [ 7, %for.inc.6 ]
  %add = add nsw i32 %k.024.lcssa, %j.025.lcssa
  br label %return

for.inc:                                          ; preds = %for.cond2.preheader
  %arrayidx5.1 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data, i32 0, i32 %j.025, i32 1
  %3 = load i32, i32* %arrayidx5.1, align 4, !tbaa !1
  %arrayidx7.1 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data_ref, i32 0, i32 %j.025, i32 1
  %4 = load i32, i32* %arrayidx7.1, align 4, !tbaa !1
  %cmp8.1 = icmp eq i32 %3, %4
  br i1 %cmp8.1, label %for.inc.1, label %if.then9

return.loopexit:                                  ; preds = %for.inc.7
  br label %return

return:                                           ; preds = %return.loopexit, %entry, %if.then9
  %retval.0 = phi i32 [ %add, %if.then9 ], [ -1, %entry ], [ -1, %return.loopexit ]
  ret i32 %retval.0

for.inc.1:                                        ; preds = %for.inc
  %arrayidx5.2 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data, i32 0, i32 %j.025, i32 2
  %5 = load i32, i32* %arrayidx5.2, align 4, !tbaa !1
  %arrayidx7.2 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data_ref, i32 0, i32 %j.025, i32 2
  %6 = load i32, i32* %arrayidx7.2, align 4, !tbaa !1
  %cmp8.2 = icmp eq i32 %5, %6
  br i1 %cmp8.2, label %for.inc.2, label %if.then9

for.inc.2:                                        ; preds = %for.inc.1
  %arrayidx5.3 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data, i32 0, i32 %j.025, i32 3
  %7 = load i32, i32* %arrayidx5.3, align 4, !tbaa !1
  %arrayidx7.3 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data_ref, i32 0, i32 %j.025, i32 3
  %8 = load i32, i32* %arrayidx7.3, align 4, !tbaa !1
  %cmp8.3 = icmp eq i32 %7, %8
  br i1 %cmp8.3, label %for.inc.3, label %if.then9

for.inc.3:                                        ; preds = %for.inc.2
  %arrayidx5.4 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data, i32 0, i32 %j.025, i32 4
  %9 = load i32, i32* %arrayidx5.4, align 4, !tbaa !1
  %arrayidx7.4 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data_ref, i32 0, i32 %j.025, i32 4
  %10 = load i32, i32* %arrayidx7.4, align 4, !tbaa !1
  %cmp8.4 = icmp eq i32 %9, %10
  br i1 %cmp8.4, label %for.inc.4, label %if.then9

for.inc.4:                                        ; preds = %for.inc.3
  %arrayidx5.5 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data, i32 0, i32 %j.025, i32 5
  %11 = load i32, i32* %arrayidx5.5, align 4, !tbaa !1
  %arrayidx7.5 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data_ref, i32 0, i32 %j.025, i32 5
  %12 = load i32, i32* %arrayidx7.5, align 4, !tbaa !1
  %cmp8.5 = icmp eq i32 %11, %12
  br i1 %cmp8.5, label %for.inc.5, label %if.then9

for.inc.5:                                        ; preds = %for.inc.4
  %arrayidx5.6 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data, i32 0, i32 %j.025, i32 6
  %13 = load i32, i32* %arrayidx5.6, align 4, !tbaa !1
  %arrayidx7.6 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data_ref, i32 0, i32 %j.025, i32 6
  %14 = load i32, i32* %arrayidx7.6, align 4, !tbaa !1
  %cmp8.6 = icmp eq i32 %13, %14
  br i1 %cmp8.6, label %for.inc.6, label %if.then9

for.inc.6:                                        ; preds = %for.inc.5
  %arrayidx5.7 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data, i32 0, i32 %j.025, i32 7
  %15 = load i32, i32* %arrayidx5.7, align 4, !tbaa !1
  %arrayidx7.7 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data_ref, i32 0, i32 %j.025, i32 7
  %16 = load i32, i32* %arrayidx7.7, align 4, !tbaa !1
  %cmp8.7 = icmp eq i32 %15, %16
  br i1 %cmp8.7, label %for.inc.7, label %if.then9

for.inc.7:                                        ; preds = %for.inc.6
  %inc11 = add nuw nsw i32 %j.025, 1
  %cmp1 = icmp slt i32 %inc11, 8
  br i1 %cmp1, label %for.cond2.preheader, label %return.loopexit
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"long", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !3, i64 0}
