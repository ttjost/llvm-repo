; ModuleID = 'matrix_40x20.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@a = global [40 x [20 x i32]] [[20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [20 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1]], align 4
@b = global [20 x [40 x i32]] [[40 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [40 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [40 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [40 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [40 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [40 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [40 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [40 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [40 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [40 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [40 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [40 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [40 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [40 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [40 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [40 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [40 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [40 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [40 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1], [40 x i32] [i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 -1, i32 1, i32 1, i32 1, i32 -1, i32 1]], align 4
@c = common global [20 x [20 x i32]] zeroinitializer, align 4

; Function Attrs: nounwind
define i32 @matrix_mul() #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc15, %entry
  %i.029 = phi i32 [ 0, %entry ], [ %inc16, %for.inc15 ]
  %arrayidx7 = getelementptr inbounds [40 x [20 x i32]], [40 x [20 x i32]]* @a, i32 0, i32 %i.029, i32 0
  %arrayidx7.4.phi.trans.insert = getelementptr inbounds [40 x [20 x i32]], [40 x [20 x i32]]* @a, i32 0, i32 %i.029, i32 4
  %.pre = load i32, i32* %arrayidx7.4.phi.trans.insert, align 4, !tbaa !1
  %arrayidx7.5.phi.trans.insert = getelementptr inbounds [40 x [20 x i32]], [40 x [20 x i32]]* @a, i32 0, i32 %i.029, i32 5
  %.pre31 = load i32, i32* %arrayidx7.5.phi.trans.insert, align 4, !tbaa !1
  %arrayidx7.6.phi.trans.insert = getelementptr inbounds [40 x [20 x i32]], [40 x [20 x i32]]* @a, i32 0, i32 %i.029, i32 6
  %.pre32 = load i32, i32* %arrayidx7.6.phi.trans.insert, align 4, !tbaa !1
  %arrayidx7.7.phi.trans.insert = getelementptr inbounds [40 x [20 x i32]], [40 x [20 x i32]]* @a, i32 0, i32 %i.029, i32 7
  %.pre33 = load i32, i32* %arrayidx7.7.phi.trans.insert, align 4, !tbaa !1
  %arrayidx7.8.phi.trans.insert = getelementptr inbounds [40 x [20 x i32]], [40 x [20 x i32]]* @a, i32 0, i32 %i.029, i32 8
  %.pre34 = load i32, i32* %arrayidx7.8.phi.trans.insert, align 4, !tbaa !1
  %arrayidx7.9.phi.trans.insert = getelementptr inbounds [40 x [20 x i32]], [40 x [20 x i32]]* @a, i32 0, i32 %i.029, i32 9
  %.pre35 = load i32, i32* %arrayidx7.9.phi.trans.insert, align 4, !tbaa !1
  %arrayidx7.10.phi.trans.insert = getelementptr inbounds [40 x [20 x i32]], [40 x [20 x i32]]* @a, i32 0, i32 %i.029, i32 10
  %.pre36 = load i32, i32* %arrayidx7.10.phi.trans.insert, align 4, !tbaa !1
  %arrayidx7.11.phi.trans.insert = getelementptr inbounds [40 x [20 x i32]], [40 x [20 x i32]]* @a, i32 0, i32 %i.029, i32 11
  %.pre37 = load i32, i32* %arrayidx7.11.phi.trans.insert, align 4, !tbaa !1
  %arrayidx7.12.phi.trans.insert = getelementptr inbounds [40 x [20 x i32]], [40 x [20 x i32]]* @a, i32 0, i32 %i.029, i32 12
  %.pre38 = load i32, i32* %arrayidx7.12.phi.trans.insert, align 4, !tbaa !1
  %arrayidx7.13.phi.trans.insert = getelementptr inbounds [40 x [20 x i32]], [40 x [20 x i32]]* @a, i32 0, i32 %i.029, i32 13
  %.pre39 = load i32, i32* %arrayidx7.13.phi.trans.insert, align 4, !tbaa !1
  %arrayidx7.14.phi.trans.insert = getelementptr inbounds [40 x [20 x i32]], [40 x [20 x i32]]* @a, i32 0, i32 %i.029, i32 14
  %.pre40 = load i32, i32* %arrayidx7.14.phi.trans.insert, align 4, !tbaa !1
  %arrayidx7.15.phi.trans.insert = getelementptr inbounds [40 x [20 x i32]], [40 x [20 x i32]]* @a, i32 0, i32 %i.029, i32 15
  %.pre41 = load i32, i32* %arrayidx7.15.phi.trans.insert, align 4, !tbaa !1
  %arrayidx7.16.phi.trans.insert = getelementptr inbounds [40 x [20 x i32]], [40 x [20 x i32]]* @a, i32 0, i32 %i.029, i32 16
  %.pre42 = load i32, i32* %arrayidx7.16.phi.trans.insert, align 4, !tbaa !1
  %0 = load i32, i32* %arrayidx7, align 4, !tbaa !1
  %arrayidx7.1 = getelementptr inbounds [40 x [20 x i32]], [40 x [20 x i32]]* @a, i32 0, i32 %i.029, i32 1
  %1 = load i32, i32* %arrayidx7.1, align 4, !tbaa !1
  %arrayidx7.2 = getelementptr inbounds [40 x [20 x i32]], [40 x [20 x i32]]* @a, i32 0, i32 %i.029, i32 2
  %2 = load i32, i32* %arrayidx7.2, align 4, !tbaa !1
  %arrayidx7.3 = getelementptr inbounds [40 x [20 x i32]], [40 x [20 x i32]]* @a, i32 0, i32 %i.029, i32 3
  %3 = load i32, i32* %arrayidx7.3, align 4, !tbaa !1
  %arrayidx7.17 = getelementptr inbounds [40 x [20 x i32]], [40 x [20 x i32]]* @a, i32 0, i32 %i.029, i32 17
  %4 = load i32, i32* %arrayidx7.17, align 4, !tbaa !1
  %arrayidx7.18 = getelementptr inbounds [40 x [20 x i32]], [40 x [20 x i32]]* @a, i32 0, i32 %i.029, i32 18
  %5 = load i32, i32* %arrayidx7.18, align 4, !tbaa !1
  %arrayidx7.19 = getelementptr inbounds [40 x [20 x i32]], [40 x [20 x i32]]* @a, i32 0, i32 %i.029, i32 19
  %6 = load i32, i32* %arrayidx7.19, align 4, !tbaa !1
  %broadcast.splatinsert44 = insertelement <4 x i32> undef, i32 %0, i32 0
  %broadcast.splat45 = shufflevector <4 x i32> %broadcast.splatinsert44, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert47 = insertelement <4 x i32> undef, i32 %1, i32 0
  %broadcast.splat48 = shufflevector <4 x i32> %broadcast.splatinsert47, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert50 = insertelement <4 x i32> undef, i32 %2, i32 0
  %broadcast.splat51 = shufflevector <4 x i32> %broadcast.splatinsert50, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert53 = insertelement <4 x i32> undef, i32 %3, i32 0
  %broadcast.splat54 = shufflevector <4 x i32> %broadcast.splatinsert53, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert56 = insertelement <4 x i32> undef, i32 %.pre, i32 0
  %broadcast.splat57 = shufflevector <4 x i32> %broadcast.splatinsert56, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert59 = insertelement <4 x i32> undef, i32 %.pre31, i32 0
  %broadcast.splat60 = shufflevector <4 x i32> %broadcast.splatinsert59, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert62 = insertelement <4 x i32> undef, i32 %.pre32, i32 0
  %broadcast.splat63 = shufflevector <4 x i32> %broadcast.splatinsert62, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert65 = insertelement <4 x i32> undef, i32 %.pre33, i32 0
  %broadcast.splat66 = shufflevector <4 x i32> %broadcast.splatinsert65, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert68 = insertelement <4 x i32> undef, i32 %.pre34, i32 0
  %broadcast.splat69 = shufflevector <4 x i32> %broadcast.splatinsert68, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert71 = insertelement <4 x i32> undef, i32 %.pre35, i32 0
  %broadcast.splat72 = shufflevector <4 x i32> %broadcast.splatinsert71, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert74 = insertelement <4 x i32> undef, i32 %.pre36, i32 0
  %broadcast.splat75 = shufflevector <4 x i32> %broadcast.splatinsert74, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert77 = insertelement <4 x i32> undef, i32 %.pre37, i32 0
  %broadcast.splat78 = shufflevector <4 x i32> %broadcast.splatinsert77, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert80 = insertelement <4 x i32> undef, i32 %.pre38, i32 0
  %broadcast.splat81 = shufflevector <4 x i32> %broadcast.splatinsert80, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert83 = insertelement <4 x i32> undef, i32 %.pre39, i32 0
  %broadcast.splat84 = shufflevector <4 x i32> %broadcast.splatinsert83, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert86 = insertelement <4 x i32> undef, i32 %.pre40, i32 0
  %broadcast.splat87 = shufflevector <4 x i32> %broadcast.splatinsert86, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert89 = insertelement <4 x i32> undef, i32 %.pre41, i32 0
  %broadcast.splat90 = shufflevector <4 x i32> %broadcast.splatinsert89, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert92 = insertelement <4 x i32> undef, i32 %.pre42, i32 0
  %broadcast.splat93 = shufflevector <4 x i32> %broadcast.splatinsert92, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert95 = insertelement <4 x i32> undef, i32 %4, i32 0
  %broadcast.splat96 = shufflevector <4 x i32> %broadcast.splatinsert95, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert98 = insertelement <4 x i32> undef, i32 %5, i32 0
  %broadcast.splat99 = shufflevector <4 x i32> %broadcast.splatinsert98, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert101 = insertelement <4 x i32> undef, i32 %6, i32 0
  %broadcast.splat102 = shufflevector <4 x i32> %broadcast.splatinsert101, <4 x i32> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond1.preheader
  %index = phi i32 [ 0, %for.cond1.preheader ], [ %index.next, %vector.body ]
  %7 = getelementptr inbounds [20 x [20 x i32]], [20 x [20 x i32]]* @c, i32 0, i32 %i.029, i32 %index
  %8 = bitcast i32* %7 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %8, align 4, !tbaa !1
  %9 = getelementptr inbounds [20 x [40 x i32]], [20 x [40 x i32]]* @b, i32 0, i32 0, i32 %index
  %10 = bitcast i32* %9 to <4 x i32>*
  %wide.load43 = load <4 x i32>, <4 x i32>* %10, align 4, !tbaa !1
  %11 = mul nsw <4 x i32> %wide.load43, %broadcast.splat45
  %12 = add nsw <4 x i32> %wide.load, %11
  %13 = getelementptr inbounds [20 x [40 x i32]], [20 x [40 x i32]]* @b, i32 0, i32 1, i32 %index
  %14 = bitcast i32* %13 to <4 x i32>*
  %wide.load46 = load <4 x i32>, <4 x i32>* %14, align 4, !tbaa !1
  %15 = mul nsw <4 x i32> %wide.load46, %broadcast.splat48
  %16 = add nsw <4 x i32> %12, %15
  %17 = getelementptr inbounds [20 x [40 x i32]], [20 x [40 x i32]]* @b, i32 0, i32 2, i32 %index
  %18 = bitcast i32* %17 to <4 x i32>*
  %wide.load49 = load <4 x i32>, <4 x i32>* %18, align 4, !tbaa !1
  %19 = mul nsw <4 x i32> %wide.load49, %broadcast.splat51
  %20 = add nsw <4 x i32> %16, %19
  %21 = getelementptr inbounds [20 x [40 x i32]], [20 x [40 x i32]]* @b, i32 0, i32 3, i32 %index
  %22 = bitcast i32* %21 to <4 x i32>*
  %wide.load52 = load <4 x i32>, <4 x i32>* %22, align 4, !tbaa !1
  %23 = mul nsw <4 x i32> %wide.load52, %broadcast.splat54
  %24 = add nsw <4 x i32> %20, %23
  %25 = getelementptr inbounds [20 x [40 x i32]], [20 x [40 x i32]]* @b, i32 0, i32 4, i32 %index
  %26 = bitcast i32* %25 to <4 x i32>*
  %wide.load55 = load <4 x i32>, <4 x i32>* %26, align 4, !tbaa !1
  %27 = mul nsw <4 x i32> %wide.load55, %broadcast.splat57
  %28 = add nsw <4 x i32> %24, %27
  %29 = getelementptr inbounds [20 x [40 x i32]], [20 x [40 x i32]]* @b, i32 0, i32 5, i32 %index
  %30 = bitcast i32* %29 to <4 x i32>*
  %wide.load58 = load <4 x i32>, <4 x i32>* %30, align 4, !tbaa !1
  %31 = mul nsw <4 x i32> %wide.load58, %broadcast.splat60
  %32 = add nsw <4 x i32> %28, %31
  %33 = getelementptr inbounds [20 x [40 x i32]], [20 x [40 x i32]]* @b, i32 0, i32 6, i32 %index
  %34 = bitcast i32* %33 to <4 x i32>*
  %wide.load61 = load <4 x i32>, <4 x i32>* %34, align 4, !tbaa !1
  %35 = mul nsw <4 x i32> %wide.load61, %broadcast.splat63
  %36 = add nsw <4 x i32> %32, %35
  %37 = getelementptr inbounds [20 x [40 x i32]], [20 x [40 x i32]]* @b, i32 0, i32 7, i32 %index
  %38 = bitcast i32* %37 to <4 x i32>*
  %wide.load64 = load <4 x i32>, <4 x i32>* %38, align 4, !tbaa !1
  %39 = mul nsw <4 x i32> %wide.load64, %broadcast.splat66
  %40 = add nsw <4 x i32> %36, %39
  %41 = getelementptr inbounds [20 x [40 x i32]], [20 x [40 x i32]]* @b, i32 0, i32 8, i32 %index
  %42 = bitcast i32* %41 to <4 x i32>*
  %wide.load67 = load <4 x i32>, <4 x i32>* %42, align 4, !tbaa !1
  %43 = mul nsw <4 x i32> %wide.load67, %broadcast.splat69
  %44 = add nsw <4 x i32> %40, %43
  %45 = getelementptr inbounds [20 x [40 x i32]], [20 x [40 x i32]]* @b, i32 0, i32 9, i32 %index
  %46 = bitcast i32* %45 to <4 x i32>*
  %wide.load70 = load <4 x i32>, <4 x i32>* %46, align 4, !tbaa !1
  %47 = mul nsw <4 x i32> %wide.load70, %broadcast.splat72
  %48 = add nsw <4 x i32> %44, %47
  %49 = getelementptr inbounds [20 x [40 x i32]], [20 x [40 x i32]]* @b, i32 0, i32 10, i32 %index
  %50 = bitcast i32* %49 to <4 x i32>*
  %wide.load73 = load <4 x i32>, <4 x i32>* %50, align 4, !tbaa !1
  %51 = mul nsw <4 x i32> %wide.load73, %broadcast.splat75
  %52 = add nsw <4 x i32> %48, %51
  %53 = getelementptr inbounds [20 x [40 x i32]], [20 x [40 x i32]]* @b, i32 0, i32 11, i32 %index
  %54 = bitcast i32* %53 to <4 x i32>*
  %wide.load76 = load <4 x i32>, <4 x i32>* %54, align 4, !tbaa !1
  %55 = mul nsw <4 x i32> %wide.load76, %broadcast.splat78
  %56 = add nsw <4 x i32> %52, %55
  %57 = getelementptr inbounds [20 x [40 x i32]], [20 x [40 x i32]]* @b, i32 0, i32 12, i32 %index
  %58 = bitcast i32* %57 to <4 x i32>*
  %wide.load79 = load <4 x i32>, <4 x i32>* %58, align 4, !tbaa !1
  %59 = mul nsw <4 x i32> %wide.load79, %broadcast.splat81
  %60 = add nsw <4 x i32> %56, %59
  %61 = getelementptr inbounds [20 x [40 x i32]], [20 x [40 x i32]]* @b, i32 0, i32 13, i32 %index
  %62 = bitcast i32* %61 to <4 x i32>*
  %wide.load82 = load <4 x i32>, <4 x i32>* %62, align 4, !tbaa !1
  %63 = mul nsw <4 x i32> %wide.load82, %broadcast.splat84
  %64 = add nsw <4 x i32> %60, %63
  %65 = getelementptr inbounds [20 x [40 x i32]], [20 x [40 x i32]]* @b, i32 0, i32 14, i32 %index
  %66 = bitcast i32* %65 to <4 x i32>*
  %wide.load85 = load <4 x i32>, <4 x i32>* %66, align 4, !tbaa !1
  %67 = mul nsw <4 x i32> %wide.load85, %broadcast.splat87
  %68 = add nsw <4 x i32> %64, %67
  %69 = getelementptr inbounds [20 x [40 x i32]], [20 x [40 x i32]]* @b, i32 0, i32 15, i32 %index
  %70 = bitcast i32* %69 to <4 x i32>*
  %wide.load88 = load <4 x i32>, <4 x i32>* %70, align 4, !tbaa !1
  %71 = mul nsw <4 x i32> %wide.load88, %broadcast.splat90
  %72 = add nsw <4 x i32> %68, %71
  %73 = getelementptr inbounds [20 x [40 x i32]], [20 x [40 x i32]]* @b, i32 0, i32 16, i32 %index
  %74 = bitcast i32* %73 to <4 x i32>*
  %wide.load91 = load <4 x i32>, <4 x i32>* %74, align 4, !tbaa !1
  %75 = mul nsw <4 x i32> %wide.load91, %broadcast.splat93
  %76 = add nsw <4 x i32> %72, %75
  %77 = getelementptr inbounds [20 x [40 x i32]], [20 x [40 x i32]]* @b, i32 0, i32 17, i32 %index
  %78 = bitcast i32* %77 to <4 x i32>*
  %wide.load94 = load <4 x i32>, <4 x i32>* %78, align 4, !tbaa !1
  %79 = mul nsw <4 x i32> %wide.load94, %broadcast.splat96
  %80 = add nsw <4 x i32> %76, %79
  %81 = getelementptr inbounds [20 x [40 x i32]], [20 x [40 x i32]]* @b, i32 0, i32 18, i32 %index
  %82 = bitcast i32* %81 to <4 x i32>*
  %wide.load97 = load <4 x i32>, <4 x i32>* %82, align 4, !tbaa !1
  %83 = mul nsw <4 x i32> %wide.load97, %broadcast.splat99
  %84 = add nsw <4 x i32> %80, %83
  %85 = getelementptr inbounds [20 x [40 x i32]], [20 x [40 x i32]]* @b, i32 0, i32 19, i32 %index
  %86 = bitcast i32* %85 to <4 x i32>*
  %wide.load100 = load <4 x i32>, <4 x i32>* %86, align 4, !tbaa !1
  %87 = mul nsw <4 x i32> %wide.load100, %broadcast.splat102
  %88 = add nsw <4 x i32> %84, %87
  %89 = bitcast i32* %7 to <4 x i32>*
  store <4 x i32> %88, <4 x i32>* %89, align 4, !tbaa !1
  %index.next = add i32 %index, 4
  %90 = icmp eq i32 %index.next, 20
  br i1 %90, label %for.inc15, label %vector.body, !llvm.loop !5

for.inc15:                                        ; preds = %vector.body
  %inc16 = add nuw nsw i32 %i.029, 1
  %exitcond30 = icmp eq i32 %inc16, 40
  br i1 %exitcond30, label %for.end17, label %for.cond1.preheader

for.end17:                                        ; preds = %for.inc15
  ret i32 0
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %call = tail call i32 @matrix_mul()
  ret i32 0
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = distinct !{!5, !6, !7}
!6 = !{!"llvm.loop.vectorize.width", i32 1}
!7 = !{!"llvm.loop.interleave.count", i32 1}
