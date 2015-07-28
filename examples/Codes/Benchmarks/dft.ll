; ModuleID = 'dft.c'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

%struct.int_64_t = type { i32, i32 }

@rowsums = global [24 x i32] [i32 759, i32 776, i32 787, i32 795, i32 797, i32 796, i32 801, i32 805, i32 800, i32 800, i32 799, i32 801, i32 799, i32 790, i32 781, i32 775, i32 772, i32 769, i32 768, i32 767, i32 762, i32 761, i32 755, i32 751], align 4
@powers = global [4 x [24 x i32]] zeroinitializer, align 4
@powers_temp = global [4 x [24 x i32]] [[24 x i32] [i32 74111750, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], [24 x i32] [i32 70347846, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], [24 x i32] [i32 64357961, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], [24 x i32] [i32 56550176, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0]], align 4
@dft_waves_cos = global [96 x i32] [i32 131072, i32 126606, i32 113512, i32 92683, i32 65537, i32 33926, i32 3, i32 -33921, i32 -65532, i32 -92679, i32 -113509, i32 -126605, i32 -131072, i32 -126608, i32 -113516, i32 -92689, i32 -65544, i32 -33934, i32 -11, i32 33913, i32 65526, i32 92673, i32 113505, i32 126602, i32 131072, i32 113512, i32 65537, i32 3, i32 -65532, i32 -113509, i32 -131072, i32 -113516, i32 -65544, i32 -11, i32 65526, i32 113505, i32 131072, i32 113518, i32 65549, i32 16, i32 -65521, i32 -113503, i32 -131072, i32 -113523, i32 -65556, i32 -24, i32 65514, i32 113499, i32 131072, i32 92683, i32 3, i32 -92679, i32 -131072, i32 -92689, i32 -11, i32 92673, i32 131072, i32 92692, i32 16, i32 -92669, i32 -131072, i32 -92698, i32 -24, i32 92664, i32 131071, i32 92701, i32 29, i32 -92660, i32 -131072, i32 -92707, i32 -37, i32 92654, i32 131072, i32 65537, i32 -65532, i32 -131072, i32 -65544, i32 65526, i32 131072, i32 65549, i32 -65521, i32 -131072, i32 -65556, i32 65514, i32 131071, i32 65560, i32 -65510, i32 -131072, i32 -65567, i32 65503, i32 131071, i32 65571, i32 -65499, i32 -131072, i32 -65578, i32 65492], align 4
@dft_waves_sin = global [96 x i32] [i32 0, i32 33923, i32 65535, i32 92680, i32 113510, i32 126605, i32 131071, i32 126606, i32 113514, i32 92685, i32 65540, i32 33929, i32 6, i32 -33917, i32 -65530, i32 -92676, i32 -113508, i32 -126604, i32 -131072, i32 -126609, i32 -113518, i32 -92691, i32 -65547, i32 -33937, i32 0, i32 65535, i32 113510, i32 131071, i32 113514, i32 65540, i32 6, i32 -65530, i32 -113508, i32 -131072, i32 -113518, i32 -65547, i32 -14, i32 65523, i32 113504, i32 131071, i32 113520, i32 65552, i32 19, i32 -65518, i32 -113501, i32 -131072, i32 -113524, i32 -65558, i32 0, i32 92680, i32 131071, i32 92685, i32 6, i32 -92676, i32 -131072, i32 -92691, i32 -14, i32 92671, i32 131071, i32 92694, i32 19, i32 -92667, i32 -131072, i32 -92700, i32 -27, i32 92662, i32 131071, i32 92704, i32 32, i32 -92658, i32 -131072, i32 -92709, i32 0, i32 113510, i32 113514, i32 6, i32 -113508, i32 -113518, i32 -14, i32 113504, i32 113520, i32 19, i32 -113501, i32 -113524, i32 -27, i32 113497, i32 113527, i32 32, i32 -113495, i32 -113531, i32 -40, i32 113491, i32 113533, i32 45, i32 -113488, i32 -113537], align 4

; Function Attrs: nounwind
define i32 @cast_uint32(i32 inreg %x.coerce0, i32 inreg %x.coerce1) #0 {
entry:
  %x = alloca %struct.int_64_t, align 4
  %res = alloca i32, align 4
  %0 = bitcast %struct.int_64_t* %x to { i32, i32 }*
  %1 = getelementptr { i32, i32 }, { i32, i32 }* %0, i32 0, i32 0
  store i32 %x.coerce0, i32* %1
  %2 = getelementptr { i32, i32 }, { i32, i32 }* %0, i32 0, i32 1
  store i32 %x.coerce1, i32* %2
  %low = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 1
  %3 = load i32, i32* %low, align 4
  store i32 %3, i32* %res, align 4
  %high = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 0
  %4 = load i32, i32* %high, align 4
  %cmp = icmp ne i32 %4, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load i32, i32* %res, align 4
  ret i32 %5
}

; Function Attrs: nounwind
define i32 @cast_int32(i32 inreg %x.coerce0, i32 inreg %x.coerce1) #0 {
entry:
  %x = alloca %struct.int_64_t, align 4
  %result = alloca i32, align 4
  %0 = bitcast %struct.int_64_t* %x to { i32, i32 }*
  %1 = getelementptr { i32, i32 }, { i32, i32 }* %0, i32 0, i32 0
  store i32 %x.coerce0, i32* %1
  %2 = getelementptr { i32, i32 }, { i32, i32 }* %0, i32 0, i32 1
  store i32 %x.coerce1, i32* %2
  store i32 0, i32* %result, align 4
  %high = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 0
  %3 = load i32, i32* %high, align 4
  %and = and i32 %3, -2147483648
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.else3

if.then:                                          ; preds = %entry
  %high1 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 0
  %4 = load i32, i32* %high1, align 4
  %cmp = icmp eq i32 %4, -1
  br i1 %cmp, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.then
  %low = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 1
  %5 = load i32, i32* %low, align 4
  store i32 %5, i32* %result, align 4
  br label %if.end

if.else:                                          ; preds = %if.then
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then2
  br label %if.end10

if.else3:                                         ; preds = %entry
  %high4 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 0
  %6 = load i32, i32* %high4, align 4
  %cmp5 = icmp eq i32 %6, 0
  br i1 %cmp5, label %if.then6, label %if.else8

if.then6:                                         ; preds = %if.else3
  %low7 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 1
  %7 = load i32, i32* %low7, align 4
  store i32 %7, i32* %result, align 4
  br label %if.end9

if.else8:                                         ; preds = %if.else3
  br label %if.end9

if.end9:                                          ; preds = %if.else8, %if.then6
  br label %if.end10

if.end10:                                         ; preds = %if.end9, %if.end
  %8 = load i32, i32* %result, align 4
  ret i32 %8
}

; Function Attrs: nounwind
define void @cast(%struct.int_64_t* noalias sret %agg.result, i32 signext %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %llong = alloca %struct.int_64_t, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32, i32* %x.addr, align 4
  %low = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %llong, i32 0, i32 1
  store i32 %0, i32* %low, align 4
  %1 = load i32, i32* %x.addr, align 4
  %cmp = icmp slt i32 %1, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %high = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %llong, i32 0, i32 0
  store i32 -1, i32* %high, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %high1 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %llong, i32 0, i32 0
  store i32 0, i32* %high1, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = bitcast %struct.int_64_t* %agg.result to i8*
  %3 = bitcast %struct.int_64_t* %llong to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %2, i8* %3, i32 8, i32 4, i1 false)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture, i8* nocapture readonly, i32, i32, i1) #1

; Function Attrs: nounwind
define void @add(%struct.int_64_t* noalias sret %agg.result, i32 inreg %x.coerce0, i32 inreg %x.coerce1, i32 inreg %y.coerce0, i32 inreg %y.coerce1) #0 {
entry:
  %x = alloca %struct.int_64_t, align 4
  %y = alloca %struct.int_64_t, align 4
  %x1 = alloca i32, align 4
  %x2 = alloca i32, align 4
  %y1 = alloca i32, align 4
  %y2 = alloca i32, align 4
  %z1 = alloca i32, align 4
  %z2 = alloca i32, align 4
  %sum = alloca %struct.int_64_t, align 4
  %0 = bitcast %struct.int_64_t* %x to { i32, i32 }*
  %1 = getelementptr { i32, i32 }, { i32, i32 }* %0, i32 0, i32 0
  store i32 %x.coerce0, i32* %1
  %2 = getelementptr { i32, i32 }, { i32, i32 }* %0, i32 0, i32 1
  store i32 %x.coerce1, i32* %2
  %3 = bitcast %struct.int_64_t* %y to { i32, i32 }*
  %4 = getelementptr { i32, i32 }, { i32, i32 }* %3, i32 0, i32 0
  store i32 %y.coerce0, i32* %4
  %5 = getelementptr { i32, i32 }, { i32, i32 }* %3, i32 0, i32 1
  store i32 %y.coerce1, i32* %5
  %low = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 1
  %6 = load i32, i32* %low, align 4
  store i32 %6, i32* %x1, align 4
  %high = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 0
  %7 = load i32, i32* %high, align 4
  store i32 %7, i32* %x2, align 4
  %low1 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %y, i32 0, i32 1
  %8 = load i32, i32* %low1, align 4
  store i32 %8, i32* %y1, align 4
  %high2 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %y, i32 0, i32 0
  %9 = load i32, i32* %high2, align 4
  store i32 %9, i32* %y2, align 4
  store i32 0, i32* %z2, align 4
  store i32 0, i32* %z1, align 4
  %10 = load i32, i32* %x1, align 4
  %11 = load i32, i32* %y1, align 4
  %add = add i32 %10, %11
  store i32 %add, i32* %z1, align 4
  %12 = load i32, i32* %z1, align 4
  %13 = load i32, i32* %x1, align 4
  %cmp = icmp ult i32 %12, %13
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %14 = load i32, i32* %z1, align 4
  %15 = load i32, i32* %y1, align 4
  %cmp3 = icmp ult i32 %14, %15
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %16 = load i32, i32* %z2, align 4
  %inc = add i32 %16, 1
  store i32 %inc, i32* %z2, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %17 = load i32, i32* %x2, align 4
  %18 = load i32, i32* %y2, align 4
  %add4 = add i32 %17, %18
  %19 = load i32, i32* %z2, align 4
  %add5 = add i32 %19, %add4
  store i32 %add5, i32* %z2, align 4
  %20 = load i32, i32* %z1, align 4
  %low6 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %sum, i32 0, i32 1
  store i32 %20, i32* %low6, align 4
  %21 = load i32, i32* %z2, align 4
  %high7 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %sum, i32 0, i32 0
  store i32 %21, i32* %high7, align 4
  %22 = bitcast %struct.int_64_t* %agg.result to i8*
  %23 = bitcast %struct.int_64_t* %sum to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %22, i8* %23, i32 8, i32 4, i1 false)
  ret void
}

; Function Attrs: nounwind
define void @neg(%struct.int_64_t* noalias sret %agg.result, i32 inreg %x.coerce0, i32 inreg %x.coerce1) #0 {
entry:
  %x = alloca %struct.int_64_t, align 4
  %agg.tmp = alloca %struct.int_64_t, align 4
  %0 = bitcast %struct.int_64_t* %x to { i32, i32 }*
  %1 = getelementptr { i32, i32 }, { i32, i32 }* %0, i32 0, i32 0
  store i32 %x.coerce0, i32* %1
  %2 = getelementptr { i32, i32 }, { i32, i32 }* %0, i32 0, i32 1
  store i32 %x.coerce1, i32* %2
  %low = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 1
  %3 = load i32, i32* %low, align 4
  %neg = xor i32 %3, -1
  %low1 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 1
  store i32 %neg, i32* %low1, align 4
  %high = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 0
  %4 = load i32, i32* %high, align 4
  %neg2 = xor i32 %4, -1
  %high3 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 0
  store i32 %neg2, i32* %high3, align 4
  call void @cast(%struct.int_64_t* sret %agg.tmp, i32 signext 1)
  %5 = bitcast %struct.int_64_t* %x to { i32, i32 }*
  %6 = getelementptr { i32, i32 }, { i32, i32 }* %5, i32 0, i32 0
  %7 = load i32, i32* %6, align 1
  %8 = getelementptr { i32, i32 }, { i32, i32 }* %5, i32 0, i32 1
  %9 = load i32, i32* %8, align 1
  %10 = bitcast %struct.int_64_t* %agg.tmp to { i32, i32 }*
  %11 = getelementptr { i32, i32 }, { i32, i32 }* %10, i32 0, i32 0
  %12 = load i32, i32* %11, align 1
  %13 = getelementptr { i32, i32 }, { i32, i32 }* %10, i32 0, i32 1
  %14 = load i32, i32* %13, align 1
  call void @add(%struct.int_64_t* sret %agg.result, i32 inreg %7, i32 inreg %9, i32 inreg %12, i32 inreg %14)
  ret void
}

; Function Attrs: nounwind readnone
define i32 @abs(i32 signext %x) #2 {
entry:
  %retval = alloca i32, align 4
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32, i32* %x.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %x.addr, align 4
  %sub = sub nsw i32 0, %1
  store i32 %sub, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %x.addr, align 4
  store i32 %2, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %retval
  ret i32 %3
}

; Function Attrs: nounwind
define void @ucast(%struct.int_64_t* noalias sret %agg.result, i32 zeroext %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %llong = alloca %struct.int_64_t, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32, i32* %x.addr, align 4
  %low = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %llong, i32 0, i32 1
  store i32 %0, i32* %low, align 4
  %high = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %llong, i32 0, i32 0
  store i32 0, i32* %high, align 4
  %1 = bitcast %struct.int_64_t* %agg.result to i8*
  %2 = bitcast %struct.int_64_t* %llong to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %1, i8* %2, i32 8, i32 4, i1 false)
  ret void
}

; Function Attrs: nounwind
define void @sll(%struct.int_64_t* noalias sret %agg.result, i32 inreg %value.coerce0, i32 inreg %value.coerce1, i8 zeroext %pos) #0 {
entry:
  %value = alloca %struct.int_64_t, align 4
  %pos.addr = alloca i8, align 1
  %temp = alloca i32, align 4
  %0 = bitcast %struct.int_64_t* %value to { i32, i32 }*
  %1 = getelementptr { i32, i32 }, { i32, i32 }* %0, i32 0, i32 0
  store i32 %value.coerce0, i32* %1
  %2 = getelementptr { i32, i32 }, { i32, i32 }* %0, i32 0, i32 1
  store i32 %value.coerce1, i32* %2
  store i8 %pos, i8* %pos.addr, align 1
  store i32 0, i32* %temp, align 4
  %3 = load i8, i8* %pos.addr, align 1
  %conv = zext i8 %3 to i32
  %cmp = icmp slt i32 %conv, 32
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %4 = load i8, i8* %pos.addr, align 1
  %conv2 = zext i8 %4 to i32
  %high = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 0
  %5 = load i32, i32* %high, align 4
  %shl = shl i32 %5, %conv2
  store i32 %shl, i32* %high, align 4
  %low = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 1
  %6 = load i32, i32* %low, align 4
  %7 = load i8, i8* %pos.addr, align 1
  %conv3 = zext i8 %7 to i32
  %sub = sub nsw i32 32, %conv3
  %shr = lshr i32 %6, %sub
  store i32 %shr, i32* %temp, align 4
  %8 = load i32, i32* %temp, align 4
  %high4 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 0
  %9 = load i32, i32* %high4, align 4
  %or = or i32 %9, %8
  store i32 %or, i32* %high4, align 4
  %10 = load i8, i8* %pos.addr, align 1
  %conv5 = zext i8 %10 to i32
  %low6 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 1
  %11 = load i32, i32* %low6, align 4
  %shl7 = shl i32 %11, %conv5
  store i32 %shl7, i32* %low6, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %low8 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 1
  %12 = load i32, i32* %low8, align 4
  %13 = load i8, i8* %pos.addr, align 1
  %conv9 = zext i8 %13 to i32
  %sub10 = sub nsw i32 %conv9, 32
  %shl11 = shl i32 %12, %sub10
  %high12 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 0
  store i32 %shl11, i32* %high12, align 4
  %low13 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 1
  store i32 0, i32* %low13, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %14 = bitcast %struct.int_64_t* %agg.result to i8*
  %15 = bitcast %struct.int_64_t* %value to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %14, i8* %15, i32 8, i32 4, i1 false)
  ret void
}

; Function Attrs: nounwind
define void @sra(%struct.int_64_t* noalias sret %agg.result, i32 inreg %value.coerce0, i32 inreg %value.coerce1, i8 zeroext %pos) #0 {
entry:
  %value = alloca %struct.int_64_t, align 4
  %pos.addr = alloca i8, align 1
  %temp = alloca i32, align 4
  %0 = bitcast %struct.int_64_t* %value to { i32, i32 }*
  %1 = getelementptr { i32, i32 }, { i32, i32 }* %0, i32 0, i32 0
  store i32 %value.coerce0, i32* %1
  %2 = getelementptr { i32, i32 }, { i32, i32 }* %0, i32 0, i32 1
  store i32 %value.coerce1, i32* %2
  store i8 %pos, i8* %pos.addr, align 1
  store i32 0, i32* %temp, align 4
  %3 = load i8, i8* %pos.addr, align 1
  %conv = zext i8 %3 to i32
  %cmp = icmp slt i32 %conv, 32
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %4 = load i8, i8* %pos.addr, align 1
  %conv2 = zext i8 %4 to i32
  %low = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 1
  %5 = load i32, i32* %low, align 4
  %shr = lshr i32 %5, %conv2
  store i32 %shr, i32* %low, align 4
  %high = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 0
  %6 = load i32, i32* %high, align 4
  %7 = load i8, i8* %pos.addr, align 1
  %conv3 = zext i8 %7 to i32
  %sub = sub nsw i32 32, %conv3
  %shl = shl i32 %6, %sub
  store i32 %shl, i32* %temp, align 4
  %8 = load i32, i32* %temp, align 4
  %low4 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 1
  %9 = load i32, i32* %low4, align 4
  %or = or i32 %9, %8
  store i32 %or, i32* %low4, align 4
  %high5 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 0
  %10 = load i32, i32* %high5, align 4
  %11 = load i8, i8* %pos.addr, align 1
  %conv6 = zext i8 %11 to i32
  %shr7 = ashr i32 %10, %conv6
  %high8 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 0
  store i32 %shr7, i32* %high8, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %high9 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 0
  %12 = load i32, i32* %high9, align 4
  %13 = load i8, i8* %pos.addr, align 1
  %conv10 = zext i8 %13 to i32
  %sub11 = sub nsw i32 %conv10, 32
  %shr12 = ashr i32 %12, %sub11
  %low13 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 1
  store i32 %shr12, i32* %low13, align 4
  %high14 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 0
  store i32 -1, i32* %high14, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %14 = bitcast %struct.int_64_t* %agg.result to i8*
  %15 = bitcast %struct.int_64_t* %value to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %14, i8* %15, i32 8, i32 4, i1 false)
  ret void
}

; Function Attrs: nounwind
define void @umult(%struct.int_64_t* noalias sret %agg.result, i32 zeroext %a, i32 zeroext %b) #0 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %a_low = alloca i32, align 4
  %a_high = alloca i32, align 4
  %b_low = alloca i32, align 4
  %b_high = alloca i32, align 4
  %p_ll = alloca i32, align 4
  %p_lh = alloca i32, align 4
  %p_hl = alloca i32, align 4
  %p_hh = alloca i32, align 4
  %res = alloca %struct.int_64_t, align 4
  %tmp = alloca %struct.int_64_t, align 4
  %agg.tmp = alloca %struct.int_64_t, align 4
  %agg.tmp6 = alloca %struct.int_64_t, align 4
  %tmp7 = alloca %struct.int_64_t, align 4
  %agg.tmp8 = alloca %struct.int_64_t, align 4
  %agg.tmp9 = alloca %struct.int_64_t, align 4
  %tmp10 = alloca %struct.int_64_t, align 4
  %agg.tmp11 = alloca %struct.int_64_t, align 4
  %agg.tmp12 = alloca %struct.int_64_t, align 4
  %tmp13 = alloca %struct.int_64_t, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %and = and i32 %0, 65535
  store i32 %and, i32* %a_low, align 4
  %1 = load i32, i32* %a.addr, align 4
  %shr = lshr i32 %1, 16
  store i32 %shr, i32* %a_high, align 4
  %2 = load i32, i32* %b.addr, align 4
  %and1 = and i32 %2, 65535
  store i32 %and1, i32* %b_low, align 4
  %3 = load i32, i32* %b.addr, align 4
  %shr2 = lshr i32 %3, 16
  store i32 %shr2, i32* %b_high, align 4
  %4 = load i32, i32* %a_low, align 4
  %5 = load i32, i32* %b_low, align 4
  %mul = mul i32 %4, %5
  store i32 %mul, i32* %p_ll, align 4
  %6 = load i32, i32* %a_low, align 4
  %7 = load i32, i32* %b_high, align 4
  %mul3 = mul i32 %6, %7
  store i32 %mul3, i32* %p_lh, align 4
  %8 = load i32, i32* %a_high, align 4
  %9 = load i32, i32* %b_low, align 4
  %mul4 = mul i32 %8, %9
  store i32 %mul4, i32* %p_hl, align 4
  %10 = load i32, i32* %a_high, align 4
  %11 = load i32, i32* %b_high, align 4
  %mul5 = mul i32 %10, %11
  store i32 %mul5, i32* %p_hh, align 4
  %12 = load i32, i32* %p_ll, align 4
  call void @ucast(%struct.int_64_t* sret %tmp, i32 zeroext %12)
  %13 = bitcast %struct.int_64_t* %res to i8*
  %14 = bitcast %struct.int_64_t* %tmp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %13, i8* %14, i32 8, i32 4, i1 false)
  %15 = load i32, i32* %p_lh, align 4
  call void @ucast(%struct.int_64_t* sret %agg.tmp6, i32 zeroext %15)
  %16 = bitcast %struct.int_64_t* %agg.tmp6 to { i32, i32 }*
  %17 = getelementptr { i32, i32 }, { i32, i32 }* %16, i32 0, i32 0
  %18 = load i32, i32* %17, align 1
  %19 = getelementptr { i32, i32 }, { i32, i32 }* %16, i32 0, i32 1
  %20 = load i32, i32* %19, align 1
  call void @sll(%struct.int_64_t* sret %agg.tmp, i32 inreg %18, i32 inreg %20, i8 zeroext 16)
  %21 = bitcast %struct.int_64_t* %res to { i32, i32 }*
  %22 = getelementptr { i32, i32 }, { i32, i32 }* %21, i32 0, i32 0
  %23 = load i32, i32* %22, align 1
  %24 = getelementptr { i32, i32 }, { i32, i32 }* %21, i32 0, i32 1
  %25 = load i32, i32* %24, align 1
  %26 = bitcast %struct.int_64_t* %agg.tmp to { i32, i32 }*
  %27 = getelementptr { i32, i32 }, { i32, i32 }* %26, i32 0, i32 0
  %28 = load i32, i32* %27, align 1
  %29 = getelementptr { i32, i32 }, { i32, i32 }* %26, i32 0, i32 1
  %30 = load i32, i32* %29, align 1
  call void @add(%struct.int_64_t* sret %tmp7, i32 inreg %23, i32 inreg %25, i32 inreg %28, i32 inreg %30)
  %31 = bitcast %struct.int_64_t* %res to i8*
  %32 = bitcast %struct.int_64_t* %tmp7 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %31, i8* %32, i32 8, i32 4, i1 false)
  %33 = load i32, i32* %p_hl, align 4
  call void @ucast(%struct.int_64_t* sret %agg.tmp9, i32 zeroext %33)
  %34 = bitcast %struct.int_64_t* %agg.tmp9 to { i32, i32 }*
  %35 = getelementptr { i32, i32 }, { i32, i32 }* %34, i32 0, i32 0
  %36 = load i32, i32* %35, align 1
  %37 = getelementptr { i32, i32 }, { i32, i32 }* %34, i32 0, i32 1
  %38 = load i32, i32* %37, align 1
  call void @sll(%struct.int_64_t* sret %agg.tmp8, i32 inreg %36, i32 inreg %38, i8 zeroext 16)
  %39 = bitcast %struct.int_64_t* %res to { i32, i32 }*
  %40 = getelementptr { i32, i32 }, { i32, i32 }* %39, i32 0, i32 0
  %41 = load i32, i32* %40, align 1
  %42 = getelementptr { i32, i32 }, { i32, i32 }* %39, i32 0, i32 1
  %43 = load i32, i32* %42, align 1
  %44 = bitcast %struct.int_64_t* %agg.tmp8 to { i32, i32 }*
  %45 = getelementptr { i32, i32 }, { i32, i32 }* %44, i32 0, i32 0
  %46 = load i32, i32* %45, align 1
  %47 = getelementptr { i32, i32 }, { i32, i32 }* %44, i32 0, i32 1
  %48 = load i32, i32* %47, align 1
  call void @add(%struct.int_64_t* sret %tmp10, i32 inreg %41, i32 inreg %43, i32 inreg %46, i32 inreg %48)
  %49 = bitcast %struct.int_64_t* %res to i8*
  %50 = bitcast %struct.int_64_t* %tmp10 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %49, i8* %50, i32 8, i32 4, i1 false)
  %51 = load i32, i32* %p_hh, align 4
  call void @ucast(%struct.int_64_t* sret %agg.tmp12, i32 zeroext %51)
  %52 = bitcast %struct.int_64_t* %agg.tmp12 to { i32, i32 }*
  %53 = getelementptr { i32, i32 }, { i32, i32 }* %52, i32 0, i32 0
  %54 = load i32, i32* %53, align 1
  %55 = getelementptr { i32, i32 }, { i32, i32 }* %52, i32 0, i32 1
  %56 = load i32, i32* %55, align 1
  call void @sll(%struct.int_64_t* sret %agg.tmp11, i32 inreg %54, i32 inreg %56, i8 zeroext 32)
  %57 = bitcast %struct.int_64_t* %res to { i32, i32 }*
  %58 = getelementptr { i32, i32 }, { i32, i32 }* %57, i32 0, i32 0
  %59 = load i32, i32* %58, align 1
  %60 = getelementptr { i32, i32 }, { i32, i32 }* %57, i32 0, i32 1
  %61 = load i32, i32* %60, align 1
  %62 = bitcast %struct.int_64_t* %agg.tmp11 to { i32, i32 }*
  %63 = getelementptr { i32, i32 }, { i32, i32 }* %62, i32 0, i32 0
  %64 = load i32, i32* %63, align 1
  %65 = getelementptr { i32, i32 }, { i32, i32 }* %62, i32 0, i32 1
  %66 = load i32, i32* %65, align 1
  call void @add(%struct.int_64_t* sret %tmp13, i32 inreg %59, i32 inreg %61, i32 inreg %64, i32 inreg %66)
  %67 = bitcast %struct.int_64_t* %res to i8*
  %68 = bitcast %struct.int_64_t* %tmp13 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %67, i8* %68, i32 8, i32 4, i1 false)
  %69 = bitcast %struct.int_64_t* %agg.result to i8*
  %70 = bitcast %struct.int_64_t* %res to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %69, i8* %70, i32 8, i32 4, i1 false)
  ret void
}

; Function Attrs: nounwind
define void @mult(%struct.int_64_t* noalias sret %agg.result, i32 signext %v1, i32 signext %v2) #0 {
entry:
  %v1.addr = alloca i32, align 4
  %v2.addr = alloca i32, align 4
  %product = alloca %struct.int_64_t, align 4
  %multiplicand = alloca i32, align 4
  %multiplier = alloca i32, align 4
  %s = alloca i32, align 4
  %tmp = alloca %struct.int_64_t, align 4
  %tmp4 = alloca %struct.int_64_t, align 4
  store i32 %v1, i32* %v1.addr, align 4
  store i32 %v2, i32* %v2.addr, align 4
  store i32 0, i32* %s, align 4
  %0 = load i32, i32* %v1.addr, align 4
  %cmp = icmp slt i32 %0, 0
  %conv = zext i1 %cmp to i32
  %1 = load i32, i32* %v2.addr, align 4
  %cmp1 = icmp slt i32 %1, 0
  %conv2 = zext i1 %cmp1 to i32
  %xor = xor i32 %conv, %conv2
  store i32 %xor, i32* %s, align 4
  %2 = load i32, i32* %v1.addr, align 4
  %call = call i32 @abs(i32 signext %2) #3
  store i32 %call, i32* %multiplicand, align 4
  %3 = load i32, i32* %v2.addr, align 4
  %call3 = call i32 @abs(i32 signext %3) #3
  store i32 %call3, i32* %multiplier, align 4
  %4 = load i32, i32* %multiplicand, align 4
  %5 = load i32, i32* %multiplier, align 4
  call void @umult(%struct.int_64_t* sret %tmp, i32 zeroext %4, i32 zeroext %5)
  %6 = bitcast %struct.int_64_t* %product to i8*
  %7 = bitcast %struct.int_64_t* %tmp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %6, i8* %7, i32 8, i32 4, i1 false)
  %8 = load i32, i32* %s, align 4
  %tobool = icmp ne i32 %8, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %9 = bitcast %struct.int_64_t* %product to { i32, i32 }*
  %10 = getelementptr { i32, i32 }, { i32, i32 }* %9, i32 0, i32 0
  %11 = load i32, i32* %10, align 1
  %12 = getelementptr { i32, i32 }, { i32, i32 }* %9, i32 0, i32 1
  %13 = load i32, i32* %12, align 1
  call void @neg(%struct.int_64_t* sret %tmp4, i32 inreg %11, i32 inreg %13)
  %14 = bitcast %struct.int_64_t* %product to i8*
  %15 = bitcast %struct.int_64_t* %tmp4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %14, i8* %15, i32 8, i32 4, i1 false)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %16 = bitcast %struct.int_64_t* %agg.result to i8*
  %17 = bitcast %struct.int_64_t* %product to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %16, i8* %17, i32 8, i32 4, i1 false)
  ret void
}

; Function Attrs: nounwind
define void @sum_rot_block_row([24 x i32]* %powers) #0 {
entry:
  %powers.addr = alloca [24 x i32]*, align 4
  %i = alloca i32, align 4
  %w = alloca i32, align 4
  %fp_cospart = alloca i32, align 4
  %fp_sinpart = alloca i32, align 4
  %agg.tmp = alloca %struct.int_64_t, align 4
  %agg.tmp4 = alloca %struct.int_64_t, align 4
  %agg.tmp7 = alloca %struct.int_64_t, align 4
  %agg.tmp8 = alloca %struct.int_64_t, align 4
  %agg.tmp16 = alloca %struct.int_64_t, align 4
  %agg.tmp17 = alloca %struct.int_64_t, align 4
  %agg.tmp20 = alloca %struct.int_64_t, align 4
  %agg.tmp21 = alloca %struct.int_64_t, align 4
  store [24 x i32]* %powers, [24 x i32]** %powers.addr, align 4
  store i32 0, i32* %w, align 4
  store i32 0, i32* %w, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc28, %entry
  %0 = load i32, i32* %w, align 4
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %for.body, label %for.end30

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %fp_cospart, align 4
  store i32 0, i32* %fp_sinpart, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %i, align 4
  %cmp2 = icmp slt i32 %1, 24
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [24 x i32], [24 x i32]* @rowsums, i32 0, i32 %2
  %3 = load i32, i32* %arrayidx, align 4
  %shl = shl i32 %3, 17
  %4 = load i32, i32* %i, align 4
  %5 = load i32, i32* %w, align 4
  %mul = mul nsw i32 %5, 24
  %add = add nsw i32 %4, %mul
  %arrayidx5 = getelementptr inbounds [96 x i32], [96 x i32]* @dft_waves_cos, i32 0, i32 %add
  %6 = load i32, i32* %arrayidx5, align 4
  call void @mult(%struct.int_64_t* sret %agg.tmp4, i32 signext %shl, i32 signext %6)
  %7 = bitcast %struct.int_64_t* %agg.tmp4 to { i32, i32 }*
  %8 = getelementptr { i32, i32 }, { i32, i32 }* %7, i32 0, i32 0
  %9 = load i32, i32* %8, align 1
  %10 = getelementptr { i32, i32 }, { i32, i32 }* %7, i32 0, i32 1
  %11 = load i32, i32* %10, align 1
  call void @sra(%struct.int_64_t* sret %agg.tmp, i32 inreg %9, i32 inreg %11, i8 zeroext 17)
  %12 = bitcast %struct.int_64_t* %agg.tmp to { i32, i32 }*
  %13 = getelementptr { i32, i32 }, { i32, i32 }* %12, i32 0, i32 0
  %14 = load i32, i32* %13, align 1
  %15 = getelementptr { i32, i32 }, { i32, i32 }* %12, i32 0, i32 1
  %16 = load i32, i32* %15, align 1
  %call = call i32 @cast_int32(i32 inreg %14, i32 inreg %16)
  %17 = load i32, i32* %fp_cospart, align 4
  %add6 = add nsw i32 %17, %call
  store i32 %add6, i32* %fp_cospart, align 4
  %18 = load i32, i32* %i, align 4
  %arrayidx9 = getelementptr inbounds [24 x i32], [24 x i32]* @rowsums, i32 0, i32 %18
  %19 = load i32, i32* %arrayidx9, align 4
  %shl10 = shl i32 %19, 17
  %20 = load i32, i32* %i, align 4
  %21 = load i32, i32* %w, align 4
  %mul11 = mul nsw i32 %21, 24
  %add12 = add nsw i32 %20, %mul11
  %arrayidx13 = getelementptr inbounds [96 x i32], [96 x i32]* @dft_waves_sin, i32 0, i32 %add12
  %22 = load i32, i32* %arrayidx13, align 4
  call void @mult(%struct.int_64_t* sret %agg.tmp8, i32 signext %shl10, i32 signext %22)
  %23 = bitcast %struct.int_64_t* %agg.tmp8 to { i32, i32 }*
  %24 = getelementptr { i32, i32 }, { i32, i32 }* %23, i32 0, i32 0
  %25 = load i32, i32* %24, align 1
  %26 = getelementptr { i32, i32 }, { i32, i32 }* %23, i32 0, i32 1
  %27 = load i32, i32* %26, align 1
  call void @sra(%struct.int_64_t* sret %agg.tmp7, i32 inreg %25, i32 inreg %27, i8 zeroext 17)
  %28 = bitcast %struct.int_64_t* %agg.tmp7 to { i32, i32 }*
  %29 = getelementptr { i32, i32 }, { i32, i32 }* %28, i32 0, i32 0
  %30 = load i32, i32* %29, align 1
  %31 = getelementptr { i32, i32 }, { i32, i32 }* %28, i32 0, i32 1
  %32 = load i32, i32* %31, align 1
  %call14 = call i32 @cast_int32(i32 inreg %30, i32 inreg %32)
  %33 = load i32, i32* %fp_sinpart, align 4
  %add15 = add nsw i32 %33, %call14
  store i32 %add15, i32* %fp_sinpart, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %34 = load i32, i32* %i, align 4
  %inc = add nsw i32 %34, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  %35 = load i32, i32* %fp_cospart, align 4
  %shr = ashr i32 %35, 12
  %36 = load i32, i32* %fp_cospart, align 4
  %shr18 = ashr i32 %36, 12
  call void @mult(%struct.int_64_t* sret %agg.tmp17, i32 signext %shr, i32 signext %shr18)
  %37 = bitcast %struct.int_64_t* %agg.tmp17 to { i32, i32 }*
  %38 = getelementptr { i32, i32 }, { i32, i32 }* %37, i32 0, i32 0
  %39 = load i32, i32* %38, align 1
  %40 = getelementptr { i32, i32 }, { i32, i32 }* %37, i32 0, i32 1
  %41 = load i32, i32* %40, align 1
  call void @sra(%struct.int_64_t* sret %agg.tmp16, i32 inreg %39, i32 inreg %41, i8 zeroext 5)
  %42 = bitcast %struct.int_64_t* %agg.tmp16 to { i32, i32 }*
  %43 = getelementptr { i32, i32 }, { i32, i32 }* %42, i32 0, i32 0
  %44 = load i32, i32* %43, align 1
  %45 = getelementptr { i32, i32 }, { i32, i32 }* %42, i32 0, i32 1
  %46 = load i32, i32* %45, align 1
  %call19 = call i32 @cast_int32(i32 inreg %44, i32 inreg %46)
  %47 = load i32, i32* %fp_sinpart, align 4
  %shr22 = ashr i32 %47, 12
  %48 = load i32, i32* %fp_sinpart, align 4
  %shr23 = ashr i32 %48, 12
  call void @mult(%struct.int_64_t* sret %agg.tmp21, i32 signext %shr22, i32 signext %shr23)
  %49 = bitcast %struct.int_64_t* %agg.tmp21 to { i32, i32 }*
  %50 = getelementptr { i32, i32 }, { i32, i32 }* %49, i32 0, i32 0
  %51 = load i32, i32* %50, align 1
  %52 = getelementptr { i32, i32 }, { i32, i32 }* %49, i32 0, i32 1
  %53 = load i32, i32* %52, align 1
  call void @sra(%struct.int_64_t* sret %agg.tmp20, i32 inreg %51, i32 inreg %53, i8 zeroext 5)
  %54 = bitcast %struct.int_64_t* %agg.tmp20 to { i32, i32 }*
  %55 = getelementptr { i32, i32 }, { i32, i32 }* %54, i32 0, i32 0
  %56 = load i32, i32* %55, align 1
  %57 = getelementptr { i32, i32 }, { i32, i32 }* %54, i32 0, i32 1
  %58 = load i32, i32* %57, align 1
  %call24 = call i32 @cast_int32(i32 inreg %56, i32 inreg %58)
  %add25 = add nsw i32 %call19, %call24
  %59 = load i32, i32* %w, align 4
  %60 = load [24 x i32]*, [24 x i32]** %powers.addr, align 4
  %arrayidx26 = getelementptr inbounds [24 x i32], [24 x i32]* %60, i32 %59
  %arrayidx27 = getelementptr inbounds [24 x i32], [24 x i32]* %arrayidx26, i32 0, i32 0
  store i32 %add25, i32* %arrayidx27, align 4
  br label %for.inc28

for.inc28:                                        ; preds = %for.end
  %61 = load i32, i32* %w, align 4
  %inc29 = add nsw i32 %61, 1
  store i32 %inc29, i32* %w, align 4
  br label %for.cond

for.end30:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 200
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  call void @sum_rot_block_row([24 x i32]* getelementptr inbounds ([4 x [24 x i32]], [4 x [24 x i32]]* @powers, i32 0, i32 0))
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 -1
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
