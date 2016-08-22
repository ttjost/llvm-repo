; ModuleID = 'float.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@a = global float 0x3FF3333340000000, align 4
@b = global float 0x4003333340000000, align 4
@c = common global float 0.000000e+00, align 4

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %0 = load float, float* @a, align 4
  %1 = load float, float* @b, align 4
  %mul = fmul float %0, %1
  store float %mul, float* @c, align 4
  ret i32 0
}

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.1 (tags/RELEASE_371/final)"}
