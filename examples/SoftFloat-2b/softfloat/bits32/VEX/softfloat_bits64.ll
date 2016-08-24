; ModuleID = 'softfloat.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@float_rounding_mode = global i32 0, align 4
@float_exception_flags = global i32 0, align 4
@float_detect_tininess = global i32 1, align 4
@countLeadingZeros32.countLeadingZerosHigh = internal unnamed_addr constant [256 x i32] [i32 8, i32 7, i32 6, i32 6, i32 5, i32 5, i32 5, i32 5, i32 4, i32 4, i32 4, i32 4, i32 4, i32 4, i32 4, i32 4, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], align 16
@estimateSqrt32.sqrtOddAdjustments = internal unnamed_addr constant [16 x i16] [i16 4, i16 34, i16 93, i16 177, i16 285, i16 415, i16 566, i16 736, i16 924, i16 1128, i16 1349, i16 1585, i16 1835, i16 2098, i16 2374, i16 2663], align 16
@estimateSqrt32.sqrtEvenAdjustments = internal unnamed_addr constant [16 x i16] [i16 2605, i16 2223, i16 1882, i16 1577, i16 1306, i16 1065, i16 854, i16 670, i16 512, i16 377, i16 265, i16 175, i16 104, i16 52, i16 18, i16 2], align 16

; Function Attrs: inlinehint noimplicitfloat nounwind uwtable
define void @shift32RightJamming(i32 %a, i32 %count, i32* nocapture %zPtr) #0 {
entry:
  %cmp = icmp eq i32 %count, 0
  br i1 %cmp, label %if.end.7, label %if.else

if.else:                                          ; preds = %entry
  %cmp1 = icmp slt i32 %count, 32
  br i1 %cmp1, label %if.then.2, label %if.else.4

if.then.2:                                        ; preds = %if.else
  %shr = lshr i32 %a, %count
  %sub = sub nsw i32 0, %count
  %and = and i32 %sub, 31
  %shl = shl i32 %a, %and
  %cmp3 = icmp ne i32 %shl, 0
  %conv = zext i1 %cmp3 to i32
  %or = or i32 %conv, %shr
  br label %if.end.7

if.else.4:                                        ; preds = %if.else
  %cmp5 = icmp ne i32 %a, 0
  %conv6 = zext i1 %cmp5 to i32
  br label %if.end.7

if.end.7:                                         ; preds = %entry, %if.then.2, %if.else.4
  %z.0 = phi i32 [ %or, %if.then.2 ], [ %conv6, %if.else.4 ], [ %a, %entry ]
  store i32 %z.0, i32* %zPtr, align 4, !tbaa !1
  ret void
}

; Function Attrs: inlinehint noimplicitfloat nounwind uwtable
define void @shift64Right(i32 %a0, i32 %a1, i32 %count, i32* nocapture %z0Ptr, i32* nocapture %z1Ptr) #0 {
entry:
  %sub = sub nsw i32 0, %count
  %and = and i32 %sub, 31
  %cmp = icmp eq i32 %count, 0
  br i1 %cmp, label %if.end.8, label %if.else

if.else:                                          ; preds = %entry
  %cmp1 = icmp slt i32 %count, 32
  br i1 %cmp1, label %if.then.2, label %if.else.4

if.then.2:                                        ; preds = %if.else
  %shl = shl i32 %a0, %and
  %shr = lshr i32 %a1, %count
  %or = or i32 %shl, %shr
  %shr3 = lshr i32 %a0, %count
  br label %if.end.8

if.else.4:                                        ; preds = %if.else
  %cmp5 = icmp slt i32 %count, 64
  %and6 = and i32 %count, 31
  %shr7 = lshr i32 %a0, %and6
  %cond = select i1 %cmp5, i32 %shr7, i32 0
  br label %if.end.8

if.end.8:                                         ; preds = %if.else.4, %entry, %if.then.2
  %z1.0 = phi i32 [ %or, %if.then.2 ], [ %a1, %entry ], [ %cond, %if.else.4 ]
  %z0.0 = phi i32 [ %shr3, %if.then.2 ], [ %a0, %entry ], [ 0, %if.else.4 ]
  store i32 %z1.0, i32* %z1Ptr, align 4, !tbaa !1
  store i32 %z0.0, i32* %z0Ptr, align 4, !tbaa !1
  ret void
}

; Function Attrs: inlinehint noimplicitfloat nounwind uwtable
define void @shift64RightJamming(i32 %a0, i32 %a1, i32 %count, i32* nocapture %z0Ptr, i32* nocapture %z1Ptr) #0 {
entry:
  %sub = sub nsw i32 0, %count
  %and = and i32 %sub, 31
  %cmp = icmp eq i32 %count, 0
  br i1 %cmp, label %if.end.31, label %if.else

if.else:                                          ; preds = %entry
  %cmp1 = icmp slt i32 %count, 32
  br i1 %cmp1, label %if.then.2, label %if.else.7

if.then.2:                                        ; preds = %if.else
  %shl = shl i32 %a0, %and
  %shr = lshr i32 %a1, %count
  %or = or i32 %shl, %shr
  %shl3 = shl i32 %a1, %and
  %cmp4 = icmp ne i32 %shl3, 0
  %conv = zext i1 %cmp4 to i32
  %or5 = or i32 %or, %conv
  %shr6 = lshr i32 %a0, %count
  br label %if.end.31

if.else.7:                                        ; preds = %if.else
  %cmp8 = icmp eq i32 %count, 32
  br i1 %cmp8, label %if.then.10, label %if.else.14

if.then.10:                                       ; preds = %if.else.7
  %cmp11 = icmp ne i32 %a1, 0
  %conv12 = zext i1 %cmp11 to i32
  %or13 = or i32 %conv12, %a0
  br label %if.end.31

if.else.14:                                       ; preds = %if.else.7
  %cmp15 = icmp slt i32 %count, 64
  br i1 %cmp15, label %if.then.17, label %if.else.25

if.then.17:                                       ; preds = %if.else.14
  %and18 = and i32 %count, 31
  %shr19 = lshr i32 %a0, %and18
  %shl20 = shl i32 %a0, %and
  %or21 = or i32 %shl20, %a1
  %cmp22 = icmp ne i32 %or21, 0
  %conv23 = zext i1 %cmp22 to i32
  %or24 = or i32 %conv23, %shr19
  br label %if.end.31

if.else.25:                                       ; preds = %if.else.14
  %or26 = or i32 %a1, %a0
  %cmp27 = icmp ne i32 %or26, 0
  %conv28 = zext i1 %cmp27 to i32
  br label %if.end.31

if.end.31:                                        ; preds = %if.then.10, %if.else.25, %if.then.17, %entry, %if.then.2
  %z1.1 = phi i32 [ %or5, %if.then.2 ], [ %a1, %entry ], [ %or13, %if.then.10 ], [ %or24, %if.then.17 ], [ %conv28, %if.else.25 ]
  %z0.0 = phi i32 [ %shr6, %if.then.2 ], [ %a0, %entry ], [ 0, %if.then.10 ], [ 0, %if.then.17 ], [ 0, %if.else.25 ]
  store i32 %z1.1, i32* %z1Ptr, align 4, !tbaa !1
  store i32 %z0.0, i32* %z0Ptr, align 4, !tbaa !1
  ret void
}

; Function Attrs: inlinehint noimplicitfloat nounwind uwtable
define void @shift64ExtraRightJamming(i32 %a0, i32 %a1, i32 %a2, i32 %count, i32* nocapture %z0Ptr, i32* nocapture %z1Ptr, i32* nocapture %z2Ptr) #0 {
entry:
  %sub = sub nsw i32 0, %count
  %and = and i32 %sub, 31
  %cmp = icmp eq i32 %count, 0
  br i1 %cmp, label %if.end.23, label %if.else

if.else:                                          ; preds = %entry
  %cmp1 = icmp slt i32 %count, 32
  br i1 %cmp1, label %if.then.2, label %if.else.5

if.then.2:                                        ; preds = %if.else
  %shl = shl i32 %a1, %and
  %shl3 = shl i32 %a0, %and
  %shr = lshr i32 %a1, %count
  %or = or i32 %shl3, %shr
  %shr4 = lshr i32 %a0, %count
  br label %if.end.19

if.else.5:                                        ; preds = %if.else
  %cmp6 = icmp eq i32 %count, 32
  br i1 %cmp6, label %if.end.19, label %if.else.8

if.else.8:                                        ; preds = %if.else.5
  %or9 = or i32 %a2, %a1
  %cmp10 = icmp slt i32 %count, 64
  br i1 %cmp10, label %if.then.11, label %if.else.15

if.then.11:                                       ; preds = %if.else.8
  %shl12 = shl i32 %a0, %and
  %and13 = and i32 %count, 31
  %shr14 = lshr i32 %a0, %and13
  br label %if.end.19

if.else.15:                                       ; preds = %if.else.8
  %cmp16 = icmp eq i32 %count, 64
  %cmp17 = icmp ne i32 %a0, 0
  %conv = zext i1 %cmp17 to i32
  %cond = select i1 %cmp16, i32 %a0, i32 %conv
  br label %if.end.19

if.end.19:                                        ; preds = %if.else.15, %if.then.11, %if.else.5, %if.then.2
  %z0.0 = phi i32 [ %shr4, %if.then.2 ], [ 0, %if.else.5 ], [ 0, %if.then.11 ], [ 0, %if.else.15 ]
  %z1.1 = phi i32 [ %or, %if.then.2 ], [ %a0, %if.else.5 ], [ %shr14, %if.then.11 ], [ 0, %if.else.15 ]
  %z2.1 = phi i32 [ %shl, %if.then.2 ], [ %a1, %if.else.5 ], [ %shl12, %if.then.11 ], [ %cond, %if.else.15 ]
  %a2.addr.1 = phi i32 [ %a2, %if.then.2 ], [ %a2, %if.else.5 ], [ %or9, %if.then.11 ], [ %or9, %if.else.15 ]
  %cmp20 = icmp ne i32 %a2.addr.1, 0
  %conv21 = zext i1 %cmp20 to i32
  %or22 = or i32 %conv21, %z2.1
  br label %if.end.23

if.end.23:                                        ; preds = %entry, %if.end.19
  %z0.1 = phi i32 [ %z0.0, %if.end.19 ], [ %a0, %entry ]
  %z1.2 = phi i32 [ %z1.1, %if.end.19 ], [ %a1, %entry ]
  %z2.2 = phi i32 [ %or22, %if.end.19 ], [ %a2, %entry ]
  store i32 %z2.2, i32* %z2Ptr, align 4, !tbaa !1
  store i32 %z1.2, i32* %z1Ptr, align 4, !tbaa !1
  store i32 %z0.1, i32* %z0Ptr, align 4, !tbaa !1
  ret void
}

; Function Attrs: inlinehint noimplicitfloat nounwind uwtable
define void @shortShift64Left(i32 %a0, i32 %a1, i32 %count, i32* nocapture %z0Ptr, i32* nocapture %z1Ptr) #0 {
entry:
  %shl = shl i32 %a1, %count
  store i32 %shl, i32* %z1Ptr, align 4, !tbaa !1
  %cmp = icmp eq i32 %count, 0
  br i1 %cmp, label %cond.end, label %cond.false

cond.false:                                       ; preds = %entry
  %shl1 = shl i32 %a0, %count
  %sub = sub nsw i32 0, %count
  %and = and i32 %sub, 31
  %shr = lshr i32 %a1, %and
  %or = or i32 %shr, %shl1
  br label %cond.end

cond.end:                                         ; preds = %entry, %cond.false
  %cond = phi i32 [ %or, %cond.false ], [ %a0, %entry ]
  store i32 %cond, i32* %z0Ptr, align 4, !tbaa !1
  ret void
}

; Function Attrs: inlinehint noimplicitfloat nounwind uwtable
define void @shortShift96Left(i32 %a0, i32 %a1, i32 %a2, i32 %count, i32* nocapture %z0Ptr, i32* nocapture %z1Ptr, i32* nocapture %z2Ptr) #0 {
entry:
  %shl = shl i32 %a2, %count
  %shl1 = shl i32 %a1, %count
  %shl2 = shl i32 %a0, %count
  %cmp = icmp sgt i32 %count, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %sub = sub nsw i32 0, %count
  %and = and i32 %sub, 31
  %shr = lshr i32 %a2, %and
  %or = or i32 %shr, %shl1
  %shr3 = lshr i32 %a1, %and
  %or4 = or i32 %shr3, %shl2
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %z1.0 = phi i32 [ %or, %if.then ], [ %shl1, %entry ]
  %z0.0 = phi i32 [ %or4, %if.then ], [ %shl2, %entry ]
  store i32 %shl, i32* %z2Ptr, align 4, !tbaa !1
  store i32 %z1.0, i32* %z1Ptr, align 4, !tbaa !1
  store i32 %z0.0, i32* %z0Ptr, align 4, !tbaa !1
  ret void
}

; Function Attrs: inlinehint noimplicitfloat nounwind uwtable
define void @add64(i32 %a0, i32 %a1, i32 %b0, i32 %b1, i32* nocapture %z0Ptr, i32* nocapture %z1Ptr) #0 {
entry:
  %add = add i32 %b1, %a1
  store i32 %add, i32* %z1Ptr, align 4, !tbaa !1
  %add1 = add i32 %b0, %a0
  %cmp = icmp ult i32 %add, %a1
  %conv = zext i1 %cmp to i32
  %add2 = add i32 %add1, %conv
  store i32 %add2, i32* %z0Ptr, align 4, !tbaa !1
  ret void
}

; Function Attrs: inlinehint noimplicitfloat nounwind uwtable
define void @add96(i32 %a0, i32 %a1, i32 %a2, i32 %b0, i32 %b1, i32 %b2, i32* nocapture %z0Ptr, i32* nocapture %z1Ptr, i32* nocapture %z2Ptr) #0 {
entry:
  %add = add i32 %b2, %a2
  %cmp = icmp ult i32 %add, %a2
  %conv = zext i1 %cmp to i32
  %add1 = add i32 %b1, %a1
  %cmp2 = icmp ult i32 %add1, %a1
  %conv3 = zext i1 %cmp2 to i32
  %add4 = add i32 %b0, %a0
  %add5 = add i32 %conv, %add1
  %cmp6 = icmp ult i32 %add5, %conv
  %conv7 = zext i1 %cmp6 to i32
  %add8 = add i32 %add4, %conv3
  %add9 = add i32 %add8, %conv7
  store i32 %add, i32* %z2Ptr, align 4, !tbaa !1
  store i32 %add5, i32* %z1Ptr, align 4, !tbaa !1
  store i32 %add9, i32* %z0Ptr, align 4, !tbaa !1
  ret void
}

; Function Attrs: inlinehint noimplicitfloat nounwind uwtable
define void @sub64(i32 %a0, i32 %a1, i32 %b0, i32 %b1, i32* nocapture %z0Ptr, i32* nocapture %z1Ptr) #0 {
entry:
  %sub = sub i32 %a1, %b1
  store i32 %sub, i32* %z1Ptr, align 4, !tbaa !1
  %sub1 = sub i32 %a0, %b0
  %cmp = icmp ult i32 %a1, %b1
  %conv.neg = sext i1 %cmp to i32
  %sub2 = add i32 %sub1, %conv.neg
  store i32 %sub2, i32* %z0Ptr, align 4, !tbaa !1
  ret void
}

; Function Attrs: inlinehint noimplicitfloat nounwind uwtable
define void @sub96(i32 %a0, i32 %a1, i32 %a2, i32 %b0, i32 %b1, i32 %b2, i32* nocapture %z0Ptr, i32* nocapture %z1Ptr, i32* nocapture %z2Ptr) #0 {
entry:
  %sub = sub i32 %a2, %b2
  %cmp = icmp ult i32 %a2, %b2
  %conv = zext i1 %cmp to i32
  %sub1 = sub i32 %a1, %b1
  %cmp2 = icmp ult i32 %a1, %b1
  %sub4 = sub i32 %a0, %b0
  %cmp5 = icmp ult i32 %sub1, %conv
  %conv6.neg = sext i1 %cmp5 to i32
  %sub8 = sub i32 %sub1, %conv
  %conv3.neg = sext i1 %cmp2 to i32
  %sub7 = add i32 %sub4, %conv3.neg
  %sub9 = add i32 %sub7, %conv6.neg
  store i32 %sub, i32* %z2Ptr, align 4, !tbaa !1
  store i32 %sub8, i32* %z1Ptr, align 4, !tbaa !1
  store i32 %sub9, i32* %z0Ptr, align 4, !tbaa !1
  ret void
}

; Function Attrs: inlinehint noimplicitfloat nounwind uwtable
define void @mul32To64(i32 %a, i32 %b, i32* nocapture %z0Ptr, i32* nocapture %z1Ptr) #0 {
entry:
  %shr = lshr i32 %a, 16
  %shr3 = lshr i32 %b, 16
  %conv5 = and i32 %a, 65535
  %conv6 = and i32 %b, 65535
  %mul = mul nuw i32 %conv6, %conv5
  %mul9 = mul nuw i32 %shr3, %conv5
  %mul12 = mul nuw i32 %conv6, %shr
  %mul15 = mul nuw i32 %shr3, %shr
  %add = add i32 %mul9, %mul12
  %cmp = icmp ult i32 %add, %mul12
  %conv16 = zext i1 %cmp to i32
  %shl = shl nuw nsw i32 %conv16, 16
  %shr17 = lshr i32 %add, 16
  %add18 = or i32 %shl, %shr17
  %add19 = add i32 %add18, %mul15
  %shl20 = shl i32 %add, 16
  %add21 = add i32 %shl20, %mul
  %cmp22 = icmp ult i32 %add21, %shl20
  %conv23 = zext i1 %cmp22 to i32
  %add24 = add i32 %add19, %conv23
  store i32 %add21, i32* %z1Ptr, align 4, !tbaa !1
  store i32 %add24, i32* %z0Ptr, align 4, !tbaa !1
  ret void
}

; Function Attrs: inlinehint noimplicitfloat nounwind uwtable
define void @mul64By32To96(i32 %a0, i32 %a1, i32 %b, i32* nocapture %z0Ptr, i32* nocapture %z1Ptr, i32* nocapture %z2Ptr) #0 {
entry:
  %shr.i = lshr i32 %a1, 16
  %shr3.i = lshr i32 %b, 16
  %conv5.i = and i32 %a1, 65535
  %conv6.i = and i32 %b, 65535
  %mul.i = mul nuw i32 %conv6.i, %conv5.i
  %mul9.i = mul nuw i32 %shr3.i, %conv5.i
  %mul12.i = mul nuw i32 %conv6.i, %shr.i
  %mul15.i = mul nuw i32 %shr3.i, %shr.i
  %add.i = add i32 %mul9.i, %mul12.i
  %cmp.i = icmp ult i32 %add.i, %mul12.i
  %conv16.i = zext i1 %cmp.i to i32
  %shl.i = shl nuw nsw i32 %conv16.i, 16
  %shr17.i = lshr i32 %add.i, 16
  %add18.i = or i32 %shl.i, %shr17.i
  %shl20.i = shl i32 %add.i, 16
  %add21.i = add i32 %shl20.i, %mul.i
  %cmp22.i = icmp ult i32 %add21.i, %shl20.i
  %conv23.i = zext i1 %cmp22.i to i32
  %shr.i.4 = lshr i32 %a0, 16
  %conv5.i.6 = and i32 %a0, 65535
  %mul.i.8 = mul nuw i32 %conv6.i, %conv5.i.6
  %mul9.i.9 = mul nuw i32 %shr3.i, %conv5.i.6
  %mul12.i.10 = mul nuw i32 %conv6.i, %shr.i.4
  %mul15.i.11 = mul nuw i32 %shr3.i, %shr.i.4
  %add.i.12 = add i32 %mul9.i.9, %mul12.i.10
  %cmp.i.13 = icmp ult i32 %add.i.12, %mul12.i.10
  %conv16.i.14 = zext i1 %cmp.i.13 to i32
  %shl.i.15 = shl nuw nsw i32 %conv16.i.14, 16
  %shr17.i.16 = lshr i32 %add.i.12, 16
  %add18.i.17 = or i32 %shl.i.15, %shr17.i.16
  %add19.i.18 = add i32 %add18.i.17, %mul15.i.11
  %shl20.i.19 = shl i32 %add.i.12, 16
  %add21.i.20 = add i32 %shl20.i.19, %mul.i.8
  %cmp22.i.21 = icmp ult i32 %add21.i.20, %shl20.i.19
  %conv23.i.22 = zext i1 %cmp22.i.21 to i32
  %add24.i.23 = add i32 %add19.i.18, %conv23.i.22
  %add19.i = add i32 %add21.i.20, %mul15.i
  %add24.i = add i32 %add19.i, %add18.i
  %add.i.2 = add i32 %add24.i, %conv23.i
  %cmp.i.3 = icmp ult i32 %add.i.2, %add21.i.20
  %conv.i = zext i1 %cmp.i.3 to i32
  %add2.i = add i32 %add24.i.23, %conv.i
  store i32 %add21.i, i32* %z2Ptr, align 4, !tbaa !1
  store i32 %add.i.2, i32* %z1Ptr, align 4, !tbaa !1
  store i32 %add2.i, i32* %z0Ptr, align 4, !tbaa !1
  ret void
}

; Function Attrs: inlinehint noimplicitfloat nounwind uwtable
define void @mul64To128(i32 %a0, i32 %a1, i32 %b0, i32 %b1, i32* nocapture %z0Ptr, i32* nocapture %z1Ptr, i32* nocapture %z2Ptr, i32* nocapture %z3Ptr) #0 {
entry:
  %shr.i = lshr i32 %a1, 16
  %shr3.i = lshr i32 %b1, 16
  %conv5.i = and i32 %a1, 65535
  %conv6.i = and i32 %b1, 65535
  %mul.i = mul nuw i32 %conv6.i, %conv5.i
  %mul9.i = mul nuw i32 %shr3.i, %conv5.i
  %mul12.i = mul nuw i32 %conv6.i, %shr.i
  %mul15.i = mul nuw i32 %shr3.i, %shr.i
  %add.i = add i32 %mul9.i, %mul12.i
  %cmp.i = icmp ult i32 %add.i, %mul12.i
  %conv16.i = zext i1 %cmp.i to i32
  %shl.i = shl nuw nsw i32 %conv16.i, 16
  %shr17.i = lshr i32 %add.i, 16
  %add18.i = or i32 %shl.i, %shr17.i
  %shl20.i = shl i32 %add.i, 16
  %add21.i = add i32 %shl20.i, %mul.i
  %cmp22.i = icmp ult i32 %add21.i, %shl20.i
  %conv23.i = zext i1 %cmp22.i to i32
  %shr3.i.60 = lshr i32 %b0, 16
  %conv6.i.62 = and i32 %b0, 65535
  %mul.i.63 = mul nuw i32 %conv6.i.62, %conv5.i
  %mul9.i.64 = mul nuw i32 %shr3.i.60, %conv5.i
  %mul12.i.65 = mul nuw i32 %conv6.i.62, %shr.i
  %mul15.i.66 = mul nuw i32 %shr3.i.60, %shr.i
  %add.i.67 = add i32 %mul9.i.64, %mul12.i.65
  %cmp.i.68 = icmp ult i32 %add.i.67, %mul12.i.65
  %conv16.i.69 = zext i1 %cmp.i.68 to i32
  %shl.i.70 = shl nuw nsw i32 %conv16.i.69, 16
  %shr17.i.71 = lshr i32 %add.i.67, 16
  %add18.i.72 = or i32 %shl.i.70, %shr17.i.71
  %shl20.i.74 = shl i32 %add.i.67, 16
  %add21.i.75 = add i32 %shl20.i.74, %mul.i.63
  %cmp22.i.76 = icmp ult i32 %add21.i.75, %shl20.i.74
  %conv23.i.77 = zext i1 %cmp22.i.76 to i32
  %add19.i = add i32 %add21.i.75, %mul15.i
  %add24.i = add i32 %add19.i, %add18.i
  %add.i.55 = add i32 %add24.i, %conv23.i
  %cmp.i.56 = icmp ult i32 %add.i.55, %add21.i.75
  %conv.i.57 = zext i1 %cmp.i.56 to i32
  %shr.i.35 = lshr i32 %a0, 16
  %conv5.i.37 = and i32 %a0, 65535
  %mul.i.39 = mul nuw i32 %conv6.i.62, %conv5.i.37
  %mul9.i.40 = mul nuw i32 %shr3.i.60, %conv5.i.37
  %mul12.i.41 = mul nuw i32 %conv6.i.62, %shr.i.35
  %mul15.i.42 = mul nuw i32 %shr3.i.60, %shr.i.35
  %add.i.43 = add i32 %mul9.i.40, %mul12.i.41
  %cmp.i.44 = icmp ult i32 %add.i.43, %mul12.i.41
  %conv16.i.45 = zext i1 %cmp.i.44 to i32
  %shl.i.46 = shl nuw nsw i32 %conv16.i.45, 16
  %shr17.i.47 = lshr i32 %add.i.43, 16
  %add18.i.48 = or i32 %shl.i.46, %shr17.i.47
  %add19.i.49 = add i32 %add18.i.48, %mul15.i.42
  %shl20.i.50 = shl i32 %add.i.43, 16
  %add21.i.51 = add i32 %shl20.i.50, %mul.i.39
  %cmp22.i.52 = icmp ult i32 %add21.i.51, %shl20.i.50
  %conv23.i.53 = zext i1 %cmp22.i.52 to i32
  %add24.i.54 = add i32 %add19.i.49, %conv23.i.53
  %add19.i.73 = add i32 %add21.i.51, %mul15.i.66
  %add24.i.78 = add i32 %add19.i.73, %add18.i.72
  %add2.i.58 = add i32 %add24.i.78, %conv23.i.77
  %add.i.31 = add i32 %add2.i.58, %conv.i.57
  %cmp.i.32 = icmp ult i32 %add.i.31, %add21.i.51
  %conv.i.33 = zext i1 %cmp.i.32 to i32
  %add2.i.34 = add i32 %add24.i.54, %conv.i.33
  %mul.i.15 = mul nuw i32 %conv6.i, %conv5.i.37
  %mul9.i.16 = mul nuw i32 %shr3.i, %conv5.i.37
  %mul12.i.17 = mul nuw i32 %conv6.i, %shr.i.35
  %mul15.i.18 = mul nuw i32 %shr3.i, %shr.i.35
  %add.i.19 = add i32 %mul9.i.16, %mul12.i.17
  %cmp.i.20 = icmp ult i32 %add.i.19, %mul12.i.17
  %conv16.i.21 = zext i1 %cmp.i.20 to i32
  %shl.i.22 = shl nuw nsw i32 %conv16.i.21, 16
  %shr17.i.23 = lshr i32 %add.i.19, 16
  %add18.i.24 = or i32 %shl.i.22, %shr17.i.23
  %add19.i.25 = add i32 %add18.i.24, %mul15.i.18
  %shl20.i.26 = shl i32 %add.i.19, 16
  %add21.i.27 = add i32 %shl20.i.26, %mul.i.15
  %cmp22.i.28 = icmp ult i32 %add21.i.27, %shl20.i.26
  %conv23.i.29 = zext i1 %cmp22.i.28 to i32
  %add24.i.30 = add i32 %add19.i.25, %conv23.i.29
  %add.i.7 = add i32 %add.i.55, %add21.i.27
  %cmp.i.8 = icmp ult i32 %add.i.7, %add21.i.27
  %conv.i.9 = zext i1 %cmp.i.8 to i32
  %add2.i.10 = add i32 %add24.i.30, %conv.i.9
  %add.i.5 = add i32 %add2.i.10, %add.i.31
  %cmp.i.6 = icmp ult i32 %add.i.5, %add.i.31
  %conv.i = zext i1 %cmp.i.6 to i32
  %add2.i = add i32 %add2.i.34, %conv.i
  store i32 %add21.i, i32* %z3Ptr, align 4, !tbaa !1
  store i32 %add.i.7, i32* %z2Ptr, align 4, !tbaa !1
  store i32 %add.i.5, i32* %z1Ptr, align 4, !tbaa !1
  store i32 %add2.i, i32* %z0Ptr, align 4, !tbaa !1
  ret void
}

; Function Attrs: inlinehint noimplicitfloat nounwind readnone uwtable
define i32 @eq64(i32 %a0, i32 %a1, i32 %b0, i32 %b1) #1 {
entry:
  %cmp = icmp eq i32 %a0, %b0
  %cmp1 = icmp eq i32 %a1, %b1
  %cmp1. = and i1 %cmp, %cmp1
  %land.ext = zext i1 %cmp1. to i32
  ret i32 %land.ext
}

; Function Attrs: inlinehint noimplicitfloat nounwind readnone uwtable
define i32 @le64(i32 %a0, i32 %a1, i32 %b0, i32 %b1) #1 {
entry:
  %cmp = icmp ult i32 %a0, %b0
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %cmp1 = icmp eq i32 %a0, %b0
  %cmp2 = icmp ule i32 %a1, %b1
  %cmp2. = and i1 %cmp1, %cmp2
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %0 = phi i1 [ true, %entry ], [ %cmp2., %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  ret i32 %lor.ext
}

; Function Attrs: inlinehint noimplicitfloat nounwind readnone uwtable
define i32 @lt64(i32 %a0, i32 %a1, i32 %b0, i32 %b1) #1 {
entry:
  %cmp = icmp ult i32 %a0, %b0
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %cmp1 = icmp eq i32 %a0, %b0
  %cmp2 = icmp ult i32 %a1, %b1
  %cmp2. = and i1 %cmp1, %cmp2
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %0 = phi i1 [ true, %entry ], [ %cmp2., %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  ret i32 %lor.ext
}

; Function Attrs: inlinehint noimplicitfloat nounwind readnone uwtable
define i32 @ne64(i32 %a0, i32 %a1, i32 %b0, i32 %b1) #1 {
entry:
  %cmp1 = icmp ne i32 %a1, %b1
  %not.cmp = icmp ne i32 %a0, %b0
  %cmp1. = or i1 %not.cmp, %cmp1
  %lor.ext = zext i1 %cmp1. to i32
  ret i32 %lor.ext
}

; Function Attrs: noimplicitfloat nounwind uwtable
define void @float_raise(i32 %flags) #2 {
entry:
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or = or i32 %0, %flags
  store i32 %or, i32* @float_exception_flags, align 4, !tbaa !1
  ret void
}

; Function Attrs: noimplicitfloat nounwind readnone uwtable
define i32 @float32_is_nan(i32 %a) #3 {
entry:
  %0 = trunc i32 %a to i31
  %cmp = icmp ugt i31 %0, -8388608
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

; Function Attrs: noimplicitfloat nounwind readnone uwtable
define i32 @float32_is_signaling_nan(i32 %a) #3 {
entry:
  %and = and i32 %a, 2143289344
  %cmp = icmp eq i32 %and, 2139095040
  %and1 = and i32 %a, 4194303
  %tobool = icmp ne i32 %and1, 0
  %0 = and i1 %cmp, %tobool
  %land.ext = zext i1 %0 to i32
  ret i32 %land.ext
}

; Function Attrs: noimplicitfloat nounwind readnone uwtable
define i32 @float64_is_nan(i64 %a.coerce) #3 {
entry:
  %a.sroa.2.0.extract.shift = lshr i64 %a.coerce, 32
  %shl4 = shl nuw nsw i64 %a.sroa.2.0.extract.shift, 1
  %shl = trunc i64 %shl4 to i32
  %cmp = icmp ugt i32 %shl, -2097153
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %a.sroa.0.0.extract.trunc = trunc i64 %a.coerce to i32
  %tobool = icmp eq i32 %a.sroa.0.0.extract.trunc, 0
  br i1 %tobool, label %lor.rhs, label %land.end

lor.rhs:                                          ; preds = %land.rhs
  %and = and i64 %a.sroa.2.0.extract.shift, 1048575
  %tobool2 = icmp ne i64 %and, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.rhs, %entry
  %0 = phi i1 [ false, %entry ], [ true, %land.rhs ], [ %tobool2, %lor.rhs ]
  %land.ext = zext i1 %0 to i32
  ret i32 %land.ext
}

; Function Attrs: noimplicitfloat nounwind readnone uwtable
define i32 @float64_is_signaling_nan(i64 %a.coerce) #3 {
entry:
  %and = and i64 %a.coerce, 9221120237041090560
  %cmp = icmp eq i64 %and, 9218868437227405312
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %a.sroa.0.0.extract.trunc = trunc i64 %a.coerce to i32
  %tobool = icmp eq i32 %a.sroa.0.0.extract.trunc, 0
  br i1 %tobool, label %lor.rhs, label %land.end

lor.rhs:                                          ; preds = %land.rhs
  %and2 = and i64 %a.coerce, 2251795518717952
  %tobool3 = icmp ne i64 %and2, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.rhs, %entry
  %0 = phi i1 [ false, %entry ], [ true, %land.rhs ], [ %tobool3, %lor.rhs ]
  %land.ext = zext i1 %0 to i32
  ret i32 %land.ext
}

; Function Attrs: inlinehint noimplicitfloat nounwind readnone uwtable
define i32 @extractFloat32Frac(i32 %a) #1 {
entry:
  %and = and i32 %a, 8388607
  ret i32 %and
}

; Function Attrs: inlinehint noimplicitfloat nounwind readnone uwtable
define i32 @extractFloat32Exp(i32 %a) #1 {
entry:
  %shr = lshr i32 %a, 23
  %and = and i32 %shr, 255
  ret i32 %and
}

; Function Attrs: inlinehint noimplicitfloat nounwind readnone uwtable
define i32 @extractFloat32Sign(i32 %a) #1 {
entry:
  %shr = lshr i32 %a, 31
  ret i32 %shr
}

; Function Attrs: inlinehint noimplicitfloat nounwind readnone uwtable
define i32 @packFloat32(i32 %zSign, i32 %zExp, i32 %zSig) #1 {
entry:
  %shl = shl i32 %zSign, 31
  %shl1 = shl i32 %zExp, 23
  %add = add i32 %shl1, %shl
  %add2 = add i32 %add, %zSig
  ret i32 %add2
}

; Function Attrs: inlinehint noimplicitfloat nounwind readnone uwtable
define i32 @extractFloat64Frac1(i64 %a.coerce) #1 {
entry:
  %a.sroa.0.0.extract.trunc = trunc i64 %a.coerce to i32
  ret i32 %a.sroa.0.0.extract.trunc
}

; Function Attrs: inlinehint noimplicitfloat nounwind readnone uwtable
define i32 @extractFloat64Frac0(i64 %a.coerce) #1 {
entry:
  %a.sroa.1.0.extract.shift = lshr i64 %a.coerce, 32
  %a.sroa.1.0.extract.trunc = trunc i64 %a.sroa.1.0.extract.shift to i32
  %and = and i32 %a.sroa.1.0.extract.trunc, 1048575
  ret i32 %and
}

; Function Attrs: inlinehint noimplicitfloat nounwind readnone uwtable
define i32 @extractFloat64Exp(i64 %a.coerce) #1 {
entry:
  %a.sroa.1.0.extract.shift = lshr i64 %a.coerce, 52
  %shr = trunc i64 %a.sroa.1.0.extract.shift to i32
  %and = and i32 %shr, 2047
  ret i32 %and
}

; Function Attrs: inlinehint noimplicitfloat nounwind readnone uwtable
define i32 @extractFloat64Sign(i64 %a.coerce) #1 {
entry:
  %a.sroa.1.0.extract.shift = lshr i64 %a.coerce, 63
  %shr = trunc i64 %a.sroa.1.0.extract.shift to i32
  ret i32 %shr
}

; Function Attrs: inlinehint noimplicitfloat nounwind readnone uwtable
define i64 @packFloat64(i32 %zSign, i32 %zExp, i32 %zSig0, i32 %zSig1) #1 {
entry:
  %shl = shl i32 %zSign, 31
  %shl1 = shl i32 %zExp, 20
  %add = add i32 %shl1, %shl
  %add2 = add i32 %add, %zSig0
  %retval.sroa.2.0.insert.ext = zext i32 %add2 to i64
  %retval.sroa.2.0.insert.shift = shl nuw i64 %retval.sroa.2.0.insert.ext, 32
  %retval.sroa.0.0.insert.ext = zext i32 %zSig1 to i64
  %retval.sroa.0.0.insert.insert = or i64 %retval.sroa.2.0.insert.shift, %retval.sroa.0.0.insert.ext
  ret i64 %retval.sroa.0.0.insert.insert
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i32 @int32_to_float32(i32 %a) #2 {
entry:
  switch i32 %a, label %if.end.3 [
    i32 0, label %cleanup
    i32 -2147483648, label %if.then.2
  ]

if.then.2:                                        ; preds = %entry
  br label %cleanup

if.end.3:                                         ; preds = %entry
  %cmp4 = icmp slt i32 %a, 0
  %a.lobit = lshr i32 %a, 31
  %sub = sub nsw i32 0, %a
  %cond = select i1 %cmp4, i32 %sub, i32 %a
  %cmp.i.i = icmp ult i32 %cond, 65536
  %shl.i.i = shl i32 %cond, 16
  %shl.a.i.i = select i1 %cmp.i.i, i32 %shl.i.i, i32 %cond
  %..i.i = select i1 %cmp.i.i, i32 16, i32 0
  %cmp1.i.i = icmp ult i32 %shl.a.i.i, 16777216
  %add3.i.i = or i32 %..i.i, 8
  %shl4.i.i = shl i32 %shl.a.i.i, 8
  %a.addr.1.i.i = select i1 %cmp1.i.i, i32 %shl4.i.i, i32 %shl.a.i.i
  %shiftCount.1.i.i = select i1 %cmp1.i.i, i32 %add3.i.i, i32 %..i.i
  %shr.i.i = lshr i32 %a.addr.1.i.i, 24
  %idxprom.i.i = zext i32 %shr.i.i to i64
  %arrayidx.i.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i64 0, i64 %idxprom.i.i
  %0 = load i32, i32* %arrayidx.i.i, align 4, !tbaa !1
  %add6.i.i = add nsw i32 %shiftCount.1.i.i, -1
  %sub.i = add i32 %add6.i.i, %0
  %sub1.i = sub nsw i32 156, %sub.i
  %shl.i = shl i32 %cond, %sub.i
  %call2.i = tail call fastcc i32 @roundAndPackFloat32(i32 %a.lobit, i32 %sub1.i, i32 %shl.i) #4
  br label %cleanup

cleanup:                                          ; preds = %entry, %if.end.3, %if.then.2
  %retval.0 = phi i32 [ -822083584, %if.then.2 ], [ %call2.i, %if.end.3 ], [ 0, %entry ]
  ret i32 %retval.0
}

; Function Attrs: noimplicitfloat nounwind readnone uwtable
define i64 @int32_to_float64(i32 %a) #3 {
entry:
  %cmp = icmp eq i32 %a, 0
  br i1 %cmp, label %cleanup, label %if.end

if.end:                                           ; preds = %entry
  %cmp1 = icmp slt i32 %a, 0
  %a.lobit = and i32 %a, -2147483648
  %sub = sub nsw i32 0, %a
  %cond = select i1 %cmp1, i32 %sub, i32 %a
  %cmp.i.25 = icmp ult i32 %cond, 65536
  %shl.i.26 = shl i32 %cond, 16
  %shl.a.i = select i1 %cmp.i.25, i32 %shl.i.26, i32 %cond
  %..i = select i1 %cmp.i.25, i32 16, i32 0
  %cmp1.i.27 = icmp ult i32 %shl.a.i, 16777216
  %add3.i = or i32 %..i, 8
  %shl4.i = shl i32 %shl.a.i, 8
  %a.addr.1.i = select i1 %cmp1.i.27, i32 %shl4.i, i32 %shl.a.i
  %shiftCount.1.i = select i1 %cmp1.i.27, i32 %add3.i, i32 %..i
  %shr.i = lshr i32 %a.addr.1.i, 24
  %idxprom.i = zext i32 %shr.i to i64
  %arrayidx.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i64 0, i64 %idxprom.i
  %0 = load i32, i32* %arrayidx.i, align 4, !tbaa !1
  %add6.i = add nsw i32 %0, %shiftCount.1.i
  %sub3 = add nsw i32 %add6.i, -11
  %cmp4 = icmp sgt i32 %sub3, -1
  br i1 %cmp4, label %if.then.6, label %if.else

if.then.6:                                        ; preds = %if.end
  %shl = shl i32 %cond, %sub3
  br label %if.end.8

if.else:                                          ; preds = %if.end
  %sub7 = sub i32 11, %add6.i
  %sub.i = sub nsw i32 0, %sub7
  %and.i = and i32 %sub.i, 31
  %cmp.i = icmp eq i32 %sub7, 0
  br i1 %cmp.i, label %if.end.8, label %if.else.i

if.else.i:                                        ; preds = %if.else
  %cmp1.i = icmp slt i32 %sub7, 32
  br i1 %cmp1.i, label %if.then.2.i, label %if.else.4.i

if.then.2.i:                                      ; preds = %if.else.i
  %shl.i.24 = shl i32 %cond, %and.i
  %shr3.i = lshr i32 %cond, %sub7
  br label %if.end.8

if.else.4.i:                                      ; preds = %if.else.i
  %cmp5.i = icmp slt i32 %sub7, 64
  %and6.i = and i32 %sub7, 31
  %shr7.i = lshr i32 %cond, %and6.i
  %cond.i = select i1 %cmp5.i, i32 %shr7.i, i32 0
  br label %if.end.8

if.end.8:                                         ; preds = %if.else.4.i, %if.then.2.i, %if.else, %if.then.6
  %zSig0.0 = phi i32 [ %shl, %if.then.6 ], [ %shr3.i, %if.then.2.i ], [ %cond, %if.else ], [ 0, %if.else.4.i ]
  %zSig1.0 = phi i32 [ 0, %if.then.6 ], [ %shl.i.24, %if.then.2.i ], [ 0, %if.else ], [ %cond.i, %if.else.4.i ]
  %sub9 = sub i32 1053, %add6.i
  %shl1.i = shl i32 %sub9, 20
  %add.i = add i32 %shl1.i, %a.lobit
  %add2.i = add i32 %add.i, %zSig0.0
  %retval.sroa.2.0.insert.ext.i = zext i32 %add2.i to i64
  %retval.sroa.2.0.insert.shift.i = shl nuw i64 %retval.sroa.2.0.insert.ext.i, 32
  %retval.sroa.0.0.insert.ext.i = zext i32 %zSig1.0 to i64
  %retval.sroa.0.0.insert.insert.i = or i64 %retval.sroa.2.0.insert.shift.i, %retval.sroa.0.0.insert.ext.i
  br label %cleanup

cleanup:                                          ; preds = %entry, %if.end.8
  %retval.sroa.0.0 = phi i64 [ %retval.sroa.0.0.insert.insert.i, %if.end.8 ], [ 0, %entry ]
  ret i64 %retval.sroa.0.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i32 @float32_to_int32(i32 %a) #2 {
entry:
  %and.i = and i32 %a, 8388607
  %shr.i.102 = lshr i32 %a, 23
  %and.i.103 = and i32 %shr.i.102, 255
  %shr.i = lshr i32 %a, 31
  %sub = add nsw i32 %and.i.103, -150
  %cmp = icmp sgt i32 %sub, -1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %cmp3 = icmp ugt i32 %and.i.103, 157
  br i1 %cmp3, label %if.then.4, label %if.end.11

if.then.4:                                        ; preds = %if.then
  %cmp5 = icmp eq i32 %a, -822083584
  br i1 %cmp5, label %if.end.10, label %if.then.6

if.then.6:                                        ; preds = %if.then.4
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %0, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  %tobool = icmp eq i32 %shr.i, 0
  br i1 %tobool, label %cleanup, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then.6
  %cmp7 = icmp eq i32 %and.i.103, 255
  %tobool8 = icmp ne i32 %and.i, 0
  %or.cond = and i1 %tobool8, %cmp7
  br i1 %or.cond, label %cleanup, label %if.end.10

if.end.10:                                        ; preds = %if.then.4, %lor.lhs.false
  br label %cleanup

if.end.11:                                        ; preds = %if.then
  %or = or i32 %and.i, 8388608
  %shl = shl i32 %or, %sub
  %tobool12 = icmp eq i32 %shr.i, 0
  %sub14 = sub nsw i32 0, %shl
  %shl.sub14 = select i1 %tobool12, i32 %shl, i32 %sub14
  br label %cleanup

if.else:                                          ; preds = %entry
  %cmp16 = icmp ult i32 %and.i.103, 126
  br i1 %cmp16, label %if.then.17, label %if.else.19

if.then.17:                                       ; preds = %if.else
  %or18 = or i32 %and.i.103, %and.i
  br label %if.end.23

if.else.19:                                       ; preds = %if.else
  %or20 = or i32 %and.i, 8388608
  %fold = add nuw nsw i32 %shr.i.102, 10
  %and = and i32 %fold, 31
  %shl21 = shl i32 %or20, %and
  %sub22 = sub nsw i32 150, %and.i.103
  %shr = lshr i32 %or20, %sub22
  br label %if.end.23

if.end.23:                                        ; preds = %if.else.19, %if.then.17
  %aSigExtra.0 = phi i32 [ %or18, %if.then.17 ], [ %shl21, %if.else.19 ]
  %z.0 = phi i32 [ 0, %if.then.17 ], [ %shr, %if.else.19 ]
  %tobool24 = icmp ne i32 %aSigExtra.0, 0
  br i1 %tobool24, label %if.then.25, label %if.end.27

if.then.25:                                       ; preds = %if.end.23
  %1 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or26 = or i32 %1, 1
  store i32 %or26, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.27

if.end.27:                                        ; preds = %if.then.25, %if.end.23
  %2 = load i32, i32* @float_rounding_mode, align 4, !tbaa !1
  %cmp28 = icmp eq i32 %2, 0
  br i1 %cmp28, label %if.then.29, label %if.else.42

if.then.29:                                       ; preds = %if.end.27
  %cmp30 = icmp slt i32 %aSigExtra.0, 0
  br i1 %cmp30, label %if.then.31, label %if.end.37

if.then.31:                                       ; preds = %if.then.29
  %inc = add nsw i32 %z.0, 1
  %shl32.mask = and i32 %aSigExtra.0, 2147483647
  %cmp33 = icmp eq i32 %shl32.mask, 0
  %and35 = and i32 %inc, -2
  %and35.inc = select i1 %cmp33, i32 %and35, i32 %inc
  br label %if.end.37

if.end.37:                                        ; preds = %if.then.31, %if.then.29
  %z.1 = phi i32 [ %z.0, %if.then.29 ], [ %and35.inc, %if.then.31 ]
  %tobool38 = icmp eq i32 %shr.i, 0
  %sub40 = sub nsw i32 0, %z.1
  %z.1.sub40 = select i1 %tobool38, i32 %z.1, i32 %sub40
  ret i32 %z.1.sub40

if.else.42:                                       ; preds = %if.end.27
  %tobool44 = icmp eq i32 %shr.i, 0
  br i1 %tobool44, label %if.else.50, label %if.then.45

if.then.45:                                       ; preds = %if.else.42
  %cmp46 = icmp eq i32 %2, 3
  %and48101 = and i1 %tobool24, %cmp46
  %and48 = zext i1 %and48101 to i32
  %add = add i32 %z.0, %and48
  %sub49 = sub nsw i32 0, %add
  br label %cleanup

if.else.50:                                       ; preds = %if.else.42
  %cmp51 = icmp eq i32 %2, 2
  %and53100 = and i1 %tobool24, %cmp51
  %and53 = zext i1 %and53100 to i32
  %add54 = add i32 %and53, %z.0
  br label %cleanup

cleanup:                                          ; preds = %if.end.11, %if.then.45, %if.else.50, %lor.lhs.false, %if.then.6, %if.end.10
  %retval.0 = phi i32 [ -2147483648, %if.end.10 ], [ 2147483647, %if.then.6 ], [ 2147483647, %lor.lhs.false ], [ %sub49, %if.then.45 ], [ %add54, %if.else.50 ], [ %shl.sub14, %if.end.11 ]
  ret i32 %retval.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i32 @float32_to_int32_round_to_zero(i32 %a) #2 {
entry:
  %and.i = and i32 %a, 8388607
  %shr.i.51 = lshr i32 %a, 23
  %and.i.52 = and i32 %shr.i.51, 255
  %shr.i = lshr i32 %a, 31
  %sub = add nsw i32 %and.i.52, -158
  %cmp = icmp sgt i32 %sub, -1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %cmp3 = icmp eq i32 %a, -822083584
  br i1 %cmp3, label %if.end.8, label %if.then.4

if.then.4:                                        ; preds = %if.then
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %0, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  %tobool = icmp eq i32 %shr.i, 0
  br i1 %tobool, label %cleanup, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then.4
  %cmp5 = icmp eq i32 %and.i.52, 255
  %tobool6 = icmp ne i32 %and.i, 0
  %or.cond = and i1 %tobool6, %cmp5
  br i1 %or.cond, label %cleanup, label %if.end.8

if.end.8:                                         ; preds = %if.then, %lor.lhs.false
  br label %cleanup

if.else:                                          ; preds = %entry
  %cmp9 = icmp ult i32 %and.i.52, 127
  br i1 %cmp9, label %if.then.10, label %if.end.16

if.then.10:                                       ; preds = %if.else
  %or = or i32 %and.i.52, %and.i
  %tobool11 = icmp eq i32 %or, 0
  br i1 %tobool11, label %cleanup, label %if.then.12

if.then.12:                                       ; preds = %if.then.10
  %1 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or13 = or i32 %1, 1
  store i32 %or13, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.16:                                        ; preds = %if.else
  %or17 = shl nuw nsw i32 %and.i, 8
  %shl = or i32 %or17, -2147483648
  %sub18 = sub nsw i32 158, %and.i.52
  %shr = lshr i32 %shl, %sub18
  %fold = add nuw nsw i32 %shr.i.51, 2
  %and = and i32 %fold, 31
  %shl19 = shl i32 %shl, %and
  %tobool20 = icmp eq i32 %shl19, 0
  br i1 %tobool20, label %if.end.23, label %if.then.21

if.then.21:                                       ; preds = %if.end.16
  %2 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or22 = or i32 %2, 1
  store i32 %or22, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.23

if.end.23:                                        ; preds = %if.end.16, %if.then.21
  %tobool24 = icmp eq i32 %shr.i, 0
  %sub26 = sub nsw i32 0, %shr
  %shr.sub26 = select i1 %tobool24, i32 %shr, i32 %sub26
  br label %cleanup

cleanup:                                          ; preds = %if.then.12, %if.then.10, %lor.lhs.false, %if.then.4, %if.end.23, %if.end.8
  %retval.0 = phi i32 [ -2147483648, %if.end.8 ], [ %shr.sub26, %if.end.23 ], [ 2147483647, %if.then.4 ], [ 2147483647, %lor.lhs.false ], [ 0, %if.then.10 ], [ 0, %if.then.12 ]
  ret i32 %retval.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i64 @float32_to_float64(i32 %a) #2 {
entry:
  %and.i = and i32 %a, 8388607
  %shr.i.42 = lshr i32 %a, 23
  %and.i.43 = and i32 %shr.i.42, 255
  %shr.i.41 = lshr i32 %a, 31
  switch i32 %and.i.43, label %if.end.14 [
    i32 255, label %if.then
    i32 0, label %if.then.9
  ]

if.then:                                          ; preds = %entry
  %tobool = icmp eq i32 %and.i, 0
  br i1 %tobool, label %if.end, label %if.then.3

if.then.3:                                        ; preds = %if.then
  %and.i.i = and i32 %a, 2143289344
  %cmp.i.i.38 = icmp eq i32 %and.i.i, 2139095040
  %and1.i.i = and i32 %a, 4194303
  %tobool.i.i = icmp ne i32 %and1.i.i, 0
  %tobool.demorgan.i = and i1 %cmp.i.i.38, %tobool.i.i
  br i1 %tobool.demorgan.i, label %if.then.i, label %float32ToCommonNaN.exit

if.then.i:                                        ; preds = %if.then.3
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i = or i32 %0, 16
  store i32 %or.i.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %float32ToCommonNaN.exit

float32ToCommonNaN.exit:                          ; preds = %if.then.3, %if.then.i
  %shl.i.39 = shl i32 %a, 9
  %retval.sroa.0.0.insert.ext.i.40 = zext i32 %shr.i.41 to i64
  %retval.sroa.0.4.insert.ext.i = zext i32 %shl.i.39 to i64
  %1 = shl nuw nsw i64 %retval.sroa.0.4.insert.ext.i, 20
  %shr3.i5.i = lshr i64 %retval.sroa.0.4.insert.ext.i, 12
  %shl.i.37 = shl nuw nsw i64 %retval.sroa.0.0.insert.ext.i.40, 31
  %or.masked.i = or i64 %shr3.i5.i, %shl.i.37
  %z.sroa.4.0.insert.ext.i = shl nuw i64 %or.masked.i, 32
  %z.sroa.0.0.insert.ext.i = and i64 %1, 3758096384
  %z.sroa.4.0.insert.shift.i = or i64 %z.sroa.0.0.insert.ext.i, %z.sroa.4.0.insert.ext.i
  %z.sroa.0.0.insert.insert.i = or i64 %z.sroa.4.0.insert.shift.i, 9221120237041090560
  br label %cleanup

if.end:                                           ; preds = %if.then
  %shl.i.33 = shl nuw i32 %shr.i.41, 31
  %add.i.34 = or i32 %shl.i.33, 2146435072
  %retval.sroa.2.0.insert.ext.i.35 = zext i32 %add.i.34 to i64
  %retval.sroa.2.0.insert.shift.i.36 = shl nuw i64 %retval.sroa.2.0.insert.ext.i.35, 32
  br label %cleanup

if.then.9:                                        ; preds = %entry
  %cmp10 = icmp eq i32 %and.i, 0
  br i1 %cmp10, label %if.then.11, label %if.end.13

if.then.11:                                       ; preds = %if.then.9
  %shl.i.30 = shl nuw i32 %shr.i.41, 31
  %retval.sroa.2.0.insert.ext.i.31 = zext i32 %shl.i.30 to i64
  %retval.sroa.2.0.insert.shift.i.32 = shl nuw i64 %retval.sroa.2.0.insert.ext.i.31, 32
  br label %cleanup

if.end.13:                                        ; preds = %if.then.9
  %cmp.i.i = icmp ult i32 %and.i, 65536
  %shl.i.i = shl i32 %a, 16
  %shl.a.i.i = select i1 %cmp.i.i, i32 %shl.i.i, i32 %and.i
  %..i.i = select i1 %cmp.i.i, i32 16, i32 0
  %cmp1.i.i = icmp ult i32 %shl.a.i.i, 16777216
  %add3.i.i = or i32 %..i.i, 8
  %shl4.i.i = shl i32 %shl.a.i.i, 8
  %a.addr.1.i.i = select i1 %cmp1.i.i, i32 %shl4.i.i, i32 %shl.a.i.i
  %shiftCount.1.i.i = select i1 %cmp1.i.i, i32 %add3.i.i, i32 %..i.i
  %shr.i.i = lshr i32 %a.addr.1.i.i, 24
  %idxprom.i.i = zext i32 %shr.i.i to i64
  %arrayidx.i.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i64 0, i64 %idxprom.i.i
  %2 = load i32, i32* %arrayidx.i.i, align 4, !tbaa !1
  %add6.i.i = add nsw i32 %2, %shiftCount.1.i.i
  %sub.i = add nsw i32 %add6.i.i, -8
  %shl.i.29 = shl i32 %and.i, %sub.i
  %dec = sub i32 8, %add6.i.i
  br label %if.end.14

if.end.14:                                        ; preds = %entry, %if.end.13
  %aSig.0 = phi i32 [ %and.i, %entry ], [ %shl.i.29, %if.end.13 ]
  %aExp.0 = phi i32 [ %and.i.43, %entry ], [ %dec, %if.end.13 ]
  %shl.i.28 = shl i32 %aSig.0, 29
  %shr3.i = lshr i32 %aSig.0, 3
  %shl.i = shl nuw i32 %shr.i.41, 31
  %add = shl i32 %aExp.0, 20
  %shl1.i = or i32 %shl.i, 939524096
  %add.i = add i32 %shl1.i, %shr3.i
  %add2.i = add i32 %add.i, %add
  %retval.sroa.2.0.insert.ext.i = zext i32 %add2.i to i64
  %retval.sroa.2.0.insert.shift.i = shl nuw i64 %retval.sroa.2.0.insert.ext.i, 32
  %retval.sroa.0.0.insert.ext.i = zext i32 %shl.i.28 to i64
  %retval.sroa.0.0.insert.insert.i = or i64 %retval.sroa.2.0.insert.shift.i, %retval.sroa.0.0.insert.ext.i
  br label %cleanup

cleanup:                                          ; preds = %if.end.14, %if.then.11, %if.end, %float32ToCommonNaN.exit
  %retval.sroa.0.0 = phi i64 [ %z.sroa.0.0.insert.insert.i, %float32ToCommonNaN.exit ], [ %retval.sroa.2.0.insert.shift.i.36, %if.end ], [ %retval.sroa.2.0.insert.shift.i.32, %if.then.11 ], [ %retval.sroa.0.0.insert.insert.i, %if.end.14 ]
  ret i64 %retval.sroa.0.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i32 @float32_round_to_int(i32 %a) #2 {
entry:
  %shr.i = lshr i32 %a, 23
  %and.i = and i32 %shr.i, 255
  %cmp = icmp ugt i32 %and.i, 149
  br i1 %cmp, label %if.then, label %if.end.5

if.then:                                          ; preds = %entry
  %cmp1 = icmp ne i32 %and.i, 255
  %and.i.97 = and i32 %a, 8388607
  %tobool = icmp eq i32 %and.i.97, 0
  %or.cond = or i1 %tobool, %cmp1
  br i1 %or.cond, label %cleanup, label %if.then.3

if.then.3:                                        ; preds = %if.then
  %and.i.32.i = and i32 %a, 2143289344
  %cmp.i.33.i = icmp eq i32 %and.i.32.i, 2139095040
  %and1.i.34.i = and i32 %a, 4194303
  %tobool.i.35.i = icmp ne i32 %and1.i.34.i, 0
  %0 = and i1 %cmp.i.33.i, %tobool.i.35.i
  %or.i = or i32 %a, 4194304
  br i1 %0, label %cond.end.15.i, label %cleanup

cond.end.15.i:                                    ; preds = %if.then.3
  %1 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i = or i32 %1, 16
  store i32 %or.i.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.5:                                         ; preds = %entry
  %cmp6 = icmp ult i32 %and.i, 127
  br i1 %cmp6, label %if.then.7, label %if.end.25

if.then.7:                                        ; preds = %if.end.5
  %shl.mask = and i32 %a, 2147483647
  %cmp8 = icmp eq i32 %shl.mask, 0
  br i1 %cmp8, label %cleanup, label %if.end.10

if.end.10:                                        ; preds = %if.then.7
  %2 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or = or i32 %2, 1
  store i32 %or, i32* @float_exception_flags, align 4, !tbaa !1
  %shr.i.95 = lshr i32 %a, 31
  %3 = load i32, i32* @float_rounding_mode, align 4, !tbaa !1
  switch i32 %3, label %sw.epilog [
    i32 0, label %sw.bb
    i32 3, label %sw.bb.19
    i32 2, label %sw.bb.21
  ]

sw.bb:                                            ; preds = %if.end.10
  %cmp12 = icmp ne i32 %and.i, 126
  %and.i.94 = and i32 %a, 8388607
  %tobool15 = icmp eq i32 %and.i.94, 0
  %or.cond99 = or i1 %tobool15, %cmp12
  br i1 %or.cond99, label %sw.epilog, label %if.then.16

if.then.16:                                       ; preds = %sw.bb
  %shl.i.93 = shl nuw i32 %shr.i.95, 31
  %add.i = or i32 %shl.i.93, 1065353216
  br label %cleanup

sw.bb.19:                                         ; preds = %if.end.10
  %tobool20 = icmp ne i32 %shr.i.95, 0
  %cond = select i1 %tobool20, i32 -1082130432, i32 0
  br label %cleanup

sw.bb.21:                                         ; preds = %if.end.10
  %tobool22 = icmp ne i32 %shr.i.95, 0
  %cond23 = select i1 %tobool22, i32 -2147483648, i32 1065353216
  br label %cleanup

sw.epilog:                                        ; preds = %sw.bb, %if.end.10
  %shl.i = shl nuw i32 %shr.i.95, 31
  br label %cleanup

if.end.25:                                        ; preds = %if.end.5
  %sub = sub nsw i32 150, %and.i
  %shl26 = shl i32 1, %sub
  %sub27 = add i32 %shl26, -1
  %4 = load i32, i32* @float_rounding_mode, align 4, !tbaa !1
  switch i32 %4, label %if.then.35 [
    i32 0, label %if.then.29
    i32 1, label %if.end.43
  ]

if.then.29:                                       ; preds = %if.end.25
  %shr = lshr i32 %shl26, 1
  %add = add i32 %shr, %a
  %and = and i32 %add, %sub27
  %cmp30 = icmp eq i32 %and, 0
  br i1 %cmp30, label %if.then.31, label %if.end.43

if.then.31:                                       ; preds = %if.then.29
  %neg = xor i32 %shl26, -1
  %and32 = and i32 %add, %neg
  br label %if.end.43

if.then.35:                                       ; preds = %if.end.25
  %shr.i.92 = lshr i32 %a, 31
  %cmp37 = icmp eq i32 %4, 2
  %conv = zext i1 %cmp37 to i32
  %tobool38 = icmp eq i32 %shr.i.92, %conv
  %add40 = select i1 %tobool38, i32 0, i32 %sub27
  %a.add40 = add i32 %add40, %a
  br label %if.end.43

if.end.43:                                        ; preds = %if.then.35, %if.end.25, %if.then.29, %if.then.31
  %z.0 = phi i32 [ %and32, %if.then.31 ], [ %add, %if.then.29 ], [ %a, %if.end.25 ], [ %a.add40, %if.then.35 ]
  %neg44 = sub i32 0, %shl26
  %and45 = and i32 %z.0, %neg44
  %cmp46 = icmp eq i32 %and45, %a
  br i1 %cmp46, label %cleanup, label %if.then.48

if.then.48:                                       ; preds = %if.end.43
  %5 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or49 = or i32 %5, 1
  store i32 %or49, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

cleanup:                                          ; preds = %if.then, %cond.end.15.i, %if.then.3, %if.then.48, %if.end.43, %if.then.7, %sw.epilog, %sw.bb.21, %sw.bb.19, %if.then.16
  %retval.0 = phi i32 [ %shl.i, %sw.epilog ], [ %cond23, %sw.bb.21 ], [ %cond, %sw.bb.19 ], [ %add.i, %if.then.16 ], [ %a, %if.then ], [ %a, %if.then.7 ], [ %a, %if.end.43 ], [ %and45, %if.then.48 ], [ %or.i, %cond.end.15.i ], [ %or.i, %if.then.3 ]
  ret i32 %retval.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i32 @float32_add(i32 %a, i32 %b) #2 {
entry:
  %shr.i = lshr i32 %a, 31
  %shr.i.10 = lshr i32 %b, 31
  %cmp = icmp eq i32 %shr.i, %shr.i.10
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call2 = tail call fastcc i32 @addFloat32Sigs(i32 %a, i32 %b, i32 %shr.i) #5
  br label %cleanup

if.else:                                          ; preds = %entry
  %call3 = tail call fastcc i32 @subFloat32Sigs(i32 %a, i32 %b, i32 %shr.i) #5
  br label %cleanup

cleanup:                                          ; preds = %if.else, %if.then
  %retval.0 = phi i32 [ %call2, %if.then ], [ %call3, %if.else ]
  ret i32 %retval.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define internal fastcc i32 @addFloat32Sigs(i32 %a, i32 %b, i32 %zSign) #2 {
entry:
  %shr.i = lshr i32 %a, 23
  %and.i.95 = and i32 %shr.i, 255
  %shr.i.161 = lshr i32 %b, 23
  %and.i.162 = and i32 %shr.i.161, 255
  %sub = sub nsw i32 %and.i.95, %and.i.162
  %and.i = shl i32 %a, 6
  %shl = and i32 %and.i, 536870848
  %and.i.163 = shl i32 %b, 6
  %shl4 = and i32 %and.i.163, 536870848
  %cmp = icmp sgt i32 %sub, 0
  br i1 %cmp, label %if.then, label %if.else.13

if.then:                                          ; preds = %entry
  %cmp5 = icmp eq i32 %and.i.95, 255
  br i1 %cmp5, label %if.then.6, label %if.end.9

if.then.6:                                        ; preds = %if.then
  %tobool = icmp eq i32 %shl, 0
  br i1 %tobool, label %cleanup, label %if.then.7

if.then.7:                                        ; preds = %if.then.6
  %and.i.32.i.139 = and i32 %a, 2143289344
  %cmp.i.33.i.140 = icmp eq i32 %and.i.32.i.139, 2139095040
  %and1.i.34.i.141 = and i32 %a, 4194303
  %tobool.i.35.i.142 = icmp ne i32 %and1.i.34.i.141, 0
  %0 = and i1 %cmp.i.33.i.140, %tobool.i.35.i.142
  %1 = trunc i32 %b to i31
  %cmp.i.31.i.143 = icmp ugt i31 %1, -8388608
  %and.i.i.144 = and i32 %b, 2143289344
  %cmp.i.i.145 = icmp eq i32 %and.i.i.144, 2139095040
  %and1.i.i.146 = and i32 %b, 4194303
  %tobool.i.i.147 = icmp ne i32 %and1.i.i.146, 0
  %2 = and i1 %cmp.i.i.145, %tobool.i.i.147
  %or.i.148 = or i32 %a, 4194304
  %or4.i.149 = or i32 %b, 4194304
  %or537.i.150 = or i1 %0, %2
  br i1 %or537.i.150, label %if.then.i.152, label %if.end.i.153

if.then.i.152:                                    ; preds = %if.then.7
  %3 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.151 = or i32 %3, 16
  store i32 %or.i.i.151, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.i.153

if.end.i.153:                                     ; preds = %if.then.i.152, %if.then.7
  br i1 %2, label %cleanup, label %cond.false.i.157

cond.false.i.157:                                 ; preds = %if.end.i.153
  %tobool7.i.155.demorgan = and i1 %cmp.i.33.i.140, %tobool.i.35.i.142
  %tobool7.i.155 = xor i1 %tobool7.i.155.demorgan, true
  %4 = and i1 %cmp.i.31.i.143, %tobool7.i.155
  %cond.or.i.156 = select i1 %4, i32 %or4.i.149, i32 %or.i.148
  br label %cleanup

if.end.9:                                         ; preds = %if.then
  %cmp10 = icmp eq i32 %and.i.162, 0
  br i1 %cmp10, label %if.end.12, label %if.end.12.thread

if.end.12.thread:                                 ; preds = %if.end.9
  %or = or i32 %shl4, 536870912
  br label %if.else.i.126

if.end.12:                                        ; preds = %if.end.9
  %dec = add nsw i32 %sub, -1
  %cmp.i.124 = icmp eq i32 %dec, 0
  br i1 %cmp.i.124, label %if.end.46, label %if.else.i.126

if.else.i.126:                                    ; preds = %if.end.12.thread, %if.end.12
  %expDiff.0177 = phi i32 [ %sub, %if.end.12.thread ], [ %dec, %if.end.12 ]
  %bSig.0176 = phi i32 [ %or, %if.end.12.thread ], [ %shl4, %if.end.12 ]
  %cmp1.i.125 = icmp slt i32 %expDiff.0177, 32
  br i1 %cmp1.i.125, label %if.then.2.i.133, label %if.else.4.i.136

if.then.2.i.133:                                  ; preds = %if.else.i.126
  %shr.i.127 = lshr i32 %bSig.0176, %expDiff.0177
  %sub.i = sub nsw i32 0, %expDiff.0177
  %and.i.128 = and i32 %sub.i, 31
  %shl.i.129 = shl i32 %bSig.0176, %and.i.128
  %cmp3.i.130 = icmp ne i32 %shl.i.129, 0
  %conv.i.131 = zext i1 %cmp3.i.130 to i32
  %or.i.132 = or i32 %conv.i.131, %shr.i.127
  br label %if.end.46

if.else.4.i.136:                                  ; preds = %if.else.i.126
  %cmp5.i.134 = icmp ne i32 %bSig.0176, 0
  %conv6.i.135 = zext i1 %cmp5.i.134 to i32
  br label %if.end.46

if.else.13:                                       ; preds = %entry
  %cmp14 = icmp slt i32 %sub, 0
  br i1 %cmp14, label %if.then.15, label %if.else.30

if.then.15:                                       ; preds = %if.else.13
  %cmp16 = icmp eq i32 %and.i.162, 255
  br i1 %cmp16, label %if.then.17, label %if.end.23

if.then.17:                                       ; preds = %if.then.15
  %tobool18 = icmp eq i32 %shl4, 0
  br i1 %tobool18, label %if.end.21, label %if.then.19

if.then.19:                                       ; preds = %if.then.17
  %and.i.32.i.102 = and i32 %a, 2143289344
  %cmp.i.33.i.103 = icmp eq i32 %and.i.32.i.102, 2139095040
  %and1.i.34.i.104 = and i32 %a, 4194303
  %tobool.i.35.i.105 = icmp ne i32 %and1.i.34.i.104, 0
  %5 = and i1 %cmp.i.33.i.103, %tobool.i.35.i.105
  %6 = trunc i32 %b to i31
  %cmp.i.31.i.106 = icmp ugt i31 %6, -8388608
  %and.i.i.107 = and i32 %b, 2143289344
  %cmp.i.i.108 = icmp eq i32 %and.i.i.107, 2139095040
  %and1.i.i.109 = and i32 %b, 4194303
  %tobool.i.i.110 = icmp ne i32 %and1.i.i.109, 0
  %7 = and i1 %cmp.i.i.108, %tobool.i.i.110
  %or.i.111 = or i32 %a, 4194304
  %or4.i.112 = or i32 %b, 4194304
  %or537.i.113 = or i1 %5, %7
  br i1 %or537.i.113, label %if.then.i.115, label %if.end.i.116

if.then.i.115:                                    ; preds = %if.then.19
  %8 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.114 = or i32 %8, 16
  store i32 %or.i.i.114, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.i.116

if.end.i.116:                                     ; preds = %if.then.i.115, %if.then.19
  br i1 %7, label %cleanup, label %cond.false.i.120

cond.false.i.120:                                 ; preds = %if.end.i.116
  %tobool7.i.118.demorgan = and i1 %cmp.i.33.i.103, %tobool.i.35.i.105
  %tobool7.i.118 = xor i1 %tobool7.i.118.demorgan, true
  %9 = and i1 %cmp.i.31.i.106, %tobool7.i.118
  %cond.or.i.119 = select i1 %9, i32 %or4.i.112, i32 %or.i.111
  br label %cleanup

if.end.21:                                        ; preds = %if.then.17
  %shl.i.101 = shl i32 %zSign, 31
  %add.i = or i32 %shl.i.101, 2139095040
  br label %cleanup

if.end.23:                                        ; preds = %if.then.15
  %cmp24 = icmp eq i32 %and.i.95, 0
  %or27 = or i32 %shl, 536870912
  %aSig.0 = select i1 %cmp24, i32 %shl, i32 %or27
  %inc = zext i1 %cmp24 to i32
  %expDiff.1 = add nsw i32 %sub, %inc
  %sub29 = sub nsw i32 0, %expDiff.1
  %cmp.i = icmp eq i32 %expDiff.1, 0
  br i1 %cmp.i, label %if.end.46, label %if.else.i

if.else.i:                                        ; preds = %if.end.23
  %cmp1.i = icmp sgt i32 %expDiff.1, -32
  br i1 %cmp1.i, label %if.then.2.i, label %if.else.4.i

if.then.2.i:                                      ; preds = %if.else.i
  %shr.i.97 = lshr i32 %aSig.0, %sub29
  %and.i.98 = and i32 %expDiff.1, 31
  %shl.i.99 = shl i32 %aSig.0, %and.i.98
  %cmp3.i = icmp ne i32 %shl.i.99, 0
  %conv.i = zext i1 %cmp3.i to i32
  %or.i.100 = or i32 %conv.i, %shr.i.97
  br label %if.end.46

if.else.4.i:                                      ; preds = %if.else.i
  %cmp5.i = icmp ne i32 %aSig.0, 0
  %conv6.i = zext i1 %cmp5.i to i32
  br label %if.end.46

if.else.30:                                       ; preds = %if.else.13
  switch i32 %and.i.95, label %if.end.42 [
    i32 255, label %if.then.32
    i32 0, label %if.then.40
  ]

if.then.32:                                       ; preds = %if.else.30
  %or33 = or i32 %shl4, %shl
  %tobool34 = icmp eq i32 %or33, 0
  br i1 %tobool34, label %cleanup, label %if.then.35

if.then.35:                                       ; preds = %if.then.32
  %and.i.32.i = and i32 %a, 2143289344
  %cmp.i.33.i = icmp eq i32 %and.i.32.i, 2139095040
  %and1.i.34.i = and i32 %a, 4194303
  %tobool.i.35.i = icmp ne i32 %and1.i.34.i, 0
  %10 = and i1 %cmp.i.33.i, %tobool.i.35.i
  %11 = trunc i32 %b to i31
  %cmp.i.31.i = icmp ugt i31 %11, -8388608
  %and.i.i = and i32 %b, 2143289344
  %cmp.i.i = icmp eq i32 %and.i.i, 2139095040
  %and1.i.i = and i32 %b, 4194303
  %tobool.i.i = icmp ne i32 %and1.i.i, 0
  %12 = and i1 %cmp.i.i, %tobool.i.i
  %or.i = or i32 %a, 4194304
  %or4.i = or i32 %b, 4194304
  %or537.i = or i1 %10, %12
  br i1 %or537.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %if.then.35
  %13 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i = or i32 %13, 16
  store i32 %or.i.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.i

if.end.i:                                         ; preds = %if.then.i, %if.then.35
  br i1 %12, label %cleanup, label %cond.false.i

cond.false.i:                                     ; preds = %if.end.i
  %tobool7.i.demorgan = and i1 %cmp.i.33.i, %tobool.i.35.i
  %tobool7.i = xor i1 %tobool7.i.demorgan, true
  %14 = and i1 %cmp.i.31.i, %tobool7.i
  %cond.or.i = select i1 %14, i32 %or4.i, i32 %or.i
  br label %cleanup

if.then.40:                                       ; preds = %if.else.30
  %add = add nuw nsw i32 %shl4, %shl
  %shr = lshr exact i32 %add, 6
  %shl.i = shl i32 %zSign, 31
  %add2.i = or i32 %shr, %shl.i
  br label %cleanup

if.end.42:                                        ; preds = %if.else.30
  %add43 = or i32 %shl, 1073741824
  %add44 = add nuw i32 %add43, %shl4
  br label %roundAndPack

if.end.46:                                        ; preds = %if.else.4.i, %if.then.2.i, %if.end.23, %if.else.4.i.136, %if.then.2.i.133, %if.end.12
  %aSig.1 = phi i32 [ %shl, %if.end.12 ], [ %shl, %if.then.2.i.133 ], [ %shl, %if.else.4.i.136 ], [ %or.i.100, %if.then.2.i ], [ %conv6.i, %if.else.4.i ], [ %aSig.0, %if.end.23 ]
  %bSig.1 = phi i32 [ %shl4, %if.end.12 ], [ %or.i.132, %if.then.2.i.133 ], [ %conv6.i.135, %if.else.4.i.136 ], [ %shl4, %if.then.2.i ], [ %shl4, %if.else.4.i ], [ %shl4, %if.end.23 ]
  %zExp.0 = phi i32 [ %and.i.95, %if.end.12 ], [ %and.i.95, %if.then.2.i.133 ], [ %and.i.95, %if.else.4.i.136 ], [ %and.i.162, %if.then.2.i ], [ %and.i.162, %if.else.4.i ], [ %and.i.162, %if.end.23 ]
  %or47 = or i32 %aSig.1, 536870912
  %add48 = add i32 %or47, %bSig.1
  %shl49 = shl i32 %add48, 1
  %cmp51 = icmp slt i32 %shl49, 0
  %not.cmp51 = xor i1 %cmp51, true
  %dec50 = sext i1 %not.cmp51 to i32
  %zExp.0.dec50 = add nsw i32 %dec50, %zExp.0
  %add48.shl49 = select i1 %cmp51, i32 %add48, i32 %shl49
  br label %roundAndPack

roundAndPack:                                     ; preds = %if.end.46, %if.end.42
  %zExp.1 = phi i32 [ %and.i.95, %if.end.42 ], [ %zExp.0.dec50, %if.end.46 ]
  %zSig.0 = phi i32 [ %add44, %if.end.42 ], [ %add48.shl49, %if.end.46 ]
  %call56 = tail call fastcc i32 @roundAndPackFloat32(i32 %zSign, i32 %zExp.1, i32 %zSig.0) #5
  br label %cleanup

cleanup:                                          ; preds = %cond.false.i, %if.end.i, %cond.false.i.120, %if.end.i.116, %cond.false.i.157, %if.end.i.153, %if.then.32, %if.then.6, %roundAndPack, %if.then.40, %if.end.21
  %retval.0 = phi i32 [ %call56, %roundAndPack ], [ %add.i, %if.end.21 ], [ %add2.i, %if.then.40 ], [ %a, %if.then.6 ], [ %a, %if.then.32 ], [ %cond.or.i.156, %cond.false.i.157 ], [ %or4.i.149, %if.end.i.153 ], [ %cond.or.i.119, %cond.false.i.120 ], [ %or4.i.112, %if.end.i.116 ], [ %cond.or.i, %cond.false.i ], [ %or4.i, %if.end.i ]
  ret i32 %retval.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define internal fastcc i32 @subFloat32Sigs(i32 %a, i32 %b, i32 %zSign) #2 {
entry:
  %shr.i = lshr i32 %a, 23
  %and.i.96 = and i32 %shr.i, 255
  %shr.i.166 = lshr i32 %b, 23
  %and.i.167 = and i32 %shr.i.166, 255
  %sub = sub nsw i32 %and.i.96, %and.i.167
  %and.i = shl i32 %a, 7
  %shl = and i32 %and.i, 1073741696
  %and.i.168 = shl i32 %b, 7
  %shl4 = and i32 %and.i.168, 1073741696
  %cmp = icmp sgt i32 %sub, 0
  br i1 %cmp, label %aExpBigger, label %if.end

if.end:                                           ; preds = %entry
  %cmp5 = icmp slt i32 %sub, 0
  br i1 %cmp5, label %bExpBigger, label %if.end.7

if.end.7:                                         ; preds = %if.end
  switch i32 %and.i.96, label %if.end.16 [
    i32 255, label %if.then.9
    i32 0, label %if.then.15
  ]

if.then.9:                                        ; preds = %if.end.7
  %or = or i32 %shl4, %shl
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %if.end.12, label %if.then.10

if.then.10:                                       ; preds = %if.then.9
  %and.i.32.i.144 = and i32 %a, 2143289344
  %cmp.i.33.i.145 = icmp eq i32 %and.i.32.i.144, 2139095040
  %and1.i.34.i.146 = and i32 %a, 4194303
  %tobool.i.35.i.147 = icmp ne i32 %and1.i.34.i.146, 0
  %0 = and i1 %cmp.i.33.i.145, %tobool.i.35.i.147
  %1 = trunc i32 %b to i31
  %cmp.i.31.i.148 = icmp ugt i31 %1, -8388608
  %and.i.i.149 = and i32 %b, 2143289344
  %cmp.i.i.150 = icmp eq i32 %and.i.i.149, 2139095040
  %and1.i.i.151 = and i32 %b, 4194303
  %tobool.i.i.152 = icmp ne i32 %and1.i.i.151, 0
  %2 = and i1 %cmp.i.i.150, %tobool.i.i.152
  %or.i.153 = or i32 %a, 4194304
  %or4.i.154 = or i32 %b, 4194304
  %or537.i.155 = or i1 %0, %2
  br i1 %or537.i.155, label %if.then.i.157, label %if.end.i.158

if.then.i.157:                                    ; preds = %if.then.10
  %3 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.156 = or i32 %3, 16
  store i32 %or.i.i.156, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.i.158

if.end.i.158:                                     ; preds = %if.then.i.157, %if.then.10
  br i1 %2, label %cleanup, label %cond.false.i.162

cond.false.i.162:                                 ; preds = %if.end.i.158
  %tobool7.i.160.demorgan = and i1 %cmp.i.33.i.145, %tobool.i.35.i.147
  %tobool7.i.160 = xor i1 %tobool7.i.160.demorgan, true
  %4 = and i1 %cmp.i.31.i.148, %tobool7.i.160
  %cond.or.i.161 = select i1 %4, i32 %or4.i.154, i32 %or.i.153
  br label %cleanup

if.end.12:                                        ; preds = %if.then.9
  %5 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.143 = or i32 %5, 16
  store i32 %or.i.143, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.then.15:                                       ; preds = %if.end.7
  br label %if.end.16

if.end.16:                                        ; preds = %if.end.7, %if.then.15
  %aExp.0 = phi i32 [ 1, %if.then.15 ], [ %and.i.96, %if.end.7 ]
  %bExp.0 = phi i32 [ 1, %if.then.15 ], [ %and.i.167, %if.end.7 ]
  %cmp17 = icmp ult i32 %shl4, %shl
  br i1 %cmp17, label %aBigger, label %if.end.19

if.end.19:                                        ; preds = %if.end.16
  %cmp20 = icmp ult i32 %shl, %shl4
  br i1 %cmp20, label %bBigger, label %if.end.22

if.end.22:                                        ; preds = %if.end.19
  %6 = load i32, i32* @float_rounding_mode, align 4, !tbaa !1
  %cmp23 = icmp eq i32 %6, 3
  %conv = zext i1 %cmp23 to i32
  %shl.i.142 = shl nuw i32 %conv, 31
  br label %cleanup

bExpBigger:                                       ; preds = %if.end
  %cmp25 = icmp eq i32 %and.i.167, 255
  br i1 %cmp25, label %if.then.27, label %if.end.33

if.then.27:                                       ; preds = %bExpBigger
  %tobool28 = icmp eq i32 %shl4, 0
  br i1 %tobool28, label %if.end.31, label %if.then.29

if.then.29:                                       ; preds = %if.then.27
  %and.i.32.i.120 = and i32 %a, 2143289344
  %cmp.i.33.i.121 = icmp eq i32 %and.i.32.i.120, 2139095040
  %and1.i.34.i.122 = and i32 %a, 4194303
  %tobool.i.35.i.123 = icmp ne i32 %and1.i.34.i.122, 0
  %7 = and i1 %cmp.i.33.i.121, %tobool.i.35.i.123
  %8 = trunc i32 %b to i31
  %cmp.i.31.i.124 = icmp ugt i31 %8, -8388608
  %and.i.i.125 = and i32 %b, 2143289344
  %cmp.i.i.126 = icmp eq i32 %and.i.i.125, 2139095040
  %and1.i.i.127 = and i32 %b, 4194303
  %tobool.i.i.128 = icmp ne i32 %and1.i.i.127, 0
  %9 = and i1 %cmp.i.i.126, %tobool.i.i.128
  %or.i.129 = or i32 %a, 4194304
  %or4.i.130 = or i32 %b, 4194304
  %or537.i.131 = or i1 %7, %9
  br i1 %or537.i.131, label %if.then.i.133, label %if.end.i.134

if.then.i.133:                                    ; preds = %if.then.29
  %10 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.132 = or i32 %10, 16
  store i32 %or.i.i.132, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.i.134

if.end.i.134:                                     ; preds = %if.then.i.133, %if.then.29
  br i1 %9, label %cleanup, label %cond.false.i.138

cond.false.i.138:                                 ; preds = %if.end.i.134
  %tobool7.i.136.demorgan = and i1 %cmp.i.33.i.121, %tobool.i.35.i.123
  %tobool7.i.136 = xor i1 %tobool7.i.136.demorgan, true
  %11 = and i1 %cmp.i.31.i.124, %tobool7.i.136
  %cond.or.i.137 = select i1 %11, i32 %or4.i.130, i32 %or.i.129
  br label %cleanup

if.end.31:                                        ; preds = %if.then.27
  %xor = shl i32 %zSign, 31
  %add.i = add i32 %xor, -8388608
  br label %cleanup

if.end.33:                                        ; preds = %bExpBigger
  %cmp34 = icmp eq i32 %and.i.96, 0
  %or37 = or i32 %shl, 1073741824
  %aSig.0 = select i1 %cmp34, i32 %shl, i32 %or37
  %inc = zext i1 %cmp34 to i32
  %expDiff.0 = add nsw i32 %sub, %inc
  %sub39 = sub nsw i32 0, %expDiff.0
  %cmp.i.104 = icmp eq i32 %expDiff.0, 0
  br i1 %cmp.i.104, label %shift32RightJamming.exit118, label %if.else.i.106

if.else.i.106:                                    ; preds = %if.end.33
  %cmp1.i.105 = icmp sgt i32 %expDiff.0, -32
  br i1 %cmp1.i.105, label %if.then.2.i.113, label %if.else.4.i.116

if.then.2.i.113:                                  ; preds = %if.else.i.106
  %shr.i.107 = lshr i32 %aSig.0, %sub39
  %and.i.108 = and i32 %expDiff.0, 31
  %shl.i.109 = shl i32 %aSig.0, %and.i.108
  %cmp3.i.110 = icmp ne i32 %shl.i.109, 0
  %conv.i.111 = zext i1 %cmp3.i.110 to i32
  %or.i.112 = or i32 %conv.i.111, %shr.i.107
  br label %shift32RightJamming.exit118

if.else.4.i.116:                                  ; preds = %if.else.i.106
  %cmp5.i.114 = icmp ne i32 %aSig.0, 0
  %conv6.i.115 = zext i1 %cmp5.i.114 to i32
  br label %shift32RightJamming.exit118

shift32RightJamming.exit118:                      ; preds = %if.end.33, %if.then.2.i.113, %if.else.4.i.116
  %z.0.i.117 = phi i32 [ %or.i.112, %if.then.2.i.113 ], [ %conv6.i.115, %if.else.4.i.116 ], [ %aSig.0, %if.end.33 ]
  %or40 = or i32 %shl4, 1073741824
  br label %bBigger

bBigger:                                          ; preds = %if.end.19, %shift32RightJamming.exit118
  %aSig.1 = phi i32 [ %z.0.i.117, %shift32RightJamming.exit118 ], [ %shl, %if.end.19 ]
  %bSig.0 = phi i32 [ %or40, %shift32RightJamming.exit118 ], [ %shl4, %if.end.19 ]
  %bExp.1 = phi i32 [ %and.i.167, %shift32RightJamming.exit118 ], [ %bExp.0, %if.end.19 ]
  %sub41 = sub i32 %bSig.0, %aSig.1
  %xor42 = xor i32 %zSign, 1
  br label %normalizeRoundAndPack

aExpBigger:                                       ; preds = %entry
  %cmp43 = icmp eq i32 %and.i.96, 255
  br i1 %cmp43, label %if.then.45, label %if.end.50

if.then.45:                                       ; preds = %aExpBigger
  %tobool46 = icmp eq i32 %shl, 0
  br i1 %tobool46, label %cleanup, label %if.then.47

if.then.47:                                       ; preds = %if.then.45
  %and.i.32.i = and i32 %a, 2143289344
  %cmp.i.33.i = icmp eq i32 %and.i.32.i, 2139095040
  %and1.i.34.i = and i32 %a, 4194303
  %tobool.i.35.i = icmp ne i32 %and1.i.34.i, 0
  %12 = and i1 %cmp.i.33.i, %tobool.i.35.i
  %13 = trunc i32 %b to i31
  %cmp.i.31.i = icmp ugt i31 %13, -8388608
  %and.i.i = and i32 %b, 2143289344
  %cmp.i.i.101 = icmp eq i32 %and.i.i, 2139095040
  %and1.i.i = and i32 %b, 4194303
  %tobool.i.i = icmp ne i32 %and1.i.i, 0
  %14 = and i1 %cmp.i.i.101, %tobool.i.i
  %or.i.102 = or i32 %a, 4194304
  %or4.i = or i32 %b, 4194304
  %or537.i = or i1 %12, %14
  br i1 %or537.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %if.then.47
  %15 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i = or i32 %15, 16
  store i32 %or.i.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.i

if.end.i:                                         ; preds = %if.then.i, %if.then.47
  br i1 %14, label %cleanup, label %cond.false.i

cond.false.i:                                     ; preds = %if.end.i
  %tobool7.i.demorgan = and i1 %cmp.i.33.i, %tobool.i.35.i
  %tobool7.i = xor i1 %tobool7.i.demorgan, true
  %16 = and i1 %cmp.i.31.i, %tobool7.i
  %cond.or.i = select i1 %16, i32 %or4.i, i32 %or.i.102
  br label %cleanup

if.end.50:                                        ; preds = %aExpBigger
  %cmp51 = icmp eq i32 %and.i.167, 0
  br i1 %cmp51, label %if.end.56, label %if.end.56.thread

if.end.56.thread:                                 ; preds = %if.end.50
  %or55 = or i32 %shl4, 1073741824
  br label %if.else.i

if.end.56:                                        ; preds = %if.end.50
  %dec = add nsw i32 %sub, -1
  %cmp.i = icmp eq i32 %dec, 0
  br i1 %cmp.i, label %shift32RightJamming.exit, label %if.else.i

if.else.i:                                        ; preds = %if.end.56.thread, %if.end.56
  %expDiff.1186 = phi i32 [ %sub, %if.end.56.thread ], [ %dec, %if.end.56 ]
  %bSig.1185 = phi i32 [ %or55, %if.end.56.thread ], [ %shl4, %if.end.56 ]
  %cmp1.i = icmp slt i32 %expDiff.1186, 32
  br i1 %cmp1.i, label %if.then.2.i, label %if.else.4.i

if.then.2.i:                                      ; preds = %if.else.i
  %shr.i.97 = lshr i32 %bSig.1185, %expDiff.1186
  %sub.i.98 = sub nsw i32 0, %expDiff.1186
  %and.i.99 = and i32 %sub.i.98, 31
  %shl.i.100 = shl i32 %bSig.1185, %and.i.99
  %cmp3.i = icmp ne i32 %shl.i.100, 0
  %conv.i = zext i1 %cmp3.i to i32
  %or.i = or i32 %conv.i, %shr.i.97
  br label %shift32RightJamming.exit

if.else.4.i:                                      ; preds = %if.else.i
  %cmp5.i = icmp ne i32 %bSig.1185, 0
  %conv6.i = zext i1 %cmp5.i to i32
  br label %shift32RightJamming.exit

shift32RightJamming.exit:                         ; preds = %if.end.56, %if.then.2.i, %if.else.4.i
  %z.0.i = phi i32 [ %or.i, %if.then.2.i ], [ %conv6.i, %if.else.4.i ], [ %shl4, %if.end.56 ]
  %or57 = or i32 %shl, 1073741824
  br label %aBigger

aBigger:                                          ; preds = %if.end.16, %shift32RightJamming.exit
  %aSig.2 = phi i32 [ %or57, %shift32RightJamming.exit ], [ %shl, %if.end.16 ]
  %bSig.2 = phi i32 [ %z.0.i, %shift32RightJamming.exit ], [ %shl4, %if.end.16 ]
  %aExp.1 = phi i32 [ %and.i.96, %shift32RightJamming.exit ], [ %aExp.0, %if.end.16 ]
  %sub58 = sub i32 %aSig.2, %bSig.2
  br label %normalizeRoundAndPack

normalizeRoundAndPack:                            ; preds = %aBigger, %bBigger
  %zSign.addr.0 = phi i32 [ %zSign, %aBigger ], [ %xor42, %bBigger ]
  %zExp.0 = phi i32 [ %aExp.1, %aBigger ], [ %bExp.1, %bBigger ]
  %zSig.0 = phi i32 [ %sub58, %aBigger ], [ %sub41, %bBigger ]
  %dec59 = add nsw i32 %zExp.0, -1
  %cmp.i.i = icmp ult i32 %zSig.0, 65536
  %shl.i.i = shl i32 %zSig.0, 16
  %shl.a.i.i = select i1 %cmp.i.i, i32 %shl.i.i, i32 %zSig.0
  %..i.i = select i1 %cmp.i.i, i32 16, i32 0
  %cmp1.i.i = icmp ult i32 %shl.a.i.i, 16777216
  %add3.i.i = or i32 %..i.i, 8
  %shl4.i.i = shl i32 %shl.a.i.i, 8
  %a.addr.1.i.i = select i1 %cmp1.i.i, i32 %shl4.i.i, i32 %shl.a.i.i
  %shiftCount.1.i.i = select i1 %cmp1.i.i, i32 %add3.i.i, i32 %..i.i
  %shr.i.i = lshr i32 %a.addr.1.i.i, 24
  %idxprom.i.i = zext i32 %shr.i.i to i64
  %arrayidx.i.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i64 0, i64 %idxprom.i.i
  %17 = load i32, i32* %arrayidx.i.i, align 4, !tbaa !1
  %add6.i.i = add i32 %17, -1
  %sub.i = add i32 %add6.i.i, %shiftCount.1.i.i
  %sub1.i = sub i32 %dec59, %sub.i
  %shl.i = shl i32 %zSig.0, %sub.i
  %call2.i = tail call fastcc i32 @roundAndPackFloat32(i32 %zSign.addr.0, i32 %sub1.i, i32 %shl.i) #4
  br label %cleanup

cleanup:                                          ; preds = %cond.false.i, %if.end.i, %cond.false.i.138, %if.end.i.134, %cond.false.i.162, %if.end.i.158, %if.then.45, %normalizeRoundAndPack, %if.end.31, %if.end.22, %if.end.12
  %retval.0 = phi i32 [ %call2.i, %normalizeRoundAndPack ], [ %add.i, %if.end.31 ], [ 2147483647, %if.end.12 ], [ %shl.i.142, %if.end.22 ], [ %a, %if.then.45 ], [ %cond.or.i.161, %cond.false.i.162 ], [ %or4.i.154, %if.end.i.158 ], [ %cond.or.i.137, %cond.false.i.138 ], [ %or4.i.130, %if.end.i.134 ], [ %cond.or.i, %cond.false.i ], [ %or4.i, %if.end.i ]
  ret i32 %retval.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i32 @float32_sub(i32 %a, i32 %b) #2 {
entry:
  %shr.i = lshr i32 %a, 31
  %shr.i.10 = lshr i32 %b, 31
  %cmp = icmp eq i32 %shr.i, %shr.i.10
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call2 = tail call fastcc i32 @subFloat32Sigs(i32 %a, i32 %b, i32 %shr.i) #5
  br label %cleanup

if.else:                                          ; preds = %entry
  %call3 = tail call fastcc i32 @addFloat32Sigs(i32 %a, i32 %b, i32 %shr.i) #5
  br label %cleanup

cleanup:                                          ; preds = %if.else, %if.then
  %retval.0 = phi i32 [ %call2, %if.then ], [ %call3, %if.else ]
  ret i32 %retval.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i32 @float32_mul(i32 %a, i32 %b) #2 {
entry:
  %and.i = and i32 %a, 8388607
  %shr.i = lshr i32 %a, 23
  %and.i.79 = and i32 %shr.i, 255
  %and.i.133 = and i32 %b, 8388607
  %shr.i.131 = lshr i32 %b, 23
  %and.i.132 = and i32 %shr.i.131, 255
  %shr.i.134152 = xor i32 %b, %a
  %xor = lshr i32 %shr.i.134152, 31
  %cmp = icmp eq i32 %and.i.79, 255
  br i1 %cmp, label %if.then, label %if.end.14

if.then:                                          ; preds = %entry
  %tobool = icmp eq i32 %and.i, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then.8

lor.lhs.false:                                    ; preds = %if.then
  %cmp6 = icmp eq i32 %and.i.132, 255
  %tobool7 = icmp ne i32 %and.i.133, 0
  %or.cond = and i1 %tobool7, %cmp6
  br i1 %or.cond, label %if.then.8, label %if.end

if.then.8:                                        ; preds = %if.then, %lor.lhs.false
  %and.i.32.i.108 = and i32 %a, 2143289344
  %cmp.i.33.i.109 = icmp eq i32 %and.i.32.i.108, 2139095040
  %and1.i.34.i.110 = and i32 %a, 4194303
  %tobool.i.35.i.111 = icmp ne i32 %and1.i.34.i.110, 0
  %0 = and i1 %cmp.i.33.i.109, %tobool.i.35.i.111
  %1 = trunc i32 %b to i31
  %cmp.i.31.i.112 = icmp ugt i31 %1, -8388608
  %and.i.i.113 = and i32 %b, 2143289344
  %cmp.i.i.114 = icmp eq i32 %and.i.i.113, 2139095040
  %and1.i.i.115 = and i32 %b, 4194303
  %tobool.i.i.116 = icmp ne i32 %and1.i.i.115, 0
  %2 = and i1 %cmp.i.i.114, %tobool.i.i.116
  %or.i.117 = or i32 %a, 4194304
  %or4.i.118 = or i32 %b, 4194304
  %or537.i.119 = or i1 %0, %2
  br i1 %or537.i.119, label %if.then.i.121, label %if.end.i.122

if.then.i.121:                                    ; preds = %if.then.8
  %3 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.120 = or i32 %3, 16
  store i32 %or.i.i.120, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.i.122

if.end.i.122:                                     ; preds = %if.then.i.121, %if.then.8
  br i1 %2, label %cleanup, label %cond.false.i.126

cond.false.i.126:                                 ; preds = %if.end.i.122
  %tobool7.i.124.demorgan = and i1 %cmp.i.33.i.109, %tobool.i.35.i.111
  %tobool7.i.124 = xor i1 %tobool7.i.124.demorgan, true
  %4 = and i1 %cmp.i.31.i.112, %tobool7.i.124
  %cond.or.i.125 = select i1 %4, i32 %or4.i.118, i32 %or.i.117
  br label %cleanup

if.end:                                           ; preds = %lor.lhs.false
  %or = or i32 %and.i.132, %and.i.133
  %cmp10 = icmp eq i32 %or, 0
  br i1 %cmp10, label %if.then.11, label %if.end.12

if.then.11:                                       ; preds = %if.end
  %5 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.107 = or i32 %5, 16
  store i32 %or.i.107, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.12:                                        ; preds = %if.end
  %shl.i.105 = shl nuw i32 %xor, 31
  %add.i.106 = or i32 %shl.i.105, 2139095040
  br label %cleanup

if.end.14:                                        ; preds = %entry
  %cmp15 = icmp eq i32 %and.i.132, 255
  br i1 %cmp15, label %if.then.16, label %if.end.26

if.then.16:                                       ; preds = %if.end.14
  %tobool17 = icmp eq i32 %and.i.133, 0
  br i1 %tobool17, label %if.end.20, label %if.then.18

if.then.18:                                       ; preds = %if.then.16
  %and.i.32.i = and i32 %a, 2143289344
  %cmp.i.33.i = icmp eq i32 %and.i.32.i, 2139095040
  %and1.i.34.i = and i32 %a, 4194303
  %tobool.i.35.i = icmp ne i32 %and1.i.34.i, 0
  %6 = and i1 %cmp.i.33.i, %tobool.i.35.i
  %7 = trunc i32 %b to i31
  %cmp.i.31.i = icmp ugt i31 %7, -8388608
  %and.i.i = and i32 %b, 2143289344
  %cmp.i.i.102 = icmp eq i32 %and.i.i, 2139095040
  %and1.i.i = and i32 %b, 4194303
  %tobool.i.i = icmp ne i32 %and1.i.i, 0
  %8 = and i1 %cmp.i.i.102, %tobool.i.i
  %or.i.103 = or i32 %a, 4194304
  %or4.i = or i32 %b, 4194304
  %or537.i = or i1 %6, %8
  br i1 %or537.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %if.then.18
  %9 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i = or i32 %9, 16
  store i32 %or.i.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.i

if.end.i:                                         ; preds = %if.then.i, %if.then.18
  br i1 %8, label %cleanup, label %cond.false.i

cond.false.i:                                     ; preds = %if.end.i
  %tobool7.i.demorgan = and i1 %cmp.i.33.i, %tobool.i.35.i
  %tobool7.i = xor i1 %tobool7.i.demorgan, true
  %10 = and i1 %cmp.i.31.i, %tobool7.i
  %cond.or.i = select i1 %10, i32 %or4.i, i32 %or.i.103
  br label %cleanup

if.end.20:                                        ; preds = %if.then.16
  %or21 = or i32 %and.i.79, %and.i
  %cmp22 = icmp eq i32 %or21, 0
  br i1 %cmp22, label %if.then.23, label %if.end.24

if.then.23:                                       ; preds = %if.end.20
  %11 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %11, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.24:                                        ; preds = %if.end.20
  %shl.i.100 = shl nuw i32 %xor, 31
  %add.i.101 = or i32 %shl.i.100, 2139095040
  br label %cleanup

if.end.26:                                        ; preds = %if.end.14
  %cmp27 = icmp eq i32 %and.i.79, 0
  br i1 %cmp27, label %if.then.28, label %if.end.33

if.then.28:                                       ; preds = %if.end.26
  %cmp29 = icmp eq i32 %and.i, 0
  br i1 %cmp29, label %if.then.30, label %if.end.32

if.then.30:                                       ; preds = %if.then.28
  %shl.i.99 = shl nuw i32 %xor, 31
  br label %cleanup

if.end.32:                                        ; preds = %if.then.28
  %cmp.i.i.83 = icmp ult i32 %and.i, 65536
  %shl.i.i.84 = shl i32 %a, 16
  %shl.a.i.i.85 = select i1 %cmp.i.i.83, i32 %shl.i.i.84, i32 %and.i
  %..i.i.86 = select i1 %cmp.i.i.83, i32 16, i32 0
  %cmp1.i.i.87 = icmp ult i32 %shl.a.i.i.85, 16777216
  %add3.i.i.88 = or i32 %..i.i.86, 8
  %shl4.i.i.89 = shl i32 %shl.a.i.i.85, 8
  %a.addr.1.i.i.90 = select i1 %cmp1.i.i.87, i32 %shl4.i.i.89, i32 %shl.a.i.i.85
  %shiftCount.1.i.i.91 = select i1 %cmp1.i.i.87, i32 %add3.i.i.88, i32 %..i.i.86
  %shr.i.i.92 = lshr i32 %a.addr.1.i.i.90, 24
  %idxprom.i.i.93 = zext i32 %shr.i.i.92 to i64
  %arrayidx.i.i.94 = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i64 0, i64 %idxprom.i.i.93
  %12 = load i32, i32* %arrayidx.i.i.94, align 4, !tbaa !1
  %add6.i.i.95 = add nsw i32 %12, %shiftCount.1.i.i.91
  %sub.i.96 = add nsw i32 %add6.i.i.95, -8
  %shl.i.97 = shl i32 %and.i, %sub.i.96
  %sub1.i.98 = sub i32 9, %add6.i.i.95
  br label %if.end.33

if.end.33:                                        ; preds = %if.end.32, %if.end.26
  %aSig.0 = phi i32 [ %shl.i.97, %if.end.32 ], [ %and.i, %if.end.26 ]
  %aExp.0 = phi i32 [ %sub1.i.98, %if.end.32 ], [ %and.i.79, %if.end.26 ]
  %cmp34 = icmp eq i32 %and.i.132, 0
  br i1 %cmp34, label %if.then.35, label %if.end.40

if.then.35:                                       ; preds = %if.end.33
  %cmp36 = icmp eq i32 %and.i.133, 0
  br i1 %cmp36, label %if.then.37, label %if.end.39

if.then.37:                                       ; preds = %if.then.35
  %shl.i.82 = shl nuw i32 %xor, 31
  br label %cleanup

if.end.39:                                        ; preds = %if.then.35
  %cmp.i.i = icmp ult i32 %and.i.133, 65536
  %shl.i.i = shl i32 %b, 16
  %shl.a.i.i = select i1 %cmp.i.i, i32 %shl.i.i, i32 %and.i.133
  %..i.i = select i1 %cmp.i.i, i32 16, i32 0
  %cmp1.i.i = icmp ult i32 %shl.a.i.i, 16777216
  %add3.i.i = or i32 %..i.i, 8
  %shl4.i.i = shl i32 %shl.a.i.i, 8
  %a.addr.1.i.i = select i1 %cmp1.i.i, i32 %shl4.i.i, i32 %shl.a.i.i
  %shiftCount.1.i.i = select i1 %cmp1.i.i, i32 %add3.i.i, i32 %..i.i
  %shr.i.i = lshr i32 %a.addr.1.i.i, 24
  %idxprom.i.i = zext i32 %shr.i.i to i64
  %arrayidx.i.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i64 0, i64 %idxprom.i.i
  %13 = load i32, i32* %arrayidx.i.i, align 4, !tbaa !1
  %add6.i.i = add nsw i32 %13, %shiftCount.1.i.i
  %sub.i = add nsw i32 %add6.i.i, -8
  %shl.i.81 = shl i32 %and.i.133, %sub.i
  %sub1.i = sub i32 9, %add6.i.i
  br label %if.end.40

if.end.40:                                        ; preds = %if.end.39, %if.end.33
  %bExp.0 = phi i32 [ %sub1.i, %if.end.39 ], [ %and.i.132, %if.end.33 ]
  %bSig.0 = phi i32 [ %shl.i.81, %if.end.39 ], [ %and.i.133, %if.end.33 ]
  %add = add nsw i32 %bExp.0, %aExp.0
  %or41 = shl i32 %aSig.0, 7
  %or42 = shl i32 %bSig.0, 8
  %14 = lshr i32 %aSig.0, 9
  %shl = and i32 %14, 49151
  %shr.i.80 = or i32 %shl, 16384
  %15 = lshr i32 %bSig.0, 8
  %shl43 = and i32 %15, 32767
  %shr3.i = or i32 %shl43, 32768
  %conv5.i = and i32 %or41, 65408
  %conv6.i = and i32 %or42, 65280
  %mul.i = mul nuw i32 %conv6.i, %conv5.i
  %mul9.i = mul nuw i32 %shr3.i, %conv5.i
  %mul12.i = mul nuw i32 %conv6.i, %shr.i.80
  %mul15.i = mul nuw i32 %shr3.i, %shr.i.80
  %add.i = add i32 %mul9.i, %mul12.i
  %cmp.i = icmp ult i32 %add.i, %mul12.i
  %conv16.i = zext i1 %cmp.i to i32
  %shl.i = shl nuw nsw i32 %conv16.i, 16
  %shr17.i = lshr i32 %add.i, 16
  %add18.i = or i32 %shl.i, %shr17.i
  %add19.i = add i32 %add18.i, %mul15.i
  %shl20.i = shl i32 %add.i, 16
  %add21.i = add i32 %shl20.i, %mul.i
  %cmp22.i = icmp ult i32 %add21.i, %shl20.i
  %conv23.i = zext i1 %cmp22.i to i32
  %add24.i = add i32 %add19.i, %conv23.i
  %cmp44 = icmp ne i32 %add21.i, 0
  %conv = zext i1 %cmp44 to i32
  %or45 = or i32 %add24.i, %conv
  %shl46 = shl i32 %or45, 1
  %cmp47 = icmp sgt i32 %shl46, -1
  %shl46.or45 = select i1 %cmp47, i32 %shl46, i32 %or45
  %16 = lshr i32 %add24.i, 30
  %17 = and i32 %16, 1
  %18 = or i32 %17, -128
  %dec.sub = add i32 %add, %18
  %call52 = tail call fastcc i32 @roundAndPackFloat32(i32 %xor, i32 %dec.sub, i32 %shl46.or45) #5
  br label %cleanup

cleanup:                                          ; preds = %cond.false.i, %if.end.i, %cond.false.i.126, %if.end.i.122, %if.end.40, %if.then.37, %if.then.30, %if.end.24, %if.then.23, %if.end.12, %if.then.11
  %retval.0 = phi i32 [ 2147483647, %if.then.11 ], [ %add.i.106, %if.end.12 ], [ 2147483647, %if.then.23 ], [ %add.i.101, %if.end.24 ], [ %shl.i.99, %if.then.30 ], [ %shl.i.82, %if.then.37 ], [ %call52, %if.end.40 ], [ %cond.or.i.125, %cond.false.i.126 ], [ %or4.i.118, %if.end.i.122 ], [ %cond.or.i, %cond.false.i ], [ %or4.i, %if.end.i ]
  ret i32 %retval.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define internal fastcc i32 @roundAndPackFloat32(i32 %zSign, i32 %zExp, i32 %zSig) #2 {
entry:
  %0 = load i32, i32* @float_rounding_mode, align 4, !tbaa !1
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.end.16, label %if.then

if.then:                                          ; preds = %entry
  %cmp1 = icmp eq i32 %0, 1
  br i1 %cmp1, label %if.end.16, label %if.else

if.else:                                          ; preds = %if.then
  %tobool4 = icmp eq i32 %zSign, 0
  br i1 %tobool4, label %if.else.9, label %if.then.5

if.then.5:                                        ; preds = %if.else
  %cmp6 = icmp eq i32 %0, 2
  %. = select i1 %cmp6, i32 0, i32 127
  br label %if.end.16

if.else.9:                                        ; preds = %if.else
  %cmp10 = icmp eq i32 %0, 3
  %.92 = select i1 %cmp10, i32 0, i32 127
  br label %if.end.16

if.end.16:                                        ; preds = %if.else.9, %if.then.5, %if.then, %entry
  %roundIncrement.0 = phi i32 [ 64, %entry ], [ 0, %if.then ], [ %., %if.then.5 ], [ %.92, %if.else.9 ]
  %and = and i32 %zSig, 127
  %conv18 = and i32 %zExp, 65535
  %cmp19 = icmp ugt i32 %conv18, 252
  br i1 %cmp19, label %if.then.21, label %if.end.51

if.then.21:                                       ; preds = %if.end.16
  %cmp22 = icmp sgt i32 %zExp, 253
  br i1 %cmp22, label %if.then.28, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then.21
  %cmp24 = icmp eq i32 %zExp, 253
  %add = add i32 %roundIncrement.0, %zSig
  %cmp26 = icmp slt i32 %add, 0
  %or.cond93 = and i1 %cmp24, %cmp26
  br i1 %or.cond93, label %if.then.28, label %if.end.31

if.then.28:                                       ; preds = %lor.lhs.false, %if.then.21
  %1 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %1, 9
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  %shl.i.97 = shl i32 %zSign, 31
  %add.i.98 = or i32 %shl.i.97, 2139095040
  %cmp29 = icmp eq i32 %roundIncrement.0, 0
  %conv30 = zext i1 %cmp29 to i32
  %sub = sub i32 %add.i.98, %conv30
  br label %cleanup

if.end.31:                                        ; preds = %lor.lhs.false
  %cmp32 = icmp slt i32 %zExp, 0
  br i1 %cmp32, label %if.else.i, label %if.end.51

if.else.i:                                        ; preds = %if.end.31
  %2 = load i32, i32* @float_detect_tininess, align 4, !tbaa !1
  %cmp35 = icmp eq i32 %2, 1
  %cmp38 = icmp slt i32 %zExp, -1
  %or.cond = or i1 %cmp38, %cmp35
  %cmp41 = icmp sgt i32 %add, -1
  %.cmp41 = or i1 %cmp41, %or.cond
  %cmp1.i = icmp sgt i32 %zExp, -32
  br i1 %cmp1.i, label %if.then.2.i, label %if.else.4.i

if.then.2.i:                                      ; preds = %if.else.i
  %sub43 = sub nsw i32 0, %zExp
  %shr.i = lshr i32 %zSig, %sub43
  %and.i = and i32 %zExp, 31
  %shl.i.95 = shl i32 %zSig, %and.i
  %cmp3.i = icmp ne i32 %shl.i.95, 0
  %conv.i = zext i1 %cmp3.i to i32
  %or.i.96 = or i32 %conv.i, %shr.i
  br label %shift32RightJamming.exit

if.else.4.i:                                      ; preds = %if.else.i
  %cmp5.i = icmp ne i32 %zSig, 0
  %conv6.i = zext i1 %cmp5.i to i32
  br label %shift32RightJamming.exit

shift32RightJamming.exit:                         ; preds = %if.then.2.i, %if.else.4.i
  %z.0.i = phi i32 [ %or.i.96, %if.then.2.i ], [ %conv6.i, %if.else.4.i ]
  %and44 = and i32 %z.0.i, 127
  %tobool47 = icmp ne i32 %and44, 0
  %or.cond69 = and i1 %.cmp41, %tobool47
  br i1 %or.cond69, label %if.then.48, label %if.end.51

if.then.48:                                       ; preds = %shift32RightJamming.exit
  %3 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.94 = or i32 %3, 4
  store i32 %or.i.94, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.51

if.end.51:                                        ; preds = %if.end.31, %if.then.48, %shift32RightJamming.exit, %if.end.16
  %zSig.addr.0 = phi i32 [ %z.0.i, %if.then.48 ], [ %z.0.i, %shift32RightJamming.exit ], [ %zSig, %if.end.31 ], [ %zSig, %if.end.16 ]
  %zExp.addr.0 = phi i32 [ 0, %if.then.48 ], [ 0, %shift32RightJamming.exit ], [ %zExp, %if.end.31 ], [ %zExp, %if.end.16 ]
  %roundBits.0 = phi i32 [ %and44, %if.then.48 ], [ %and44, %shift32RightJamming.exit ], [ %and, %if.end.31 ], [ %and, %if.end.16 ]
  %tobool52 = icmp eq i32 %roundBits.0, 0
  br i1 %tobool52, label %if.end.54, label %if.then.53

if.then.53:                                       ; preds = %if.end.51
  %4 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or = or i32 %4, 1
  store i32 %or, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.54

if.end.54:                                        ; preds = %if.end.51, %if.then.53
  %add55 = add i32 %zSig.addr.0, %roundIncrement.0
  %shr = lshr i32 %add55, 7
  %cmp56 = icmp eq i32 %roundBits.0, 64
  %and5891 = and i1 %cmp, %cmp56
  %and58 = zext i1 %and5891 to i32
  %neg = xor i32 %and58, -1
  %and59 = and i32 %shr, %neg
  %cmp60 = icmp eq i32 %and59, 0
  %shl.i = shl i32 %zSign, 31
  %zExp.addr.0.op = shl i32 %zExp.addr.0, 23
  %shl1.i = select i1 %cmp60, i32 0, i32 %zExp.addr.0.op
  %add.i = or i32 %and59, %shl.i
  %add2.i = add i32 %add.i, %shl1.i
  br label %cleanup

cleanup:                                          ; preds = %if.end.54, %if.then.28
  %retval.0 = phi i32 [ %sub, %if.then.28 ], [ %add2.i, %if.end.54 ]
  ret i32 %retval.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i32 @float32_div(i32 %a, i32 %b) #2 {
entry:
  %and.i = and i32 %a, 8388607
  %shr.i = lshr i32 %a, 23
  %and.i.93 = and i32 %shr.i, 255
  %and.i.182 = and i32 %b, 8388607
  %shr.i.180 = lshr i32 %b, 23
  %and.i.181 = and i32 %shr.i.180, 255
  %shr.i.183210 = xor i32 %b, %a
  %xor = lshr i32 %shr.i.183210, 31
  %cmp = icmp eq i32 %and.i.93, 255
  br i1 %cmp, label %if.then, label %if.end.16

if.then:                                          ; preds = %entry
  %tobool = icmp eq i32 %and.i, 0
  br i1 %tobool, label %if.end, label %if.then.6

if.then.6:                                        ; preds = %if.then
  %and.i.32.i.157 = and i32 %a, 2143289344
  %cmp.i.33.i.158 = icmp eq i32 %and.i.32.i.157, 2139095040
  %and1.i.34.i.159 = and i32 %a, 4194303
  %tobool.i.35.i.160 = icmp ne i32 %and1.i.34.i.159, 0
  %0 = and i1 %cmp.i.33.i.158, %tobool.i.35.i.160
  %1 = trunc i32 %b to i31
  %cmp.i.31.i.161 = icmp ugt i31 %1, -8388608
  %and.i.i.162 = and i32 %b, 2143289344
  %cmp.i.i.163 = icmp eq i32 %and.i.i.162, 2139095040
  %and1.i.i.164 = and i32 %b, 4194303
  %tobool.i.i.165 = icmp ne i32 %and1.i.i.164, 0
  %2 = and i1 %cmp.i.i.163, %tobool.i.i.165
  %or.i.166 = or i32 %a, 4194304
  %or4.i.167 = or i32 %b, 4194304
  %or537.i.168 = or i1 %0, %2
  br i1 %or537.i.168, label %if.then.i.170, label %if.end.i.171

if.then.i.170:                                    ; preds = %if.then.6
  %3 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.169 = or i32 %3, 16
  store i32 %or.i.i.169, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.i.171

if.end.i.171:                                     ; preds = %if.then.i.170, %if.then.6
  br i1 %2, label %cleanup, label %cond.false.i.175

cond.false.i.175:                                 ; preds = %if.end.i.171
  %tobool7.i.173.demorgan = and i1 %cmp.i.33.i.158, %tobool.i.35.i.160
  %tobool7.i.173 = xor i1 %tobool7.i.173.demorgan, true
  %4 = and i1 %cmp.i.31.i.161, %tobool7.i.173
  %cond.or.i.174 = select i1 %4, i32 %or4.i.167, i32 %or.i.166
  br label %cleanup

if.end:                                           ; preds = %if.then
  %cmp8 = icmp eq i32 %and.i.181, 255
  br i1 %cmp8, label %if.then.9, label %if.end.14

if.then.9:                                        ; preds = %if.end
  %tobool10 = icmp eq i32 %and.i.182, 0
  br i1 %tobool10, label %if.end.13, label %if.then.11

if.then.11:                                       ; preds = %if.then.9
  %and.i.32.i.135 = and i32 %a, 2143289344
  %cmp.i.33.i.136 = icmp eq i32 %and.i.32.i.135, 2139095040
  %and1.i.34.i.137 = and i32 %a, 4194303
  %tobool.i.35.i.138 = icmp ne i32 %and1.i.34.i.137, 0
  %5 = and i1 %cmp.i.33.i.136, %tobool.i.35.i.138
  %6 = trunc i32 %b to i31
  %cmp.i.31.i.139 = icmp ugt i31 %6, -8388608
  %and.i.i.140 = and i32 %b, 2143289344
  %cmp.i.i.141 = icmp eq i32 %and.i.i.140, 2139095040
  %and1.i.i.142 = and i32 %b, 4194303
  %tobool.i.i.143 = icmp ne i32 %and1.i.i.142, 0
  %7 = and i1 %cmp.i.i.141, %tobool.i.i.143
  %or.i.144 = or i32 %a, 4194304
  %or4.i.145 = or i32 %b, 4194304
  %or537.i.146 = or i1 %5, %7
  br i1 %or537.i.146, label %if.then.i.148, label %if.end.i.149

if.then.i.148:                                    ; preds = %if.then.11
  %8 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.147 = or i32 %8, 16
  store i32 %or.i.i.147, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.i.149

if.end.i.149:                                     ; preds = %if.then.i.148, %if.then.11
  br i1 %7, label %cleanup, label %cond.false.i.153

cond.false.i.153:                                 ; preds = %if.end.i.149
  %tobool7.i.151.demorgan = and i1 %cmp.i.33.i.136, %tobool.i.35.i.138
  %tobool7.i.151 = xor i1 %tobool7.i.151.demorgan, true
  %9 = and i1 %cmp.i.31.i.139, %tobool7.i.151
  %cond.or.i.152 = select i1 %9, i32 %or4.i.145, i32 %or.i.144
  br label %cleanup

if.end.13:                                        ; preds = %if.then.9
  %10 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.134 = or i32 %10, 16
  store i32 %or.i.134, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.14:                                        ; preds = %if.end
  %shl.i.132 = shl nuw i32 %xor, 31
  %add.i.133 = or i32 %shl.i.132, 2139095040
  br label %cleanup

if.end.16:                                        ; preds = %entry
  switch i32 %and.i.181, label %if.end.34 [
    i32 255, label %if.then.18
    i32 0, label %if.then.26
  ]

if.then.18:                                       ; preds = %if.end.16
  %tobool19 = icmp eq i32 %and.i.182, 0
  br i1 %tobool19, label %if.end.22, label %if.then.20

if.then.20:                                       ; preds = %if.then.18
  %and.i.32.i = and i32 %a, 2143289344
  %cmp.i.33.i = icmp eq i32 %and.i.32.i, 2139095040
  %and1.i.34.i = and i32 %a, 4194303
  %tobool.i.35.i = icmp ne i32 %and1.i.34.i, 0
  %11 = and i1 %cmp.i.33.i, %tobool.i.35.i
  %12 = trunc i32 %b to i31
  %cmp.i.31.i = icmp ugt i31 %12, -8388608
  %and.i.i = and i32 %b, 2143289344
  %cmp.i.i.127 = icmp eq i32 %and.i.i, 2139095040
  %and1.i.i = and i32 %b, 4194303
  %tobool.i.i = icmp ne i32 %and1.i.i, 0
  %13 = and i1 %cmp.i.i.127, %tobool.i.i
  %or.i.128 = or i32 %a, 4194304
  %or4.i = or i32 %b, 4194304
  %or537.i = or i1 %11, %13
  br i1 %or537.i, label %if.then.i, label %if.end.i.129

if.then.i:                                        ; preds = %if.then.20
  %14 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i = or i32 %14, 16
  store i32 %or.i.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.i.129

if.end.i.129:                                     ; preds = %if.then.i, %if.then.20
  br i1 %13, label %cleanup, label %cond.false.i.130

cond.false.i.130:                                 ; preds = %if.end.i.129
  %tobool7.i.demorgan = and i1 %cmp.i.33.i, %tobool.i.35.i
  %tobool7.i = xor i1 %tobool7.i.demorgan, true
  %15 = and i1 %cmp.i.31.i, %tobool7.i
  %cond.or.i = select i1 %15, i32 %or4.i, i32 %or.i.128
  br label %cleanup

if.end.22:                                        ; preds = %if.then.18
  %shl.i.126 = shl nuw i32 %xor, 31
  br label %cleanup

if.then.26:                                       ; preds = %if.end.16
  %cmp27 = icmp eq i32 %and.i.182, 0
  br i1 %cmp27, label %if.then.28, label %if.end.33

if.then.28:                                       ; preds = %if.then.26
  %or = or i32 %and.i.93, %and.i
  %cmp29 = icmp eq i32 %or, 0
  %16 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  br i1 %cmp29, label %if.then.30, label %if.end.31

if.then.30:                                       ; preds = %if.then.28
  %or.i.125 = or i32 %16, 16
  store i32 %or.i.125, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.31:                                        ; preds = %if.then.28
  %or.i.124 = or i32 %16, 2
  store i32 %or.i.124, i32* @float_exception_flags, align 4, !tbaa !1
  %shl.i.122 = shl nuw i32 %xor, 31
  %add.i.123 = or i32 %shl.i.122, 2139095040
  br label %cleanup

if.end.33:                                        ; preds = %if.then.26
  %cmp.i.i.106 = icmp ult i32 %and.i.182, 65536
  %shl.i.i.107 = shl i32 %b, 16
  %shl.a.i.i.108 = select i1 %cmp.i.i.106, i32 %shl.i.i.107, i32 %and.i.182
  %..i.i.109 = select i1 %cmp.i.i.106, i32 16, i32 0
  %cmp1.i.i.110 = icmp ult i32 %shl.a.i.i.108, 16777216
  %add3.i.i.111 = or i32 %..i.i.109, 8
  %shl4.i.i.112 = shl i32 %shl.a.i.i.108, 8
  %a.addr.1.i.i.113 = select i1 %cmp1.i.i.110, i32 %shl4.i.i.112, i32 %shl.a.i.i.108
  %shiftCount.1.i.i.114 = select i1 %cmp1.i.i.110, i32 %add3.i.i.111, i32 %..i.i.109
  %shr.i.i.115 = lshr i32 %a.addr.1.i.i.113, 24
  %idxprom.i.i.116 = zext i32 %shr.i.i.115 to i64
  %arrayidx.i.i.117 = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i64 0, i64 %idxprom.i.i.116
  %17 = load i32, i32* %arrayidx.i.i.117, align 4, !tbaa !1
  %add6.i.i.118 = add nsw i32 %17, %shiftCount.1.i.i.114
  %sub.i.119 = add nsw i32 %add6.i.i.118, -8
  %shl.i.120 = shl i32 %and.i.182, %sub.i.119
  %sub1.i.121 = sub i32 9, %add6.i.i.118
  br label %if.end.34

if.end.34:                                        ; preds = %if.end.16, %if.end.33
  %bSig.0 = phi i32 [ %and.i.182, %if.end.16 ], [ %shl.i.120, %if.end.33 ]
  %bExp.0 = phi i32 [ %and.i.181, %if.end.16 ], [ %sub1.i.121, %if.end.33 ]
  %cmp35 = icmp eq i32 %and.i.93, 0
  br i1 %cmp35, label %if.then.36, label %if.end.41

if.then.36:                                       ; preds = %if.end.34
  %cmp37 = icmp eq i32 %and.i, 0
  br i1 %cmp37, label %if.then.38, label %if.end.40

if.then.38:                                       ; preds = %if.then.36
  %shl.i.105 = shl nuw i32 %xor, 31
  br label %cleanup

if.end.40:                                        ; preds = %if.then.36
  %cmp.i.i = icmp ult i32 %and.i, 65536
  %shl.i.i = shl i32 %a, 16
  %shl.a.i.i = select i1 %cmp.i.i, i32 %shl.i.i, i32 %and.i
  %..i.i = select i1 %cmp.i.i, i32 16, i32 0
  %cmp1.i.i = icmp ult i32 %shl.a.i.i, 16777216
  %add3.i.i = or i32 %..i.i, 8
  %shl4.i.i = shl i32 %shl.a.i.i, 8
  %a.addr.1.i.i = select i1 %cmp1.i.i, i32 %shl4.i.i, i32 %shl.a.i.i
  %shiftCount.1.i.i = select i1 %cmp1.i.i, i32 %add3.i.i, i32 %..i.i
  %shr.i.i = lshr i32 %a.addr.1.i.i, 24
  %idxprom.i.i = zext i32 %shr.i.i to i64
  %arrayidx.i.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i64 0, i64 %idxprom.i.i
  %18 = load i32, i32* %arrayidx.i.i, align 4, !tbaa !1
  %add6.i.i = add nsw i32 %18, %shiftCount.1.i.i
  %sub.i.102 = add nsw i32 %add6.i.i, -8
  %shl.i.103 = shl i32 %and.i, %sub.i.102
  %sub1.i.104 = sub i32 9, %add6.i.i
  br label %if.end.41

if.end.41:                                        ; preds = %if.end.40, %if.end.34
  %aSig.0 = phi i32 [ %shl.i.103, %if.end.40 ], [ %and.i, %if.end.34 ]
  %aExp.0 = phi i32 [ %sub1.i.104, %if.end.40 ], [ %and.i.93, %if.end.34 ]
  %sub = sub i32 %aExp.0, %bExp.0
  %or42 = shl i32 %aSig.0, 7
  %shl = or i32 %or42, 1073741824
  %or43 = shl i32 %bSig.0, 8
  %shl44 = or i32 %or43, -2147483648
  %add45 = shl i32 %shl, 1
  %cmp46 = icmp ugt i32 %shl44, %add45
  %19 = zext i1 %cmp46 to i32
  %shr = xor i32 %19, 1
  %aSig.1 = lshr exact i32 %shl, %shr
  %zExp.0.v = select i1 %cmp46, i32 125, i32 126
  %zExp.0 = add i32 %sub, %zExp.0.v
  %cmp.i.98 = icmp ugt i32 %shl44, %aSig.1
  br i1 %cmp.i.98, label %if.end.i, label %if.end.55

if.end.i:                                         ; preds = %if.end.41
  %shr.i.99 = lshr i32 %shl44, 16
  %shl.i.100 = shl nuw i32 %shr.i.99, 16
  %cmp1.i = icmp ugt i32 %shl.i.100, %aSig.1
  br i1 %cmp1.i, label %cond.false.i, label %cond.end.i

cond.false.i:                                     ; preds = %if.end.i
  %div.i = udiv i32 %aSig.1, %shr.i.99
  %shl2.i = shl i32 %div.i, 16
  br label %cond.end.i

cond.end.i:                                       ; preds = %cond.false.i, %if.end.i
  %cond.i = phi i32 [ %shl2.i, %cond.false.i ], [ -65536, %if.end.i ]
  %shr3.i.i = lshr exact i32 %cond.i, 16
  %conv5.i.i = and i32 %or43, 65280
  %mul9.i.i = mul nuw i32 %shr3.i.i, %conv5.i.i
  %mul15.i.i = mul nuw i32 %shr3.i.i, %shr.i.99
  %shr17.i.i = lshr i32 %mul9.i.i, 16
  %shl20.i.i = shl i32 %mul9.i.i, 16
  %sub.i.i = sub i32 0, %shl20.i.i
  %cmp.i.39.i = icmp ne i32 %shl20.i.i, 0
  %conv.neg.i.i = sext i1 %cmp.i.39.i to i32
  %add24.i.neg.i = sub i32 %aSig.1, %mul15.i.i
  %sub1.i.i = sub i32 %add24.i.neg.i, %shr17.i.i
  %sub2.i.i = add i32 %sub1.i.i, %conv.neg.i.i
  %cmp3.45.i = icmp slt i32 %sub2.i.i, 0
  br i1 %cmp3.45.i, label %while.body.lr.ph.i, label %while.end.i

while.body.lr.ph.i:                               ; preds = %cond.end.i
  %shl4.i = shl i32 %bSig.0, 24
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i, %while.body.lr.ph.i
  %z.048.i = phi i32 [ %cond.i, %while.body.lr.ph.i ], [ %sub.i.101, %while.body.i ]
  %rem0.047.i = phi i32 [ %sub2.i.i, %while.body.lr.ph.i ], [ %add2.i.i, %while.body.i ]
  %rem1.046.i = phi i32 [ %sub.i.i, %while.body.lr.ph.i ], [ %add.i.37.i, %while.body.i ]
  %sub.i.101 = add i32 %z.048.i, -65536
  %add.i.37.i = add i32 %rem1.046.i, %shl4.i
  %add1.i.i = add i32 %rem0.047.i, %shr.i.99
  %cmp.i.38.i = icmp ult i32 %add.i.37.i, %rem1.046.i
  %conv.i.i = zext i1 %cmp.i.38.i to i32
  %add2.i.i = add i32 %add1.i.i, %conv.i.i
  %cmp3.i = icmp slt i32 %add2.i.i, 0
  br i1 %cmp3.i, label %while.body.i, label %while.end.i.loopexit

while.end.i.loopexit:                             ; preds = %while.body.i
  %add2.i.i.lcssa = phi i32 [ %add2.i.i, %while.body.i ]
  %add.i.37.i.lcssa = phi i32 [ %add.i.37.i, %while.body.i ]
  %sub.i.101.lcssa = phi i32 [ %sub.i.101, %while.body.i ]
  br label %while.end.i

while.end.i:                                      ; preds = %while.end.i.loopexit, %cond.end.i
  %z.0.lcssa.i = phi i32 [ %cond.i, %cond.end.i ], [ %sub.i.101.lcssa, %while.end.i.loopexit ]
  %rem0.0.lcssa.i = phi i32 [ %sub2.i.i, %cond.end.i ], [ %add2.i.i.lcssa, %while.end.i.loopexit ]
  %rem1.0.lcssa.i = phi i32 [ %sub.i.i, %cond.end.i ], [ %add.i.37.i.lcssa, %while.end.i.loopexit ]
  %shl5.i = shl i32 %rem0.0.lcssa.i, 16
  %shr6.i = lshr i32 %rem1.0.lcssa.i, 16
  %or.i = or i32 %shr6.i, %shl5.i
  %cmp8.i = icmp ugt i32 %shl.i.100, %or.i
  br i1 %cmp8.i, label %cond.false.10.i, label %estimateDiv64To32.exit

cond.false.10.i:                                  ; preds = %while.end.i
  %div11.i = udiv i32 %or.i, %shr.i.99
  br label %estimateDiv64To32.exit

estimateDiv64To32.exit:                           ; preds = %while.end.i, %cond.false.10.i
  %cond13.i = phi i32 [ %div11.i, %cond.false.10.i ], [ 65535, %while.end.i ]
  %or14.i = or i32 %cond13.i, %z.0.lcssa.i
  %and = and i32 %or14.i, 63
  %cmp50 = icmp ult i32 %and, 3
  br i1 %cmp50, label %if.then.51, label %if.end.55

if.then.51:                                       ; preds = %estimateDiv64To32.exit
  %shr3.i = lshr i32 %or14.i, 16
  %conv6.i = and i32 %or14.i, 65535
  %mul.i = mul nuw i32 %conv6.i, %conv5.i.i
  %mul9.i = mul nuw i32 %shr3.i, %conv5.i.i
  %mul12.i = mul nuw i32 %conv6.i, %shr.i.99
  %mul15.i = mul nuw i32 %shr3.i, %shr.i.99
  %add.i.96 = add i32 %mul9.i, %mul12.i
  %cmp.i.97 = icmp ult i32 %add.i.96, %mul12.i
  %conv16.i = zext i1 %cmp.i.97 to i32
  %shl.i = shl nuw nsw i32 %conv16.i, 16
  %shr17.i = lshr i32 %add.i.96, 16
  %add18.i = or i32 %shl.i, %shr17.i
  %shl20.i = shl i32 %add.i.96, 16
  %add21.i = add i32 %shl20.i, %mul.i
  %cmp22.i = icmp ult i32 %add21.i, %shl20.i
  %sub.i = sub i32 0, %add21.i
  %conv23.i.neg = sext i1 %cmp22.i to i32
  %cmp.i.94 = icmp ne i32 %add21.i, 0
  %conv.neg.i = sext i1 %cmp.i.94 to i32
  %add19.i.neg = sub i32 %aSig.1, %mul15.i
  %add24.i.neg = sub i32 %add19.i.neg, %add18.i
  %sub1.i = add i32 %add24.i.neg, %conv23.i.neg
  %sub2.i = add i32 %sub1.i, %conv.neg.i
  %cmp52.211 = icmp slt i32 %sub2.i, 0
  br i1 %cmp52.211, label %while.body.preheader, label %while.end

while.body.preheader:                             ; preds = %if.then.51
  br label %while.body

while.body:                                       ; preds = %while.body.preheader, %while.body
  %zSig.0214 = phi i32 [ %dec, %while.body ], [ %or14.i, %while.body.preheader ]
  %rem1.0213 = phi i32 [ %add.i, %while.body ], [ %sub.i, %while.body.preheader ]
  %rem0.0212 = phi i32 [ %add2.i, %while.body ], [ %sub2.i, %while.body.preheader ]
  %dec = add i32 %zSig.0214, -1
  %add.i = add i32 %rem1.0213, %shl44
  %cmp.i = icmp ult i32 %add.i, %rem1.0213
  %conv.i = zext i1 %cmp.i to i32
  %add2.i = add i32 %conv.i, %rem0.0212
  %cmp52 = icmp slt i32 %add2.i, 0
  br i1 %cmp52, label %while.body, label %while.end.loopexit

while.end.loopexit:                               ; preds = %while.body
  %add.i.lcssa = phi i32 [ %add.i, %while.body ]
  %dec.lcssa = phi i32 [ %dec, %while.body ]
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %if.then.51
  %zSig.0.lcssa = phi i32 [ %or14.i, %if.then.51 ], [ %dec.lcssa, %while.end.loopexit ]
  %rem1.0.lcssa = phi i32 [ %sub.i, %if.then.51 ], [ %add.i.lcssa, %while.end.loopexit ]
  %cmp53 = icmp ne i32 %rem1.0.lcssa, 0
  %conv = zext i1 %cmp53 to i32
  %or54 = or i32 %conv, %zSig.0.lcssa
  br label %if.end.55

if.end.55:                                        ; preds = %if.end.41, %while.end, %estimateDiv64To32.exit
  %zSig.1 = phi i32 [ %or54, %while.end ], [ %or14.i, %estimateDiv64To32.exit ], [ -1, %if.end.41 ]
  %call56 = tail call fastcc i32 @roundAndPackFloat32(i32 %xor, i32 %zExp.0, i32 %zSig.1) #5
  br label %cleanup

cleanup:                                          ; preds = %cond.false.i.130, %if.end.i.129, %cond.false.i.153, %if.end.i.149, %cond.false.i.175, %if.end.i.171, %if.end.55, %if.then.38, %if.end.31, %if.then.30, %if.end.22, %if.end.14, %if.end.13
  %retval.0 = phi i32 [ 2147483647, %if.end.13 ], [ %add.i.133, %if.end.14 ], [ %shl.i.126, %if.end.22 ], [ 2147483647, %if.then.30 ], [ %add.i.123, %if.end.31 ], [ %shl.i.105, %if.then.38 ], [ %call56, %if.end.55 ], [ %cond.or.i.174, %cond.false.i.175 ], [ %or4.i.167, %if.end.i.171 ], [ %cond.or.i.152, %cond.false.i.153 ], [ %or4.i.145, %if.end.i.149 ], [ %cond.or.i, %cond.false.i.130 ], [ %or4.i, %if.end.i.129 ]
  ret i32 %retval.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i32 @float32_rem(i32 %a, i32 %b) #2 {
entry:
  %and.i = and i32 %a, 8388607
  %shr.i = lshr i32 %a, 23
  %and.i.145 = and i32 %shr.i, 255
  %shr.i.264 = lshr i32 %a, 31
  %and.i.263 = and i32 %b, 8388607
  %shr.i.261 = lshr i32 %b, 23
  %and.i.262 = and i32 %shr.i.261, 255
  %cmp = icmp eq i32 %and.i.145, 255
  br i1 %cmp, label %if.then, label %if.end.10

if.then:                                          ; preds = %entry
  %tobool = icmp eq i32 %and.i, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then.8

lor.lhs.false:                                    ; preds = %if.then
  %cmp6 = icmp eq i32 %and.i.262, 255
  %tobool7 = icmp ne i32 %and.i.263, 0
  %or.cond = and i1 %tobool7, %cmp6
  br i1 %or.cond, label %if.then.8, label %if.end

if.then.8:                                        ; preds = %if.then, %lor.lhs.false
  %and.i.32.i.239 = and i32 %a, 2143289344
  %cmp.i.33.i.240 = icmp eq i32 %and.i.32.i.239, 2139095040
  %and1.i.34.i.241 = and i32 %a, 4194303
  %tobool.i.35.i.242 = icmp ne i32 %and1.i.34.i.241, 0
  %0 = and i1 %cmp.i.33.i.240, %tobool.i.35.i.242
  %1 = trunc i32 %b to i31
  %cmp.i.31.i.243 = icmp ugt i31 %1, -8388608
  %and.i.i.244 = and i32 %b, 2143289344
  %cmp.i.i.245 = icmp eq i32 %and.i.i.244, 2139095040
  %and1.i.i.246 = and i32 %b, 4194303
  %tobool.i.i.247 = icmp ne i32 %and1.i.i.246, 0
  %2 = and i1 %cmp.i.i.245, %tobool.i.i.247
  %or.i.248 = or i32 %a, 4194304
  %or4.i.249 = or i32 %b, 4194304
  %or537.i.250 = or i1 %0, %2
  br i1 %or537.i.250, label %if.then.i.252, label %if.end.i.253

if.then.i.252:                                    ; preds = %if.then.8
  %3 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.251 = or i32 %3, 16
  store i32 %or.i.i.251, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.i.253

if.end.i.253:                                     ; preds = %if.then.i.252, %if.then.8
  br i1 %2, label %cleanup, label %cond.false.i.257

cond.false.i.257:                                 ; preds = %if.end.i.253
  %tobool7.i.255.demorgan = and i1 %cmp.i.33.i.240, %tobool.i.35.i.242
  %tobool7.i.255 = xor i1 %tobool7.i.255.demorgan, true
  %4 = and i1 %cmp.i.31.i.243, %tobool7.i.255
  %cond.or.i.256 = select i1 %4, i32 %or4.i.249, i32 %or.i.248
  br label %cleanup

if.end:                                           ; preds = %lor.lhs.false
  %5 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.238 = or i32 %5, 16
  store i32 %or.i.238, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.10:                                        ; preds = %entry
  switch i32 %and.i.262, label %if.end.23 [
    i32 255, label %if.then.12
    i32 0, label %if.then.19
  ]

if.then.12:                                       ; preds = %if.end.10
  %tobool13 = icmp eq i32 %and.i.263, 0
  br i1 %tobool13, label %cleanup, label %if.then.14

if.then.14:                                       ; preds = %if.then.12
  %and.i.32.i = and i32 %a, 2143289344
  %cmp.i.33.i = icmp eq i32 %and.i.32.i, 2139095040
  %and1.i.34.i = and i32 %a, 4194303
  %tobool.i.35.i = icmp ne i32 %and1.i.34.i, 0
  %6 = and i1 %cmp.i.33.i, %tobool.i.35.i
  %7 = trunc i32 %b to i31
  %cmp.i.31.i = icmp ugt i31 %7, -8388608
  %and.i.i = and i32 %b, 2143289344
  %cmp.i.i.233 = icmp eq i32 %and.i.i, 2139095040
  %and1.i.i = and i32 %b, 4194303
  %tobool.i.i = icmp ne i32 %and1.i.i, 0
  %8 = and i1 %cmp.i.i.233, %tobool.i.i
  %or.i.234 = or i32 %a, 4194304
  %or4.i = or i32 %b, 4194304
  %or537.i = or i1 %6, %8
  br i1 %or537.i, label %if.then.i, label %if.end.i.235

if.then.i:                                        ; preds = %if.then.14
  %9 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i = or i32 %9, 16
  store i32 %or.i.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.i.235

if.end.i.235:                                     ; preds = %if.then.i, %if.then.14
  br i1 %8, label %cleanup, label %cond.false.i.236

cond.false.i.236:                                 ; preds = %if.end.i.235
  %tobool7.i.demorgan = and i1 %cmp.i.33.i, %tobool.i.35.i
  %tobool7.i = xor i1 %tobool7.i.demorgan, true
  %10 = and i1 %cmp.i.31.i, %tobool7.i
  %cond.or.i = select i1 %10, i32 %or4.i, i32 %or.i.234
  br label %cleanup

if.then.19:                                       ; preds = %if.end.10
  %cmp20 = icmp eq i32 %and.i.263, 0
  br i1 %cmp20, label %if.then.21, label %if.end.22

if.then.21:                                       ; preds = %if.then.19
  %11 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.232 = or i32 %11, 16
  store i32 %or.i.232, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.22:                                        ; preds = %if.then.19
  %cmp.i.i.216 = icmp ult i32 %and.i.263, 65536
  %shl.i.i.217 = shl i32 %b, 16
  %shl.a.i.i.218 = select i1 %cmp.i.i.216, i32 %shl.i.i.217, i32 %and.i.263
  %..i.i.219 = select i1 %cmp.i.i.216, i32 16, i32 0
  %cmp1.i.i.220 = icmp ult i32 %shl.a.i.i.218, 16777216
  %add3.i.i.221 = or i32 %..i.i.219, 8
  %shl4.i.i.222 = shl i32 %shl.a.i.i.218, 8
  %a.addr.1.i.i.223 = select i1 %cmp1.i.i.220, i32 %shl4.i.i.222, i32 %shl.a.i.i.218
  %shiftCount.1.i.i.224 = select i1 %cmp1.i.i.220, i32 %add3.i.i.221, i32 %..i.i.219
  %shr.i.i.225 = lshr i32 %a.addr.1.i.i.223, 24
  %idxprom.i.i.226 = zext i32 %shr.i.i.225 to i64
  %arrayidx.i.i.227 = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i64 0, i64 %idxprom.i.i.226
  %12 = load i32, i32* %arrayidx.i.i.227, align 4, !tbaa !1
  %add6.i.i.228 = add nsw i32 %12, %shiftCount.1.i.i.224
  %sub.i.229 = add nsw i32 %add6.i.i.228, -8
  %shl.i.230 = shl i32 %and.i.263, %sub.i.229
  %sub1.i.231 = sub i32 9, %add6.i.i.228
  br label %if.end.23

if.end.23:                                        ; preds = %if.end.10, %if.end.22
  %bExp.0 = phi i32 [ %and.i.262, %if.end.10 ], [ %sub1.i.231, %if.end.22 ]
  %bSig.0 = phi i32 [ %and.i.263, %if.end.10 ], [ %shl.i.230, %if.end.22 ]
  %cmp24 = icmp eq i32 %and.i.145, 0
  br i1 %cmp24, label %if.then.25, label %if.end.29

if.then.25:                                       ; preds = %if.end.23
  %cmp26 = icmp eq i32 %and.i, 0
  br i1 %cmp26, label %cleanup, label %if.end.28

if.end.28:                                        ; preds = %if.then.25
  %cmp.i.i.200 = icmp ult i32 %and.i, 65536
  %shl.i.i.201 = shl i32 %a, 16
  %shl.a.i.i.202 = select i1 %cmp.i.i.200, i32 %shl.i.i.201, i32 %and.i
  %..i.i.203 = select i1 %cmp.i.i.200, i32 16, i32 0
  %cmp1.i.i.204 = icmp ult i32 %shl.a.i.i.202, 16777216
  %add3.i.i.205 = or i32 %..i.i.203, 8
  %shl4.i.i.206 = shl i32 %shl.a.i.i.202, 8
  %a.addr.1.i.i.207 = select i1 %cmp1.i.i.204, i32 %shl4.i.i.206, i32 %shl.a.i.i.202
  %shiftCount.1.i.i.208 = select i1 %cmp1.i.i.204, i32 %add3.i.i.205, i32 %..i.i.203
  %shr.i.i.209 = lshr i32 %a.addr.1.i.i.207, 24
  %idxprom.i.i.210 = zext i32 %shr.i.i.209 to i64
  %arrayidx.i.i.211 = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i64 0, i64 %idxprom.i.i.210
  %13 = load i32, i32* %arrayidx.i.i.211, align 4, !tbaa !1
  %add6.i.i.212 = add nsw i32 %13, %shiftCount.1.i.i.208
  %sub.i.213 = add nsw i32 %add6.i.i.212, -8
  %shl.i.214 = shl i32 %and.i, %sub.i.213
  %sub1.i.215 = sub i32 9, %add6.i.i.212
  br label %if.end.29

if.end.29:                                        ; preds = %if.end.28, %if.end.23
  %aExp.0 = phi i32 [ %sub1.i.215, %if.end.28 ], [ %and.i.145, %if.end.23 ]
  %aSig.0 = phi i32 [ %shl.i.214, %if.end.28 ], [ %and.i, %if.end.23 ]
  %sub = sub nsw i32 %aExp.0, %bExp.0
  %or = shl i32 %aSig.0, 8
  %shl = or i32 %or, -2147483648
  %or30 = shl i32 %bSig.0, 8
  %shl31 = or i32 %or30, -2147483648
  %cmp32 = icmp slt i32 %sub, 0
  br i1 %cmp32, label %if.then.33, label %if.end.37

if.then.33:                                       ; preds = %if.end.29
  %cmp34 = icmp slt i32 %sub, -1
  br i1 %cmp34, label %cleanup, label %while.end.thread

while.end.thread:                                 ; preds = %if.then.33
  %shr = lshr exact i32 %shl, 1
  br label %if.else

if.end.37:                                        ; preds = %if.end.29
  %cmp38 = icmp uge i32 %shl, %shl31
  %conv = zext i1 %cmp38 to i32
  %sub41 = select i1 %cmp38, i32 %shl31, i32 0
  %sub41.aSig.1 = sub i32 %shl, %sub41
  %sub43 = add nsw i32 %sub, -32
  %cmp44.300 = icmp sgt i32 %sub, 32
  br i1 %cmp44.300, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %if.end.37
  %shr.i.150 = lshr i32 %shl31, 16
  %shl.i.151 = shl nuw i32 %shr.i.150, 16
  %conv5.i.i.159 = and i32 %or30, 65280
  %shl4.i.172 = shl i32 %bSig.0, 24
  %shr50 = lshr exact i32 %shl31, 2
  %mul = sub nsw i32 0, %shr50
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %estimateDiv64To32.exit199
  %expDiff.0302 = phi i32 [ %sub43, %while.body.lr.ph ], [ %sub52, %estimateDiv64To32.exit199 ]
  %aSig.3301 = phi i32 [ %sub41.aSig.1, %while.body.lr.ph ], [ %sub51, %estimateDiv64To32.exit199 ]
  %cmp.i.149 = icmp ugt i32 %shl31, %aSig.3301
  br i1 %cmp.i.149, label %if.end.i.153, label %estimateDiv64To32.exit199

if.end.i.153:                                     ; preds = %while.body
  %cmp1.i.152 = icmp ugt i32 %shl.i.151, %aSig.3301
  br i1 %cmp1.i.152, label %cond.false.i.156, label %cond.end.i.171

cond.false.i.156:                                 ; preds = %if.end.i.153
  %div.i.154 = udiv i32 %aSig.3301, %shr.i.150
  %shl2.i.155 = shl i32 %div.i.154, 16
  br label %cond.end.i.171

cond.end.i.171:                                   ; preds = %cond.false.i.156, %if.end.i.153
  %cond.i.157 = phi i32 [ %shl2.i.155, %cond.false.i.156 ], [ -65536, %if.end.i.153 ]
  %shr3.i.i.158 = lshr exact i32 %cond.i.157, 16
  %mul9.i.i.160 = mul nuw i32 %shr3.i.i.158, %conv5.i.i.159
  %mul15.i.i.161 = mul nuw i32 %shr3.i.i.158, %shr.i.150
  %shr17.i.i.162 = lshr i32 %mul9.i.i.160, 16
  %shl20.i.i.163 = shl i32 %mul9.i.i.160, 16
  %sub.i.i.164 = sub i32 0, %shl20.i.i.163
  %cmp.i.39.i.165 = icmp ne i32 %shl20.i.i.163, 0
  %conv.neg.i.i.166 = sext i1 %cmp.i.39.i.165 to i32
  %add24.i.neg.i.167 = sub i32 %aSig.3301, %mul15.i.i.161
  %sub1.i.i.168 = sub i32 %add24.i.neg.i.167, %shr17.i.i.162
  %sub2.i.i.169 = add i32 %sub1.i.i.168, %conv.neg.i.i.166
  %cmp3.45.i.170 = icmp slt i32 %sub2.i.i.169, 0
  br i1 %cmp3.45.i.170, label %while.body.i.184.preheader, label %while.end.i.192

while.body.i.184.preheader:                       ; preds = %cond.end.i.171
  br label %while.body.i.184

while.body.i.184:                                 ; preds = %while.body.i.184.preheader, %while.body.i.184
  %z.048.i.174 = phi i32 [ %sub.i.177, %while.body.i.184 ], [ %cond.i.157, %while.body.i.184.preheader ]
  %rem0.047.i.175 = phi i32 [ %add2.i.i.182, %while.body.i.184 ], [ %sub2.i.i.169, %while.body.i.184.preheader ]
  %rem1.046.i.176 = phi i32 [ %add.i.37.i.178, %while.body.i.184 ], [ %sub.i.i.164, %while.body.i.184.preheader ]
  %sub.i.177 = add i32 %z.048.i.174, -65536
  %add.i.37.i.178 = add i32 %rem1.046.i.176, %shl4.i.172
  %add1.i.i.179 = add i32 %rem0.047.i.175, %shr.i.150
  %cmp.i.38.i.180 = icmp ult i32 %add.i.37.i.178, %rem1.046.i.176
  %conv.i.i.181 = zext i1 %cmp.i.38.i.180 to i32
  %add2.i.i.182 = add i32 %add1.i.i.179, %conv.i.i.181
  %cmp3.i.183 = icmp slt i32 %add2.i.i.182, 0
  br i1 %cmp3.i.183, label %while.body.i.184, label %while.end.i.192.loopexit

while.end.i.192.loopexit:                         ; preds = %while.body.i.184
  %add2.i.i.182.lcssa = phi i32 [ %add2.i.i.182, %while.body.i.184 ]
  %add.i.37.i.178.lcssa = phi i32 [ %add.i.37.i.178, %while.body.i.184 ]
  %sub.i.177.lcssa = phi i32 [ %sub.i.177, %while.body.i.184 ]
  br label %while.end.i.192

while.end.i.192:                                  ; preds = %while.end.i.192.loopexit, %cond.end.i.171
  %z.0.lcssa.i.185 = phi i32 [ %cond.i.157, %cond.end.i.171 ], [ %sub.i.177.lcssa, %while.end.i.192.loopexit ]
  %rem0.0.lcssa.i.186 = phi i32 [ %sub2.i.i.169, %cond.end.i.171 ], [ %add2.i.i.182.lcssa, %while.end.i.192.loopexit ]
  %rem1.0.lcssa.i.187 = phi i32 [ %sub.i.i.164, %cond.end.i.171 ], [ %add.i.37.i.178.lcssa, %while.end.i.192.loopexit ]
  %shl5.i.188 = shl i32 %rem0.0.lcssa.i.186, 16
  %shr6.i.189 = lshr i32 %rem1.0.lcssa.i.187, 16
  %or.i.190 = or i32 %shr6.i.189, %shl5.i.188
  %cmp8.i.191 = icmp ugt i32 %shl.i.151, %or.i.190
  br i1 %cmp8.i.191, label %cond.false.10.i.194, label %cond.end.12.i.197

cond.false.10.i.194:                              ; preds = %while.end.i.192
  %div11.i.193 = udiv i32 %or.i.190, %shr.i.150
  br label %cond.end.12.i.197

cond.end.12.i.197:                                ; preds = %cond.false.10.i.194, %while.end.i.192
  %cond13.i.195 = phi i32 [ %div11.i.193, %cond.false.10.i.194 ], [ 65535, %while.end.i.192 ]
  %or14.i.196 = or i32 %cond13.i.195, %z.0.lcssa.i.185
  br label %estimateDiv64To32.exit199

estimateDiv64To32.exit199:                        ; preds = %while.body, %cond.end.12.i.197
  %retval.0.i.198 = phi i32 [ %or14.i.196, %cond.end.12.i.197 ], [ -1, %while.body ]
  %cmp47 = icmp ugt i32 %retval.0.i.198, 2
  %sub49 = add i32 %retval.0.i.198, -2
  %cond = select i1 %cmp47, i32 %sub49, i32 0
  %sub51 = mul i32 %cond, %mul
  %sub52 = add nsw i32 %expDiff.0302, -30
  %cmp44 = icmp sgt i32 %expDiff.0302, 30
  br i1 %cmp44, label %while.body, label %while.end.loopexit

while.end.loopexit:                               ; preds = %estimateDiv64To32.exit199
  %sub52.lcssa = phi i32 [ %sub52, %estimateDiv64To32.exit199 ]
  %sub51.lcssa = phi i32 [ %sub51, %estimateDiv64To32.exit199 ]
  %cond.lcssa = phi i32 [ %cond, %estimateDiv64To32.exit199 ]
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %if.end.37
  %expDiff.0.lcssa = phi i32 [ %sub43, %if.end.37 ], [ %sub52.lcssa, %while.end.loopexit ]
  %q.0.lcssa = phi i32 [ %conv, %if.end.37 ], [ %cond.lcssa, %while.end.loopexit ]
  %aSig.3.lcssa = phi i32 [ %sub41.aSig.1, %if.end.37 ], [ %sub51.lcssa, %while.end.loopexit ]
  %cmp53 = icmp sgt i32 %expDiff.0.lcssa, -32
  br i1 %cmp53, label %if.then.55, label %if.else

if.then.55:                                       ; preds = %while.end
  %cmp.i = icmp ugt i32 %shl31, %aSig.3.lcssa
  br i1 %cmp.i, label %if.end.i, label %estimateDiv64To32.exit

if.end.i:                                         ; preds = %if.then.55
  %shr.i.146 = lshr i32 %shl31, 16
  %shl.i.147 = shl nuw i32 %shr.i.146, 16
  %cmp1.i = icmp ugt i32 %shl.i.147, %aSig.3.lcssa
  br i1 %cmp1.i, label %cond.false.i, label %cond.end.i

cond.false.i:                                     ; preds = %if.end.i
  %div.i = udiv i32 %aSig.3.lcssa, %shr.i.146
  %shl2.i = shl i32 %div.i, 16
  br label %cond.end.i

cond.end.i:                                       ; preds = %cond.false.i, %if.end.i
  %cond.i = phi i32 [ %shl2.i, %cond.false.i ], [ -65536, %if.end.i ]
  %shr3.i.i = lshr exact i32 %cond.i, 16
  %conv5.i.i = and i32 %or30, 65280
  %mul9.i.i = mul nuw i32 %shr3.i.i, %conv5.i.i
  %mul15.i.i = mul nuw i32 %shr3.i.i, %shr.i.146
  %shr17.i.i = lshr i32 %mul9.i.i, 16
  %shl20.i.i = shl i32 %mul9.i.i, 16
  %sub.i.i = sub i32 0, %shl20.i.i
  %cmp.i.39.i = icmp ne i32 %shl20.i.i, 0
  %conv.neg.i.i = sext i1 %cmp.i.39.i to i32
  %add24.i.neg.i = sub i32 %aSig.3.lcssa, %mul15.i.i
  %sub1.i.i = sub i32 %add24.i.neg.i, %shr17.i.i
  %sub2.i.i = add i32 %sub1.i.i, %conv.neg.i.i
  %cmp3.45.i = icmp slt i32 %sub2.i.i, 0
  br i1 %cmp3.45.i, label %while.body.lr.ph.i, label %while.end.i

while.body.lr.ph.i:                               ; preds = %cond.end.i
  %shl4.i = shl i32 %bSig.0, 24
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i, %while.body.lr.ph.i
  %z.048.i = phi i32 [ %cond.i, %while.body.lr.ph.i ], [ %sub.i.148, %while.body.i ]
  %rem0.047.i = phi i32 [ %sub2.i.i, %while.body.lr.ph.i ], [ %add2.i.i, %while.body.i ]
  %rem1.046.i = phi i32 [ %sub.i.i, %while.body.lr.ph.i ], [ %add.i.37.i, %while.body.i ]
  %sub.i.148 = add i32 %z.048.i, -65536
  %add.i.37.i = add i32 %rem1.046.i, %shl4.i
  %add1.i.i = add i32 %rem0.047.i, %shr.i.146
  %cmp.i.38.i = icmp ult i32 %add.i.37.i, %rem1.046.i
  %conv.i.i = zext i1 %cmp.i.38.i to i32
  %add2.i.i = add i32 %add1.i.i, %conv.i.i
  %cmp3.i = icmp slt i32 %add2.i.i, 0
  br i1 %cmp3.i, label %while.body.i, label %while.end.i.loopexit

while.end.i.loopexit:                             ; preds = %while.body.i
  %add2.i.i.lcssa = phi i32 [ %add2.i.i, %while.body.i ]
  %add.i.37.i.lcssa = phi i32 [ %add.i.37.i, %while.body.i ]
  %sub.i.148.lcssa = phi i32 [ %sub.i.148, %while.body.i ]
  br label %while.end.i

while.end.i:                                      ; preds = %while.end.i.loopexit, %cond.end.i
  %z.0.lcssa.i = phi i32 [ %cond.i, %cond.end.i ], [ %sub.i.148.lcssa, %while.end.i.loopexit ]
  %rem0.0.lcssa.i = phi i32 [ %sub2.i.i, %cond.end.i ], [ %add2.i.i.lcssa, %while.end.i.loopexit ]
  %rem1.0.lcssa.i = phi i32 [ %sub.i.i, %cond.end.i ], [ %add.i.37.i.lcssa, %while.end.i.loopexit ]
  %shl5.i = shl i32 %rem0.0.lcssa.i, 16
  %shr6.i = lshr i32 %rem1.0.lcssa.i, 16
  %or.i = or i32 %shr6.i, %shl5.i
  %cmp8.i = icmp ugt i32 %shl.i.147, %or.i
  br i1 %cmp8.i, label %cond.false.10.i, label %cond.end.12.i

cond.false.10.i:                                  ; preds = %while.end.i
  %div11.i = udiv i32 %or.i, %shr.i.146
  br label %cond.end.12.i

cond.end.12.i:                                    ; preds = %cond.false.10.i, %while.end.i
  %cond13.i = phi i32 [ %div11.i, %cond.false.10.i ], [ 65535, %while.end.i ]
  %or14.i = or i32 %cond13.i, %z.0.lcssa.i
  br label %estimateDiv64To32.exit

estimateDiv64To32.exit:                           ; preds = %if.then.55, %cond.end.12.i
  %retval.0.i = phi i32 [ %or14.i, %cond.end.12.i ], [ -1, %if.then.55 ]
  %cmp57 = icmp ugt i32 %retval.0.i, 2
  %sub60 = add i32 %retval.0.i, -2
  %cond63 = select i1 %cmp57, i32 %sub60, i32 0
  %sub64 = sub i32 0, %expDiff.0.lcssa
  %shr65 = lshr i32 %cond63, %sub64
  %shr66 = lshr exact i32 %shl31, 2
  %shr67 = lshr i32 %aSig.3.lcssa, 1
  %sub68 = add nsw i32 %expDiff.0.lcssa, 31
  %shl69 = shl i32 %shr67, %sub68
  %mul70 = mul i32 %shr65, %shr66
  %sub71 = sub i32 %shl69, %mul70
  br label %do.body.preheader

if.else:                                          ; preds = %while.end.thread, %while.end
  %aSig.3.lcssa313 = phi i32 [ %shr, %while.end.thread ], [ %aSig.3.lcssa, %while.end ]
  %q.0.lcssa312 = phi i32 [ 0, %while.end.thread ], [ %q.0.lcssa, %while.end ]
  %shr72 = lshr i32 %aSig.3.lcssa313, 2
  %shr73 = lshr exact i32 %shl31, 2
  br label %do.body.preheader

do.body.preheader:                                ; preds = %if.else, %estimateDiv64To32.exit
  %aSig.4.ph = phi i32 [ %shr72, %if.else ], [ %sub71, %estimateDiv64To32.exit ]
  %bSig.1.ph = phi i32 [ %shr73, %if.else ], [ %shr66, %estimateDiv64To32.exit ]
  %q.1.ph = phi i32 [ %q.0.lcssa312, %if.else ], [ %shr65, %estimateDiv64To32.exit ]
  br label %do.body

do.body:                                          ; preds = %do.body.preheader, %do.body
  %aSig.4 = phi i32 [ %sub75, %do.body ], [ %aSig.4.ph, %do.body.preheader ]
  %q.1 = phi i32 [ %inc, %do.body ], [ %q.1.ph, %do.body.preheader ]
  %inc = add i32 %q.1, 1
  %sub75 = sub i32 %aSig.4, %bSig.1.ph
  %cmp76 = icmp sgt i32 %sub75, -1
  br i1 %cmp76, label %do.body, label %do.end

do.end:                                           ; preds = %do.body
  %sub75.lcssa = phi i32 [ %sub75, %do.body ]
  %inc.lcssa = phi i32 [ %inc, %do.body ]
  %aSig.4.lcssa = phi i32 [ %aSig.4, %do.body ]
  %add78 = add i32 %sub75.lcssa, %aSig.4.lcssa
  %cmp79 = icmp slt i32 %add78, 0
  br i1 %cmp79, label %if.end.87, label %lor.lhs.false.81

lor.lhs.false.81:                                 ; preds = %do.end
  %cmp82 = icmp ne i32 %add78, 0
  %and = and i32 %inc.lcssa, 1
  %tobool85 = icmp eq i32 %and, 0
  %or.cond144 = or i1 %cmp82, %tobool85
  br i1 %or.cond144, label %if.then.91, label %if.end.87

if.end.87:                                        ; preds = %do.end, %lor.lhs.false.81
  %cmp88 = icmp slt i32 %aSig.4.lcssa, 0
  %.lobit = lshr i32 %aSig.4.lcssa, 31
  br i1 %cmp88, label %if.then.91, label %if.end.93

if.then.91:                                       ; preds = %lor.lhs.false.81, %if.end.87
  %.lobit298 = phi i32 [ %.lobit, %if.end.87 ], [ 1, %lor.lhs.false.81 ]
  %aSig.5296 = phi i32 [ %aSig.4.lcssa, %if.end.87 ], [ %sub75.lcssa, %lor.lhs.false.81 ]
  %sub92 = sub i32 0, %aSig.5296
  br label %if.end.93

if.end.93:                                        ; preds = %if.then.91, %if.end.87
  %.lobit297 = phi i32 [ %.lobit298, %if.then.91 ], [ %.lobit, %if.end.87 ]
  %aSig.6 = phi i32 [ %sub92, %if.then.91 ], [ %aSig.4.lcssa, %if.end.87 ]
  %xor = xor i32 %.lobit297, %shr.i.264
  %cmp.i.i = icmp ult i32 %aSig.6, 65536
  %shl.i.i = shl i32 %aSig.6, 16
  %shl.a.i.i = select i1 %cmp.i.i, i32 %shl.i.i, i32 %aSig.6
  %..i.i = select i1 %cmp.i.i, i32 16, i32 0
  %cmp1.i.i = icmp ult i32 %shl.a.i.i, 16777216
  %add3.i.i = or i32 %..i.i, 8
  %shl4.i.i = shl i32 %shl.a.i.i, 8
  %a.addr.1.i.i = select i1 %cmp1.i.i, i32 %shl4.i.i, i32 %shl.a.i.i
  %shiftCount.1.i.i = select i1 %cmp1.i.i, i32 %add3.i.i, i32 %..i.i
  %shr.i.i = lshr i32 %a.addr.1.i.i, 24
  %idxprom.i.i = zext i32 %shr.i.i to i64
  %arrayidx.i.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i64 0, i64 %idxprom.i.i
  %14 = load i32, i32* %arrayidx.i.i, align 4, !tbaa !1
  %add6.i.i = add i32 %14, -1
  %sub.i = add i32 %add6.i.i, %shiftCount.1.i.i
  %sub1.i = sub nsw i32 %bExp.0, %sub.i
  %shl.i = shl i32 %aSig.6, %sub.i
  %call2.i = tail call fastcc i32 @roundAndPackFloat32(i32 %xor, i32 %sub1.i, i32 %shl.i) #4
  br label %cleanup

cleanup:                                          ; preds = %cond.false.i.236, %if.end.i.235, %cond.false.i.257, %if.end.i.253, %if.then.33, %if.then.25, %if.then.12, %if.end.93, %if.then.21, %if.end
  %retval.0 = phi i32 [ 2147483647, %if.end ], [ 2147483647, %if.then.21 ], [ %call2.i, %if.end.93 ], [ %a, %if.then.12 ], [ %a, %if.then.25 ], [ %a, %if.then.33 ], [ %cond.or.i.256, %cond.false.i.257 ], [ %or4.i.249, %if.end.i.253 ], [ %cond.or.i, %cond.false.i.236 ], [ %or4.i, %if.end.i.235 ]
  ret i32 %retval.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i32 @float32_sqrt(i32 %a) #2 {
entry:
  %and.i = and i32 %a, 8388607
  %shr.i = lshr i32 %a, 23
  %and.i.54 = and i32 %shr.i, 255
  %shr.i.89 = lshr i32 %a, 31
  %cmp = icmp eq i32 %and.i.54, 255
  br i1 %cmp, label %if.then, label %if.end.8

if.then:                                          ; preds = %entry
  %tobool = icmp eq i32 %and.i, 0
  br i1 %tobool, label %if.end, label %if.then.3

if.then.3:                                        ; preds = %if.then
  %and.i.32.i = and i32 %a, 2143289344
  %cmp.i.33.i = icmp eq i32 %and.i.32.i, 2139095040
  %and1.i.34.i = and i32 %a, 4194303
  %tobool.i.35.i = icmp ne i32 %and1.i.34.i, 0
  %0 = and i1 %cmp.i.33.i, %tobool.i.35.i
  %or.i.85 = or i32 %a, 4194304
  br i1 %0, label %if.then.i.86, label %cleanup

if.then.i.86:                                     ; preds = %if.then.3
  %1 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i = or i32 %1, 16
  store i32 %or.i.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end:                                           ; preds = %if.then
  %tobool5 = icmp eq i32 %shr.i.89, 0
  br i1 %tobool5, label %cleanup, label %if.end.7

if.end.7:                                         ; preds = %if.end
  %2 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.84 = or i32 %2, 16
  store i32 %or.i.84, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.8:                                         ; preds = %entry
  %tobool9 = icmp eq i32 %shr.i.89, 0
  br i1 %tobool9, label %if.end.14, label %if.then.10

if.then.10:                                       ; preds = %if.end.8
  %or = or i32 %and.i.54, %and.i
  %cmp11 = icmp eq i32 %or, 0
  br i1 %cmp11, label %cleanup, label %if.end.13

if.end.13:                                        ; preds = %if.then.10
  %3 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.83 = or i32 %3, 16
  store i32 %or.i.83, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.14:                                        ; preds = %if.end.8
  %cmp15 = icmp eq i32 %and.i.54, 0
  br i1 %cmp15, label %if.then.16, label %if.end.20

if.then.16:                                       ; preds = %if.end.14
  %cmp17 = icmp eq i32 %and.i, 0
  br i1 %cmp17, label %cleanup, label %if.end.19

if.end.19:                                        ; preds = %if.then.16
  %cmp.i.i = icmp ult i32 %and.i, 65536
  %shl.i.i = shl i32 %a, 16
  %shl.a.i.i = select i1 %cmp.i.i, i32 %shl.i.i, i32 %and.i
  %..i.i = select i1 %cmp.i.i, i32 16, i32 0
  %cmp1.i.i = icmp ult i32 %shl.a.i.i, 16777216
  %add3.i.i = or i32 %..i.i, 8
  %shl4.i.i = shl i32 %shl.a.i.i, 8
  %a.addr.1.i.i = select i1 %cmp1.i.i, i32 %shl4.i.i, i32 %shl.a.i.i
  %shiftCount.1.i.i = select i1 %cmp1.i.i, i32 %add3.i.i, i32 %..i.i
  %shr.i.i = lshr i32 %a.addr.1.i.i, 24
  %idxprom.i.i = zext i32 %shr.i.i to i64
  %arrayidx.i.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i64 0, i64 %idxprom.i.i
  %4 = load i32, i32* %arrayidx.i.i, align 4, !tbaa !1
  %add6.i.i = add nsw i32 %4, %shiftCount.1.i.i
  %sub.i.80 = add nsw i32 %add6.i.i, -8
  %shl.i.81 = shl i32 %and.i, %sub.i.80
  %sub1.i.82 = sub i32 9, %add6.i.i
  br label %if.end.20

if.end.20:                                        ; preds = %if.end.19, %if.end.14
  %aExp.0 = phi i32 [ %sub1.i.82, %if.end.19 ], [ %and.i.54, %if.end.14 ]
  %aSig.0 = phi i32 [ %shl.i.81, %if.end.19 ], [ %and.i, %if.end.14 ]
  %sub = add nsw i32 %aExp.0, -127
  %shr = ashr i32 %sub, 1
  %add = add nsw i32 %shr, 126
  %or21 = shl i32 %aSig.0, 8
  %shl = or i32 %or21, -2147483648
  %5 = lshr i32 %aSig.0, 19
  %and.i.65 = and i32 %5, 15
  %and1.i = and i32 %aExp.0, 1
  %tobool.i = icmp eq i32 %and1.i, 0
  %shr2.i = lshr i32 %shl, 17
  br i1 %tobool.i, label %if.else.i, label %if.then.i

if.then.i:                                        ; preds = %if.end.20
  %add.i.66 = add nuw nsw i32 %shr2.i, 16384
  %idxprom.44.i = zext i32 %and.i.65 to i64
  %arrayidx.i = getelementptr inbounds [16 x i16], [16 x i16]* @estimateSqrt32.sqrtOddAdjustments, i64 0, i64 %idxprom.44.i
  %6 = load i16, i16* %arrayidx.i, align 2, !tbaa !5
  %conv.i.67 = zext i16 %6 to i32
  %sub.i.68 = sub nsw i32 %add.i.66, %conv.i.67
  %div.i = udiv i32 %shl, %sub.i.68
  %shl.i.69 = shl i32 %div.i, 14
  %shl3.i = shl i32 %sub.i.68, 15
  %add4.i = add i32 %shl3.i, %shl.i.69
  %shr5.i = lshr exact i32 %shl, 1
  br label %if.end.20.i

if.else.i:                                        ; preds = %if.end.20
  %add7.i = or i32 %shr2.i, 32768
  %idxprom8.43.i = zext i32 %and.i.65 to i64
  %arrayidx9.i = getelementptr inbounds [16 x i16], [16 x i16]* @estimateSqrt32.sqrtEvenAdjustments, i64 0, i64 %idxprom8.43.i
  %7 = load i16, i16* %arrayidx9.i, align 2, !tbaa !5
  %conv10.i = zext i16 %7 to i32
  %sub11.i = sub nsw i32 %add7.i, %conv10.i
  %div12.i = udiv i32 %shl, %sub11.i
  %add13.i = add i32 %sub11.i, %div12.i
  %cmp.i.70 = icmp ugt i32 %add13.i, 131071
  %shl15.i = shl i32 %add13.i, 15
  %cond.i = select i1 %cmp.i.70, i32 -32768, i32 %shl15.i
  %cmp16.i = icmp ugt i32 %cond.i, %shl
  br i1 %cmp16.i, label %if.end.20.i, label %if.then.18.i

if.then.18.i:                                     ; preds = %if.else.i
  %shr19.i = ashr exact i32 %shl, 1
  br label %estimateSqrt32.exit

if.end.20.i:                                      ; preds = %if.else.i, %if.then.i
  %a.addr.0.i = phi i32 [ %shr5.i, %if.then.i ], [ %shl, %if.else.i ]
  %z.0.i = phi i32 [ %add4.i, %if.then.i ], [ %cond.i, %if.else.i ]
  %cmp.i.71 = icmp ugt i32 %z.0.i, %a.addr.0.i
  br i1 %cmp.i.71, label %if.end.i, label %estimateDiv64To32.exit

if.end.i:                                         ; preds = %if.end.20.i
  %shr.i.72 = lshr i32 %z.0.i, 16
  %shl.i.73 = shl nuw i32 %shr.i.72, 16
  %cmp1.i = icmp ugt i32 %shl.i.73, %a.addr.0.i
  br i1 %cmp1.i, label %cond.false.i, label %cond.end.i

cond.false.i:                                     ; preds = %if.end.i
  %div.i.74 = udiv i32 %a.addr.0.i, %shr.i.72
  %shl2.i = shl i32 %div.i.74, 16
  br label %cond.end.i

cond.end.i:                                       ; preds = %cond.false.i, %if.end.i
  %cond.i.75 = phi i32 [ %shl2.i, %cond.false.i ], [ -65536, %if.end.i ]
  %shr3.i.i = lshr exact i32 %cond.i.75, 16
  %conv5.i.i = and i32 %z.0.i, 65535
  %mul9.i.i = mul nuw i32 %shr3.i.i, %conv5.i.i
  %mul15.i.i = mul nuw i32 %shr3.i.i, %shr.i.72
  %shr17.i.i = lshr i32 %mul9.i.i, 16
  %shl20.i.i = shl i32 %mul9.i.i, 16
  %sub.i.i = sub i32 0, %shl20.i.i
  %cmp.i.39.i = icmp ne i32 %shl20.i.i, 0
  %conv.neg.i.i = sext i1 %cmp.i.39.i to i32
  %add24.i.neg.i = sub i32 %a.addr.0.i, %mul15.i.i
  %sub1.i.i = sub i32 %add24.i.neg.i, %shr17.i.i
  %sub2.i.i = add i32 %sub1.i.i, %conv.neg.i.i
  %cmp3.45.i = icmp slt i32 %sub2.i.i, 0
  br i1 %cmp3.45.i, label %while.body.lr.ph.i, label %while.end.i

while.body.lr.ph.i:                               ; preds = %cond.end.i
  %shl4.i = shl i32 %z.0.i, 16
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i, %while.body.lr.ph.i
  %z.048.i = phi i32 [ %cond.i.75, %while.body.lr.ph.i ], [ %sub.i.76, %while.body.i ]
  %rem0.047.i = phi i32 [ %sub2.i.i, %while.body.lr.ph.i ], [ %add2.i.i, %while.body.i ]
  %rem1.046.i = phi i32 [ %sub.i.i, %while.body.lr.ph.i ], [ %add.i.37.i, %while.body.i ]
  %sub.i.76 = add i32 %z.048.i, -65536
  %add.i.37.i = add i32 %rem1.046.i, %shl4.i
  %add1.i.i = add i32 %rem0.047.i, %shr.i.72
  %cmp.i.38.i = icmp ult i32 %add.i.37.i, %rem1.046.i
  %conv.i.i = zext i1 %cmp.i.38.i to i32
  %add2.i.i = add i32 %add1.i.i, %conv.i.i
  %cmp3.i.77 = icmp slt i32 %add2.i.i, 0
  br i1 %cmp3.i.77, label %while.body.i, label %while.end.i.loopexit

while.end.i.loopexit:                             ; preds = %while.body.i
  %add2.i.i.lcssa = phi i32 [ %add2.i.i, %while.body.i ]
  %add.i.37.i.lcssa = phi i32 [ %add.i.37.i, %while.body.i ]
  %sub.i.76.lcssa = phi i32 [ %sub.i.76, %while.body.i ]
  br label %while.end.i

while.end.i:                                      ; preds = %while.end.i.loopexit, %cond.end.i
  %z.0.lcssa.i = phi i32 [ %cond.i.75, %cond.end.i ], [ %sub.i.76.lcssa, %while.end.i.loopexit ]
  %rem0.0.lcssa.i = phi i32 [ %sub2.i.i, %cond.end.i ], [ %add2.i.i.lcssa, %while.end.i.loopexit ]
  %rem1.0.lcssa.i = phi i32 [ %sub.i.i, %cond.end.i ], [ %add.i.37.i.lcssa, %while.end.i.loopexit ]
  %shl5.i = shl i32 %rem0.0.lcssa.i, 16
  %shr6.i = lshr i32 %rem1.0.lcssa.i, 16
  %or.i.78 = or i32 %shr6.i, %shl5.i
  %cmp8.i = icmp ugt i32 %shl.i.73, %or.i.78
  br i1 %cmp8.i, label %cond.false.10.i, label %cond.end.12.i

cond.false.10.i:                                  ; preds = %while.end.i
  %div11.i = udiv i32 %or.i.78, %shr.i.72
  br label %cond.end.12.i

cond.end.12.i:                                    ; preds = %cond.false.10.i, %while.end.i
  %cond13.i = phi i32 [ %div11.i, %cond.false.10.i ], [ 65535, %while.end.i ]
  %or14.i = or i32 %cond13.i, %z.0.lcssa.i
  %phitmp = lshr i32 %or14.i, 1
  br label %estimateDiv64To32.exit

estimateDiv64To32.exit:                           ; preds = %if.end.20.i, %cond.end.12.i
  %retval.0.i.79 = phi i32 [ %phitmp, %cond.end.12.i ], [ 2147483647, %if.end.20.i ]
  %shr22.i = lshr i32 %z.0.i, 1
  %add23.i = add nuw i32 %retval.0.i.79, %shr22.i
  br label %estimateSqrt32.exit

estimateSqrt32.exit:                              ; preds = %if.then.18.i, %estimateDiv64To32.exit
  %retval.0.i = phi i32 [ %add23.i, %estimateDiv64To32.exit ], [ %shr19.i, %if.then.18.i ]
  %add23 = add i32 %retval.0.i, 2
  %and = and i32 %add23, 126
  %cmp24 = icmp ult i32 %and, 6
  br i1 %cmp24, label %if.then.25, label %if.end.36

if.then.25:                                       ; preds = %estimateSqrt32.exit
  %cmp26 = icmp ugt i32 %retval.0.i, -3
  br i1 %cmp26, label %roundAndPack, label %if.else

if.else:                                          ; preds = %if.then.25
  %shr29 = lshr i32 %shl, %and1.i
  %shr.i.60 = lshr i32 %add23, 16
  %conv5.i = and i32 %add23, 65535
  %mul.i = mul nuw i32 %conv5.i, %conv5.i
  %mul9.i = mul nuw i32 %shr.i.60, %conv5.i
  %mul15.i = mul nuw i32 %shr.i.60, %shr.i.60
  %add.i.61 = shl i32 %mul9.i, 1
  %cmp.i.62 = icmp ult i32 %add.i.61, %mul9.i
  %conv16.i = zext i1 %cmp.i.62 to i32
  %shl.i.63 = shl nuw nsw i32 %conv16.i, 16
  %8 = lshr i32 %mul9.i, 15
  %shr17.i = and i32 %8, 65535
  %add18.i = or i32 %shl.i.63, %shr17.i
  %shl20.i = shl i32 %mul9.i, 17
  %add21.i = add i32 %shl20.i, %mul.i
  %cmp22.i = icmp ult i32 %add21.i, %shl20.i
  %sub.i = sub i32 0, %add21.i
  %conv23.i.neg = sext i1 %cmp22.i to i32
  %cmp.i.59 = icmp ne i32 %add21.i, 0
  %conv.neg.i = sext i1 %cmp.i.59 to i32
  %add19.i.neg = sub i32 %shr29, %mul15.i
  %add24.i.neg = add i32 %add19.i.neg, %conv23.i.neg
  %sub1.i = add i32 %add24.i.neg, %conv.neg.i
  %sub2.i = sub i32 %sub1.i, %add18.i
  %cmp30.113 = icmp slt i32 %sub2.i, 0
  br i1 %cmp30.113, label %while.body.preheader, label %while.end

while.body.preheader:                             ; preds = %if.else
  br label %while.body

while.body:                                       ; preds = %while.body.preheader, %while.body
  %rem1.0116 = phi i32 [ %add.i, %while.body ], [ %sub.i, %while.body.preheader ]
  %rem0.0115 = phi i32 [ %add2.i, %while.body ], [ %sub2.i, %while.body.preheader ]
  %zSig.0114 = phi i32 [ %dec, %while.body ], [ %add23, %while.body.preheader ]
  %dec = add i32 %zSig.0114, -1
  %shl.i.57 = shl i32 %dec, 1
  %shr.i.58 = lshr i32 %dec, 31
  %or31 = or i32 %shl.i.57, 1
  %add.i = add i32 %or31, %rem1.0116
  %add1.i = add i32 %shr.i.58, %rem0.0115
  %cmp.i = icmp ult i32 %add.i, %rem1.0116
  %conv.i.56 = zext i1 %cmp.i to i32
  %add2.i = add i32 %add1.i, %conv.i.56
  %cmp30 = icmp slt i32 %add2.i, 0
  br i1 %cmp30, label %while.body, label %while.end.loopexit

while.end.loopexit:                               ; preds = %while.body
  %add2.i.lcssa = phi i32 [ %add2.i, %while.body ]
  %add.i.lcssa = phi i32 [ %add.i, %while.body ]
  %dec.lcssa = phi i32 [ %dec, %while.body ]
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %if.else
  %rem1.0.lcssa = phi i32 [ %sub.i, %if.else ], [ %add.i.lcssa, %while.end.loopexit ]
  %rem0.0.lcssa = phi i32 [ %sub2.i, %if.else ], [ %add2.i.lcssa, %while.end.loopexit ]
  %zSig.0.lcssa = phi i32 [ %add23, %if.else ], [ %dec.lcssa, %while.end.loopexit ]
  %or32 = or i32 %rem1.0.lcssa, %rem0.0.lcssa
  %cmp33 = icmp ne i32 %or32, 0
  %conv = zext i1 %cmp33 to i32
  %or34 = or i32 %conv, %zSig.0.lcssa
  br label %if.end.36

if.end.36:                                        ; preds = %while.end, %estimateSqrt32.exit
  %zSig.1 = phi i32 [ %or34, %while.end ], [ %add23, %estimateSqrt32.exit ]
  %shr.i.55 = lshr i32 %zSig.1, 1
  %shl.i.mask = and i32 %zSig.1, 1
  %or.i = or i32 %shl.i.mask, %shr.i.55
  br label %roundAndPack

roundAndPack:                                     ; preds = %if.then.25, %if.end.36
  %zSig.2 = phi i32 [ %or.i, %if.end.36 ], [ 2147483647, %if.then.25 ]
  %call37 = tail call fastcc i32 @roundAndPackFloat32(i32 0, i32 %add, i32 %zSig.2) #5
  br label %cleanup

cleanup:                                          ; preds = %if.then.i.86, %if.then.3, %if.then.16, %if.then.10, %if.end, %roundAndPack, %if.end.13, %if.end.7
  %retval.0 = phi i32 [ 2147483647, %if.end.7 ], [ 2147483647, %if.end.13 ], [ %call37, %roundAndPack ], [ %a, %if.end ], [ %a, %if.then.10 ], [ 0, %if.then.16 ], [ %or.i.85, %if.then.3 ], [ %or.i.85, %if.then.i.86 ]
  ret i32 %retval.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i32 @float32_eq(i32 %a, i32 %b) #2 {
entry:
  %and.i = and i32 %a, 2139095040
  %cmp = icmp ne i32 %and.i, 2139095040
  %and.i.33 = and i32 %a, 8388607
  %tobool = icmp eq i32 %and.i.33, 0
  %or.cond = or i1 %cmp, %tobool
  br i1 %or.cond, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %and.i.32 = and i32 %b, 2139095040
  %cmp3 = icmp ne i32 %and.i.32, 2139095040
  %and.i.30 = and i32 %b, 8388607
  %tobool6 = icmp eq i32 %and.i.30, 0
  %or.cond34 = or i1 %cmp3, %tobool6
  br i1 %or.cond34, label %if.end.13, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  %and.i.25 = and i32 %a, 2143289344
  %cmp.i.26 = icmp eq i32 %and.i.25, 2139095040
  %and1.i.27 = and i32 %a, 4194303
  %tobool.i.28 = icmp ne i32 %and1.i.27, 0
  %tobool8.demorgan = and i1 %cmp.i.26, %tobool.i.28
  br i1 %tobool8.demorgan, label %if.then.12, label %lor.lhs.false.9

lor.lhs.false.9:                                  ; preds = %if.then
  %and.i.24 = and i32 %b, 2143289344
  %cmp.i = icmp eq i32 %and.i.24, 2139095040
  %and1.i = and i32 %b, 4194303
  %tobool.i = icmp ne i32 %and1.i, 0
  %tobool11.demorgan = and i1 %cmp.i, %tobool.i
  br i1 %tobool11.demorgan, label %if.then.12, label %return

if.then.12:                                       ; preds = %lor.lhs.false.9, %if.then
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %0, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %return

if.end.13:                                        ; preds = %lor.lhs.false
  %cmp14 = icmp eq i32 %a, %b
  br i1 %cmp14, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.end.13
  %or = or i32 %b, %a
  %shl.mask = and i32 %or, 2147483647
  %cmp15 = icmp eq i32 %shl.mask, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.end.13
  %1 = phi i1 [ true, %if.end.13 ], [ %cmp15, %lor.rhs ]
  %lor.ext = zext i1 %1 to i32
  br label %return

return:                                           ; preds = %lor.lhs.false.9, %if.then.12, %lor.end
  %retval.0 = phi i32 [ %lor.ext, %lor.end ], [ 0, %lor.lhs.false.9 ], [ 0, %if.then.12 ]
  ret i32 %retval.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i32 @float32_le(i32 %a, i32 %b) #2 {
entry:
  %and.i = and i32 %a, 2139095040
  %cmp = icmp ne i32 %and.i, 2139095040
  %and.i.40 = and i32 %a, 8388607
  %tobool = icmp eq i32 %and.i.40, 0
  %or.cond = or i1 %cmp, %tobool
  br i1 %or.cond, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %and.i.39 = and i32 %b, 2139095040
  %cmp3 = icmp ne i32 %and.i.39, 2139095040
  %and.i.37 = and i32 %b, 8388607
  %tobool6 = icmp eq i32 %and.i.37, 0
  %or.cond41 = or i1 %cmp3, %tobool6
  br i1 %or.cond41, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %0, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end:                                           ; preds = %lor.lhs.false
  %shr.i.36 = lshr i32 %a, 31
  %shr.i.35 = lshr i32 %b, 31
  %cmp9 = icmp eq i32 %shr.i.36, %shr.i.35
  br i1 %cmp9, label %if.end.13, label %if.then.10

if.then.10:                                       ; preds = %if.end
  %tobool11 = icmp eq i32 %shr.i.36, 0
  br i1 %tobool11, label %lor.rhs, label %lor.end

lor.rhs:                                          ; preds = %if.then.10
  %or = or i32 %b, %a
  %shl.mask = and i32 %or, 2147483647
  %cmp12 = icmp eq i32 %shl.mask, 0
  br label %lor.end

lor.end:                                          ; preds = %if.then.10, %lor.rhs
  %1 = phi i1 [ true, %if.then.10 ], [ %cmp12, %lor.rhs ]
  %lor.ext = zext i1 %1 to i32
  br label %cleanup

if.end.13:                                        ; preds = %if.end
  %cmp14 = icmp eq i32 %a, %b
  %cmp16 = icmp ult i32 %a, %b
  %conv = zext i1 %cmp16 to i32
  %cmp1442 = zext i1 %cmp14 to i32
  %2 = xor i32 %conv, %shr.i.36
  %lor.ext19 = or i32 %2, %cmp1442
  br label %cleanup

cleanup:                                          ; preds = %if.end.13, %lor.end, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ %lor.ext, %lor.end ], [ %lor.ext19, %if.end.13 ]
  ret i32 %retval.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i32 @float32_lt(i32 %a, i32 %b) #2 {
entry:
  %and.i = and i32 %a, 2139095040
  %cmp = icmp ne i32 %and.i, 2139095040
  %and.i.40 = and i32 %a, 8388607
  %tobool = icmp eq i32 %and.i.40, 0
  %or.cond = or i1 %cmp, %tobool
  br i1 %or.cond, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %and.i.39 = and i32 %b, 2139095040
  %cmp3 = icmp ne i32 %and.i.39, 2139095040
  %and.i.37 = and i32 %b, 8388607
  %tobool6 = icmp eq i32 %and.i.37, 0
  %or.cond41 = or i1 %cmp3, %tobool6
  br i1 %or.cond41, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %0, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end:                                           ; preds = %lor.lhs.false
  %shr.i.36 = lshr i32 %a, 31
  %shr.i.35 = lshr i32 %b, 31
  %cmp9 = icmp eq i32 %shr.i.36, %shr.i.35
  br i1 %cmp9, label %if.end.13, label %if.then.10

if.then.10:                                       ; preds = %if.end
  %tobool11 = icmp eq i32 %shr.i.36, 0
  br i1 %tobool11, label %land.end, label %land.rhs

land.rhs:                                         ; preds = %if.then.10
  %or = or i32 %b, %a
  %shl.mask = and i32 %or, 2147483647
  %cmp12 = icmp ne i32 %shl.mask, 0
  br label %land.end

land.end:                                         ; preds = %if.then.10, %land.rhs
  %1 = phi i1 [ false, %if.then.10 ], [ %cmp12, %land.rhs ]
  %land.ext = zext i1 %1 to i32
  br label %cleanup

if.end.13:                                        ; preds = %if.end
  %cmp16 = icmp ult i32 %a, %b
  %conv = zext i1 %cmp16 to i32
  %tobool17 = icmp ne i32 %shr.i.36, %conv
  %not.cmp14 = icmp ne i32 %a, %b
  %2 = and i1 %not.cmp14, %tobool17
  %land.ext19 = zext i1 %2 to i32
  br label %cleanup

cleanup:                                          ; preds = %if.end.13, %land.end, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ %land.ext, %land.end ], [ %land.ext19, %if.end.13 ]
  ret i32 %retval.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i32 @float32_eq_signaling(i32 %a, i32 %b) #2 {
entry:
  %and.i = and i32 %a, 2139095040
  %cmp = icmp ne i32 %and.i, 2139095040
  %and.i.18 = and i32 %a, 8388607
  %tobool = icmp eq i32 %and.i.18, 0
  %or.cond = or i1 %cmp, %tobool
  br i1 %or.cond, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %and.i.17 = and i32 %b, 2139095040
  %cmp3 = icmp ne i32 %and.i.17, 2139095040
  %and.i.15 = and i32 %b, 8388607
  %tobool6 = icmp eq i32 %and.i.15, 0
  %or.cond19 = or i1 %cmp3, %tobool6
  br i1 %or.cond19, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %0, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %cmp7 = icmp eq i32 %a, %b
  br i1 %cmp7, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.end
  %or = or i32 %b, %a
  %shl.mask = and i32 %or, 2147483647
  %cmp8 = icmp eq i32 %shl.mask, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.end
  %1 = phi i1 [ true, %if.end ], [ %cmp8, %lor.rhs ]
  %lor.ext = zext i1 %1 to i32
  br label %return

return:                                           ; preds = %lor.end, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ %lor.ext, %lor.end ]
  ret i32 %retval.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i32 @float32_le_quiet(i32 %a, i32 %b) #2 {
entry:
  %and.i = and i32 %a, 2139095040
  %cmp = icmp ne i32 %and.i, 2139095040
  %and.i.59 = and i32 %a, 8388607
  %tobool = icmp eq i32 %and.i.59, 0
  %or.cond = or i1 %cmp, %tobool
  br i1 %or.cond, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %and.i.58 = and i32 %b, 2139095040
  %cmp3 = icmp ne i32 %and.i.58, 2139095040
  %and.i.56 = and i32 %b, 8388607
  %tobool6 = icmp eq i32 %and.i.56, 0
  %or.cond60 = or i1 %cmp3, %tobool6
  br i1 %or.cond60, label %if.end.13, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  %and.i.51 = and i32 %a, 2143289344
  %cmp.i.52 = icmp eq i32 %and.i.51, 2139095040
  %and1.i.53 = and i32 %a, 4194303
  %tobool.i.54 = icmp ne i32 %and1.i.53, 0
  %tobool8.demorgan = and i1 %cmp.i.52, %tobool.i.54
  br i1 %tobool8.demorgan, label %if.then.12, label %lor.lhs.false.9

lor.lhs.false.9:                                  ; preds = %if.then
  %and.i.50 = and i32 %b, 2143289344
  %cmp.i = icmp eq i32 %and.i.50, 2139095040
  %and1.i = and i32 %b, 4194303
  %tobool.i = icmp ne i32 %and1.i, 0
  %tobool11.demorgan = and i1 %cmp.i, %tobool.i
  br i1 %tobool11.demorgan, label %if.then.12, label %cleanup

if.then.12:                                       ; preds = %lor.lhs.false.9, %if.then
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %0, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.13:                                        ; preds = %lor.lhs.false
  %shr.i.49 = lshr i32 %a, 31
  %shr.i.48 = lshr i32 %b, 31
  %cmp16 = icmp eq i32 %shr.i.49, %shr.i.48
  br i1 %cmp16, label %if.end.20, label %if.then.17

if.then.17:                                       ; preds = %if.end.13
  %tobool18 = icmp eq i32 %shr.i.49, 0
  br i1 %tobool18, label %lor.rhs, label %lor.end

lor.rhs:                                          ; preds = %if.then.17
  %or = or i32 %b, %a
  %shl.mask = and i32 %or, 2147483647
  %cmp19 = icmp eq i32 %shl.mask, 0
  br label %lor.end

lor.end:                                          ; preds = %if.then.17, %lor.rhs
  %1 = phi i1 [ true, %if.then.17 ], [ %cmp19, %lor.rhs ]
  %lor.ext = zext i1 %1 to i32
  br label %cleanup

if.end.20:                                        ; preds = %if.end.13
  %cmp21 = icmp eq i32 %a, %b
  %cmp23 = icmp ult i32 %a, %b
  %conv = zext i1 %cmp23 to i32
  %cmp2161 = zext i1 %cmp21 to i32
  %2 = xor i32 %conv, %shr.i.49
  %lor.ext26 = or i32 %2, %cmp2161
  br label %cleanup

cleanup:                                          ; preds = %lor.lhs.false.9, %if.then.12, %if.end.20, %lor.end
  %retval.0 = phi i32 [ %lor.ext, %lor.end ], [ %lor.ext26, %if.end.20 ], [ 0, %lor.lhs.false.9 ], [ 0, %if.then.12 ]
  ret i32 %retval.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i32 @float32_lt_quiet(i32 %a, i32 %b) #2 {
entry:
  %and.i = and i32 %a, 2139095040
  %cmp = icmp ne i32 %and.i, 2139095040
  %and.i.55 = and i32 %a, 8388607
  %tobool = icmp eq i32 %and.i.55, 0
  %or.cond = or i1 %cmp, %tobool
  br i1 %or.cond, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %and.i.54 = and i32 %b, 2139095040
  %cmp3 = icmp ne i32 %and.i.54, 2139095040
  %and.i.52 = and i32 %b, 8388607
  %tobool6 = icmp eq i32 %and.i.52, 0
  %or.cond56 = or i1 %cmp3, %tobool6
  br i1 %or.cond56, label %if.end.13, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  %and.i.47 = and i32 %a, 2143289344
  %cmp.i.48 = icmp eq i32 %and.i.47, 2139095040
  %and1.i.49 = and i32 %a, 4194303
  %tobool.i.50 = icmp ne i32 %and1.i.49, 0
  %tobool8.demorgan = and i1 %cmp.i.48, %tobool.i.50
  br i1 %tobool8.demorgan, label %if.then.12, label %lor.lhs.false.9

lor.lhs.false.9:                                  ; preds = %if.then
  %and.i.46 = and i32 %b, 2143289344
  %cmp.i = icmp eq i32 %and.i.46, 2139095040
  %and1.i = and i32 %b, 4194303
  %tobool.i = icmp ne i32 %and1.i, 0
  %tobool11.demorgan = and i1 %cmp.i, %tobool.i
  br i1 %tobool11.demorgan, label %if.then.12, label %cleanup

if.then.12:                                       ; preds = %lor.lhs.false.9, %if.then
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %0, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.13:                                        ; preds = %lor.lhs.false
  %shr.i.45 = lshr i32 %a, 31
  %shr.i.44 = lshr i32 %b, 31
  %cmp16 = icmp eq i32 %shr.i.45, %shr.i.44
  br i1 %cmp16, label %if.end.20, label %if.then.17

if.then.17:                                       ; preds = %if.end.13
  %tobool18 = icmp eq i32 %shr.i.45, 0
  br i1 %tobool18, label %land.end, label %land.rhs

land.rhs:                                         ; preds = %if.then.17
  %or = or i32 %b, %a
  %shl.mask = and i32 %or, 2147483647
  %cmp19 = icmp ne i32 %shl.mask, 0
  br label %land.end

land.end:                                         ; preds = %if.then.17, %land.rhs
  %1 = phi i1 [ false, %if.then.17 ], [ %cmp19, %land.rhs ]
  %land.ext = zext i1 %1 to i32
  br label %cleanup

if.end.20:                                        ; preds = %if.end.13
  %cmp23 = icmp ult i32 %a, %b
  %conv = zext i1 %cmp23 to i32
  %tobool24 = icmp ne i32 %shr.i.45, %conv
  %not.cmp21 = icmp ne i32 %a, %b
  %2 = and i1 %not.cmp21, %tobool24
  %land.ext26 = zext i1 %2 to i32
  br label %cleanup

cleanup:                                          ; preds = %lor.lhs.false.9, %if.then.12, %if.end.20, %land.end
  %retval.0 = phi i32 [ %land.ext, %land.end ], [ %land.ext26, %if.end.20 ], [ 0, %lor.lhs.false.9 ], [ 0, %if.then.12 ]
  ret i32 %retval.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i32 @float64_to_int32(i64 %a.coerce) #2 {
entry:
  %a.sroa.0.0.extract.trunc.i = trunc i64 %a.coerce to i32
  %a.sroa.1.0.extract.shift.i.117 = lshr i64 %a.coerce, 32
  %a.sroa.1.0.extract.trunc.i = trunc i64 %a.sroa.1.0.extract.shift.i.117 to i32
  %and.i.118 = and i32 %a.sroa.1.0.extract.trunc.i, 1048575
  %a.sroa.1.0.extract.shift.i.114 = lshr i64 %a.coerce, 52
  %shr.i.115 = trunc i64 %a.sroa.1.0.extract.shift.i.114 to i32
  %and.i.116 = and i32 %shr.i.115, 2047
  %a.sroa.1.0.extract.shift.i = lshr i64 %a.coerce, 63
  %shr.i.113 = trunc i64 %a.sroa.1.0.extract.shift.i to i32
  %sub = add nsw i32 %and.i.116, -1043
  %cmp = icmp sgt i32 %sub, -1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %cmp4 = icmp ugt i32 %and.i.116, 1054
  br i1 %cmp4, label %if.then.5, label %if.end.8

if.then.5:                                        ; preds = %if.then
  %cmp6 = icmp ne i32 %and.i.116, 2047
  %or = or i32 %and.i.118, %a.sroa.0.0.extract.trunc.i
  %tobool = icmp eq i32 %or, 0
  %or.cond111 = or i1 %cmp6, %tobool
  %call3. = select i1 %or.cond111, i32 %shr.i.113, i32 0
  br label %invalid

if.end.8:                                         ; preds = %if.then
  %or9 = or i32 %and.i.118, 1048576
  %shl.i = shl i32 %a.sroa.0.0.extract.trunc.i, %sub
  %cmp.i = icmp eq i32 %sub, 0
  br i1 %cmp.i, label %shortShift64Left.exit, label %cond.false.i

cond.false.i:                                     ; preds = %if.end.8
  %shl1.i = shl i32 %or9, %sub
  %sub.i = sub nsw i32 1043, %shr.i.115
  %and.i = and i32 %sub.i, 31
  %shr.i = lshr i32 %a.sroa.0.0.extract.trunc.i, %and.i
  %or.i.112 = or i32 %shr.i, %shl1.i
  br label %shortShift64Left.exit

shortShift64Left.exit:                            ; preds = %if.end.8, %cond.false.i
  %cond.i = phi i32 [ %or.i.112, %cond.false.i ], [ %or9, %if.end.8 ]
  %cmp10 = icmp ugt i32 %cond.i, -2147483648
  br i1 %cmp10, label %invalid, label %if.end.24

if.else:                                          ; preds = %entry
  %cmp13 = icmp ne i32 %a.sroa.0.0.extract.trunc.i, 0
  %conv = zext i1 %cmp13 to i32
  %cmp14 = icmp ult i32 %and.i.116, 1022
  br i1 %cmp14, label %if.then.16, label %if.else.19

if.then.16:                                       ; preds = %if.else
  %or17 = or i32 %and.i.116, %and.i.118
  %or18 = or i32 %or17, %conv
  br label %if.end.24

if.else.19:                                       ; preds = %if.else
  %or20 = or i32 %and.i.118, 1048576
  %fold = add nuw nsw i32 %shr.i.115, 13
  %and = and i32 %fold, 31
  %shl = shl i32 %or20, %and
  %or21 = or i32 %shl, %conv
  %sub22 = sub nsw i32 1043, %and.i.116
  %shr = lshr i32 %or20, %sub22
  br label %if.end.24

if.end.24:                                        ; preds = %if.then.16, %if.else.19, %shortShift64Left.exit
  %absZ.0 = phi i32 [ %cond.i, %shortShift64Left.exit ], [ 0, %if.then.16 ], [ %shr, %if.else.19 ]
  %aSigExtra.0 = phi i32 [ %shl.i, %shortShift64Left.exit ], [ %or18, %if.then.16 ], [ %or21, %if.else.19 ]
  %0 = load i32, i32* @float_rounding_mode, align 4, !tbaa !1
  %cmp25 = icmp eq i32 %0, 0
  br i1 %cmp25, label %if.then.27, label %if.else.40

if.then.27:                                       ; preds = %if.end.24
  %cmp28 = icmp slt i32 %aSigExtra.0, 0
  br i1 %cmp28, label %if.then.30, label %if.end.37

if.then.30:                                       ; preds = %if.then.27
  %inc = add i32 %absZ.0, 1
  %shl31.mask = and i32 %aSigExtra.0, 2147483647
  %cmp32 = icmp eq i32 %shl31.mask, 0
  %and35 = and i32 %inc, -2
  %and35.inc = select i1 %cmp32, i32 %and35, i32 %inc
  br label %if.end.37

if.end.37:                                        ; preds = %if.then.30, %if.then.27
  %absZ.1 = phi i32 [ %absZ.0, %if.then.27 ], [ %and35.inc, %if.then.30 ]
  %tobool38 = icmp ne i32 %shr.i.113, 0
  %sub39 = sub i32 0, %absZ.1
  %cond = select i1 %tobool38, i32 %sub39, i32 %absZ.1
  br label %if.end.55

if.else.40:                                       ; preds = %if.end.24
  %cmp41 = icmp ne i32 %aSigExtra.0, 0
  %conv42 = zext i1 %cmp41 to i32
  %tobool43 = icmp eq i32 %shr.i.113, 0
  br i1 %tobool43, label %if.else.49, label %if.then.44

if.then.44:                                       ; preds = %if.else.40
  %cmp45 = icmp eq i32 %0, 3
  %and47110 = and i1 %cmp41, %cmp45
  %and47 = zext i1 %and47110 to i32
  %add = add i32 %absZ.0, %and47
  %sub48 = sub i32 0, %add
  br label %if.end.55

if.else.49:                                       ; preds = %if.else.40
  %cmp50 = icmp eq i32 %0, 2
  %and52109 = and i1 %cmp41, %cmp50
  %and52 = zext i1 %and52109 to i32
  %add53 = add i32 %and52, %absZ.0
  br label %if.end.55

if.end.55:                                        ; preds = %if.then.44, %if.else.49, %if.end.37
  %aSigExtra.1 = phi i32 [ %aSigExtra.0, %if.end.37 ], [ %conv42, %if.else.49 ], [ %conv42, %if.then.44 ]
  %z.0 = phi i32 [ %cond, %if.end.37 ], [ %add53, %if.else.49 ], [ %sub48, %if.then.44 ]
  %z.0.lobit = lshr i32 %z.0, 31
  %tobool58 = icmp ne i32 %shr.i.113, %z.0.lobit
  %tobool60 = icmp ne i32 %z.0, 0
  %or.cond = and i1 %tobool60, %tobool58
  br i1 %or.cond, label %invalid, label %if.end.64

invalid:                                          ; preds = %if.then.5, %if.end.55, %shortShift64Left.exit
  %aSign.0 = phi i32 [ %shr.i.113, %shortShift64Left.exit ], [ %shr.i.113, %if.end.55 ], [ %call3., %if.then.5 ]
  %1 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %1, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  %tobool62 = icmp ne i32 %aSign.0, 0
  %cond63 = select i1 %tobool62, i32 -2147483648, i32 2147483647
  br label %cleanup

if.end.64:                                        ; preds = %if.end.55
  %tobool65 = icmp eq i32 %aSigExtra.1, 0
  br i1 %tobool65, label %cleanup, label %if.then.66

if.then.66:                                       ; preds = %if.end.64
  %2 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or67 = or i32 %2, 1
  store i32 %or67, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

cleanup:                                          ; preds = %if.then.66, %if.end.64, %invalid
  %retval.0 = phi i32 [ %cond63, %invalid ], [ %z.0, %if.end.64 ], [ %z.0, %if.then.66 ]
  ret i32 %retval.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i32 @float64_to_int32_round_to_zero(i64 %a.coerce) #2 {
entry:
  %a.sroa.0.0.extract.trunc.i = trunc i64 %a.coerce to i32
  %a.sroa.1.0.extract.shift.i.77 = lshr i64 %a.coerce, 32
  %a.sroa.1.0.extract.trunc.i = trunc i64 %a.sroa.1.0.extract.shift.i.77 to i32
  %and.i.78 = and i32 %a.sroa.1.0.extract.trunc.i, 1048575
  %a.sroa.1.0.extract.shift.i.74 = lshr i64 %a.coerce, 52
  %shr.i.75 = trunc i64 %a.sroa.1.0.extract.shift.i.74 to i32
  %and.i.76 = and i32 %shr.i.75, 2047
  %a.sroa.1.0.extract.shift.i = lshr i64 %a.coerce, 63
  %shr.i.73 = trunc i64 %a.sroa.1.0.extract.shift.i to i32
  %sub = add nsw i32 %and.i.76, -1043
  %cmp = icmp sgt i32 %sub, -1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %cmp4 = icmp ugt i32 %and.i.76, 1054
  br i1 %cmp4, label %if.then.5, label %if.end.8

if.then.5:                                        ; preds = %if.then
  %cmp6 = icmp ne i32 %and.i.76, 2047
  %or = or i32 %and.i.78, %a.sroa.0.0.extract.trunc.i
  %tobool = icmp eq i32 %or, 0
  %or.cond71 = or i1 %cmp6, %tobool
  %call3. = select i1 %or.cond71, i32 %shr.i.73, i32 0
  br label %invalid

if.end.8:                                         ; preds = %if.then
  %or9 = or i32 %and.i.78, 1048576
  %shl.i = shl i32 %a.sroa.0.0.extract.trunc.i, %sub
  %cmp.i = icmp eq i32 %sub, 0
  br i1 %cmp.i, label %if.end.22, label %cond.false.i

cond.false.i:                                     ; preds = %if.end.8
  %shl1.i = shl i32 %or9, %sub
  %sub.i = sub nsw i32 1043, %shr.i.75
  %and.i = and i32 %sub.i, 31
  %shr.i = lshr i32 %a.sroa.0.0.extract.trunc.i, %and.i
  %or.i.72 = or i32 %shr.i, %shl1.i
  br label %if.end.22

if.else:                                          ; preds = %entry
  %cmp10 = icmp ult i32 %and.i.76, 1023
  br i1 %cmp10, label %if.then.11, label %if.end.18

if.then.11:                                       ; preds = %if.else
  %or12 = or i32 %and.i.78, %a.sroa.0.0.extract.trunc.i
  %or13 = or i32 %or12, %and.i.76
  %tobool14 = icmp eq i32 %or13, 0
  br i1 %tobool14, label %cleanup, label %if.then.15

if.then.15:                                       ; preds = %if.then.11
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or16 = or i32 %0, 1
  store i32 %or16, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.18:                                        ; preds = %if.else
  %or19 = or i32 %and.i.78, 1048576
  %fold = add nuw nsw i32 %shr.i.75, 13
  %and = and i32 %fold, 31
  %shl = shl i32 %or19, %and
  %or20 = or i32 %shl, %a.sroa.0.0.extract.trunc.i
  %sub21 = sub nsw i32 1043, %and.i.76
  %shr = lshr i32 %or19, %sub21
  br label %if.end.22

if.end.22:                                        ; preds = %cond.false.i, %if.end.8, %if.end.18
  %absZ.0 = phi i32 [ %shr, %if.end.18 ], [ %or.i.72, %cond.false.i ], [ %or9, %if.end.8 ]
  %aSigExtra.0 = phi i32 [ %or20, %if.end.18 ], [ %shl.i, %cond.false.i ], [ %shl.i, %if.end.8 ]
  %tobool23 = icmp ne i32 %shr.i.73, 0
  %sub24 = sub i32 0, %absZ.0
  %cond = select i1 %tobool23, i32 %sub24, i32 %absZ.0
  %cond.lobit = lshr i32 %cond, 31
  %tobool26 = icmp ne i32 %shr.i.73, %cond.lobit
  %tobool28 = icmp ne i32 %absZ.0, 0
  %or.cond = and i1 %tobool28, %tobool26
  br i1 %or.cond, label %invalid, label %if.end.32

invalid:                                          ; preds = %if.then.5, %if.end.22
  %aSign.0 = phi i32 [ %shr.i.73, %if.end.22 ], [ %call3., %if.then.5 ]
  %1 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %1, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  %tobool30 = icmp ne i32 %aSign.0, 0
  %cond31 = select i1 %tobool30, i32 -2147483648, i32 2147483647
  br label %cleanup

if.end.32:                                        ; preds = %if.end.22
  %tobool33 = icmp eq i32 %aSigExtra.0, 0
  br i1 %tobool33, label %cleanup, label %if.then.34

if.then.34:                                       ; preds = %if.end.32
  %2 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or35 = or i32 %2, 1
  store i32 %or35, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

cleanup:                                          ; preds = %if.then.34, %if.end.32, %if.then.15, %if.then.11, %invalid
  %retval.0 = phi i32 [ %cond31, %invalid ], [ 0, %if.then.11 ], [ 0, %if.then.15 ], [ %cond, %if.end.32 ], [ %cond, %if.then.34 ]
  ret i32 %retval.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i32 @float64_to_float32(i64 %a.coerce) #2 {
entry:
  %a.sroa.0.0.extract.trunc.i = trunc i64 %a.coerce to i32
  %a.sroa.1.0.extract.shift.i = lshr i64 %a.coerce, 32
  %a.sroa.1.0.extract.trunc.i = trunc i64 %a.sroa.1.0.extract.shift.i to i32
  %and.i = and i32 %a.sroa.1.0.extract.trunc.i, 1048575
  %a.sroa.1.0.extract.shift.i.40 = lshr i64 %a.coerce, 52
  %shr.i.41 = trunc i64 %a.sroa.1.0.extract.shift.i.40 to i32
  %and.i.42 = and i32 %shr.i.41, 2047
  %a.sroa.1.0.extract.shift.i.38 = lshr i64 %a.coerce, 63
  %cmp = icmp eq i32 %and.i.42, 2047
  br i1 %cmp, label %if.then, label %if.end.8

if.then:                                          ; preds = %entry
  %or = or i32 %and.i, %a.sroa.0.0.extract.trunc.i
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %if.end, label %if.then.4

if.then.4:                                        ; preds = %if.then
  %and.i.i = and i64 %a.coerce, 9221120237041090560
  %cmp.i.i = icmp eq i64 %and.i.i, 9218868437227405312
  br i1 %cmp.i.i, label %land.rhs.i.i, label %float64ToCommonNaN.exit

land.rhs.i.i:                                     ; preds = %if.then.4
  %tobool.i.i = icmp ne i32 %a.sroa.0.0.extract.trunc.i, 0
  %and2.i.i = and i64 %a.coerce, 2251795518717952
  %tobool3.i.i = icmp ne i64 %and2.i.i, 0
  %or.cond.i = or i1 %tobool.i.i, %tobool3.i.i
  br i1 %or.cond.i, label %if.then.i, label %float64ToCommonNaN.exit

if.then.i:                                        ; preds = %land.rhs.i.i
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.3.i = or i32 %0, 16
  store i32 %or.i.3.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %float64ToCommonNaN.exit

float64ToCommonNaN.exit:                          ; preds = %if.then.4, %land.rhs.i.i, %if.then.i
  %1 = lshr i64 %a.coerce, 20
  %.tr.i = trunc i64 %1 to i32
  %shl1.i.i = and i32 %.tr.i, 2147479552
  %shr.i.i = lshr i32 %a.sroa.0.0.extract.trunc.i, 20
  %or.i.i = or i32 %shl1.i.i, %shr.i.i
  %shl.i.3446 = shl nuw nsw i64 %a.sroa.1.0.extract.shift.i.38, 31
  %shl.i.34 = trunc i64 %shl.i.3446 to i32
  %a.sroa.0.4.extract.shift.i = lshr i32 %or.i.i, 9
  %or.i.36 = or i32 %shl.i.34, %a.sroa.0.4.extract.shift.i
  %or1.i = or i32 %or.i.36, 2143289344
  br label %cleanup

if.end:                                           ; preds = %if.then
  %shl.i.3248 = shl nuw nsw i64 %a.sroa.1.0.extract.shift.i.38, 31
  %shl.i.32 = trunc i64 %shl.i.3248 to i32
  %add.i = or i32 %shl.i.32, 2139095040
  br label %cleanup

if.end.8:                                         ; preds = %entry
  %shr.i.39 = trunc i64 %a.sroa.1.0.extract.shift.i.38 to i32
  %shl.i = shl nuw nsw i32 %and.i, 10
  %shr.i = lshr i32 %a.sroa.0.0.extract.trunc.i, 22
  %or.i = or i32 %shl.i, %shr.i
  %shl3.i.mask = and i32 %a.sroa.0.0.extract.trunc.i, 4194303
  %cmp4.i = icmp ne i32 %shl3.i.mask, 0
  %conv.i = zext i1 %cmp4.i to i32
  %or5.i = or i32 %or.i, %conv.i
  %tobool9 = icmp eq i32 %and.i.42, 0
  %or11 = or i32 %or5.i, 1073741824
  %or5.i.or11 = select i1 %tobool9, i32 %or5.i, i32 %or11
  %sub = add nsw i32 %and.i.42, -897
  %call13 = tail call fastcc i32 @roundAndPackFloat32(i32 %shr.i.39, i32 %sub, i32 %or5.i.or11) #5
  br label %cleanup

cleanup:                                          ; preds = %if.end.8, %if.end, %float64ToCommonNaN.exit
  %retval.0 = phi i32 [ %or1.i, %float64ToCommonNaN.exit ], [ %add.i, %if.end ], [ %call13, %if.end.8 ]
  ret i32 %retval.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i64 @float64_round_to_int(i64 %a.coerce) #2 {
entry:
  %a.sroa.0.0.extract.trunc = trunc i64 %a.coerce to i32
  %a.sroa.16.0.extract.shift = lshr i64 %a.coerce, 32
  %a.sroa.16.0.extract.trunc = trunc i64 %a.sroa.16.0.extract.shift to i32
  %a.sroa.1.0.extract.shift.i = lshr i64 %a.coerce, 52
  %shr.i = trunc i64 %a.sroa.1.0.extract.shift.i to i32
  %and.i = and i32 %shr.i, 2047
  %cmp = icmp ugt i32 %and.i, 1042
  br i1 %cmp, label %if.then, label %if.else.53

if.then:                                          ; preds = %entry
  %cmp1 = icmp ugt i32 %and.i, 1074
  br i1 %cmp1, label %if.then.2, label %if.end.8

if.then.2:                                        ; preds = %if.then
  %cmp3 = icmp eq i32 %and.i, 2047
  br i1 %cmp3, label %land.lhs.true, label %cleanup

land.lhs.true:                                    ; preds = %if.then.2
  %and.i.302 = and i32 %a.sroa.16.0.extract.trunc, 1048575
  %or = or i32 %and.i.302, %a.sroa.0.0.extract.trunc
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %cleanup, label %if.then.6

if.then.6:                                        ; preds = %land.lhs.true
  %and.i.57.i = and i64 %a.coerce, 9221120237041090560
  %cmp.i.58.i = icmp eq i64 %and.i.57.i, 9218868437227405312
  br i1 %cmp.i.58.i, label %land.rhs.i.61.i, label %float64_is_signaling_nan.exit.i

land.rhs.i.61.i:                                  ; preds = %if.then.6
  %tobool.i.60.i = icmp eq i32 %a.sroa.0.0.extract.trunc, 0
  br i1 %tobool.i.60.i, label %lor.rhs.i.i, label %float64_is_signaling_nan.exit.thread.i

float64_is_signaling_nan.exit.thread.i:           ; preds = %land.rhs.i.61.i
  %or.68.i = or i32 %a.sroa.16.0.extract.trunc, 524288
  br label %if.then.i

lor.rhs.i.i:                                      ; preds = %land.rhs.i.61.i
  %and2.i.62.i = and i64 %a.coerce, 2251795518717952
  %tobool3.i.63.i = icmp ne i64 %and2.i.62.i, 0
  %and2.i.i = and i64 %a.coerce, 2251795518717952
  %tobool3.i.i = icmp ne i64 %and2.i.i, 0
  br label %float64_is_signaling_nan.exit.i

float64_is_signaling_nan.exit.i:                  ; preds = %if.then.6, %lor.rhs.i.i
  %0 = phi i1 [ %tobool3.i.63.i, %lor.rhs.i.i ], [ false, %if.then.6 ]
  %1 = phi i1 [ %tobool3.i.i, %lor.rhs.i.i ], [ false, %if.then.6 ]
  %or.i = or i32 %a.sroa.16.0.extract.trunc, 524288
  %or667.i = or i1 %0, %1
  br i1 %or667.i, label %if.then.i, label %cleanup

if.then.i:                                        ; preds = %float64_is_signaling_nan.exit.i, %float64_is_signaling_nan.exit.thread.i
  %or574.i = phi i32 [ %or.68.i, %float64_is_signaling_nan.exit.thread.i ], [ %or.i, %float64_is_signaling_nan.exit.i ]
  %2 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i = or i32 %2, 16
  store i32 %or.i.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.8:                                         ; preds = %if.then
  %sub = sub nsw i32 1074, %and.i
  %shl9 = shl i32 2, %sub
  %sub10 = add i32 %shl9, -1
  %3 = load i32, i32* @float_rounding_mode, align 4, !tbaa !1
  switch i32 %3, label %if.then.38 [
    i32 0, label %if.then.12
    i32 1, label %if.end.49
  ]

if.then.12:                                       ; preds = %if.end.8
  %tobool13 = icmp ult i32 %sub, 31
  br i1 %tobool13, label %if.then.14, label %if.else

if.then.14:                                       ; preds = %if.then.12
  %shr = lshr i32 %shl9, 1
  %add.i.295 = add i32 %shr, %a.sroa.0.0.extract.trunc
  %cmp.i.296 = icmp ult i32 %add.i.295, %a.sroa.0.0.extract.trunc
  %conv.i.297 = zext i1 %cmp.i.296 to i32
  %add2.i.298 = add i32 %conv.i.297, %a.sroa.16.0.extract.trunc
  %and = and i32 %add.i.295, %sub10
  %cmp18 = icmp eq i32 %and, 0
  br i1 %cmp18, label %if.then.19, label %if.end.49

if.then.19:                                       ; preds = %if.then.14
  %neg = xor i32 %shl9, -1
  %and21 = and i32 %add.i.295, %neg
  br label %if.end.49

if.else:                                          ; preds = %if.then.12
  %cmp24 = icmp slt i32 %a.sroa.0.0.extract.trunc, 0
  br i1 %cmp24, label %if.then.25, label %if.end.49

if.then.25:                                       ; preds = %if.else
  %inc = add i32 %a.sroa.16.0.extract.trunc, 1
  %shl28.mask = and i32 %a.sroa.0.0.extract.trunc, 2147483647
  %cmp29 = icmp eq i32 %shl28.mask, 0
  %and32 = and i32 %inc, -2
  %and32.inc = select i1 %cmp29, i32 %and32, i32 %inc
  br label %if.end.49

if.then.38:                                       ; preds = %if.end.8
  %a.sroa.1.0.extract.shift.i.293 = lshr i64 %a.coerce, 63
  %shr.i.294 = trunc i64 %a.sroa.1.0.extract.shift.i.293 to i32
  %cmp40 = icmp eq i32 %3, 2
  %conv = zext i1 %cmp40 to i32
  %tobool41 = icmp eq i32 %shr.i.294, %conv
  br i1 %tobool41, label %if.end.49, label %if.then.42

if.then.42:                                       ; preds = %if.then.38
  %add.i.292 = add i32 %sub10, %a.sroa.0.0.extract.trunc
  %cmp.i = icmp ult i32 %add.i.292, %a.sroa.0.0.extract.trunc
  %conv.i = zext i1 %cmp.i to i32
  %add2.i = add i32 %conv.i, %a.sroa.16.0.extract.trunc
  br label %if.end.49

if.end.49:                                        ; preds = %if.then.25, %if.end.8, %if.then.38, %if.then.42, %if.then.19, %if.then.14, %if.else
  %z.sroa.18.0 = phi i32 [ %a.sroa.16.0.extract.trunc, %if.then.38 ], [ %add2.i, %if.then.42 ], [ %a.sroa.16.0.extract.trunc, %if.end.8 ], [ %add2.i.298, %if.then.19 ], [ %add2.i.298, %if.then.14 ], [ %a.sroa.16.0.extract.trunc, %if.else ], [ %and32.inc, %if.then.25 ]
  %z.sroa.0.0 = phi i32 [ %a.sroa.0.0.extract.trunc, %if.then.38 ], [ %add.i.292, %if.then.42 ], [ %a.sroa.0.0.extract.trunc, %if.end.8 ], [ %and21, %if.then.19 ], [ %add.i.295, %if.then.14 ], [ %a.sroa.0.0.extract.trunc, %if.else ], [ %a.sroa.0.0.extract.trunc, %if.then.25 ]
  %neg50 = sub i32 0, %shl9
  %and52 = and i32 %z.sroa.0.0, %neg50
  br label %if.end.135

if.else.53:                                       ; preds = %entry
  %cmp54 = icmp ult i32 %and.i, 1023
  br i1 %cmp54, label %if.then.56, label %if.end.89

if.then.56:                                       ; preds = %if.else.53
  %shl58280 = shl nuw nsw i64 %a.sroa.16.0.extract.shift, 1
  %or60282 = or i64 %shl58280, %a.coerce
  %or60 = trunc i64 %or60282 to i32
  %cmp61 = icmp eq i32 %or60, 0
  br i1 %cmp61, label %cleanup, label %if.end.64

if.end.64:                                        ; preds = %if.then.56
  %4 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or65 = or i32 %4, 1
  store i32 %or65, i32* @float_exception_flags, align 4, !tbaa !1
  %a.sroa.1.0.extract.shift.i.290 = lshr i64 %a.coerce, 63
  %shr.i.291 = trunc i64 %a.sroa.1.0.extract.shift.i.290 to i32
  %5 = load i32, i32* @float_rounding_mode, align 4, !tbaa !1
  switch i32 %5, label %sw.epilog [
    i32 0, label %sw.bb
    i32 3, label %sw.bb.77
    i32 2, label %sw.bb.81
  ]

sw.bb:                                            ; preds = %if.end.64
  %cmp67 = icmp eq i32 %and.i, 1022
  br i1 %cmp67, label %land.lhs.true.69, label %sw.epilog

land.lhs.true.69:                                 ; preds = %sw.bb
  %and.i.289 = and i32 %a.sroa.16.0.extract.trunc, 1048575
  %or72 = or i32 %and.i.289, %a.sroa.0.0.extract.trunc
  %tobool73 = icmp eq i32 %or72, 0
  br i1 %tobool73, label %sw.epilog, label %if.then.74

if.then.74:                                       ; preds = %land.lhs.true.69
  %shl.i.285329 = shl nuw nsw i64 %a.sroa.1.0.extract.shift.i.290, 31
  %add.i = or i64 %shl.i.285329, 1072693248
  %retval.sroa.11.0.extract.trunc268 = trunc i64 %add.i to i32
  br label %cleanup

sw.bb.77:                                         ; preds = %if.end.64
  %tobool78 = icmp eq i32 %shr.i.291, 0
  %retval.sroa.11.0 = select i1 %tobool78, i32 0, i32 -1074790400
  br label %cleanup

sw.bb.81:                                         ; preds = %if.end.64
  %tobool82 = icmp eq i32 %shr.i.291, 0
  %retval.sroa.11.1 = select i1 %tobool82, i32 1072693248, i32 -2147483648
  br label %cleanup

sw.epilog:                                        ; preds = %land.lhs.true.69, %sw.bb, %if.end.64
  %shl.i327 = shl nuw nsw i64 %a.sroa.1.0.extract.shift.i.290, 31
  %retval.sroa.11.0.extract.trunc278 = trunc i64 %shl.i327 to i32
  br label %cleanup

if.end.89:                                        ; preds = %if.else.53
  %sub90 = sub nsw i32 1043, %and.i
  %shl91 = shl i32 1, %sub90
  %sub92 = add i32 %shl91, -1
  %6 = load i32, i32* @float_rounding_mode, align 4, !tbaa !1
  switch i32 %6, label %if.then.115 [
    i32 0, label %if.then.98
    i32 1, label %if.end.131
  ]

if.then.98:                                       ; preds = %if.end.89
  %shr99 = lshr i32 %shl91, 1
  %add = add i32 %shr99, %a.sroa.16.0.extract.trunc
  %and102 = and i32 %add, %sub92
  %or104 = or i32 %and102, %a.sroa.0.0.extract.trunc
  %cmp105 = icmp eq i32 %or104, 0
  br i1 %cmp105, label %if.then.107, label %if.end.131

if.then.107:                                      ; preds = %if.then.98
  %neg108 = xor i32 %shl91, -1
  %and110 = and i32 %add, %neg108
  br label %if.end.131

if.then.115:                                      ; preds = %if.end.89
  %a.sroa.1.0.extract.shift.i.283 = lshr i64 %a.coerce, 63
  %shr.i.284 = trunc i64 %a.sroa.1.0.extract.shift.i.283 to i32
  %cmp117 = icmp eq i32 %6, 2
  %conv118 = zext i1 %cmp117 to i32
  %tobool120 = icmp eq i32 %shr.i.284, %conv118
  br i1 %tobool120, label %if.end.131, label %if.then.121

if.then.121:                                      ; preds = %if.then.115
  %cmp123 = icmp ne i32 %a.sroa.0.0.extract.trunc, 0
  %conv124 = zext i1 %cmp123 to i32
  %or126 = or i32 %conv124, %a.sroa.16.0.extract.trunc
  %add128 = add i32 %sub92, %or126
  br label %if.end.131

if.end.131:                                       ; preds = %if.end.89, %if.then.115, %if.then.121, %if.then.98, %if.then.107
  %z.sroa.18.1 = phi i32 [ %a.sroa.16.0.extract.trunc, %if.then.115 ], [ %add128, %if.then.121 ], [ %a.sroa.16.0.extract.trunc, %if.end.89 ], [ %and110, %if.then.107 ], [ %add, %if.then.98 ]
  %neg132 = sub i32 0, %shl91
  %and134 = and i32 %z.sroa.18.1, %neg132
  br label %if.end.135

if.end.135:                                       ; preds = %if.end.131, %if.end.49
  %z.sroa.18.2 = phi i32 [ %z.sroa.18.0, %if.end.49 ], [ %and134, %if.end.131 ]
  %z.sroa.0.1 = phi i32 [ %and52, %if.end.49 ], [ 0, %if.end.131 ]
  %cmp138 = icmp eq i32 %z.sroa.0.1, %a.sroa.0.0.extract.trunc
  %cmp142 = icmp eq i32 %z.sroa.18.2, %a.sroa.16.0.extract.trunc
  %or.cond = and i1 %cmp142, %cmp138
  br i1 %or.cond, label %cleanup, label %if.then.144

if.then.144:                                      ; preds = %if.end.135
  %7 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or145 = or i32 %7, 1
  store i32 %or145, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

cleanup:                                          ; preds = %if.then.i, %float64_is_signaling_nan.exit.i, %if.end.135, %if.then.144, %if.then.56, %if.then.2, %land.lhs.true, %sw.epilog, %sw.bb.81, %sw.bb.77, %if.then.74
  %retval.sroa.0.2 = phi i32 [ 0, %sw.epilog ], [ 0, %sw.bb.81 ], [ 0, %sw.bb.77 ], [ 0, %if.then.74 ], [ %a.sroa.0.0.extract.trunc, %land.lhs.true ], [ %a.sroa.0.0.extract.trunc, %if.then.2 ], [ %a.sroa.0.0.extract.trunc, %if.then.56 ], [ %z.sroa.0.1, %if.then.144 ], [ %a.sroa.0.0.extract.trunc, %if.end.135 ], [ %a.sroa.0.0.extract.trunc, %float64_is_signaling_nan.exit.i ], [ %a.sroa.0.0.extract.trunc, %if.then.i ]
  %retval.sroa.11.2 = phi i32 [ %retval.sroa.11.0.extract.trunc278, %sw.epilog ], [ %retval.sroa.11.1, %sw.bb.81 ], [ %retval.sroa.11.0, %sw.bb.77 ], [ %retval.sroa.11.0.extract.trunc268, %if.then.74 ], [ %a.sroa.16.0.extract.trunc, %land.lhs.true ], [ %a.sroa.16.0.extract.trunc, %if.then.2 ], [ %a.sroa.16.0.extract.trunc, %if.then.56 ], [ %z.sroa.18.2, %if.then.144 ], [ %a.sroa.16.0.extract.trunc, %if.end.135 ], [ %or.i, %float64_is_signaling_nan.exit.i ], [ %or574.i, %if.then.i ]
  %retval.sroa.11.0.insert.ext = zext i32 %retval.sroa.11.2 to i64
  %retval.sroa.11.0.insert.shift = shl nuw i64 %retval.sroa.11.0.insert.ext, 32
  %retval.sroa.0.0.insert.ext = zext i32 %retval.sroa.0.2 to i64
  %retval.sroa.0.0.insert.insert = or i64 %retval.sroa.11.0.insert.shift, %retval.sroa.0.0.insert.ext
  ret i64 %retval.sroa.0.0.insert.insert
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i64 @float64_add(i64 %a.coerce, i64 %b.coerce) #2 {
entry:
  %a.sroa.1.0.extract.shift.i = lshr i64 %a.coerce, 63
  %shr.i = trunc i64 %a.sroa.1.0.extract.shift.i to i32
  %a.sroa.1.0.extract.shift.i.10 = lshr i64 %b.coerce, 63
  %shr.i.11 = trunc i64 %a.sroa.1.0.extract.shift.i.10 to i32
  %cmp = icmp eq i32 %shr.i, %shr.i.11
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call2 = tail call fastcc i64 @addFloat64Sigs(i64 %a.coerce, i64 %b.coerce, i32 %shr.i) #5
  br label %cleanup

if.else:                                          ; preds = %entry
  %call3 = tail call fastcc i64 @subFloat64Sigs(i64 %a.coerce, i64 %b.coerce, i32 %shr.i) #5
  br label %cleanup

cleanup:                                          ; preds = %if.else, %if.then
  %retval.sroa.0.0 = phi i64 [ %call2, %if.then ], [ %call3, %if.else ]
  ret i64 %retval.sroa.0.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define internal fastcc i64 @addFloat64Sigs(i64 %a.coerce, i64 %b.coerce, i32 %zSign) #2 {
entry:
  %a.sroa.0.0.extract.trunc.i = trunc i64 %a.coerce to i32
  %a.sroa.1.0.extract.shift.i = lshr i64 %a.coerce, 32
  %a.sroa.1.0.extract.trunc.i = trunc i64 %a.sroa.1.0.extract.shift.i to i32
  %and.i = and i32 %a.sroa.1.0.extract.trunc.i, 1048575
  %a.sroa.1.0.extract.shift.i.281 = lshr i64 %a.coerce, 52
  %shr.i.282 = trunc i64 %a.sroa.1.0.extract.shift.i.281 to i32
  %and.i.283 = and i32 %shr.i.282, 2047
  %a.sroa.0.0.extract.trunc.i.280 = trunc i64 %b.coerce to i32
  %a.sroa.1.0.extract.shift.i.277 = lshr i64 %b.coerce, 32
  %a.sroa.1.0.extract.trunc.i.278 = trunc i64 %a.sroa.1.0.extract.shift.i.277 to i32
  %and.i.279 = and i32 %a.sroa.1.0.extract.trunc.i.278, 1048575
  %a.sroa.1.0.extract.shift.i.274 = lshr i64 %b.coerce, 52
  %shr.i.275 = trunc i64 %a.sroa.1.0.extract.shift.i.274 to i32
  %and.i.276 = and i32 %shr.i.275, 2047
  %sub = sub nsw i32 %and.i.283, %and.i.276
  %cmp = icmp sgt i32 %sub, 0
  br i1 %cmp, label %if.then, label %if.else.15

if.then:                                          ; preds = %entry
  %cmp6 = icmp eq i32 %and.i.283, 2047
  br i1 %cmp6, label %if.then.7, label %if.end.10

if.then.7:                                        ; preds = %if.then
  %or = or i32 %and.i, %a.sroa.0.0.extract.trunc.i
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %cleanup, label %if.then.8

if.then.8:                                        ; preds = %if.then.7
  %and.i.57.i.222 = and i64 %a.coerce, 9221120237041090560
  %cmp.i.58.i.223 = icmp eq i64 %and.i.57.i.222, 9218868437227405312
  br i1 %cmp.i.58.i.223, label %land.rhs.i.61.i.226, label %float64_is_signaling_nan.exit66.i.233

land.rhs.i.61.i.226:                              ; preds = %if.then.8
  %tobool.i.60.i.225 = icmp eq i32 %a.sroa.0.0.extract.trunc.i, 0
  br i1 %tobool.i.60.i.225, label %lor.rhs.i.64.i.229, label %float64_is_signaling_nan.exit66.i.233

lor.rhs.i.64.i.229:                               ; preds = %land.rhs.i.61.i.226
  %and2.i.62.i.227 = and i64 %a.coerce, 2251795518717952
  %tobool3.i.63.i.228 = icmp ne i64 %and2.i.62.i.227, 0
  br label %float64_is_signaling_nan.exit66.i.233

float64_is_signaling_nan.exit66.i.233:            ; preds = %lor.rhs.i.64.i.229, %land.rhs.i.61.i.226, %if.then.8
  %0 = phi i1 [ false, %if.then.8 ], [ true, %land.rhs.i.61.i.226 ], [ %tobool3.i.63.i.228, %lor.rhs.i.64.i.229 ]
  %shl4.i.i.230 = shl nuw nsw i64 %a.sroa.1.0.extract.shift.i.277, 1
  %shl.i.i.231 = trunc i64 %shl4.i.i.230 to i32
  %cmp.i.50.i.232 = icmp ugt i32 %shl.i.i.231, -2097153
  br i1 %cmp.i.50.i.232, label %land.rhs.i.53.i.236, label %float64_is_nan.exit.i.242

land.rhs.i.53.i.236:                              ; preds = %float64_is_signaling_nan.exit66.i.233
  %tobool.i.52.i.235 = icmp eq i32 %a.sroa.0.0.extract.trunc.i.280, 0
  br i1 %tobool.i.52.i.235, label %lor.rhs.i.55.i.239, label %float64_is_nan.exit.i.242

lor.rhs.i.55.i.239:                               ; preds = %land.rhs.i.53.i.236
  %and.i.54.i.237 = and i64 %a.sroa.1.0.extract.shift.i.277, 1048575
  %tobool2.i.i.238 = icmp ne i64 %and.i.54.i.237, 0
  br label %float64_is_nan.exit.i.242

float64_is_nan.exit.i.242:                        ; preds = %lor.rhs.i.55.i.239, %land.rhs.i.53.i.236, %float64_is_signaling_nan.exit66.i.233
  %1 = phi i1 [ false, %float64_is_signaling_nan.exit66.i.233 ], [ true, %land.rhs.i.53.i.236 ], [ %tobool2.i.i.238, %lor.rhs.i.55.i.239 ]
  %and.i.i.240 = and i64 %b.coerce, 9221120237041090560
  %cmp.i.i.241 = icmp eq i64 %and.i.i.240, 9218868437227405312
  br i1 %cmp.i.i.241, label %land.rhs.i.i.245, label %float64_is_signaling_nan.exit.i.255

land.rhs.i.i.245:                                 ; preds = %float64_is_nan.exit.i.242
  %tobool.i.i.244 = icmp eq i32 %a.sroa.0.0.extract.trunc.i.280, 0
  br i1 %tobool.i.i.244, label %lor.rhs.i.i.251, label %float64_is_signaling_nan.exit.thread.i.248

float64_is_signaling_nan.exit.thread.i.248:       ; preds = %land.rhs.i.i.245
  %or.68.i.246 = or i32 %a.sroa.1.0.extract.trunc.i, 524288
  %or5.69.i.247 = or i32 %a.sroa.1.0.extract.trunc.i.278, 524288
  br label %if.then.i.259

lor.rhs.i.i.251:                                  ; preds = %land.rhs.i.i.245
  %and2.i.i.249 = and i64 %b.coerce, 2251795518717952
  %tobool3.i.i.250 = icmp ne i64 %and2.i.i.249, 0
  br label %float64_is_signaling_nan.exit.i.255

float64_is_signaling_nan.exit.i.255:              ; preds = %lor.rhs.i.i.251, %float64_is_nan.exit.i.242
  %2 = phi i1 [ false, %float64_is_nan.exit.i.242 ], [ %tobool3.i.i.250, %lor.rhs.i.i.251 ]
  %or.i.252 = or i32 %a.sroa.1.0.extract.trunc.i, 524288
  %or5.i.253 = or i32 %a.sroa.1.0.extract.trunc.i.278, 524288
  %or667.i.254 = or i1 %0, %2
  br i1 %or667.i.254, label %if.then.i.259, label %propagateFloat64NaN.exit273

if.then.i.259:                                    ; preds = %float64_is_signaling_nan.exit.i.255, %float64_is_signaling_nan.exit.thread.i.248
  %or574.i.256 = phi i32 [ %or5.69.i.247, %float64_is_signaling_nan.exit.thread.i.248 ], [ %or5.i.253, %float64_is_signaling_nan.exit.i.255 ]
  %or72.i.257 = phi i32 [ %or.68.i.246, %float64_is_signaling_nan.exit.thread.i.248 ], [ %or.i.252, %float64_is_signaling_nan.exit.i.255 ]
  %3 = phi i1 [ true, %float64_is_signaling_nan.exit.thread.i.248 ], [ %2, %float64_is_signaling_nan.exit.i.255 ]
  %4 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.258 = or i32 %4, 16
  store i32 %or.i.i.258, i32* @float_exception_flags, align 4, !tbaa !1
  br label %propagateFloat64NaN.exit273

propagateFloat64NaN.exit273:                      ; preds = %float64_is_signaling_nan.exit.i.255, %if.then.i.259
  %or66775.i.260 = phi i1 [ false, %float64_is_signaling_nan.exit.i.255 ], [ true, %if.then.i.259 ]
  %or573.i.261 = phi i32 [ %or5.i.253, %float64_is_signaling_nan.exit.i.255 ], [ %or574.i.256, %if.then.i.259 ]
  %or71.i.262 = phi i32 [ %or.i.252, %float64_is_signaling_nan.exit.i.255 ], [ %or72.i.257, %if.then.i.259 ]
  %5 = phi i1 [ false, %float64_is_signaling_nan.exit.i.255 ], [ %3, %if.then.i.259 ]
  %b.coerce.mux.i.263 = select i1 %5, i64 %b.coerce, i64 %a.coerce
  %or5.mux.i.264 = select i1 %5, i32 %or573.i.261, i32 %or71.i.262
  %a.coerce.b.coerce.i.265 = select i1 %1, i64 %b.coerce, i64 %a.coerce
  %or.or5.i.266 = select i1 %1, i32 %or573.i.261, i32 %or71.i.262
  %retval.sroa.0.0.i.267 = select i1 %or66775.i.260, i64 %b.coerce.mux.i.263, i64 %a.coerce.b.coerce.i.265
  %retval.sroa.5.0.i.268 = select i1 %or66775.i.260, i32 %or5.mux.i.264, i32 %or.or5.i.266
  %retval.sroa.5.0.insert.ext.i.269 = zext i32 %retval.sroa.5.0.i.268 to i64
  %retval.sroa.5.0.insert.shift.i.270 = shl nuw i64 %retval.sroa.5.0.insert.ext.i.269, 32
  %retval.sroa.0.0.insert.ext.i.271 = and i64 %retval.sroa.0.0.i.267, 4294967295
  %retval.sroa.0.0.insert.insert.i.272 = or i64 %retval.sroa.5.0.insert.shift.i.270, %retval.sroa.0.0.insert.ext.i.271
  br label %cleanup

if.end.10:                                        ; preds = %if.then
  %cmp11 = icmp eq i32 %and.i.276, 0
  br i1 %cmp11, label %if.end.14, label %if.end.14.thread

if.end.14.thread:                                 ; preds = %if.end.10
  %or13 = or i32 %and.i.279, 1048576
  br label %if.else.i.186

if.end.14:                                        ; preds = %if.end.10
  %dec = add nsw i32 %sub, -1
  %cmp.i.184 = icmp eq i32 %dec, 0
  br i1 %cmp.i.184, label %if.end.50, label %if.else.i.186

if.else.i.186:                                    ; preds = %if.end.14.thread, %if.end.14
  %.pn = phi i32 [ 0, %if.end.14.thread ], [ 1, %if.end.14 ]
  %expDiff.0318 = phi i32 [ %sub, %if.end.14.thread ], [ %dec, %if.end.14 ]
  %bSig0.0317 = phi i32 [ %or13, %if.end.14.thread ], [ %and.i.279, %if.end.14 ]
  %and.i.183319.in = sub nsw i32 %.pn, %sub
  %and.i.183319 = and i32 %and.i.183319.in, 31
  %cmp1.i.185 = icmp slt i32 %expDiff.0318, 32
  br i1 %cmp1.i.185, label %if.then.2.i.192, label %if.else.5.i.194

if.then.2.i.192:                                  ; preds = %if.else.i.186
  %shl.i.187 = shl i32 %a.sroa.0.0.extract.trunc.i.280, %and.i.183319
  %shl3.i.188 = shl i32 %bSig0.0317, %and.i.183319
  %shr.i.189 = lshr i32 %a.sroa.0.0.extract.trunc.i.280, %expDiff.0318
  %or.i.190 = or i32 %shl3.i.188, %shr.i.189
  %shr4.i.191 = lshr i32 %bSig0.0317, %expDiff.0318
  br label %if.end.19.i.213

if.else.5.i.194:                                  ; preds = %if.else.i.186
  %cmp6.i.193 = icmp eq i32 %expDiff.0318, 32
  br i1 %cmp6.i.193, label %if.end.19.i.213, label %if.else.8.i.196

if.else.8.i.196:                                  ; preds = %if.else.5.i.194
  %cmp10.i.195 = icmp slt i32 %expDiff.0318, 64
  br i1 %cmp10.i.195, label %if.then.11.i.200, label %if.else.15.i.205

if.then.11.i.200:                                 ; preds = %if.else.8.i.196
  %shl12.i.197 = shl i32 %bSig0.0317, %and.i.183319
  %and13.i.198 = and i32 %expDiff.0318, 31
  %shr14.i.199 = lshr i32 %bSig0.0317, %and13.i.198
  br label %if.end.19.i.213

if.else.15.i.205:                                 ; preds = %if.else.8.i.196
  %cmp16.i.201 = icmp eq i32 %expDiff.0318, 64
  %cmp17.i.202 = icmp ne i32 %bSig0.0317, 0
  %conv.i.203 = zext i1 %cmp17.i.202 to i32
  %cond.i.204 = select i1 %cmp16.i.201, i32 %bSig0.0317, i32 %conv.i.203
  br label %if.end.19.i.213

if.end.19.i.213:                                  ; preds = %if.else.15.i.205, %if.then.11.i.200, %if.else.5.i.194, %if.then.2.i.192
  %z0.0.i.206 = phi i32 [ %shr4.i.191, %if.then.2.i.192 ], [ 0, %if.else.5.i.194 ], [ 0, %if.then.11.i.200 ], [ 0, %if.else.15.i.205 ]
  %z1.1.i.207 = phi i32 [ %or.i.190, %if.then.2.i.192 ], [ %bSig0.0317, %if.else.5.i.194 ], [ %shr14.i.199, %if.then.11.i.200 ], [ 0, %if.else.15.i.205 ]
  %z2.1.i.208 = phi i32 [ %shl.i.187, %if.then.2.i.192 ], [ %a.sroa.0.0.extract.trunc.i.280, %if.else.5.i.194 ], [ %shl12.i.197, %if.then.11.i.200 ], [ %cond.i.204, %if.else.15.i.205 ]
  %a2.addr.1.i.209 = phi i32 [ 0, %if.then.2.i.192 ], [ 0, %if.else.5.i.194 ], [ %a.sroa.0.0.extract.trunc.i.280, %if.then.11.i.200 ], [ %a.sroa.0.0.extract.trunc.i.280, %if.else.15.i.205 ]
  %cmp20.i.210 = icmp ne i32 %a2.addr.1.i.209, 0
  %conv21.i.211 = zext i1 %cmp20.i.210 to i32
  %or22.i.212 = or i32 %conv21.i.211, %z2.1.i.208
  br label %if.end.50

if.else.15:                                       ; preds = %entry
  %cmp16 = icmp slt i32 %sub, 0
  br i1 %cmp16, label %if.then.17, label %if.else.33

if.then.17:                                       ; preds = %if.else.15
  %cmp18 = icmp eq i32 %and.i.276, 2047
  br i1 %cmp18, label %if.then.19, label %if.end.26

if.then.19:                                       ; preds = %if.then.17
  %or20 = or i32 %and.i.279, %a.sroa.0.0.extract.trunc.i.280
  %tobool21 = icmp eq i32 %or20, 0
  br i1 %tobool21, label %if.end.24, label %if.then.22

if.then.22:                                       ; preds = %if.then.19
  %and.i.57.i.131 = and i64 %a.coerce, 9221120237041090560
  %cmp.i.58.i.132 = icmp eq i64 %and.i.57.i.131, 9218868437227405312
  br i1 %cmp.i.58.i.132, label %land.rhs.i.61.i.135, label %float64_is_signaling_nan.exit66.i.142

land.rhs.i.61.i.135:                              ; preds = %if.then.22
  %tobool.i.60.i.134 = icmp eq i32 %a.sroa.0.0.extract.trunc.i, 0
  br i1 %tobool.i.60.i.134, label %lor.rhs.i.64.i.138, label %float64_is_signaling_nan.exit66.i.142

lor.rhs.i.64.i.138:                               ; preds = %land.rhs.i.61.i.135
  %and2.i.62.i.136 = and i64 %a.coerce, 2251795518717952
  %tobool3.i.63.i.137 = icmp ne i64 %and2.i.62.i.136, 0
  br label %float64_is_signaling_nan.exit66.i.142

float64_is_signaling_nan.exit66.i.142:            ; preds = %lor.rhs.i.64.i.138, %land.rhs.i.61.i.135, %if.then.22
  %6 = phi i1 [ false, %if.then.22 ], [ true, %land.rhs.i.61.i.135 ], [ %tobool3.i.63.i.137, %lor.rhs.i.64.i.138 ]
  %shl4.i.i.139 = shl nuw nsw i64 %a.sroa.1.0.extract.shift.i.277, 1
  %shl.i.i.140 = trunc i64 %shl4.i.i.139 to i32
  %cmp.i.50.i.141 = icmp ugt i32 %shl.i.i.140, -2097153
  br i1 %cmp.i.50.i.141, label %land.rhs.i.53.i.145, label %float64_is_nan.exit.i.151

land.rhs.i.53.i.145:                              ; preds = %float64_is_signaling_nan.exit66.i.142
  %tobool.i.52.i.144 = icmp eq i32 %a.sroa.0.0.extract.trunc.i.280, 0
  br i1 %tobool.i.52.i.144, label %lor.rhs.i.55.i.148, label %float64_is_nan.exit.i.151

lor.rhs.i.55.i.148:                               ; preds = %land.rhs.i.53.i.145
  %and.i.54.i.146 = and i64 %a.sroa.1.0.extract.shift.i.277, 1048575
  %tobool2.i.i.147 = icmp ne i64 %and.i.54.i.146, 0
  br label %float64_is_nan.exit.i.151

float64_is_nan.exit.i.151:                        ; preds = %lor.rhs.i.55.i.148, %land.rhs.i.53.i.145, %float64_is_signaling_nan.exit66.i.142
  %7 = phi i1 [ false, %float64_is_signaling_nan.exit66.i.142 ], [ true, %land.rhs.i.53.i.145 ], [ %tobool2.i.i.147, %lor.rhs.i.55.i.148 ]
  %and.i.i.149 = and i64 %b.coerce, 9221120237041090560
  %cmp.i.i.150 = icmp eq i64 %and.i.i.149, 9218868437227405312
  br i1 %cmp.i.i.150, label %land.rhs.i.i.154, label %float64_is_signaling_nan.exit.i.164

land.rhs.i.i.154:                                 ; preds = %float64_is_nan.exit.i.151
  %tobool.i.i.153 = icmp eq i32 %a.sroa.0.0.extract.trunc.i.280, 0
  br i1 %tobool.i.i.153, label %lor.rhs.i.i.160, label %float64_is_signaling_nan.exit.thread.i.157

float64_is_signaling_nan.exit.thread.i.157:       ; preds = %land.rhs.i.i.154
  %or.68.i.155 = or i32 %a.sroa.1.0.extract.trunc.i, 524288
  %or5.69.i.156 = or i32 %a.sroa.1.0.extract.trunc.i.278, 524288
  br label %if.then.i.168

lor.rhs.i.i.160:                                  ; preds = %land.rhs.i.i.154
  %and2.i.i.158 = and i64 %b.coerce, 2251795518717952
  %tobool3.i.i.159 = icmp ne i64 %and2.i.i.158, 0
  br label %float64_is_signaling_nan.exit.i.164

float64_is_signaling_nan.exit.i.164:              ; preds = %lor.rhs.i.i.160, %float64_is_nan.exit.i.151
  %8 = phi i1 [ false, %float64_is_nan.exit.i.151 ], [ %tobool3.i.i.159, %lor.rhs.i.i.160 ]
  %or.i.161 = or i32 %a.sroa.1.0.extract.trunc.i, 524288
  %or5.i.162 = or i32 %a.sroa.1.0.extract.trunc.i.278, 524288
  %or667.i.163 = or i1 %6, %8
  br i1 %or667.i.163, label %if.then.i.168, label %propagateFloat64NaN.exit182

if.then.i.168:                                    ; preds = %float64_is_signaling_nan.exit.i.164, %float64_is_signaling_nan.exit.thread.i.157
  %or574.i.165 = phi i32 [ %or5.69.i.156, %float64_is_signaling_nan.exit.thread.i.157 ], [ %or5.i.162, %float64_is_signaling_nan.exit.i.164 ]
  %or72.i.166 = phi i32 [ %or.68.i.155, %float64_is_signaling_nan.exit.thread.i.157 ], [ %or.i.161, %float64_is_signaling_nan.exit.i.164 ]
  %9 = phi i1 [ true, %float64_is_signaling_nan.exit.thread.i.157 ], [ %8, %float64_is_signaling_nan.exit.i.164 ]
  %10 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.167 = or i32 %10, 16
  store i32 %or.i.i.167, i32* @float_exception_flags, align 4, !tbaa !1
  br label %propagateFloat64NaN.exit182

propagateFloat64NaN.exit182:                      ; preds = %float64_is_signaling_nan.exit.i.164, %if.then.i.168
  %or66775.i.169 = phi i1 [ false, %float64_is_signaling_nan.exit.i.164 ], [ true, %if.then.i.168 ]
  %or573.i.170 = phi i32 [ %or5.i.162, %float64_is_signaling_nan.exit.i.164 ], [ %or574.i.165, %if.then.i.168 ]
  %or71.i.171 = phi i32 [ %or.i.161, %float64_is_signaling_nan.exit.i.164 ], [ %or72.i.166, %if.then.i.168 ]
  %11 = phi i1 [ false, %float64_is_signaling_nan.exit.i.164 ], [ %9, %if.then.i.168 ]
  %b.coerce.mux.i.172 = select i1 %11, i64 %b.coerce, i64 %a.coerce
  %or5.mux.i.173 = select i1 %11, i32 %or573.i.170, i32 %or71.i.171
  %a.coerce.b.coerce.i.174 = select i1 %7, i64 %b.coerce, i64 %a.coerce
  %or.or5.i.175 = select i1 %7, i32 %or573.i.170, i32 %or71.i.171
  %retval.sroa.0.0.i.176 = select i1 %or66775.i.169, i64 %b.coerce.mux.i.172, i64 %a.coerce.b.coerce.i.174
  %retval.sroa.5.0.i.177 = select i1 %or66775.i.169, i32 %or5.mux.i.173, i32 %or.or5.i.175
  %retval.sroa.5.0.insert.ext.i.178 = zext i32 %retval.sroa.5.0.i.177 to i64
  %retval.sroa.5.0.insert.shift.i.179 = shl nuw i64 %retval.sroa.5.0.insert.ext.i.178, 32
  %retval.sroa.0.0.insert.ext.i.180 = and i64 %retval.sroa.0.0.i.176, 4294967295
  %retval.sroa.0.0.insert.insert.i.181 = or i64 %retval.sroa.5.0.insert.shift.i.179, %retval.sroa.0.0.insert.ext.i.180
  br label %cleanup

if.end.24:                                        ; preds = %if.then.19
  %shl.i.123 = shl i32 %zSign, 31
  %add.i.124 = or i32 %shl.i.123, 2146435072
  %retval.sroa.2.0.insert.ext.i.125 = zext i32 %add.i.124 to i64
  %retval.sroa.2.0.insert.shift.i.126 = shl nuw i64 %retval.sroa.2.0.insert.ext.i.125, 32
  br label %cleanup

if.end.26:                                        ; preds = %if.then.17
  %cmp27 = icmp eq i32 %and.i.283, 0
  %or30 = or i32 %and.i, 1048576
  %aSig0.0 = select i1 %cmp27, i32 %and.i, i32 %or30
  %inc = zext i1 %cmp27 to i32
  %expDiff.1 = add nsw i32 %sub, %inc
  %sub32 = sub nsw i32 0, %expDiff.1
  %and.i.112 = and i32 %expDiff.1, 31
  %cmp.i.113 = icmp eq i32 %expDiff.1, 0
  br i1 %cmp.i.113, label %if.end.50, label %if.else.i

if.else.i:                                        ; preds = %if.end.26
  %cmp1.i = icmp sgt i32 %expDiff.1, -32
  br i1 %cmp1.i, label %if.then.2.i, label %if.else.5.i

if.then.2.i:                                      ; preds = %if.else.i
  %shl.i.114 = shl i32 %a.sroa.0.0.extract.trunc.i, %and.i.112
  %shl3.i.115 = shl i32 %aSig0.0, %and.i.112
  %shr.i.116 = lshr i32 %a.sroa.0.0.extract.trunc.i, %sub32
  %or.i.117 = or i32 %shl3.i.115, %shr.i.116
  %shr4.i.118 = lshr i32 %aSig0.0, %sub32
  br label %if.end.19.i

if.else.5.i:                                      ; preds = %if.else.i
  %cmp6.i = icmp eq i32 %sub32, 32
  br i1 %cmp6.i, label %if.end.19.i, label %if.else.8.i

if.else.8.i:                                      ; preds = %if.else.5.i
  %cmp10.i = icmp sgt i32 %expDiff.1, -64
  br i1 %cmp10.i, label %if.then.11.i, label %if.else.15.i

if.then.11.i:                                     ; preds = %if.else.8.i
  %shl12.i = shl i32 %aSig0.0, %and.i.112
  %and13.i = and i32 %sub32, 31
  %shr14.i = lshr i32 %aSig0.0, %and13.i
  br label %if.end.19.i

if.else.15.i:                                     ; preds = %if.else.8.i
  %cmp16.i = icmp eq i32 %sub32, 64
  %cmp17.i = icmp ne i32 %aSig0.0, 0
  %conv.i.119 = zext i1 %cmp17.i to i32
  %cond.i = select i1 %cmp16.i, i32 %aSig0.0, i32 %conv.i.119
  br label %if.end.19.i

if.end.19.i:                                      ; preds = %if.else.15.i, %if.then.11.i, %if.else.5.i, %if.then.2.i
  %z0.0.i = phi i32 [ %shr4.i.118, %if.then.2.i ], [ 0, %if.else.5.i ], [ 0, %if.then.11.i ], [ 0, %if.else.15.i ]
  %z1.1.i = phi i32 [ %or.i.117, %if.then.2.i ], [ %aSig0.0, %if.else.5.i ], [ %shr14.i, %if.then.11.i ], [ 0, %if.else.15.i ]
  %z2.1.i = phi i32 [ %shl.i.114, %if.then.2.i ], [ %a.sroa.0.0.extract.trunc.i, %if.else.5.i ], [ %shl12.i, %if.then.11.i ], [ %cond.i, %if.else.15.i ]
  %a2.addr.1.i = phi i32 [ 0, %if.then.2.i ], [ 0, %if.else.5.i ], [ %a.sroa.0.0.extract.trunc.i, %if.then.11.i ], [ %a.sroa.0.0.extract.trunc.i, %if.else.15.i ]
  %cmp20.i.120 = icmp ne i32 %a2.addr.1.i, 0
  %conv21.i.121 = zext i1 %cmp20.i.120 to i32
  %or22.i.122 = or i32 %conv21.i.121, %z2.1.i
  br label %if.end.50

if.else.33:                                       ; preds = %if.else.15
  %cmp34 = icmp eq i32 %and.i.283, 2047
  br i1 %cmp34, label %if.then.35, label %if.end.43

if.then.35:                                       ; preds = %if.else.33
  %or36320 = or i64 %b.coerce, %a.coerce
  %or36 = trunc i64 %or36320 to i32
  %or37 = or i32 %or36, %and.i
  %or38 = or i32 %or37, %and.i.279
  %tobool39 = icmp eq i32 %or38, 0
  br i1 %tobool39, label %cleanup, label %if.then.40

if.then.40:                                       ; preds = %if.then.35
  %and.i.57.i = and i64 %a.coerce, 9221120237041090560
  %cmp.i.58.i = icmp eq i64 %and.i.57.i, 9218868437227405312
  br i1 %cmp.i.58.i, label %land.rhs.i.61.i, label %float64_is_signaling_nan.exit66.i

land.rhs.i.61.i:                                  ; preds = %if.then.40
  %tobool.i.60.i = icmp eq i32 %a.sroa.0.0.extract.trunc.i, 0
  br i1 %tobool.i.60.i, label %lor.rhs.i.64.i, label %float64_is_signaling_nan.exit66.i

lor.rhs.i.64.i:                                   ; preds = %land.rhs.i.61.i
  %and2.i.62.i = and i64 %a.coerce, 2251795518717952
  %tobool3.i.63.i = icmp ne i64 %and2.i.62.i, 0
  br label %float64_is_signaling_nan.exit66.i

float64_is_signaling_nan.exit66.i:                ; preds = %lor.rhs.i.64.i, %land.rhs.i.61.i, %if.then.40
  %12 = phi i1 [ false, %if.then.40 ], [ true, %land.rhs.i.61.i ], [ %tobool3.i.63.i, %lor.rhs.i.64.i ]
  %shl4.i.i = shl nuw nsw i64 %a.sroa.1.0.extract.shift.i.277, 1
  %shl.i.i = trunc i64 %shl4.i.i to i32
  %cmp.i.50.i = icmp ugt i32 %shl.i.i, -2097153
  br i1 %cmp.i.50.i, label %land.rhs.i.53.i, label %float64_is_nan.exit.i

land.rhs.i.53.i:                                  ; preds = %float64_is_signaling_nan.exit66.i
  %tobool.i.52.i = icmp eq i32 %a.sroa.0.0.extract.trunc.i.280, 0
  br i1 %tobool.i.52.i, label %lor.rhs.i.55.i, label %float64_is_nan.exit.i

lor.rhs.i.55.i:                                   ; preds = %land.rhs.i.53.i
  %and.i.54.i = and i64 %a.sroa.1.0.extract.shift.i.277, 1048575
  %tobool2.i.i = icmp ne i64 %and.i.54.i, 0
  br label %float64_is_nan.exit.i

float64_is_nan.exit.i:                            ; preds = %lor.rhs.i.55.i, %land.rhs.i.53.i, %float64_is_signaling_nan.exit66.i
  %13 = phi i1 [ false, %float64_is_signaling_nan.exit66.i ], [ true, %land.rhs.i.53.i ], [ %tobool2.i.i, %lor.rhs.i.55.i ]
  %and.i.i = and i64 %b.coerce, 9221120237041090560
  %cmp.i.i = icmp eq i64 %and.i.i, 9218868437227405312
  br i1 %cmp.i.i, label %land.rhs.i.i, label %float64_is_signaling_nan.exit.i

land.rhs.i.i:                                     ; preds = %float64_is_nan.exit.i
  %tobool.i.i = icmp eq i32 %a.sroa.0.0.extract.trunc.i.280, 0
  br i1 %tobool.i.i, label %lor.rhs.i.i, label %float64_is_signaling_nan.exit.thread.i

float64_is_signaling_nan.exit.thread.i:           ; preds = %land.rhs.i.i
  %or.68.i = or i32 %a.sroa.1.0.extract.trunc.i, 524288
  %or5.69.i = or i32 %a.sroa.1.0.extract.trunc.i.278, 524288
  br label %if.then.i

lor.rhs.i.i:                                      ; preds = %land.rhs.i.i
  %and2.i.i = and i64 %b.coerce, 2251795518717952
  %tobool3.i.i = icmp ne i64 %and2.i.i, 0
  br label %float64_is_signaling_nan.exit.i

float64_is_signaling_nan.exit.i:                  ; preds = %lor.rhs.i.i, %float64_is_nan.exit.i
  %14 = phi i1 [ false, %float64_is_nan.exit.i ], [ %tobool3.i.i, %lor.rhs.i.i ]
  %or.i.109 = or i32 %a.sroa.1.0.extract.trunc.i, 524288
  %or5.i = or i32 %a.sroa.1.0.extract.trunc.i.278, 524288
  %or667.i = or i1 %12, %14
  br i1 %or667.i, label %if.then.i, label %propagateFloat64NaN.exit

if.then.i:                                        ; preds = %float64_is_signaling_nan.exit.i, %float64_is_signaling_nan.exit.thread.i
  %or574.i = phi i32 [ %or5.69.i, %float64_is_signaling_nan.exit.thread.i ], [ %or5.i, %float64_is_signaling_nan.exit.i ]
  %or72.i = phi i32 [ %or.68.i, %float64_is_signaling_nan.exit.thread.i ], [ %or.i.109, %float64_is_signaling_nan.exit.i ]
  %15 = phi i1 [ true, %float64_is_signaling_nan.exit.thread.i ], [ %14, %float64_is_signaling_nan.exit.i ]
  %16 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i = or i32 %16, 16
  store i32 %or.i.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %propagateFloat64NaN.exit

propagateFloat64NaN.exit:                         ; preds = %float64_is_signaling_nan.exit.i, %if.then.i
  %or66775.i = phi i1 [ false, %float64_is_signaling_nan.exit.i ], [ true, %if.then.i ]
  %or573.i = phi i32 [ %or5.i, %float64_is_signaling_nan.exit.i ], [ %or574.i, %if.then.i ]
  %or71.i = phi i32 [ %or.i.109, %float64_is_signaling_nan.exit.i ], [ %or72.i, %if.then.i ]
  %17 = phi i1 [ false, %float64_is_signaling_nan.exit.i ], [ %15, %if.then.i ]
  %b.coerce.mux.i = select i1 %17, i64 %b.coerce, i64 %a.coerce
  %or5.mux.i = select i1 %17, i32 %or573.i, i32 %or71.i
  %a.coerce.b.coerce.i = select i1 %13, i64 %b.coerce, i64 %a.coerce
  %or.or5.i = select i1 %13, i32 %or573.i, i32 %or71.i
  %retval.sroa.0.0.i = select i1 %or66775.i, i64 %b.coerce.mux.i, i64 %a.coerce.b.coerce.i
  %retval.sroa.5.0.i = select i1 %or66775.i, i32 %or5.mux.i, i32 %or.or5.i
  %retval.sroa.5.0.insert.ext.i = zext i32 %retval.sroa.5.0.i to i64
  %retval.sroa.5.0.insert.shift.i = shl nuw i64 %retval.sroa.5.0.insert.ext.i, 32
  %retval.sroa.0.0.insert.ext.i.110 = and i64 %retval.sroa.0.0.i, 4294967295
  %retval.sroa.0.0.insert.insert.i.111 = or i64 %retval.sroa.5.0.insert.shift.i, %retval.sroa.0.0.insert.ext.i.110
  br label %cleanup

if.end.43:                                        ; preds = %if.else.33
  %add.i.104 = add i32 %a.sroa.0.0.extract.trunc.i.280, %a.sroa.0.0.extract.trunc.i
  %add1.i.105 = add nuw nsw i32 %and.i.279, %and.i
  %cmp.i.106 = icmp ult i32 %add.i.104, %a.sroa.0.0.extract.trunc.i
  %conv.i.107 = zext i1 %cmp.i.106 to i32
  %add2.i.108 = add nuw nsw i32 %add1.i.105, %conv.i.107
  %cmp44 = icmp eq i32 %and.i.283, 0
  br i1 %cmp44, label %if.then.45, label %if.end.47

if.then.45:                                       ; preds = %if.end.43
  %shl.i.102 = shl i32 %zSign, 31
  %add2.i.103 = or i32 %add2.i.108, %shl.i.102
  %retval.sroa.2.0.insert.ext.i = zext i32 %add2.i.103 to i64
  %retval.sroa.2.0.insert.shift.i = shl nuw i64 %retval.sroa.2.0.insert.ext.i, 32
  %retval.sroa.0.0.insert.ext.i = zext i32 %add.i.104 to i64
  %retval.sroa.0.0.insert.insert.i = or i64 %retval.sroa.2.0.insert.shift.i, %retval.sroa.0.0.insert.ext.i
  br label %cleanup

if.end.47:                                        ; preds = %if.end.43
  %or48 = or i32 %add2.i.108, 2097152
  br label %shiftRight1

if.end.50:                                        ; preds = %if.end.19.i, %if.end.26, %if.end.19.i.213, %if.end.14
  %aSig0.1 = phi i32 [ %and.i, %if.end.14 ], [ %and.i, %if.end.19.i.213 ], [ %z0.0.i, %if.end.19.i ], [ %aSig0.0, %if.end.26 ]
  %aSig1.0 = phi i32 [ %a.sroa.0.0.extract.trunc.i, %if.end.14 ], [ %a.sroa.0.0.extract.trunc.i, %if.end.19.i.213 ], [ %z1.1.i, %if.end.19.i ], [ %a.sroa.0.0.extract.trunc.i, %if.end.26 ]
  %bSig0.1 = phi i32 [ %and.i.279, %if.end.14 ], [ %z0.0.i.206, %if.end.19.i.213 ], [ %and.i.279, %if.end.19.i ], [ %and.i.279, %if.end.26 ]
  %bSig1.0 = phi i32 [ %a.sroa.0.0.extract.trunc.i.280, %if.end.14 ], [ %z1.1.i.207, %if.end.19.i.213 ], [ %a.sroa.0.0.extract.trunc.i.280, %if.end.19.i ], [ %a.sroa.0.0.extract.trunc.i.280, %if.end.26 ]
  %zSig2.0 = phi i32 [ 0, %if.end.14 ], [ %or22.i.212, %if.end.19.i.213 ], [ %or22.i.122, %if.end.19.i ], [ 0, %if.end.26 ]
  %zExp.0 = phi i32 [ %and.i.283, %if.end.14 ], [ %and.i.283, %if.end.19.i.213 ], [ %and.i.276, %if.end.19.i ], [ %and.i.276, %if.end.26 ]
  %or51 = or i32 %aSig0.1, 1048576
  %add.i = add i32 %bSig1.0, %aSig1.0
  %add1.i = add i32 %bSig0.1, %or51
  %cmp.i = icmp ult i32 %add.i, %aSig1.0
  %conv.i = zext i1 %cmp.i to i32
  %add2.i = add i32 %add1.i, %conv.i
  %dec52 = add nsw i32 %zExp.0, -1
  %cmp53 = icmp ult i32 %add2.i, 2097152
  br i1 %cmp53, label %roundAndPack, label %shiftRight1

shiftRight1:                                      ; preds = %if.end.50, %if.end.47
  %zSig0.0 = phi i32 [ %add2.i, %if.end.50 ], [ %or48, %if.end.47 ]
  %zSig1.0 = phi i32 [ %add.i, %if.end.50 ], [ %add.i.104, %if.end.47 ]
  %zSig2.1 = phi i32 [ %zSig2.0, %if.end.50 ], [ 0, %if.end.47 ]
  %zExp.1 = phi i32 [ %zExp.0, %if.end.50 ], [ %and.i.283, %if.end.47 ]
  %shl.i = shl i32 %zSig1.0, 31
  %shl3.i = shl i32 %zSig0.0, 31
  %shr.i = lshr i32 %zSig1.0, 1
  %or.i = or i32 %shr.i, %shl3.i
  %shr4.i = lshr i32 %zSig0.0, 1
  %cmp20.i = icmp ne i32 %zSig2.1, 0
  %conv21.i = zext i1 %cmp20.i to i32
  %or22.i = or i32 %conv21.i, %shl.i
  br label %roundAndPack

roundAndPack:                                     ; preds = %if.end.50, %shiftRight1
  %zSig0.1 = phi i32 [ %add2.i, %if.end.50 ], [ %shr4.i, %shiftRight1 ]
  %zSig1.1 = phi i32 [ %add.i, %if.end.50 ], [ %or.i, %shiftRight1 ]
  %zSig2.2 = phi i32 [ %zSig2.0, %if.end.50 ], [ %or22.i, %shiftRight1 ]
  %zExp.2 = phi i32 [ %dec52, %if.end.50 ], [ %zExp.1, %shiftRight1 ]
  %call57 = tail call fastcc i64 @roundAndPackFloat64(i32 %zSign, i32 %zExp.2, i32 %zSig0.1, i32 %zSig1.1, i32 %zSig2.2) #5
  br label %cleanup

cleanup:                                          ; preds = %if.then.35, %if.then.7, %roundAndPack, %if.then.45, %propagateFloat64NaN.exit, %if.end.24, %propagateFloat64NaN.exit182, %propagateFloat64NaN.exit273
  %retval.sroa.0.0 = phi i64 [ %retval.sroa.0.0.insert.insert.i.272, %propagateFloat64NaN.exit273 ], [ %call57, %roundAndPack ], [ %retval.sroa.0.0.insert.insert.i.181, %propagateFloat64NaN.exit182 ], [ %retval.sroa.2.0.insert.shift.i.126, %if.end.24 ], [ %retval.sroa.0.0.insert.insert.i.111, %propagateFloat64NaN.exit ], [ %retval.sroa.0.0.insert.insert.i, %if.then.45 ], [ %a.coerce, %if.then.7 ], [ %a.coerce, %if.then.35 ]
  ret i64 %retval.sroa.0.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define internal fastcc i64 @subFloat64Sigs(i64 %a.coerce, i64 %b.coerce, i32 %zSign) #2 {
entry:
  %a.sroa.0.0.extract.trunc.i = trunc i64 %a.coerce to i32
  %a.sroa.1.0.extract.shift.i = lshr i64 %a.coerce, 32
  %a.sroa.1.0.extract.trunc.i = trunc i64 %a.sroa.1.0.extract.shift.i to i32
  %a.sroa.1.0.extract.shift.i.309 = lshr i64 %a.coerce, 52
  %shr.i.310 = trunc i64 %a.sroa.1.0.extract.shift.i.309 to i32
  %and.i.311 = and i32 %shr.i.310, 2047
  %a.sroa.0.0.extract.trunc.i.308 = trunc i64 %b.coerce to i32
  %a.sroa.1.0.extract.shift.i.305 = lshr i64 %b.coerce, 32
  %a.sroa.1.0.extract.trunc.i.306 = trunc i64 %a.sroa.1.0.extract.shift.i.305 to i32
  %a.sroa.1.0.extract.shift.i.302 = lshr i64 %b.coerce, 52
  %shr.i.303 = trunc i64 %a.sroa.1.0.extract.shift.i.302 to i32
  %and.i.304 = and i32 %shr.i.303, 2047
  %sub = sub nsw i32 %and.i.311, %and.i.304
  %shl.i.298 = shl i32 %a.sroa.0.0.extract.trunc.i, 10
  %and.i352 = shl nuw nsw i64 %a.sroa.1.0.extract.shift.i, 10
  %and.i = trunc i64 %and.i352 to i32
  %shl1.i.299 = and i32 %and.i, 1073740800
  %shr.i.300 = lshr i32 %a.sroa.0.0.extract.trunc.i, 22
  %or.i.301 = or i32 %shl1.i.299, %shr.i.300
  %shl.i.295 = shl i32 %a.sroa.0.0.extract.trunc.i.308, 10
  %and.i.307354 = shl nuw nsw i64 %a.sroa.1.0.extract.shift.i.305, 10
  %and.i.307 = trunc i64 %and.i.307354 to i32
  %shl1.i = and i32 %and.i.307, 1073740800
  %shr.i.296 = lshr i32 %a.sroa.0.0.extract.trunc.i.308, 22
  %or.i.297 = or i32 %shl1.i, %shr.i.296
  %cmp = icmp sgt i32 %sub, 0
  br i1 %cmp, label %aExpBigger, label %if.end

if.end:                                           ; preds = %entry
  %cmp6 = icmp slt i32 %sub, 0
  br i1 %cmp6, label %bExpBigger, label %if.end.8

if.end.8:                                         ; preds = %if.end
  switch i32 %and.i.311, label %if.end.19 [
    i32 2047, label %if.then.10
    i32 0, label %if.then.18
  ]

if.then.10:                                       ; preds = %if.end.8
  %or = or i32 %shl.i.295, %shl.i.298
  %or11 = or i32 %or, %or.i.301
  %or12 = or i32 %or11, %or.i.297
  %tobool = icmp eq i32 %or12, 0
  br i1 %tobool, label %if.end.15, label %if.then.13

if.then.13:                                       ; preds = %if.then.10
  %and.i.57.i.243 = and i64 %a.coerce, 9221120237041090560
  %cmp.i.58.i.244 = icmp eq i64 %and.i.57.i.243, 9218868437227405312
  br i1 %cmp.i.58.i.244, label %land.rhs.i.61.i.247, label %float64_is_signaling_nan.exit66.i.254

land.rhs.i.61.i.247:                              ; preds = %if.then.13
  %tobool.i.60.i.246 = icmp eq i32 %a.sroa.0.0.extract.trunc.i, 0
  br i1 %tobool.i.60.i.246, label %lor.rhs.i.64.i.250, label %float64_is_signaling_nan.exit66.i.254

lor.rhs.i.64.i.250:                               ; preds = %land.rhs.i.61.i.247
  %and2.i.62.i.248 = and i64 %a.coerce, 2251795518717952
  %tobool3.i.63.i.249 = icmp ne i64 %and2.i.62.i.248, 0
  br label %float64_is_signaling_nan.exit66.i.254

float64_is_signaling_nan.exit66.i.254:            ; preds = %lor.rhs.i.64.i.250, %land.rhs.i.61.i.247, %if.then.13
  %0 = phi i1 [ false, %if.then.13 ], [ true, %land.rhs.i.61.i.247 ], [ %tobool3.i.63.i.249, %lor.rhs.i.64.i.250 ]
  %shl4.i.i.251 = shl nuw nsw i64 %a.sroa.1.0.extract.shift.i.305, 1
  %shl.i.i.252 = trunc i64 %shl4.i.i.251 to i32
  %cmp.i.50.i.253 = icmp ugt i32 %shl.i.i.252, -2097153
  br i1 %cmp.i.50.i.253, label %land.rhs.i.53.i.257, label %float64_is_nan.exit.i.263

land.rhs.i.53.i.257:                              ; preds = %float64_is_signaling_nan.exit66.i.254
  %tobool.i.52.i.256 = icmp eq i32 %a.sroa.0.0.extract.trunc.i.308, 0
  br i1 %tobool.i.52.i.256, label %lor.rhs.i.55.i.260, label %float64_is_nan.exit.i.263

lor.rhs.i.55.i.260:                               ; preds = %land.rhs.i.53.i.257
  %and.i.54.i.258 = and i64 %a.sroa.1.0.extract.shift.i.305, 1048575
  %tobool2.i.i.259 = icmp ne i64 %and.i.54.i.258, 0
  br label %float64_is_nan.exit.i.263

float64_is_nan.exit.i.263:                        ; preds = %lor.rhs.i.55.i.260, %land.rhs.i.53.i.257, %float64_is_signaling_nan.exit66.i.254
  %1 = phi i1 [ false, %float64_is_signaling_nan.exit66.i.254 ], [ true, %land.rhs.i.53.i.257 ], [ %tobool2.i.i.259, %lor.rhs.i.55.i.260 ]
  %and.i.i.261 = and i64 %b.coerce, 9221120237041090560
  %cmp.i.i.262 = icmp eq i64 %and.i.i.261, 9218868437227405312
  br i1 %cmp.i.i.262, label %land.rhs.i.i.266, label %float64_is_signaling_nan.exit.i.276

land.rhs.i.i.266:                                 ; preds = %float64_is_nan.exit.i.263
  %tobool.i.i.265 = icmp eq i32 %a.sroa.0.0.extract.trunc.i.308, 0
  br i1 %tobool.i.i.265, label %lor.rhs.i.i.272, label %float64_is_signaling_nan.exit.thread.i.269

float64_is_signaling_nan.exit.thread.i.269:       ; preds = %land.rhs.i.i.266
  %or.68.i.267 = or i32 %a.sroa.1.0.extract.trunc.i, 524288
  %or5.69.i.268 = or i32 %a.sroa.1.0.extract.trunc.i.306, 524288
  br label %if.then.i.280

lor.rhs.i.i.272:                                  ; preds = %land.rhs.i.i.266
  %and2.i.i.270 = and i64 %b.coerce, 2251795518717952
  %tobool3.i.i.271 = icmp ne i64 %and2.i.i.270, 0
  br label %float64_is_signaling_nan.exit.i.276

float64_is_signaling_nan.exit.i.276:              ; preds = %lor.rhs.i.i.272, %float64_is_nan.exit.i.263
  %2 = phi i1 [ false, %float64_is_nan.exit.i.263 ], [ %tobool3.i.i.271, %lor.rhs.i.i.272 ]
  %or.i.273 = or i32 %a.sroa.1.0.extract.trunc.i, 524288
  %or5.i.274 = or i32 %a.sroa.1.0.extract.trunc.i.306, 524288
  %or667.i.275 = or i1 %0, %2
  br i1 %or667.i.275, label %if.then.i.280, label %propagateFloat64NaN.exit294

if.then.i.280:                                    ; preds = %float64_is_signaling_nan.exit.i.276, %float64_is_signaling_nan.exit.thread.i.269
  %or574.i.277 = phi i32 [ %or5.69.i.268, %float64_is_signaling_nan.exit.thread.i.269 ], [ %or5.i.274, %float64_is_signaling_nan.exit.i.276 ]
  %or72.i.278 = phi i32 [ %or.68.i.267, %float64_is_signaling_nan.exit.thread.i.269 ], [ %or.i.273, %float64_is_signaling_nan.exit.i.276 ]
  %3 = phi i1 [ true, %float64_is_signaling_nan.exit.thread.i.269 ], [ %2, %float64_is_signaling_nan.exit.i.276 ]
  %4 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.279 = or i32 %4, 16
  store i32 %or.i.i.279, i32* @float_exception_flags, align 4, !tbaa !1
  br label %propagateFloat64NaN.exit294

propagateFloat64NaN.exit294:                      ; preds = %float64_is_signaling_nan.exit.i.276, %if.then.i.280
  %or66775.i.281 = phi i1 [ false, %float64_is_signaling_nan.exit.i.276 ], [ true, %if.then.i.280 ]
  %or573.i.282 = phi i32 [ %or5.i.274, %float64_is_signaling_nan.exit.i.276 ], [ %or574.i.277, %if.then.i.280 ]
  %or71.i.283 = phi i32 [ %or.i.273, %float64_is_signaling_nan.exit.i.276 ], [ %or72.i.278, %if.then.i.280 ]
  %5 = phi i1 [ false, %float64_is_signaling_nan.exit.i.276 ], [ %3, %if.then.i.280 ]
  %b.coerce.mux.i.284 = select i1 %5, i64 %b.coerce, i64 %a.coerce
  %or5.mux.i.285 = select i1 %5, i32 %or573.i.282, i32 %or71.i.283
  %a.coerce.b.coerce.i.286 = select i1 %1, i64 %b.coerce, i64 %a.coerce
  %or.or5.i.287 = select i1 %1, i32 %or573.i.282, i32 %or71.i.283
  %retval.sroa.0.0.i.288 = select i1 %or66775.i.281, i64 %b.coerce.mux.i.284, i64 %a.coerce.b.coerce.i.286
  %retval.sroa.5.0.i.289 = select i1 %or66775.i.281, i32 %or5.mux.i.285, i32 %or.or5.i.287
  %retval.sroa.5.0.insert.ext.i.290 = zext i32 %retval.sroa.5.0.i.289 to i64
  %retval.sroa.5.0.insert.shift.i.291 = shl nuw i64 %retval.sroa.5.0.insert.ext.i.290, 32
  %retval.sroa.0.0.insert.ext.i.292 = and i64 %retval.sroa.0.0.i.288, 4294967295
  %retval.sroa.0.0.insert.insert.i.293 = or i64 %retval.sroa.5.0.insert.shift.i.291, %retval.sroa.0.0.insert.ext.i.292
  br label %cleanup

if.end.15:                                        ; preds = %if.then.10
  %6 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.238 = or i32 %6, 16
  store i32 %or.i.238, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.then.18:                                       ; preds = %if.end.8
  br label %if.end.19

if.end.19:                                        ; preds = %if.end.8, %if.then.18
  %aExp.0 = phi i32 [ 1, %if.then.18 ], [ %and.i.311, %if.end.8 ]
  %bExp.0 = phi i32 [ 1, %if.then.18 ], [ %and.i.304, %if.end.8 ]
  %cmp20 = icmp ult i32 %or.i.297, %or.i.301
  br i1 %cmp20, label %aBigger, label %if.end.22

if.end.22:                                        ; preds = %if.end.19
  %cmp23 = icmp ult i32 %or.i.301, %or.i.297
  br i1 %cmp23, label %bBigger, label %if.end.25

if.end.25:                                        ; preds = %if.end.22
  %cmp26 = icmp ult i32 %shl.i.295, %shl.i.298
  br i1 %cmp26, label %aBigger, label %if.end.28

if.end.28:                                        ; preds = %if.end.25
  %cmp29 = icmp ult i32 %shl.i.298, %shl.i.295
  br i1 %cmp29, label %bBigger, label %if.end.31

if.end.31:                                        ; preds = %if.end.28
  %7 = load i32, i32* @float_rounding_mode, align 4, !tbaa !1
  %cmp32 = icmp eq i32 %7, 3
  %conv = zext i1 %cmp32 to i64
  %shl.i.235 = shl nuw i64 %conv, 63
  br label %cleanup

bExpBigger:                                       ; preds = %if.end
  %cmp34 = icmp eq i32 %and.i.304, 2047
  br i1 %cmp34, label %if.then.36, label %if.end.43

if.then.36:                                       ; preds = %bExpBigger
  %or37 = or i32 %or.i.297, %shl.i.295
  %tobool38 = icmp eq i32 %or37, 0
  br i1 %tobool38, label %if.end.41, label %if.then.39

if.then.39:                                       ; preds = %if.then.36
  %and.i.57.i.183 = and i64 %a.coerce, 9221120237041090560
  %cmp.i.58.i.184 = icmp eq i64 %and.i.57.i.183, 9218868437227405312
  br i1 %cmp.i.58.i.184, label %land.rhs.i.61.i.187, label %float64_is_signaling_nan.exit66.i.194

land.rhs.i.61.i.187:                              ; preds = %if.then.39
  %tobool.i.60.i.186 = icmp eq i32 %a.sroa.0.0.extract.trunc.i, 0
  br i1 %tobool.i.60.i.186, label %lor.rhs.i.64.i.190, label %float64_is_signaling_nan.exit66.i.194

lor.rhs.i.64.i.190:                               ; preds = %land.rhs.i.61.i.187
  %and2.i.62.i.188 = and i64 %a.coerce, 2251795518717952
  %tobool3.i.63.i.189 = icmp ne i64 %and2.i.62.i.188, 0
  br label %float64_is_signaling_nan.exit66.i.194

float64_is_signaling_nan.exit66.i.194:            ; preds = %lor.rhs.i.64.i.190, %land.rhs.i.61.i.187, %if.then.39
  %8 = phi i1 [ false, %if.then.39 ], [ true, %land.rhs.i.61.i.187 ], [ %tobool3.i.63.i.189, %lor.rhs.i.64.i.190 ]
  %shl4.i.i.191 = shl nuw nsw i64 %a.sroa.1.0.extract.shift.i.305, 1
  %shl.i.i.192 = trunc i64 %shl4.i.i.191 to i32
  %cmp.i.50.i.193 = icmp ugt i32 %shl.i.i.192, -2097153
  br i1 %cmp.i.50.i.193, label %land.rhs.i.53.i.197, label %float64_is_nan.exit.i.203

land.rhs.i.53.i.197:                              ; preds = %float64_is_signaling_nan.exit66.i.194
  %tobool.i.52.i.196 = icmp eq i32 %a.sroa.0.0.extract.trunc.i.308, 0
  br i1 %tobool.i.52.i.196, label %lor.rhs.i.55.i.200, label %float64_is_nan.exit.i.203

lor.rhs.i.55.i.200:                               ; preds = %land.rhs.i.53.i.197
  %and.i.54.i.198 = and i64 %a.sroa.1.0.extract.shift.i.305, 1048575
  %tobool2.i.i.199 = icmp ne i64 %and.i.54.i.198, 0
  br label %float64_is_nan.exit.i.203

float64_is_nan.exit.i.203:                        ; preds = %lor.rhs.i.55.i.200, %land.rhs.i.53.i.197, %float64_is_signaling_nan.exit66.i.194
  %9 = phi i1 [ false, %float64_is_signaling_nan.exit66.i.194 ], [ true, %land.rhs.i.53.i.197 ], [ %tobool2.i.i.199, %lor.rhs.i.55.i.200 ]
  %and.i.i.201 = and i64 %b.coerce, 9221120237041090560
  %cmp.i.i.202 = icmp eq i64 %and.i.i.201, 9218868437227405312
  br i1 %cmp.i.i.202, label %land.rhs.i.i.206, label %float64_is_signaling_nan.exit.i.216

land.rhs.i.i.206:                                 ; preds = %float64_is_nan.exit.i.203
  %tobool.i.i.205 = icmp eq i32 %a.sroa.0.0.extract.trunc.i.308, 0
  br i1 %tobool.i.i.205, label %lor.rhs.i.i.212, label %float64_is_signaling_nan.exit.thread.i.209

float64_is_signaling_nan.exit.thread.i.209:       ; preds = %land.rhs.i.i.206
  %or.68.i.207 = or i32 %a.sroa.1.0.extract.trunc.i, 524288
  %or5.69.i.208 = or i32 %a.sroa.1.0.extract.trunc.i.306, 524288
  br label %if.then.i.220

lor.rhs.i.i.212:                                  ; preds = %land.rhs.i.i.206
  %and2.i.i.210 = and i64 %b.coerce, 2251795518717952
  %tobool3.i.i.211 = icmp ne i64 %and2.i.i.210, 0
  br label %float64_is_signaling_nan.exit.i.216

float64_is_signaling_nan.exit.i.216:              ; preds = %lor.rhs.i.i.212, %float64_is_nan.exit.i.203
  %10 = phi i1 [ false, %float64_is_nan.exit.i.203 ], [ %tobool3.i.i.211, %lor.rhs.i.i.212 ]
  %or.i.213 = or i32 %a.sroa.1.0.extract.trunc.i, 524288
  %or5.i.214 = or i32 %a.sroa.1.0.extract.trunc.i.306, 524288
  %or667.i.215 = or i1 %8, %10
  br i1 %or667.i.215, label %if.then.i.220, label %propagateFloat64NaN.exit234

if.then.i.220:                                    ; preds = %float64_is_signaling_nan.exit.i.216, %float64_is_signaling_nan.exit.thread.i.209
  %or574.i.217 = phi i32 [ %or5.69.i.208, %float64_is_signaling_nan.exit.thread.i.209 ], [ %or5.i.214, %float64_is_signaling_nan.exit.i.216 ]
  %or72.i.218 = phi i32 [ %or.68.i.207, %float64_is_signaling_nan.exit.thread.i.209 ], [ %or.i.213, %float64_is_signaling_nan.exit.i.216 ]
  %11 = phi i1 [ true, %float64_is_signaling_nan.exit.thread.i.209 ], [ %10, %float64_is_signaling_nan.exit.i.216 ]
  %12 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.219 = or i32 %12, 16
  store i32 %or.i.i.219, i32* @float_exception_flags, align 4, !tbaa !1
  br label %propagateFloat64NaN.exit234

propagateFloat64NaN.exit234:                      ; preds = %float64_is_signaling_nan.exit.i.216, %if.then.i.220
  %or66775.i.221 = phi i1 [ false, %float64_is_signaling_nan.exit.i.216 ], [ true, %if.then.i.220 ]
  %or573.i.222 = phi i32 [ %or5.i.214, %float64_is_signaling_nan.exit.i.216 ], [ %or574.i.217, %if.then.i.220 ]
  %or71.i.223 = phi i32 [ %or.i.213, %float64_is_signaling_nan.exit.i.216 ], [ %or72.i.218, %if.then.i.220 ]
  %13 = phi i1 [ false, %float64_is_signaling_nan.exit.i.216 ], [ %11, %if.then.i.220 ]
  %b.coerce.mux.i.224 = select i1 %13, i64 %b.coerce, i64 %a.coerce
  %or5.mux.i.225 = select i1 %13, i32 %or573.i.222, i32 %or71.i.223
  %a.coerce.b.coerce.i.226 = select i1 %9, i64 %b.coerce, i64 %a.coerce
  %or.or5.i.227 = select i1 %9, i32 %or573.i.222, i32 %or71.i.223
  %retval.sroa.0.0.i.228 = select i1 %or66775.i.221, i64 %b.coerce.mux.i.224, i64 %a.coerce.b.coerce.i.226
  %retval.sroa.5.0.i.229 = select i1 %or66775.i.221, i32 %or5.mux.i.225, i32 %or.or5.i.227
  %retval.sroa.5.0.insert.ext.i.230 = zext i32 %retval.sroa.5.0.i.229 to i64
  %retval.sroa.5.0.insert.shift.i.231 = shl nuw i64 %retval.sroa.5.0.insert.ext.i.230, 32
  %retval.sroa.0.0.insert.ext.i.232 = and i64 %retval.sroa.0.0.i.228, 4294967295
  %retval.sroa.0.0.insert.insert.i.233 = or i64 %retval.sroa.5.0.insert.shift.i.231, %retval.sroa.0.0.insert.ext.i.232
  br label %cleanup

if.end.41:                                        ; preds = %if.then.36
  %xor = shl i32 %zSign, 31
  %add.i = add i32 %xor, -1048576
  %retval.sroa.2.0.insert.ext.i = zext i32 %add.i to i64
  %retval.sroa.2.0.insert.shift.i = shl nuw i64 %retval.sroa.2.0.insert.ext.i, 32
  br label %cleanup

if.end.43:                                        ; preds = %bExpBigger
  %cmp44 = icmp eq i32 %and.i.311, 0
  %or47 = or i32 %or.i.301, 1073741824
  %aSig0.0 = select i1 %cmp44, i32 %or.i.301, i32 %or47
  %inc = zext i1 %cmp44 to i32
  %expDiff.0 = add nsw i32 %sub, %inc
  %sub49 = sub nsw i32 0, %expDiff.0
  %and.i.142 = and i32 %expDiff.0, 31
  %cmp.i.143 = icmp eq i32 %expDiff.0, 0
  br i1 %cmp.i.143, label %shift64RightJamming.exit177, label %if.else.i.145

if.else.i.145:                                    ; preds = %if.end.43
  %cmp1.i.144 = icmp sgt i32 %expDiff.0, -32
  br i1 %cmp1.i.144, label %if.then.2.i.154, label %if.else.7.i.156

if.then.2.i.154:                                  ; preds = %if.else.i.145
  %shl.i.146 = shl i32 %aSig0.0, %and.i.142
  %shr.i.147 = lshr i32 %shl.i.298, %sub49
  %or.i.148 = or i32 %shl.i.146, %shr.i.147
  %shl3.i.149 = shl i32 %shl.i.298, %and.i.142
  %cmp4.i.150 = icmp ne i32 %shl3.i.149, 0
  %conv.i.151 = zext i1 %cmp4.i.150 to i32
  %or5.i.152 = or i32 %or.i.148, %conv.i.151
  %shr6.i.153 = lshr i32 %aSig0.0, %sub49
  br label %shift64RightJamming.exit177

if.else.7.i.156:                                  ; preds = %if.else.i.145
  %cmp8.i.155 = icmp eq i32 %sub49, 32
  br i1 %cmp8.i.155, label %if.then.10.i.160, label %if.else.14.i.162

if.then.10.i.160:                                 ; preds = %if.else.7.i.156
  %cmp11.i.157 = icmp ne i32 %shl.i.298, 0
  %conv12.i.158 = zext i1 %cmp11.i.157 to i32
  %or13.i.159 = or i32 %aSig0.0, %conv12.i.158
  br label %shift64RightJamming.exit177

if.else.14.i.162:                                 ; preds = %if.else.7.i.156
  %cmp15.i.161 = icmp sgt i32 %expDiff.0, -64
  br i1 %cmp15.i.161, label %if.then.17.i.170, label %if.else.25.i.174

if.then.17.i.170:                                 ; preds = %if.else.14.i.162
  %and18.i.163 = and i32 %sub49, 31
  %shr19.i.164 = lshr i32 %aSig0.0, %and18.i.163
  %shl20.i.165 = shl i32 %aSig0.0, %and.i.142
  %or21.i.166 = or i32 %shl20.i.165, %shl.i.298
  %cmp22.i.167 = icmp ne i32 %or21.i.166, 0
  %conv23.i.168 = zext i1 %cmp22.i.167 to i32
  %or24.i.169 = or i32 %conv23.i.168, %shr19.i.164
  br label %shift64RightJamming.exit177

if.else.25.i.174:                                 ; preds = %if.else.14.i.162
  %or26.i.171 = or i32 %aSig0.0, %shl.i.298
  %cmp27.i.172 = icmp ne i32 %or26.i.171, 0
  %conv28.i.173 = zext i1 %cmp27.i.172 to i32
  br label %shift64RightJamming.exit177

shift64RightJamming.exit177:                      ; preds = %if.end.43, %if.then.2.i.154, %if.then.10.i.160, %if.then.17.i.170, %if.else.25.i.174
  %z1.1.i.175 = phi i32 [ %or5.i.152, %if.then.2.i.154 ], [ %shl.i.298, %if.end.43 ], [ %or13.i.159, %if.then.10.i.160 ], [ %or24.i.169, %if.then.17.i.170 ], [ %conv28.i.173, %if.else.25.i.174 ]
  %z0.0.i.176 = phi i32 [ %shr6.i.153, %if.then.2.i.154 ], [ %aSig0.0, %if.end.43 ], [ 0, %if.then.10.i.160 ], [ 0, %if.then.17.i.170 ], [ 0, %if.else.25.i.174 ]
  %or50 = or i32 %or.i.297, 1073741824
  br label %bBigger

bBigger:                                          ; preds = %if.end.28, %if.end.22, %shift64RightJamming.exit177
  %aSig0.1 = phi i32 [ %z0.0.i.176, %shift64RightJamming.exit177 ], [ %or.i.301, %if.end.22 ], [ %or.i.301, %if.end.28 ]
  %aSig1.0 = phi i32 [ %z1.1.i.175, %shift64RightJamming.exit177 ], [ %shl.i.298, %if.end.22 ], [ %shl.i.298, %if.end.28 ]
  %bSig0.0 = phi i32 [ %or50, %shift64RightJamming.exit177 ], [ %or.i.297, %if.end.22 ], [ %or.i.297, %if.end.28 ]
  %bExp.1 = phi i32 [ %and.i.304, %shift64RightJamming.exit177 ], [ %bExp.0, %if.end.22 ], [ %bExp.0, %if.end.28 ]
  %sub.i.137 = sub i32 %shl.i.295, %aSig1.0
  %sub1.i.138 = sub i32 %bSig0.0, %aSig0.1
  %cmp.i.139 = icmp ult i32 %shl.i.295, %aSig1.0
  %conv.neg.i.140 = sext i1 %cmp.i.139 to i32
  %sub2.i.141 = add i32 %sub1.i.138, %conv.neg.i.140
  %xor51 = xor i32 %zSign, 1
  br label %normalizeRoundAndPack

aExpBigger:                                       ; preds = %entry
  %cmp52 = icmp eq i32 %and.i.311, 2047
  br i1 %cmp52, label %if.then.54, label %if.end.60

if.then.54:                                       ; preds = %aExpBigger
  %or55 = or i32 %or.i.301, %shl.i.298
  %tobool56 = icmp eq i32 %or55, 0
  br i1 %tobool56, label %if.end.59, label %if.then.57

if.then.57:                                       ; preds = %if.then.54
  %and.i.57.i = and i64 %a.coerce, 9221120237041090560
  %cmp.i.58.i = icmp eq i64 %and.i.57.i, 9218868437227405312
  br i1 %cmp.i.58.i, label %land.rhs.i.61.i, label %float64_is_signaling_nan.exit66.i

land.rhs.i.61.i:                                  ; preds = %if.then.57
  %tobool.i.60.i = icmp eq i32 %a.sroa.0.0.extract.trunc.i, 0
  br i1 %tobool.i.60.i, label %lor.rhs.i.64.i, label %float64_is_signaling_nan.exit66.i

lor.rhs.i.64.i:                                   ; preds = %land.rhs.i.61.i
  %and2.i.62.i = and i64 %a.coerce, 2251795518717952
  %tobool3.i.63.i = icmp ne i64 %and2.i.62.i, 0
  br label %float64_is_signaling_nan.exit66.i

float64_is_signaling_nan.exit66.i:                ; preds = %lor.rhs.i.64.i, %land.rhs.i.61.i, %if.then.57
  %14 = phi i1 [ false, %if.then.57 ], [ true, %land.rhs.i.61.i ], [ %tobool3.i.63.i, %lor.rhs.i.64.i ]
  %shl4.i.i = shl nuw nsw i64 %a.sroa.1.0.extract.shift.i.305, 1
  %shl.i.i = trunc i64 %shl4.i.i to i32
  %cmp.i.50.i = icmp ugt i32 %shl.i.i, -2097153
  br i1 %cmp.i.50.i, label %land.rhs.i.53.i, label %float64_is_nan.exit.i

land.rhs.i.53.i:                                  ; preds = %float64_is_signaling_nan.exit66.i
  %tobool.i.52.i = icmp eq i32 %a.sroa.0.0.extract.trunc.i.308, 0
  br i1 %tobool.i.52.i, label %lor.rhs.i.55.i, label %float64_is_nan.exit.i

lor.rhs.i.55.i:                                   ; preds = %land.rhs.i.53.i
  %and.i.54.i = and i64 %a.sroa.1.0.extract.shift.i.305, 1048575
  %tobool2.i.i = icmp ne i64 %and.i.54.i, 0
  br label %float64_is_nan.exit.i

float64_is_nan.exit.i:                            ; preds = %lor.rhs.i.55.i, %land.rhs.i.53.i, %float64_is_signaling_nan.exit66.i
  %15 = phi i1 [ false, %float64_is_signaling_nan.exit66.i ], [ true, %land.rhs.i.53.i ], [ %tobool2.i.i, %lor.rhs.i.55.i ]
  %and.i.i = and i64 %b.coerce, 9221120237041090560
  %cmp.i.i = icmp eq i64 %and.i.i, 9218868437227405312
  br i1 %cmp.i.i, label %land.rhs.i.i, label %float64_is_signaling_nan.exit.i

land.rhs.i.i:                                     ; preds = %float64_is_nan.exit.i
  %tobool.i.i = icmp eq i32 %a.sroa.0.0.extract.trunc.i.308, 0
  br i1 %tobool.i.i, label %lor.rhs.i.i, label %float64_is_signaling_nan.exit.thread.i

float64_is_signaling_nan.exit.thread.i:           ; preds = %land.rhs.i.i
  %or.68.i = or i32 %a.sroa.1.0.extract.trunc.i, 524288
  %or5.69.i = or i32 %a.sroa.1.0.extract.trunc.i.306, 524288
  br label %if.then.i

lor.rhs.i.i:                                      ; preds = %land.rhs.i.i
  %and2.i.i = and i64 %b.coerce, 2251795518717952
  %tobool3.i.i = icmp ne i64 %and2.i.i, 0
  br label %float64_is_signaling_nan.exit.i

float64_is_signaling_nan.exit.i:                  ; preds = %lor.rhs.i.i, %float64_is_nan.exit.i
  %16 = phi i1 [ false, %float64_is_nan.exit.i ], [ %tobool3.i.i, %lor.rhs.i.i ]
  %or.i.135 = or i32 %a.sroa.1.0.extract.trunc.i, 524288
  %or5.i.136 = or i32 %a.sroa.1.0.extract.trunc.i.306, 524288
  %or667.i = or i1 %14, %16
  br i1 %or667.i, label %if.then.i, label %propagateFloat64NaN.exit

if.then.i:                                        ; preds = %float64_is_signaling_nan.exit.i, %float64_is_signaling_nan.exit.thread.i
  %or574.i = phi i32 [ %or5.69.i, %float64_is_signaling_nan.exit.thread.i ], [ %or5.i.136, %float64_is_signaling_nan.exit.i ]
  %or72.i = phi i32 [ %or.68.i, %float64_is_signaling_nan.exit.thread.i ], [ %or.i.135, %float64_is_signaling_nan.exit.i ]
  %17 = phi i1 [ true, %float64_is_signaling_nan.exit.thread.i ], [ %16, %float64_is_signaling_nan.exit.i ]
  %18 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i = or i32 %18, 16
  store i32 %or.i.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %propagateFloat64NaN.exit

propagateFloat64NaN.exit:                         ; preds = %float64_is_signaling_nan.exit.i, %if.then.i
  %or66775.i = phi i1 [ false, %float64_is_signaling_nan.exit.i ], [ true, %if.then.i ]
  %or573.i = phi i32 [ %or5.i.136, %float64_is_signaling_nan.exit.i ], [ %or574.i, %if.then.i ]
  %or71.i = phi i32 [ %or.i.135, %float64_is_signaling_nan.exit.i ], [ %or72.i, %if.then.i ]
  %19 = phi i1 [ false, %float64_is_signaling_nan.exit.i ], [ %17, %if.then.i ]
  %b.coerce.mux.i = select i1 %19, i64 %b.coerce, i64 %a.coerce
  %or5.mux.i = select i1 %19, i32 %or573.i, i32 %or71.i
  %a.coerce.b.coerce.i = select i1 %15, i64 %b.coerce, i64 %a.coerce
  %or.or5.i = select i1 %15, i32 %or573.i, i32 %or71.i
  %retval.sroa.0.0.i = select i1 %or66775.i, i64 %b.coerce.mux.i, i64 %a.coerce.b.coerce.i
  %retval.sroa.5.0.i = select i1 %or66775.i, i32 %or5.mux.i, i32 %or.or5.i
  %retval.sroa.5.0.insert.ext.i = zext i32 %retval.sroa.5.0.i to i64
  %retval.sroa.5.0.insert.shift.i = shl nuw i64 %retval.sroa.5.0.insert.ext.i, 32
  %retval.sroa.0.0.insert.ext.i = and i64 %retval.sroa.0.0.i, 4294967295
  %retval.sroa.0.0.insert.insert.i = or i64 %retval.sroa.5.0.insert.shift.i, %retval.sroa.0.0.insert.ext.i
  br label %cleanup

if.end.59:                                        ; preds = %if.then.54
  %retval.sroa.9.0.extract.shift130 = and i64 %a.coerce, -4294967296
  br label %cleanup

if.end.60:                                        ; preds = %aExpBigger
  %cmp61 = icmp eq i32 %and.i.304, 0
  br i1 %cmp61, label %if.end.66, label %if.end.66.thread

if.end.66.thread:                                 ; preds = %if.end.60
  %or65 = or i32 %or.i.297, 1073741824
  br label %if.else.i

if.end.66:                                        ; preds = %if.end.60
  %dec = add nsw i32 %sub, -1
  %cmp.i.134 = icmp eq i32 %dec, 0
  br i1 %cmp.i.134, label %shift64RightJamming.exit, label %if.else.i

if.else.i:                                        ; preds = %if.end.66.thread, %if.end.66
  %.pn = phi i32 [ 0, %if.end.66.thread ], [ 1, %if.end.66 ]
  %expDiff.1350 = phi i32 [ %sub, %if.end.66.thread ], [ %dec, %if.end.66 ]
  %bSig0.1349 = phi i32 [ %or65, %if.end.66.thread ], [ %or.i.297, %if.end.66 ]
  %and.i.133351.in = sub nsw i32 %.pn, %sub
  %and.i.133351 = and i32 %and.i.133351.in, 31
  %cmp1.i = icmp slt i32 %expDiff.1350, 32
  br i1 %cmp1.i, label %if.then.2.i, label %if.else.7.i

if.then.2.i:                                      ; preds = %if.else.i
  %shl.i = shl i32 %bSig0.1349, %and.i.133351
  %shr.i = lshr i32 %shl.i.295, %expDiff.1350
  %or.i = or i32 %shl.i, %shr.i
  %shl3.i = shl i32 %shl.i.295, %and.i.133351
  %cmp4.i = icmp ne i32 %shl3.i, 0
  %conv.i = zext i1 %cmp4.i to i32
  %or5.i = or i32 %or.i, %conv.i
  %shr6.i = lshr i32 %bSig0.1349, %expDiff.1350
  br label %shift64RightJamming.exit

if.else.7.i:                                      ; preds = %if.else.i
  %cmp8.i = icmp eq i32 %expDiff.1350, 32
  br i1 %cmp8.i, label %if.then.10.i, label %if.else.14.i

if.then.10.i:                                     ; preds = %if.else.7.i
  %cmp11.i = icmp ne i32 %shl.i.295, 0
  %conv12.i = zext i1 %cmp11.i to i32
  %or13.i = or i32 %bSig0.1349, %conv12.i
  br label %shift64RightJamming.exit

if.else.14.i:                                     ; preds = %if.else.7.i
  %cmp15.i = icmp slt i32 %expDiff.1350, 64
  br i1 %cmp15.i, label %if.then.17.i, label %if.else.25.i

if.then.17.i:                                     ; preds = %if.else.14.i
  %and18.i = and i32 %expDiff.1350, 31
  %shr19.i = lshr i32 %bSig0.1349, %and18.i
  %shl20.i = shl i32 %bSig0.1349, %and.i.133351
  %or21.i = or i32 %shl20.i, %shl.i.295
  %cmp22.i = icmp ne i32 %or21.i, 0
  %conv23.i = zext i1 %cmp22.i to i32
  %or24.i = or i32 %conv23.i, %shr19.i
  br label %shift64RightJamming.exit

if.else.25.i:                                     ; preds = %if.else.14.i
  %or26.i = or i32 %bSig0.1349, %shl.i.295
  %cmp27.i = icmp ne i32 %or26.i, 0
  %conv28.i = zext i1 %cmp27.i to i32
  br label %shift64RightJamming.exit

shift64RightJamming.exit:                         ; preds = %if.end.66, %if.then.2.i, %if.then.10.i, %if.then.17.i, %if.else.25.i
  %z1.1.i = phi i32 [ %or5.i, %if.then.2.i ], [ %shl.i.295, %if.end.66 ], [ %or13.i, %if.then.10.i ], [ %or24.i, %if.then.17.i ], [ %conv28.i, %if.else.25.i ]
  %z0.0.i = phi i32 [ %shr6.i, %if.then.2.i ], [ %or.i.297, %if.end.66 ], [ 0, %if.then.10.i ], [ 0, %if.then.17.i ], [ 0, %if.else.25.i ]
  %or67 = or i32 %or.i.301, 1073741824
  br label %aBigger

aBigger:                                          ; preds = %if.end.25, %if.end.19, %shift64RightJamming.exit
  %aSig0.2 = phi i32 [ %or67, %shift64RightJamming.exit ], [ %or.i.301, %if.end.19 ], [ %or.i.301, %if.end.25 ]
  %bSig0.2 = phi i32 [ %z0.0.i, %shift64RightJamming.exit ], [ %or.i.297, %if.end.19 ], [ %or.i.297, %if.end.25 ]
  %bSig1.0 = phi i32 [ %z1.1.i, %shift64RightJamming.exit ], [ %shl.i.295, %if.end.19 ], [ %shl.i.295, %if.end.25 ]
  %aExp.1 = phi i32 [ %and.i.311, %shift64RightJamming.exit ], [ %aExp.0, %if.end.19 ], [ %aExp.0, %if.end.25 ]
  %sub.i = sub i32 %shl.i.298, %bSig1.0
  %sub1.i = sub i32 %aSig0.2, %bSig0.2
  %cmp.i = icmp ult i32 %shl.i.298, %bSig1.0
  %conv.neg.i = sext i1 %cmp.i to i32
  %sub2.i = add i32 %sub1.i, %conv.neg.i
  br label %normalizeRoundAndPack

normalizeRoundAndPack:                            ; preds = %aBigger, %bBigger
  %zSig0.0 = phi i32 [ %sub2.i, %aBigger ], [ %sub2.i.141, %bBigger ]
  %zSig1.0 = phi i32 [ %sub.i, %aBigger ], [ %sub.i.137, %bBigger ]
  %zSign.addr.0 = phi i32 [ %zSign, %aBigger ], [ %xor51, %bBigger ]
  %zExp.0 = phi i32 [ %aExp.1, %aBigger ], [ %bExp.1, %bBigger ]
  %sub69 = add nsw i32 %zExp.0, -11
  %call70 = tail call fastcc i64 @normalizeRoundAndPackFloat64(i32 %zSign.addr.0, i32 %sub69, i32 %zSig0.0, i32 %zSig1.0) #5
  %retval.sroa.9.0.extract.shift128 = and i64 %call70, -4294967296
  br label %cleanup

cleanup:                                          ; preds = %normalizeRoundAndPack, %if.end.59, %propagateFloat64NaN.exit, %if.end.41, %propagateFloat64NaN.exit234, %if.end.31, %if.end.15, %propagateFloat64NaN.exit294
  %retval.sroa.0.0 = phi i64 [ %retval.sroa.0.0.insert.insert.i, %propagateFloat64NaN.exit ], [ %a.coerce, %if.end.59 ], [ %call70, %normalizeRoundAndPack ], [ %retval.sroa.0.0.insert.insert.i.233, %propagateFloat64NaN.exit234 ], [ %retval.sroa.2.0.insert.shift.i, %if.end.41 ], [ %retval.sroa.0.0.insert.insert.i.293, %propagateFloat64NaN.exit294 ], [ 4294967295, %if.end.15 ], [ %shl.i.235, %if.end.31 ]
  %retval.sroa.9.0 = phi i64 [ %retval.sroa.5.0.insert.shift.i, %propagateFloat64NaN.exit ], [ %retval.sroa.9.0.extract.shift130, %if.end.59 ], [ %retval.sroa.9.0.extract.shift128, %normalizeRoundAndPack ], [ %retval.sroa.5.0.insert.shift.i.231, %propagateFloat64NaN.exit234 ], [ %retval.sroa.2.0.insert.shift.i, %if.end.41 ], [ %retval.sroa.5.0.insert.shift.i.291, %propagateFloat64NaN.exit294 ], [ 9223372032559808512, %if.end.15 ], [ %shl.i.235, %if.end.31 ]
  %retval.sroa.0.0.insert.ext = and i64 %retval.sroa.0.0, 4294967295
  %retval.sroa.0.0.insert.insert = or i64 %retval.sroa.9.0, %retval.sroa.0.0.insert.ext
  ret i64 %retval.sroa.0.0.insert.insert
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i64 @float64_sub(i64 %a.coerce, i64 %b.coerce) #2 {
entry:
  %a.sroa.1.0.extract.shift.i = lshr i64 %a.coerce, 63
  %shr.i = trunc i64 %a.sroa.1.0.extract.shift.i to i32
  %a.sroa.1.0.extract.shift.i.10 = lshr i64 %b.coerce, 63
  %shr.i.11 = trunc i64 %a.sroa.1.0.extract.shift.i.10 to i32
  %cmp = icmp eq i32 %shr.i, %shr.i.11
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call2 = tail call fastcc i64 @subFloat64Sigs(i64 %a.coerce, i64 %b.coerce, i32 %shr.i) #5
  br label %cleanup

if.else:                                          ; preds = %entry
  %call3 = tail call fastcc i64 @addFloat64Sigs(i64 %a.coerce, i64 %b.coerce, i32 %shr.i) #5
  br label %cleanup

cleanup:                                          ; preds = %if.else, %if.then
  %retval.sroa.0.0 = phi i64 [ %call2, %if.then ], [ %call3, %if.else ]
  ret i64 %retval.sroa.0.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i64 @float64_mul(i64 %a.coerce, i64 %b.coerce) #2 {
entry:
  %a.sroa.0.0.extract.trunc.i = trunc i64 %a.coerce to i32
  %a.sroa.1.0.extract.shift.i = lshr i64 %a.coerce, 32
  %a.sroa.1.0.extract.trunc.i = trunc i64 %a.sroa.1.0.extract.shift.i to i32
  %and.i = and i32 %a.sroa.1.0.extract.trunc.i, 1048575
  %a.sroa.1.0.extract.shift.i.267 = lshr i64 %a.coerce, 52
  %shr.i.268 = trunc i64 %a.sroa.1.0.extract.shift.i.267 to i32
  %and.i.269 = and i32 %shr.i.268, 2047
  %a.sroa.0.0.extract.trunc.i.264 = trunc i64 %b.coerce to i32
  %a.sroa.1.0.extract.shift.i.261 = lshr i64 %b.coerce, 32
  %a.sroa.1.0.extract.trunc.i.262 = trunc i64 %a.sroa.1.0.extract.shift.i.261 to i32
  %and.i.263 = and i32 %a.sroa.1.0.extract.trunc.i.262, 1048575
  %a.sroa.1.0.extract.shift.i.258 = lshr i64 %b.coerce, 52
  %shr.i.259 = trunc i64 %a.sroa.1.0.extract.shift.i.258 to i32
  %and.i.260 = and i32 %shr.i.259, 2047
  %a.sroa.1.0.extract.shift.i.265310 = xor i64 %b.coerce, %a.coerce
  %xor309 = lshr i64 %a.sroa.1.0.extract.shift.i.265310, 63
  %xor = trunc i64 %xor309 to i32
  %cmp = icmp eq i32 %and.i.269, 2047
  br i1 %cmp, label %if.then, label %if.end.19

if.then:                                          ; preds = %entry
  %or = or i32 %and.i, %a.sroa.0.0.extract.trunc.i
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then.11

lor.lhs.false:                                    ; preds = %if.then
  %cmp8 = icmp ne i32 %and.i.260, 2047
  %or9 = or i32 %and.i.263, %a.sroa.0.0.extract.trunc.i.264
  %tobool10 = icmp eq i32 %or9, 0
  %or.cond = or i1 %cmp8, %tobool10
  br i1 %or.cond, label %if.end, label %if.then.11

if.then.11:                                       ; preds = %lor.lhs.false, %if.then
  %and.i.57.i.203 = and i64 %a.coerce, 9221120237041090560
  %cmp.i.58.i.204 = icmp eq i64 %and.i.57.i.203, 9218868437227405312
  br i1 %cmp.i.58.i.204, label %land.rhs.i.61.i.207, label %float64_is_signaling_nan.exit66.i.214

land.rhs.i.61.i.207:                              ; preds = %if.then.11
  %tobool.i.60.i.206 = icmp eq i32 %a.sroa.0.0.extract.trunc.i, 0
  br i1 %tobool.i.60.i.206, label %lor.rhs.i.64.i.210, label %float64_is_signaling_nan.exit66.i.214

lor.rhs.i.64.i.210:                               ; preds = %land.rhs.i.61.i.207
  %and2.i.62.i.208 = and i64 %a.coerce, 2251795518717952
  %tobool3.i.63.i.209 = icmp ne i64 %and2.i.62.i.208, 0
  br label %float64_is_signaling_nan.exit66.i.214

float64_is_signaling_nan.exit66.i.214:            ; preds = %lor.rhs.i.64.i.210, %land.rhs.i.61.i.207, %if.then.11
  %0 = phi i1 [ false, %if.then.11 ], [ true, %land.rhs.i.61.i.207 ], [ %tobool3.i.63.i.209, %lor.rhs.i.64.i.210 ]
  %shl4.i.i.211 = shl nuw nsw i64 %a.sroa.1.0.extract.shift.i.261, 1
  %shl.i.i.212 = trunc i64 %shl4.i.i.211 to i32
  %cmp.i.50.i.213 = icmp ugt i32 %shl.i.i.212, -2097153
  br i1 %cmp.i.50.i.213, label %land.rhs.i.53.i.217, label %float64_is_nan.exit.i.223

land.rhs.i.53.i.217:                              ; preds = %float64_is_signaling_nan.exit66.i.214
  %tobool.i.52.i.216 = icmp eq i32 %a.sroa.0.0.extract.trunc.i.264, 0
  br i1 %tobool.i.52.i.216, label %lor.rhs.i.55.i.220, label %float64_is_nan.exit.i.223

lor.rhs.i.55.i.220:                               ; preds = %land.rhs.i.53.i.217
  %and.i.54.i.218 = and i64 %a.sroa.1.0.extract.shift.i.261, 1048575
  %tobool2.i.i.219 = icmp ne i64 %and.i.54.i.218, 0
  br label %float64_is_nan.exit.i.223

float64_is_nan.exit.i.223:                        ; preds = %lor.rhs.i.55.i.220, %land.rhs.i.53.i.217, %float64_is_signaling_nan.exit66.i.214
  %1 = phi i1 [ false, %float64_is_signaling_nan.exit66.i.214 ], [ true, %land.rhs.i.53.i.217 ], [ %tobool2.i.i.219, %lor.rhs.i.55.i.220 ]
  %and.i.i.221 = and i64 %b.coerce, 9221120237041090560
  %cmp.i.i.222 = icmp eq i64 %and.i.i.221, 9218868437227405312
  br i1 %cmp.i.i.222, label %land.rhs.i.i.226, label %float64_is_signaling_nan.exit.i.236

land.rhs.i.i.226:                                 ; preds = %float64_is_nan.exit.i.223
  %tobool.i.i.225 = icmp eq i32 %a.sroa.0.0.extract.trunc.i.264, 0
  br i1 %tobool.i.i.225, label %lor.rhs.i.i.232, label %float64_is_signaling_nan.exit.thread.i.229

float64_is_signaling_nan.exit.thread.i.229:       ; preds = %land.rhs.i.i.226
  %or.68.i.227 = or i32 %a.sroa.1.0.extract.trunc.i, 524288
  %or5.69.i.228 = or i32 %a.sroa.1.0.extract.trunc.i.262, 524288
  br label %if.then.i.240

lor.rhs.i.i.232:                                  ; preds = %land.rhs.i.i.226
  %and2.i.i.230 = and i64 %b.coerce, 2251795518717952
  %tobool3.i.i.231 = icmp ne i64 %and2.i.i.230, 0
  br label %float64_is_signaling_nan.exit.i.236

float64_is_signaling_nan.exit.i.236:              ; preds = %lor.rhs.i.i.232, %float64_is_nan.exit.i.223
  %2 = phi i1 [ false, %float64_is_nan.exit.i.223 ], [ %tobool3.i.i.231, %lor.rhs.i.i.232 ]
  %or.i.233 = or i32 %a.sroa.1.0.extract.trunc.i, 524288
  %or5.i.234 = or i32 %a.sroa.1.0.extract.trunc.i.262, 524288
  %or667.i.235 = or i1 %0, %2
  br i1 %or667.i.235, label %if.then.i.240, label %propagateFloat64NaN.exit255

if.then.i.240:                                    ; preds = %float64_is_signaling_nan.exit.i.236, %float64_is_signaling_nan.exit.thread.i.229
  %or574.i.237 = phi i32 [ %or5.69.i.228, %float64_is_signaling_nan.exit.thread.i.229 ], [ %or5.i.234, %float64_is_signaling_nan.exit.i.236 ]
  %or72.i.238 = phi i32 [ %or.68.i.227, %float64_is_signaling_nan.exit.thread.i.229 ], [ %or.i.233, %float64_is_signaling_nan.exit.i.236 ]
  %3 = phi i1 [ true, %float64_is_signaling_nan.exit.thread.i.229 ], [ %2, %float64_is_signaling_nan.exit.i.236 ]
  %4 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.239 = or i32 %4, 16
  store i32 %or.i.i.239, i32* @float_exception_flags, align 4, !tbaa !1
  br label %propagateFloat64NaN.exit255

propagateFloat64NaN.exit255:                      ; preds = %float64_is_signaling_nan.exit.i.236, %if.then.i.240
  %or66775.i.241 = phi i1 [ false, %float64_is_signaling_nan.exit.i.236 ], [ true, %if.then.i.240 ]
  %or573.i.242 = phi i32 [ %or5.i.234, %float64_is_signaling_nan.exit.i.236 ], [ %or574.i.237, %if.then.i.240 ]
  %or71.i.243 = phi i32 [ %or.i.233, %float64_is_signaling_nan.exit.i.236 ], [ %or72.i.238, %if.then.i.240 ]
  %5 = phi i1 [ false, %float64_is_signaling_nan.exit.i.236 ], [ %3, %if.then.i.240 ]
  %b.coerce.mux.i.244 = select i1 %5, i64 %b.coerce, i64 %a.coerce
  %or5.mux.i.245 = select i1 %5, i32 %or573.i.242, i32 %or71.i.243
  %a.coerce.b.coerce.i.246 = select i1 %1, i64 %b.coerce, i64 %a.coerce
  %or.or5.i.247 = select i1 %1, i32 %or573.i.242, i32 %or71.i.243
  %retval.sroa.0.0.i.248 = select i1 %or66775.i.241, i64 %b.coerce.mux.i.244, i64 %a.coerce.b.coerce.i.246
  %retval.sroa.5.0.i.249 = select i1 %or66775.i.241, i32 %or5.mux.i.245, i32 %or.or5.i.247
  %retval.sroa.5.0.insert.ext.i.250 = zext i32 %retval.sroa.5.0.i.249 to i64
  %retval.sroa.5.0.insert.shift.i.251 = shl nuw i64 %retval.sroa.5.0.insert.ext.i.250, 32
  %retval.sroa.0.0.insert.ext.i.252 = and i64 %retval.sroa.0.0.i.248, 4294967295
  %retval.sroa.0.0.insert.insert.i.253 = or i64 %retval.sroa.5.0.insert.shift.i.251, %retval.sroa.0.0.insert.ext.i.252
  br label %cleanup

if.end:                                           ; preds = %lor.lhs.false
  %or14 = or i32 %or9, %and.i.260
  %cmp15 = icmp eq i32 %or14, 0
  br i1 %cmp15, label %invalid, label %if.end.17

if.end.17:                                        ; preds = %if.end
  %shl.i.195321 = shl nuw i64 %xor309, 63
  %add.i.196 = or i64 %shl.i.195321, 9218868437227405312
  br label %cleanup

if.end.19:                                        ; preds = %entry
  %cmp20 = icmp eq i32 %and.i.260, 2047
  br i1 %cmp20, label %if.then.21, label %if.end.33

if.then.21:                                       ; preds = %if.end.19
  %or22 = or i32 %and.i.263, %a.sroa.0.0.extract.trunc.i.264
  %tobool23 = icmp eq i32 %or22, 0
  br i1 %tobool23, label %if.end.26, label %if.then.24

if.then.24:                                       ; preds = %if.then.21
  %and.i.57.i = and i64 %a.coerce, 9221120237041090560
  %cmp.i.58.i = icmp eq i64 %and.i.57.i, 9218868437227405312
  br i1 %cmp.i.58.i, label %land.rhs.i.61.i, label %float64_is_signaling_nan.exit66.i

land.rhs.i.61.i:                                  ; preds = %if.then.24
  %tobool.i.60.i = icmp eq i32 %a.sroa.0.0.extract.trunc.i, 0
  br i1 %tobool.i.60.i, label %lor.rhs.i.64.i, label %float64_is_signaling_nan.exit66.i

lor.rhs.i.64.i:                                   ; preds = %land.rhs.i.61.i
  %and2.i.62.i = and i64 %a.coerce, 2251795518717952
  %tobool3.i.63.i = icmp ne i64 %and2.i.62.i, 0
  br label %float64_is_signaling_nan.exit66.i

float64_is_signaling_nan.exit66.i:                ; preds = %lor.rhs.i.64.i, %land.rhs.i.61.i, %if.then.24
  %6 = phi i1 [ false, %if.then.24 ], [ true, %land.rhs.i.61.i ], [ %tobool3.i.63.i, %lor.rhs.i.64.i ]
  %shl4.i.i.187 = shl nuw nsw i64 %a.sroa.1.0.extract.shift.i.261, 1
  %shl.i.i.188 = trunc i64 %shl4.i.i.187 to i32
  %cmp.i.50.i = icmp ugt i32 %shl.i.i.188, -2097153
  br i1 %cmp.i.50.i, label %land.rhs.i.53.i, label %float64_is_nan.exit.i

land.rhs.i.53.i:                                  ; preds = %float64_is_signaling_nan.exit66.i
  %tobool.i.52.i = icmp eq i32 %a.sroa.0.0.extract.trunc.i.264, 0
  br i1 %tobool.i.52.i, label %lor.rhs.i.55.i, label %float64_is_nan.exit.i

lor.rhs.i.55.i:                                   ; preds = %land.rhs.i.53.i
  %and.i.54.i = and i64 %a.sroa.1.0.extract.shift.i.261, 1048575
  %tobool2.i.i = icmp ne i64 %and.i.54.i, 0
  br label %float64_is_nan.exit.i

float64_is_nan.exit.i:                            ; preds = %lor.rhs.i.55.i, %land.rhs.i.53.i, %float64_is_signaling_nan.exit66.i
  %7 = phi i1 [ false, %float64_is_signaling_nan.exit66.i ], [ true, %land.rhs.i.53.i ], [ %tobool2.i.i, %lor.rhs.i.55.i ]
  %and.i.i.189 = and i64 %b.coerce, 9221120237041090560
  %cmp.i.i.190 = icmp eq i64 %and.i.i.189, 9218868437227405312
  br i1 %cmp.i.i.190, label %land.rhs.i.i, label %float64_is_signaling_nan.exit.i

land.rhs.i.i:                                     ; preds = %float64_is_nan.exit.i
  %tobool.i.i = icmp eq i32 %a.sroa.0.0.extract.trunc.i.264, 0
  br i1 %tobool.i.i, label %lor.rhs.i.i, label %float64_is_signaling_nan.exit.thread.i

float64_is_signaling_nan.exit.thread.i:           ; preds = %land.rhs.i.i
  %or.68.i = or i32 %a.sroa.1.0.extract.trunc.i, 524288
  %or5.69.i = or i32 %a.sroa.1.0.extract.trunc.i.262, 524288
  br label %if.then.i.193

lor.rhs.i.i:                                      ; preds = %land.rhs.i.i
  %and2.i.i = and i64 %b.coerce, 2251795518717952
  %tobool3.i.i = icmp ne i64 %and2.i.i, 0
  br label %float64_is_signaling_nan.exit.i

float64_is_signaling_nan.exit.i:                  ; preds = %lor.rhs.i.i, %float64_is_nan.exit.i
  %8 = phi i1 [ false, %float64_is_nan.exit.i ], [ %tobool3.i.i, %lor.rhs.i.i ]
  %or.i.191 = or i32 %a.sroa.1.0.extract.trunc.i, 524288
  %or5.i = or i32 %a.sroa.1.0.extract.trunc.i.262, 524288
  %or667.i = or i1 %6, %8
  br i1 %or667.i, label %if.then.i.193, label %propagateFloat64NaN.exit

if.then.i.193:                                    ; preds = %float64_is_signaling_nan.exit.i, %float64_is_signaling_nan.exit.thread.i
  %or574.i = phi i32 [ %or5.69.i, %float64_is_signaling_nan.exit.thread.i ], [ %or5.i, %float64_is_signaling_nan.exit.i ]
  %or72.i = phi i32 [ %or.68.i, %float64_is_signaling_nan.exit.thread.i ], [ %or.i.191, %float64_is_signaling_nan.exit.i ]
  %9 = phi i1 [ true, %float64_is_signaling_nan.exit.thread.i ], [ %8, %float64_is_signaling_nan.exit.i ]
  %10 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.192 = or i32 %10, 16
  store i32 %or.i.i.192, i32* @float_exception_flags, align 4, !tbaa !1
  br label %propagateFloat64NaN.exit

propagateFloat64NaN.exit:                         ; preds = %float64_is_signaling_nan.exit.i, %if.then.i.193
  %or66775.i = phi i1 [ false, %float64_is_signaling_nan.exit.i ], [ true, %if.then.i.193 ]
  %or573.i = phi i32 [ %or5.i, %float64_is_signaling_nan.exit.i ], [ %or574.i, %if.then.i.193 ]
  %or71.i = phi i32 [ %or.i.191, %float64_is_signaling_nan.exit.i ], [ %or72.i, %if.then.i.193 ]
  %11 = phi i1 [ false, %float64_is_signaling_nan.exit.i ], [ %9, %if.then.i.193 ]
  %b.coerce.mux.i = select i1 %11, i64 %b.coerce, i64 %a.coerce
  %or5.mux.i = select i1 %11, i32 %or573.i, i32 %or71.i
  %a.coerce.b.coerce.i = select i1 %7, i64 %b.coerce, i64 %a.coerce
  %or.or5.i = select i1 %7, i32 %or573.i, i32 %or71.i
  %retval.sroa.0.0.i = select i1 %or66775.i, i64 %b.coerce.mux.i, i64 %a.coerce.b.coerce.i
  %retval.sroa.5.0.i = select i1 %or66775.i, i32 %or5.mux.i, i32 %or.or5.i
  %retval.sroa.5.0.insert.ext.i = zext i32 %retval.sroa.5.0.i to i64
  %retval.sroa.5.0.insert.shift.i = shl nuw i64 %retval.sroa.5.0.insert.ext.i, 32
  %retval.sroa.0.0.insert.ext.i = and i64 %retval.sroa.0.0.i, 4294967295
  %retval.sroa.0.0.insert.insert.i = or i64 %retval.sroa.5.0.insert.shift.i, %retval.sroa.0.0.insert.ext.i
  br label %cleanup

if.end.26:                                        ; preds = %if.then.21
  %or27 = or i32 %and.i, %a.sroa.0.0.extract.trunc.i
  %or28 = or i32 %or27, %and.i.269
  %cmp29 = icmp eq i32 %or28, 0
  br i1 %cmp29, label %invalid, label %if.end.31

invalid:                                          ; preds = %if.end.26, %if.end
  %12 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.186 = or i32 %12, 16
  store i32 %or.i.186, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.31:                                        ; preds = %if.end.26
  %shl.i.182319 = shl nuw i64 %xor309, 63
  %add.i.183 = or i64 %shl.i.182319, 9218868437227405312
  br label %cleanup

if.end.33:                                        ; preds = %if.end.19
  %cmp34 = icmp eq i32 %and.i.269, 0
  br i1 %cmp34, label %if.then.35, label %if.end.41

if.then.35:                                       ; preds = %if.end.33
  %or36 = or i32 %and.i, %a.sroa.0.0.extract.trunc.i
  %cmp37 = icmp eq i32 %or36, 0
  br i1 %cmp37, label %if.then.38, label %if.end.40

if.then.38:                                       ; preds = %if.then.35
  %shl.i.179317 = shl nuw i64 %xor309, 63
  br label %cleanup

if.end.40:                                        ; preds = %if.then.35
  %cmp.i.124 = icmp eq i32 %and.i, 0
  br i1 %cmp.i.124, label %if.then.i.140, label %if.else.7.i.167

if.then.i.140:                                    ; preds = %if.end.40
  %cmp.i.i.125 = icmp ult i32 %a.sroa.0.0.extract.trunc.i, 65536
  %shl.i.i.126 = shl i32 %a.sroa.0.0.extract.trunc.i, 16
  %shl.a.i.i.127 = select i1 %cmp.i.i.125, i32 %shl.i.i.126, i32 %a.sroa.0.0.extract.trunc.i
  %..i.i.128 = select i1 %cmp.i.i.125, i32 16, i32 0
  %cmp1.i.i.129 = icmp ult i32 %shl.a.i.i.127, 16777216
  %add3.i.i.130 = or i32 %..i.i.128, 8
  %shl4.i.i.131 = shl i32 %shl.a.i.i.127, 8
  %a.addr.1.i.i.132 = select i1 %cmp1.i.i.129, i32 %shl4.i.i.131, i32 %shl.a.i.i.127
  %shiftCount.1.i.i.133 = select i1 %cmp1.i.i.129, i32 %add3.i.i.130, i32 %..i.i.128
  %shr.i.i.134 = lshr i32 %a.addr.1.i.i.132, 24
  %idxprom.i.i.135 = zext i32 %shr.i.i.134 to i64
  %arrayidx.i.i.136 = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i64 0, i64 %idxprom.i.i.135
  %13 = load i32, i32* %arrayidx.i.i.136, align 4, !tbaa !1
  %add6.i.i.137 = add nsw i32 %13, %shiftCount.1.i.i.133
  %sub.i.138 = add nsw i32 %add6.i.i.137, -11
  %cmp1.i.139 = icmp slt i32 %add6.i.i.137, 11
  br i1 %cmp1.i.139, label %if.then.2.i.145, label %if.else.i.147

if.then.2.i.145:                                  ; preds = %if.then.i.140
  %sub3.i.141 = sub i32 11, %add6.i.i.137
  %shr.i.142 = lshr i32 %a.sroa.0.0.extract.trunc.i, %sub3.i.141
  %and.i.143 = and i32 %sub.i.138, 31
  %shl.i.144 = shl i32 %a.sroa.0.0.extract.trunc.i, %and.i.143
  br label %if.end.i.150

if.else.i.147:                                    ; preds = %if.then.i.140
  %shl4.i.146 = shl i32 %a.sroa.0.0.extract.trunc.i, %sub.i.138
  br label %if.end.i.150

if.end.i.150:                                     ; preds = %if.else.i.147, %if.then.2.i.145
  %aSig0.0 = phi i32 [ %shr.i.142, %if.then.2.i.145 ], [ %shl4.i.146, %if.else.i.147 ]
  %storemerge.28.i.148 = phi i32 [ %shl.i.144, %if.then.2.i.145 ], [ 0, %if.else.i.147 ]
  %sub6.i.149 = sub i32 -20, %add6.i.i.137
  br label %if.end.41

if.else.7.i.167:                                  ; preds = %if.end.40
  %cmp.i.32.i.151 = icmp ult i32 %and.i, 65536
  %shl.i.33.i.152315 = shl nuw nsw i64 %a.sroa.1.0.extract.shift.i, 16
  %shl.i.33.i.152 = trunc i64 %shl.i.33.i.152315 to i32
  %shl.a.i.34.i.153 = select i1 %cmp.i.32.i.151, i32 %shl.i.33.i.152, i32 %and.i
  %..i.35.i.154 = select i1 %cmp.i.32.i.151, i32 16, i32 0
  %cmp1.i.36.i.155 = icmp ult i32 %shl.a.i.34.i.153, 16777216
  %add3.i.37.i.156 = or i32 %..i.35.i.154, 8
  %shl4.i.38.i.157 = shl i32 %shl.a.i.34.i.153, 8
  %a.addr.1.i.39.i.158 = select i1 %cmp1.i.36.i.155, i32 %shl4.i.38.i.157, i32 %shl.a.i.34.i.153
  %shiftCount.1.i.40.i.159 = select i1 %cmp1.i.36.i.155, i32 %add3.i.37.i.156, i32 %..i.35.i.154
  %shr.i.41.i.160 = lshr i32 %a.addr.1.i.39.i.158, 24
  %idxprom.i.42.i.161 = zext i32 %shr.i.41.i.160 to i64
  %arrayidx.i.43.i.162 = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i64 0, i64 %idxprom.i.42.i.161
  %14 = load i32, i32* %arrayidx.i.43.i.162, align 4, !tbaa !1
  %add6.i.44.i.163 = add nsw i32 %14, %shiftCount.1.i.40.i.159
  %sub9.i.164 = add nsw i32 %add6.i.44.i.163, -11
  %shl.i.29.i.165 = shl i32 %a.sroa.0.0.extract.trunc.i, %sub9.i.164
  %cmp.i.30.i.166 = icmp eq i32 %sub9.i.164, 0
  br i1 %cmp.i.30.i.166, label %shortShift64Left.exit.i.176, label %cond.false.i.i.173

cond.false.i.i.173:                               ; preds = %if.else.7.i.167
  %shl1.i.i.168 = shl i32 %and.i, %sub9.i.164
  %sub.i.i.169 = sub i32 11, %add6.i.44.i.163
  %and.i.i.170 = and i32 %sub.i.i.169, 31
  %shr.i.31.i.171 = lshr i32 %a.sroa.0.0.extract.trunc.i, %and.i.i.170
  %or.i.i.172 = or i32 %shr.i.31.i.171, %shl1.i.i.168
  br label %shortShift64Left.exit.i.176

shortShift64Left.exit.i.176:                      ; preds = %cond.false.i.i.173, %if.else.7.i.167
  %cond.i.i.174 = phi i32 [ %or.i.i.172, %cond.false.i.i.173 ], [ %and.i, %if.else.7.i.167 ]
  %sub10.i.175 = sub i32 12, %add6.i.44.i.163
  br label %if.end.41

if.end.41:                                        ; preds = %shortShift64Left.exit.i.176, %if.end.i.150, %if.end.33
  %aSig0.2 = phi i32 [ %and.i, %if.end.33 ], [ %aSig0.0, %if.end.i.150 ], [ %cond.i.i.174, %shortShift64Left.exit.i.176 ]
  %aSig1.1 = phi i32 [ %a.sroa.0.0.extract.trunc.i, %if.end.33 ], [ %storemerge.28.i.148, %if.end.i.150 ], [ %shl.i.29.i.165, %shortShift64Left.exit.i.176 ]
  %aExp.0 = phi i32 [ %and.i.269, %if.end.33 ], [ %sub6.i.149, %if.end.i.150 ], [ %sub10.i.175, %shortShift64Left.exit.i.176 ]
  %cmp42 = icmp eq i32 %and.i.260, 0
  br i1 %cmp42, label %if.then.43, label %if.end.49

if.then.43:                                       ; preds = %if.end.41
  %or44 = or i32 %and.i.263, %a.sroa.0.0.extract.trunc.i.264
  %cmp45 = icmp eq i32 %or44, 0
  br i1 %cmp45, label %if.then.46, label %if.end.48

if.then.46:                                       ; preds = %if.then.43
  %shl.i.123313 = shl nuw i64 %xor309, 63
  br label %cleanup

if.end.48:                                        ; preds = %if.then.43
  %cmp.i.115 = icmp eq i32 %and.i.263, 0
  br i1 %cmp.i.115, label %if.then.i, label %if.else.7.i

if.then.i:                                        ; preds = %if.end.48
  %cmp.i.i.116 = icmp ult i32 %a.sroa.0.0.extract.trunc.i.264, 65536
  %shl.i.i.117 = shl i32 %a.sroa.0.0.extract.trunc.i.264, 16
  %shl.a.i.i = select i1 %cmp.i.i.116, i32 %shl.i.i.117, i32 %a.sroa.0.0.extract.trunc.i.264
  %..i.i = select i1 %cmp.i.i.116, i32 16, i32 0
  %cmp1.i.i = icmp ult i32 %shl.a.i.i, 16777216
  %add3.i.i = or i32 %..i.i, 8
  %shl4.i.i = shl i32 %shl.a.i.i, 8
  %a.addr.1.i.i = select i1 %cmp1.i.i, i32 %shl4.i.i, i32 %shl.a.i.i
  %shiftCount.1.i.i = select i1 %cmp1.i.i, i32 %add3.i.i, i32 %..i.i
  %shr.i.i.118 = lshr i32 %a.addr.1.i.i, 24
  %idxprom.i.i = zext i32 %shr.i.i.118 to i64
  %arrayidx.i.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i64 0, i64 %idxprom.i.i
  %15 = load i32, i32* %arrayidx.i.i, align 4, !tbaa !1
  %add6.i.i = add nsw i32 %15, %shiftCount.1.i.i
  %sub.i = add nsw i32 %add6.i.i, -11
  %cmp1.i = icmp slt i32 %add6.i.i, 11
  br i1 %cmp1.i, label %if.then.2.i, label %if.else.i

if.then.2.i:                                      ; preds = %if.then.i
  %sub3.i = sub i32 11, %add6.i.i
  %shr.i.119 = lshr i32 %a.sroa.0.0.extract.trunc.i.264, %sub3.i
  %and.i.120 = and i32 %sub.i, 31
  %shl.i.121 = shl i32 %a.sroa.0.0.extract.trunc.i.264, %and.i.120
  br label %if.end.i

if.else.i:                                        ; preds = %if.then.i
  %shl4.i = shl i32 %a.sroa.0.0.extract.trunc.i.264, %sub.i
  br label %if.end.i

if.end.i:                                         ; preds = %if.else.i, %if.then.2.i
  %bSig0.0 = phi i32 [ %shr.i.119, %if.then.2.i ], [ %shl4.i, %if.else.i ]
  %storemerge.28.i = phi i32 [ %shl.i.121, %if.then.2.i ], [ 0, %if.else.i ]
  %sub6.i = sub i32 -20, %add6.i.i
  br label %if.end.49

if.else.7.i:                                      ; preds = %if.end.48
  %cmp.i.32.i.122 = icmp ult i32 %and.i.263, 65536
  %shl.i.33.i311 = shl nuw nsw i64 %a.sroa.1.0.extract.shift.i.261, 16
  %shl.i.33.i = trunc i64 %shl.i.33.i311 to i32
  %shl.a.i.34.i = select i1 %cmp.i.32.i.122, i32 %shl.i.33.i, i32 %and.i.263
  %..i.35.i = select i1 %cmp.i.32.i.122, i32 16, i32 0
  %cmp1.i.36.i = icmp ult i32 %shl.a.i.34.i, 16777216
  %add3.i.37.i = or i32 %..i.35.i, 8
  %shl4.i.38.i = shl i32 %shl.a.i.34.i, 8
  %a.addr.1.i.39.i = select i1 %cmp1.i.36.i, i32 %shl4.i.38.i, i32 %shl.a.i.34.i
  %shiftCount.1.i.40.i = select i1 %cmp1.i.36.i, i32 %add3.i.37.i, i32 %..i.35.i
  %shr.i.41.i = lshr i32 %a.addr.1.i.39.i, 24
  %idxprom.i.42.i = zext i32 %shr.i.41.i to i64
  %arrayidx.i.43.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i64 0, i64 %idxprom.i.42.i
  %16 = load i32, i32* %arrayidx.i.43.i, align 4, !tbaa !1
  %add6.i.44.i = add nsw i32 %16, %shiftCount.1.i.40.i
  %sub9.i = add nsw i32 %add6.i.44.i, -11
  %shl.i.29.i = shl i32 %a.sroa.0.0.extract.trunc.i.264, %sub9.i
  %cmp.i.30.i = icmp eq i32 %sub9.i, 0
  br i1 %cmp.i.30.i, label %shortShift64Left.exit.i, label %cond.false.i.i

cond.false.i.i:                                   ; preds = %if.else.7.i
  %shl1.i.i = shl i32 %and.i.263, %sub9.i
  %sub.i.i = sub i32 11, %add6.i.44.i
  %and.i.i = and i32 %sub.i.i, 31
  %shr.i.31.i = lshr i32 %a.sroa.0.0.extract.trunc.i.264, %and.i.i
  %or.i.i = or i32 %shr.i.31.i, %shl1.i.i
  br label %shortShift64Left.exit.i

shortShift64Left.exit.i:                          ; preds = %cond.false.i.i, %if.else.7.i
  %cond.i.i = phi i32 [ %or.i.i, %cond.false.i.i ], [ %and.i.263, %if.else.7.i ]
  %sub10.i = sub i32 12, %add6.i.44.i
  br label %if.end.49

if.end.49:                                        ; preds = %shortShift64Left.exit.i, %if.end.i, %if.end.41
  %bExp.0 = phi i32 [ %and.i.260, %if.end.41 ], [ %sub10.i, %shortShift64Left.exit.i ], [ %sub6.i, %if.end.i ]
  %bSig0.2 = phi i32 [ %and.i.263, %if.end.41 ], [ %cond.i.i, %shortShift64Left.exit.i ], [ %bSig0.0, %if.end.i ]
  %bSig1.1 = phi i32 [ %a.sroa.0.0.extract.trunc.i.264, %if.end.41 ], [ %shl.i.29.i, %shortShift64Left.exit.i ], [ %storemerge.28.i, %if.end.i ]
  %add = add nsw i32 %bExp.0, %aExp.0
  %sub = add nsw i32 %add, -1024
  %or50 = or i32 %aSig0.2, 1048576
  %shl.i.112 = shl i32 %bSig1.1, 12
  %shl1.i = shl i32 %bSig0.2, 12
  %shr.i.113 = lshr i32 %bSig1.1, 20
  %shr.i.i = lshr i32 %aSig1.1, 16
  %17 = lshr i32 %bSig1.1, 4
  %shr3.i.i = and i32 %17, 65535
  %conv5.i.i = and i32 %aSig1.1, 65535
  %conv6.i.i = and i32 %shl.i.112, 61440
  %mul.i.i = mul nuw i32 %conv6.i.i, %conv5.i.i
  %mul9.i.i = mul nuw i32 %shr3.i.i, %conv5.i.i
  %mul12.i.i = mul nuw i32 %conv6.i.i, %shr.i.i
  %mul15.i.i = mul nuw i32 %shr3.i.i, %shr.i.i
  %add.i.i = add i32 %mul9.i.i, %mul12.i.i
  %cmp.i.i = icmp ult i32 %add.i.i, %mul12.i.i
  %conv16.i.i = zext i1 %cmp.i.i to i32
  %shl.i.i = shl nuw nsw i32 %conv16.i.i, 16
  %shr17.i.i = lshr i32 %add.i.i, 16
  %add18.i.i = or i32 %shl.i.i, %shr17.i.i
  %shl20.i.i = shl i32 %add.i.i, 16
  %add21.i.i = add i32 %shl20.i.i, %mul.i.i
  %cmp22.i.i = icmp ult i32 %add21.i.i, %shl20.i.i
  %conv23.i.i = zext i1 %cmp22.i.i to i32
  %18 = lshr i32 %bSig0.2, 4
  %shr3.i.60.i = and i32 %18, 65535
  %shl1.i.masked = and i32 %shl1.i, 61440
  %conv6.i.62.i = or i32 %shr.i.113, %shl1.i.masked
  %mul.i.63.i = mul nuw i32 %conv6.i.62.i, %conv5.i.i
  %mul9.i.64.i = mul nuw i32 %shr3.i.60.i, %conv5.i.i
  %mul12.i.65.i = mul nuw i32 %conv6.i.62.i, %shr.i.i
  %mul15.i.66.i = mul nuw i32 %shr3.i.60.i, %shr.i.i
  %add.i.67.i = add i32 %mul12.i.65.i, %mul9.i.64.i
  %cmp.i.68.i = icmp ult i32 %add.i.67.i, %mul12.i.65.i
  %conv16.i.69.i = zext i1 %cmp.i.68.i to i32
  %shl.i.70.i = shl nuw nsw i32 %conv16.i.69.i, 16
  %shr17.i.71.i = lshr i32 %add.i.67.i, 16
  %add18.i.72.i = or i32 %shl.i.70.i, %shr17.i.71.i
  %shl20.i.74.i = shl i32 %add.i.67.i, 16
  %add21.i.75.i = add i32 %shl20.i.74.i, %mul.i.63.i
  %cmp22.i.76.i = icmp ult i32 %add21.i.75.i, %shl20.i.74.i
  %conv23.i.77.i = zext i1 %cmp22.i.76.i to i32
  %add19.i.i = add i32 %add21.i.75.i, %mul15.i.i
  %add24.i.i = add i32 %add19.i.i, %add18.i.i
  %add.i.55.i = add i32 %add24.i.i, %conv23.i.i
  %cmp.i.56.i = icmp ult i32 %add.i.55.i, %add21.i.75.i
  %conv.i.57.i = zext i1 %cmp.i.56.i to i32
  %shr.i.35.i = lshr i32 %or50, 16
  %conv5.i.37.i = and i32 %aSig0.2, 65535
  %mul.i.39.i = mul nuw i32 %conv6.i.62.i, %conv5.i.37.i
  %mul9.i.40.i = mul nuw i32 %shr3.i.60.i, %conv5.i.37.i
  %mul12.i.41.i = mul nuw i32 %conv6.i.62.i, %shr.i.35.i
  %mul15.i.42.i = mul nuw i32 %shr3.i.60.i, %shr.i.35.i
  %add.i.43.i = add i32 %mul12.i.41.i, %mul9.i.40.i
  %cmp.i.44.i = icmp ult i32 %add.i.43.i, %mul12.i.41.i
  %conv16.i.45.i = zext i1 %cmp.i.44.i to i32
  %shl.i.46.i = shl nuw nsw i32 %conv16.i.45.i, 16
  %shr17.i.47.i = lshr i32 %add.i.43.i, 16
  %add18.i.48.i = or i32 %shl.i.46.i, %shr17.i.47.i
  %shl20.i.50.i = shl i32 %add.i.43.i, 16
  %add21.i.51.i = add i32 %shl20.i.50.i, %mul.i.39.i
  %cmp22.i.52.i = icmp ult i32 %add21.i.51.i, %shl20.i.50.i
  %conv23.i.53.i = zext i1 %cmp22.i.52.i to i32
  %add19.i.73.i = add i32 %add21.i.51.i, %mul15.i.66.i
  %add24.i.78.i = add i32 %add19.i.73.i, %add18.i.72.i
  %add2.i.58.i = add i32 %add24.i.78.i, %conv23.i.77.i
  %add.i.31.i = add i32 %add2.i.58.i, %conv.i.57.i
  %cmp.i.32.i = icmp ult i32 %add.i.31.i, %add21.i.51.i
  %conv.i.33.i = zext i1 %cmp.i.32.i to i32
  %mul.i.15.i = mul nuw i32 %conv6.i.i, %conv5.i.37.i
  %mul9.i.16.i = mul nuw i32 %shr3.i.i, %conv5.i.37.i
  %mul12.i.17.i = mul nuw i32 %conv6.i.i, %shr.i.35.i
  %mul15.i.18.i = mul nuw i32 %shr3.i.i, %shr.i.35.i
  %add.i.19.i = add i32 %mul9.i.16.i, %mul12.i.17.i
  %cmp.i.20.i = icmp ult i32 %add.i.19.i, %mul12.i.17.i
  %conv16.i.21.i = zext i1 %cmp.i.20.i to i32
  %shl.i.22.i = shl nuw nsw i32 %conv16.i.21.i, 16
  %shr17.i.23.i = lshr i32 %add.i.19.i, 16
  %add18.i.24.i = or i32 %shl.i.22.i, %shr17.i.23.i
  %add19.i.25.i = add i32 %add18.i.24.i, %mul15.i.18.i
  %shl20.i.26.i = shl i32 %add.i.19.i, 16
  %add21.i.27.i = add i32 %shl20.i.26.i, %mul.i.15.i
  %cmp22.i.28.i = icmp ult i32 %add21.i.27.i, %shl20.i.26.i
  %conv23.i.29.i = zext i1 %cmp22.i.28.i to i32
  %add24.i.30.i = add i32 %add19.i.25.i, %conv23.i.29.i
  %add.i.7.i = add i32 %add.i.55.i, %add21.i.27.i
  %cmp.i.8.i = icmp ult i32 %add.i.7.i, %add21.i.27.i
  %conv.i.9.i = zext i1 %cmp.i.8.i to i32
  %add2.i.10.i = add i32 %add24.i.30.i, %conv.i.9.i
  %add.i.5.i = add i32 %add2.i.10.i, %add.i.31.i
  %cmp.i.6.i = icmp ult i32 %add.i.5.i, %add.i.31.i
  %conv.i.i = zext i1 %cmp.i.6.i to i32
  %add.i = add i32 %add.i.5.i, %aSig1.1
  %cmp.i = icmp ult i32 %add.i, %add.i.5.i
  %conv.i = zext i1 %cmp.i to i32
  %add19.i.49.i = add i32 %mul15.i.42.i, %or50
  %add24.i.54.i = add i32 %add19.i.49.i, %add18.i.48.i
  %add2.i.34.i = add i32 %add24.i.54.i, %conv23.i.53.i
  %add2.i.i = add i32 %add2.i.34.i, %conv.i.33.i
  %add1.i = add i32 %add2.i.i, %conv.i.i
  %add2.i = add i32 %add1.i, %conv.i
  %cmp51 = icmp ne i32 %add21.i.i, 0
  %conv = zext i1 %cmp51 to i32
  %or52 = or i32 %add.i.7.i, %conv
  %cmp53 = icmp ugt i32 %add2.i, 2097151
  br i1 %cmp53, label %if.then.55, label %if.end.56

if.then.55:                                       ; preds = %if.end.49
  %shl.i = shl i32 %add.i, 31
  %shl3.i = shl i32 %add2.i, 31
  %shr.i = lshr i32 %add.i, 1
  %or.i = or i32 %shl3.i, %shr.i
  %shr4.i = lshr i32 %add2.i, 1
  %cmp20.i = icmp ne i32 %or52, 0
  %conv21.i = zext i1 %cmp20.i to i32
  %or22.i = or i32 %shl.i, %conv21.i
  %inc = add nsw i32 %add, -1023
  br label %if.end.56

if.end.56:                                        ; preds = %if.then.55, %if.end.49
  %zSig0.0 = phi i32 [ %shr4.i, %if.then.55 ], [ %add2.i, %if.end.49 ]
  %zSig1.0 = phi i32 [ %or.i, %if.then.55 ], [ %add.i, %if.end.49 ]
  %zSig2.0 = phi i32 [ %or22.i, %if.then.55 ], [ %or52, %if.end.49 ]
  %zExp.0 = phi i32 [ %inc, %if.then.55 ], [ %sub, %if.end.49 ]
  %call57 = tail call fastcc i64 @roundAndPackFloat64(i32 %xor, i32 %zExp.0, i32 %zSig0.0, i32 %zSig1.0, i32 %zSig2.0) #5
  %retval.sroa.9.0.extract.shift110 = and i64 %call57, -4294967296
  br label %cleanup

cleanup:                                          ; preds = %if.end.56, %if.then.46, %if.then.38, %if.end.31, %invalid, %propagateFloat64NaN.exit, %if.end.17, %propagateFloat64NaN.exit255
  %retval.sroa.0.0 = phi i64 [ %retval.sroa.0.0.insert.insert.i.253, %propagateFloat64NaN.exit255 ], [ 4294967295, %invalid ], [ %add.i.196, %if.end.17 ], [ %retval.sroa.0.0.insert.insert.i, %propagateFloat64NaN.exit ], [ %add.i.183, %if.end.31 ], [ %shl.i.179317, %if.then.38 ], [ %shl.i.123313, %if.then.46 ], [ %call57, %if.end.56 ]
  %retval.sroa.9.0 = phi i64 [ %retval.sroa.5.0.insert.shift.i.251, %propagateFloat64NaN.exit255 ], [ 9223372032559808512, %invalid ], [ %add.i.196, %if.end.17 ], [ %retval.sroa.5.0.insert.shift.i, %propagateFloat64NaN.exit ], [ %add.i.183, %if.end.31 ], [ %shl.i.179317, %if.then.38 ], [ %shl.i.123313, %if.then.46 ], [ %retval.sroa.9.0.extract.shift110, %if.end.56 ]
  %retval.sroa.0.0.insert.ext = and i64 %retval.sroa.0.0, 4294967295
  %retval.sroa.0.0.insert.insert = or i64 %retval.sroa.9.0, %retval.sroa.0.0.insert.ext
  ret i64 %retval.sroa.0.0.insert.insert
}

; Function Attrs: noimplicitfloat nounwind uwtable
define internal fastcc i64 @roundAndPackFloat64(i32 %zSign, i32 %zExp, i32 %zSig0, i32 %zSig1, i32 %zSig2) #2 {
entry:
  %0 = load i32, i32* @float_rounding_mode, align 4, !tbaa !1
  %cmp = icmp eq i32 %0, 0
  %zSig2.lobit = lshr i32 %zSig2, 31
  br i1 %cmp, label %if.end.19, label %if.then

if.then:                                          ; preds = %entry
  %cmp3 = icmp eq i32 %0, 1
  br i1 %cmp3, label %if.end.19, label %if.else

if.else:                                          ; preds = %if.then
  %tobool6 = icmp eq i32 %zSign, 0
  br i1 %tobool6, label %if.else.11, label %if.then.7

if.then.7:                                        ; preds = %if.else
  %cmp8 = icmp eq i32 %0, 3
  %tobool10 = icmp ne i32 %zSig2, 0
  %1 = and i1 %tobool10, %cmp8
  %land.ext = zext i1 %1 to i32
  br label %if.end.19

if.else.11:                                       ; preds = %if.else
  %cmp12 = icmp eq i32 %0, 2
  %tobool15 = icmp ne i32 %zSig2, 0
  %2 = and i1 %tobool15, %cmp12
  %land.ext17 = zext i1 %2 to i32
  br label %if.end.19

if.end.19:                                        ; preds = %if.then, %if.else.11, %if.then.7, %entry
  %increment.0 = phi i32 [ %zSig2.lobit, %entry ], [ %land.ext, %if.then.7 ], [ %land.ext17, %if.else.11 ], [ 0, %if.then ]
  %conv21 = and i32 %zExp, 65535
  %cmp22 = icmp ugt i32 %conv21, 2044
  br i1 %cmp22, label %if.then.24, label %if.end.90

if.then.24:                                       ; preds = %if.end.19
  %cmp25 = icmp sgt i32 %zExp, 2045
  br i1 %cmp25, label %if.then.32, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then.24
  %cmp27 = icmp eq i32 %zExp, 2045
  br i1 %cmp27, label %land.lhs.true, label %if.end.49

land.lhs.true:                                    ; preds = %lor.lhs.false
  %cmp.i = icmp eq i32 %zSig0, 2097151
  %cmp1.i = icmp eq i32 %zSig1, -1
  %cmp1..i = and i1 %cmp.i, %cmp1.i
  %tobool31 = icmp ne i32 %increment.0, 0
  %or.cond = and i1 %cmp1..i, %tobool31
  br i1 %or.cond, label %if.then.32, label %if.end.90

if.then.32:                                       ; preds = %land.lhs.true, %if.then.24
  %3 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.162 = or i32 %3, 9
  store i32 %or.i.162, i32* @float_exception_flags, align 4, !tbaa !1
  %cmp33 = icmp eq i32 %0, 1
  br i1 %cmp33, label %if.then.45, label %lor.lhs.false.35

lor.lhs.false.35:                                 ; preds = %if.then.32
  %tobool36 = icmp ne i32 %zSign, 0
  %cmp38 = icmp eq i32 %0, 2
  %or.cond110 = and i1 %tobool36, %cmp38
  br i1 %or.cond110, label %if.then.45, label %lor.lhs.false.40

lor.lhs.false.40:                                 ; preds = %lor.lhs.false.35
  %tobool41 = icmp eq i32 %zSign, 0
  %cmp43 = icmp eq i32 %0, 3
  %or.cond111 = and i1 %tobool41, %cmp43
  br i1 %or.cond111, label %if.then.45, label %if.end.47

if.then.45:                                       ; preds = %lor.lhs.false.40, %lor.lhs.false.35, %if.then.32
  %shl.i.156 = shl i32 %zSign, 31
  %add2.i.158 = or i32 %shl.i.156, 2146435071
  %retval.sroa.2.0.insert.ext.i.159 = zext i32 %add2.i.158 to i64
  %retval.sroa.2.0.insert.shift.i.160 = shl nuw i64 %retval.sroa.2.0.insert.ext.i.159, 32
  %retval.sroa.0.0.insert.insert.i.161 = or i64 %retval.sroa.2.0.insert.shift.i.160, 4294967295
  br label %cleanup

if.end.47:                                        ; preds = %lor.lhs.false.40
  %shl.i.152 = shl i32 %zSign, 31
  %add.i.153 = or i32 %shl.i.152, 2146435072
  %retval.sroa.2.0.insert.ext.i.154 = zext i32 %add.i.153 to i64
  %retval.sroa.2.0.insert.shift.i.155 = shl nuw i64 %retval.sroa.2.0.insert.ext.i.154, 32
  br label %cleanup

if.end.49:                                        ; preds = %lor.lhs.false
  %cmp50 = icmp slt i32 %zExp, 0
  br i1 %cmp50, label %if.then.52, label %if.end.90

if.then.52:                                       ; preds = %if.end.49
  %4 = load i32, i32* @float_detect_tininess, align 4, !tbaa !1
  %notlhs = icmp ne i32 %4, 1
  %notrhs = icmp sgt i32 %zExp, -2
  %or.cond112.not = and i1 %notrhs, %notlhs
  %tobool59 = icmp ne i32 %increment.0, 0
  %or.cond113 = and i1 %tobool59, %or.cond112.not
  %or.cond113.not = xor i1 %or.cond113, true
  %cmp.i.150 = icmp ult i32 %zSig0, 2097151
  %or.cond179 = or i1 %cmp.i.150, %or.cond113.not
  br i1 %or.cond179, label %if.else.i, label %lor.rhs.i

lor.rhs.i:                                        ; preds = %if.then.52
  %cmp1.i.151 = icmp eq i32 %zSig0, 2097151
  %cmp2.i = icmp ne i32 %zSig1, -1
  %cmp2..i = and i1 %cmp1.i.151, %cmp2.i
  br label %if.else.i

if.else.i:                                        ; preds = %lor.rhs.i, %if.then.52
  %5 = phi i1 [ true, %if.then.52 ], [ %cmp2..i, %lor.rhs.i ]
  %sub = sub nsw i32 0, %zExp
  %and.i = and i32 %zExp, 31
  %cmp1.i.146 = icmp sgt i32 %zExp, -32
  br i1 %cmp1.i.146, label %if.then.2.i, label %if.else.5.i

if.then.2.i:                                      ; preds = %if.else.i
  %shl.i.147 = shl i32 %zSig1, %and.i
  %shl3.i = shl i32 %zSig0, %and.i
  %shr.i = lshr i32 %zSig1, %sub
  %or.i.148 = or i32 %shr.i, %shl3.i
  %shr4.i = lshr i32 %zSig0, %sub
  br label %shift64ExtraRightJamming.exit

if.else.5.i:                                      ; preds = %if.else.i
  %cmp6.i = icmp eq i32 %sub, 32
  br i1 %cmp6.i, label %shift64ExtraRightJamming.exit, label %if.else.8.i

if.else.8.i:                                      ; preds = %if.else.5.i
  %or9.i = or i32 %zSig2, %zSig1
  %cmp10.i = icmp sgt i32 %zExp, -64
  br i1 %cmp10.i, label %if.then.11.i, label %if.else.15.i

if.then.11.i:                                     ; preds = %if.else.8.i
  %shl12.i = shl i32 %zSig0, %and.i
  %and13.i = and i32 %sub, 31
  %shr14.i = lshr i32 %zSig0, %and13.i
  br label %shift64ExtraRightJamming.exit

if.else.15.i:                                     ; preds = %if.else.8.i
  %cmp16.i = icmp eq i32 %sub, 64
  %cmp17.i = icmp ne i32 %zSig0, 0
  %conv.i.149 = zext i1 %cmp17.i to i32
  %cond.i = select i1 %cmp16.i, i32 %zSig0, i32 %conv.i.149
  br label %shift64ExtraRightJamming.exit

shift64ExtraRightJamming.exit:                    ; preds = %if.then.2.i, %if.else.5.i, %if.then.11.i, %if.else.15.i
  %z0.0.i = phi i32 [ %shr4.i, %if.then.2.i ], [ 0, %if.else.5.i ], [ 0, %if.then.11.i ], [ 0, %if.else.15.i ]
  %z1.1.i = phi i32 [ %or.i.148, %if.then.2.i ], [ %zSig0, %if.else.5.i ], [ %shr14.i, %if.then.11.i ], [ 0, %if.else.15.i ]
  %z2.1.i = phi i32 [ %shl.i.147, %if.then.2.i ], [ %zSig1, %if.else.5.i ], [ %shl12.i, %if.then.11.i ], [ %cond.i, %if.else.15.i ]
  %a2.addr.1.i = phi i32 [ %zSig2, %if.then.2.i ], [ %zSig2, %if.else.5.i ], [ %or9.i, %if.then.11.i ], [ %or9.i, %if.else.15.i ]
  %cmp20.i = icmp ne i32 %a2.addr.1.i, 0
  %conv21.i = zext i1 %cmp20.i to i32
  %or22.i = or i32 %conv21.i, %z2.1.i
  %tobool64 = icmp ne i32 %or22.i, 0
  %or.cond114 = and i1 %5, %tobool64
  br i1 %or.cond114, label %if.then.65, label %if.end.66

if.then.65:                                       ; preds = %shift64ExtraRightJamming.exit
  %6 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %6, 4
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.66

if.end.66:                                        ; preds = %if.then.65, %shift64ExtraRightJamming.exit
  br i1 %cmp, label %if.then.68, label %if.else.71

if.then.68:                                       ; preds = %if.end.66
  %.lobit = lshr i32 %z2.1.i, 31
  br label %if.end.90

if.else.71:                                       ; preds = %if.end.66
  %tobool72 = icmp eq i32 %zSign, 0
  br i1 %tobool72, label %if.else.80, label %if.then.73

if.then.73:                                       ; preds = %if.else.71
  %cmp74 = icmp eq i32 %0, 3
  %7 = and i1 %cmp74, %tobool64
  %land.ext79 = zext i1 %7 to i32
  br label %if.end.90

if.else.80:                                       ; preds = %if.else.71
  %cmp81 = icmp eq i32 %0, 2
  %8 = and i1 %cmp81, %tobool64
  %land.ext86 = zext i1 %8 to i32
  br label %if.end.90

if.end.90:                                        ; preds = %land.lhs.true, %if.end.49, %if.then.73, %if.else.80, %if.then.68, %if.end.19
  %zSig0.addr.0 = phi i32 [ %z0.0.i, %if.then.68 ], [ %z0.0.i, %if.else.80 ], [ %z0.0.i, %if.then.73 ], [ %zSig0, %if.end.49 ], [ %zSig0, %if.end.19 ], [ %zSig0, %land.lhs.true ]
  %zSig1.addr.0 = phi i32 [ %z1.1.i, %if.then.68 ], [ %z1.1.i, %if.else.80 ], [ %z1.1.i, %if.then.73 ], [ %zSig1, %if.end.49 ], [ %zSig1, %if.end.19 ], [ %zSig1, %land.lhs.true ]
  %zSig2.addr.0 = phi i32 [ %or22.i, %if.then.68 ], [ %or22.i, %if.else.80 ], [ %or22.i, %if.then.73 ], [ %zSig2, %if.end.49 ], [ %zSig2, %if.end.19 ], [ %zSig2, %land.lhs.true ]
  %zExp.addr.0 = phi i32 [ 0, %if.then.68 ], [ 0, %if.else.80 ], [ 0, %if.then.73 ], [ %zExp, %if.end.49 ], [ %zExp, %if.end.19 ], [ 2045, %land.lhs.true ]
  %increment.1 = phi i32 [ %.lobit, %if.then.68 ], [ %land.ext86, %if.else.80 ], [ %land.ext79, %if.then.73 ], [ %increment.0, %if.end.49 ], [ %increment.0, %if.end.19 ], [ %increment.0, %land.lhs.true ]
  %tobool91 = icmp eq i32 %zSig2.addr.0, 0
  br i1 %tobool91, label %if.end.93, label %if.then.92

if.then.92:                                       ; preds = %if.end.90
  %9 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or = or i32 %9, 1
  store i32 %or, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.93

if.end.93:                                        ; preds = %if.end.90, %if.then.92
  %tobool94 = icmp eq i32 %increment.1, 0
  br i1 %tobool94, label %if.else.99, label %if.then.95

if.then.95:                                       ; preds = %if.end.93
  %add.i.142 = add i32 %zSig1.addr.0, 1
  %cmp.i.143 = icmp eq i32 %zSig1.addr.0, -1
  %conv.i = zext i1 %cmp.i.143 to i32
  %add2.i.144 = add i32 %conv.i, %zSig0.addr.0
  %add.mask = and i32 %zSig2.addr.0, 2147483647
  %10 = or i32 %add.mask, %0
  %11 = icmp eq i32 %10, 0
  %and = zext i1 %11 to i32
  %neg = xor i32 %and, -1
  %and98 = and i32 %add.i.142, %neg
  br label %if.end.105

if.else.99:                                       ; preds = %if.end.93
  %or100 = or i32 %zSig1.addr.0, %zSig0.addr.0
  %cmp101 = icmp eq i32 %or100, 0
  %.zExp.addr.0 = select i1 %cmp101, i32 0, i32 %zExp.addr.0
  br label %if.end.105

if.end.105:                                       ; preds = %if.else.99, %if.then.95
  %zSig0.addr.1 = phi i32 [ %zSig0.addr.0, %if.else.99 ], [ %add2.i.144, %if.then.95 ]
  %zSig1.addr.1 = phi i32 [ %zSig1.addr.0, %if.else.99 ], [ %and98, %if.then.95 ]
  %zExp.addr.1 = phi i32 [ %.zExp.addr.0, %if.else.99 ], [ %zExp.addr.0, %if.then.95 ]
  %shl.i = shl i32 %zSign, 31
  %shl1.i = shl i32 %zExp.addr.1, 20
  %add.i = add i32 %zSig0.addr.1, %shl.i
  %add2.i = add i32 %add.i, %shl1.i
  %retval.sroa.2.0.insert.ext.i = zext i32 %add2.i to i64
  %retval.sroa.2.0.insert.shift.i = shl nuw i64 %retval.sroa.2.0.insert.ext.i, 32
  %retval.sroa.0.0.insert.ext.i = zext i32 %zSig1.addr.1 to i64
  %retval.sroa.0.0.insert.insert.i = or i64 %retval.sroa.2.0.insert.shift.i, %retval.sroa.0.0.insert.ext.i
  br label %cleanup

cleanup:                                          ; preds = %if.end.105, %if.end.47, %if.then.45
  %retval.sroa.0.0 = phi i64 [ %retval.sroa.0.0.insert.insert.i.161, %if.then.45 ], [ %retval.sroa.2.0.insert.shift.i.155, %if.end.47 ], [ %retval.sroa.0.0.insert.insert.i, %if.end.105 ]
  ret i64 %retval.sroa.0.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i64 @float64_div(i64 %a.coerce, i64 %b.coerce) #2 {
entry:
  %a.sroa.0.0.extract.trunc.i = trunc i64 %a.coerce to i32
  %a.sroa.1.0.extract.shift.i = lshr i64 %a.coerce, 32
  %a.sroa.1.0.extract.trunc.i = trunc i64 %a.sroa.1.0.extract.shift.i to i32
  %and.i = and i32 %a.sroa.1.0.extract.trunc.i, 1048575
  %a.sroa.1.0.extract.shift.i.504 = lshr i64 %a.coerce, 52
  %shr.i.505 = trunc i64 %a.sroa.1.0.extract.shift.i.504 to i32
  %and.i.506 = and i32 %shr.i.505, 2047
  %a.sroa.0.0.extract.trunc.i.501 = trunc i64 %b.coerce to i32
  %a.sroa.1.0.extract.shift.i.498 = lshr i64 %b.coerce, 32
  %a.sroa.1.0.extract.trunc.i.499 = trunc i64 %a.sroa.1.0.extract.shift.i.498 to i32
  %and.i.500 = and i32 %a.sroa.1.0.extract.trunc.i.499, 1048575
  %a.sroa.1.0.extract.shift.i.495 = lshr i64 %b.coerce, 52
  %shr.i.496 = trunc i64 %a.sroa.1.0.extract.shift.i.495 to i32
  %and.i.497 = and i32 %shr.i.496, 2047
  %a.sroa.1.0.extract.shift.i.502580 = xor i64 %b.coerce, %a.coerce
  %xor579 = lshr i64 %a.sroa.1.0.extract.shift.i.502580, 63
  %xor = trunc i64 %xor579 to i32
  %cmp = icmp eq i32 %and.i.506, 2047
  br i1 %cmp, label %if.then, label %if.end.19

if.then:                                          ; preds = %entry
  %or = or i32 %and.i, %a.sroa.0.0.extract.trunc.i
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %if.end, label %if.then.8

if.then.8:                                        ; preds = %if.then
  %and.i.57.i.440 = and i64 %a.coerce, 9221120237041090560
  %cmp.i.58.i.441 = icmp eq i64 %and.i.57.i.440, 9218868437227405312
  br i1 %cmp.i.58.i.441, label %land.rhs.i.61.i.444, label %float64_is_signaling_nan.exit66.i.451

land.rhs.i.61.i.444:                              ; preds = %if.then.8
  %tobool.i.60.i.443 = icmp eq i32 %a.sroa.0.0.extract.trunc.i, 0
  br i1 %tobool.i.60.i.443, label %lor.rhs.i.64.i.447, label %float64_is_signaling_nan.exit66.i.451

lor.rhs.i.64.i.447:                               ; preds = %land.rhs.i.61.i.444
  %and2.i.62.i.445 = and i64 %a.coerce, 2251795518717952
  %tobool3.i.63.i.446 = icmp ne i64 %and2.i.62.i.445, 0
  br label %float64_is_signaling_nan.exit66.i.451

float64_is_signaling_nan.exit66.i.451:            ; preds = %lor.rhs.i.64.i.447, %land.rhs.i.61.i.444, %if.then.8
  %0 = phi i1 [ false, %if.then.8 ], [ true, %land.rhs.i.61.i.444 ], [ %tobool3.i.63.i.446, %lor.rhs.i.64.i.447 ]
  %shl4.i.i.448 = shl nuw nsw i64 %a.sroa.1.0.extract.shift.i.498, 1
  %shl.i.i.449 = trunc i64 %shl4.i.i.448 to i32
  %cmp.i.50.i.450 = icmp ugt i32 %shl.i.i.449, -2097153
  br i1 %cmp.i.50.i.450, label %land.rhs.i.53.i.454, label %float64_is_nan.exit.i.460

land.rhs.i.53.i.454:                              ; preds = %float64_is_signaling_nan.exit66.i.451
  %tobool.i.52.i.453 = icmp eq i32 %a.sroa.0.0.extract.trunc.i.501, 0
  br i1 %tobool.i.52.i.453, label %lor.rhs.i.55.i.457, label %float64_is_nan.exit.i.460

lor.rhs.i.55.i.457:                               ; preds = %land.rhs.i.53.i.454
  %and.i.54.i.455 = and i64 %a.sroa.1.0.extract.shift.i.498, 1048575
  %tobool2.i.i.456 = icmp ne i64 %and.i.54.i.455, 0
  br label %float64_is_nan.exit.i.460

float64_is_nan.exit.i.460:                        ; preds = %lor.rhs.i.55.i.457, %land.rhs.i.53.i.454, %float64_is_signaling_nan.exit66.i.451
  %1 = phi i1 [ false, %float64_is_signaling_nan.exit66.i.451 ], [ true, %land.rhs.i.53.i.454 ], [ %tobool2.i.i.456, %lor.rhs.i.55.i.457 ]
  %and.i.i.458 = and i64 %b.coerce, 9221120237041090560
  %cmp.i.i.459 = icmp eq i64 %and.i.i.458, 9218868437227405312
  br i1 %cmp.i.i.459, label %land.rhs.i.i.463, label %float64_is_signaling_nan.exit.i.473

land.rhs.i.i.463:                                 ; preds = %float64_is_nan.exit.i.460
  %tobool.i.i.462 = icmp eq i32 %a.sroa.0.0.extract.trunc.i.501, 0
  br i1 %tobool.i.i.462, label %lor.rhs.i.i.469, label %float64_is_signaling_nan.exit.thread.i.466

float64_is_signaling_nan.exit.thread.i.466:       ; preds = %land.rhs.i.i.463
  %or.68.i.464 = or i32 %a.sroa.1.0.extract.trunc.i, 524288
  %or5.69.i.465 = or i32 %a.sroa.1.0.extract.trunc.i.499, 524288
  br label %if.then.i.477

lor.rhs.i.i.469:                                  ; preds = %land.rhs.i.i.463
  %and2.i.i.467 = and i64 %b.coerce, 2251795518717952
  %tobool3.i.i.468 = icmp ne i64 %and2.i.i.467, 0
  br label %float64_is_signaling_nan.exit.i.473

float64_is_signaling_nan.exit.i.473:              ; preds = %lor.rhs.i.i.469, %float64_is_nan.exit.i.460
  %2 = phi i1 [ false, %float64_is_nan.exit.i.460 ], [ %tobool3.i.i.468, %lor.rhs.i.i.469 ]
  %or.i.470 = or i32 %a.sroa.1.0.extract.trunc.i, 524288
  %or5.i.471 = or i32 %a.sroa.1.0.extract.trunc.i.499, 524288
  %or667.i.472 = or i1 %0, %2
  br i1 %or667.i.472, label %if.then.i.477, label %propagateFloat64NaN.exit492

if.then.i.477:                                    ; preds = %float64_is_signaling_nan.exit.i.473, %float64_is_signaling_nan.exit.thread.i.466
  %or574.i.474 = phi i32 [ %or5.69.i.465, %float64_is_signaling_nan.exit.thread.i.466 ], [ %or5.i.471, %float64_is_signaling_nan.exit.i.473 ]
  %or72.i.475 = phi i32 [ %or.68.i.464, %float64_is_signaling_nan.exit.thread.i.466 ], [ %or.i.470, %float64_is_signaling_nan.exit.i.473 ]
  %3 = phi i1 [ true, %float64_is_signaling_nan.exit.thread.i.466 ], [ %2, %float64_is_signaling_nan.exit.i.473 ]
  %4 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.476 = or i32 %4, 16
  store i32 %or.i.i.476, i32* @float_exception_flags, align 4, !tbaa !1
  br label %propagateFloat64NaN.exit492

propagateFloat64NaN.exit492:                      ; preds = %float64_is_signaling_nan.exit.i.473, %if.then.i.477
  %or66775.i.478 = phi i1 [ false, %float64_is_signaling_nan.exit.i.473 ], [ true, %if.then.i.477 ]
  %or573.i.479 = phi i32 [ %or5.i.471, %float64_is_signaling_nan.exit.i.473 ], [ %or574.i.474, %if.then.i.477 ]
  %or71.i.480 = phi i32 [ %or.i.470, %float64_is_signaling_nan.exit.i.473 ], [ %or72.i.475, %if.then.i.477 ]
  %5 = phi i1 [ false, %float64_is_signaling_nan.exit.i.473 ], [ %3, %if.then.i.477 ]
  %b.coerce.mux.i.481 = select i1 %5, i64 %b.coerce, i64 %a.coerce
  %or5.mux.i.482 = select i1 %5, i32 %or573.i.479, i32 %or71.i.480
  %a.coerce.b.coerce.i.483 = select i1 %1, i64 %b.coerce, i64 %a.coerce
  %or.or5.i.484 = select i1 %1, i32 %or573.i.479, i32 %or71.i.480
  %retval.sroa.0.0.i.485 = select i1 %or66775.i.478, i64 %b.coerce.mux.i.481, i64 %a.coerce.b.coerce.i.483
  %retval.sroa.5.0.i.486 = select i1 %or66775.i.478, i32 %or5.mux.i.482, i32 %or.or5.i.484
  %retval.sroa.5.0.insert.ext.i.487 = zext i32 %retval.sroa.5.0.i.486 to i64
  %retval.sroa.5.0.insert.shift.i.488 = shl nuw i64 %retval.sroa.5.0.insert.ext.i.487, 32
  %retval.sroa.0.0.insert.ext.i.489 = and i64 %retval.sroa.0.0.i.485, 4294967295
  %retval.sroa.0.0.insert.insert.i.490 = or i64 %retval.sroa.5.0.insert.shift.i.488, %retval.sroa.0.0.insert.ext.i.489
  br label %cleanup

if.end:                                           ; preds = %if.then
  %cmp10 = icmp eq i32 %and.i.497, 2047
  br i1 %cmp10, label %if.then.11, label %if.end.17

if.then.11:                                       ; preds = %if.end
  %or12 = or i32 %and.i.500, %a.sroa.0.0.extract.trunc.i.501
  %tobool13 = icmp eq i32 %or12, 0
  br i1 %tobool13, label %invalid, label %if.then.14

if.then.14:                                       ; preds = %if.then.11
  %and.i.57.i.383 = and i64 %a.coerce, 9221120237041090560
  %cmp.i.58.i.384 = icmp eq i64 %and.i.57.i.383, 9218868437227405312
  br i1 %cmp.i.58.i.384, label %land.rhs.i.61.i.387, label %float64_is_signaling_nan.exit66.i.394

land.rhs.i.61.i.387:                              ; preds = %if.then.14
  %tobool.i.60.i.386 = icmp eq i32 %a.sroa.0.0.extract.trunc.i, 0
  br i1 %tobool.i.60.i.386, label %lor.rhs.i.64.i.390, label %float64_is_signaling_nan.exit66.i.394

lor.rhs.i.64.i.390:                               ; preds = %land.rhs.i.61.i.387
  %and2.i.62.i.388 = and i64 %a.coerce, 2251795518717952
  %tobool3.i.63.i.389 = icmp ne i64 %and2.i.62.i.388, 0
  br label %float64_is_signaling_nan.exit66.i.394

float64_is_signaling_nan.exit66.i.394:            ; preds = %lor.rhs.i.64.i.390, %land.rhs.i.61.i.387, %if.then.14
  %6 = phi i1 [ false, %if.then.14 ], [ true, %land.rhs.i.61.i.387 ], [ %tobool3.i.63.i.389, %lor.rhs.i.64.i.390 ]
  %shl4.i.i.391 = shl nuw nsw i64 %a.sroa.1.0.extract.shift.i.498, 1
  %shl.i.i.392 = trunc i64 %shl4.i.i.391 to i32
  %cmp.i.50.i.393 = icmp ugt i32 %shl.i.i.392, -2097153
  br i1 %cmp.i.50.i.393, label %land.rhs.i.53.i.397, label %float64_is_nan.exit.i.403

land.rhs.i.53.i.397:                              ; preds = %float64_is_signaling_nan.exit66.i.394
  %tobool.i.52.i.396 = icmp eq i32 %a.sroa.0.0.extract.trunc.i.501, 0
  br i1 %tobool.i.52.i.396, label %lor.rhs.i.55.i.400, label %float64_is_nan.exit.i.403

lor.rhs.i.55.i.400:                               ; preds = %land.rhs.i.53.i.397
  %and.i.54.i.398 = and i64 %a.sroa.1.0.extract.shift.i.498, 1048575
  %tobool2.i.i.399 = icmp ne i64 %and.i.54.i.398, 0
  br label %float64_is_nan.exit.i.403

float64_is_nan.exit.i.403:                        ; preds = %lor.rhs.i.55.i.400, %land.rhs.i.53.i.397, %float64_is_signaling_nan.exit66.i.394
  %7 = phi i1 [ false, %float64_is_signaling_nan.exit66.i.394 ], [ true, %land.rhs.i.53.i.397 ], [ %tobool2.i.i.399, %lor.rhs.i.55.i.400 ]
  %and.i.i.401 = and i64 %b.coerce, 9221120237041090560
  %cmp.i.i.402 = icmp eq i64 %and.i.i.401, 9218868437227405312
  br i1 %cmp.i.i.402, label %land.rhs.i.i.406, label %float64_is_signaling_nan.exit.i.416

land.rhs.i.i.406:                                 ; preds = %float64_is_nan.exit.i.403
  %tobool.i.i.405 = icmp eq i32 %a.sroa.0.0.extract.trunc.i.501, 0
  br i1 %tobool.i.i.405, label %lor.rhs.i.i.412, label %float64_is_signaling_nan.exit.thread.i.409

float64_is_signaling_nan.exit.thread.i.409:       ; preds = %land.rhs.i.i.406
  %or.68.i.407 = or i32 %a.sroa.1.0.extract.trunc.i, 524288
  %or5.69.i.408 = or i32 %a.sroa.1.0.extract.trunc.i.499, 524288
  br label %if.then.i.420

lor.rhs.i.i.412:                                  ; preds = %land.rhs.i.i.406
  %and2.i.i.410 = and i64 %b.coerce, 2251795518717952
  %tobool3.i.i.411 = icmp ne i64 %and2.i.i.410, 0
  br label %float64_is_signaling_nan.exit.i.416

float64_is_signaling_nan.exit.i.416:              ; preds = %lor.rhs.i.i.412, %float64_is_nan.exit.i.403
  %8 = phi i1 [ false, %float64_is_nan.exit.i.403 ], [ %tobool3.i.i.411, %lor.rhs.i.i.412 ]
  %or.i.413 = or i32 %a.sroa.1.0.extract.trunc.i, 524288
  %or5.i.414 = or i32 %a.sroa.1.0.extract.trunc.i.499, 524288
  %or667.i.415 = or i1 %6, %8
  br i1 %or667.i.415, label %if.then.i.420, label %propagateFloat64NaN.exit435

if.then.i.420:                                    ; preds = %float64_is_signaling_nan.exit.i.416, %float64_is_signaling_nan.exit.thread.i.409
  %or574.i.417 = phi i32 [ %or5.69.i.408, %float64_is_signaling_nan.exit.thread.i.409 ], [ %or5.i.414, %float64_is_signaling_nan.exit.i.416 ]
  %or72.i.418 = phi i32 [ %or.68.i.407, %float64_is_signaling_nan.exit.thread.i.409 ], [ %or.i.413, %float64_is_signaling_nan.exit.i.416 ]
  %9 = phi i1 [ true, %float64_is_signaling_nan.exit.thread.i.409 ], [ %8, %float64_is_signaling_nan.exit.i.416 ]
  %10 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.419 = or i32 %10, 16
  store i32 %or.i.i.419, i32* @float_exception_flags, align 4, !tbaa !1
  br label %propagateFloat64NaN.exit435

propagateFloat64NaN.exit435:                      ; preds = %float64_is_signaling_nan.exit.i.416, %if.then.i.420
  %or66775.i.421 = phi i1 [ false, %float64_is_signaling_nan.exit.i.416 ], [ true, %if.then.i.420 ]
  %or573.i.422 = phi i32 [ %or5.i.414, %float64_is_signaling_nan.exit.i.416 ], [ %or574.i.417, %if.then.i.420 ]
  %or71.i.423 = phi i32 [ %or.i.413, %float64_is_signaling_nan.exit.i.416 ], [ %or72.i.418, %if.then.i.420 ]
  %11 = phi i1 [ false, %float64_is_signaling_nan.exit.i.416 ], [ %9, %if.then.i.420 ]
  %b.coerce.mux.i.424 = select i1 %11, i64 %b.coerce, i64 %a.coerce
  %or5.mux.i.425 = select i1 %11, i32 %or573.i.422, i32 %or71.i.423
  %a.coerce.b.coerce.i.426 = select i1 %7, i64 %b.coerce, i64 %a.coerce
  %or.or5.i.427 = select i1 %7, i32 %or573.i.422, i32 %or71.i.423
  %retval.sroa.0.0.i.428 = select i1 %or66775.i.421, i64 %b.coerce.mux.i.424, i64 %a.coerce.b.coerce.i.426
  %retval.sroa.5.0.i.429 = select i1 %or66775.i.421, i32 %or5.mux.i.425, i32 %or.or5.i.427
  %retval.sroa.5.0.insert.ext.i.430 = zext i32 %retval.sroa.5.0.i.429 to i64
  %retval.sroa.5.0.insert.shift.i.431 = shl nuw i64 %retval.sroa.5.0.insert.ext.i.430, 32
  %retval.sroa.0.0.insert.ext.i.432 = and i64 %retval.sroa.0.0.i.428, 4294967295
  %retval.sroa.0.0.insert.insert.i.433 = or i64 %retval.sroa.5.0.insert.shift.i.431, %retval.sroa.0.0.insert.ext.i.432
  br label %cleanup

if.end.17:                                        ; preds = %if.end
  %shl.i.375591 = shl nuw i64 %xor579, 63
  %add.i.376 = or i64 %shl.i.375591, 9218868437227405312
  br label %cleanup

if.end.19:                                        ; preds = %entry
  switch i32 %and.i.497, label %if.end.41 [
    i32 2047, label %if.then.21
    i32 0, label %if.then.30
  ]

if.then.21:                                       ; preds = %if.end.19
  %or22 = or i32 %and.i.500, %a.sroa.0.0.extract.trunc.i.501
  %tobool23 = icmp eq i32 %or22, 0
  br i1 %tobool23, label %if.end.26, label %if.then.24

if.then.24:                                       ; preds = %if.then.21
  %and.i.57.i = and i64 %a.coerce, 9221120237041090560
  %cmp.i.58.i = icmp eq i64 %and.i.57.i, 9218868437227405312
  br i1 %cmp.i.58.i, label %land.rhs.i.61.i, label %float64_is_signaling_nan.exit66.i

land.rhs.i.61.i:                                  ; preds = %if.then.24
  %tobool.i.60.i = icmp eq i32 %a.sroa.0.0.extract.trunc.i, 0
  br i1 %tobool.i.60.i, label %lor.rhs.i.64.i, label %float64_is_signaling_nan.exit66.i

lor.rhs.i.64.i:                                   ; preds = %land.rhs.i.61.i
  %and2.i.62.i = and i64 %a.coerce, 2251795518717952
  %tobool3.i.63.i = icmp ne i64 %and2.i.62.i, 0
  br label %float64_is_signaling_nan.exit66.i

float64_is_signaling_nan.exit66.i:                ; preds = %lor.rhs.i.64.i, %land.rhs.i.61.i, %if.then.24
  %12 = phi i1 [ false, %if.then.24 ], [ true, %land.rhs.i.61.i ], [ %tobool3.i.63.i, %lor.rhs.i.64.i ]
  %shl4.i.i.367 = shl nuw nsw i64 %a.sroa.1.0.extract.shift.i.498, 1
  %shl.i.i.368 = trunc i64 %shl4.i.i.367 to i32
  %cmp.i.50.i = icmp ugt i32 %shl.i.i.368, -2097153
  br i1 %cmp.i.50.i, label %land.rhs.i.53.i, label %float64_is_nan.exit.i

land.rhs.i.53.i:                                  ; preds = %float64_is_signaling_nan.exit66.i
  %tobool.i.52.i = icmp eq i32 %a.sroa.0.0.extract.trunc.i.501, 0
  br i1 %tobool.i.52.i, label %lor.rhs.i.55.i, label %float64_is_nan.exit.i

lor.rhs.i.55.i:                                   ; preds = %land.rhs.i.53.i
  %and.i.54.i = and i64 %a.sroa.1.0.extract.shift.i.498, 1048575
  %tobool2.i.i = icmp ne i64 %and.i.54.i, 0
  br label %float64_is_nan.exit.i

float64_is_nan.exit.i:                            ; preds = %lor.rhs.i.55.i, %land.rhs.i.53.i, %float64_is_signaling_nan.exit66.i
  %13 = phi i1 [ false, %float64_is_signaling_nan.exit66.i ], [ true, %land.rhs.i.53.i ], [ %tobool2.i.i, %lor.rhs.i.55.i ]
  %and.i.i.369 = and i64 %b.coerce, 9221120237041090560
  %cmp.i.i.370 = icmp eq i64 %and.i.i.369, 9218868437227405312
  br i1 %cmp.i.i.370, label %land.rhs.i.i, label %float64_is_signaling_nan.exit.i

land.rhs.i.i:                                     ; preds = %float64_is_nan.exit.i
  %tobool.i.i = icmp eq i32 %a.sroa.0.0.extract.trunc.i.501, 0
  br i1 %tobool.i.i, label %lor.rhs.i.i, label %float64_is_signaling_nan.exit.thread.i

float64_is_signaling_nan.exit.thread.i:           ; preds = %land.rhs.i.i
  %or.68.i = or i32 %a.sroa.1.0.extract.trunc.i, 524288
  %or5.69.i = or i32 %a.sroa.1.0.extract.trunc.i.499, 524288
  br label %if.then.i.373

lor.rhs.i.i:                                      ; preds = %land.rhs.i.i
  %and2.i.i = and i64 %b.coerce, 2251795518717952
  %tobool3.i.i = icmp ne i64 %and2.i.i, 0
  br label %float64_is_signaling_nan.exit.i

float64_is_signaling_nan.exit.i:                  ; preds = %lor.rhs.i.i, %float64_is_nan.exit.i
  %14 = phi i1 [ false, %float64_is_nan.exit.i ], [ %tobool3.i.i, %lor.rhs.i.i ]
  %or.i.371 = or i32 %a.sroa.1.0.extract.trunc.i, 524288
  %or5.i = or i32 %a.sroa.1.0.extract.trunc.i.499, 524288
  %or667.i = or i1 %12, %14
  br i1 %or667.i, label %if.then.i.373, label %propagateFloat64NaN.exit

if.then.i.373:                                    ; preds = %float64_is_signaling_nan.exit.i, %float64_is_signaling_nan.exit.thread.i
  %or574.i = phi i32 [ %or5.69.i, %float64_is_signaling_nan.exit.thread.i ], [ %or5.i, %float64_is_signaling_nan.exit.i ]
  %or72.i = phi i32 [ %or.68.i, %float64_is_signaling_nan.exit.thread.i ], [ %or.i.371, %float64_is_signaling_nan.exit.i ]
  %15 = phi i1 [ true, %float64_is_signaling_nan.exit.thread.i ], [ %14, %float64_is_signaling_nan.exit.i ]
  %16 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.372 = or i32 %16, 16
  store i32 %or.i.i.372, i32* @float_exception_flags, align 4, !tbaa !1
  br label %propagateFloat64NaN.exit

propagateFloat64NaN.exit:                         ; preds = %float64_is_signaling_nan.exit.i, %if.then.i.373
  %or66775.i = phi i1 [ false, %float64_is_signaling_nan.exit.i ], [ true, %if.then.i.373 ]
  %or573.i = phi i32 [ %or5.i, %float64_is_signaling_nan.exit.i ], [ %or574.i, %if.then.i.373 ]
  %or71.i = phi i32 [ %or.i.371, %float64_is_signaling_nan.exit.i ], [ %or72.i, %if.then.i.373 ]
  %17 = phi i1 [ false, %float64_is_signaling_nan.exit.i ], [ %15, %if.then.i.373 ]
  %b.coerce.mux.i = select i1 %17, i64 %b.coerce, i64 %a.coerce
  %or5.mux.i = select i1 %17, i32 %or573.i, i32 %or71.i
  %a.coerce.b.coerce.i = select i1 %13, i64 %b.coerce, i64 %a.coerce
  %or.or5.i = select i1 %13, i32 %or573.i, i32 %or71.i
  %retval.sroa.0.0.i = select i1 %or66775.i, i64 %b.coerce.mux.i, i64 %a.coerce.b.coerce.i
  %retval.sroa.5.0.i = select i1 %or66775.i, i32 %or5.mux.i, i32 %or.or5.i
  %retval.sroa.5.0.insert.ext.i = zext i32 %retval.sroa.5.0.i to i64
  %retval.sroa.5.0.insert.shift.i = shl nuw i64 %retval.sroa.5.0.insert.ext.i, 32
  %retval.sroa.0.0.insert.ext.i = and i64 %retval.sroa.0.0.i, 4294967295
  %retval.sroa.0.0.insert.insert.i = or i64 %retval.sroa.5.0.insert.shift.i, %retval.sroa.0.0.insert.ext.i
  br label %cleanup

if.end.26:                                        ; preds = %if.then.21
  %shl.i.364589 = shl nuw i64 %xor579, 63
  br label %cleanup

if.then.30:                                       ; preds = %if.end.19
  %or31 = or i32 %and.i.500, %a.sroa.0.0.extract.trunc.i.501
  %cmp32 = icmp eq i32 %or31, 0
  br i1 %cmp32, label %if.then.33, label %if.end.40

if.then.33:                                       ; preds = %if.then.30
  %or34 = or i32 %and.i, %a.sroa.0.0.extract.trunc.i
  %or35 = or i32 %or34, %and.i.506
  %cmp36 = icmp eq i32 %or35, 0
  br i1 %cmp36, label %invalid, label %if.end.38

invalid:                                          ; preds = %if.then.11, %if.then.33
  %18 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.363 = or i32 %18, 16
  store i32 %or.i.363, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.38:                                        ; preds = %if.then.33
  %19 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.362 = or i32 %19, 2
  store i32 %or.i.362, i32* @float_exception_flags, align 4, !tbaa !1
  %shl.i.358587 = shl nuw i64 %xor579, 63
  %add.i.359 = or i64 %shl.i.358587, 9218868437227405312
  br label %cleanup

if.end.40:                                        ; preds = %if.then.30
  %cmp.i.303 = icmp eq i32 %and.i.500, 0
  br i1 %cmp.i.303, label %if.then.i.319, label %if.else.7.i.346

if.then.i.319:                                    ; preds = %if.end.40
  %cmp.i.i.304 = icmp ult i32 %a.sroa.0.0.extract.trunc.i.501, 65536
  %shl.i.i.305 = shl i32 %a.sroa.0.0.extract.trunc.i.501, 16
  %shl.a.i.i.306 = select i1 %cmp.i.i.304, i32 %shl.i.i.305, i32 %a.sroa.0.0.extract.trunc.i.501
  %..i.i.307 = select i1 %cmp.i.i.304, i32 16, i32 0
  %cmp1.i.i.308 = icmp ult i32 %shl.a.i.i.306, 16777216
  %add3.i.i.309 = or i32 %..i.i.307, 8
  %shl4.i.i.310 = shl i32 %shl.a.i.i.306, 8
  %a.addr.1.i.i.311 = select i1 %cmp1.i.i.308, i32 %shl4.i.i.310, i32 %shl.a.i.i.306
  %shiftCount.1.i.i.312 = select i1 %cmp1.i.i.308, i32 %add3.i.i.309, i32 %..i.i.307
  %shr.i.i.313 = lshr i32 %a.addr.1.i.i.311, 24
  %idxprom.i.i.314 = zext i32 %shr.i.i.313 to i64
  %arrayidx.i.i.315 = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i64 0, i64 %idxprom.i.i.314
  %20 = load i32, i32* %arrayidx.i.i.315, align 4, !tbaa !1
  %add6.i.i.316 = add nsw i32 %20, %shiftCount.1.i.i.312
  %sub.i.317 = add nsw i32 %add6.i.i.316, -11
  %cmp1.i.318 = icmp slt i32 %add6.i.i.316, 11
  br i1 %cmp1.i.318, label %if.then.2.i.324, label %if.else.i.326

if.then.2.i.324:                                  ; preds = %if.then.i.319
  %sub3.i.320 = sub i32 11, %add6.i.i.316
  %shr.i.321 = lshr i32 %a.sroa.0.0.extract.trunc.i.501, %sub3.i.320
  %and.i.322 = and i32 %sub.i.317, 31
  %shl.i.323 = shl i32 %a.sroa.0.0.extract.trunc.i.501, %and.i.322
  br label %if.end.i.329

if.else.i.326:                                    ; preds = %if.then.i.319
  %shl4.i.325 = shl i32 %a.sroa.0.0.extract.trunc.i.501, %sub.i.317
  br label %if.end.i.329

if.end.i.329:                                     ; preds = %if.else.i.326, %if.then.2.i.324
  %bSig0.0 = phi i32 [ %shr.i.321, %if.then.2.i.324 ], [ %shl4.i.325, %if.else.i.326 ]
  %storemerge.28.i.327 = phi i32 [ %shl.i.323, %if.then.2.i.324 ], [ 0, %if.else.i.326 ]
  %sub6.i.328 = sub i32 -20, %add6.i.i.316
  br label %if.end.41

if.else.7.i.346:                                  ; preds = %if.end.40
  %cmp.i.32.i.330 = icmp ult i32 %and.i.500, 65536
  %shl.i.33.i.331581 = shl nuw nsw i64 %a.sroa.1.0.extract.shift.i.498, 16
  %shl.i.33.i.331 = trunc i64 %shl.i.33.i.331581 to i32
  %shl.a.i.34.i.332 = select i1 %cmp.i.32.i.330, i32 %shl.i.33.i.331, i32 %and.i.500
  %..i.35.i.333 = select i1 %cmp.i.32.i.330, i32 16, i32 0
  %cmp1.i.36.i.334 = icmp ult i32 %shl.a.i.34.i.332, 16777216
  %add3.i.37.i.335 = or i32 %..i.35.i.333, 8
  %shl4.i.38.i.336 = shl i32 %shl.a.i.34.i.332, 8
  %a.addr.1.i.39.i.337 = select i1 %cmp1.i.36.i.334, i32 %shl4.i.38.i.336, i32 %shl.a.i.34.i.332
  %shiftCount.1.i.40.i.338 = select i1 %cmp1.i.36.i.334, i32 %add3.i.37.i.335, i32 %..i.35.i.333
  %shr.i.41.i.339 = lshr i32 %a.addr.1.i.39.i.337, 24
  %idxprom.i.42.i.340 = zext i32 %shr.i.41.i.339 to i64
  %arrayidx.i.43.i.341 = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i64 0, i64 %idxprom.i.42.i.340
  %21 = load i32, i32* %arrayidx.i.43.i.341, align 4, !tbaa !1
  %add6.i.44.i.342 = add nsw i32 %21, %shiftCount.1.i.40.i.338
  %sub9.i.343 = add nsw i32 %add6.i.44.i.342, -11
  %shl.i.29.i.344 = shl i32 %a.sroa.0.0.extract.trunc.i.501, %sub9.i.343
  %cmp.i.30.i.345 = icmp eq i32 %sub9.i.343, 0
  br i1 %cmp.i.30.i.345, label %shortShift64Left.exit.i.355, label %cond.false.i.i.352

cond.false.i.i.352:                               ; preds = %if.else.7.i.346
  %shl1.i.i.347 = shl i32 %and.i.500, %sub9.i.343
  %sub.i.i.348 = sub i32 11, %add6.i.44.i.342
  %and.i.i.349 = and i32 %sub.i.i.348, 31
  %shr.i.31.i.350 = lshr i32 %a.sroa.0.0.extract.trunc.i.501, %and.i.i.349
  %or.i.i.351 = or i32 %shr.i.31.i.350, %shl1.i.i.347
  br label %shortShift64Left.exit.i.355

shortShift64Left.exit.i.355:                      ; preds = %cond.false.i.i.352, %if.else.7.i.346
  %cond.i.i.353 = phi i32 [ %or.i.i.351, %cond.false.i.i.352 ], [ %and.i.500, %if.else.7.i.346 ]
  %sub10.i.354 = sub i32 12, %add6.i.44.i.342
  br label %if.end.41

if.end.41:                                        ; preds = %shortShift64Left.exit.i.355, %if.end.i.329, %if.end.19
  %bSig0.2 = phi i32 [ %and.i.500, %if.end.19 ], [ %bSig0.0, %if.end.i.329 ], [ %cond.i.i.353, %shortShift64Left.exit.i.355 ]
  %bSig1.1 = phi i32 [ %a.sroa.0.0.extract.trunc.i.501, %if.end.19 ], [ %storemerge.28.i.327, %if.end.i.329 ], [ %shl.i.29.i.344, %shortShift64Left.exit.i.355 ]
  %bExp.0 = phi i32 [ %and.i.497, %if.end.19 ], [ %sub6.i.328, %if.end.i.329 ], [ %sub10.i.354, %shortShift64Left.exit.i.355 ]
  %cmp42 = icmp eq i32 %and.i.506, 0
  br i1 %cmp42, label %if.then.43, label %if.end.49

if.then.43:                                       ; preds = %if.end.41
  %or44 = or i32 %and.i, %a.sroa.0.0.extract.trunc.i
  %cmp45 = icmp eq i32 %or44, 0
  br i1 %cmp45, label %if.then.46, label %if.end.48

if.then.46:                                       ; preds = %if.then.43
  %shl.i.302585 = shl nuw i64 %xor579, 63
  br label %cleanup

if.end.48:                                        ; preds = %if.then.43
  %cmp.i.289 = icmp eq i32 %and.i, 0
  br i1 %cmp.i.289, label %if.then.i, label %if.else.7.i

if.then.i:                                        ; preds = %if.end.48
  %cmp.i.i.290 = icmp ult i32 %a.sroa.0.0.extract.trunc.i, 65536
  %shl.i.i.291 = shl i32 %a.sroa.0.0.extract.trunc.i, 16
  %shl.a.i.i = select i1 %cmp.i.i.290, i32 %shl.i.i.291, i32 %a.sroa.0.0.extract.trunc.i
  %..i.i = select i1 %cmp.i.i.290, i32 16, i32 0
  %cmp1.i.i = icmp ult i32 %shl.a.i.i, 16777216
  %add3.i.i = or i32 %..i.i, 8
  %shl4.i.i = shl i32 %shl.a.i.i, 8
  %a.addr.1.i.i = select i1 %cmp1.i.i, i32 %shl4.i.i, i32 %shl.a.i.i
  %shiftCount.1.i.i = select i1 %cmp1.i.i, i32 %add3.i.i, i32 %..i.i
  %shr.i.i.292 = lshr i32 %a.addr.1.i.i, 24
  %idxprom.i.i = zext i32 %shr.i.i.292 to i64
  %arrayidx.i.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i64 0, i64 %idxprom.i.i
  %22 = load i32, i32* %arrayidx.i.i, align 4, !tbaa !1
  %add6.i.i = add nsw i32 %22, %shiftCount.1.i.i
  %sub.i.293 = add nsw i32 %add6.i.i, -11
  %cmp1.i.294 = icmp slt i32 %add6.i.i, 11
  br i1 %cmp1.i.294, label %if.then.2.i, label %if.else.i

if.then.2.i:                                      ; preds = %if.then.i
  %sub3.i = sub i32 11, %add6.i.i
  %shr.i.295 = lshr i32 %a.sroa.0.0.extract.trunc.i, %sub3.i
  %and.i.296 = and i32 %sub.i.293, 31
  %shl.i.297 = shl i32 %a.sroa.0.0.extract.trunc.i, %and.i.296
  br label %if.end.i.299

if.else.i:                                        ; preds = %if.then.i
  %shl4.i.298 = shl i32 %a.sroa.0.0.extract.trunc.i, %sub.i.293
  br label %if.end.i.299

if.end.i.299:                                     ; preds = %if.else.i, %if.then.2.i
  %aSig0.0 = phi i32 [ %shr.i.295, %if.then.2.i ], [ %shl4.i.298, %if.else.i ]
  %storemerge.28.i = phi i32 [ %shl.i.297, %if.then.2.i ], [ 0, %if.else.i ]
  %sub6.i = sub i32 -20, %add6.i.i
  br label %if.end.49

if.else.7.i:                                      ; preds = %if.end.48
  %cmp.i.32.i = icmp ult i32 %and.i, 65536
  %shl.i.33.i583 = shl nuw nsw i64 %a.sroa.1.0.extract.shift.i, 16
  %shl.i.33.i = trunc i64 %shl.i.33.i583 to i32
  %shl.a.i.34.i = select i1 %cmp.i.32.i, i32 %shl.i.33.i, i32 %and.i
  %..i.35.i = select i1 %cmp.i.32.i, i32 16, i32 0
  %cmp1.i.36.i = icmp ult i32 %shl.a.i.34.i, 16777216
  %add3.i.37.i = or i32 %..i.35.i, 8
  %shl4.i.38.i = shl i32 %shl.a.i.34.i, 8
  %a.addr.1.i.39.i = select i1 %cmp1.i.36.i, i32 %shl4.i.38.i, i32 %shl.a.i.34.i
  %shiftCount.1.i.40.i = select i1 %cmp1.i.36.i, i32 %add3.i.37.i, i32 %..i.35.i
  %shr.i.41.i = lshr i32 %a.addr.1.i.39.i, 24
  %idxprom.i.42.i = zext i32 %shr.i.41.i to i64
  %arrayidx.i.43.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i64 0, i64 %idxprom.i.42.i
  %23 = load i32, i32* %arrayidx.i.43.i, align 4, !tbaa !1
  %add6.i.44.i = add nsw i32 %23, %shiftCount.1.i.40.i
  %sub9.i.300 = add nsw i32 %add6.i.44.i, -11
  %shl.i.29.i = shl i32 %a.sroa.0.0.extract.trunc.i, %sub9.i.300
  %cmp.i.30.i = icmp eq i32 %sub9.i.300, 0
  br i1 %cmp.i.30.i, label %shortShift64Left.exit.i, label %cond.false.i.i

cond.false.i.i:                                   ; preds = %if.else.7.i
  %shl1.i.i = shl i32 %and.i, %sub9.i.300
  %sub.i.i.301 = sub i32 11, %add6.i.44.i
  %and.i.i = and i32 %sub.i.i.301, 31
  %shr.i.31.i = lshr i32 %a.sroa.0.0.extract.trunc.i, %and.i.i
  %or.i.i = or i32 %shr.i.31.i, %shl1.i.i
  br label %shortShift64Left.exit.i

shortShift64Left.exit.i:                          ; preds = %cond.false.i.i, %if.else.7.i
  %cond.i.i = phi i32 [ %or.i.i, %cond.false.i.i ], [ %and.i, %if.else.7.i ]
  %sub10.i = sub i32 12, %add6.i.44.i
  br label %if.end.49

if.end.49:                                        ; preds = %shortShift64Left.exit.i, %if.end.i.299, %if.end.41
  %aSig1.1 = phi i32 [ %a.sroa.0.0.extract.trunc.i, %if.end.41 ], [ %storemerge.28.i, %if.end.i.299 ], [ %shl.i.29.i, %shortShift64Left.exit.i ]
  %aSig0.2 = phi i32 [ %and.i, %if.end.41 ], [ %aSig0.0, %if.end.i.299 ], [ %cond.i.i, %shortShift64Left.exit.i ]
  %aExp.0 = phi i32 [ %and.i.506, %if.end.41 ], [ %sub6.i, %if.end.i.299 ], [ %sub10.i, %shortShift64Left.exit.i ]
  %sub = sub nsw i32 %aExp.0, %bExp.0
  %shl.i.282 = shl i32 %aSig1.1, 11
  %or50 = shl i32 %aSig0.2, 11
  %shr.i.284 = lshr i32 %aSig1.1, 21
  %shl1.i.283 = or i32 %shr.i.284, %or50
  %or.i.285 = or i32 %shl1.i.283, -2147483648
  %shl.i.276 = shl i32 %bSig1.1, 11
  %or51 = shl i32 %bSig0.2, 11
  %shl1.i = or i32 %or51, -2147483648
  %shr.i.277 = lshr i32 %bSig1.1, 21
  %or.i.278 = or i32 %shr.i.277, %shl1.i
  %cmp.i.273 = icmp ult i32 %or.i.278, %or.i.285
  br i1 %cmp.i.273, label %if.then.54, label %lor.rhs.i

lor.rhs.i:                                        ; preds = %if.end.49
  %add = add nsw i32 %sub, 1021
  %cmp1.i.274 = icmp eq i32 %or.i.278, %or.i.285
  %cmp2.i.275 = icmp ule i32 %shl.i.276, %shl.i.282
  %cmp2..i = and i1 %cmp2.i.275, %cmp1.i.274
  br i1 %cmp2..i, label %if.then.54, label %if.end.55

if.then.54:                                       ; preds = %if.end.49, %lor.rhs.i
  %shl.i.270 = shl i32 %shr.i.284, 31
  %24 = shl i32 %aSig1.1, 10
  %shr.i.271 = and i32 %24, 2147482624
  %or.i.272 = or i32 %shl.i.270, %shr.i.271
  %shr3.i = lshr i32 %or.i.285, 1
  %inc = add nsw i32 %sub, 1022
  br label %if.end.55

if.end.55:                                        ; preds = %lor.rhs.i, %if.then.54
  %aSig1.2 = phi i32 [ %shl.i.282, %lor.rhs.i ], [ %or.i.272, %if.then.54 ]
  %aSig0.3 = phi i32 [ %or.i.285, %lor.rhs.i ], [ %shr3.i, %if.then.54 ]
  %zExp.0 = phi i32 [ %add, %lor.rhs.i ], [ %inc, %if.then.54 ]
  %cmp.i.219 = icmp ugt i32 %or.i.278, %aSig0.3
  %shr.i.220 = lshr i32 %shl1.i, 16
  br i1 %cmp.i.219, label %if.end.i.223, label %if.end.55.estimateDiv64To32.exit269_crit_edge

if.end.55.estimateDiv64To32.exit269_crit_edge:    ; preds = %if.end.55
  %.pre609 = and i32 %or.i.278, 65535
  br label %estimateDiv64To32.exit269

if.end.i.223:                                     ; preds = %if.end.55
  %shl.i.221 = shl nuw i32 %shr.i.220, 16
  %cmp1.i.222 = icmp ugt i32 %shl.i.221, %aSig0.3
  br i1 %cmp1.i.222, label %cond.false.i.226, label %cond.end.i.241

cond.false.i.226:                                 ; preds = %if.end.i.223
  %div.i.224 = udiv i32 %aSig0.3, %shr.i.220
  %shl2.i.225 = shl i32 %div.i.224, 16
  br label %cond.end.i.241

cond.end.i.241:                                   ; preds = %cond.false.i.226, %if.end.i.223
  %cond.i.227 = phi i32 [ %shl2.i.225, %cond.false.i.226 ], [ -65536, %if.end.i.223 ]
  %shr3.i.i.228 = lshr exact i32 %cond.i.227, 16
  %conv5.i.i.229 = and i32 %or.i.278, 65535
  %mul9.i.i.230 = mul nuw i32 %shr3.i.i.228, %conv5.i.i.229
  %mul15.i.i.231 = mul nuw i32 %shr3.i.i.228, %shr.i.220
  %shr17.i.i.232 = lshr i32 %mul9.i.i.230, 16
  %shl20.i.i.233 = shl i32 %mul9.i.i.230, 16
  %sub.i.i.234 = sub i32 %aSig1.2, %shl20.i.i.233
  %cmp.i.39.i.235 = icmp ult i32 %aSig1.2, %shl20.i.i.233
  %conv.neg.i.i.236 = sext i1 %cmp.i.39.i.235 to i32
  %add24.i.neg.i.237 = sub i32 %aSig0.3, %mul15.i.i.231
  %sub1.i.i.238 = sub i32 %add24.i.neg.i.237, %shr17.i.i.232
  %sub2.i.i.239 = add i32 %sub1.i.i.238, %conv.neg.i.i.236
  %cmp3.45.i.240 = icmp slt i32 %sub2.i.i.239, 0
  br i1 %cmp3.45.i.240, label %while.body.lr.ph.i.243, label %while.end.i.262

while.body.lr.ph.i.243:                           ; preds = %cond.end.i.241
  %shl4.i.242 = shl i32 %or.i.278, 16
  br label %while.body.i.254

while.body.i.254:                                 ; preds = %while.body.i.254, %while.body.lr.ph.i.243
  %z.048.i.244 = phi i32 [ %cond.i.227, %while.body.lr.ph.i.243 ], [ %sub.i.247, %while.body.i.254 ]
  %rem0.047.i.245 = phi i32 [ %sub2.i.i.239, %while.body.lr.ph.i.243 ], [ %add2.i.i.252, %while.body.i.254 ]
  %rem1.046.i.246 = phi i32 [ %sub.i.i.234, %while.body.lr.ph.i.243 ], [ %add.i.37.i.248, %while.body.i.254 ]
  %sub.i.247 = add i32 %z.048.i.244, -65536
  %add.i.37.i.248 = add i32 %rem1.046.i.246, %shl4.i.242
  %add1.i.i.249 = add i32 %rem0.047.i.245, %shr.i.220
  %cmp.i.38.i.250 = icmp ult i32 %add.i.37.i.248, %rem1.046.i.246
  %conv.i.i.251 = zext i1 %cmp.i.38.i.250 to i32
  %add2.i.i.252 = add i32 %add1.i.i.249, %conv.i.i.251
  %cmp3.i.253 = icmp slt i32 %add2.i.i.252, 0
  br i1 %cmp3.i.253, label %while.body.i.254, label %while.end.i.262.loopexit

while.end.i.262.loopexit:                         ; preds = %while.body.i.254
  %add2.i.i.252.lcssa = phi i32 [ %add2.i.i.252, %while.body.i.254 ]
  %add.i.37.i.248.lcssa = phi i32 [ %add.i.37.i.248, %while.body.i.254 ]
  %sub.i.247.lcssa = phi i32 [ %sub.i.247, %while.body.i.254 ]
  br label %while.end.i.262

while.end.i.262:                                  ; preds = %while.end.i.262.loopexit, %cond.end.i.241
  %z.0.lcssa.i.255 = phi i32 [ %cond.i.227, %cond.end.i.241 ], [ %sub.i.247.lcssa, %while.end.i.262.loopexit ]
  %rem0.0.lcssa.i.256 = phi i32 [ %sub2.i.i.239, %cond.end.i.241 ], [ %add2.i.i.252.lcssa, %while.end.i.262.loopexit ]
  %rem1.0.lcssa.i.257 = phi i32 [ %sub.i.i.234, %cond.end.i.241 ], [ %add.i.37.i.248.lcssa, %while.end.i.262.loopexit ]
  %shl5.i.258 = shl i32 %rem0.0.lcssa.i.256, 16
  %shr6.i.259 = lshr i32 %rem1.0.lcssa.i.257, 16
  %or.i.260 = or i32 %shr6.i.259, %shl5.i.258
  %cmp8.i.261 = icmp ugt i32 %shl.i.221, %or.i.260
  br i1 %cmp8.i.261, label %cond.false.10.i.264, label %cond.end.12.i.267

cond.false.10.i.264:                              ; preds = %while.end.i.262
  %div11.i.263 = udiv i32 %or.i.260, %shr.i.220
  br label %cond.end.12.i.267

cond.end.12.i.267:                                ; preds = %cond.false.10.i.264, %while.end.i.262
  %cond13.i.265 = phi i32 [ %div11.i.263, %cond.false.10.i.264 ], [ 65535, %while.end.i.262 ]
  %or14.i.266 = or i32 %cond13.i.265, %z.0.lcssa.i.255
  br label %estimateDiv64To32.exit269

estimateDiv64To32.exit269:                        ; preds = %if.end.55.estimateDiv64To32.exit269_crit_edge, %cond.end.12.i.267
  %conv5.i.6.i.196.pre-phi = phi i32 [ %.pre609, %if.end.55.estimateDiv64To32.exit269_crit_edge ], [ %conv5.i.i.229, %cond.end.12.i.267 ]
  %retval.0.i.268 = phi i32 [ -1, %if.end.55.estimateDiv64To32.exit269_crit_edge ], [ %or14.i.266, %cond.end.12.i.267 ]
  %25 = lshr i32 %bSig1.1, 5
  %shr.i.i.177 = and i32 %25, 65535
  %shr3.i.i.178 = lshr i32 %retval.0.i.268, 16
  %conv5.i.i.179 = and i32 %shl.i.276, 63488
  %conv6.i.i.180 = and i32 %retval.0.i.268, 65535
  %mul.i.i.181 = mul nuw i32 %conv6.i.i.180, %conv5.i.i.179
  %mul9.i.i.182 = mul nuw i32 %shr3.i.i.178, %conv5.i.i.179
  %mul12.i.i.183 = mul nuw i32 %conv6.i.i.180, %shr.i.i.177
  %mul15.i.i.184 = mul nuw i32 %shr3.i.i.178, %shr.i.i.177
  %add.i.i.185 = add i32 %mul9.i.i.182, %mul12.i.i.183
  %cmp.i.i.186 = icmp ult i32 %add.i.i.185, %mul12.i.i.183
  %conv16.i.i.187 = zext i1 %cmp.i.i.186 to i32
  %shl.i.i.188 = shl nuw nsw i32 %conv16.i.i.187, 16
  %shr17.i.i.189 = lshr i32 %add.i.i.185, 16
  %add18.i.i.190 = or i32 %shl.i.i.188, %shr17.i.i.189
  %shl20.i.i.191 = shl i32 %add.i.i.185, 16
  %add21.i.i.192 = add i32 %shl20.i.i.191, %mul.i.i.181
  %cmp22.i.i.193 = icmp ult i32 %add21.i.i.192, %shl20.i.i.191
  %conv23.i.i.194 = zext i1 %cmp22.i.i.193 to i32
  %mul.i.8.i.197 = mul nuw i32 %conv6.i.i.180, %conv5.i.6.i.196.pre-phi
  %mul9.i.9.i.198 = mul nuw i32 %shr3.i.i.178, %conv5.i.6.i.196.pre-phi
  %mul12.i.10.i.199 = mul nuw i32 %conv6.i.i.180, %shr.i.220
  %mul15.i.11.i.200 = mul nuw i32 %shr3.i.i.178, %shr.i.220
  %add.i.12.i.201 = add i32 %mul9.i.9.i.198, %mul12.i.10.i.199
  %cmp.i.13.i.202 = icmp ult i32 %add.i.12.i.201, %mul12.i.10.i.199
  %conv16.i.14.i.203 = zext i1 %cmp.i.13.i.202 to i32
  %shl.i.15.i.204 = shl nuw nsw i32 %conv16.i.14.i.203, 16
  %shr17.i.16.i.205 = lshr i32 %add.i.12.i.201, 16
  %add18.i.17.i.206 = or i32 %shl.i.15.i.204, %shr17.i.16.i.205
  %shl20.i.19.i.208 = shl i32 %add.i.12.i.201, 16
  %add21.i.20.i.209 = add i32 %shl20.i.19.i.208, %mul.i.8.i.197
  %cmp22.i.21.i.210 = icmp ult i32 %add21.i.20.i.209, %shl20.i.19.i.208
  %add19.i.i.213 = add i32 %add21.i.20.i.209, %mul15.i.i.184
  %add24.i.i.214 = add i32 %add19.i.i.213, %add18.i.i.190
  %add.i.2.i.215 = add i32 %add24.i.i.214, %conv23.i.i.194
  %cmp.i.3.i.216 = icmp ult i32 %add.i.2.i.215, %add21.i.20.i.209
  %sub.i.165 = sub i32 0, %add21.i.i.192
  %cmp.i.166 = icmp ne i32 %add21.i.i.192, 0
  %conv.i.167 = zext i1 %cmp.i.166 to i32
  %sub1.i.168 = sub i32 %aSig1.2, %add.i.2.i.215
  %cmp2.i.169 = icmp ult i32 %aSig1.2, %add.i.2.i.215
  %conv23.i.22.i.211.neg = sext i1 %cmp22.i.21.i.210 to i32
  %conv.i.i.217.neg = sext i1 %cmp.i.3.i.216 to i32
  %cmp5.i.171 = icmp ult i32 %sub1.i.168, %conv.i.167
  %conv6.neg.i.172 = sext i1 %cmp5.i.171 to i32
  %sub8.i.173 = sub i32 %sub1.i.168, %conv.i.167
  %conv3.neg.i.174 = sext i1 %cmp2.i.169 to i32
  %add19.i.18.i.207.neg = sub i32 %aSig0.3, %mul15.i.11.i.200
  %add24.i.23.i.212.neg = sub i32 %add19.i.18.i.207.neg, %add18.i.17.i.206
  %add2.i.i.218.neg = add i32 %add24.i.23.i.212.neg, %conv23.i.22.i.211.neg
  %sub4.i.170 = add i32 %add2.i.i.218.neg, %conv.i.i.217.neg
  %sub7.i.175 = add i32 %sub4.i.170, %conv3.neg.i.174
  %sub9.i.176 = add i32 %sub7.i.175, %conv6.neg.i.172
  %cmp57.601 = icmp slt i32 %sub9.i.176, 0
  br i1 %cmp57.601, label %while.body.preheader, label %while.end

while.body.preheader:                             ; preds = %estimateDiv64To32.exit269
  br label %while.body

while.body:                                       ; preds = %while.body.preheader, %while.body
  %rem2.0605 = phi i32 [ %add.i.154, %while.body ], [ %sub.i.165, %while.body.preheader ]
  %rem1.0604 = phi i32 [ %add5.i.160, %while.body ], [ %sub8.i.173, %while.body.preheader ]
  %rem0.0603 = phi i32 [ %add9.i.164, %while.body ], [ %sub9.i.176, %while.body.preheader ]
  %zSig0.0602 = phi i32 [ %dec, %while.body ], [ %retval.0.i.268, %while.body.preheader ]
  %dec = add i32 %zSig0.0602, -1
  %add.i.154 = add i32 %rem2.0605, %shl.i.276
  %cmp.i.155 = icmp ult i32 %add.i.154, %rem2.0605
  %conv.i.156 = zext i1 %cmp.i.155 to i32
  %add1.i.157 = add i32 %rem1.0604, %or.i.278
  %cmp2.i.158 = icmp ult i32 %add1.i.157, %rem1.0604
  %conv3.i.159 = zext i1 %cmp2.i.158 to i32
  %add5.i.160 = add i32 %conv.i.156, %add1.i.157
  %cmp6.i.161 = icmp ult i32 %add5.i.160, %conv.i.156
  %conv7.i.162 = zext i1 %cmp6.i.161 to i32
  %add8.i.163 = add i32 %conv3.i.159, %rem0.0603
  %add9.i.164 = add i32 %add8.i.163, %conv7.i.162
  %cmp57 = icmp slt i32 %add9.i.164, 0
  br i1 %cmp57, label %while.body, label %while.end.loopexit

while.end.loopexit:                               ; preds = %while.body
  %add5.i.160.lcssa = phi i32 [ %add5.i.160, %while.body ]
  %add.i.154.lcssa = phi i32 [ %add.i.154, %while.body ]
  %dec.lcssa = phi i32 [ %dec, %while.body ]
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %estimateDiv64To32.exit269
  %rem2.0.lcssa = phi i32 [ %sub.i.165, %estimateDiv64To32.exit269 ], [ %add.i.154.lcssa, %while.end.loopexit ]
  %rem1.0.lcssa = phi i32 [ %sub8.i.173, %estimateDiv64To32.exit269 ], [ %add5.i.160.lcssa, %while.end.loopexit ]
  %zSig0.0.lcssa = phi i32 [ %retval.0.i.268, %estimateDiv64To32.exit269 ], [ %dec.lcssa, %while.end.loopexit ]
  %cmp.i.141 = icmp ugt i32 %or.i.278, %rem1.0.lcssa
  br i1 %cmp.i.141, label %if.end.i, label %if.end.70

if.end.i:                                         ; preds = %while.end
  %shl.i.143 = shl nuw i32 %shr.i.220, 16
  %cmp1.i = icmp ugt i32 %shl.i.143, %rem1.0.lcssa
  br i1 %cmp1.i, label %cond.false.i, label %cond.end.i

cond.false.i:                                     ; preds = %if.end.i
  %div.i = udiv i32 %rem1.0.lcssa, %shr.i.220
  %shl2.i = shl i32 %div.i, 16
  br label %cond.end.i

cond.end.i:                                       ; preds = %cond.false.i, %if.end.i
  %cond.i = phi i32 [ %shl2.i, %cond.false.i ], [ -65536, %if.end.i ]
  %shr3.i.i.144 = lshr exact i32 %cond.i, 16
  %mul9.i.i.146 = mul nuw i32 %shr3.i.i.144, %conv5.i.6.i.196.pre-phi
  %mul15.i.i.147 = mul nuw i32 %shr3.i.i.144, %shr.i.220
  %shr17.i.i.148 = lshr i32 %mul9.i.i.146, 16
  %shl20.i.i.149 = shl i32 %mul9.i.i.146, 16
  %sub.i.i = sub i32 %rem2.0.lcssa, %shl20.i.i.149
  %cmp.i.39.i = icmp ult i32 %rem2.0.lcssa, %shl20.i.i.149
  %conv.neg.i.i = sext i1 %cmp.i.39.i to i32
  %add24.i.neg.i = sub i32 %rem1.0.lcssa, %mul15.i.i.147
  %sub1.i.i = sub i32 %add24.i.neg.i, %shr17.i.i.148
  %sub2.i.i = add i32 %sub1.i.i, %conv.neg.i.i
  %cmp3.45.i = icmp slt i32 %sub2.i.i, 0
  br i1 %cmp3.45.i, label %while.body.lr.ph.i, label %while.end.i

while.body.lr.ph.i:                               ; preds = %cond.end.i
  %shl4.i = shl i32 %or.i.278, 16
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i, %while.body.lr.ph.i
  %z.048.i = phi i32 [ %cond.i, %while.body.lr.ph.i ], [ %sub.i.150, %while.body.i ]
  %rem0.047.i = phi i32 [ %sub2.i.i, %while.body.lr.ph.i ], [ %add2.i.i.152, %while.body.i ]
  %rem1.046.i = phi i32 [ %sub.i.i, %while.body.lr.ph.i ], [ %add.i.37.i, %while.body.i ]
  %sub.i.150 = add i32 %z.048.i, -65536
  %add.i.37.i = add i32 %rem1.046.i, %shl4.i
  %add1.i.i = add i32 %rem0.047.i, %shr.i.220
  %cmp.i.38.i = icmp ult i32 %add.i.37.i, %rem1.046.i
  %conv.i.i.151 = zext i1 %cmp.i.38.i to i32
  %add2.i.i.152 = add i32 %add1.i.i, %conv.i.i.151
  %cmp3.i = icmp slt i32 %add2.i.i.152, 0
  br i1 %cmp3.i, label %while.body.i, label %while.end.i.loopexit

while.end.i.loopexit:                             ; preds = %while.body.i
  %add2.i.i.152.lcssa = phi i32 [ %add2.i.i.152, %while.body.i ]
  %add.i.37.i.lcssa = phi i32 [ %add.i.37.i, %while.body.i ]
  %sub.i.150.lcssa = phi i32 [ %sub.i.150, %while.body.i ]
  br label %while.end.i

while.end.i:                                      ; preds = %while.end.i.loopexit, %cond.end.i
  %z.0.lcssa.i = phi i32 [ %cond.i, %cond.end.i ], [ %sub.i.150.lcssa, %while.end.i.loopexit ]
  %rem0.0.lcssa.i = phi i32 [ %sub2.i.i, %cond.end.i ], [ %add2.i.i.152.lcssa, %while.end.i.loopexit ]
  %rem1.0.lcssa.i = phi i32 [ %sub.i.i, %cond.end.i ], [ %add.i.37.i.lcssa, %while.end.i.loopexit ]
  %shl5.i = shl i32 %rem0.0.lcssa.i, 16
  %shr6.i = lshr i32 %rem1.0.lcssa.i, 16
  %or.i.153 = or i32 %shr6.i, %shl5.i
  %cmp8.i = icmp ugt i32 %shl.i.143, %or.i.153
  br i1 %cmp8.i, label %cond.false.10.i, label %estimateDiv64To32.exit

cond.false.10.i:                                  ; preds = %while.end.i
  %div11.i = udiv i32 %or.i.153, %shr.i.220
  br label %estimateDiv64To32.exit

estimateDiv64To32.exit:                           ; preds = %while.end.i, %cond.false.10.i
  %cond13.i = phi i32 [ %div11.i, %cond.false.10.i ], [ 65535, %while.end.i ]
  %or14.i = or i32 %cond13.i, %z.0.lcssa.i
  %and = and i32 %or14.i, 1023
  %cmp59 = icmp ult i32 %and, 5
  br i1 %cmp59, label %if.then.60, label %if.end.70

if.then.60:                                       ; preds = %estimateDiv64To32.exit
  %shr3.i.i = lshr i32 %or14.i, 16
  %conv6.i.i = and i32 %or14.i, 65535
  %mul.i.i = mul nuw i32 %conv6.i.i, %conv5.i.i.179
  %mul9.i.i = mul nuw i32 %shr3.i.i, %conv5.i.i.179
  %mul12.i.i = mul nuw i32 %conv6.i.i, %shr.i.i.177
  %mul15.i.i = mul nuw i32 %shr3.i.i, %shr.i.i.177
  %add.i.i = add i32 %mul9.i.i, %mul12.i.i
  %cmp.i.i = icmp ult i32 %add.i.i, %mul12.i.i
  %conv16.i.i = zext i1 %cmp.i.i to i32
  %shl.i.i = shl nuw nsw i32 %conv16.i.i, 16
  %shr17.i.i = lshr i32 %add.i.i, 16
  %add18.i.i = or i32 %shl.i.i, %shr17.i.i
  %shl20.i.i = shl i32 %add.i.i, 16
  %add21.i.i = add i32 %shl20.i.i, %mul.i.i
  %cmp22.i.i = icmp ult i32 %add21.i.i, %shl20.i.i
  %conv23.i.i = zext i1 %cmp22.i.i to i32
  %mul.i.8.i = mul nuw i32 %conv6.i.i, %conv5.i.6.i.196.pre-phi
  %mul9.i.9.i = mul nuw i32 %shr3.i.i, %conv5.i.6.i.196.pre-phi
  %mul12.i.10.i = mul nuw i32 %conv6.i.i, %shr.i.220
  %mul15.i.11.i = mul nuw i32 %shr3.i.i, %shr.i.220
  %add.i.12.i = add i32 %mul9.i.9.i, %mul12.i.10.i
  %cmp.i.13.i = icmp ult i32 %add.i.12.i, %mul12.i.10.i
  %conv16.i.14.i = zext i1 %cmp.i.13.i to i32
  %shl.i.15.i = shl nuw nsw i32 %conv16.i.14.i, 16
  %shr17.i.16.i = lshr i32 %add.i.12.i, 16
  %add18.i.17.i = or i32 %shl.i.15.i, %shr17.i.16.i
  %shl20.i.19.i = shl i32 %add.i.12.i, 16
  %add21.i.20.i = add i32 %shl20.i.19.i, %mul.i.8.i
  %cmp22.i.21.i = icmp ult i32 %add21.i.20.i, %shl20.i.19.i
  %add19.i.i = add i32 %add21.i.20.i, %mul15.i.i
  %add24.i.i = add i32 %add19.i.i, %add18.i.i
  %add.i.2.i = add i32 %add24.i.i, %conv23.i.i
  %cmp.i.3.i = icmp ult i32 %add.i.2.i, %add21.i.20.i
  %sub.i = sub i32 0, %add21.i.i
  %cmp.i.138 = icmp ne i32 %add21.i.i, 0
  %conv.i.139 = zext i1 %cmp.i.138 to i32
  %sub1.i = sub i32 %rem2.0.lcssa, %add.i.2.i
  %cmp2.i.140 = icmp ult i32 %rem2.0.lcssa, %add.i.2.i
  %conv23.i.22.i.neg = sext i1 %cmp22.i.21.i to i32
  %conv.i.i.neg = sext i1 %cmp.i.3.i to i32
  %cmp5.i = icmp ult i32 %sub1.i, %conv.i.139
  %conv6.neg.i = sext i1 %cmp5.i to i32
  %sub8.i = sub i32 %sub1.i, %conv.i.139
  %conv3.neg.i = sext i1 %cmp2.i.140 to i32
  %add19.i.18.i.neg = sub i32 %rem1.0.lcssa, %mul15.i.11.i
  %add24.i.23.i.neg = sub i32 %add19.i.18.i.neg, %add18.i.17.i
  %add2.i.i.neg = add i32 %add24.i.23.i.neg, %conv23.i.22.i.neg
  %sub4.i = add i32 %add2.i.i.neg, %conv.i.i.neg
  %sub7.i = add i32 %sub4.i, %conv3.neg.i
  %sub9.i = add i32 %sub7.i, %conv6.neg.i
  %cmp62.593 = icmp slt i32 %sub9.i, 0
  br i1 %cmp62.593, label %while.body.63.preheader, label %while.end.65

while.body.63.preheader:                          ; preds = %if.then.60
  br label %while.body.63

while.body.63:                                    ; preds = %while.body.63.preheader, %while.body.63
  %rem3.0597 = phi i32 [ %add.i, %while.body.63 ], [ %sub.i, %while.body.63.preheader ]
  %rem2.1596 = phi i32 [ %add5.i, %while.body.63 ], [ %sub8.i, %while.body.63.preheader ]
  %rem1.1595 = phi i32 [ %add9.i, %while.body.63 ], [ %sub9.i, %while.body.63.preheader ]
  %zSig1.0594 = phi i32 [ %dec64, %while.body.63 ], [ %or14.i, %while.body.63.preheader ]
  %dec64 = add i32 %zSig1.0594, -1
  %add.i = add i32 %rem3.0597, %shl.i.276
  %cmp.i = icmp ult i32 %add.i, %rem3.0597
  %conv.i = zext i1 %cmp.i to i32
  %add1.i = add i32 %rem2.1596, %or.i.278
  %cmp2.i = icmp ult i32 %add1.i, %rem2.1596
  %conv3.i = zext i1 %cmp2.i to i32
  %add5.i = add i32 %conv.i, %add1.i
  %cmp6.i = icmp ult i32 %add5.i, %conv.i
  %conv7.i = zext i1 %cmp6.i to i32
  %add8.i = add i32 %conv3.i, %rem1.1595
  %add9.i = add i32 %add8.i, %conv7.i
  %cmp62 = icmp slt i32 %add9.i, 0
  br i1 %cmp62, label %while.body.63, label %while.end.65.loopexit

while.end.65.loopexit:                            ; preds = %while.body.63
  %add9.i.lcssa = phi i32 [ %add9.i, %while.body.63 ]
  %add5.i.lcssa = phi i32 [ %add5.i, %while.body.63 ]
  %add.i.lcssa = phi i32 [ %add.i, %while.body.63 ]
  %dec64.lcssa = phi i32 [ %dec64, %while.body.63 ]
  br label %while.end.65

while.end.65:                                     ; preds = %while.end.65.loopexit, %if.then.60
  %rem3.0.lcssa = phi i32 [ %sub.i, %if.then.60 ], [ %add.i.lcssa, %while.end.65.loopexit ]
  %rem2.1.lcssa = phi i32 [ %sub8.i, %if.then.60 ], [ %add5.i.lcssa, %while.end.65.loopexit ]
  %rem1.1.lcssa = phi i32 [ %sub9.i, %if.then.60 ], [ %add9.i.lcssa, %while.end.65.loopexit ]
  %zSig1.0.lcssa = phi i32 [ %or14.i, %if.then.60 ], [ %dec64.lcssa, %while.end.65.loopexit ]
  %or66 = or i32 %rem2.1.lcssa, %rem1.1.lcssa
  %or67 = or i32 %or66, %rem3.0.lcssa
  %cmp68 = icmp ne i32 %or67, 0
  %conv = zext i1 %cmp68 to i32
  %or69 = or i32 %conv, %zSig1.0.lcssa
  br label %if.end.70

if.end.70:                                        ; preds = %while.end, %while.end.65, %estimateDiv64To32.exit
  %zSig1.1 = phi i32 [ %or69, %while.end.65 ], [ %or14.i, %estimateDiv64To32.exit ], [ -1, %while.end ]
  %shl.i = shl i32 %zSig1.1, 21
  %shl3.i = shl i32 %zSig0.0.lcssa, 21
  %shr.i = lshr i32 %zSig1.1, 11
  %or.i = or i32 %shr.i, %shl3.i
  %shr4.i = lshr i32 %zSig0.0.lcssa, 11
  %call71 = tail call fastcc i64 @roundAndPackFloat64(i32 %xor, i32 %zExp.0, i32 %shr4.i, i32 %or.i, i32 %shl.i) #5
  %retval.sroa.10.0.extract.shift136 = and i64 %call71, -4294967296
  br label %cleanup

cleanup:                                          ; preds = %if.end.70, %if.then.46, %if.end.38, %invalid, %if.end.26, %propagateFloat64NaN.exit, %if.end.17, %propagateFloat64NaN.exit435, %propagateFloat64NaN.exit492
  %retval.sroa.0.0 = phi i64 [ %retval.sroa.0.0.insert.insert.i.490, %propagateFloat64NaN.exit492 ], [ %retval.sroa.0.0.insert.insert.i.433, %propagateFloat64NaN.exit435 ], [ 4294967295, %invalid ], [ %add.i.376, %if.end.17 ], [ %retval.sroa.0.0.insert.insert.i, %propagateFloat64NaN.exit ], [ %shl.i.364589, %if.end.26 ], [ %add.i.359, %if.end.38 ], [ %shl.i.302585, %if.then.46 ], [ %call71, %if.end.70 ]
  %retval.sroa.10.0 = phi i64 [ %retval.sroa.5.0.insert.shift.i.488, %propagateFloat64NaN.exit492 ], [ %retval.sroa.5.0.insert.shift.i.431, %propagateFloat64NaN.exit435 ], [ 9223372032559808512, %invalid ], [ %add.i.376, %if.end.17 ], [ %retval.sroa.5.0.insert.shift.i, %propagateFloat64NaN.exit ], [ %shl.i.364589, %if.end.26 ], [ %add.i.359, %if.end.38 ], [ %shl.i.302585, %if.then.46 ], [ %retval.sroa.10.0.extract.shift136, %if.end.70 ]
  %retval.sroa.0.0.insert.ext = and i64 %retval.sroa.0.0, 4294967295
  %retval.sroa.0.0.insert.insert = or i64 %retval.sroa.10.0, %retval.sroa.0.0.insert.ext
  ret i64 %retval.sroa.0.0.insert.insert
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i64 @float64_rem(i64 %a.coerce, i64 %b.coerce) #2 {
entry:
  %a.sroa.0.0.extract.trunc.i = trunc i64 %a.coerce to i32
  %a.sroa.1.0.extract.shift.i = lshr i64 %a.coerce, 32
  %a.sroa.1.0.extract.trunc.i = trunc i64 %a.sroa.1.0.extract.shift.i to i32
  %and.i = and i32 %a.sroa.1.0.extract.trunc.i, 1048575
  %a.sroa.1.0.extract.shift.i.506 = lshr i64 %a.coerce, 52
  %shr.i.507 = trunc i64 %a.sroa.1.0.extract.shift.i.506 to i32
  %and.i.508 = and i32 %shr.i.507, 2047
  %a.sroa.1.0.extract.shift.i.504 = lshr i64 %a.coerce, 63
  %shr.i.505 = trunc i64 %a.sroa.1.0.extract.shift.i.504 to i32
  %a.sroa.0.0.extract.trunc.i.503 = trunc i64 %b.coerce to i32
  %a.sroa.1.0.extract.shift.i.500 = lshr i64 %b.coerce, 32
  %a.sroa.1.0.extract.trunc.i.501 = trunc i64 %a.sroa.1.0.extract.shift.i.500 to i32
  %and.i.502 = and i32 %a.sroa.1.0.extract.trunc.i.501, 1048575
  %a.sroa.1.0.extract.shift.i.497 = lshr i64 %b.coerce, 52
  %shr.i.498 = trunc i64 %a.sroa.1.0.extract.shift.i.497 to i32
  %and.i.499 = and i32 %shr.i.498, 2047
  %cmp = icmp eq i32 %and.i.508, 2047
  br i1 %cmp, label %if.then, label %if.end.13

if.then:                                          ; preds = %entry
  %or = or i32 %and.i, %a.sroa.0.0.extract.trunc.i
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then.11

lor.lhs.false:                                    ; preds = %if.then
  %cmp8 = icmp ne i32 %and.i.499, 2047
  %or9 = or i32 %and.i.502, %a.sroa.0.0.extract.trunc.i.503
  %tobool10 = icmp eq i32 %or9, 0
  %or.cond585 = or i1 %cmp8, %tobool10
  br i1 %or.cond585, label %invalid, label %if.then.11

if.then.11:                                       ; preds = %lor.lhs.false, %if.then
  %and.i.57.i.444 = and i64 %a.coerce, 9221120237041090560
  %cmp.i.58.i.445 = icmp eq i64 %and.i.57.i.444, 9218868437227405312
  br i1 %cmp.i.58.i.445, label %land.rhs.i.61.i.448, label %float64_is_signaling_nan.exit66.i.455

land.rhs.i.61.i.448:                              ; preds = %if.then.11
  %tobool.i.60.i.447 = icmp eq i32 %a.sroa.0.0.extract.trunc.i, 0
  br i1 %tobool.i.60.i.447, label %lor.rhs.i.64.i.451, label %float64_is_signaling_nan.exit66.i.455

lor.rhs.i.64.i.451:                               ; preds = %land.rhs.i.61.i.448
  %and2.i.62.i.449 = and i64 %a.coerce, 2251795518717952
  %tobool3.i.63.i.450 = icmp ne i64 %and2.i.62.i.449, 0
  br label %float64_is_signaling_nan.exit66.i.455

float64_is_signaling_nan.exit66.i.455:            ; preds = %lor.rhs.i.64.i.451, %land.rhs.i.61.i.448, %if.then.11
  %0 = phi i1 [ false, %if.then.11 ], [ true, %land.rhs.i.61.i.448 ], [ %tobool3.i.63.i.450, %lor.rhs.i.64.i.451 ]
  %shl4.i.i.452 = shl nuw nsw i64 %a.sroa.1.0.extract.shift.i.500, 1
  %shl.i.i.453 = trunc i64 %shl4.i.i.452 to i32
  %cmp.i.50.i.454 = icmp ugt i32 %shl.i.i.453, -2097153
  br i1 %cmp.i.50.i.454, label %land.rhs.i.53.i.458, label %float64_is_nan.exit.i.464

land.rhs.i.53.i.458:                              ; preds = %float64_is_signaling_nan.exit66.i.455
  %tobool.i.52.i.457 = icmp eq i32 %a.sroa.0.0.extract.trunc.i.503, 0
  br i1 %tobool.i.52.i.457, label %lor.rhs.i.55.i.461, label %float64_is_nan.exit.i.464

lor.rhs.i.55.i.461:                               ; preds = %land.rhs.i.53.i.458
  %and.i.54.i.459 = and i64 %a.sroa.1.0.extract.shift.i.500, 1048575
  %tobool2.i.i.460 = icmp ne i64 %and.i.54.i.459, 0
  br label %float64_is_nan.exit.i.464

float64_is_nan.exit.i.464:                        ; preds = %lor.rhs.i.55.i.461, %land.rhs.i.53.i.458, %float64_is_signaling_nan.exit66.i.455
  %1 = phi i1 [ false, %float64_is_signaling_nan.exit66.i.455 ], [ true, %land.rhs.i.53.i.458 ], [ %tobool2.i.i.460, %lor.rhs.i.55.i.461 ]
  %and.i.i.462 = and i64 %b.coerce, 9221120237041090560
  %cmp.i.i.463 = icmp eq i64 %and.i.i.462, 9218868437227405312
  br i1 %cmp.i.i.463, label %land.rhs.i.i.467, label %float64_is_signaling_nan.exit.i.477

land.rhs.i.i.467:                                 ; preds = %float64_is_nan.exit.i.464
  %tobool.i.i.466 = icmp eq i32 %a.sroa.0.0.extract.trunc.i.503, 0
  br i1 %tobool.i.i.466, label %lor.rhs.i.i.473, label %float64_is_signaling_nan.exit.thread.i.470

float64_is_signaling_nan.exit.thread.i.470:       ; preds = %land.rhs.i.i.467
  %or.68.i.468 = or i32 %a.sroa.1.0.extract.trunc.i, 524288
  %or5.69.i.469 = or i32 %a.sroa.1.0.extract.trunc.i.501, 524288
  br label %if.then.i.481

lor.rhs.i.i.473:                                  ; preds = %land.rhs.i.i.467
  %and2.i.i.471 = and i64 %b.coerce, 2251795518717952
  %tobool3.i.i.472 = icmp ne i64 %and2.i.i.471, 0
  br label %float64_is_signaling_nan.exit.i.477

float64_is_signaling_nan.exit.i.477:              ; preds = %lor.rhs.i.i.473, %float64_is_nan.exit.i.464
  %2 = phi i1 [ false, %float64_is_nan.exit.i.464 ], [ %tobool3.i.i.472, %lor.rhs.i.i.473 ]
  %or.i.474 = or i32 %a.sroa.1.0.extract.trunc.i, 524288
  %or5.i.475 = or i32 %a.sroa.1.0.extract.trunc.i.501, 524288
  %or667.i.476 = or i1 %0, %2
  br i1 %or667.i.476, label %if.then.i.481, label %propagateFloat64NaN.exit496

if.then.i.481:                                    ; preds = %float64_is_signaling_nan.exit.i.477, %float64_is_signaling_nan.exit.thread.i.470
  %or574.i.478 = phi i32 [ %or5.69.i.469, %float64_is_signaling_nan.exit.thread.i.470 ], [ %or5.i.475, %float64_is_signaling_nan.exit.i.477 ]
  %or72.i.479 = phi i32 [ %or.68.i.468, %float64_is_signaling_nan.exit.thread.i.470 ], [ %or.i.474, %float64_is_signaling_nan.exit.i.477 ]
  %3 = phi i1 [ true, %float64_is_signaling_nan.exit.thread.i.470 ], [ %2, %float64_is_signaling_nan.exit.i.477 ]
  %4 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.480 = or i32 %4, 16
  store i32 %or.i.i.480, i32* @float_exception_flags, align 4, !tbaa !1
  br label %propagateFloat64NaN.exit496

propagateFloat64NaN.exit496:                      ; preds = %float64_is_signaling_nan.exit.i.477, %if.then.i.481
  %or66775.i.482 = phi i1 [ false, %float64_is_signaling_nan.exit.i.477 ], [ true, %if.then.i.481 ]
  %or573.i.483 = phi i32 [ %or5.i.475, %float64_is_signaling_nan.exit.i.477 ], [ %or574.i.478, %if.then.i.481 ]
  %or71.i.484 = phi i32 [ %or.i.474, %float64_is_signaling_nan.exit.i.477 ], [ %or72.i.479, %if.then.i.481 ]
  %5 = phi i1 [ false, %float64_is_signaling_nan.exit.i.477 ], [ %3, %if.then.i.481 ]
  %b.coerce.mux.i.485 = select i1 %5, i64 %b.coerce, i64 %a.coerce
  %or5.mux.i.486 = select i1 %5, i32 %or573.i.483, i32 %or71.i.484
  %a.coerce.b.coerce.i.487 = select i1 %1, i64 %b.coerce, i64 %a.coerce
  %or.or5.i.488 = select i1 %1, i32 %or573.i.483, i32 %or71.i.484
  %retval.sroa.0.0.i.489 = select i1 %or66775.i.482, i64 %b.coerce.mux.i.485, i64 %a.coerce.b.coerce.i.487
  %retval.sroa.5.0.i.490 = select i1 %or66775.i.482, i32 %or5.mux.i.486, i32 %or.or5.i.488
  %retval.sroa.5.0.insert.ext.i.491 = zext i32 %retval.sroa.5.0.i.490 to i64
  %retval.sroa.5.0.insert.shift.i.492 = shl nuw i64 %retval.sroa.5.0.insert.ext.i.491, 32
  %retval.sroa.0.0.insert.ext.i.493 = and i64 %retval.sroa.0.0.i.489, 4294967295
  %retval.sroa.0.0.insert.insert.i.494 = or i64 %retval.sroa.5.0.insert.shift.i.492, %retval.sroa.0.0.insert.ext.i.493
  br label %cleanup

if.end.13:                                        ; preds = %entry
  switch i32 %and.i.499, label %if.end.28 [
    i32 2047, label %if.then.15
    i32 0, label %if.then.23
  ]

if.then.15:                                       ; preds = %if.end.13
  %or16 = or i32 %and.i.502, %a.sroa.0.0.extract.trunc.i.503
  %tobool17 = icmp eq i32 %or16, 0
  br i1 %tobool17, label %if.end.20, label %if.then.18

if.then.18:                                       ; preds = %if.then.15
  %and.i.57.i = and i64 %a.coerce, 9221120237041090560
  %cmp.i.58.i = icmp eq i64 %and.i.57.i, 9218868437227405312
  br i1 %cmp.i.58.i, label %land.rhs.i.61.i, label %float64_is_signaling_nan.exit66.i

land.rhs.i.61.i:                                  ; preds = %if.then.18
  %tobool.i.60.i = icmp eq i32 %a.sroa.0.0.extract.trunc.i, 0
  br i1 %tobool.i.60.i, label %lor.rhs.i.64.i, label %float64_is_signaling_nan.exit66.i

lor.rhs.i.64.i:                                   ; preds = %land.rhs.i.61.i
  %and2.i.62.i = and i64 %a.coerce, 2251795518717952
  %tobool3.i.63.i = icmp ne i64 %and2.i.62.i, 0
  br label %float64_is_signaling_nan.exit66.i

float64_is_signaling_nan.exit66.i:                ; preds = %lor.rhs.i.64.i, %land.rhs.i.61.i, %if.then.18
  %6 = phi i1 [ false, %if.then.18 ], [ true, %land.rhs.i.61.i ], [ %tobool3.i.63.i, %lor.rhs.i.64.i ]
  %shl4.i.i.432 = shl nuw nsw i64 %a.sroa.1.0.extract.shift.i.500, 1
  %shl.i.i.433 = trunc i64 %shl4.i.i.432 to i32
  %cmp.i.50.i = icmp ugt i32 %shl.i.i.433, -2097153
  br i1 %cmp.i.50.i, label %land.rhs.i.53.i, label %float64_is_nan.exit.i

land.rhs.i.53.i:                                  ; preds = %float64_is_signaling_nan.exit66.i
  %tobool.i.52.i = icmp eq i32 %a.sroa.0.0.extract.trunc.i.503, 0
  br i1 %tobool.i.52.i, label %lor.rhs.i.55.i, label %float64_is_nan.exit.i

lor.rhs.i.55.i:                                   ; preds = %land.rhs.i.53.i
  %and.i.54.i = and i64 %a.sroa.1.0.extract.shift.i.500, 1048575
  %tobool2.i.i = icmp ne i64 %and.i.54.i, 0
  br label %float64_is_nan.exit.i

float64_is_nan.exit.i:                            ; preds = %lor.rhs.i.55.i, %land.rhs.i.53.i, %float64_is_signaling_nan.exit66.i
  %7 = phi i1 [ false, %float64_is_signaling_nan.exit66.i ], [ true, %land.rhs.i.53.i ], [ %tobool2.i.i, %lor.rhs.i.55.i ]
  %and.i.i.434 = and i64 %b.coerce, 9221120237041090560
  %cmp.i.i.435 = icmp eq i64 %and.i.i.434, 9218868437227405312
  br i1 %cmp.i.i.435, label %land.rhs.i.i, label %float64_is_signaling_nan.exit.i

land.rhs.i.i:                                     ; preds = %float64_is_nan.exit.i
  %tobool.i.i = icmp eq i32 %a.sroa.0.0.extract.trunc.i.503, 0
  br i1 %tobool.i.i, label %lor.rhs.i.i, label %float64_is_signaling_nan.exit.thread.i

float64_is_signaling_nan.exit.thread.i:           ; preds = %land.rhs.i.i
  %or.68.i = or i32 %a.sroa.1.0.extract.trunc.i, 524288
  %or5.69.i = or i32 %a.sroa.1.0.extract.trunc.i.501, 524288
  br label %if.then.i.438

lor.rhs.i.i:                                      ; preds = %land.rhs.i.i
  %and2.i.i = and i64 %b.coerce, 2251795518717952
  %tobool3.i.i = icmp ne i64 %and2.i.i, 0
  br label %float64_is_signaling_nan.exit.i

float64_is_signaling_nan.exit.i:                  ; preds = %lor.rhs.i.i, %float64_is_nan.exit.i
  %8 = phi i1 [ false, %float64_is_nan.exit.i ], [ %tobool3.i.i, %lor.rhs.i.i ]
  %or.i.436 = or i32 %a.sroa.1.0.extract.trunc.i, 524288
  %or5.i = or i32 %a.sroa.1.0.extract.trunc.i.501, 524288
  %or667.i = or i1 %6, %8
  br i1 %or667.i, label %if.then.i.438, label %propagateFloat64NaN.exit

if.then.i.438:                                    ; preds = %float64_is_signaling_nan.exit.i, %float64_is_signaling_nan.exit.thread.i
  %or574.i = phi i32 [ %or5.69.i, %float64_is_signaling_nan.exit.thread.i ], [ %or5.i, %float64_is_signaling_nan.exit.i ]
  %or72.i = phi i32 [ %or.68.i, %float64_is_signaling_nan.exit.thread.i ], [ %or.i.436, %float64_is_signaling_nan.exit.i ]
  %9 = phi i1 [ true, %float64_is_signaling_nan.exit.thread.i ], [ %8, %float64_is_signaling_nan.exit.i ]
  %10 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.437 = or i32 %10, 16
  store i32 %or.i.i.437, i32* @float_exception_flags, align 4, !tbaa !1
  br label %propagateFloat64NaN.exit

propagateFloat64NaN.exit:                         ; preds = %float64_is_signaling_nan.exit.i, %if.then.i.438
  %or66775.i = phi i1 [ false, %float64_is_signaling_nan.exit.i ], [ true, %if.then.i.438 ]
  %or573.i = phi i32 [ %or5.i, %float64_is_signaling_nan.exit.i ], [ %or574.i, %if.then.i.438 ]
  %or71.i = phi i32 [ %or.i.436, %float64_is_signaling_nan.exit.i ], [ %or72.i, %if.then.i.438 ]
  %11 = phi i1 [ false, %float64_is_signaling_nan.exit.i ], [ %9, %if.then.i.438 ]
  %b.coerce.mux.i = select i1 %11, i64 %b.coerce, i64 %a.coerce
  %or5.mux.i = select i1 %11, i32 %or573.i, i32 %or71.i
  %a.coerce.b.coerce.i = select i1 %7, i64 %b.coerce, i64 %a.coerce
  %or.or5.i = select i1 %7, i32 %or573.i, i32 %or71.i
  %retval.sroa.0.0.i = select i1 %or66775.i, i64 %b.coerce.mux.i, i64 %a.coerce.b.coerce.i
  %retval.sroa.5.0.i = select i1 %or66775.i, i32 %or5.mux.i, i32 %or.or5.i
  %retval.sroa.5.0.insert.ext.i = zext i32 %retval.sroa.5.0.i to i64
  %retval.sroa.5.0.insert.shift.i = shl nuw i64 %retval.sroa.5.0.insert.ext.i, 32
  %retval.sroa.0.0.insert.ext.i = and i64 %retval.sroa.0.0.i, 4294967295
  %retval.sroa.0.0.insert.insert.i = or i64 %retval.sroa.5.0.insert.shift.i, %retval.sroa.0.0.insert.ext.i
  br label %cleanup

if.end.20:                                        ; preds = %if.then.15
  %retval.sroa.8.0.extract.shift166 = and i64 %a.coerce, -4294967296
  br label %cleanup

if.then.23:                                       ; preds = %if.end.13
  %or24 = or i32 %and.i.502, %a.sroa.0.0.extract.trunc.i.503
  %cmp25 = icmp eq i32 %or24, 0
  br i1 %cmp25, label %invalid, label %if.end.27

invalid:                                          ; preds = %lor.lhs.false, %if.then.23
  %12 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.431 = or i32 %12, 16
  store i32 %or.i.431, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.27:                                        ; preds = %if.then.23
  %cmp.i.376 = icmp eq i32 %and.i.502, 0
  br i1 %cmp.i.376, label %if.then.i.392, label %if.else.7.i.419

if.then.i.392:                                    ; preds = %if.end.27
  %cmp.i.i.377 = icmp ult i32 %a.sroa.0.0.extract.trunc.i.503, 65536
  %shl.i.i.378 = shl i32 %a.sroa.0.0.extract.trunc.i.503, 16
  %shl.a.i.i.379 = select i1 %cmp.i.i.377, i32 %shl.i.i.378, i32 %a.sroa.0.0.extract.trunc.i.503
  %..i.i.380 = select i1 %cmp.i.i.377, i32 16, i32 0
  %cmp1.i.i.381 = icmp ult i32 %shl.a.i.i.379, 16777216
  %add3.i.i.382 = or i32 %..i.i.380, 8
  %shl4.i.i.383 = shl i32 %shl.a.i.i.379, 8
  %a.addr.1.i.i.384 = select i1 %cmp1.i.i.381, i32 %shl4.i.i.383, i32 %shl.a.i.i.379
  %shiftCount.1.i.i.385 = select i1 %cmp1.i.i.381, i32 %add3.i.i.382, i32 %..i.i.380
  %shr.i.i.386 = lshr i32 %a.addr.1.i.i.384, 24
  %idxprom.i.i.387 = zext i32 %shr.i.i.386 to i64
  %arrayidx.i.i.388 = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i64 0, i64 %idxprom.i.i.387
  %13 = load i32, i32* %arrayidx.i.i.388, align 4, !tbaa !1
  %add6.i.i.389 = add nsw i32 %13, %shiftCount.1.i.i.385
  %sub.i.390 = add nsw i32 %add6.i.i.389, -11
  %cmp1.i.391 = icmp slt i32 %add6.i.i.389, 11
  br i1 %cmp1.i.391, label %if.then.2.i.397, label %if.else.i.399

if.then.2.i.397:                                  ; preds = %if.then.i.392
  %sub3.i.393 = sub i32 11, %add6.i.i.389
  %shr.i.394 = lshr i32 %a.sroa.0.0.extract.trunc.i.503, %sub3.i.393
  %and.i.395 = and i32 %sub.i.390, 31
  %shl.i.396 = shl i32 %a.sroa.0.0.extract.trunc.i.503, %and.i.395
  br label %if.end.i.402

if.else.i.399:                                    ; preds = %if.then.i.392
  %shl4.i.398 = shl i32 %a.sroa.0.0.extract.trunc.i.503, %sub.i.390
  br label %if.end.i.402

if.end.i.402:                                     ; preds = %if.else.i.399, %if.then.2.i.397
  %bSig0.0 = phi i32 [ %shr.i.394, %if.then.2.i.397 ], [ %shl4.i.398, %if.else.i.399 ]
  %storemerge.28.i.400 = phi i32 [ %shl.i.396, %if.then.2.i.397 ], [ 0, %if.else.i.399 ]
  %sub6.i.401 = sub i32 -20, %add6.i.i.389
  br label %if.end.28

if.else.7.i.419:                                  ; preds = %if.end.27
  %cmp.i.32.i.403 = icmp ult i32 %and.i.502, 65536
  %shl.i.33.i.404586 = shl nuw nsw i64 %a.sroa.1.0.extract.shift.i.500, 16
  %shl.i.33.i.404 = trunc i64 %shl.i.33.i.404586 to i32
  %shl.a.i.34.i.405 = select i1 %cmp.i.32.i.403, i32 %shl.i.33.i.404, i32 %and.i.502
  %..i.35.i.406 = select i1 %cmp.i.32.i.403, i32 16, i32 0
  %cmp1.i.36.i.407 = icmp ult i32 %shl.a.i.34.i.405, 16777216
  %add3.i.37.i.408 = or i32 %..i.35.i.406, 8
  %shl4.i.38.i.409 = shl i32 %shl.a.i.34.i.405, 8
  %a.addr.1.i.39.i.410 = select i1 %cmp1.i.36.i.407, i32 %shl4.i.38.i.409, i32 %shl.a.i.34.i.405
  %shiftCount.1.i.40.i.411 = select i1 %cmp1.i.36.i.407, i32 %add3.i.37.i.408, i32 %..i.35.i.406
  %shr.i.41.i.412 = lshr i32 %a.addr.1.i.39.i.410, 24
  %idxprom.i.42.i.413 = zext i32 %shr.i.41.i.412 to i64
  %arrayidx.i.43.i.414 = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i64 0, i64 %idxprom.i.42.i.413
  %14 = load i32, i32* %arrayidx.i.43.i.414, align 4, !tbaa !1
  %add6.i.44.i.415 = add nsw i32 %14, %shiftCount.1.i.40.i.411
  %sub9.i.416 = add nsw i32 %add6.i.44.i.415, -11
  %shl.i.29.i.417 = shl i32 %a.sroa.0.0.extract.trunc.i.503, %sub9.i.416
  %cmp.i.30.i.418 = icmp eq i32 %sub9.i.416, 0
  br i1 %cmp.i.30.i.418, label %shortShift64Left.exit.i.428, label %cond.false.i.i.425

cond.false.i.i.425:                               ; preds = %if.else.7.i.419
  %shl1.i.i.420 = shl i32 %and.i.502, %sub9.i.416
  %sub.i.i.421 = sub i32 11, %add6.i.44.i.415
  %and.i.i.422 = and i32 %sub.i.i.421, 31
  %shr.i.31.i.423 = lshr i32 %a.sroa.0.0.extract.trunc.i.503, %and.i.i.422
  %or.i.i.424 = or i32 %shr.i.31.i.423, %shl1.i.i.420
  br label %shortShift64Left.exit.i.428

shortShift64Left.exit.i.428:                      ; preds = %cond.false.i.i.425, %if.else.7.i.419
  %cond.i.i.426 = phi i32 [ %or.i.i.424, %cond.false.i.i.425 ], [ %and.i.502, %if.else.7.i.419 ]
  %sub10.i.427 = sub i32 12, %add6.i.44.i.415
  br label %if.end.28

if.end.28:                                        ; preds = %shortShift64Left.exit.i.428, %if.end.i.402, %if.end.13
  %bSig0.2 = phi i32 [ %and.i.502, %if.end.13 ], [ %bSig0.0, %if.end.i.402 ], [ %cond.i.i.426, %shortShift64Left.exit.i.428 ]
  %bSig1.1 = phi i32 [ %a.sroa.0.0.extract.trunc.i.503, %if.end.13 ], [ %storemerge.28.i.400, %if.end.i.402 ], [ %shl.i.29.i.417, %shortShift64Left.exit.i.428 ]
  %bExp.0 = phi i32 [ %and.i.499, %if.end.13 ], [ %sub6.i.401, %if.end.i.402 ], [ %sub10.i.427, %shortShift64Left.exit.i.428 ]
  %cmp29 = icmp eq i32 %and.i.508, 0
  br i1 %cmp29, label %if.then.30, label %if.end.35

if.then.30:                                       ; preds = %if.end.28
  %or31 = or i32 %and.i, %a.sroa.0.0.extract.trunc.i
  %cmp32 = icmp eq i32 %or31, 0
  br i1 %cmp32, label %if.then.33, label %if.end.34

if.then.33:                                       ; preds = %if.then.30
  %retval.sroa.8.0.extract.shift168 = and i64 %a.coerce, -4294967296
  br label %cleanup

if.end.34:                                        ; preds = %if.then.30
  %cmp.i.362 = icmp eq i32 %and.i, 0
  br i1 %cmp.i.362, label %if.then.i, label %if.else.7.i

if.then.i:                                        ; preds = %if.end.34
  %cmp.i.i.363 = icmp ult i32 %a.sroa.0.0.extract.trunc.i, 65536
  %shl.i.i.364 = shl i32 %a.sroa.0.0.extract.trunc.i, 16
  %shl.a.i.i = select i1 %cmp.i.i.363, i32 %shl.i.i.364, i32 %a.sroa.0.0.extract.trunc.i
  %..i.i = select i1 %cmp.i.i.363, i32 16, i32 0
  %cmp1.i.i = icmp ult i32 %shl.a.i.i, 16777216
  %add3.i.i = or i32 %..i.i, 8
  %shl4.i.i = shl i32 %shl.a.i.i, 8
  %a.addr.1.i.i = select i1 %cmp1.i.i, i32 %shl4.i.i, i32 %shl.a.i.i
  %shiftCount.1.i.i = select i1 %cmp1.i.i, i32 %add3.i.i, i32 %..i.i
  %shr.i.i.365 = lshr i32 %a.addr.1.i.i, 24
  %idxprom.i.i = zext i32 %shr.i.i.365 to i64
  %arrayidx.i.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i64 0, i64 %idxprom.i.i
  %15 = load i32, i32* %arrayidx.i.i, align 4, !tbaa !1
  %add6.i.i = add nsw i32 %15, %shiftCount.1.i.i
  %sub.i.366 = add nsw i32 %add6.i.i, -11
  %cmp1.i.367 = icmp slt i32 %add6.i.i, 11
  br i1 %cmp1.i.367, label %if.then.2.i.371, label %if.else.i.373

if.then.2.i.371:                                  ; preds = %if.then.i
  %sub3.i = sub i32 11, %add6.i.i
  %shr.i.368 = lshr i32 %a.sroa.0.0.extract.trunc.i, %sub3.i
  %and.i.369 = and i32 %sub.i.366, 31
  %shl.i.370 = shl i32 %a.sroa.0.0.extract.trunc.i, %and.i.369
  br label %if.end.i.374

if.else.i.373:                                    ; preds = %if.then.i
  %shl4.i.372 = shl i32 %a.sroa.0.0.extract.trunc.i, %sub.i.366
  br label %if.end.i.374

if.end.i.374:                                     ; preds = %if.else.i.373, %if.then.2.i.371
  %aSig0.0 = phi i32 [ %shr.i.368, %if.then.2.i.371 ], [ %shl4.i.372, %if.else.i.373 ]
  %storemerge.28.i = phi i32 [ %shl.i.370, %if.then.2.i.371 ], [ 0, %if.else.i.373 ]
  %sub6.i = sub i32 -20, %add6.i.i
  br label %if.end.35

if.else.7.i:                                      ; preds = %if.end.34
  %cmp.i.32.i = icmp ult i32 %and.i, 65536
  %shl.i.33.i588 = shl nuw nsw i64 %a.sroa.1.0.extract.shift.i, 16
  %shl.i.33.i = trunc i64 %shl.i.33.i588 to i32
  %shl.a.i.34.i = select i1 %cmp.i.32.i, i32 %shl.i.33.i, i32 %and.i
  %..i.35.i = select i1 %cmp.i.32.i, i32 16, i32 0
  %cmp1.i.36.i = icmp ult i32 %shl.a.i.34.i, 16777216
  %add3.i.37.i = or i32 %..i.35.i, 8
  %shl4.i.38.i = shl i32 %shl.a.i.34.i, 8
  %a.addr.1.i.39.i = select i1 %cmp1.i.36.i, i32 %shl4.i.38.i, i32 %shl.a.i.34.i
  %shiftCount.1.i.40.i = select i1 %cmp1.i.36.i, i32 %add3.i.37.i, i32 %..i.35.i
  %shr.i.41.i = lshr i32 %a.addr.1.i.39.i, 24
  %idxprom.i.42.i = zext i32 %shr.i.41.i to i64
  %arrayidx.i.43.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i64 0, i64 %idxprom.i.42.i
  %16 = load i32, i32* %arrayidx.i.43.i, align 4, !tbaa !1
  %add6.i.44.i = add nsw i32 %16, %shiftCount.1.i.40.i
  %sub9.i = add nsw i32 %add6.i.44.i, -11
  %shl.i.29.i = shl i32 %a.sroa.0.0.extract.trunc.i, %sub9.i
  %cmp.i.30.i = icmp eq i32 %sub9.i, 0
  br i1 %cmp.i.30.i, label %shortShift64Left.exit.i, label %cond.false.i.i

cond.false.i.i:                                   ; preds = %if.else.7.i
  %shl1.i.i = shl i32 %and.i, %sub9.i
  %sub.i.i.375 = sub i32 11, %add6.i.44.i
  %and.i.i = and i32 %sub.i.i.375, 31
  %shr.i.31.i = lshr i32 %a.sroa.0.0.extract.trunc.i, %and.i.i
  %or.i.i = or i32 %shr.i.31.i, %shl1.i.i
  br label %shortShift64Left.exit.i

shortShift64Left.exit.i:                          ; preds = %cond.false.i.i, %if.else.7.i
  %cond.i.i = phi i32 [ %or.i.i, %cond.false.i.i ], [ %and.i, %if.else.7.i ]
  %sub10.i = sub i32 12, %add6.i.44.i
  br label %if.end.35

if.end.35:                                        ; preds = %shortShift64Left.exit.i, %if.end.i.374, %if.end.28
  %aSig1.1 = phi i32 [ %a.sroa.0.0.extract.trunc.i, %if.end.28 ], [ %storemerge.28.i, %if.end.i.374 ], [ %shl.i.29.i, %shortShift64Left.exit.i ]
  %aSig0.2 = phi i32 [ %and.i, %if.end.28 ], [ %aSig0.0, %if.end.i.374 ], [ %cond.i.i, %shortShift64Left.exit.i ]
  %aExp.0 = phi i32 [ %and.i.508, %if.end.28 ], [ %sub6.i, %if.end.i.374 ], [ %sub10.i, %shortShift64Left.exit.i ]
  %sub = sub nsw i32 %aExp.0, %bExp.0
  %cmp36 = icmp slt i32 %sub, -1
  br i1 %cmp36, label %if.then.37, label %if.end.38

if.then.37:                                       ; preds = %if.end.35
  %retval.sroa.8.0.extract.shift170 = and i64 %a.coerce, -4294967296
  br label %cleanup

if.end.38:                                        ; preds = %if.end.35
  %or39 = or i32 %aSig0.2, 1048576
  %sub.lobit = lshr i32 %sub, 31
  %sub41 = sub nsw i32 11, %sub.lobit
  %shl.i.353 = shl i32 %aSig1.1, %sub41
  %shl1.i.354 = shl i32 %or39, %sub41
  %sub.i.355 = sub nsw i32 0, %sub41
  %and.i.356 = and i32 %sub.i.355, 23
  %shr.i.357 = lshr i32 %aSig1.1, %and.i.356
  %or.i.358 = or i32 %shr.i.357, %shl1.i.354
  %shl.i.346 = shl i32 %bSig1.1, 11
  %or42 = shl i32 %bSig0.2, 11
  %shl1.i.347 = or i32 %or42, -2147483648
  %shr.i.348 = lshr i32 %bSig1.1, 21
  %or.i.349 = or i32 %shr.i.348, %shl1.i.347
  %cmp.i.344 = icmp ugt i32 %or.i.358, %or.i.349
  br i1 %cmp.i.344, label %if.then.45, label %le64.exit

le64.exit:                                        ; preds = %if.end.38
  %cmp1.i.345 = icmp eq i32 %or.i.358, %or.i.349
  %cmp2.i = icmp uge i32 %shl.i.353, %shl.i.346
  %cmp2..i = and i1 %cmp2.i, %cmp1.i.345
  %lor.ext.i = zext i1 %cmp2..i to i32
  br i1 %cmp2..i, label %if.then.45, label %if.end.46

if.then.45:                                       ; preds = %if.end.38, %le64.exit
  %lor.ext.i605 = phi i32 [ %lor.ext.i, %le64.exit ], [ 1, %if.end.38 ]
  %sub.i.339 = sub i32 %shl.i.353, %shl.i.346
  %sub1.i.340 = sub i32 %or.i.358, %or.i.349
  %cmp.i.341 = icmp ult i32 %shl.i.353, %shl.i.346
  %conv.neg.i.342 = sext i1 %cmp.i.341 to i32
  %sub2.i.343 = add i32 %sub1.i.340, %conv.neg.i.342
  br label %if.end.46

if.end.46:                                        ; preds = %le64.exit, %if.then.45
  %lor.ext.i604 = phi i32 [ %lor.ext.i, %le64.exit ], [ %lor.ext.i605, %if.then.45 ]
  %aSig1.2 = phi i32 [ %shl.i.353, %le64.exit ], [ %sub.i.339, %if.then.45 ]
  %aSig0.3 = phi i32 [ %or.i.358, %le64.exit ], [ %sub2.i.343, %if.then.45 ]
  %sub47 = add nsw i32 %sub, -32
  %cmp48.592 = icmp sgt i32 %sub, 32
  br i1 %cmp48.592, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %if.end.46
  %shr.i.289 = lshr i32 %shl1.i.347, 16
  %shl.i.290 = shl nuw i32 %shr.i.289, 16
  %conv5.i.i.298 = and i32 %or.i.349, 65535
  %shl4.i.311 = shl i32 %or.i.349, 16
  %17 = lshr i32 %bSig1.1, 5
  %shr.i.i.246 = and i32 %17, 65535
  %conv5.i.i.248 = and i32 %shl.i.346, 63488
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %estimateDiv64To32.exit338
  %expDiff.0597 = phi i32 [ %sub47, %while.body.lr.ph ], [ %sub54, %estimateDiv64To32.exit338 ]
  %aSig0.4595 = phi i32 [ %aSig0.3, %while.body.lr.ph ], [ %sub2.i.229, %estimateDiv64To32.exit338 ]
  %aSig1.3593 = phi i32 [ %aSig1.2, %while.body.lr.ph ], [ %sub.i.225, %estimateDiv64To32.exit338 ]
  %cmp.i.288 = icmp ugt i32 %or.i.349, %aSig0.4595
  br i1 %cmp.i.288, label %if.end.i.292, label %estimateDiv64To32.exit338

if.end.i.292:                                     ; preds = %while.body
  %cmp1.i.291 = icmp ugt i32 %shl.i.290, %aSig0.4595
  br i1 %cmp1.i.291, label %cond.false.i.295, label %cond.end.i.310

cond.false.i.295:                                 ; preds = %if.end.i.292
  %div.i.293 = udiv i32 %aSig0.4595, %shr.i.289
  %shl2.i.294 = shl i32 %div.i.293, 16
  br label %cond.end.i.310

cond.end.i.310:                                   ; preds = %cond.false.i.295, %if.end.i.292
  %cond.i.296 = phi i32 [ %shl2.i.294, %cond.false.i.295 ], [ -65536, %if.end.i.292 ]
  %shr3.i.i.297 = lshr exact i32 %cond.i.296, 16
  %mul9.i.i.299 = mul nuw i32 %shr3.i.i.297, %conv5.i.i.298
  %mul15.i.i.300 = mul nuw i32 %shr3.i.i.297, %shr.i.289
  %shr17.i.i.301 = lshr i32 %mul9.i.i.299, 16
  %shl20.i.i.302 = shl i32 %mul9.i.i.299, 16
  %sub.i.i.303 = sub i32 %aSig1.3593, %shl20.i.i.302
  %cmp.i.39.i.304 = icmp ult i32 %aSig1.3593, %shl20.i.i.302
  %conv.neg.i.i.305 = sext i1 %cmp.i.39.i.304 to i32
  %add24.i.neg.i.306 = sub i32 %aSig0.4595, %mul15.i.i.300
  %sub1.i.i.307 = sub i32 %add24.i.neg.i.306, %shr17.i.i.301
  %sub2.i.i.308 = add i32 %sub1.i.i.307, %conv.neg.i.i.305
  %cmp3.45.i.309 = icmp slt i32 %sub2.i.i.308, 0
  br i1 %cmp3.45.i.309, label %while.body.i.323.preheader, label %while.end.i.331

while.body.i.323.preheader:                       ; preds = %cond.end.i.310
  br label %while.body.i.323

while.body.i.323:                                 ; preds = %while.body.i.323.preheader, %while.body.i.323
  %z.048.i.313 = phi i32 [ %sub.i.316, %while.body.i.323 ], [ %cond.i.296, %while.body.i.323.preheader ]
  %rem0.047.i.314 = phi i32 [ %add2.i.i.321, %while.body.i.323 ], [ %sub2.i.i.308, %while.body.i.323.preheader ]
  %rem1.046.i.315 = phi i32 [ %add.i.37.i.317, %while.body.i.323 ], [ %sub.i.i.303, %while.body.i.323.preheader ]
  %sub.i.316 = add i32 %z.048.i.313, -65536
  %add.i.37.i.317 = add i32 %rem1.046.i.315, %shl4.i.311
  %add1.i.i.318 = add i32 %rem0.047.i.314, %shr.i.289
  %cmp.i.38.i.319 = icmp ult i32 %add.i.37.i.317, %rem1.046.i.315
  %conv.i.i.320 = zext i1 %cmp.i.38.i.319 to i32
  %add2.i.i.321 = add i32 %add1.i.i.318, %conv.i.i.320
  %cmp3.i.322 = icmp slt i32 %add2.i.i.321, 0
  br i1 %cmp3.i.322, label %while.body.i.323, label %while.end.i.331.loopexit

while.end.i.331.loopexit:                         ; preds = %while.body.i.323
  %add2.i.i.321.lcssa = phi i32 [ %add2.i.i.321, %while.body.i.323 ]
  %add.i.37.i.317.lcssa = phi i32 [ %add.i.37.i.317, %while.body.i.323 ]
  %sub.i.316.lcssa = phi i32 [ %sub.i.316, %while.body.i.323 ]
  br label %while.end.i.331

while.end.i.331:                                  ; preds = %while.end.i.331.loopexit, %cond.end.i.310
  %z.0.lcssa.i.324 = phi i32 [ %cond.i.296, %cond.end.i.310 ], [ %sub.i.316.lcssa, %while.end.i.331.loopexit ]
  %rem0.0.lcssa.i.325 = phi i32 [ %sub2.i.i.308, %cond.end.i.310 ], [ %add2.i.i.321.lcssa, %while.end.i.331.loopexit ]
  %rem1.0.lcssa.i.326 = phi i32 [ %sub.i.i.303, %cond.end.i.310 ], [ %add.i.37.i.317.lcssa, %while.end.i.331.loopexit ]
  %shl5.i.327 = shl i32 %rem0.0.lcssa.i.325, 16
  %shr6.i.328 = lshr i32 %rem1.0.lcssa.i.326, 16
  %or.i.329 = or i32 %shr6.i.328, %shl5.i.327
  %cmp8.i.330 = icmp ugt i32 %shl.i.290, %or.i.329
  br i1 %cmp8.i.330, label %cond.false.10.i.333, label %cond.end.12.i.336

cond.false.10.i.333:                              ; preds = %while.end.i.331
  %div11.i.332 = udiv i32 %or.i.329, %shr.i.289
  br label %cond.end.12.i.336

cond.end.12.i.336:                                ; preds = %cond.false.10.i.333, %while.end.i.331
  %cond13.i.334 = phi i32 [ %div11.i.332, %cond.false.10.i.333 ], [ 65535, %while.end.i.331 ]
  %or14.i.335 = or i32 %cond13.i.334, %z.0.lcssa.i.324
  br label %estimateDiv64To32.exit338

estimateDiv64To32.exit338:                        ; preds = %while.body, %cond.end.12.i.336
  %retval.0.i.337 = phi i32 [ %or14.i.335, %cond.end.12.i.336 ], [ -1, %while.body ]
  %cmp51 = icmp ugt i32 %retval.0.i.337, 4
  %sub53 = add i32 %retval.0.i.337, -4
  %cond = select i1 %cmp51, i32 %sub53, i32 0
  %shr3.i.i.247 = lshr i32 %cond, 16
  %conv6.i.i.249 = and i32 %cond, 65535
  %mul.i.i.250 = mul nuw i32 %conv6.i.i.249, %conv5.i.i.248
  %mul9.i.i.251 = mul nuw i32 %shr3.i.i.247, %conv5.i.i.248
  %mul12.i.i.252 = mul nuw i32 %conv6.i.i.249, %shr.i.i.246
  %mul15.i.i.253 = mul nuw i32 %shr3.i.i.247, %shr.i.i.246
  %add.i.i.254 = add i32 %mul9.i.i.251, %mul12.i.i.252
  %cmp.i.i.255 = icmp ult i32 %add.i.i.254, %mul12.i.i.252
  %conv16.i.i.256 = zext i1 %cmp.i.i.255 to i32
  %shl.i.i.257 = shl nuw nsw i32 %conv16.i.i.256, 16
  %shr17.i.i.258 = lshr i32 %add.i.i.254, 16
  %add18.i.i.259 = or i32 %shl.i.i.257, %shr17.i.i.258
  %shl20.i.i.260 = shl i32 %add.i.i.254, 16
  %add21.i.i.261 = add i32 %shl20.i.i.260, %mul.i.i.250
  %cmp22.i.i.262 = icmp ult i32 %add21.i.i.261, %shl20.i.i.260
  %conv23.i.i.263 = zext i1 %cmp22.i.i.262 to i32
  %mul.i.8.i.266 = mul nuw i32 %conv6.i.i.249, %conv5.i.i.298
  %mul9.i.9.i.267 = mul nuw i32 %shr3.i.i.247, %conv5.i.i.298
  %mul12.i.10.i.268 = mul nuw i32 %conv6.i.i.249, %shr.i.289
  %mul15.i.11.i.269 = mul nuw i32 %shr3.i.i.247, %shr.i.289
  %add.i.12.i.270 = add i32 %mul9.i.9.i.267, %mul12.i.10.i.268
  %shr17.i.16.i.274 = lshr i32 %add.i.12.i.270, 16
  %add19.i.18.i.276 = add i32 %shr17.i.16.i.274, %mul15.i.11.i.269
  %shl20.i.19.i.277 = shl i32 %add.i.12.i.270, 16
  %add21.i.20.i.278 = add i32 %shl20.i.19.i.277, %mul.i.8.i.266
  %cmp22.i.21.i.279 = icmp ult i32 %add21.i.20.i.278, %shl20.i.19.i.277
  %conv23.i.22.i.280 = zext i1 %cmp22.i.21.i.279 to i32
  %add24.i.23.i.281 = add i32 %add19.i.18.i.276, %conv23.i.22.i.280
  %add19.i.i.282 = add i32 %add21.i.20.i.278, %mul15.i.i.253
  %add24.i.i.283 = add i32 %add19.i.i.282, %add18.i.i.259
  %add.i.2.i.284 = add i32 %add24.i.i.283, %conv23.i.i.263
  %cmp.i.3.i.285 = icmp ult i32 %add.i.2.i.284, %add21.i.20.i.278
  %conv.i.i.286 = zext i1 %cmp.i.3.i.285 to i32
  %add2.i.i.287 = add i32 %add24.i.23.i.281, %conv.i.i.286
  %shl1.i.238 = shl i32 %add.i.2.i.284, 29
  %shl2.i.239 = shl i32 %add2.i.i.287, 29
  %shr.i.240 = lshr exact i32 %add21.i.i.261, 3
  %or.i.241 = or i32 %shl1.i.238, %shr.i.240
  %shr3.i.242 = lshr i32 %add.i.2.i.284, 3
  %or4.i = or i32 %shl2.i.239, %shr3.i.242
  %shl1.i.231 = shl i32 %aSig0.4595, 29
  %shr.i.232 = lshr i32 %aSig1.3593, 3
  %or.i.233 = or i32 %shl1.i.231, %shr.i.232
  %sub.i.225 = sub i32 0, %or.i.241
  %cmp.i.227 = icmp ne i32 %or.i.241, 0
  %conv.neg.i.228 = sext i1 %cmp.i.227 to i32
  %sub1.i.226 = add i32 %conv.neg.i.228, %or.i.233
  %sub2.i.229 = sub i32 %sub1.i.226, %or4.i
  %sub54 = add nsw i32 %expDiff.0597, -29
  %cmp48 = icmp sgt i32 %expDiff.0597, 29
  br i1 %cmp48, label %while.body, label %while.end.loopexit

while.end.loopexit:                               ; preds = %estimateDiv64To32.exit338
  %sub54.lcssa = phi i32 [ %sub54, %estimateDiv64To32.exit338 ]
  %sub2.i.229.lcssa = phi i32 [ %sub2.i.229, %estimateDiv64To32.exit338 ]
  %sub.i.225.lcssa = phi i32 [ %sub.i.225, %estimateDiv64To32.exit338 ]
  %cond.lcssa = phi i32 [ %cond, %estimateDiv64To32.exit338 ]
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %if.end.46
  %expDiff.0.lcssa = phi i32 [ %sub47, %if.end.46 ], [ %sub54.lcssa, %while.end.loopexit ]
  %q.0.lcssa = phi i32 [ %lor.ext.i604, %if.end.46 ], [ %cond.lcssa, %while.end.loopexit ]
  %aSig0.4.lcssa = phi i32 [ %aSig0.3, %if.end.46 ], [ %sub2.i.229.lcssa, %while.end.loopexit ]
  %aSig1.3.lcssa = phi i32 [ %aSig1.2, %if.end.46 ], [ %sub.i.225.lcssa, %while.end.loopexit ]
  %cmp55 = icmp sgt i32 %expDiff.0.lcssa, -32
  br i1 %cmp55, label %if.then.57, label %if.else.72

if.then.57:                                       ; preds = %while.end
  %cmp.i.209 = icmp ugt i32 %or.i.349, %aSig0.4.lcssa
  br i1 %cmp.i.209, label %if.end.i, label %estimateDiv64To32.exit

if.end.i:                                         ; preds = %if.then.57
  %shr.i.210 = lshr i32 %shl1.i.347, 16
  %shl.i.211 = shl nuw i32 %shr.i.210, 16
  %cmp1.i.212 = icmp ugt i32 %shl.i.211, %aSig0.4.lcssa
  br i1 %cmp1.i.212, label %cond.false.i.213, label %cond.end.i

cond.false.i.213:                                 ; preds = %if.end.i
  %div.i = udiv i32 %aSig0.4.lcssa, %shr.i.210
  %shl2.i = shl i32 %div.i, 16
  br label %cond.end.i

cond.end.i:                                       ; preds = %cond.false.i.213, %if.end.i
  %cond.i.214 = phi i32 [ %shl2.i, %cond.false.i.213 ], [ -65536, %if.end.i ]
  %shr3.i.i.215 = lshr exact i32 %cond.i.214, 16
  %conv5.i.i.216 = and i32 %or.i.349, 65535
  %mul9.i.i.217 = mul nuw i32 %shr3.i.i.215, %conv5.i.i.216
  %mul15.i.i.218 = mul nuw i32 %shr3.i.i.215, %shr.i.210
  %shr17.i.i.219 = lshr i32 %mul9.i.i.217, 16
  %shl20.i.i.220 = shl i32 %mul9.i.i.217, 16
  %sub.i.i = sub i32 %aSig1.3.lcssa, %shl20.i.i.220
  %cmp.i.39.i = icmp ult i32 %aSig1.3.lcssa, %shl20.i.i.220
  %conv.neg.i.i = sext i1 %cmp.i.39.i to i32
  %add24.i.neg.i = sub i32 %aSig0.4.lcssa, %mul15.i.i.218
  %sub1.i.i = sub i32 %add24.i.neg.i, %shr17.i.i.219
  %sub2.i.i = add i32 %sub1.i.i, %conv.neg.i.i
  %cmp3.45.i = icmp slt i32 %sub2.i.i, 0
  br i1 %cmp3.45.i, label %while.body.lr.ph.i, label %while.end.i

while.body.lr.ph.i:                               ; preds = %cond.end.i
  %shl4.i = shl i32 %or.i.349, 16
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i, %while.body.lr.ph.i
  %z.048.i = phi i32 [ %cond.i.214, %while.body.lr.ph.i ], [ %sub.i.221, %while.body.i ]
  %rem0.047.i = phi i32 [ %sub2.i.i, %while.body.lr.ph.i ], [ %add2.i.i.223, %while.body.i ]
  %rem1.046.i = phi i32 [ %sub.i.i, %while.body.lr.ph.i ], [ %add.i.37.i, %while.body.i ]
  %sub.i.221 = add i32 %z.048.i, -65536
  %add.i.37.i = add i32 %rem1.046.i, %shl4.i
  %add1.i.i = add i32 %rem0.047.i, %shr.i.210
  %cmp.i.38.i = icmp ult i32 %add.i.37.i, %rem1.046.i
  %conv.i.i.222 = zext i1 %cmp.i.38.i to i32
  %add2.i.i.223 = add i32 %add1.i.i, %conv.i.i.222
  %cmp3.i = icmp slt i32 %add2.i.i.223, 0
  br i1 %cmp3.i, label %while.body.i, label %while.end.i.loopexit

while.end.i.loopexit:                             ; preds = %while.body.i
  %add2.i.i.223.lcssa = phi i32 [ %add2.i.i.223, %while.body.i ]
  %add.i.37.i.lcssa = phi i32 [ %add.i.37.i, %while.body.i ]
  %sub.i.221.lcssa = phi i32 [ %sub.i.221, %while.body.i ]
  br label %while.end.i

while.end.i:                                      ; preds = %while.end.i.loopexit, %cond.end.i
  %z.0.lcssa.i = phi i32 [ %cond.i.214, %cond.end.i ], [ %sub.i.221.lcssa, %while.end.i.loopexit ]
  %rem0.0.lcssa.i = phi i32 [ %sub2.i.i, %cond.end.i ], [ %add2.i.i.223.lcssa, %while.end.i.loopexit ]
  %rem1.0.lcssa.i = phi i32 [ %sub.i.i, %cond.end.i ], [ %add.i.37.i.lcssa, %while.end.i.loopexit ]
  %shl5.i = shl i32 %rem0.0.lcssa.i, 16
  %shr6.i = lshr i32 %rem1.0.lcssa.i, 16
  %or.i.224 = or i32 %shr6.i, %shl5.i
  %cmp8.i = icmp ugt i32 %shl.i.211, %or.i.224
  br i1 %cmp8.i, label %cond.false.10.i, label %cond.end.12.i

cond.false.10.i:                                  ; preds = %while.end.i
  %div11.i = udiv i32 %or.i.224, %shr.i.210
  br label %cond.end.12.i

cond.end.12.i:                                    ; preds = %cond.false.10.i, %while.end.i
  %cond13.i = phi i32 [ %div11.i, %cond.false.10.i ], [ 65535, %while.end.i ]
  %or14.i = or i32 %cond13.i, %z.0.lcssa.i
  br label %estimateDiv64To32.exit

estimateDiv64To32.exit:                           ; preds = %if.then.57, %cond.end.12.i
  %retval.0.i = phi i32 [ %or14.i, %cond.end.12.i ], [ -1, %if.then.57 ]
  %cmp59 = icmp ugt i32 %retval.0.i, 4
  %sub62 = add i32 %retval.0.i, -4
  %cond65 = select i1 %cmp59, i32 %sub62, i32 0
  %sub66 = sub nsw i32 0, %expDiff.0.lcssa
  %shr = lshr i32 %cond65, %sub66
  %shl.i.202 = shl i32 %shr.i.348, 24
  %18 = shl i32 %bSig1.1, 3
  %shr.i.203 = and i32 %18, 16777208
  %or.i.204 = or i32 %shl.i.202, %shr.i.203
  %shr3.i.205 = lshr i32 %or.i.349, 8
  %cmp67 = icmp slt i32 %expDiff.0.lcssa, -24
  br i1 %cmp67, label %if.then.69, label %if.else

if.then.69:                                       ; preds = %estimateDiv64To32.exit
  %sub70 = sub i32 -24, %expDiff.0.lcssa
  %sub.i.193 = sub nsw i32 0, %sub70
  %and.i.194 = and i32 %sub.i.193, 31
  %cmp.i.195 = icmp eq i32 %sub70, 0
  br i1 %cmp.i.195, label %if.end.71, label %if.else.i

if.else.i:                                        ; preds = %if.then.69
  %cmp1.i = icmp slt i32 %sub70, 32
  br i1 %cmp1.i, label %if.then.2.i, label %if.else.4.i

if.then.2.i:                                      ; preds = %if.else.i
  %shl.i.196 = shl i32 %aSig0.4.lcssa, %and.i.194
  %shr.i.197 = lshr i32 %aSig1.3.lcssa, %sub70
  %or.i.198 = or i32 %shl.i.196, %shr.i.197
  %shr3.i.199 = lshr i32 %aSig0.4.lcssa, %sub70
  br label %if.end.71

if.else.4.i:                                      ; preds = %if.else.i
  %cmp5.i = icmp slt i32 %sub70, 64
  %and6.i = and i32 %sub70, 31
  %shr7.i = lshr i32 %aSig0.4.lcssa, %and6.i
  %cond.i.200 = select i1 %cmp5.i, i32 %shr7.i, i32 0
  br label %if.end.71

if.else:                                          ; preds = %estimateDiv64To32.exit
  %add = add nsw i32 %expDiff.0.lcssa, 24
  %shl.i.187 = shl i32 %aSig1.3.lcssa, %add
  %cmp.i.188 = icmp eq i32 %add, 0
  br i1 %cmp.i.188, label %if.end.71, label %cond.false.i

cond.false.i:                                     ; preds = %if.else
  %shl1.i = shl i32 %aSig0.4.lcssa, %add
  %sub.i.189 = sub i32 -24, %expDiff.0.lcssa
  %and.i.190 = and i32 %sub.i.189, 31
  %shr.i.191 = lshr i32 %aSig1.3.lcssa, %and.i.190
  %or.i.192 = or i32 %shr.i.191, %shl1.i
  br label %if.end.71

if.end.71:                                        ; preds = %cond.false.i, %if.else, %if.else.4.i, %if.then.2.i, %if.then.69
  %aSig1.4 = phi i32 [ %or.i.198, %if.then.2.i ], [ %aSig1.3.lcssa, %if.then.69 ], [ %cond.i.200, %if.else.4.i ], [ %shl.i.187, %if.else ], [ %shl.i.187, %cond.false.i ]
  %aSig0.5 = phi i32 [ %shr3.i.199, %if.then.2.i ], [ %aSig0.4.lcssa, %if.then.69 ], [ 0, %if.else.4.i ], [ %aSig0.4.lcssa, %if.else ], [ %or.i.192, %cond.false.i ]
  %shr.i.i = lshr i32 %or.i.204, 16
  %shr3.i.i = lshr i32 %shr, 16
  %conv5.i.i = and i32 %18, 65528
  %conv6.i.i = and i32 %shr, 65535
  %mul.i.i = mul nuw i32 %conv6.i.i, %conv5.i.i
  %mul9.i.i = mul nuw i32 %shr3.i.i, %conv5.i.i
  %mul12.i.i = mul nuw i32 %conv6.i.i, %shr.i.i
  %mul15.i.i = mul nuw i32 %shr3.i.i, %shr.i.i
  %add.i.i = add i32 %mul9.i.i, %mul12.i.i
  %cmp.i.i = icmp ult i32 %add.i.i, %mul12.i.i
  %conv16.i.i = zext i1 %cmp.i.i to i32
  %shl.i.i = shl nuw nsw i32 %conv16.i.i, 16
  %shr17.i.i = lshr i32 %add.i.i, 16
  %add18.i.i = or i32 %shl.i.i, %shr17.i.i
  %shl20.i.i = shl i32 %add.i.i, 16
  %add21.i.i = add i32 %shl20.i.i, %mul.i.i
  %cmp22.i.i = icmp ult i32 %add21.i.i, %shl20.i.i
  %shr.i.4.i = lshr i32 %shl1.i.347, 24
  %conv5.i.6.i = and i32 %shr3.i.205, 65535
  %mul.i.8.i = mul nuw i32 %conv6.i.i, %conv5.i.6.i
  %mul9.i.9.i = mul nuw i32 %shr3.i.i, %conv5.i.6.i
  %mul12.i.10.i = mul nuw nsw i32 %conv6.i.i, %shr.i.4.i
  %add.i.12.i = add i32 %mul9.i.9.i, %mul12.i.10.i
  %shl20.i.19.i = shl i32 %add.i.12.i, 16
  %sub.i.182 = sub i32 %aSig1.4, %add21.i.i
  %conv23.i.i.neg = sext i1 %cmp22.i.i to i32
  %cmp.i.184 = icmp ult i32 %aSig1.4, %add21.i.i
  %conv.neg.i.185 = sext i1 %cmp.i.184 to i32
  %sum = add i32 %mul15.i.i, %mul.i.8.i
  %sum601 = add i32 %sum, %shl20.i.19.i
  %sum602 = add i32 %sum601, %add18.i.i
  %add.i.2.i.neg = sub i32 %conv23.i.i.neg, %sum602
  %sub1.i.183 = add i32 %add.i.2.i.neg, %aSig0.5
  %sub2.i.186 = add i32 %sub1.i.183, %conv.neg.i.185
  br label %do.body.preheader

if.else.72:                                       ; preds = %while.end
  %shl.i.178 = shl i32 %aSig0.4.lcssa, 24
  %shr.i.179 = lshr i32 %aSig1.3.lcssa, 8
  %or.i.180 = or i32 %shl.i.178, %shr.i.179
  %shr3.i.181 = lshr i32 %aSig0.4.lcssa, 8
  %shl.i = shl i32 %shr.i.348, 24
  %19 = shl i32 %bSig1.1, 3
  %shr.i = and i32 %19, 16777208
  %or.i = or i32 %shl.i, %shr.i
  %shr3.i = lshr i32 %or.i.349, 8
  br label %do.body.preheader

do.body.preheader:                                ; preds = %if.else.72, %if.end.71
  %aSig1.5.ph = phi i32 [ %or.i.180, %if.else.72 ], [ %sub.i.182, %if.end.71 ]
  %bSig0.3.ph = phi i32 [ %shr3.i, %if.else.72 ], [ %shr3.i.205, %if.end.71 ]
  %bSig1.2.ph = phi i32 [ %or.i, %if.else.72 ], [ %or.i.204, %if.end.71 ]
  %aSig0.6.ph = phi i32 [ %shr3.i.181, %if.else.72 ], [ %sub2.i.186, %if.end.71 ]
  %q.1.ph = phi i32 [ %q.0.lcssa, %if.else.72 ], [ %shr, %if.end.71 ]
  br label %do.body

do.body:                                          ; preds = %do.body.preheader, %do.body
  %aSig1.5 = phi i32 [ %sub.i.173, %do.body ], [ %aSig1.5.ph, %do.body.preheader ]
  %aSig0.6 = phi i32 [ %sub2.i.177, %do.body ], [ %aSig0.6.ph, %do.body.preheader ]
  %q.1 = phi i32 [ %inc, %do.body ], [ %q.1.ph, %do.body.preheader ]
  %inc = add i32 %q.1, 1
  %sub.i.173 = sub i32 %aSig1.5, %bSig1.2.ph
  %sub1.i.174 = sub i32 %aSig0.6, %bSig0.3.ph
  %cmp.i.175 = icmp ult i32 %aSig1.5, %bSig1.2.ph
  %conv.neg.i.176 = sext i1 %cmp.i.175 to i32
  %sub2.i.177 = add i32 %sub1.i.174, %conv.neg.i.176
  %cmp74 = icmp sgt i32 %sub2.i.177, -1
  br i1 %cmp74, label %do.body, label %do.end

do.end:                                           ; preds = %do.body
  %sub2.i.177.lcssa = phi i32 [ %sub2.i.177, %do.body ]
  %sub.i.173.lcssa = phi i32 [ %sub.i.173, %do.body ]
  %inc.lcssa = phi i32 [ %inc, %do.body ]
  %aSig0.6.lcssa = phi i32 [ %aSig0.6, %do.body ]
  %aSig1.5.lcssa = phi i32 [ %aSig1.5, %do.body ]
  %add.i = add i32 %sub.i.173.lcssa, %aSig1.5.lcssa
  %add1.i = add i32 %sub2.i.177.lcssa, %aSig0.6.lcssa
  %cmp.i.172 = icmp ult i32 %add.i, %sub.i.173.lcssa
  %conv.i = zext i1 %cmp.i.172 to i32
  %add2.i = add i32 %add1.i, %conv.i
  %cmp76 = icmp slt i32 %add2.i, 0
  br i1 %cmp76, label %if.end.85, label %lor.lhs.false.78

lor.lhs.false.78:                                 ; preds = %do.end
  %or79 = or i32 %add2.i, %add.i
  %cmp80 = icmp ne i32 %or79, 0
  %and = and i32 %inc.lcssa, 1
  %tobool83 = icmp eq i32 %and, 0
  %or.cond = or i1 %tobool83, %cmp80
  br i1 %or.cond, label %if.then.89, label %if.end.85

if.end.85:                                        ; preds = %do.end, %lor.lhs.false.78
  %cmp86 = icmp slt i32 %aSig0.6.lcssa, 0
  %.lobit = lshr i32 %aSig0.6.lcssa, 31
  br i1 %cmp86, label %if.then.89, label %if.end.90

if.then.89:                                       ; preds = %lor.lhs.false.78, %if.end.85
  %.lobit584 = phi i32 [ %.lobit, %if.end.85 ], [ 1, %lor.lhs.false.78 ]
  %aSig0.7582 = phi i32 [ %aSig0.6.lcssa, %if.end.85 ], [ %sub2.i.177.lcssa, %lor.lhs.false.78 ]
  %aSig1.6581 = phi i32 [ %aSig1.5.lcssa, %if.end.85 ], [ %sub.i.173.lcssa, %lor.lhs.false.78 ]
  %sub.i = sub i32 0, %aSig1.6581
  %cmp.i = icmp ne i32 %aSig1.6581, 0
  %conv.neg.i = sext i1 %cmp.i to i32
  %sub2.i = sub i32 %conv.neg.i, %aSig0.7582
  br label %if.end.90

if.end.90:                                        ; preds = %if.then.89, %if.end.85
  %.lobit583 = phi i32 [ %.lobit584, %if.then.89 ], [ %.lobit, %if.end.85 ]
  %aSig1.7 = phi i32 [ %sub.i, %if.then.89 ], [ %aSig1.5.lcssa, %if.end.85 ]
  %aSig0.8 = phi i32 [ %sub2.i, %if.then.89 ], [ %aSig0.6.lcssa, %if.end.85 ]
  %xor = xor i32 %.lobit583, %shr.i.505
  %sub91 = add nsw i32 %bExp.0, -4
  %call92 = tail call fastcc i64 @normalizeRoundAndPackFloat64(i32 %xor, i32 %sub91, i32 %aSig0.8, i32 %aSig1.7) #5
  %retval.sroa.8.0.extract.shift164 = and i64 %call92, -4294967296
  br label %cleanup

cleanup:                                          ; preds = %if.end.90, %if.then.37, %if.then.33, %invalid, %if.end.20, %propagateFloat64NaN.exit, %propagateFloat64NaN.exit496
  %retval.sroa.0.0 = phi i64 [ %retval.sroa.0.0.insert.insert.i.494, %propagateFloat64NaN.exit496 ], [ 4294967295, %invalid ], [ %retval.sroa.0.0.insert.insert.i, %propagateFloat64NaN.exit ], [ %a.coerce, %if.end.20 ], [ %a.coerce, %if.then.33 ], [ %a.coerce, %if.then.37 ], [ %call92, %if.end.90 ]
  %retval.sroa.8.0 = phi i64 [ %retval.sroa.5.0.insert.shift.i.492, %propagateFloat64NaN.exit496 ], [ 9223372032559808512, %invalid ], [ %retval.sroa.5.0.insert.shift.i, %propagateFloat64NaN.exit ], [ %retval.sroa.8.0.extract.shift166, %if.end.20 ], [ %retval.sroa.8.0.extract.shift168, %if.then.33 ], [ %retval.sroa.8.0.extract.shift170, %if.then.37 ], [ %retval.sroa.8.0.extract.shift164, %if.end.90 ]
  %retval.sroa.0.0.insert.ext = and i64 %retval.sroa.0.0, 4294967295
  %retval.sroa.0.0.insert.insert = or i64 %retval.sroa.8.0, %retval.sroa.0.0.insert.ext
  ret i64 %retval.sroa.0.0.insert.insert
}

; Function Attrs: noimplicitfloat nounwind uwtable
define internal fastcc i64 @normalizeRoundAndPackFloat64(i32 %zSign, i32 %zExp, i32 %zSig0, i32 %zSig1) #2 {
entry:
  %cmp = icmp eq i32 %zSig0, 0
  %sub = add nsw i32 %zExp, -32
  %zSig1.zSig0 = select i1 %cmp, i32 %zSig1, i32 %zSig0
  %.zSig1 = select i1 %cmp, i32 0, i32 %zSig1
  %sub.zExp = select i1 %cmp, i32 %sub, i32 %zExp
  %cmp.i = icmp ult i32 %zSig1.zSig0, 65536
  %shl.i = shl i32 %zSig1.zSig0, 16
  %shl.a.i = select i1 %cmp.i, i32 %shl.i, i32 %zSig1.zSig0
  %..i = select i1 %cmp.i, i32 16, i32 0
  %cmp1.i = icmp ult i32 %shl.a.i, 16777216
  %add3.i = or i32 %..i, 8
  %shl4.i = shl i32 %shl.a.i, 8
  %a.addr.1.i = select i1 %cmp1.i, i32 %shl4.i, i32 %shl.a.i
  %shiftCount.1.i = select i1 %cmp1.i, i32 %add3.i, i32 %..i
  %shr.i = lshr i32 %a.addr.1.i, 24
  %idxprom.i = zext i32 %shr.i to i64
  %arrayidx.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i64 0, i64 %idxprom.i
  %0 = load i32, i32* %arrayidx.i, align 4, !tbaa !1
  %add6.i = add nsw i32 %0, %shiftCount.1.i
  %sub1 = add nsw i32 %add6.i, -11
  %cmp2 = icmp sgt i32 %sub1, -1
  br i1 %cmp2, label %if.then.3, label %if.else

if.then.3:                                        ; preds = %entry
  %shl.i.14 = shl i32 %.zSig1, %sub1
  %cmp.i.15 = icmp eq i32 %sub1, 0
  br i1 %cmp.i.15, label %if.end.5, label %cond.false.i

cond.false.i:                                     ; preds = %if.then.3
  %shl1.i = shl i32 %zSig1.zSig0, %sub1
  %sub.i = sub i32 11, %add6.i
  %and.i = and i32 %sub.i, 31
  %shr.i.16 = lshr i32 %.zSig1, %and.i
  %or.i = or i32 %shr.i.16, %shl1.i
  br label %if.end.5

if.else:                                          ; preds = %entry
  %sub4 = sub i32 11, %add6.i
  %sub.i.17 = sub nsw i32 0, %sub4
  %and.i.18 = and i32 %sub.i.17, 31
  %cmp.i.19 = icmp eq i32 %sub4, 0
  br i1 %cmp.i.19, label %if.end.5, label %if.else.i

if.else.i:                                        ; preds = %if.else
  %cmp1.i.20 = icmp slt i32 %sub4, 32
  br i1 %cmp1.i.20, label %if.then.2.i, label %if.else.5.i

if.then.2.i:                                      ; preds = %if.else.i
  %shl.i.21 = shl i32 %.zSig1, %and.i.18
  %shl3.i = shl i32 %zSig1.zSig0, %and.i.18
  %shr.i.22 = lshr i32 %.zSig1, %sub4
  %or.i.23 = or i32 %shl3.i, %shr.i.22
  %shr4.i = lshr i32 %zSig1.zSig0, %sub4
  br label %if.end.19.i

if.else.5.i:                                      ; preds = %if.else.i
  %cmp6.i = icmp eq i32 %sub4, 32
  br i1 %cmp6.i, label %if.end.19.i, label %if.else.8.i

if.else.8.i:                                      ; preds = %if.else.5.i
  %cmp10.i = icmp slt i32 %sub4, 64
  br i1 %cmp10.i, label %if.then.11.i, label %if.else.15.i

if.then.11.i:                                     ; preds = %if.else.8.i
  %shl12.i = shl i32 %zSig1.zSig0, %and.i.18
  %and13.i = and i32 %sub4, 31
  %shr14.i = lshr i32 %zSig1.zSig0, %and13.i
  br label %if.end.19.i

if.else.15.i:                                     ; preds = %if.else.8.i
  %cmp16.i = icmp eq i32 %sub4, 64
  %cmp17.i = icmp ne i32 %zSig1.zSig0, 0
  %conv.i = zext i1 %cmp17.i to i32
  %cond.i.24 = select i1 %cmp16.i, i32 %zSig1.zSig0, i32 %conv.i
  br label %if.end.19.i

if.end.19.i:                                      ; preds = %if.else.15.i, %if.then.11.i, %if.else.5.i, %if.then.2.i
  %z0.0.i = phi i32 [ %shr4.i, %if.then.2.i ], [ 0, %if.else.5.i ], [ 0, %if.then.11.i ], [ 0, %if.else.15.i ]
  %z1.1.i = phi i32 [ %or.i.23, %if.then.2.i ], [ %zSig1.zSig0, %if.else.5.i ], [ %shr14.i, %if.then.11.i ], [ 0, %if.else.15.i ]
  %z2.1.i = phi i32 [ %shl.i.21, %if.then.2.i ], [ %.zSig1, %if.else.5.i ], [ %shl12.i, %if.then.11.i ], [ %cond.i.24, %if.else.15.i ]
  %a2.addr.1.i = phi i32 [ 0, %if.then.2.i ], [ 0, %if.else.5.i ], [ %.zSig1, %if.then.11.i ], [ %.zSig1, %if.else.15.i ]
  %cmp20.i = icmp ne i32 %a2.addr.1.i, 0
  %conv21.i = zext i1 %cmp20.i to i32
  %or22.i = or i32 %conv21.i, %z2.1.i
  br label %if.end.5

if.end.5:                                         ; preds = %if.end.19.i, %if.else, %cond.false.i, %if.then.3
  %zSig0.addr.1 = phi i32 [ %or.i, %cond.false.i ], [ %zSig1.zSig0, %if.then.3 ], [ %z0.0.i, %if.end.19.i ], [ %zSig1.zSig0, %if.else ]
  %zSig1.addr.1 = phi i32 [ %shl.i.14, %cond.false.i ], [ %shl.i.14, %if.then.3 ], [ %z1.1.i, %if.end.19.i ], [ %.zSig1, %if.else ]
  %zSig2.0 = phi i32 [ 0, %cond.false.i ], [ 0, %if.then.3 ], [ %or22.i, %if.end.19.i ], [ 0, %if.else ]
  %sub6 = sub nsw i32 %sub.zExp, %sub1
  %call7 = tail call fastcc i64 @roundAndPackFloat64(i32 %zSign, i32 %sub6, i32 %zSig0.addr.1, i32 %zSig1.addr.1, i32 %zSig2.0) #5
  ret i64 %call7
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i64 @float64_sqrt(i64 %a.coerce) #2 {
entry:
  %a.sroa.0.0.extract.trunc.i = trunc i64 %a.coerce to i32
  %a.sroa.1.0.extract.shift.i = lshr i64 %a.coerce, 32
  %a.sroa.1.0.extract.trunc.i = trunc i64 %a.sroa.1.0.extract.shift.i to i32
  %and.i = and i32 %a.sroa.1.0.extract.trunc.i, 1048575
  %a.sroa.1.0.extract.shift.i.270 = lshr i64 %a.coerce, 52
  %shr.i.271 = trunc i64 %a.sroa.1.0.extract.shift.i.270 to i32
  %and.i.272 = and i32 %shr.i.271, 2047
  %a.sroa.1.0.extract.shift.i.268 = lshr i64 %a.coerce, 63
  %shr.i.269 = trunc i64 %a.sroa.1.0.extract.shift.i.268 to i32
  %cmp = icmp eq i32 %and.i.272, 2047
  br i1 %cmp, label %if.then, label %if.end.9

if.then:                                          ; preds = %entry
  %or = or i32 %and.i, %a.sroa.0.0.extract.trunc.i
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %if.end, label %if.then.4

if.then.4:                                        ; preds = %if.then
  %and.i.57.i = and i64 %a.coerce, 9221120237041090560
  %cmp.i.58.i = icmp eq i64 %and.i.57.i, 9218868437227405312
  br i1 %cmp.i.58.i, label %land.rhs.i.61.i, label %float64_is_signaling_nan.exit.i

land.rhs.i.61.i:                                  ; preds = %if.then.4
  %tobool.i.60.i = icmp eq i32 %a.sroa.0.0.extract.trunc.i, 0
  br i1 %tobool.i.60.i, label %lor.rhs.i.i, label %float64_is_signaling_nan.exit.thread.i

float64_is_signaling_nan.exit.thread.i:           ; preds = %land.rhs.i.61.i
  %or.68.i = or i32 %a.sroa.1.0.extract.trunc.i, 524288
  br label %if.then.i.266

lor.rhs.i.i:                                      ; preds = %land.rhs.i.61.i
  %and2.i.62.i = and i64 %a.coerce, 2251795518717952
  %tobool3.i.63.i = icmp ne i64 %and2.i.62.i, 0
  %and2.i.i = and i64 %a.coerce, 2251795518717952
  %tobool3.i.i = icmp ne i64 %and2.i.i, 0
  br label %float64_is_signaling_nan.exit.i

float64_is_signaling_nan.exit.i:                  ; preds = %if.then.4, %lor.rhs.i.i
  %0 = phi i1 [ %tobool3.i.63.i, %lor.rhs.i.i ], [ false, %if.then.4 ]
  %1 = phi i1 [ %tobool3.i.i, %lor.rhs.i.i ], [ false, %if.then.4 ]
  %or.i.264 = or i32 %a.sroa.1.0.extract.trunc.i, 524288
  %or667.i = or i1 %0, %1
  br i1 %or667.i, label %if.then.i.266, label %propagateFloat64NaN.exit

if.then.i.266:                                    ; preds = %float64_is_signaling_nan.exit.i, %float64_is_signaling_nan.exit.thread.i
  %or574.i = phi i32 [ %or.68.i, %float64_is_signaling_nan.exit.thread.i ], [ %or.i.264, %float64_is_signaling_nan.exit.i ]
  %2 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.265 = or i32 %2, 16
  store i32 %or.i.i.265, i32* @float_exception_flags, align 4, !tbaa !1
  br label %propagateFloat64NaN.exit

propagateFloat64NaN.exit:                         ; preds = %float64_is_signaling_nan.exit.i, %if.then.i.266
  %or573.i = phi i32 [ %or.i.264, %float64_is_signaling_nan.exit.i ], [ %or574.i, %if.then.i.266 ]
  %retval.sroa.5.0.insert.ext.i = zext i32 %or573.i to i64
  %retval.sroa.5.0.insert.shift.i = shl nuw i64 %retval.sroa.5.0.insert.ext.i, 32
  %retval.sroa.0.0.insert.ext.i = and i64 %a.coerce, 4294967295
  %retval.sroa.0.0.insert.insert.i = or i64 %retval.sroa.5.0.insert.shift.i, %retval.sroa.0.0.insert.ext.i
  br label %cleanup

if.end:                                           ; preds = %if.then
  %tobool6 = icmp eq i32 %shr.i.269, 0
  br i1 %tobool6, label %if.then.7, label %invalid

if.then.7:                                        ; preds = %if.end
  %retval.sroa.7.0.extract.shift101 = and i64 %a.coerce, -4294967296
  br label %cleanup

if.end.9:                                         ; preds = %entry
  %tobool10 = icmp eq i32 %shr.i.269, 0
  br i1 %tobool10, label %if.end.17, label %if.then.11

if.then.11:                                       ; preds = %if.end.9
  %or12 = or i32 %and.i, %a.sroa.0.0.extract.trunc.i
  %or13 = or i32 %or12, %and.i.272
  %cmp14 = icmp eq i32 %or13, 0
  br i1 %cmp14, label %if.then.15, label %invalid

if.then.15:                                       ; preds = %if.then.11
  %retval.sroa.7.0.extract.shift103 = and i64 %a.coerce, -4294967296
  br label %cleanup

invalid:                                          ; preds = %if.end, %if.then.11
  %3 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.259 = or i32 %3, 16
  store i32 %or.i.259, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.17:                                        ; preds = %if.end.9
  %cmp18 = icmp eq i32 %and.i.272, 0
  br i1 %cmp18, label %if.then.19, label %if.end.25

if.then.19:                                       ; preds = %if.end.17
  %or20 = or i32 %and.i, %a.sroa.0.0.extract.trunc.i
  %cmp21 = icmp eq i32 %or20, 0
  br i1 %cmp21, label %cleanup, label %if.end.24

if.end.24:                                        ; preds = %if.then.19
  %cmp.i.247 = icmp eq i32 %and.i, 0
  br i1 %cmp.i.247, label %if.then.i.250, label %if.else.7.i

if.then.i.250:                                    ; preds = %if.end.24
  %cmp.i.i = icmp ult i32 %a.sroa.0.0.extract.trunc.i, 65536
  %shl.i.i = shl i32 %a.sroa.0.0.extract.trunc.i, 16
  %shl.a.i.i = select i1 %cmp.i.i, i32 %shl.i.i, i32 %a.sroa.0.0.extract.trunc.i
  %..i.i = select i1 %cmp.i.i, i32 16, i32 0
  %cmp1.i.i = icmp ult i32 %shl.a.i.i, 16777216
  %add3.i.i = or i32 %..i.i, 8
  %shl4.i.i = shl i32 %shl.a.i.i, 8
  %a.addr.1.i.i = select i1 %cmp1.i.i, i32 %shl4.i.i, i32 %shl.a.i.i
  %shiftCount.1.i.i = select i1 %cmp1.i.i, i32 %add3.i.i, i32 %..i.i
  %shr.i.i = lshr i32 %a.addr.1.i.i, 24
  %idxprom.i.i = zext i32 %shr.i.i to i64
  %arrayidx.i.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i64 0, i64 %idxprom.i.i
  %4 = load i32, i32* %arrayidx.i.i, align 4, !tbaa !1
  %add6.i.i = add nsw i32 %4, %shiftCount.1.i.i
  %sub.i.248 = add nsw i32 %add6.i.i, -11
  %cmp1.i.249 = icmp slt i32 %add6.i.i, 11
  br i1 %cmp1.i.249, label %if.then.2.i, label %if.else.i.255

if.then.2.i:                                      ; preds = %if.then.i.250
  %sub3.i = sub i32 11, %add6.i.i
  %shr.i.251 = lshr i32 %a.sroa.0.0.extract.trunc.i, %sub3.i
  %and.i.252 = and i32 %sub.i.248, 31
  %shl.i.253 = shl i32 %a.sroa.0.0.extract.trunc.i, %and.i.252
  br label %if.end.i.256

if.else.i.255:                                    ; preds = %if.then.i.250
  %shl4.i.254 = shl i32 %a.sroa.0.0.extract.trunc.i, %sub.i.248
  br label %if.end.i.256

if.end.i.256:                                     ; preds = %if.else.i.255, %if.then.2.i
  %aSig0.0 = phi i32 [ %shr.i.251, %if.then.2.i ], [ %shl4.i.254, %if.else.i.255 ]
  %storemerge.28.i = phi i32 [ %shl.i.253, %if.then.2.i ], [ 0, %if.else.i.255 ]
  %sub6.i = sub i32 -20, %add6.i.i
  br label %if.end.25

if.else.7.i:                                      ; preds = %if.end.24
  %cmp.i.32.i = icmp ult i32 %and.i, 65536
  %shl.i.33.i325 = shl nuw nsw i64 %a.sroa.1.0.extract.shift.i, 16
  %shl.i.33.i = trunc i64 %shl.i.33.i325 to i32
  %shl.a.i.34.i = select i1 %cmp.i.32.i, i32 %shl.i.33.i, i32 %and.i
  %..i.35.i = select i1 %cmp.i.32.i, i32 16, i32 0
  %cmp1.i.36.i = icmp ult i32 %shl.a.i.34.i, 16777216
  %add3.i.37.i = or i32 %..i.35.i, 8
  %shl4.i.38.i = shl i32 %shl.a.i.34.i, 8
  %a.addr.1.i.39.i = select i1 %cmp1.i.36.i, i32 %shl4.i.38.i, i32 %shl.a.i.34.i
  %shiftCount.1.i.40.i = select i1 %cmp1.i.36.i, i32 %add3.i.37.i, i32 %..i.35.i
  %shr.i.41.i = lshr i32 %a.addr.1.i.39.i, 24
  %idxprom.i.42.i = zext i32 %shr.i.41.i to i64
  %arrayidx.i.43.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i64 0, i64 %idxprom.i.42.i
  %5 = load i32, i32* %arrayidx.i.43.i, align 4, !tbaa !1
  %add6.i.44.i = add nsw i32 %5, %shiftCount.1.i.40.i
  %sub9.i.257 = add nsw i32 %add6.i.44.i, -11
  %shl.i.29.i = shl i32 %a.sroa.0.0.extract.trunc.i, %sub9.i.257
  %cmp.i.30.i = icmp eq i32 %sub9.i.257, 0
  br i1 %cmp.i.30.i, label %shortShift64Left.exit.i, label %cond.false.i.i

cond.false.i.i:                                   ; preds = %if.else.7.i
  %shl1.i.i = shl i32 %and.i, %sub9.i.257
  %sub.i.i.258 = sub i32 11, %add6.i.44.i
  %and.i.i = and i32 %sub.i.i.258, 31
  %shr.i.31.i = lshr i32 %a.sroa.0.0.extract.trunc.i, %and.i.i
  %or.i.i = or i32 %shr.i.31.i, %shl1.i.i
  br label %shortShift64Left.exit.i

shortShift64Left.exit.i:                          ; preds = %cond.false.i.i, %if.else.7.i
  %cond.i.i = phi i32 [ %or.i.i, %cond.false.i.i ], [ %and.i, %if.else.7.i ]
  %sub10.i = sub i32 12, %add6.i.44.i
  br label %if.end.25

if.end.25:                                        ; preds = %shortShift64Left.exit.i, %if.end.i.256, %if.end.17
  %aSig0.2 = phi i32 [ %and.i, %if.end.17 ], [ %aSig0.0, %if.end.i.256 ], [ %cond.i.i, %shortShift64Left.exit.i ]
  %aSig1.1 = phi i32 [ %a.sroa.0.0.extract.trunc.i, %if.end.17 ], [ %storemerge.28.i, %if.end.i.256 ], [ %shl.i.29.i, %shortShift64Left.exit.i ]
  %aExp.0 = phi i32 [ %and.i.272, %if.end.17 ], [ %sub6.i, %if.end.i.256 ], [ %sub10.i, %shortShift64Left.exit.i ]
  %sub = add nsw i32 %aExp.0, -1023
  %shr = ashr i32 %sub, 1
  %add = add nsw i32 %shr, 1022
  %or26 = or i32 %aSig0.2, 1048576
  %shl1.i.241 = shl i32 %or26, 11
  %shr.i.242 = lshr i32 %aSig1.1, 21
  %or.i.243 = or i32 %shr.i.242, %shl1.i.241
  %6 = lshr i32 %aSig0.2, 16
  %and.i.179 = and i32 %6, 15
  %and1.i = and i32 %aExp.0, 1
  %tobool.i = icmp eq i32 %and1.i, 0
  %7 = lshr i32 %or26, 6
  %shr2.i = and i32 %7, 32767
  br i1 %tobool.i, label %if.else.i, label %if.then.i

if.then.i:                                        ; preds = %if.end.25
  %add.i.180 = add nuw nsw i32 %shr2.i, 16384
  %idxprom.44.i = zext i32 %and.i.179 to i64
  %arrayidx.i = getelementptr inbounds [16 x i16], [16 x i16]* @estimateSqrt32.sqrtOddAdjustments, i64 0, i64 %idxprom.44.i
  %8 = load i16, i16* %arrayidx.i, align 2, !tbaa !5
  %conv.i.181 = zext i16 %8 to i32
  %sub.i.182 = sub nsw i32 %add.i.180, %conv.i.181
  %div.i.183 = udiv i32 %or.i.243, %sub.i.182
  %shl.i.184 = shl i32 %div.i.183, 14
  %shl3.i.185 = shl i32 %sub.i.182, 15
  %add4.i = add i32 %shl3.i.185, %shl.i.184
  %shr5.i = lshr i32 %or.i.243, 1
  br label %if.end.20.i

if.else.i:                                        ; preds = %if.end.25
  %add7.i = or i32 %shr2.i, 32768
  %idxprom8.43.i = zext i32 %and.i.179 to i64
  %arrayidx9.i = getelementptr inbounds [16 x i16], [16 x i16]* @estimateSqrt32.sqrtEvenAdjustments, i64 0, i64 %idxprom8.43.i
  %9 = load i16, i16* %arrayidx9.i, align 2, !tbaa !5
  %conv10.i = zext i16 %9 to i32
  %sub11.i = sub nsw i32 %add7.i, %conv10.i
  %div12.i = udiv i32 %or.i.243, %sub11.i
  %add13.i = add i32 %sub11.i, %div12.i
  %cmp.i.186 = icmp ugt i32 %add13.i, 131071
  %shl15.i = shl i32 %add13.i, 15
  %cond.i.187 = select i1 %cmp.i.186, i32 -32768, i32 %shl15.i
  %cmp16.i = icmp ugt i32 %cond.i.187, %or.i.243
  br i1 %cmp16.i, label %if.end.20.i, label %if.then.18.i

if.then.18.i:                                     ; preds = %if.else.i
  %shr19.i = ashr i32 %or.i.243, 1
  br label %estimateSqrt32.exit

if.end.20.i:                                      ; preds = %if.else.i, %if.then.i
  %a.addr.0.i = phi i32 [ %shr5.i, %if.then.i ], [ %or.i.243, %if.else.i ]
  %z.0.i = phi i32 [ %add4.i, %if.then.i ], [ %cond.i.187, %if.else.i ]
  %cmp.i.189 = icmp ugt i32 %z.0.i, %a.addr.0.i
  br i1 %cmp.i.189, label %if.end.i.193, label %estimateDiv64To32.exit239

if.end.i.193:                                     ; preds = %if.end.20.i
  %shr.i.190 = lshr i32 %z.0.i, 16
  %shl.i.191 = shl nuw i32 %shr.i.190, 16
  %cmp1.i.192 = icmp ugt i32 %shl.i.191, %a.addr.0.i
  br i1 %cmp1.i.192, label %cond.false.i.196, label %cond.end.i.211

cond.false.i.196:                                 ; preds = %if.end.i.193
  %div.i.194 = udiv i32 %a.addr.0.i, %shr.i.190
  %shl2.i.195 = shl i32 %div.i.194, 16
  br label %cond.end.i.211

cond.end.i.211:                                   ; preds = %cond.false.i.196, %if.end.i.193
  %cond.i.197 = phi i32 [ %shl2.i.195, %cond.false.i.196 ], [ -65536, %if.end.i.193 ]
  %shr3.i.i.198 = lshr exact i32 %cond.i.197, 16
  %conv5.i.i.199 = and i32 %z.0.i, 65535
  %mul9.i.i.200 = mul nuw i32 %shr3.i.i.198, %conv5.i.i.199
  %mul15.i.i.201 = mul nuw i32 %shr3.i.i.198, %shr.i.190
  %shr17.i.i.202 = lshr i32 %mul9.i.i.200, 16
  %shl20.i.i.203 = shl i32 %mul9.i.i.200, 16
  %sub.i.i.204 = sub i32 0, %shl20.i.i.203
  %cmp.i.39.i.205 = icmp ne i32 %shl20.i.i.203, 0
  %conv.neg.i.i.206 = sext i1 %cmp.i.39.i.205 to i32
  %add24.i.neg.i.207 = sub i32 %a.addr.0.i, %mul15.i.i.201
  %sub1.i.i.208 = sub i32 %add24.i.neg.i.207, %shr17.i.i.202
  %sub2.i.i.209 = add i32 %sub1.i.i.208, %conv.neg.i.i.206
  %cmp3.45.i.210 = icmp slt i32 %sub2.i.i.209, 0
  br i1 %cmp3.45.i.210, label %while.body.lr.ph.i.213, label %while.end.i.232

while.body.lr.ph.i.213:                           ; preds = %cond.end.i.211
  %shl4.i.212 = shl i32 %z.0.i, 16
  br label %while.body.i.224

while.body.i.224:                                 ; preds = %while.body.i.224, %while.body.lr.ph.i.213
  %z.048.i.214 = phi i32 [ %cond.i.197, %while.body.lr.ph.i.213 ], [ %sub.i.217, %while.body.i.224 ]
  %rem0.047.i.215 = phi i32 [ %sub2.i.i.209, %while.body.lr.ph.i.213 ], [ %add2.i.i.222, %while.body.i.224 ]
  %rem1.046.i.216 = phi i32 [ %sub.i.i.204, %while.body.lr.ph.i.213 ], [ %add.i.37.i.218, %while.body.i.224 ]
  %sub.i.217 = add i32 %z.048.i.214, -65536
  %add.i.37.i.218 = add i32 %rem1.046.i.216, %shl4.i.212
  %add1.i.i.219 = add i32 %rem0.047.i.215, %shr.i.190
  %cmp.i.38.i.220 = icmp ult i32 %add.i.37.i.218, %rem1.046.i.216
  %conv.i.i.221 = zext i1 %cmp.i.38.i.220 to i32
  %add2.i.i.222 = add i32 %add1.i.i.219, %conv.i.i.221
  %cmp3.i.223 = icmp slt i32 %add2.i.i.222, 0
  br i1 %cmp3.i.223, label %while.body.i.224, label %while.end.i.232.loopexit

while.end.i.232.loopexit:                         ; preds = %while.body.i.224
  %add2.i.i.222.lcssa = phi i32 [ %add2.i.i.222, %while.body.i.224 ]
  %add.i.37.i.218.lcssa = phi i32 [ %add.i.37.i.218, %while.body.i.224 ]
  %sub.i.217.lcssa = phi i32 [ %sub.i.217, %while.body.i.224 ]
  br label %while.end.i.232

while.end.i.232:                                  ; preds = %while.end.i.232.loopexit, %cond.end.i.211
  %z.0.lcssa.i.225 = phi i32 [ %cond.i.197, %cond.end.i.211 ], [ %sub.i.217.lcssa, %while.end.i.232.loopexit ]
  %rem0.0.lcssa.i.226 = phi i32 [ %sub2.i.i.209, %cond.end.i.211 ], [ %add2.i.i.222.lcssa, %while.end.i.232.loopexit ]
  %rem1.0.lcssa.i.227 = phi i32 [ %sub.i.i.204, %cond.end.i.211 ], [ %add.i.37.i.218.lcssa, %while.end.i.232.loopexit ]
  %shl5.i.228 = shl i32 %rem0.0.lcssa.i.226, 16
  %shr6.i.229 = lshr i32 %rem1.0.lcssa.i.227, 16
  %or.i.230 = or i32 %shr6.i.229, %shl5.i.228
  %cmp8.i.231 = icmp ugt i32 %shl.i.191, %or.i.230
  br i1 %cmp8.i.231, label %cond.false.10.i.234, label %cond.end.12.i.237

cond.false.10.i.234:                              ; preds = %while.end.i.232
  %div11.i.233 = udiv i32 %or.i.230, %shr.i.190
  br label %cond.end.12.i.237

cond.end.12.i.237:                                ; preds = %cond.false.10.i.234, %while.end.i.232
  %cond13.i.235 = phi i32 [ %div11.i.233, %cond.false.10.i.234 ], [ 65535, %while.end.i.232 ]
  %or14.i.236 = or i32 %cond13.i.235, %z.0.lcssa.i.225
  %phitmp = lshr i32 %or14.i.236, 1
  br label %estimateDiv64To32.exit239

estimateDiv64To32.exit239:                        ; preds = %if.end.20.i, %cond.end.12.i.237
  %retval.0.i.238 = phi i32 [ %phitmp, %cond.end.12.i.237 ], [ 2147483647, %if.end.20.i ]
  %shr22.i = lshr i32 %z.0.i, 1
  %add23.i = add nuw i32 %retval.0.i.238, %shr22.i
  br label %estimateSqrt32.exit

estimateSqrt32.exit:                              ; preds = %if.then.18.i, %estimateDiv64To32.exit239
  %retval.0.i.188 = phi i32 [ %add23.i, %estimateDiv64To32.exit239 ], [ %shr19.i, %if.then.18.i ]
  %shr28 = lshr i32 %retval.0.i.188, 1
  %add29 = add nuw i32 %shr28, 1
  %add33 = shl i32 %add29, 1
  %sub34 = sub nsw i32 9, %and1.i
  %shl.i.170 = shl i32 %aSig1.1, %sub34
  %shl1.i = shl i32 %or26, %sub34
  %sub.i.171 = sub nsw i32 0, %sub34
  %and.i.172 = and i32 %sub.i.171, 31
  %shr.i.173 = lshr i32 %aSig1.1, %and.i.172
  %or.i.174 = or i32 %shr.i.173, %shl1.i
  %shr.i.150 = lshr i32 %add29, 16
  %conv5.i.152 = and i32 %add29, 65535
  %mul.i.154 = mul nuw i32 %conv5.i.152, %conv5.i.152
  %mul9.i.155 = mul nuw i32 %shr.i.150, %conv5.i.152
  %mul15.i.157 = mul nuw i32 %shr.i.150, %shr.i.150
  %add.i.158 = shl i32 %mul9.i.155, 1
  %cmp.i.159 = icmp ult i32 %add.i.158, %mul9.i.155
  %conv16.i.160 = zext i1 %cmp.i.159 to i32
  %shl.i.161 = shl nuw nsw i32 %conv16.i.160, 16
  %10 = lshr i32 %mul9.i.155, 15
  %shr17.i.162 = and i32 %10, 65535
  %add18.i.163 = or i32 %shl.i.161, %shr17.i.162
  %shl20.i.165 = shl i32 %mul9.i.155, 17
  %add21.i.166 = add i32 %shl20.i.165, %mul.i.154
  %cmp22.i.167 = icmp ult i32 %add21.i.166, %shl20.i.165
  %sub.i.145 = sub i32 %shl.i.170, %add21.i.166
  %conv23.i.168.neg = sext i1 %cmp22.i.167 to i32
  %cmp.i.147 = icmp ult i32 %shl.i.170, %add21.i.166
  %conv.neg.i.148 = sext i1 %cmp.i.147 to i32
  %add19.i.164.neg = sub i32 %or.i.174, %mul15.i.157
  %add24.i.169.neg = add i32 %add19.i.164.neg, %conv23.i.168.neg
  %sub1.i.146 = add i32 %add24.i.169.neg, %conv.neg.i.148
  %sub2.i.149 = sub i32 %sub1.i.146, %add18.i.163
  %cmp35.335 = icmp slt i32 %sub2.i.149, 0
  br i1 %cmp35.335, label %while.body.preheader, label %while.end

while.body.preheader:                             ; preds = %estimateSqrt32.exit
  br label %while.body

while.body:                                       ; preds = %while.body.preheader, %while.body
  %doubleZSig0.0339 = phi i32 [ %sub36, %while.body ], [ %add33, %while.body.preheader ]
  %rem1.0338 = phi i32 [ %add.i.142, %while.body ], [ %sub.i.145, %while.body.preheader ]
  %rem0.0337 = phi i32 [ %add2.i, %while.body ], [ %sub2.i.149, %while.body.preheader ]
  %zSig0.0336 = phi i32 [ %dec, %while.body ], [ %add29, %while.body.preheader ]
  %dec = add i32 %zSig0.0336, -1
  %sub36 = add i32 %doubleZSig0.0339, -2
  %or37 = or i32 %sub36, 1
  %add.i.142 = add i32 %or37, %rem1.0338
  %cmp.i.143 = icmp ult i32 %add.i.142, %rem1.0338
  %conv.i.144 = zext i1 %cmp.i.143 to i32
  %add2.i = add i32 %conv.i.144, %rem0.0337
  %cmp35 = icmp slt i32 %add2.i, 0
  br i1 %cmp35, label %while.body, label %while.end.loopexit

while.end.loopexit:                               ; preds = %while.body
  %add.i.142.lcssa = phi i32 [ %add.i.142, %while.body ]
  %sub36.lcssa = phi i32 [ %sub36, %while.body ]
  %dec.lcssa = phi i32 [ %dec, %while.body ]
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %estimateSqrt32.exit
  %doubleZSig0.0.lcssa = phi i32 [ %add33, %estimateSqrt32.exit ], [ %sub36.lcssa, %while.end.loopexit ]
  %rem1.0.lcssa = phi i32 [ %sub.i.145, %estimateSqrt32.exit ], [ %add.i.142.lcssa, %while.end.loopexit ]
  %zSig0.0.lcssa = phi i32 [ %add29, %estimateSqrt32.exit ], [ %dec.lcssa, %while.end.loopexit ]
  %cmp.i.137 = icmp ugt i32 %doubleZSig0.0.lcssa, %rem1.0.lcssa
  br i1 %cmp.i.137, label %if.end.i, label %if.end.56

if.end.i:                                         ; preds = %while.end
  %shr.i.138 = lshr i32 %doubleZSig0.0.lcssa, 16
  %shl.i.139 = shl nuw i32 %shr.i.138, 16
  %cmp1.i = icmp ugt i32 %shl.i.139, %rem1.0.lcssa
  br i1 %cmp1.i, label %cond.false.i, label %cond.end.i

cond.false.i:                                     ; preds = %if.end.i
  %div.i = udiv i32 %rem1.0.lcssa, %shr.i.138
  %shl2.i = shl i32 %div.i, 16
  br label %cond.end.i

cond.end.i:                                       ; preds = %cond.false.i, %if.end.i
  %cond.i = phi i32 [ %shl2.i, %cond.false.i ], [ -65536, %if.end.i ]
  %shr3.i.i = lshr exact i32 %cond.i, 16
  %conv5.i.i = and i32 %doubleZSig0.0.lcssa, 65534
  %mul9.i.i = mul nuw i32 %shr3.i.i, %conv5.i.i
  %mul15.i.i = mul nuw i32 %shr3.i.i, %shr.i.138
  %shr17.i.i = lshr i32 %mul9.i.i, 16
  %shl20.i.i = shl i32 %mul9.i.i, 16
  %sub.i.i = sub i32 0, %shl20.i.i
  %cmp.i.39.i = icmp ne i32 %shl20.i.i, 0
  %conv.neg.i.i = sext i1 %cmp.i.39.i to i32
  %add24.i.neg.i = sub i32 %rem1.0.lcssa, %mul15.i.i
  %sub1.i.i = sub i32 %add24.i.neg.i, %shr17.i.i
  %sub2.i.i = add i32 %sub1.i.i, %conv.neg.i.i
  %cmp3.45.i = icmp slt i32 %sub2.i.i, 0
  br i1 %cmp3.45.i, label %while.body.lr.ph.i, label %while.end.i

while.body.lr.ph.i:                               ; preds = %cond.end.i
  %shl4.i = shl i32 %doubleZSig0.0.lcssa, 16
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i, %while.body.lr.ph.i
  %z.048.i = phi i32 [ %cond.i, %while.body.lr.ph.i ], [ %sub.i.140, %while.body.i ]
  %rem0.047.i = phi i32 [ %sub2.i.i, %while.body.lr.ph.i ], [ %add2.i.i, %while.body.i ]
  %rem1.046.i = phi i32 [ %sub.i.i, %while.body.lr.ph.i ], [ %add.i.37.i, %while.body.i ]
  %sub.i.140 = add i32 %z.048.i, -65536
  %add.i.37.i = add i32 %rem1.046.i, %shl4.i
  %add1.i.i = add i32 %rem0.047.i, %shr.i.138
  %cmp.i.38.i = icmp ult i32 %add.i.37.i, %rem1.046.i
  %conv.i.i = zext i1 %cmp.i.38.i to i32
  %add2.i.i = add i32 %add1.i.i, %conv.i.i
  %cmp3.i = icmp slt i32 %add2.i.i, 0
  br i1 %cmp3.i, label %while.body.i, label %while.end.i.loopexit

while.end.i.loopexit:                             ; preds = %while.body.i
  %add2.i.i.lcssa = phi i32 [ %add2.i.i, %while.body.i ]
  %add.i.37.i.lcssa = phi i32 [ %add.i.37.i, %while.body.i ]
  %sub.i.140.lcssa = phi i32 [ %sub.i.140, %while.body.i ]
  br label %while.end.i

while.end.i:                                      ; preds = %while.end.i.loopexit, %cond.end.i
  %z.0.lcssa.i = phi i32 [ %cond.i, %cond.end.i ], [ %sub.i.140.lcssa, %while.end.i.loopexit ]
  %rem0.0.lcssa.i = phi i32 [ %sub2.i.i, %cond.end.i ], [ %add2.i.i.lcssa, %while.end.i.loopexit ]
  %rem1.0.lcssa.i = phi i32 [ %sub.i.i, %cond.end.i ], [ %add.i.37.i.lcssa, %while.end.i.loopexit ]
  %shl5.i = shl i32 %rem0.0.lcssa.i, 16
  %shr6.i = lshr i32 %rem1.0.lcssa.i, 16
  %or.i.141 = or i32 %shr6.i, %shl5.i
  %cmp8.i = icmp ugt i32 %shl.i.139, %or.i.141
  br i1 %cmp8.i, label %cond.false.10.i, label %estimateDiv64To32.exit

cond.false.10.i:                                  ; preds = %while.end.i
  %div11.i = udiv i32 %or.i.141, %shr.i.138
  br label %estimateDiv64To32.exit

estimateDiv64To32.exit:                           ; preds = %while.end.i, %cond.false.10.i
  %cond13.i = phi i32 [ %div11.i, %cond.false.10.i ], [ 65535, %while.end.i ]
  %or14.i = or i32 %cond13.i, %z.0.lcssa.i
  %and39 = and i32 %or14.i, 510
  %cmp40 = icmp ult i32 %and39, 6
  br i1 %cmp40, label %if.then.41, label %if.end.56

if.then.41:                                       ; preds = %estimateDiv64To32.exit
  %cmp42 = icmp eq i32 %or14.i, 0
  %.or14.i = select i1 %cmp42, i32 1, i32 %or14.i
  %shr3.i.118 = lshr i32 %.or14.i, 16
  %conv6.i.120 = and i32 %.or14.i, 65535
  %mul.i.121 = mul nuw i32 %conv6.i.120, %conv5.i.i
  %mul9.i.122 = mul nuw i32 %shr3.i.118, %conv5.i.i
  %mul12.i.123 = mul nuw i32 %conv6.i.120, %shr.i.138
  %mul15.i.124 = mul nuw i32 %shr3.i.118, %shr.i.138
  %add.i.125 = add i32 %mul9.i.122, %mul12.i.123
  %cmp.i.126 = icmp ult i32 %add.i.125, %mul12.i.123
  %conv16.i.127 = zext i1 %cmp.i.126 to i32
  %shl.i.128 = shl nuw nsw i32 %conv16.i.127, 16
  %shr17.i.129 = lshr i32 %add.i.125, 16
  %add18.i.130 = or i32 %shl.i.128, %shr17.i.129
  %shl20.i.132 = shl i32 %add.i.125, 16
  %add21.i.133 = add i32 %shl20.i.132, %mul.i.121
  %cmp22.i.134 = icmp ult i32 %add21.i.133, %shl20.i.132
  %sub.i.114 = sub i32 0, %add21.i.133
  %conv23.i.135.neg = sext i1 %cmp22.i.134 to i32
  %cmp.i.116 = icmp ne i32 %add21.i.133, 0
  %conv.neg.i = sext i1 %cmp.i.116 to i32
  %mul.i = mul nuw i32 %conv6.i.120, %conv6.i.120
  %mul9.i = mul nuw i32 %shr3.i.118, %conv6.i.120
  %mul15.i = mul nuw i32 %shr3.i.118, %shr3.i.118
  %add.i.111 = shl i32 %mul9.i, 1
  %cmp.i.112 = icmp ult i32 %add.i.111, %mul9.i
  %conv16.i = zext i1 %cmp.i.112 to i32
  %shl.i.113 = shl nuw nsw i32 %conv16.i, 16
  %11 = lshr i32 %mul9.i, 15
  %shr17.i = and i32 %11, 65535
  %add18.i = or i32 %shl.i.113, %shr17.i
  %shl20.i = shl i32 %mul9.i, 17
  %add21.i = add i32 %shl20.i, %mul.i
  %cmp22.i = icmp ult i32 %add21.i, %shl20.i
  %conv23.i = zext i1 %cmp22.i to i32
  %add19.i = add i32 %conv23.i, %mul15.i
  %add24.i = add i32 %add19.i, %add18.i
  %sub.i = sub i32 0, %add21.i
  %cmp.i.107 = icmp ne i32 %add21.i, 0
  %conv.i.108 = zext i1 %cmp.i.107 to i32
  %sub1.i = sub i32 %sub.i.114, %add24.i
  %cmp2.i.109 = icmp ugt i32 %add24.i, %sub.i.114
  %cmp5.i = icmp ult i32 %sub1.i, %conv.i.108
  %conv6.neg.i = sext i1 %cmp5.i to i32
  %sub8.i = sub i32 %sub1.i, %conv.i.108
  %conv3.neg.i = sext i1 %cmp2.i.109 to i32
  %add19.i.131.neg = sub i32 %rem1.0.lcssa, %mul15.i.124
  %add24.i.136.neg = sub i32 %add19.i.131.neg, %add18.i.130
  %sub1.i.115 = add i32 %add24.i.136.neg, %conv23.i.135.neg
  %sub2.i = add i32 %sub1.i.115, %conv.neg.i
  %sub7.i = add i32 %sub2.i, %conv3.neg.i
  %sub9.i = add i32 %sub7.i, %conv6.neg.i
  %cmp46.327 = icmp slt i32 %sub9.i, 0
  br i1 %cmp46.327, label %while.body.47.preheader, label %while.end.51

while.body.47.preheader:                          ; preds = %if.then.41
  br label %while.body.47

while.body.47:                                    ; preds = %while.body.47.preheader, %while.body.47
  %rem3.0331 = phi i32 [ %add.i, %while.body.47 ], [ %sub.i, %while.body.47.preheader ]
  %rem2.0330 = phi i32 [ %add5.i, %while.body.47 ], [ %sub8.i, %while.body.47.preheader ]
  %rem1.1329 = phi i32 [ %add9.i, %while.body.47 ], [ %sub9.i, %while.body.47.preheader ]
  %zSig1.1328 = phi i32 [ %dec48, %while.body.47 ], [ %.or14.i, %while.body.47.preheader ]
  %dec48 = add i32 %zSig1.1328, -1
  %shl.i.105 = shl i32 %dec48, 1
  %shr.i.106 = lshr i32 %dec48, 31
  %or49 = or i32 %shl.i.105, 1
  %or50 = or i32 %shr.i.106, %doubleZSig0.0.lcssa
  %add.i = add i32 %or49, %rem3.0331
  %cmp.i = icmp ult i32 %add.i, %rem3.0331
  %conv.i = zext i1 %cmp.i to i32
  %add1.i = add i32 %or50, %rem2.0330
  %cmp2.i = icmp ult i32 %add1.i, %rem2.0330
  %conv3.i = zext i1 %cmp2.i to i32
  %add5.i = add i32 %conv.i, %add1.i
  %cmp6.i = icmp ult i32 %add5.i, %conv.i
  %conv7.i = zext i1 %cmp6.i to i32
  %add8.i = add i32 %conv3.i, %rem1.1329
  %add9.i = add i32 %add8.i, %conv7.i
  %cmp46 = icmp slt i32 %add9.i, 0
  br i1 %cmp46, label %while.body.47, label %while.end.51.loopexit

while.end.51.loopexit:                            ; preds = %while.body.47
  %add9.i.lcssa = phi i32 [ %add9.i, %while.body.47 ]
  %add5.i.lcssa = phi i32 [ %add5.i, %while.body.47 ]
  %add.i.lcssa = phi i32 [ %add.i, %while.body.47 ]
  %dec48.lcssa = phi i32 [ %dec48, %while.body.47 ]
  br label %while.end.51

while.end.51:                                     ; preds = %while.end.51.loopexit, %if.then.41
  %rem3.0.lcssa = phi i32 [ %sub.i, %if.then.41 ], [ %add.i.lcssa, %while.end.51.loopexit ]
  %rem2.0.lcssa = phi i32 [ %sub8.i, %if.then.41 ], [ %add5.i.lcssa, %while.end.51.loopexit ]
  %rem1.1.lcssa = phi i32 [ %sub9.i, %if.then.41 ], [ %add9.i.lcssa, %while.end.51.loopexit ]
  %zSig1.1.lcssa = phi i32 [ %.or14.i, %if.then.41 ], [ %dec48.lcssa, %while.end.51.loopexit ]
  %or52 = or i32 %rem2.0.lcssa, %rem1.1.lcssa
  %or53 = or i32 %or52, %rem3.0.lcssa
  %cmp54 = icmp ne i32 %or53, 0
  %conv = zext i1 %cmp54 to i32
  %or55 = or i32 %conv, %zSig1.1.lcssa
  br label %if.end.56

if.end.56:                                        ; preds = %while.end, %while.end.51, %estimateDiv64To32.exit
  %zSig1.2 = phi i32 [ %or55, %while.end.51 ], [ %or14.i, %estimateDiv64To32.exit ], [ -1, %while.end ]
  %shl.i = shl i32 %zSig1.2, 22
  %shl3.i = shl i32 %zSig0.0.lcssa, 22
  %shr.i = lshr i32 %zSig1.2, 10
  %or.i = or i32 %shr.i, %shl3.i
  %shr4.i = lshr i32 %zSig0.0.lcssa, 10
  %call57 = tail call fastcc i64 @roundAndPackFloat64(i32 0, i32 %add, i32 %shr4.i, i32 %or.i, i32 %shl.i) #5
  %retval.sroa.7.0.extract.shift99 = and i64 %call57, -4294967296
  br label %cleanup

cleanup:                                          ; preds = %if.then.19, %if.end.56, %invalid, %if.then.15, %if.then.7, %propagateFloat64NaN.exit
  %retval.sroa.0.0 = phi i64 [ %retval.sroa.0.0.insert.insert.i, %propagateFloat64NaN.exit ], [ 4294967295, %invalid ], [ %a.coerce, %if.then.7 ], [ %a.coerce, %if.then.15 ], [ %call57, %if.end.56 ], [ 0, %if.then.19 ]
  %retval.sroa.7.0 = phi i64 [ %retval.sroa.5.0.insert.shift.i, %propagateFloat64NaN.exit ], [ 9223372032559808512, %invalid ], [ %retval.sroa.7.0.extract.shift101, %if.then.7 ], [ %retval.sroa.7.0.extract.shift103, %if.then.15 ], [ %retval.sroa.7.0.extract.shift99, %if.end.56 ], [ 0, %if.then.19 ]
  %retval.sroa.0.0.insert.ext = and i64 %retval.sroa.0.0, 4294967295
  %retval.sroa.0.0.insert.insert = or i64 %retval.sroa.7.0, %retval.sroa.0.0.insert.ext
  ret i64 %retval.sroa.0.0.insert.insert
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i32 @float64_eq(i64 %a.coerce, i64 %b.coerce) #2 {
entry:
  %a.sroa.0.0.extract.trunc = trunc i64 %a.coerce to i32
  %a.sroa.7.0.extract.shift = lshr i64 %a.coerce, 32
  %a.sroa.7.0.extract.trunc = trunc i64 %a.sroa.7.0.extract.shift to i32
  %b.sroa.0.0.extract.trunc = trunc i64 %b.coerce to i32
  %b.sroa.6.0.extract.shift = lshr i64 %b.coerce, 32
  %b.sroa.6.0.extract.trunc = trunc i64 %b.sroa.6.0.extract.shift to i32
  %and.i = and i64 %a.coerce, 9218868437227405312
  %cmp = icmp eq i64 %and.i, 9218868437227405312
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %and.i.109 = and i32 %a.sroa.7.0.extract.trunc, 1048575
  %or = or i32 %and.i.109, %a.sroa.0.0.extract.trunc
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %and.i.105 = and i64 %b.coerce, 9218868437227405312
  %cmp4 = icmp eq i64 %and.i.105, 9218868437227405312
  br i1 %cmp4, label %land.lhs.true.5, label %if.end.16

land.lhs.true.5:                                  ; preds = %lor.lhs.false
  %and.i.102 = and i32 %b.sroa.6.0.extract.trunc, 1048575
  %or8 = or i32 %and.i.102, %b.sroa.0.0.extract.trunc
  %tobool9 = icmp eq i32 %or8, 0
  br i1 %tobool9, label %if.end.16, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.5
  %and.i.90 = and i64 %a.coerce, 9221120237041090560
  %cmp.i.91 = icmp eq i64 %and.i.90, 9218868437227405312
  br i1 %cmp.i.91, label %land.rhs.i.94, label %lor.lhs.false.12

land.rhs.i.94:                                    ; preds = %if.then
  %tobool.i.93 = icmp ne i32 %a.sroa.0.0.extract.trunc, 0
  %and2.i.95 = and i64 %a.coerce, 2251795518717952
  %tobool3.i.96 = icmp ne i64 %and2.i.95, 0
  %or.cond = or i1 %tobool.i.93, %tobool3.i.96
  br i1 %or.cond, label %if.then.15, label %lor.lhs.false.12

lor.lhs.false.12:                                 ; preds = %if.then, %land.rhs.i.94
  %and.i.89 = and i64 %b.coerce, 9221120237041090560
  %cmp.i = icmp eq i64 %and.i.89, 9218868437227405312
  br i1 %cmp.i, label %land.rhs.i, label %return

land.rhs.i:                                       ; preds = %lor.lhs.false.12
  %tobool.i = icmp ne i32 %b.sroa.0.0.extract.trunc, 0
  %and2.i = and i64 %b.coerce, 2251795518717952
  %tobool3.i = icmp ne i64 %and2.i, 0
  %or.cond111 = or i1 %tobool.i, %tobool3.i
  br i1 %or.cond111, label %if.then.15, label %return

if.then.15:                                       ; preds = %land.rhs.i, %land.rhs.i.94
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %0, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %return

if.end.16:                                        ; preds = %land.lhs.true.5, %lor.lhs.false
  %cmp18 = icmp eq i32 %a.sroa.0.0.extract.trunc, %b.sroa.0.0.extract.trunc
  br i1 %cmp18, label %land.rhs, label %land.end.28

land.rhs:                                         ; preds = %if.end.16
  %cmp20 = icmp eq i32 %a.sroa.7.0.extract.trunc, %b.sroa.6.0.extract.trunc
  br i1 %cmp20, label %land.end.28, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %cmp22 = icmp eq i32 %a.sroa.0.0.extract.trunc, 0
  br i1 %cmp22, label %land.rhs.23, label %land.end.28

land.rhs.23:                                      ; preds = %lor.rhs
  %or2688 = or i64 %b.sroa.6.0.extract.shift, %a.sroa.7.0.extract.shift
  %shl.mask = and i64 %or2688, 2147483647
  %cmp27 = icmp eq i64 %shl.mask, 0
  br label %land.end.28

land.end.28:                                      ; preds = %land.rhs, %land.rhs.23, %lor.rhs, %if.end.16
  %1 = phi i1 [ false, %if.end.16 ], [ true, %land.rhs ], [ false, %lor.rhs ], [ %cmp27, %land.rhs.23 ]
  %land.ext = zext i1 %1 to i32
  br label %return

return:                                           ; preds = %land.rhs.i, %lor.lhs.false.12, %if.then.15, %land.end.28
  %retval.0 = phi i32 [ %land.ext, %land.end.28 ], [ 0, %if.then.15 ], [ 0, %lor.lhs.false.12 ], [ 0, %land.rhs.i ]
  ret i32 %retval.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i32 @float64_le(i64 %a.coerce, i64 %b.coerce) #2 {
entry:
  %a.sroa.0.0.extract.trunc = trunc i64 %a.coerce to i32
  %a.sroa.8.0.extract.shift = lshr i64 %a.coerce, 32
  %a.sroa.8.0.extract.trunc = trunc i64 %a.sroa.8.0.extract.shift to i32
  %b.sroa.0.0.extract.trunc = trunc i64 %b.coerce to i32
  %b.sroa.8.0.extract.shift = lshr i64 %b.coerce, 32
  %b.sroa.8.0.extract.trunc = trunc i64 %b.sroa.8.0.extract.shift to i32
  %and.i = and i64 %a.coerce, 9218868437227405312
  %cmp = icmp eq i64 %and.i, 9218868437227405312
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %and.i.121 = and i32 %a.sroa.8.0.extract.trunc, 1048575
  %or = or i32 %and.i.121, %a.sroa.0.0.extract.trunc
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %and.i.117 = and i64 %b.coerce, 9218868437227405312
  %cmp4 = icmp eq i64 %and.i.117, 9218868437227405312
  br i1 %cmp4, label %land.lhs.true.5, label %if.end

land.lhs.true.5:                                  ; preds = %lor.lhs.false
  %and.i.114 = and i32 %b.sroa.8.0.extract.trunc, 1048575
  %or8 = or i32 %and.i.114, %b.sroa.0.0.extract.trunc
  %tobool9 = icmp eq i32 %or8, 0
  br i1 %tobool9, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.5
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %0, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end:                                           ; preds = %land.lhs.true.5, %lor.lhs.false
  %a.sroa.1.0.extract.shift.i.111 = lshr i64 %a.coerce, 63
  %shr.i.112 = trunc i64 %a.sroa.1.0.extract.shift.i.111 to i32
  %a.sroa.1.0.extract.shift.i.109 = lshr i64 %b.coerce, 63
  %shr.i.110 = trunc i64 %a.sroa.1.0.extract.shift.i.109 to i32
  %cmp12 = icmp eq i32 %shr.i.112, %shr.i.110
  %tobool14 = icmp ne i32 %shr.i.112, 0
  br i1 %cmp12, label %if.end.21, label %if.then.13

if.then.13:                                       ; preds = %if.end
  br i1 %tobool14, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.then.13
  %or16101 = or i64 %b.sroa.8.0.extract.shift, %a.sroa.8.0.extract.shift
  %or16 = trunc i64 %or16101 to i32
  %shl = shl i32 %or16, 1
  %or17122 = or i64 %b.coerce, %a.coerce
  %or17 = trunc i64 %or17122 to i32
  %or19 = or i32 %or17, %shl
  %cmp20 = icmp eq i32 %or19, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.then.13
  %1 = phi i1 [ true, %if.then.13 ], [ %cmp20, %lor.rhs ]
  %lor.ext = zext i1 %1 to i32
  br label %cleanup

if.end.21:                                        ; preds = %if.end
  br i1 %tobool14, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end.21
  %cmp.i.102 = icmp ult i32 %b.sroa.8.0.extract.trunc, %a.sroa.8.0.extract.trunc
  br i1 %cmp.i.102, label %le64.exit108, label %lor.rhs.i.106

lor.rhs.i.106:                                    ; preds = %cond.true
  %cmp1.i.103 = icmp eq i32 %b.sroa.8.0.extract.trunc, %a.sroa.8.0.extract.trunc
  %cmp2.i.104 = icmp ule i32 %b.sroa.0.0.extract.trunc, %a.sroa.0.0.extract.trunc
  %cmp2..i.105 = and i1 %cmp2.i.104, %cmp1.i.103
  br label %le64.exit108

le64.exit108:                                     ; preds = %cond.true, %lor.rhs.i.106
  %2 = phi i1 [ true, %cond.true ], [ %cmp2..i.105, %lor.rhs.i.106 ]
  %lor.ext.i.107 = zext i1 %2 to i32
  br label %cleanup

cond.false:                                       ; preds = %if.end.21
  %cmp.i = icmp ult i32 %a.sroa.8.0.extract.trunc, %b.sroa.8.0.extract.trunc
  br i1 %cmp.i, label %le64.exit, label %lor.rhs.i

lor.rhs.i:                                        ; preds = %cond.false
  %cmp1.i = icmp eq i32 %a.sroa.8.0.extract.trunc, %b.sroa.8.0.extract.trunc
  %cmp2.i = icmp ule i32 %a.sroa.0.0.extract.trunc, %b.sroa.0.0.extract.trunc
  %cmp2..i = and i1 %cmp2.i, %cmp1.i
  br label %le64.exit

le64.exit:                                        ; preds = %cond.false, %lor.rhs.i
  %3 = phi i1 [ true, %cond.false ], [ %cmp2..i, %lor.rhs.i ]
  %lor.ext.i = zext i1 %3 to i32
  br label %cleanup

cleanup:                                          ; preds = %le64.exit108, %le64.exit, %lor.end, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ %lor.ext, %lor.end ], [ %lor.ext.i.107, %le64.exit108 ], [ %lor.ext.i, %le64.exit ]
  ret i32 %retval.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i32 @float64_lt(i64 %a.coerce, i64 %b.coerce) #2 {
entry:
  %a.sroa.0.0.extract.trunc = trunc i64 %a.coerce to i32
  %a.sroa.8.0.extract.shift = lshr i64 %a.coerce, 32
  %a.sroa.8.0.extract.trunc = trunc i64 %a.sroa.8.0.extract.shift to i32
  %b.sroa.0.0.extract.trunc = trunc i64 %b.coerce to i32
  %b.sroa.8.0.extract.shift = lshr i64 %b.coerce, 32
  %b.sroa.8.0.extract.trunc = trunc i64 %b.sroa.8.0.extract.shift to i32
  %and.i = and i64 %a.coerce, 9218868437227405312
  %cmp = icmp eq i64 %and.i, 9218868437227405312
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %and.i.121 = and i32 %a.sroa.8.0.extract.trunc, 1048575
  %or = or i32 %and.i.121, %a.sroa.0.0.extract.trunc
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %and.i.117 = and i64 %b.coerce, 9218868437227405312
  %cmp4 = icmp eq i64 %and.i.117, 9218868437227405312
  br i1 %cmp4, label %land.lhs.true.5, label %if.end

land.lhs.true.5:                                  ; preds = %lor.lhs.false
  %and.i.114 = and i32 %b.sroa.8.0.extract.trunc, 1048575
  %or8 = or i32 %and.i.114, %b.sroa.0.0.extract.trunc
  %tobool9 = icmp eq i32 %or8, 0
  br i1 %tobool9, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.5
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %0, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end:                                           ; preds = %land.lhs.true.5, %lor.lhs.false
  %a.sroa.1.0.extract.shift.i.111 = lshr i64 %a.coerce, 63
  %shr.i.112 = trunc i64 %a.sroa.1.0.extract.shift.i.111 to i32
  %a.sroa.1.0.extract.shift.i.109 = lshr i64 %b.coerce, 63
  %shr.i.110 = trunc i64 %a.sroa.1.0.extract.shift.i.109 to i32
  %cmp12 = icmp eq i32 %shr.i.112, %shr.i.110
  %tobool14 = icmp ne i32 %shr.i.112, 0
  br i1 %cmp12, label %if.end.21, label %if.then.13

if.then.13:                                       ; preds = %if.end
  br i1 %tobool14, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.then.13
  %or16101 = or i64 %b.sroa.8.0.extract.shift, %a.sroa.8.0.extract.shift
  %or16 = trunc i64 %or16101 to i32
  %shl = shl i32 %or16, 1
  %or17122 = or i64 %b.coerce, %a.coerce
  %or17 = trunc i64 %or17122 to i32
  %or19 = or i32 %or17, %shl
  %cmp20 = icmp ne i32 %or19, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then.13
  %1 = phi i1 [ false, %if.then.13 ], [ %cmp20, %land.rhs ]
  %land.ext = zext i1 %1 to i32
  br label %cleanup

if.end.21:                                        ; preds = %if.end
  br i1 %tobool14, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end.21
  %cmp.i.102 = icmp ult i32 %b.sroa.8.0.extract.trunc, %a.sroa.8.0.extract.trunc
  br i1 %cmp.i.102, label %lt64.exit108, label %lor.rhs.i.106

lor.rhs.i.106:                                    ; preds = %cond.true
  %cmp1.i.103 = icmp eq i32 %b.sroa.8.0.extract.trunc, %a.sroa.8.0.extract.trunc
  %cmp2.i.104 = icmp ult i32 %b.sroa.0.0.extract.trunc, %a.sroa.0.0.extract.trunc
  %cmp2..i.105 = and i1 %cmp2.i.104, %cmp1.i.103
  br label %lt64.exit108

lt64.exit108:                                     ; preds = %cond.true, %lor.rhs.i.106
  %2 = phi i1 [ true, %cond.true ], [ %cmp2..i.105, %lor.rhs.i.106 ]
  %lor.ext.i.107 = zext i1 %2 to i32
  br label %cleanup

cond.false:                                       ; preds = %if.end.21
  %cmp.i = icmp ult i32 %a.sroa.8.0.extract.trunc, %b.sroa.8.0.extract.trunc
  br i1 %cmp.i, label %lt64.exit, label %lor.rhs.i

lor.rhs.i:                                        ; preds = %cond.false
  %cmp1.i = icmp eq i32 %a.sroa.8.0.extract.trunc, %b.sroa.8.0.extract.trunc
  %cmp2.i = icmp ult i32 %a.sroa.0.0.extract.trunc, %b.sroa.0.0.extract.trunc
  %cmp2..i = and i1 %cmp2.i, %cmp1.i
  br label %lt64.exit

lt64.exit:                                        ; preds = %cond.false, %lor.rhs.i
  %3 = phi i1 [ true, %cond.false ], [ %cmp2..i, %lor.rhs.i ]
  %lor.ext.i = zext i1 %3 to i32
  br label %cleanup

cleanup:                                          ; preds = %lt64.exit108, %lt64.exit, %land.end, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ %land.ext, %land.end ], [ %lor.ext.i.107, %lt64.exit108 ], [ %lor.ext.i, %lt64.exit ]
  ret i32 %retval.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i32 @float64_eq_signaling(i64 %a.coerce, i64 %b.coerce) #2 {
entry:
  %a.sroa.0.0.extract.trunc = trunc i64 %a.coerce to i32
  %a.sroa.6.0.extract.shift = lshr i64 %a.coerce, 32
  %a.sroa.6.0.extract.trunc = trunc i64 %a.sroa.6.0.extract.shift to i32
  %b.sroa.0.0.extract.trunc = trunc i64 %b.coerce to i32
  %b.sroa.5.0.extract.shift = lshr i64 %b.coerce, 32
  %b.sroa.5.0.extract.trunc = trunc i64 %b.sroa.5.0.extract.shift to i32
  %and.i = and i64 %a.coerce, 9218868437227405312
  %cmp = icmp eq i64 %and.i, 9218868437227405312
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %and.i.72 = and i32 %a.sroa.6.0.extract.trunc, 1048575
  %or = or i32 %and.i.72, %a.sroa.0.0.extract.trunc
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %and.i.68 = and i64 %b.coerce, 9218868437227405312
  %cmp4 = icmp eq i64 %and.i.68, 9218868437227405312
  br i1 %cmp4, label %land.lhs.true.5, label %if.end

land.lhs.true.5:                                  ; preds = %lor.lhs.false
  %and.i.65 = and i32 %b.sroa.5.0.extract.trunc, 1048575
  %or8 = or i32 %and.i.65, %b.sroa.0.0.extract.trunc
  %tobool9 = icmp eq i32 %or8, 0
  br i1 %tobool9, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.5
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %0, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %return

if.end:                                           ; preds = %land.lhs.true.5, %lor.lhs.false
  %cmp11 = icmp eq i32 %a.sroa.0.0.extract.trunc, %b.sroa.0.0.extract.trunc
  br i1 %cmp11, label %land.rhs, label %land.end.21

land.rhs:                                         ; preds = %if.end
  %cmp13 = icmp eq i32 %a.sroa.6.0.extract.trunc, %b.sroa.5.0.extract.trunc
  br i1 %cmp13, label %land.end.21, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %cmp15 = icmp eq i32 %a.sroa.0.0.extract.trunc, 0
  br i1 %cmp15, label %land.rhs.16, label %land.end.21

land.rhs.16:                                      ; preds = %lor.rhs
  %or1963 = or i64 %b.sroa.5.0.extract.shift, %a.sroa.6.0.extract.shift
  %shl.mask = and i64 %or1963, 2147483647
  %cmp20 = icmp eq i64 %shl.mask, 0
  br label %land.end.21

land.end.21:                                      ; preds = %land.rhs, %land.rhs.16, %lor.rhs, %if.end
  %1 = phi i1 [ false, %if.end ], [ true, %land.rhs ], [ false, %lor.rhs ], [ %cmp20, %land.rhs.16 ]
  %land.ext = zext i1 %1 to i32
  br label %return

return:                                           ; preds = %land.end.21, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ %land.ext, %land.end.21 ]
  ret i32 %retval.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i32 @float64_le_quiet(i64 %a.coerce, i64 %b.coerce) #2 {
entry:
  %a.sroa.0.0.extract.trunc = trunc i64 %a.coerce to i32
  %a.sroa.9.0.extract.shift = lshr i64 %a.coerce, 32
  %a.sroa.9.0.extract.trunc = trunc i64 %a.sroa.9.0.extract.shift to i32
  %b.sroa.0.0.extract.trunc = trunc i64 %b.coerce to i32
  %b.sroa.9.0.extract.shift = lshr i64 %b.coerce, 32
  %b.sroa.9.0.extract.trunc = trunc i64 %b.sroa.9.0.extract.shift to i32
  %and.i = and i64 %a.coerce, 9218868437227405312
  %cmp = icmp eq i64 %and.i, 9218868437227405312
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %and.i.160 = and i32 %a.sroa.9.0.extract.trunc, 1048575
  %or = or i32 %and.i.160, %a.sroa.0.0.extract.trunc
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %and.i.156 = and i64 %b.coerce, 9218868437227405312
  %cmp4 = icmp eq i64 %and.i.156, 9218868437227405312
  br i1 %cmp4, label %land.lhs.true.5, label %if.end.16

land.lhs.true.5:                                  ; preds = %lor.lhs.false
  %and.i.153 = and i32 %b.sroa.9.0.extract.trunc, 1048575
  %or8 = or i32 %and.i.153, %b.sroa.0.0.extract.trunc
  %tobool9 = icmp eq i32 %or8, 0
  br i1 %tobool9, label %if.end.16, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.5
  %and.i.141 = and i64 %a.coerce, 9221120237041090560
  %cmp.i.142 = icmp eq i64 %and.i.141, 9218868437227405312
  br i1 %cmp.i.142, label %land.rhs.i.145, label %lor.lhs.false.12

land.rhs.i.145:                                   ; preds = %if.then
  %tobool.i.144 = icmp ne i32 %a.sroa.0.0.extract.trunc, 0
  %and2.i.146 = and i64 %a.coerce, 2251795518717952
  %tobool3.i.147 = icmp ne i64 %and2.i.146, 0
  %or.cond = or i1 %tobool.i.144, %tobool3.i.147
  br i1 %or.cond, label %if.then.15, label %lor.lhs.false.12

lor.lhs.false.12:                                 ; preds = %if.then, %land.rhs.i.145
  %and.i.138 = and i64 %b.coerce, 9221120237041090560
  %cmp.i.139 = icmp eq i64 %and.i.138, 9218868437227405312
  br i1 %cmp.i.139, label %land.rhs.i, label %cleanup

land.rhs.i:                                       ; preds = %lor.lhs.false.12
  %tobool.i = icmp ne i32 %b.sroa.0.0.extract.trunc, 0
  %and2.i = and i64 %b.coerce, 2251795518717952
  %tobool3.i = icmp ne i64 %and2.i, 0
  %or.cond162 = or i1 %tobool.i, %tobool3.i
  br i1 %or.cond162, label %if.then.15, label %cleanup

if.then.15:                                       ; preds = %land.rhs.i, %land.rhs.i.145
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %0, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.16:                                        ; preds = %land.lhs.true.5, %lor.lhs.false
  %a.sroa.1.0.extract.shift.i.136 = lshr i64 %a.coerce, 63
  %shr.i.137 = trunc i64 %a.sroa.1.0.extract.shift.i.136 to i32
  %a.sroa.1.0.extract.shift.i.134 = lshr i64 %b.coerce, 63
  %shr.i.135 = trunc i64 %a.sroa.1.0.extract.shift.i.134 to i32
  %cmp19 = icmp eq i32 %shr.i.137, %shr.i.135
  %tobool21 = icmp ne i32 %shr.i.137, 0
  br i1 %cmp19, label %if.end.28, label %if.then.20

if.then.20:                                       ; preds = %if.end.16
  br i1 %tobool21, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.then.20
  %or23126 = or i64 %b.sroa.9.0.extract.shift, %a.sroa.9.0.extract.shift
  %or23 = trunc i64 %or23126 to i32
  %shl = shl i32 %or23, 1
  %or24163 = or i64 %b.coerce, %a.coerce
  %or24 = trunc i64 %or24163 to i32
  %or26 = or i32 %or24, %shl
  %cmp27 = icmp eq i32 %or26, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.then.20
  %1 = phi i1 [ true, %if.then.20 ], [ %cmp27, %lor.rhs ]
  %lor.ext = zext i1 %1 to i32
  br label %cleanup

if.end.28:                                        ; preds = %if.end.16
  br i1 %tobool21, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end.28
  %cmp.i.127 = icmp ult i32 %b.sroa.9.0.extract.trunc, %a.sroa.9.0.extract.trunc
  br i1 %cmp.i.127, label %le64.exit133, label %lor.rhs.i.131

lor.rhs.i.131:                                    ; preds = %cond.true
  %cmp1.i.128 = icmp eq i32 %b.sroa.9.0.extract.trunc, %a.sroa.9.0.extract.trunc
  %cmp2.i.129 = icmp ule i32 %b.sroa.0.0.extract.trunc, %a.sroa.0.0.extract.trunc
  %cmp2..i.130 = and i1 %cmp2.i.129, %cmp1.i.128
  br label %le64.exit133

le64.exit133:                                     ; preds = %cond.true, %lor.rhs.i.131
  %2 = phi i1 [ true, %cond.true ], [ %cmp2..i.130, %lor.rhs.i.131 ]
  %lor.ext.i.132 = zext i1 %2 to i32
  br label %cleanup

cond.false:                                       ; preds = %if.end.28
  %cmp.i = icmp ult i32 %a.sroa.9.0.extract.trunc, %b.sroa.9.0.extract.trunc
  br i1 %cmp.i, label %le64.exit, label %lor.rhs.i

lor.rhs.i:                                        ; preds = %cond.false
  %cmp1.i = icmp eq i32 %a.sroa.9.0.extract.trunc, %b.sroa.9.0.extract.trunc
  %cmp2.i = icmp ule i32 %a.sroa.0.0.extract.trunc, %b.sroa.0.0.extract.trunc
  %cmp2..i = and i1 %cmp2.i, %cmp1.i
  br label %le64.exit

le64.exit:                                        ; preds = %cond.false, %lor.rhs.i
  %3 = phi i1 [ true, %cond.false ], [ %cmp2..i, %lor.rhs.i ]
  %lor.ext.i = zext i1 %3 to i32
  br label %cleanup

cleanup:                                          ; preds = %land.rhs.i, %lor.lhs.false.12, %le64.exit133, %le64.exit, %if.then.15, %lor.end
  %retval.0 = phi i32 [ %lor.ext, %lor.end ], [ 0, %if.then.15 ], [ %lor.ext.i.132, %le64.exit133 ], [ %lor.ext.i, %le64.exit ], [ 0, %lor.lhs.false.12 ], [ 0, %land.rhs.i ]
  ret i32 %retval.0
}

; Function Attrs: noimplicitfloat nounwind uwtable
define i32 @float64_lt_quiet(i64 %a.coerce, i64 %b.coerce) #2 {
entry:
  %a.sroa.0.0.extract.trunc = trunc i64 %a.coerce to i32
  %a.sroa.9.0.extract.shift = lshr i64 %a.coerce, 32
  %a.sroa.9.0.extract.trunc = trunc i64 %a.sroa.9.0.extract.shift to i32
  %b.sroa.0.0.extract.trunc = trunc i64 %b.coerce to i32
  %b.sroa.9.0.extract.shift = lshr i64 %b.coerce, 32
  %b.sroa.9.0.extract.trunc = trunc i64 %b.sroa.9.0.extract.shift to i32
  %and.i = and i64 %a.coerce, 9218868437227405312
  %cmp = icmp eq i64 %and.i, 9218868437227405312
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %and.i.160 = and i32 %a.sroa.9.0.extract.trunc, 1048575
  %or = or i32 %and.i.160, %a.sroa.0.0.extract.trunc
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %and.i.156 = and i64 %b.coerce, 9218868437227405312
  %cmp4 = icmp eq i64 %and.i.156, 9218868437227405312
  br i1 %cmp4, label %land.lhs.true.5, label %if.end.16

land.lhs.true.5:                                  ; preds = %lor.lhs.false
  %and.i.153 = and i32 %b.sroa.9.0.extract.trunc, 1048575
  %or8 = or i32 %and.i.153, %b.sroa.0.0.extract.trunc
  %tobool9 = icmp eq i32 %or8, 0
  br i1 %tobool9, label %if.end.16, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.5
  %and.i.141 = and i64 %a.coerce, 9221120237041090560
  %cmp.i.142 = icmp eq i64 %and.i.141, 9218868437227405312
  br i1 %cmp.i.142, label %land.rhs.i.145, label %lor.lhs.false.12

land.rhs.i.145:                                   ; preds = %if.then
  %tobool.i.144 = icmp ne i32 %a.sroa.0.0.extract.trunc, 0
  %and2.i.146 = and i64 %a.coerce, 2251795518717952
  %tobool3.i.147 = icmp ne i64 %and2.i.146, 0
  %or.cond = or i1 %tobool.i.144, %tobool3.i.147
  br i1 %or.cond, label %if.then.15, label %lor.lhs.false.12

lor.lhs.false.12:                                 ; preds = %if.then, %land.rhs.i.145
  %and.i.138 = and i64 %b.coerce, 9221120237041090560
  %cmp.i.139 = icmp eq i64 %and.i.138, 9218868437227405312
  br i1 %cmp.i.139, label %land.rhs.i, label %cleanup

land.rhs.i:                                       ; preds = %lor.lhs.false.12
  %tobool.i = icmp ne i32 %b.sroa.0.0.extract.trunc, 0
  %and2.i = and i64 %b.coerce, 2251795518717952
  %tobool3.i = icmp ne i64 %and2.i, 0
  %or.cond162 = or i1 %tobool.i, %tobool3.i
  br i1 %or.cond162, label %if.then.15, label %cleanup

if.then.15:                                       ; preds = %land.rhs.i, %land.rhs.i.145
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %0, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.16:                                        ; preds = %land.lhs.true.5, %lor.lhs.false
  %a.sroa.1.0.extract.shift.i.136 = lshr i64 %a.coerce, 63
  %shr.i.137 = trunc i64 %a.sroa.1.0.extract.shift.i.136 to i32
  %a.sroa.1.0.extract.shift.i.134 = lshr i64 %b.coerce, 63
  %shr.i.135 = trunc i64 %a.sroa.1.0.extract.shift.i.134 to i32
  %cmp19 = icmp eq i32 %shr.i.137, %shr.i.135
  %tobool21 = icmp ne i32 %shr.i.137, 0
  br i1 %cmp19, label %if.end.28, label %if.then.20

if.then.20:                                       ; preds = %if.end.16
  br i1 %tobool21, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.then.20
  %or23126 = or i64 %b.sroa.9.0.extract.shift, %a.sroa.9.0.extract.shift
  %or23 = trunc i64 %or23126 to i32
  %shl = shl i32 %or23, 1
  %or24163 = or i64 %b.coerce, %a.coerce
  %or24 = trunc i64 %or24163 to i32
  %or26 = or i32 %or24, %shl
  %cmp27 = icmp ne i32 %or26, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then.20
  %1 = phi i1 [ false, %if.then.20 ], [ %cmp27, %land.rhs ]
  %land.ext = zext i1 %1 to i32
  br label %cleanup

if.end.28:                                        ; preds = %if.end.16
  br i1 %tobool21, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end.28
  %cmp.i.127 = icmp ult i32 %b.sroa.9.0.extract.trunc, %a.sroa.9.0.extract.trunc
  br i1 %cmp.i.127, label %lt64.exit133, label %lor.rhs.i.131

lor.rhs.i.131:                                    ; preds = %cond.true
  %cmp1.i.128 = icmp eq i32 %b.sroa.9.0.extract.trunc, %a.sroa.9.0.extract.trunc
  %cmp2.i.129 = icmp ult i32 %b.sroa.0.0.extract.trunc, %a.sroa.0.0.extract.trunc
  %cmp2..i.130 = and i1 %cmp2.i.129, %cmp1.i.128
  br label %lt64.exit133

lt64.exit133:                                     ; preds = %cond.true, %lor.rhs.i.131
  %2 = phi i1 [ true, %cond.true ], [ %cmp2..i.130, %lor.rhs.i.131 ]
  %lor.ext.i.132 = zext i1 %2 to i32
  br label %cleanup

cond.false:                                       ; preds = %if.end.28
  %cmp.i = icmp ult i32 %a.sroa.9.0.extract.trunc, %b.sroa.9.0.extract.trunc
  br i1 %cmp.i, label %lt64.exit, label %lor.rhs.i

lor.rhs.i:                                        ; preds = %cond.false
  %cmp1.i = icmp eq i32 %a.sroa.9.0.extract.trunc, %b.sroa.9.0.extract.trunc
  %cmp2.i = icmp ult i32 %a.sroa.0.0.extract.trunc, %b.sroa.0.0.extract.trunc
  %cmp2..i = and i1 %cmp2.i, %cmp1.i
  br label %lt64.exit

lt64.exit:                                        ; preds = %cond.false, %lor.rhs.i
  %3 = phi i1 [ true, %cond.false ], [ %cmp2..i, %lor.rhs.i ]
  %lor.ext.i = zext i1 %3 to i32
  br label %cleanup

cleanup:                                          ; preds = %land.rhs.i, %lor.lhs.false.12, %lt64.exit133, %lt64.exit, %if.then.15, %land.end
  %retval.0 = phi i32 [ %land.ext, %land.end ], [ 0, %if.then.15 ], [ %lor.ext.i.132, %lt64.exit133 ], [ %lor.ext.i, %lt64.exit ], [ 0, %lor.lhs.false.12 ], [ 0, %land.rhs.i ]
  ret i32 %retval.0
}

attributes #0 = { inlinehint noimplicitfloat nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint noimplicitfloat nounwind readnone uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noimplicitfloat nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noimplicitfloat nounwind readnone uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noimplicitfloat nounwind }
attributes #5 = { noimplicitfloat }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.1 (tags/RELEASE_371/final)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"short", !3, i64 0}
