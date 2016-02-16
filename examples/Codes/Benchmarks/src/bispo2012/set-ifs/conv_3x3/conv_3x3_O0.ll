; ModuleID = 'conv_3x3_new.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@inptr = constant [450 x i8] c"`8z\BE\F6:\B7\03>m+K#M/X\08\07\F2\F1\0FpX\F6\988\1F\B4\08_Cz\CB\E7\A4l\9B\CA\E5\96\01.\96D\1C\D6\94\90\A0\DC\AF;!\9D\8E\C0\91\F3\CF\A6\07\A9r\15\C1+w\ACl}\C4\91\A2nL\C9\B3\0Cn\C8\A7Z\9AK\83@:f\CB\C2\CE\D8HtY\A6\0B-\FB\E6\B1\FA\DF\DB\E7VVB0\97D\EB\E5\AA\BA\8A}\02\E4\CE\0E\CD%\B3\14h\80\14p\159\83\B2\EB\BB\5C\9A\0D\BC\17\DB\1E\9E\DE#\F4\18_W\8B\15\E2#;\DC\9D\B1-pG\B7\0B9\EA\B7\F6\E3\FD\82\BD\85\B1\FDJ\06\8B'_\BC2Z\82U\8A\D06\FA\00hk\B1'\AA6\02\84\08\C4\DD\A5f\8C\BAx\DC\C4\01\D9\BA\15\ADl\CC\91+\AC\DE\E4\87D\82\C9\CA\9D\10\C0\9D\B7\ED\FD1<\10\A3b\D2\C21\1A\B0\A4<\F3t\F6^ 2\15n\8D\D0E\F1C\90\B1\CF\11\ED\AFIh\ABG*\86)\F5<\D7\F9\AE\FD\97\B2 \92\BB\04>\FC\11\0C\FB\89\A6\E8T\8Cg\8E\94P\0A\D9\D3I.\E4\BF\8C\C0\9B\9E\80\A1\8E\93\D5\85\08\1F\B5\1E`\EA:x\8E\C3\1F\A6\00\E5\B9\9E\AE|'alg\C8^~>\ED\18q\95\CF\06(\82\C3\B94\5C\ABDi\C5\AF\D7\AD\EB-\AD\13\0A\ED('4\999\8BTk\05\C2p(\C5K-L\ED\F1\98\86\90a#f\02\FD\ECT\BE\EFE\C4\8A\7Fp\A7\D8\A9\AA$o\EAj\87JZ\EAy\C0\FF\E6q\E4_\A3j.V2\D6Z*\F5\D2\90\DCb\9A\C4\C0\06>_O\CD\95\1E<\80r:\C4\8E\15\C9J\0E\E4", align 1
@mask = constant [9 x i8] c"s\D8o\92\FC\F0\E5\DD\D5", align 1
@.str = private unnamed_addr constant [12 x i8] c"%d  %d  %d\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind
define void @IMG_conv_3x3_c(i8* %inptr, i8* %outptr, i32 %x_dim, i8* %mask, i32 %shift) #0 {
entry:
  %inptr.addr = alloca i8*, align 4
  %outptr.addr = alloca i8*, align 4
  %x_dim.addr = alloca i32, align 4
  %mask.addr = alloca i8*, align 4
  %shift.addr = alloca i32, align 4
  %IN1 = alloca i8*, align 4
  %IN2 = alloca i8*, align 4
  %IN3 = alloca i8*, align 4
  %OUT = alloca i8*, align 4
  %pix10 = alloca i16, align 2
  %pix20 = alloca i16, align 2
  %pix30 = alloca i16, align 2
  %mask10 = alloca i16, align 2
  %mask20 = alloca i16, align 2
  %mask30 = alloca i16, align 2
  %sum = alloca i32, align 4
  %sum00 = alloca i32, align 4
  %sum11 = alloca i32, align 4
  %i = alloca i32, align 4
  %sum22 = alloca i32, align 4
  %j = alloca i32, align 4
  store i8* %inptr, i8** %inptr.addr, align 4
  store i8* %outptr, i8** %outptr.addr, align 4
  store i32 %x_dim, i32* %x_dim.addr, align 4
  store i8* %mask, i8** %mask.addr, align 4
  store i32 %shift, i32* %shift.addr, align 4
  %0 = load i8*, i8** %inptr.addr, align 4
  store i8* %0, i8** %IN1, align 4
  %1 = load i8*, i8** %IN1, align 4
  %2 = load i32, i32* %x_dim.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %1, i32 %2
  store i8* %add.ptr, i8** %IN2, align 4
  %3 = load i8*, i8** %IN2, align 4
  %4 = load i32, i32* %x_dim.addr, align 4
  %add.ptr1 = getelementptr inbounds i8, i8* %3, i32 %4
  store i8* %add.ptr1, i8** %IN3, align 4
  %5 = load i8*, i8** %outptr.addr, align 4
  store i8* %5, i8** %OUT, align 4
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc42, %entry
  %6 = load i32, i32* %j, align 4
  %7 = load i32, i32* %x_dim.addr, align 4
  %cmp = icmp slt i32 %6, %7
  br i1 %cmp, label %for.body, label %for.end44

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %sum, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %8 = load i32, i32* %i, align 4
  %cmp3 = icmp slt i32 %8, 3
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %9 = load i32, i32* %i, align 4
  %10 = load i8*, i8** %IN1, align 4
  %arrayidx = getelementptr inbounds i8, i8* %10, i32 %9
  %11 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %11 to i16
  store i16 %conv, i16* %pix10, align 2
  %12 = load i32, i32* %i, align 4
  %13 = load i8*, i8** %IN2, align 4
  %arrayidx5 = getelementptr inbounds i8, i8* %13, i32 %12
  %14 = load i8, i8* %arrayidx5, align 1
  %conv6 = zext i8 %14 to i16
  store i16 %conv6, i16* %pix20, align 2
  %15 = load i32, i32* %i, align 4
  %16 = load i8*, i8** %IN3, align 4
  %arrayidx7 = getelementptr inbounds i8, i8* %16, i32 %15
  %17 = load i8, i8* %arrayidx7, align 1
  %conv8 = zext i8 %17 to i16
  store i16 %conv8, i16* %pix30, align 2
  %18 = load i16, i16* %pix10, align 2
  %conv9 = sext i16 %18 to i32
  %19 = load i16, i16* %pix20, align 2
  %conv10 = sext i16 %19 to i32
  %20 = load i16, i16* %pix30, align 2
  %conv11 = sext i16 %20 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 %conv9, i32 %conv10, i32 %conv11)
  %21 = load i32, i32* %i, align 4
  %22 = load i8*, i8** %mask.addr, align 4
  %arrayidx12 = getelementptr inbounds i8, i8* %22, i32 %21
  %23 = load i8, i8* %arrayidx12, align 1
  %conv13 = sext i8 %23 to i16
  store i16 %conv13, i16* %mask10, align 2
  %24 = load i32, i32* %i, align 4
  %add = add nsw i32 %24, 3
  %25 = load i8*, i8** %mask.addr, align 4
  %arrayidx14 = getelementptr inbounds i8, i8* %25, i32 %add
  %26 = load i8, i8* %arrayidx14, align 1
  %conv15 = sext i8 %26 to i16
  store i16 %conv15, i16* %mask20, align 2
  %27 = load i32, i32* %i, align 4
  %add16 = add nsw i32 %27, 6
  %28 = load i8*, i8** %mask.addr, align 4
  %arrayidx17 = getelementptr inbounds i8, i8* %28, i32 %add16
  %29 = load i8, i8* %arrayidx17, align 1
  %conv18 = sext i8 %29 to i16
  store i16 %conv18, i16* %mask30, align 2
  %30 = load i16, i16* %pix10, align 2
  %conv19 = sext i16 %30 to i32
  %31 = load i16, i16* %mask10, align 2
  %conv20 = sext i16 %31 to i32
  %mul = mul nsw i32 %conv19, %conv20
  store i32 %mul, i32* %sum00, align 4
  %32 = load i16, i16* %pix20, align 2
  %conv21 = sext i16 %32 to i32
  %33 = load i16, i16* %mask20, align 2
  %conv22 = sext i16 %33 to i32
  %mul23 = mul nsw i32 %conv21, %conv22
  store i32 %mul23, i32* %sum11, align 4
  %34 = load i16, i16* %pix30, align 2
  %conv24 = sext i16 %34 to i32
  %35 = load i16, i16* %mask30, align 2
  %conv25 = sext i16 %35 to i32
  %mul26 = mul nsw i32 %conv24, %conv25
  store i32 %mul26, i32* %sum22, align 4
  %36 = load i32, i32* %sum00, align 4
  %37 = load i32, i32* %sum11, align 4
  %38 = load i32, i32* %sum22, align 4
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0), i32 %36, i32 %37, i32 %38)
  %39 = load i32, i32* %sum00, align 4
  %40 = load i32, i32* %sum11, align 4
  %add28 = add nsw i32 %39, %40
  %41 = load i32, i32* %sum22, align 4
  %add29 = add nsw i32 %add28, %41
  %42 = load i32, i32* %sum, align 4
  %add30 = add nsw i32 %42, %add29
  store i32 %add30, i32* %sum, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %43 = load i32, i32* %i, align 4
  %inc = add nsw i32 %43, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  %44 = load i8*, i8** %IN1, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %44, i32 1
  store i8* %incdec.ptr, i8** %IN1, align 4
  %45 = load i8*, i8** %IN2, align 4
  %incdec.ptr31 = getelementptr inbounds i8, i8* %45, i32 1
  store i8* %incdec.ptr31, i8** %IN2, align 4
  %46 = load i8*, i8** %IN3, align 4
  %incdec.ptr32 = getelementptr inbounds i8, i8* %46, i32 1
  store i8* %incdec.ptr32, i8** %IN3, align 4
  %47 = load i32, i32* %sum, align 4
  %48 = load i32, i32* %shift.addr, align 4
  %shr = ashr i32 %47, %48
  store i32 %shr, i32* %sum, align 4
  %49 = load i32, i32* %sum, align 4
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str1, i32 0, i32 0), i32 %49)
  %50 = load i32, i32* %sum, align 4
  %cmp34 = icmp slt i32 %50, 0
  br i1 %cmp34, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  store i32 0, i32* %sum, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.end
  %51 = load i32, i32* %sum, align 4
  %cmp36 = icmp sgt i32 %51, 255
  br i1 %cmp36, label %if.then38, label %if.end39

if.then38:                                        ; preds = %if.end
  store i32 255, i32* %sum, align 4
  br label %if.end39

if.end39:                                         ; preds = %if.then38, %if.end
  %52 = load i32, i32* %sum, align 4
  %conv40 = trunc i32 %52 to i8
  %53 = load i8*, i8** %OUT, align 4
  %incdec.ptr41 = getelementptr inbounds i8, i8* %53, i32 1
  store i8* %incdec.ptr41, i8** %OUT, align 4
  store i8 %conv40, i8* %53, align 1
  br label %for.inc42

for.inc42:                                        ; preds = %if.end39
  %54 = load i32, i32* %j, align 4
  %inc43 = add nsw i32 %54, 1
  store i32 %inc43, i32* %j, align 4
  br label %for.cond

for.end44:                                        ; preds = %for.cond
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %outptr = alloca [150 x i8], align 1
  %x_dim = alloca i32, align 4
  %shift = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 150, i32* %x_dim, align 4
  store i32 0, i32* %shift, align 4
  %arraydecay = getelementptr inbounds [150 x i8], [150 x i8]* %outptr, i32 0, i32 0
  %0 = load i32, i32* %x_dim, align 4
  %1 = load i32, i32* %shift, align 4
  call void @IMG_conv_3x3_c(i8* getelementptr inbounds ([450 x i8], [450 x i8]* @inptr, i32 0, i32 0), i8* %arraydecay, i32 %0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @mask, i32 0, i32 0), i32 %1)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %2, 150
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [150 x i8], [150 x i8]* %outptr, i32 0, i32 %3
  %4 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %4 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str1, i32 0, i32 0), i32 %conv)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
