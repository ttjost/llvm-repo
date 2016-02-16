; ModuleID = 'var_arg_v3.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@.str = private unnamed_addr constant [26 x i8] c"The largest value is: %d\0A\00", align 1

; Function Attrs: nounwind
define i32 @FindMax(i32 %n, ...) #0 {
entry:
  %vl = alloca i8*, align 4
  %vl1 = bitcast i8** %vl to i8*
  call void @llvm.va_start(i8* %vl1)
  %ap.cur = load i8*, i8** %vl, align 4
  %0 = bitcast i8* %ap.cur to i32*
  %ap.next = getelementptr i8, i8* %ap.cur, i32 4
  store i8* %ap.next, i8** %vl, align 4
  %1 = load i32, i32* %0, align 4
  %cmp10 = icmp sgt i32 %n, 1
  br i1 %cmp10, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.body
  %ap.cur2 = phi i8* [ %ap.next3, %for.body ], [ %ap.next, %for.body.preheader ]
  %largest.012 = phi i32 [ %cond, %for.body ], [ %1, %for.body.preheader ]
  %i.011 = phi i32 [ %inc, %for.body ], [ 1, %for.body.preheader ]
  %2 = bitcast i8* %ap.cur2 to i32*
  %ap.next3 = getelementptr i8, i8* %ap.cur2, i32 4
  store i8* %ap.next3, i8** %vl, align 4
  %3 = load i32, i32* %2, align 4
  %cmp4 = icmp sgt i32 %largest.012, %3
  %cond = select i1 %cmp4, i32 %largest.012, i32 %3
  %inc = add nuw nsw i32 %i.011, 1
  %exitcond = icmp eq i32 %inc, %n
  br i1 %exitcond, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %for.body
  %cond.lcssa = phi i32 [ %cond, %for.body ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %largest.0.lcssa = phi i32 [ %1, %entry ], [ %cond.lcssa, %for.end.loopexit ]
  call void @llvm.va_end(i8* %vl1)
  ret i32 %largest.0.lcssa
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #1

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #1

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %call = tail call i32 (i32, ...)* @FindMax(i32 4, i32 702, i32 422, i32 631, i32 834)
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str, i32 0, i32 0), i32 %call) #1
  %call2 = tail call i32 (i32, ...)* @FindMax(i32 7, i32 702, i32 422, i32 631, i32 834, i32 892, i32 104, i32 772)
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str, i32 0, i32 0), i32 %call2) #1
  %call4 = tail call i32 (i32, ...)* @FindMax(i32 10, i32 702, i32 422, i32 631, i32 834, i32 892, i32 104, i32 772, i32 100, i32 101, i32 102)
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str, i32 0, i32 0), i32 %call4) #1
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #0

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"}
