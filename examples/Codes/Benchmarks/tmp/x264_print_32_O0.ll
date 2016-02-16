; ModuleID = 'x264_print.c'
target datalayout = "E-m:e-p:32:32-i64:64-f128:64-n32-S64"
target triple = "sparc-unknown-linux-gnu"

@fenc = global [256 x i8] c"\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F", align 1
@pix0 = global [256 x i8] c"\00\0B\16!,7BMXc\0Ao\D4\0D\0E\0F\0A\15 +6ALWb\09n\D3p\0D\0E\0F\14\1F*5@KVa\08\13\D27\D4\0D\0E\0F\0A\15*\22,7BMXcn\D3\8E\0D\0E\0F\14)4\03\04\05\06\07\08\09\0A\0B\0Cq\95\97\1E=>\03\04\05\06\07\12\09\0A\0B\0C{\94\98(GH\03\04\05\06\07\08\09\0A\0B\0C\8F\92\992QR\03\04\05\06\07\1C\5C\0A\0B\0C\87\8E\9A<[\5C\03\04\05\06\07\08\09\0A\0B\0C\89\9A\9BF\01\14\03\04\05\06\07\08\09\82\0B\0C\8A\8E\9CP\15>\03\04\05\06\07\1C\09\96\0B\0C\C1\9A\9DZ\1F\16\03\04\05\06\07\08\09\0A\0B\0Cq\AE\9E\00)\02+\04\05\06\07\08\09g\0B\0C\85\92\9F\0A\0B\02\17\04\05\06\07\08\09\0A\0B\0Cq\90s\14\1F\02!\04\05\06\07\12\09e\0B\0C{\8E\98\1E)\02+\04\05\06\07b\09\0A\0B\0C\85\8D\99", align 1
@pix1 = global [256 x i8] c"\00\0B\16!,7BMXc\0Ao\0C\0D\0E\0F\0A\15 +6ALWb\09n\0B\0C\0D\0E\0F\14\1F*5@KVa\08\13x\0B\0C\0D\0E\0F\0A\15*\22,7BMXcn\0B\8E\0D\0E\0F<[\5C\03\04\05\06\07\08\09\0A\0B\0C\0D\0FsF\01\14\03\04\05\06\07\08\09\82\0B\0C\0D\8E~P\15>\03\04\05\06\07\1C\09\96\0B\0C\C1\9Au\14)4\03\04\05\06\07\08\09\0A\0B\0Cq\95y\1E=>\03\04\05\06\07\12\09\0A\0B\0C{\94\5C(GH\03\04\05\06\07\08\00\0A\0B\0C{\92\0D2QR\03\04\05\06\07\02\5C\0A\01\0C}\8E\0EZ\1F\16\03\04\05\06\07\08\09\0A\0B\0C\0D\AE\12\00)\02+\04\05\06\07\08\09g\0B\0C{\92\13\0A\0B\02\17\04\05\06\07\08\09\0A\0B\0Cq\0E\0B\14\1F\02!\04\05\06\07\08\09e\0B\0C\0D\0C\0C\1E)\02+\04\05\06\07\5C\09\0A\0B\0C\0D\0B\0D", align 1
@pix2 = global [256 x i8] c"\00\0B\16!,7BMXc\0Ao\0C\0D\0E\0F\0A\15 +6ALWb\09n\0B\0C\0D\0E\0F\14\1F*5@KVa\08\13x\0B\0C\0D\0E\0F\0A\15*\22,7BMXcn\0B\8E\0D\0E\0F<[\5C\03\04\05\06\07\08\09\0Arz\0D\0FsF\01\14\03\04\05\06\07\08\09\82qy\0D\8E~P\15>\03\04\05\06\07\1C\09\96\0B\0C\C1\9Au\14)4\03\04\05\06\07\08\09\0A\0B\0Cq\95y\1E=>\03\04\05\06\07\12\09\0A\0B\0C{\A8\5C(GH\03\04\05\06\07\08\00\0A\0B~{\95\0D2QR\03\04\05\06\07\02\5C\0A\01\7F}\8E\0EZ\1F\16\03\04\05\06\07\08\09\0A\0B\81\0D\C2\12\00)\02+\04\05\06\07\08\09g\0B\0C\C1\C4\13\0A\0B\02\17\04\05\06\07\08\09\0A\0B\0Cq\0E\0B\14\1F\02!\04\05\06\07\08\09e\0B\0C\0D\0C\0C\1E)\02+\04\05\06\07\5C\09\0A\0B\0C\0D\0B\0D", align 1
@pix3 = global [256 x i8] c"\00\0B\16!,7BMXc\0Ao\0C\0D\0E\0F\0A\15 +6ALWb\09n\0B\0C\0D\0E\0F\14\1F*5@KVa\08\13x\0B\0C\0D\0E\0F\0A\15*\22,7BMXcn\0B\8E\0D\0E\0F<[\5C\03\04\05\06\07\08\09\0Arz\0D\0FsF\01\14\03\04\05\06\07\08\09\82qy\0D\8E~P\15>\03\04\05\06\07\1C\09\96\0B\0C\C1\9Au\14)4\03\04\05\06\07T_\0A\0B\0Cq\95y\1E=>\03\04\05\06\07\B7\09\0A\0B\0C{\A8\5C(GH\03\04\05\06\07\08\00\0A\0B~{\95\0D2QR\03\04\05\06\07\02\5C\0A\01\7F}\8E\0EZ\1F\16\03\04\05\06\07\08\5C\0A\0B\81\0D\C2\12\00)\02+\04\05\06\07\08[g\0B\0C\C1\C4\13\0A\0B\02\17\04\05\06\07\08\09\0A\0B\0Cq\0E\0B\14\1F\02!\04\05\06\07\08\09e\0B\0C\0D\0C\0C\1E)\02+\04\05\06\07\5C\09\0A\0B\0C\0D\0B\0D", align 1
@scores_temp = global [4 x i32] [i32 10370, i32 7067, i32 8000, i32 8492], align 4
@scores = global [4 x i32] zeroinitializer, align 4
@.str = private unnamed_addr constant [5 x i8] c"666\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"-1\0A\00", align 1

; Function Attrs: nounwind readnone
define i32 @abs(i32 %a) #0 {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  %0 = load i32, i32* %a.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %a.addr, align 4
  %sub = sub nsw i32 0, %1
  store i32 %sub, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %a.addr, align 4
  store i32 %2, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %3 = load i32, i32* %retval
  ret i32 %3
}

; Function Attrs: nounwind
define i32 @main() #1 {
entry:
  %retval = alloca i32, align 4
  %i_stride = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 16, i32* %i_stride, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 1000
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i_stride, align 4
  call void @x264_pixel_sad_x4_16x16(i8* getelementptr inbounds ([256 x i8], [256 x i8]* @fenc, i32 0, i32 0), i8* getelementptr inbounds ([256 x i8], [256 x i8]* @pix0, i32 0, i32 0), i8* getelementptr inbounds ([256 x i8], [256 x i8]* @pix1, i32 0, i32 0), i8* getelementptr inbounds ([256 x i8], [256 x i8]* @pix2, i32 0, i32 0), i8* getelementptr inbounds ([256 x i8], [256 x i8]* @pix3, i32 0, i32 0), i32 %1, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @scores, i32 0, i32 0))
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i32, i32* %i, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc6, %for.end
  %3 = load i32, i32* %i, align 4
  %cmp2 = icmp slt i32 %3, 4
  br i1 %cmp2, label %for.body3, label %for.end8

for.body3:                                        ; preds = %for.cond1
  %4 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [4 x i32], [4 x i32]* @scores, i32 0, i32 %4
  %5 = load i32, i32* %arrayidx, align 4
  %6 = load i32, i32* %i, align 4
  %arrayidx4 = getelementptr inbounds [4 x i32], [4 x i32]* @scores_temp, i32 0, i32 %6
  %7 = load i32, i32* %arrayidx4, align 4
  %cmp5 = icmp ne i32 %5, %7
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body3
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0))
  store i32 666, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body3
  br label %for.inc6

for.inc6:                                         ; preds = %if.end
  %8 = load i32, i32* %i, align 4
  %inc7 = add nsw i32 %8, 1
  store i32 %inc7, i32* %i, align 4
  br label %for.cond1

for.end8:                                         ; preds = %for.cond1
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str1, i32 0, i32 0))
  store i32 -1, i32* %retval
  br label %return

return:                                           ; preds = %for.end8, %if.then
  %9 = load i32, i32* %retval
  ret i32 %9
}

; Function Attrs: nounwind
define internal void @x264_pixel_sad_x4_16x16(i8* %fenc, i8* %pix0, i8* %pix1, i8* %pix2, i8* %pix3, i32 %i_stride, i32* %scores) #1 {
entry:
  %fenc.addr = alloca i8*, align 4
  %pix0.addr = alloca i8*, align 4
  %pix1.addr = alloca i8*, align 4
  %pix2.addr = alloca i8*, align 4
  %pix3.addr = alloca i8*, align 4
  %i_stride.addr = alloca i32, align 4
  %scores.addr = alloca i32*, align 4
  store i8* %fenc, i8** %fenc.addr, align 4
  store i8* %pix0, i8** %pix0.addr, align 4
  store i8* %pix1, i8** %pix1.addr, align 4
  store i8* %pix2, i8** %pix2.addr, align 4
  store i8* %pix3, i8** %pix3.addr, align 4
  store i32 %i_stride, i32* %i_stride.addr, align 4
  store i32* %scores, i32** %scores.addr, align 4
  %0 = load i8*, i8** %fenc.addr, align 4
  %1 = load i8*, i8** %pix0.addr, align 4
  %2 = load i32, i32* %i_stride.addr, align 4
  %call = call i32 @x264_pixel_sad_16x16(i8* %0, i32 16, i8* %1, i32 %2)
  %3 = load i32*, i32** %scores.addr, align 4
  %arrayidx = getelementptr inbounds i32, i32* %3, i32 0
  store i32 %call, i32* %arrayidx, align 4
  %4 = load i8*, i8** %fenc.addr, align 4
  %5 = load i8*, i8** %pix1.addr, align 4
  %6 = load i32, i32* %i_stride.addr, align 4
  %call1 = call i32 @x264_pixel_sad_16x16(i8* %4, i32 16, i8* %5, i32 %6)
  %7 = load i32*, i32** %scores.addr, align 4
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i32 1
  store i32 %call1, i32* %arrayidx2, align 4
  %8 = load i8*, i8** %fenc.addr, align 4
  %9 = load i8*, i8** %pix2.addr, align 4
  %10 = load i32, i32* %i_stride.addr, align 4
  %call3 = call i32 @x264_pixel_sad_16x16(i8* %8, i32 16, i8* %9, i32 %10)
  %11 = load i32*, i32** %scores.addr, align 4
  %arrayidx4 = getelementptr inbounds i32, i32* %11, i32 2
  store i32 %call3, i32* %arrayidx4, align 4
  %12 = load i8*, i8** %fenc.addr, align 4
  %13 = load i8*, i8** %pix3.addr, align 4
  %14 = load i32, i32* %i_stride.addr, align 4
  %call5 = call i32 @x264_pixel_sad_16x16(i8* %12, i32 16, i8* %13, i32 %14)
  %15 = load i32*, i32** %scores.addr, align 4
  %arrayidx6 = getelementptr inbounds i32, i32* %15, i32 3
  store i32 %call5, i32* %arrayidx6, align 4
  ret void
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
define internal i32 @x264_pixel_sad_16x16(i8* %pix1, i32 %i_stride_pix1, i8* %pix2, i32 %i_stride_pix2) #1 {
entry:
  %pix1.addr = alloca i8*, align 4
  %i_stride_pix1.addr = alloca i32, align 4
  %pix2.addr = alloca i8*, align 4
  %i_stride_pix2.addr = alloca i32, align 4
  %i_sum = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i8* %pix1, i8** %pix1.addr, align 4
  store i32 %i_stride_pix1, i32* %i_stride_pix1.addr, align 4
  store i8* %pix2, i8** %pix2.addr, align 4
  store i32 %i_stride_pix2, i32* %i_stride_pix2.addr, align 4
  store i32 0, i32* %i_sum, align 4
  store i32 0, i32* %y, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc7, %entry
  %0 = load i32, i32* %y, align 4
  %cmp = icmp slt i32 %0, 16
  br i1 %cmp, label %for.body, label %for.end9

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %x, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %1 = load i32, i32* %x, align 4
  %cmp2 = icmp slt i32 %1, 16
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %2 = load i32, i32* %x, align 4
  %3 = load i8*, i8** %pix1.addr, align 4
  %arrayidx = getelementptr inbounds i8, i8* %3, i32 %2
  %4 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %4 to i32
  %5 = load i32, i32* %x, align 4
  %6 = load i8*, i8** %pix2.addr, align 4
  %arrayidx4 = getelementptr inbounds i8, i8* %6, i32 %5
  %7 = load i8, i8* %arrayidx4, align 1
  %conv5 = zext i8 %7 to i32
  %sub = sub nsw i32 %conv, %conv5
  %call = call i32 @abs(i32 %sub) #3
  %8 = load i32, i32* %i_sum, align 4
  %add = add nsw i32 %8, %call
  store i32 %add, i32* %i_sum, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %9 = load i32, i32* %x, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %x, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  %10 = load i32, i32* %i_stride_pix1.addr, align 4
  %11 = load i8*, i8** %pix1.addr, align 4
  %add.ptr = getelementptr inbounds i8, i8* %11, i32 %10
  store i8* %add.ptr, i8** %pix1.addr, align 4
  %12 = load i32, i32* %i_stride_pix2.addr, align 4
  %13 = load i8*, i8** %pix2.addr, align 4
  %add.ptr6 = getelementptr inbounds i8, i8* %13, i32 %12
  store i8* %add.ptr6, i8** %pix2.addr, align 4
  br label %for.inc7

for.inc7:                                         ; preds = %for.end
  %14 = load i32, i32* %y, align 4
  %inc8 = add nsw i32 %14, 1
  store i32 %inc8, i32* %y, align 4
  br label %for.cond

for.end9:                                         ; preds = %for.cond
  %15 = load i32, i32* %i_sum, align 4
  ret i32 %15
}

attributes #0 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+soft-float" "unsafe-fp-math"="false" "use-soft-float"="true" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+soft-float" "unsafe-fp-math"="false" "use-soft-float"="true" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+soft-float" "unsafe-fp-math"="false" "use-soft-float"="true" }
attributes #3 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
