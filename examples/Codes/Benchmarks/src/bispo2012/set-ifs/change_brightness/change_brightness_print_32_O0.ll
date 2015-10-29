; ModuleID = 'change_brightness_print.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@image1 = global [100 x i8] c"`8z\BE\F6:\B7\03>m+K#M/X\08\07\F2\F1\0FpX\F6\988\1F\B4\08_Cz\CB\E7\A4l\9B\CA\E5\96\01.\96D\1C\D6\94\90\A0\DC\AF;!\9D\8E\C0\91\F3\CF\A6\07\A9r\15\C1+w\ACl}\C4\91\A2nL\C9\B3\0Cn\C8\A7Z\9AK\83@:f\CB\C2\CE\D8HtY\A6\0B-\FB\E6", align 1
@imageR = global [100 x i8] c"s\D8o\92\FC\F0\E5\DD\D5hr\12\BA~\B4\E4\B1\FC\A9;\81\98=6d\9E$s\FB\CC\EA\8D\81|G\E6C\08\B7\A5OiJ\02k!\B8\C0I[\B8\FB\F8O\91#\9C\EB\F0Ha\AF\FC\97\AC\D8\A8$\93\C0G\E9\8F\84e\0Ep\E7\D3j\90u\03IK\EB\96o\AE\D53]my\9A\D2\1A\F3\F8\94", align 1
@deltas = global [10 x i8] c"9\F8\90\17\EA\CD\5CN\0Fy", align 1
@.str = private unnamed_addr constant [6 x i8] c"%lu, \00", align 1

; Function Attrs: nounwind
define void @change_brightness(i8* %image, i8* %imageR, i32 %nelem, i8 signext %delta) #0 {
entry:
  %image.addr = alloca i8*, align 4
  %imageR.addr = alloca i8*, align 4
  %nelem.addr = alloca i32, align 4
  %delta.addr = alloca i8, align 1
  %abs_delta = alloca i8, align 1
  %i = alloca i32, align 4
  %T = alloca i32, align 4
  store i8* %image, i8** %image.addr, align 4
  store i8* %imageR, i8** %imageR.addr, align 4
  store i32 %nelem, i32* %nelem.addr, align 4
  store i8 %delta, i8* %delta.addr, align 1
  %0 = load i8, i8* %delta.addr, align 1
  %conv = sext i8 %0 to i32
  %cmp = icmp slt i32 %conv, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i8, i8* %delta.addr, align 1
  %conv2 = sext i8 %1 to i32
  %sub = sub nsw i32 0, %conv2
  %conv3 = trunc i32 %sub to i8
  store i8 %conv3, i8* %abs_delta, align 1
  br label %if.end

if.else:                                          ; preds = %entry
  %2 = load i8, i8* %delta.addr, align 1
  store i8 %2, i8* %abs_delta, align 1
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %3 = load i32, i32* %i, align 4
  %4 = load i32, i32* %nelem.addr, align 4
  %cmp4 = icmp slt i32 %3, %4
  br i1 %cmp4, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i8, i8* %delta.addr, align 1
  %conv6 = sext i8 %5 to i32
  %cmp7 = icmp sgt i32 %conv6, 0
  br i1 %cmp7, label %if.then9, label %if.else17

if.then9:                                         ; preds = %for.body
  %6 = load i8*, i8** %image.addr, align 4
  %7 = load i8, i8* %6, align 1
  %conv10 = zext i8 %7 to i32
  %8 = load i8, i8* %abs_delta, align 1
  %conv11 = zext i8 %8 to i32
  %add = add nsw i32 %conv10, %conv11
  store i32 %add, i32* %T, align 4
  %9 = load i32, i32* %T, align 4
  %cmp12 = icmp sgt i32 %9, 255
  br i1 %cmp12, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.then9
  store i32 255, i32* %T, align 4
  br label %if.end15

if.end15:                                         ; preds = %if.then14, %if.then9
  %10 = load i32, i32* %T, align 4
  %conv16 = trunc i32 %10 to i8
  %11 = load i8*, i8** %imageR.addr, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %11, i32 1
  store i8* %incdec.ptr, i8** %imageR.addr, align 4
  store i8 %conv16, i8* %11, align 1
  br label %if.end27

if.else17:                                        ; preds = %for.body
  %12 = load i8*, i8** %image.addr, align 4
  %13 = load i8, i8* %12, align 1
  %conv18 = zext i8 %13 to i32
  %14 = load i8, i8* %abs_delta, align 1
  %conv19 = zext i8 %14 to i32
  %sub20 = sub nsw i32 %conv18, %conv19
  store i32 %sub20, i32* %T, align 4
  %15 = load i32, i32* %T, align 4
  %cmp21 = icmp slt i32 %15, 0
  br i1 %cmp21, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.else17
  store i32 0, i32* %T, align 4
  br label %if.end24

if.end24:                                         ; preds = %if.then23, %if.else17
  %16 = load i32, i32* %T, align 4
  %conv25 = trunc i32 %16 to i8
  %17 = load i8*, i8** %imageR.addr, align 4
  %incdec.ptr26 = getelementptr inbounds i8, i8* %17, i32 1
  store i8* %incdec.ptr26, i8** %imageR.addr, align 4
  store i8 %conv25, i8* %17, align 1
  br label %if.end27

if.end27:                                         ; preds = %if.end24, %if.end15
  br label %for.inc

for.inc:                                          ; preds = %if.end27
  %18 = load i32, i32* %i, align 4
  %inc = add nsw i32 %18, 1
  store i32 %inc, i32* %i, align 4
  %19 = load i8*, i8** %image.addr, align 4
  %incdec.ptr28 = getelementptr inbounds i8, i8* %19, i32 1
  store i8* %incdec.ptr28, i8** %image.addr, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %nelem = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 100, i32* %nelem, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %nelem, align 4
  %2 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [10 x i8], [10 x i8]* @deltas, i32 0, i32 %2
  %3 = load i8, i8* %arrayidx, align 1
  call void @change_brightness(i8* getelementptr inbounds ([100 x i8], [100 x i8]* @image1, i32 0, i32 0), i8* getelementptr inbounds ([100 x i8], [100 x i8]* @imageR, i32 0, i32 0), i32 %1, i8 signext %3)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i32, i32* %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc5, %for.end
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* %nelem, align 4
  %cmp2 = icmp slt i32 %5, %6
  br i1 %cmp2, label %for.body3, label %for.end7

for.body3:                                        ; preds = %for.cond1
  %7 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* @imageR, i32 0, i32 %7
  %8 = load i8, i8* %arrayidx4, align 1
  %conv = zext i8 %8 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 %conv)
  br label %for.inc5

for.inc5:                                         ; preds = %for.body3
  %9 = load i32, i32* %i, align 4
  %inc6 = add nsw i32 %9, 1
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
