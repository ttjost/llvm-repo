; ModuleID = 'crc.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@.str = private unnamed_addr constant [44 x i8] c"asdffeagewaHAFEFaeDsFEawFdsFaefaeerdjgpim23\00", align 1
@aa = global i8* getelementptr inbounds ([44 x i8], [44 x i8]* @.str, i32 0, i32 0), align 4
@icrc.icrctb = internal global [256 x i16] zeroinitializer, align 2
@icrc.init = internal global i16 0, align 2
@icrc.rchr = internal global [256 x i8] zeroinitializer, align 1
@icrc.it = internal global [16 x i8] c"\00\08\04\0C\02\0A\06\0E\01\09\05\0D\03\0B\07\0F", align 1
@.str1 = private unnamed_addr constant [5 x i8] c"666\0A\00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c"-1\0A\00", align 1

; Function Attrs: nounwind
define zeroext i16 @icrc1(i16 zeroext %crc, i8 zeroext %onech) #0 {
entry:
  %crc.addr = alloca i16, align 2
  %onech.addr = alloca i8, align 1
  %i = alloca i32, align 4
  %ans = alloca i16, align 2
  store i16 %crc, i16* %crc.addr, align 2
  store i8 %onech, i8* %onech.addr, align 1
  %0 = load i16, i16* %crc.addr, align 2
  %conv = zext i16 %0 to i32
  %1 = load i8, i8* %onech.addr, align 1
  %conv1 = zext i8 %1 to i32
  %shl = shl i32 %conv1, 8
  %xor = xor i32 %conv, %shl
  %conv2 = trunc i32 %xor to i16
  store i16 %conv2, i16* %ans, align 2
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %2, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i16, i16* %ans, align 2
  %conv4 = zext i16 %3 to i32
  %and = and i32 %conv4, 32768
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %4 = load i16, i16* %ans, align 2
  %conv5 = zext i16 %4 to i32
  %shl6 = shl i32 %conv5, 1
  %xor7 = xor i32 %shl6, 4129
  %conv8 = trunc i32 %xor7 to i16
  store i16 %conv8, i16* %ans, align 2
  br label %if.end

if.else:                                          ; preds = %for.body
  %5 = load i16, i16* %ans, align 2
  %conv9 = zext i16 %5 to i32
  %shl10 = shl i32 %conv9, 1
  %conv11 = trunc i32 %shl10 to i16
  store i16 %conv11, i16* %ans, align 2
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %6 = load i32, i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %7 = load i16, i16* %ans, align 2
  ret i16 %7
}

; Function Attrs: nounwind
define zeroext i16 @icrc(i16 zeroext %crc, i8* %lin, i32 %len, i16 signext %jinit, i32 %jrev) #0 {
entry:
  %crc.addr = alloca i16, align 2
  %lin.addr = alloca i8*, align 4
  %len.addr = alloca i32, align 4
  %jinit.addr = alloca i16, align 2
  %jrev.addr = alloca i32, align 4
  %tmp1 = alloca i16, align 2
  %tmp2 = alloca i16, align 2
  %j = alloca i16, align 2
  %cword = alloca i16, align 2
  store i16 %crc, i16* %crc.addr, align 2
  store i8* %lin, i8** %lin.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  store i16 %jinit, i16* %jinit.addr, align 2
  store i32 %jrev, i32* %jrev.addr, align 4
  %0 = load i16, i16* %crc.addr, align 2
  store i16 %0, i16* %cword, align 2
  %1 = load i16, i16* @icrc.init, align 2
  %tobool = icmp ne i16 %1, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  store i16 1, i16* @icrc.init, align 2
  store i16 0, i16* %j, align 2
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %2 = load i16, i16* %j, align 2
  %conv = zext i16 %2 to i32
  %cmp = icmp sle i32 %conv, 255
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i16, i16* %j, align 2
  %conv2 = zext i16 %3 to i32
  %shl = shl i32 %conv2, 8
  %conv3 = trunc i32 %shl to i16
  %call = call zeroext i16 @icrc1(i16 zeroext %conv3, i8 zeroext 0)
  %4 = load i16, i16* %j, align 2
  %idxprom = zext i16 %4 to i32
  %arrayidx = getelementptr inbounds [256 x i16], [256 x i16]* @icrc.icrctb, i32 0, i32 %idxprom
  store i16 %call, i16* %arrayidx, align 2
  %5 = load i16, i16* %j, align 2
  %conv4 = zext i16 %5 to i32
  %and = and i32 %conv4, 15
  %arrayidx5 = getelementptr inbounds [16 x i8], [16 x i8]* @icrc.it, i32 0, i32 %and
  %6 = load i8, i8* %arrayidx5, align 1
  %conv6 = zext i8 %6 to i32
  %shl7 = shl i32 %conv6, 4
  %7 = load i16, i16* %j, align 2
  %conv8 = zext i16 %7 to i32
  %shr = ashr i32 %conv8, 4
  %arrayidx9 = getelementptr inbounds [16 x i8], [16 x i8]* @icrc.it, i32 0, i32 %shr
  %8 = load i8, i8* %arrayidx9, align 1
  %conv10 = zext i8 %8 to i32
  %or = or i32 %shl7, %conv10
  %conv11 = trunc i32 %or to i8
  %9 = load i16, i16* %j, align 2
  %idxprom12 = zext i16 %9 to i32
  %arrayidx13 = getelementptr inbounds [256 x i8], [256 x i8]* @icrc.rchr, i32 0, i32 %idxprom12
  store i8 %conv11, i8* %arrayidx13, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i16, i16* %j, align 2
  %inc = add i16 %10, 1
  store i16 %inc, i16* %j, align 2
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end

if.end:                                           ; preds = %for.end, %entry
  %11 = load i16, i16* %jinit.addr, align 2
  %conv14 = sext i16 %11 to i32
  %cmp15 = icmp sge i32 %conv14, 0
  br i1 %cmp15, label %if.then17, label %if.else

if.then17:                                        ; preds = %if.end
  %12 = load i16, i16* %jinit.addr, align 2
  %conv18 = trunc i16 %12 to i8
  %conv19 = zext i8 %conv18 to i32
  %13 = load i16, i16* %jinit.addr, align 2
  %conv20 = trunc i16 %13 to i8
  %conv21 = zext i8 %conv20 to i32
  %shl22 = shl i32 %conv21, 8
  %or23 = or i32 %conv19, %shl22
  %conv24 = trunc i32 %or23 to i16
  store i16 %conv24, i16* %cword, align 2
  br label %if.end44

if.else:                                          ; preds = %if.end
  %14 = load i32, i32* %jrev.addr, align 4
  %cmp25 = icmp slt i32 %14, 0
  br i1 %cmp25, label %if.then27, label %if.end43

if.then27:                                        ; preds = %if.else
  %15 = load i16, i16* %cword, align 2
  %conv28 = zext i16 %15 to i32
  %shr29 = ashr i32 %conv28, 8
  %conv30 = trunc i32 %shr29 to i8
  %idxprom31 = zext i8 %conv30 to i32
  %arrayidx32 = getelementptr inbounds [256 x i8], [256 x i8]* @icrc.rchr, i32 0, i32 %idxprom31
  %16 = load i8, i8* %arrayidx32, align 1
  %conv33 = zext i8 %16 to i32
  %17 = load i16, i16* %cword, align 2
  %conv34 = zext i16 %17 to i32
  %and35 = and i32 %conv34, 255
  %conv36 = trunc i32 %and35 to i8
  %idxprom37 = zext i8 %conv36 to i32
  %arrayidx38 = getelementptr inbounds [256 x i8], [256 x i8]* @icrc.rchr, i32 0, i32 %idxprom37
  %18 = load i8, i8* %arrayidx38, align 1
  %conv39 = zext i8 %18 to i32
  %shl40 = shl i32 %conv39, 8
  %or41 = or i32 %conv33, %shl40
  %conv42 = trunc i32 %or41 to i16
  store i16 %conv42, i16* %cword, align 2
  br label %if.end43

if.end43:                                         ; preds = %if.then27, %if.else
  br label %if.end44

if.end44:                                         ; preds = %if.end43, %if.then17
  store i16 1, i16* %j, align 2
  br label %for.cond45

for.cond45:                                       ; preds = %for.inc84, %if.end44
  %19 = load i16, i16* %j, align 2
  %conv46 = zext i16 %19 to i32
  %20 = load i32, i32* %len.addr, align 4
  %cmp47 = icmp ule i32 %conv46, %20
  br i1 %cmp47, label %for.body49, label %for.end86

for.body49:                                       ; preds = %for.cond45
  %21 = load i32, i32* %jrev.addr, align 4
  %cmp50 = icmp slt i32 %21, 0
  br i1 %cmp50, label %if.then52, label %if.else63

if.then52:                                        ; preds = %for.body49
  %22 = load i16, i16* %j, align 2
  %idxprom53 = zext i16 %22 to i32
  %23 = load i8*, i8** %lin.addr, align 4
  %arrayidx54 = getelementptr inbounds i8, i8* %23, i32 %idxprom53
  %24 = load i8, i8* %arrayidx54, align 1
  %idxprom55 = zext i8 %24 to i32
  %arrayidx56 = getelementptr inbounds [256 x i8], [256 x i8]* @icrc.rchr, i32 0, i32 %idxprom55
  %25 = load i8, i8* %arrayidx56, align 1
  %conv57 = zext i8 %25 to i32
  %26 = load i16, i16* %cword, align 2
  %conv58 = zext i16 %26 to i32
  %shr59 = ashr i32 %conv58, 8
  %conv60 = trunc i32 %shr59 to i8
  %conv61 = zext i8 %conv60 to i32
  %xor = xor i32 %conv57, %conv61
  %conv62 = trunc i32 %xor to i16
  store i16 %conv62, i16* %tmp1, align 2
  br label %if.end73

if.else63:                                        ; preds = %for.body49
  %27 = load i16, i16* %j, align 2
  %idxprom64 = zext i16 %27 to i32
  %28 = load i8*, i8** %lin.addr, align 4
  %arrayidx65 = getelementptr inbounds i8, i8* %28, i32 %idxprom64
  %29 = load i8, i8* %arrayidx65, align 1
  %conv66 = zext i8 %29 to i32
  %30 = load i16, i16* %cword, align 2
  %conv67 = zext i16 %30 to i32
  %shr68 = ashr i32 %conv67, 8
  %conv69 = trunc i32 %shr68 to i8
  %conv70 = zext i8 %conv69 to i32
  %xor71 = xor i32 %conv66, %conv70
  %conv72 = trunc i32 %xor71 to i16
  store i16 %conv72, i16* %tmp1, align 2
  br label %if.end73

if.end73:                                         ; preds = %if.else63, %if.then52
  %31 = load i16, i16* %tmp1, align 2
  %idxprom74 = zext i16 %31 to i32
  %arrayidx75 = getelementptr inbounds [256 x i16], [256 x i16]* @icrc.icrctb, i32 0, i32 %idxprom74
  %32 = load i16, i16* %arrayidx75, align 2
  %conv76 = zext i16 %32 to i32
  %33 = load i16, i16* %cword, align 2
  %conv77 = zext i16 %33 to i32
  %and78 = and i32 %conv77, 255
  %conv79 = trunc i32 %and78 to i8
  %conv80 = zext i8 %conv79 to i32
  %shl81 = shl i32 %conv80, 8
  %xor82 = xor i32 %conv76, %shl81
  %conv83 = trunc i32 %xor82 to i16
  store i16 %conv83, i16* %cword, align 2
  br label %for.inc84

for.inc84:                                        ; preds = %if.end73
  %34 = load i16, i16* %j, align 2
  %inc85 = add i16 %34, 1
  store i16 %inc85, i16* %j, align 2
  br label %for.cond45

for.end86:                                        ; preds = %for.cond45
  %35 = load i32, i32* %jrev.addr, align 4
  %cmp87 = icmp sge i32 %35, 0
  br i1 %cmp87, label %if.then89, label %if.else90

if.then89:                                        ; preds = %for.end86
  %36 = load i16, i16* %cword, align 2
  store i16 %36, i16* %tmp2, align 2
  br label %if.end106

if.else90:                                        ; preds = %for.end86
  %37 = load i16, i16* %cword, align 2
  %conv91 = zext i16 %37 to i32
  %shr92 = ashr i32 %conv91, 8
  %conv93 = trunc i32 %shr92 to i8
  %idxprom94 = zext i8 %conv93 to i32
  %arrayidx95 = getelementptr inbounds [256 x i8], [256 x i8]* @icrc.rchr, i32 0, i32 %idxprom94
  %38 = load i8, i8* %arrayidx95, align 1
  %conv96 = zext i8 %38 to i32
  %39 = load i16, i16* %cword, align 2
  %conv97 = zext i16 %39 to i32
  %and98 = and i32 %conv97, 255
  %conv99 = trunc i32 %and98 to i8
  %idxprom100 = zext i8 %conv99 to i32
  %arrayidx101 = getelementptr inbounds [256 x i8], [256 x i8]* @icrc.rchr, i32 0, i32 %idxprom100
  %40 = load i8, i8* %arrayidx101, align 1
  %conv102 = zext i8 %40 to i32
  %shl103 = shl i32 %conv102, 8
  %or104 = or i32 %conv96, %shl103
  %conv105 = trunc i32 %or104 to i16
  store i16 %conv105, i16* %tmp2, align 2
  br label %if.end106

if.end106:                                        ; preds = %if.else90, %if.then89
  %41 = load i16, i16* %tmp2, align 2
  ret i16 %41
}

; Function Attrs: nounwind
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 4
  %i1 = alloca i16, align 2
  %i2 = alloca i16, align 2
  %n = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 4
  %0 = load i8*, i8** @aa, align 4
  %call = call zeroext i16 @icrc(i16 zeroext 0, i8* %0, i32 40, i16 signext 0, i32 1)
  store i16 %call, i16* %i1, align 2
  %1 = load i16, i16* %i1, align 2
  %2 = load i8*, i8** @aa, align 4
  %call1 = call zeroext i16 @icrc(i16 zeroext %1, i8* %2, i32 42, i16 signext -1, i32 1)
  store i16 %call1, i16* %i2, align 2
  %3 = load i16, i16* %i2, align 2
  %conv = zext i16 %3 to i32
  %cmp = icmp ne i32 %conv, 268
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str1, i32 0, i32 0))
  store i32 15, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str2, i32 0, i32 0))
  store i32 66, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %retval
  ret i32 %4
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"}
