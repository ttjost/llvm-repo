; ModuleID = 'bubble_sort.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@ar = global [64 x i32] [i32 -1155484576, i32 -723955400, i32 1033096058, i32 -1690734402, i32 -1557280266, i32 1327362106, i32 -1930858313, i32 502539523, i32 -1728529858, i32 -938301587, i32 1431162155, i32 1085665355, i32 1654374947, i32 -1661998771, i32 -65105105, i32 -73789608, i32 -518907128, i32 99135751, i32 -252332814, i32 755814641, i32 1180918287, i32 1344049776, i32 553609048, i32 1580443894, i32 629649304, i32 -1266264776, i32 99807007, i32 5955764, i32 -1946737912, i32 39620447, i32 -152527805, i32 -1877116806, i32 448784075, i32 1086124775, i32 -1609984092, i32 1227951724, i32 1764356251, i32 64111306, i32 -960731419, i32 -100082026, i32 -39845375, i32 -1339022546, i32 2092649110, i32 -568315836, i32 -1089884900, i32 -81839914, i32 -1146103148, i32 -1846688624, i32 -784703072, i32 55004124, i32 -691960657, i32 1770461755, i32 -2032810463, i32 -1177788003, i32 -432352882, i32 -65824064, i32 575267217, i32 -1949367821, i32 356750287, i32 798819494, i32 -92022521, i32 1318001577, i32 -1192467086, i32 -1412716779], align 4

; Function Attrs: nounwind
define void @bubblesort(i32* nocapture %ar, i32 %n) #0 {
entry:
  %cmp229 = icmp sgt i32 %n, 1
  br i1 %cmp229, label %for.cond1.preheader.lr.ph.split.us, label %for.end14

for.cond1.preheader.lr.ph.split.us:               ; preds = %entry
  %0 = add i32 %n, -1
  br label %for.body3.lr.ph.us

for.inc12.us:                                     ; preds = %for.cond1.backedge.us
  %inc13.us = add nuw nsw i32 %i.032.us, 1
  %exitcond33 = icmp eq i32 %inc13.us, %n
  br i1 %exitcond33, label %for.end14.loopexit, label %for.body3.lr.ph.us

for.body3.us:                                     ; preds = %for.cond1.backedge.us, %for.body3.lr.ph.us
  %j.030.us = phi i32 [ 0, %for.body3.lr.ph.us ], [ %add.us, %for.cond1.backedge.us ]
  %arrayidx.us = getelementptr inbounds i32, i32* %ar, i32 %j.030.us
  %1 = load i32, i32* %arrayidx.us, align 4, !tbaa !1
  %add.us = add nuw nsw i32 %j.030.us, 1
  %arrayidx4.us = getelementptr inbounds i32, i32* %ar, i32 %add.us
  %2 = load i32, i32* %arrayidx4.us, align 4, !tbaa !1
  %cmp5.us = icmp sgt i32 %1, %2
  br i1 %cmp5.us, label %if.then.us, label %for.cond1.backedge.us

if.then.us:                                       ; preds = %for.body3.us
  store i32 %1, i32* %arrayidx4.us, align 4, !tbaa !1
  store i32 %2, i32* %arrayidx.us, align 4, !tbaa !1
  br label %for.cond1.backedge.us

for.cond1.backedge.us:                            ; preds = %if.then.us, %for.body3.us
  %exitcond = icmp eq i32 %add.us, %0
  br i1 %exitcond, label %for.inc12.us, label %for.body3.us

for.body3.lr.ph.us:                               ; preds = %for.cond1.preheader.lr.ph.split.us, %for.inc12.us
  %i.032.us = phi i32 [ 0, %for.cond1.preheader.lr.ph.split.us ], [ %inc13.us, %for.inc12.us ]
  br label %for.body3.us

for.end14.loopexit:                               ; preds = %for.inc12.us
  br label %for.end14

for.end14:                                        ; preds = %for.end14.loopexit, %entry
  ret void
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  br label %for.body3.lr.ph.us.i

for.inc12.us.i:                                   ; preds = %for.cond1.backedge.us.i
  %inc13.us.i = add nuw nsw i32 %i.032.us.i, 1
  %exitcond33.i = icmp eq i32 %inc13.us.i, 64
  br i1 %exitcond33.i, label %for.cond.preheader, label %for.body3.lr.ph.us.i

for.cond.preheader:                               ; preds = %for.inc12.us.i
  br label %for.cond

for.body3.us.i:                                   ; preds = %for.body3.lr.ph.us.i, %for.cond1.backedge.us.i
  %0 = phi i32 [ %.pre, %for.body3.lr.ph.us.i ], [ %2, %for.cond1.backedge.us.i ]
  %j.030.us.i = phi i32 [ 0, %for.body3.lr.ph.us.i ], [ %add.us.i, %for.cond1.backedge.us.i ]
  %add.us.i = add nuw nsw i32 %j.030.us.i, 1
  %arrayidx4.us.i = getelementptr inbounds [64 x i32], [64 x i32]* @ar, i32 0, i32 %add.us.i
  %1 = load i32, i32* %arrayidx4.us.i, align 4, !tbaa !1
  %cmp5.us.i = icmp sgt i32 %0, %1
  br i1 %cmp5.us.i, label %if.then.us.i, label %for.cond1.backedge.us.i

if.then.us.i:                                     ; preds = %for.body3.us.i
  %arrayidx.us.i = getelementptr inbounds [64 x i32], [64 x i32]* @ar, i32 0, i32 %j.030.us.i
  store i32 %0, i32* %arrayidx4.us.i, align 4, !tbaa !1
  store i32 %1, i32* %arrayidx.us.i, align 4, !tbaa !1
  br label %for.cond1.backedge.us.i

for.cond1.backedge.us.i:                          ; preds = %if.then.us.i, %for.body3.us.i
  %2 = phi i32 [ %0, %if.then.us.i ], [ %1, %for.body3.us.i ]
  %exitcond.i = icmp eq i32 %add.us.i, 63
  br i1 %exitcond.i, label %for.inc12.us.i, label %for.body3.us.i

for.body3.lr.ph.us.i:                             ; preds = %for.inc12.us.i, %entry
  %i.032.us.i = phi i32 [ 0, %entry ], [ %inc13.us.i, %for.inc12.us.i ]
  %.pre = load i32, i32* getelementptr inbounds ([64 x i32], [64 x i32]* @ar, i32 0, i32 0), align 4, !tbaa !1
  br label %for.body3.us.i

for.cond:                                         ; preds = %for.cond.preheader, %for.body
  %i.0 = phi i32 [ %add, %for.body ], [ 0, %for.cond.preheader ]
  %cmp = icmp slt i32 %i.0, 63
  br i1 %cmp, label %for.body, label %return.loopexit

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds [64 x i32], [64 x i32]* @ar, i32 0, i32 %i.0
  %3 = load i32, i32* %arrayidx, align 4, !tbaa !1
  %add = add nuw nsw i32 %i.0, 1
  %arrayidx1 = getelementptr inbounds [64 x i32], [64 x i32]* @ar, i32 0, i32 %add
  %4 = load i32, i32* %arrayidx1, align 4, !tbaa !1
  %cmp2 = icmp sgt i32 %3, %4
  br i1 %cmp2, label %if.then, label %for.cond

if.then:                                          ; preds = %for.body
  %i.0.lcssa12 = phi i32 [ %i.0, %for.body ]
  %add3 = add nsw i32 %i.0.lcssa12, 10
  br label %return

return.loopexit:                                  ; preds = %for.cond
  br label %return

return:                                           ; preds = %return.loopexit, %if.then
  %retval.0 = phi i32 [ %add3, %if.then ], [ -1, %return.loopexit ]
  ret i32 %retval.0
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
