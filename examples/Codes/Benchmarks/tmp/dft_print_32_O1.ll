; ModuleID = 'dft_print.c'
target datalayout = "E-m:e-p:32:32-i64:64-f128:64-n32-S64"
target triple = "sparc-unknown-linux-gnu"

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

; Function Attrs: nounwind readonly
define i32 @cast_uint32(%struct.int_64_t* byval nocapture readonly %x) #0 {
entry:
  %low = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 1
  %0 = load i32, i32* %low, align 4, !tbaa !1
  ret i32 %0
}

; Function Attrs: nounwind readonly
define i32 @cast_int32(%struct.int_64_t* byval nocapture readonly %x) #0 {
entry:
  %high = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 0
  %0 = load i32, i32* %high, align 4, !tbaa !6
  %tobool = icmp slt i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else3

if.then:                                          ; preds = %entry
  %cmp = icmp eq i32 %0, -1
  br i1 %cmp, label %if.then2, label %if.end10

if.then2:                                         ; preds = %if.then
  %low = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 1
  %1 = load i32, i32* %low, align 4, !tbaa !1
  br label %if.end10

if.else3:                                         ; preds = %entry
  %cmp5 = icmp eq i32 %0, 0
  br i1 %cmp5, label %if.then6, label %if.end10

if.then6:                                         ; preds = %if.else3
  %low7 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 1
  %2 = load i32, i32* %low7, align 4, !tbaa !1
  br label %if.end10

if.end10:                                         ; preds = %if.then6, %if.else3, %if.then2, %if.then
  %result.0 = phi i32 [ %1, %if.then2 ], [ 0, %if.then ], [ %2, %if.then6 ], [ 0, %if.else3 ]
  ret i32 %result.0
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
define void @add(%struct.int_64_t* noalias nocapture sret %agg.result, %struct.int_64_t* byval nocapture readonly %x, %struct.int_64_t* byval nocapture readonly %y) #1 {
entry:
  %low = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 1
  %0 = load i32, i32* %low, align 4, !tbaa !1
  %high = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 0
  %1 = load i32, i32* %high, align 4, !tbaa !6
  %low1 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %y, i32 0, i32 1
  %2 = load i32, i32* %low1, align 4, !tbaa !1
  %high2 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %y, i32 0, i32 0
  %3 = load i32, i32* %high2, align 4, !tbaa !6
  %add = add i32 %2, %0
  %cmp = icmp ult i32 %add, %0
  %cmp3 = icmp ult i32 %add, %2
  %or.cond = or i1 %cmp, %cmp3
  %z2.0 = zext i1 %or.cond to i32
  %add4 = add i32 %3, %1
  %add5 = add i32 %add4, %z2.0
  %sum.sroa.0.0..sroa_idx = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 0
  store i32 %add5, i32* %sum.sroa.0.0..sroa_idx, align 4
  %sum.sroa.2.0..sroa_idx8 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 1
  store i32 %add, i32* %sum.sroa.2.0..sroa_idx8, align 4
  ret void
}

; Function Attrs: nounwind
define void @neg(%struct.int_64_t* noalias nocapture sret %agg.result, %struct.int_64_t* byval nocapture %x) #1 {
entry:
  %agg.tmp = alloca %struct.int_64_t, align 4
  %low = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 1
  %0 = load i32, i32* %low, align 4, !tbaa !1
  %neg = xor i32 %0, -1
  store i32 %neg, i32* %low, align 4, !tbaa !1
  %high = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 0
  %1 = load i32, i32* %high, align 4, !tbaa !6
  %neg2 = xor i32 %1, -1
  store i32 %neg2, i32* %high, align 4, !tbaa !6
  call void @cast(%struct.int_64_t* sret %agg.tmp, i32 1)
  call void @add(%struct.int_64_t* sret %agg.result, %struct.int_64_t* byval %x, %struct.int_64_t* byval %agg.tmp)
  ret void
}

; Function Attrs: nounwind readnone
define i32 @abs(i32 %x) #2 {
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
define void @sll(%struct.int_64_t* noalias nocapture sret %agg.result, %struct.int_64_t* byval nocapture %value, i8 zeroext %pos) #1 {
entry:
  %conv = zext i8 %pos to i32
  %cmp = icmp ult i8 %pos, 32
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %high = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 0
  %0 = load i32, i32* %high, align 4, !tbaa !6
  %shl = shl i32 %0, %conv
  %low = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 1
  %1 = load i32, i32* %low, align 4, !tbaa !1
  %sub = sub nsw i32 32, %conv
  %shr = lshr i32 %1, %sub
  %or = or i32 %shr, %shl
  store i32 %or, i32* %high, align 4, !tbaa !6
  %2 = load i32, i32* %low, align 4, !tbaa !1
  %shl7 = shl i32 %2, %conv
  store i32 %shl7, i32* %low, align 4, !tbaa !1
  br label %if.end

if.else:                                          ; preds = %entry
  %low8 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 1
  %3 = load i32, i32* %low8, align 4, !tbaa !1
  %sub10 = add nsw i32 %conv, -32
  %shl11 = shl i32 %3, %sub10
  %high12 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 0
  store i32 %shl11, i32* %high12, align 4, !tbaa !6
  store i32 0, i32* %low8, align 4, !tbaa !1
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = bitcast %struct.int_64_t* %value to i64*
  %5 = bitcast %struct.int_64_t* %agg.result to i64*
  %6 = load i64, i64* %4, align 4
  store i64 %6, i64* %5, align 4
  ret void
}

; Function Attrs: nounwind
define void @sra(%struct.int_64_t* noalias nocapture sret %agg.result, %struct.int_64_t* byval nocapture %value, i8 zeroext %pos) #1 {
entry:
  %conv = zext i8 %pos to i32
  %cmp = icmp ult i8 %pos, 32
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %low = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 1
  %0 = load i32, i32* %low, align 4, !tbaa !1
  %shr = lshr i32 %0, %conv
  %high = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 0
  %1 = load i32, i32* %high, align 4, !tbaa !6
  %sub = sub nsw i32 32, %conv
  %shl = shl i32 %1, %sub
  %or = or i32 %shl, %shr
  store i32 %or, i32* %low, align 4, !tbaa !1
  %2 = load i32, i32* %high, align 4, !tbaa !6
  %shr7 = ashr i32 %2, %conv
  store i32 %shr7, i32* %high, align 4, !tbaa !6
  br label %if.end

if.else:                                          ; preds = %entry
  %high9 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 0
  %3 = load i32, i32* %high9, align 4, !tbaa !6
  %sub11 = add nsw i32 %conv, -32
  %shr12 = ashr i32 %3, %sub11
  %low13 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 1
  store i32 %shr12, i32* %low13, align 4, !tbaa !1
  store i32 -1, i32* %high9, align 4, !tbaa !6
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = bitcast %struct.int_64_t* %value to i64*
  %5 = bitcast %struct.int_64_t* %agg.result to i64*
  %6 = load i64, i64* %4, align 4
  store i64 %6, i64* %5, align 4
  ret void
}

; Function Attrs: nounwind
define void @umult(%struct.int_64_t* noalias nocapture sret %agg.result, i32 %a, i32 %b) #1 {
entry:
  %res = alloca i64, align 8
  %tmpcast = bitcast i64* %res to %struct.int_64_t*
  %agg.tmp = alloca %struct.int_64_t, align 4
  %agg.tmp6 = alloca %struct.int_64_t, align 4
  %tmp7 = alloca i64, align 8
  %tmpcast21 = bitcast i64* %tmp7 to %struct.int_64_t*
  %agg.tmp8 = alloca %struct.int_64_t, align 4
  %agg.tmp9 = alloca %struct.int_64_t, align 4
  %tmp10 = alloca i64, align 8
  %tmpcast22 = bitcast i64* %tmp10 to %struct.int_64_t*
  %agg.tmp11 = alloca %struct.int_64_t, align 4
  %agg.tmp12 = alloca %struct.int_64_t, align 4
  %tmp13 = alloca i64, align 8
  %tmpcast23 = bitcast i64* %tmp13 to %struct.int_64_t*
  %and = and i32 %a, 65535
  %shr = lshr i32 %a, 16
  %and1 = and i32 %b, 65535
  %shr2 = lshr i32 %b, 16
  %mul = mul nuw i32 %and1, %and
  %mul3 = mul nuw i32 %shr2, %and
  %mul4 = mul nuw i32 %and1, %shr
  %mul5 = mul nuw i32 %shr2, %shr
  %res24 = bitcast i64* %res to %struct.int_64_t*
  call void @ucast(%struct.int_64_t* sret %res24, i32 %mul)
  call void @ucast(%struct.int_64_t* sret %agg.tmp6, i32 %mul3)
  call void @sll(%struct.int_64_t* sret %agg.tmp, %struct.int_64_t* byval %agg.tmp6, i8 zeroext 16)
  call void @add(%struct.int_64_t* sret %tmpcast21, %struct.int_64_t* byval %tmpcast, %struct.int_64_t* byval %agg.tmp)
  %0 = load i64, i64* %tmp7, align 8
  store i64 %0, i64* %res, align 8
  call void @ucast(%struct.int_64_t* sret %agg.tmp9, i32 %mul4)
  call void @sll(%struct.int_64_t* sret %agg.tmp8, %struct.int_64_t* byval %agg.tmp9, i8 zeroext 16)
  call void @add(%struct.int_64_t* sret %tmpcast22, %struct.int_64_t* byval %tmpcast, %struct.int_64_t* byval %agg.tmp8)
  %1 = load i64, i64* %tmp10, align 8
  store i64 %1, i64* %res, align 8
  call void @ucast(%struct.int_64_t* sret %agg.tmp12, i32 %mul5)
  call void @sll(%struct.int_64_t* sret %agg.tmp11, %struct.int_64_t* byval %agg.tmp12, i8 zeroext 32)
  call void @add(%struct.int_64_t* sret %tmpcast23, %struct.int_64_t* byval %tmpcast, %struct.int_64_t* byval %agg.tmp11)
  %2 = load i64, i64* %tmp13, align 8
  %3 = bitcast %struct.int_64_t* %agg.result to i64*
  store i64 %2, i64* %3, align 4
  ret void
}

; Function Attrs: nounwind
define void @mult(%struct.int_64_t* noalias nocapture sret %agg.result, i32 %v1, i32 %v2) #1 {
entry:
  %product = alloca i64, align 8
  %tmp4 = alloca i64, align 8
  %v1.lobit7 = xor i32 %v2, %v1
  %ispos = icmp sgt i32 %v1, -1
  %neg = sub i32 0, %v1
  %0 = select i1 %ispos, i32 %v1, i32 %neg
  %ispos8 = icmp sgt i32 %v2, -1
  %neg9 = sub i32 0, %v2
  %1 = select i1 %ispos8, i32 %v2, i32 %neg9
  %product12 = bitcast i64* %product to %struct.int_64_t*
  call void @umult(%struct.int_64_t* sret %product12, i32 %0, i32 %1)
  %tobool = icmp slt i32 %v1.lobit7, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmpcast11 = bitcast i64* %tmp4 to %struct.int_64_t*
  %tmpcast = bitcast i64* %product to %struct.int_64_t*
  call void @neg(%struct.int_64_t* sret %tmpcast11, %struct.int_64_t* byval %tmpcast)
  %2 = load i64, i64* %tmp4, align 8
  store i64 %2, i64* %product, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = bitcast %struct.int_64_t* %agg.result to i64*
  %4 = load i64, i64* %product, align 8
  store i64 %4, i64* %3, align 4
  ret void
}

; Function Attrs: nounwind
define void @sum_rot_block_row([24 x i32]* nocapture %powers) #1 {
entry:
  %agg.tmp = alloca %struct.int_64_t, align 4
  %agg.tmp4 = alloca %struct.int_64_t, align 4
  %agg.tmp7 = alloca %struct.int_64_t, align 4
  %agg.tmp8 = alloca %struct.int_64_t, align 4
  %agg.tmp16 = alloca %struct.int_64_t, align 4
  %agg.tmp17 = alloca %struct.int_64_t, align 4
  %agg.tmp20 = alloca %struct.int_64_t, align 4
  %agg.tmp21 = alloca %struct.int_64_t, align 4
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end, %entry
  %w.047 = phi i32 [ 0, %entry ], [ %inc29, %for.end ]
  %mul = mul nuw nsw i32 %w.047, 24
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %fp_sinpart.046 = phi i32 [ 0, %for.cond1.preheader ], [ %add15, %for.body3 ]
  %fp_cospart.045 = phi i32 [ 0, %for.cond1.preheader ], [ %add6, %for.body3 ]
  %i.044 = phi i32 [ 0, %for.cond1.preheader ], [ %inc, %for.body3 ]
  %arrayidx = getelementptr inbounds [24 x i32], [24 x i32]* @rowsums, i32 0, i32 %i.044
  %0 = load i32, i32* %arrayidx, align 4, !tbaa !7
  %shl = shl i32 %0, 17
  %add = add nuw nsw i32 %i.044, %mul
  %arrayidx5 = getelementptr inbounds [96 x i32], [96 x i32]* @dft_waves_cos, i32 0, i32 %add
  %1 = load i32, i32* %arrayidx5, align 4, !tbaa !7
  call void @mult(%struct.int_64_t* sret %agg.tmp4, i32 %shl, i32 %1)
  call void @sra(%struct.int_64_t* sret %agg.tmp, %struct.int_64_t* byval %agg.tmp4, i8 zeroext 17)
  %call = call i32 @cast_int32(%struct.int_64_t* byval %agg.tmp)
  %add6 = add nsw i32 %call, %fp_cospart.045
  %2 = load i32, i32* %arrayidx, align 4, !tbaa !7
  %shl10 = shl i32 %2, 17
  %arrayidx13 = getelementptr inbounds [96 x i32], [96 x i32]* @dft_waves_sin, i32 0, i32 %add
  %3 = load i32, i32* %arrayidx13, align 4, !tbaa !7
  call void @mult(%struct.int_64_t* sret %agg.tmp8, i32 %shl10, i32 %3)
  call void @sra(%struct.int_64_t* sret %agg.tmp7, %struct.int_64_t* byval %agg.tmp8, i8 zeroext 17)
  %call14 = call i32 @cast_int32(%struct.int_64_t* byval %agg.tmp7)
  %add15 = add nsw i32 %call14, %fp_sinpart.046
  %inc = add nuw nsw i32 %i.044, 1
  %exitcond = icmp eq i32 %inc, 24
  br i1 %exitcond, label %for.end, label %for.body3

for.end:                                          ; preds = %for.body3
  %shr = ashr i32 %add6, 12
  call void @mult(%struct.int_64_t* sret %agg.tmp17, i32 %shr, i32 %shr)
  call void @sra(%struct.int_64_t* sret %agg.tmp16, %struct.int_64_t* byval %agg.tmp17, i8 zeroext 5)
  %call19 = call i32 @cast_int32(%struct.int_64_t* byval %agg.tmp16)
  %shr22 = ashr i32 %add15, 12
  call void @mult(%struct.int_64_t* sret %agg.tmp21, i32 %shr22, i32 %shr22)
  call void @sra(%struct.int_64_t* sret %agg.tmp20, %struct.int_64_t* byval %agg.tmp21, i8 zeroext 5)
  %call24 = call i32 @cast_int32(%struct.int_64_t* byval %agg.tmp20)
  %add25 = add nsw i32 %call24, %call19
  %arrayidx27 = getelementptr inbounds [24 x i32], [24 x i32]* %powers, i32 %w.047, i32 0
  store i32 %add25, i32* %arrayidx27, align 4, !tbaa !7
  %inc29 = add nuw nsw i32 %w.047, 1
  %exitcond48 = icmp eq i32 %inc29, 4
  br i1 %exitcond48, label %for.end30, label %for.cond1.preheader

for.end30:                                        ; preds = %for.end
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
declare i32 @puts(i8* nocapture readonly) #3

attributes #0 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+soft-float" "unsafe-fp-math"="false" "use-soft-float"="true" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+soft-float" "unsafe-fp-math"="false" "use-soft-float"="true" }
attributes #2 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+soft-float" "unsafe-fp-math"="false" "use-soft-float"="true" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
!1 = !{!2, !3, i64 4}
!2 = !{!"", !3, i64 0, !3, i64 4}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!2, !3, i64 0}
!7 = !{!3, !3, i64 0}
