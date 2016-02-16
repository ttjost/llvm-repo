; ModuleID = 'pocsag.c'
target datalayout = "e-m:o-p:32:32-f64:32:64-f80:128-n8:16:32-S128"
target triple = "i386-apple-macosx10.11.0"

@hexword = common global i32 0, align 4
@s1 = common global i8 0, align 1
@s3 = common global i8 0, align 1
@error_code = common global i32 0, align 4
@alpha_inv = internal unnamed_addr constant [32 x i8] c"\00\00\01\12\02\05\13\0B\03\1D\06\1B\14\08\0C\17\04\0A\1E\11\07\16\1C\1A\15\19\09\10\0D\0E\18\0F", align 1
@roots = internal unnamed_addr constant [32 x i8] c"\00\80\03\80\06\80\01\80\80\07\80\0D\80\0F\80\1A\0C\80\0B\80\02\80\08\80\80\09\80\11\80\04\80\15", align 1
@alpha = internal unnamed_addr constant [31 x i8] c"\01\02\04\08\10\05\0A\14\0D\1A\11\07\0E\1C\1D\1F\1B\13\03\06\0C\18\15\0F\1E\19\17\0B\16\09\12", align 1
@parity = common global i32 0, align 4
@alpha3 = internal unnamed_addr constant [31 x i8] c"\01\08\0A\1A\0E\1F\03\18\1E\0B\12\04\05\0D\07\1D\13\0C\0F\17\09\02\10\14\11\1C\1B\06\15\19\16", align 1
@alpha_count = global i32 0, align 4
@err_tab = internal unnamed_addr constant [256 x i8] c"\00\01\01\02\01\02\02\03\01\02\02\03\02\03\03\04\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\04\05\05\06\05\06\06\07\05\06\06\07\06\07\07\08", align 1
@func = common global i32 0, align 4
@msg = common global [256 x i8] zeroinitializer, align 1
@alpha_data = global [59 x i32] [i32 -1433785686, i32 1431639365, i32 290805077, i32 -1432212822, i32 713730730, i32 1430345045, i32 -1347769686, i32 -178956971, i32 -1440044374, i32 1431655775, i32 1347769685, i32 1364546885, i32 -1431696726, i32 715827880, i32 -1427985750, i32 1431635262, i32 1269369600, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 978016306, i32 -1013571282, i32 -1727586298, i32 -427247506, i32 -1896091554, i32 -1863998050, i32 -249499081, i32 -472018082, i32 -1011792179, i32 1040951323, i32 -1755365779, i32 -758227266, i32 -81624664, i32 -2009403735, i32 -77474809, i32 -364801595, i32 -372266053, i32 -1759371701, i32 -1493403468, i32 -1936100664, i32 -1682857735, i32 -600291377, i32 -389762591, i32 -1010102491, i32 -1750714030, i32 -1978774231, i32 1045145627, i32 -1910820662, i32 -1146032902, i32 -1293030977, i32 -472659751, i32 -877329424, i32 -2019606789, i32 -1906509074, i32 1424611541], align 4
@numeric_data = global [41 x i32] [i32 -1433785686, i32 1431639365, i32 290805077, i32 -1432212822, i32 713730730, i32 1430345045, i32 -1347769686, i32 -178956971, i32 -1440044374, i32 1431655775, i32 1347769685, i32 1364546885, i32 -1431696726, i32 715827880, i32 -1427985750, i32 1431635262, i32 1266686720, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 940262823, i32 -1095236421, i32 -999779707, i32 -538793957, i32 -429624153, i32 -429496367, i32 -429512751, i32 -429496367, i32 -429496367, i32 1045137435, i32 -429496367, i32 -429496367, i32 -429496367, i32 -429496367, i32 -429496367, i32 -429496367, i32 1424546261], align 4
@.str = private unnamed_addr constant [28 x i8] c"Dear fellow ACP benchmarker\00", align 1

; Function Attrs: nounwind ssp
define i32 @err_corr(i32 %datain) #0 {
entry:
  store i32 %datain, i32* @hexword, align 4, !tbaa !2
  tail call void @find_syndromes()
  %0 = load i8, i8* @s1, align 1, !tbaa !6
  %1 = load i8, i8* @s3, align 1
  %2 = or i8 %1, %0
  %3 = icmp eq i8 %2, 0
  br i1 %3, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 0, i32* @error_code, align 4, !tbaa !2
  br label %if.end38

if.else:                                          ; preds = %entry
  %call = tail call signext i8 @normalized_locator()
  %cmp6 = icmp eq i8 %call, 0
  br i1 %cmp6, label %if.then8, label %if.else9

if.then8:                                         ; preds = %if.else
  %idxprom = sext i8 %0 to i32
  %arrayidx = getelementptr inbounds [32 x i8], [32 x i8]* @alpha_inv, i32 0, i32 %idxprom
  %4 = load i8, i8* %arrayidx, align 1, !tbaa !6
  tail call void @fix_bit(i8 signext %4)
  store i32 1, i32* @error_code, align 4, !tbaa !2
  br label %if.end38

if.else9:                                         ; preds = %if.else
  %conv5 = sext i8 %call to i32
  %5 = lshr i32 1437226410, %conv5
  %6 = and i32 %5, 1
  %cmp13 = icmp eq i32 %6, 0
  br i1 %cmp13, label %while.end, label %if.then15

if.then15:                                        ; preds = %if.else9
  store i32 4, i32* @error_code, align 4, !tbaa !2
  br label %if.end38

while.end:                                        ; preds = %if.else9
  %arrayidx11 = getelementptr inbounds [32 x i8], [32 x i8]* @roots, i32 0, i32 %conv5
  %7 = load i8, i8* %arrayidx11, align 1, !tbaa !6
  %idxprom17 = sext i8 %0 to i32
  %arrayidx18 = getelementptr inbounds [32 x i8], [32 x i8]* @alpha_inv, i32 0, i32 %idxprom17
  %8 = load i8, i8* %arrayidx18, align 1, !tbaa !6
  %add = add i8 %8, %7
  %9 = icmp slt i8 %add, 30
  %.op = xor i8 %add, -1
  %10 = select i1 %9, i8 %.op, i8 -31
  %11 = add i8 %add, %10
  %12 = add i8 %11, 31
  %13 = urem i8 %12, 31
  %14 = sub i8 %13, %12
  %15 = add i8 %add, %14
  %conv22 = sext i8 %15 to i32
  tail call void @fix_bit(i8 signext %15)
  %16 = load i8, i8* @s1, align 1, !tbaa !6
  %arrayidx29 = getelementptr inbounds [31 x i8], [31 x i8]* @alpha, i32 0, i32 %conv22
  %17 = load i8, i8* %arrayidx29, align 1, !tbaa !6
  %xor48 = xor i8 %17, %16
  %idxprom32 = sext i8 %xor48 to i32
  %arrayidx33 = getelementptr inbounds [32 x i8], [32 x i8]* @alpha_inv, i32 0, i32 %idxprom32
  %18 = load i8, i8* %arrayidx33, align 1, !tbaa !6
  tail call void @fix_bit(i8 signext %18)
  %19 = load i32, i32* @parity, align 4, !tbaa !2
  %tobool = icmp eq i32 %19, 0
  br i1 %tobool, label %if.else35, label %if.then34

if.then34:                                        ; preds = %while.end
  store i32 3, i32* @error_code, align 4, !tbaa !2
  br label %if.end38

if.else35:                                        ; preds = %while.end
  store i32 2, i32* @error_code, align 4, !tbaa !2
  br label %if.end38

if.end38:                                         ; preds = %if.then8, %if.then34, %if.else35, %if.then15, %if.then
  %20 = load i32, i32* @hexword, align 4, !tbaa !2
  ret i32 %20
}

; Function Attrs: nounwind ssp
define void @find_syndromes() #0 {
entry:
  store i8 0, i8* @s1, align 1, !tbaa !6
  store i8 0, i8* @s3, align 1, !tbaa !6
  %0 = load i32, i32* @hexword, align 4, !tbaa !2
  %and = and i32 %0, 1
  store i32 %and, i32* @parity, align 4, !tbaa !2
  br label %while.body

while.body:                                       ; preds = %entry, %if.end
  %i.017 = phi i32 [ 30, %entry ], [ %dec, %if.end ]
  %mask.016 = phi i32 [ -2147483648, %entry ], [ %shr, %if.end ]
  %and1 = and i32 %0, %mask.016
  %tobool = icmp eq i32 %and1, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %while.body
  %arrayidx = getelementptr inbounds [31 x i8], [31 x i8]* @alpha, i32 0, i32 %i.017
  %1 = load i8, i8* %arrayidx, align 1, !tbaa !6
  %2 = load i8, i8* @s1, align 1, !tbaa !6
  %xor14 = xor i8 %2, %1
  store i8 %xor14, i8* @s1, align 1, !tbaa !6
  %arrayidx4 = getelementptr inbounds [31 x i8], [31 x i8]* @alpha3, i32 0, i32 %i.017
  %3 = load i8, i8* %arrayidx4, align 1, !tbaa !6
  %4 = load i8, i8* @s3, align 1, !tbaa !6
  %xor715 = xor i8 %4, %3
  store i8 %xor715, i8* @s3, align 1, !tbaa !6
  %5 = load i32, i32* @parity, align 4, !tbaa !2
  %inc = add i32 %5, 1
  store i32 %inc, i32* @parity, align 4, !tbaa !2
  br label %if.end

if.end:                                           ; preds = %while.body, %if.then
  %shr = lshr i32 %mask.016, 1
  %dec = add nsw i32 %i.017, -1
  %cmp = icmp sgt i32 %i.017, 0
  br i1 %cmp, label %while.body, label %while.end

while.end:                                        ; preds = %if.end
  %6 = load i32, i32* @parity, align 4, !tbaa !2
  %and9 = and i32 %6, 1
  store i32 %and9, i32* @parity, align 4, !tbaa !2
  ret void
}

; Function Attrs: nounwind readonly ssp
define signext i8 @normalized_locator() #1 {
while.end:
  %0 = load i8, i8* @s1, align 1, !tbaa !6
  %idxprom = sext i8 %0 to i32
  %arrayidx = getelementptr inbounds [32 x i8], [32 x i8]* @alpha_inv, i32 0, i32 %idxprom
  %1 = load i8, i8* %arrayidx, align 1, !tbaa !6
  %2 = load i8, i8* @s3, align 1, !tbaa !6
  %idxprom1 = sext i8 %2 to i32
  %arrayidx2 = getelementptr inbounds [32 x i8], [32 x i8]* @alpha_inv, i32 0, i32 %idxprom1
  %3 = load i8, i8* %arrayidx2, align 1, !tbaa !6
  %4 = mul i8 %1, 3
  %5 = sub i8 %3, %4
  %6 = icmp sgt i8 %5, 0
  %7 = select i1 %6, i8 %3, i8 %4
  %8 = add i8 %7, 30
  %9 = sub i8 %8, %3
  %10 = urem i8 %9, 31
  %11 = sub i8 %9, %10
  %12 = add i8 %3, %11
  %13 = sub i8 %12, %4
  %conv9 = sext i8 %13 to i32
  %arrayidx14 = getelementptr inbounds [31 x i8], [31 x i8]* @alpha, i32 0, i32 %conv9
  %14 = load i8, i8* %arrayidx14, align 1, !tbaa !6
  %xor = xor i8 %14, 1
  ret i8 %xor
}

; Function Attrs: nounwind ssp
define void @fix_bit(i8 signext %eroot) #0 {
entry:
  %inc = add i8 %eroot, 1
  %0 = load i32, i32* @hexword, align 4, !tbaa !2
  %conv = sext i8 %inc to i32
  %shl = shl i32 1, %conv
  %xor = xor i32 %0, %shl
  store i32 %xor, i32* @hexword, align 4, !tbaa !2
  ret void
}

; Function Attrs: nounwind readnone ssp
define i32 @comp32(i32 %sample, i32 %reference) #2 {
entry:
  %xor = xor i32 %reference, %sample
  br label %while.body

while.body:                                       ; preds = %entry, %while.body
  %num_err.07 = phi i32 [ 0, %entry ], [ %add, %while.body ]
  %i.06 = phi i32 [ 4, %entry ], [ %dec, %while.body ]
  %sample.addr.05 = phi i32 [ %xor, %entry ], [ %shr, %while.body ]
  %idxprom = and i32 %sample.addr.05, 255
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %idxprom
  %0 = load i8, i8* %arrayidx, align 1, !tbaa !6
  %conv1 = zext i8 %0 to i32
  %add = add nsw i32 %conv1, %num_err.07
  %shr = lshr i32 %sample.addr.05, 8
  %dec = add nsw i32 %i.06, -1
  %cmp = icmp sgt i32 %i.06, 1
  br i1 %cmp, label %while.body, label %while.end

while.end:                                        ; preds = %while.body
  ret i32 %add
}

; Function Attrs: nounwind readonly ssp
define i32* @sync_find(i32* readonly %dptr) #1 {
entry:
  %incdec.ptr = getelementptr inbounds i32, i32* %dptr, i32 1
  %0 = load i32, i32* %dptr, align 4, !tbaa !2
  br label %while.body

while.body:                                       ; preds = %while.end.thread, %while.end, %entry
  %sample1.037 = phi i32 [ %0, %entry ], [ %or, %while.end ], [ %shr, %while.end.thread ]
  %sync_window.036 = phi i32 [ 18, %entry ], [ %dec, %while.end ], [ 18, %while.end.thread ]
  %dptr.addr.035 = phi i32* [ %incdec.ptr, %entry ], [ %incdec.ptr1, %while.end ], [ %incdec.ptr1, %while.end.thread ]
  %incdec.ptr1 = getelementptr inbounds i32, i32* %dptr.addr.035, i32 1
  %1 = load i32, i32* %dptr.addr.035, align 4, !tbaa !2
  br label %while.body4

while.body4:                                      ; preds = %while.body, %if.else
  %sample2.034 = phi i32 [ %1, %while.body ], [ %shl11, %if.else ]
  %sample1.133 = phi i32 [ %sample1.037, %while.body ], [ %or, %if.else ]
  %bit_cnt.032 = phi i32 [ 0, %while.body ], [ %inc, %if.else ]
  %call = tail call i32 @comp32(i32 %sample1.133, i32 1045145627)
  %cmp5 = icmp slt i32 %call, 3
  br i1 %cmp5, label %return, label %if.end

if.end:                                           ; preds = %while.body4
  %call6 = tail call i32 @comp32(i32 %sample1.133, i32 -1431655766)
  %call6.off = add i32 %call6, -3
  %2 = icmp ugt i32 %call6.off, 26
  br i1 %2, label %while.end.thread, label %if.else

while.end.thread:                                 ; preds = %if.end
  %shr = lshr i32 %sample2.034, %bit_cnt.032
  br label %while.body

if.else:                                          ; preds = %if.end
  %shl = shl i32 %sample1.133, 1
  %shr10 = lshr i32 %sample2.034, 31
  %or = or i32 %shr10, %shl
  %shl11 = shl i32 %sample2.034, 1
  %inc = add nuw nsw i32 %bit_cnt.032, 1
  %cmp3 = icmp slt i32 %inc, 32
  br i1 %cmp3, label %while.body4, label %while.end

while.end:                                        ; preds = %if.else
  %dec = add nsw i32 %sync_window.036, -1
  %cmp = icmp sgt i32 %sync_window.036, 1
  br i1 %cmp, label %while.body, label %return

return:                                           ; preds = %while.end, %while.body4
  %retval.0 = phi i32* [ %incdec.ptr1, %while.body4 ], [ null, %while.end ]
  ret i32* %retval.0
}

; Function Attrs: nounwind ssp
define i32 @addr_corr(i32 %data) #0 {
entry:
  %shr = lshr i32 %data, 13
  %call = tail call i32 @comp32(i32 %shr, i32 173902)
  %cmp = icmp sgt i32 %call, 2
  br i1 %cmp, label %if.end, label %if.then3

if.end:                                           ; preds = %entry
  %call1 = tail call i32 @comp32(i32 %shr, i32 119386)
  %cmp2 = icmp slt i32 %call1, 3
  br i1 %cmp2, label %if.then3, label %return

if.then3:                                         ; preds = %entry, %if.end
  %capcode.030 = phi i32 [ 119386, %if.end ], [ 173902, %entry ]
  %num_err.029 = phi i32 [ %call1, %if.end ], [ %call, %entry ]
  %call4 = tail call i32 @err_corr(i32 %data)
  %0 = load i32, i32* @error_code, align 4, !tbaa !2
  %cmp5 = icmp slt i32 %0, 3
  br i1 %cmp5, label %if.then6, label %return

if.then6:                                         ; preds = %if.then3
  %cmp7 = icmp eq i32 %0, 0
  br i1 %cmp7, label %if.end11, label %if.then8

if.then8:                                         ; preds = %if.then6
  %shr9 = lshr i32 %call4, 13
  %call10 = tail call i32 @comp32(i32 %shr9, i32 %capcode.030)
  br label %if.end11

if.end11:                                         ; preds = %if.then6, %if.then8
  %num_err.1 = phi i32 [ %call10, %if.then8 ], [ %num_err.029, %if.then6 ]
  %cmp12 = icmp eq i32 %num_err.1, 0
  br i1 %cmp12, label %if.then13, label %return

if.then13:                                        ; preds = %if.end11
  %shr14 = lshr i32 %call4, 11
  %conv = and i32 %shr14, 3
  store i32 %conv, i32* @func, align 4, !tbaa !2
  br label %return

return:                                           ; preds = %if.end, %if.end11, %if.then3, %if.then13
  %retval.0 = phi i32 [ 1, %if.then13 ], [ 0, %if.then3 ], [ 0, %if.end11 ], [ 0, %if.end ]
  ret i32 %retval.0
}

; Function Attrs: nounwind ssp
define i32 @num_proc(i32 %i, i32 %codeword) #0 {
entry:
  %0 = load i32, i32* @error_code, align 4, !tbaa !2
  %cmp1 = icmp slt i32 %0, 3
  br label %while.body

while.body:                                       ; preds = %entry, %if.end12
  %i.addr.024 = phi i32 [ %i, %entry ], [ %inc, %if.end12 ]
  %shift.023 = phi i32 [ 0, %entry ], [ %add13, %if.end12 ]
  %count.022 = phi i32 [ 5, %entry ], [ %dec, %if.end12 ]
  %shr = lshr i32 %codeword, %shift.023
  %shr.tr = trunc i32 %shr to i8
  %conv = and i8 %shr.tr, 15
  br i1 %cmp1, label %if.then, label %if.else10

if.then:                                          ; preds = %while.body
  %cmp4 = icmp ult i8 %conv, 10
  br i1 %cmp4, label %if.then6, label %if.else

if.then6:                                         ; preds = %if.then
  %add21 = or i8 %conv, 48
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %i.addr.024
  store i8 %add21, i8* %arrayidx, align 1, !tbaa !6
  br label %if.end12

if.else:                                          ; preds = %if.then
  %arrayidx9 = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %i.addr.024
  store i8 %conv, i8* %arrayidx9, align 1, !tbaa !6
  br label %if.end12

if.else10:                                        ; preds = %while.body
  %arrayidx11 = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %i.addr.024
  store i8 -128, i8* %arrayidx11, align 1, !tbaa !6
  br label %if.end12

if.end12:                                         ; preds = %if.then6, %if.else, %if.else10
  %add13 = add nuw nsw i32 %shift.023, 4
  %inc = add nsw i32 %i.addr.024, 1
  %dec = add nsw i32 %count.022, -1
  %cmp = icmp sgt i32 %count.022, 1
  br i1 %cmp, label %while.body, label %while.end

while.end:                                        ; preds = %if.end12
  %1 = add i32 %i, 5
  ret i32 %1
}

; Function Attrs: nounwind ssp
define i32 @alpha_proc(i32 %i, i32 %codeword) #0 {
entry:
  %0 = load i32, i32* @alpha_count, align 4, !tbaa !2
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %if.then, label %while.cond.preheader

if.then:                                          ; preds = %entry
  %1 = load i32, i32* @error_code, align 4, !tbaa !2
  %cmp1 = icmp slt i32 %1, 3
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %i
  br i1 %cmp1, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  %sub = sub nsw i32 7, %0
  %shl = shl i32 %codeword, %sub
  %2 = load i8, i8* %arrayidx, align 1, !tbaa !6
  %conv4 = zext i8 %2 to i32
  %or = or i32 %conv4, %shl
  %or.tr = trunc i32 %or to i8
  %conv6 = and i8 %or.tr, 127
  br label %if.end

if.end:                                           ; preds = %if.then, %if.then3
  %storemerge39 = phi i8 [ %conv6, %if.then3 ], [ -128, %if.then ]
  store i8 %storemerge39, i8* %arrayidx, align 1, !tbaa !6
  %inc = add nsw i32 %i, 1
  %3 = load i32, i32* @alpha_count, align 4, !tbaa !2
  br label %while.cond.preheader

while.cond.preheader:                             ; preds = %if.end, %entry
  %i.addr.0.ph = phi i32 [ %i, %entry ], [ %inc, %if.end ]
  %char_shift.0.ph = phi i32 [ 0, %entry ], [ %3, %if.end ]
  %4 = load i32, i32* @error_code, align 4, !tbaa !2
  %cmp12 = icmp slt i32 %4, 3
  br label %while.body

while.body:                                       ; preds = %while.cond.preheader, %if.end20
  %char_shift.042 = phi i32 [ %char_shift.0.ph, %while.cond.preheader ], [ %add, %if.end20 ]
  %char_count.041 = phi i32 [ 3, %while.cond.preheader ], [ %dec, %if.end20 ]
  %i.addr.040 = phi i32 [ %i.addr.0.ph, %while.cond.preheader ], [ %inc21, %if.end20 ]
  br i1 %cmp12, label %if.then14, label %if.else18

if.then14:                                        ; preds = %while.body
  %shr = lshr i32 %codeword, %char_shift.042
  %shr.tr = trunc i32 %shr to i8
  %conv16 = and i8 %shr.tr, 127
  %arrayidx17 = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %i.addr.040
  store i8 %conv16, i8* %arrayidx17, align 1, !tbaa !6
  br label %if.end20

if.else18:                                        ; preds = %while.body
  %arrayidx19 = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %i.addr.040
  store i8 -128, i8* %arrayidx19, align 1, !tbaa !6
  br label %if.end20

if.end20:                                         ; preds = %if.else18, %if.then14
  %add = add nsw i32 %char_shift.042, 7
  %inc21 = add nsw i32 %i.addr.040, 1
  %dec = add nsw i32 %char_count.041, -1
  %cmp10 = icmp sgt i32 %char_count.041, 1
  br i1 %cmp10, label %while.body, label %while.end

while.end:                                        ; preds = %if.end20
  %5 = add i32 %i.addr.0.ph, 2
  %6 = load i32, i32* @alpha_count, align 4, !tbaa !2
  %cmp23 = icmp eq i32 %6, 6
  %inc27 = add nsw i32 %6, 1
  %storemerge = select i1 %cmp23, i32 0, i32 %inc27
  store i32 %storemerge, i32* @alpha_count, align 4, !tbaa !2
  ret i32 %5
}

; Function Attrs: nounwind ssp
define i32 @msg_proc(i32* nocapture readonly %dptr) #0 {
entry:
  br label %while.body.outer

while.body.outer:                                 ; preds = %if.end39, %entry
  %dptr.addr.0.ph = phi i32* [ %incdec.ptr.lcssa, %if.end39 ], [ %dptr, %entry ]
  %i.0.ph = phi i32 [ %i.1, %if.end39 ], [ 0, %entry ]
  %word_count.0.ph = phi i32 [ %inc40, %if.end39 ], [ 0, %entry ]
  %num_bad_sync.0.ph = phi i32 [ %num_bad_sync.0.lcssa, %if.end39 ], [ 0, %entry ]
  %addr_search_mode.0.ph = phi i32 [ %addr_search_mode.1, %if.end39 ], [ 1, %entry ]
  %incdec.ptr70 = getelementptr inbounds i32, i32* %dptr.addr.0.ph, i32 1
  %0 = load i32, i32* %dptr.addr.0.ph, align 4, !tbaa !2
  %cmp71 = icmp eq i32 %word_count.0.ph, 16
  br i1 %cmp71, label %if.then, label %if.else7

if.then:                                          ; preds = %while.body.outer
  %call = tail call i32 @comp32(i32 %0, i32 1045145627)
  %cmp1 = icmp slt i32 %call, 3
  br i1 %cmp1, label %while.body.if.else7_crit_edge, label %if.else

if.else:                                          ; preds = %if.then
  %cmp3 = icmp eq i32 %num_bad_sync.0.ph, 1
  br i1 %cmp3, label %return, label %if.else5

if.else5:                                         ; preds = %if.else
  %inc = add nsw i32 %num_bad_sync.0.ph, 1
  br label %while.body.if.else7_crit_edge

while.body.if.else7_crit_edge:                    ; preds = %if.else5, %if.then
  %num_bad_sync.0.be = phi i32 [ 0, %if.then ], [ %inc, %if.else5 ]
  %incdec.ptr = getelementptr inbounds i32, i32* %dptr.addr.0.ph, i32 2
  %1 = load i32, i32* %incdec.ptr70, align 4, !tbaa !2
  br label %if.else7

if.else7:                                         ; preds = %while.body.if.else7_crit_edge, %while.body.outer
  %.lcssa = phi i32 [ %1, %while.body.if.else7_crit_edge ], [ %0, %while.body.outer ]
  %incdec.ptr.lcssa = phi i32* [ %incdec.ptr, %while.body.if.else7_crit_edge ], [ %incdec.ptr70, %while.body.outer ]
  %num_bad_sync.0.lcssa = phi i32 [ %num_bad_sync.0.be, %while.body.if.else7_crit_edge ], [ %num_bad_sync.0.ph, %while.body.outer ]
  %word_count.0.lcssa = phi i32 [ 0, %while.body.if.else7_crit_edge ], [ %word_count.0.ph, %while.body.outer ]
  %tobool = icmp eq i32 %addr_search_mode.0.ph, 0
  br i1 %tobool, label %if.else17, label %if.then8

if.then8:                                         ; preds = %if.else7
  %2 = and i32 %word_count.0.lcssa, -2
  %3 = icmp eq i32 %2, 6
  br i1 %3, label %if.then11, label %if.end39

if.then11:                                        ; preds = %if.then8
  %call12 = tail call i32 @addr_corr(i32 %.lcssa)
  %tobool13 = icmp eq i32 %call12, 0
  %addr_search_mode.0. = select i1 %tobool13, i32 %addr_search_mode.0.ph, i32 0
  br label %if.end39

if.else17:                                        ; preds = %if.else7
  %call18 = tail call i32 @err_corr(i32 %.lcssa)
  %4 = and i32 %word_count.0.lcssa, -2
  %5 = icmp eq i32 %4, 6
  %6 = load i32, i32* @error_code, align 4
  %cmp23 = icmp slt i32 %6, 3
  %or.cond = and i1 %5, %cmp23
  br i1 %or.cond, label %if.then24, label %if.end34

if.then24:                                        ; preds = %if.else17
  %shr = lshr i32 %call18, 13
  %call25 = tail call i32 @comp32(i32 %shr, i32 173902)
  %tobool26 = icmp eq i32 %call25, 0
  br i1 %tobool26, label %return, label %if.end30

if.end30:                                         ; preds = %if.then24
  %call28 = tail call i32 @comp32(i32 %shr, i32 119386)
  %cmp31 = icmp eq i32 %call28, 0
  br i1 %cmp31, label %return, label %if.end34

if.end34:                                         ; preds = %if.end30, %if.else17
  %shr35 = lshr i32 %call18, 11
  %and = and i32 %shr35, 1048575
  %7 = load i32, i32* @func, align 4, !tbaa !2
  switch i32 %7, label %return [
    i32 0, label %sw.bb
    i32 3, label %sw.bb37
  ]

sw.bb:                                            ; preds = %if.end34
  %call36 = tail call i32 @num_proc(i32 %i.0.ph, i32 %and)
  br label %if.end39

sw.bb37:                                          ; preds = %if.end34
  %call38 = tail call i32 @alpha_proc(i32 %i.0.ph, i32 %and)
  br label %if.end39

if.end39:                                         ; preds = %if.then11, %sw.bb, %sw.bb37, %if.then8
  %i.1 = phi i32 [ %i.0.ph, %if.then8 ], [ %call38, %sw.bb37 ], [ %call36, %sw.bb ], [ %i.0.ph, %if.then11 ]
  %addr_search_mode.1 = phi i32 [ %addr_search_mode.0.ph, %if.then8 ], [ 0, %sw.bb37 ], [ 0, %sw.bb ], [ %addr_search_mode.0., %if.then11 ]
  %inc40 = add nsw i32 %word_count.0.lcssa, 1
  br label %while.body.outer

return:                                           ; preds = %if.then24, %if.end34, %if.end30, %if.else
  %retval.0 = phi i32 [ %i.0.ph, %if.else ], [ %i.0.ph, %if.then24 ], [ 0, %if.end34 ], [ %i.0.ph, %if.end30 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind ssp
define i32 @main() #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %entry, %for.inc
  %j.026 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  store i32 0, i32* @alpha_count, align 4, !tbaa !2
  %tobool = icmp eq i32 %j.026, 0
  %. = select i1 %tobool, i32* getelementptr inbounds ([41 x i32], [41 x i32]* @numeric_data, i32 0, i32 0), i32* getelementptr inbounds ([59 x i32], [59 x i32]* @alpha_data, i32 0, i32 0)
  %call = tail call i32* @sync_find(i32* %.)
  %cmp1 = icmp eq i32* %call, null
  br i1 %cmp1, label %return, label %if.then2

if.then2:                                         ; preds = %for.body
  %call4 = tail call i32 @msg_proc(i32* %call)
  %0 = load i32, i32* @func, align 4, !tbaa !2
  switch i32 %0, label %return [
    i32 3, label %for.inc
    i32 0, label %for.inc
  ]

for.inc:                                          ; preds = %if.then2, %if.then2
  %inc = add nuw nsw i32 %j.026, 1
  %cmp = icmp slt i32 %inc, 2
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.inc
  %call15 = tail call i32 @strncmp(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @msg, i32 0, i32 0), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str, i32 0, i32 0), i32 27) #4
  %cmp16 = icmp eq i32 %call15, 0
  %cmp17 = icmp eq i32 %call4, 88
  %or.cond = and i1 %cmp17, %cmp16
  %.24 = select i1 %or.cond, i32 66, i32 15
  br label %return

return:                                           ; preds = %for.body, %if.then2, %for.end
  %retval.0 = phi i32 [ %.24, %for.end ], [ 15, %if.then2 ], [ 15, %for.body ]
  ret i32 %retval.0
}

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8* nocapture, i8* nocapture, i32) #3

attributes #0 = { nounwind ssp "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="yonah" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly ssp "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="yonah" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone ssp "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="yonah" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="yonah" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!4, !4, i64 0}
