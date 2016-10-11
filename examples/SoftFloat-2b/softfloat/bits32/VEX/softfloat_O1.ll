; ModuleID = 'softfloat.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

%struct.commonNaNT = type { i32, i32, i32 }
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

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

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
  %z0 = alloca i32, align 4
  %z1 = alloca i32, align 4
  %z2 = alloca i32, align 4
  %more1 = alloca i32, align 4
  %0 = bitcast i32* %z0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %0) #1
  %1 = bitcast i32* %z1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %1) #1
  %2 = bitcast i32* %z2 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %2) #1
  %3 = bitcast i32* %more1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %3) #1
  call void @mul32To64(i32 %a1, i32 %b, i32* nonnull %z1, i32* nonnull %z2)
  call void @mul32To64(i32 %a0, i32 %b, i32* nonnull %z0, i32* nonnull %more1)
  %4 = load i32, i32* %z0, align 4, !tbaa !1
  %5 = load i32, i32* %more1, align 4, !tbaa !1
  %6 = load i32, i32* %z1, align 4, !tbaa !1
  call void @add64(i32 %4, i32 %5, i32 0, i32 %6, i32* nonnull %z0, i32* nonnull %z1)
  %7 = load i32, i32* %z2, align 4, !tbaa !1
  store i32 %7, i32* %z2Ptr, align 4, !tbaa !1
  %8 = load i32, i32* %z1, align 4, !tbaa !1
  store i32 %8, i32* %z1Ptr, align 4, !tbaa !1
  %9 = load i32, i32* %z0, align 4, !tbaa !1
  store i32 %9, i32* %z0Ptr, align 4, !tbaa !1
  call void @llvm.lifetime.end(i64 4, i8* %3) #1
  call void @llvm.lifetime.end(i64 4, i8* %2) #1
  call void @llvm.lifetime.end(i64 4, i8* %1) #1
  call void @llvm.lifetime.end(i64 4, i8* %0) #1
  ret void
}

; Function Attrs: inlinehint nounwind
define void @mul64To128(i32 %a0, i32 %a1, i32 %b0, i32 %b1, i32* nocapture %z0Ptr, i32* nocapture %z1Ptr, i32* nocapture %z2Ptr, i32* nocapture %z3Ptr) #0 {
entry:
  %z0 = alloca i32, align 4
  %z1 = alloca i32, align 4
  %z2 = alloca i32, align 4
  %z3 = alloca i32, align 4
  %more1 = alloca i32, align 4
  %more2 = alloca i32, align 4
  %0 = bitcast i32* %z0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %0) #1
  %1 = bitcast i32* %z1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %1) #1
  %2 = bitcast i32* %z2 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %2) #1
  %3 = bitcast i32* %z3 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %3) #1
  %4 = bitcast i32* %more1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %4) #1
  %5 = bitcast i32* %more2 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %5) #1
  call void @mul32To64(i32 %a1, i32 %b1, i32* nonnull %z2, i32* nonnull %z3)
  call void @mul32To64(i32 %a1, i32 %b0, i32* nonnull %z1, i32* nonnull %more2)
  %6 = load i32, i32* %z1, align 4, !tbaa !1
  %7 = load i32, i32* %more2, align 4, !tbaa !1
  %8 = load i32, i32* %z2, align 4, !tbaa !1
  call void @add64(i32 %6, i32 %7, i32 0, i32 %8, i32* nonnull %z1, i32* nonnull %z2)
  call void @mul32To64(i32 %a0, i32 %b0, i32* nonnull %z0, i32* nonnull %more1)
  %9 = load i32, i32* %z0, align 4, !tbaa !1
  %10 = load i32, i32* %more1, align 4, !tbaa !1
  %11 = load i32, i32* %z1, align 4, !tbaa !1
  call void @add64(i32 %9, i32 %10, i32 0, i32 %11, i32* nonnull %z0, i32* nonnull %z1)
  call void @mul32To64(i32 %a0, i32 %b1, i32* nonnull %more1, i32* nonnull %more2)
  %12 = load i32, i32* %more1, align 4, !tbaa !1
  %13 = load i32, i32* %more2, align 4, !tbaa !1
  %14 = load i32, i32* %z2, align 4, !tbaa !1
  call void @add64(i32 %12, i32 %13, i32 0, i32 %14, i32* nonnull %more1, i32* nonnull %z2)
  %15 = load i32, i32* %z0, align 4, !tbaa !1
  %16 = load i32, i32* %z1, align 4, !tbaa !1
  %17 = load i32, i32* %more1, align 4, !tbaa !1
  call void @add64(i32 %15, i32 %16, i32 0, i32 %17, i32* nonnull %z0, i32* nonnull %z1)
  %18 = load i32, i32* %z3, align 4, !tbaa !1
  store i32 %18, i32* %z3Ptr, align 4, !tbaa !1
  %19 = load i32, i32* %z2, align 4, !tbaa !1
  store i32 %19, i32* %z2Ptr, align 4, !tbaa !1
  %20 = load i32, i32* %z1, align 4, !tbaa !1
  store i32 %20, i32* %z1Ptr, align 4, !tbaa !1
  %21 = load i32, i32* %z0, align 4, !tbaa !1
  store i32 %21, i32* %z0Ptr, align 4, !tbaa !1
  call void @llvm.lifetime.end(i64 4, i8* %5) #1
  call void @llvm.lifetime.end(i64 4, i8* %4) #1
  call void @llvm.lifetime.end(i64 4, i8* %3) #1
  call void @llvm.lifetime.end(i64 4, i8* %2) #1
  call void @llvm.lifetime.end(i64 4, i8* %1) #1
  call void @llvm.lifetime.end(i64 4, i8* %0) #1
  ret void
}

; Function Attrs: inlinehint nounwind readnone
define i32 @eq64(i32 %a0, i32 %a1, i32 %b0, i32 %b1) #2 {
entry:
  %cmp = icmp eq i32 %a0, %b0
  %cmp1 = icmp eq i32 %a1, %b1
  %cmp1. = and i1 %cmp, %cmp1
  %land.ext = zext i1 %cmp1. to i32
  ret i32 %land.ext
}

; Function Attrs: inlinehint nounwind readnone
define i32 @le64(i32 %a0, i32 %a1, i32 %b0, i32 %b1) #2 {
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
define i32 @lt64(i32 %a0, i32 %a1, i32 %b0, i32 %b1) #2 {
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
define i32 @ne64(i32 %a0, i32 %a1, i32 %b0, i32 %b1) #2 {
entry:
  %cmp1 = icmp ne i32 %a1, %b1
  %not.cmp = icmp ne i32 %a0, %b0
  %cmp1. = or i1 %not.cmp, %cmp1
  %lor.ext = zext i1 %cmp1. to i32
  ret i32 %lor.ext
}

; Function Attrs: nounwind
define void @float_raise(i32 %flags) #3 {
entry:
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or = or i32 %0, %flags
  store i32 %or, i32* @float_exception_flags, align 4, !tbaa !1
  ret void
}

; Function Attrs: nounwind readnone
define i32 @float32_is_nan(i32 %a) #4 {
entry:
  %0 = trunc i32 %a to i31
  %cmp = icmp ugt i31 %0, -8388608
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

; Function Attrs: nounwind readnone
define i32 @float32_is_signaling_nan(i32 %a) #4 {
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
define i32 @float64_is_nan(i32 %a.0, i32 %a.1) #4 {
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
define i32 @float64_is_signaling_nan(i32 %a.0, i32 %a.1) #4 {
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
define i32 @extractFloat32Frac(i32 %a) #2 {
entry:
  %and = and i32 %a, 8388607
  ret i32 %and
}

; Function Attrs: inlinehint nounwind readnone
define i32 @extractFloat32Exp(i32 %a) #2 {
entry:
  %shr = lshr i32 %a, 23
  %and = and i32 %shr, 255
  ret i32 %and
}

; Function Attrs: inlinehint nounwind readnone
define i32 @extractFloat32Sign(i32 %a) #2 {
entry:
  %shr = lshr i32 %a, 31
  ret i32 %shr
}

; Function Attrs: inlinehint nounwind readnone
define i32 @packFloat32(i32 %zSign, i32 %zExp, i32 %zSig) #2 {
entry:
  %shl = shl i32 %zSign, 31
  %shl1 = shl i32 %zExp, 23
  %add = add i32 %shl1, %shl
  %add2 = add i32 %add, %zSig
  ret i32 %add2
}

; Function Attrs: inlinehint nounwind readnone
define i32 @extractFloat64Frac1(i32 %a.0, i32 %a.1) #2 {
entry:
  ret i32 %a.1
}

; Function Attrs: inlinehint nounwind readnone
define i32 @extractFloat64Frac0(i32 %a.0, i32 %a.1) #2 {
entry:
  %and = and i32 %a.0, 1048575
  ret i32 %and
}

; Function Attrs: inlinehint nounwind readnone
define i32 @extractFloat64Exp(i32 %a.0, i32 %a.1) #2 {
entry:
  %shr = lshr i32 %a.0, 20
  %and = and i32 %shr, 2047
  ret i32 %and
}

; Function Attrs: inlinehint nounwind readnone
define i32 @extractFloat64Sign(i32 %a.0, i32 %a.1) #2 {
entry:
  %shr = lshr i32 %a.0, 31
  ret i32 %shr
}

; Function Attrs: inlinehint nounwind readnone
define i64 @packFloat64(i32 %zSign, i32 %zExp, i32 %zSig0, i32 %zSig1) #2 {
entry:
  %shl = shl i32 %zSign, 31
  %shl1 = shl i32 %zExp, 20
  %add = add i32 %shl1, %shl
  %add2 = add i32 %add, %zSig0
  %retval.sroa.2.0.insert.ext = zext i32 %zSig1 to i64
  %retval.sroa.2.0.insert.shift = shl nuw i64 %retval.sroa.2.0.insert.ext, 32
  %retval.sroa.0.0.insert.ext = zext i32 %add2 to i64
  %retval.sroa.0.0.insert.insert = or i64 %retval.sroa.2.0.insert.shift, %retval.sroa.0.0.insert.ext
  ret i64 %retval.sroa.0.0.insert.insert
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture, i8* nocapture readonly, i32, i32, i1) #1

; Function Attrs: nounwind
define i32 @int32_to_float32(i32 %a) #3 {
entry:
  switch i32 %a, label %if.end.3 [
    i32 0, label %cleanup
    i32 -2147483648, label %if.then.2
  ]

if.then.2:                                        ; preds = %entry
  %call = tail call i32 @packFloat32(i32 1, i32 158, i32 0)
  br label %cleanup

if.end.3:                                         ; preds = %entry
  %cmp4 = icmp slt i32 %a, 0
  %a.lobit = lshr i32 %a, 31
  %sub = sub nsw i32 0, %a
  %cond = select i1 %cmp4, i32 %sub, i32 %a
  %call5 = tail call fastcc i32 @normalizeRoundAndPackFloat32(i32 %a.lobit, i32 156, i32 %cond)
  br label %cleanup

cleanup:                                          ; preds = %entry, %if.end.3, %if.then.2
  %retval.0 = phi i32 [ %call, %if.then.2 ], [ %call5, %if.end.3 ], [ 0, %entry ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define internal fastcc i32 @normalizeRoundAndPackFloat32(i32 %zSign, i32 %zExp, i32 %zSig) #3 {
entry:
  %call = tail call fastcc i32 @countLeadingZeros32(i32 %zSig)
  %sub = add nsw i32 %call, -1
  %sub1 = sub nsw i32 %zExp, %sub
  %shl = shl i32 %zSig, %sub
  %call2 = tail call fastcc i32 @roundAndPackFloat32(i32 %zSign, i32 %sub1, i32 %shl)
  ret i32 %call2
}

; Function Attrs: nounwind
define i64 @int32_to_float64(i32 %a) #3 {
entry:
  %zSig0 = alloca i32, align 4
  %zSig1 = alloca i32, align 4
  %0 = bitcast i32* %zSig0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %0) #1
  %1 = bitcast i32* %zSig1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %1) #1
  %cmp = icmp eq i32 %a, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = tail call i64 @packFloat64(i32 0, i32 0, i32 0, i32 0)
  br label %cleanup

if.end:                                           ; preds = %entry
  %cmp1 = icmp slt i32 %a, 0
  %a.lobit = lshr i32 %a, 31
  %sub = sub nsw i32 0, %a
  %cond = select i1 %cmp1, i32 %sub, i32 %a
  %call2 = tail call fastcc i32 @countLeadingZeros32(i32 %cond)
  %sub3 = add nsw i32 %call2, -11
  %cmp4 = icmp sgt i32 %sub3, -1
  br i1 %cmp4, label %if.then.6, label %if.else

if.then.6:                                        ; preds = %if.end
  %shl = shl i32 %cond, %sub3
  store i32 %shl, i32* %zSig0, align 4, !tbaa !1
  store i32 0, i32* %zSig1, align 4, !tbaa !1
  br label %if.end.8

if.else:                                          ; preds = %if.end
  %sub7 = sub i32 11, %call2
  call void @shift64Right(i32 %cond, i32 0, i32 %sub7, i32* nonnull %zSig0, i32* nonnull %zSig1)
  br label %if.end.8

if.end.8:                                         ; preds = %if.else, %if.then.6
  %sub9 = sub i32 1053, %call2
  %2 = load i32, i32* %zSig0, align 4, !tbaa !1
  %3 = load i32, i32* %zSig1, align 4, !tbaa !1
  %call10 = tail call i64 @packFloat64(i32 %a.lobit, i32 %sub9, i32 %2, i32 %3)
  br label %cleanup

cleanup:                                          ; preds = %if.end.8, %if.then
  %retval.sroa.0.0 = phi i64 [ %call, %if.then ], [ %call10, %if.end.8 ]
  call void @llvm.lifetime.end(i64 4, i8* %1) #1
  call void @llvm.lifetime.end(i64 4, i8* %0) #1
  ret i64 %retval.sroa.0.0
}

; Function Attrs: nounwind readnone
define internal fastcc i32 @countLeadingZeros32(i32 %a) #4 {
entry:
  %cmp = icmp ult i32 %a, 65536
  %shl = shl i32 %a, 16
  %shl.a = select i1 %cmp, i32 %shl, i32 %a
  %. = select i1 %cmp, i32 16, i32 0
  %cmp1 = icmp ult i32 %shl.a, 16777216
  %add3 = or i32 %., 8
  %shl4 = shl i32 %shl.a, 8
  %a.addr.1 = select i1 %cmp1, i32 %shl4, i32 %shl.a
  %shiftCount.1 = select i1 %cmp1, i32 %add3, i32 %.
  %shr = lshr i32 %a.addr.1, 24
  %arrayidx = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr
  %0 = load i32, i32* %arrayidx, align 4, !tbaa !1
  %add6 = add nsw i32 %0, %shiftCount.1
  ret i32 %add6
}

; Function Attrs: nounwind
define i32 @float32_to_int32(i32 %a) #3 {
entry:
  %call = tail call i32 @extractFloat32Frac(i32 %a)
  %call1 = tail call i32 @extractFloat32Exp(i32 %a)
  %call2 = tail call i32 @extractFloat32Sign(i32 %a)
  %sub = add nsw i32 %call1, -150
  %cmp = icmp sgt i32 %sub, -1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %cmp3 = icmp sgt i32 %call1, 157
  br i1 %cmp3, label %if.then.4, label %if.end.11

if.then.4:                                        ; preds = %if.then
  %cmp5 = icmp eq i32 %a, -822083584
  br i1 %cmp5, label %if.end.10, label %if.then.6

if.then.6:                                        ; preds = %if.then.4
  tail call void @float_raise(i32 16)
  %tobool = icmp eq i32 %call2, 0
  br i1 %tobool, label %cleanup, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then.6
  %cmp7 = icmp eq i32 %call1, 255
  %tobool8 = icmp ne i32 %call, 0
  %or.cond = and i1 %tobool8, %cmp7
  br i1 %or.cond, label %cleanup, label %if.end.10

if.end.10:                                        ; preds = %if.then.4, %lor.lhs.false
  br label %cleanup

if.end.11:                                        ; preds = %if.then
  %or = or i32 %call, 8388608
  %shl = shl i32 %or, %sub
  %tobool12 = icmp eq i32 %call2, 0
  %sub14 = sub nsw i32 0, %shl
  %shl.sub14 = select i1 %tobool12, i32 %shl, i32 %sub14
  br label %cleanup

if.else:                                          ; preds = %entry
  %cmp16 = icmp slt i32 %call1, 126
  br i1 %cmp16, label %if.then.17, label %if.else.19

if.then.17:                                       ; preds = %if.else
  %or18 = or i32 %call1, %call
  br label %if.end.23

if.else.19:                                       ; preds = %if.else
  %or20 = or i32 %call, 8388608
  %and = and i32 %sub, 31
  %shl21 = shl i32 %or20, %and
  %sub22 = sub i32 150, %call1
  %shr = lshr i32 %or20, %sub22
  br label %if.end.23

if.end.23:                                        ; preds = %if.else.19, %if.then.17
  %aSigExtra.0 = phi i32 [ %or18, %if.then.17 ], [ %shl21, %if.else.19 ]
  %z.0 = phi i32 [ 0, %if.then.17 ], [ %shr, %if.else.19 ]
  %tobool24 = icmp ne i32 %aSigExtra.0, 0
  br i1 %tobool24, label %if.then.25, label %if.end.27

if.then.25:                                       ; preds = %if.end.23
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or26 = or i32 %0, 1
  store i32 %or26, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.27

if.end.27:                                        ; preds = %if.then.25, %if.end.23
  %1 = load i32, i32* @float_rounding_mode, align 4, !tbaa !1
  %cmp28 = icmp eq i32 %1, 0
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
  %tobool38 = icmp eq i32 %call2, 0
  %sub40 = sub nsw i32 0, %z.1
  %z.1.sub40 = select i1 %tobool38, i32 %z.1, i32 %sub40
  ret i32 %z.1.sub40

if.else.42:                                       ; preds = %if.end.27
  %tobool44 = icmp eq i32 %call2, 0
  br i1 %tobool44, label %if.else.50, label %if.then.45

if.then.45:                                       ; preds = %if.else.42
  %cmp46 = icmp eq i32 %1, 3
  %and48101 = and i1 %tobool24, %cmp46
  %and48 = zext i1 %and48101 to i32
  %add = add i32 %z.0, %and48
  %sub49 = sub nsw i32 0, %add
  br label %cleanup

if.else.50:                                       ; preds = %if.else.42
  %cmp51 = icmp eq i32 %1, 2
  %and53100 = and i1 %tobool24, %cmp51
  %and53 = zext i1 %and53100 to i32
  %add54 = add i32 %and53, %z.0
  br label %cleanup

cleanup:                                          ; preds = %if.end.11, %if.then.45, %if.else.50, %lor.lhs.false, %if.then.6, %if.end.10
  %retval.0 = phi i32 [ -2147483648, %if.end.10 ], [ 2147483647, %if.then.6 ], [ 2147483647, %lor.lhs.false ], [ %sub49, %if.then.45 ], [ %add54, %if.else.50 ], [ %shl.sub14, %if.end.11 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float32_to_int32_round_to_zero(i32 %a) #3 {
entry:
  %call = tail call i32 @extractFloat32Frac(i32 %a)
  %call1 = tail call i32 @extractFloat32Exp(i32 %a)
  %call2 = tail call i32 @extractFloat32Sign(i32 %a)
  %sub = add nsw i32 %call1, -158
  %cmp = icmp sgt i32 %sub, -1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %cmp3 = icmp eq i32 %a, -822083584
  br i1 %cmp3, label %if.end.8, label %if.then.4

if.then.4:                                        ; preds = %if.then
  tail call void @float_raise(i32 16)
  %tobool = icmp eq i32 %call2, 0
  br i1 %tobool, label %cleanup, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then.4
  %cmp5 = icmp eq i32 %call1, 255
  %tobool6 = icmp ne i32 %call, 0
  %or.cond = and i1 %tobool6, %cmp5
  br i1 %or.cond, label %cleanup, label %if.end.8

if.end.8:                                         ; preds = %if.then, %lor.lhs.false
  br label %cleanup

if.else:                                          ; preds = %entry
  %cmp9 = icmp slt i32 %call1, 127
  br i1 %cmp9, label %if.then.10, label %if.end.16

if.then.10:                                       ; preds = %if.else
  %or = or i32 %call1, %call
  %tobool11 = icmp eq i32 %or, 0
  br i1 %tobool11, label %cleanup, label %if.then.12

if.then.12:                                       ; preds = %if.then.10
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or13 = or i32 %0, 1
  store i32 %or13, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.16:                                        ; preds = %if.else
  %or17 = shl i32 %call, 8
  %shl = or i32 %or17, -2147483648
  %sub18 = sub i32 158, %call1
  %shr = lshr i32 %shl, %sub18
  %and = and i32 %sub, 31
  %shl19 = shl i32 %shl, %and
  %tobool20 = icmp eq i32 %shl19, 0
  br i1 %tobool20, label %if.end.23, label %if.then.21

if.then.21:                                       ; preds = %if.end.16
  %1 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or22 = or i32 %1, 1
  store i32 %or22, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.23

if.end.23:                                        ; preds = %if.end.16, %if.then.21
  %tobool24 = icmp eq i32 %call2, 0
  %sub26 = sub nsw i32 0, %shr
  %shr.sub26 = select i1 %tobool24, i32 %shr, i32 %sub26
  br label %cleanup

cleanup:                                          ; preds = %if.then.12, %if.then.10, %lor.lhs.false, %if.then.4, %if.end.23, %if.end.8
  %retval.0 = phi i32 [ -2147483648, %if.end.8 ], [ %shr.sub26, %if.end.23 ], [ 2147483647, %if.then.4 ], [ 2147483647, %lor.lhs.false ], [ 0, %if.then.10 ], [ 0, %if.then.12 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i64 @float32_to_float64(i32 %a) #3 {
entry:
  %aExp = alloca i32, align 4
  %aSig = alloca i32, align 4
  %zSig0 = alloca i32, align 4
  %zSig1 = alloca i32, align 4
  %agg.tmp = alloca %struct.commonNaNT, align 4
  %0 = bitcast i32* %aExp to i8*
  call void @llvm.lifetime.start(i64 4, i8* %0) #1
  %1 = bitcast i32* %aSig to i8*
  call void @llvm.lifetime.start(i64 4, i8* %1) #1
  %2 = bitcast i32* %zSig0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %2) #1
  %3 = bitcast i32* %zSig1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %3) #1
  %call = tail call i32 @extractFloat32Frac(i32 %a)
  store i32 %call, i32* %aSig, align 4, !tbaa !1
  %call1 = tail call i32 @extractFloat32Exp(i32 %a)
  store i32 %call1, i32* %aExp, align 4, !tbaa !1
  %call2 = tail call i32 @extractFloat32Sign(i32 %a)
  switch i32 %call1, label %if.end.13 [
    i32 255, label %if.then
    i32 0, label %if.then.8
  ]

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %aSig, align 4, !tbaa !1
  %tobool = icmp eq i32 %4, 0
  br i1 %tobool, label %if.end, label %if.then.3

if.then.3:                                        ; preds = %if.then
  call fastcc void @float32ToCommonNaN(%struct.commonNaNT* nonnull sret %agg.tmp, i32 %a)
  %sign = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %agg.tmp, i32 0, i32 0
  %5 = load i32, i32* %sign, align 4, !tbaa !5
  %high = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %agg.tmp, i32 0, i32 1
  %6 = load i32, i32* %high, align 4, !tbaa !7
  %low = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %agg.tmp, i32 0, i32 2
  %7 = load i32, i32* %low, align 4, !tbaa !8
  %call4 = tail call fastcc i64 @commonNaNToFloat64(i32 %5, i32 %6, i32 %7)
  br label %cleanup

if.end:                                           ; preds = %if.then
  %call5 = tail call i64 @packFloat64(i32 %call2, i32 2047, i32 0, i32 0)
  br label %cleanup

if.then.8:                                        ; preds = %entry
  %8 = load i32, i32* %aSig, align 4, !tbaa !1
  %cmp9 = icmp eq i32 %8, 0
  br i1 %cmp9, label %if.then.10, label %if.end.12

if.then.10:                                       ; preds = %if.then.8
  %call11 = tail call i64 @packFloat64(i32 %call2, i32 0, i32 0, i32 0)
  br label %cleanup

if.end.12:                                        ; preds = %if.then.8
  call fastcc void @normalizeFloat32Subnormal(i32 %8, i32* nonnull %aExp, i32* nonnull %aSig)
  %9 = load i32, i32* %aExp, align 4, !tbaa !1
  %dec = add nsw i32 %9, -1
  store i32 %dec, i32* %aExp, align 4, !tbaa !1
  br label %if.end.13

if.end.13:                                        ; preds = %entry, %if.end.12
  %10 = load i32, i32* %aSig, align 4, !tbaa !1
  call void @shift64Right(i32 %10, i32 0, i32 3, i32* nonnull %zSig0, i32* nonnull %zSig1)
  %11 = load i32, i32* %aExp, align 4, !tbaa !1
  %add = add nsw i32 %11, 896
  %12 = load i32, i32* %zSig0, align 4, !tbaa !1
  %13 = load i32, i32* %zSig1, align 4, !tbaa !1
  %call14 = tail call i64 @packFloat64(i32 %call2, i32 %add, i32 %12, i32 %13)
  br label %cleanup

cleanup:                                          ; preds = %if.end.13, %if.then.10, %if.end, %if.then.3
  %retval.sroa.0.0 = phi i64 [ %call4, %if.then.3 ], [ %call5, %if.end ], [ %call11, %if.then.10 ], [ %call14, %if.end.13 ]
  call void @llvm.lifetime.end(i64 4, i8* %3) #1
  call void @llvm.lifetime.end(i64 4, i8* %2) #1
  call void @llvm.lifetime.end(i64 4, i8* %1) #1
  call void @llvm.lifetime.end(i64 4, i8* %0) #1
  ret i64 %retval.sroa.0.0
}

; Function Attrs: nounwind
define internal fastcc i64 @commonNaNToFloat64(i32 %a.0, i32 %a.1, i32 %a.2) #3 {
entry:
  %z = alloca %struct.float64, align 8
  %0 = bitcast %struct.float64* %z to i8*
  call void @llvm.lifetime.start(i64 8, i8* %0) #1
  %high3 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 0
  %low4 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 1
  call void @shift64Right(i32 %a.1, i32 %a.2, i32 12, i32* %high3, i32* %low4)
  %shl = shl i32 %a.0, 31
  %1 = load i32, i32* %high3, align 8, !tbaa !9
  %or = or i32 %shl, %1
  %or7 = or i32 %or, 2146959360
  store i32 %or7, i32* %high3, align 8, !tbaa !9
  %retval.sroa.0.0..sroa_cast = bitcast %struct.float64* %z to i64*
  %retval.sroa.0.0.copyload = load i64, i64* %retval.sroa.0.0..sroa_cast, align 8
  call void @llvm.lifetime.end(i64 8, i8* %0) #1
  ret i64 %retval.sroa.0.0.copyload
}

; Function Attrs: nounwind
define internal fastcc void @float32ToCommonNaN(%struct.commonNaNT* noalias nocapture sret %agg.result, i32 %a) #3 {
entry:
  %call = tail call i32 @float32_is_signaling_nan(i32 %a)
  %tobool = icmp eq i32 %call, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @float_raise(i32 16)
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %shr = lshr i32 %a, 31
  %shl = shl i32 %a, 9
  %z.sroa.0.0..sroa_idx = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %agg.result, i32 0, i32 0
  store i32 %shr, i32* %z.sroa.0.0..sroa_idx, align 4
  %z.sroa.4.0..sroa_idx2 = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %agg.result, i32 0, i32 1
  store i32 %shl, i32* %z.sroa.4.0..sroa_idx2, align 4
  %z.sroa.5.0..sroa_idx4 = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %agg.result, i32 0, i32 2
  store i32 0, i32* %z.sroa.5.0..sroa_idx4, align 4
  ret void
}

; Function Attrs: nounwind
define internal fastcc void @normalizeFloat32Subnormal(i32 %aSig, i32* nocapture %zExpPtr, i32* nocapture %zSigPtr) #3 {
entry:
  %call = tail call fastcc i32 @countLeadingZeros32(i32 %aSig)
  %sub = add nsw i32 %call, -8
  %shl = shl i32 %aSig, %sub
  store i32 %shl, i32* %zSigPtr, align 4, !tbaa !1
  %sub1 = sub i32 9, %call
  store i32 %sub1, i32* %zExpPtr, align 4, !tbaa !1
  ret void
}

; Function Attrs: nounwind
define i32 @float32_round_to_int(i32 %a) #3 {
entry:
  %call = tail call i32 @extractFloat32Exp(i32 %a)
  %cmp = icmp sgt i32 %call, 149
  br i1 %cmp, label %if.then, label %if.end.5

if.then:                                          ; preds = %entry
  %cmp1 = icmp eq i32 %call, 255
  br i1 %cmp1, label %land.lhs.true, label %cleanup

land.lhs.true:                                    ; preds = %if.then
  %call2 = tail call i32 @extractFloat32Frac(i32 %a)
  %tobool = icmp eq i32 %call2, 0
  br i1 %tobool, label %cleanup, label %if.then.3

if.then.3:                                        ; preds = %land.lhs.true
  %call4 = tail call fastcc i32 @propagateFloat32NaN(i32 %a, i32 %a)
  br label %cleanup

if.end.5:                                         ; preds = %entry
  %cmp6 = icmp slt i32 %call, 127
  br i1 %cmp6, label %if.then.7, label %if.end.25

if.then.7:                                        ; preds = %if.end.5
  %shl.mask = and i32 %a, 2147483647
  %cmp8 = icmp eq i32 %shl.mask, 0
  br i1 %cmp8, label %cleanup, label %if.end.10

if.end.10:                                        ; preds = %if.then.7
  %0 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or = or i32 %0, 1
  store i32 %or, i32* @float_exception_flags, align 4, !tbaa !1
  %call11 = tail call i32 @extractFloat32Sign(i32 %a)
  %1 = load i32, i32* @float_rounding_mode, align 4, !tbaa !1
  switch i32 %1, label %sw.epilog [
    i32 0, label %sw.bb
    i32 3, label %sw.bb.19
    i32 2, label %sw.bb.21
  ]

sw.bb:                                            ; preds = %if.end.10
  %cmp12 = icmp eq i32 %call, 126
  br i1 %cmp12, label %land.lhs.true.13, label %sw.epilog

land.lhs.true.13:                                 ; preds = %sw.bb
  %call14 = tail call i32 @extractFloat32Frac(i32 %a)
  %tobool15 = icmp eq i32 %call14, 0
  br i1 %tobool15, label %sw.epilog, label %if.then.16

if.then.16:                                       ; preds = %land.lhs.true.13
  %call17 = tail call i32 @packFloat32(i32 %call11, i32 127, i32 0)
  br label %cleanup

sw.bb.19:                                         ; preds = %if.end.10
  %tobool20 = icmp ne i32 %call11, 0
  %cond = select i1 %tobool20, i32 -1082130432, i32 0
  br label %cleanup

sw.bb.21:                                         ; preds = %if.end.10
  %tobool22 = icmp ne i32 %call11, 0
  %cond23 = select i1 %tobool22, i32 -2147483648, i32 1065353216
  br label %cleanup

sw.epilog:                                        ; preds = %land.lhs.true.13, %sw.bb, %if.end.10
  %call24 = tail call i32 @packFloat32(i32 %call11, i32 0, i32 0)
  br label %cleanup

if.end.25:                                        ; preds = %if.end.5
  %sub = sub nsw i32 150, %call
  %shl26 = shl i32 1, %sub
  %sub27 = add i32 %shl26, -1
  %2 = load i32, i32* @float_rounding_mode, align 4, !tbaa !1
  switch i32 %2, label %if.then.35 [
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
  %call36 = tail call i32 @extractFloat32Sign(i32 %a)
  %cmp37 = icmp eq i32 %2, 2
  %conv = zext i1 %cmp37 to i32
  %tobool38 = icmp eq i32 %call36, %conv
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
  %3 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or49 = or i32 %3, 1
  store i32 %or49, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

cleanup:                                          ; preds = %if.then.48, %if.end.43, %if.then.7, %if.then, %land.lhs.true, %sw.epilog, %sw.bb.21, %sw.bb.19, %if.then.16, %if.then.3
  %retval.0 = phi i32 [ %call4, %if.then.3 ], [ %call24, %sw.epilog ], [ %cond23, %sw.bb.21 ], [ %cond, %sw.bb.19 ], [ %call17, %if.then.16 ], [ %a, %land.lhs.true ], [ %a, %if.then ], [ %a, %if.then.7 ], [ %and45, %if.end.43 ], [ %and45, %if.then.48 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define internal fastcc i32 @propagateFloat32NaN(i32 %a, i32 %b) #3 {
entry:
  %call1 = tail call i32 @float32_is_signaling_nan(i32 %a)
  %call2 = tail call i32 @float32_is_nan(i32 %b)
  %call3 = tail call i32 @float32_is_signaling_nan(i32 %b)
  %or = or i32 %a, 4194304
  %or4 = or i32 %b, 4194304
  %or5 = or i32 %call3, %call1
  %tobool = icmp eq i32 %or5, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @float_raise(i32 16)
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %tobool6 = icmp eq i32 %call3, 0
  br i1 %tobool6, label %cond.false, label %cond.end.15

cond.false:                                       ; preds = %if.end
  %tobool7 = icmp eq i32 %call1, 0
  br i1 %tobool7, label %cond.false.9, label %cond.end.15

cond.false.9:                                     ; preds = %cond.false
  %tobool10 = icmp ne i32 %call2, 0
  %cond = select i1 %tobool10, i32 %or4, i32 %or
  br label %cond.end.15

cond.end.15:                                      ; preds = %cond.false, %if.end, %cond.false.9
  %cond16 = phi i32 [ %cond, %cond.false.9 ], [ %or4, %if.end ], [ %or, %cond.false ]
  ret i32 %cond16
}

; Function Attrs: nounwind
define i32 @float32_add(i32 %a, i32 %b) #3 {
entry:
  %call = tail call i32 @extractFloat32Sign(i32 %a)
  %call1 = tail call i32 @extractFloat32Sign(i32 %b)
  %cmp = icmp eq i32 %call, %call1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call2 = tail call fastcc i32 @addFloat32Sigs(i32 %a, i32 %b, i32 %call)
  br label %cleanup

if.else:                                          ; preds = %entry
  %call3 = tail call fastcc i32 @subFloat32Sigs(i32 %a, i32 %b, i32 %call)
  br label %cleanup

cleanup:                                          ; preds = %if.else, %if.then
  %retval.0 = phi i32 [ %call2, %if.then ], [ %call3, %if.else ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define internal fastcc i32 @addFloat32Sigs(i32 %a, i32 %b, i32 %zSign) #3 {
entry:
  %aSig = alloca i32, align 4
  %bSig = alloca i32, align 4
  %0 = bitcast i32* %aSig to i8*
  call void @llvm.lifetime.start(i64 4, i8* %0) #1
  %1 = bitcast i32* %bSig to i8*
  call void @llvm.lifetime.start(i64 4, i8* %1) #1
  %call = tail call i32 @extractFloat32Frac(i32 %a)
  %call1 = tail call i32 @extractFloat32Exp(i32 %a)
  %call2 = tail call i32 @extractFloat32Frac(i32 %b)
  %call3 = tail call i32 @extractFloat32Exp(i32 %b)
  %sub = sub nsw i32 %call1, %call3
  %shl = shl i32 %call, 6
  store i32 %shl, i32* %aSig, align 4, !tbaa !1
  %shl4 = shl i32 %call2, 6
  store i32 %shl4, i32* %bSig, align 4, !tbaa !1
  %cmp = icmp sgt i32 %sub, 0
  br i1 %cmp, label %if.then, label %if.else.13

if.then:                                          ; preds = %entry
  %cmp5 = icmp eq i32 %call1, 255
  br i1 %cmp5, label %if.then.6, label %if.end.9

if.then.6:                                        ; preds = %if.then
  %2 = load i32, i32* %aSig, align 4, !tbaa !1
  %tobool = icmp eq i32 %2, 0
  br i1 %tobool, label %cleanup, label %if.then.7

if.then.7:                                        ; preds = %if.then.6
  %call8 = tail call fastcc i32 @propagateFloat32NaN(i32 %a, i32 %b)
  br label %cleanup

if.end.9:                                         ; preds = %if.then
  %cmp10 = icmp eq i32 %call3, 0
  br i1 %cmp10, label %if.then.11, label %if.else

if.then.11:                                       ; preds = %if.end.9
  %dec = add nsw i32 %sub, -1
  br label %if.end.12

if.else:                                          ; preds = %if.end.9
  %or = or i32 %shl4, 536870912
  store i32 %or, i32* %bSig, align 4, !tbaa !1
  br label %if.end.12

if.end.12:                                        ; preds = %if.else, %if.then.11
  %expDiff.0 = phi i32 [ %dec, %if.then.11 ], [ %sub, %if.else ]
  %3 = load i32, i32* %bSig, align 4, !tbaa !1
  call void @shift32RightJamming(i32 %3, i32 %expDiff.0, i32* nonnull %bSig)
  br label %if.end.46

if.else.13:                                       ; preds = %entry
  %cmp14 = icmp slt i32 %sub, 0
  br i1 %cmp14, label %if.then.15, label %if.else.30

if.then.15:                                       ; preds = %if.else.13
  %cmp16 = icmp eq i32 %call3, 255
  br i1 %cmp16, label %if.then.17, label %if.end.23

if.then.17:                                       ; preds = %if.then.15
  %tobool18 = icmp eq i32 %shl4, 0
  br i1 %tobool18, label %if.end.21, label %if.then.19

if.then.19:                                       ; preds = %if.then.17
  %call20 = tail call fastcc i32 @propagateFloat32NaN(i32 %a, i32 %b)
  br label %cleanup

if.end.21:                                        ; preds = %if.then.17
  %call22 = tail call i32 @packFloat32(i32 %zSign, i32 255, i32 0)
  br label %cleanup

if.end.23:                                        ; preds = %if.then.15
  %cmp24 = icmp eq i32 %call1, 0
  br i1 %cmp24, label %if.then.25, label %if.else.26

if.then.25:                                       ; preds = %if.end.23
  %inc = add nsw i32 %sub, 1
  br label %if.end.28

if.else.26:                                       ; preds = %if.end.23
  %4 = load i32, i32* %aSig, align 4, !tbaa !1
  %or27 = or i32 %4, 536870912
  store i32 %or27, i32* %aSig, align 4, !tbaa !1
  br label %if.end.28

if.end.28:                                        ; preds = %if.else.26, %if.then.25
  %expDiff.1 = phi i32 [ %inc, %if.then.25 ], [ %sub, %if.else.26 ]
  %5 = load i32, i32* %aSig, align 4, !tbaa !1
  %sub29 = sub nsw i32 0, %expDiff.1
  call void @shift32RightJamming(i32 %5, i32 %sub29, i32* nonnull %aSig)
  br label %if.end.46

if.else.30:                                       ; preds = %if.else.13
  switch i32 %call1, label %if.end.42 [
    i32 255, label %if.then.32
    i32 0, label %if.then.40
  ]

if.then.32:                                       ; preds = %if.else.30
  %6 = load i32, i32* %aSig, align 4, !tbaa !1
  %or33 = or i32 %6, %shl4
  %tobool34 = icmp eq i32 %or33, 0
  br i1 %tobool34, label %cleanup, label %if.then.35

if.then.35:                                       ; preds = %if.then.32
  %call36 = tail call fastcc i32 @propagateFloat32NaN(i32 %a, i32 %b)
  br label %cleanup

if.then.40:                                       ; preds = %if.else.30
  %7 = load i32, i32* %aSig, align 4, !tbaa !1
  %add = add i32 %7, %shl4
  %shr = lshr i32 %add, 6
  %call41 = tail call i32 @packFloat32(i32 %zSign, i32 0, i32 %shr)
  br label %cleanup

if.end.42:                                        ; preds = %if.else.30
  %8 = load i32, i32* %aSig, align 4, !tbaa !1
  %add43 = add i32 %shl4, 1073741824
  %add44 = add i32 %add43, %8
  br label %roundAndPack

if.end.46:                                        ; preds = %if.end.28, %if.end.12
  %zExp.0 = phi i32 [ %call1, %if.end.12 ], [ %call3, %if.end.28 ]
  %9 = load i32, i32* %aSig, align 4, !tbaa !1
  %or47 = or i32 %9, 536870912
  store i32 %or47, i32* %aSig, align 4, !tbaa !1
  %10 = load i32, i32* %bSig, align 4, !tbaa !1
  %add48 = add i32 %or47, %10
  %shl49 = shl i32 %add48, 1
  %cmp51 = icmp slt i32 %shl49, 0
  %not.cmp51 = xor i1 %cmp51, true
  %dec50 = sext i1 %not.cmp51 to i32
  %zExp.0.dec50 = add nsw i32 %dec50, %zExp.0
  %add48.shl49 = select i1 %cmp51, i32 %add48, i32 %shl49
  br label %roundAndPack

roundAndPack:                                     ; preds = %if.end.46, %if.end.42
  %zExp.1 = phi i32 [ %call1, %if.end.42 ], [ %zExp.0.dec50, %if.end.46 ]
  %zSig.0 = phi i32 [ %add44, %if.end.42 ], [ %add48.shl49, %if.end.46 ]
  %call56 = tail call fastcc i32 @roundAndPackFloat32(i32 %zSign, i32 %zExp.1, i32 %zSig.0)
  br label %cleanup

cleanup:                                          ; preds = %if.then.32, %if.then.6, %roundAndPack, %if.then.40, %if.then.35, %if.end.21, %if.then.19, %if.then.7
  %retval.0 = phi i32 [ %call8, %if.then.7 ], [ %call56, %roundAndPack ], [ %call20, %if.then.19 ], [ %call22, %if.end.21 ], [ %call36, %if.then.35 ], [ %call41, %if.then.40 ], [ %a, %if.then.6 ], [ %a, %if.then.32 ]
  call void @llvm.lifetime.end(i64 4, i8* %1) #1
  call void @llvm.lifetime.end(i64 4, i8* %0) #1
  ret i32 %retval.0
}

; Function Attrs: nounwind
define internal fastcc i32 @subFloat32Sigs(i32 %a, i32 %b, i32 %zSign) #3 {
entry:
  %aSig = alloca i32, align 4
  %bSig = alloca i32, align 4
  %0 = bitcast i32* %aSig to i8*
  call void @llvm.lifetime.start(i64 4, i8* %0) #1
  %1 = bitcast i32* %bSig to i8*
  call void @llvm.lifetime.start(i64 4, i8* %1) #1
  %call = tail call i32 @extractFloat32Frac(i32 %a)
  %call1 = tail call i32 @extractFloat32Exp(i32 %a)
  %call2 = tail call i32 @extractFloat32Frac(i32 %b)
  %call3 = tail call i32 @extractFloat32Exp(i32 %b)
  %sub = sub nsw i32 %call1, %call3
  %shl = shl i32 %call, 7
  store i32 %shl, i32* %aSig, align 4, !tbaa !1
  %shl4 = shl i32 %call2, 7
  store i32 %shl4, i32* %bSig, align 4, !tbaa !1
  %cmp = icmp sgt i32 %sub, 0
  br i1 %cmp, label %aExpBigger, label %if.end

if.end:                                           ; preds = %entry
  %cmp5 = icmp slt i32 %sub, 0
  br i1 %cmp5, label %bExpBigger, label %if.end.7

if.end.7:                                         ; preds = %if.end
  switch i32 %call1, label %if.end.16 [
    i32 255, label %if.then.9
    i32 0, label %if.then.15
  ]

if.then.9:                                        ; preds = %if.end.7
  %2 = load i32, i32* %aSig, align 4, !tbaa !1
  %or = or i32 %2, %shl4
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %if.end.12, label %if.then.10

if.then.10:                                       ; preds = %if.then.9
  %call11 = tail call fastcc i32 @propagateFloat32NaN(i32 %a, i32 %b)
  br label %cleanup

if.end.12:                                        ; preds = %if.then.9
  tail call void @float_raise(i32 16)
  br label %cleanup

if.then.15:                                       ; preds = %if.end.7
  br label %if.end.16

if.end.16:                                        ; preds = %if.end.7, %if.then.15
  %aExp.0 = phi i32 [ 1, %if.then.15 ], [ %call1, %if.end.7 ]
  %bExp.0 = phi i32 [ 1, %if.then.15 ], [ %call3, %if.end.7 ]
  %3 = load i32, i32* %bSig, align 4, !tbaa !1
  %4 = load i32, i32* %aSig, align 4, !tbaa !1
  %cmp17 = icmp ult i32 %3, %4
  br i1 %cmp17, label %aBigger, label %if.end.19

if.end.19:                                        ; preds = %if.end.16
  %cmp20 = icmp ult i32 %4, %3
  br i1 %cmp20, label %bBigger, label %if.end.22

if.end.22:                                        ; preds = %if.end.19
  %5 = load i32, i32* @float_rounding_mode, align 4, !tbaa !1
  %cmp23 = icmp eq i32 %5, 3
  %conv = zext i1 %cmp23 to i32
  %call24 = tail call i32 @packFloat32(i32 %conv, i32 0, i32 0)
  br label %cleanup

bExpBigger:                                       ; preds = %if.end
  %cmp25 = icmp eq i32 %call3, 255
  br i1 %cmp25, label %if.then.27, label %if.end.33

if.then.27:                                       ; preds = %bExpBigger
  %tobool28 = icmp eq i32 %shl4, 0
  br i1 %tobool28, label %if.end.31, label %if.then.29

if.then.29:                                       ; preds = %if.then.27
  %call30 = tail call fastcc i32 @propagateFloat32NaN(i32 %a, i32 %b)
  br label %cleanup

if.end.31:                                        ; preds = %if.then.27
  %xor = xor i32 %zSign, 1
  %call32 = tail call i32 @packFloat32(i32 %xor, i32 255, i32 0)
  br label %cleanup

if.end.33:                                        ; preds = %bExpBigger
  %cmp34 = icmp eq i32 %call1, 0
  br i1 %cmp34, label %if.then.36, label %if.else

if.then.36:                                       ; preds = %if.end.33
  %inc = add nsw i32 %sub, 1
  br label %if.end.38

if.else:                                          ; preds = %if.end.33
  %6 = load i32, i32* %aSig, align 4, !tbaa !1
  %or37 = or i32 %6, 1073741824
  store i32 %or37, i32* %aSig, align 4, !tbaa !1
  br label %if.end.38

if.end.38:                                        ; preds = %if.else, %if.then.36
  %expDiff.0 = phi i32 [ %inc, %if.then.36 ], [ %sub, %if.else ]
  %7 = load i32, i32* %aSig, align 4, !tbaa !1
  %sub39 = sub nsw i32 0, %expDiff.0
  call void @shift32RightJamming(i32 %7, i32 %sub39, i32* nonnull %aSig)
  %8 = load i32, i32* %bSig, align 4, !tbaa !1
  %or40 = or i32 %8, 1073741824
  store i32 %or40, i32* %bSig, align 4, !tbaa !1
  br label %bBigger

bBigger:                                          ; preds = %if.end.19, %if.end.38
  %bExp.1 = phi i32 [ %call3, %if.end.38 ], [ %bExp.0, %if.end.19 ]
  %9 = load i32, i32* %bSig, align 4, !tbaa !1
  %10 = load i32, i32* %aSig, align 4, !tbaa !1
  %sub41 = sub i32 %9, %10
  %xor42 = xor i32 %zSign, 1
  br label %normalizeRoundAndPack

aExpBigger:                                       ; preds = %entry
  %cmp43 = icmp eq i32 %call1, 255
  br i1 %cmp43, label %if.then.45, label %if.end.50

if.then.45:                                       ; preds = %aExpBigger
  %11 = load i32, i32* %aSig, align 4, !tbaa !1
  %tobool46 = icmp eq i32 %11, 0
  br i1 %tobool46, label %cleanup, label %if.then.47

if.then.47:                                       ; preds = %if.then.45
  %call48 = tail call fastcc i32 @propagateFloat32NaN(i32 %a, i32 %b)
  br label %cleanup

if.end.50:                                        ; preds = %aExpBigger
  %cmp51 = icmp eq i32 %call3, 0
  br i1 %cmp51, label %if.then.53, label %if.else.54

if.then.53:                                       ; preds = %if.end.50
  %dec = add nsw i32 %sub, -1
  br label %if.end.56

if.else.54:                                       ; preds = %if.end.50
  %or55 = or i32 %shl4, 1073741824
  store i32 %or55, i32* %bSig, align 4, !tbaa !1
  br label %if.end.56

if.end.56:                                        ; preds = %if.else.54, %if.then.53
  %expDiff.1 = phi i32 [ %dec, %if.then.53 ], [ %sub, %if.else.54 ]
  %12 = load i32, i32* %bSig, align 4, !tbaa !1
  call void @shift32RightJamming(i32 %12, i32 %expDiff.1, i32* nonnull %bSig)
  %13 = load i32, i32* %aSig, align 4, !tbaa !1
  %or57 = or i32 %13, 1073741824
  store i32 %or57, i32* %aSig, align 4, !tbaa !1
  br label %aBigger

aBigger:                                          ; preds = %if.end.16, %if.end.56
  %aExp.1 = phi i32 [ %call1, %if.end.56 ], [ %aExp.0, %if.end.16 ]
  %14 = load i32, i32* %aSig, align 4, !tbaa !1
  %15 = load i32, i32* %bSig, align 4, !tbaa !1
  %sub58 = sub i32 %14, %15
  br label %normalizeRoundAndPack

normalizeRoundAndPack:                            ; preds = %aBigger, %bBigger
  %zSign.addr.0 = phi i32 [ %zSign, %aBigger ], [ %xor42, %bBigger ]
  %zExp.0 = phi i32 [ %aExp.1, %aBigger ], [ %bExp.1, %bBigger ]
  %zSig.0 = phi i32 [ %sub58, %aBigger ], [ %sub41, %bBigger ]
  %dec59 = add nsw i32 %zExp.0, -1
  %call60 = tail call fastcc i32 @normalizeRoundAndPackFloat32(i32 %zSign.addr.0, i32 %dec59, i32 %zSig.0)
  br label %cleanup

cleanup:                                          ; preds = %if.then.45, %normalizeRoundAndPack, %if.then.47, %if.end.31, %if.then.29, %if.end.22, %if.end.12, %if.then.10
  %retval.0 = phi i32 [ %call48, %if.then.47 ], [ %call60, %normalizeRoundAndPack ], [ %call30, %if.then.29 ], [ %call32, %if.end.31 ], [ %call11, %if.then.10 ], [ 2147483647, %if.end.12 ], [ %call24, %if.end.22 ], [ %a, %if.then.45 ]
  call void @llvm.lifetime.end(i64 4, i8* %1) #1
  call void @llvm.lifetime.end(i64 4, i8* %0) #1
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float32_sub(i32 %a, i32 %b) #3 {
entry:
  %call = tail call i32 @extractFloat32Sign(i32 %a)
  %call1 = tail call i32 @extractFloat32Sign(i32 %b)
  %cmp = icmp eq i32 %call, %call1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call2 = tail call fastcc i32 @subFloat32Sigs(i32 %a, i32 %b, i32 %call)
  br label %cleanup

if.else:                                          ; preds = %entry
  %call3 = tail call fastcc i32 @addFloat32Sigs(i32 %a, i32 %b, i32 %call)
  br label %cleanup

cleanup:                                          ; preds = %if.else, %if.then
  %retval.0 = phi i32 [ %call2, %if.then ], [ %call3, %if.else ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float32_mul(i32 %a, i32 %b) #3 {
entry:
  %aExp = alloca i32, align 4
  %bExp = alloca i32, align 4
  %aSig = alloca i32, align 4
  %bSig = alloca i32, align 4
  %zSig0 = alloca i32, align 4
  %zSig1 = alloca i32, align 4
  %0 = bitcast i32* %aExp to i8*
  call void @llvm.lifetime.start(i64 4, i8* %0) #1
  %1 = bitcast i32* %bExp to i8*
  call void @llvm.lifetime.start(i64 4, i8* %1) #1
  %2 = bitcast i32* %aSig to i8*
  call void @llvm.lifetime.start(i64 4, i8* %2) #1
  %3 = bitcast i32* %bSig to i8*
  call void @llvm.lifetime.start(i64 4, i8* %3) #1
  %4 = bitcast i32* %zSig0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %4) #1
  %5 = bitcast i32* %zSig1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %5) #1
  %call = tail call i32 @extractFloat32Frac(i32 %a)
  store i32 %call, i32* %aSig, align 4, !tbaa !1
  %call1 = tail call i32 @extractFloat32Exp(i32 %a)
  store i32 %call1, i32* %aExp, align 4, !tbaa !1
  %call2 = tail call i32 @extractFloat32Sign(i32 %a)
  %call3 = tail call i32 @extractFloat32Frac(i32 %b)
  store i32 %call3, i32* %bSig, align 4, !tbaa !1
  %call4 = tail call i32 @extractFloat32Exp(i32 %b)
  store i32 %call4, i32* %bExp, align 4, !tbaa !1
  %call5 = tail call i32 @extractFloat32Sign(i32 %b)
  %xor = xor i32 %call5, %call2
  %6 = load i32, i32* %aExp, align 4, !tbaa !1
  %cmp = icmp eq i32 %6, 255
  br i1 %cmp, label %if.then, label %if.end.14

if.then:                                          ; preds = %entry
  %7 = load i32, i32* %aSig, align 4, !tbaa !1
  %tobool = icmp eq i32 %7, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then.8

lor.lhs.false:                                    ; preds = %if.then
  %cmp6 = icmp eq i32 %call4, 255
  %8 = load i32, i32* %bSig, align 4
  %tobool7 = icmp ne i32 %8, 0
  %or.cond = and i1 %cmp6, %tobool7
  br i1 %or.cond, label %if.then.8, label %if.end

if.then.8:                                        ; preds = %if.then, %lor.lhs.false
  %call9 = tail call fastcc i32 @propagateFloat32NaN(i32 %a, i32 %b)
  br label %cleanup

if.end:                                           ; preds = %lor.lhs.false
  %or = or i32 %8, %call4
  %cmp10 = icmp eq i32 %or, 0
  br i1 %cmp10, label %if.then.11, label %if.end.12

if.then.11:                                       ; preds = %if.end
  tail call void @float_raise(i32 16)
  br label %cleanup

if.end.12:                                        ; preds = %if.end
  %call13 = tail call i32 @packFloat32(i32 %xor, i32 255, i32 0)
  br label %cleanup

if.end.14:                                        ; preds = %entry
  %cmp15 = icmp eq i32 %call4, 255
  br i1 %cmp15, label %if.then.16, label %if.end.26

if.then.16:                                       ; preds = %if.end.14
  %9 = load i32, i32* %bSig, align 4, !tbaa !1
  %tobool17 = icmp eq i32 %9, 0
  br i1 %tobool17, label %if.end.20, label %if.then.18

if.then.18:                                       ; preds = %if.then.16
  %call19 = tail call fastcc i32 @propagateFloat32NaN(i32 %a, i32 %b)
  br label %cleanup

if.end.20:                                        ; preds = %if.then.16
  %10 = load i32, i32* %aSig, align 4, !tbaa !1
  %or21 = or i32 %10, %6
  %cmp22 = icmp eq i32 %or21, 0
  br i1 %cmp22, label %if.then.23, label %if.end.24

if.then.23:                                       ; preds = %if.end.20
  tail call void @float_raise(i32 16)
  br label %cleanup

if.end.24:                                        ; preds = %if.end.20
  %call25 = tail call i32 @packFloat32(i32 %xor, i32 255, i32 0)
  br label %cleanup

if.end.26:                                        ; preds = %if.end.14
  %cmp27 = icmp eq i32 %6, 0
  br i1 %cmp27, label %if.then.28, label %if.end.33

if.then.28:                                       ; preds = %if.end.26
  %11 = load i32, i32* %aSig, align 4, !tbaa !1
  %cmp29 = icmp eq i32 %11, 0
  br i1 %cmp29, label %if.then.30, label %if.end.32

if.then.30:                                       ; preds = %if.then.28
  %call31 = tail call i32 @packFloat32(i32 %xor, i32 0, i32 0)
  br label %cleanup

if.end.32:                                        ; preds = %if.then.28
  call fastcc void @normalizeFloat32Subnormal(i32 %11, i32* nonnull %aExp, i32* nonnull %aSig)
  br label %if.end.33

if.end.33:                                        ; preds = %if.end.32, %if.end.26
  %12 = load i32, i32* %bExp, align 4, !tbaa !1
  %cmp34 = icmp eq i32 %12, 0
  br i1 %cmp34, label %if.then.35, label %if.end.40

if.then.35:                                       ; preds = %if.end.33
  %13 = load i32, i32* %bSig, align 4, !tbaa !1
  %cmp36 = icmp eq i32 %13, 0
  br i1 %cmp36, label %if.then.37, label %if.end.39

if.then.37:                                       ; preds = %if.then.35
  %call38 = tail call i32 @packFloat32(i32 %xor, i32 0, i32 0)
  br label %cleanup

if.end.39:                                        ; preds = %if.then.35
  call fastcc void @normalizeFloat32Subnormal(i32 %13, i32* nonnull %bExp, i32* nonnull %bSig)
  br label %if.end.40

if.end.40:                                        ; preds = %if.end.39, %if.end.33
  %14 = load i32, i32* %aExp, align 4, !tbaa !1
  %15 = load i32, i32* %bExp, align 4, !tbaa !1
  %add = add nsw i32 %15, %14
  %sub = add nsw i32 %add, -127
  %16 = load i32, i32* %aSig, align 4, !tbaa !1
  %or41 = shl i32 %16, 7
  %shl = or i32 %or41, 1073741824
  store i32 %shl, i32* %aSig, align 4, !tbaa !1
  %17 = load i32, i32* %bSig, align 4, !tbaa !1
  %or42 = shl i32 %17, 8
  %shl43 = or i32 %or42, -2147483648
  store i32 %shl43, i32* %bSig, align 4, !tbaa !1
  call void @mul32To64(i32 %shl, i32 %shl43, i32* nonnull %zSig0, i32* nonnull %zSig1)
  %18 = load i32, i32* %zSig1, align 4, !tbaa !1
  %cmp44 = icmp ne i32 %18, 0
  %conv = zext i1 %cmp44 to i32
  %19 = load i32, i32* %zSig0, align 4, !tbaa !1
  %or45 = or i32 %conv, %19
  store i32 %or45, i32* %zSig0, align 4, !tbaa !1
  %shl46 = shl i32 %or45, 1
  %cmp47 = icmp sgt i32 %shl46, -1
  br i1 %cmp47, label %if.then.49, label %if.end.51

if.then.49:                                       ; preds = %if.end.40
  store i32 %shl46, i32* %zSig0, align 4, !tbaa !1
  %dec = add nsw i32 %add, -128
  br label %if.end.51

if.end.51:                                        ; preds = %if.then.49, %if.end.40
  %zExp.0 = phi i32 [ %dec, %if.then.49 ], [ %sub, %if.end.40 ]
  %20 = load i32, i32* %zSig0, align 4, !tbaa !1
  %call52 = tail call fastcc i32 @roundAndPackFloat32(i32 %xor, i32 %zExp.0, i32 %20)
  br label %cleanup

cleanup:                                          ; preds = %if.end.51, %if.then.37, %if.then.30, %if.end.24, %if.then.23, %if.then.18, %if.end.12, %if.then.11, %if.then.8
  %retval.0 = phi i32 [ %call9, %if.then.8 ], [ 2147483647, %if.then.11 ], [ %call13, %if.end.12 ], [ %call19, %if.then.18 ], [ 2147483647, %if.then.23 ], [ %call25, %if.end.24 ], [ %call31, %if.then.30 ], [ %call38, %if.then.37 ], [ %call52, %if.end.51 ]
  call void @llvm.lifetime.end(i64 4, i8* %5) #1
  call void @llvm.lifetime.end(i64 4, i8* %4) #1
  call void @llvm.lifetime.end(i64 4, i8* %3) #1
  call void @llvm.lifetime.end(i64 4, i8* %2) #1
  call void @llvm.lifetime.end(i64 4, i8* %1) #1
  call void @llvm.lifetime.end(i64 4, i8* %0) #1
  ret i32 %retval.0
}

; Function Attrs: nounwind
define internal fastcc i32 @roundAndPackFloat32(i32 %zSign, i32 %zExp, i32 %zSig) #3 {
entry:
  %zSig.addr = alloca i32, align 4
  store i32 %zSig, i32* %zSig.addr, align 4, !tbaa !1
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
  %1 = load i32, i32* %zSig.addr, align 4, !tbaa !1
  %and = and i32 %1, 127
  %conv18 = and i32 %zExp, 65535
  %cmp19 = icmp ugt i32 %conv18, 252
  br i1 %cmp19, label %if.then.21, label %if.end.51

if.then.21:                                       ; preds = %if.end.16
  %cmp22 = icmp sgt i32 %zExp, 253
  br i1 %cmp22, label %if.then.28, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then.21
  %cmp24 = icmp eq i32 %zExp, 253
  %add = add i32 %1, %roundIncrement.0
  %cmp26 = icmp slt i32 %add, 0
  %or.cond93 = and i1 %cmp24, %cmp26
  br i1 %or.cond93, label %if.then.28, label %if.end.31

if.then.28:                                       ; preds = %lor.lhs.false, %if.then.21
  tail call void @float_raise(i32 9)
  %call = tail call i32 @packFloat32(i32 %zSign, i32 255, i32 0)
  %cmp29 = icmp eq i32 %roundIncrement.0, 0
  %conv30 = zext i1 %cmp29 to i32
  %sub = sub i32 %call, %conv30
  br label %cleanup

if.end.31:                                        ; preds = %lor.lhs.false
  %cmp32 = icmp slt i32 %zExp, 0
  br i1 %cmp32, label %if.then.34, label %if.end.51

if.then.34:                                       ; preds = %if.end.31
  %2 = load i32, i32* @float_detect_tininess, align 4, !tbaa !1
  %cmp35 = icmp eq i32 %2, 1
  %cmp38 = icmp slt i32 %zExp, -1
  %or.cond = or i1 %cmp38, %cmp35
  %cmp41 = icmp sgt i32 %add, -1
  %.cmp41 = or i1 %cmp41, %or.cond
  %3 = load i32, i32* %zSig.addr, align 4, !tbaa !1
  %sub43 = sub nsw i32 0, %zExp
  call void @shift32RightJamming(i32 %3, i32 %sub43, i32* nonnull %zSig.addr)
  %4 = load i32, i32* %zSig.addr, align 4, !tbaa !1
  %and44 = and i32 %4, 127
  %tobool47 = icmp ne i32 %and44, 0
  %or.cond69 = and i1 %.cmp41, %tobool47
  br i1 %or.cond69, label %if.then.48, label %if.end.51

if.then.48:                                       ; preds = %if.then.34
  tail call void @float_raise(i32 4)
  br label %if.end.51

if.end.51:                                        ; preds = %if.end.31, %if.then.48, %if.then.34, %if.end.16
  %zExp.addr.0 = phi i32 [ 0, %if.then.48 ], [ 0, %if.then.34 ], [ %zExp, %if.end.31 ], [ %zExp, %if.end.16 ]
  %roundBits.0 = phi i32 [ %and44, %if.then.48 ], [ %and44, %if.then.34 ], [ %and, %if.end.31 ], [ %and, %if.end.16 ]
  %tobool52 = icmp eq i32 %roundBits.0, 0
  br i1 %tobool52, label %if.end.54, label %if.then.53

if.then.53:                                       ; preds = %if.end.51
  %5 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or = or i32 %5, 1
  store i32 %or, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.54

if.end.54:                                        ; preds = %if.end.51, %if.then.53
  %6 = load i32, i32* %zSig.addr, align 4, !tbaa !1
  %add55 = add i32 %6, %roundIncrement.0
  %shr = lshr i32 %add55, 7
  %cmp56 = icmp eq i32 %roundBits.0, 64
  %and5891 = and i1 %cmp, %cmp56
  %and58 = zext i1 %and5891 to i32
  %neg = xor i32 %and58, -1
  %and59 = and i32 %shr, %neg
  store i32 %and59, i32* %zSig.addr, align 4, !tbaa !1
  %cmp60 = icmp eq i32 %and59, 0
  %.zExp.addr.0 = select i1 %cmp60, i32 0, i32 %zExp.addr.0
  %call64 = tail call i32 @packFloat32(i32 %zSign, i32 %.zExp.addr.0, i32 %and59)
  br label %cleanup

cleanup:                                          ; preds = %if.end.54, %if.then.28
  %retval.0 = phi i32 [ %sub, %if.then.28 ], [ %call64, %if.end.54 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float32_div(i32 %a, i32 %b) #3 {
entry:
  %aExp = alloca i32, align 4
  %bExp = alloca i32, align 4
  %aSig = alloca i32, align 4
  %bSig = alloca i32, align 4
  %rem0 = alloca i32, align 4
  %rem1 = alloca i32, align 4
  %term0 = alloca i32, align 4
  %term1 = alloca i32, align 4
  %0 = bitcast i32* %aExp to i8*
  call void @llvm.lifetime.start(i64 4, i8* %0) #1
  %1 = bitcast i32* %bExp to i8*
  call void @llvm.lifetime.start(i64 4, i8* %1) #1
  %2 = bitcast i32* %aSig to i8*
  call void @llvm.lifetime.start(i64 4, i8* %2) #1
  %3 = bitcast i32* %bSig to i8*
  call void @llvm.lifetime.start(i64 4, i8* %3) #1
  %4 = bitcast i32* %rem0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %4) #1
  %5 = bitcast i32* %rem1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %5) #1
  %6 = bitcast i32* %term0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %6) #1
  %7 = bitcast i32* %term1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %7) #1
  %call = tail call i32 @extractFloat32Frac(i32 %a)
  store i32 %call, i32* %aSig, align 4, !tbaa !1
  %call1 = tail call i32 @extractFloat32Exp(i32 %a)
  store i32 %call1, i32* %aExp, align 4, !tbaa !1
  %call2 = tail call i32 @extractFloat32Sign(i32 %a)
  %call3 = tail call i32 @extractFloat32Frac(i32 %b)
  store i32 %call3, i32* %bSig, align 4, !tbaa !1
  %call4 = tail call i32 @extractFloat32Exp(i32 %b)
  store i32 %call4, i32* %bExp, align 4, !tbaa !1
  %call5 = tail call i32 @extractFloat32Sign(i32 %b)
  %xor = xor i32 %call5, %call2
  %8 = load i32, i32* %aExp, align 4, !tbaa !1
  %cmp = icmp eq i32 %8, 255
  br i1 %cmp, label %if.then, label %if.end.16

if.then:                                          ; preds = %entry
  %9 = load i32, i32* %aSig, align 4, !tbaa !1
  %tobool = icmp eq i32 %9, 0
  br i1 %tobool, label %if.end, label %if.then.6

if.then.6:                                        ; preds = %if.then
  %call7 = tail call fastcc i32 @propagateFloat32NaN(i32 %a, i32 %b)
  br label %cleanup

if.end:                                           ; preds = %if.then
  %cmp8 = icmp eq i32 %call4, 255
  br i1 %cmp8, label %if.then.9, label %if.end.14

if.then.9:                                        ; preds = %if.end
  %10 = load i32, i32* %bSig, align 4, !tbaa !1
  %tobool10 = icmp eq i32 %10, 0
  br i1 %tobool10, label %if.end.13, label %if.then.11

if.then.11:                                       ; preds = %if.then.9
  %call12 = tail call fastcc i32 @propagateFloat32NaN(i32 %a, i32 %b)
  br label %cleanup

if.end.13:                                        ; preds = %if.then.9
  tail call void @float_raise(i32 16)
  br label %cleanup

if.end.14:                                        ; preds = %if.end
  %call15 = tail call i32 @packFloat32(i32 %xor, i32 255, i32 0)
  br label %cleanup

if.end.16:                                        ; preds = %entry
  switch i32 %call4, label %if.end.34 [
    i32 255, label %if.then.18
    i32 0, label %if.then.26
  ]

if.then.18:                                       ; preds = %if.end.16
  %11 = load i32, i32* %bSig, align 4, !tbaa !1
  %tobool19 = icmp eq i32 %11, 0
  br i1 %tobool19, label %if.end.22, label %if.then.20

if.then.20:                                       ; preds = %if.then.18
  %call21 = tail call fastcc i32 @propagateFloat32NaN(i32 %a, i32 %b)
  br label %cleanup

if.end.22:                                        ; preds = %if.then.18
  %call23 = tail call i32 @packFloat32(i32 %xor, i32 0, i32 0)
  br label %cleanup

if.then.26:                                       ; preds = %if.end.16
  %12 = load i32, i32* %bSig, align 4, !tbaa !1
  %cmp27 = icmp eq i32 %12, 0
  br i1 %cmp27, label %if.then.28, label %if.end.33

if.then.28:                                       ; preds = %if.then.26
  %13 = load i32, i32* %aSig, align 4, !tbaa !1
  %or = or i32 %13, %8
  %cmp29 = icmp eq i32 %or, 0
  br i1 %cmp29, label %if.then.30, label %if.end.31

if.then.30:                                       ; preds = %if.then.28
  tail call void @float_raise(i32 16)
  br label %cleanup

if.end.31:                                        ; preds = %if.then.28
  tail call void @float_raise(i32 2)
  %call32 = tail call i32 @packFloat32(i32 %xor, i32 255, i32 0)
  br label %cleanup

if.end.33:                                        ; preds = %if.then.26
  call fastcc void @normalizeFloat32Subnormal(i32 %12, i32* nonnull %bExp, i32* nonnull %bSig)
  br label %if.end.34

if.end.34:                                        ; preds = %if.end.16, %if.end.33
  %14 = load i32, i32* %aExp, align 4, !tbaa !1
  %cmp35 = icmp eq i32 %14, 0
  br i1 %cmp35, label %if.then.36, label %if.end.41

if.then.36:                                       ; preds = %if.end.34
  %15 = load i32, i32* %aSig, align 4, !tbaa !1
  %cmp37 = icmp eq i32 %15, 0
  br i1 %cmp37, label %if.then.38, label %if.end.40

if.then.38:                                       ; preds = %if.then.36
  %call39 = tail call i32 @packFloat32(i32 %xor, i32 0, i32 0)
  br label %cleanup

if.end.40:                                        ; preds = %if.then.36
  call fastcc void @normalizeFloat32Subnormal(i32 %15, i32* nonnull %aExp, i32* nonnull %aSig)
  br label %if.end.41

if.end.41:                                        ; preds = %if.end.40, %if.end.34
  %16 = load i32, i32* %aExp, align 4, !tbaa !1
  %17 = load i32, i32* %bExp, align 4, !tbaa !1
  %sub = sub nsw i32 %16, %17
  %add = add nsw i32 %sub, 125
  %18 = load i32, i32* %aSig, align 4, !tbaa !1
  %or42 = shl i32 %18, 7
  %shl = or i32 %or42, 1073741824
  store i32 %shl, i32* %aSig, align 4, !tbaa !1
  %19 = load i32, i32* %bSig, align 4, !tbaa !1
  %or43 = shl i32 %19, 8
  %shl44 = or i32 %or43, -2147483648
  store i32 %shl44, i32* %bSig, align 4, !tbaa !1
  %add45 = shl i32 %shl, 1
  %cmp46 = icmp ugt i32 %shl44, %add45
  br i1 %cmp46, label %if.end.48, label %if.then.47

if.then.47:                                       ; preds = %if.end.41
  %shr = lshr exact i32 %shl, 1
  store i32 %shr, i32* %aSig, align 4, !tbaa !1
  %inc = add nsw i32 %sub, 126
  br label %if.end.48

if.end.48:                                        ; preds = %if.end.41, %if.then.47
  %zExp.0 = phi i32 [ %inc, %if.then.47 ], [ %add, %if.end.41 ]
  %20 = load i32, i32* %aSig, align 4, !tbaa !1
  %21 = load i32, i32* %bSig, align 4, !tbaa !1
  %call49 = tail call fastcc i32 @estimateDiv64To32(i32 %20, i32 0, i32 %21)
  %and = and i32 %call49, 63
  %cmp50 = icmp ult i32 %and, 3
  br i1 %cmp50, label %if.then.51, label %if.end.55

if.then.51:                                       ; preds = %if.end.48
  %22 = load i32, i32* %bSig, align 4, !tbaa !1
  call void @mul32To64(i32 %22, i32 %call49, i32* nonnull %term0, i32* nonnull %term1)
  %23 = load i32, i32* %aSig, align 4, !tbaa !1
  %24 = load i32, i32* %term0, align 4, !tbaa !1
  %25 = load i32, i32* %term1, align 4, !tbaa !1
  call void @sub64(i32 %23, i32 0, i32 %24, i32 %25, i32* nonnull %rem0, i32* nonnull %rem1)
  %26 = load i32, i32* %rem0, align 4, !tbaa !1
  %cmp52.93 = icmp slt i32 %26, 0
  br i1 %cmp52.93, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %if.then.51
  %27 = load i32, i32* %bSig, align 4, !tbaa !1
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %28 = phi i32 [ %26, %while.body.lr.ph ], [ %30, %while.body ]
  %zSig.094 = phi i32 [ %call49, %while.body.lr.ph ], [ %dec, %while.body ]
  %dec = add i32 %zSig.094, -1
  %29 = load i32, i32* %rem1, align 4, !tbaa !1
  call void @add64(i32 %28, i32 %29, i32 0, i32 %27, i32* nonnull %rem0, i32* nonnull %rem1)
  %30 = load i32, i32* %rem0, align 4, !tbaa !1
  %cmp52 = icmp slt i32 %30, 0
  br i1 %cmp52, label %while.body, label %while.end

while.end:                                        ; preds = %while.body, %if.then.51
  %zSig.0.lcssa = phi i32 [ %call49, %if.then.51 ], [ %dec, %while.body ]
  %31 = load i32, i32* %rem1, align 4, !tbaa !1
  %cmp53 = icmp ne i32 %31, 0
  %conv = zext i1 %cmp53 to i32
  %or54 = or i32 %conv, %zSig.0.lcssa
  br label %if.end.55

if.end.55:                                        ; preds = %while.end, %if.end.48
  %zSig.1 = phi i32 [ %or54, %while.end ], [ %call49, %if.end.48 ]
  %call56 = tail call fastcc i32 @roundAndPackFloat32(i32 %xor, i32 %zExp.0, i32 %zSig.1)
  br label %cleanup

cleanup:                                          ; preds = %if.end.55, %if.then.38, %if.end.31, %if.then.30, %if.end.22, %if.then.20, %if.end.14, %if.end.13, %if.then.11, %if.then.6
  %retval.0 = phi i32 [ %call7, %if.then.6 ], [ %call12, %if.then.11 ], [ 2147483647, %if.end.13 ], [ %call15, %if.end.14 ], [ %call21, %if.then.20 ], [ %call23, %if.end.22 ], [ 2147483647, %if.then.30 ], [ %call32, %if.end.31 ], [ %call39, %if.then.38 ], [ %call56, %if.end.55 ]
  call void @llvm.lifetime.end(i64 4, i8* %7) #1
  call void @llvm.lifetime.end(i64 4, i8* %6) #1
  call void @llvm.lifetime.end(i64 4, i8* %5) #1
  call void @llvm.lifetime.end(i64 4, i8* %4) #1
  call void @llvm.lifetime.end(i64 4, i8* %3) #1
  call void @llvm.lifetime.end(i64 4, i8* %2) #1
  call void @llvm.lifetime.end(i64 4, i8* %1) #1
  call void @llvm.lifetime.end(i64 4, i8* %0) #1
  ret i32 %retval.0
}

; Function Attrs: nounwind
define internal fastcc i32 @estimateDiv64To32(i32 %a0, i32 %a1, i32 %b) #3 {
entry:
  %rem0 = alloca i32, align 4
  %rem1 = alloca i32, align 4
  %term0 = alloca i32, align 4
  %term1 = alloca i32, align 4
  %0 = bitcast i32* %rem0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %0) #1
  %1 = bitcast i32* %rem1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %1) #1
  %2 = bitcast i32* %term0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %2) #1
  %3 = bitcast i32* %term1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %3) #1
  %cmp = icmp ugt i32 %b, %a0
  br i1 %cmp, label %if.end, label %cleanup

if.end:                                           ; preds = %entry
  %shr = lshr i32 %b, 16
  %shl = shl nuw i32 %shr, 16
  %cmp1 = icmp ugt i32 %shl, %a0
  br i1 %cmp1, label %cond.false, label %cond.end

cond.false:                                       ; preds = %if.end
  %div = udiv i32 %a0, %shr
  %shl2 = shl i32 %div, 16
  br label %cond.end

cond.end:                                         ; preds = %if.end, %cond.false
  %cond = phi i32 [ %shl2, %cond.false ], [ -65536, %if.end ]
  call void @mul32To64(i32 %b, i32 %cond, i32* nonnull %term0, i32* nonnull %term1)
  %4 = load i32, i32* %term0, align 4, !tbaa !1
  %5 = load i32, i32* %term1, align 4, !tbaa !1
  call void @sub64(i32 %a0, i32 %a1, i32 %4, i32 %5, i32* nonnull %rem0, i32* nonnull %rem1)
  %6 = load i32, i32* %rem0, align 4, !tbaa !1
  %cmp3.37 = icmp slt i32 %6, 0
  br i1 %cmp3.37, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %cond.end
  %shl4 = shl i32 %b, 16
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %7 = phi i32 [ %6, %while.body.lr.ph ], [ %9, %while.body ]
  %z.038 = phi i32 [ %cond, %while.body.lr.ph ], [ %sub, %while.body ]
  %sub = add i32 %z.038, -65536
  %8 = load i32, i32* %rem1, align 4, !tbaa !1
  call void @add64(i32 %7, i32 %8, i32 %shr, i32 %shl4, i32* nonnull %rem0, i32* nonnull %rem1)
  %9 = load i32, i32* %rem0, align 4, !tbaa !1
  %cmp3 = icmp slt i32 %9, 0
  br i1 %cmp3, label %while.body, label %while.end

while.end:                                        ; preds = %while.body, %cond.end
  %.lcssa = phi i32 [ %6, %cond.end ], [ %9, %while.body ]
  %z.0.lcssa = phi i32 [ %cond, %cond.end ], [ %sub, %while.body ]
  %shl5 = shl i32 %.lcssa, 16
  %10 = load i32, i32* %rem1, align 4, !tbaa !1
  %shr6 = lshr i32 %10, 16
  %or = or i32 %shr6, %shl5
  store i32 %or, i32* %rem0, align 4, !tbaa !1
  %cmp8 = icmp ugt i32 %shl, %or
  br i1 %cmp8, label %cond.false.10, label %cond.end.12

cond.false.10:                                    ; preds = %while.end
  %div11 = udiv i32 %or, %shr
  br label %cond.end.12

cond.end.12:                                      ; preds = %while.end, %cond.false.10
  %cond13 = phi i32 [ %div11, %cond.false.10 ], [ 65535, %while.end ]
  %or14 = or i32 %cond13, %z.0.lcssa
  br label %cleanup

cleanup:                                          ; preds = %entry, %cond.end.12
  %retval.0 = phi i32 [ %or14, %cond.end.12 ], [ -1, %entry ]
  call void @llvm.lifetime.end(i64 4, i8* %3) #1
  call void @llvm.lifetime.end(i64 4, i8* %2) #1
  call void @llvm.lifetime.end(i64 4, i8* %1) #1
  call void @llvm.lifetime.end(i64 4, i8* %0) #1
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float32_rem(i32 %a, i32 %b) #3 {
entry:
  %aExp = alloca i32, align 4
  %bExp = alloca i32, align 4
  %aSig = alloca i32, align 4
  %bSig = alloca i32, align 4
  %0 = bitcast i32* %aExp to i8*
  call void @llvm.lifetime.start(i64 4, i8* %0) #1
  %1 = bitcast i32* %bExp to i8*
  call void @llvm.lifetime.start(i64 4, i8* %1) #1
  %2 = bitcast i32* %aSig to i8*
  call void @llvm.lifetime.start(i64 4, i8* %2) #1
  %3 = bitcast i32* %bSig to i8*
  call void @llvm.lifetime.start(i64 4, i8* %3) #1
  %call = tail call i32 @extractFloat32Frac(i32 %a)
  store i32 %call, i32* %aSig, align 4, !tbaa !1
  %call1 = tail call i32 @extractFloat32Exp(i32 %a)
  store i32 %call1, i32* %aExp, align 4, !tbaa !1
  %call2 = tail call i32 @extractFloat32Sign(i32 %a)
  %call3 = tail call i32 @extractFloat32Frac(i32 %b)
  store i32 %call3, i32* %bSig, align 4, !tbaa !1
  %call4 = tail call i32 @extractFloat32Exp(i32 %b)
  store i32 %call4, i32* %bExp, align 4, !tbaa !1
  %cmp = icmp eq i32 %call1, 255
  br i1 %cmp, label %if.then, label %if.end.10

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %aSig, align 4, !tbaa !1
  %tobool = icmp eq i32 %4, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then.8

lor.lhs.false:                                    ; preds = %if.then
  %cmp6 = icmp eq i32 %call4, 255
  %5 = load i32, i32* %bSig, align 4
  %tobool7 = icmp ne i32 %5, 0
  %or.cond = and i1 %cmp6, %tobool7
  br i1 %or.cond, label %if.then.8, label %if.end

if.then.8:                                        ; preds = %if.then, %lor.lhs.false
  %call9 = tail call fastcc i32 @propagateFloat32NaN(i32 %a, i32 %b)
  br label %cleanup

if.end:                                           ; preds = %lor.lhs.false
  tail call void @float_raise(i32 16)
  br label %cleanup

if.end.10:                                        ; preds = %entry
  switch i32 %call4, label %if.end.23 [
    i32 255, label %if.then.12
    i32 0, label %if.then.19
  ]

if.then.12:                                       ; preds = %if.end.10
  %6 = load i32, i32* %bSig, align 4, !tbaa !1
  %tobool13 = icmp eq i32 %6, 0
  br i1 %tobool13, label %cleanup, label %if.then.14

if.then.14:                                       ; preds = %if.then.12
  %call15 = tail call fastcc i32 @propagateFloat32NaN(i32 %a, i32 %b)
  br label %cleanup

if.then.19:                                       ; preds = %if.end.10
  %7 = load i32, i32* %bSig, align 4, !tbaa !1
  %cmp20 = icmp eq i32 %7, 0
  br i1 %cmp20, label %if.then.21, label %if.end.22

if.then.21:                                       ; preds = %if.then.19
  tail call void @float_raise(i32 16)
  br label %cleanup

if.end.22:                                        ; preds = %if.then.19
  call fastcc void @normalizeFloat32Subnormal(i32 %7, i32* nonnull %bExp, i32* nonnull %bSig)
  br label %if.end.23

if.end.23:                                        ; preds = %if.end.10, %if.end.22
  %8 = load i32, i32* %aExp, align 4, !tbaa !1
  %cmp24 = icmp eq i32 %8, 0
  br i1 %cmp24, label %if.then.25, label %if.end.29

if.then.25:                                       ; preds = %if.end.23
  %9 = load i32, i32* %aSig, align 4, !tbaa !1
  %cmp26 = icmp eq i32 %9, 0
  br i1 %cmp26, label %cleanup, label %if.end.28

if.end.28:                                        ; preds = %if.then.25
  call fastcc void @normalizeFloat32Subnormal(i32 %9, i32* nonnull %aExp, i32* nonnull %aSig)
  br label %if.end.29

if.end.29:                                        ; preds = %if.end.28, %if.end.23
  %10 = load i32, i32* %aExp, align 4, !tbaa !1
  %11 = load i32, i32* %bExp, align 4, !tbaa !1
  %sub = sub nsw i32 %10, %11
  %12 = load i32, i32* %aSig, align 4, !tbaa !1
  %or = shl i32 %12, 8
  %shl = or i32 %or, -2147483648
  store i32 %shl, i32* %aSig, align 4, !tbaa !1
  %13 = load i32, i32* %bSig, align 4, !tbaa !1
  %or30 = shl i32 %13, 8
  %shl31 = or i32 %or30, -2147483648
  store i32 %shl31, i32* %bSig, align 4, !tbaa !1
  %cmp32 = icmp slt i32 %sub, 0
  br i1 %cmp32, label %if.then.33, label %if.end.37

if.then.33:                                       ; preds = %if.end.29
  %cmp34 = icmp slt i32 %sub, -1
  br i1 %cmp34, label %cleanup, label %if.end.36

if.end.36:                                        ; preds = %if.then.33
  %14 = load i32, i32* %aSig, align 4, !tbaa !1
  %shr = lshr i32 %14, 1
  store i32 %shr, i32* %aSig, align 4, !tbaa !1
  br label %if.end.37

if.end.37:                                        ; preds = %if.end.36, %if.end.29
  %15 = load i32, i32* %bSig, align 4, !tbaa !1
  %16 = load i32, i32* %aSig, align 4, !tbaa !1
  %cmp38 = icmp uge i32 %16, %15
  %conv = zext i1 %cmp38 to i32
  br i1 %cmp38, label %if.then.40, label %if.end.42

if.then.40:                                       ; preds = %if.end.37
  %sub41 = sub i32 %16, %15
  store i32 %sub41, i32* %aSig, align 4, !tbaa !1
  br label %if.end.42

if.end.42:                                        ; preds = %if.then.40, %if.end.37
  %sub43 = add nsw i32 %sub, -32
  %cmp44.147 = icmp sgt i32 %sub, 32
  br i1 %cmp44.147, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %if.end.42
  %17 = load i32, i32* %bSig, align 4, !tbaa !1
  %shr50 = lshr i32 %17, 2
  %mul = sub nsw i32 0, %shr50
  %aSig.promoted150 = load i32, i32* %aSig, align 4, !tbaa !1
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %sub51151 = phi i32 [ %aSig.promoted150, %while.body.lr.ph ], [ %sub51, %while.body ]
  %expDiff.0148 = phi i32 [ %sub43, %while.body.lr.ph ], [ %sub52, %while.body ]
  %call46 = tail call fastcc i32 @estimateDiv64To32(i32 %sub51151, i32 0, i32 %17)
  %cmp47 = icmp ugt i32 %call46, 2
  %sub49 = add i32 %call46, -2
  %cond = select i1 %cmp47, i32 %sub49, i32 0
  %sub51 = mul i32 %cond, %mul
  %sub52 = add nsw i32 %expDiff.0148, -30
  %cmp44 = icmp sgt i32 %expDiff.0148, 30
  br i1 %cmp44, label %while.body, label %while.cond.while.end_crit_edge

while.cond.while.end_crit_edge:                   ; preds = %while.body
  store i32 %sub51, i32* %aSig, align 4, !tbaa !1
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %if.end.42
  %expDiff.0.lcssa = phi i32 [ %sub52, %while.cond.while.end_crit_edge ], [ %sub43, %if.end.42 ]
  %q.0.lcssa = phi i32 [ %cond, %while.cond.while.end_crit_edge ], [ %conv, %if.end.42 ]
  %cmp53 = icmp sgt i32 %expDiff.0.lcssa, -32
  %18 = load i32, i32* %aSig, align 4, !tbaa !1
  br i1 %cmp53, label %if.then.55, label %if.else

if.then.55:                                       ; preds = %while.end
  %19 = load i32, i32* %bSig, align 4, !tbaa !1
  %call56 = tail call fastcc i32 @estimateDiv64To32(i32 %18, i32 0, i32 %19)
  %cmp57 = icmp ugt i32 %call56, 2
  %sub60 = add i32 %call56, -2
  %cond63 = select i1 %cmp57, i32 %sub60, i32 0
  %sub64 = sub i32 0, %expDiff.0.lcssa
  %shr65 = lshr i32 %cond63, %sub64
  %20 = load i32, i32* %bSig, align 4, !tbaa !1
  %shr66 = lshr i32 %20, 2
  store i32 %shr66, i32* %bSig, align 4, !tbaa !1
  %21 = load i32, i32* %aSig, align 4, !tbaa !1
  %shr67 = lshr i32 %21, 1
  %sub68 = add nsw i32 %expDiff.0.lcssa, 31
  %shl69 = shl i32 %shr67, %sub68
  %mul70 = mul i32 %shr65, %shr66
  %sub71 = sub i32 %shl69, %mul70
  store i32 %sub71, i32* %aSig, align 4, !tbaa !1
  br label %do.body.preheader

if.else:                                          ; preds = %while.end
  %shr72 = lshr i32 %18, 2
  store i32 %shr72, i32* %aSig, align 4, !tbaa !1
  %22 = load i32, i32* %bSig, align 4, !tbaa !1
  %shr73 = lshr i32 %22, 2
  store i32 %shr73, i32* %bSig, align 4, !tbaa !1
  br label %do.body.preheader

do.body.preheader:                                ; preds = %if.else, %if.then.55
  %q.1.ph = phi i32 [ %q.0.lcssa, %if.else ], [ %shr65, %if.then.55 ]
  %23 = load i32, i32* %bSig, align 4, !tbaa !1
  %aSig.promoted = load i32, i32* %aSig, align 4, !tbaa !1
  br label %do.body

do.body:                                          ; preds = %do.body.preheader, %do.body
  %sub75145 = phi i32 [ %sub75, %do.body ], [ %aSig.promoted, %do.body.preheader ]
  %q.1 = phi i32 [ %inc, %do.body ], [ %q.1.ph, %do.body.preheader ]
  %inc = add i32 %q.1, 1
  %sub75 = sub i32 %sub75145, %23
  %cmp76 = icmp sgt i32 %sub75, -1
  br i1 %cmp76, label %do.body, label %do.end

do.end:                                           ; preds = %do.body
  store i32 %sub75, i32* %aSig, align 4, !tbaa !1
  %add78 = add i32 %sub75, %sub75145
  %cmp79 = icmp slt i32 %add78, 0
  br i1 %cmp79, label %if.then.86, label %lor.lhs.false.81

lor.lhs.false.81:                                 ; preds = %do.end
  %cmp82 = icmp ne i32 %add78, 0
  %and = and i32 %inc, 1
  %tobool85 = icmp eq i32 %and, 0
  %or.cond144 = or i1 %tobool85, %cmp82
  br i1 %or.cond144, label %if.end.87thread-pre-split, label %if.then.86

if.then.86:                                       ; preds = %lor.lhs.false.81, %do.end
  store i32 %sub75145, i32* %aSig, align 4, !tbaa !1
  br label %if.end.87

if.end.87thread-pre-split:                        ; preds = %lor.lhs.false.81
  %.pr = load i32, i32* %aSig, align 4, !tbaa !1
  br label %if.end.87

if.end.87:                                        ; preds = %if.end.87thread-pre-split, %if.then.86
  %24 = phi i32 [ %.pr, %if.end.87thread-pre-split ], [ %sub75145, %if.then.86 ]
  %cmp88 = icmp slt i32 %24, 0
  %.lobit = lshr i32 %24, 31
  br i1 %cmp88, label %if.then.91, label %if.end.93

if.then.91:                                       ; preds = %if.end.87
  %sub92 = sub i32 0, %24
  store i32 %sub92, i32* %aSig, align 4, !tbaa !1
  br label %if.end.93

if.end.93:                                        ; preds = %if.then.91, %if.end.87
  %xor = xor i32 %.lobit, %call2
  %25 = load i32, i32* %bExp, align 4, !tbaa !1
  %26 = load i32, i32* %aSig, align 4, !tbaa !1
  %call94 = tail call fastcc i32 @normalizeRoundAndPackFloat32(i32 %xor, i32 %25, i32 %26)
  br label %cleanup

cleanup:                                          ; preds = %if.then.33, %if.then.25, %if.then.12, %if.end.93, %if.then.21, %if.then.14, %if.end, %if.then.8
  %retval.0 = phi i32 [ %call9, %if.then.8 ], [ 2147483647, %if.end ], [ %call15, %if.then.14 ], [ 2147483647, %if.then.21 ], [ %call94, %if.end.93 ], [ %a, %if.then.12 ], [ %a, %if.then.25 ], [ %a, %if.then.33 ]
  call void @llvm.lifetime.end(i64 4, i8* %3) #1
  call void @llvm.lifetime.end(i64 4, i8* %2) #1
  call void @llvm.lifetime.end(i64 4, i8* %1) #1
  call void @llvm.lifetime.end(i64 4, i8* %0) #1
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float32_sqrt(i32 %a) #3 {
entry:
  %aExp = alloca i32, align 4
  %aSig = alloca i32, align 4
  %zSig = alloca i32, align 4
  %rem0 = alloca i32, align 4
  %rem1 = alloca i32, align 4
  %term0 = alloca i32, align 4
  %term1 = alloca i32, align 4
  %0 = bitcast i32* %aExp to i8*
  call void @llvm.lifetime.start(i64 4, i8* %0) #1
  %1 = bitcast i32* %aSig to i8*
  call void @llvm.lifetime.start(i64 4, i8* %1) #1
  %2 = bitcast i32* %zSig to i8*
  call void @llvm.lifetime.start(i64 4, i8* %2) #1
  %3 = bitcast i32* %rem0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %3) #1
  %4 = bitcast i32* %rem1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %4) #1
  %5 = bitcast i32* %term0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %5) #1
  %6 = bitcast i32* %term1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %6) #1
  %call = tail call i32 @extractFloat32Frac(i32 %a)
  store i32 %call, i32* %aSig, align 4, !tbaa !1
  %call1 = tail call i32 @extractFloat32Exp(i32 %a)
  store i32 %call1, i32* %aExp, align 4, !tbaa !1
  %call2 = tail call i32 @extractFloat32Sign(i32 %a)
  %cmp = icmp eq i32 %call1, 255
  br i1 %cmp, label %if.then, label %if.end.8

if.then:                                          ; preds = %entry
  %7 = load i32, i32* %aSig, align 4, !tbaa !1
  %tobool = icmp eq i32 %7, 0
  br i1 %tobool, label %if.end, label %if.then.3

if.then.3:                                        ; preds = %if.then
  %call4 = tail call fastcc i32 @propagateFloat32NaN(i32 %a, i32 0)
  br label %cleanup

if.end:                                           ; preds = %if.then
  %tobool5 = icmp eq i32 %call2, 0
  br i1 %tobool5, label %cleanup, label %if.end.7

if.end.7:                                         ; preds = %if.end
  tail call void @float_raise(i32 16)
  br label %cleanup

if.end.8:                                         ; preds = %entry
  %tobool9 = icmp eq i32 %call2, 0
  br i1 %tobool9, label %if.end.14, label %if.then.10

if.then.10:                                       ; preds = %if.end.8
  %8 = load i32, i32* %aSig, align 4, !tbaa !1
  %or = or i32 %8, %call1
  %cmp11 = icmp eq i32 %or, 0
  br i1 %cmp11, label %cleanup, label %if.end.13

if.end.13:                                        ; preds = %if.then.10
  tail call void @float_raise(i32 16)
  br label %cleanup

if.end.14:                                        ; preds = %if.end.8
  %cmp15 = icmp eq i32 %call1, 0
  br i1 %cmp15, label %if.then.16, label %if.end.20

if.then.16:                                       ; preds = %if.end.14
  %9 = load i32, i32* %aSig, align 4, !tbaa !1
  %cmp17 = icmp eq i32 %9, 0
  br i1 %cmp17, label %cleanup, label %if.end.19

if.end.19:                                        ; preds = %if.then.16
  call fastcc void @normalizeFloat32Subnormal(i32 %9, i32* nonnull %aExp, i32* nonnull %aSig)
  br label %if.end.20

if.end.20:                                        ; preds = %if.end.19, %if.end.14
  %10 = load i32, i32* %aExp, align 4, !tbaa !1
  %sub = add nsw i32 %10, -127
  %shr = ashr i32 %sub, 1
  %add = add nsw i32 %shr, 126
  %11 = load i32, i32* %aSig, align 4, !tbaa !1
  %or21 = shl i32 %11, 8
  %shl = or i32 %or21, -2147483648
  store i32 %shl, i32* %aSig, align 4, !tbaa !1
  %12 = load i32, i32* %aExp, align 4, !tbaa !1
  %call22 = tail call fastcc i32 @estimateSqrt32(i32 %12, i32 %shl)
  %add23 = add i32 %call22, 2
  store i32 %add23, i32* %zSig, align 4, !tbaa !1
  %and = and i32 %add23, 126
  %cmp24 = icmp ult i32 %and, 6
  br i1 %cmp24, label %if.then.25, label %if.end.36

if.then.25:                                       ; preds = %if.end.20
  %cmp26 = icmp ugt i32 %call22, -3
  br i1 %cmp26, label %if.then.27, label %if.else

if.then.27:                                       ; preds = %if.then.25
  store i32 2147483647, i32* %zSig, align 4, !tbaa !1
  br label %roundAndPack

if.else:                                          ; preds = %if.then.25
  %13 = load i32, i32* %aExp, align 4, !tbaa !1
  %and28 = and i32 %13, 1
  %14 = load i32, i32* %aSig, align 4, !tbaa !1
  %shr29 = lshr i32 %14, %and28
  store i32 %shr29, i32* %aSig, align 4, !tbaa !1
  %15 = load i32, i32* %zSig, align 4, !tbaa !1
  call void @mul32To64(i32 %15, i32 %15, i32* nonnull %term0, i32* nonnull %term1)
  %16 = load i32, i32* %term0, align 4, !tbaa !1
  %17 = load i32, i32* %term1, align 4, !tbaa !1
  call void @sub64(i32 %shr29, i32 0, i32 %16, i32 %17, i32* nonnull %rem0, i32* nonnull %rem1)
  %18 = load i32, i32* %rem0, align 4, !tbaa !1
  %cmp30.54 = icmp slt i32 %18, 0
  br i1 %cmp30.54, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %if.else
  %zSig.promoted = load i32, i32* %zSig, align 4, !tbaa !1
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %dec55 = phi i32 [ %zSig.promoted, %while.body.lr.ph ], [ %dec, %while.body ]
  %dec = add i32 %dec55, -1
  call void @shortShift64Left(i32 0, i32 %dec, i32 1, i32* nonnull %term0, i32* nonnull %term1)
  %19 = load i32, i32* %term1, align 4, !tbaa !1
  %or31 = or i32 %19, 1
  store i32 %or31, i32* %term1, align 4, !tbaa !1
  %20 = load i32, i32* %rem0, align 4, !tbaa !1
  %21 = load i32, i32* %rem1, align 4, !tbaa !1
  %22 = load i32, i32* %term0, align 4, !tbaa !1
  call void @add64(i32 %20, i32 %21, i32 %22, i32 %or31, i32* nonnull %rem0, i32* nonnull %rem1)
  %23 = load i32, i32* %rem0, align 4, !tbaa !1
  %cmp30 = icmp slt i32 %23, 0
  br i1 %cmp30, label %while.body, label %while.cond.while.end_crit_edge

while.cond.while.end_crit_edge:                   ; preds = %while.body
  store i32 %dec, i32* %zSig, align 4, !tbaa !1
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %if.else
  %.lcssa = phi i32 [ %23, %while.cond.while.end_crit_edge ], [ %18, %if.else ]
  %24 = load i32, i32* %rem1, align 4, !tbaa !1
  %or32 = or i32 %24, %.lcssa
  %cmp33 = icmp ne i32 %or32, 0
  %conv = zext i1 %cmp33 to i32
  %25 = load i32, i32* %zSig, align 4, !tbaa !1
  %or34 = or i32 %conv, %25
  store i32 %or34, i32* %zSig, align 4, !tbaa !1
  br label %if.end.36

if.end.36:                                        ; preds = %while.end, %if.end.20
  %26 = load i32, i32* %zSig, align 4, !tbaa !1
  call void @shift32RightJamming(i32 %26, i32 1, i32* nonnull %zSig)
  br label %roundAndPack

roundAndPack:                                     ; preds = %if.end.36, %if.then.27
  %27 = load i32, i32* %zSig, align 4, !tbaa !1
  %call37 = tail call fastcc i32 @roundAndPackFloat32(i32 0, i32 %add, i32 %27)
  br label %cleanup

cleanup:                                          ; preds = %if.then.16, %if.then.10, %if.end, %roundAndPack, %if.end.13, %if.end.7, %if.then.3
  %retval.0 = phi i32 [ %call4, %if.then.3 ], [ 2147483647, %if.end.7 ], [ 2147483647, %if.end.13 ], [ %call37, %roundAndPack ], [ %a, %if.end ], [ %a, %if.then.10 ], [ 0, %if.then.16 ]
  call void @llvm.lifetime.end(i64 4, i8* %6) #1
  call void @llvm.lifetime.end(i64 4, i8* %5) #1
  call void @llvm.lifetime.end(i64 4, i8* %4) #1
  call void @llvm.lifetime.end(i64 4, i8* %3) #1
  call void @llvm.lifetime.end(i64 4, i8* %2) #1
  call void @llvm.lifetime.end(i64 4, i8* %1) #1
  call void @llvm.lifetime.end(i64 4, i8* %0) #1
  ret i32 %retval.0
}

; Function Attrs: nounwind
define internal fastcc i32 @estimateSqrt32(i32 %aExp, i32 %a) #3 {
entry:
  %shr = lshr i32 %a, 27
  %and = and i32 %shr, 15
  %and1 = and i32 %aExp, 1
  %tobool = icmp eq i32 %and1, 0
  %shr2 = lshr i32 %a, 17
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  %add = add nuw nsw i32 %shr2, 16384
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* @estimateSqrt32.sqrtOddAdjustments, i32 0, i32 %and
  %0 = load i16, i16* %arrayidx, align 2, !tbaa !11
  %conv = zext i16 %0 to i32
  %sub = sub nsw i32 %add, %conv
  %div = udiv i32 %a, %sub
  %shl = shl i32 %div, 14
  %shl3 = shl i32 %sub, 15
  %add4 = add i32 %shl3, %shl
  %shr5 = lshr i32 %a, 1
  br label %if.end.19

if.else:                                          ; preds = %entry
  %add7 = or i32 %shr2, 32768
  %arrayidx8 = getelementptr inbounds [16 x i16], [16 x i16]* @estimateSqrt32.sqrtEvenAdjustments, i32 0, i32 %and
  %1 = load i16, i16* %arrayidx8, align 2, !tbaa !11
  %conv9 = zext i16 %1 to i32
  %sub10 = sub nsw i32 %add7, %conv9
  %div11 = udiv i32 %a, %sub10
  %add12 = add i32 %sub10, %div11
  %cmp = icmp ugt i32 %add12, 131071
  %shl14 = shl i32 %add12, 15
  %cond = select i1 %cmp, i32 -32768, i32 %shl14
  %cmp15 = icmp ugt i32 %cond, %a
  br i1 %cmp15, label %if.end.19, label %if.then.17

if.then.17:                                       ; preds = %if.else
  %shr18 = ashr i32 %a, 1
  br label %cleanup

if.end.19:                                        ; preds = %if.else, %if.then
  %a.addr.0 = phi i32 [ %shr5, %if.then ], [ %a, %if.else ]
  %z.0 = phi i32 [ %add4, %if.then ], [ %cond, %if.else ]
  %call = tail call fastcc i32 @estimateDiv64To32(i32 %a.addr.0, i32 0, i32 %z.0)
  %shr20 = lshr i32 %call, 1
  %shr21 = lshr i32 %z.0, 1
  %add22 = add nuw i32 %shr20, %shr21
  br label %cleanup

cleanup:                                          ; preds = %if.end.19, %if.then.17
  %retval.0 = phi i32 [ %add22, %if.end.19 ], [ %shr18, %if.then.17 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float32_eq(i32 %a, i32 %b) #3 {
entry:
  %call = tail call i32 @extractFloat32Exp(i32 %a)
  %cmp = icmp eq i32 %call, 255
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %call1 = tail call i32 @extractFloat32Frac(i32 %a)
  %tobool = icmp eq i32 %call1, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %call2 = tail call i32 @extractFloat32Exp(i32 %b)
  %cmp3 = icmp eq i32 %call2, 255
  br i1 %cmp3, label %land.lhs.true.4, label %if.end.13

land.lhs.true.4:                                  ; preds = %lor.lhs.false
  %call5 = tail call i32 @extractFloat32Frac(i32 %b)
  %tobool6 = icmp eq i32 %call5, 0
  br i1 %tobool6, label %if.end.13, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.4
  %call7 = tail call i32 @float32_is_signaling_nan(i32 %a)
  %tobool8 = icmp eq i32 %call7, 0
  br i1 %tobool8, label %lor.lhs.false.9, label %if.then.12

lor.lhs.false.9:                                  ; preds = %if.then
  %call10 = tail call i32 @float32_is_signaling_nan(i32 %b)
  %tobool11 = icmp eq i32 %call10, 0
  br i1 %tobool11, label %return, label %if.then.12

if.then.12:                                       ; preds = %lor.lhs.false.9, %if.then
  tail call void @float_raise(i32 16)
  br label %return

if.end.13:                                        ; preds = %land.lhs.true.4, %lor.lhs.false
  %cmp14 = icmp eq i32 %a, %b
  br i1 %cmp14, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.end.13
  %or = or i32 %b, %a
  %shl.mask = and i32 %or, 2147483647
  %cmp15 = icmp eq i32 %shl.mask, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.end.13
  %0 = phi i1 [ true, %if.end.13 ], [ %cmp15, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  br label %return

return:                                           ; preds = %if.then.12, %lor.lhs.false.9, %lor.end
  %retval.0 = phi i32 [ %lor.ext, %lor.end ], [ 0, %lor.lhs.false.9 ], [ 0, %if.then.12 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float32_le(i32 %a, i32 %b) #3 {
entry:
  %call = tail call i32 @extractFloat32Exp(i32 %a)
  %cmp = icmp eq i32 %call, 255
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %call1 = tail call i32 @extractFloat32Frac(i32 %a)
  %tobool = icmp eq i32 %call1, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %call2 = tail call i32 @extractFloat32Exp(i32 %b)
  %cmp3 = icmp eq i32 %call2, 255
  br i1 %cmp3, label %land.lhs.true.4, label %if.end

land.lhs.true.4:                                  ; preds = %lor.lhs.false
  %call5 = tail call i32 @extractFloat32Frac(i32 %b)
  %tobool6 = icmp eq i32 %call5, 0
  br i1 %tobool6, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.4
  tail call void @float_raise(i32 16)
  br label %cleanup

if.end:                                           ; preds = %land.lhs.true.4, %lor.lhs.false
  %call7 = tail call i32 @extractFloat32Sign(i32 %a)
  %call8 = tail call i32 @extractFloat32Sign(i32 %b)
  %cmp9 = icmp eq i32 %call7, %call8
  br i1 %cmp9, label %if.end.13, label %if.then.10

if.then.10:                                       ; preds = %if.end
  %tobool11 = icmp eq i32 %call7, 0
  br i1 %tobool11, label %lor.rhs, label %lor.end

lor.rhs:                                          ; preds = %if.then.10
  %or = or i32 %b, %a
  %shl.mask = and i32 %or, 2147483647
  %cmp12 = icmp eq i32 %shl.mask, 0
  br label %lor.end

lor.end:                                          ; preds = %if.then.10, %lor.rhs
  %0 = phi i1 [ true, %if.then.10 ], [ %cmp12, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  br label %cleanup

if.end.13:                                        ; preds = %if.end
  %cmp14 = icmp eq i32 %a, %b
  %cmp16 = icmp ult i32 %a, %b
  %conv = zext i1 %cmp16 to i32
  %tobool17 = icmp ne i32 %call7, %conv
  %1 = or i1 %cmp14, %tobool17
  %lor.ext19 = zext i1 %1 to i32
  br label %cleanup

cleanup:                                          ; preds = %if.end.13, %lor.end, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ %lor.ext, %lor.end ], [ %lor.ext19, %if.end.13 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float32_lt(i32 %a, i32 %b) #3 {
entry:
  %call = tail call i32 @extractFloat32Exp(i32 %a)
  %cmp = icmp eq i32 %call, 255
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %call1 = tail call i32 @extractFloat32Frac(i32 %a)
  %tobool = icmp eq i32 %call1, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %call2 = tail call i32 @extractFloat32Exp(i32 %b)
  %cmp3 = icmp eq i32 %call2, 255
  br i1 %cmp3, label %land.lhs.true.4, label %if.end

land.lhs.true.4:                                  ; preds = %lor.lhs.false
  %call5 = tail call i32 @extractFloat32Frac(i32 %b)
  %tobool6 = icmp eq i32 %call5, 0
  br i1 %tobool6, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.4
  tail call void @float_raise(i32 16)
  br label %cleanup

if.end:                                           ; preds = %land.lhs.true.4, %lor.lhs.false
  %call7 = tail call i32 @extractFloat32Sign(i32 %a)
  %call8 = tail call i32 @extractFloat32Sign(i32 %b)
  %cmp9 = icmp eq i32 %call7, %call8
  br i1 %cmp9, label %if.end.13, label %if.then.10

if.then.10:                                       ; preds = %if.end
  %tobool11 = icmp eq i32 %call7, 0
  br i1 %tobool11, label %land.end, label %land.rhs

land.rhs:                                         ; preds = %if.then.10
  %or = or i32 %b, %a
  %shl.mask = and i32 %or, 2147483647
  %cmp12 = icmp ne i32 %shl.mask, 0
  br label %land.end

land.end:                                         ; preds = %if.then.10, %land.rhs
  %0 = phi i1 [ false, %if.then.10 ], [ %cmp12, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  br label %cleanup

if.end.13:                                        ; preds = %if.end
  %cmp16 = icmp ult i32 %a, %b
  %conv = zext i1 %cmp16 to i32
  %tobool17 = icmp ne i32 %call7, %conv
  %not.cmp14 = icmp ne i32 %a, %b
  %1 = and i1 %not.cmp14, %tobool17
  %land.ext19 = zext i1 %1 to i32
  br label %cleanup

cleanup:                                          ; preds = %if.end.13, %land.end, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ %land.ext, %land.end ], [ %land.ext19, %if.end.13 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float32_eq_signaling(i32 %a, i32 %b) #3 {
entry:
  %call = tail call i32 @extractFloat32Exp(i32 %a)
  %cmp = icmp eq i32 %call, 255
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %call1 = tail call i32 @extractFloat32Frac(i32 %a)
  %tobool = icmp eq i32 %call1, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %call2 = tail call i32 @extractFloat32Exp(i32 %b)
  %cmp3 = icmp eq i32 %call2, 255
  br i1 %cmp3, label %land.lhs.true.4, label %if.end

land.lhs.true.4:                                  ; preds = %lor.lhs.false
  %call5 = tail call i32 @extractFloat32Frac(i32 %b)
  %tobool6 = icmp eq i32 %call5, 0
  br i1 %tobool6, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.4
  tail call void @float_raise(i32 16)
  br label %return

if.end:                                           ; preds = %land.lhs.true.4, %lor.lhs.false
  %cmp7 = icmp eq i32 %a, %b
  br i1 %cmp7, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.end
  %or = or i32 %b, %a
  %shl.mask = and i32 %or, 2147483647
  %cmp8 = icmp eq i32 %shl.mask, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.end
  %0 = phi i1 [ true, %if.end ], [ %cmp8, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  br label %return

return:                                           ; preds = %lor.end, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ %lor.ext, %lor.end ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float32_le_quiet(i32 %a, i32 %b) #3 {
entry:
  %call = tail call i32 @extractFloat32Exp(i32 %a)
  %cmp = icmp eq i32 %call, 255
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %call1 = tail call i32 @extractFloat32Frac(i32 %a)
  %tobool = icmp eq i32 %call1, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %call2 = tail call i32 @extractFloat32Exp(i32 %b)
  %cmp3 = icmp eq i32 %call2, 255
  br i1 %cmp3, label %land.lhs.true.4, label %if.end.13

land.lhs.true.4:                                  ; preds = %lor.lhs.false
  %call5 = tail call i32 @extractFloat32Frac(i32 %b)
  %tobool6 = icmp eq i32 %call5, 0
  br i1 %tobool6, label %if.end.13, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.4
  %call7 = tail call i32 @float32_is_signaling_nan(i32 %a)
  %tobool8 = icmp eq i32 %call7, 0
  br i1 %tobool8, label %lor.lhs.false.9, label %if.then.12

lor.lhs.false.9:                                  ; preds = %if.then
  %call10 = tail call i32 @float32_is_signaling_nan(i32 %b)
  %tobool11 = icmp eq i32 %call10, 0
  br i1 %tobool11, label %cleanup, label %if.then.12

if.then.12:                                       ; preds = %lor.lhs.false.9, %if.then
  tail call void @float_raise(i32 16)
  br label %cleanup

if.end.13:                                        ; preds = %land.lhs.true.4, %lor.lhs.false
  %call14 = tail call i32 @extractFloat32Sign(i32 %a)
  %call15 = tail call i32 @extractFloat32Sign(i32 %b)
  %cmp16 = icmp eq i32 %call14, %call15
  br i1 %cmp16, label %if.end.20, label %if.then.17

if.then.17:                                       ; preds = %if.end.13
  %tobool18 = icmp eq i32 %call14, 0
  br i1 %tobool18, label %lor.rhs, label %lor.end

lor.rhs:                                          ; preds = %if.then.17
  %or = or i32 %b, %a
  %shl.mask = and i32 %or, 2147483647
  %cmp19 = icmp eq i32 %shl.mask, 0
  br label %lor.end

lor.end:                                          ; preds = %if.then.17, %lor.rhs
  %0 = phi i1 [ true, %if.then.17 ], [ %cmp19, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  br label %cleanup

if.end.20:                                        ; preds = %if.end.13
  %cmp21 = icmp eq i32 %a, %b
  %cmp23 = icmp ult i32 %a, %b
  %conv = zext i1 %cmp23 to i32
  %tobool24 = icmp ne i32 %call14, %conv
  %1 = or i1 %cmp21, %tobool24
  %lor.ext26 = zext i1 %1 to i32
  br label %cleanup

cleanup:                                          ; preds = %if.then.12, %lor.lhs.false.9, %if.end.20, %lor.end
  %retval.0 = phi i32 [ %lor.ext, %lor.end ], [ %lor.ext26, %if.end.20 ], [ 0, %lor.lhs.false.9 ], [ 0, %if.then.12 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float32_lt_quiet(i32 %a, i32 %b) #3 {
entry:
  %call = tail call i32 @extractFloat32Exp(i32 %a)
  %cmp = icmp eq i32 %call, 255
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %call1 = tail call i32 @extractFloat32Frac(i32 %a)
  %tobool = icmp eq i32 %call1, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %call2 = tail call i32 @extractFloat32Exp(i32 %b)
  %cmp3 = icmp eq i32 %call2, 255
  br i1 %cmp3, label %land.lhs.true.4, label %if.end.13

land.lhs.true.4:                                  ; preds = %lor.lhs.false
  %call5 = tail call i32 @extractFloat32Frac(i32 %b)
  %tobool6 = icmp eq i32 %call5, 0
  br i1 %tobool6, label %if.end.13, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.4
  %call7 = tail call i32 @float32_is_signaling_nan(i32 %a)
  %tobool8 = icmp eq i32 %call7, 0
  br i1 %tobool8, label %lor.lhs.false.9, label %if.then.12

lor.lhs.false.9:                                  ; preds = %if.then
  %call10 = tail call i32 @float32_is_signaling_nan(i32 %b)
  %tobool11 = icmp eq i32 %call10, 0
  br i1 %tobool11, label %cleanup, label %if.then.12

if.then.12:                                       ; preds = %lor.lhs.false.9, %if.then
  tail call void @float_raise(i32 16)
  br label %cleanup

if.end.13:                                        ; preds = %land.lhs.true.4, %lor.lhs.false
  %call14 = tail call i32 @extractFloat32Sign(i32 %a)
  %call15 = tail call i32 @extractFloat32Sign(i32 %b)
  %cmp16 = icmp eq i32 %call14, %call15
  br i1 %cmp16, label %if.end.20, label %if.then.17

if.then.17:                                       ; preds = %if.end.13
  %tobool18 = icmp eq i32 %call14, 0
  br i1 %tobool18, label %land.end, label %land.rhs

land.rhs:                                         ; preds = %if.then.17
  %or = or i32 %b, %a
  %shl.mask = and i32 %or, 2147483647
  %cmp19 = icmp ne i32 %shl.mask, 0
  br label %land.end

land.end:                                         ; preds = %if.then.17, %land.rhs
  %0 = phi i1 [ false, %if.then.17 ], [ %cmp19, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  br label %cleanup

if.end.20:                                        ; preds = %if.end.13
  %cmp23 = icmp ult i32 %a, %b
  %conv = zext i1 %cmp23 to i32
  %tobool24 = icmp ne i32 %call14, %conv
  %not.cmp21 = icmp ne i32 %a, %b
  %1 = and i1 %not.cmp21, %tobool24
  %land.ext26 = zext i1 %1 to i32
  br label %cleanup

cleanup:                                          ; preds = %if.then.12, %lor.lhs.false.9, %if.end.20, %land.end
  %retval.0 = phi i32 [ %land.ext, %land.end ], [ %land.ext26, %if.end.20 ], [ 0, %lor.lhs.false.9 ], [ 0, %if.then.12 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float64_to_int32(i32 %a.0, i32 %a.1) #3 {
entry:
  %absZ = alloca i32, align 4
  %aSigExtra = alloca i32, align 4
  %0 = bitcast i32* %absZ to i8*
  call void @llvm.lifetime.start(i64 4, i8* %0) #1
  %1 = bitcast i32* %aSigExtra to i8*
  call void @llvm.lifetime.start(i64 4, i8* %1) #1
  %call = tail call i32 @extractFloat64Frac1(i32 undef, i32 %a.1)
  %call5 = tail call i32 @extractFloat64Frac0(i32 %a.0, i32 undef)
  %call8 = tail call i32 @extractFloat64Exp(i32 %a.0, i32 undef)
  %call11 = tail call i32 @extractFloat64Sign(i32 %a.0, i32 undef)
  %sub = add nsw i32 %call8, -1043
  %cmp = icmp sgt i32 %sub, -1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %cmp12 = icmp sgt i32 %call8, 1054
  br i1 %cmp12, label %if.then.13, label %if.end.16

if.then.13:                                       ; preds = %if.then
  %cmp14 = icmp ne i32 %call8, 2047
  %or = or i32 %call5, %call
  %tobool = icmp eq i32 %or, 0
  %or.cond122 = or i1 %cmp14, %tobool
  %call11. = select i1 %or.cond122, i32 %call11, i32 0
  br label %invalid

if.end.16:                                        ; preds = %if.then
  %or17 = or i32 %call5, 1048576
  call void @shortShift64Left(i32 %or17, i32 %call, i32 %sub, i32* nonnull %absZ, i32* nonnull %aSigExtra)
  %2 = load i32, i32* %absZ, align 4, !tbaa !1
  %cmp18 = icmp ugt i32 %2, -2147483648
  br i1 %cmp18, label %invalid, label %if.end.32thread-pre-split

if.else:                                          ; preds = %entry
  %cmp21 = icmp ne i32 %call, 0
  %conv = zext i1 %cmp21 to i32
  %cmp22 = icmp slt i32 %call8, 1022
  br i1 %cmp22, label %if.then.24, label %if.else.27

if.then.24:                                       ; preds = %if.else
  %or25 = or i32 %call8, %call5
  %or26 = or i32 %or25, %conv
  store i32 %or26, i32* %aSigExtra, align 4, !tbaa !1
  store i32 0, i32* %absZ, align 4, !tbaa !1
  br label %if.end.32

if.else.27:                                       ; preds = %if.else
  %or28 = or i32 %call5, 1048576
  %and = and i32 %sub, 31
  %shl = shl i32 %or28, %and
  %or29 = or i32 %shl, %conv
  store i32 %or29, i32* %aSigExtra, align 4, !tbaa !1
  %sub30 = sub i32 1043, %call8
  %shr = lshr i32 %or28, %sub30
  store i32 %shr, i32* %absZ, align 4, !tbaa !1
  br label %if.end.32

if.end.32thread-pre-split:                        ; preds = %if.end.16
  %.pr = load i32, i32* %aSigExtra, align 4, !tbaa !1
  br label %if.end.32

if.end.32:                                        ; preds = %if.end.32thread-pre-split, %if.then.24, %if.else.27
  %3 = phi i32 [ %.pr, %if.end.32thread-pre-split ], [ %or26, %if.then.24 ], [ %or29, %if.else.27 ]
  %4 = load i32, i32* @float_rounding_mode, align 4, !tbaa !1
  %cmp33 = icmp eq i32 %4, 0
  br i1 %cmp33, label %if.then.35, label %if.else.48

if.then.35:                                       ; preds = %if.end.32
  %cmp36 = icmp slt i32 %3, 0
  br i1 %cmp36, label %if.then.38, label %if.end.45

if.then.38:                                       ; preds = %if.then.35
  %5 = load i32, i32* %absZ, align 4, !tbaa !1
  %inc = add i32 %5, 1
  store i32 %inc, i32* %absZ, align 4, !tbaa !1
  %6 = load i32, i32* %aSigExtra, align 4, !tbaa !1
  %shl39.mask = and i32 %6, 2147483647
  %cmp40 = icmp eq i32 %shl39.mask, 0
  br i1 %cmp40, label %if.then.42, label %if.end.45

if.then.42:                                       ; preds = %if.then.38
  %and43 = and i32 %inc, -2
  store i32 %and43, i32* %absZ, align 4, !tbaa !1
  br label %if.end.45

if.end.45:                                        ; preds = %if.then.38, %if.then.42, %if.then.35
  %tobool46 = icmp ne i32 %call11, 0
  %7 = load i32, i32* %absZ, align 4, !tbaa !1
  %sub47 = sub i32 0, %7
  %cond = select i1 %tobool46, i32 %sub47, i32 %7
  br label %if.end.63

if.else.48:                                       ; preds = %if.end.32
  %cmp49 = icmp ne i32 %3, 0
  %conv50 = zext i1 %cmp49 to i32
  store i32 %conv50, i32* %aSigExtra, align 4, !tbaa !1
  %tobool51 = icmp eq i32 %call11, 0
  %8 = load i32, i32* %absZ, align 4, !tbaa !1
  br i1 %tobool51, label %if.else.57, label %if.then.52

if.then.52:                                       ; preds = %if.else.48
  %cmp53 = icmp eq i32 %4, 3
  %and55121 = and i1 %cmp49, %cmp53
  %and55 = zext i1 %and55121 to i32
  %add = add i32 %and55, %8
  %sub56 = sub i32 0, %add
  br label %if.end.63

if.else.57:                                       ; preds = %if.else.48
  %cmp58 = icmp eq i32 %4, 2
  %and60120 = and i1 %cmp49, %cmp58
  %and60 = zext i1 %and60120 to i32
  %add61 = add i32 %8, %and60
  br label %if.end.63

if.end.63:                                        ; preds = %if.then.52, %if.else.57, %if.end.45
  %z.0 = phi i32 [ %cond, %if.end.45 ], [ %sub56, %if.then.52 ], [ %add61, %if.else.57 ]
  %z.0.lobit = lshr i32 %z.0, 31
  %tobool66 = icmp ne i32 %call11, %z.0.lobit
  %tobool68 = icmp ne i32 %z.0, 0
  %or.cond = and i1 %tobool68, %tobool66
  br i1 %or.cond, label %invalid, label %if.end.72

invalid:                                          ; preds = %if.then.13, %if.end.63, %if.end.16
  %aSign.0 = phi i32 [ %call11, %if.end.16 ], [ %call11, %if.end.63 ], [ %call11., %if.then.13 ]
  tail call void @float_raise(i32 16)
  %tobool70 = icmp ne i32 %aSign.0, 0
  %cond71 = select i1 %tobool70, i32 -2147483648, i32 2147483647
  br label %cleanup

if.end.72:                                        ; preds = %if.end.63
  %9 = load i32, i32* %aSigExtra, align 4, !tbaa !1
  %tobool73 = icmp eq i32 %9, 0
  br i1 %tobool73, label %cleanup, label %if.then.74

if.then.74:                                       ; preds = %if.end.72
  %10 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or75 = or i32 %10, 1
  store i32 %or75, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

cleanup:                                          ; preds = %if.then.74, %if.end.72, %invalid
  %retval.0 = phi i32 [ %cond71, %invalid ], [ %z.0, %if.end.72 ], [ %z.0, %if.then.74 ]
  call void @llvm.lifetime.end(i64 4, i8* %1) #1
  call void @llvm.lifetime.end(i64 4, i8* %0) #1
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float64_to_int32_round_to_zero(i32 %a.0, i32 %a.1) #3 {
entry:
  %absZ = alloca i32, align 4
  %aSigExtra = alloca i32, align 4
  %0 = bitcast i32* %absZ to i8*
  call void @llvm.lifetime.start(i64 4, i8* %0) #1
  %1 = bitcast i32* %aSigExtra to i8*
  call void @llvm.lifetime.start(i64 4, i8* %1) #1
  %call = tail call i32 @extractFloat64Frac1(i32 undef, i32 %a.1)
  %call5 = tail call i32 @extractFloat64Frac0(i32 %a.0, i32 undef)
  %call8 = tail call i32 @extractFloat64Exp(i32 %a.0, i32 undef)
  %call11 = tail call i32 @extractFloat64Sign(i32 %a.0, i32 undef)
  %sub = add nsw i32 %call8, -1043
  %cmp = icmp sgt i32 %sub, -1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %cmp12 = icmp sgt i32 %call8, 1054
  br i1 %cmp12, label %if.then.13, label %if.end.16

if.then.13:                                       ; preds = %if.then
  %cmp14 = icmp ne i32 %call8, 2047
  %or = or i32 %call5, %call
  %tobool = icmp eq i32 %or, 0
  %or.cond82 = or i1 %cmp14, %tobool
  %call11. = select i1 %or.cond82, i32 %call11, i32 0
  br label %invalid

if.end.16:                                        ; preds = %if.then
  %or17 = or i32 %call5, 1048576
  call void @shortShift64Left(i32 %or17, i32 %call, i32 %sub, i32* nonnull %absZ, i32* nonnull %aSigExtra)
  br label %if.end.30

if.else:                                          ; preds = %entry
  %cmp18 = icmp slt i32 %call8, 1023
  br i1 %cmp18, label %if.then.19, label %if.end.26

if.then.19:                                       ; preds = %if.else
  %or20 = or i32 %call5, %call
  %or21 = or i32 %or20, %call8
  %tobool22 = icmp eq i32 %or21, 0
  br i1 %tobool22, label %cleanup, label %if.then.23

if.then.23:                                       ; preds = %if.then.19
  %2 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or24 = or i32 %2, 1
  store i32 %or24, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

if.end.26:                                        ; preds = %if.else
  %or27 = or i32 %call5, 1048576
  %and = and i32 %sub, 31
  %shl = shl i32 %or27, %and
  %or28 = or i32 %shl, %call
  store i32 %or28, i32* %aSigExtra, align 4, !tbaa !1
  %sub29 = sub i32 1043, %call8
  %shr = lshr i32 %or27, %sub29
  store i32 %shr, i32* %absZ, align 4, !tbaa !1
  br label %if.end.30

if.end.30:                                        ; preds = %if.end.26, %if.end.16
  %tobool31 = icmp ne i32 %call11, 0
  %3 = load i32, i32* %absZ, align 4, !tbaa !1
  %sub32 = sub i32 0, %3
  %cond = select i1 %tobool31, i32 %sub32, i32 %3
  %cond.lobit = lshr i32 %cond, 31
  %tobool34 = icmp ne i32 %call11, %cond.lobit
  %tobool36 = icmp ne i32 %3, 0
  %or.cond = and i1 %tobool36, %tobool34
  br i1 %or.cond, label %invalid, label %if.end.40

invalid:                                          ; preds = %if.then.13, %if.end.30
  %aSign.0 = phi i32 [ %call11, %if.end.30 ], [ %call11., %if.then.13 ]
  tail call void @float_raise(i32 16)
  %tobool38 = icmp ne i32 %aSign.0, 0
  %cond39 = select i1 %tobool38, i32 -2147483648, i32 2147483647
  br label %cleanup

if.end.40:                                        ; preds = %if.end.30
  %4 = load i32, i32* %aSigExtra, align 4, !tbaa !1
  %tobool41 = icmp eq i32 %4, 0
  br i1 %tobool41, label %cleanup, label %if.then.42

if.then.42:                                       ; preds = %if.end.40
  %5 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or43 = or i32 %5, 1
  store i32 %or43, i32* @float_exception_flags, align 4, !tbaa !1
  br label %cleanup

cleanup:                                          ; preds = %if.then.42, %if.end.40, %if.then.23, %if.then.19, %invalid
  %retval.0 = phi i32 [ %cond39, %invalid ], [ 0, %if.then.19 ], [ 0, %if.then.23 ], [ %cond, %if.end.40 ], [ %cond, %if.then.42 ]
  call void @llvm.lifetime.end(i64 4, i8* %1) #1
  call void @llvm.lifetime.end(i64 4, i8* %0) #1
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float64_to_float32(i32 %a.0, i32 %a.1) #3 {
entry:
  %zSig = alloca i32, align 4
  %allZero = alloca i32, align 4
  %agg.tmp = alloca %struct.commonNaNT, align 4
  %0 = bitcast i32* %zSig to i8*
  call void @llvm.lifetime.start(i64 4, i8* %0) #1
  %1 = bitcast i32* %allZero to i8*
  call void @llvm.lifetime.start(i64 4, i8* %1) #1
  %call = tail call i32 @extractFloat64Frac1(i32 undef, i32 %a.1)
  %call5 = tail call i32 @extractFloat64Frac0(i32 %a.0, i32 undef)
  %call8 = tail call i32 @extractFloat64Exp(i32 %a.0, i32 undef)
  %call11 = tail call i32 @extractFloat64Sign(i32 %a.0, i32 undef)
  %cmp = icmp eq i32 %call8, 2047
  br i1 %cmp, label %if.then, label %if.end.19

if.then:                                          ; preds = %entry
  %or = or i32 %call5, %call
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %if.end, label %if.then.12

if.then.12:                                       ; preds = %if.then
  call fastcc void @float64ToCommonNaN(%struct.commonNaNT* nonnull sret %agg.tmp, i32 %a.0, i32 %a.1)
  %sign = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %agg.tmp, i32 0, i32 0
  %2 = load i32, i32* %sign, align 4, !tbaa !5
  %high15 = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %agg.tmp, i32 0, i32 1
  %3 = load i32, i32* %high15, align 4, !tbaa !7
  %call17 = tail call fastcc i32 @commonNaNToFloat32(i32 %2, i32 %3)
  br label %cleanup

if.end:                                           ; preds = %if.then
  %call18 = tail call i32 @packFloat32(i32 %call11, i32 255, i32 0)
  br label %cleanup

if.end.19:                                        ; preds = %entry
  call void @shift64RightJamming(i32 %call5, i32 %call, i32 22, i32* nonnull %allZero, i32* nonnull %zSig)
  %tobool20 = icmp eq i32 %call8, 0
  br i1 %tobool20, label %if.end.23, label %if.then.21

if.then.21:                                       ; preds = %if.end.19
  %4 = load i32, i32* %zSig, align 4, !tbaa !1
  %or22 = or i32 %4, 1073741824
  store i32 %or22, i32* %zSig, align 4, !tbaa !1
  br label %if.end.23

if.end.23:                                        ; preds = %if.end.19, %if.then.21
  %sub = add nsw i32 %call8, -897
  %5 = load i32, i32* %zSig, align 4, !tbaa !1
  %call24 = tail call fastcc i32 @roundAndPackFloat32(i32 %call11, i32 %sub, i32 %5)
  br label %cleanup

cleanup:                                          ; preds = %if.end.23, %if.end, %if.then.12
  %retval.0 = phi i32 [ %call17, %if.then.12 ], [ %call18, %if.end ], [ %call24, %if.end.23 ]
  call void @llvm.lifetime.end(i64 4, i8* %1) #1
  call void @llvm.lifetime.end(i64 4, i8* %0) #1
  ret i32 %retval.0
}

; Function Attrs: nounwind readnone
define internal fastcc i32 @commonNaNToFloat32(i32 %a.0, i32 %a.1) #4 {
entry:
  %shl = shl i32 %a.0, 31
  %shr = lshr i32 %a.1, 9
  %or = or i32 %shl, %shr
  %or3 = or i32 %or, 2143289344
  ret i32 %or3
}

; Function Attrs: nounwind
define internal fastcc void @float64ToCommonNaN(%struct.commonNaNT* noalias nocapture sret %agg.result, i32 %a.0, i32 %a.1) #3 {
entry:
  %z = alloca %struct.commonNaNT, align 4
  %0 = bitcast %struct.commonNaNT* %z to i8*
  call void @llvm.lifetime.start(i64 12, i8* %0) #1
  %call = tail call i32 @float64_is_signaling_nan(i32 %a.0, i32 %a.1)
  %tobool = icmp eq i32 %call, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @float_raise(i32 16)
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %shr = lshr i32 %a.0, 31
  %sign = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %z, i32 0, i32 0
  store i32 %shr, i32* %sign, align 4, !tbaa !5
  %high6 = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %z, i32 0, i32 1
  %low7 = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %z, i32 0, i32 2
  call void @shortShift64Left(i32 %a.0, i32 %a.1, i32 12, i32* %high6, i32* %low7)
  %1 = bitcast %struct.commonNaNT* %agg.result to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %1, i8* %0, i32 12, i32 4, i1 false), !tbaa.struct !13
  call void @llvm.lifetime.end(i64 12, i8* %0) #1
  ret void
}

; Function Attrs: nounwind
define i64 @float64_round_to_int(i32 %a.0, i32 %a.1) #3 {
entry:
  %z = alloca %struct.float64, align 4
  %0 = bitcast %struct.float64* %z to i8*
  call void @llvm.lifetime.start(i64 8, i8* %0) #1
  %call = tail call i32 @extractFloat64Exp(i32 %a.0, i32 undef)
  %cmp = icmp sgt i32 %call, 1042
  br i1 %cmp, label %if.then, label %if.else.67

if.then:                                          ; preds = %entry
  %cmp3 = icmp sgt i32 %call, 1074
  br i1 %cmp3, label %if.then.4, label %if.end.18

if.then.4:                                        ; preds = %if.then
  %cmp5 = icmp eq i32 %call, 2047
  br i1 %cmp5, label %land.lhs.true, label %cleanup

land.lhs.true:                                    ; preds = %if.then.4
  %call8 = tail call i32 @extractFloat64Frac0(i32 %a.0, i32 undef)
  %call11 = tail call i32 @extractFloat64Frac1(i32 undef, i32 %a.1)
  %or = or i32 %call11, %call8
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %cleanup, label %if.then.12

if.then.12:                                       ; preds = %land.lhs.true
  %call17 = tail call fastcc i64 @propagateFloat64NaN(i32 %a.0, i32 %a.1, i32 %a.0, i32 %a.1)
  %retval.sroa.0.0.extract.trunc = trunc i64 %call17 to i32
  %retval.sroa.11.0.extract.shift = lshr i64 %call17, 32
  %retval.sroa.11.0.extract.trunc = trunc i64 %retval.sroa.11.0.extract.shift to i32
  br label %cleanup

if.end.18:                                        ; preds = %if.then
  %sub = sub nsw i32 1074, %call
  %shl19 = shl i32 2, %sub
  %sub20 = add i32 %shl19, -1
  %a.sroa.0.0..sroa_idx = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 0
  store i32 %a.0, i32* %a.sroa.0.0..sroa_idx, align 4
  %a.sroa.15.0..sroa_idx219 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 1
  store i32 %a.1, i32* %a.sroa.15.0..sroa_idx219, align 4
  %1 = load i32, i32* @float_rounding_mode, align 4, !tbaa !1
  switch i32 %1, label %if.then.50 [
    i32 0, label %if.then.22
    i32 1, label %if.end.63
  ]

if.then.22:                                       ; preds = %if.end.18
  %tobool23 = icmp ult i32 %sub, 31
  br i1 %tobool23, label %if.then.24, label %if.else

if.then.24:                                       ; preds = %if.then.22
  %2 = load i32, i32* %a.sroa.0.0..sroa_idx, align 4, !tbaa !9
  %shr = lshr i32 %shl19, 1
  call void @add64(i32 %2, i32 %a.1, i32 0, i32 %shr, i32* %a.sroa.0.0..sroa_idx, i32* %a.sroa.15.0..sroa_idx219)
  %3 = load i32, i32* %a.sroa.15.0..sroa_idx219, align 4, !tbaa !14
  %and = and i32 %3, %sub20
  %cmp30 = icmp eq i32 %and, 0
  br i1 %cmp30, label %if.then.31, label %if.end.63

if.then.31:                                       ; preds = %if.then.24
  %neg = xor i32 %shl19, -1
  %and33 = and i32 %3, %neg
  store i32 %and33, i32* %a.sroa.15.0..sroa_idx219, align 4, !tbaa !14
  br label %if.end.63

if.else:                                          ; preds = %if.then.22
  %cmp36 = icmp slt i32 %a.1, 0
  br i1 %cmp36, label %if.then.37, label %if.end.63

if.then.37:                                       ; preds = %if.else
  %4 = load i32, i32* %a.sroa.0.0..sroa_idx, align 4, !tbaa !9
  %inc = add i32 %4, 1
  store i32 %inc, i32* %a.sroa.0.0..sroa_idx, align 4, !tbaa !9
  %5 = load i32, i32* %a.sroa.15.0..sroa_idx219, align 4, !tbaa !14
  %shl40.mask = and i32 %5, 2147483647
  %cmp41 = icmp eq i32 %shl40.mask, 0
  br i1 %cmp41, label %if.then.42, label %if.end.63

if.then.42:                                       ; preds = %if.then.37
  %and44 = and i32 %inc, -2
  store i32 %and44, i32* %a.sroa.0.0..sroa_idx, align 4, !tbaa !9
  br label %if.end.63

if.then.50:                                       ; preds = %if.end.18
  %6 = load i32, i32* %a.sroa.0.0..sroa_idx, align 4, !tbaa !9
  %call53 = tail call i32 @extractFloat64Sign(i32 %6, i32 undef)
  %cmp54 = icmp eq i32 %1, 2
  %conv = zext i1 %cmp54 to i32
  %tobool55 = icmp eq i32 %call53, %conv
  br i1 %tobool55, label %if.end.63, label %if.then.56

if.then.56:                                       ; preds = %if.then.50
  call void @add64(i32 %6, i32 %a.1, i32 0, i32 %sub20, i32* %a.sroa.0.0..sroa_idx, i32* %a.sroa.15.0..sroa_idx219)
  br label %if.end.63

if.end.63:                                        ; preds = %if.end.18, %if.then.50, %if.then.56, %if.then.31, %if.then.24, %if.then.37, %if.then.42, %if.else
  %neg64 = sub i32 0, %shl19
  %7 = load i32, i32* %a.sroa.15.0..sroa_idx219, align 4, !tbaa !14
  %and66 = and i32 %7, %neg64
  store i32 %and66, i32* %a.sroa.15.0..sroa_idx219, align 4, !tbaa !14
  br label %if.end.157

if.else.67:                                       ; preds = %entry
  %cmp68 = icmp slt i32 %call, 1023
  br i1 %cmp68, label %if.then.70, label %if.end.109

if.then.70:                                       ; preds = %if.else.67
  %shl72 = shl i32 %a.0, 1
  %or74 = or i32 %shl72, %a.1
  %cmp75 = icmp eq i32 %or74, 0
  br i1 %cmp75, label %cleanup, label %if.end.78

if.end.78:                                        ; preds = %if.then.70
  %8 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or79 = or i32 %8, 1
  store i32 %or79, i32* @float_exception_flags, align 4, !tbaa !1
  %call82 = tail call i32 @extractFloat64Sign(i32 %a.0, i32 undef)
  %9 = load i32, i32* @float_rounding_mode, align 4, !tbaa !1
  switch i32 %9, label %sw.epilog [
    i32 0, label %sw.bb
    i32 3, label %sw.bb.97
    i32 2, label %sw.bb.101
  ]

sw.bb:                                            ; preds = %if.end.78
  %cmp83 = icmp eq i32 %call, 1022
  br i1 %cmp83, label %land.lhs.true.85, label %sw.epilog

land.lhs.true.85:                                 ; preds = %sw.bb
  %call88 = tail call i32 @extractFloat64Frac0(i32 %a.0, i32 undef)
  %call91 = tail call i32 @extractFloat64Frac1(i32 undef, i32 %a.1)
  %or92 = or i32 %call91, %call88
  %tobool93 = icmp eq i32 %or92, 0
  br i1 %tobool93, label %sw.epilog, label %if.then.94

if.then.94:                                       ; preds = %land.lhs.true.85
  %call95 = tail call i64 @packFloat64(i32 %call82, i32 1023, i32 0, i32 0)
  %retval.sroa.0.0.extract.trunc235 = trunc i64 %call95 to i32
  %retval.sroa.11.0.extract.shift241 = lshr i64 %call95, 32
  %retval.sroa.11.0.extract.trunc242 = trunc i64 %retval.sroa.11.0.extract.shift241 to i32
  br label %cleanup

sw.bb.97:                                         ; preds = %if.end.78
  %tobool98 = icmp eq i32 %call82, 0
  br i1 %tobool98, label %cond.false, label %cond.true

cond.true:                                        ; preds = %sw.bb.97
  %call99 = tail call i64 @packFloat64(i32 1, i32 1023, i32 0, i32 0)
  %extract.t = trunc i64 %call99 to i32
  %extract = lshr i64 %call99, 32
  %extract.t271 = trunc i64 %extract to i32
  br label %cleanup

cond.false:                                       ; preds = %sw.bb.97
  %call100 = tail call i64 @packFloat64(i32 0, i32 0, i32 0, i32 0)
  %extract.t270 = trunc i64 %call100 to i32
  %extract272 = lshr i64 %call100, 32
  %extract.t273 = trunc i64 %extract272 to i32
  br label %cleanup

sw.bb.101:                                        ; preds = %if.end.78
  %tobool102 = icmp eq i32 %call82, 0
  br i1 %tobool102, label %cond.false.105, label %cond.true.103

cond.true.103:                                    ; preds = %sw.bb.101
  %call104 = tail call i64 @packFloat64(i32 1, i32 0, i32 0, i32 0)
  %extract.t264 = trunc i64 %call104 to i32
  %extract266 = lshr i64 %call104, 32
  %extract.t267 = trunc i64 %extract266 to i32
  br label %cleanup

cond.false.105:                                   ; preds = %sw.bb.101
  %call106 = tail call i64 @packFloat64(i32 0, i32 1023, i32 0, i32 0)
  %extract.t265 = trunc i64 %call106 to i32
  %extract268 = lshr i64 %call106, 32
  %extract.t269 = trunc i64 %extract268 to i32
  br label %cleanup

sw.epilog:                                        ; preds = %land.lhs.true.85, %sw.bb, %if.end.78
  %call108 = tail call i64 @packFloat64(i32 %call82, i32 0, i32 0, i32 0)
  %retval.sroa.0.0.extract.trunc240 = trunc i64 %call108 to i32
  %retval.sroa.11.0.extract.shift251 = lshr i64 %call108, 32
  %retval.sroa.11.0.extract.trunc252 = trunc i64 %retval.sroa.11.0.extract.shift251 to i32
  br label %cleanup

if.end.109:                                       ; preds = %if.else.67
  %sub110 = sub nsw i32 1043, %call
  %shl111 = shl i32 1, %sub110
  %sub112 = add i32 %shl111, -1
  %low113 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 1
  store i32 0, i32* %low113, align 4, !tbaa !14
  %high115 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 0
  store i32 %a.0, i32* %high115, align 4, !tbaa !9
  %10 = load i32, i32* @float_rounding_mode, align 4, !tbaa !1
  switch i32 %10, label %if.then.135 [
    i32 0, label %if.then.118
    i32 1, label %if.end.153
  ]

if.then.118:                                      ; preds = %if.end.109
  %shr119 = lshr i32 %shl111, 1
  %add = add i32 %shr119, %a.0
  store i32 %add, i32* %high115, align 4, !tbaa !9
  %and122 = and i32 %add, %sub112
  %or124 = or i32 %and122, %a.1
  %cmp125 = icmp eq i32 %or124, 0
  br i1 %cmp125, label %if.then.127, label %if.end.153

if.then.127:                                      ; preds = %if.then.118
  %neg128 = xor i32 %shl111, -1
  %and130 = and i32 %add, %neg128
  store i32 %and130, i32* %high115, align 4, !tbaa !9
  br label %if.end.153

if.then.135:                                      ; preds = %if.end.109
  %call138 = tail call i32 @extractFloat64Sign(i32 %a.0, i32 undef)
  %cmp139 = icmp eq i32 %10, 2
  %conv140 = zext i1 %cmp139 to i32
  %tobool142 = icmp eq i32 %call138, %conv140
  br i1 %tobool142, label %if.end.153, label %if.then.143

if.then.143:                                      ; preds = %if.then.135
  %cmp145 = icmp ne i32 %a.1, 0
  %conv146 = zext i1 %cmp145 to i32
  %or148 = or i32 %conv146, %a.0
  %add150 = add i32 %sub112, %or148
  store i32 %add150, i32* %high115, align 4, !tbaa !9
  br label %if.end.153

if.end.153:                                       ; preds = %if.end.109, %if.then.135, %if.then.143, %if.then.118, %if.then.127
  %neg154 = sub i32 0, %shl111
  %11 = load i32, i32* %high115, align 4, !tbaa !9
  %and156 = and i32 %11, %neg154
  store i32 %and156, i32* %high115, align 4, !tbaa !9
  br label %if.end.157

if.end.157:                                       ; preds = %if.end.153, %if.end.63
  %low158 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 1
  %12 = load i32, i32* %low158, align 4, !tbaa !14
  %cmp160 = icmp eq i32 %12, %a.1
  br i1 %cmp160, label %lor.lhs.false, label %if.then.166

lor.lhs.false:                                    ; preds = %if.end.157
  %high162 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 0
  %13 = load i32, i32* %high162, align 4, !tbaa !9
  %cmp164 = icmp eq i32 %13, %a.0
  br i1 %cmp164, label %if.end.168, label %if.then.166

if.then.166:                                      ; preds = %lor.lhs.false, %if.end.157
  %14 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or167 = or i32 %14, 1
  store i32 %or167, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.168

if.end.168:                                       ; preds = %lor.lhs.false, %if.then.166
  %retval.sroa.0.0..sroa_idx = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 0
  %retval.sroa.0.0.copyload = load i32, i32* %retval.sroa.0.0..sroa_idx, align 4
  %retval.sroa.11.0.copyload = load i32, i32* %low158, align 4
  br label %cleanup

cleanup:                                          ; preds = %cond.true.103, %cond.false.105, %cond.true, %cond.false, %if.then.70, %if.then.4, %land.lhs.true, %if.end.168, %sw.epilog, %if.then.94, %if.then.12
  %retval.sroa.0.2 = phi i32 [ %retval.sroa.0.0.extract.trunc, %if.then.12 ], [ %retval.sroa.0.0.copyload, %if.end.168 ], [ %retval.sroa.0.0.extract.trunc240, %sw.epilog ], [ %retval.sroa.0.0.extract.trunc235, %if.then.94 ], [ %a.0, %land.lhs.true ], [ %a.0, %if.then.4 ], [ %a.0, %if.then.70 ], [ %extract.t, %cond.true ], [ %extract.t270, %cond.false ], [ %extract.t264, %cond.true.103 ], [ %extract.t265, %cond.false.105 ]
  %retval.sroa.11.2 = phi i32 [ %retval.sroa.11.0.extract.trunc, %if.then.12 ], [ %retval.sroa.11.0.copyload, %if.end.168 ], [ %retval.sroa.11.0.extract.trunc252, %sw.epilog ], [ %retval.sroa.11.0.extract.trunc242, %if.then.94 ], [ %a.1, %land.lhs.true ], [ %a.1, %if.then.4 ], [ %a.1, %if.then.70 ], [ %extract.t271, %cond.true ], [ %extract.t273, %cond.false ], [ %extract.t267, %cond.true.103 ], [ %extract.t269, %cond.false.105 ]
  call void @llvm.lifetime.end(i64 8, i8* %0) #1
  %retval.sroa.11.0.insert.ext = zext i32 %retval.sroa.11.2 to i64
  %retval.sroa.11.0.insert.shift = shl nuw i64 %retval.sroa.11.0.insert.ext, 32
  %retval.sroa.0.0.insert.ext = zext i32 %retval.sroa.0.2 to i64
  %retval.sroa.0.0.insert.insert = or i64 %retval.sroa.11.0.insert.shift, %retval.sroa.0.0.insert.ext
  ret i64 %retval.sroa.0.0.insert.insert
}

; Function Attrs: nounwind
define internal fastcc i64 @propagateFloat64NaN(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #3 {
entry:
  %call8 = tail call i32 @float64_is_signaling_nan(i32 %a.0, i32 %a.1)
  %call11 = tail call i32 @float64_is_nan(i32 %b.0, i32 %b.1)
  %call14 = tail call i32 @float64_is_signaling_nan(i32 %b.0, i32 %b.1)
  %or = or i32 %a.0, 524288
  %or17 = or i32 %b.0, 524288
  %or18 = or i32 %call14, %call8
  %tobool = icmp eq i32 %or18, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @float_raise(i32 16)
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %tobool19 = icmp eq i32 %call14, 0
  br i1 %tobool19, label %cond.false, label %cond.end.27

cond.false:                                       ; preds = %if.end
  %tobool20 = icmp eq i32 %call8, 0
  br i1 %tobool20, label %cond.false.22, label %cond.end.27

cond.false.22:                                    ; preds = %cond.false
  %tobool23 = icmp eq i32 %call11, 0
  %or.or17 = select i1 %tobool23, i32 %or, i32 %or17
  %a.1.b.1 = select i1 %tobool23, i32 %a.1, i32 %b.1
  br label %cond.end.27

cond.end.27:                                      ; preds = %cond.false.22, %cond.false, %if.end
  %retval.sroa.0.0 = phi i32 [ %or17, %if.end ], [ %or, %cond.false ], [ %or.or17, %cond.false.22 ]
  %retval.sroa.5.0 = phi i32 [ %b.1, %if.end ], [ %a.1, %cond.false ], [ %a.1.b.1, %cond.false.22 ]
  %retval.sroa.5.0.insert.ext = zext i32 %retval.sroa.5.0 to i64
  %retval.sroa.5.0.insert.shift = shl nuw i64 %retval.sroa.5.0.insert.ext, 32
  %retval.sroa.0.0.insert.ext = zext i32 %retval.sroa.0.0 to i64
  %retval.sroa.0.0.insert.insert = or i64 %retval.sroa.5.0.insert.shift, %retval.sroa.0.0.insert.ext
  ret i64 %retval.sroa.0.0.insert.insert
}

; Function Attrs: nounwind
define i64 @float64_add(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #3 {
entry:
  %call = tail call i32 @extractFloat64Sign(i32 %a.0, i32 undef)
  %call8 = tail call i32 @extractFloat64Sign(i32 %b.0, i32 undef)
  %cmp = icmp eq i32 %call, %call8
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call13 = tail call fastcc i64 @addFloat64Sigs(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1, i32 %call)
  br label %cleanup

if.else:                                          ; preds = %entry
  %call18 = tail call fastcc i64 @subFloat64Sigs(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1, i32 %call)
  br label %cleanup

cleanup:                                          ; preds = %if.else, %if.then
  %retval.sroa.0.0 = phi i64 [ %call13, %if.then ], [ %call18, %if.else ]
  ret i64 %retval.sroa.0.0
}

; Function Attrs: nounwind
define internal fastcc i64 @addFloat64Sigs(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1, i32 %zSign) #3 {
entry:
  %aSig0 = alloca i32, align 4
  %aSig1 = alloca i32, align 4
  %bSig0 = alloca i32, align 4
  %bSig1 = alloca i32, align 4
  %zSig0 = alloca i32, align 4
  %zSig1 = alloca i32, align 4
  %zSig2 = alloca i32, align 4
  %0 = bitcast i32* %aSig0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %0) #1
  %1 = bitcast i32* %aSig1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %1) #1
  %2 = bitcast i32* %bSig0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %2) #1
  %3 = bitcast i32* %bSig1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %3) #1
  %4 = bitcast i32* %zSig0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %4) #1
  %5 = bitcast i32* %zSig1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %5) #1
  %6 = bitcast i32* %zSig2 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %6) #1
  %call = tail call i32 @extractFloat64Frac1(i32 undef, i32 %a.1)
  store i32 %call, i32* %aSig1, align 4, !tbaa !1
  %call8 = tail call i32 @extractFloat64Frac0(i32 %a.0, i32 undef)
  store i32 %call8, i32* %aSig0, align 4, !tbaa !1
  %call11 = tail call i32 @extractFloat64Exp(i32 %a.0, i32 undef)
  %call14 = tail call i32 @extractFloat64Frac1(i32 undef, i32 %b.1)
  store i32 %call14, i32* %bSig1, align 4, !tbaa !1
  %call17 = tail call i32 @extractFloat64Frac0(i32 %b.0, i32 undef)
  store i32 %call17, i32* %bSig0, align 4, !tbaa !1
  %call20 = tail call i32 @extractFloat64Exp(i32 %b.0, i32 undef)
  %sub = sub nsw i32 %call11, %call20
  %cmp = icmp sgt i32 %sub, 0
  br i1 %cmp, label %if.then, label %if.else.34

if.then:                                          ; preds = %entry
  %cmp21 = icmp eq i32 %call11, 2047
  br i1 %cmp21, label %if.then.22, label %if.end.29

if.then.22:                                       ; preds = %if.then
  %7 = load i32, i32* %aSig0, align 4, !tbaa !1
  %8 = load i32, i32* %aSig1, align 4, !tbaa !1
  %or = or i32 %8, %7
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %cleanup, label %if.then.23

if.then.23:                                       ; preds = %if.then.22
  %call28 = tail call fastcc i64 @propagateFloat64NaN(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1)
  %retval.sroa.0.0.extract.trunc = trunc i64 %call28 to i32
  %retval.sroa.9.0.extract.shift = lshr i64 %call28, 32
  %retval.sroa.9.0.extract.trunc = trunc i64 %retval.sroa.9.0.extract.shift to i32
  br label %cleanup

if.end.29:                                        ; preds = %if.then
  %cmp30 = icmp eq i32 %call20, 0
  br i1 %cmp30, label %if.then.31, label %if.else

if.then.31:                                       ; preds = %if.end.29
  %dec = add nsw i32 %sub, -1
  br label %if.end.33

if.else:                                          ; preds = %if.end.29
  %or32 = or i32 %call17, 1048576
  store i32 %or32, i32* %bSig0, align 4, !tbaa !1
  br label %if.end.33

if.end.33:                                        ; preds = %if.else, %if.then.31
  %expDiff.0 = phi i32 [ %dec, %if.then.31 ], [ %sub, %if.else ]
  %9 = load i32, i32* %bSig0, align 4, !tbaa !1
  %10 = load i32, i32* %bSig1, align 4, !tbaa !1
  call void @shift64ExtraRightJamming(i32 %9, i32 %10, i32 0, i32 %expDiff.0, i32* nonnull %bSig0, i32* nonnull %bSig1, i32* nonnull %zSig2)
  br label %if.end.77

if.else.34:                                       ; preds = %entry
  %cmp35 = icmp slt i32 %sub, 0
  br i1 %cmp35, label %if.then.36, label %if.else.56

if.then.36:                                       ; preds = %if.else.34
  %cmp37 = icmp eq i32 %call20, 2047
  br i1 %cmp37, label %if.then.38, label %if.end.49

if.then.38:                                       ; preds = %if.then.36
  %11 = load i32, i32* %bSig1, align 4, !tbaa !1
  %or39 = or i32 %11, %call17
  %tobool40 = icmp eq i32 %or39, 0
  br i1 %tobool40, label %if.end.47, label %if.then.41

if.then.41:                                       ; preds = %if.then.38
  %call46 = tail call fastcc i64 @propagateFloat64NaN(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1)
  %retval.sroa.0.0.extract.trunc142 = trunc i64 %call46 to i32
  %retval.sroa.9.0.extract.shift147 = lshr i64 %call46, 32
  %retval.sroa.9.0.extract.trunc148 = trunc i64 %retval.sroa.9.0.extract.shift147 to i32
  br label %cleanup

if.end.47:                                        ; preds = %if.then.38
  %call48 = tail call i64 @packFloat64(i32 %zSign, i32 2047, i32 0, i32 0)
  %retval.sroa.0.0.extract.trunc143 = trunc i64 %call48 to i32
  %retval.sroa.9.0.extract.shift149 = lshr i64 %call48, 32
  %retval.sroa.9.0.extract.trunc150 = trunc i64 %retval.sroa.9.0.extract.shift149 to i32
  br label %cleanup

if.end.49:                                        ; preds = %if.then.36
  %cmp50 = icmp eq i32 %call11, 0
  br i1 %cmp50, label %if.then.51, label %if.else.52

if.then.51:                                       ; preds = %if.end.49
  %inc = add nsw i32 %sub, 1
  br label %if.end.54

if.else.52:                                       ; preds = %if.end.49
  %12 = load i32, i32* %aSig0, align 4, !tbaa !1
  %or53 = or i32 %12, 1048576
  store i32 %or53, i32* %aSig0, align 4, !tbaa !1
  br label %if.end.54

if.end.54:                                        ; preds = %if.else.52, %if.then.51
  %expDiff.1 = phi i32 [ %inc, %if.then.51 ], [ %sub, %if.else.52 ]
  %13 = load i32, i32* %aSig0, align 4, !tbaa !1
  %14 = load i32, i32* %aSig1, align 4, !tbaa !1
  %sub55 = sub nsw i32 0, %expDiff.1
  call void @shift64ExtraRightJamming(i32 %13, i32 %14, i32 0, i32 %sub55, i32* nonnull %aSig0, i32* nonnull %aSig1, i32* nonnull %zSig2)
  br label %if.end.77

if.else.56:                                       ; preds = %if.else.34
  %cmp57 = icmp eq i32 %call11, 2047
  %15 = load i32, i32* %aSig0, align 4, !tbaa !1
  %16 = load i32, i32* %aSig1, align 4, !tbaa !1
  %17 = load i32, i32* %bSig1, align 4, !tbaa !1
  br i1 %cmp57, label %if.then.58, label %if.end.70

if.then.58:                                       ; preds = %if.else.56
  %or59 = or i32 %15, %call17
  %or60 = or i32 %or59, %16
  %or61 = or i32 %or60, %17
  %tobool62 = icmp eq i32 %or61, 0
  br i1 %tobool62, label %cleanup, label %if.then.63

if.then.63:                                       ; preds = %if.then.58
  %call68 = tail call fastcc i64 @propagateFloat64NaN(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1)
  %retval.sroa.0.0.extract.trunc144 = trunc i64 %call68 to i32
  %retval.sroa.9.0.extract.shift151 = lshr i64 %call68, 32
  %retval.sroa.9.0.extract.trunc152 = trunc i64 %retval.sroa.9.0.extract.shift151 to i32
  br label %cleanup

if.end.70:                                        ; preds = %if.else.56
  call void @add64(i32 %15, i32 %16, i32 %call17, i32 %17, i32* nonnull %zSig0, i32* nonnull %zSig1)
  %cmp71 = icmp eq i32 %call11, 0
  br i1 %cmp71, label %if.then.72, label %if.end.74

if.then.72:                                       ; preds = %if.end.70
  %18 = load i32, i32* %zSig0, align 4, !tbaa !1
  %19 = load i32, i32* %zSig1, align 4, !tbaa !1
  %call73 = tail call i64 @packFloat64(i32 %zSign, i32 0, i32 %18, i32 %19)
  %retval.sroa.0.0.extract.trunc145 = trunc i64 %call73 to i32
  %retval.sroa.9.0.extract.shift153 = lshr i64 %call73, 32
  %retval.sroa.9.0.extract.trunc154 = trunc i64 %retval.sroa.9.0.extract.shift153 to i32
  br label %cleanup

if.end.74:                                        ; preds = %if.end.70
  store i32 0, i32* %zSig2, align 4, !tbaa !1
  %20 = load i32, i32* %zSig0, align 4, !tbaa !1
  %or75 = or i32 %20, 2097152
  store i32 %or75, i32* %zSig0, align 4, !tbaa !1
  br label %shiftRight1

if.end.77:                                        ; preds = %if.end.54, %if.end.33
  %zExp.0 = phi i32 [ %call11, %if.end.33 ], [ %call20, %if.end.54 ]
  %21 = load i32, i32* %aSig0, align 4, !tbaa !1
  %or78 = or i32 %21, 1048576
  store i32 %or78, i32* %aSig0, align 4, !tbaa !1
  %22 = load i32, i32* %aSig1, align 4, !tbaa !1
  %23 = load i32, i32* %bSig0, align 4, !tbaa !1
  %24 = load i32, i32* %bSig1, align 4, !tbaa !1
  call void @add64(i32 %or78, i32 %22, i32 %23, i32 %24, i32* nonnull %zSig0, i32* nonnull %zSig1)
  %dec79 = add nsw i32 %zExp.0, -1
  %25 = load i32, i32* %zSig0, align 4, !tbaa !1
  %cmp80 = icmp ult i32 %25, 2097152
  br i1 %cmp80, label %roundAndPack, label %shiftRight1

shiftRight1:                                      ; preds = %if.end.77, %if.end.74
  %zExp.1 = phi i32 [ %call11, %if.end.74 ], [ %zExp.0, %if.end.77 ]
  %26 = load i32, i32* %zSig0, align 4, !tbaa !1
  %27 = load i32, i32* %zSig1, align 4, !tbaa !1
  %28 = load i32, i32* %zSig2, align 4, !tbaa !1
  call void @shift64ExtraRightJamming(i32 %26, i32 %27, i32 %28, i32 1, i32* nonnull %zSig0, i32* nonnull %zSig1, i32* nonnull %zSig2)
  br label %roundAndPack

roundAndPack:                                     ; preds = %if.end.77, %shiftRight1
  %zExp.2 = phi i32 [ %dec79, %if.end.77 ], [ %zExp.1, %shiftRight1 ]
  %29 = load i32, i32* %zSig0, align 4, !tbaa !1
  %30 = load i32, i32* %zSig1, align 4, !tbaa !1
  %31 = load i32, i32* %zSig2, align 4, !tbaa !1
  %call84 = tail call fastcc i64 @roundAndPackFloat64(i32 %zSign, i32 %zExp.2, i32 %29, i32 %30, i32 %31)
  %retval.sroa.0.0.extract.trunc146 = trunc i64 %call84 to i32
  %retval.sroa.9.0.extract.shift155 = lshr i64 %call84, 32
  %retval.sroa.9.0.extract.trunc156 = trunc i64 %retval.sroa.9.0.extract.shift155 to i32
  br label %cleanup

cleanup:                                          ; preds = %if.then.58, %if.then.22, %roundAndPack, %if.then.72, %if.then.63, %if.end.47, %if.then.41, %if.then.23
  %retval.sroa.0.0 = phi i32 [ %retval.sroa.0.0.extract.trunc, %if.then.23 ], [ %retval.sroa.0.0.extract.trunc146, %roundAndPack ], [ %retval.sroa.0.0.extract.trunc142, %if.then.41 ], [ %retval.sroa.0.0.extract.trunc143, %if.end.47 ], [ %retval.sroa.0.0.extract.trunc144, %if.then.63 ], [ %retval.sroa.0.0.extract.trunc145, %if.then.72 ], [ %a.0, %if.then.22 ], [ %a.0, %if.then.58 ]
  %retval.sroa.9.0 = phi i32 [ %retval.sroa.9.0.extract.trunc, %if.then.23 ], [ %retval.sroa.9.0.extract.trunc156, %roundAndPack ], [ %retval.sroa.9.0.extract.trunc148, %if.then.41 ], [ %retval.sroa.9.0.extract.trunc150, %if.end.47 ], [ %retval.sroa.9.0.extract.trunc152, %if.then.63 ], [ %retval.sroa.9.0.extract.trunc154, %if.then.72 ], [ %a.1, %if.then.22 ], [ %a.1, %if.then.58 ]
  call void @llvm.lifetime.end(i64 4, i8* %6) #1
  call void @llvm.lifetime.end(i64 4, i8* %5) #1
  call void @llvm.lifetime.end(i64 4, i8* %4) #1
  call void @llvm.lifetime.end(i64 4, i8* %3) #1
  call void @llvm.lifetime.end(i64 4, i8* %2) #1
  call void @llvm.lifetime.end(i64 4, i8* %1) #1
  call void @llvm.lifetime.end(i64 4, i8* %0) #1
  %retval.sroa.9.0.insert.ext = zext i32 %retval.sroa.9.0 to i64
  %retval.sroa.9.0.insert.shift = shl nuw i64 %retval.sroa.9.0.insert.ext, 32
  %retval.sroa.0.0.insert.ext = zext i32 %retval.sroa.0.0 to i64
  %retval.sroa.0.0.insert.insert = or i64 %retval.sroa.9.0.insert.shift, %retval.sroa.0.0.insert.ext
  ret i64 %retval.sroa.0.0.insert.insert
}

; Function Attrs: nounwind
define internal fastcc i64 @subFloat64Sigs(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1, i32 %zSign) #3 {
entry:
  %aSig0 = alloca i32, align 4
  %aSig1 = alloca i32, align 4
  %bSig0 = alloca i32, align 4
  %bSig1 = alloca i32, align 4
  %zSig0 = alloca i32, align 4
  %zSig1 = alloca i32, align 4
  %0 = bitcast i32* %aSig0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %0) #1
  %1 = bitcast i32* %aSig1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %1) #1
  %2 = bitcast i32* %bSig0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %2) #1
  %3 = bitcast i32* %bSig1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %3) #1
  %4 = bitcast i32* %zSig0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %4) #1
  %5 = bitcast i32* %zSig1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %5) #1
  %call = tail call i32 @extractFloat64Frac1(i32 undef, i32 %a.1)
  store i32 %call, i32* %aSig1, align 4, !tbaa !1
  %call8 = tail call i32 @extractFloat64Frac0(i32 %a.0, i32 undef)
  store i32 %call8, i32* %aSig0, align 4, !tbaa !1
  %call11 = tail call i32 @extractFloat64Exp(i32 %a.0, i32 undef)
  %call14 = tail call i32 @extractFloat64Frac1(i32 undef, i32 %b.1)
  store i32 %call14, i32* %bSig1, align 4, !tbaa !1
  %call17 = tail call i32 @extractFloat64Frac0(i32 %b.0, i32 undef)
  store i32 %call17, i32* %bSig0, align 4, !tbaa !1
  %call20 = tail call i32 @extractFloat64Exp(i32 %b.0, i32 undef)
  %sub = sub nsw i32 %call11, %call20
  %6 = load i32, i32* %aSig0, align 4, !tbaa !1
  %7 = load i32, i32* %aSig1, align 4, !tbaa !1
  call void @shortShift64Left(i32 %6, i32 %7, i32 10, i32* nonnull %aSig0, i32* nonnull %aSig1)
  %8 = load i32, i32* %bSig1, align 4, !tbaa !1
  call void @shortShift64Left(i32 %call17, i32 %8, i32 10, i32* nonnull %bSig0, i32* nonnull %bSig1)
  %cmp = icmp sgt i32 %sub, 0
  br i1 %cmp, label %aExpBigger, label %if.end

if.end:                                           ; preds = %entry
  %cmp21 = icmp slt i32 %sub, 0
  br i1 %cmp21, label %bExpBigger, label %if.end.23

if.end.23:                                        ; preds = %if.end
  switch i32 %call11, label %if.end.40 [
    i32 2047, label %if.then.25
    i32 0, label %if.then.39
  ]

if.then.25:                                       ; preds = %if.end.23
  %9 = load i32, i32* %aSig0, align 4, !tbaa !1
  %10 = load i32, i32* %aSig1, align 4, !tbaa !1
  %or = or i32 %10, %9
  %11 = load i32, i32* %bSig0, align 4, !tbaa !1
  %or26 = or i32 %or, %11
  %12 = load i32, i32* %bSig1, align 4, !tbaa !1
  %or27 = or i32 %or26, %12
  %tobool = icmp eq i32 %or27, 0
  br i1 %tobool, label %if.end.34, label %if.then.28

if.then.28:                                       ; preds = %if.then.25
  %call33 = tail call fastcc i64 @propagateFloat64NaN(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1)
  %retval.sroa.0.0.extract.trunc = trunc i64 %call33 to i32
  %retval.sroa.9.0.extract.shift = lshr i64 %call33, 32
  %retval.sroa.9.0.extract.trunc = trunc i64 %retval.sroa.9.0.extract.shift to i32
  br label %cleanup

if.end.34:                                        ; preds = %if.then.25
  tail call void @float_raise(i32 16)
  br label %cleanup

if.then.39:                                       ; preds = %if.end.23
  br label %if.end.40

if.end.40:                                        ; preds = %if.end.23, %if.then.39
  %aExp.0 = phi i32 [ 1, %if.then.39 ], [ %call11, %if.end.23 ]
  %bExp.0 = phi i32 [ 1, %if.then.39 ], [ %call20, %if.end.23 ]
  %13 = load i32, i32* %bSig0, align 4, !tbaa !1
  %14 = load i32, i32* %aSig0, align 4, !tbaa !1
  %cmp41 = icmp ult i32 %13, %14
  br i1 %cmp41, label %aBigger, label %if.end.43

if.end.43:                                        ; preds = %if.end.40
  %cmp44 = icmp ult i32 %14, %13
  br i1 %cmp44, label %bBigger, label %if.end.46

if.end.46:                                        ; preds = %if.end.43
  %15 = load i32, i32* %bSig1, align 4, !tbaa !1
  %16 = load i32, i32* %aSig1, align 4, !tbaa !1
  %cmp47 = icmp ult i32 %15, %16
  br i1 %cmp47, label %aBigger, label %if.end.49

if.end.49:                                        ; preds = %if.end.46
  %cmp50 = icmp ult i32 %16, %15
  br i1 %cmp50, label %bBigger, label %if.end.52

if.end.52:                                        ; preds = %if.end.49
  %17 = load i32, i32* @float_rounding_mode, align 4, !tbaa !1
  %cmp53 = icmp eq i32 %17, 3
  %conv = zext i1 %cmp53 to i32
  %call54 = tail call i64 @packFloat64(i32 %conv, i32 0, i32 0, i32 0)
  %retval.sroa.0.0.extract.trunc154 = trunc i64 %call54 to i32
  %retval.sroa.9.0.extract.shift159 = lshr i64 %call54, 32
  %retval.sroa.9.0.extract.trunc160 = trunc i64 %retval.sroa.9.0.extract.shift159 to i32
  br label %cleanup

bExpBigger:                                       ; preds = %if.end
  %cmp55 = icmp eq i32 %call20, 2047
  br i1 %cmp55, label %if.then.57, label %if.end.68

if.then.57:                                       ; preds = %bExpBigger
  %18 = load i32, i32* %bSig0, align 4, !tbaa !1
  %19 = load i32, i32* %bSig1, align 4, !tbaa !1
  %or58 = or i32 %19, %18
  %tobool59 = icmp eq i32 %or58, 0
  br i1 %tobool59, label %if.end.66, label %if.then.60

if.then.60:                                       ; preds = %if.then.57
  %call65 = tail call fastcc i64 @propagateFloat64NaN(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1)
  %retval.sroa.0.0.extract.trunc155 = trunc i64 %call65 to i32
  %retval.sroa.9.0.extract.shift161 = lshr i64 %call65, 32
  %retval.sroa.9.0.extract.trunc162 = trunc i64 %retval.sroa.9.0.extract.shift161 to i32
  br label %cleanup

if.end.66:                                        ; preds = %if.then.57
  %xor = xor i32 %zSign, 1
  %call67 = tail call i64 @packFloat64(i32 %xor, i32 2047, i32 0, i32 0)
  %retval.sroa.0.0.extract.trunc156 = trunc i64 %call67 to i32
  %retval.sroa.9.0.extract.shift163 = lshr i64 %call67, 32
  %retval.sroa.9.0.extract.trunc164 = trunc i64 %retval.sroa.9.0.extract.shift163 to i32
  br label %cleanup

if.end.68:                                        ; preds = %bExpBigger
  %cmp69 = icmp eq i32 %call11, 0
  br i1 %cmp69, label %if.then.71, label %if.else

if.then.71:                                       ; preds = %if.end.68
  %inc = add nsw i32 %sub, 1
  br label %if.end.73

if.else:                                          ; preds = %if.end.68
  %20 = load i32, i32* %aSig0, align 4, !tbaa !1
  %or72 = or i32 %20, 1073741824
  store i32 %or72, i32* %aSig0, align 4, !tbaa !1
  br label %if.end.73

if.end.73:                                        ; preds = %if.else, %if.then.71
  %expDiff.0 = phi i32 [ %inc, %if.then.71 ], [ %sub, %if.else ]
  %21 = load i32, i32* %aSig0, align 4, !tbaa !1
  %22 = load i32, i32* %aSig1, align 4, !tbaa !1
  %sub74 = sub nsw i32 0, %expDiff.0
  call void @shift64RightJamming(i32 %21, i32 %22, i32 %sub74, i32* nonnull %aSig0, i32* nonnull %aSig1)
  %23 = load i32, i32* %bSig0, align 4, !tbaa !1
  %or75 = or i32 %23, 1073741824
  store i32 %or75, i32* %bSig0, align 4, !tbaa !1
  br label %bBigger

bBigger:                                          ; preds = %if.end.49, %if.end.43, %if.end.73
  %bExp.1 = phi i32 [ %call20, %if.end.73 ], [ %bExp.0, %if.end.43 ], [ %bExp.0, %if.end.49 ]
  %24 = load i32, i32* %bSig0, align 4, !tbaa !1
  %25 = load i32, i32* %bSig1, align 4, !tbaa !1
  %26 = load i32, i32* %aSig0, align 4, !tbaa !1
  %27 = load i32, i32* %aSig1, align 4, !tbaa !1
  call void @sub64(i32 %24, i32 %25, i32 %26, i32 %27, i32* nonnull %zSig0, i32* nonnull %zSig1)
  %xor76 = xor i32 %zSign, 1
  br label %normalizeRoundAndPack

aExpBigger:                                       ; preds = %entry
  %cmp77 = icmp eq i32 %call11, 2047
  br i1 %cmp77, label %if.then.79, label %if.end.89

if.then.79:                                       ; preds = %aExpBigger
  %28 = load i32, i32* %aSig0, align 4, !tbaa !1
  %29 = load i32, i32* %aSig1, align 4, !tbaa !1
  %or80 = or i32 %29, %28
  %tobool81 = icmp eq i32 %or80, 0
  br i1 %tobool81, label %cleanup, label %if.then.82

if.then.82:                                       ; preds = %if.then.79
  %call87 = tail call fastcc i64 @propagateFloat64NaN(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1)
  %retval.sroa.0.0.extract.trunc157 = trunc i64 %call87 to i32
  %retval.sroa.9.0.extract.shift165 = lshr i64 %call87, 32
  %retval.sroa.9.0.extract.trunc166 = trunc i64 %retval.sroa.9.0.extract.shift165 to i32
  br label %cleanup

if.end.89:                                        ; preds = %aExpBigger
  %cmp90 = icmp eq i32 %call20, 0
  br i1 %cmp90, label %if.then.92, label %if.else.93

if.then.92:                                       ; preds = %if.end.89
  %dec = add nsw i32 %sub, -1
  br label %if.end.95

if.else.93:                                       ; preds = %if.end.89
  %30 = load i32, i32* %bSig0, align 4, !tbaa !1
  %or94 = or i32 %30, 1073741824
  store i32 %or94, i32* %bSig0, align 4, !tbaa !1
  br label %if.end.95

if.end.95:                                        ; preds = %if.else.93, %if.then.92
  %expDiff.1 = phi i32 [ %dec, %if.then.92 ], [ %sub, %if.else.93 ]
  %31 = load i32, i32* %bSig0, align 4, !tbaa !1
  %32 = load i32, i32* %bSig1, align 4, !tbaa !1
  call void @shift64RightJamming(i32 %31, i32 %32, i32 %expDiff.1, i32* nonnull %bSig0, i32* nonnull %bSig1)
  %33 = load i32, i32* %aSig0, align 4, !tbaa !1
  %or96 = or i32 %33, 1073741824
  store i32 %or96, i32* %aSig0, align 4, !tbaa !1
  br label %aBigger

aBigger:                                          ; preds = %if.end.46, %if.end.40, %if.end.95
  %aExp.1 = phi i32 [ %call11, %if.end.95 ], [ %aExp.0, %if.end.40 ], [ %aExp.0, %if.end.46 ]
  %34 = load i32, i32* %aSig0, align 4, !tbaa !1
  %35 = load i32, i32* %aSig1, align 4, !tbaa !1
  %36 = load i32, i32* %bSig0, align 4, !tbaa !1
  %37 = load i32, i32* %bSig1, align 4, !tbaa !1
  call void @sub64(i32 %34, i32 %35, i32 %36, i32 %37, i32* nonnull %zSig0, i32* nonnull %zSig1)
  br label %normalizeRoundAndPack

normalizeRoundAndPack:                            ; preds = %aBigger, %bBigger
  %zSign.addr.0 = phi i32 [ %zSign, %aBigger ], [ %xor76, %bBigger ]
  %zExp.0 = phi i32 [ %aExp.1, %aBigger ], [ %bExp.1, %bBigger ]
  %sub98 = add nsw i32 %zExp.0, -11
  %38 = load i32, i32* %zSig0, align 4, !tbaa !1
  %39 = load i32, i32* %zSig1, align 4, !tbaa !1
  %call99 = tail call fastcc i64 @normalizeRoundAndPackFloat64(i32 %zSign.addr.0, i32 %sub98, i32 %38, i32 %39)
  %retval.sroa.0.0.extract.trunc158 = trunc i64 %call99 to i32
  %retval.sroa.9.0.extract.shift167 = lshr i64 %call99, 32
  %retval.sroa.9.0.extract.trunc168 = trunc i64 %retval.sroa.9.0.extract.shift167 to i32
  br label %cleanup

cleanup:                                          ; preds = %if.then.79, %normalizeRoundAndPack, %if.then.82, %if.end.66, %if.then.60, %if.end.52, %if.end.34, %if.then.28
  %retval.sroa.0.0 = phi i32 [ %retval.sroa.0.0.extract.trunc157, %if.then.82 ], [ %retval.sroa.0.0.extract.trunc158, %normalizeRoundAndPack ], [ %retval.sroa.0.0.extract.trunc155, %if.then.60 ], [ %retval.sroa.0.0.extract.trunc156, %if.end.66 ], [ %retval.sroa.0.0.extract.trunc, %if.then.28 ], [ 2147483647, %if.end.34 ], [ %retval.sroa.0.0.extract.trunc154, %if.end.52 ], [ %a.0, %if.then.79 ]
  %retval.sroa.9.0 = phi i32 [ %retval.sroa.9.0.extract.trunc166, %if.then.82 ], [ %retval.sroa.9.0.extract.trunc168, %normalizeRoundAndPack ], [ %retval.sroa.9.0.extract.trunc162, %if.then.60 ], [ %retval.sroa.9.0.extract.trunc164, %if.end.66 ], [ %retval.sroa.9.0.extract.trunc, %if.then.28 ], [ -1, %if.end.34 ], [ %retval.sroa.9.0.extract.trunc160, %if.end.52 ], [ %a.1, %if.then.79 ]
  call void @llvm.lifetime.end(i64 4, i8* %5) #1
  call void @llvm.lifetime.end(i64 4, i8* %4) #1
  call void @llvm.lifetime.end(i64 4, i8* %3) #1
  call void @llvm.lifetime.end(i64 4, i8* %2) #1
  call void @llvm.lifetime.end(i64 4, i8* %1) #1
  call void @llvm.lifetime.end(i64 4, i8* %0) #1
  %retval.sroa.9.0.insert.ext = zext i32 %retval.sroa.9.0 to i64
  %retval.sroa.9.0.insert.shift = shl nuw i64 %retval.sroa.9.0.insert.ext, 32
  %retval.sroa.0.0.insert.ext = zext i32 %retval.sroa.0.0 to i64
  %retval.sroa.0.0.insert.insert = or i64 %retval.sroa.9.0.insert.shift, %retval.sroa.0.0.insert.ext
  ret i64 %retval.sroa.0.0.insert.insert
}

; Function Attrs: nounwind
define i64 @float64_sub(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #3 {
entry:
  %call = tail call i32 @extractFloat64Sign(i32 %a.0, i32 undef)
  %call8 = tail call i32 @extractFloat64Sign(i32 %b.0, i32 undef)
  %cmp = icmp eq i32 %call, %call8
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call13 = tail call fastcc i64 @subFloat64Sigs(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1, i32 %call)
  br label %cleanup

if.else:                                          ; preds = %entry
  %call18 = tail call fastcc i64 @addFloat64Sigs(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1, i32 %call)
  br label %cleanup

cleanup:                                          ; preds = %if.else, %if.then
  %retval.sroa.0.0 = phi i64 [ %call13, %if.then ], [ %call18, %if.else ]
  ret i64 %retval.sroa.0.0
}

; Function Attrs: nounwind
define i64 @float64_mul(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #3 {
entry:
  %aExp = alloca i32, align 4
  %bExp = alloca i32, align 4
  %aSig0 = alloca i32, align 4
  %aSig1 = alloca i32, align 4
  %bSig0 = alloca i32, align 4
  %bSig1 = alloca i32, align 4
  %zSig0 = alloca i32, align 4
  %zSig1 = alloca i32, align 4
  %zSig2 = alloca i32, align 4
  %zSig3 = alloca i32, align 4
  %0 = bitcast i32* %aExp to i8*
  call void @llvm.lifetime.start(i64 4, i8* %0) #1
  %1 = bitcast i32* %bExp to i8*
  call void @llvm.lifetime.start(i64 4, i8* %1) #1
  %2 = bitcast i32* %aSig0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %2) #1
  %3 = bitcast i32* %aSig1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %3) #1
  %4 = bitcast i32* %bSig0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %4) #1
  %5 = bitcast i32* %bSig1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %5) #1
  %6 = bitcast i32* %zSig0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %6) #1
  %7 = bitcast i32* %zSig1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %7) #1
  %8 = bitcast i32* %zSig2 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %8) #1
  %9 = bitcast i32* %zSig3 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %9) #1
  %call = tail call i32 @extractFloat64Frac1(i32 undef, i32 %a.1)
  store i32 %call, i32* %aSig1, align 4, !tbaa !1
  %call8 = tail call i32 @extractFloat64Frac0(i32 %a.0, i32 undef)
  store i32 %call8, i32* %aSig0, align 4, !tbaa !1
  %call11 = tail call i32 @extractFloat64Exp(i32 %a.0, i32 undef)
  store i32 %call11, i32* %aExp, align 4, !tbaa !1
  %call14 = tail call i32 @extractFloat64Sign(i32 %a.0, i32 undef)
  %call17 = tail call i32 @extractFloat64Frac1(i32 undef, i32 %b.1)
  store i32 %call17, i32* %bSig1, align 4, !tbaa !1
  %call20 = tail call i32 @extractFloat64Frac0(i32 %b.0, i32 undef)
  store i32 %call20, i32* %bSig0, align 4, !tbaa !1
  %call23 = tail call i32 @extractFloat64Exp(i32 %b.0, i32 undef)
  store i32 %call23, i32* %bExp, align 4, !tbaa !1
  %call26 = tail call i32 @extractFloat64Sign(i32 %b.0, i32 undef)
  %xor = xor i32 %call26, %call14
  %10 = load i32, i32* %aExp, align 4, !tbaa !1
  %cmp = icmp eq i32 %10, 2047
  br i1 %cmp, label %if.then, label %if.end.42

if.then:                                          ; preds = %entry
  %11 = load i32, i32* %aSig0, align 4, !tbaa !1
  %12 = load i32, i32* %aSig1, align 4, !tbaa !1
  %or = or i32 %12, %11
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then.30

lor.lhs.false:                                    ; preds = %if.then
  %cmp27 = icmp eq i32 %call23, 2047
  br i1 %cmp27, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %lor.lhs.false
  %13 = load i32, i32* %bSig0, align 4, !tbaa !1
  %14 = load i32, i32* %bSig1, align 4, !tbaa !1
  %or28 = or i32 %14, %13
  %tobool29 = icmp eq i32 %or28, 0
  br i1 %tobool29, label %if.end, label %if.then.30

if.then.30:                                       ; preds = %land.lhs.true, %if.then
  %call35 = tail call fastcc i64 @propagateFloat64NaN(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1)
  %retval.sroa.0.0.extract.trunc = trunc i64 %call35 to i32
  %retval.sroa.9.0.extract.shift = lshr i64 %call35, 32
  %retval.sroa.9.0.extract.trunc = trunc i64 %retval.sroa.9.0.extract.shift to i32
  br label %cleanup

if.end:                                           ; preds = %land.lhs.true, %lor.lhs.false
  %15 = load i32, i32* %bExp, align 4, !tbaa !1
  %16 = load i32, i32* %bSig0, align 4, !tbaa !1
  %or36 = or i32 %16, %15
  %17 = load i32, i32* %bSig1, align 4, !tbaa !1
  %or37 = or i32 %or36, %17
  %cmp38 = icmp eq i32 %or37, 0
  br i1 %cmp38, label %invalid, label %if.end.40

if.end.40:                                        ; preds = %if.end
  %call41 = tail call i64 @packFloat64(i32 %xor, i32 2047, i32 0, i32 0)
  %retval.sroa.0.0.extract.trunc133 = trunc i64 %call41 to i32
  %retval.sroa.9.0.extract.shift139 = lshr i64 %call41, 32
  %retval.sroa.9.0.extract.trunc140 = trunc i64 %retval.sroa.9.0.extract.shift139 to i32
  br label %cleanup

if.end.42:                                        ; preds = %entry
  %cmp43 = icmp eq i32 %call23, 2047
  br i1 %cmp43, label %if.then.44, label %if.end.62

if.then.44:                                       ; preds = %if.end.42
  %18 = load i32, i32* %bSig0, align 4, !tbaa !1
  %19 = load i32, i32* %bSig1, align 4, !tbaa !1
  %or45 = or i32 %19, %18
  %tobool46 = icmp eq i32 %or45, 0
  br i1 %tobool46, label %if.end.53, label %if.then.47

if.then.47:                                       ; preds = %if.then.44
  %call52 = tail call fastcc i64 @propagateFloat64NaN(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1)
  %retval.sroa.0.0.extract.trunc134 = trunc i64 %call52 to i32
  %retval.sroa.9.0.extract.shift141 = lshr i64 %call52, 32
  %retval.sroa.9.0.extract.trunc142 = trunc i64 %retval.sroa.9.0.extract.shift141 to i32
  br label %cleanup

if.end.53:                                        ; preds = %if.then.44
  %20 = load i32, i32* %aSig0, align 4, !tbaa !1
  %or54 = or i32 %20, %10
  %21 = load i32, i32* %aSig1, align 4, !tbaa !1
  %or55 = or i32 %or54, %21
  %cmp56 = icmp eq i32 %or55, 0
  br i1 %cmp56, label %invalid, label %if.end.60

invalid:                                          ; preds = %if.end.53, %if.end
  tail call void @float_raise(i32 16)
  br label %cleanup

if.end.60:                                        ; preds = %if.end.53
  %call61 = tail call i64 @packFloat64(i32 %xor, i32 2047, i32 0, i32 0)
  %retval.sroa.0.0.extract.trunc135 = trunc i64 %call61 to i32
  %retval.sroa.9.0.extract.shift143 = lshr i64 %call61, 32
  %retval.sroa.9.0.extract.trunc144 = trunc i64 %retval.sroa.9.0.extract.shift143 to i32
  br label %cleanup

if.end.62:                                        ; preds = %if.end.42
  %cmp63 = icmp eq i32 %10, 0
  br i1 %cmp63, label %if.then.64, label %if.end.70

if.then.64:                                       ; preds = %if.end.62
  %22 = load i32, i32* %aSig0, align 4, !tbaa !1
  %23 = load i32, i32* %aSig1, align 4, !tbaa !1
  %or65 = or i32 %23, %22
  %cmp66 = icmp eq i32 %or65, 0
  br i1 %cmp66, label %if.then.67, label %if.end.69

if.then.67:                                       ; preds = %if.then.64
  %call68 = tail call i64 @packFloat64(i32 %xor, i32 0, i32 0, i32 0)
  %retval.sroa.0.0.extract.trunc136 = trunc i64 %call68 to i32
  %retval.sroa.9.0.extract.shift145 = lshr i64 %call68, 32
  %retval.sroa.9.0.extract.trunc146 = trunc i64 %retval.sroa.9.0.extract.shift145 to i32
  br label %cleanup

if.end.69:                                        ; preds = %if.then.64
  call fastcc void @normalizeFloat64Subnormal(i32 %22, i32 %23, i32* nonnull %aExp, i32* nonnull %aSig0, i32* nonnull %aSig1)
  br label %if.end.70

if.end.70:                                        ; preds = %if.end.69, %if.end.62
  %24 = load i32, i32* %bExp, align 4, !tbaa !1
  %cmp71 = icmp eq i32 %24, 0
  br i1 %cmp71, label %if.then.72, label %if.end.78

if.then.72:                                       ; preds = %if.end.70
  %25 = load i32, i32* %bSig0, align 4, !tbaa !1
  %26 = load i32, i32* %bSig1, align 4, !tbaa !1
  %or73 = or i32 %26, %25
  %cmp74 = icmp eq i32 %or73, 0
  br i1 %cmp74, label %if.then.75, label %if.end.77

if.then.75:                                       ; preds = %if.then.72
  %call76 = tail call i64 @packFloat64(i32 %xor, i32 0, i32 0, i32 0)
  %retval.sroa.0.0.extract.trunc137 = trunc i64 %call76 to i32
  %retval.sroa.9.0.extract.shift147 = lshr i64 %call76, 32
  %retval.sroa.9.0.extract.trunc148 = trunc i64 %retval.sroa.9.0.extract.shift147 to i32
  br label %cleanup

if.end.77:                                        ; preds = %if.then.72
  call fastcc void @normalizeFloat64Subnormal(i32 %25, i32 %26, i32* nonnull %bExp, i32* nonnull %bSig0, i32* nonnull %bSig1)
  br label %if.end.78

if.end.78:                                        ; preds = %if.end.77, %if.end.70
  %27 = load i32, i32* %aExp, align 4, !tbaa !1
  %28 = load i32, i32* %bExp, align 4, !tbaa !1
  %add = add nsw i32 %28, %27
  %sub = add nsw i32 %add, -1024
  %29 = load i32, i32* %aSig0, align 4, !tbaa !1
  %or79 = or i32 %29, 1048576
  store i32 %or79, i32* %aSig0, align 4, !tbaa !1
  %30 = load i32, i32* %bSig0, align 4, !tbaa !1
  %31 = load i32, i32* %bSig1, align 4, !tbaa !1
  call void @shortShift64Left(i32 %30, i32 %31, i32 12, i32* nonnull %bSig0, i32* nonnull %bSig1)
  %32 = load i32, i32* %aSig1, align 4, !tbaa !1
  %33 = load i32, i32* %bSig0, align 4, !tbaa !1
  %34 = load i32, i32* %bSig1, align 4, !tbaa !1
  call void @mul64To128(i32 %or79, i32 %32, i32 %33, i32 %34, i32* nonnull %zSig0, i32* nonnull %zSig1, i32* nonnull %zSig2, i32* nonnull %zSig3)
  %35 = load i32, i32* %zSig0, align 4, !tbaa !1
  %36 = load i32, i32* %zSig1, align 4, !tbaa !1
  %37 = load i32, i32* %aSig0, align 4, !tbaa !1
  %38 = load i32, i32* %aSig1, align 4, !tbaa !1
  call void @add64(i32 %35, i32 %36, i32 %37, i32 %38, i32* nonnull %zSig0, i32* nonnull %zSig1)
  %39 = load i32, i32* %zSig3, align 4, !tbaa !1
  %cmp80 = icmp ne i32 %39, 0
  %conv = zext i1 %cmp80 to i32
  %40 = load i32, i32* %zSig2, align 4, !tbaa !1
  %or81 = or i32 %conv, %40
  store i32 %or81, i32* %zSig2, align 4, !tbaa !1
  %41 = load i32, i32* %zSig0, align 4, !tbaa !1
  %cmp82 = icmp ugt i32 %41, 2097151
  br i1 %cmp82, label %if.then.84, label %if.end.85

if.then.84:                                       ; preds = %if.end.78
  %42 = load i32, i32* %zSig1, align 4, !tbaa !1
  call void @shift64ExtraRightJamming(i32 %41, i32 %42, i32 %or81, i32 1, i32* nonnull %zSig0, i32* nonnull %zSig1, i32* nonnull %zSig2)
  %inc = add nsw i32 %add, -1023
  br label %if.end.85

if.end.85:                                        ; preds = %if.then.84, %if.end.78
  %zExp.0 = phi i32 [ %inc, %if.then.84 ], [ %sub, %if.end.78 ]
  %43 = load i32, i32* %zSig0, align 4, !tbaa !1
  %44 = load i32, i32* %zSig1, align 4, !tbaa !1
  %45 = load i32, i32* %zSig2, align 4, !tbaa !1
  %call86 = tail call fastcc i64 @roundAndPackFloat64(i32 %xor, i32 %zExp.0, i32 %43, i32 %44, i32 %45)
  %retval.sroa.0.0.extract.trunc138 = trunc i64 %call86 to i32
  %retval.sroa.9.0.extract.shift149 = lshr i64 %call86, 32
  %retval.sroa.9.0.extract.trunc150 = trunc i64 %retval.sroa.9.0.extract.shift149 to i32
  br label %cleanup

cleanup:                                          ; preds = %if.end.85, %if.then.75, %if.then.67, %if.end.60, %invalid, %if.then.47, %if.end.40, %if.then.30
  %retval.sroa.0.0 = phi i32 [ %retval.sroa.0.0.extract.trunc, %if.then.30 ], [ 2147483647, %invalid ], [ %retval.sroa.0.0.extract.trunc133, %if.end.40 ], [ %retval.sroa.0.0.extract.trunc134, %if.then.47 ], [ %retval.sroa.0.0.extract.trunc135, %if.end.60 ], [ %retval.sroa.0.0.extract.trunc136, %if.then.67 ], [ %retval.sroa.0.0.extract.trunc137, %if.then.75 ], [ %retval.sroa.0.0.extract.trunc138, %if.end.85 ]
  %retval.sroa.9.0 = phi i32 [ %retval.sroa.9.0.extract.trunc, %if.then.30 ], [ -1, %invalid ], [ %retval.sroa.9.0.extract.trunc140, %if.end.40 ], [ %retval.sroa.9.0.extract.trunc142, %if.then.47 ], [ %retval.sroa.9.0.extract.trunc144, %if.end.60 ], [ %retval.sroa.9.0.extract.trunc146, %if.then.67 ], [ %retval.sroa.9.0.extract.trunc148, %if.then.75 ], [ %retval.sroa.9.0.extract.trunc150, %if.end.85 ]
  call void @llvm.lifetime.end(i64 4, i8* %9) #1
  call void @llvm.lifetime.end(i64 4, i8* %8) #1
  call void @llvm.lifetime.end(i64 4, i8* %7) #1
  call void @llvm.lifetime.end(i64 4, i8* %6) #1
  call void @llvm.lifetime.end(i64 4, i8* %5) #1
  call void @llvm.lifetime.end(i64 4, i8* %4) #1
  call void @llvm.lifetime.end(i64 4, i8* %3) #1
  call void @llvm.lifetime.end(i64 4, i8* %2) #1
  call void @llvm.lifetime.end(i64 4, i8* %1) #1
  call void @llvm.lifetime.end(i64 4, i8* %0) #1
  %retval.sroa.9.0.insert.ext = zext i32 %retval.sroa.9.0 to i64
  %retval.sroa.9.0.insert.shift = shl nuw i64 %retval.sroa.9.0.insert.ext, 32
  %retval.sroa.0.0.insert.ext = zext i32 %retval.sroa.0.0 to i64
  %retval.sroa.0.0.insert.insert = or i64 %retval.sroa.9.0.insert.shift, %retval.sroa.0.0.insert.ext
  ret i64 %retval.sroa.0.0.insert.insert
}

; Function Attrs: nounwind
define internal fastcc void @normalizeFloat64Subnormal(i32 %aSig0, i32 %aSig1, i32* nocapture %zExpPtr, i32* nocapture %zSig0Ptr, i32* nocapture %zSig1Ptr) #3 {
entry:
  %cmp = icmp eq i32 %aSig0, 0
  br i1 %cmp, label %if.then, label %if.else.7

if.then:                                          ; preds = %entry
  %call = tail call fastcc i32 @countLeadingZeros32(i32 %aSig1)
  %sub = add nsw i32 %call, -11
  %cmp1 = icmp slt i32 %call, 11
  br i1 %cmp1, label %if.then.2, label %if.else

if.then.2:                                        ; preds = %if.then
  %sub3 = sub i32 11, %call
  %shr = lshr i32 %aSig1, %sub3
  store i32 %shr, i32* %zSig0Ptr, align 4, !tbaa !1
  %and = and i32 %sub, 31
  %shl = shl i32 %aSig1, %and
  br label %if.end

if.else:                                          ; preds = %if.then
  %shl4 = shl i32 %aSig1, %sub
  store i32 %shl4, i32* %zSig0Ptr, align 4, !tbaa !1
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then.2
  %storemerge.28 = phi i32 [ 0, %if.else ], [ %shl, %if.then.2 ]
  store i32 %storemerge.28, i32* %zSig1Ptr, align 4, !tbaa !1
  %sub6 = sub i32 -20, %call
  br label %if.end.11

if.else.7:                                        ; preds = %entry
  %call8 = tail call fastcc i32 @countLeadingZeros32(i32 %aSig0)
  %sub9 = add nsw i32 %call8, -11
  tail call void @shortShift64Left(i32 %aSig0, i32 %aSig1, i32 %sub9, i32* %zSig0Ptr, i32* %zSig1Ptr)
  %sub10 = sub i32 12, %call8
  br label %if.end.11

if.end.11:                                        ; preds = %if.else.7, %if.end
  %storemerge = phi i32 [ %sub10, %if.else.7 ], [ %sub6, %if.end ]
  store i32 %storemerge, i32* %zExpPtr, align 4, !tbaa !1
  ret void
}

; Function Attrs: nounwind
define internal fastcc i64 @roundAndPackFloat64(i32 %zSign, i32 %zExp, i32 %zSig0, i32 %zSig1, i32 %zSig2) #3 {
entry:
  %zSig0.addr = alloca i32, align 4
  %zSig1.addr = alloca i32, align 4
  %zSig2.addr = alloca i32, align 4
  store i32 %zSig0, i32* %zSig0.addr, align 4, !tbaa !1
  store i32 %zSig1, i32* %zSig1.addr, align 4, !tbaa !1
  store i32 %zSig2, i32* %zSig2.addr, align 4, !tbaa !1
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
  br i1 %cmp22, label %if.then.24, label %if.end.90thread-pre-split

if.then.24:                                       ; preds = %if.end.19
  %cmp25 = icmp sgt i32 %zExp, 2045
  br i1 %cmp25, label %if.then.32, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then.24
  %cmp27 = icmp eq i32 %zExp, 2045
  br i1 %cmp27, label %land.lhs.true, label %if.end.49

land.lhs.true:                                    ; preds = %lor.lhs.false
  %3 = load i32, i32* %zSig0.addr, align 4, !tbaa !1
  %4 = load i32, i32* %zSig1.addr, align 4, !tbaa !1
  %call = tail call i32 @eq64(i32 2097151, i32 -1, i32 %3, i32 %4)
  %tobool29 = icmp ne i32 %call, 0
  %tobool31 = icmp ne i32 %increment.0, 0
  %or.cond = and i1 %tobool31, %tobool29
  br i1 %or.cond, label %if.then.32, label %if.end.90thread-pre-split

if.then.32:                                       ; preds = %land.lhs.true, %if.then.24
  tail call void @float_raise(i32 9)
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
  %call46 = tail call i64 @packFloat64(i32 %zSign, i32 2046, i32 1048575, i32 -1)
  br label %cleanup

if.end.47:                                        ; preds = %lor.lhs.false.40
  %call48 = tail call i64 @packFloat64(i32 %zSign, i32 2047, i32 0, i32 0)
  br label %cleanup

if.end.49:                                        ; preds = %lor.lhs.false
  %cmp50 = icmp slt i32 %zExp, 0
  br i1 %cmp50, label %if.then.52, label %if.end.90thread-pre-split

if.then.52:                                       ; preds = %if.end.49
  %5 = load i32, i32* @float_detect_tininess, align 4, !tbaa !1
  %notlhs = icmp ne i32 %5, 1
  %notrhs = icmp sgt i32 %zExp, -2
  %or.cond112.not = and i1 %notrhs, %notlhs
  %tobool59 = icmp ne i32 %increment.0, 0
  %or.cond113 = and i1 %tobool59, %or.cond112.not
  br i1 %or.cond113, label %lor.rhs, label %lor.end

lor.rhs:                                          ; preds = %if.then.52
  %6 = load i32, i32* %zSig0.addr, align 4, !tbaa !1
  %7 = load i32, i32* %zSig1.addr, align 4, !tbaa !1
  %call60 = tail call i32 @lt64(i32 %6, i32 %7, i32 2097151, i32 -1)
  %tobool61 = icmp ne i32 %call60, 0
  br label %lor.end

lor.end:                                          ; preds = %if.then.52, %lor.rhs
  %8 = phi i1 [ true, %if.then.52 ], [ %tobool61, %lor.rhs ]
  %9 = load i32, i32* %zSig0.addr, align 4, !tbaa !1
  %10 = load i32, i32* %zSig1.addr, align 4, !tbaa !1
  %11 = load i32, i32* %zSig2.addr, align 4, !tbaa !1
  %sub = sub nsw i32 0, %zExp
  call void @shift64ExtraRightJamming(i32 %9, i32 %10, i32 %11, i32 %sub, i32* nonnull %zSig0.addr, i32* nonnull %zSig1.addr, i32* nonnull %zSig2.addr)
  %12 = load i32, i32* %zSig2.addr, align 4
  %tobool64 = icmp ne i32 %12, 0
  %or.cond114 = and i1 %8, %tobool64
  br i1 %or.cond114, label %if.then.65, label %if.end.66

if.then.65:                                       ; preds = %lor.end
  tail call void @float_raise(i32 4)
  br label %if.end.66

if.end.66:                                        ; preds = %if.then.65, %lor.end
  br i1 %cmp, label %if.then.68, label %if.else.71

if.then.68:                                       ; preds = %if.end.66
  %13 = load i32, i32* %zSig2.addr, align 4, !tbaa !1
  %.lobit = lshr i32 %13, 31
  br label %if.end.90

if.else.71:                                       ; preds = %if.end.66
  %tobool72 = icmp eq i32 %zSign, 0
  br i1 %tobool72, label %if.else.80, label %if.then.73

if.then.73:                                       ; preds = %if.else.71
  %cmp74 = icmp eq i32 %0, 3
  %14 = load i32, i32* %zSig2.addr, align 4, !tbaa !1
  %tobool77 = icmp ne i32 %14, 0
  %15 = and i1 %cmp74, %tobool77
  %land.ext79 = zext i1 %15 to i32
  br label %if.end.90

if.else.80:                                       ; preds = %if.else.71
  %cmp81 = icmp eq i32 %0, 2
  %16 = load i32, i32* %zSig2.addr, align 4, !tbaa !1
  %tobool84 = icmp ne i32 %16, 0
  %17 = and i1 %cmp81, %tobool84
  %land.ext86 = zext i1 %17 to i32
  br label %if.end.90

if.end.90thread-pre-split:                        ; preds = %land.lhs.true, %if.end.19, %if.end.49
  %.pr = load i32, i32* %zSig2.addr, align 4, !tbaa !1
  br label %if.end.90

if.end.90:                                        ; preds = %if.end.90thread-pre-split, %if.then.73, %if.else.80, %if.then.68
  %18 = phi i32 [ %.pr, %if.end.90thread-pre-split ], [ %14, %if.then.73 ], [ %16, %if.else.80 ], [ %13, %if.then.68 ]
  %zExp.addr.0 = phi i32 [ %zExp, %if.end.90thread-pre-split ], [ 0, %if.then.73 ], [ 0, %if.else.80 ], [ 0, %if.then.68 ]
  %increment.1 = phi i32 [ %increment.0, %if.end.90thread-pre-split ], [ %land.ext79, %if.then.73 ], [ %land.ext86, %if.else.80 ], [ %.lobit, %if.then.68 ]
  %tobool91 = icmp eq i32 %18, 0
  br i1 %tobool91, label %if.end.93, label %if.then.92

if.then.92:                                       ; preds = %if.end.90
  %19 = load i32, i32* @float_exception_flags, align 4, !tbaa !1
  %or = or i32 %19, 1
  store i32 %or, i32* @float_exception_flags, align 4, !tbaa !1
  br label %if.end.93

if.end.93:                                        ; preds = %if.end.90, %if.then.92
  %tobool94 = icmp eq i32 %increment.1, 0
  %20 = load i32, i32* %zSig0.addr, align 4, !tbaa !1
  %21 = load i32, i32* %zSig1.addr, align 4, !tbaa !1
  br i1 %tobool94, label %if.else.99, label %if.then.95

if.then.95:                                       ; preds = %if.end.93
  call void @add64(i32 %20, i32 %21, i32 0, i32 1, i32* nonnull %zSig0.addr, i32* nonnull %zSig1.addr)
  %22 = load i32, i32* %zSig2.addr, align 4, !tbaa !1
  %add.mask = and i32 %22, 2147483647
  %23 = or i32 %add.mask, %0
  %24 = icmp eq i32 %23, 0
  %and = zext i1 %24 to i32
  %neg = xor i32 %and, -1
  %25 = load i32, i32* %zSig1.addr, align 4, !tbaa !1
  %and98 = and i32 %25, %neg
  store i32 %and98, i32* %zSig1.addr, align 4, !tbaa !1
  br label %if.end.105

if.else.99:                                       ; preds = %if.end.93
  %or100 = or i32 %21, %20
  %cmp101 = icmp eq i32 %or100, 0
  %.zExp.addr.0 = select i1 %cmp101, i32 0, i32 %zExp.addr.0
  br label %if.end.105

if.end.105:                                       ; preds = %if.else.99, %if.then.95
  %zExp.addr.1 = phi i32 [ %zExp.addr.0, %if.then.95 ], [ %.zExp.addr.0, %if.else.99 ]
  %26 = load i32, i32* %zSig0.addr, align 4, !tbaa !1
  %27 = load i32, i32* %zSig1.addr, align 4, !tbaa !1
  %call106 = tail call i64 @packFloat64(i32 %zSign, i32 %zExp.addr.1, i32 %26, i32 %27)
  br label %cleanup

cleanup:                                          ; preds = %if.end.105, %if.end.47, %if.then.45
  %retval.sroa.0.0 = phi i64 [ %call46, %if.then.45 ], [ %call48, %if.end.47 ], [ %call106, %if.end.105 ]
  ret i64 %retval.sroa.0.0
}

; Function Attrs: nounwind
define i64 @float64_div(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #3 {
entry:
  %aExp = alloca i32, align 4
  %bExp = alloca i32, align 4
  %aSig0 = alloca i32, align 4
  %aSig1 = alloca i32, align 4
  %bSig0 = alloca i32, align 4
  %bSig1 = alloca i32, align 4
  %zSig0 = alloca i32, align 4
  %zSig1 = alloca i32, align 4
  %zSig2 = alloca i32, align 4
  %rem0 = alloca i32, align 4
  %rem1 = alloca i32, align 4
  %rem2 = alloca i32, align 4
  %rem3 = alloca i32, align 4
  %term0 = alloca i32, align 4
  %term1 = alloca i32, align 4
  %term2 = alloca i32, align 4
  %term3 = alloca i32, align 4
  %0 = bitcast i32* %aExp to i8*
  call void @llvm.lifetime.start(i64 4, i8* %0) #1
  %1 = bitcast i32* %bExp to i8*
  call void @llvm.lifetime.start(i64 4, i8* %1) #1
  %2 = bitcast i32* %aSig0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %2) #1
  %3 = bitcast i32* %aSig1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %3) #1
  %4 = bitcast i32* %bSig0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %4) #1
  %5 = bitcast i32* %bSig1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %5) #1
  %6 = bitcast i32* %zSig0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %6) #1
  %7 = bitcast i32* %zSig1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %7) #1
  %8 = bitcast i32* %zSig2 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %8) #1
  %9 = bitcast i32* %rem0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %9) #1
  %10 = bitcast i32* %rem1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %10) #1
  %11 = bitcast i32* %rem2 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %11) #1
  %12 = bitcast i32* %rem3 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %12) #1
  %13 = bitcast i32* %term0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %13) #1
  %14 = bitcast i32* %term1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %14) #1
  %15 = bitcast i32* %term2 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %15) #1
  %16 = bitcast i32* %term3 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %16) #1
  %call = tail call i32 @extractFloat64Frac1(i32 undef, i32 %a.1)
  store i32 %call, i32* %aSig1, align 4, !tbaa !1
  %call8 = tail call i32 @extractFloat64Frac0(i32 %a.0, i32 undef)
  store i32 %call8, i32* %aSig0, align 4, !tbaa !1
  %call11 = tail call i32 @extractFloat64Exp(i32 %a.0, i32 undef)
  store i32 %call11, i32* %aExp, align 4, !tbaa !1
  %call14 = tail call i32 @extractFloat64Sign(i32 %a.0, i32 undef)
  %call17 = tail call i32 @extractFloat64Frac1(i32 undef, i32 %b.1)
  store i32 %call17, i32* %bSig1, align 4, !tbaa !1
  %call20 = tail call i32 @extractFloat64Frac0(i32 %b.0, i32 undef)
  store i32 %call20, i32* %bSig0, align 4, !tbaa !1
  %call23 = tail call i32 @extractFloat64Exp(i32 %b.0, i32 undef)
  store i32 %call23, i32* %bExp, align 4, !tbaa !1
  %call26 = tail call i32 @extractFloat64Sign(i32 %b.0, i32 undef)
  %xor = xor i32 %call26, %call14
  %17 = load i32, i32* %aExp, align 4, !tbaa !1
  %cmp = icmp eq i32 %17, 2047
  br i1 %cmp, label %if.then, label %if.end.46

if.then:                                          ; preds = %entry
  %18 = load i32, i32* %aSig0, align 4, !tbaa !1
  %19 = load i32, i32* %aSig1, align 4, !tbaa !1
  %or = or i32 %19, %18
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %if.end, label %if.then.27

if.then.27:                                       ; preds = %if.then
  %call32 = tail call fastcc i64 @propagateFloat64NaN(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1)
  %retval.sroa.0.0.extract.trunc = trunc i64 %call32 to i32
  %retval.sroa.10.0.extract.shift = lshr i64 %call32, 32
  %retval.sroa.10.0.extract.trunc = trunc i64 %retval.sroa.10.0.extract.shift to i32
  br label %cleanup

if.end:                                           ; preds = %if.then
  %cmp33 = icmp eq i32 %call23, 2047
  br i1 %cmp33, label %if.then.34, label %if.end.44

if.then.34:                                       ; preds = %if.end
  %20 = load i32, i32* %bSig0, align 4, !tbaa !1
  %21 = load i32, i32* %bSig1, align 4, !tbaa !1
  %or35 = or i32 %21, %20
  %tobool36 = icmp eq i32 %or35, 0
  br i1 %tobool36, label %invalid, label %if.then.37

if.then.37:                                       ; preds = %if.then.34
  %call42 = tail call fastcc i64 @propagateFloat64NaN(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1)
  %retval.sroa.0.0.extract.trunc162 = trunc i64 %call42 to i32
  %retval.sroa.10.0.extract.shift169 = lshr i64 %call42, 32
  %retval.sroa.10.0.extract.trunc170 = trunc i64 %retval.sroa.10.0.extract.shift169 to i32
  br label %cleanup

if.end.44:                                        ; preds = %if.end
  %call45 = tail call i64 @packFloat64(i32 %xor, i32 2047, i32 0, i32 0)
  %retval.sroa.0.0.extract.trunc163 = trunc i64 %call45 to i32
  %retval.sroa.10.0.extract.shift171 = lshr i64 %call45, 32
  %retval.sroa.10.0.extract.trunc172 = trunc i64 %retval.sroa.10.0.extract.shift171 to i32
  br label %cleanup

if.end.46:                                        ; preds = %entry
  switch i32 %call23, label %if.end.74 [
    i32 2047, label %if.then.48
    i32 0, label %if.then.61
  ]

if.then.48:                                       ; preds = %if.end.46
  %22 = load i32, i32* %bSig0, align 4, !tbaa !1
  %23 = load i32, i32* %bSig1, align 4, !tbaa !1
  %or49 = or i32 %23, %22
  %tobool50 = icmp eq i32 %or49, 0
  br i1 %tobool50, label %if.end.57, label %if.then.51

if.then.51:                                       ; preds = %if.then.48
  %call56 = tail call fastcc i64 @propagateFloat64NaN(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1)
  %retval.sroa.0.0.extract.trunc164 = trunc i64 %call56 to i32
  %retval.sroa.10.0.extract.shift173 = lshr i64 %call56, 32
  %retval.sroa.10.0.extract.trunc174 = trunc i64 %retval.sroa.10.0.extract.shift173 to i32
  br label %cleanup

if.end.57:                                        ; preds = %if.then.48
  %call58 = tail call i64 @packFloat64(i32 %xor, i32 0, i32 0, i32 0)
  %retval.sroa.0.0.extract.trunc165 = trunc i64 %call58 to i32
  %retval.sroa.10.0.extract.shift175 = lshr i64 %call58, 32
  %retval.sroa.10.0.extract.trunc176 = trunc i64 %retval.sroa.10.0.extract.shift175 to i32
  br label %cleanup

if.then.61:                                       ; preds = %if.end.46
  %24 = load i32, i32* %bSig0, align 4, !tbaa !1
  %25 = load i32, i32* %bSig1, align 4, !tbaa !1
  %or62 = or i32 %25, %24
  %cmp63 = icmp eq i32 %or62, 0
  br i1 %cmp63, label %if.then.64, label %if.end.73

if.then.64:                                       ; preds = %if.then.61
  %26 = load i32, i32* %aSig0, align 4, !tbaa !1
  %or65 = or i32 %26, %17
  %27 = load i32, i32* %aSig1, align 4, !tbaa !1
  %or66 = or i32 %or65, %27
  %cmp67 = icmp eq i32 %or66, 0
  br i1 %cmp67, label %invalid, label %if.end.71

invalid:                                          ; preds = %if.then.34, %if.then.64
  tail call void @float_raise(i32 16)
  br label %cleanup

if.end.71:                                        ; preds = %if.then.64
  tail call void @float_raise(i32 2)
  %call72 = tail call i64 @packFloat64(i32 %xor, i32 2047, i32 0, i32 0)
  %retval.sroa.0.0.extract.trunc166 = trunc i64 %call72 to i32
  %retval.sroa.10.0.extract.shift177 = lshr i64 %call72, 32
  %retval.sroa.10.0.extract.trunc178 = trunc i64 %retval.sroa.10.0.extract.shift177 to i32
  br label %cleanup

if.end.73:                                        ; preds = %if.then.61
  call fastcc void @normalizeFloat64Subnormal(i32 %24, i32 %25, i32* nonnull %bExp, i32* nonnull %bSig0, i32* nonnull %bSig1)
  br label %if.end.74

if.end.74:                                        ; preds = %if.end.46, %if.end.73
  %28 = load i32, i32* %aExp, align 4, !tbaa !1
  %cmp75 = icmp eq i32 %28, 0
  br i1 %cmp75, label %if.then.76, label %if.end.82

if.then.76:                                       ; preds = %if.end.74
  %29 = load i32, i32* %aSig0, align 4, !tbaa !1
  %30 = load i32, i32* %aSig1, align 4, !tbaa !1
  %or77 = or i32 %30, %29
  %cmp78 = icmp eq i32 %or77, 0
  br i1 %cmp78, label %if.then.79, label %if.end.81

if.then.79:                                       ; preds = %if.then.76
  %call80 = tail call i64 @packFloat64(i32 %xor, i32 0, i32 0, i32 0)
  %retval.sroa.0.0.extract.trunc167 = trunc i64 %call80 to i32
  %retval.sroa.10.0.extract.shift179 = lshr i64 %call80, 32
  %retval.sroa.10.0.extract.trunc180 = trunc i64 %retval.sroa.10.0.extract.shift179 to i32
  br label %cleanup

if.end.81:                                        ; preds = %if.then.76
  call fastcc void @normalizeFloat64Subnormal(i32 %29, i32 %30, i32* nonnull %aExp, i32* nonnull %aSig0, i32* nonnull %aSig1)
  br label %if.end.82

if.end.82:                                        ; preds = %if.end.81, %if.end.74
  %31 = load i32, i32* %aExp, align 4, !tbaa !1
  %32 = load i32, i32* %bExp, align 4, !tbaa !1
  %sub = sub nsw i32 %31, %32
  %add = add nsw i32 %sub, 1021
  %33 = load i32, i32* %aSig0, align 4, !tbaa !1
  %or83 = or i32 %33, 1048576
  %34 = load i32, i32* %aSig1, align 4, !tbaa !1
  call void @shortShift64Left(i32 %or83, i32 %34, i32 11, i32* nonnull %aSig0, i32* nonnull %aSig1)
  %35 = load i32, i32* %bSig0, align 4, !tbaa !1
  %or84 = or i32 %35, 1048576
  %36 = load i32, i32* %bSig1, align 4, !tbaa !1
  call void @shortShift64Left(i32 %or84, i32 %36, i32 11, i32* nonnull %bSig0, i32* nonnull %bSig1)
  %37 = load i32, i32* %bSig0, align 4, !tbaa !1
  %38 = load i32, i32* %bSig1, align 4, !tbaa !1
  %39 = load i32, i32* %aSig0, align 4, !tbaa !1
  %40 = load i32, i32* %aSig1, align 4, !tbaa !1
  %call85 = tail call i32 @le64(i32 %37, i32 %38, i32 %39, i32 %40)
  %tobool86 = icmp eq i32 %call85, 0
  br i1 %tobool86, label %if.end.88, label %if.then.87

if.then.87:                                       ; preds = %if.end.82
  call void @shift64Right(i32 %39, i32 %40, i32 1, i32* nonnull %aSig0, i32* nonnull %aSig1)
  %inc = add nsw i32 %sub, 1022
  br label %if.end.88

if.end.88:                                        ; preds = %if.end.82, %if.then.87
  %zExp.0 = phi i32 [ %inc, %if.then.87 ], [ %add, %if.end.82 ]
  %41 = load i32, i32* %aSig0, align 4, !tbaa !1
  %42 = load i32, i32* %aSig1, align 4, !tbaa !1
  %43 = load i32, i32* %bSig0, align 4, !tbaa !1
  %call89 = tail call fastcc i32 @estimateDiv64To32(i32 %41, i32 %42, i32 %43)
  store i32 %call89, i32* %zSig0, align 4, !tbaa !1
  %44 = load i32, i32* %bSig1, align 4, !tbaa !1
  call void @mul64By32To96(i32 %43, i32 %44, i32 %call89, i32* nonnull %term0, i32* nonnull %term1, i32* nonnull %term2)
  %45 = load i32, i32* %aSig0, align 4, !tbaa !1
  %46 = load i32, i32* %aSig1, align 4, !tbaa !1
  %47 = load i32, i32* %term0, align 4, !tbaa !1
  %48 = load i32, i32* %term1, align 4, !tbaa !1
  %49 = load i32, i32* %term2, align 4, !tbaa !1
  call void @sub96(i32 %45, i32 %46, i32 0, i32 %47, i32 %48, i32 %49, i32* nonnull %rem0, i32* nonnull %rem1, i32* nonnull %rem2)
  %50 = load i32, i32* %rem0, align 4, !tbaa !1
  %cmp90.185 = icmp slt i32 %50, 0
  br i1 %cmp90.185, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %if.end.88
  %51 = load i32, i32* %bSig0, align 4, !tbaa !1
  %52 = load i32, i32* %bSig1, align 4, !tbaa !1
  %zSig0.promoted = load i32, i32* %zSig0, align 4, !tbaa !1
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %dec186 = phi i32 [ %zSig0.promoted, %while.body.lr.ph ], [ %dec, %while.body ]
  %dec = add i32 %dec186, -1
  %53 = load i32, i32* %rem0, align 4, !tbaa !1
  %54 = load i32, i32* %rem1, align 4, !tbaa !1
  %55 = load i32, i32* %rem2, align 4, !tbaa !1
  call void @add96(i32 %53, i32 %54, i32 %55, i32 0, i32 %51, i32 %52, i32* nonnull %rem0, i32* nonnull %rem1, i32* nonnull %rem2)
  %56 = load i32, i32* %rem0, align 4, !tbaa !1
  %cmp90 = icmp slt i32 %56, 0
  br i1 %cmp90, label %while.body, label %while.cond.while.end_crit_edge

while.cond.while.end_crit_edge:                   ; preds = %while.body
  store i32 %dec, i32* %zSig0, align 4, !tbaa !1
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %if.end.88
  %57 = load i32, i32* %rem1, align 4, !tbaa !1
  %58 = load i32, i32* %rem2, align 4, !tbaa !1
  %59 = load i32, i32* %bSig0, align 4, !tbaa !1
  %call91 = tail call fastcc i32 @estimateDiv64To32(i32 %57, i32 %58, i32 %59)
  store i32 %call91, i32* %zSig1, align 4, !tbaa !1
  %and = and i32 %call91, 1023
  %cmp92 = icmp ult i32 %and, 5
  br i1 %cmp92, label %if.then.93, label %if.end.103

if.then.93:                                       ; preds = %while.end
  %60 = load i32, i32* %bSig0, align 4, !tbaa !1
  %61 = load i32, i32* %bSig1, align 4, !tbaa !1
  call void @mul64By32To96(i32 %60, i32 %61, i32 %call91, i32* nonnull %term1, i32* nonnull %term2, i32* nonnull %term3)
  %62 = load i32, i32* %rem1, align 4, !tbaa !1
  %63 = load i32, i32* %rem2, align 4, !tbaa !1
  %64 = load i32, i32* %term1, align 4, !tbaa !1
  %65 = load i32, i32* %term2, align 4, !tbaa !1
  %66 = load i32, i32* %term3, align 4, !tbaa !1
  call void @sub96(i32 %62, i32 %63, i32 0, i32 %64, i32 %65, i32 %66, i32* nonnull %rem1, i32* nonnull %rem2, i32* nonnull %rem3)
  %67 = load i32, i32* %rem1, align 4, !tbaa !1
  %cmp95.183 = icmp slt i32 %67, 0
  br i1 %cmp95.183, label %while.body.96.lr.ph, label %while.end.98

while.body.96.lr.ph:                              ; preds = %if.then.93
  %68 = load i32, i32* %bSig0, align 4, !tbaa !1
  %69 = load i32, i32* %bSig1, align 4, !tbaa !1
  %zSig1.promoted = load i32, i32* %zSig1, align 4, !tbaa !1
  br label %while.body.96

while.body.96:                                    ; preds = %while.body.96.lr.ph, %while.body.96
  %dec97184 = phi i32 [ %zSig1.promoted, %while.body.96.lr.ph ], [ %dec97, %while.body.96 ]
  %dec97 = add i32 %dec97184, -1
  %70 = load i32, i32* %rem1, align 4, !tbaa !1
  %71 = load i32, i32* %rem2, align 4, !tbaa !1
  %72 = load i32, i32* %rem3, align 4, !tbaa !1
  call void @add96(i32 %70, i32 %71, i32 %72, i32 0, i32 %68, i32 %69, i32* nonnull %rem1, i32* nonnull %rem2, i32* nonnull %rem3)
  %73 = load i32, i32* %rem1, align 4, !tbaa !1
  %cmp95 = icmp slt i32 %73, 0
  br i1 %cmp95, label %while.body.96, label %while.cond.94.while.end.98_crit_edge

while.cond.94.while.end.98_crit_edge:             ; preds = %while.body.96
  store i32 %dec97, i32* %zSig1, align 4, !tbaa !1
  br label %while.end.98

while.end.98:                                     ; preds = %while.cond.94.while.end.98_crit_edge, %if.then.93
  %.lcssa = phi i32 [ %73, %while.cond.94.while.end.98_crit_edge ], [ %67, %if.then.93 ]
  %74 = load i32, i32* %rem2, align 4, !tbaa !1
  %or99 = or i32 %74, %.lcssa
  %75 = load i32, i32* %rem3, align 4, !tbaa !1
  %or100 = or i32 %or99, %75
  %cmp101 = icmp ne i32 %or100, 0
  %conv = zext i1 %cmp101 to i32
  %76 = load i32, i32* %zSig1, align 4, !tbaa !1
  %or102 = or i32 %conv, %76
  store i32 %or102, i32* %zSig1, align 4, !tbaa !1
  br label %if.end.103

if.end.103:                                       ; preds = %while.end.98, %while.end
  %77 = load i32, i32* %zSig0, align 4, !tbaa !1
  %78 = load i32, i32* %zSig1, align 4, !tbaa !1
  call void @shift64ExtraRightJamming(i32 %77, i32 %78, i32 0, i32 11, i32* nonnull %zSig0, i32* nonnull %zSig1, i32* nonnull %zSig2)
  %79 = load i32, i32* %zSig0, align 4, !tbaa !1
  %80 = load i32, i32* %zSig1, align 4, !tbaa !1
  %81 = load i32, i32* %zSig2, align 4, !tbaa !1
  %call104 = tail call fastcc i64 @roundAndPackFloat64(i32 %xor, i32 %zExp.0, i32 %79, i32 %80, i32 %81)
  %retval.sroa.0.0.extract.trunc168 = trunc i64 %call104 to i32
  %retval.sroa.10.0.extract.shift181 = lshr i64 %call104, 32
  %retval.sroa.10.0.extract.trunc182 = trunc i64 %retval.sroa.10.0.extract.shift181 to i32
  br label %cleanup

cleanup:                                          ; preds = %if.end.103, %if.then.79, %if.end.71, %invalid, %if.end.57, %if.then.51, %if.end.44, %if.then.37, %if.then.27
  %retval.sroa.0.0 = phi i32 [ %retval.sroa.0.0.extract.trunc, %if.then.27 ], [ %retval.sroa.0.0.extract.trunc162, %if.then.37 ], [ 2147483647, %invalid ], [ %retval.sroa.0.0.extract.trunc163, %if.end.44 ], [ %retval.sroa.0.0.extract.trunc164, %if.then.51 ], [ %retval.sroa.0.0.extract.trunc165, %if.end.57 ], [ %retval.sroa.0.0.extract.trunc166, %if.end.71 ], [ %retval.sroa.0.0.extract.trunc167, %if.then.79 ], [ %retval.sroa.0.0.extract.trunc168, %if.end.103 ]
  %retval.sroa.10.0 = phi i32 [ %retval.sroa.10.0.extract.trunc, %if.then.27 ], [ %retval.sroa.10.0.extract.trunc170, %if.then.37 ], [ -1, %invalid ], [ %retval.sroa.10.0.extract.trunc172, %if.end.44 ], [ %retval.sroa.10.0.extract.trunc174, %if.then.51 ], [ %retval.sroa.10.0.extract.trunc176, %if.end.57 ], [ %retval.sroa.10.0.extract.trunc178, %if.end.71 ], [ %retval.sroa.10.0.extract.trunc180, %if.then.79 ], [ %retval.sroa.10.0.extract.trunc182, %if.end.103 ]
  call void @llvm.lifetime.end(i64 4, i8* %16) #1
  call void @llvm.lifetime.end(i64 4, i8* %15) #1
  call void @llvm.lifetime.end(i64 4, i8* %14) #1
  call void @llvm.lifetime.end(i64 4, i8* %13) #1
  call void @llvm.lifetime.end(i64 4, i8* %12) #1
  call void @llvm.lifetime.end(i64 4, i8* %11) #1
  call void @llvm.lifetime.end(i64 4, i8* %10) #1
  call void @llvm.lifetime.end(i64 4, i8* %9) #1
  call void @llvm.lifetime.end(i64 4, i8* %8) #1
  call void @llvm.lifetime.end(i64 4, i8* %7) #1
  call void @llvm.lifetime.end(i64 4, i8* %6) #1
  call void @llvm.lifetime.end(i64 4, i8* %5) #1
  call void @llvm.lifetime.end(i64 4, i8* %4) #1
  call void @llvm.lifetime.end(i64 4, i8* %3) #1
  call void @llvm.lifetime.end(i64 4, i8* %2) #1
  call void @llvm.lifetime.end(i64 4, i8* %1) #1
  call void @llvm.lifetime.end(i64 4, i8* %0) #1
  %retval.sroa.10.0.insert.ext = zext i32 %retval.sroa.10.0 to i64
  %retval.sroa.10.0.insert.shift = shl nuw i64 %retval.sroa.10.0.insert.ext, 32
  %retval.sroa.0.0.insert.ext = zext i32 %retval.sroa.0.0 to i64
  %retval.sroa.0.0.insert.insert = or i64 %retval.sroa.10.0.insert.shift, %retval.sroa.0.0.insert.ext
  ret i64 %retval.sroa.0.0.insert.insert
}

; Function Attrs: nounwind
define i64 @float64_rem(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #3 {
entry:
  %aExp = alloca i32, align 4
  %bExp = alloca i32, align 4
  %aSig0 = alloca i32, align 4
  %aSig1 = alloca i32, align 4
  %bSig0 = alloca i32, align 4
  %bSig1 = alloca i32, align 4
  %term0 = alloca i32, align 4
  %term1 = alloca i32, align 4
  %term2 = alloca i32, align 4
  %allZero = alloca i32, align 4
  %sigMean1 = alloca i32, align 4
  %sigMean0 = alloca i32, align 4
  %0 = bitcast i32* %aExp to i8*
  call void @llvm.lifetime.start(i64 4, i8* %0) #1
  %1 = bitcast i32* %bExp to i8*
  call void @llvm.lifetime.start(i64 4, i8* %1) #1
  %2 = bitcast i32* %aSig0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %2) #1
  %3 = bitcast i32* %aSig1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %3) #1
  %4 = bitcast i32* %bSig0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %4) #1
  %5 = bitcast i32* %bSig1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %5) #1
  %6 = bitcast i32* %term0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %6) #1
  %7 = bitcast i32* %term1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %7) #1
  %8 = bitcast i32* %term2 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %8) #1
  %9 = bitcast i32* %allZero to i8*
  call void @llvm.lifetime.start(i64 4, i8* %9) #1
  %10 = bitcast i32* %sigMean1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %10) #1
  %11 = bitcast i32* %sigMean0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %11) #1
  %call = tail call i32 @extractFloat64Frac1(i32 undef, i32 %a.1)
  store i32 %call, i32* %aSig1, align 4, !tbaa !1
  %call8 = tail call i32 @extractFloat64Frac0(i32 %a.0, i32 undef)
  store i32 %call8, i32* %aSig0, align 4, !tbaa !1
  %call11 = tail call i32 @extractFloat64Exp(i32 %a.0, i32 undef)
  store i32 %call11, i32* %aExp, align 4, !tbaa !1
  %call14 = tail call i32 @extractFloat64Sign(i32 %a.0, i32 undef)
  %call17 = tail call i32 @extractFloat64Frac1(i32 undef, i32 %b.1)
  store i32 %call17, i32* %bSig1, align 4, !tbaa !1
  %call20 = tail call i32 @extractFloat64Frac0(i32 %b.0, i32 undef)
  store i32 %call20, i32* %bSig0, align 4, !tbaa !1
  %call23 = tail call i32 @extractFloat64Exp(i32 %b.0, i32 undef)
  store i32 %call23, i32* %bExp, align 4, !tbaa !1
  %12 = load i32, i32* %aExp, align 4, !tbaa !1
  %cmp = icmp eq i32 %12, 2047
  br i1 %cmp, label %if.then, label %if.end.36

if.then:                                          ; preds = %entry
  %13 = load i32, i32* %aSig0, align 4, !tbaa !1
  %14 = load i32, i32* %aSig1, align 4, !tbaa !1
  %or = or i32 %14, %13
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then.30

lor.lhs.false:                                    ; preds = %if.then
  %cmp27 = icmp eq i32 %call23, 2047
  br i1 %cmp27, label %land.lhs.true, label %invalid

land.lhs.true:                                    ; preds = %lor.lhs.false
  %15 = load i32, i32* %bSig0, align 4, !tbaa !1
  %16 = load i32, i32* %bSig1, align 4, !tbaa !1
  %or28 = or i32 %16, %15
  %tobool29 = icmp eq i32 %or28, 0
  br i1 %tobool29, label %invalid, label %if.then.30

if.then.30:                                       ; preds = %land.lhs.true, %if.then
  %call35 = tail call fastcc i64 @propagateFloat64NaN(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1)
  %retval.sroa.0.0.extract.trunc = trunc i64 %call35 to i32
  %retval.sroa.8.0.extract.shift = lshr i64 %call35, 32
  %retval.sroa.8.0.extract.trunc = trunc i64 %retval.sroa.8.0.extract.shift to i32
  br label %cleanup

if.end.36:                                        ; preds = %entry
  switch i32 %call23, label %if.end.57 [
    i32 2047, label %if.then.38
    i32 0, label %if.then.50
  ]

if.then.38:                                       ; preds = %if.end.36
  %17 = load i32, i32* %bSig0, align 4, !tbaa !1
  %18 = load i32, i32* %bSig1, align 4, !tbaa !1
  %or39 = or i32 %18, %17
  %tobool40 = icmp eq i32 %or39, 0
  br i1 %tobool40, label %cleanup, label %if.then.41

if.then.41:                                       ; preds = %if.then.38
  %call46 = tail call fastcc i64 @propagateFloat64NaN(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1)
  %retval.sroa.0.0.extract.trunc201 = trunc i64 %call46 to i32
  %retval.sroa.8.0.extract.shift203 = lshr i64 %call46, 32
  %retval.sroa.8.0.extract.trunc204 = trunc i64 %retval.sroa.8.0.extract.shift203 to i32
  br label %cleanup

if.then.50:                                       ; preds = %if.end.36
  %19 = load i32, i32* %bSig0, align 4, !tbaa !1
  %20 = load i32, i32* %bSig1, align 4, !tbaa !1
  %or51 = or i32 %20, %19
  %cmp52 = icmp eq i32 %or51, 0
  br i1 %cmp52, label %invalid, label %if.end.56

invalid:                                          ; preds = %land.lhs.true, %if.then.50, %lor.lhs.false
  tail call void @float_raise(i32 16)
  br label %cleanup

if.end.56:                                        ; preds = %if.then.50
  call fastcc void @normalizeFloat64Subnormal(i32 %19, i32 %20, i32* nonnull %bExp, i32* nonnull %bSig0, i32* nonnull %bSig1)
  br label %if.end.57

if.end.57:                                        ; preds = %if.end.36, %if.end.56
  %21 = load i32, i32* %aExp, align 4, !tbaa !1
  %cmp58 = icmp eq i32 %21, 0
  br i1 %cmp58, label %if.then.59, label %if.end.64

if.then.59:                                       ; preds = %if.end.57
  %22 = load i32, i32* %aSig0, align 4, !tbaa !1
  %23 = load i32, i32* %aSig1, align 4, !tbaa !1
  %or60 = or i32 %23, %22
  %cmp61 = icmp eq i32 %or60, 0
  br i1 %cmp61, label %cleanup, label %if.end.63

if.end.63:                                        ; preds = %if.then.59
  call fastcc void @normalizeFloat64Subnormal(i32 %22, i32 %23, i32* nonnull %aExp, i32* nonnull %aSig0, i32* nonnull %aSig1)
  br label %if.end.64

if.end.64:                                        ; preds = %if.end.63, %if.end.57
  %24 = load i32, i32* %aExp, align 4, !tbaa !1
  %25 = load i32, i32* %bExp, align 4, !tbaa !1
  %sub = sub nsw i32 %24, %25
  %cmp65 = icmp slt i32 %sub, -1
  br i1 %cmp65, label %cleanup, label %if.end.67

if.end.67:                                        ; preds = %if.end.64
  %26 = load i32, i32* %aSig0, align 4, !tbaa !1
  %or68 = or i32 %26, 1048576
  %27 = load i32, i32* %aSig1, align 4, !tbaa !1
  %sub.lobit = lshr i32 %sub, 31
  %sub70 = sub nsw i32 11, %sub.lobit
  call void @shortShift64Left(i32 %or68, i32 %27, i32 %sub70, i32* nonnull %aSig0, i32* nonnull %aSig1)
  %28 = load i32, i32* %bSig0, align 4, !tbaa !1
  %or71 = or i32 %28, 1048576
  %29 = load i32, i32* %bSig1, align 4, !tbaa !1
  call void @shortShift64Left(i32 %or71, i32 %29, i32 11, i32* nonnull %bSig0, i32* nonnull %bSig1)
  %30 = load i32, i32* %bSig0, align 4, !tbaa !1
  %31 = load i32, i32* %bSig1, align 4, !tbaa !1
  %32 = load i32, i32* %aSig0, align 4, !tbaa !1
  %33 = load i32, i32* %aSig1, align 4, !tbaa !1
  %call72 = tail call i32 @le64(i32 %30, i32 %31, i32 %32, i32 %33)
  %tobool73 = icmp eq i32 %call72, 0
  br i1 %tobool73, label %if.end.75, label %if.then.74

if.then.74:                                       ; preds = %if.end.67
  call void @sub64(i32 %32, i32 %33, i32 %30, i32 %31, i32* nonnull %aSig0, i32* nonnull %aSig1)
  br label %if.end.75

if.end.75:                                        ; preds = %if.end.67, %if.then.74
  %sub76 = add nsw i32 %sub, -32
  %cmp77.209 = icmp sgt i32 %sub, 32
  br i1 %cmp77.209, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %if.end.75
  %34 = load i32, i32* %bSig0, align 4, !tbaa !1
  %35 = load i32, i32* %bSig1, align 4, !tbaa !1
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %expDiff.0210 = phi i32 [ %sub76, %while.body.lr.ph ], [ %sub83, %while.body ]
  %36 = load i32, i32* %aSig0, align 4, !tbaa !1
  %37 = load i32, i32* %aSig1, align 4, !tbaa !1
  %call79 = tail call fastcc i32 @estimateDiv64To32(i32 %36, i32 %37, i32 %34)
  %cmp80 = icmp ugt i32 %call79, 4
  %sub82 = add i32 %call79, -4
  %cond = select i1 %cmp80, i32 %sub82, i32 0
  call void @mul64By32To96(i32 %34, i32 %35, i32 %cond, i32* nonnull %term0, i32* nonnull %term1, i32* nonnull %term2)
  %38 = load i32, i32* %term0, align 4, !tbaa !1
  %39 = load i32, i32* %term1, align 4, !tbaa !1
  %40 = load i32, i32* %term2, align 4, !tbaa !1
  call void @shortShift96Left(i32 %38, i32 %39, i32 %40, i32 29, i32* nonnull %term1, i32* nonnull %term2, i32* nonnull %allZero)
  %41 = load i32, i32* %aSig0, align 4, !tbaa !1
  %42 = load i32, i32* %aSig1, align 4, !tbaa !1
  call void @shortShift64Left(i32 %41, i32 %42, i32 29, i32* nonnull %aSig0, i32* nonnull %allZero)
  %43 = load i32, i32* %aSig0, align 4, !tbaa !1
  %44 = load i32, i32* %term1, align 4, !tbaa !1
  %45 = load i32, i32* %term2, align 4, !tbaa !1
  call void @sub64(i32 %43, i32 0, i32 %44, i32 %45, i32* nonnull %aSig0, i32* nonnull %aSig1)
  %sub83 = add nsw i32 %expDiff.0210, -29
  %cmp77 = icmp sgt i32 %expDiff.0210, 29
  br i1 %cmp77, label %while.body, label %while.end

while.end:                                        ; preds = %while.body, %if.end.75
  %expDiff.0.lcssa = phi i32 [ %sub76, %if.end.75 ], [ %sub83, %while.body ]
  %q.0.lcssa = phi i32 [ %call72, %if.end.75 ], [ %cond, %while.body ]
  %cmp84 = icmp sgt i32 %expDiff.0.lcssa, -32
  %46 = load i32, i32* %aSig0, align 4, !tbaa !1
  %47 = load i32, i32* %aSig1, align 4, !tbaa !1
  br i1 %cmp84, label %if.then.86, label %if.else.101

if.then.86:                                       ; preds = %while.end
  %48 = load i32, i32* %bSig0, align 4, !tbaa !1
  %call87 = tail call fastcc i32 @estimateDiv64To32(i32 %46, i32 %47, i32 %48)
  %cmp88 = icmp ugt i32 %call87, 4
  %sub91 = add i32 %call87, -4
  %cond94 = select i1 %cmp88, i32 %sub91, i32 0
  %sub95 = sub nsw i32 0, %expDiff.0.lcssa
  %shr = lshr i32 %cond94, %sub95
  %49 = load i32, i32* %bSig0, align 4, !tbaa !1
  %50 = load i32, i32* %bSig1, align 4, !tbaa !1
  call void @shift64Right(i32 %49, i32 %50, i32 8, i32* nonnull %bSig0, i32* nonnull %bSig1)
  %cmp96 = icmp slt i32 %expDiff.0.lcssa, -24
  %51 = load i32, i32* %aSig0, align 4, !tbaa !1
  %52 = load i32, i32* %aSig1, align 4, !tbaa !1
  br i1 %cmp96, label %if.then.98, label %if.else

if.then.98:                                       ; preds = %if.then.86
  %sub99 = sub i32 -24, %expDiff.0.lcssa
  call void @shift64Right(i32 %51, i32 %52, i32 %sub99, i32* nonnull %aSig0, i32* nonnull %aSig1)
  br label %if.end.100

if.else:                                          ; preds = %if.then.86
  %add = add nsw i32 %expDiff.0.lcssa, 24
  call void @shortShift64Left(i32 %51, i32 %52, i32 %add, i32* nonnull %aSig0, i32* nonnull %aSig1)
  br label %if.end.100

if.end.100:                                       ; preds = %if.else, %if.then.98
  %53 = load i32, i32* %bSig0, align 4, !tbaa !1
  %54 = load i32, i32* %bSig1, align 4, !tbaa !1
  call void @mul64By32To96(i32 %53, i32 %54, i32 %shr, i32* nonnull %term0, i32* nonnull %term1, i32* nonnull %term2)
  %55 = load i32, i32* %aSig0, align 4, !tbaa !1
  %56 = load i32, i32* %aSig1, align 4, !tbaa !1
  %57 = load i32, i32* %term1, align 4, !tbaa !1
  %58 = load i32, i32* %term2, align 4, !tbaa !1
  call void @sub64(i32 %55, i32 %56, i32 %57, i32 %58, i32* nonnull %aSig0, i32* nonnull %aSig1)
  br label %do.body.preheader

if.else.101:                                      ; preds = %while.end
  call void @shift64Right(i32 %46, i32 %47, i32 8, i32* nonnull %aSig0, i32* nonnull %aSig1)
  %59 = load i32, i32* %bSig0, align 4, !tbaa !1
  %60 = load i32, i32* %bSig1, align 4, !tbaa !1
  call void @shift64Right(i32 %59, i32 %60, i32 8, i32* nonnull %bSig0, i32* nonnull %bSig1)
  br label %do.body.preheader

do.body.preheader:                                ; preds = %if.else.101, %if.end.100
  %q.1.ph = phi i32 [ %q.0.lcssa, %if.else.101 ], [ %shr, %if.end.100 ]
  %61 = load i32, i32* %bSig0, align 4, !tbaa !1
  %62 = load i32, i32* %bSig1, align 4, !tbaa !1
  br label %do.body

do.body:                                          ; preds = %do.body.preheader, %do.body
  %q.1 = phi i32 [ %inc, %do.body ], [ %q.1.ph, %do.body.preheader ]
  %63 = load i32, i32* %aSig0, align 4, !tbaa !1
  %64 = load i32, i32* %aSig1, align 4, !tbaa !1
  %inc = add i32 %q.1, 1
  call void @sub64(i32 %63, i32 %64, i32 %61, i32 %62, i32* nonnull %aSig0, i32* nonnull %aSig1)
  %65 = load i32, i32* %aSig0, align 4, !tbaa !1
  %cmp103 = icmp sgt i32 %65, -1
  br i1 %cmp103, label %do.body, label %do.end

do.end:                                           ; preds = %do.body
  %66 = load i32, i32* %aSig1, align 4, !tbaa !1
  call void @add64(i32 %65, i32 %66, i32 %63, i32 %64, i32* nonnull %sigMean0, i32* nonnull %sigMean1)
  %67 = load i32, i32* %sigMean0, align 4, !tbaa !1
  %cmp105 = icmp slt i32 %67, 0
  br i1 %cmp105, label %if.then.113, label %lor.lhs.false.107

lor.lhs.false.107:                                ; preds = %do.end
  %68 = load i32, i32* %sigMean1, align 4, !tbaa !1
  %or108 = or i32 %68, %67
  %cmp109 = icmp ne i32 %or108, 0
  %and = and i32 %inc, 1
  %tobool112 = icmp eq i32 %and, 0
  %or.cond = or i1 %tobool112, %cmp109
  br i1 %or.cond, label %if.end.114thread-pre-split, label %if.then.113

if.then.113:                                      ; preds = %lor.lhs.false.107, %do.end
  store i32 %63, i32* %aSig0, align 4, !tbaa !1
  store i32 %64, i32* %aSig1, align 4, !tbaa !1
  br label %if.end.114

if.end.114thread-pre-split:                       ; preds = %lor.lhs.false.107
  %.pr = load i32, i32* %aSig0, align 4, !tbaa !1
  br label %if.end.114

if.end.114:                                       ; preds = %if.end.114thread-pre-split, %if.then.113
  %69 = phi i32 [ %.pr, %if.end.114thread-pre-split ], [ %63, %if.then.113 ]
  %cmp115 = icmp slt i32 %69, 0
  %.lobit = lshr i32 %69, 31
  br i1 %cmp115, label %if.then.118, label %if.end.119

if.then.118:                                      ; preds = %if.end.114
  %70 = load i32, i32* %aSig1, align 4, !tbaa !1
  call void @sub64(i32 0, i32 0, i32 %69, i32 %70, i32* nonnull %aSig0, i32* nonnull %aSig1)
  br label %if.end.119

if.end.119:                                       ; preds = %if.then.118, %if.end.114
  %xor = xor i32 %.lobit, %call14
  %71 = load i32, i32* %bExp, align 4, !tbaa !1
  %sub120 = add nsw i32 %71, -4
  %72 = load i32, i32* %aSig0, align 4, !tbaa !1
  %73 = load i32, i32* %aSig1, align 4, !tbaa !1
  %call121 = tail call fastcc i64 @normalizeRoundAndPackFloat64(i32 %xor, i32 %sub120, i32 %72, i32 %73)
  %retval.sroa.0.0.extract.trunc202 = trunc i64 %call121 to i32
  %retval.sroa.8.0.extract.shift205 = lshr i64 %call121, 32
  %retval.sroa.8.0.extract.trunc206 = trunc i64 %retval.sroa.8.0.extract.shift205 to i32
  br label %cleanup

cleanup:                                          ; preds = %if.end.64, %if.then.59, %if.then.38, %if.end.119, %invalid, %if.then.41, %if.then.30
  %retval.sroa.0.0 = phi i32 [ %retval.sroa.0.0.extract.trunc, %if.then.30 ], [ 2147483647, %invalid ], [ %retval.sroa.0.0.extract.trunc201, %if.then.41 ], [ %retval.sroa.0.0.extract.trunc202, %if.end.119 ], [ %a.0, %if.then.38 ], [ %a.0, %if.then.59 ], [ %a.0, %if.end.64 ]
  %retval.sroa.8.0 = phi i32 [ %retval.sroa.8.0.extract.trunc, %if.then.30 ], [ -1, %invalid ], [ %retval.sroa.8.0.extract.trunc204, %if.then.41 ], [ %retval.sroa.8.0.extract.trunc206, %if.end.119 ], [ %a.1, %if.then.38 ], [ %a.1, %if.then.59 ], [ %a.1, %if.end.64 ]
  call void @llvm.lifetime.end(i64 4, i8* %11) #1
  call void @llvm.lifetime.end(i64 4, i8* %10) #1
  call void @llvm.lifetime.end(i64 4, i8* %9) #1
  call void @llvm.lifetime.end(i64 4, i8* %8) #1
  call void @llvm.lifetime.end(i64 4, i8* %7) #1
  call void @llvm.lifetime.end(i64 4, i8* %6) #1
  call void @llvm.lifetime.end(i64 4, i8* %5) #1
  call void @llvm.lifetime.end(i64 4, i8* %4) #1
  call void @llvm.lifetime.end(i64 4, i8* %3) #1
  call void @llvm.lifetime.end(i64 4, i8* %2) #1
  call void @llvm.lifetime.end(i64 4, i8* %1) #1
  call void @llvm.lifetime.end(i64 4, i8* %0) #1
  %retval.sroa.8.0.insert.ext = zext i32 %retval.sroa.8.0 to i64
  %retval.sroa.8.0.insert.shift = shl nuw i64 %retval.sroa.8.0.insert.ext, 32
  %retval.sroa.0.0.insert.ext = zext i32 %retval.sroa.0.0 to i64
  %retval.sroa.0.0.insert.insert = or i64 %retval.sroa.8.0.insert.shift, %retval.sroa.0.0.insert.ext
  ret i64 %retval.sroa.0.0.insert.insert
}

; Function Attrs: nounwind
define internal fastcc i64 @normalizeRoundAndPackFloat64(i32 %zSign, i32 %zExp, i32 %zSig0, i32 %zSig1) #3 {
entry:
  %zSig0.addr = alloca i32, align 4
  %zSig1.addr = alloca i32, align 4
  %zSig2 = alloca i32, align 4
  store i32 %zSig0, i32* %zSig0.addr, align 4, !tbaa !1
  store i32 %zSig1, i32* %zSig1.addr, align 4, !tbaa !1
  %0 = bitcast i32* %zSig2 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %0) #1
  %cmp = icmp eq i32 %zSig0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %zSig1.addr, align 4, !tbaa !1
  store i32 %1, i32* %zSig0.addr, align 4, !tbaa !1
  store i32 0, i32* %zSig1.addr, align 4, !tbaa !1
  %sub = add nsw i32 %zExp, -32
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %zExp.addr.0 = phi i32 [ %sub, %if.then ], [ %zExp, %entry ]
  %2 = load i32, i32* %zSig0.addr, align 4, !tbaa !1
  %call = tail call fastcc i32 @countLeadingZeros32(i32 %2)
  %sub1 = add nsw i32 %call, -11
  %cmp2 = icmp sgt i32 %sub1, -1
  br i1 %cmp2, label %if.then.3, label %if.else

if.then.3:                                        ; preds = %if.end
  store i32 0, i32* %zSig2, align 4, !tbaa !1
  %3 = load i32, i32* %zSig0.addr, align 4, !tbaa !1
  %4 = load i32, i32* %zSig1.addr, align 4, !tbaa !1
  call void @shortShift64Left(i32 %3, i32 %4, i32 %sub1, i32* nonnull %zSig0.addr, i32* nonnull %zSig1.addr)
  br label %if.end.5

if.else:                                          ; preds = %if.end
  %5 = load i32, i32* %zSig1.addr, align 4, !tbaa !1
  %sub4 = sub i32 11, %call
  call void @shift64ExtraRightJamming(i32 %2, i32 %5, i32 0, i32 %sub4, i32* nonnull %zSig0.addr, i32* nonnull %zSig1.addr, i32* nonnull %zSig2)
  br label %if.end.5

if.end.5:                                         ; preds = %if.else, %if.then.3
  %sub6 = sub nsw i32 %zExp.addr.0, %sub1
  %6 = load i32, i32* %zSig0.addr, align 4, !tbaa !1
  %7 = load i32, i32* %zSig1.addr, align 4, !tbaa !1
  %8 = load i32, i32* %zSig2, align 4, !tbaa !1
  %call7 = tail call fastcc i64 @roundAndPackFloat64(i32 %zSign, i32 %sub6, i32 %6, i32 %7, i32 %8)
  call void @llvm.lifetime.end(i64 4, i8* %0) #1
  ret i64 %call7
}

; Function Attrs: nounwind
define i64 @float64_sqrt(i32 %a.0, i32 %a.1) #3 {
entry:
  %aExp = alloca i32, align 4
  %aSig0 = alloca i32, align 4
  %aSig1 = alloca i32, align 4
  %zSig0 = alloca i32, align 4
  %zSig1 = alloca i32, align 4
  %zSig2 = alloca i32, align 4
  %rem0 = alloca i32, align 4
  %rem1 = alloca i32, align 4
  %rem2 = alloca i32, align 4
  %rem3 = alloca i32, align 4
  %term0 = alloca i32, align 4
  %term1 = alloca i32, align 4
  %term2 = alloca i32, align 4
  %term3 = alloca i32, align 4
  %0 = bitcast i32* %aExp to i8*
  call void @llvm.lifetime.start(i64 4, i8* %0) #1
  %1 = bitcast i32* %aSig0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %1) #1
  %2 = bitcast i32* %aSig1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %2) #1
  %3 = bitcast i32* %zSig0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %3) #1
  %4 = bitcast i32* %zSig1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %4) #1
  %5 = bitcast i32* %zSig2 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %5) #1
  %6 = bitcast i32* %rem0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %6) #1
  %7 = bitcast i32* %rem1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %7) #1
  %8 = bitcast i32* %rem2 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %8) #1
  %9 = bitcast i32* %rem3 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %9) #1
  %10 = bitcast i32* %term0 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %10) #1
  %11 = bitcast i32* %term1 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %11) #1
  %12 = bitcast i32* %term2 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %12) #1
  %13 = bitcast i32* %term3 to i8*
  call void @llvm.lifetime.start(i64 4, i8* %13) #1
  %call = tail call i32 @extractFloat64Frac1(i32 undef, i32 %a.1)
  store i32 %call, i32* %aSig1, align 4, !tbaa !1
  %call5 = tail call i32 @extractFloat64Frac0(i32 %a.0, i32 undef)
  store i32 %call5, i32* %aSig0, align 4, !tbaa !1
  %call8 = tail call i32 @extractFloat64Exp(i32 %a.0, i32 undef)
  store i32 %call8, i32* %aExp, align 4, !tbaa !1
  %call11 = tail call i32 @extractFloat64Sign(i32 %a.0, i32 undef)
  %cmp = icmp eq i32 %call8, 2047
  br i1 %cmp, label %if.then, label %if.end.21

if.then:                                          ; preds = %entry
  %14 = load i32, i32* %aSig0, align 4, !tbaa !1
  %15 = load i32, i32* %aSig1, align 4, !tbaa !1
  %or = or i32 %15, %14
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %if.end, label %if.then.12

if.then.12:                                       ; preds = %if.then
  %call17 = tail call fastcc i64 @propagateFloat64NaN(i32 %a.0, i32 %a.1, i32 %a.0, i32 %a.1)
  %retval.sroa.0.0.extract.trunc = trunc i64 %call17 to i32
  %retval.sroa.7.0.extract.shift = lshr i64 %call17, 32
  %retval.sroa.7.0.extract.trunc = trunc i64 %retval.sroa.7.0.extract.shift to i32
  br label %cleanup

if.end:                                           ; preds = %if.then
  %tobool18 = icmp eq i32 %call11, 0
  br i1 %tobool18, label %cleanup, label %invalid

if.end.21:                                        ; preds = %entry
  %tobool22 = icmp eq i32 %call11, 0
  br i1 %tobool22, label %if.end.31, label %if.then.23

if.then.23:                                       ; preds = %if.end.21
  %16 = load i32, i32* %aSig0, align 4, !tbaa !1
  %or24 = or i32 %16, %call8
  %17 = load i32, i32* %aSig1, align 4, !tbaa !1
  %or25 = or i32 %or24, %17
  %cmp26 = icmp eq i32 %or25, 0
  br i1 %cmp26, label %cleanup, label %invalid

invalid:                                          ; preds = %if.end, %if.then.23
  tail call void @float_raise(i32 16)
  br label %cleanup

if.end.31:                                        ; preds = %if.end.21
  %cmp32 = icmp eq i32 %call8, 0
  br i1 %cmp32, label %if.then.33, label %if.end.39

if.then.33:                                       ; preds = %if.end.31
  %18 = load i32, i32* %aSig0, align 4, !tbaa !1
  %19 = load i32, i32* %aSig1, align 4, !tbaa !1
  %or34 = or i32 %19, %18
  %cmp35 = icmp eq i32 %or34, 0
  br i1 %cmp35, label %if.then.36, label %if.end.38

if.then.36:                                       ; preds = %if.then.33
  %call37 = tail call i64 @packFloat64(i32 0, i32 0, i32 0, i32 0)
  %retval.sroa.0.0.extract.trunc115 = trunc i64 %call37 to i32
  %retval.sroa.7.0.extract.shift117 = lshr i64 %call37, 32
  %retval.sroa.7.0.extract.trunc118 = trunc i64 %retval.sroa.7.0.extract.shift117 to i32
  br label %cleanup

if.end.38:                                        ; preds = %if.then.33
  call fastcc void @normalizeFloat64Subnormal(i32 %18, i32 %19, i32* nonnull %aExp, i32* nonnull %aSig0, i32* nonnull %aSig1)
  br label %if.end.39

if.end.39:                                        ; preds = %if.end.38, %if.end.31
  %20 = load i32, i32* %aExp, align 4, !tbaa !1
  %sub = add nsw i32 %20, -1023
  %shr = ashr i32 %sub, 1
  %add = add nsw i32 %shr, 1022
  %21 = load i32, i32* %aSig0, align 4, !tbaa !1
  %or40 = or i32 %21, 1048576
  store i32 %or40, i32* %aSig0, align 4, !tbaa !1
  %22 = load i32, i32* %aSig1, align 4, !tbaa !1
  call void @shortShift64Left(i32 %or40, i32 %22, i32 11, i32* nonnull %term0, i32* nonnull %term1)
  %23 = load i32, i32* %aExp, align 4, !tbaa !1
  %24 = load i32, i32* %term0, align 4, !tbaa !1
  %call41 = tail call fastcc i32 @estimateSqrt32(i32 %23, i32 %24)
  %shr42 = lshr i32 %call41, 1
  %add43 = add nuw i32 %shr42, 1
  store i32 %add43, i32* %zSig0, align 4, !tbaa !1
  %add47 = shl i32 %add43, 1
  %25 = load i32, i32* %aSig0, align 4, !tbaa !1
  %26 = load i32, i32* %aSig1, align 4, !tbaa !1
  %27 = load i32, i32* %aExp, align 4, !tbaa !1
  %and = and i32 %27, 1
  %sub48 = sub nsw i32 9, %and
  call void @shortShift64Left(i32 %25, i32 %26, i32 %sub48, i32* nonnull %aSig0, i32* nonnull %aSig1)
  %28 = load i32, i32* %zSig0, align 4, !tbaa !1
  call void @mul32To64(i32 %28, i32 %28, i32* nonnull %term0, i32* nonnull %term1)
  %29 = load i32, i32* %aSig0, align 4, !tbaa !1
  %30 = load i32, i32* %aSig1, align 4, !tbaa !1
  %31 = load i32, i32* %term0, align 4, !tbaa !1
  %32 = load i32, i32* %term1, align 4, !tbaa !1
  call void @sub64(i32 %29, i32 %30, i32 %31, i32 %32, i32* nonnull %rem0, i32* nonnull %rem1)
  %33 = load i32, i32* %rem0, align 4, !tbaa !1
  %cmp49.123 = icmp slt i32 %33, 0
  br i1 %cmp49.123, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %if.end.39
  %zSig0.promoted = load i32, i32* %zSig0, align 4, !tbaa !1
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %dec126 = phi i32 [ %zSig0.promoted, %while.body.lr.ph ], [ %dec, %while.body ]
  %doubleZSig0.0124 = phi i32 [ %add47, %while.body.lr.ph ], [ %sub50, %while.body ]
  %dec = add i32 %dec126, -1
  %sub50 = add i32 %doubleZSig0.0124, -2
  %34 = load i32, i32* %rem0, align 4, !tbaa !1
  %35 = load i32, i32* %rem1, align 4, !tbaa !1
  %or51 = or i32 %sub50, 1
  call void @add64(i32 %34, i32 %35, i32 0, i32 %or51, i32* nonnull %rem0, i32* nonnull %rem1)
  %36 = load i32, i32* %rem0, align 4, !tbaa !1
  %cmp49 = icmp slt i32 %36, 0
  br i1 %cmp49, label %while.body, label %while.cond.while.end_crit_edge

while.cond.while.end_crit_edge:                   ; preds = %while.body
  store i32 %dec, i32* %zSig0, align 4, !tbaa !1
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %if.end.39
  %doubleZSig0.0.lcssa = phi i32 [ %sub50, %while.cond.while.end_crit_edge ], [ %add47, %if.end.39 ]
  %37 = load i32, i32* %rem1, align 4, !tbaa !1
  %call52 = tail call fastcc i32 @estimateDiv64To32(i32 %37, i32 0, i32 %doubleZSig0.0.lcssa)
  store i32 %call52, i32* %zSig1, align 4, !tbaa !1
  %and53 = and i32 %call52, 510
  %cmp54 = icmp ult i32 %and53, 6
  br i1 %cmp54, label %if.then.55, label %if.end.70

if.then.55:                                       ; preds = %while.end
  %cmp56 = icmp eq i32 %call52, 0
  br i1 %cmp56, label %if.then.57, label %if.end.58

if.then.57:                                       ; preds = %if.then.55
  store i32 1, i32* %zSig1, align 4, !tbaa !1
  br label %if.end.58

if.end.58:                                        ; preds = %if.then.57, %if.then.55
  %38 = load i32, i32* %zSig1, align 4, !tbaa !1
  call void @mul32To64(i32 %doubleZSig0.0.lcssa, i32 %38, i32* nonnull %term1, i32* nonnull %term2)
  %39 = load i32, i32* %rem1, align 4, !tbaa !1
  %40 = load i32, i32* %term1, align 4, !tbaa !1
  %41 = load i32, i32* %term2, align 4, !tbaa !1
  call void @sub64(i32 %39, i32 0, i32 %40, i32 %41, i32* nonnull %rem1, i32* nonnull %rem2)
  call void @mul32To64(i32 %38, i32 %38, i32* nonnull %term2, i32* nonnull %term3)
  %42 = load i32, i32* %rem1, align 4, !tbaa !1
  %43 = load i32, i32* %rem2, align 4, !tbaa !1
  %44 = load i32, i32* %term2, align 4, !tbaa !1
  %45 = load i32, i32* %term3, align 4, !tbaa !1
  call void @sub96(i32 %42, i32 %43, i32 0, i32 0, i32 %44, i32 %45, i32* nonnull %rem1, i32* nonnull %rem2, i32* nonnull %rem3)
  %46 = load i32, i32* %rem1, align 4, !tbaa !1
  %cmp60.121 = icmp slt i32 %46, 0
  br i1 %cmp60.121, label %while.body.61.lr.ph, label %while.end.65

while.body.61.lr.ph:                              ; preds = %if.end.58
  %zSig1.promoted = load i32, i32* %zSig1, align 4, !tbaa !1
  br label %while.body.61

while.body.61:                                    ; preds = %while.body.61.lr.ph, %while.body.61
  %dec62122 = phi i32 [ %zSig1.promoted, %while.body.61.lr.ph ], [ %dec62, %while.body.61 ]
  %dec62 = add i32 %dec62122, -1
  call void @shortShift64Left(i32 0, i32 %dec62, i32 1, i32* nonnull %term2, i32* nonnull %term3)
  %47 = load i32, i32* %term3, align 4, !tbaa !1
  %or63 = or i32 %47, 1
  store i32 %or63, i32* %term3, align 4, !tbaa !1
  %48 = load i32, i32* %term2, align 4, !tbaa !1
  %or64 = or i32 %48, %doubleZSig0.0.lcssa
  store i32 %or64, i32* %term2, align 4, !tbaa !1
  %49 = load i32, i32* %rem1, align 4, !tbaa !1
  %50 = load i32, i32* %rem2, align 4, !tbaa !1
  %51 = load i32, i32* %rem3, align 4, !tbaa !1
  %52 = load i32, i32* %term3, align 4, !tbaa !1
  call void @add96(i32 %49, i32 %50, i32 %51, i32 0, i32 %or64, i32 %52, i32* nonnull %rem1, i32* nonnull %rem2, i32* nonnull %rem3)
  %53 = load i32, i32* %rem1, align 4, !tbaa !1
  %cmp60 = icmp slt i32 %53, 0
  br i1 %cmp60, label %while.body.61, label %while.cond.59.while.end.65_crit_edge

while.cond.59.while.end.65_crit_edge:             ; preds = %while.body.61
  store i32 %dec62, i32* %zSig1, align 4, !tbaa !1
  br label %while.end.65

while.end.65:                                     ; preds = %while.cond.59.while.end.65_crit_edge, %if.end.58
  %.lcssa = phi i32 [ %53, %while.cond.59.while.end.65_crit_edge ], [ %46, %if.end.58 ]
  %54 = load i32, i32* %rem2, align 4, !tbaa !1
  %or66 = or i32 %54, %.lcssa
  %55 = load i32, i32* %rem3, align 4, !tbaa !1
  %or67 = or i32 %or66, %55
  %cmp68 = icmp ne i32 %or67, 0
  %conv = zext i1 %cmp68 to i32
  %56 = load i32, i32* %zSig1, align 4, !tbaa !1
  %or69 = or i32 %conv, %56
  store i32 %or69, i32* %zSig1, align 4, !tbaa !1
  br label %if.end.70

if.end.70:                                        ; preds = %while.end.65, %while.end
  %57 = load i32, i32* %zSig0, align 4, !tbaa !1
  %58 = load i32, i32* %zSig1, align 4, !tbaa !1
  call void @shift64ExtraRightJamming(i32 %57, i32 %58, i32 0, i32 10, i32* nonnull %zSig0, i32* nonnull %zSig1, i32* nonnull %zSig2)
  %59 = load i32, i32* %zSig0, align 4, !tbaa !1
  %60 = load i32, i32* %zSig1, align 4, !tbaa !1
  %61 = load i32, i32* %zSig2, align 4, !tbaa !1
  %call71 = tail call fastcc i64 @roundAndPackFloat64(i32 0, i32 %add, i32 %59, i32 %60, i32 %61)
  %retval.sroa.0.0.extract.trunc116 = trunc i64 %call71 to i32
  %retval.sroa.7.0.extract.shift119 = lshr i64 %call71, 32
  %retval.sroa.7.0.extract.trunc120 = trunc i64 %retval.sroa.7.0.extract.shift119 to i32
  br label %cleanup

cleanup:                                          ; preds = %if.then.23, %if.end, %if.end.70, %if.then.36, %invalid, %if.then.12
  %retval.sroa.0.0 = phi i32 [ %retval.sroa.0.0.extract.trunc, %if.then.12 ], [ 2147483647, %invalid ], [ %retval.sroa.0.0.extract.trunc115, %if.then.36 ], [ %retval.sroa.0.0.extract.trunc116, %if.end.70 ], [ %a.0, %if.end ], [ %a.0, %if.then.23 ]
  %retval.sroa.7.0 = phi i32 [ %retval.sroa.7.0.extract.trunc, %if.then.12 ], [ -1, %invalid ], [ %retval.sroa.7.0.extract.trunc118, %if.then.36 ], [ %retval.sroa.7.0.extract.trunc120, %if.end.70 ], [ %a.1, %if.end ], [ %a.1, %if.then.23 ]
  call void @llvm.lifetime.end(i64 4, i8* %13) #1
  call void @llvm.lifetime.end(i64 4, i8* %12) #1
  call void @llvm.lifetime.end(i64 4, i8* %11) #1
  call void @llvm.lifetime.end(i64 4, i8* %10) #1
  call void @llvm.lifetime.end(i64 4, i8* %9) #1
  call void @llvm.lifetime.end(i64 4, i8* %8) #1
  call void @llvm.lifetime.end(i64 4, i8* %7) #1
  call void @llvm.lifetime.end(i64 4, i8* %6) #1
  call void @llvm.lifetime.end(i64 4, i8* %5) #1
  call void @llvm.lifetime.end(i64 4, i8* %4) #1
  call void @llvm.lifetime.end(i64 4, i8* %3) #1
  call void @llvm.lifetime.end(i64 4, i8* %2) #1
  call void @llvm.lifetime.end(i64 4, i8* %1) #1
  call void @llvm.lifetime.end(i64 4, i8* %0) #1
  %retval.sroa.7.0.insert.ext = zext i32 %retval.sroa.7.0 to i64
  %retval.sroa.7.0.insert.shift = shl nuw i64 %retval.sroa.7.0.insert.ext, 32
  %retval.sroa.0.0.insert.ext = zext i32 %retval.sroa.0.0 to i64
  %retval.sroa.0.0.insert.insert = or i64 %retval.sroa.7.0.insert.shift, %retval.sroa.0.0.insert.ext
  ret i64 %retval.sroa.0.0.insert.insert
}

; Function Attrs: nounwind
define i32 @float64_eq(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #3 {
entry:
  %call = tail call i32 @extractFloat64Exp(i32 %a.0, i32 undef)
  %cmp = icmp eq i32 %call, 2047
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %call8 = tail call i32 @extractFloat64Frac0(i32 %a.0, i32 undef)
  %call11 = tail call i32 @extractFloat64Frac1(i32 undef, i32 %a.1)
  %or = or i32 %call11, %call8
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %call14 = tail call i32 @extractFloat64Exp(i32 %b.0, i32 undef)
  %cmp15 = icmp eq i32 %call14, 2047
  br i1 %cmp15, label %land.lhs.true.16, label %if.end.35

land.lhs.true.16:                                 ; preds = %lor.lhs.false
  %call19 = tail call i32 @extractFloat64Frac0(i32 %b.0, i32 undef)
  %call22 = tail call i32 @extractFloat64Frac1(i32 undef, i32 %b.1)
  %or23 = or i32 %call22, %call19
  %tobool24 = icmp eq i32 %or23, 0
  br i1 %tobool24, label %if.end.35, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.16
  %call27 = tail call i32 @float64_is_signaling_nan(i32 %a.0, i32 %a.1)
  %tobool28 = icmp eq i32 %call27, 0
  br i1 %tobool28, label %lor.lhs.false.29, label %if.then.34

lor.lhs.false.29:                                 ; preds = %if.then
  %call32 = tail call i32 @float64_is_signaling_nan(i32 %b.0, i32 %b.1)
  %tobool33 = icmp eq i32 %call32, 0
  br i1 %tobool33, label %return, label %if.then.34

if.then.34:                                       ; preds = %lor.lhs.false.29, %if.then
  tail call void @float_raise(i32 16)
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
  %0 = phi i1 [ false, %if.end.35 ], [ true, %land.rhs ], [ false, %lor.rhs ], [ %cmp48, %land.rhs.44 ]
  %land.ext = zext i1 %0 to i32
  br label %return

return:                                           ; preds = %if.then.34, %lor.lhs.false.29, %land.end.49
  %retval.0 = phi i32 [ %land.ext, %land.end.49 ], [ 0, %lor.lhs.false.29 ], [ 0, %if.then.34 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float64_le(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #3 {
entry:
  %call = tail call i32 @extractFloat64Exp(i32 %a.0, i32 undef)
  %cmp = icmp eq i32 %call, 2047
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %call8 = tail call i32 @extractFloat64Frac0(i32 %a.0, i32 undef)
  %call11 = tail call i32 @extractFloat64Frac1(i32 undef, i32 %a.1)
  %or = or i32 %call11, %call8
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %call14 = tail call i32 @extractFloat64Exp(i32 %b.0, i32 undef)
  %cmp15 = icmp eq i32 %call14, 2047
  br i1 %cmp15, label %land.lhs.true.16, label %if.end

land.lhs.true.16:                                 ; preds = %lor.lhs.false
  %call19 = tail call i32 @extractFloat64Frac0(i32 %b.0, i32 undef)
  %call22 = tail call i32 @extractFloat64Frac1(i32 undef, i32 %b.1)
  %or23 = or i32 %call22, %call19
  %tobool24 = icmp eq i32 %or23, 0
  br i1 %tobool24, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.16
  tail call void @float_raise(i32 16)
  br label %cleanup

if.end:                                           ; preds = %land.lhs.true.16, %lor.lhs.false
  %call27 = tail call i32 @extractFloat64Sign(i32 %a.0, i32 undef)
  %call30 = tail call i32 @extractFloat64Sign(i32 %b.0, i32 undef)
  %cmp31 = icmp eq i32 %call27, %call30
  %tobool33 = icmp ne i32 %call27, 0
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
  %0 = phi i1 [ true, %if.then.32 ], [ %cmp41, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  br label %cleanup

if.end.42:                                        ; preds = %if.end
  br i1 %tobool33, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end.42
  %call48 = tail call i32 @le64(i32 %b.0, i32 %b.1, i32 %a.0, i32 %a.1)
  br label %cleanup

cond.false:                                       ; preds = %if.end.42
  %call53 = tail call i32 @le64(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1)
  br label %cleanup

cleanup:                                          ; preds = %cond.true, %cond.false, %lor.end, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ %lor.ext, %lor.end ], [ %call48, %cond.true ], [ %call53, %cond.false ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float64_lt(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #3 {
entry:
  %call = tail call i32 @extractFloat64Exp(i32 %a.0, i32 undef)
  %cmp = icmp eq i32 %call, 2047
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %call8 = tail call i32 @extractFloat64Frac0(i32 %a.0, i32 undef)
  %call11 = tail call i32 @extractFloat64Frac1(i32 undef, i32 %a.1)
  %or = or i32 %call11, %call8
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %call14 = tail call i32 @extractFloat64Exp(i32 %b.0, i32 undef)
  %cmp15 = icmp eq i32 %call14, 2047
  br i1 %cmp15, label %land.lhs.true.16, label %if.end

land.lhs.true.16:                                 ; preds = %lor.lhs.false
  %call19 = tail call i32 @extractFloat64Frac0(i32 %b.0, i32 undef)
  %call22 = tail call i32 @extractFloat64Frac1(i32 undef, i32 %b.1)
  %or23 = or i32 %call22, %call19
  %tobool24 = icmp eq i32 %or23, 0
  br i1 %tobool24, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.16
  tail call void @float_raise(i32 16)
  br label %cleanup

if.end:                                           ; preds = %land.lhs.true.16, %lor.lhs.false
  %call27 = tail call i32 @extractFloat64Sign(i32 %a.0, i32 undef)
  %call30 = tail call i32 @extractFloat64Sign(i32 %b.0, i32 undef)
  %cmp31 = icmp eq i32 %call27, %call30
  %tobool33 = icmp ne i32 %call27, 0
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
  %0 = phi i1 [ false, %if.then.32 ], [ %cmp41, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  br label %cleanup

if.end.42:                                        ; preds = %if.end
  br i1 %tobool33, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end.42
  %call48 = tail call i32 @lt64(i32 %b.0, i32 %b.1, i32 %a.0, i32 %a.1)
  br label %cleanup

cond.false:                                       ; preds = %if.end.42
  %call53 = tail call i32 @lt64(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1)
  br label %cleanup

cleanup:                                          ; preds = %cond.true, %cond.false, %land.end, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ %land.ext, %land.end ], [ %call48, %cond.true ], [ %call53, %cond.false ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float64_eq_signaling(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #3 {
entry:
  %call = tail call i32 @extractFloat64Exp(i32 %a.0, i32 undef)
  %cmp = icmp eq i32 %call, 2047
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %call8 = tail call i32 @extractFloat64Frac0(i32 %a.0, i32 undef)
  %call11 = tail call i32 @extractFloat64Frac1(i32 undef, i32 %a.1)
  %or = or i32 %call11, %call8
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %call14 = tail call i32 @extractFloat64Exp(i32 %b.0, i32 undef)
  %cmp15 = icmp eq i32 %call14, 2047
  br i1 %cmp15, label %land.lhs.true.16, label %if.end

land.lhs.true.16:                                 ; preds = %lor.lhs.false
  %call19 = tail call i32 @extractFloat64Frac0(i32 %b.0, i32 undef)
  %call22 = tail call i32 @extractFloat64Frac1(i32 undef, i32 %b.1)
  %or23 = or i32 %call22, %call19
  %tobool24 = icmp eq i32 %or23, 0
  br i1 %tobool24, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.16
  tail call void @float_raise(i32 16)
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
  %0 = phi i1 [ false, %if.end ], [ true, %land.rhs ], [ false, %lor.rhs ], [ %cmp37, %land.rhs.33 ]
  %land.ext = zext i1 %0 to i32
  br label %return

return:                                           ; preds = %land.end.38, %if.then
  %retval.0 = phi i32 [ 0, %if.then ], [ %land.ext, %land.end.38 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float64_le_quiet(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #3 {
entry:
  %call = tail call i32 @extractFloat64Exp(i32 %a.0, i32 undef)
  %cmp = icmp eq i32 %call, 2047
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %call8 = tail call i32 @extractFloat64Frac0(i32 %a.0, i32 undef)
  %call11 = tail call i32 @extractFloat64Frac1(i32 undef, i32 %a.1)
  %or = or i32 %call11, %call8
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %call14 = tail call i32 @extractFloat64Exp(i32 %b.0, i32 undef)
  %cmp15 = icmp eq i32 %call14, 2047
  br i1 %cmp15, label %land.lhs.true.16, label %if.end.35

land.lhs.true.16:                                 ; preds = %lor.lhs.false
  %call19 = tail call i32 @extractFloat64Frac0(i32 %b.0, i32 undef)
  %call22 = tail call i32 @extractFloat64Frac1(i32 undef, i32 %b.1)
  %or23 = or i32 %call22, %call19
  %tobool24 = icmp eq i32 %or23, 0
  br i1 %tobool24, label %if.end.35, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.16
  %call27 = tail call i32 @float64_is_signaling_nan(i32 %a.0, i32 %a.1)
  %tobool28 = icmp eq i32 %call27, 0
  br i1 %tobool28, label %lor.lhs.false.29, label %if.then.34

lor.lhs.false.29:                                 ; preds = %if.then
  %call32 = tail call i32 @float64_is_signaling_nan(i32 %b.0, i32 %b.1)
  %tobool33 = icmp eq i32 %call32, 0
  br i1 %tobool33, label %cleanup, label %if.then.34

if.then.34:                                       ; preds = %lor.lhs.false.29, %if.then
  tail call void @float_raise(i32 16)
  br label %cleanup

if.end.35:                                        ; preds = %land.lhs.true.16, %lor.lhs.false
  %call38 = tail call i32 @extractFloat64Sign(i32 %a.0, i32 undef)
  %call41 = tail call i32 @extractFloat64Sign(i32 %b.0, i32 undef)
  %cmp42 = icmp eq i32 %call38, %call41
  %tobool44 = icmp ne i32 %call38, 0
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
  %0 = phi i1 [ true, %if.then.43 ], [ %cmp52, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  br label %cleanup

if.end.53:                                        ; preds = %if.end.35
  br i1 %tobool44, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end.53
  %call59 = tail call i32 @le64(i32 %b.0, i32 %b.1, i32 %a.0, i32 %a.1)
  br label %cleanup

cond.false:                                       ; preds = %if.end.53
  %call64 = tail call i32 @le64(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1)
  br label %cleanup

cleanup:                                          ; preds = %cond.true, %cond.false, %if.then.34, %lor.lhs.false.29, %lor.end
  %retval.0 = phi i32 [ %lor.ext, %lor.end ], [ 0, %lor.lhs.false.29 ], [ 0, %if.then.34 ], [ %call59, %cond.true ], [ %call64, %cond.false ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @float64_lt_quiet(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #3 {
entry:
  %call = tail call i32 @extractFloat64Exp(i32 %a.0, i32 undef)
  %cmp = icmp eq i32 %call, 2047
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %call8 = tail call i32 @extractFloat64Frac0(i32 %a.0, i32 undef)
  %call11 = tail call i32 @extractFloat64Frac1(i32 undef, i32 %a.1)
  %or = or i32 %call11, %call8
  %tobool = icmp eq i32 %or, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %call14 = tail call i32 @extractFloat64Exp(i32 %b.0, i32 undef)
  %cmp15 = icmp eq i32 %call14, 2047
  br i1 %cmp15, label %land.lhs.true.16, label %if.end.35

land.lhs.true.16:                                 ; preds = %lor.lhs.false
  %call19 = tail call i32 @extractFloat64Frac0(i32 %b.0, i32 undef)
  %call22 = tail call i32 @extractFloat64Frac1(i32 undef, i32 %b.1)
  %or23 = or i32 %call22, %call19
  %tobool24 = icmp eq i32 %or23, 0
  br i1 %tobool24, label %if.end.35, label %if.then

if.then:                                          ; preds = %land.lhs.true, %land.lhs.true.16
  %call27 = tail call i32 @float64_is_signaling_nan(i32 %a.0, i32 %a.1)
  %tobool28 = icmp eq i32 %call27, 0
  br i1 %tobool28, label %lor.lhs.false.29, label %if.then.34

lor.lhs.false.29:                                 ; preds = %if.then
  %call32 = tail call i32 @float64_is_signaling_nan(i32 %b.0, i32 %b.1)
  %tobool33 = icmp eq i32 %call32, 0
  br i1 %tobool33, label %cleanup, label %if.then.34

if.then.34:                                       ; preds = %lor.lhs.false.29, %if.then
  tail call void @float_raise(i32 16)
  br label %cleanup

if.end.35:                                        ; preds = %land.lhs.true.16, %lor.lhs.false
  %call38 = tail call i32 @extractFloat64Sign(i32 %a.0, i32 undef)
  %call41 = tail call i32 @extractFloat64Sign(i32 %b.0, i32 undef)
  %cmp42 = icmp eq i32 %call38, %call41
  %tobool44 = icmp ne i32 %call38, 0
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
  %0 = phi i1 [ false, %if.then.43 ], [ %cmp52, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  br label %cleanup

if.end.53:                                        ; preds = %if.end.35
  br i1 %tobool44, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end.53
  %call59 = tail call i32 @lt64(i32 %b.0, i32 %b.1, i32 %a.0, i32 %a.1)
  br label %cleanup

cond.false:                                       ; preds = %if.end.53
  %call64 = tail call i32 @lt64(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1)
  br label %cleanup

cleanup:                                          ; preds = %cond.true, %cond.false, %if.then.34, %lor.lhs.false.29, %land.end
  %retval.0 = phi i32 [ %land.ext, %land.end ], [ 0, %lor.lhs.false.29 ], [ 0, %if.then.34 ], [ %call59, %cond.true ], [ %call64, %cond.false ]
  ret i32 %retval.0
}

attributes #0 = { inlinehint nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { inlinehint nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.1 (tags/RELEASE_371/final)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !2, i64 0}
!6 = !{!"", !2, i64 0, !2, i64 4, !2, i64 8}
!7 = !{!6, !2, i64 4}
!8 = !{!6, !2, i64 8}
!9 = !{!10, !2, i64 0}
!10 = !{!"", !2, i64 0, !2, i64 4}
!11 = !{!12, !12, i64 0}
!12 = !{!"short", !3, i64 0}
!13 = !{i64 0, i64 4, !1, i64 4, i64 4, !1, i64 8, i64 4, !1}
!14 = !{!10, !2, i64 4}
