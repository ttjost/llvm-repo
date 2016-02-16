; ModuleID = 'pocsag.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@hexword = common global i32 0, align 4
@s1 = common global i8 0, align 1
@s3 = common global i8 0, align 1
@error_code = common global i32 0, align 4
@alpha_inv = internal global [32 x i8] c"\00\00\01\12\02\05\13\0B\03\1D\06\1B\14\08\0C\17\04\0A\1E\11\07\16\1C\1A\15\19\09\10\0D\0E\18\0F", align 1
@roots = internal global [32 x i8] c"\00\80\03\80\06\80\01\80\80\07\80\0D\80\0F\80\1A\0C\80\0B\80\02\80\08\80\80\09\80\11\80\04\80\15", align 1
@alpha = internal global [31 x i8] c"\01\02\04\08\10\05\0A\14\0D\1A\11\07\0E\1C\1D\1F\1B\13\03\06\0C\18\15\0F\1E\19\17\0B\16\09\12", align 1
@parity = common global i32 0, align 4
@alpha3 = internal global [31 x i8] c"\01\08\0A\1A\0E\1F\03\18\1E\0B\12\04\05\0D\07\1D\13\0C\0F\17\09\02\10\14\11\1C\1B\06\15\19\16", align 1
@alpha_count = global i32 0, align 4
@err_tab = internal global [256 x i8] c"\00\01\01\02\01\02\02\03\01\02\02\03\02\03\03\04\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\04\05\05\06\05\06\06\07\05\06\06\07\06\07\07\08", align 1
@func = common global i32 0, align 4
@msg = common global [256 x i8] zeroinitializer, align 1
@alpha_data = global [59 x i32] [i32 -1433785686, i32 1431639365, i32 290805077, i32 -1432212822, i32 713730730, i32 1430345045, i32 -1347769686, i32 -178956971, i32 -1440044374, i32 1431655775, i32 1347769685, i32 1364546885, i32 -1431696726, i32 715827880, i32 -1427985750, i32 1431635262, i32 1269369600, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 978016306, i32 -1013571282, i32 -1727586298, i32 -427247506, i32 -1896091554, i32 -1863998050, i32 -249499081, i32 -472018082, i32 -1011792179, i32 1040951323, i32 -1755365779, i32 -758227266, i32 -81624664, i32 -2009403735, i32 -77474809, i32 -364801595, i32 -372266053, i32 -1759371701, i32 -1493403468, i32 -1936100664, i32 -1682857735, i32 -600291377, i32 -389762591, i32 -1010102491, i32 -1750714030, i32 -1978774231, i32 1045145627, i32 -1910820662, i32 -1146032902, i32 -1293030977, i32 -472659751, i32 -877329424, i32 -2019606789, i32 -1906509074, i32 1424611541], align 4
@numeric_data = global [41 x i32] [i32 -1433785686, i32 1431639365, i32 290805077, i32 -1432212822, i32 713730730, i32 1430345045, i32 -1347769686, i32 -178956971, i32 -1440044374, i32 1431655775, i32 1347769685, i32 1364546885, i32 -1431696726, i32 715827880, i32 -1427985750, i32 1431635262, i32 1266686720, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 940262823, i32 -1095236421, i32 -999779707, i32 -538793957, i32 -429624153, i32 -429496367, i32 -429512751, i32 -429496367, i32 -429496367, i32 1045137435, i32 -429496367, i32 -429496367, i32 -429496367, i32 -429496367, i32 -429496367, i32 -429496367, i32 1424546261], align 4
@.str = private unnamed_addr constant [28 x i8] c"Dear fellow ACP benchmarker\00", align 1

; Function Attrs: nounwind
define i32 @err_corr(i32 %datain) #0 {
entry:
  %datain.addr = alloca i32, align 4
  %locator_constant = alloca i8, align 1
  %root2 = alloca i8, align 1
  %root1 = alloca i8, align 1
  store i32 %datain, i32* %datain.addr, align 4
  %0 = load i32, i32* %datain.addr, align 4
  store i32 %0, i32* @hexword, align 4
  call void @find_syndromes()
  %1 = load i8, i8* @s1, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %2 = load i8, i8* @s3, align 1
  %conv2 = sext i8 %2 to i32
  %cmp3 = icmp eq i32 %conv2, 0
  br i1 %cmp3, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  store i32 0, i32* @error_code, align 4
  br label %if.end38

if.else:                                          ; preds = %land.lhs.true, %entry
  %call = call signext i8 @normalized_locator()
  store i8 %call, i8* %locator_constant, align 1
  %3 = load i8, i8* %locator_constant, align 1
  %conv5 = sext i8 %3 to i32
  %cmp6 = icmp eq i32 %conv5, 0
  br i1 %cmp6, label %if.then8, label %if.else9

if.then8:                                         ; preds = %if.else
  %4 = load i8, i8* @s1, align 1
  %idxprom = sext i8 %4 to i32
  %arrayidx = getelementptr inbounds [32 x i8], [32 x i8]* @alpha_inv, i32 0, i32 %idxprom
  %5 = load i8, i8* %arrayidx, align 1
  store i8 %5, i8* %root1, align 1
  %6 = load i8, i8* %root1, align 1
  call void @fix_bit(i8 signext %6)
  store i32 1, i32* @error_code, align 4
  br label %if.end37

if.else9:                                         ; preds = %if.else
  %7 = load i8, i8* %locator_constant, align 1
  %idxprom10 = sext i8 %7 to i32
  %arrayidx11 = getelementptr inbounds [32 x i8], [32 x i8]* @roots, i32 0, i32 %idxprom10
  %8 = load i8, i8* %arrayidx11, align 1
  store i8 %8, i8* %root1, align 1
  %9 = load i8, i8* %root1, align 1
  %conv12 = sext i8 %9 to i32
  %cmp13 = icmp slt i32 %conv12, 0
  br i1 %cmp13, label %if.then15, label %if.else16

if.then15:                                        ; preds = %if.else9
  store i32 4, i32* @error_code, align 4
  br label %if.end36

if.else16:                                        ; preds = %if.else9
  %10 = load i8, i8* @s1, align 1
  %idxprom17 = sext i8 %10 to i32
  %arrayidx18 = getelementptr inbounds [32 x i8], [32 x i8]* @alpha_inv, i32 0, i32 %idxprom17
  %11 = load i8, i8* %arrayidx18, align 1
  %conv19 = sext i8 %11 to i32
  %12 = load i8, i8* %root1, align 1
  %conv20 = sext i8 %12 to i32
  %add = add nsw i32 %conv19, %conv20
  %conv21 = trunc i32 %add to i8
  store i8 %conv21, i8* %root1, align 1
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.else16
  %13 = load i8, i8* %root1, align 1
  %conv22 = sext i8 %13 to i32
  %cmp23 = icmp sgt i32 %conv22, 30
  br i1 %cmp23, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %14 = load i8, i8* %root1, align 1
  %conv25 = sext i8 %14 to i32
  %sub = sub nsw i32 %conv25, 31
  %conv26 = trunc i32 %sub to i8
  store i8 %conv26, i8* %root1, align 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %15 = load i8, i8* %root1, align 1
  call void @fix_bit(i8 signext %15)
  %16 = load i8, i8* @s1, align 1
  %conv27 = sext i8 %16 to i32
  %17 = load i8, i8* %root1, align 1
  %idxprom28 = sext i8 %17 to i32
  %arrayidx29 = getelementptr inbounds [31 x i8], [31 x i8]* @alpha, i32 0, i32 %idxprom28
  %18 = load i8, i8* %arrayidx29, align 1
  %conv30 = sext i8 %18 to i32
  %xor = xor i32 %conv27, %conv30
  %conv31 = trunc i32 %xor to i8
  store i8 %conv31, i8* %root2, align 1
  %19 = load i8, i8* %root2, align 1
  %idxprom32 = sext i8 %19 to i32
  %arrayidx33 = getelementptr inbounds [32 x i8], [32 x i8]* @alpha_inv, i32 0, i32 %idxprom32
  %20 = load i8, i8* %arrayidx33, align 1
  store i8 %20, i8* %root2, align 1
  %21 = load i8, i8* %root2, align 1
  call void @fix_bit(i8 signext %21)
  %22 = load i32, i32* @parity, align 4
  %tobool = icmp ne i32 %22, 0
  br i1 %tobool, label %if.then34, label %if.else35

if.then34:                                        ; preds = %while.end
  store i32 3, i32* @error_code, align 4
  br label %if.end

if.else35:                                        ; preds = %while.end
  store i32 2, i32* @error_code, align 4
  br label %if.end

if.end:                                           ; preds = %if.else35, %if.then34
  br label %if.end36

if.end36:                                         ; preds = %if.end, %if.then15
  br label %if.end37

if.end37:                                         ; preds = %if.end36, %if.then8
  br label %if.end38

if.end38:                                         ; preds = %if.end37, %if.then
  %23 = load i32, i32* @hexword, align 4
  ret i32 %23
}

; Function Attrs: nounwind
define void @find_syndromes() #0 {
entry:
  %mask = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 -2147483648, i32* %mask, align 4
  store i8 0, i8* @s1, align 1
  store i8 0, i8* @s3, align 1
  %0 = load i32, i32* @hexword, align 4
  %and = and i32 %0, 1
  store i32 %and, i32* @parity, align 4
  store i32 30, i32* %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %1 = load i32, i32* %i, align 4
  %cmp = icmp sge i32 %1, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i32, i32* @hexword, align 4
  %3 = load i32, i32* %mask, align 4
  %and1 = and i32 %2, %3
  %tobool = icmp ne i32 %and1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %4 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [31 x i8], [31 x i8]* @alpha, i32 0, i32 %4
  %5 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %5 to i32
  %6 = load i8, i8* @s1, align 1
  %conv2 = sext i8 %6 to i32
  %xor = xor i32 %conv2, %conv
  %conv3 = trunc i32 %xor to i8
  store i8 %conv3, i8* @s1, align 1
  %7 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds [31 x i8], [31 x i8]* @alpha3, i32 0, i32 %7
  %8 = load i8, i8* %arrayidx4, align 1
  %conv5 = sext i8 %8 to i32
  %9 = load i8, i8* @s3, align 1
  %conv6 = sext i8 %9 to i32
  %xor7 = xor i32 %conv6, %conv5
  %conv8 = trunc i32 %xor7 to i8
  store i8 %conv8, i8* @s3, align 1
  %10 = load i32, i32* @parity, align 4
  %inc = add i32 %10, 1
  store i32 %inc, i32* @parity, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body
  %11 = load i32, i32* %mask, align 4
  %shr = lshr i32 %11, 1
  store i32 %shr, i32* %mask, align 4
  %12 = load i32, i32* %i, align 4
  %dec = add nsw i32 %12, -1
  store i32 %dec, i32* %i, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %13 = load i32, i32* @parity, align 4
  %and9 = and i32 %13, 1
  store i32 %and9, i32* @parity, align 4
  ret void
}

; Function Attrs: nounwind
define signext i8 @normalized_locator() #0 {
entry:
  %power_s1 = alloca i8, align 1
  %tau = alloca i8, align 1
  %0 = load i8, i8* @s1, align 1
  %idxprom = sext i8 %0 to i32
  %arrayidx = getelementptr inbounds [32 x i8], [32 x i8]* @alpha_inv, i32 0, i32 %idxprom
  %1 = load i8, i8* %arrayidx, align 1
  store i8 %1, i8* %power_s1, align 1
  %2 = load i8, i8* @s3, align 1
  %idxprom1 = sext i8 %2 to i32
  %arrayidx2 = getelementptr inbounds [32 x i8], [32 x i8]* @alpha_inv, i32 0, i32 %idxprom1
  %3 = load i8, i8* %arrayidx2, align 1
  %conv = sext i8 %3 to i32
  %4 = load i8, i8* %power_s1, align 1
  %conv3 = sext i8 %4 to i32
  %sub = sub nsw i32 %conv, %conv3
  %5 = load i8, i8* %power_s1, align 1
  %conv4 = sext i8 %5 to i32
  %sub5 = sub nsw i32 %sub, %conv4
  %6 = load i8, i8* %power_s1, align 1
  %conv6 = sext i8 %6 to i32
  %sub7 = sub nsw i32 %sub5, %conv6
  %conv8 = trunc i32 %sub7 to i8
  store i8 %conv8, i8* %tau, align 1
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %7 = load i8, i8* %tau, align 1
  %conv9 = sext i8 %7 to i32
  %cmp = icmp slt i32 %conv9, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %8 = load i8, i8* %tau, align 1
  %conv11 = sext i8 %8 to i32
  %add = add nsw i32 %conv11, 31
  %conv12 = trunc i32 %add to i8
  store i8 %conv12, i8* %tau, align 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %9 = load i8, i8* %tau, align 1
  %idxprom13 = sext i8 %9 to i32
  %arrayidx14 = getelementptr inbounds [31 x i8], [31 x i8]* @alpha, i32 0, i32 %idxprom13
  %10 = load i8, i8* %arrayidx14, align 1
  %conv15 = sext i8 %10 to i32
  %xor = xor i32 %conv15, 1
  %conv16 = trunc i32 %xor to i8
  ret i8 %conv16
}

; Function Attrs: nounwind
define void @fix_bit(i8 signext %eroot) #0 {
entry:
  %eroot.addr = alloca i8, align 1
  store i8 %eroot, i8* %eroot.addr, align 1
  %0 = load i8, i8* %eroot.addr, align 1
  %inc = add i8 %0, 1
  store i8 %inc, i8* %eroot.addr, align 1
  %1 = load i32, i32* @hexword, align 4
  %2 = load i8, i8* %eroot.addr, align 1
  %conv = sext i8 %2 to i32
  %shl = shl i32 1, %conv
  %xor = xor i32 %1, %shl
  store i32 %xor, i32* @hexword, align 4
  ret void
}

; Function Attrs: nounwind
define i32 @comp32(i32 %sample, i32 %reference) #0 {
entry:
  %sample.addr = alloca i32, align 4
  %reference.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %num_err = alloca i32, align 4
  store i32 %sample, i32* %sample.addr, align 4
  store i32 %reference, i32* %reference.addr, align 4
  %0 = load i32, i32* %sample.addr, align 4
  %1 = load i32, i32* %reference.addr, align 4
  %xor = xor i32 %0, %1
  store i32 %xor, i32* %sample.addr, align 4
  store i32 0, i32* %num_err, align 4
  store i32 4, i32* %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %2 = load i32, i32* %i, align 4
  %cmp = icmp sgt i32 %2, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load i32, i32* %num_err, align 4
  %4 = load i32, i32* %sample.addr, align 4
  %conv = trunc i32 %4 to i8
  %idxprom = zext i8 %conv to i32
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %idxprom
  %5 = load i8, i8* %arrayidx, align 1
  %conv1 = zext i8 %5 to i32
  %add = add nsw i32 %3, %conv1
  store i32 %add, i32* %num_err, align 4
  %6 = load i32, i32* %sample.addr, align 4
  %shr = lshr i32 %6, 8
  store i32 %shr, i32* %sample.addr, align 4
  %7 = load i32, i32* %i, align 4
  %dec = add nsw i32 %7, -1
  store i32 %dec, i32* %i, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %8 = load i32, i32* %num_err, align 4
  ret i32 %8
}

; Function Attrs: nounwind
define i32* @sync_find(i32* %dptr) #0 {
entry:
  %retval = alloca i32*, align 4
  %dptr.addr = alloca i32*, align 4
  %num_err = alloca i32, align 4
  %sync_window = alloca i32, align 4
  %bit_cnt = alloca i32, align 4
  %sample1 = alloca i32, align 4
  %sample2 = alloca i32, align 4
  store i32* %dptr, i32** %dptr.addr, align 4
  store i32 18, i32* %sync_window, align 4
  %0 = load i32*, i32** %dptr.addr, align 4
  %incdec.ptr = getelementptr inbounds i32, i32* %0, i32 1
  store i32* %incdec.ptr, i32** %dptr.addr, align 4
  %1 = load i32, i32* %0, align 4
  store i32 %1, i32* %sample1, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.end, %entry
  %2 = load i32, i32* %sync_window, align 4
  %cmp = icmp sgt i32 %2, 0
  br i1 %cmp, label %while.body, label %while.end13

while.body:                                       ; preds = %while.cond
  %3 = load i32*, i32** %dptr.addr, align 4
  %incdec.ptr1 = getelementptr inbounds i32, i32* %3, i32 1
  store i32* %incdec.ptr1, i32** %dptr.addr, align 4
  %4 = load i32, i32* %3, align 4
  store i32 %4, i32* %sample2, align 4
  store i32 0, i32* %bit_cnt, align 4
  br label %while.cond2

while.cond2:                                      ; preds = %if.end12, %while.body
  %5 = load i32, i32* %bit_cnt, align 4
  %cmp3 = icmp slt i32 %5, 32
  br i1 %cmp3, label %while.body4, label %while.end

while.body4:                                      ; preds = %while.cond2
  %6 = load i32, i32* %sample1, align 4
  %call = call i32 @comp32(i32 %6, i32 1045145627)
  store i32 %call, i32* %num_err, align 4
  %7 = load i32, i32* %num_err, align 4
  %cmp5 = icmp sle i32 %7, 2
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %while.body4
  %8 = load i32*, i32** %dptr.addr, align 4
  store i32* %8, i32** %retval
  br label %return

if.end:                                           ; preds = %while.body4
  %9 = load i32, i32* %sample1, align 4
  %call6 = call i32 @comp32(i32 %9, i32 -1431655766)
  store i32 %call6, i32* %num_err, align 4
  %10 = load i32, i32* %num_err, align 4
  %cmp7 = icmp sle i32 %10, 2
  br i1 %cmp7, label %if.then9, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end
  %11 = load i32, i32* %num_err, align 4
  %cmp8 = icmp sge i32 %11, 30
  br i1 %cmp8, label %if.then9, label %if.else

if.then9:                                         ; preds = %lor.lhs.false, %if.end
  %12 = load i32, i32* %sample2, align 4
  %13 = load i32, i32* %bit_cnt, align 4
  %shr = lshr i32 %12, %13
  store i32 %shr, i32* %sample1, align 4
  store i32 19, i32* %sync_window, align 4
  br label %while.end

if.else:                                          ; preds = %lor.lhs.false
  %14 = load i32, i32* %sample1, align 4
  %shl = shl i32 %14, 1
  %15 = load i32, i32* %sample2, align 4
  %shr10 = lshr i32 %15, 31
  %or = or i32 %shl, %shr10
  store i32 %or, i32* %sample1, align 4
  %16 = load i32, i32* %sample2, align 4
  %shl11 = shl i32 %16, 1
  store i32 %shl11, i32* %sample2, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.else
  %17 = load i32, i32* %bit_cnt, align 4
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %bit_cnt, align 4
  br label %while.cond2

while.end:                                        ; preds = %if.then9, %while.cond2
  %18 = load i32, i32* %sync_window, align 4
  %dec = add nsw i32 %18, -1
  store i32 %dec, i32* %sync_window, align 4
  br label %while.cond

while.end13:                                      ; preds = %while.cond
  store i32* null, i32** %retval
  br label %return

return:                                           ; preds = %while.end13, %if.then
  %19 = load i32*, i32** %retval
  ret i32* %19
}

; Function Attrs: nounwind
define i32 @addr_corr(i32 %data) #0 {
entry:
  %retval = alloca i32, align 4
  %data.addr = alloca i32, align 4
  %num_err = alloca i32, align 4
  %addr = alloca i32, align 4
  %capcode = alloca i32, align 4
  store i32 %data, i32* %data.addr, align 4
  store i32 173902, i32* %capcode, align 4
  %0 = load i32, i32* %data.addr, align 4
  %shr = lshr i32 %0, 13
  store i32 %shr, i32* %addr, align 4
  %1 = load i32, i32* %addr, align 4
  %2 = load i32, i32* %capcode, align 4
  %call = call i32 @comp32(i32 %1, i32 %2)
  store i32 %call, i32* %num_err, align 4
  %3 = load i32, i32* %num_err, align 4
  %cmp = icmp sgt i32 %3, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 119386, i32* %capcode, align 4
  %4 = load i32, i32* %addr, align 4
  %5 = load i32, i32* %capcode, align 4
  %call1 = call i32 @comp32(i32 %4, i32 %5)
  store i32 %call1, i32* %num_err, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %6 = load i32, i32* %num_err, align 4
  %cmp2 = icmp sle i32 %6, 2
  br i1 %cmp2, label %if.then3, label %if.end18

if.then3:                                         ; preds = %if.end
  %7 = load i32, i32* %data.addr, align 4
  %call4 = call i32 @err_corr(i32 %7)
  store i32 %call4, i32* %data.addr, align 4
  %8 = load i32, i32* @error_code, align 4
  %cmp5 = icmp slt i32 %8, 3
  br i1 %cmp5, label %if.then6, label %if.end17

if.then6:                                         ; preds = %if.then3
  %9 = load i32, i32* @error_code, align 4
  %cmp7 = icmp ne i32 %9, 0
  br i1 %cmp7, label %if.then8, label %if.end11

if.then8:                                         ; preds = %if.then6
  %10 = load i32, i32* %data.addr, align 4
  %shr9 = lshr i32 %10, 13
  store i32 %shr9, i32* %addr, align 4
  %11 = load i32, i32* %addr, align 4
  %12 = load i32, i32* %capcode, align 4
  %call10 = call i32 @comp32(i32 %11, i32 %12)
  store i32 %call10, i32* %num_err, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.then8, %if.then6
  %13 = load i32, i32* %num_err, align 4
  %cmp12 = icmp eq i32 %13, 0
  br i1 %cmp12, label %if.then13, label %if.end16

if.then13:                                        ; preds = %if.end11
  %14 = load i32, i32* %data.addr, align 4
  %shr14 = lshr i32 %14, 11
  %and = and i32 %shr14, 3
  %conv = trunc i32 %and to i8
  %conv15 = zext i8 %conv to i32
  store i32 %conv15, i32* @func, align 4
  store i32 1, i32* %retval
  br label %return

if.end16:                                         ; preds = %if.end11
  br label %if.end17

if.end17:                                         ; preds = %if.end16, %if.then3
  br label %if.end18

if.end18:                                         ; preds = %if.end17, %if.end
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %if.end18, %if.then13
  %15 = load i32, i32* %retval
  ret i32 %15
}

; Function Attrs: nounwind
define i32 @num_proc(i32 %i, i32 %codeword) #0 {
entry:
  %i.addr = alloca i32, align 4
  %codeword.addr = alloca i32, align 4
  %count = alloca i32, align 4
  %shift = alloca i32, align 4
  %digit = alloca i8, align 1
  store i32 %i, i32* %i.addr, align 4
  store i32 %codeword, i32* %codeword.addr, align 4
  store i32 5, i32* %count, align 4
  store i32 0, i32* %shift, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end12, %entry
  %0 = load i32, i32* %count, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i32, i32* %codeword.addr, align 4
  %2 = load i32, i32* %shift, align 4
  %shr = lshr i32 %1, %2
  %and = and i32 %shr, 15
  %conv = trunc i32 %and to i8
  store i8 %conv, i8* %digit, align 1
  %3 = load i32, i32* @error_code, align 4
  %cmp1 = icmp slt i32 %3, 3
  br i1 %cmp1, label %if.then, label %if.else10

if.then:                                          ; preds = %while.body
  %4 = load i8, i8* %digit, align 1
  %conv3 = zext i8 %4 to i32
  %cmp4 = icmp slt i32 %conv3, 10
  br i1 %cmp4, label %if.then6, label %if.else

if.then6:                                         ; preds = %if.then
  %5 = load i8, i8* %digit, align 1
  %conv7 = zext i8 %5 to i32
  %add = add nsw i32 %conv7, 48
  %conv8 = trunc i32 %add to i8
  %6 = load i32, i32* %i.addr, align 4
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %6
  store i8 %conv8, i8* %arrayidx, align 1
  br label %if.end

if.else:                                          ; preds = %if.then
  %7 = load i8, i8* %digit, align 1
  %8 = load i32, i32* %i.addr, align 4
  %arrayidx9 = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %8
  store i8 %7, i8* %arrayidx9, align 1
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then6
  br label %if.end12

if.else10:                                        ; preds = %while.body
  %9 = load i32, i32* %i.addr, align 4
  %arrayidx11 = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %9
  store i8 -128, i8* %arrayidx11, align 1
  br label %if.end12

if.end12:                                         ; preds = %if.else10, %if.end
  %10 = load i32, i32* %shift, align 4
  %add13 = add nsw i32 %10, 4
  store i32 %add13, i32* %shift, align 4
  %11 = load i32, i32* %i.addr, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %i.addr, align 4
  %12 = load i32, i32* %count, align 4
  %dec = add nsw i32 %12, -1
  store i32 %dec, i32* %count, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %13 = load i32, i32* %i.addr, align 4
  ret i32 %13
}

; Function Attrs: nounwind
define i32 @alpha_proc(i32 %i, i32 %codeword) #0 {
entry:
  %i.addr = alloca i32, align 4
  %codeword.addr = alloca i32, align 4
  %num_bits_left = alloca i32, align 4
  %rem_bits = alloca i8, align 1
  %char_count = alloca i32, align 4
  %char_shift = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  store i32 %codeword, i32* %codeword.addr, align 4
  store i32 3, i32* %char_count, align 4
  store i32 0, i32* %char_shift, align 4
  %0 = load i32, i32* @alpha_count, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end9

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @alpha_count, align 4
  %sub = sub nsw i32 7, %1
  store i32 %sub, i32* %num_bits_left, align 4
  %2 = load i32, i32* %codeword.addr, align 4
  %3 = load i32, i32* %num_bits_left, align 4
  %shl = shl i32 %2, %3
  %conv = trunc i32 %shl to i8
  store i8 %conv, i8* %rem_bits, align 1
  %4 = load i32, i32* @error_code, align 4
  %cmp1 = icmp slt i32 %4, 3
  br i1 %cmp1, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.then
  %5 = load i32, i32* %i.addr, align 4
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %5
  %6 = load i8, i8* %arrayidx, align 1
  %conv4 = zext i8 %6 to i32
  %7 = load i8, i8* %rem_bits, align 1
  %conv5 = zext i8 %7 to i32
  %or = or i32 %conv4, %conv5
  %and = and i32 %or, 127
  %conv6 = trunc i32 %and to i8
  %8 = load i32, i32* %i.addr, align 4
  %arrayidx7 = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %8
  store i8 %conv6, i8* %arrayidx7, align 1
  br label %if.end

if.else:                                          ; preds = %if.then
  %9 = load i32, i32* %i.addr, align 4
  %arrayidx8 = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %9
  store i8 -128, i8* %arrayidx8, align 1
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then3
  %10 = load i32, i32* %i.addr, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i.addr, align 4
  %11 = load i32, i32* @alpha_count, align 4
  store i32 %11, i32* %char_shift, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.end, %entry
  br label %while.cond

while.cond:                                       ; preds = %if.end20, %if.end9
  %12 = load i32, i32* %char_count, align 4
  %cmp10 = icmp sgt i32 %12, 0
  br i1 %cmp10, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %13 = load i32, i32* @error_code, align 4
  %cmp12 = icmp slt i32 %13, 3
  br i1 %cmp12, label %if.then14, label %if.else18

if.then14:                                        ; preds = %while.body
  %14 = load i32, i32* %codeword.addr, align 4
  %15 = load i32, i32* %char_shift, align 4
  %shr = lshr i32 %14, %15
  %and15 = and i32 %shr, 127
  %conv16 = trunc i32 %and15 to i8
  %16 = load i32, i32* %i.addr, align 4
  %arrayidx17 = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %16
  store i8 %conv16, i8* %arrayidx17, align 1
  br label %if.end20

if.else18:                                        ; preds = %while.body
  %17 = load i32, i32* %i.addr, align 4
  %arrayidx19 = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %17
  store i8 -128, i8* %arrayidx19, align 1
  br label %if.end20

if.end20:                                         ; preds = %if.else18, %if.then14
  %18 = load i32, i32* %char_shift, align 4
  %add = add nsw i32 %18, 7
  store i32 %add, i32* %char_shift, align 4
  %19 = load i32, i32* %i.addr, align 4
  %inc21 = add nsw i32 %19, 1
  store i32 %inc21, i32* %i.addr, align 4
  %20 = load i32, i32* %char_count, align 4
  %dec = add nsw i32 %20, -1
  store i32 %dec, i32* %char_count, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %21 = load i32, i32* %i.addr, align 4
  %dec22 = add nsw i32 %21, -1
  store i32 %dec22, i32* %i.addr, align 4
  %22 = load i32, i32* @alpha_count, align 4
  %cmp23 = icmp eq i32 %22, 6
  br i1 %cmp23, label %if.then25, label %if.else26

if.then25:                                        ; preds = %while.end
  store i32 0, i32* @alpha_count, align 4
  br label %if.end28

if.else26:                                        ; preds = %while.end
  %23 = load i32, i32* @alpha_count, align 4
  %inc27 = add nsw i32 %23, 1
  store i32 %inc27, i32* @alpha_count, align 4
  br label %if.end28

if.end28:                                         ; preds = %if.else26, %if.then25
  %24 = load i32, i32* %i.addr, align 4
  ret i32 %24
}

; Function Attrs: nounwind
define i32 @msg_proc(i32* %dptr) #0 {
entry:
  %retval = alloca i32, align 4
  %dptr.addr = alloca i32*, align 4
  %i = alloca i32, align 4
  %word_count = alloca i32, align 4
  %num_bad_sync = alloca i32, align 4
  %num_err = alloca i32, align 4
  %addr_search_mode = alloca i32, align 4
  %addr = alloca i32, align 4
  %data = alloca i32, align 4
  store i32* %dptr, i32** %dptr.addr, align 4
  store i32 0, i32* %i, align 4
  store i32 0, i32* %word_count, align 4
  store i32 0, i32* %num_bad_sync, align 4
  store i32 1, i32* %addr_search_mode, align 4
  br label %while.body

while.body:                                       ; preds = %entry, %if.end41
  %0 = load i32*, i32** %dptr.addr, align 4
  %incdec.ptr = getelementptr inbounds i32, i32* %0, i32 1
  store i32* %incdec.ptr, i32** %dptr.addr, align 4
  %1 = load i32, i32* %0, align 4
  store i32 %1, i32* %data, align 4
  %2 = load i32, i32* %word_count, align 4
  %cmp = icmp eq i32 %2, 16
  br i1 %cmp, label %if.then, label %if.else7

if.then:                                          ; preds = %while.body
  %3 = load i32, i32* %data, align 4
  %call = call i32 @comp32(i32 %3, i32 1045145627)
  store i32 %call, i32* %num_err, align 4
  %4 = load i32, i32* %num_err, align 4
  %cmp1 = icmp sle i32 %4, 2
  br i1 %cmp1, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.then
  store i32 0, i32* %num_bad_sync, align 4
  br label %if.end6

if.else:                                          ; preds = %if.then
  %5 = load i32, i32* %num_bad_sync, align 4
  %cmp3 = icmp eq i32 %5, 1
  br i1 %cmp3, label %if.then4, label %if.else5

if.then4:                                         ; preds = %if.else
  %6 = load i32, i32* %i, align 4
  store i32 %6, i32* %retval
  br label %return

if.else5:                                         ; preds = %if.else
  %7 = load i32, i32* %num_bad_sync, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %num_bad_sync, align 4
  br label %if.end

if.end:                                           ; preds = %if.else5
  br label %if.end6

if.end6:                                          ; preds = %if.end, %if.then2
  store i32 0, i32* %word_count, align 4
  br label %if.end41

if.else7:                                         ; preds = %while.body
  %8 = load i32, i32* %addr_search_mode, align 4
  %tobool = icmp ne i32 %8, 0
  br i1 %tobool, label %if.then8, label %if.else17

if.then8:                                         ; preds = %if.else7
  %9 = load i32, i32* %word_count, align 4
  %cmp9 = icmp eq i32 %9, 6
  br i1 %cmp9, label %if.then11, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then8
  %10 = load i32, i32* %word_count, align 4
  %cmp10 = icmp eq i32 %10, 7
  br i1 %cmp10, label %if.then11, label %if.end16

if.then11:                                        ; preds = %lor.lhs.false, %if.then8
  %11 = load i32, i32* %data, align 4
  %call12 = call i32 @addr_corr(i32 %11)
  %tobool13 = icmp ne i32 %call12, 0
  br i1 %tobool13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.then11
  store i32 0, i32* %addr_search_mode, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %if.then11
  br label %if.end16

if.end16:                                         ; preds = %if.end15, %lor.lhs.false
  br label %if.end39

if.else17:                                        ; preds = %if.else7
  %12 = load i32, i32* %data, align 4
  %call18 = call i32 @err_corr(i32 %12)
  store i32 %call18, i32* %data, align 4
  %13 = load i32, i32* %word_count, align 4
  %cmp19 = icmp eq i32 %13, 6
  br i1 %cmp19, label %if.then22, label %lor.lhs.false20

lor.lhs.false20:                                  ; preds = %if.else17
  %14 = load i32, i32* %word_count, align 4
  %cmp21 = icmp eq i32 %14, 7
  br i1 %cmp21, label %if.then22, label %if.end34

if.then22:                                        ; preds = %lor.lhs.false20, %if.else17
  store i32 1, i32* %num_err, align 4
  %15 = load i32, i32* @error_code, align 4
  %cmp23 = icmp slt i32 %15, 3
  br i1 %cmp23, label %if.then24, label %if.end30

if.then24:                                        ; preds = %if.then22
  %16 = load i32, i32* %data, align 4
  %shr = lshr i32 %16, 13
  store i32 %shr, i32* %addr, align 4
  %17 = load i32, i32* %addr, align 4
  %call25 = call i32 @comp32(i32 %17, i32 173902)
  store i32 %call25, i32* %num_err, align 4
  %18 = load i32, i32* %num_err, align 4
  %tobool26 = icmp ne i32 %18, 0
  br i1 %tobool26, label %if.then27, label %if.end29

if.then27:                                        ; preds = %if.then24
  %19 = load i32, i32* %addr, align 4
  %call28 = call i32 @comp32(i32 %19, i32 119386)
  store i32 %call28, i32* %num_err, align 4
  br label %if.end29

if.end29:                                         ; preds = %if.then27, %if.then24
  br label %if.end30

if.end30:                                         ; preds = %if.end29, %if.then22
  %20 = load i32, i32* %num_err, align 4
  %cmp31 = icmp eq i32 %20, 0
  br i1 %cmp31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.end30
  %21 = load i32, i32* %i, align 4
  store i32 %21, i32* %retval
  br label %return

if.end33:                                         ; preds = %if.end30
  br label %if.end34

if.end34:                                         ; preds = %if.end33, %lor.lhs.false20
  %22 = load i32, i32* %data, align 4
  %shr35 = lshr i32 %22, 11
  %and = and i32 %shr35, 1048575
  store i32 %and, i32* %data, align 4
  %23 = load i32, i32* @func, align 4
  switch i32 %23, label %sw.default [
    i32 0, label %sw.bb
    i32 3, label %sw.bb37
  ]

sw.bb:                                            ; preds = %if.end34
  %24 = load i32, i32* %i, align 4
  %25 = load i32, i32* %data, align 4
  %call36 = call i32 @num_proc(i32 %24, i32 %25)
  store i32 %call36, i32* %i, align 4
  br label %sw.epilog

sw.bb37:                                          ; preds = %if.end34
  %26 = load i32, i32* %i, align 4
  %27 = load i32, i32* %data, align 4
  %call38 = call i32 @alpha_proc(i32 %26, i32 %27)
  store i32 %call38, i32* %i, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %if.end34
  store i32 0, i32* %retval
  br label %return

sw.epilog:                                        ; preds = %sw.bb37, %sw.bb
  br label %if.end39

if.end39:                                         ; preds = %sw.epilog, %if.end16
  %28 = load i32, i32* %word_count, align 4
  %inc40 = add nsw i32 %28, 1
  store i32 %inc40, i32* %word_count, align 4
  br label %if.end41

if.end41:                                         ; preds = %if.end39, %if.end6
  br label %while.body

return:                                           ; preds = %sw.default, %if.then32, %if.then4
  %29 = load i32, i32* %retval
  ret i32 %29
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %dptr = alloca i32*, align 4
  %msg_length = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %j, align 4
  %cmp = icmp slt i32 %0, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store i32 0, i32* @alpha_count, align 4
  %1 = load i32, i32* %j, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %for.body
  store i32* getelementptr inbounds ([41 x i32], [41 x i32]* @numeric_data, i32 0, i32 0), i32** %dptr, align 4
  br label %if.end

if.else:                                          ; preds = %for.body
  store i32* getelementptr inbounds ([59 x i32], [59 x i32]* @alpha_data, i32 0, i32 0), i32** %dptr, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i32*, i32** %dptr, align 4
  %call = call i32* @sync_find(i32* %2)
  %cmp1 = icmp ne i32* %call, null
  br i1 %cmp1, label %if.then2, label %if.else13

if.then2:                                         ; preds = %if.end
  %3 = load i32*, i32** %dptr, align 4
  %call3 = call i32* @sync_find(i32* %3)
  %call4 = call i32 @msg_proc(i32* %call3)
  store i32 %call4, i32* %msg_length, align 4
  %4 = load i32, i32* @func, align 4
  %cmp5 = icmp eq i32 %4, 0
  br i1 %cmp5, label %if.then6, label %if.else7

if.then6:                                         ; preds = %if.then2
  br label %if.end12

if.else7:                                         ; preds = %if.then2
  %5 = load i32, i32* @func, align 4
  %cmp8 = icmp eq i32 %5, 3
  br i1 %cmp8, label %if.then9, label %if.else10

if.then9:                                         ; preds = %if.else7
  br label %if.end11

if.else10:                                        ; preds = %if.else7
  store i32 15, i32* %retval
  br label %return

if.end11:                                         ; preds = %if.then9
  br label %if.end12

if.end12:                                         ; preds = %if.end11, %if.then6
  br label %if.end14

if.else13:                                        ; preds = %if.end
  store i32 15, i32* %retval
  br label %return

if.end14:                                         ; preds = %if.end12
  br label %for.inc

for.inc:                                          ; preds = %if.end14
  %6 = load i32, i32* %j, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call15 = call i32 @strncmp(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @msg, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str, i32 0, i32 0), i32 27)
  %cmp16 = icmp eq i32 %call15, 0
  br i1 %cmp16, label %land.lhs.true, label %if.else19

land.lhs.true:                                    ; preds = %for.end
  %7 = load i32, i32* %msg_length, align 4
  %cmp17 = icmp eq i32 %7, 88
  br i1 %cmp17, label %if.then18, label %if.else19

if.then18:                                        ; preds = %land.lhs.true
  store i32 66, i32* %retval
  br label %return

if.else19:                                        ; preds = %land.lhs.true, %for.end
  store i32 15, i32* %retval
  br label %return

return:                                           ; preds = %if.else19, %if.then18, %if.else13, %if.else10
  %8 = load i32, i32* %retval
  ret i32 %8
}

declare i32 @strncmp(i8*, i8*, i32) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"}
