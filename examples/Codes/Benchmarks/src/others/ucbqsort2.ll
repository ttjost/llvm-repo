; ModuleID = 'ucbqsort.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@gQSortNum = global [1000 x i8] c"9~\DF,\0B\8A\FB\E8\8FV\D7<S\1Es0W.1\A4e\C6\EBH\1F\069\0C\E3n\9D`\19\22\BF\8C+\16%\88\AF\B6\B7\DCsB\AD\90\89rQDEf\CB\A8\C1f\A7\AC\03\0EC@\F9>\9F\14KJ\BB\D8\CF\16\97|m\A23\10\97\12\8F\1C%\FA\AB\08_:\87L\DDR\DD\E0\D9\9E\7FLk\AA\9B\C8\EF\8Aw\E4M\02\ED\B0\B7\B2o\84\05\A6\8Bh\81\DAg\14\BDN\03\80\B9\02_\AC\8B\0A{h\F1\D6\A9\BC\D3b\0DP)R\B1\DC\E5\BA\95\C8\9F\86Gtc\12\1D\E0g\A2\C1\0C\AB\96\A5\F8\D1\CA\C9\5C\0D>\D3\10\F7\0E\D1<;\1A\B5(\BF\E6',}r\C3@\87\BE\E1\945\CA\C5\A8Oj\17\04\13\22M\90\17\92\F1\9C[z+\88\DFF\F94\A3.]`Y\1E\FF4\15\D6\E5Ho\0A\09\9C\CD~\93072\EF\FC\85&\0B\E8\01\A6\19l=\CE}\00\C7~\DF,\0Bv\FB\18q\AA\D7<S\1Es0\A9\D21\5Ce:\15\B8\E1\06\C7\F4\E3\92c`\19\DEA\8C\D5\16\DB\88\AF\B6I$\8D\BESp\89r\AF\BC\BBf5\A8\C1\9A\A7\AC\03\F2C@\07>\9F\ECK\B6\BB(1\EAi|m\A2\CD\10i\EE\8F\1C%\06U\F8\A1:y\B4\DD\AE\DD \D9b\81L\95\AAe\C8\EFv\89\1C\B3\FE\13P\B7\B2\91|\FB\A6\8B\98\81&\99\14\BDN\03\80G\FE_T\8B\0A{\98\F1\D6\A9D\D3b\0DP\D7RO$\E5F\958\9F\86\B9\8Cc\12\1D\E0\99^?\F4U\96[\F8\D1\CA7\5C\F3\C2\D3\F0\F7\F2\D1\C4\C5\1AK(\BF\1A',\83\8E\C3@y\BE\E1\9456\C5XOj\E9\FC\13\22M\90\E9\92\F1d[\86+\88!F\F9\CC\A3\D2\A3`Y\E2\014\EB\D6\1BHo\F6\F7\9C3\82m\D072\11\FC{\DA\F5\E8\FFZ\E7l\C32}\00\C7\82\DF\D4\0B\8A\FB\E8\8FV\D7\C4S\1E\8D0W.\CF\5C\9B:\EB\B8\1F\06\C7\0C\1D\92\9D\A0\E7\22\BFt\D5\16%\88\AFJ\B7$sB\AD\90\89\8E\AF\BCEf5\A8\C1fY\AC\FD\F2C\C0\07>\9F\14\B5\B6\BB\D8\CF\16i\84m\A2\CD\10\97\12q\E4%\06U\08\A1:\87L#\AE#\E0'\9E\7F\B4\95V\9B\C8\EFvw\1CM\FE\13\B0\B7N\91\84\05Zu\98\7F\DA\99\14C\B2\03\80\B9\FE_\AC\8B\F6{h\0F*\A9D\D3b\F3P)\AEO$\1B\BAk8a\86Gt\9D\EE\E3 \99\A2\C1\F4\AB\96\A5\F8\D167\A4\0D\C2-\10\F7\F2/<;\1AK(A\E6\D9,\83\8E\C3\C0y\BE\E1l\CB\CA\C5\A8\B1\96\E9\FC\13\22M\90\17n\0Fd[z\D5x\DFF\074].]\A0\A7\E2\FF\CC\15*\E5Ho\F6\09d\CD~\9307\CE\EF\04\85\DA\F5\E8\FF\A6\E7l\C32\83\009\82\DF,\F5v\FB\E8qV\D7\C4S\1E\8D0W.\CF\5C\9B\C6\EBH\1F\FA9\F4\1Dnc\A0\E7\22At+\16\DB\88\AFJI\DC\8D\BESp\89\8EQDE\9A\CBX?\9AY\AC\03\F2C\C0\F9>\9F\14\B5JE\D81\16i\84m\A2\CD\10\97\12q\E4\DB\FA\AB\08_:\87\B4#R\DD\E0'b\81\B4kVe\C8\EFvw\E4\B3\02\EDP\B7No|\05Zuh\7F&\99\14C\B2\FD\80\B9\FE_\ACu\0A{\98\F1*W\BC\D3b\F3P\D7RO$\1B\BAk\C8\9FzG\8C\9D\EE\1D\E0\99^?\F4Uj[\F8/6\C9\A4\F3>\D3\F0\F7\F2/\C4\C5\E6\B5\D8A\1A\D9,}r\C3\C0\87\BE\1F\94\CB\CA;XO\96\E9\FC\13\22M\90\E9\92\0Fd\A5z\D5\88\DFF\F9\CC].]`\A7\1E\01\CC\15*\1BH", align 1
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
  %.pre = load i8, i8* %0, align 1, !tbaa !1
  br label %for.body

for.cond:                                         ; preds = %for.body
  %cmp = icmp slt i32 %inc, 1000
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %entry, %for.cond
  %1 = phi i8 [ %.pre, %entry ], [ %2, %for.cond ]
  %j.010 = phi i32 [ 1, %entry ], [ %inc, %for.cond ]
  %arrayidx = getelementptr inbounds [1000 x i8], [1000 x i8]* %SortArr, i32 0, i32 %j.010
  %2 = load i8, i8* %arrayidx, align 1, !tbaa !1
  %cmp3 = icmp ult i8 %2, %1
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
  %base120 = ptrtoint i8* %base to i32
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
  %.pre = load i32, i32* @qsz, align 4, !tbaa !4
  br label %if.end6

if.end6:                                          ; preds = %if.end, %if.then4
  %1 = phi i32 [ %.pre, %if.then4 ], [ %size, %if.end ]
  %hi.0 = phi i8* [ %add.ptr5, %if.then4 ], [ %add.ptr, %if.end ]
  %add.ptr797 = getelementptr inbounds i8, i8* %base, i32 %1
  %cmp898 = icmp ult i8* %add.ptr797, %hi.0
  br i1 %cmp898, label %for.body.preheader, label %for.cond21.preheader

for.body.preheader:                               ; preds = %if.end6
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.body
  %add.ptr7100 = phi i8* [ %add.ptr7, %for.body ], [ %add.ptr797, %for.body.preheader ]
  %j.099 = phi i8* [ %add.ptr7.j.0, %for.body ], [ %base, %for.body.preheader ]
  %2 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** bitcast (i32 (...)** @qcmp to i32 (i8*, i8*)**), align 4, !tbaa !6
  %call = tail call i32 %2(i8* %j.099, i8* %add.ptr7100) #2
  %cmp9 = icmp sgt i32 %call, 0
  %add.ptr7.j.0 = select i1 %cmp9, i8* %add.ptr7100, i8* %j.099
  %3 = load i32, i32* @qsz, align 4, !tbaa !4
  %add.ptr7 = getelementptr inbounds i8, i8* %add.ptr7100, i32 %3
  %cmp8 = icmp ult i8* %add.ptr7, %hi.0
  br i1 %cmp8, label %for.body, label %for.end

for.end:                                          ; preds = %for.body
  %.lcssa215 = phi i32 [ %3, %for.body ]
  %add.ptr7.j.0.lcssa = phi i8* [ %add.ptr7.j.0, %for.body ]
  %cmp12 = icmp eq i8* %add.ptr7.j.0.lcssa, %base
  br i1 %cmp12, label %for.cond21.preheader, label %if.then13

if.then13:                                        ; preds = %for.end
  %add.ptr14 = getelementptr inbounds i8, i8* %base, i32 %.lcssa215
  %cmp1694 = icmp sgt i32 %.lcssa215, 0
  br i1 %cmp1694, label %for.body17.preheader, label %for.cond21.preheader

for.body17.preheader:                             ; preds = %if.then13
  %scevgep = getelementptr i8, i8* %base, i32 %.lcssa215
  %scevgep119 = getelementptr i8, i8* %base, i32 1
  %4 = icmp ugt i8* %scevgep, %scevgep119
  %umax = select i1 %4, i8* %scevgep, i8* %scevgep119
  %5 = xor i32 %base120, -1
  %scevgep121 = getelementptr i8, i8* %umax, i32 %5
  %backedge.overflow = icmp eq i8* %scevgep121, inttoptr (i32 -1 to i8*)
  br i1 %backedge.overflow, label %for.body17.preheader213, label %overflow.checked

for.body17.preheader213:                          ; preds = %middle.block, %for.body17.preheader
  %j.196.ph = phi i8* [ %add.ptr7.j.0.lcssa, %for.body17.preheader ], [ %resume.val, %middle.block ]
  %i.095.ph = phi i8* [ %base, %for.body17.preheader ], [ %resume.val130, %middle.block ]
  br label %for.body17

overflow.checked:                                 ; preds = %for.body17.preheader
  %6 = ptrtoint i8* %umax to i32
  %7 = sub i32 %6, %base120
  %n.vec = and i32 %7, -16
  %cmp.zero = icmp eq i32 %n.vec, 0
  %scevgep123 = getelementptr i8, i8* %base, i32 %.lcssa215
  %scevgep124 = getelementptr i8, i8* %base, i32 1
  %8 = icmp ugt i8* %scevgep123, %scevgep124
  %umax125 = select i1 %8, i8* %scevgep123, i8* %scevgep124
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %overflow.checked
  %scevgep129 = getelementptr i8, i8* %umax125, i32 -1
  %9 = xor i32 %base120, -1
  %scevgep126 = getelementptr i8, i8* %umax125, i32 %9
  %scevgep126127 = ptrtoint i8* %scevgep126 to i32
  %scevgep128 = getelementptr i8, i8* %add.ptr7.j.0.lcssa, i32 %scevgep126127
  %bound0 = icmp ule i8* %add.ptr7.j.0.lcssa, %scevgep129
  %bound1 = icmp uge i8* %scevgep128, %base
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8, i8* %add.ptr7.j.0.lcssa, i32 %n.vec
  %ptr.ind.end132 = getelementptr i8, i8* %base, i32 %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i32 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %next.gep = getelementptr i8, i8* %add.ptr7.j.0.lcssa, i32 %index
  %next.gep164 = getelementptr i8, i8* %base, i32 %index
  %10 = bitcast i8* %next.gep to <16 x i8>*
  %wide.load = load <16 x i8>, <16 x i8>* %10, align 1, !tbaa !1
  %11 = bitcast i8* %next.gep164 to <16 x i8>*
  %wide.load196 = load <16 x i8>, <16 x i8>* %11, align 1, !tbaa !1
  %12 = bitcast i8* %next.gep to <16 x i8>*
  store <16 x i8> %wide.load196, <16 x i8>* %12, align 1, !tbaa !1
  %13 = bitcast i8* %next.gep164 to <16 x i8>*
  store <16 x i8> %wide.load, <16 x i8>* %13, align 1, !tbaa !1
  %index.next = add i32 %index, 16
  %14 = icmp eq i32 %index.next, %n.vec
  br i1 %14, label %middle.block.loopexit, label %vector.body, !llvm.loop !8

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.memcheck, %overflow.checked
  %resume.val = phi i8* [ %add.ptr7.j.0.lcssa, %overflow.checked ], [ %add.ptr7.j.0.lcssa, %vector.memcheck ], [ %ptr.ind.end, %middle.block.loopexit ]
  %resume.val130 = phi i8* [ %base, %overflow.checked ], [ %base, %vector.memcheck ], [ %ptr.ind.end132, %middle.block.loopexit ]
  %new.indc.resume.val = phi i32 [ 0, %overflow.checked ], [ 0, %vector.memcheck ], [ %n.vec, %middle.block.loopexit ]
  %cmp.n = icmp eq i32 %7, %new.indc.resume.val
  br i1 %cmp.n, label %for.cond15.for.cond21.preheader.loopexit_crit_edge, label %for.body17.preheader213

for.cond15.for.cond21.preheader.loopexit_crit_edge.loopexit: ; preds = %for.body17
  br label %for.cond15.for.cond21.preheader.loopexit_crit_edge

for.cond15.for.cond21.preheader.loopexit_crit_edge: ; preds = %for.cond15.for.cond21.preheader.loopexit_crit_edge.loopexit, %middle.block
  %.pre104.pre = load i32, i32* @qsz, align 4, !tbaa !4
  br label %for.cond21.preheader

for.cond21.preheader:                             ; preds = %if.end6, %if.then13, %for.cond15.for.cond21.preheader.loopexit_crit_edge, %for.end
  %15 = phi i32 [ %.lcssa215, %for.end ], [ %.pre104.pre, %for.cond15.for.cond21.preheader.loopexit_crit_edge ], [ %.lcssa215, %if.then13 ], [ %1, %if.end6 ]
  %cmp2391 = icmp slt i32 %15, %mul2
  br i1 %cmp2391, label %while.cond.preheader.lr.ph, label %for.end45

while.cond.preheader.lr.ph:                       ; preds = %for.cond21.preheader
  %add.ptr2290 = getelementptr inbounds i8, i8* %base, i32 %15
  br label %while.cond.preheader

for.body17:                                       ; preds = %for.body17.preheader213, %for.body17
  %j.196 = phi i8* [ %incdec.ptr, %for.body17 ], [ %j.196.ph, %for.body17.preheader213 ]
  %i.095 = phi i8* [ %incdec.ptr18, %for.body17 ], [ %i.095.ph, %for.body17.preheader213 ]
  %16 = load i8, i8* %j.196, align 1, !tbaa !1
  %17 = load i8, i8* %i.095, align 1, !tbaa !1
  %incdec.ptr = getelementptr inbounds i8, i8* %j.196, i32 1
  store i8 %17, i8* %j.196, align 1, !tbaa !1
  %incdec.ptr18 = getelementptr inbounds i8, i8* %i.095, i32 1
  store i8 %16, i8* %i.095, align 1, !tbaa !1
  %cmp16 = icmp ult i8* %incdec.ptr18, %add.ptr14
  br i1 %cmp16, label %for.body17, label %for.cond15.for.cond21.preheader.loopexit_crit_edge.loopexit, !llvm.loop !11

while.cond.preheader:                             ; preds = %while.cond.preheader.lr.ph, %for.cond21.backedge
  %add.ptr2293 = phi i8* [ %add.ptr2290, %while.cond.preheader.lr.ph ], [ %add.ptr22, %for.cond21.backedge ]
  %18 = phi i32 [ %15, %while.cond.preheader.lr.ph ], [ %22, %for.cond21.backedge ]
  %min.092 = phi i8* [ %base, %while.cond.preheader.lr.ph ], [ %add.ptr2293, %for.cond21.backedge ]
  %19 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** bitcast (i32 (...)** @qcmp to i32 (i8*, i8*)**), align 4, !tbaa !6
  %idx.neg113 = sub i32 0, %18
  %add.ptr25114 = getelementptr inbounds i8, i8* %add.ptr2293, i32 %idx.neg113
  %call27115 = tail call i32 %19(i8* %add.ptr25114, i8* %add.ptr2293) #2
  %cmp28116 = icmp sgt i32 %call27115, 0
  br i1 %cmp28116, label %while.cond.while.cond_crit_edge.preheader, label %while.end

while.cond.while.cond_crit_edge.preheader:        ; preds = %while.cond.preheader
  br label %while.cond.while.cond_crit_edge

while.cond.while.cond_crit_edge:                  ; preds = %while.cond.while.cond_crit_edge.preheader, %while.cond.while.cond_crit_edge
  %add.ptr25117 = phi i8* [ %add.ptr25, %while.cond.while.cond_crit_edge ], [ %add.ptr25114, %while.cond.while.cond_crit_edge.preheader ]
  %.pre105 = load i32, i32* @qsz, align 4, !tbaa !4
  %20 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** bitcast (i32 (...)** @qcmp to i32 (i8*, i8*)**), align 4, !tbaa !6
  %idx.neg = sub i32 0, %.pre105
  %add.ptr25 = getelementptr inbounds i8, i8* %add.ptr25117, i32 %idx.neg
  %call27 = tail call i32 %20(i8* %add.ptr25, i8* %add.ptr2293) #2
  %cmp28 = icmp sgt i32 %call27, 0
  br i1 %cmp28, label %while.cond.while.cond_crit_edge, label %while.end.loopexit

while.end.loopexit:                               ; preds = %while.cond.while.cond_crit_edge
  %.pre105.lcssa = phi i32 [ %.pre105, %while.cond.while.cond_crit_edge ]
  %add.ptr25117.lcssa = phi i8* [ %add.ptr25117, %while.cond.while.cond_crit_edge ]
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %while.cond.preheader
  %hi.1.lcssa = phi i8* [ %add.ptr2293, %while.cond.preheader ], [ %add.ptr25117.lcssa, %while.end.loopexit ]
  %.lcssa = phi i32 [ %18, %while.cond.preheader ], [ %.pre105.lcssa, %while.end.loopexit ]
  %21 = load i32, i32* @qsz, align 4, !tbaa !4
  %add.ptr25.sum = sub i32 %21, %.lcssa
  %add.ptr29 = getelementptr inbounds i8, i8* %hi.1.lcssa, i32 %add.ptr25.sum
  %cmp30 = icmp eq i8* %add.ptr29, %add.ptr2293
  br i1 %cmp30, label %for.cond21.backedge, label %if.then31

for.cond21.backedge.loopexit:                     ; preds = %for.end42
  %.pre107.pre.lcssa = phi i32 [ %.pre107.pre, %for.end42 ]
  br label %for.cond21.backedge

for.cond21.backedge:                              ; preds = %for.cond21.backedge.loopexit, %if.then31, %while.end
  %22 = phi i32 [ %21, %while.end ], [ %21, %if.then31 ], [ %.pre107.pre.lcssa, %for.cond21.backedge.loopexit ]
  %add.ptr22 = getelementptr inbounds i8, i8* %add.ptr2293, i32 %22
  %cmp23 = icmp ult i8* %add.ptr22, %add.ptr
  br i1 %cmp23, label %while.cond.preheader, label %for.end45.loopexit

if.then31:                                        ; preds = %while.end
  %add.ptr22.sum = add i32 %21, %18
  %add.ptr32.sum = add i32 %add.ptr22.sum, -1
  %incdec.ptr3487 = getelementptr inbounds i8, i8* %min.092, i32 %add.ptr32.sum
  %cmp3588 = icmp ult i8* %incdec.ptr3487, %add.ptr2293
  br i1 %cmp3588, label %for.cond21.backedge, label %for.body36.preheader

for.body36.preheader:                             ; preds = %if.then31
  br label %for.body36

for.body36:                                       ; preds = %for.body36.preheader, %for.end42
  %23 = phi i32 [ %.pre107.pre, %for.end42 ], [ %21, %for.body36.preheader ]
  %incdec.ptr3489 = phi i8* [ %incdec.ptr34, %for.end42 ], [ %incdec.ptr3487, %for.body36.preheader ]
  %24 = load i8, i8* %incdec.ptr3489, align 1, !tbaa !1
  %idx.neg3882 = sub i32 0, %23
  %add.ptr3983 = getelementptr inbounds i8, i8* %incdec.ptr3489, i32 %idx.neg3882
  %cmp4084 = icmp ult i8* %add.ptr3983, %add.ptr29
  br i1 %cmp4084, label %for.end42, label %for.body41.preheader

for.body41.preheader:                             ; preds = %for.body36
  br label %for.body41

for.body41:                                       ; preds = %for.body41.preheader, %for.body41
  %add.ptr3986 = phi i8* [ %add.ptr39, %for.body41 ], [ %add.ptr3983, %for.body41.preheader ]
  %i.185 = phi i8* [ %add.ptr3986, %for.body41 ], [ %incdec.ptr3489, %for.body41.preheader ]
  %25 = load i8, i8* %add.ptr3986, align 1, !tbaa !1
  store i8 %25, i8* %i.185, align 1, !tbaa !1
  %26 = load i32, i32* @qsz, align 4, !tbaa !4
  %idx.neg38 = sub i32 0, %26
  %add.ptr39 = getelementptr inbounds i8, i8* %add.ptr3986, i32 %idx.neg38
  %cmp40 = icmp ult i8* %add.ptr39, %add.ptr29
  br i1 %cmp40, label %for.end42.loopexit, label %for.body41

for.end42.loopexit:                               ; preds = %for.body41
  %add.ptr3986.lcssa = phi i8* [ %add.ptr3986, %for.body41 ]
  br label %for.end42

for.end42:                                        ; preds = %for.end42.loopexit, %for.body36
  %i.1.lcssa = phi i8* [ %incdec.ptr3489, %for.body36 ], [ %add.ptr3986.lcssa, %for.end42.loopexit ]
  store i8 %24, i8* %i.1.lcssa, align 1, !tbaa !1
  %incdec.ptr34 = getelementptr inbounds i8, i8* %incdec.ptr3489, i32 -1
  %cmp35 = icmp ult i8* %incdec.ptr34, %add.ptr2293
  %.pre107.pre = load i32, i32* @qsz, align 4, !tbaa !4
  br i1 %cmp35, label %for.cond21.backedge.loopexit, label %for.body36

for.end45.loopexit:                               ; preds = %for.cond21.backedge
  br label %for.end45

for.end45:                                        ; preds = %for.end45.loopexit, %for.cond21.preheader, %entry
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
  %backedge.overflow231 = icmp eq i32 %6, 0
  br i1 %backedge.overflow231, label %do.body21.preheader, label %overflow.checked243

overflow.checked243:                              ; preds = %if.then20
  %n.vec240 = and i32 %6, -16
  %cmp.zero242 = icmp eq i32 %n.vec240, 0
  %7 = mul i32 %0, %shr
  br i1 %cmp.zero242, label %middle.block235, label %vector.memcheck253

vector.memcheck253:                               ; preds = %overflow.checked243
  %scevgep247.sum = add i32 %6, -1
  %scevgep248 = getelementptr i8, i8* %j.0, i32 %scevgep247.sum
  %8 = add i32 %6, %7
  %scevgep245.sum = add i32 %8, -1
  %scevgep246 = getelementptr i8, i8* %base.addr.0, i32 %scevgep245.sum
  %scevgep244 = getelementptr i8, i8* %base.addr.0, i32 %7
  %bound0249 = icmp ule i8* %scevgep244, %scevgep248
  %bound1250 = icmp ule i8* %j.0, %scevgep246
  %memcheck.conflict252 = and i1 %bound0249, %bound1250
  %add.ptr.sum = add i32 %mul, %n.vec240
  %ptr.ind.end256 = getelementptr i8, i8* %base.addr.0, i32 %add.ptr.sum
  %ptr.ind.end259 = getelementptr i8, i8* %j.0, i32 %n.vec240
  %ind.end262 = sub i32 %6, %n.vec240
  br i1 %memcheck.conflict252, label %middle.block235, label %vector.body234.preheader

vector.body234.preheader:                         ; preds = %vector.memcheck253
  br label %vector.body234

vector.body234:                                   ; preds = %vector.body234.preheader, %vector.body234
  %index237 = phi i32 [ %index.next265, %vector.body234 ], [ 0, %vector.body234.preheader ]
  %add.ptr.sum339 = add i32 %mul, %index237
  %next.gep267 = getelementptr i8, i8* %base.addr.0, i32 %add.ptr.sum339
  %next.gep300 = getelementptr i8, i8* %j.0, i32 %index237
  %9 = bitcast i8* %next.gep267 to <16 x i8>*
  %wide.load337 = load <16 x i8>, <16 x i8>* %9, align 1, !tbaa !1
  %10 = bitcast i8* %next.gep300 to <16 x i8>*
  %wide.load338 = load <16 x i8>, <16 x i8>* %10, align 1, !tbaa !1
  %11 = bitcast i8* %next.gep267 to <16 x i8>*
  store <16 x i8> %wide.load338, <16 x i8>* %11, align 1, !tbaa !1
  %12 = bitcast i8* %next.gep300 to <16 x i8>*
  store <16 x i8> %wide.load337, <16 x i8>* %12, align 1, !tbaa !1
  %index.next265 = add i32 %index237, 16
  %13 = icmp eq i32 %index.next265, %n.vec240
  br i1 %13, label %middle.block235.loopexit, label %vector.body234, !llvm.loop !12

middle.block235.loopexit:                         ; preds = %vector.body234
  br label %middle.block235

middle.block235:                                  ; preds = %middle.block235.loopexit, %vector.memcheck253, %overflow.checked243
  %resume.val254 = phi i8* [ %add.ptr, %overflow.checked243 ], [ %add.ptr, %vector.memcheck253 ], [ %ptr.ind.end256, %middle.block235.loopexit ]
  %resume.val257 = phi i8* [ %j.0, %overflow.checked243 ], [ %j.0, %vector.memcheck253 ], [ %ptr.ind.end259, %middle.block235.loopexit ]
  %resume.val260 = phi i32 [ %6, %overflow.checked243 ], [ %6, %vector.memcheck253 ], [ %ind.end262, %middle.block235.loopexit ]
  %new.indc.resume.val263 = phi i32 [ 0, %overflow.checked243 ], [ 0, %vector.memcheck253 ], [ %n.vec240, %middle.block235.loopexit ]
  %cmp.n264 = icmp eq i32 %6, %new.indc.resume.val263
  br i1 %cmp.n264, label %if.end24, label %do.body21.preheader

do.body21.preheader:                              ; preds = %middle.block235, %if.then20
  %i.0.ph = phi i8* [ %add.ptr, %if.then20 ], [ %resume.val254, %middle.block235 ]
  %j.1.ph = phi i8* [ %j.0, %if.then20 ], [ %resume.val257, %middle.block235 ]
  %ii.0.ph = phi i32 [ %6, %if.then20 ], [ %resume.val260, %middle.block235 ]
  br label %do.body21

do.body21:                                        ; preds = %do.body21.preheader, %do.body21
  %i.0 = phi i8* [ %incdec.ptr, %do.body21 ], [ %i.0.ph, %do.body21.preheader ]
  %j.1 = phi i8* [ %incdec.ptr22, %do.body21 ], [ %j.1.ph, %do.body21.preheader ]
  %ii.0 = phi i32 [ %dec, %do.body21 ], [ %ii.0.ph, %do.body21.preheader ]
  %14 = load i8, i8* %i.0, align 1, !tbaa !1
  %15 = load i8, i8* %j.1, align 1, !tbaa !1
  %incdec.ptr = getelementptr inbounds i8, i8* %i.0, i32 1
  store i8 %15, i8* %i.0, align 1, !tbaa !1
  %incdec.ptr22 = getelementptr inbounds i8, i8* %j.1, i32 1
  store i8 %14, i8* %j.1, align 1, !tbaa !1
  %dec = add nsw i32 %ii.0, -1
  %tobool = icmp eq i32 %dec, 0
  br i1 %tobool, label %if.end24.loopexit, label %do.body21, !llvm.loop !13

if.end24.loopexit:                                ; preds = %do.body21
  br label %if.end24

if.end24:                                         ; preds = %if.end24.loopexit, %middle.block235, %if.end18, %do.body
  %16 = load i32, i32* @qsz, align 4, !tbaa !4
  %idx.neg25 = sub i32 0, %16
  %add.ptr26 = getelementptr inbounds i8, i8* %max.addr.0, i32 %idx.neg25
  br label %while.cond.outer

while.cond.outer.loopexit:                        ; preds = %do.body55
  br label %while.cond.outer.backedge

while.cond.outer:                                 ; preds = %while.cond.outer.backedge, %if.end24
  %i.1.ph = phi i8* [ %base.addr.0, %if.end24 ], [ %tmp.0, %while.cond.outer.backedge ]
  %j.2.ph = phi i8* [ %add.ptr26, %if.end24 ], [ %j.4, %while.cond.outer.backedge ]
  %mid.0.ph = phi i8* [ %add.ptr, %if.end24 ], [ %mid.1, %while.cond.outer.backedge ]
  %cmp27142 = icmp ult i8* %i.1.ph, %mid.0.ph
  br i1 %cmp27142, label %land.rhs.preheader, label %while.cond32.preheader

land.rhs.preheader:                               ; preds = %while.cond.outer
  br label %land.rhs

land.rhs:                                         ; preds = %land.rhs.preheader, %while.body
  %i.1143 = phi i8* [ %add.ptr31, %while.body ], [ %i.1.ph, %land.rhs.preheader ]
  %17 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** bitcast (i32 (...)** @qcmp to i32 (i8*, i8*)**), align 4, !tbaa !6
  %call29 = tail call i32 %17(i8* %i.1143, i8* %mid.0.ph) #2
  %cmp30 = icmp slt i32 %call29, 1
  br i1 %cmp30, label %while.body, label %while.cond32.preheader.loopexit

while.cond32.preheader.loopexit:                  ; preds = %while.body, %land.rhs
  %i.1.lcssa.ph = phi i8* [ %i.1143, %land.rhs ], [ %add.ptr31, %while.body ]
  br label %while.cond32.preheader

while.cond32.preheader:                           ; preds = %while.cond32.preheader.loopexit, %while.cond.outer
  %i.1.lcssa = phi i8* [ %i.1.ph, %while.cond.outer ], [ %i.1.lcssa.ph, %while.cond32.preheader.loopexit ]
  %cmp33145 = icmp ugt i8* %j.2.ph, %mid.0.ph
  br i1 %cmp33145, label %while.body34.preheader, label %while.cond32.preheader.while.end48_crit_edge

while.body34.preheader:                           ; preds = %while.cond32.preheader
  br label %while.body34

while.cond32.preheader.while.end48_crit_edge:     ; preds = %while.cond32.preheader
  %.pre = load i32, i32* @qsz, align 4, !tbaa !4
  br label %while.end48

while.body:                                       ; preds = %land.rhs
  %18 = load i32, i32* @qsz, align 4, !tbaa !4
  %add.ptr31 = getelementptr inbounds i8, i8* %i.1143, i32 %18
  %cmp27 = icmp ult i8* %add.ptr31, %mid.0.ph
  br i1 %cmp27, label %land.rhs, label %while.cond32.preheader.loopexit

while.body34:                                     ; preds = %while.body34.preheader, %if.then38
  %j.3146 = phi i8* [ %add.ptr40, %if.then38 ], [ %j.2.ph, %while.body34.preheader ]
  %19 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** bitcast (i32 (...)** @qcmp to i32 (i8*, i8*)**), align 4, !tbaa !6
  %call36 = tail call i32 %19(i8* %mid.0.ph, i8* %j.3146) #2
  %cmp37 = icmp slt i32 %call36, 1
  %20 = load i32, i32* @qsz, align 4, !tbaa !4
  br i1 %cmp37, label %if.then38, label %if.end41

if.then38:                                        ; preds = %while.body34
  %idx.neg39 = sub i32 0, %20
  %add.ptr40 = getelementptr inbounds i8, i8* %j.3146, i32 %idx.neg39
  %cmp33 = icmp ugt i8* %add.ptr40, %mid.0.ph
  br i1 %cmp33, label %while.body34, label %while.end48.loopexit

if.end41:                                         ; preds = %while.body34
  %.lcssa = phi i32 [ %20, %while.body34 ]
  %j.3146.lcssa = phi i8* [ %j.3146, %while.body34 ]
  %add.ptr42 = getelementptr inbounds i8, i8* %i.1.lcssa, i32 %.lcssa
  %cmp43 = icmp eq i8* %i.1.lcssa, %mid.0.ph
  br i1 %cmp43, label %swap, label %if.else

if.else:                                          ; preds = %if.end41
  %idx.neg45 = sub i32 0, %.lcssa
  %add.ptr46 = getelementptr inbounds i8, i8* %j.3146.lcssa, i32 %idx.neg45
  br label %swap

while.end48.loopexit:                             ; preds = %if.then38
  %add.ptr40.lcssa = phi i8* [ %add.ptr40, %if.then38 ]
  %.lcssa383 = phi i32 [ %20, %if.then38 ]
  br label %while.end48

while.end48:                                      ; preds = %while.end48.loopexit, %while.cond32.preheader.while.end48_crit_edge
  %21 = phi i32 [ %.pre, %while.cond32.preheader.while.end48_crit_edge ], [ %.lcssa383, %while.end48.loopexit ]
  %j.3.lcssa = phi i8* [ %j.2.ph, %while.cond32.preheader.while.end48_crit_edge ], [ %add.ptr40.lcssa, %while.end48.loopexit ]
  %cmp49 = icmp eq i8* %i.1.lcssa, %mid.0.ph
  br i1 %cmp49, label %for.end, label %if.else51

if.else51:                                        ; preds = %while.end48
  %idx.neg52 = sub i32 0, %21
  %add.ptr53 = getelementptr inbounds i8, i8* %j.3.lcssa, i32 %idx.neg52
  br label %swap

swap:                                             ; preds = %if.end41, %if.else, %if.else51
  %22 = phi i32 [ %.lcssa, %if.else ], [ %21, %if.else51 ], [ %.lcssa, %if.end41 ]
  %j.4 = phi i8* [ %add.ptr46, %if.else ], [ %add.ptr53, %if.else51 ], [ %j.3146.lcssa, %if.end41 ]
  %jj.0 = phi i8* [ %j.3146.lcssa, %if.else ], [ %mid.0.ph, %if.else51 ], [ %j.3146.lcssa, %if.end41 ]
  %mid.1 = phi i8* [ %mid.0.ph, %if.else ], [ %i.1.lcssa, %if.else51 ], [ %j.3146.lcssa, %if.end41 ]
  %tmp.0 = phi i8* [ %add.ptr42, %if.else ], [ %i.1.lcssa, %if.else51 ], [ %add.ptr42, %if.end41 ]
  %backedge.overflow = icmp eq i32 %22, 0
  br i1 %backedge.overflow, label %do.body55.preheader, label %overflow.checked

overflow.checked:                                 ; preds = %swap
  %n.vec = and i32 %22, -16
  %cmp.zero = icmp eq i32 %n.vec, 0
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %overflow.checked
  %scevgep159.sum = add i32 %22, -1
  %scevgep160 = getelementptr i8, i8* %jj.0, i32 %scevgep159.sum
  %scevgep.sum = add i32 %22, -1
  %scevgep158 = getelementptr i8, i8* %i.1.lcssa, i32 %scevgep.sum
  %bound0 = icmp ule i8* %i.1.lcssa, %scevgep160
  %bound1 = icmp ule i8* %jj.0, %scevgep158
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8, i8* %i.1.lcssa, i32 %n.vec
  %ptr.ind.end163 = getelementptr i8, i8* %jj.0, i32 %n.vec
  %ind.end = sub i32 %22, %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i32 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %next.gep = getelementptr i8, i8* %i.1.lcssa, i32 %index
  %next.gep197 = getelementptr i8, i8* %jj.0, i32 %index
  %23 = bitcast i8* %next.gep to <16 x i8>*
  %wide.load = load <16 x i8>, <16 x i8>* %23, align 1, !tbaa !1
  %24 = bitcast i8* %next.gep197 to <16 x i8>*
  %wide.load230 = load <16 x i8>, <16 x i8>* %24, align 1, !tbaa !1
  %25 = bitcast i8* %next.gep to <16 x i8>*
  store <16 x i8> %wide.load230, <16 x i8>* %25, align 1, !tbaa !1
  %26 = bitcast i8* %next.gep197 to <16 x i8>*
  store <16 x i8> %wide.load, <16 x i8>* %26, align 1, !tbaa !1
  %index.next = add i32 %index, 16
  %27 = icmp eq i32 %index.next, %n.vec
  br i1 %27, label %middle.block.loopexit, label %vector.body, !llvm.loop !14

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.memcheck, %overflow.checked
  %resume.val = phi i8* [ %i.1.lcssa, %overflow.checked ], [ %i.1.lcssa, %vector.memcheck ], [ %ptr.ind.end, %middle.block.loopexit ]
  %resume.val161 = phi i8* [ %jj.0, %overflow.checked ], [ %jj.0, %vector.memcheck ], [ %ptr.ind.end163, %middle.block.loopexit ]
  %resume.val164 = phi i32 [ %22, %overflow.checked ], [ %22, %vector.memcheck ], [ %ind.end, %middle.block.loopexit ]
  %new.indc.resume.val = phi i32 [ 0, %overflow.checked ], [ 0, %vector.memcheck ], [ %n.vec, %middle.block.loopexit ]
  %cmp.n = icmp eq i32 %22, %new.indc.resume.val
  br i1 %cmp.n, label %while.cond.outer.backedge, label %do.body55.preheader

while.cond.outer.backedge:                        ; preds = %middle.block, %while.cond.outer.loopexit
  br label %while.cond.outer

do.body55.preheader:                              ; preds = %middle.block, %swap
  %i.2.ph = phi i8* [ %i.1.lcssa, %swap ], [ %resume.val, %middle.block ]
  %jj.1.ph = phi i8* [ %jj.0, %swap ], [ %resume.val161, %middle.block ]
  %ii.1.ph = phi i32 [ %22, %swap ], [ %resume.val164, %middle.block ]
  br label %do.body55

do.body55:                                        ; preds = %do.body55.preheader, %do.body55
  %i.2 = phi i8* [ %incdec.ptr56, %do.body55 ], [ %i.2.ph, %do.body55.preheader ]
  %jj.1 = phi i8* [ %incdec.ptr57, %do.body55 ], [ %jj.1.ph, %do.body55.preheader ]
  %ii.1 = phi i32 [ %dec59, %do.body55 ], [ %ii.1.ph, %do.body55.preheader ]
  %28 = load i8, i8* %i.2, align 1, !tbaa !1
  %29 = load i8, i8* %jj.1, align 1, !tbaa !1
  %incdec.ptr56 = getelementptr inbounds i8, i8* %i.2, i32 1
  store i8 %29, i8* %i.2, align 1, !tbaa !1
  %incdec.ptr57 = getelementptr inbounds i8, i8* %jj.1, i32 1
  store i8 %28, i8* %jj.1, align 1, !tbaa !1
  %dec59 = add nsw i32 %ii.1, -1
  %tobool60 = icmp eq i32 %dec59, 0
  br i1 %tobool60, label %while.cond.outer.loopexit, label %do.body55, !llvm.loop !15

for.end:                                          ; preds = %while.end48
  %.lcssa384 = phi i32 [ %21, %while.end48 ]
  %mid.0.ph.lcssa = phi i8* [ %mid.0.ph, %while.end48 ]
  %add.ptr62 = getelementptr inbounds i8, i8* %mid.0.ph.lcssa, i32 %.lcssa384
  %sub.ptr.lhs.cast63 = ptrtoint i8* %mid.0.ph.lcssa to i32
  %sub.ptr.rhs.cast64 = ptrtoint i8* %base.addr.0 to i32
  %sub.ptr.sub65 = sub i32 %sub.ptr.lhs.cast63, %sub.ptr.rhs.cast64
  %sub.ptr.lhs.cast66 = ptrtoint i8* %max.addr.0 to i32
  %sub.ptr.rhs.cast67 = ptrtoint i8* %add.ptr62 to i32
  %sub.ptr.sub68 = sub i32 %sub.ptr.lhs.cast66, %sub.ptr.rhs.cast67
  %cmp69 = icmp sgt i32 %sub.ptr.sub65, %sub.ptr.sub68
  %30 = load i32, i32* @thresh, align 4, !tbaa !4
  br i1 %cmp69, label %if.else74, label %if.then70

if.then70:                                        ; preds = %for.end
  %cmp71 = icmp slt i32 %sub.ptr.sub65, %30
  br i1 %cmp71, label %do.cond79, label %if.then72

if.then72:                                        ; preds = %if.then70
  tail call fastcc void @qst(i8* %base.addr.0, i8* %mid.0.ph.lcssa)
  br label %do.cond79

if.else74:                                        ; preds = %for.end
  %cmp75 = icmp slt i32 %sub.ptr.sub68, %30
  br i1 %cmp75, label %do.cond79, label %if.then76

if.then76:                                        ; preds = %if.else74
  tail call fastcc void @qst(i8* %add.ptr62, i8* %max.addr.0)
  br label %do.cond79

do.cond79:                                        ; preds = %if.then76, %if.else74, %if.then72, %if.then70
  %max.addr.1 = phi i8* [ %max.addr.0, %if.then70 ], [ %max.addr.0, %if.then72 ], [ %mid.0.ph.lcssa, %if.else74 ], [ %mid.0.ph.lcssa, %if.then76 ]
  %lo.1 = phi i32 [ %sub.ptr.sub68, %if.then70 ], [ %sub.ptr.sub68, %if.then72 ], [ %sub.ptr.sub65, %if.else74 ], [ %sub.ptr.sub65, %if.then76 ]
  %base.addr.1 = phi i8* [ %add.ptr62, %if.then70 ], [ %add.ptr62, %if.then72 ], [ %base.addr.0, %if.else74 ], [ %base.addr.0, %if.then76 ]
  %31 = load i32, i32* @thresh, align 4, !tbaa !4
  %cmp80 = icmp slt i32 %lo.1, %31
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
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.vectorize.width", i32 1}
!10 = !{!"llvm.loop.interleave.count", i32 1}
!11 = distinct !{!11, !9, !10}
!12 = distinct !{!12, !9, !10}
!13 = distinct !{!13, !9, !10}
!14 = distinct !{!14, !9, !10}
!15 = distinct !{!15, !9, !10}
