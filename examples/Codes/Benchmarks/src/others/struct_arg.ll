; ModuleID = 'struct_arg.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

%struct.syscallparams = type { [4 x i32], %struct.pt_regs }
%struct.pt_regs = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8, i32, [5 x i32] }

@.str = private unnamed_addr constant [5 x i8] c"%d\0A\0A\00", align 1

; Function Attrs: nounwind readonly
define i32 @st200_clone(i32 %clone_flags, i32 %newsp, i32* nocapture readonly %parent_tidptr, i32* nocapture readonly %child_tidptr, i32 %tls_value, i32 %arg8, i32 %arg9, i32 %arg10, %struct.syscallparams* byval nocapture readonly align 4 %params) #0 {
entry:
  %r1 = getelementptr inbounds %struct.syscallparams, %struct.syscallparams* %params, i32 0, i32 1, i32 2
  %0 = load i32, i32* %r1, align 4, !tbaa !1
  %cmp = icmp eq i32 %0, 0
  %add = add i32 %newsp, %clone_flags
  %1 = load i32, i32* %parent_tidptr, align 4, !tbaa !6
  %2 = load i32, i32* %child_tidptr, align 4, !tbaa !6
  %add2 = add i32 %add, %tls_value
  %add3 = add i32 %add2, %arg8
  %add4 = add i32 %add3, %arg9
  %add5 = add i32 %add4, %arg10
  %add6 = add i32 %add5, %1
  %add7 = add i32 %add6, %2
  %retval.0.v = select i1 %cmp, i32 1, i32 2
  %retval.0 = shl i32 %add7, %retval.0.v
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @main() #1 {
entry:
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32 242218) #2
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32 484436) #2
  ret i32 1
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #1

attributes #0 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"}
!1 = !{!2, !3, i64 8}
!2 = !{!"pt_regs", !3, i64 0, !3, i64 4, !3, i64 8, !3, i64 12, !3, i64 16, !3, i64 20, !3, i64 24, !3, i64 28, !3, i64 32, !3, i64 36, !3, i64 40, !3, i64 44, !3, i64 48, !3, i64 52, !3, i64 56, !3, i64 60, !3, i64 64, !3, i64 68, !3, i64 72, !3, i64 76, !3, i64 80, !3, i64 84, !3, i64 88, !3, i64 92, !3, i64 96, !3, i64 100, !3, i64 104, !3, i64 108, !3, i64 112, !3, i64 116, !3, i64 120, !3, i64 124, !3, i64 128, !3, i64 132, !3, i64 136, !3, i64 140, !3, i64 144, !3, i64 148, !3, i64 152, !3, i64 156, !3, i64 160, !3, i64 164, !3, i64 168, !3, i64 172, !3, i64 176, !3, i64 180, !3, i64 184, !3, i64 188, !3, i64 192, !3, i64 196, !3, i64 200, !3, i64 204, !3, i64 208, !3, i64 212, !3, i64 216, !3, i64 220, !3, i64 224, !3, i64 228, !3, i64 232, !3, i64 236, !3, i64 240, !3, i64 244, !3, i64 248, !3, i64 252, !3, i64 256, !4, i64 260, !3, i64 264, !4, i64 268}
!3 = !{!"long", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !4, i64 0}
