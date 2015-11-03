; ModuleID = 'dft.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

%struct.int_64_t = type { i32, i32 }

@rowsums = global [24 x i32] [i32 759, i32 776, i32 787, i32 795, i32 797, i32 796, i32 801, i32 805, i32 800, i32 800, i32 799, i32 801, i32 799, i32 790, i32 781, i32 775, i32 772, i32 769, i32 768, i32 767, i32 762, i32 761, i32 755, i32 751], align 4
@dft_waves_cos = global [96 x i32] [i32 131072, i32 126606, i32 113512, i32 92683, i32 65537, i32 33926, i32 3, i32 -33921, i32 -65532, i32 -92679, i32 -113509, i32 -126605, i32 -131072, i32 -126608, i32 -113516, i32 -92689, i32 -65544, i32 -33934, i32 -11, i32 33913, i32 65526, i32 92673, i32 113505, i32 126602, i32 131072, i32 113512, i32 65537, i32 3, i32 -65532, i32 -113509, i32 -131072, i32 -113516, i32 -65544, i32 -11, i32 65526, i32 113505, i32 131072, i32 113518, i32 65549, i32 16, i32 -65521, i32 -113503, i32 -131072, i32 -113523, i32 -65556, i32 -24, i32 65514, i32 113499, i32 131072, i32 92683, i32 3, i32 -92679, i32 -131072, i32 -92689, i32 -11, i32 92673, i32 131072, i32 92692, i32 16, i32 -92669, i32 -131072, i32 -92698, i32 -24, i32 92664, i32 131071, i32 92701, i32 29, i32 -92660, i32 -131072, i32 -92707, i32 -37, i32 92654, i32 131072, i32 65537, i32 -65532, i32 -131072, i32 -65544, i32 65526, i32 131072, i32 65549, i32 -65521, i32 -131072, i32 -65556, i32 65514, i32 131071, i32 65560, i32 -65510, i32 -131072, i32 -65567, i32 65503, i32 131071, i32 65571, i32 -65499, i32 -131072, i32 -65578, i32 65492], align 4
@dft_waves_sin = global [96 x i32] [i32 0, i32 33923, i32 65535, i32 92680, i32 113510, i32 126605, i32 131071, i32 126606, i32 113514, i32 92685, i32 65540, i32 33929, i32 6, i32 -33917, i32 -65530, i32 -92676, i32 -113508, i32 -126604, i32 -131072, i32 -126609, i32 -113518, i32 -92691, i32 -65547, i32 -33937, i32 0, i32 65535, i32 113510, i32 131071, i32 113514, i32 65540, i32 6, i32 -65530, i32 -113508, i32 -131072, i32 -113518, i32 -65547, i32 -14, i32 65523, i32 113504, i32 131071, i32 113520, i32 65552, i32 19, i32 -65518, i32 -113501, i32 -131072, i32 -113524, i32 -65558, i32 0, i32 92680, i32 131071, i32 92685, i32 6, i32 -92676, i32 -131072, i32 -92691, i32 -14, i32 92671, i32 131071, i32 92694, i32 19, i32 -92667, i32 -131072, i32 -92700, i32 -27, i32 92662, i32 131071, i32 92704, i32 32, i32 -92658, i32 -131072, i32 -92709, i32 0, i32 113510, i32 113514, i32 6, i32 -113508, i32 -113518, i32 -14, i32 113504, i32 113520, i32 19, i32 -113501, i32 -113524, i32 -27, i32 113497, i32 113527, i32 32, i32 -113495, i32 -113531, i32 -40, i32 113491, i32 113533, i32 45, i32 -113488, i32 -113537], align 4
@powers_temp = global [4 x [24 x i32]] [[24 x i32] [i32 2436991, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], [24 x i32] [i32 63546, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], [24 x i32] [i32 131381, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], [24 x i32] [i32 19272, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0]], align 4

; Function Attrs: nounwind
define i32 @cast_uint32(i32 %x.0, i32 %x.1) #0 {
entry:
  %x = alloca %struct.int_64_t, align 4
  %res = alloca i32, align 4
  %high = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 0
  store i32 %x.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 1
  store i32 %x.1, i32* %low, align 4
  %low1 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 1
  %0 = load i32, i32* %low1, align 4
  store i32 %0, i32* %res, align 4
  %high2 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 0
  %1 = load i32, i32* %high2, align 4
  %cmp = icmp ne i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %2 = load i32, i32* %res, align 4
  ret i32 %2
}

; Function Attrs: nounwind
define i32 @cast_int32(i32 %x.0, i32 %x.1) #0 {
entry:
  %x = alloca %struct.int_64_t, align 4
  %result = alloca i32, align 4
  %high = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 0
  store i32 %x.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 1
  store i32 %x.1, i32* %low, align 4
  store i32 0, i32* %result, align 4
  %high1 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 0
  %0 = load i32, i32* %high1, align 4
  %and = and i32 %0, -2147483648
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.else5

if.then:                                          ; preds = %entry
  %high2 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 0
  %1 = load i32, i32* %high2, align 4
  %cmp = icmp eq i32 %1, -1
  br i1 %cmp, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.then
  %low4 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 1
  %2 = load i32, i32* %low4, align 4
  store i32 %2, i32* %result, align 4
  br label %if.end

if.else:                                          ; preds = %if.then
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then3
  br label %if.end12

if.else5:                                         ; preds = %entry
  %high6 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 0
  %3 = load i32, i32* %high6, align 4
  %cmp7 = icmp eq i32 %3, 0
  br i1 %cmp7, label %if.then8, label %if.else10

if.then8:                                         ; preds = %if.else5
  %low9 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 1
  %4 = load i32, i32* %low9, align 4
  store i32 %4, i32* %result, align 4
  br label %if.end11

if.else10:                                        ; preds = %if.else5
  br label %if.end11

if.end11:                                         ; preds = %if.else10, %if.then8
  br label %if.end12

if.end12:                                         ; preds = %if.end11, %if.end
  %5 = load i32, i32* %result, align 4
  ret i32 %5
}

; Function Attrs: nounwind
define void @cast(%struct.int_64_t* noalias sret %agg.result, i32 %x) #0 {
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
define void @add(%struct.int_64_t* noalias sret %agg.result, i32 %x.0, i32 %x.1, i32 %y.0, i32 %y.1) #0 {
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
  %high = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 0
  store i32 %x.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 1
  store i32 %x.1, i32* %low, align 4
  %high2 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %y, i32 0, i32 0
  store i32 %y.0, i32* %high2, align 4
  %low3 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %y, i32 0, i32 1
  store i32 %y.1, i32* %low3, align 4
  %low4 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 1
  %0 = load i32, i32* %low4, align 4
  store i32 %0, i32* %x1, align 4
  %high5 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 0
  %1 = load i32, i32* %high5, align 4
  store i32 %1, i32* %x2, align 4
  %low6 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %y, i32 0, i32 1
  %2 = load i32, i32* %low6, align 4
  store i32 %2, i32* %y1, align 4
  %high7 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %y, i32 0, i32 0
  %3 = load i32, i32* %high7, align 4
  store i32 %3, i32* %y2, align 4
  store i32 0, i32* %z2, align 4
  store i32 0, i32* %z1, align 4
  %4 = load i32, i32* %x1, align 4
  %5 = load i32, i32* %y1, align 4
  %add = add i32 %4, %5
  store i32 %add, i32* %z1, align 4
  %6 = load i32, i32* %z1, align 4
  %7 = load i32, i32* %x1, align 4
  %cmp = icmp ult i32 %6, %7
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %8 = load i32, i32* %z1, align 4
  %9 = load i32, i32* %y1, align 4
  %cmp8 = icmp ult i32 %8, %9
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %10 = load i32, i32* %z2, align 4
  %inc = add i32 %10, 1
  store i32 %inc, i32* %z2, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false
  %11 = load i32, i32* %x2, align 4
  %12 = load i32, i32* %y2, align 4
  %add9 = add i32 %11, %12
  %13 = load i32, i32* %z2, align 4
  %add10 = add i32 %13, %add9
  store i32 %add10, i32* %z2, align 4
  %14 = load i32, i32* %z1, align 4
  %low11 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %sum, i32 0, i32 1
  store i32 %14, i32* %low11, align 4
  %15 = load i32, i32* %z2, align 4
  %high12 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %sum, i32 0, i32 0
  store i32 %15, i32* %high12, align 4
  %16 = bitcast %struct.int_64_t* %agg.result to i8*
  %17 = bitcast %struct.int_64_t* %sum to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %16, i8* %17, i32 8, i32 4, i1 false)
  ret void
}

; Function Attrs: nounwind
define void @neg(%struct.int_64_t* noalias sret %agg.result, i32 %x.0, i32 %x.1) #0 {
entry:
  %x = alloca %struct.int_64_t, align 4
  %agg.tmp = alloca %struct.int_64_t, align 4
  %high = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 0
  store i32 %x.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 1
  store i32 %x.1, i32* %low, align 4
  %low1 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 1
  %0 = load i32, i32* %low1, align 4
  %neg = xor i32 %0, -1
  %low2 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 1
  store i32 %neg, i32* %low2, align 4
  %high3 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 0
  %1 = load i32, i32* %high3, align 4
  %neg4 = xor i32 %1, -1
  %high5 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 0
  store i32 %neg4, i32* %high5, align 4
  call void @cast(%struct.int_64_t* sret %agg.tmp, i32 1)
  %high6 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 0
  %2 = load i32, i32* %high6, align 4
  %low7 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %x, i32 0, i32 1
  %3 = load i32, i32* %low7, align 4
  %high8 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp, i32 0, i32 0
  %4 = load i32, i32* %high8, align 4
  %low9 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp, i32 0, i32 1
  %5 = load i32, i32* %low9, align 4
  call void @add(%struct.int_64_t* sret %agg.result, i32 %2, i32 %3, i32 %4, i32 %5)
  ret void
}

; Function Attrs: nounwind readnone
define i32 @abs(i32 %x) #2 {
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
define void @ucast(%struct.int_64_t* noalias sret %agg.result, i32 %x) #0 {
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
define void @sll(%struct.int_64_t* noalias sret %agg.result, i32 %value.0, i32 %value.1, i8 zeroext %pos) #0 {
entry:
  %value = alloca %struct.int_64_t, align 4
  %pos.addr = alloca i8, align 1
  %temp = alloca i32, align 4
  %high = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 0
  store i32 %value.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 1
  store i32 %value.1, i32* %low, align 4
  store i8 %pos, i8* %pos.addr, align 1
  store i32 0, i32* %temp, align 4
  %0 = load i8, i8* %pos.addr, align 1
  %conv = zext i8 %0 to i32
  %cmp = icmp slt i32 %conv, 32
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i8, i8* %pos.addr, align 1
  %conv2 = zext i8 %1 to i32
  %high3 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 0
  %2 = load i32, i32* %high3, align 4
  %shl = shl i32 %2, %conv2
  store i32 %shl, i32* %high3, align 4
  %low4 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 1
  %3 = load i32, i32* %low4, align 4
  %4 = load i8, i8* %pos.addr, align 1
  %conv5 = zext i8 %4 to i32
  %sub = sub nsw i32 32, %conv5
  %shr = lshr i32 %3, %sub
  store i32 %shr, i32* %temp, align 4
  %5 = load i32, i32* %temp, align 4
  %high6 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 0
  %6 = load i32, i32* %high6, align 4
  %or = or i32 %6, %5
  store i32 %or, i32* %high6, align 4
  %7 = load i8, i8* %pos.addr, align 1
  %conv7 = zext i8 %7 to i32
  %low8 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 1
  %8 = load i32, i32* %low8, align 4
  %shl9 = shl i32 %8, %conv7
  store i32 %shl9, i32* %low8, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %low10 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 1
  %9 = load i32, i32* %low10, align 4
  %10 = load i8, i8* %pos.addr, align 1
  %conv11 = zext i8 %10 to i32
  %sub12 = sub nsw i32 %conv11, 32
  %shl13 = shl i32 %9, %sub12
  %high14 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 0
  store i32 %shl13, i32* %high14, align 4
  %low15 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 1
  store i32 0, i32* %low15, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %11 = bitcast %struct.int_64_t* %agg.result to i8*
  %12 = bitcast %struct.int_64_t* %value to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %11, i8* %12, i32 8, i32 4, i1 false)
  ret void
}

; Function Attrs: nounwind
define void @sra(%struct.int_64_t* noalias sret %agg.result, i32 %value.0, i32 %value.1, i8 zeroext %pos) #0 {
entry:
  %value = alloca %struct.int_64_t, align 4
  %pos.addr = alloca i8, align 1
  %temp = alloca i32, align 4
  %high = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 0
  store i32 %value.0, i32* %high, align 4
  %low = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 1
  store i32 %value.1, i32* %low, align 4
  store i8 %pos, i8* %pos.addr, align 1
  store i32 0, i32* %temp, align 4
  %0 = load i8, i8* %pos.addr, align 1
  %conv = zext i8 %0 to i32
  %cmp = icmp slt i32 %conv, 32
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i8, i8* %pos.addr, align 1
  %conv2 = zext i8 %1 to i32
  %low3 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 1
  %2 = load i32, i32* %low3, align 4
  %shr = lshr i32 %2, %conv2
  store i32 %shr, i32* %low3, align 4
  %high4 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 0
  %3 = load i32, i32* %high4, align 4
  %4 = load i8, i8* %pos.addr, align 1
  %conv5 = zext i8 %4 to i32
  %sub = sub nsw i32 32, %conv5
  %shl = shl i32 %3, %sub
  store i32 %shl, i32* %temp, align 4
  %5 = load i32, i32* %temp, align 4
  %low6 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 1
  %6 = load i32, i32* %low6, align 4
  %or = or i32 %6, %5
  store i32 %or, i32* %low6, align 4
  %high7 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 0
  %7 = load i32, i32* %high7, align 4
  %8 = load i8, i8* %pos.addr, align 1
  %conv8 = zext i8 %8 to i32
  %shr9 = ashr i32 %7, %conv8
  %high10 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 0
  store i32 %shr9, i32* %high10, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %high11 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 0
  %9 = load i32, i32* %high11, align 4
  %10 = load i8, i8* %pos.addr, align 1
  %conv12 = zext i8 %10 to i32
  %sub13 = sub nsw i32 %conv12, 32
  %shr14 = ashr i32 %9, %sub13
  %low15 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 1
  store i32 %shr14, i32* %low15, align 4
  %high16 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %value, i32 0, i32 0
  store i32 -1, i32* %high16, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %11 = bitcast %struct.int_64_t* %agg.result to i8*
  %12 = bitcast %struct.int_64_t* %value to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %11, i8* %12, i32 8, i32 4, i1 false)
  ret void
}

; Function Attrs: nounwind
define void @umult(%struct.int_64_t* noalias sret %agg.result, i32 %a, i32 %b) #0 {
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
  %agg.tmp = alloca %struct.int_64_t, align 4
  %agg.tmp6 = alloca %struct.int_64_t, align 4
  %tmp = alloca %struct.int_64_t, align 4
  %agg.tmp11 = alloca %struct.int_64_t, align 4
  %agg.tmp12 = alloca %struct.int_64_t, align 4
  %tmp15 = alloca %struct.int_64_t, align 4
  %agg.tmp20 = alloca %struct.int_64_t, align 4
  %agg.tmp21 = alloca %struct.int_64_t, align 4
  %tmp24 = alloca %struct.int_64_t, align 4
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
  call void @ucast(%struct.int_64_t* sret %res, i32 %12)
  %13 = load i32, i32* %p_lh, align 4
  call void @ucast(%struct.int_64_t* sret %agg.tmp6, i32 %13)
  %high = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp6, i32 0, i32 0
  %14 = load i32, i32* %high, align 4
  %low = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp6, i32 0, i32 1
  %15 = load i32, i32* %low, align 4
  call void @sll(%struct.int_64_t* sret %agg.tmp, i32 %14, i32 %15, i8 zeroext 16)
  %high7 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %res, i32 0, i32 0
  %16 = load i32, i32* %high7, align 4
  %low8 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %res, i32 0, i32 1
  %17 = load i32, i32* %low8, align 4
  %high9 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp, i32 0, i32 0
  %18 = load i32, i32* %high9, align 4
  %low10 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp, i32 0, i32 1
  %19 = load i32, i32* %low10, align 4
  call void @add(%struct.int_64_t* sret %tmp, i32 %16, i32 %17, i32 %18, i32 %19)
  %20 = bitcast %struct.int_64_t* %res to i8*
  %21 = bitcast %struct.int_64_t* %tmp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %20, i8* %21, i32 8, i32 4, i1 false)
  %22 = load i32, i32* %p_hl, align 4
  call void @ucast(%struct.int_64_t* sret %agg.tmp12, i32 %22)
  %high13 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp12, i32 0, i32 0
  %23 = load i32, i32* %high13, align 4
  %low14 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp12, i32 0, i32 1
  %24 = load i32, i32* %low14, align 4
  call void @sll(%struct.int_64_t* sret %agg.tmp11, i32 %23, i32 %24, i8 zeroext 16)
  %high16 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %res, i32 0, i32 0
  %25 = load i32, i32* %high16, align 4
  %low17 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %res, i32 0, i32 1
  %26 = load i32, i32* %low17, align 4
  %high18 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp11, i32 0, i32 0
  %27 = load i32, i32* %high18, align 4
  %low19 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp11, i32 0, i32 1
  %28 = load i32, i32* %low19, align 4
  call void @add(%struct.int_64_t* sret %tmp15, i32 %25, i32 %26, i32 %27, i32 %28)
  %29 = bitcast %struct.int_64_t* %res to i8*
  %30 = bitcast %struct.int_64_t* %tmp15 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %29, i8* %30, i32 8, i32 4, i1 false)
  %31 = load i32, i32* %p_hh, align 4
  call void @ucast(%struct.int_64_t* sret %agg.tmp21, i32 %31)
  %high22 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp21, i32 0, i32 0
  %32 = load i32, i32* %high22, align 4
  %low23 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp21, i32 0, i32 1
  %33 = load i32, i32* %low23, align 4
  call void @sll(%struct.int_64_t* sret %agg.tmp20, i32 %32, i32 %33, i8 zeroext 32)
  %high25 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %res, i32 0, i32 0
  %34 = load i32, i32* %high25, align 4
  %low26 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %res, i32 0, i32 1
  %35 = load i32, i32* %low26, align 4
  %high27 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp20, i32 0, i32 0
  %36 = load i32, i32* %high27, align 4
  %low28 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp20, i32 0, i32 1
  %37 = load i32, i32* %low28, align 4
  call void @add(%struct.int_64_t* sret %tmp24, i32 %34, i32 %35, i32 %36, i32 %37)
  %38 = bitcast %struct.int_64_t* %res to i8*
  %39 = bitcast %struct.int_64_t* %tmp24 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %38, i8* %39, i32 8, i32 4, i1 false)
  %40 = bitcast %struct.int_64_t* %agg.result to i8*
  %41 = bitcast %struct.int_64_t* %res to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %40, i8* %41, i32 8, i32 4, i1 false)
  ret void
}

; Function Attrs: nounwind
define void @mult(%struct.int_64_t* noalias sret %agg.result, i32 %v1, i32 %v2) #0 {
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
  %call = call i32 @abs(i32 %2) #3
  store i32 %call, i32* %multiplicand, align 4
  %3 = load i32, i32* %v2.addr, align 4
  %call3 = call i32 @abs(i32 %3) #3
  store i32 %call3, i32* %multiplier, align 4
  %4 = load i32, i32* %multiplicand, align 4
  %5 = load i32, i32* %multiplier, align 4
  call void @umult(%struct.int_64_t* sret %tmp, i32 %4, i32 %5)
  %6 = bitcast %struct.int_64_t* %product to i8*
  %7 = bitcast %struct.int_64_t* %tmp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %6, i8* %7, i32 8, i32 4, i1 false)
  %8 = load i32, i32* %s, align 4
  %tobool = icmp ne i32 %8, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %high = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %product, i32 0, i32 0
  %9 = load i32, i32* %high, align 4
  %low = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %product, i32 0, i32 1
  %10 = load i32, i32* %low, align 4
  call void @neg(%struct.int_64_t* sret %tmp4, i32 %9, i32 %10)
  %11 = bitcast %struct.int_64_t* %product to i8*
  %12 = bitcast %struct.int_64_t* %tmp4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %11, i8* %12, i32 8, i32 4, i1 false)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %13 = bitcast %struct.int_64_t* %agg.result to i8*
  %14 = bitcast %struct.int_64_t* %product to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %13, i8* %14, i32 8, i32 4, i1 false)
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
  %agg.tmp9 = alloca %struct.int_64_t, align 4
  %agg.tmp10 = alloca %struct.int_64_t, align 4
  %agg.tmp22 = alloca %struct.int_64_t, align 4
  %agg.tmp23 = alloca %struct.int_64_t, align 4
  %agg.tmp30 = alloca %struct.int_64_t, align 4
  %agg.tmp31 = alloca %struct.int_64_t, align 4
  store [24 x i32]* %powers, [24 x i32]** %powers.addr, align 4
  store i32 0, i32* %w, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc42, %entry
  %0 = load i32, i32* %w, align 4
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %for.body, label %for.end44

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
  call void @mult(%struct.int_64_t* sret %agg.tmp4, i32 %shl, i32 %6)
  %high = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp4, i32 0, i32 0
  %7 = load i32, i32* %high, align 4
  %low = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp4, i32 0, i32 1
  %8 = load i32, i32* %low, align 4
  call void @sra(%struct.int_64_t* sret %agg.tmp, i32 %7, i32 %8, i8 zeroext 17)
  %high6 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp, i32 0, i32 0
  %9 = load i32, i32* %high6, align 4
  %low7 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp, i32 0, i32 1
  %10 = load i32, i32* %low7, align 4
  %call = call i32 @cast_int32(i32 %9, i32 %10)
  %11 = load i32, i32* %fp_cospart, align 4
  %add8 = add nsw i32 %11, %call
  store i32 %add8, i32* %fp_cospart, align 4
  %12 = load i32, i32* %i, align 4
  %arrayidx11 = getelementptr inbounds [24 x i32], [24 x i32]* @rowsums, i32 0, i32 %12
  %13 = load i32, i32* %arrayidx11, align 4
  %shl12 = shl i32 %13, 17
  %14 = load i32, i32* %i, align 4
  %15 = load i32, i32* %w, align 4
  %mul13 = mul nsw i32 %15, 24
  %add14 = add nsw i32 %14, %mul13
  %arrayidx15 = getelementptr inbounds [96 x i32], [96 x i32]* @dft_waves_sin, i32 0, i32 %add14
  %16 = load i32, i32* %arrayidx15, align 4
  call void @mult(%struct.int_64_t* sret %agg.tmp10, i32 %shl12, i32 %16)
  %high16 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp10, i32 0, i32 0
  %17 = load i32, i32* %high16, align 4
  %low17 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp10, i32 0, i32 1
  %18 = load i32, i32* %low17, align 4
  call void @sra(%struct.int_64_t* sret %agg.tmp9, i32 %17, i32 %18, i8 zeroext 17)
  %high18 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp9, i32 0, i32 0
  %19 = load i32, i32* %high18, align 4
  %low19 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp9, i32 0, i32 1
  %20 = load i32, i32* %low19, align 4
  %call20 = call i32 @cast_int32(i32 %19, i32 %20)
  %21 = load i32, i32* %fp_sinpart, align 4
  %add21 = add nsw i32 %21, %call20
  store i32 %add21, i32* %fp_sinpart, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %22 = load i32, i32* %i, align 4
  %inc = add nsw i32 %22, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  %23 = load i32, i32* %fp_cospart, align 4
  %shr = ashr i32 %23, 12
  %24 = load i32, i32* %fp_cospart, align 4
  %shr24 = ashr i32 %24, 12
  call void @mult(%struct.int_64_t* sret %agg.tmp23, i32 %shr, i32 %shr24)
  %high25 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp23, i32 0, i32 0
  %25 = load i32, i32* %high25, align 4
  %low26 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp23, i32 0, i32 1
  %26 = load i32, i32* %low26, align 4
  call void @sra(%struct.int_64_t* sret %agg.tmp22, i32 %25, i32 %26, i8 zeroext 5)
  %high27 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp22, i32 0, i32 0
  %27 = load i32, i32* %high27, align 4
  %low28 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp22, i32 0, i32 1
  %28 = load i32, i32* %low28, align 4
  %call29 = call i32 @cast_int32(i32 %27, i32 %28)
  %29 = load i32, i32* %fp_sinpart, align 4
  %shr32 = ashr i32 %29, 12
  %30 = load i32, i32* %fp_sinpart, align 4
  %shr33 = ashr i32 %30, 12
  call void @mult(%struct.int_64_t* sret %agg.tmp31, i32 %shr32, i32 %shr33)
  %high34 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp31, i32 0, i32 0
  %31 = load i32, i32* %high34, align 4
  %low35 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp31, i32 0, i32 1
  %32 = load i32, i32* %low35, align 4
  call void @sra(%struct.int_64_t* sret %agg.tmp30, i32 %31, i32 %32, i8 zeroext 5)
  %high36 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp30, i32 0, i32 0
  %33 = load i32, i32* %high36, align 4
  %low37 = getelementptr inbounds %struct.int_64_t, %struct.int_64_t* %agg.tmp30, i32 0, i32 1
  %34 = load i32, i32* %low37, align 4
  %call38 = call i32 @cast_int32(i32 %33, i32 %34)
  %add39 = add nsw i32 %call29, %call38
  %35 = load i32, i32* %w, align 4
  %36 = load [24 x i32]*, [24 x i32]** %powers.addr, align 4
  %arrayidx40 = getelementptr inbounds [24 x i32], [24 x i32]* %36, i32 %35
  %arrayidx41 = getelementptr inbounds [24 x i32], [24 x i32]* %arrayidx40, i32 0, i32 0
  store i32 %add39, i32* %arrayidx41, align 4
  br label %for.inc42

for.inc42:                                        ; preds = %for.end
  %37 = load i32, i32* %w, align 4
  %inc43 = add nsw i32 %37, 1
  store i32 %inc43, i32* %w, align 4
  br label %for.cond

for.end44:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %powers = alloca [4 x [24 x i32]], align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  %arraydecay = getelementptr inbounds [4 x [24 x i32]], [4 x [24 x i32]]* %powers, i32 0, i32 0
  call void @sum_rot_block_row([24 x i32]* %arraydecay)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [4 x [24 x i32]], [4 x [24 x i32]]* %powers, i32 0, i32 %1
  %arrayidx1 = getelementptr inbounds [24 x i32], [24 x i32]* %arrayidx, i32 0, i32 0
  %2 = load i32, i32* %arrayidx1, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds [4 x [24 x i32]], [4 x [24 x i32]]* @powers_temp, i32 0, i32 %3
  %arrayidx3 = getelementptr inbounds [24 x i32], [24 x i32]* %arrayidx2, i32 0, i32 0
  %4 = load i32, i32* %arrayidx3, align 4
  %cmp4 = icmp ne i32 %2, %4
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4
  %arrayidx5 = getelementptr inbounds [4 x [24 x i32]], [4 x [24 x i32]]* %powers, i32 0, i32 %5
  %arrayidx6 = getelementptr inbounds [24 x i32], [24 x i32]* %arrayidx5, i32 0, i32 0
  %6 = load i32, i32* %arrayidx6, align 4
  store i32 %6, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %7 = load i32, i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 -1, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then
  %8 = load i32, i32* %retval
  ret i32 %8
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
