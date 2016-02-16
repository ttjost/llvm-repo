; ModuleID = 'dft_print.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

%struct.int_64_t = type { i32, i32 }

@rowsums = global [24 x i32] [i32 759, i32 776, i32 787, i32 795, i32 797, i32 796, i32 801, i32 805, i32 800, i32 800, i32 799, i32 801, i32 799, i32 790, i32 781, i32 775, i32 772, i32 769, i32 768, i32 767, i32 762, i32 761, i32 755, i32 751], align 4
@powers = global [4 x [24 x i32]] zeroinitializer, align 4
@powers_temp = global [4 x [24 x i32]] [[24 x i32] [i32 2436991, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], [24 x i32] [i32 63546, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], [24 x i32] [i32 131381, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], [24 x i32] [i32 19272, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0]], align 4
@dft_waves_cos = global [96 x i32] [i32 131072, i32 126606, i32 113512, i32 92683, i32 65537, i32 33926, i32 3, i32 -33921, i32 -65532, i32 -92679, i32 -113509, i32 -126605, i32 -131072, i32 -126608, i32 -113516, i32 -92689, i32 -65544, i32 -33934, i32 -11, i32 33913, i32 65526, i32 92673, i32 113505, i32 126602, i32 131072, i32 113512, i32 65537, i32 3, i32 -65532, i32 -113509, i32 -131072, i32 -113516, i32 -65544, i32 -11, i32 65526, i32 113505, i32 131072, i32 113518, i32 65549, i32 16, i32 -65521, i32 -113503, i32 -131072, i32 -113523, i32 -65556, i32 -24, i32 65514, i32 113499, i32 131072, i32 92683, i32 3, i32 -92679, i32 -131072, i32 -92689, i32 -11, i32 92673, i32 131072, i32 92692, i32 16, i32 -92669, i32 -131072, i32 -92698, i32 -24, i32 92664, i32 131071, i32 92701, i32 29, i32 -92660, i32 -131072, i32 -92707, i32 -37, i32 92654, i32 131072, i32 65537, i32 -65532, i32 -131072, i32 -65544, i32 65526, i32 131072, i32 65549, i32 -65521, i32 -131072, i32 -65556, i32 65514, i32 131071, i32 65560, i32 -65510, i32 -131072, i32 -65567, i32 65503, i32 131071, i32 65571, i32 -65499, i32 -131072, i32 -65578, i32 65492], align 4
@dft_waves_sin = global [96 x i32] [i32 0, i32 33923, i32 65535, i32 92680, i32 113510, i32 126605, i32 131071, i32 126606, i32 113514, i32 92685, i32 65540, i32 33929, i32 6, i32 -33917, i32 -65530, i32 -92676, i32 -113508, i32 -126604, i32 -131072, i32 -126609, i32 -113518, i32 -92691, i32 -65547, i32 -33937, i32 0, i32 65535, i32 113510, i32 131071, i32 113514, i32 65540, i32 6, i32 -65530, i32 -113508, i32 -131072, i32 -113518, i32 -65547, i32 -14, i32 65523, i32 113504, i32 131071, i32 113520, i32 65552, i32 19, i32 -65518, i32 -113501, i32 -131072, i32 -113524, i32 -65558, i32 0, i32 92680, i32 131071, i32 92685, i32 6, i32 -92676, i32 -131072, i32 -92691, i32 -14, i32 92671, i32 131071, i32 92694, i32 19, i32 -92667, i32 -131072, i32 -92700, i32 -27, i32 92662, i32 131071, i32 92704, i32 32, i32 -92658, i32 -131072, i32 -92709, i32 0, i32 113510, i32 113514, i32 6, i32 -113508, i32 -113518, i32 -14, i32 113504, i32 113520, i32 19, i32 -113501, i32 -113524, i32 -27, i32 113497, i32 113527, i32 32, i32 -113495, i32 -113531, i32 -40, i32 113491, i32 113533, i32 45, i32 -113488, i32 -113537], align 4
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
  %neg = xor i32 %x.1, -1
  %neg4 = xor i32 %x.0, -1
  %add.i = sub i32 0, %x.1
  %cmp.i = icmp ult i32 %add.i, %neg
  %cmp8.i = icmp eq i32 %x.1, 0
  %or.cond.i = or i1 %cmp.i, %cmp8.i
  %z2.0.i = zext i1 %or.cond.i to i32
  %add10.i = add i32 %z2.0.i, %neg4
  %sum.sroa.0.0..sroa_idx.i = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 0
  store i32 %add10.i, i32* %sum.sroa.0.0..sroa_idx.i, align 4, !alias.scope !1
  %sum.sroa.2.0..sroa_idx13.i = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 1
  store i32 %add.i, i32* %sum.sroa.2.0..sroa_idx13.i, align 4, !alias.scope !1
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
  %and = and i32 %a, 65535
  %shr = lshr i32 %a, 16
  %and1 = and i32 %b, 65535
  %shr2 = lshr i32 %b, 16
  %mul = mul nuw i32 %and1, %and
  %mul3 = mul nuw i32 %shr2, %and
  %mul4 = mul nuw i32 %and1, %shr
  %mul5 = mul nuw i32 %shr2, %shr
  %shr.i82 = lshr i32 %mul3, 16
  %shl9.i84 = shl i32 %mul3, 16
  %add.i72 = add i32 %shl9.i84, %mul
  %cmp.i73 = icmp ult i32 %add.i72, %mul
  %cmp8.i74 = icmp ult i32 %add.i72, %shl9.i84
  %or.cond.i75 = or i1 %cmp.i73, %cmp8.i74
  %z2.0.i76 = zext i1 %or.cond.i75 to i32
  %shr.i = lshr i32 %mul4, 16
  %shl9.i = shl i32 %mul4, 16
  %add.i59 = add i32 %add.i72, %shl9.i
  %cmp.i60 = icmp ult i32 %add.i59, %add.i72
  %cmp8.i61 = icmp ult i32 %add.i59, %shl9.i
  %or.cond.i62 = or i1 %cmp.i60, %cmp8.i61
  %z2.0.i63 = zext i1 %or.cond.i62 to i32
  %add10.i78 = add i32 %shr.i82, %mul5
  %add9.i64 = add i32 %add10.i78, %shr.i
  %add10.i65 = add i32 %add9.i64, %z2.0.i76
  %add9.i = add i32 %add10.i65, %z2.0.i63
  %res.sroa.0.0..sroa_idx38 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 0
  store i32 %add9.i, i32* %res.sroa.0.0..sroa_idx38, align 4
  %res.sroa.8.0..sroa_idx47 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 1
  store i32 %add.i59, i32* %res.sroa.8.0..sroa_idx47, align 4
  ret void
}

; Function Attrs: nounwind
define void @mult(%struct.int_64_t* noalias nocapture sret %agg.result, i32 %v1, i32 %v2) #1 {
entry:
  %v1.lobit16 = xor i32 %v2, %v1
  %ispos = icmp sgt i32 %v1, -1
  %neg = sub i32 0, %v1
  %0 = select i1 %ispos, i32 %v1, i32 %neg
  %ispos17 = icmp sgt i32 %v2, -1
  %neg18 = sub i32 0, %v2
  %1 = select i1 %ispos17, i32 %v2, i32 %neg18
  %and.i = and i32 %0, 65535
  %shr.i = lshr i32 %0, 16
  %and1.i = and i32 %1, 65535
  %shr2.i = lshr i32 %1, 16
  %mul.i = mul nuw i32 %and1.i, %and.i
  %mul3.i = mul nuw i32 %shr2.i, %and.i
  %mul4.i = mul nuw i32 %and1.i, %shr.i
  %mul5.i = mul nuw i32 %shr2.i, %shr.i
  %shr.i82.i = lshr i32 %mul3.i, 16
  %shl9.i84.i = shl i32 %mul3.i, 16
  %add.i72.i = add i32 %shl9.i84.i, %mul.i
  %cmp.i73.i = icmp ult i32 %add.i72.i, %mul.i
  %cmp8.i74.i = icmp ult i32 %add.i72.i, %shl9.i84.i
  %or.cond.i75.i = or i1 %cmp.i73.i, %cmp8.i74.i
  %z2.0.i76.i = zext i1 %or.cond.i75.i to i32
  %shr.i.i = lshr i32 %mul4.i, 16
  %shl9.i.i = shl i32 %mul4.i, 16
  %add.i59.i = add i32 %add.i72.i, %shl9.i.i
  %cmp.i60.i = icmp ult i32 %add.i59.i, %add.i72.i
  %cmp8.i61.i = icmp ult i32 %add.i59.i, %shl9.i.i
  %or.cond.i62.i = or i1 %cmp.i60.i, %cmp8.i61.i
  %z2.0.i63.i = zext i1 %or.cond.i62.i to i32
  %add10.i78.i = add i32 %shr.i82.i, %mul5.i
  %add9.i64.i = add i32 %add10.i78.i, %shr.i.i
  %add10.i65.i = add i32 %add9.i64.i, %z2.0.i76.i
  %add9.i.i = add i32 %add10.i65.i, %z2.0.i63.i
  %tobool = icmp slt i32 %v1.lobit16, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %neg.i = xor i32 %add.i59.i, -1
  %neg4.i = xor i32 %add9.i.i, -1
  %add.i.i = sub i32 0, %add.i59.i
  %cmp.i.i = icmp ult i32 %add.i.i, %neg.i
  %cmp8.i.i = icmp eq i32 %add.i59.i, 0
  %or.cond.i.i = or i1 %cmp.i.i, %cmp8.i.i
  %z2.0.i.i = zext i1 %or.cond.i.i to i32
  %add10.i.i = add i32 %z2.0.i.i, %neg4.i
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %product.sroa.0.0 = phi i32 [ %add10.i.i, %if.then ], [ %add9.i.i, %entry ]
  %product.sroa.4.0 = phi i32 [ %add.i.i, %if.then ], [ %add.i59.i, %entry ]
  %product.sroa.0.0..sroa_idx7 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 0
  store i32 %product.sroa.0.0, i32* %product.sroa.0.0..sroa_idx7, align 4
  %product.sroa.4.0..sroa_idx12 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 1
  store i32 %product.sroa.4.0, i32* %product.sroa.4.0..sroa_idx12, align 4
  ret void
}

; Function Attrs: nounwind
define void @sum_rot_block_row([24 x i32]* nocapture %powers) #1 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %middle.block, %entry
  %w.0228 = phi i32 [ 0, %entry ], [ %inc43, %middle.block ]
  %mul = mul nuw nsw i32 %w.0228, 24
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond1.preheader
  %index = phi i32 [ 0, %for.cond1.preheader ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ zeroinitializer, %for.cond1.preheader ], [ %71, %vector.body ]
  %vec.phi230 = phi <4 x i32> [ zeroinitializer, %for.cond1.preheader ], [ %39, %vector.body ]
  %0 = getelementptr inbounds [24 x i32], [24 x i32]* @rowsums, i32 0, i32 %index
  %1 = bitcast i32* %0 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %1, align 4, !tbaa !4
  %2 = shl <4 x i32> %wide.load, <i32 17, i32 17, i32 17, i32 17>
  %3 = add i32 %index, %mul
  %4 = getelementptr inbounds [96 x i32], [96 x i32]* @dft_waves_cos, i32 0, i32 %3
  %5 = bitcast i32* %4 to <4 x i32>*
  %wide.load233 = load <4 x i32>, <4 x i32>* %5, align 4, !tbaa !4
  %6 = xor <4 x i32> %wide.load233, %2
  %7 = icmp sgt <4 x i32> %2, <i32 -1, i32 -1, i32 -1, i32 -1>
  %8 = sub <4 x i32> zeroinitializer, %2
  %9 = select <4 x i1> %7, <4 x i32> %2, <4 x i32> %8
  %10 = icmp sgt <4 x i32> %wide.load233, <i32 -1, i32 -1, i32 -1, i32 -1>
  %11 = sub <4 x i32> zeroinitializer, %wide.load233
  %12 = select <4 x i1> %10, <4 x i32> %wide.load233, <4 x i32> %11
  %13 = lshr exact <4 x i32> %9, <i32 16, i32 16, i32 16, i32 16>
  %14 = and <4 x i32> %12, <i32 65535, i32 65535, i32 65535, i32 65535>
  %15 = lshr <4 x i32> %12, <i32 16, i32 16, i32 16, i32 16>
  %16 = mul nuw <4 x i32> %14, %13
  %17 = mul nuw <4 x i32> %15, %13
  %18 = lshr <4 x i32> %16, <i32 16, i32 16, i32 16, i32 16>
  %19 = shl <4 x i32> %16, <i32 16, i32 16, i32 16, i32 16>
  %20 = add <4 x i32> %18, %17
  %21 = icmp slt <4 x i32> %6, zeroinitializer
  %22 = xor <4 x i32> %19, <i32 -1, i32 -1, i32 -1, i32 -1>
  %23 = xor <4 x i32> %20, <i32 -1, i32 -1, i32 -1, i32 -1>
  %24 = sub <4 x i32> zeroinitializer, %19
  %25 = icmp ult <4 x i32> %24, %22
  %26 = icmp eq <4 x i32> %19, zeroinitializer
  %27 = or <4 x i1> %25, %26
  %28 = zext <4 x i1> %27 to <4 x i32>
  %29 = add <4 x i32> %28, %23
  %predphi = select <4 x i1> %21, <4 x i32> %29, <4 x i32> %20
  %predphi234 = select <4 x i1> %21, <4 x i32> %24, <4 x i32> %19
  %30 = lshr <4 x i32> %predphi234, <i32 17, i32 17, i32 17, i32 17>
  %31 = shl <4 x i32> %predphi, <i32 15, i32 15, i32 15, i32 15>
  %32 = or <4 x i32> %30, %31
  %33 = ashr <4 x i32> %predphi, <i32 17, i32 17, i32 17, i32 17>
  %34 = icmp slt <4 x i32> %33, zeroinitializer
  %35 = icmp eq <4 x i32> %33, <i32 -1, i32 -1, i32 -1, i32 -1>
  %36 = icmp eq <4 x i32> %33, zeroinitializer
  %37 = select <4 x i1> %34, <4 x i1> %35, <4 x i1> %36
  %38 = select <4 x i1> %37, <4 x i32> %32, <4 x i32> zeroinitializer
  %39 = add nsw <4 x i32> %38, %vec.phi230
  %40 = getelementptr inbounds [96 x i32], [96 x i32]* @dft_waves_sin, i32 0, i32 %3
  %41 = bitcast i32* %40 to <4 x i32>*
  %wide.load235 = load <4 x i32>, <4 x i32>* %41, align 4, !tbaa !4
  %42 = xor <4 x i32> %wide.load235, %2
  %43 = icmp sgt <4 x i32> %wide.load235, <i32 -1, i32 -1, i32 -1, i32 -1>
  %44 = sub <4 x i32> zeroinitializer, %wide.load235
  %45 = select <4 x i1> %43, <4 x i32> %wide.load235, <4 x i32> %44
  %46 = and <4 x i32> %45, <i32 65535, i32 65535, i32 65535, i32 65535>
  %47 = lshr <4 x i32> %45, <i32 16, i32 16, i32 16, i32 16>
  %48 = mul nuw <4 x i32> %46, %13
  %49 = mul nuw <4 x i32> %47, %13
  %50 = lshr <4 x i32> %48, <i32 16, i32 16, i32 16, i32 16>
  %51 = shl <4 x i32> %48, <i32 16, i32 16, i32 16, i32 16>
  %52 = add <4 x i32> %50, %49
  %53 = icmp slt <4 x i32> %42, zeroinitializer
  %54 = xor <4 x i32> %51, <i32 -1, i32 -1, i32 -1, i32 -1>
  %55 = xor <4 x i32> %52, <i32 -1, i32 -1, i32 -1, i32 -1>
  %56 = sub <4 x i32> zeroinitializer, %51
  %57 = icmp ult <4 x i32> %56, %54
  %58 = icmp eq <4 x i32> %51, zeroinitializer
  %59 = or <4 x i1> %57, %58
  %60 = zext <4 x i1> %59 to <4 x i32>
  %61 = add <4 x i32> %60, %55
  %predphi236 = select <4 x i1> %53, <4 x i32> %61, <4 x i32> %52
  %predphi237 = select <4 x i1> %53, <4 x i32> %56, <4 x i32> %51
  %62 = lshr <4 x i32> %predphi237, <i32 17, i32 17, i32 17, i32 17>
  %63 = shl <4 x i32> %predphi236, <i32 15, i32 15, i32 15, i32 15>
  %64 = or <4 x i32> %62, %63
  %65 = ashr <4 x i32> %predphi236, <i32 17, i32 17, i32 17, i32 17>
  %66 = icmp slt <4 x i32> %65, zeroinitializer
  %67 = icmp eq <4 x i32> %65, <i32 -1, i32 -1, i32 -1, i32 -1>
  %68 = icmp eq <4 x i32> %65, zeroinitializer
  %69 = select <4 x i1> %66, <4 x i1> %67, <4 x i1> %68
  %70 = select <4 x i1> %69, <4 x i32> %64, <4 x i32> zeroinitializer
  %71 = add nsw <4 x i32> %70, %vec.phi
  %index.next = add i32 %index, 4
  %72 = icmp eq i32 %index.next, 24
  br i1 %72, label %middle.block, label %vector.body, !llvm.loop !8

middle.block:                                     ; preds = %vector.body
  %.lcssa247 = phi <4 x i32> [ %71, %vector.body ]
  %.lcssa = phi <4 x i32> [ %39, %vector.body ]
  %rdx.shuf241 = shufflevector <4 x i32> %.lcssa, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx242 = add <4 x i32> %.lcssa, %rdx.shuf241
  %rdx.shuf243 = shufflevector <4 x i32> %bin.rdx242, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx244 = add <4 x i32> %bin.rdx242, %rdx.shuf243
  %73 = extractelement <4 x i32> %bin.rdx244, i32 0
  %rdx.shuf = shufflevector <4 x i32> %.lcssa247, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx = add <4 x i32> %.lcssa247, %rdx.shuf
  %rdx.shuf238 = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx239 = add <4 x i32> %bin.rdx, %rdx.shuf238
  %74 = extractelement <4 x i32> %bin.rdx239, i32 0
  %shr = ashr i32 %73, 12
  %ispos.i112 = icmp sgt i32 %shr, -1
  %neg.i113 = sub nsw i32 0, %shr
  %75 = select i1 %ispos.i112, i32 %shr, i32 %neg.i113
  %and.i.i116 = and i32 %75, 65535
  %shr.i.i117 = lshr i32 %75, 16
  %mul.i.i120 = mul nuw i32 %and.i.i116, %and.i.i116
  %mul3.i.i121 = mul nuw i32 %shr.i.i117, %and.i.i116
  %mul5.i.i123 = mul nuw i32 %shr.i.i117, %shr.i.i117
  %shr.i82.i.i124 = lshr i32 %mul3.i.i121, 16
  %shl9.i84.i.i125 = shl i32 %mul3.i.i121, 16
  %add.i72.i.i126 = add i32 %shl9.i84.i.i125, %mul.i.i120
  %cmp.i73.i.i127 = icmp ult i32 %add.i72.i.i126, %mul.i.i120
  %cmp8.i74.i.i128 = icmp ult i32 %add.i72.i.i126, %shl9.i84.i.i125
  %or.cond.i75.i.i129 = or i1 %cmp.i73.i.i127, %cmp8.i74.i.i128
  %z2.0.i76.i.i130 = zext i1 %or.cond.i75.i.i129 to i32
  %add.i59.i.i133 = add i32 %add.i72.i.i126, %shl9.i84.i.i125
  %cmp.i60.i.i134 = icmp ult i32 %add.i59.i.i133, %add.i72.i.i126
  %cmp8.i61.i.i135 = icmp ult i32 %add.i59.i.i133, %shl9.i84.i.i125
  %or.cond.i62.i.i136 = or i1 %cmp.i60.i.i134, %cmp8.i61.i.i135
  %z2.0.i63.i.i137 = zext i1 %or.cond.i62.i.i136 to i32
  %factor = shl nuw nsw i32 %shr.i82.i.i124, 1
  %add9.i64.i.i139 = add i32 %z2.0.i76.i.i130, %mul5.i.i123
  %add10.i65.i.i140 = add i32 %add9.i64.i.i139, %z2.0.i63.i.i137
  %add9.i.i.i141 = add i32 %add10.i65.i.i140, %factor
  %shr.i105 = lshr i32 %add.i59.i.i133, 5
  %shl.i106 = shl i32 %add9.i.i.i141, 27
  %or.i107 = or i32 %shl.i106, %shr.i105
  %shr9.i108 = ashr i32 %add9.i.i.i141, 5
  %tobool.i96 = icmp slt i32 %shr9.i108, 0
  %cmp.i97 = icmp eq i32 %shr9.i108, -1
  %cmp7.i100 = icmp eq i32 %shr9.i108, 0
  %cmp.i97.sink = select i1 %tobool.i96, i1 %cmp.i97, i1 %cmp7.i100
  %x.1..i98 = select i1 %cmp.i97.sink, i32 %or.i107, i32 0
  %shr32 = ashr i32 %74, 12
  %ispos.i62 = icmp sgt i32 %shr32, -1
  %neg.i63 = sub nsw i32 0, %shr32
  %76 = select i1 %ispos.i62, i32 %shr32, i32 %neg.i63
  %and.i.i66 = and i32 %76, 65535
  %shr.i.i67 = lshr i32 %76, 16
  %mul.i.i70 = mul nuw i32 %and.i.i66, %and.i.i66
  %mul3.i.i71 = mul nuw i32 %shr.i.i67, %and.i.i66
  %mul5.i.i73 = mul nuw i32 %shr.i.i67, %shr.i.i67
  %shr.i82.i.i74 = lshr i32 %mul3.i.i71, 16
  %shl9.i84.i.i75 = shl i32 %mul3.i.i71, 16
  %add.i72.i.i76 = add i32 %shl9.i84.i.i75, %mul.i.i70
  %cmp.i73.i.i77 = icmp ult i32 %add.i72.i.i76, %mul.i.i70
  %cmp8.i74.i.i78 = icmp ult i32 %add.i72.i.i76, %shl9.i84.i.i75
  %or.cond.i75.i.i79 = or i1 %cmp.i73.i.i77, %cmp8.i74.i.i78
  %z2.0.i76.i.i80 = zext i1 %or.cond.i75.i.i79 to i32
  %add.i59.i.i83 = add i32 %add.i72.i.i76, %shl9.i84.i.i75
  %cmp.i60.i.i84 = icmp ult i32 %add.i59.i.i83, %add.i72.i.i76
  %cmp8.i61.i.i85 = icmp ult i32 %add.i59.i.i83, %shl9.i84.i.i75
  %or.cond.i62.i.i86 = or i1 %cmp.i60.i.i84, %cmp8.i61.i.i85
  %z2.0.i63.i.i87 = zext i1 %or.cond.i62.i.i86 to i32
  %factor224 = shl nuw nsw i32 %shr.i82.i.i74, 1
  %add9.i64.i.i89 = add i32 %z2.0.i76.i.i80, %mul5.i.i73
  %add10.i65.i.i90 = add i32 %add9.i64.i.i89, %z2.0.i63.i.i87
  %add9.i.i.i91 = add i32 %add10.i65.i.i90, %factor224
  %shr.i = lshr i32 %add.i59.i.i83, 5
  %shl.i = shl i32 %add9.i.i.i91, 27
  %or.i = or i32 %shl.i, %shr.i
  %shr9.i = ashr i32 %add9.i.i.i91, 5
  %tobool.i58 = icmp slt i32 %shr9.i, 0
  %cmp.i = icmp eq i32 %shr9.i, -1
  %cmp7.i = icmp eq i32 %shr9.i, 0
  %cmp.i.sink = select i1 %tobool.i58, i1 %cmp.i, i1 %cmp7.i
  %x.1..i = select i1 %cmp.i.sink, i32 %or.i, i32 0
  %add39 = add nsw i32 %x.1..i, %x.1..i98
  %arrayidx41 = getelementptr inbounds [24 x i32], [24 x i32]* %powers, i32 %w.0228, i32 0
  store i32 %add39, i32* %arrayidx41, align 4, !tbaa !4
  %inc43 = add nuw nsw i32 %w.0228, 1
  %exitcond229 = icmp eq i32 %inc43, 4
  br i1 %exitcond229, label %for.end44, label %for.cond1.preheader

for.end44:                                        ; preds = %middle.block
  ret void
}

; Function Attrs: nounwind
define i32 @main() #1 {
entry:
  br label %for.body

for.cond1.preheader:                              ; preds = %for.body
  %0 = load i32, i32* getelementptr inbounds ([4 x [24 x i32]], [4 x [24 x i32]]* @powers, i32 0, i32 0, i32 0), align 4, !tbaa !4
  %1 = load i32, i32* getelementptr inbounds ([4 x [24 x i32]], [4 x [24 x i32]]* @powers_temp, i32 0, i32 0, i32 0), align 4, !tbaa !4
  %cmp7 = icmp eq i32 %0, %1
  br i1 %cmp7, label %for.cond1, label %if.then

for.body:                                         ; preds = %for.body, %entry
  %i.019 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  tail call void @sum_rot_block_row([24 x i32]* getelementptr inbounds ([4 x [24 x i32]], [4 x [24 x i32]]* @powers, i32 0, i32 0))
  %inc = add nuw nsw i32 %i.019, 1
  %exitcond = icmp eq i32 %inc, 200
  br i1 %exitcond, label %for.cond1.preheader, label %for.body

for.cond1:                                        ; preds = %for.cond1.preheader
  %2 = load i32, i32* getelementptr inbounds ([4 x [24 x i32]], [4 x [24 x i32]]* @powers, i32 0, i32 1, i32 0), align 4, !tbaa !4
  %3 = load i32, i32* getelementptr inbounds ([4 x [24 x i32]], [4 x [24 x i32]]* @powers_temp, i32 0, i32 1, i32 0), align 4, !tbaa !4
  %cmp7.1 = icmp eq i32 %2, %3
  br i1 %cmp7.1, label %for.cond1.1, label %if.then

if.then:                                          ; preds = %for.cond1.2, %for.cond1.1, %for.cond1, %for.cond1.preheader
  %puts17 = tail call i32 @puts(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str2, i32 0, i32 0))
  br label %return

return:                                           ; preds = %for.cond1.3, %if.then
  %retval.0 = phi i32 [ 666, %if.then ], [ -1, %for.cond1.3 ]
  ret i32 %retval.0

for.cond1.1:                                      ; preds = %for.cond1
  %4 = load i32, i32* getelementptr inbounds ([4 x [24 x i32]], [4 x [24 x i32]]* @powers, i32 0, i32 2, i32 0), align 4, !tbaa !4
  %5 = load i32, i32* getelementptr inbounds ([4 x [24 x i32]], [4 x [24 x i32]]* @powers_temp, i32 0, i32 2, i32 0), align 4, !tbaa !4
  %cmp7.2 = icmp eq i32 %4, %5
  br i1 %cmp7.2, label %for.cond1.2, label %if.then

for.cond1.2:                                      ; preds = %for.cond1.1
  %6 = load i32, i32* getelementptr inbounds ([4 x [24 x i32]], [4 x [24 x i32]]* @powers, i32 0, i32 3, i32 0), align 4, !tbaa !4
  %7 = load i32, i32* getelementptr inbounds ([4 x [24 x i32]], [4 x [24 x i32]]* @powers_temp, i32 0, i32 3, i32 0), align 4, !tbaa !4
  %cmp7.3 = icmp eq i32 %6, %7
  br i1 %cmp7.3, label %for.cond1.3, label %if.then

for.cond1.3:                                      ; preds = %for.cond1.2
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str, i32 0, i32 0))
  br label %return
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

attributes #0 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
!1 = !{!2}
!2 = distinct !{!2, !3, !"add: %agg.result"}
!3 = distinct !{!3, !"add"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.vectorize.width", i32 1}
!10 = !{!"llvm.loop.interleave.count", i32 1}
