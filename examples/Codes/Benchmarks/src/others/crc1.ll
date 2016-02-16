; ModuleID = 'crc.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@.str = private unnamed_addr constant [44 x i8] c"asdffeagewaHAFEFaeDsFEawFdsFaefaeerdjgpim23\00", align 1
@aa = global i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), align 4
@icrc.icrctb = internal unnamed_addr global [256 x i16] zeroinitializer, align 2
@icrc.init = internal unnamed_addr global i1 false
@icrc.rchr = internal unnamed_addr global [256 x i8] zeroinitializer, align 1
@icrc.it = internal unnamed_addr constant [16 x i8] c"\00\08\04\0C\02\0A\06\0E\01\09\05\0D\03\0B\07\0F", align 1
@.str1 = private unnamed_addr constant [5 x i8] c"666\0A\00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c"-1\0A\00", align 1
@str = private unnamed_addr constant [3 x i8] c"-1\00"
@str3 = private unnamed_addr constant [4 x i8] c"666\00"

; Function Attrs: nounwind readnone
define zeroext i16 @icrc1(i16 zeroext %crc, i8 zeroext %onech) #0 {
entry:
  %conv1 = zext i8 %onech to i16
  %shl = shl nuw i16 %conv1, 8
  %xor = xor i16 %shl, %crc
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %ans.015 = phi i16 [ %xor, %entry ], [ %ans.1, %for.body ]
  %i.014 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %conv4 = zext i16 %ans.015 to i32
  %and = and i32 %conv4, 32768
  %tobool = icmp eq i32 %and, 0
  %shl6 = shl nuw nsw i32 %conv4, 1
  %xor7 = xor i32 %shl6, 4129
  %ans.1.in = select i1 %tobool, i32 %shl6, i32 %xor7
  %ans.1 = trunc i32 %ans.1.in to i16
  %inc = add nuw nsw i32 %i.014, 1
  %exitcond = icmp eq i32 %inc, 8
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  ret i16 %ans.1
}

; Function Attrs: nounwind
define zeroext i16 @icrc(i16 zeroext %crc, i8* nocapture readonly %lin, i32 %len, i16 signext %jinit, i32 %jrev) #1 {
entry:
  %.b = load i1, i1* @icrc.init, align 1
  br i1 %.b, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i1 true, i1* @icrc.init, align 1
  br label %for.body

for.body:                                         ; preds = %for.body, %if.then
  %indvars.iv = phi i32 [ 0, %if.then ], [ %indvars.iv.next, %for.body ]
  %0 = shl i32 %indvars.iv, 8
  %1 = trunc i32 %0 to i16
  %call = tail call zeroext i16 @icrc1(i16 zeroext %1, i8 zeroext 0)
  %arrayidx = getelementptr inbounds [256 x i16], [256 x i16]* @icrc.icrctb, i32 0, i32 %indvars.iv
  store i16 %call, i16* %arrayidx, align 2, !tbaa !1
  %and = and i32 %indvars.iv, 15
  %arrayidx5 = getelementptr inbounds [16 x i8], [16 x i8]* @icrc.it, i32 0, i32 %and
  %2 = load i8, i8* %arrayidx5, align 1, !tbaa !5
  %shl7 = shl i8 %2, 4
  %shr129 = lshr i32 %indvars.iv, 4
  %arrayidx9 = getelementptr inbounds [16 x i8], [16 x i8]* @icrc.it, i32 0, i32 %shr129
  %3 = load i8, i8* %arrayidx9, align 1, !tbaa !5
  %or = or i8 %shl7, %3
  %arrayidx13 = getelementptr inbounds [256 x i8], [256 x i8]* @icrc.rchr, i32 0, i32 %indvars.iv
  store i8 %or, i8* %arrayidx13, align 1, !tbaa !5
  %indvars.iv.next = add nuw nsw i32 %indvars.iv, 1
  %exitcond = icmp eq i32 %indvars.iv.next, 256
  br i1 %exitcond, label %if.end, label %for.body

if.end:                                           ; preds = %for.body, %entry
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
  %4 = load i8, i8* %arrayidx32, align 1, !tbaa !5
  %conv33 = zext i8 %4 to i16
  %conv36 = zext i16 %crc to i32
  %idxprom37 = and i32 %conv36, 255
  %arrayidx38 = getelementptr inbounds [256 x i8], [256 x i8]* @icrc.rchr, i32 0, i32 %idxprom37
  %5 = load i8, i8* %arrayidx38, align 1, !tbaa !5
  %conv39 = zext i8 %5 to i16
  %shl40 = shl nuw i16 %conv39, 8
  %or41 = or i16 %shl40, %conv33
  br label %for.cond45.preheader

for.cond45.preheader:                             ; preds = %if.else, %if.then27, %if.then17
  %cword.1.ph = phi i16 [ %or23, %if.then17 ], [ %or41, %if.then27 ], [ %crc, %if.else ]
  %cmp47130 = icmp eq i32 %len, 0
  br i1 %cmp47130, label %for.end86, label %for.body49.lr.ph

for.body49.lr.ph:                                 ; preds = %for.cond45.preheader
  %cmp50 = icmp slt i32 %jrev, 0
  br label %for.body49

for.body49:                                       ; preds = %for.body49.lr.ph, %if.end73
  %conv46133 = phi i32 [ 1, %for.body49.lr.ph ], [ %conv46, %if.end73 ]
  %cword.1132 = phi i16 [ %cword.1.ph, %for.body49.lr.ph ], [ %xor82, %if.end73 ]
  %j.1131 = phi i16 [ 1, %for.body49.lr.ph ], [ %inc85, %if.end73 ]
  %arrayidx54 = getelementptr inbounds i8, i8* %lin, i32 %conv46133
  %6 = load i8, i8* %arrayidx54, align 1, !tbaa !5
  %idxprom55 = zext i8 %6 to i32
  br i1 %cmp50, label %if.then52, label %if.else63

if.then52:                                        ; preds = %for.body49
  %arrayidx56 = getelementptr inbounds [256 x i8], [256 x i8]* @icrc.rchr, i32 0, i32 %idxprom55
  %7 = load i8, i8* %arrayidx56, align 1, !tbaa !5
  %conv57 = zext i8 %7 to i32
  %shr59127 = lshr i16 %cword.1132, 8
  %conv60 = zext i16 %shr59127 to i32
  %xor = xor i32 %conv57, %conv60
  br label %if.end73

if.else63:                                        ; preds = %for.body49
  %shr68126 = lshr i16 %cword.1132, 8
  %conv69 = zext i16 %shr68126 to i32
  %xor71 = xor i32 %idxprom55, %conv69
  br label %if.end73

if.end73:                                         ; preds = %if.else63, %if.then52
  %tmp1.0.in = phi i32 [ %xor, %if.then52 ], [ %xor71, %if.else63 ]
  %idxprom74 = and i32 %tmp1.0.in, 65535
  %arrayidx75 = getelementptr inbounds [256 x i16], [256 x i16]* @icrc.icrctb, i32 0, i32 %idxprom74
  %8 = load i16, i16* %arrayidx75, align 2, !tbaa !1
  %conv80 = shl i16 %cword.1132, 8
  %xor82 = xor i16 %8, %conv80
  %inc85 = add i16 %j.1131, 1
  %conv46 = zext i16 %inc85 to i32
  %cmp47 = icmp ugt i32 %conv46, %len
  br i1 %cmp47, label %for.end86, label %for.body49

for.end86:                                        ; preds = %if.end73, %for.cond45.preheader
  %cword.1.lcssa = phi i16 [ %cword.1.ph, %for.cond45.preheader ], [ %xor82, %if.end73 ]
  %cmp87 = icmp sgt i32 %jrev, -1
  br i1 %cmp87, label %if.end106, label %if.else90

if.else90:                                        ; preds = %for.end86
  %shr92125 = lshr i16 %cword.1.lcssa, 8
  %conv93 = zext i16 %shr92125 to i32
  %arrayidx95 = getelementptr inbounds [256 x i8], [256 x i8]* @icrc.rchr, i32 0, i32 %conv93
  %9 = load i8, i8* %arrayidx95, align 1, !tbaa !5
  %conv96 = zext i8 %9 to i16
  %conv99 = zext i16 %cword.1.lcssa to i32
  %idxprom100 = and i32 %conv99, 255
  %arrayidx101 = getelementptr inbounds [256 x i8], [256 x i8]* @icrc.rchr, i32 0, i32 %idxprom100
  %10 = load i8, i8* %arrayidx101, align 1, !tbaa !5
  %conv102 = zext i8 %10 to i16
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
  %0 = load i8*, i8** @aa, align 4, !tbaa !6
  %call = tail call zeroext i16 @icrc(i16 zeroext 0, i8* %0, i32 40, i16 signext 0, i32 1)
  %1 = load i8*, i8** @aa, align 4, !tbaa !6
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
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !3, i64 0}
