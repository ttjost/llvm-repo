; ModuleID = 'pocsag.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

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

; Function Attrs: nounwind readonly
define i32 @strncmp(i8* nocapture readonly %s1, i8* nocapture readonly %s2, i32 %n) #0 {
entry:
  %cmp20 = icmp eq i32 %n, 0
  br i1 %cmp20, label %return, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.cond:                                         ; preds = %if.else
  %cmp = icmp ult i32 %inc, %n
  br i1 %cmp, label %for.body, label %return.loopexit

for.body:                                         ; preds = %for.body.preheader, %for.cond
  %i.021 = phi i32 [ %inc, %for.cond ], [ 0, %for.body.preheader ]
  %arrayidx = getelementptr inbounds i8, i8* %s1, i32 %i.021
  %0 = load i8, i8* %arrayidx, align 1, !tbaa !1
  %arrayidx1 = getelementptr inbounds i8, i8* %s2, i32 %i.021
  %1 = load i8, i8* %arrayidx1, align 1, !tbaa !1
  %cmp3 = icmp slt i8 %0, %1
  br i1 %cmp3, label %return.loopexit, label %if.else

if.else:                                          ; preds = %for.body
  %cmp9 = icmp sgt i8 %0, %1
  %inc = add nuw i32 %i.021, 1
  br i1 %cmp9, label %return.loopexit, label %for.cond

return.loopexit:                                  ; preds = %for.cond, %if.else, %for.body
  %retval.0.ph = phi i32 [ -1, %for.body ], [ 1, %if.else ], [ 0, %for.cond ]
  br label %return

return:                                           ; preds = %return.loopexit, %entry
  %retval.0 = phi i32 [ 0, %entry ], [ %retval.0.ph, %return.loopexit ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @err_corr(i32 %datain) #1 {
entry:
  store i32 %datain, i32* @hexword, align 4, !tbaa !4
  store i8 0, i8* @s1, align 1, !tbaa !1
  store i8 0, i8* @s3, align 1, !tbaa !1
  %and.i = and i32 %datain, 1
  store i32 %and.i, i32* @parity, align 4, !tbaa !4
  br label %while.body.i

while.body.i:                                     ; preds = %if.end.i, %entry
  %0 = phi i32 [ %and.i, %entry ], [ %5, %if.end.i ]
  %1 = phi i8 [ 0, %entry ], [ %6, %if.end.i ]
  %2 = phi i8 [ 0, %entry ], [ %7, %if.end.i ]
  %i.017.i = phi i32 [ 30, %entry ], [ %dec.i, %if.end.i ]
  %mask.016.i = phi i32 [ -2147483648, %entry ], [ %shr.i, %if.end.i ]
  %and1.i = and i32 %mask.016.i, %datain
  %tobool.i = icmp eq i32 %and1.i, 0
  br i1 %tobool.i, label %if.end.i, label %if.then.i

if.then.i:                                        ; preds = %while.body.i
  %arrayidx.i = getelementptr inbounds [31 x i8], [31 x i8]* @alpha, i32 0, i32 %i.017.i
  %3 = load i8, i8* %arrayidx.i, align 1, !tbaa !1
  %xor14.i = xor i8 %3, %2
  store i8 %xor14.i, i8* @s1, align 1, !tbaa !1
  %arrayidx4.i = getelementptr inbounds [31 x i8], [31 x i8]* @alpha3, i32 0, i32 %i.017.i
  %4 = load i8, i8* %arrayidx4.i, align 1, !tbaa !1
  %xor715.i = xor i8 %4, %1
  store i8 %xor715.i, i8* @s3, align 1, !tbaa !1
  %inc.i = add i32 %0, 1
  store i32 %inc.i, i32* @parity, align 4, !tbaa !4
  br label %if.end.i

if.end.i:                                         ; preds = %if.then.i, %while.body.i
  %5 = phi i32 [ %0, %while.body.i ], [ %inc.i, %if.then.i ]
  %6 = phi i8 [ %1, %while.body.i ], [ %xor715.i, %if.then.i ]
  %7 = phi i8 [ %2, %while.body.i ], [ %xor14.i, %if.then.i ]
  %shr.i = lshr i32 %mask.016.i, 1
  %dec.i = add nsw i32 %i.017.i, -1
  %cmp.i = icmp sgt i32 %i.017.i, 0
  br i1 %cmp.i, label %while.body.i, label %find_syndromes.exit

find_syndromes.exit:                              ; preds = %if.end.i
  %.lcssa67 = phi i8 [ %7, %if.end.i ]
  %.lcssa66 = phi i8 [ %6, %if.end.i ]
  %.lcssa = phi i32 [ %5, %if.end.i ]
  %and9.i = and i32 %.lcssa, 1
  store i32 %and9.i, i32* @parity, align 4, !tbaa !4
  %8 = or i8 %.lcssa66, %.lcssa67
  %9 = icmp eq i8 %8, 0
  br i1 %9, label %if.then, label %if.else

if.then:                                          ; preds = %find_syndromes.exit
  store i32 0, i32* @error_code, align 4, !tbaa !4
  br label %if.end38

if.else:                                          ; preds = %find_syndromes.exit
  %idxprom.i = sext i8 %.lcssa67 to i32
  %arrayidx.i58 = getelementptr inbounds [32 x i8], [32 x i8]* @alpha_inv, i32 0, i32 %idxprom.i
  %10 = load i8, i8* %arrayidx.i58, align 1, !tbaa !1
  %idxprom1.i = sext i8 %.lcssa66 to i32
  %arrayidx2.i = getelementptr inbounds [32 x i8], [32 x i8]* @alpha_inv, i32 0, i32 %idxprom1.i
  %11 = load i8, i8* %arrayidx2.i, align 1, !tbaa !1
  %12 = mul i8 %10, 3
  %13 = sub i8 %11, %12
  %14 = icmp sgt i8 %13, 0
  %15 = select i1 %14, i8 %11, i8 %12
  %16 = sub i8 30, %11
  %17 = add i8 %16, %15
  %18 = urem i8 %17, 31
  %19 = sub i8 %17, %18
  %20 = add i8 %19, %11
  %cmp6 = icmp eq i8 %20, %12
  br i1 %cmp6, label %if.then8, label %if.else9

if.then8:                                         ; preds = %if.else
  %inc.i54 = add i8 %10, 1
  %conv.i55 = sext i8 %inc.i54 to i32
  %shl.i56 = shl i32 1, %conv.i55
  %xor.i57 = xor i32 %shl.i56, %datain
  store i32 %xor.i57, i32* @hexword, align 4, !tbaa !4
  store i32 1, i32* @error_code, align 4, !tbaa !4
  br label %if.end38

if.else9:                                         ; preds = %if.else
  %21 = sub i8 %20, %12
  %conv9.i = sext i8 %21 to i32
  %arrayidx14.i = getelementptr inbounds [31 x i8], [31 x i8]* @alpha, i32 0, i32 %conv9.i
  %22 = load i8, i8* %arrayidx14.i, align 1, !tbaa !1
  %xor.i59 = xor i8 %22, 1
  %conv5 = sext i8 %xor.i59 to i32
  %23 = lshr i32 1437226410, %conv5
  %24 = and i32 %23, 1
  %cmp13 = icmp eq i32 %24, 0
  br i1 %cmp13, label %if.else16, label %if.then15

if.then15:                                        ; preds = %if.else9
  store i32 4, i32* @error_code, align 4, !tbaa !4
  br label %if.end38

if.else16:                                        ; preds = %if.else9
  %arrayidx11 = getelementptr inbounds [32 x i8], [32 x i8]* @roots, i32 0, i32 %conv5
  %25 = load i8, i8* %arrayidx11, align 1, !tbaa !1
  %add = add i8 %25, %10
  %26 = icmp slt i8 %add, 30
  %.op = xor i8 %add, -1
  %27 = select i1 %26, i8 %.op, i8 -31
  %28 = add i8 %add, %27
  %29 = add i8 %28, 31
  %30 = urem i8 %29, 31
  %31 = sub i8 %30, %29
  %32 = add i8 %add, %31
  %conv22 = sext i8 %32 to i32
  %inc.i50 = add i8 %32, 1
  %conv.i51 = sext i8 %inc.i50 to i32
  %shl.i52 = shl i32 1, %conv.i51
  %xor.i53 = xor i32 %shl.i52, %datain
  %arrayidx29 = getelementptr inbounds [31 x i8], [31 x i8]* @alpha, i32 0, i32 %conv22
  %33 = load i8, i8* %arrayidx29, align 1, !tbaa !1
  %xor48 = xor i8 %33, %.lcssa67
  %idxprom32 = sext i8 %xor48 to i32
  %arrayidx33 = getelementptr inbounds [32 x i8], [32 x i8]* @alpha_inv, i32 0, i32 %idxprom32
  %34 = load i8, i8* %arrayidx33, align 1, !tbaa !1
  %inc.i49 = add i8 %34, 1
  %conv.i = sext i8 %inc.i49 to i32
  %shl.i = shl i32 1, %conv.i
  %xor.i = xor i32 %shl.i, %xor.i53
  store i32 %xor.i, i32* @hexword, align 4, !tbaa !4
  %tobool = icmp eq i32 %and9.i, 0
  br i1 %tobool, label %if.else35, label %if.then34

if.then34:                                        ; preds = %if.else16
  store i32 3, i32* @error_code, align 4, !tbaa !4
  br label %if.end38

if.else35:                                        ; preds = %if.else16
  store i32 2, i32* @error_code, align 4, !tbaa !4
  br label %if.end38

if.end38:                                         ; preds = %if.then8, %if.then34, %if.else35, %if.then15, %if.then
  %35 = phi i32 [ %xor.i57, %if.then8 ], [ %xor.i, %if.then34 ], [ %xor.i, %if.else35 ], [ %datain, %if.then15 ], [ %datain, %if.then ]
  ret i32 %35
}

; Function Attrs: nounwind
define void @find_syndromes() #1 {
entry:
  store i8 0, i8* @s1, align 1, !tbaa !1
  store i8 0, i8* @s3, align 1, !tbaa !1
  %0 = load i32, i32* @hexword, align 4, !tbaa !4
  %and = and i32 %0, 1
  store i32 %and, i32* @parity, align 4, !tbaa !4
  br label %while.body

while.body:                                       ; preds = %entry, %if.end
  %1 = phi i32 [ %and, %entry ], [ %6, %if.end ]
  %2 = phi i8 [ 0, %entry ], [ %7, %if.end ]
  %3 = phi i8 [ 0, %entry ], [ %8, %if.end ]
  %i.017 = phi i32 [ 30, %entry ], [ %dec, %if.end ]
  %mask.016 = phi i32 [ -2147483648, %entry ], [ %shr, %if.end ]
  %and1 = and i32 %0, %mask.016
  %tobool = icmp eq i32 %and1, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %while.body
  %arrayidx = getelementptr inbounds [31 x i8], [31 x i8]* @alpha, i32 0, i32 %i.017
  %4 = load i8, i8* %arrayidx, align 1, !tbaa !1
  %xor14 = xor i8 %3, %4
  store i8 %xor14, i8* @s1, align 1, !tbaa !1
  %arrayidx4 = getelementptr inbounds [31 x i8], [31 x i8]* @alpha3, i32 0, i32 %i.017
  %5 = load i8, i8* %arrayidx4, align 1, !tbaa !1
  %xor715 = xor i8 %2, %5
  store i8 %xor715, i8* @s3, align 1, !tbaa !1
  %inc = add i32 %1, 1
  store i32 %inc, i32* @parity, align 4, !tbaa !4
  br label %if.end

if.end:                                           ; preds = %while.body, %if.then
  %6 = phi i32 [ %1, %while.body ], [ %inc, %if.then ]
  %7 = phi i8 [ %2, %while.body ], [ %xor715, %if.then ]
  %8 = phi i8 [ %3, %while.body ], [ %xor14, %if.then ]
  %shr = lshr i32 %mask.016, 1
  %dec = add nsw i32 %i.017, -1
  %cmp = icmp sgt i32 %i.017, 0
  br i1 %cmp, label %while.body, label %while.end

while.end:                                        ; preds = %if.end
  %.lcssa = phi i32 [ %6, %if.end ]
  %and9 = and i32 %.lcssa, 1
  store i32 %and9, i32* @parity, align 4, !tbaa !4
  ret void
}

; Function Attrs: nounwind readonly
define signext i8 @normalized_locator() #0 {
entry:
  %0 = load i8, i8* @s1, align 1, !tbaa !1
  %idxprom = sext i8 %0 to i32
  %arrayidx = getelementptr inbounds [32 x i8], [32 x i8]* @alpha_inv, i32 0, i32 %idxprom
  %1 = load i8, i8* %arrayidx, align 1, !tbaa !1
  %2 = load i8, i8* @s3, align 1, !tbaa !1
  %idxprom1 = sext i8 %2 to i32
  %arrayidx2 = getelementptr inbounds [32 x i8], [32 x i8]* @alpha_inv, i32 0, i32 %idxprom1
  %3 = load i8, i8* %arrayidx2, align 1, !tbaa !1
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
  %14 = load i8, i8* %arrayidx14, align 1, !tbaa !1
  %xor = xor i8 %14, 1
  ret i8 %xor
}

; Function Attrs: nounwind
define void @fix_bit(i8 signext %eroot) #1 {
entry:
  %inc = add i8 %eroot, 1
  %0 = load i32, i32* @hexword, align 4, !tbaa !4
  %conv = sext i8 %inc to i32
  %shl = shl i32 1, %conv
  %xor = xor i32 %0, %shl
  store i32 %xor, i32* @hexword, align 4, !tbaa !4
  ret void
}

; Function Attrs: nounwind readnone
define i32 @comp32(i32 %sample, i32 %reference) #2 {
entry:
  %xor = xor i32 %reference, %sample
  %idxprom = and i32 %xor, 255
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %idxprom
  %0 = load i8, i8* %arrayidx, align 1, !tbaa !1
  %conv1 = zext i8 %0 to i32
  %shr = lshr i32 %xor, 8
  %idxprom.1 = and i32 %shr, 255
  %arrayidx.1 = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %idxprom.1
  %1 = load i8, i8* %arrayidx.1, align 1, !tbaa !1
  %conv1.1 = zext i8 %1 to i32
  %add.1 = add nuw nsw i32 %conv1.1, %conv1
  %shr.1 = lshr i32 %xor, 16
  %idxprom.2 = and i32 %shr.1, 255
  %arrayidx.2 = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %idxprom.2
  %2 = load i8, i8* %arrayidx.2, align 1, !tbaa !1
  %conv1.2 = zext i8 %2 to i32
  %add.2 = add nuw nsw i32 %conv1.2, %add.1
  %shr.2 = lshr i32 %xor, 24
  %arrayidx.3 = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %shr.2
  %3 = load i8, i8* %arrayidx.3, align 1, !tbaa !1
  %conv1.3 = zext i8 %3 to i32
  %add.3 = add nuw nsw i32 %conv1.3, %add.2
  ret i32 %add.3
}

; Function Attrs: nounwind readonly
define i32* @sync_find(i32* readonly %dptr) #0 {
entry:
  %incdec.ptr = getelementptr inbounds i32, i32* %dptr, i32 1
  %0 = load i32, i32* %dptr, align 4, !tbaa !4
  br label %while.body

while.body:                                       ; preds = %while.body.backedge, %entry
  %sample1.055 = phi i32 [ %0, %entry ], [ %sample1.055.be, %while.body.backedge ]
  %sync_window.054 = phi i32 [ 18, %entry ], [ %sync_window.054.be, %while.body.backedge ]
  %dptr.addr.053 = phi i32* [ %incdec.ptr, %entry ], [ %incdec.ptr1, %while.body.backedge ]
  %incdec.ptr1 = getelementptr inbounds i32, i32* %dptr.addr.053, i32 1
  %1 = load i32, i32* %dptr.addr.053, align 4, !tbaa !4
  br label %while.body4

while.body4:                                      ; preds = %while.body, %if.else
  %sample2.052 = phi i32 [ %1, %while.body ], [ %shl11, %if.else ]
  %sample1.151 = phi i32 [ %sample1.055, %while.body ], [ %or, %if.else ]
  %bit_cnt.050 = phi i32 [ 0, %while.body ], [ %inc, %if.else ]
  %xor.i = xor i32 %sample1.151, 1045145627
  %idxprom.i = and i32 %xor.i, 255
  %arrayidx.i = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %idxprom.i
  %2 = load i8, i8* %arrayidx.i, align 1, !tbaa !1
  %conv1.i = zext i8 %2 to i32
  %shr.i = lshr i32 %xor.i, 8
  %idxprom.1.i = and i32 %shr.i, 255
  %arrayidx.1.i = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %idxprom.1.i
  %3 = load i8, i8* %arrayidx.1.i, align 1, !tbaa !1
  %conv1.1.i = zext i8 %3 to i32
  %add.1.i = add nuw nsw i32 %conv1.1.i, %conv1.i
  %shr.1.i = lshr i32 %xor.i, 16
  %idxprom.2.i = and i32 %shr.1.i, 255
  %arrayidx.2.i = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %idxprom.2.i
  %4 = load i8, i8* %arrayidx.2.i, align 1, !tbaa !1
  %conv1.2.i = zext i8 %4 to i32
  %add.2.i = add nuw nsw i32 %add.1.i, %conv1.2.i
  %shr.2.i = lshr i32 %xor.i, 24
  %arrayidx.3.i = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %shr.2.i
  %5 = load i8, i8* %arrayidx.3.i, align 1, !tbaa !1
  %conv1.3.i = zext i8 %5 to i32
  %add.3.i = add nuw nsw i32 %add.2.i, %conv1.3.i
  %cmp5 = icmp slt i32 %add.3.i, 3
  br i1 %cmp5, label %return.loopexit, label %if.end

if.end:                                           ; preds = %while.body4
  %xor.i25 = xor i32 %sample1.151, -1431655766
  %idxprom.i26 = and i32 %xor.i25, 255
  %arrayidx.i27 = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %idxprom.i26
  %6 = load i8, i8* %arrayidx.i27, align 1, !tbaa !1
  %conv1.i28 = zext i8 %6 to i32
  %shr.i29 = lshr i32 %xor.i25, 8
  %idxprom.1.i30 = and i32 %shr.i29, 255
  %arrayidx.1.i31 = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %idxprom.1.i30
  %7 = load i8, i8* %arrayidx.1.i31, align 1, !tbaa !1
  %conv1.1.i32 = zext i8 %7 to i32
  %shr.1.i34 = lshr i32 %xor.i25, 16
  %idxprom.2.i35 = and i32 %shr.1.i34, 255
  %arrayidx.2.i36 = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %idxprom.2.i35
  %8 = load i8, i8* %arrayidx.2.i36, align 1, !tbaa !1
  %conv1.2.i37 = zext i8 %8 to i32
  %shr.2.i39 = lshr i32 %xor.i25, 24
  %arrayidx.3.i40 = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %shr.2.i39
  %9 = load i8, i8* %arrayidx.3.i40, align 1, !tbaa !1
  %conv1.3.i41 = zext i8 %9 to i32
  %add.1.i33 = add nsw i32 %conv1.i28, -3
  %add.2.i38 = add nsw i32 %add.1.i33, %conv1.1.i32
  %add.3.i42 = add nsw i32 %add.2.i38, %conv1.2.i37
  %call6.off = add nsw i32 %add.3.i42, %conv1.3.i41
  %10 = icmp ugt i32 %call6.off, 26
  br i1 %10, label %while.end.thread, label %if.else

while.end.thread:                                 ; preds = %if.end
  %bit_cnt.050.lcssa83 = phi i32 [ %bit_cnt.050, %if.end ]
  %sample2.052.lcssa81 = phi i32 [ %sample2.052, %if.end ]
  %shr = lshr i32 %sample2.052.lcssa81, %bit_cnt.050.lcssa83
  br label %while.body.backedge

if.else:                                          ; preds = %if.end
  %shl = shl i32 %sample1.151, 1
  %shr10 = lshr i32 %sample2.052, 31
  %or = or i32 %shr10, %shl
  %shl11 = shl i32 %sample2.052, 1
  %inc = add nuw nsw i32 %bit_cnt.050, 1
  %cmp3 = icmp slt i32 %inc, 32
  br i1 %cmp3, label %while.body4, label %while.end

while.end:                                        ; preds = %if.else
  %or.lcssa = phi i32 [ %or, %if.else ]
  %dec = add nsw i32 %sync_window.054, -1
  %cmp = icmp sgt i32 %sync_window.054, 1
  br i1 %cmp, label %while.body.backedge, label %return.loopexit75

while.body.backedge:                              ; preds = %while.end, %while.end.thread
  %sample1.055.be = phi i32 [ %or.lcssa, %while.end ], [ %shr, %while.end.thread ]
  %sync_window.054.be = phi i32 [ %dec, %while.end ], [ 18, %while.end.thread ]
  br label %while.body

return.loopexit:                                  ; preds = %while.body4
  %incdec.ptr1.lcssa = phi i32* [ %incdec.ptr1, %while.body4 ]
  br label %return

return.loopexit75:                                ; preds = %while.end
  br label %return

return:                                           ; preds = %return.loopexit75, %return.loopexit
  %retval.0 = phi i32* [ %incdec.ptr1.lcssa, %return.loopexit ], [ null, %return.loopexit75 ]
  ret i32* %retval.0
}

; Function Attrs: nounwind
define i32 @addr_corr(i32 %data) #1 {
entry:
  %shr = lshr i32 %data, 13
  %xor.i = xor i32 %shr, 173902
  %idxprom.i = and i32 %xor.i, 255
  %arrayidx.i = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %idxprom.i
  %0 = load i8, i8* %arrayidx.i, align 1, !tbaa !1
  %conv1.i = zext i8 %0 to i32
  %shr.i = lshr i32 %xor.i, 8
  %idxprom.1.i = and i32 %shr.i, 255
  %arrayidx.1.i = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %idxprom.1.i
  %1 = load i8, i8* %arrayidx.1.i, align 1, !tbaa !1
  %conv1.1.i = zext i8 %1 to i32
  %add.1.i = add nuw nsw i32 %conv1.1.i, %conv1.i
  %shr.1.i = lshr i32 %xor.i, 16
  %arrayidx.2.i = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %shr.1.i
  %2 = load i8, i8* %arrayidx.2.i, align 1, !tbaa !1
  %conv1.2.i = zext i8 %2 to i32
  %add.3.i = add nuw nsw i32 %add.1.i, %conv1.2.i
  %cmp = icmp sgt i32 %add.3.i, 2
  br i1 %cmp, label %if.end, label %if.then3

if.end:                                           ; preds = %entry
  %xor.i46 = xor i32 %shr, 119386
  %idxprom.i47 = and i32 %xor.i46, 255
  %arrayidx.i48 = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %idxprom.i47
  %3 = load i8, i8* %arrayidx.i48, align 1, !tbaa !1
  %conv1.i49 = zext i8 %3 to i32
  %shr.i50 = lshr i32 %xor.i46, 8
  %idxprom.1.i51 = and i32 %shr.i50, 255
  %arrayidx.1.i52 = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %idxprom.1.i51
  %4 = load i8, i8* %arrayidx.1.i52, align 1, !tbaa !1
  %conv1.1.i53 = zext i8 %4 to i32
  %add.1.i54 = add nuw nsw i32 %conv1.1.i53, %conv1.i49
  %shr.1.i55 = lshr i32 %xor.i46, 16
  %arrayidx.2.i57 = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %shr.1.i55
  %5 = load i8, i8* %arrayidx.2.i57, align 1, !tbaa !1
  %conv1.2.i58 = zext i8 %5 to i32
  %add.3.i63 = add nuw nsw i32 %add.1.i54, %conv1.2.i58
  %cmp2 = icmp slt i32 %add.3.i63, 3
  br i1 %cmp2, label %if.then3, label %return

if.then3:                                         ; preds = %entry, %if.end
  %capcode.066 = phi i32 [ 119386, %if.end ], [ 173902, %entry ]
  %num_err.065 = phi i32 [ %add.3.i63, %if.end ], [ %add.3.i, %entry ]
  %call4 = tail call i32 @err_corr(i32 %data)
  %6 = load i32, i32* @error_code, align 4, !tbaa !4
  %cmp5 = icmp slt i32 %6, 3
  br i1 %cmp5, label %if.then6, label %return

if.then6:                                         ; preds = %if.then3
  %cmp7 = icmp eq i32 %6, 0
  br i1 %cmp7, label %if.end11, label %if.then8

if.then8:                                         ; preds = %if.then6
  %shr9 = lshr i32 %call4, 13
  %xor.i28 = xor i32 %shr9, %capcode.066
  %idxprom.i29 = and i32 %xor.i28, 255
  %arrayidx.i30 = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %idxprom.i29
  %7 = load i8, i8* %arrayidx.i30, align 1, !tbaa !1
  %conv1.i31 = zext i8 %7 to i32
  %shr.i32 = lshr i32 %xor.i28, 8
  %idxprom.1.i33 = and i32 %shr.i32, 255
  %arrayidx.1.i34 = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %idxprom.1.i33
  %8 = load i8, i8* %arrayidx.1.i34, align 1, !tbaa !1
  %conv1.1.i35 = zext i8 %8 to i32
  %add.1.i36 = add nuw nsw i32 %conv1.1.i35, %conv1.i31
  %shr.1.i37 = lshr i32 %xor.i28, 16
  %arrayidx.2.i39 = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %shr.1.i37
  %9 = load i8, i8* %arrayidx.2.i39, align 1, !tbaa !1
  %conv1.2.i40 = zext i8 %9 to i32
  %add.3.i45 = add nuw nsw i32 %add.1.i36, %conv1.2.i40
  br label %if.end11

if.end11:                                         ; preds = %if.then6, %if.then8
  %num_err.1 = phi i32 [ %add.3.i45, %if.then8 ], [ %num_err.065, %if.then6 ]
  %cmp12 = icmp eq i32 %num_err.1, 0
  br i1 %cmp12, label %if.then13, label %return

if.then13:                                        ; preds = %if.end11
  %shr14 = lshr i32 %call4, 11
  %conv = and i32 %shr14, 3
  store i32 %conv, i32* @func, align 4, !tbaa !4
  br label %return

return:                                           ; preds = %if.end, %if.end11, %if.then3, %if.then13
  %retval.0 = phi i32 [ 1, %if.then13 ], [ 0, %if.then3 ], [ 0, %if.end11 ], [ 0, %if.end ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @num_proc(i32 %i, i32 %codeword) #1 {
entry:
  %0 = load i32, i32* @error_code, align 4, !tbaa !4
  %cmp1 = icmp slt i32 %0, 3
  br i1 %cmp1, label %if.then.us, label %if.end12.4

if.then.us:                                       ; preds = %entry
  %shr.tr.us = trunc i32 %codeword to i8
  %conv.us = and i8 %shr.tr.us, 15
  %cmp4.us = icmp ult i8 %conv.us, 10
  br i1 %cmp4.us, label %if.then6.us, label %if.else.us

if.else.us:                                       ; preds = %if.then.us
  %arrayidx9.us = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %i
  store i8 %conv.us, i8* %arrayidx9.us, align 1, !tbaa !1
  br label %if.then.us.1

if.then6.us:                                      ; preds = %if.then.us
  %add21.us = or i8 %conv.us, 48
  %arrayidx.us = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %i
  store i8 %add21.us, i8* %arrayidx.us, align 1, !tbaa !1
  br label %if.then.us.1

while.end:                                        ; preds = %if.else.us.4, %if.then6.us.4, %if.end12.4
  %i.addr.0.lcssa = add i32 %i, 5
  ret i32 %i.addr.0.lcssa

if.end12.4:                                       ; preds = %entry
  %arrayidx11 = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %i
  store i8 -128, i8* %arrayidx11, align 1, !tbaa !1
  %inc = add nsw i32 %i, 1
  %arrayidx11.1 = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %inc
  store i8 -128, i8* %arrayidx11.1, align 1, !tbaa !1
  %inc.1 = add nsw i32 %i, 2
  %arrayidx11.2 = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %inc.1
  store i8 -128, i8* %arrayidx11.2, align 1, !tbaa !1
  %inc.2 = add nsw i32 %i, 3
  %arrayidx11.3 = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %inc.2
  store i8 -128, i8* %arrayidx11.3, align 1, !tbaa !1
  %inc.3 = add nsw i32 %i, 4
  %arrayidx11.4 = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %inc.3
  store i8 -128, i8* %arrayidx11.4, align 1, !tbaa !1
  br label %while.end

if.then.us.1:                                     ; preds = %if.else.us, %if.then6.us
  %inc.us = add nsw i32 %i, 1
  %shr.us.1 = lshr i32 %codeword, 4
  %shr.tr.us.1 = trunc i32 %shr.us.1 to i8
  %conv.us.1 = and i8 %shr.tr.us.1, 15
  %cmp4.us.1 = icmp ult i8 %conv.us.1, 10
  br i1 %cmp4.us.1, label %if.then6.us.1, label %if.else.us.1

if.else.us.1:                                     ; preds = %if.then.us.1
  %arrayidx9.us.1 = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %inc.us
  store i8 %conv.us.1, i8* %arrayidx9.us.1, align 1, !tbaa !1
  br label %if.then.us.2

if.then6.us.1:                                    ; preds = %if.then.us.1
  %add21.us.1 = or i8 %conv.us.1, 48
  %arrayidx.us.1 = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %inc.us
  store i8 %add21.us.1, i8* %arrayidx.us.1, align 1, !tbaa !1
  br label %if.then.us.2

if.then.us.2:                                     ; preds = %if.else.us.1, %if.then6.us.1
  %inc.us.1 = add nsw i32 %i, 2
  %shr.us.2 = lshr i32 %codeword, 8
  %shr.tr.us.2 = trunc i32 %shr.us.2 to i8
  %conv.us.2 = and i8 %shr.tr.us.2, 15
  %cmp4.us.2 = icmp ult i8 %conv.us.2, 10
  br i1 %cmp4.us.2, label %if.then6.us.2, label %if.else.us.2

if.else.us.2:                                     ; preds = %if.then.us.2
  %arrayidx9.us.2 = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %inc.us.1
  store i8 %conv.us.2, i8* %arrayidx9.us.2, align 1, !tbaa !1
  br label %if.then.us.3

if.then6.us.2:                                    ; preds = %if.then.us.2
  %add21.us.2 = or i8 %conv.us.2, 48
  %arrayidx.us.2 = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %inc.us.1
  store i8 %add21.us.2, i8* %arrayidx.us.2, align 1, !tbaa !1
  br label %if.then.us.3

if.then.us.3:                                     ; preds = %if.else.us.2, %if.then6.us.2
  %inc.us.2 = add nsw i32 %i, 3
  %shr.us.3 = lshr i32 %codeword, 12
  %shr.tr.us.3 = trunc i32 %shr.us.3 to i8
  %conv.us.3 = and i8 %shr.tr.us.3, 15
  %cmp4.us.3 = icmp ult i8 %conv.us.3, 10
  br i1 %cmp4.us.3, label %if.then6.us.3, label %if.else.us.3

if.else.us.3:                                     ; preds = %if.then.us.3
  %arrayidx9.us.3 = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %inc.us.2
  store i8 %conv.us.3, i8* %arrayidx9.us.3, align 1, !tbaa !1
  br label %if.then.us.4

if.then6.us.3:                                    ; preds = %if.then.us.3
  %add21.us.3 = or i8 %conv.us.3, 48
  %arrayidx.us.3 = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %inc.us.2
  store i8 %add21.us.3, i8* %arrayidx.us.3, align 1, !tbaa !1
  br label %if.then.us.4

if.then.us.4:                                     ; preds = %if.else.us.3, %if.then6.us.3
  %inc.us.3 = add nsw i32 %i, 4
  %shr.us.4 = lshr i32 %codeword, 16
  %shr.tr.us.4 = trunc i32 %shr.us.4 to i8
  %conv.us.4 = and i8 %shr.tr.us.4, 15
  %cmp4.us.4 = icmp ult i8 %conv.us.4, 10
  br i1 %cmp4.us.4, label %if.then6.us.4, label %if.else.us.4

if.else.us.4:                                     ; preds = %if.then.us.4
  %arrayidx9.us.4 = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %inc.us.3
  store i8 %conv.us.4, i8* %arrayidx9.us.4, align 1, !tbaa !1
  br label %while.end

if.then6.us.4:                                    ; preds = %if.then.us.4
  %add21.us.4 = or i8 %conv.us.4, 48
  %arrayidx.us.4 = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %inc.us.3
  store i8 %add21.us.4, i8* %arrayidx.us.4, align 1, !tbaa !1
  br label %while.end
}

; Function Attrs: nounwind
define i32 @alpha_proc(i32 %i, i32 %codeword) #1 {
entry:
  %0 = load i32, i32* @alpha_count, align 4, !tbaa !4
  %cmp = icmp sgt i32 %0, 0
  %1 = load i32, i32* @error_code, align 4, !tbaa !4
  br i1 %cmp, label %if.then, label %while.cond.preheader

if.then:                                          ; preds = %entry
  %cmp1 = icmp slt i32 %1, 3
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %i
  br i1 %cmp1, label %if.then3, label %if.end

if.then3:                                         ; preds = %if.then
  %sub = sub nsw i32 7, %0
  %shl = shl i32 %codeword, %sub
  %2 = load i8, i8* %arrayidx, align 1, !tbaa !1
  %conv4 = zext i8 %2 to i32
  %or = or i32 %conv4, %shl
  %or.tr = trunc i32 %or to i8
  %conv6 = and i8 %or.tr, 127
  br label %if.end

if.end:                                           ; preds = %if.then, %if.then3
  %storemerge39 = phi i8 [ %conv6, %if.then3 ], [ -128, %if.then ]
  store i8 %storemerge39, i8* %arrayidx, align 1, !tbaa !1
  %inc = add nsw i32 %i, 1
  br label %while.cond.preheader

while.cond.preheader:                             ; preds = %entry, %if.end
  %i.addr.0.ph = phi i32 [ %inc, %if.end ], [ %i, %entry ]
  %char_shift.0.ph = phi i32 [ %0, %if.end ], [ 0, %entry ]
  %cmp12 = icmp slt i32 %1, 3
  br i1 %cmp12, label %if.end20.us.2, label %if.end20.2

while.end:                                        ; preds = %if.end20.us.2, %if.end20.2
  %dec22 = add i32 %i.addr.0.ph, 2
  %cmp23 = icmp eq i32 %0, 6
  %inc27 = add nsw i32 %0, 1
  %storemerge = select i1 %cmp23, i32 0, i32 %inc27
  store i32 %storemerge, i32* @alpha_count, align 4, !tbaa !4
  ret i32 %dec22

if.end20.2:                                       ; preds = %while.cond.preheader
  %arrayidx19 = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %i.addr.0.ph
  store i8 -128, i8* %arrayidx19, align 1, !tbaa !1
  %inc21 = add nsw i32 %i.addr.0.ph, 1
  %arrayidx19.1 = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %inc21
  store i8 -128, i8* %arrayidx19.1, align 1, !tbaa !1
  %inc21.1 = add nsw i32 %i.addr.0.ph, 2
  %arrayidx19.2 = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %inc21.1
  store i8 -128, i8* %arrayidx19.2, align 1, !tbaa !1
  br label %while.end

if.end20.us.2:                                    ; preds = %while.cond.preheader
  %shr.us = lshr i32 %codeword, %char_shift.0.ph
  %shr.tr.us = trunc i32 %shr.us to i8
  %conv16.us = and i8 %shr.tr.us, 127
  %arrayidx17.us = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %i.addr.0.ph
  store i8 %conv16.us, i8* %arrayidx17.us, align 1, !tbaa !1
  %inc21.us = add nsw i32 %i.addr.0.ph, 1
  %add.us = add nsw i32 %char_shift.0.ph, 7
  %shr.us.1 = lshr i32 %codeword, %add.us
  %shr.tr.us.1 = trunc i32 %shr.us.1 to i8
  %conv16.us.1 = and i8 %shr.tr.us.1, 127
  %arrayidx17.us.1 = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %inc21.us
  store i8 %conv16.us.1, i8* %arrayidx17.us.1, align 1, !tbaa !1
  %inc21.us.1 = add nsw i32 %i.addr.0.ph, 2
  %add.us.1 = add nsw i32 %char_shift.0.ph, 14
  %shr.us.2 = lshr i32 %codeword, %add.us.1
  %shr.tr.us.2 = trunc i32 %shr.us.2 to i8
  %conv16.us.2 = and i8 %shr.tr.us.2, 127
  %arrayidx17.us.2 = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %inc21.us.1
  store i8 %conv16.us.2, i8* %arrayidx17.us.2, align 1, !tbaa !1
  br label %while.end
}

; Function Attrs: nounwind
define i32 @msg_proc(i32* nocapture readonly %dptr) #1 {
entry:
  br label %while.body.outer

while.body.outer:                                 ; preds = %if.end39, %entry
  %dptr.addr.0.ph = phi i32* [ %incdec.ptr.lcssa, %if.end39 ], [ %dptr, %entry ]
  %i.0.ph = phi i32 [ %i.1, %if.end39 ], [ 0, %entry ]
  %word_count.0.ph = phi i32 [ %inc40, %if.end39 ], [ 0, %entry ]
  %num_bad_sync.0.ph = phi i32 [ %num_bad_sync.0.lcssa, %if.end39 ], [ 0, %entry ]
  %addr_search_mode.0.ph = phi i32 [ %addr_search_mode.1, %if.end39 ], [ 1, %entry ]
  %incdec.ptr107 = getelementptr inbounds i32, i32* %dptr.addr.0.ph, i32 1
  %0 = load i32, i32* %dptr.addr.0.ph, align 4, !tbaa !4
  %cmp108 = icmp eq i32 %word_count.0.ph, 16
  br i1 %cmp108, label %if.then.lr.ph, label %if.else7

if.then.lr.ph:                                    ; preds = %while.body.outer
  %xor.i = xor i32 %0, 1045145627
  %idxprom.i = and i32 %xor.i, 255
  %arrayidx.i = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %idxprom.i
  %1 = load i8, i8* %arrayidx.i, align 1, !tbaa !1
  %conv1.i = zext i8 %1 to i32
  %shr.i = lshr i32 %xor.i, 8
  %idxprom.1.i = and i32 %shr.i, 255
  %arrayidx.1.i = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %idxprom.1.i
  %2 = load i8, i8* %arrayidx.1.i, align 1, !tbaa !1
  %conv1.1.i = zext i8 %2 to i32
  %add.1.i = add nuw nsw i32 %conv1.1.i, %conv1.i
  %shr.1.i = lshr i32 %xor.i, 16
  %idxprom.2.i = and i32 %shr.1.i, 255
  %arrayidx.2.i = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %idxprom.2.i
  %3 = load i8, i8* %arrayidx.2.i, align 1, !tbaa !1
  %conv1.2.i = zext i8 %3 to i32
  %add.2.i = add nuw nsw i32 %add.1.i, %conv1.2.i
  %shr.2.i = lshr i32 %xor.i, 24
  %arrayidx.3.i = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %shr.2.i
  %4 = load i8, i8* %arrayidx.3.i, align 1, !tbaa !1
  %conv1.3.i = zext i8 %4 to i32
  %add.3.i = add nuw nsw i32 %add.2.i, %conv1.3.i
  %cmp1 = icmp slt i32 %add.3.i, 3
  br i1 %cmp1, label %while.body.backedge, label %if.else

while.body.backedge:                              ; preds = %if.then.lr.ph, %if.else5
  %num_bad_sync.0.be = phi i32 [ 0, %if.then.lr.ph ], [ %inc, %if.else5 ]
  %incdec.ptr = getelementptr inbounds i32, i32* %dptr.addr.0.ph, i32 2
  %5 = load i32, i32* %incdec.ptr107, align 4, !tbaa !4
  br label %if.else7

if.else:                                          ; preds = %if.then.lr.ph
  %cmp3 = icmp eq i32 %num_bad_sync.0.ph, 1
  br i1 %cmp3, label %return, label %if.else5

if.else5:                                         ; preds = %if.else
  %inc = add nsw i32 %num_bad_sync.0.ph, 1
  br label %while.body.backedge

if.else7:                                         ; preds = %while.body.backedge, %while.body.outer
  %.lcssa = phi i32 [ %5, %while.body.backedge ], [ %0, %while.body.outer ]
  %incdec.ptr.lcssa = phi i32* [ %incdec.ptr, %while.body.backedge ], [ %incdec.ptr107, %while.body.outer ]
  %num_bad_sync.0.lcssa = phi i32 [ %num_bad_sync.0.be, %while.body.backedge ], [ %num_bad_sync.0.ph, %while.body.outer ]
  %word_count.0.lcssa = phi i32 [ 0, %while.body.backedge ], [ %word_count.0.ph, %while.body.outer ]
  %tobool = icmp eq i32 %addr_search_mode.0.ph, 0
  br i1 %tobool, label %if.else17, label %if.then8

if.then8:                                         ; preds = %if.else7
  %6 = and i32 %word_count.0.lcssa, -2
  %7 = icmp eq i32 %6, 6
  br i1 %7, label %if.then11, label %if.end39

if.then11:                                        ; preds = %if.then8
  %call12 = tail call i32 @addr_corr(i32 %.lcssa)
  %tobool13 = icmp eq i32 %call12, 0
  %addr_search_mode.0. = select i1 %tobool13, i32 %addr_search_mode.0.ph, i32 0
  br label %if.end39

if.else17:                                        ; preds = %if.else7
  %call18 = tail call i32 @err_corr(i32 %.lcssa)
  %8 = and i32 %word_count.0.lcssa, -2
  %9 = icmp eq i32 %8, 6
  %10 = load i32, i32* @error_code, align 4
  %cmp23 = icmp slt i32 %10, 3
  %or.cond = and i1 %9, %cmp23
  br i1 %or.cond, label %if.then24, label %if.end34

if.then24:                                        ; preds = %if.else17
  %shr = lshr i32 %call18, 13
  %xor.i62 = xor i32 %shr, 173902
  %idxprom.i63 = and i32 %xor.i62, 255
  %arrayidx.i64 = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %idxprom.i63
  %11 = load i8, i8* %arrayidx.i64, align 1, !tbaa !1
  %conv1.i65 = zext i8 %11 to i32
  %shr.i66 = lshr i32 %xor.i62, 8
  %idxprom.1.i67 = and i32 %shr.i66, 255
  %arrayidx.1.i68 = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %idxprom.1.i67
  %12 = load i8, i8* %arrayidx.1.i68, align 1, !tbaa !1
  %conv1.1.i69 = zext i8 %12 to i32
  %add.1.i70 = add nuw nsw i32 %conv1.i65, %conv1.1.i69
  %shr.1.i71 = lshr i32 %xor.i62, 16
  %arrayidx.2.i73 = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %shr.1.i71
  %13 = load i8, i8* %arrayidx.2.i73, align 1, !tbaa !1
  %conv1.2.i74 = zext i8 %13 to i32
  %add.3.i79 = sub nsw i32 0, %add.1.i70
  %tobool26 = icmp eq i32 %conv1.2.i74, %add.3.i79
  br i1 %tobool26, label %return, label %if.end30

if.end30:                                         ; preds = %if.then24
  %xor.i80 = xor i32 %shr, 119386
  %idxprom.i81 = and i32 %xor.i80, 255
  %arrayidx.i82 = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %idxprom.i81
  %14 = load i8, i8* %arrayidx.i82, align 1, !tbaa !1
  %conv1.i83 = zext i8 %14 to i32
  %shr.i84 = lshr i32 %xor.i80, 8
  %idxprom.1.i85 = and i32 %shr.i84, 255
  %arrayidx.1.i86 = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %idxprom.1.i85
  %15 = load i8, i8* %arrayidx.1.i86, align 1, !tbaa !1
  %conv1.1.i87 = zext i8 %15 to i32
  %add.1.i88 = add nuw nsw i32 %conv1.i83, %conv1.1.i87
  %shr.1.i89 = lshr i32 %xor.i80, 16
  %arrayidx.2.i91 = getelementptr inbounds [256 x i8], [256 x i8]* @err_tab, i32 0, i32 %shr.1.i89
  %16 = load i8, i8* %arrayidx.2.i91, align 1, !tbaa !1
  %conv1.2.i92 = zext i8 %16 to i32
  %add.3.i97 = sub nsw i32 0, %add.1.i88
  %cmp31 = icmp eq i32 %conv1.2.i92, %add.3.i97
  br i1 %cmp31, label %return, label %if.end34

if.end34:                                         ; preds = %if.end30, %if.else17
  %shr35 = lshr i32 %call18, 11
  %and = and i32 %shr35, 1048575
  %17 = load i32, i32* @func, align 4, !tbaa !4
  switch i32 %17, label %return [
    i32 0, label %sw.bb
    i32 3, label %sw.bb37
  ]

sw.bb:                                            ; preds = %if.end34
  %call36 = tail call i32 @num_proc(i32 %i.0.ph, i32 %and)
  br label %if.end39

sw.bb37:                                          ; preds = %if.end34
  %18 = load i32, i32* @alpha_count, align 4, !tbaa !4
  %cmp.i = icmp sgt i32 %18, 0
  br i1 %cmp.i, label %if.then.i, label %while.cond.preheader.i

if.then.i:                                        ; preds = %sw.bb37
  %arrayidx.i61 = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %i.0.ph
  br i1 %cmp23, label %if.then3.i, label %if.end.i

if.then3.i:                                       ; preds = %if.then.i
  %sub.i = sub nsw i32 7, %18
  %shl.i = shl i32 %and, %sub.i
  %19 = load i8, i8* %arrayidx.i61, align 1, !tbaa !1
  %conv4.i = zext i8 %19 to i32
  %or.i = or i32 %conv4.i, %shl.i
  %or.tr.i = trunc i32 %or.i to i8
  %conv6.i = and i8 %or.tr.i, 127
  br label %if.end.i

if.end.i:                                         ; preds = %if.then3.i, %if.then.i
  %storemerge39.i = phi i8 [ %conv6.i, %if.then3.i ], [ -128, %if.then.i ]
  store i8 %storemerge39.i, i8* %arrayidx.i61, align 1, !tbaa !1
  %inc.i = add nsw i32 %i.0.ph, 1
  br label %while.cond.preheader.i

while.cond.preheader.i:                           ; preds = %if.end.i, %sw.bb37
  %i.addr.0.ph.i = phi i32 [ %inc.i, %if.end.i ], [ %i.0.ph, %sw.bb37 ]
  %char_shift.0.ph.i = phi i32 [ %18, %if.end.i ], [ 0, %sw.bb37 ]
  br i1 %cmp23, label %if.end20.us.2.i, label %if.end20.2.i

if.end20.2.i:                                     ; preds = %while.cond.preheader.i
  %arrayidx19.i = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %i.addr.0.ph.i
  store i8 -128, i8* %arrayidx19.i, align 1, !tbaa !1
  %inc21.i = add nsw i32 %i.addr.0.ph.i, 1
  %arrayidx19.1.i = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %inc21.i
  store i8 -128, i8* %arrayidx19.1.i, align 1, !tbaa !1
  %inc21.1.i = add nsw i32 %i.addr.0.ph.i, 2
  %arrayidx19.2.i = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %inc21.1.i
  store i8 -128, i8* %arrayidx19.2.i, align 1, !tbaa !1
  br label %alpha_proc.exit

if.end20.us.2.i:                                  ; preds = %while.cond.preheader.i
  %shr.us.i = lshr i32 %and, %char_shift.0.ph.i
  %shr.tr.us.i = trunc i32 %shr.us.i to i8
  %conv16.us.i = and i8 %shr.tr.us.i, 127
  %arrayidx17.us.i = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %i.addr.0.ph.i
  store i8 %conv16.us.i, i8* %arrayidx17.us.i, align 1, !tbaa !1
  %inc21.us.i = add nsw i32 %i.addr.0.ph.i, 1
  %add.us.i = add nsw i32 %char_shift.0.ph.i, 7
  %shr.us.1.i = lshr i32 %and, %add.us.i
  %shr.tr.us.1.i = trunc i32 %shr.us.1.i to i8
  %conv16.us.1.i = and i8 %shr.tr.us.1.i, 127
  %arrayidx17.us.1.i = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %inc21.us.i
  store i8 %conv16.us.1.i, i8* %arrayidx17.us.1.i, align 1, !tbaa !1
  %inc21.us.1.i = add nsw i32 %i.addr.0.ph.i, 2
  %add.us.1.i = add nsw i32 %char_shift.0.ph.i, 14
  %shr.us.2.i = lshr i32 %and, %add.us.1.i
  %shr.tr.us.2.i = trunc i32 %shr.us.2.i to i8
  %conv16.us.2.i = and i8 %shr.tr.us.2.i, 127
  %arrayidx17.us.2.i = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %inc21.us.1.i
  store i8 %conv16.us.2.i, i8* %arrayidx17.us.2.i, align 1, !tbaa !1
  br label %alpha_proc.exit

alpha_proc.exit:                                  ; preds = %if.end20.2.i, %if.end20.us.2.i
  %dec22.i.pre-phi = phi i32 [ %inc21.1.i, %if.end20.2.i ], [ %inc21.us.1.i, %if.end20.us.2.i ]
  %cmp23.i = icmp eq i32 %18, 6
  %inc27.i = add nsw i32 %18, 1
  %storemerge.i = select i1 %cmp23.i, i32 0, i32 %inc27.i
  store i32 %storemerge.i, i32* @alpha_count, align 4, !tbaa !4
  br label %if.end39

if.end39:                                         ; preds = %if.then11, %sw.bb, %alpha_proc.exit, %if.then8
  %i.1 = phi i32 [ %i.0.ph, %if.then8 ], [ %dec22.i.pre-phi, %alpha_proc.exit ], [ %call36, %sw.bb ], [ %i.0.ph, %if.then11 ]
  %addr_search_mode.1 = phi i32 [ %addr_search_mode.0.ph, %if.then8 ], [ 0, %alpha_proc.exit ], [ 0, %sw.bb ], [ %addr_search_mode.0., %if.then11 ]
  %inc40 = add nsw i32 %word_count.0.lcssa, 1
  br label %while.body.outer

return:                                           ; preds = %if.then24, %if.end34, %if.end30, %if.else
  %retval.0 = phi i32 [ %i.0.ph, %if.else ], [ %i.0.ph, %if.then24 ], [ 0, %if.end34 ], [ %i.0.ph, %if.end30 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @main() #1 {
entry:
  store i32 0, i32* @alpha_count, align 4, !tbaa !4
  %call = tail call i32* @sync_find(i32* getelementptr inbounds ([41 x i32], [41 x i32]* @numeric_data, i32 0, i32 0))
  %cmp1 = icmp eq i32* %call, null
  br i1 %cmp1, label %return, label %if.then2

if.then2:                                         ; preds = %entry
  %call4 = tail call i32 @msg_proc(i32* %call)
  %0 = load i32, i32* @func, align 4, !tbaa !4
  switch i32 %0, label %return [
    i32 3, label %for.inc
    i32 0, label %for.inc
  ]

for.inc:                                          ; preds = %if.then2, %if.then2
  store i32 0, i32* @alpha_count, align 4, !tbaa !4
  %call.1 = tail call i32* @sync_find(i32* getelementptr inbounds ([59 x i32], [59 x i32]* @alpha_data, i32 0, i32 0))
  %cmp1.1 = icmp eq i32* %call.1, null
  br i1 %cmp1.1, label %return, label %if.then2.1

for.cond.i:                                       ; preds = %if.else.i
  %cmp.i = icmp ult i32 %inc.i, 27
  br i1 %cmp.i, label %for.body.i, label %strncmp.exit

for.body.i:                                       ; preds = %for.body.i.preheader, %for.cond.i
  %i.021.i = phi i32 [ %inc.i, %for.cond.i ], [ 0, %for.body.i.preheader ]
  %arrayidx.i = getelementptr inbounds [256 x i8], [256 x i8]* @msg, i32 0, i32 %i.021.i
  %1 = load i8, i8* %arrayidx.i, align 1, !tbaa !1
  %arrayidx1.i = getelementptr inbounds [28 x i8], [28 x i8]* @.str, i32 0, i32 %i.021.i
  %2 = load i8, i8* %arrayidx1.i, align 1, !tbaa !1
  %cmp3.i = icmp slt i8 %1, %2
  br i1 %cmp3.i, label %strncmp.exit, label %if.else.i

if.else.i:                                        ; preds = %for.body.i
  %cmp9.i = icmp sgt i8 %1, %2
  %inc.i = add nuw nsw i32 %i.021.i, 1
  br i1 %cmp9.i, label %strncmp.exit, label %for.cond.i

strncmp.exit:                                     ; preds = %for.cond.i, %for.body.i, %if.else.i
  %retval.0.i = phi i1 [ false, %for.body.i ], [ false, %if.else.i ], [ true, %for.cond.i ]
  %cmp17 = icmp eq i32 %call4.1, 88
  %or.cond = and i1 %cmp17, %retval.0.i
  %.24 = select i1 %or.cond, i32 66, i32 15
  br label %return

return:                                           ; preds = %entry, %if.then2, %for.inc, %if.then2.1, %strncmp.exit
  %retval.0 = phi i32 [ %.24, %strncmp.exit ], [ 15, %if.then2.1 ], [ 15, %for.inc ], [ 15, %if.then2 ], [ 15, %entry ]
  ret i32 %retval.0

if.then2.1:                                       ; preds = %for.inc
  %call4.1 = tail call i32 @msg_proc(i32* %call.1)
  %3 = load i32, i32* @func, align 4, !tbaa !4
  switch i32 %3, label %return [
    i32 3, label %for.body.i.preheader
    i32 0, label %for.body.i.preheader
  ]

for.body.i.preheader:                             ; preds = %if.then2.1, %if.then2.1
  br label %for.body.i
}

attributes #0 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !2, i64 0}
