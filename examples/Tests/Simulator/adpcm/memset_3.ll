; ModuleID = '/media/psf/Home/Dropbox/Universidade/Mestrado/llvm/examples/Tests/Simulator/memset.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-pc-linux-gnu"

; Function Attrs: nounwind
define i8* @memset(i8* %s, i32 %c, i32 %n) #0 {
entry:
  %tobool2 = icmp eq i32 %n, 0
  br i1 %tobool2, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %conv = trunc i32 %c to i8
  %n.vec = and i32 %n, -4
  %cmp.zero = icmp eq i32 %n.vec, 0
  %ptr.ind.end = getelementptr i8, i8* %s, i32 %n.vec
  %ind.end = sub i32 %n, %n.vec
  br i1 %cmp.zero, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %while.body.lr.ph
  %broadcast.splatinsert14 = insertelement <4 x i8> undef, i8 %conv, i32 0
  %broadcast.splat15 = shufflevector <4 x i8> %broadcast.splatinsert14, <4 x i8> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i32 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %next.gep = getelementptr i8, i8* %s, i32 %index
  %0 = bitcast i8* %next.gep to <4 x i8>*
  store <4 x i8> %broadcast.splat15, <4 x i8>* %0, align 1, !tbaa !1
  %index.next = add i32 %index, 4
  %1 = icmp eq i32 %index.next, %n.vec
  br i1 %1, label %middle.block.loopexit, label %vector.body, !llvm.loop !4

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %while.body.lr.ph
  %resume.val = phi i8* [ %s, %while.body.lr.ph ], [ %ptr.ind.end, %middle.block.loopexit ]
  %resume.val5 = phi i32 [ %n, %while.body.lr.ph ], [ %ind.end, %middle.block.loopexit ]
  %new.indc.resume.val = phi i32 [ 0, %while.body.lr.ph ], [ %n.vec, %middle.block.loopexit ]
  %cmp.n = icmp eq i32 %new.indc.resume.val, %n
  br i1 %cmp.n, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %middle.block
  br label %while.body

while.body:                                       ; preds = %while.body.preheader, %while.body
  %p.04 = phi i8* [ %incdec.ptr, %while.body ], [ %resume.val, %while.body.preheader ]
  %n.addr.03 = phi i32 [ %dec, %while.body ], [ %resume.val5, %while.body.preheader ]
  %dec = add i32 %n.addr.03, -1
  %incdec.ptr = getelementptr inbounds i8, i8* %p.04, i32 1
  store i8 %conv, i8* %p.04, align 1, !tbaa !1
  %tobool = icmp eq i32 %dec, 0
  br i1 %tobool, label %while.end.loopexit, label %while.body, !llvm.loop !7

while.end.loopexit:                               ; preds = %while.body
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %middle.block, %entry
  ret i8* %s
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
!4 = distinct !{!4, !5, !6}
!5 = !{!"llvm.loop.vectorize.width", i32 1}
!6 = !{!"llvm.loop.interleave.count", i32 1}
!7 = distinct !{!7, !8, !5, !6}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
