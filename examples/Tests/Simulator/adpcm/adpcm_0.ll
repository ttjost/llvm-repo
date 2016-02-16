; ModuleID = '/media/psf/Home/Dropbox/Universidade/Mestrado/llvm/examples/Tests/Simulator/powerstone/adpcm.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-pc-linux-gnu"

@rand.next = internal global i32 1, align 4
@h = global [24 x i32] [i32 12, i32 -44, i32 -44, i32 212, i32 48, i32 -624, i32 128, i32 1448, i32 -840, i32 -3220, i32 3804, i32 15504, i32 15504, i32 3804, i32 -3220, i32 -840, i32 1448, i32 128, i32 -624, i32 48, i32 212, i32 -44, i32 -44, i32 12], align 4
@qq4_code4_table = global [16 x i32] [i32 0, i32 -20456, i32 -12896, i32 -8968, i32 -6288, i32 -4240, i32 -2584, i32 -1200, i32 20456, i32 12896, i32 8968, i32 6288, i32 4240, i32 2584, i32 1200, i32 0], align 4
@qq5_code5_table = global [32 x i32] [i32 -280, i32 -280, i32 -23352, i32 -17560, i32 -14120, i32 -11664, i32 -9752, i32 -8184, i32 -6864, i32 -5712, i32 -4696, i32 -3784, i32 -2960, i32 -2208, i32 -1520, i32 -880, i32 23352, i32 17560, i32 14120, i32 11664, i32 9752, i32 8184, i32 6864, i32 5712, i32 4696, i32 3784, i32 2960, i32 2208, i32 1520, i32 880, i32 280, i32 -280], align 4
@qq6_code6_table = global [64 x i32] [i32 -136, i32 -136, i32 -136, i32 -136, i32 -24808, i32 -21904, i32 -19008, i32 -16704, i32 -14984, i32 -13512, i32 -12280, i32 -11192, i32 -10232, i32 -9360, i32 -8576, i32 -7856, i32 -7192, i32 -6576, i32 -6000, i32 -5456, i32 -4944, i32 -4464, i32 -4008, i32 -3576, i32 -3168, i32 -2776, i32 -2400, i32 -2032, i32 -1688, i32 -1360, i32 -1040, i32 -728, i32 24808, i32 21904, i32 19008, i32 16704, i32 14984, i32 13512, i32 12280, i32 11192, i32 10232, i32 9360, i32 8576, i32 7856, i32 7192, i32 6576, i32 6000, i32 5456, i32 4944, i32 4464, i32 4008, i32 3576, i32 3168, i32 2776, i32 2400, i32 2032, i32 1688, i32 1360, i32 1040, i32 728, i32 432, i32 136, i32 -432, i32 -136], align 4
@wl_code_table = global [16 x i32] [i32 -60, i32 3042, i32 1198, i32 538, i32 334, i32 172, i32 58, i32 -30, i32 3042, i32 1198, i32 538, i32 334, i32 172, i32 58, i32 -30, i32 -60], align 4
@wl_table = global [8 x i32] [i32 -60, i32 -30, i32 58, i32 172, i32 334, i32 538, i32 1198, i32 3042], align 4
@ilb_table = global [32 x i32] [i32 2048, i32 2093, i32 2139, i32 2186, i32 2233, i32 2282, i32 2332, i32 2383, i32 2435, i32 2489, i32 2543, i32 2599, i32 2656, i32 2714, i32 2774, i32 2834, i32 2896, i32 2960, i32 3025, i32 3091, i32 3158, i32 3228, i32 3298, i32 3371, i32 3444, i32 3520, i32 3597, i32 3676, i32 3756, i32 3838, i32 3922, i32 4008], align 4
@decis_levl = global [30 x i32] [i32 280, i32 576, i32 880, i32 1200, i32 1520, i32 1864, i32 2208, i32 2584, i32 2960, i32 3376, i32 3784, i32 4240, i32 4696, i32 5200, i32 5712, i32 6288, i32 6864, i32 7520, i32 8184, i32 8968, i32 9752, i32 10712, i32 11664, i32 12896, i32 14120, i32 15840, i32 17560, i32 20456, i32 23352, i32 32767], align 4
@quant26bt_pos = global [31 x i32] [i32 61, i32 60, i32 59, i32 58, i32 57, i32 56, i32 55, i32 54, i32 53, i32 52, i32 51, i32 50, i32 49, i32 48, i32 47, i32 46, i32 45, i32 44, i32 43, i32 42, i32 41, i32 40, i32 39, i32 38, i32 37, i32 36, i32 35, i32 34, i32 33, i32 32, i32 32], align 4
@quant26bt_neg = global [31 x i32] [i32 63, i32 62, i32 31, i32 30, i32 29, i32 28, i32 27, i32 26, i32 25, i32 24, i32 23, i32 22, i32 21, i32 20, i32 19, i32 18, i32 17, i32 16, i32 15, i32 14, i32 13, i32 12, i32 11, i32 10, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 4], align 4
@qq2_code2_table = global [4 x i32] [i32 -7408, i32 -1616, i32 7408, i32 1616], align 4
@wh_code_table = global [4 x i32] [i32 798, i32 -214, i32 798, i32 -214], align 4
@tqmf = common global [24 x i32] zeroinitializer, align 4
@xl = common global i32 0, align 4
@xh = common global i32 0, align 4
@delay_bpl = common global [6 x i32] zeroinitializer, align 4
@delay_dltx = common global [6 x i32] zeroinitializer, align 4
@szl = common global i32 0, align 4
@rlt1 = common global i32 0, align 4
@al1 = common global i32 0, align 4
@rlt2 = common global i32 0, align 4
@al2 = common global i32 0, align 4
@spl = common global i32 0, align 4
@sl = common global i32 0, align 4
@el = common global i32 0, align 4
@detl = common global i32 0, align 4
@il = common global i32 0, align 4
@dlt = common global i32 0, align 4
@nbl = common global i32 0, align 4
@plt = common global i32 0, align 4
@plt1 = common global i32 0, align 4
@plt2 = common global i32 0, align 4
@rlt = common global i32 0, align 4
@delay_bph = common global [6 x i32] zeroinitializer, align 4
@delay_dhx = common global [6 x i32] zeroinitializer, align 4
@szh = common global i32 0, align 4
@rh1 = common global i32 0, align 4
@ah1 = common global i32 0, align 4
@rh2 = common global i32 0, align 4
@ah2 = common global i32 0, align 4
@sph = common global i32 0, align 4
@sh = common global i32 0, align 4
@eh = common global i32 0, align 4
@ih = common global i32 0, align 4
@deth = common global i32 0, align 4
@dh = common global i32 0, align 4
@nbh = common global i32 0, align 4
@ph = common global i32 0, align 4
@ph1 = common global i32 0, align 4
@ph2 = common global i32 0, align 4
@yh = common global i32 0, align 4
@ilr = common global i32 0, align 4
@dec_del_bpl = common global [6 x i32] zeroinitializer, align 4
@dec_del_dltx = common global [6 x i32] zeroinitializer, align 4
@dec_szl = common global i32 0, align 4
@dec_rlt1 = common global i32 0, align 4
@dec_al1 = common global i32 0, align 4
@dec_rlt2 = common global i32 0, align 4
@dec_al2 = common global i32 0, align 4
@dec_spl = common global i32 0, align 4
@dec_sl = common global i32 0, align 4
@dec_detl = common global i32 0, align 4
@dec_dlt = common global i32 0, align 4
@dl = common global i32 0, align 4
@rl = common global i32 0, align 4
@dec_nbl = common global i32 0, align 4
@dec_plt = common global i32 0, align 4
@dec_plt1 = common global i32 0, align 4
@dec_plt2 = common global i32 0, align 4
@dec_rlt = common global i32 0, align 4
@dec_del_bph = common global [6 x i32] zeroinitializer, align 4
@dec_del_dhx = common global [6 x i32] zeroinitializer, align 4
@dec_szh = common global i32 0, align 4
@dec_rh1 = common global i32 0, align 4
@dec_ah1 = common global i32 0, align 4
@dec_rh2 = common global i32 0, align 4
@dec_ah2 = common global i32 0, align 4
@dec_sph = common global i32 0, align 4
@dec_sh = common global i32 0, align 4
@dec_deth = common global i32 0, align 4
@dec_dh = common global i32 0, align 4
@dec_nbh = common global i32 0, align 4
@dec_ph = common global i32 0, align 4
@dec_ph1 = common global i32 0, align 4
@dec_ph2 = common global i32 0, align 4
@rh = common global i32 0, align 4
@xd = common global i32 0, align 4
@xs = common global i32 0, align 4
@accumc = common global [11 x i32] zeroinitializer, align 4
@accumd = common global [11 x i32] zeroinitializer, align 4
@main.compressed = internal global [100 x i32] zeroinitializer, align 4
@main.result = internal global [100 x i32] zeroinitializer, align 4
@main.test_data = internal global [100 x i32] [i32 68, i32 68, i32 68, i32 68, i32 68, i32 68, i32 68, i32 68, i32 68, i32 68, i32 68, i32 68, i32 68, i32 68, i32 68, i32 68, i32 68, i32 67, i32 67, i32 67, i32 67, i32 67, i32 67, i32 67, i32 66, i32 66, i32 66, i32 66, i32 66, i32 66, i32 65, i32 65, i32 65, i32 65, i32 65, i32 64, i32 64, i32 64, i32 64, i32 64, i32 64, i32 64, i32 64, i32 63, i32 63, i32 63, i32 63, i32 63, i32 62, i32 62, i32 62, i32 62, i32 62, i32 62, i32 61, i32 61, i32 61, i32 61, i32 61, i32 61, i32 60, i32 60, i32 60, i32 60, i32 60, i32 60, i32 60, i32 60, i32 60, i32 59, i32 59, i32 59, i32 59, i32 59, i32 59, i32 59, i32 59, i32 59, i32 59, i32 59, i32 59, i32 59, i32 59, i32 59, i32 59, i32 59, i32 59, i32 59, i32 59, i32 59, i32 59, i32 59, i32 60, i32 60, i32 60, i32 60, i32 60, i32 60, i32 60, i32 60], align 4
@rs = common global i32 0, align 4
@yl = common global i32 0, align 4
@dec_yh = common global i32 0, align 4
@dec_rh = common global i32 0, align 4

; Function Attrs: nounwind readnone
define i32 @abs(i32 %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32, i32* %x.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i32, i32* %x.addr, align 4
  %sub = sub nsw i32 0, %1
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i32, i32* %x.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ %2, %cond.false ]
  ret i32 %cond
}

; Function Attrs: nounwind
define i8* @memcpy(i8* %d, i8* %s, i32 %t) #1 {
entry:
  %d.addr = alloca i8*, align 4
  %s.addr = alloca i8*, align 4
  %t.addr = alloca i32, align 4
  %pd = alloca i8*, align 4
  %ps = alloca i8*, align 4
  store i8* %d, i8** %d.addr, align 4
  store i8* %s, i8** %s.addr, align 4
  store i32 %t, i32* %t.addr, align 4
  %0 = load i8*, i8** %d.addr, align 4
  store i8* %0, i8** %pd, align 4
  %1 = load i8*, i8** %s.addr, align 4
  store i8* %1, i8** %ps, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %2 = load i32, i32* %t.addr, align 4
  %dec = add i32 %2, -1
  store i32 %dec, i32* %t.addr, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load i8*, i8** %ps, align 4
  %4 = load i8, i8* %3, align 1
  %5 = load i8*, i8** %pd, align 4
  store i8 %4, i8* %5, align 1
  %6 = load i8*, i8** %pd, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %6, i32 1
  store i8* %incdec.ptr, i8** %pd, align 4
  %7 = load i8*, i8** %ps, align 4
  %incdec.ptr1 = getelementptr inbounds i8, i8* %7, i32 1
  store i8* %incdec.ptr1, i8** %ps, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %8 = load i8*, i8** %d.addr, align 4
  ret i8* %8
}

; Function Attrs: nounwind
define i32 @strncmp(i8* %s1, i8* %s2, i32 %n) #1 {
entry:
  %retval = alloca i32, align 4
  %s1.addr = alloca i8*, align 4
  %s2.addr = alloca i8*, align 4
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i8* %s1, i8** %s1.addr, align 4
  store i8* %s2, i8** %s2.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %n.addr, align 4
  %cmp = icmp ult i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  %3 = load i8*, i8** %s1.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 %2
  %4 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %4 to i32
  %5 = load i32, i32* %i, align 4
  %6 = load i8*, i8** %s2.addr, align 4
  %arrayidx1 = getelementptr inbounds i8, i8* %6, i32 %5
  %7 = load i8, i8* %arrayidx1, align 1
  %conv2 = sext i8 %7 to i32
  %cmp3 = icmp slt i32 %conv, %conv2
  br i1 %cmp3, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  store i32 -1, i32* %retval
  br label %return

if.else:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4
  %9 = load i8*, i8** %s1.addr, align 4
  %arrayidx5 = getelementptr inbounds i8, i8* %9, i32 %8
  %10 = load i8, i8* %arrayidx5, align 1
  %conv6 = sext i8 %10 to i32
  %11 = load i32, i32* %i, align 4
  %12 = load i8*, i8** %s2.addr, align 4
  %arrayidx7 = getelementptr inbounds i8, i8* %12, i32 %11
  %13 = load i8, i8* %arrayidx7, align 1
  %conv8 = sext i8 %13 to i32
  %cmp9 = icmp sgt i32 %conv6, %conv8
  br i1 %cmp9, label %if.then11, label %if.end

if.then11:                                        ; preds = %if.else
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %if.else
  br label %if.end12

if.end12:                                         ; preds = %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end12
  %14 = load i32, i32* %i, align 4
  %inc = add i32 %14, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then11, %if.then
  %15 = load i32, i32* %retval
  ret i32 %15
}

; Function Attrs: nounwind
define i32 @rand() #1 {
entry:
  %0 = load i32, i32* @rand.next, align 4
  %mul = mul i32 %0, 1103515245
  %add = add i32 %mul, 12345
  store i32 %add, i32* @rand.next, align 4
  %1 = load i32, i32* @rand.next, align 4
  %div = udiv i32 %1, 65536
  %rem = urem i32 %div, 32768
  ret i32 %rem
}

; Function Attrs: nounwind
define i32 @encode(i32 %xin1, i32 %xin2) #1 {
entry:
  %xin1.addr = alloca i32, align 4
  %xin2.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %h_ptr = alloca i32*, align 4
  %tqmf_ptr = alloca i32*, align 4
  %tqmf_ptr1 = alloca i32*, align 4
  %xa = alloca i32, align 4
  %xb = alloca i32, align 4
  %decis = alloca i32, align 4
  store i32 %xin1, i32* %xin1.addr, align 4
  store i32 %xin2, i32* %xin2.addr, align 4
  store i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 0), i32** %h_ptr, align 4
  store i32* getelementptr inbounds ([24 x i32], [24 x i32]* @tqmf, i32 0, i32 0), i32** %tqmf_ptr, align 4
  %0 = load i32*, i32** %tqmf_ptr, align 4
  %incdec.ptr = getelementptr inbounds i32, i32* %0, i32 1
  store i32* %incdec.ptr, i32** %tqmf_ptr, align 4
  %1 = load i32, i32* %0, align 4
  %2 = load i32*, i32** %h_ptr, align 4
  %incdec.ptr1 = getelementptr inbounds i32, i32* %2, i32 1
  store i32* %incdec.ptr1, i32** %h_ptr, align 4
  %3 = load i32, i32* %2, align 4
  %mul = mul nsw i32 %1, %3
  store i32 %mul, i32* %xa, align 4
  %4 = load i32*, i32** %tqmf_ptr, align 4
  %incdec.ptr2 = getelementptr inbounds i32, i32* %4, i32 1
  store i32* %incdec.ptr2, i32** %tqmf_ptr, align 4
  %5 = load i32, i32* %4, align 4
  %6 = load i32*, i32** %h_ptr, align 4
  %incdec.ptr3 = getelementptr inbounds i32, i32* %6, i32 1
  store i32* %incdec.ptr3, i32** %h_ptr, align 4
  %7 = load i32, i32* %6, align 4
  %mul4 = mul nsw i32 %5, %7
  store i32 %mul4, i32* %xb, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %8, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %9 = load i32*, i32** %tqmf_ptr, align 4
  %incdec.ptr5 = getelementptr inbounds i32, i32* %9, i32 1
  store i32* %incdec.ptr5, i32** %tqmf_ptr, align 4
  %10 = load i32, i32* %9, align 4
  %11 = load i32*, i32** %h_ptr, align 4
  %incdec.ptr6 = getelementptr inbounds i32, i32* %11, i32 1
  store i32* %incdec.ptr6, i32** %h_ptr, align 4
  %12 = load i32, i32* %11, align 4
  %mul7 = mul nsw i32 %10, %12
  %13 = load i32, i32* %xa, align 4
  %add = add nsw i32 %13, %mul7
  store i32 %add, i32* %xa, align 4
  %14 = load i32*, i32** %tqmf_ptr, align 4
  %incdec.ptr8 = getelementptr inbounds i32, i32* %14, i32 1
  store i32* %incdec.ptr8, i32** %tqmf_ptr, align 4
  %15 = load i32, i32* %14, align 4
  %16 = load i32*, i32** %h_ptr, align 4
  %incdec.ptr9 = getelementptr inbounds i32, i32* %16, i32 1
  store i32* %incdec.ptr9, i32** %h_ptr, align 4
  %17 = load i32, i32* %16, align 4
  %mul10 = mul nsw i32 %15, %17
  %18 = load i32, i32* %xb, align 4
  %add11 = add nsw i32 %18, %mul10
  store i32 %add11, i32* %xb, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %19 = load i32, i32* %i, align 4
  %inc = add nsw i32 %19, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %20 = load i32*, i32** %tqmf_ptr, align 4
  %incdec.ptr12 = getelementptr inbounds i32, i32* %20, i32 1
  store i32* %incdec.ptr12, i32** %tqmf_ptr, align 4
  %21 = load i32, i32* %20, align 4
  %22 = load i32*, i32** %h_ptr, align 4
  %incdec.ptr13 = getelementptr inbounds i32, i32* %22, i32 1
  store i32* %incdec.ptr13, i32** %h_ptr, align 4
  %23 = load i32, i32* %22, align 4
  %mul14 = mul nsw i32 %21, %23
  %24 = load i32, i32* %xa, align 4
  %add15 = add nsw i32 %24, %mul14
  store i32 %add15, i32* %xa, align 4
  %25 = load i32*, i32** %tqmf_ptr, align 4
  %26 = load i32, i32* %25, align 4
  %27 = load i32*, i32** %h_ptr, align 4
  %incdec.ptr16 = getelementptr inbounds i32, i32* %27, i32 1
  store i32* %incdec.ptr16, i32** %h_ptr, align 4
  %28 = load i32, i32* %27, align 4
  %mul17 = mul nsw i32 %26, %28
  %29 = load i32, i32* %xb, align 4
  %add18 = add nsw i32 %29, %mul17
  store i32 %add18, i32* %xb, align 4
  %30 = load i32*, i32** %tqmf_ptr, align 4
  %add.ptr = getelementptr inbounds i32, i32* %30, i32 -2
  store i32* %add.ptr, i32** %tqmf_ptr1, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond19

for.cond19:                                       ; preds = %for.inc24, %for.end
  %31 = load i32, i32* %i, align 4
  %cmp20 = icmp slt i32 %31, 22
  br i1 %cmp20, label %for.body21, label %for.end26

for.body21:                                       ; preds = %for.cond19
  %32 = load i32*, i32** %tqmf_ptr1, align 4
  %incdec.ptr22 = getelementptr inbounds i32, i32* %32, i32 -1
  store i32* %incdec.ptr22, i32** %tqmf_ptr1, align 4
  %33 = load i32, i32* %32, align 4
  %34 = load i32*, i32** %tqmf_ptr, align 4
  %incdec.ptr23 = getelementptr inbounds i32, i32* %34, i32 -1
  store i32* %incdec.ptr23, i32** %tqmf_ptr, align 4
  store i32 %33, i32* %34, align 4
  br label %for.inc24

for.inc24:                                        ; preds = %for.body21
  %35 = load i32, i32* %i, align 4
  %inc25 = add nsw i32 %35, 1
  store i32 %inc25, i32* %i, align 4
  br label %for.cond19

for.end26:                                        ; preds = %for.cond19
  %36 = load i32, i32* %xin1.addr, align 4
  %37 = load i32*, i32** %tqmf_ptr, align 4
  %incdec.ptr27 = getelementptr inbounds i32, i32* %37, i32 -1
  store i32* %incdec.ptr27, i32** %tqmf_ptr, align 4
  store i32 %36, i32* %37, align 4
  %38 = load i32, i32* %xin2.addr, align 4
  %39 = load i32*, i32** %tqmf_ptr, align 4
  store i32 %38, i32* %39, align 4
  %40 = load i32, i32* %xa, align 4
  %41 = load i32, i32* %xb, align 4
  %add28 = add nsw i32 %40, %41
  %shr = ashr i32 %add28, 15
  store i32 %shr, i32* @xl, align 4
  %42 = load i32, i32* %xa, align 4
  %43 = load i32, i32* %xb, align 4
  %sub = sub nsw i32 %42, %43
  %shr29 = ashr i32 %sub, 15
  store i32 %shr29, i32* @xh, align 4
  %call = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bpl, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dltx, i32 0, i32 0))
  store i32 %call, i32* @szl, align 4
  %44 = load i32, i32* @rlt1, align 4
  %45 = load i32, i32* @al1, align 4
  %46 = load i32, i32* @rlt2, align 4
  %47 = load i32, i32* @al2, align 4
  %call30 = call i32 @filtep(i32 %44, i32 %45, i32 %46, i32 %47)
  store i32 %call30, i32* @spl, align 4
  %48 = load i32, i32* @szl, align 4
  %49 = load i32, i32* @spl, align 4
  %add31 = add nsw i32 %48, %49
  store i32 %add31, i32* @sl, align 4
  %50 = load i32, i32* @xl, align 4
  %51 = load i32, i32* @sl, align 4
  %sub32 = sub nsw i32 %50, %51
  store i32 %sub32, i32* @el, align 4
  %52 = load i32, i32* @el, align 4
  %53 = load i32, i32* @detl, align 4
  %call33 = call i32 @quantl(i32 %52, i32 %53)
  store i32 %call33, i32* @il, align 4
  %54 = load i32, i32* @detl, align 4
  %55 = load i32, i32* @il, align 4
  %shr34 = ashr i32 %55, 2
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @qq4_code4_table, i32 0, i32 %shr34
  %56 = load i32, i32* %arrayidx, align 4
  %mul35 = mul nsw i32 %54, %56
  %shr36 = ashr i32 %mul35, 15
  store i32 %shr36, i32* @dlt, align 4
  %57 = load i32, i32* @il, align 4
  %58 = load i32, i32* @nbl, align 4
  %call37 = call i32 @logscl(i32 %57, i32 %58)
  store i32 %call37, i32* @nbl, align 4
  %59 = load i32, i32* @nbl, align 4
  %call38 = call i32 @scalel(i32 %59, i32 8)
  store i32 %call38, i32* @detl, align 4
  %60 = load i32, i32* @dlt, align 4
  %61 = load i32, i32* @szl, align 4
  %add39 = add nsw i32 %60, %61
  store i32 %add39, i32* @plt, align 4
  %62 = load i32, i32* @dlt, align 4
  call void @upzero(i32 %62, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dltx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bpl, i32 0, i32 0))
  %63 = load i32, i32* @al1, align 4
  %64 = load i32, i32* @al2, align 4
  %65 = load i32, i32* @plt, align 4
  %66 = load i32, i32* @plt1, align 4
  %67 = load i32, i32* @plt2, align 4
  %call40 = call i32 @uppol2(i32 %63, i32 %64, i32 %65, i32 %66, i32 %67)
  store i32 %call40, i32* @al2, align 4
  %68 = load i32, i32* @al1, align 4
  %69 = load i32, i32* @al2, align 4
  %70 = load i32, i32* @plt, align 4
  %71 = load i32, i32* @plt1, align 4
  %call41 = call i32 @uppol1(i32 %68, i32 %69, i32 %70, i32 %71)
  store i32 %call41, i32* @al1, align 4
  %72 = load i32, i32* @sl, align 4
  %73 = load i32, i32* @dlt, align 4
  %add42 = add nsw i32 %72, %73
  store i32 %add42, i32* @rlt, align 4
  %74 = load i32, i32* @rlt1, align 4
  store i32 %74, i32* @rlt2, align 4
  %75 = load i32, i32* @rlt, align 4
  store i32 %75, i32* @rlt1, align 4
  %76 = load i32, i32* @plt1, align 4
  store i32 %76, i32* @plt2, align 4
  %77 = load i32, i32* @plt, align 4
  store i32 %77, i32* @plt1, align 4
  %call43 = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bph, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dhx, i32 0, i32 0))
  store i32 %call43, i32* @szh, align 4
  %78 = load i32, i32* @rh1, align 4
  %79 = load i32, i32* @ah1, align 4
  %80 = load i32, i32* @rh2, align 4
  %81 = load i32, i32* @ah2, align 4
  %call44 = call i32 @filtep(i32 %78, i32 %79, i32 %80, i32 %81)
  store i32 %call44, i32* @sph, align 4
  %82 = load i32, i32* @sph, align 4
  %83 = load i32, i32* @szh, align 4
  %add45 = add nsw i32 %82, %83
  store i32 %add45, i32* @sh, align 4
  %84 = load i32, i32* @xh, align 4
  %85 = load i32, i32* @sh, align 4
  %sub46 = sub nsw i32 %84, %85
  store i32 %sub46, i32* @eh, align 4
  %86 = load i32, i32* @eh, align 4
  %cmp47 = icmp sge i32 %86, 0
  br i1 %cmp47, label %if.then, label %if.else

if.then:                                          ; preds = %for.end26
  store i32 3, i32* @ih, align 4
  br label %if.end

if.else:                                          ; preds = %for.end26
  store i32 1, i32* @ih, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %87 = load i32, i32* @deth, align 4
  %mul48 = mul nsw i32 564, %87
  %shr49 = ashr i32 %mul48, 12
  store i32 %shr49, i32* %decis, align 4
  %88 = load i32, i32* @eh, align 4
  %call50 = call i32 @abs(i32 %88) #2
  %89 = load i32, i32* %decis, align 4
  %cmp51 = icmp sgt i32 %call50, %89
  br i1 %cmp51, label %if.then52, label %if.end53

if.then52:                                        ; preds = %if.end
  %90 = load i32, i32* @ih, align 4
  %dec = add nsw i32 %90, -1
  store i32 %dec, i32* @ih, align 4
  br label %if.end53

if.end53:                                         ; preds = %if.then52, %if.end
  %91 = load i32, i32* @deth, align 4
  %92 = load i32, i32* @ih, align 4
  %arrayidx54 = getelementptr inbounds [4 x i32], [4 x i32]* @qq2_code2_table, i32 0, i32 %92
  %93 = load i32, i32* %arrayidx54, align 4
  %mul55 = mul nsw i32 %91, %93
  %shr56 = ashr i32 %mul55, 15
  store i32 %shr56, i32* @dh, align 4
  %94 = load i32, i32* @ih, align 4
  %95 = load i32, i32* @nbh, align 4
  %call57 = call i32 @logsch(i32 %94, i32 %95)
  store i32 %call57, i32* @nbh, align 4
  %96 = load i32, i32* @nbh, align 4
  %call58 = call i32 @scalel(i32 %96, i32 10)
  store i32 %call58, i32* @deth, align 4
  %97 = load i32, i32* @dh, align 4
  %98 = load i32, i32* @szh, align 4
  %add59 = add nsw i32 %97, %98
  store i32 %add59, i32* @ph, align 4
  %99 = load i32, i32* @dh, align 4
  call void @upzero(i32 %99, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_dhx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @delay_bph, i32 0, i32 0))
  %100 = load i32, i32* @ah1, align 4
  %101 = load i32, i32* @ah2, align 4
  %102 = load i32, i32* @ph, align 4
  %103 = load i32, i32* @ph1, align 4
  %104 = load i32, i32* @ph2, align 4
  %call60 = call i32 @uppol2(i32 %100, i32 %101, i32 %102, i32 %103, i32 %104)
  store i32 %call60, i32* @ah2, align 4
  %105 = load i32, i32* @ah1, align 4
  %106 = load i32, i32* @ah2, align 4
  %107 = load i32, i32* @ph, align 4
  %108 = load i32, i32* @ph1, align 4
  %call61 = call i32 @uppol1(i32 %105, i32 %106, i32 %107, i32 %108)
  store i32 %call61, i32* @ah1, align 4
  %109 = load i32, i32* @sh, align 4
  %110 = load i32, i32* @dh, align 4
  %add62 = add nsw i32 %109, %110
  store i32 %add62, i32* @yh, align 4
  %111 = load i32, i32* @rh1, align 4
  store i32 %111, i32* @rh2, align 4
  %112 = load i32, i32* @yh, align 4
  store i32 %112, i32* @rh1, align 4
  %113 = load i32, i32* @ph1, align 4
  store i32 %113, i32* @ph2, align 4
  %114 = load i32, i32* @ph, align 4
  store i32 %114, i32* @ph1, align 4
  %115 = load i32, i32* @il, align 4
  %116 = load i32, i32* @ih, align 4
  %shl = shl i32 %116, 6
  %or = or i32 %115, %shl
  ret i32 %or
}

; Function Attrs: nounwind
define i32 @filtez(i32* %bpl, i32* %dlt) #1 {
entry:
  %bpl.addr = alloca i32*, align 4
  %dlt.addr = alloca i32*, align 4
  %i = alloca i32, align 4
  %zl = alloca i32, align 4
  store i32* %bpl, i32** %bpl.addr, align 4
  store i32* %dlt, i32** %dlt.addr, align 4
  %0 = load i32*, i32** %bpl.addr, align 4
  %incdec.ptr = getelementptr inbounds i32, i32* %0, i32 1
  store i32* %incdec.ptr, i32** %bpl.addr, align 4
  %1 = load i32, i32* %0, align 4
  %2 = load i32*, i32** %dlt.addr, align 4
  %incdec.ptr1 = getelementptr inbounds i32, i32* %2, i32 1
  store i32* %incdec.ptr1, i32** %dlt.addr, align 4
  %3 = load i32, i32* %2, align 4
  %mul = mul nsw i32 %1, %3
  store i32 %mul, i32* %zl, align 4
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %4, 6
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i32*, i32** %bpl.addr, align 4
  %incdec.ptr2 = getelementptr inbounds i32, i32* %5, i32 1
  store i32* %incdec.ptr2, i32** %bpl.addr, align 4
  %6 = load i32, i32* %5, align 4
  %7 = load i32*, i32** %dlt.addr, align 4
  %incdec.ptr3 = getelementptr inbounds i32, i32* %7, i32 1
  store i32* %incdec.ptr3, i32** %dlt.addr, align 4
  %8 = load i32, i32* %7, align 4
  %mul4 = mul nsw i32 %6, %8
  %9 = load i32, i32* %zl, align 4
  %add = add nsw i32 %9, %mul4
  store i32 %add, i32* %zl, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %11 = load i32, i32* %zl, align 4
  %shr = ashr i32 %11, 14
  ret i32 %shr
}

; Function Attrs: nounwind
define i32 @filtep(i32 %rlt1, i32 %al1, i32 %rlt2, i32 %al2) #1 {
entry:
  %rlt1.addr = alloca i32, align 4
  %al1.addr = alloca i32, align 4
  %rlt2.addr = alloca i32, align 4
  %al2.addr = alloca i32, align 4
  %pl = alloca i32, align 4
  %pl2 = alloca i32, align 4
  store i32 %rlt1, i32* %rlt1.addr, align 4
  store i32 %al1, i32* %al1.addr, align 4
  store i32 %rlt2, i32* %rlt2.addr, align 4
  store i32 %al2, i32* %al2.addr, align 4
  %0 = load i32, i32* %rlt1.addr, align 4
  %mul = mul nsw i32 2, %0
  store i32 %mul, i32* %pl, align 4
  %1 = load i32, i32* %al1.addr, align 4
  %2 = load i32, i32* %pl, align 4
  %mul1 = mul nsw i32 %1, %2
  store i32 %mul1, i32* %pl, align 4
  %3 = load i32, i32* %rlt2.addr, align 4
  %mul2 = mul nsw i32 2, %3
  store i32 %mul2, i32* %pl2, align 4
  %4 = load i32, i32* %al2.addr, align 4
  %5 = load i32, i32* %pl2, align 4
  %mul3 = mul nsw i32 %4, %5
  %6 = load i32, i32* %pl, align 4
  %add = add nsw i32 %6, %mul3
  store i32 %add, i32* %pl, align 4
  %7 = load i32, i32* %pl, align 4
  %shr = ashr i32 %7, 15
  ret i32 %shr
}

; Function Attrs: nounwind
define i32 @quantl(i32 %el, i32 %detl) #1 {
entry:
  %el.addr = alloca i32, align 4
  %detl.addr = alloca i32, align 4
  %ril = alloca i32, align 4
  %mil = alloca i32, align 4
  %wd = alloca i32, align 4
  %decis = alloca i32, align 4
  store i32 %el, i32* %el.addr, align 4
  store i32 %detl, i32* %detl.addr, align 4
  %0 = load i32, i32* %el.addr, align 4
  %call = call i32 @abs(i32 %0) #2
  store i32 %call, i32* %wd, align 4
  store i32 0, i32* %mil, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %mil, align 4
  %cmp = icmp slt i32 %1, 30
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %mil, align 4
  %arrayidx = getelementptr inbounds [30 x i32], [30 x i32]* @decis_levl, i32 0, i32 %2
  %3 = load i32, i32* %arrayidx, align 4
  %4 = load i32, i32* %detl.addr, align 4
  %mul = mul nsw i32 %3, %4
  %shr = ashr i32 %mul, 15
  store i32 %shr, i32* %decis, align 4
  %5 = load i32, i32* %wd, align 4
  %6 = load i32, i32* %decis, align 4
  %cmp1 = icmp sle i32 %5, %6
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %for.end

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %7 = load i32, i32* %mil, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %mil, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  %8 = load i32, i32* %el.addr, align 4
  %cmp2 = icmp sge i32 %8, 0
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %for.end
  %9 = load i32, i32* %mil, align 4
  %arrayidx4 = getelementptr inbounds [31 x i32], [31 x i32]* @quant26bt_pos, i32 0, i32 %9
  %10 = load i32, i32* %arrayidx4, align 4
  store i32 %10, i32* %ril, align 4
  br label %if.end6

if.else:                                          ; preds = %for.end
  %11 = load i32, i32* %mil, align 4
  %arrayidx5 = getelementptr inbounds [31 x i32], [31 x i32]* @quant26bt_neg, i32 0, i32 %11
  %12 = load i32, i32* %arrayidx5, align 4
  store i32 %12, i32* %ril, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then3
  %13 = load i32, i32* %ril, align 4
  ret i32 %13
}

; Function Attrs: nounwind
define i32 @logscl(i32 %il, i32 %nbl) #1 {
entry:
  %il.addr = alloca i32, align 4
  %nbl.addr = alloca i32, align 4
  %wd = alloca i32, align 4
  store i32 %il, i32* %il.addr, align 4
  store i32 %nbl, i32* %nbl.addr, align 4
  %0 = load i32, i32* %nbl.addr, align 4
  %mul = mul nsw i32 %0, 127
  %shr = ashr i32 %mul, 7
  store i32 %shr, i32* %wd, align 4
  %1 = load i32, i32* %wd, align 4
  %2 = load i32, i32* %il.addr, align 4
  %shr1 = ashr i32 %2, 2
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @wl_code_table, i32 0, i32 %shr1
  %3 = load i32, i32* %arrayidx, align 4
  %add = add nsw i32 %1, %3
  store i32 %add, i32* %nbl.addr, align 4
  %4 = load i32, i32* %nbl.addr, align 4
  %cmp = icmp slt i32 %4, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %nbl.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load i32, i32* %nbl.addr, align 4
  %cmp2 = icmp sgt i32 %5, 18432
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  store i32 18432, i32* %nbl.addr, align 4
  br label %if.end4

if.end4:                                          ; preds = %if.then3, %if.end
  %6 = load i32, i32* %nbl.addr, align 4
  ret i32 %6
}

; Function Attrs: nounwind
define i32 @scalel(i32 %nbl, i32 %shift_constant) #1 {
entry:
  %nbl.addr = alloca i32, align 4
  %shift_constant.addr = alloca i32, align 4
  %wd1 = alloca i32, align 4
  %wd2 = alloca i32, align 4
  %wd3 = alloca i32, align 4
  store i32 %nbl, i32* %nbl.addr, align 4
  store i32 %shift_constant, i32* %shift_constant.addr, align 4
  %0 = load i32, i32* %nbl.addr, align 4
  %shr = ashr i32 %0, 6
  %and = and i32 %shr, 31
  store i32 %and, i32* %wd1, align 4
  %1 = load i32, i32* %nbl.addr, align 4
  %shr1 = ashr i32 %1, 11
  store i32 %shr1, i32* %wd2, align 4
  %2 = load i32, i32* %wd1, align 4
  %arrayidx = getelementptr inbounds [32 x i32], [32 x i32]* @ilb_table, i32 0, i32 %2
  %3 = load i32, i32* %arrayidx, align 4
  %4 = load i32, i32* %shift_constant.addr, align 4
  %add = add nsw i32 %4, 1
  %5 = load i32, i32* %wd2, align 4
  %sub = sub nsw i32 %add, %5
  %shr2 = ashr i32 %3, %sub
  store i32 %shr2, i32* %wd3, align 4
  %6 = load i32, i32* %wd3, align 4
  %shl = shl i32 %6, 3
  ret i32 %shl
}

; Function Attrs: nounwind
define void @upzero(i32 %dlt, i32* %dlti, i32* %bli) #1 {
entry:
  %dlt.addr = alloca i32, align 4
  %dlti.addr = alloca i32*, align 4
  %bli.addr = alloca i32*, align 4
  %i = alloca i32, align 4
  %wd2 = alloca i32, align 4
  %wd3 = alloca i32, align 4
  store i32 %dlt, i32* %dlt.addr, align 4
  store i32* %dlti, i32** %dlti.addr, align 4
  store i32* %bli, i32** %bli.addr, align 4
  %0 = load i32, i32* %dlt.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %1 = load i32, i32* %i, align 4
  %cmp1 = icmp slt i32 %1, 6
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  %3 = load i32*, i32** %bli.addr, align 4
  %arrayidx = getelementptr inbounds i32, i32* %3, i32 %2
  %4 = load i32, i32* %arrayidx, align 4
  %mul = mul nsw i32 255, %4
  %shr = ashr i32 %mul, 8
  %5 = load i32, i32* %i, align 4
  %6 = load i32*, i32** %bli.addr, align 4
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i32 %5
  store i32 %shr, i32* %arrayidx2, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end18

if.else:                                          ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc15, %if.else
  %8 = load i32, i32* %i, align 4
  %cmp4 = icmp slt i32 %8, 6
  br i1 %cmp4, label %for.body5, label %for.end17

for.body5:                                        ; preds = %for.cond3
  %9 = load i32, i32* %dlt.addr, align 4
  %10 = load i32, i32* %i, align 4
  %11 = load i32*, i32** %dlti.addr, align 4
  %arrayidx6 = getelementptr inbounds i32, i32* %11, i32 %10
  %12 = load i32, i32* %arrayidx6, align 4
  %mul7 = mul nsw i32 %9, %12
  %cmp8 = icmp sge i32 %mul7, 0
  br i1 %cmp8, label %if.then9, label %if.else10

if.then9:                                         ; preds = %for.body5
  store i32 128, i32* %wd2, align 4
  br label %if.end

if.else10:                                        ; preds = %for.body5
  store i32 -128, i32* %wd2, align 4
  br label %if.end

if.end:                                           ; preds = %if.else10, %if.then9
  %13 = load i32, i32* %i, align 4
  %14 = load i32*, i32** %bli.addr, align 4
  %arrayidx11 = getelementptr inbounds i32, i32* %14, i32 %13
  %15 = load i32, i32* %arrayidx11, align 4
  %mul12 = mul nsw i32 255, %15
  %shr13 = ashr i32 %mul12, 8
  store i32 %shr13, i32* %wd3, align 4
  %16 = load i32, i32* %wd2, align 4
  %17 = load i32, i32* %wd3, align 4
  %add = add nsw i32 %16, %17
  %18 = load i32, i32* %i, align 4
  %19 = load i32*, i32** %bli.addr, align 4
  %arrayidx14 = getelementptr inbounds i32, i32* %19, i32 %18
  store i32 %add, i32* %arrayidx14, align 4
  br label %for.inc15

for.inc15:                                        ; preds = %if.end
  %20 = load i32, i32* %i, align 4
  %inc16 = add nsw i32 %20, 1
  store i32 %inc16, i32* %i, align 4
  br label %for.cond3

for.end17:                                        ; preds = %for.cond3
  br label %if.end18

if.end18:                                         ; preds = %for.end17, %for.end
  %21 = load i32*, i32** %dlti.addr, align 4
  %arrayidx19 = getelementptr inbounds i32, i32* %21, i32 4
  %22 = load i32, i32* %arrayidx19, align 4
  %23 = load i32*, i32** %dlti.addr, align 4
  %arrayidx20 = getelementptr inbounds i32, i32* %23, i32 5
  store i32 %22, i32* %arrayidx20, align 4
  %24 = load i32*, i32** %dlti.addr, align 4
  %arrayidx21 = getelementptr inbounds i32, i32* %24, i32 3
  %25 = load i32, i32* %arrayidx21, align 4
  %26 = load i32*, i32** %dlti.addr, align 4
  %arrayidx22 = getelementptr inbounds i32, i32* %26, i32 4
  store i32 %25, i32* %arrayidx22, align 4
  %27 = load i32*, i32** %dlti.addr, align 4
  %arrayidx23 = getelementptr inbounds i32, i32* %27, i32 2
  %28 = load i32, i32* %arrayidx23, align 4
  %29 = load i32*, i32** %dlti.addr, align 4
  %arrayidx24 = getelementptr inbounds i32, i32* %29, i32 3
  store i32 %28, i32* %arrayidx24, align 4
  %30 = load i32*, i32** %dlti.addr, align 4
  %arrayidx25 = getelementptr inbounds i32, i32* %30, i32 0
  %31 = load i32, i32* %arrayidx25, align 4
  %32 = load i32*, i32** %dlti.addr, align 4
  %arrayidx26 = getelementptr inbounds i32, i32* %32, i32 1
  store i32 %31, i32* %arrayidx26, align 4
  %33 = load i32, i32* %dlt.addr, align 4
  %34 = load i32*, i32** %dlti.addr, align 4
  %arrayidx27 = getelementptr inbounds i32, i32* %34, i32 0
  store i32 %33, i32* %arrayidx27, align 4
  ret void
}

; Function Attrs: nounwind
define i32 @uppol2(i32 %al1, i32 %al2, i32 %plt, i32 %plt1, i32 %plt2) #1 {
entry:
  %al1.addr = alloca i32, align 4
  %al2.addr = alloca i32, align 4
  %plt.addr = alloca i32, align 4
  %plt1.addr = alloca i32, align 4
  %plt2.addr = alloca i32, align 4
  %wd2 = alloca i32, align 4
  %wd4 = alloca i32, align 4
  %apl2 = alloca i32, align 4
  store i32 %al1, i32* %al1.addr, align 4
  store i32 %al2, i32* %al2.addr, align 4
  store i32 %plt, i32* %plt.addr, align 4
  store i32 %plt1, i32* %plt1.addr, align 4
  store i32 %plt2, i32* %plt2.addr, align 4
  %0 = load i32, i32* %al1.addr, align 4
  %mul = mul nsw i32 4, %0
  store i32 %mul, i32* %wd2, align 4
  %1 = load i32, i32* %plt.addr, align 4
  %2 = load i32, i32* %plt1.addr, align 4
  %mul1 = mul nsw i32 %1, %2
  %cmp = icmp sge i32 %mul1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %wd2, align 4
  %sub = sub nsw i32 0, %3
  store i32 %sub, i32* %wd2, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load i32, i32* %wd2, align 4
  %shr = ashr i32 %4, 7
  store i32 %shr, i32* %wd2, align 4
  %5 = load i32, i32* %plt.addr, align 4
  %6 = load i32, i32* %plt2.addr, align 4
  %mul2 = mul nsw i32 %5, %6
  %cmp3 = icmp sge i32 %mul2, 0
  br i1 %cmp3, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.end
  %7 = load i32, i32* %wd2, align 4
  %add = add nsw i32 %7, 128
  store i32 %add, i32* %wd4, align 4
  br label %if.end6

if.else:                                          ; preds = %if.end
  %8 = load i32, i32* %wd2, align 4
  %sub5 = sub nsw i32 %8, 128
  store i32 %sub5, i32* %wd4, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then4
  %9 = load i32, i32* %wd4, align 4
  %10 = load i32, i32* %al2.addr, align 4
  %mul7 = mul nsw i32 127, %10
  %shr8 = ashr i32 %mul7, 7
  %add9 = add nsw i32 %9, %shr8
  store i32 %add9, i32* %apl2, align 4
  %11 = load i32, i32* %apl2, align 4
  %cmp10 = icmp sgt i32 %11, 12288
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end6
  store i32 12288, i32* %apl2, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.then11, %if.end6
  %12 = load i32, i32* %apl2, align 4
  %cmp13 = icmp slt i32 %12, -12288
  br i1 %cmp13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end12
  store i32 -12288, i32* %apl2, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %if.end12
  %13 = load i32, i32* %apl2, align 4
  ret i32 %13
}

; Function Attrs: nounwind
define i32 @uppol1(i32 %al1, i32 %apl2, i32 %plt, i32 %plt1) #1 {
entry:
  %al1.addr = alloca i32, align 4
  %apl2.addr = alloca i32, align 4
  %plt.addr = alloca i32, align 4
  %plt1.addr = alloca i32, align 4
  %wd2 = alloca i32, align 4
  %wd3 = alloca i32, align 4
  %apl1 = alloca i32, align 4
  store i32 %al1, i32* %al1.addr, align 4
  store i32 %apl2, i32* %apl2.addr, align 4
  store i32 %plt, i32* %plt.addr, align 4
  store i32 %plt1, i32* %plt1.addr, align 4
  %0 = load i32, i32* %al1.addr, align 4
  %mul = mul nsw i32 %0, 255
  %shr = ashr i32 %mul, 8
  store i32 %shr, i32* %wd2, align 4
  %1 = load i32, i32* %plt.addr, align 4
  %2 = load i32, i32* %plt1.addr, align 4
  %mul1 = mul nsw i32 %1, %2
  %cmp = icmp sge i32 %mul1, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %3 = load i32, i32* %wd2, align 4
  %add = add nsw i32 %3, 192
  store i32 %add, i32* %apl1, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %4 = load i32, i32* %wd2, align 4
  %sub = sub nsw i32 %4, 192
  store i32 %sub, i32* %apl1, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %5 = load i32, i32* %apl2.addr, align 4
  %sub2 = sub nsw i32 15360, %5
  store i32 %sub2, i32* %wd3, align 4
  %6 = load i32, i32* %apl1, align 4
  %7 = load i32, i32* %wd3, align 4
  %cmp3 = icmp sgt i32 %6, %7
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  %8 = load i32, i32* %wd3, align 4
  store i32 %8, i32* %apl1, align 4
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  %9 = load i32, i32* %apl1, align 4
  %10 = load i32, i32* %wd3, align 4
  %sub6 = sub nsw i32 0, %10
  %cmp7 = icmp slt i32 %9, %sub6
  br i1 %cmp7, label %if.then8, label %if.end10

if.then8:                                         ; preds = %if.end5
  %11 = load i32, i32* %wd3, align 4
  %sub9 = sub nsw i32 0, %11
  store i32 %sub9, i32* %apl1, align 4
  br label %if.end10

if.end10:                                         ; preds = %if.then8, %if.end5
  %12 = load i32, i32* %apl1, align 4
  ret i32 %12
}

; Function Attrs: nounwind
define i32 @logsch(i32 %ih, i32 %nbh) #1 {
entry:
  %ih.addr = alloca i32, align 4
  %nbh.addr = alloca i32, align 4
  %wd = alloca i32, align 4
  store i32 %ih, i32* %ih.addr, align 4
  store i32 %nbh, i32* %nbh.addr, align 4
  %0 = load i32, i32* %nbh.addr, align 4
  %mul = mul nsw i32 %0, 127
  %shr = ashr i32 %mul, 7
  store i32 %shr, i32* %wd, align 4
  %1 = load i32, i32* %wd, align 4
  %2 = load i32, i32* %ih.addr, align 4
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* @wh_code_table, i32 0, i32 %2
  %3 = load i32, i32* %arrayidx, align 4
  %add = add nsw i32 %1, %3
  store i32 %add, i32* %nbh.addr, align 4
  %4 = load i32, i32* %nbh.addr, align 4
  %cmp = icmp slt i32 %4, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %nbh.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %5 = load i32, i32* %nbh.addr, align 4
  %cmp1 = icmp sgt i32 %5, 22528
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  store i32 22528, i32* %nbh.addr, align 4
  br label %if.end3

if.end3:                                          ; preds = %if.then2, %if.end
  %6 = load i32, i32* %nbh.addr, align 4
  ret i32 %6
}

; Function Attrs: nounwind
define void @decode(i32 %input, i32* %xout) #1 {
entry:
  %input.addr = alloca i32, align 4
  %xout.addr = alloca i32*, align 4
  %i = alloca i32, align 4
  %xa1 = alloca i32, align 4
  %xa2 = alloca i32, align 4
  %h_ptr = alloca i32*, align 4
  %ac_ptr = alloca i32*, align 4
  %ac_ptr1 = alloca i32*, align 4
  %ad_ptr = alloca i32*, align 4
  %ad_ptr1 = alloca i32*, align 4
  store i32 %input, i32* %input.addr, align 4
  store i32* %xout, i32** %xout.addr, align 4
  %0 = load i32, i32* %input.addr, align 4
  %and = and i32 %0, 63
  store i32 %and, i32* @ilr, align 4
  %1 = load i32, i32* %input.addr, align 4
  %shr = ashr i32 %1, 6
  store i32 %shr, i32* @ih, align 4
  %call = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bpl, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dltx, i32 0, i32 0))
  store i32 %call, i32* @dec_szl, align 4
  %2 = load i32, i32* @dec_rlt1, align 4
  %3 = load i32, i32* @dec_al1, align 4
  %4 = load i32, i32* @dec_rlt2, align 4
  %5 = load i32, i32* @dec_al2, align 4
  %call1 = call i32 @filtep(i32 %2, i32 %3, i32 %4, i32 %5)
  store i32 %call1, i32* @dec_spl, align 4
  %6 = load i32, i32* @dec_spl, align 4
  %7 = load i32, i32* @dec_szl, align 4
  %add = add nsw i32 %6, %7
  store i32 %add, i32* @dec_sl, align 4
  %8 = load i32, i32* @dec_detl, align 4
  %9 = load i32, i32* @ilr, align 4
  %shr2 = ashr i32 %9, 2
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* @qq4_code4_table, i32 0, i32 %shr2
  %10 = load i32, i32* %arrayidx, align 4
  %mul = mul nsw i32 %8, %10
  %shr3 = ashr i32 %mul, 15
  store i32 %shr3, i32* @dec_dlt, align 4
  %11 = load i32, i32* @dec_detl, align 4
  %12 = load i32, i32* @il, align 4
  %arrayidx4 = getelementptr inbounds [64 x i32], [64 x i32]* @qq6_code6_table, i32 0, i32 %12
  %13 = load i32, i32* %arrayidx4, align 4
  %mul5 = mul nsw i32 %11, %13
  %shr6 = ashr i32 %mul5, 15
  store i32 %shr6, i32* @dl, align 4
  %14 = load i32, i32* @dl, align 4
  %15 = load i32, i32* @dec_sl, align 4
  %add7 = add nsw i32 %14, %15
  store i32 %add7, i32* @rl, align 4
  %16 = load i32, i32* @ilr, align 4
  %17 = load i32, i32* @dec_nbl, align 4
  %call8 = call i32 @logscl(i32 %16, i32 %17)
  store i32 %call8, i32* @dec_nbl, align 4
  %18 = load i32, i32* @dec_nbl, align 4
  %call9 = call i32 @scalel(i32 %18, i32 8)
  store i32 %call9, i32* @dec_detl, align 4
  %19 = load i32, i32* @dec_dlt, align 4
  %20 = load i32, i32* @dec_szl, align 4
  %add10 = add nsw i32 %19, %20
  store i32 %add10, i32* @dec_plt, align 4
  %21 = load i32, i32* @dec_dlt, align 4
  call void @upzero(i32 %21, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dltx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bpl, i32 0, i32 0))
  %22 = load i32, i32* @dec_al1, align 4
  %23 = load i32, i32* @dec_al2, align 4
  %24 = load i32, i32* @dec_plt, align 4
  %25 = load i32, i32* @dec_plt1, align 4
  %26 = load i32, i32* @dec_plt2, align 4
  %call11 = call i32 @uppol2(i32 %22, i32 %23, i32 %24, i32 %25, i32 %26)
  store i32 %call11, i32* @dec_al2, align 4
  %27 = load i32, i32* @dec_al1, align 4
  %28 = load i32, i32* @dec_al2, align 4
  %29 = load i32, i32* @dec_plt, align 4
  %30 = load i32, i32* @dec_plt1, align 4
  %call12 = call i32 @uppol1(i32 %27, i32 %28, i32 %29, i32 %30)
  store i32 %call12, i32* @dec_al1, align 4
  %31 = load i32, i32* @dec_sl, align 4
  %32 = load i32, i32* @dec_dlt, align 4
  %add13 = add nsw i32 %31, %32
  store i32 %add13, i32* @dec_rlt, align 4
  %33 = load i32, i32* @dec_rlt1, align 4
  store i32 %33, i32* @dec_rlt2, align 4
  %34 = load i32, i32* @dec_rlt, align 4
  store i32 %34, i32* @dec_rlt1, align 4
  %35 = load i32, i32* @dec_plt1, align 4
  store i32 %35, i32* @dec_plt2, align 4
  %36 = load i32, i32* @dec_plt, align 4
  store i32 %36, i32* @dec_plt1, align 4
  %call14 = call i32 @filtez(i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bph, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dhx, i32 0, i32 0))
  store i32 %call14, i32* @dec_szh, align 4
  %37 = load i32, i32* @dec_rh1, align 4
  %38 = load i32, i32* @dec_ah1, align 4
  %39 = load i32, i32* @dec_rh2, align 4
  %40 = load i32, i32* @dec_ah2, align 4
  %call15 = call i32 @filtep(i32 %37, i32 %38, i32 %39, i32 %40)
  store i32 %call15, i32* @dec_sph, align 4
  %41 = load i32, i32* @dec_sph, align 4
  %42 = load i32, i32* @dec_szh, align 4
  %add16 = add nsw i32 %41, %42
  store i32 %add16, i32* @dec_sh, align 4
  %43 = load i32, i32* @dec_deth, align 4
  %44 = load i32, i32* @ih, align 4
  %arrayidx17 = getelementptr inbounds [4 x i32], [4 x i32]* @qq2_code2_table, i32 0, i32 %44
  %45 = load i32, i32* %arrayidx17, align 4
  %mul18 = mul nsw i32 %43, %45
  %shr19 = ashr i32 %mul18, 15
  store i32 %shr19, i32* @dec_dh, align 4
  %46 = load i32, i32* @ih, align 4
  %47 = load i32, i32* @dec_nbh, align 4
  %call20 = call i32 @logsch(i32 %46, i32 %47)
  store i32 %call20, i32* @dec_nbh, align 4
  %48 = load i32, i32* @dec_nbh, align 4
  %call21 = call i32 @scalel(i32 %48, i32 10)
  store i32 %call21, i32* @dec_deth, align 4
  %49 = load i32, i32* @dec_dh, align 4
  %50 = load i32, i32* @dec_szh, align 4
  %add22 = add nsw i32 %49, %50
  store i32 %add22, i32* @dec_ph, align 4
  %51 = load i32, i32* @dec_dh, align 4
  call void @upzero(i32 %51, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_dhx, i32 0, i32 0), i32* getelementptr inbounds ([6 x i32], [6 x i32]* @dec_del_bph, i32 0, i32 0))
  %52 = load i32, i32* @dec_ah1, align 4
  %53 = load i32, i32* @dec_ah2, align 4
  %54 = load i32, i32* @dec_ph, align 4
  %55 = load i32, i32* @dec_ph1, align 4
  %56 = load i32, i32* @dec_ph2, align 4
  %call23 = call i32 @uppol2(i32 %52, i32 %53, i32 %54, i32 %55, i32 %56)
  store i32 %call23, i32* @dec_ah2, align 4
  %57 = load i32, i32* @dec_ah1, align 4
  %58 = load i32, i32* @dec_ah2, align 4
  %59 = load i32, i32* @dec_ph, align 4
  %60 = load i32, i32* @dec_ph1, align 4
  %call24 = call i32 @uppol1(i32 %57, i32 %58, i32 %59, i32 %60)
  store i32 %call24, i32* @dec_ah1, align 4
  %61 = load i32, i32* @dec_sh, align 4
  %62 = load i32, i32* @dec_dh, align 4
  %add25 = add nsw i32 %61, %62
  store i32 %add25, i32* @rh, align 4
  %63 = load i32, i32* @dec_rh1, align 4
  store i32 %63, i32* @dec_rh2, align 4
  %64 = load i32, i32* @rh, align 4
  store i32 %64, i32* @dec_rh1, align 4
  %65 = load i32, i32* @dec_ph1, align 4
  store i32 %65, i32* @dec_ph2, align 4
  %66 = load i32, i32* @dec_ph, align 4
  store i32 %66, i32* @dec_ph1, align 4
  %67 = load i32, i32* @rl, align 4
  %68 = load i32, i32* @rh, align 4
  %sub = sub nsw i32 %67, %68
  store i32 %sub, i32* @xd, align 4
  %69 = load i32, i32* @rl, align 4
  %70 = load i32, i32* @rh, align 4
  %add26 = add nsw i32 %69, %70
  store i32 %add26, i32* @xs, align 4
  store i32* getelementptr inbounds ([24 x i32], [24 x i32]* @h, i32 0, i32 0), i32** %h_ptr, align 4
  store i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumc, i32 0, i32 0), i32** %ac_ptr, align 4
  store i32* getelementptr inbounds ([11 x i32], [11 x i32]* @accumd, i32 0, i32 0), i32** %ad_ptr, align 4
  %71 = load i32, i32* @xd, align 4
  %72 = load i32*, i32** %h_ptr, align 4
  %incdec.ptr = getelementptr inbounds i32, i32* %72, i32 1
  store i32* %incdec.ptr, i32** %h_ptr, align 4
  %73 = load i32, i32* %72, align 4
  %mul27 = mul nsw i32 %71, %73
  store i32 %mul27, i32* %xa1, align 4
  %74 = load i32, i32* @xs, align 4
  %75 = load i32*, i32** %h_ptr, align 4
  %incdec.ptr28 = getelementptr inbounds i32, i32* %75, i32 1
  store i32* %incdec.ptr28, i32** %h_ptr, align 4
  %76 = load i32, i32* %75, align 4
  %mul29 = mul nsw i32 %74, %76
  store i32 %mul29, i32* %xa2, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %77 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %77, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %78 = load i32*, i32** %ac_ptr, align 4
  %incdec.ptr30 = getelementptr inbounds i32, i32* %78, i32 1
  store i32* %incdec.ptr30, i32** %ac_ptr, align 4
  %79 = load i32, i32* %78, align 4
  %80 = load i32*, i32** %h_ptr, align 4
  %incdec.ptr31 = getelementptr inbounds i32, i32* %80, i32 1
  store i32* %incdec.ptr31, i32** %h_ptr, align 4
  %81 = load i32, i32* %80, align 4
  %mul32 = mul nsw i32 %79, %81
  %82 = load i32, i32* %xa1, align 4
  %add33 = add nsw i32 %82, %mul32
  store i32 %add33, i32* %xa1, align 4
  %83 = load i32*, i32** %ad_ptr, align 4
  %incdec.ptr34 = getelementptr inbounds i32, i32* %83, i32 1
  store i32* %incdec.ptr34, i32** %ad_ptr, align 4
  %84 = load i32, i32* %83, align 4
  %85 = load i32*, i32** %h_ptr, align 4
  %incdec.ptr35 = getelementptr inbounds i32, i32* %85, i32 1
  store i32* %incdec.ptr35, i32** %h_ptr, align 4
  %86 = load i32, i32* %85, align 4
  %mul36 = mul nsw i32 %84, %86
  %87 = load i32, i32* %xa2, align 4
  %add37 = add nsw i32 %87, %mul36
  store i32 %add37, i32* %xa2, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %88 = load i32, i32* %i, align 4
  %inc = add nsw i32 %88, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %89 = load i32*, i32** %ac_ptr, align 4
  %90 = load i32, i32* %89, align 4
  %91 = load i32*, i32** %h_ptr, align 4
  %incdec.ptr38 = getelementptr inbounds i32, i32* %91, i32 1
  store i32* %incdec.ptr38, i32** %h_ptr, align 4
  %92 = load i32, i32* %91, align 4
  %mul39 = mul nsw i32 %90, %92
  %93 = load i32, i32* %xa1, align 4
  %add40 = add nsw i32 %93, %mul39
  store i32 %add40, i32* %xa1, align 4
  %94 = load i32*, i32** %ad_ptr, align 4
  %95 = load i32, i32* %94, align 4
  %96 = load i32*, i32** %h_ptr, align 4
  %incdec.ptr41 = getelementptr inbounds i32, i32* %96, i32 1
  store i32* %incdec.ptr41, i32** %h_ptr, align 4
  %97 = load i32, i32* %96, align 4
  %mul42 = mul nsw i32 %95, %97
  %98 = load i32, i32* %xa2, align 4
  %add43 = add nsw i32 %98, %mul42
  store i32 %add43, i32* %xa2, align 4
  %99 = load i32, i32* %xa1, align 4
  %shr44 = ashr i32 %99, 14
  %100 = load i32*, i32** %xout.addr, align 4
  %arrayidx45 = getelementptr inbounds i32, i32* %100, i32 1
  store i32 %shr44, i32* %arrayidx45, align 4
  %101 = load i32, i32* %xa2, align 4
  %shr46 = ashr i32 %101, 14
  %102 = load i32*, i32** %xout.addr, align 4
  %arrayidx47 = getelementptr inbounds i32, i32* %102, i32 2
  store i32 %shr46, i32* %arrayidx47, align 4
  %103 = load i32*, i32** %ac_ptr, align 4
  %add.ptr = getelementptr inbounds i32, i32* %103, i32 -1
  store i32* %add.ptr, i32** %ac_ptr1, align 4
  %104 = load i32*, i32** %ad_ptr, align 4
  %add.ptr48 = getelementptr inbounds i32, i32* %104, i32 -1
  store i32* %add.ptr48, i32** %ad_ptr1, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond49

for.cond49:                                       ; preds = %for.inc56, %for.end
  %105 = load i32, i32* %i, align 4
  %cmp50 = icmp slt i32 %105, 10
  br i1 %cmp50, label %for.body51, label %for.end58

for.body51:                                       ; preds = %for.cond49
  %106 = load i32*, i32** %ac_ptr1, align 4
  %incdec.ptr52 = getelementptr inbounds i32, i32* %106, i32 -1
  store i32* %incdec.ptr52, i32** %ac_ptr1, align 4
  %107 = load i32, i32* %106, align 4
  %108 = load i32*, i32** %ac_ptr, align 4
  %incdec.ptr53 = getelementptr inbounds i32, i32* %108, i32 -1
  store i32* %incdec.ptr53, i32** %ac_ptr, align 4
  store i32 %107, i32* %108, align 4
  %109 = load i32*, i32** %ad_ptr1, align 4
  %incdec.ptr54 = getelementptr inbounds i32, i32* %109, i32 -1
  store i32* %incdec.ptr54, i32** %ad_ptr1, align 4
  %110 = load i32, i32* %109, align 4
  %111 = load i32*, i32** %ad_ptr, align 4
  %incdec.ptr55 = getelementptr inbounds i32, i32* %111, i32 -1
  store i32* %incdec.ptr55, i32** %ad_ptr, align 4
  store i32 %110, i32* %111, align 4
  br label %for.inc56

for.inc56:                                        ; preds = %for.body51
  %112 = load i32, i32* %i, align 4
  %inc57 = add nsw i32 %112, 1
  store i32 %inc57, i32* %i, align 4
  br label %for.cond49

for.end58:                                        ; preds = %for.cond49
  %113 = load i32, i32* @xd, align 4
  %114 = load i32*, i32** %ac_ptr, align 4
  store i32 %113, i32* %114, align 4
  %115 = load i32, i32* @xs, align 4
  %116 = load i32*, i32** %ad_ptr, align 4
  store i32 %115, i32* %116, align 4
  ret void
}

; Function Attrs: nounwind
define void @reset() #1 {
entry:
  %i = alloca i32, align 4
  store i32 32, i32* @dec_detl, align 4
  store i32 32, i32* @detl, align 4
  store i32 8, i32* @dec_deth, align 4
  store i32 8, i32* @deth, align 4
  store i32 0, i32* @rlt2, align 4
  store i32 0, i32* @rlt1, align 4
  store i32 0, i32* @plt2, align 4
  store i32 0, i32* @plt1, align 4
  store i32 0, i32* @al2, align 4
  store i32 0, i32* @al1, align 4
  store i32 0, i32* @nbl, align 4
  store i32 0, i32* @rh2, align 4
  store i32 0, i32* @rh1, align 4
  store i32 0, i32* @ph2, align 4
  store i32 0, i32* @ph1, align 4
  store i32 0, i32* @ah2, align 4
  store i32 0, i32* @ah1, align 4
  store i32 0, i32* @nbh, align 4
  store i32 0, i32* @dec_rlt2, align 4
  store i32 0, i32* @dec_rlt1, align 4
  store i32 0, i32* @dec_plt2, align 4
  store i32 0, i32* @dec_plt1, align 4
  store i32 0, i32* @dec_al2, align 4
  store i32 0, i32* @dec_al1, align 4
  store i32 0, i32* @dec_nbl, align 4
  store i32 0, i32* @dec_rh2, align 4
  store i32 0, i32* @dec_rh1, align 4
  store i32 0, i32* @dec_ph2, align 4
  store i32 0, i32* @dec_ph1, align 4
  store i32 0, i32* @dec_ah2, align 4
  store i32 0, i32* @dec_ah1, align 4
  store i32 0, i32* @dec_nbh, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 6
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [6 x i32], [6 x i32]* @delay_dltx, i32 0, i32 %1
  store i32 0, i32* %arrayidx, align 4
  %2 = load i32, i32* %i, align 4
  %arrayidx1 = getelementptr inbounds [6 x i32], [6 x i32]* @delay_dhx, i32 0, i32 %2
  store i32 0, i32* %arrayidx1, align 4
  %3 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_dltx, i32 0, i32 %3
  store i32 0, i32* %arrayidx2, align 4
  %4 = load i32, i32* %i, align 4
  %arrayidx3 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_dhx, i32 0, i32 %4
  store i32 0, i32* %arrayidx3, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc11, %for.end
  %6 = load i32, i32* %i, align 4
  %cmp5 = icmp slt i32 %6, 6
  br i1 %cmp5, label %for.body6, label %for.end13

for.body6:                                        ; preds = %for.cond4
  %7 = load i32, i32* %i, align 4
  %arrayidx7 = getelementptr inbounds [6 x i32], [6 x i32]* @delay_bpl, i32 0, i32 %7
  store i32 0, i32* %arrayidx7, align 4
  %8 = load i32, i32* %i, align 4
  %arrayidx8 = getelementptr inbounds [6 x i32], [6 x i32]* @delay_bph, i32 0, i32 %8
  store i32 0, i32* %arrayidx8, align 4
  %9 = load i32, i32* %i, align 4
  %arrayidx9 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_bpl, i32 0, i32 %9
  store i32 0, i32* %arrayidx9, align 4
  %10 = load i32, i32* %i, align 4
  %arrayidx10 = getelementptr inbounds [6 x i32], [6 x i32]* @dec_del_bph, i32 0, i32 %10
  store i32 0, i32* %arrayidx10, align 4
  br label %for.inc11

for.inc11:                                        ; preds = %for.body6
  %11 = load i32, i32* %i, align 4
  %inc12 = add nsw i32 %11, 1
  store i32 %inc12, i32* %i, align 4
  br label %for.cond4

for.end13:                                        ; preds = %for.cond4
  store i32 0, i32* %i, align 4
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc18, %for.end13
  %12 = load i32, i32* %i, align 4
  %cmp15 = icmp slt i32 %12, 23
  br i1 %cmp15, label %for.body16, label %for.end20

for.body16:                                       ; preds = %for.cond14
  %13 = load i32, i32* %i, align 4
  %arrayidx17 = getelementptr inbounds [24 x i32], [24 x i32]* @tqmf, i32 0, i32 %13
  store i32 0, i32* %arrayidx17, align 4
  br label %for.inc18

for.inc18:                                        ; preds = %for.body16
  %14 = load i32, i32* %i, align 4
  %inc19 = add nsw i32 %14, 1
  store i32 %inc19, i32* %i, align 4
  br label %for.cond14

for.end20:                                        ; preds = %for.cond14
  store i32 0, i32* %i, align 4
  br label %for.cond21

for.cond21:                                       ; preds = %for.inc26, %for.end20
  %15 = load i32, i32* %i, align 4
  %cmp22 = icmp slt i32 %15, 11
  br i1 %cmp22, label %for.body23, label %for.end28

for.body23:                                       ; preds = %for.cond21
  %16 = load i32, i32* %i, align 4
  %arrayidx24 = getelementptr inbounds [11 x i32], [11 x i32]* @accumc, i32 0, i32 %16
  store i32 0, i32* %arrayidx24, align 4
  %17 = load i32, i32* %i, align 4
  %arrayidx25 = getelementptr inbounds [11 x i32], [11 x i32]* @accumd, i32 0, i32 %17
  store i32 0, i32* %arrayidx25, align 4
  br label %for.inc26

for.inc26:                                        ; preds = %for.body23
  %18 = load i32, i32* %i, align 4
  %inc27 = add nsw i32 %18, 1
  store i32 %inc27, i32* %i, align 4
  br label %for.cond21

for.end28:                                        ; preds = %for.cond21
  ret void
}

; Function Attrs: nounwind
define i32 @invqxl(i32 %il, i32 %detl, i32* %code_table, i32 %mode) #1 {
entry:
  %il.addr = alloca i32, align 4
  %detl.addr = alloca i32, align 4
  %code_table.addr = alloca i32*, align 4
  %mode.addr = alloca i32, align 4
  %dlt = alloca i32, align 4
  store i32 %il, i32* %il.addr, align 4
  store i32 %detl, i32* %detl.addr, align 4
  store i32* %code_table, i32** %code_table.addr, align 4
  store i32 %mode, i32* %mode.addr, align 4
  %0 = load i32, i32* %detl.addr, align 4
  %1 = load i32, i32* %il.addr, align 4
  %2 = load i32, i32* %mode.addr, align 4
  %sub = sub nsw i32 %2, 1
  %shr = ashr i32 %1, %sub
  %3 = load i32*, i32** %code_table.addr, align 4
  %arrayidx = getelementptr inbounds i32, i32* %3, i32 %shr
  %4 = load i32, i32* %arrayidx, align 4
  %mul = mul nsw i32 %0, %4
  store i32 %mul, i32* %dlt, align 4
  %5 = load i32, i32* %dlt, align 4
  %shr1 = ashr i32 %5, 15
  ret i32 %shr1
}

; Function Attrs: nounwind
define i32 @invqah(i32 %ih, i32 %deth) #1 {
entry:
  %ih.addr = alloca i32, align 4
  %deth.addr = alloca i32, align 4
  %rdh = alloca i32, align 4
  store i32 %ih, i32* %ih.addr, align 4
  store i32 %deth, i32* %deth.addr, align 4
  %0 = load i32, i32* %deth.addr, align 4
  %1 = load i32, i32* %ih.addr, align 4
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* @qq2_code2_table, i32 0, i32 %1
  %2 = load i32, i32* %arrayidx, align 4
  %mul = mul nsw i32 %0, %2
  %shr = ashr i32 %mul, 15
  store i32 %shr, i32* %rdh, align 4
  %3 = load i32, i32* %rdh, align 4
  ret i32 %3
}

; Function Attrs: nounwind
define i32 @main() #1 {
entry:
  %retval = alloca i32, align 4
  %xout = alloca [3 x i32], align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %f = alloca i32, align 4
  store i32 0, i32* %retval
  call void @reset()
  store i32 10, i32* %j, align 4
  store i32 100, i32* %f, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 100
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4
  %div = sdiv i32 %1, 2
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* @main.compressed, i32 0, i32 %div
  %2 = load i32, i32* %arrayidx, align 4
  %arraydecay = getelementptr inbounds [3 x i32], [3 x i32]* %xout, i32 0, i32 0
  call void @decode(i32 %2, i32* %arraydecay)
  %arrayidx1 = getelementptr inbounds [3 x i32], [3 x i32]* %xout, i32 0, i32 1
  %3 = load i32, i32* %arrayidx1, align 4
  %4 = load i32, i32* %i, align 4
  %arrayidx2 = getelementptr inbounds [100 x i32], [100 x i32]* @main.result, i32 0, i32 %4
  store i32 %3, i32* %arrayidx2, align 4
  %arrayidx3 = getelementptr inbounds [3 x i32], [3 x i32]* %xout, i32 0, i32 2
  %5 = load i32, i32* %arrayidx3, align 4
  %6 = load i32, i32* %i, align 4
  %add = add nsw i32 %6, 1
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* @main.result, i32 0, i32 %add
  store i32 %5, i32* %arrayidx4, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4
  %add5 = add nsw i32 %7, 2
  store i32 %add5, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [3 x i32], [3 x i32]* %xout, i32 0, i32 1
  %8 = load i32, i32* %arrayidx6, align 4
  %cmp7 = icmp eq i32 %8, 11113
  br i1 %cmp7, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %for.end
  %arrayidx8 = getelementptr inbounds [3 x i32], [3 x i32]* %xout, i32 0, i32 2
  %9 = load i32, i32* %arrayidx8, align 4
  %cmp9 = icmp eq i32 %9, -11197
  br i1 %cmp9, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  store i32 66, i32* %retval
  br label %return

if.else:                                          ; preds = %land.lhs.true, %for.end
  store i32 15, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %10 = load i32, i32* %retval
  ret i32 %10
}

attributes #0 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"}
