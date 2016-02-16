; ModuleID = 'dft_print.c'
target datalayout = "E-m:e-p:32:32-i64:64-f128:64-n32-S64"
target triple = "sparc-unknown-linux-gnu"

%struct.int_64_t = type { i32, i32 }

@rowsums = global [24 x i32] [i32 759, i32 776, i32 787, i32 795, i32 797, i32 796, i32 801, i32 805, i32 800, i32 800, i32 799, i32 801, i32 799, i32 790, i32 781, i32 775, i32 772, i32 769, i32 768, i32 767, i32 762, i32 761, i32 755, i32 751], align 4
@powers = global [4 x [24 x i32]] zeroinitializer, align 4
@powers_temp = global [4 x [24 x i32]] [[24 x i32] [i32 2436991, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], [24 x i32] [i32 63546, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], [24 x i32] [i32 131381, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], [24 x i32] [i32 19272, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0]], align 4
@dft_waves_cos = global [96 x i32] [i32 131072, i32 126606, i32 113512, i32 92683, i32 65537, i32 33926, i32 3, i32 -33921, i32 -65532, i32 -92679, i32 -113509, i32 -126605, i32 -131072, i32 -126608, i32 -113516, i32 -92689, i32 -65544, i32 -33934, i32 -11, i32 33913, i32 65526, i32 92673, i32 113505, i32 126602, i32 131072, i32 113512, i32 65537, i32 3, i32 -65532, i32 -113509, i32 -131072, i32 -113516, i32 -65544, i32 -11, i32 65526, i32 113505, i32 131072, i32 113518, i32 65549, i32 16, i32 -65521, i32 -113503, i32 -131072, i32 -113523, i32 -65556, i32 -24, i32 65514, i32 113499, i32 131072, i32 92683, i32 3, i32 -92679, i32 -131072, i32 -92689, i32 -11, i32 92673, i32 131072, i32 92692, i32 16, i32 -92669, i32 -131072, i32 -92698, i32 -24, i32 92664, i32 131071, i32 92701, i32 29, i32 -92660, i32 -131072, i32 -92707, i32 -37, i32 92654, i32 131072, i32 65537, i32 -65532, i32 -131072, i32 -65544, i32 65526, i32 131072, i32 65549, i32 -65521, i32 -131072, i32 -65556, i32 65514, i32 131071, i32 65560, i32 -65510, i32 -131072, i32 -65567, i32 65503, i32 131071, i32 65571, i32 -65499, i32 -131072, i32 -65578, i32 65492], align 4
@dft_waves_sin = global [96 x i32] [i32 0, i32 33923, i32 65535, i32 92680, i32 113510, i32 126605, i32 131071, i32 126606, i32 113514, i32 92685, i32 65540, i32 33929, i32 6, i32 -33917, i32 -65530, i32 -92676, i32 -113508, i32 -126604, i32 -131072, i32 -126609, i32 -113518, i32 -92691, i32 -65547, i32 -33937, i32 0, i32 65535, i32 113510, i32 131071, i32 113514, i32 65540, i32 6, i32 -65530, i32 -113508, i32 -131072, i32 -113518, i32 -65547, i32 -14, i32 65523, i32 113504, i32 131071, i32 113520, i32 65552, i32 19, i32 -65518, i32 -113501, i32 -131072, i32 -113524, i32 -65558, i32 0, i32 92680, i32 131071, i32 92685, i32 6, i32 -92676, i32 -131072, i32 -92691, i32 -14, i32 92671, i32 131071, i32 92694, i32 19, i32 -92667, i32 -131072, i32 -92700, i32 -27, i32 92662, i32 131071, i32 92704, i32 32, i32 -92658, i32 -131072, i32 -92709, i32 0, i32 113510, i32 113514, i32 6, i32 -113508, i32 -113518, i32 -14, i32 113504, i32 113520, i32 19, i32 -113501, i32 -113524, i32 -27, i32 113497, i32 113527, i32 32, i32 -113495, i32 -113531, i32 -40, i32 113491, i32 113533, i32 45, i32 -113488, i32 -113537], align 4
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
  %low = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 1
  %0 = load i32, i32* %low, align 4, !tbaa !1
  %neg = xor i32 %0, -1
  store i32 %neg, i32* %low, align 4, !tbaa !1
  %high = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 0
  %1 = load i32, i32* %high, align 4, !tbaa !6
  %neg2 = xor i32 %1, -1
  %add.i = sub i32 0, %0
  %2 = icmp eq i32 %0, 0
  %z2.0.i = zext i1 %2 to i32
  %add5.i = add i32 %z2.0.i, %neg2
  %sum.sroa.0.0..sroa_idx.i = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 0
  store i32 %add5.i, i32* %sum.sroa.0.0..sroa_idx.i, align 4, !alias.scope !7
  %sum.sroa.2.0..sroa_idx8.i = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 1
  store i32 %add.i, i32* %sum.sroa.2.0..sroa_idx8.i, align 4, !alias.scope !7
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
  %shl7 = shl i32 %1, %conv
  store i32 %shl7, i32* %low, align 4, !tbaa !1
  br label %if.end

if.else:                                          ; preds = %entry
  %low8 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 1
  %2 = load i32, i32* %low8, align 4, !tbaa !1
  %sub10 = add nsw i32 %conv, -32
  %shl11 = shl i32 %2, %sub10
  %high12 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 0
  store i32 %shl11, i32* %high12, align 4, !tbaa !6
  store i32 0, i32* %low8, align 4, !tbaa !1
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = bitcast %struct.int_64_t* %value to i64*
  %4 = bitcast %struct.int_64_t* %agg.result to i64*
  %5 = load i64, i64* %3, align 4
  store i64 %5, i64* %4, align 4
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
  %shr7 = ashr i32 %1, %conv
  store i32 %shr7, i32* %high, align 4, !tbaa !6
  br label %if.end

if.else:                                          ; preds = %entry
  %high9 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 0
  %2 = load i32, i32* %high9, align 4, !tbaa !6
  %sub11 = add nsw i32 %conv, -32
  %shr12 = ashr i32 %2, %sub11
  %low13 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 1
  store i32 %shr12, i32* %low13, align 4, !tbaa !1
  store i32 -1, i32* %high9, align 4, !tbaa !6
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = bitcast %struct.int_64_t* %value to i64*
  %4 = bitcast %struct.int_64_t* %agg.result to i64*
  %5 = load i64, i64* %3, align 4
  store i64 %5, i64* %4, align 4
  ret void
}

; Function Attrs: nounwind
define void @umult(%struct.int_64_t* noalias nocapture sret %agg.result, i32 %a, i32 %b) #1 {
entry:
  %and = and i32 %a, 65535
  %shr = lshr i32 %a, 16
  %and1 = and i32 %b, 65535
  %shr2 = lshr i32 %b, 16
  %mul = mul nuw i32 %and1, %and
  %mul3 = mul nuw i32 %shr2, %and
  %mul4 = mul nuw i32 %and1, %shr
  %mul5 = mul nuw i32 %shr2, %shr
  %shr.i68 = lshr i32 %mul3, 16
  %shl7.i70 = shl i32 %mul3, 16
  %add.i55 = add i32 %shl7.i70, %mul
  %cmp.i56 = icmp ult i32 %add.i55, %mul
  %cmp3.i57 = icmp ult i32 %add.i55, %shl7.i70
  %or.cond.i58 = or i1 %cmp.i56, %cmp3.i57
  %z2.0.i59 = zext i1 %or.cond.i58 to i32
  %shr.i = lshr i32 %mul4, 16
  %shl7.i = shl i32 %mul4, 16
  %add.i35 = add i32 %add.i55, %shl7.i
  %cmp.i36 = icmp ult i32 %add.i35, %add.i55
  %cmp3.i37 = icmp ult i32 %add.i35, %shl7.i
  %or.cond.i38 = or i1 %cmp.i36, %cmp3.i37
  %z2.0.i39 = zext i1 %or.cond.i38 to i32
  %add5.i61 = add i32 %shr.i68, %mul5
  %add4.i40 = add i32 %add5.i61, %shr.i
  %add5.i41 = add i32 %add4.i40, %z2.0.i59
  %add5.i = add i32 %add5.i41, %z2.0.i39
  %tmp13.sroa.2.0.insert.ext = zext i32 %add.i35 to i64
  %tmp13.sroa.0.0.insert.ext = zext i32 %add5.i to i64
  %tmp13.sroa.0.0.insert.shift = shl nuw i64 %tmp13.sroa.0.0.insert.ext, 32
  %tmp13.sroa.0.0.insert.insert = or i64 %tmp13.sroa.0.0.insert.shift, %tmp13.sroa.2.0.insert.ext
  %0 = bitcast %struct.int_64_t* %agg.result to i64*
  store i64 %tmp13.sroa.0.0.insert.insert, i64* %0, align 4
  ret void
}

; Function Attrs: nounwind
define void @mult(%struct.int_64_t* noalias nocapture sret %agg.result, i32 %v1, i32 %v2) #1 {
entry:
  %v1.lobit7 = xor i32 %v2, %v1
  %ispos = icmp sgt i32 %v1, -1
  %neg = sub i32 0, %v1
  %0 = select i1 %ispos, i32 %v1, i32 %neg
  %ispos8 = icmp sgt i32 %v2, -1
  %neg9 = sub i32 0, %v2
  %1 = select i1 %ispos8, i32 %v2, i32 %neg9
  %and.i = and i32 %0, 65535
  %shr.i = lshr i32 %0, 16
  %and1.i = and i32 %1, 65535
  %shr2.i = lshr i32 %1, 16
  %mul.i = mul nuw i32 %and1.i, %and.i
  %mul3.i = mul nuw i32 %shr2.i, %and.i
  %mul4.i = mul nuw i32 %and1.i, %shr.i
  %mul5.i = mul nuw i32 %shr2.i, %shr.i
  %shr.i68.i = lshr i32 %mul3.i, 16
  %shl7.i70.i = shl i32 %mul3.i, 16
  %add.i55.i = add i32 %shl7.i70.i, %mul.i
  %cmp.i56.i = icmp ult i32 %add.i55.i, %mul.i
  %cmp3.i57.i = icmp ult i32 %add.i55.i, %shl7.i70.i
  %or.cond.i58.i = or i1 %cmp.i56.i, %cmp3.i57.i
  %z2.0.i59.i = zext i1 %or.cond.i58.i to i32
  %shr.i.i = lshr i32 %mul4.i, 16
  %shl7.i.i = shl i32 %mul4.i, 16
  %add.i35.i = add i32 %add.i55.i, %shl7.i.i
  %cmp.i36.i = icmp ult i32 %add.i35.i, %add.i55.i
  %cmp3.i37.i = icmp ult i32 %add.i35.i, %shl7.i.i
  %or.cond.i38.i = or i1 %cmp.i36.i, %cmp3.i37.i
  %z2.0.i39.i = zext i1 %or.cond.i38.i to i32
  %add5.i61.i = add i32 %shr.i68.i, %mul5.i
  %add4.i40.i = add i32 %add5.i61.i, %shr.i.i
  %add5.i41.i = add i32 %add4.i40.i, %z2.0.i59.i
  %add5.i.i = add i32 %add5.i41.i, %z2.0.i39.i
  %tmp13.sroa.2.0.insert.ext.i = zext i32 %add.i35.i to i64
  %tmp13.sroa.0.0.insert.ext.i = zext i32 %add5.i.i to i64
  %tmp13.sroa.0.0.insert.shift.i = shl nuw i64 %tmp13.sroa.0.0.insert.ext.i, 32
  %tmp13.sroa.0.0.insert.insert.i = or i64 %tmp13.sroa.0.0.insert.shift.i, %tmp13.sroa.2.0.insert.ext.i
  %tobool = icmp slt i32 %v1.lobit7, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %neg2.i = xor i32 %add5.i.i, -1
  %add.i.i = sub i32 0, %add.i35.i
  %2 = icmp eq i32 %add.i35.i, 0
  %z2.0.i.i = zext i1 %2 to i32
  %add5.i.i13 = add i32 %z2.0.i.i, %neg2.i
  %tmp4.sroa.2.0.insert.ext = zext i32 %add.i.i to i64
  %tmp4.sroa.0.0.insert.ext = zext i32 %add5.i.i13 to i64
  %tmp4.sroa.0.0.insert.shift = shl nuw i64 %tmp4.sroa.0.0.insert.ext, 32
  %tmp4.sroa.0.0.insert.insert = or i64 %tmp4.sroa.0.0.insert.shift, %tmp4.sroa.2.0.insert.ext
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %product.0.copyload16 = phi i64 [ %tmp4.sroa.0.0.insert.insert, %if.then ], [ %tmp13.sroa.0.0.insert.insert.i, %entry ]
  %3 = bitcast %struct.int_64_t* %agg.result to i64*
  store i64 %product.0.copyload16, i64* %3, align 4
  ret void
}

; Function Attrs: nounwind
define void @sum_rot_block_row([24 x i32]* nocapture %powers) #1 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end, %entry
  %w.0259 = phi i32 [ 0, %entry ], [ %inc29, %for.end ]
  %mul = mul nuw nsw i32 %w.0259, 24
  br label %for.body3

for.body3:                                        ; preds = %mult.exit206, %for.cond1.preheader
  %fp_sinpart.0258 = phi i32 [ 0, %for.cond1.preheader ], [ %add15, %mult.exit206 ]
  %fp_cospart.0257 = phi i32 [ 0, %for.cond1.preheader ], [ %add6, %mult.exit206 ]
  %i.0256 = phi i32 [ 0, %for.cond1.preheader ], [ %inc, %mult.exit206 ]
  %arrayidx = getelementptr inbounds [24 x i32], [24 x i32]* @rowsums, i32 0, i32 %i.0256
  %0 = load i32, i32* %arrayidx, align 4, !tbaa !10
  %shl = shl i32 %0, 17
  %add = add nuw nsw i32 %i.0256, %mul
  %arrayidx5 = getelementptr inbounds [96 x i32], [96 x i32]* @dft_waves_cos, i32 0, i32 %add
  %1 = load i32, i32* %arrayidx5, align 4, !tbaa !10
  %v1.lobit7.i = xor i32 %1, %shl
  %ispos.i = icmp sgt i32 %shl, -1
  %neg.i = sub i32 0, %shl
  %2 = select i1 %ispos.i, i32 %shl, i32 %neg.i
  %ispos8.i = icmp sgt i32 %1, -1
  %neg9.i = sub i32 0, %1
  %3 = select i1 %ispos8.i, i32 %1, i32 %neg9.i
  %shr.i.i = lshr exact i32 %2, 16
  %and1.i.i = and i32 %3, 65535
  %shr2.i.i = lshr i32 %3, 16
  %mul4.i.i = mul nuw i32 %and1.i.i, %shr.i.i
  %mul5.i.i = mul nuw i32 %shr2.i.i, %shr.i.i
  %shr.i.i.i = lshr i32 %mul4.i.i, 16
  %shl7.i.i.i = shl i32 %mul4.i.i, 16
  %add5.i.i.i = add i32 %shr.i.i.i, %mul5.i.i
  %tobool.i = icmp slt i32 %v1.lobit7.i, 0
  br i1 %tobool.i, label %if.then.i, label %mult.exit

if.then.i:                                        ; preds = %for.body3
  %neg2.i.i = xor i32 %add5.i.i.i, -1
  %add.i.i.i = sub i32 0, %shl7.i.i.i
  %4 = icmp eq i32 %shl7.i.i.i, 0
  %z2.0.i.i.i = zext i1 %4 to i32
  %add5.i.i13.i = add i32 %z2.0.i.i.i, %neg2.i.i
  br label %mult.exit

mult.exit:                                        ; preds = %for.body3, %if.then.i
  %product.0.copyload16.i.off0 = phi i32 [ %add.i.i.i, %if.then.i ], [ %shl7.i.i.i, %for.body3 ]
  %product.0.copyload16.i.off32 = phi i32 [ %add5.i.i13.i, %if.then.i ], [ %add5.i.i.i, %for.body3 ]
  %shr.i221 = lshr i32 %product.0.copyload16.i.off0, 17
  %shl.i223 = shl i32 %product.0.copyload16.i.off32, 15
  %or.i224 = or i32 %shl.i223, %shr.i221
  %shr7.i225 = ashr i32 %product.0.copyload16.i.off32, 17
  %tobool.i208 = icmp slt i32 %shr7.i225, 0
  %cmp5.i213 = icmp eq i32 %shr7.i225, 0
  %cmp.i209 = icmp eq i32 %shr7.i225, -1
  %cmp5.i213.sink = select i1 %tobool.i208, i1 %cmp.i209, i1 %cmp5.i213
  %agg.tmp.sroa.2.0.extract.trunc.243 = select i1 %cmp5.i213.sink, i32 %or.i224, i32 0
  %add6 = add nsw i32 %agg.tmp.sroa.2.0.extract.trunc.243, %fp_cospart.0257
  %arrayidx13 = getelementptr inbounds [96 x i32], [96 x i32]* @dft_waves_sin, i32 0, i32 %add
  %5 = load i32, i32* %arrayidx13, align 4, !tbaa !10
  %v1.lobit7.i160 = xor i32 %5, %shl
  %ispos8.i163 = icmp sgt i32 %5, -1
  %neg9.i164 = sub i32 0, %5
  %6 = select i1 %ispos8.i163, i32 %5, i32 %neg9.i164
  %and1.i.i167 = and i32 %6, 65535
  %shr2.i.i168 = lshr i32 %6, 16
  %mul4.i.i171 = mul nuw i32 %and1.i.i167, %shr.i.i
  %mul5.i.i172 = mul nuw i32 %shr2.i.i168, %shr.i.i
  %shr.i.i.i180 = lshr i32 %mul4.i.i171, 16
  %shl7.i.i.i181 = shl i32 %mul4.i.i171, 16
  %add5.i.i.i190 = add i32 %shr.i.i.i180, %mul5.i.i172
  %tobool.i195 = icmp slt i32 %v1.lobit7.i160, 0
  br i1 %tobool.i195, label %if.then.i204, label %mult.exit206

if.then.i204:                                     ; preds = %mult.exit
  %neg2.i.i196 = xor i32 %add5.i.i.i190, -1
  %add.i.i.i197 = sub i32 0, %shl7.i.i.i181
  %7 = icmp eq i32 %shl7.i.i.i181, 0
  %z2.0.i.i.i198 = zext i1 %7 to i32
  %add5.i.i13.i199 = add i32 %z2.0.i.i.i198, %neg2.i.i196
  br label %mult.exit206

mult.exit206:                                     ; preds = %mult.exit, %if.then.i204
  %product.0.copyload16.i205.off0 = phi i32 [ %add.i.i.i197, %if.then.i204 ], [ %shl7.i.i.i181, %mult.exit ]
  %product.0.copyload16.i205.off32 = phi i32 [ %add5.i.i13.i199, %if.then.i204 ], [ %add5.i.i.i190, %mult.exit ]
  %shr.i154 = lshr i32 %product.0.copyload16.i205.off0, 17
  %shl.i156 = shl i32 %product.0.copyload16.i205.off32, 15
  %or.i157 = or i32 %shl.i156, %shr.i154
  %shr7.i158 = ashr i32 %product.0.copyload16.i205.off32, 17
  %tobool.i141 = icmp slt i32 %shr7.i158, 0
  %cmp5.i146 = icmp eq i32 %shr7.i158, 0
  %cmp.i142 = icmp eq i32 %shr7.i158, -1
  %cmp5.i146.sink = select i1 %tobool.i141, i1 %cmp.i142, i1 %cmp5.i146
  %agg.tmp7.sroa.2.0.extract.trunc.244 = select i1 %cmp5.i146.sink, i32 %or.i157, i32 0
  %add15 = add nsw i32 %agg.tmp7.sroa.2.0.extract.trunc.244, %fp_sinpart.0258
  %inc = add nuw nsw i32 %i.0256, 1
  %exitcond = icmp eq i32 %inc, 24
  br i1 %exitcond, label %for.end, label %for.body3

for.end:                                          ; preds = %mult.exit206
  %add15.lcssa = phi i32 [ %add15, %mult.exit206 ]
  %add6.lcssa = phi i32 [ %add6, %mult.exit206 ]
  %shr = ashr i32 %add6.lcssa, 12
  %ispos.i105 = icmp sgt i32 %shr, -1
  %neg.i106 = sub nsw i32 0, %shr
  %8 = select i1 %ispos.i105, i32 %shr, i32 %neg.i106
  %and.i.i109 = and i32 %8, 65535
  %shr.i.i110 = lshr i32 %8, 16
  %mul.i.i113 = mul nuw i32 %and.i.i109, %and.i.i109
  %mul3.i.i114 = mul nuw i32 %shr.i.i110, %and.i.i109
  %mul5.i.i116 = mul nuw i32 %shr.i.i110, %shr.i.i110
  %shr.i68.i.i117 = lshr i32 %mul3.i.i114, 16
  %shl7.i70.i.i118 = shl i32 %mul3.i.i114, 16
  %add.i55.i.i119 = add i32 %shl7.i70.i.i118, %mul.i.i113
  %cmp.i56.i.i120 = icmp ult i32 %add.i55.i.i119, %mul.i.i113
  %cmp3.i57.i.i121 = icmp ult i32 %add.i55.i.i119, %shl7.i70.i.i118
  %or.cond.i58.i.i122 = or i1 %cmp.i56.i.i120, %cmp3.i57.i.i121
  %z2.0.i59.i.i123 = zext i1 %or.cond.i58.i.i122 to i32
  %add.i35.i.i126 = add i32 %add.i55.i.i119, %shl7.i70.i.i118
  %cmp.i36.i.i127 = icmp ult i32 %add.i35.i.i126, %add.i55.i.i119
  %cmp3.i37.i.i128 = icmp ult i32 %add.i35.i.i126, %shl7.i70.i.i118
  %or.cond.i38.i.i129 = or i1 %cmp.i36.i.i127, %cmp3.i37.i.i128
  %z2.0.i39.i.i130 = zext i1 %or.cond.i38.i.i129 to i32
  %factor = shl nuw nsw i32 %shr.i68.i.i117, 1
  %add4.i40.i.i132 = add i32 %z2.0.i59.i.i123, %mul5.i.i116
  %add5.i41.i.i133 = add i32 %add4.i40.i.i132, %z2.0.i39.i.i130
  %add5.i.i.i134 = add i32 %add5.i41.i.i133, %factor
  %shr.i99 = lshr i32 %add.i35.i.i126, 5
  %shl.i101 = shl i32 %add5.i.i.i134, 27
  %or.i102 = or i32 %shl.i101, %shr.i99
  %shr7.i103 = ashr i32 %add5.i.i.i134, 5
  %tobool.i86 = icmp slt i32 %shr7.i103, 0
  %cmp5.i91 = icmp eq i32 %shr7.i103, 0
  %cmp.i87 = icmp eq i32 %shr7.i103, -1
  %cmp5.i91.sink = select i1 %tobool.i86, i1 %cmp.i87, i1 %cmp5.i91
  %agg.tmp16.sroa.2.0.extract.trunc.245 = select i1 %cmp5.i91.sink, i32 %or.i102, i32 0
  %shr22 = ashr i32 %add15.lcssa, 12
  %ispos.i50 = icmp sgt i32 %shr22, -1
  %neg.i51 = sub nsw i32 0, %shr22
  %9 = select i1 %ispos.i50, i32 %shr22, i32 %neg.i51
  %and.i.i54 = and i32 %9, 65535
  %shr.i.i55 = lshr i32 %9, 16
  %mul.i.i58 = mul nuw i32 %and.i.i54, %and.i.i54
  %mul3.i.i59 = mul nuw i32 %shr.i.i55, %and.i.i54
  %mul5.i.i61 = mul nuw i32 %shr.i.i55, %shr.i.i55
  %shr.i68.i.i62 = lshr i32 %mul3.i.i59, 16
  %shl7.i70.i.i63 = shl i32 %mul3.i.i59, 16
  %add.i55.i.i64 = add i32 %shl7.i70.i.i63, %mul.i.i58
  %cmp.i56.i.i65 = icmp ult i32 %add.i55.i.i64, %mul.i.i58
  %cmp3.i57.i.i66 = icmp ult i32 %add.i55.i.i64, %shl7.i70.i.i63
  %or.cond.i58.i.i67 = or i1 %cmp.i56.i.i65, %cmp3.i57.i.i66
  %z2.0.i59.i.i68 = zext i1 %or.cond.i58.i.i67 to i32
  %add.i35.i.i71 = add i32 %add.i55.i.i64, %shl7.i70.i.i63
  %cmp.i36.i.i72 = icmp ult i32 %add.i35.i.i71, %add.i55.i.i64
  %cmp3.i37.i.i73 = icmp ult i32 %add.i35.i.i71, %shl7.i70.i.i63
  %or.cond.i38.i.i74 = or i1 %cmp.i36.i.i72, %cmp3.i37.i.i73
  %z2.0.i39.i.i75 = zext i1 %or.cond.i38.i.i74 to i32
  %factor255 = shl nuw nsw i32 %shr.i68.i.i62, 1
  %add4.i40.i.i77 = add i32 %z2.0.i59.i.i68, %mul5.i.i61
  %add5.i41.i.i78 = add i32 %add4.i40.i.i77, %z2.0.i39.i.i75
  %add5.i.i.i79 = add i32 %add5.i41.i.i78, %factor255
  %shr.i = lshr i32 %add.i35.i.i71, 5
  %shl.i = shl i32 %add5.i.i.i79, 27
  %or.i = or i32 %shl.i, %shr.i
  %shr7.i = ashr i32 %add5.i.i.i79, 5
  %tobool.i44 = icmp slt i32 %shr7.i, 0
  %cmp5.i = icmp eq i32 %shr7.i, 0
  %cmp.i = icmp eq i32 %shr7.i, -1
  %cmp5.i.sink = select i1 %tobool.i44, i1 %cmp.i, i1 %cmp5.i
  %agg.tmp20.sroa.2.0.extract.trunc.246 = select i1 %cmp5.i.sink, i32 %or.i, i32 0
  %add25 = add nsw i32 %agg.tmp20.sroa.2.0.extract.trunc.246, %agg.tmp16.sroa.2.0.extract.trunc.245
  %arrayidx27 = getelementptr inbounds [24 x i32], [24 x i32]* %powers, i32 %w.0259, i32 0
  store i32 %add25, i32* %arrayidx27, align 4, !tbaa !10
  %inc29 = add nuw nsw i32 %w.0259, 1
  %exitcond260 = icmp eq i32 %inc29, 4
  br i1 %exitcond260, label %for.end30, label %for.cond1.preheader

for.end30:                                        ; preds = %for.end
  ret void
}

; Function Attrs: nounwind
define i32 @main() #1 {
entry:
  br label %for.body

for.cond1.preheader:                              ; preds = %for.body
  %0 = load i32, i32* getelementptr inbounds ([4 x [24 x i32]], [4 x [24 x i32]]* @powers, i32 0, i32 0, i32 0), align 4, !tbaa !10
  %1 = load i32, i32* getelementptr inbounds ([4 x [24 x i32]], [4 x [24 x i32]]* @powers_temp, i32 0, i32 0, i32 0), align 4, !tbaa !10
  %cmp7 = icmp eq i32 %0, %1
  br i1 %cmp7, label %for.cond1, label %if.then

for.body:                                         ; preds = %for.body, %entry
  %i.019 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  tail call void @sum_rot_block_row([24 x i32]* getelementptr inbounds ([4 x [24 x i32]], [4 x [24 x i32]]* @powers, i32 0, i32 0))
  %inc = add nuw nsw i32 %i.019, 1
  %exitcond = icmp eq i32 %inc, 200
  br i1 %exitcond, label %for.cond1.preheader, label %for.body

for.cond1:                                        ; preds = %for.cond1.preheader
  %2 = load i32, i32* getelementptr inbounds ([4 x [24 x i32]], [4 x [24 x i32]]* @powers, i32 0, i32 1, i32 0), align 4, !tbaa !10
  %3 = load i32, i32* getelementptr inbounds ([4 x [24 x i32]], [4 x [24 x i32]]* @powers_temp, i32 0, i32 1, i32 0), align 4, !tbaa !10
  %cmp7.1 = icmp eq i32 %2, %3
  br i1 %cmp7.1, label %for.cond1.1, label %if.then

if.then:                                          ; preds = %for.cond1.2, %for.cond1.1, %for.cond1, %for.cond1.preheader
  %puts17 = tail call i32 @puts(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str2, i32 0, i32 0))
  br label %return

return:                                           ; preds = %for.cond1.3, %if.then
  %retval.0 = phi i32 [ 666, %if.then ], [ -1, %for.cond1.3 ]
  ret i32 %retval.0

for.cond1.1:                                      ; preds = %for.cond1
  %4 = load i32, i32* getelementptr inbounds ([4 x [24 x i32]], [4 x [24 x i32]]* @powers, i32 0, i32 2, i32 0), align 4, !tbaa !10
  %5 = load i32, i32* getelementptr inbounds ([4 x [24 x i32]], [4 x [24 x i32]]* @powers_temp, i32 0, i32 2, i32 0), align 4, !tbaa !10
  %cmp7.2 = icmp eq i32 %4, %5
  br i1 %cmp7.2, label %for.cond1.2, label %if.then

for.cond1.2:                                      ; preds = %for.cond1.1
  %6 = load i32, i32* getelementptr inbounds ([4 x [24 x i32]], [4 x [24 x i32]]* @powers, i32 0, i32 3, i32 0), align 4, !tbaa !10
  %7 = load i32, i32* getelementptr inbounds ([4 x [24 x i32]], [4 x [24 x i32]]* @powers_temp, i32 0, i32 3, i32 0), align 4, !tbaa !10
  %cmp7.3 = icmp eq i32 %6, %7
  br i1 %cmp7.3, label %for.cond1.3, label %if.then

for.cond1.3:                                      ; preds = %for.cond1.2
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str, i32 0, i32 0))
  br label %return
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
!7 = !{!8}
!8 = distinct !{!8, !9, !"add: %agg.result"}
!9 = distinct !{!9, !"add"}
!10 = !{!3, !3, i64 0}
