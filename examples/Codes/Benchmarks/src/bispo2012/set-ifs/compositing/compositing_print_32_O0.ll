; ModuleID = 'compositing_print.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@image1 = global [200 x i8] c"`8z\BE\F6:\B7\03>m+K#M/X\08\07\F2\F1\0FpX\F6\988\1F\B4\08_Cz\CB\E7\A4l\9B\CA\E5\96\01.\96D\1C\D6\94\90\A0\DC\AF;!\9D\8E\C0\91\F3\CF\A6\07\A9r\15\C1+w\ACl}\C4\91\A2nL\C9\B3\0Cn\C8\A7Z\9AK\83@:f\CB\C2\CE\D8HtY\A6\0B-\FB\E6\B1\FA\DF\DB\E7VVB0\97D\EB\E5\AA\BA\8A}\02\E4\CE\0E\CD%\B3\14h\80\14p\159\83\B2\EB\BB\5C\9A\0D\BC\17\DB\1E\9E\DE#\F4\18_W\8B\15\E2#;\DC\9D\B1-pG\B7\0B9\EA\B7\F6\E3\FD\82\BD\85\B1\FDJ\06\8B'_\BC2Z\82U\8A\D06\FA\00hk\B1'\AA6\02\84\08\C4\DD\A5", align 1
@image2 = global [200 x i8] c"s\D8o\92\FC\F0\E5\DD\D5hr\12\BA~\B4\E4\B1\FC\A9;\81\98=6d\9E$s\FB\CC\EA\8D\81|G\E6C\08\B7\A5OiJ\02k!\B8\C0I[\B8\FB\F8O\91#\9C\EB\F0Ha\AF\FC\97\AC\D8\A8$\93\C0G\E9\8F\84e\0Ep\E7\D3j\90u\03IK\EB\96o\AE\D53]my\9A\D2\1A\F3\F8\94\94\A1|o\BC\C0)~oW\EE\A8\AFS\F3m#\F35\E2\C1fT\F9\C9\B1\AB\06\F4\D6\A1~\ED2>\01\00&\01\99\10\F9\EFD\CE\FD\EF\AF(\EFUD\FE\A3\BBf\1B\E0\17\FBb\88\0A*G\FCve\81\BER\A9\FDW\C0\04\15z_X\01i\DE]\8D\97\D1\EB\0C\8E\C7y\8C\12\9B\E0J\86\0Ae", align 1
@imageR = global [200 x i8] c"9\F8\90\17\EA\CD\5CN\0Fy\9C\BD\F4\EC$@\B7\1E\85^,\1F\8Eu\01m\157\22\85\F7T^\BC\5CxJN?xe\B7-\C7|AL.P\DE\9E\BCu7\87\FA|\04\8CcT\9D]\12\ED\D1\15\BD\1D\F6\BF\E1\C7A\1B>9W\A2\86\D6#\C8P\F4\EA\80R\07\9C\05\CF\FEk\D6N\ED\A1\01\8C\EB\AE\A4\B3=\80\B0\CB\B3\17\F0oRXI\C42 C\A7\A9\9B\C7%\A9\D7*/f\93j\8E;]\B6\14\CE\DB3\13qh\FD\13\CB\E2k\BE\B7\C1\96\1Fkl\1C\0B\DD\C7!\DFa\10\96k\96\EB\BD-\83\BA\EC\C1\FC2\90\98J+t\E8\0A\B6C\E3UtK*!%\83\84\E6\7F\CF\CA\84@\81&", align 1
@fades = global [10 x i8] c"L\98\85\EA\F0\84\8A(\A6s", align 1
@.str = private unnamed_addr constant [6 x i8] c"%lu, \00", align 1

; Function Attrs: nounwind
define void @compositing(i8* %image1, i8* %image2, i8* %imageR, i32 %nelem, i8 zeroext %fade) #0 {
entry:
  %image1.addr = alloca i8*, align 4
  %image2.addr = alloca i8*, align 4
  %imageR.addr = alloca i8*, align 4
  %nelem.addr = alloca i32, align 4
  %fade.addr = alloca i8, align 1
  %i = alloca i32, align 4
  %T = alloca i32, align 4
  store i8* %image1, i8** %image1.addr, align 4
  store i8* %image2, i8** %image2.addr, align 4
  store i8* %imageR, i8** %imageR.addr, align 4
  store i32 %nelem, i32* %nelem.addr, align 4
  store i8 %fade, i8* %fade.addr, align 1
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %nelem.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %image1.addr, align 4
  %3 = load i8, i8* %2, align 1
  %conv = zext i8 %3 to i32
  %4 = load i8*, i8** %image2.addr, align 4
  %5 = load i8, i8* %4, align 1
  %conv1 = zext i8 %5 to i32
  %sub = sub nsw i32 %conv, %conv1
  store i32 %sub, i32* %T, align 4
  %6 = load i32, i32* %T, align 4
  %cmp2 = icmp slt i32 %6, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  store i32 0, i32* %T, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %7 = load i32, i32* %T, align 4
  %8 = load i8, i8* %fade.addr, align 1
  %conv4 = zext i8 %8 to i32
  %mul = mul nsw i32 %7, %conv4
  %shr = ashr i32 %mul, 8
  store i32 %shr, i32* %T, align 4
  %9 = load i32, i32* %T, align 4
  %10 = load i8*, i8** %image2.addr, align 4
  %11 = load i8, i8* %10, align 1
  %conv5 = zext i8 %11 to i32
  %add = add nsw i32 %9, %conv5
  store i32 %add, i32* %T, align 4
  %12 = load i32, i32* %T, align 4
  %cmp6 = icmp sgt i32 %12, 255
  br i1 %cmp6, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end
  store i32 255, i32* %T, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.end
  %13 = load i32, i32* %T, align 4
  %conv10 = trunc i32 %13 to i8
  %14 = load i8*, i8** %imageR.addr, align 4
  store i8 %conv10, i8* %14, align 1
  br label %for.inc

for.inc:                                          ; preds = %if.end9
  %15 = load i32, i32* %i, align 4
  %inc = add nsw i32 %15, 1
  store i32 %inc, i32* %i, align 4
  %16 = load i8*, i8** %image1.addr, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %16, i32 1
  store i8* %incdec.ptr, i8** %image1.addr, align 4
  %17 = load i8*, i8** %image2.addr, align 4
  %incdec.ptr11 = getelementptr inbounds i8, i8* %17, i32 1
  store i8* %incdec.ptr11, i8** %image2.addr, align 4
  %18 = load i8*, i8** %imageR.addr, align 4
  %incdec.ptr12 = getelementptr inbounds i8, i8* %18, i32 1
  store i8* %incdec.ptr12, i8** %imageR.addr, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
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
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [10 x i8], [10 x i8]* @fades, i32 0, i32 %1
  %2 = load i8, i8* %arrayidx, align 1
  call void @compositing(i8* getelementptr inbounds ([200 x i8], [200 x i8]* @image1, i32 0, i32 0), i8* getelementptr inbounds ([200 x i8], [200 x i8]* @image2, i32 0, i32 0), i8* getelementptr inbounds ([200 x i8], [200 x i8]* @imageR, i32 0, i32 0), i32 200, i8 zeroext %2)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc5, %for.end
  %4 = load i32, i32* %i, align 4
  %cmp2 = icmp slt i32 %4, 200
  br i1 %cmp2, label %for.body3, label %for.end7

for.body3:                                        ; preds = %for.cond1
  %5 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds [200 x i8], [200 x i8]* @imageR, i32 0, i32 %5
  %6 = load i8, i8* %arrayidx4, align 1
  %conv = zext i8 %6 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 %conv)
  br label %for.inc5

for.inc5:                                         ; preds = %for.body3
  %7 = load i32, i32* %i, align 4
  %inc6 = add nsw i32 %7, 1
  store i32 %inc6, i32* %i, align 4
  br label %for.cond1

for.end7:                                         ; preds = %for.cond1
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk)"}
