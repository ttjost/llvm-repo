; ModuleID = 'bubble_sort_print.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@ar = global [64 x i32] [i32 -1155484576, i32 -723955400, i32 1033096058, i32 -1690734402, i32 -1557280266, i32 1327362106, i32 -1930858313, i32 502539523, i32 -1728529858, i32 -938301587, i32 1431162155, i32 1085665355, i32 1654374947, i32 -1661998771, i32 -65105105, i32 -73789608, i32 -518907128, i32 99135751, i32 -252332814, i32 755814641, i32 1180918287, i32 1344049776, i32 553609048, i32 1580443894, i32 629649304, i32 -1266264776, i32 99807007, i32 5955764, i32 -1946737912, i32 39620447, i32 -152527805, i32 -1877116806, i32 448784075, i32 1086124775, i32 -1609984092, i32 1227951724, i32 1764356251, i32 64111306, i32 -960731419, i32 -100082026, i32 -39845375, i32 -1339022546, i32 2092649110, i32 -568315836, i32 -1089884900, i32 -81839914, i32 -1146103148, i32 -1846688624, i32 -784703072, i32 55004124, i32 -691960657, i32 1770461755, i32 -2032810463, i32 -1177788003, i32 -432352882, i32 -65824064, i32 575267217, i32 -1949367821, i32 356750287, i32 798819494, i32 -92022521, i32 1318001577, i32 -1192467086, i32 -1412716779], align 4
@.str = private unnamed_addr constant [5 x i8] c"%d, \00", align 1

; Function Attrs: nounwind
define void @bubblesort(i32* nocapture %ar, i32 %n) #0 {
entry:
  %cmp43 = icmp sgt i32 %n, 0
  br i1 %cmp43, label %for.cond1.preheader.lr.ph, label %for.body17.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %sub = add nsw i32 %n, -1
  %cmp241 = icmp sgt i32 %n, 1
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc12, %for.cond1.preheader.lr.ph
  %i.044 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc13, %for.inc12 ]
  br i1 %cmp241, label %for.body3.lr.ph, label %for.inc12

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  %.pre = load i32, i32* %ar, align 4, !tbaa !1
  br label %for.body3

for.body3:                                        ; preds = %for.cond1.backedge, %for.body3.lr.ph
  %0 = phi i32 [ %.pre, %for.body3.lr.ph ], [ %2, %for.cond1.backedge ]
  %j.042 = phi i32 [ 0, %for.body3.lr.ph ], [ %add, %for.cond1.backedge ]
  %add = add nuw nsw i32 %j.042, 1
  %arrayidx4 = getelementptr inbounds i32, i32* %ar, i32 %add
  %1 = load i32, i32* %arrayidx4, align 4, !tbaa !1
  %cmp5 = icmp sgt i32 %0, %1
  br i1 %cmp5, label %if.then, label %for.cond1.backedge

for.cond1.backedge:                               ; preds = %for.body3, %if.then
  %2 = phi i32 [ %1, %for.body3 ], [ %0, %if.then ]
  %exitcond45 = icmp eq i32 %add, %sub
  br i1 %exitcond45, label %for.inc12.loopexit, label %for.body3

if.then:                                          ; preds = %for.body3
  %arrayidx = getelementptr inbounds i32, i32* %ar, i32 %j.042
  store i32 %0, i32* %arrayidx4, align 4, !tbaa !1
  store i32 %1, i32* %arrayidx, align 4, !tbaa !1
  br label %for.cond1.backedge

for.inc12.loopexit:                               ; preds = %for.cond1.backedge
  br label %for.inc12

for.inc12:                                        ; preds = %for.inc12.loopexit, %for.cond1.preheader
  %inc13 = add nuw nsw i32 %i.044, 1
  %exitcond46 = icmp eq i32 %inc13, %n
  br i1 %exitcond46, label %for.body17.preheader.loopexit, label %for.cond1.preheader

for.body17.preheader.loopexit:                    ; preds = %for.inc12
  br label %for.body17.preheader

for.body17.preheader:                             ; preds = %for.body17.preheader.loopexit, %entry
  br label %for.body17

for.body17:                                       ; preds = %for.body17.preheader, %for.body17
  %i.140 = phi i32 [ %inc20, %for.body17 ], [ 0, %for.body17.preheader ]
  %arrayidx18 = getelementptr inbounds i32, i32* %ar, i32 %i.140
  %3 = load i32, i32* %arrayidx18, align 4, !tbaa !1
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32 %3) #1
  %inc20 = add nuw nsw i32 %i.140, 1
  %exitcond = icmp eq i32 %inc20, 64
  br i1 %exitcond, label %for.end21, label %for.body17

for.end21:                                        ; preds = %for.body17
  ret void
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #0

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %for.inc12.i, %entry
  %i.044.i = phi i32 [ 0, %entry ], [ %inc13.i, %for.inc12.i ]
  %.pre.i = load i32, i32* getelementptr inbounds ([64 x i32], [64 x i32]* @ar, i32 0, i32 0), align 4, !tbaa !1
  br label %for.body3.i

for.body3.i:                                      ; preds = %for.cond1.backedge.i, %for.cond1.preheader.i
  %0 = phi i32 [ %.pre.i, %for.cond1.preheader.i ], [ %2, %for.cond1.backedge.i ]
  %j.042.i = phi i32 [ 0, %for.cond1.preheader.i ], [ %add.i, %for.cond1.backedge.i ]
  %add.i = add nuw nsw i32 %j.042.i, 1
  %arrayidx4.i = getelementptr inbounds [64 x i32], [64 x i32]* @ar, i32 0, i32 %add.i
  %1 = load i32, i32* %arrayidx4.i, align 4, !tbaa !1
  %cmp5.i = icmp sgt i32 %0, %1
  br i1 %cmp5.i, label %if.then.i, label %for.cond1.backedge.i

for.cond1.backedge.i:                             ; preds = %if.then.i, %for.body3.i
  %2 = phi i32 [ %1, %for.body3.i ], [ %0, %if.then.i ]
  %exitcond45.i = icmp eq i32 %add.i, 63
  br i1 %exitcond45.i, label %for.inc12.i, label %for.body3.i

if.then.i:                                        ; preds = %for.body3.i
  %arrayidx.i = getelementptr inbounds [64 x i32], [64 x i32]* @ar, i32 0, i32 %j.042.i
  store i32 %0, i32* %arrayidx4.i, align 4, !tbaa !1
  store i32 %1, i32* %arrayidx.i, align 4, !tbaa !1
  br label %for.cond1.backedge.i

for.inc12.i:                                      ; preds = %for.cond1.backedge.i
  %inc13.i = add nuw nsw i32 %i.044.i, 1
  %exitcond46.i = icmp eq i32 %inc13.i, 64
  br i1 %exitcond46.i, label %for.body17.i.preheader, label %for.cond1.preheader.i

for.body17.i.preheader:                           ; preds = %for.inc12.i
  br label %for.body17.i

for.body17.i:                                     ; preds = %for.body17.i.preheader, %for.body17.i
  %i.140.i = phi i32 [ %inc20.i, %for.body17.i ], [ 0, %for.body17.i.preheader ]
  %arrayidx18.i = getelementptr inbounds [64 x i32], [64 x i32]* @ar, i32 0, i32 %i.140.i
  %3 = load i32, i32* %arrayidx18.i, align 4, !tbaa !1
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32 %3) #1
  %inc20.i = add nuw nsw i32 %i.140.i, 1
  %exitcond.i = icmp eq i32 %inc20.i, 64
  br i1 %exitcond.i, label %bubblesort.exit, label %for.body17.i

bubblesort.exit:                                  ; preds = %for.body17.i
  ret i32 0
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
