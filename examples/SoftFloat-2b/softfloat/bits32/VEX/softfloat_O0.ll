; ModuleID = 'softfloat.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

%struct.float64 = type { i32, i32 }
%struct.commonNaNT = type { i32, i32, i32 }

@float_rounding_mode = global i32 0, align 4
@float_exception_flags = global i32 0, align 4
@float_detect_tininess = global i32 1, align 4
@countLeadingZeros32.countLeadingZerosHigh = internal constant [256 x i32] [i32 8, i32 7, i32 6, i32 6, i32 5, i32 5, i32 5, i32 5, i32 4, i32 4, i32 4, i32 4, i32 4, i32 4, i32 4, i32 4, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 3, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], align 4
@estimateSqrt32.sqrtOddAdjustments = internal constant [16 x i16] [i16 4, i16 34, i16 93, i16 177, i16 285, i16 415, i16 566, i16 736, i16 924, i16 1128, i16 1349, i16 1585, i16 1835, i16 2098, i16 2374, i16 2663], align 2
@estimateSqrt32.sqrtEvenAdjustments = internal constant [16 x i16] [i16 2605, i16 2223, i16 1882, i16 1577, i16 1306, i16 1065, i16 854, i16 670, i16 512, i16 377, i16 265, i16 175, i16 104, i16 52, i16 18, i16 2], align 2

; Function Attrs: inlinehint nounwind
define void @shift32RightJamming(i32 %a, i32 %count, i32* %zPtr) #0 {
entry:
  %a.addr = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %zPtr.addr = alloca i32*, align 4
  %z = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32* %zPtr, i32** %zPtr.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %a.addr, align 4
  store i32 %1, i32* %z, align 4
  br label %if.end.7

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %count.addr, align 4
  %cmp1 = icmp slt i32 %2, 32
  br i1 %cmp1, label %if.then.2, label %if.else.4

if.then.2:                                        ; preds = %if.else
  %3 = load i32, i32* %a.addr, align 4
  %4 = load i32, i32* %count.addr, align 4
  %shr = lshr i32 %3, %4
  %5 = load i32, i32* %a.addr, align 4
  %6 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %6
  %and = and i32 %sub, 31
  %shl = shl i32 %5, %and
  %cmp3 = icmp ne i32 %shl, 0
  %conv = zext i1 %cmp3 to i32
  %or = or i32 %shr, %conv
  store i32 %or, i32* %z, align 4
  br label %if.end

if.else.4:                                        ; preds = %if.else
  %7 = load i32, i32* %a.addr, align 4
  %cmp5 = icmp ne i32 %7, 0
  %conv6 = zext i1 %cmp5 to i32
  store i32 %conv6, i32* %z, align 4
  br label %if.end

if.end:                                           ; preds = %if.else.4, %if.then.2
  br label %if.end.7

if.end.7:                                         ; preds = %if.end, %if.then
  %8 = load i32, i32* %z, align 4
  %9 = load i32*, i32** %zPtr.addr, align 4
  store i32 %8, i32* %9, align 4
  ret void
}

; Function Attrs: inlinehint nounwind
define void @shift64Right(i32 %a0, i32 %a1, i32 %count, i32* %z0Ptr, i32* %z1Ptr) #0 {
entry:
  %a0.addr = alloca i32, align 4
  %a1.addr = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %z0Ptr.addr = alloca i32*, align 4
  %z1Ptr.addr = alloca i32*, align 4
  %z0 = alloca i32, align 4
  %z1 = alloca i32, align 4
  %negCount = alloca i32, align 4
  store i32 %a0, i32* %a0.addr, align 4
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32* %z0Ptr, i32** %z0Ptr.addr, align 4
  store i32* %z1Ptr, i32** %z1Ptr.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %0
  %and = and i32 %sub, 31
  store i32 %and, i32* %negCount, align 4
  %1 = load i32, i32* %count.addr, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %a1.addr, align 4
  store i32 %2, i32* %z1, align 4
  %3 = load i32, i32* %a0.addr, align 4
  store i32 %3, i32* %z0, align 4
  br label %if.end.8

if.else:                                          ; preds = %entry
  %4 = load i32, i32* %count.addr, align 4
  %cmp1 = icmp slt i32 %4, 32
  br i1 %cmp1, label %if.then.2, label %if.else.4

if.then.2:                                        ; preds = %if.else
  %5 = load i32, i32* %a0.addr, align 4
  %6 = load i32, i32* %negCount, align 4
  %shl = shl i32 %5, %6
  %7 = load i32, i32* %a1.addr, align 4
  %8 = load i32, i32* %count.addr, align 4
  %shr = lshr i32 %7, %8
  %or = or i32 %shl, %shr
  store i32 %or, i32* %z1, align 4
  %9 = load i32, i32* %a0.addr, align 4
  %10 = load i32, i32* %count.addr, align 4
  %shr3 = lshr i32 %9, %10
  store i32 %shr3, i32* %z0, align 4
  br label %if.end

if.else.4:                                        ; preds = %if.else
  %11 = load i32, i32* %count.addr, align 4
  %cmp5 = icmp slt i32 %11, 64
  br i1 %cmp5, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.else.4
  %12 = load i32, i32* %a0.addr, align 4
  %13 = load i32, i32* %count.addr, align 4
  %and6 = and i32 %13, 31
  %shr7 = lshr i32 %12, %and6
  br label %cond.end

cond.false:                                       ; preds = %if.else.4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %shr7, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, i32* %z1, align 4
  store i32 0, i32* %z0, align 4
  br label %if.end

if.end:                                           ; preds = %cond.end, %if.then.2
  br label %if.end.8

if.end.8:                                         ; preds = %if.end, %if.then
  %14 = load i32, i32* %z1, align 4
  %15 = load i32*, i32** %z1Ptr.addr, align 4
  store i32 %14, i32* %15, align 4
  %16 = load i32, i32* %z0, align 4
  %17 = load i32*, i32** %z0Ptr.addr, align 4
  store i32 %16, i32* %17, align 4
  ret void
}

; Function Attrs: inlinehint nounwind
define void @shift64RightJamming(i32 %a0, i32 %a1, i32 %count, i32* %z0Ptr, i32* %z1Ptr) #0 {
entry:
  %a0.addr = alloca i32, align 4
  %a1.addr = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %z0Ptr.addr = alloca i32*, align 4
  %z1Ptr.addr = alloca i32*, align 4
  %z0 = alloca i32, align 4
  %z1 = alloca i32, align 4
  %negCount = alloca i32, align 4
  store i32 %a0, i32* %a0.addr, align 4
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32* %z0Ptr, i32** %z0Ptr.addr, align 4
  store i32* %z1Ptr, i32** %z1Ptr.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %0
  %and = and i32 %sub, 31
  store i32 %and, i32* %negCount, align 4
  %1 = load i32, i32* %count.addr, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %a1.addr, align 4
  store i32 %2, i32* %z1, align 4
  %3 = load i32, i32* %a0.addr, align 4
  store i32 %3, i32* %z0, align 4
  br label %if.end.31

if.else:                                          ; preds = %entry
  %4 = load i32, i32* %count.addr, align 4
  %cmp1 = icmp slt i32 %4, 32
  br i1 %cmp1, label %if.then.2, label %if.else.7

if.then.2:                                        ; preds = %if.else
  %5 = load i32, i32* %a0.addr, align 4
  %6 = load i32, i32* %negCount, align 4
  %shl = shl i32 %5, %6
  %7 = load i32, i32* %a1.addr, align 4
  %8 = load i32, i32* %count.addr, align 4
  %shr = lshr i32 %7, %8
  %or = or i32 %shl, %shr
  %9 = load i32, i32* %a1.addr, align 4
  %10 = load i32, i32* %negCount, align 4
  %shl3 = shl i32 %9, %10
  %cmp4 = icmp ne i32 %shl3, 0
  %conv = zext i1 %cmp4 to i32
  %or5 = or i32 %or, %conv
  store i32 %or5, i32* %z1, align 4
  %11 = load i32, i32* %a0.addr, align 4
  %12 = load i32, i32* %count.addr, align 4
  %shr6 = lshr i32 %11, %12
  store i32 %shr6, i32* %z0, align 4
  br label %if.end.30

if.else.7:                                        ; preds = %if.else
  %13 = load i32, i32* %count.addr, align 4
  %cmp8 = icmp eq i32 %13, 32
  br i1 %cmp8, label %if.then.10, label %if.else.14

if.then.10:                                       ; preds = %if.else.7
  %14 = load i32, i32* %a0.addr, align 4
  %15 = load i32, i32* %a1.addr, align 4
  %cmp11 = icmp ne i32 %15, 0
  %conv12 = zext i1 %cmp11 to i32
  %or13 = or i32 %14, %conv12
  store i32 %or13, i32* %z1, align 4
  br label %if.end.29

if.else.14:                                       ; preds = %if.else.7
  %16 = load i32, i32* %count.addr, align 4
  %cmp15 = icmp slt i32 %16, 64
  br i1 %cmp15, label %if.then.17, label %if.else.25

if.then.17:                                       ; preds = %if.else.14
  %17 = load i32, i32* %a0.addr, align 4
  %18 = load i32, i32* %count.addr, align 4
  %and18 = and i32 %18, 31
  %shr19 = lshr i32 %17, %and18
  %19 = load i32, i32* %a0.addr, align 4
  %20 = load i32, i32* %negCount, align 4
  %shl20 = shl i32 %19, %20
  %21 = load i32, i32* %a1.addr, align 4
  %or21 = or i32 %shl20, %21
  %cmp22 = icmp ne i32 %or21, 0
  %conv23 = zext i1 %cmp22 to i32
  %or24 = or i32 %shr19, %conv23
  store i32 %or24, i32* %z1, align 4
  br label %if.end

if.else.25:                                       ; preds = %if.else.14
  %22 = load i32, i32* %a0.addr, align 4
  %23 = load i32, i32* %a1.addr, align 4
  %or26 = or i32 %22, %23
  %cmp27 = icmp ne i32 %or26, 0
  %conv28 = zext i1 %cmp27 to i32
  store i32 %conv28, i32* %z1, align 4
  br label %if.end

if.end:                                           ; preds = %if.else.25, %if.then.17
  br label %if.end.29

if.end.29:                                        ; preds = %if.end, %if.then.10
  store i32 0, i32* %z0, align 4
  br label %if.end.30

if.end.30:                                        ; preds = %if.end.29, %if.then.2
  br label %if.end.31

if.end.31:                                        ; preds = %if.end.30, %if.then
  %24 = load i32, i32* %z1, align 4
  %25 = load i32*, i32** %z1Ptr.addr, align 4
  store i32 %24, i32* %25, align 4
  %26 = load i32, i32* %z0, align 4
  %27 = load i32*, i32** %z0Ptr.addr, align 4
  store i32 %26, i32* %27, align 4
  ret void
}

; Function Attrs: inlinehint nounwind
define void @shift64ExtraRightJamming(i32 %a0, i32 %a1, i32 %a2, i32 %count, i32* %z0Ptr, i32* %z1Ptr, i32* %z2Ptr) #0 {
entry:
  %a0.addr = alloca i32, align 4
  %a1.addr = alloca i32, align 4
  %a2.addr = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %z0Ptr.addr = alloca i32*, align 4
  %z1Ptr.addr = alloca i32*, align 4
  %z2Ptr.addr = alloca i32*, align 4
  %z0 = alloca i32, align 4
  %z1 = alloca i32, align 4
  %z2 = alloca i32, align 4
  %negCount = alloca i32, align 4
  store i32 %a0, i32* %a0.addr, align 4
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %a2, i32* %a2.addr, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32* %z0Ptr, i32** %z0Ptr.addr, align 4
  store i32* %z1Ptr, i32** %z1Ptr.addr, align 4
  store i32* %z2Ptr, i32** %z2Ptr.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %0
  %and = and i32 %sub, 31
  store i32 %and, i32* %negCount, align 4
  %1 = load i32, i32* %count.addr, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %a2.addr, align 4
  store i32 %2, i32* %z2, align 4
  %3 = load i32, i32* %a1.addr, align 4
  store i32 %3, i32* %z1, align 4
  %4 = load i32, i32* %a0.addr, align 4
  store i32 %4, i32* %z0, align 4
  br label %if.end.23

if.else:                                          ; preds = %entry
  %5 = load i32, i32* %count.addr, align 4
  %cmp1 = icmp slt i32 %5, 32
  br i1 %cmp1, label %if.then.2, label %if.else.5

if.then.2:                                        ; preds = %if.else
  %6 = load i32, i32* %a1.addr, align 4
  %7 = load i32, i32* %negCount, align 4
  %shl = shl i32 %6, %7
  store i32 %shl, i32* %z2, align 4
  %8 = load i32, i32* %a0.addr, align 4
  %9 = load i32, i32* %negCount, align 4
  %shl3 = shl i32 %8, %9
  %10 = load i32, i32* %a1.addr, align 4
  %11 = load i32, i32* %count.addr, align 4
  %shr = lshr i32 %10, %11
  %or = or i32 %shl3, %shr
  store i32 %or, i32* %z1, align 4
  %12 = load i32, i32* %a0.addr, align 4
  %13 = load i32, i32* %count.addr, align 4
  %shr4 = lshr i32 %12, %13
  store i32 %shr4, i32* %z0, align 4
  br label %if.end.19

if.else.5:                                        ; preds = %if.else
  %14 = load i32, i32* %count.addr, align 4
  %cmp6 = icmp eq i32 %14, 32
  br i1 %cmp6, label %if.then.7, label %if.else.8

if.then.7:                                        ; preds = %if.else.5
  %15 = load i32, i32* %a1.addr, align 4
  store i32 %15, i32* %z2, align 4
  %16 = load i32, i32* %a0.addr, align 4
  store i32 %16, i32* %z1, align 4
  br label %if.end.18

if.else.8:                                        ; preds = %if.else.5
  %17 = load i32, i32* %a1.addr, align 4
  %18 = load i32, i32* %a2.addr, align 4
  %or9 = or i32 %18, %17
  store i32 %or9, i32* %a2.addr, align 4
  %19 = load i32, i32* %count.addr, align 4
  %cmp10 = icmp slt i32 %19, 64
  br i1 %cmp10, label %if.then.11, label %if.else.15

if.then.11:                                       ; preds = %if.else.8
  %20 = load i32, i32* %a0.addr, align 4
  %21 = load i32, i32* %negCount, align 4
  %shl12 = shl i32 %20, %21
  store i32 %shl12, i32* %z2, align 4
  %22 = load i32, i32* %a0.addr, align 4
  %23 = load i32, i32* %count.addr, align 4
  %and13 = and i32 %23, 31
  %shr14 = lshr i32 %22, %and13
  store i32 %shr14, i32* %z1, align 4
  br label %if.end

if.else.15:                                       ; preds = %if.else.8
  %24 = load i32, i32* %count.addr, align 4
  %cmp16 = icmp eq i32 %24, 64
  br i1 %cmp16, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.else.15
  %25 = load i32, i32* %a0.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.else.15
  %26 = load i32, i32* %a0.addr, align 4
  %cmp17 = icmp ne i32 %26, 0
  %conv = zext i1 %cmp17 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %25, %cond.true ], [ %conv, %cond.false ]
  store i32 %cond, i32* %z2, align 4
  store i32 0, i32* %z1, align 4
  br label %if.end

if.end:                                           ; preds = %cond.end, %if.then.11
  br label %if.end.18

if.end.18:                                        ; preds = %if.end, %if.then.7
  store i32 0, i32* %z0, align 4
  br label %if.end.19

if.end.19:                                        ; preds = %if.end.18, %if.then.2
  %27 = load i32, i32* %a2.addr, align 4
  %cmp20 = icmp ne i32 %27, 0
  %conv21 = zext i1 %cmp20 to i32
  %28 = load i32, i32* %z2, align 4
  %or22 = or i32 %28, %conv21
  store i32 %or22, i32* %z2, align 4
  br label %if.end.23

if.end.23:                                        ; preds = %if.end.19, %if.then
  %29 = load i32, i32* %z2, align 4
  %30 = load i32*, i32** %z2Ptr.addr, align 4
  store i32 %29, i32* %30, align 4
  %31 = load i32, i32* %z1, align 4
  %32 = load i32*, i32** %z1Ptr.addr, align 4
  store i32 %31, i32* %32, align 4
  %33 = load i32, i32* %z0, align 4
  %34 = load i32*, i32** %z0Ptr.addr, align 4
  store i32 %33, i32* %34, align 4
  ret void
}

; Function Attrs: inlinehint nounwind
define void @shortShift64Left(i32 %a0, i32 %a1, i32 %count, i32* %z0Ptr, i32* %z1Ptr) #0 {
entry:
  %a0.addr = alloca i32, align 4
  %a1.addr = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %z0Ptr.addr = alloca i32*, align 4
  %z1Ptr.addr = alloca i32*, align 4
  store i32 %a0, i32* %a0.addr, align 4
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32* %z0Ptr, i32** %z0Ptr.addr, align 4
  store i32* %z1Ptr, i32** %z1Ptr.addr, align 4
  %0 = load i32, i32* %a1.addr, align 4
  %1 = load i32, i32* %count.addr, align 4
  %shl = shl i32 %0, %1
  %2 = load i32*, i32** %z1Ptr.addr, align 4
  store i32 %shl, i32* %2, align 4
  %3 = load i32, i32* %count.addr, align 4
  %cmp = icmp eq i32 %3, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %4 = load i32, i32* %a0.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %5 = load i32, i32* %a0.addr, align 4
  %6 = load i32, i32* %count.addr, align 4
  %shl1 = shl i32 %5, %6
  %7 = load i32, i32* %a1.addr, align 4
  %8 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %8
  %and = and i32 %sub, 31
  %shr = lshr i32 %7, %and
  %or = or i32 %shl1, %shr
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %4, %cond.true ], [ %or, %cond.false ]
  %9 = load i32*, i32** %z0Ptr.addr, align 4
  store i32 %cond, i32* %9, align 4
  ret void
}

; Function Attrs: inlinehint nounwind
define void @shortShift96Left(i32 %a0, i32 %a1, i32 %a2, i32 %count, i32* %z0Ptr, i32* %z1Ptr, i32* %z2Ptr) #0 {
entry:
  %a0.addr = alloca i32, align 4
  %a1.addr = alloca i32, align 4
  %a2.addr = alloca i32, align 4
  %count.addr = alloca i32, align 4
  %z0Ptr.addr = alloca i32*, align 4
  %z1Ptr.addr = alloca i32*, align 4
  %z2Ptr.addr = alloca i32*, align 4
  %z0 = alloca i32, align 4
  %z1 = alloca i32, align 4
  %z2 = alloca i32, align 4
  %negCount = alloca i32, align 4
  store i32 %a0, i32* %a0.addr, align 4
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %a2, i32* %a2.addr, align 4
  store i32 %count, i32* %count.addr, align 4
  store i32* %z0Ptr, i32** %z0Ptr.addr, align 4
  store i32* %z1Ptr, i32** %z1Ptr.addr, align 4
  store i32* %z2Ptr, i32** %z2Ptr.addr, align 4
  %0 = load i32, i32* %a2.addr, align 4
  %1 = load i32, i32* %count.addr, align 4
  %shl = shl i32 %0, %1
  store i32 %shl, i32* %z2, align 4
  %2 = load i32, i32* %a1.addr, align 4
  %3 = load i32, i32* %count.addr, align 4
  %shl1 = shl i32 %2, %3
  store i32 %shl1, i32* %z1, align 4
  %4 = load i32, i32* %a0.addr, align 4
  %5 = load i32, i32* %count.addr, align 4
  %shl2 = shl i32 %4, %5
  store i32 %shl2, i32* %z0, align 4
  %6 = load i32, i32* %count.addr, align 4
  %cmp = icmp slt i32 0, %6
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %7 = load i32, i32* %count.addr, align 4
  %sub = sub nsw i32 0, %7
  %and = and i32 %sub, 31
  store i32 %and, i32* %negCount, align 4
  %8 = load i32, i32* %a2.addr, align 4
  %9 = load i32, i32* %negCount, align 4
  %shr = lshr i32 %8, %9
  %10 = load i32, i32* %z1, align 4
  %or = or i32 %10, %shr
  store i32 %or, i32* %z1, align 4
  %11 = load i32, i32* %a1.addr, align 4
  %12 = load i32, i32* %negCount, align 4
  %shr3 = lshr i32 %11, %12
  %13 = load i32, i32* %z0, align 4
  %or4 = or i32 %13, %shr3
  store i32 %or4, i32* %z0, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %14 = load i32, i32* %z2, align 4
  %15 = load i32*, i32** %z2Ptr.addr, align 4
  store i32 %14, i32* %15, align 4
  %16 = load i32, i32* %z1, align 4
  %17 = load i32*, i32** %z1Ptr.addr, align 4
  store i32 %16, i32* %17, align 4
  %18 = load i32, i32* %z0, align 4
  %19 = load i32*, i32** %z0Ptr.addr, align 4
  store i32 %18, i32* %19, align 4
  ret void
}

; Function Attrs: inlinehint nounwind
define void @add64(i32 %a0, i32 %a1, i32 %b0, i32 %b1, i32* %z0Ptr, i32* %z1Ptr) #0 {
entry:
  %a0.addr = alloca i32, align 4
  %a1.addr = alloca i32, align 4
  %b0.addr = alloca i32, align 4
  %b1.addr = alloca i32, align 4
  %z0Ptr.addr = alloca i32*, align 4
  %z1Ptr.addr = alloca i32*, align 4
  %z1 = alloca i32, align 4
  store i32 %a0, i32* %a0.addr, align 4
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %b0, i32* %b0.addr, align 4
  store i32 %b1, i32* %b1.addr, align 4
  store i32* %z0Ptr, i32** %z0Ptr.addr, align 4
  store i32* %z1Ptr, i32** %z1Ptr.addr, align 4
  %0 = load i32, i32* %a1.addr, align 4
  %1 = load i32, i32* %b1.addr, align 4
  %add = add i32 %0, %1
  store i32 %add, i32* %z1, align 4
  %2 = load i32, i32* %z1, align 4
  %3 = load i32*, i32** %z1Ptr.addr, align 4
  store i32 %2, i32* %3, align 4
  %4 = load i32, i32* %a0.addr, align 4
  %5 = load i32, i32* %b0.addr, align 4
  %add1 = add i32 %4, %5
  %6 = load i32, i32* %z1, align 4
  %7 = load i32, i32* %a1.addr, align 4
  %cmp = icmp ult i32 %6, %7
  %conv = zext i1 %cmp to i32
  %add2 = add i32 %add1, %conv
  %8 = load i32*, i32** %z0Ptr.addr, align 4
  store i32 %add2, i32* %8, align 4
  ret void
}

; Function Attrs: inlinehint nounwind
define void @add96(i32 %a0, i32 %a1, i32 %a2, i32 %b0, i32 %b1, i32 %b2, i32* %z0Ptr, i32* %z1Ptr, i32* %z2Ptr) #0 {
entry:
  %a0.addr = alloca i32, align 4
  %a1.addr = alloca i32, align 4
  %a2.addr = alloca i32, align 4
  %b0.addr = alloca i32, align 4
  %b1.addr = alloca i32, align 4
  %b2.addr = alloca i32, align 4
  %z0Ptr.addr = alloca i32*, align 4
  %z1Ptr.addr = alloca i32*, align 4
  %z2Ptr.addr = alloca i32*, align 4
  %z0 = alloca i32, align 4
  %z1 = alloca i32, align 4
  %z2 = alloca i32, align 4
  %carry0 = alloca i32, align 4
  %carry1 = alloca i32, align 4
  store i32 %a0, i32* %a0.addr, align 4
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %a2, i32* %a2.addr, align 4
  store i32 %b0, i32* %b0.addr, align 4
  store i32 %b1, i32* %b1.addr, align 4
  store i32 %b2, i32* %b2.addr, align 4
  store i32* %z0Ptr, i32** %z0Ptr.addr, align 4
  store i32* %z1Ptr, i32** %z1Ptr.addr, align 4
  store i32* %z2Ptr, i32** %z2Ptr.addr, align 4
  %0 = load i32, i32* %a2.addr, align 4
  %1 = load i32, i32* %b2.addr, align 4
  %add = add i32 %0, %1
  store i32 %add, i32* %z2, align 4
  %2 = load i32, i32* %z2, align 4
  %3 = load i32, i32* %a2.addr, align 4
  %cmp = icmp ult i32 %2, %3
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* %carry1, align 4
  %4 = load i32, i32* %a1.addr, align 4
  %5 = load i32, i32* %b1.addr, align 4
  %add1 = add i32 %4, %5
  store i32 %add1, i32* %z1, align 4
  %6 = load i32, i32* %z1, align 4
  %7 = load i32, i32* %a1.addr, align 4
  %cmp2 = icmp ult i32 %6, %7
  %conv3 = zext i1 %cmp2 to i32
  store i32 %conv3, i32* %carry0, align 4
  %8 = load i32, i32* %a0.addr, align 4
  %9 = load i32, i32* %b0.addr, align 4
  %add4 = add i32 %8, %9
  store i32 %add4, i32* %z0, align 4
  %10 = load i32, i32* %carry1, align 4
  %11 = load i32, i32* %z1, align 4
  %add5 = add i32 %11, %10
  store i32 %add5, i32* %z1, align 4
  %12 = load i32, i32* %z1, align 4
  %13 = load i32, i32* %carry1, align 4
  %cmp6 = icmp ult i32 %12, %13
  %conv7 = zext i1 %cmp6 to i32
  %14 = load i32, i32* %z0, align 4
  %add8 = add i32 %14, %conv7
  store i32 %add8, i32* %z0, align 4
  %15 = load i32, i32* %carry0, align 4
  %16 = load i32, i32* %z0, align 4
  %add9 = add i32 %16, %15
  store i32 %add9, i32* %z0, align 4
  %17 = load i32, i32* %z2, align 4
  %18 = load i32*, i32** %z2Ptr.addr, align 4
  store i32 %17, i32* %18, align 4
  %19 = load i32, i32* %z1, align 4
  %20 = load i32*, i32** %z1Ptr.addr, align 4
  store i32 %19, i32* %20, align 4
  %21 = load i32, i32* %z0, align 4
  %22 = load i32*, i32** %z0Ptr.addr, align 4
  store i32 %21, i32* %22, align 4
  ret void
}

; Function Attrs: inlinehint nounwind
define void @sub64(i32 %a0, i32 %a1, i32 %b0, i32 %b1, i32* %z0Ptr, i32* %z1Ptr) #0 {
entry:
  %a0.addr = alloca i32, align 4
  %a1.addr = alloca i32, align 4
  %b0.addr = alloca i32, align 4
  %b1.addr = alloca i32, align 4
  %z0Ptr.addr = alloca i32*, align 4
  %z1Ptr.addr = alloca i32*, align 4
  store i32 %a0, i32* %a0.addr, align 4
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %b0, i32* %b0.addr, align 4
  store i32 %b1, i32* %b1.addr, align 4
  store i32* %z0Ptr, i32** %z0Ptr.addr, align 4
  store i32* %z1Ptr, i32** %z1Ptr.addr, align 4
  %0 = load i32, i32* %a1.addr, align 4
  %1 = load i32, i32* %b1.addr, align 4
  %sub = sub i32 %0, %1
  %2 = load i32*, i32** %z1Ptr.addr, align 4
  store i32 %sub, i32* %2, align 4
  %3 = load i32, i32* %a0.addr, align 4
  %4 = load i32, i32* %b0.addr, align 4
  %sub1 = sub i32 %3, %4
  %5 = load i32, i32* %a1.addr, align 4
  %6 = load i32, i32* %b1.addr, align 4
  %cmp = icmp ult i32 %5, %6
  %conv = zext i1 %cmp to i32
  %sub2 = sub i32 %sub1, %conv
  %7 = load i32*, i32** %z0Ptr.addr, align 4
  store i32 %sub2, i32* %7, align 4
  ret void
}

; Function Attrs: inlinehint nounwind
define void @sub96(i32 %a0, i32 %a1, i32 %a2, i32 %b0, i32 %b1, i32 %b2, i32* %z0Ptr, i32* %z1Ptr, i32* %z2Ptr) #0 {
entry:
  %a0.addr = alloca i32, align 4
  %a1.addr = alloca i32, align 4
  %a2.addr = alloca i32, align 4
  %b0.addr = alloca i32, align 4
  %b1.addr = alloca i32, align 4
  %b2.addr = alloca i32, align 4
  %z0Ptr.addr = alloca i32*, align 4
  %z1Ptr.addr = alloca i32*, align 4
  %z2Ptr.addr = alloca i32*, align 4
  %z0 = alloca i32, align 4
  %z1 = alloca i32, align 4
  %z2 = alloca i32, align 4
  %borrow0 = alloca i32, align 4
  %borrow1 = alloca i32, align 4
  store i32 %a0, i32* %a0.addr, align 4
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %a2, i32* %a2.addr, align 4
  store i32 %b0, i32* %b0.addr, align 4
  store i32 %b1, i32* %b1.addr, align 4
  store i32 %b2, i32* %b2.addr, align 4
  store i32* %z0Ptr, i32** %z0Ptr.addr, align 4
  store i32* %z1Ptr, i32** %z1Ptr.addr, align 4
  store i32* %z2Ptr, i32** %z2Ptr.addr, align 4
  %0 = load i32, i32* %a2.addr, align 4
  %1 = load i32, i32* %b2.addr, align 4
  %sub = sub i32 %0, %1
  store i32 %sub, i32* %z2, align 4
  %2 = load i32, i32* %a2.addr, align 4
  %3 = load i32, i32* %b2.addr, align 4
  %cmp = icmp ult i32 %2, %3
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* %borrow1, align 4
  %4 = load i32, i32* %a1.addr, align 4
  %5 = load i32, i32* %b1.addr, align 4
  %sub1 = sub i32 %4, %5
  store i32 %sub1, i32* %z1, align 4
  %6 = load i32, i32* %a1.addr, align 4
  %7 = load i32, i32* %b1.addr, align 4
  %cmp2 = icmp ult i32 %6, %7
  %conv3 = zext i1 %cmp2 to i32
  store i32 %conv3, i32* %borrow0, align 4
  %8 = load i32, i32* %a0.addr, align 4
  %9 = load i32, i32* %b0.addr, align 4
  %sub4 = sub i32 %8, %9
  store i32 %sub4, i32* %z0, align 4
  %10 = load i32, i32* %z1, align 4
  %11 = load i32, i32* %borrow1, align 4
  %cmp5 = icmp ult i32 %10, %11
  %conv6 = zext i1 %cmp5 to i32
  %12 = load i32, i32* %z0, align 4
  %sub7 = sub i32 %12, %conv6
  store i32 %sub7, i32* %z0, align 4
  %13 = load i32, i32* %borrow1, align 4
  %14 = load i32, i32* %z1, align 4
  %sub8 = sub i32 %14, %13
  store i32 %sub8, i32* %z1, align 4
  %15 = load i32, i32* %borrow0, align 4
  %16 = load i32, i32* %z0, align 4
  %sub9 = sub i32 %16, %15
  store i32 %sub9, i32* %z0, align 4
  %17 = load i32, i32* %z2, align 4
  %18 = load i32*, i32** %z2Ptr.addr, align 4
  store i32 %17, i32* %18, align 4
  %19 = load i32, i32* %z1, align 4
  %20 = load i32*, i32** %z1Ptr.addr, align 4
  store i32 %19, i32* %20, align 4
  %21 = load i32, i32* %z0, align 4
  %22 = load i32*, i32** %z0Ptr.addr, align 4
  store i32 %21, i32* %22, align 4
  ret void
}

; Function Attrs: inlinehint nounwind
define void @mul32To64(i32 %a, i32 %b, i32* %z0Ptr, i32* %z1Ptr) #0 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %z0Ptr.addr = alloca i32*, align 4
  %z1Ptr.addr = alloca i32*, align 4
  %aHigh = alloca i16, align 2
  %aLow = alloca i16, align 2
  %bHigh = alloca i16, align 2
  %bLow = alloca i16, align 2
  %z0 = alloca i32, align 4
  %zMiddleA = alloca i32, align 4
  %zMiddleB = alloca i32, align 4
  %z1 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32* %z0Ptr, i32** %z0Ptr.addr, align 4
  store i32* %z1Ptr, i32** %z1Ptr.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %conv = trunc i32 %0 to i16
  store i16 %conv, i16* %aLow, align 2
  %1 = load i32, i32* %a.addr, align 4
  %shr = lshr i32 %1, 16
  %conv1 = trunc i32 %shr to i16
  store i16 %conv1, i16* %aHigh, align 2
  %2 = load i32, i32* %b.addr, align 4
  %conv2 = trunc i32 %2 to i16
  store i16 %conv2, i16* %bLow, align 2
  %3 = load i32, i32* %b.addr, align 4
  %shr3 = lshr i32 %3, 16
  %conv4 = trunc i32 %shr3 to i16
  store i16 %conv4, i16* %bHigh, align 2
  %4 = load i16, i16* %aLow, align 2
  %conv5 = zext i16 %4 to i32
  %5 = load i16, i16* %bLow, align 2
  %conv6 = zext i16 %5 to i32
  %mul = mul i32 %conv5, %conv6
  store i32 %mul, i32* %z1, align 4
  %6 = load i16, i16* %aLow, align 2
  %conv7 = zext i16 %6 to i32
  %7 = load i16, i16* %bHigh, align 2
  %conv8 = zext i16 %7 to i32
  %mul9 = mul i32 %conv7, %conv8
  store i32 %mul9, i32* %zMiddleA, align 4
  %8 = load i16, i16* %aHigh, align 2
  %conv10 = zext i16 %8 to i32
  %9 = load i16, i16* %bLow, align 2
  %conv11 = zext i16 %9 to i32
  %mul12 = mul i32 %conv10, %conv11
  store i32 %mul12, i32* %zMiddleB, align 4
  %10 = load i16, i16* %aHigh, align 2
  %conv13 = zext i16 %10 to i32
  %11 = load i16, i16* %bHigh, align 2
  %conv14 = zext i16 %11 to i32
  %mul15 = mul i32 %conv13, %conv14
  store i32 %mul15, i32* %z0, align 4
  %12 = load i32, i32* %zMiddleB, align 4
  %13 = load i32, i32* %zMiddleA, align 4
  %add = add i32 %13, %12
  store i32 %add, i32* %zMiddleA, align 4
  %14 = load i32, i32* %zMiddleA, align 4
  %15 = load i32, i32* %zMiddleB, align 4
  %cmp = icmp ult i32 %14, %15
  %conv16 = zext i1 %cmp to i32
  %shl = shl i32 %conv16, 16
  %16 = load i32, i32* %zMiddleA, align 4
  %shr17 = lshr i32 %16, 16
  %add18 = add i32 %shl, %shr17
  %17 = load i32, i32* %z0, align 4
  %add19 = add i32 %17, %add18
  store i32 %add19, i32* %z0, align 4
  %18 = load i32, i32* %zMiddleA, align 4
  %shl20 = shl i32 %18, 16
  store i32 %shl20, i32* %zMiddleA, align 4
  %19 = load i32, i32* %zMiddleA, align 4
  %20 = load i32, i32* %z1, align 4
  %add21 = add i32 %20, %19
  store i32 %add21, i32* %z1, align 4
  %21 = load i32, i32* %z1, align 4
  %22 = load i32, i32* %zMiddleA, align 4
  %cmp22 = icmp ult i32 %21, %22
  %conv23 = zext i1 %cmp22 to i32
  %23 = load i32, i32* %z0, align 4
  %add24 = add i32 %23, %conv23
  store i32 %add24, i32* %z0, align 4
  %24 = load i32, i32* %z1, align 4
  %25 = load i32*, i32** %z1Ptr.addr, align 4
  store i32 %24, i32* %25, align 4
  %26 = load i32, i32* %z0, align 4
  %27 = load i32*, i32** %z0Ptr.addr, align 4
  store i32 %26, i32* %27, align 4
  ret void
}

; Function Attrs: inlinehint nounwind
define void @mul64By32To96(i32 %a0, i32 %a1, i32 %b, i32* %z0Ptr, i32* %z1Ptr, i32* %z2Ptr) #0 {
entry:
  %a0.addr = alloca i32, align 4
  %a1.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %z0Ptr.addr = alloca i32*, align 4
  %z1Ptr.addr = alloca i32*, align 4
  %z2Ptr.addr = alloca i32*, align 4
  %z0 = alloca i32, align 4
  %z1 = alloca i32, align 4
  %z2 = alloca i32, align 4
  %more1 = alloca i32, align 4
  store i32 %a0, i32* %a0.addr, align 4
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32* %z0Ptr, i32** %z0Ptr.addr, align 4
  store i32* %z1Ptr, i32** %z1Ptr.addr, align 4
  store i32* %z2Ptr, i32** %z2Ptr.addr, align 4
  %0 = load i32, i32* %a1.addr, align 4
  %1 = load i32, i32* %b.addr, align 4
  call void @mul32To64(i32 %0, i32 %1, i32* %z1, i32* %z2)
  %2 = load i32, i32* %a0.addr, align 4
  %3 = load i32, i32* %b.addr, align 4
  call void @mul32To64(i32 %2, i32 %3, i32* %z0, i32* %more1)
  %4 = load i32, i32* %z0, align 4
  %5 = load i32, i32* %more1, align 4
  %6 = load i32, i32* %z1, align 4
  call void @add64(i32 %4, i32 %5, i32 0, i32 %6, i32* %z0, i32* %z1)
  %7 = load i32, i32* %z2, align 4
  %8 = load i32*, i32** %z2Ptr.addr, align 4
  store i32 %7, i32* %8, align 4
  %9 = load i32, i32* %z1, align 4
  %10 = load i32*, i32** %z1Ptr.addr, align 4
  store i32 %9, i32* %10, align 4
  %11 = load i32, i32* %z0, align 4
  %12 = load i32*, i32** %z0Ptr.addr, align 4
  store i32 %11, i32* %12, align 4
  ret void
}

; Function Attrs: inlinehint nounwind
define void @mul64To128(i32 %a0, i32 %a1, i32 %b0, i32 %b1, i32* %z0Ptr, i32* %z1Ptr, i32* %z2Ptr, i32* %z3Ptr) #0 {
entry:
  %a0.addr = alloca i32, align 4
  %a1.addr = alloca i32, align 4
  %b0.addr = alloca i32, align 4
  %b1.addr = alloca i32, align 4
  %z0Ptr.addr = alloca i32*, align 4
  %z1Ptr.addr = alloca i32*, align 4
  %z2Ptr.addr = alloca i32*, align 4
  %z3Ptr.addr = alloca i32*, align 4
  %z0 = alloca i32, align 4
  %z1 = alloca i32, align 4
  %z2 = alloca i32, align 4
  %z3 = alloca i32, align 4
  %more1 = alloca i32, align 4
  %more2 = alloca i32, align 4
  store i32 %a0, i32* %a0.addr, align 4
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %b0, i32* %b0.addr, align 4
  store i32 %b1, i32* %b1.addr, align 4
  store i32* %z0Ptr, i32** %z0Ptr.addr, align 4
  store i32* %z1Ptr, i32** %z1Ptr.addr, align 4
  store i32* %z2Ptr, i32** %z2Ptr.addr, align 4
  store i32* %z3Ptr, i32** %z3Ptr.addr, align 4
  %0 = load i32, i32* %a1.addr, align 4
  %1 = load i32, i32* %b1.addr, align 4
  call void @mul32To64(i32 %0, i32 %1, i32* %z2, i32* %z3)
  %2 = load i32, i32* %a1.addr, align 4
  %3 = load i32, i32* %b0.addr, align 4
  call void @mul32To64(i32 %2, i32 %3, i32* %z1, i32* %more2)
  %4 = load i32, i32* %z1, align 4
  %5 = load i32, i32* %more2, align 4
  %6 = load i32, i32* %z2, align 4
  call void @add64(i32 %4, i32 %5, i32 0, i32 %6, i32* %z1, i32* %z2)
  %7 = load i32, i32* %a0.addr, align 4
  %8 = load i32, i32* %b0.addr, align 4
  call void @mul32To64(i32 %7, i32 %8, i32* %z0, i32* %more1)
  %9 = load i32, i32* %z0, align 4
  %10 = load i32, i32* %more1, align 4
  %11 = load i32, i32* %z1, align 4
  call void @add64(i32 %9, i32 %10, i32 0, i32 %11, i32* %z0, i32* %z1)
  %12 = load i32, i32* %a0.addr, align 4
  %13 = load i32, i32* %b1.addr, align 4
  call void @mul32To64(i32 %12, i32 %13, i32* %more1, i32* %more2)
  %14 = load i32, i32* %more1, align 4
  %15 = load i32, i32* %more2, align 4
  %16 = load i32, i32* %z2, align 4
  call void @add64(i32 %14, i32 %15, i32 0, i32 %16, i32* %more1, i32* %z2)
  %17 = load i32, i32* %z0, align 4
  %18 = load i32, i32* %z1, align 4
  %19 = load i32, i32* %more1, align 4
  call void @add64(i32 %17, i32 %18, i32 0, i32 %19, i32* %z0, i32* %z1)
  %20 = load i32, i32* %z3, align 4
  %21 = load i32*, i32** %z3Ptr.addr, align 4
  store i32 %20, i32* %21, align 4
  %22 = load i32, i32* %z2, align 4
  %23 = load i32*, i32** %z2Ptr.addr, align 4
  store i32 %22, i32* %23, align 4
  %24 = load i32, i32* %z1, align 4
  %25 = load i32*, i32** %z1Ptr.addr, align 4
  store i32 %24, i32* %25, align 4
  %26 = load i32, i32* %z0, align 4
  %27 = load i32*, i32** %z0Ptr.addr, align 4
  store i32 %26, i32* %27, align 4
  ret void
}

; Function Attrs: inlinehint nounwind
define i32 @eq64(i32 %a0, i32 %a1, i32 %b0, i32 %b1) #0 {
entry:
  %a0.addr = alloca i32, align 4
  %a1.addr = alloca i32, align 4
  %b0.addr = alloca i32, align 4
  %b1.addr = alloca i32, align 4
  store i32 %a0, i32* %a0.addr, align 4
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %b0, i32* %b0.addr, align 4
  store i32 %b1, i32* %b1.addr, align 4
  %0 = load i32, i32* %a0.addr, align 4
  %1 = load i32, i32* %b0.addr, align 4
  %cmp = icmp eq i32 %0, %1
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %2 = load i32, i32* %a1.addr, align 4
  %3 = load i32, i32* %b1.addr, align 4
  %cmp1 = icmp eq i32 %2, %3
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %4 = phi i1 [ false, %entry ], [ %cmp1, %land.rhs ]
  %land.ext = zext i1 %4 to i32
  ret i32 %land.ext
}

; Function Attrs: inlinehint nounwind
define i32 @le64(i32 %a0, i32 %a1, i32 %b0, i32 %b1) #0 {
entry:
  %a0.addr = alloca i32, align 4
  %a1.addr = alloca i32, align 4
  %b0.addr = alloca i32, align 4
  %b1.addr = alloca i32, align 4
  store i32 %a0, i32* %a0.addr, align 4
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %b0, i32* %b0.addr, align 4
  store i32 %b1, i32* %b1.addr, align 4
  %0 = load i32, i32* %a0.addr, align 4
  %1 = load i32, i32* %b0.addr, align 4
  %cmp = icmp ult i32 %0, %1
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %2 = load i32, i32* %a0.addr, align 4
  %3 = load i32, i32* %b0.addr, align 4
  %cmp1 = icmp eq i32 %2, %3
  br i1 %cmp1, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.rhs
  %4 = load i32, i32* %a1.addr, align 4
  %5 = load i32, i32* %b1.addr, align 4
  %cmp2 = icmp ule i32 %4, %5
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.rhs
  %6 = phi i1 [ false, %lor.rhs ], [ %cmp2, %land.rhs ]
  br label %lor.end

lor.end:                                          ; preds = %land.end, %entry
  %7 = phi i1 [ true, %entry ], [ %6, %land.end ]
  %lor.ext = zext i1 %7 to i32
  ret i32 %lor.ext
}

; Function Attrs: inlinehint nounwind
define i32 @lt64(i32 %a0, i32 %a1, i32 %b0, i32 %b1) #0 {
entry:
  %a0.addr = alloca i32, align 4
  %a1.addr = alloca i32, align 4
  %b0.addr = alloca i32, align 4
  %b1.addr = alloca i32, align 4
  store i32 %a0, i32* %a0.addr, align 4
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %b0, i32* %b0.addr, align 4
  store i32 %b1, i32* %b1.addr, align 4
  %0 = load i32, i32* %a0.addr, align 4
  %1 = load i32, i32* %b0.addr, align 4
  %cmp = icmp ult i32 %0, %1
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %2 = load i32, i32* %a0.addr, align 4
  %3 = load i32, i32* %b0.addr, align 4
  %cmp1 = icmp eq i32 %2, %3
  br i1 %cmp1, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.rhs
  %4 = load i32, i32* %a1.addr, align 4
  %5 = load i32, i32* %b1.addr, align 4
  %cmp2 = icmp ult i32 %4, %5
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.rhs
  %6 = phi i1 [ false, %lor.rhs ], [ %cmp2, %land.rhs ]
  br label %lor.end

lor.end:                                          ; preds = %land.end, %entry
  %7 = phi i1 [ true, %entry ], [ %6, %land.end ]
  %lor.ext = zext i1 %7 to i32
  ret i32 %lor.ext
}

; Function Attrs: inlinehint nounwind
define i32 @ne64(i32 %a0, i32 %a1, i32 %b0, i32 %b1) #0 {
entry:
  %a0.addr = alloca i32, align 4
  %a1.addr = alloca i32, align 4
  %b0.addr = alloca i32, align 4
  %b1.addr = alloca i32, align 4
  store i32 %a0, i32* %a0.addr, align 4
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %b0, i32* %b0.addr, align 4
  store i32 %b1, i32* %b1.addr, align 4
  %0 = load i32, i32* %a0.addr, align 4
  %1 = load i32, i32* %b0.addr, align 4
  %cmp = icmp ne i32 %0, %1
  br i1 %cmp, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %entry
  %2 = load i32, i32* %a1.addr, align 4
  %3 = load i32, i32* %b1.addr, align 4
  %cmp1 = icmp ne i32 %2, %3
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %entry
  %4 = phi i1 [ true, %entry ], [ %cmp1, %lor.rhs ]
  %lor.ext = zext i1 %4 to i32
  ret i32 %lor.ext
}

; Function Attrs: nounwind
define void @float_raise(i32 %flags) #1 {
entry:
  %flags.addr = alloca i32, align 4
  store i32 %flags, i32* %flags.addr, align 4
  %0 = load i32, i32* %flags.addr, align 4
  %1 = load i32, i32* @float_exception_flags, align 4
  %or = or i32 %1, %0
  store i32 %or, i32* @float_exception_flags, align 4
  ret void
}

; Function Attrs: nounwind
define i32 @float32_is_nan(i32 %a) #1 {
entry:
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %shl = shl i32 %0, 1
  %cmp = icmp ult i32 -16777216, %shl
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

; Function Attrs: nounwind
define i32 @float32_is_signaling_nan(i32 %a) #1 {
entry:
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %shr = lshr i32 %0, 22
  %and = and i32 %shr, 511
  %cmp = icmp eq i32 %and, 510
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %1 = load i32, i32* %a.addr, align 4
  %and1 = and i32 %1, 4194303
  %tobool = icmp ne i32 %and1, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %2 = phi i1 [ false, %entry ], [ %tobool, %land.rhs ]
  %land.ext = zext i1 %2 to i32
  ret i32 %land.ext
}

; Function Attrs: nounwind
define i32 @float64_is_nan(i32 %a.0, i32 %a.1) #1 {
entry:
  %a = alloca %struct.float64, align 4
  %high = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  store i32 %a.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  store i32 %a.1, i32* %low, align 4
  %high1 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %0 = load i32, i32* %high1, align 4
  %shl = shl i32 %0, 1
  %cmp = icmp ule i32 -2097152, %shl
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %low2 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %1 = load i32, i32* %low2, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %high3 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %2 = load i32, i32* %high3, align 4
  %and = and i32 %2, 1048575
  %tobool4 = icmp ne i32 %and, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %3 = phi i1 [ true, %land.rhs ], [ %tobool4, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %entry
  %4 = phi i1 [ false, %entry ], [ %3, %lor.end ]
  %land.ext = zext i1 %4 to i32
  ret i32 %land.ext
}

; Function Attrs: nounwind
define i32 @float64_is_signaling_nan(i32 %a.0, i32 %a.1) #1 {
entry:
  %a = alloca %struct.float64, align 4
  %high = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  store i32 %a.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  store i32 %a.1, i32* %low, align 4
  %high1 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %0 = load i32, i32* %high1, align 4
  %shr = lshr i32 %0, 19
  %and = and i32 %shr, 4095
  %cmp = icmp eq i32 %and, 4094
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %low2 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %1 = load i32, i32* %low2, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %high3 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %2 = load i32, i32* %high3, align 4
  %and4 = and i32 %2, 524287
  %tobool5 = icmp ne i32 %and4, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %land.rhs
  %3 = phi i1 [ true, %land.rhs ], [ %tobool5, %lor.rhs ]
  br label %land.end

land.end:                                         ; preds = %lor.end, %entry
  %4 = phi i1 [ false, %entry ], [ %3, %lor.end ]
  %land.ext = zext i1 %4 to i32
  ret i32 %land.ext
}

; Function Attrs: inlinehint nounwind
define i32 @extractFloat32Frac(i32 %a) #0 {
entry:
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %and = and i32 %0, 8388607
  ret i32 %and
}

; Function Attrs: inlinehint nounwind
define i32 @extractFloat32Exp(i32 %a) #0 {
entry:
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %shr = lshr i32 %0, 23
  %and = and i32 %shr, 255
  ret i32 %and
}

; Function Attrs: inlinehint nounwind
define i32 @extractFloat32Sign(i32 %a) #0 {
entry:
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %shr = lshr i32 %0, 31
  ret i32 %shr
}

; Function Attrs: inlinehint nounwind
define i32 @packFloat32(i32 %zSign, i32 %zExp, i32 %zSig) #0 {
entry:
  %zSign.addr = alloca i32, align 4
  %zExp.addr = alloca i32, align 4
  %zSig.addr = alloca i32, align 4
  store i32 %zSign, i32* %zSign.addr, align 4
  store i32 %zExp, i32* %zExp.addr, align 4
  store i32 %zSig, i32* %zSig.addr, align 4
  %0 = load i32, i32* %zSign.addr, align 4
  %shl = shl i32 %0, 31
  %1 = load i32, i32* %zExp.addr, align 4
  %shl1 = shl i32 %1, 23
  %add = add i32 %shl, %shl1
  %2 = load i32, i32* %zSig.addr, align 4
  %add2 = add i32 %add, %2
  ret i32 %add2
}

; Function Attrs: inlinehint nounwind
define i32 @extractFloat64Frac1(i32 %a.0, i32 %a.1) #0 {
entry:
  %a = alloca %struct.float64, align 4
  %high = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  store i32 %a.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  store i32 %a.1, i32* %low, align 4
  %low1 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %0 = load i32, i32* %low1, align 4
  ret i32 %0
}

; Function Attrs: inlinehint nounwind
define i32 @extractFloat64Frac0(i32 %a.0, i32 %a.1) #0 {
entry:
  %a = alloca %struct.float64, align 4
  %high = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  store i32 %a.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  store i32 %a.1, i32* %low, align 4
  %high1 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %0 = load i32, i32* %high1, align 4
  %and = and i32 %0, 1048575
  ret i32 %and
}

; Function Attrs: inlinehint nounwind
define i32 @extractFloat64Exp(i32 %a.0, i32 %a.1) #0 {
entry:
  %a = alloca %struct.float64, align 4
  %high = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  store i32 %a.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  store i32 %a.1, i32* %low, align 4
  %high1 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %0 = load i32, i32* %high1, align 4
  %shr = lshr i32 %0, 20
  %and = and i32 %shr, 2047
  ret i32 %and
}

; Function Attrs: inlinehint nounwind
define i32 @extractFloat64Sign(i32 %a.0, i32 %a.1) #0 {
entry:
  %a = alloca %struct.float64, align 4
  %high = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  store i32 %a.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  store i32 %a.1, i32* %low, align 4
  %high1 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %0 = load i32, i32* %high1, align 4
  %shr = lshr i32 %0, 31
  ret i32 %shr
}

; Function Attrs: inlinehint nounwind
define i64 @packFloat64(i32 %zSign, i32 %zExp, i32 %zSig0, i32 %zSig1) #0 {
entry:
  %retval = alloca %struct.float64, align 4
  %zSign.addr = alloca i32, align 4
  %zExp.addr = alloca i32, align 4
  %zSig0.addr = alloca i32, align 4
  %zSig1.addr = alloca i32, align 4
  %z = alloca %struct.float64, align 4
  store i32 %zSign, i32* %zSign.addr, align 4
  store i32 %zExp, i32* %zExp.addr, align 4
  store i32 %zSig0, i32* %zSig0.addr, align 4
  store i32 %zSig1, i32* %zSig1.addr, align 4
  %0 = load i32, i32* %zSig1.addr, align 4
  %low = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 1
  store i32 %0, i32* %low, align 4
  %1 = load i32, i32* %zSign.addr, align 4
  %shl = shl i32 %1, 31
  %2 = load i32, i32* %zExp.addr, align 4
  %shl1 = shl i32 %2, 20
  %add = add i32 %shl, %shl1
  %3 = load i32, i32* %zSig0.addr, align 4
  %add2 = add i32 %add, %3
  %high = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 0
  store i32 %add2, i32* %high, align 4
  %4 = bitcast %struct.float64* %retval to i8*
  %5 = bitcast %struct.float64* %z to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %4, i8* %5, i32 8, i32 4, i1 false)
  %6 = bitcast %struct.float64* %retval to i64*
  %7 = load i64, i64* %6, align 4
  ret i64 %7
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture, i8* nocapture readonly, i32, i32, i1) #2

; Function Attrs: nounwind
define i32 @int32_to_float32(i32 %a) #1 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %zSign = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %a.addr, align 4
  %cmp1 = icmp eq i32 %1, -2147483648
  br i1 %cmp1, label %if.then.2, label %if.end.3

if.then.2:                                        ; preds = %if.end
  %call = call i32 @packFloat32(i32 1, i32 158, i32 0)
  store i32 %call, i32* %retval
  br label %return

if.end.3:                                         ; preds = %if.end
  %2 = load i32, i32* %a.addr, align 4
  %cmp4 = icmp slt i32 %2, 0
  %conv = zext i1 %cmp4 to i32
  store i32 %conv, i32* %zSign, align 4
  %3 = load i32, i32* %zSign, align 4
  %4 = load i32, i32* %zSign, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end.3
  %5 = load i32, i32* %a.addr, align 4
  %sub = sub nsw i32 0, %5
  br label %cond.end

cond.false:                                       ; preds = %if.end.3
  %6 = load i32, i32* %a.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ %6, %cond.false ]
  %call5 = call i32 @normalizeRoundAndPackFloat32(i32 %3, i32 156, i32 %cond)
  store i32 %call5, i32* %retval
  br label %return

return:                                           ; preds = %cond.end, %if.then.2, %if.then
  %7 = load i32, i32* %retval
  ret i32 %7
}

; Function Attrs: nounwind
define internal i32 @normalizeRoundAndPackFloat32(i32 %zSign, i32 %zExp, i32 %zSig) #1 {
entry:
  %zSign.addr = alloca i32, align 4
  %zExp.addr = alloca i32, align 4
  %zSig.addr = alloca i32, align 4
  %shiftCount = alloca i32, align 4
  store i32 %zSign, i32* %zSign.addr, align 4
  store i32 %zExp, i32* %zExp.addr, align 4
  store i32 %zSig, i32* %zSig.addr, align 4
  %0 = load i32, i32* %zSig.addr, align 4
  %call = call i32 @countLeadingZeros32(i32 %0)
  %sub = sub nsw i32 %call, 1
  store i32 %sub, i32* %shiftCount, align 4
  %1 = load i32, i32* %zSign.addr, align 4
  %2 = load i32, i32* %zExp.addr, align 4
  %3 = load i32, i32* %shiftCount, align 4
  %sub1 = sub nsw i32 %2, %3
  %4 = load i32, i32* %zSig.addr, align 4
  %5 = load i32, i32* %shiftCount, align 4
  %shl = shl i32 %4, %5
  %call2 = call i32 @roundAndPackFloat32(i32 %1, i32 %sub1, i32 %shl)
  ret i32 %call2
}

; Function Attrs: nounwind
define i64 @int32_to_float64(i32 %a) #1 {
entry:
  %retval = alloca %struct.float64, align 4
  %a.addr = alloca i32, align 4
  %zSign = alloca i32, align 4
  %absA = alloca i32, align 4
  %shiftCount = alloca i32, align 4
  %zSig0 = alloca i32, align 4
  %zSig1 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call = call i64 @packFloat64(i32 0, i32 0, i32 0, i32 0)
  %1 = bitcast %struct.float64* %retval to i64*
  store i64 %call, i64* %1, align 4
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %a.addr, align 4
  %cmp1 = icmp slt i32 %2, 0
  %conv = zext i1 %cmp1 to i32
  store i32 %conv, i32* %zSign, align 4
  %3 = load i32, i32* %zSign, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %4 = load i32, i32* %a.addr, align 4
  %sub = sub nsw i32 0, %4
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %5 = load i32, i32* %a.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ %5, %cond.false ]
  store i32 %cond, i32* %absA, align 4
  %6 = load i32, i32* %absA, align 4
  %call2 = call i32 @countLeadingZeros32(i32 %6)
  %sub3 = sub nsw i32 %call2, 11
  store i32 %sub3, i32* %shiftCount, align 4
  %7 = load i32, i32* %shiftCount, align 4
  %cmp4 = icmp sle i32 0, %7
  br i1 %cmp4, label %if.then.6, label %if.else

if.then.6:                                        ; preds = %cond.end
  %8 = load i32, i32* %absA, align 4
  %9 = load i32, i32* %shiftCount, align 4
  %shl = shl i32 %8, %9
  store i32 %shl, i32* %zSig0, align 4
  store i32 0, i32* %zSig1, align 4
  br label %if.end.8

if.else:                                          ; preds = %cond.end
  %10 = load i32, i32* %absA, align 4
  %11 = load i32, i32* %shiftCount, align 4
  %sub7 = sub nsw i32 0, %11
  call void @shift64Right(i32 %10, i32 0, i32 %sub7, i32* %zSig0, i32* %zSig1)
  br label %if.end.8

if.end.8:                                         ; preds = %if.else, %if.then.6
  %12 = load i32, i32* %zSign, align 4
  %13 = load i32, i32* %shiftCount, align 4
  %sub9 = sub nsw i32 1042, %13
  %14 = load i32, i32* %zSig0, align 4
  %15 = load i32, i32* %zSig1, align 4
  %call10 = call i64 @packFloat64(i32 %12, i32 %sub9, i32 %14, i32 %15)
  %16 = bitcast %struct.float64* %retval to i64*
  store i64 %call10, i64* %16, align 4
  br label %return

return:                                           ; preds = %if.end.8, %if.then
  %17 = bitcast %struct.float64* %retval to i64*
  %18 = load i64, i64* %17, align 4
  ret i64 %18
}

; Function Attrs: nounwind
define internal i32 @countLeadingZeros32(i32 %a) #1 {
entry:
  %a.addr = alloca i32, align 4
  %shiftCount = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 0, i32* %shiftCount, align 4
  %0 = load i32, i32* %a.addr, align 4
  %cmp = icmp ult i32 %0, 65536
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %shiftCount, align 4
  %add = add nsw i32 %1, 16
  store i32 %add, i32* %shiftCount, align 4
  %2 = load i32, i32* %a.addr, align 4
  %shl = shl i32 %2, 16
  store i32 %shl, i32* %a.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, i32* %a.addr, align 4
  %cmp1 = icmp ult i32 %3, 16777216
  br i1 %cmp1, label %if.then.2, label %if.end.5

if.then.2:                                        ; preds = %if.end
  %4 = load i32, i32* %shiftCount, align 4
  %add3 = add nsw i32 %4, 8
  store i32 %add3, i32* %shiftCount, align 4
  %5 = load i32, i32* %a.addr, align 4
  %shl4 = shl i32 %5, 8
  store i32 %shl4, i32* %a.addr, align 4
  br label %if.end.5

if.end.5:                                         ; preds = %if.then.2, %if.end
  %6 = load i32, i32* %a.addr, align 4
  %shr = lshr i32 %6, 24
  %arrayidx = getelementptr inbounds [256 x i32], [256 x i32]* @countLeadingZeros32.countLeadingZerosHigh, i32 0, i32 %shr
  %7 = load i32, i32* %arrayidx, align 4
  %8 = load i32, i32* %shiftCount, align 4
  %add6 = add nsw i32 %8, %7
  store i32 %add6, i32* %shiftCount, align 4
  %9 = load i32, i32* %shiftCount, align 4
  ret i32 %9
}

; Function Attrs: nounwind
define i32 @float32_to_int32(i32 %a) #1 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %aSign = alloca i32, align 4
  %aExp = alloca i32, align 4
  %shiftCount = alloca i32, align 4
  %aSig = alloca i32, align 4
  %aSigExtra = alloca i32, align 4
  %z = alloca i32, align 4
  %roundingMode = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %call = call i32 @extractFloat32Frac(i32 %0)
  store i32 %call, i32* %aSig, align 4
  %1 = load i32, i32* %a.addr, align 4
  %call1 = call i32 @extractFloat32Exp(i32 %1)
  store i32 %call1, i32* %aExp, align 4
  %2 = load i32, i32* %a.addr, align 4
  %call2 = call i32 @extractFloat32Sign(i32 %2)
  store i32 %call2, i32* %aSign, align 4
  %3 = load i32, i32* %aExp, align 4
  %sub = sub nsw i32 %3, 150
  store i32 %sub, i32* %shiftCount, align 4
  %4 = load i32, i32* %shiftCount, align 4
  %cmp = icmp sle i32 0, %4
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %aExp, align 4
  %cmp3 = icmp sle i32 158, %5
  br i1 %cmp3, label %if.then.4, label %if.end.11

if.then.4:                                        ; preds = %if.then
  %6 = load i32, i32* %a.addr, align 4
  %cmp5 = icmp ne i32 %6, -822083584
  br i1 %cmp5, label %if.then.6, label %if.end.10

if.then.6:                                        ; preds = %if.then.4
  call void @float_raise(i32 16)
  %7 = load i32, i32* %aSign, align 4
  %tobool = icmp ne i32 %7, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then.9

lor.lhs.false:                                    ; preds = %if.then.6
  %8 = load i32, i32* %aExp, align 4
  %cmp7 = icmp eq i32 %8, 255
  br i1 %cmp7, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %lor.lhs.false
  %9 = load i32, i32* %aSig, align 4
  %tobool8 = icmp ne i32 %9, 0
  br i1 %tobool8, label %if.then.9, label %if.end

if.then.9:                                        ; preds = %land.lhs.true, %if.then.6
  store i32 2147483647, i32* %retval
  br label %return

if.end:                                           ; preds = %land.lhs.true, %lor.lhs.false
  br label %if.end.10

if.end.10:                                        ; preds = %if.end, %if.then.4
  store i32 -2147483648, i32* %retval
  br label %return

if.end.11:                                        ; preds = %if.then
  %10 = load i32, i32* %aSig, align 4
  %or = or i32 %10, 8388608
  %11 = load i32, i32* %shiftCount, align 4
  %shl = shl i32 %or, %11
  store i32 %shl, i32* %z, align 4
  %12 = load i32, i32* %aSign, align 4
  %tobool12 = icmp ne i32 %12, 0
  br i1 %tobool12, label %if.then.13, label %if.end.15

if.then.13:                                       ; preds = %if.end.11
  %13 = load i32, i32* %z, align 4
  %sub14 = sub nsw i32 0, %13
  store i32 %sub14, i32* %z, align 4
  br label %if.end.15

if.end.15:                                        ; preds = %if.then.13, %if.end.11
  br label %if.end.57

if.else:                                          ; preds = %entry
  %14 = load i32, i32* %aExp, align 4
  %cmp16 = icmp slt i32 %14, 126
  br i1 %cmp16, label %if.then.17, label %if.else.19

if.then.17:                                       ; preds = %if.else
  %15 = load i32, i32* %aExp, align 4
  %16 = load i32, i32* %aSig, align 4
  %or18 = or i32 %15, %16
  store i32 %or18, i32* %aSigExtra, align 4
  store i32 0, i32* %z, align 4
  br label %if.end.23

if.else.19:                                       ; preds = %if.else
  %17 = load i32, i32* %aSig, align 4
  %or20 = or i32 %17, 8388608
  store i32 %or20, i32* %aSig, align 4
  %18 = load i32, i32* %aSig, align 4
  %19 = load i32, i32* %shiftCount, align 4
  %and = and i32 %19, 31
  %shl21 = shl i32 %18, %and
  store i32 %shl21, i32* %aSigExtra, align 4
  %20 = load i32, i32* %aSig, align 4
  %21 = load i32, i32* %shiftCount, align 4
  %sub22 = sub nsw i32 0, %21
  %shr = lshr i32 %20, %sub22
  store i32 %shr, i32* %z, align 4
  br label %if.end.23

if.end.23:                                        ; preds = %if.else.19, %if.then.17
  %22 = load i32, i32* %aSigExtra, align 4
  %tobool24 = icmp ne i32 %22, 0
  br i1 %tobool24, label %if.then.25, label %if.end.27

if.then.25:                                       ; preds = %if.end.23
  %23 = load i32, i32* @float_exception_flags, align 4
  %or26 = or i32 %23, 1
  store i32 %or26, i32* @float_exception_flags, align 4
  br label %if.end.27

if.end.27:                                        ; preds = %if.then.25, %if.end.23
  %24 = load i32, i32* @float_rounding_mode, align 4
  store i32 %24, i32* %roundingMode, align 4
  %25 = load i32, i32* %roundingMode, align 4
  %cmp28 = icmp eq i32 %25, 0
  br i1 %cmp28, label %if.then.29, label %if.else.42

if.then.29:                                       ; preds = %if.end.27
  %26 = load i32, i32* %aSigExtra, align 4
  %cmp30 = icmp slt i32 %26, 0
  br i1 %cmp30, label %if.then.31, label %if.end.37

if.then.31:                                       ; preds = %if.then.29
  %27 = load i32, i32* %z, align 4
  %inc = add nsw i32 %27, 1
  store i32 %inc, i32* %z, align 4
  %28 = load i32, i32* %aSigExtra, align 4
  %shl32 = shl i32 %28, 1
  %cmp33 = icmp eq i32 %shl32, 0
  br i1 %cmp33, label %if.then.34, label %if.end.36

if.then.34:                                       ; preds = %if.then.31
  %29 = load i32, i32* %z, align 4
  %and35 = and i32 %29, -2
  store i32 %and35, i32* %z, align 4
  br label %if.end.36

if.end.36:                                        ; preds = %if.then.34, %if.then.31
  br label %if.end.37

if.end.37:                                        ; preds = %if.end.36, %if.then.29
  %30 = load i32, i32* %aSign, align 4
  %tobool38 = icmp ne i32 %30, 0
  br i1 %tobool38, label %if.then.39, label %if.end.41

if.then.39:                                       ; preds = %if.end.37
  %31 = load i32, i32* %z, align 4
  %sub40 = sub nsw i32 0, %31
  store i32 %sub40, i32* %z, align 4
  br label %if.end.41

if.end.41:                                        ; preds = %if.then.39, %if.end.37
  br label %if.end.56

if.else.42:                                       ; preds = %if.end.27
  %32 = load i32, i32* %aSigExtra, align 4
  %cmp43 = icmp ne i32 %32, 0
  %conv = zext i1 %cmp43 to i32
  store i32 %conv, i32* %aSigExtra, align 4
  %33 = load i32, i32* %aSign, align 4
  %tobool44 = icmp ne i32 %33, 0
  br i1 %tobool44, label %if.then.45, label %if.else.50

if.then.45:                                       ; preds = %if.else.42
  %34 = load i32, i32* %roundingMode, align 4
  %cmp46 = icmp eq i32 %34, 3
  %conv47 = zext i1 %cmp46 to i32
  %35 = load i32, i32* %aSigExtra, align 4
  %and48 = and i32 %conv47, %35
  %36 = load i32, i32* %z, align 4
  %add = add i32 %36, %and48
  store i32 %add, i32* %z, align 4
  %37 = load i32, i32* %z, align 4
  %sub49 = sub nsw i32 0, %37
  store i32 %sub49, i32* %z, align 4
  br label %if.end.55

if.else.50:                                       ; preds = %if.else.42
  %38 = load i32, i32* %roundingMode, align 4
  %cmp51 = icmp eq i32 %38, 2
  %conv52 = zext i1 %cmp51 to i32
  %39 = load i32, i32* %aSigExtra, align 4
  %and53 = and i32 %conv52, %39
  %40 = load i32, i32* %z, align 4
  %add54 = add i32 %40, %and53
  store i32 %add54, i32* %z, align 4
  br label %if.end.55

if.end.55:                                        ; preds = %if.else.50, %if.then.45
  br label %if.end.56

if.end.56:                                        ; preds = %if.end.55, %if.end.41
  br label %if.end.57

if.end.57:                                        ; preds = %if.end.56, %if.end.15
  %41 = load i32, i32* %z, align 4
  store i32 %41, i32* %retval
  br label %return

return:                                           ; preds = %if.end.57, %if.end.10, %if.then.9
  %42 = load i32, i32* %retval
  ret i32 %42
}

; Function Attrs: nounwind
define i32 @float32_to_int32_round_to_zero(i32 %a) #1 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %aSign = alloca i32, align 4
  %aExp = alloca i32, align 4
  %shiftCount = alloca i32, align 4
  %aSig = alloca i32, align 4
  %z = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %call = call i32 @extractFloat32Frac(i32 %0)
  store i32 %call, i32* %aSig, align 4
  %1 = load i32, i32* %a.addr, align 4
  %call1 = call i32 @extractFloat32Exp(i32 %1)
  store i32 %call1, i32* %aExp, align 4
  %2 = load i32, i32* %a.addr, align 4
  %call2 = call i32 @extractFloat32Sign(i32 %2)
  store i32 %call2, i32* %aSign, align 4
  %3 = load i32, i32* %aExp, align 4
  %sub = sub nsw i32 %3, 158
  store i32 %sub, i32* %shiftCount, align 4
  %4 = load i32, i32* %shiftCount, align 4
  %cmp = icmp sle i32 0, %4
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %5 = load i32, i32* %a.addr, align 4
  %cmp3 = icmp ne i32 %5, -822083584
  br i1 %cmp3, label %if.then.4, label %if.end.8

if.then.4:                                        ; preds = %if.then
  call void @float_raise(i32 16)
  %6 = load i32, i32* %aSign, align 4
  %tobool = icmp ne i32 %6, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then.7

lor.lhs.false:                                    ; preds = %if.then.4
  %7 = load i32, i32* %aExp, align 4
  %cmp5 = icmp eq i32 %7, 255
  br i1 %cmp5, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %lor.lhs.false
  %8 = load i32, i32* %aSig, align 4
  %tobool6 = icmp ne i32 %8, 0
  br i1 %tobool6, label %if.then.7, label %if.end

if.then.7:                                        ; preds = %land.lhs.true, %if.then.4
  store i32 2147483647, i32* %retval
  br label %return

if.end:                                           ; preds = %land.lhs.true, %lor.lhs.false
  br label %if.end.8

if.end.8:                                         ; preds = %if.end, %if.then
  store i32 -2147483648, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  %9 = load i32, i32* %aExp, align 4
  %cmp9 = icmp sle i32 %9, 126
  br i1 %cmp9, label %if.then.10, label %if.end.15

if.then.10:                                       ; preds = %if.else
  %10 = load i32, i32* %aExp, align 4
  %11 = load i32, i32* %aSig, align 4
  %or = or i32 %10, %11
  %tobool11 = icmp ne i32 %or, 0
  br i1 %tobool11, label %if.then.12, label %if.end.14

if.then.12:                                       ; preds = %if.then.10
  %12 = load i32, i32* @float_exception_flags, align 4
  %or13 = or i32 %12, 1
  store i32 %or13, i32* @float_exception_flags, align 4
  br label %if.end.14

if.end.14:                                        ; preds = %if.then.12, %if.then.10
  store i32 0, i32* %retval
  br label %return

if.end.15:                                        ; preds = %if.else
  br label %if.end.16

if.end.16:                                        ; preds = %if.end.15
  %13 = load i32, i32* %aSig, align 4
  %or17 = or i32 %13, 8388608
  %shl = shl i32 %or17, 8
  store i32 %shl, i32* %aSig, align 4
  %14 = load i32, i32* %aSig, align 4
  %15 = load i32, i32* %shiftCount, align 4
  %sub18 = sub nsw i32 0, %15
  %shr = lshr i32 %14, %sub18
  store i32 %shr, i32* %z, align 4
  %16 = load i32, i32* %aSig, align 4
  %17 = load i32, i32* %shiftCount, align 4
  %and = and i32 %17, 31
  %shl19 = shl i32 %16, %and
  %tobool20 = icmp ne i32 %shl19, 0
  br i1 %tobool20, label %if.then.21, label %if.end.23

if.then.21:                                       ; preds = %if.end.16
  %18 = load i32, i32* @float_exception_flags, align 4
  %or22 = or i32 %18, 1
  store i32 %or22, i32* @float_exception_flags, align 4
  br label %if.end.23

if.end.23:                                        ; preds = %if.then.21, %if.end.16
  %19 = load i32, i32* %aSign, align 4
  %tobool24 = icmp ne i32 %19, 0
  br i1 %tobool24, label %if.then.25, label %if.end.27

if.then.25:                                       ; preds = %if.end.23
  %20 = load i32, i32* %z, align 4
  %sub26 = sub nsw i32 0, %20
  store i32 %sub26, i32* %z, align 4
  br label %if.end.27

if.end.27:                                        ; preds = %if.then.25, %if.end.23
  %21 = load i32, i32* %z, align 4
  store i32 %21, i32* %retval
  br label %return

return:                                           ; preds = %if.end.27, %if.end.14, %if.end.8, %if.then.7
  %22 = load i32, i32* %retval
  ret i32 %22
}

; Function Attrs: nounwind
define i64 @float32_to_float64(i32 %a) #1 {
entry:
  %retval = alloca %struct.float64, align 4
  %a.addr = alloca i32, align 4
  %aSign = alloca i32, align 4
  %aExp = alloca i32, align 4
  %aSig = alloca i32, align 4
  %zSig0 = alloca i32, align 4
  %zSig1 = alloca i32, align 4
  %agg.tmp = alloca %struct.commonNaNT, align 4
  store i32 %a, i32* %a.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %call = call i32 @extractFloat32Frac(i32 %0)
  store i32 %call, i32* %aSig, align 4
  %1 = load i32, i32* %a.addr, align 4
  %call1 = call i32 @extractFloat32Exp(i32 %1)
  store i32 %call1, i32* %aExp, align 4
  %2 = load i32, i32* %a.addr, align 4
  %call2 = call i32 @extractFloat32Sign(i32 %2)
  store i32 %call2, i32* %aSign, align 4
  %3 = load i32, i32* %aExp, align 4
  %cmp = icmp eq i32 %3, 255
  br i1 %cmp, label %if.then, label %if.end.6

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %aSig, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then.3, label %if.end

if.then.3:                                        ; preds = %if.then
  %5 = load i32, i32* %a.addr, align 4
  call void @float32ToCommonNaN(%struct.commonNaNT* sret %agg.tmp, i32 %5)
  %sign = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %agg.tmp, i32 0, i32 0
  %6 = load i32, i32* %sign, align 4
  %high = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %agg.tmp, i32 0, i32 1
  %7 = load i32, i32* %high, align 4
  %low = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %agg.tmp, i32 0, i32 2
  %8 = load i32, i32* %low, align 4
  %call4 = call i64 @commonNaNToFloat64(i32 %6, i32 %7, i32 %8)
  %9 = bitcast %struct.float64* %retval to i64*
  store i64 %call4, i64* %9, align 4
  br label %return

if.end:                                           ; preds = %if.then
  %10 = load i32, i32* %aSign, align 4
  %call5 = call i64 @packFloat64(i32 %10, i32 2047, i32 0, i32 0)
  %11 = bitcast %struct.float64* %retval to i64*
  store i64 %call5, i64* %11, align 4
  br label %return

if.end.6:                                         ; preds = %entry
  %12 = load i32, i32* %aExp, align 4
  %cmp7 = icmp eq i32 %12, 0
  br i1 %cmp7, label %if.then.8, label %if.end.13

if.then.8:                                        ; preds = %if.end.6
  %13 = load i32, i32* %aSig, align 4
  %cmp9 = icmp eq i32 %13, 0
  br i1 %cmp9, label %if.then.10, label %if.end.12

if.then.10:                                       ; preds = %if.then.8
  %14 = load i32, i32* %aSign, align 4
  %call11 = call i64 @packFloat64(i32 %14, i32 0, i32 0, i32 0)
  %15 = bitcast %struct.float64* %retval to i64*
  store i64 %call11, i64* %15, align 4
  br label %return

if.end.12:                                        ; preds = %if.then.8
  %16 = load i32, i32* %aSig, align 4
  call void @normalizeFloat32Subnormal(i32 %16, i32* %aExp, i32* %aSig)
  %17 = load i32, i32* %aExp, align 4
  %dec = add nsw i32 %17, -1
  store i32 %dec, i32* %aExp, align 4
  br label %if.end.13

if.end.13:                                        ; preds = %if.end.12, %if.end.6
  %18 = load i32, i32* %aSig, align 4
  call void @shift64Right(i32 %18, i32 0, i32 3, i32* %zSig0, i32* %zSig1)
  %19 = load i32, i32* %aSign, align 4
  %20 = load i32, i32* %aExp, align 4
  %add = add nsw i32 %20, 896
  %21 = load i32, i32* %zSig0, align 4
  %22 = load i32, i32* %zSig1, align 4
  %call14 = call i64 @packFloat64(i32 %19, i32 %add, i32 %21, i32 %22)
  %23 = bitcast %struct.float64* %retval to i64*
  store i64 %call14, i64* %23, align 4
  br label %return

return:                                           ; preds = %if.end.13, %if.then.10, %if.end, %if.then.3
  %24 = bitcast %struct.float64* %retval to i64*
  %25 = load i64, i64* %24, align 4
  ret i64 %25
}

; Function Attrs: nounwind
define internal i64 @commonNaNToFloat64(i32 %a.0, i32 %a.1, i32 %a.2) #1 {
entry:
  %retval = alloca %struct.float64, align 4
  %a = alloca %struct.commonNaNT, align 4
  %z = alloca %struct.float64, align 4
  %sign = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %a, i32 0, i32 0
  store i32 %a.0, i32* %sign, align 4
  %high = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %a, i32 0, i32 1
  store i32 %a.1, i32* %high, align 4
  %low = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %a, i32 0, i32 2
  store i32 %a.2, i32* %low, align 4
  %high1 = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %a, i32 0, i32 1
  %0 = load i32, i32* %high1, align 4
  %low2 = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %a, i32 0, i32 2
  %1 = load i32, i32* %low2, align 4
  %high3 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 0
  %low4 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 1
  call void @shift64Right(i32 %0, i32 %1, i32 12, i32* %high3, i32* %low4)
  %sign5 = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %a, i32 0, i32 0
  %2 = load i32, i32* %sign5, align 4
  %shl = shl i32 %2, 31
  %or = or i32 %shl, 2146959360
  %high6 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 0
  %3 = load i32, i32* %high6, align 4
  %or7 = or i32 %3, %or
  store i32 %or7, i32* %high6, align 4
  %4 = bitcast %struct.float64* %retval to i8*
  %5 = bitcast %struct.float64* %z to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %4, i8* %5, i32 8, i32 4, i1 false)
  %6 = bitcast %struct.float64* %retval to i64*
  %7 = load i64, i64* %6, align 4
  ret i64 %7
}

; Function Attrs: nounwind
define internal void @float32ToCommonNaN(%struct.commonNaNT* noalias sret %agg.result, i32 %a) #1 {
entry:
  %a.addr = alloca i32, align 4
  %z = alloca %struct.commonNaNT, align 4
  store i32 %a, i32* %a.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %call = call i32 @float32_is_signaling_nan(i32 %0)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @float_raise(i32 16)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32, i32* %a.addr, align 4
  %shr = lshr i32 %1, 31
  %sign = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %z, i32 0, i32 0
  store i32 %shr, i32* %sign, align 4
  %low = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %z, i32 0, i32 2
  store i32 0, i32* %low, align 4
  %2 = load i32, i32* %a.addr, align 4
  %shl = shl i32 %2, 9
  %high = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %z, i32 0, i32 1
  store i32 %shl, i32* %high, align 4
  %3 = bitcast %struct.commonNaNT* %agg.result to i8*
  %4 = bitcast %struct.commonNaNT* %z to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %3, i8* %4, i32 12, i32 4, i1 false)
  ret void
}

; Function Attrs: nounwind
define internal void @normalizeFloat32Subnormal(i32 %aSig, i32* %zExpPtr, i32* %zSigPtr) #1 {
entry:
  %aSig.addr = alloca i32, align 4
  %zExpPtr.addr = alloca i32*, align 4
  %zSigPtr.addr = alloca i32*, align 4
  %shiftCount = alloca i32, align 4
  store i32 %aSig, i32* %aSig.addr, align 4
  store i32* %zExpPtr, i32** %zExpPtr.addr, align 4
  store i32* %zSigPtr, i32** %zSigPtr.addr, align 4
  %0 = load i32, i32* %aSig.addr, align 4
  %call = call i32 @countLeadingZeros32(i32 %0)
  %sub = sub nsw i32 %call, 8
  store i32 %sub, i32* %shiftCount, align 4
  %1 = load i32, i32* %aSig.addr, align 4
  %2 = load i32, i32* %shiftCount, align 4
  %shl = shl i32 %1, %2
  %3 = load i32*, i32** %zSigPtr.addr, align 4
  store i32 %shl, i32* %3, align 4
  %4 = load i32, i32* %shiftCount, align 4
  %sub1 = sub nsw i32 1, %4
  %5 = load i32*, i32** %zExpPtr.addr, align 4
  store i32 %sub1, i32* %5, align 4
  ret void
}

; Function Attrs: nounwind
define i32 @float32_round_to_int(i32 %a) #1 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %aSign = alloca i32, align 4
  %aExp = alloca i32, align 4
  %lastBitMask = alloca i32, align 4
  %roundBitsMask = alloca i32, align 4
  %roundingMode = alloca i32, align 4
  %z = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %call = call i32 @extractFloat32Exp(i32 %0)
  store i32 %call, i32* %aExp, align 4
  %1 = load i32, i32* %aExp, align 4
  %cmp = icmp sle i32 150, %1
  br i1 %cmp, label %if.then, label %if.end.5

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %aExp, align 4
  %cmp1 = icmp eq i32 %2, 255
  br i1 %cmp1, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %if.then
  %3 = load i32, i32* %a.addr, align 4
  %call2 = call i32 @extractFloat32Frac(i32 %3)
  %tobool = icmp ne i32 %call2, 0
  br i1 %tobool, label %if.then.3, label %if.end

if.then.3:                                        ; preds = %land.lhs.true
  %4 = load i32, i32* %a.addr, align 4
  %5 = load i32, i32* %a.addr, align 4
  %call4 = call i32 @propagateFloat32NaN(i32 %4, i32 %5)
  store i32 %call4, i32* %retval
  br label %return

if.end:                                           ; preds = %land.lhs.true, %if.then
  %6 = load i32, i32* %a.addr, align 4
  store i32 %6, i32* %retval
  br label %return

if.end.5:                                         ; preds = %entry
  %7 = load i32, i32* %aExp, align 4
  %cmp6 = icmp sle i32 %7, 126
  br i1 %cmp6, label %if.then.7, label %if.end.25

if.then.7:                                        ; preds = %if.end.5
  %8 = load i32, i32* %a.addr, align 4
  %shl = shl i32 %8, 1
  %cmp8 = icmp eq i32 %shl, 0
  br i1 %cmp8, label %if.then.9, label %if.end.10

if.then.9:                                        ; preds = %if.then.7
  %9 = load i32, i32* %a.addr, align 4
  store i32 %9, i32* %retval
  br label %return

if.end.10:                                        ; preds = %if.then.7
  %10 = load i32, i32* @float_exception_flags, align 4
  %or = or i32 %10, 1
  store i32 %or, i32* @float_exception_flags, align 4
  %11 = load i32, i32* %a.addr, align 4
  %call11 = call i32 @extractFloat32Sign(i32 %11)
  store i32 %call11, i32* %aSign, align 4
  %12 = load i32, i32* @float_rounding_mode, align 4
  switch i32 %12, label %sw.epilog [
    i32 0, label %sw.bb
    i32 3, label %sw.bb.19
    i32 2, label %sw.bb.21
  ]

sw.bb:                                            ; preds = %if.end.10
  %13 = load i32, i32* %aExp, align 4
  %cmp12 = icmp eq i32 %13, 126
  br i1 %cmp12, label %land.lhs.true.13, label %if.end.18

land.lhs.true.13:                                 ; preds = %sw.bb
  %14 = load i32, i32* %a.addr, align 4
  %call14 = call i32 @extractFloat32Frac(i32 %14)
  %tobool15 = icmp ne i32 %call14, 0
  br i1 %tobool15, label %if.then.16, label %if.end.18

if.then.16:                                       ; preds = %land.lhs.true.13
  %15 = load i32, i32* %aSign, align 4
  %call17 = call i32 @packFloat32(i32 %15, i32 127, i32 0)
  store i32 %call17, i32* %retval
  br label %return

if.end.18:                                        ; preds = %land.lhs.true.13, %sw.bb
  br label %sw.epilog

sw.bb.19:                                         ; preds = %if.end.10
  %16 = load i32, i32* %aSign, align 4
  %tobool20 = icmp ne i32 %16, 0
  %cond = select i1 %tobool20, i32 -1082130432, i32 0
  store i32 %cond, i32* %retval
  br label %return

sw.bb.21:                                         ; preds = %if.end.10
  %17 = load i32, i32* %aSign, align 4
  %tobool22 = icmp ne i32 %17, 0
  %cond23 = select i1 %tobool22, i32 -2147483648, i32 1065353216
  store i32 %cond23, i32* %retval
  br label %return

sw.epilog:                                        ; preds = %if.end.10, %if.end.18
  %18 = load i32, i32* %aSign, align 4
  %call24 = call i32 @packFloat32(i32 %18, i32 0, i32 0)
  store i32 %call24, i32* %retval
  br label %return

if.end.25:                                        ; preds = %if.end.5
  store i32 1, i32* %lastBitMask, align 4
  %19 = load i32, i32* %aExp, align 4
  %sub = sub nsw i32 150, %19
  %20 = load i32, i32* %lastBitMask, align 4
  %shl26 = shl i32 %20, %sub
  store i32 %shl26, i32* %lastBitMask, align 4
  %21 = load i32, i32* %lastBitMask, align 4
  %sub27 = sub i32 %21, 1
  store i32 %sub27, i32* %roundBitsMask, align 4
  %22 = load i32, i32* %a.addr, align 4
  store i32 %22, i32* %z, align 4
  %23 = load i32, i32* @float_rounding_mode, align 4
  store i32 %23, i32* %roundingMode, align 4
  %24 = load i32, i32* %roundingMode, align 4
  %cmp28 = icmp eq i32 %24, 0
  br i1 %cmp28, label %if.then.29, label %if.else

if.then.29:                                       ; preds = %if.end.25
  %25 = load i32, i32* %lastBitMask, align 4
  %shr = lshr i32 %25, 1
  %26 = load i32, i32* %z, align 4
  %add = add i32 %26, %shr
  store i32 %add, i32* %z, align 4
  %27 = load i32, i32* %z, align 4
  %28 = load i32, i32* %roundBitsMask, align 4
  %and = and i32 %27, %28
  %cmp30 = icmp eq i32 %and, 0
  br i1 %cmp30, label %if.then.31, label %if.end.33

if.then.31:                                       ; preds = %if.then.29
  %29 = load i32, i32* %lastBitMask, align 4
  %neg = xor i32 %29, -1
  %30 = load i32, i32* %z, align 4
  %and32 = and i32 %30, %neg
  store i32 %and32, i32* %z, align 4
  br label %if.end.33

if.end.33:                                        ; preds = %if.then.31, %if.then.29
  br label %if.end.43

if.else:                                          ; preds = %if.end.25
  %31 = load i32, i32* %roundingMode, align 4
  %cmp34 = icmp ne i32 %31, 1
  br i1 %cmp34, label %if.then.35, label %if.end.42

if.then.35:                                       ; preds = %if.else
  %32 = load i32, i32* %z, align 4
  %call36 = call i32 @extractFloat32Sign(i32 %32)
  %33 = load i32, i32* %roundingMode, align 4
  %cmp37 = icmp eq i32 %33, 2
  %conv = zext i1 %cmp37 to i32
  %xor = xor i32 %call36, %conv
  %tobool38 = icmp ne i32 %xor, 0
  br i1 %tobool38, label %if.then.39, label %if.end.41

if.then.39:                                       ; preds = %if.then.35
  %34 = load i32, i32* %roundBitsMask, align 4
  %35 = load i32, i32* %z, align 4
  %add40 = add i32 %35, %34
  store i32 %add40, i32* %z, align 4
  br label %if.end.41

if.end.41:                                        ; preds = %if.then.39, %if.then.35
  br label %if.end.42

if.end.42:                                        ; preds = %if.end.41, %if.else
  br label %if.end.43

if.end.43:                                        ; preds = %if.end.42, %if.end.33
  %36 = load i32, i32* %roundBitsMask, align 4
  %neg44 = xor i32 %36, -1
  %37 = load i32, i32* %z, align 4
  %and45 = and i32 %37, %neg44
  store i32 %and45, i32* %z, align 4
  %38 = load i32, i32* %z, align 4
  %39 = load i32, i32* %a.addr, align 4
  %cmp46 = icmp ne i32 %38, %39
  br i1 %cmp46, label %if.then.48, label %if.end.50

if.then.48:                                       ; preds = %if.end.43
  %40 = load i32, i32* @float_exception_flags, align 4
  %or49 = or i32 %40, 1
  store i32 %or49, i32* @float_exception_flags, align 4
  br label %if.end.50

if.end.50:                                        ; preds = %if.then.48, %if.end.43
  %41 = load i32, i32* %z, align 4
  store i32 %41, i32* %retval
  br label %return

return:                                           ; preds = %if.end.50, %sw.epilog, %sw.bb.21, %sw.bb.19, %if.then.16, %if.then.9, %if.end, %if.then.3
  %42 = load i32, i32* %retval
  ret i32 %42
}

; Function Attrs: nounwind
define internal i32 @propagateFloat32NaN(i32 %a, i32 %b) #1 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %aIsNaN = alloca i32, align 4
  %aIsSignalingNaN = alloca i32, align 4
  %bIsNaN = alloca i32, align 4
  %bIsSignalingNaN = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %call = call i32 @float32_is_nan(i32 %0)
  store i32 %call, i32* %aIsNaN, align 4
  %1 = load i32, i32* %a.addr, align 4
  %call1 = call i32 @float32_is_signaling_nan(i32 %1)
  store i32 %call1, i32* %aIsSignalingNaN, align 4
  %2 = load i32, i32* %b.addr, align 4
  %call2 = call i32 @float32_is_nan(i32 %2)
  store i32 %call2, i32* %bIsNaN, align 4
  %3 = load i32, i32* %b.addr, align 4
  %call3 = call i32 @float32_is_signaling_nan(i32 %3)
  store i32 %call3, i32* %bIsSignalingNaN, align 4
  %4 = load i32, i32* %a.addr, align 4
  %or = or i32 %4, 4194304
  store i32 %or, i32* %a.addr, align 4
  %5 = load i32, i32* %b.addr, align 4
  %or4 = or i32 %5, 4194304
  store i32 %or4, i32* %b.addr, align 4
  %6 = load i32, i32* %aIsSignalingNaN, align 4
  %7 = load i32, i32* %bIsSignalingNaN, align 4
  %or5 = or i32 %6, %7
  %tobool = icmp ne i32 %or5, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @float_raise(i32 16)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %8 = load i32, i32* %bIsSignalingNaN, align 4
  %tobool6 = icmp ne i32 %8, 0
  br i1 %tobool6, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %9 = load i32, i32* %b.addr, align 4
  br label %cond.end.15

cond.false:                                       ; preds = %if.end
  %10 = load i32, i32* %aIsSignalingNaN, align 4
  %tobool7 = icmp ne i32 %10, 0
  br i1 %tobool7, label %cond.true.8, label %cond.false.9

cond.true.8:                                      ; preds = %cond.false
  %11 = load i32, i32* %a.addr, align 4
  br label %cond.end.13

cond.false.9:                                     ; preds = %cond.false
  %12 = load i32, i32* %bIsNaN, align 4
  %tobool10 = icmp ne i32 %12, 0
  br i1 %tobool10, label %cond.true.11, label %cond.false.12

cond.true.11:                                     ; preds = %cond.false.9
  %13 = load i32, i32* %b.addr, align 4
  br label %cond.end

cond.false.12:                                    ; preds = %cond.false.9
  %14 = load i32, i32* %a.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false.12, %cond.true.11
  %cond = phi i32 [ %13, %cond.true.11 ], [ %14, %cond.false.12 ]
  br label %cond.end.13

cond.end.13:                                      ; preds = %cond.end, %cond.true.8
  %cond14 = phi i32 [ %11, %cond.true.8 ], [ %cond, %cond.end ]
  br label %cond.end.15

cond.end.15:                                      ; preds = %cond.end.13, %cond.true
  %cond16 = phi i32 [ %9, %cond.true ], [ %cond14, %cond.end.13 ]
  ret i32 %cond16
}

; Function Attrs: nounwind
define i32 @float32_add(i32 %a, i32 %b) #1 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %aSign = alloca i32, align 4
  %bSign = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %call = call i32 @extractFloat32Sign(i32 %0)
  store i32 %call, i32* %aSign, align 4
  %1 = load i32, i32* %b.addr, align 4
  %call1 = call i32 @extractFloat32Sign(i32 %1)
  store i32 %call1, i32* %bSign, align 4
  %2 = load i32, i32* %aSign, align 4
  %3 = load i32, i32* %bSign, align 4
  %cmp = icmp eq i32 %2, %3
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %a.addr, align 4
  %5 = load i32, i32* %b.addr, align 4
  %6 = load i32, i32* %aSign, align 4
  %call2 = call i32 @addFloat32Sigs(i32 %4, i32 %5, i32 %6)
  store i32 %call2, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  %7 = load i32, i32* %a.addr, align 4
  %8 = load i32, i32* %b.addr, align 4
  %9 = load i32, i32* %aSign, align 4
  %call3 = call i32 @subFloat32Sigs(i32 %7, i32 %8, i32 %9)
  store i32 %call3, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval
  ret i32 %10
}

; Function Attrs: nounwind
define internal i32 @addFloat32Sigs(i32 %a, i32 %b, i32 %zSign) #1 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %zSign.addr = alloca i32, align 4
  %aExp = alloca i32, align 4
  %bExp = alloca i32, align 4
  %zExp = alloca i32, align 4
  %aSig = alloca i32, align 4
  %bSig = alloca i32, align 4
  %zSig = alloca i32, align 4
  %expDiff = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32 %zSign, i32* %zSign.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %call = call i32 @extractFloat32Frac(i32 %0)
  store i32 %call, i32* %aSig, align 4
  %1 = load i32, i32* %a.addr, align 4
  %call1 = call i32 @extractFloat32Exp(i32 %1)
  store i32 %call1, i32* %aExp, align 4
  %2 = load i32, i32* %b.addr, align 4
  %call2 = call i32 @extractFloat32Frac(i32 %2)
  store i32 %call2, i32* %bSig, align 4
  %3 = load i32, i32* %b.addr, align 4
  %call3 = call i32 @extractFloat32Exp(i32 %3)
  store i32 %call3, i32* %bExp, align 4
  %4 = load i32, i32* %aExp, align 4
  %5 = load i32, i32* %bExp, align 4
  %sub = sub nsw i32 %4, %5
  store i32 %sub, i32* %expDiff, align 4
  %6 = load i32, i32* %aSig, align 4
  %shl = shl i32 %6, 6
  store i32 %shl, i32* %aSig, align 4
  %7 = load i32, i32* %bSig, align 4
  %shl4 = shl i32 %7, 6
  store i32 %shl4, i32* %bSig, align 4
  %8 = load i32, i32* %expDiff, align 4
  %cmp = icmp slt i32 0, %8
  br i1 %cmp, label %if.then, label %if.else.13

if.then:                                          ; preds = %entry
  %9 = load i32, i32* %aExp, align 4
  %cmp5 = icmp eq i32 %9, 255
  br i1 %cmp5, label %if.then.6, label %if.end.9

if.then.6:                                        ; preds = %if.then
  %10 = load i32, i32* %aSig, align 4
  %tobool = icmp ne i32 %10, 0
  br i1 %tobool, label %if.then.7, label %if.end

if.then.7:                                        ; preds = %if.then.6
  %11 = load i32, i32* %a.addr, align 4
  %12 = load i32, i32* %b.addr, align 4
  %call8 = call i32 @propagateFloat32NaN(i32 %11, i32 %12)
  store i32 %call8, i32* %retval
  br label %return

if.end:                                           ; preds = %if.then.6
  %13 = load i32, i32* %a.addr, align 4
  store i32 %13, i32* %retval
  br label %return

if.end.9:                                         ; preds = %if.then
  %14 = load i32, i32* %bExp, align 4
  %cmp10 = icmp eq i32 %14, 0
  br i1 %cmp10, label %if.then.11, label %if.else

if.then.11:                                       ; preds = %if.end.9
  %15 = load i32, i32* %expDiff, align 4
  %dec = add nsw i32 %15, -1
  store i32 %dec, i32* %expDiff, align 4
  br label %if.end.12

if.else:                                          ; preds = %if.end.9
  %16 = load i32, i32* %bSig, align 4
  %or = or i32 %16, 536870912
  store i32 %or, i32* %bSig, align 4
  br label %if.end.12

if.end.12:                                        ; preds = %if.else, %if.then.11
  %17 = load i32, i32* %bSig, align 4
  %18 = load i32, i32* %expDiff, align 4
  call void @shift32RightJamming(i32 %17, i32 %18, i32* %bSig)
  %19 = load i32, i32* %aExp, align 4
  store i32 %19, i32* %zExp, align 4
  br label %if.end.46

if.else.13:                                       ; preds = %entry
  %20 = load i32, i32* %expDiff, align 4
  %cmp14 = icmp slt i32 %20, 0
  br i1 %cmp14, label %if.then.15, label %if.else.30

if.then.15:                                       ; preds = %if.else.13
  %21 = load i32, i32* %bExp, align 4
  %cmp16 = icmp eq i32 %21, 255
  br i1 %cmp16, label %if.then.17, label %if.end.23

if.then.17:                                       ; preds = %if.then.15
  %22 = load i32, i32* %bSig, align 4
  %tobool18 = icmp ne i32 %22, 0
  br i1 %tobool18, label %if.then.19, label %if.end.21

if.then.19:                                       ; preds = %if.then.17
  %23 = load i32, i32* %a.addr, align 4
  %24 = load i32, i32* %b.addr, align 4
  %call20 = call i32 @propagateFloat32NaN(i32 %23, i32 %24)
  store i32 %call20, i32* %retval
  br label %return

if.end.21:                                        ; preds = %if.then.17
  %25 = load i32, i32* %zSign.addr, align 4
  %call22 = call i32 @packFloat32(i32 %25, i32 255, i32 0)
  store i32 %call22, i32* %retval
  br label %return

if.end.23:                                        ; preds = %if.then.15
  %26 = load i32, i32* %aExp, align 4
  %cmp24 = icmp eq i32 %26, 0
  br i1 %cmp24, label %if.then.25, label %if.else.26

if.then.25:                                       ; preds = %if.end.23
  %27 = load i32, i32* %expDiff, align 4
  %inc = add nsw i32 %27, 1
  store i32 %inc, i32* %expDiff, align 4
  br label %if.end.28

if.else.26:                                       ; preds = %if.end.23
  %28 = load i32, i32* %aSig, align 4
  %or27 = or i32 %28, 536870912
  store i32 %or27, i32* %aSig, align 4
  br label %if.end.28

if.end.28:                                        ; preds = %if.else.26, %if.then.25
  %29 = load i32, i32* %aSig, align 4
  %30 = load i32, i32* %expDiff, align 4
  %sub29 = sub nsw i32 0, %30
  call void @shift32RightJamming(i32 %29, i32 %sub29, i32* %aSig)
  %31 = load i32, i32* %bExp, align 4
  store i32 %31, i32* %zExp, align 4
  br label %if.end.45

if.else.30:                                       ; preds = %if.else.13
  %32 = load i32, i32* %aExp, align 4
  %cmp31 = icmp eq i32 %32, 255
  br i1 %cmp31, label %if.then.32, label %if.end.38

if.then.32:                                       ; preds = %if.else.30
  %33 = load i32, i32* %aSig, align 4
  %34 = load i32, i32* %bSig, align 4
  %or33 = or i32 %33, %34
  %tobool34 = icmp ne i32 %or33, 0
  br i1 %tobool34, label %if.then.35, label %if.end.37

if.then.35:                                       ; preds = %if.then.32
  %35 = load i32, i32* %a.addr, align 4
  %36 = load i32, i32* %b.addr, align 4
  %call36 = call i32 @propagateFloat32NaN(i32 %35, i32 %36)
  store i32 %call36, i32* %retval
  br label %return

if.end.37:                                        ; preds = %if.then.32
  %37 = load i32, i32* %a.addr, align 4
  store i32 %37, i32* %retval
  br label %return

if.end.38:                                        ; preds = %if.else.30
  %38 = load i32, i32* %aExp, align 4
  %cmp39 = icmp eq i32 %38, 0
  br i1 %cmp39, label %if.then.40, label %if.end.42

if.then.40:                                       ; preds = %if.end.38
  %39 = load i32, i32* %zSign.addr, align 4
  %40 = load i32, i32* %aSig, align 4
  %41 = load i32, i32* %bSig, align 4
  %add = add i32 %40, %41
  %shr = lshr i32 %add, 6
  %call41 = call i32 @packFloat32(i32 %39, i32 0, i32 %shr)
  store i32 %call41, i32* %retval
  br label %return

if.end.42:                                        ; preds = %if.end.38
  %42 = load i32, i32* %aSig, align 4
  %add43 = add i32 1073741824, %42
  %43 = load i32, i32* %bSig, align 4
  %add44 = add i32 %add43, %43
  store i32 %add44, i32* %zSig, align 4
  %44 = load i32, i32* %aExp, align 4
  store i32 %44, i32* %zExp, align 4
  br label %roundAndPack

if.end.45:                                        ; preds = %if.end.28
  br label %if.end.46

if.end.46:                                        ; preds = %if.end.45, %if.end.12
  %45 = load i32, i32* %aSig, align 4
  %or47 = or i32 %45, 536870912
  store i32 %or47, i32* %aSig, align 4
  %46 = load i32, i32* %aSig, align 4
  %47 = load i32, i32* %bSig, align 4
  %add48 = add i32 %46, %47
  %shl49 = shl i32 %add48, 1
  store i32 %shl49, i32* %zSig, align 4
  %48 = load i32, i32* %zExp, align 4
  %dec50 = add nsw i32 %48, -1
  store i32 %dec50, i32* %zExp, align 4
  %49 = load i32, i32* %zSig, align 4
  %cmp51 = icmp slt i32 %49, 0
  br i1 %cmp51, label %if.then.52, label %if.end.55

if.then.52:                                       ; preds = %if.end.46
  %50 = load i32, i32* %aSig, align 4
  %51 = load i32, i32* %bSig, align 4
  %add53 = add i32 %50, %51
  store i32 %add53, i32* %zSig, align 4
  %52 = load i32, i32* %zExp, align 4
  %inc54 = add nsw i32 %52, 1
  store i32 %inc54, i32* %zExp, align 4
  br label %if.end.55

if.end.55:                                        ; preds = %if.then.52, %if.end.46
  br label %roundAndPack

roundAndPack:                                     ; preds = %if.end.55, %if.end.42
  %53 = load i32, i32* %zSign.addr, align 4
  %54 = load i32, i32* %zExp, align 4
  %55 = load i32, i32* %zSig, align 4
  %call56 = call i32 @roundAndPackFloat32(i32 %53, i32 %54, i32 %55)
  store i32 %call56, i32* %retval
  br label %return

return:                                           ; preds = %roundAndPack, %if.then.40, %if.end.37, %if.then.35, %if.end.21, %if.then.19, %if.end, %if.then.7
  %56 = load i32, i32* %retval
  ret i32 %56
}

; Function Attrs: nounwind
define internal i32 @subFloat32Sigs(i32 %a, i32 %b, i32 %zSign) #1 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %zSign.addr = alloca i32, align 4
  %aExp = alloca i32, align 4
  %bExp = alloca i32, align 4
  %zExp = alloca i32, align 4
  %aSig = alloca i32, align 4
  %bSig = alloca i32, align 4
  %zSig = alloca i32, align 4
  %expDiff = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32 %zSign, i32* %zSign.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %call = call i32 @extractFloat32Frac(i32 %0)
  store i32 %call, i32* %aSig, align 4
  %1 = load i32, i32* %a.addr, align 4
  %call1 = call i32 @extractFloat32Exp(i32 %1)
  store i32 %call1, i32* %aExp, align 4
  %2 = load i32, i32* %b.addr, align 4
  %call2 = call i32 @extractFloat32Frac(i32 %2)
  store i32 %call2, i32* %bSig, align 4
  %3 = load i32, i32* %b.addr, align 4
  %call3 = call i32 @extractFloat32Exp(i32 %3)
  store i32 %call3, i32* %bExp, align 4
  %4 = load i32, i32* %aExp, align 4
  %5 = load i32, i32* %bExp, align 4
  %sub = sub nsw i32 %4, %5
  store i32 %sub, i32* %expDiff, align 4
  %6 = load i32, i32* %aSig, align 4
  %shl = shl i32 %6, 7
  store i32 %shl, i32* %aSig, align 4
  %7 = load i32, i32* %bSig, align 4
  %shl4 = shl i32 %7, 7
  store i32 %shl4, i32* %bSig, align 4
  %8 = load i32, i32* %expDiff, align 4
  %cmp = icmp slt i32 0, %8
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %aExpBigger

if.end:                                           ; preds = %entry
  %9 = load i32, i32* %expDiff, align 4
  %cmp5 = icmp slt i32 %9, 0
  br i1 %cmp5, label %if.then.6, label %if.end.7

if.then.6:                                        ; preds = %if.end
  br label %bExpBigger

if.end.7:                                         ; preds = %if.end
  %10 = load i32, i32* %aExp, align 4
  %cmp8 = icmp eq i32 %10, 255
  br i1 %cmp8, label %if.then.9, label %if.end.13

if.then.9:                                        ; preds = %if.end.7
  %11 = load i32, i32* %aSig, align 4
  %12 = load i32, i32* %bSig, align 4
  %or = or i32 %11, %12
  %tobool = icmp ne i32 %or, 0
  br i1 %tobool, label %if.then.10, label %if.end.12

if.then.10:                                       ; preds = %if.then.9
  %13 = load i32, i32* %a.addr, align 4
  %14 = load i32, i32* %b.addr, align 4
  %call11 = call i32 @propagateFloat32NaN(i32 %13, i32 %14)
  store i32 %call11, i32* %retval
  br label %return

if.end.12:                                        ; preds = %if.then.9
  call void @float_raise(i32 16)
  store i32 2147483647, i32* %retval
  br label %return

if.end.13:                                        ; preds = %if.end.7
  %15 = load i32, i32* %aExp, align 4
  %cmp14 = icmp eq i32 %15, 0
  br i1 %cmp14, label %if.then.15, label %if.end.16

if.then.15:                                       ; preds = %if.end.13
  store i32 1, i32* %aExp, align 4
  store i32 1, i32* %bExp, align 4
  br label %if.end.16

if.end.16:                                        ; preds = %if.then.15, %if.end.13
  %16 = load i32, i32* %bSig, align 4
  %17 = load i32, i32* %aSig, align 4
  %cmp17 = icmp ult i32 %16, %17
  br i1 %cmp17, label %if.then.18, label %if.end.19

if.then.18:                                       ; preds = %if.end.16
  br label %aBigger

if.end.19:                                        ; preds = %if.end.16
  %18 = load i32, i32* %aSig, align 4
  %19 = load i32, i32* %bSig, align 4
  %cmp20 = icmp ult i32 %18, %19
  br i1 %cmp20, label %if.then.21, label %if.end.22

if.then.21:                                       ; preds = %if.end.19
  br label %bBigger

if.end.22:                                        ; preds = %if.end.19
  %20 = load i32, i32* @float_rounding_mode, align 4
  %cmp23 = icmp eq i32 %20, 3
  %conv = zext i1 %cmp23 to i32
  %call24 = call i32 @packFloat32(i32 %conv, i32 0, i32 0)
  store i32 %call24, i32* %retval
  br label %return

bExpBigger:                                       ; preds = %if.then.6
  %21 = load i32, i32* %bExp, align 4
  %cmp25 = icmp eq i32 %21, 255
  br i1 %cmp25, label %if.then.27, label %if.end.33

if.then.27:                                       ; preds = %bExpBigger
  %22 = load i32, i32* %bSig, align 4
  %tobool28 = icmp ne i32 %22, 0
  br i1 %tobool28, label %if.then.29, label %if.end.31

if.then.29:                                       ; preds = %if.then.27
  %23 = load i32, i32* %a.addr, align 4
  %24 = load i32, i32* %b.addr, align 4
  %call30 = call i32 @propagateFloat32NaN(i32 %23, i32 %24)
  store i32 %call30, i32* %retval
  br label %return

if.end.31:                                        ; preds = %if.then.27
  %25 = load i32, i32* %zSign.addr, align 4
  %xor = xor i32 %25, 1
  %call32 = call i32 @packFloat32(i32 %xor, i32 255, i32 0)
  store i32 %call32, i32* %retval
  br label %return

if.end.33:                                        ; preds = %bExpBigger
  %26 = load i32, i32* %aExp, align 4
  %cmp34 = icmp eq i32 %26, 0
  br i1 %cmp34, label %if.then.36, label %if.else

if.then.36:                                       ; preds = %if.end.33
  %27 = load i32, i32* %expDiff, align 4
  %inc = add nsw i32 %27, 1
  store i32 %inc, i32* %expDiff, align 4
  br label %if.end.38

if.else:                                          ; preds = %if.end.33
  %28 = load i32, i32* %aSig, align 4
  %or37 = or i32 %28, 1073741824
  store i32 %or37, i32* %aSig, align 4
  br label %if.end.38

if.end.38:                                        ; preds = %if.else, %if.then.36
  %29 = load i32, i32* %aSig, align 4
  %30 = load i32, i32* %expDiff, align 4
  %sub39 = sub nsw i32 0, %30
  call void @shift32RightJamming(i32 %29, i32 %sub39, i32* %aSig)
  %31 = load i32, i32* %bSig, align 4
  %or40 = or i32 %31, 1073741824
  store i32 %or40, i32* %bSig, align 4
  br label %bBigger

bBigger:                                          ; preds = %if.end.38, %if.then.21
  %32 = load i32, i32* %bSig, align 4
  %33 = load i32, i32* %aSig, align 4
  %sub41 = sub i32 %32, %33
  store i32 %sub41, i32* %zSig, align 4
  %34 = load i32, i32* %bExp, align 4
  store i32 %34, i32* %zExp, align 4
  %35 = load i32, i32* %zSign.addr, align 4
  %xor42 = xor i32 %35, 1
  store i32 %xor42, i32* %zSign.addr, align 4
  br label %normalizeRoundAndPack

aExpBigger:                                       ; preds = %if.then
  %36 = load i32, i32* %aExp, align 4
  %cmp43 = icmp eq i32 %36, 255
  br i1 %cmp43, label %if.then.45, label %if.end.50

if.then.45:                                       ; preds = %aExpBigger
  %37 = load i32, i32* %aSig, align 4
  %tobool46 = icmp ne i32 %37, 0
  br i1 %tobool46, label %if.then.47, label %if.end.49

if.then.47:                                       ; preds = %if.then.45
  %38 = load i32, i32* %a.addr, align 4
  %39 = load i32, i32* %b.addr, align 4
  %call48 = call i32 @propagateFloat32NaN(i32 %38, i32 %39)
  store i32 %call48, i32* %retval
  br label %return

if.end.49:                                        ; preds = %if.then.45
  %40 = load i32, i32* %a.addr, align 4
  store i32 %40, i32* %retval
  br label %return

if.end.50:                                        ; preds = %aExpBigger
  %41 = load i32, i32* %bExp, align 4
  %cmp51 = icmp eq i32 %41, 0
  br i1 %cmp51, label %if.then.53, label %if.else.54

if.then.53:                                       ; preds = %if.end.50
  %42 = load i32, i32* %expDiff, align 4
  %dec = add nsw i32 %42, -1
  store i32 %dec, i32* %expDiff, align 4
  br label %if.end.56

if.else.54:                                       ; preds = %if.end.50
  %43 = load i32, i32* %bSig, align 4
  %or55 = or i32 %43, 1073741824
  store i32 %or55, i32* %bSig, align 4
  br label %if.end.56

if.end.56:                                        ; preds = %if.else.54, %if.then.53
  %44 = load i32, i32* %bSig, align 4
  %45 = load i32, i32* %expDiff, align 4
  call void @shift32RightJamming(i32 %44, i32 %45, i32* %bSig)
  %46 = load i32, i32* %aSig, align 4
  %or57 = or i32 %46, 1073741824
  store i32 %or57, i32* %aSig, align 4
  br label %aBigger

aBigger:                                          ; preds = %if.end.56, %if.then.18
  %47 = load i32, i32* %aSig, align 4
  %48 = load i32, i32* %bSig, align 4
  %sub58 = sub i32 %47, %48
  store i32 %sub58, i32* %zSig, align 4
  %49 = load i32, i32* %aExp, align 4
  store i32 %49, i32* %zExp, align 4
  br label %normalizeRoundAndPack

normalizeRoundAndPack:                            ; preds = %aBigger, %bBigger
  %50 = load i32, i32* %zExp, align 4
  %dec59 = add nsw i32 %50, -1
  store i32 %dec59, i32* %zExp, align 4
  %51 = load i32, i32* %zSign.addr, align 4
  %52 = load i32, i32* %zExp, align 4
  %53 = load i32, i32* %zSig, align 4
  %call60 = call i32 @normalizeRoundAndPackFloat32(i32 %51, i32 %52, i32 %53)
  store i32 %call60, i32* %retval
  br label %return

return:                                           ; preds = %normalizeRoundAndPack, %if.end.49, %if.then.47, %if.end.31, %if.then.29, %if.end.22, %if.end.12, %if.then.10
  %54 = load i32, i32* %retval
  ret i32 %54
}

; Function Attrs: nounwind
define i32 @float32_sub(i32 %a, i32 %b) #1 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %aSign = alloca i32, align 4
  %bSign = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %call = call i32 @extractFloat32Sign(i32 %0)
  store i32 %call, i32* %aSign, align 4
  %1 = load i32, i32* %b.addr, align 4
  %call1 = call i32 @extractFloat32Sign(i32 %1)
  store i32 %call1, i32* %bSign, align 4
  %2 = load i32, i32* %aSign, align 4
  %3 = load i32, i32* %bSign, align 4
  %cmp = icmp eq i32 %2, %3
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %a.addr, align 4
  %5 = load i32, i32* %b.addr, align 4
  %6 = load i32, i32* %aSign, align 4
  %call2 = call i32 @subFloat32Sigs(i32 %4, i32 %5, i32 %6)
  store i32 %call2, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  %7 = load i32, i32* %a.addr, align 4
  %8 = load i32, i32* %b.addr, align 4
  %9 = load i32, i32* %aSign, align 4
  %call3 = call i32 @addFloat32Sigs(i32 %7, i32 %8, i32 %9)
  store i32 %call3, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval
  ret i32 %10
}

; Function Attrs: nounwind
define i32 @float32_mul(i32 %a, i32 %b) #1 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %aSign = alloca i32, align 4
  %bSign = alloca i32, align 4
  %zSign = alloca i32, align 4
  %aExp = alloca i32, align 4
  %bExp = alloca i32, align 4
  %zExp = alloca i32, align 4
  %aSig = alloca i32, align 4
  %bSig = alloca i32, align 4
  %zSig0 = alloca i32, align 4
  %zSig1 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %call = call i32 @extractFloat32Frac(i32 %0)
  store i32 %call, i32* %aSig, align 4
  %1 = load i32, i32* %a.addr, align 4
  %call1 = call i32 @extractFloat32Exp(i32 %1)
  store i32 %call1, i32* %aExp, align 4
  %2 = load i32, i32* %a.addr, align 4
  %call2 = call i32 @extractFloat32Sign(i32 %2)
  store i32 %call2, i32* %aSign, align 4
  %3 = load i32, i32* %b.addr, align 4
  %call3 = call i32 @extractFloat32Frac(i32 %3)
  store i32 %call3, i32* %bSig, align 4
  %4 = load i32, i32* %b.addr, align 4
  %call4 = call i32 @extractFloat32Exp(i32 %4)
  store i32 %call4, i32* %bExp, align 4
  %5 = load i32, i32* %b.addr, align 4
  %call5 = call i32 @extractFloat32Sign(i32 %5)
  store i32 %call5, i32* %bSign, align 4
  %6 = load i32, i32* %aSign, align 4
  %7 = load i32, i32* %bSign, align 4
  %xor = xor i32 %6, %7
  store i32 %xor, i32* %zSign, align 4
  %8 = load i32, i32* %aExp, align 4
  %cmp = icmp eq i32 %8, 255
  br i1 %cmp, label %if.then, label %if.end.14

if.then:                                          ; preds = %entry
  %9 = load i32, i32* %aSig, align 4
  %tobool = icmp ne i32 %9, 0
  br i1 %tobool, label %if.then.8, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then
  %10 = load i32, i32* %bExp, align 4
  %cmp6 = icmp eq i32 %10, 255
  br i1 %cmp6, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %lor.lhs.false
  %11 = load i32, i32* %bSig, align 4
  %tobool7 = icmp ne i32 %11, 0
  br i1 %tobool7, label %if.then.8, label %if.end

if.then.8:                                        ; preds = %land.lhs.true, %if.then
  %12 = load i32, i32* %a.addr, align 4
  %13 = load i32, i32* %b.addr, align 4
  %call9 = call i32 @propagateFloat32NaN(i32 %12, i32 %13)
  store i32 %call9, i32* %retval
  br label %return

if.end:                                           ; preds = %land.lhs.true, %lor.lhs.false
  %14 = load i32, i32* %bExp, align 4
  %15 = load i32, i32* %bSig, align 4
  %or = or i32 %14, %15
  %cmp10 = icmp eq i32 %or, 0
  br i1 %cmp10, label %if.then.11, label %if.end.12

if.then.11:                                       ; preds = %if.end
  call void @float_raise(i32 16)
  store i32 2147483647, i32* %retval
  br label %return

if.end.12:                                        ; preds = %if.end
  %16 = load i32, i32* %zSign, align 4
  %call13 = call i32 @packFloat32(i32 %16, i32 255, i32 0)
  store i32 %call13, i32* %retval
  br label %return

if.end.14:                                        ; preds = %entry
  %17 = load i32, i32* %bExp, align 4
  %cmp15 = icmp eq i32 %17, 255
  br i1 %cmp15, label %if.then.16, label %if.end.26

if.then.16:                                       ; preds = %if.end.14
  %18 = load i32, i32* %bSig, align 4
  %tobool17 = icmp ne i32 %18, 0
  br i1 %tobool17, label %if.then.18, label %if.end.20

if.then.18:                                       ; preds = %if.then.16
  %19 = load i32, i32* %a.addr, align 4
  %20 = load i32, i32* %b.addr, align 4
  %call19 = call i32 @propagateFloat32NaN(i32 %19, i32 %20)
  store i32 %call19, i32* %retval
  br label %return

if.end.20:                                        ; preds = %if.then.16
  %21 = load i32, i32* %aExp, align 4
  %22 = load i32, i32* %aSig, align 4
  %or21 = or i32 %21, %22
  %cmp22 = icmp eq i32 %or21, 0
  br i1 %cmp22, label %if.then.23, label %if.end.24

if.then.23:                                       ; preds = %if.end.20
  call void @float_raise(i32 16)
  store i32 2147483647, i32* %retval
  br label %return

if.end.24:                                        ; preds = %if.end.20
  %23 = load i32, i32* %zSign, align 4
  %call25 = call i32 @packFloat32(i32 %23, i32 255, i32 0)
  store i32 %call25, i32* %retval
  br label %return

if.end.26:                                        ; preds = %if.end.14
  %24 = load i32, i32* %aExp, align 4
  %cmp27 = icmp eq i32 %24, 0
  br i1 %cmp27, label %if.then.28, label %if.end.33

if.then.28:                                       ; preds = %if.end.26
  %25 = load i32, i32* %aSig, align 4
  %cmp29 = icmp eq i32 %25, 0
  br i1 %cmp29, label %if.then.30, label %if.end.32

if.then.30:                                       ; preds = %if.then.28
  %26 = load i32, i32* %zSign, align 4
  %call31 = call i32 @packFloat32(i32 %26, i32 0, i32 0)
  store i32 %call31, i32* %retval
  br label %return

if.end.32:                                        ; preds = %if.then.28
  %27 = load i32, i32* %aSig, align 4
  call void @normalizeFloat32Subnormal(i32 %27, i32* %aExp, i32* %aSig)
  br label %if.end.33

if.end.33:                                        ; preds = %if.end.32, %if.end.26
  %28 = load i32, i32* %bExp, align 4
  %cmp34 = icmp eq i32 %28, 0
  br i1 %cmp34, label %if.then.35, label %if.end.40

if.then.35:                                       ; preds = %if.end.33
  %29 = load i32, i32* %bSig, align 4
  %cmp36 = icmp eq i32 %29, 0
  br i1 %cmp36, label %if.then.37, label %if.end.39

if.then.37:                                       ; preds = %if.then.35
  %30 = load i32, i32* %zSign, align 4
  %call38 = call i32 @packFloat32(i32 %30, i32 0, i32 0)
  store i32 %call38, i32* %retval
  br label %return

if.end.39:                                        ; preds = %if.then.35
  %31 = load i32, i32* %bSig, align 4
  call void @normalizeFloat32Subnormal(i32 %31, i32* %bExp, i32* %bSig)
  br label %if.end.40

if.end.40:                                        ; preds = %if.end.39, %if.end.33
  %32 = load i32, i32* %aExp, align 4
  %33 = load i32, i32* %bExp, align 4
  %add = add nsw i32 %32, %33
  %sub = sub nsw i32 %add, 127
  store i32 %sub, i32* %zExp, align 4
  %34 = load i32, i32* %aSig, align 4
  %or41 = or i32 %34, 8388608
  %shl = shl i32 %or41, 7
  store i32 %shl, i32* %aSig, align 4
  %35 = load i32, i32* %bSig, align 4
  %or42 = or i32 %35, 8388608
  %shl43 = shl i32 %or42, 8
  store i32 %shl43, i32* %bSig, align 4
  %36 = load i32, i32* %aSig, align 4
  %37 = load i32, i32* %bSig, align 4
  call void @mul32To64(i32 %36, i32 %37, i32* %zSig0, i32* %zSig1)
  %38 = load i32, i32* %zSig1, align 4
  %cmp44 = icmp ne i32 %38, 0
  %conv = zext i1 %cmp44 to i32
  %39 = load i32, i32* %zSig0, align 4
  %or45 = or i32 %39, %conv
  store i32 %or45, i32* %zSig0, align 4
  %40 = load i32, i32* %zSig0, align 4
  %shl46 = shl i32 %40, 1
  %cmp47 = icmp sle i32 0, %shl46
  br i1 %cmp47, label %if.then.49, label %if.end.51

if.then.49:                                       ; preds = %if.end.40
  %41 = load i32, i32* %zSig0, align 4
  %shl50 = shl i32 %41, 1
  store i32 %shl50, i32* %zSig0, align 4
  %42 = load i32, i32* %zExp, align 4
  %dec = add nsw i32 %42, -1
  store i32 %dec, i32* %zExp, align 4
  br label %if.end.51

if.end.51:                                        ; preds = %if.then.49, %if.end.40
  %43 = load i32, i32* %zSign, align 4
  %44 = load i32, i32* %zExp, align 4
  %45 = load i32, i32* %zSig0, align 4
  %call52 = call i32 @roundAndPackFloat32(i32 %43, i32 %44, i32 %45)
  store i32 %call52, i32* %retval
  br label %return

return:                                           ; preds = %if.end.51, %if.then.37, %if.then.30, %if.end.24, %if.then.23, %if.then.18, %if.end.12, %if.then.11, %if.then.8
  %46 = load i32, i32* %retval
  ret i32 %46
}

; Function Attrs: nounwind
define internal i32 @roundAndPackFloat32(i32 %zSign, i32 %zExp, i32 %zSig) #1 {
entry:
  %retval = alloca i32, align 4
  %zSign.addr = alloca i32, align 4
  %zExp.addr = alloca i32, align 4
  %zSig.addr = alloca i32, align 4
  %roundingMode = alloca i32, align 4
  %roundNearestEven = alloca i32, align 4
  %roundIncrement = alloca i32, align 4
  %roundBits = alloca i32, align 4
  %isTiny = alloca i32, align 4
  store i32 %zSign, i32* %zSign.addr, align 4
  store i32 %zExp, i32* %zExp.addr, align 4
  store i32 %zSig, i32* %zSig.addr, align 4
  %0 = load i32, i32* @float_rounding_mode, align 4
  store i32 %0, i32* %roundingMode, align 4
  %1 = load i32, i32* %roundingMode, align 4
  %cmp = icmp eq i32 %1, 0
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* %roundNearestEven, align 4
  store i32 64, i32* %roundIncrement, align 4
  %2 = load i32, i32* %roundNearestEven, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.end.16, label %if.then

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %roundingMode, align 4
  %cmp1 = icmp eq i32 %3, 1
  br i1 %cmp1, label %if.then.3, label %if.else

if.then.3:                                        ; preds = %if.then
  store i32 0, i32* %roundIncrement, align 4
  br label %if.end.15

if.else:                                          ; preds = %if.then
  store i32 127, i32* %roundIncrement, align 4
  %4 = load i32, i32* %zSign.addr, align 4
  %tobool4 = icmp ne i32 %4, 0
  br i1 %tobool4, label %if.then.5, label %if.else.9

if.then.5:                                        ; preds = %if.else
  %5 = load i32, i32* %roundingMode, align 4
  %cmp6 = icmp eq i32 %5, 2
  br i1 %cmp6, label %if.then.8, label %if.end

if.then.8:                                        ; preds = %if.then.5
  store i32 0, i32* %roundIncrement, align 4
  br label %if.end

if.end:                                           ; preds = %if.then.8, %if.then.5
  br label %if.end.14

if.else.9:                                        ; preds = %if.else
  %6 = load i32, i32* %roundingMode, align 4
  %cmp10 = icmp eq i32 %6, 3
  br i1 %cmp10, label %if.then.12, label %if.end.13

if.then.12:                                       ; preds = %if.else.9
  store i32 0, i32* %roundIncrement, align 4
  br label %if.end.13

if.end.13:                                        ; preds = %if.then.12, %if.else.9
  br label %if.end.14

if.end.14:                                        ; preds = %if.end.13, %if.end
  br label %if.end.15

if.end.15:                                        ; preds = %if.end.14, %if.then.3
  br label %if.end.16

if.end.16:                                        ; preds = %if.end.15, %entry
  %7 = load i32, i32* %zSig.addr, align 4
  %and = and i32 %7, 127
  store i32 %and, i32* %roundBits, align 4
  %8 = load i32, i32* %zExp.addr, align 4
  %conv17 = trunc i32 %8 to i16
  %conv18 = zext i16 %conv17 to i32
  %cmp19 = icmp sle i32 253, %conv18
  br i1 %cmp19, label %if.then.21, label %if.end.51

if.then.21:                                       ; preds = %if.end.16
  %9 = load i32, i32* %zExp.addr, align 4
  %cmp22 = icmp slt i32 253, %9
  br i1 %cmp22, label %if.then.28, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then.21
  %10 = load i32, i32* %zExp.addr, align 4
  %cmp24 = icmp eq i32 %10, 253
  br i1 %cmp24, label %land.lhs.true, label %if.end.31

land.lhs.true:                                    ; preds = %lor.lhs.false
  %11 = load i32, i32* %zSig.addr, align 4
  %12 = load i32, i32* %roundIncrement, align 4
  %add = add i32 %11, %12
  %cmp26 = icmp slt i32 %add, 0
  br i1 %cmp26, label %if.then.28, label %if.end.31

if.then.28:                                       ; preds = %land.lhs.true, %if.then.21
  call void @float_raise(i32 9)
  %13 = load i32, i32* %zSign.addr, align 4
  %call = call i32 @packFloat32(i32 %13, i32 255, i32 0)
  %14 = load i32, i32* %roundIncrement, align 4
  %cmp29 = icmp eq i32 %14, 0
  %conv30 = zext i1 %cmp29 to i32
  %sub = sub i32 %call, %conv30
  store i32 %sub, i32* %retval
  br label %return

if.end.31:                                        ; preds = %land.lhs.true, %lor.lhs.false
  %15 = load i32, i32* %zExp.addr, align 4
  %cmp32 = icmp slt i32 %15, 0
  br i1 %cmp32, label %if.then.34, label %if.end.50

if.then.34:                                       ; preds = %if.end.31
  %16 = load i32, i32* @float_detect_tininess, align 4
  %cmp35 = icmp eq i32 %16, 1
  br i1 %cmp35, label %lor.end, label %lor.lhs.false.37

lor.lhs.false.37:                                 ; preds = %if.then.34
  %17 = load i32, i32* %zExp.addr, align 4
  %cmp38 = icmp slt i32 %17, -1
  br i1 %cmp38, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %lor.lhs.false.37
  %18 = load i32, i32* %zSig.addr, align 4
  %19 = load i32, i32* %roundIncrement, align 4
  %add40 = add i32 %18, %19
  %cmp41 = icmp ult i32 %add40, -2147483648
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %lor.lhs.false.37, %if.then.34
  %20 = phi i1 [ true, %lor.lhs.false.37 ], [ true, %if.then.34 ], [ %cmp41, %lor.rhs ]
  %lor.ext = zext i1 %20 to i32
  store i32 %lor.ext, i32* %isTiny, align 4
  %21 = load i32, i32* %zSig.addr, align 4
  %22 = load i32, i32* %zExp.addr, align 4
  %sub43 = sub nsw i32 0, %22
  call void @shift32RightJamming(i32 %21, i32 %sub43, i32* %zSig.addr)
  store i32 0, i32* %zExp.addr, align 4
  %23 = load i32, i32* %zSig.addr, align 4
  %and44 = and i32 %23, 127
  store i32 %and44, i32* %roundBits, align 4
  %24 = load i32, i32* %isTiny, align 4
  %tobool45 = icmp ne i32 %24, 0
  br i1 %tobool45, label %land.lhs.true.46, label %if.end.49

land.lhs.true.46:                                 ; preds = %lor.end
  %25 = load i32, i32* %roundBits, align 4
  %tobool47 = icmp ne i32 %25, 0
  br i1 %tobool47, label %if.then.48, label %if.end.49

if.then.48:                                       ; preds = %land.lhs.true.46
  call void @float_raise(i32 4)
  br label %if.end.49

if.end.49:                                        ; preds = %if.then.48, %land.lhs.true.46, %lor.end
  br label %if.end.50

if.end.50:                                        ; preds = %if.end.49, %if.end.31
  br label %if.end.51

if.end.51:                                        ; preds = %if.end.50, %if.end.16
  %26 = load i32, i32* %roundBits, align 4
  %tobool52 = icmp ne i32 %26, 0
  br i1 %tobool52, label %if.then.53, label %if.end.54

if.then.53:                                       ; preds = %if.end.51
  %27 = load i32, i32* @float_exception_flags, align 4
  %or = or i32 %27, 1
  store i32 %or, i32* @float_exception_flags, align 4
  br label %if.end.54

if.end.54:                                        ; preds = %if.then.53, %if.end.51
  %28 = load i32, i32* %zSig.addr, align 4
  %29 = load i32, i32* %roundIncrement, align 4
  %add55 = add i32 %28, %29
  %shr = lshr i32 %add55, 7
  store i32 %shr, i32* %zSig.addr, align 4
  %30 = load i32, i32* %roundBits, align 4
  %xor = xor i32 %30, 64
  %cmp56 = icmp eq i32 %xor, 0
  %conv57 = zext i1 %cmp56 to i32
  %31 = load i32, i32* %roundNearestEven, align 4
  %and58 = and i32 %conv57, %31
  %neg = xor i32 %and58, -1
  %32 = load i32, i32* %zSig.addr, align 4
  %and59 = and i32 %32, %neg
  store i32 %and59, i32* %zSig.addr, align 4
  %33 = load i32, i32* %zSig.addr, align 4
  %cmp60 = icmp eq i32 %33, 0
  br i1 %cmp60, label %if.then.62, label %if.end.63

if.then.62:                                       ; preds = %if.end.54
  store i32 0, i32* %zExp.addr, align 4
  br label %if.end.63

if.end.63:                                        ; preds = %if.then.62, %if.end.54
  %34 = load i32, i32* %zSign.addr, align 4
  %35 = load i32, i32* %zExp.addr, align 4
  %36 = load i32, i32* %zSig.addr, align 4
  %call64 = call i32 @packFloat32(i32 %34, i32 %35, i32 %36)
  store i32 %call64, i32* %retval
  br label %return

return:                                           ; preds = %if.end.63, %if.then.28
  %37 = load i32, i32* %retval
  ret i32 %37
}

; Function Attrs: nounwind
define i32 @float32_div(i32 %a, i32 %b) #1 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %aSign = alloca i32, align 4
  %bSign = alloca i32, align 4
  %zSign = alloca i32, align 4
  %aExp = alloca i32, align 4
  %bExp = alloca i32, align 4
  %zExp = alloca i32, align 4
  %aSig = alloca i32, align 4
  %bSig = alloca i32, align 4
  %zSig = alloca i32, align 4
  %rem0 = alloca i32, align 4
  %rem1 = alloca i32, align 4
  %term0 = alloca i32, align 4
  %term1 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %call = call i32 @extractFloat32Frac(i32 %0)
  store i32 %call, i32* %aSig, align 4
  %1 = load i32, i32* %a.addr, align 4
  %call1 = call i32 @extractFloat32Exp(i32 %1)
  store i32 %call1, i32* %aExp, align 4
  %2 = load i32, i32* %a.addr, align 4
  %call2 = call i32 @extractFloat32Sign(i32 %2)
  store i32 %call2, i32* %aSign, align 4
  %3 = load i32, i32* %b.addr, align 4
  %call3 = call i32 @extractFloat32Frac(i32 %3)
  store i32 %call3, i32* %bSig, align 4
  %4 = load i32, i32* %b.addr, align 4
  %call4 = call i32 @extractFloat32Exp(i32 %4)
  store i32 %call4, i32* %bExp, align 4
  %5 = load i32, i32* %b.addr, align 4
  %call5 = call i32 @extractFloat32Sign(i32 %5)
  store i32 %call5, i32* %bSign, align 4
  %6 = load i32, i32* %aSign, align 4
  %7 = load i32, i32* %bSign, align 4
  %xor = xor i32 %6, %7
  store i32 %xor, i32* %zSign, align 4
  %8 = load i32, i32* %aExp, align 4
  %cmp = icmp eq i32 %8, 255
  br i1 %cmp, label %if.then, label %if.end.16

if.then:                                          ; preds = %entry
  %9 = load i32, i32* %aSig, align 4
  %tobool = icmp ne i32 %9, 0
  br i1 %tobool, label %if.then.6, label %if.end

if.then.6:                                        ; preds = %if.then
  %10 = load i32, i32* %a.addr, align 4
  %11 = load i32, i32* %b.addr, align 4
  %call7 = call i32 @propagateFloat32NaN(i32 %10, i32 %11)
  store i32 %call7, i32* %retval
  br label %return

if.end:                                           ; preds = %if.then
  %12 = load i32, i32* %bExp, align 4
  %cmp8 = icmp eq i32 %12, 255
  br i1 %cmp8, label %if.then.9, label %if.end.14

if.then.9:                                        ; preds = %if.end
  %13 = load i32, i32* %bSig, align 4
  %tobool10 = icmp ne i32 %13, 0
  br i1 %tobool10, label %if.then.11, label %if.end.13

if.then.11:                                       ; preds = %if.then.9
  %14 = load i32, i32* %a.addr, align 4
  %15 = load i32, i32* %b.addr, align 4
  %call12 = call i32 @propagateFloat32NaN(i32 %14, i32 %15)
  store i32 %call12, i32* %retval
  br label %return

if.end.13:                                        ; preds = %if.then.9
  call void @float_raise(i32 16)
  store i32 2147483647, i32* %retval
  br label %return

if.end.14:                                        ; preds = %if.end
  %16 = load i32, i32* %zSign, align 4
  %call15 = call i32 @packFloat32(i32 %16, i32 255, i32 0)
  store i32 %call15, i32* %retval
  br label %return

if.end.16:                                        ; preds = %entry
  %17 = load i32, i32* %bExp, align 4
  %cmp17 = icmp eq i32 %17, 255
  br i1 %cmp17, label %if.then.18, label %if.end.24

if.then.18:                                       ; preds = %if.end.16
  %18 = load i32, i32* %bSig, align 4
  %tobool19 = icmp ne i32 %18, 0
  br i1 %tobool19, label %if.then.20, label %if.end.22

if.then.20:                                       ; preds = %if.then.18
  %19 = load i32, i32* %a.addr, align 4
  %20 = load i32, i32* %b.addr, align 4
  %call21 = call i32 @propagateFloat32NaN(i32 %19, i32 %20)
  store i32 %call21, i32* %retval
  br label %return

if.end.22:                                        ; preds = %if.then.18
  %21 = load i32, i32* %zSign, align 4
  %call23 = call i32 @packFloat32(i32 %21, i32 0, i32 0)
  store i32 %call23, i32* %retval
  br label %return

if.end.24:                                        ; preds = %if.end.16
  %22 = load i32, i32* %bExp, align 4
  %cmp25 = icmp eq i32 %22, 0
  br i1 %cmp25, label %if.then.26, label %if.end.34

if.then.26:                                       ; preds = %if.end.24
  %23 = load i32, i32* %bSig, align 4
  %cmp27 = icmp eq i32 %23, 0
  br i1 %cmp27, label %if.then.28, label %if.end.33

if.then.28:                                       ; preds = %if.then.26
  %24 = load i32, i32* %aExp, align 4
  %25 = load i32, i32* %aSig, align 4
  %or = or i32 %24, %25
  %cmp29 = icmp eq i32 %or, 0
  br i1 %cmp29, label %if.then.30, label %if.end.31

if.then.30:                                       ; preds = %if.then.28
  call void @float_raise(i32 16)
  store i32 2147483647, i32* %retval
  br label %return

if.end.31:                                        ; preds = %if.then.28
  call void @float_raise(i32 2)
  %26 = load i32, i32* %zSign, align 4
  %call32 = call i32 @packFloat32(i32 %26, i32 255, i32 0)
  store i32 %call32, i32* %retval
  br label %return

if.end.33:                                        ; preds = %if.then.26
  %27 = load i32, i32* %bSig, align 4
  call void @normalizeFloat32Subnormal(i32 %27, i32* %bExp, i32* %bSig)
  br label %if.end.34

if.end.34:                                        ; preds = %if.end.33, %if.end.24
  %28 = load i32, i32* %aExp, align 4
  %cmp35 = icmp eq i32 %28, 0
  br i1 %cmp35, label %if.then.36, label %if.end.41

if.then.36:                                       ; preds = %if.end.34
  %29 = load i32, i32* %aSig, align 4
  %cmp37 = icmp eq i32 %29, 0
  br i1 %cmp37, label %if.then.38, label %if.end.40

if.then.38:                                       ; preds = %if.then.36
  %30 = load i32, i32* %zSign, align 4
  %call39 = call i32 @packFloat32(i32 %30, i32 0, i32 0)
  store i32 %call39, i32* %retval
  br label %return

if.end.40:                                        ; preds = %if.then.36
  %31 = load i32, i32* %aSig, align 4
  call void @normalizeFloat32Subnormal(i32 %31, i32* %aExp, i32* %aSig)
  br label %if.end.41

if.end.41:                                        ; preds = %if.end.40, %if.end.34
  %32 = load i32, i32* %aExp, align 4
  %33 = load i32, i32* %bExp, align 4
  %sub = sub nsw i32 %32, %33
  %add = add nsw i32 %sub, 125
  store i32 %add, i32* %zExp, align 4
  %34 = load i32, i32* %aSig, align 4
  %or42 = or i32 %34, 8388608
  %shl = shl i32 %or42, 7
  store i32 %shl, i32* %aSig, align 4
  %35 = load i32, i32* %bSig, align 4
  %or43 = or i32 %35, 8388608
  %shl44 = shl i32 %or43, 8
  store i32 %shl44, i32* %bSig, align 4
  %36 = load i32, i32* %bSig, align 4
  %37 = load i32, i32* %aSig, align 4
  %38 = load i32, i32* %aSig, align 4
  %add45 = add i32 %37, %38
  %cmp46 = icmp ule i32 %36, %add45
  br i1 %cmp46, label %if.then.47, label %if.end.48

if.then.47:                                       ; preds = %if.end.41
  %39 = load i32, i32* %aSig, align 4
  %shr = lshr i32 %39, 1
  store i32 %shr, i32* %aSig, align 4
  %40 = load i32, i32* %zExp, align 4
  %inc = add nsw i32 %40, 1
  store i32 %inc, i32* %zExp, align 4
  br label %if.end.48

if.end.48:                                        ; preds = %if.then.47, %if.end.41
  %41 = load i32, i32* %aSig, align 4
  %42 = load i32, i32* %bSig, align 4
  %call49 = call i32 @estimateDiv64To32(i32 %41, i32 0, i32 %42)
  store i32 %call49, i32* %zSig, align 4
  %43 = load i32, i32* %zSig, align 4
  %and = and i32 %43, 63
  %cmp50 = icmp ule i32 %and, 2
  br i1 %cmp50, label %if.then.51, label %if.end.55

if.then.51:                                       ; preds = %if.end.48
  %44 = load i32, i32* %bSig, align 4
  %45 = load i32, i32* %zSig, align 4
  call void @mul32To64(i32 %44, i32 %45, i32* %term0, i32* %term1)
  %46 = load i32, i32* %aSig, align 4
  %47 = load i32, i32* %term0, align 4
  %48 = load i32, i32* %term1, align 4
  call void @sub64(i32 %46, i32 0, i32 %47, i32 %48, i32* %rem0, i32* %rem1)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.then.51
  %49 = load i32, i32* %rem0, align 4
  %cmp52 = icmp slt i32 %49, 0
  br i1 %cmp52, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %50 = load i32, i32* %zSig, align 4
  %dec = add i32 %50, -1
  store i32 %dec, i32* %zSig, align 4
  %51 = load i32, i32* %rem0, align 4
  %52 = load i32, i32* %rem1, align 4
  %53 = load i32, i32* %bSig, align 4
  call void @add64(i32 %51, i32 %52, i32 0, i32 %53, i32* %rem0, i32* %rem1)
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %54 = load i32, i32* %rem1, align 4
  %cmp53 = icmp ne i32 %54, 0
  %conv = zext i1 %cmp53 to i32
  %55 = load i32, i32* %zSig, align 4
  %or54 = or i32 %55, %conv
  store i32 %or54, i32* %zSig, align 4
  br label %if.end.55

if.end.55:                                        ; preds = %while.end, %if.end.48
  %56 = load i32, i32* %zSign, align 4
  %57 = load i32, i32* %zExp, align 4
  %58 = load i32, i32* %zSig, align 4
  %call56 = call i32 @roundAndPackFloat32(i32 %56, i32 %57, i32 %58)
  store i32 %call56, i32* %retval
  br label %return

return:                                           ; preds = %if.end.55, %if.then.38, %if.end.31, %if.then.30, %if.end.22, %if.then.20, %if.end.14, %if.end.13, %if.then.11, %if.then.6
  %59 = load i32, i32* %retval
  ret i32 %59
}

; Function Attrs: nounwind
define internal i32 @estimateDiv64To32(i32 %a0, i32 %a1, i32 %b) #1 {
entry:
  %retval = alloca i32, align 4
  %a0.addr = alloca i32, align 4
  %a1.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %b0 = alloca i32, align 4
  %b1 = alloca i32, align 4
  %rem0 = alloca i32, align 4
  %rem1 = alloca i32, align 4
  %term0 = alloca i32, align 4
  %term1 = alloca i32, align 4
  %z = alloca i32, align 4
  store i32 %a0, i32* %a0.addr, align 4
  store i32 %a1, i32* %a1.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32, i32* %b.addr, align 4
  %1 = load i32, i32* %a0.addr, align 4
  %cmp = icmp ule i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %2 = load i32, i32* %b.addr, align 4
  %shr = lshr i32 %2, 16
  store i32 %shr, i32* %b0, align 4
  %3 = load i32, i32* %b0, align 4
  %shl = shl i32 %3, 16
  %4 = load i32, i32* %a0.addr, align 4
  %cmp1 = icmp ule i32 %shl, %4
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %5 = load i32, i32* %a0.addr, align 4
  %6 = load i32, i32* %b0, align 4
  %div = udiv i32 %5, %6
  %shl2 = shl i32 %div, 16
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ -65536, %cond.true ], [ %shl2, %cond.false ]
  store i32 %cond, i32* %z, align 4
  %7 = load i32, i32* %b.addr, align 4
  %8 = load i32, i32* %z, align 4
  call void @mul32To64(i32 %7, i32 %8, i32* %term0, i32* %term1)
  %9 = load i32, i32* %a0.addr, align 4
  %10 = load i32, i32* %a1.addr, align 4
  %11 = load i32, i32* %term0, align 4
  %12 = load i32, i32* %term1, align 4
  call void @sub64(i32 %9, i32 %10, i32 %11, i32 %12, i32* %rem0, i32* %rem1)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %cond.end
  %13 = load i32, i32* %rem0, align 4
  %cmp3 = icmp slt i32 %13, 0
  br i1 %cmp3, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %14 = load i32, i32* %z, align 4
  %sub = sub i32 %14, 65536
  store i32 %sub, i32* %z, align 4
  %15 = load i32, i32* %b.addr, align 4
  %shl4 = shl i32 %15, 16
  store i32 %shl4, i32* %b1, align 4
  %16 = load i32, i32* %rem0, align 4
  %17 = load i32, i32* %rem1, align 4
  %18 = load i32, i32* %b0, align 4
  %19 = load i32, i32* %b1, align 4
  call void @add64(i32 %16, i32 %17, i32 %18, i32 %19, i32* %rem0, i32* %rem1)
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %20 = load i32, i32* %rem0, align 4
  %shl5 = shl i32 %20, 16
  %21 = load i32, i32* %rem1, align 4
  %shr6 = lshr i32 %21, 16
  %or = or i32 %shl5, %shr6
  store i32 %or, i32* %rem0, align 4
  %22 = load i32, i32* %b0, align 4
  %shl7 = shl i32 %22, 16
  %23 = load i32, i32* %rem0, align 4
  %cmp8 = icmp ule i32 %shl7, %23
  br i1 %cmp8, label %cond.true.9, label %cond.false.10

cond.true.9:                                      ; preds = %while.end
  br label %cond.end.12

cond.false.10:                                    ; preds = %while.end
  %24 = load i32, i32* %rem0, align 4
  %25 = load i32, i32* %b0, align 4
  %div11 = udiv i32 %24, %25
  br label %cond.end.12

cond.end.12:                                      ; preds = %cond.false.10, %cond.true.9
  %cond13 = phi i32 [ 65535, %cond.true.9 ], [ %div11, %cond.false.10 ]
  %26 = load i32, i32* %z, align 4
  %or14 = or i32 %26, %cond13
  store i32 %or14, i32* %z, align 4
  %27 = load i32, i32* %z, align 4
  store i32 %27, i32* %retval
  br label %return

return:                                           ; preds = %cond.end.12, %if.then
  %28 = load i32, i32* %retval
  ret i32 %28
}

; Function Attrs: nounwind
define i32 @float32_rem(i32 %a, i32 %b) #1 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %aSign = alloca i32, align 4
  %bSign = alloca i32, align 4
  %zSign = alloca i32, align 4
  %aExp = alloca i32, align 4
  %bExp = alloca i32, align 4
  %expDiff = alloca i32, align 4
  %aSig = alloca i32, align 4
  %bSig = alloca i32, align 4
  %q = alloca i32, align 4
  %allZero = alloca i32, align 4
  %alternateASig = alloca i32, align 4
  %sigMean = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %call = call i32 @extractFloat32Frac(i32 %0)
  store i32 %call, i32* %aSig, align 4
  %1 = load i32, i32* %a.addr, align 4
  %call1 = call i32 @extractFloat32Exp(i32 %1)
  store i32 %call1, i32* %aExp, align 4
  %2 = load i32, i32* %a.addr, align 4
  %call2 = call i32 @extractFloat32Sign(i32 %2)
  store i32 %call2, i32* %aSign, align 4
  %3 = load i32, i32* %b.addr, align 4
  %call3 = call i32 @extractFloat32Frac(i32 %3)
  store i32 %call3, i32* %bSig, align 4
  %4 = load i32, i32* %b.addr, align 4
  %call4 = call i32 @extractFloat32Exp(i32 %4)
  store i32 %call4, i32* %bExp, align 4
  %5 = load i32, i32* %b.addr, align 4
  %call5 = call i32 @extractFloat32Sign(i32 %5)
  store i32 %call5, i32* %bSign, align 4
  %6 = load i32, i32* %aExp, align 4
  %cmp = icmp eq i32 %6, 255
  br i1 %cmp, label %if.then, label %if.end.10

if.then:                                          ; preds = %entry
  %7 = load i32, i32* %aSig, align 4
  %tobool = icmp ne i32 %7, 0
  br i1 %tobool, label %if.then.8, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then
  %8 = load i32, i32* %bExp, align 4
  %cmp6 = icmp eq i32 %8, 255
  br i1 %cmp6, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %lor.lhs.false
  %9 = load i32, i32* %bSig, align 4
  %tobool7 = icmp ne i32 %9, 0
  br i1 %tobool7, label %if.then.8, label %if.end

if.then.8:                                        ; preds = %land.lhs.true, %if.then
  %10 = load i32, i32* %a.addr, align 4
  %11 = load i32, i32* %b.addr, align 4
  %call9 = call i32 @propagateFloat32NaN(i32 %10, i32 %11)
  store i32 %call9, i32* %retval
  br label %return

if.end:                                           ; preds = %land.lhs.true, %lor.lhs.false
  call void @float_raise(i32 16)
  store i32 2147483647, i32* %retval
  br label %return

if.end.10:                                        ; preds = %entry
  %12 = load i32, i32* %bExp, align 4
  %cmp11 = icmp eq i32 %12, 255
  br i1 %cmp11, label %if.then.12, label %if.end.17

if.then.12:                                       ; preds = %if.end.10
  %13 = load i32, i32* %bSig, align 4
  %tobool13 = icmp ne i32 %13, 0
  br i1 %tobool13, label %if.then.14, label %if.end.16

if.then.14:                                       ; preds = %if.then.12
  %14 = load i32, i32* %a.addr, align 4
  %15 = load i32, i32* %b.addr, align 4
  %call15 = call i32 @propagateFloat32NaN(i32 %14, i32 %15)
  store i32 %call15, i32* %retval
  br label %return

if.end.16:                                        ; preds = %if.then.12
  %16 = load i32, i32* %a.addr, align 4
  store i32 %16, i32* %retval
  br label %return

if.end.17:                                        ; preds = %if.end.10
  %17 = load i32, i32* %bExp, align 4
  %cmp18 = icmp eq i32 %17, 0
  br i1 %cmp18, label %if.then.19, label %if.end.23

if.then.19:                                       ; preds = %if.end.17
  %18 = load i32, i32* %bSig, align 4
  %cmp20 = icmp eq i32 %18, 0
  br i1 %cmp20, label %if.then.21, label %if.end.22

if.then.21:                                       ; preds = %if.then.19
  call void @float_raise(i32 16)
  store i32 2147483647, i32* %retval
  br label %return

if.end.22:                                        ; preds = %if.then.19
  %19 = load i32, i32* %bSig, align 4
  call void @normalizeFloat32Subnormal(i32 %19, i32* %bExp, i32* %bSig)
  br label %if.end.23

if.end.23:                                        ; preds = %if.end.22, %if.end.17
  %20 = load i32, i32* %aExp, align 4
  %cmp24 = icmp eq i32 %20, 0
  br i1 %cmp24, label %if.then.25, label %if.end.29

if.then.25:                                       ; preds = %if.end.23
  %21 = load i32, i32* %aSig, align 4
  %cmp26 = icmp eq i32 %21, 0
  br i1 %cmp26, label %if.then.27, label %if.end.28

if.then.27:                                       ; preds = %if.then.25
  %22 = load i32, i32* %a.addr, align 4
  store i32 %22, i32* %retval
  br label %return

if.end.28:                                        ; preds = %if.then.25
  %23 = load i32, i32* %aSig, align 4
  call void @normalizeFloat32Subnormal(i32 %23, i32* %aExp, i32* %aSig)
  br label %if.end.29

if.end.29:                                        ; preds = %if.end.28, %if.end.23
  %24 = load i32, i32* %aExp, align 4
  %25 = load i32, i32* %bExp, align 4
  %sub = sub nsw i32 %24, %25
  store i32 %sub, i32* %expDiff, align 4
  %26 = load i32, i32* %aSig, align 4
  %or = or i32 %26, 8388608
  %shl = shl i32 %or, 8
  store i32 %shl, i32* %aSig, align 4
  %27 = load i32, i32* %bSig, align 4
  %or30 = or i32 %27, 8388608
  %shl31 = shl i32 %or30, 8
  store i32 %shl31, i32* %bSig, align 4
  %28 = load i32, i32* %expDiff, align 4
  %cmp32 = icmp slt i32 %28, 0
  br i1 %cmp32, label %if.then.33, label %if.end.37

if.then.33:                                       ; preds = %if.end.29
  %29 = load i32, i32* %expDiff, align 4
  %cmp34 = icmp slt i32 %29, -1
  br i1 %cmp34, label %if.then.35, label %if.end.36

if.then.35:                                       ; preds = %if.then.33
  %30 = load i32, i32* %a.addr, align 4
  store i32 %30, i32* %retval
  br label %return

if.end.36:                                        ; preds = %if.then.33
  %31 = load i32, i32* %aSig, align 4
  %shr = lshr i32 %31, 1
  store i32 %shr, i32* %aSig, align 4
  br label %if.end.37

if.end.37:                                        ; preds = %if.end.36, %if.end.29
  %32 = load i32, i32* %bSig, align 4
  %33 = load i32, i32* %aSig, align 4
  %cmp38 = icmp ule i32 %32, %33
  %conv = zext i1 %cmp38 to i32
  store i32 %conv, i32* %q, align 4
  %34 = load i32, i32* %q, align 4
  %tobool39 = icmp ne i32 %34, 0
  br i1 %tobool39, label %if.then.40, label %if.end.42

if.then.40:                                       ; preds = %if.end.37
  %35 = load i32, i32* %bSig, align 4
  %36 = load i32, i32* %aSig, align 4
  %sub41 = sub i32 %36, %35
  store i32 %sub41, i32* %aSig, align 4
  br label %if.end.42

if.end.42:                                        ; preds = %if.then.40, %if.end.37
  %37 = load i32, i32* %expDiff, align 4
  %sub43 = sub nsw i32 %37, 32
  store i32 %sub43, i32* %expDiff, align 4
  br label %while.cond

while.cond:                                       ; preds = %cond.end, %if.end.42
  %38 = load i32, i32* %expDiff, align 4
  %cmp44 = icmp slt i32 0, %38
  br i1 %cmp44, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %39 = load i32, i32* %aSig, align 4
  %40 = load i32, i32* %bSig, align 4
  %call46 = call i32 @estimateDiv64To32(i32 %39, i32 0, i32 %40)
  store i32 %call46, i32* %q, align 4
  %41 = load i32, i32* %q, align 4
  %cmp47 = icmp ult i32 2, %41
  br i1 %cmp47, label %cond.true, label %cond.false

cond.true:                                        ; preds = %while.body
  %42 = load i32, i32* %q, align 4
  %sub49 = sub i32 %42, 2
  br label %cond.end

cond.false:                                       ; preds = %while.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub49, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, i32* %q, align 4
  %43 = load i32, i32* %bSig, align 4
  %shr50 = lshr i32 %43, 2
  %44 = load i32, i32* %q, align 4
  %mul = mul i32 %shr50, %44
  %sub51 = sub i32 0, %mul
  store i32 %sub51, i32* %aSig, align 4
  %45 = load i32, i32* %expDiff, align 4
  %sub52 = sub nsw i32 %45, 30
  store i32 %sub52, i32* %expDiff, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %46 = load i32, i32* %expDiff, align 4
  %add = add nsw i32 %46, 32
  store i32 %add, i32* %expDiff, align 4
  %47 = load i32, i32* %expDiff, align 4
  %cmp53 = icmp slt i32 0, %47
  br i1 %cmp53, label %if.then.55, label %if.else

if.then.55:                                       ; preds = %while.end
  %48 = load i32, i32* %aSig, align 4
  %49 = load i32, i32* %bSig, align 4
  %call56 = call i32 @estimateDiv64To32(i32 %48, i32 0, i32 %49)
  store i32 %call56, i32* %q, align 4
  %50 = load i32, i32* %q, align 4
  %cmp57 = icmp ult i32 2, %50
  br i1 %cmp57, label %cond.true.59, label %cond.false.61

cond.true.59:                                     ; preds = %if.then.55
  %51 = load i32, i32* %q, align 4
  %sub60 = sub i32 %51, 2
  br label %cond.end.62

cond.false.61:                                    ; preds = %if.then.55
  br label %cond.end.62

cond.end.62:                                      ; preds = %cond.false.61, %cond.true.59
  %cond63 = phi i32 [ %sub60, %cond.true.59 ], [ 0, %cond.false.61 ]
  store i32 %cond63, i32* %q, align 4
  %52 = load i32, i32* %expDiff, align 4
  %sub64 = sub nsw i32 32, %52
  %53 = load i32, i32* %q, align 4
  %shr65 = lshr i32 %53, %sub64
  store i32 %shr65, i32* %q, align 4
  %54 = load i32, i32* %bSig, align 4
  %shr66 = lshr i32 %54, 2
  store i32 %shr66, i32* %bSig, align 4
  %55 = load i32, i32* %aSig, align 4
  %shr67 = lshr i32 %55, 1
  %56 = load i32, i32* %expDiff, align 4
  %sub68 = sub nsw i32 %56, 1
  %shl69 = shl i32 %shr67, %sub68
  %57 = load i32, i32* %bSig, align 4
  %58 = load i32, i32* %q, align 4
  %mul70 = mul i32 %57, %58
  %sub71 = sub i32 %shl69, %mul70
  store i32 %sub71, i32* %aSig, align 4
  br label %if.end.74

if.else:                                          ; preds = %while.end
  %59 = load i32, i32* %aSig, align 4
  %shr72 = lshr i32 %59, 2
  store i32 %shr72, i32* %aSig, align 4
  %60 = load i32, i32* %bSig, align 4
  %shr73 = lshr i32 %60, 2
  store i32 %shr73, i32* %bSig, align 4
  br label %if.end.74

if.end.74:                                        ; preds = %if.else, %cond.end.62
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.end.74
  %61 = load i32, i32* %aSig, align 4
  store i32 %61, i32* %alternateASig, align 4
  %62 = load i32, i32* %q, align 4
  %inc = add i32 %62, 1
  store i32 %inc, i32* %q, align 4
  %63 = load i32, i32* %bSig, align 4
  %64 = load i32, i32* %aSig, align 4
  %sub75 = sub i32 %64, %63
  store i32 %sub75, i32* %aSig, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %65 = load i32, i32* %aSig, align 4
  %cmp76 = icmp sle i32 0, %65
  br i1 %cmp76, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  %66 = load i32, i32* %aSig, align 4
  %67 = load i32, i32* %alternateASig, align 4
  %add78 = add i32 %66, %67
  store i32 %add78, i32* %sigMean, align 4
  %68 = load i32, i32* %sigMean, align 4
  %cmp79 = icmp slt i32 %68, 0
  br i1 %cmp79, label %if.then.86, label %lor.lhs.false.81

lor.lhs.false.81:                                 ; preds = %do.end
  %69 = load i32, i32* %sigMean, align 4
  %cmp82 = icmp eq i32 %69, 0
  br i1 %cmp82, label %land.lhs.true.84, label %if.end.87

land.lhs.true.84:                                 ; preds = %lor.lhs.false.81
  %70 = load i32, i32* %q, align 4
  %and = and i32 %70, 1
  %tobool85 = icmp ne i32 %and, 0
  br i1 %tobool85, label %if.then.86, label %if.end.87

if.then.86:                                       ; preds = %land.lhs.true.84, %do.end
  %71 = load i32, i32* %alternateASig, align 4
  store i32 %71, i32* %aSig, align 4
  br label %if.end.87

if.end.87:                                        ; preds = %if.then.86, %land.lhs.true.84, %lor.lhs.false.81
  %72 = load i32, i32* %aSig, align 4
  %cmp88 = icmp slt i32 %72, 0
  %conv89 = zext i1 %cmp88 to i32
  store i32 %conv89, i32* %zSign, align 4
  %73 = load i32, i32* %zSign, align 4
  %tobool90 = icmp ne i32 %73, 0
  br i1 %tobool90, label %if.then.91, label %if.end.93

if.then.91:                                       ; preds = %if.end.87
  %74 = load i32, i32* %aSig, align 4
  %sub92 = sub i32 0, %74
  store i32 %sub92, i32* %aSig, align 4
  br label %if.end.93

if.end.93:                                        ; preds = %if.then.91, %if.end.87
  %75 = load i32, i32* %aSign, align 4
  %76 = load i32, i32* %zSign, align 4
  %xor = xor i32 %75, %76
  %77 = load i32, i32* %bExp, align 4
  %78 = load i32, i32* %aSig, align 4
  %call94 = call i32 @normalizeRoundAndPackFloat32(i32 %xor, i32 %77, i32 %78)
  store i32 %call94, i32* %retval
  br label %return

return:                                           ; preds = %if.end.93, %if.then.35, %if.then.27, %if.then.21, %if.end.16, %if.then.14, %if.end, %if.then.8
  %79 = load i32, i32* %retval
  ret i32 %79
}

; Function Attrs: nounwind
define i32 @float32_sqrt(i32 %a) #1 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %aSign = alloca i32, align 4
  %aExp = alloca i32, align 4
  %zExp = alloca i32, align 4
  %aSig = alloca i32, align 4
  %zSig = alloca i32, align 4
  %rem0 = alloca i32, align 4
  %rem1 = alloca i32, align 4
  %term0 = alloca i32, align 4
  %term1 = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %call = call i32 @extractFloat32Frac(i32 %0)
  store i32 %call, i32* %aSig, align 4
  %1 = load i32, i32* %a.addr, align 4
  %call1 = call i32 @extractFloat32Exp(i32 %1)
  store i32 %call1, i32* %aExp, align 4
  %2 = load i32, i32* %a.addr, align 4
  %call2 = call i32 @extractFloat32Sign(i32 %2)
  store i32 %call2, i32* %aSign, align 4
  %3 = load i32, i32* %aExp, align 4
  %cmp = icmp eq i32 %3, 255
  br i1 %cmp, label %if.then, label %if.end.8

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %aSig, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then.3, label %if.end

if.then.3:                                        ; preds = %if.then
  %5 = load i32, i32* %a.addr, align 4
  %call4 = call i32 @propagateFloat32NaN(i32 %5, i32 0)
  store i32 %call4, i32* %retval
  br label %return

if.end:                                           ; preds = %if.then
  %6 = load i32, i32* %aSign, align 4
  %tobool5 = icmp ne i32 %6, 0
  br i1 %tobool5, label %if.end.7, label %if.then.6

if.then.6:                                        ; preds = %if.end
  %7 = load i32, i32* %a.addr, align 4
  store i32 %7, i32* %retval
  br label %return

if.end.7:                                         ; preds = %if.end
  call void @float_raise(i32 16)
  store i32 2147483647, i32* %retval
  br label %return

if.end.8:                                         ; preds = %entry
  %8 = load i32, i32* %aSign, align 4
  %tobool9 = icmp ne i32 %8, 0
  br i1 %tobool9, label %if.then.10, label %if.end.14

if.then.10:                                       ; preds = %if.end.8
  %9 = load i32, i32* %aExp, align 4
  %10 = load i32, i32* %aSig, align 4
  %or = or i32 %9, %10
  %cmp11 = icmp eq i32 %or, 0
  br i1 %cmp11, label %if.then.12, label %if.end.13

if.then.12:                                       ; preds = %if.then.10
  %11 = load i32, i32* %a.addr, align 4
  store i32 %11, i32* %retval
  br label %return

if.end.13:                                        ; preds = %if.then.10
  call void @float_raise(i32 16)
  store i32 2147483647, i32* %retval
  br label %return

if.end.14:                                        ; preds = %if.end.8
  %12 = load i32, i32* %aExp, align 4
  %cmp15 = icmp eq i32 %12, 0
  br i1 %cmp15, label %if.then.16, label %if.end.20

if.then.16:                                       ; preds = %if.end.14
  %13 = load i32, i32* %aSig, align 4
  %cmp17 = icmp eq i32 %13, 0
  br i1 %cmp17, label %if.then.18, label %if.end.19

if.then.18:                                       ; preds = %if.then.16
  store i32 0, i32* %retval
  br label %return

if.end.19:                                        ; preds = %if.then.16
  %14 = load i32, i32* %aSig, align 4
  call void @normalizeFloat32Subnormal(i32 %14, i32* %aExp, i32* %aSig)
  br label %if.end.20

if.end.20:                                        ; preds = %if.end.19, %if.end.14
  %15 = load i32, i32* %aExp, align 4
  %sub = sub nsw i32 %15, 127
  %shr = ashr i32 %sub, 1
  %add = add nsw i32 %shr, 126
  store i32 %add, i32* %zExp, align 4
  %16 = load i32, i32* %aSig, align 4
  %or21 = or i32 %16, 8388608
  %shl = shl i32 %or21, 8
  store i32 %shl, i32* %aSig, align 4
  %17 = load i32, i32* %aExp, align 4
  %18 = load i32, i32* %aSig, align 4
  %call22 = call i32 @estimateSqrt32(i32 %17, i32 %18)
  %add23 = add i32 %call22, 2
  store i32 %add23, i32* %zSig, align 4
  %19 = load i32, i32* %zSig, align 4
  %and = and i32 %19, 127
  %cmp24 = icmp ule i32 %and, 5
  br i1 %cmp24, label %if.then.25, label %if.end.36

if.then.25:                                       ; preds = %if.end.20
  %20 = load i32, i32* %zSig, align 4
  %cmp26 = icmp ult i32 %20, 2
  br i1 %cmp26, label %if.then.27, label %if.else

if.then.27:                                       ; preds = %if.then.25
  store i32 2147483647, i32* %zSig, align 4
  br label %roundAndPack

if.else:                                          ; preds = %if.then.25
  %21 = load i32, i32* %aExp, align 4
  %and28 = and i32 %21, 1
  %22 = load i32, i32* %aSig, align 4
  %shr29 = lshr i32 %22, %and28
  store i32 %shr29, i32* %aSig, align 4
  %23 = load i32, i32* %zSig, align 4
  %24 = load i32, i32* %zSig, align 4
  call void @mul32To64(i32 %23, i32 %24, i32* %term0, i32* %term1)
  %25 = load i32, i32* %aSig, align 4
  %26 = load i32, i32* %term0, align 4
  %27 = load i32, i32* %term1, align 4
  call void @sub64(i32 %25, i32 0, i32 %26, i32 %27, i32* %rem0, i32* %rem1)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.else
  %28 = load i32, i32* %rem0, align 4
  %cmp30 = icmp slt i32 %28, 0
  br i1 %cmp30, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %29 = load i32, i32* %zSig, align 4
  %dec = add i32 %29, -1
  store i32 %dec, i32* %zSig, align 4
  %30 = load i32, i32* %zSig, align 4
  call void @shortShift64Left(i32 0, i32 %30, i32 1, i32* %term0, i32* %term1)
  %31 = load i32, i32* %term1, align 4
  %or31 = or i32 %31, 1
  store i32 %or31, i32* %term1, align 4
  %32 = load i32, i32* %rem0, align 4
  %33 = load i32, i32* %rem1, align 4
  %34 = load i32, i32* %term0, align 4
  %35 = load i32, i32* %term1, align 4
  call void @add64(i32 %32, i32 %33, i32 %34, i32 %35, i32* %rem0, i32* %rem1)
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %36 = load i32, i32* %rem0, align 4
  %37 = load i32, i32* %rem1, align 4
  %or32 = or i32 %36, %37
  %cmp33 = icmp ne i32 %or32, 0
  %conv = zext i1 %cmp33 to i32
  %38 = load i32, i32* %zSig, align 4
  %or34 = or i32 %38, %conv
  store i32 %or34, i32* %zSig, align 4
  br label %if.end.35

if.end.35:                                        ; preds = %while.end
  br label %if.end.36

if.end.36:                                        ; preds = %if.end.35, %if.end.20
  %39 = load i32, i32* %zSig, align 4
  call void @shift32RightJamming(i32 %39, i32 1, i32* %zSig)
  br label %roundAndPack

roundAndPack:                                     ; preds = %if.end.36, %if.then.27
  %40 = load i32, i32* %zExp, align 4
  %41 = load i32, i32* %zSig, align 4
  %call37 = call i32 @roundAndPackFloat32(i32 0, i32 %40, i32 %41)
  store i32 %call37, i32* %retval
  br label %return

return:                                           ; preds = %roundAndPack, %if.then.18, %if.end.13, %if.then.12, %if.end.7, %if.then.6, %if.then.3
  %42 = load i32, i32* %retval
  ret i32 %42
}

; Function Attrs: nounwind
define internal i32 @estimateSqrt32(i32 %aExp, i32 %a) #1 {
entry:
  %retval = alloca i32, align 4
  %aExp.addr = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %index = alloca i32, align 4
  %z = alloca i32, align 4
  store i32 %aExp, i32* %aExp.addr, align 4
  store i32 %a, i32* %a.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %shr = lshr i32 %0, 27
  %and = and i32 %shr, 15
  store i32 %and, i32* %index, align 4
  %1 = load i32, i32* %aExp.addr, align 4
  %and1 = and i32 %1, 1
  %tobool = icmp ne i32 %and1, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %a.addr, align 4
  %shr2 = lshr i32 %2, 17
  %add = add i32 16384, %shr2
  %3 = load i32, i32* %index, align 4
  %arrayidx = getelementptr inbounds [16 x i16], [16 x i16]* @estimateSqrt32.sqrtOddAdjustments, i32 0, i32 %3
  %4 = load i16, i16* %arrayidx, align 2
  %conv = zext i16 %4 to i32
  %sub = sub i32 %add, %conv
  store i32 %sub, i32* %z, align 4
  %5 = load i32, i32* %a.addr, align 4
  %6 = load i32, i32* %z, align 4
  %div = udiv i32 %5, %6
  %shl = shl i32 %div, 14
  %7 = load i32, i32* %z, align 4
  %shl3 = shl i32 %7, 15
  %add4 = add i32 %shl, %shl3
  store i32 %add4, i32* %z, align 4
  %8 = load i32, i32* %a.addr, align 4
  %shr5 = lshr i32 %8, 1
  store i32 %shr5, i32* %a.addr, align 4
  br label %if.end.19

if.else:                                          ; preds = %entry
  %9 = load i32, i32* %a.addr, align 4
  %shr6 = lshr i32 %9, 17
  %add7 = add i32 32768, %shr6
  %10 = load i32, i32* %index, align 4
  %arrayidx8 = getelementptr inbounds [16 x i16], [16 x i16]* @estimateSqrt32.sqrtEvenAdjustments, i32 0, i32 %10
  %11 = load i16, i16* %arrayidx8, align 2
  %conv9 = zext i16 %11 to i32
  %sub10 = sub i32 %add7, %conv9
  store i32 %sub10, i32* %z, align 4
  %12 = load i32, i32* %a.addr, align 4
  %13 = load i32, i32* %z, align 4
  %div11 = udiv i32 %12, %13
  %14 = load i32, i32* %z, align 4
  %add12 = add i32 %div11, %14
  store i32 %add12, i32* %z, align 4
  %15 = load i32, i32* %z, align 4
  %cmp = icmp ule i32 131072, %15
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.else
  br label %cond.end

cond.false:                                       ; preds = %if.else
  %16 = load i32, i32* %z, align 4
  %shl14 = shl i32 %16, 15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ -32768, %cond.true ], [ %shl14, %cond.false ]
  store i32 %cond, i32* %z, align 4
  %17 = load i32, i32* %z, align 4
  %18 = load i32, i32* %a.addr, align 4
  %cmp15 = icmp ule i32 %17, %18
  br i1 %cmp15, label %if.then.17, label %if.end

if.then.17:                                       ; preds = %cond.end
  %19 = load i32, i32* %a.addr, align 4
  %shr18 = ashr i32 %19, 1
  store i32 %shr18, i32* %retval
  br label %return

if.end:                                           ; preds = %cond.end
  br label %if.end.19

if.end.19:                                        ; preds = %if.end, %if.then
  %20 = load i32, i32* %a.addr, align 4
  %21 = load i32, i32* %z, align 4
  %call = call i32 @estimateDiv64To32(i32 %20, i32 0, i32 %21)
  %shr20 = lshr i32 %call, 1
  %22 = load i32, i32* %z, align 4
  %shr21 = lshr i32 %22, 1
  %add22 = add i32 %shr20, %shr21
  store i32 %add22, i32* %retval
  br label %return

return:                                           ; preds = %if.end.19, %if.then.17
  %23 = load i32, i32* %retval
  ret i32 %23
}

; Function Attrs: nounwind
define i32 @float32_eq(i32 %a, i32 %b) #1 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %call = call i32 @extractFloat32Exp(i32 %0)
  %cmp = icmp eq i32 %call, 255
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %a.addr, align 4
  %call1 = call i32 @extractFloat32Frac(i32 %1)
  %tobool = icmp ne i32 %call1, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %b.addr, align 4
  %call2 = call i32 @extractFloat32Exp(i32 %2)
  %cmp3 = icmp eq i32 %call2, 255
  br i1 %cmp3, label %land.lhs.true.4, label %if.end.13

land.lhs.true.4:                                  ; preds = %lor.lhs.false
  %3 = load i32, i32* %b.addr, align 4
  %call5 = call i32 @extractFloat32Frac(i32 %3)
  %tobool6 = icmp ne i32 %call5, 0
  br i1 %tobool6, label %if.then, label %if.end.13

if.then:                                          ; preds = %land.lhs.true.4, %land.lhs.true
  %4 = load i32, i32* %a.addr, align 4
  %call7 = call i32 @float32_is_signaling_nan(i32 %4)
  %tobool8 = icmp ne i32 %call7, 0
  br i1 %tobool8, label %if.then.12, label %lor.lhs.false.9

lor.lhs.false.9:                                  ; preds = %if.then
  %5 = load i32, i32* %b.addr, align 4
  %call10 = call i32 @float32_is_signaling_nan(i32 %5)
  %tobool11 = icmp ne i32 %call10, 0
  br i1 %tobool11, label %if.then.12, label %if.end

if.then.12:                                       ; preds = %lor.lhs.false.9, %if.then
  call void @float_raise(i32 16)
  br label %if.end

if.end:                                           ; preds = %if.then.12, %lor.lhs.false.9
  store i32 0, i32* %retval
  br label %return

if.end.13:                                        ; preds = %land.lhs.true.4, %lor.lhs.false
  %6 = load i32, i32* %a.addr, align 4
  %7 = load i32, i32* %b.addr, align 4
  %cmp14 = icmp eq i32 %6, %7
  br i1 %cmp14, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.end.13
  %8 = load i32, i32* %a.addr, align 4
  %9 = load i32, i32* %b.addr, align 4
  %or = or i32 %8, %9
  %shl = shl i32 %or, 1
  %cmp15 = icmp eq i32 %shl, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.end.13
  %10 = phi i1 [ true, %if.end.13 ], [ %cmp15, %lor.rhs ]
  %lor.ext = zext i1 %10 to i32
  store i32 %lor.ext, i32* %retval
  br label %return

return:                                           ; preds = %lor.end, %if.end
  %11 = load i32, i32* %retval
  ret i32 %11
}

; Function Attrs: nounwind
define i32 @float32_le(i32 %a, i32 %b) #1 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %aSign = alloca i32, align 4
  %bSign = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %call = call i32 @extractFloat32Exp(i32 %0)
  %cmp = icmp eq i32 %call, 255
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %a.addr, align 4
  %call1 = call i32 @extractFloat32Frac(i32 %1)
  %tobool = icmp ne i32 %call1, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %b.addr, align 4
  %call2 = call i32 @extractFloat32Exp(i32 %2)
  %cmp3 = icmp eq i32 %call2, 255
  br i1 %cmp3, label %land.lhs.true.4, label %if.end

land.lhs.true.4:                                  ; preds = %lor.lhs.false
  %3 = load i32, i32* %b.addr, align 4
  %call5 = call i32 @extractFloat32Frac(i32 %3)
  %tobool6 = icmp ne i32 %call5, 0
  br i1 %tobool6, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true.4, %land.lhs.true
  call void @float_raise(i32 16)
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %land.lhs.true.4, %lor.lhs.false
  %4 = load i32, i32* %a.addr, align 4
  %call7 = call i32 @extractFloat32Sign(i32 %4)
  store i32 %call7, i32* %aSign, align 4
  %5 = load i32, i32* %b.addr, align 4
  %call8 = call i32 @extractFloat32Sign(i32 %5)
  store i32 %call8, i32* %bSign, align 4
  %6 = load i32, i32* %aSign, align 4
  %7 = load i32, i32* %bSign, align 4
  %cmp9 = icmp ne i32 %6, %7
  br i1 %cmp9, label %if.then.10, label %if.end.13

if.then.10:                                       ; preds = %if.end
  %8 = load i32, i32* %aSign, align 4
  %tobool11 = icmp ne i32 %8, 0
  br i1 %tobool11, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.then.10
  %9 = load i32, i32* %a.addr, align 4
  %10 = load i32, i32* %b.addr, align 4
  %or = or i32 %9, %10
  %shl = shl i32 %or, 1
  %cmp12 = icmp eq i32 %shl, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.then.10
  %11 = phi i1 [ true, %if.then.10 ], [ %cmp12, %lor.rhs ]
  %lor.ext = zext i1 %11 to i32
  store i32 %lor.ext, i32* %retval
  br label %return

if.end.13:                                        ; preds = %if.end
  %12 = load i32, i32* %a.addr, align 4
  %13 = load i32, i32* %b.addr, align 4
  %cmp14 = icmp eq i32 %12, %13
  br i1 %cmp14, label %lor.end.18, label %lor.rhs.15

lor.rhs.15:                                       ; preds = %if.end.13
  %14 = load i32, i32* %aSign, align 4
  %15 = load i32, i32* %a.addr, align 4
  %16 = load i32, i32* %b.addr, align 4
  %cmp16 = icmp ult i32 %15, %16
  %conv = zext i1 %cmp16 to i32
  %xor = xor i32 %14, %conv
  %tobool17 = icmp ne i32 %xor, 0
  br label %lor.end.18

lor.end.18:                                       ; preds = %lor.rhs.15, %if.end.13
  %17 = phi i1 [ true, %if.end.13 ], [ %tobool17, %lor.rhs.15 ]
  %lor.ext19 = zext i1 %17 to i32
  store i32 %lor.ext19, i32* %retval
  br label %return

return:                                           ; preds = %lor.end.18, %lor.end, %if.then
  %18 = load i32, i32* %retval
  ret i32 %18
}

; Function Attrs: nounwind
define i32 @float32_lt(i32 %a, i32 %b) #1 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %aSign = alloca i32, align 4
  %bSign = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %call = call i32 @extractFloat32Exp(i32 %0)
  %cmp = icmp eq i32 %call, 255
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %a.addr, align 4
  %call1 = call i32 @extractFloat32Frac(i32 %1)
  %tobool = icmp ne i32 %call1, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %b.addr, align 4
  %call2 = call i32 @extractFloat32Exp(i32 %2)
  %cmp3 = icmp eq i32 %call2, 255
  br i1 %cmp3, label %land.lhs.true.4, label %if.end

land.lhs.true.4:                                  ; preds = %lor.lhs.false
  %3 = load i32, i32* %b.addr, align 4
  %call5 = call i32 @extractFloat32Frac(i32 %3)
  %tobool6 = icmp ne i32 %call5, 0
  br i1 %tobool6, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true.4, %land.lhs.true
  call void @float_raise(i32 16)
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %land.lhs.true.4, %lor.lhs.false
  %4 = load i32, i32* %a.addr, align 4
  %call7 = call i32 @extractFloat32Sign(i32 %4)
  store i32 %call7, i32* %aSign, align 4
  %5 = load i32, i32* %b.addr, align 4
  %call8 = call i32 @extractFloat32Sign(i32 %5)
  store i32 %call8, i32* %bSign, align 4
  %6 = load i32, i32* %aSign, align 4
  %7 = load i32, i32* %bSign, align 4
  %cmp9 = icmp ne i32 %6, %7
  br i1 %cmp9, label %if.then.10, label %if.end.13

if.then.10:                                       ; preds = %if.end
  %8 = load i32, i32* %aSign, align 4
  %tobool11 = icmp ne i32 %8, 0
  br i1 %tobool11, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.then.10
  %9 = load i32, i32* %a.addr, align 4
  %10 = load i32, i32* %b.addr, align 4
  %or = or i32 %9, %10
  %shl = shl i32 %or, 1
  %cmp12 = icmp ne i32 %shl, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then.10
  %11 = phi i1 [ false, %if.then.10 ], [ %cmp12, %land.rhs ]
  %land.ext = zext i1 %11 to i32
  store i32 %land.ext, i32* %retval
  br label %return

if.end.13:                                        ; preds = %if.end
  %12 = load i32, i32* %a.addr, align 4
  %13 = load i32, i32* %b.addr, align 4
  %cmp14 = icmp ne i32 %12, %13
  br i1 %cmp14, label %land.rhs.15, label %land.end.18

land.rhs.15:                                      ; preds = %if.end.13
  %14 = load i32, i32* %aSign, align 4
  %15 = load i32, i32* %a.addr, align 4
  %16 = load i32, i32* %b.addr, align 4
  %cmp16 = icmp ult i32 %15, %16
  %conv = zext i1 %cmp16 to i32
  %xor = xor i32 %14, %conv
  %tobool17 = icmp ne i32 %xor, 0
  br label %land.end.18

land.end.18:                                      ; preds = %land.rhs.15, %if.end.13
  %17 = phi i1 [ false, %if.end.13 ], [ %tobool17, %land.rhs.15 ]
  %land.ext19 = zext i1 %17 to i32
  store i32 %land.ext19, i32* %retval
  br label %return

return:                                           ; preds = %land.end.18, %land.end, %if.then
  %18 = load i32, i32* %retval
  ret i32 %18
}

; Function Attrs: nounwind
define i32 @float32_eq_signaling(i32 %a, i32 %b) #1 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %call = call i32 @extractFloat32Exp(i32 %0)
  %cmp = icmp eq i32 %call, 255
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %a.addr, align 4
  %call1 = call i32 @extractFloat32Frac(i32 %1)
  %tobool = icmp ne i32 %call1, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %b.addr, align 4
  %call2 = call i32 @extractFloat32Exp(i32 %2)
  %cmp3 = icmp eq i32 %call2, 255
  br i1 %cmp3, label %land.lhs.true.4, label %if.end

land.lhs.true.4:                                  ; preds = %lor.lhs.false
  %3 = load i32, i32* %b.addr, align 4
  %call5 = call i32 @extractFloat32Frac(i32 %3)
  %tobool6 = icmp ne i32 %call5, 0
  br i1 %tobool6, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true.4, %land.lhs.true
  call void @float_raise(i32 16)
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %land.lhs.true.4, %lor.lhs.false
  %4 = load i32, i32* %a.addr, align 4
  %5 = load i32, i32* %b.addr, align 4
  %cmp7 = icmp eq i32 %4, %5
  br i1 %cmp7, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.end
  %6 = load i32, i32* %a.addr, align 4
  %7 = load i32, i32* %b.addr, align 4
  %or = or i32 %6, %7
  %shl = shl i32 %or, 1
  %cmp8 = icmp eq i32 %shl, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.end
  %8 = phi i1 [ true, %if.end ], [ %cmp8, %lor.rhs ]
  %lor.ext = zext i1 %8 to i32
  store i32 %lor.ext, i32* %retval
  br label %return

return:                                           ; preds = %lor.end, %if.then
  %9 = load i32, i32* %retval
  ret i32 %9
}

; Function Attrs: nounwind
define i32 @float32_le_quiet(i32 %a, i32 %b) #1 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %aSign = alloca i32, align 4
  %bSign = alloca i32, align 4
  %aExp = alloca i32, align 4
  %bExp = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %call = call i32 @extractFloat32Exp(i32 %0)
  %cmp = icmp eq i32 %call, 255
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %a.addr, align 4
  %call1 = call i32 @extractFloat32Frac(i32 %1)
  %tobool = icmp ne i32 %call1, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %b.addr, align 4
  %call2 = call i32 @extractFloat32Exp(i32 %2)
  %cmp3 = icmp eq i32 %call2, 255
  br i1 %cmp3, label %land.lhs.true.4, label %if.end.13

land.lhs.true.4:                                  ; preds = %lor.lhs.false
  %3 = load i32, i32* %b.addr, align 4
  %call5 = call i32 @extractFloat32Frac(i32 %3)
  %tobool6 = icmp ne i32 %call5, 0
  br i1 %tobool6, label %if.then, label %if.end.13

if.then:                                          ; preds = %land.lhs.true.4, %land.lhs.true
  %4 = load i32, i32* %a.addr, align 4
  %call7 = call i32 @float32_is_signaling_nan(i32 %4)
  %tobool8 = icmp ne i32 %call7, 0
  br i1 %tobool8, label %if.then.12, label %lor.lhs.false.9

lor.lhs.false.9:                                  ; preds = %if.then
  %5 = load i32, i32* %b.addr, align 4
  %call10 = call i32 @float32_is_signaling_nan(i32 %5)
  %tobool11 = icmp ne i32 %call10, 0
  br i1 %tobool11, label %if.then.12, label %if.end

if.then.12:                                       ; preds = %lor.lhs.false.9, %if.then
  call void @float_raise(i32 16)
  br label %if.end

if.end:                                           ; preds = %if.then.12, %lor.lhs.false.9
  store i32 0, i32* %retval
  br label %return

if.end.13:                                        ; preds = %land.lhs.true.4, %lor.lhs.false
  %6 = load i32, i32* %a.addr, align 4
  %call14 = call i32 @extractFloat32Sign(i32 %6)
  store i32 %call14, i32* %aSign, align 4
  %7 = load i32, i32* %b.addr, align 4
  %call15 = call i32 @extractFloat32Sign(i32 %7)
  store i32 %call15, i32* %bSign, align 4
  %8 = load i32, i32* %aSign, align 4
  %9 = load i32, i32* %bSign, align 4
  %cmp16 = icmp ne i32 %8, %9
  br i1 %cmp16, label %if.then.17, label %if.end.20

if.then.17:                                       ; preds = %if.end.13
  %10 = load i32, i32* %aSign, align 4
  %tobool18 = icmp ne i32 %10, 0
  br i1 %tobool18, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.then.17
  %11 = load i32, i32* %a.addr, align 4
  %12 = load i32, i32* %b.addr, align 4
  %or = or i32 %11, %12
  %shl = shl i32 %or, 1
  %cmp19 = icmp eq i32 %shl, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.then.17
  %13 = phi i1 [ true, %if.then.17 ], [ %cmp19, %lor.rhs ]
  %lor.ext = zext i1 %13 to i32
  store i32 %lor.ext, i32* %retval
  br label %return

if.end.20:                                        ; preds = %if.end.13
  %14 = load i32, i32* %a.addr, align 4
  %15 = load i32, i32* %b.addr, align 4
  %cmp21 = icmp eq i32 %14, %15
  br i1 %cmp21, label %lor.end.25, label %lor.rhs.22

lor.rhs.22:                                       ; preds = %if.end.20
  %16 = load i32, i32* %aSign, align 4
  %17 = load i32, i32* %a.addr, align 4
  %18 = load i32, i32* %b.addr, align 4
  %cmp23 = icmp ult i32 %17, %18
  %conv = zext i1 %cmp23 to i32
  %xor = xor i32 %16, %conv
  %tobool24 = icmp ne i32 %xor, 0
  br label %lor.end.25

lor.end.25:                                       ; preds = %lor.rhs.22, %if.end.20
  %19 = phi i1 [ true, %if.end.20 ], [ %tobool24, %lor.rhs.22 ]
  %lor.ext26 = zext i1 %19 to i32
  store i32 %lor.ext26, i32* %retval
  br label %return

return:                                           ; preds = %lor.end.25, %lor.end, %if.end
  %20 = load i32, i32* %retval
  ret i32 %20
}

; Function Attrs: nounwind
define i32 @float32_lt_quiet(i32 %a, i32 %b) #1 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %aSign = alloca i32, align 4
  %bSign = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %call = call i32 @extractFloat32Exp(i32 %0)
  %cmp = icmp eq i32 %call, 255
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, i32* %a.addr, align 4
  %call1 = call i32 @extractFloat32Frac(i32 %1)
  %tobool = icmp ne i32 %call1, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %2 = load i32, i32* %b.addr, align 4
  %call2 = call i32 @extractFloat32Exp(i32 %2)
  %cmp3 = icmp eq i32 %call2, 255
  br i1 %cmp3, label %land.lhs.true.4, label %if.end.13

land.lhs.true.4:                                  ; preds = %lor.lhs.false
  %3 = load i32, i32* %b.addr, align 4
  %call5 = call i32 @extractFloat32Frac(i32 %3)
  %tobool6 = icmp ne i32 %call5, 0
  br i1 %tobool6, label %if.then, label %if.end.13

if.then:                                          ; preds = %land.lhs.true.4, %land.lhs.true
  %4 = load i32, i32* %a.addr, align 4
  %call7 = call i32 @float32_is_signaling_nan(i32 %4)
  %tobool8 = icmp ne i32 %call7, 0
  br i1 %tobool8, label %if.then.12, label %lor.lhs.false.9

lor.lhs.false.9:                                  ; preds = %if.then
  %5 = load i32, i32* %b.addr, align 4
  %call10 = call i32 @float32_is_signaling_nan(i32 %5)
  %tobool11 = icmp ne i32 %call10, 0
  br i1 %tobool11, label %if.then.12, label %if.end

if.then.12:                                       ; preds = %lor.lhs.false.9, %if.then
  call void @float_raise(i32 16)
  br label %if.end

if.end:                                           ; preds = %if.then.12, %lor.lhs.false.9
  store i32 0, i32* %retval
  br label %return

if.end.13:                                        ; preds = %land.lhs.true.4, %lor.lhs.false
  %6 = load i32, i32* %a.addr, align 4
  %call14 = call i32 @extractFloat32Sign(i32 %6)
  store i32 %call14, i32* %aSign, align 4
  %7 = load i32, i32* %b.addr, align 4
  %call15 = call i32 @extractFloat32Sign(i32 %7)
  store i32 %call15, i32* %bSign, align 4
  %8 = load i32, i32* %aSign, align 4
  %9 = load i32, i32* %bSign, align 4
  %cmp16 = icmp ne i32 %8, %9
  br i1 %cmp16, label %if.then.17, label %if.end.20

if.then.17:                                       ; preds = %if.end.13
  %10 = load i32, i32* %aSign, align 4
  %tobool18 = icmp ne i32 %10, 0
  br i1 %tobool18, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.then.17
  %11 = load i32, i32* %a.addr, align 4
  %12 = load i32, i32* %b.addr, align 4
  %or = or i32 %11, %12
  %shl = shl i32 %or, 1
  %cmp19 = icmp ne i32 %shl, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then.17
  %13 = phi i1 [ false, %if.then.17 ], [ %cmp19, %land.rhs ]
  %land.ext = zext i1 %13 to i32
  store i32 %land.ext, i32* %retval
  br label %return

if.end.20:                                        ; preds = %if.end.13
  %14 = load i32, i32* %a.addr, align 4
  %15 = load i32, i32* %b.addr, align 4
  %cmp21 = icmp ne i32 %14, %15
  br i1 %cmp21, label %land.rhs.22, label %land.end.25

land.rhs.22:                                      ; preds = %if.end.20
  %16 = load i32, i32* %aSign, align 4
  %17 = load i32, i32* %a.addr, align 4
  %18 = load i32, i32* %b.addr, align 4
  %cmp23 = icmp ult i32 %17, %18
  %conv = zext i1 %cmp23 to i32
  %xor = xor i32 %16, %conv
  %tobool24 = icmp ne i32 %xor, 0
  br label %land.end.25

land.end.25:                                      ; preds = %land.rhs.22, %if.end.20
  %19 = phi i1 [ false, %if.end.20 ], [ %tobool24, %land.rhs.22 ]
  %land.ext26 = zext i1 %19 to i32
  store i32 %land.ext26, i32* %retval
  br label %return

return:                                           ; preds = %land.end.25, %land.end, %if.end
  %20 = load i32, i32* %retval
  ret i32 %20
}

; Function Attrs: nounwind
define i32 @float64_to_int32(i32 %a.0, i32 %a.1) #1 {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.float64, align 4
  %aSign = alloca i32, align 4
  %aExp = alloca i32, align 4
  %shiftCount = alloca i32, align 4
  %aSig0 = alloca i32, align 4
  %aSig1 = alloca i32, align 4
  %absZ = alloca i32, align 4
  %aSigExtra = alloca i32, align 4
  %z = alloca i32, align 4
  %roundingMode = alloca i32, align 4
  %high = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  store i32 %a.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  store i32 %a.1, i32* %low, align 4
  %high1 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %0 = load i32, i32* %high1, align 4
  %low2 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %1 = load i32, i32* %low2, align 4
  %call = call i32 @extractFloat64Frac1(i32 %0, i32 %1)
  store i32 %call, i32* %aSig1, align 4
  %high3 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %2 = load i32, i32* %high3, align 4
  %low4 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %3 = load i32, i32* %low4, align 4
  %call5 = call i32 @extractFloat64Frac0(i32 %2, i32 %3)
  store i32 %call5, i32* %aSig0, align 4
  %high6 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %4 = load i32, i32* %high6, align 4
  %low7 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %5 = load i32, i32* %low7, align 4
  %call8 = call i32 @extractFloat64Exp(i32 %4, i32 %5)
  store i32 %call8, i32* %aExp, align 4
  %high9 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %6 = load i32, i32* %high9, align 4
  %low10 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %7 = load i32, i32* %low10, align 4
  %call11 = call i32 @extractFloat64Sign(i32 %6, i32 %7)
  store i32 %call11, i32* %aSign, align 4
  %8 = load i32, i32* %aExp, align 4
  %sub = sub nsw i32 %8, 1043
  store i32 %sub, i32* %shiftCount, align 4
  %9 = load i32, i32* %shiftCount, align 4
  %cmp = icmp sle i32 0, %9
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %10 = load i32, i32* %aExp, align 4
  %cmp12 = icmp slt i32 1054, %10
  br i1 %cmp12, label %if.then.13, label %if.end.16

if.then.13:                                       ; preds = %if.then
  %11 = load i32, i32* %aExp, align 4
  %cmp14 = icmp eq i32 %11, 2047
  br i1 %cmp14, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %if.then.13
  %12 = load i32, i32* %aSig0, align 4
  %13 = load i32, i32* %aSig1, align 4
  %or = or i32 %12, %13
  %tobool = icmp ne i32 %or, 0
  br i1 %tobool, label %if.then.15, label %if.end

if.then.15:                                       ; preds = %land.lhs.true
  store i32 0, i32* %aSign, align 4
  br label %if.end

if.end:                                           ; preds = %if.then.15, %land.lhs.true, %if.then.13
  br label %invalid

if.end.16:                                        ; preds = %if.then
  %14 = load i32, i32* %aSig0, align 4
  %or17 = or i32 %14, 1048576
  %15 = load i32, i32* %aSig1, align 4
  %16 = load i32, i32* %shiftCount, align 4
  call void @shortShift64Left(i32 %or17, i32 %15, i32 %16, i32* %absZ, i32* %aSigExtra)
  %17 = load i32, i32* %absZ, align 4
  %cmp18 = icmp ult i32 -2147483648, %17
  br i1 %cmp18, label %if.then.19, label %if.end.20

if.then.19:                                       ; preds = %if.end.16
  br label %invalid

if.end.20:                                        ; preds = %if.end.16
  br label %if.end.32

if.else:                                          ; preds = %entry
  %18 = load i32, i32* %aSig1, align 4
  %cmp21 = icmp ne i32 %18, 0
  %conv = zext i1 %cmp21 to i32
  store i32 %conv, i32* %aSig1, align 4
  %19 = load i32, i32* %aExp, align 4
  %cmp22 = icmp slt i32 %19, 1022
  br i1 %cmp22, label %if.then.24, label %if.else.27

if.then.24:                                       ; preds = %if.else
  %20 = load i32, i32* %aExp, align 4
  %21 = load i32, i32* %aSig0, align 4
  %or25 = or i32 %20, %21
  %22 = load i32, i32* %aSig1, align 4
  %or26 = or i32 %or25, %22
  store i32 %or26, i32* %aSigExtra, align 4
  store i32 0, i32* %absZ, align 4
  br label %if.end.31

if.else.27:                                       ; preds = %if.else
  %23 = load i32, i32* %aSig0, align 4
  %or28 = or i32 %23, 1048576
  store i32 %or28, i32* %aSig0, align 4
  %24 = load i32, i32* %aSig0, align 4
  %25 = load i32, i32* %shiftCount, align 4
  %and = and i32 %25, 31
  %shl = shl i32 %24, %and
  %26 = load i32, i32* %aSig1, align 4
  %or29 = or i32 %shl, %26
  store i32 %or29, i32* %aSigExtra, align 4
  %27 = load i32, i32* %aSig0, align 4
  %28 = load i32, i32* %shiftCount, align 4
  %sub30 = sub nsw i32 0, %28
  %shr = lshr i32 %27, %sub30
  store i32 %shr, i32* %absZ, align 4
  br label %if.end.31

if.end.31:                                        ; preds = %if.else.27, %if.then.24
  br label %if.end.32

if.end.32:                                        ; preds = %if.end.31, %if.end.20
  %29 = load i32, i32* @float_rounding_mode, align 4
  store i32 %29, i32* %roundingMode, align 4
  %30 = load i32, i32* %roundingMode, align 4
  %cmp33 = icmp eq i32 %30, 0
  br i1 %cmp33, label %if.then.35, label %if.else.48

if.then.35:                                       ; preds = %if.end.32
  %31 = load i32, i32* %aSigExtra, align 4
  %cmp36 = icmp slt i32 %31, 0
  br i1 %cmp36, label %if.then.38, label %if.end.45

if.then.38:                                       ; preds = %if.then.35
  %32 = load i32, i32* %absZ, align 4
  %inc = add i32 %32, 1
  store i32 %inc, i32* %absZ, align 4
  %33 = load i32, i32* %aSigExtra, align 4
  %shl39 = shl i32 %33, 1
  %cmp40 = icmp eq i32 %shl39, 0
  br i1 %cmp40, label %if.then.42, label %if.end.44

if.then.42:                                       ; preds = %if.then.38
  %34 = load i32, i32* %absZ, align 4
  %and43 = and i32 %34, -2
  store i32 %and43, i32* %absZ, align 4
  br label %if.end.44

if.end.44:                                        ; preds = %if.then.42, %if.then.38
  br label %if.end.45

if.end.45:                                        ; preds = %if.end.44, %if.then.35
  %35 = load i32, i32* %aSign, align 4
  %tobool46 = icmp ne i32 %35, 0
  br i1 %tobool46, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end.45
  %36 = load i32, i32* %absZ, align 4
  %sub47 = sub i32 0, %36
  br label %cond.end

cond.false:                                       ; preds = %if.end.45
  %37 = load i32, i32* %absZ, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub47, %cond.true ], [ %37, %cond.false ]
  store i32 %cond, i32* %z, align 4
  br label %if.end.63

if.else.48:                                       ; preds = %if.end.32
  %38 = load i32, i32* %aSigExtra, align 4
  %cmp49 = icmp ne i32 %38, 0
  %conv50 = zext i1 %cmp49 to i32
  store i32 %conv50, i32* %aSigExtra, align 4
  %39 = load i32, i32* %aSign, align 4
  %tobool51 = icmp ne i32 %39, 0
  br i1 %tobool51, label %if.then.52, label %if.else.57

if.then.52:                                       ; preds = %if.else.48
  %40 = load i32, i32* %absZ, align 4
  %41 = load i32, i32* %roundingMode, align 4
  %cmp53 = icmp eq i32 %41, 3
  %conv54 = zext i1 %cmp53 to i32
  %42 = load i32, i32* %aSigExtra, align 4
  %and55 = and i32 %conv54, %42
  %add = add i32 %40, %and55
  %sub56 = sub i32 0, %add
  store i32 %sub56, i32* %z, align 4
  br label %if.end.62

if.else.57:                                       ; preds = %if.else.48
  %43 = load i32, i32* %absZ, align 4
  %44 = load i32, i32* %roundingMode, align 4
  %cmp58 = icmp eq i32 %44, 2
  %conv59 = zext i1 %cmp58 to i32
  %45 = load i32, i32* %aSigExtra, align 4
  %and60 = and i32 %conv59, %45
  %add61 = add i32 %43, %and60
  store i32 %add61, i32* %z, align 4
  br label %if.end.62

if.end.62:                                        ; preds = %if.else.57, %if.then.52
  br label %if.end.63

if.end.63:                                        ; preds = %if.end.62, %cond.end
  %46 = load i32, i32* %aSign, align 4
  %47 = load i32, i32* %z, align 4
  %cmp64 = icmp slt i32 %47, 0
  %conv65 = zext i1 %cmp64 to i32
  %xor = xor i32 %46, %conv65
  %tobool66 = icmp ne i32 %xor, 0
  br i1 %tobool66, label %land.lhs.true.67, label %if.end.72

land.lhs.true.67:                                 ; preds = %if.end.63
  %48 = load i32, i32* %z, align 4
  %tobool68 = icmp ne i32 %48, 0
  br i1 %tobool68, label %if.then.69, label %if.end.72

if.then.69:                                       ; preds = %land.lhs.true.67
  br label %invalid

invalid:                                          ; preds = %if.then.69, %if.then.19, %if.end
  call void @float_raise(i32 16)
  %49 = load i32, i32* %aSign, align 4
  %tobool70 = icmp ne i32 %49, 0
  %cond71 = select i1 %tobool70, i32 -2147483648, i32 2147483647
  store i32 %cond71, i32* %retval
  br label %return

if.end.72:                                        ; preds = %land.lhs.true.67, %if.end.63
  %50 = load i32, i32* %aSigExtra, align 4
  %tobool73 = icmp ne i32 %50, 0
  br i1 %tobool73, label %if.then.74, label %if.end.76

if.then.74:                                       ; preds = %if.end.72
  %51 = load i32, i32* @float_exception_flags, align 4
  %or75 = or i32 %51, 1
  store i32 %or75, i32* @float_exception_flags, align 4
  br label %if.end.76

if.end.76:                                        ; preds = %if.then.74, %if.end.72
  %52 = load i32, i32* %z, align 4
  store i32 %52, i32* %retval
  br label %return

return:                                           ; preds = %if.end.76, %invalid
  %53 = load i32, i32* %retval
  ret i32 %53
}

; Function Attrs: nounwind
define i32 @float64_to_int32_round_to_zero(i32 %a.0, i32 %a.1) #1 {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.float64, align 4
  %aSign = alloca i32, align 4
  %aExp = alloca i32, align 4
  %shiftCount = alloca i32, align 4
  %aSig0 = alloca i32, align 4
  %aSig1 = alloca i32, align 4
  %absZ = alloca i32, align 4
  %aSigExtra = alloca i32, align 4
  %z = alloca i32, align 4
  %high = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  store i32 %a.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  store i32 %a.1, i32* %low, align 4
  %high1 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %0 = load i32, i32* %high1, align 4
  %low2 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %1 = load i32, i32* %low2, align 4
  %call = call i32 @extractFloat64Frac1(i32 %0, i32 %1)
  store i32 %call, i32* %aSig1, align 4
  %high3 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %2 = load i32, i32* %high3, align 4
  %low4 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %3 = load i32, i32* %low4, align 4
  %call5 = call i32 @extractFloat64Frac0(i32 %2, i32 %3)
  store i32 %call5, i32* %aSig0, align 4
  %high6 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %4 = load i32, i32* %high6, align 4
  %low7 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %5 = load i32, i32* %low7, align 4
  %call8 = call i32 @extractFloat64Exp(i32 %4, i32 %5)
  store i32 %call8, i32* %aExp, align 4
  %high9 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %6 = load i32, i32* %high9, align 4
  %low10 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %7 = load i32, i32* %low10, align 4
  %call11 = call i32 @extractFloat64Sign(i32 %6, i32 %7)
  store i32 %call11, i32* %aSign, align 4
  %8 = load i32, i32* %aExp, align 4
  %sub = sub nsw i32 %8, 1043
  store i32 %sub, i32* %shiftCount, align 4
  %9 = load i32, i32* %shiftCount, align 4
  %cmp = icmp sle i32 0, %9
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %10 = load i32, i32* %aExp, align 4
  %cmp12 = icmp slt i32 1054, %10
  br i1 %cmp12, label %if.then.13, label %if.end.16

if.then.13:                                       ; preds = %if.then
  %11 = load i32, i32* %aExp, align 4
  %cmp14 = icmp eq i32 %11, 2047
  br i1 %cmp14, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %if.then.13
  %12 = load i32, i32* %aSig0, align 4
  %13 = load i32, i32* %aSig1, align 4
  %or = or i32 %12, %13
  %tobool = icmp ne i32 %or, 0
  br i1 %tobool, label %if.then.15, label %if.end

if.then.15:                                       ; preds = %land.lhs.true
  store i32 0, i32* %aSign, align 4
  br label %if.end

if.end:                                           ; preds = %if.then.15, %land.lhs.true, %if.then.13
  br label %invalid

if.end.16:                                        ; preds = %if.then
  %14 = load i32, i32* %aSig0, align 4
  %or17 = or i32 %14, 1048576
  %15 = load i32, i32* %aSig1, align 4
  %16 = load i32, i32* %shiftCount, align 4
  call void @shortShift64Left(i32 %or17, i32 %15, i32 %16, i32* %absZ, i32* %aSigExtra)
  br label %if.end.30

if.else:                                          ; preds = %entry
  %17 = load i32, i32* %aExp, align 4
  %cmp18 = icmp slt i32 %17, 1023
  br i1 %cmp18, label %if.then.19, label %if.end.26

if.then.19:                                       ; preds = %if.else
  %18 = load i32, i32* %aExp, align 4
  %19 = load i32, i32* %aSig0, align 4
  %or20 = or i32 %18, %19
  %20 = load i32, i32* %aSig1, align 4
  %or21 = or i32 %or20, %20
  %tobool22 = icmp ne i32 %or21, 0
  br i1 %tobool22, label %if.then.23, label %if.end.25

if.then.23:                                       ; preds = %if.then.19
  %21 = load i32, i32* @float_exception_flags, align 4
  %or24 = or i32 %21, 1
  store i32 %or24, i32* @float_exception_flags, align 4
  br label %if.end.25

if.end.25:                                        ; preds = %if.then.23, %if.then.19
  store i32 0, i32* %retval
  br label %return

if.end.26:                                        ; preds = %if.else
  %22 = load i32, i32* %aSig0, align 4
  %or27 = or i32 %22, 1048576
  store i32 %or27, i32* %aSig0, align 4
  %23 = load i32, i32* %aSig0, align 4
  %24 = load i32, i32* %shiftCount, align 4
  %and = and i32 %24, 31
  %shl = shl i32 %23, %and
  %25 = load i32, i32* %aSig1, align 4
  %or28 = or i32 %shl, %25
  store i32 %or28, i32* %aSigExtra, align 4
  %26 = load i32, i32* %aSig0, align 4
  %27 = load i32, i32* %shiftCount, align 4
  %sub29 = sub nsw i32 0, %27
  %shr = lshr i32 %26, %sub29
  store i32 %shr, i32* %absZ, align 4
  br label %if.end.30

if.end.30:                                        ; preds = %if.end.26, %if.end.16
  %28 = load i32, i32* %aSign, align 4
  %tobool31 = icmp ne i32 %28, 0
  br i1 %tobool31, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end.30
  %29 = load i32, i32* %absZ, align 4
  %sub32 = sub i32 0, %29
  br label %cond.end

cond.false:                                       ; preds = %if.end.30
  %30 = load i32, i32* %absZ, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub32, %cond.true ], [ %30, %cond.false ]
  store i32 %cond, i32* %z, align 4
  %31 = load i32, i32* %aSign, align 4
  %32 = load i32, i32* %z, align 4
  %cmp33 = icmp slt i32 %32, 0
  %conv = zext i1 %cmp33 to i32
  %xor = xor i32 %31, %conv
  %tobool34 = icmp ne i32 %xor, 0
  br i1 %tobool34, label %land.lhs.true.35, label %if.end.40

land.lhs.true.35:                                 ; preds = %cond.end
  %33 = load i32, i32* %z, align 4
  %tobool36 = icmp ne i32 %33, 0
  br i1 %tobool36, label %if.then.37, label %if.end.40

if.then.37:                                       ; preds = %land.lhs.true.35
  br label %invalid

invalid:                                          ; preds = %if.then.37, %if.end
  call void @float_raise(i32 16)
  %34 = load i32, i32* %aSign, align 4
  %tobool38 = icmp ne i32 %34, 0
  %cond39 = select i1 %tobool38, i32 -2147483648, i32 2147483647
  store i32 %cond39, i32* %retval
  br label %return

if.end.40:                                        ; preds = %land.lhs.true.35, %cond.end
  %35 = load i32, i32* %aSigExtra, align 4
  %tobool41 = icmp ne i32 %35, 0
  br i1 %tobool41, label %if.then.42, label %if.end.44

if.then.42:                                       ; preds = %if.end.40
  %36 = load i32, i32* @float_exception_flags, align 4
  %or43 = or i32 %36, 1
  store i32 %or43, i32* @float_exception_flags, align 4
  br label %if.end.44

if.end.44:                                        ; preds = %if.then.42, %if.end.40
  %37 = load i32, i32* %z, align 4
  store i32 %37, i32* %retval
  br label %return

return:                                           ; preds = %if.end.44, %invalid, %if.end.25
  %38 = load i32, i32* %retval
  ret i32 %38
}

; Function Attrs: nounwind
define i32 @float64_to_float32(i32 %a.0, i32 %a.1) #1 {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.float64, align 4
  %aSign = alloca i32, align 4
  %aExp = alloca i32, align 4
  %aSig0 = alloca i32, align 4
  %aSig1 = alloca i32, align 4
  %zSig = alloca i32, align 4
  %allZero = alloca i32, align 4
  %agg.tmp = alloca %struct.commonNaNT, align 4
  %high = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  store i32 %a.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  store i32 %a.1, i32* %low, align 4
  %high1 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %0 = load i32, i32* %high1, align 4
  %low2 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %1 = load i32, i32* %low2, align 4
  %call = call i32 @extractFloat64Frac1(i32 %0, i32 %1)
  store i32 %call, i32* %aSig1, align 4
  %high3 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %2 = load i32, i32* %high3, align 4
  %low4 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %3 = load i32, i32* %low4, align 4
  %call5 = call i32 @extractFloat64Frac0(i32 %2, i32 %3)
  store i32 %call5, i32* %aSig0, align 4
  %high6 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %4 = load i32, i32* %high6, align 4
  %low7 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %5 = load i32, i32* %low7, align 4
  %call8 = call i32 @extractFloat64Exp(i32 %4, i32 %5)
  store i32 %call8, i32* %aExp, align 4
  %high9 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %6 = load i32, i32* %high9, align 4
  %low10 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %7 = load i32, i32* %low10, align 4
  %call11 = call i32 @extractFloat64Sign(i32 %6, i32 %7)
  store i32 %call11, i32* %aSign, align 4
  %8 = load i32, i32* %aExp, align 4
  %cmp = icmp eq i32 %8, 2047
  br i1 %cmp, label %if.then, label %if.end.19

if.then:                                          ; preds = %entry
  %9 = load i32, i32* %aSig0, align 4
  %10 = load i32, i32* %aSig1, align 4
  %or = or i32 %9, %10
  %tobool = icmp ne i32 %or, 0
  br i1 %tobool, label %if.then.12, label %if.end

if.then.12:                                       ; preds = %if.then
  %high13 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %11 = load i32, i32* %high13, align 4
  %low14 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %12 = load i32, i32* %low14, align 4
  call void @float64ToCommonNaN(%struct.commonNaNT* sret %agg.tmp, i32 %11, i32 %12)
  %sign = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %agg.tmp, i32 0, i32 0
  %13 = load i32, i32* %sign, align 4
  %high15 = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %agg.tmp, i32 0, i32 1
  %14 = load i32, i32* %high15, align 4
  %low16 = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %agg.tmp, i32 0, i32 2
  %15 = load i32, i32* %low16, align 4
  %call17 = call i32 @commonNaNToFloat32(i32 %13, i32 %14, i32 %15)
  store i32 %call17, i32* %retval
  br label %return

if.end:                                           ; preds = %if.then
  %16 = load i32, i32* %aSign, align 4
  %call18 = call i32 @packFloat32(i32 %16, i32 255, i32 0)
  store i32 %call18, i32* %retval
  br label %return

if.end.19:                                        ; preds = %entry
  %17 = load i32, i32* %aSig0, align 4
  %18 = load i32, i32* %aSig1, align 4
  call void @shift64RightJamming(i32 %17, i32 %18, i32 22, i32* %allZero, i32* %zSig)
  %19 = load i32, i32* %aExp, align 4
  %tobool20 = icmp ne i32 %19, 0
  br i1 %tobool20, label %if.then.21, label %if.end.23

if.then.21:                                       ; preds = %if.end.19
  %20 = load i32, i32* %zSig, align 4
  %or22 = or i32 %20, 1073741824
  store i32 %or22, i32* %zSig, align 4
  br label %if.end.23

if.end.23:                                        ; preds = %if.then.21, %if.end.19
  %21 = load i32, i32* %aSign, align 4
  %22 = load i32, i32* %aExp, align 4
  %sub = sub nsw i32 %22, 897
  %23 = load i32, i32* %zSig, align 4
  %call24 = call i32 @roundAndPackFloat32(i32 %21, i32 %sub, i32 %23)
  store i32 %call24, i32* %retval
  br label %return

return:                                           ; preds = %if.end.23, %if.end, %if.then.12
  %24 = load i32, i32* %retval
  ret i32 %24
}

; Function Attrs: nounwind
define internal i32 @commonNaNToFloat32(i32 %a.0, i32 %a.1, i32 %a.2) #1 {
entry:
  %a = alloca %struct.commonNaNT, align 4
  %sign = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %a, i32 0, i32 0
  store i32 %a.0, i32* %sign, align 4
  %high = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %a, i32 0, i32 1
  store i32 %a.1, i32* %high, align 4
  %low = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %a, i32 0, i32 2
  store i32 %a.2, i32* %low, align 4
  %sign1 = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %a, i32 0, i32 0
  %0 = load i32, i32* %sign1, align 4
  %shl = shl i32 %0, 31
  %or = or i32 %shl, 2143289344
  %high2 = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %a, i32 0, i32 1
  %1 = load i32, i32* %high2, align 4
  %shr = lshr i32 %1, 9
  %or3 = or i32 %or, %shr
  ret i32 %or3
}

; Function Attrs: nounwind
define internal void @float64ToCommonNaN(%struct.commonNaNT* noalias sret %agg.result, i32 %a.0, i32 %a.1) #1 {
entry:
  %a = alloca %struct.float64, align 4
  %z = alloca %struct.commonNaNT, align 4
  %high = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  store i32 %a.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  store i32 %a.1, i32* %low, align 4
  %high1 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %0 = load i32, i32* %high1, align 4
  %low2 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %1 = load i32, i32* %low2, align 4
  %call = call i32 @float64_is_signaling_nan(i32 %0, i32 %1)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @float_raise(i32 16)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %high3 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %2 = load i32, i32* %high3, align 4
  %shr = lshr i32 %2, 31
  %sign = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %z, i32 0, i32 0
  store i32 %shr, i32* %sign, align 4
  %high4 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %3 = load i32, i32* %high4, align 4
  %low5 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %4 = load i32, i32* %low5, align 4
  %high6 = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %z, i32 0, i32 1
  %low7 = getelementptr inbounds %struct.commonNaNT, %struct.commonNaNT* %z, i32 0, i32 2
  call void @shortShift64Left(i32 %3, i32 %4, i32 12, i32* %high6, i32* %low7)
  %5 = bitcast %struct.commonNaNT* %agg.result to i8*
  %6 = bitcast %struct.commonNaNT* %z to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %5, i8* %6, i32 12, i32 4, i1 false)
  ret void
}

; Function Attrs: nounwind
define i64 @float64_round_to_int(i32 %a.0, i32 %a.1) #1 {
entry:
  %retval = alloca %struct.float64, align 4
  %a = alloca %struct.float64, align 4
  %aSign = alloca i32, align 4
  %aExp = alloca i32, align 4
  %lastBitMask = alloca i32, align 4
  %roundBitsMask = alloca i32, align 4
  %roundingMode = alloca i32, align 4
  %z = alloca %struct.float64, align 4
  %high = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  store i32 %a.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  store i32 %a.1, i32* %low, align 4
  %high1 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %0 = load i32, i32* %high1, align 4
  %low2 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %1 = load i32, i32* %low2, align 4
  %call = call i32 @extractFloat64Exp(i32 %0, i32 %1)
  store i32 %call, i32* %aExp, align 4
  %2 = load i32, i32* %aExp, align 4
  %cmp = icmp sle i32 1043, %2
  br i1 %cmp, label %if.then, label %if.else.67

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %aExp, align 4
  %cmp3 = icmp sle i32 1075, %3
  br i1 %cmp3, label %if.then.4, label %if.end.18

if.then.4:                                        ; preds = %if.then
  %4 = load i32, i32* %aExp, align 4
  %cmp5 = icmp eq i32 %4, 2047
  br i1 %cmp5, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %if.then.4
  %high6 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %5 = load i32, i32* %high6, align 4
  %low7 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %6 = load i32, i32* %low7, align 4
  %call8 = call i32 @extractFloat64Frac0(i32 %5, i32 %6)
  %high9 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %7 = load i32, i32* %high9, align 4
  %low10 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %8 = load i32, i32* %low10, align 4
  %call11 = call i32 @extractFloat64Frac1(i32 %7, i32 %8)
  %or = or i32 %call8, %call11
  %tobool = icmp ne i32 %or, 0
  br i1 %tobool, label %if.then.12, label %if.end

if.then.12:                                       ; preds = %land.lhs.true
  %high13 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %9 = load i32, i32* %high13, align 4
  %low14 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %10 = load i32, i32* %low14, align 4
  %high15 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %11 = load i32, i32* %high15, align 4
  %low16 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %12 = load i32, i32* %low16, align 4
  %call17 = call i64 @propagateFloat64NaN(i32 %9, i32 %10, i32 %11, i32 %12)
  %13 = bitcast %struct.float64* %retval to i64*
  store i64 %call17, i64* %13, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %if.then.4
  %14 = bitcast %struct.float64* %retval to i8*
  %15 = bitcast %struct.float64* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %14, i8* %15, i32 8, i32 4, i1 false)
  br label %return

if.end.18:                                        ; preds = %if.then
  store i32 1, i32* %lastBitMask, align 4
  %16 = load i32, i32* %lastBitMask, align 4
  %17 = load i32, i32* %aExp, align 4
  %sub = sub nsw i32 1074, %17
  %shl = shl i32 %16, %sub
  %shl19 = shl i32 %shl, 1
  store i32 %shl19, i32* %lastBitMask, align 4
  %18 = load i32, i32* %lastBitMask, align 4
  %sub20 = sub i32 %18, 1
  store i32 %sub20, i32* %roundBitsMask, align 4
  %19 = bitcast %struct.float64* %z to i8*
  %20 = bitcast %struct.float64* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %19, i8* %20, i32 8, i32 4, i1 false)
  %21 = load i32, i32* @float_rounding_mode, align 4
  store i32 %21, i32* %roundingMode, align 4
  %22 = load i32, i32* %roundingMode, align 4
  %cmp21 = icmp eq i32 %22, 0
  br i1 %cmp21, label %if.then.22, label %if.else.48

if.then.22:                                       ; preds = %if.end.18
  %23 = load i32, i32* %lastBitMask, align 4
  %tobool23 = icmp ne i32 %23, 0
  br i1 %tobool23, label %if.then.24, label %if.else

if.then.24:                                       ; preds = %if.then.22
  %high25 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 0
  %24 = load i32, i32* %high25, align 4
  %low26 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 1
  %25 = load i32, i32* %low26, align 4
  %26 = load i32, i32* %lastBitMask, align 4
  %shr = lshr i32 %26, 1
  %high27 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 0
  %low28 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 1
  call void @add64(i32 %24, i32 %25, i32 0, i32 %shr, i32* %high27, i32* %low28)
  %low29 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 1
  %27 = load i32, i32* %low29, align 4
  %28 = load i32, i32* %roundBitsMask, align 4
  %and = and i32 %27, %28
  %cmp30 = icmp eq i32 %and, 0
  br i1 %cmp30, label %if.then.31, label %if.end.34

if.then.31:                                       ; preds = %if.then.24
  %29 = load i32, i32* %lastBitMask, align 4
  %neg = xor i32 %29, -1
  %low32 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 1
  %30 = load i32, i32* %low32, align 4
  %and33 = and i32 %30, %neg
  store i32 %and33, i32* %low32, align 4
  br label %if.end.34

if.end.34:                                        ; preds = %if.then.31, %if.then.24
  br label %if.end.47

if.else:                                          ; preds = %if.then.22
  %low35 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 1
  %31 = load i32, i32* %low35, align 4
  %cmp36 = icmp slt i32 %31, 0
  br i1 %cmp36, label %if.then.37, label %if.end.46

if.then.37:                                       ; preds = %if.else
  %high38 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 0
  %32 = load i32, i32* %high38, align 4
  %inc = add i32 %32, 1
  store i32 %inc, i32* %high38, align 4
  %low39 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 1
  %33 = load i32, i32* %low39, align 4
  %shl40 = shl i32 %33, 1
  %cmp41 = icmp eq i32 %shl40, 0
  br i1 %cmp41, label %if.then.42, label %if.end.45

if.then.42:                                       ; preds = %if.then.37
  %high43 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 0
  %34 = load i32, i32* %high43, align 4
  %and44 = and i32 %34, -2
  store i32 %and44, i32* %high43, align 4
  br label %if.end.45

if.end.45:                                        ; preds = %if.then.42, %if.then.37
  br label %if.end.46

if.end.46:                                        ; preds = %if.end.45, %if.else
  br label %if.end.47

if.end.47:                                        ; preds = %if.end.46, %if.end.34
  br label %if.end.63

if.else.48:                                       ; preds = %if.end.18
  %35 = load i32, i32* %roundingMode, align 4
  %cmp49 = icmp ne i32 %35, 1
  br i1 %cmp49, label %if.then.50, label %if.end.62

if.then.50:                                       ; preds = %if.else.48
  %high51 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 0
  %36 = load i32, i32* %high51, align 4
  %low52 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 1
  %37 = load i32, i32* %low52, align 4
  %call53 = call i32 @extractFloat64Sign(i32 %36, i32 %37)
  %38 = load i32, i32* %roundingMode, align 4
  %cmp54 = icmp eq i32 %38, 2
  %conv = zext i1 %cmp54 to i32
  %xor = xor i32 %call53, %conv
  %tobool55 = icmp ne i32 %xor, 0
  br i1 %tobool55, label %if.then.56, label %if.end.61

if.then.56:                                       ; preds = %if.then.50
  %high57 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 0
  %39 = load i32, i32* %high57, align 4
  %low58 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 1
  %40 = load i32, i32* %low58, align 4
  %41 = load i32, i32* %roundBitsMask, align 4
  %high59 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 0
  %low60 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 1
  call void @add64(i32 %39, i32 %40, i32 0, i32 %41, i32* %high59, i32* %low60)
  br label %if.end.61

if.end.61:                                        ; preds = %if.then.56, %if.then.50
  br label %if.end.62

if.end.62:                                        ; preds = %if.end.61, %if.else.48
  br label %if.end.63

if.end.63:                                        ; preds = %if.end.62, %if.end.47
  %42 = load i32, i32* %roundBitsMask, align 4
  %neg64 = xor i32 %42, -1
  %low65 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 1
  %43 = load i32, i32* %low65, align 4
  %and66 = and i32 %43, %neg64
  store i32 %and66, i32* %low65, align 4
  br label %if.end.157

if.else.67:                                       ; preds = %entry
  %44 = load i32, i32* %aExp, align 4
  %cmp68 = icmp sle i32 %44, 1022
  br i1 %cmp68, label %if.then.70, label %if.end.109

if.then.70:                                       ; preds = %if.else.67
  %high71 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %45 = load i32, i32* %high71, align 4
  %shl72 = shl i32 %45, 1
  %low73 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %46 = load i32, i32* %low73, align 4
  %or74 = or i32 %shl72, %46
  %cmp75 = icmp eq i32 %or74, 0
  br i1 %cmp75, label %if.then.77, label %if.end.78

if.then.77:                                       ; preds = %if.then.70
  %47 = bitcast %struct.float64* %retval to i8*
  %48 = bitcast %struct.float64* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %47, i8* %48, i32 8, i32 4, i1 false)
  br label %return

if.end.78:                                        ; preds = %if.then.70
  %49 = load i32, i32* @float_exception_flags, align 4
  %or79 = or i32 %49, 1
  store i32 %or79, i32* @float_exception_flags, align 4
  %high80 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %50 = load i32, i32* %high80, align 4
  %low81 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %51 = load i32, i32* %low81, align 4
  %call82 = call i32 @extractFloat64Sign(i32 %50, i32 %51)
  store i32 %call82, i32* %aSign, align 4
  %52 = load i32, i32* @float_rounding_mode, align 4
  switch i32 %52, label %sw.epilog [
    i32 0, label %sw.bb
    i32 3, label %sw.bb.97
    i32 2, label %sw.bb.101
  ]

sw.bb:                                            ; preds = %if.end.78
  %53 = load i32, i32* %aExp, align 4
  %cmp83 = icmp eq i32 %53, 1022
  br i1 %cmp83, label %land.lhs.true.85, label %if.end.96

land.lhs.true.85:                                 ; preds = %sw.bb
  %high86 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %54 = load i32, i32* %high86, align 4
  %low87 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %55 = load i32, i32* %low87, align 4
  %call88 = call i32 @extractFloat64Frac0(i32 %54, i32 %55)
  %high89 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %56 = load i32, i32* %high89, align 4
  %low90 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %57 = load i32, i32* %low90, align 4
  %call91 = call i32 @extractFloat64Frac1(i32 %56, i32 %57)
  %or92 = or i32 %call88, %call91
  %tobool93 = icmp ne i32 %or92, 0
  br i1 %tobool93, label %if.then.94, label %if.end.96

if.then.94:                                       ; preds = %land.lhs.true.85
  %58 = load i32, i32* %aSign, align 4
  %call95 = call i64 @packFloat64(i32 %58, i32 1023, i32 0, i32 0)
  %59 = bitcast %struct.float64* %retval to i64*
  store i64 %call95, i64* %59, align 4
  br label %return

if.end.96:                                        ; preds = %land.lhs.true.85, %sw.bb
  br label %sw.epilog

sw.bb.97:                                         ; preds = %if.end.78
  %60 = load i32, i32* %aSign, align 4
  %tobool98 = icmp ne i32 %60, 0
  br i1 %tobool98, label %cond.true, label %cond.false

cond.true:                                        ; preds = %sw.bb.97
  %call99 = call i64 @packFloat64(i32 1, i32 1023, i32 0, i32 0)
  %61 = bitcast %struct.float64* %retval to i64*
  store i64 %call99, i64* %61, align 4
  br label %cond.end

cond.false:                                       ; preds = %sw.bb.97
  %call100 = call i64 @packFloat64(i32 0, i32 0, i32 0, i32 0)
  %62 = bitcast %struct.float64* %retval to i64*
  store i64 %call100, i64* %62, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  br label %return

sw.bb.101:                                        ; preds = %if.end.78
  %63 = load i32, i32* %aSign, align 4
  %tobool102 = icmp ne i32 %63, 0
  br i1 %tobool102, label %cond.true.103, label %cond.false.105

cond.true.103:                                    ; preds = %sw.bb.101
  %call104 = call i64 @packFloat64(i32 1, i32 0, i32 0, i32 0)
  %64 = bitcast %struct.float64* %retval to i64*
  store i64 %call104, i64* %64, align 4
  br label %cond.end.107

cond.false.105:                                   ; preds = %sw.bb.101
  %call106 = call i64 @packFloat64(i32 0, i32 1023, i32 0, i32 0)
  %65 = bitcast %struct.float64* %retval to i64*
  store i64 %call106, i64* %65, align 4
  br label %cond.end.107

cond.end.107:                                     ; preds = %cond.false.105, %cond.true.103
  br label %return

sw.epilog:                                        ; preds = %if.end.78, %if.end.96
  %66 = load i32, i32* %aSign, align 4
  %call108 = call i64 @packFloat64(i32 %66, i32 0, i32 0, i32 0)
  %67 = bitcast %struct.float64* %retval to i64*
  store i64 %call108, i64* %67, align 4
  br label %return

if.end.109:                                       ; preds = %if.else.67
  store i32 1, i32* %lastBitMask, align 4
  %68 = load i32, i32* %aExp, align 4
  %sub110 = sub nsw i32 1043, %68
  %69 = load i32, i32* %lastBitMask, align 4
  %shl111 = shl i32 %69, %sub110
  store i32 %shl111, i32* %lastBitMask, align 4
  %70 = load i32, i32* %lastBitMask, align 4
  %sub112 = sub i32 %70, 1
  store i32 %sub112, i32* %roundBitsMask, align 4
  %low113 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 1
  store i32 0, i32* %low113, align 4
  %high114 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %71 = load i32, i32* %high114, align 4
  %high115 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 0
  store i32 %71, i32* %high115, align 4
  %72 = load i32, i32* @float_rounding_mode, align 4
  store i32 %72, i32* %roundingMode, align 4
  %73 = load i32, i32* %roundingMode, align 4
  %cmp116 = icmp eq i32 %73, 0
  br i1 %cmp116, label %if.then.118, label %if.else.132

if.then.118:                                      ; preds = %if.end.109
  %74 = load i32, i32* %lastBitMask, align 4
  %shr119 = lshr i32 %74, 1
  %high120 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 0
  %75 = load i32, i32* %high120, align 4
  %add = add i32 %75, %shr119
  store i32 %add, i32* %high120, align 4
  %high121 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 0
  %76 = load i32, i32* %high121, align 4
  %77 = load i32, i32* %roundBitsMask, align 4
  %and122 = and i32 %76, %77
  %low123 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %78 = load i32, i32* %low123, align 4
  %or124 = or i32 %and122, %78
  %cmp125 = icmp eq i32 %or124, 0
  br i1 %cmp125, label %if.then.127, label %if.end.131

if.then.127:                                      ; preds = %if.then.118
  %79 = load i32, i32* %lastBitMask, align 4
  %neg128 = xor i32 %79, -1
  %high129 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 0
  %80 = load i32, i32* %high129, align 4
  %and130 = and i32 %80, %neg128
  store i32 %and130, i32* %high129, align 4
  br label %if.end.131

if.end.131:                                       ; preds = %if.then.127, %if.then.118
  br label %if.end.153

if.else.132:                                      ; preds = %if.end.109
  %81 = load i32, i32* %roundingMode, align 4
  %cmp133 = icmp ne i32 %81, 1
  br i1 %cmp133, label %if.then.135, label %if.end.152

if.then.135:                                      ; preds = %if.else.132
  %high136 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 0
  %82 = load i32, i32* %high136, align 4
  %low137 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 1
  %83 = load i32, i32* %low137, align 4
  %call138 = call i32 @extractFloat64Sign(i32 %82, i32 %83)
  %84 = load i32, i32* %roundingMode, align 4
  %cmp139 = icmp eq i32 %84, 2
  %conv140 = zext i1 %cmp139 to i32
  %xor141 = xor i32 %call138, %conv140
  %tobool142 = icmp ne i32 %xor141, 0
  br i1 %tobool142, label %if.then.143, label %if.end.151

if.then.143:                                      ; preds = %if.then.135
  %low144 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %85 = load i32, i32* %low144, align 4
  %cmp145 = icmp ne i32 %85, 0
  %conv146 = zext i1 %cmp145 to i32
  %high147 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 0
  %86 = load i32, i32* %high147, align 4
  %or148 = or i32 %86, %conv146
  store i32 %or148, i32* %high147, align 4
  %87 = load i32, i32* %roundBitsMask, align 4
  %high149 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 0
  %88 = load i32, i32* %high149, align 4
  %add150 = add i32 %88, %87
  store i32 %add150, i32* %high149, align 4
  br label %if.end.151

if.end.151:                                       ; preds = %if.then.143, %if.then.135
  br label %if.end.152

if.end.152:                                       ; preds = %if.end.151, %if.else.132
  br label %if.end.153

if.end.153:                                       ; preds = %if.end.152, %if.end.131
  %89 = load i32, i32* %roundBitsMask, align 4
  %neg154 = xor i32 %89, -1
  %high155 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 0
  %90 = load i32, i32* %high155, align 4
  %and156 = and i32 %90, %neg154
  store i32 %and156, i32* %high155, align 4
  br label %if.end.157

if.end.157:                                       ; preds = %if.end.153, %if.end.63
  %low158 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 1
  %91 = load i32, i32* %low158, align 4
  %low159 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %92 = load i32, i32* %low159, align 4
  %cmp160 = icmp ne i32 %91, %92
  br i1 %cmp160, label %if.then.166, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end.157
  %high162 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 0
  %93 = load i32, i32* %high162, align 4
  %high163 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %94 = load i32, i32* %high163, align 4
  %cmp164 = icmp ne i32 %93, %94
  br i1 %cmp164, label %if.then.166, label %if.end.168

if.then.166:                                      ; preds = %lor.lhs.false, %if.end.157
  %95 = load i32, i32* @float_exception_flags, align 4
  %or167 = or i32 %95, 1
  store i32 %or167, i32* @float_exception_flags, align 4
  br label %if.end.168

if.end.168:                                       ; preds = %if.then.166, %lor.lhs.false
  %96 = bitcast %struct.float64* %retval to i8*
  %97 = bitcast %struct.float64* %z to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %96, i8* %97, i32 8, i32 4, i1 false)
  br label %return

return:                                           ; preds = %if.end.168, %sw.epilog, %cond.end.107, %cond.end, %if.then.94, %if.then.77, %if.end, %if.then.12
  %98 = bitcast %struct.float64* %retval to i64*
  %99 = load i64, i64* %98, align 4
  ret i64 %99
}

; Function Attrs: nounwind
define internal i64 @propagateFloat64NaN(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #1 {
entry:
  %retval = alloca %struct.float64, align 4
  %a = alloca %struct.float64, align 4
  %b = alloca %struct.float64, align 4
  %aIsNaN = alloca i32, align 4
  %aIsSignalingNaN = alloca i32, align 4
  %bIsNaN = alloca i32, align 4
  %bIsSignalingNaN = alloca i32, align 4
  %high = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  store i32 %a.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  store i32 %a.1, i32* %low, align 4
  %high2 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  store i32 %b.0, i32* %high2, align 4
  %low3 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  store i32 %b.1, i32* %low3, align 4
  %high4 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %0 = load i32, i32* %high4, align 4
  %low5 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %1 = load i32, i32* %low5, align 4
  %call = call i32 @float64_is_nan(i32 %0, i32 %1)
  store i32 %call, i32* %aIsNaN, align 4
  %high6 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %2 = load i32, i32* %high6, align 4
  %low7 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %3 = load i32, i32* %low7, align 4
  %call8 = call i32 @float64_is_signaling_nan(i32 %2, i32 %3)
  store i32 %call8, i32* %aIsSignalingNaN, align 4
  %high9 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %4 = load i32, i32* %high9, align 4
  %low10 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %5 = load i32, i32* %low10, align 4
  %call11 = call i32 @float64_is_nan(i32 %4, i32 %5)
  store i32 %call11, i32* %bIsNaN, align 4
  %high12 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %6 = load i32, i32* %high12, align 4
  %low13 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %7 = load i32, i32* %low13, align 4
  %call14 = call i32 @float64_is_signaling_nan(i32 %6, i32 %7)
  store i32 %call14, i32* %bIsSignalingNaN, align 4
  %high15 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %8 = load i32, i32* %high15, align 4
  %or = or i32 %8, 524288
  store i32 %or, i32* %high15, align 4
  %high16 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %9 = load i32, i32* %high16, align 4
  %or17 = or i32 %9, 524288
  store i32 %or17, i32* %high16, align 4
  %10 = load i32, i32* %aIsSignalingNaN, align 4
  %11 = load i32, i32* %bIsSignalingNaN, align 4
  %or18 = or i32 %10, %11
  %tobool = icmp ne i32 %or18, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @float_raise(i32 16)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %12 = load i32, i32* %bIsSignalingNaN, align 4
  %tobool19 = icmp ne i32 %12, 0
  br i1 %tobool19, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %13 = bitcast %struct.float64* %retval to i8*
  %14 = bitcast %struct.float64* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %13, i8* %14, i32 8, i32 4, i1 false)
  br label %cond.end.27

cond.false:                                       ; preds = %if.end
  %15 = load i32, i32* %aIsSignalingNaN, align 4
  %tobool20 = icmp ne i32 %15, 0
  br i1 %tobool20, label %cond.true.21, label %cond.false.22

cond.true.21:                                     ; preds = %cond.false
  %16 = bitcast %struct.float64* %retval to i8*
  %17 = bitcast %struct.float64* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %16, i8* %17, i32 8, i32 4, i1 false)
  br label %cond.end.26

cond.false.22:                                    ; preds = %cond.false
  %18 = load i32, i32* %bIsNaN, align 4
  %tobool23 = icmp ne i32 %18, 0
  br i1 %tobool23, label %cond.true.24, label %cond.false.25

cond.true.24:                                     ; preds = %cond.false.22
  %19 = bitcast %struct.float64* %retval to i8*
  %20 = bitcast %struct.float64* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %19, i8* %20, i32 8, i32 4, i1 false)
  br label %cond.end

cond.false.25:                                    ; preds = %cond.false.22
  %21 = bitcast %struct.float64* %retval to i8*
  %22 = bitcast %struct.float64* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %21, i8* %22, i32 8, i32 4, i1 false)
  br label %cond.end

cond.end:                                         ; preds = %cond.false.25, %cond.true.24
  br label %cond.end.26

cond.end.26:                                      ; preds = %cond.end, %cond.true.21
  br label %cond.end.27

cond.end.27:                                      ; preds = %cond.end.26, %cond.true
  %23 = bitcast %struct.float64* %retval to i64*
  %24 = load i64, i64* %23, align 4
  ret i64 %24
}

; Function Attrs: nounwind
define i64 @float64_add(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #1 {
entry:
  %retval = alloca %struct.float64, align 4
  %a = alloca %struct.float64, align 4
  %b = alloca %struct.float64, align 4
  %aSign = alloca i32, align 4
  %bSign = alloca i32, align 4
  %high = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  store i32 %a.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  store i32 %a.1, i32* %low, align 4
  %high2 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  store i32 %b.0, i32* %high2, align 4
  %low3 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  store i32 %b.1, i32* %low3, align 4
  %high4 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %0 = load i32, i32* %high4, align 4
  %low5 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %1 = load i32, i32* %low5, align 4
  %call = call i32 @extractFloat64Sign(i32 %0, i32 %1)
  store i32 %call, i32* %aSign, align 4
  %high6 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %2 = load i32, i32* %high6, align 4
  %low7 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %3 = load i32, i32* %low7, align 4
  %call8 = call i32 @extractFloat64Sign(i32 %2, i32 %3)
  store i32 %call8, i32* %bSign, align 4
  %4 = load i32, i32* %aSign, align 4
  %5 = load i32, i32* %bSign, align 4
  %cmp = icmp eq i32 %4, %5
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %6 = load i32, i32* %aSign, align 4
  %high9 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %7 = load i32, i32* %high9, align 4
  %low10 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %8 = load i32, i32* %low10, align 4
  %high11 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %9 = load i32, i32* %high11, align 4
  %low12 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %10 = load i32, i32* %low12, align 4
  %call13 = call i64 @addFloat64Sigs(i32 %7, i32 %8, i32 %9, i32 %10, i32 %6)
  %11 = bitcast %struct.float64* %retval to i64*
  store i64 %call13, i64* %11, align 4
  br label %return

if.else:                                          ; preds = %entry
  %12 = load i32, i32* %aSign, align 4
  %high14 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %13 = load i32, i32* %high14, align 4
  %low15 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %14 = load i32, i32* %low15, align 4
  %high16 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %15 = load i32, i32* %high16, align 4
  %low17 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %16 = load i32, i32* %low17, align 4
  %call18 = call i64 @subFloat64Sigs(i32 %13, i32 %14, i32 %15, i32 %16, i32 %12)
  %17 = bitcast %struct.float64* %retval to i64*
  store i64 %call18, i64* %17, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %18 = bitcast %struct.float64* %retval to i64*
  %19 = load i64, i64* %18, align 4
  ret i64 %19
}

; Function Attrs: nounwind
define internal i64 @addFloat64Sigs(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1, i32 %zSign) #1 {
entry:
  %retval = alloca %struct.float64, align 4
  %a = alloca %struct.float64, align 4
  %b = alloca %struct.float64, align 4
  %zSign.addr = alloca i32, align 4
  %aExp = alloca i32, align 4
  %bExp = alloca i32, align 4
  %zExp = alloca i32, align 4
  %aSig0 = alloca i32, align 4
  %aSig1 = alloca i32, align 4
  %bSig0 = alloca i32, align 4
  %bSig1 = alloca i32, align 4
  %zSig0 = alloca i32, align 4
  %zSig1 = alloca i32, align 4
  %zSig2 = alloca i32, align 4
  %expDiff = alloca i32, align 4
  %high = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  store i32 %a.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  store i32 %a.1, i32* %low, align 4
  %high2 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  store i32 %b.0, i32* %high2, align 4
  %low3 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  store i32 %b.1, i32* %low3, align 4
  store i32 %zSign, i32* %zSign.addr, align 4
  %high4 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %0 = load i32, i32* %high4, align 4
  %low5 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %1 = load i32, i32* %low5, align 4
  %call = call i32 @extractFloat64Frac1(i32 %0, i32 %1)
  store i32 %call, i32* %aSig1, align 4
  %high6 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %2 = load i32, i32* %high6, align 4
  %low7 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %3 = load i32, i32* %low7, align 4
  %call8 = call i32 @extractFloat64Frac0(i32 %2, i32 %3)
  store i32 %call8, i32* %aSig0, align 4
  %high9 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %4 = load i32, i32* %high9, align 4
  %low10 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %5 = load i32, i32* %low10, align 4
  %call11 = call i32 @extractFloat64Exp(i32 %4, i32 %5)
  store i32 %call11, i32* %aExp, align 4
  %high12 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %6 = load i32, i32* %high12, align 4
  %low13 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %7 = load i32, i32* %low13, align 4
  %call14 = call i32 @extractFloat64Frac1(i32 %6, i32 %7)
  store i32 %call14, i32* %bSig1, align 4
  %high15 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %8 = load i32, i32* %high15, align 4
  %low16 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %9 = load i32, i32* %low16, align 4
  %call17 = call i32 @extractFloat64Frac0(i32 %8, i32 %9)
  store i32 %call17, i32* %bSig0, align 4
  %high18 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %10 = load i32, i32* %high18, align 4
  %low19 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %11 = load i32, i32* %low19, align 4
  %call20 = call i32 @extractFloat64Exp(i32 %10, i32 %11)
  store i32 %call20, i32* %bExp, align 4
  %12 = load i32, i32* %aExp, align 4
  %13 = load i32, i32* %bExp, align 4
  %sub = sub nsw i32 %12, %13
  store i32 %sub, i32* %expDiff, align 4
  %14 = load i32, i32* %expDiff, align 4
  %cmp = icmp slt i32 0, %14
  br i1 %cmp, label %if.then, label %if.else.34

if.then:                                          ; preds = %entry
  %15 = load i32, i32* %aExp, align 4
  %cmp21 = icmp eq i32 %15, 2047
  br i1 %cmp21, label %if.then.22, label %if.end.29

if.then.22:                                       ; preds = %if.then
  %16 = load i32, i32* %aSig0, align 4
  %17 = load i32, i32* %aSig1, align 4
  %or = or i32 %16, %17
  %tobool = icmp ne i32 %or, 0
  br i1 %tobool, label %if.then.23, label %if.end

if.then.23:                                       ; preds = %if.then.22
  %high24 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %18 = load i32, i32* %high24, align 4
  %low25 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %19 = load i32, i32* %low25, align 4
  %high26 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %20 = load i32, i32* %high26, align 4
  %low27 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %21 = load i32, i32* %low27, align 4
  %call28 = call i64 @propagateFloat64NaN(i32 %18, i32 %19, i32 %20, i32 %21)
  %22 = bitcast %struct.float64* %retval to i64*
  store i64 %call28, i64* %22, align 4
  br label %return

if.end:                                           ; preds = %if.then.22
  %23 = bitcast %struct.float64* %retval to i8*
  %24 = bitcast %struct.float64* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %23, i8* %24, i32 8, i32 4, i1 false)
  br label %return

if.end.29:                                        ; preds = %if.then
  %25 = load i32, i32* %bExp, align 4
  %cmp30 = icmp eq i32 %25, 0
  br i1 %cmp30, label %if.then.31, label %if.else

if.then.31:                                       ; preds = %if.end.29
  %26 = load i32, i32* %expDiff, align 4
  %dec = add nsw i32 %26, -1
  store i32 %dec, i32* %expDiff, align 4
  br label %if.end.33

if.else:                                          ; preds = %if.end.29
  %27 = load i32, i32* %bSig0, align 4
  %or32 = or i32 %27, 1048576
  store i32 %or32, i32* %bSig0, align 4
  br label %if.end.33

if.end.33:                                        ; preds = %if.else, %if.then.31
  %28 = load i32, i32* %bSig0, align 4
  %29 = load i32, i32* %bSig1, align 4
  %30 = load i32, i32* %expDiff, align 4
  call void @shift64ExtraRightJamming(i32 %28, i32 %29, i32 0, i32 %30, i32* %bSig0, i32* %bSig1, i32* %zSig2)
  %31 = load i32, i32* %aExp, align 4
  store i32 %31, i32* %zExp, align 4
  br label %if.end.77

if.else.34:                                       ; preds = %entry
  %32 = load i32, i32* %expDiff, align 4
  %cmp35 = icmp slt i32 %32, 0
  br i1 %cmp35, label %if.then.36, label %if.else.56

if.then.36:                                       ; preds = %if.else.34
  %33 = load i32, i32* %bExp, align 4
  %cmp37 = icmp eq i32 %33, 2047
  br i1 %cmp37, label %if.then.38, label %if.end.49

if.then.38:                                       ; preds = %if.then.36
  %34 = load i32, i32* %bSig0, align 4
  %35 = load i32, i32* %bSig1, align 4
  %or39 = or i32 %34, %35
  %tobool40 = icmp ne i32 %or39, 0
  br i1 %tobool40, label %if.then.41, label %if.end.47

if.then.41:                                       ; preds = %if.then.38
  %high42 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %36 = load i32, i32* %high42, align 4
  %low43 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %37 = load i32, i32* %low43, align 4
  %high44 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %38 = load i32, i32* %high44, align 4
  %low45 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %39 = load i32, i32* %low45, align 4
  %call46 = call i64 @propagateFloat64NaN(i32 %36, i32 %37, i32 %38, i32 %39)
  %40 = bitcast %struct.float64* %retval to i64*
  store i64 %call46, i64* %40, align 4
  br label %return

if.end.47:                                        ; preds = %if.then.38
  %41 = load i32, i32* %zSign.addr, align 4
  %call48 = call i64 @packFloat64(i32 %41, i32 2047, i32 0, i32 0)
  %42 = bitcast %struct.float64* %retval to i64*
  store i64 %call48, i64* %42, align 4
  br label %return

if.end.49:                                        ; preds = %if.then.36
  %43 = load i32, i32* %aExp, align 4
  %cmp50 = icmp eq i32 %43, 0
  br i1 %cmp50, label %if.then.51, label %if.else.52

if.then.51:                                       ; preds = %if.end.49
  %44 = load i32, i32* %expDiff, align 4
  %inc = add nsw i32 %44, 1
  store i32 %inc, i32* %expDiff, align 4
  br label %if.end.54

if.else.52:                                       ; preds = %if.end.49
  %45 = load i32, i32* %aSig0, align 4
  %or53 = or i32 %45, 1048576
  store i32 %or53, i32* %aSig0, align 4
  br label %if.end.54

if.end.54:                                        ; preds = %if.else.52, %if.then.51
  %46 = load i32, i32* %aSig0, align 4
  %47 = load i32, i32* %aSig1, align 4
  %48 = load i32, i32* %expDiff, align 4
  %sub55 = sub nsw i32 0, %48
  call void @shift64ExtraRightJamming(i32 %46, i32 %47, i32 0, i32 %sub55, i32* %aSig0, i32* %aSig1, i32* %zSig2)
  %49 = load i32, i32* %bExp, align 4
  store i32 %49, i32* %zExp, align 4
  br label %if.end.76

if.else.56:                                       ; preds = %if.else.34
  %50 = load i32, i32* %aExp, align 4
  %cmp57 = icmp eq i32 %50, 2047
  br i1 %cmp57, label %if.then.58, label %if.end.70

if.then.58:                                       ; preds = %if.else.56
  %51 = load i32, i32* %aSig0, align 4
  %52 = load i32, i32* %aSig1, align 4
  %or59 = or i32 %51, %52
  %53 = load i32, i32* %bSig0, align 4
  %or60 = or i32 %or59, %53
  %54 = load i32, i32* %bSig1, align 4
  %or61 = or i32 %or60, %54
  %tobool62 = icmp ne i32 %or61, 0
  br i1 %tobool62, label %if.then.63, label %if.end.69

if.then.63:                                       ; preds = %if.then.58
  %high64 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %55 = load i32, i32* %high64, align 4
  %low65 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %56 = load i32, i32* %low65, align 4
  %high66 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %57 = load i32, i32* %high66, align 4
  %low67 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %58 = load i32, i32* %low67, align 4
  %call68 = call i64 @propagateFloat64NaN(i32 %55, i32 %56, i32 %57, i32 %58)
  %59 = bitcast %struct.float64* %retval to i64*
  store i64 %call68, i64* %59, align 4
  br label %return

if.end.69:                                        ; preds = %if.then.58
  %60 = bitcast %struct.float64* %retval to i8*
  %61 = bitcast %struct.float64* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %60, i8* %61, i32 8, i32 4, i1 false)
  br label %return

if.end.70:                                        ; preds = %if.else.56
  %62 = load i32, i32* %aSig0, align 4
  %63 = load i32, i32* %aSig1, align 4
  %64 = load i32, i32* %bSig0, align 4
  %65 = load i32, i32* %bSig1, align 4
  call void @add64(i32 %62, i32 %63, i32 %64, i32 %65, i32* %zSig0, i32* %zSig1)
  %66 = load i32, i32* %aExp, align 4
  %cmp71 = icmp eq i32 %66, 0
  br i1 %cmp71, label %if.then.72, label %if.end.74

if.then.72:                                       ; preds = %if.end.70
  %67 = load i32, i32* %zSign.addr, align 4
  %68 = load i32, i32* %zSig0, align 4
  %69 = load i32, i32* %zSig1, align 4
  %call73 = call i64 @packFloat64(i32 %67, i32 0, i32 %68, i32 %69)
  %70 = bitcast %struct.float64* %retval to i64*
  store i64 %call73, i64* %70, align 4
  br label %return

if.end.74:                                        ; preds = %if.end.70
  store i32 0, i32* %zSig2, align 4
  %71 = load i32, i32* %zSig0, align 4
  %or75 = or i32 %71, 2097152
  store i32 %or75, i32* %zSig0, align 4
  %72 = load i32, i32* %aExp, align 4
  store i32 %72, i32* %zExp, align 4
  br label %shiftRight1

if.end.76:                                        ; preds = %if.end.54
  br label %if.end.77

if.end.77:                                        ; preds = %if.end.76, %if.end.33
  %73 = load i32, i32* %aSig0, align 4
  %or78 = or i32 %73, 1048576
  store i32 %or78, i32* %aSig0, align 4
  %74 = load i32, i32* %aSig0, align 4
  %75 = load i32, i32* %aSig1, align 4
  %76 = load i32, i32* %bSig0, align 4
  %77 = load i32, i32* %bSig1, align 4
  call void @add64(i32 %74, i32 %75, i32 %76, i32 %77, i32* %zSig0, i32* %zSig1)
  %78 = load i32, i32* %zExp, align 4
  %dec79 = add nsw i32 %78, -1
  store i32 %dec79, i32* %zExp, align 4
  %79 = load i32, i32* %zSig0, align 4
  %cmp80 = icmp ult i32 %79, 2097152
  br i1 %cmp80, label %if.then.81, label %if.end.82

if.then.81:                                       ; preds = %if.end.77
  br label %roundAndPack

if.end.82:                                        ; preds = %if.end.77
  %80 = load i32, i32* %zExp, align 4
  %inc83 = add nsw i32 %80, 1
  store i32 %inc83, i32* %zExp, align 4
  br label %shiftRight1

shiftRight1:                                      ; preds = %if.end.82, %if.end.74
  %81 = load i32, i32* %zSig0, align 4
  %82 = load i32, i32* %zSig1, align 4
  %83 = load i32, i32* %zSig2, align 4
  call void @shift64ExtraRightJamming(i32 %81, i32 %82, i32 %83, i32 1, i32* %zSig0, i32* %zSig1, i32* %zSig2)
  br label %roundAndPack

roundAndPack:                                     ; preds = %shiftRight1, %if.then.81
  %84 = load i32, i32* %zSign.addr, align 4
  %85 = load i32, i32* %zExp, align 4
  %86 = load i32, i32* %zSig0, align 4
  %87 = load i32, i32* %zSig1, align 4
  %88 = load i32, i32* %zSig2, align 4
  %call84 = call i64 @roundAndPackFloat64(i32 %84, i32 %85, i32 %86, i32 %87, i32 %88)
  %89 = bitcast %struct.float64* %retval to i64*
  store i64 %call84, i64* %89, align 4
  br label %return

return:                                           ; preds = %roundAndPack, %if.then.72, %if.end.69, %if.then.63, %if.end.47, %if.then.41, %if.end, %if.then.23
  %90 = bitcast %struct.float64* %retval to i64*
  %91 = load i64, i64* %90, align 4
  ret i64 %91
}

; Function Attrs: nounwind
define internal i64 @subFloat64Sigs(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1, i32 %zSign) #1 {
entry:
  %retval = alloca %struct.float64, align 4
  %a = alloca %struct.float64, align 4
  %b = alloca %struct.float64, align 4
  %zSign.addr = alloca i32, align 4
  %aExp = alloca i32, align 4
  %bExp = alloca i32, align 4
  %zExp = alloca i32, align 4
  %aSig0 = alloca i32, align 4
  %aSig1 = alloca i32, align 4
  %bSig0 = alloca i32, align 4
  %bSig1 = alloca i32, align 4
  %zSig0 = alloca i32, align 4
  %zSig1 = alloca i32, align 4
  %expDiff = alloca i32, align 4
  %z = alloca %struct.float64, align 4
  %high = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  store i32 %a.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  store i32 %a.1, i32* %low, align 4
  %high2 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  store i32 %b.0, i32* %high2, align 4
  %low3 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  store i32 %b.1, i32* %low3, align 4
  store i32 %zSign, i32* %zSign.addr, align 4
  %high4 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %0 = load i32, i32* %high4, align 4
  %low5 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %1 = load i32, i32* %low5, align 4
  %call = call i32 @extractFloat64Frac1(i32 %0, i32 %1)
  store i32 %call, i32* %aSig1, align 4
  %high6 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %2 = load i32, i32* %high6, align 4
  %low7 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %3 = load i32, i32* %low7, align 4
  %call8 = call i32 @extractFloat64Frac0(i32 %2, i32 %3)
  store i32 %call8, i32* %aSig0, align 4
  %high9 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %4 = load i32, i32* %high9, align 4
  %low10 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %5 = load i32, i32* %low10, align 4
  %call11 = call i32 @extractFloat64Exp(i32 %4, i32 %5)
  store i32 %call11, i32* %aExp, align 4
  %high12 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %6 = load i32, i32* %high12, align 4
  %low13 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %7 = load i32, i32* %low13, align 4
  %call14 = call i32 @extractFloat64Frac1(i32 %6, i32 %7)
  store i32 %call14, i32* %bSig1, align 4
  %high15 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %8 = load i32, i32* %high15, align 4
  %low16 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %9 = load i32, i32* %low16, align 4
  %call17 = call i32 @extractFloat64Frac0(i32 %8, i32 %9)
  store i32 %call17, i32* %bSig0, align 4
  %high18 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %10 = load i32, i32* %high18, align 4
  %low19 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %11 = load i32, i32* %low19, align 4
  %call20 = call i32 @extractFloat64Exp(i32 %10, i32 %11)
  store i32 %call20, i32* %bExp, align 4
  %12 = load i32, i32* %aExp, align 4
  %13 = load i32, i32* %bExp, align 4
  %sub = sub nsw i32 %12, %13
  store i32 %sub, i32* %expDiff, align 4
  %14 = load i32, i32* %aSig0, align 4
  %15 = load i32, i32* %aSig1, align 4
  call void @shortShift64Left(i32 %14, i32 %15, i32 10, i32* %aSig0, i32* %aSig1)
  %16 = load i32, i32* %bSig0, align 4
  %17 = load i32, i32* %bSig1, align 4
  call void @shortShift64Left(i32 %16, i32 %17, i32 10, i32* %bSig0, i32* %bSig1)
  %18 = load i32, i32* %expDiff, align 4
  %cmp = icmp slt i32 0, %18
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %aExpBigger

if.end:                                           ; preds = %entry
  %19 = load i32, i32* %expDiff, align 4
  %cmp21 = icmp slt i32 %19, 0
  br i1 %cmp21, label %if.then.22, label %if.end.23

if.then.22:                                       ; preds = %if.end
  br label %bExpBigger

if.end.23:                                        ; preds = %if.end
  %20 = load i32, i32* %aExp, align 4
  %cmp24 = icmp eq i32 %20, 2047
  br i1 %cmp24, label %if.then.25, label %if.end.37

if.then.25:                                       ; preds = %if.end.23
  %21 = load i32, i32* %aSig0, align 4
  %22 = load i32, i32* %aSig1, align 4
  %or = or i32 %21, %22
  %23 = load i32, i32* %bSig0, align 4
  %or26 = or i32 %or, %23
  %24 = load i32, i32* %bSig1, align 4
  %or27 = or i32 %or26, %24
  %tobool = icmp ne i32 %or27, 0
  br i1 %tobool, label %if.then.28, label %if.end.34

if.then.28:                                       ; preds = %if.then.25
  %high29 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %25 = load i32, i32* %high29, align 4
  %low30 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %26 = load i32, i32* %low30, align 4
  %high31 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %27 = load i32, i32* %high31, align 4
  %low32 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %28 = load i32, i32* %low32, align 4
  %call33 = call i64 @propagateFloat64NaN(i32 %25, i32 %26, i32 %27, i32 %28)
  %29 = bitcast %struct.float64* %retval to i64*
  store i64 %call33, i64* %29, align 4
  br label %return

if.end.34:                                        ; preds = %if.then.25
  call void @float_raise(i32 16)
  %low35 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 1
  store i32 -1, i32* %low35, align 4
  %high36 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 0
  store i32 2147483647, i32* %high36, align 4
  %30 = bitcast %struct.float64* %retval to i8*
  %31 = bitcast %struct.float64* %z to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %30, i8* %31, i32 8, i32 4, i1 false)
  br label %return

if.end.37:                                        ; preds = %if.end.23
  %32 = load i32, i32* %aExp, align 4
  %cmp38 = icmp eq i32 %32, 0
  br i1 %cmp38, label %if.then.39, label %if.end.40

if.then.39:                                       ; preds = %if.end.37
  store i32 1, i32* %aExp, align 4
  store i32 1, i32* %bExp, align 4
  br label %if.end.40

if.end.40:                                        ; preds = %if.then.39, %if.end.37
  %33 = load i32, i32* %bSig0, align 4
  %34 = load i32, i32* %aSig0, align 4
  %cmp41 = icmp ult i32 %33, %34
  br i1 %cmp41, label %if.then.42, label %if.end.43

if.then.42:                                       ; preds = %if.end.40
  br label %aBigger

if.end.43:                                        ; preds = %if.end.40
  %35 = load i32, i32* %aSig0, align 4
  %36 = load i32, i32* %bSig0, align 4
  %cmp44 = icmp ult i32 %35, %36
  br i1 %cmp44, label %if.then.45, label %if.end.46

if.then.45:                                       ; preds = %if.end.43
  br label %bBigger

if.end.46:                                        ; preds = %if.end.43
  %37 = load i32, i32* %bSig1, align 4
  %38 = load i32, i32* %aSig1, align 4
  %cmp47 = icmp ult i32 %37, %38
  br i1 %cmp47, label %if.then.48, label %if.end.49

if.then.48:                                       ; preds = %if.end.46
  br label %aBigger

if.end.49:                                        ; preds = %if.end.46
  %39 = load i32, i32* %aSig1, align 4
  %40 = load i32, i32* %bSig1, align 4
  %cmp50 = icmp ult i32 %39, %40
  br i1 %cmp50, label %if.then.51, label %if.end.52

if.then.51:                                       ; preds = %if.end.49
  br label %bBigger

if.end.52:                                        ; preds = %if.end.49
  %41 = load i32, i32* @float_rounding_mode, align 4
  %cmp53 = icmp eq i32 %41, 3
  %conv = zext i1 %cmp53 to i32
  %call54 = call i64 @packFloat64(i32 %conv, i32 0, i32 0, i32 0)
  %42 = bitcast %struct.float64* %retval to i64*
  store i64 %call54, i64* %42, align 4
  br label %return

bExpBigger:                                       ; preds = %if.then.22
  %43 = load i32, i32* %bExp, align 4
  %cmp55 = icmp eq i32 %43, 2047
  br i1 %cmp55, label %if.then.57, label %if.end.68

if.then.57:                                       ; preds = %bExpBigger
  %44 = load i32, i32* %bSig0, align 4
  %45 = load i32, i32* %bSig1, align 4
  %or58 = or i32 %44, %45
  %tobool59 = icmp ne i32 %or58, 0
  br i1 %tobool59, label %if.then.60, label %if.end.66

if.then.60:                                       ; preds = %if.then.57
  %high61 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %46 = load i32, i32* %high61, align 4
  %low62 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %47 = load i32, i32* %low62, align 4
  %high63 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %48 = load i32, i32* %high63, align 4
  %low64 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %49 = load i32, i32* %low64, align 4
  %call65 = call i64 @propagateFloat64NaN(i32 %46, i32 %47, i32 %48, i32 %49)
  %50 = bitcast %struct.float64* %retval to i64*
  store i64 %call65, i64* %50, align 4
  br label %return

if.end.66:                                        ; preds = %if.then.57
  %51 = load i32, i32* %zSign.addr, align 4
  %xor = xor i32 %51, 1
  %call67 = call i64 @packFloat64(i32 %xor, i32 2047, i32 0, i32 0)
  %52 = bitcast %struct.float64* %retval to i64*
  store i64 %call67, i64* %52, align 4
  br label %return

if.end.68:                                        ; preds = %bExpBigger
  %53 = load i32, i32* %aExp, align 4
  %cmp69 = icmp eq i32 %53, 0
  br i1 %cmp69, label %if.then.71, label %if.else

if.then.71:                                       ; preds = %if.end.68
  %54 = load i32, i32* %expDiff, align 4
  %inc = add nsw i32 %54, 1
  store i32 %inc, i32* %expDiff, align 4
  br label %if.end.73

if.else:                                          ; preds = %if.end.68
  %55 = load i32, i32* %aSig0, align 4
  %or72 = or i32 %55, 1073741824
  store i32 %or72, i32* %aSig0, align 4
  br label %if.end.73

if.end.73:                                        ; preds = %if.else, %if.then.71
  %56 = load i32, i32* %aSig0, align 4
  %57 = load i32, i32* %aSig1, align 4
  %58 = load i32, i32* %expDiff, align 4
  %sub74 = sub nsw i32 0, %58
  call void @shift64RightJamming(i32 %56, i32 %57, i32 %sub74, i32* %aSig0, i32* %aSig1)
  %59 = load i32, i32* %bSig0, align 4
  %or75 = or i32 %59, 1073741824
  store i32 %or75, i32* %bSig0, align 4
  br label %bBigger

bBigger:                                          ; preds = %if.end.73, %if.then.51, %if.then.45
  %60 = load i32, i32* %bSig0, align 4
  %61 = load i32, i32* %bSig1, align 4
  %62 = load i32, i32* %aSig0, align 4
  %63 = load i32, i32* %aSig1, align 4
  call void @sub64(i32 %60, i32 %61, i32 %62, i32 %63, i32* %zSig0, i32* %zSig1)
  %64 = load i32, i32* %bExp, align 4
  store i32 %64, i32* %zExp, align 4
  %65 = load i32, i32* %zSign.addr, align 4
  %xor76 = xor i32 %65, 1
  store i32 %xor76, i32* %zSign.addr, align 4
  br label %normalizeRoundAndPack

aExpBigger:                                       ; preds = %if.then
  %66 = load i32, i32* %aExp, align 4
  %cmp77 = icmp eq i32 %66, 2047
  br i1 %cmp77, label %if.then.79, label %if.end.89

if.then.79:                                       ; preds = %aExpBigger
  %67 = load i32, i32* %aSig0, align 4
  %68 = load i32, i32* %aSig1, align 4
  %or80 = or i32 %67, %68
  %tobool81 = icmp ne i32 %or80, 0
  br i1 %tobool81, label %if.then.82, label %if.end.88

if.then.82:                                       ; preds = %if.then.79
  %high83 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %69 = load i32, i32* %high83, align 4
  %low84 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %70 = load i32, i32* %low84, align 4
  %high85 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %71 = load i32, i32* %high85, align 4
  %low86 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %72 = load i32, i32* %low86, align 4
  %call87 = call i64 @propagateFloat64NaN(i32 %69, i32 %70, i32 %71, i32 %72)
  %73 = bitcast %struct.float64* %retval to i64*
  store i64 %call87, i64* %73, align 4
  br label %return

if.end.88:                                        ; preds = %if.then.79
  %74 = bitcast %struct.float64* %retval to i8*
  %75 = bitcast %struct.float64* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %74, i8* %75, i32 8, i32 4, i1 false)
  br label %return

if.end.89:                                        ; preds = %aExpBigger
  %76 = load i32, i32* %bExp, align 4
  %cmp90 = icmp eq i32 %76, 0
  br i1 %cmp90, label %if.then.92, label %if.else.93

if.then.92:                                       ; preds = %if.end.89
  %77 = load i32, i32* %expDiff, align 4
  %dec = add nsw i32 %77, -1
  store i32 %dec, i32* %expDiff, align 4
  br label %if.end.95

if.else.93:                                       ; preds = %if.end.89
  %78 = load i32, i32* %bSig0, align 4
  %or94 = or i32 %78, 1073741824
  store i32 %or94, i32* %bSig0, align 4
  br label %if.end.95

if.end.95:                                        ; preds = %if.else.93, %if.then.92
  %79 = load i32, i32* %bSig0, align 4
  %80 = load i32, i32* %bSig1, align 4
  %81 = load i32, i32* %expDiff, align 4
  call void @shift64RightJamming(i32 %79, i32 %80, i32 %81, i32* %bSig0, i32* %bSig1)
  %82 = load i32, i32* %aSig0, align 4
  %or96 = or i32 %82, 1073741824
  store i32 %or96, i32* %aSig0, align 4
  br label %aBigger

aBigger:                                          ; preds = %if.end.95, %if.then.48, %if.then.42
  %83 = load i32, i32* %aSig0, align 4
  %84 = load i32, i32* %aSig1, align 4
  %85 = load i32, i32* %bSig0, align 4
  %86 = load i32, i32* %bSig1, align 4
  call void @sub64(i32 %83, i32 %84, i32 %85, i32 %86, i32* %zSig0, i32* %zSig1)
  %87 = load i32, i32* %aExp, align 4
  store i32 %87, i32* %zExp, align 4
  br label %normalizeRoundAndPack

normalizeRoundAndPack:                            ; preds = %aBigger, %bBigger
  %88 = load i32, i32* %zExp, align 4
  %dec97 = add nsw i32 %88, -1
  store i32 %dec97, i32* %zExp, align 4
  %89 = load i32, i32* %zSign.addr, align 4
  %90 = load i32, i32* %zExp, align 4
  %sub98 = sub nsw i32 %90, 10
  %91 = load i32, i32* %zSig0, align 4
  %92 = load i32, i32* %zSig1, align 4
  %call99 = call i64 @normalizeRoundAndPackFloat64(i32 %89, i32 %sub98, i32 %91, i32 %92)
  %93 = bitcast %struct.float64* %retval to i64*
  store i64 %call99, i64* %93, align 4
  br label %return

return:                                           ; preds = %normalizeRoundAndPack, %if.end.88, %if.then.82, %if.end.66, %if.then.60, %if.end.52, %if.end.34, %if.then.28
  %94 = bitcast %struct.float64* %retval to i64*
  %95 = load i64, i64* %94, align 4
  ret i64 %95
}

; Function Attrs: nounwind
define i64 @float64_sub(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #1 {
entry:
  %retval = alloca %struct.float64, align 4
  %a = alloca %struct.float64, align 4
  %b = alloca %struct.float64, align 4
  %aSign = alloca i32, align 4
  %bSign = alloca i32, align 4
  %high = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  store i32 %a.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  store i32 %a.1, i32* %low, align 4
  %high2 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  store i32 %b.0, i32* %high2, align 4
  %low3 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  store i32 %b.1, i32* %low3, align 4
  %high4 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %0 = load i32, i32* %high4, align 4
  %low5 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %1 = load i32, i32* %low5, align 4
  %call = call i32 @extractFloat64Sign(i32 %0, i32 %1)
  store i32 %call, i32* %aSign, align 4
  %high6 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %2 = load i32, i32* %high6, align 4
  %low7 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %3 = load i32, i32* %low7, align 4
  %call8 = call i32 @extractFloat64Sign(i32 %2, i32 %3)
  store i32 %call8, i32* %bSign, align 4
  %4 = load i32, i32* %aSign, align 4
  %5 = load i32, i32* %bSign, align 4
  %cmp = icmp eq i32 %4, %5
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %6 = load i32, i32* %aSign, align 4
  %high9 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %7 = load i32, i32* %high9, align 4
  %low10 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %8 = load i32, i32* %low10, align 4
  %high11 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %9 = load i32, i32* %high11, align 4
  %low12 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %10 = load i32, i32* %low12, align 4
  %call13 = call i64 @subFloat64Sigs(i32 %7, i32 %8, i32 %9, i32 %10, i32 %6)
  %11 = bitcast %struct.float64* %retval to i64*
  store i64 %call13, i64* %11, align 4
  br label %return

if.else:                                          ; preds = %entry
  %12 = load i32, i32* %aSign, align 4
  %high14 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %13 = load i32, i32* %high14, align 4
  %low15 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %14 = load i32, i32* %low15, align 4
  %high16 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %15 = load i32, i32* %high16, align 4
  %low17 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %16 = load i32, i32* %low17, align 4
  %call18 = call i64 @addFloat64Sigs(i32 %13, i32 %14, i32 %15, i32 %16, i32 %12)
  %17 = bitcast %struct.float64* %retval to i64*
  store i64 %call18, i64* %17, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %18 = bitcast %struct.float64* %retval to i64*
  %19 = load i64, i64* %18, align 4
  ret i64 %19
}

; Function Attrs: nounwind
define i64 @float64_mul(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #1 {
entry:
  %retval = alloca %struct.float64, align 4
  %a = alloca %struct.float64, align 4
  %b = alloca %struct.float64, align 4
  %aSign = alloca i32, align 4
  %bSign = alloca i32, align 4
  %zSign = alloca i32, align 4
  %aExp = alloca i32, align 4
  %bExp = alloca i32, align 4
  %zExp = alloca i32, align 4
  %aSig0 = alloca i32, align 4
  %aSig1 = alloca i32, align 4
  %bSig0 = alloca i32, align 4
  %bSig1 = alloca i32, align 4
  %zSig0 = alloca i32, align 4
  %zSig1 = alloca i32, align 4
  %zSig2 = alloca i32, align 4
  %zSig3 = alloca i32, align 4
  %z = alloca %struct.float64, align 4
  %high = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  store i32 %a.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  store i32 %a.1, i32* %low, align 4
  %high2 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  store i32 %b.0, i32* %high2, align 4
  %low3 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  store i32 %b.1, i32* %low3, align 4
  %high4 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %0 = load i32, i32* %high4, align 4
  %low5 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %1 = load i32, i32* %low5, align 4
  %call = call i32 @extractFloat64Frac1(i32 %0, i32 %1)
  store i32 %call, i32* %aSig1, align 4
  %high6 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %2 = load i32, i32* %high6, align 4
  %low7 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %3 = load i32, i32* %low7, align 4
  %call8 = call i32 @extractFloat64Frac0(i32 %2, i32 %3)
  store i32 %call8, i32* %aSig0, align 4
  %high9 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %4 = load i32, i32* %high9, align 4
  %low10 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %5 = load i32, i32* %low10, align 4
  %call11 = call i32 @extractFloat64Exp(i32 %4, i32 %5)
  store i32 %call11, i32* %aExp, align 4
  %high12 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %6 = load i32, i32* %high12, align 4
  %low13 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %7 = load i32, i32* %low13, align 4
  %call14 = call i32 @extractFloat64Sign(i32 %6, i32 %7)
  store i32 %call14, i32* %aSign, align 4
  %high15 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %8 = load i32, i32* %high15, align 4
  %low16 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %9 = load i32, i32* %low16, align 4
  %call17 = call i32 @extractFloat64Frac1(i32 %8, i32 %9)
  store i32 %call17, i32* %bSig1, align 4
  %high18 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %10 = load i32, i32* %high18, align 4
  %low19 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %11 = load i32, i32* %low19, align 4
  %call20 = call i32 @extractFloat64Frac0(i32 %10, i32 %11)
  store i32 %call20, i32* %bSig0, align 4
  %high21 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %12 = load i32, i32* %high21, align 4
  %low22 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %13 = load i32, i32* %low22, align 4
  %call23 = call i32 @extractFloat64Exp(i32 %12, i32 %13)
  store i32 %call23, i32* %bExp, align 4
  %high24 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %14 = load i32, i32* %high24, align 4
  %low25 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %15 = load i32, i32* %low25, align 4
  %call26 = call i32 @extractFloat64Sign(i32 %14, i32 %15)
  store i32 %call26, i32* %bSign, align 4
  %16 = load i32, i32* %aSign, align 4
  %17 = load i32, i32* %bSign, align 4
  %xor = xor i32 %16, %17
  store i32 %xor, i32* %zSign, align 4
  %18 = load i32, i32* %aExp, align 4
  %cmp = icmp eq i32 %18, 2047
  br i1 %cmp, label %if.then, label %if.end.42

if.then:                                          ; preds = %entry
  %19 = load i32, i32* %aSig0, align 4
  %20 = load i32, i32* %aSig1, align 4
  %or = or i32 %19, %20
  %tobool = icmp ne i32 %or, 0
  br i1 %tobool, label %if.then.30, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then
  %21 = load i32, i32* %bExp, align 4
  %cmp27 = icmp eq i32 %21, 2047
  br i1 %cmp27, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %lor.lhs.false
  %22 = load i32, i32* %bSig0, align 4
  %23 = load i32, i32* %bSig1, align 4
  %or28 = or i32 %22, %23
  %tobool29 = icmp ne i32 %or28, 0
  br i1 %tobool29, label %if.then.30, label %if.end

if.then.30:                                       ; preds = %land.lhs.true, %if.then
  %high31 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %24 = load i32, i32* %high31, align 4
  %low32 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %25 = load i32, i32* %low32, align 4
  %high33 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %26 = load i32, i32* %high33, align 4
  %low34 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %27 = load i32, i32* %low34, align 4
  %call35 = call i64 @propagateFloat64NaN(i32 %24, i32 %25, i32 %26, i32 %27)
  %28 = bitcast %struct.float64* %retval to i64*
  store i64 %call35, i64* %28, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %lor.lhs.false
  %29 = load i32, i32* %bExp, align 4
  %30 = load i32, i32* %bSig0, align 4
  %or36 = or i32 %29, %30
  %31 = load i32, i32* %bSig1, align 4
  %or37 = or i32 %or36, %31
  %cmp38 = icmp eq i32 %or37, 0
  br i1 %cmp38, label %if.then.39, label %if.end.40

if.then.39:                                       ; preds = %if.end
  br label %invalid

if.end.40:                                        ; preds = %if.end
  %32 = load i32, i32* %zSign, align 4
  %call41 = call i64 @packFloat64(i32 %32, i32 2047, i32 0, i32 0)
  %33 = bitcast %struct.float64* %retval to i64*
  store i64 %call41, i64* %33, align 4
  br label %return

if.end.42:                                        ; preds = %entry
  %34 = load i32, i32* %bExp, align 4
  %cmp43 = icmp eq i32 %34, 2047
  br i1 %cmp43, label %if.then.44, label %if.end.62

if.then.44:                                       ; preds = %if.end.42
  %35 = load i32, i32* %bSig0, align 4
  %36 = load i32, i32* %bSig1, align 4
  %or45 = or i32 %35, %36
  %tobool46 = icmp ne i32 %or45, 0
  br i1 %tobool46, label %if.then.47, label %if.end.53

if.then.47:                                       ; preds = %if.then.44
  %high48 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %37 = load i32, i32* %high48, align 4
  %low49 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %38 = load i32, i32* %low49, align 4
  %high50 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %39 = load i32, i32* %high50, align 4
  %low51 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %40 = load i32, i32* %low51, align 4
  %call52 = call i64 @propagateFloat64NaN(i32 %37, i32 %38, i32 %39, i32 %40)
  %41 = bitcast %struct.float64* %retval to i64*
  store i64 %call52, i64* %41, align 4
  br label %return

if.end.53:                                        ; preds = %if.then.44
  %42 = load i32, i32* %aExp, align 4
  %43 = load i32, i32* %aSig0, align 4
  %or54 = or i32 %42, %43
  %44 = load i32, i32* %aSig1, align 4
  %or55 = or i32 %or54, %44
  %cmp56 = icmp eq i32 %or55, 0
  br i1 %cmp56, label %if.then.57, label %if.end.60

if.then.57:                                       ; preds = %if.end.53
  br label %invalid

invalid:                                          ; preds = %if.then.57, %if.then.39
  call void @float_raise(i32 16)
  %low58 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 1
  store i32 -1, i32* %low58, align 4
  %high59 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 0
  store i32 2147483647, i32* %high59, align 4
  %45 = bitcast %struct.float64* %retval to i8*
  %46 = bitcast %struct.float64* %z to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %45, i8* %46, i32 8, i32 4, i1 false)
  br label %return

if.end.60:                                        ; preds = %if.end.53
  %47 = load i32, i32* %zSign, align 4
  %call61 = call i64 @packFloat64(i32 %47, i32 2047, i32 0, i32 0)
  %48 = bitcast %struct.float64* %retval to i64*
  store i64 %call61, i64* %48, align 4
  br label %return

if.end.62:                                        ; preds = %if.end.42
  %49 = load i32, i32* %aExp, align 4
  %cmp63 = icmp eq i32 %49, 0
  br i1 %cmp63, label %if.then.64, label %if.end.70

if.then.64:                                       ; preds = %if.end.62
  %50 = load i32, i32* %aSig0, align 4
  %51 = load i32, i32* %aSig1, align 4
  %or65 = or i32 %50, %51
  %cmp66 = icmp eq i32 %or65, 0
  br i1 %cmp66, label %if.then.67, label %if.end.69

if.then.67:                                       ; preds = %if.then.64
  %52 = load i32, i32* %zSign, align 4
  %call68 = call i64 @packFloat64(i32 %52, i32 0, i32 0, i32 0)
  %53 = bitcast %struct.float64* %retval to i64*
  store i64 %call68, i64* %53, align 4
  br label %return

if.end.69:                                        ; preds = %if.then.64
  %54 = load i32, i32* %aSig0, align 4
  %55 = load i32, i32* %aSig1, align 4
  call void @normalizeFloat64Subnormal(i32 %54, i32 %55, i32* %aExp, i32* %aSig0, i32* %aSig1)
  br label %if.end.70

if.end.70:                                        ; preds = %if.end.69, %if.end.62
  %56 = load i32, i32* %bExp, align 4
  %cmp71 = icmp eq i32 %56, 0
  br i1 %cmp71, label %if.then.72, label %if.end.78

if.then.72:                                       ; preds = %if.end.70
  %57 = load i32, i32* %bSig0, align 4
  %58 = load i32, i32* %bSig1, align 4
  %or73 = or i32 %57, %58
  %cmp74 = icmp eq i32 %or73, 0
  br i1 %cmp74, label %if.then.75, label %if.end.77

if.then.75:                                       ; preds = %if.then.72
  %59 = load i32, i32* %zSign, align 4
  %call76 = call i64 @packFloat64(i32 %59, i32 0, i32 0, i32 0)
  %60 = bitcast %struct.float64* %retval to i64*
  store i64 %call76, i64* %60, align 4
  br label %return

if.end.77:                                        ; preds = %if.then.72
  %61 = load i32, i32* %bSig0, align 4
  %62 = load i32, i32* %bSig1, align 4
  call void @normalizeFloat64Subnormal(i32 %61, i32 %62, i32* %bExp, i32* %bSig0, i32* %bSig1)
  br label %if.end.78

if.end.78:                                        ; preds = %if.end.77, %if.end.70
  %63 = load i32, i32* %aExp, align 4
  %64 = load i32, i32* %bExp, align 4
  %add = add nsw i32 %63, %64
  %sub = sub nsw i32 %add, 1024
  store i32 %sub, i32* %zExp, align 4
  %65 = load i32, i32* %aSig0, align 4
  %or79 = or i32 %65, 1048576
  store i32 %or79, i32* %aSig0, align 4
  %66 = load i32, i32* %bSig0, align 4
  %67 = load i32, i32* %bSig1, align 4
  call void @shortShift64Left(i32 %66, i32 %67, i32 12, i32* %bSig0, i32* %bSig1)
  %68 = load i32, i32* %aSig0, align 4
  %69 = load i32, i32* %aSig1, align 4
  %70 = load i32, i32* %bSig0, align 4
  %71 = load i32, i32* %bSig1, align 4
  call void @mul64To128(i32 %68, i32 %69, i32 %70, i32 %71, i32* %zSig0, i32* %zSig1, i32* %zSig2, i32* %zSig3)
  %72 = load i32, i32* %zSig0, align 4
  %73 = load i32, i32* %zSig1, align 4
  %74 = load i32, i32* %aSig0, align 4
  %75 = load i32, i32* %aSig1, align 4
  call void @add64(i32 %72, i32 %73, i32 %74, i32 %75, i32* %zSig0, i32* %zSig1)
  %76 = load i32, i32* %zSig3, align 4
  %cmp80 = icmp ne i32 %76, 0
  %conv = zext i1 %cmp80 to i32
  %77 = load i32, i32* %zSig2, align 4
  %or81 = or i32 %77, %conv
  store i32 %or81, i32* %zSig2, align 4
  %78 = load i32, i32* %zSig0, align 4
  %cmp82 = icmp ule i32 2097152, %78
  br i1 %cmp82, label %if.then.84, label %if.end.85

if.then.84:                                       ; preds = %if.end.78
  %79 = load i32, i32* %zSig0, align 4
  %80 = load i32, i32* %zSig1, align 4
  %81 = load i32, i32* %zSig2, align 4
  call void @shift64ExtraRightJamming(i32 %79, i32 %80, i32 %81, i32 1, i32* %zSig0, i32* %zSig1, i32* %zSig2)
  %82 = load i32, i32* %zExp, align 4
  %inc = add nsw i32 %82, 1
  store i32 %inc, i32* %zExp, align 4
  br label %if.end.85

if.end.85:                                        ; preds = %if.then.84, %if.end.78
  %83 = load i32, i32* %zSign, align 4
  %84 = load i32, i32* %zExp, align 4
  %85 = load i32, i32* %zSig0, align 4
  %86 = load i32, i32* %zSig1, align 4
  %87 = load i32, i32* %zSig2, align 4
  %call86 = call i64 @roundAndPackFloat64(i32 %83, i32 %84, i32 %85, i32 %86, i32 %87)
  %88 = bitcast %struct.float64* %retval to i64*
  store i64 %call86, i64* %88, align 4
  br label %return

return:                                           ; preds = %if.end.85, %if.then.75, %if.then.67, %if.end.60, %invalid, %if.then.47, %if.end.40, %if.then.30
  %89 = bitcast %struct.float64* %retval to i64*
  %90 = load i64, i64* %89, align 4
  ret i64 %90
}

; Function Attrs: nounwind
define internal void @normalizeFloat64Subnormal(i32 %aSig0, i32 %aSig1, i32* %zExpPtr, i32* %zSig0Ptr, i32* %zSig1Ptr) #1 {
entry:
  %aSig0.addr = alloca i32, align 4
  %aSig1.addr = alloca i32, align 4
  %zExpPtr.addr = alloca i32*, align 4
  %zSig0Ptr.addr = alloca i32*, align 4
  %zSig1Ptr.addr = alloca i32*, align 4
  %shiftCount = alloca i32, align 4
  store i32 %aSig0, i32* %aSig0.addr, align 4
  store i32 %aSig1, i32* %aSig1.addr, align 4
  store i32* %zExpPtr, i32** %zExpPtr.addr, align 4
  store i32* %zSig0Ptr, i32** %zSig0Ptr.addr, align 4
  store i32* %zSig1Ptr, i32** %zSig1Ptr.addr, align 4
  %0 = load i32, i32* %aSig0.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else.7

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %aSig1.addr, align 4
  %call = call i32 @countLeadingZeros32(i32 %1)
  %sub = sub nsw i32 %call, 11
  store i32 %sub, i32* %shiftCount, align 4
  %2 = load i32, i32* %shiftCount, align 4
  %cmp1 = icmp slt i32 %2, 0
  br i1 %cmp1, label %if.then.2, label %if.else

if.then.2:                                        ; preds = %if.then
  %3 = load i32, i32* %aSig1.addr, align 4
  %4 = load i32, i32* %shiftCount, align 4
  %sub3 = sub nsw i32 0, %4
  %shr = lshr i32 %3, %sub3
  %5 = load i32*, i32** %zSig0Ptr.addr, align 4
  store i32 %shr, i32* %5, align 4
  %6 = load i32, i32* %aSig1.addr, align 4
  %7 = load i32, i32* %shiftCount, align 4
  %and = and i32 %7, 31
  %shl = shl i32 %6, %and
  %8 = load i32*, i32** %zSig1Ptr.addr, align 4
  store i32 %shl, i32* %8, align 4
  br label %if.end

if.else:                                          ; preds = %if.then
  %9 = load i32, i32* %aSig1.addr, align 4
  %10 = load i32, i32* %shiftCount, align 4
  %shl4 = shl i32 %9, %10
  %11 = load i32*, i32** %zSig0Ptr.addr, align 4
  store i32 %shl4, i32* %11, align 4
  %12 = load i32*, i32** %zSig1Ptr.addr, align 4
  store i32 0, i32* %12, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then.2
  %13 = load i32, i32* %shiftCount, align 4
  %sub5 = sub nsw i32 0, %13
  %sub6 = sub nsw i32 %sub5, 31
  %14 = load i32*, i32** %zExpPtr.addr, align 4
  store i32 %sub6, i32* %14, align 4
  br label %if.end.11

if.else.7:                                        ; preds = %entry
  %15 = load i32, i32* %aSig0.addr, align 4
  %call8 = call i32 @countLeadingZeros32(i32 %15)
  %sub9 = sub nsw i32 %call8, 11
  store i32 %sub9, i32* %shiftCount, align 4
  %16 = load i32, i32* %aSig0.addr, align 4
  %17 = load i32, i32* %aSig1.addr, align 4
  %18 = load i32, i32* %shiftCount, align 4
  %19 = load i32*, i32** %zSig0Ptr.addr, align 4
  %20 = load i32*, i32** %zSig1Ptr.addr, align 4
  call void @shortShift64Left(i32 %16, i32 %17, i32 %18, i32* %19, i32* %20)
  %21 = load i32, i32* %shiftCount, align 4
  %sub10 = sub nsw i32 1, %21
  %22 = load i32*, i32** %zExpPtr.addr, align 4
  store i32 %sub10, i32* %22, align 4
  br label %if.end.11

if.end.11:                                        ; preds = %if.else.7, %if.end
  ret void
}

; Function Attrs: nounwind
define internal i64 @roundAndPackFloat64(i32 %zSign, i32 %zExp, i32 %zSig0, i32 %zSig1, i32 %zSig2) #1 {
entry:
  %retval = alloca %struct.float64, align 4
  %zSign.addr = alloca i32, align 4
  %zExp.addr = alloca i32, align 4
  %zSig0.addr = alloca i32, align 4
  %zSig1.addr = alloca i32, align 4
  %zSig2.addr = alloca i32, align 4
  %roundingMode = alloca i32, align 4
  %roundNearestEven = alloca i32, align 4
  %increment = alloca i32, align 4
  %isTiny = alloca i32, align 4
  store i32 %zSign, i32* %zSign.addr, align 4
  store i32 %zExp, i32* %zExp.addr, align 4
  store i32 %zSig0, i32* %zSig0.addr, align 4
  store i32 %zSig1, i32* %zSig1.addr, align 4
  store i32 %zSig2, i32* %zSig2.addr, align 4
  %0 = load i32, i32* @float_rounding_mode, align 4
  store i32 %0, i32* %roundingMode, align 4
  %1 = load i32, i32* %roundingMode, align 4
  %cmp = icmp eq i32 %1, 0
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* %roundNearestEven, align 4
  %2 = load i32, i32* %zSig2.addr, align 4
  %cmp1 = icmp slt i32 %2, 0
  %conv2 = zext i1 %cmp1 to i32
  store i32 %conv2, i32* %increment, align 4
  %3 = load i32, i32* %roundNearestEven, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %if.end.19, label %if.then

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %roundingMode, align 4
  %cmp3 = icmp eq i32 %4, 1
  br i1 %cmp3, label %if.then.5, label %if.else

if.then.5:                                        ; preds = %if.then
  store i32 0, i32* %increment, align 4
  br label %if.end.18

if.else:                                          ; preds = %if.then
  %5 = load i32, i32* %zSign.addr, align 4
  %tobool6 = icmp ne i32 %5, 0
  br i1 %tobool6, label %if.then.7, label %if.else.11

if.then.7:                                        ; preds = %if.else
  %6 = load i32, i32* %roundingMode, align 4
  %cmp8 = icmp eq i32 %6, 3
  br i1 %cmp8, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.then.7
  %7 = load i32, i32* %zSig2.addr, align 4
  %tobool10 = icmp ne i32 %7, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then.7
  %8 = phi i1 [ false, %if.then.7 ], [ %tobool10, %land.rhs ]
  %land.ext = zext i1 %8 to i32
  store i32 %land.ext, i32* %increment, align 4
  br label %if.end

if.else.11:                                       ; preds = %if.else
  %9 = load i32, i32* %roundingMode, align 4
  %cmp12 = icmp eq i32 %9, 2
  br i1 %cmp12, label %land.rhs.14, label %land.end.16

land.rhs.14:                                      ; preds = %if.else.11
  %10 = load i32, i32* %zSig2.addr, align 4
  %tobool15 = icmp ne i32 %10, 0
  br label %land.end.16

land.end.16:                                      ; preds = %land.rhs.14, %if.else.11
  %11 = phi i1 [ false, %if.else.11 ], [ %tobool15, %land.rhs.14 ]
  %land.ext17 = zext i1 %11 to i32
  store i32 %land.ext17, i32* %increment, align 4
  br label %if.end

if.end:                                           ; preds = %land.end.16, %land.end
  br label %if.end.18

if.end.18:                                        ; preds = %if.end, %if.then.5
  br label %if.end.19

if.end.19:                                        ; preds = %if.end.18, %entry
  %12 = load i32, i32* %zExp.addr, align 4
  %conv20 = trunc i32 %12 to i16
  %conv21 = zext i16 %conv20 to i32
  %cmp22 = icmp sle i32 2045, %conv21
  br i1 %cmp22, label %if.then.24, label %if.end.90

if.then.24:                                       ; preds = %if.end.19
  %13 = load i32, i32* %zExp.addr, align 4
  %cmp25 = icmp slt i32 2045, %13
  br i1 %cmp25, label %if.then.32, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then.24
  %14 = load i32, i32* %zExp.addr, align 4
  %cmp27 = icmp eq i32 %14, 2045
  br i1 %cmp27, label %land.lhs.true, label %if.end.49

land.lhs.true:                                    ; preds = %lor.lhs.false
  %15 = load i32, i32* %zSig0.addr, align 4
  %16 = load i32, i32* %zSig1.addr, align 4
  %call = call i32 @eq64(i32 2097151, i32 -1, i32 %15, i32 %16)
  %tobool29 = icmp ne i32 %call, 0
  br i1 %tobool29, label %land.lhs.true.30, label %if.end.49

land.lhs.true.30:                                 ; preds = %land.lhs.true
  %17 = load i32, i32* %increment, align 4
  %tobool31 = icmp ne i32 %17, 0
  br i1 %tobool31, label %if.then.32, label %if.end.49

if.then.32:                                       ; preds = %land.lhs.true.30, %if.then.24
  call void @float_raise(i32 9)
  %18 = load i32, i32* %roundingMode, align 4
  %cmp33 = icmp eq i32 %18, 1
  br i1 %cmp33, label %if.then.45, label %lor.lhs.false.35

lor.lhs.false.35:                                 ; preds = %if.then.32
  %19 = load i32, i32* %zSign.addr, align 4
  %tobool36 = icmp ne i32 %19, 0
  br i1 %tobool36, label %land.lhs.true.37, label %lor.lhs.false.40

land.lhs.true.37:                                 ; preds = %lor.lhs.false.35
  %20 = load i32, i32* %roundingMode, align 4
  %cmp38 = icmp eq i32 %20, 2
  br i1 %cmp38, label %if.then.45, label %lor.lhs.false.40

lor.lhs.false.40:                                 ; preds = %land.lhs.true.37, %lor.lhs.false.35
  %21 = load i32, i32* %zSign.addr, align 4
  %tobool41 = icmp ne i32 %21, 0
  br i1 %tobool41, label %if.end.47, label %land.lhs.true.42

land.lhs.true.42:                                 ; preds = %lor.lhs.false.40
  %22 = load i32, i32* %roundingMode, align 4
  %cmp43 = icmp eq i32 %22, 3
  br i1 %cmp43, label %if.then.45, label %if.end.47

if.then.45:                                       ; preds = %land.lhs.true.42, %land.lhs.true.37, %if.then.32
  %23 = load i32, i32* %zSign.addr, align 4
  %call46 = call i64 @packFloat64(i32 %23, i32 2046, i32 1048575, i32 -1)
  %24 = bitcast %struct.float64* %retval to i64*
  store i64 %call46, i64* %24, align 4
  br label %return

if.end.47:                                        ; preds = %land.lhs.true.42, %lor.lhs.false.40
  %25 = load i32, i32* %zSign.addr, align 4
  %call48 = call i64 @packFloat64(i32 %25, i32 2047, i32 0, i32 0)
  %26 = bitcast %struct.float64* %retval to i64*
  store i64 %call48, i64* %26, align 4
  br label %return

if.end.49:                                        ; preds = %land.lhs.true.30, %land.lhs.true, %lor.lhs.false
  %27 = load i32, i32* %zExp.addr, align 4
  %cmp50 = icmp slt i32 %27, 0
  br i1 %cmp50, label %if.then.52, label %if.end.89

if.then.52:                                       ; preds = %if.end.49
  %28 = load i32, i32* @float_detect_tininess, align 4
  %cmp53 = icmp eq i32 %28, 1
  br i1 %cmp53, label %lor.end, label %lor.lhs.false.55

lor.lhs.false.55:                                 ; preds = %if.then.52
  %29 = load i32, i32* %zExp.addr, align 4
  %cmp56 = icmp slt i32 %29, -1
  br i1 %cmp56, label %lor.end, label %lor.lhs.false.58

lor.lhs.false.58:                                 ; preds = %lor.lhs.false.55
  %30 = load i32, i32* %increment, align 4
  %tobool59 = icmp ne i32 %30, 0
  br i1 %tobool59, label %lor.rhs, label %lor.end

lor.rhs:                                          ; preds = %lor.lhs.false.58
  %31 = load i32, i32* %zSig0.addr, align 4
  %32 = load i32, i32* %zSig1.addr, align 4
  %call60 = call i32 @lt64(i32 %31, i32 %32, i32 2097151, i32 -1)
  %tobool61 = icmp ne i32 %call60, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %lor.lhs.false.58, %lor.lhs.false.55, %if.then.52
  %33 = phi i1 [ true, %lor.lhs.false.58 ], [ true, %lor.lhs.false.55 ], [ true, %if.then.52 ], [ %tobool61, %lor.rhs ]
  %lor.ext = zext i1 %33 to i32
  store i32 %lor.ext, i32* %isTiny, align 4
  %34 = load i32, i32* %zSig0.addr, align 4
  %35 = load i32, i32* %zSig1.addr, align 4
  %36 = load i32, i32* %zSig2.addr, align 4
  %37 = load i32, i32* %zExp.addr, align 4
  %sub = sub nsw i32 0, %37
  call void @shift64ExtraRightJamming(i32 %34, i32 %35, i32 %36, i32 %sub, i32* %zSig0.addr, i32* %zSig1.addr, i32* %zSig2.addr)
  store i32 0, i32* %zExp.addr, align 4
  %38 = load i32, i32* %isTiny, align 4
  %tobool62 = icmp ne i32 %38, 0
  br i1 %tobool62, label %land.lhs.true.63, label %if.end.66

land.lhs.true.63:                                 ; preds = %lor.end
  %39 = load i32, i32* %zSig2.addr, align 4
  %tobool64 = icmp ne i32 %39, 0
  br i1 %tobool64, label %if.then.65, label %if.end.66

if.then.65:                                       ; preds = %land.lhs.true.63
  call void @float_raise(i32 4)
  br label %if.end.66

if.end.66:                                        ; preds = %if.then.65, %land.lhs.true.63, %lor.end
  %40 = load i32, i32* %roundNearestEven, align 4
  %tobool67 = icmp ne i32 %40, 0
  br i1 %tobool67, label %if.then.68, label %if.else.71

if.then.68:                                       ; preds = %if.end.66
  %41 = load i32, i32* %zSig2.addr, align 4
  %cmp69 = icmp slt i32 %41, 0
  %conv70 = zext i1 %cmp69 to i32
  store i32 %conv70, i32* %increment, align 4
  br label %if.end.88

if.else.71:                                       ; preds = %if.end.66
  %42 = load i32, i32* %zSign.addr, align 4
  %tobool72 = icmp ne i32 %42, 0
  br i1 %tobool72, label %if.then.73, label %if.else.80

if.then.73:                                       ; preds = %if.else.71
  %43 = load i32, i32* %roundingMode, align 4
  %cmp74 = icmp eq i32 %43, 3
  br i1 %cmp74, label %land.rhs.76, label %land.end.78

land.rhs.76:                                      ; preds = %if.then.73
  %44 = load i32, i32* %zSig2.addr, align 4
  %tobool77 = icmp ne i32 %44, 0
  br label %land.end.78

land.end.78:                                      ; preds = %land.rhs.76, %if.then.73
  %45 = phi i1 [ false, %if.then.73 ], [ %tobool77, %land.rhs.76 ]
  %land.ext79 = zext i1 %45 to i32
  store i32 %land.ext79, i32* %increment, align 4
  br label %if.end.87

if.else.80:                                       ; preds = %if.else.71
  %46 = load i32, i32* %roundingMode, align 4
  %cmp81 = icmp eq i32 %46, 2
  br i1 %cmp81, label %land.rhs.83, label %land.end.85

land.rhs.83:                                      ; preds = %if.else.80
  %47 = load i32, i32* %zSig2.addr, align 4
  %tobool84 = icmp ne i32 %47, 0
  br label %land.end.85

land.end.85:                                      ; preds = %land.rhs.83, %if.else.80
  %48 = phi i1 [ false, %if.else.80 ], [ %tobool84, %land.rhs.83 ]
  %land.ext86 = zext i1 %48 to i32
  store i32 %land.ext86, i32* %increment, align 4
  br label %if.end.87

if.end.87:                                        ; preds = %land.end.85, %land.end.78
  br label %if.end.88

if.end.88:                                        ; preds = %if.end.87, %if.then.68
  br label %if.end.89

if.end.89:                                        ; preds = %if.end.88, %if.end.49
  br label %if.end.90

if.end.90:                                        ; preds = %if.end.89, %if.end.19
  %49 = load i32, i32* %zSig2.addr, align 4
  %tobool91 = icmp ne i32 %49, 0
  br i1 %tobool91, label %if.then.92, label %if.end.93

if.then.92:                                       ; preds = %if.end.90
  %50 = load i32, i32* @float_exception_flags, align 4
  %or = or i32 %50, 1
  store i32 %or, i32* @float_exception_flags, align 4
  br label %if.end.93

if.end.93:                                        ; preds = %if.then.92, %if.end.90
  %51 = load i32, i32* %increment, align 4
  %tobool94 = icmp ne i32 %51, 0
  br i1 %tobool94, label %if.then.95, label %if.else.99

if.then.95:                                       ; preds = %if.end.93
  %52 = load i32, i32* %zSig0.addr, align 4
  %53 = load i32, i32* %zSig1.addr, align 4
  call void @add64(i32 %52, i32 %53, i32 0, i32 1, i32* %zSig0.addr, i32* %zSig1.addr)
  %54 = load i32, i32* %zSig2.addr, align 4
  %55 = load i32, i32* %zSig2.addr, align 4
  %add = add i32 %54, %55
  %cmp96 = icmp eq i32 %add, 0
  %conv97 = zext i1 %cmp96 to i32
  %56 = load i32, i32* %roundNearestEven, align 4
  %and = and i32 %conv97, %56
  %neg = xor i32 %and, -1
  %57 = load i32, i32* %zSig1.addr, align 4
  %and98 = and i32 %57, %neg
  store i32 %and98, i32* %zSig1.addr, align 4
  br label %if.end.105

if.else.99:                                       ; preds = %if.end.93
  %58 = load i32, i32* %zSig0.addr, align 4
  %59 = load i32, i32* %zSig1.addr, align 4
  %or100 = or i32 %58, %59
  %cmp101 = icmp eq i32 %or100, 0
  br i1 %cmp101, label %if.then.103, label %if.end.104

if.then.103:                                      ; preds = %if.else.99
  store i32 0, i32* %zExp.addr, align 4
  br label %if.end.104

if.end.104:                                       ; preds = %if.then.103, %if.else.99
  br label %if.end.105

if.end.105:                                       ; preds = %if.end.104, %if.then.95
  %60 = load i32, i32* %zSign.addr, align 4
  %61 = load i32, i32* %zExp.addr, align 4
  %62 = load i32, i32* %zSig0.addr, align 4
  %63 = load i32, i32* %zSig1.addr, align 4
  %call106 = call i64 @packFloat64(i32 %60, i32 %61, i32 %62, i32 %63)
  %64 = bitcast %struct.float64* %retval to i64*
  store i64 %call106, i64* %64, align 4
  br label %return

return:                                           ; preds = %if.end.105, %if.end.47, %if.then.45
  %65 = bitcast %struct.float64* %retval to i64*
  %66 = load i64, i64* %65, align 4
  ret i64 %66
}

; Function Attrs: nounwind
define i64 @float64_div(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #1 {
entry:
  %retval = alloca %struct.float64, align 4
  %a = alloca %struct.float64, align 4
  %b = alloca %struct.float64, align 4
  %aSign = alloca i32, align 4
  %bSign = alloca i32, align 4
  %zSign = alloca i32, align 4
  %aExp = alloca i32, align 4
  %bExp = alloca i32, align 4
  %zExp = alloca i32, align 4
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
  %z = alloca %struct.float64, align 4
  %high = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  store i32 %a.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  store i32 %a.1, i32* %low, align 4
  %high2 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  store i32 %b.0, i32* %high2, align 4
  %low3 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  store i32 %b.1, i32* %low3, align 4
  %high4 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %0 = load i32, i32* %high4, align 4
  %low5 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %1 = load i32, i32* %low5, align 4
  %call = call i32 @extractFloat64Frac1(i32 %0, i32 %1)
  store i32 %call, i32* %aSig1, align 4
  %high6 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %2 = load i32, i32* %high6, align 4
  %low7 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %3 = load i32, i32* %low7, align 4
  %call8 = call i32 @extractFloat64Frac0(i32 %2, i32 %3)
  store i32 %call8, i32* %aSig0, align 4
  %high9 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %4 = load i32, i32* %high9, align 4
  %low10 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %5 = load i32, i32* %low10, align 4
  %call11 = call i32 @extractFloat64Exp(i32 %4, i32 %5)
  store i32 %call11, i32* %aExp, align 4
  %high12 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %6 = load i32, i32* %high12, align 4
  %low13 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %7 = load i32, i32* %low13, align 4
  %call14 = call i32 @extractFloat64Sign(i32 %6, i32 %7)
  store i32 %call14, i32* %aSign, align 4
  %high15 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %8 = load i32, i32* %high15, align 4
  %low16 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %9 = load i32, i32* %low16, align 4
  %call17 = call i32 @extractFloat64Frac1(i32 %8, i32 %9)
  store i32 %call17, i32* %bSig1, align 4
  %high18 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %10 = load i32, i32* %high18, align 4
  %low19 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %11 = load i32, i32* %low19, align 4
  %call20 = call i32 @extractFloat64Frac0(i32 %10, i32 %11)
  store i32 %call20, i32* %bSig0, align 4
  %high21 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %12 = load i32, i32* %high21, align 4
  %low22 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %13 = load i32, i32* %low22, align 4
  %call23 = call i32 @extractFloat64Exp(i32 %12, i32 %13)
  store i32 %call23, i32* %bExp, align 4
  %high24 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %14 = load i32, i32* %high24, align 4
  %low25 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %15 = load i32, i32* %low25, align 4
  %call26 = call i32 @extractFloat64Sign(i32 %14, i32 %15)
  store i32 %call26, i32* %bSign, align 4
  %16 = load i32, i32* %aSign, align 4
  %17 = load i32, i32* %bSign, align 4
  %xor = xor i32 %16, %17
  store i32 %xor, i32* %zSign, align 4
  %18 = load i32, i32* %aExp, align 4
  %cmp = icmp eq i32 %18, 2047
  br i1 %cmp, label %if.then, label %if.end.46

if.then:                                          ; preds = %entry
  %19 = load i32, i32* %aSig0, align 4
  %20 = load i32, i32* %aSig1, align 4
  %or = or i32 %19, %20
  %tobool = icmp ne i32 %or, 0
  br i1 %tobool, label %if.then.27, label %if.end

if.then.27:                                       ; preds = %if.then
  %high28 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %21 = load i32, i32* %high28, align 4
  %low29 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %22 = load i32, i32* %low29, align 4
  %high30 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %23 = load i32, i32* %high30, align 4
  %low31 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %24 = load i32, i32* %low31, align 4
  %call32 = call i64 @propagateFloat64NaN(i32 %21, i32 %22, i32 %23, i32 %24)
  %25 = bitcast %struct.float64* %retval to i64*
  store i64 %call32, i64* %25, align 4
  br label %return

if.end:                                           ; preds = %if.then
  %26 = load i32, i32* %bExp, align 4
  %cmp33 = icmp eq i32 %26, 2047
  br i1 %cmp33, label %if.then.34, label %if.end.44

if.then.34:                                       ; preds = %if.end
  %27 = load i32, i32* %bSig0, align 4
  %28 = load i32, i32* %bSig1, align 4
  %or35 = or i32 %27, %28
  %tobool36 = icmp ne i32 %or35, 0
  br i1 %tobool36, label %if.then.37, label %if.end.43

if.then.37:                                       ; preds = %if.then.34
  %high38 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %29 = load i32, i32* %high38, align 4
  %low39 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %30 = load i32, i32* %low39, align 4
  %high40 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %31 = load i32, i32* %high40, align 4
  %low41 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %32 = load i32, i32* %low41, align 4
  %call42 = call i64 @propagateFloat64NaN(i32 %29, i32 %30, i32 %31, i32 %32)
  %33 = bitcast %struct.float64* %retval to i64*
  store i64 %call42, i64* %33, align 4
  br label %return

if.end.43:                                        ; preds = %if.then.34
  br label %invalid

if.end.44:                                        ; preds = %if.end
  %34 = load i32, i32* %zSign, align 4
  %call45 = call i64 @packFloat64(i32 %34, i32 2047, i32 0, i32 0)
  %35 = bitcast %struct.float64* %retval to i64*
  store i64 %call45, i64* %35, align 4
  br label %return

if.end.46:                                        ; preds = %entry
  %36 = load i32, i32* %bExp, align 4
  %cmp47 = icmp eq i32 %36, 2047
  br i1 %cmp47, label %if.then.48, label %if.end.59

if.then.48:                                       ; preds = %if.end.46
  %37 = load i32, i32* %bSig0, align 4
  %38 = load i32, i32* %bSig1, align 4
  %or49 = or i32 %37, %38
  %tobool50 = icmp ne i32 %or49, 0
  br i1 %tobool50, label %if.then.51, label %if.end.57

if.then.51:                                       ; preds = %if.then.48
  %high52 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %39 = load i32, i32* %high52, align 4
  %low53 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %40 = load i32, i32* %low53, align 4
  %high54 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %41 = load i32, i32* %high54, align 4
  %low55 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %42 = load i32, i32* %low55, align 4
  %call56 = call i64 @propagateFloat64NaN(i32 %39, i32 %40, i32 %41, i32 %42)
  %43 = bitcast %struct.float64* %retval to i64*
  store i64 %call56, i64* %43, align 4
  br label %return

if.end.57:                                        ; preds = %if.then.48
  %44 = load i32, i32* %zSign, align 4
  %call58 = call i64 @packFloat64(i32 %44, i32 0, i32 0, i32 0)
  %45 = bitcast %struct.float64* %retval to i64*
  store i64 %call58, i64* %45, align 4
  br label %return

if.end.59:                                        ; preds = %if.end.46
  %46 = load i32, i32* %bExp, align 4
  %cmp60 = icmp eq i32 %46, 0
  br i1 %cmp60, label %if.then.61, label %if.end.74

if.then.61:                                       ; preds = %if.end.59
  %47 = load i32, i32* %bSig0, align 4
  %48 = load i32, i32* %bSig1, align 4
  %or62 = or i32 %47, %48
  %cmp63 = icmp eq i32 %or62, 0
  br i1 %cmp63, label %if.then.64, label %if.end.73

if.then.64:                                       ; preds = %if.then.61
  %49 = load i32, i32* %aExp, align 4
  %50 = load i32, i32* %aSig0, align 4
  %or65 = or i32 %49, %50
  %51 = load i32, i32* %aSig1, align 4
  %or66 = or i32 %or65, %51
  %cmp67 = icmp eq i32 %or66, 0
  br i1 %cmp67, label %if.then.68, label %if.end.71

if.then.68:                                       ; preds = %if.then.64
  br label %invalid

invalid:                                          ; preds = %if.then.68, %if.end.43
  call void @float_raise(i32 16)
  %low69 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 1
  store i32 -1, i32* %low69, align 4
  %high70 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 0
  store i32 2147483647, i32* %high70, align 4
  %52 = bitcast %struct.float64* %retval to i8*
  %53 = bitcast %struct.float64* %z to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %52, i8* %53, i32 8, i32 4, i1 false)
  br label %return

if.end.71:                                        ; preds = %if.then.64
  call void @float_raise(i32 2)
  %54 = load i32, i32* %zSign, align 4
  %call72 = call i64 @packFloat64(i32 %54, i32 2047, i32 0, i32 0)
  %55 = bitcast %struct.float64* %retval to i64*
  store i64 %call72, i64* %55, align 4
  br label %return

if.end.73:                                        ; preds = %if.then.61
  %56 = load i32, i32* %bSig0, align 4
  %57 = load i32, i32* %bSig1, align 4
  call void @normalizeFloat64Subnormal(i32 %56, i32 %57, i32* %bExp, i32* %bSig0, i32* %bSig1)
  br label %if.end.74

if.end.74:                                        ; preds = %if.end.73, %if.end.59
  %58 = load i32, i32* %aExp, align 4
  %cmp75 = icmp eq i32 %58, 0
  br i1 %cmp75, label %if.then.76, label %if.end.82

if.then.76:                                       ; preds = %if.end.74
  %59 = load i32, i32* %aSig0, align 4
  %60 = load i32, i32* %aSig1, align 4
  %or77 = or i32 %59, %60
  %cmp78 = icmp eq i32 %or77, 0
  br i1 %cmp78, label %if.then.79, label %if.end.81

if.then.79:                                       ; preds = %if.then.76
  %61 = load i32, i32* %zSign, align 4
  %call80 = call i64 @packFloat64(i32 %61, i32 0, i32 0, i32 0)
  %62 = bitcast %struct.float64* %retval to i64*
  store i64 %call80, i64* %62, align 4
  br label %return

if.end.81:                                        ; preds = %if.then.76
  %63 = load i32, i32* %aSig0, align 4
  %64 = load i32, i32* %aSig1, align 4
  call void @normalizeFloat64Subnormal(i32 %63, i32 %64, i32* %aExp, i32* %aSig0, i32* %aSig1)
  br label %if.end.82

if.end.82:                                        ; preds = %if.end.81, %if.end.74
  %65 = load i32, i32* %aExp, align 4
  %66 = load i32, i32* %bExp, align 4
  %sub = sub nsw i32 %65, %66
  %add = add nsw i32 %sub, 1021
  store i32 %add, i32* %zExp, align 4
  %67 = load i32, i32* %aSig0, align 4
  %or83 = or i32 %67, 1048576
  %68 = load i32, i32* %aSig1, align 4
  call void @shortShift64Left(i32 %or83, i32 %68, i32 11, i32* %aSig0, i32* %aSig1)
  %69 = load i32, i32* %bSig0, align 4
  %or84 = or i32 %69, 1048576
  %70 = load i32, i32* %bSig1, align 4
  call void @shortShift64Left(i32 %or84, i32 %70, i32 11, i32* %bSig0, i32* %bSig1)
  %71 = load i32, i32* %bSig0, align 4
  %72 = load i32, i32* %bSig1, align 4
  %73 = load i32, i32* %aSig0, align 4
  %74 = load i32, i32* %aSig1, align 4
  %call85 = call i32 @le64(i32 %71, i32 %72, i32 %73, i32 %74)
  %tobool86 = icmp ne i32 %call85, 0
  br i1 %tobool86, label %if.then.87, label %if.end.88

if.then.87:                                       ; preds = %if.end.82
  %75 = load i32, i32* %aSig0, align 4
  %76 = load i32, i32* %aSig1, align 4
  call void @shift64Right(i32 %75, i32 %76, i32 1, i32* %aSig0, i32* %aSig1)
  %77 = load i32, i32* %zExp, align 4
  %inc = add nsw i32 %77, 1
  store i32 %inc, i32* %zExp, align 4
  br label %if.end.88

if.end.88:                                        ; preds = %if.then.87, %if.end.82
  %78 = load i32, i32* %aSig0, align 4
  %79 = load i32, i32* %aSig1, align 4
  %80 = load i32, i32* %bSig0, align 4
  %call89 = call i32 @estimateDiv64To32(i32 %78, i32 %79, i32 %80)
  store i32 %call89, i32* %zSig0, align 4
  %81 = load i32, i32* %bSig0, align 4
  %82 = load i32, i32* %bSig1, align 4
  %83 = load i32, i32* %zSig0, align 4
  call void @mul64By32To96(i32 %81, i32 %82, i32 %83, i32* %term0, i32* %term1, i32* %term2)
  %84 = load i32, i32* %aSig0, align 4
  %85 = load i32, i32* %aSig1, align 4
  %86 = load i32, i32* %term0, align 4
  %87 = load i32, i32* %term1, align 4
  %88 = load i32, i32* %term2, align 4
  call void @sub96(i32 %84, i32 %85, i32 0, i32 %86, i32 %87, i32 %88, i32* %rem0, i32* %rem1, i32* %rem2)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end.88
  %89 = load i32, i32* %rem0, align 4
  %cmp90 = icmp slt i32 %89, 0
  br i1 %cmp90, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %90 = load i32, i32* %zSig0, align 4
  %dec = add i32 %90, -1
  store i32 %dec, i32* %zSig0, align 4
  %91 = load i32, i32* %rem0, align 4
  %92 = load i32, i32* %rem1, align 4
  %93 = load i32, i32* %rem2, align 4
  %94 = load i32, i32* %bSig0, align 4
  %95 = load i32, i32* %bSig1, align 4
  call void @add96(i32 %91, i32 %92, i32 %93, i32 0, i32 %94, i32 %95, i32* %rem0, i32* %rem1, i32* %rem2)
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %96 = load i32, i32* %rem1, align 4
  %97 = load i32, i32* %rem2, align 4
  %98 = load i32, i32* %bSig0, align 4
  %call91 = call i32 @estimateDiv64To32(i32 %96, i32 %97, i32 %98)
  store i32 %call91, i32* %zSig1, align 4
  %99 = load i32, i32* %zSig1, align 4
  %and = and i32 %99, 1023
  %cmp92 = icmp ule i32 %and, 4
  br i1 %cmp92, label %if.then.93, label %if.end.103

if.then.93:                                       ; preds = %while.end
  %100 = load i32, i32* %bSig0, align 4
  %101 = load i32, i32* %bSig1, align 4
  %102 = load i32, i32* %zSig1, align 4
  call void @mul64By32To96(i32 %100, i32 %101, i32 %102, i32* %term1, i32* %term2, i32* %term3)
  %103 = load i32, i32* %rem1, align 4
  %104 = load i32, i32* %rem2, align 4
  %105 = load i32, i32* %term1, align 4
  %106 = load i32, i32* %term2, align 4
  %107 = load i32, i32* %term3, align 4
  call void @sub96(i32 %103, i32 %104, i32 0, i32 %105, i32 %106, i32 %107, i32* %rem1, i32* %rem2, i32* %rem3)
  br label %while.cond.94

while.cond.94:                                    ; preds = %while.body.96, %if.then.93
  %108 = load i32, i32* %rem1, align 4
  %cmp95 = icmp slt i32 %108, 0
  br i1 %cmp95, label %while.body.96, label %while.end.98

while.body.96:                                    ; preds = %while.cond.94
  %109 = load i32, i32* %zSig1, align 4
  %dec97 = add i32 %109, -1
  store i32 %dec97, i32* %zSig1, align 4
  %110 = load i32, i32* %rem1, align 4
  %111 = load i32, i32* %rem2, align 4
  %112 = load i32, i32* %rem3, align 4
  %113 = load i32, i32* %bSig0, align 4
  %114 = load i32, i32* %bSig1, align 4
  call void @add96(i32 %110, i32 %111, i32 %112, i32 0, i32 %113, i32 %114, i32* %rem1, i32* %rem2, i32* %rem3)
  br label %while.cond.94

while.end.98:                                     ; preds = %while.cond.94
  %115 = load i32, i32* %rem1, align 4
  %116 = load i32, i32* %rem2, align 4
  %or99 = or i32 %115, %116
  %117 = load i32, i32* %rem3, align 4
  %or100 = or i32 %or99, %117
  %cmp101 = icmp ne i32 %or100, 0
  %conv = zext i1 %cmp101 to i32
  %118 = load i32, i32* %zSig1, align 4
  %or102 = or i32 %118, %conv
  store i32 %or102, i32* %zSig1, align 4
  br label %if.end.103

if.end.103:                                       ; preds = %while.end.98, %while.end
  %119 = load i32, i32* %zSig0, align 4
  %120 = load i32, i32* %zSig1, align 4
  call void @shift64ExtraRightJamming(i32 %119, i32 %120, i32 0, i32 11, i32* %zSig0, i32* %zSig1, i32* %zSig2)
  %121 = load i32, i32* %zSign, align 4
  %122 = load i32, i32* %zExp, align 4
  %123 = load i32, i32* %zSig0, align 4
  %124 = load i32, i32* %zSig1, align 4
  %125 = load i32, i32* %zSig2, align 4
  %call104 = call i64 @roundAndPackFloat64(i32 %121, i32 %122, i32 %123, i32 %124, i32 %125)
  %126 = bitcast %struct.float64* %retval to i64*
  store i64 %call104, i64* %126, align 4
  br label %return

return:                                           ; preds = %if.end.103, %if.then.79, %if.end.71, %invalid, %if.end.57, %if.then.51, %if.end.44, %if.then.37, %if.then.27
  %127 = bitcast %struct.float64* %retval to i64*
  %128 = load i64, i64* %127, align 4
  ret i64 %128
}

; Function Attrs: nounwind
define i64 @float64_rem(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #1 {
entry:
  %retval = alloca %struct.float64, align 4
  %a = alloca %struct.float64, align 4
  %b = alloca %struct.float64, align 4
  %aSign = alloca i32, align 4
  %bSign = alloca i32, align 4
  %zSign = alloca i32, align 4
  %aExp = alloca i32, align 4
  %bExp = alloca i32, align 4
  %expDiff = alloca i32, align 4
  %aSig0 = alloca i32, align 4
  %aSig1 = alloca i32, align 4
  %bSig0 = alloca i32, align 4
  %bSig1 = alloca i32, align 4
  %q = alloca i32, align 4
  %term0 = alloca i32, align 4
  %term1 = alloca i32, align 4
  %term2 = alloca i32, align 4
  %allZero = alloca i32, align 4
  %alternateASig0 = alloca i32, align 4
  %alternateASig1 = alloca i32, align 4
  %sigMean1 = alloca i32, align 4
  %sigMean0 = alloca i32, align 4
  %z = alloca %struct.float64, align 4
  %high = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  store i32 %a.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  store i32 %a.1, i32* %low, align 4
  %high2 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  store i32 %b.0, i32* %high2, align 4
  %low3 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  store i32 %b.1, i32* %low3, align 4
  %high4 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %0 = load i32, i32* %high4, align 4
  %low5 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %1 = load i32, i32* %low5, align 4
  %call = call i32 @extractFloat64Frac1(i32 %0, i32 %1)
  store i32 %call, i32* %aSig1, align 4
  %high6 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %2 = load i32, i32* %high6, align 4
  %low7 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %3 = load i32, i32* %low7, align 4
  %call8 = call i32 @extractFloat64Frac0(i32 %2, i32 %3)
  store i32 %call8, i32* %aSig0, align 4
  %high9 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %4 = load i32, i32* %high9, align 4
  %low10 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %5 = load i32, i32* %low10, align 4
  %call11 = call i32 @extractFloat64Exp(i32 %4, i32 %5)
  store i32 %call11, i32* %aExp, align 4
  %high12 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %6 = load i32, i32* %high12, align 4
  %low13 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %7 = load i32, i32* %low13, align 4
  %call14 = call i32 @extractFloat64Sign(i32 %6, i32 %7)
  store i32 %call14, i32* %aSign, align 4
  %high15 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %8 = load i32, i32* %high15, align 4
  %low16 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %9 = load i32, i32* %low16, align 4
  %call17 = call i32 @extractFloat64Frac1(i32 %8, i32 %9)
  store i32 %call17, i32* %bSig1, align 4
  %high18 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %10 = load i32, i32* %high18, align 4
  %low19 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %11 = load i32, i32* %low19, align 4
  %call20 = call i32 @extractFloat64Frac0(i32 %10, i32 %11)
  store i32 %call20, i32* %bSig0, align 4
  %high21 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %12 = load i32, i32* %high21, align 4
  %low22 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %13 = load i32, i32* %low22, align 4
  %call23 = call i32 @extractFloat64Exp(i32 %12, i32 %13)
  store i32 %call23, i32* %bExp, align 4
  %high24 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %14 = load i32, i32* %high24, align 4
  %low25 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %15 = load i32, i32* %low25, align 4
  %call26 = call i32 @extractFloat64Sign(i32 %14, i32 %15)
  store i32 %call26, i32* %bSign, align 4
  %16 = load i32, i32* %aExp, align 4
  %cmp = icmp eq i32 %16, 2047
  br i1 %cmp, label %if.then, label %if.end.36

if.then:                                          ; preds = %entry
  %17 = load i32, i32* %aSig0, align 4
  %18 = load i32, i32* %aSig1, align 4
  %or = or i32 %17, %18
  %tobool = icmp ne i32 %or, 0
  br i1 %tobool, label %if.then.30, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then
  %19 = load i32, i32* %bExp, align 4
  %cmp27 = icmp eq i32 %19, 2047
  br i1 %cmp27, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %lor.lhs.false
  %20 = load i32, i32* %bSig0, align 4
  %21 = load i32, i32* %bSig1, align 4
  %or28 = or i32 %20, %21
  %tobool29 = icmp ne i32 %or28, 0
  br i1 %tobool29, label %if.then.30, label %if.end

if.then.30:                                       ; preds = %land.lhs.true, %if.then
  %high31 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %22 = load i32, i32* %high31, align 4
  %low32 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %23 = load i32, i32* %low32, align 4
  %high33 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %24 = load i32, i32* %high33, align 4
  %low34 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %25 = load i32, i32* %low34, align 4
  %call35 = call i64 @propagateFloat64NaN(i32 %22, i32 %23, i32 %24, i32 %25)
  %26 = bitcast %struct.float64* %retval to i64*
  store i64 %call35, i64* %26, align 4
  br label %return

if.end:                                           ; preds = %land.lhs.true, %lor.lhs.false
  br label %invalid

if.end.36:                                        ; preds = %entry
  %27 = load i32, i32* %bExp, align 4
  %cmp37 = icmp eq i32 %27, 2047
  br i1 %cmp37, label %if.then.38, label %if.end.48

if.then.38:                                       ; preds = %if.end.36
  %28 = load i32, i32* %bSig0, align 4
  %29 = load i32, i32* %bSig1, align 4
  %or39 = or i32 %28, %29
  %tobool40 = icmp ne i32 %or39, 0
  br i1 %tobool40, label %if.then.41, label %if.end.47

if.then.41:                                       ; preds = %if.then.38
  %high42 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %30 = load i32, i32* %high42, align 4
  %low43 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %31 = load i32, i32* %low43, align 4
  %high44 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %32 = load i32, i32* %high44, align 4
  %low45 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %33 = load i32, i32* %low45, align 4
  %call46 = call i64 @propagateFloat64NaN(i32 %30, i32 %31, i32 %32, i32 %33)
  %34 = bitcast %struct.float64* %retval to i64*
  store i64 %call46, i64* %34, align 4
  br label %return

if.end.47:                                        ; preds = %if.then.38
  %35 = bitcast %struct.float64* %retval to i8*
  %36 = bitcast %struct.float64* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %35, i8* %36, i32 8, i32 4, i1 false)
  br label %return

if.end.48:                                        ; preds = %if.end.36
  %37 = load i32, i32* %bExp, align 4
  %cmp49 = icmp eq i32 %37, 0
  br i1 %cmp49, label %if.then.50, label %if.end.57

if.then.50:                                       ; preds = %if.end.48
  %38 = load i32, i32* %bSig0, align 4
  %39 = load i32, i32* %bSig1, align 4
  %or51 = or i32 %38, %39
  %cmp52 = icmp eq i32 %or51, 0
  br i1 %cmp52, label %if.then.53, label %if.end.56

if.then.53:                                       ; preds = %if.then.50
  br label %invalid

invalid:                                          ; preds = %if.then.53, %if.end
  call void @float_raise(i32 16)
  %low54 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 1
  store i32 -1, i32* %low54, align 4
  %high55 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 0
  store i32 2147483647, i32* %high55, align 4
  %40 = bitcast %struct.float64* %retval to i8*
  %41 = bitcast %struct.float64* %z to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %40, i8* %41, i32 8, i32 4, i1 false)
  br label %return

if.end.56:                                        ; preds = %if.then.50
  %42 = load i32, i32* %bSig0, align 4
  %43 = load i32, i32* %bSig1, align 4
  call void @normalizeFloat64Subnormal(i32 %42, i32 %43, i32* %bExp, i32* %bSig0, i32* %bSig1)
  br label %if.end.57

if.end.57:                                        ; preds = %if.end.56, %if.end.48
  %44 = load i32, i32* %aExp, align 4
  %cmp58 = icmp eq i32 %44, 0
  br i1 %cmp58, label %if.then.59, label %if.end.64

if.then.59:                                       ; preds = %if.end.57
  %45 = load i32, i32* %aSig0, align 4
  %46 = load i32, i32* %aSig1, align 4
  %or60 = or i32 %45, %46
  %cmp61 = icmp eq i32 %or60, 0
  br i1 %cmp61, label %if.then.62, label %if.end.63

if.then.62:                                       ; preds = %if.then.59
  %47 = bitcast %struct.float64* %retval to i8*
  %48 = bitcast %struct.float64* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %47, i8* %48, i32 8, i32 4, i1 false)
  br label %return

if.end.63:                                        ; preds = %if.then.59
  %49 = load i32, i32* %aSig0, align 4
  %50 = load i32, i32* %aSig1, align 4
  call void @normalizeFloat64Subnormal(i32 %49, i32 %50, i32* %aExp, i32* %aSig0, i32* %aSig1)
  br label %if.end.64

if.end.64:                                        ; preds = %if.end.63, %if.end.57
  %51 = load i32, i32* %aExp, align 4
  %52 = load i32, i32* %bExp, align 4
  %sub = sub nsw i32 %51, %52
  store i32 %sub, i32* %expDiff, align 4
  %53 = load i32, i32* %expDiff, align 4
  %cmp65 = icmp slt i32 %53, -1
  br i1 %cmp65, label %if.then.66, label %if.end.67

if.then.66:                                       ; preds = %if.end.64
  %54 = bitcast %struct.float64* %retval to i8*
  %55 = bitcast %struct.float64* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %54, i8* %55, i32 8, i32 4, i1 false)
  br label %return

if.end.67:                                        ; preds = %if.end.64
  %56 = load i32, i32* %aSig0, align 4
  %or68 = or i32 %56, 1048576
  %57 = load i32, i32* %aSig1, align 4
  %58 = load i32, i32* %expDiff, align 4
  %cmp69 = icmp slt i32 %58, 0
  %conv = zext i1 %cmp69 to i32
  %sub70 = sub nsw i32 11, %conv
  call void @shortShift64Left(i32 %or68, i32 %57, i32 %sub70, i32* %aSig0, i32* %aSig1)
  %59 = load i32, i32* %bSig0, align 4
  %or71 = or i32 %59, 1048576
  %60 = load i32, i32* %bSig1, align 4
  call void @shortShift64Left(i32 %or71, i32 %60, i32 11, i32* %bSig0, i32* %bSig1)
  %61 = load i32, i32* %bSig0, align 4
  %62 = load i32, i32* %bSig1, align 4
  %63 = load i32, i32* %aSig0, align 4
  %64 = load i32, i32* %aSig1, align 4
  %call72 = call i32 @le64(i32 %61, i32 %62, i32 %63, i32 %64)
  store i32 %call72, i32* %q, align 4
  %65 = load i32, i32* %q, align 4
  %tobool73 = icmp ne i32 %65, 0
  br i1 %tobool73, label %if.then.74, label %if.end.75

if.then.74:                                       ; preds = %if.end.67
  %66 = load i32, i32* %aSig0, align 4
  %67 = load i32, i32* %aSig1, align 4
  %68 = load i32, i32* %bSig0, align 4
  %69 = load i32, i32* %bSig1, align 4
  call void @sub64(i32 %66, i32 %67, i32 %68, i32 %69, i32* %aSig0, i32* %aSig1)
  br label %if.end.75

if.end.75:                                        ; preds = %if.then.74, %if.end.67
  %70 = load i32, i32* %expDiff, align 4
  %sub76 = sub nsw i32 %70, 32
  store i32 %sub76, i32* %expDiff, align 4
  br label %while.cond

while.cond:                                       ; preds = %cond.end, %if.end.75
  %71 = load i32, i32* %expDiff, align 4
  %cmp77 = icmp slt i32 0, %71
  br i1 %cmp77, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %72 = load i32, i32* %aSig0, align 4
  %73 = load i32, i32* %aSig1, align 4
  %74 = load i32, i32* %bSig0, align 4
  %call79 = call i32 @estimateDiv64To32(i32 %72, i32 %73, i32 %74)
  store i32 %call79, i32* %q, align 4
  %75 = load i32, i32* %q, align 4
  %cmp80 = icmp ult i32 4, %75
  br i1 %cmp80, label %cond.true, label %cond.false

cond.true:                                        ; preds = %while.body
  %76 = load i32, i32* %q, align 4
  %sub82 = sub i32 %76, 4
  br label %cond.end

cond.false:                                       ; preds = %while.body
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub82, %cond.true ], [ 0, %cond.false ]
  store i32 %cond, i32* %q, align 4
  %77 = load i32, i32* %bSig0, align 4
  %78 = load i32, i32* %bSig1, align 4
  %79 = load i32, i32* %q, align 4
  call void @mul64By32To96(i32 %77, i32 %78, i32 %79, i32* %term0, i32* %term1, i32* %term2)
  %80 = load i32, i32* %term0, align 4
  %81 = load i32, i32* %term1, align 4
  %82 = load i32, i32* %term2, align 4
  call void @shortShift96Left(i32 %80, i32 %81, i32 %82, i32 29, i32* %term1, i32* %term2, i32* %allZero)
  %83 = load i32, i32* %aSig0, align 4
  %84 = load i32, i32* %aSig1, align 4
  call void @shortShift64Left(i32 %83, i32 %84, i32 29, i32* %aSig0, i32* %allZero)
  %85 = load i32, i32* %aSig0, align 4
  %86 = load i32, i32* %term1, align 4
  %87 = load i32, i32* %term2, align 4
  call void @sub64(i32 %85, i32 0, i32 %86, i32 %87, i32* %aSig0, i32* %aSig1)
  %88 = load i32, i32* %expDiff, align 4
  %sub83 = sub nsw i32 %88, 29
  store i32 %sub83, i32* %expDiff, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %89 = load i32, i32* %expDiff, align 4
  %cmp84 = icmp slt i32 -32, %89
  br i1 %cmp84, label %if.then.86, label %if.else.101

if.then.86:                                       ; preds = %while.end
  %90 = load i32, i32* %aSig0, align 4
  %91 = load i32, i32* %aSig1, align 4
  %92 = load i32, i32* %bSig0, align 4
  %call87 = call i32 @estimateDiv64To32(i32 %90, i32 %91, i32 %92)
  store i32 %call87, i32* %q, align 4
  %93 = load i32, i32* %q, align 4
  %cmp88 = icmp ult i32 4, %93
  br i1 %cmp88, label %cond.true.90, label %cond.false.92

cond.true.90:                                     ; preds = %if.then.86
  %94 = load i32, i32* %q, align 4
  %sub91 = sub i32 %94, 4
  br label %cond.end.93

cond.false.92:                                    ; preds = %if.then.86
  br label %cond.end.93

cond.end.93:                                      ; preds = %cond.false.92, %cond.true.90
  %cond94 = phi i32 [ %sub91, %cond.true.90 ], [ 0, %cond.false.92 ]
  store i32 %cond94, i32* %q, align 4
  %95 = load i32, i32* %expDiff, align 4
  %sub95 = sub nsw i32 0, %95
  %96 = load i32, i32* %q, align 4
  %shr = lshr i32 %96, %sub95
  store i32 %shr, i32* %q, align 4
  %97 = load i32, i32* %bSig0, align 4
  %98 = load i32, i32* %bSig1, align 4
  call void @shift64Right(i32 %97, i32 %98, i32 8, i32* %bSig0, i32* %bSig1)
  %99 = load i32, i32* %expDiff, align 4
  %add = add nsw i32 %99, 24
  store i32 %add, i32* %expDiff, align 4
  %100 = load i32, i32* %expDiff, align 4
  %cmp96 = icmp slt i32 %100, 0
  br i1 %cmp96, label %if.then.98, label %if.else

if.then.98:                                       ; preds = %cond.end.93
  %101 = load i32, i32* %aSig0, align 4
  %102 = load i32, i32* %aSig1, align 4
  %103 = load i32, i32* %expDiff, align 4
  %sub99 = sub nsw i32 0, %103
  call void @shift64Right(i32 %101, i32 %102, i32 %sub99, i32* %aSig0, i32* %aSig1)
  br label %if.end.100

if.else:                                          ; preds = %cond.end.93
  %104 = load i32, i32* %aSig0, align 4
  %105 = load i32, i32* %aSig1, align 4
  %106 = load i32, i32* %expDiff, align 4
  call void @shortShift64Left(i32 %104, i32 %105, i32 %106, i32* %aSig0, i32* %aSig1)
  br label %if.end.100

if.end.100:                                       ; preds = %if.else, %if.then.98
  %107 = load i32, i32* %bSig0, align 4
  %108 = load i32, i32* %bSig1, align 4
  %109 = load i32, i32* %q, align 4
  call void @mul64By32To96(i32 %107, i32 %108, i32 %109, i32* %term0, i32* %term1, i32* %term2)
  %110 = load i32, i32* %aSig0, align 4
  %111 = load i32, i32* %aSig1, align 4
  %112 = load i32, i32* %term1, align 4
  %113 = load i32, i32* %term2, align 4
  call void @sub64(i32 %110, i32 %111, i32 %112, i32 %113, i32* %aSig0, i32* %aSig1)
  br label %if.end.102

if.else.101:                                      ; preds = %while.end
  %114 = load i32, i32* %aSig0, align 4
  %115 = load i32, i32* %aSig1, align 4
  call void @shift64Right(i32 %114, i32 %115, i32 8, i32* %aSig0, i32* %aSig1)
  %116 = load i32, i32* %bSig0, align 4
  %117 = load i32, i32* %bSig1, align 4
  call void @shift64Right(i32 %116, i32 %117, i32 8, i32* %bSig0, i32* %bSig1)
  br label %if.end.102

if.end.102:                                       ; preds = %if.else.101, %if.end.100
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.end.102
  %118 = load i32, i32* %aSig0, align 4
  store i32 %118, i32* %alternateASig0, align 4
  %119 = load i32, i32* %aSig1, align 4
  store i32 %119, i32* %alternateASig1, align 4
  %120 = load i32, i32* %q, align 4
  %inc = add i32 %120, 1
  store i32 %inc, i32* %q, align 4
  %121 = load i32, i32* %aSig0, align 4
  %122 = load i32, i32* %aSig1, align 4
  %123 = load i32, i32* %bSig0, align 4
  %124 = load i32, i32* %bSig1, align 4
  call void @sub64(i32 %121, i32 %122, i32 %123, i32 %124, i32* %aSig0, i32* %aSig1)
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %125 = load i32, i32* %aSig0, align 4
  %cmp103 = icmp sle i32 0, %125
  br i1 %cmp103, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  %126 = load i32, i32* %aSig0, align 4
  %127 = load i32, i32* %aSig1, align 4
  %128 = load i32, i32* %alternateASig0, align 4
  %129 = load i32, i32* %alternateASig1, align 4
  call void @add64(i32 %126, i32 %127, i32 %128, i32 %129, i32* %sigMean0, i32* %sigMean1)
  %130 = load i32, i32* %sigMean0, align 4
  %cmp105 = icmp slt i32 %130, 0
  br i1 %cmp105, label %if.then.113, label %lor.lhs.false.107

lor.lhs.false.107:                                ; preds = %do.end
  %131 = load i32, i32* %sigMean0, align 4
  %132 = load i32, i32* %sigMean1, align 4
  %or108 = or i32 %131, %132
  %cmp109 = icmp eq i32 %or108, 0
  br i1 %cmp109, label %land.lhs.true.111, label %if.end.114

land.lhs.true.111:                                ; preds = %lor.lhs.false.107
  %133 = load i32, i32* %q, align 4
  %and = and i32 %133, 1
  %tobool112 = icmp ne i32 %and, 0
  br i1 %tobool112, label %if.then.113, label %if.end.114

if.then.113:                                      ; preds = %land.lhs.true.111, %do.end
  %134 = load i32, i32* %alternateASig0, align 4
  store i32 %134, i32* %aSig0, align 4
  %135 = load i32, i32* %alternateASig1, align 4
  store i32 %135, i32* %aSig1, align 4
  br label %if.end.114

if.end.114:                                       ; preds = %if.then.113, %land.lhs.true.111, %lor.lhs.false.107
  %136 = load i32, i32* %aSig0, align 4
  %cmp115 = icmp slt i32 %136, 0
  %conv116 = zext i1 %cmp115 to i32
  store i32 %conv116, i32* %zSign, align 4
  %137 = load i32, i32* %zSign, align 4
  %tobool117 = icmp ne i32 %137, 0
  br i1 %tobool117, label %if.then.118, label %if.end.119

if.then.118:                                      ; preds = %if.end.114
  %138 = load i32, i32* %aSig0, align 4
  %139 = load i32, i32* %aSig1, align 4
  call void @sub64(i32 0, i32 0, i32 %138, i32 %139, i32* %aSig0, i32* %aSig1)
  br label %if.end.119

if.end.119:                                       ; preds = %if.then.118, %if.end.114
  %140 = load i32, i32* %aSign, align 4
  %141 = load i32, i32* %zSign, align 4
  %xor = xor i32 %140, %141
  %142 = load i32, i32* %bExp, align 4
  %sub120 = sub nsw i32 %142, 4
  %143 = load i32, i32* %aSig0, align 4
  %144 = load i32, i32* %aSig1, align 4
  %call121 = call i64 @normalizeRoundAndPackFloat64(i32 %xor, i32 %sub120, i32 %143, i32 %144)
  %145 = bitcast %struct.float64* %retval to i64*
  store i64 %call121, i64* %145, align 4
  br label %return

return:                                           ; preds = %if.end.119, %if.then.66, %if.then.62, %invalid, %if.end.47, %if.then.41, %if.then.30
  %146 = bitcast %struct.float64* %retval to i64*
  %147 = load i64, i64* %146, align 4
  ret i64 %147
}

; Function Attrs: nounwind
define internal i64 @normalizeRoundAndPackFloat64(i32 %zSign, i32 %zExp, i32 %zSig0, i32 %zSig1) #1 {
entry:
  %retval = alloca %struct.float64, align 4
  %zSign.addr = alloca i32, align 4
  %zExp.addr = alloca i32, align 4
  %zSig0.addr = alloca i32, align 4
  %zSig1.addr = alloca i32, align 4
  %shiftCount = alloca i32, align 4
  %zSig2 = alloca i32, align 4
  store i32 %zSign, i32* %zSign.addr, align 4
  store i32 %zExp, i32* %zExp.addr, align 4
  store i32 %zSig0, i32* %zSig0.addr, align 4
  store i32 %zSig1, i32* %zSig1.addr, align 4
  %0 = load i32, i32* %zSig0.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %zSig1.addr, align 4
  store i32 %1, i32* %zSig0.addr, align 4
  store i32 0, i32* %zSig1.addr, align 4
  %2 = load i32, i32* %zExp.addr, align 4
  %sub = sub nsw i32 %2, 32
  store i32 %sub, i32* %zExp.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32, i32* %zSig0.addr, align 4
  %call = call i32 @countLeadingZeros32(i32 %3)
  %sub1 = sub nsw i32 %call, 11
  store i32 %sub1, i32* %shiftCount, align 4
  %4 = load i32, i32* %shiftCount, align 4
  %cmp2 = icmp sle i32 0, %4
  br i1 %cmp2, label %if.then.3, label %if.else

if.then.3:                                        ; preds = %if.end
  store i32 0, i32* %zSig2, align 4
  %5 = load i32, i32* %zSig0.addr, align 4
  %6 = load i32, i32* %zSig1.addr, align 4
  %7 = load i32, i32* %shiftCount, align 4
  call void @shortShift64Left(i32 %5, i32 %6, i32 %7, i32* %zSig0.addr, i32* %zSig1.addr)
  br label %if.end.5

if.else:                                          ; preds = %if.end
  %8 = load i32, i32* %zSig0.addr, align 4
  %9 = load i32, i32* %zSig1.addr, align 4
  %10 = load i32, i32* %shiftCount, align 4
  %sub4 = sub nsw i32 0, %10
  call void @shift64ExtraRightJamming(i32 %8, i32 %9, i32 0, i32 %sub4, i32* %zSig0.addr, i32* %zSig1.addr, i32* %zSig2)
  br label %if.end.5

if.end.5:                                         ; preds = %if.else, %if.then.3
  %11 = load i32, i32* %shiftCount, align 4
  %12 = load i32, i32* %zExp.addr, align 4
  %sub6 = sub nsw i32 %12, %11
  store i32 %sub6, i32* %zExp.addr, align 4
  %13 = load i32, i32* %zSign.addr, align 4
  %14 = load i32, i32* %zExp.addr, align 4
  %15 = load i32, i32* %zSig0.addr, align 4
  %16 = load i32, i32* %zSig1.addr, align 4
  %17 = load i32, i32* %zSig2, align 4
  %call7 = call i64 @roundAndPackFloat64(i32 %13, i32 %14, i32 %15, i32 %16, i32 %17)
  %18 = bitcast %struct.float64* %retval to i64*
  store i64 %call7, i64* %18, align 4
  %19 = bitcast %struct.float64* %retval to i64*
  %20 = load i64, i64* %19, align 4
  ret i64 %20
}

; Function Attrs: nounwind
define i64 @float64_sqrt(i32 %a.0, i32 %a.1) #1 {
entry:
  %retval = alloca %struct.float64, align 4
  %a = alloca %struct.float64, align 4
  %aSign = alloca i32, align 4
  %aExp = alloca i32, align 4
  %zExp = alloca i32, align 4
  %aSig0 = alloca i32, align 4
  %aSig1 = alloca i32, align 4
  %zSig0 = alloca i32, align 4
  %zSig1 = alloca i32, align 4
  %zSig2 = alloca i32, align 4
  %doubleZSig0 = alloca i32, align 4
  %rem0 = alloca i32, align 4
  %rem1 = alloca i32, align 4
  %rem2 = alloca i32, align 4
  %rem3 = alloca i32, align 4
  %term0 = alloca i32, align 4
  %term1 = alloca i32, align 4
  %term2 = alloca i32, align 4
  %term3 = alloca i32, align 4
  %z = alloca %struct.float64, align 4
  %high = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  store i32 %a.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  store i32 %a.1, i32* %low, align 4
  %high1 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %0 = load i32, i32* %high1, align 4
  %low2 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %1 = load i32, i32* %low2, align 4
  %call = call i32 @extractFloat64Frac1(i32 %0, i32 %1)
  store i32 %call, i32* %aSig1, align 4
  %high3 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %2 = load i32, i32* %high3, align 4
  %low4 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %3 = load i32, i32* %low4, align 4
  %call5 = call i32 @extractFloat64Frac0(i32 %2, i32 %3)
  store i32 %call5, i32* %aSig0, align 4
  %high6 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %4 = load i32, i32* %high6, align 4
  %low7 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %5 = load i32, i32* %low7, align 4
  %call8 = call i32 @extractFloat64Exp(i32 %4, i32 %5)
  store i32 %call8, i32* %aExp, align 4
  %high9 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %6 = load i32, i32* %high9, align 4
  %low10 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %7 = load i32, i32* %low10, align 4
  %call11 = call i32 @extractFloat64Sign(i32 %6, i32 %7)
  store i32 %call11, i32* %aSign, align 4
  %8 = load i32, i32* %aExp, align 4
  %cmp = icmp eq i32 %8, 2047
  br i1 %cmp, label %if.then, label %if.end.21

if.then:                                          ; preds = %entry
  %9 = load i32, i32* %aSig0, align 4
  %10 = load i32, i32* %aSig1, align 4
  %or = or i32 %9, %10
  %tobool = icmp ne i32 %or, 0
  br i1 %tobool, label %if.then.12, label %if.end

if.then.12:                                       ; preds = %if.then
  %high13 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %11 = load i32, i32* %high13, align 4
  %low14 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %12 = load i32, i32* %low14, align 4
  %high15 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %13 = load i32, i32* %high15, align 4
  %low16 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %14 = load i32, i32* %low16, align 4
  %call17 = call i64 @propagateFloat64NaN(i32 %11, i32 %12, i32 %13, i32 %14)
  %15 = bitcast %struct.float64* %retval to i64*
  store i64 %call17, i64* %15, align 4
  br label %return

if.end:                                           ; preds = %if.then
  %16 = load i32, i32* %aSign, align 4
  %tobool18 = icmp ne i32 %16, 0
  br i1 %tobool18, label %if.end.20, label %if.then.19

if.then.19:                                       ; preds = %if.end
  %17 = bitcast %struct.float64* %retval to i8*
  %18 = bitcast %struct.float64* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %17, i8* %18, i32 8, i32 4, i1 false)
  br label %return

if.end.20:                                        ; preds = %if.end
  br label %invalid

if.end.21:                                        ; preds = %entry
  %19 = load i32, i32* %aSign, align 4
  %tobool22 = icmp ne i32 %19, 0
  br i1 %tobool22, label %if.then.23, label %if.end.31

if.then.23:                                       ; preds = %if.end.21
  %20 = load i32, i32* %aExp, align 4
  %21 = load i32, i32* %aSig0, align 4
  %or24 = or i32 %20, %21
  %22 = load i32, i32* %aSig1, align 4
  %or25 = or i32 %or24, %22
  %cmp26 = icmp eq i32 %or25, 0
  br i1 %cmp26, label %if.then.27, label %if.end.28

if.then.27:                                       ; preds = %if.then.23
  %23 = bitcast %struct.float64* %retval to i8*
  %24 = bitcast %struct.float64* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %23, i8* %24, i32 8, i32 4, i1 false)
  br label %return

if.end.28:                                        ; preds = %if.then.23
  br label %invalid

invalid:                                          ; preds = %if.end.28, %if.end.20
  call void @float_raise(i32 16)
  %low29 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 1
  store i32 -1, i32* %low29, align 4
  %high30 = getelementptr inbounds %struct.float64, %struct.float64* %z, i32 0, i32 0
  store i32 2147483647, i32* %high30, align 4
  %25 = bitcast %struct.float64* %retval to i8*
  %26 = bitcast %struct.float64* %z to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %25, i8* %26, i32 8, i32 4, i1 false)
  br label %return

if.end.31:                                        ; preds = %if.end.21
  %27 = load i32, i32* %aExp, align 4
  %cmp32 = icmp eq i32 %27, 0
  br i1 %cmp32, label %if.then.33, label %if.end.39

if.then.33:                                       ; preds = %if.end.31
  %28 = load i32, i32* %aSig0, align 4
  %29 = load i32, i32* %aSig1, align 4
  %or34 = or i32 %28, %29
  %cmp35 = icmp eq i32 %or34, 0
  br i1 %cmp35, label %if.then.36, label %if.end.38

if.then.36:                                       ; preds = %if.then.33
  %call37 = call i64 @packFloat64(i32 0, i32 0, i32 0, i32 0)
  %30 = bitcast %struct.float64* %retval to i64*
  store i64 %call37, i64* %30, align 4
  br label %return

if.end.38:                                        ; preds = %if.then.33
  %31 = load i32, i32* %aSig0, align 4
  %32 = load i32, i32* %aSig1, align 4
  call void @normalizeFloat64Subnormal(i32 %31, i32 %32, i32* %aExp, i32* %aSig0, i32* %aSig1)
  br label %if.end.39

if.end.39:                                        ; preds = %if.end.38, %if.end.31
  %33 = load i32, i32* %aExp, align 4
  %sub = sub nsw i32 %33, 1023
  %shr = ashr i32 %sub, 1
  %add = add nsw i32 %shr, 1022
  store i32 %add, i32* %zExp, align 4
  %34 = load i32, i32* %aSig0, align 4
  %or40 = or i32 %34, 1048576
  store i32 %or40, i32* %aSig0, align 4
  %35 = load i32, i32* %aSig0, align 4
  %36 = load i32, i32* %aSig1, align 4
  call void @shortShift64Left(i32 %35, i32 %36, i32 11, i32* %term0, i32* %term1)
  %37 = load i32, i32* %aExp, align 4
  %38 = load i32, i32* %term0, align 4
  %call41 = call i32 @estimateSqrt32(i32 %37, i32 %38)
  %shr42 = lshr i32 %call41, 1
  %add43 = add i32 %shr42, 1
  store i32 %add43, i32* %zSig0, align 4
  %39 = load i32, i32* %zSig0, align 4
  %cmp44 = icmp eq i32 %39, 0
  br i1 %cmp44, label %if.then.45, label %if.end.46

if.then.45:                                       ; preds = %if.end.39
  store i32 2147483647, i32* %zSig0, align 4
  br label %if.end.46

if.end.46:                                        ; preds = %if.then.45, %if.end.39
  %40 = load i32, i32* %zSig0, align 4
  %41 = load i32, i32* %zSig0, align 4
  %add47 = add i32 %40, %41
  store i32 %add47, i32* %doubleZSig0, align 4
  %42 = load i32, i32* %aSig0, align 4
  %43 = load i32, i32* %aSig1, align 4
  %44 = load i32, i32* %aExp, align 4
  %and = and i32 %44, 1
  %sub48 = sub nsw i32 9, %and
  call void @shortShift64Left(i32 %42, i32 %43, i32 %sub48, i32* %aSig0, i32* %aSig1)
  %45 = load i32, i32* %zSig0, align 4
  %46 = load i32, i32* %zSig0, align 4
  call void @mul32To64(i32 %45, i32 %46, i32* %term0, i32* %term1)
  %47 = load i32, i32* %aSig0, align 4
  %48 = load i32, i32* %aSig1, align 4
  %49 = load i32, i32* %term0, align 4
  %50 = load i32, i32* %term1, align 4
  call void @sub64(i32 %47, i32 %48, i32 %49, i32 %50, i32* %rem0, i32* %rem1)
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end.46
  %51 = load i32, i32* %rem0, align 4
  %cmp49 = icmp slt i32 %51, 0
  br i1 %cmp49, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %52 = load i32, i32* %zSig0, align 4
  %dec = add i32 %52, -1
  store i32 %dec, i32* %zSig0, align 4
  %53 = load i32, i32* %doubleZSig0, align 4
  %sub50 = sub i32 %53, 2
  store i32 %sub50, i32* %doubleZSig0, align 4
  %54 = load i32, i32* %rem0, align 4
  %55 = load i32, i32* %rem1, align 4
  %56 = load i32, i32* %doubleZSig0, align 4
  %or51 = or i32 %56, 1
  call void @add64(i32 %54, i32 %55, i32 0, i32 %or51, i32* %rem0, i32* %rem1)
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %57 = load i32, i32* %rem1, align 4
  %58 = load i32, i32* %doubleZSig0, align 4
  %call52 = call i32 @estimateDiv64To32(i32 %57, i32 0, i32 %58)
  store i32 %call52, i32* %zSig1, align 4
  %59 = load i32, i32* %zSig1, align 4
  %and53 = and i32 %59, 511
  %cmp54 = icmp ule i32 %and53, 5
  br i1 %cmp54, label %if.then.55, label %if.end.70

if.then.55:                                       ; preds = %while.end
  %60 = load i32, i32* %zSig1, align 4
  %cmp56 = icmp eq i32 %60, 0
  br i1 %cmp56, label %if.then.57, label %if.end.58

if.then.57:                                       ; preds = %if.then.55
  store i32 1, i32* %zSig1, align 4
  br label %if.end.58

if.end.58:                                        ; preds = %if.then.57, %if.then.55
  %61 = load i32, i32* %doubleZSig0, align 4
  %62 = load i32, i32* %zSig1, align 4
  call void @mul32To64(i32 %61, i32 %62, i32* %term1, i32* %term2)
  %63 = load i32, i32* %rem1, align 4
  %64 = load i32, i32* %term1, align 4
  %65 = load i32, i32* %term2, align 4
  call void @sub64(i32 %63, i32 0, i32 %64, i32 %65, i32* %rem1, i32* %rem2)
  %66 = load i32, i32* %zSig1, align 4
  %67 = load i32, i32* %zSig1, align 4
  call void @mul32To64(i32 %66, i32 %67, i32* %term2, i32* %term3)
  %68 = load i32, i32* %rem1, align 4
  %69 = load i32, i32* %rem2, align 4
  %70 = load i32, i32* %term2, align 4
  %71 = load i32, i32* %term3, align 4
  call void @sub96(i32 %68, i32 %69, i32 0, i32 0, i32 %70, i32 %71, i32* %rem1, i32* %rem2, i32* %rem3)
  br label %while.cond.59

while.cond.59:                                    ; preds = %while.body.61, %if.end.58
  %72 = load i32, i32* %rem1, align 4
  %cmp60 = icmp slt i32 %72, 0
  br i1 %cmp60, label %while.body.61, label %while.end.65

while.body.61:                                    ; preds = %while.cond.59
  %73 = load i32, i32* %zSig1, align 4
  %dec62 = add i32 %73, -1
  store i32 %dec62, i32* %zSig1, align 4
  %74 = load i32, i32* %zSig1, align 4
  call void @shortShift64Left(i32 0, i32 %74, i32 1, i32* %term2, i32* %term3)
  %75 = load i32, i32* %term3, align 4
  %or63 = or i32 %75, 1
  store i32 %or63, i32* %term3, align 4
  %76 = load i32, i32* %doubleZSig0, align 4
  %77 = load i32, i32* %term2, align 4
  %or64 = or i32 %77, %76
  store i32 %or64, i32* %term2, align 4
  %78 = load i32, i32* %rem1, align 4
  %79 = load i32, i32* %rem2, align 4
  %80 = load i32, i32* %rem3, align 4
  %81 = load i32, i32* %term2, align 4
  %82 = load i32, i32* %term3, align 4
  call void @add96(i32 %78, i32 %79, i32 %80, i32 0, i32 %81, i32 %82, i32* %rem1, i32* %rem2, i32* %rem3)
  br label %while.cond.59

while.end.65:                                     ; preds = %while.cond.59
  %83 = load i32, i32* %rem1, align 4
  %84 = load i32, i32* %rem2, align 4
  %or66 = or i32 %83, %84
  %85 = load i32, i32* %rem3, align 4
  %or67 = or i32 %or66, %85
  %cmp68 = icmp ne i32 %or67, 0
  %conv = zext i1 %cmp68 to i32
  %86 = load i32, i32* %zSig1, align 4
  %or69 = or i32 %86, %conv
  store i32 %or69, i32* %zSig1, align 4
  br label %if.end.70

if.end.70:                                        ; preds = %while.end.65, %while.end
  %87 = load i32, i32* %zSig0, align 4
  %88 = load i32, i32* %zSig1, align 4
  call void @shift64ExtraRightJamming(i32 %87, i32 %88, i32 0, i32 10, i32* %zSig0, i32* %zSig1, i32* %zSig2)
  %89 = load i32, i32* %zExp, align 4
  %90 = load i32, i32* %zSig0, align 4
  %91 = load i32, i32* %zSig1, align 4
  %92 = load i32, i32* %zSig2, align 4
  %call71 = call i64 @roundAndPackFloat64(i32 0, i32 %89, i32 %90, i32 %91, i32 %92)
  %93 = bitcast %struct.float64* %retval to i64*
  store i64 %call71, i64* %93, align 4
  br label %return

return:                                           ; preds = %if.end.70, %if.then.36, %invalid, %if.then.27, %if.then.19, %if.then.12
  %94 = bitcast %struct.float64* %retval to i64*
  %95 = load i64, i64* %94, align 4
  ret i64 %95
}

; Function Attrs: nounwind
define i32 @float64_eq(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #1 {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.float64, align 4
  %b = alloca %struct.float64, align 4
  %high = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  store i32 %a.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  store i32 %a.1, i32* %low, align 4
  %high2 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  store i32 %b.0, i32* %high2, align 4
  %low3 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  store i32 %b.1, i32* %low3, align 4
  %high4 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %0 = load i32, i32* %high4, align 4
  %low5 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %1 = load i32, i32* %low5, align 4
  %call = call i32 @extractFloat64Exp(i32 %0, i32 %1)
  %cmp = icmp eq i32 %call, 2047
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %high6 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %2 = load i32, i32* %high6, align 4
  %low7 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %3 = load i32, i32* %low7, align 4
  %call8 = call i32 @extractFloat64Frac0(i32 %2, i32 %3)
  %high9 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %4 = load i32, i32* %high9, align 4
  %low10 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %5 = load i32, i32* %low10, align 4
  %call11 = call i32 @extractFloat64Frac1(i32 %4, i32 %5)
  %or = or i32 %call8, %call11
  %tobool = icmp ne i32 %or, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %high12 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %6 = load i32, i32* %high12, align 4
  %low13 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %7 = load i32, i32* %low13, align 4
  %call14 = call i32 @extractFloat64Exp(i32 %6, i32 %7)
  %cmp15 = icmp eq i32 %call14, 2047
  br i1 %cmp15, label %land.lhs.true.16, label %if.end.35

land.lhs.true.16:                                 ; preds = %lor.lhs.false
  %high17 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %8 = load i32, i32* %high17, align 4
  %low18 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %9 = load i32, i32* %low18, align 4
  %call19 = call i32 @extractFloat64Frac0(i32 %8, i32 %9)
  %high20 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %10 = load i32, i32* %high20, align 4
  %low21 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %11 = load i32, i32* %low21, align 4
  %call22 = call i32 @extractFloat64Frac1(i32 %10, i32 %11)
  %or23 = or i32 %call19, %call22
  %tobool24 = icmp ne i32 %or23, 0
  br i1 %tobool24, label %if.then, label %if.end.35

if.then:                                          ; preds = %land.lhs.true.16, %land.lhs.true
  %high25 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %12 = load i32, i32* %high25, align 4
  %low26 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %13 = load i32, i32* %low26, align 4
  %call27 = call i32 @float64_is_signaling_nan(i32 %12, i32 %13)
  %tobool28 = icmp ne i32 %call27, 0
  br i1 %tobool28, label %if.then.34, label %lor.lhs.false.29

lor.lhs.false.29:                                 ; preds = %if.then
  %high30 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %14 = load i32, i32* %high30, align 4
  %low31 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %15 = load i32, i32* %low31, align 4
  %call32 = call i32 @float64_is_signaling_nan(i32 %14, i32 %15)
  %tobool33 = icmp ne i32 %call32, 0
  br i1 %tobool33, label %if.then.34, label %if.end

if.then.34:                                       ; preds = %lor.lhs.false.29, %if.then
  call void @float_raise(i32 16)
  br label %if.end

if.end:                                           ; preds = %if.then.34, %lor.lhs.false.29
  store i32 0, i32* %retval
  br label %return

if.end.35:                                        ; preds = %land.lhs.true.16, %lor.lhs.false
  %low36 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %16 = load i32, i32* %low36, align 4
  %low37 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %17 = load i32, i32* %low37, align 4
  %cmp38 = icmp eq i32 %16, %17
  br i1 %cmp38, label %land.rhs, label %land.end.49

land.rhs:                                         ; preds = %if.end.35
  %high39 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %18 = load i32, i32* %high39, align 4
  %high40 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %19 = load i32, i32* %high40, align 4
  %cmp41 = icmp eq i32 %18, %19
  br i1 %cmp41, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %low42 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %20 = load i32, i32* %low42, align 4
  %cmp43 = icmp eq i32 %20, 0
  br i1 %cmp43, label %land.rhs.44, label %land.end

land.rhs.44:                                      ; preds = %lor.rhs
  %high45 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %21 = load i32, i32* %high45, align 4
  %high46 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %22 = load i32, i32* %high46, align 4
  %or47 = or i32 %21, %22
  %shl = shl i32 %or47, 1
  %cmp48 = icmp eq i32 %shl, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs.44, %lor.rhs
  %23 = phi i1 [ false, %lor.rhs ], [ %cmp48, %land.rhs.44 ]
  br label %lor.end

lor.end:                                          ; preds = %land.end, %land.rhs
  %24 = phi i1 [ true, %land.rhs ], [ %23, %land.end ]
  br label %land.end.49

land.end.49:                                      ; preds = %lor.end, %if.end.35
  %25 = phi i1 [ false, %if.end.35 ], [ %24, %lor.end ]
  %land.ext = zext i1 %25 to i32
  store i32 %land.ext, i32* %retval
  br label %return

return:                                           ; preds = %land.end.49, %if.end
  %26 = load i32, i32* %retval
  ret i32 %26
}

; Function Attrs: nounwind
define i32 @float64_le(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #1 {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.float64, align 4
  %b = alloca %struct.float64, align 4
  %aSign = alloca i32, align 4
  %bSign = alloca i32, align 4
  %high = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  store i32 %a.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  store i32 %a.1, i32* %low, align 4
  %high2 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  store i32 %b.0, i32* %high2, align 4
  %low3 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  store i32 %b.1, i32* %low3, align 4
  %high4 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %0 = load i32, i32* %high4, align 4
  %low5 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %1 = load i32, i32* %low5, align 4
  %call = call i32 @extractFloat64Exp(i32 %0, i32 %1)
  %cmp = icmp eq i32 %call, 2047
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %high6 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %2 = load i32, i32* %high6, align 4
  %low7 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %3 = load i32, i32* %low7, align 4
  %call8 = call i32 @extractFloat64Frac0(i32 %2, i32 %3)
  %high9 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %4 = load i32, i32* %high9, align 4
  %low10 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %5 = load i32, i32* %low10, align 4
  %call11 = call i32 @extractFloat64Frac1(i32 %4, i32 %5)
  %or = or i32 %call8, %call11
  %tobool = icmp ne i32 %or, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %high12 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %6 = load i32, i32* %high12, align 4
  %low13 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %7 = load i32, i32* %low13, align 4
  %call14 = call i32 @extractFloat64Exp(i32 %6, i32 %7)
  %cmp15 = icmp eq i32 %call14, 2047
  br i1 %cmp15, label %land.lhs.true.16, label %if.end

land.lhs.true.16:                                 ; preds = %lor.lhs.false
  %high17 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %8 = load i32, i32* %high17, align 4
  %low18 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %9 = load i32, i32* %low18, align 4
  %call19 = call i32 @extractFloat64Frac0(i32 %8, i32 %9)
  %high20 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %10 = load i32, i32* %high20, align 4
  %low21 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %11 = load i32, i32* %low21, align 4
  %call22 = call i32 @extractFloat64Frac1(i32 %10, i32 %11)
  %or23 = or i32 %call19, %call22
  %tobool24 = icmp ne i32 %or23, 0
  br i1 %tobool24, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true.16, %land.lhs.true
  call void @float_raise(i32 16)
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %land.lhs.true.16, %lor.lhs.false
  %high25 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %12 = load i32, i32* %high25, align 4
  %low26 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %13 = load i32, i32* %low26, align 4
  %call27 = call i32 @extractFloat64Sign(i32 %12, i32 %13)
  store i32 %call27, i32* %aSign, align 4
  %high28 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %14 = load i32, i32* %high28, align 4
  %low29 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %15 = load i32, i32* %low29, align 4
  %call30 = call i32 @extractFloat64Sign(i32 %14, i32 %15)
  store i32 %call30, i32* %bSign, align 4
  %16 = load i32, i32* %aSign, align 4
  %17 = load i32, i32* %bSign, align 4
  %cmp31 = icmp ne i32 %16, %17
  br i1 %cmp31, label %if.then.32, label %if.end.42

if.then.32:                                       ; preds = %if.end
  %18 = load i32, i32* %aSign, align 4
  %tobool33 = icmp ne i32 %18, 0
  br i1 %tobool33, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.then.32
  %high34 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %19 = load i32, i32* %high34, align 4
  %high35 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %20 = load i32, i32* %high35, align 4
  %or36 = or i32 %19, %20
  %shl = shl i32 %or36, 1
  %low37 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %21 = load i32, i32* %low37, align 4
  %or38 = or i32 %shl, %21
  %low39 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %22 = load i32, i32* %low39, align 4
  %or40 = or i32 %or38, %22
  %cmp41 = icmp eq i32 %or40, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.then.32
  %23 = phi i1 [ true, %if.then.32 ], [ %cmp41, %lor.rhs ]
  %lor.ext = zext i1 %23 to i32
  store i32 %lor.ext, i32* %retval
  br label %return

if.end.42:                                        ; preds = %if.end
  %24 = load i32, i32* %aSign, align 4
  %tobool43 = icmp ne i32 %24, 0
  br i1 %tobool43, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end.42
  %high44 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %25 = load i32, i32* %high44, align 4
  %low45 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %26 = load i32, i32* %low45, align 4
  %high46 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %27 = load i32, i32* %high46, align 4
  %low47 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %28 = load i32, i32* %low47, align 4
  %call48 = call i32 @le64(i32 %25, i32 %26, i32 %27, i32 %28)
  br label %cond.end

cond.false:                                       ; preds = %if.end.42
  %high49 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %29 = load i32, i32* %high49, align 4
  %low50 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %30 = load i32, i32* %low50, align 4
  %high51 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %31 = load i32, i32* %high51, align 4
  %low52 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %32 = load i32, i32* %low52, align 4
  %call53 = call i32 @le64(i32 %29, i32 %30, i32 %31, i32 %32)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call48, %cond.true ], [ %call53, %cond.false ]
  store i32 %cond, i32* %retval
  br label %return

return:                                           ; preds = %cond.end, %lor.end, %if.then
  %33 = load i32, i32* %retval
  ret i32 %33
}

; Function Attrs: nounwind
define i32 @float64_lt(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #1 {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.float64, align 4
  %b = alloca %struct.float64, align 4
  %aSign = alloca i32, align 4
  %bSign = alloca i32, align 4
  %high = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  store i32 %a.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  store i32 %a.1, i32* %low, align 4
  %high2 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  store i32 %b.0, i32* %high2, align 4
  %low3 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  store i32 %b.1, i32* %low3, align 4
  %high4 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %0 = load i32, i32* %high4, align 4
  %low5 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %1 = load i32, i32* %low5, align 4
  %call = call i32 @extractFloat64Exp(i32 %0, i32 %1)
  %cmp = icmp eq i32 %call, 2047
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %high6 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %2 = load i32, i32* %high6, align 4
  %low7 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %3 = load i32, i32* %low7, align 4
  %call8 = call i32 @extractFloat64Frac0(i32 %2, i32 %3)
  %high9 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %4 = load i32, i32* %high9, align 4
  %low10 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %5 = load i32, i32* %low10, align 4
  %call11 = call i32 @extractFloat64Frac1(i32 %4, i32 %5)
  %or = or i32 %call8, %call11
  %tobool = icmp ne i32 %or, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %high12 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %6 = load i32, i32* %high12, align 4
  %low13 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %7 = load i32, i32* %low13, align 4
  %call14 = call i32 @extractFloat64Exp(i32 %6, i32 %7)
  %cmp15 = icmp eq i32 %call14, 2047
  br i1 %cmp15, label %land.lhs.true.16, label %if.end

land.lhs.true.16:                                 ; preds = %lor.lhs.false
  %high17 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %8 = load i32, i32* %high17, align 4
  %low18 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %9 = load i32, i32* %low18, align 4
  %call19 = call i32 @extractFloat64Frac0(i32 %8, i32 %9)
  %high20 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %10 = load i32, i32* %high20, align 4
  %low21 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %11 = load i32, i32* %low21, align 4
  %call22 = call i32 @extractFloat64Frac1(i32 %10, i32 %11)
  %or23 = or i32 %call19, %call22
  %tobool24 = icmp ne i32 %or23, 0
  br i1 %tobool24, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true.16, %land.lhs.true
  call void @float_raise(i32 16)
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %land.lhs.true.16, %lor.lhs.false
  %high25 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %12 = load i32, i32* %high25, align 4
  %low26 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %13 = load i32, i32* %low26, align 4
  %call27 = call i32 @extractFloat64Sign(i32 %12, i32 %13)
  store i32 %call27, i32* %aSign, align 4
  %high28 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %14 = load i32, i32* %high28, align 4
  %low29 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %15 = load i32, i32* %low29, align 4
  %call30 = call i32 @extractFloat64Sign(i32 %14, i32 %15)
  store i32 %call30, i32* %bSign, align 4
  %16 = load i32, i32* %aSign, align 4
  %17 = load i32, i32* %bSign, align 4
  %cmp31 = icmp ne i32 %16, %17
  br i1 %cmp31, label %if.then.32, label %if.end.42

if.then.32:                                       ; preds = %if.end
  %18 = load i32, i32* %aSign, align 4
  %tobool33 = icmp ne i32 %18, 0
  br i1 %tobool33, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.then.32
  %high34 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %19 = load i32, i32* %high34, align 4
  %high35 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %20 = load i32, i32* %high35, align 4
  %or36 = or i32 %19, %20
  %shl = shl i32 %or36, 1
  %low37 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %21 = load i32, i32* %low37, align 4
  %or38 = or i32 %shl, %21
  %low39 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %22 = load i32, i32* %low39, align 4
  %or40 = or i32 %or38, %22
  %cmp41 = icmp ne i32 %or40, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then.32
  %23 = phi i1 [ false, %if.then.32 ], [ %cmp41, %land.rhs ]
  %land.ext = zext i1 %23 to i32
  store i32 %land.ext, i32* %retval
  br label %return

if.end.42:                                        ; preds = %if.end
  %24 = load i32, i32* %aSign, align 4
  %tobool43 = icmp ne i32 %24, 0
  br i1 %tobool43, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end.42
  %high44 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %25 = load i32, i32* %high44, align 4
  %low45 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %26 = load i32, i32* %low45, align 4
  %high46 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %27 = load i32, i32* %high46, align 4
  %low47 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %28 = load i32, i32* %low47, align 4
  %call48 = call i32 @lt64(i32 %25, i32 %26, i32 %27, i32 %28)
  br label %cond.end

cond.false:                                       ; preds = %if.end.42
  %high49 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %29 = load i32, i32* %high49, align 4
  %low50 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %30 = load i32, i32* %low50, align 4
  %high51 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %31 = load i32, i32* %high51, align 4
  %low52 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %32 = load i32, i32* %low52, align 4
  %call53 = call i32 @lt64(i32 %29, i32 %30, i32 %31, i32 %32)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call48, %cond.true ], [ %call53, %cond.false ]
  store i32 %cond, i32* %retval
  br label %return

return:                                           ; preds = %cond.end, %land.end, %if.then
  %33 = load i32, i32* %retval
  ret i32 %33
}

; Function Attrs: nounwind
define i32 @float64_eq_signaling(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #1 {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.float64, align 4
  %b = alloca %struct.float64, align 4
  %high = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  store i32 %a.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  store i32 %a.1, i32* %low, align 4
  %high2 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  store i32 %b.0, i32* %high2, align 4
  %low3 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  store i32 %b.1, i32* %low3, align 4
  %high4 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %0 = load i32, i32* %high4, align 4
  %low5 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %1 = load i32, i32* %low5, align 4
  %call = call i32 @extractFloat64Exp(i32 %0, i32 %1)
  %cmp = icmp eq i32 %call, 2047
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %high6 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %2 = load i32, i32* %high6, align 4
  %low7 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %3 = load i32, i32* %low7, align 4
  %call8 = call i32 @extractFloat64Frac0(i32 %2, i32 %3)
  %high9 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %4 = load i32, i32* %high9, align 4
  %low10 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %5 = load i32, i32* %low10, align 4
  %call11 = call i32 @extractFloat64Frac1(i32 %4, i32 %5)
  %or = or i32 %call8, %call11
  %tobool = icmp ne i32 %or, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %high12 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %6 = load i32, i32* %high12, align 4
  %low13 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %7 = load i32, i32* %low13, align 4
  %call14 = call i32 @extractFloat64Exp(i32 %6, i32 %7)
  %cmp15 = icmp eq i32 %call14, 2047
  br i1 %cmp15, label %land.lhs.true.16, label %if.end

land.lhs.true.16:                                 ; preds = %lor.lhs.false
  %high17 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %8 = load i32, i32* %high17, align 4
  %low18 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %9 = load i32, i32* %low18, align 4
  %call19 = call i32 @extractFloat64Frac0(i32 %8, i32 %9)
  %high20 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %10 = load i32, i32* %high20, align 4
  %low21 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %11 = load i32, i32* %low21, align 4
  %call22 = call i32 @extractFloat64Frac1(i32 %10, i32 %11)
  %or23 = or i32 %call19, %call22
  %tobool24 = icmp ne i32 %or23, 0
  br i1 %tobool24, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true.16, %land.lhs.true
  call void @float_raise(i32 16)
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %land.lhs.true.16, %lor.lhs.false
  %low25 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %12 = load i32, i32* %low25, align 4
  %low26 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %13 = load i32, i32* %low26, align 4
  %cmp27 = icmp eq i32 %12, %13
  br i1 %cmp27, label %land.rhs, label %land.end.38

land.rhs:                                         ; preds = %if.end
  %high28 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %14 = load i32, i32* %high28, align 4
  %high29 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %15 = load i32, i32* %high29, align 4
  %cmp30 = icmp eq i32 %14, %15
  br i1 %cmp30, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %land.rhs
  %low31 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %16 = load i32, i32* %low31, align 4
  %cmp32 = icmp eq i32 %16, 0
  br i1 %cmp32, label %land.rhs.33, label %land.end

land.rhs.33:                                      ; preds = %lor.rhs
  %high34 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %17 = load i32, i32* %high34, align 4
  %high35 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %18 = load i32, i32* %high35, align 4
  %or36 = or i32 %17, %18
  %shl = shl i32 %or36, 1
  %cmp37 = icmp eq i32 %shl, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs.33, %lor.rhs
  %19 = phi i1 [ false, %lor.rhs ], [ %cmp37, %land.rhs.33 ]
  br label %lor.end

lor.end:                                          ; preds = %land.end, %land.rhs
  %20 = phi i1 [ true, %land.rhs ], [ %19, %land.end ]
  br label %land.end.38

land.end.38:                                      ; preds = %lor.end, %if.end
  %21 = phi i1 [ false, %if.end ], [ %20, %lor.end ]
  %land.ext = zext i1 %21 to i32
  store i32 %land.ext, i32* %retval
  br label %return

return:                                           ; preds = %land.end.38, %if.then
  %22 = load i32, i32* %retval
  ret i32 %22
}

; Function Attrs: nounwind
define i32 @float64_le_quiet(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #1 {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.float64, align 4
  %b = alloca %struct.float64, align 4
  %aSign = alloca i32, align 4
  %bSign = alloca i32, align 4
  %high = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  store i32 %a.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  store i32 %a.1, i32* %low, align 4
  %high2 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  store i32 %b.0, i32* %high2, align 4
  %low3 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  store i32 %b.1, i32* %low3, align 4
  %high4 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %0 = load i32, i32* %high4, align 4
  %low5 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %1 = load i32, i32* %low5, align 4
  %call = call i32 @extractFloat64Exp(i32 %0, i32 %1)
  %cmp = icmp eq i32 %call, 2047
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %high6 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %2 = load i32, i32* %high6, align 4
  %low7 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %3 = load i32, i32* %low7, align 4
  %call8 = call i32 @extractFloat64Frac0(i32 %2, i32 %3)
  %high9 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %4 = load i32, i32* %high9, align 4
  %low10 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %5 = load i32, i32* %low10, align 4
  %call11 = call i32 @extractFloat64Frac1(i32 %4, i32 %5)
  %or = or i32 %call8, %call11
  %tobool = icmp ne i32 %or, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %high12 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %6 = load i32, i32* %high12, align 4
  %low13 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %7 = load i32, i32* %low13, align 4
  %call14 = call i32 @extractFloat64Exp(i32 %6, i32 %7)
  %cmp15 = icmp eq i32 %call14, 2047
  br i1 %cmp15, label %land.lhs.true.16, label %if.end.35

land.lhs.true.16:                                 ; preds = %lor.lhs.false
  %high17 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %8 = load i32, i32* %high17, align 4
  %low18 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %9 = load i32, i32* %low18, align 4
  %call19 = call i32 @extractFloat64Frac0(i32 %8, i32 %9)
  %high20 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %10 = load i32, i32* %high20, align 4
  %low21 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %11 = load i32, i32* %low21, align 4
  %call22 = call i32 @extractFloat64Frac1(i32 %10, i32 %11)
  %or23 = or i32 %call19, %call22
  %tobool24 = icmp ne i32 %or23, 0
  br i1 %tobool24, label %if.then, label %if.end.35

if.then:                                          ; preds = %land.lhs.true.16, %land.lhs.true
  %high25 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %12 = load i32, i32* %high25, align 4
  %low26 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %13 = load i32, i32* %low26, align 4
  %call27 = call i32 @float64_is_signaling_nan(i32 %12, i32 %13)
  %tobool28 = icmp ne i32 %call27, 0
  br i1 %tobool28, label %if.then.34, label %lor.lhs.false.29

lor.lhs.false.29:                                 ; preds = %if.then
  %high30 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %14 = load i32, i32* %high30, align 4
  %low31 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %15 = load i32, i32* %low31, align 4
  %call32 = call i32 @float64_is_signaling_nan(i32 %14, i32 %15)
  %tobool33 = icmp ne i32 %call32, 0
  br i1 %tobool33, label %if.then.34, label %if.end

if.then.34:                                       ; preds = %lor.lhs.false.29, %if.then
  call void @float_raise(i32 16)
  br label %if.end

if.end:                                           ; preds = %if.then.34, %lor.lhs.false.29
  store i32 0, i32* %retval
  br label %return

if.end.35:                                        ; preds = %land.lhs.true.16, %lor.lhs.false
  %high36 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %16 = load i32, i32* %high36, align 4
  %low37 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %17 = load i32, i32* %low37, align 4
  %call38 = call i32 @extractFloat64Sign(i32 %16, i32 %17)
  store i32 %call38, i32* %aSign, align 4
  %high39 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %18 = load i32, i32* %high39, align 4
  %low40 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %19 = load i32, i32* %low40, align 4
  %call41 = call i32 @extractFloat64Sign(i32 %18, i32 %19)
  store i32 %call41, i32* %bSign, align 4
  %20 = load i32, i32* %aSign, align 4
  %21 = load i32, i32* %bSign, align 4
  %cmp42 = icmp ne i32 %20, %21
  br i1 %cmp42, label %if.then.43, label %if.end.53

if.then.43:                                       ; preds = %if.end.35
  %22 = load i32, i32* %aSign, align 4
  %tobool44 = icmp ne i32 %22, 0
  br i1 %tobool44, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %if.then.43
  %high45 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %23 = load i32, i32* %high45, align 4
  %high46 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %24 = load i32, i32* %high46, align 4
  %or47 = or i32 %23, %24
  %shl = shl i32 %or47, 1
  %low48 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %25 = load i32, i32* %low48, align 4
  %or49 = or i32 %shl, %25
  %low50 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %26 = load i32, i32* %low50, align 4
  %or51 = or i32 %or49, %26
  %cmp52 = icmp eq i32 %or51, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %if.then.43
  %27 = phi i1 [ true, %if.then.43 ], [ %cmp52, %lor.rhs ]
  %lor.ext = zext i1 %27 to i32
  store i32 %lor.ext, i32* %retval
  br label %return

if.end.53:                                        ; preds = %if.end.35
  %28 = load i32, i32* %aSign, align 4
  %tobool54 = icmp ne i32 %28, 0
  br i1 %tobool54, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end.53
  %high55 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %29 = load i32, i32* %high55, align 4
  %low56 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %30 = load i32, i32* %low56, align 4
  %high57 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %31 = load i32, i32* %high57, align 4
  %low58 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %32 = load i32, i32* %low58, align 4
  %call59 = call i32 @le64(i32 %29, i32 %30, i32 %31, i32 %32)
  br label %cond.end

cond.false:                                       ; preds = %if.end.53
  %high60 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %33 = load i32, i32* %high60, align 4
  %low61 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %34 = load i32, i32* %low61, align 4
  %high62 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %35 = load i32, i32* %high62, align 4
  %low63 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %36 = load i32, i32* %low63, align 4
  %call64 = call i32 @le64(i32 %33, i32 %34, i32 %35, i32 %36)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call59, %cond.true ], [ %call64, %cond.false ]
  store i32 %cond, i32* %retval
  br label %return

return:                                           ; preds = %cond.end, %lor.end, %if.end
  %37 = load i32, i32* %retval
  ret i32 %37
}

; Function Attrs: nounwind
define i32 @float64_lt_quiet(i32 %a.0, i32 %a.1, i32 %b.0, i32 %b.1) #1 {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.float64, align 4
  %b = alloca %struct.float64, align 4
  %aSign = alloca i32, align 4
  %bSign = alloca i32, align 4
  %high = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  store i32 %a.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  store i32 %a.1, i32* %low, align 4
  %high2 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  store i32 %b.0, i32* %high2, align 4
  %low3 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  store i32 %b.1, i32* %low3, align 4
  %high4 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %0 = load i32, i32* %high4, align 4
  %low5 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %1 = load i32, i32* %low5, align 4
  %call = call i32 @extractFloat64Exp(i32 %0, i32 %1)
  %cmp = icmp eq i32 %call, 2047
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %high6 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %2 = load i32, i32* %high6, align 4
  %low7 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %3 = load i32, i32* %low7, align 4
  %call8 = call i32 @extractFloat64Frac0(i32 %2, i32 %3)
  %high9 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %4 = load i32, i32* %high9, align 4
  %low10 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %5 = load i32, i32* %low10, align 4
  %call11 = call i32 @extractFloat64Frac1(i32 %4, i32 %5)
  %or = or i32 %call8, %call11
  %tobool = icmp ne i32 %or, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true, %entry
  %high12 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %6 = load i32, i32* %high12, align 4
  %low13 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %7 = load i32, i32* %low13, align 4
  %call14 = call i32 @extractFloat64Exp(i32 %6, i32 %7)
  %cmp15 = icmp eq i32 %call14, 2047
  br i1 %cmp15, label %land.lhs.true.16, label %if.end.35

land.lhs.true.16:                                 ; preds = %lor.lhs.false
  %high17 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %8 = load i32, i32* %high17, align 4
  %low18 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %9 = load i32, i32* %low18, align 4
  %call19 = call i32 @extractFloat64Frac0(i32 %8, i32 %9)
  %high20 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %10 = load i32, i32* %high20, align 4
  %low21 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %11 = load i32, i32* %low21, align 4
  %call22 = call i32 @extractFloat64Frac1(i32 %10, i32 %11)
  %or23 = or i32 %call19, %call22
  %tobool24 = icmp ne i32 %or23, 0
  br i1 %tobool24, label %if.then, label %if.end.35

if.then:                                          ; preds = %land.lhs.true.16, %land.lhs.true
  %high25 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %12 = load i32, i32* %high25, align 4
  %low26 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %13 = load i32, i32* %low26, align 4
  %call27 = call i32 @float64_is_signaling_nan(i32 %12, i32 %13)
  %tobool28 = icmp ne i32 %call27, 0
  br i1 %tobool28, label %if.then.34, label %lor.lhs.false.29

lor.lhs.false.29:                                 ; preds = %if.then
  %high30 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %14 = load i32, i32* %high30, align 4
  %low31 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %15 = load i32, i32* %low31, align 4
  %call32 = call i32 @float64_is_signaling_nan(i32 %14, i32 %15)
  %tobool33 = icmp ne i32 %call32, 0
  br i1 %tobool33, label %if.then.34, label %if.end

if.then.34:                                       ; preds = %lor.lhs.false.29, %if.then
  call void @float_raise(i32 16)
  br label %if.end

if.end:                                           ; preds = %if.then.34, %lor.lhs.false.29
  store i32 0, i32* %retval
  br label %return

if.end.35:                                        ; preds = %land.lhs.true.16, %lor.lhs.false
  %high36 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %16 = load i32, i32* %high36, align 4
  %low37 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %17 = load i32, i32* %low37, align 4
  %call38 = call i32 @extractFloat64Sign(i32 %16, i32 %17)
  store i32 %call38, i32* %aSign, align 4
  %high39 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %18 = load i32, i32* %high39, align 4
  %low40 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %19 = load i32, i32* %low40, align 4
  %call41 = call i32 @extractFloat64Sign(i32 %18, i32 %19)
  store i32 %call41, i32* %bSign, align 4
  %20 = load i32, i32* %aSign, align 4
  %21 = load i32, i32* %bSign, align 4
  %cmp42 = icmp ne i32 %20, %21
  br i1 %cmp42, label %if.then.43, label %if.end.53

if.then.43:                                       ; preds = %if.end.35
  %22 = load i32, i32* %aSign, align 4
  %tobool44 = icmp ne i32 %22, 0
  br i1 %tobool44, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.then.43
  %high45 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %23 = load i32, i32* %high45, align 4
  %high46 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %24 = load i32, i32* %high46, align 4
  %or47 = or i32 %23, %24
  %shl = shl i32 %or47, 1
  %low48 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %25 = load i32, i32* %low48, align 4
  %or49 = or i32 %shl, %25
  %low50 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %26 = load i32, i32* %low50, align 4
  %or51 = or i32 %or49, %26
  %cmp52 = icmp ne i32 %or51, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then.43
  %27 = phi i1 [ false, %if.then.43 ], [ %cmp52, %land.rhs ]
  %land.ext = zext i1 %27 to i32
  store i32 %land.ext, i32* %retval
  br label %return

if.end.53:                                        ; preds = %if.end.35
  %28 = load i32, i32* %aSign, align 4
  %tobool54 = icmp ne i32 %28, 0
  br i1 %tobool54, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end.53
  %high55 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %29 = load i32, i32* %high55, align 4
  %low56 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %30 = load i32, i32* %low56, align 4
  %high57 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %31 = load i32, i32* %high57, align 4
  %low58 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %32 = load i32, i32* %low58, align 4
  %call59 = call i32 @lt64(i32 %29, i32 %30, i32 %31, i32 %32)
  br label %cond.end

cond.false:                                       ; preds = %if.end.53
  %high60 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 0
  %33 = load i32, i32* %high60, align 4
  %low61 = getelementptr inbounds %struct.float64, %struct.float64* %a, i32 0, i32 1
  %34 = load i32, i32* %low61, align 4
  %high62 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 0
  %35 = load i32, i32* %high62, align 4
  %low63 = getelementptr inbounds %struct.float64, %struct.float64* %b, i32 0, i32 1
  %36 = load i32, i32* %low63, align 4
  %call64 = call i32 @lt64(i32 %33, i32 %34, i32 %35, i32 %36)
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call59, %cond.true ], [ %call64, %cond.false ]
  store i32 %cond, i32* %retval
  br label %return

return:                                           ; preds = %cond.end, %land.end, %if.end
  %37 = load i32, i32* %retval
  ret i32 %37
}

attributes #0 = { inlinehint nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.1 (tags/RELEASE_371/final)"}
