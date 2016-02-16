; ModuleID = 'strncmp.c'
target datalayout = "e-m:o-p:32:32-f64:32:64-f80:128-n8:16:32-S128"
target triple = "i386-apple-macosx10.11.0"

; Function Attrs: nounwind readonly ssp
define i32 @strncmp(i8* nocapture readonly %s1, i8* nocapture readonly %s2, i32 %n) #0 {
entry:
  %cmp20 = icmp eq i32 %n, 0
  br i1 %cmp20, label %return, label %for.body.preheader

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.inc
  %n.addr.023 = phi i32 [ %dec, %for.inc ], [ %n, %for.body.preheader ]
  %s2.addr.022 = phi i8* [ %incdec.ptr13, %for.inc ], [ %s2, %for.body.preheader ]
  %s1.addr.021 = phi i8* [ %incdec.ptr, %for.inc ], [ %s1, %for.body.preheader ]
  %0 = load i8, i8* %s1.addr.021, align 1, !tbaa !2
  %1 = load i8, i8* %s2.addr.022, align 1, !tbaa !2
  %cmp2 = icmp eq i8 %0, %1
  br i1 %cmp2, label %if.else, label %if.then

if.then:                                          ; preds = %for.body
  %.lcssa39 = phi i8 [ %1, %for.body ]
  %.lcssa = phi i8 [ %0, %for.body ]
  %cmp6 = icmp ult i8 %.lcssa, %.lcssa39
  %cond = select i1 %cmp6, i32 -1, i32 1
  br label %return

if.else:                                          ; preds = %for.body
  %cmp9 = icmp eq i8 %0, 0
  br i1 %cmp9, label %return.loopexit, label %for.inc

for.inc:                                          ; preds = %if.else
  %incdec.ptr = getelementptr inbounds i8, i8* %s1.addr.021, i32 1
  %incdec.ptr13 = getelementptr inbounds i8, i8* %s2.addr.022, i32 1
  %dec = add i32 %n.addr.023, -1
  %cmp = icmp eq i32 %dec, 0
  br i1 %cmp, label %return.loopexit, label %for.body

return.loopexit:                                  ; preds = %for.inc, %if.else
  br label %return

return:                                           ; preds = %return.loopexit, %entry, %if.then
  %retval.0 = phi i32 [ %cond, %if.then ], [ 0, %entry ], [ 0, %return.loopexit ]
  ret i32 %retval.0
}

attributes #0 = { nounwind readonly ssp "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="yonah" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"PIC Level", i32 2}
!1 = !{!"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
