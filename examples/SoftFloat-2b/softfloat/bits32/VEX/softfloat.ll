; ModuleID = '../softfloat.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@float_rounding_mode = global i32 0, align 4
@float_exception_flags = global i32 0, align 4
@float_detect_tininess = global i32 1, align 4
@countLeadingZeros32.countLeadingZerosHigh = internal unnamed_addr constant [256 x i32] [i32 8, i32 7, i32 6, i32 6, i32 5, i32 5, i32 5, i32 5, i32 4, i32 4, i32 4, i32 4, i32 4, i32 4, i32 4, i32 4, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], align 4
@estimateSqrt32.sqrtOddAdjustments = internal unnamed_addr constant [16 x i16] [i16 4, i16 34, i16 93, i16 177, i16 285, i16 415, i16 566, i16 736, i16 924, i16 1128, i16 1349, i16 1585, i16 1835, i16 2098, i16 2374, i16 2663], align 2
@estimateSqrt32.sqrtEvenAdjustments = internal unnamed_addr constant [16 x i16] [i16 2605, i16 2223, i16 1882, i16 1577, i16 1306, i16 1065, i16 854, i16 670, i16 512, i16 377, i16 265, i16 175, i16 104, i16 52, i16 18, i16 2], align 2

; Function Attrs: inlinehint nounwind
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

; Function Attrs: inlinehint nounwind
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

; Function Attrs: inlinehint nounwind
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

; Function Attrs: inlinehint nounwind
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

; Function Attrs: inlinehint nounwind
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

; Function Attrs: inlinehint nounwind
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

; Function Attrs: inlinehint nounwind
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

; Function Attrs: inlinehint nounwind
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

; Function Attrs: inlinehint nounwind
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

; Function Attrs: inlinehint nounwind
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

; Function Attrs: inlinehint nounwind
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

; Function Attrs: inlinehint nounwind
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

; Function Attrs: inlinehint nounwind
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

; Function Attrs: inlinehint nounwind readnone
define i32 @eq64(i32 %a0, i32 %a1, i32 %b0, i32 %b1) #1 {
entry:
  %cmp = icmp eq i32 %a0, %b0
  %cmp1 = icmp eq i32 %a1, %b1
  %cmp1. = and i1 %cmp, %cmp1
  %land.ext = zext i1 %cmp1. to i32
  ret i32 %land.ext
}

; Function Attrs: inlinehint nounwind readnone
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

; Function Attrs: inlinehint nounwind readnone
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

; Function Attrs: inlinehint nounwind readnone
define i32 @ne64(i32 %a0, i32 %a1, i32 %b0, i32 %b1) #1 {
entry:
  %cmp1 = icmp ne i32 %a1, %b1
  %not.cmp = icmp ne i32 %a0, %b0
  %cmp1. = or i1 %not.cmp, %cmp1
  %lor.ext = zext i1 %cmp1. to i32
  ret i32 %lor.ext
}

; Function Attrs: inlinehint nounwind readnone
define i32 @ge64(i32 %a0, i32 %a1, i32 %b0, i32 %b1) #1 {
entry:
  %cmp = icmp ugt i32 %a0, %b0
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %cmp1 = icmp eq i32 %a0, %b0
  %cmp2 = icmp uge i32 %a1, %b1
  %cmp2. = and i1 %cmp1, %cmp2
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %0 = phi i1 [ true, %entry ], [ %cmp2., %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  ret i32 %lor.ext
}

; Function Attrs: inlinehint nounwind readnone
define i32 @gt64(i32 %a0, i32 %a1, i32 %b0, i32 %b1) #1 {
entry:
  %cmp = icmp ugt i32 %a0, %b0
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %cmp1 = icmp eq i32 %a0, %b0
  %cmp2 = icmp ugt i32 %a1, %b1
  %cmp2. = and i1 %cmp1, %cmp2
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %0 = phi i1 [ true, %entry ], [ %cmp2., %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  ret i32 %lor.ext
}

; Function Attrs: nounwind
define void @float_raise(i32 %flags) #2 {
entry:
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or = or i32 %0, %flags
  store i32 %or, i32* @float_exception_flags, align 4, !tbaa !1
  ret void
}

; Function Attrs: nounwind readnone
define i32 @float32_is_nan(i32 %a) #3 {
entry:
  %0 = trunc i32 %a to i31
  %cmp = icmp ugt i31 %0, -8388608
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

; Function Attrs: nounwind readnone
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

; Function Attrs: nounwind readnone
define i32 @float64_is_nan(i32 %a.0, i32 %a.1) #3 {
entry:
  %shl = shl i32 %a.1, 1
  %cmp = icmp ugt i32 %shl, -2097153
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %tobool = icmp eq i32 %a.0, 0
  br i1 %tobool, label %lor.rhs, label %land.end

lor.rhs:                                          ; preds = %land.rhs
  %and = and i32 %a.1, 1048575
  %tobool4 = icmp ne i32 %and, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.rhs, %entry
  %0 = phi i1 [ false, %entry ], [ true, %land.rhs ], [ %tobool4, %lor.rhs ]
  %land.ext = zext i1 %0 to i32
  ret i32 %land.ext
}

; Function Attrs: nounwind readnone
define i32 @float64_is_signaling_nan(i32 %a.0, i32 %a.1) #3 {
entry:
  %and = and i32 %a.1, 2146959360
  %cmp = icmp eq i32 %and, 2146435072
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %tobool = icmp eq i32 %a.0, 0
  br i1 %tobool, label %lor.rhs, label %land.end

lor.rhs:                                          ; preds = %land.rhs
  %and4 = and i32 %a.1, 524287
  %tobool5 = icmp ne i32 %and4, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.rhs, %entry
  %0 = phi i1 [ false, %entry ], [ true, %land.rhs ], [ %tobool5, %lor.rhs ]
  %land.ext = zext i1 %0 to i32
  ret i32 %land.ext
}

; Function Attrs: inlinehint nounwind readnone
define i32 @extractFloat32Frac(i32 %a) #1 {
entry:
  %and = and i32 %a, 8388607
  ret i32 %and
}

; Function Attrs: inlinehint nounwind readnone
define i32 @extractFloat32Exp(i32 %a) #1 {
entry:
  %shr = lshr i32 %a, 23
  %and = and i32 %shr, 255
  ret i32 %and
}

; Function Attrs: inlinehint nounwind readnone
define i32 @extractFloat32Sign(i32 %a) #1 {
entry:
  %shr = lshr i32 %a, 31
  ret i32 %shr
}

; Function Attrs: inlinehint nounwind readnone
define i32 @packFloat32(i32 %zSign, i32 %zExp, i32 %zSig) #1 {
entry:
  %shl = shl i32 %zSign, 31
  %shl1 = shl i32 %zExp, 23
  %add = add i32 %shl1, %shl
  %add2 = add i32 %add, %zSig
  ret i32 %add2
}

; Function Attrs: inlinehint nounwind readnone
define i32 @extractFloat64Frac1(i32 %a.0, i32 %a.1) #1 {
entry:
  ret i32 %a.0
}

; Function Attrs: inlinehint nounwind readnone
define i32 @extractFloat64Frac0(i32 %a.0, i32 %a.1) #1 {
entry:
  %and = and i32 %a.1, 1048575
  ret i32 %and
}

; Function Attrs: inlinehint nounwind readnone
define i32 @extractFloat64Exp(i32 %a.0, i32 %a.1) #1 {
entry:
  %shr = lshr i32 %a.1, 20
  %and = and i32 %shr, 2047
  ret i32 %and
}

; Function Attrs: inlinehint nounwind readnone
define i32 @extractFloat64Sign(i32 %a.0, i32 %a.1) #1 {
entry:
  %shr = lshr i32 %a.1, 31
  ret i32 %shr
}

; Function Attrs: inlinehint nounwind readnone
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

; Function Attrs: nounwind
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
  %arrayidx.i.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.i
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

; Function Attrs: nounwind readnone
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
  %arrayidx.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i
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

; Function Attrs: nounwind
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

; Function Attrs: nounwind
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

; Function Attrs: nounwind
define i64 @float32_to_float64(i32 %a) #2 {
entry:
  %and.i = and i32 %a, 8388607
  %shr.i.41 = lshr i32 %a, 23
  %and.i.42 = and i32 %shr.i.41, 255
  %shr.i.40 = lshr i32 %a, 31
  switch i32 %and.i.42, label %if.end.13 [
    i32 255, label %if.then
    i32 0, label %if.then.8
  ]

if.then:                                          ; preds = %entry
  %tobool = icmp eq i32 %and.i, 0
  br i1 %tobool, label %if.end, label %if.then.3

if.then.3:                                        ; preds = %if.then
  %and.i.i = and i32 %a, 2143289344
  %cmp.i.i.37 = icmp eq i32 %and.i.i, 2139095040
  %and1.i.i = and i32 %a, 4194303
  %tobool.i.i = icmp ne i32 %and1.i.i, 0
  %tobool.demorgan.i = and i1 %cmp.i.i.37, %tobool.i.i
  br i1 %tobool.demorgan.i, label %if.then.i, label %float32ToCommonNaN.exit

if.then.i:                                        ; preds = %if.then.3
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !5
  %or.i.i.38 = or i32 %0, 16
  store i32 %or.i.i.38, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !5
  br label %float32ToCommonNaN.exit

float32ToCommonNaN.exit:                          ; preds = %if.then.3, %if.then.i
  %shl.i.i.34 = shl i32 %a, 29
  %1 = lshr i32 %a, 3
  %shl.i.36 = shl nuw i32 %shr.i.40, 31
  %or.i = or i32 %1, %shl.i.36
  %or7.i = or i32 %or.i, 2146959360
  %z.sroa.4.0.insert.ext.i = zext i32 %or7.i to i64
  %z.sroa.4.0.insert.shift.i = shl nuw i64 %z.sroa.4.0.insert.ext.i, 32
  %z.sroa.0.0.insert.ext.i = zext i32 %shl.i.i.34 to i64
  %z.sroa.0.0.insert.insert.i = or i64 %z.sroa.4.0.insert.shift.i, %z.sroa.0.0.insert.ext.i
  br label %cleanup

if.end:                                           ; preds = %if.then
  %shl.i.30 = shl nuw i32 %shr.i.40, 31
  %add.i.31 = or i32 %shl.i.30, 2146435072
  %retval.sroa.2.0.insert.ext.i.32 = zext i32 %add.i.31 to i64
  %retval.sroa.2.0.insert.shift.i.33 = shl nuw i64 %retval.sroa.2.0.insert.ext.i.32, 32
  br label %cleanup

if.then.8:                                        ; preds = %entry
  %cmp9 = icmp eq i32 %and.i, 0
  br i1 %cmp9, label %if.then.10, label %if.end.12

if.then.10:                                       ; preds = %if.then.8
  %shl.i.27 = shl nuw i32 %shr.i.40, 31
  %retval.sroa.2.0.insert.ext.i.28 = zext i32 %shl.i.27 to i64
  %retval.sroa.2.0.insert.shift.i.29 = shl nuw i64 %retval.sroa.2.0.insert.ext.i.28, 32
  br label %cleanup

if.end.12:                                        ; preds = %if.then.8
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
  %arrayidx.i.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.i
  %2 = load i32, i32* %arrayidx.i.i, align 4, !tbaa !1
  %add6.i.i = add nsw i32 %2, %shiftCount.1.i.i
  %sub.i = add nsw i32 %add6.i.i, -8
  %shl.i.26 = shl i32 %and.i, %sub.i
  %dec = sub i32 8, %add6.i.i
  br label %if.end.13

if.end.13:                                        ; preds = %entry, %if.end.12
  %aSig.0 = phi i32 [ %and.i, %entry ], [ %shl.i.26, %if.end.12 ]
  %aExp.0 = phi i32 [ %and.i.42, %entry ], [ %dec, %if.end.12 ]
  %shl.i.25 = shl i32 %aSig.0, 29
  %shr3.i = lshr i32 %aSig.0, 3
  %shl.i = shl nuw i32 %shr.i.40, 31
  %add = shl i32 %aExp.0, 20
  %shl1.i = or i32 %shl.i, 939524096
  %add.i = add i32 %shl1.i, %shr3.i
  %add2.i = add i32 %add.i, %add
  %retval.sroa.2.0.insert.ext.i = zext i32 %add2.i to i64
  %retval.sroa.2.0.insert.shift.i = shl nuw i64 %retval.sroa.2.0.insert.ext.i, 32
  %retval.sroa.0.0.insert.ext.i = zext i32 %shl.i.25 to i64
  %retval.sroa.0.0.insert.insert.i = or i64 %retval.sroa.2.0.insert.shift.i, %retval.sroa.0.0.insert.ext.i
  br label %cleanup

cleanup:                                          ; preds = %if.end.13, %if.then.10, %if.end, %float32ToCommonNaN.exit
  %retval.sroa.0.0 = phi i64 [ %z.sroa.0.0.insert.insert.i, %float32ToCommonNaN.exit ], [ %retval.sroa.2.0.insert.shift.i.33, %if.end ], [ %retval.sroa.2.0.insert.shift.i.29, %if.then.10 ], [ %retval.sroa.0.0.insert.insert.i, %if.end.13 ]
  ret i64 %retval.sroa.0.0
}

; Function Attrs: nounwind
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

; Function Attrs: nounwind
define i32 @float32_add(i32 %a, i32 %b) #2 {
entry:
  %shr.i = lshr i32 %a, 31
  %shr.i.10 = lshr i32 %b, 31
  %cmp = icmp eq i32 %shr.i, %shr.i.10
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call2 = tail call fastcc i32 @addFloat32Sigs(i32 %a, i32 %b, i32 %shr.i)
  br label %cleanup

if.else:                                          ; preds = %entry
  %call3 = tail call fastcc i32 @subFloat32Sigs(i32 %a, i32 %b, i32 %shr.i)
  br label %cleanup

cleanup:                                          ; preds = %if.else, %if.then
  %retval.0 = phi i32 [ %call2, %if.then ], [ %call3, %if.else ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
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
  %call56 = tail call fastcc i32 @roundAndPackFloat32(i32 %zSign, i32 %zExp.1, i32 %zSig.0)
  br label %cleanup

cleanup:                                          ; preds = %cond.false.i, %if.end.i, %cond.false.i.120, %if.end.i.116, %cond.false.i.157, %if.end.i.153, %if.then.32, %if.then.6, %roundAndPack, %if.then.40, %if.end.21
  %retval.0 = phi i32 [ %call56, %roundAndPack ], [ %add.i, %if.end.21 ], [ %add2.i, %if.then.40 ], [ %a, %if.then.6 ], [ %a, %if.then.32 ], [ %cond.or.i.156, %cond.false.i.157 ], [ %or4.i.149, %if.end.i.153 ], [ %cond.or.i.119, %cond.false.i.120 ], [ %or4.i.112, %if.end.i.116 ], [ %cond.or.i, %cond.false.i ], [ %or4.i, %if.end.i ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
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
  %arrayidx.i.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.i
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

; Function Attrs: nounwind
define i32 @float32_sub(i32 %a, i32 %b) #2 {
entry:
  %shr.i = lshr i32 %a, 31
  %shr.i.10 = lshr i32 %b, 31
  %cmp = icmp eq i32 %shr.i, %shr.i.10
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call2 = tail call fastcc i32 @subFloat32Sigs(i32 %a, i32 %b, i32 %shr.i)
  br label %cleanup

if.else:                                          ; preds = %entry
  %call3 = tail call fastcc i32 @addFloat32Sigs(i32 %a, i32 %b, i32 %shr.i)
  br label %cleanup

cleanup:                                          ; preds = %if.else, %if.then
  %retval.0 = phi i32 [ %call2, %if.then ], [ %call3, %if.else ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float32_mul(i32 %a, i32 %b) #2 {
entry:
  %and.i = and i32 %a, 8388607
  %shr.i = lshr i32 %a, 23
  %and.i.79 = and i32 %shr.i, 255
  %and.i.132 = and i32 %b, 8388607
  %shr.i.130 = lshr i32 %b, 23
  %and.i.131 = and i32 %shr.i.130, 255
  %shr.i.133151 = xor i32 %b, %a
  %xor = lshr i32 %shr.i.133151, 31
  %cmp = icmp eq i32 %and.i.79, 255
  br i1 %cmp, label %if.then, label %if.end.14

if.then:                                          ; preds = %entry
  %tobool = icmp eq i32 %and.i, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then.8

lor.lhs.false:                                    ; preds = %if.then
  %cmp6 = icmp eq i32 %and.i.131, 255
  %tobool7 = icmp ne i32 %and.i.132, 0
  %or.cond = and i1 %tobool7, %cmp6
  br i1 %or.cond, label %if.then.8, label %if.end

if.then.8:                                        ; preds = %if.then, %lor.lhs.false
  %and.i.32.i.107 = and i32 %a, 2143289344
  %cmp.i.33.i.108 = icmp eq i32 %and.i.32.i.107, 2139095040
  %and1.i.34.i.109 = and i32 %a, 4194303
  %tobool.i.35.i.110 = icmp ne i32 %and1.i.34.i.109, 0
  %0 = and i1 %cmp.i.33.i.108, %tobool.i.35.i.110
  %1 = trunc i32 %b to i31
  %cmp.i.31.i.111 = icmp ugt i31 %1, -8388608
  %and.i.i.112 = and i32 %b, 2143289344
  %cmp.i.i.113 = icmp eq i32 %and.i.i.112, 2139095040
  %and1.i.i.114 = and i32 %b, 4194303
  %tobool.i.i.115 = icmp ne i32 %and1.i.i.114, 0
  %2 = and i1 %cmp.i.i.113, %tobool.i.i.115
  %or.i.116 = or i32 %a, 4194304
  %or4.i.117 = or i32 %b, 4194304
  %or537.i.118 = or i1 %0, %2
  br i1 %or537.i.118, label %if.then.i.120, label %if.end.i.121

if.then.i.120:                                    ; preds = %if.then.8
  %3 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.119 = or i32 %3, 16
  store i32 %or.i.i.119, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.i.121

if.end.i.121:                                     ; preds = %if.then.i.120, %if.then.8
  br i1 %2, label %cleanup, label %cond.false.i.125

cond.false.i.125:                                 ; preds = %if.end.i.121
  %tobool7.i.123.demorgan = and i1 %cmp.i.33.i.108, %tobool.i.35.i.110
  %tobool7.i.123 = xor i1 %tobool7.i.123.demorgan, true
  %4 = and i1 %cmp.i.31.i.111, %tobool7.i.123
  %cond.or.i.124 = select i1 %4, i32 %or4.i.117, i32 %or.i.116
  br label %cleanup

if.end:                                           ; preds = %lor.lhs.false
  %or = or i32 %and.i.131, %and.i.132
  %cmp10 = icmp eq i32 %or, 0
  br i1 %cmp10, label %if.then.11, label %if.end.12

if.then.11:                                       ; preds = %if.end
  %5 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.106 = or i32 %5, 16
  store i32 %or.i.106, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.12:                                        ; preds = %if.end
  %shl.i.104 = shl nuw i32 %xor, 31
  %add.i.105 = or i32 %shl.i.104, 2139095040
  br label %cleanup

if.end.14:                                        ; preds = %entry
  %cmp15 = icmp eq i32 %and.i.131, 255
  br i1 %cmp15, label %if.then.16, label %if.end.26

if.then.16:                                       ; preds = %if.end.14
  %tobool17 = icmp eq i32 %and.i.132, 0
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
  %cmp.i.i.101 = icmp eq i32 %and.i.i, 2139095040
  %and1.i.i = and i32 %b, 4194303
  %tobool.i.i = icmp ne i32 %and1.i.i, 0
  %8 = and i1 %cmp.i.i.101, %tobool.i.i
  %or.i.102 = or i32 %a, 4194304
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
  %cond.or.i = select i1 %10, i32 %or4.i, i32 %or.i.102
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
  %shl.i.99 = shl nuw i32 %xor, 31
  %add.i.100 = or i32 %shl.i.99, 2139095040
  br label %cleanup

if.end.26:                                        ; preds = %if.end.14
  %cmp27 = icmp eq i32 %and.i.79, 0
  br i1 %cmp27, label %if.then.28, label %if.end.33

if.then.28:                                       ; preds = %if.end.26
  %cmp29 = icmp eq i32 %and.i, 0
  br i1 %cmp29, label %if.then.30, label %if.end.32

if.then.30:                                       ; preds = %if.then.28
  %shl.i.98 = shl nuw i32 %xor, 31
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
  %arrayidx.i.i.93 = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.i.92
  %12 = load i32, i32* %arrayidx.i.i.93, align 4, !tbaa !1
  %add6.i.i.94 = add nsw i32 %12, %shiftCount.1.i.i.91
  %sub.i.95 = add nsw i32 %add6.i.i.94, -8
  %shl.i.96 = shl i32 %and.i, %sub.i.95
  %sub1.i.97 = sub i32 9, %add6.i.i.94
  br label %if.end.33

if.end.33:                                        ; preds = %if.end.32, %if.end.26
  %aSig.0 = phi i32 [ %shl.i.96, %if.end.32 ], [ %and.i, %if.end.26 ]
  %aExp.0 = phi i32 [ %sub1.i.97, %if.end.32 ], [ %and.i.79, %if.end.26 ]
  %cmp34 = icmp eq i32 %and.i.131, 0
  br i1 %cmp34, label %if.then.35, label %if.end.40

if.then.35:                                       ; preds = %if.end.33
  %cmp36 = icmp eq i32 %and.i.132, 0
  br i1 %cmp36, label %if.then.37, label %if.end.39

if.then.37:                                       ; preds = %if.then.35
  %shl.i.82 = shl nuw i32 %xor, 31
  br label %cleanup

if.end.39:                                        ; preds = %if.then.35
  %cmp.i.i = icmp ult i32 %and.i.132, 65536
  %shl.i.i = shl i32 %b, 16
  %shl.a.i.i = select i1 %cmp.i.i, i32 %shl.i.i, i32 %and.i.132
  %..i.i = select i1 %cmp.i.i, i32 16, i32 0
  %cmp1.i.i = icmp ult i32 %shl.a.i.i, 16777216
  %add3.i.i = or i32 %..i.i, 8
  %shl4.i.i = shl i32 %shl.a.i.i, 8
  %a.addr.1.i.i = select i1 %cmp1.i.i, i32 %shl4.i.i, i32 %shl.a.i.i
  %shiftCount.1.i.i = select i1 %cmp1.i.i, i32 %add3.i.i, i32 %..i.i
  %shr.i.i = lshr i32 %a.addr.1.i.i, 24
  %arrayidx.i.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.i
  %13 = load i32, i32* %arrayidx.i.i, align 4, !tbaa !1
  %add6.i.i = add nsw i32 %13, %shiftCount.1.i.i
  %sub.i = add nsw i32 %add6.i.i, -8
  %shl.i.81 = shl i32 %and.i.132, %sub.i
  %sub1.i = sub i32 9, %add6.i.i
  br label %if.end.40

if.end.40:                                        ; preds = %if.end.39, %if.end.33
  %bExp.0 = phi i32 [ %sub1.i, %if.end.39 ], [ %and.i.131, %if.end.33 ]
  %bSig.0 = phi i32 [ %shl.i.81, %if.end.39 ], [ %and.i.132, %if.end.33 ]
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
  %call52 = tail call fastcc i32 @roundAndPackFloat32(i32 %xor, i32 %dec.sub, i32 %shl46.or45)
  br label %cleanup

cleanup:                                          ; preds = %cond.false.i, %if.end.i, %cond.false.i.125, %if.end.i.121, %if.end.40, %if.then.37, %if.then.30, %if.end.24, %if.then.23, %if.end.12, %if.then.11
  %retval.0 = phi i32 [ 2147483647, %if.then.11 ], [ %add.i.105, %if.end.12 ], [ 2147483647, %if.then.23 ], [ %add.i.100, %if.end.24 ], [ %shl.i.98, %if.then.30 ], [ %shl.i.82, %if.then.37 ], [ %call52, %if.end.40 ], [ %cond.or.i.124, %cond.false.i.125 ], [ %or4.i.117, %if.end.i.121 ], [ %cond.or.i, %cond.false.i ], [ %or4.i, %if.end.i ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
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

; Function Attrs: nounwind
define i32 @float32_div(i32 %a, i32 %b) #2 {
entry:
  %and.i = and i32 %a, 8388607
  %shr.i = lshr i32 %a, 23
  %and.i.93 = and i32 %shr.i, 255
  %and.i.181 = and i32 %b, 8388607
  %shr.i.179 = lshr i32 %b, 23
  %and.i.180 = and i32 %shr.i.179, 255
  %shr.i.182209 = xor i32 %b, %a
  %xor = lshr i32 %shr.i.182209, 31
  %cmp = icmp eq i32 %and.i.93, 255
  br i1 %cmp, label %if.then, label %if.end.16

if.then:                                          ; preds = %entry
  %tobool = icmp eq i32 %and.i, 0
  br i1 %tobool, label %if.end, label %if.then.6

if.then.6:                                        ; preds = %if.then
  %and.i.32.i.156 = and i32 %a, 2143289344
  %cmp.i.33.i.157 = icmp eq i32 %and.i.32.i.156, 2139095040
  %and1.i.34.i.158 = and i32 %a, 4194303
  %tobool.i.35.i.159 = icmp ne i32 %and1.i.34.i.158, 0
  %0 = and i1 %cmp.i.33.i.157, %tobool.i.35.i.159
  %1 = trunc i32 %b to i31
  %cmp.i.31.i.160 = icmp ugt i31 %1, -8388608
  %and.i.i.161 = and i32 %b, 2143289344
  %cmp.i.i.162 = icmp eq i32 %and.i.i.161, 2139095040
  %and1.i.i.163 = and i32 %b, 4194303
  %tobool.i.i.164 = icmp ne i32 %and1.i.i.163, 0
  %2 = and i1 %cmp.i.i.162, %tobool.i.i.164
  %or.i.165 = or i32 %a, 4194304
  %or4.i.166 = or i32 %b, 4194304
  %or537.i.167 = or i1 %0, %2
  br i1 %or537.i.167, label %if.then.i.169, label %if.end.i.170

if.then.i.169:                                    ; preds = %if.then.6
  %3 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.168 = or i32 %3, 16
  store i32 %or.i.i.168, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.i.170

if.end.i.170:                                     ; preds = %if.then.i.169, %if.then.6
  br i1 %2, label %cleanup, label %cond.false.i.174

cond.false.i.174:                                 ; preds = %if.end.i.170
  %tobool7.i.172.demorgan = and i1 %cmp.i.33.i.157, %tobool.i.35.i.159
  %tobool7.i.172 = xor i1 %tobool7.i.172.demorgan, true
  %4 = and i1 %cmp.i.31.i.160, %tobool7.i.172
  %cond.or.i.173 = select i1 %4, i32 %or4.i.166, i32 %or.i.165
  br label %cleanup

if.end:                                           ; preds = %if.then
  %cmp8 = icmp eq i32 %and.i.180, 255
  br i1 %cmp8, label %if.then.9, label %if.end.14

if.then.9:                                        ; preds = %if.end
  %tobool10 = icmp eq i32 %and.i.181, 0
  br i1 %tobool10, label %if.end.13, label %if.then.11

if.then.11:                                       ; preds = %if.then.9
  %and.i.32.i.134 = and i32 %a, 2143289344
  %cmp.i.33.i.135 = icmp eq i32 %and.i.32.i.134, 2139095040
  %and1.i.34.i.136 = and i32 %a, 4194303
  %tobool.i.35.i.137 = icmp ne i32 %and1.i.34.i.136, 0
  %5 = and i1 %cmp.i.33.i.135, %tobool.i.35.i.137
  %6 = trunc i32 %b to i31
  %cmp.i.31.i.138 = icmp ugt i31 %6, -8388608
  %and.i.i.139 = and i32 %b, 2143289344
  %cmp.i.i.140 = icmp eq i32 %and.i.i.139, 2139095040
  %and1.i.i.141 = and i32 %b, 4194303
  %tobool.i.i.142 = icmp ne i32 %and1.i.i.141, 0
  %7 = and i1 %cmp.i.i.140, %tobool.i.i.142
  %or.i.143 = or i32 %a, 4194304
  %or4.i.144 = or i32 %b, 4194304
  %or537.i.145 = or i1 %5, %7
  br i1 %or537.i.145, label %if.then.i.147, label %if.end.i.148

if.then.i.147:                                    ; preds = %if.then.11
  %8 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.146 = or i32 %8, 16
  store i32 %or.i.i.146, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.i.148

if.end.i.148:                                     ; preds = %if.then.i.147, %if.then.11
  br i1 %7, label %cleanup, label %cond.false.i.152

cond.false.i.152:                                 ; preds = %if.end.i.148
  %tobool7.i.150.demorgan = and i1 %cmp.i.33.i.135, %tobool.i.35.i.137
  %tobool7.i.150 = xor i1 %tobool7.i.150.demorgan, true
  %9 = and i1 %cmp.i.31.i.138, %tobool7.i.150
  %cond.or.i.151 = select i1 %9, i32 %or4.i.144, i32 %or.i.143
  br label %cleanup

if.end.13:                                        ; preds = %if.then.9
  %10 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.133 = or i32 %10, 16
  store i32 %or.i.133, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.14:                                        ; preds = %if.end
  %shl.i.131 = shl nuw i32 %xor, 31
  %add.i.132 = or i32 %shl.i.131, 2139095040
  br label %cleanup

if.end.16:                                        ; preds = %entry
  switch i32 %and.i.180, label %if.end.34 [
    i32 255, label %if.then.18
    i32 0, label %if.then.26
  ]

if.then.18:                                       ; preds = %if.end.16
  %tobool19 = icmp eq i32 %and.i.181, 0
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
  %cmp.i.i.126 = icmp eq i32 %and.i.i, 2139095040
  %and1.i.i = and i32 %b, 4194303
  %tobool.i.i = icmp ne i32 %and1.i.i, 0
  %13 = and i1 %cmp.i.i.126, %tobool.i.i
  %or.i.127 = or i32 %a, 4194304
  %or4.i = or i32 %b, 4194304
  %or537.i = or i1 %11, %13
  br i1 %or537.i, label %if.then.i, label %if.end.i.128

if.then.i:                                        ; preds = %if.then.20
  %14 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i = or i32 %14, 16
  store i32 %or.i.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.i.128

if.end.i.128:                                     ; preds = %if.then.i, %if.then.20
  br i1 %13, label %cleanup, label %cond.false.i.129

cond.false.i.129:                                 ; preds = %if.end.i.128
  %tobool7.i.demorgan = and i1 %cmp.i.33.i, %tobool.i.35.i
  %tobool7.i = xor i1 %tobool7.i.demorgan, true
  %15 = and i1 %cmp.i.31.i, %tobool7.i
  %cond.or.i = select i1 %15, i32 %or4.i, i32 %or.i.127
  br label %cleanup

if.end.22:                                        ; preds = %if.then.18
  %shl.i.125 = shl nuw i32 %xor, 31
  br label %cleanup

if.then.26:                                       ; preds = %if.end.16
  %cmp27 = icmp eq i32 %and.i.181, 0
  br i1 %cmp27, label %if.then.28, label %if.end.33

if.then.28:                                       ; preds = %if.then.26
  %or = or i32 %and.i.93, %and.i
  %cmp29 = icmp eq i32 %or, 0
  %16 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  br i1 %cmp29, label %if.then.30, label %if.end.31

if.then.30:                                       ; preds = %if.then.28
  %or.i.124 = or i32 %16, 16
  store i32 %or.i.124, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.31:                                        ; preds = %if.then.28
  %or.i.123 = or i32 %16, 2
  store i32 %or.i.123, i32* @float_exception_flags, align 4, !tbaa !1
  %shl.i.121 = shl nuw i32 %xor, 31
  %add.i.122 = or i32 %shl.i.121, 2139095040
  br label %cleanup

if.end.33:                                        ; preds = %if.then.26
  %cmp.i.i.106 = icmp ult i32 %and.i.181, 65536
  %shl.i.i.107 = shl i32 %b, 16
  %shl.a.i.i.108 = select i1 %cmp.i.i.106, i32 %shl.i.i.107, i32 %and.i.181
  %..i.i.109 = select i1 %cmp.i.i.106, i32 16, i32 0
  %cmp1.i.i.110 = icmp ult i32 %shl.a.i.i.108, 16777216
  %add3.i.i.111 = or i32 %..i.i.109, 8
  %shl4.i.i.112 = shl i32 %shl.a.i.i.108, 8
  %a.addr.1.i.i.113 = select i1 %cmp1.i.i.110, i32 %shl4.i.i.112, i32 %shl.a.i.i.108
  %shiftCount.1.i.i.114 = select i1 %cmp1.i.i.110, i32 %add3.i.i.111, i32 %..i.i.109
  %shr.i.i.115 = lshr i32 %a.addr.1.i.i.113, 24
  %arrayidx.i.i.116 = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.i.115
  %17 = load i32, i32* %arrayidx.i.i.116, align 4, !tbaa !1
  %add6.i.i.117 = add nsw i32 %17, %shiftCount.1.i.i.114
  %sub.i.118 = add nsw i32 %add6.i.i.117, -8
  %shl.i.119 = shl i32 %and.i.181, %sub.i.118
  %sub1.i.120 = sub i32 9, %add6.i.i.117
  br label %if.end.34

if.end.34:                                        ; preds = %if.end.16, %if.end.33
  %bSig.0 = phi i32 [ %and.i.181, %if.end.16 ], [ %shl.i.119, %if.end.33 ]
  %bExp.0 = phi i32 [ %and.i.180, %if.end.16 ], [ %sub1.i.120, %if.end.33 ]
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
  %arrayidx.i.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.i
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
  %cmp52.210 = icmp slt i32 %sub2.i, 0
  br i1 %cmp52.210, label %while.body.preheader, label %while.end

while.body.preheader:                             ; preds = %if.then.51
  br label %while.body

while.body:                                       ; preds = %while.body.preheader, %while.body
  %zSig.0213 = phi i32 [ %dec, %while.body ], [ %or14.i, %while.body.preheader ]
  %rem1.0212 = phi i32 [ %add.i, %while.body ], [ %sub.i, %while.body.preheader ]
  %rem0.0211 = phi i32 [ %add2.i, %while.body ], [ %sub2.i, %while.body.preheader ]
  %dec = add i32 %zSig.0213, -1
  %add.i = add i32 %rem1.0212, %shl44
  %cmp.i = icmp ult i32 %add.i, %rem1.0212
  %conv.i = zext i1 %cmp.i to i32
  %add2.i = add i32 %conv.i, %rem0.0211
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
  %call56 = tail call fastcc i32 @roundAndPackFloat32(i32 %xor, i32 %zExp.0, i32 %zSig.1)
  br label %cleanup

cleanup:                                          ; preds = %cond.false.i.129, %if.end.i.128, %cond.false.i.152, %if.end.i.148, %cond.false.i.174, %if.end.i.170, %if.end.55, %if.then.38, %if.end.31, %if.then.30, %if.end.22, %if.end.14, %if.end.13
  %retval.0 = phi i32 [ 2147483647, %if.end.13 ], [ %add.i.132, %if.end.14 ], [ %shl.i.125, %if.end.22 ], [ 2147483647, %if.then.30 ], [ %add.i.122, %if.end.31 ], [ %shl.i.105, %if.then.38 ], [ %call56, %if.end.55 ], [ %cond.or.i.173, %cond.false.i.174 ], [ %or4.i.166, %if.end.i.170 ], [ %cond.or.i.151, %cond.false.i.152 ], [ %or4.i.144, %if.end.i.148 ], [ %cond.or.i, %cond.false.i.129 ], [ %or4.i, %if.end.i.128 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float32_rem(i32 %a, i32 %b) #2 {
entry:
  %and.i = and i32 %a, 8388607
  %shr.i = lshr i32 %a, 23
  %and.i.145 = and i32 %shr.i, 255
  %shr.i.262 = lshr i32 %a, 31
  %and.i.261 = and i32 %b, 8388607
  %shr.i.259 = lshr i32 %b, 23
  %and.i.260 = and i32 %shr.i.259, 255
  %cmp = icmp eq i32 %and.i.145, 255
  br i1 %cmp, label %if.then, label %if.end.10

if.then:                                          ; preds = %entry
  %tobool = icmp eq i32 %and.i, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then.8

lor.lhs.false:                                    ; preds = %if.then
  %cmp6 = icmp eq i32 %and.i.260, 255
  %tobool7 = icmp ne i32 %and.i.261, 0
  %or.cond = and i1 %tobool7, %cmp6
  br i1 %or.cond, label %if.then.8, label %if.end

if.then.8:                                        ; preds = %if.then, %lor.lhs.false
  %and.i.32.i.237 = and i32 %a, 2143289344
  %cmp.i.33.i.238 = icmp eq i32 %and.i.32.i.237, 2139095040
  %and1.i.34.i.239 = and i32 %a, 4194303
  %tobool.i.35.i.240 = icmp ne i32 %and1.i.34.i.239, 0
  %0 = and i1 %cmp.i.33.i.238, %tobool.i.35.i.240
  %1 = trunc i32 %b to i31
  %cmp.i.31.i.241 = icmp ugt i31 %1, -8388608
  %and.i.i.242 = and i32 %b, 2143289344
  %cmp.i.i.243 = icmp eq i32 %and.i.i.242, 2139095040
  %and1.i.i.244 = and i32 %b, 4194303
  %tobool.i.i.245 = icmp ne i32 %and1.i.i.244, 0
  %2 = and i1 %cmp.i.i.243, %tobool.i.i.245
  %or.i.246 = or i32 %a, 4194304
  %or4.i.247 = or i32 %b, 4194304
  %or537.i.248 = or i1 %0, %2
  br i1 %or537.i.248, label %if.then.i.250, label %if.end.i.251

if.then.i.250:                                    ; preds = %if.then.8
  %3 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.249 = or i32 %3, 16
  store i32 %or.i.i.249, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.i.251

if.end.i.251:                                     ; preds = %if.then.i.250, %if.then.8
  br i1 %2, label %cleanup, label %cond.false.i.255

cond.false.i.255:                                 ; preds = %if.end.i.251
  %tobool7.i.253.demorgan = and i1 %cmp.i.33.i.238, %tobool.i.35.i.240
  %tobool7.i.253 = xor i1 %tobool7.i.253.demorgan, true
  %4 = and i1 %cmp.i.31.i.241, %tobool7.i.253
  %cond.or.i.254 = select i1 %4, i32 %or4.i.247, i32 %or.i.246
  br label %cleanup

if.end:                                           ; preds = %lor.lhs.false
  %5 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.236 = or i32 %5, 16
  store i32 %or.i.236, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.10:                                        ; preds = %entry
  switch i32 %and.i.260, label %if.end.23 [
    i32 255, label %if.then.12
    i32 0, label %if.then.19
  ]

if.then.12:                                       ; preds = %if.end.10
  %tobool13 = icmp eq i32 %and.i.261, 0
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
  %cmp.i.i.231 = icmp eq i32 %and.i.i, 2139095040
  %and1.i.i = and i32 %b, 4194303
  %tobool.i.i = icmp ne i32 %and1.i.i, 0
  %8 = and i1 %cmp.i.i.231, %tobool.i.i
  %or.i.232 = or i32 %a, 4194304
  %or4.i = or i32 %b, 4194304
  %or537.i = or i1 %6, %8
  br i1 %or537.i, label %if.then.i, label %if.end.i.233

if.then.i:                                        ; preds = %if.then.14
  %9 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i = or i32 %9, 16
  store i32 %or.i.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.i.233

if.end.i.233:                                     ; preds = %if.then.i, %if.then.14
  br i1 %8, label %cleanup, label %cond.false.i.234

cond.false.i.234:                                 ; preds = %if.end.i.233
  %tobool7.i.demorgan = and i1 %cmp.i.33.i, %tobool.i.35.i
  %tobool7.i = xor i1 %tobool7.i.demorgan, true
  %10 = and i1 %cmp.i.31.i, %tobool7.i
  %cond.or.i = select i1 %10, i32 %or4.i, i32 %or.i.232
  br label %cleanup

if.then.19:                                       ; preds = %if.end.10
  %cmp20 = icmp eq i32 %and.i.261, 0
  br i1 %cmp20, label %if.then.21, label %if.end.22

if.then.21:                                       ; preds = %if.then.19
  %11 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.230 = or i32 %11, 16
  store i32 %or.i.230, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.22:                                        ; preds = %if.then.19
  %cmp.i.i.215 = icmp ult i32 %and.i.261, 65536
  %shl.i.i.216 = shl i32 %b, 16
  %shl.a.i.i.217 = select i1 %cmp.i.i.215, i32 %shl.i.i.216, i32 %and.i.261
  %..i.i.218 = select i1 %cmp.i.i.215, i32 16, i32 0
  %cmp1.i.i.219 = icmp ult i32 %shl.a.i.i.217, 16777216
  %add3.i.i.220 = or i32 %..i.i.218, 8
  %shl4.i.i.221 = shl i32 %shl.a.i.i.217, 8
  %a.addr.1.i.i.222 = select i1 %cmp1.i.i.219, i32 %shl4.i.i.221, i32 %shl.a.i.i.217
  %shiftCount.1.i.i.223 = select i1 %cmp1.i.i.219, i32 %add3.i.i.220, i32 %..i.i.218
  %shr.i.i.224 = lshr i32 %a.addr.1.i.i.222, 24
  %arrayidx.i.i.225 = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.i.224
  %12 = load i32, i32* %arrayidx.i.i.225, align 4, !tbaa !1
  %add6.i.i.226 = add nsw i32 %12, %shiftCount.1.i.i.223
  %sub.i.227 = add nsw i32 %add6.i.i.226, -8
  %shl.i.228 = shl i32 %and.i.261, %sub.i.227
  %sub1.i.229 = sub i32 9, %add6.i.i.226
  br label %if.end.23

if.end.23:                                        ; preds = %if.end.10, %if.end.22
  %bExp.0 = phi i32 [ %and.i.260, %if.end.10 ], [ %sub1.i.229, %if.end.22 ]
  %bSig.0 = phi i32 [ %and.i.261, %if.end.10 ], [ %shl.i.228, %if.end.22 ]
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
  %arrayidx.i.i.210 = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.i.209
  %13 = load i32, i32* %arrayidx.i.i.210, align 4, !tbaa !1
  %add6.i.i.211 = add nsw i32 %13, %shiftCount.1.i.i.208
  %sub.i.212 = add nsw i32 %add6.i.i.211, -8
  %shl.i.213 = shl i32 %and.i, %sub.i.212
  %sub1.i.214 = sub i32 9, %add6.i.i.211
  br label %if.end.29

if.end.29:                                        ; preds = %if.end.28, %if.end.23
  %aExp.0 = phi i32 [ %sub1.i.214, %if.end.28 ], [ %and.i.145, %if.end.23 ]
  %aSig.0 = phi i32 [ %shl.i.213, %if.end.28 ], [ %and.i, %if.end.23 ]
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
  %cmp44.298 = icmp sgt i32 %sub, 32
  br i1 %cmp44.298, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %if.end.37
  %shr.i.150 = lshr i32 %shl31, 16
  %shl.i.151 = shl nuw i32 %shr.i.150, 16
  %conv5.i.i.159 = and i32 %or30, 65280
  %shl4.i.172 = shl i32 %bSig.0, 24
  %shr50 = lshr exact i32 %shl31, 2
  %mul = sub nsw i32 0, %shr50
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %estimateDiv64To32.exit199
  %expDiff.0300 = phi i32 [ %sub43, %while.body.lr.ph ], [ %sub52, %estimateDiv64To32.exit199 ]
  %aSig.3299 = phi i32 [ %sub41.aSig.1, %while.body.lr.ph ], [ %sub51, %estimateDiv64To32.exit199 ]
  %cmp.i.149 = icmp ugt i32 %shl31, %aSig.3299
  br i1 %cmp.i.149, label %if.end.i.153, label %estimateDiv64To32.exit199

if.end.i.153:                                     ; preds = %while.body
  %cmp1.i.152 = icmp ugt i32 %shl.i.151, %aSig.3299
  br i1 %cmp1.i.152, label %cond.false.i.156, label %cond.end.i.171

cond.false.i.156:                                 ; preds = %if.end.i.153
  %div.i.154 = udiv i32 %aSig.3299, %shr.i.150
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
  %add24.i.neg.i.167 = sub i32 %aSig.3299, %mul15.i.i.161
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
  %sub52 = add nsw i32 %expDiff.0300, -30
  %cmp44 = icmp sgt i32 %expDiff.0300, 30
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
  %aSig.3.lcssa311 = phi i32 [ %shr, %while.end.thread ], [ %aSig.3.lcssa, %while.end ]
  %q.0.lcssa310 = phi i32 [ 0, %while.end.thread ], [ %q.0.lcssa, %while.end ]
  %shr72 = lshr i32 %aSig.3.lcssa311, 2
  %shr73 = lshr exact i32 %shl31, 2
  br label %do.body.preheader

do.body.preheader:                                ; preds = %if.else, %estimateDiv64To32.exit
  %aSig.4.ph = phi i32 [ %shr72, %if.else ], [ %sub71, %estimateDiv64To32.exit ]
  %bSig.1.ph = phi i32 [ %shr73, %if.else ], [ %shr66, %estimateDiv64To32.exit ]
  %q.1.ph = phi i32 [ %q.0.lcssa310, %if.else ], [ %shr65, %estimateDiv64To32.exit ]
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
  %.lobit296 = phi i32 [ %.lobit, %if.end.87 ], [ 1, %lor.lhs.false.81 ]
  %aSig.5294 = phi i32 [ %aSig.4.lcssa, %if.end.87 ], [ %sub75.lcssa, %lor.lhs.false.81 ]
  %sub92 = sub i32 0, %aSig.5294
  br label %if.end.93

if.end.93:                                        ; preds = %if.then.91, %if.end.87
  %.lobit295 = phi i32 [ %.lobit296, %if.then.91 ], [ %.lobit, %if.end.87 ]
  %aSig.6 = phi i32 [ %sub92, %if.then.91 ], [ %aSig.4.lcssa, %if.end.87 ]
  %xor = xor i32 %.lobit295, %shr.i.262
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
  %arrayidx.i.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.i
  %14 = load i32, i32* %arrayidx.i.i, align 4, !tbaa !1
  %add6.i.i = add i32 %14, -1
  %sub.i = add i32 %add6.i.i, %shiftCount.1.i.i
  %sub1.i = sub nsw i32 %bExp.0, %sub.i
  %shl.i = shl i32 %aSig.6, %sub.i
  %call2.i = tail call fastcc i32 @roundAndPackFloat32(i32 %xor, i32 %sub1.i, i32 %shl.i) #4
  br label %cleanup

cleanup:                                          ; preds = %cond.false.i.234, %if.end.i.233, %cond.false.i.255, %if.end.i.251, %if.then.33, %if.then.25, %if.then.12, %if.end.93, %if.then.21, %if.end
  %retval.0 = phi i32 [ 2147483647, %if.end ], [ 2147483647, %if.then.21 ], [ %call2.i, %if.end.93 ], [ %a, %if.then.12 ], [ %a, %if.then.25 ], [ %a, %if.then.33 ], [ %cond.or.i.254, %cond.false.i.255 ], [ %or4.i.247, %if.end.i.251 ], [ %cond.or.i, %cond.false.i.234 ], [ %or4.i, %if.end.i.233 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float32_sqrt(i32 %a) #2 {
entry:
  %and.i = and i32 %a, 8388607
  %shr.i = lshr i32 %a, 23
  %and.i.54 = and i32 %shr.i, 255
  %shr.i.90 = lshr i32 %a, 31
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
  %or.i.86 = or i32 %a, 4194304
  br i1 %0, label %if.then.i.87, label %cleanup

if.then.i.87:                                     ; preds = %if.then.3
  %1 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i = or i32 %1, 16
  store i32 %or.i.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end:                                           ; preds = %if.then
  %tobool5 = icmp eq i32 %shr.i.90, 0
  br i1 %tobool5, label %cleanup, label %if.end.7

if.end.7:                                         ; preds = %if.end
  %2 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.85 = or i32 %2, 16
  store i32 %or.i.85, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.8:                                         ; preds = %entry
  %tobool9 = icmp eq i32 %shr.i.90, 0
  br i1 %tobool9, label %if.end.14, label %if.then.10

if.then.10:                                       ; preds = %if.end.8
  %or = or i32 %and.i.54, %and.i
  %cmp11 = icmp eq i32 %or, 0
  br i1 %cmp11, label %cleanup, label %if.end.13

if.end.13:                                        ; preds = %if.then.10
  %3 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.84 = or i32 %3, 16
  store i32 %or.i.84, i32* @float_exception_flags, align 4, !tbaa !1
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
  %arrayidx.i.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.i
  %4 = load i32, i32* %arrayidx.i.i, align 4, !tbaa !1
  %add6.i.i = add nsw i32 %4, %shiftCount.1.i.i
  %sub.i.81 = add nsw i32 %add6.i.i, -8
  %shl.i.82 = shl i32 %and.i, %sub.i.81
  %sub1.i.83 = sub i32 9, %add6.i.i
  br label %if.end.20

if.end.20:                                        ; preds = %if.end.19, %if.end.14
  %aExp.0 = phi i32 [ %sub1.i.83, %if.end.19 ], [ %and.i.54, %if.end.14 ]
  %aSig.0 = phi i32 [ %shl.i.82, %if.end.19 ], [ %and.i, %if.end.14 ]
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
  %arrayidx.i = getelementptr inbounds [16 x i16], [16 x i16]* @estimateSqrt32.sqrtOddAdjustments, i32 0, i32 %and.i.65
  %6 = load i16, i16* %arrayidx.i, align 2, !tbaa !8
  %conv.i.67 = zext i16 %6 to i32
  %sub.i.68 = sub nsw i32 %add.i.66, %conv.i.67
  %div.i = udiv i32 %shl, %sub.i.68
  %shl.i.69 = shl i32 %div.i, 14
  %shl3.i = shl i32 %sub.i.68, 15
  %add4.i = add i32 %shl3.i, %shl.i.69
  %shr5.i = lshr exact i32 %shl, 1
  br label %if.end.19.i

if.else.i:                                        ; preds = %if.end.20
  %add7.i = or i32 %shr2.i, 32768
  %arrayidx8.i = getelementptr inbounds [16 x i16], [16 x i16]* @estimateSqrt32.sqrtEvenAdjustments, i32 0, i32 %and.i.65
  %7 = load i16, i16* %arrayidx8.i, align 2, !tbaa !8
  %conv9.i = zext i16 %7 to i32
  %sub10.i = sub nsw i32 %add7.i, %conv9.i
  %div11.i = udiv i32 %shl, %sub10.i
  %add12.i = add i32 %sub10.i, %div11.i
  %cmp.i.70 = icmp ugt i32 %add12.i, 131071
  %shl14.i = shl i32 %add12.i, 15
  %cond.i = select i1 %cmp.i.70, i32 -32768, i32 %shl14.i
  %cmp15.i = icmp ugt i32 %cond.i, %shl
  br i1 %cmp15.i, label %if.end.19.i, label %if.then.17.i

if.then.17.i:                                     ; preds = %if.else.i
  %shr18.i = ashr exact i32 %shl, 1
  br label %estimateSqrt32.exit

if.end.19.i:                                      ; preds = %if.else.i, %if.then.i
  %a.addr.0.i = phi i32 [ %shr5.i, %if.then.i ], [ %shl, %if.else.i ]
  %z.0.i = phi i32 [ %add4.i, %if.then.i ], [ %cond.i, %if.else.i ]
  %cmp.i.71 = icmp ugt i32 %z.0.i, %a.addr.0.i
  br i1 %cmp.i.71, label %if.end.i, label %estimateDiv64To32.exit

if.end.i:                                         ; preds = %if.end.19.i
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
  %div11.i.79 = udiv i32 %or.i.78, %shr.i.72
  br label %cond.end.12.i

cond.end.12.i:                                    ; preds = %cond.false.10.i, %while.end.i
  %cond13.i = phi i32 [ %div11.i.79, %cond.false.10.i ], [ 65535, %while.end.i ]
  %or14.i = or i32 %cond13.i, %z.0.lcssa.i
  %phitmp = lshr i32 %or14.i, 1
  br label %estimateDiv64To32.exit

estimateDiv64To32.exit:                           ; preds = %if.end.19.i, %cond.end.12.i
  %retval.0.i.80 = phi i32 [ %phitmp, %cond.end.12.i ], [ 2147483647, %if.end.19.i ]
  %shr21.i = lshr i32 %z.0.i, 1
  %add22.i = add nuw i32 %retval.0.i.80, %shr21.i
  br label %estimateSqrt32.exit

estimateSqrt32.exit:                              ; preds = %if.then.17.i, %estimateDiv64To32.exit
  %retval.0.i = phi i32 [ %add22.i, %estimateDiv64To32.exit ], [ %shr18.i, %if.then.17.i ]
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
  %cmp30.114 = icmp slt i32 %sub2.i, 0
  br i1 %cmp30.114, label %while.body.preheader, label %while.end

while.body.preheader:                             ; preds = %if.else
  br label %while.body

while.body:                                       ; preds = %while.body.preheader, %while.body
  %rem1.0117 = phi i32 [ %add.i, %while.body ], [ %sub.i, %while.body.preheader ]
  %rem0.0116 = phi i32 [ %add2.i, %while.body ], [ %sub2.i, %while.body.preheader ]
  %zSig.0115 = phi i32 [ %dec, %while.body ], [ %add23, %while.body.preheader ]
  %dec = add i32 %zSig.0115, -1
  %shl.i.57 = shl i32 %dec, 1
  %shr.i.58 = lshr i32 %dec, 31
  %or31 = or i32 %shl.i.57, 1
  %add.i = add i32 %or31, %rem1.0117
  %add1.i = add i32 %shr.i.58, %rem0.0116
  %cmp.i = icmp ult i32 %add.i, %rem1.0117
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
  %call37 = tail call fastcc i32 @roundAndPackFloat32(i32 0, i32 %add, i32 %zSig.2)
  br label %cleanup

cleanup:                                          ; preds = %if.then.i.87, %if.then.3, %if.then.16, %if.then.10, %if.end, %roundAndPack, %if.end.13, %if.end.7
  %retval.0 = phi i32 [ 2147483647, %if.end.7 ], [ 2147483647, %if.end.13 ], [ %call37, %roundAndPack ], [ %a, %if.end ], [ %a, %if.then.10 ], [ 0, %if.then.16 ], [ %or.i.86, %if.then.3 ], [ %or.i.86, %if.then.i.87 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
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

; Function Attrs: nounwind
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

; Function Attrs: nounwind
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

; Function Attrs: nounwind
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

; Function Attrs: nounwind
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

; Function Attrs: nounwind
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

; Function Attrs: nounwind
define i32 @float64_to_int32(i32 %a.0, i32 %a.1) #2 {
entry:
  %and.i.127 = and i32 %a.1, 1048575
  %shr.i.125 = lshr i32 %a.1, 20
  %and.i.126 = and i32 %shr.i.125, 2047
  %shr.i.124 = lshr i32 %a.1, 31
  %sub = add nsw i32 %and.i.126, -1043
  %cmp = icmp sgt i32 %sub, -1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %cmp12 = icmp ugt i32 %and.i.126, 1054
  br i1 %cmp12, label %if.then.13, label %if.end.16

if.then.13:                                       ; preds = %if.then
  %cmp14 = icmp ne i32 %and.i.126, 2047
  %or = or i32 %and.i.127, %a.0
  %tobool = icmp eq i32 %or, 0
  %or.cond122 = or i1 %cmp14, %tobool
  %call11. = select i1 %or.cond122, i32 %shr.i.124, i32 0
  br label %invalid

if.end.16:                                        ; preds = %if.then
  %or17 = or i32 %and.i.127, 1048576
  %shl.i = shl i32 %a.0, %sub
  %cmp.i = icmp eq i32 %sub, 0
  br i1 %cmp.i, label %shortShift64Left.exit, label %cond.false.i

cond.false.i:                                     ; preds = %if.end.16
  %shl1.i = shl i32 %or17, %sub
  %sub.i = sub nsw i32 1043, %shr.i.125
  %and.i = and i32 %sub.i, 31
  %shr.i = lshr i32 %a.0, %and.i
  %or.i.123 = or i32 %shr.i, %shl1.i
  br label %shortShift64Left.exit

shortShift64Left.exit:                            ; preds = %if.end.16, %cond.false.i
  %cond.i = phi i32 [ %or.i.123, %cond.false.i ], [ %or17, %if.end.16 ]
  %cmp18 = icmp ugt i32 %cond.i, -2147483648
  br i1 %cmp18, label %invalid, label %if.end.32

if.else:                                          ; preds = %entry
  %cmp21 = icmp ne i32 %a.0, 0
  %conv = zext i1 %cmp21 to i32
  %cmp22 = icmp ult i32 %and.i.126, 1022
  br i1 %cmp22, label %if.then.24, label %if.else.27

if.then.24:                                       ; preds = %if.else
  %or25 = or i32 %conv, %and.i.127
  %or26 = or i32 %or25, %and.i.126
  br label %if.end.32

if.else.27:                                       ; preds = %if.else
  %or28 = or i32 %and.i.127, 1048576
  %fold = add nuw nsw i32 %shr.i.125, 13
  %and = and i32 %fold, 31
  %shl = shl i32 %or28, %and
  %or29 = or i32 %shl, %conv
  %sub30 = sub nsw i32 1043, %and.i.126
  %shr = lshr i32 %or28, %sub30
  br label %if.end.32

if.end.32:                                        ; preds = %if.then.24, %if.else.27, %shortShift64Left.exit
  %absZ.0 = phi i32 [ %cond.i, %shortShift64Left.exit ], [ 0, %if.then.24 ], [ %shr, %if.else.27 ]
  %aSigExtra.0 = phi i32 [ %shl.i, %shortShift64Left.exit ], [ %or26, %if.then.24 ], [ %or29, %if.else.27 ]
  %0 = load i32, i32* @float_rounding_mode, align 4, !tbaa !1
  %cmp33 = icmp eq i32 %0, 0
  br i1 %cmp33, label %if.then.35, label %if.else.48

if.then.35:                                       ; preds = %if.end.32
  %cmp36 = icmp slt i32 %aSigExtra.0, 0
  br i1 %cmp36, label %if.then.38, label %if.end.45

if.then.38:                                       ; preds = %if.then.35
  %inc = add i32 %absZ.0, 1
  %shl39.mask = and i32 %aSigExtra.0, 2147483647
  %cmp40 = icmp eq i32 %shl39.mask, 0
  %and43 = and i32 %inc, -2
  %and43.inc = select i1 %cmp40, i32 %and43, i32 %inc
  br label %if.end.45

if.end.45:                                        ; preds = %if.then.38, %if.then.35
  %absZ.1 = phi i32 [ %absZ.0, %if.then.35 ], [ %and43.inc, %if.then.38 ]
  %tobool46 = icmp ne i32 %shr.i.124, 0
  %sub47 = sub i32 0, %absZ.1
  %cond = select i1 %tobool46, i32 %sub47, i32 %absZ.1
  br label %if.end.63

if.else.48:                                       ; preds = %if.end.32
  %cmp49 = icmp ne i32 %aSigExtra.0, 0
  %conv50 = zext i1 %cmp49 to i32
  %tobool51 = icmp eq i32 %shr.i.124, 0
  br i1 %tobool51, label %if.else.57, label %if.then.52

if.then.52:                                       ; preds = %if.else.48
  %cmp53 = icmp eq i32 %0, 3
  %and55121 = and i1 %cmp49, %cmp53
  %and55 = zext i1 %and55121 to i32
  %add = add i32 %absZ.0, %and55
  %sub56 = sub i32 0, %add
  br label %if.end.63

if.else.57:                                       ; preds = %if.else.48
  %cmp58 = icmp eq i32 %0, 2
  %and60120 = and i1 %cmp49, %cmp58
  %and60 = zext i1 %and60120 to i32
  %add61 = add i32 %and60, %absZ.0
  br label %if.end.63

if.end.63:                                        ; preds = %if.then.52, %if.else.57, %if.end.45
  %aSigExtra.1 = phi i32 [ %aSigExtra.0, %if.end.45 ], [ %conv50, %if.else.57 ], [ %conv50, %if.then.52 ]
  %z.0 = phi i32 [ %cond, %if.end.45 ], [ %add61, %if.else.57 ], [ %sub56, %if.then.52 ]
  %z.0.lobit = lshr i32 %z.0, 31
  %tobool66 = icmp ne i32 %shr.i.124, %z.0.lobit
  %tobool68 = icmp ne i32 %z.0, 0
  %or.cond = and i1 %tobool68, %tobool66
  br i1 %or.cond, label %invalid, label %if.end.72

invalid:                                          ; preds = %if.then.13, %if.end.63, %shortShift64Left.exit
  %aSign.0 = phi i32 [ %shr.i.124, %shortShift64Left.exit ], [ %shr.i.124, %if.end.63 ], [ %call11., %if.then.13 ]
  %1 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %1, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  %tobool70 = icmp ne i32 %aSign.0, 0
  %cond71 = select i1 %tobool70, i32 -2147483648, i32 2147483647
  br label %cleanup

if.end.72:                                        ; preds = %if.end.63
  %tobool73 = icmp eq i32 %aSigExtra.1, 0
  br i1 %tobool73, label %cleanup, label %if.then.74

if.then.74:                                       ; preds = %if.end.72
  %2 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or75 = or i32 %2, 1
  store i32 %or75, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

cleanup:                                          ; preds = %if.then.74, %if.end.72, %invalid
  %retval.0 = phi i32 [ %cond71, %invalid ], [ %z.0, %if.end.72 ], [ %z.0, %if.then.74 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float64_to_int32_round_to_zero(i32 %a.0, i32 %a.1) #2 {
entry:
  %and.i.87 = and i32 %a.1, 1048575
  %shr.i.85 = lshr i32 %a.1, 20
  %and.i.86 = and i32 %shr.i.85, 2047
  %shr.i.84 = lshr i32 %a.1, 31
  %sub = add nsw i32 %and.i.86, -1043
  %cmp = icmp sgt i32 %sub, -1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %cmp12 = icmp ugt i32 %and.i.86, 1054
  br i1 %cmp12, label %if.then.13, label %if.end.16

if.then.13:                                       ; preds = %if.then
  %cmp14 = icmp ne i32 %and.i.86, 2047
  %or = or i32 %and.i.87, %a.0
  %tobool = icmp eq i32 %or, 0
  %or.cond82 = or i1 %cmp14, %tobool
  %call11. = select i1 %or.cond82, i32 %shr.i.84, i32 0
  br label %invalid

if.end.16:                                        ; preds = %if.then
  %or17 = or i32 %and.i.87, 1048576
  %shl.i = shl i32 %a.0, %sub
  %cmp.i = icmp eq i32 %sub, 0
  br i1 %cmp.i, label %if.end.30, label %cond.false.i

cond.false.i:                                     ; preds = %if.end.16
  %shl1.i = shl i32 %or17, %sub
  %sub.i = sub nsw i32 1043, %shr.i.85
  %and.i = and i32 %sub.i, 31
  %shr.i = lshr i32 %a.0, %and.i
  %or.i.83 = or i32 %shr.i, %shl1.i
  br label %if.end.30

if.else:                                          ; preds = %entry
  %cmp18 = icmp ult i32 %and.i.86, 1023
  br i1 %cmp18, label %if.then.19, label %if.end.26

if.then.19:                                       ; preds = %if.else
  %or20 = or i32 %and.i.87, %a.0
  %or21 = or i32 %or20, %and.i.86
  %tobool22 = icmp eq i32 %or21, 0
  br i1 %tobool22, label %cleanup, label %if.then.23

if.then.23:                                       ; preds = %if.then.19
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or24 = or i32 %0, 1
  store i32 %or24, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.26:                                        ; preds = %if.else
  %or27 = or i32 %and.i.87, 1048576
  %fold = add nuw nsw i32 %shr.i.85, 13
  %and = and i32 %fold, 31
  %shl = shl i32 %or27, %and
  %or28 = or i32 %shl, %a.0
  %sub29 = sub nsw i32 1043, %and.i.86
  %shr = lshr i32 %or27, %sub29
  br label %if.end.30

if.end.30:                                        ; preds = %cond.false.i, %if.end.16, %if.end.26
  %absZ.0 = phi i32 [ %shr, %if.end.26 ], [ %or.i.83, %cond.false.i ], [ %or17, %if.end.16 ]
  %aSigExtra.0 = phi i32 [ %or28, %if.end.26 ], [ %shl.i, %cond.false.i ], [ %shl.i, %if.end.16 ]
  %tobool31 = icmp ne i32 %shr.i.84, 0
  %sub32 = sub i32 0, %absZ.0
  %cond = select i1 %tobool31, i32 %sub32, i32 %absZ.0
  %cond.lobit = lshr i32 %cond, 31
  %tobool34 = icmp ne i32 %shr.i.84, %cond.lobit
  %tobool36 = icmp ne i32 %absZ.0, 0
  %or.cond = and i1 %tobool36, %tobool34
  br i1 %or.cond, label %invalid, label %if.end.40

invalid:                                          ; preds = %if.then.13, %if.end.30
  %aSign.0 = phi i32 [ %shr.i.84, %if.end.30 ], [ %call11., %if.then.13 ]
  %1 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %1, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  %tobool38 = icmp ne i32 %aSign.0, 0
  %cond39 = select i1 %tobool38, i32 -2147483648, i32 2147483647
  br label %cleanup

if.end.40:                                        ; preds = %if.end.30
  %tobool41 = icmp eq i32 %aSigExtra.0, 0
  br i1 %tobool41, label %cleanup, label %if.then.42

if.then.42:                                       ; preds = %if.end.40
  %2 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or43 = or i32 %2, 1
  store i32 %or43, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

cleanup:                                          ; preds = %if.then.42, %if.end.40, %if.then.23, %if.then.19, %invalid
  %retval.0 = phi i32 [ %cond39, %invalid ], [ 0, %if.then.19 ], [ 0, %if.then.23 ], [ %cond, %if.end.40 ], [ %cond, %if.then.42 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float64_to_float32(i32 %a.0, i32 %a.1) #2 {
entry:
  %and.i = and i32 %a.1, 1048575
  %shr.i.51 = lshr i32 %a.1, 20
  %and.i.52 = and i32 %shr.i.51, 2047
  %shr.i.50 = lshr i32 %a.1, 31
  %cmp = icmp eq i32 %and.i.52, 2047
  br i1 %cmp, label %if.then, label %if.end.19

if.then:                                          ; preds = %entry
  %or = or i32 %and.i, %a.0
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %if.end, label %if.then.12

if.then.12:                                       ; preds = %if.then
  %and.i.i = and i32 %a.1, 2146959360
  %cmp.i.i = icmp eq i32 %and.i.i, 2146435072
  br i1 %cmp.i.i, label %land.rhs.i.i, label %float64ToCommonNaN.exit

land.rhs.i.i:                                     ; preds = %if.then.12
  %and4.i.i = and i32 %a.1, 524287
  %0 = or i32 %and4.i.i, %a.0
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %float64ToCommonNaN.exit, label %if.then.i

if.then.i:                                        ; preds = %land.rhs.i.i
  %2 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !10
  %or.i.11.i = or i32 %2, 16
  store i32 %or.i.11.i, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !10
  br label %float64ToCommonNaN.exit

float64ToCommonNaN.exit:                          ; preds = %if.then.12, %land.rhs.i.i, %if.then.i
  %shl1.i.i = shl i32 %a.1, 12
  %shr.i.i = lshr i32 %a.0, 20
  %or.i.i = or i32 %shl1.i.i, %shr.i.i
  %shl.i.46 = shl nuw i32 %shr.i.50, 31
  %shr.i.47 = lshr i32 %or.i.i, 9
  %or.i.48 = or i32 %shl.i.46, %shr.i.47
  %or3.i = or i32 %or.i.48, 2143289344
  br label %cleanup

if.end:                                           ; preds = %if.then
  %shl.i.45 = shl nuw i32 %shr.i.50, 31
  %add.i = or i32 %shl.i.45, 2139095040
  br label %cleanup

if.end.19:                                        ; preds = %entry
  %shl.i = shl nuw nsw i32 %and.i, 10
  %shr.i = lshr i32 %a.0, 22
  %or.i = or i32 %shl.i, %shr.i
  %shl3.i.mask = and i32 %a.0, 4194303
  %cmp4.i = icmp ne i32 %shl3.i.mask, 0
  %conv.i = zext i1 %cmp4.i to i32
  %or5.i = or i32 %or.i, %conv.i
  %tobool20 = icmp eq i32 %and.i.52, 0
  %or22 = or i32 %or5.i, 1073741824
  %or5.i.or22 = select i1 %tobool20, i32 %or5.i, i32 %or22
  %sub = add nsw i32 %and.i.52, -897
  %call24 = tail call fastcc i32 @roundAndPackFloat32(i32 %shr.i.50, i32 %sub, i32 %or5.i.or22)
  br label %cleanup

cleanup:                                          ; preds = %if.end.19, %if.end, %float64ToCommonNaN.exit
  %retval.0 = phi i32 [ %or3.i, %float64ToCommonNaN.exit ], [ %add.i, %if.end ], [ %call24, %if.end.19 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i64 @float64_round_to_int(i32 %a.0, i32 %a.1) #2 {
entry:
  %shr.i = lshr i32 %a.1, 20
  %and.i = and i32 %shr.i, 2047
  %cmp = icmp ugt i32 %and.i, 1042
  br i1 %cmp, label %if.then, label %if.else.67

if.then:                                          ; preds = %entry
  %cmp3 = icmp ugt i32 %and.i, 1074
  br i1 %cmp3, label %if.then.4, label %if.end.18

if.then.4:                                        ; preds = %if.then
  %cmp5 = icmp eq i32 %and.i, 2047
  br i1 %cmp5, label %land.lhs.true, label %cleanup

land.lhs.true:                                    ; preds = %if.then.4
  %and.i.266 = and i32 %a.1, 1048575
  %or = or i32 %and.i.266, %a.0
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %cleanup, label %if.then.12

if.then.12:                                       ; preds = %land.lhs.true
  %and.i.56.i = and i32 %a.1, 2146959360
  %cmp.i.57.i = icmp eq i32 %and.i.56.i, 2146435072
  br i1 %cmp.i.57.i, label %land.rhs.i.59.i, label %float64_is_signaling_nan.exit.i

land.rhs.i.59.i:                                  ; preds = %if.then.12
  %tobool.i.58.i = icmp eq i32 %a.0, 0
  br i1 %tobool.i.58.i, label %lor.rhs.i.i, label %float64_is_signaling_nan.exit.thread.i

float64_is_signaling_nan.exit.thread.i:           ; preds = %land.rhs.i.59.i
  %or.66.i = or i32 %a.1, 524288
  br label %if.then.i

lor.rhs.i.i:                                      ; preds = %land.rhs.i.59.i
  %and4.i.60.i = and i32 %a.1, 524287
  %tobool5.i.61.i = icmp ne i32 %and4.i.60.i, 0
  %and4.i.i = and i32 %a.1, 524287
  %tobool5.i.i = icmp ne i32 %and4.i.i, 0
  br label %float64_is_signaling_nan.exit.i

float64_is_signaling_nan.exit.i:                  ; preds = %if.then.12, %lor.rhs.i.i
  %0 = phi i1 [ %tobool5.i.61.i, %lor.rhs.i.i ], [ false, %if.then.12 ]
  %1 = phi i1 [ %tobool5.i.i, %lor.rhs.i.i ], [ false, %if.then.12 ]
  %or.i = or i32 %a.1, 524288
  %or1865.i = or i1 %0, %1
  br i1 %or1865.i, label %if.then.i, label %cleanup

if.then.i:                                        ; preds = %float64_is_signaling_nan.exit.i, %float64_is_signaling_nan.exit.thread.i
  %or1772.i = phi i32 [ %or.66.i, %float64_is_signaling_nan.exit.thread.i ], [ %or.i, %float64_is_signaling_nan.exit.i ]
  %2 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i = or i32 %2, 16
  store i32 %or.i.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.18:                                        ; preds = %if.then
  %sub = sub nsw i32 1074, %and.i
  %shl19 = shl i32 2, %sub
  %sub20 = add i32 %shl19, -1
  %3 = load i32, i32* @float_rounding_mode, align 4, !tbaa !1
  switch i32 %3, label %if.then.50 [
    i32 0, label %if.then.22
    i32 1, label %if.end.63
  ]

if.then.22:                                       ; preds = %if.end.18
  %tobool23 = icmp ult i32 %sub, 31
  br i1 %tobool23, label %if.then.24, label %if.else

if.then.24:                                       ; preds = %if.then.22
  %shr = lshr i32 %shl19, 1
  %add.i.262 = add i32 %shr, %a.0
  %cmp.i.263 = icmp ult i32 %add.i.262, %a.0
  %conv.i.264 = zext i1 %cmp.i.263 to i32
  %add2.i.265 = add i32 %conv.i.264, %a.1
  %and = and i32 %add.i.262, %sub20
  %cmp30 = icmp eq i32 %and, 0
  br i1 %cmp30, label %if.then.31, label %if.end.63

if.then.31:                                       ; preds = %if.then.24
  %neg = xor i32 %shl19, -1
  %and33 = and i32 %add.i.262, %neg
  br label %if.end.63

if.else:                                          ; preds = %if.then.22
  %cmp36 = icmp slt i32 %a.0, 0
  br i1 %cmp36, label %if.then.37, label %if.end.63

if.then.37:                                       ; preds = %if.else
  %inc = add i32 %a.1, 1
  %shl40.mask = and i32 %a.0, 2147483647
  %cmp41 = icmp eq i32 %shl40.mask, 0
  %and44 = and i32 %inc, -2
  %and44.inc = select i1 %cmp41, i32 %and44, i32 %inc
  br label %if.end.63

if.then.50:                                       ; preds = %if.end.18
  %shr.i.261 = lshr i32 %a.1, 31
  %cmp54 = icmp eq i32 %3, 2
  %conv = zext i1 %cmp54 to i32
  %tobool55 = icmp eq i32 %shr.i.261, %conv
  br i1 %tobool55, label %if.end.63, label %if.then.56

if.then.56:                                       ; preds = %if.then.50
  %add.i.260 = add i32 %sub20, %a.0
  %cmp.i = icmp ult i32 %add.i.260, %a.0
  %conv.i = zext i1 %cmp.i to i32
  %add2.i = add i32 %conv.i, %a.1
  br label %if.end.63

if.end.63:                                        ; preds = %if.then.37, %if.end.18, %if.then.50, %if.then.56, %if.then.31, %if.then.24, %if.else
  %z.sroa.15.0 = phi i32 [ %a.1, %if.then.50 ], [ %add2.i, %if.then.56 ], [ %a.1, %if.end.18 ], [ %add2.i.265, %if.then.31 ], [ %add2.i.265, %if.then.24 ], [ %a.1, %if.else ], [ %and44.inc, %if.then.37 ]
  %z.sroa.0.0 = phi i32 [ %a.0, %if.then.50 ], [ %add.i.260, %if.then.56 ], [ %a.0, %if.end.18 ], [ %and33, %if.then.31 ], [ %add.i.262, %if.then.24 ], [ %a.0, %if.else ], [ %a.0, %if.then.37 ]
  %neg64 = sub i32 0, %shl19
  %and66 = and i32 %z.sroa.0.0, %neg64
  br label %if.end.157

if.else.67:                                       ; preds = %entry
  %cmp68 = icmp ult i32 %and.i, 1023
  br i1 %cmp68, label %if.then.70, label %if.end.109

if.then.70:                                       ; preds = %if.else.67
  %shl72 = shl i32 %a.1, 1
  %or74 = or i32 %shl72, %a.0
  %cmp75 = icmp eq i32 %or74, 0
  br i1 %cmp75, label %cleanup, label %if.end.78

if.end.78:                                        ; preds = %if.then.70
  %4 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or79 = or i32 %4, 1
  store i32 %or79, i32* @float_exception_flags, align 4, !tbaa !1
  %shr.i.259 = lshr i32 %a.1, 31
  %5 = load i32, i32* @float_rounding_mode, align 4, !tbaa !1
  switch i32 %5, label %sw.epilog [
    i32 0, label %sw.bb
    i32 3, label %sw.bb.97
    i32 2, label %sw.bb.101
  ]

sw.bb:                                            ; preds = %if.end.78
  %cmp83 = icmp eq i32 %and.i, 1022
  br i1 %cmp83, label %land.lhs.true.85, label %sw.epilog

land.lhs.true.85:                                 ; preds = %sw.bb
  %and.i.258 = and i32 %a.1, 1048575
  %or92 = or i32 %and.i.258, %a.0
  %tobool93 = icmp eq i32 %or92, 0
  br i1 %tobool93, label %sw.epilog, label %if.then.94

if.then.94:                                       ; preds = %land.lhs.true.85
  %shl.i.255 = shl nuw i32 %shr.i.259, 31
  %add.i = or i32 %shl.i.255, 1072693248
  br label %cleanup

sw.bb.97:                                         ; preds = %if.end.78
  %tobool98 = icmp eq i32 %shr.i.259, 0
  %retval.sroa.11.0.extract.trunc244 = select i1 %tobool98, i32 0, i32 -1074790400
  br label %cleanup

sw.bb.101:                                        ; preds = %if.end.78
  %tobool102 = icmp eq i32 %shr.i.259, 0
  %retval.sroa.11.0.extract.trunc248 = select i1 %tobool102, i32 1072693248, i32 -2147483648
  br label %cleanup

sw.epilog:                                        ; preds = %land.lhs.true.85, %sw.bb, %if.end.78
  %shl.i = shl nuw i32 %shr.i.259, 31
  br label %cleanup

if.end.109:                                       ; preds = %if.else.67
  %sub110 = sub nsw i32 1043, %and.i
  %shl111 = shl i32 1, %sub110
  %sub112 = add i32 %shl111, -1
  %6 = load i32, i32* @float_rounding_mode, align 4, !tbaa !1
  switch i32 %6, label %if.then.135 [
    i32 0, label %if.then.118
    i32 1, label %if.end.153
  ]

if.then.118:                                      ; preds = %if.end.109
  %shr119 = lshr i32 %shl111, 1
  %add = add i32 %shr119, %a.1
  %and122 = and i32 %add, %sub112
  %or124 = or i32 %and122, %a.0
  %cmp125 = icmp eq i32 %or124, 0
  br i1 %cmp125, label %if.then.127, label %if.end.153

if.then.127:                                      ; preds = %if.then.118
  %neg128 = xor i32 %shl111, -1
  %and130 = and i32 %add, %neg128
  br label %if.end.153

if.then.135:                                      ; preds = %if.end.109
  %shr.i.254 = lshr i32 %a.1, 31
  %cmp139 = icmp eq i32 %6, 2
  %conv140 = zext i1 %cmp139 to i32
  %tobool142 = icmp eq i32 %shr.i.254, %conv140
  br i1 %tobool142, label %if.end.153, label %if.then.143

if.then.143:                                      ; preds = %if.then.135
  %cmp145 = icmp ne i32 %a.0, 0
  %conv146 = zext i1 %cmp145 to i32
  %or148 = or i32 %conv146, %a.1
  %add150 = add i32 %sub112, %or148
  br label %if.end.153

if.end.153:                                       ; preds = %if.end.109, %if.then.135, %if.then.143, %if.then.118, %if.then.127
  %z.sroa.15.1 = phi i32 [ %a.1, %if.then.135 ], [ %add150, %if.then.143 ], [ %a.1, %if.end.109 ], [ %and130, %if.then.127 ], [ %add, %if.then.118 ]
  %neg154 = sub i32 0, %shl111
  %and156 = and i32 %z.sroa.15.1, %neg154
  br label %if.end.157

if.end.157:                                       ; preds = %if.end.153, %if.end.63
  %z.sroa.15.2 = phi i32 [ %z.sroa.15.0, %if.end.63 ], [ %and156, %if.end.153 ]
  %z.sroa.0.1 = phi i32 [ %and66, %if.end.63 ], [ 0, %if.end.153 ]
  %cmp160 = icmp eq i32 %z.sroa.0.1, %a.0
  %cmp164 = icmp eq i32 %z.sroa.15.2, %a.1
  %or.cond = and i1 %cmp164, %cmp160
  br i1 %or.cond, label %cleanup, label %if.then.166

if.then.166:                                      ; preds = %if.end.157
  %7 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or167 = or i32 %7, 1
  store i32 %or167, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

cleanup:                                          ; preds = %if.then.i, %float64_is_signaling_nan.exit.i, %if.end.157, %if.then.166, %if.then.70, %if.then.4, %land.lhs.true, %sw.epilog, %sw.bb.101, %sw.bb.97, %if.then.94
  %retval.sroa.0.2 = phi i32 [ 0, %sw.epilog ], [ 0, %sw.bb.101 ], [ 0, %sw.bb.97 ], [ 0, %if.then.94 ], [ %a.0, %land.lhs.true ], [ %a.0, %if.then.4 ], [ %a.0, %if.then.70 ], [ %z.sroa.0.1, %if.then.166 ], [ %a.0, %if.end.157 ], [ %a.0, %float64_is_signaling_nan.exit.i ], [ %a.0, %if.then.i ]
  %retval.sroa.11.2 = phi i32 [ %shl.i, %sw.epilog ], [ %retval.sroa.11.0.extract.trunc248, %sw.bb.101 ], [ %retval.sroa.11.0.extract.trunc244, %sw.bb.97 ], [ %add.i, %if.then.94 ], [ %a.1, %land.lhs.true ], [ %a.1, %if.then.4 ], [ %a.1, %if.then.70 ], [ %z.sroa.15.2, %if.then.166 ], [ %a.1, %if.end.157 ], [ %or.i, %float64_is_signaling_nan.exit.i ], [ %or1772.i, %if.then.i ]
  %retval.sroa.11.0.insert.ext = zext i32 %retval.sroa.11.2 to i64
  %retval.sroa.11.0.insert.shift = shl nuw i64 %retval.sroa.11.0.insert.ext, 32
  %retval.sroa.0.0.insert.ext = zext i32 %retval.sroa.0.2 to i64
  %retval.sroa.0.0.insert.insert = or i64 %retval.sroa.11.0.insert.shift, %retval.sroa.0.0.insert.ext
  ret i64 %retval.sroa.0.0.insert.insert
}

; Function Attrs: nounwind
define i64 @float64_add(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #2 {
entry:
  %shr.i = lshr i32 %a.1, 31
  %shr.i.27 = lshr i32 %b.1, 31
  %cmp = icmp eq i32 %shr.i, %shr.i.27
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call13 = tail call fastcc i64 @addFloat64Sigs(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1, i32 %shr.i)
  br label %cleanup

if.else:                                          ; preds = %entry
  %call18 = tail call fastcc i64 @subFloat64Sigs(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1, i32 %shr.i)
  br label %cleanup

cleanup:                                          ; preds = %if.else, %if.then
  %retval.sroa.0.0 = phi i64 [ %call13, %if.then ], [ %call18, %if.else ]
  ret i64 %retval.sroa.0.0
}

; Function Attrs: nounwind
define internal fastcc i64 @addFloat64Sigs(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1, i32 %zSign) #2 {
entry:
  %and.i = and i32 %a.1, 1048575
  %shr.i.316 = lshr i32 %a.1, 20
  %and.i.317 = and i32 %shr.i.316, 2047
  %and.i.315 = and i32 %b.1, 1048575
  %shr.i.313 = lshr i32 %b.1, 20
  %and.i.314 = and i32 %shr.i.313, 2047
  %sub = sub nsw i32 %and.i.317, %and.i.314
  %cmp = icmp sgt i32 %sub, 0
  br i1 %cmp, label %if.then, label %if.else.34

if.then:                                          ; preds = %entry
  %cmp21 = icmp eq i32 %and.i.317, 2047
  br i1 %cmp21, label %if.then.22, label %if.end.29

if.then.22:                                       ; preds = %if.then
  %or = or i32 %and.i, %a.0
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %cleanup, label %if.then.23

if.then.23:                                       ; preds = %if.then.22
  %and.i.56.i.265 = and i32 %a.1, 2146959360
  %cmp.i.57.i.266 = icmp eq i32 %and.i.56.i.265, 2146435072
  br i1 %cmp.i.57.i.266, label %land.rhs.i.59.i.268, label %float64_is_signaling_nan.exit64.i.274

land.rhs.i.59.i.268:                              ; preds = %if.then.23
  %tobool.i.58.i.267 = icmp eq i32 %a.0, 0
  br i1 %tobool.i.58.i.267, label %lor.rhs.i.62.i.271, label %float64_is_signaling_nan.exit64.i.274

lor.rhs.i.62.i.271:                               ; preds = %land.rhs.i.59.i.268
  %and4.i.60.i.269 = and i32 %a.1, 524287
  %tobool5.i.61.i.270 = icmp ne i32 %and4.i.60.i.269, 0
  br label %float64_is_signaling_nan.exit64.i.274

float64_is_signaling_nan.exit64.i.274:            ; preds = %lor.rhs.i.62.i.271, %land.rhs.i.59.i.268, %if.then.23
  %0 = phi i1 [ false, %if.then.23 ], [ true, %land.rhs.i.59.i.268 ], [ %tobool5.i.61.i.270, %lor.rhs.i.62.i.271 ]
  %shl.i.i.272 = shl i32 %b.1, 1
  %cmp.i.50.i.273 = icmp ugt i32 %shl.i.i.272, -2097153
  %1 = or i32 %and.i.315, %b.0
  %2 = icmp ne i32 %1, 0
  %3 = and i1 %cmp.i.50.i.273, %2
  %and.i.i.280 = and i32 %b.1, 2146959360
  %cmp.i.i.281 = icmp eq i32 %and.i.i.280, 2146435072
  br i1 %cmp.i.i.281, label %land.rhs.i.i.284, label %float64_is_signaling_nan.exit.i.294

land.rhs.i.i.284:                                 ; preds = %float64_is_signaling_nan.exit64.i.274
  %tobool.i.i.283 = icmp eq i32 %b.0, 0
  br i1 %tobool.i.i.283, label %lor.rhs.i.i.290, label %float64_is_signaling_nan.exit.thread.i.287

float64_is_signaling_nan.exit.thread.i.287:       ; preds = %land.rhs.i.i.284
  %or.66.i.285 = or i32 %a.1, 524288
  %or17.67.i.286 = or i32 %b.1, 524288
  br label %if.then.i.298

lor.rhs.i.i.290:                                  ; preds = %land.rhs.i.i.284
  %and4.i.i.288 = and i32 %b.1, 524287
  %tobool5.i.i.289 = icmp ne i32 %and4.i.i.288, 0
  br label %float64_is_signaling_nan.exit.i.294

float64_is_signaling_nan.exit.i.294:              ; preds = %lor.rhs.i.i.290, %float64_is_signaling_nan.exit64.i.274
  %4 = phi i1 [ false, %float64_is_signaling_nan.exit64.i.274 ], [ %tobool5.i.i.289, %lor.rhs.i.i.290 ]
  %or.i.291 = or i32 %a.1, 524288
  %or17.i.292 = or i32 %b.1, 524288
  %or1865.i.293 = or i1 %0, %4
  br i1 %or1865.i.293, label %if.then.i.298, label %propagateFloat64NaN.exit312

if.then.i.298:                                    ; preds = %float64_is_signaling_nan.exit.i.294, %float64_is_signaling_nan.exit.thread.i.287
  %or1772.i.295 = phi i32 [ %or17.67.i.286, %float64_is_signaling_nan.exit.thread.i.287 ], [ %or17.i.292, %float64_is_signaling_nan.exit.i.294 ]
  %or70.i.296 = phi i32 [ %or.66.i.285, %float64_is_signaling_nan.exit.thread.i.287 ], [ %or.i.291, %float64_is_signaling_nan.exit.i.294 ]
  %5 = phi i1 [ true, %float64_is_signaling_nan.exit.thread.i.287 ], [ %4, %float64_is_signaling_nan.exit.i.294 ]
  %6 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.297 = or i32 %6, 16
  store i32 %or.i.i.297, i32* @float_exception_flags, align 4, !tbaa !1
  br label %propagateFloat64NaN.exit312

propagateFloat64NaN.exit312:                      ; preds = %float64_is_signaling_nan.exit.i.294, %if.then.i.298
  %or186573.i.299 = phi i1 [ false, %float64_is_signaling_nan.exit.i.294 ], [ true, %if.then.i.298 ]
  %or1771.i.300 = phi i32 [ %or17.i.292, %float64_is_signaling_nan.exit.i.294 ], [ %or1772.i.295, %if.then.i.298 ]
  %or69.i.301 = phi i32 [ %or.i.291, %float64_is_signaling_nan.exit.i.294 ], [ %or70.i.296, %if.then.i.298 ]
  %7 = phi i1 [ false, %float64_is_signaling_nan.exit.i.294 ], [ %5, %if.then.i.298 ]
  %b.0.mux.i.302 = select i1 %7, i32 %b.0, i32 %a.0
  %or17.mux.i.303 = select i1 %7, i32 %or1771.i.300, i32 %or69.i.301
  %a.0.b.0.i.304 = select i1 %3, i32 %b.0, i32 %a.0
  %or.or17.i.305 = select i1 %3, i32 %or1771.i.300, i32 %or69.i.301
  %retval.sroa.0.0.i.306 = select i1 %or186573.i.299, i32 %b.0.mux.i.302, i32 %a.0.b.0.i.304
  %retval.sroa.5.0.i.307 = select i1 %or186573.i.299, i32 %or17.mux.i.303, i32 %or.or17.i.305
  br label %cleanup

if.end.29:                                        ; preds = %if.then
  %cmp30 = icmp eq i32 %and.i.314, 0
  br i1 %cmp30, label %if.end.33, label %if.end.33.thread

if.end.33.thread:                                 ; preds = %if.end.29
  %or32 = or i32 %and.i.315, 1048576
  br label %if.else.i.233

if.end.33:                                        ; preds = %if.end.29
  %dec = add nsw i32 %sub, -1
  %cmp.i.231 = icmp eq i32 %dec, 0
  br i1 %cmp.i.231, label %if.end.77, label %if.else.i.233

if.else.i.233:                                    ; preds = %if.end.33.thread, %if.end.33
  %.pn = phi i32 [ 0, %if.end.33.thread ], [ 1, %if.end.33 ]
  %expDiff.0352 = phi i32 [ %sub, %if.end.33.thread ], [ %dec, %if.end.33 ]
  %bSig0.0351 = phi i32 [ %or32, %if.end.33.thread ], [ %and.i.315, %if.end.33 ]
  %and.i.230353.in = sub nsw i32 %.pn, %sub
  %and.i.230353 = and i32 %and.i.230353.in, 31
  %cmp1.i.232 = icmp slt i32 %expDiff.0352, 32
  br i1 %cmp1.i.232, label %if.then.2.i.239, label %if.else.5.i.241

if.then.2.i.239:                                  ; preds = %if.else.i.233
  %shl.i.234 = shl i32 %b.0, %and.i.230353
  %shl3.i.235 = shl i32 %bSig0.0351, %and.i.230353
  %shr.i.236 = lshr i32 %b.0, %expDiff.0352
  %or.i.237 = or i32 %shl3.i.235, %shr.i.236
  %shr4.i.238 = lshr i32 %bSig0.0351, %expDiff.0352
  br label %if.end.19.i.260

if.else.5.i.241:                                  ; preds = %if.else.i.233
  %cmp6.i.240 = icmp eq i32 %expDiff.0352, 32
  br i1 %cmp6.i.240, label %if.end.19.i.260, label %if.else.8.i.243

if.else.8.i.243:                                  ; preds = %if.else.5.i.241
  %cmp10.i.242 = icmp slt i32 %expDiff.0352, 64
  br i1 %cmp10.i.242, label %if.then.11.i.247, label %if.else.15.i.252

if.then.11.i.247:                                 ; preds = %if.else.8.i.243
  %shl12.i.244 = shl i32 %bSig0.0351, %and.i.230353
  %and13.i.245 = and i32 %expDiff.0352, 31
  %shr14.i.246 = lshr i32 %bSig0.0351, %and13.i.245
  br label %if.end.19.i.260

if.else.15.i.252:                                 ; preds = %if.else.8.i.243
  %cmp16.i.248 = icmp eq i32 %expDiff.0352, 64
  %cmp17.i.249 = icmp ne i32 %bSig0.0351, 0
  %conv.i.250 = zext i1 %cmp17.i.249 to i32
  %cond.i.251 = select i1 %cmp16.i.248, i32 %bSig0.0351, i32 %conv.i.250
  br label %if.end.19.i.260

if.end.19.i.260:                                  ; preds = %if.else.15.i.252, %if.then.11.i.247, %if.else.5.i.241, %if.then.2.i.239
  %z0.0.i.253 = phi i32 [ %shr4.i.238, %if.then.2.i.239 ], [ 0, %if.else.5.i.241 ], [ 0, %if.then.11.i.247 ], [ 0, %if.else.15.i.252 ]
  %z1.1.i.254 = phi i32 [ %or.i.237, %if.then.2.i.239 ], [ %bSig0.0351, %if.else.5.i.241 ], [ %shr14.i.246, %if.then.11.i.247 ], [ 0, %if.else.15.i.252 ]
  %z2.1.i.255 = phi i32 [ %shl.i.234, %if.then.2.i.239 ], [ %b.0, %if.else.5.i.241 ], [ %shl12.i.244, %if.then.11.i.247 ], [ %cond.i.251, %if.else.15.i.252 ]
  %a2.addr.1.i.256 = phi i32 [ 0, %if.then.2.i.239 ], [ 0, %if.else.5.i.241 ], [ %b.0, %if.then.11.i.247 ], [ %b.0, %if.else.15.i.252 ]
  %cmp20.i.257 = icmp ne i32 %a2.addr.1.i.256, 0
  %conv21.i.258 = zext i1 %cmp20.i.257 to i32
  %or22.i.259 = or i32 %conv21.i.258, %z2.1.i.255
  br label %if.end.77

if.else.34:                                       ; preds = %entry
  %cmp35 = icmp slt i32 %sub, 0
  br i1 %cmp35, label %if.then.36, label %if.else.56

if.then.36:                                       ; preds = %if.else.34
  %cmp37 = icmp eq i32 %and.i.314, 2047
  br i1 %cmp37, label %if.then.38, label %if.end.49

if.then.38:                                       ; preds = %if.then.36
  %or39 = or i32 %and.i.315, %b.0
  %tobool40 = icmp eq i32 %or39, 0
  br i1 %tobool40, label %if.end.47, label %if.then.41

if.then.41:                                       ; preds = %if.then.38
  %and.i.56.i.182 = and i32 %a.1, 2146959360
  %cmp.i.57.i.183 = icmp eq i32 %and.i.56.i.182, 2146435072
  br i1 %cmp.i.57.i.183, label %land.rhs.i.59.i.185, label %float64_is_signaling_nan.exit64.i.191

land.rhs.i.59.i.185:                              ; preds = %if.then.41
  %tobool.i.58.i.184 = icmp eq i32 %a.0, 0
  br i1 %tobool.i.58.i.184, label %lor.rhs.i.62.i.188, label %float64_is_signaling_nan.exit64.i.191

lor.rhs.i.62.i.188:                               ; preds = %land.rhs.i.59.i.185
  %and4.i.60.i.186 = and i32 %a.1, 524287
  %tobool5.i.61.i.187 = icmp ne i32 %and4.i.60.i.186, 0
  br label %float64_is_signaling_nan.exit64.i.191

float64_is_signaling_nan.exit64.i.191:            ; preds = %lor.rhs.i.62.i.188, %land.rhs.i.59.i.185, %if.then.41
  %8 = phi i1 [ false, %if.then.41 ], [ true, %land.rhs.i.59.i.185 ], [ %tobool5.i.61.i.187, %lor.rhs.i.62.i.188 ]
  %shl.i.i.189 = shl i32 %b.1, 1
  %cmp.i.50.i.190 = icmp ugt i32 %shl.i.i.189, -2097153
  %and.i.i.197 = and i32 %b.1, 2146959360
  %cmp.i.i.198 = icmp eq i32 %and.i.i.197, 2146435072
  br i1 %cmp.i.i.198, label %land.rhs.i.i.201, label %float64_is_signaling_nan.exit.i.211

land.rhs.i.i.201:                                 ; preds = %float64_is_signaling_nan.exit64.i.191
  %tobool.i.i.200 = icmp eq i32 %b.0, 0
  br i1 %tobool.i.i.200, label %lor.rhs.i.i.207, label %float64_is_signaling_nan.exit.thread.i.204

float64_is_signaling_nan.exit.thread.i.204:       ; preds = %land.rhs.i.i.201
  %or.66.i.202 = or i32 %a.1, 524288
  %or17.67.i.203 = or i32 %b.1, 524288
  br label %if.then.i.215

lor.rhs.i.i.207:                                  ; preds = %land.rhs.i.i.201
  %and4.i.i.205 = and i32 %b.1, 524287
  %tobool5.i.i.206 = icmp ne i32 %and4.i.i.205, 0
  br label %float64_is_signaling_nan.exit.i.211

float64_is_signaling_nan.exit.i.211:              ; preds = %lor.rhs.i.i.207, %float64_is_signaling_nan.exit64.i.191
  %9 = phi i1 [ false, %float64_is_signaling_nan.exit64.i.191 ], [ %tobool5.i.i.206, %lor.rhs.i.i.207 ]
  %or.i.208 = or i32 %a.1, 524288
  %or17.i.209 = or i32 %b.1, 524288
  %or1865.i.210 = or i1 %8, %9
  br i1 %or1865.i.210, label %if.then.i.215, label %propagateFloat64NaN.exit229

if.then.i.215:                                    ; preds = %float64_is_signaling_nan.exit.i.211, %float64_is_signaling_nan.exit.thread.i.204
  %or1772.i.212 = phi i32 [ %or17.67.i.203, %float64_is_signaling_nan.exit.thread.i.204 ], [ %or17.i.209, %float64_is_signaling_nan.exit.i.211 ]
  %or70.i.213 = phi i32 [ %or.66.i.202, %float64_is_signaling_nan.exit.thread.i.204 ], [ %or.i.208, %float64_is_signaling_nan.exit.i.211 ]
  %10 = phi i1 [ true, %float64_is_signaling_nan.exit.thread.i.204 ], [ %9, %float64_is_signaling_nan.exit.i.211 ]
  %11 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.214 = or i32 %11, 16
  store i32 %or.i.i.214, i32* @float_exception_flags, align 4, !tbaa !1
  br label %propagateFloat64NaN.exit229

propagateFloat64NaN.exit229:                      ; preds = %float64_is_signaling_nan.exit.i.211, %if.then.i.215
  %or186573.i.216 = phi i1 [ false, %float64_is_signaling_nan.exit.i.211 ], [ true, %if.then.i.215 ]
  %or1771.i.217 = phi i32 [ %or17.i.209, %float64_is_signaling_nan.exit.i.211 ], [ %or1772.i.212, %if.then.i.215 ]
  %or69.i.218 = phi i32 [ %or.i.208, %float64_is_signaling_nan.exit.i.211 ], [ %or70.i.213, %if.then.i.215 ]
  %12 = phi i1 [ false, %float64_is_signaling_nan.exit.i.211 ], [ %10, %if.then.i.215 ]
  %b.0.mux.i.219 = select i1 %12, i32 %b.0, i32 %a.0
  %or17.mux.i.220 = select i1 %12, i32 %or1771.i.217, i32 %or69.i.218
  %a.0.b.0.i.221 = select i1 %cmp.i.50.i.190, i32 %b.0, i32 %a.0
  %or.or17.i.222 = select i1 %cmp.i.50.i.190, i32 %or1771.i.217, i32 %or69.i.218
  %retval.sroa.0.0.i.223 = select i1 %or186573.i.216, i32 %b.0.mux.i.219, i32 %a.0.b.0.i.221
  %retval.sroa.5.0.i.224 = select i1 %or186573.i.216, i32 %or17.mux.i.220, i32 %or.or17.i.222
  br label %cleanup

if.end.47:                                        ; preds = %if.then.38
  %shl.i.178 = shl i32 %zSign, 31
  %add.i.179 = or i32 %shl.i.178, 2146435072
  br label %cleanup

if.end.49:                                        ; preds = %if.then.36
  %cmp50 = icmp eq i32 %and.i.317, 0
  %or53 = or i32 %and.i, 1048576
  %aSig0.0 = select i1 %cmp50, i32 %and.i, i32 %or53
  %inc = zext i1 %cmp50 to i32
  %expDiff.1 = add nsw i32 %sub, %inc
  %sub55 = sub nsw i32 0, %expDiff.1
  %and.i.167 = and i32 %expDiff.1, 31
  %cmp.i.168 = icmp eq i32 %expDiff.1, 0
  br i1 %cmp.i.168, label %if.end.77, label %if.else.i

if.else.i:                                        ; preds = %if.end.49
  %cmp1.i = icmp sgt i32 %expDiff.1, -32
  br i1 %cmp1.i, label %if.then.2.i, label %if.else.5.i

if.then.2.i:                                      ; preds = %if.else.i
  %shl.i.169 = shl i32 %a.0, %and.i.167
  %shl3.i.170 = shl i32 %aSig0.0, %and.i.167
  %shr.i.171 = lshr i32 %a.0, %sub55
  %or.i.172 = or i32 %shl3.i.170, %shr.i.171
  %shr4.i.173 = lshr i32 %aSig0.0, %sub55
  br label %if.end.19.i

if.else.5.i:                                      ; preds = %if.else.i
  %cmp6.i = icmp eq i32 %sub55, 32
  br i1 %cmp6.i, label %if.end.19.i, label %if.else.8.i

if.else.8.i:                                      ; preds = %if.else.5.i
  %cmp10.i = icmp sgt i32 %expDiff.1, -64
  br i1 %cmp10.i, label %if.then.11.i, label %if.else.15.i

if.then.11.i:                                     ; preds = %if.else.8.i
  %shl12.i = shl i32 %aSig0.0, %and.i.167
  %and13.i = and i32 %sub55, 31
  %shr14.i = lshr i32 %aSig0.0, %and13.i
  br label %if.end.19.i

if.else.15.i:                                     ; preds = %if.else.8.i
  %cmp16.i = icmp eq i32 %sub55, 64
  %cmp17.i = icmp ne i32 %aSig0.0, 0
  %conv.i.174 = zext i1 %cmp17.i to i32
  %cond.i = select i1 %cmp16.i, i32 %aSig0.0, i32 %conv.i.174
  br label %if.end.19.i

if.end.19.i:                                      ; preds = %if.else.15.i, %if.then.11.i, %if.else.5.i, %if.then.2.i
  %z0.0.i = phi i32 [ %shr4.i.173, %if.then.2.i ], [ 0, %if.else.5.i ], [ 0, %if.then.11.i ], [ 0, %if.else.15.i ]
  %z1.1.i = phi i32 [ %or.i.172, %if.then.2.i ], [ %aSig0.0, %if.else.5.i ], [ %shr14.i, %if.then.11.i ], [ 0, %if.else.15.i ]
  %z2.1.i = phi i32 [ %shl.i.169, %if.then.2.i ], [ %a.0, %if.else.5.i ], [ %shl12.i, %if.then.11.i ], [ %cond.i, %if.else.15.i ]
  %a2.addr.1.i = phi i32 [ 0, %if.then.2.i ], [ 0, %if.else.5.i ], [ %a.0, %if.then.11.i ], [ %a.0, %if.else.15.i ]
  %cmp20.i.175 = icmp ne i32 %a2.addr.1.i, 0
  %conv21.i.176 = zext i1 %cmp20.i.175 to i32
  %or22.i.177 = or i32 %conv21.i.176, %z2.1.i
  br label %if.end.77

if.else.56:                                       ; preds = %if.else.34
  %cmp57 = icmp eq i32 %and.i.317, 2047
  br i1 %cmp57, label %if.then.58, label %if.end.70

if.then.58:                                       ; preds = %if.else.56
  %or59 = or i32 %and.i, %a.0
  %or60 = or i32 %or59, %b.0
  %or61 = or i32 %or60, %and.i.315
  %tobool62 = icmp eq i32 %or61, 0
  br i1 %tobool62, label %cleanup, label %if.then.63

if.then.63:                                       ; preds = %if.then.58
  %and.i.56.i = and i32 %a.1, 2146959360
  %cmp.i.57.i = icmp eq i32 %and.i.56.i, 2146435072
  br i1 %cmp.i.57.i, label %land.rhs.i.59.i, label %float64_is_signaling_nan.exit64.i

land.rhs.i.59.i:                                  ; preds = %if.then.63
  %tobool.i.58.i = icmp eq i32 %a.0, 0
  br i1 %tobool.i.58.i, label %lor.rhs.i.62.i, label %float64_is_signaling_nan.exit64.i

lor.rhs.i.62.i:                                   ; preds = %land.rhs.i.59.i
  %and4.i.60.i = and i32 %a.1, 524287
  %tobool5.i.61.i = icmp ne i32 %and4.i.60.i, 0
  br label %float64_is_signaling_nan.exit64.i

float64_is_signaling_nan.exit64.i:                ; preds = %lor.rhs.i.62.i, %land.rhs.i.59.i, %if.then.63
  %13 = phi i1 [ false, %if.then.63 ], [ true, %land.rhs.i.59.i ], [ %tobool5.i.61.i, %lor.rhs.i.62.i ]
  %shl.i.i = shl i32 %b.1, 1
  %cmp.i.50.i = icmp ugt i32 %shl.i.i, -2097153
  %14 = or i32 %and.i.315, %b.0
  %15 = icmp ne i32 %14, 0
  %16 = and i1 %cmp.i.50.i, %15
  %and.i.i = and i32 %b.1, 2146959360
  %cmp.i.i = icmp eq i32 %and.i.i, 2146435072
  br i1 %cmp.i.i, label %land.rhs.i.i, label %float64_is_signaling_nan.exit.i

land.rhs.i.i:                                     ; preds = %float64_is_signaling_nan.exit64.i
  %tobool.i.i = icmp eq i32 %b.0, 0
  br i1 %tobool.i.i, label %lor.rhs.i.i, label %float64_is_signaling_nan.exit.thread.i

float64_is_signaling_nan.exit.thread.i:           ; preds = %land.rhs.i.i
  %or.66.i = or i32 %a.1, 524288
  %or17.67.i = or i32 %b.1, 524288
  br label %if.then.i

lor.rhs.i.i:                                      ; preds = %land.rhs.i.i
  %and4.i.i = and i32 %b.1, 524287
  %tobool5.i.i = icmp ne i32 %and4.i.i, 0
  br label %float64_is_signaling_nan.exit.i

float64_is_signaling_nan.exit.i:                  ; preds = %lor.rhs.i.i, %float64_is_signaling_nan.exit64.i
  %17 = phi i1 [ false, %float64_is_signaling_nan.exit64.i ], [ %tobool5.i.i, %lor.rhs.i.i ]
  %or.i.164 = or i32 %a.1, 524288
  %or17.i = or i32 %b.1, 524288
  %or1865.i = or i1 %13, %17
  br i1 %or1865.i, label %if.then.i, label %propagateFloat64NaN.exit

if.then.i:                                        ; preds = %float64_is_signaling_nan.exit.i, %float64_is_signaling_nan.exit.thread.i
  %or1772.i = phi i32 [ %or17.67.i, %float64_is_signaling_nan.exit.thread.i ], [ %or17.i, %float64_is_signaling_nan.exit.i ]
  %or70.i = phi i32 [ %or.66.i, %float64_is_signaling_nan.exit.thread.i ], [ %or.i.164, %float64_is_signaling_nan.exit.i ]
  %18 = phi i1 [ true, %float64_is_signaling_nan.exit.thread.i ], [ %17, %float64_is_signaling_nan.exit.i ]
  %19 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i = or i32 %19, 16
  store i32 %or.i.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %propagateFloat64NaN.exit

propagateFloat64NaN.exit:                         ; preds = %float64_is_signaling_nan.exit.i, %if.then.i
  %or186573.i = phi i1 [ false, %float64_is_signaling_nan.exit.i ], [ true, %if.then.i ]
  %or1771.i = phi i32 [ %or17.i, %float64_is_signaling_nan.exit.i ], [ %or1772.i, %if.then.i ]
  %or69.i = phi i32 [ %or.i.164, %float64_is_signaling_nan.exit.i ], [ %or70.i, %if.then.i ]
  %20 = phi i1 [ false, %float64_is_signaling_nan.exit.i ], [ %18, %if.then.i ]
  %b.0.mux.i = select i1 %20, i32 %b.0, i32 %a.0
  %or17.mux.i = select i1 %20, i32 %or1771.i, i32 %or69.i
  %a.0.b.0.i = select i1 %16, i32 %b.0, i32 %a.0
  %or.or17.i = select i1 %16, i32 %or1771.i, i32 %or69.i
  %retval.sroa.0.0.i = select i1 %or186573.i, i32 %b.0.mux.i, i32 %a.0.b.0.i
  %retval.sroa.5.0.i = select i1 %or186573.i, i32 %or17.mux.i, i32 %or.or17.i
  br label %cleanup

if.end.70:                                        ; preds = %if.else.56
  %add.i.159 = add i32 %b.0, %a.0
  %add1.i.160 = add nuw nsw i32 %and.i.315, %and.i
  %cmp.i.161 = icmp ult i32 %add.i.159, %a.0
  %conv.i.162 = zext i1 %cmp.i.161 to i32
  %add2.i.163 = add nuw nsw i32 %add1.i.160, %conv.i.162
  %cmp71 = icmp eq i32 %and.i.317, 0
  br i1 %cmp71, label %if.then.72, label %if.end.74

if.then.72:                                       ; preds = %if.end.70
  %shl.i.157 = shl i32 %zSign, 31
  %add2.i.158 = or i32 %add2.i.163, %shl.i.157
  br label %cleanup

if.end.74:                                        ; preds = %if.end.70
  %or75 = or i32 %add2.i.163, 2097152
  br label %shiftRight1

if.end.77:                                        ; preds = %if.end.19.i, %if.end.49, %if.end.19.i.260, %if.end.33
  %aSig0.1 = phi i32 [ %and.i, %if.end.33 ], [ %and.i, %if.end.19.i.260 ], [ %z0.0.i, %if.end.19.i ], [ %aSig0.0, %if.end.49 ]
  %aSig1.0 = phi i32 [ %a.0, %if.end.33 ], [ %a.0, %if.end.19.i.260 ], [ %z1.1.i, %if.end.19.i ], [ %a.0, %if.end.49 ]
  %bSig0.1 = phi i32 [ %and.i.315, %if.end.33 ], [ %z0.0.i.253, %if.end.19.i.260 ], [ %and.i.315, %if.end.19.i ], [ %and.i.315, %if.end.49 ]
  %bSig1.0 = phi i32 [ %b.0, %if.end.33 ], [ %z1.1.i.254, %if.end.19.i.260 ], [ %b.0, %if.end.19.i ], [ %b.0, %if.end.49 ]
  %zSig2.0 = phi i32 [ 0, %if.end.33 ], [ %or22.i.259, %if.end.19.i.260 ], [ %or22.i.177, %if.end.19.i ], [ 0, %if.end.49 ]
  %zExp.0 = phi i32 [ %and.i.317, %if.end.33 ], [ %and.i.317, %if.end.19.i.260 ], [ %and.i.314, %if.end.19.i ], [ %and.i.314, %if.end.49 ]
  %or78 = or i32 %aSig0.1, 1048576
  %add.i = add i32 %bSig1.0, %aSig1.0
  %add1.i = add i32 %bSig0.1, %or78
  %cmp.i = icmp ult i32 %add.i, %aSig1.0
  %conv.i = zext i1 %cmp.i to i32
  %add2.i = add i32 %add1.i, %conv.i
  %dec79 = add nsw i32 %zExp.0, -1
  %cmp80 = icmp ult i32 %add2.i, 2097152
  br i1 %cmp80, label %roundAndPack, label %shiftRight1

shiftRight1:                                      ; preds = %if.end.77, %if.end.74
  %zSig0.0 = phi i32 [ %add2.i, %if.end.77 ], [ %or75, %if.end.74 ]
  %zSig1.0 = phi i32 [ %add.i, %if.end.77 ], [ %add.i.159, %if.end.74 ]
  %zSig2.1 = phi i32 [ %zSig2.0, %if.end.77 ], [ 0, %if.end.74 ]
  %zExp.1 = phi i32 [ %zExp.0, %if.end.77 ], [ %and.i.317, %if.end.74 ]
  %shl.i = shl i32 %zSig1.0, 31
  %shl3.i = shl i32 %zSig0.0, 31
  %shr.i = lshr i32 %zSig1.0, 1
  %or.i = or i32 %shr.i, %shl3.i
  %shr4.i = lshr i32 %zSig0.0, 1
  %cmp20.i = icmp ne i32 %zSig2.1, 0
  %conv21.i = zext i1 %cmp20.i to i32
  %or22.i = or i32 %conv21.i, %shl.i
  br label %roundAndPack

roundAndPack:                                     ; preds = %if.end.77, %shiftRight1
  %zSig0.1 = phi i32 [ %add2.i, %if.end.77 ], [ %shr4.i, %shiftRight1 ]
  %zSig1.1 = phi i32 [ %add.i, %if.end.77 ], [ %or.i, %shiftRight1 ]
  %zSig2.2 = phi i32 [ %zSig2.0, %if.end.77 ], [ %or22.i, %shiftRight1 ]
  %zExp.2 = phi i32 [ %dec79, %if.end.77 ], [ %zExp.1, %shiftRight1 ]
  %call84 = tail call fastcc i64 @roundAndPackFloat64(i32 %zSign, i32 %zExp.2, i32 %zSig0.1, i32 %zSig1.1, i32 %zSig2.2)
  %retval.sroa.0.0.extract.trunc146 = trunc i64 %call84 to i32
  %retval.sroa.9.0.extract.shift155 = lshr i64 %call84, 32
  %retval.sroa.9.0.extract.trunc156 = trunc i64 %retval.sroa.9.0.extract.shift155 to i32
  br label %cleanup

cleanup:                                          ; preds = %if.then.58, %if.then.22, %roundAndPack, %if.then.72, %propagateFloat64NaN.exit, %if.end.47, %propagateFloat64NaN.exit229, %propagateFloat64NaN.exit312
  %retval.sroa.0.0 = phi i32 [ %retval.sroa.0.0.i.306, %propagateFloat64NaN.exit312 ], [ %retval.sroa.0.0.extract.trunc146, %roundAndPack ], [ %retval.sroa.0.0.i.223, %propagateFloat64NaN.exit229 ], [ 0, %if.end.47 ], [ %retval.sroa.0.0.i, %propagateFloat64NaN.exit ], [ %add.i.159, %if.then.72 ], [ %a.0, %if.then.22 ], [ %a.0, %if.then.58 ]
  %retval.sroa.9.0 = phi i32 [ %retval.sroa.5.0.i.307, %propagateFloat64NaN.exit312 ], [ %retval.sroa.9.0.extract.trunc156, %roundAndPack ], [ %retval.sroa.5.0.i.224, %propagateFloat64NaN.exit229 ], [ %add.i.179, %if.end.47 ], [ %retval.sroa.5.0.i, %propagateFloat64NaN.exit ], [ %add2.i.158, %if.then.72 ], [ %a.1, %if.then.22 ], [ %a.1, %if.then.58 ]
  %retval.sroa.9.0.insert.ext = zext i32 %retval.sroa.9.0 to i64
  %retval.sroa.9.0.insert.shift = shl nuw i64 %retval.sroa.9.0.insert.ext, 32
  %retval.sroa.0.0.insert.ext = zext i32 %retval.sroa.0.0 to i64
  %retval.sroa.0.0.insert.insert = or i64 %retval.sroa.9.0.insert.shift, %retval.sroa.0.0.insert.ext
  ret i64 %retval.sroa.0.0.insert.insert
}

; Function Attrs: nounwind
define internal fastcc i64 @subFloat64Sigs(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1, i32 %zSign) #2 {
entry:
  %shr.i.325 = lshr i32 %a.1, 20
  %and.i.326 = and i32 %shr.i.325, 2047
  %and.i.324 = and i32 %b.1, 1048575
  %shr.i.322 = lshr i32 %b.1, 20
  %and.i.323 = and i32 %shr.i.322, 2047
  %sub = sub nsw i32 %and.i.326, %and.i.323
  %shl.i.318 = shl i32 %a.0, 10
  %and.i = shl i32 %a.1, 10
  %shl1.i.319 = and i32 %and.i, 1073740800
  %shr.i.320 = lshr i32 %a.0, 22
  %or.i.321 = or i32 %shl1.i.319, %shr.i.320
  %shl.i.315 = shl i32 %b.0, 10
  %shl1.i = shl nuw nsw i32 %and.i.324, 10
  %shr.i.316 = lshr i32 %b.0, 22
  %or.i.317 = or i32 %shl1.i, %shr.i.316
  %cmp = icmp sgt i32 %sub, 0
  br i1 %cmp, label %aExpBigger, label %if.end

if.end:                                           ; preds = %entry
  %cmp21 = icmp slt i32 %sub, 0
  br i1 %cmp21, label %bExpBigger, label %if.end.23

if.end.23:                                        ; preds = %if.end
  switch i32 %and.i.326, label %if.end.40 [
    i32 2047, label %if.then.25
    i32 0, label %if.then.39
  ]

if.then.25:                                       ; preds = %if.end.23
  %or = or i32 %shl.i.315, %shl.i.318
  %or26 = or i32 %or, %or.i.321
  %or27 = or i32 %or26, %or.i.317
  %tobool = icmp eq i32 %or27, 0
  br i1 %tobool, label %if.end.34, label %if.then.28

if.then.28:                                       ; preds = %if.then.25
  %and.i.56.i.267 = and i32 %a.1, 2146959360
  %cmp.i.57.i.268 = icmp eq i32 %and.i.56.i.267, 2146435072
  br i1 %cmp.i.57.i.268, label %land.rhs.i.59.i.270, label %float64_is_signaling_nan.exit64.i.276

land.rhs.i.59.i.270:                              ; preds = %if.then.28
  %tobool.i.58.i.269 = icmp eq i32 %a.0, 0
  br i1 %tobool.i.58.i.269, label %lor.rhs.i.62.i.273, label %float64_is_signaling_nan.exit64.i.276

lor.rhs.i.62.i.273:                               ; preds = %land.rhs.i.59.i.270
  %and4.i.60.i.271 = and i32 %a.1, 524287
  %tobool5.i.61.i.272 = icmp ne i32 %and4.i.60.i.271, 0
  br label %float64_is_signaling_nan.exit64.i.276

float64_is_signaling_nan.exit64.i.276:            ; preds = %lor.rhs.i.62.i.273, %land.rhs.i.59.i.270, %if.then.28
  %0 = phi i1 [ false, %if.then.28 ], [ true, %land.rhs.i.59.i.270 ], [ %tobool5.i.61.i.272, %lor.rhs.i.62.i.273 ]
  %shl.i.i.274 = shl i32 %b.1, 1
  %cmp.i.50.i.275 = icmp ugt i32 %shl.i.i.274, -2097153
  %1 = or i32 %and.i.324, %b.0
  %2 = icmp ne i32 %1, 0
  %3 = and i1 %cmp.i.50.i.275, %2
  %and.i.i.282 = and i32 %b.1, 2146959360
  %cmp.i.i.283 = icmp eq i32 %and.i.i.282, 2146435072
  br i1 %cmp.i.i.283, label %land.rhs.i.i.286, label %float64_is_signaling_nan.exit.i.296

land.rhs.i.i.286:                                 ; preds = %float64_is_signaling_nan.exit64.i.276
  %tobool.i.i.285 = icmp eq i32 %b.0, 0
  br i1 %tobool.i.i.285, label %lor.rhs.i.i.292, label %float64_is_signaling_nan.exit.thread.i.289

float64_is_signaling_nan.exit.thread.i.289:       ; preds = %land.rhs.i.i.286
  %or.66.i.287 = or i32 %a.1, 524288
  %or17.67.i.288 = or i32 %b.1, 524288
  br label %if.then.i.300

lor.rhs.i.i.292:                                  ; preds = %land.rhs.i.i.286
  %and4.i.i.290 = and i32 %b.1, 524287
  %tobool5.i.i.291 = icmp ne i32 %and4.i.i.290, 0
  br label %float64_is_signaling_nan.exit.i.296

float64_is_signaling_nan.exit.i.296:              ; preds = %lor.rhs.i.i.292, %float64_is_signaling_nan.exit64.i.276
  %4 = phi i1 [ false, %float64_is_signaling_nan.exit64.i.276 ], [ %tobool5.i.i.291, %lor.rhs.i.i.292 ]
  %or.i.293 = or i32 %a.1, 524288
  %or17.i.294 = or i32 %b.1, 524288
  %or1865.i.295 = or i1 %0, %4
  br i1 %or1865.i.295, label %if.then.i.300, label %propagateFloat64NaN.exit314

if.then.i.300:                                    ; preds = %float64_is_signaling_nan.exit.i.296, %float64_is_signaling_nan.exit.thread.i.289
  %or1772.i.297 = phi i32 [ %or17.67.i.288, %float64_is_signaling_nan.exit.thread.i.289 ], [ %or17.i.294, %float64_is_signaling_nan.exit.i.296 ]
  %or70.i.298 = phi i32 [ %or.66.i.287, %float64_is_signaling_nan.exit.thread.i.289 ], [ %or.i.293, %float64_is_signaling_nan.exit.i.296 ]
  %5 = phi i1 [ true, %float64_is_signaling_nan.exit.thread.i.289 ], [ %4, %float64_is_signaling_nan.exit.i.296 ]
  %6 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.299 = or i32 %6, 16
  store i32 %or.i.i.299, i32* @float_exception_flags, align 4, !tbaa !1
  br label %propagateFloat64NaN.exit314

propagateFloat64NaN.exit314:                      ; preds = %float64_is_signaling_nan.exit.i.296, %if.then.i.300
  %or186573.i.301 = phi i1 [ false, %float64_is_signaling_nan.exit.i.296 ], [ true, %if.then.i.300 ]
  %or1771.i.302 = phi i32 [ %or17.i.294, %float64_is_signaling_nan.exit.i.296 ], [ %or1772.i.297, %if.then.i.300 ]
  %or69.i.303 = phi i32 [ %or.i.293, %float64_is_signaling_nan.exit.i.296 ], [ %or70.i.298, %if.then.i.300 ]
  %7 = phi i1 [ false, %float64_is_signaling_nan.exit.i.296 ], [ %5, %if.then.i.300 ]
  %b.0.mux.i.304 = select i1 %7, i32 %b.0, i32 %a.0
  %or17.mux.i.305 = select i1 %7, i32 %or1771.i.302, i32 %or69.i.303
  %a.0.b.0.i.306 = select i1 %3, i32 %b.0, i32 %a.0
  %or.or17.i.307 = select i1 %3, i32 %or1771.i.302, i32 %or69.i.303
  %retval.sroa.0.0.i.308 = select i1 %or186573.i.301, i32 %b.0.mux.i.304, i32 %a.0.b.0.i.306
  %retval.sroa.5.0.i.309 = select i1 %or186573.i.301, i32 %or17.mux.i.305, i32 %or.or17.i.307
  br label %cleanup

if.end.34:                                        ; preds = %if.then.25
  %8 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.266 = or i32 %8, 16
  store i32 %or.i.266, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.then.39:                                       ; preds = %if.end.23
  br label %if.end.40

if.end.40:                                        ; preds = %if.end.23, %if.then.39
  %aExp.0 = phi i32 [ 1, %if.then.39 ], [ %and.i.326, %if.end.23 ]
  %bExp.0 = phi i32 [ 1, %if.then.39 ], [ %and.i.323, %if.end.23 ]
  %cmp41 = icmp ult i32 %or.i.317, %or.i.321
  br i1 %cmp41, label %aBigger, label %if.end.43

if.end.43:                                        ; preds = %if.end.40
  %cmp44 = icmp ult i32 %or.i.321, %or.i.317
  br i1 %cmp44, label %bBigger, label %if.end.46

if.end.46:                                        ; preds = %if.end.43
  %cmp47 = icmp ult i32 %shl.i.315, %shl.i.318
  br i1 %cmp47, label %aBigger, label %if.end.49

if.end.49:                                        ; preds = %if.end.46
  %cmp50 = icmp ult i32 %shl.i.318, %shl.i.315
  br i1 %cmp50, label %bBigger, label %if.end.52

if.end.52:                                        ; preds = %if.end.49
  %9 = load i32, i32* @float_rounding_mode, align 4, !tbaa !1
  %cmp53 = icmp eq i32 %9, 3
  %conv = zext i1 %cmp53 to i32
  %shl.i.263 = shl nuw i32 %conv, 31
  br label %cleanup

bExpBigger:                                       ; preds = %if.end
  %cmp55 = icmp eq i32 %and.i.323, 2047
  br i1 %cmp55, label %if.then.57, label %if.end.68

if.then.57:                                       ; preds = %bExpBigger
  %or58 = or i32 %or.i.317, %shl.i.315
  %tobool59 = icmp eq i32 %or58, 0
  br i1 %tobool59, label %if.end.66, label %if.then.60

if.then.60:                                       ; preds = %if.then.57
  %and.i.56.i.215 = and i32 %a.1, 2146959360
  %cmp.i.57.i.216 = icmp eq i32 %and.i.56.i.215, 2146435072
  br i1 %cmp.i.57.i.216, label %land.rhs.i.59.i.218, label %float64_is_signaling_nan.exit64.i.224

land.rhs.i.59.i.218:                              ; preds = %if.then.60
  %tobool.i.58.i.217 = icmp eq i32 %a.0, 0
  br i1 %tobool.i.58.i.217, label %lor.rhs.i.62.i.221, label %float64_is_signaling_nan.exit64.i.224

lor.rhs.i.62.i.221:                               ; preds = %land.rhs.i.59.i.218
  %and4.i.60.i.219 = and i32 %a.1, 524287
  %tobool5.i.61.i.220 = icmp ne i32 %and4.i.60.i.219, 0
  br label %float64_is_signaling_nan.exit64.i.224

float64_is_signaling_nan.exit64.i.224:            ; preds = %lor.rhs.i.62.i.221, %land.rhs.i.59.i.218, %if.then.60
  %10 = phi i1 [ false, %if.then.60 ], [ true, %land.rhs.i.59.i.218 ], [ %tobool5.i.61.i.220, %lor.rhs.i.62.i.221 ]
  %shl.i.i.222 = shl i32 %b.1, 1
  %cmp.i.50.i.223 = icmp ugt i32 %shl.i.i.222, -2097153
  %11 = or i32 %and.i.324, %b.0
  %12 = icmp ne i32 %11, 0
  %13 = and i1 %cmp.i.50.i.223, %12
  %and.i.i.230 = and i32 %b.1, 2146959360
  %cmp.i.i.231 = icmp eq i32 %and.i.i.230, 2146435072
  br i1 %cmp.i.i.231, label %land.rhs.i.i.234, label %float64_is_signaling_nan.exit.i.244

land.rhs.i.i.234:                                 ; preds = %float64_is_signaling_nan.exit64.i.224
  %tobool.i.i.233 = icmp eq i32 %b.0, 0
  br i1 %tobool.i.i.233, label %lor.rhs.i.i.240, label %float64_is_signaling_nan.exit.thread.i.237

float64_is_signaling_nan.exit.thread.i.237:       ; preds = %land.rhs.i.i.234
  %or.66.i.235 = or i32 %a.1, 524288
  %or17.67.i.236 = or i32 %b.1, 524288
  br label %if.then.i.248

lor.rhs.i.i.240:                                  ; preds = %land.rhs.i.i.234
  %and4.i.i.238 = and i32 %b.1, 524287
  %tobool5.i.i.239 = icmp ne i32 %and4.i.i.238, 0
  br label %float64_is_signaling_nan.exit.i.244

float64_is_signaling_nan.exit.i.244:              ; preds = %lor.rhs.i.i.240, %float64_is_signaling_nan.exit64.i.224
  %14 = phi i1 [ false, %float64_is_signaling_nan.exit64.i.224 ], [ %tobool5.i.i.239, %lor.rhs.i.i.240 ]
  %or.i.241 = or i32 %a.1, 524288
  %or17.i.242 = or i32 %b.1, 524288
  %or1865.i.243 = or i1 %10, %14
  br i1 %or1865.i.243, label %if.then.i.248, label %propagateFloat64NaN.exit262

if.then.i.248:                                    ; preds = %float64_is_signaling_nan.exit.i.244, %float64_is_signaling_nan.exit.thread.i.237
  %or1772.i.245 = phi i32 [ %or17.67.i.236, %float64_is_signaling_nan.exit.thread.i.237 ], [ %or17.i.242, %float64_is_signaling_nan.exit.i.244 ]
  %or70.i.246 = phi i32 [ %or.66.i.235, %float64_is_signaling_nan.exit.thread.i.237 ], [ %or.i.241, %float64_is_signaling_nan.exit.i.244 ]
  %15 = phi i1 [ true, %float64_is_signaling_nan.exit.thread.i.237 ], [ %14, %float64_is_signaling_nan.exit.i.244 ]
  %16 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.247 = or i32 %16, 16
  store i32 %or.i.i.247, i32* @float_exception_flags, align 4, !tbaa !1
  br label %propagateFloat64NaN.exit262

propagateFloat64NaN.exit262:                      ; preds = %float64_is_signaling_nan.exit.i.244, %if.then.i.248
  %or186573.i.249 = phi i1 [ false, %float64_is_signaling_nan.exit.i.244 ], [ true, %if.then.i.248 ]
  %or1771.i.250 = phi i32 [ %or17.i.242, %float64_is_signaling_nan.exit.i.244 ], [ %or1772.i.245, %if.then.i.248 ]
  %or69.i.251 = phi i32 [ %or.i.241, %float64_is_signaling_nan.exit.i.244 ], [ %or70.i.246, %if.then.i.248 ]
  %17 = phi i1 [ false, %float64_is_signaling_nan.exit.i.244 ], [ %15, %if.then.i.248 ]
  %b.0.mux.i.252 = select i1 %17, i32 %b.0, i32 %a.0
  %or17.mux.i.253 = select i1 %17, i32 %or1771.i.250, i32 %or69.i.251
  %a.0.b.0.i.254 = select i1 %13, i32 %b.0, i32 %a.0
  %or.or17.i.255 = select i1 %13, i32 %or1771.i.250, i32 %or69.i.251
  %retval.sroa.0.0.i.256 = select i1 %or186573.i.249, i32 %b.0.mux.i.252, i32 %a.0.b.0.i.254
  %retval.sroa.5.0.i.257 = select i1 %or186573.i.249, i32 %or17.mux.i.253, i32 %or.or17.i.255
  br label %cleanup

if.end.66:                                        ; preds = %if.then.57
  %xor = shl i32 %zSign, 31
  %add.i = add i32 %xor, -1048576
  br label %cleanup

if.end.68:                                        ; preds = %bExpBigger
  %cmp69 = icmp eq i32 %and.i.326, 0
  %or72 = or i32 %or.i.321, 1073741824
  %aSig0.0 = select i1 %cmp69, i32 %or.i.321, i32 %or72
  %inc = zext i1 %cmp69 to i32
  %expDiff.0 = add nsw i32 %sub, %inc
  %sub74 = sub nsw i32 0, %expDiff.0
  %and.i.178 = and i32 %expDiff.0, 31
  %cmp.i.179 = icmp eq i32 %expDiff.0, 0
  br i1 %cmp.i.179, label %shift64RightJamming.exit213, label %if.else.i.181

if.else.i.181:                                    ; preds = %if.end.68
  %cmp1.i.180 = icmp sgt i32 %expDiff.0, -32
  br i1 %cmp1.i.180, label %if.then.2.i.190, label %if.else.7.i.192

if.then.2.i.190:                                  ; preds = %if.else.i.181
  %shl.i.182 = shl i32 %aSig0.0, %and.i.178
  %shr.i.183 = lshr i32 %shl.i.318, %sub74
  %or.i.184 = or i32 %shl.i.182, %shr.i.183
  %shl3.i.185 = shl i32 %shl.i.318, %and.i.178
  %cmp4.i.186 = icmp ne i32 %shl3.i.185, 0
  %conv.i.187 = zext i1 %cmp4.i.186 to i32
  %or5.i.188 = or i32 %or.i.184, %conv.i.187
  %shr6.i.189 = lshr i32 %aSig0.0, %sub74
  br label %shift64RightJamming.exit213

if.else.7.i.192:                                  ; preds = %if.else.i.181
  %cmp8.i.191 = icmp eq i32 %sub74, 32
  br i1 %cmp8.i.191, label %if.then.10.i.196, label %if.else.14.i.198

if.then.10.i.196:                                 ; preds = %if.else.7.i.192
  %cmp11.i.193 = icmp ne i32 %shl.i.318, 0
  %conv12.i.194 = zext i1 %cmp11.i.193 to i32
  %or13.i.195 = or i32 %aSig0.0, %conv12.i.194
  br label %shift64RightJamming.exit213

if.else.14.i.198:                                 ; preds = %if.else.7.i.192
  %cmp15.i.197 = icmp sgt i32 %expDiff.0, -64
  br i1 %cmp15.i.197, label %if.then.17.i.206, label %if.else.25.i.210

if.then.17.i.206:                                 ; preds = %if.else.14.i.198
  %and18.i.199 = and i32 %sub74, 31
  %shr19.i.200 = lshr i32 %aSig0.0, %and18.i.199
  %shl20.i.201 = shl i32 %aSig0.0, %and.i.178
  %or21.i.202 = or i32 %shl20.i.201, %shl.i.318
  %cmp22.i.203 = icmp ne i32 %or21.i.202, 0
  %conv23.i.204 = zext i1 %cmp22.i.203 to i32
  %or24.i.205 = or i32 %conv23.i.204, %shr19.i.200
  br label %shift64RightJamming.exit213

if.else.25.i.210:                                 ; preds = %if.else.14.i.198
  %or26.i.207 = or i32 %aSig0.0, %shl.i.318
  %cmp27.i.208 = icmp ne i32 %or26.i.207, 0
  %conv28.i.209 = zext i1 %cmp27.i.208 to i32
  br label %shift64RightJamming.exit213

shift64RightJamming.exit213:                      ; preds = %if.end.68, %if.then.2.i.190, %if.then.10.i.196, %if.then.17.i.206, %if.else.25.i.210
  %z1.1.i.211 = phi i32 [ %or5.i.188, %if.then.2.i.190 ], [ %shl.i.318, %if.end.68 ], [ %or13.i.195, %if.then.10.i.196 ], [ %or24.i.205, %if.then.17.i.206 ], [ %conv28.i.209, %if.else.25.i.210 ]
  %z0.0.i.212 = phi i32 [ %shr6.i.189, %if.then.2.i.190 ], [ %aSig0.0, %if.end.68 ], [ 0, %if.then.10.i.196 ], [ 0, %if.then.17.i.206 ], [ 0, %if.else.25.i.210 ]
  %or75 = or i32 %or.i.317, 1073741824
  br label %bBigger

bBigger:                                          ; preds = %if.end.49, %if.end.43, %shift64RightJamming.exit213
  %aSig0.1 = phi i32 [ %z0.0.i.212, %shift64RightJamming.exit213 ], [ %or.i.321, %if.end.43 ], [ %or.i.321, %if.end.49 ]
  %aSig1.0 = phi i32 [ %z1.1.i.211, %shift64RightJamming.exit213 ], [ %shl.i.318, %if.end.43 ], [ %shl.i.318, %if.end.49 ]
  %bSig0.0 = phi i32 [ %or75, %shift64RightJamming.exit213 ], [ %or.i.317, %if.end.43 ], [ %or.i.317, %if.end.49 ]
  %bExp.1 = phi i32 [ %and.i.323, %shift64RightJamming.exit213 ], [ %bExp.0, %if.end.43 ], [ %bExp.0, %if.end.49 ]
  %sub.i.173 = sub i32 %shl.i.315, %aSig1.0
  %sub1.i.174 = sub i32 %bSig0.0, %aSig0.1
  %cmp.i.175 = icmp ult i32 %shl.i.315, %aSig1.0
  %conv.neg.i.176 = sext i1 %cmp.i.175 to i32
  %sub2.i.177 = add i32 %sub1.i.174, %conv.neg.i.176
  %xor76 = xor i32 %zSign, 1
  br label %normalizeRoundAndPack

aExpBigger:                                       ; preds = %entry
  %cmp77 = icmp eq i32 %and.i.326, 2047
  br i1 %cmp77, label %if.then.79, label %if.end.89

if.then.79:                                       ; preds = %aExpBigger
  %or80 = or i32 %or.i.321, %shl.i.318
  %tobool81 = icmp eq i32 %or80, 0
  br i1 %tobool81, label %cleanup, label %if.then.82

if.then.82:                                       ; preds = %if.then.79
  %and.i.56.i = and i32 %a.1, 2146959360
  %cmp.i.57.i = icmp eq i32 %and.i.56.i, 2146435072
  br i1 %cmp.i.57.i, label %land.rhs.i.59.i, label %float64_is_signaling_nan.exit64.i

land.rhs.i.59.i:                                  ; preds = %if.then.82
  %tobool.i.58.i = icmp eq i32 %a.0, 0
  br i1 %tobool.i.58.i, label %lor.rhs.i.62.i, label %float64_is_signaling_nan.exit64.i

lor.rhs.i.62.i:                                   ; preds = %land.rhs.i.59.i
  %and4.i.60.i = and i32 %a.1, 524287
  %tobool5.i.61.i = icmp ne i32 %and4.i.60.i, 0
  br label %float64_is_signaling_nan.exit64.i

float64_is_signaling_nan.exit64.i:                ; preds = %lor.rhs.i.62.i, %land.rhs.i.59.i, %if.then.82
  %18 = phi i1 [ false, %if.then.82 ], [ true, %land.rhs.i.59.i ], [ %tobool5.i.61.i, %lor.rhs.i.62.i ]
  %shl.i.i = shl i32 %b.1, 1
  %cmp.i.50.i = icmp ugt i32 %shl.i.i, -2097153
  %19 = or i32 %and.i.324, %b.0
  %20 = icmp ne i32 %19, 0
  %21 = and i1 %cmp.i.50.i, %20
  %and.i.i = and i32 %b.1, 2146959360
  %cmp.i.i = icmp eq i32 %and.i.i, 2146435072
  br i1 %cmp.i.i, label %land.rhs.i.i, label %float64_is_signaling_nan.exit.i

land.rhs.i.i:                                     ; preds = %float64_is_signaling_nan.exit64.i
  %tobool.i.i = icmp eq i32 %b.0, 0
  br i1 %tobool.i.i, label %lor.rhs.i.i, label %float64_is_signaling_nan.exit.thread.i

float64_is_signaling_nan.exit.thread.i:           ; preds = %land.rhs.i.i
  %or.66.i = or i32 %a.1, 524288
  %or17.67.i = or i32 %b.1, 524288
  br label %if.then.i

lor.rhs.i.i:                                      ; preds = %land.rhs.i.i
  %and4.i.i = and i32 %b.1, 524287
  %tobool5.i.i = icmp ne i32 %and4.i.i, 0
  br label %float64_is_signaling_nan.exit.i

float64_is_signaling_nan.exit.i:                  ; preds = %lor.rhs.i.i, %float64_is_signaling_nan.exit64.i
  %22 = phi i1 [ false, %float64_is_signaling_nan.exit64.i ], [ %tobool5.i.i, %lor.rhs.i.i ]
  %or.i.172 = or i32 %a.1, 524288
  %or17.i = or i32 %b.1, 524288
  %or1865.i = or i1 %18, %22
  br i1 %or1865.i, label %if.then.i, label %propagateFloat64NaN.exit

if.then.i:                                        ; preds = %float64_is_signaling_nan.exit.i, %float64_is_signaling_nan.exit.thread.i
  %or1772.i = phi i32 [ %or17.67.i, %float64_is_signaling_nan.exit.thread.i ], [ %or17.i, %float64_is_signaling_nan.exit.i ]
  %or70.i = phi i32 [ %or.66.i, %float64_is_signaling_nan.exit.thread.i ], [ %or.i.172, %float64_is_signaling_nan.exit.i ]
  %23 = phi i1 [ true, %float64_is_signaling_nan.exit.thread.i ], [ %22, %float64_is_signaling_nan.exit.i ]
  %24 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i = or i32 %24, 16
  store i32 %or.i.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %propagateFloat64NaN.exit

propagateFloat64NaN.exit:                         ; preds = %float64_is_signaling_nan.exit.i, %if.then.i
  %or186573.i = phi i1 [ false, %float64_is_signaling_nan.exit.i ], [ true, %if.then.i ]
  %or1771.i = phi i32 [ %or17.i, %float64_is_signaling_nan.exit.i ], [ %or1772.i, %if.then.i ]
  %or69.i = phi i32 [ %or.i.172, %float64_is_signaling_nan.exit.i ], [ %or70.i, %if.then.i ]
  %25 = phi i1 [ false, %float64_is_signaling_nan.exit.i ], [ %23, %if.then.i ]
  %b.0.mux.i = select i1 %25, i32 %b.0, i32 %a.0
  %or17.mux.i = select i1 %25, i32 %or1771.i, i32 %or69.i
  %a.0.b.0.i = select i1 %21, i32 %b.0, i32 %a.0
  %or.or17.i = select i1 %21, i32 %or1771.i, i32 %or69.i
  %retval.sroa.0.0.i = select i1 %or186573.i, i32 %b.0.mux.i, i32 %a.0.b.0.i
  %retval.sroa.5.0.i = select i1 %or186573.i, i32 %or17.mux.i, i32 %or.or17.i
  br label %cleanup

if.end.89:                                        ; preds = %aExpBigger
  %cmp90 = icmp eq i32 %and.i.323, 0
  br i1 %cmp90, label %if.end.95, label %if.end.95.thread

if.end.95.thread:                                 ; preds = %if.end.89
  %or94 = or i32 %or.i.317, 1073741824
  br label %if.else.i

if.end.95:                                        ; preds = %if.end.89
  %dec = add nsw i32 %sub, -1
  %cmp.i.171 = icmp eq i32 %dec, 0
  br i1 %cmp.i.171, label %shift64RightJamming.exit, label %if.else.i

if.else.i:                                        ; preds = %if.end.95.thread, %if.end.95
  %.pn = phi i32 [ 0, %if.end.95.thread ], [ 1, %if.end.95 ]
  %expDiff.1365 = phi i32 [ %sub, %if.end.95.thread ], [ %dec, %if.end.95 ]
  %bSig0.1364 = phi i32 [ %or94, %if.end.95.thread ], [ %or.i.317, %if.end.95 ]
  %and.i.170366.in = sub nsw i32 %.pn, %sub
  %and.i.170366 = and i32 %and.i.170366.in, 31
  %cmp1.i = icmp slt i32 %expDiff.1365, 32
  br i1 %cmp1.i, label %if.then.2.i, label %if.else.7.i

if.then.2.i:                                      ; preds = %if.else.i
  %shl.i = shl i32 %bSig0.1364, %and.i.170366
  %shr.i = lshr i32 %shl.i.315, %expDiff.1365
  %or.i = or i32 %shl.i, %shr.i
  %shl3.i = shl i32 %shl.i.315, %and.i.170366
  %cmp4.i = icmp ne i32 %shl3.i, 0
  %conv.i = zext i1 %cmp4.i to i32
  %or5.i = or i32 %or.i, %conv.i
  %shr6.i = lshr i32 %bSig0.1364, %expDiff.1365
  br label %shift64RightJamming.exit

if.else.7.i:                                      ; preds = %if.else.i
  %cmp8.i = icmp eq i32 %expDiff.1365, 32
  br i1 %cmp8.i, label %if.then.10.i, label %if.else.14.i

if.then.10.i:                                     ; preds = %if.else.7.i
  %cmp11.i = icmp ne i32 %shl.i.315, 0
  %conv12.i = zext i1 %cmp11.i to i32
  %or13.i = or i32 %bSig0.1364, %conv12.i
  br label %shift64RightJamming.exit

if.else.14.i:                                     ; preds = %if.else.7.i
  %cmp15.i = icmp slt i32 %expDiff.1365, 64
  br i1 %cmp15.i, label %if.then.17.i, label %if.else.25.i

if.then.17.i:                                     ; preds = %if.else.14.i
  %and18.i = and i32 %expDiff.1365, 31
  %shr19.i = lshr i32 %bSig0.1364, %and18.i
  %shl20.i = shl i32 %bSig0.1364, %and.i.170366
  %or21.i = or i32 %shl20.i, %shl.i.315
  %cmp22.i = icmp ne i32 %or21.i, 0
  %conv23.i = zext i1 %cmp22.i to i32
  %or24.i = or i32 %conv23.i, %shr19.i
  br label %shift64RightJamming.exit

if.else.25.i:                                     ; preds = %if.else.14.i
  %or26.i = or i32 %bSig0.1364, %shl.i.315
  %cmp27.i = icmp ne i32 %or26.i, 0
  %conv28.i = zext i1 %cmp27.i to i32
  br label %shift64RightJamming.exit

shift64RightJamming.exit:                         ; preds = %if.end.95, %if.then.2.i, %if.then.10.i, %if.then.17.i, %if.else.25.i
  %z1.1.i = phi i32 [ %or5.i, %if.then.2.i ], [ %shl.i.315, %if.end.95 ], [ %or13.i, %if.then.10.i ], [ %or24.i, %if.then.17.i ], [ %conv28.i, %if.else.25.i ]
  %z0.0.i = phi i32 [ %shr6.i, %if.then.2.i ], [ %or.i.317, %if.end.95 ], [ 0, %if.then.10.i ], [ 0, %if.then.17.i ], [ 0, %if.else.25.i ]
  %or96 = or i32 %or.i.321, 1073741824
  br label %aBigger

aBigger:                                          ; preds = %if.end.46, %if.end.40, %shift64RightJamming.exit
  %aSig0.2 = phi i32 [ %or96, %shift64RightJamming.exit ], [ %or.i.321, %if.end.40 ], [ %or.i.321, %if.end.46 ]
  %bSig0.2 = phi i32 [ %z0.0.i, %shift64RightJamming.exit ], [ %or.i.317, %if.end.40 ], [ %or.i.317, %if.end.46 ]
  %bSig1.0 = phi i32 [ %z1.1.i, %shift64RightJamming.exit ], [ %shl.i.315, %if.end.40 ], [ %shl.i.315, %if.end.46 ]
  %aExp.1 = phi i32 [ %and.i.326, %shift64RightJamming.exit ], [ %aExp.0, %if.end.40 ], [ %aExp.0, %if.end.46 ]
  %sub.i = sub i32 %shl.i.318, %bSig1.0
  %sub1.i = sub i32 %aSig0.2, %bSig0.2
  %cmp.i = icmp ult i32 %shl.i.318, %bSig1.0
  %conv.neg.i = sext i1 %cmp.i to i32
  %sub2.i = add i32 %sub1.i, %conv.neg.i
  br label %normalizeRoundAndPack

normalizeRoundAndPack:                            ; preds = %aBigger, %bBigger
  %zSig0.0 = phi i32 [ %sub2.i, %aBigger ], [ %sub2.i.177, %bBigger ]
  %zSig1.0 = phi i32 [ %sub.i, %aBigger ], [ %sub.i.173, %bBigger ]
  %zSign.addr.0 = phi i32 [ %zSign, %aBigger ], [ %xor76, %bBigger ]
  %zExp.0 = phi i32 [ %aExp.1, %aBigger ], [ %bExp.1, %bBigger ]
  %sub98 = add nsw i32 %zExp.0, -11
  %call99 = tail call fastcc i64 @normalizeRoundAndPackFloat64(i32 %zSign.addr.0, i32 %sub98, i32 %zSig0.0, i32 %zSig1.0)
  %retval.sroa.0.0.extract.trunc158 = trunc i64 %call99 to i32
  %retval.sroa.9.0.extract.shift167 = lshr i64 %call99, 32
  %retval.sroa.9.0.extract.trunc168 = trunc i64 %retval.sroa.9.0.extract.shift167 to i32
  br label %cleanup

cleanup:                                          ; preds = %if.then.79, %normalizeRoundAndPack, %propagateFloat64NaN.exit, %if.end.66, %propagateFloat64NaN.exit262, %if.end.52, %if.end.34, %propagateFloat64NaN.exit314
  %retval.sroa.0.0 = phi i32 [ %retval.sroa.0.0.i, %propagateFloat64NaN.exit ], [ %retval.sroa.0.0.extract.trunc158, %normalizeRoundAndPack ], [ %retval.sroa.0.0.i.256, %propagateFloat64NaN.exit262 ], [ 0, %if.end.66 ], [ %retval.sroa.0.0.i.308, %propagateFloat64NaN.exit314 ], [ -1, %if.end.34 ], [ 0, %if.end.52 ], [ %a.0, %if.then.79 ]
  %retval.sroa.9.0 = phi i32 [ %retval.sroa.5.0.i, %propagateFloat64NaN.exit ], [ %retval.sroa.9.0.extract.trunc168, %normalizeRoundAndPack ], [ %retval.sroa.5.0.i.257, %propagateFloat64NaN.exit262 ], [ %add.i, %if.end.66 ], [ %retval.sroa.5.0.i.309, %propagateFloat64NaN.exit314 ], [ 2147483647, %if.end.34 ], [ %shl.i.263, %if.end.52 ], [ %a.1, %if.then.79 ]
  %retval.sroa.9.0.insert.ext = zext i32 %retval.sroa.9.0 to i64
  %retval.sroa.9.0.insert.shift = shl nuw i64 %retval.sroa.9.0.insert.ext, 32
  %retval.sroa.0.0.insert.ext = zext i32 %retval.sroa.0.0 to i64
  %retval.sroa.0.0.insert.insert = or i64 %retval.sroa.9.0.insert.shift, %retval.sroa.0.0.insert.ext
  ret i64 %retval.sroa.0.0.insert.insert
}

; Function Attrs: nounwind
define i64 @float64_sub(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #2 {
entry:
  %shr.i = lshr i32 %a.1, 31
  %shr.i.27 = lshr i32 %b.1, 31
  %cmp = icmp eq i32 %shr.i, %shr.i.27
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call13 = tail call fastcc i64 @subFloat64Sigs(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1, i32 %shr.i)
  br label %cleanup

if.else:                                          ; preds = %entry
  %call18 = tail call fastcc i64 @addFloat64Sigs(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1, i32 %shr.i)
  br label %cleanup

cleanup:                                          ; preds = %if.else, %if.then
  %retval.sroa.0.0 = phi i64 [ %call13, %if.then ], [ %call18, %if.else ]
  ret i64 %retval.sroa.0.0
}

; Function Attrs: nounwind
define i64 @float64_mul(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #2 {
entry:
  %and.i = and i32 %a.1, 1048575
  %shr.i.289 = lshr i32 %a.1, 20
  %and.i.290 = and i32 %shr.i.289, 2047
  %and.i.287 = and i32 %b.1, 1048575
  %shr.i.285 = lshr i32 %b.1, 20
  %and.i.286 = and i32 %shr.i.285, 2047
  %shr.i.288330 = xor i32 %b.1, %a.1
  %xor = lshr i32 %shr.i.288330, 31
  %cmp = icmp eq i32 %and.i.290, 2047
  br i1 %cmp, label %if.then, label %if.end.42

if.then:                                          ; preds = %entry
  %or = or i32 %and.i, %a.0
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then.30

lor.lhs.false:                                    ; preds = %if.then
  %cmp27 = icmp ne i32 %and.i.286, 2047
  %or28 = or i32 %and.i.287, %b.0
  %tobool29 = icmp eq i32 %or28, 0
  %or.cond = or i1 %cmp27, %tobool29
  br i1 %or.cond, label %if.end, label %if.then.30

if.then.30:                                       ; preds = %lor.lhs.false, %if.then
  %and.i.56.i.235 = and i32 %a.1, 2146959360
  %cmp.i.57.i.236 = icmp eq i32 %and.i.56.i.235, 2146435072
  br i1 %cmp.i.57.i.236, label %land.rhs.i.59.i.238, label %float64_is_signaling_nan.exit64.i.244

land.rhs.i.59.i.238:                              ; preds = %if.then.30
  %tobool.i.58.i.237 = icmp eq i32 %a.0, 0
  br i1 %tobool.i.58.i.237, label %lor.rhs.i.62.i.241, label %float64_is_signaling_nan.exit64.i.244

lor.rhs.i.62.i.241:                               ; preds = %land.rhs.i.59.i.238
  %and4.i.60.i.239 = and i32 %a.1, 524287
  %tobool5.i.61.i.240 = icmp ne i32 %and4.i.60.i.239, 0
  br label %float64_is_signaling_nan.exit64.i.244

float64_is_signaling_nan.exit64.i.244:            ; preds = %lor.rhs.i.62.i.241, %land.rhs.i.59.i.238, %if.then.30
  %0 = phi i1 [ false, %if.then.30 ], [ true, %land.rhs.i.59.i.238 ], [ %tobool5.i.61.i.240, %lor.rhs.i.62.i.241 ]
  %shl.i.i.242 = shl i32 %b.1, 1
  %cmp.i.50.i.243 = icmp ugt i32 %shl.i.i.242, -2097153
  %1 = or i32 %and.i.287, %b.0
  %2 = icmp ne i32 %1, 0
  %3 = and i1 %cmp.i.50.i.243, %2
  %and.i.i.250 = and i32 %b.1, 2146959360
  %cmp.i.i.251 = icmp eq i32 %and.i.i.250, 2146435072
  br i1 %cmp.i.i.251, label %land.rhs.i.i.254, label %float64_is_signaling_nan.exit.i.264

land.rhs.i.i.254:                                 ; preds = %float64_is_signaling_nan.exit64.i.244
  %tobool.i.i.253 = icmp eq i32 %b.0, 0
  br i1 %tobool.i.i.253, label %lor.rhs.i.i.260, label %float64_is_signaling_nan.exit.thread.i.257

float64_is_signaling_nan.exit.thread.i.257:       ; preds = %land.rhs.i.i.254
  %or.66.i.255 = or i32 %a.1, 524288
  %or17.67.i.256 = or i32 %b.1, 524288
  br label %if.then.i.268

lor.rhs.i.i.260:                                  ; preds = %land.rhs.i.i.254
  %and4.i.i.258 = and i32 %b.1, 524287
  %tobool5.i.i.259 = icmp ne i32 %and4.i.i.258, 0
  br label %float64_is_signaling_nan.exit.i.264

float64_is_signaling_nan.exit.i.264:              ; preds = %lor.rhs.i.i.260, %float64_is_signaling_nan.exit64.i.244
  %4 = phi i1 [ false, %float64_is_signaling_nan.exit64.i.244 ], [ %tobool5.i.i.259, %lor.rhs.i.i.260 ]
  %or.i.261 = or i32 %a.1, 524288
  %or17.i.262 = or i32 %b.1, 524288
  %or1865.i.263 = or i1 %0, %4
  br i1 %or1865.i.263, label %if.then.i.268, label %propagateFloat64NaN.exit283

if.then.i.268:                                    ; preds = %float64_is_signaling_nan.exit.i.264, %float64_is_signaling_nan.exit.thread.i.257
  %or1772.i.265 = phi i32 [ %or17.67.i.256, %float64_is_signaling_nan.exit.thread.i.257 ], [ %or17.i.262, %float64_is_signaling_nan.exit.i.264 ]
  %or70.i.266 = phi i32 [ %or.66.i.255, %float64_is_signaling_nan.exit.thread.i.257 ], [ %or.i.261, %float64_is_signaling_nan.exit.i.264 ]
  %5 = phi i1 [ true, %float64_is_signaling_nan.exit.thread.i.257 ], [ %4, %float64_is_signaling_nan.exit.i.264 ]
  %6 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.267 = or i32 %6, 16
  store i32 %or.i.i.267, i32* @float_exception_flags, align 4, !tbaa !1
  br label %propagateFloat64NaN.exit283

propagateFloat64NaN.exit283:                      ; preds = %float64_is_signaling_nan.exit.i.264, %if.then.i.268
  %or186573.i.269 = phi i1 [ false, %float64_is_signaling_nan.exit.i.264 ], [ true, %if.then.i.268 ]
  %or1771.i.270 = phi i32 [ %or17.i.262, %float64_is_signaling_nan.exit.i.264 ], [ %or1772.i.265, %if.then.i.268 ]
  %or69.i.271 = phi i32 [ %or.i.261, %float64_is_signaling_nan.exit.i.264 ], [ %or70.i.266, %if.then.i.268 ]
  %7 = phi i1 [ false, %float64_is_signaling_nan.exit.i.264 ], [ %5, %if.then.i.268 ]
  %b.0.mux.i.272 = select i1 %7, i32 %b.0, i32 %a.0
  %or17.mux.i.273 = select i1 %7, i32 %or1771.i.270, i32 %or69.i.271
  %a.0.b.0.i.274 = select i1 %3, i32 %b.0, i32 %a.0
  %or.or17.i.275 = select i1 %3, i32 %or1771.i.270, i32 %or69.i.271
  %retval.sroa.0.0.i.276 = select i1 %or186573.i.269, i32 %b.0.mux.i.272, i32 %a.0.b.0.i.274
  %retval.sroa.5.0.i.277 = select i1 %or186573.i.269, i32 %or17.mux.i.273, i32 %or.or17.i.275
  br label %cleanup

if.end:                                           ; preds = %lor.lhs.false
  %or37 = or i32 %or28, %and.i.286
  %cmp38 = icmp eq i32 %or37, 0
  br i1 %cmp38, label %invalid, label %if.end.40

if.end.40:                                        ; preds = %if.end
  %shl.i.231 = shl nuw i32 %xor, 31
  %add.i.232 = or i32 %shl.i.231, 2146435072
  br label %cleanup

if.end.42:                                        ; preds = %entry
  %cmp43 = icmp eq i32 %and.i.286, 2047
  br i1 %cmp43, label %if.then.44, label %if.end.62

if.then.44:                                       ; preds = %if.end.42
  %or45 = or i32 %and.i.287, %b.0
  %tobool46 = icmp eq i32 %or45, 0
  br i1 %tobool46, label %if.end.53, label %if.then.47

if.then.47:                                       ; preds = %if.then.44
  %and.i.56.i = and i32 %a.1, 2146959360
  %cmp.i.57.i = icmp eq i32 %and.i.56.i, 2146435072
  br i1 %cmp.i.57.i, label %land.rhs.i.59.i, label %float64_is_signaling_nan.exit64.i

land.rhs.i.59.i:                                  ; preds = %if.then.47
  %tobool.i.58.i = icmp eq i32 %a.0, 0
  br i1 %tobool.i.58.i, label %lor.rhs.i.62.i, label %float64_is_signaling_nan.exit64.i

lor.rhs.i.62.i:                                   ; preds = %land.rhs.i.59.i
  %and4.i.60.i = and i32 %a.1, 524287
  %tobool5.i.61.i = icmp ne i32 %and4.i.60.i, 0
  br label %float64_is_signaling_nan.exit64.i

float64_is_signaling_nan.exit64.i:                ; preds = %lor.rhs.i.62.i, %land.rhs.i.59.i, %if.then.47
  %8 = phi i1 [ false, %if.then.47 ], [ true, %land.rhs.i.59.i ], [ %tobool5.i.61.i, %lor.rhs.i.62.i ]
  %shl.i.i.224 = shl i32 %b.1, 1
  %cmp.i.50.i = icmp ugt i32 %shl.i.i.224, -2097153
  %and.i.i.225 = and i32 %b.1, 2146959360
  %cmp.i.i.226 = icmp eq i32 %and.i.i.225, 2146435072
  br i1 %cmp.i.i.226, label %land.rhs.i.i, label %float64_is_signaling_nan.exit.i

land.rhs.i.i:                                     ; preds = %float64_is_signaling_nan.exit64.i
  %tobool.i.i = icmp eq i32 %b.0, 0
  br i1 %tobool.i.i, label %lor.rhs.i.i, label %float64_is_signaling_nan.exit.thread.i

float64_is_signaling_nan.exit.thread.i:           ; preds = %land.rhs.i.i
  %or.66.i = or i32 %a.1, 524288
  %or17.67.i = or i32 %b.1, 524288
  br label %if.then.i.229

lor.rhs.i.i:                                      ; preds = %land.rhs.i.i
  %and4.i.i = and i32 %b.1, 524287
  %tobool5.i.i = icmp ne i32 %and4.i.i, 0
  br label %float64_is_signaling_nan.exit.i

float64_is_signaling_nan.exit.i:                  ; preds = %lor.rhs.i.i, %float64_is_signaling_nan.exit64.i
  %9 = phi i1 [ false, %float64_is_signaling_nan.exit64.i ], [ %tobool5.i.i, %lor.rhs.i.i ]
  %or.i.227 = or i32 %a.1, 524288
  %or17.i = or i32 %b.1, 524288
  %or1865.i = or i1 %8, %9
  br i1 %or1865.i, label %if.then.i.229, label %propagateFloat64NaN.exit

if.then.i.229:                                    ; preds = %float64_is_signaling_nan.exit.i, %float64_is_signaling_nan.exit.thread.i
  %or1772.i = phi i32 [ %or17.67.i, %float64_is_signaling_nan.exit.thread.i ], [ %or17.i, %float64_is_signaling_nan.exit.i ]
  %or70.i = phi i32 [ %or.66.i, %float64_is_signaling_nan.exit.thread.i ], [ %or.i.227, %float64_is_signaling_nan.exit.i ]
  %10 = phi i1 [ true, %float64_is_signaling_nan.exit.thread.i ], [ %9, %float64_is_signaling_nan.exit.i ]
  %11 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.228 = or i32 %11, 16
  store i32 %or.i.i.228, i32* @float_exception_flags, align 4, !tbaa !1
  br label %propagateFloat64NaN.exit

propagateFloat64NaN.exit:                         ; preds = %float64_is_signaling_nan.exit.i, %if.then.i.229
  %or186573.i = phi i1 [ false, %float64_is_signaling_nan.exit.i ], [ true, %if.then.i.229 ]
  %or1771.i = phi i32 [ %or17.i, %float64_is_signaling_nan.exit.i ], [ %or1772.i, %if.then.i.229 ]
  %or69.i = phi i32 [ %or.i.227, %float64_is_signaling_nan.exit.i ], [ %or70.i, %if.then.i.229 ]
  %12 = phi i1 [ false, %float64_is_signaling_nan.exit.i ], [ %10, %if.then.i.229 ]
  %b.0.mux.i = select i1 %12, i32 %b.0, i32 %a.0
  %or17.mux.i = select i1 %12, i32 %or1771.i, i32 %or69.i
  %a.0.b.0.i = select i1 %cmp.i.50.i, i32 %b.0, i32 %a.0
  %or.or17.i = select i1 %cmp.i.50.i, i32 %or1771.i, i32 %or69.i
  %retval.sroa.0.0.i = select i1 %or186573.i, i32 %b.0.mux.i, i32 %a.0.b.0.i
  %retval.sroa.5.0.i = select i1 %or186573.i, i32 %or17.mux.i, i32 %or.or17.i
  br label %cleanup

if.end.53:                                        ; preds = %if.then.44
  %or54 = or i32 %and.i, %a.0
  %or55 = or i32 %or54, %and.i.290
  %cmp56 = icmp eq i32 %or55, 0
  br i1 %cmp56, label %invalid, label %if.end.60

invalid:                                          ; preds = %if.end.53, %if.end
  %13 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.223 = or i32 %13, 16
  store i32 %or.i.223, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.60:                                        ; preds = %if.end.53
  %shl.i.219 = shl nuw i32 %xor, 31
  %add.i.220 = or i32 %shl.i.219, 2146435072
  br label %cleanup

if.end.62:                                        ; preds = %if.end.42
  %cmp63 = icmp eq i32 %and.i.290, 0
  br i1 %cmp63, label %if.then.64, label %if.end.70

if.then.64:                                       ; preds = %if.end.62
  %or65 = or i32 %and.i, %a.0
  %cmp66 = icmp eq i32 %or65, 0
  br i1 %cmp66, label %if.then.67, label %if.end.69

if.then.67:                                       ; preds = %if.then.64
  %shl.i.216 = shl nuw i32 %xor, 31
  br label %cleanup

if.end.69:                                        ; preds = %if.then.64
  %cmp.i.163 = icmp eq i32 %and.i, 0
  br i1 %cmp.i.163, label %if.then.i.178, label %if.else.7.i.204

if.then.i.178:                                    ; preds = %if.end.69
  %cmp.i.i.164 = icmp ult i32 %a.0, 65536
  %shl.i.i.165 = shl i32 %a.0, 16
  %shl.a.i.i.166 = select i1 %cmp.i.i.164, i32 %shl.i.i.165, i32 %a.0
  %..i.i.167 = select i1 %cmp.i.i.164, i32 16, i32 0
  %cmp1.i.i.168 = icmp ult i32 %shl.a.i.i.166, 16777216
  %add3.i.i.169 = or i32 %..i.i.167, 8
  %shl4.i.i.170 = shl i32 %shl.a.i.i.166, 8
  %a.addr.1.i.i.171 = select i1 %cmp1.i.i.168, i32 %shl4.i.i.170, i32 %shl.a.i.i.166
  %shiftCount.1.i.i.172 = select i1 %cmp1.i.i.168, i32 %add3.i.i.169, i32 %..i.i.167
  %shr.i.i.173 = lshr i32 %a.addr.1.i.i.171, 24
  %arrayidx.i.i.174 = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.i.173
  %14 = load i32, i32* %arrayidx.i.i.174, align 4, !tbaa !1
  %add6.i.i.175 = add nsw i32 %14, %shiftCount.1.i.i.172
  %sub.i.176 = add nsw i32 %add6.i.i.175, -11
  %cmp1.i.177 = icmp slt i32 %add6.i.i.175, 11
  br i1 %cmp1.i.177, label %if.then.2.i.183, label %if.else.i.185

if.then.2.i.183:                                  ; preds = %if.then.i.178
  %sub3.i.179 = sub i32 11, %add6.i.i.175
  %shr.i.180 = lshr i32 %a.0, %sub3.i.179
  %and.i.181 = and i32 %sub.i.176, 31
  %shl.i.182 = shl i32 %a.0, %and.i.181
  br label %if.end.i.188

if.else.i.185:                                    ; preds = %if.then.i.178
  %shl4.i.184 = shl i32 %a.0, %sub.i.176
  br label %if.end.i.188

if.end.i.188:                                     ; preds = %if.else.i.185, %if.then.2.i.183
  %aSig0.0 = phi i32 [ %shr.i.180, %if.then.2.i.183 ], [ %shl4.i.184, %if.else.i.185 ]
  %storemerge.28.i.186 = phi i32 [ %shl.i.182, %if.then.2.i.183 ], [ 0, %if.else.i.185 ]
  %sub6.i.187 = sub i32 -20, %add6.i.i.175
  br label %if.end.70

if.else.7.i.204:                                  ; preds = %if.end.69
  %cmp.i.32.i.189 = icmp ult i32 %and.i, 65536
  %shl.i.33.i.190 = shl i32 %a.1, 16
  %shl.a.i.34.i.191 = select i1 %cmp.i.32.i.189, i32 %shl.i.33.i.190, i32 %and.i
  %..i.35.i.192 = select i1 %cmp.i.32.i.189, i32 16, i32 0
  %cmp1.i.36.i.193 = icmp ult i32 %shl.a.i.34.i.191, 16777216
  %add3.i.37.i.194 = or i32 %..i.35.i.192, 8
  %shl4.i.38.i.195 = shl i32 %shl.a.i.34.i.191, 8
  %a.addr.1.i.39.i.196 = select i1 %cmp1.i.36.i.193, i32 %shl4.i.38.i.195, i32 %shl.a.i.34.i.191
  %shiftCount.1.i.40.i.197 = select i1 %cmp1.i.36.i.193, i32 %add3.i.37.i.194, i32 %..i.35.i.192
  %shr.i.41.i.198 = lshr i32 %a.addr.1.i.39.i.196, 24
  %arrayidx.i.42.i.199 = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.41.i.198
  %15 = load i32, i32* %arrayidx.i.42.i.199, align 4, !tbaa !1
  %add6.i.43.i.200 = add nsw i32 %15, %shiftCount.1.i.40.i.197
  %sub9.i.201 = add nsw i32 %add6.i.43.i.200, -11
  %shl.i.29.i.202 = shl i32 %a.0, %sub9.i.201
  %cmp.i.30.i.203 = icmp eq i32 %sub9.i.201, 0
  br i1 %cmp.i.30.i.203, label %shortShift64Left.exit.i.213, label %cond.false.i.i.210

cond.false.i.i.210:                               ; preds = %if.else.7.i.204
  %shl1.i.i.205 = shl i32 %and.i, %sub9.i.201
  %sub.i.i.206 = sub i32 11, %add6.i.43.i.200
  %and.i.i.207 = and i32 %sub.i.i.206, 31
  %shr.i.31.i.208 = lshr i32 %a.0, %and.i.i.207
  %or.i.i.209 = or i32 %shr.i.31.i.208, %shl1.i.i.205
  br label %shortShift64Left.exit.i.213

shortShift64Left.exit.i.213:                      ; preds = %cond.false.i.i.210, %if.else.7.i.204
  %cond.i.i.211 = phi i32 [ %or.i.i.209, %cond.false.i.i.210 ], [ %and.i, %if.else.7.i.204 ]
  %sub10.i.212 = sub i32 12, %add6.i.43.i.200
  br label %if.end.70

if.end.70:                                        ; preds = %shortShift64Left.exit.i.213, %if.end.i.188, %if.end.62
  %aSig0.2 = phi i32 [ %and.i, %if.end.62 ], [ %aSig0.0, %if.end.i.188 ], [ %cond.i.i.211, %shortShift64Left.exit.i.213 ]
  %aSig1.1 = phi i32 [ %a.0, %if.end.62 ], [ %storemerge.28.i.186, %if.end.i.188 ], [ %shl.i.29.i.202, %shortShift64Left.exit.i.213 ]
  %aExp.0 = phi i32 [ %and.i.290, %if.end.62 ], [ %sub6.i.187, %if.end.i.188 ], [ %sub10.i.212, %shortShift64Left.exit.i.213 ]
  %cmp71 = icmp eq i32 %and.i.286, 0
  br i1 %cmp71, label %if.then.72, label %if.end.78

if.then.72:                                       ; preds = %if.end.70
  %or73 = or i32 %and.i.287, %b.0
  %cmp74 = icmp eq i32 %or73, 0
  br i1 %cmp74, label %if.then.75, label %if.end.77

if.then.75:                                       ; preds = %if.then.72
  %shl.i.162 = shl nuw i32 %xor, 31
  br label %cleanup

if.end.77:                                        ; preds = %if.then.72
  %cmp.i.154 = icmp eq i32 %and.i.287, 0
  br i1 %cmp.i.154, label %if.then.i, label %if.else.7.i

if.then.i:                                        ; preds = %if.end.77
  %cmp.i.i.155 = icmp ult i32 %b.0, 65536
  %shl.i.i.156 = shl i32 %b.0, 16
  %shl.a.i.i = select i1 %cmp.i.i.155, i32 %shl.i.i.156, i32 %b.0
  %..i.i = select i1 %cmp.i.i.155, i32 16, i32 0
  %cmp1.i.i = icmp ult i32 %shl.a.i.i, 16777216
  %add3.i.i = or i32 %..i.i, 8
  %shl4.i.i = shl i32 %shl.a.i.i, 8
  %a.addr.1.i.i = select i1 %cmp1.i.i, i32 %shl4.i.i, i32 %shl.a.i.i
  %shiftCount.1.i.i = select i1 %cmp1.i.i, i32 %add3.i.i, i32 %..i.i
  %shr.i.i.157 = lshr i32 %a.addr.1.i.i, 24
  %arrayidx.i.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.i.157
  %16 = load i32, i32* %arrayidx.i.i, align 4, !tbaa !1
  %add6.i.i = add nsw i32 %16, %shiftCount.1.i.i
  %sub.i = add nsw i32 %add6.i.i, -11
  %cmp1.i = icmp slt i32 %add6.i.i, 11
  br i1 %cmp1.i, label %if.then.2.i, label %if.else.i

if.then.2.i:                                      ; preds = %if.then.i
  %sub3.i = sub i32 11, %add6.i.i
  %shr.i.158 = lshr i32 %b.0, %sub3.i
  %and.i.159 = and i32 %sub.i, 31
  %shl.i.160 = shl i32 %b.0, %and.i.159
  br label %if.end.i

if.else.i:                                        ; preds = %if.then.i
  %shl4.i = shl i32 %b.0, %sub.i
  br label %if.end.i

if.end.i:                                         ; preds = %if.else.i, %if.then.2.i
  %bSig0.0 = phi i32 [ %shr.i.158, %if.then.2.i ], [ %shl4.i, %if.else.i ]
  %storemerge.28.i = phi i32 [ %shl.i.160, %if.then.2.i ], [ 0, %if.else.i ]
  %sub6.i = sub i32 -20, %add6.i.i
  br label %if.end.78

if.else.7.i:                                      ; preds = %if.end.77
  %cmp.i.32.i.161 = icmp ult i32 %and.i.287, 65536
  %shl.i.33.i = shl i32 %b.1, 16
  %shl.a.i.34.i = select i1 %cmp.i.32.i.161, i32 %shl.i.33.i, i32 %and.i.287
  %..i.35.i = select i1 %cmp.i.32.i.161, i32 16, i32 0
  %cmp1.i.36.i = icmp ult i32 %shl.a.i.34.i, 16777216
  %add3.i.37.i = or i32 %..i.35.i, 8
  %shl4.i.38.i = shl i32 %shl.a.i.34.i, 8
  %a.addr.1.i.39.i = select i1 %cmp1.i.36.i, i32 %shl4.i.38.i, i32 %shl.a.i.34.i
  %shiftCount.1.i.40.i = select i1 %cmp1.i.36.i, i32 %add3.i.37.i, i32 %..i.35.i
  %shr.i.41.i = lshr i32 %a.addr.1.i.39.i, 24
  %arrayidx.i.42.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.41.i
  %17 = load i32, i32* %arrayidx.i.42.i, align 4, !tbaa !1
  %add6.i.43.i = add nsw i32 %17, %shiftCount.1.i.40.i
  %sub9.i = add nsw i32 %add6.i.43.i, -11
  %shl.i.29.i = shl i32 %b.0, %sub9.i
  %cmp.i.30.i = icmp eq i32 %sub9.i, 0
  br i1 %cmp.i.30.i, label %shortShift64Left.exit.i, label %cond.false.i.i

cond.false.i.i:                                   ; preds = %if.else.7.i
  %shl1.i.i = shl i32 %and.i.287, %sub9.i
  %sub.i.i = sub i32 11, %add6.i.43.i
  %and.i.i = and i32 %sub.i.i, 31
  %shr.i.31.i = lshr i32 %b.0, %and.i.i
  %or.i.i = or i32 %shr.i.31.i, %shl1.i.i
  br label %shortShift64Left.exit.i

shortShift64Left.exit.i:                          ; preds = %cond.false.i.i, %if.else.7.i
  %cond.i.i = phi i32 [ %or.i.i, %cond.false.i.i ], [ %and.i.287, %if.else.7.i ]
  %sub10.i = sub i32 12, %add6.i.43.i
  br label %if.end.78

if.end.78:                                        ; preds = %shortShift64Left.exit.i, %if.end.i, %if.end.70
  %bExp.0 = phi i32 [ %and.i.286, %if.end.70 ], [ %sub10.i, %shortShift64Left.exit.i ], [ %sub6.i, %if.end.i ]
  %bSig0.2 = phi i32 [ %and.i.287, %if.end.70 ], [ %cond.i.i, %shortShift64Left.exit.i ], [ %bSig0.0, %if.end.i ]
  %bSig1.1 = phi i32 [ %b.0, %if.end.70 ], [ %shl.i.29.i, %shortShift64Left.exit.i ], [ %storemerge.28.i, %if.end.i ]
  %add = add nsw i32 %bExp.0, %aExp.0
  %sub = add nsw i32 %add, -1024
  %or79 = or i32 %aSig0.2, 1048576
  %shl.i.151 = shl i32 %bSig1.1, 12
  %shl1.i = shl i32 %bSig0.2, 12
  %shr.i.152 = lshr i32 %bSig1.1, 20
  %shr.i.i = lshr i32 %aSig1.1, 16
  %18 = lshr i32 %bSig1.1, 4
  %shr3.i.i = and i32 %18, 65535
  %conv5.i.i = and i32 %aSig1.1, 65535
  %conv6.i.i = and i32 %shl.i.151, 61440
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
  %19 = lshr i32 %bSig0.2, 4
  %shr3.i.60.i = and i32 %19, 65535
  %shl1.i.masked = and i32 %shl1.i, 61440
  %conv6.i.62.i = or i32 %shr.i.152, %shl1.i.masked
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
  %shr.i.35.i = lshr i32 %or79, 16
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
  %add19.i.49.i = add i32 %mul15.i.42.i, %or79
  %add24.i.54.i = add i32 %add19.i.49.i, %add18.i.48.i
  %add2.i.34.i = add i32 %add24.i.54.i, %conv23.i.53.i
  %add2.i.i = add i32 %add2.i.34.i, %conv.i.33.i
  %add1.i = add i32 %add2.i.i, %conv.i.i
  %add2.i = add i32 %add1.i, %conv.i
  %cmp80 = icmp ne i32 %add21.i.i, 0
  %conv = zext i1 %cmp80 to i32
  %or81 = or i32 %add.i.7.i, %conv
  %cmp82 = icmp ugt i32 %add2.i, 2097151
  br i1 %cmp82, label %if.then.84, label %if.end.85

if.then.84:                                       ; preds = %if.end.78
  %shl.i = shl i32 %add.i, 31
  %shl3.i = shl i32 %add2.i, 31
  %shr.i = lshr i32 %add.i, 1
  %or.i = or i32 %shl3.i, %shr.i
  %shr4.i = lshr i32 %add2.i, 1
  %cmp20.i = icmp ne i32 %or81, 0
  %conv21.i = zext i1 %cmp20.i to i32
  %or22.i = or i32 %shl.i, %conv21.i
  %inc = add nsw i32 %add, -1023
  br label %if.end.85

if.end.85:                                        ; preds = %if.then.84, %if.end.78
  %zSig0.0 = phi i32 [ %shr4.i, %if.then.84 ], [ %add2.i, %if.end.78 ]
  %zSig1.0 = phi i32 [ %or.i, %if.then.84 ], [ %add.i, %if.end.78 ]
  %zSig2.0 = phi i32 [ %or22.i, %if.then.84 ], [ %or81, %if.end.78 ]
  %zExp.0 = phi i32 [ %inc, %if.then.84 ], [ %sub, %if.end.78 ]
  %call86 = tail call fastcc i64 @roundAndPackFloat64(i32 %xor, i32 %zExp.0, i32 %zSig0.0, i32 %zSig1.0, i32 %zSig2.0)
  %retval.sroa.0.0.extract.trunc138 = trunc i64 %call86 to i32
  %retval.sroa.9.0.extract.shift149 = lshr i64 %call86, 32
  %retval.sroa.9.0.extract.trunc150 = trunc i64 %retval.sroa.9.0.extract.shift149 to i32
  br label %cleanup

cleanup:                                          ; preds = %if.end.85, %if.then.75, %if.then.67, %if.end.60, %invalid, %propagateFloat64NaN.exit, %if.end.40, %propagateFloat64NaN.exit283
  %retval.sroa.0.0 = phi i32 [ %retval.sroa.0.0.i.276, %propagateFloat64NaN.exit283 ], [ -1, %invalid ], [ 0, %if.end.40 ], [ %retval.sroa.0.0.i, %propagateFloat64NaN.exit ], [ 0, %if.end.60 ], [ 0, %if.then.67 ], [ 0, %if.then.75 ], [ %retval.sroa.0.0.extract.trunc138, %if.end.85 ]
  %retval.sroa.9.0 = phi i32 [ %retval.sroa.5.0.i.277, %propagateFloat64NaN.exit283 ], [ 2147483647, %invalid ], [ %add.i.232, %if.end.40 ], [ %retval.sroa.5.0.i, %propagateFloat64NaN.exit ], [ %add.i.220, %if.end.60 ], [ %shl.i.216, %if.then.67 ], [ %shl.i.162, %if.then.75 ], [ %retval.sroa.9.0.extract.trunc150, %if.end.85 ]
  %retval.sroa.9.0.insert.ext = zext i32 %retval.sroa.9.0 to i64
  %retval.sroa.9.0.insert.shift = shl nuw i64 %retval.sroa.9.0.insert.ext, 32
  %retval.sroa.0.0.insert.ext = zext i32 %retval.sroa.0.0 to i64
  %retval.sroa.0.0.insert.insert = or i64 %retval.sroa.9.0.insert.shift, %retval.sroa.0.0.insert.ext
  ret i64 %retval.sroa.0.0.insert.insert
}

; Function Attrs: nounwind
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

; Function Attrs: nounwind
define i64 @float64_div(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #2 {
entry:
  %and.i = and i32 %a.1, 1048575
  %shr.i.524 = lshr i32 %a.1, 20
  %and.i.525 = and i32 %shr.i.524, 2047
  %and.i.522 = and i32 %b.1, 1048575
  %shr.i.520 = lshr i32 %b.1, 20
  %and.i.521 = and i32 %shr.i.520, 2047
  %shr.i.523598 = xor i32 %b.1, %a.1
  %xor = lshr i32 %shr.i.523598, 31
  %cmp = icmp eq i32 %and.i.525, 2047
  br i1 %cmp, label %if.then, label %if.end.46

if.then:                                          ; preds = %entry
  %or = or i32 %and.i, %a.0
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %if.end, label %if.then.27

if.then.27:                                       ; preds = %if.then
  %and.i.56.i.470 = and i32 %a.1, 2146959360
  %cmp.i.57.i.471 = icmp eq i32 %and.i.56.i.470, 2146435072
  br i1 %cmp.i.57.i.471, label %land.rhs.i.59.i.473, label %float64_is_signaling_nan.exit64.i.479

land.rhs.i.59.i.473:                              ; preds = %if.then.27
  %tobool.i.58.i.472 = icmp eq i32 %a.0, 0
  br i1 %tobool.i.58.i.472, label %lor.rhs.i.62.i.476, label %float64_is_signaling_nan.exit64.i.479

lor.rhs.i.62.i.476:                               ; preds = %land.rhs.i.59.i.473
  %and4.i.60.i.474 = and i32 %a.1, 524287
  %tobool5.i.61.i.475 = icmp ne i32 %and4.i.60.i.474, 0
  br label %float64_is_signaling_nan.exit64.i.479

float64_is_signaling_nan.exit64.i.479:            ; preds = %lor.rhs.i.62.i.476, %land.rhs.i.59.i.473, %if.then.27
  %0 = phi i1 [ false, %if.then.27 ], [ true, %land.rhs.i.59.i.473 ], [ %tobool5.i.61.i.475, %lor.rhs.i.62.i.476 ]
  %shl.i.i.477 = shl i32 %b.1, 1
  %cmp.i.50.i.478 = icmp ugt i32 %shl.i.i.477, -2097153
  %1 = or i32 %and.i.522, %b.0
  %2 = icmp ne i32 %1, 0
  %3 = and i1 %cmp.i.50.i.478, %2
  %and.i.i.485 = and i32 %b.1, 2146959360
  %cmp.i.i.486 = icmp eq i32 %and.i.i.485, 2146435072
  br i1 %cmp.i.i.486, label %land.rhs.i.i.489, label %float64_is_signaling_nan.exit.i.499

land.rhs.i.i.489:                                 ; preds = %float64_is_signaling_nan.exit64.i.479
  %tobool.i.i.488 = icmp eq i32 %b.0, 0
  br i1 %tobool.i.i.488, label %lor.rhs.i.i.495, label %float64_is_signaling_nan.exit.thread.i.492

float64_is_signaling_nan.exit.thread.i.492:       ; preds = %land.rhs.i.i.489
  %or.66.i.490 = or i32 %a.1, 524288
  %or17.67.i.491 = or i32 %b.1, 524288
  br label %if.then.i.503

lor.rhs.i.i.495:                                  ; preds = %land.rhs.i.i.489
  %and4.i.i.493 = and i32 %b.1, 524287
  %tobool5.i.i.494 = icmp ne i32 %and4.i.i.493, 0
  br label %float64_is_signaling_nan.exit.i.499

float64_is_signaling_nan.exit.i.499:              ; preds = %lor.rhs.i.i.495, %float64_is_signaling_nan.exit64.i.479
  %4 = phi i1 [ false, %float64_is_signaling_nan.exit64.i.479 ], [ %tobool5.i.i.494, %lor.rhs.i.i.495 ]
  %or.i.496 = or i32 %a.1, 524288
  %or17.i.497 = or i32 %b.1, 524288
  %or1865.i.498 = or i1 %0, %4
  br i1 %or1865.i.498, label %if.then.i.503, label %propagateFloat64NaN.exit518

if.then.i.503:                                    ; preds = %float64_is_signaling_nan.exit.i.499, %float64_is_signaling_nan.exit.thread.i.492
  %or1772.i.500 = phi i32 [ %or17.67.i.491, %float64_is_signaling_nan.exit.thread.i.492 ], [ %or17.i.497, %float64_is_signaling_nan.exit.i.499 ]
  %or70.i.501 = phi i32 [ %or.66.i.490, %float64_is_signaling_nan.exit.thread.i.492 ], [ %or.i.496, %float64_is_signaling_nan.exit.i.499 ]
  %5 = phi i1 [ true, %float64_is_signaling_nan.exit.thread.i.492 ], [ %4, %float64_is_signaling_nan.exit.i.499 ]
  %6 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.502 = or i32 %6, 16
  store i32 %or.i.i.502, i32* @float_exception_flags, align 4, !tbaa !1
  br label %propagateFloat64NaN.exit518

propagateFloat64NaN.exit518:                      ; preds = %float64_is_signaling_nan.exit.i.499, %if.then.i.503
  %or186573.i.504 = phi i1 [ false, %float64_is_signaling_nan.exit.i.499 ], [ true, %if.then.i.503 ]
  %or1771.i.505 = phi i32 [ %or17.i.497, %float64_is_signaling_nan.exit.i.499 ], [ %or1772.i.500, %if.then.i.503 ]
  %or69.i.506 = phi i32 [ %or.i.496, %float64_is_signaling_nan.exit.i.499 ], [ %or70.i.501, %if.then.i.503 ]
  %7 = phi i1 [ false, %float64_is_signaling_nan.exit.i.499 ], [ %5, %if.then.i.503 ]
  %b.0.mux.i.507 = select i1 %7, i32 %b.0, i32 %a.0
  %or17.mux.i.508 = select i1 %7, i32 %or1771.i.505, i32 %or69.i.506
  %a.0.b.0.i.509 = select i1 %3, i32 %b.0, i32 %a.0
  %or.or17.i.510 = select i1 %3, i32 %or1771.i.505, i32 %or69.i.506
  %retval.sroa.0.0.i.511 = select i1 %or186573.i.504, i32 %b.0.mux.i.507, i32 %a.0.b.0.i.509
  %retval.sroa.5.0.i.512 = select i1 %or186573.i.504, i32 %or17.mux.i.508, i32 %or.or17.i.510
  br label %cleanup

if.end:                                           ; preds = %if.then
  %cmp33 = icmp eq i32 %and.i.521, 2047
  br i1 %cmp33, label %if.then.34, label %if.end.44

if.then.34:                                       ; preds = %if.end
  %or35 = or i32 %and.i.522, %b.0
  %tobool36 = icmp eq i32 %or35, 0
  br i1 %tobool36, label %invalid, label %if.then.37

if.then.37:                                       ; preds = %if.then.34
  %and.i.56.i.421 = and i32 %a.1, 2146959360
  %cmp.i.57.i.422 = icmp eq i32 %and.i.56.i.421, 2146435072
  br i1 %cmp.i.57.i.422, label %land.rhs.i.59.i.424, label %float64_is_signaling_nan.exit64.i.430

land.rhs.i.59.i.424:                              ; preds = %if.then.37
  %tobool.i.58.i.423 = icmp eq i32 %a.0, 0
  br i1 %tobool.i.58.i.423, label %lor.rhs.i.62.i.427, label %float64_is_signaling_nan.exit64.i.430

lor.rhs.i.62.i.427:                               ; preds = %land.rhs.i.59.i.424
  %and4.i.60.i.425 = and i32 %a.1, 524287
  %tobool5.i.61.i.426 = icmp ne i32 %and4.i.60.i.425, 0
  br label %float64_is_signaling_nan.exit64.i.430

float64_is_signaling_nan.exit64.i.430:            ; preds = %lor.rhs.i.62.i.427, %land.rhs.i.59.i.424, %if.then.37
  %8 = phi i1 [ false, %if.then.37 ], [ true, %land.rhs.i.59.i.424 ], [ %tobool5.i.61.i.426, %lor.rhs.i.62.i.427 ]
  %shl.i.i.428 = shl i32 %b.1, 1
  %cmp.i.50.i.429 = icmp ugt i32 %shl.i.i.428, -2097153
  %and.i.i.436 = and i32 %b.1, 2146959360
  %cmp.i.i.437 = icmp eq i32 %and.i.i.436, 2146435072
  br i1 %cmp.i.i.437, label %land.rhs.i.i.440, label %float64_is_signaling_nan.exit.i.450

land.rhs.i.i.440:                                 ; preds = %float64_is_signaling_nan.exit64.i.430
  %tobool.i.i.439 = icmp eq i32 %b.0, 0
  br i1 %tobool.i.i.439, label %lor.rhs.i.i.446, label %float64_is_signaling_nan.exit.thread.i.443

float64_is_signaling_nan.exit.thread.i.443:       ; preds = %land.rhs.i.i.440
  %or.66.i.441 = or i32 %a.1, 524288
  %or17.67.i.442 = or i32 %b.1, 524288
  br label %if.then.i.454

lor.rhs.i.i.446:                                  ; preds = %land.rhs.i.i.440
  %and4.i.i.444 = and i32 %b.1, 524287
  %tobool5.i.i.445 = icmp ne i32 %and4.i.i.444, 0
  br label %float64_is_signaling_nan.exit.i.450

float64_is_signaling_nan.exit.i.450:              ; preds = %lor.rhs.i.i.446, %float64_is_signaling_nan.exit64.i.430
  %9 = phi i1 [ false, %float64_is_signaling_nan.exit64.i.430 ], [ %tobool5.i.i.445, %lor.rhs.i.i.446 ]
  %or.i.447 = or i32 %a.1, 524288
  %or17.i.448 = or i32 %b.1, 524288
  %or1865.i.449 = or i1 %8, %9
  br i1 %or1865.i.449, label %if.then.i.454, label %propagateFloat64NaN.exit469

if.then.i.454:                                    ; preds = %float64_is_signaling_nan.exit.i.450, %float64_is_signaling_nan.exit.thread.i.443
  %or1772.i.451 = phi i32 [ %or17.67.i.442, %float64_is_signaling_nan.exit.thread.i.443 ], [ %or17.i.448, %float64_is_signaling_nan.exit.i.450 ]
  %or70.i.452 = phi i32 [ %or.66.i.441, %float64_is_signaling_nan.exit.thread.i.443 ], [ %or.i.447, %float64_is_signaling_nan.exit.i.450 ]
  %10 = phi i1 [ true, %float64_is_signaling_nan.exit.thread.i.443 ], [ %9, %float64_is_signaling_nan.exit.i.450 ]
  %11 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.453 = or i32 %11, 16
  store i32 %or.i.i.453, i32* @float_exception_flags, align 4, !tbaa !1
  br label %propagateFloat64NaN.exit469

propagateFloat64NaN.exit469:                      ; preds = %float64_is_signaling_nan.exit.i.450, %if.then.i.454
  %or186573.i.455 = phi i1 [ false, %float64_is_signaling_nan.exit.i.450 ], [ true, %if.then.i.454 ]
  %or1771.i.456 = phi i32 [ %or17.i.448, %float64_is_signaling_nan.exit.i.450 ], [ %or1772.i.451, %if.then.i.454 ]
  %or69.i.457 = phi i32 [ %or.i.447, %float64_is_signaling_nan.exit.i.450 ], [ %or70.i.452, %if.then.i.454 ]
  %12 = phi i1 [ false, %float64_is_signaling_nan.exit.i.450 ], [ %10, %if.then.i.454 ]
  %b.0.mux.i.458 = select i1 %12, i32 %b.0, i32 %a.0
  %or17.mux.i.459 = select i1 %12, i32 %or1771.i.456, i32 %or69.i.457
  %a.0.b.0.i.460 = select i1 %cmp.i.50.i.429, i32 %b.0, i32 %a.0
  %or.or17.i.461 = select i1 %cmp.i.50.i.429, i32 %or1771.i.456, i32 %or69.i.457
  %retval.sroa.0.0.i.462 = select i1 %or186573.i.455, i32 %b.0.mux.i.458, i32 %a.0.b.0.i.460
  %retval.sroa.5.0.i.463 = select i1 %or186573.i.455, i32 %or17.mux.i.459, i32 %or.or17.i.461
  br label %cleanup

if.end.44:                                        ; preds = %if.end
  %shl.i.417 = shl nuw i32 %xor, 31
  %add.i.418 = or i32 %shl.i.417, 2146435072
  br label %cleanup

if.end.46:                                        ; preds = %entry
  switch i32 %and.i.521, label %if.end.74 [
    i32 2047, label %if.then.48
    i32 0, label %if.then.61
  ]

if.then.48:                                       ; preds = %if.end.46
  %or49 = or i32 %and.i.522, %b.0
  %tobool50 = icmp eq i32 %or49, 0
  br i1 %tobool50, label %if.end.57, label %if.then.51

if.then.51:                                       ; preds = %if.then.48
  %and.i.56.i = and i32 %a.1, 2146959360
  %cmp.i.57.i = icmp eq i32 %and.i.56.i, 2146435072
  br i1 %cmp.i.57.i, label %land.rhs.i.59.i, label %float64_is_signaling_nan.exit64.i

land.rhs.i.59.i:                                  ; preds = %if.then.51
  %tobool.i.58.i = icmp eq i32 %a.0, 0
  br i1 %tobool.i.58.i, label %lor.rhs.i.62.i, label %float64_is_signaling_nan.exit64.i

lor.rhs.i.62.i:                                   ; preds = %land.rhs.i.59.i
  %and4.i.60.i = and i32 %a.1, 524287
  %tobool5.i.61.i = icmp ne i32 %and4.i.60.i, 0
  br label %float64_is_signaling_nan.exit64.i

float64_is_signaling_nan.exit64.i:                ; preds = %lor.rhs.i.62.i, %land.rhs.i.59.i, %if.then.51
  %13 = phi i1 [ false, %if.then.51 ], [ true, %land.rhs.i.59.i ], [ %tobool5.i.61.i, %lor.rhs.i.62.i ]
  %shl.i.i.410 = shl i32 %b.1, 1
  %cmp.i.50.i = icmp ugt i32 %shl.i.i.410, -2097153
  %and.i.i.411 = and i32 %b.1, 2146959360
  %cmp.i.i.412 = icmp eq i32 %and.i.i.411, 2146435072
  br i1 %cmp.i.i.412, label %land.rhs.i.i, label %float64_is_signaling_nan.exit.i

land.rhs.i.i:                                     ; preds = %float64_is_signaling_nan.exit64.i
  %tobool.i.i = icmp eq i32 %b.0, 0
  br i1 %tobool.i.i, label %lor.rhs.i.i, label %float64_is_signaling_nan.exit.thread.i

float64_is_signaling_nan.exit.thread.i:           ; preds = %land.rhs.i.i
  %or.66.i = or i32 %a.1, 524288
  %or17.67.i = or i32 %b.1, 524288
  br label %if.then.i.415

lor.rhs.i.i:                                      ; preds = %land.rhs.i.i
  %and4.i.i = and i32 %b.1, 524287
  %tobool5.i.i = icmp ne i32 %and4.i.i, 0
  br label %float64_is_signaling_nan.exit.i

float64_is_signaling_nan.exit.i:                  ; preds = %lor.rhs.i.i, %float64_is_signaling_nan.exit64.i
  %14 = phi i1 [ false, %float64_is_signaling_nan.exit64.i ], [ %tobool5.i.i, %lor.rhs.i.i ]
  %or.i.413 = or i32 %a.1, 524288
  %or17.i = or i32 %b.1, 524288
  %or1865.i = or i1 %13, %14
  br i1 %or1865.i, label %if.then.i.415, label %propagateFloat64NaN.exit

if.then.i.415:                                    ; preds = %float64_is_signaling_nan.exit.i, %float64_is_signaling_nan.exit.thread.i
  %or1772.i = phi i32 [ %or17.67.i, %float64_is_signaling_nan.exit.thread.i ], [ %or17.i, %float64_is_signaling_nan.exit.i ]
  %or70.i = phi i32 [ %or.66.i, %float64_is_signaling_nan.exit.thread.i ], [ %or.i.413, %float64_is_signaling_nan.exit.i ]
  %15 = phi i1 [ true, %float64_is_signaling_nan.exit.thread.i ], [ %14, %float64_is_signaling_nan.exit.i ]
  %16 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.414 = or i32 %16, 16
  store i32 %or.i.i.414, i32* @float_exception_flags, align 4, !tbaa !1
  br label %propagateFloat64NaN.exit

propagateFloat64NaN.exit:                         ; preds = %float64_is_signaling_nan.exit.i, %if.then.i.415
  %or186573.i = phi i1 [ false, %float64_is_signaling_nan.exit.i ], [ true, %if.then.i.415 ]
  %or1771.i = phi i32 [ %or17.i, %float64_is_signaling_nan.exit.i ], [ %or1772.i, %if.then.i.415 ]
  %or69.i = phi i32 [ %or.i.413, %float64_is_signaling_nan.exit.i ], [ %or70.i, %if.then.i.415 ]
  %17 = phi i1 [ false, %float64_is_signaling_nan.exit.i ], [ %15, %if.then.i.415 ]
  %b.0.mux.i = select i1 %17, i32 %b.0, i32 %a.0
  %or17.mux.i = select i1 %17, i32 %or1771.i, i32 %or69.i
  %a.0.b.0.i = select i1 %cmp.i.50.i, i32 %b.0, i32 %a.0
  %or.or17.i = select i1 %cmp.i.50.i, i32 %or1771.i, i32 %or69.i
  %retval.sroa.0.0.i = select i1 %or186573.i, i32 %b.0.mux.i, i32 %a.0.b.0.i
  %retval.sroa.5.0.i = select i1 %or186573.i, i32 %or17.mux.i, i32 %or.or17.i
  br label %cleanup

if.end.57:                                        ; preds = %if.then.48
  %shl.i.407 = shl nuw i32 %xor, 31
  br label %cleanup

if.then.61:                                       ; preds = %if.end.46
  %or62 = or i32 %and.i.522, %b.0
  %cmp63 = icmp eq i32 %or62, 0
  br i1 %cmp63, label %if.then.64, label %if.end.73

if.then.64:                                       ; preds = %if.then.61
  %or65 = or i32 %and.i, %a.0
  %or66 = or i32 %or65, %and.i.525
  %cmp67 = icmp eq i32 %or66, 0
  br i1 %cmp67, label %invalid, label %if.end.71

invalid:                                          ; preds = %if.then.34, %if.then.64
  %18 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.406 = or i32 %18, 16
  store i32 %or.i.406, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.71:                                        ; preds = %if.then.64
  %19 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.405 = or i32 %19, 2
  store i32 %or.i.405, i32* @float_exception_flags, align 4, !tbaa !1
  %shl.i.401 = shl nuw i32 %xor, 31
  %add.i.402 = or i32 %shl.i.401, 2146435072
  br label %cleanup

if.end.73:                                        ; preds = %if.then.61
  %cmp.i.348 = icmp eq i32 %and.i.522, 0
  br i1 %cmp.i.348, label %if.then.i.363, label %if.else.7.i.389

if.then.i.363:                                    ; preds = %if.end.73
  %cmp.i.i.349 = icmp ult i32 %b.0, 65536
  %shl.i.i.350 = shl i32 %b.0, 16
  %shl.a.i.i.351 = select i1 %cmp.i.i.349, i32 %shl.i.i.350, i32 %b.0
  %..i.i.352 = select i1 %cmp.i.i.349, i32 16, i32 0
  %cmp1.i.i.353 = icmp ult i32 %shl.a.i.i.351, 16777216
  %add3.i.i.354 = or i32 %..i.i.352, 8
  %shl4.i.i.355 = shl i32 %shl.a.i.i.351, 8
  %a.addr.1.i.i.356 = select i1 %cmp1.i.i.353, i32 %shl4.i.i.355, i32 %shl.a.i.i.351
  %shiftCount.1.i.i.357 = select i1 %cmp1.i.i.353, i32 %add3.i.i.354, i32 %..i.i.352
  %shr.i.i.358 = lshr i32 %a.addr.1.i.i.356, 24
  %arrayidx.i.i.359 = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.i.358
  %20 = load i32, i32* %arrayidx.i.i.359, align 4, !tbaa !1
  %add6.i.i.360 = add nsw i32 %20, %shiftCount.1.i.i.357
  %sub.i.361 = add nsw i32 %add6.i.i.360, -11
  %cmp1.i.362 = icmp slt i32 %add6.i.i.360, 11
  br i1 %cmp1.i.362, label %if.then.2.i.368, label %if.else.i.370

if.then.2.i.368:                                  ; preds = %if.then.i.363
  %sub3.i.364 = sub i32 11, %add6.i.i.360
  %shr.i.365 = lshr i32 %b.0, %sub3.i.364
  %and.i.366 = and i32 %sub.i.361, 31
  %shl.i.367 = shl i32 %b.0, %and.i.366
  br label %if.end.i.373

if.else.i.370:                                    ; preds = %if.then.i.363
  %shl4.i.369 = shl i32 %b.0, %sub.i.361
  br label %if.end.i.373

if.end.i.373:                                     ; preds = %if.else.i.370, %if.then.2.i.368
  %bSig0.0 = phi i32 [ %shr.i.365, %if.then.2.i.368 ], [ %shl4.i.369, %if.else.i.370 ]
  %storemerge.28.i.371 = phi i32 [ %shl.i.367, %if.then.2.i.368 ], [ 0, %if.else.i.370 ]
  %sub6.i.372 = sub i32 -20, %add6.i.i.360
  br label %if.end.74

if.else.7.i.389:                                  ; preds = %if.end.73
  %cmp.i.32.i.374 = icmp ult i32 %and.i.522, 65536
  %shl.i.33.i.375 = shl i32 %b.1, 16
  %shl.a.i.34.i.376 = select i1 %cmp.i.32.i.374, i32 %shl.i.33.i.375, i32 %and.i.522
  %..i.35.i.377 = select i1 %cmp.i.32.i.374, i32 16, i32 0
  %cmp1.i.36.i.378 = icmp ult i32 %shl.a.i.34.i.376, 16777216
  %add3.i.37.i.379 = or i32 %..i.35.i.377, 8
  %shl4.i.38.i.380 = shl i32 %shl.a.i.34.i.376, 8
  %a.addr.1.i.39.i.381 = select i1 %cmp1.i.36.i.378, i32 %shl4.i.38.i.380, i32 %shl.a.i.34.i.376
  %shiftCount.1.i.40.i.382 = select i1 %cmp1.i.36.i.378, i32 %add3.i.37.i.379, i32 %..i.35.i.377
  %shr.i.41.i.383 = lshr i32 %a.addr.1.i.39.i.381, 24
  %arrayidx.i.42.i.384 = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.41.i.383
  %21 = load i32, i32* %arrayidx.i.42.i.384, align 4, !tbaa !1
  %add6.i.43.i.385 = add nsw i32 %21, %shiftCount.1.i.40.i.382
  %sub9.i.386 = add nsw i32 %add6.i.43.i.385, -11
  %shl.i.29.i.387 = shl i32 %b.0, %sub9.i.386
  %cmp.i.30.i.388 = icmp eq i32 %sub9.i.386, 0
  br i1 %cmp.i.30.i.388, label %shortShift64Left.exit.i.398, label %cond.false.i.i.395

cond.false.i.i.395:                               ; preds = %if.else.7.i.389
  %shl1.i.i.390 = shl i32 %and.i.522, %sub9.i.386
  %sub.i.i.391 = sub i32 11, %add6.i.43.i.385
  %and.i.i.392 = and i32 %sub.i.i.391, 31
  %shr.i.31.i.393 = lshr i32 %b.0, %and.i.i.392
  %or.i.i.394 = or i32 %shr.i.31.i.393, %shl1.i.i.390
  br label %shortShift64Left.exit.i.398

shortShift64Left.exit.i.398:                      ; preds = %cond.false.i.i.395, %if.else.7.i.389
  %cond.i.i.396 = phi i32 [ %or.i.i.394, %cond.false.i.i.395 ], [ %and.i.522, %if.else.7.i.389 ]
  %sub10.i.397 = sub i32 12, %add6.i.43.i.385
  br label %if.end.74

if.end.74:                                        ; preds = %shortShift64Left.exit.i.398, %if.end.i.373, %if.end.46
  %bSig0.2 = phi i32 [ %and.i.522, %if.end.46 ], [ %bSig0.0, %if.end.i.373 ], [ %cond.i.i.396, %shortShift64Left.exit.i.398 ]
  %bSig1.1 = phi i32 [ %b.0, %if.end.46 ], [ %storemerge.28.i.371, %if.end.i.373 ], [ %shl.i.29.i.387, %shortShift64Left.exit.i.398 ]
  %bExp.0 = phi i32 [ %and.i.521, %if.end.46 ], [ %sub6.i.372, %if.end.i.373 ], [ %sub10.i.397, %shortShift64Left.exit.i.398 ]
  %cmp75 = icmp eq i32 %and.i.525, 0
  br i1 %cmp75, label %if.then.76, label %if.end.82

if.then.76:                                       ; preds = %if.end.74
  %or77 = or i32 %and.i, %a.0
  %cmp78 = icmp eq i32 %or77, 0
  br i1 %cmp78, label %if.then.79, label %if.end.81

if.then.79:                                       ; preds = %if.then.76
  %shl.i.347 = shl nuw i32 %xor, 31
  br label %cleanup

if.end.81:                                        ; preds = %if.then.76
  %cmp.i.334 = icmp eq i32 %and.i, 0
  br i1 %cmp.i.334, label %if.then.i, label %if.else.7.i

if.then.i:                                        ; preds = %if.end.81
  %cmp.i.i.335 = icmp ult i32 %a.0, 65536
  %shl.i.i.336 = shl i32 %a.0, 16
  %shl.a.i.i = select i1 %cmp.i.i.335, i32 %shl.i.i.336, i32 %a.0
  %..i.i = select i1 %cmp.i.i.335, i32 16, i32 0
  %cmp1.i.i = icmp ult i32 %shl.a.i.i, 16777216
  %add3.i.i = or i32 %..i.i, 8
  %shl4.i.i = shl i32 %shl.a.i.i, 8
  %a.addr.1.i.i = select i1 %cmp1.i.i, i32 %shl4.i.i, i32 %shl.a.i.i
  %shiftCount.1.i.i = select i1 %cmp1.i.i, i32 %add3.i.i, i32 %..i.i
  %shr.i.i.337 = lshr i32 %a.addr.1.i.i, 24
  %arrayidx.i.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.i.337
  %22 = load i32, i32* %arrayidx.i.i, align 4, !tbaa !1
  %add6.i.i = add nsw i32 %22, %shiftCount.1.i.i
  %sub.i.338 = add nsw i32 %add6.i.i, -11
  %cmp1.i.339 = icmp slt i32 %add6.i.i, 11
  br i1 %cmp1.i.339, label %if.then.2.i, label %if.else.i

if.then.2.i:                                      ; preds = %if.then.i
  %sub3.i = sub i32 11, %add6.i.i
  %shr.i.340 = lshr i32 %a.0, %sub3.i
  %and.i.341 = and i32 %sub.i.338, 31
  %shl.i.342 = shl i32 %a.0, %and.i.341
  br label %if.end.i.344

if.else.i:                                        ; preds = %if.then.i
  %shl4.i.343 = shl i32 %a.0, %sub.i.338
  br label %if.end.i.344

if.end.i.344:                                     ; preds = %if.else.i, %if.then.2.i
  %aSig0.0 = phi i32 [ %shr.i.340, %if.then.2.i ], [ %shl4.i.343, %if.else.i ]
  %storemerge.28.i = phi i32 [ %shl.i.342, %if.then.2.i ], [ 0, %if.else.i ]
  %sub6.i = sub i32 -20, %add6.i.i
  br label %if.end.82

if.else.7.i:                                      ; preds = %if.end.81
  %cmp.i.32.i = icmp ult i32 %and.i, 65536
  %shl.i.33.i = shl i32 %a.1, 16
  %shl.a.i.34.i = select i1 %cmp.i.32.i, i32 %shl.i.33.i, i32 %and.i
  %..i.35.i = select i1 %cmp.i.32.i, i32 16, i32 0
  %cmp1.i.36.i = icmp ult i32 %shl.a.i.34.i, 16777216
  %add3.i.37.i = or i32 %..i.35.i, 8
  %shl4.i.38.i = shl i32 %shl.a.i.34.i, 8
  %a.addr.1.i.39.i = select i1 %cmp1.i.36.i, i32 %shl4.i.38.i, i32 %shl.a.i.34.i
  %shiftCount.1.i.40.i = select i1 %cmp1.i.36.i, i32 %add3.i.37.i, i32 %..i.35.i
  %shr.i.41.i = lshr i32 %a.addr.1.i.39.i, 24
  %arrayidx.i.42.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.41.i
  %23 = load i32, i32* %arrayidx.i.42.i, align 4, !tbaa !1
  %add6.i.43.i = add nsw i32 %23, %shiftCount.1.i.40.i
  %sub9.i.345 = add nsw i32 %add6.i.43.i, -11
  %shl.i.29.i = shl i32 %a.0, %sub9.i.345
  %cmp.i.30.i = icmp eq i32 %sub9.i.345, 0
  br i1 %cmp.i.30.i, label %shortShift64Left.exit.i, label %cond.false.i.i

cond.false.i.i:                                   ; preds = %if.else.7.i
  %shl1.i.i = shl i32 %and.i, %sub9.i.345
  %sub.i.i.346 = sub i32 11, %add6.i.43.i
  %and.i.i = and i32 %sub.i.i.346, 31
  %shr.i.31.i = lshr i32 %a.0, %and.i.i
  %or.i.i = or i32 %shr.i.31.i, %shl1.i.i
  br label %shortShift64Left.exit.i

shortShift64Left.exit.i:                          ; preds = %cond.false.i.i, %if.else.7.i
  %cond.i.i = phi i32 [ %or.i.i, %cond.false.i.i ], [ %and.i, %if.else.7.i ]
  %sub10.i = sub i32 12, %add6.i.43.i
  br label %if.end.82

if.end.82:                                        ; preds = %shortShift64Left.exit.i, %if.end.i.344, %if.end.74
  %aSig1.1 = phi i32 [ %a.0, %if.end.74 ], [ %storemerge.28.i, %if.end.i.344 ], [ %shl.i.29.i, %shortShift64Left.exit.i ]
  %aSig0.2 = phi i32 [ %and.i, %if.end.74 ], [ %aSig0.0, %if.end.i.344 ], [ %cond.i.i, %shortShift64Left.exit.i ]
  %aExp.0 = phi i32 [ %and.i.525, %if.end.74 ], [ %sub6.i, %if.end.i.344 ], [ %sub10.i, %shortShift64Left.exit.i ]
  %sub = sub nsw i32 %aExp.0, %bExp.0
  %shl.i.327 = shl i32 %aSig1.1, 11
  %or83 = shl i32 %aSig0.2, 11
  %shr.i.329 = lshr i32 %aSig1.1, 21
  %shl1.i.328 = or i32 %shr.i.329, %or83
  %or.i.330 = or i32 %shl1.i.328, -2147483648
  %shl.i.321 = shl i32 %bSig1.1, 11
  %or84 = shl i32 %bSig0.2, 11
  %shl1.i = or i32 %or84, -2147483648
  %shr.i.322 = lshr i32 %bSig1.1, 21
  %or.i.323 = or i32 %shr.i.322, %shl1.i
  %cmp.i.318 = icmp ult i32 %or.i.323, %or.i.330
  br i1 %cmp.i.318, label %if.then.87, label %lor.rhs.i

lor.rhs.i:                                        ; preds = %if.end.82
  %add = add nsw i32 %sub, 1021
  %cmp1.i.319 = icmp eq i32 %or.i.323, %or.i.330
  %cmp2.i.320 = icmp ule i32 %shl.i.321, %shl.i.327
  %cmp2..i = and i1 %cmp2.i.320, %cmp1.i.319
  br i1 %cmp2..i, label %if.then.87, label %if.end.88

if.then.87:                                       ; preds = %if.end.82, %lor.rhs.i
  %shl.i.315 = shl i32 %shr.i.329, 31
  %24 = shl i32 %aSig1.1, 10
  %shr.i.316 = and i32 %24, 2147482624
  %or.i.317 = or i32 %shl.i.315, %shr.i.316
  %shr3.i = lshr i32 %or.i.330, 1
  %inc = add nsw i32 %sub, 1022
  br label %if.end.88

if.end.88:                                        ; preds = %lor.rhs.i, %if.then.87
  %aSig1.2 = phi i32 [ %shl.i.327, %lor.rhs.i ], [ %or.i.317, %if.then.87 ]
  %aSig0.3 = phi i32 [ %or.i.330, %lor.rhs.i ], [ %shr3.i, %if.then.87 ]
  %zExp.0 = phi i32 [ %add, %lor.rhs.i ], [ %inc, %if.then.87 ]
  %cmp.i.264 = icmp ugt i32 %or.i.323, %aSig0.3
  %shr.i.265 = lshr i32 %shl1.i, 16
  br i1 %cmp.i.264, label %if.end.i.268, label %if.end.88.estimateDiv64To32.exit314_crit_edge

if.end.88.estimateDiv64To32.exit314_crit_edge:    ; preds = %if.end.88
  %.pre615 = and i32 %or.i.323, 65535
  br label %estimateDiv64To32.exit314

if.end.i.268:                                     ; preds = %if.end.88
  %shl.i.266 = shl nuw i32 %shr.i.265, 16
  %cmp1.i.267 = icmp ugt i32 %shl.i.266, %aSig0.3
  br i1 %cmp1.i.267, label %cond.false.i.271, label %cond.end.i.286

cond.false.i.271:                                 ; preds = %if.end.i.268
  %div.i.269 = udiv i32 %aSig0.3, %shr.i.265
  %shl2.i.270 = shl i32 %div.i.269, 16
  br label %cond.end.i.286

cond.end.i.286:                                   ; preds = %cond.false.i.271, %if.end.i.268
  %cond.i.272 = phi i32 [ %shl2.i.270, %cond.false.i.271 ], [ -65536, %if.end.i.268 ]
  %shr3.i.i.273 = lshr exact i32 %cond.i.272, 16
  %conv5.i.i.274 = and i32 %or.i.323, 65535
  %mul9.i.i.275 = mul nuw i32 %shr3.i.i.273, %conv5.i.i.274
  %mul15.i.i.276 = mul nuw i32 %shr3.i.i.273, %shr.i.265
  %shr17.i.i.277 = lshr i32 %mul9.i.i.275, 16
  %shl20.i.i.278 = shl i32 %mul9.i.i.275, 16
  %sub.i.i.279 = sub i32 %aSig1.2, %shl20.i.i.278
  %cmp.i.39.i.280 = icmp ult i32 %aSig1.2, %shl20.i.i.278
  %conv.neg.i.i.281 = sext i1 %cmp.i.39.i.280 to i32
  %add24.i.neg.i.282 = sub i32 %aSig0.3, %mul15.i.i.276
  %sub1.i.i.283 = sub i32 %add24.i.neg.i.282, %shr17.i.i.277
  %sub2.i.i.284 = add i32 %sub1.i.i.283, %conv.neg.i.i.281
  %cmp3.45.i.285 = icmp slt i32 %sub2.i.i.284, 0
  br i1 %cmp3.45.i.285, label %while.body.lr.ph.i.288, label %while.end.i.307

while.body.lr.ph.i.288:                           ; preds = %cond.end.i.286
  %shl4.i.287 = shl i32 %or.i.323, 16
  br label %while.body.i.299

while.body.i.299:                                 ; preds = %while.body.i.299, %while.body.lr.ph.i.288
  %z.048.i.289 = phi i32 [ %cond.i.272, %while.body.lr.ph.i.288 ], [ %sub.i.292, %while.body.i.299 ]
  %rem0.047.i.290 = phi i32 [ %sub2.i.i.284, %while.body.lr.ph.i.288 ], [ %add2.i.i.297, %while.body.i.299 ]
  %rem1.046.i.291 = phi i32 [ %sub.i.i.279, %while.body.lr.ph.i.288 ], [ %add.i.37.i.293, %while.body.i.299 ]
  %sub.i.292 = add i32 %z.048.i.289, -65536
  %add.i.37.i.293 = add i32 %rem1.046.i.291, %shl4.i.287
  %add1.i.i.294 = add i32 %rem0.047.i.290, %shr.i.265
  %cmp.i.38.i.295 = icmp ult i32 %add.i.37.i.293, %rem1.046.i.291
  %conv.i.i.296 = zext i1 %cmp.i.38.i.295 to i32
  %add2.i.i.297 = add i32 %add1.i.i.294, %conv.i.i.296
  %cmp3.i.298 = icmp slt i32 %add2.i.i.297, 0
  br i1 %cmp3.i.298, label %while.body.i.299, label %while.end.i.307.loopexit

while.end.i.307.loopexit:                         ; preds = %while.body.i.299
  %add2.i.i.297.lcssa = phi i32 [ %add2.i.i.297, %while.body.i.299 ]
  %add.i.37.i.293.lcssa = phi i32 [ %add.i.37.i.293, %while.body.i.299 ]
  %sub.i.292.lcssa = phi i32 [ %sub.i.292, %while.body.i.299 ]
  br label %while.end.i.307

while.end.i.307:                                  ; preds = %while.end.i.307.loopexit, %cond.end.i.286
  %z.0.lcssa.i.300 = phi i32 [ %cond.i.272, %cond.end.i.286 ], [ %sub.i.292.lcssa, %while.end.i.307.loopexit ]
  %rem0.0.lcssa.i.301 = phi i32 [ %sub2.i.i.284, %cond.end.i.286 ], [ %add2.i.i.297.lcssa, %while.end.i.307.loopexit ]
  %rem1.0.lcssa.i.302 = phi i32 [ %sub.i.i.279, %cond.end.i.286 ], [ %add.i.37.i.293.lcssa, %while.end.i.307.loopexit ]
  %shl5.i.303 = shl i32 %rem0.0.lcssa.i.301, 16
  %shr6.i.304 = lshr i32 %rem1.0.lcssa.i.302, 16
  %or.i.305 = or i32 %shr6.i.304, %shl5.i.303
  %cmp8.i.306 = icmp ugt i32 %shl.i.266, %or.i.305
  br i1 %cmp8.i.306, label %cond.false.10.i.309, label %cond.end.12.i.312

cond.false.10.i.309:                              ; preds = %while.end.i.307
  %div11.i.308 = udiv i32 %or.i.305, %shr.i.265
  br label %cond.end.12.i.312

cond.end.12.i.312:                                ; preds = %cond.false.10.i.309, %while.end.i.307
  %cond13.i.310 = phi i32 [ %div11.i.308, %cond.false.10.i.309 ], [ 65535, %while.end.i.307 ]
  %or14.i.311 = or i32 %cond13.i.310, %z.0.lcssa.i.300
  br label %estimateDiv64To32.exit314

estimateDiv64To32.exit314:                        ; preds = %if.end.88.estimateDiv64To32.exit314_crit_edge, %cond.end.12.i.312
  %conv5.i.6.i.241.pre-phi = phi i32 [ %.pre615, %if.end.88.estimateDiv64To32.exit314_crit_edge ], [ %conv5.i.i.274, %cond.end.12.i.312 ]
  %retval.0.i.313 = phi i32 [ -1, %if.end.88.estimateDiv64To32.exit314_crit_edge ], [ %or14.i.311, %cond.end.12.i.312 ]
  %25 = lshr i32 %bSig1.1, 5
  %shr.i.i.222 = and i32 %25, 65535
  %shr3.i.i.223 = lshr i32 %retval.0.i.313, 16
  %conv5.i.i.224 = and i32 %shl.i.321, 63488
  %conv6.i.i.225 = and i32 %retval.0.i.313, 65535
  %mul.i.i.226 = mul nuw i32 %conv6.i.i.225, %conv5.i.i.224
  %mul9.i.i.227 = mul nuw i32 %shr3.i.i.223, %conv5.i.i.224
  %mul12.i.i.228 = mul nuw i32 %conv6.i.i.225, %shr.i.i.222
  %mul15.i.i.229 = mul nuw i32 %shr3.i.i.223, %shr.i.i.222
  %add.i.i.230 = add i32 %mul9.i.i.227, %mul12.i.i.228
  %cmp.i.i.231 = icmp ult i32 %add.i.i.230, %mul12.i.i.228
  %conv16.i.i.232 = zext i1 %cmp.i.i.231 to i32
  %shl.i.i.233 = shl nuw nsw i32 %conv16.i.i.232, 16
  %shr17.i.i.234 = lshr i32 %add.i.i.230, 16
  %add18.i.i.235 = or i32 %shl.i.i.233, %shr17.i.i.234
  %shl20.i.i.236 = shl i32 %add.i.i.230, 16
  %add21.i.i.237 = add i32 %shl20.i.i.236, %mul.i.i.226
  %cmp22.i.i.238 = icmp ult i32 %add21.i.i.237, %shl20.i.i.236
  %conv23.i.i.239 = zext i1 %cmp22.i.i.238 to i32
  %mul.i.8.i.242 = mul nuw i32 %conv6.i.i.225, %conv5.i.6.i.241.pre-phi
  %mul9.i.9.i.243 = mul nuw i32 %shr3.i.i.223, %conv5.i.6.i.241.pre-phi
  %mul12.i.10.i.244 = mul nuw i32 %conv6.i.i.225, %shr.i.265
  %mul15.i.11.i.245 = mul nuw i32 %shr3.i.i.223, %shr.i.265
  %add.i.12.i.246 = add i32 %mul9.i.9.i.243, %mul12.i.10.i.244
  %cmp.i.13.i.247 = icmp ult i32 %add.i.12.i.246, %mul12.i.10.i.244
  %conv16.i.14.i.248 = zext i1 %cmp.i.13.i.247 to i32
  %shl.i.15.i.249 = shl nuw nsw i32 %conv16.i.14.i.248, 16
  %shr17.i.16.i.250 = lshr i32 %add.i.12.i.246, 16
  %add18.i.17.i.251 = or i32 %shl.i.15.i.249, %shr17.i.16.i.250
  %shl20.i.19.i.253 = shl i32 %add.i.12.i.246, 16
  %add21.i.20.i.254 = add i32 %shl20.i.19.i.253, %mul.i.8.i.242
  %cmp22.i.21.i.255 = icmp ult i32 %add21.i.20.i.254, %shl20.i.19.i.253
  %add19.i.i.258 = add i32 %add21.i.20.i.254, %mul15.i.i.229
  %add24.i.i.259 = add i32 %add19.i.i.258, %add18.i.i.235
  %add.i.2.i.260 = add i32 %add24.i.i.259, %conv23.i.i.239
  %cmp.i.3.i.261 = icmp ult i32 %add.i.2.i.260, %add21.i.20.i.254
  %sub.i.210 = sub i32 0, %add21.i.i.237
  %cmp.i.211 = icmp ne i32 %add21.i.i.237, 0
  %conv.i.212 = zext i1 %cmp.i.211 to i32
  %sub1.i.213 = sub i32 %aSig1.2, %add.i.2.i.260
  %cmp2.i.214 = icmp ult i32 %aSig1.2, %add.i.2.i.260
  %conv23.i.22.i.256.neg = sext i1 %cmp22.i.21.i.255 to i32
  %conv.i.i.262.neg = sext i1 %cmp.i.3.i.261 to i32
  %cmp5.i.216 = icmp ult i32 %sub1.i.213, %conv.i.212
  %conv6.neg.i.217 = sext i1 %cmp5.i.216 to i32
  %sub8.i.218 = sub i32 %sub1.i.213, %conv.i.212
  %conv3.neg.i.219 = sext i1 %cmp2.i.214 to i32
  %add19.i.18.i.252.neg = sub i32 %aSig0.3, %mul15.i.11.i.245
  %add24.i.23.i.257.neg = sub i32 %add19.i.18.i.252.neg, %add18.i.17.i.251
  %add2.i.i.263.neg = add i32 %add24.i.23.i.257.neg, %conv23.i.22.i.256.neg
  %sub4.i.215 = add i32 %add2.i.i.263.neg, %conv.i.i.262.neg
  %sub7.i.220 = add i32 %sub4.i.215, %conv3.neg.i.219
  %sub9.i.221 = add i32 %sub7.i.220, %conv6.neg.i.217
  %cmp90.607 = icmp slt i32 %sub9.i.221, 0
  br i1 %cmp90.607, label %while.body.preheader, label %while.end

while.body.preheader:                             ; preds = %estimateDiv64To32.exit314
  br label %while.body

while.body:                                       ; preds = %while.body.preheader, %while.body
  %rem2.0611 = phi i32 [ %add.i.199, %while.body ], [ %sub.i.210, %while.body.preheader ]
  %rem1.0610 = phi i32 [ %add5.i.205, %while.body ], [ %sub8.i.218, %while.body.preheader ]
  %rem0.0609 = phi i32 [ %add9.i.209, %while.body ], [ %sub9.i.221, %while.body.preheader ]
  %zSig0.0608 = phi i32 [ %dec, %while.body ], [ %retval.0.i.313, %while.body.preheader ]
  %dec = add i32 %zSig0.0608, -1
  %add.i.199 = add i32 %rem2.0611, %shl.i.321
  %cmp.i.200 = icmp ult i32 %add.i.199, %rem2.0611
  %conv.i.201 = zext i1 %cmp.i.200 to i32
  %add1.i.202 = add i32 %rem1.0610, %or.i.323
  %cmp2.i.203 = icmp ult i32 %add1.i.202, %rem1.0610
  %conv3.i.204 = zext i1 %cmp2.i.203 to i32
  %add5.i.205 = add i32 %conv.i.201, %add1.i.202
  %cmp6.i.206 = icmp ult i32 %add5.i.205, %conv.i.201
  %conv7.i.207 = zext i1 %cmp6.i.206 to i32
  %add8.i.208 = add i32 %conv3.i.204, %rem0.0609
  %add9.i.209 = add i32 %add8.i.208, %conv7.i.207
  %cmp90 = icmp slt i32 %add9.i.209, 0
  br i1 %cmp90, label %while.body, label %while.end.loopexit

while.end.loopexit:                               ; preds = %while.body
  %add5.i.205.lcssa = phi i32 [ %add5.i.205, %while.body ]
  %add.i.199.lcssa = phi i32 [ %add.i.199, %while.body ]
  %dec.lcssa = phi i32 [ %dec, %while.body ]
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %estimateDiv64To32.exit314
  %rem2.0.lcssa = phi i32 [ %sub.i.210, %estimateDiv64To32.exit314 ], [ %add.i.199.lcssa, %while.end.loopexit ]
  %rem1.0.lcssa = phi i32 [ %sub8.i.218, %estimateDiv64To32.exit314 ], [ %add5.i.205.lcssa, %while.end.loopexit ]
  %zSig0.0.lcssa = phi i32 [ %retval.0.i.313, %estimateDiv64To32.exit314 ], [ %dec.lcssa, %while.end.loopexit ]
  %cmp.i.186 = icmp ugt i32 %or.i.323, %rem1.0.lcssa
  br i1 %cmp.i.186, label %if.end.i, label %if.end.103

if.end.i:                                         ; preds = %while.end
  %shl.i.188 = shl nuw i32 %shr.i.265, 16
  %cmp1.i = icmp ugt i32 %shl.i.188, %rem1.0.lcssa
  br i1 %cmp1.i, label %cond.false.i, label %cond.end.i

cond.false.i:                                     ; preds = %if.end.i
  %div.i = udiv i32 %rem1.0.lcssa, %shr.i.265
  %shl2.i = shl i32 %div.i, 16
  br label %cond.end.i

cond.end.i:                                       ; preds = %cond.false.i, %if.end.i
  %cond.i = phi i32 [ %shl2.i, %cond.false.i ], [ -65536, %if.end.i ]
  %shr3.i.i.189 = lshr exact i32 %cond.i, 16
  %mul9.i.i.191 = mul nuw i32 %shr3.i.i.189, %conv5.i.6.i.241.pre-phi
  %mul15.i.i.192 = mul nuw i32 %shr3.i.i.189, %shr.i.265
  %shr17.i.i.193 = lshr i32 %mul9.i.i.191, 16
  %shl20.i.i.194 = shl i32 %mul9.i.i.191, 16
  %sub.i.i = sub i32 %rem2.0.lcssa, %shl20.i.i.194
  %cmp.i.39.i = icmp ult i32 %rem2.0.lcssa, %shl20.i.i.194
  %conv.neg.i.i = sext i1 %cmp.i.39.i to i32
  %add24.i.neg.i = sub i32 %rem1.0.lcssa, %mul15.i.i.192
  %sub1.i.i = sub i32 %add24.i.neg.i, %shr17.i.i.193
  %sub2.i.i = add i32 %sub1.i.i, %conv.neg.i.i
  %cmp3.45.i = icmp slt i32 %sub2.i.i, 0
  br i1 %cmp3.45.i, label %while.body.lr.ph.i, label %while.end.i

while.body.lr.ph.i:                               ; preds = %cond.end.i
  %shl4.i = shl i32 %or.i.323, 16
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i, %while.body.lr.ph.i
  %z.048.i = phi i32 [ %cond.i, %while.body.lr.ph.i ], [ %sub.i.195, %while.body.i ]
  %rem0.047.i = phi i32 [ %sub2.i.i, %while.body.lr.ph.i ], [ %add2.i.i.197, %while.body.i ]
  %rem1.046.i = phi i32 [ %sub.i.i, %while.body.lr.ph.i ], [ %add.i.37.i, %while.body.i ]
  %sub.i.195 = add i32 %z.048.i, -65536
  %add.i.37.i = add i32 %rem1.046.i, %shl4.i
  %add1.i.i = add i32 %rem0.047.i, %shr.i.265
  %cmp.i.38.i = icmp ult i32 %add.i.37.i, %rem1.046.i
  %conv.i.i.196 = zext i1 %cmp.i.38.i to i32
  %add2.i.i.197 = add i32 %add1.i.i, %conv.i.i.196
  %cmp3.i = icmp slt i32 %add2.i.i.197, 0
  br i1 %cmp3.i, label %while.body.i, label %while.end.i.loopexit

while.end.i.loopexit:                             ; preds = %while.body.i
  %add2.i.i.197.lcssa = phi i32 [ %add2.i.i.197, %while.body.i ]
  %add.i.37.i.lcssa = phi i32 [ %add.i.37.i, %while.body.i ]
  %sub.i.195.lcssa = phi i32 [ %sub.i.195, %while.body.i ]
  br label %while.end.i

while.end.i:                                      ; preds = %while.end.i.loopexit, %cond.end.i
  %z.0.lcssa.i = phi i32 [ %cond.i, %cond.end.i ], [ %sub.i.195.lcssa, %while.end.i.loopexit ]
  %rem0.0.lcssa.i = phi i32 [ %sub2.i.i, %cond.end.i ], [ %add2.i.i.197.lcssa, %while.end.i.loopexit ]
  %rem1.0.lcssa.i = phi i32 [ %sub.i.i, %cond.end.i ], [ %add.i.37.i.lcssa, %while.end.i.loopexit ]
  %shl5.i = shl i32 %rem0.0.lcssa.i, 16
  %shr6.i = lshr i32 %rem1.0.lcssa.i, 16
  %or.i.198 = or i32 %shr6.i, %shl5.i
  %cmp8.i = icmp ugt i32 %shl.i.188, %or.i.198
  br i1 %cmp8.i, label %cond.false.10.i, label %estimateDiv64To32.exit

cond.false.10.i:                                  ; preds = %while.end.i
  %div11.i = udiv i32 %or.i.198, %shr.i.265
  br label %estimateDiv64To32.exit

estimateDiv64To32.exit:                           ; preds = %while.end.i, %cond.false.10.i
  %cond13.i = phi i32 [ %div11.i, %cond.false.10.i ], [ 65535, %while.end.i ]
  %or14.i = or i32 %cond13.i, %z.0.lcssa.i
  %and = and i32 %or14.i, 1023
  %cmp92 = icmp ult i32 %and, 5
  br i1 %cmp92, label %if.then.93, label %if.end.103

if.then.93:                                       ; preds = %estimateDiv64To32.exit
  %shr3.i.i = lshr i32 %or14.i, 16
  %conv6.i.i = and i32 %or14.i, 65535
  %mul.i.i = mul nuw i32 %conv6.i.i, %conv5.i.i.224
  %mul9.i.i = mul nuw i32 %shr3.i.i, %conv5.i.i.224
  %mul12.i.i = mul nuw i32 %conv6.i.i, %shr.i.i.222
  %mul15.i.i = mul nuw i32 %shr3.i.i, %shr.i.i.222
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
  %mul.i.8.i = mul nuw i32 %conv6.i.i, %conv5.i.6.i.241.pre-phi
  %mul9.i.9.i = mul nuw i32 %shr3.i.i, %conv5.i.6.i.241.pre-phi
  %mul12.i.10.i = mul nuw i32 %conv6.i.i, %shr.i.265
  %mul15.i.11.i = mul nuw i32 %shr3.i.i, %shr.i.265
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
  %cmp.i.183 = icmp ne i32 %add21.i.i, 0
  %conv.i.184 = zext i1 %cmp.i.183 to i32
  %sub1.i = sub i32 %rem2.0.lcssa, %add.i.2.i
  %cmp2.i.185 = icmp ult i32 %rem2.0.lcssa, %add.i.2.i
  %conv23.i.22.i.neg = sext i1 %cmp22.i.21.i to i32
  %conv.i.i.neg = sext i1 %cmp.i.3.i to i32
  %cmp5.i = icmp ult i32 %sub1.i, %conv.i.184
  %conv6.neg.i = sext i1 %cmp5.i to i32
  %sub8.i = sub i32 %sub1.i, %conv.i.184
  %conv3.neg.i = sext i1 %cmp2.i.185 to i32
  %add19.i.18.i.neg = sub i32 %rem1.0.lcssa, %mul15.i.11.i
  %add24.i.23.i.neg = sub i32 %add19.i.18.i.neg, %add18.i.17.i
  %add2.i.i.neg = add i32 %add24.i.23.i.neg, %conv23.i.22.i.neg
  %sub4.i = add i32 %add2.i.i.neg, %conv.i.i.neg
  %sub7.i = add i32 %sub4.i, %conv3.neg.i
  %sub9.i = add i32 %sub7.i, %conv6.neg.i
  %cmp95.599 = icmp slt i32 %sub9.i, 0
  br i1 %cmp95.599, label %while.body.96.preheader, label %while.end.98

while.body.96.preheader:                          ; preds = %if.then.93
  br label %while.body.96

while.body.96:                                    ; preds = %while.body.96.preheader, %while.body.96
  %rem3.0603 = phi i32 [ %add.i, %while.body.96 ], [ %sub.i, %while.body.96.preheader ]
  %rem2.1602 = phi i32 [ %add5.i, %while.body.96 ], [ %sub8.i, %while.body.96.preheader ]
  %rem1.1601 = phi i32 [ %add9.i, %while.body.96 ], [ %sub9.i, %while.body.96.preheader ]
  %zSig1.0600 = phi i32 [ %dec97, %while.body.96 ], [ %or14.i, %while.body.96.preheader ]
  %dec97 = add i32 %zSig1.0600, -1
  %add.i = add i32 %rem3.0603, %shl.i.321
  %cmp.i = icmp ult i32 %add.i, %rem3.0603
  %conv.i = zext i1 %cmp.i to i32
  %add1.i = add i32 %rem2.1602, %or.i.323
  %cmp2.i = icmp ult i32 %add1.i, %rem2.1602
  %conv3.i = zext i1 %cmp2.i to i32
  %add5.i = add i32 %conv.i, %add1.i
  %cmp6.i = icmp ult i32 %add5.i, %conv.i
  %conv7.i = zext i1 %cmp6.i to i32
  %add8.i = add i32 %conv3.i, %rem1.1601
  %add9.i = add i32 %add8.i, %conv7.i
  %cmp95 = icmp slt i32 %add9.i, 0
  br i1 %cmp95, label %while.body.96, label %while.end.98.loopexit

while.end.98.loopexit:                            ; preds = %while.body.96
  %add9.i.lcssa = phi i32 [ %add9.i, %while.body.96 ]
  %add5.i.lcssa = phi i32 [ %add5.i, %while.body.96 ]
  %add.i.lcssa = phi i32 [ %add.i, %while.body.96 ]
  %dec97.lcssa = phi i32 [ %dec97, %while.body.96 ]
  br label %while.end.98

while.end.98:                                     ; preds = %while.end.98.loopexit, %if.then.93
  %rem3.0.lcssa = phi i32 [ %sub.i, %if.then.93 ], [ %add.i.lcssa, %while.end.98.loopexit ]
  %rem2.1.lcssa = phi i32 [ %sub8.i, %if.then.93 ], [ %add5.i.lcssa, %while.end.98.loopexit ]
  %rem1.1.lcssa = phi i32 [ %sub9.i, %if.then.93 ], [ %add9.i.lcssa, %while.end.98.loopexit ]
  %zSig1.0.lcssa = phi i32 [ %or14.i, %if.then.93 ], [ %dec97.lcssa, %while.end.98.loopexit ]
  %or99 = or i32 %rem2.1.lcssa, %rem1.1.lcssa
  %or100 = or i32 %or99, %rem3.0.lcssa
  %cmp101 = icmp ne i32 %or100, 0
  %conv = zext i1 %cmp101 to i32
  %or102 = or i32 %conv, %zSig1.0.lcssa
  br label %if.end.103

if.end.103:                                       ; preds = %while.end, %while.end.98, %estimateDiv64To32.exit
  %zSig1.1 = phi i32 [ %or102, %while.end.98 ], [ %or14.i, %estimateDiv64To32.exit ], [ -1, %while.end ]
  %shl.i = shl i32 %zSig1.1, 21
  %shl3.i = shl i32 %zSig0.0.lcssa, 21
  %shr.i = lshr i32 %zSig1.1, 11
  %or.i = or i32 %shr.i, %shl3.i
  %shr4.i = lshr i32 %zSig0.0.lcssa, 11
  %call104 = tail call fastcc i64 @roundAndPackFloat64(i32 %xor, i32 %zExp.0, i32 %shr4.i, i32 %or.i, i32 %shl.i)
  %retval.sroa.0.0.extract.trunc168 = trunc i64 %call104 to i32
  %retval.sroa.10.0.extract.shift181 = lshr i64 %call104, 32
  %retval.sroa.10.0.extract.trunc182 = trunc i64 %retval.sroa.10.0.extract.shift181 to i32
  br label %cleanup

cleanup:                                          ; preds = %if.end.103, %if.then.79, %if.end.71, %invalid, %if.end.57, %propagateFloat64NaN.exit, %if.end.44, %propagateFloat64NaN.exit469, %propagateFloat64NaN.exit518
  %retval.sroa.0.0 = phi i32 [ %retval.sroa.0.0.i.511, %propagateFloat64NaN.exit518 ], [ %retval.sroa.0.0.i.462, %propagateFloat64NaN.exit469 ], [ -1, %invalid ], [ 0, %if.end.44 ], [ %retval.sroa.0.0.i, %propagateFloat64NaN.exit ], [ 0, %if.end.57 ], [ 0, %if.end.71 ], [ 0, %if.then.79 ], [ %retval.sroa.0.0.extract.trunc168, %if.end.103 ]
  %retval.sroa.10.0 = phi i32 [ %retval.sroa.5.0.i.512, %propagateFloat64NaN.exit518 ], [ %retval.sroa.5.0.i.463, %propagateFloat64NaN.exit469 ], [ 2147483647, %invalid ], [ %add.i.418, %if.end.44 ], [ %retval.sroa.5.0.i, %propagateFloat64NaN.exit ], [ %shl.i.407, %if.end.57 ], [ %add.i.402, %if.end.71 ], [ %shl.i.347, %if.then.79 ], [ %retval.sroa.10.0.extract.trunc182, %if.end.103 ]
  %retval.sroa.10.0.insert.ext = zext i32 %retval.sroa.10.0 to i64
  %retval.sroa.10.0.insert.shift = shl nuw i64 %retval.sroa.10.0.insert.ext, 32
  %retval.sroa.0.0.insert.ext = zext i32 %retval.sroa.0.0 to i64
  %retval.sroa.0.0.insert.insert = or i64 %retval.sroa.10.0.insert.shift, %retval.sroa.0.0.insert.ext
  ret i64 %retval.sroa.0.0.insert.insert
}

; Function Attrs: nounwind
define i64 @float64_rem(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #2 {
entry:
  %and.i = and i32 %a.1, 1048575
  %shr.i.525 = lshr i32 %a.1, 20
  %and.i.526 = and i32 %shr.i.525, 2047
  %shr.i.524 = lshr i32 %a.1, 31
  %and.i.523 = and i32 %b.1, 1048575
  %shr.i.521 = lshr i32 %b.1, 20
  %and.i.522 = and i32 %shr.i.521, 2047
  %cmp = icmp eq i32 %and.i.526, 2047
  br i1 %cmp, label %if.then, label %if.end.36

if.then:                                          ; preds = %entry
  %or = or i32 %and.i, %a.0
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then.30

lor.lhs.false:                                    ; preds = %if.then
  %cmp27 = icmp ne i32 %and.i.522, 2047
  %or28 = or i32 %and.i.523, %b.0
  %tobool29 = icmp eq i32 %or28, 0
  %or.cond603 = or i1 %cmp27, %tobool29
  br i1 %or.cond603, label %invalid, label %if.then.30

if.then.30:                                       ; preds = %lor.lhs.false, %if.then
  %and.i.56.i.472 = and i32 %a.1, 2146959360
  %cmp.i.57.i.473 = icmp eq i32 %and.i.56.i.472, 2146435072
  br i1 %cmp.i.57.i.473, label %land.rhs.i.59.i.475, label %float64_is_signaling_nan.exit64.i.481

land.rhs.i.59.i.475:                              ; preds = %if.then.30
  %tobool.i.58.i.474 = icmp eq i32 %a.0, 0
  br i1 %tobool.i.58.i.474, label %lor.rhs.i.62.i.478, label %float64_is_signaling_nan.exit64.i.481

lor.rhs.i.62.i.478:                               ; preds = %land.rhs.i.59.i.475
  %and4.i.60.i.476 = and i32 %a.1, 524287
  %tobool5.i.61.i.477 = icmp ne i32 %and4.i.60.i.476, 0
  br label %float64_is_signaling_nan.exit64.i.481

float64_is_signaling_nan.exit64.i.481:            ; preds = %lor.rhs.i.62.i.478, %land.rhs.i.59.i.475, %if.then.30
  %0 = phi i1 [ false, %if.then.30 ], [ true, %land.rhs.i.59.i.475 ], [ %tobool5.i.61.i.477, %lor.rhs.i.62.i.478 ]
  %shl.i.i.479 = shl i32 %b.1, 1
  %cmp.i.50.i.480 = icmp ugt i32 %shl.i.i.479, -2097153
  %1 = or i32 %and.i.523, %b.0
  %2 = icmp ne i32 %1, 0
  %3 = and i1 %cmp.i.50.i.480, %2
  %and.i.i.487 = and i32 %b.1, 2146959360
  %cmp.i.i.488 = icmp eq i32 %and.i.i.487, 2146435072
  br i1 %cmp.i.i.488, label %land.rhs.i.i.491, label %float64_is_signaling_nan.exit.i.501

land.rhs.i.i.491:                                 ; preds = %float64_is_signaling_nan.exit64.i.481
  %tobool.i.i.490 = icmp eq i32 %b.0, 0
  br i1 %tobool.i.i.490, label %lor.rhs.i.i.497, label %float64_is_signaling_nan.exit.thread.i.494

float64_is_signaling_nan.exit.thread.i.494:       ; preds = %land.rhs.i.i.491
  %or.66.i.492 = or i32 %a.1, 524288
  %or17.67.i.493 = or i32 %b.1, 524288
  br label %if.then.i.505

lor.rhs.i.i.497:                                  ; preds = %land.rhs.i.i.491
  %and4.i.i.495 = and i32 %b.1, 524287
  %tobool5.i.i.496 = icmp ne i32 %and4.i.i.495, 0
  br label %float64_is_signaling_nan.exit.i.501

float64_is_signaling_nan.exit.i.501:              ; preds = %lor.rhs.i.i.497, %float64_is_signaling_nan.exit64.i.481
  %4 = phi i1 [ false, %float64_is_signaling_nan.exit64.i.481 ], [ %tobool5.i.i.496, %lor.rhs.i.i.497 ]
  %or.i.498 = or i32 %a.1, 524288
  %or17.i.499 = or i32 %b.1, 524288
  %or1865.i.500 = or i1 %0, %4
  br i1 %or1865.i.500, label %if.then.i.505, label %propagateFloat64NaN.exit520

if.then.i.505:                                    ; preds = %float64_is_signaling_nan.exit.i.501, %float64_is_signaling_nan.exit.thread.i.494
  %or1772.i.502 = phi i32 [ %or17.67.i.493, %float64_is_signaling_nan.exit.thread.i.494 ], [ %or17.i.499, %float64_is_signaling_nan.exit.i.501 ]
  %or70.i.503 = phi i32 [ %or.66.i.492, %float64_is_signaling_nan.exit.thread.i.494 ], [ %or.i.498, %float64_is_signaling_nan.exit.i.501 ]
  %5 = phi i1 [ true, %float64_is_signaling_nan.exit.thread.i.494 ], [ %4, %float64_is_signaling_nan.exit.i.501 ]
  %6 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.504 = or i32 %6, 16
  store i32 %or.i.i.504, i32* @float_exception_flags, align 4, !tbaa !1
  br label %propagateFloat64NaN.exit520

propagateFloat64NaN.exit520:                      ; preds = %float64_is_signaling_nan.exit.i.501, %if.then.i.505
  %or186573.i.506 = phi i1 [ false, %float64_is_signaling_nan.exit.i.501 ], [ true, %if.then.i.505 ]
  %or1771.i.507 = phi i32 [ %or17.i.499, %float64_is_signaling_nan.exit.i.501 ], [ %or1772.i.502, %if.then.i.505 ]
  %or69.i.508 = phi i32 [ %or.i.498, %float64_is_signaling_nan.exit.i.501 ], [ %or70.i.503, %if.then.i.505 ]
  %7 = phi i1 [ false, %float64_is_signaling_nan.exit.i.501 ], [ %5, %if.then.i.505 ]
  %b.0.mux.i.509 = select i1 %7, i32 %b.0, i32 %a.0
  %or17.mux.i.510 = select i1 %7, i32 %or1771.i.507, i32 %or69.i.508
  %a.0.b.0.i.511 = select i1 %3, i32 %b.0, i32 %a.0
  %or.or17.i.512 = select i1 %3, i32 %or1771.i.507, i32 %or69.i.508
  %retval.sroa.0.0.i.513 = select i1 %or186573.i.506, i32 %b.0.mux.i.509, i32 %a.0.b.0.i.511
  %retval.sroa.5.0.i.514 = select i1 %or186573.i.506, i32 %or17.mux.i.510, i32 %or.or17.i.512
  br label %cleanup

if.end.36:                                        ; preds = %entry
  switch i32 %and.i.522, label %if.end.57 [
    i32 2047, label %if.then.38
    i32 0, label %if.then.50
  ]

if.then.38:                                       ; preds = %if.end.36
  %or39 = or i32 %and.i.523, %b.0
  %tobool40 = icmp eq i32 %or39, 0
  br i1 %tobool40, label %cleanup, label %if.then.41

if.then.41:                                       ; preds = %if.then.38
  %and.i.56.i = and i32 %a.1, 2146959360
  %cmp.i.57.i = icmp eq i32 %and.i.56.i, 2146435072
  br i1 %cmp.i.57.i, label %land.rhs.i.59.i, label %float64_is_signaling_nan.exit64.i

land.rhs.i.59.i:                                  ; preds = %if.then.41
  %tobool.i.58.i = icmp eq i32 %a.0, 0
  br i1 %tobool.i.58.i, label %lor.rhs.i.62.i, label %float64_is_signaling_nan.exit64.i

lor.rhs.i.62.i:                                   ; preds = %land.rhs.i.59.i
  %and4.i.60.i = and i32 %a.1, 524287
  %tobool5.i.61.i = icmp ne i32 %and4.i.60.i, 0
  br label %float64_is_signaling_nan.exit64.i

float64_is_signaling_nan.exit64.i:                ; preds = %lor.rhs.i.62.i, %land.rhs.i.59.i, %if.then.41
  %8 = phi i1 [ false, %if.then.41 ], [ true, %land.rhs.i.59.i ], [ %tobool5.i.61.i, %lor.rhs.i.62.i ]
  %shl.i.i.465 = shl i32 %b.1, 1
  %cmp.i.50.i = icmp ugt i32 %shl.i.i.465, -2097153
  %and.i.i.466 = and i32 %b.1, 2146959360
  %cmp.i.i.467 = icmp eq i32 %and.i.i.466, 2146435072
  br i1 %cmp.i.i.467, label %land.rhs.i.i, label %float64_is_signaling_nan.exit.i

land.rhs.i.i:                                     ; preds = %float64_is_signaling_nan.exit64.i
  %tobool.i.i = icmp eq i32 %b.0, 0
  br i1 %tobool.i.i, label %lor.rhs.i.i, label %float64_is_signaling_nan.exit.thread.i

float64_is_signaling_nan.exit.thread.i:           ; preds = %land.rhs.i.i
  %or.66.i = or i32 %a.1, 524288
  %or17.67.i = or i32 %b.1, 524288
  br label %if.then.i.470

lor.rhs.i.i:                                      ; preds = %land.rhs.i.i
  %and4.i.i = and i32 %b.1, 524287
  %tobool5.i.i = icmp ne i32 %and4.i.i, 0
  br label %float64_is_signaling_nan.exit.i

float64_is_signaling_nan.exit.i:                  ; preds = %lor.rhs.i.i, %float64_is_signaling_nan.exit64.i
  %9 = phi i1 [ false, %float64_is_signaling_nan.exit64.i ], [ %tobool5.i.i, %lor.rhs.i.i ]
  %or.i.468 = or i32 %a.1, 524288
  %or17.i = or i32 %b.1, 524288
  %or1865.i = or i1 %8, %9
  br i1 %or1865.i, label %if.then.i.470, label %propagateFloat64NaN.exit

if.then.i.470:                                    ; preds = %float64_is_signaling_nan.exit.i, %float64_is_signaling_nan.exit.thread.i
  %or1772.i = phi i32 [ %or17.67.i, %float64_is_signaling_nan.exit.thread.i ], [ %or17.i, %float64_is_signaling_nan.exit.i ]
  %or70.i = phi i32 [ %or.66.i, %float64_is_signaling_nan.exit.thread.i ], [ %or.i.468, %float64_is_signaling_nan.exit.i ]
  %10 = phi i1 [ true, %float64_is_signaling_nan.exit.thread.i ], [ %9, %float64_is_signaling_nan.exit.i ]
  %11 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.469 = or i32 %11, 16
  store i32 %or.i.i.469, i32* @float_exception_flags, align 4, !tbaa !1
  br label %propagateFloat64NaN.exit

propagateFloat64NaN.exit:                         ; preds = %float64_is_signaling_nan.exit.i, %if.then.i.470
  %or186573.i = phi i1 [ false, %float64_is_signaling_nan.exit.i ], [ true, %if.then.i.470 ]
  %or1771.i = phi i32 [ %or17.i, %float64_is_signaling_nan.exit.i ], [ %or1772.i, %if.then.i.470 ]
  %or69.i = phi i32 [ %or.i.468, %float64_is_signaling_nan.exit.i ], [ %or70.i, %if.then.i.470 ]
  %12 = phi i1 [ false, %float64_is_signaling_nan.exit.i ], [ %10, %if.then.i.470 ]
  %b.0.mux.i = select i1 %12, i32 %b.0, i32 %a.0
  %or17.mux.i = select i1 %12, i32 %or1771.i, i32 %or69.i
  %a.0.b.0.i = select i1 %cmp.i.50.i, i32 %b.0, i32 %a.0
  %or.or17.i = select i1 %cmp.i.50.i, i32 %or1771.i, i32 %or69.i
  %retval.sroa.0.0.i = select i1 %or186573.i, i32 %b.0.mux.i, i32 %a.0.b.0.i
  %retval.sroa.5.0.i = select i1 %or186573.i, i32 %or17.mux.i, i32 %or.or17.i
  br label %cleanup

if.then.50:                                       ; preds = %if.end.36
  %or51 = or i32 %and.i.523, %b.0
  %cmp52 = icmp eq i32 %or51, 0
  br i1 %cmp52, label %invalid, label %if.end.56

invalid:                                          ; preds = %lor.lhs.false, %if.then.50
  %13 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.464 = or i32 %13, 16
  store i32 %or.i.464, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.56:                                        ; preds = %if.then.50
  %cmp.i.411 = icmp eq i32 %and.i.523, 0
  br i1 %cmp.i.411, label %if.then.i.426, label %if.else.7.i.452

if.then.i.426:                                    ; preds = %if.end.56
  %cmp.i.i.412 = icmp ult i32 %b.0, 65536
  %shl.i.i.413 = shl i32 %b.0, 16
  %shl.a.i.i.414 = select i1 %cmp.i.i.412, i32 %shl.i.i.413, i32 %b.0
  %..i.i.415 = select i1 %cmp.i.i.412, i32 16, i32 0
  %cmp1.i.i.416 = icmp ult i32 %shl.a.i.i.414, 16777216
  %add3.i.i.417 = or i32 %..i.i.415, 8
  %shl4.i.i.418 = shl i32 %shl.a.i.i.414, 8
  %a.addr.1.i.i.419 = select i1 %cmp1.i.i.416, i32 %shl4.i.i.418, i32 %shl.a.i.i.414
  %shiftCount.1.i.i.420 = select i1 %cmp1.i.i.416, i32 %add3.i.i.417, i32 %..i.i.415
  %shr.i.i.421 = lshr i32 %a.addr.1.i.i.419, 24
  %arrayidx.i.i.422 = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.i.421
  %14 = load i32, i32* %arrayidx.i.i.422, align 4, !tbaa !1
  %add6.i.i.423 = add nsw i32 %14, %shiftCount.1.i.i.420
  %sub.i.424 = add nsw i32 %add6.i.i.423, -11
  %cmp1.i.425 = icmp slt i32 %add6.i.i.423, 11
  br i1 %cmp1.i.425, label %if.then.2.i.431, label %if.else.i.433

if.then.2.i.431:                                  ; preds = %if.then.i.426
  %sub3.i.427 = sub i32 11, %add6.i.i.423
  %shr.i.428 = lshr i32 %b.0, %sub3.i.427
  %and.i.429 = and i32 %sub.i.424, 31
  %shl.i.430 = shl i32 %b.0, %and.i.429
  br label %if.end.i.436

if.else.i.433:                                    ; preds = %if.then.i.426
  %shl4.i.432 = shl i32 %b.0, %sub.i.424
  br label %if.end.i.436

if.end.i.436:                                     ; preds = %if.else.i.433, %if.then.2.i.431
  %bSig0.0 = phi i32 [ %shr.i.428, %if.then.2.i.431 ], [ %shl4.i.432, %if.else.i.433 ]
  %storemerge.28.i.434 = phi i32 [ %shl.i.430, %if.then.2.i.431 ], [ 0, %if.else.i.433 ]
  %sub6.i.435 = sub i32 -20, %add6.i.i.423
  br label %if.end.57

if.else.7.i.452:                                  ; preds = %if.end.56
  %cmp.i.32.i.437 = icmp ult i32 %and.i.523, 65536
  %shl.i.33.i.438 = shl i32 %b.1, 16
  %shl.a.i.34.i.439 = select i1 %cmp.i.32.i.437, i32 %shl.i.33.i.438, i32 %and.i.523
  %..i.35.i.440 = select i1 %cmp.i.32.i.437, i32 16, i32 0
  %cmp1.i.36.i.441 = icmp ult i32 %shl.a.i.34.i.439, 16777216
  %add3.i.37.i.442 = or i32 %..i.35.i.440, 8
  %shl4.i.38.i.443 = shl i32 %shl.a.i.34.i.439, 8
  %a.addr.1.i.39.i.444 = select i1 %cmp1.i.36.i.441, i32 %shl4.i.38.i.443, i32 %shl.a.i.34.i.439
  %shiftCount.1.i.40.i.445 = select i1 %cmp1.i.36.i.441, i32 %add3.i.37.i.442, i32 %..i.35.i.440
  %shr.i.41.i.446 = lshr i32 %a.addr.1.i.39.i.444, 24
  %arrayidx.i.42.i.447 = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.41.i.446
  %15 = load i32, i32* %arrayidx.i.42.i.447, align 4, !tbaa !1
  %add6.i.43.i.448 = add nsw i32 %15, %shiftCount.1.i.40.i.445
  %sub9.i.449 = add nsw i32 %add6.i.43.i.448, -11
  %shl.i.29.i.450 = shl i32 %b.0, %sub9.i.449
  %cmp.i.30.i.451 = icmp eq i32 %sub9.i.449, 0
  br i1 %cmp.i.30.i.451, label %shortShift64Left.exit.i.461, label %cond.false.i.i.458

cond.false.i.i.458:                               ; preds = %if.else.7.i.452
  %shl1.i.i.453 = shl i32 %and.i.523, %sub9.i.449
  %sub.i.i.454 = sub i32 11, %add6.i.43.i.448
  %and.i.i.455 = and i32 %sub.i.i.454, 31
  %shr.i.31.i.456 = lshr i32 %b.0, %and.i.i.455
  %or.i.i.457 = or i32 %shr.i.31.i.456, %shl1.i.i.453
  br label %shortShift64Left.exit.i.461

shortShift64Left.exit.i.461:                      ; preds = %cond.false.i.i.458, %if.else.7.i.452
  %cond.i.i.459 = phi i32 [ %or.i.i.457, %cond.false.i.i.458 ], [ %and.i.523, %if.else.7.i.452 ]
  %sub10.i.460 = sub i32 12, %add6.i.43.i.448
  br label %if.end.57

if.end.57:                                        ; preds = %shortShift64Left.exit.i.461, %if.end.i.436, %if.end.36
  %bSig0.2 = phi i32 [ %and.i.523, %if.end.36 ], [ %bSig0.0, %if.end.i.436 ], [ %cond.i.i.459, %shortShift64Left.exit.i.461 ]
  %bSig1.1 = phi i32 [ %b.0, %if.end.36 ], [ %storemerge.28.i.434, %if.end.i.436 ], [ %shl.i.29.i.450, %shortShift64Left.exit.i.461 ]
  %bExp.0 = phi i32 [ %and.i.522, %if.end.36 ], [ %sub6.i.435, %if.end.i.436 ], [ %sub10.i.460, %shortShift64Left.exit.i.461 ]
  %cmp58 = icmp eq i32 %and.i.526, 0
  br i1 %cmp58, label %if.then.59, label %if.end.64

if.then.59:                                       ; preds = %if.end.57
  %or60 = or i32 %and.i, %a.0
  %cmp61 = icmp eq i32 %or60, 0
  br i1 %cmp61, label %cleanup, label %if.end.63

if.end.63:                                        ; preds = %if.then.59
  %cmp.i.397 = icmp eq i32 %and.i, 0
  br i1 %cmp.i.397, label %if.then.i, label %if.else.7.i

if.then.i:                                        ; preds = %if.end.63
  %cmp.i.i.398 = icmp ult i32 %a.0, 65536
  %shl.i.i.399 = shl i32 %a.0, 16
  %shl.a.i.i = select i1 %cmp.i.i.398, i32 %shl.i.i.399, i32 %a.0
  %..i.i = select i1 %cmp.i.i.398, i32 16, i32 0
  %cmp1.i.i = icmp ult i32 %shl.a.i.i, 16777216
  %add3.i.i = or i32 %..i.i, 8
  %shl4.i.i = shl i32 %shl.a.i.i, 8
  %a.addr.1.i.i = select i1 %cmp1.i.i, i32 %shl4.i.i, i32 %shl.a.i.i
  %shiftCount.1.i.i = select i1 %cmp1.i.i, i32 %add3.i.i, i32 %..i.i
  %shr.i.i.400 = lshr i32 %a.addr.1.i.i, 24
  %arrayidx.i.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.i.400
  %16 = load i32, i32* %arrayidx.i.i, align 4, !tbaa !1
  %add6.i.i = add nsw i32 %16, %shiftCount.1.i.i
  %sub.i.401 = add nsw i32 %add6.i.i, -11
  %cmp1.i.402 = icmp slt i32 %add6.i.i, 11
  br i1 %cmp1.i.402, label %if.then.2.i.406, label %if.else.i.408

if.then.2.i.406:                                  ; preds = %if.then.i
  %sub3.i = sub i32 11, %add6.i.i
  %shr.i.403 = lshr i32 %a.0, %sub3.i
  %and.i.404 = and i32 %sub.i.401, 31
  %shl.i.405 = shl i32 %a.0, %and.i.404
  br label %if.end.i.409

if.else.i.408:                                    ; preds = %if.then.i
  %shl4.i.407 = shl i32 %a.0, %sub.i.401
  br label %if.end.i.409

if.end.i.409:                                     ; preds = %if.else.i.408, %if.then.2.i.406
  %aSig0.0 = phi i32 [ %shr.i.403, %if.then.2.i.406 ], [ %shl4.i.407, %if.else.i.408 ]
  %storemerge.28.i = phi i32 [ %shl.i.405, %if.then.2.i.406 ], [ 0, %if.else.i.408 ]
  %sub6.i = sub i32 -20, %add6.i.i
  br label %if.end.64

if.else.7.i:                                      ; preds = %if.end.63
  %cmp.i.32.i = icmp ult i32 %and.i, 65536
  %shl.i.33.i = shl i32 %a.1, 16
  %shl.a.i.34.i = select i1 %cmp.i.32.i, i32 %shl.i.33.i, i32 %and.i
  %..i.35.i = select i1 %cmp.i.32.i, i32 16, i32 0
  %cmp1.i.36.i = icmp ult i32 %shl.a.i.34.i, 16777216
  %add3.i.37.i = or i32 %..i.35.i, 8
  %shl4.i.38.i = shl i32 %shl.a.i.34.i, 8
  %a.addr.1.i.39.i = select i1 %cmp1.i.36.i, i32 %shl4.i.38.i, i32 %shl.a.i.34.i
  %shiftCount.1.i.40.i = select i1 %cmp1.i.36.i, i32 %add3.i.37.i, i32 %..i.35.i
  %shr.i.41.i = lshr i32 %a.addr.1.i.39.i, 24
  %arrayidx.i.42.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.41.i
  %17 = load i32, i32* %arrayidx.i.42.i, align 4, !tbaa !1
  %add6.i.43.i = add nsw i32 %17, %shiftCount.1.i.40.i
  %sub9.i = add nsw i32 %add6.i.43.i, -11
  %shl.i.29.i = shl i32 %a.0, %sub9.i
  %cmp.i.30.i = icmp eq i32 %sub9.i, 0
  br i1 %cmp.i.30.i, label %shortShift64Left.exit.i, label %cond.false.i.i

cond.false.i.i:                                   ; preds = %if.else.7.i
  %shl1.i.i = shl i32 %and.i, %sub9.i
  %sub.i.i.410 = sub i32 11, %add6.i.43.i
  %and.i.i = and i32 %sub.i.i.410, 31
  %shr.i.31.i = lshr i32 %a.0, %and.i.i
  %or.i.i = or i32 %shr.i.31.i, %shl1.i.i
  br label %shortShift64Left.exit.i

shortShift64Left.exit.i:                          ; preds = %cond.false.i.i, %if.else.7.i
  %cond.i.i = phi i32 [ %or.i.i, %cond.false.i.i ], [ %and.i, %if.else.7.i ]
  %sub10.i = sub i32 12, %add6.i.43.i
  br label %if.end.64

if.end.64:                                        ; preds = %shortShift64Left.exit.i, %if.end.i.409, %if.end.57
  %aSig1.1 = phi i32 [ %a.0, %if.end.57 ], [ %storemerge.28.i, %if.end.i.409 ], [ %shl.i.29.i, %shortShift64Left.exit.i ]
  %aSig0.2 = phi i32 [ %and.i, %if.end.57 ], [ %aSig0.0, %if.end.i.409 ], [ %cond.i.i, %shortShift64Left.exit.i ]
  %aExp.0 = phi i32 [ %and.i.526, %if.end.57 ], [ %sub6.i, %if.end.i.409 ], [ %sub10.i, %shortShift64Left.exit.i ]
  %sub = sub nsw i32 %aExp.0, %bExp.0
  %cmp65 = icmp slt i32 %sub, -1
  br i1 %cmp65, label %cleanup, label %if.end.67

if.end.67:                                        ; preds = %if.end.64
  %or68 = or i32 %aSig0.2, 1048576
  %sub.lobit = lshr i32 %sub, 31
  %sub70 = sub nsw i32 11, %sub.lobit
  %shl.i.388 = shl i32 %aSig1.1, %sub70
  %shl1.i.389 = shl i32 %or68, %sub70
  %sub.i.390 = sub nsw i32 0, %sub70
  %and.i.391 = and i32 %sub.i.390, 23
  %shr.i.392 = lshr i32 %aSig1.1, %and.i.391
  %or.i.393 = or i32 %shr.i.392, %shl1.i.389
  %shl.i.381 = shl i32 %bSig1.1, 11
  %or71 = shl i32 %bSig0.2, 11
  %shl1.i.382 = or i32 %or71, -2147483648
  %shr.i.383 = lshr i32 %bSig1.1, 21
  %or.i.384 = or i32 %shr.i.383, %shl1.i.382
  %cmp.i.379 = icmp ugt i32 %or.i.393, %or.i.384
  br i1 %cmp.i.379, label %if.then.74, label %le64.exit

le64.exit:                                        ; preds = %if.end.67
  %cmp1.i.380 = icmp eq i32 %or.i.393, %or.i.384
  %cmp2.i = icmp uge i32 %shl.i.388, %shl.i.381
  %cmp2..i = and i1 %cmp2.i, %cmp1.i.380
  %lor.ext.i = zext i1 %cmp2..i to i32
  br i1 %cmp2..i, label %if.then.74, label %if.end.75

if.then.74:                                       ; preds = %if.end.67, %le64.exit
  %lor.ext.i619 = phi i32 [ %lor.ext.i, %le64.exit ], [ 1, %if.end.67 ]
  %sub.i.374 = sub i32 %shl.i.388, %shl.i.381
  %sub1.i.375 = sub i32 %or.i.393, %or.i.384
  %cmp.i.376 = icmp ult i32 %shl.i.388, %shl.i.381
  %conv.neg.i.377 = sext i1 %cmp.i.376 to i32
  %sub2.i.378 = add i32 %sub1.i.375, %conv.neg.i.377
  br label %if.end.75

if.end.75:                                        ; preds = %le64.exit, %if.then.74
  %lor.ext.i618 = phi i32 [ %lor.ext.i, %le64.exit ], [ %lor.ext.i619, %if.then.74 ]
  %aSig1.2 = phi i32 [ %shl.i.388, %le64.exit ], [ %sub.i.374, %if.then.74 ]
  %aSig0.3 = phi i32 [ %or.i.393, %le64.exit ], [ %sub2.i.378, %if.then.74 ]
  %sub76 = add nsw i32 %sub, -32
  %cmp77.606 = icmp sgt i32 %sub, 32
  br i1 %cmp77.606, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %if.end.75
  %shr.i.324 = lshr i32 %shl1.i.382, 16
  %shl.i.325 = shl nuw i32 %shr.i.324, 16
  %conv5.i.i.333 = and i32 %or.i.384, 65535
  %shl4.i.346 = shl i32 %or.i.384, 16
  %18 = lshr i32 %bSig1.1, 5
  %shr.i.i.281 = and i32 %18, 65535
  %conv5.i.i.283 = and i32 %shl.i.381, 63488
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %estimateDiv64To32.exit373
  %expDiff.0611 = phi i32 [ %sub76, %while.body.lr.ph ], [ %sub83, %estimateDiv64To32.exit373 ]
  %aSig0.4609 = phi i32 [ %aSig0.3, %while.body.lr.ph ], [ %sub2.i.264, %estimateDiv64To32.exit373 ]
  %aSig1.3607 = phi i32 [ %aSig1.2, %while.body.lr.ph ], [ %sub.i.260, %estimateDiv64To32.exit373 ]
  %cmp.i.323 = icmp ugt i32 %or.i.384, %aSig0.4609
  br i1 %cmp.i.323, label %if.end.i.327, label %estimateDiv64To32.exit373

if.end.i.327:                                     ; preds = %while.body
  %cmp1.i.326 = icmp ugt i32 %shl.i.325, %aSig0.4609
  br i1 %cmp1.i.326, label %cond.false.i.330, label %cond.end.i.345

cond.false.i.330:                                 ; preds = %if.end.i.327
  %div.i.328 = udiv i32 %aSig0.4609, %shr.i.324
  %shl2.i.329 = shl i32 %div.i.328, 16
  br label %cond.end.i.345

cond.end.i.345:                                   ; preds = %cond.false.i.330, %if.end.i.327
  %cond.i.331 = phi i32 [ %shl2.i.329, %cond.false.i.330 ], [ -65536, %if.end.i.327 ]
  %shr3.i.i.332 = lshr exact i32 %cond.i.331, 16
  %mul9.i.i.334 = mul nuw i32 %shr3.i.i.332, %conv5.i.i.333
  %mul15.i.i.335 = mul nuw i32 %shr3.i.i.332, %shr.i.324
  %shr17.i.i.336 = lshr i32 %mul9.i.i.334, 16
  %shl20.i.i.337 = shl i32 %mul9.i.i.334, 16
  %sub.i.i.338 = sub i32 %aSig1.3607, %shl20.i.i.337
  %cmp.i.39.i.339 = icmp ult i32 %aSig1.3607, %shl20.i.i.337
  %conv.neg.i.i.340 = sext i1 %cmp.i.39.i.339 to i32
  %add24.i.neg.i.341 = sub i32 %aSig0.4609, %mul15.i.i.335
  %sub1.i.i.342 = sub i32 %add24.i.neg.i.341, %shr17.i.i.336
  %sub2.i.i.343 = add i32 %sub1.i.i.342, %conv.neg.i.i.340
  %cmp3.45.i.344 = icmp slt i32 %sub2.i.i.343, 0
  br i1 %cmp3.45.i.344, label %while.body.i.358.preheader, label %while.end.i.366

while.body.i.358.preheader:                       ; preds = %cond.end.i.345
  br label %while.body.i.358

while.body.i.358:                                 ; preds = %while.body.i.358.preheader, %while.body.i.358
  %z.048.i.348 = phi i32 [ %sub.i.351, %while.body.i.358 ], [ %cond.i.331, %while.body.i.358.preheader ]
  %rem0.047.i.349 = phi i32 [ %add2.i.i.356, %while.body.i.358 ], [ %sub2.i.i.343, %while.body.i.358.preheader ]
  %rem1.046.i.350 = phi i32 [ %add.i.37.i.352, %while.body.i.358 ], [ %sub.i.i.338, %while.body.i.358.preheader ]
  %sub.i.351 = add i32 %z.048.i.348, -65536
  %add.i.37.i.352 = add i32 %rem1.046.i.350, %shl4.i.346
  %add1.i.i.353 = add i32 %rem0.047.i.349, %shr.i.324
  %cmp.i.38.i.354 = icmp ult i32 %add.i.37.i.352, %rem1.046.i.350
  %conv.i.i.355 = zext i1 %cmp.i.38.i.354 to i32
  %add2.i.i.356 = add i32 %add1.i.i.353, %conv.i.i.355
  %cmp3.i.357 = icmp slt i32 %add2.i.i.356, 0
  br i1 %cmp3.i.357, label %while.body.i.358, label %while.end.i.366.loopexit

while.end.i.366.loopexit:                         ; preds = %while.body.i.358
  %add2.i.i.356.lcssa = phi i32 [ %add2.i.i.356, %while.body.i.358 ]
  %add.i.37.i.352.lcssa = phi i32 [ %add.i.37.i.352, %while.body.i.358 ]
  %sub.i.351.lcssa = phi i32 [ %sub.i.351, %while.body.i.358 ]
  br label %while.end.i.366

while.end.i.366:                                  ; preds = %while.end.i.366.loopexit, %cond.end.i.345
  %z.0.lcssa.i.359 = phi i32 [ %cond.i.331, %cond.end.i.345 ], [ %sub.i.351.lcssa, %while.end.i.366.loopexit ]
  %rem0.0.lcssa.i.360 = phi i32 [ %sub2.i.i.343, %cond.end.i.345 ], [ %add2.i.i.356.lcssa, %while.end.i.366.loopexit ]
  %rem1.0.lcssa.i.361 = phi i32 [ %sub.i.i.338, %cond.end.i.345 ], [ %add.i.37.i.352.lcssa, %while.end.i.366.loopexit ]
  %shl5.i.362 = shl i32 %rem0.0.lcssa.i.360, 16
  %shr6.i.363 = lshr i32 %rem1.0.lcssa.i.361, 16
  %or.i.364 = or i32 %shr6.i.363, %shl5.i.362
  %cmp8.i.365 = icmp ugt i32 %shl.i.325, %or.i.364
  br i1 %cmp8.i.365, label %cond.false.10.i.368, label %cond.end.12.i.371

cond.false.10.i.368:                              ; preds = %while.end.i.366
  %div11.i.367 = udiv i32 %or.i.364, %shr.i.324
  br label %cond.end.12.i.371

cond.end.12.i.371:                                ; preds = %cond.false.10.i.368, %while.end.i.366
  %cond13.i.369 = phi i32 [ %div11.i.367, %cond.false.10.i.368 ], [ 65535, %while.end.i.366 ]
  %or14.i.370 = or i32 %cond13.i.369, %z.0.lcssa.i.359
  br label %estimateDiv64To32.exit373

estimateDiv64To32.exit373:                        ; preds = %while.body, %cond.end.12.i.371
  %retval.0.i.372 = phi i32 [ %or14.i.370, %cond.end.12.i.371 ], [ -1, %while.body ]
  %cmp80 = icmp ugt i32 %retval.0.i.372, 4
  %sub82 = add i32 %retval.0.i.372, -4
  %cond = select i1 %cmp80, i32 %sub82, i32 0
  %shr3.i.i.282 = lshr i32 %cond, 16
  %conv6.i.i.284 = and i32 %cond, 65535
  %mul.i.i.285 = mul nuw i32 %conv6.i.i.284, %conv5.i.i.283
  %mul9.i.i.286 = mul nuw i32 %shr3.i.i.282, %conv5.i.i.283
  %mul12.i.i.287 = mul nuw i32 %conv6.i.i.284, %shr.i.i.281
  %mul15.i.i.288 = mul nuw i32 %shr3.i.i.282, %shr.i.i.281
  %add.i.i.289 = add i32 %mul9.i.i.286, %mul12.i.i.287
  %cmp.i.i.290 = icmp ult i32 %add.i.i.289, %mul12.i.i.287
  %conv16.i.i.291 = zext i1 %cmp.i.i.290 to i32
  %shl.i.i.292 = shl nuw nsw i32 %conv16.i.i.291, 16
  %shr17.i.i.293 = lshr i32 %add.i.i.289, 16
  %add18.i.i.294 = or i32 %shl.i.i.292, %shr17.i.i.293
  %shl20.i.i.295 = shl i32 %add.i.i.289, 16
  %add21.i.i.296 = add i32 %shl20.i.i.295, %mul.i.i.285
  %cmp22.i.i.297 = icmp ult i32 %add21.i.i.296, %shl20.i.i.295
  %conv23.i.i.298 = zext i1 %cmp22.i.i.297 to i32
  %mul.i.8.i.301 = mul nuw i32 %conv6.i.i.284, %conv5.i.i.333
  %mul9.i.9.i.302 = mul nuw i32 %shr3.i.i.282, %conv5.i.i.333
  %mul12.i.10.i.303 = mul nuw i32 %conv6.i.i.284, %shr.i.324
  %mul15.i.11.i.304 = mul nuw i32 %shr3.i.i.282, %shr.i.324
  %add.i.12.i.305 = add i32 %mul9.i.9.i.302, %mul12.i.10.i.303
  %shr17.i.16.i.309 = lshr i32 %add.i.12.i.305, 16
  %add19.i.18.i.311 = add i32 %shr17.i.16.i.309, %mul15.i.11.i.304
  %shl20.i.19.i.312 = shl i32 %add.i.12.i.305, 16
  %add21.i.20.i.313 = add i32 %shl20.i.19.i.312, %mul.i.8.i.301
  %cmp22.i.21.i.314 = icmp ult i32 %add21.i.20.i.313, %shl20.i.19.i.312
  %conv23.i.22.i.315 = zext i1 %cmp22.i.21.i.314 to i32
  %add24.i.23.i.316 = add i32 %add19.i.18.i.311, %conv23.i.22.i.315
  %add19.i.i.317 = add i32 %add21.i.20.i.313, %mul15.i.i.288
  %add24.i.i.318 = add i32 %add19.i.i.317, %add18.i.i.294
  %add.i.2.i.319 = add i32 %add24.i.i.318, %conv23.i.i.298
  %cmp.i.3.i.320 = icmp ult i32 %add.i.2.i.319, %add21.i.20.i.313
  %conv.i.i.321 = zext i1 %cmp.i.3.i.320 to i32
  %add2.i.i.322 = add i32 %add24.i.23.i.316, %conv.i.i.321
  %shl1.i.273 = shl i32 %add.i.2.i.319, 29
  %shl2.i.274 = shl i32 %add2.i.i.322, 29
  %shr.i.275 = lshr exact i32 %add21.i.i.296, 3
  %or.i.276 = or i32 %shl1.i.273, %shr.i.275
  %shr3.i.277 = lshr i32 %add.i.2.i.319, 3
  %or4.i = or i32 %shl2.i.274, %shr3.i.277
  %shl1.i.266 = shl i32 %aSig0.4609, 29
  %shr.i.267 = lshr i32 %aSig1.3607, 3
  %or.i.268 = or i32 %shl1.i.266, %shr.i.267
  %sub.i.260 = sub i32 0, %or.i.276
  %cmp.i.262 = icmp ne i32 %or.i.276, 0
  %conv.neg.i.263 = sext i1 %cmp.i.262 to i32
  %sub1.i.261 = add i32 %conv.neg.i.263, %or.i.268
  %sub2.i.264 = sub i32 %sub1.i.261, %or4.i
  %sub83 = add nsw i32 %expDiff.0611, -29
  %cmp77 = icmp sgt i32 %expDiff.0611, 29
  br i1 %cmp77, label %while.body, label %while.end.loopexit

while.end.loopexit:                               ; preds = %estimateDiv64To32.exit373
  %sub83.lcssa = phi i32 [ %sub83, %estimateDiv64To32.exit373 ]
  %sub2.i.264.lcssa = phi i32 [ %sub2.i.264, %estimateDiv64To32.exit373 ]
  %sub.i.260.lcssa = phi i32 [ %sub.i.260, %estimateDiv64To32.exit373 ]
  %cond.lcssa = phi i32 [ %cond, %estimateDiv64To32.exit373 ]
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %if.end.75
  %expDiff.0.lcssa = phi i32 [ %sub76, %if.end.75 ], [ %sub83.lcssa, %while.end.loopexit ]
  %q.0.lcssa = phi i32 [ %lor.ext.i618, %if.end.75 ], [ %cond.lcssa, %while.end.loopexit ]
  %aSig0.4.lcssa = phi i32 [ %aSig0.3, %if.end.75 ], [ %sub2.i.264.lcssa, %while.end.loopexit ]
  %aSig1.3.lcssa = phi i32 [ %aSig1.2, %if.end.75 ], [ %sub.i.260.lcssa, %while.end.loopexit ]
  %cmp84 = icmp sgt i32 %expDiff.0.lcssa, -32
  br i1 %cmp84, label %if.then.86, label %if.else.101

if.then.86:                                       ; preds = %while.end
  %cmp.i.244 = icmp ugt i32 %or.i.384, %aSig0.4.lcssa
  br i1 %cmp.i.244, label %if.end.i, label %estimateDiv64To32.exit

if.end.i:                                         ; preds = %if.then.86
  %shr.i.245 = lshr i32 %shl1.i.382, 16
  %shl.i.246 = shl nuw i32 %shr.i.245, 16
  %cmp1.i.247 = icmp ugt i32 %shl.i.246, %aSig0.4.lcssa
  br i1 %cmp1.i.247, label %cond.false.i.248, label %cond.end.i

cond.false.i.248:                                 ; preds = %if.end.i
  %div.i = udiv i32 %aSig0.4.lcssa, %shr.i.245
  %shl2.i = shl i32 %div.i, 16
  br label %cond.end.i

cond.end.i:                                       ; preds = %cond.false.i.248, %if.end.i
  %cond.i.249 = phi i32 [ %shl2.i, %cond.false.i.248 ], [ -65536, %if.end.i ]
  %shr3.i.i.250 = lshr exact i32 %cond.i.249, 16
  %conv5.i.i.251 = and i32 %or.i.384, 65535
  %mul9.i.i.252 = mul nuw i32 %shr3.i.i.250, %conv5.i.i.251
  %mul15.i.i.253 = mul nuw i32 %shr3.i.i.250, %shr.i.245
  %shr17.i.i.254 = lshr i32 %mul9.i.i.252, 16
  %shl20.i.i.255 = shl i32 %mul9.i.i.252, 16
  %sub.i.i = sub i32 %aSig1.3.lcssa, %shl20.i.i.255
  %cmp.i.39.i = icmp ult i32 %aSig1.3.lcssa, %shl20.i.i.255
  %conv.neg.i.i = sext i1 %cmp.i.39.i to i32
  %add24.i.neg.i = sub i32 %aSig0.4.lcssa, %mul15.i.i.253
  %sub1.i.i = sub i32 %add24.i.neg.i, %shr17.i.i.254
  %sub2.i.i = add i32 %sub1.i.i, %conv.neg.i.i
  %cmp3.45.i = icmp slt i32 %sub2.i.i, 0
  br i1 %cmp3.45.i, label %while.body.lr.ph.i, label %while.end.i

while.body.lr.ph.i:                               ; preds = %cond.end.i
  %shl4.i = shl i32 %or.i.384, 16
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i, %while.body.lr.ph.i
  %z.048.i = phi i32 [ %cond.i.249, %while.body.lr.ph.i ], [ %sub.i.256, %while.body.i ]
  %rem0.047.i = phi i32 [ %sub2.i.i, %while.body.lr.ph.i ], [ %add2.i.i.258, %while.body.i ]
  %rem1.046.i = phi i32 [ %sub.i.i, %while.body.lr.ph.i ], [ %add.i.37.i, %while.body.i ]
  %sub.i.256 = add i32 %z.048.i, -65536
  %add.i.37.i = add i32 %rem1.046.i, %shl4.i
  %add1.i.i = add i32 %rem0.047.i, %shr.i.245
  %cmp.i.38.i = icmp ult i32 %add.i.37.i, %rem1.046.i
  %conv.i.i.257 = zext i1 %cmp.i.38.i to i32
  %add2.i.i.258 = add i32 %add1.i.i, %conv.i.i.257
  %cmp3.i = icmp slt i32 %add2.i.i.258, 0
  br i1 %cmp3.i, label %while.body.i, label %while.end.i.loopexit

while.end.i.loopexit:                             ; preds = %while.body.i
  %add2.i.i.258.lcssa = phi i32 [ %add2.i.i.258, %while.body.i ]
  %add.i.37.i.lcssa = phi i32 [ %add.i.37.i, %while.body.i ]
  %sub.i.256.lcssa = phi i32 [ %sub.i.256, %while.body.i ]
  br label %while.end.i

while.end.i:                                      ; preds = %while.end.i.loopexit, %cond.end.i
  %z.0.lcssa.i = phi i32 [ %cond.i.249, %cond.end.i ], [ %sub.i.256.lcssa, %while.end.i.loopexit ]
  %rem0.0.lcssa.i = phi i32 [ %sub2.i.i, %cond.end.i ], [ %add2.i.i.258.lcssa, %while.end.i.loopexit ]
  %rem1.0.lcssa.i = phi i32 [ %sub.i.i, %cond.end.i ], [ %add.i.37.i.lcssa, %while.end.i.loopexit ]
  %shl5.i = shl i32 %rem0.0.lcssa.i, 16
  %shr6.i = lshr i32 %rem1.0.lcssa.i, 16
  %or.i.259 = or i32 %shr6.i, %shl5.i
  %cmp8.i = icmp ugt i32 %shl.i.246, %or.i.259
  br i1 %cmp8.i, label %cond.false.10.i, label %cond.end.12.i

cond.false.10.i:                                  ; preds = %while.end.i
  %div11.i = udiv i32 %or.i.259, %shr.i.245
  br label %cond.end.12.i

cond.end.12.i:                                    ; preds = %cond.false.10.i, %while.end.i
  %cond13.i = phi i32 [ %div11.i, %cond.false.10.i ], [ 65535, %while.end.i ]
  %or14.i = or i32 %cond13.i, %z.0.lcssa.i
  br label %estimateDiv64To32.exit

estimateDiv64To32.exit:                           ; preds = %if.then.86, %cond.end.12.i
  %retval.0.i = phi i32 [ %or14.i, %cond.end.12.i ], [ -1, %if.then.86 ]
  %cmp88 = icmp ugt i32 %retval.0.i, 4
  %sub91 = add i32 %retval.0.i, -4
  %cond94 = select i1 %cmp88, i32 %sub91, i32 0
  %sub95 = sub nsw i32 0, %expDiff.0.lcssa
  %shr = lshr i32 %cond94, %sub95
  %shl.i.237 = shl i32 %shr.i.383, 24
  %19 = shl i32 %bSig1.1, 3
  %shr.i.238 = and i32 %19, 16777208
  %or.i.239 = or i32 %shl.i.237, %shr.i.238
  %shr3.i.240 = lshr i32 %or.i.384, 8
  %cmp96 = icmp slt i32 %expDiff.0.lcssa, -24
  br i1 %cmp96, label %if.then.98, label %if.else

if.then.98:                                       ; preds = %estimateDiv64To32.exit
  %sub99 = sub i32 -24, %expDiff.0.lcssa
  %sub.i.228 = sub nsw i32 0, %sub99
  %and.i.229 = and i32 %sub.i.228, 31
  %cmp.i.230 = icmp eq i32 %sub99, 0
  br i1 %cmp.i.230, label %if.end.100, label %if.else.i

if.else.i:                                        ; preds = %if.then.98
  %cmp1.i = icmp slt i32 %sub99, 32
  br i1 %cmp1.i, label %if.then.2.i, label %if.else.4.i

if.then.2.i:                                      ; preds = %if.else.i
  %shl.i.231 = shl i32 %aSig0.4.lcssa, %and.i.229
  %shr.i.232 = lshr i32 %aSig1.3.lcssa, %sub99
  %or.i.233 = or i32 %shl.i.231, %shr.i.232
  %shr3.i.234 = lshr i32 %aSig0.4.lcssa, %sub99
  br label %if.end.100

if.else.4.i:                                      ; preds = %if.else.i
  %cmp5.i = icmp slt i32 %sub99, 64
  %and6.i = and i32 %sub99, 31
  %shr7.i = lshr i32 %aSig0.4.lcssa, %and6.i
  %cond.i.235 = select i1 %cmp5.i, i32 %shr7.i, i32 0
  br label %if.end.100

if.else:                                          ; preds = %estimateDiv64To32.exit
  %add = add nsw i32 %expDiff.0.lcssa, 24
  %shl.i.222 = shl i32 %aSig1.3.lcssa, %add
  %cmp.i.223 = icmp eq i32 %add, 0
  br i1 %cmp.i.223, label %if.end.100, label %cond.false.i

cond.false.i:                                     ; preds = %if.else
  %shl1.i = shl i32 %aSig0.4.lcssa, %add
  %sub.i.224 = sub i32 -24, %expDiff.0.lcssa
  %and.i.225 = and i32 %sub.i.224, 31
  %shr.i.226 = lshr i32 %aSig1.3.lcssa, %and.i.225
  %or.i.227 = or i32 %shr.i.226, %shl1.i
  br label %if.end.100

if.end.100:                                       ; preds = %cond.false.i, %if.else, %if.else.4.i, %if.then.2.i, %if.then.98
  %aSig1.4 = phi i32 [ %or.i.233, %if.then.2.i ], [ %aSig1.3.lcssa, %if.then.98 ], [ %cond.i.235, %if.else.4.i ], [ %shl.i.222, %if.else ], [ %shl.i.222, %cond.false.i ]
  %aSig0.5 = phi i32 [ %shr3.i.234, %if.then.2.i ], [ %aSig0.4.lcssa, %if.then.98 ], [ 0, %if.else.4.i ], [ %aSig0.4.lcssa, %if.else ], [ %or.i.227, %cond.false.i ]
  %shr.i.i = lshr i32 %or.i.239, 16
  %shr3.i.i = lshr i32 %shr, 16
  %conv5.i.i = and i32 %19, 65528
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
  %shr.i.4.i = lshr i32 %shl1.i.382, 24
  %conv5.i.6.i = and i32 %shr3.i.240, 65535
  %mul.i.8.i = mul nuw i32 %conv6.i.i, %conv5.i.6.i
  %mul9.i.9.i = mul nuw i32 %shr3.i.i, %conv5.i.6.i
  %mul12.i.10.i = mul nuw nsw i32 %conv6.i.i, %shr.i.4.i
  %add.i.12.i = add i32 %mul9.i.9.i, %mul12.i.10.i
  %shl20.i.19.i = shl i32 %add.i.12.i, 16
  %sub.i.217 = sub i32 %aSig1.4, %add21.i.i
  %conv23.i.i.neg = sext i1 %cmp22.i.i to i32
  %cmp.i.219 = icmp ult i32 %aSig1.4, %add21.i.i
  %conv.neg.i.220 = sext i1 %cmp.i.219 to i32
  %sum = add i32 %mul15.i.i, %mul.i.8.i
  %sum615 = add i32 %sum, %shl20.i.19.i
  %sum616 = add i32 %sum615, %add18.i.i
  %add.i.2.i.neg = sub i32 %conv23.i.i.neg, %sum616
  %sub1.i.218 = add i32 %add.i.2.i.neg, %aSig0.5
  %sub2.i.221 = add i32 %sub1.i.218, %conv.neg.i.220
  br label %do.body.preheader

if.else.101:                                      ; preds = %while.end
  %shl.i.213 = shl i32 %aSig0.4.lcssa, 24
  %shr.i.214 = lshr i32 %aSig1.3.lcssa, 8
  %or.i.215 = or i32 %shl.i.213, %shr.i.214
  %shr3.i.216 = lshr i32 %aSig0.4.lcssa, 8
  %shl.i = shl i32 %shr.i.383, 24
  %20 = shl i32 %bSig1.1, 3
  %shr.i = and i32 %20, 16777208
  %or.i = or i32 %shl.i, %shr.i
  %shr3.i = lshr i32 %or.i.384, 8
  br label %do.body.preheader

do.body.preheader:                                ; preds = %if.else.101, %if.end.100
  %aSig1.5.ph = phi i32 [ %or.i.215, %if.else.101 ], [ %sub.i.217, %if.end.100 ]
  %bSig0.3.ph = phi i32 [ %shr3.i, %if.else.101 ], [ %shr3.i.240, %if.end.100 ]
  %bSig1.2.ph = phi i32 [ %or.i, %if.else.101 ], [ %or.i.239, %if.end.100 ]
  %aSig0.6.ph = phi i32 [ %shr3.i.216, %if.else.101 ], [ %sub2.i.221, %if.end.100 ]
  %q.1.ph = phi i32 [ %q.0.lcssa, %if.else.101 ], [ %shr, %if.end.100 ]
  br label %do.body

do.body:                                          ; preds = %do.body.preheader, %do.body
  %aSig1.5 = phi i32 [ %sub.i.208, %do.body ], [ %aSig1.5.ph, %do.body.preheader ]
  %aSig0.6 = phi i32 [ %sub2.i.212, %do.body ], [ %aSig0.6.ph, %do.body.preheader ]
  %q.1 = phi i32 [ %inc, %do.body ], [ %q.1.ph, %do.body.preheader ]
  %inc = add i32 %q.1, 1
  %sub.i.208 = sub i32 %aSig1.5, %bSig1.2.ph
  %sub1.i.209 = sub i32 %aSig0.6, %bSig0.3.ph
  %cmp.i.210 = icmp ult i32 %aSig1.5, %bSig1.2.ph
  %conv.neg.i.211 = sext i1 %cmp.i.210 to i32
  %sub2.i.212 = add i32 %sub1.i.209, %conv.neg.i.211
  %cmp103 = icmp sgt i32 %sub2.i.212, -1
  br i1 %cmp103, label %do.body, label %do.end

do.end:                                           ; preds = %do.body
  %sub2.i.212.lcssa = phi i32 [ %sub2.i.212, %do.body ]
  %sub.i.208.lcssa = phi i32 [ %sub.i.208, %do.body ]
  %inc.lcssa = phi i32 [ %inc, %do.body ]
  %aSig0.6.lcssa = phi i32 [ %aSig0.6, %do.body ]
  %aSig1.5.lcssa = phi i32 [ %aSig1.5, %do.body ]
  %add.i = add i32 %sub.i.208.lcssa, %aSig1.5.lcssa
  %add1.i = add i32 %sub2.i.212.lcssa, %aSig0.6.lcssa
  %cmp.i.207 = icmp ult i32 %add.i, %sub.i.208.lcssa
  %conv.i = zext i1 %cmp.i.207 to i32
  %add2.i = add i32 %add1.i, %conv.i
  %cmp105 = icmp slt i32 %add2.i, 0
  br i1 %cmp105, label %if.end.114, label %lor.lhs.false.107

lor.lhs.false.107:                                ; preds = %do.end
  %or108 = or i32 %add2.i, %add.i
  %cmp109 = icmp ne i32 %or108, 0
  %and = and i32 %inc.lcssa, 1
  %tobool112 = icmp eq i32 %and, 0
  %or.cond = or i1 %tobool112, %cmp109
  br i1 %or.cond, label %if.then.118, label %if.end.114

if.end.114:                                       ; preds = %do.end, %lor.lhs.false.107
  %cmp115 = icmp slt i32 %aSig0.6.lcssa, 0
  %.lobit = lshr i32 %aSig0.6.lcssa, 31
  br i1 %cmp115, label %if.then.118, label %if.end.119

if.then.118:                                      ; preds = %lor.lhs.false.107, %if.end.114
  %.lobit602 = phi i32 [ %.lobit, %if.end.114 ], [ 1, %lor.lhs.false.107 ]
  %aSig0.7600 = phi i32 [ %aSig0.6.lcssa, %if.end.114 ], [ %sub2.i.212.lcssa, %lor.lhs.false.107 ]
  %aSig1.6599 = phi i32 [ %aSig1.5.lcssa, %if.end.114 ], [ %sub.i.208.lcssa, %lor.lhs.false.107 ]
  %sub.i = sub i32 0, %aSig1.6599
  %cmp.i = icmp ne i32 %aSig1.6599, 0
  %conv.neg.i = sext i1 %cmp.i to i32
  %sub2.i = sub i32 %conv.neg.i, %aSig0.7600
  br label %if.end.119

if.end.119:                                       ; preds = %if.then.118, %if.end.114
  %.lobit601 = phi i32 [ %.lobit602, %if.then.118 ], [ %.lobit, %if.end.114 ]
  %aSig1.7 = phi i32 [ %sub.i, %if.then.118 ], [ %aSig1.5.lcssa, %if.end.114 ]
  %aSig0.8 = phi i32 [ %sub2.i, %if.then.118 ], [ %aSig0.6.lcssa, %if.end.114 ]
  %xor = xor i32 %.lobit601, %shr.i.524
  %sub120 = add nsw i32 %bExp.0, -4
  %call121 = tail call fastcc i64 @normalizeRoundAndPackFloat64(i32 %xor, i32 %sub120, i32 %aSig0.8, i32 %aSig1.7)
  %retval.sroa.0.0.extract.trunc202 = trunc i64 %call121 to i32
  %retval.sroa.8.0.extract.shift205 = lshr i64 %call121, 32
  %retval.sroa.8.0.extract.trunc206 = trunc i64 %retval.sroa.8.0.extract.shift205 to i32
  br label %cleanup

cleanup:                                          ; preds = %if.end.64, %if.then.59, %if.then.38, %if.end.119, %invalid, %propagateFloat64NaN.exit, %propagateFloat64NaN.exit520
  %retval.sroa.0.0 = phi i32 [ %retval.sroa.0.0.i.513, %propagateFloat64NaN.exit520 ], [ -1, %invalid ], [ %retval.sroa.0.0.i, %propagateFloat64NaN.exit ], [ %retval.sroa.0.0.extract.trunc202, %if.end.119 ], [ %a.0, %if.then.38 ], [ %a.0, %if.then.59 ], [ %a.0, %if.end.64 ]
  %retval.sroa.8.0 = phi i32 [ %retval.sroa.5.0.i.514, %propagateFloat64NaN.exit520 ], [ 2147483647, %invalid ], [ %retval.sroa.5.0.i, %propagateFloat64NaN.exit ], [ %retval.sroa.8.0.extract.trunc206, %if.end.119 ], [ %a.1, %if.then.38 ], [ %a.1, %if.then.59 ], [ %a.1, %if.end.64 ]
  %retval.sroa.8.0.insert.ext = zext i32 %retval.sroa.8.0 to i64
  %retval.sroa.8.0.insert.shift = shl nuw i64 %retval.sroa.8.0.insert.ext, 32
  %retval.sroa.0.0.insert.ext = zext i32 %retval.sroa.0.0 to i64
  %retval.sroa.0.0.insert.insert = or i64 %retval.sroa.8.0.insert.shift, %retval.sroa.0.0.insert.ext
  ret i64 %retval.sroa.0.0.insert.insert
}

; Function Attrs: nounwind
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
  %arrayidx.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i
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
  %call7 = tail call fastcc i64 @roundAndPackFloat64(i32 %zSign, i32 %sub6, i32 %zSig0.addr.1, i32 %zSig1.addr.1, i32 %zSig2.0)
  ret i64 %call7
}

; Function Attrs: nounwind
define i64 @float64_sqrt(i32 %a.0, i32 %a.1) #2 {
entry:
  %and.i = and i32 %a.1, 1048575
  %shr.i.286 = lshr i32 %a.1, 20
  %and.i.287 = and i32 %shr.i.286, 2047
  %shr.i.285 = lshr i32 %a.1, 31
  %cmp = icmp eq i32 %and.i.287, 2047
  br i1 %cmp, label %if.then, label %if.end.21

if.then:                                          ; preds = %entry
  %or = or i32 %and.i, %a.0
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %if.end, label %if.then.12

if.then.12:                                       ; preds = %if.then
  %and.i.56.i = and i32 %a.1, 2146959360
  %cmp.i.57.i = icmp eq i32 %and.i.56.i, 2146435072
  br i1 %cmp.i.57.i, label %land.rhs.i.59.i, label %float64_is_signaling_nan.exit.i

land.rhs.i.59.i:                                  ; preds = %if.then.12
  %tobool.i.58.i = icmp eq i32 %a.0, 0
  br i1 %tobool.i.58.i, label %lor.rhs.i.i, label %float64_is_signaling_nan.exit.thread.i

float64_is_signaling_nan.exit.thread.i:           ; preds = %land.rhs.i.59.i
  %or.66.i = or i32 %a.1, 524288
  br label %if.then.i.283

lor.rhs.i.i:                                      ; preds = %land.rhs.i.59.i
  %and4.i.60.i = and i32 %a.1, 524287
  %tobool5.i.61.i = icmp ne i32 %and4.i.60.i, 0
  %and4.i.i = and i32 %a.1, 524287
  %tobool5.i.i = icmp ne i32 %and4.i.i, 0
  br label %float64_is_signaling_nan.exit.i

float64_is_signaling_nan.exit.i:                  ; preds = %if.then.12, %lor.rhs.i.i
  %0 = phi i1 [ %tobool5.i.61.i, %lor.rhs.i.i ], [ false, %if.then.12 ]
  %1 = phi i1 [ %tobool5.i.i, %lor.rhs.i.i ], [ false, %if.then.12 ]
  %or.i.281 = or i32 %a.1, 524288
  %or1865.i = or i1 %0, %1
  br i1 %or1865.i, label %if.then.i.283, label %cleanup

if.then.i.283:                                    ; preds = %float64_is_signaling_nan.exit.i, %float64_is_signaling_nan.exit.thread.i
  %or1772.i = phi i32 [ %or.66.i, %float64_is_signaling_nan.exit.thread.i ], [ %or.i.281, %float64_is_signaling_nan.exit.i ]
  %2 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.i.282 = or i32 %2, 16
  store i32 %or.i.i.282, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end:                                           ; preds = %if.then
  %tobool18 = icmp eq i32 %shr.i.285, 0
  br i1 %tobool18, label %cleanup, label %invalid

if.end.21:                                        ; preds = %entry
  %tobool22 = icmp eq i32 %shr.i.285, 0
  br i1 %tobool22, label %if.end.31, label %if.then.23

if.then.23:                                       ; preds = %if.end.21
  %or24 = or i32 %and.i, %a.0
  %or25 = or i32 %or24, %and.i.287
  %cmp26 = icmp eq i32 %or25, 0
  br i1 %cmp26, label %cleanup, label %invalid

invalid:                                          ; preds = %if.end, %if.then.23
  %3 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.277 = or i32 %3, 16
  store i32 %or.i.277, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.31:                                        ; preds = %if.end.21
  %cmp32 = icmp eq i32 %and.i.287, 0
  br i1 %cmp32, label %if.then.33, label %if.end.39

if.then.33:                                       ; preds = %if.end.31
  %or34 = or i32 %and.i, %a.0
  %cmp35 = icmp eq i32 %or34, 0
  br i1 %cmp35, label %cleanup, label %if.end.38

if.end.38:                                        ; preds = %if.then.33
  %cmp.i.264 = icmp eq i32 %and.i, 0
  br i1 %cmp.i.264, label %if.then.i.267, label %if.else.7.i

if.then.i.267:                                    ; preds = %if.end.38
  %cmp.i.i = icmp ult i32 %a.0, 65536
  %shl.i.i = shl i32 %a.0, 16
  %shl.a.i.i = select i1 %cmp.i.i, i32 %shl.i.i, i32 %a.0
  %..i.i = select i1 %cmp.i.i, i32 16, i32 0
  %cmp1.i.i = icmp ult i32 %shl.a.i.i, 16777216
  %add3.i.i = or i32 %..i.i, 8
  %shl4.i.i = shl i32 %shl.a.i.i, 8
  %a.addr.1.i.i = select i1 %cmp1.i.i, i32 %shl4.i.i, i32 %shl.a.i.i
  %shiftCount.1.i.i = select i1 %cmp1.i.i, i32 %add3.i.i, i32 %..i.i
  %shr.i.i = lshr i32 %a.addr.1.i.i, 24
  %arrayidx.i.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.i
  %4 = load i32, i32* %arrayidx.i.i, align 4, !tbaa !1
  %add6.i.i = add nsw i32 %4, %shiftCount.1.i.i
  %sub.i.265 = add nsw i32 %add6.i.i, -11
  %cmp1.i.266 = icmp slt i32 %add6.i.i, 11
  br i1 %cmp1.i.266, label %if.then.2.i, label %if.else.i.272

if.then.2.i:                                      ; preds = %if.then.i.267
  %sub3.i = sub i32 11, %add6.i.i
  %shr.i.268 = lshr i32 %a.0, %sub3.i
  %and.i.269 = and i32 %sub.i.265, 31
  %shl.i.270 = shl i32 %a.0, %and.i.269
  br label %if.end.i.273

if.else.i.272:                                    ; preds = %if.then.i.267
  %shl4.i.271 = shl i32 %a.0, %sub.i.265
  br label %if.end.i.273

if.end.i.273:                                     ; preds = %if.else.i.272, %if.then.2.i
  %aSig0.0 = phi i32 [ %shr.i.268, %if.then.2.i ], [ %shl4.i.271, %if.else.i.272 ]
  %storemerge.28.i = phi i32 [ %shl.i.270, %if.then.2.i ], [ 0, %if.else.i.272 ]
  %sub6.i = sub i32 -20, %add6.i.i
  br label %if.end.39

if.else.7.i:                                      ; preds = %if.end.38
  %cmp.i.32.i = icmp ult i32 %and.i, 65536
  %shl.i.33.i = shl i32 %a.1, 16
  %shl.a.i.34.i = select i1 %cmp.i.32.i, i32 %shl.i.33.i, i32 %and.i
  %..i.35.i = select i1 %cmp.i.32.i, i32 16, i32 0
  %cmp1.i.36.i = icmp ult i32 %shl.a.i.34.i, 16777216
  %add3.i.37.i = or i32 %..i.35.i, 8
  %shl4.i.38.i = shl i32 %shl.a.i.34.i, 8
  %a.addr.1.i.39.i = select i1 %cmp1.i.36.i, i32 %shl4.i.38.i, i32 %shl.a.i.34.i
  %shiftCount.1.i.40.i = select i1 %cmp1.i.36.i, i32 %add3.i.37.i, i32 %..i.35.i
  %shr.i.41.i = lshr i32 %a.addr.1.i.39.i, 24
  %arrayidx.i.42.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.41.i
  %5 = load i32, i32* %arrayidx.i.42.i, align 4, !tbaa !1
  %add6.i.43.i = add nsw i32 %5, %shiftCount.1.i.40.i
  %sub9.i.274 = add nsw i32 %add6.i.43.i, -11
  %shl.i.29.i = shl i32 %a.0, %sub9.i.274
  %cmp.i.30.i = icmp eq i32 %sub9.i.274, 0
  br i1 %cmp.i.30.i, label %shortShift64Left.exit.i, label %cond.false.i.i

cond.false.i.i:                                   ; preds = %if.else.7.i
  %shl1.i.i = shl i32 %and.i, %sub9.i.274
  %sub.i.i.275 = sub i32 11, %add6.i.43.i
  %and.i.i = and i32 %sub.i.i.275, 31
  %shr.i.31.i = lshr i32 %a.0, %and.i.i
  %or.i.i = or i32 %shr.i.31.i, %shl1.i.i
  br label %shortShift64Left.exit.i

shortShift64Left.exit.i:                          ; preds = %cond.false.i.i, %if.else.7.i
  %cond.i.i = phi i32 [ %or.i.i, %cond.false.i.i ], [ %and.i, %if.else.7.i ]
  %sub10.i.276 = sub i32 12, %add6.i.43.i
  br label %if.end.39

if.end.39:                                        ; preds = %shortShift64Left.exit.i, %if.end.i.273, %if.end.31
  %aSig0.2 = phi i32 [ %and.i, %if.end.31 ], [ %aSig0.0, %if.end.i.273 ], [ %cond.i.i, %shortShift64Left.exit.i ]
  %aSig1.1 = phi i32 [ %a.0, %if.end.31 ], [ %storemerge.28.i, %if.end.i.273 ], [ %shl.i.29.i, %shortShift64Left.exit.i ]
  %aExp.0 = phi i32 [ %and.i.287, %if.end.31 ], [ %sub6.i, %if.end.i.273 ], [ %sub10.i.276, %shortShift64Left.exit.i ]
  %sub = add nsw i32 %aExp.0, -1023
  %shr = ashr i32 %sub, 1
  %add = add nsw i32 %shr, 1022
  %or40 = or i32 %aSig0.2, 1048576
  %shl1.i.258 = shl i32 %or40, 11
  %shr.i.259 = lshr i32 %aSig1.1, 21
  %or.i.260 = or i32 %shr.i.259, %shl1.i.258
  %6 = lshr i32 %aSig0.2, 16
  %and.i.195 = and i32 %6, 15
  %and1.i = and i32 %aExp.0, 1
  %tobool.i = icmp eq i32 %and1.i, 0
  %7 = lshr i32 %or40, 6
  %shr2.i = and i32 %7, 32767
  br i1 %tobool.i, label %if.else.i, label %if.then.i

if.then.i:                                        ; preds = %if.end.39
  %add.i.196 = add nuw nsw i32 %shr2.i, 16384
  %arrayidx.i = getelementptr inbounds [16 x i16], [16 x i16]* @estimateSqrt32.sqrtOddAdjustments, i32 0, i32 %and.i.195
  %8 = load i16, i16* %arrayidx.i, align 2, !tbaa !8
  %conv.i.197 = zext i16 %8 to i32
  %sub.i.198 = sub nsw i32 %add.i.196, %conv.i.197
  %div.i.199 = udiv i32 %or.i.260, %sub.i.198
  %shl.i.200 = shl i32 %div.i.199, 14
  %shl3.i.201 = shl i32 %sub.i.198, 15
  %add4.i = add i32 %shl3.i.201, %shl.i.200
  %shr5.i = lshr i32 %or.i.260, 1
  br label %if.end.19.i

if.else.i:                                        ; preds = %if.end.39
  %add7.i = or i32 %shr2.i, 32768
  %arrayidx8.i = getelementptr inbounds [16 x i16], [16 x i16]* @estimateSqrt32.sqrtEvenAdjustments, i32 0, i32 %and.i.195
  %9 = load i16, i16* %arrayidx8.i, align 2, !tbaa !8
  %conv9.i = zext i16 %9 to i32
  %sub10.i = sub nsw i32 %add7.i, %conv9.i
  %div11.i.202 = udiv i32 %or.i.260, %sub10.i
  %add12.i = add i32 %sub10.i, %div11.i.202
  %cmp.i.203 = icmp ugt i32 %add12.i, 131071
  %shl14.i = shl i32 %add12.i, 15
  %cond.i.204 = select i1 %cmp.i.203, i32 -32768, i32 %shl14.i
  %cmp15.i = icmp ugt i32 %cond.i.204, %or.i.260
  br i1 %cmp15.i, label %if.end.19.i, label %if.then.17.i

if.then.17.i:                                     ; preds = %if.else.i
  %shr18.i = ashr i32 %or.i.260, 1
  br label %estimateSqrt32.exit

if.end.19.i:                                      ; preds = %if.else.i, %if.then.i
  %a.addr.0.i = phi i32 [ %shr5.i, %if.then.i ], [ %or.i.260, %if.else.i ]
  %z.0.i = phi i32 [ %add4.i, %if.then.i ], [ %cond.i.204, %if.else.i ]
  %cmp.i.206 = icmp ugt i32 %z.0.i, %a.addr.0.i
  br i1 %cmp.i.206, label %if.end.i.210, label %estimateDiv64To32.exit256

if.end.i.210:                                     ; preds = %if.end.19.i
  %shr.i.207 = lshr i32 %z.0.i, 16
  %shl.i.208 = shl nuw i32 %shr.i.207, 16
  %cmp1.i.209 = icmp ugt i32 %shl.i.208, %a.addr.0.i
  br i1 %cmp1.i.209, label %cond.false.i.213, label %cond.end.i.228

cond.false.i.213:                                 ; preds = %if.end.i.210
  %div.i.211 = udiv i32 %a.addr.0.i, %shr.i.207
  %shl2.i.212 = shl i32 %div.i.211, 16
  br label %cond.end.i.228

cond.end.i.228:                                   ; preds = %cond.false.i.213, %if.end.i.210
  %cond.i.214 = phi i32 [ %shl2.i.212, %cond.false.i.213 ], [ -65536, %if.end.i.210 ]
  %shr3.i.i.215 = lshr exact i32 %cond.i.214, 16
  %conv5.i.i.216 = and i32 %z.0.i, 65535
  %mul9.i.i.217 = mul nuw i32 %shr3.i.i.215, %conv5.i.i.216
  %mul15.i.i.218 = mul nuw i32 %shr3.i.i.215, %shr.i.207
  %shr17.i.i.219 = lshr i32 %mul9.i.i.217, 16
  %shl20.i.i.220 = shl i32 %mul9.i.i.217, 16
  %sub.i.i.221 = sub i32 0, %shl20.i.i.220
  %cmp.i.39.i.222 = icmp ne i32 %shl20.i.i.220, 0
  %conv.neg.i.i.223 = sext i1 %cmp.i.39.i.222 to i32
  %add24.i.neg.i.224 = sub i32 %a.addr.0.i, %mul15.i.i.218
  %sub1.i.i.225 = sub i32 %add24.i.neg.i.224, %shr17.i.i.219
  %sub2.i.i.226 = add i32 %sub1.i.i.225, %conv.neg.i.i.223
  %cmp3.45.i.227 = icmp slt i32 %sub2.i.i.226, 0
  br i1 %cmp3.45.i.227, label %while.body.lr.ph.i.230, label %while.end.i.249

while.body.lr.ph.i.230:                           ; preds = %cond.end.i.228
  %shl4.i.229 = shl i32 %z.0.i, 16
  br label %while.body.i.241

while.body.i.241:                                 ; preds = %while.body.i.241, %while.body.lr.ph.i.230
  %z.048.i.231 = phi i32 [ %cond.i.214, %while.body.lr.ph.i.230 ], [ %sub.i.234, %while.body.i.241 ]
  %rem0.047.i.232 = phi i32 [ %sub2.i.i.226, %while.body.lr.ph.i.230 ], [ %add2.i.i.239, %while.body.i.241 ]
  %rem1.046.i.233 = phi i32 [ %sub.i.i.221, %while.body.lr.ph.i.230 ], [ %add.i.37.i.235, %while.body.i.241 ]
  %sub.i.234 = add i32 %z.048.i.231, -65536
  %add.i.37.i.235 = add i32 %rem1.046.i.233, %shl4.i.229
  %add1.i.i.236 = add i32 %rem0.047.i.232, %shr.i.207
  %cmp.i.38.i.237 = icmp ult i32 %add.i.37.i.235, %rem1.046.i.233
  %conv.i.i.238 = zext i1 %cmp.i.38.i.237 to i32
  %add2.i.i.239 = add i32 %add1.i.i.236, %conv.i.i.238
  %cmp3.i.240 = icmp slt i32 %add2.i.i.239, 0
  br i1 %cmp3.i.240, label %while.body.i.241, label %while.end.i.249.loopexit

while.end.i.249.loopexit:                         ; preds = %while.body.i.241
  %add2.i.i.239.lcssa = phi i32 [ %add2.i.i.239, %while.body.i.241 ]
  %add.i.37.i.235.lcssa = phi i32 [ %add.i.37.i.235, %while.body.i.241 ]
  %sub.i.234.lcssa = phi i32 [ %sub.i.234, %while.body.i.241 ]
  br label %while.end.i.249

while.end.i.249:                                  ; preds = %while.end.i.249.loopexit, %cond.end.i.228
  %z.0.lcssa.i.242 = phi i32 [ %cond.i.214, %cond.end.i.228 ], [ %sub.i.234.lcssa, %while.end.i.249.loopexit ]
  %rem0.0.lcssa.i.243 = phi i32 [ %sub2.i.i.226, %cond.end.i.228 ], [ %add2.i.i.239.lcssa, %while.end.i.249.loopexit ]
  %rem1.0.lcssa.i.244 = phi i32 [ %sub.i.i.221, %cond.end.i.228 ], [ %add.i.37.i.235.lcssa, %while.end.i.249.loopexit ]
  %shl5.i.245 = shl i32 %rem0.0.lcssa.i.243, 16
  %shr6.i.246 = lshr i32 %rem1.0.lcssa.i.244, 16
  %or.i.247 = or i32 %shr6.i.246, %shl5.i.245
  %cmp8.i.248 = icmp ugt i32 %shl.i.208, %or.i.247
  br i1 %cmp8.i.248, label %cond.false.10.i.251, label %cond.end.12.i.254

cond.false.10.i.251:                              ; preds = %while.end.i.249
  %div11.i.250 = udiv i32 %or.i.247, %shr.i.207
  br label %cond.end.12.i.254

cond.end.12.i.254:                                ; preds = %cond.false.10.i.251, %while.end.i.249
  %cond13.i.252 = phi i32 [ %div11.i.250, %cond.false.10.i.251 ], [ 65535, %while.end.i.249 ]
  %or14.i.253 = or i32 %cond13.i.252, %z.0.lcssa.i.242
  %phitmp = lshr i32 %or14.i.253, 1
  br label %estimateDiv64To32.exit256

estimateDiv64To32.exit256:                        ; preds = %if.end.19.i, %cond.end.12.i.254
  %retval.0.i.255 = phi i32 [ %phitmp, %cond.end.12.i.254 ], [ 2147483647, %if.end.19.i ]
  %shr21.i = lshr i32 %z.0.i, 1
  %add22.i = add nuw i32 %retval.0.i.255, %shr21.i
  br label %estimateSqrt32.exit

estimateSqrt32.exit:                              ; preds = %if.then.17.i, %estimateDiv64To32.exit256
  %retval.0.i.205 = phi i32 [ %add22.i, %estimateDiv64To32.exit256 ], [ %shr18.i, %if.then.17.i ]
  %shr42 = lshr i32 %retval.0.i.205, 1
  %add43 = add nuw i32 %shr42, 1
  %add47 = shl i32 %add43, 1
  %sub48 = sub nsw i32 9, %and1.i
  %shl.i.186 = shl i32 %aSig1.1, %sub48
  %shl1.i = shl i32 %or40, %sub48
  %sub.i.187 = sub nsw i32 0, %sub48
  %and.i.188 = and i32 %sub.i.187, 31
  %shr.i.189 = lshr i32 %aSig1.1, %and.i.188
  %or.i.190 = or i32 %shr.i.189, %shl1.i
  %shr.i.166 = lshr i32 %add43, 16
  %conv5.i.168 = and i32 %add43, 65535
  %mul.i.170 = mul nuw i32 %conv5.i.168, %conv5.i.168
  %mul9.i.171 = mul nuw i32 %shr.i.166, %conv5.i.168
  %mul15.i.173 = mul nuw i32 %shr.i.166, %shr.i.166
  %add.i.174 = shl i32 %mul9.i.171, 1
  %cmp.i.175 = icmp ult i32 %add.i.174, %mul9.i.171
  %conv16.i.176 = zext i1 %cmp.i.175 to i32
  %shl.i.177 = shl nuw nsw i32 %conv16.i.176, 16
  %10 = lshr i32 %mul9.i.171, 15
  %shr17.i.178 = and i32 %10, 65535
  %add18.i.179 = or i32 %shl.i.177, %shr17.i.178
  %shl20.i.181 = shl i32 %mul9.i.171, 17
  %add21.i.182 = add i32 %shl20.i.181, %mul.i.170
  %cmp22.i.183 = icmp ult i32 %add21.i.182, %shl20.i.181
  %sub.i.161 = sub i32 %shl.i.186, %add21.i.182
  %conv23.i.184.neg = sext i1 %cmp22.i.183 to i32
  %cmp.i.163 = icmp ult i32 %shl.i.186, %add21.i.182
  %conv.neg.i.164 = sext i1 %cmp.i.163 to i32
  %add19.i.180.neg = sub i32 %or.i.190, %mul15.i.173
  %add24.i.185.neg = add i32 %add19.i.180.neg, %conv23.i.184.neg
  %sub1.i.162 = add i32 %add24.i.185.neg, %conv.neg.i.164
  %sub2.i.165 = sub i32 %sub1.i.162, %add18.i.179
  %cmp49.348 = icmp slt i32 %sub2.i.165, 0
  br i1 %cmp49.348, label %while.body.preheader, label %while.end

while.body.preheader:                             ; preds = %estimateSqrt32.exit
  br label %while.body

while.body:                                       ; preds = %while.body.preheader, %while.body
  %doubleZSig0.0352 = phi i32 [ %sub50, %while.body ], [ %add47, %while.body.preheader ]
  %rem1.0351 = phi i32 [ %add.i.158, %while.body ], [ %sub.i.161, %while.body.preheader ]
  %rem0.0350 = phi i32 [ %add2.i, %while.body ], [ %sub2.i.165, %while.body.preheader ]
  %zSig0.0349 = phi i32 [ %dec, %while.body ], [ %add43, %while.body.preheader ]
  %dec = add i32 %zSig0.0349, -1
  %sub50 = add i32 %doubleZSig0.0352, -2
  %or51 = or i32 %sub50, 1
  %add.i.158 = add i32 %or51, %rem1.0351
  %cmp.i.159 = icmp ult i32 %add.i.158, %rem1.0351
  %conv.i.160 = zext i1 %cmp.i.159 to i32
  %add2.i = add i32 %conv.i.160, %rem0.0350
  %cmp49 = icmp slt i32 %add2.i, 0
  br i1 %cmp49, label %while.body, label %while.end.loopexit

while.end.loopexit:                               ; preds = %while.body
  %add.i.158.lcssa = phi i32 [ %add.i.158, %while.body ]
  %sub50.lcssa = phi i32 [ %sub50, %while.body ]
  %dec.lcssa = phi i32 [ %dec, %while.body ]
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %estimateSqrt32.exit
  %doubleZSig0.0.lcssa = phi i32 [ %add47, %estimateSqrt32.exit ], [ %sub50.lcssa, %while.end.loopexit ]
  %rem1.0.lcssa = phi i32 [ %sub.i.161, %estimateSqrt32.exit ], [ %add.i.158.lcssa, %while.end.loopexit ]
  %zSig0.0.lcssa = phi i32 [ %add43, %estimateSqrt32.exit ], [ %dec.lcssa, %while.end.loopexit ]
  %cmp.i.153 = icmp ugt i32 %doubleZSig0.0.lcssa, %rem1.0.lcssa
  br i1 %cmp.i.153, label %if.end.i, label %if.end.70

if.end.i:                                         ; preds = %while.end
  %shr.i.154 = lshr i32 %doubleZSig0.0.lcssa, 16
  %shl.i.155 = shl nuw i32 %shr.i.154, 16
  %cmp1.i = icmp ugt i32 %shl.i.155, %rem1.0.lcssa
  br i1 %cmp1.i, label %cond.false.i, label %cond.end.i

cond.false.i:                                     ; preds = %if.end.i
  %div.i = udiv i32 %rem1.0.lcssa, %shr.i.154
  %shl2.i = shl i32 %div.i, 16
  br label %cond.end.i

cond.end.i:                                       ; preds = %cond.false.i, %if.end.i
  %cond.i = phi i32 [ %shl2.i, %cond.false.i ], [ -65536, %if.end.i ]
  %shr3.i.i = lshr exact i32 %cond.i, 16
  %conv5.i.i = and i32 %doubleZSig0.0.lcssa, 65534
  %mul9.i.i = mul nuw i32 %shr3.i.i, %conv5.i.i
  %mul15.i.i = mul nuw i32 %shr3.i.i, %shr.i.154
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
  %z.048.i = phi i32 [ %cond.i, %while.body.lr.ph.i ], [ %sub.i.156, %while.body.i ]
  %rem0.047.i = phi i32 [ %sub2.i.i, %while.body.lr.ph.i ], [ %add2.i.i, %while.body.i ]
  %rem1.046.i = phi i32 [ %sub.i.i, %while.body.lr.ph.i ], [ %add.i.37.i, %while.body.i ]
  %sub.i.156 = add i32 %z.048.i, -65536
  %add.i.37.i = add i32 %rem1.046.i, %shl4.i
  %add1.i.i = add i32 %rem0.047.i, %shr.i.154
  %cmp.i.38.i = icmp ult i32 %add.i.37.i, %rem1.046.i
  %conv.i.i = zext i1 %cmp.i.38.i to i32
  %add2.i.i = add i32 %add1.i.i, %conv.i.i
  %cmp3.i = icmp slt i32 %add2.i.i, 0
  br i1 %cmp3.i, label %while.body.i, label %while.end.i.loopexit

while.end.i.loopexit:                             ; preds = %while.body.i
  %add2.i.i.lcssa = phi i32 [ %add2.i.i, %while.body.i ]
  %add.i.37.i.lcssa = phi i32 [ %add.i.37.i, %while.body.i ]
  %sub.i.156.lcssa = phi i32 [ %sub.i.156, %while.body.i ]
  br label %while.end.i

while.end.i:                                      ; preds = %while.end.i.loopexit, %cond.end.i
  %z.0.lcssa.i = phi i32 [ %cond.i, %cond.end.i ], [ %sub.i.156.lcssa, %while.end.i.loopexit ]
  %rem0.0.lcssa.i = phi i32 [ %sub2.i.i, %cond.end.i ], [ %add2.i.i.lcssa, %while.end.i.loopexit ]
  %rem1.0.lcssa.i = phi i32 [ %sub.i.i, %cond.end.i ], [ %add.i.37.i.lcssa, %while.end.i.loopexit ]
  %shl5.i = shl i32 %rem0.0.lcssa.i, 16
  %shr6.i = lshr i32 %rem1.0.lcssa.i, 16
  %or.i.157 = or i32 %shr6.i, %shl5.i
  %cmp8.i = icmp ugt i32 %shl.i.155, %or.i.157
  br i1 %cmp8.i, label %cond.false.10.i, label %estimateDiv64To32.exit

cond.false.10.i:                                  ; preds = %while.end.i
  %div11.i = udiv i32 %or.i.157, %shr.i.154
  br label %estimateDiv64To32.exit

estimateDiv64To32.exit:                           ; preds = %while.end.i, %cond.false.10.i
  %cond13.i = phi i32 [ %div11.i, %cond.false.10.i ], [ 65535, %while.end.i ]
  %or14.i = or i32 %cond13.i, %z.0.lcssa.i
  %and53 = and i32 %or14.i, 510
  %cmp54 = icmp ult i32 %and53, 6
  br i1 %cmp54, label %if.then.55, label %if.end.70

if.then.55:                                       ; preds = %estimateDiv64To32.exit
  %cmp56 = icmp eq i32 %or14.i, 0
  %.or14.i = select i1 %cmp56, i32 1, i32 %or14.i
  %shr3.i.134 = lshr i32 %.or14.i, 16
  %conv6.i.136 = and i32 %.or14.i, 65535
  %mul.i.137 = mul nuw i32 %conv6.i.136, %conv5.i.i
  %mul9.i.138 = mul nuw i32 %shr3.i.134, %conv5.i.i
  %mul12.i.139 = mul nuw i32 %conv6.i.136, %shr.i.154
  %mul15.i.140 = mul nuw i32 %shr3.i.134, %shr.i.154
  %add.i.141 = add i32 %mul9.i.138, %mul12.i.139
  %cmp.i.142 = icmp ult i32 %add.i.141, %mul12.i.139
  %conv16.i.143 = zext i1 %cmp.i.142 to i32
  %shl.i.144 = shl nuw nsw i32 %conv16.i.143, 16
  %shr17.i.145 = lshr i32 %add.i.141, 16
  %add18.i.146 = or i32 %shl.i.144, %shr17.i.145
  %shl20.i.148 = shl i32 %add.i.141, 16
  %add21.i.149 = add i32 %shl20.i.148, %mul.i.137
  %cmp22.i.150 = icmp ult i32 %add21.i.149, %shl20.i.148
  %sub.i.130 = sub i32 0, %add21.i.149
  %conv23.i.151.neg = sext i1 %cmp22.i.150 to i32
  %cmp.i.132 = icmp ne i32 %add21.i.149, 0
  %conv.neg.i = sext i1 %cmp.i.132 to i32
  %mul.i = mul nuw i32 %conv6.i.136, %conv6.i.136
  %mul9.i = mul nuw i32 %shr3.i.134, %conv6.i.136
  %mul15.i = mul nuw i32 %shr3.i.134, %shr3.i.134
  %add.i.127 = shl i32 %mul9.i, 1
  %cmp.i.128 = icmp ult i32 %add.i.127, %mul9.i
  %conv16.i = zext i1 %cmp.i.128 to i32
  %shl.i.129 = shl nuw nsw i32 %conv16.i, 16
  %11 = lshr i32 %mul9.i, 15
  %shr17.i = and i32 %11, 65535
  %add18.i = or i32 %shl.i.129, %shr17.i
  %shl20.i = shl i32 %mul9.i, 17
  %add21.i = add i32 %shl20.i, %mul.i
  %cmp22.i = icmp ult i32 %add21.i, %shl20.i
  %conv23.i = zext i1 %cmp22.i to i32
  %add19.i = add i32 %conv23.i, %mul15.i
  %add24.i = add i32 %add19.i, %add18.i
  %sub.i = sub i32 0, %add21.i
  %cmp.i.123 = icmp ne i32 %add21.i, 0
  %conv.i.124 = zext i1 %cmp.i.123 to i32
  %sub1.i = sub i32 %sub.i.130, %add24.i
  %cmp2.i.125 = icmp ugt i32 %add24.i, %sub.i.130
  %cmp5.i = icmp ult i32 %sub1.i, %conv.i.124
  %conv6.neg.i = sext i1 %cmp5.i to i32
  %sub8.i = sub i32 %sub1.i, %conv.i.124
  %conv3.neg.i = sext i1 %cmp2.i.125 to i32
  %add19.i.147.neg = sub i32 %rem1.0.lcssa, %mul15.i.140
  %add24.i.152.neg = sub i32 %add19.i.147.neg, %add18.i.146
  %sub1.i.131 = add i32 %add24.i.152.neg, %conv23.i.151.neg
  %sub2.i = add i32 %sub1.i.131, %conv.neg.i
  %sub7.i = add i32 %sub2.i, %conv3.neg.i
  %sub9.i = add i32 %sub7.i, %conv6.neg.i
  %cmp60.340 = icmp slt i32 %sub9.i, 0
  br i1 %cmp60.340, label %while.body.61.preheader, label %while.end.65

while.body.61.preheader:                          ; preds = %if.then.55
  br label %while.body.61

while.body.61:                                    ; preds = %while.body.61.preheader, %while.body.61
  %rem3.0344 = phi i32 [ %add.i, %while.body.61 ], [ %sub.i, %while.body.61.preheader ]
  %rem2.0343 = phi i32 [ %add5.i, %while.body.61 ], [ %sub8.i, %while.body.61.preheader ]
  %rem1.1342 = phi i32 [ %add9.i, %while.body.61 ], [ %sub9.i, %while.body.61.preheader ]
  %zSig1.1341 = phi i32 [ %dec62, %while.body.61 ], [ %.or14.i, %while.body.61.preheader ]
  %dec62 = add i32 %zSig1.1341, -1
  %shl.i.121 = shl i32 %dec62, 1
  %shr.i.122 = lshr i32 %dec62, 31
  %or63 = or i32 %shl.i.121, 1
  %or64 = or i32 %shr.i.122, %doubleZSig0.0.lcssa
  %add.i = add i32 %or63, %rem3.0344
  %cmp.i = icmp ult i32 %add.i, %rem3.0344
  %conv.i = zext i1 %cmp.i to i32
  %add1.i = add i32 %or64, %rem2.0343
  %cmp2.i = icmp ult i32 %add1.i, %rem2.0343
  %conv3.i = zext i1 %cmp2.i to i32
  %add5.i = add i32 %conv.i, %add1.i
  %cmp6.i = icmp ult i32 %add5.i, %conv.i
  %conv7.i = zext i1 %cmp6.i to i32
  %add8.i = add i32 %conv3.i, %rem1.1342
  %add9.i = add i32 %add8.i, %conv7.i
  %cmp60 = icmp slt i32 %add9.i, 0
  br i1 %cmp60, label %while.body.61, label %while.end.65.loopexit

while.end.65.loopexit:                            ; preds = %while.body.61
  %add9.i.lcssa = phi i32 [ %add9.i, %while.body.61 ]
  %add5.i.lcssa = phi i32 [ %add5.i, %while.body.61 ]
  %add.i.lcssa = phi i32 [ %add.i, %while.body.61 ]
  %dec62.lcssa = phi i32 [ %dec62, %while.body.61 ]
  br label %while.end.65

while.end.65:                                     ; preds = %while.end.65.loopexit, %if.then.55
  %rem3.0.lcssa = phi i32 [ %sub.i, %if.then.55 ], [ %add.i.lcssa, %while.end.65.loopexit ]
  %rem2.0.lcssa = phi i32 [ %sub8.i, %if.then.55 ], [ %add5.i.lcssa, %while.end.65.loopexit ]
  %rem1.1.lcssa = phi i32 [ %sub9.i, %if.then.55 ], [ %add9.i.lcssa, %while.end.65.loopexit ]
  %zSig1.1.lcssa = phi i32 [ %.or14.i, %if.then.55 ], [ %dec62.lcssa, %while.end.65.loopexit ]
  %or66 = or i32 %rem2.0.lcssa, %rem1.1.lcssa
  %or67 = or i32 %or66, %rem3.0.lcssa
  %cmp68 = icmp ne i32 %or67, 0
  %conv = zext i1 %cmp68 to i32
  %or69 = or i32 %conv, %zSig1.1.lcssa
  br label %if.end.70

if.end.70:                                        ; preds = %while.end, %while.end.65, %estimateDiv64To32.exit
  %zSig1.2 = phi i32 [ %or69, %while.end.65 ], [ %or14.i, %estimateDiv64To32.exit ], [ -1, %while.end ]
  %shl.i = shl i32 %zSig1.2, 22
  %shl3.i = shl i32 %zSig0.0.lcssa, 22
  %shr.i = lshr i32 %zSig1.2, 10
  %or.i = or i32 %shr.i, %shl3.i
  %shr4.i = lshr i32 %zSig0.0.lcssa, 10
  %call71 = tail call fastcc i64 @roundAndPackFloat64(i32 0, i32 %add, i32 %shr4.i, i32 %or.i, i32 %shl.i)
  %retval.sroa.0.0.extract.trunc116 = trunc i64 %call71 to i32
  %retval.sroa.7.0.extract.shift119 = lshr i64 %call71, 32
  %retval.sroa.7.0.extract.trunc120 = trunc i64 %retval.sroa.7.0.extract.shift119 to i32
  br label %cleanup

cleanup:                                          ; preds = %if.then.i.283, %float64_is_signaling_nan.exit.i, %if.then.33, %if.then.23, %if.end, %if.end.70, %invalid
  %retval.sroa.0.0 = phi i32 [ -1, %invalid ], [ %retval.sroa.0.0.extract.trunc116, %if.end.70 ], [ %a.0, %if.end ], [ %a.0, %if.then.23 ], [ 0, %if.then.33 ], [ %a.0, %float64_is_signaling_nan.exit.i ], [ %a.0, %if.then.i.283 ]
  %retval.sroa.7.0 = phi i32 [ 2147483647, %invalid ], [ %retval.sroa.7.0.extract.trunc120, %if.end.70 ], [ %a.1, %if.end ], [ %a.1, %if.then.23 ], [ 0, %if.then.33 ], [ %or.i.281, %float64_is_signaling_nan.exit.i ], [ %or1772.i, %if.then.i.283 ]
  %retval.sroa.7.0.insert.ext = zext i32 %retval.sroa.7.0 to i64
  %retval.sroa.7.0.insert.shift = shl nuw i64 %retval.sroa.7.0.insert.ext, 32
  %retval.sroa.0.0.insert.ext = zext i32 %retval.sroa.0.0 to i64
  %retval.sroa.0.0.insert.insert = or i64 %retval.sroa.7.0.insert.shift, %retval.sroa.0.0.insert.ext
  ret i64 %retval.sroa.0.0.insert.insert
}

; Function Attrs: nounwind
define i32 @float64_eq(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #2 {
entry:
  %and.i = and i32 %a.1, 2146435072
  %cmp = icmp eq i32 %and.i, 2146435072
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %and.i.82 = and i32 %a.1, 1048575
  %or = or i32 %and.i.82, %a.0
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %and.i.81 = and i32 %b.1, 2146435072
  %cmp15 = icmp eq i32 %and.i.81, 2146435072
  br i1 %cmp15, label %land.lhs.true.16, label %if.end.35

land.lhs.true.16:                                 ; preds = %lor.lhs.false
  %and.i.79 = and i32 %b.1, 1048575
  %or23 = or i32 %and.i.79, %b.0
  %tobool24 = icmp eq i32 %or23, 0
  br i1 %tobool24, label %if.end.35, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.16
  %and.i.70 = and i32 %a.1, 2146959360
  %cmp.i.71 = icmp eq i32 %and.i.70, 2146435072
  br i1 %cmp.i.71, label %land.rhs.i.73, label %lor.lhs.false.29

land.rhs.i.73:                                    ; preds = %if.then
  %and4.i.74 = and i32 %a.1, 524287
  %0 = or i32 %and4.i.74, %a.0
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %lor.lhs.false.29, label %if.then.34

lor.lhs.false.29:                                 ; preds = %land.rhs.i.73, %if.then
  %and.i.69 = and i32 %b.1, 2146959360
  %cmp.i = icmp eq i32 %and.i.69, 2146435072
  br i1 %cmp.i, label %land.rhs.i, label %return

land.rhs.i:                                       ; preds = %lor.lhs.false.29
  %and4.i = and i32 %b.1, 524287
  %2 = or i32 %and4.i, %b.0
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %return, label %if.then.34

if.then.34:                                       ; preds = %land.rhs.i.73, %land.rhs.i
  %4 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %4, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %return

if.end.35:                                        ; preds = %land.lhs.true.16, %lor.lhs.false
  %cmp38 = icmp eq i32 %a.0, %b.0
  br i1 %cmp38, label %land.rhs, label %land.end.49

land.rhs:                                         ; preds = %if.end.35
  %cmp41 = icmp eq i32 %a.1, %b.1
  br i1 %cmp41, label %land.end.49, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %cmp43 = icmp eq i32 %a.0, 0
  br i1 %cmp43, label %land.rhs.44, label %land.end.49

land.rhs.44:                                      ; preds = %lor.rhs
  %or47 = or i32 %b.1, %a.1
  %shl.mask = and i32 %or47, 2147483647
  %cmp48 = icmp eq i32 %shl.mask, 0
  br label %land.end.49

land.end.49:                                      ; preds = %land.rhs, %land.rhs.44, %lor.rhs, %if.end.35
  %5 = phi i1 [ false, %if.end.35 ], [ true, %land.rhs ], [ false, %lor.rhs ], [ %cmp48, %land.rhs.44 ]
  %land.ext = zext i1 %5 to i32
  br label %return

return:                                           ; preds = %land.rhs.i, %lor.lhs.false.29, %if.then.34, %land.end.49
  %retval.0 = phi i32 [ %land.ext, %land.end.49 ], [ 0, %if.then.34 ], [ 0, %lor.lhs.false.29 ], [ 0, %land.rhs.i ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float64_le(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #2 {
entry:
  %and.i = and i32 %a.1, 2146435072
  %cmp = icmp eq i32 %and.i, 2146435072
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %and.i.94 = and i32 %a.1, 1048575
  %or = or i32 %and.i.94, %a.0
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %and.i.93 = and i32 %b.1, 2146435072
  %cmp15 = icmp eq i32 %and.i.93, 2146435072
  br i1 %cmp15, label %land.lhs.true.16, label %if.end

land.lhs.true.16:                                 ; preds = %lor.lhs.false
  %and.i.91 = and i32 %b.1, 1048575
  %or23 = or i32 %and.i.91, %b.0
  %tobool24 = icmp eq i32 %or23, 0
  br i1 %tobool24, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.16
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %0, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end:                                           ; preds = %land.lhs.true.16, %lor.lhs.false
  %shr.i.90 = lshr i32 %a.1, 31
  %shr.i.89 = lshr i32 %b.1, 31
  %cmp31 = icmp eq i32 %shr.i.90, %shr.i.89
  %tobool33 = icmp ne i32 %shr.i.90, 0
  br i1 %cmp31, label %if.end.42, label %if.then.32

if.then.32:                                       ; preds = %if.end
  br i1 %tobool33, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.then.32
  %or36 = or i32 %b.1, %a.1
  %shl = shl i32 %or36, 1
  %or38 = or i32 %b.0, %a.0
  %or40 = or i32 %or38, %shl
  %cmp41 = icmp eq i32 %or40, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.then.32
  %1 = phi i1 [ true, %if.then.32 ], [ %cmp41, %lor.rhs ]
  %lor.ext = zext i1 %1 to i32
  br label %cleanup

if.end.42:                                        ; preds = %if.end
  br i1 %tobool33, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end.42
  %cmp.i.82 = icmp ult i32 %b.1, %a.1
  br i1 %cmp.i.82, label %le64.exit88, label %lor.rhs.i.86

lor.rhs.i.86:                                     ; preds = %cond.true
  %cmp1.i.83 = icmp eq i32 %b.1, %a.1
  %cmp2.i.84 = icmp ule i32 %b.0, %a.0
  %cmp2..i.85 = and i1 %cmp2.i.84, %cmp1.i.83
  br label %le64.exit88

le64.exit88:                                      ; preds = %cond.true, %lor.rhs.i.86
  %2 = phi i1 [ true, %cond.true ], [ %cmp2..i.85, %lor.rhs.i.86 ]
  %lor.ext.i.87 = zext i1 %2 to i32
  br label %cleanup

cond.false:                                       ; preds = %if.end.42
  %cmp.i = icmp ult i32 %a.1, %b.1
  br i1 %cmp.i, label %le64.exit, label %lor.rhs.i

lor.rhs.i:                                        ; preds = %cond.false
  %cmp1.i = icmp eq i32 %a.1, %b.1
  %cmp2.i = icmp ule i32 %a.0, %b.0
  %cmp2..i = and i1 %cmp2.i, %cmp1.i
  br label %le64.exit

le64.exit:                                        ; preds = %cond.false, %lor.rhs.i
  %3 = phi i1 [ true, %cond.false ], [ %cmp2..i, %lor.rhs.i ]
  %lor.ext.i = zext i1 %3 to i32
  br label %cleanup

cleanup:                                          ; preds = %le64.exit88, %le64.exit, %lor.end, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ %lor.ext, %lor.end ], [ %lor.ext.i.87, %le64.exit88 ], [ %lor.ext.i, %le64.exit ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float64_lt(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #2 {
entry:
  %and.i = and i32 %a.1, 2146435072
  %cmp = icmp eq i32 %and.i, 2146435072
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %and.i.94 = and i32 %a.1, 1048575
  %or = or i32 %and.i.94, %a.0
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %and.i.93 = and i32 %b.1, 2146435072
  %cmp15 = icmp eq i32 %and.i.93, 2146435072
  br i1 %cmp15, label %land.lhs.true.16, label %if.end

land.lhs.true.16:                                 ; preds = %lor.lhs.false
  %and.i.91 = and i32 %b.1, 1048575
  %or23 = or i32 %and.i.91, %b.0
  %tobool24 = icmp eq i32 %or23, 0
  br i1 %tobool24, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.16
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %0, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end:                                           ; preds = %land.lhs.true.16, %lor.lhs.false
  %shr.i.90 = lshr i32 %a.1, 31
  %shr.i.89 = lshr i32 %b.1, 31
  %cmp31 = icmp eq i32 %shr.i.90, %shr.i.89
  %tobool33 = icmp ne i32 %shr.i.90, 0
  br i1 %cmp31, label %if.end.42, label %if.then.32

if.then.32:                                       ; preds = %if.end
  br i1 %tobool33, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.then.32
  %or36 = or i32 %b.1, %a.1
  %shl = shl i32 %or36, 1
  %or38 = or i32 %b.0, %a.0
  %or40 = or i32 %or38, %shl
  %cmp41 = icmp ne i32 %or40, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then.32
  %1 = phi i1 [ false, %if.then.32 ], [ %cmp41, %land.rhs ]
  %land.ext = zext i1 %1 to i32
  br label %cleanup

if.end.42:                                        ; preds = %if.end
  br i1 %tobool33, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end.42
  %cmp.i.82 = icmp ult i32 %b.1, %a.1
  br i1 %cmp.i.82, label %lt64.exit88, label %lor.rhs.i.86

lor.rhs.i.86:                                     ; preds = %cond.true
  %cmp1.i.83 = icmp eq i32 %b.1, %a.1
  %cmp2.i.84 = icmp ult i32 %b.0, %a.0
  %cmp2..i.85 = and i1 %cmp2.i.84, %cmp1.i.83
  br label %lt64.exit88

lt64.exit88:                                      ; preds = %cond.true, %lor.rhs.i.86
  %2 = phi i1 [ true, %cond.true ], [ %cmp2..i.85, %lor.rhs.i.86 ]
  %lor.ext.i.87 = zext i1 %2 to i32
  br label %cleanup

cond.false:                                       ; preds = %if.end.42
  %cmp.i = icmp ult i32 %a.1, %b.1
  br i1 %cmp.i, label %lt64.exit, label %lor.rhs.i

lor.rhs.i:                                        ; preds = %cond.false
  %cmp1.i = icmp eq i32 %a.1, %b.1
  %cmp2.i = icmp ult i32 %a.0, %b.0
  %cmp2..i = and i1 %cmp2.i, %cmp1.i
  br label %lt64.exit

lt64.exit:                                        ; preds = %cond.false, %lor.rhs.i
  %3 = phi i1 [ true, %cond.false ], [ %cmp2..i, %lor.rhs.i ]
  %lor.ext.i = zext i1 %3 to i32
  br label %cleanup

cleanup:                                          ; preds = %lt64.exit88, %lt64.exit, %land.end, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ %land.ext, %land.end ], [ %lor.ext.i.87, %lt64.exit88 ], [ %lor.ext.i, %lt64.exit ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float64_eq_signaling(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #2 {
entry:
  %and.i = and i32 %a.1, 2146435072
  %cmp = icmp eq i32 %and.i, 2146435072
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %and.i.57 = and i32 %a.1, 1048575
  %or = or i32 %and.i.57, %a.0
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %and.i.56 = and i32 %b.1, 2146435072
  %cmp15 = icmp eq i32 %and.i.56, 2146435072
  br i1 %cmp15, label %land.lhs.true.16, label %if.end

land.lhs.true.16:                                 ; preds = %lor.lhs.false
  %and.i.54 = and i32 %b.1, 1048575
  %or23 = or i32 %and.i.54, %b.0
  %tobool24 = icmp eq i32 %or23, 0
  br i1 %tobool24, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.16
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %0, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %return

if.end:                                           ; preds = %land.lhs.true.16, %lor.lhs.false
  %cmp27 = icmp eq i32 %a.0, %b.0
  br i1 %cmp27, label %land.rhs, label %land.end.38

land.rhs:                                         ; preds = %if.end
  %cmp30 = icmp eq i32 %a.1, %b.1
  br i1 %cmp30, label %land.end.38, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %cmp32 = icmp eq i32 %a.0, 0
  br i1 %cmp32, label %land.rhs.33, label %land.end.38

land.rhs.33:                                      ; preds = %lor.rhs
  %or36 = or i32 %b.1, %a.1
  %shl.mask = and i32 %or36, 2147483647
  %cmp37 = icmp eq i32 %shl.mask, 0
  br label %land.end.38

land.end.38:                                      ; preds = %land.rhs, %land.rhs.33, %lor.rhs, %if.end
  %1 = phi i1 [ false, %if.end ], [ true, %land.rhs ], [ false, %lor.rhs ], [ %cmp37, %land.rhs.33 ]
  %land.ext = zext i1 %1 to i32
  br label %return

return:                                           ; preds = %land.end.38, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ %land.ext, %land.end.38 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float64_le_quiet(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #2 {
entry:
  %and.i = and i32 %a.1, 2146435072
  %cmp = icmp eq i32 %and.i, 2146435072
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %and.i.121 = and i32 %a.1, 1048575
  %or = or i32 %and.i.121, %a.0
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %and.i.120 = and i32 %b.1, 2146435072
  %cmp15 = icmp eq i32 %and.i.120, 2146435072
  br i1 %cmp15, label %land.lhs.true.16, label %if.end.35

land.lhs.true.16:                                 ; preds = %lor.lhs.false
  %and.i.118 = and i32 %b.1, 1048575
  %or23 = or i32 %and.i.118, %b.0
  %tobool24 = icmp eq i32 %or23, 0
  br i1 %tobool24, label %if.end.35, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.16
  %and.i.109 = and i32 %a.1, 2146959360
  %cmp.i.110 = icmp eq i32 %and.i.109, 2146435072
  br i1 %cmp.i.110, label %land.rhs.i.112, label %lor.lhs.false.29

land.rhs.i.112:                                   ; preds = %if.then
  %and4.i.113 = and i32 %a.1, 524287
  %0 = or i32 %and4.i.113, %a.0
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %lor.lhs.false.29, label %if.then.34

lor.lhs.false.29:                                 ; preds = %land.rhs.i.112, %if.then
  %and.i.106 = and i32 %b.1, 2146959360
  %cmp.i.107 = icmp eq i32 %and.i.106, 2146435072
  br i1 %cmp.i.107, label %land.rhs.i, label %cleanup

land.rhs.i:                                       ; preds = %lor.lhs.false.29
  %and4.i = and i32 %b.1, 524287
  %2 = or i32 %and4.i, %b.0
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %cleanup, label %if.then.34

if.then.34:                                       ; preds = %land.rhs.i.112, %land.rhs.i
  %4 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %4, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.35:                                        ; preds = %land.lhs.true.16, %lor.lhs.false
  %shr.i.105 = lshr i32 %a.1, 31
  %shr.i.104 = lshr i32 %b.1, 31
  %cmp42 = icmp eq i32 %shr.i.105, %shr.i.104
  %tobool44 = icmp ne i32 %shr.i.105, 0
  br i1 %cmp42, label %if.end.53, label %if.then.43

if.then.43:                                       ; preds = %if.end.35
  br i1 %tobool44, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.then.43
  %or47 = or i32 %b.1, %a.1
  %shl = shl i32 %or47, 1
  %or49 = or i32 %b.0, %a.0
  %or51 = or i32 %or49, %shl
  %cmp52 = icmp eq i32 %or51, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.then.43
  %5 = phi i1 [ true, %if.then.43 ], [ %cmp52, %lor.rhs ]
  %lor.ext = zext i1 %5 to i32
  br label %cleanup

if.end.53:                                        ; preds = %if.end.35
  br i1 %tobool44, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end.53
  %cmp.i.97 = icmp ult i32 %b.1, %a.1
  br i1 %cmp.i.97, label %le64.exit103, label %lor.rhs.i.101

lor.rhs.i.101:                                    ; preds = %cond.true
  %cmp1.i.98 = icmp eq i32 %b.1, %a.1
  %cmp2.i.99 = icmp ule i32 %b.0, %a.0
  %cmp2..i.100 = and i1 %cmp2.i.99, %cmp1.i.98
  br label %le64.exit103

le64.exit103:                                     ; preds = %cond.true, %lor.rhs.i.101
  %6 = phi i1 [ true, %cond.true ], [ %cmp2..i.100, %lor.rhs.i.101 ]
  %lor.ext.i.102 = zext i1 %6 to i32
  br label %cleanup

cond.false:                                       ; preds = %if.end.53
  %cmp.i = icmp ult i32 %a.1, %b.1
  br i1 %cmp.i, label %le64.exit, label %lor.rhs.i

lor.rhs.i:                                        ; preds = %cond.false
  %cmp1.i = icmp eq i32 %a.1, %b.1
  %cmp2.i = icmp ule i32 %a.0, %b.0
  %cmp2..i = and i1 %cmp2.i, %cmp1.i
  br label %le64.exit

le64.exit:                                        ; preds = %cond.false, %lor.rhs.i
  %7 = phi i1 [ true, %cond.false ], [ %cmp2..i, %lor.rhs.i ]
  %lor.ext.i = zext i1 %7 to i32
  br label %cleanup

cleanup:                                          ; preds = %land.rhs.i, %lor.lhs.false.29, %le64.exit103, %le64.exit, %if.then.34, %lor.end
  %retval.0 = phi i32 [ %lor.ext, %lor.end ], [ 0, %if.then.34 ], [ %lor.ext.i.102, %le64.exit103 ], [ %lor.ext.i, %le64.exit ], [ 0, %lor.lhs.false.29 ], [ 0, %land.rhs.i ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float64_lt_quiet(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #2 {
entry:
  %and.i = and i32 %a.1, 2146435072
  %cmp = icmp eq i32 %and.i, 2146435072
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %and.i.121 = and i32 %a.1, 1048575
  %or = or i32 %and.i.121, %a.0
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %and.i.120 = and i32 %b.1, 2146435072
  %cmp15 = icmp eq i32 %and.i.120, 2146435072
  br i1 %cmp15, label %land.lhs.true.16, label %if.end.35

land.lhs.true.16:                                 ; preds = %lor.lhs.false
  %and.i.118 = and i32 %b.1, 1048575
  %or23 = or i32 %and.i.118, %b.0
  %tobool24 = icmp eq i32 %or23, 0
  br i1 %tobool24, label %if.end.35, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.16
  %and.i.109 = and i32 %a.1, 2146959360
  %cmp.i.110 = icmp eq i32 %and.i.109, 2146435072
  br i1 %cmp.i.110, label %land.rhs.i.112, label %lor.lhs.false.29

land.rhs.i.112:                                   ; preds = %if.then
  %and4.i.113 = and i32 %a.1, 524287
  %0 = or i32 %and4.i.113, %a.0
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %lor.lhs.false.29, label %if.then.34

lor.lhs.false.29:                                 ; preds = %land.rhs.i.112, %if.then
  %and.i.106 = and i32 %b.1, 2146959360
  %cmp.i.107 = icmp eq i32 %and.i.106, 2146435072
  br i1 %cmp.i.107, label %land.rhs.i, label %cleanup

land.rhs.i:                                       ; preds = %lor.lhs.false.29
  %and4.i = and i32 %b.1, 524287
  %2 = or i32 %and4.i, %b.0
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %cleanup, label %if.then.34

if.then.34:                                       ; preds = %land.rhs.i.112, %land.rhs.i
  %4 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %4, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.35:                                        ; preds = %land.lhs.true.16, %lor.lhs.false
  %shr.i.105 = lshr i32 %a.1, 31
  %shr.i.104 = lshr i32 %b.1, 31
  %cmp42 = icmp eq i32 %shr.i.105, %shr.i.104
  %tobool44 = icmp ne i32 %shr.i.105, 0
  br i1 %cmp42, label %if.end.53, label %if.then.43

if.then.43:                                       ; preds = %if.end.35
  br i1 %tobool44, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.then.43
  %or47 = or i32 %b.1, %a.1
  %shl = shl i32 %or47, 1
  %or49 = or i32 %b.0, %a.0
  %or51 = or i32 %or49, %shl
  %cmp52 = icmp ne i32 %or51, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then.43
  %5 = phi i1 [ false, %if.then.43 ], [ %cmp52, %land.rhs ]
  %land.ext = zext i1 %5 to i32
  br label %cleanup

if.end.53:                                        ; preds = %if.end.35
  br i1 %tobool44, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end.53
  %cmp.i.97 = icmp ult i32 %b.1, %a.1
  br i1 %cmp.i.97, label %lt64.exit103, label %lor.rhs.i.101

lor.rhs.i.101:                                    ; preds = %cond.true
  %cmp1.i.98 = icmp eq i32 %b.1, %a.1
  %cmp2.i.99 = icmp ult i32 %b.0, %a.0
  %cmp2..i.100 = and i1 %cmp2.i.99, %cmp1.i.98
  br label %lt64.exit103

lt64.exit103:                                     ; preds = %cond.true, %lor.rhs.i.101
  %6 = phi i1 [ true, %cond.true ], [ %cmp2..i.100, %lor.rhs.i.101 ]
  %lor.ext.i.102 = zext i1 %6 to i32
  br label %cleanup

cond.false:                                       ; preds = %if.end.53
  %cmp.i = icmp ult i32 %a.1, %b.1
  br i1 %cmp.i, label %lt64.exit, label %lor.rhs.i

lor.rhs.i:                                        ; preds = %cond.false
  %cmp1.i = icmp eq i32 %a.1, %b.1
  %cmp2.i = icmp ult i32 %a.0, %b.0
  %cmp2..i = and i1 %cmp2.i, %cmp1.i
  br label %lt64.exit

lt64.exit:                                        ; preds = %cond.false, %lor.rhs.i
  %7 = phi i1 [ true, %cond.false ], [ %cmp2..i, %lor.rhs.i ]
  %lor.ext.i = zext i1 %7 to i32
  br label %cleanup

cleanup:                                          ; preds = %land.rhs.i, %lor.lhs.false.29, %lt64.exit103, %lt64.exit, %if.then.34, %land.end
  %retval.0 = phi i32 [ %land.ext, %land.end ], [ 0, %if.then.34 ], [ %lor.ext.i.102, %lt64.exit103 ], [ %lor.ext.i, %lt64.exit ], [ 0, %lor.lhs.false.29 ], [ 0, %land.rhs.i ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float32_gt(i32 %a, i32 %b) #2 {
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
  %cmp16 = icmp ugt i32 %a, %b
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

; Function Attrs: nounwind
define i32 @float32_ge(i32 %a, i32 %b) #2 {
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
  %cmp16 = icmp ugt i32 %a, %b
  %conv = zext i1 %cmp16 to i32
  %cmp1442 = zext i1 %cmp14 to i32
  %2 = xor i32 %conv, %shr.i.36
  %lor.ext19 = or i32 %2, %cmp1442
  br label %cleanup

cleanup:                                          ; preds = %if.end.13, %lor.end, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ %lor.ext, %lor.end ], [ %lor.ext19, %if.end.13 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float64_gt(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #2 {
entry:
  %and.i = and i32 %a.1, 2146435072
  %cmp = icmp eq i32 %and.i, 2146435072
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %and.i.94 = and i32 %a.1, 1048575
  %or = or i32 %and.i.94, %a.0
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %and.i.93 = and i32 %b.1, 2146435072
  %cmp15 = icmp eq i32 %and.i.93, 2146435072
  br i1 %cmp15, label %land.lhs.true.16, label %if.end

land.lhs.true.16:                                 ; preds = %lor.lhs.false
  %and.i.91 = and i32 %b.1, 1048575
  %or23 = or i32 %and.i.91, %b.0
  %tobool24 = icmp eq i32 %or23, 0
  br i1 %tobool24, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.16
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %0, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end:                                           ; preds = %land.lhs.true.16, %lor.lhs.false
  %shr.i.90 = lshr i32 %a.1, 31
  %shr.i.89 = lshr i32 %b.1, 31
  %cmp31 = icmp eq i32 %shr.i.90, %shr.i.89
  %tobool33 = icmp ne i32 %shr.i.90, 0
  br i1 %cmp31, label %if.end.42, label %if.then.32

if.then.32:                                       ; preds = %if.end
  br i1 %tobool33, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.then.32
  %or36 = or i32 %b.1, %a.1
  %shl = shl i32 %or36, 1
  %or38 = or i32 %b.0, %a.0
  %or40 = or i32 %or38, %shl
  %cmp41 = icmp ne i32 %or40, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then.32
  %1 = phi i1 [ false, %if.then.32 ], [ %cmp41, %land.rhs ]
  %land.ext = zext i1 %1 to i32
  br label %cleanup

if.end.42:                                        ; preds = %if.end
  br i1 %tobool33, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end.42
  %cmp.i.82 = icmp ugt i32 %b.1, %a.1
  br i1 %cmp.i.82, label %gt64.exit88, label %lor.rhs.i.86

lor.rhs.i.86:                                     ; preds = %cond.true
  %cmp1.i.83 = icmp eq i32 %b.1, %a.1
  %cmp2.i.84 = icmp ugt i32 %b.0, %a.0
  %cmp2..i.85 = and i1 %cmp2.i.84, %cmp1.i.83
  br label %gt64.exit88

gt64.exit88:                                      ; preds = %cond.true, %lor.rhs.i.86
  %2 = phi i1 [ true, %cond.true ], [ %cmp2..i.85, %lor.rhs.i.86 ]
  %lor.ext.i.87 = zext i1 %2 to i32
  br label %cleanup

cond.false:                                       ; preds = %if.end.42
  %cmp.i = icmp ugt i32 %a.1, %b.1
  br i1 %cmp.i, label %gt64.exit, label %lor.rhs.i

lor.rhs.i:                                        ; preds = %cond.false
  %cmp1.i = icmp eq i32 %a.1, %b.1
  %cmp2.i = icmp ugt i32 %a.0, %b.0
  %cmp2..i = and i1 %cmp2.i, %cmp1.i
  br label %gt64.exit

gt64.exit:                                        ; preds = %cond.false, %lor.rhs.i
  %3 = phi i1 [ true, %cond.false ], [ %cmp2..i, %lor.rhs.i ]
  %lor.ext.i = zext i1 %3 to i32
  br label %cleanup

cleanup:                                          ; preds = %gt64.exit88, %gt64.exit, %land.end, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ %land.ext, %land.end ], [ %lor.ext.i.87, %gt64.exit88 ], [ %lor.ext.i, %gt64.exit ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float64_ge(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #2 {
entry:
  %and.i = and i32 %a.1, 2146435072
  %cmp = icmp eq i32 %and.i, 2146435072
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %and.i.94 = and i32 %a.1, 1048575
  %or = or i32 %and.i.94, %a.0
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %and.i.93 = and i32 %b.1, 2146435072
  %cmp15 = icmp eq i32 %and.i.93, 2146435072
  br i1 %cmp15, label %land.lhs.true.16, label %if.end

land.lhs.true.16:                                 ; preds = %lor.lhs.false
  %and.i.91 = and i32 %b.1, 1048575
  %or23 = or i32 %and.i.91, %b.0
  %tobool24 = icmp eq i32 %or23, 0
  br i1 %tobool24, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.16
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %0, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end:                                           ; preds = %land.lhs.true.16, %lor.lhs.false
  %shr.i.90 = lshr i32 %a.1, 31
  %shr.i.89 = lshr i32 %b.1, 31
  %cmp31 = icmp eq i32 %shr.i.90, %shr.i.89
  %tobool33 = icmp ne i32 %shr.i.90, 0
  br i1 %cmp31, label %if.end.42, label %if.then.32

if.then.32:                                       ; preds = %if.end
  br i1 %tobool33, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.then.32
  %or36 = or i32 %b.1, %a.1
  %shl = shl i32 %or36, 1
  %or38 = or i32 %b.0, %a.0
  %or40 = or i32 %or38, %shl
  %cmp41 = icmp eq i32 %or40, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.then.32
  %1 = phi i1 [ true, %if.then.32 ], [ %cmp41, %lor.rhs ]
  %lor.ext = zext i1 %1 to i32
  br label %cleanup

if.end.42:                                        ; preds = %if.end
  br i1 %tobool33, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end.42
  %cmp.i.82 = icmp ugt i32 %b.1, %a.1
  br i1 %cmp.i.82, label %ge64.exit88, label %lor.rhs.i.86

lor.rhs.i.86:                                     ; preds = %cond.true
  %cmp1.i.83 = icmp eq i32 %b.1, %a.1
  %cmp2.i.84 = icmp uge i32 %b.0, %a.0
  %cmp2..i.85 = and i1 %cmp2.i.84, %cmp1.i.83
  br label %ge64.exit88

ge64.exit88:                                      ; preds = %cond.true, %lor.rhs.i.86
  %2 = phi i1 [ true, %cond.true ], [ %cmp2..i.85, %lor.rhs.i.86 ]
  %lor.ext.i.87 = zext i1 %2 to i32
  br label %cleanup

cond.false:                                       ; preds = %if.end.42
  %cmp.i = icmp ugt i32 %a.1, %b.1
  br i1 %cmp.i, label %ge64.exit, label %lor.rhs.i

lor.rhs.i:                                        ; preds = %cond.false
  %cmp1.i = icmp eq i32 %a.1, %b.1
  %cmp2.i = icmp uge i32 %a.0, %b.0
  %cmp2..i = and i1 %cmp2.i, %cmp1.i
  br label %ge64.exit

ge64.exit:                                        ; preds = %cond.false, %lor.rhs.i
  %3 = phi i1 [ true, %cond.false ], [ %cmp2..i, %lor.rhs.i ]
  %lor.ext.i = zext i1 %3 to i32
  br label %cleanup

cleanup:                                          ; preds = %ge64.exit88, %ge64.exit, %lor.end, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ %lor.ext, %lor.end ], [ %lor.ext.i.87, %ge64.exit88 ], [ %lor.ext.i, %ge64.exit ]
  ret i32 %retval.0
}

attributes #0 = { inlinehint nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.1 (tags/RELEASE_371/final)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6}
!6 = distinct !{!6, !7, !"float32ToCommonNaN: %agg.result"}
!7 = distinct !{!7, !"float32ToCommonNaN"}
!8 = !{!9, !9, i64 0}
!9 = !{!"short", !3, i64 0}
!10 = !{!11}
!11 = distinct !{!11, !12, !"float64ToCommonNaN: %agg.result"}
!12 = distinct !{!12, !"float64ToCommonNaN"}
