; ModuleID = 'dft_print.c'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

%struct.int_64_t = type { i32, i32 }

@rowsums = global [24 x i32] [i32 759, i32 776, i32 787, i32 795, i32 797, i32 796, i32 801, i32 805, i32 800, i32 800, i32 799, i32 801, i32 799, i32 790, i32 781, i32 775, i32 772, i32 769, i32 768, i32 767, i32 762, i32 761, i32 755, i32 751], align 4
@powers = global [4 x [24 x i32]] zeroinitializer, align 4
@powers_temp = global [4 x [24 x i32]] [[24 x i32] [i32 2436991, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], [24 x i32] [i32 63546, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], [24 x i32] [i32 131381, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], [24 x i32] [i32 19272, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0]], align 4
@dft_waves_cos = global [96 x i32] [i32 131072, i32 126606, i32 113512, i32 92683, i32 65537, i32 33926, i32 3, i32 -33921, i32 -65532, i32 -92679, i32 -113509, i32 -126605, i32 -131072, i32 -126608, i32 -113516, i32 -92689, i32 -65544, i32 -33934, i32 -11, i32 33913, i32 65526, i32 92673, i32 113505, i32 126602, i32 131072, i32 113512, i32 65537, i32 3, i32 -65532, i32 -113509, i32 -131072, i32 -113516, i32 -65544, i32 -11, i32 65526, i32 113505, i32 131072, i32 113518, i32 65549, i32 16, i32 -65521, i32 -113503, i32 -131072, i32 -113523, i32 -65556, i32 -24, i32 65514, i32 113499, i32 131072, i32 92683, i32 3, i32 -92679, i32 -131072, i32 -92689, i32 -11, i32 92673, i32 131072, i32 92692, i32 16, i32 -92669, i32 -131072, i32 -92698, i32 -24, i32 92664, i32 131071, i32 92701, i32 29, i32 -92660, i32 -131072, i32 -92707, i32 -37, i32 92654, i32 131072, i32 65537, i32 -65532, i32 -131072, i32 -65544, i32 65526, i32 131072, i32 65549, i32 -65521, i32 -131072, i32 -65556, i32 65514, i32 131071, i32 65560, i32 -65510, i32 -131072, i32 -65567, i32 65503, i32 131071, i32 65571, i32 -65499, i32 -131072, i32 -65578, i32 65492], align 4
@dft_waves_sin = global [96 x i32] [i32 0, i32 33923, i32 65535, i32 92680, i32 113510, i32 126605, i32 131071, i32 126606, i32 113514, i32 92685, i32 65540, i32 33929, i32 6, i32 -33917, i32 -65530, i32 -92676, i32 -113508, i32 -126604, i32 -131072, i32 -126609, i32 -113518, i32 -92691, i32 -65547, i32 -33937, i32 0, i32 65535, i32 113510, i32 131071, i32 113514, i32 65540, i32 6, i32 -65530, i32 -113508, i32 -131072, i32 -113518, i32 -65547, i32 -14, i32 65523, i32 113504, i32 131071, i32 113520, i32 65552, i32 19, i32 -65518, i32 -113501, i32 -131072, i32 -113524, i32 -65558, i32 0, i32 92680, i32 131071, i32 92685, i32 6, i32 -92676, i32 -131072, i32 -92691, i32 -14, i32 92671, i32 131071, i32 92694, i32 19, i32 -92667, i32 -131072, i32 -92700, i32 -27, i32 92662, i32 131071, i32 92704, i32 32, i32 -92658, i32 -131072, i32 -92709, i32 0, i32 113510, i32 113514, i32 6, i32 -113508, i32 -113518, i32 -14, i32 113504, i32 113520, i32 19, i32 -113501, i32 -113524, i32 -27, i32 113497, i32 113527, i32 32, i32 -113495, i32 -113531, i32 -40, i32 113491, i32 113533, i32 45, i32 -113488, i32 -113537], align 4
@str = private unnamed_addr constant [3 x i8] c"-1\00"
@str2 = private unnamed_addr constant [4 x i8] c"666\00"

; Function Attrs: nounwind readnone
define i32 @cast_uint32(i32 inreg %x.coerce0, i32 inreg %x.coerce1) #0 {
entry:
  ret i32 %x.coerce1
}

; Function Attrs: nounwind readnone
define i32 @cast_int32(i32 inreg %x.coerce0, i32 inreg %x.coerce1) #0 {
entry:
  %tobool = icmp slt i32 %x.coerce0, 0
  br i1 %tobool, label %if.then, label %if.else3

if.then:                                          ; preds = %entry
  %cmp = icmp eq i32 %x.coerce0, -1
  %x.coerce1. = select i1 %cmp, i32 %x.coerce1, i32 0
  ret i32 %x.coerce1.

if.else3:                                         ; preds = %entry
  %cmp5 = icmp eq i32 %x.coerce0, 0
  %x.coerce1.13 = select i1 %cmp5, i32 %x.coerce1, i32 0
  ret i32 %x.coerce1.13
}

; Function Attrs: nounwind
define void @cast(%struct.int_64_t* noalias nocapture sret %agg.result, i32 signext %x) #1 {
entry:
  %x.lobit = ashr i32 %x, 31
  %llong.sroa.0.0..sroa_idx = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 0
  store i32 %x.lobit, i32* %llong.sroa.0.0..sroa_idx, align 4
  %llong.sroa.3.0..sroa_idx2 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 1
  store i32 %x, i32* %llong.sroa.3.0..sroa_idx2, align 4
  ret void
}

; Function Attrs: nounwind
define void @add(%struct.int_64_t* noalias nocapture sret %agg.result, i32 inreg %x.coerce0, i32 inreg %x.coerce1, i32 inreg %y.coerce0, i32 inreg %y.coerce1) #1 {
entry:
  %add = add i32 %y.coerce1, %x.coerce1
  %cmp = icmp ult i32 %add, %x.coerce1
  %cmp3 = icmp ult i32 %add, %y.coerce1
  %or.cond = or i1 %cmp, %cmp3
  %z2.0 = zext i1 %or.cond to i32
  %add4 = add i32 %y.coerce0, %x.coerce0
  %add5 = add i32 %add4, %z2.0
  %sum.sroa.0.0..sroa_idx = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 0
  store i32 %add5, i32* %sum.sroa.0.0..sroa_idx, align 4
  %sum.sroa.2.0..sroa_idx8 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 1
  store i32 %add, i32* %sum.sroa.2.0..sroa_idx8, align 4
  ret void
}

; Function Attrs: nounwind
define void @neg(%struct.int_64_t* noalias nocapture sret %agg.result, i32 inreg %x.coerce0, i32 inreg %x.coerce1) #1 {
entry:
  %neg = xor i32 %x.coerce1, -1
  %neg2 = xor i32 %x.coerce0, -1
  %add.i = sub i32 0, %x.coerce1
  %cmp.i = icmp ult i32 %add.i, %neg
  %cmp3.i = icmp eq i32 %x.coerce1, 0
  %or.cond.i = or i1 %cmp.i, %cmp3.i
  %z2.0.i = zext i1 %or.cond.i to i32
  %add5.i = add i32 %z2.0.i, %neg2
  %sum.sroa.0.0..sroa_idx.i = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 0
  store i32 %add5.i, i32* %sum.sroa.0.0..sroa_idx.i, align 4, !alias.scope !1
  %sum.sroa.2.0..sroa_idx8.i = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 1
  store i32 %add.i, i32* %sum.sroa.2.0..sroa_idx8.i, align 4, !alias.scope !1
  ret void
}

; Function Attrs: nounwind readnone
define i32 @abs(i32 signext %x) #0 {
entry:
  %cmp = icmp slt i32 %x, 0
  %sub = sub nsw i32 0, %x
  %retval.0 = select i1 %cmp, i32 %sub, i32 %x
  ret i32 %retval.0
}

; Function Attrs: nounwind
define void @ucast(%struct.int_64_t* noalias nocapture sret %agg.result, i32 zeroext %x) #1 {
entry:
  %llong.sroa.0.0..sroa_idx = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 0
  store i32 0, i32* %llong.sroa.0.0..sroa_idx, align 4
  %llong.sroa.2.0..sroa_idx1 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 1
  store i32 %x, i32* %llong.sroa.2.0..sroa_idx1, align 4
  ret void
}

; Function Attrs: nounwind
define void @sll(%struct.int_64_t* noalias nocapture sret %agg.result, i32 inreg %value.coerce0, i32 inreg %value.coerce1, i8 zeroext %pos) #1 {
entry:
  %conv = zext i8 %pos to i32
  %cmp = icmp ult i8 %pos, 32
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %shl = shl i32 %value.coerce0, %conv
  %sub = sub nsw i32 32, %conv
  %shr = lshr i32 %value.coerce1, %sub
  %or = or i32 %shr, %shl
  %shl7 = shl i32 %value.coerce1, %conv
  br label %if.end

if.else:                                          ; preds = %entry
  %sub10 = add nsw i32 %conv, -32
  %shl11 = shl i32 %value.coerce1, %sub10
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %value.sroa.0.0 = phi i32 [ %or, %if.then ], [ %shl11, %if.else ]
  %value.sroa.7.0 = phi i32 [ %shl7, %if.then ], [ 0, %if.else ]
  %value.sroa.0.0..sroa_idx = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 0
  store i32 %value.sroa.0.0, i32* %value.sroa.0.0..sroa_idx, align 4
  %value.sroa.7.0..sroa_idx19 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 1
  store i32 %value.sroa.7.0, i32* %value.sroa.7.0..sroa_idx19, align 4
  ret void
}

; Function Attrs: nounwind
define void @sra(%struct.int_64_t* noalias nocapture sret %agg.result, i32 inreg %value.coerce0, i32 inreg %value.coerce1, i8 zeroext %pos) #1 {
entry:
  %conv = zext i8 %pos to i32
  %cmp = icmp ult i8 %pos, 32
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %shr = lshr i32 %value.coerce1, %conv
  %sub = sub nsw i32 32, %conv
  %shl = shl i32 %value.coerce0, %sub
  %or = or i32 %shl, %shr
  %shr7 = ashr i32 %value.coerce0, %conv
  br label %if.end

if.else:                                          ; preds = %entry
  %sub11 = add nsw i32 %conv, -32
  %shr12 = ashr i32 %value.coerce0, %sub11
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %value.sroa.0.0 = phi i32 [ %shr7, %if.then ], [ -1, %if.else ]
  %value.sroa.7.0 = phi i32 [ %or, %if.then ], [ %shr12, %if.else ]
  %value.sroa.0.0..sroa_idx = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 0
  store i32 %value.sroa.0.0, i32* %value.sroa.0.0..sroa_idx, align 4
  %value.sroa.7.0..sroa_idx21 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 1
  store i32 %value.sroa.7.0, i32* %value.sroa.7.0..sroa_idx21, align 4
  ret void
}

; Function Attrs: nounwind
define void @umult(%struct.int_64_t* noalias nocapture sret %agg.result, i32 zeroext %a, i32 zeroext %b) #1 {
entry:
  %and = and i32 %a, 65535
  %shr = lshr i32 %a, 16
  %and1 = and i32 %b, 65535
  %shr2 = lshr i32 %b, 16
  %mul = mul nuw i32 %and1, %and
  %mul3 = mul nuw i32 %shr2, %and
  %mul4 = mul nuw i32 %and1, %shr
  %mul5 = mul nuw i32 %shr2, %shr
  %shr.i66 = lshr i32 %mul3, 16
  %shl7.i68 = shl i32 %mul3, 16
  %add.i56 = add i32 %shl7.i68, %mul
  %cmp.i57 = icmp ult i32 %add.i56, %mul
  %cmp3.i58 = icmp ult i32 %add.i56, %shl7.i68
  %or.cond.i59 = or i1 %cmp.i57, %cmp3.i58
  %z2.0.i60 = zext i1 %or.cond.i59 to i32
  %shr.i = lshr i32 %mul4, 16
  %shl7.i = shl i32 %mul4, 16
  %add.i43 = add i32 %add.i56, %shl7.i
  %cmp.i44 = icmp ult i32 %add.i43, %add.i56
  %cmp3.i45 = icmp ult i32 %add.i43, %shl7.i
  %or.cond.i46 = or i1 %cmp.i44, %cmp3.i45
  %z2.0.i47 = zext i1 %or.cond.i46 to i32
  %add5.i62 = add i32 %shr.i66, %mul5
  %add4.i48 = add i32 %add5.i62, %shr.i
  %add5.i49 = add i32 %add4.i48, %z2.0.i60
  %add4.i = add i32 %add5.i49, %z2.0.i47
  %res.sroa.0.0..sroa_idx22 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 0
  store i32 %add4.i, i32* %res.sroa.0.0..sroa_idx22, align 4
  %res.sroa.8.0..sroa_idx31 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.result, i32 0, i32 1
  store i32 %add.i43, i32* %res.sroa.8.0..sroa_idx31, align 4
  ret void
}

; Function Attrs: nounwind
define void @mult(%struct.int_64_t* noalias nocapture sret %agg.result, i32 signext %v1, i32 signext %v2) #1 {
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
  %shr.i66.i = lshr i32 %mul3.i, 16
  %shl7.i68.i = shl i32 %mul3.i, 16
  %add.i56.i = add i32 %shl7.i68.i, %mul.i
  %cmp.i57.i = icmp ult i32 %add.i56.i, %mul.i
  %cmp3.i58.i = icmp ult i32 %add.i56.i, %shl7.i68.i
  %or.cond.i59.i = or i1 %cmp.i57.i, %cmp3.i58.i
  %z2.0.i60.i = zext i1 %or.cond.i59.i to i32
  %shr.i.i = lshr i32 %mul4.i, 16
  %shl7.i.i = shl i32 %mul4.i, 16
  %add.i43.i = add i32 %add.i56.i, %shl7.i.i
  %cmp.i44.i = icmp ult i32 %add.i43.i, %add.i56.i
  %cmp3.i45.i = icmp ult i32 %add.i43.i, %shl7.i.i
  %or.cond.i46.i = or i1 %cmp.i44.i, %cmp3.i45.i
  %z2.0.i47.i = zext i1 %or.cond.i46.i to i32
  %add5.i62.i = add i32 %shr.i66.i, %mul5.i
  %add4.i48.i = add i32 %add5.i62.i, %shr.i.i
  %add5.i49.i = add i32 %add4.i48.i, %z2.0.i60.i
  %add4.i.i = add i32 %add5.i49.i, %z2.0.i47.i
  %tobool = icmp slt i32 %v1.lobit16, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %neg.i = xor i32 %add.i43.i, -1
  %neg2.i = xor i32 %add4.i.i, -1
  %add.i.i = sub i32 0, %add.i43.i
  %cmp.i.i = icmp ult i32 %add.i.i, %neg.i
  %cmp3.i.i = icmp eq i32 %add.i43.i, 0
  %or.cond.i.i = or i1 %cmp.i.i, %cmp3.i.i
  %z2.0.i.i = zext i1 %or.cond.i.i to i32
  %add5.i.i = add i32 %z2.0.i.i, %neg2.i
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %product.sroa.0.0 = phi i32 [ %add5.i.i, %if.then ], [ %add4.i.i, %entry ]
  %product.sroa.4.0 = phi i32 [ %add.i.i, %if.then ], [ %add.i43.i, %entry ]
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

for.cond1.preheader:                              ; preds = %for.end, %entry
  %w.0214 = phi i32 [ 0, %entry ], [ %inc29, %for.end ]
  %mul = mul nuw nsw i32 %w.0214, 24
  br label %for.body3

for.body3:                                        ; preds = %mult.exit193, %for.cond1.preheader
  %fp_sinpart.0213 = phi i32 [ 0, %for.cond1.preheader ], [ %add15, %mult.exit193 ]
  %fp_cospart.0212 = phi i32 [ 0, %for.cond1.preheader ], [ %add6, %mult.exit193 ]
  %i.0211 = phi i32 [ 0, %for.cond1.preheader ], [ %inc, %mult.exit193 ]
  %arrayidx = getelementptr inbounds [24 x i32], [24 x i32]* @rowsums, i32 0, i32 %i.0211
  %0 = load i32, i32* %arrayidx, align 4, !tbaa !4
  %shl = shl i32 %0, 17
  %add = add nuw nsw i32 %i.0211, %mul
  %arrayidx5 = getelementptr inbounds [96 x i32], [96 x i32]* @dft_waves_cos, i32 0, i32 %add
  %1 = load i32, i32* %arrayidx5, align 4, !tbaa !4
  %v1.lobit16.i = xor i32 %1, %shl
  %ispos.i = icmp sgt i32 %shl, -1
  %neg.i = sub i32 0, %shl
  %2 = select i1 %ispos.i, i32 %shl, i32 %neg.i
  %ispos17.i = icmp sgt i32 %1, -1
  %neg18.i = sub i32 0, %1
  %3 = select i1 %ispos17.i, i32 %1, i32 %neg18.i
  %shr.i.i = lshr exact i32 %2, 16
  %and1.i.i = and i32 %3, 65535
  %shr2.i.i = lshr i32 %3, 16
  %mul4.i.i = mul nuw i32 %and1.i.i, %shr.i.i
  %mul5.i.i = mul nuw i32 %shr2.i.i, %shr.i.i
  %shr.i.i.i = lshr i32 %mul4.i.i, 16
  %shl7.i.i.i = shl i32 %mul4.i.i, 16
  %add4.i.i.i = add i32 %shr.i.i.i, %mul5.i.i
  %tobool.i = icmp slt i32 %v1.lobit16.i, 0
  br i1 %tobool.i, label %if.then.i, label %mult.exit

if.then.i:                                        ; preds = %for.body3
  %neg.i.i = xor i32 %shl7.i.i.i, -1
  %neg2.i.i = xor i32 %add4.i.i.i, -1
  %add.i.i.i = sub i32 0, %shl7.i.i.i
  %cmp.i.i.i = icmp ult i32 %add.i.i.i, %neg.i.i
  %cmp3.i.i.i = icmp eq i32 %shl7.i.i.i, 0
  %or.cond.i.i.i = or i1 %cmp.i.i.i, %cmp3.i.i.i
  %z2.0.i.i.i = zext i1 %or.cond.i.i.i to i32
  %add5.i.i.i = add i32 %z2.0.i.i.i, %neg2.i.i
  br label %mult.exit

mult.exit:                                        ; preds = %for.body3, %if.then.i
  %product.sroa.0.0.i = phi i32 [ %add5.i.i.i, %if.then.i ], [ %add4.i.i.i, %for.body3 ]
  %product.sroa.4.0.i = phi i32 [ %add.i.i.i, %if.then.i ], [ %shl7.i.i.i, %for.body3 ]
  %shr.i203 = lshr i32 %product.sroa.4.0.i, 17
  %shl.i204 = shl i32 %product.sroa.0.0.i, 15
  %or.i205 = or i32 %shr.i203, %shl.i204
  %shr7.i206 = ashr i32 %product.sroa.0.0.i, 17
  %tobool.i194 = icmp slt i32 %shr7.i206, 0
  %cmp.i195 = icmp eq i32 %shr7.i206, -1
  %cmp5.i198 = icmp eq i32 %shr7.i206, 0
  %cmp.i195.sink = select i1 %tobool.i194, i1 %cmp.i195, i1 %cmp5.i198
  %x.coerce1..i196 = select i1 %cmp.i195.sink, i32 %or.i205, i32 0
  %add6 = add nsw i32 %x.coerce1..i196, %fp_cospart.0212
  %arrayidx13 = getelementptr inbounds [96 x i32], [96 x i32]* @dft_waves_sin, i32 0, i32 %add
  %4 = load i32, i32* %arrayidx13, align 4, !tbaa !4
  %v1.lobit16.i148 = xor i32 %4, %shl
  %ispos17.i151 = icmp sgt i32 %4, -1
  %neg18.i152 = sub i32 0, %4
  %5 = select i1 %ispos17.i151, i32 %4, i32 %neg18.i152
  %and1.i.i155 = and i32 %5, 65535
  %shr2.i.i156 = lshr i32 %5, 16
  %mul4.i.i159 = mul nuw i32 %and1.i.i155, %shr.i.i
  %mul5.i.i160 = mul nuw i32 %shr2.i.i156, %shr.i.i
  %shr.i.i.i168 = lshr i32 %mul4.i.i159, 16
  %shl7.i.i.i169 = shl i32 %mul4.i.i159, 16
  %add4.i.i.i178 = add i32 %shr.i.i.i168, %mul5.i.i160
  %tobool.i179 = icmp slt i32 %v1.lobit16.i148, 0
  br i1 %tobool.i179, label %if.then.i188, label %mult.exit193

if.then.i188:                                     ; preds = %mult.exit
  %neg.i.i180 = xor i32 %shl7.i.i.i169, -1
  %neg2.i.i181 = xor i32 %add4.i.i.i178, -1
  %add.i.i.i182 = sub i32 0, %shl7.i.i.i169
  %cmp.i.i.i183 = icmp ult i32 %add.i.i.i182, %neg.i.i180
  %cmp3.i.i.i184 = icmp eq i32 %shl7.i.i.i169, 0
  %or.cond.i.i.i185 = or i1 %cmp.i.i.i183, %cmp3.i.i.i184
  %z2.0.i.i.i186 = zext i1 %or.cond.i.i.i185 to i32
  %add5.i.i.i187 = add i32 %z2.0.i.i.i186, %neg2.i.i181
  br label %mult.exit193

mult.exit193:                                     ; preds = %mult.exit, %if.then.i188
  %product.sroa.0.0.i189 = phi i32 [ %add5.i.i.i187, %if.then.i188 ], [ %add4.i.i.i178, %mult.exit ]
  %product.sroa.4.0.i190 = phi i32 [ %add.i.i.i182, %if.then.i188 ], [ %shl7.i.i.i169, %mult.exit ]
  %shr.i141 = lshr i32 %product.sroa.4.0.i190, 17
  %shl.i142 = shl i32 %product.sroa.0.0.i189, 15
  %or.i143 = or i32 %shr.i141, %shl.i142
  %shr7.i144 = ashr i32 %product.sroa.0.0.i189, 17
  %tobool.i132 = icmp slt i32 %shr7.i144, 0
  %cmp.i133 = icmp eq i32 %shr7.i144, -1
  %cmp5.i136 = icmp eq i32 %shr7.i144, 0
  %cmp.i133.sink = select i1 %tobool.i132, i1 %cmp.i133, i1 %cmp5.i136
  %x.coerce1..i134 = select i1 %cmp.i133.sink, i32 %or.i143, i32 0
  %add15 = add nsw i32 %x.coerce1..i134, %fp_sinpart.0213
  %inc = add nuw nsw i32 %i.0211, 1
  %exitcond = icmp eq i32 %inc, 24
  br i1 %exitcond, label %for.end, label %for.body3

for.end:                                          ; preds = %mult.exit193
  %add15.lcssa = phi i32 [ %add15, %mult.exit193 ]
  %add6.lcssa = phi i32 [ %add6, %mult.exit193 ]
  %shr = ashr i32 %add6.lcssa, 12
  %ispos.i98 = icmp sgt i32 %shr, -1
  %neg.i99 = sub nsw i32 0, %shr
  %6 = select i1 %ispos.i98, i32 %shr, i32 %neg.i99
  %and.i.i102 = and i32 %6, 65535
  %shr.i.i103 = lshr i32 %6, 16
  %mul.i.i106 = mul nuw i32 %and.i.i102, %and.i.i102
  %mul3.i.i107 = mul nuw i32 %shr.i.i103, %and.i.i102
  %mul5.i.i109 = mul nuw i32 %shr.i.i103, %shr.i.i103
  %shr.i66.i.i110 = lshr i32 %mul3.i.i107, 16
  %shl7.i68.i.i111 = shl i32 %mul3.i.i107, 16
  %add.i56.i.i112 = add i32 %shl7.i68.i.i111, %mul.i.i106
  %cmp.i57.i.i113 = icmp ult i32 %add.i56.i.i112, %mul.i.i106
  %cmp3.i58.i.i114 = icmp ult i32 %add.i56.i.i112, %shl7.i68.i.i111
  %or.cond.i59.i.i115 = or i1 %cmp.i57.i.i113, %cmp3.i58.i.i114
  %z2.0.i60.i.i116 = zext i1 %or.cond.i59.i.i115 to i32
  %add.i43.i.i119 = add i32 %add.i56.i.i112, %shl7.i68.i.i111
  %cmp.i44.i.i120 = icmp ult i32 %add.i43.i.i119, %add.i56.i.i112
  %cmp3.i45.i.i121 = icmp ult i32 %add.i43.i.i119, %shl7.i68.i.i111
  %or.cond.i46.i.i122 = or i1 %cmp.i44.i.i120, %cmp3.i45.i.i121
  %z2.0.i47.i.i123 = zext i1 %or.cond.i46.i.i122 to i32
  %factor = shl nuw nsw i32 %shr.i66.i.i110, 1
  %add4.i48.i.i125 = add i32 %z2.0.i60.i.i116, %mul5.i.i109
  %add5.i49.i.i126 = add i32 %add4.i48.i.i125, %z2.0.i47.i.i123
  %add4.i.i.i127 = add i32 %add5.i49.i.i126, %factor
  %shr.i91 = lshr i32 %add.i43.i.i119, 5
  %shl.i92 = shl i32 %add4.i.i.i127, 27
  %or.i93 = or i32 %shl.i92, %shr.i91
  %shr7.i94 = ashr i32 %add4.i.i.i127, 5
  %tobool.i82 = icmp slt i32 %shr7.i94, 0
  %cmp.i83 = icmp eq i32 %shr7.i94, -1
  %cmp5.i86 = icmp eq i32 %shr7.i94, 0
  %cmp.i83.sink = select i1 %tobool.i82, i1 %cmp.i83, i1 %cmp5.i86
  %x.coerce1..i84 = select i1 %cmp.i83.sink, i32 %or.i93, i32 0
  %shr22 = ashr i32 %add15.lcssa, 12
  %ispos.i48 = icmp sgt i32 %shr22, -1
  %neg.i49 = sub nsw i32 0, %shr22
  %7 = select i1 %ispos.i48, i32 %shr22, i32 %neg.i49
  %and.i.i52 = and i32 %7, 65535
  %shr.i.i53 = lshr i32 %7, 16
  %mul.i.i56 = mul nuw i32 %and.i.i52, %and.i.i52
  %mul3.i.i57 = mul nuw i32 %shr.i.i53, %and.i.i52
  %mul5.i.i59 = mul nuw i32 %shr.i.i53, %shr.i.i53
  %shr.i66.i.i60 = lshr i32 %mul3.i.i57, 16
  %shl7.i68.i.i61 = shl i32 %mul3.i.i57, 16
  %add.i56.i.i62 = add i32 %shl7.i68.i.i61, %mul.i.i56
  %cmp.i57.i.i63 = icmp ult i32 %add.i56.i.i62, %mul.i.i56
  %cmp3.i58.i.i64 = icmp ult i32 %add.i56.i.i62, %shl7.i68.i.i61
  %or.cond.i59.i.i65 = or i1 %cmp.i57.i.i63, %cmp3.i58.i.i64
  %z2.0.i60.i.i66 = zext i1 %or.cond.i59.i.i65 to i32
  %add.i43.i.i69 = add i32 %add.i56.i.i62, %shl7.i68.i.i61
  %cmp.i44.i.i70 = icmp ult i32 %add.i43.i.i69, %add.i56.i.i62
  %cmp3.i45.i.i71 = icmp ult i32 %add.i43.i.i69, %shl7.i68.i.i61
  %or.cond.i46.i.i72 = or i1 %cmp.i44.i.i70, %cmp3.i45.i.i71
  %z2.0.i47.i.i73 = zext i1 %or.cond.i46.i.i72 to i32
  %factor210 = shl nuw nsw i32 %shr.i66.i.i60, 1
  %add4.i48.i.i75 = add i32 %z2.0.i60.i.i66, %mul5.i.i59
  %add5.i49.i.i76 = add i32 %add4.i48.i.i75, %z2.0.i47.i.i73
  %add4.i.i.i77 = add i32 %add5.i49.i.i76, %factor210
  %shr.i = lshr i32 %add.i43.i.i69, 5
  %shl.i = shl i32 %add4.i.i.i77, 27
  %or.i = or i32 %shl.i, %shr.i
  %shr7.i = ashr i32 %add4.i.i.i77, 5
  %tobool.i44 = icmp slt i32 %shr7.i, 0
  %cmp.i = icmp eq i32 %shr7.i, -1
  %cmp5.i = icmp eq i32 %shr7.i, 0
  %cmp.i.sink = select i1 %tobool.i44, i1 %cmp.i, i1 %cmp5.i
  %x.coerce1..i = select i1 %cmp.i.sink, i32 %or.i, i32 0
  %add25 = add nsw i32 %x.coerce1..i, %x.coerce1..i84
  %arrayidx27 = getelementptr inbounds [24 x i32], [24 x i32]* %powers, i32 %w.0214, i32 0
  store i32 %add25, i32* %arrayidx27, align 4, !tbaa !4
  %inc29 = add nuw nsw i32 %w.0214, 1
  %exitcond215 = icmp eq i32 %inc29, 4
  br i1 %exitcond215, label %for.end30, label %for.cond1.preheader

for.end30:                                        ; preds = %for.end
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

attributes #0 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
