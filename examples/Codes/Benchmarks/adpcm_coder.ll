; ModuleID = 'adpcm_coder.c'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

%struct.adpcm_state = type { i16, i8 }

@pcmdata = global [10 x i16] [i16 0, i16 0, i16 16, i16 16, i16 16, i16 24, i16 24, i16 24, i16 32, i16 32], align 2
@adpcmdata_ref = global [5 x i8] c"\00q\82\008", align 1
@pcmdata_2_ref = global [10 x i16] [i16 0, i16 0, i16 11, i16 17, i16 16, i16 23, i16 24, i16 25, i16 33, i16 32], align 2
@coder_state = common global %struct.adpcm_state zeroinitializer, align 2
@decoder_state = common global %struct.adpcm_state zeroinitializer, align 2
@adpcmdata = common global [5 x i8] zeroinitializer, align 1
@stepsizeTable = internal global [89 x i32] [i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 16, i32 17, i32 19, i32 21, i32 23, i32 25, i32 28, i32 31, i32 34, i32 37, i32 41, i32 45, i32 50, i32 55, i32 60, i32 66, i32 73, i32 80, i32 88, i32 97, i32 107, i32 118, i32 130, i32 143, i32 157, i32 173, i32 190, i32 209, i32 230, i32 253, i32 279, i32 307, i32 337, i32 371, i32 408, i32 449, i32 494, i32 544, i32 598, i32 658, i32 724, i32 796, i32 876, i32 963, i32 1060, i32 1166, i32 1282, i32 1411, i32 1552, i32 1707, i32 1878, i32 2066, i32 2272, i32 2499, i32 2749, i32 3024, i32 3327, i32 3660, i32 4026, i32 4428, i32 4871, i32 5358, i32 5894, i32 6484, i32 7132, i32 7845, i32 8630, i32 9493, i32 10442, i32 11487, i32 12635, i32 13899, i32 15289, i32 16818, i32 18500, i32 20350, i32 22385, i32 24623, i32 27086, i32 29794, i32 32767], align 4
@indexTable = internal global [16 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 2, i32 4, i32 6, i32 8, i32 -1, i32 -1, i32 -1, i32 -1, i32 2, i32 4, i32 6, i32 8], align 4
@pcmdata_2 = common global [10 x i16] zeroinitializer, align 2

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i8 0, i8* getelementptr inbounds (%struct.adpcm_state, %struct.adpcm_state* @coder_state, i32 0, i32 1), align 1
  store i16 0, i16* getelementptr inbounds (%struct.adpcm_state, %struct.adpcm_state* @coder_state, i32 0, i32 0), align 2
  store i8 0, i8* getelementptr inbounds (%struct.adpcm_state, %struct.adpcm_state* @decoder_state, i32 0, i32 1), align 1
  store i16 0, i16* getelementptr inbounds (%struct.adpcm_state, %struct.adpcm_state* @decoder_state, i32 0, i32 0), align 2
  call void @adpcm_coder(i16* getelementptr inbounds ([10 x i16], [10 x i16]* @pcmdata, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @adpcmdata, i32 0, i32 0), i32 signext 10, %struct.adpcm_state* @coder_state)
  %0 = load i8, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @adpcmdata, i32 0, i32 0), align 1
  %conv = sext i8 %0 to i32
  ret i32 %conv
}

; Function Attrs: nounwind
define void @adpcm_coder(i16* %indata, i8* %outdata, i32 signext %len, %struct.adpcm_state* %state) #0 {
entry:
  %indata.addr = alloca i16*, align 4
  %outdata.addr = alloca i8*, align 4
  %len.addr = alloca i32, align 4
  %state.addr = alloca %struct.adpcm_state*, align 4
  %inp = alloca i16*, align 4
  %outp = alloca i8*, align 4
  %val = alloca i32, align 4
  %sign = alloca i32, align 4
  %delta = alloca i32, align 4
  %diff = alloca i32, align 4
  %step = alloca i32, align 4
  %valpred = alloca i32, align 4
  %vpdiff = alloca i32, align 4
  %index = alloca i32, align 4
  %outputbuffer = alloca i32, align 4
  %bufferstep = alloca i32, align 4
  store i16* %indata, i16** %indata.addr, align 4
  store i8* %outdata, i8** %outdata.addr, align 4
  store i32 %len, i32* %len.addr, align 4
  store %struct.adpcm_state* %state, %struct.adpcm_state** %state.addr, align 4
  %0 = load i8*, i8** %outdata.addr, align 4
  store i8* %0, i8** %outp, align 4
  %1 = load i16*, i16** %indata.addr, align 4
  store i16* %1, i16** %inp, align 4
  %2 = load %struct.adpcm_state*, %struct.adpcm_state** %state.addr, align 4
  %valprev = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %2, i32 0, i32 0
  %3 = load i16, i16* %valprev, align 2
  %conv = sext i16 %3 to i32
  store i32 %conv, i32* %valpred, align 4
  %4 = load %struct.adpcm_state*, %struct.adpcm_state** %state.addr, align 4
  %index1 = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %4, i32 0, i32 1
  %5 = load i8, i8* %index1, align 1
  %conv2 = sext i8 %5 to i32
  store i32 %conv2, i32* %index, align 4
  %6 = load i32, i32* %index, align 4
  %arrayidx = getelementptr inbounds [89 x i32], [89 x i32]* @stepsizeTable, i32 0, i32 %6
  %7 = load i32, i32* %arrayidx, align 4
  store i32 %7, i32* %step, align 4
  store i32 1, i32* %bufferstep, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i32, i32* %len.addr, align 4
  %cmp = icmp sgt i32 %8, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %9 = load i16*, i16** %inp, align 4
  %incdec.ptr = getelementptr inbounds i16, i16* %9, i32 1
  store i16* %incdec.ptr, i16** %inp, align 4
  %10 = load i16, i16* %9, align 2
  %conv4 = sext i16 %10 to i32
  store i32 %conv4, i32* %val, align 4
  %11 = load i32, i32* %val, align 4
  %12 = load i32, i32* %valpred, align 4
  %sub = sub nsw i32 %11, %12
  store i32 %sub, i32* %diff, align 4
  %13 = load i32, i32* %diff, align 4
  %cmp5 = icmp sge i32 %13, 0
  br i1 %cmp5, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  store i32 0, i32* %sign, align 4
  br label %if.end

if.else:                                          ; preds = %for.body
  store i32 8, i32* %sign, align 4
  %14 = load i32, i32* %diff, align 4
  %sub7 = sub nsw i32 0, %14
  store i32 %sub7, i32* %diff, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i32 0, i32* %delta, align 4
  %15 = load i32, i32* %step, align 4
  %shr = ashr i32 %15, 3
  store i32 %shr, i32* %vpdiff, align 4
  %16 = load i32, i32* %diff, align 4
  %17 = load i32, i32* %step, align 4
  %cmp8 = icmp sge i32 %16, %17
  br i1 %cmp8, label %if.then10, label %if.end12

if.then10:                                        ; preds = %if.end
  store i32 4, i32* %delta, align 4
  %18 = load i32, i32* %step, align 4
  %19 = load i32, i32* %diff, align 4
  %sub11 = sub nsw i32 %19, %18
  store i32 %sub11, i32* %diff, align 4
  %20 = load i32, i32* %step, align 4
  %21 = load i32, i32* %vpdiff, align 4
  %add = add nsw i32 %21, %20
  store i32 %add, i32* %vpdiff, align 4
  br label %if.end12

if.end12:                                         ; preds = %if.then10, %if.end
  %22 = load i32, i32* %step, align 4
  %shr13 = ashr i32 %22, 1
  store i32 %shr13, i32* %step, align 4
  %23 = load i32, i32* %diff, align 4
  %24 = load i32, i32* %step, align 4
  %cmp14 = icmp sge i32 %23, %24
  br i1 %cmp14, label %if.then16, label %if.end19

if.then16:                                        ; preds = %if.end12
  %25 = load i32, i32* %delta, align 4
  %or = or i32 %25, 2
  store i32 %or, i32* %delta, align 4
  %26 = load i32, i32* %step, align 4
  %27 = load i32, i32* %diff, align 4
  %sub17 = sub nsw i32 %27, %26
  store i32 %sub17, i32* %diff, align 4
  %28 = load i32, i32* %step, align 4
  %29 = load i32, i32* %vpdiff, align 4
  %add18 = add nsw i32 %29, %28
  store i32 %add18, i32* %vpdiff, align 4
  br label %if.end19

if.end19:                                         ; preds = %if.then16, %if.end12
  %30 = load i32, i32* %step, align 4
  %shr20 = ashr i32 %30, 1
  store i32 %shr20, i32* %step, align 4
  %31 = load i32, i32* %diff, align 4
  %32 = load i32, i32* %step, align 4
  %cmp21 = icmp sge i32 %31, %32
  br i1 %cmp21, label %if.then23, label %if.end26

if.then23:                                        ; preds = %if.end19
  %33 = load i32, i32* %delta, align 4
  %or24 = or i32 %33, 1
  store i32 %or24, i32* %delta, align 4
  %34 = load i32, i32* %step, align 4
  %35 = load i32, i32* %vpdiff, align 4
  %add25 = add nsw i32 %35, %34
  store i32 %add25, i32* %vpdiff, align 4
  br label %if.end26

if.end26:                                         ; preds = %if.then23, %if.end19
  %36 = load i32, i32* %sign, align 4
  %tobool = icmp ne i32 %36, 0
  br i1 %tobool, label %if.then27, label %if.else29

if.then27:                                        ; preds = %if.end26
  %37 = load i32, i32* %vpdiff, align 4
  %38 = load i32, i32* %valpred, align 4
  %sub28 = sub nsw i32 %38, %37
  store i32 %sub28, i32* %valpred, align 4
  br label %if.end31

if.else29:                                        ; preds = %if.end26
  %39 = load i32, i32* %vpdiff, align 4
  %40 = load i32, i32* %valpred, align 4
  %add30 = add nsw i32 %40, %39
  store i32 %add30, i32* %valpred, align 4
  br label %if.end31

if.end31:                                         ; preds = %if.else29, %if.then27
  %41 = load i32, i32* %valpred, align 4
  %cmp32 = icmp sgt i32 %41, 32767
  br i1 %cmp32, label %if.then34, label %if.else35

if.then34:                                        ; preds = %if.end31
  store i32 32767, i32* %valpred, align 4
  br label %if.end40

if.else35:                                        ; preds = %if.end31
  %42 = load i32, i32* %valpred, align 4
  %cmp36 = icmp slt i32 %42, -32768
  br i1 %cmp36, label %if.then38, label %if.end39

if.then38:                                        ; preds = %if.else35
  store i32 -32768, i32* %valpred, align 4
  br label %if.end39

if.end39:                                         ; preds = %if.then38, %if.else35
  br label %if.end40

if.end40:                                         ; preds = %if.end39, %if.then34
  %43 = load i32, i32* %sign, align 4
  %44 = load i32, i32* %delta, align 4
  %or41 = or i32 %44, %43
  store i32 %or41, i32* %delta, align 4
  %45 = load i32, i32* %delta, align 4
  %arrayidx42 = getelementptr inbounds [16 x i32], [16 x i32]* @indexTable, i32 0, i32 %45
  %46 = load i32, i32* %arrayidx42, align 4
  %47 = load i32, i32* %index, align 4
  %add43 = add nsw i32 %47, %46
  store i32 %add43, i32* %index, align 4
  %48 = load i32, i32* %index, align 4
  %cmp44 = icmp slt i32 %48, 0
  br i1 %cmp44, label %if.then46, label %if.end47

if.then46:                                        ; preds = %if.end40
  store i32 0, i32* %index, align 4
  br label %if.end47

if.end47:                                         ; preds = %if.then46, %if.end40
  %49 = load i32, i32* %index, align 4
  %cmp48 = icmp sgt i32 %49, 88
  br i1 %cmp48, label %if.then50, label %if.end51

if.then50:                                        ; preds = %if.end47
  store i32 88, i32* %index, align 4
  br label %if.end51

if.end51:                                         ; preds = %if.then50, %if.end47
  %50 = load i32, i32* %index, align 4
  %arrayidx52 = getelementptr inbounds [89 x i32], [89 x i32]* @stepsizeTable, i32 0, i32 %50
  %51 = load i32, i32* %arrayidx52, align 4
  store i32 %51, i32* %step, align 4
  %52 = load i32, i32* %bufferstep, align 4
  %tobool53 = icmp ne i32 %52, 0
  br i1 %tobool53, label %if.then54, label %if.else55

if.then54:                                        ; preds = %if.end51
  %53 = load i32, i32* %delta, align 4
  %shl = shl i32 %53, 4
  %and = and i32 %shl, 240
  store i32 %and, i32* %outputbuffer, align 4
  br label %if.end60

if.else55:                                        ; preds = %if.end51
  %54 = load i32, i32* %delta, align 4
  %and56 = and i32 %54, 15
  %55 = load i32, i32* %outputbuffer, align 4
  %or57 = or i32 %and56, %55
  %conv58 = trunc i32 %or57 to i8
  %56 = load i8*, i8** %outp, align 4
  %incdec.ptr59 = getelementptr inbounds i8, i8* %56, i32 1
  store i8* %incdec.ptr59, i8** %outp, align 4
  store i8 %conv58, i8* %56, align 1
  br label %if.end60

if.end60:                                         ; preds = %if.else55, %if.then54
  %57 = load i32, i32* %bufferstep, align 4
  %tobool61 = icmp ne i32 %57, 0
  %lnot = xor i1 %tobool61, true
  %lnot.ext = zext i1 %lnot to i32
  store i32 %lnot.ext, i32* %bufferstep, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end60
  %58 = load i32, i32* %len.addr, align 4
  %dec = add nsw i32 %58, -1
  store i32 %dec, i32* %len.addr, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %59 = load i32, i32* %bufferstep, align 4
  %tobool62 = icmp ne i32 %59, 0
  br i1 %tobool62, label %if.end66, label %if.then63

if.then63:                                        ; preds = %for.end
  %60 = load i32, i32* %outputbuffer, align 4
  %conv64 = trunc i32 %60 to i8
  %61 = load i8*, i8** %outp, align 4
  %incdec.ptr65 = getelementptr inbounds i8, i8* %61, i32 1
  store i8* %incdec.ptr65, i8** %outp, align 4
  store i8 %conv64, i8* %61, align 1
  br label %if.end66

if.end66:                                         ; preds = %if.then63, %for.end
  %62 = load i32, i32* %valpred, align 4
  %conv67 = trunc i32 %62 to i16
  %63 = load %struct.adpcm_state*, %struct.adpcm_state** %state.addr, align 4
  %valprev68 = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %63, i32 0, i32 0
  store i16 %conv67, i16* %valprev68, align 2
  %64 = load i32, i32* %index, align 4
  %conv69 = trunc i32 %64 to i8
  %65 = load %struct.adpcm_state*, %struct.adpcm_state** %state.addr, align 4
  %index70 = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %65, i32 0, i32 1
  store i8 %conv69, i8* %index70, align 1
  ret void
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
