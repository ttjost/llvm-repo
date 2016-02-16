; ModuleID = 'dft_print.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

%struct.int_64_t = type { i32, i32 }

@rowsums = global [24 x i32] [i32 759, i32 776, i32 787, i32 795, i32 797, i32 796, i32 801, i32 805, i32 800, i32 800, i32 799, i32 801, i32 799, i32 790, i32 781, i32 775, i32 772, i32 769, i32 768, i32 767, i32 762, i32 761, i32 755, i32 751], align 4
@powers = global [4 x [24 x i32]] zeroinitializer, align 4
@powers_temp = global [4 x [24 x i32]] [[24 x i32] [i32 2436991, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], [24 x i32] [i32 63546, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], [24 x i32] [i32 131381, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], [24 x i32] [i32 19272, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0]], align 4
@dft_waves_cos = global [96 x i32] [i32 131072, i32 126606, i32 113512, i32 92683, i32 65537, i32 33926, i32 3, i32 -33921, i32 -65532, i32 -92679, i32 -113509, i32 -126605, i32 -131072, i32 -126608, i32 -113516, i32 -92689, i32 -65544, i32 -33934, i32 -11, i32 33913, i32 65526, i32 92673, i32 113505, i32 126602, i32 131072, i32 113512, i32 65537, i32 3, i32 -65532, i32 -113509, i32 -131072, i32 -113516, i32 -65544, i32 -11, i32 65526, i32 113505, i32 131072, i32 113518, i32 65549, i32 16, i32 -65521, i32 -113503, i32 -131072, i32 -113523, i32 -65556, i32 -24, i32 65514, i32 113499, i32 131072, i32 92683, i32 3, i32 -92679, i32 -131072, i32 -92689, i32 -11, i32 92673, i32 131072, i32 92692, i32 16, i32 -92669, i32 -131072, i32 -92698, i32 -24, i32 92664, i32 131071, i32 92701, i32 29, i32 -92660, i32 -131072, i32 -92707, i32 -37, i32 92654, i32 131072, i32 65537, i32 -65532, i32 -131072, i32 -65544, i32 65526, i32 131072, i32 65549, i32 -65521, i32 -131072, i32 -65556, i32 65514, i32 131071, i32 65560, i32 -65510, i32 -131072, i32 -65567, i32 65503, i32 131071, i32 65571, i32 -65499, i32 -131072, i32 -65578, i32 65492], align 4
@dft_waves_sin = global [96 x i32] [i32 0, i32 33923, i32 65535, i32 92680, i32 113510, i32 126605, i32 131071, i32 126606, i32 113514, i32 92685, i32 65540, i32 33929, i32 6, i32 -33917, i32 -65530, i32 -92676, i32 -113508, i32 -126604, i32 -131072, i32 -126609, i32 -113518, i32 -92691, i32 -65547, i32 -33937, i32 0, i32 65535, i32 113510, i32 131071, i32 113514, i32 65540, i32 6, i32 -65530, i32 -113508, i32 -131072, i32 -113518, i32 -65547, i32 -14, i32 65523, i32 113504, i32 131071, i32 113520, i32 65552, i32 19, i32 -65518, i32 -113501, i32 -131072, i32 -113524, i32 -65558, i32 0, i32 92680, i32 131071, i32 92685, i32 6, i32 -92676, i32 -131072, i32 -92691, i32 -14, i32 92671, i32 131071, i32 92694, i32 19, i32 -92667, i32 -131072, i32 -92700, i32 -27, i32 92662, i32 131071, i32 92704, i32 32, i32 -92658, i32 -131072, i32 -92709, i32 0, i32 113510, i32 113514, i32 6, i32 -113508, i32 -113518, i32 -14, i32 113504, i32 113520, i32 19, i32 -113501, i32 -113524, i32 -27, i32 113497, i32 113527, i32 32, i32 -113495, i32 -113531, i32 -40, i32 113491, i32 113533, i32 45, i32 -113488, i32 -113537], align 4
@.str = private unnamed_addr constant [5 x i8] c"666\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"-1\0A\00", align 1
@str = private unnamed_addr constant [3 x i8] c"-1\00"
@str2 = private unnamed_addr constant [4 x i8] c"666\00"

; Function Attrs: nounwind readnone
define i32 @cast_uint32(i32 %x.0, i32 %x.1) #0 {
entry:
  ret i32 %x.1
}

; Function Attrs: nounwind readnone
define i32 @cast_int32(i32 %x.0, i32 %x.1) #0 {
entry:
  %tobool = icmp slt i32 %x.0, 0
  br i1 %tobool, label %if.then, label %if.else5

if.then:                                          ; preds = %entry
  %cmp = icmp eq i32 %x.0, -1
  %x.1. = select i1 %cmp, i32 %x.1, i32 0
  ret i32 %x.1.

if.else5:                                         ; preds = %entry
  %cmp7 = icmp eq i32 %x.0, 0
  %x.1.15 = select i1 %cmp7, i32 %x.1, i32 0
  ret i32 %x.1.15
}

; Function Attrs: nounwind
define void @cast(%struct.int_64_t* noalias nocapture sret %agg.result, i32 %x) #1 {
entry:
  %x.lobit = ashr i32 %x, 31
  %llong.sroa.0.0..sroa_idx = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 0
  store i32 %x.lobit, i32* %llong.sroa.0.0..sroa_idx, align 4
  %llong.sroa.3.0..sroa_idx2 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 1
  store i32 %x, i32* %llong.sroa.3.0..sroa_idx2, align 4
  ret void
}

; Function Attrs: nounwind
define void @add(%struct.int_64_t* noalias nocapture sret %agg.result, i32 %x.0, i32 %x.1, i32 %y.0, i32 %y.1) #1 {
entry:
  %add = add i32 %y.1, %x.1
  %cmp = icmp ult i32 %add, %x.1
  %cmp8 = icmp ult i32 %add, %y.1
  %or.cond = or i1 %cmp, %cmp8
  %z2.0 = zext i1 %or.cond to i32
  %add9 = add i32 %y.0, %x.0
  %add10 = add i32 %add9, %z2.0
  %sum.sroa.0.0..sroa_idx = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 0
  store i32 %add10, i32* %sum.sroa.0.0..sroa_idx, align 4
  %sum.sroa.2.0..sroa_idx13 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 1
  store i32 %add, i32* %sum.sroa.2.0..sroa_idx13, align 4
  ret void
}

; Function Attrs: nounwind
define void @neg(%struct.int_64_t* noalias nocapture sret %agg.result, i32 %x.0, i32 %x.1) #1 {
entry:
  %agg.tmp = alloca %struct.int_64_t, align 4
  %neg = xor i32 %x.1, -1
  %neg4 = xor i32 %x.0, -1
  call void @cast(%struct.int_64_t* sret %agg.tmp, i32 1)
  %high8 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp, i32 0, i32 0
  %0 = load i32, i32* %high8, align 4, !tbaa !1
  %low9 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp, i32 0, i32 1
  %1 = load i32, i32* %low9, align 4, !tbaa !6
  tail call void @add(%struct.int_64_t* sret %agg.result, i32 %neg4, i32 %neg, i32 %0, i32 %1)
  ret void
}

; Function Attrs: nounwind readnone
define i32 @abs(i32 %x) #0 {
entry:
  %cmp = icmp slt i32 %x, 0
  %sub = sub nsw i32 0, %x
  %retval.0 = select i1 %cmp, i32 %sub, i32 %x
  ret i32 %retval.0
}

; Function Attrs: nounwind
define void @ucast(%struct.int_64_t* noalias nocapture sret %agg.result, i32 %x) #1 {
entry:
  %llong.sroa.0.0..sroa_idx = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 0
  store i32 0, i32* %llong.sroa.0.0..sroa_idx, align 4
  %llong.sroa.2.0..sroa_idx1 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 1
  store i32 %x, i32* %llong.sroa.2.0..sroa_idx1, align 4
  ret void
}

; Function Attrs: nounwind
define void @sll(%struct.int_64_t* noalias nocapture sret %agg.result, i32 %value.0, i32 %value.1, i8 zeroext %pos) #1 {
entry:
  %conv = zext i8 %pos to i32
  %cmp = icmp ult i8 %pos, 32
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %shl = shl i32 %value.0, %conv
  %sub = sub nsw i32 32, %conv
  %shr = lshr i32 %value.1, %sub
  %or = or i32 %shr, %shl
  %shl9 = shl i32 %value.1, %conv
  br label %if.end

if.else:                                          ; preds = %entry
  %sub12 = add nsw i32 %conv, -32
  %shl13 = shl i32 %value.1, %sub12
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %value.sroa.0.0 = phi i32 [ %or, %if.then ], [ %shl13, %if.else ]
  %value.sroa.7.0 = phi i32 [ %shl9, %if.then ], [ 0, %if.else ]
  %value.sroa.0.0..sroa_idx = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 0
  store i32 %value.sroa.0.0, i32* %value.sroa.0.0..sroa_idx, align 4
  %value.sroa.7.0..sroa_idx21 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 1
  store i32 %value.sroa.7.0, i32* %value.sroa.7.0..sroa_idx21, align 4
  ret void
}

; Function Attrs: nounwind
define void @sra(%struct.int_64_t* noalias nocapture sret %agg.result, i32 %value.0, i32 %value.1, i8 zeroext %pos) #1 {
entry:
  %conv = zext i8 %pos to i32
  %cmp = icmp ult i8 %pos, 32
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %shr = lshr i32 %value.1, %conv
  %sub = sub nsw i32 32, %conv
  %shl = shl i32 %value.0, %sub
  %or = or i32 %shl, %shr
  %shr9 = ashr i32 %value.0, %conv
  br label %if.end

if.else:                                          ; preds = %entry
  %sub13 = add nsw i32 %conv, -32
  %shr14 = ashr i32 %value.0, %sub13
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %value.sroa.0.0 = phi i32 [ %shr9, %if.then ], [ -1, %if.else ]
  %value.sroa.7.0 = phi i32 [ %or, %if.then ], [ %shr14, %if.else ]
  %value.sroa.0.0..sroa_idx = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 0
  store i32 %value.sroa.0.0, i32* %value.sroa.0.0..sroa_idx, align 4
  %value.sroa.7.0..sroa_idx23 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 1
  store i32 %value.sroa.7.0, i32* %value.sroa.7.0..sroa_idx23, align 4
  ret void
}

; Function Attrs: nounwind
define void @umult(%struct.int_64_t* noalias nocapture sret %agg.result, i32 %a, i32 %b) #1 {
entry:
  %tmp = alloca %struct.int_64_t, align 4
  %agg.tmp = alloca %struct.int_64_t, align 4
  %agg.tmp6 = alloca %struct.int_64_t, align 4
  %tmp7 = alloca %struct.int_64_t, align 4
  %agg.tmp12 = alloca %struct.int_64_t, align 4
  %agg.tmp13 = alloca %struct.int_64_t, align 4
  %tmp16 = alloca %struct.int_64_t, align 4
  %agg.tmp21 = alloca %struct.int_64_t, align 4
  %agg.tmp22 = alloca %struct.int_64_t, align 4
  %tmp25 = alloca %struct.int_64_t, align 4
  %and = and i32 %a, 65535
  %shr = lshr i32 %a, 16
  %and1 = and i32 %b, 65535
  %shr2 = lshr i32 %b, 16
  %mul = mul nuw i32 %and1, %and
  %mul3 = mul nuw i32 %shr2, %and
  %mul4 = mul nuw i32 %and1, %shr
  %mul5 = mul nuw i32 %shr2, %shr
  call void @ucast(%struct.int_64_t* sret %tmp, i32 %mul)
  %res.sroa.0.0..sroa_idx = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %tmp, i32 0, i32 0
  %res.sroa.0.0.copyload = load i32, i32* %res.sroa.0.0..sroa_idx, align 4
  %res.sroa.8.0..sroa_idx40 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %tmp, i32 0, i32 1
  %res.sroa.8.0.copyload = load i32, i32* %res.sroa.8.0..sroa_idx40, align 4
  call void @ucast(%struct.int_64_t* sret %agg.tmp6, i32 %mul3)
  %high = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp6, i32 0, i32 0
  %0 = load i32, i32* %high, align 4, !tbaa !1
  %low = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp6, i32 0, i32 1
  %1 = load i32, i32* %low, align 4, !tbaa !6
  call void @sll(%struct.int_64_t* sret %agg.tmp, i32 %0, i32 %1, i8 zeroext 16)
  %high10 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp, i32 0, i32 0
  %2 = load i32, i32* %high10, align 4, !tbaa !1
  %low11 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp, i32 0, i32 1
  %3 = load i32, i32* %low11, align 4, !tbaa !6
  call void @add(%struct.int_64_t* sret %tmp7, i32 %res.sroa.0.0.copyload, i32 %res.sroa.8.0.copyload, i32 %2, i32 %3)
  %res.sroa.0.0..sroa_idx32 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %tmp7, i32 0, i32 0
  %res.sroa.0.0.copyload33 = load i32, i32* %res.sroa.0.0..sroa_idx32, align 4
  %res.sroa.8.0..sroa_idx41 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %tmp7, i32 0, i32 1
  %res.sroa.8.0.copyload42 = load i32, i32* %res.sroa.8.0..sroa_idx41, align 4
  call void @ucast(%struct.int_64_t* sret %agg.tmp13, i32 %mul4)
  %high14 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp13, i32 0, i32 0
  %4 = load i32, i32* %high14, align 4, !tbaa !1
  %low15 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp13, i32 0, i32 1
  %5 = load i32, i32* %low15, align 4, !tbaa !6
  call void @sll(%struct.int_64_t* sret %agg.tmp12, i32 %4, i32 %5, i8 zeroext 16)
  %high19 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp12, i32 0, i32 0
  %6 = load i32, i32* %high19, align 4, !tbaa !1
  %low20 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp12, i32 0, i32 1
  %7 = load i32, i32* %low20, align 4, !tbaa !6
  call void @add(%struct.int_64_t* sret %tmp16, i32 %res.sroa.0.0.copyload33, i32 %res.sroa.8.0.copyload42, i32 %6, i32 %7)
  %res.sroa.0.0..sroa_idx34 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %tmp16, i32 0, i32 0
  %res.sroa.0.0.copyload35 = load i32, i32* %res.sroa.0.0..sroa_idx34, align 4
  %res.sroa.8.0..sroa_idx43 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %tmp16, i32 0, i32 1
  %res.sroa.8.0.copyload44 = load i32, i32* %res.sroa.8.0..sroa_idx43, align 4
  call void @ucast(%struct.int_64_t* sret %agg.tmp22, i32 %mul5)
  %high23 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp22, i32 0, i32 0
  %8 = load i32, i32* %high23, align 4, !tbaa !1
  %low24 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp22, i32 0, i32 1
  %9 = load i32, i32* %low24, align 4, !tbaa !6
  call void @sll(%struct.int_64_t* sret %agg.tmp21, i32 %8, i32 %9, i8 zeroext 32)
  %high28 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp21, i32 0, i32 0
  %10 = load i32, i32* %high28, align 4, !tbaa !1
  %low29 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp21, i32 0, i32 1
  %11 = load i32, i32* %low29, align 4, !tbaa !6
  call void @add(%struct.int_64_t* sret %tmp25, i32 %res.sroa.0.0.copyload35, i32 %res.sroa.8.0.copyload44, i32 %10, i32 %11)
  %res.sroa.0.0..sroa_idx36 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %tmp25, i32 0, i32 0
  %res.sroa.0.0.copyload37 = load i32, i32* %res.sroa.0.0..sroa_idx36, align 4
  %res.sroa.8.0..sroa_idx45 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %tmp25, i32 0, i32 1
  %res.sroa.8.0.copyload46 = load i32, i32* %res.sroa.8.0..sroa_idx45, align 4
  %res.sroa.0.0..sroa_idx38 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 0
  store i32 %res.sroa.0.0.copyload37, i32* %res.sroa.0.0..sroa_idx38, align 4
  %res.sroa.8.0..sroa_idx47 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 1
  store i32 %res.sroa.8.0.copyload46, i32* %res.sroa.8.0..sroa_idx47, align 4
  ret void
}

; Function Attrs: nounwind
define void @mult(%struct.int_64_t* noalias nocapture sret %agg.result, i32 %v1, i32 %v2) #1 {
entry:
  %tmp = alloca %struct.int_64_t, align 4
  %tmp4 = alloca %struct.int_64_t, align 4
  %v1.lobit16 = xor i32 %v2, %v1
  %ispos = icmp sgt i32 %v1, -1
  %neg = sub i32 0, %v1
  %0 = select i1 %ispos, i32 %v1, i32 %neg
  %ispos17 = icmp sgt i32 %v2, -1
  %neg18 = sub i32 0, %v2
  %1 = select i1 %ispos17, i32 %v2, i32 %neg18
  call void @umult(%struct.int_64_t* sret %tmp, i32 %0, i32 %1)
  %product.sroa.0.0..sroa_idx = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %tmp, i32 0, i32 0
  %product.sroa.0.0.copyload = load i32, i32* %product.sroa.0.0..sroa_idx, align 4
  %product.sroa.4.0..sroa_idx9 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %tmp, i32 0, i32 1
  %product.sroa.4.0.copyload = load i32, i32* %product.sroa.4.0..sroa_idx9, align 4
  %tobool = icmp slt i32 %v1.lobit16, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @neg(%struct.int_64_t* sret %tmp4, i32 %product.sroa.0.0.copyload, i32 %product.sroa.4.0.copyload)
  %product.sroa.0.0..sroa_idx5 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %tmp4, i32 0, i32 0
  %product.sroa.0.0.copyload6 = load i32, i32* %product.sroa.0.0..sroa_idx5, align 4
  %product.sroa.4.0..sroa_idx10 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %tmp4, i32 0, i32 1
  %product.sroa.4.0.copyload11 = load i32, i32* %product.sroa.4.0..sroa_idx10, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %product.sroa.0.0 = phi i32 [ %product.sroa.0.0.copyload6, %if.then ], [ %product.sroa.0.0.copyload, %entry ]
  %product.sroa.4.0 = phi i32 [ %product.sroa.4.0.copyload11, %if.then ], [ %product.sroa.4.0.copyload, %entry ]
  %product.sroa.0.0..sroa_idx7 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 0
  store i32 %product.sroa.0.0, i32* %product.sroa.0.0..sroa_idx7, align 4
  %product.sroa.4.0..sroa_idx12 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 1
  store i32 %product.sroa.4.0, i32* %product.sroa.4.0..sroa_idx12, align 4
  ret void
}

; Function Attrs: nounwind
define void @sum_rot_block_row([24 x i32]* nocapture %powers) #1 {
entry:
  %agg.tmp = alloca %struct.int_64_t, align 4
  %agg.tmp4 = alloca %struct.int_64_t, align 4
  %agg.tmp9 = alloca %struct.int_64_t, align 4
  %agg.tmp10 = alloca %struct.int_64_t, align 4
  %agg.tmp22 = alloca %struct.int_64_t, align 4
  %agg.tmp23 = alloca %struct.int_64_t, align 4
  %agg.tmp30 = alloca %struct.int_64_t, align 4
  %agg.tmp31 = alloca %struct.int_64_t, align 4
  %high = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp4, i32 0, i32 0
  %low = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp4, i32 0, i32 1
  %high6 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp, i32 0, i32 0
  %low7 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp, i32 0, i32 1
  %high16 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp10, i32 0, i32 0
  %low17 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp10, i32 0, i32 1
  %high18 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp9, i32 0, i32 0
  %low19 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp9, i32 0, i32 1
  %high25 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp23, i32 0, i32 0
  %low26 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp23, i32 0, i32 1
  %high27 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp22, i32 0, i32 0
  %low28 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp22, i32 0, i32 1
  %high34 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp31, i32 0, i32 0
  %low35 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp31, i32 0, i32 1
  %high36 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp30, i32 0, i32 0
  %low37 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp30, i32 0, i32 1
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end, %entry
  %w.061 = phi i32 [ 0, %entry ], [ %inc43, %for.end ]
  %mul = mul nuw nsw i32 %w.061, 24
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %fp_sinpart.060 = phi i32 [ 0, %for.cond1.preheader ], [ %add21, %for.body3 ]
  %fp_cospart.059 = phi i32 [ 0, %for.cond1.preheader ], [ %add8, %for.body3 ]
  %i.058 = phi i32 [ 0, %for.cond1.preheader ], [ %inc, %for.body3 ]
  %arrayidx = getelementptr inbounds [24 x i32], [24 x i32]* @rowsums, i32 0, i32 %i.058
  %0 = load i32, i32* %arrayidx, align 4, !tbaa !7
  %shl = shl i32 %0, 17
  %add = add nuw nsw i32 %i.058, %mul
  %arrayidx5 = getelementptr inbounds [96 x i32], [96 x i32]* @dft_waves_cos, i32 0, i32 %add
  %1 = load i32, i32* %arrayidx5, align 4, !tbaa !7
  call void @mult(%struct.int_64_t* sret %agg.tmp4, i32 %shl, i32 %1)
  %2 = load i32, i32* %high, align 4, !tbaa !1
  %3 = load i32, i32* %low, align 4, !tbaa !6
  call void @sra(%struct.int_64_t* sret %agg.tmp, i32 %2, i32 %3, i8 zeroext 17)
  %4 = load i32, i32* %high6, align 4, !tbaa !1
  %5 = load i32, i32* %low7, align 4, !tbaa !6
  %call = tail call i32 @cast_int32(i32 %4, i32 %5)
  %add8 = add nsw i32 %call, %fp_cospart.059
  %6 = load i32, i32* %arrayidx, align 4, !tbaa !7
  %shl12 = shl i32 %6, 17
  %arrayidx15 = getelementptr inbounds [96 x i32], [96 x i32]* @dft_waves_sin, i32 0, i32 %add
  %7 = load i32, i32* %arrayidx15, align 4, !tbaa !7
  call void @mult(%struct.int_64_t* sret %agg.tmp10, i32 %shl12, i32 %7)
  %8 = load i32, i32* %high16, align 4, !tbaa !1
  %9 = load i32, i32* %low17, align 4, !tbaa !6
  call void @sra(%struct.int_64_t* sret %agg.tmp9, i32 %8, i32 %9, i8 zeroext 17)
  %10 = load i32, i32* %high18, align 4, !tbaa !1
  %11 = load i32, i32* %low19, align 4, !tbaa !6
  %call20 = tail call i32 @cast_int32(i32 %10, i32 %11)
  %add21 = add nsw i32 %call20, %fp_sinpart.060
  %inc = add nuw nsw i32 %i.058, 1
  %exitcond = icmp eq i32 %inc, 24
  br i1 %exitcond, label %for.end, label %for.body3

for.end:                                          ; preds = %for.body3
  %shr = ashr i32 %add8, 12
  call void @mult(%struct.int_64_t* sret %agg.tmp23, i32 %shr, i32 %shr)
  %12 = load i32, i32* %high25, align 4, !tbaa !1
  %13 = load i32, i32* %low26, align 4, !tbaa !6
  call void @sra(%struct.int_64_t* sret %agg.tmp22, i32 %12, i32 %13, i8 zeroext 5)
  %14 = load i32, i32* %high27, align 4, !tbaa !1
  %15 = load i32, i32* %low28, align 4, !tbaa !6
  %call29 = tail call i32 @cast_int32(i32 %14, i32 %15)
  %shr32 = ashr i32 %add21, 12
  call void @mult(%struct.int_64_t* sret %agg.tmp31, i32 %shr32, i32 %shr32)
  %16 = load i32, i32* %high34, align 4, !tbaa !1
  %17 = load i32, i32* %low35, align 4, !tbaa !6
  call void @sra(%struct.int_64_t* sret %agg.tmp30, i32 %16, i32 %17, i8 zeroext 5)
  %18 = load i32, i32* %high36, align 4, !tbaa !1
  %19 = load i32, i32* %low37, align 4, !tbaa !6
  %call38 = tail call i32 @cast_int32(i32 %18, i32 %19)
  %add39 = add nsw i32 %call38, %call29
  %arrayidx41 = getelementptr inbounds [24 x i32], [24 x i32]* %powers, i32 %w.061, i32 0
  store i32 %add39, i32* %arrayidx41, align 4, !tbaa !7
  %inc43 = add nuw nsw i32 %w.061, 1
  %exitcond62 = icmp eq i32 %inc43, 4
  br i1 %exitcond62, label %for.end44, label %for.cond1.preheader

for.end44:                                        ; preds = %for.end
  ret void
}

; Function Attrs: nounwind
define i32 @main() #1 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %i.019 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  tail call void @sum_rot_block_row([24 x i32]* getelementptr inbounds ([4 x [24 x i32]], [4 x [24 x i32]]* @powers, i32 0, i32 0))
  %inc = add nuw nsw i32 %i.019, 1
  %exitcond = icmp eq i32 %inc, 200
  br i1 %exitcond, label %for.body3, label %for.body

for.cond1:                                        ; preds = %for.body3
  %cmp2 = icmp slt i32 %inc9, 4
  br i1 %cmp2, label %for.body3, label %for.end10

for.body3:                                        ; preds = %for.body, %for.cond1
  %i.118 = phi i32 [ %inc9, %for.cond1 ], [ 0, %for.body ]
  %arrayidx4 = getelementptr inbounds [4 x [24 x i32]], [4 x [24 x i32]]* @powers, i32 0, i32 %i.118, i32 0
  %0 = load i32, i32* %arrayidx4, align 4, !tbaa !7
  %arrayidx6 = getelementptr inbounds [4 x [24 x i32]], [4 x [24 x i32]]* @powers_temp, i32 0, i32 %i.118, i32 0
  %1 = load i32, i32* %arrayidx6, align 4, !tbaa !7
  %cmp7 = icmp eq i32 %0, %1
  %inc9 = add nuw nsw i32 %i.118, 1
  br i1 %cmp7, label %for.cond1, label %if.then

if.then:                                          ; preds = %for.body3
  %puts17 = tail call i32 @puts(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str2, i32 0, i32 0))
  br label %return

for.end10:                                        ; preds = %for.cond1
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str, i32 0, i32 0))
  br label %return

return:                                           ; preds = %for.end10, %if.then
  %retval.0 = phi i32 [ 666, %if.then ], [ -1, %for.end10 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

attributes #0 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
!1 = !{!2, !3, i64 0}
!2 = !{!"", !3, i64 0, !3, i64 4}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!2, !3, i64 4}
!7 = !{!3, !3, i64 0}
