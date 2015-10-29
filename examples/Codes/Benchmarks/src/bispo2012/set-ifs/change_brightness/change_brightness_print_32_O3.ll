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
  %backedge.overflow70 = icmp eq i32 %nelem, 0
  br i1 %cmp7, label %for.inc.us.preheader, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.body.lr.ph
  br i1 %backedge.overflow70, label %for.inc.preheader137, label %overflow.checked

for.inc.preheader137:                             ; preds = %middle.block, %for.inc.preheader
  %i.041.ph = phi i32 [ 0, %for.inc.preheader ], [ %resume.val, %middle.block ]
  %image.addr.040.ph = phi i8* [ %image, %for.inc.preheader ], [ %resume.val46, %middle.block ]
  %imageR.addr.039.ph = phi i8* [ %imageR, %for.inc.preheader ], [ %resume.val48, %middle.block ]
  br label %for.inc

overflow.checked:                                 ; preds = %for.inc.preheader
  %n.vec = and i32 %nelem, -4
  %cmp.zero = icmp eq i32 %n.vec, 0
  %0 = add i32 %nelem, -1
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %overflow.checked
  %scevgep45 = getelementptr i8, i8* %image, i32 %0
  %scevgep = getelementptr i8, i8* %imageR, i32 %0
  %bound0 = icmp uge i8* %scevgep45, %imageR
  %bound1 = icmp uge i8* %scevgep, %image
  %memcheck.conflict = and i1 %bound0, %bound1
  %ptr.ind.end = getelementptr i8, i8* %image, i32 %n.vec
  %ptr.ind.end50 = getelementptr i8, i8* %imageR, i32 %n.vec
  br i1 %memcheck.conflict, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert66 = insertelement <4 x i32> undef, i32 %conv11, i32 0
  %broadcast.splat67 = shufflevector <4 x i32> %broadcast.splatinsert66, <4 x i32> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i32 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %next.gep = getelementptr i8, i8* %image, i32 %index
  %next.gep58 = getelementptr i8, i8* %imageR, i32 %index
  %1 = bitcast i8* %next.gep to <4 x i8>*
  %wide.load = load <4 x i8>, <4 x i8>* %1, align 1, !tbaa !1
  %2 = zext <4 x i8> %wide.load to <4 x i32>
  %3 = sub nsw <4 x i32> %2, %broadcast.splat67
  %4 = icmp slt <4 x i32> %3, zeroinitializer
  %5 = trunc <4 x i32> %3 to <4 x i8>
  %6 = select <4 x i1> %4, <4 x i8> zeroinitializer, <4 x i8> %5
  %7 = bitcast i8* %next.gep58 to <4 x i8>*
  store <4 x i8> %6, <4 x i8>* %7, align 1, !tbaa !1
  %index.next = add i32 %index, 4
  %8 = icmp eq i32 %index.next, %n.vec
  br i1 %8, label %middle.block.loopexit, label %vector.body, !llvm.loop !4

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.memcheck, %overflow.checked
  %resume.val = phi i32 [ 0, %overflow.checked ], [ 0, %vector.memcheck ], [ %n.vec, %middle.block.loopexit ]
  %resume.val46 = phi i8* [ %image, %overflow.checked ], [ %image, %vector.memcheck ], [ %ptr.ind.end, %middle.block.loopexit ]
  %resume.val48 = phi i8* [ %imageR, %overflow.checked ], [ %imageR, %vector.memcheck ], [ %ptr.ind.end50, %middle.block.loopexit ]
  %cmp.n = icmp eq i32 %resume.val, %nelem
  br i1 %cmp.n, label %for.end, label %for.inc.preheader137

for.inc.us.preheader:                             ; preds = %for.body.lr.ph
  br i1 %backedge.overflow70, label %for.inc.us.preheader136, label %overflow.checked82

overflow.checked82:                               ; preds = %for.inc.us.preheader
  %n.vec79 = and i32 %nelem, -4
  %cmp.zero81 = icmp eq i32 %n.vec79, 0
  %9 = add i32 %nelem, -1
  br i1 %cmp.zero81, label %middle.block74, label %vector.memcheck89

vector.memcheck89:                                ; preds = %overflow.checked82
  %scevgep84 = getelementptr i8, i8* %image, i32 %9
  %scevgep83 = getelementptr i8, i8* %imageR, i32 %9
  %bound085 = icmp uge i8* %scevgep84, %imageR
  %bound186 = icmp uge i8* %scevgep83, %image
  %memcheck.conflict88 = and i1 %bound085, %bound186
  %ptr.ind.end96 = getelementptr i8, i8* %image, i32 %n.vec79
  %ptr.ind.end99 = getelementptr i8, i8* %imageR, i32 %n.vec79
  br i1 %memcheck.conflict88, label %middle.block74, label %vector.ph72

vector.ph72:                                      ; preds = %vector.memcheck89
  %broadcast.splatinsert124 = insertelement <4 x i32> undef, i32 %conv11, i32 0
  %broadcast.splat125 = shufflevector <4 x i32> %broadcast.splatinsert124, <4 x i32> undef, <4 x i32> zeroinitializer
  br label %vector.body73

vector.body73:                                    ; preds = %vector.body73, %vector.ph72
  %index76 = phi i32 [ 0, %vector.ph72 ], [ %index.next101, %vector.body73 ]
  %next.gep106 = getelementptr i8, i8* %image, i32 %index76
  %next.gep115 = getelementptr i8, i8* %imageR, i32 %index76
  %10 = bitcast i8* %next.gep106 to <4 x i8>*
  %wide.load123 = load <4 x i8>, <4 x i8>* %10, align 1, !tbaa !1
  %11 = zext <4 x i8> %wide.load123 to <4 x i32>
  %12 = add nuw nsw <4 x i32> %11, %broadcast.splat125
  %13 = icmp sgt <4 x i32> %12, <i32 255, i32 255, i32 255, i32 255>
  %14 = trunc <4 x i32> %12 to <4 x i8>
  %15 = select <4 x i1> %13, <4 x i8> <i8 -1, i8 -1, i8 -1, i8 -1>, <4 x i8> %14
  %16 = bitcast i8* %next.gep115 to <4 x i8>*
  store <4 x i8> %15, <4 x i8>* %16, align 1, !tbaa !1
  %index.next101 = add i32 %index76, 4
  %17 = icmp eq i32 %index.next101, %n.vec79
  br i1 %17, label %middle.block74.loopexit, label %vector.body73, !llvm.loop !7

middle.block74.loopexit:                          ; preds = %vector.body73
  br label %middle.block74

middle.block74:                                   ; preds = %middle.block74.loopexit, %vector.memcheck89, %overflow.checked82
  %resume.val90 = phi i32 [ 0, %overflow.checked82 ], [ 0, %vector.memcheck89 ], [ %n.vec79, %middle.block74.loopexit ]
  %resume.val94 = phi i8* [ %image, %overflow.checked82 ], [ %image, %vector.memcheck89 ], [ %ptr.ind.end96, %middle.block74.loopexit ]
  %resume.val97 = phi i8* [ %imageR, %overflow.checked82 ], [ %imageR, %vector.memcheck89 ], [ %ptr.ind.end99, %middle.block74.loopexit ]
  %cmp.n100 = icmp eq i32 %resume.val90, %nelem
  br i1 %cmp.n100, label %for.end, label %for.inc.us.preheader136

for.inc.us.preheader136:                          ; preds = %middle.block74, %for.inc.us.preheader
  %i.041.us.ph = phi i32 [ 0, %for.inc.us.preheader ], [ %resume.val90, %middle.block74 ]
  %image.addr.040.us.ph = phi i8* [ %image, %for.inc.us.preheader ], [ %resume.val94, %middle.block74 ]
  %imageR.addr.039.us.ph = phi i8* [ %imageR, %for.inc.us.preheader ], [ %resume.val97, %middle.block74 ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us.preheader136, %for.inc.us
  %i.041.us = phi i32 [ %inc.us, %for.inc.us ], [ %i.041.us.ph, %for.inc.us.preheader136 ]
  %image.addr.040.us = phi i8* [ %incdec.ptr28.us, %for.inc.us ], [ %image.addr.040.us.ph, %for.inc.us.preheader136 ]
  %imageR.addr.039.us = phi i8* [ %imageR.addr.1.us, %for.inc.us ], [ %imageR.addr.039.us.ph, %for.inc.us.preheader136 ]
  %18 = load i8, i8* %image.addr.040.us, align 1, !tbaa !1
  %conv10.us = zext i8 %18 to i32
  %add.us = add nuw nsw i32 %conv10.us, %conv11
  %cmp12.us = icmp sgt i32 %add.us, 255
  %19 = trunc i32 %add.us to i8
  %conv16.us = select i1 %cmp12.us, i8 -1, i8 %19
  %imageR.addr.1.us = getelementptr inbounds i8, i8* %imageR.addr.039.us, i32 1
  store i8 %conv16.us, i8* %imageR.addr.039.us, align 1, !tbaa !1
  %inc.us = add nuw nsw i32 %i.041.us, 1
  %incdec.ptr28.us = getelementptr inbounds i8, i8* %image.addr.040.us, i32 1
  %exitcond42 = icmp eq i32 %inc.us, %nelem
  br i1 %exitcond42, label %for.end.loopexit, label %for.inc.us, !llvm.loop !8

for.inc:                                          ; preds = %for.inc.preheader137, %for.inc
  %i.041 = phi i32 [ %inc, %for.inc ], [ %i.041.ph, %for.inc.preheader137 ]
  %image.addr.040 = phi i8* [ %incdec.ptr28, %for.inc ], [ %image.addr.040.ph, %for.inc.preheader137 ]
  %imageR.addr.039 = phi i8* [ %imageR.addr.1, %for.inc ], [ %imageR.addr.039.ph, %for.inc.preheader137 ]
  %20 = load i8, i8* %image.addr.040, align 1, !tbaa !1
  %conv10 = zext i8 %20 to i32
  %sub20 = sub nsw i32 %conv10, %conv11
  %cmp21 = icmp slt i32 %sub20, 0
  %21 = trunc i32 %sub20 to i8
  %conv25 = select i1 %cmp21, i8 0, i8 %21
  %imageR.addr.1 = getelementptr inbounds i8, i8* %imageR.addr.039, i32 1
  store i8 %conv25, i8* %imageR.addr.039, align 1, !tbaa !1
  %inc = add nuw nsw i32 %i.041, 1
  %incdec.ptr28 = getelementptr inbounds i8, i8* %image.addr.040, i32 1
  %exitcond = icmp eq i32 %inc, %nelem
  br i1 %exitcond, label %for.end.loopexit138, label %for.inc, !llvm.loop !9

for.end.loopexit:                                 ; preds = %for.inc.us
  br label %for.end

for.end.loopexit138:                              ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit138, %for.end.loopexit, %middle.block, %middle.block74, %entry
  ret void
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %change_brightness.exit, %entry
  %i.016 = phi i32 [ 0, %entry ], [ %inc, %change_brightness.exit ]
  %arrayidx = getelementptr inbounds [10 x i8], [10 x i8]* @deltas, i32 0, i32 %i.016
  %0 = load i8, i8* %arrayidx, align 1, !tbaa !1
  %cmp.i = icmp slt i8 %0, 0
  %sub.i = sub i8 0, %0
  %abs_delta.0.i = select i1 %cmp.i, i8 %sub.i, i8 %0
  %cmp7.i = icmp sgt i8 %0, 0
  %conv11.i = zext i8 %abs_delta.0.i to i32
  %broadcast.splatinsert39 = insertelement <4 x i32> undef, i32 %conv11.i, i32 0
  %broadcast.splat40 = shufflevector <4 x i32> %broadcast.splatinsert39, <4 x i32> undef, <4 x i32> zeroinitializer
  br i1 %cmp7.i, label %vector.body.preheader, label %vector.body44.preheader

vector.body44.preheader:                          ; preds = %for.body
  br label %vector.body44

vector.body.preheader:                            ; preds = %for.body
  br label %vector.body

vector.body44:                                    ; preds = %vector.body44.preheader, %vector.body44
  %index47 = phi i32 [ %index.next58, %vector.body44 ], [ 0, %vector.body44.preheader ]
  %next.gep63 = getelementptr [100 x i8], [100 x i8]* @image1, i32 0, i32 %index47
  %next.gep72 = getelementptr [100 x i8], [100 x i8]* @imageR, i32 0, i32 %index47
  %1 = bitcast i8* %next.gep63 to <4 x i8>*
  %wide.load80 = load <4 x i8>, <4 x i8>* %1, align 1, !tbaa !1
  %2 = zext <4 x i8> %wide.load80 to <4 x i32>
  %3 = sub nsw <4 x i32> %2, %broadcast.splat40
  %4 = icmp slt <4 x i32> %3, zeroinitializer
  %5 = trunc <4 x i32> %3 to <4 x i8>
  %6 = select <4 x i1> %4, <4 x i8> zeroinitializer, <4 x i8> %5
  %7 = bitcast i8* %next.gep72 to <4 x i8>*
  store <4 x i8> %6, <4 x i8>* %7, align 1, !tbaa !1
  %index.next58 = add i32 %index47, 4
  %8 = icmp eq i32 %index.next58, 100
  br i1 %8, label %change_brightness.exit.loopexit91, label %vector.body44, !llvm.loop !10

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i32 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %next.gep = getelementptr [100 x i8], [100 x i8]* @image1, i32 0, i32 %index
  %next.gep31 = getelementptr [100 x i8], [100 x i8]* @imageR, i32 0, i32 %index
  %9 = bitcast i8* %next.gep to <4 x i8>*
  %wide.load = load <4 x i8>, <4 x i8>* %9, align 1, !tbaa !1
  %10 = zext <4 x i8> %wide.load to <4 x i32>
  %11 = add nuw nsw <4 x i32> %10, %broadcast.splat40
  %12 = icmp sgt <4 x i32> %11, <i32 255, i32 255, i32 255, i32 255>
  %13 = trunc <4 x i32> %11 to <4 x i8>
  %14 = select <4 x i1> %12, <4 x i8> <i8 -1, i8 -1, i8 -1, i8 -1>, <4 x i8> %13
  %15 = bitcast i8* %next.gep31 to <4 x i8>*
  store <4 x i8> %14, <4 x i8>* %15, align 1, !tbaa !1
  %index.next = add i32 %index, 4
  %16 = icmp eq i32 %index.next, 100
  br i1 %16, label %change_brightness.exit.loopexit, label %vector.body, !llvm.loop !11

change_brightness.exit.loopexit:                  ; preds = %vector.body
  br label %change_brightness.exit

change_brightness.exit.loopexit91:                ; preds = %vector.body44
  br label %change_brightness.exit

change_brightness.exit:                           ; preds = %change_brightness.exit.loopexit91, %change_brightness.exit.loopexit
  %inc = add nuw nsw i32 %i.016, 1
  %exitcond17 = icmp eq i32 %inc, 10
  br i1 %exitcond17, label %for.body3.preheader, label %for.body

for.body3.preheader:                              ; preds = %change_brightness.exit
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %i.115 = phi i32 [ %inc6, %for.body3 ], [ 0, %for.body3.preheader ]
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* @imageR, i32 0, i32 %i.115
  %17 = load i8, i8* %arrayidx4, align 1, !tbaa !1
  %conv = zext i8 %17 to i32
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i32 %conv) #1
  %inc6 = add nuw nsw i32 %i.115, 1
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
!9 = distinct !{!9, !5, !6}
!10 = distinct !{!10, !5, !6}
!11 = distinct !{!11, !5, !6}
