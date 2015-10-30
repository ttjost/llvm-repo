; ModuleID = 'change_brightness_print.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@image1 = global [100 x i8] c"`8z\BE\F6:\B7\03>m+K#M/X\08\07\F2\F1\0FpX\F6\988\1F\B4\08_Cz\CB\E7\A4l\9B\CA\E5\96\01.\96D\1C\D6\94\90\A0\DC\AF;!\9D\8E\C0\91\F3\CF\A6\07\A9r\15\C1+w\ACl}\C4\91\A2nL\C9\B3\0Cn\C8\A7Z\9AK\83@:f\CB\C2\CE\D8HtY\A6\0B-\FB\E6", align 1
@imageR = global [100 x i8] c"s\D8o\92\FC\F0\E5\DD\D5hr\12\BA~\B4\E4\B1\FC\A9;\81\98=6d\9E$s\FB\CC\EA\8D\81|G\E6C\08\B7\A5OiJ\02k!\B8\C0I[\B8\FB\F8O\91#\9C\EB\F0Ha\AF\FC\97\AC\D8\A8$\93\C0G\E9\8F\84e\0Ep\E7\D3j\90u\03IK\EB\96o\AE\D53]my\9A\D2\1A\F3\F8\94", align 1
@deltas = global [10 x i8] c"9\F8\90\17\EA\CD\5CN\0Fy", align 1
@.str = private unnamed_addr constant [6 x i8] c"%lu, \00", align 1

; Function Attrs: nounwind
define void @change_brightness(i8* nocapture readonly %image, i8* nocapture %imageR, i32 %nelem, i8 signext %delta) #0 {
entry:
  %cmp438 = icmp sgt i32 %nelem, 0
  br i1 %cmp438, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %cmp = icmp slt i8 %delta, 0
  %sub = sub i8 0, %delta
  %abs_delta.0 = select i1 %cmp, i8 %sub, i8 %delta
  %cmp7 = icmp sgt i8 %delta, 0
  %conv11 = zext i8 %abs_delta.0 to i32
  %backedge.overflow = icmp eq i32 %nelem, 0
  br i1 %backedge.overflow, label %for.body.preheader, label %overflow.checked

overflow.checked:                                 ; preds = %for.body.lr.ph
  %n.vec = and i32 %nelem, -4
  %cmp.zero = icmp eq i32 %n.vec, 0
  %0 = add i32 %nelem, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %overflow.checked
  %scevgep42 = getelementptr i8, i8* %image, i32 %0
  %scevgep = getelementptr i8, i8* %imageR, i32 %0
  %bound0 = icmp uge i8* %scevgep42, %imageR
  %bound1 = icmp uge i8* %scevgep, %image
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8, i8* %image, i32 %n.vec
  %ptr.ind.end47 = getelementptr i8, i8* %imageR, i32 %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert63 = insertelement <4 x i32> undef, i32 %conv11, i32 0
  %broadcast.splat64 = shufflevector <4 x i32> %broadcast.splatinsert63, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert65 = insertelement <4 x i1> undef, i1 %cmp7, i32 0
  %broadcast.splat66 = shufflevector <4 x i1> %broadcast.splatinsert65, <4 x i1> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i32 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %next.gep = getelementptr i8, i8* %image, i32 %index
  %next.gep55 = getelementptr i8, i8* %imageR, i32 %index
  %1 = bitcast i8* %next.gep to <4 x i8>*
  %wide.load = load <4 x i8>, <4 x i8>* %1, align 1, !tbaa !1
  %2 = zext <4 x i8> %wide.load to <4 x i32>
  %3 = sub nsw <4 x i32> %2, %broadcast.splat64
  %4 = icmp slt <4 x i32> %3, zeroinitializer
  %5 = trunc <4 x i32> %3 to <4 x i8>
  %6 = select <4 x i1> %4, <4 x i8> zeroinitializer, <4 x i8> %5
  %7 = add nuw nsw <4 x i32> %2, %broadcast.splat64
  %8 = icmp sgt <4 x i32> %7, <i32 255, i32 255, i32 255, i32 255>
  %9 = trunc <4 x i32> %7 to <4 x i8>
  %10 = select <4 x i1> %8, <4 x i8> <i8 -1, i8 -1, i8 -1, i8 -1>, <4 x i8> %9
  %predphi = select <4 x i1> %broadcast.splat66, <4 x i8> %10, <4 x i8> %6
  %11 = bitcast i8* %next.gep55 to <4 x i8>*
  store <4 x i8> %predphi, <4 x i8>* %11, align 1, !tbaa !1
  %index.next = add i32 %index, 4
  %12 = icmp eq i32 %index.next, %n.vec
  br i1 %12, label %middle.block.loopexit, label %vector.body, !llvm.loop !4

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.memcheck, %overflow.checked
  %resume.val = phi i32 [ 0, %overflow.checked ], [ 0, %vector.memcheck ], [ %n.vec, %middle.block.loopexit ]
  %resume.val43 = phi i8* [ %image, %overflow.checked ], [ %image, %vector.memcheck ], [ %ptr.ind.end, %middle.block.loopexit ]
  %resume.val45 = phi i8* [ %imageR, %overflow.checked ], [ %imageR, %vector.memcheck ], [ %ptr.ind.end47, %middle.block.loopexit ]
  %cmp.n = icmp eq i32 %resume.val, %nelem
  br i1 %cmp.n, label %for.end, label %for.body.preheader

for.body.preheader:                               ; preds = %middle.block, %for.body.lr.ph
  %i.041.ph = phi i32 [ 0, %for.body.lr.ph ], [ %resume.val, %middle.block ]
  %image.addr.040.ph = phi i8* [ %image, %for.body.lr.ph ], [ %resume.val43, %middle.block ]
  %imageR.addr.039.ph = phi i8* [ %imageR, %for.body.lr.ph ], [ %resume.val45, %middle.block ]
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.inc
  %i.041 = phi i32 [ %inc, %for.inc ], [ %i.041.ph, %for.body.preheader ]
  %image.addr.040 = phi i8* [ %incdec.ptr28, %for.inc ], [ %image.addr.040.ph, %for.body.preheader ]
  %imageR.addr.039 = phi i8* [ %imageR.addr.1, %for.inc ], [ %imageR.addr.039.ph, %for.body.preheader ]
  %13 = load i8, i8* %image.addr.040, align 1, !tbaa !1
  %conv10 = zext i8 %13 to i32
  br i1 %cmp7, label %if.then9, label %if.else17

if.then9:                                         ; preds = %for.body
  %add = add nuw nsw i32 %conv10, %conv11
  %cmp12 = icmp sgt i32 %add, 255
  %14 = trunc i32 %add to i8
  %conv16 = select i1 %cmp12, i8 -1, i8 %14
  br label %for.inc

if.else17:                                        ; preds = %for.body
  %sub20 = sub nsw i32 %conv10, %conv11
  %cmp21 = icmp slt i32 %sub20, 0
  %15 = trunc i32 %sub20 to i8
  %conv25 = select i1 %cmp21, i8 0, i8 %15
  br label %for.inc

for.inc:                                          ; preds = %if.then9, %if.else17
  %storemerge = phi i8 [ %conv25, %if.else17 ], [ %conv16, %if.then9 ]
  %imageR.addr.1 = getelementptr inbounds i8, i8* %imageR.addr.039, i32 1
  store i8 %storemerge, i8* %imageR.addr.039, align 1, !tbaa !1
  %inc = add nuw nsw i32 %i.041, 1
  %incdec.ptr28 = getelementptr inbounds i8, i8* %image.addr.040, i32 1
  %exitcond = icmp eq i32 %inc, %nelem
  br i1 %exitcond, label %for.end.loopexit, label %for.body, !llvm.loop !7

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %middle.block, %entry
  ret void
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %change_brightness.exit, %entry
  %i.015 = phi i32 [ 0, %entry ], [ %inc, %change_brightness.exit ]
  %arrayidx = getelementptr inbounds [10 x i8], [10 x i8]* @deltas, i32 0, i32 %i.015
  %0 = load i8, i8* %arrayidx, align 1, !tbaa !1
  %cmp.i = icmp slt i8 %0, 0
  %sub.i = sub i8 0, %0
  %abs_delta.0.i = select i1 %cmp.i, i8 %sub.i, i8 %0
  %cmp7.i = icmp sgt i8 %0, 0
  %conv11.i = zext i8 %abs_delta.0.i to i32
  %broadcast.splatinsert36 = insertelement <4 x i32> undef, i32 %conv11.i, i32 0
  %broadcast.splat37 = shufflevector <4 x i32> %broadcast.splatinsert36, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert38 = insertelement <4 x i1> undef, i1 %cmp7.i, i32 0
  %broadcast.splat39 = shufflevector <4 x i1> %broadcast.splatinsert38, <4 x i1> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.body
  %index = phi i32 [ 0, %for.body ], [ %index.next, %vector.body ]
  %next.gep = getelementptr [100 x i8], [100 x i8]* @image1, i32 0, i32 %index
  %next.gep28 = getelementptr [100 x i8], [100 x i8]* @imageR, i32 0, i32 %index
  %1 = bitcast i8* %next.gep to <4 x i8>*
  %wide.load = load <4 x i8>, <4 x i8>* %1, align 1, !tbaa !1
  %2 = zext <4 x i8> %wide.load to <4 x i32>
  %3 = sub nsw <4 x i32> %2, %broadcast.splat37
  %4 = icmp slt <4 x i32> %3, zeroinitializer
  %5 = trunc <4 x i32> %3 to <4 x i8>
  %6 = select <4 x i1> %4, <4 x i8> zeroinitializer, <4 x i8> %5
  %7 = add nuw nsw <4 x i32> %2, %broadcast.splat37
  %8 = icmp sgt <4 x i32> %7, <i32 255, i32 255, i32 255, i32 255>
  %9 = trunc <4 x i32> %7 to <4 x i8>
  %10 = select <4 x i1> %8, <4 x i8> <i8 -1, i8 -1, i8 -1, i8 -1>, <4 x i8> %9
  %predphi = select <4 x i1> %broadcast.splat39, <4 x i8> %10, <4 x i8> %6
  %11 = bitcast i8* %next.gep28 to <4 x i8>*
  store <4 x i8> %predphi, <4 x i8>* %11, align 1, !tbaa !1
  %index.next = add i32 %index, 4
  %12 = icmp eq i32 %index.next, 100
  br i1 %12, label %change_brightness.exit, label %vector.body, !llvm.loop !8

change_brightness.exit:                           ; preds = %vector.body
  %inc = add nuw nsw i32 %i.015, 1
  %exitcond16 = icmp eq i32 %inc, 10
  br i1 %exitcond16, label %for.body3.preheader, label %for.body

for.body3.preheader:                              ; preds = %change_brightness.exit
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %i.114 = phi i32 [ %inc6, %for.body3 ], [ 0, %for.body3.preheader ]
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* @imageR, i32 0, i32 %i.114
  %13 = load i8, i8* %arrayidx4, align 1, !tbaa !1
  %conv = zext i8 %13 to i32
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 %conv) #1
  %inc6 = add nuw nsw i32 %i.114, 1
  %exitcond = icmp eq i32 %inc6, 100
  br i1 %exitcond, label %for.end7, label %for.body3

for.end7:                                         ; preds = %for.body3
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #0

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
!4 = distinct !{!4, !5, !6}
!5 = !{!"llvm.loop.vectorize.width", i32 1}
!6 = !{!"llvm.loop.interleave.count", i32 1}
!7 = distinct !{!7, !5, !6}
!8 = distinct !{!8, !5, !6}