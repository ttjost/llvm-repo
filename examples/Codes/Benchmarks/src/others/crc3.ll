; ModuleID = 'crc.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@.str = private unnamed_addr constant [44 x i8] c"asdffeagewaHAFEFaeDsFEawFdsFaefaeerdjgpim23\00", align 1
@aa = global i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), align 4
@icrc.icrctb = internal unnamed_addr global [256 x i16] zeroinitializer, align 2
@icrc.init = internal unnamed_addr global i1 false
@icrc.rchr = internal unnamed_addr global [256 x i8] zeroinitializer, align 1
@icrc.it = internal unnamed_addr constant [16 x i8] c"\00\08\04\0C\02\0A\06\0E\01\09\05\0D\03\0B\07\0F", align 1
@str = private unnamed_addr constant [3 x i8] c"-1\00"
@str3 = private unnamed_addr constant [4 x i8] c"666\00"

; Function Attrs: nounwind readnone
define zeroext i16 @icrc1(i16 zeroext %crc, i8 zeroext %onech) #0 {
entry:
  %conv1 = zext i8 %onech to i16
  %shl = shl nuw i16 %conv1, 8
  %xor = xor i16 %shl, %crc
  %conv4 = zext i16 %xor to i32
  %and = and i32 %conv4, 32768
  %tobool = icmp eq i32 %and, 0
  %shl6 = shl nuw nsw i32 %conv4, 1
  %xor7 = xor i32 %shl6, 4129
  %ans.1.in = select i1 %tobool, i32 %shl6, i32 %xor7
  %and.1 = and i32 %ans.1.in, 32768
  %tobool.1 = icmp eq i32 %and.1, 0
  %conv4.1 = shl nuw nsw i32 %ans.1.in, 1
  %xor7.1 = xor i32 %conv4.1, 4129
  %ans.1.in.1 = select i1 %tobool.1, i32 %conv4.1, i32 %xor7.1
  %and.2 = and i32 %ans.1.in.1, 32768
  %tobool.2 = icmp eq i32 %and.2, 0
  %conv4.2 = shl i32 %ans.1.in.1, 1
  %xor7.2 = xor i32 %conv4.2, 4129
  %ans.1.in.2 = select i1 %tobool.2, i32 %conv4.2, i32 %xor7.2
  %and.3 = and i32 %ans.1.in.2, 32768
  %tobool.3 = icmp eq i32 %and.3, 0
  %conv4.3 = shl i32 %ans.1.in.2, 1
  %xor7.3 = xor i32 %conv4.3, 4129
  %ans.1.in.3 = select i1 %tobool.3, i32 %conv4.3, i32 %xor7.3
  %and.4 = and i32 %ans.1.in.3, 32768
  %tobool.4 = icmp eq i32 %and.4, 0
  %conv4.4 = shl i32 %ans.1.in.3, 1
  %xor7.4 = xor i32 %conv4.4, 4129
  %ans.1.in.4 = select i1 %tobool.4, i32 %conv4.4, i32 %xor7.4
  %and.5 = and i32 %ans.1.in.4, 32768
  %tobool.5 = icmp eq i32 %and.5, 0
  %conv4.5 = shl i32 %ans.1.in.4, 1
  %xor7.5 = xor i32 %conv4.5, 4129
  %ans.1.in.5 = select i1 %tobool.5, i32 %conv4.5, i32 %xor7.5
  %and.6 = and i32 %ans.1.in.5, 32768
  %tobool.6 = icmp eq i32 %and.6, 0
  %conv4.6 = shl i32 %ans.1.in.5, 1
  %xor7.6 = xor i32 %conv4.6, 4129
  %ans.1.in.6 = select i1 %tobool.6, i32 %conv4.6, i32 %xor7.6
  %and.7 = and i32 %ans.1.in.6, 32768
  %tobool.7 = icmp eq i32 %and.7, 0
  %conv4.7 = shl i32 %ans.1.in.6, 1
  %xor7.7 = xor i32 %conv4.7, 4129
  %ans.1.in.7 = select i1 %tobool.7, i32 %conv4.7, i32 %xor7.7
  %ans.1.7 = trunc i32 %ans.1.in.7 to i16
  ret i16 %ans.1.7
}

; Function Attrs: nounwind
define zeroext i16 @icrc(i16 zeroext %crc, i8* nocapture readonly %lin, i32 %len, i16 signext %jinit, i32 %jrev) #1 {
entry:
  %.b = load i1, i1* @icrc.init, align 1
  br i1 %.b, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i1 true, i1* @icrc.init, align 1
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %if.then
  %index = phi i32 [ 0, %if.then ], [ %index.next, %vector.body ]
  %broadcast.splatinsert = insertelement <4 x i32> undef, i32 %index, i32 0
  %broadcast.splat = shufflevector <4 x i32> %broadcast.splatinsert, <4 x i32> undef, <4 x i32> zeroinitializer
  %induction = add <4 x i32> %broadcast.splat, <i32 0, i32 1, i32 2, i32 3>
  %0 = and <4 x i32> %induction, <i32 128, i32 128, i32 128, i32 128>
  %1 = icmp eq <4 x i32> %0, zeroinitializer
  %2 = shl <4 x i32> %induction, <i32 9, i32 9, i32 9, i32 9>
  %3 = xor <4 x i32> %2, <i32 4129, i32 4129, i32 4129, i32 4129>
  %4 = select <4 x i1> %1, <4 x i32> %2, <4 x i32> %3
  %5 = and <4 x i32> %4, <i32 32768, i32 32768, i32 32768, i32 32768>
  %6 = icmp eq <4 x i32> %5, zeroinitializer
  %7 = shl nuw nsw <4 x i32> %4, <i32 1, i32 1, i32 1, i32 1>
  %8 = xor <4 x i32> %7, <i32 4129, i32 4129, i32 4129, i32 4129>
  %9 = select <4 x i1> %6, <4 x i32> %7, <4 x i32> %8
  %10 = and <4 x i32> %9, <i32 32768, i32 32768, i32 32768, i32 32768>
  %11 = icmp eq <4 x i32> %10, zeroinitializer
  %12 = shl <4 x i32> %9, <i32 1, i32 1, i32 1, i32 1>
  %13 = xor <4 x i32> %12, <i32 4129, i32 4129, i32 4129, i32 4129>
  %14 = select <4 x i1> %11, <4 x i32> %12, <4 x i32> %13
  %15 = and <4 x i32> %14, <i32 32768, i32 32768, i32 32768, i32 32768>
  %16 = icmp eq <4 x i32> %15, zeroinitializer
  %17 = shl <4 x i32> %14, <i32 1, i32 1, i32 1, i32 1>
  %18 = xor <4 x i32> %17, <i32 4129, i32 4129, i32 4129, i32 4129>
  %19 = select <4 x i1> %16, <4 x i32> %17, <4 x i32> %18
  %20 = and <4 x i32> %19, <i32 32768, i32 32768, i32 32768, i32 32768>
  %21 = icmp eq <4 x i32> %20, zeroinitializer
  %22 = shl <4 x i32> %19, <i32 1, i32 1, i32 1, i32 1>
  %23 = xor <4 x i32> %22, <i32 4129, i32 4129, i32 4129, i32 4129>
  %24 = select <4 x i1> %21, <4 x i32> %22, <4 x i32> %23
  %25 = and <4 x i32> %24, <i32 32768, i32 32768, i32 32768, i32 32768>
  %26 = icmp eq <4 x i32> %25, zeroinitializer
  %27 = shl <4 x i32> %24, <i32 1, i32 1, i32 1, i32 1>
  %28 = xor <4 x i32> %27, <i32 4129, i32 4129, i32 4129, i32 4129>
  %29 = select <4 x i1> %26, <4 x i32> %27, <4 x i32> %28
  %30 = and <4 x i32> %29, <i32 32768, i32 32768, i32 32768, i32 32768>
  %31 = icmp eq <4 x i32> %30, zeroinitializer
  %32 = shl <4 x i32> %29, <i32 1, i32 1, i32 1, i32 1>
  %33 = xor <4 x i32> %32, <i32 4129, i32 4129, i32 4129, i32 4129>
  %34 = select <4 x i1> %31, <4 x i32> %32, <4 x i32> %33
  %35 = and <4 x i32> %34, <i32 32768, i32 32768, i32 32768, i32 32768>
  %36 = icmp eq <4 x i32> %35, zeroinitializer
  %37 = shl <4 x i32> %34, <i32 1, i32 1, i32 1, i32 1>
  %38 = xor <4 x i32> %37, <i32 4129, i32 4129, i32 4129, i32 4129>
  %39 = select <4 x i1> %36, <4 x i32> %37, <4 x i32> %38
  %40 = trunc <4 x i32> %39 to <4 x i16>
  %41 = getelementptr inbounds [256 x i16], [256 x i16]* @icrc.icrctb, i32 0, i32 %index
  %42 = bitcast i16* %41 to <4 x i16>*
  store <4 x i16> %40, <4 x i16>* %42, align 2, !tbaa !1
  %43 = and <4 x i32> %induction, <i32 15, i32 15, i32 15, i32 15>
  %44 = extractelement <4 x i32> %43, i32 0
  %45 = getelementptr inbounds [16 x i8], [16 x i8]* @icrc.it, i32 0, i32 %44
  %46 = extractelement <4 x i32> %43, i32 1
  %47 = getelementptr inbounds [16 x i8], [16 x i8]* @icrc.it, i32 0, i32 %46
  %48 = extractelement <4 x i32> %43, i32 2
  %49 = getelementptr inbounds [16 x i8], [16 x i8]* @icrc.it, i32 0, i32 %48
  %50 = extractelement <4 x i32> %43, i32 3
  %51 = getelementptr inbounds [16 x i8], [16 x i8]* @icrc.it, i32 0, i32 %50
  %52 = load i8, i8* %45, align 1, !tbaa !5
  %53 = insertelement <4 x i8> undef, i8 %52, i32 0
  %54 = load i8, i8* %47, align 1, !tbaa !5
  %55 = insertelement <4 x i8> %53, i8 %54, i32 1
  %56 = load i8, i8* %49, align 1, !tbaa !5
  %57 = insertelement <4 x i8> %55, i8 %56, i32 2
  %58 = load i8, i8* %51, align 1, !tbaa !5
  %59 = insertelement <4 x i8> %57, i8 %58, i32 3
  %60 = shl <4 x i8> %59, <i8 4, i8 4, i8 4, i8 4>
  %61 = lshr <4 x i32> %induction, <i32 4, i32 4, i32 4, i32 4>
  %62 = extractelement <4 x i32> %61, i32 0
  %63 = getelementptr inbounds [16 x i8], [16 x i8]* @icrc.it, i32 0, i32 %62
  %64 = extractelement <4 x i32> %61, i32 1
  %65 = getelementptr inbounds [16 x i8], [16 x i8]* @icrc.it, i32 0, i32 %64
  %66 = extractelement <4 x i32> %61, i32 2
  %67 = getelementptr inbounds [16 x i8], [16 x i8]* @icrc.it, i32 0, i32 %66
  %68 = extractelement <4 x i32> %61, i32 3
  %69 = getelementptr inbounds [16 x i8], [16 x i8]* @icrc.it, i32 0, i32 %68
  %70 = load i8, i8* %63, align 1, !tbaa !5
  %71 = insertelement <4 x i8> undef, i8 %70, i32 0
  %72 = load i8, i8* %65, align 1, !tbaa !5
  %73 = insertelement <4 x i8> %71, i8 %72, i32 1
  %74 = load i8, i8* %67, align 1, !tbaa !5
  %75 = insertelement <4 x i8> %73, i8 %74, i32 2
  %76 = load i8, i8* %69, align 1, !tbaa !5
  %77 = insertelement <4 x i8> %75, i8 %76, i32 3
  %78 = or <4 x i8> %60, %77
  %79 = getelementptr inbounds [256 x i8], [256 x i8]* @icrc.rchr, i32 0, i32 %index
  %80 = bitcast i8* %79 to <4 x i8>*
  store <4 x i8> %78, <4 x i8>* %80, align 1, !tbaa !5
  %index.next = add i32 %index, 4
  %81 = icmp eq i32 %index.next, 256
  br i1 %81, label %if.end.loopexit, label %vector.body, !llvm.loop !6

if.end.loopexit:                                  ; preds = %vector.body
  br label %if.end

if.end:                                           ; preds = %if.end.loopexit, %entry
  %cmp15 = icmp sgt i16 %jinit, -1
  br i1 %cmp15, label %if.then17, label %if.else

if.then17:                                        ; preds = %if.end
  %conv19 = and i16 %jinit, 255
  %shl22 = shl i16 %jinit, 8
  %or23 = or i16 %conv19, %shl22
  br label %for.cond45.preheader

if.else:                                          ; preds = %if.end
  %cmp25 = icmp slt i32 %jrev, 0
  br i1 %cmp25, label %if.then27, label %for.cond45.preheader

if.then27:                                        ; preds = %if.else
  %shr29128 = lshr i16 %crc, 8
  %conv30 = zext i16 %shr29128 to i32
  %arrayidx32 = getelementptr inbounds [256 x i8], [256 x i8]* @icrc.rchr, i32 0, i32 %conv30
  %82 = load i8, i8* %arrayidx32, align 1, !tbaa !5
  %conv33 = zext i8 %82 to i16
  %conv36 = zext i16 %crc to i32
  %idxprom37 = and i32 %conv36, 255
  %arrayidx38 = getelementptr inbounds [256 x i8], [256 x i8]* @icrc.rchr, i32 0, i32 %idxprom37
  %83 = load i8, i8* %arrayidx38, align 1, !tbaa !5
  %conv39 = zext i8 %83 to i16
  %shl40 = shl nuw i16 %conv39, 8
  %or41 = or i16 %shl40, %conv33
  br label %for.cond45.preheader

for.cond45.preheader:                             ; preds = %if.else, %if.then27, %if.then17
  %cword.1.ph = phi i16 [ %or23, %if.then17 ], [ %or41, %if.then27 ], [ %crc, %if.else ]
  %cmp47130 = icmp eq i32 %len, 0
  br i1 %cmp47130, label %for.end86, label %for.body49.lr.ph

for.body49.lr.ph:                                 ; preds = %for.cond45.preheader
  %cmp50 = icmp slt i32 %jrev, 0
  br i1 %cmp50, label %if.end73.us.preheader, label %if.end73.preheader

if.end73.preheader:                               ; preds = %for.body49.lr.ph
  br label %if.end73

if.end73.us.preheader:                            ; preds = %for.body49.lr.ph
  br label %if.end73.us

if.end73.us:                                      ; preds = %if.end73.us.preheader, %if.end73.us
  %conv46133.us = phi i32 [ %conv46.us, %if.end73.us ], [ 1, %if.end73.us.preheader ]
  %cword.1132.us = phi i16 [ %xor82.us, %if.end73.us ], [ %cword.1.ph, %if.end73.us.preheader ]
  %j.1131.us = phi i16 [ %inc85.us, %if.end73.us ], [ 1, %if.end73.us.preheader ]
  %arrayidx54.us = getelementptr inbounds i8, i8* %lin, i32 %conv46133.us
  %84 = load i8, i8* %arrayidx54.us, align 1, !tbaa !5
  %idxprom55.us = zext i8 %84 to i32
  %arrayidx56.us = getelementptr inbounds [256 x i8], [256 x i8]* @icrc.rchr, i32 0, i32 %idxprom55.us
  %85 = load i8, i8* %arrayidx56.us, align 1, !tbaa !5
  %conv57.us = zext i8 %85 to i32
  %shr59127.us = lshr i16 %cword.1132.us, 8
  %conv60.us = zext i16 %shr59127.us to i32
  %xor.us = xor i32 %conv57.us, %conv60.us
  %arrayidx75.us = getelementptr inbounds [256 x i16], [256 x i16]* @icrc.icrctb, i32 0, i32 %xor.us
  %86 = load i16, i16* %arrayidx75.us, align 2, !tbaa !1
  %conv80.us = shl i16 %cword.1132.us, 8
  %xor82.us = xor i16 %86, %conv80.us
  %inc85.us = add i16 %j.1131.us, 1
  %conv46.us = zext i16 %inc85.us to i32
  %cmp47.us = icmp ugt i32 %conv46.us, %len
  br i1 %cmp47.us, label %for.end86.loopexit, label %if.end73.us

if.end73:                                         ; preds = %if.end73.preheader, %if.end73
  %conv46133 = phi i32 [ %conv46, %if.end73 ], [ 1, %if.end73.preheader ]
  %cword.1132 = phi i16 [ %xor82, %if.end73 ], [ %cword.1.ph, %if.end73.preheader ]
  %j.1131 = phi i16 [ %inc85, %if.end73 ], [ 1, %if.end73.preheader ]
  %arrayidx54 = getelementptr inbounds i8, i8* %lin, i32 %conv46133
  %87 = load i8, i8* %arrayidx54, align 1, !tbaa !5
  %idxprom55 = zext i8 %87 to i32
  %shr68126 = lshr i16 %cword.1132, 8
  %conv69 = zext i16 %shr68126 to i32
  %xor71 = xor i32 %idxprom55, %conv69
  %arrayidx75 = getelementptr inbounds [256 x i16], [256 x i16]* @icrc.icrctb, i32 0, i32 %xor71
  %88 = load i16, i16* %arrayidx75, align 2, !tbaa !1
  %conv80 = shl i16 %cword.1132, 8
  %xor82 = xor i16 %88, %conv80
  %inc85 = add i16 %j.1131, 1
  %conv46 = zext i16 %inc85 to i32
  %cmp47 = icmp ugt i32 %conv46, %len
  br i1 %cmp47, label %for.end86.loopexit139, label %if.end73

for.end86.loopexit:                               ; preds = %if.end73.us
  %xor82.us.lcssa = phi i16 [ %xor82.us, %if.end73.us ]
  br label %for.end86

for.end86.loopexit139:                            ; preds = %if.end73
  %xor82.lcssa = phi i16 [ %xor82, %if.end73 ]
  br label %for.end86

for.end86:                                        ; preds = %for.end86.loopexit139, %for.end86.loopexit, %for.cond45.preheader
  %cword.1.lcssa = phi i16 [ %cword.1.ph, %for.cond45.preheader ], [ %xor82.us.lcssa, %for.end86.loopexit ], [ %xor82.lcssa, %for.end86.loopexit139 ]
  %cmp87 = icmp sgt i32 %jrev, -1
  br i1 %cmp87, label %if.end106, label %if.else90

if.else90:                                        ; preds = %for.end86
  %shr92125 = lshr i16 %cword.1.lcssa, 8
  %conv93 = zext i16 %shr92125 to i32
  %arrayidx95 = getelementptr inbounds [256 x i8], [256 x i8]* @icrc.rchr, i32 0, i32 %conv93
  %89 = load i8, i8* %arrayidx95, align 1, !tbaa !5
  %conv96 = zext i8 %89 to i16
  %conv99 = zext i16 %cword.1.lcssa to i32
  %idxprom100 = and i32 %conv99, 255
  %arrayidx101 = getelementptr inbounds [256 x i8], [256 x i8]* @icrc.rchr, i32 0, i32 %idxprom100
  %90 = load i8, i8* %arrayidx101, align 1, !tbaa !5
  %conv102 = zext i8 %90 to i16
  %shl103 = shl nuw i16 %conv102, 8
  %or104 = or i16 %shl103, %conv96
  br label %if.end106

if.end106:                                        ; preds = %for.end86, %if.else90
  %tmp2.0 = phi i16 [ %or104, %if.else90 ], [ %cword.1.lcssa, %for.end86 ]
  ret i16 %tmp2.0
}

; Function Attrs: nounwind
define i32 @main(i32 %argc, i8** nocapture readnone %argv) #1 {
entry:
  %0 = load i8*, i8** @aa, align 4, !tbaa !9
  %call = tail call zeroext i16 @icrc(i16 zeroext 0, i8* %0, i32 40, i16 signext 0, i32 1)
  %1 = load i8*, i8** @aa, align 4, !tbaa !9
  %call1 = tail call zeroext i16 @icrc(i16 zeroext %call, i8* %1, i32 42, i16 signext -1, i32 1)
  %cmp = icmp eq i16 %call1, 268
  br i1 %cmp, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  %puts5 = tail call i32 @puts(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str3, i32 0, i32 0))
  br label %return

if.else:                                          ; preds = %entry
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str, i32 0, i32 0))
  br label %return

return:                                           ; preds = %if.else, %if.then
  %retval.0 = phi i32 [ 15, %if.then ], [ 66, %if.else ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

attributes #0 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"short", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!3, !3, i64 0}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = !{!10, !10, i64 0}
!10 = !{!"any pointer", !3, i64 0}
