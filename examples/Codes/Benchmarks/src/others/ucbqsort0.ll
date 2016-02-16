; ModuleID = 'ucbqsort.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@gQSortNum = global [1000 x i8] c"9~\DF,\0B\8A\FB\E8\8FV\D7<S\1Es0W.1\A4e\C6\EBH\1F\069\0C\E3n\9D`\19\22\BF\8C+\16%\88\AF\B6\B7\DCsB\AD\90\89rQDEf\CB\A8\C1f\A7\AC\03\0EC@\F9>\9F\14KJ\BB\D8\CF\16\97|m\A23\10\97\12\8F\1C%\FA\AB\08_:\87L\DDR\DD\E0\D9\9E\7FLk\AA\9B\C8\EF\8Aw\E4M\02\ED\B0\B7\B2o\84\05\A6\8Bh\81\DAg\14\BDN\03\80\B9\02_\AC\8B\0A{h\F1\D6\A9\BC\D3b\0DP)R\B1\DC\E5\BA\95\C8\9F\86Gtc\12\1D\E0g\A2\C1\0C\AB\96\A5\F8\D1\CA\C9\5C\0D>\D3\10\F7\0E\D1<;\1A\B5(\BF\E6',}r\C3@\87\BE\E1\945\CA\C5\A8Oj\17\04\13\22M\90\17\92\F1\9C[z+\88\DFF\F94\A3.]`Y\1E\FF4\15\D6\E5Ho\0A\09\9C\CD~\93072\EF\FC\85&\0B\E8\01\A6\19l=\CE}\00\C7~\DF,\0Bv\FB\18q\AA\D7<S\1Es0\A9\D21\5Ce:\15\B8\E1\06\C7\F4\E3\92c`\19\DEA\8C\D5\16\DB\88\AF\B6I$\8D\BESp\89r\AF\BC\BBf5\A8\C1\9A\A7\AC\03\F2C@\07>\9F\ECK\B6\BB(1\EAi|m\A2\CD\10i\EE\8F\1C%\06U\F8\A1:y\B4\DD\AE\DD \D9b\81L\95\AAe\C8\EFv\89\1C\B3\FE\13P\B7\B2\91|\FB\A6\8B\98\81&\99\14\BDN\03\80G\FE_T\8B\0A{\98\F1\D6\A9D\D3b\0DP\D7RO$\E5F\958\9F\86\B9\8Cc\12\1D\E0\99^?\F4U\96[\F8\D1\CA7\5C\F3\C2\D3\F0\F7\F2\D1\C4\C5\1AK(\BF\1A',\83\8E\C3@y\BE\E1\9456\C5XOj\E9\FC\13\22M\90\E9\92\F1d[\86+\88!F\F9\CC\A3\D2\A3`Y\E2\014\EB\D6\1BHo\F6\F7\9C3\82m\D072\11\FC{\DA\F5\E8\FFZ\E7l\C32}\00\C7\82\DF\D4\0B\8A\FB\E8\8FV\D7\C4S\1E\8D0W.\CF\5C\9B:\EB\B8\1F\06\C7\0C\1D\92\9D\A0\E7\22\BFt\D5\16%\88\AFJ\B7$sB\AD\90\89\8E\AF\BCEf5\A8\C1fY\AC\FD\F2C\C0\07>\9F\14\B5\B6\BB\D8\CF\16i\84m\A2\CD\10\97\12q\E4%\06U\08\A1:\87L#\AE#\E0'\9E\7F\B4\95V\9B\C8\EFvw\1CM\FE\13\B0\B7N\91\84\05Zu\98\7F\DA\99\14C\B2\03\80\B9\FE_\AC\8B\F6{h\0F*\A9D\D3b\F3P)\AEO$\1B\BAk8a\86Gt\9D\EE\E3 \99\A2\C1\F4\AB\96\A5\F8\D167\A4\0D\C2-\10\F7\F2/<;\1AK(A\E6\D9,\83\8E\C3\C0y\BE\E1l\CB\CA\C5\A8\B1\96\E9\FC\13\22M\90\17n\0Fd[z\D5x\DFF\074].]\A0\A7\E2\FF\CC\15*\E5Ho\F6\09d\CD~\9307\CE\EF\04\85\DA\F5\E8\FF\A6\E7l\C32\83\009\82\DF,\F5v\FB\E8qV\D7\C4S\1E\8D0W.\CF\5C\9B\C6\EBH\1F\FA9\F4\1Dnc\A0\E7\22At+\16\DB\88\AFJI\DC\8D\BESp\89\8EQDE\9A\CBX?\9AY\AC\03\F2C\C0\F9>\9F\14\B5JE\D81\16i\84m\A2\CD\10\97\12q\E4\DB\FA\AB\08_:\87\B4#R\DD\E0'b\81\B4kVe\C8\EFvw\E4\B3\02\EDP\B7No|\05Zuh\7F&\99\14C\B2\FD\80\B9\FE_\ACu\0A{\98\F1*W\BC\D3b\F3P\D7RO$\1B\BAk\C8\9FzG\8C\9D\EE\1D\E0\99^?\F4Uj[\F8/6\C9\A4\F3>\D3\F0\F7\F2/\C4\C5\E6\B5\D8A\1A\D9,}r\C3\C0\87\BE\1F\94\CB\CA;XO\96\E9\FC\13\22M\90\E9\92\0Fd\A5z\D5\88\DFF\F9\CC].]`\A7\1E\01\CC\15*\1BH", align 1
@.str = private unnamed_addr constant [5 x i8] c"666\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"-1\0A\00", align 1
@qsz = internal global i32 0, align 4
@qcmp = internal global i32 (...)* null, align 4
@thresh = internal global i32 0, align 4
@mthresh = internal global i32 0, align 4

; Function Attrs: nounwind
define i32 @compare(i8* %n1, i8* %n2) #0 {
entry:
  %n1.addr = alloca i8*, align 4
  %n2.addr = alloca i8*, align 4
  store i8* %n1, i8** %n1.addr, align 4
  store i8* %n2, i8** %n2.addr, align 4
  %0 = load i8*, i8** %n1.addr, align 4
  %1 = load i8, i8* %0, align 1
  %conv = zext i8 %1 to i32
  %2 = load i8*, i8** %n2.addr, align 4
  %3 = load i8, i8* %2, align 1
  %conv1 = zext i8 %3 to i32
  %sub = sub nsw i32 %conv, %conv1
  ret i32 %sub
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %SortArr = alloca [1000 x i8], align 1
  %j = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = bitcast [1000 x i8]* %SortArr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %0, i8* getelementptr inbounds ([1000 x i8], [1000 x i8]* @gQSortNum, i32 0, i32 0), i32 1000, i32 1, i1 false)
  %arraydecay = getelementptr inbounds [1000 x i8], [1000 x i8]* %SortArr, i32 0, i32 0
  call void @QSORT(i8* %arraydecay, i32 1000, i32 1, i32 (...)* bitcast (i32 (i8*, i8*)* @compare to i32 (...)*))
  store i32 1, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %j, align 4
  %cmp = icmp slt i32 %1, 1000
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %j, align 4
  %arrayidx = getelementptr inbounds [1000 x i8], [1000 x i8]* %SortArr, i32 0, i32 %2
  %3 = load i8, i8* %arrayidx, align 1
  %conv = zext i8 %3 to i32
  %4 = load i32, i32* %j, align 4
  %sub = sub nsw i32 %4, 1
  %arrayidx1 = getelementptr inbounds [1000 x i8], [1000 x i8]* %SortArr, i32 0, i32 %sub
  %5 = load i8, i8* %arrayidx1, align 1
  %conv2 = zext i8 %5 to i32
  %cmp3 = icmp slt i32 %conv, %conv2
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0))
  store i32 15, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %6 = load i32, i32* %j, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str1, i32 0, i32 0))
  store i32 66, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %if.then
  %7 = load i32, i32* %retval
  ret i32 %7
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture, i8* nocapture readonly, i32, i32, i1) #1

; Function Attrs: nounwind
define void @QSORT(i8* %base, i32 %n, i32 %size, i32 (...)* %compar) #0 {
entry:
  %base.addr = alloca i8*, align 4
  %n.addr = alloca i32, align 4
  %size.addr = alloca i32, align 4
  %compar.addr = alloca i32 (...)*, align 4
  %c = alloca i8, align 1
  %i = alloca i8*, align 4
  %j = alloca i8*, align 4
  %lo = alloca i8*, align 4
  %hi = alloca i8*, align 4
  %min = alloca i8*, align 4
  %max = alloca i8*, align 4
  store i8* %base, i8** %base.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store i32 %size, i32* %size.addr, align 4
  store i32 (...)* %compar, i32 (...)** %compar.addr, align 4
  %0 = load i32, i32* %n.addr, align 4
  %cmp = icmp sle i32 %0, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %for.end45

if.end:                                           ; preds = %entry
  %1 = load i32, i32* %size.addr, align 4
  store i32 %1, i32* @qsz, align 4
  %2 = load i32 (...)*, i32 (...)** %compar.addr, align 4
  store i32 (...)* %2, i32 (...)** @qcmp, align 4
  %3 = load i32, i32* @qsz, align 4
  %mul = mul nsw i32 %3, 4
  store i32 %mul, i32* @thresh, align 4
  %4 = load i32, i32* @qsz, align 4
  %mul1 = mul nsw i32 %4, 6
  store i32 %mul1, i32* @mthresh, align 4
  %5 = load i8*, i8** %base.addr, align 4
  %6 = load i32, i32* %n.addr, align 4
  %7 = load i32, i32* @qsz, align 4
  %mul2 = mul nsw i32 %6, %7
  %add.ptr = getelementptr inbounds i8, i8* %5, i32 %mul2
  store i8* %add.ptr, i8** %max, align 4
  %8 = load i32, i32* %n.addr, align 4
  %cmp3 = icmp sge i32 %8, 4
  br i1 %cmp3, label %if.then4, label %if.else

if.then4:                                         ; preds = %if.end
  %9 = load i8*, i8** %base.addr, align 4
  %10 = load i8*, i8** %max, align 4
  call void @qst(i8* %9, i8* %10)
  %11 = load i8*, i8** %base.addr, align 4
  %12 = load i32, i32* @thresh, align 4
  %add.ptr5 = getelementptr inbounds i8, i8* %11, i32 %12
  store i8* %add.ptr5, i8** %hi, align 4
  br label %if.end6

if.else:                                          ; preds = %if.end
  %13 = load i8*, i8** %max, align 4
  store i8* %13, i8** %hi, align 4
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then4
  %14 = load i8*, i8** %base.addr, align 4
  store i8* %14, i8** %lo, align 4
  store i8* %14, i8** %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %if.end11, %if.end6
  %15 = load i32, i32* @qsz, align 4
  %16 = load i8*, i8** %lo, align 4
  %add.ptr7 = getelementptr inbounds i8, i8* %16, i32 %15
  store i8* %add.ptr7, i8** %lo, align 4
  %17 = load i8*, i8** %hi, align 4
  %cmp8 = icmp ult i8* %add.ptr7, %17
  br i1 %cmp8, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %18 = load i32 (...)*, i32 (...)** @qcmp, align 4
  %19 = load i8*, i8** %j, align 4
  %20 = load i8*, i8** %lo, align 4
  %callee.knr.cast = bitcast i32 (...)* %18 to i32 (i8*, i8*)*
  %call = call i32 %callee.knr.cast(i8* %19, i8* %20)
  %cmp9 = icmp sgt i32 %call, 0
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %for.body
  %21 = load i8*, i8** %lo, align 4
  store i8* %21, i8** %j, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %for.body
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %22 = load i8*, i8** %j, align 4
  %23 = load i8*, i8** %base.addr, align 4
  %cmp12 = icmp ne i8* %22, %23
  br i1 %cmp12, label %if.then13, label %if.end20

if.then13:                                        ; preds = %for.end
  %24 = load i8*, i8** %base.addr, align 4
  store i8* %24, i8** %i, align 4
  %25 = load i8*, i8** %base.addr, align 4
  %26 = load i32, i32* @qsz, align 4
  %add.ptr14 = getelementptr inbounds i8, i8* %25, i32 %26
  store i8* %add.ptr14, i8** %hi, align 4
  br label %for.cond15

for.cond15:                                       ; preds = %for.body17, %if.then13
  %27 = load i8*, i8** %i, align 4
  %28 = load i8*, i8** %hi, align 4
  %cmp16 = icmp ult i8* %27, %28
  br i1 %cmp16, label %for.body17, label %for.end19

for.body17:                                       ; preds = %for.cond15
  %29 = load i8*, i8** %j, align 4
  %30 = load i8, i8* %29, align 1
  store i8 %30, i8* %c, align 1
  %31 = load i8*, i8** %i, align 4
  %32 = load i8, i8* %31, align 1
  %33 = load i8*, i8** %j, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %33, i32 1
  store i8* %incdec.ptr, i8** %j, align 4
  store i8 %32, i8* %33, align 1
  %34 = load i8, i8* %c, align 1
  %35 = load i8*, i8** %i, align 4
  %incdec.ptr18 = getelementptr inbounds i8, i8* %35, i32 1
  store i8* %incdec.ptr18, i8** %i, align 4
  store i8 %34, i8* %35, align 1
  br label %for.cond15

for.end19:                                        ; preds = %for.cond15
  br label %if.end20

if.end20:                                         ; preds = %for.end19, %for.end
  %36 = load i8*, i8** %base.addr, align 4
  store i8* %36, i8** %min, align 4
  br label %for.cond21

for.cond21:                                       ; preds = %if.end44, %if.end20
  %37 = load i32, i32* @qsz, align 4
  %38 = load i8*, i8** %min, align 4
  %add.ptr22 = getelementptr inbounds i8, i8* %38, i32 %37
  store i8* %add.ptr22, i8** %min, align 4
  store i8* %add.ptr22, i8** %hi, align 4
  %39 = load i8*, i8** %max, align 4
  %cmp23 = icmp ult i8* %add.ptr22, %39
  br i1 %cmp23, label %for.body24, label %for.end45

for.body24:                                       ; preds = %for.cond21
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.body24
  %40 = load i32 (...)*, i32 (...)** @qcmp, align 4
  %41 = load i32, i32* @qsz, align 4
  %42 = load i8*, i8** %hi, align 4
  %idx.neg = sub i32 0, %41
  %add.ptr25 = getelementptr inbounds i8, i8* %42, i32 %idx.neg
  store i8* %add.ptr25, i8** %hi, align 4
  %43 = load i8*, i8** %min, align 4
  %callee.knr.cast26 = bitcast i32 (...)* %40 to i32 (i8*, i8*)*
  %call27 = call i32 %callee.knr.cast26(i8* %add.ptr25, i8* %43)
  %cmp28 = icmp sgt i32 %call27, 0
  br i1 %cmp28, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %44 = load i32, i32* @qsz, align 4
  %45 = load i8*, i8** %hi, align 4
  %add.ptr29 = getelementptr inbounds i8, i8* %45, i32 %44
  store i8* %add.ptr29, i8** %hi, align 4
  %46 = load i8*, i8** %min, align 4
  %cmp30 = icmp ne i8* %add.ptr29, %46
  br i1 %cmp30, label %if.then31, label %if.end44

if.then31:                                        ; preds = %while.end
  %47 = load i8*, i8** %min, align 4
  %48 = load i32, i32* @qsz, align 4
  %add.ptr32 = getelementptr inbounds i8, i8* %47, i32 %48
  store i8* %add.ptr32, i8** %lo, align 4
  br label %for.cond33

for.cond33:                                       ; preds = %for.end42, %if.then31
  %49 = load i8*, i8** %lo, align 4
  %incdec.ptr34 = getelementptr inbounds i8, i8* %49, i32 -1
  store i8* %incdec.ptr34, i8** %lo, align 4
  %50 = load i8*, i8** %min, align 4
  %cmp35 = icmp uge i8* %incdec.ptr34, %50
  br i1 %cmp35, label %for.body36, label %for.end43

for.body36:                                       ; preds = %for.cond33
  %51 = load i8*, i8** %lo, align 4
  %52 = load i8, i8* %51, align 1
  store i8 %52, i8* %c, align 1
  %53 = load i8*, i8** %lo, align 4
  store i8* %53, i8** %j, align 4
  store i8* %53, i8** %i, align 4
  br label %for.cond37

for.cond37:                                       ; preds = %for.inc, %for.body36
  %54 = load i32, i32* @qsz, align 4
  %55 = load i8*, i8** %j, align 4
  %idx.neg38 = sub i32 0, %54
  %add.ptr39 = getelementptr inbounds i8, i8* %55, i32 %idx.neg38
  store i8* %add.ptr39, i8** %j, align 4
  %56 = load i8*, i8** %hi, align 4
  %cmp40 = icmp uge i8* %add.ptr39, %56
  br i1 %cmp40, label %for.body41, label %for.end42

for.body41:                                       ; preds = %for.cond37
  %57 = load i8*, i8** %j, align 4
  %58 = load i8, i8* %57, align 1
  %59 = load i8*, i8** %i, align 4
  store i8 %58, i8* %59, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body41
  %60 = load i8*, i8** %j, align 4
  store i8* %60, i8** %i, align 4
  br label %for.cond37

for.end42:                                        ; preds = %for.cond37
  %61 = load i8, i8* %c, align 1
  %62 = load i8*, i8** %i, align 4
  store i8 %61, i8* %62, align 1
  br label %for.cond33

for.end43:                                        ; preds = %for.cond33
  br label %if.end44

if.end44:                                         ; preds = %for.end43, %while.end
  br label %for.cond21

for.end45:                                        ; preds = %if.then, %for.cond21
  ret void
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
define internal void @qst(i8* %base, i8* %max) #0 {
entry:
  %base.addr = alloca i8*, align 4
  %max.addr = alloca i8*, align 4
  %c = alloca i8, align 1
  %i = alloca i8*, align 4
  %j = alloca i8*, align 4
  %jj = alloca i8*, align 4
  %ii = alloca i32, align 4
  %mid = alloca i8*, align 4
  %tmp = alloca i8*, align 4
  %lo = alloca i32, align 4
  %hi = alloca i32, align 4
  store i8* %base, i8** %base.addr, align 4
  store i8* %max, i8** %max.addr, align 4
  %0 = load i8*, i8** %max.addr, align 4
  %1 = load i8*, i8** %base.addr, align 4
  %sub.ptr.lhs.cast = ptrtoint i8* %0 to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %1 to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  store i32 %sub.ptr.sub, i32* %lo, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond79, %entry
  %2 = load i8*, i8** %base.addr, align 4
  %3 = load i32, i32* @qsz, align 4
  %4 = load i32, i32* %lo, align 4
  %5 = load i32, i32* @qsz, align 4
  %div = sdiv i32 %4, %5
  %shr = ashr i32 %div, 1
  %mul = mul nsw i32 %3, %shr
  %add.ptr = getelementptr inbounds i8, i8* %2, i32 %mul
  store i8* %add.ptr, i8** %i, align 4
  store i8* %add.ptr, i8** %mid, align 4
  %6 = load i32, i32* %lo, align 4
  %7 = load i32, i32* @mthresh, align 4
  %cmp = icmp sge i32 %6, %7
  br i1 %cmp, label %if.then, label %if.end24

if.then:                                          ; preds = %do.body
  %8 = load i32 (...)*, i32 (...)** @qcmp, align 4
  %9 = load i8*, i8** %base.addr, align 4
  store i8* %9, i8** %jj, align 4
  %10 = load i8*, i8** %i, align 4
  %callee.knr.cast = bitcast i32 (...)* %8 to i32 (i8*, i8*)*
  %call = call i32 %callee.knr.cast(i8* %9, i8* %10)
  %cmp3 = icmp sgt i32 %call, 0
  br i1 %cmp3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then
  %11 = load i8*, i8** %jj, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.then
  %12 = load i8*, i8** %i, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ %11, %cond.true ], [ %12, %cond.false ]
  store i8* %cond, i8** %j, align 4
  %13 = load i32 (...)*, i32 (...)** @qcmp, align 4
  %14 = load i8*, i8** %j, align 4
  %15 = load i8*, i8** %max.addr, align 4
  %16 = load i32, i32* @qsz, align 4
  %idx.neg = sub i32 0, %16
  %add.ptr4 = getelementptr inbounds i8, i8* %15, i32 %idx.neg
  store i8* %add.ptr4, i8** %tmp, align 4
  %callee.knr.cast5 = bitcast i32 (...)* %13 to i32 (i8*, i8*)*
  %call6 = call i32 %callee.knr.cast5(i8* %14, i8* %add.ptr4)
  %cmp7 = icmp sgt i32 %call6, 0
  br i1 %cmp7, label %if.then8, label %if.end18

if.then8:                                         ; preds = %cond.end
  %17 = load i8*, i8** %j, align 4
  %18 = load i8*, i8** %jj, align 4
  %cmp9 = icmp eq i8* %17, %18
  br i1 %cmp9, label %cond.true10, label %cond.false11

cond.true10:                                      ; preds = %if.then8
  %19 = load i8*, i8** %i, align 4
  br label %cond.end12

cond.false11:                                     ; preds = %if.then8
  %20 = load i8*, i8** %jj, align 4
  br label %cond.end12

cond.end12:                                       ; preds = %cond.false11, %cond.true10
  %cond13 = phi i8* [ %19, %cond.true10 ], [ %20, %cond.false11 ]
  store i8* %cond13, i8** %j, align 4
  %21 = load i32 (...)*, i32 (...)** @qcmp, align 4
  %22 = load i8*, i8** %j, align 4
  %23 = load i8*, i8** %tmp, align 4
  %callee.knr.cast14 = bitcast i32 (...)* %21 to i32 (i8*, i8*)*
  %call15 = call i32 %callee.knr.cast14(i8* %22, i8* %23)
  %cmp16 = icmp slt i32 %call15, 0
  br i1 %cmp16, label %if.then17, label %if.end

if.then17:                                        ; preds = %cond.end12
  %24 = load i8*, i8** %tmp, align 4
  store i8* %24, i8** %j, align 4
  br label %if.end

if.end:                                           ; preds = %if.then17, %cond.end12
  br label %if.end18

if.end18:                                         ; preds = %if.end, %cond.end
  %25 = load i8*, i8** %j, align 4
  %26 = load i8*, i8** %i, align 4
  %cmp19 = icmp ne i8* %25, %26
  br i1 %cmp19, label %if.then20, label %if.end23

if.then20:                                        ; preds = %if.end18
  %27 = load i32, i32* @qsz, align 4
  store i32 %27, i32* %ii, align 4
  br label %do.body21

do.body21:                                        ; preds = %do.cond, %if.then20
  %28 = load i8*, i8** %i, align 4
  %29 = load i8, i8* %28, align 1
  store i8 %29, i8* %c, align 1
  %30 = load i8*, i8** %j, align 4
  %31 = load i8, i8* %30, align 1
  %32 = load i8*, i8** %i, align 4
  %incdec.ptr = getelementptr inbounds i8, i8* %32, i32 1
  store i8* %incdec.ptr, i8** %i, align 4
  store i8 %31, i8* %32, align 1
  %33 = load i8, i8* %c, align 1
  %34 = load i8*, i8** %j, align 4
  %incdec.ptr22 = getelementptr inbounds i8, i8* %34, i32 1
  store i8* %incdec.ptr22, i8** %j, align 4
  store i8 %33, i8* %34, align 1
  br label %do.cond

do.cond:                                          ; preds = %do.body21
  %35 = load i32, i32* %ii, align 4
  %dec = add nsw i32 %35, -1
  store i32 %dec, i32* %ii, align 4
  %tobool = icmp ne i32 %dec, 0
  br i1 %tobool, label %do.body21, label %do.end

do.end:                                           ; preds = %do.cond
  br label %if.end23

if.end23:                                         ; preds = %do.end, %if.end18
  br label %if.end24

if.end24:                                         ; preds = %if.end23, %do.body
  %36 = load i8*, i8** %base.addr, align 4
  store i8* %36, i8** %i, align 4
  %37 = load i8*, i8** %max.addr, align 4
  %38 = load i32, i32* @qsz, align 4
  %idx.neg25 = sub i32 0, %38
  %add.ptr26 = getelementptr inbounds i8, i8* %37, i32 %idx.neg25
  store i8* %add.ptr26, i8** %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %do.end61, %if.end24
  br label %while.cond

while.cond:                                       ; preds = %while.body, %for.cond
  %39 = load i8*, i8** %i, align 4
  %40 = load i8*, i8** %mid, align 4
  %cmp27 = icmp ult i8* %39, %40
  br i1 %cmp27, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %41 = load i32 (...)*, i32 (...)** @qcmp, align 4
  %42 = load i8*, i8** %i, align 4
  %43 = load i8*, i8** %mid, align 4
  %callee.knr.cast28 = bitcast i32 (...)* %41 to i32 (i8*, i8*)*
  %call29 = call i32 %callee.knr.cast28(i8* %42, i8* %43)
  %cmp30 = icmp sle i32 %call29, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %44 = phi i1 [ false, %while.cond ], [ %cmp30, %land.rhs ]
  br i1 %44, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %45 = load i32, i32* @qsz, align 4
  %46 = load i8*, i8** %i, align 4
  %add.ptr31 = getelementptr inbounds i8, i8* %46, i32 %45
  store i8* %add.ptr31, i8** %i, align 4
  br label %while.cond

while.end:                                        ; preds = %land.end
  br label %while.cond32

while.cond32:                                     ; preds = %if.then38, %while.end
  %47 = load i8*, i8** %j, align 4
  %48 = load i8*, i8** %mid, align 4
  %cmp33 = icmp ugt i8* %47, %48
  br i1 %cmp33, label %while.body34, label %while.end48

while.body34:                                     ; preds = %while.cond32
  %49 = load i32 (...)*, i32 (...)** @qcmp, align 4
  %50 = load i8*, i8** %mid, align 4
  %51 = load i8*, i8** %j, align 4
  %callee.knr.cast35 = bitcast i32 (...)* %49 to i32 (i8*, i8*)*
  %call36 = call i32 %callee.knr.cast35(i8* %50, i8* %51)
  %cmp37 = icmp sle i32 %call36, 0
  br i1 %cmp37, label %if.then38, label %if.end41

if.then38:                                        ; preds = %while.body34
  %52 = load i32, i32* @qsz, align 4
  %53 = load i8*, i8** %j, align 4
  %idx.neg39 = sub i32 0, %52
  %add.ptr40 = getelementptr inbounds i8, i8* %53, i32 %idx.neg39
  store i8* %add.ptr40, i8** %j, align 4
  br label %while.cond32

if.end41:                                         ; preds = %while.body34
  %54 = load i8*, i8** %i, align 4
  %55 = load i32, i32* @qsz, align 4
  %add.ptr42 = getelementptr inbounds i8, i8* %54, i32 %55
  store i8* %add.ptr42, i8** %tmp, align 4
  %56 = load i8*, i8** %i, align 4
  %57 = load i8*, i8** %mid, align 4
  %cmp43 = icmp eq i8* %56, %57
  br i1 %cmp43, label %if.then44, label %if.else

if.then44:                                        ; preds = %if.end41
  %58 = load i8*, i8** %j, align 4
  store i8* %58, i8** %jj, align 4
  store i8* %58, i8** %mid, align 4
  br label %if.end47

if.else:                                          ; preds = %if.end41
  %59 = load i8*, i8** %j, align 4
  store i8* %59, i8** %jj, align 4
  %60 = load i32, i32* @qsz, align 4
  %61 = load i8*, i8** %j, align 4
  %idx.neg45 = sub i32 0, %60
  %add.ptr46 = getelementptr inbounds i8, i8* %61, i32 %idx.neg45
  store i8* %add.ptr46, i8** %j, align 4
  br label %if.end47

if.end47:                                         ; preds = %if.else, %if.then44
  br label %swap

while.end48:                                      ; preds = %while.cond32
  %62 = load i8*, i8** %i, align 4
  %63 = load i8*, i8** %mid, align 4
  %cmp49 = icmp eq i8* %62, %63
  br i1 %cmp49, label %if.then50, label %if.else51

if.then50:                                        ; preds = %while.end48
  br label %for.end

if.else51:                                        ; preds = %while.end48
  %64 = load i8*, i8** %mid, align 4
  store i8* %64, i8** %jj, align 4
  %65 = load i8*, i8** %i, align 4
  store i8* %65, i8** %mid, align 4
  store i8* %65, i8** %tmp, align 4
  %66 = load i32, i32* @qsz, align 4
  %67 = load i8*, i8** %j, align 4
  %idx.neg52 = sub i32 0, %66
  %add.ptr53 = getelementptr inbounds i8, i8* %67, i32 %idx.neg52
  store i8* %add.ptr53, i8** %j, align 4
  br label %if.end54

if.end54:                                         ; preds = %if.else51
  br label %swap

swap:                                             ; preds = %if.end54, %if.end47
  %68 = load i32, i32* @qsz, align 4
  store i32 %68, i32* %ii, align 4
  br label %do.body55

do.body55:                                        ; preds = %do.cond58, %swap
  %69 = load i8*, i8** %i, align 4
  %70 = load i8, i8* %69, align 1
  store i8 %70, i8* %c, align 1
  %71 = load i8*, i8** %jj, align 4
  %72 = load i8, i8* %71, align 1
  %73 = load i8*, i8** %i, align 4
  %incdec.ptr56 = getelementptr inbounds i8, i8* %73, i32 1
  store i8* %incdec.ptr56, i8** %i, align 4
  store i8 %72, i8* %73, align 1
  %74 = load i8, i8* %c, align 1
  %75 = load i8*, i8** %jj, align 4
  %incdec.ptr57 = getelementptr inbounds i8, i8* %75, i32 1
  store i8* %incdec.ptr57, i8** %jj, align 4
  store i8 %74, i8* %75, align 1
  br label %do.cond58

do.cond58:                                        ; preds = %do.body55
  %76 = load i32, i32* %ii, align 4
  %dec59 = add nsw i32 %76, -1
  store i32 %dec59, i32* %ii, align 4
  %tobool60 = icmp ne i32 %dec59, 0
  br i1 %tobool60, label %do.body55, label %do.end61

do.end61:                                         ; preds = %do.cond58
  %77 = load i8*, i8** %tmp, align 4
  store i8* %77, i8** %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then50
  %78 = load i8*, i8** %mid, align 4
  store i8* %78, i8** %j, align 4
  %79 = load i32, i32* @qsz, align 4
  %add.ptr62 = getelementptr inbounds i8, i8* %78, i32 %79
  store i8* %add.ptr62, i8** %i, align 4
  %80 = load i8*, i8** %j, align 4
  %81 = load i8*, i8** %base.addr, align 4
  %sub.ptr.lhs.cast63 = ptrtoint i8* %80 to i32
  %sub.ptr.rhs.cast64 = ptrtoint i8* %81 to i32
  %sub.ptr.sub65 = sub i32 %sub.ptr.lhs.cast63, %sub.ptr.rhs.cast64
  store i32 %sub.ptr.sub65, i32* %lo, align 4
  %82 = load i8*, i8** %max.addr, align 4
  %83 = load i8*, i8** %i, align 4
  %sub.ptr.lhs.cast66 = ptrtoint i8* %82 to i32
  %sub.ptr.rhs.cast67 = ptrtoint i8* %83 to i32
  %sub.ptr.sub68 = sub i32 %sub.ptr.lhs.cast66, %sub.ptr.rhs.cast67
  store i32 %sub.ptr.sub68, i32* %hi, align 4
  %cmp69 = icmp sle i32 %sub.ptr.sub65, %sub.ptr.sub68
  br i1 %cmp69, label %if.then70, label %if.else74

if.then70:                                        ; preds = %for.end
  %84 = load i32, i32* %lo, align 4
  %85 = load i32, i32* @thresh, align 4
  %cmp71 = icmp sge i32 %84, %85
  br i1 %cmp71, label %if.then72, label %if.end73

if.then72:                                        ; preds = %if.then70
  %86 = load i8*, i8** %base.addr, align 4
  %87 = load i8*, i8** %j, align 4
  call void @qst(i8* %86, i8* %87)
  br label %if.end73

if.end73:                                         ; preds = %if.then72, %if.then70
  %88 = load i8*, i8** %i, align 4
  store i8* %88, i8** %base.addr, align 4
  %89 = load i32, i32* %hi, align 4
  store i32 %89, i32* %lo, align 4
  br label %if.end78

if.else74:                                        ; preds = %for.end
  %90 = load i32, i32* %hi, align 4
  %91 = load i32, i32* @thresh, align 4
  %cmp75 = icmp sge i32 %90, %91
  br i1 %cmp75, label %if.then76, label %if.end77

if.then76:                                        ; preds = %if.else74
  %92 = load i8*, i8** %i, align 4
  %93 = load i8*, i8** %max.addr, align 4
  call void @qst(i8* %92, i8* %93)
  br label %if.end77

if.end77:                                         ; preds = %if.then76, %if.else74
  %94 = load i8*, i8** %j, align 4
  store i8* %94, i8** %max.addr, align 4
  br label %if.end78

if.end78:                                         ; preds = %if.end77, %if.end73
  br label %do.cond79

do.cond79:                                        ; preds = %if.end78
  %95 = load i32, i32* %lo, align 4
  %96 = load i32, i32* @thresh, align 4
  %cmp80 = icmp sge i32 %95, %96
  br i1 %cmp80, label %do.body, label %do.end81

do.end81:                                         ; preds = %do.cond79
  ret void
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"}
