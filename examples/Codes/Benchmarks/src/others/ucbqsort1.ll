; ModuleID = 'ucbqsort.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@gQSortNum = global [1000 x i8] c"9~\DF,\0B\8A\FB\E8\8FV\D7<S\1Es0W.1\A4e\C6\EBH\1F\069\0C\E3n\9D`\19\22\BF\8C+\16%\88\AF\B6\B7\DCsB\AD\90\89rQDEf\CB\A8\C1f\A7\AC\03\0EC@\F9>\9F\14KJ\BB\D8\CF\16\97|m\A23\10\97\12\8F\1C%\FA\AB\08_:\87L\DDR\DD\E0\D9\9E\7FLk\AA\9B\C8\EF\8Aw\E4M\02\ED\B0\B7\B2o\84\05\A6\8Bh\81\DAg\14\BDN\03\80\B9\02_\AC\8B\0A{h\F1\D6\A9\BC\D3b\0DP)R\B1\DC\E5\BA\95\C8\9F\86Gtc\12\1D\E0g\A2\C1\0C\AB\96\A5\F8\D1\CA\C9\5C\0D>\D3\10\F7\0E\D1<;\1A\B5(\BF\E6',}r\C3@\87\BE\E1\945\CA\C5\A8Oj\17\04\13\22M\90\17\92\F1\9C[z+\88\DFF\F94\A3.]`Y\1E\FF4\15\D6\E5Ho\0A\09\9C\CD~\93072\EF\FC\85&\0B\E8\01\A6\19l=\CE}\00\C7~\DF,\0Bv\FB\18q\AA\D7<S\1Es0\A9\D21\5Ce:\15\B8\E1\06\C7\F4\E3\92c`\19\DEA\8C\D5\16\DB\88\AF\B6I$\8D\BESp\89r\AF\BC\BBf5\A8\C1\9A\A7\AC\03\F2C@\07>\9F\ECK\B6\BB(1\EAi|m\A2\CD\10i\EE\8F\1C%\06U\F8\A1:y\B4\DD\AE\DD \D9b\81L\95\AAe\C8\EFv\89\1C\B3\FE\13P\B7\B2\91|\FB\A6\8B\98\81&\99\14\BDN\03\80G\FE_T\8B\0A{\98\F1\D6\A9D\D3b\0DP\D7RO$\E5F\958\9F\86\B9\8Cc\12\1D\E0\99^?\F4U\96[\F8\D1\CA7\5C\F3\C2\D3\F0\F7\F2\D1\C4\C5\1AK(\BF\1A',\83\8E\C3@y\BE\E1\9456\C5XOj\E9\FC\13\22M\90\E9\92\F1d[\86+\88!F\F9\CC\A3\D2\A3`Y\E2\014\EB\D6\1BHo\F6\F7\9C3\82m\D072\11\FC{\DA\F5\E8\FFZ\E7l\C32}\00\C7\82\DF\D4\0B\8A\FB\E8\8FV\D7\C4S\1E\8D0W.\CF\5C\9B:\EB\B8\1F\06\C7\0C\1D\92\9D\A0\E7\22\BFt\D5\16%\88\AFJ\B7$sB\AD\90\89\8E\AF\BCEf5\A8\C1fY\AC\FD\F2C\C0\07>\9F\14\B5\B6\BB\D8\CF\16i\84m\A2\CD\10\97\12q\E4%\06U\08\A1:\87L#\AE#\E0'\9E\7F\B4\95V\9B\C8\EFvw\1CM\FE\13\B0\B7N\91\84\05Zu\98\7F\DA\99\14C\B2\03\80\B9\FE_\AC\8B\F6{h\0F*\A9D\D3b\F3P)\AEO$\1B\BAk8a\86Gt\9D\EE\E3 \99\A2\C1\F4\AB\96\A5\F8\D167\A4\0D\C2-\10\F7\F2/<;\1AK(A\E6\D9,\83\8E\C3\C0y\BE\E1l\CB\CA\C5\A8\B1\96\E9\FC\13\22M\90\17n\0Fd[z\D5x\DFF\074].]\A0\A7\E2\FF\CC\15*\E5Ho\F6\09d\CD~\9307\CE\EF\04\85\DA\F5\E8\FF\A6\E7l\C32\83\009\82\DF,\F5v\FB\E8qV\D7\C4S\1E\8D0W.\CF\5C\9B\C6\EBH\1F\FA9\F4\1Dnc\A0\E7\22At+\16\DB\88\AFJI\DC\8D\BESp\89\8EQDE\9A\CBX?\9AY\AC\03\F2C\C0\F9>\9F\14\B5JE\D81\16i\84m\A2\CD\10\97\12q\E4\DB\FA\AB\08_:\87\B4#R\DD\E0'b\81\B4kVe\C8\EFvw\E4\B3\02\EDP\B7No|\05Zuh\7F&\99\14C\B2\FD\80\B9\FE_\ACu\0A{\98\F1*W\BC\D3b\F3P\D7RO$\1B\BAk\C8\9FzG\8C\9D\EE\1D\E0\99^?\F4Uj[\F8/6\C9\A4\F3>\D3\F0\F7\F2/\C4\C5\E6\B5\D8A\1A\D9,}r\C3\C0\87\BE\1F\94\CB\CA;XO\96\E9\FC\13\22M\90\E9\92\0Fd\A5z\D5\88\DFF\F9\CC].]`\A7\1E\01\CC\15*\1BH", align 1
@.str = private unnamed_addr constant [5 x i8] c"666\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"-1\0A\00", align 1
@qsz = internal unnamed_addr global i32 0, align 4
@qcmp = internal unnamed_addr global i32 (...)* null, align 4
@thresh = internal unnamed_addr global i32 0, align 4
@mthresh = internal unnamed_addr global i32 0, align 4
@str = private unnamed_addr constant [3 x i8] c"-1\00"
@str2 = private unnamed_addr constant [4 x i8] c"666\00"

; Function Attrs: nounwind readonly
define i32 @compare(i8* nocapture readonly %n1, i8* nocapture readonly %n2) #0 {
entry:
  %0 = load i8, i8* %n1, align 1, !tbaa !1
  %conv = zext i8 %0 to i32
  %1 = load i8, i8* %n2, align 1, !tbaa !1
  %conv1 = zext i8 %1 to i32
  %sub = sub nsw i32 %conv, %conv1
  ret i32 %sub
}

; Function Attrs: nounwind
define i32 @main() #1 {
entry:
  %SortArr = alloca [1000 x i8], align 1
  %0 = getelementptr inbounds [1000 x i8], [1000 x i8]* %SortArr, i32 0, i32 0
  call void @llvm.lifetime.start(i64 1000, i8* %0) #2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %0, i8* getelementptr inbounds ([1000 x i8], [1000 x i8]* @gQSortNum, i32 0, i32 0), i32 1000, i32 1, i1 false)
  call void @QSORT(i8* %0, i32 1000, i32 1, i32 (...)* bitcast (i32 (i8*, i8*)* @compare to i32 (...)*))
  br label %for.body

for.cond:                                         ; preds = %for.body
  %cmp = icmp slt i32 %inc, 1000
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %entry, %for.cond
  %j.010 = phi i32 [ 1, %entry ], [ %inc, %for.cond ]
  %arrayidx = getelementptr inbounds [1000 x i8], [1000 x i8]* %SortArr, i32 0, i32 %j.010
  %1 = load i8, i8* %arrayidx, align 1, !tbaa !1
  %sub = add nsw i32 %j.010, -1
  %arrayidx1 = getelementptr inbounds [1000 x i8], [1000 x i8]* %SortArr, i32 0, i32 %sub
  %2 = load i8, i8* %arrayidx1, align 1, !tbaa !1
  %cmp3 = icmp ult i8 %1, %2
  %inc = add nuw nsw i32 %j.010, 1
  br i1 %cmp3, label %if.then, label %for.cond

if.then:                                          ; preds = %for.body
  %puts9 = call i32 @puts(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str2, i32 0, i32 0))
  br label %cleanup

for.end:                                          ; preds = %for.cond
  %puts = call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str, i32 0, i32 0))
  br label %cleanup

cleanup:                                          ; preds = %for.end, %if.then
  %retval.0 = phi i32 [ 15, %if.then ], [ 66, %for.end ]
  call void @llvm.lifetime.end(i64 1000, i8* %0) #2
  ret i32 %retval.0
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #2

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture, i8* nocapture readonly, i32, i32, i1) #2

; Function Attrs: nounwind
define void @QSORT(i8* %base, i32 %n, i32 %size, i32 (...)* %compar) #1 {
entry:
  %cmp = icmp slt i32 %n, 2
  br i1 %cmp, label %for.end45, label %if.end

if.end:                                           ; preds = %entry
  store i32 %size, i32* @qsz, align 4, !tbaa !4
  store i32 (...)* %compar, i32 (...)** @qcmp, align 4, !tbaa !6
  %mul = shl nsw i32 %size, 2
  store i32 %mul, i32* @thresh, align 4, !tbaa !4
  %mul1 = mul nsw i32 %size, 6
  store i32 %mul1, i32* @mthresh, align 4, !tbaa !4
  %mul2 = mul nsw i32 %size, %n
  %add.ptr = getelementptr inbounds i8, i8* %base, i32 %mul2
  %cmp3 = icmp sgt i32 %n, 3
  br i1 %cmp3, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.end
  tail call fastcc void @qst(i8* %base, i8* %add.ptr)
  %0 = load i32, i32* @thresh, align 4, !tbaa !4
  %add.ptr5 = getelementptr inbounds i8, i8* %base, i32 %0
  br label %if.end6

if.end6:                                          ; preds = %if.end, %if.then4
  %hi.0 = phi i8* [ %add.ptr5, %if.then4 ], [ %add.ptr, %if.end ]
  %1 = load i32, i32* @qsz, align 4, !tbaa !4
  %add.ptr797 = getelementptr inbounds i8, i8* %base, i32 %1
  %cmp898 = icmp ult i8* %add.ptr797, %hi.0
  br i1 %cmp898, label %for.body, label %for.cond21.preheader

for.body:                                         ; preds = %if.end6, %for.body
  %add.ptr7100 = phi i8* [ %add.ptr7, %for.body ], [ %add.ptr797, %if.end6 ]
  %j.099 = phi i8* [ %add.ptr7.j.0, %for.body ], [ %base, %if.end6 ]
  %2 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** bitcast (i32 (...)** @qcmp to i32 (i8*, i8*)**), align 4, !tbaa !6
  %call = tail call i32 %2(i8* %j.099, i8* %add.ptr7100) #2
  %cmp9 = icmp sgt i32 %call, 0
  %add.ptr7.j.0 = select i1 %cmp9, i8* %add.ptr7100, i8* %j.099
  %3 = load i32, i32* @qsz, align 4, !tbaa !4
  %add.ptr7 = getelementptr inbounds i8, i8* %add.ptr7100, i32 %3
  %cmp8 = icmp ult i8* %add.ptr7, %hi.0
  br i1 %cmp8, label %for.body, label %for.end

for.end:                                          ; preds = %for.body
  %cmp12 = icmp eq i8* %add.ptr7.j.0, %base
  br i1 %cmp12, label %for.cond21.preheader, label %if.then13

if.then13:                                        ; preds = %for.end
  %add.ptr14 = getelementptr inbounds i8, i8* %base, i32 %3
  %cmp1694 = icmp sgt i32 %3, 0
  br i1 %cmp1694, label %for.body17, label %for.cond21.preheader

for.cond21.preheader:                             ; preds = %for.body17, %if.end6, %if.then13, %for.end
  %4 = load i32, i32* @qsz, align 4, !tbaa !4
  %cmp2391 = icmp slt i32 %4, %mul2
  br i1 %cmp2391, label %while.cond.preheader.lr.ph, label %for.end45

while.cond.preheader.lr.ph:                       ; preds = %for.cond21.preheader
  %add.ptr2290 = getelementptr inbounds i8, i8* %base, i32 %4
  br label %while.cond.preheader

for.body17:                                       ; preds = %if.then13, %for.body17
  %j.196 = phi i8* [ %incdec.ptr, %for.body17 ], [ %add.ptr7.j.0, %if.then13 ]
  %i.095 = phi i8* [ %incdec.ptr18, %for.body17 ], [ %base, %if.then13 ]
  %5 = load i8, i8* %j.196, align 1, !tbaa !1
  %6 = load i8, i8* %i.095, align 1, !tbaa !1
  %incdec.ptr = getelementptr inbounds i8, i8* %j.196, i32 1
  store i8 %6, i8* %j.196, align 1, !tbaa !1
  %incdec.ptr18 = getelementptr inbounds i8, i8* %i.095, i32 1
  store i8 %5, i8* %i.095, align 1, !tbaa !1
  %cmp16 = icmp ult i8* %incdec.ptr18, %add.ptr14
  br i1 %cmp16, label %for.body17, label %for.cond21.preheader

while.cond.preheader:                             ; preds = %while.cond.preheader.lr.ph, %for.cond21.backedge
  %add.ptr2293 = phi i8* [ %add.ptr2290, %while.cond.preheader.lr.ph ], [ %add.ptr22, %for.cond21.backedge ]
  %7 = phi i32 [ %4, %while.cond.preheader.lr.ph ], [ %11, %for.cond21.backedge ]
  %min.092 = phi i8* [ %base, %while.cond.preheader.lr.ph ], [ %add.ptr2293, %for.cond21.backedge ]
  br label %while.cond

while.cond:                                       ; preds = %while.cond.preheader, %while.cond
  %hi.1 = phi i8* [ %add.ptr25, %while.cond ], [ %add.ptr2293, %while.cond.preheader ]
  %8 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** bitcast (i32 (...)** @qcmp to i32 (i8*, i8*)**), align 4, !tbaa !6
  %9 = load i32, i32* @qsz, align 4, !tbaa !4
  %idx.neg = sub i32 0, %9
  %add.ptr25 = getelementptr inbounds i8, i8* %hi.1, i32 %idx.neg
  %call27 = tail call i32 %8(i8* %add.ptr25, i8* %add.ptr2293) #2
  %cmp28 = icmp sgt i32 %call27, 0
  br i1 %cmp28, label %while.cond, label %while.end

while.end:                                        ; preds = %while.cond
  %10 = load i32, i32* @qsz, align 4, !tbaa !4
  %add.ptr25.sum = sub i32 %10, %9
  %add.ptr29 = getelementptr inbounds i8, i8* %hi.1, i32 %add.ptr25.sum
  %cmp30 = icmp eq i8* %add.ptr29, %add.ptr2293
  br i1 %cmp30, label %for.cond21.backedge, label %if.then31

for.cond21.backedge:                              ; preds = %for.end42, %if.then31, %while.end
  %11 = load i32, i32* @qsz, align 4, !tbaa !4
  %add.ptr22 = getelementptr inbounds i8, i8* %add.ptr2293, i32 %11
  %cmp23 = icmp ult i8* %add.ptr22, %add.ptr
  br i1 %cmp23, label %while.cond.preheader, label %for.end45

if.then31:                                        ; preds = %while.end
  %add.ptr22.sum = add i32 %10, %7
  %add.ptr32.sum = add i32 %add.ptr22.sum, -1
  %incdec.ptr3487 = getelementptr inbounds i8, i8* %min.092, i32 %add.ptr32.sum
  %cmp3588 = icmp ult i8* %incdec.ptr3487, %add.ptr2293
  br i1 %cmp3588, label %for.cond21.backedge, label %for.body36

for.body36:                                       ; preds = %if.then31, %for.end42
  %incdec.ptr3489 = phi i8* [ %incdec.ptr34, %for.end42 ], [ %incdec.ptr3487, %if.then31 ]
  %12 = load i8, i8* %incdec.ptr3489, align 1, !tbaa !1
  %13 = load i32, i32* @qsz, align 4, !tbaa !4
  %idx.neg3882 = sub i32 0, %13
  %add.ptr3983 = getelementptr inbounds i8, i8* %incdec.ptr3489, i32 %idx.neg3882
  %cmp4084 = icmp ult i8* %add.ptr3983, %add.ptr29
  br i1 %cmp4084, label %for.end42, label %for.body41

for.body41:                                       ; preds = %for.body36, %for.body41
  %add.ptr3986 = phi i8* [ %add.ptr39, %for.body41 ], [ %add.ptr3983, %for.body36 ]
  %i.185 = phi i8* [ %add.ptr3986, %for.body41 ], [ %incdec.ptr3489, %for.body36 ]
  %14 = load i8, i8* %add.ptr3986, align 1, !tbaa !1
  store i8 %14, i8* %i.185, align 1, !tbaa !1
  %15 = load i32, i32* @qsz, align 4, !tbaa !4
  %idx.neg38 = sub i32 0, %15
  %add.ptr39 = getelementptr inbounds i8, i8* %add.ptr3986, i32 %idx.neg38
  %cmp40 = icmp ult i8* %add.ptr39, %add.ptr29
  br i1 %cmp40, label %for.end42, label %for.body41

for.end42:                                        ; preds = %for.body41, %for.body36
  %i.1.lcssa = phi i8* [ %incdec.ptr3489, %for.body36 ], [ %add.ptr3986, %for.body41 ]
  store i8 %12, i8* %i.1.lcssa, align 1, !tbaa !1
  %incdec.ptr34 = getelementptr inbounds i8, i8* %incdec.ptr3489, i32 -1
  %cmp35 = icmp ult i8* %incdec.ptr34, %add.ptr2293
  br i1 %cmp35, label %for.cond21.backedge, label %for.body36

for.end45:                                        ; preds = %for.cond21.backedge, %for.cond21.preheader, %entry
  ret void
}

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #2

; Function Attrs: nounwind
define internal fastcc void @qst(i8* %base, i8* %max) #1 {
entry:
  %sub.ptr.lhs.cast = ptrtoint i8* %max to i32
  %sub.ptr.rhs.cast = ptrtoint i8* %base to i32
  %sub.ptr.sub = sub i32 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  br label %do.body

do.body:                                          ; preds = %do.cond79, %entry
  %max.addr.0 = phi i8* [ %max, %entry ], [ %max.addr.1, %do.cond79 ]
  %lo.0 = phi i32 [ %sub.ptr.sub, %entry ], [ %lo.1, %do.cond79 ]
  %base.addr.0 = phi i8* [ %base, %entry ], [ %base.addr.1, %do.cond79 ]
  %0 = load i32, i32* @qsz, align 4, !tbaa !4
  %div = sdiv i32 %lo.0, %0
  %shr = ashr i32 %div, 1
  %mul = mul nsw i32 %shr, %0
  %add.ptr = getelementptr inbounds i8, i8* %base.addr.0, i32 %mul
  %1 = load i32, i32* @mthresh, align 4, !tbaa !4
  %cmp = icmp slt i32 %lo.0, %1
  br i1 %cmp, label %if.end24, label %if.then

if.then:                                          ; preds = %do.body
  %2 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** bitcast (i32 (...)** @qcmp to i32 (i8*, i8*)**), align 4, !tbaa !6
  %call = tail call i32 %2(i8* %base.addr.0, i8* %add.ptr) #2
  %cmp3 = icmp sgt i32 %call, 0
  %cond = select i1 %cmp3, i8* %base.addr.0, i8* %add.ptr
  %3 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** bitcast (i32 (...)** @qcmp to i32 (i8*, i8*)**), align 4, !tbaa !6
  %4 = load i32, i32* @qsz, align 4, !tbaa !4
  %idx.neg = sub i32 0, %4
  %add.ptr4 = getelementptr inbounds i8, i8* %max.addr.0, i32 %idx.neg
  %call6 = tail call i32 %3(i8* %cond, i8* %add.ptr4) #2
  %cmp7 = icmp sgt i32 %call6, 0
  br i1 %cmp7, label %if.then8, label %if.end18

if.then8:                                         ; preds = %if.then
  %cmp9 = icmp eq i8* %cond, %base.addr.0
  %cond13 = select i1 %cmp9, i8* %add.ptr, i8* %base.addr.0
  %5 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** bitcast (i32 (...)** @qcmp to i32 (i8*, i8*)**), align 4, !tbaa !6
  %call15 = tail call i32 %5(i8* %cond13, i8* %add.ptr4) #2
  %cmp16 = icmp slt i32 %call15, 0
  %add.ptr4.cond13 = select i1 %cmp16, i8* %add.ptr4, i8* %cond13
  br label %if.end18

if.end18:                                         ; preds = %if.then8, %if.then
  %j.0 = phi i8* [ %cond, %if.then ], [ %add.ptr4.cond13, %if.then8 ]
  %cmp19 = icmp eq i8* %j.0, %add.ptr
  br i1 %cmp19, label %if.end24, label %if.then20

if.then20:                                        ; preds = %if.end18
  %6 = load i32, i32* @qsz, align 4, !tbaa !4
  br label %do.body21

do.body21:                                        ; preds = %do.body21, %if.then20
  %i.0 = phi i8* [ %add.ptr, %if.then20 ], [ %incdec.ptr, %do.body21 ]
  %j.1 = phi i8* [ %j.0, %if.then20 ], [ %incdec.ptr22, %do.body21 ]
  %ii.0 = phi i32 [ %6, %if.then20 ], [ %dec, %do.body21 ]
  %7 = load i8, i8* %i.0, align 1, !tbaa !1
  %8 = load i8, i8* %j.1, align 1, !tbaa !1
  %incdec.ptr = getelementptr inbounds i8, i8* %i.0, i32 1
  store i8 %8, i8* %i.0, align 1, !tbaa !1
  %incdec.ptr22 = getelementptr inbounds i8, i8* %j.1, i32 1
  store i8 %7, i8* %j.1, align 1, !tbaa !1
  %dec = add nsw i32 %ii.0, -1
  %tobool = icmp eq i32 %dec, 0
  br i1 %tobool, label %if.end24, label %do.body21

if.end24:                                         ; preds = %do.body21, %if.end18, %do.body
  %9 = load i32, i32* @qsz, align 4, !tbaa !4
  %idx.neg25 = sub i32 0, %9
  %add.ptr26 = getelementptr inbounds i8, i8* %max.addr.0, i32 %idx.neg25
  br label %while.cond.outer

while.cond.outer:                                 ; preds = %do.body55, %if.end24
  %i.1.ph = phi i8* [ %base.addr.0, %if.end24 ], [ %tmp.0, %do.body55 ]
  %j.2.ph = phi i8* [ %add.ptr26, %if.end24 ], [ %j.4, %do.body55 ]
  %mid.0.ph = phi i8* [ %add.ptr, %if.end24 ], [ %mid.1, %do.body55 ]
  %cmp27142 = icmp ult i8* %i.1.ph, %mid.0.ph
  br i1 %cmp27142, label %land.rhs, label %while.cond32.preheader

land.rhs:                                         ; preds = %while.cond.outer, %while.body
  %i.1143 = phi i8* [ %add.ptr31, %while.body ], [ %i.1.ph, %while.cond.outer ]
  %10 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** bitcast (i32 (...)** @qcmp to i32 (i8*, i8*)**), align 4, !tbaa !6
  %call29 = tail call i32 %10(i8* %i.1143, i8* %mid.0.ph) #2
  %cmp30 = icmp slt i32 %call29, 1
  br i1 %cmp30, label %while.body, label %while.cond32.preheader

while.cond32.preheader:                           ; preds = %land.rhs, %while.body, %while.cond.outer
  %i.1.lcssa = phi i8* [ %i.1.ph, %while.cond.outer ], [ %add.ptr31, %while.body ], [ %i.1143, %land.rhs ]
  %cmp33145 = icmp ugt i8* %j.2.ph, %mid.0.ph
  br i1 %cmp33145, label %while.body34, label %while.end48

while.body:                                       ; preds = %land.rhs
  %11 = load i32, i32* @qsz, align 4, !tbaa !4
  %add.ptr31 = getelementptr inbounds i8, i8* %i.1143, i32 %11
  %cmp27 = icmp ult i8* %add.ptr31, %mid.0.ph
  br i1 %cmp27, label %land.rhs, label %while.cond32.preheader

while.body34:                                     ; preds = %while.cond32.preheader, %if.then38
  %j.3146 = phi i8* [ %add.ptr40, %if.then38 ], [ %j.2.ph, %while.cond32.preheader ]
  %12 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** bitcast (i32 (...)** @qcmp to i32 (i8*, i8*)**), align 4, !tbaa !6
  %call36 = tail call i32 %12(i8* %mid.0.ph, i8* %j.3146) #2
  %cmp37 = icmp slt i32 %call36, 1
  %13 = load i32, i32* @qsz, align 4, !tbaa !4
  br i1 %cmp37, label %if.then38, label %if.end41

if.then38:                                        ; preds = %while.body34
  %idx.neg39 = sub i32 0, %13
  %add.ptr40 = getelementptr inbounds i8, i8* %j.3146, i32 %idx.neg39
  %cmp33 = icmp ugt i8* %add.ptr40, %mid.0.ph
  br i1 %cmp33, label %while.body34, label %while.end48

if.end41:                                         ; preds = %while.body34
  %add.ptr42 = getelementptr inbounds i8, i8* %i.1.lcssa, i32 %13
  %cmp43 = icmp eq i8* %i.1.lcssa, %mid.0.ph
  br i1 %cmp43, label %swap, label %if.else

if.else:                                          ; preds = %if.end41
  %idx.neg45 = sub i32 0, %13
  %add.ptr46 = getelementptr inbounds i8, i8* %j.3146, i32 %idx.neg45
  br label %swap

while.end48:                                      ; preds = %if.then38, %while.cond32.preheader
  %j.3.lcssa = phi i8* [ %j.2.ph, %while.cond32.preheader ], [ %add.ptr40, %if.then38 ]
  %cmp49 = icmp eq i8* %i.1.lcssa, %mid.0.ph
  %14 = load i32, i32* @qsz, align 4, !tbaa !4
  br i1 %cmp49, label %for.end, label %if.else51

if.else51:                                        ; preds = %while.end48
  %idx.neg52 = sub i32 0, %14
  %add.ptr53 = getelementptr inbounds i8, i8* %j.3.lcssa, i32 %idx.neg52
  br label %swap

swap:                                             ; preds = %if.end41, %if.else, %if.else51
  %j.4 = phi i8* [ %add.ptr46, %if.else ], [ %add.ptr53, %if.else51 ], [ %j.3146, %if.end41 ]
  %jj.0 = phi i8* [ %j.3146, %if.else ], [ %mid.0.ph, %if.else51 ], [ %j.3146, %if.end41 ]
  %mid.1 = phi i8* [ %mid.0.ph, %if.else ], [ %i.1.lcssa, %if.else51 ], [ %j.3146, %if.end41 ]
  %tmp.0 = phi i8* [ %add.ptr42, %if.else ], [ %i.1.lcssa, %if.else51 ], [ %add.ptr42, %if.end41 ]
  %15 = load i32, i32* @qsz, align 4, !tbaa !4
  br label %do.body55

do.body55:                                        ; preds = %do.body55, %swap
  %i.2 = phi i8* [ %i.1.lcssa, %swap ], [ %incdec.ptr56, %do.body55 ]
  %jj.1 = phi i8* [ %jj.0, %swap ], [ %incdec.ptr57, %do.body55 ]
  %ii.1 = phi i32 [ %15, %swap ], [ %dec59, %do.body55 ]
  %16 = load i8, i8* %i.2, align 1, !tbaa !1
  %17 = load i8, i8* %jj.1, align 1, !tbaa !1
  %incdec.ptr56 = getelementptr inbounds i8, i8* %i.2, i32 1
  store i8 %17, i8* %i.2, align 1, !tbaa !1
  %incdec.ptr57 = getelementptr inbounds i8, i8* %jj.1, i32 1
  store i8 %16, i8* %jj.1, align 1, !tbaa !1
  %dec59 = add nsw i32 %ii.1, -1
  %tobool60 = icmp eq i32 %dec59, 0
  br i1 %tobool60, label %while.cond.outer, label %do.body55

for.end:                                          ; preds = %while.end48
  %add.ptr62 = getelementptr inbounds i8, i8* %mid.0.ph, i32 %14
  %sub.ptr.lhs.cast63 = ptrtoint i8* %mid.0.ph to i32
  %sub.ptr.rhs.cast64 = ptrtoint i8* %base.addr.0 to i32
  %sub.ptr.sub65 = sub i32 %sub.ptr.lhs.cast63, %sub.ptr.rhs.cast64
  %sub.ptr.lhs.cast66 = ptrtoint i8* %max.addr.0 to i32
  %sub.ptr.rhs.cast67 = ptrtoint i8* %add.ptr62 to i32
  %sub.ptr.sub68 = sub i32 %sub.ptr.lhs.cast66, %sub.ptr.rhs.cast67
  %cmp69 = icmp sgt i32 %sub.ptr.sub65, %sub.ptr.sub68
  %18 = load i32, i32* @thresh, align 4, !tbaa !4
  br i1 %cmp69, label %if.else74, label %if.then70

if.then70:                                        ; preds = %for.end
  %cmp71 = icmp slt i32 %sub.ptr.sub65, %18
  br i1 %cmp71, label %do.cond79, label %if.then72

if.then72:                                        ; preds = %if.then70
  tail call fastcc void @qst(i8* %base.addr.0, i8* %mid.0.ph)
  br label %do.cond79

if.else74:                                        ; preds = %for.end
  %cmp75 = icmp slt i32 %sub.ptr.sub68, %18
  br i1 %cmp75, label %do.cond79, label %if.then76

if.then76:                                        ; preds = %if.else74
  tail call fastcc void @qst(i8* %add.ptr62, i8* %max.addr.0)
  br label %do.cond79

do.cond79:                                        ; preds = %if.then76, %if.else74, %if.then72, %if.then70
  %max.addr.1 = phi i8* [ %max.addr.0, %if.then70 ], [ %max.addr.0, %if.then72 ], [ %mid.0.ph, %if.else74 ], [ %mid.0.ph, %if.then76 ]
  %lo.1 = phi i32 [ %sub.ptr.sub68, %if.then70 ], [ %sub.ptr.sub68, %if.then72 ], [ %sub.ptr.sub65, %if.else74 ], [ %sub.ptr.sub65, %if.then76 ]
  %base.addr.1 = phi i8* [ %add.ptr62, %if.then70 ], [ %add.ptr62, %if.then72 ], [ %base.addr.0, %if.else74 ], [ %base.addr.0, %if.then76 ]
  %19 = load i32, i32* @thresh, align 4, !tbaa !4
  %cmp80 = icmp slt i32 %lo.1, %19
  br i1 %cmp80, label %do.end81, label %do.body

do.end81:                                         ; preds = %do.cond79
  ret void
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

attributes #0 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !2, i64 0}
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !2, i64 0}
