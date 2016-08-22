; ModuleID = '../softfloat.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

%struct.float64 = type { i32, i32 }

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
  %shl = shl i32 %a.0, 1
  %cmp = icmp ugt i32 %shl, -2097153
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %tobool = icmp eq i32 %a.1, 0
  br i1 %tobool, label %lor.rhs, label %land.end

lor.rhs:                                          ; preds = %land.rhs
  %and = and i32 %a.0, 1048575
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
  %and = and i32 %a.0, 2146959360
  %cmp = icmp eq i32 %and, 2146435072
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %tobool = icmp eq i32 %a.1, 0
  br i1 %tobool, label %lor.rhs, label %land.end

lor.rhs:                                          ; preds = %land.rhs
  %and4 = and i32 %a.0, 524287
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
  ret i32 %a.1
}

; Function Attrs: inlinehint nounwind readnone
define i32 @extractFloat64Frac0(i32 %a.0, i32 %a.1) #1 {
entry:
  %and = and i32 %a.0, 1048575
  ret i32 %and
}

; Function Attrs: inlinehint nounwind readnone
define i32 @extractFloat64Exp(i32 %a.0, i32 %a.1) #1 {
entry:
  %shr = lshr i32 %a.0, 20
  %and = and i32 %shr, 2047
  ret i32 %and
}

; Function Attrs: inlinehint nounwind readnone
define i32 @extractFloat64Sign(i32 %a.0, i32 %a.1) #1 {
entry:
  %shr = lshr i32 %a.0, 31
  ret i32 %shr
}

; Function Attrs: inlinehint nounwind
define void @packFloat64(%struct.float64* noalias nocapture sret %agg.result, i32 %zSign, i32 %zExp, i32 %zSig0, i32 %zSig1) #0 {
entry:
  %shl = shl i32 %zSign, 31
  %shl1 = shl i32 %zExp, 20
  %add = add i32 %shl1, %shl
  %add2 = add i32 %add, %zSig0
  %z.sroa.0.0..sroa_idx = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %add2, i32* %z.sroa.0.0..sroa_idx, align 4
  %z.sroa.4.0..sroa_idx4 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %zSig1, i32* %z.sroa.4.0..sroa_idx4, align 4
  ret void
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

; Function Attrs: nounwind
define void @int32_to_float64(%struct.float64* noalias nocapture sret %agg.result, i32 %a) #2 {
entry:
  %cmp = icmp eq i32 %a, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %z.sroa.0.0..sroa_idx.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 0, i32* %z.sroa.0.0..sroa_idx.i, align 4, !alias.scope !5
  %z.sroa.4.0..sroa_idx4.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 0, i32* %z.sroa.4.0..sroa_idx4.i, align 4, !alias.scope !5
  br label %cleanup

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
  %sub2 = add nsw i32 %add6.i, -11
  %cmp3 = icmp sgt i32 %sub2, -1
  br i1 %cmp3, label %if.then.5, label %if.else

if.then.5:                                        ; preds = %if.end
  %shl = shl i32 %cond, %sub2
  br label %if.end.7

if.else:                                          ; preds = %if.end
  %sub6 = sub i32 11, %add6.i
  %sub.i = sub nsw i32 0, %sub6
  %and.i = and i32 %sub.i, 31
  %cmp.i = icmp eq i32 %sub6, 0
  br i1 %cmp.i, label %if.end.7, label %if.else.i

if.else.i:                                        ; preds = %if.else
  %cmp1.i = icmp slt i32 %sub6, 32
  br i1 %cmp1.i, label %if.then.2.i, label %if.else.4.i

if.then.2.i:                                      ; preds = %if.else.i
  %shl.i.24 = shl i32 %cond, %and.i
  %shr3.i = lshr i32 %cond, %sub6
  br label %if.end.7

if.else.4.i:                                      ; preds = %if.else.i
  %cmp5.i = icmp slt i32 %sub6, 64
  %and6.i = and i32 %sub6, 31
  %shr7.i = lshr i32 %cond, %and6.i
  %cond.i = select i1 %cmp5.i, i32 %shr7.i, i32 0
  br label %if.end.7

if.end.7:                                         ; preds = %if.else.4.i, %if.then.2.i, %if.else, %if.then.5
  %zSig0.0 = phi i32 [ %shl, %if.then.5 ], [ %shr3.i, %if.then.2.i ], [ %cond, %if.else ], [ 0, %if.else.4.i ]
  %zSig1.0 = phi i32 [ 0, %if.then.5 ], [ %shl.i.24, %if.then.2.i ], [ 0, %if.else ], [ %cond.i, %if.else.4.i ]
  %sub8 = sub i32 1053, %add6.i
  %shl1.i = shl i32 %sub8, 20
  %add.i = add i32 %shl1.i, %a.lobit
  %add2.i = add i32 %add.i, %zSig0.0
  %z.sroa.0.0..sroa_idx.i.22 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %add2.i, i32* %z.sroa.0.0..sroa_idx.i.22, align 4, !alias.scope !8
  %z.sroa.4.0..sroa_idx4.i.23 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %zSig1.0, i32* %z.sroa.4.0..sroa_idx4.i.23, align 4, !alias.scope !8
  br label %cleanup

cleanup:                                          ; preds = %if.end.7, %if.then
  ret void
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
define void @float32_to_float64(%struct.float64* noalias nocapture sret %agg.result, i32 %a) #2 {
entry:
  %and.i = and i32 %a, 8388607
  %shr.i.38 = lshr i32 %a, 23
  %and.i.39 = and i32 %shr.i.38, 255
  %shr.i.37 = lshr i32 %a, 31
  switch i32 %and.i.39, label %if.end.10 [
    i32 255, label %if.then
    i32 0, label %if.then.6
  ]

if.then:                                          ; preds = %entry
  %tobool = icmp eq i32 %and.i, 0
  br i1 %tobool, label %if.end, label %if.then.3

if.then.3:                                        ; preds = %if.then
  %and.i.i = and i32 %a, 2143289344
  %cmp.i.i.33 = icmp eq i32 %and.i.i, 2139095040
  %and1.i.i = and i32 %a, 4194303
  %tobool.i.i = icmp ne i32 %and1.i.i, 0
  %tobool.demorgan.i = and i1 %cmp.i.i.33, %tobool.i.i
  br i1 %tobool.demorgan.i, label %if.then.i, label %float32ToCommonNaN.exit

if.then.i:                                        ; preds = %if.then.3
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !11
  %or.i.i.34 = or i32 %0, 16
  store i32 %or.i.i.34, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !11
  br label %float32ToCommonNaN.exit

float32ToCommonNaN.exit:                          ; preds = %if.then.3, %if.then.i
  %shl.i.i.30 = shl i32 %a, 29
  %1 = lshr i32 %a, 3
  %shl.i.32 = shl nuw i32 %shr.i.37, 31
  %or.i = or i32 %1, %shl.i.32
  %or7.i = or i32 %or.i, 2146959360
  %2 = bitcast %struct.float64* %agg.result to i64*
  %z.sroa.6.0.insert.ext.i = zext i32 %shl.i.i.30 to i64
  %z.sroa.6.0.insert.shift.i = shl nuw i64 %z.sroa.6.0.insert.ext.i, 32
  %z.sroa.0.0.insert.ext.i = zext i32 %or7.i to i64
  %z.sroa.0.0.insert.insert.i = or i64 %z.sroa.0.0.insert.ext.i, %z.sroa.6.0.insert.shift.i
  store i64 %z.sroa.0.0.insert.insert.i, i64* %2, align 4, !alias.scope !14
  br label %cleanup

if.end:                                           ; preds = %if.then
  %shl.i.26 = shl nuw i32 %shr.i.37, 31
  %add.i.27 = or i32 %shl.i.26, 2146435072
  %z.sroa.0.0..sroa_idx.i.28 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %add.i.27, i32* %z.sroa.0.0..sroa_idx.i.28, align 4, !alias.scope !17
  %z.sroa.4.0..sroa_idx4.i.29 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 0, i32* %z.sroa.4.0..sroa_idx4.i.29, align 4, !alias.scope !17
  br label %cleanup

if.then.6:                                        ; preds = %entry
  %cmp7 = icmp eq i32 %and.i, 0
  br i1 %cmp7, label %if.then.8, label %if.end.9

if.then.8:                                        ; preds = %if.then.6
  %shl.i.23 = shl nuw i32 %shr.i.37, 31
  %z.sroa.0.0..sroa_idx.i.24 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %shl.i.23, i32* %z.sroa.0.0..sroa_idx.i.24, align 4, !alias.scope !20
  %z.sroa.4.0..sroa_idx4.i.25 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 0, i32* %z.sroa.4.0..sroa_idx4.i.25, align 4, !alias.scope !20
  br label %cleanup

if.end.9:                                         ; preds = %if.then.6
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
  %3 = load i32, i32* %arrayidx.i.i, align 4, !tbaa !1
  %add6.i.i = add nsw i32 %3, %shiftCount.1.i.i
  %sub.i = add nsw i32 %add6.i.i, -8
  %shl.i.22 = shl i32 %and.i, %sub.i
  %dec = sub i32 8, %add6.i.i
  br label %if.end.10

if.end.10:                                        ; preds = %entry, %if.end.9
  %aSig.0 = phi i32 [ %and.i, %entry ], [ %shl.i.22, %if.end.9 ]
  %aExp.0 = phi i32 [ %and.i.39, %entry ], [ %dec, %if.end.9 ]
  %shl.i.21 = shl i32 %aSig.0, 29
  %shr3.i = lshr i32 %aSig.0, 3
  %shl.i = shl nuw i32 %shr.i.37, 31
  %add = shl i32 %aExp.0, 20
  %shl1.i = or i32 %shl.i, 939524096
  %add.i = add i32 %shl1.i, %shr3.i
  %add2.i = add i32 %add.i, %add
  %z.sroa.0.0..sroa_idx.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %add2.i, i32* %z.sroa.0.0..sroa_idx.i, align 4, !alias.scope !23
  %z.sroa.4.0..sroa_idx4.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %shl.i.21, i32* %z.sroa.4.0..sroa_idx4.i, align 4, !alias.scope !23
  br label %cleanup

cleanup:                                          ; preds = %if.end.10, %if.then.8, %if.end, %float32ToCommonNaN.exit
  ret void
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
  %6 = load i16, i16* %arrayidx.i, align 2, !tbaa !26
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
  %7 = load i16, i16* %arrayidx8.i, align 2, !tbaa !26
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
  %and.i.127 = and i32 %a.0, 1048575
  %shr.i.125 = lshr i32 %a.0, 20
  %and.i.126 = and i32 %shr.i.125, 2047
  %shr.i.124 = lshr i32 %a.0, 31
  %sub = add nsw i32 %and.i.126, -1043
  %cmp = icmp sgt i32 %sub, -1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %cmp12 = icmp ugt i32 %and.i.126, 1054
  br i1 %cmp12, label %if.then.13, label %if.end.16

if.then.13:                                       ; preds = %if.then
  %cmp14 = icmp ne i32 %and.i.126, 2047
  %or = or i32 %and.i.127, %a.1
  %tobool = icmp eq i32 %or, 0
  %or.cond122 = or i1 %cmp14, %tobool
  %call11. = select i1 %or.cond122, i32 %shr.i.124, i32 0
  br label %invalid

if.end.16:                                        ; preds = %if.then
  %or17 = or i32 %and.i.127, 1048576
  %shl.i = shl i32 %a.1, %sub
  %cmp.i = icmp eq i32 %sub, 0
  br i1 %cmp.i, label %shortShift64Left.exit, label %cond.false.i

cond.false.i:                                     ; preds = %if.end.16
  %shl1.i = shl i32 %or17, %sub
  %sub.i = sub nsw i32 1043, %shr.i.125
  %and.i = and i32 %sub.i, 31
  %shr.i = lshr i32 %a.1, %and.i
  %or.i.123 = or i32 %shr.i, %shl1.i
  br label %shortShift64Left.exit

shortShift64Left.exit:                            ; preds = %if.end.16, %cond.false.i
  %cond.i = phi i32 [ %or.i.123, %cond.false.i ], [ %or17, %if.end.16 ]
  %cmp18 = icmp ugt i32 %cond.i, -2147483648
  br i1 %cmp18, label %invalid, label %if.end.32

if.else:                                          ; preds = %entry
  %cmp21 = icmp ne i32 %a.1, 0
  %conv = zext i1 %cmp21 to i32
  %cmp22 = icmp ult i32 %and.i.126, 1022
  br i1 %cmp22, label %if.then.24, label %if.else.27

if.then.24:                                       ; preds = %if.else
  %or25 = or i32 %and.i.126, %and.i.127
  %or26 = or i32 %or25, %conv
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
  %and.i.87 = and i32 %a.0, 1048575
  %shr.i.85 = lshr i32 %a.0, 20
  %and.i.86 = and i32 %shr.i.85, 2047
  %shr.i.84 = lshr i32 %a.0, 31
  %sub = add nsw i32 %and.i.86, -1043
  %cmp = icmp sgt i32 %sub, -1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %cmp12 = icmp ugt i32 %and.i.86, 1054
  br i1 %cmp12, label %if.then.13, label %if.end.16

if.then.13:                                       ; preds = %if.then
  %cmp14 = icmp ne i32 %and.i.86, 2047
  %or = or i32 %and.i.87, %a.1
  %tobool = icmp eq i32 %or, 0
  %or.cond82 = or i1 %cmp14, %tobool
  %call11. = select i1 %or.cond82, i32 %shr.i.84, i32 0
  br label %invalid

if.end.16:                                        ; preds = %if.then
  %or17 = or i32 %and.i.87, 1048576
  %shl.i = shl i32 %a.1, %sub
  %cmp.i = icmp eq i32 %sub, 0
  br i1 %cmp.i, label %if.end.30, label %cond.false.i

cond.false.i:                                     ; preds = %if.end.16
  %shl1.i = shl i32 %or17, %sub
  %sub.i = sub nsw i32 1043, %shr.i.85
  %and.i = and i32 %sub.i, 31
  %shr.i = lshr i32 %a.1, %and.i
  %or.i.83 = or i32 %shr.i, %shl1.i
  br label %if.end.30

if.else:                                          ; preds = %entry
  %cmp18 = icmp ult i32 %and.i.86, 1023
  br i1 %cmp18, label %if.then.19, label %if.end.26

if.then.19:                                       ; preds = %if.else
  %or20 = or i32 %and.i.87, %a.1
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
  %or28 = or i32 %shl, %a.1
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
  %and.i = and i32 %a.0, 1048575
  %shr.i.51 = lshr i32 %a.0, 20
  %and.i.52 = and i32 %shr.i.51, 2047
  %shr.i.50 = lshr i32 %a.0, 31
  %cmp = icmp eq i32 %and.i.52, 2047
  br i1 %cmp, label %if.then, label %if.end.19

if.then:                                          ; preds = %entry
  %or = or i32 %and.i, %a.1
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %if.end, label %if.then.12

if.then.12:                                       ; preds = %if.then
  %and.i.i = and i32 %a.0, 2146959360
  %cmp.i.i = icmp eq i32 %and.i.i, 2146435072
  br i1 %cmp.i.i, label %land.rhs.i.i, label %float64ToCommonNaN.exit

land.rhs.i.i:                                     ; preds = %if.then.12
  %and4.i.i = and i32 %a.0, 524287
  %0 = or i32 %and4.i.i, %a.1
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %float64ToCommonNaN.exit, label %if.then.i

if.then.i:                                        ; preds = %land.rhs.i.i
  %2 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !28
  %or.i.11.i = or i32 %2, 16
  store i32 %or.i.11.i, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !28
  br label %float64ToCommonNaN.exit

float64ToCommonNaN.exit:                          ; preds = %if.then.12, %land.rhs.i.i, %if.then.i
  %shl1.i.i = shl i32 %a.0, 12
  %shr.i.i = lshr i32 %a.1, 20
  %or.i.i = or i32 %shr.i.i, %shl1.i.i
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
  %shr.i = lshr i32 %a.1, 22
  %or.i = or i32 %shl.i, %shr.i
  %shl3.i.mask = and i32 %a.1, 4194303
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
define void @float64_round_to_int(%struct.float64* noalias sret %agg.result, i32 %a.0, i32 %a.1) #2 {
entry:
  %shr.i = lshr i32 %a.0, 20
  %and.i = and i32 %shr.i, 2047
  %cmp = icmp ugt i32 %and.i, 1042
  br i1 %cmp, label %if.then, label %if.else.66

if.then:                                          ; preds = %entry
  %cmp3 = icmp ugt i32 %and.i, 1074
  br i1 %cmp3, label %if.then.4, label %if.end.17

if.then.4:                                        ; preds = %if.then
  %cmp5 = icmp eq i32 %and.i, 2047
  br i1 %cmp5, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %if.then.4
  %and.i.248 = and i32 %a.0, 1048575
  %or = or i32 %and.i.248, %a.1
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %if.end, label %if.then.12

if.then.12:                                       ; preds = %land.lhs.true
  %and.i.56.i = and i32 %a.0, 2146959360
  %cmp.i.57.i = icmp eq i32 %and.i.56.i, 2146435072
  br i1 %cmp.i.57.i, label %land.rhs.i.59.i, label %float64_is_signaling_nan.exit.i

land.rhs.i.59.i:                                  ; preds = %if.then.12
  %tobool.i.58.i = icmp eq i32 %a.1, 0
  br i1 %tobool.i.58.i, label %lor.rhs.i.i, label %if.then.thread.i

if.then.thread.i:                                 ; preds = %land.rhs.i.59.i
  %or17.67.i = or i32 %a.0, 524288
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !31
  %or.i.79.i = or i32 %0, 16
  store i32 %or.i.79.i, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !31
  %b.sroa.0.0..sroa_idx.73.80.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.true.i

lor.rhs.i.i:                                      ; preds = %land.rhs.i.59.i
  %and4.i.60.i = and i32 %a.0, 524287
  %tobool5.i.61.i = icmp ne i32 %and4.i.60.i, 0
  %and4.i.i = and i32 %a.0, 524287
  %tobool5.i.i = icmp ne i32 %and4.i.i, 0
  br label %float64_is_signaling_nan.exit.i

float64_is_signaling_nan.exit.i:                  ; preds = %if.then.12, %lor.rhs.i.i
  %1 = phi i1 [ %tobool5.i.61.i, %lor.rhs.i.i ], [ false, %if.then.12 ]
  %2 = phi i1 [ %tobool5.i.i, %lor.rhs.i.i ], [ false, %if.then.12 ]
  %or.i = or i32 %a.0, 524288
  %or1865.i = or i1 %1, %2
  br i1 %or1865.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %float64_is_signaling_nan.exit.i
  %3 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !31
  %or.i.i = or i32 %3, 16
  store i32 %or.i.i, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !31
  %b.sroa.0.0..sroa_idx.73.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br i1 %2, label %cond.true.i, label %cond.false.i

if.end.i:                                         ; preds = %float64_is_signaling_nan.exit.i
  %b.sroa.0.0..sroa_idx.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.false.i

cond.true.i:                                      ; preds = %if.then.i, %if.then.thread.i
  %b.sroa.0.0..sroa_idx77.i = phi i32* [ %b.sroa.0.0..sroa_idx.73.i, %if.then.i ], [ %b.sroa.0.0..sroa_idx.73.80.i, %if.then.thread.i ]
  %or177174.i = phi i32 [ %or.i, %if.then.i ], [ %or17.67.i, %if.then.thread.i ]
  store i32 %or177174.i, i32* %b.sroa.0.0..sroa_idx77.i, align 4, !alias.scope !31
  %b.sroa.7.0..sroa_idx38.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %b.sroa.7.0..sroa_idx38.i, align 4, !alias.scope !31
  br label %cleanup

cond.false.i:                                     ; preds = %if.end.i, %if.then.i
  %b.sroa.0.0..sroa_idx78.i = phi i32* [ %b.sroa.0.0..sroa_idx.73.i, %if.then.i ], [ %b.sroa.0.0..sroa_idx.i, %if.end.i ]
  store i32 %or.i, i32* %b.sroa.0.0..sroa_idx78.i, align 4
  %a.sroa.7.0..sroa_idx46.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.7.0..sroa_idx46.i, align 4
  br label %cleanup

if.end:                                           ; preds = %land.lhs.true, %if.then.4
  %a.sroa.0.0..sroa_idx208 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %a.0, i32* %a.sroa.0.0..sroa_idx208, align 4
  %a.sroa.15.0..sroa_idx213 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.15.0..sroa_idx213, align 4
  br label %cleanup

if.end.17:                                        ; preds = %if.then
  %sub = sub nsw i32 1074, %and.i
  %shl18 = shl i32 2, %sub
  %sub19 = add i32 %shl18, -1
  %4 = load i32, i32* @float_rounding_mode, align 4, !tbaa !1
  switch i32 %4, label %if.then.49 [
    i32 0, label %if.then.21
    i32 1, label %if.end.62
  ]

if.then.21:                                       ; preds = %if.end.17
  %tobool22 = icmp ult i32 %sub, 31
  br i1 %tobool22, label %if.then.23, label %if.else

if.then.23:                                       ; preds = %if.then.21
  %shr = lshr i32 %shl18, 1
  %add.i.244 = add i32 %shr, %a.1
  %cmp.i.245 = icmp ult i32 %add.i.244, %a.1
  %conv.i.246 = zext i1 %cmp.i.245 to i32
  %add2.i.247 = add i32 %conv.i.246, %a.0
  %and = and i32 %add.i.244, %sub19
  %cmp29 = icmp eq i32 %and, 0
  br i1 %cmp29, label %if.then.30, label %if.end.62

if.then.30:                                       ; preds = %if.then.23
  %neg = xor i32 %shl18, -1
  %and32 = and i32 %add.i.244, %neg
  br label %if.end.62

if.else:                                          ; preds = %if.then.21
  %cmp35 = icmp slt i32 %a.1, 0
  br i1 %cmp35, label %if.then.36, label %if.end.62

if.then.36:                                       ; preds = %if.else
  %inc = add i32 %a.0, 1
  %shl39.mask = and i32 %a.1, 2147483647
  %cmp40 = icmp eq i32 %shl39.mask, 0
  %and43 = and i32 %inc, -2
  %and43.inc = select i1 %cmp40, i32 %and43, i32 %inc
  br label %if.end.62

if.then.49:                                       ; preds = %if.end.17
  %shr.i.243 = lshr i32 %a.0, 31
  %cmp53 = icmp eq i32 %4, 2
  %conv = zext i1 %cmp53 to i32
  %tobool54 = icmp eq i32 %shr.i.243, %conv
  br i1 %tobool54, label %if.end.62, label %if.then.55

if.then.55:                                       ; preds = %if.then.49
  %add.i.242 = add i32 %sub19, %a.1
  %cmp.i = icmp ult i32 %add.i.242, %a.1
  %conv.i = zext i1 %cmp.i to i32
  %add2.i = add i32 %conv.i, %a.0
  br label %if.end.62

if.end.62:                                        ; preds = %if.then.36, %if.end.17, %if.then.49, %if.then.55, %if.then.30, %if.then.23, %if.else
  %z.sroa.20.0 = phi i32 [ %a.1, %if.then.49 ], [ %add.i.242, %if.then.55 ], [ %a.1, %if.end.17 ], [ %and32, %if.then.30 ], [ %add.i.244, %if.then.23 ], [ %a.1, %if.else ], [ %a.1, %if.then.36 ]
  %z.sroa.0.0 = phi i32 [ %a.0, %if.then.49 ], [ %add2.i, %if.then.55 ], [ %a.0, %if.end.17 ], [ %add2.i.247, %if.then.30 ], [ %add2.i.247, %if.then.23 ], [ %a.0, %if.else ], [ %and43.inc, %if.then.36 ]
  %neg63 = sub i32 0, %shl18
  %and65 = and i32 %z.sroa.20.0, %neg63
  br label %if.end.150

if.else.66:                                       ; preds = %entry
  %cmp67 = icmp ult i32 %and.i, 1023
  br i1 %cmp67, label %if.then.69, label %if.end.102

if.then.69:                                       ; preds = %if.else.66
  %shl71 = shl i32 %a.0, 1
  %or73 = or i32 %shl71, %a.1
  %cmp74 = icmp eq i32 %or73, 0
  br i1 %cmp74, label %if.then.76, label %if.end.77

if.then.76:                                       ; preds = %if.then.69
  %a.sroa.0.0..sroa_idx210 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %a.0, i32* %a.sroa.0.0..sroa_idx210, align 4
  %a.sroa.15.0..sroa_idx215 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.15.0..sroa_idx215, align 4
  br label %cleanup

if.end.77:                                        ; preds = %if.then.69
  %5 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or78 = or i32 %5, 1
  store i32 %or78, i32* @float_exception_flags, align 4, !tbaa !1
  %shr.i.241 = lshr i32 %a.0, 31
  %6 = load i32, i32* @float_rounding_mode, align 4, !tbaa !1
  switch i32 %6, label %sw.epilog [
    i32 0, label %sw.bb
    i32 3, label %sw.bb.95
    i32 2, label %sw.bb.97
  ]

sw.bb:                                            ; preds = %if.end.77
  %cmp82 = icmp eq i32 %and.i, 1022
  br i1 %cmp82, label %land.lhs.true.84, label %sw.epilog

land.lhs.true.84:                                 ; preds = %sw.bb
  %and.i.240 = and i32 %a.0, 1048575
  %or91 = or i32 %and.i.240, %a.1
  %tobool92 = icmp eq i32 %or91, 0
  br i1 %tobool92, label %sw.epilog, label %if.then.93

if.then.93:                                       ; preds = %land.lhs.true.84
  %shl.i.237 = shl nuw i32 %shr.i.241, 31
  %add.i = or i32 %shl.i.237, 1072693248
  %z.sroa.0.0..sroa_idx.i.238 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %add.i, i32* %z.sroa.0.0..sroa_idx.i.238, align 4, !alias.scope !34
  %z.sroa.4.0..sroa_idx4.i.239 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 0, i32* %z.sroa.4.0..sroa_idx4.i.239, align 4, !alias.scope !34
  br label %cleanup

sw.bb.95:                                         ; preds = %if.end.77
  %tobool96 = icmp eq i32 %shr.i.241, 0
  %z.sroa.0.0..sroa_idx.i.233 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br i1 %tobool96, label %cond.false, label %cond.true

cond.true:                                        ; preds = %sw.bb.95
  store i32 -1074790400, i32* %z.sroa.0.0..sroa_idx.i.233, align 4, !alias.scope !37
  %z.sroa.4.0..sroa_idx4.i.236 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 0, i32* %z.sroa.4.0..sroa_idx4.i.236, align 4, !alias.scope !37
  br label %cleanup

cond.false:                                       ; preds = %sw.bb.95
  store i32 0, i32* %z.sroa.0.0..sroa_idx.i.233, align 4, !alias.scope !40
  %z.sroa.4.0..sroa_idx4.i.234 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 0, i32* %z.sroa.4.0..sroa_idx4.i.234, align 4, !alias.scope !40
  br label %cleanup

sw.bb.97:                                         ; preds = %if.end.77
  %tobool98 = icmp eq i32 %shr.i.241, 0
  %z.sroa.0.0..sroa_idx.i.229 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br i1 %tobool98, label %cond.false.100, label %cond.true.99

cond.true.99:                                     ; preds = %sw.bb.97
  store i32 -2147483648, i32* %z.sroa.0.0..sroa_idx.i.229, align 4, !alias.scope !43
  %z.sroa.4.0..sroa_idx4.i.232 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 0, i32* %z.sroa.4.0..sroa_idx4.i.232, align 4, !alias.scope !43
  br label %cleanup

cond.false.100:                                   ; preds = %sw.bb.97
  store i32 1072693248, i32* %z.sroa.0.0..sroa_idx.i.229, align 4, !alias.scope !46
  %z.sroa.4.0..sroa_idx4.i.230 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 0, i32* %z.sroa.4.0..sroa_idx4.i.230, align 4, !alias.scope !46
  br label %cleanup

sw.epilog:                                        ; preds = %land.lhs.true.84, %sw.bb, %if.end.77
  %shl.i = shl nuw i32 %shr.i.241, 31
  %z.sroa.0.0..sroa_idx.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %shl.i, i32* %z.sroa.0.0..sroa_idx.i, align 4, !alias.scope !49
  %z.sroa.4.0..sroa_idx4.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 0, i32* %z.sroa.4.0..sroa_idx4.i, align 4, !alias.scope !49
  br label %cleanup

if.end.102:                                       ; preds = %if.else.66
  %sub103 = sub nsw i32 1043, %and.i
  %shl104 = shl i32 1, %sub103
  %sub105 = add i32 %shl104, -1
  %7 = load i32, i32* @float_rounding_mode, align 4, !tbaa !1
  switch i32 %7, label %if.then.128 [
    i32 0, label %if.then.111
    i32 1, label %if.end.146
  ]

if.then.111:                                      ; preds = %if.end.102
  %shr112 = lshr i32 %shl104, 1
  %add = add i32 %shr112, %a.0
  %and115 = and i32 %add, %sub105
  %or117 = or i32 %and115, %a.1
  %cmp118 = icmp eq i32 %or117, 0
  br i1 %cmp118, label %if.then.120, label %if.end.146

if.then.120:                                      ; preds = %if.then.111
  %neg121 = xor i32 %shl104, -1
  %and123 = and i32 %add, %neg121
  br label %if.end.146

if.then.128:                                      ; preds = %if.end.102
  %shr.i.228 = lshr i32 %a.0, 31
  %cmp132 = icmp eq i32 %7, 2
  %conv133 = zext i1 %cmp132 to i32
  %tobool135 = icmp eq i32 %shr.i.228, %conv133
  br i1 %tobool135, label %if.end.146, label %if.then.136

if.then.136:                                      ; preds = %if.then.128
  %cmp138 = icmp ne i32 %a.1, 0
  %conv139 = zext i1 %cmp138 to i32
  %or141 = or i32 %conv139, %a.0
  %add143 = add i32 %sub105, %or141
  br label %if.end.146

if.end.146:                                       ; preds = %if.end.102, %if.then.128, %if.then.136, %if.then.111, %if.then.120
  %z.sroa.0.1 = phi i32 [ %a.0, %if.then.128 ], [ %add143, %if.then.136 ], [ %a.0, %if.end.102 ], [ %and123, %if.then.120 ], [ %add, %if.then.111 ]
  %neg147 = sub i32 0, %shl104
  %and149 = and i32 %z.sroa.0.1, %neg147
  br label %if.end.150

if.end.150:                                       ; preds = %if.end.146, %if.end.62
  %z.sroa.20.1 = phi i32 [ %and65, %if.end.62 ], [ 0, %if.end.146 ]
  %z.sroa.0.2 = phi i32 [ %z.sroa.0.0, %if.end.62 ], [ %and149, %if.end.146 ]
  %cmp153 = icmp eq i32 %z.sroa.20.1, %a.1
  %cmp157 = icmp eq i32 %z.sroa.0.2, %a.0
  %or.cond = and i1 %cmp153, %cmp157
  br i1 %or.cond, label %if.end.161, label %if.then.159

if.then.159:                                      ; preds = %if.end.150
  %8 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or160 = or i32 %8, 1
  store i32 %or160, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.161

if.end.161:                                       ; preds = %if.end.150, %if.then.159
  %9 = bitcast %struct.float64* %agg.result to i64*
  %z.sroa.20.0.insert.ext = zext i32 %z.sroa.20.1 to i64
  %z.sroa.20.0.insert.shift = shl nuw i64 %z.sroa.20.0.insert.ext, 32
  %z.sroa.0.0.insert.ext = zext i32 %z.sroa.0.2 to i64
  %z.sroa.0.0.insert.insert = or i64 %z.sroa.20.0.insert.shift, %z.sroa.0.0.insert.ext
  store i64 %z.sroa.0.0.insert.insert, i64* %9, align 4
  br label %cleanup

cleanup:                                          ; preds = %cond.false.i, %cond.true.i, %cond.true.99, %cond.false.100, %cond.true, %cond.false, %if.end.161, %sw.epilog, %if.then.93, %if.then.76, %if.end
  ret void
}

; Function Attrs: nounwind
define void @float64_add(%struct.float64* noalias sret %agg.result, i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #2 {
entry:
  %shr.i = lshr i32 %a.0, 31
  %shr.i.25 = lshr i32 %b.0, 31
  %cmp = icmp eq i32 %shr.i, %shr.i.25
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  tail call fastcc void @addFloat64Sigs(%struct.float64* noalias %agg.result, i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1, i32 %shr.i)
  br label %cleanup

if.else:                                          ; preds = %entry
  tail call fastcc void @subFloat64Sigs(%struct.float64* noalias %agg.result, i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1, i32 %shr.i)
  br label %cleanup

cleanup:                                          ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: nounwind
define internal fastcc void @addFloat64Sigs(%struct.float64* noalias %agg.result, i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1, i32 %zSign) #2 {
entry:
  %and.i = and i32 %a.0, 1048575
  %shr.i.297 = lshr i32 %a.0, 20
  %and.i.298 = and i32 %shr.i.297, 2047
  %and.i.296 = and i32 %b.0, 1048575
  %shr.i.294 = lshr i32 %b.0, 20
  %and.i.295 = and i32 %shr.i.294, 2047
  %sub = sub nsw i32 %and.i.298, %and.i.295
  %cmp = icmp sgt i32 %sub, 0
  br i1 %cmp, label %if.then, label %if.else.33

if.then:                                          ; preds = %entry
  %cmp21 = icmp eq i32 %and.i.298, 2047
  br i1 %cmp21, label %if.then.22, label %if.end.28

if.then.22:                                       ; preds = %if.then
  %or = or i32 %and.i, %a.1
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %if.end, label %if.then.23

if.then.23:                                       ; preds = %if.then.22
  %and.i.56.i.244 = and i32 %a.0, 2146959360
  %cmp.i.57.i.245 = icmp eq i32 %and.i.56.i.244, 2146435072
  br i1 %cmp.i.57.i.245, label %land.rhs.i.59.i.247, label %float64_is_signaling_nan.exit64.i.253

land.rhs.i.59.i.247:                              ; preds = %if.then.23
  %tobool.i.58.i.246 = icmp eq i32 %a.1, 0
  br i1 %tobool.i.58.i.246, label %lor.rhs.i.62.i.250, label %float64_is_signaling_nan.exit64.i.253

lor.rhs.i.62.i.250:                               ; preds = %land.rhs.i.59.i.247
  %and4.i.60.i.248 = and i32 %a.0, 524287
  %tobool5.i.61.i.249 = icmp ne i32 %and4.i.60.i.248, 0
  br label %float64_is_signaling_nan.exit64.i.253

float64_is_signaling_nan.exit64.i.253:            ; preds = %lor.rhs.i.62.i.250, %land.rhs.i.59.i.247, %if.then.23
  %0 = phi i1 [ false, %if.then.23 ], [ true, %land.rhs.i.59.i.247 ], [ %tobool5.i.61.i.249, %lor.rhs.i.62.i.250 ]
  %shl.i.i.251 = shl i32 %b.0, 1
  %cmp.i.50.i.252 = icmp ugt i32 %shl.i.i.251, -2097153
  %1 = or i32 %and.i.296, %b.1
  %2 = icmp ne i32 %1, 0
  %3 = and i1 %cmp.i.50.i.252, %2
  %and.i.i.259 = and i32 %b.0, 2146959360
  %cmp.i.i.260 = icmp eq i32 %and.i.i.259, 2146435072
  br i1 %cmp.i.i.260, label %land.rhs.i.i.263, label %float64_is_signaling_nan.exit.i.274

land.rhs.i.i.263:                                 ; preds = %float64_is_signaling_nan.exit64.i.253
  %tobool.i.i.262 = icmp eq i32 %b.1, 0
  br i1 %tobool.i.i.262, label %lor.rhs.i.i.270, label %if.then.thread.i.267

if.then.thread.i.267:                             ; preds = %land.rhs.i.i.263
  %or17.67.i.264 = or i32 %b.0, 524288
  %4 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !52
  %or.i.79.i.265 = or i32 %4, 16
  store i32 %or.i.79.i.265, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !52
  %b.sroa.0.0..sroa_idx.73.80.i.266 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.true.i.283

lor.rhs.i.i.270:                                  ; preds = %land.rhs.i.i.263
  %and4.i.i.268 = and i32 %b.0, 524287
  %tobool5.i.i.269 = icmp ne i32 %and4.i.i.268, 0
  br label %float64_is_signaling_nan.exit.i.274

float64_is_signaling_nan.exit.i.274:              ; preds = %lor.rhs.i.i.270, %float64_is_signaling_nan.exit64.i.253
  %5 = phi i1 [ false, %float64_is_signaling_nan.exit64.i.253 ], [ %tobool5.i.i.269, %lor.rhs.i.i.270 ]
  %or.i.271 = or i32 %a.0, 524288
  %or17.i.272 = or i32 %b.0, 524288
  %or1865.i.273 = or i1 %0, %5
  br i1 %or1865.i.273, label %if.then.i.277, label %if.end.i.279

if.then.i.277:                                    ; preds = %float64_is_signaling_nan.exit.i.274
  %6 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !52
  %or.i.i.275 = or i32 %6, 16
  store i32 %or.i.i.275, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !52
  %b.sroa.0.0..sroa_idx.73.i.276 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br i1 %5, label %cond.true.i.283, label %cond.false.i.285

if.end.i.279:                                     ; preds = %float64_is_signaling_nan.exit.i.274
  %b.sroa.0.0..sroa_idx.i.278 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.false.i.285

cond.true.i.283:                                  ; preds = %if.then.i.277, %if.then.thread.i.267
  %b.sroa.0.0..sroa_idx77.i.280 = phi i32* [ %b.sroa.0.0..sroa_idx.73.i.276, %if.then.i.277 ], [ %b.sroa.0.0..sroa_idx.73.80.i.266, %if.then.thread.i.267 ]
  %or177174.i.281 = phi i32 [ %or17.i.272, %if.then.i.277 ], [ %or17.67.i.264, %if.then.thread.i.267 ]
  store i32 %or177174.i.281, i32* %b.sroa.0.0..sroa_idx77.i.280, align 4, !alias.scope !52
  %b.sroa.7.0..sroa_idx38.i.282 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %b.1, i32* %b.sroa.7.0..sroa_idx38.i.282, align 4, !alias.scope !52
  br label %cleanup

cond.false.i.285:                                 ; preds = %if.end.i.279, %if.then.i.277
  %b.sroa.0.0..sroa_idx78.i.284 = phi i32* [ %b.sroa.0.0..sroa_idx.73.i.276, %if.then.i.277 ], [ %b.sroa.0.0..sroa_idx.i.278, %if.end.i.279 ]
  br i1 %0, label %cond.true.21.i.287, label %cond.false.22.i.288

cond.true.21.i.287:                               ; preds = %cond.false.i.285
  store i32 %or.i.271, i32* %b.sroa.0.0..sroa_idx78.i.284, align 4, !alias.scope !52
  %a.sroa.7.0..sroa_idx46.i.286 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.7.0..sroa_idx46.i.286, align 4, !alias.scope !52
  br label %cleanup

cond.false.22.i.288:                              ; preds = %cond.false.i.285
  br i1 %3, label %cond.true.24.i.290, label %cond.false.25.i.292

cond.true.24.i.290:                               ; preds = %cond.false.22.i.288
  store i32 %or17.i.272, i32* %b.sroa.0.0..sroa_idx78.i.284, align 4, !alias.scope !52
  %b.sroa.7.0..sroa_idx39.i.289 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %b.1, i32* %b.sroa.7.0..sroa_idx39.i.289, align 4, !alias.scope !52
  br label %cleanup

cond.false.25.i.292:                              ; preds = %cond.false.22.i.288
  store i32 %or.i.271, i32* %b.sroa.0.0..sroa_idx78.i.284, align 4, !alias.scope !52
  %a.sroa.7.0..sroa_idx47.i.291 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.7.0..sroa_idx47.i.291, align 4, !alias.scope !52
  br label %cleanup

if.end:                                           ; preds = %if.then.22
  %a.sroa.0.0..sroa_idx = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %a.0, i32* %a.sroa.0.0..sroa_idx, align 4
  %a.sroa.9.0..sroa_idx128 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.9.0..sroa_idx128, align 4
  br label %cleanup

if.end.28:                                        ; preds = %if.then
  %cmp29 = icmp eq i32 %and.i.295, 0
  br i1 %cmp29, label %if.end.32, label %if.end.32.thread

if.end.32.thread:                                 ; preds = %if.end.28
  %or31 = or i32 %and.i.296, 1048576
  br label %if.else.i.212

if.end.32:                                        ; preds = %if.end.28
  %dec = add nsw i32 %sub, -1
  %cmp.i.210 = icmp eq i32 %dec, 0
  br i1 %cmp.i.210, label %if.end.72, label %if.else.i.212

if.else.i.212:                                    ; preds = %if.end.32.thread, %if.end.32
  %.pn = phi i32 [ 0, %if.end.32.thread ], [ 1, %if.end.32 ]
  %expDiff.0333 = phi i32 [ %sub, %if.end.32.thread ], [ %dec, %if.end.32 ]
  %bSig0.0332 = phi i32 [ %or31, %if.end.32.thread ], [ %and.i.296, %if.end.32 ]
  %and.i.209334.in = sub nsw i32 %.pn, %sub
  %and.i.209334 = and i32 %and.i.209334.in, 31
  %cmp1.i.211 = icmp slt i32 %expDiff.0333, 32
  br i1 %cmp1.i.211, label %if.then.2.i.218, label %if.else.5.i.220

if.then.2.i.218:                                  ; preds = %if.else.i.212
  %shl.i.213 = shl i32 %b.1, %and.i.209334
  %shl3.i.214 = shl i32 %bSig0.0332, %and.i.209334
  %shr.i.215 = lshr i32 %b.1, %expDiff.0333
  %or.i.216 = or i32 %shl3.i.214, %shr.i.215
  %shr4.i.217 = lshr i32 %bSig0.0332, %expDiff.0333
  br label %if.end.19.i.239

if.else.5.i.220:                                  ; preds = %if.else.i.212
  %cmp6.i.219 = icmp eq i32 %expDiff.0333, 32
  br i1 %cmp6.i.219, label %if.end.19.i.239, label %if.else.8.i.222

if.else.8.i.222:                                  ; preds = %if.else.5.i.220
  %cmp10.i.221 = icmp slt i32 %expDiff.0333, 64
  br i1 %cmp10.i.221, label %if.then.11.i.226, label %if.else.15.i.231

if.then.11.i.226:                                 ; preds = %if.else.8.i.222
  %shl12.i.223 = shl i32 %bSig0.0332, %and.i.209334
  %and13.i.224 = and i32 %expDiff.0333, 31
  %shr14.i.225 = lshr i32 %bSig0.0332, %and13.i.224
  br label %if.end.19.i.239

if.else.15.i.231:                                 ; preds = %if.else.8.i.222
  %cmp16.i.227 = icmp eq i32 %expDiff.0333, 64
  %cmp17.i.228 = icmp ne i32 %bSig0.0332, 0
  %conv.i.229 = zext i1 %cmp17.i.228 to i32
  %cond.i.230 = select i1 %cmp16.i.227, i32 %bSig0.0332, i32 %conv.i.229
  br label %if.end.19.i.239

if.end.19.i.239:                                  ; preds = %if.else.15.i.231, %if.then.11.i.226, %if.else.5.i.220, %if.then.2.i.218
  %z0.0.i.232 = phi i32 [ %shr4.i.217, %if.then.2.i.218 ], [ 0, %if.else.5.i.220 ], [ 0, %if.then.11.i.226 ], [ 0, %if.else.15.i.231 ]
  %z1.1.i.233 = phi i32 [ %or.i.216, %if.then.2.i.218 ], [ %bSig0.0332, %if.else.5.i.220 ], [ %shr14.i.225, %if.then.11.i.226 ], [ 0, %if.else.15.i.231 ]
  %z2.1.i.234 = phi i32 [ %shl.i.213, %if.then.2.i.218 ], [ %b.1, %if.else.5.i.220 ], [ %shl12.i.223, %if.then.11.i.226 ], [ %cond.i.230, %if.else.15.i.231 ]
  %a2.addr.1.i.235 = phi i32 [ 0, %if.then.2.i.218 ], [ 0, %if.else.5.i.220 ], [ %b.1, %if.then.11.i.226 ], [ %b.1, %if.else.15.i.231 ]
  %cmp20.i.236 = icmp ne i32 %a2.addr.1.i.235, 0
  %conv21.i.237 = zext i1 %cmp20.i.236 to i32
  %or22.i.238 = or i32 %conv21.i.237, %z2.1.i.234
  br label %if.end.72

if.else.33:                                       ; preds = %entry
  %cmp34 = icmp slt i32 %sub, 0
  br i1 %cmp34, label %if.then.35, label %if.else.53

if.then.35:                                       ; preds = %if.else.33
  %cmp36 = icmp eq i32 %and.i.295, 2047
  br i1 %cmp36, label %if.then.37, label %if.end.46

if.then.37:                                       ; preds = %if.then.35
  %or38 = or i32 %and.i.296, %b.1
  %tobool39 = icmp eq i32 %or38, 0
  br i1 %tobool39, label %if.end.45, label %if.then.40

if.then.40:                                       ; preds = %if.then.37
  %and.i.56.i.159 = and i32 %a.0, 2146959360
  %cmp.i.57.i.160 = icmp eq i32 %and.i.56.i.159, 2146435072
  br i1 %cmp.i.57.i.160, label %land.rhs.i.59.i.162, label %float64_is_signaling_nan.exit64.i.168

land.rhs.i.59.i.162:                              ; preds = %if.then.40
  %tobool.i.58.i.161 = icmp eq i32 %a.1, 0
  br i1 %tobool.i.58.i.161, label %lor.rhs.i.62.i.165, label %float64_is_signaling_nan.exit64.i.168

lor.rhs.i.62.i.165:                               ; preds = %land.rhs.i.59.i.162
  %and4.i.60.i.163 = and i32 %a.0, 524287
  %tobool5.i.61.i.164 = icmp ne i32 %and4.i.60.i.163, 0
  br label %float64_is_signaling_nan.exit64.i.168

float64_is_signaling_nan.exit64.i.168:            ; preds = %lor.rhs.i.62.i.165, %land.rhs.i.59.i.162, %if.then.40
  %7 = phi i1 [ false, %if.then.40 ], [ true, %land.rhs.i.59.i.162 ], [ %tobool5.i.61.i.164, %lor.rhs.i.62.i.165 ]
  %shl.i.i.166 = shl i32 %b.0, 1
  %cmp.i.50.i.167 = icmp ugt i32 %shl.i.i.166, -2097153
  %and.i.i.174 = and i32 %b.0, 2146959360
  %cmp.i.i.175 = icmp eq i32 %and.i.i.174, 2146435072
  br i1 %cmp.i.i.175, label %land.rhs.i.i.178, label %float64_is_signaling_nan.exit.i.189

land.rhs.i.i.178:                                 ; preds = %float64_is_signaling_nan.exit64.i.168
  %tobool.i.i.177 = icmp eq i32 %b.1, 0
  br i1 %tobool.i.i.177, label %lor.rhs.i.i.185, label %if.then.thread.i.182

if.then.thread.i.182:                             ; preds = %land.rhs.i.i.178
  %or17.67.i.179 = or i32 %b.0, 524288
  %8 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !55
  %or.i.79.i.180 = or i32 %8, 16
  store i32 %or.i.79.i.180, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !55
  %b.sroa.0.0..sroa_idx.73.80.i.181 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.true.i.198

lor.rhs.i.i.185:                                  ; preds = %land.rhs.i.i.178
  %and4.i.i.183 = and i32 %b.0, 524287
  %tobool5.i.i.184 = icmp ne i32 %and4.i.i.183, 0
  br label %float64_is_signaling_nan.exit.i.189

float64_is_signaling_nan.exit.i.189:              ; preds = %lor.rhs.i.i.185, %float64_is_signaling_nan.exit64.i.168
  %9 = phi i1 [ false, %float64_is_signaling_nan.exit64.i.168 ], [ %tobool5.i.i.184, %lor.rhs.i.i.185 ]
  %or.i.186 = or i32 %a.0, 524288
  %or17.i.187 = or i32 %b.0, 524288
  %or1865.i.188 = or i1 %7, %9
  br i1 %or1865.i.188, label %if.then.i.192, label %if.end.i.194

if.then.i.192:                                    ; preds = %float64_is_signaling_nan.exit.i.189
  %10 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !55
  %or.i.i.190 = or i32 %10, 16
  store i32 %or.i.i.190, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !55
  %b.sroa.0.0..sroa_idx.73.i.191 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br i1 %9, label %cond.true.i.198, label %cond.false.i.200

if.end.i.194:                                     ; preds = %float64_is_signaling_nan.exit.i.189
  %b.sroa.0.0..sroa_idx.i.193 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.false.i.200

cond.true.i.198:                                  ; preds = %if.then.i.192, %if.then.thread.i.182
  %b.sroa.0.0..sroa_idx77.i.195 = phi i32* [ %b.sroa.0.0..sroa_idx.73.i.191, %if.then.i.192 ], [ %b.sroa.0.0..sroa_idx.73.80.i.181, %if.then.thread.i.182 ]
  %or177174.i.196 = phi i32 [ %or17.i.187, %if.then.i.192 ], [ %or17.67.i.179, %if.then.thread.i.182 ]
  store i32 %or177174.i.196, i32* %b.sroa.0.0..sroa_idx77.i.195, align 4, !alias.scope !55
  %b.sroa.7.0..sroa_idx38.i.197 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %b.1, i32* %b.sroa.7.0..sroa_idx38.i.197, align 4, !alias.scope !55
  br label %cleanup

cond.false.i.200:                                 ; preds = %if.end.i.194, %if.then.i.192
  %b.sroa.0.0..sroa_idx78.i.199 = phi i32* [ %b.sroa.0.0..sroa_idx.73.i.191, %if.then.i.192 ], [ %b.sroa.0.0..sroa_idx.i.193, %if.end.i.194 ]
  br i1 %7, label %cond.true.21.i.202, label %cond.false.22.i.203

cond.true.21.i.202:                               ; preds = %cond.false.i.200
  store i32 %or.i.186, i32* %b.sroa.0.0..sroa_idx78.i.199, align 4, !alias.scope !55
  %a.sroa.7.0..sroa_idx46.i.201 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.7.0..sroa_idx46.i.201, align 4, !alias.scope !55
  br label %cleanup

cond.false.22.i.203:                              ; preds = %cond.false.i.200
  br i1 %cmp.i.50.i.167, label %cond.true.24.i.205, label %cond.false.25.i.207

cond.true.24.i.205:                               ; preds = %cond.false.22.i.203
  store i32 %or17.i.187, i32* %b.sroa.0.0..sroa_idx78.i.199, align 4, !alias.scope !55
  %b.sroa.7.0..sroa_idx39.i.204 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %b.1, i32* %b.sroa.7.0..sroa_idx39.i.204, align 4, !alias.scope !55
  br label %cleanup

cond.false.25.i.207:                              ; preds = %cond.false.22.i.203
  store i32 %or.i.186, i32* %b.sroa.0.0..sroa_idx78.i.199, align 4, !alias.scope !55
  %a.sroa.7.0..sroa_idx47.i.206 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.7.0..sroa_idx47.i.206, align 4, !alias.scope !55
  br label %cleanup

if.end.45:                                        ; preds = %if.then.37
  %shl.i.155 = shl i32 %zSign, 31
  %add.i.156 = or i32 %shl.i.155, 2146435072
  %z.sroa.0.0..sroa_idx.i.157 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %add.i.156, i32* %z.sroa.0.0..sroa_idx.i.157, align 4, !alias.scope !58
  %z.sroa.4.0..sroa_idx4.i.158 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 0, i32* %z.sroa.4.0..sroa_idx4.i.158, align 4, !alias.scope !58
  br label %cleanup

if.end.46:                                        ; preds = %if.then.35
  %cmp47 = icmp eq i32 %and.i.298, 0
  %or50 = or i32 %and.i, 1048576
  %aSig0.0 = select i1 %cmp47, i32 %and.i, i32 %or50
  %inc = zext i1 %cmp47 to i32
  %expDiff.1 = add nsw i32 %sub, %inc
  %sub52 = sub nsw i32 0, %expDiff.1
  %and.i.144 = and i32 %expDiff.1, 31
  %cmp.i.145 = icmp eq i32 %expDiff.1, 0
  br i1 %cmp.i.145, label %if.end.72, label %if.else.i

if.else.i:                                        ; preds = %if.end.46
  %cmp1.i = icmp sgt i32 %expDiff.1, -32
  br i1 %cmp1.i, label %if.then.2.i, label %if.else.5.i

if.then.2.i:                                      ; preds = %if.else.i
  %shl.i.146 = shl i32 %a.1, %and.i.144
  %shl3.i.147 = shl i32 %aSig0.0, %and.i.144
  %shr.i.148 = lshr i32 %a.1, %sub52
  %or.i.149 = or i32 %shl3.i.147, %shr.i.148
  %shr4.i.150 = lshr i32 %aSig0.0, %sub52
  br label %if.end.19.i

if.else.5.i:                                      ; preds = %if.else.i
  %cmp6.i = icmp eq i32 %sub52, 32
  br i1 %cmp6.i, label %if.end.19.i, label %if.else.8.i

if.else.8.i:                                      ; preds = %if.else.5.i
  %cmp10.i = icmp sgt i32 %expDiff.1, -64
  br i1 %cmp10.i, label %if.then.11.i, label %if.else.15.i

if.then.11.i:                                     ; preds = %if.else.8.i
  %shl12.i = shl i32 %aSig0.0, %and.i.144
  %and13.i = and i32 %sub52, 31
  %shr14.i = lshr i32 %aSig0.0, %and13.i
  br label %if.end.19.i

if.else.15.i:                                     ; preds = %if.else.8.i
  %cmp16.i = icmp eq i32 %sub52, 64
  %cmp17.i = icmp ne i32 %aSig0.0, 0
  %conv.i.151 = zext i1 %cmp17.i to i32
  %cond.i = select i1 %cmp16.i, i32 %aSig0.0, i32 %conv.i.151
  br label %if.end.19.i

if.end.19.i:                                      ; preds = %if.else.15.i, %if.then.11.i, %if.else.5.i, %if.then.2.i
  %z0.0.i = phi i32 [ %shr4.i.150, %if.then.2.i ], [ 0, %if.else.5.i ], [ 0, %if.then.11.i ], [ 0, %if.else.15.i ]
  %z1.1.i = phi i32 [ %or.i.149, %if.then.2.i ], [ %aSig0.0, %if.else.5.i ], [ %shr14.i, %if.then.11.i ], [ 0, %if.else.15.i ]
  %z2.1.i = phi i32 [ %shl.i.146, %if.then.2.i ], [ %a.1, %if.else.5.i ], [ %shl12.i, %if.then.11.i ], [ %cond.i, %if.else.15.i ]
  %a2.addr.1.i = phi i32 [ 0, %if.then.2.i ], [ 0, %if.else.5.i ], [ %a.1, %if.then.11.i ], [ %a.1, %if.else.15.i ]
  %cmp20.i.152 = icmp ne i32 %a2.addr.1.i, 0
  %conv21.i.153 = zext i1 %cmp20.i.152 to i32
  %or22.i.154 = or i32 %conv21.i.153, %z2.1.i
  br label %if.end.72

if.else.53:                                       ; preds = %if.else.33
  %cmp54 = icmp eq i32 %and.i.298, 2047
  br i1 %cmp54, label %if.then.55, label %if.end.66

if.then.55:                                       ; preds = %if.else.53
  %or56 = or i32 %and.i, %a.1
  %or57 = or i32 %or56, %and.i.296
  %or58 = or i32 %or57, %b.1
  %tobool59 = icmp eq i32 %or58, 0
  br i1 %tobool59, label %if.end.65, label %if.then.60

if.then.60:                                       ; preds = %if.then.55
  %and.i.56.i = and i32 %a.0, 2146959360
  %cmp.i.57.i = icmp eq i32 %and.i.56.i, 2146435072
  br i1 %cmp.i.57.i, label %land.rhs.i.59.i, label %float64_is_signaling_nan.exit64.i

land.rhs.i.59.i:                                  ; preds = %if.then.60
  %tobool.i.58.i = icmp eq i32 %a.1, 0
  br i1 %tobool.i.58.i, label %lor.rhs.i.62.i, label %float64_is_signaling_nan.exit64.i

lor.rhs.i.62.i:                                   ; preds = %land.rhs.i.59.i
  %and4.i.60.i = and i32 %a.0, 524287
  %tobool5.i.61.i = icmp ne i32 %and4.i.60.i, 0
  br label %float64_is_signaling_nan.exit64.i

float64_is_signaling_nan.exit64.i:                ; preds = %lor.rhs.i.62.i, %land.rhs.i.59.i, %if.then.60
  %11 = phi i1 [ false, %if.then.60 ], [ true, %land.rhs.i.59.i ], [ %tobool5.i.61.i, %lor.rhs.i.62.i ]
  %shl.i.i = shl i32 %b.0, 1
  %cmp.i.50.i = icmp ugt i32 %shl.i.i, -2097153
  %12 = or i32 %and.i.296, %b.1
  %13 = icmp ne i32 %12, 0
  %14 = and i1 %cmp.i.50.i, %13
  %and.i.i = and i32 %b.0, 2146959360
  %cmp.i.i = icmp eq i32 %and.i.i, 2146435072
  br i1 %cmp.i.i, label %land.rhs.i.i, label %float64_is_signaling_nan.exit.i

land.rhs.i.i:                                     ; preds = %float64_is_signaling_nan.exit64.i
  %tobool.i.i = icmp eq i32 %b.1, 0
  br i1 %tobool.i.i, label %lor.rhs.i.i, label %if.then.thread.i

if.then.thread.i:                                 ; preds = %land.rhs.i.i
  %or17.67.i = or i32 %b.0, 524288
  %15 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !61
  %or.i.79.i = or i32 %15, 16
  store i32 %or.i.79.i, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !61
  %b.sroa.0.0..sroa_idx.73.80.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.true.i

lor.rhs.i.i:                                      ; preds = %land.rhs.i.i
  %and4.i.i = and i32 %b.0, 524287
  %tobool5.i.i = icmp ne i32 %and4.i.i, 0
  br label %float64_is_signaling_nan.exit.i

float64_is_signaling_nan.exit.i:                  ; preds = %lor.rhs.i.i, %float64_is_signaling_nan.exit64.i
  %16 = phi i1 [ false, %float64_is_signaling_nan.exit64.i ], [ %tobool5.i.i, %lor.rhs.i.i ]
  %or.i.143 = or i32 %a.0, 524288
  %or17.i = or i32 %b.0, 524288
  %or1865.i = or i1 %11, %16
  br i1 %or1865.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %float64_is_signaling_nan.exit.i
  %17 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !61
  %or.i.i = or i32 %17, 16
  store i32 %or.i.i, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !61
  %b.sroa.0.0..sroa_idx.73.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br i1 %16, label %cond.true.i, label %cond.false.i

if.end.i:                                         ; preds = %float64_is_signaling_nan.exit.i
  %b.sroa.0.0..sroa_idx.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.false.i

cond.true.i:                                      ; preds = %if.then.i, %if.then.thread.i
  %b.sroa.0.0..sroa_idx77.i = phi i32* [ %b.sroa.0.0..sroa_idx.73.i, %if.then.i ], [ %b.sroa.0.0..sroa_idx.73.80.i, %if.then.thread.i ]
  %or177174.i = phi i32 [ %or17.i, %if.then.i ], [ %or17.67.i, %if.then.thread.i ]
  store i32 %or177174.i, i32* %b.sroa.0.0..sroa_idx77.i, align 4, !alias.scope !61
  %b.sroa.7.0..sroa_idx38.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %b.1, i32* %b.sroa.7.0..sroa_idx38.i, align 4, !alias.scope !61
  br label %cleanup

cond.false.i:                                     ; preds = %if.end.i, %if.then.i
  %b.sroa.0.0..sroa_idx78.i = phi i32* [ %b.sroa.0.0..sroa_idx.73.i, %if.then.i ], [ %b.sroa.0.0..sroa_idx.i, %if.end.i ]
  br i1 %11, label %cond.true.21.i, label %cond.false.22.i

cond.true.21.i:                                   ; preds = %cond.false.i
  store i32 %or.i.143, i32* %b.sroa.0.0..sroa_idx78.i, align 4, !alias.scope !61
  %a.sroa.7.0..sroa_idx46.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.7.0..sroa_idx46.i, align 4, !alias.scope !61
  br label %cleanup

cond.false.22.i:                                  ; preds = %cond.false.i
  br i1 %14, label %cond.true.24.i, label %cond.false.25.i

cond.true.24.i:                                   ; preds = %cond.false.22.i
  store i32 %or17.i, i32* %b.sroa.0.0..sroa_idx78.i, align 4, !alias.scope !61
  %b.sroa.7.0..sroa_idx39.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %b.1, i32* %b.sroa.7.0..sroa_idx39.i, align 4, !alias.scope !61
  br label %cleanup

cond.false.25.i:                                  ; preds = %cond.false.22.i
  store i32 %or.i.143, i32* %b.sroa.0.0..sroa_idx78.i, align 4, !alias.scope !61
  %a.sroa.7.0..sroa_idx47.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.7.0..sroa_idx47.i, align 4, !alias.scope !61
  br label %cleanup

if.end.65:                                        ; preds = %if.then.55
  %a.sroa.0.0..sroa_idx126 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %a.0, i32* %a.sroa.0.0..sroa_idx126, align 4
  %a.sroa.9.0..sroa_idx129 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.9.0..sroa_idx129, align 4
  br label %cleanup

if.end.66:                                        ; preds = %if.else.53
  %add.i.138 = add i32 %b.1, %a.1
  %add1.i.139 = add nuw nsw i32 %and.i.296, %and.i
  %cmp.i.140 = icmp ult i32 %add.i.138, %a.1
  %conv.i.141 = zext i1 %cmp.i.140 to i32
  %add2.i.142 = add nuw nsw i32 %add1.i.139, %conv.i.141
  %cmp67 = icmp eq i32 %and.i.298, 0
  br i1 %cmp67, label %if.then.68, label %if.end.69

if.then.68:                                       ; preds = %if.end.66
  %shl.i.136 = shl i32 %zSign, 31
  %add2.i.137 = or i32 %add2.i.142, %shl.i.136
  %z.sroa.0.0..sroa_idx.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %add2.i.137, i32* %z.sroa.0.0..sroa_idx.i, align 4, !alias.scope !64
  %z.sroa.4.0..sroa_idx4.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %add.i.138, i32* %z.sroa.4.0..sroa_idx4.i, align 4, !alias.scope !64
  br label %cleanup

if.end.69:                                        ; preds = %if.end.66
  %or70 = or i32 %add2.i.142, 2097152
  br label %shiftRight1

if.end.72:                                        ; preds = %if.end.19.i, %if.end.46, %if.end.19.i.239, %if.end.32
  %aSig0.1 = phi i32 [ %and.i, %if.end.32 ], [ %and.i, %if.end.19.i.239 ], [ %z0.0.i, %if.end.19.i ], [ %aSig0.0, %if.end.46 ]
  %aSig1.0 = phi i32 [ %a.1, %if.end.32 ], [ %a.1, %if.end.19.i.239 ], [ %z1.1.i, %if.end.19.i ], [ %a.1, %if.end.46 ]
  %bSig0.1 = phi i32 [ %and.i.296, %if.end.32 ], [ %z0.0.i.232, %if.end.19.i.239 ], [ %and.i.296, %if.end.19.i ], [ %and.i.296, %if.end.46 ]
  %bSig1.0 = phi i32 [ %b.1, %if.end.32 ], [ %z1.1.i.233, %if.end.19.i.239 ], [ %b.1, %if.end.19.i ], [ %b.1, %if.end.46 ]
  %zSig2.0 = phi i32 [ 0, %if.end.32 ], [ %or22.i.238, %if.end.19.i.239 ], [ %or22.i.154, %if.end.19.i ], [ 0, %if.end.46 ]
  %zExp.0 = phi i32 [ %and.i.298, %if.end.32 ], [ %and.i.298, %if.end.19.i.239 ], [ %and.i.295, %if.end.19.i ], [ %and.i.295, %if.end.46 ]
  %or73 = or i32 %aSig0.1, 1048576
  %add.i = add i32 %bSig1.0, %aSig1.0
  %add1.i = add i32 %bSig0.1, %or73
  %cmp.i = icmp ult i32 %add.i, %aSig1.0
  %conv.i = zext i1 %cmp.i to i32
  %add2.i = add i32 %add1.i, %conv.i
  %dec74 = add nsw i32 %zExp.0, -1
  %cmp75 = icmp ult i32 %add2.i, 2097152
  br i1 %cmp75, label %roundAndPack, label %shiftRight1

shiftRight1:                                      ; preds = %if.end.72, %if.end.69
  %zSig0.0 = phi i32 [ %add2.i, %if.end.72 ], [ %or70, %if.end.69 ]
  %zSig1.0 = phi i32 [ %add.i, %if.end.72 ], [ %add.i.138, %if.end.69 ]
  %zSig2.1 = phi i32 [ %zSig2.0, %if.end.72 ], [ 0, %if.end.69 ]
  %zExp.1 = phi i32 [ %zExp.0, %if.end.72 ], [ %and.i.298, %if.end.69 ]
  %shl.i = shl i32 %zSig1.0, 31
  %shl3.i = shl i32 %zSig0.0, 31
  %shr.i = lshr i32 %zSig1.0, 1
  %or.i = or i32 %shr.i, %shl3.i
  %shr4.i = lshr i32 %zSig0.0, 1
  %cmp20.i = icmp ne i32 %zSig2.1, 0
  %conv21.i = zext i1 %cmp20.i to i32
  %or22.i = or i32 %conv21.i, %shl.i
  br label %roundAndPack

roundAndPack:                                     ; preds = %if.end.72, %shiftRight1
  %zSig0.1 = phi i32 [ %add2.i, %if.end.72 ], [ %shr4.i, %shiftRight1 ]
  %zSig1.1 = phi i32 [ %add.i, %if.end.72 ], [ %or.i, %shiftRight1 ]
  %zSig2.2 = phi i32 [ %zSig2.0, %if.end.72 ], [ %or22.i, %shiftRight1 ]
  %zExp.2 = phi i32 [ %dec74, %if.end.72 ], [ %zExp.1, %shiftRight1 ]
  tail call fastcc void @roundAndPackFloat64(%struct.float64* noalias %agg.result, i32 %zSign, i32 %zExp.2, i32 %zSig0.1, i32 %zSig1.1, i32 %zSig2.2)
  br label %cleanup

cleanup:                                          ; preds = %cond.false.25.i, %cond.true.24.i, %cond.true.21.i, %cond.true.i, %cond.false.25.i.207, %cond.true.24.i.205, %cond.true.21.i.202, %cond.true.i.198, %cond.false.25.i.292, %cond.true.24.i.290, %cond.true.21.i.287, %cond.true.i.283, %roundAndPack, %if.then.68, %if.end.65, %if.end.45, %if.end
  ret void
}

; Function Attrs: nounwind
define internal fastcc void @subFloat64Sigs(%struct.float64* noalias %agg.result, i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1, i32 %zSign) #2 {
entry:
  %shr.i.310 = lshr i32 %a.0, 20
  %and.i.311 = and i32 %shr.i.310, 2047
  %and.i.309 = and i32 %b.0, 1048575
  %shr.i.307 = lshr i32 %b.0, 20
  %and.i.308 = and i32 %shr.i.307, 2047
  %sub = sub nsw i32 %and.i.311, %and.i.308
  %shl.i.302 = shl i32 %a.1, 10
  %and.i = shl i32 %a.0, 10
  %shl1.i.303 = and i32 %and.i, 1073740800
  %shr.i.304 = lshr i32 %a.1, 22
  %or.i.305 = or i32 %shr.i.304, %shl1.i.303
  %shl.i.298 = shl i32 %b.1, 10
  %shl1.i = shl nuw nsw i32 %and.i.309, 10
  %shr.i.299 = lshr i32 %b.1, 22
  %or.i.300 = or i32 %shr.i.299, %shl1.i
  %cmp = icmp sgt i32 %sub, 0
  br i1 %cmp, label %aExpBigger, label %if.end

if.end:                                           ; preds = %entry
  %cmp21 = icmp slt i32 %sub, 0
  br i1 %cmp21, label %bExpBigger, label %if.end.23

if.end.23:                                        ; preds = %if.end
  switch i32 %and.i.311, label %if.end.39 [
    i32 2047, label %if.then.25
    i32 0, label %if.then.38
  ]

if.then.25:                                       ; preds = %if.end.23
  %or = or i32 %or.i.305, %shl.i.302
  %or26 = or i32 %or, %shl.i.298
  %or27 = or i32 %or26, %or.i.300
  %tobool = icmp eq i32 %or27, 0
  br i1 %tobool, label %if.end.33, label %if.then.28

if.then.28:                                       ; preds = %if.then.25
  %and.i.56.i.248 = and i32 %a.0, 2146959360
  %cmp.i.57.i.249 = icmp eq i32 %and.i.56.i.248, 2146435072
  br i1 %cmp.i.57.i.249, label %land.rhs.i.59.i.251, label %float64_is_signaling_nan.exit64.i.257

land.rhs.i.59.i.251:                              ; preds = %if.then.28
  %tobool.i.58.i.250 = icmp eq i32 %a.1, 0
  br i1 %tobool.i.58.i.250, label %lor.rhs.i.62.i.254, label %float64_is_signaling_nan.exit64.i.257

lor.rhs.i.62.i.254:                               ; preds = %land.rhs.i.59.i.251
  %and4.i.60.i.252 = and i32 %a.0, 524287
  %tobool5.i.61.i.253 = icmp ne i32 %and4.i.60.i.252, 0
  br label %float64_is_signaling_nan.exit64.i.257

float64_is_signaling_nan.exit64.i.257:            ; preds = %lor.rhs.i.62.i.254, %land.rhs.i.59.i.251, %if.then.28
  %0 = phi i1 [ false, %if.then.28 ], [ true, %land.rhs.i.59.i.251 ], [ %tobool5.i.61.i.253, %lor.rhs.i.62.i.254 ]
  %shl.i.i.255 = shl i32 %b.0, 1
  %cmp.i.50.i.256 = icmp ugt i32 %shl.i.i.255, -2097153
  %1 = or i32 %and.i.309, %b.1
  %2 = icmp ne i32 %1, 0
  %3 = and i1 %cmp.i.50.i.256, %2
  %and.i.i.263 = and i32 %b.0, 2146959360
  %cmp.i.i.264 = icmp eq i32 %and.i.i.263, 2146435072
  br i1 %cmp.i.i.264, label %land.rhs.i.i.267, label %float64_is_signaling_nan.exit.i.278

land.rhs.i.i.267:                                 ; preds = %float64_is_signaling_nan.exit64.i.257
  %tobool.i.i.266 = icmp eq i32 %b.1, 0
  br i1 %tobool.i.i.266, label %lor.rhs.i.i.274, label %if.then.thread.i.271

if.then.thread.i.271:                             ; preds = %land.rhs.i.i.267
  %or17.67.i.268 = or i32 %b.0, 524288
  %4 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !67
  %or.i.79.i.269 = or i32 %4, 16
  store i32 %or.i.79.i.269, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !67
  %b.sroa.0.0..sroa_idx.73.80.i.270 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.true.i.287

lor.rhs.i.i.274:                                  ; preds = %land.rhs.i.i.267
  %and4.i.i.272 = and i32 %b.0, 524287
  %tobool5.i.i.273 = icmp ne i32 %and4.i.i.272, 0
  br label %float64_is_signaling_nan.exit.i.278

float64_is_signaling_nan.exit.i.278:              ; preds = %lor.rhs.i.i.274, %float64_is_signaling_nan.exit64.i.257
  %5 = phi i1 [ false, %float64_is_signaling_nan.exit64.i.257 ], [ %tobool5.i.i.273, %lor.rhs.i.i.274 ]
  %or.i.275 = or i32 %a.0, 524288
  %or17.i.276 = or i32 %b.0, 524288
  %or1865.i.277 = or i1 %0, %5
  br i1 %or1865.i.277, label %if.then.i.281, label %if.end.i.283

if.then.i.281:                                    ; preds = %float64_is_signaling_nan.exit.i.278
  %6 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !67
  %or.i.i.279 = or i32 %6, 16
  store i32 %or.i.i.279, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !67
  %b.sroa.0.0..sroa_idx.73.i.280 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br i1 %5, label %cond.true.i.287, label %cond.false.i.289

if.end.i.283:                                     ; preds = %float64_is_signaling_nan.exit.i.278
  %b.sroa.0.0..sroa_idx.i.282 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.false.i.289

cond.true.i.287:                                  ; preds = %if.then.i.281, %if.then.thread.i.271
  %b.sroa.0.0..sroa_idx77.i.284 = phi i32* [ %b.sroa.0.0..sroa_idx.73.i.280, %if.then.i.281 ], [ %b.sroa.0.0..sroa_idx.73.80.i.270, %if.then.thread.i.271 ]
  %or177174.i.285 = phi i32 [ %or17.i.276, %if.then.i.281 ], [ %or17.67.i.268, %if.then.thread.i.271 ]
  store i32 %or177174.i.285, i32* %b.sroa.0.0..sroa_idx77.i.284, align 4, !alias.scope !67
  %b.sroa.7.0..sroa_idx38.i.286 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %b.1, i32* %b.sroa.7.0..sroa_idx38.i.286, align 4, !alias.scope !67
  br label %cleanup

cond.false.i.289:                                 ; preds = %if.end.i.283, %if.then.i.281
  %b.sroa.0.0..sroa_idx78.i.288 = phi i32* [ %b.sroa.0.0..sroa_idx.73.i.280, %if.then.i.281 ], [ %b.sroa.0.0..sroa_idx.i.282, %if.end.i.283 ]
  br i1 %0, label %cond.true.21.i.291, label %cond.false.22.i.292

cond.true.21.i.291:                               ; preds = %cond.false.i.289
  store i32 %or.i.275, i32* %b.sroa.0.0..sroa_idx78.i.288, align 4, !alias.scope !67
  %a.sroa.7.0..sroa_idx46.i.290 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.7.0..sroa_idx46.i.290, align 4, !alias.scope !67
  br label %cleanup

cond.false.22.i.292:                              ; preds = %cond.false.i.289
  br i1 %3, label %cond.true.24.i.294, label %cond.false.25.i.296

cond.true.24.i.294:                               ; preds = %cond.false.22.i.292
  store i32 %or17.i.276, i32* %b.sroa.0.0..sroa_idx78.i.288, align 4, !alias.scope !67
  %b.sroa.7.0..sroa_idx39.i.293 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %b.1, i32* %b.sroa.7.0..sroa_idx39.i.293, align 4, !alias.scope !67
  br label %cleanup

cond.false.25.i.296:                              ; preds = %cond.false.22.i.292
  store i32 %or.i.275, i32* %b.sroa.0.0..sroa_idx78.i.288, align 4, !alias.scope !67
  %a.sroa.7.0..sroa_idx47.i.295 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.7.0..sroa_idx47.i.295, align 4, !alias.scope !67
  br label %cleanup

if.end.33:                                        ; preds = %if.then.25
  %7 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.247 = or i32 %7, 16
  store i32 %or.i.247, i32* @float_exception_flags, align 4, !tbaa !1
  %z.sroa.0.0..sroa_idx = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 2147483647, i32* %z.sroa.0.0..sroa_idx, align 4
  %z.sroa.4.0..sroa_idx105 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 -1, i32* %z.sroa.4.0..sroa_idx105, align 4
  br label %cleanup

if.then.38:                                       ; preds = %if.end.23
  br label %if.end.39

if.end.39:                                        ; preds = %if.end.23, %if.then.38
  %bExp.0 = phi i32 [ 1, %if.then.38 ], [ %and.i.308, %if.end.23 ]
  %aExp.0 = phi i32 [ 1, %if.then.38 ], [ %and.i.311, %if.end.23 ]
  %cmp40 = icmp ult i32 %or.i.300, %or.i.305
  br i1 %cmp40, label %aBigger, label %if.end.42

if.end.42:                                        ; preds = %if.end.39
  %cmp43 = icmp ult i32 %or.i.305, %or.i.300
  br i1 %cmp43, label %bBigger, label %if.end.45

if.end.45:                                        ; preds = %if.end.42
  %cmp46 = icmp ult i32 %shl.i.298, %shl.i.302
  br i1 %cmp46, label %aBigger, label %if.end.48

if.end.48:                                        ; preds = %if.end.45
  %cmp49 = icmp ult i32 %shl.i.302, %shl.i.298
  br i1 %cmp49, label %bBigger, label %if.end.51

if.end.51:                                        ; preds = %if.end.48
  %8 = load i32, i32* @float_rounding_mode, align 4, !tbaa !1
  %cmp52 = icmp eq i32 %8, 3
  %conv = zext i1 %cmp52 to i32
  %shl.i.244 = shl nuw i32 %conv, 31
  %z.sroa.0.0..sroa_idx.i.245 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %shl.i.244, i32* %z.sroa.0.0..sroa_idx.i.245, align 4, !alias.scope !70
  %z.sroa.4.0..sroa_idx4.i.246 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 0, i32* %z.sroa.4.0..sroa_idx4.i.246, align 4, !alias.scope !70
  br label %cleanup

bExpBigger:                                       ; preds = %if.end
  %cmp53 = icmp eq i32 %and.i.308, 2047
  br i1 %cmp53, label %if.then.55, label %if.end.64

if.then.55:                                       ; preds = %bExpBigger
  %or56 = or i32 %or.i.300, %shl.i.298
  %tobool57 = icmp eq i32 %or56, 0
  br i1 %tobool57, label %if.end.63, label %if.then.58

if.then.58:                                       ; preds = %if.then.55
  %and.i.56.i.194 = and i32 %a.0, 2146959360
  %cmp.i.57.i.195 = icmp eq i32 %and.i.56.i.194, 2146435072
  br i1 %cmp.i.57.i.195, label %land.rhs.i.59.i.197, label %float64_is_signaling_nan.exit64.i.203

land.rhs.i.59.i.197:                              ; preds = %if.then.58
  %tobool.i.58.i.196 = icmp eq i32 %a.1, 0
  br i1 %tobool.i.58.i.196, label %lor.rhs.i.62.i.200, label %float64_is_signaling_nan.exit64.i.203

lor.rhs.i.62.i.200:                               ; preds = %land.rhs.i.59.i.197
  %and4.i.60.i.198 = and i32 %a.0, 524287
  %tobool5.i.61.i.199 = icmp ne i32 %and4.i.60.i.198, 0
  br label %float64_is_signaling_nan.exit64.i.203

float64_is_signaling_nan.exit64.i.203:            ; preds = %lor.rhs.i.62.i.200, %land.rhs.i.59.i.197, %if.then.58
  %9 = phi i1 [ false, %if.then.58 ], [ true, %land.rhs.i.59.i.197 ], [ %tobool5.i.61.i.199, %lor.rhs.i.62.i.200 ]
  %shl.i.i.201 = shl i32 %b.0, 1
  %cmp.i.50.i.202 = icmp ugt i32 %shl.i.i.201, -2097153
  %10 = or i32 %and.i.309, %b.1
  %11 = icmp ne i32 %10, 0
  %12 = and i1 %cmp.i.50.i.202, %11
  %and.i.i.209 = and i32 %b.0, 2146959360
  %cmp.i.i.210 = icmp eq i32 %and.i.i.209, 2146435072
  br i1 %cmp.i.i.210, label %land.rhs.i.i.213, label %float64_is_signaling_nan.exit.i.224

land.rhs.i.i.213:                                 ; preds = %float64_is_signaling_nan.exit64.i.203
  %tobool.i.i.212 = icmp eq i32 %b.1, 0
  br i1 %tobool.i.i.212, label %lor.rhs.i.i.220, label %if.then.thread.i.217

if.then.thread.i.217:                             ; preds = %land.rhs.i.i.213
  %or17.67.i.214 = or i32 %b.0, 524288
  %13 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !73
  %or.i.79.i.215 = or i32 %13, 16
  store i32 %or.i.79.i.215, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !73
  %b.sroa.0.0..sroa_idx.73.80.i.216 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.true.i.233

lor.rhs.i.i.220:                                  ; preds = %land.rhs.i.i.213
  %and4.i.i.218 = and i32 %b.0, 524287
  %tobool5.i.i.219 = icmp ne i32 %and4.i.i.218, 0
  br label %float64_is_signaling_nan.exit.i.224

float64_is_signaling_nan.exit.i.224:              ; preds = %lor.rhs.i.i.220, %float64_is_signaling_nan.exit64.i.203
  %14 = phi i1 [ false, %float64_is_signaling_nan.exit64.i.203 ], [ %tobool5.i.i.219, %lor.rhs.i.i.220 ]
  %or.i.221 = or i32 %a.0, 524288
  %or17.i.222 = or i32 %b.0, 524288
  %or1865.i.223 = or i1 %9, %14
  br i1 %or1865.i.223, label %if.then.i.227, label %if.end.i.229

if.then.i.227:                                    ; preds = %float64_is_signaling_nan.exit.i.224
  %15 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !73
  %or.i.i.225 = or i32 %15, 16
  store i32 %or.i.i.225, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !73
  %b.sroa.0.0..sroa_idx.73.i.226 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br i1 %14, label %cond.true.i.233, label %cond.false.i.235

if.end.i.229:                                     ; preds = %float64_is_signaling_nan.exit.i.224
  %b.sroa.0.0..sroa_idx.i.228 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.false.i.235

cond.true.i.233:                                  ; preds = %if.then.i.227, %if.then.thread.i.217
  %b.sroa.0.0..sroa_idx77.i.230 = phi i32* [ %b.sroa.0.0..sroa_idx.73.i.226, %if.then.i.227 ], [ %b.sroa.0.0..sroa_idx.73.80.i.216, %if.then.thread.i.217 ]
  %or177174.i.231 = phi i32 [ %or17.i.222, %if.then.i.227 ], [ %or17.67.i.214, %if.then.thread.i.217 ]
  store i32 %or177174.i.231, i32* %b.sroa.0.0..sroa_idx77.i.230, align 4, !alias.scope !73
  %b.sroa.7.0..sroa_idx38.i.232 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %b.1, i32* %b.sroa.7.0..sroa_idx38.i.232, align 4, !alias.scope !73
  br label %cleanup

cond.false.i.235:                                 ; preds = %if.end.i.229, %if.then.i.227
  %b.sroa.0.0..sroa_idx78.i.234 = phi i32* [ %b.sroa.0.0..sroa_idx.73.i.226, %if.then.i.227 ], [ %b.sroa.0.0..sroa_idx.i.228, %if.end.i.229 ]
  br i1 %9, label %cond.true.21.i.237, label %cond.false.22.i.238

cond.true.21.i.237:                               ; preds = %cond.false.i.235
  store i32 %or.i.221, i32* %b.sroa.0.0..sroa_idx78.i.234, align 4, !alias.scope !73
  %a.sroa.7.0..sroa_idx46.i.236 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.7.0..sroa_idx46.i.236, align 4, !alias.scope !73
  br label %cleanup

cond.false.22.i.238:                              ; preds = %cond.false.i.235
  br i1 %12, label %cond.true.24.i.240, label %cond.false.25.i.242

cond.true.24.i.240:                               ; preds = %cond.false.22.i.238
  store i32 %or17.i.222, i32* %b.sroa.0.0..sroa_idx78.i.234, align 4, !alias.scope !73
  %b.sroa.7.0..sroa_idx39.i.239 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %b.1, i32* %b.sroa.7.0..sroa_idx39.i.239, align 4, !alias.scope !73
  br label %cleanup

cond.false.25.i.242:                              ; preds = %cond.false.22.i.238
  store i32 %or.i.221, i32* %b.sroa.0.0..sroa_idx78.i.234, align 4, !alias.scope !73
  %a.sroa.7.0..sroa_idx47.i.241 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.7.0..sroa_idx47.i.241, align 4, !alias.scope !73
  br label %cleanup

if.end.63:                                        ; preds = %if.then.55
  %xor = shl i32 %zSign, 31
  %add.i = add i32 %xor, -1048576
  %z.sroa.0.0..sroa_idx.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %add.i, i32* %z.sroa.0.0..sroa_idx.i, align 4, !alias.scope !76
  %z.sroa.4.0..sroa_idx4.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 0, i32* %z.sroa.4.0..sroa_idx4.i, align 4, !alias.scope !76
  br label %cleanup

if.end.64:                                        ; preds = %bExpBigger
  %cmp65 = icmp eq i32 %and.i.311, 0
  %or68 = or i32 %or.i.305, 1073741824
  %aSig0.0 = select i1 %cmp65, i32 %or.i.305, i32 %or68
  %inc = zext i1 %cmp65 to i32
  %expDiff.0 = add nsw i32 %sub, %inc
  %sub70 = sub nsw i32 0, %expDiff.0
  %and.i.157 = and i32 %expDiff.0, 31
  %cmp.i.158 = icmp eq i32 %expDiff.0, 0
  br i1 %cmp.i.158, label %shift64RightJamming.exit192, label %if.else.i.160

if.else.i.160:                                    ; preds = %if.end.64
  %cmp1.i.159 = icmp sgt i32 %expDiff.0, -32
  br i1 %cmp1.i.159, label %if.then.2.i.169, label %if.else.7.i.171

if.then.2.i.169:                                  ; preds = %if.else.i.160
  %shl.i.161 = shl i32 %aSig0.0, %and.i.157
  %shr.i.162 = lshr i32 %shl.i.302, %sub70
  %or.i.163 = or i32 %shl.i.161, %shr.i.162
  %shl3.i.164 = shl i32 %shl.i.302, %and.i.157
  %cmp4.i.165 = icmp ne i32 %shl3.i.164, 0
  %conv.i.166 = zext i1 %cmp4.i.165 to i32
  %or5.i.167 = or i32 %or.i.163, %conv.i.166
  %shr6.i.168 = lshr i32 %aSig0.0, %sub70
  br label %shift64RightJamming.exit192

if.else.7.i.171:                                  ; preds = %if.else.i.160
  %cmp8.i.170 = icmp eq i32 %sub70, 32
  br i1 %cmp8.i.170, label %if.then.10.i.175, label %if.else.14.i.177

if.then.10.i.175:                                 ; preds = %if.else.7.i.171
  %cmp11.i.172 = icmp ne i32 %shl.i.302, 0
  %conv12.i.173 = zext i1 %cmp11.i.172 to i32
  %or13.i.174 = or i32 %aSig0.0, %conv12.i.173
  br label %shift64RightJamming.exit192

if.else.14.i.177:                                 ; preds = %if.else.7.i.171
  %cmp15.i.176 = icmp sgt i32 %expDiff.0, -64
  br i1 %cmp15.i.176, label %if.then.17.i.185, label %if.else.25.i.189

if.then.17.i.185:                                 ; preds = %if.else.14.i.177
  %and18.i.178 = and i32 %sub70, 31
  %shr19.i.179 = lshr i32 %aSig0.0, %and18.i.178
  %shl20.i.180 = shl i32 %aSig0.0, %and.i.157
  %or21.i.181 = or i32 %shl20.i.180, %shl.i.302
  %cmp22.i.182 = icmp ne i32 %or21.i.181, 0
  %conv23.i.183 = zext i1 %cmp22.i.182 to i32
  %or24.i.184 = or i32 %conv23.i.183, %shr19.i.179
  br label %shift64RightJamming.exit192

if.else.25.i.189:                                 ; preds = %if.else.14.i.177
  %or26.i.186 = or i32 %aSig0.0, %shl.i.302
  %cmp27.i.187 = icmp ne i32 %or26.i.186, 0
  %conv28.i.188 = zext i1 %cmp27.i.187 to i32
  br label %shift64RightJamming.exit192

shift64RightJamming.exit192:                      ; preds = %if.end.64, %if.then.2.i.169, %if.then.10.i.175, %if.then.17.i.185, %if.else.25.i.189
  %z1.1.i.190 = phi i32 [ %or5.i.167, %if.then.2.i.169 ], [ %shl.i.302, %if.end.64 ], [ %or13.i.174, %if.then.10.i.175 ], [ %or24.i.184, %if.then.17.i.185 ], [ %conv28.i.188, %if.else.25.i.189 ]
  %z0.0.i.191 = phi i32 [ %shr6.i.168, %if.then.2.i.169 ], [ %aSig0.0, %if.end.64 ], [ 0, %if.then.10.i.175 ], [ 0, %if.then.17.i.185 ], [ 0, %if.else.25.i.189 ]
  %or71 = or i32 %or.i.300, 1073741824
  br label %bBigger

bBigger:                                          ; preds = %if.end.48, %if.end.42, %shift64RightJamming.exit192
  %aSig0.1 = phi i32 [ %z0.0.i.191, %shift64RightJamming.exit192 ], [ %or.i.305, %if.end.42 ], [ %or.i.305, %if.end.48 ]
  %aSig1.0 = phi i32 [ %z1.1.i.190, %shift64RightJamming.exit192 ], [ %shl.i.302, %if.end.42 ], [ %shl.i.302, %if.end.48 ]
  %bSig0.0 = phi i32 [ %or71, %shift64RightJamming.exit192 ], [ %or.i.300, %if.end.42 ], [ %or.i.300, %if.end.48 ]
  %bExp.1 = phi i32 [ %and.i.308, %shift64RightJamming.exit192 ], [ %bExp.0, %if.end.42 ], [ %bExp.0, %if.end.48 ]
  %sub.i.152 = sub i32 %shl.i.298, %aSig1.0
  %sub1.i.153 = sub i32 %bSig0.0, %aSig0.1
  %cmp.i.154 = icmp ult i32 %shl.i.298, %aSig1.0
  %conv.neg.i.155 = sext i1 %cmp.i.154 to i32
  %sub2.i.156 = add i32 %sub1.i.153, %conv.neg.i.155
  %xor72 = xor i32 %zSign, 1
  br label %normalizeRoundAndPack

aExpBigger:                                       ; preds = %entry
  %cmp73 = icmp eq i32 %and.i.311, 2047
  br i1 %cmp73, label %if.then.75, label %if.end.84

if.then.75:                                       ; preds = %aExpBigger
  %or76 = or i32 %or.i.305, %shl.i.302
  %tobool77 = icmp eq i32 %or76, 0
  br i1 %tobool77, label %if.end.83, label %if.then.78

if.then.78:                                       ; preds = %if.then.75
  %and.i.56.i = and i32 %a.0, 2146959360
  %cmp.i.57.i = icmp eq i32 %and.i.56.i, 2146435072
  br i1 %cmp.i.57.i, label %land.rhs.i.59.i, label %float64_is_signaling_nan.exit64.i

land.rhs.i.59.i:                                  ; preds = %if.then.78
  %tobool.i.58.i = icmp eq i32 %a.1, 0
  br i1 %tobool.i.58.i, label %lor.rhs.i.62.i, label %float64_is_signaling_nan.exit64.i

lor.rhs.i.62.i:                                   ; preds = %land.rhs.i.59.i
  %and4.i.60.i = and i32 %a.0, 524287
  %tobool5.i.61.i = icmp ne i32 %and4.i.60.i, 0
  br label %float64_is_signaling_nan.exit64.i

float64_is_signaling_nan.exit64.i:                ; preds = %lor.rhs.i.62.i, %land.rhs.i.59.i, %if.then.78
  %16 = phi i1 [ false, %if.then.78 ], [ true, %land.rhs.i.59.i ], [ %tobool5.i.61.i, %lor.rhs.i.62.i ]
  %shl.i.i = shl i32 %b.0, 1
  %cmp.i.50.i = icmp ugt i32 %shl.i.i, -2097153
  %17 = or i32 %and.i.309, %b.1
  %18 = icmp ne i32 %17, 0
  %19 = and i1 %cmp.i.50.i, %18
  %and.i.i = and i32 %b.0, 2146959360
  %cmp.i.i = icmp eq i32 %and.i.i, 2146435072
  br i1 %cmp.i.i, label %land.rhs.i.i, label %float64_is_signaling_nan.exit.i

land.rhs.i.i:                                     ; preds = %float64_is_signaling_nan.exit64.i
  %tobool.i.i = icmp eq i32 %b.1, 0
  br i1 %tobool.i.i, label %lor.rhs.i.i, label %if.then.thread.i

if.then.thread.i:                                 ; preds = %land.rhs.i.i
  %or17.67.i = or i32 %b.0, 524288
  %20 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !79
  %or.i.79.i = or i32 %20, 16
  store i32 %or.i.79.i, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !79
  %b.sroa.0.0..sroa_idx.73.80.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.true.i

lor.rhs.i.i:                                      ; preds = %land.rhs.i.i
  %and4.i.i = and i32 %b.0, 524287
  %tobool5.i.i = icmp ne i32 %and4.i.i, 0
  br label %float64_is_signaling_nan.exit.i

float64_is_signaling_nan.exit.i:                  ; preds = %lor.rhs.i.i, %float64_is_signaling_nan.exit64.i
  %21 = phi i1 [ false, %float64_is_signaling_nan.exit64.i ], [ %tobool5.i.i, %lor.rhs.i.i ]
  %or.i.151 = or i32 %a.0, 524288
  %or17.i = or i32 %b.0, 524288
  %or1865.i = or i1 %16, %21
  br i1 %or1865.i, label %if.then.i, label %if.end.i

if.then.i:                                        ; preds = %float64_is_signaling_nan.exit.i
  %22 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !79
  %or.i.i = or i32 %22, 16
  store i32 %or.i.i, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !79
  %b.sroa.0.0..sroa_idx.73.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br i1 %21, label %cond.true.i, label %cond.false.i

if.end.i:                                         ; preds = %float64_is_signaling_nan.exit.i
  %b.sroa.0.0..sroa_idx.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.false.i

cond.true.i:                                      ; preds = %if.then.i, %if.then.thread.i
  %b.sroa.0.0..sroa_idx77.i = phi i32* [ %b.sroa.0.0..sroa_idx.73.i, %if.then.i ], [ %b.sroa.0.0..sroa_idx.73.80.i, %if.then.thread.i ]
  %or177174.i = phi i32 [ %or17.i, %if.then.i ], [ %or17.67.i, %if.then.thread.i ]
  store i32 %or177174.i, i32* %b.sroa.0.0..sroa_idx77.i, align 4, !alias.scope !79
  %b.sroa.7.0..sroa_idx38.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %b.1, i32* %b.sroa.7.0..sroa_idx38.i, align 4, !alias.scope !79
  br label %cleanup

cond.false.i:                                     ; preds = %if.end.i, %if.then.i
  %b.sroa.0.0..sroa_idx78.i = phi i32* [ %b.sroa.0.0..sroa_idx.73.i, %if.then.i ], [ %b.sroa.0.0..sroa_idx.i, %if.end.i ]
  br i1 %16, label %cond.true.21.i, label %cond.false.22.i

cond.true.21.i:                                   ; preds = %cond.false.i
  store i32 %or.i.151, i32* %b.sroa.0.0..sroa_idx78.i, align 4, !alias.scope !79
  %a.sroa.7.0..sroa_idx46.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.7.0..sroa_idx46.i, align 4, !alias.scope !79
  br label %cleanup

cond.false.22.i:                                  ; preds = %cond.false.i
  br i1 %19, label %cond.true.24.i, label %cond.false.25.i

cond.true.24.i:                                   ; preds = %cond.false.22.i
  store i32 %or17.i, i32* %b.sroa.0.0..sroa_idx78.i, align 4, !alias.scope !79
  %b.sroa.7.0..sroa_idx39.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %b.1, i32* %b.sroa.7.0..sroa_idx39.i, align 4, !alias.scope !79
  br label %cleanup

cond.false.25.i:                                  ; preds = %cond.false.22.i
  store i32 %or.i.151, i32* %b.sroa.0.0..sroa_idx78.i, align 4, !alias.scope !79
  %a.sroa.7.0..sroa_idx47.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.7.0..sroa_idx47.i, align 4, !alias.scope !79
  br label %cleanup

if.end.83:                                        ; preds = %if.then.75
  %a.sroa.0.0..sroa_idx = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %a.0, i32* %a.sroa.0.0..sroa_idx, align 4
  %a.sroa.8.0..sroa_idx142 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.8.0..sroa_idx142, align 4
  br label %cleanup

if.end.84:                                        ; preds = %aExpBigger
  %cmp85 = icmp eq i32 %and.i.308, 0
  br i1 %cmp85, label %if.end.90, label %if.end.90.thread

if.end.90.thread:                                 ; preds = %if.end.84
  %or89 = or i32 %or.i.300, 1073741824
  br label %if.else.i

if.end.90:                                        ; preds = %if.end.84
  %dec = add nsw i32 %sub, -1
  %cmp.i.150 = icmp eq i32 %dec, 0
  br i1 %cmp.i.150, label %shift64RightJamming.exit, label %if.else.i

if.else.i:                                        ; preds = %if.end.90.thread, %if.end.90
  %.pn = phi i32 [ 0, %if.end.90.thread ], [ 1, %if.end.90 ]
  %expDiff.1350 = phi i32 [ %sub, %if.end.90.thread ], [ %dec, %if.end.90 ]
  %bSig0.1349 = phi i32 [ %or89, %if.end.90.thread ], [ %or.i.300, %if.end.90 ]
  %and.i.149351.in = sub nsw i32 %.pn, %sub
  %and.i.149351 = and i32 %and.i.149351.in, 31
  %cmp1.i = icmp slt i32 %expDiff.1350, 32
  br i1 %cmp1.i, label %if.then.2.i, label %if.else.7.i

if.then.2.i:                                      ; preds = %if.else.i
  %shl.i = shl i32 %bSig0.1349, %and.i.149351
  %shr.i = lshr i32 %shl.i.298, %expDiff.1350
  %or.i = or i32 %shl.i, %shr.i
  %shl3.i = shl i32 %shl.i.298, %and.i.149351
  %cmp4.i = icmp ne i32 %shl3.i, 0
  %conv.i = zext i1 %cmp4.i to i32
  %or5.i = or i32 %or.i, %conv.i
  %shr6.i = lshr i32 %bSig0.1349, %expDiff.1350
  br label %shift64RightJamming.exit

if.else.7.i:                                      ; preds = %if.else.i
  %cmp8.i = icmp eq i32 %expDiff.1350, 32
  br i1 %cmp8.i, label %if.then.10.i, label %if.else.14.i

if.then.10.i:                                     ; preds = %if.else.7.i
  %cmp11.i = icmp ne i32 %shl.i.298, 0
  %conv12.i = zext i1 %cmp11.i to i32
  %or13.i = or i32 %bSig0.1349, %conv12.i
  br label %shift64RightJamming.exit

if.else.14.i:                                     ; preds = %if.else.7.i
  %cmp15.i = icmp slt i32 %expDiff.1350, 64
  br i1 %cmp15.i, label %if.then.17.i, label %if.else.25.i

if.then.17.i:                                     ; preds = %if.else.14.i
  %and18.i = and i32 %expDiff.1350, 31
  %shr19.i = lshr i32 %bSig0.1349, %and18.i
  %shl20.i = shl i32 %bSig0.1349, %and.i.149351
  %or21.i = or i32 %shl20.i, %shl.i.298
  %cmp22.i = icmp ne i32 %or21.i, 0
  %conv23.i = zext i1 %cmp22.i to i32
  %or24.i = or i32 %conv23.i, %shr19.i
  br label %shift64RightJamming.exit

if.else.25.i:                                     ; preds = %if.else.14.i
  %or26.i = or i32 %bSig0.1349, %shl.i.298
  %cmp27.i = icmp ne i32 %or26.i, 0
  %conv28.i = zext i1 %cmp27.i to i32
  br label %shift64RightJamming.exit

shift64RightJamming.exit:                         ; preds = %if.end.90, %if.then.2.i, %if.then.10.i, %if.then.17.i, %if.else.25.i
  %z1.1.i = phi i32 [ %or5.i, %if.then.2.i ], [ %shl.i.298, %if.end.90 ], [ %or13.i, %if.then.10.i ], [ %or24.i, %if.then.17.i ], [ %conv28.i, %if.else.25.i ]
  %z0.0.i = phi i32 [ %shr6.i, %if.then.2.i ], [ %or.i.300, %if.end.90 ], [ 0, %if.then.10.i ], [ 0, %if.then.17.i ], [ 0, %if.else.25.i ]
  %or91 = or i32 %or.i.305, 1073741824
  br label %aBigger

aBigger:                                          ; preds = %if.end.45, %if.end.39, %shift64RightJamming.exit
  %aSig0.2 = phi i32 [ %or91, %shift64RightJamming.exit ], [ %or.i.305, %if.end.39 ], [ %or.i.305, %if.end.45 ]
  %bSig0.2 = phi i32 [ %z0.0.i, %shift64RightJamming.exit ], [ %or.i.300, %if.end.39 ], [ %or.i.300, %if.end.45 ]
  %bSig1.0 = phi i32 [ %z1.1.i, %shift64RightJamming.exit ], [ %shl.i.298, %if.end.39 ], [ %shl.i.298, %if.end.45 ]
  %aExp.1 = phi i32 [ %and.i.311, %shift64RightJamming.exit ], [ %aExp.0, %if.end.39 ], [ %aExp.0, %if.end.45 ]
  %sub.i = sub i32 %shl.i.302, %bSig1.0
  %sub1.i = sub i32 %aSig0.2, %bSig0.2
  %cmp.i = icmp ult i32 %shl.i.302, %bSig1.0
  %conv.neg.i = sext i1 %cmp.i to i32
  %sub2.i = add i32 %sub1.i, %conv.neg.i
  br label %normalizeRoundAndPack

normalizeRoundAndPack:                            ; preds = %aBigger, %bBigger
  %zSig0.0 = phi i32 [ %sub2.i, %aBigger ], [ %sub2.i.156, %bBigger ]
  %zSig1.0 = phi i32 [ %sub.i, %aBigger ], [ %sub.i.152, %bBigger ]
  %zExp.0 = phi i32 [ %aExp.1, %aBigger ], [ %bExp.1, %bBigger ]
  %zSign.addr.0 = phi i32 [ %zSign, %aBigger ], [ %xor72, %bBigger ]
  %sub93 = add nsw i32 %zExp.0, -11
  tail call fastcc void @normalizeRoundAndPackFloat64(%struct.float64* noalias %agg.result, i32 %zSign.addr.0, i32 %sub93, i32 %zSig0.0, i32 %zSig1.0)
  br label %cleanup

cleanup:                                          ; preds = %cond.false.25.i, %cond.true.24.i, %cond.true.21.i, %cond.true.i, %cond.false.25.i.242, %cond.true.24.i.240, %cond.true.21.i.237, %cond.true.i.233, %cond.false.25.i.296, %cond.true.24.i.294, %cond.true.21.i.291, %cond.true.i.287, %normalizeRoundAndPack, %if.end.83, %if.end.63, %if.end.51, %if.end.33
  ret void
}

; Function Attrs: nounwind
define void @float64_sub(%struct.float64* noalias sret %agg.result, i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #2 {
entry:
  %shr.i = lshr i32 %a.0, 31
  %shr.i.25 = lshr i32 %b.0, 31
  %cmp = icmp eq i32 %shr.i, %shr.i.25
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  tail call fastcc void @subFloat64Sigs(%struct.float64* noalias %agg.result, i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1, i32 %shr.i)
  br label %cleanup

if.else:                                          ; preds = %entry
  tail call fastcc void @addFloat64Sigs(%struct.float64* noalias %agg.result, i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1, i32 %shr.i)
  br label %cleanup

cleanup:                                          ; preds = %if.else, %if.then
  ret void
}

; Function Attrs: nounwind
define void @float64_mul(%struct.float64* noalias sret %agg.result, i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #2 {
entry:
  %and.i = and i32 %a.0, 1048575
  %shr.i.265 = lshr i32 %a.0, 20
  %and.i.266 = and i32 %shr.i.265, 2047
  %and.i.263 = and i32 %b.0, 1048575
  %shr.i.261 = lshr i32 %b.0, 20
  %and.i.262 = and i32 %shr.i.261, 2047
  %shr.i.264306 = xor i32 %b.0, %a.0
  %xor = lshr i32 %shr.i.264306, 31
  %cmp = icmp eq i32 %and.i.266, 2047
  br i1 %cmp, label %if.then, label %if.end.40

if.then:                                          ; preds = %entry
  %or = or i32 %and.i, %a.1
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then.30

lor.lhs.false:                                    ; preds = %if.then
  %cmp27 = icmp ne i32 %and.i.262, 2047
  %or28 = or i32 %and.i.263, %b.1
  %tobool29 = icmp eq i32 %or28, 0
  %or.cond = or i1 %cmp27, %tobool29
  br i1 %or.cond, label %if.end, label %if.then.30

if.then.30:                                       ; preds = %lor.lhs.false, %if.then
  %and.i.56.i.210 = and i32 %a.0, 2146959360
  %cmp.i.57.i.211 = icmp eq i32 %and.i.56.i.210, 2146435072
  br i1 %cmp.i.57.i.211, label %land.rhs.i.59.i.213, label %float64_is_signaling_nan.exit64.i.219

land.rhs.i.59.i.213:                              ; preds = %if.then.30
  %tobool.i.58.i.212 = icmp eq i32 %a.1, 0
  br i1 %tobool.i.58.i.212, label %lor.rhs.i.62.i.216, label %float64_is_signaling_nan.exit64.i.219

lor.rhs.i.62.i.216:                               ; preds = %land.rhs.i.59.i.213
  %and4.i.60.i.214 = and i32 %a.0, 524287
  %tobool5.i.61.i.215 = icmp ne i32 %and4.i.60.i.214, 0
  br label %float64_is_signaling_nan.exit64.i.219

float64_is_signaling_nan.exit64.i.219:            ; preds = %lor.rhs.i.62.i.216, %land.rhs.i.59.i.213, %if.then.30
  %0 = phi i1 [ false, %if.then.30 ], [ true, %land.rhs.i.59.i.213 ], [ %tobool5.i.61.i.215, %lor.rhs.i.62.i.216 ]
  %shl.i.i.217 = shl i32 %b.0, 1
  %cmp.i.50.i.218 = icmp ugt i32 %shl.i.i.217, -2097153
  %1 = or i32 %and.i.263, %b.1
  %2 = icmp ne i32 %1, 0
  %3 = and i1 %cmp.i.50.i.218, %2
  %and.i.i.225 = and i32 %b.0, 2146959360
  %cmp.i.i.226 = icmp eq i32 %and.i.i.225, 2146435072
  br i1 %cmp.i.i.226, label %land.rhs.i.i.229, label %float64_is_signaling_nan.exit.i.240

land.rhs.i.i.229:                                 ; preds = %float64_is_signaling_nan.exit64.i.219
  %tobool.i.i.228 = icmp eq i32 %b.1, 0
  br i1 %tobool.i.i.228, label %lor.rhs.i.i.236, label %if.then.thread.i.233

if.then.thread.i.233:                             ; preds = %land.rhs.i.i.229
  %or17.67.i.230 = or i32 %b.0, 524288
  %4 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !82
  %or.i.79.i.231 = or i32 %4, 16
  store i32 %or.i.79.i.231, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !82
  %b.sroa.0.0..sroa_idx.73.80.i.232 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.true.i.249

lor.rhs.i.i.236:                                  ; preds = %land.rhs.i.i.229
  %and4.i.i.234 = and i32 %b.0, 524287
  %tobool5.i.i.235 = icmp ne i32 %and4.i.i.234, 0
  br label %float64_is_signaling_nan.exit.i.240

float64_is_signaling_nan.exit.i.240:              ; preds = %lor.rhs.i.i.236, %float64_is_signaling_nan.exit64.i.219
  %5 = phi i1 [ false, %float64_is_signaling_nan.exit64.i.219 ], [ %tobool5.i.i.235, %lor.rhs.i.i.236 ]
  %or.i.237 = or i32 %a.0, 524288
  %or17.i.238 = or i32 %b.0, 524288
  %or1865.i.239 = or i1 %0, %5
  br i1 %or1865.i.239, label %if.then.i.243, label %if.end.i.245

if.then.i.243:                                    ; preds = %float64_is_signaling_nan.exit.i.240
  %6 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !82
  %or.i.i.241 = or i32 %6, 16
  store i32 %or.i.i.241, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !82
  %b.sroa.0.0..sroa_idx.73.i.242 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br i1 %5, label %cond.true.i.249, label %cond.false.i.251

if.end.i.245:                                     ; preds = %float64_is_signaling_nan.exit.i.240
  %b.sroa.0.0..sroa_idx.i.244 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.false.i.251

cond.true.i.249:                                  ; preds = %if.then.i.243, %if.then.thread.i.233
  %b.sroa.0.0..sroa_idx77.i.246 = phi i32* [ %b.sroa.0.0..sroa_idx.73.i.242, %if.then.i.243 ], [ %b.sroa.0.0..sroa_idx.73.80.i.232, %if.then.thread.i.233 ]
  %or177174.i.247 = phi i32 [ %or17.i.238, %if.then.i.243 ], [ %or17.67.i.230, %if.then.thread.i.233 ]
  store i32 %or177174.i.247, i32* %b.sroa.0.0..sroa_idx77.i.246, align 4, !alias.scope !82
  %b.sroa.7.0..sroa_idx38.i.248 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %b.1, i32* %b.sroa.7.0..sroa_idx38.i.248, align 4, !alias.scope !82
  br label %cleanup

cond.false.i.251:                                 ; preds = %if.end.i.245, %if.then.i.243
  %b.sroa.0.0..sroa_idx78.i.250 = phi i32* [ %b.sroa.0.0..sroa_idx.73.i.242, %if.then.i.243 ], [ %b.sroa.0.0..sroa_idx.i.244, %if.end.i.245 ]
  br i1 %0, label %cond.true.21.i.253, label %cond.false.22.i.254

cond.true.21.i.253:                               ; preds = %cond.false.i.251
  store i32 %or.i.237, i32* %b.sroa.0.0..sroa_idx78.i.250, align 4, !alias.scope !82
  %a.sroa.7.0..sroa_idx46.i.252 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.7.0..sroa_idx46.i.252, align 4, !alias.scope !82
  br label %cleanup

cond.false.22.i.254:                              ; preds = %cond.false.i.251
  br i1 %3, label %cond.true.24.i.256, label %cond.false.25.i.258

cond.true.24.i.256:                               ; preds = %cond.false.22.i.254
  store i32 %or17.i.238, i32* %b.sroa.0.0..sroa_idx78.i.250, align 4, !alias.scope !82
  %b.sroa.7.0..sroa_idx39.i.255 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %b.1, i32* %b.sroa.7.0..sroa_idx39.i.255, align 4, !alias.scope !82
  br label %cleanup

cond.false.25.i.258:                              ; preds = %cond.false.22.i.254
  store i32 %or.i.237, i32* %b.sroa.0.0..sroa_idx78.i.250, align 4, !alias.scope !82
  %a.sroa.7.0..sroa_idx47.i.257 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.7.0..sroa_idx47.i.257, align 4, !alias.scope !82
  br label %cleanup

if.end:                                           ; preds = %lor.lhs.false
  %or36 = or i32 %or28, %and.i.262
  %cmp37 = icmp eq i32 %or36, 0
  br i1 %cmp37, label %invalid, label %if.end.39

if.end.39:                                        ; preds = %if.end
  %shl.i.206 = shl nuw i32 %xor, 31
  %add.i.207 = or i32 %shl.i.206, 2146435072
  %z.sroa.0.0..sroa_idx.i.208 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %add.i.207, i32* %z.sroa.0.0..sroa_idx.i.208, align 4, !alias.scope !85
  %z.sroa.4.0..sroa_idx4.i.209 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 0, i32* %z.sroa.4.0..sroa_idx4.i.209, align 4, !alias.scope !85
  br label %cleanup

if.end.40:                                        ; preds = %entry
  %cmp41 = icmp eq i32 %and.i.262, 2047
  br i1 %cmp41, label %if.then.42, label %if.end.58

if.then.42:                                       ; preds = %if.end.40
  %or43 = or i32 %and.i.263, %b.1
  %tobool44 = icmp eq i32 %or43, 0
  br i1 %tobool44, label %if.end.50, label %if.then.45

if.then.45:                                       ; preds = %if.then.42
  %and.i.56.i = and i32 %a.0, 2146959360
  %cmp.i.57.i = icmp eq i32 %and.i.56.i, 2146435072
  br i1 %cmp.i.57.i, label %land.rhs.i.59.i, label %float64_is_signaling_nan.exit64.i

land.rhs.i.59.i:                                  ; preds = %if.then.45
  %tobool.i.58.i = icmp eq i32 %a.1, 0
  br i1 %tobool.i.58.i, label %lor.rhs.i.62.i, label %float64_is_signaling_nan.exit64.i

lor.rhs.i.62.i:                                   ; preds = %land.rhs.i.59.i
  %and4.i.60.i = and i32 %a.0, 524287
  %tobool5.i.61.i = icmp ne i32 %and4.i.60.i, 0
  br label %float64_is_signaling_nan.exit64.i

float64_is_signaling_nan.exit64.i:                ; preds = %lor.rhs.i.62.i, %land.rhs.i.59.i, %if.then.45
  %7 = phi i1 [ false, %if.then.45 ], [ true, %land.rhs.i.59.i ], [ %tobool5.i.61.i, %lor.rhs.i.62.i ]
  %shl.i.i.199 = shl i32 %b.0, 1
  %cmp.i.50.i = icmp ugt i32 %shl.i.i.199, -2097153
  %and.i.i.200 = and i32 %b.0, 2146959360
  %cmp.i.i.201 = icmp eq i32 %and.i.i.200, 2146435072
  br i1 %cmp.i.i.201, label %land.rhs.i.i, label %float64_is_signaling_nan.exit.i

land.rhs.i.i:                                     ; preds = %float64_is_signaling_nan.exit64.i
  %tobool.i.i = icmp eq i32 %b.1, 0
  br i1 %tobool.i.i, label %lor.rhs.i.i, label %if.then.thread.i

if.then.thread.i:                                 ; preds = %land.rhs.i.i
  %or17.67.i = or i32 %b.0, 524288
  %8 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !88
  %or.i.79.i = or i32 %8, 16
  store i32 %or.i.79.i, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !88
  %b.sroa.0.0..sroa_idx.73.80.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.true.i

lor.rhs.i.i:                                      ; preds = %land.rhs.i.i
  %and4.i.i = and i32 %b.0, 524287
  %tobool5.i.i = icmp ne i32 %and4.i.i, 0
  br label %float64_is_signaling_nan.exit.i

float64_is_signaling_nan.exit.i:                  ; preds = %lor.rhs.i.i, %float64_is_signaling_nan.exit64.i
  %9 = phi i1 [ false, %float64_is_signaling_nan.exit64.i ], [ %tobool5.i.i, %lor.rhs.i.i ]
  %or.i.202 = or i32 %a.0, 524288
  %or17.i = or i32 %b.0, 524288
  %or1865.i = or i1 %7, %9
  br i1 %or1865.i, label %if.then.i.204, label %if.end.i.205

if.then.i.204:                                    ; preds = %float64_is_signaling_nan.exit.i
  %10 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !88
  %or.i.i.203 = or i32 %10, 16
  store i32 %or.i.i.203, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !88
  %b.sroa.0.0..sroa_idx.73.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br i1 %9, label %cond.true.i, label %cond.false.i

if.end.i.205:                                     ; preds = %float64_is_signaling_nan.exit.i
  %b.sroa.0.0..sroa_idx.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.false.i

cond.true.i:                                      ; preds = %if.then.i.204, %if.then.thread.i
  %b.sroa.0.0..sroa_idx77.i = phi i32* [ %b.sroa.0.0..sroa_idx.73.i, %if.then.i.204 ], [ %b.sroa.0.0..sroa_idx.73.80.i, %if.then.thread.i ]
  %or177174.i = phi i32 [ %or17.i, %if.then.i.204 ], [ %or17.67.i, %if.then.thread.i ]
  store i32 %or177174.i, i32* %b.sroa.0.0..sroa_idx77.i, align 4, !alias.scope !88
  %b.sroa.7.0..sroa_idx38.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %b.1, i32* %b.sroa.7.0..sroa_idx38.i, align 4, !alias.scope !88
  br label %cleanup

cond.false.i:                                     ; preds = %if.end.i.205, %if.then.i.204
  %b.sroa.0.0..sroa_idx78.i = phi i32* [ %b.sroa.0.0..sroa_idx.73.i, %if.then.i.204 ], [ %b.sroa.0.0..sroa_idx.i, %if.end.i.205 ]
  br i1 %7, label %cond.true.21.i, label %cond.false.22.i

cond.true.21.i:                                   ; preds = %cond.false.i
  store i32 %or.i.202, i32* %b.sroa.0.0..sroa_idx78.i, align 4, !alias.scope !88
  %a.sroa.7.0..sroa_idx46.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.7.0..sroa_idx46.i, align 4, !alias.scope !88
  br label %cleanup

cond.false.22.i:                                  ; preds = %cond.false.i
  br i1 %cmp.i.50.i, label %cond.true.24.i, label %cond.false.25.i

cond.true.24.i:                                   ; preds = %cond.false.22.i
  store i32 %or17.i, i32* %b.sroa.0.0..sroa_idx78.i, align 4, !alias.scope !88
  %b.sroa.7.0..sroa_idx39.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %b.1, i32* %b.sroa.7.0..sroa_idx39.i, align 4, !alias.scope !88
  br label %cleanup

cond.false.25.i:                                  ; preds = %cond.false.22.i
  store i32 %or.i.202, i32* %b.sroa.0.0..sroa_idx78.i, align 4, !alias.scope !88
  %a.sroa.7.0..sroa_idx47.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.7.0..sroa_idx47.i, align 4, !alias.scope !88
  br label %cleanup

if.end.50:                                        ; preds = %if.then.42
  %or51 = or i32 %and.i, %a.1
  %or52 = or i32 %or51, %and.i.266
  %cmp53 = icmp eq i32 %or52, 0
  br i1 %cmp53, label %invalid, label %if.end.57

invalid:                                          ; preds = %if.end.50, %if.end
  %11 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.198 = or i32 %11, 16
  store i32 %or.i.198, i32* @float_exception_flags, align 4, !tbaa !1
  %z.sroa.0.0..sroa_idx = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 2147483647, i32* %z.sroa.0.0..sroa_idx, align 4
  %z.sroa.4.0..sroa_idx95 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 -1, i32* %z.sroa.4.0..sroa_idx95, align 4
  br label %cleanup

if.end.57:                                        ; preds = %if.end.50
  %shl.i.194 = shl nuw i32 %xor, 31
  %add.i.195 = or i32 %shl.i.194, 2146435072
  %z.sroa.0.0..sroa_idx.i.196 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %add.i.195, i32* %z.sroa.0.0..sroa_idx.i.196, align 4, !alias.scope !91
  %z.sroa.4.0..sroa_idx4.i.197 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 0, i32* %z.sroa.4.0..sroa_idx4.i.197, align 4, !alias.scope !91
  br label %cleanup

if.end.58:                                        ; preds = %if.end.40
  %cmp59 = icmp eq i32 %and.i.266, 0
  br i1 %cmp59, label %if.then.60, label %if.end.65

if.then.60:                                       ; preds = %if.end.58
  %or61 = or i32 %and.i, %a.1
  %cmp62 = icmp eq i32 %or61, 0
  br i1 %cmp62, label %if.then.63, label %if.end.64

if.then.63:                                       ; preds = %if.then.60
  %shl.i.191 = shl nuw i32 %xor, 31
  %z.sroa.0.0..sroa_idx.i.192 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %shl.i.191, i32* %z.sroa.0.0..sroa_idx.i.192, align 4, !alias.scope !94
  %z.sroa.4.0..sroa_idx4.i.193 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 0, i32* %z.sroa.4.0..sroa_idx4.i.193, align 4, !alias.scope !94
  br label %cleanup

if.end.64:                                        ; preds = %if.then.60
  %cmp.i.138 = icmp eq i32 %and.i, 0
  br i1 %cmp.i.138, label %if.then.i.153, label %if.else.7.i.179

if.then.i.153:                                    ; preds = %if.end.64
  %cmp.i.i.139 = icmp ult i32 %a.1, 65536
  %shl.i.i.140 = shl i32 %a.1, 16
  %shl.a.i.i.141 = select i1 %cmp.i.i.139, i32 %shl.i.i.140, i32 %a.1
  %..i.i.142 = select i1 %cmp.i.i.139, i32 16, i32 0
  %cmp1.i.i.143 = icmp ult i32 %shl.a.i.i.141, 16777216
  %add3.i.i.144 = or i32 %..i.i.142, 8
  %shl4.i.i.145 = shl i32 %shl.a.i.i.141, 8
  %a.addr.1.i.i.146 = select i1 %cmp1.i.i.143, i32 %shl4.i.i.145, i32 %shl.a.i.i.141
  %shiftCount.1.i.i.147 = select i1 %cmp1.i.i.143, i32 %add3.i.i.144, i32 %..i.i.142
  %shr.i.i.148 = lshr i32 %a.addr.1.i.i.146, 24
  %arrayidx.i.i.149 = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.i.148
  %12 = load i32, i32* %arrayidx.i.i.149, align 4, !tbaa !1
  %add6.i.i.150 = add nsw i32 %12, %shiftCount.1.i.i.147
  %sub.i.151 = add nsw i32 %add6.i.i.150, -11
  %cmp1.i.152 = icmp slt i32 %add6.i.i.150, 11
  br i1 %cmp1.i.152, label %if.then.2.i.158, label %if.else.i.160

if.then.2.i.158:                                  ; preds = %if.then.i.153
  %sub3.i.154 = sub i32 11, %add6.i.i.150
  %shr.i.155 = lshr i32 %a.1, %sub3.i.154
  %and.i.156 = and i32 %sub.i.151, 31
  %shl.i.157 = shl i32 %a.1, %and.i.156
  br label %if.end.i.163

if.else.i.160:                                    ; preds = %if.then.i.153
  %shl4.i.159 = shl i32 %a.1, %sub.i.151
  br label %if.end.i.163

if.end.i.163:                                     ; preds = %if.else.i.160, %if.then.2.i.158
  %aSig0.0 = phi i32 [ %shr.i.155, %if.then.2.i.158 ], [ %shl4.i.159, %if.else.i.160 ]
  %storemerge.28.i.161 = phi i32 [ %shl.i.157, %if.then.2.i.158 ], [ 0, %if.else.i.160 ]
  %sub6.i.162 = sub i32 -20, %add6.i.i.150
  br label %if.end.65

if.else.7.i.179:                                  ; preds = %if.end.64
  %cmp.i.32.i.164 = icmp ult i32 %and.i, 65536
  %shl.i.33.i.165 = shl i32 %a.0, 16
  %shl.a.i.34.i.166 = select i1 %cmp.i.32.i.164, i32 %shl.i.33.i.165, i32 %and.i
  %..i.35.i.167 = select i1 %cmp.i.32.i.164, i32 16, i32 0
  %cmp1.i.36.i.168 = icmp ult i32 %shl.a.i.34.i.166, 16777216
  %add3.i.37.i.169 = or i32 %..i.35.i.167, 8
  %shl4.i.38.i.170 = shl i32 %shl.a.i.34.i.166, 8
  %a.addr.1.i.39.i.171 = select i1 %cmp1.i.36.i.168, i32 %shl4.i.38.i.170, i32 %shl.a.i.34.i.166
  %shiftCount.1.i.40.i.172 = select i1 %cmp1.i.36.i.168, i32 %add3.i.37.i.169, i32 %..i.35.i.167
  %shr.i.41.i.173 = lshr i32 %a.addr.1.i.39.i.171, 24
  %arrayidx.i.42.i.174 = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.41.i.173
  %13 = load i32, i32* %arrayidx.i.42.i.174, align 4, !tbaa !1
  %add6.i.43.i.175 = add nsw i32 %13, %shiftCount.1.i.40.i.172
  %sub9.i.176 = add nsw i32 %add6.i.43.i.175, -11
  %shl.i.29.i.177 = shl i32 %a.1, %sub9.i.176
  %cmp.i.30.i.178 = icmp eq i32 %sub9.i.176, 0
  br i1 %cmp.i.30.i.178, label %shortShift64Left.exit.i.188, label %cond.false.i.i.185

cond.false.i.i.185:                               ; preds = %if.else.7.i.179
  %shl1.i.i.180 = shl i32 %and.i, %sub9.i.176
  %sub.i.i.181 = sub i32 11, %add6.i.43.i.175
  %and.i.i.182 = and i32 %sub.i.i.181, 31
  %shr.i.31.i.183 = lshr i32 %a.1, %and.i.i.182
  %or.i.i.184 = or i32 %shr.i.31.i.183, %shl1.i.i.180
  br label %shortShift64Left.exit.i.188

shortShift64Left.exit.i.188:                      ; preds = %cond.false.i.i.185, %if.else.7.i.179
  %cond.i.i.186 = phi i32 [ %or.i.i.184, %cond.false.i.i.185 ], [ %and.i, %if.else.7.i.179 ]
  %sub10.i.187 = sub i32 12, %add6.i.43.i.175
  br label %if.end.65

if.end.65:                                        ; preds = %shortShift64Left.exit.i.188, %if.end.i.163, %if.end.58
  %aSig0.2 = phi i32 [ %and.i, %if.end.58 ], [ %aSig0.0, %if.end.i.163 ], [ %cond.i.i.186, %shortShift64Left.exit.i.188 ]
  %aSig1.1 = phi i32 [ %a.1, %if.end.58 ], [ %storemerge.28.i.161, %if.end.i.163 ], [ %shl.i.29.i.177, %shortShift64Left.exit.i.188 ]
  %aExp.0 = phi i32 [ %and.i.266, %if.end.58 ], [ %sub6.i.162, %if.end.i.163 ], [ %sub10.i.187, %shortShift64Left.exit.i.188 ]
  %cmp66 = icmp eq i32 %and.i.262, 0
  br i1 %cmp66, label %if.then.67, label %if.end.72

if.then.67:                                       ; preds = %if.end.65
  %or68 = or i32 %and.i.263, %b.1
  %cmp69 = icmp eq i32 %or68, 0
  br i1 %cmp69, label %if.then.70, label %if.end.71

if.then.70:                                       ; preds = %if.then.67
  %shl.i.137 = shl nuw i32 %xor, 31
  %z.sroa.0.0..sroa_idx.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %shl.i.137, i32* %z.sroa.0.0..sroa_idx.i, align 4, !alias.scope !97
  %z.sroa.4.0..sroa_idx4.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 0, i32* %z.sroa.4.0..sroa_idx4.i, align 4, !alias.scope !97
  br label %cleanup

if.end.71:                                        ; preds = %if.then.67
  %cmp.i.129 = icmp eq i32 %and.i.263, 0
  br i1 %cmp.i.129, label %if.then.i, label %if.else.7.i

if.then.i:                                        ; preds = %if.end.71
  %cmp.i.i.130 = icmp ult i32 %b.1, 65536
  %shl.i.i.131 = shl i32 %b.1, 16
  %shl.a.i.i = select i1 %cmp.i.i.130, i32 %shl.i.i.131, i32 %b.1
  %..i.i = select i1 %cmp.i.i.130, i32 16, i32 0
  %cmp1.i.i = icmp ult i32 %shl.a.i.i, 16777216
  %add3.i.i = or i32 %..i.i, 8
  %shl4.i.i = shl i32 %shl.a.i.i, 8
  %a.addr.1.i.i = select i1 %cmp1.i.i, i32 %shl4.i.i, i32 %shl.a.i.i
  %shiftCount.1.i.i = select i1 %cmp1.i.i, i32 %add3.i.i, i32 %..i.i
  %shr.i.i.132 = lshr i32 %a.addr.1.i.i, 24
  %arrayidx.i.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.i.132
  %14 = load i32, i32* %arrayidx.i.i, align 4, !tbaa !1
  %add6.i.i = add nsw i32 %14, %shiftCount.1.i.i
  %sub.i = add nsw i32 %add6.i.i, -11
  %cmp1.i = icmp slt i32 %add6.i.i, 11
  br i1 %cmp1.i, label %if.then.2.i, label %if.else.i

if.then.2.i:                                      ; preds = %if.then.i
  %sub3.i = sub i32 11, %add6.i.i
  %shr.i.133 = lshr i32 %b.1, %sub3.i
  %and.i.134 = and i32 %sub.i, 31
  %shl.i.135 = shl i32 %b.1, %and.i.134
  br label %if.end.i

if.else.i:                                        ; preds = %if.then.i
  %shl4.i = shl i32 %b.1, %sub.i
  br label %if.end.i

if.end.i:                                         ; preds = %if.else.i, %if.then.2.i
  %bSig0.0 = phi i32 [ %shr.i.133, %if.then.2.i ], [ %shl4.i, %if.else.i ]
  %storemerge.28.i = phi i32 [ %shl.i.135, %if.then.2.i ], [ 0, %if.else.i ]
  %sub6.i = sub i32 -20, %add6.i.i
  br label %if.end.72

if.else.7.i:                                      ; preds = %if.end.71
  %cmp.i.32.i.136 = icmp ult i32 %and.i.263, 65536
  %shl.i.33.i = shl i32 %b.0, 16
  %shl.a.i.34.i = select i1 %cmp.i.32.i.136, i32 %shl.i.33.i, i32 %and.i.263
  %..i.35.i = select i1 %cmp.i.32.i.136, i32 16, i32 0
  %cmp1.i.36.i = icmp ult i32 %shl.a.i.34.i, 16777216
  %add3.i.37.i = or i32 %..i.35.i, 8
  %shl4.i.38.i = shl i32 %shl.a.i.34.i, 8
  %a.addr.1.i.39.i = select i1 %cmp1.i.36.i, i32 %shl4.i.38.i, i32 %shl.a.i.34.i
  %shiftCount.1.i.40.i = select i1 %cmp1.i.36.i, i32 %add3.i.37.i, i32 %..i.35.i
  %shr.i.41.i = lshr i32 %a.addr.1.i.39.i, 24
  %arrayidx.i.42.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.41.i
  %15 = load i32, i32* %arrayidx.i.42.i, align 4, !tbaa !1
  %add6.i.43.i = add nsw i32 %15, %shiftCount.1.i.40.i
  %sub9.i = add nsw i32 %add6.i.43.i, -11
  %shl.i.29.i = shl i32 %b.1, %sub9.i
  %cmp.i.30.i = icmp eq i32 %sub9.i, 0
  br i1 %cmp.i.30.i, label %shortShift64Left.exit.i, label %cond.false.i.i

cond.false.i.i:                                   ; preds = %if.else.7.i
  %shl1.i.i = shl i32 %and.i.263, %sub9.i
  %sub.i.i = sub i32 11, %add6.i.43.i
  %and.i.i = and i32 %sub.i.i, 31
  %shr.i.31.i = lshr i32 %b.1, %and.i.i
  %or.i.i = or i32 %shr.i.31.i, %shl1.i.i
  br label %shortShift64Left.exit.i

shortShift64Left.exit.i:                          ; preds = %cond.false.i.i, %if.else.7.i
  %cond.i.i = phi i32 [ %or.i.i, %cond.false.i.i ], [ %and.i.263, %if.else.7.i ]
  %sub10.i = sub i32 12, %add6.i.43.i
  br label %if.end.72

if.end.72:                                        ; preds = %shortShift64Left.exit.i, %if.end.i, %if.end.65
  %bExp.0 = phi i32 [ %and.i.262, %if.end.65 ], [ %sub10.i, %shortShift64Left.exit.i ], [ %sub6.i, %if.end.i ]
  %bSig0.2 = phi i32 [ %and.i.263, %if.end.65 ], [ %cond.i.i, %shortShift64Left.exit.i ], [ %bSig0.0, %if.end.i ]
  %bSig1.1 = phi i32 [ %b.1, %if.end.65 ], [ %shl.i.29.i, %shortShift64Left.exit.i ], [ %storemerge.28.i, %if.end.i ]
  %add = add nsw i32 %bExp.0, %aExp.0
  %sub = add nsw i32 %add, -1024
  %or73 = or i32 %aSig0.2, 1048576
  %shl.i.126 = shl i32 %bSig1.1, 12
  %shl1.i = shl i32 %bSig0.2, 12
  %shr.i.127 = lshr i32 %bSig1.1, 20
  %shr.i.i = lshr i32 %aSig1.1, 16
  %16 = lshr i32 %bSig1.1, 4
  %shr3.i.i = and i32 %16, 65535
  %conv5.i.i = and i32 %aSig1.1, 65535
  %conv6.i.i = and i32 %shl.i.126, 61440
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
  %17 = lshr i32 %bSig0.2, 4
  %shr3.i.60.i = and i32 %17, 65535
  %shl1.i.masked = and i32 %shl1.i, 61440
  %conv6.i.62.i = or i32 %shr.i.127, %shl1.i.masked
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
  %shr.i.35.i = lshr i32 %or73, 16
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
  %add19.i.49.i = add i32 %mul15.i.42.i, %or73
  %add24.i.54.i = add i32 %add19.i.49.i, %add18.i.48.i
  %add2.i.34.i = add i32 %add24.i.54.i, %conv23.i.53.i
  %add2.i.i = add i32 %add2.i.34.i, %conv.i.33.i
  %add1.i = add i32 %add2.i.i, %conv.i.i
  %add2.i = add i32 %add1.i, %conv.i
  %cmp74 = icmp ne i32 %add21.i.i, 0
  %conv = zext i1 %cmp74 to i32
  %or75 = or i32 %add.i.7.i, %conv
  %cmp76 = icmp ugt i32 %add2.i, 2097151
  br i1 %cmp76, label %if.then.78, label %if.end.79

if.then.78:                                       ; preds = %if.end.72
  %shl.i = shl i32 %add.i, 31
  %shl3.i = shl i32 %add2.i, 31
  %shr.i = lshr i32 %add.i, 1
  %or.i = or i32 %shl3.i, %shr.i
  %shr4.i = lshr i32 %add2.i, 1
  %cmp20.i = icmp ne i32 %or75, 0
  %conv21.i = zext i1 %cmp20.i to i32
  %or22.i = or i32 %shl.i, %conv21.i
  %inc = add nsw i32 %add, -1023
  br label %if.end.79

if.end.79:                                        ; preds = %if.then.78, %if.end.72
  %zSig0.0 = phi i32 [ %shr4.i, %if.then.78 ], [ %add2.i, %if.end.72 ]
  %zSig1.0 = phi i32 [ %or.i, %if.then.78 ], [ %add.i, %if.end.72 ]
  %zSig2.0 = phi i32 [ %or22.i, %if.then.78 ], [ %or75, %if.end.72 ]
  %zExp.0 = phi i32 [ %inc, %if.then.78 ], [ %sub, %if.end.72 ]
  tail call fastcc void @roundAndPackFloat64(%struct.float64* noalias %agg.result, i32 %xor, i32 %zExp.0, i32 %zSig0.0, i32 %zSig1.0, i32 %zSig2.0)
  br label %cleanup

cleanup:                                          ; preds = %cond.false.25.i, %cond.true.24.i, %cond.true.21.i, %cond.true.i, %cond.false.25.i.258, %cond.true.24.i.256, %cond.true.21.i.253, %cond.true.i.249, %if.end.79, %if.then.70, %if.then.63, %if.end.57, %invalid, %if.end.39
  ret void
}

; Function Attrs: nounwind
define internal fastcc void @roundAndPackFloat64(%struct.float64* noalias nocapture %agg.result, i32 %zSign, i32 %zExp, i32 %zSig0, i32 %zSig1, i32 %zSig2) #2 {
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
  br i1 %cmp22, label %if.then.24, label %if.end.88

if.then.24:                                       ; preds = %if.end.19
  %cmp25 = icmp sgt i32 %zExp, 2045
  br i1 %cmp25, label %if.then.32, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then.24
  %cmp27 = icmp eq i32 %zExp, 2045
  br i1 %cmp27, label %land.lhs.true, label %if.end.47

land.lhs.true:                                    ; preds = %lor.lhs.false
  %cmp.i = icmp eq i32 %zSig0, 2097151
  %cmp1.i = icmp eq i32 %zSig1, -1
  %cmp1..i = and i1 %cmp.i, %cmp1.i
  %tobool31 = icmp ne i32 %increment.0, 0
  %or.cond = and i1 %cmp1..i, %tobool31
  br i1 %or.cond, label %if.then.32, label %if.end.88

if.then.32:                                       ; preds = %land.lhs.true, %if.then.24
  %3 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.158 = or i32 %3, 9
  store i32 %or.i.158, i32* @float_exception_flags, align 4, !tbaa !1
  %cmp33 = icmp eq i32 %0, 1
  br i1 %cmp33, label %if.then.45, label %lor.lhs.false.35

lor.lhs.false.35:                                 ; preds = %if.then.32
  %tobool36 = icmp ne i32 %zSign, 0
  %cmp38 = icmp eq i32 %0, 2
  %or.cond107 = and i1 %tobool36, %cmp38
  br i1 %or.cond107, label %if.then.45, label %lor.lhs.false.40

lor.lhs.false.40:                                 ; preds = %lor.lhs.false.35
  %tobool41 = icmp eq i32 %zSign, 0
  %cmp43 = icmp eq i32 %0, 3
  %or.cond108 = and i1 %tobool41, %cmp43
  br i1 %or.cond108, label %if.then.45, label %if.end.46

if.then.45:                                       ; preds = %lor.lhs.false.40, %lor.lhs.false.35, %if.then.32
  %shl.i.153 = shl i32 %zSign, 31
  %add2.i.155 = or i32 %shl.i.153, 2146435071
  %z.sroa.0.0..sroa_idx.i.156 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %add2.i.155, i32* %z.sroa.0.0..sroa_idx.i.156, align 4, !alias.scope !100
  %z.sroa.4.0..sroa_idx4.i.157 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 -1, i32* %z.sroa.4.0..sroa_idx4.i.157, align 4, !alias.scope !100
  br label %cleanup

if.end.46:                                        ; preds = %lor.lhs.false.40
  %shl.i.149 = shl i32 %zSign, 31
  %add.i.150 = or i32 %shl.i.149, 2146435072
  %z.sroa.0.0..sroa_idx.i.151 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %add.i.150, i32* %z.sroa.0.0..sroa_idx.i.151, align 4, !alias.scope !103
  %z.sroa.4.0..sroa_idx4.i.152 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 0, i32* %z.sroa.4.0..sroa_idx4.i.152, align 4, !alias.scope !103
  br label %cleanup

if.end.47:                                        ; preds = %lor.lhs.false
  %cmp48 = icmp slt i32 %zExp, 0
  br i1 %cmp48, label %if.then.50, label %if.end.88

if.then.50:                                       ; preds = %if.end.47
  %4 = load i32, i32* @float_detect_tininess, align 4, !tbaa !1
  %notlhs = icmp ne i32 %4, 1
  %notrhs = icmp sgt i32 %zExp, -2
  %or.cond109.not = and i1 %notrhs, %notlhs
  %tobool57 = icmp ne i32 %increment.0, 0
  %or.cond110 = and i1 %tobool57, %or.cond109.not
  %or.cond110.not = xor i1 %or.cond110, true
  %cmp.i.147 = icmp ult i32 %zSig0, 2097151
  %or.cond175 = or i1 %cmp.i.147, %or.cond110.not
  br i1 %or.cond175, label %if.else.i, label %lor.rhs.i

lor.rhs.i:                                        ; preds = %if.then.50
  %cmp1.i.148 = icmp eq i32 %zSig0, 2097151
  %cmp2.i = icmp ne i32 %zSig1, -1
  %cmp2..i = and i1 %cmp1.i.148, %cmp2.i
  br label %if.else.i

if.else.i:                                        ; preds = %lor.rhs.i, %if.then.50
  %5 = phi i1 [ true, %if.then.50 ], [ %cmp2..i, %lor.rhs.i ]
  %sub = sub nsw i32 0, %zExp
  %and.i = and i32 %zExp, 31
  %cmp1.i.143 = icmp sgt i32 %zExp, -32
  br i1 %cmp1.i.143, label %if.then.2.i, label %if.else.5.i

if.then.2.i:                                      ; preds = %if.else.i
  %shl.i.144 = shl i32 %zSig1, %and.i
  %shl3.i = shl i32 %zSig0, %and.i
  %shr.i = lshr i32 %zSig1, %sub
  %or.i.145 = or i32 %shr.i, %shl3.i
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
  %conv.i.146 = zext i1 %cmp17.i to i32
  %cond.i = select i1 %cmp16.i, i32 %zSig0, i32 %conv.i.146
  br label %shift64ExtraRightJamming.exit

shift64ExtraRightJamming.exit:                    ; preds = %if.then.2.i, %if.else.5.i, %if.then.11.i, %if.else.15.i
  %z0.0.i = phi i32 [ %shr4.i, %if.then.2.i ], [ 0, %if.else.5.i ], [ 0, %if.then.11.i ], [ 0, %if.else.15.i ]
  %z1.1.i = phi i32 [ %or.i.145, %if.then.2.i ], [ %zSig0, %if.else.5.i ], [ %shr14.i, %if.then.11.i ], [ 0, %if.else.15.i ]
  %z2.1.i = phi i32 [ %shl.i.144, %if.then.2.i ], [ %zSig1, %if.else.5.i ], [ %shl12.i, %if.then.11.i ], [ %cond.i, %if.else.15.i ]
  %a2.addr.1.i = phi i32 [ %zSig2, %if.then.2.i ], [ %zSig2, %if.else.5.i ], [ %or9.i, %if.then.11.i ], [ %or9.i, %if.else.15.i ]
  %cmp20.i = icmp ne i32 %a2.addr.1.i, 0
  %conv21.i = zext i1 %cmp20.i to i32
  %or22.i = or i32 %conv21.i, %z2.1.i
  %tobool62 = icmp ne i32 %or22.i, 0
  %or.cond111 = and i1 %5, %tobool62
  br i1 %or.cond111, label %if.then.63, label %if.end.64

if.then.63:                                       ; preds = %shift64ExtraRightJamming.exit
  %6 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %6, 4
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.64

if.end.64:                                        ; preds = %if.then.63, %shift64ExtraRightJamming.exit
  br i1 %cmp, label %if.then.66, label %if.else.69

if.then.66:                                       ; preds = %if.end.64
  %.lobit = lshr i32 %z2.1.i, 31
  br label %if.end.88

if.else.69:                                       ; preds = %if.end.64
  %tobool70 = icmp eq i32 %zSign, 0
  br i1 %tobool70, label %if.else.78, label %if.then.71

if.then.71:                                       ; preds = %if.else.69
  %cmp72 = icmp eq i32 %0, 3
  %7 = and i1 %cmp72, %tobool62
  %land.ext77 = zext i1 %7 to i32
  br label %if.end.88

if.else.78:                                       ; preds = %if.else.69
  %cmp79 = icmp eq i32 %0, 2
  %8 = and i1 %cmp79, %tobool62
  %land.ext84 = zext i1 %8 to i32
  br label %if.end.88

if.end.88:                                        ; preds = %land.lhs.true, %if.end.47, %if.then.71, %if.else.78, %if.then.66, %if.end.19
  %zSig0.addr.0 = phi i32 [ %z0.0.i, %if.then.66 ], [ %z0.0.i, %if.else.78 ], [ %z0.0.i, %if.then.71 ], [ %zSig0, %if.end.47 ], [ %zSig0, %if.end.19 ], [ %zSig0, %land.lhs.true ]
  %zSig1.addr.0 = phi i32 [ %z1.1.i, %if.then.66 ], [ %z1.1.i, %if.else.78 ], [ %z1.1.i, %if.then.71 ], [ %zSig1, %if.end.47 ], [ %zSig1, %if.end.19 ], [ %zSig1, %land.lhs.true ]
  %zSig2.addr.0 = phi i32 [ %or22.i, %if.then.66 ], [ %or22.i, %if.else.78 ], [ %or22.i, %if.then.71 ], [ %zSig2, %if.end.47 ], [ %zSig2, %if.end.19 ], [ %zSig2, %land.lhs.true ]
  %increment.1 = phi i32 [ %.lobit, %if.then.66 ], [ %land.ext84, %if.else.78 ], [ %land.ext77, %if.then.71 ], [ %increment.0, %if.end.47 ], [ %increment.0, %if.end.19 ], [ %increment.0, %land.lhs.true ]
  %zExp.addr.0 = phi i32 [ 0, %if.then.66 ], [ 0, %if.else.78 ], [ 0, %if.then.71 ], [ %zExp, %if.end.47 ], [ %zExp, %if.end.19 ], [ 2045, %land.lhs.true ]
  %tobool89 = icmp eq i32 %zSig2.addr.0, 0
  br i1 %tobool89, label %if.end.91, label %if.then.90

if.then.90:                                       ; preds = %if.end.88
  %9 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or = or i32 %9, 1
  store i32 %or, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.91

if.end.91:                                        ; preds = %if.end.88, %if.then.90
  %tobool92 = icmp eq i32 %increment.1, 0
  br i1 %tobool92, label %if.else.97, label %if.then.93

if.then.93:                                       ; preds = %if.end.91
  %add.i.139 = add i32 %zSig1.addr.0, 1
  %cmp.i.140 = icmp eq i32 %zSig1.addr.0, -1
  %conv.i = zext i1 %cmp.i.140 to i32
  %add2.i.141 = add i32 %conv.i, %zSig0.addr.0
  %add.mask = and i32 %zSig2.addr.0, 2147483647
  %10 = or i32 %add.mask, %0
  %11 = icmp eq i32 %10, 0
  %and = zext i1 %11 to i32
  %neg = xor i32 %and, -1
  %and96 = and i32 %add.i.139, %neg
  br label %if.end.103

if.else.97:                                       ; preds = %if.end.91
  %or98 = or i32 %zSig1.addr.0, %zSig0.addr.0
  %cmp99 = icmp eq i32 %or98, 0
  %.zExp.addr.0 = select i1 %cmp99, i32 0, i32 %zExp.addr.0
  br label %if.end.103

if.end.103:                                       ; preds = %if.else.97, %if.then.93
  %zSig0.addr.1 = phi i32 [ %zSig0.addr.0, %if.else.97 ], [ %add2.i.141, %if.then.93 ]
  %zSig1.addr.1 = phi i32 [ %zSig1.addr.0, %if.else.97 ], [ %and96, %if.then.93 ]
  %zExp.addr.1 = phi i32 [ %.zExp.addr.0, %if.else.97 ], [ %zExp.addr.0, %if.then.93 ]
  %shl.i = shl i32 %zSign, 31
  %shl1.i = shl i32 %zExp.addr.1, 20
  %add.i = add i32 %zSig0.addr.1, %shl.i
  %add2.i = add i32 %add.i, %shl1.i
  %z.sroa.0.0..sroa_idx.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %add2.i, i32* %z.sroa.0.0..sroa_idx.i, align 4, !alias.scope !106
  %z.sroa.4.0..sroa_idx4.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %zSig1.addr.1, i32* %z.sroa.4.0..sroa_idx4.i, align 4, !alias.scope !106
  br label %cleanup

cleanup:                                          ; preds = %if.end.103, %if.end.46, %if.then.45
  ret void
}

; Function Attrs: nounwind
define void @float64_div(%struct.float64* noalias sret %agg.result, i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #2 {
entry:
  %and.i = and i32 %a.0, 1048575
  %shr.i.498 = lshr i32 %a.0, 20
  %and.i.499 = and i32 %shr.i.498, 2047
  %and.i.496 = and i32 %b.0, 1048575
  %shr.i.494 = lshr i32 %b.0, 20
  %and.i.495 = and i32 %shr.i.494, 2047
  %shr.i.497572 = xor i32 %b.0, %a.0
  %xor = lshr i32 %shr.i.497572, 31
  %cmp = icmp eq i32 %and.i.499, 2047
  br i1 %cmp, label %if.then, label %if.end.43

if.then:                                          ; preds = %entry
  %or = or i32 %and.i, %a.1
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %if.end, label %if.then.27

if.then.27:                                       ; preds = %if.then
  %and.i.56.i.443 = and i32 %a.0, 2146959360
  %cmp.i.57.i.444 = icmp eq i32 %and.i.56.i.443, 2146435072
  br i1 %cmp.i.57.i.444, label %land.rhs.i.59.i.446, label %float64_is_signaling_nan.exit64.i.452

land.rhs.i.59.i.446:                              ; preds = %if.then.27
  %tobool.i.58.i.445 = icmp eq i32 %a.1, 0
  br i1 %tobool.i.58.i.445, label %lor.rhs.i.62.i.449, label %float64_is_signaling_nan.exit64.i.452

lor.rhs.i.62.i.449:                               ; preds = %land.rhs.i.59.i.446
  %and4.i.60.i.447 = and i32 %a.0, 524287
  %tobool5.i.61.i.448 = icmp ne i32 %and4.i.60.i.447, 0
  br label %float64_is_signaling_nan.exit64.i.452

float64_is_signaling_nan.exit64.i.452:            ; preds = %lor.rhs.i.62.i.449, %land.rhs.i.59.i.446, %if.then.27
  %0 = phi i1 [ false, %if.then.27 ], [ true, %land.rhs.i.59.i.446 ], [ %tobool5.i.61.i.448, %lor.rhs.i.62.i.449 ]
  %shl.i.i.450 = shl i32 %b.0, 1
  %cmp.i.50.i.451 = icmp ugt i32 %shl.i.i.450, -2097153
  %1 = or i32 %and.i.496, %b.1
  %2 = icmp ne i32 %1, 0
  %3 = and i1 %cmp.i.50.i.451, %2
  %and.i.i.458 = and i32 %b.0, 2146959360
  %cmp.i.i.459 = icmp eq i32 %and.i.i.458, 2146435072
  br i1 %cmp.i.i.459, label %land.rhs.i.i.462, label %float64_is_signaling_nan.exit.i.473

land.rhs.i.i.462:                                 ; preds = %float64_is_signaling_nan.exit64.i.452
  %tobool.i.i.461 = icmp eq i32 %b.1, 0
  br i1 %tobool.i.i.461, label %lor.rhs.i.i.469, label %if.then.thread.i.466

if.then.thread.i.466:                             ; preds = %land.rhs.i.i.462
  %or17.67.i.463 = or i32 %b.0, 524288
  %4 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !109
  %or.i.79.i.464 = or i32 %4, 16
  store i32 %or.i.79.i.464, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !109
  %b.sroa.0.0..sroa_idx.73.80.i.465 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.true.i.482

lor.rhs.i.i.469:                                  ; preds = %land.rhs.i.i.462
  %and4.i.i.467 = and i32 %b.0, 524287
  %tobool5.i.i.468 = icmp ne i32 %and4.i.i.467, 0
  br label %float64_is_signaling_nan.exit.i.473

float64_is_signaling_nan.exit.i.473:              ; preds = %lor.rhs.i.i.469, %float64_is_signaling_nan.exit64.i.452
  %5 = phi i1 [ false, %float64_is_signaling_nan.exit64.i.452 ], [ %tobool5.i.i.468, %lor.rhs.i.i.469 ]
  %or.i.470 = or i32 %a.0, 524288
  %or17.i.471 = or i32 %b.0, 524288
  %or1865.i.472 = or i1 %0, %5
  br i1 %or1865.i.472, label %if.then.i.476, label %if.end.i.478

if.then.i.476:                                    ; preds = %float64_is_signaling_nan.exit.i.473
  %6 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !109
  %or.i.i.474 = or i32 %6, 16
  store i32 %or.i.i.474, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !109
  %b.sroa.0.0..sroa_idx.73.i.475 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br i1 %5, label %cond.true.i.482, label %cond.false.i.484

if.end.i.478:                                     ; preds = %float64_is_signaling_nan.exit.i.473
  %b.sroa.0.0..sroa_idx.i.477 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.false.i.484

cond.true.i.482:                                  ; preds = %if.then.i.476, %if.then.thread.i.466
  %b.sroa.0.0..sroa_idx77.i.479 = phi i32* [ %b.sroa.0.0..sroa_idx.73.i.475, %if.then.i.476 ], [ %b.sroa.0.0..sroa_idx.73.80.i.465, %if.then.thread.i.466 ]
  %or177174.i.480 = phi i32 [ %or17.i.471, %if.then.i.476 ], [ %or17.67.i.463, %if.then.thread.i.466 ]
  store i32 %or177174.i.480, i32* %b.sroa.0.0..sroa_idx77.i.479, align 4, !alias.scope !109
  %b.sroa.7.0..sroa_idx38.i.481 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %b.1, i32* %b.sroa.7.0..sroa_idx38.i.481, align 4, !alias.scope !109
  br label %cleanup

cond.false.i.484:                                 ; preds = %if.end.i.478, %if.then.i.476
  %b.sroa.0.0..sroa_idx78.i.483 = phi i32* [ %b.sroa.0.0..sroa_idx.73.i.475, %if.then.i.476 ], [ %b.sroa.0.0..sroa_idx.i.477, %if.end.i.478 ]
  br i1 %0, label %cond.true.21.i.486, label %cond.false.22.i.487

cond.true.21.i.486:                               ; preds = %cond.false.i.484
  store i32 %or.i.470, i32* %b.sroa.0.0..sroa_idx78.i.483, align 4, !alias.scope !109
  %a.sroa.7.0..sroa_idx46.i.485 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.7.0..sroa_idx46.i.485, align 4, !alias.scope !109
  br label %cleanup

cond.false.22.i.487:                              ; preds = %cond.false.i.484
  br i1 %3, label %cond.true.24.i.489, label %cond.false.25.i.491

cond.true.24.i.489:                               ; preds = %cond.false.22.i.487
  store i32 %or17.i.471, i32* %b.sroa.0.0..sroa_idx78.i.483, align 4, !alias.scope !109
  %b.sroa.7.0..sroa_idx39.i.488 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %b.1, i32* %b.sroa.7.0..sroa_idx39.i.488, align 4, !alias.scope !109
  br label %cleanup

cond.false.25.i.491:                              ; preds = %cond.false.22.i.487
  store i32 %or.i.470, i32* %b.sroa.0.0..sroa_idx78.i.483, align 4, !alias.scope !109
  %a.sroa.7.0..sroa_idx47.i.490 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.7.0..sroa_idx47.i.490, align 4, !alias.scope !109
  br label %cleanup

if.end:                                           ; preds = %if.then
  %cmp32 = icmp eq i32 %and.i.495, 2047
  br i1 %cmp32, label %if.then.33, label %if.end.42

if.then.33:                                       ; preds = %if.end
  %or34 = or i32 %and.i.496, %b.1
  %tobool35 = icmp eq i32 %or34, 0
  br i1 %tobool35, label %invalid, label %if.then.36

if.then.36:                                       ; preds = %if.then.33
  %and.i.56.i.393 = and i32 %a.0, 2146959360
  %cmp.i.57.i.394 = icmp eq i32 %and.i.56.i.393, 2146435072
  br i1 %cmp.i.57.i.394, label %land.rhs.i.59.i.396, label %float64_is_signaling_nan.exit64.i.402

land.rhs.i.59.i.396:                              ; preds = %if.then.36
  %tobool.i.58.i.395 = icmp eq i32 %a.1, 0
  br i1 %tobool.i.58.i.395, label %lor.rhs.i.62.i.399, label %float64_is_signaling_nan.exit64.i.402

lor.rhs.i.62.i.399:                               ; preds = %land.rhs.i.59.i.396
  %and4.i.60.i.397 = and i32 %a.0, 524287
  %tobool5.i.61.i.398 = icmp ne i32 %and4.i.60.i.397, 0
  br label %float64_is_signaling_nan.exit64.i.402

float64_is_signaling_nan.exit64.i.402:            ; preds = %lor.rhs.i.62.i.399, %land.rhs.i.59.i.396, %if.then.36
  %7 = phi i1 [ false, %if.then.36 ], [ true, %land.rhs.i.59.i.396 ], [ %tobool5.i.61.i.398, %lor.rhs.i.62.i.399 ]
  %shl.i.i.400 = shl i32 %b.0, 1
  %cmp.i.50.i.401 = icmp ugt i32 %shl.i.i.400, -2097153
  %and.i.i.408 = and i32 %b.0, 2146959360
  %cmp.i.i.409 = icmp eq i32 %and.i.i.408, 2146435072
  br i1 %cmp.i.i.409, label %land.rhs.i.i.412, label %float64_is_signaling_nan.exit.i.423

land.rhs.i.i.412:                                 ; preds = %float64_is_signaling_nan.exit64.i.402
  %tobool.i.i.411 = icmp eq i32 %b.1, 0
  br i1 %tobool.i.i.411, label %lor.rhs.i.i.419, label %if.then.thread.i.416

if.then.thread.i.416:                             ; preds = %land.rhs.i.i.412
  %or17.67.i.413 = or i32 %b.0, 524288
  %8 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !112
  %or.i.79.i.414 = or i32 %8, 16
  store i32 %or.i.79.i.414, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !112
  %b.sroa.0.0..sroa_idx.73.80.i.415 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.true.i.432

lor.rhs.i.i.419:                                  ; preds = %land.rhs.i.i.412
  %and4.i.i.417 = and i32 %b.0, 524287
  %tobool5.i.i.418 = icmp ne i32 %and4.i.i.417, 0
  br label %float64_is_signaling_nan.exit.i.423

float64_is_signaling_nan.exit.i.423:              ; preds = %lor.rhs.i.i.419, %float64_is_signaling_nan.exit64.i.402
  %9 = phi i1 [ false, %float64_is_signaling_nan.exit64.i.402 ], [ %tobool5.i.i.418, %lor.rhs.i.i.419 ]
  %or.i.420 = or i32 %a.0, 524288
  %or17.i.421 = or i32 %b.0, 524288
  %or1865.i.422 = or i1 %7, %9
  br i1 %or1865.i.422, label %if.then.i.426, label %if.end.i.428

if.then.i.426:                                    ; preds = %float64_is_signaling_nan.exit.i.423
  %10 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !112
  %or.i.i.424 = or i32 %10, 16
  store i32 %or.i.i.424, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !112
  %b.sroa.0.0..sroa_idx.73.i.425 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br i1 %9, label %cond.true.i.432, label %cond.false.i.434

if.end.i.428:                                     ; preds = %float64_is_signaling_nan.exit.i.423
  %b.sroa.0.0..sroa_idx.i.427 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.false.i.434

cond.true.i.432:                                  ; preds = %if.then.i.426, %if.then.thread.i.416
  %b.sroa.0.0..sroa_idx77.i.429 = phi i32* [ %b.sroa.0.0..sroa_idx.73.i.425, %if.then.i.426 ], [ %b.sroa.0.0..sroa_idx.73.80.i.415, %if.then.thread.i.416 ]
  %or177174.i.430 = phi i32 [ %or17.i.421, %if.then.i.426 ], [ %or17.67.i.413, %if.then.thread.i.416 ]
  store i32 %or177174.i.430, i32* %b.sroa.0.0..sroa_idx77.i.429, align 4, !alias.scope !112
  %b.sroa.7.0..sroa_idx38.i.431 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %b.1, i32* %b.sroa.7.0..sroa_idx38.i.431, align 4, !alias.scope !112
  br label %cleanup

cond.false.i.434:                                 ; preds = %if.end.i.428, %if.then.i.426
  %b.sroa.0.0..sroa_idx78.i.433 = phi i32* [ %b.sroa.0.0..sroa_idx.73.i.425, %if.then.i.426 ], [ %b.sroa.0.0..sroa_idx.i.427, %if.end.i.428 ]
  br i1 %7, label %cond.true.21.i.436, label %cond.false.22.i.437

cond.true.21.i.436:                               ; preds = %cond.false.i.434
  store i32 %or.i.420, i32* %b.sroa.0.0..sroa_idx78.i.433, align 4, !alias.scope !112
  %a.sroa.7.0..sroa_idx46.i.435 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.7.0..sroa_idx46.i.435, align 4, !alias.scope !112
  br label %cleanup

cond.false.22.i.437:                              ; preds = %cond.false.i.434
  br i1 %cmp.i.50.i.401, label %cond.true.24.i.439, label %cond.false.25.i.441

cond.true.24.i.439:                               ; preds = %cond.false.22.i.437
  store i32 %or17.i.421, i32* %b.sroa.0.0..sroa_idx78.i.433, align 4, !alias.scope !112
  %b.sroa.7.0..sroa_idx39.i.438 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %b.1, i32* %b.sroa.7.0..sroa_idx39.i.438, align 4, !alias.scope !112
  br label %cleanup

cond.false.25.i.441:                              ; preds = %cond.false.22.i.437
  store i32 %or.i.420, i32* %b.sroa.0.0..sroa_idx78.i.433, align 4, !alias.scope !112
  %a.sroa.7.0..sroa_idx47.i.440 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.7.0..sroa_idx47.i.440, align 4, !alias.scope !112
  br label %cleanup

if.end.42:                                        ; preds = %if.end
  %shl.i.389 = shl nuw i32 %xor, 31
  %add.i.390 = or i32 %shl.i.389, 2146435072
  %z.sroa.0.0..sroa_idx.i.391 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %add.i.390, i32* %z.sroa.0.0..sroa_idx.i.391, align 4, !alias.scope !115
  %z.sroa.4.0..sroa_idx4.i.392 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 0, i32* %z.sroa.4.0..sroa_idx4.i.392, align 4, !alias.scope !115
  br label %cleanup

if.end.43:                                        ; preds = %entry
  switch i32 %and.i.495, label %if.end.68 [
    i32 2047, label %if.then.45
    i32 0, label %if.then.56
  ]

if.then.45:                                       ; preds = %if.end.43
  %or46 = or i32 %and.i.496, %b.1
  %tobool47 = icmp eq i32 %or46, 0
  br i1 %tobool47, label %if.end.53, label %if.then.48

if.then.48:                                       ; preds = %if.then.45
  %and.i.56.i = and i32 %a.0, 2146959360
  %cmp.i.57.i = icmp eq i32 %and.i.56.i, 2146435072
  br i1 %cmp.i.57.i, label %land.rhs.i.59.i, label %float64_is_signaling_nan.exit64.i

land.rhs.i.59.i:                                  ; preds = %if.then.48
  %tobool.i.58.i = icmp eq i32 %a.1, 0
  br i1 %tobool.i.58.i, label %lor.rhs.i.62.i, label %float64_is_signaling_nan.exit64.i

lor.rhs.i.62.i:                                   ; preds = %land.rhs.i.59.i
  %and4.i.60.i = and i32 %a.0, 524287
  %tobool5.i.61.i = icmp ne i32 %and4.i.60.i, 0
  br label %float64_is_signaling_nan.exit64.i

float64_is_signaling_nan.exit64.i:                ; preds = %lor.rhs.i.62.i, %land.rhs.i.59.i, %if.then.48
  %11 = phi i1 [ false, %if.then.48 ], [ true, %land.rhs.i.59.i ], [ %tobool5.i.61.i, %lor.rhs.i.62.i ]
  %shl.i.i.381 = shl i32 %b.0, 1
  %cmp.i.50.i = icmp ugt i32 %shl.i.i.381, -2097153
  %and.i.i.382 = and i32 %b.0, 2146959360
  %cmp.i.i.383 = icmp eq i32 %and.i.i.382, 2146435072
  br i1 %cmp.i.i.383, label %land.rhs.i.i, label %float64_is_signaling_nan.exit.i

land.rhs.i.i:                                     ; preds = %float64_is_signaling_nan.exit64.i
  %tobool.i.i = icmp eq i32 %b.1, 0
  br i1 %tobool.i.i, label %lor.rhs.i.i, label %if.then.thread.i

if.then.thread.i:                                 ; preds = %land.rhs.i.i
  %or17.67.i = or i32 %b.0, 524288
  %12 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !118
  %or.i.79.i = or i32 %12, 16
  store i32 %or.i.79.i, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !118
  %b.sroa.0.0..sroa_idx.73.80.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.true.i

lor.rhs.i.i:                                      ; preds = %land.rhs.i.i
  %and4.i.i = and i32 %b.0, 524287
  %tobool5.i.i = icmp ne i32 %and4.i.i, 0
  br label %float64_is_signaling_nan.exit.i

float64_is_signaling_nan.exit.i:                  ; preds = %lor.rhs.i.i, %float64_is_signaling_nan.exit64.i
  %13 = phi i1 [ false, %float64_is_signaling_nan.exit64.i ], [ %tobool5.i.i, %lor.rhs.i.i ]
  %or.i.384 = or i32 %a.0, 524288
  %or17.i = or i32 %b.0, 524288
  %or1865.i = or i1 %11, %13
  br i1 %or1865.i, label %if.then.i.386, label %if.end.i.387

if.then.i.386:                                    ; preds = %float64_is_signaling_nan.exit.i
  %14 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !118
  %or.i.i.385 = or i32 %14, 16
  store i32 %or.i.i.385, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !118
  %b.sroa.0.0..sroa_idx.73.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br i1 %13, label %cond.true.i, label %cond.false.i.388

if.end.i.387:                                     ; preds = %float64_is_signaling_nan.exit.i
  %b.sroa.0.0..sroa_idx.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.false.i.388

cond.true.i:                                      ; preds = %if.then.i.386, %if.then.thread.i
  %b.sroa.0.0..sroa_idx77.i = phi i32* [ %b.sroa.0.0..sroa_idx.73.i, %if.then.i.386 ], [ %b.sroa.0.0..sroa_idx.73.80.i, %if.then.thread.i ]
  %or177174.i = phi i32 [ %or17.i, %if.then.i.386 ], [ %or17.67.i, %if.then.thread.i ]
  store i32 %or177174.i, i32* %b.sroa.0.0..sroa_idx77.i, align 4, !alias.scope !118
  %b.sroa.7.0..sroa_idx38.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %b.1, i32* %b.sroa.7.0..sroa_idx38.i, align 4, !alias.scope !118
  br label %cleanup

cond.false.i.388:                                 ; preds = %if.end.i.387, %if.then.i.386
  %b.sroa.0.0..sroa_idx78.i = phi i32* [ %b.sroa.0.0..sroa_idx.73.i, %if.then.i.386 ], [ %b.sroa.0.0..sroa_idx.i, %if.end.i.387 ]
  br i1 %11, label %cond.true.21.i, label %cond.false.22.i

cond.true.21.i:                                   ; preds = %cond.false.i.388
  store i32 %or.i.384, i32* %b.sroa.0.0..sroa_idx78.i, align 4, !alias.scope !118
  %a.sroa.7.0..sroa_idx46.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.7.0..sroa_idx46.i, align 4, !alias.scope !118
  br label %cleanup

cond.false.22.i:                                  ; preds = %cond.false.i.388
  br i1 %cmp.i.50.i, label %cond.true.24.i, label %cond.false.25.i

cond.true.24.i:                                   ; preds = %cond.false.22.i
  store i32 %or17.i, i32* %b.sroa.0.0..sroa_idx78.i, align 4, !alias.scope !118
  %b.sroa.7.0..sroa_idx39.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %b.1, i32* %b.sroa.7.0..sroa_idx39.i, align 4, !alias.scope !118
  br label %cleanup

cond.false.25.i:                                  ; preds = %cond.false.22.i
  store i32 %or.i.384, i32* %b.sroa.0.0..sroa_idx78.i, align 4, !alias.scope !118
  %a.sroa.7.0..sroa_idx47.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.7.0..sroa_idx47.i, align 4, !alias.scope !118
  br label %cleanup

if.end.53:                                        ; preds = %if.then.45
  %shl.i.378 = shl nuw i32 %xor, 31
  %z.sroa.0.0..sroa_idx.i.379 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %shl.i.378, i32* %z.sroa.0.0..sroa_idx.i.379, align 4, !alias.scope !121
  %z.sroa.4.0..sroa_idx4.i.380 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 0, i32* %z.sroa.4.0..sroa_idx4.i.380, align 4, !alias.scope !121
  br label %cleanup

if.then.56:                                       ; preds = %if.end.43
  %or57 = or i32 %and.i.496, %b.1
  %cmp58 = icmp eq i32 %or57, 0
  br i1 %cmp58, label %if.then.59, label %if.end.67

if.then.59:                                       ; preds = %if.then.56
  %or60 = or i32 %and.i, %a.1
  %or61 = or i32 %or60, %and.i.499
  %cmp62 = icmp eq i32 %or61, 0
  br i1 %cmp62, label %invalid, label %if.end.66

invalid:                                          ; preds = %if.then.33, %if.then.59
  %15 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.377 = or i32 %15, 16
  store i32 %or.i.377, i32* @float_exception_flags, align 4, !tbaa !1
  %z.sroa.0.0..sroa_idx = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 2147483647, i32* %z.sroa.0.0..sroa_idx, align 4
  %z.sroa.4.0..sroa_idx119 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 -1, i32* %z.sroa.4.0..sroa_idx119, align 4
  br label %cleanup

if.end.66:                                        ; preds = %if.then.59
  %16 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.376 = or i32 %16, 2
  store i32 %or.i.376, i32* @float_exception_flags, align 4, !tbaa !1
  %shl.i.372 = shl nuw i32 %xor, 31
  %add.i.373 = or i32 %shl.i.372, 2146435072
  %z.sroa.0.0..sroa_idx.i.374 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %add.i.373, i32* %z.sroa.0.0..sroa_idx.i.374, align 4, !alias.scope !124
  %z.sroa.4.0..sroa_idx4.i.375 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 0, i32* %z.sroa.4.0..sroa_idx4.i.375, align 4, !alias.scope !124
  br label %cleanup

if.end.67:                                        ; preds = %if.then.56
  %cmp.i.319 = icmp eq i32 %and.i.496, 0
  br i1 %cmp.i.319, label %if.then.i.334, label %if.else.7.i.360

if.then.i.334:                                    ; preds = %if.end.67
  %cmp.i.i.320 = icmp ult i32 %b.1, 65536
  %shl.i.i.321 = shl i32 %b.1, 16
  %shl.a.i.i.322 = select i1 %cmp.i.i.320, i32 %shl.i.i.321, i32 %b.1
  %..i.i.323 = select i1 %cmp.i.i.320, i32 16, i32 0
  %cmp1.i.i.324 = icmp ult i32 %shl.a.i.i.322, 16777216
  %add3.i.i.325 = or i32 %..i.i.323, 8
  %shl4.i.i.326 = shl i32 %shl.a.i.i.322, 8
  %a.addr.1.i.i.327 = select i1 %cmp1.i.i.324, i32 %shl4.i.i.326, i32 %shl.a.i.i.322
  %shiftCount.1.i.i.328 = select i1 %cmp1.i.i.324, i32 %add3.i.i.325, i32 %..i.i.323
  %shr.i.i.329 = lshr i32 %a.addr.1.i.i.327, 24
  %arrayidx.i.i.330 = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.i.329
  %17 = load i32, i32* %arrayidx.i.i.330, align 4, !tbaa !1
  %add6.i.i.331 = add nsw i32 %17, %shiftCount.1.i.i.328
  %sub.i.332 = add nsw i32 %add6.i.i.331, -11
  %cmp1.i.333 = icmp slt i32 %add6.i.i.331, 11
  br i1 %cmp1.i.333, label %if.then.2.i.339, label %if.else.i.341

if.then.2.i.339:                                  ; preds = %if.then.i.334
  %sub3.i.335 = sub i32 11, %add6.i.i.331
  %shr.i.336 = lshr i32 %b.1, %sub3.i.335
  %and.i.337 = and i32 %sub.i.332, 31
  %shl.i.338 = shl i32 %b.1, %and.i.337
  br label %if.end.i.344

if.else.i.341:                                    ; preds = %if.then.i.334
  %shl4.i.340 = shl i32 %b.1, %sub.i.332
  br label %if.end.i.344

if.end.i.344:                                     ; preds = %if.else.i.341, %if.then.2.i.339
  %bSig0.0 = phi i32 [ %shr.i.336, %if.then.2.i.339 ], [ %shl4.i.340, %if.else.i.341 ]
  %storemerge.28.i.342 = phi i32 [ %shl.i.338, %if.then.2.i.339 ], [ 0, %if.else.i.341 ]
  %sub6.i.343 = sub i32 -20, %add6.i.i.331
  br label %if.end.68

if.else.7.i.360:                                  ; preds = %if.end.67
  %cmp.i.32.i.345 = icmp ult i32 %and.i.496, 65536
  %shl.i.33.i.346 = shl i32 %b.0, 16
  %shl.a.i.34.i.347 = select i1 %cmp.i.32.i.345, i32 %shl.i.33.i.346, i32 %and.i.496
  %..i.35.i.348 = select i1 %cmp.i.32.i.345, i32 16, i32 0
  %cmp1.i.36.i.349 = icmp ult i32 %shl.a.i.34.i.347, 16777216
  %add3.i.37.i.350 = or i32 %..i.35.i.348, 8
  %shl4.i.38.i.351 = shl i32 %shl.a.i.34.i.347, 8
  %a.addr.1.i.39.i.352 = select i1 %cmp1.i.36.i.349, i32 %shl4.i.38.i.351, i32 %shl.a.i.34.i.347
  %shiftCount.1.i.40.i.353 = select i1 %cmp1.i.36.i.349, i32 %add3.i.37.i.350, i32 %..i.35.i.348
  %shr.i.41.i.354 = lshr i32 %a.addr.1.i.39.i.352, 24
  %arrayidx.i.42.i.355 = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.41.i.354
  %18 = load i32, i32* %arrayidx.i.42.i.355, align 4, !tbaa !1
  %add6.i.43.i.356 = add nsw i32 %18, %shiftCount.1.i.40.i.353
  %sub9.i.357 = add nsw i32 %add6.i.43.i.356, -11
  %shl.i.29.i.358 = shl i32 %b.1, %sub9.i.357
  %cmp.i.30.i.359 = icmp eq i32 %sub9.i.357, 0
  br i1 %cmp.i.30.i.359, label %shortShift64Left.exit.i.369, label %cond.false.i.i.366

cond.false.i.i.366:                               ; preds = %if.else.7.i.360
  %shl1.i.i.361 = shl i32 %and.i.496, %sub9.i.357
  %sub.i.i.362 = sub i32 11, %add6.i.43.i.356
  %and.i.i.363 = and i32 %sub.i.i.362, 31
  %shr.i.31.i.364 = lshr i32 %b.1, %and.i.i.363
  %or.i.i.365 = or i32 %shr.i.31.i.364, %shl1.i.i.361
  br label %shortShift64Left.exit.i.369

shortShift64Left.exit.i.369:                      ; preds = %cond.false.i.i.366, %if.else.7.i.360
  %cond.i.i.367 = phi i32 [ %or.i.i.365, %cond.false.i.i.366 ], [ %and.i.496, %if.else.7.i.360 ]
  %sub10.i.368 = sub i32 12, %add6.i.43.i.356
  br label %if.end.68

if.end.68:                                        ; preds = %shortShift64Left.exit.i.369, %if.end.i.344, %if.end.43
  %bSig0.2 = phi i32 [ %and.i.496, %if.end.43 ], [ %bSig0.0, %if.end.i.344 ], [ %cond.i.i.367, %shortShift64Left.exit.i.369 ]
  %bSig1.1 = phi i32 [ %b.1, %if.end.43 ], [ %storemerge.28.i.342, %if.end.i.344 ], [ %shl.i.29.i.358, %shortShift64Left.exit.i.369 ]
  %bExp.0 = phi i32 [ %and.i.495, %if.end.43 ], [ %sub6.i.343, %if.end.i.344 ], [ %sub10.i.368, %shortShift64Left.exit.i.369 ]
  %cmp69 = icmp eq i32 %and.i.499, 0
  br i1 %cmp69, label %if.then.70, label %if.end.75

if.then.70:                                       ; preds = %if.end.68
  %or71 = or i32 %and.i, %a.1
  %cmp72 = icmp eq i32 %or71, 0
  br i1 %cmp72, label %if.then.73, label %if.end.74

if.then.73:                                       ; preds = %if.then.70
  %shl.i.318 = shl nuw i32 %xor, 31
  %z.sroa.0.0..sroa_idx.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %shl.i.318, i32* %z.sroa.0.0..sroa_idx.i, align 4, !alias.scope !127
  %z.sroa.4.0..sroa_idx4.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 0, i32* %z.sroa.4.0..sroa_idx4.i, align 4, !alias.scope !127
  br label %cleanup

if.end.74:                                        ; preds = %if.then.70
  %cmp.i.305 = icmp eq i32 %and.i, 0
  br i1 %cmp.i.305, label %if.then.i, label %if.else.7.i

if.then.i:                                        ; preds = %if.end.74
  %cmp.i.i.306 = icmp ult i32 %a.1, 65536
  %shl.i.i.307 = shl i32 %a.1, 16
  %shl.a.i.i = select i1 %cmp.i.i.306, i32 %shl.i.i.307, i32 %a.1
  %..i.i = select i1 %cmp.i.i.306, i32 16, i32 0
  %cmp1.i.i = icmp ult i32 %shl.a.i.i, 16777216
  %add3.i.i = or i32 %..i.i, 8
  %shl4.i.i = shl i32 %shl.a.i.i, 8
  %a.addr.1.i.i = select i1 %cmp1.i.i, i32 %shl4.i.i, i32 %shl.a.i.i
  %shiftCount.1.i.i = select i1 %cmp1.i.i, i32 %add3.i.i, i32 %..i.i
  %shr.i.i.308 = lshr i32 %a.addr.1.i.i, 24
  %arrayidx.i.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.i.308
  %19 = load i32, i32* %arrayidx.i.i, align 4, !tbaa !1
  %add6.i.i = add nsw i32 %19, %shiftCount.1.i.i
  %sub.i.309 = add nsw i32 %add6.i.i, -11
  %cmp1.i.310 = icmp slt i32 %add6.i.i, 11
  br i1 %cmp1.i.310, label %if.then.2.i, label %if.else.i

if.then.2.i:                                      ; preds = %if.then.i
  %sub3.i = sub i32 11, %add6.i.i
  %shr.i.311 = lshr i32 %a.1, %sub3.i
  %and.i.312 = and i32 %sub.i.309, 31
  %shl.i.313 = shl i32 %a.1, %and.i.312
  br label %if.end.i.315

if.else.i:                                        ; preds = %if.then.i
  %shl4.i.314 = shl i32 %a.1, %sub.i.309
  br label %if.end.i.315

if.end.i.315:                                     ; preds = %if.else.i, %if.then.2.i
  %aSig0.0 = phi i32 [ %shr.i.311, %if.then.2.i ], [ %shl4.i.314, %if.else.i ]
  %storemerge.28.i = phi i32 [ %shl.i.313, %if.then.2.i ], [ 0, %if.else.i ]
  %sub6.i = sub i32 -20, %add6.i.i
  br label %if.end.75

if.else.7.i:                                      ; preds = %if.end.74
  %cmp.i.32.i = icmp ult i32 %and.i, 65536
  %shl.i.33.i = shl i32 %a.0, 16
  %shl.a.i.34.i = select i1 %cmp.i.32.i, i32 %shl.i.33.i, i32 %and.i
  %..i.35.i = select i1 %cmp.i.32.i, i32 16, i32 0
  %cmp1.i.36.i = icmp ult i32 %shl.a.i.34.i, 16777216
  %add3.i.37.i = or i32 %..i.35.i, 8
  %shl4.i.38.i = shl i32 %shl.a.i.34.i, 8
  %a.addr.1.i.39.i = select i1 %cmp1.i.36.i, i32 %shl4.i.38.i, i32 %shl.a.i.34.i
  %shiftCount.1.i.40.i = select i1 %cmp1.i.36.i, i32 %add3.i.37.i, i32 %..i.35.i
  %shr.i.41.i = lshr i32 %a.addr.1.i.39.i, 24
  %arrayidx.i.42.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.41.i
  %20 = load i32, i32* %arrayidx.i.42.i, align 4, !tbaa !1
  %add6.i.43.i = add nsw i32 %20, %shiftCount.1.i.40.i
  %sub9.i.316 = add nsw i32 %add6.i.43.i, -11
  %shl.i.29.i = shl i32 %a.1, %sub9.i.316
  %cmp.i.30.i = icmp eq i32 %sub9.i.316, 0
  br i1 %cmp.i.30.i, label %shortShift64Left.exit.i, label %cond.false.i.i

cond.false.i.i:                                   ; preds = %if.else.7.i
  %shl1.i.i = shl i32 %and.i, %sub9.i.316
  %sub.i.i.317 = sub i32 11, %add6.i.43.i
  %and.i.i = and i32 %sub.i.i.317, 31
  %shr.i.31.i = lshr i32 %a.1, %and.i.i
  %or.i.i = or i32 %shr.i.31.i, %shl1.i.i
  br label %shortShift64Left.exit.i

shortShift64Left.exit.i:                          ; preds = %cond.false.i.i, %if.else.7.i
  %cond.i.i = phi i32 [ %or.i.i, %cond.false.i.i ], [ %and.i, %if.else.7.i ]
  %sub10.i = sub i32 12, %add6.i.43.i
  br label %if.end.75

if.end.75:                                        ; preds = %shortShift64Left.exit.i, %if.end.i.315, %if.end.68
  %aSig1.1 = phi i32 [ %a.1, %if.end.68 ], [ %storemerge.28.i, %if.end.i.315 ], [ %shl.i.29.i, %shortShift64Left.exit.i ]
  %aSig0.2 = phi i32 [ %and.i, %if.end.68 ], [ %aSig0.0, %if.end.i.315 ], [ %cond.i.i, %shortShift64Left.exit.i ]
  %aExp.0 = phi i32 [ %and.i.499, %if.end.68 ], [ %sub6.i, %if.end.i.315 ], [ %sub10.i, %shortShift64Left.exit.i ]
  %sub = sub nsw i32 %aExp.0, %bExp.0
  %shl.i.298 = shl i32 %aSig1.1, 11
  %or76 = shl i32 %aSig0.2, 11
  %shr.i.300 = lshr i32 %aSig1.1, 21
  %shl1.i.299 = or i32 %shr.i.300, %or76
  %or.i.301 = or i32 %shl1.i.299, -2147483648
  %shl.i.292 = shl i32 %bSig1.1, 11
  %or77 = shl i32 %bSig0.2, 11
  %shl1.i = or i32 %or77, -2147483648
  %shr.i.293 = lshr i32 %bSig1.1, 21
  %or.i.294 = or i32 %shr.i.293, %shl1.i
  %cmp.i.289 = icmp ult i32 %or.i.294, %or.i.301
  br i1 %cmp.i.289, label %if.then.80, label %lor.rhs.i

lor.rhs.i:                                        ; preds = %if.end.75
  %add = add nsw i32 %sub, 1021
  %cmp1.i.290 = icmp eq i32 %or.i.294, %or.i.301
  %cmp2.i.291 = icmp ule i32 %shl.i.292, %shl.i.298
  %cmp2..i = and i1 %cmp2.i.291, %cmp1.i.290
  br i1 %cmp2..i, label %if.then.80, label %if.end.81

if.then.80:                                       ; preds = %if.end.75, %lor.rhs.i
  %shl.i.286 = shl i32 %shr.i.300, 31
  %21 = shl i32 %aSig1.1, 10
  %shr.i.287 = and i32 %21, 2147482624
  %or.i.288 = or i32 %shl.i.286, %shr.i.287
  %shr3.i = lshr i32 %or.i.301, 1
  %inc = add nsw i32 %sub, 1022
  br label %if.end.81

if.end.81:                                        ; preds = %lor.rhs.i, %if.then.80
  %aSig1.2 = phi i32 [ %shl.i.298, %lor.rhs.i ], [ %or.i.288, %if.then.80 ]
  %aSig0.3 = phi i32 [ %or.i.301, %lor.rhs.i ], [ %shr3.i, %if.then.80 ]
  %zExp.0 = phi i32 [ %add, %lor.rhs.i ], [ %inc, %if.then.80 ]
  %cmp.i.235 = icmp ugt i32 %or.i.294, %aSig0.3
  %shr.i.236 = lshr i32 %shl1.i, 16
  br i1 %cmp.i.235, label %if.end.i.239, label %if.end.81.estimateDiv64To32.exit285_crit_edge

if.end.81.estimateDiv64To32.exit285_crit_edge:    ; preds = %if.end.81
  %.pre589 = and i32 %or.i.294, 65535
  br label %estimateDiv64To32.exit285

if.end.i.239:                                     ; preds = %if.end.81
  %shl.i.237 = shl nuw i32 %shr.i.236, 16
  %cmp1.i.238 = icmp ugt i32 %shl.i.237, %aSig0.3
  br i1 %cmp1.i.238, label %cond.false.i.242, label %cond.end.i.257

cond.false.i.242:                                 ; preds = %if.end.i.239
  %div.i.240 = udiv i32 %aSig0.3, %shr.i.236
  %shl2.i.241 = shl i32 %div.i.240, 16
  br label %cond.end.i.257

cond.end.i.257:                                   ; preds = %cond.false.i.242, %if.end.i.239
  %cond.i.243 = phi i32 [ %shl2.i.241, %cond.false.i.242 ], [ -65536, %if.end.i.239 ]
  %shr3.i.i.244 = lshr exact i32 %cond.i.243, 16
  %conv5.i.i.245 = and i32 %or.i.294, 65535
  %mul9.i.i.246 = mul nuw i32 %shr3.i.i.244, %conv5.i.i.245
  %mul15.i.i.247 = mul nuw i32 %shr3.i.i.244, %shr.i.236
  %shr17.i.i.248 = lshr i32 %mul9.i.i.246, 16
  %shl20.i.i.249 = shl i32 %mul9.i.i.246, 16
  %sub.i.i.250 = sub i32 %aSig1.2, %shl20.i.i.249
  %cmp.i.39.i.251 = icmp ult i32 %aSig1.2, %shl20.i.i.249
  %conv.neg.i.i.252 = sext i1 %cmp.i.39.i.251 to i32
  %add24.i.neg.i.253 = sub i32 %aSig0.3, %mul15.i.i.247
  %sub1.i.i.254 = sub i32 %add24.i.neg.i.253, %shr17.i.i.248
  %sub2.i.i.255 = add i32 %sub1.i.i.254, %conv.neg.i.i.252
  %cmp3.45.i.256 = icmp slt i32 %sub2.i.i.255, 0
  br i1 %cmp3.45.i.256, label %while.body.lr.ph.i.259, label %while.end.i.278

while.body.lr.ph.i.259:                           ; preds = %cond.end.i.257
  %shl4.i.258 = shl i32 %or.i.294, 16
  br label %while.body.i.270

while.body.i.270:                                 ; preds = %while.body.i.270, %while.body.lr.ph.i.259
  %z.048.i.260 = phi i32 [ %cond.i.243, %while.body.lr.ph.i.259 ], [ %sub.i.263, %while.body.i.270 ]
  %rem0.047.i.261 = phi i32 [ %sub2.i.i.255, %while.body.lr.ph.i.259 ], [ %add2.i.i.268, %while.body.i.270 ]
  %rem1.046.i.262 = phi i32 [ %sub.i.i.250, %while.body.lr.ph.i.259 ], [ %add.i.37.i.264, %while.body.i.270 ]
  %sub.i.263 = add i32 %z.048.i.260, -65536
  %add.i.37.i.264 = add i32 %rem1.046.i.262, %shl4.i.258
  %add1.i.i.265 = add i32 %rem0.047.i.261, %shr.i.236
  %cmp.i.38.i.266 = icmp ult i32 %add.i.37.i.264, %rem1.046.i.262
  %conv.i.i.267 = zext i1 %cmp.i.38.i.266 to i32
  %add2.i.i.268 = add i32 %add1.i.i.265, %conv.i.i.267
  %cmp3.i.269 = icmp slt i32 %add2.i.i.268, 0
  br i1 %cmp3.i.269, label %while.body.i.270, label %while.end.i.278.loopexit

while.end.i.278.loopexit:                         ; preds = %while.body.i.270
  %add2.i.i.268.lcssa = phi i32 [ %add2.i.i.268, %while.body.i.270 ]
  %add.i.37.i.264.lcssa = phi i32 [ %add.i.37.i.264, %while.body.i.270 ]
  %sub.i.263.lcssa = phi i32 [ %sub.i.263, %while.body.i.270 ]
  br label %while.end.i.278

while.end.i.278:                                  ; preds = %while.end.i.278.loopexit, %cond.end.i.257
  %z.0.lcssa.i.271 = phi i32 [ %cond.i.243, %cond.end.i.257 ], [ %sub.i.263.lcssa, %while.end.i.278.loopexit ]
  %rem0.0.lcssa.i.272 = phi i32 [ %sub2.i.i.255, %cond.end.i.257 ], [ %add2.i.i.268.lcssa, %while.end.i.278.loopexit ]
  %rem1.0.lcssa.i.273 = phi i32 [ %sub.i.i.250, %cond.end.i.257 ], [ %add.i.37.i.264.lcssa, %while.end.i.278.loopexit ]
  %shl5.i.274 = shl i32 %rem0.0.lcssa.i.272, 16
  %shr6.i.275 = lshr i32 %rem1.0.lcssa.i.273, 16
  %or.i.276 = or i32 %shr6.i.275, %shl5.i.274
  %cmp8.i.277 = icmp ugt i32 %shl.i.237, %or.i.276
  br i1 %cmp8.i.277, label %cond.false.10.i.280, label %cond.end.12.i.283

cond.false.10.i.280:                              ; preds = %while.end.i.278
  %div11.i.279 = udiv i32 %or.i.276, %shr.i.236
  br label %cond.end.12.i.283

cond.end.12.i.283:                                ; preds = %cond.false.10.i.280, %while.end.i.278
  %cond13.i.281 = phi i32 [ %div11.i.279, %cond.false.10.i.280 ], [ 65535, %while.end.i.278 ]
  %or14.i.282 = or i32 %cond13.i.281, %z.0.lcssa.i.271
  br label %estimateDiv64To32.exit285

estimateDiv64To32.exit285:                        ; preds = %if.end.81.estimateDiv64To32.exit285_crit_edge, %cond.end.12.i.283
  %conv5.i.6.i.212.pre-phi = phi i32 [ %.pre589, %if.end.81.estimateDiv64To32.exit285_crit_edge ], [ %conv5.i.i.245, %cond.end.12.i.283 ]
  %retval.0.i.284 = phi i32 [ -1, %if.end.81.estimateDiv64To32.exit285_crit_edge ], [ %or14.i.282, %cond.end.12.i.283 ]
  %22 = lshr i32 %bSig1.1, 5
  %shr.i.i.193 = and i32 %22, 65535
  %shr3.i.i.194 = lshr i32 %retval.0.i.284, 16
  %conv5.i.i.195 = and i32 %shl.i.292, 63488
  %conv6.i.i.196 = and i32 %retval.0.i.284, 65535
  %mul.i.i.197 = mul nuw i32 %conv6.i.i.196, %conv5.i.i.195
  %mul9.i.i.198 = mul nuw i32 %shr3.i.i.194, %conv5.i.i.195
  %mul12.i.i.199 = mul nuw i32 %conv6.i.i.196, %shr.i.i.193
  %mul15.i.i.200 = mul nuw i32 %shr3.i.i.194, %shr.i.i.193
  %add.i.i.201 = add i32 %mul9.i.i.198, %mul12.i.i.199
  %cmp.i.i.202 = icmp ult i32 %add.i.i.201, %mul12.i.i.199
  %conv16.i.i.203 = zext i1 %cmp.i.i.202 to i32
  %shl.i.i.204 = shl nuw nsw i32 %conv16.i.i.203, 16
  %shr17.i.i.205 = lshr i32 %add.i.i.201, 16
  %add18.i.i.206 = or i32 %shl.i.i.204, %shr17.i.i.205
  %shl20.i.i.207 = shl i32 %add.i.i.201, 16
  %add21.i.i.208 = add i32 %shl20.i.i.207, %mul.i.i.197
  %cmp22.i.i.209 = icmp ult i32 %add21.i.i.208, %shl20.i.i.207
  %conv23.i.i.210 = zext i1 %cmp22.i.i.209 to i32
  %mul.i.8.i.213 = mul nuw i32 %conv6.i.i.196, %conv5.i.6.i.212.pre-phi
  %mul9.i.9.i.214 = mul nuw i32 %shr3.i.i.194, %conv5.i.6.i.212.pre-phi
  %mul12.i.10.i.215 = mul nuw i32 %conv6.i.i.196, %shr.i.236
  %mul15.i.11.i.216 = mul nuw i32 %shr3.i.i.194, %shr.i.236
  %add.i.12.i.217 = add i32 %mul9.i.9.i.214, %mul12.i.10.i.215
  %cmp.i.13.i.218 = icmp ult i32 %add.i.12.i.217, %mul12.i.10.i.215
  %conv16.i.14.i.219 = zext i1 %cmp.i.13.i.218 to i32
  %shl.i.15.i.220 = shl nuw nsw i32 %conv16.i.14.i.219, 16
  %shr17.i.16.i.221 = lshr i32 %add.i.12.i.217, 16
  %add18.i.17.i.222 = or i32 %shl.i.15.i.220, %shr17.i.16.i.221
  %shl20.i.19.i.224 = shl i32 %add.i.12.i.217, 16
  %add21.i.20.i.225 = add i32 %shl20.i.19.i.224, %mul.i.8.i.213
  %cmp22.i.21.i.226 = icmp ult i32 %add21.i.20.i.225, %shl20.i.19.i.224
  %add19.i.i.229 = add i32 %add21.i.20.i.225, %mul15.i.i.200
  %add24.i.i.230 = add i32 %add19.i.i.229, %add18.i.i.206
  %add.i.2.i.231 = add i32 %add24.i.i.230, %conv23.i.i.210
  %cmp.i.3.i.232 = icmp ult i32 %add.i.2.i.231, %add21.i.20.i.225
  %sub.i.181 = sub i32 0, %add21.i.i.208
  %cmp.i.182 = icmp ne i32 %add21.i.i.208, 0
  %conv.i.183 = zext i1 %cmp.i.182 to i32
  %sub1.i.184 = sub i32 %aSig1.2, %add.i.2.i.231
  %cmp2.i.185 = icmp ult i32 %aSig1.2, %add.i.2.i.231
  %conv23.i.22.i.227.neg = sext i1 %cmp22.i.21.i.226 to i32
  %conv.i.i.233.neg = sext i1 %cmp.i.3.i.232 to i32
  %cmp5.i.187 = icmp ult i32 %sub1.i.184, %conv.i.183
  %conv6.neg.i.188 = sext i1 %cmp5.i.187 to i32
  %sub8.i.189 = sub i32 %sub1.i.184, %conv.i.183
  %conv3.neg.i.190 = sext i1 %cmp2.i.185 to i32
  %add19.i.18.i.223.neg = sub i32 %aSig0.3, %mul15.i.11.i.216
  %add24.i.23.i.228.neg = sub i32 %add19.i.18.i.223.neg, %add18.i.17.i.222
  %add2.i.i.234.neg = add i32 %add24.i.23.i.228.neg, %conv23.i.22.i.227.neg
  %sub4.i.186 = add i32 %add2.i.i.234.neg, %conv.i.i.233.neg
  %sub7.i.191 = add i32 %sub4.i.186, %conv3.neg.i.190
  %sub9.i.192 = add i32 %sub7.i.191, %conv6.neg.i.188
  %cmp83.581 = icmp slt i32 %sub9.i.192, 0
  br i1 %cmp83.581, label %while.body.preheader, label %while.end

while.body.preheader:                             ; preds = %estimateDiv64To32.exit285
  br label %while.body

while.body:                                       ; preds = %while.body.preheader, %while.body
  %rem2.0585 = phi i32 [ %add.i.170, %while.body ], [ %sub.i.181, %while.body.preheader ]
  %rem1.0584 = phi i32 [ %add5.i.176, %while.body ], [ %sub8.i.189, %while.body.preheader ]
  %rem0.0583 = phi i32 [ %add9.i.180, %while.body ], [ %sub9.i.192, %while.body.preheader ]
  %zSig0.0582 = phi i32 [ %dec, %while.body ], [ %retval.0.i.284, %while.body.preheader ]
  %dec = add i32 %zSig0.0582, -1
  %add.i.170 = add i32 %rem2.0585, %shl.i.292
  %cmp.i.171 = icmp ult i32 %add.i.170, %rem2.0585
  %conv.i.172 = zext i1 %cmp.i.171 to i32
  %add1.i.173 = add i32 %rem1.0584, %or.i.294
  %cmp2.i.174 = icmp ult i32 %add1.i.173, %rem1.0584
  %conv3.i.175 = zext i1 %cmp2.i.174 to i32
  %add5.i.176 = add i32 %conv.i.172, %add1.i.173
  %cmp6.i.177 = icmp ult i32 %add5.i.176, %conv.i.172
  %conv7.i.178 = zext i1 %cmp6.i.177 to i32
  %add8.i.179 = add i32 %conv3.i.175, %rem0.0583
  %add9.i.180 = add i32 %add8.i.179, %conv7.i.178
  %cmp83 = icmp slt i32 %add9.i.180, 0
  br i1 %cmp83, label %while.body, label %while.end.loopexit

while.end.loopexit:                               ; preds = %while.body
  %add5.i.176.lcssa = phi i32 [ %add5.i.176, %while.body ]
  %add.i.170.lcssa = phi i32 [ %add.i.170, %while.body ]
  %dec.lcssa = phi i32 [ %dec, %while.body ]
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %estimateDiv64To32.exit285
  %rem2.0.lcssa = phi i32 [ %sub.i.181, %estimateDiv64To32.exit285 ], [ %add.i.170.lcssa, %while.end.loopexit ]
  %rem1.0.lcssa = phi i32 [ %sub8.i.189, %estimateDiv64To32.exit285 ], [ %add5.i.176.lcssa, %while.end.loopexit ]
  %zSig0.0.lcssa = phi i32 [ %retval.0.i.284, %estimateDiv64To32.exit285 ], [ %dec.lcssa, %while.end.loopexit ]
  %cmp.i.157 = icmp ugt i32 %or.i.294, %rem1.0.lcssa
  br i1 %cmp.i.157, label %if.end.i, label %if.end.96

if.end.i:                                         ; preds = %while.end
  %shl.i.159 = shl nuw i32 %shr.i.236, 16
  %cmp1.i = icmp ugt i32 %shl.i.159, %rem1.0.lcssa
  br i1 %cmp1.i, label %cond.false.i, label %cond.end.i

cond.false.i:                                     ; preds = %if.end.i
  %div.i = udiv i32 %rem1.0.lcssa, %shr.i.236
  %shl2.i = shl i32 %div.i, 16
  br label %cond.end.i

cond.end.i:                                       ; preds = %cond.false.i, %if.end.i
  %cond.i = phi i32 [ %shl2.i, %cond.false.i ], [ -65536, %if.end.i ]
  %shr3.i.i.160 = lshr exact i32 %cond.i, 16
  %mul9.i.i.162 = mul nuw i32 %shr3.i.i.160, %conv5.i.6.i.212.pre-phi
  %mul15.i.i.163 = mul nuw i32 %shr3.i.i.160, %shr.i.236
  %shr17.i.i.164 = lshr i32 %mul9.i.i.162, 16
  %shl20.i.i.165 = shl i32 %mul9.i.i.162, 16
  %sub.i.i = sub i32 %rem2.0.lcssa, %shl20.i.i.165
  %cmp.i.39.i = icmp ult i32 %rem2.0.lcssa, %shl20.i.i.165
  %conv.neg.i.i = sext i1 %cmp.i.39.i to i32
  %add24.i.neg.i = sub i32 %rem1.0.lcssa, %mul15.i.i.163
  %sub1.i.i = sub i32 %add24.i.neg.i, %shr17.i.i.164
  %sub2.i.i = add i32 %sub1.i.i, %conv.neg.i.i
  %cmp3.45.i = icmp slt i32 %sub2.i.i, 0
  br i1 %cmp3.45.i, label %while.body.lr.ph.i, label %while.end.i

while.body.lr.ph.i:                               ; preds = %cond.end.i
  %shl4.i = shl i32 %or.i.294, 16
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i, %while.body.lr.ph.i
  %z.048.i = phi i32 [ %cond.i, %while.body.lr.ph.i ], [ %sub.i.166, %while.body.i ]
  %rem0.047.i = phi i32 [ %sub2.i.i, %while.body.lr.ph.i ], [ %add2.i.i.168, %while.body.i ]
  %rem1.046.i = phi i32 [ %sub.i.i, %while.body.lr.ph.i ], [ %add.i.37.i, %while.body.i ]
  %sub.i.166 = add i32 %z.048.i, -65536
  %add.i.37.i = add i32 %rem1.046.i, %shl4.i
  %add1.i.i = add i32 %rem0.047.i, %shr.i.236
  %cmp.i.38.i = icmp ult i32 %add.i.37.i, %rem1.046.i
  %conv.i.i.167 = zext i1 %cmp.i.38.i to i32
  %add2.i.i.168 = add i32 %add1.i.i, %conv.i.i.167
  %cmp3.i = icmp slt i32 %add2.i.i.168, 0
  br i1 %cmp3.i, label %while.body.i, label %while.end.i.loopexit

while.end.i.loopexit:                             ; preds = %while.body.i
  %add2.i.i.168.lcssa = phi i32 [ %add2.i.i.168, %while.body.i ]
  %add.i.37.i.lcssa = phi i32 [ %add.i.37.i, %while.body.i ]
  %sub.i.166.lcssa = phi i32 [ %sub.i.166, %while.body.i ]
  br label %while.end.i

while.end.i:                                      ; preds = %while.end.i.loopexit, %cond.end.i
  %z.0.lcssa.i = phi i32 [ %cond.i, %cond.end.i ], [ %sub.i.166.lcssa, %while.end.i.loopexit ]
  %rem0.0.lcssa.i = phi i32 [ %sub2.i.i, %cond.end.i ], [ %add2.i.i.168.lcssa, %while.end.i.loopexit ]
  %rem1.0.lcssa.i = phi i32 [ %sub.i.i, %cond.end.i ], [ %add.i.37.i.lcssa, %while.end.i.loopexit ]
  %shl5.i = shl i32 %rem0.0.lcssa.i, 16
  %shr6.i = lshr i32 %rem1.0.lcssa.i, 16
  %or.i.169 = or i32 %shr6.i, %shl5.i
  %cmp8.i = icmp ugt i32 %shl.i.159, %or.i.169
  br i1 %cmp8.i, label %cond.false.10.i, label %estimateDiv64To32.exit

cond.false.10.i:                                  ; preds = %while.end.i
  %div11.i = udiv i32 %or.i.169, %shr.i.236
  br label %estimateDiv64To32.exit

estimateDiv64To32.exit:                           ; preds = %while.end.i, %cond.false.10.i
  %cond13.i = phi i32 [ %div11.i, %cond.false.10.i ], [ 65535, %while.end.i ]
  %or14.i = or i32 %cond13.i, %z.0.lcssa.i
  %and = and i32 %or14.i, 1023
  %cmp85 = icmp ult i32 %and, 5
  br i1 %cmp85, label %if.then.86, label %if.end.96

if.then.86:                                       ; preds = %estimateDiv64To32.exit
  %shr3.i.i = lshr i32 %or14.i, 16
  %conv6.i.i = and i32 %or14.i, 65535
  %mul.i.i = mul nuw i32 %conv6.i.i, %conv5.i.i.195
  %mul9.i.i = mul nuw i32 %shr3.i.i, %conv5.i.i.195
  %mul12.i.i = mul nuw i32 %conv6.i.i, %shr.i.i.193
  %mul15.i.i = mul nuw i32 %shr3.i.i, %shr.i.i.193
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
  %mul.i.8.i = mul nuw i32 %conv6.i.i, %conv5.i.6.i.212.pre-phi
  %mul9.i.9.i = mul nuw i32 %shr3.i.i, %conv5.i.6.i.212.pre-phi
  %mul12.i.10.i = mul nuw i32 %conv6.i.i, %shr.i.236
  %mul15.i.11.i = mul nuw i32 %shr3.i.i, %shr.i.236
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
  %cmp.i.154 = icmp ne i32 %add21.i.i, 0
  %conv.i.155 = zext i1 %cmp.i.154 to i32
  %sub1.i = sub i32 %rem2.0.lcssa, %add.i.2.i
  %cmp2.i.156 = icmp ult i32 %rem2.0.lcssa, %add.i.2.i
  %conv23.i.22.i.neg = sext i1 %cmp22.i.21.i to i32
  %conv.i.i.neg = sext i1 %cmp.i.3.i to i32
  %cmp5.i = icmp ult i32 %sub1.i, %conv.i.155
  %conv6.neg.i = sext i1 %cmp5.i to i32
  %sub8.i = sub i32 %sub1.i, %conv.i.155
  %conv3.neg.i = sext i1 %cmp2.i.156 to i32
  %add19.i.18.i.neg = sub i32 %rem1.0.lcssa, %mul15.i.11.i
  %add24.i.23.i.neg = sub i32 %add19.i.18.i.neg, %add18.i.17.i
  %add2.i.i.neg = add i32 %add24.i.23.i.neg, %conv23.i.22.i.neg
  %sub4.i = add i32 %add2.i.i.neg, %conv.i.i.neg
  %sub7.i = add i32 %sub4.i, %conv3.neg.i
  %sub9.i = add i32 %sub7.i, %conv6.neg.i
  %cmp88.573 = icmp slt i32 %sub9.i, 0
  br i1 %cmp88.573, label %while.body.89.preheader, label %while.end.91

while.body.89.preheader:                          ; preds = %if.then.86
  br label %while.body.89

while.body.89:                                    ; preds = %while.body.89.preheader, %while.body.89
  %rem3.0577 = phi i32 [ %add.i, %while.body.89 ], [ %sub.i, %while.body.89.preheader ]
  %rem2.1576 = phi i32 [ %add5.i, %while.body.89 ], [ %sub8.i, %while.body.89.preheader ]
  %rem1.1575 = phi i32 [ %add9.i, %while.body.89 ], [ %sub9.i, %while.body.89.preheader ]
  %zSig1.0574 = phi i32 [ %dec90, %while.body.89 ], [ %or14.i, %while.body.89.preheader ]
  %dec90 = add i32 %zSig1.0574, -1
  %add.i = add i32 %rem3.0577, %shl.i.292
  %cmp.i = icmp ult i32 %add.i, %rem3.0577
  %conv.i = zext i1 %cmp.i to i32
  %add1.i = add i32 %rem2.1576, %or.i.294
  %cmp2.i = icmp ult i32 %add1.i, %rem2.1576
  %conv3.i = zext i1 %cmp2.i to i32
  %add5.i = add i32 %conv.i, %add1.i
  %cmp6.i = icmp ult i32 %add5.i, %conv.i
  %conv7.i = zext i1 %cmp6.i to i32
  %add8.i = add i32 %conv3.i, %rem1.1575
  %add9.i = add i32 %add8.i, %conv7.i
  %cmp88 = icmp slt i32 %add9.i, 0
  br i1 %cmp88, label %while.body.89, label %while.end.91.loopexit

while.end.91.loopexit:                            ; preds = %while.body.89
  %add9.i.lcssa = phi i32 [ %add9.i, %while.body.89 ]
  %add5.i.lcssa = phi i32 [ %add5.i, %while.body.89 ]
  %add.i.lcssa = phi i32 [ %add.i, %while.body.89 ]
  %dec90.lcssa = phi i32 [ %dec90, %while.body.89 ]
  br label %while.end.91

while.end.91:                                     ; preds = %while.end.91.loopexit, %if.then.86
  %rem3.0.lcssa = phi i32 [ %sub.i, %if.then.86 ], [ %add.i.lcssa, %while.end.91.loopexit ]
  %rem2.1.lcssa = phi i32 [ %sub8.i, %if.then.86 ], [ %add5.i.lcssa, %while.end.91.loopexit ]
  %rem1.1.lcssa = phi i32 [ %sub9.i, %if.then.86 ], [ %add9.i.lcssa, %while.end.91.loopexit ]
  %zSig1.0.lcssa = phi i32 [ %or14.i, %if.then.86 ], [ %dec90.lcssa, %while.end.91.loopexit ]
  %or92 = or i32 %rem2.1.lcssa, %rem1.1.lcssa
  %or93 = or i32 %or92, %rem3.0.lcssa
  %cmp94 = icmp ne i32 %or93, 0
  %conv = zext i1 %cmp94 to i32
  %or95 = or i32 %conv, %zSig1.0.lcssa
  br label %if.end.96

if.end.96:                                        ; preds = %while.end, %while.end.91, %estimateDiv64To32.exit
  %zSig1.1 = phi i32 [ %or95, %while.end.91 ], [ %or14.i, %estimateDiv64To32.exit ], [ -1, %while.end ]
  %shl.i = shl i32 %zSig1.1, 21
  %shl3.i = shl i32 %zSig0.0.lcssa, 21
  %shr.i = lshr i32 %zSig1.1, 11
  %or.i = or i32 %shr.i, %shl3.i
  %shr4.i = lshr i32 %zSig0.0.lcssa, 11
  tail call fastcc void @roundAndPackFloat64(%struct.float64* noalias %agg.result, i32 %xor, i32 %zExp.0, i32 %shr4.i, i32 %or.i, i32 %shl.i)
  br label %cleanup

cleanup:                                          ; preds = %cond.false.25.i, %cond.true.24.i, %cond.true.21.i, %cond.true.i, %cond.false.25.i.441, %cond.true.24.i.439, %cond.true.21.i.436, %cond.true.i.432, %cond.false.25.i.491, %cond.true.24.i.489, %cond.true.21.i.486, %cond.true.i.482, %if.end.96, %if.then.73, %if.end.66, %invalid, %if.end.53, %if.end.42
  ret void
}

; Function Attrs: nounwind
define void @float64_rem(%struct.float64* noalias sret %agg.result, i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #2 {
entry:
  %and.i = and i32 %a.0, 1048575
  %shr.i.518 = lshr i32 %a.0, 20
  %and.i.519 = and i32 %shr.i.518, 2047
  %shr.i.517 = lshr i32 %a.0, 31
  %and.i.516 = and i32 %b.0, 1048575
  %shr.i.514 = lshr i32 %b.0, 20
  %and.i.515 = and i32 %shr.i.514, 2047
  %cmp = icmp eq i32 %and.i.519, 2047
  br i1 %cmp, label %if.then, label %if.end.35

if.then:                                          ; preds = %entry
  %or = or i32 %and.i, %a.1
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then.30

lor.lhs.false:                                    ; preds = %if.then
  %cmp27 = icmp ne i32 %and.i.515, 2047
  %or28 = or i32 %and.i.516, %b.1
  %tobool29 = icmp eq i32 %or28, 0
  %or.cond596 = or i1 %cmp27, %tobool29
  br i1 %or.cond596, label %invalid, label %if.then.30

if.then.30:                                       ; preds = %lor.lhs.false, %if.then
  %and.i.56.i.464 = and i32 %a.0, 2146959360
  %cmp.i.57.i.465 = icmp eq i32 %and.i.56.i.464, 2146435072
  br i1 %cmp.i.57.i.465, label %land.rhs.i.59.i.467, label %float64_is_signaling_nan.exit64.i.473

land.rhs.i.59.i.467:                              ; preds = %if.then.30
  %tobool.i.58.i.466 = icmp eq i32 %a.1, 0
  br i1 %tobool.i.58.i.466, label %lor.rhs.i.62.i.470, label %float64_is_signaling_nan.exit64.i.473

lor.rhs.i.62.i.470:                               ; preds = %land.rhs.i.59.i.467
  %and4.i.60.i.468 = and i32 %a.0, 524287
  %tobool5.i.61.i.469 = icmp ne i32 %and4.i.60.i.468, 0
  br label %float64_is_signaling_nan.exit64.i.473

float64_is_signaling_nan.exit64.i.473:            ; preds = %lor.rhs.i.62.i.470, %land.rhs.i.59.i.467, %if.then.30
  %0 = phi i1 [ false, %if.then.30 ], [ true, %land.rhs.i.59.i.467 ], [ %tobool5.i.61.i.469, %lor.rhs.i.62.i.470 ]
  %shl.i.i.471 = shl i32 %b.0, 1
  %cmp.i.50.i.472 = icmp ugt i32 %shl.i.i.471, -2097153
  %1 = or i32 %and.i.516, %b.1
  %2 = icmp ne i32 %1, 0
  %3 = and i1 %cmp.i.50.i.472, %2
  %and.i.i.479 = and i32 %b.0, 2146959360
  %cmp.i.i.480 = icmp eq i32 %and.i.i.479, 2146435072
  br i1 %cmp.i.i.480, label %land.rhs.i.i.483, label %float64_is_signaling_nan.exit.i.494

land.rhs.i.i.483:                                 ; preds = %float64_is_signaling_nan.exit64.i.473
  %tobool.i.i.482 = icmp eq i32 %b.1, 0
  br i1 %tobool.i.i.482, label %lor.rhs.i.i.490, label %if.then.thread.i.487

if.then.thread.i.487:                             ; preds = %land.rhs.i.i.483
  %or17.67.i.484 = or i32 %b.0, 524288
  %4 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !130
  %or.i.79.i.485 = or i32 %4, 16
  store i32 %or.i.79.i.485, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !130
  %b.sroa.0.0..sroa_idx.73.80.i.486 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.true.i.503

lor.rhs.i.i.490:                                  ; preds = %land.rhs.i.i.483
  %and4.i.i.488 = and i32 %b.0, 524287
  %tobool5.i.i.489 = icmp ne i32 %and4.i.i.488, 0
  br label %float64_is_signaling_nan.exit.i.494

float64_is_signaling_nan.exit.i.494:              ; preds = %lor.rhs.i.i.490, %float64_is_signaling_nan.exit64.i.473
  %5 = phi i1 [ false, %float64_is_signaling_nan.exit64.i.473 ], [ %tobool5.i.i.489, %lor.rhs.i.i.490 ]
  %or.i.491 = or i32 %a.0, 524288
  %or17.i.492 = or i32 %b.0, 524288
  %or1865.i.493 = or i1 %0, %5
  br i1 %or1865.i.493, label %if.then.i.497, label %if.end.i.499

if.then.i.497:                                    ; preds = %float64_is_signaling_nan.exit.i.494
  %6 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !130
  %or.i.i.495 = or i32 %6, 16
  store i32 %or.i.i.495, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !130
  %b.sroa.0.0..sroa_idx.73.i.496 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br i1 %5, label %cond.true.i.503, label %cond.false.i.505

if.end.i.499:                                     ; preds = %float64_is_signaling_nan.exit.i.494
  %b.sroa.0.0..sroa_idx.i.498 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.false.i.505

cond.true.i.503:                                  ; preds = %if.then.i.497, %if.then.thread.i.487
  %b.sroa.0.0..sroa_idx77.i.500 = phi i32* [ %b.sroa.0.0..sroa_idx.73.i.496, %if.then.i.497 ], [ %b.sroa.0.0..sroa_idx.73.80.i.486, %if.then.thread.i.487 ]
  %or177174.i.501 = phi i32 [ %or17.i.492, %if.then.i.497 ], [ %or17.67.i.484, %if.then.thread.i.487 ]
  store i32 %or177174.i.501, i32* %b.sroa.0.0..sroa_idx77.i.500, align 4, !alias.scope !130
  %b.sroa.7.0..sroa_idx38.i.502 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %b.1, i32* %b.sroa.7.0..sroa_idx38.i.502, align 4, !alias.scope !130
  br label %cleanup

cond.false.i.505:                                 ; preds = %if.end.i.499, %if.then.i.497
  %b.sroa.0.0..sroa_idx78.i.504 = phi i32* [ %b.sroa.0.0..sroa_idx.73.i.496, %if.then.i.497 ], [ %b.sroa.0.0..sroa_idx.i.498, %if.end.i.499 ]
  br i1 %0, label %cond.true.21.i.507, label %cond.false.22.i.508

cond.true.21.i.507:                               ; preds = %cond.false.i.505
  store i32 %or.i.491, i32* %b.sroa.0.0..sroa_idx78.i.504, align 4, !alias.scope !130
  %a.sroa.7.0..sroa_idx46.i.506 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.7.0..sroa_idx46.i.506, align 4, !alias.scope !130
  br label %cleanup

cond.false.22.i.508:                              ; preds = %cond.false.i.505
  br i1 %3, label %cond.true.24.i.510, label %cond.false.25.i.512

cond.true.24.i.510:                               ; preds = %cond.false.22.i.508
  store i32 %or17.i.492, i32* %b.sroa.0.0..sroa_idx78.i.504, align 4, !alias.scope !130
  %b.sroa.7.0..sroa_idx39.i.509 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %b.1, i32* %b.sroa.7.0..sroa_idx39.i.509, align 4, !alias.scope !130
  br label %cleanup

cond.false.25.i.512:                              ; preds = %cond.false.22.i.508
  store i32 %or.i.491, i32* %b.sroa.0.0..sroa_idx78.i.504, align 4, !alias.scope !130
  %a.sroa.7.0..sroa_idx47.i.511 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.7.0..sroa_idx47.i.511, align 4, !alias.scope !130
  br label %cleanup

if.end.35:                                        ; preds = %entry
  switch i32 %and.i.515, label %if.end.55 [
    i32 2047, label %if.then.37
    i32 0, label %if.then.48
  ]

if.then.37:                                       ; preds = %if.end.35
  %or38 = or i32 %and.i.516, %b.1
  %tobool39 = icmp eq i32 %or38, 0
  br i1 %tobool39, label %if.end.45, label %if.then.40

if.then.40:                                       ; preds = %if.then.37
  %and.i.56.i = and i32 %a.0, 2146959360
  %cmp.i.57.i = icmp eq i32 %and.i.56.i, 2146435072
  br i1 %cmp.i.57.i, label %land.rhs.i.59.i, label %float64_is_signaling_nan.exit64.i

land.rhs.i.59.i:                                  ; preds = %if.then.40
  %tobool.i.58.i = icmp eq i32 %a.1, 0
  br i1 %tobool.i.58.i, label %lor.rhs.i.62.i, label %float64_is_signaling_nan.exit64.i

lor.rhs.i.62.i:                                   ; preds = %land.rhs.i.59.i
  %and4.i.60.i = and i32 %a.0, 524287
  %tobool5.i.61.i = icmp ne i32 %and4.i.60.i, 0
  br label %float64_is_signaling_nan.exit64.i

float64_is_signaling_nan.exit64.i:                ; preds = %lor.rhs.i.62.i, %land.rhs.i.59.i, %if.then.40
  %7 = phi i1 [ false, %if.then.40 ], [ true, %land.rhs.i.59.i ], [ %tobool5.i.61.i, %lor.rhs.i.62.i ]
  %shl.i.i.456 = shl i32 %b.0, 1
  %cmp.i.50.i = icmp ugt i32 %shl.i.i.456, -2097153
  %and.i.i.457 = and i32 %b.0, 2146959360
  %cmp.i.i.458 = icmp eq i32 %and.i.i.457, 2146435072
  br i1 %cmp.i.i.458, label %land.rhs.i.i, label %float64_is_signaling_nan.exit.i

land.rhs.i.i:                                     ; preds = %float64_is_signaling_nan.exit64.i
  %tobool.i.i = icmp eq i32 %b.1, 0
  br i1 %tobool.i.i, label %lor.rhs.i.i, label %if.then.thread.i

if.then.thread.i:                                 ; preds = %land.rhs.i.i
  %or17.67.i = or i32 %b.0, 524288
  %8 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !133
  %or.i.79.i = or i32 %8, 16
  store i32 %or.i.79.i, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !133
  %b.sroa.0.0..sroa_idx.73.80.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.true.i

lor.rhs.i.i:                                      ; preds = %land.rhs.i.i
  %and4.i.i = and i32 %b.0, 524287
  %tobool5.i.i = icmp ne i32 %and4.i.i, 0
  br label %float64_is_signaling_nan.exit.i

float64_is_signaling_nan.exit.i:                  ; preds = %lor.rhs.i.i, %float64_is_signaling_nan.exit64.i
  %9 = phi i1 [ false, %float64_is_signaling_nan.exit64.i ], [ %tobool5.i.i, %lor.rhs.i.i ]
  %or.i.459 = or i32 %a.0, 524288
  %or17.i = or i32 %b.0, 524288
  %or1865.i = or i1 %7, %9
  br i1 %or1865.i, label %if.then.i.461, label %if.end.i.462

if.then.i.461:                                    ; preds = %float64_is_signaling_nan.exit.i
  %10 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !133
  %or.i.i.460 = or i32 %10, 16
  store i32 %or.i.i.460, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !133
  %b.sroa.0.0..sroa_idx.73.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br i1 %9, label %cond.true.i, label %cond.false.i.463

if.end.i.462:                                     ; preds = %float64_is_signaling_nan.exit.i
  %b.sroa.0.0..sroa_idx.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.false.i.463

cond.true.i:                                      ; preds = %if.then.i.461, %if.then.thread.i
  %b.sroa.0.0..sroa_idx77.i = phi i32* [ %b.sroa.0.0..sroa_idx.73.i, %if.then.i.461 ], [ %b.sroa.0.0..sroa_idx.73.80.i, %if.then.thread.i ]
  %or177174.i = phi i32 [ %or17.i, %if.then.i.461 ], [ %or17.67.i, %if.then.thread.i ]
  store i32 %or177174.i, i32* %b.sroa.0.0..sroa_idx77.i, align 4, !alias.scope !133
  %b.sroa.7.0..sroa_idx38.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %b.1, i32* %b.sroa.7.0..sroa_idx38.i, align 4, !alias.scope !133
  br label %cleanup

cond.false.i.463:                                 ; preds = %if.end.i.462, %if.then.i.461
  %b.sroa.0.0..sroa_idx78.i = phi i32* [ %b.sroa.0.0..sroa_idx.73.i, %if.then.i.461 ], [ %b.sroa.0.0..sroa_idx.i, %if.end.i.462 ]
  br i1 %7, label %cond.true.21.i, label %cond.false.22.i

cond.true.21.i:                                   ; preds = %cond.false.i.463
  store i32 %or.i.459, i32* %b.sroa.0.0..sroa_idx78.i, align 4, !alias.scope !133
  %a.sroa.7.0..sroa_idx46.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.7.0..sroa_idx46.i, align 4, !alias.scope !133
  br label %cleanup

cond.false.22.i:                                  ; preds = %cond.false.i.463
  br i1 %cmp.i.50.i, label %cond.true.24.i, label %cond.false.25.i

cond.true.24.i:                                   ; preds = %cond.false.22.i
  store i32 %or17.i, i32* %b.sroa.0.0..sroa_idx78.i, align 4, !alias.scope !133
  %b.sroa.7.0..sroa_idx39.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %b.1, i32* %b.sroa.7.0..sroa_idx39.i, align 4, !alias.scope !133
  br label %cleanup

cond.false.25.i:                                  ; preds = %cond.false.22.i
  store i32 %or.i.459, i32* %b.sroa.0.0..sroa_idx78.i, align 4, !alias.scope !133
  %a.sroa.7.0..sroa_idx47.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.7.0..sroa_idx47.i, align 4, !alias.scope !133
  br label %cleanup

if.end.45:                                        ; preds = %if.then.37
  %a.sroa.0.0..sroa_idx184 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %a.0, i32* %a.sroa.0.0..sroa_idx184, align 4
  %a.sroa.10.0..sroa_idx189 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.10.0..sroa_idx189, align 4
  br label %cleanup

if.then.48:                                       ; preds = %if.end.35
  %or49 = or i32 %and.i.516, %b.1
  %cmp50 = icmp eq i32 %or49, 0
  br i1 %cmp50, label %invalid, label %if.end.54

invalid:                                          ; preds = %lor.lhs.false, %if.then.48
  %11 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.455 = or i32 %11, 16
  store i32 %or.i.455, i32* @float_exception_flags, align 4, !tbaa !1
  %z.sroa.0.0..sroa_idx = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 2147483647, i32* %z.sroa.0.0..sroa_idx, align 4
  %z.sroa.4.0..sroa_idx139 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 -1, i32* %z.sroa.4.0..sroa_idx139, align 4
  br label %cleanup

if.end.54:                                        ; preds = %if.then.48
  %cmp.i.402 = icmp eq i32 %and.i.516, 0
  br i1 %cmp.i.402, label %if.then.i.417, label %if.else.7.i.443

if.then.i.417:                                    ; preds = %if.end.54
  %cmp.i.i.403 = icmp ult i32 %b.1, 65536
  %shl.i.i.404 = shl i32 %b.1, 16
  %shl.a.i.i.405 = select i1 %cmp.i.i.403, i32 %shl.i.i.404, i32 %b.1
  %..i.i.406 = select i1 %cmp.i.i.403, i32 16, i32 0
  %cmp1.i.i.407 = icmp ult i32 %shl.a.i.i.405, 16777216
  %add3.i.i.408 = or i32 %..i.i.406, 8
  %shl4.i.i.409 = shl i32 %shl.a.i.i.405, 8
  %a.addr.1.i.i.410 = select i1 %cmp1.i.i.407, i32 %shl4.i.i.409, i32 %shl.a.i.i.405
  %shiftCount.1.i.i.411 = select i1 %cmp1.i.i.407, i32 %add3.i.i.408, i32 %..i.i.406
  %shr.i.i.412 = lshr i32 %a.addr.1.i.i.410, 24
  %arrayidx.i.i.413 = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.i.412
  %12 = load i32, i32* %arrayidx.i.i.413, align 4, !tbaa !1
  %add6.i.i.414 = add nsw i32 %12, %shiftCount.1.i.i.411
  %sub.i.415 = add nsw i32 %add6.i.i.414, -11
  %cmp1.i.416 = icmp slt i32 %add6.i.i.414, 11
  br i1 %cmp1.i.416, label %if.then.2.i.422, label %if.else.i.424

if.then.2.i.422:                                  ; preds = %if.then.i.417
  %sub3.i.418 = sub i32 11, %add6.i.i.414
  %shr.i.419 = lshr i32 %b.1, %sub3.i.418
  %and.i.420 = and i32 %sub.i.415, 31
  %shl.i.421 = shl i32 %b.1, %and.i.420
  br label %if.end.i.427

if.else.i.424:                                    ; preds = %if.then.i.417
  %shl4.i.423 = shl i32 %b.1, %sub.i.415
  br label %if.end.i.427

if.end.i.427:                                     ; preds = %if.else.i.424, %if.then.2.i.422
  %bSig0.0 = phi i32 [ %shr.i.419, %if.then.2.i.422 ], [ %shl4.i.423, %if.else.i.424 ]
  %storemerge.28.i.425 = phi i32 [ %shl.i.421, %if.then.2.i.422 ], [ 0, %if.else.i.424 ]
  %sub6.i.426 = sub i32 -20, %add6.i.i.414
  br label %if.end.55

if.else.7.i.443:                                  ; preds = %if.end.54
  %cmp.i.32.i.428 = icmp ult i32 %and.i.516, 65536
  %shl.i.33.i.429 = shl i32 %b.0, 16
  %shl.a.i.34.i.430 = select i1 %cmp.i.32.i.428, i32 %shl.i.33.i.429, i32 %and.i.516
  %..i.35.i.431 = select i1 %cmp.i.32.i.428, i32 16, i32 0
  %cmp1.i.36.i.432 = icmp ult i32 %shl.a.i.34.i.430, 16777216
  %add3.i.37.i.433 = or i32 %..i.35.i.431, 8
  %shl4.i.38.i.434 = shl i32 %shl.a.i.34.i.430, 8
  %a.addr.1.i.39.i.435 = select i1 %cmp1.i.36.i.432, i32 %shl4.i.38.i.434, i32 %shl.a.i.34.i.430
  %shiftCount.1.i.40.i.436 = select i1 %cmp1.i.36.i.432, i32 %add3.i.37.i.433, i32 %..i.35.i.431
  %shr.i.41.i.437 = lshr i32 %a.addr.1.i.39.i.435, 24
  %arrayidx.i.42.i.438 = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.41.i.437
  %13 = load i32, i32* %arrayidx.i.42.i.438, align 4, !tbaa !1
  %add6.i.43.i.439 = add nsw i32 %13, %shiftCount.1.i.40.i.436
  %sub9.i.440 = add nsw i32 %add6.i.43.i.439, -11
  %shl.i.29.i.441 = shl i32 %b.1, %sub9.i.440
  %cmp.i.30.i.442 = icmp eq i32 %sub9.i.440, 0
  br i1 %cmp.i.30.i.442, label %shortShift64Left.exit.i.452, label %cond.false.i.i.449

cond.false.i.i.449:                               ; preds = %if.else.7.i.443
  %shl1.i.i.444 = shl i32 %and.i.516, %sub9.i.440
  %sub.i.i.445 = sub i32 11, %add6.i.43.i.439
  %and.i.i.446 = and i32 %sub.i.i.445, 31
  %shr.i.31.i.447 = lshr i32 %b.1, %and.i.i.446
  %or.i.i.448 = or i32 %shr.i.31.i.447, %shl1.i.i.444
  br label %shortShift64Left.exit.i.452

shortShift64Left.exit.i.452:                      ; preds = %cond.false.i.i.449, %if.else.7.i.443
  %cond.i.i.450 = phi i32 [ %or.i.i.448, %cond.false.i.i.449 ], [ %and.i.516, %if.else.7.i.443 ]
  %sub10.i.451 = sub i32 12, %add6.i.43.i.439
  br label %if.end.55

if.end.55:                                        ; preds = %shortShift64Left.exit.i.452, %if.end.i.427, %if.end.35
  %bSig0.2 = phi i32 [ %and.i.516, %if.end.35 ], [ %bSig0.0, %if.end.i.427 ], [ %cond.i.i.450, %shortShift64Left.exit.i.452 ]
  %bSig1.1 = phi i32 [ %b.1, %if.end.35 ], [ %storemerge.28.i.425, %if.end.i.427 ], [ %shl.i.29.i.441, %shortShift64Left.exit.i.452 ]
  %bExp.0 = phi i32 [ %and.i.515, %if.end.35 ], [ %sub6.i.426, %if.end.i.427 ], [ %sub10.i.451, %shortShift64Left.exit.i.452 ]
  %cmp56 = icmp eq i32 %and.i.519, 0
  br i1 %cmp56, label %if.then.57, label %if.end.62

if.then.57:                                       ; preds = %if.end.55
  %or58 = or i32 %and.i, %a.1
  %cmp59 = icmp eq i32 %or58, 0
  br i1 %cmp59, label %if.then.60, label %if.end.61

if.then.60:                                       ; preds = %if.then.57
  %a.sroa.0.0..sroa_idx = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %a.0, i32* %a.sroa.0.0..sroa_idx, align 4
  %a.sroa.10.0..sroa_idx188 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.10.0..sroa_idx188, align 4
  br label %cleanup

if.end.61:                                        ; preds = %if.then.57
  %cmp.i.388 = icmp eq i32 %and.i, 0
  br i1 %cmp.i.388, label %if.then.i, label %if.else.7.i

if.then.i:                                        ; preds = %if.end.61
  %cmp.i.i.389 = icmp ult i32 %a.1, 65536
  %shl.i.i.390 = shl i32 %a.1, 16
  %shl.a.i.i = select i1 %cmp.i.i.389, i32 %shl.i.i.390, i32 %a.1
  %..i.i = select i1 %cmp.i.i.389, i32 16, i32 0
  %cmp1.i.i = icmp ult i32 %shl.a.i.i, 16777216
  %add3.i.i = or i32 %..i.i, 8
  %shl4.i.i = shl i32 %shl.a.i.i, 8
  %a.addr.1.i.i = select i1 %cmp1.i.i, i32 %shl4.i.i, i32 %shl.a.i.i
  %shiftCount.1.i.i = select i1 %cmp1.i.i, i32 %add3.i.i, i32 %..i.i
  %shr.i.i.391 = lshr i32 %a.addr.1.i.i, 24
  %arrayidx.i.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.i.391
  %14 = load i32, i32* %arrayidx.i.i, align 4, !tbaa !1
  %add6.i.i = add nsw i32 %14, %shiftCount.1.i.i
  %sub.i.392 = add nsw i32 %add6.i.i, -11
  %cmp1.i.393 = icmp slt i32 %add6.i.i, 11
  br i1 %cmp1.i.393, label %if.then.2.i.397, label %if.else.i.399

if.then.2.i.397:                                  ; preds = %if.then.i
  %sub3.i = sub i32 11, %add6.i.i
  %shr.i.394 = lshr i32 %a.1, %sub3.i
  %and.i.395 = and i32 %sub.i.392, 31
  %shl.i.396 = shl i32 %a.1, %and.i.395
  br label %if.end.i.400

if.else.i.399:                                    ; preds = %if.then.i
  %shl4.i.398 = shl i32 %a.1, %sub.i.392
  br label %if.end.i.400

if.end.i.400:                                     ; preds = %if.else.i.399, %if.then.2.i.397
  %aSig0.0 = phi i32 [ %shr.i.394, %if.then.2.i.397 ], [ %shl4.i.398, %if.else.i.399 ]
  %storemerge.28.i = phi i32 [ %shl.i.396, %if.then.2.i.397 ], [ 0, %if.else.i.399 ]
  %sub6.i = sub i32 -20, %add6.i.i
  br label %if.end.62

if.else.7.i:                                      ; preds = %if.end.61
  %cmp.i.32.i = icmp ult i32 %and.i, 65536
  %shl.i.33.i = shl i32 %a.0, 16
  %shl.a.i.34.i = select i1 %cmp.i.32.i, i32 %shl.i.33.i, i32 %and.i
  %..i.35.i = select i1 %cmp.i.32.i, i32 16, i32 0
  %cmp1.i.36.i = icmp ult i32 %shl.a.i.34.i, 16777216
  %add3.i.37.i = or i32 %..i.35.i, 8
  %shl4.i.38.i = shl i32 %shl.a.i.34.i, 8
  %a.addr.1.i.39.i = select i1 %cmp1.i.36.i, i32 %shl4.i.38.i, i32 %shl.a.i.34.i
  %shiftCount.1.i.40.i = select i1 %cmp1.i.36.i, i32 %add3.i.37.i, i32 %..i.35.i
  %shr.i.41.i = lshr i32 %a.addr.1.i.39.i, 24
  %arrayidx.i.42.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.41.i
  %15 = load i32, i32* %arrayidx.i.42.i, align 4, !tbaa !1
  %add6.i.43.i = add nsw i32 %15, %shiftCount.1.i.40.i
  %sub9.i = add nsw i32 %add6.i.43.i, -11
  %shl.i.29.i = shl i32 %a.1, %sub9.i
  %cmp.i.30.i = icmp eq i32 %sub9.i, 0
  br i1 %cmp.i.30.i, label %shortShift64Left.exit.i, label %cond.false.i.i

cond.false.i.i:                                   ; preds = %if.else.7.i
  %shl1.i.i = shl i32 %and.i, %sub9.i
  %sub.i.i.401 = sub i32 11, %add6.i.43.i
  %and.i.i = and i32 %sub.i.i.401, 31
  %shr.i.31.i = lshr i32 %a.1, %and.i.i
  %or.i.i = or i32 %shr.i.31.i, %shl1.i.i
  br label %shortShift64Left.exit.i

shortShift64Left.exit.i:                          ; preds = %cond.false.i.i, %if.else.7.i
  %cond.i.i = phi i32 [ %or.i.i, %cond.false.i.i ], [ %and.i, %if.else.7.i ]
  %sub10.i = sub i32 12, %add6.i.43.i
  br label %if.end.62

if.end.62:                                        ; preds = %shortShift64Left.exit.i, %if.end.i.400, %if.end.55
  %aSig1.1 = phi i32 [ %a.1, %if.end.55 ], [ %storemerge.28.i, %if.end.i.400 ], [ %shl.i.29.i, %shortShift64Left.exit.i ]
  %aSig0.2 = phi i32 [ %and.i, %if.end.55 ], [ %aSig0.0, %if.end.i.400 ], [ %cond.i.i, %shortShift64Left.exit.i ]
  %aExp.0 = phi i32 [ %and.i.519, %if.end.55 ], [ %sub6.i, %if.end.i.400 ], [ %sub10.i, %shortShift64Left.exit.i ]
  %sub = sub nsw i32 %aExp.0, %bExp.0
  %cmp63 = icmp slt i32 %sub, -1
  br i1 %cmp63, label %if.then.64, label %if.end.65

if.then.64:                                       ; preds = %if.end.62
  %a.sroa.0.0..sroa_idx186 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %a.0, i32* %a.sroa.0.0..sroa_idx186, align 4
  %a.sroa.10.0..sroa_idx191 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.10.0..sroa_idx191, align 4
  br label %cleanup

if.end.65:                                        ; preds = %if.end.62
  %or66 = or i32 %aSig0.2, 1048576
  %sub.lobit = lshr i32 %sub, 31
  %sub68 = sub nsw i32 11, %sub.lobit
  %shl.i.379 = shl i32 %aSig1.1, %sub68
  %shl1.i.380 = shl i32 %or66, %sub68
  %sub.i.381 = sub nsw i32 0, %sub68
  %and.i.382 = and i32 %sub.i.381, 23
  %shr.i.383 = lshr i32 %aSig1.1, %and.i.382
  %or.i.384 = or i32 %shr.i.383, %shl1.i.380
  %shl.i.372 = shl i32 %bSig1.1, 11
  %or69 = shl i32 %bSig0.2, 11
  %shl1.i.373 = or i32 %or69, -2147483648
  %shr.i.374 = lshr i32 %bSig1.1, 21
  %or.i.375 = or i32 %shr.i.374, %shl1.i.373
  %cmp.i.370 = icmp ugt i32 %or.i.384, %or.i.375
  br i1 %cmp.i.370, label %if.then.72, label %le64.exit

le64.exit:                                        ; preds = %if.end.65
  %cmp1.i.371 = icmp eq i32 %or.i.384, %or.i.375
  %cmp2.i = icmp uge i32 %shl.i.379, %shl.i.372
  %cmp2..i = and i1 %cmp2.i, %cmp1.i.371
  %lor.ext.i = zext i1 %cmp2..i to i32
  br i1 %cmp2..i, label %if.then.72, label %if.end.73

if.then.72:                                       ; preds = %if.end.65, %le64.exit
  %lor.ext.i612 = phi i32 [ %lor.ext.i, %le64.exit ], [ 1, %if.end.65 ]
  %sub.i.365 = sub i32 %shl.i.379, %shl.i.372
  %sub1.i.366 = sub i32 %or.i.384, %or.i.375
  %cmp.i.367 = icmp ult i32 %shl.i.379, %shl.i.372
  %conv.neg.i.368 = sext i1 %cmp.i.367 to i32
  %sub2.i.369 = add i32 %sub1.i.366, %conv.neg.i.368
  br label %if.end.73

if.end.73:                                        ; preds = %le64.exit, %if.then.72
  %lor.ext.i611 = phi i32 [ %lor.ext.i, %le64.exit ], [ %lor.ext.i612, %if.then.72 ]
  %aSig1.2 = phi i32 [ %shl.i.379, %le64.exit ], [ %sub.i.365, %if.then.72 ]
  %aSig0.3 = phi i32 [ %or.i.384, %le64.exit ], [ %sub2.i.369, %if.then.72 ]
  %sub74 = add nsw i32 %sub, -32
  %cmp75.599 = icmp sgt i32 %sub, 32
  br i1 %cmp75.599, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %if.end.73
  %shr.i.315 = lshr i32 %shl1.i.373, 16
  %shl.i.316 = shl nuw i32 %shr.i.315, 16
  %conv5.i.i.324 = and i32 %or.i.375, 65535
  %shl4.i.337 = shl i32 %or.i.375, 16
  %16 = lshr i32 %bSig1.1, 5
  %shr.i.i.272 = and i32 %16, 65535
  %conv5.i.i.274 = and i32 %shl.i.372, 63488
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %estimateDiv64To32.exit364
  %expDiff.0604 = phi i32 [ %sub74, %while.body.lr.ph ], [ %sub81, %estimateDiv64To32.exit364 ]
  %aSig0.4602 = phi i32 [ %aSig0.3, %while.body.lr.ph ], [ %sub2.i.255, %estimateDiv64To32.exit364 ]
  %aSig1.3600 = phi i32 [ %aSig1.2, %while.body.lr.ph ], [ %sub.i.251, %estimateDiv64To32.exit364 ]
  %cmp.i.314 = icmp ugt i32 %or.i.375, %aSig0.4602
  br i1 %cmp.i.314, label %if.end.i.318, label %estimateDiv64To32.exit364

if.end.i.318:                                     ; preds = %while.body
  %cmp1.i.317 = icmp ugt i32 %shl.i.316, %aSig0.4602
  br i1 %cmp1.i.317, label %cond.false.i.321, label %cond.end.i.336

cond.false.i.321:                                 ; preds = %if.end.i.318
  %div.i.319 = udiv i32 %aSig0.4602, %shr.i.315
  %shl2.i.320 = shl i32 %div.i.319, 16
  br label %cond.end.i.336

cond.end.i.336:                                   ; preds = %cond.false.i.321, %if.end.i.318
  %cond.i.322 = phi i32 [ %shl2.i.320, %cond.false.i.321 ], [ -65536, %if.end.i.318 ]
  %shr3.i.i.323 = lshr exact i32 %cond.i.322, 16
  %mul9.i.i.325 = mul nuw i32 %shr3.i.i.323, %conv5.i.i.324
  %mul15.i.i.326 = mul nuw i32 %shr3.i.i.323, %shr.i.315
  %shr17.i.i.327 = lshr i32 %mul9.i.i.325, 16
  %shl20.i.i.328 = shl i32 %mul9.i.i.325, 16
  %sub.i.i.329 = sub i32 %aSig1.3600, %shl20.i.i.328
  %cmp.i.39.i.330 = icmp ult i32 %aSig1.3600, %shl20.i.i.328
  %conv.neg.i.i.331 = sext i1 %cmp.i.39.i.330 to i32
  %add24.i.neg.i.332 = sub i32 %aSig0.4602, %mul15.i.i.326
  %sub1.i.i.333 = sub i32 %add24.i.neg.i.332, %shr17.i.i.327
  %sub2.i.i.334 = add i32 %sub1.i.i.333, %conv.neg.i.i.331
  %cmp3.45.i.335 = icmp slt i32 %sub2.i.i.334, 0
  br i1 %cmp3.45.i.335, label %while.body.i.349.preheader, label %while.end.i.357

while.body.i.349.preheader:                       ; preds = %cond.end.i.336
  br label %while.body.i.349

while.body.i.349:                                 ; preds = %while.body.i.349.preheader, %while.body.i.349
  %z.048.i.339 = phi i32 [ %sub.i.342, %while.body.i.349 ], [ %cond.i.322, %while.body.i.349.preheader ]
  %rem0.047.i.340 = phi i32 [ %add2.i.i.347, %while.body.i.349 ], [ %sub2.i.i.334, %while.body.i.349.preheader ]
  %rem1.046.i.341 = phi i32 [ %add.i.37.i.343, %while.body.i.349 ], [ %sub.i.i.329, %while.body.i.349.preheader ]
  %sub.i.342 = add i32 %z.048.i.339, -65536
  %add.i.37.i.343 = add i32 %rem1.046.i.341, %shl4.i.337
  %add1.i.i.344 = add i32 %rem0.047.i.340, %shr.i.315
  %cmp.i.38.i.345 = icmp ult i32 %add.i.37.i.343, %rem1.046.i.341
  %conv.i.i.346 = zext i1 %cmp.i.38.i.345 to i32
  %add2.i.i.347 = add i32 %add1.i.i.344, %conv.i.i.346
  %cmp3.i.348 = icmp slt i32 %add2.i.i.347, 0
  br i1 %cmp3.i.348, label %while.body.i.349, label %while.end.i.357.loopexit

while.end.i.357.loopexit:                         ; preds = %while.body.i.349
  %add2.i.i.347.lcssa = phi i32 [ %add2.i.i.347, %while.body.i.349 ]
  %add.i.37.i.343.lcssa = phi i32 [ %add.i.37.i.343, %while.body.i.349 ]
  %sub.i.342.lcssa = phi i32 [ %sub.i.342, %while.body.i.349 ]
  br label %while.end.i.357

while.end.i.357:                                  ; preds = %while.end.i.357.loopexit, %cond.end.i.336
  %z.0.lcssa.i.350 = phi i32 [ %cond.i.322, %cond.end.i.336 ], [ %sub.i.342.lcssa, %while.end.i.357.loopexit ]
  %rem0.0.lcssa.i.351 = phi i32 [ %sub2.i.i.334, %cond.end.i.336 ], [ %add2.i.i.347.lcssa, %while.end.i.357.loopexit ]
  %rem1.0.lcssa.i.352 = phi i32 [ %sub.i.i.329, %cond.end.i.336 ], [ %add.i.37.i.343.lcssa, %while.end.i.357.loopexit ]
  %shl5.i.353 = shl i32 %rem0.0.lcssa.i.351, 16
  %shr6.i.354 = lshr i32 %rem1.0.lcssa.i.352, 16
  %or.i.355 = or i32 %shr6.i.354, %shl5.i.353
  %cmp8.i.356 = icmp ugt i32 %shl.i.316, %or.i.355
  br i1 %cmp8.i.356, label %cond.false.10.i.359, label %cond.end.12.i.362

cond.false.10.i.359:                              ; preds = %while.end.i.357
  %div11.i.358 = udiv i32 %or.i.355, %shr.i.315
  br label %cond.end.12.i.362

cond.end.12.i.362:                                ; preds = %cond.false.10.i.359, %while.end.i.357
  %cond13.i.360 = phi i32 [ %div11.i.358, %cond.false.10.i.359 ], [ 65535, %while.end.i.357 ]
  %or14.i.361 = or i32 %cond13.i.360, %z.0.lcssa.i.350
  br label %estimateDiv64To32.exit364

estimateDiv64To32.exit364:                        ; preds = %while.body, %cond.end.12.i.362
  %retval.0.i.363 = phi i32 [ %or14.i.361, %cond.end.12.i.362 ], [ -1, %while.body ]
  %cmp78 = icmp ugt i32 %retval.0.i.363, 4
  %sub80 = add i32 %retval.0.i.363, -4
  %cond = select i1 %cmp78, i32 %sub80, i32 0
  %shr3.i.i.273 = lshr i32 %cond, 16
  %conv6.i.i.275 = and i32 %cond, 65535
  %mul.i.i.276 = mul nuw i32 %conv6.i.i.275, %conv5.i.i.274
  %mul9.i.i.277 = mul nuw i32 %shr3.i.i.273, %conv5.i.i.274
  %mul12.i.i.278 = mul nuw i32 %conv6.i.i.275, %shr.i.i.272
  %mul15.i.i.279 = mul nuw i32 %shr3.i.i.273, %shr.i.i.272
  %add.i.i.280 = add i32 %mul9.i.i.277, %mul12.i.i.278
  %cmp.i.i.281 = icmp ult i32 %add.i.i.280, %mul12.i.i.278
  %conv16.i.i.282 = zext i1 %cmp.i.i.281 to i32
  %shl.i.i.283 = shl nuw nsw i32 %conv16.i.i.282, 16
  %shr17.i.i.284 = lshr i32 %add.i.i.280, 16
  %add18.i.i.285 = or i32 %shl.i.i.283, %shr17.i.i.284
  %shl20.i.i.286 = shl i32 %add.i.i.280, 16
  %add21.i.i.287 = add i32 %shl20.i.i.286, %mul.i.i.276
  %cmp22.i.i.288 = icmp ult i32 %add21.i.i.287, %shl20.i.i.286
  %conv23.i.i.289 = zext i1 %cmp22.i.i.288 to i32
  %mul.i.8.i.292 = mul nuw i32 %conv6.i.i.275, %conv5.i.i.324
  %mul9.i.9.i.293 = mul nuw i32 %shr3.i.i.273, %conv5.i.i.324
  %mul12.i.10.i.294 = mul nuw i32 %conv6.i.i.275, %shr.i.315
  %mul15.i.11.i.295 = mul nuw i32 %shr3.i.i.273, %shr.i.315
  %add.i.12.i.296 = add i32 %mul9.i.9.i.293, %mul12.i.10.i.294
  %shr17.i.16.i.300 = lshr i32 %add.i.12.i.296, 16
  %add19.i.18.i.302 = add i32 %shr17.i.16.i.300, %mul15.i.11.i.295
  %shl20.i.19.i.303 = shl i32 %add.i.12.i.296, 16
  %add21.i.20.i.304 = add i32 %shl20.i.19.i.303, %mul.i.8.i.292
  %cmp22.i.21.i.305 = icmp ult i32 %add21.i.20.i.304, %shl20.i.19.i.303
  %conv23.i.22.i.306 = zext i1 %cmp22.i.21.i.305 to i32
  %add24.i.23.i.307 = add i32 %add19.i.18.i.302, %conv23.i.22.i.306
  %add19.i.i.308 = add i32 %add21.i.20.i.304, %mul15.i.i.279
  %add24.i.i.309 = add i32 %add19.i.i.308, %add18.i.i.285
  %add.i.2.i.310 = add i32 %add24.i.i.309, %conv23.i.i.289
  %cmp.i.3.i.311 = icmp ult i32 %add.i.2.i.310, %add21.i.20.i.304
  %conv.i.i.312 = zext i1 %cmp.i.3.i.311 to i32
  %add2.i.i.313 = add i32 %add24.i.23.i.307, %conv.i.i.312
  %shl1.i.264 = shl i32 %add.i.2.i.310, 29
  %shl2.i.265 = shl i32 %add2.i.i.313, 29
  %shr.i.266 = lshr exact i32 %add21.i.i.287, 3
  %or.i.267 = or i32 %shl1.i.264, %shr.i.266
  %shr3.i.268 = lshr i32 %add.i.2.i.310, 3
  %or4.i = or i32 %shl2.i.265, %shr3.i.268
  %shl1.i.257 = shl i32 %aSig0.4602, 29
  %shr.i.258 = lshr i32 %aSig1.3600, 3
  %or.i.259 = or i32 %shl1.i.257, %shr.i.258
  %sub.i.251 = sub i32 0, %or.i.267
  %cmp.i.253 = icmp ne i32 %or.i.267, 0
  %conv.neg.i.254 = sext i1 %cmp.i.253 to i32
  %sub1.i.252 = add i32 %conv.neg.i.254, %or.i.259
  %sub2.i.255 = sub i32 %sub1.i.252, %or4.i
  %sub81 = add nsw i32 %expDiff.0604, -29
  %cmp75 = icmp sgt i32 %expDiff.0604, 29
  br i1 %cmp75, label %while.body, label %while.end.loopexit

while.end.loopexit:                               ; preds = %estimateDiv64To32.exit364
  %sub81.lcssa = phi i32 [ %sub81, %estimateDiv64To32.exit364 ]
  %sub2.i.255.lcssa = phi i32 [ %sub2.i.255, %estimateDiv64To32.exit364 ]
  %sub.i.251.lcssa = phi i32 [ %sub.i.251, %estimateDiv64To32.exit364 ]
  %cond.lcssa = phi i32 [ %cond, %estimateDiv64To32.exit364 ]
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %if.end.73
  %expDiff.0.lcssa = phi i32 [ %sub74, %if.end.73 ], [ %sub81.lcssa, %while.end.loopexit ]
  %q.0.lcssa = phi i32 [ %lor.ext.i611, %if.end.73 ], [ %cond.lcssa, %while.end.loopexit ]
  %aSig0.4.lcssa = phi i32 [ %aSig0.3, %if.end.73 ], [ %sub2.i.255.lcssa, %while.end.loopexit ]
  %aSig1.3.lcssa = phi i32 [ %aSig1.2, %if.end.73 ], [ %sub.i.251.lcssa, %while.end.loopexit ]
  %cmp82 = icmp sgt i32 %expDiff.0.lcssa, -32
  br i1 %cmp82, label %if.then.84, label %if.else.99

if.then.84:                                       ; preds = %while.end
  %cmp.i.235 = icmp ugt i32 %or.i.375, %aSig0.4.lcssa
  br i1 %cmp.i.235, label %if.end.i, label %estimateDiv64To32.exit

if.end.i:                                         ; preds = %if.then.84
  %shr.i.236 = lshr i32 %shl1.i.373, 16
  %shl.i.237 = shl nuw i32 %shr.i.236, 16
  %cmp1.i.238 = icmp ugt i32 %shl.i.237, %aSig0.4.lcssa
  br i1 %cmp1.i.238, label %cond.false.i.239, label %cond.end.i

cond.false.i.239:                                 ; preds = %if.end.i
  %div.i = udiv i32 %aSig0.4.lcssa, %shr.i.236
  %shl2.i = shl i32 %div.i, 16
  br label %cond.end.i

cond.end.i:                                       ; preds = %cond.false.i.239, %if.end.i
  %cond.i.240 = phi i32 [ %shl2.i, %cond.false.i.239 ], [ -65536, %if.end.i ]
  %shr3.i.i.241 = lshr exact i32 %cond.i.240, 16
  %conv5.i.i.242 = and i32 %or.i.375, 65535
  %mul9.i.i.243 = mul nuw i32 %shr3.i.i.241, %conv5.i.i.242
  %mul15.i.i.244 = mul nuw i32 %shr3.i.i.241, %shr.i.236
  %shr17.i.i.245 = lshr i32 %mul9.i.i.243, 16
  %shl20.i.i.246 = shl i32 %mul9.i.i.243, 16
  %sub.i.i = sub i32 %aSig1.3.lcssa, %shl20.i.i.246
  %cmp.i.39.i = icmp ult i32 %aSig1.3.lcssa, %shl20.i.i.246
  %conv.neg.i.i = sext i1 %cmp.i.39.i to i32
  %add24.i.neg.i = sub i32 %aSig0.4.lcssa, %mul15.i.i.244
  %sub1.i.i = sub i32 %add24.i.neg.i, %shr17.i.i.245
  %sub2.i.i = add i32 %sub1.i.i, %conv.neg.i.i
  %cmp3.45.i = icmp slt i32 %sub2.i.i, 0
  br i1 %cmp3.45.i, label %while.body.lr.ph.i, label %while.end.i

while.body.lr.ph.i:                               ; preds = %cond.end.i
  %shl4.i = shl i32 %or.i.375, 16
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i, %while.body.lr.ph.i
  %z.048.i = phi i32 [ %cond.i.240, %while.body.lr.ph.i ], [ %sub.i.247, %while.body.i ]
  %rem0.047.i = phi i32 [ %sub2.i.i, %while.body.lr.ph.i ], [ %add2.i.i.249, %while.body.i ]
  %rem1.046.i = phi i32 [ %sub.i.i, %while.body.lr.ph.i ], [ %add.i.37.i, %while.body.i ]
  %sub.i.247 = add i32 %z.048.i, -65536
  %add.i.37.i = add i32 %rem1.046.i, %shl4.i
  %add1.i.i = add i32 %rem0.047.i, %shr.i.236
  %cmp.i.38.i = icmp ult i32 %add.i.37.i, %rem1.046.i
  %conv.i.i.248 = zext i1 %cmp.i.38.i to i32
  %add2.i.i.249 = add i32 %add1.i.i, %conv.i.i.248
  %cmp3.i = icmp slt i32 %add2.i.i.249, 0
  br i1 %cmp3.i, label %while.body.i, label %while.end.i.loopexit

while.end.i.loopexit:                             ; preds = %while.body.i
  %add2.i.i.249.lcssa = phi i32 [ %add2.i.i.249, %while.body.i ]
  %add.i.37.i.lcssa = phi i32 [ %add.i.37.i, %while.body.i ]
  %sub.i.247.lcssa = phi i32 [ %sub.i.247, %while.body.i ]
  br label %while.end.i

while.end.i:                                      ; preds = %while.end.i.loopexit, %cond.end.i
  %z.0.lcssa.i = phi i32 [ %cond.i.240, %cond.end.i ], [ %sub.i.247.lcssa, %while.end.i.loopexit ]
  %rem0.0.lcssa.i = phi i32 [ %sub2.i.i, %cond.end.i ], [ %add2.i.i.249.lcssa, %while.end.i.loopexit ]
  %rem1.0.lcssa.i = phi i32 [ %sub.i.i, %cond.end.i ], [ %add.i.37.i.lcssa, %while.end.i.loopexit ]
  %shl5.i = shl i32 %rem0.0.lcssa.i, 16
  %shr6.i = lshr i32 %rem1.0.lcssa.i, 16
  %or.i.250 = or i32 %shr6.i, %shl5.i
  %cmp8.i = icmp ugt i32 %shl.i.237, %or.i.250
  br i1 %cmp8.i, label %cond.false.10.i, label %cond.end.12.i

cond.false.10.i:                                  ; preds = %while.end.i
  %div11.i = udiv i32 %or.i.250, %shr.i.236
  br label %cond.end.12.i

cond.end.12.i:                                    ; preds = %cond.false.10.i, %while.end.i
  %cond13.i = phi i32 [ %div11.i, %cond.false.10.i ], [ 65535, %while.end.i ]
  %or14.i = or i32 %cond13.i, %z.0.lcssa.i
  br label %estimateDiv64To32.exit

estimateDiv64To32.exit:                           ; preds = %if.then.84, %cond.end.12.i
  %retval.0.i = phi i32 [ %or14.i, %cond.end.12.i ], [ -1, %if.then.84 ]
  %cmp86 = icmp ugt i32 %retval.0.i, 4
  %sub89 = add i32 %retval.0.i, -4
  %cond92 = select i1 %cmp86, i32 %sub89, i32 0
  %sub93 = sub nsw i32 0, %expDiff.0.lcssa
  %shr = lshr i32 %cond92, %sub93
  %shl.i.228 = shl i32 %shr.i.374, 24
  %17 = shl i32 %bSig1.1, 3
  %shr.i.229 = and i32 %17, 16777208
  %or.i.230 = or i32 %shl.i.228, %shr.i.229
  %shr3.i.231 = lshr i32 %or.i.375, 8
  %cmp94 = icmp slt i32 %expDiff.0.lcssa, -24
  br i1 %cmp94, label %if.then.96, label %if.else

if.then.96:                                       ; preds = %estimateDiv64To32.exit
  %sub97 = sub i32 -24, %expDiff.0.lcssa
  %sub.i.219 = sub nsw i32 0, %sub97
  %and.i.220 = and i32 %sub.i.219, 31
  %cmp.i.221 = icmp eq i32 %sub97, 0
  br i1 %cmp.i.221, label %if.end.98, label %if.else.i

if.else.i:                                        ; preds = %if.then.96
  %cmp1.i = icmp slt i32 %sub97, 32
  br i1 %cmp1.i, label %if.then.2.i, label %if.else.4.i

if.then.2.i:                                      ; preds = %if.else.i
  %shl.i.222 = shl i32 %aSig0.4.lcssa, %and.i.220
  %shr.i.223 = lshr i32 %aSig1.3.lcssa, %sub97
  %or.i.224 = or i32 %shl.i.222, %shr.i.223
  %shr3.i.225 = lshr i32 %aSig0.4.lcssa, %sub97
  br label %if.end.98

if.else.4.i:                                      ; preds = %if.else.i
  %cmp5.i = icmp slt i32 %sub97, 64
  %and6.i = and i32 %sub97, 31
  %shr7.i = lshr i32 %aSig0.4.lcssa, %and6.i
  %cond.i.226 = select i1 %cmp5.i, i32 %shr7.i, i32 0
  br label %if.end.98

if.else:                                          ; preds = %estimateDiv64To32.exit
  %add = add nsw i32 %expDiff.0.lcssa, 24
  %shl.i.213 = shl i32 %aSig1.3.lcssa, %add
  %cmp.i.214 = icmp eq i32 %add, 0
  br i1 %cmp.i.214, label %if.end.98, label %cond.false.i

cond.false.i:                                     ; preds = %if.else
  %shl1.i = shl i32 %aSig0.4.lcssa, %add
  %sub.i.215 = sub i32 -24, %expDiff.0.lcssa
  %and.i.216 = and i32 %sub.i.215, 31
  %shr.i.217 = lshr i32 %aSig1.3.lcssa, %and.i.216
  %or.i.218 = or i32 %shr.i.217, %shl1.i
  br label %if.end.98

if.end.98:                                        ; preds = %cond.false.i, %if.else, %if.else.4.i, %if.then.2.i, %if.then.96
  %aSig1.4 = phi i32 [ %or.i.224, %if.then.2.i ], [ %aSig1.3.lcssa, %if.then.96 ], [ %cond.i.226, %if.else.4.i ], [ %shl.i.213, %if.else ], [ %shl.i.213, %cond.false.i ]
  %aSig0.5 = phi i32 [ %shr3.i.225, %if.then.2.i ], [ %aSig0.4.lcssa, %if.then.96 ], [ 0, %if.else.4.i ], [ %aSig0.4.lcssa, %if.else ], [ %or.i.218, %cond.false.i ]
  %shr.i.i = lshr i32 %or.i.230, 16
  %shr3.i.i = lshr i32 %shr, 16
  %conv5.i.i = and i32 %17, 65528
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
  %shr.i.4.i = lshr i32 %shl1.i.373, 24
  %conv5.i.6.i = and i32 %shr3.i.231, 65535
  %mul.i.8.i = mul nuw i32 %conv6.i.i, %conv5.i.6.i
  %mul9.i.9.i = mul nuw i32 %shr3.i.i, %conv5.i.6.i
  %mul12.i.10.i = mul nuw nsw i32 %conv6.i.i, %shr.i.4.i
  %add.i.12.i = add i32 %mul9.i.9.i, %mul12.i.10.i
  %shl20.i.19.i = shl i32 %add.i.12.i, 16
  %sub.i.208 = sub i32 %aSig1.4, %add21.i.i
  %conv23.i.i.neg = sext i1 %cmp22.i.i to i32
  %cmp.i.210 = icmp ult i32 %aSig1.4, %add21.i.i
  %conv.neg.i.211 = sext i1 %cmp.i.210 to i32
  %sum = add i32 %mul15.i.i, %mul.i.8.i
  %sum608 = add i32 %sum, %shl20.i.19.i
  %sum609 = add i32 %sum608, %add18.i.i
  %add.i.2.i.neg = sub i32 %conv23.i.i.neg, %sum609
  %sub1.i.209 = add i32 %add.i.2.i.neg, %aSig0.5
  %sub2.i.212 = add i32 %sub1.i.209, %conv.neg.i.211
  br label %do.body.preheader

if.else.99:                                       ; preds = %while.end
  %shl.i.204 = shl i32 %aSig0.4.lcssa, 24
  %shr.i.205 = lshr i32 %aSig1.3.lcssa, 8
  %or.i.206 = or i32 %shl.i.204, %shr.i.205
  %shr3.i.207 = lshr i32 %aSig0.4.lcssa, 8
  %shl.i = shl i32 %shr.i.374, 24
  %18 = shl i32 %bSig1.1, 3
  %shr.i = and i32 %18, 16777208
  %or.i = or i32 %shl.i, %shr.i
  %shr3.i = lshr i32 %or.i.375, 8
  br label %do.body.preheader

do.body.preheader:                                ; preds = %if.else.99, %if.end.98
  %aSig1.5.ph = phi i32 [ %or.i.206, %if.else.99 ], [ %sub.i.208, %if.end.98 ]
  %bSig0.3.ph = phi i32 [ %shr3.i, %if.else.99 ], [ %shr3.i.231, %if.end.98 ]
  %bSig1.2.ph = phi i32 [ %or.i, %if.else.99 ], [ %or.i.230, %if.end.98 ]
  %aSig0.6.ph = phi i32 [ %shr3.i.207, %if.else.99 ], [ %sub2.i.212, %if.end.98 ]
  %q.1.ph = phi i32 [ %q.0.lcssa, %if.else.99 ], [ %shr, %if.end.98 ]
  br label %do.body

do.body:                                          ; preds = %do.body.preheader, %do.body
  %aSig1.5 = phi i32 [ %sub.i.199, %do.body ], [ %aSig1.5.ph, %do.body.preheader ]
  %aSig0.6 = phi i32 [ %sub2.i.203, %do.body ], [ %aSig0.6.ph, %do.body.preheader ]
  %q.1 = phi i32 [ %inc, %do.body ], [ %q.1.ph, %do.body.preheader ]
  %inc = add i32 %q.1, 1
  %sub.i.199 = sub i32 %aSig1.5, %bSig1.2.ph
  %sub1.i.200 = sub i32 %aSig0.6, %bSig0.3.ph
  %cmp.i.201 = icmp ult i32 %aSig1.5, %bSig1.2.ph
  %conv.neg.i.202 = sext i1 %cmp.i.201 to i32
  %sub2.i.203 = add i32 %sub1.i.200, %conv.neg.i.202
  %cmp101 = icmp sgt i32 %sub2.i.203, -1
  br i1 %cmp101, label %do.body, label %do.end

do.end:                                           ; preds = %do.body
  %sub2.i.203.lcssa = phi i32 [ %sub2.i.203, %do.body ]
  %sub.i.199.lcssa = phi i32 [ %sub.i.199, %do.body ]
  %inc.lcssa = phi i32 [ %inc, %do.body ]
  %aSig0.6.lcssa = phi i32 [ %aSig0.6, %do.body ]
  %aSig1.5.lcssa = phi i32 [ %aSig1.5, %do.body ]
  %add.i = add i32 %sub.i.199.lcssa, %aSig1.5.lcssa
  %add1.i = add i32 %sub2.i.203.lcssa, %aSig0.6.lcssa
  %cmp.i.198 = icmp ult i32 %add.i, %sub.i.199.lcssa
  %conv.i = zext i1 %cmp.i.198 to i32
  %add2.i = add i32 %add1.i, %conv.i
  %cmp103 = icmp slt i32 %add2.i, 0
  br i1 %cmp103, label %if.end.112, label %lor.lhs.false.105

lor.lhs.false.105:                                ; preds = %do.end
  %or106 = or i32 %add2.i, %add.i
  %cmp107 = icmp ne i32 %or106, 0
  %and = and i32 %inc.lcssa, 1
  %tobool110 = icmp eq i32 %and, 0
  %or.cond = or i1 %tobool110, %cmp107
  br i1 %or.cond, label %if.then.116, label %if.end.112

if.end.112:                                       ; preds = %do.end, %lor.lhs.false.105
  %cmp113 = icmp slt i32 %aSig0.6.lcssa, 0
  %.lobit = lshr i32 %aSig0.6.lcssa, 31
  br i1 %cmp113, label %if.then.116, label %if.end.117

if.then.116:                                      ; preds = %lor.lhs.false.105, %if.end.112
  %.lobit595 = phi i32 [ %.lobit, %if.end.112 ], [ 1, %lor.lhs.false.105 ]
  %aSig0.7593 = phi i32 [ %aSig0.6.lcssa, %if.end.112 ], [ %sub2.i.203.lcssa, %lor.lhs.false.105 ]
  %aSig1.6592 = phi i32 [ %aSig1.5.lcssa, %if.end.112 ], [ %sub.i.199.lcssa, %lor.lhs.false.105 ]
  %sub.i = sub i32 0, %aSig1.6592
  %cmp.i = icmp ne i32 %aSig1.6592, 0
  %conv.neg.i = sext i1 %cmp.i to i32
  %sub2.i = sub i32 %conv.neg.i, %aSig0.7593
  br label %if.end.117

if.end.117:                                       ; preds = %if.then.116, %if.end.112
  %.lobit594 = phi i32 [ %.lobit595, %if.then.116 ], [ %.lobit, %if.end.112 ]
  %aSig1.7 = phi i32 [ %sub.i, %if.then.116 ], [ %aSig1.5.lcssa, %if.end.112 ]
  %aSig0.8 = phi i32 [ %sub2.i, %if.then.116 ], [ %aSig0.6.lcssa, %if.end.112 ]
  %xor = xor i32 %.lobit594, %shr.i.517
  %sub118 = add nsw i32 %bExp.0, -4
  tail call fastcc void @normalizeRoundAndPackFloat64(%struct.float64* noalias %agg.result, i32 %xor, i32 %sub118, i32 %aSig0.8, i32 %aSig1.7)
  br label %cleanup

cleanup:                                          ; preds = %cond.false.25.i, %cond.true.24.i, %cond.true.21.i, %cond.true.i, %cond.false.25.i.512, %cond.true.24.i.510, %cond.true.21.i.507, %cond.true.i.503, %if.end.117, %if.then.64, %if.then.60, %invalid, %if.end.45
  ret void
}

; Function Attrs: nounwind
define internal fastcc void @normalizeRoundAndPackFloat64(%struct.float64* noalias nocapture %agg.result, i32 %zSign, i32 %zExp, i32 %zSig0, i32 %zSig1) #2 {
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
  %shl.i.13 = shl i32 %.zSig1, %sub1
  %cmp.i.14 = icmp eq i32 %sub1, 0
  br i1 %cmp.i.14, label %if.end.5, label %cond.false.i

cond.false.i:                                     ; preds = %if.then.3
  %shl1.i = shl i32 %zSig1.zSig0, %sub1
  %sub.i = sub i32 11, %add6.i
  %and.i = and i32 %sub.i, 31
  %shr.i.15 = lshr i32 %.zSig1, %and.i
  %or.i = or i32 %shr.i.15, %shl1.i
  br label %if.end.5

if.else:                                          ; preds = %entry
  %sub4 = sub i32 11, %add6.i
  %sub.i.16 = sub nsw i32 0, %sub4
  %and.i.17 = and i32 %sub.i.16, 31
  %cmp.i.18 = icmp eq i32 %sub4, 0
  br i1 %cmp.i.18, label %if.end.5, label %if.else.i

if.else.i:                                        ; preds = %if.else
  %cmp1.i.19 = icmp slt i32 %sub4, 32
  br i1 %cmp1.i.19, label %if.then.2.i, label %if.else.5.i

if.then.2.i:                                      ; preds = %if.else.i
  %shl.i.20 = shl i32 %.zSig1, %and.i.17
  %shl3.i = shl i32 %zSig1.zSig0, %and.i.17
  %shr.i.21 = lshr i32 %.zSig1, %sub4
  %or.i.22 = or i32 %shl3.i, %shr.i.21
  %shr4.i = lshr i32 %zSig1.zSig0, %sub4
  br label %if.end.19.i

if.else.5.i:                                      ; preds = %if.else.i
  %cmp6.i = icmp eq i32 %sub4, 32
  br i1 %cmp6.i, label %if.end.19.i, label %if.else.8.i

if.else.8.i:                                      ; preds = %if.else.5.i
  %cmp10.i = icmp slt i32 %sub4, 64
  br i1 %cmp10.i, label %if.then.11.i, label %if.else.15.i

if.then.11.i:                                     ; preds = %if.else.8.i
  %shl12.i = shl i32 %zSig1.zSig0, %and.i.17
  %and13.i = and i32 %sub4, 31
  %shr14.i = lshr i32 %zSig1.zSig0, %and13.i
  br label %if.end.19.i

if.else.15.i:                                     ; preds = %if.else.8.i
  %cmp16.i = icmp eq i32 %sub4, 64
  %cmp17.i = icmp ne i32 %zSig1.zSig0, 0
  %conv.i = zext i1 %cmp17.i to i32
  %cond.i.23 = select i1 %cmp16.i, i32 %zSig1.zSig0, i32 %conv.i
  br label %if.end.19.i

if.end.19.i:                                      ; preds = %if.else.15.i, %if.then.11.i, %if.else.5.i, %if.then.2.i
  %z0.0.i = phi i32 [ %shr4.i, %if.then.2.i ], [ 0, %if.else.5.i ], [ 0, %if.then.11.i ], [ 0, %if.else.15.i ]
  %z1.1.i = phi i32 [ %or.i.22, %if.then.2.i ], [ %zSig1.zSig0, %if.else.5.i ], [ %shr14.i, %if.then.11.i ], [ 0, %if.else.15.i ]
  %z2.1.i = phi i32 [ %shl.i.20, %if.then.2.i ], [ %.zSig1, %if.else.5.i ], [ %shl12.i, %if.then.11.i ], [ %cond.i.23, %if.else.15.i ]
  %a2.addr.1.i = phi i32 [ 0, %if.then.2.i ], [ 0, %if.else.5.i ], [ %.zSig1, %if.then.11.i ], [ %.zSig1, %if.else.15.i ]
  %cmp20.i = icmp ne i32 %a2.addr.1.i, 0
  %conv21.i = zext i1 %cmp20.i to i32
  %or22.i = or i32 %conv21.i, %z2.1.i
  br label %if.end.5

if.end.5:                                         ; preds = %if.end.19.i, %if.else, %cond.false.i, %if.then.3
  %zSig0.addr.1 = phi i32 [ %or.i, %cond.false.i ], [ %zSig1.zSig0, %if.then.3 ], [ %z0.0.i, %if.end.19.i ], [ %zSig1.zSig0, %if.else ]
  %zSig1.addr.1 = phi i32 [ %shl.i.13, %cond.false.i ], [ %shl.i.13, %if.then.3 ], [ %z1.1.i, %if.end.19.i ], [ %.zSig1, %if.else ]
  %zSig2.0 = phi i32 [ 0, %cond.false.i ], [ 0, %if.then.3 ], [ %or22.i, %if.end.19.i ], [ 0, %if.else ]
  %sub6 = sub nsw i32 %sub.zExp, %sub1
  tail call fastcc void @roundAndPackFloat64(%struct.float64* noalias %agg.result, i32 %zSign, i32 %sub6, i32 %zSig0.addr.1, i32 %zSig1.addr.1, i32 %zSig2.0)
  ret void
}

; Function Attrs: nounwind
define void @float64_sqrt(%struct.float64* noalias nocapture sret %agg.result, i32 %a.0, i32 %a.1) #2 {
entry:
  %and.i = and i32 %a.0, 1048575
  %shr.i.278 = lshr i32 %a.0, 20
  %and.i.279 = and i32 %shr.i.278, 2047
  %shr.i.277 = lshr i32 %a.0, 31
  %cmp = icmp eq i32 %and.i.279, 2047
  br i1 %cmp, label %if.then, label %if.end.20

if.then:                                          ; preds = %entry
  %or = or i32 %and.i, %a.1
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %if.end, label %if.then.12

if.then.12:                                       ; preds = %if.then
  %and.i.56.i = and i32 %a.0, 2146959360
  %cmp.i.57.i = icmp eq i32 %and.i.56.i, 2146435072
  br i1 %cmp.i.57.i, label %land.rhs.i.59.i, label %float64_is_signaling_nan.exit.i

land.rhs.i.59.i:                                  ; preds = %if.then.12
  %tobool.i.58.i = icmp eq i32 %a.1, 0
  br i1 %tobool.i.58.i, label %lor.rhs.i.i, label %if.then.thread.i

if.then.thread.i:                                 ; preds = %land.rhs.i.59.i
  %or17.67.i = or i32 %a.0, 524288
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !136
  %or.i.79.i = or i32 %0, 16
  store i32 %or.i.79.i, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !136
  %b.sroa.0.0..sroa_idx.73.80.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.true.i

lor.rhs.i.i:                                      ; preds = %land.rhs.i.59.i
  %and4.i.60.i = and i32 %a.0, 524287
  %tobool5.i.61.i = icmp ne i32 %and4.i.60.i, 0
  %and4.i.i = and i32 %a.0, 524287
  %tobool5.i.i = icmp ne i32 %and4.i.i, 0
  br label %float64_is_signaling_nan.exit.i

float64_is_signaling_nan.exit.i:                  ; preds = %if.then.12, %lor.rhs.i.i
  %1 = phi i1 [ %tobool5.i.61.i, %lor.rhs.i.i ], [ false, %if.then.12 ]
  %2 = phi i1 [ %tobool5.i.i, %lor.rhs.i.i ], [ false, %if.then.12 ]
  %or.i.272 = or i32 %a.0, 524288
  %or1865.i = or i1 %1, %2
  br i1 %or1865.i, label %if.then.i.274, label %if.end.i.275

if.then.i.274:                                    ; preds = %float64_is_signaling_nan.exit.i
  %3 = load i32, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !136
  %or.i.i.273 = or i32 %3, 16
  store i32 %or.i.i.273, i32* @float_exception_flags, align 4, !tbaa !1, !noalias !136
  %b.sroa.0.0..sroa_idx.73.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br i1 %2, label %cond.true.i, label %cond.false.i.276

if.end.i.275:                                     ; preds = %float64_is_signaling_nan.exit.i
  %b.sroa.0.0..sroa_idx.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  br label %cond.false.i.276

cond.true.i:                                      ; preds = %if.then.i.274, %if.then.thread.i
  %b.sroa.0.0..sroa_idx77.i = phi i32* [ %b.sroa.0.0..sroa_idx.73.i, %if.then.i.274 ], [ %b.sroa.0.0..sroa_idx.73.80.i, %if.then.thread.i ]
  %or177174.i = phi i32 [ %or.i.272, %if.then.i.274 ], [ %or17.67.i, %if.then.thread.i ]
  store i32 %or177174.i, i32* %b.sroa.0.0..sroa_idx77.i, align 4, !alias.scope !136
  %b.sroa.7.0..sroa_idx38.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %b.sroa.7.0..sroa_idx38.i, align 4, !alias.scope !136
  br label %cleanup

cond.false.i.276:                                 ; preds = %if.end.i.275, %if.then.i.274
  %b.sroa.0.0..sroa_idx78.i = phi i32* [ %b.sroa.0.0..sroa_idx.73.i, %if.then.i.274 ], [ %b.sroa.0.0..sroa_idx.i, %if.end.i.275 ]
  store i32 %or.i.272, i32* %b.sroa.0.0..sroa_idx78.i, align 4
  %a.sroa.7.0..sroa_idx46.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.7.0..sroa_idx46.i, align 4
  br label %cleanup

if.end:                                           ; preds = %if.then
  %tobool17 = icmp eq i32 %shr.i.277, 0
  br i1 %tobool17, label %if.then.18, label %invalid

if.then.18:                                       ; preds = %if.end
  %a.sroa.0.0..sroa_idx = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %a.0, i32* %a.sroa.0.0..sroa_idx, align 4
  %a.sroa.9.0..sroa_idx104 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.9.0..sroa_idx104, align 4
  br label %cleanup

if.end.20:                                        ; preds = %entry
  %tobool21 = icmp eq i32 %shr.i.277, 0
  br i1 %tobool21, label %if.end.30, label %if.then.22

if.then.22:                                       ; preds = %if.end.20
  %or23 = or i32 %and.i, %a.1
  %or24 = or i32 %or23, %and.i.279
  %cmp25 = icmp eq i32 %or24, 0
  br i1 %cmp25, label %if.then.26, label %invalid

if.then.26:                                       ; preds = %if.then.22
  %a.sroa.0.0..sroa_idx102 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 %a.0, i32* %a.sroa.0.0..sroa_idx102, align 4
  %a.sroa.9.0..sroa_idx105 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.9.0..sroa_idx105, align 4
  br label %cleanup

invalid:                                          ; preds = %if.end, %if.then.22
  %4 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i.268 = or i32 %4, 16
  store i32 %or.i.268, i32* @float_exception_flags, align 4, !tbaa !1
  %z.sroa.0.0..sroa_idx = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 2147483647, i32* %z.sroa.0.0..sroa_idx, align 4
  %z.sroa.4.0..sroa_idx87 = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 -1, i32* %z.sroa.4.0..sroa_idx87, align 4
  br label %cleanup

if.end.30:                                        ; preds = %if.end.20
  %cmp31 = icmp eq i32 %and.i.279, 0
  br i1 %cmp31, label %if.then.32, label %if.end.37

if.then.32:                                       ; preds = %if.end.30
  %or33 = or i32 %and.i, %a.1
  %cmp34 = icmp eq i32 %or33, 0
  br i1 %cmp34, label %if.then.35, label %if.end.36

if.then.35:                                       ; preds = %if.then.32
  %z.sroa.0.0..sroa_idx.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 0
  store i32 0, i32* %z.sroa.0.0..sroa_idx.i, align 4, !alias.scope !139
  %z.sroa.4.0..sroa_idx4.i = getelementptr inbounds %struct.float64, %struct.float64* %agg.result, i32 0, i32 1
  store i32 0, i32* %z.sroa.4.0..sroa_idx4.i, align 4, !alias.scope !139
  br label %cleanup

if.end.36:                                        ; preds = %if.then.32
  %cmp.i.255 = icmp eq i32 %and.i, 0
  br i1 %cmp.i.255, label %if.then.i.258, label %if.else.7.i

if.then.i.258:                                    ; preds = %if.end.36
  %cmp.i.i = icmp ult i32 %a.1, 65536
  %shl.i.i = shl i32 %a.1, 16
  %shl.a.i.i = select i1 %cmp.i.i, i32 %shl.i.i, i32 %a.1
  %..i.i = select i1 %cmp.i.i, i32 16, i32 0
  %cmp1.i.i = icmp ult i32 %shl.a.i.i, 16777216
  %add3.i.i = or i32 %..i.i, 8
  %shl4.i.i = shl i32 %shl.a.i.i, 8
  %a.addr.1.i.i = select i1 %cmp1.i.i, i32 %shl4.i.i, i32 %shl.a.i.i
  %shiftCount.1.i.i = select i1 %cmp1.i.i, i32 %add3.i.i, i32 %..i.i
  %shr.i.i = lshr i32 %a.addr.1.i.i, 24
  %arrayidx.i.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.i
  %5 = load i32, i32* %arrayidx.i.i, align 4, !tbaa !1
  %add6.i.i = add nsw i32 %5, %shiftCount.1.i.i
  %sub.i.256 = add nsw i32 %add6.i.i, -11
  %cmp1.i.257 = icmp slt i32 %add6.i.i, 11
  br i1 %cmp1.i.257, label %if.then.2.i, label %if.else.i.263

if.then.2.i:                                      ; preds = %if.then.i.258
  %sub3.i = sub i32 11, %add6.i.i
  %shr.i.259 = lshr i32 %a.1, %sub3.i
  %and.i.260 = and i32 %sub.i.256, 31
  %shl.i.261 = shl i32 %a.1, %and.i.260
  br label %if.end.i.264

if.else.i.263:                                    ; preds = %if.then.i.258
  %shl4.i.262 = shl i32 %a.1, %sub.i.256
  br label %if.end.i.264

if.end.i.264:                                     ; preds = %if.else.i.263, %if.then.2.i
  %aSig0.0 = phi i32 [ %shr.i.259, %if.then.2.i ], [ %shl4.i.262, %if.else.i.263 ]
  %storemerge.28.i = phi i32 [ %shl.i.261, %if.then.2.i ], [ 0, %if.else.i.263 ]
  %sub6.i = sub i32 -20, %add6.i.i
  br label %if.end.37

if.else.7.i:                                      ; preds = %if.end.36
  %cmp.i.32.i = icmp ult i32 %and.i, 65536
  %shl.i.33.i = shl i32 %a.0, 16
  %shl.a.i.34.i = select i1 %cmp.i.32.i, i32 %shl.i.33.i, i32 %and.i
  %..i.35.i = select i1 %cmp.i.32.i, i32 16, i32 0
  %cmp1.i.36.i = icmp ult i32 %shl.a.i.34.i, 16777216
  %add3.i.37.i = or i32 %..i.35.i, 8
  %shl4.i.38.i = shl i32 %shl.a.i.34.i, 8
  %a.addr.1.i.39.i = select i1 %cmp1.i.36.i, i32 %shl4.i.38.i, i32 %shl.a.i.34.i
  %shiftCount.1.i.40.i = select i1 %cmp1.i.36.i, i32 %add3.i.37.i, i32 %..i.35.i
  %shr.i.41.i = lshr i32 %a.addr.1.i.39.i, 24
  %arrayidx.i.42.i = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr.i.41.i
  %6 = load i32, i32* %arrayidx.i.42.i, align 4, !tbaa !1
  %add6.i.43.i = add nsw i32 %6, %shiftCount.1.i.40.i
  %sub9.i.265 = add nsw i32 %add6.i.43.i, -11
  %shl.i.29.i = shl i32 %a.1, %sub9.i.265
  %cmp.i.30.i = icmp eq i32 %sub9.i.265, 0
  br i1 %cmp.i.30.i, label %shortShift64Left.exit.i, label %cond.false.i.i

cond.false.i.i:                                   ; preds = %if.else.7.i
  %shl1.i.i = shl i32 %and.i, %sub9.i.265
  %sub.i.i.266 = sub i32 11, %add6.i.43.i
  %and.i.i = and i32 %sub.i.i.266, 31
  %shr.i.31.i = lshr i32 %a.1, %and.i.i
  %or.i.i = or i32 %shr.i.31.i, %shl1.i.i
  br label %shortShift64Left.exit.i

shortShift64Left.exit.i:                          ; preds = %cond.false.i.i, %if.else.7.i
  %cond.i.i = phi i32 [ %or.i.i, %cond.false.i.i ], [ %and.i, %if.else.7.i ]
  %sub10.i.267 = sub i32 12, %add6.i.43.i
  br label %if.end.37

if.end.37:                                        ; preds = %shortShift64Left.exit.i, %if.end.i.264, %if.end.30
  %aSig0.2 = phi i32 [ %and.i, %if.end.30 ], [ %aSig0.0, %if.end.i.264 ], [ %cond.i.i, %shortShift64Left.exit.i ]
  %aSig1.1 = phi i32 [ %a.1, %if.end.30 ], [ %storemerge.28.i, %if.end.i.264 ], [ %shl.i.29.i, %shortShift64Left.exit.i ]
  %aExp.0 = phi i32 [ %and.i.279, %if.end.30 ], [ %sub6.i, %if.end.i.264 ], [ %sub10.i.267, %shortShift64Left.exit.i ]
  %sub = add nsw i32 %aExp.0, -1023
  %shr = ashr i32 %sub, 1
  %add = add nsw i32 %shr, 1022
  %or38 = or i32 %aSig0.2, 1048576
  %shl1.i.249 = shl i32 %or38, 11
  %shr.i.250 = lshr i32 %aSig1.1, 21
  %or.i.251 = or i32 %shr.i.250, %shl1.i.249
  %7 = lshr i32 %aSig0.2, 16
  %and.i.186 = and i32 %7, 15
  %and1.i = and i32 %aExp.0, 1
  %tobool.i = icmp eq i32 %and1.i, 0
  %8 = lshr i32 %or38, 6
  %shr2.i = and i32 %8, 32767
  br i1 %tobool.i, label %if.else.i, label %if.then.i

if.then.i:                                        ; preds = %if.end.37
  %add.i.187 = add nuw nsw i32 %shr2.i, 16384
  %arrayidx.i = getelementptr inbounds [16 x i16], [16 x i16]* @estimateSqrt32.sqrtOddAdjustments, i32 0, i32 %and.i.186
  %9 = load i16, i16* %arrayidx.i, align 2, !tbaa !26
  %conv.i.188 = zext i16 %9 to i32
  %sub.i.189 = sub nsw i32 %add.i.187, %conv.i.188
  %div.i.190 = udiv i32 %or.i.251, %sub.i.189
  %shl.i.191 = shl i32 %div.i.190, 14
  %shl3.i.192 = shl i32 %sub.i.189, 15
  %add4.i = add i32 %shl3.i.192, %shl.i.191
  %shr5.i = lshr i32 %or.i.251, 1
  br label %if.end.19.i

if.else.i:                                        ; preds = %if.end.37
  %add7.i = or i32 %shr2.i, 32768
  %arrayidx8.i = getelementptr inbounds [16 x i16], [16 x i16]* @estimateSqrt32.sqrtEvenAdjustments, i32 0, i32 %and.i.186
  %10 = load i16, i16* %arrayidx8.i, align 2, !tbaa !26
  %conv9.i = zext i16 %10 to i32
  %sub10.i = sub nsw i32 %add7.i, %conv9.i
  %div11.i.193 = udiv i32 %or.i.251, %sub10.i
  %add12.i = add i32 %sub10.i, %div11.i.193
  %cmp.i.194 = icmp ugt i32 %add12.i, 131071
  %shl14.i = shl i32 %add12.i, 15
  %cond.i.195 = select i1 %cmp.i.194, i32 -32768, i32 %shl14.i
  %cmp15.i = icmp ugt i32 %cond.i.195, %or.i.251
  br i1 %cmp15.i, label %if.end.19.i, label %if.then.17.i

if.then.17.i:                                     ; preds = %if.else.i
  %shr18.i = ashr i32 %or.i.251, 1
  br label %estimateSqrt32.exit

if.end.19.i:                                      ; preds = %if.else.i, %if.then.i
  %a.addr.0.i = phi i32 [ %shr5.i, %if.then.i ], [ %or.i.251, %if.else.i ]
  %z.0.i = phi i32 [ %add4.i, %if.then.i ], [ %cond.i.195, %if.else.i ]
  %cmp.i.197 = icmp ugt i32 %z.0.i, %a.addr.0.i
  br i1 %cmp.i.197, label %if.end.i.201, label %estimateDiv64To32.exit247

if.end.i.201:                                     ; preds = %if.end.19.i
  %shr.i.198 = lshr i32 %z.0.i, 16
  %shl.i.199 = shl nuw i32 %shr.i.198, 16
  %cmp1.i.200 = icmp ugt i32 %shl.i.199, %a.addr.0.i
  br i1 %cmp1.i.200, label %cond.false.i.204, label %cond.end.i.219

cond.false.i.204:                                 ; preds = %if.end.i.201
  %div.i.202 = udiv i32 %a.addr.0.i, %shr.i.198
  %shl2.i.203 = shl i32 %div.i.202, 16
  br label %cond.end.i.219

cond.end.i.219:                                   ; preds = %cond.false.i.204, %if.end.i.201
  %cond.i.205 = phi i32 [ %shl2.i.203, %cond.false.i.204 ], [ -65536, %if.end.i.201 ]
  %shr3.i.i.206 = lshr exact i32 %cond.i.205, 16
  %conv5.i.i.207 = and i32 %z.0.i, 65535
  %mul9.i.i.208 = mul nuw i32 %shr3.i.i.206, %conv5.i.i.207
  %mul15.i.i.209 = mul nuw i32 %shr3.i.i.206, %shr.i.198
  %shr17.i.i.210 = lshr i32 %mul9.i.i.208, 16
  %shl20.i.i.211 = shl i32 %mul9.i.i.208, 16
  %sub.i.i.212 = sub i32 0, %shl20.i.i.211
  %cmp.i.39.i.213 = icmp ne i32 %shl20.i.i.211, 0
  %conv.neg.i.i.214 = sext i1 %cmp.i.39.i.213 to i32
  %add24.i.neg.i.215 = sub i32 %a.addr.0.i, %mul15.i.i.209
  %sub1.i.i.216 = sub i32 %add24.i.neg.i.215, %shr17.i.i.210
  %sub2.i.i.217 = add i32 %sub1.i.i.216, %conv.neg.i.i.214
  %cmp3.45.i.218 = icmp slt i32 %sub2.i.i.217, 0
  br i1 %cmp3.45.i.218, label %while.body.lr.ph.i.221, label %while.end.i.240

while.body.lr.ph.i.221:                           ; preds = %cond.end.i.219
  %shl4.i.220 = shl i32 %z.0.i, 16
  br label %while.body.i.232

while.body.i.232:                                 ; preds = %while.body.i.232, %while.body.lr.ph.i.221
  %z.048.i.222 = phi i32 [ %cond.i.205, %while.body.lr.ph.i.221 ], [ %sub.i.225, %while.body.i.232 ]
  %rem0.047.i.223 = phi i32 [ %sub2.i.i.217, %while.body.lr.ph.i.221 ], [ %add2.i.i.230, %while.body.i.232 ]
  %rem1.046.i.224 = phi i32 [ %sub.i.i.212, %while.body.lr.ph.i.221 ], [ %add.i.37.i.226, %while.body.i.232 ]
  %sub.i.225 = add i32 %z.048.i.222, -65536
  %add.i.37.i.226 = add i32 %rem1.046.i.224, %shl4.i.220
  %add1.i.i.227 = add i32 %rem0.047.i.223, %shr.i.198
  %cmp.i.38.i.228 = icmp ult i32 %add.i.37.i.226, %rem1.046.i.224
  %conv.i.i.229 = zext i1 %cmp.i.38.i.228 to i32
  %add2.i.i.230 = add i32 %add1.i.i.227, %conv.i.i.229
  %cmp3.i.231 = icmp slt i32 %add2.i.i.230, 0
  br i1 %cmp3.i.231, label %while.body.i.232, label %while.end.i.240.loopexit

while.end.i.240.loopexit:                         ; preds = %while.body.i.232
  %add2.i.i.230.lcssa = phi i32 [ %add2.i.i.230, %while.body.i.232 ]
  %add.i.37.i.226.lcssa = phi i32 [ %add.i.37.i.226, %while.body.i.232 ]
  %sub.i.225.lcssa = phi i32 [ %sub.i.225, %while.body.i.232 ]
  br label %while.end.i.240

while.end.i.240:                                  ; preds = %while.end.i.240.loopexit, %cond.end.i.219
  %z.0.lcssa.i.233 = phi i32 [ %cond.i.205, %cond.end.i.219 ], [ %sub.i.225.lcssa, %while.end.i.240.loopexit ]
  %rem0.0.lcssa.i.234 = phi i32 [ %sub2.i.i.217, %cond.end.i.219 ], [ %add2.i.i.230.lcssa, %while.end.i.240.loopexit ]
  %rem1.0.lcssa.i.235 = phi i32 [ %sub.i.i.212, %cond.end.i.219 ], [ %add.i.37.i.226.lcssa, %while.end.i.240.loopexit ]
  %shl5.i.236 = shl i32 %rem0.0.lcssa.i.234, 16
  %shr6.i.237 = lshr i32 %rem1.0.lcssa.i.235, 16
  %or.i.238 = or i32 %shr6.i.237, %shl5.i.236
  %cmp8.i.239 = icmp ugt i32 %shl.i.199, %or.i.238
  br i1 %cmp8.i.239, label %cond.false.10.i.242, label %cond.end.12.i.245

cond.false.10.i.242:                              ; preds = %while.end.i.240
  %div11.i.241 = udiv i32 %or.i.238, %shr.i.198
  br label %cond.end.12.i.245

cond.end.12.i.245:                                ; preds = %cond.false.10.i.242, %while.end.i.240
  %cond13.i.243 = phi i32 [ %div11.i.241, %cond.false.10.i.242 ], [ 65535, %while.end.i.240 ]
  %or14.i.244 = or i32 %cond13.i.243, %z.0.lcssa.i.233
  %phitmp = lshr i32 %or14.i.244, 1
  br label %estimateDiv64To32.exit247

estimateDiv64To32.exit247:                        ; preds = %if.end.19.i, %cond.end.12.i.245
  %retval.0.i.246 = phi i32 [ %phitmp, %cond.end.12.i.245 ], [ 2147483647, %if.end.19.i ]
  %shr21.i = lshr i32 %z.0.i, 1
  %add22.i = add nuw i32 %retval.0.i.246, %shr21.i
  br label %estimateSqrt32.exit

estimateSqrt32.exit:                              ; preds = %if.then.17.i, %estimateDiv64To32.exit247
  %retval.0.i.196 = phi i32 [ %add22.i, %estimateDiv64To32.exit247 ], [ %shr18.i, %if.then.17.i ]
  %shr40 = lshr i32 %retval.0.i.196, 1
  %add41 = add nuw i32 %shr40, 1
  %add45 = shl i32 %add41, 1
  %sub46 = sub nsw i32 9, %and1.i
  %shl.i.177 = shl i32 %aSig1.1, %sub46
  %shl1.i = shl i32 %or38, %sub46
  %sub.i.178 = sub nsw i32 0, %sub46
  %and.i.179 = and i32 %sub.i.178, 31
  %shr.i.180 = lshr i32 %aSig1.1, %and.i.179
  %or.i.181 = or i32 %shr.i.180, %shl1.i
  %shr.i.157 = lshr i32 %add41, 16
  %conv5.i.159 = and i32 %add41, 65535
  %mul.i.161 = mul nuw i32 %conv5.i.159, %conv5.i.159
  %mul9.i.162 = mul nuw i32 %shr.i.157, %conv5.i.159
  %mul15.i.164 = mul nuw i32 %shr.i.157, %shr.i.157
  %add.i.165 = shl i32 %mul9.i.162, 1
  %cmp.i.166 = icmp ult i32 %add.i.165, %mul9.i.162
  %conv16.i.167 = zext i1 %cmp.i.166 to i32
  %shl.i.168 = shl nuw nsw i32 %conv16.i.167, 16
  %11 = lshr i32 %mul9.i.162, 15
  %shr17.i.169 = and i32 %11, 65535
  %add18.i.170 = or i32 %shl.i.168, %shr17.i.169
  %shl20.i.172 = shl i32 %mul9.i.162, 17
  %add21.i.173 = add i32 %shl20.i.172, %mul.i.161
  %cmp22.i.174 = icmp ult i32 %add21.i.173, %shl20.i.172
  %sub.i.152 = sub i32 %shl.i.177, %add21.i.173
  %conv23.i.175.neg = sext i1 %cmp22.i.174 to i32
  %cmp.i.154 = icmp ult i32 %shl.i.177, %add21.i.173
  %conv.neg.i.155 = sext i1 %cmp.i.154 to i32
  %add19.i.171.neg = sub i32 %or.i.181, %mul15.i.164
  %add24.i.176.neg = add i32 %add19.i.171.neg, %conv23.i.175.neg
  %sub1.i.153 = add i32 %add24.i.176.neg, %conv.neg.i.155
  %sub2.i.156 = sub i32 %sub1.i.153, %add18.i.170
  %cmp47.340 = icmp slt i32 %sub2.i.156, 0
  br i1 %cmp47.340, label %while.body.preheader, label %while.end

while.body.preheader:                             ; preds = %estimateSqrt32.exit
  br label %while.body

while.body:                                       ; preds = %while.body.preheader, %while.body
  %doubleZSig0.0344 = phi i32 [ %sub48, %while.body ], [ %add45, %while.body.preheader ]
  %rem1.0343 = phi i32 [ %add.i.149, %while.body ], [ %sub.i.152, %while.body.preheader ]
  %rem0.0342 = phi i32 [ %add2.i, %while.body ], [ %sub2.i.156, %while.body.preheader ]
  %zSig0.0341 = phi i32 [ %dec, %while.body ], [ %add41, %while.body.preheader ]
  %dec = add i32 %zSig0.0341, -1
  %sub48 = add i32 %doubleZSig0.0344, -2
  %or49 = or i32 %sub48, 1
  %add.i.149 = add i32 %or49, %rem1.0343
  %cmp.i.150 = icmp ult i32 %add.i.149, %rem1.0343
  %conv.i.151 = zext i1 %cmp.i.150 to i32
  %add2.i = add i32 %conv.i.151, %rem0.0342
  %cmp47 = icmp slt i32 %add2.i, 0
  br i1 %cmp47, label %while.body, label %while.end.loopexit

while.end.loopexit:                               ; preds = %while.body
  %add.i.149.lcssa = phi i32 [ %add.i.149, %while.body ]
  %sub48.lcssa = phi i32 [ %sub48, %while.body ]
  %dec.lcssa = phi i32 [ %dec, %while.body ]
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %estimateSqrt32.exit
  %doubleZSig0.0.lcssa = phi i32 [ %add45, %estimateSqrt32.exit ], [ %sub48.lcssa, %while.end.loopexit ]
  %rem1.0.lcssa = phi i32 [ %sub.i.152, %estimateSqrt32.exit ], [ %add.i.149.lcssa, %while.end.loopexit ]
  %zSig0.0.lcssa = phi i32 [ %add41, %estimateSqrt32.exit ], [ %dec.lcssa, %while.end.loopexit ]
  %cmp.i.144 = icmp ugt i32 %doubleZSig0.0.lcssa, %rem1.0.lcssa
  br i1 %cmp.i.144, label %if.end.i, label %if.end.68

if.end.i:                                         ; preds = %while.end
  %shr.i.145 = lshr i32 %doubleZSig0.0.lcssa, 16
  %shl.i.146 = shl nuw i32 %shr.i.145, 16
  %cmp1.i = icmp ugt i32 %shl.i.146, %rem1.0.lcssa
  br i1 %cmp1.i, label %cond.false.i, label %cond.end.i

cond.false.i:                                     ; preds = %if.end.i
  %div.i = udiv i32 %rem1.0.lcssa, %shr.i.145
  %shl2.i = shl i32 %div.i, 16
  br label %cond.end.i

cond.end.i:                                       ; preds = %cond.false.i, %if.end.i
  %cond.i = phi i32 [ %shl2.i, %cond.false.i ], [ -65536, %if.end.i ]
  %shr3.i.i = lshr exact i32 %cond.i, 16
  %conv5.i.i = and i32 %doubleZSig0.0.lcssa, 65534
  %mul9.i.i = mul nuw i32 %shr3.i.i, %conv5.i.i
  %mul15.i.i = mul nuw i32 %shr3.i.i, %shr.i.145
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
  %z.048.i = phi i32 [ %cond.i, %while.body.lr.ph.i ], [ %sub.i.147, %while.body.i ]
  %rem0.047.i = phi i32 [ %sub2.i.i, %while.body.lr.ph.i ], [ %add2.i.i, %while.body.i ]
  %rem1.046.i = phi i32 [ %sub.i.i, %while.body.lr.ph.i ], [ %add.i.37.i, %while.body.i ]
  %sub.i.147 = add i32 %z.048.i, -65536
  %add.i.37.i = add i32 %rem1.046.i, %shl4.i
  %add1.i.i = add i32 %rem0.047.i, %shr.i.145
  %cmp.i.38.i = icmp ult i32 %add.i.37.i, %rem1.046.i
  %conv.i.i = zext i1 %cmp.i.38.i to i32
  %add2.i.i = add i32 %add1.i.i, %conv.i.i
  %cmp3.i = icmp slt i32 %add2.i.i, 0
  br i1 %cmp3.i, label %while.body.i, label %while.end.i.loopexit

while.end.i.loopexit:                             ; preds = %while.body.i
  %add2.i.i.lcssa = phi i32 [ %add2.i.i, %while.body.i ]
  %add.i.37.i.lcssa = phi i32 [ %add.i.37.i, %while.body.i ]
  %sub.i.147.lcssa = phi i32 [ %sub.i.147, %while.body.i ]
  br label %while.end.i

while.end.i:                                      ; preds = %while.end.i.loopexit, %cond.end.i
  %z.0.lcssa.i = phi i32 [ %cond.i, %cond.end.i ], [ %sub.i.147.lcssa, %while.end.i.loopexit ]
  %rem0.0.lcssa.i = phi i32 [ %sub2.i.i, %cond.end.i ], [ %add2.i.i.lcssa, %while.end.i.loopexit ]
  %rem1.0.lcssa.i = phi i32 [ %sub.i.i, %cond.end.i ], [ %add.i.37.i.lcssa, %while.end.i.loopexit ]
  %shl5.i = shl i32 %rem0.0.lcssa.i, 16
  %shr6.i = lshr i32 %rem1.0.lcssa.i, 16
  %or.i.148 = or i32 %shr6.i, %shl5.i
  %cmp8.i = icmp ugt i32 %shl.i.146, %or.i.148
  br i1 %cmp8.i, label %cond.false.10.i, label %estimateDiv64To32.exit

cond.false.10.i:                                  ; preds = %while.end.i
  %div11.i = udiv i32 %or.i.148, %shr.i.145
  br label %estimateDiv64To32.exit

estimateDiv64To32.exit:                           ; preds = %while.end.i, %cond.false.10.i
  %cond13.i = phi i32 [ %div11.i, %cond.false.10.i ], [ 65535, %while.end.i ]
  %or14.i = or i32 %cond13.i, %z.0.lcssa.i
  %and51 = and i32 %or14.i, 510
  %cmp52 = icmp ult i32 %and51, 6
  br i1 %cmp52, label %if.then.53, label %if.end.68

if.then.53:                                       ; preds = %estimateDiv64To32.exit
  %cmp54 = icmp eq i32 %or14.i, 0
  %.or14.i = select i1 %cmp54, i32 1, i32 %or14.i
  %shr3.i.125 = lshr i32 %.or14.i, 16
  %conv6.i.127 = and i32 %.or14.i, 65535
  %mul.i.128 = mul nuw i32 %conv6.i.127, %conv5.i.i
  %mul9.i.129 = mul nuw i32 %shr3.i.125, %conv5.i.i
  %mul12.i.130 = mul nuw i32 %conv6.i.127, %shr.i.145
  %mul15.i.131 = mul nuw i32 %shr3.i.125, %shr.i.145
  %add.i.132 = add i32 %mul9.i.129, %mul12.i.130
  %cmp.i.133 = icmp ult i32 %add.i.132, %mul12.i.130
  %conv16.i.134 = zext i1 %cmp.i.133 to i32
  %shl.i.135 = shl nuw nsw i32 %conv16.i.134, 16
  %shr17.i.136 = lshr i32 %add.i.132, 16
  %add18.i.137 = or i32 %shl.i.135, %shr17.i.136
  %shl20.i.139 = shl i32 %add.i.132, 16
  %add21.i.140 = add i32 %shl20.i.139, %mul.i.128
  %cmp22.i.141 = icmp ult i32 %add21.i.140, %shl20.i.139
  %sub.i.121 = sub i32 0, %add21.i.140
  %conv23.i.142.neg = sext i1 %cmp22.i.141 to i32
  %cmp.i.123 = icmp ne i32 %add21.i.140, 0
  %conv.neg.i = sext i1 %cmp.i.123 to i32
  %mul.i = mul nuw i32 %conv6.i.127, %conv6.i.127
  %mul9.i = mul nuw i32 %shr3.i.125, %conv6.i.127
  %mul15.i = mul nuw i32 %shr3.i.125, %shr3.i.125
  %add.i.118 = shl i32 %mul9.i, 1
  %cmp.i.119 = icmp ult i32 %add.i.118, %mul9.i
  %conv16.i = zext i1 %cmp.i.119 to i32
  %shl.i.120 = shl nuw nsw i32 %conv16.i, 16
  %12 = lshr i32 %mul9.i, 15
  %shr17.i = and i32 %12, 65535
  %add18.i = or i32 %shl.i.120, %shr17.i
  %shl20.i = shl i32 %mul9.i, 17
  %add21.i = add i32 %shl20.i, %mul.i
  %cmp22.i = icmp ult i32 %add21.i, %shl20.i
  %conv23.i = zext i1 %cmp22.i to i32
  %add19.i = add i32 %conv23.i, %mul15.i
  %add24.i = add i32 %add19.i, %add18.i
  %sub.i = sub i32 0, %add21.i
  %cmp.i.114 = icmp ne i32 %add21.i, 0
  %conv.i.115 = zext i1 %cmp.i.114 to i32
  %sub1.i = sub i32 %sub.i.121, %add24.i
  %cmp2.i.116 = icmp ugt i32 %add24.i, %sub.i.121
  %cmp5.i = icmp ult i32 %sub1.i, %conv.i.115
  %conv6.neg.i = sext i1 %cmp5.i to i32
  %sub8.i = sub i32 %sub1.i, %conv.i.115
  %conv3.neg.i = sext i1 %cmp2.i.116 to i32
  %add19.i.138.neg = sub i32 %rem1.0.lcssa, %mul15.i.131
  %add24.i.143.neg = sub i32 %add19.i.138.neg, %add18.i.137
  %sub1.i.122 = add i32 %add24.i.143.neg, %conv23.i.142.neg
  %sub2.i = add i32 %sub1.i.122, %conv.neg.i
  %sub7.i = add i32 %sub2.i, %conv3.neg.i
  %sub9.i = add i32 %sub7.i, %conv6.neg.i
  %cmp58.332 = icmp slt i32 %sub9.i, 0
  br i1 %cmp58.332, label %while.body.59.preheader, label %while.end.63

while.body.59.preheader:                          ; preds = %if.then.53
  br label %while.body.59

while.body.59:                                    ; preds = %while.body.59.preheader, %while.body.59
  %rem3.0336 = phi i32 [ %add.i, %while.body.59 ], [ %sub.i, %while.body.59.preheader ]
  %rem2.0335 = phi i32 [ %add5.i, %while.body.59 ], [ %sub8.i, %while.body.59.preheader ]
  %rem1.1334 = phi i32 [ %add9.i, %while.body.59 ], [ %sub9.i, %while.body.59.preheader ]
  %zSig1.1333 = phi i32 [ %dec60, %while.body.59 ], [ %.or14.i, %while.body.59.preheader ]
  %dec60 = add i32 %zSig1.1333, -1
  %shl.i.112 = shl i32 %dec60, 1
  %shr.i.113 = lshr i32 %dec60, 31
  %or61 = or i32 %shl.i.112, 1
  %or62 = or i32 %shr.i.113, %doubleZSig0.0.lcssa
  %add.i = add i32 %or61, %rem3.0336
  %cmp.i = icmp ult i32 %add.i, %rem3.0336
  %conv.i = zext i1 %cmp.i to i32
  %add1.i = add i32 %or62, %rem2.0335
  %cmp2.i = icmp ult i32 %add1.i, %rem2.0335
  %conv3.i = zext i1 %cmp2.i to i32
  %add5.i = add i32 %conv.i, %add1.i
  %cmp6.i = icmp ult i32 %add5.i, %conv.i
  %conv7.i = zext i1 %cmp6.i to i32
  %add8.i = add i32 %conv3.i, %rem1.1334
  %add9.i = add i32 %add8.i, %conv7.i
  %cmp58 = icmp slt i32 %add9.i, 0
  br i1 %cmp58, label %while.body.59, label %while.end.63.loopexit

while.end.63.loopexit:                            ; preds = %while.body.59
  %add9.i.lcssa = phi i32 [ %add9.i, %while.body.59 ]
  %add5.i.lcssa = phi i32 [ %add5.i, %while.body.59 ]
  %add.i.lcssa = phi i32 [ %add.i, %while.body.59 ]
  %dec60.lcssa = phi i32 [ %dec60, %while.body.59 ]
  br label %while.end.63

while.end.63:                                     ; preds = %while.end.63.loopexit, %if.then.53
  %rem3.0.lcssa = phi i32 [ %sub.i, %if.then.53 ], [ %add.i.lcssa, %while.end.63.loopexit ]
  %rem2.0.lcssa = phi i32 [ %sub8.i, %if.then.53 ], [ %add5.i.lcssa, %while.end.63.loopexit ]
  %rem1.1.lcssa = phi i32 [ %sub9.i, %if.then.53 ], [ %add9.i.lcssa, %while.end.63.loopexit ]
  %zSig1.1.lcssa = phi i32 [ %.or14.i, %if.then.53 ], [ %dec60.lcssa, %while.end.63.loopexit ]
  %or64 = or i32 %rem2.0.lcssa, %rem1.1.lcssa
  %or65 = or i32 %or64, %rem3.0.lcssa
  %cmp66 = icmp ne i32 %or65, 0
  %conv = zext i1 %cmp66 to i32
  %or67 = or i32 %conv, %zSig1.1.lcssa
  br label %if.end.68

if.end.68:                                        ; preds = %while.end, %while.end.63, %estimateDiv64To32.exit
  %zSig1.2 = phi i32 [ %or67, %while.end.63 ], [ %or14.i, %estimateDiv64To32.exit ], [ -1, %while.end ]
  %shl.i = shl i32 %zSig1.2, 22
  %shl3.i = shl i32 %zSig0.0.lcssa, 22
  %shr.i = lshr i32 %zSig1.2, 10
  %or.i = or i32 %shr.i, %shl3.i
  %shr4.i = lshr i32 %zSig0.0.lcssa, 10
  tail call fastcc void @roundAndPackFloat64(%struct.float64* noalias %agg.result, i32 0, i32 %add, i32 %shr4.i, i32 %or.i, i32 %shl.i)
  br label %cleanup

cleanup:                                          ; preds = %cond.false.i.276, %cond.true.i, %if.end.68, %if.then.35, %invalid, %if.then.26, %if.then.18
  ret void
}

; Function Attrs: nounwind
define i32 @float64_eq(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #2 {
entry:
  %and.i = and i32 %a.0, 2146435072
  %cmp = icmp eq i32 %and.i, 2146435072
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %and.i.82 = and i32 %a.0, 1048575
  %or = or i32 %and.i.82, %a.1
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %and.i.81 = and i32 %b.0, 2146435072
  %cmp15 = icmp eq i32 %and.i.81, 2146435072
  br i1 %cmp15, label %land.lhs.true.16, label %if.end.35

land.lhs.true.16:                                 ; preds = %lor.lhs.false
  %and.i.79 = and i32 %b.0, 1048575
  %or23 = or i32 %and.i.79, %b.1
  %tobool24 = icmp eq i32 %or23, 0
  br i1 %tobool24, label %if.end.35, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.16
  %and.i.70 = and i32 %a.0, 2146959360
  %cmp.i.71 = icmp eq i32 %and.i.70, 2146435072
  br i1 %cmp.i.71, label %land.rhs.i.73, label %lor.lhs.false.29

land.rhs.i.73:                                    ; preds = %if.then
  %and4.i.74 = and i32 %a.0, 524287
  %0 = or i32 %and4.i.74, %a.1
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %lor.lhs.false.29, label %if.then.34

lor.lhs.false.29:                                 ; preds = %land.rhs.i.73, %if.then
  %and.i.69 = and i32 %b.0, 2146959360
  %cmp.i = icmp eq i32 %and.i.69, 2146435072
  br i1 %cmp.i, label %land.rhs.i, label %return

land.rhs.i:                                       ; preds = %lor.lhs.false.29
  %and4.i = and i32 %b.0, 524287
  %2 = or i32 %and4.i, %b.1
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %return, label %if.then.34

if.then.34:                                       ; preds = %land.rhs.i.73, %land.rhs.i
  %4 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %4, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %return

if.end.35:                                        ; preds = %land.lhs.true.16, %lor.lhs.false
  %cmp38 = icmp eq i32 %a.1, %b.1
  br i1 %cmp38, label %land.rhs, label %land.end.49

land.rhs:                                         ; preds = %if.end.35
  %cmp41 = icmp eq i32 %a.0, %b.0
  br i1 %cmp41, label %land.end.49, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %cmp43 = icmp eq i32 %a.1, 0
  br i1 %cmp43, label %land.rhs.44, label %land.end.49

land.rhs.44:                                      ; preds = %lor.rhs
  %or47 = or i32 %b.0, %a.0
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
  %and.i = and i32 %a.0, 2146435072
  %cmp = icmp eq i32 %and.i, 2146435072
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %and.i.94 = and i32 %a.0, 1048575
  %or = or i32 %and.i.94, %a.1
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %and.i.93 = and i32 %b.0, 2146435072
  %cmp15 = icmp eq i32 %and.i.93, 2146435072
  br i1 %cmp15, label %land.lhs.true.16, label %if.end

land.lhs.true.16:                                 ; preds = %lor.lhs.false
  %and.i.91 = and i32 %b.0, 1048575
  %or23 = or i32 %and.i.91, %b.1
  %tobool24 = icmp eq i32 %or23, 0
  br i1 %tobool24, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.16
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %0, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end:                                           ; preds = %land.lhs.true.16, %lor.lhs.false
  %shr.i.90 = lshr i32 %a.0, 31
  %shr.i.89 = lshr i32 %b.0, 31
  %cmp31 = icmp eq i32 %shr.i.90, %shr.i.89
  %tobool33 = icmp ne i32 %shr.i.90, 0
  br i1 %cmp31, label %if.end.42, label %if.then.32

if.then.32:                                       ; preds = %if.end
  br i1 %tobool33, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.then.32
  %or36 = or i32 %b.0, %a.0
  %shl = shl i32 %or36, 1
  %or38 = or i32 %b.1, %a.1
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
  %cmp.i.82 = icmp ult i32 %b.0, %a.0
  br i1 %cmp.i.82, label %le64.exit88, label %lor.rhs.i.86

lor.rhs.i.86:                                     ; preds = %cond.true
  %cmp1.i.83 = icmp eq i32 %b.0, %a.0
  %cmp2.i.84 = icmp ule i32 %b.1, %a.1
  %cmp2..i.85 = and i1 %cmp1.i.83, %cmp2.i.84
  br label %le64.exit88

le64.exit88:                                      ; preds = %cond.true, %lor.rhs.i.86
  %2 = phi i1 [ true, %cond.true ], [ %cmp2..i.85, %lor.rhs.i.86 ]
  %lor.ext.i.87 = zext i1 %2 to i32
  br label %cleanup

cond.false:                                       ; preds = %if.end.42
  %cmp.i = icmp ult i32 %a.0, %b.0
  br i1 %cmp.i, label %le64.exit, label %lor.rhs.i

lor.rhs.i:                                        ; preds = %cond.false
  %cmp1.i = icmp eq i32 %a.0, %b.0
  %cmp2.i = icmp ule i32 %a.1, %b.1
  %cmp2..i = and i1 %cmp1.i, %cmp2.i
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
  %and.i = and i32 %a.0, 2146435072
  %cmp = icmp eq i32 %and.i, 2146435072
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %and.i.94 = and i32 %a.0, 1048575
  %or = or i32 %and.i.94, %a.1
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %and.i.93 = and i32 %b.0, 2146435072
  %cmp15 = icmp eq i32 %and.i.93, 2146435072
  br i1 %cmp15, label %land.lhs.true.16, label %if.end

land.lhs.true.16:                                 ; preds = %lor.lhs.false
  %and.i.91 = and i32 %b.0, 1048575
  %or23 = or i32 %and.i.91, %b.1
  %tobool24 = icmp eq i32 %or23, 0
  br i1 %tobool24, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.16
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %0, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end:                                           ; preds = %land.lhs.true.16, %lor.lhs.false
  %shr.i.90 = lshr i32 %a.0, 31
  %shr.i.89 = lshr i32 %b.0, 31
  %cmp31 = icmp eq i32 %shr.i.90, %shr.i.89
  %tobool33 = icmp ne i32 %shr.i.90, 0
  br i1 %cmp31, label %if.end.42, label %if.then.32

if.then.32:                                       ; preds = %if.end
  br i1 %tobool33, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.then.32
  %or36 = or i32 %b.0, %a.0
  %shl = shl i32 %or36, 1
  %or38 = or i32 %b.1, %a.1
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
  %cmp.i.82 = icmp ult i32 %b.0, %a.0
  br i1 %cmp.i.82, label %lt64.exit88, label %lor.rhs.i.86

lor.rhs.i.86:                                     ; preds = %cond.true
  %cmp1.i.83 = icmp eq i32 %b.0, %a.0
  %cmp2.i.84 = icmp ult i32 %b.1, %a.1
  %cmp2..i.85 = and i1 %cmp1.i.83, %cmp2.i.84
  br label %lt64.exit88

lt64.exit88:                                      ; preds = %cond.true, %lor.rhs.i.86
  %2 = phi i1 [ true, %cond.true ], [ %cmp2..i.85, %lor.rhs.i.86 ]
  %lor.ext.i.87 = zext i1 %2 to i32
  br label %cleanup

cond.false:                                       ; preds = %if.end.42
  %cmp.i = icmp ult i32 %a.0, %b.0
  br i1 %cmp.i, label %lt64.exit, label %lor.rhs.i

lor.rhs.i:                                        ; preds = %cond.false
  %cmp1.i = icmp eq i32 %a.0, %b.0
  %cmp2.i = icmp ult i32 %a.1, %b.1
  %cmp2..i = and i1 %cmp1.i, %cmp2.i
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
  %and.i = and i32 %a.0, 2146435072
  %cmp = icmp eq i32 %and.i, 2146435072
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %and.i.57 = and i32 %a.0, 1048575
  %or = or i32 %and.i.57, %a.1
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %and.i.56 = and i32 %b.0, 2146435072
  %cmp15 = icmp eq i32 %and.i.56, 2146435072
  br i1 %cmp15, label %land.lhs.true.16, label %if.end

land.lhs.true.16:                                 ; preds = %lor.lhs.false
  %and.i.54 = and i32 %b.0, 1048575
  %or23 = or i32 %and.i.54, %b.1
  %tobool24 = icmp eq i32 %or23, 0
  br i1 %tobool24, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.16
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %0, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %return

if.end:                                           ; preds = %land.lhs.true.16, %lor.lhs.false
  %cmp27 = icmp eq i32 %a.1, %b.1
  br i1 %cmp27, label %land.rhs, label %land.end.38

land.rhs:                                         ; preds = %if.end
  %cmp30 = icmp eq i32 %a.0, %b.0
  br i1 %cmp30, label %land.end.38, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %cmp32 = icmp eq i32 %a.1, 0
  br i1 %cmp32, label %land.rhs.33, label %land.end.38

land.rhs.33:                                      ; preds = %lor.rhs
  %or36 = or i32 %b.0, %a.0
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
  %and.i = and i32 %a.0, 2146435072
  %cmp = icmp eq i32 %and.i, 2146435072
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %and.i.121 = and i32 %a.0, 1048575
  %or = or i32 %and.i.121, %a.1
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %and.i.120 = and i32 %b.0, 2146435072
  %cmp15 = icmp eq i32 %and.i.120, 2146435072
  br i1 %cmp15, label %land.lhs.true.16, label %if.end.35

land.lhs.true.16:                                 ; preds = %lor.lhs.false
  %and.i.118 = and i32 %b.0, 1048575
  %or23 = or i32 %and.i.118, %b.1
  %tobool24 = icmp eq i32 %or23, 0
  br i1 %tobool24, label %if.end.35, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.16
  %and.i.109 = and i32 %a.0, 2146959360
  %cmp.i.110 = icmp eq i32 %and.i.109, 2146435072
  br i1 %cmp.i.110, label %land.rhs.i.112, label %lor.lhs.false.29

land.rhs.i.112:                                   ; preds = %if.then
  %and4.i.113 = and i32 %a.0, 524287
  %0 = or i32 %and4.i.113, %a.1
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %lor.lhs.false.29, label %if.then.34

lor.lhs.false.29:                                 ; preds = %land.rhs.i.112, %if.then
  %and.i.106 = and i32 %b.0, 2146959360
  %cmp.i.107 = icmp eq i32 %and.i.106, 2146435072
  br i1 %cmp.i.107, label %land.rhs.i, label %cleanup

land.rhs.i:                                       ; preds = %lor.lhs.false.29
  %and4.i = and i32 %b.0, 524287
  %2 = or i32 %and4.i, %b.1
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %cleanup, label %if.then.34

if.then.34:                                       ; preds = %land.rhs.i.112, %land.rhs.i
  %4 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %4, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.35:                                        ; preds = %land.lhs.true.16, %lor.lhs.false
  %shr.i.105 = lshr i32 %a.0, 31
  %shr.i.104 = lshr i32 %b.0, 31
  %cmp42 = icmp eq i32 %shr.i.105, %shr.i.104
  %tobool44 = icmp ne i32 %shr.i.105, 0
  br i1 %cmp42, label %if.end.53, label %if.then.43

if.then.43:                                       ; preds = %if.end.35
  br i1 %tobool44, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.then.43
  %or47 = or i32 %b.0, %a.0
  %shl = shl i32 %or47, 1
  %or49 = or i32 %b.1, %a.1
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
  %cmp.i.97 = icmp ult i32 %b.0, %a.0
  br i1 %cmp.i.97, label %le64.exit103, label %lor.rhs.i.101

lor.rhs.i.101:                                    ; preds = %cond.true
  %cmp1.i.98 = icmp eq i32 %b.0, %a.0
  %cmp2.i.99 = icmp ule i32 %b.1, %a.1
  %cmp2..i.100 = and i1 %cmp1.i.98, %cmp2.i.99
  br label %le64.exit103

le64.exit103:                                     ; preds = %cond.true, %lor.rhs.i.101
  %6 = phi i1 [ true, %cond.true ], [ %cmp2..i.100, %lor.rhs.i.101 ]
  %lor.ext.i.102 = zext i1 %6 to i32
  br label %cleanup

cond.false:                                       ; preds = %if.end.53
  %cmp.i = icmp ult i32 %a.0, %b.0
  br i1 %cmp.i, label %le64.exit, label %lor.rhs.i

lor.rhs.i:                                        ; preds = %cond.false
  %cmp1.i = icmp eq i32 %a.0, %b.0
  %cmp2.i = icmp ule i32 %a.1, %b.1
  %cmp2..i = and i1 %cmp1.i, %cmp2.i
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
  %and.i = and i32 %a.0, 2146435072
  %cmp = icmp eq i32 %and.i, 2146435072
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %and.i.121 = and i32 %a.0, 1048575
  %or = or i32 %and.i.121, %a.1
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %and.i.120 = and i32 %b.0, 2146435072
  %cmp15 = icmp eq i32 %and.i.120, 2146435072
  br i1 %cmp15, label %land.lhs.true.16, label %if.end.35

land.lhs.true.16:                                 ; preds = %lor.lhs.false
  %and.i.118 = and i32 %b.0, 1048575
  %or23 = or i32 %and.i.118, %b.1
  %tobool24 = icmp eq i32 %or23, 0
  br i1 %tobool24, label %if.end.35, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.16
  %and.i.109 = and i32 %a.0, 2146959360
  %cmp.i.110 = icmp eq i32 %and.i.109, 2146435072
  br i1 %cmp.i.110, label %land.rhs.i.112, label %lor.lhs.false.29

land.rhs.i.112:                                   ; preds = %if.then
  %and4.i.113 = and i32 %a.0, 524287
  %0 = or i32 %and4.i.113, %a.1
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %lor.lhs.false.29, label %if.then.34

lor.lhs.false.29:                                 ; preds = %land.rhs.i.112, %if.then
  %and.i.106 = and i32 %b.0, 2146959360
  %cmp.i.107 = icmp eq i32 %and.i.106, 2146435072
  br i1 %cmp.i.107, label %land.rhs.i, label %cleanup

land.rhs.i:                                       ; preds = %lor.lhs.false.29
  %and4.i = and i32 %b.0, 524287
  %2 = or i32 %and4.i, %b.1
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %cleanup, label %if.then.34

if.then.34:                                       ; preds = %land.rhs.i.112, %land.rhs.i
  %4 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or.i = or i32 %4, 16
  store i32 %or.i, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.35:                                        ; preds = %land.lhs.true.16, %lor.lhs.false
  %shr.i.105 = lshr i32 %a.0, 31
  %shr.i.104 = lshr i32 %b.0, 31
  %cmp42 = icmp eq i32 %shr.i.105, %shr.i.104
  %tobool44 = icmp ne i32 %shr.i.105, 0
  br i1 %cmp42, label %if.end.53, label %if.then.43

if.then.43:                                       ; preds = %if.end.35
  br i1 %tobool44, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.then.43
  %or47 = or i32 %b.0, %a.0
  %shl = shl i32 %or47, 1
  %or49 = or i32 %b.1, %a.1
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
  %cmp.i.97 = icmp ult i32 %b.0, %a.0
  br i1 %cmp.i.97, label %lt64.exit103, label %lor.rhs.i.101

lor.rhs.i.101:                                    ; preds = %cond.true
  %cmp1.i.98 = icmp eq i32 %b.0, %a.0
  %cmp2.i.99 = icmp ult i32 %b.1, %a.1
  %cmp2..i.100 = and i1 %cmp1.i.98, %cmp2.i.99
  br label %lt64.exit103

lt64.exit103:                                     ; preds = %cond.true, %lor.rhs.i.101
  %6 = phi i1 [ true, %cond.true ], [ %cmp2..i.100, %lor.rhs.i.101 ]
  %lor.ext.i.102 = zext i1 %6 to i32
  br label %cleanup

cond.false:                                       ; preds = %if.end.53
  %cmp.i = icmp ult i32 %a.0, %b.0
  br i1 %cmp.i, label %lt64.exit, label %lor.rhs.i

lor.rhs.i:                                        ; preds = %cond.false
  %cmp1.i = icmp eq i32 %a.0, %b.0
  %cmp2.i = icmp ult i32 %a.1, %b.1
  %cmp2..i = and i1 %cmp1.i, %cmp2.i
  br label %lt64.exit

lt64.exit:                                        ; preds = %cond.false, %lor.rhs.i
  %7 = phi i1 [ true, %cond.false ], [ %cmp2..i, %lor.rhs.i ]
  %lor.ext.i = zext i1 %7 to i32
  br label %cleanup

cleanup:                                          ; preds = %land.rhs.i, %lor.lhs.false.29, %lt64.exit103, %lt64.exit, %if.then.34, %land.end
  %retval.0 = phi i32 [ %land.ext, %land.end ], [ 0, %if.then.34 ], [ %lor.ext.i.102, %lt64.exit103 ], [ %lor.ext.i, %lt64.exit ], [ 0, %lor.lhs.false.29 ], [ 0, %land.rhs.i ]
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
!6 = distinct !{!6, !7, !"packFloat64: %agg.result"}
!7 = distinct !{!7, !"packFloat64"}
!8 = !{!9}
!9 = distinct !{!9, !10, !"packFloat64: %agg.result"}
!10 = distinct !{!10, !"packFloat64"}
!11 = !{!12}
!12 = distinct !{!12, !13, !"float32ToCommonNaN: %agg.result"}
!13 = distinct !{!13, !"float32ToCommonNaN"}
!14 = !{!15}
!15 = distinct !{!15, !16, !"commonNaNToFloat64: %agg.result"}
!16 = distinct !{!16, !"commonNaNToFloat64"}
!17 = !{!18}
!18 = distinct !{!18, !19, !"packFloat64: %agg.result"}
!19 = distinct !{!19, !"packFloat64"}
!20 = !{!21}
!21 = distinct !{!21, !22, !"packFloat64: %agg.result"}
!22 = distinct !{!22, !"packFloat64"}
!23 = !{!24}
!24 = distinct !{!24, !25, !"packFloat64: %agg.result"}
!25 = distinct !{!25, !"packFloat64"}
!26 = !{!27, !27, i64 0}
!27 = !{!"short", !3, i64 0}
!28 = !{!29}
!29 = distinct !{!29, !30, !"float64ToCommonNaN: %agg.result"}
!30 = distinct !{!30, !"float64ToCommonNaN"}
!31 = !{!32}
!32 = distinct !{!32, !33, !"propagateFloat64NaN: %agg.result"}
!33 = distinct !{!33, !"propagateFloat64NaN"}
!34 = !{!35}
!35 = distinct !{!35, !36, !"packFloat64: %agg.result"}
!36 = distinct !{!36, !"packFloat64"}
!37 = !{!38}
!38 = distinct !{!38, !39, !"packFloat64: %agg.result"}
!39 = distinct !{!39, !"packFloat64"}
!40 = !{!41}
!41 = distinct !{!41, !42, !"packFloat64: %agg.result"}
!42 = distinct !{!42, !"packFloat64"}
!43 = !{!44}
!44 = distinct !{!44, !45, !"packFloat64: %agg.result"}
!45 = distinct !{!45, !"packFloat64"}
!46 = !{!47}
!47 = distinct !{!47, !48, !"packFloat64: %agg.result"}
!48 = distinct !{!48, !"packFloat64"}
!49 = !{!50}
!50 = distinct !{!50, !51, !"packFloat64: %agg.result"}
!51 = distinct !{!51, !"packFloat64"}
!52 = !{!53}
!53 = distinct !{!53, !54, !"propagateFloat64NaN: %agg.result"}
!54 = distinct !{!54, !"propagateFloat64NaN"}
!55 = !{!56}
!56 = distinct !{!56, !57, !"propagateFloat64NaN: %agg.result"}
!57 = distinct !{!57, !"propagateFloat64NaN"}
!58 = !{!59}
!59 = distinct !{!59, !60, !"packFloat64: %agg.result"}
!60 = distinct !{!60, !"packFloat64"}
!61 = !{!62}
!62 = distinct !{!62, !63, !"propagateFloat64NaN: %agg.result"}
!63 = distinct !{!63, !"propagateFloat64NaN"}
!64 = !{!65}
!65 = distinct !{!65, !66, !"packFloat64: %agg.result"}
!66 = distinct !{!66, !"packFloat64"}
!67 = !{!68}
!68 = distinct !{!68, !69, !"propagateFloat64NaN: %agg.result"}
!69 = distinct !{!69, !"propagateFloat64NaN"}
!70 = !{!71}
!71 = distinct !{!71, !72, !"packFloat64: %agg.result"}
!72 = distinct !{!72, !"packFloat64"}
!73 = !{!74}
!74 = distinct !{!74, !75, !"propagateFloat64NaN: %agg.result"}
!75 = distinct !{!75, !"propagateFloat64NaN"}
!76 = !{!77}
!77 = distinct !{!77, !78, !"packFloat64: %agg.result"}
!78 = distinct !{!78, !"packFloat64"}
!79 = !{!80}
!80 = distinct !{!80, !81, !"propagateFloat64NaN: %agg.result"}
!81 = distinct !{!81, !"propagateFloat64NaN"}
!82 = !{!83}
!83 = distinct !{!83, !84, !"propagateFloat64NaN: %agg.result"}
!84 = distinct !{!84, !"propagateFloat64NaN"}
!85 = !{!86}
!86 = distinct !{!86, !87, !"packFloat64: %agg.result"}
!87 = distinct !{!87, !"packFloat64"}
!88 = !{!89}
!89 = distinct !{!89, !90, !"propagateFloat64NaN: %agg.result"}
!90 = distinct !{!90, !"propagateFloat64NaN"}
!91 = !{!92}
!92 = distinct !{!92, !93, !"packFloat64: %agg.result"}
!93 = distinct !{!93, !"packFloat64"}
!94 = !{!95}
!95 = distinct !{!95, !96, !"packFloat64: %agg.result"}
!96 = distinct !{!96, !"packFloat64"}
!97 = !{!98}
!98 = distinct !{!98, !99, !"packFloat64: %agg.result"}
!99 = distinct !{!99, !"packFloat64"}
!100 = !{!101}
!101 = distinct !{!101, !102, !"packFloat64: %agg.result"}
!102 = distinct !{!102, !"packFloat64"}
!103 = !{!104}
!104 = distinct !{!104, !105, !"packFloat64: %agg.result"}
!105 = distinct !{!105, !"packFloat64"}
!106 = !{!107}
!107 = distinct !{!107, !108, !"packFloat64: %agg.result"}
!108 = distinct !{!108, !"packFloat64"}
!109 = !{!110}
!110 = distinct !{!110, !111, !"propagateFloat64NaN: %agg.result"}
!111 = distinct !{!111, !"propagateFloat64NaN"}
!112 = !{!113}
!113 = distinct !{!113, !114, !"propagateFloat64NaN: %agg.result"}
!114 = distinct !{!114, !"propagateFloat64NaN"}
!115 = !{!116}
!116 = distinct !{!116, !117, !"packFloat64: %agg.result"}
!117 = distinct !{!117, !"packFloat64"}
!118 = !{!119}
!119 = distinct !{!119, !120, !"propagateFloat64NaN: %agg.result"}
!120 = distinct !{!120, !"propagateFloat64NaN"}
!121 = !{!122}
!122 = distinct !{!122, !123, !"packFloat64: %agg.result"}
!123 = distinct !{!123, !"packFloat64"}
!124 = !{!125}
!125 = distinct !{!125, !126, !"packFloat64: %agg.result"}
!126 = distinct !{!126, !"packFloat64"}
!127 = !{!128}
!128 = distinct !{!128, !129, !"packFloat64: %agg.result"}
!129 = distinct !{!129, !"packFloat64"}
!130 = !{!131}
!131 = distinct !{!131, !132, !"propagateFloat64NaN: %agg.result"}
!132 = distinct !{!132, !"propagateFloat64NaN"}
!133 = !{!134}
!134 = distinct !{!134, !135, !"propagateFloat64NaN: %agg.result"}
!135 = distinct !{!135, !"propagateFloat64NaN"}
!136 = !{!137}
!137 = distinct !{!137, !138, !"propagateFloat64NaN: %agg.result"}
!138 = distinct !{!138, !"propagateFloat64NaN"}
!139 = !{!140}
!140 = distinct !{!140, !141, !"packFloat64: %agg.result"}
!141 = distinct !{!141, !"packFloat64"}
