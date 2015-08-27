; ModuleID = 'cjpeg_print.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@data = global [8 x [8 x i64]] [[8 x i64] [i64 1, i64 2, i64 3, i64 4, i64 5, i64 6, i64 7, i64 8], [8 x i64] [i64 11, i64 22, i64 33, i64 40, i64 51, i64 62, i64 73, i64 84], [8 x i64] [i64 12, i64 23, i64 34, i64 41, i64 52, i64 63, i64 74, i64 85], [8 x i64] [i64 13, i64 24, i64 35, i64 42, i64 53, i64 64, i64 75, i64 86], [8 x i64] [i64 14, i64 25, i64 36, i64 43, i64 54, i64 65, i64 76, i64 87], [8 x i64] [i64 15, i64 26, i64 37, i64 44, i64 55, i64 66, i64 77, i64 88], [8 x i64] [i64 16, i64 27, i64 38, i64 45, i64 56, i64 67, i64 78, i64 89], [8 x i64] [i64 17, i64 28, i64 39, i64 46, i64 57, i64 68, i64 79, i64 80]], align 16
@data_ref = global [8 x [8 x i64]] [[8 x i64] [i64 2826, i64 -1313, i64 22, i64 -151, i64 -38, i64 -45, i64 9, i64 10], [8 x i64] [i64 -592, i64 215, i64 11, i64 12, i64 19, i64 -1, i64 4, i64 -6], [8 x i64] [i64 -447, i64 239, i64 -24, i64 43, i64 -8, i64 20, i64 -9, i64 3], [8 x i64] [i64 -394, i64 182, i64 9, i64 11, i64 16, i64 -1, i64 4, i64 -5], [8 x i64] [i64 -342, i64 183, i64 -18, i64 33, i64 -6, i64 15, i64 -7, i64 2], [8 x i64] [i64 -258, i64 122, i64 6, i64 7, i64 11, i64 -1, i64 2, i64 -3], [8 x i64] [i64 -185, i64 99, i64 -10, i64 18, i64 -3, i64 8, i64 -4, i64 1], [8 x i64] [i64 -90, i64 43, i64 2, i64 2, i64 4, i64 0, i64 1, i64 -1]], align 16
@i = global i32 0, align 4
@a = global i32 0, align 4
@.str = private unnamed_addr constant [5 x i8] c"%d!\0A\00", align 1
@.str1 = private unnamed_addr constant [10 x i8] c"Success!\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @jpeg_fdct_islow(i64* %data) #0 {
entry:
  %data.addr = alloca i64*, align 8
  %tmp0 = alloca i64, align 8
  %tmp1 = alloca i64, align 8
  %tmp2 = alloca i64, align 8
  %tmp3 = alloca i64, align 8
  %tmp4 = alloca i64, align 8
  %tmp5 = alloca i64, align 8
  %tmp6 = alloca i64, align 8
  %tmp7 = alloca i64, align 8
  %tmp10 = alloca i64, align 8
  %tmp11 = alloca i64, align 8
  %tmp12 = alloca i64, align 8
  %tmp13 = alloca i64, align 8
  %z1 = alloca i64, align 8
  %z2 = alloca i64, align 8
  %z3 = alloca i64, align 8
  %z4 = alloca i64, align 8
  %z5 = alloca i64, align 8
  %dataptr = alloca i64*, align 8
  %ctr = alloca i32, align 4
  store i64* %data, i64** %data.addr, align 8
  %0 = load i64*, i64** %data.addr, align 8
  store i64* %0, i64** %dataptr, align 8
  store i32 7, i32* %ctr, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %ctr, align 4
  %cmp = icmp sge i32 %1, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i64*, i64** %dataptr, align 8
  %arrayidx = getelementptr inbounds i64, i64* %2, i64 0
  %3 = load i64, i64* %arrayidx, align 8
  %4 = load i64*, i64** %dataptr, align 8
  %arrayidx1 = getelementptr inbounds i64, i64* %4, i64 7
  %5 = load i64, i64* %arrayidx1, align 8
  %add = add nsw i64 %3, %5
  store i64 %add, i64* %tmp0, align 8
  %6 = load i64*, i64** %dataptr, align 8
  %arrayidx2 = getelementptr inbounds i64, i64* %6, i64 0
  %7 = load i64, i64* %arrayidx2, align 8
  %8 = load i64*, i64** %dataptr, align 8
  %arrayidx3 = getelementptr inbounds i64, i64* %8, i64 7
  %9 = load i64, i64* %arrayidx3, align 8
  %sub = sub nsw i64 %7, %9
  store i64 %sub, i64* %tmp7, align 8
  %10 = load i64*, i64** %dataptr, align 8
  %arrayidx4 = getelementptr inbounds i64, i64* %10, i64 1
  %11 = load i64, i64* %arrayidx4, align 8
  %12 = load i64*, i64** %dataptr, align 8
  %arrayidx5 = getelementptr inbounds i64, i64* %12, i64 6
  %13 = load i64, i64* %arrayidx5, align 8
  %add6 = add nsw i64 %11, %13
  store i64 %add6, i64* %tmp1, align 8
  %14 = load i64*, i64** %dataptr, align 8
  %arrayidx7 = getelementptr inbounds i64, i64* %14, i64 1
  %15 = load i64, i64* %arrayidx7, align 8
  %16 = load i64*, i64** %dataptr, align 8
  %arrayidx8 = getelementptr inbounds i64, i64* %16, i64 6
  %17 = load i64, i64* %arrayidx8, align 8
  %sub9 = sub nsw i64 %15, %17
  store i64 %sub9, i64* %tmp6, align 8
  %18 = load i64*, i64** %dataptr, align 8
  %arrayidx10 = getelementptr inbounds i64, i64* %18, i64 2
  %19 = load i64, i64* %arrayidx10, align 8
  %20 = load i64*, i64** %dataptr, align 8
  %arrayidx11 = getelementptr inbounds i64, i64* %20, i64 5
  %21 = load i64, i64* %arrayidx11, align 8
  %add12 = add nsw i64 %19, %21
  store i64 %add12, i64* %tmp2, align 8
  %22 = load i64*, i64** %dataptr, align 8
  %arrayidx13 = getelementptr inbounds i64, i64* %22, i64 2
  %23 = load i64, i64* %arrayidx13, align 8
  %24 = load i64*, i64** %dataptr, align 8
  %arrayidx14 = getelementptr inbounds i64, i64* %24, i64 5
  %25 = load i64, i64* %arrayidx14, align 8
  %sub15 = sub nsw i64 %23, %25
  store i64 %sub15, i64* %tmp5, align 8
  %26 = load i64*, i64** %dataptr, align 8
  %arrayidx16 = getelementptr inbounds i64, i64* %26, i64 3
  %27 = load i64, i64* %arrayidx16, align 8
  %28 = load i64*, i64** %dataptr, align 8
  %arrayidx17 = getelementptr inbounds i64, i64* %28, i64 4
  %29 = load i64, i64* %arrayidx17, align 8
  %add18 = add nsw i64 %27, %29
  store i64 %add18, i64* %tmp3, align 8
  %30 = load i64*, i64** %dataptr, align 8
  %arrayidx19 = getelementptr inbounds i64, i64* %30, i64 3
  %31 = load i64, i64* %arrayidx19, align 8
  %32 = load i64*, i64** %dataptr, align 8
  %arrayidx20 = getelementptr inbounds i64, i64* %32, i64 4
  %33 = load i64, i64* %arrayidx20, align 8
  %sub21 = sub nsw i64 %31, %33
  store i64 %sub21, i64* %tmp4, align 8
  %34 = load i64, i64* %tmp0, align 8
  %35 = load i64, i64* %tmp3, align 8
  %add22 = add nsw i64 %34, %35
  store i64 %add22, i64* %tmp10, align 8
  %36 = load i64, i64* %tmp0, align 8
  %37 = load i64, i64* %tmp3, align 8
  %sub23 = sub nsw i64 %36, %37
  store i64 %sub23, i64* %tmp13, align 8
  %38 = load i64, i64* %tmp1, align 8
  %39 = load i64, i64* %tmp2, align 8
  %add24 = add nsw i64 %38, %39
  store i64 %add24, i64* %tmp11, align 8
  %40 = load i64, i64* %tmp1, align 8
  %41 = load i64, i64* %tmp2, align 8
  %sub25 = sub nsw i64 %40, %41
  store i64 %sub25, i64* %tmp12, align 8
  %42 = load i64, i64* %tmp10, align 8
  %43 = load i64, i64* %tmp11, align 8
  %add26 = add nsw i64 %42, %43
  %shl = shl i64 %add26, 1
  %44 = load i64*, i64** %dataptr, align 8
  %arrayidx27 = getelementptr inbounds i64, i64* %44, i64 0
  store i64 %shl, i64* %arrayidx27, align 8
  %45 = load i64, i64* %tmp10, align 8
  %46 = load i64, i64* %tmp11, align 8
  %sub28 = sub nsw i64 %45, %46
  %shl29 = shl i64 %sub28, 1
  %47 = load i64*, i64** %dataptr, align 8
  %arrayidx30 = getelementptr inbounds i64, i64* %47, i64 4
  store i64 %shl29, i64* %arrayidx30, align 8
  %48 = load i64, i64* %tmp12, align 8
  %49 = load i64, i64* %tmp13, align 8
  %add31 = add nsw i64 %48, %49
  %mul = mul nsw i64 %add31, 4433
  store i64 %mul, i64* %z1, align 8
  %50 = load i64, i64* %z1, align 8
  %51 = load i64, i64* %tmp13, align 8
  %mul32 = mul nsw i64 %51, 6270
  %add33 = add nsw i64 %50, %mul32
  %add34 = add nsw i64 %add33, 2048
  %shr = ashr i64 %add34, 12
  %52 = load i64*, i64** %dataptr, align 8
  %arrayidx35 = getelementptr inbounds i64, i64* %52, i64 2
  store i64 %shr, i64* %arrayidx35, align 8
  %53 = load i64, i64* %z1, align 8
  %54 = load i64, i64* %tmp12, align 8
  %mul36 = mul nsw i64 %54, -15137
  %add37 = add nsw i64 %53, %mul36
  %add38 = add nsw i64 %add37, 2048
  %shr39 = ashr i64 %add38, 12
  %55 = load i64*, i64** %dataptr, align 8
  %arrayidx40 = getelementptr inbounds i64, i64* %55, i64 6
  store i64 %shr39, i64* %arrayidx40, align 8
  %56 = load i64, i64* %tmp4, align 8
  %57 = load i64, i64* %tmp7, align 8
  %add41 = add nsw i64 %56, %57
  store i64 %add41, i64* %z1, align 8
  %58 = load i64, i64* %tmp5, align 8
  %59 = load i64, i64* %tmp6, align 8
  %add42 = add nsw i64 %58, %59
  store i64 %add42, i64* %z2, align 8
  %60 = load i64, i64* %tmp4, align 8
  %61 = load i64, i64* %tmp6, align 8
  %add43 = add nsw i64 %60, %61
  store i64 %add43, i64* %z3, align 8
  %62 = load i64, i64* %tmp5, align 8
  %63 = load i64, i64* %tmp7, align 8
  %add44 = add nsw i64 %62, %63
  store i64 %add44, i64* %z4, align 8
  %64 = load i64, i64* %z3, align 8
  %65 = load i64, i64* %z4, align 8
  %add45 = add nsw i64 %64, %65
  %mul46 = mul nsw i64 %add45, 9633
  store i64 %mul46, i64* %z5, align 8
  %66 = load i64, i64* %tmp4, align 8
  %mul47 = mul nsw i64 %66, 2446
  store i64 %mul47, i64* %tmp4, align 8
  %67 = load i64, i64* %tmp5, align 8
  %mul48 = mul nsw i64 %67, 16819
  store i64 %mul48, i64* %tmp5, align 8
  %68 = load i64, i64* %tmp6, align 8
  %mul49 = mul nsw i64 %68, 25172
  store i64 %mul49, i64* %tmp6, align 8
  %69 = load i64, i64* %tmp7, align 8
  %mul50 = mul nsw i64 %69, 12299
  store i64 %mul50, i64* %tmp7, align 8
  %70 = load i64, i64* %z1, align 8
  %mul51 = mul nsw i64 %70, -7373
  store i64 %mul51, i64* %z1, align 8
  %71 = load i64, i64* %z2, align 8
  %mul52 = mul nsw i64 %71, -20995
  store i64 %mul52, i64* %z2, align 8
  %72 = load i64, i64* %z3, align 8
  %mul53 = mul nsw i64 %72, -16069
  store i64 %mul53, i64* %z3, align 8
  %73 = load i64, i64* %z4, align 8
  %mul54 = mul nsw i64 %73, -3196
  store i64 %mul54, i64* %z4, align 8
  %74 = load i64, i64* %z5, align 8
  %75 = load i64, i64* %z3, align 8
  %add55 = add nsw i64 %75, %74
  store i64 %add55, i64* %z3, align 8
  %76 = load i64, i64* %z5, align 8
  %77 = load i64, i64* %z4, align 8
  %add56 = add nsw i64 %77, %76
  store i64 %add56, i64* %z4, align 8
  %78 = load i64, i64* %tmp4, align 8
  %79 = load i64, i64* %z1, align 8
  %add57 = add nsw i64 %78, %79
  %80 = load i64, i64* %z3, align 8
  %add58 = add nsw i64 %add57, %80
  %add59 = add nsw i64 %add58, 2048
  %shr60 = ashr i64 %add59, 12
  %81 = load i64*, i64** %dataptr, align 8
  %arrayidx61 = getelementptr inbounds i64, i64* %81, i64 7
  store i64 %shr60, i64* %arrayidx61, align 8
  %82 = load i64, i64* %tmp5, align 8
  %83 = load i64, i64* %z2, align 8
  %add62 = add nsw i64 %82, %83
  %84 = load i64, i64* %z4, align 8
  %add63 = add nsw i64 %add62, %84
  %add64 = add nsw i64 %add63, 2048
  %shr65 = ashr i64 %add64, 12
  %85 = load i64*, i64** %dataptr, align 8
  %arrayidx66 = getelementptr inbounds i64, i64* %85, i64 5
  store i64 %shr65, i64* %arrayidx66, align 8
  %86 = load i64, i64* %tmp6, align 8
  %87 = load i64, i64* %z2, align 8
  %add67 = add nsw i64 %86, %87
  %88 = load i64, i64* %z3, align 8
  %add68 = add nsw i64 %add67, %88
  %add69 = add nsw i64 %add68, 2048
  %shr70 = ashr i64 %add69, 12
  %89 = load i64*, i64** %dataptr, align 8
  %arrayidx71 = getelementptr inbounds i64, i64* %89, i64 3
  store i64 %shr70, i64* %arrayidx71, align 8
  %90 = load i64, i64* %tmp7, align 8
  %91 = load i64, i64* %z1, align 8
  %add72 = add nsw i64 %90, %91
  %92 = load i64, i64* %z4, align 8
  %add73 = add nsw i64 %add72, %92
  %add74 = add nsw i64 %add73, 2048
  %shr75 = ashr i64 %add74, 12
  %93 = load i64*, i64** %dataptr, align 8
  %arrayidx76 = getelementptr inbounds i64, i64* %93, i64 1
  store i64 %shr75, i64* %arrayidx76, align 8
  %94 = load i64*, i64** %dataptr, align 8
  %add.ptr = getelementptr inbounds i64, i64* %94, i64 8
  store i64* %add.ptr, i64** %dataptr, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %95 = load i32, i32* %ctr, align 4
  %dec = add nsw i32 %95, -1
  store i32 %dec, i32* %ctr, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %96 = load i64*, i64** %data.addr, align 8
  store i64* %96, i64** %dataptr, align 8
  store i32 7, i32* %ctr, align 4
  br label %for.cond77

for.cond77:                                       ; preds = %for.inc164, %for.end
  %97 = load i32, i32* %ctr, align 4
  %cmp78 = icmp sge i32 %97, 0
  br i1 %cmp78, label %for.body79, label %for.end166

for.body79:                                       ; preds = %for.cond77
  %98 = load i64*, i64** %dataptr, align 8
  %arrayidx80 = getelementptr inbounds i64, i64* %98, i64 0
  %99 = load i64, i64* %arrayidx80, align 8
  %100 = load i64*, i64** %dataptr, align 8
  %arrayidx81 = getelementptr inbounds i64, i64* %100, i64 56
  %101 = load i64, i64* %arrayidx81, align 8
  %add82 = add nsw i64 %99, %101
  store i64 %add82, i64* %tmp0, align 8
  %102 = load i64*, i64** %dataptr, align 8
  %arrayidx83 = getelementptr inbounds i64, i64* %102, i64 0
  %103 = load i64, i64* %arrayidx83, align 8
  %104 = load i64*, i64** %dataptr, align 8
  %arrayidx84 = getelementptr inbounds i64, i64* %104, i64 56
  %105 = load i64, i64* %arrayidx84, align 8
  %sub85 = sub nsw i64 %103, %105
  store i64 %sub85, i64* %tmp7, align 8
  %106 = load i64*, i64** %dataptr, align 8
  %arrayidx86 = getelementptr inbounds i64, i64* %106, i64 8
  %107 = load i64, i64* %arrayidx86, align 8
  %108 = load i64*, i64** %dataptr, align 8
  %arrayidx87 = getelementptr inbounds i64, i64* %108, i64 48
  %109 = load i64, i64* %arrayidx87, align 8
  %add88 = add nsw i64 %107, %109
  store i64 %add88, i64* %tmp1, align 8
  %110 = load i64*, i64** %dataptr, align 8
  %arrayidx89 = getelementptr inbounds i64, i64* %110, i64 8
  %111 = load i64, i64* %arrayidx89, align 8
  %112 = load i64*, i64** %dataptr, align 8
  %arrayidx90 = getelementptr inbounds i64, i64* %112, i64 48
  %113 = load i64, i64* %arrayidx90, align 8
  %sub91 = sub nsw i64 %111, %113
  store i64 %sub91, i64* %tmp6, align 8
  %114 = load i64*, i64** %dataptr, align 8
  %arrayidx92 = getelementptr inbounds i64, i64* %114, i64 16
  %115 = load i64, i64* %arrayidx92, align 8
  %116 = load i64*, i64** %dataptr, align 8
  %arrayidx93 = getelementptr inbounds i64, i64* %116, i64 40
  %117 = load i64, i64* %arrayidx93, align 8
  %add94 = add nsw i64 %115, %117
  store i64 %add94, i64* %tmp2, align 8
  %118 = load i64*, i64** %dataptr, align 8
  %arrayidx95 = getelementptr inbounds i64, i64* %118, i64 16
  %119 = load i64, i64* %arrayidx95, align 8
  %120 = load i64*, i64** %dataptr, align 8
  %arrayidx96 = getelementptr inbounds i64, i64* %120, i64 40
  %121 = load i64, i64* %arrayidx96, align 8
  %sub97 = sub nsw i64 %119, %121
  store i64 %sub97, i64* %tmp5, align 8
  %122 = load i64*, i64** %dataptr, align 8
  %arrayidx98 = getelementptr inbounds i64, i64* %122, i64 24
  %123 = load i64, i64* %arrayidx98, align 8
  %124 = load i64*, i64** %dataptr, align 8
  %arrayidx99 = getelementptr inbounds i64, i64* %124, i64 32
  %125 = load i64, i64* %arrayidx99, align 8
  %add100 = add nsw i64 %123, %125
  store i64 %add100, i64* %tmp3, align 8
  %126 = load i64*, i64** %dataptr, align 8
  %arrayidx101 = getelementptr inbounds i64, i64* %126, i64 24
  %127 = load i64, i64* %arrayidx101, align 8
  %128 = load i64*, i64** %dataptr, align 8
  %arrayidx102 = getelementptr inbounds i64, i64* %128, i64 32
  %129 = load i64, i64* %arrayidx102, align 8
  %sub103 = sub nsw i64 %127, %129
  store i64 %sub103, i64* %tmp4, align 8
  %130 = load i64, i64* %tmp0, align 8
  %131 = load i64, i64* %tmp3, align 8
  %add104 = add nsw i64 %130, %131
  store i64 %add104, i64* %tmp10, align 8
  %132 = load i64, i64* %tmp0, align 8
  %133 = load i64, i64* %tmp3, align 8
  %sub105 = sub nsw i64 %132, %133
  store i64 %sub105, i64* %tmp13, align 8
  %134 = load i64, i64* %tmp1, align 8
  %135 = load i64, i64* %tmp2, align 8
  %add106 = add nsw i64 %134, %135
  store i64 %add106, i64* %tmp11, align 8
  %136 = load i64, i64* %tmp1, align 8
  %137 = load i64, i64* %tmp2, align 8
  %sub107 = sub nsw i64 %136, %137
  store i64 %sub107, i64* %tmp12, align 8
  %138 = load i64, i64* %tmp10, align 8
  %139 = load i64, i64* %tmp11, align 8
  %add108 = add nsw i64 %138, %139
  %add109 = add nsw i64 %add108, 1
  %shr110 = ashr i64 %add109, 1
  %140 = load i64*, i64** %dataptr, align 8
  %arrayidx111 = getelementptr inbounds i64, i64* %140, i64 0
  store i64 %shr110, i64* %arrayidx111, align 8
  %141 = load i64, i64* %tmp10, align 8
  %142 = load i64, i64* %tmp11, align 8
  %sub112 = sub nsw i64 %141, %142
  %add113 = add nsw i64 %sub112, 1
  %shr114 = ashr i64 %add113, 1
  %143 = load i64*, i64** %dataptr, align 8
  %arrayidx115 = getelementptr inbounds i64, i64* %143, i64 32
  store i64 %shr114, i64* %arrayidx115, align 8
  %144 = load i64, i64* %tmp12, align 8
  %145 = load i64, i64* %tmp13, align 8
  %add116 = add nsw i64 %144, %145
  %mul117 = mul nsw i64 %add116, 4433
  store i64 %mul117, i64* %z1, align 8
  %146 = load i64, i64* %z1, align 8
  %147 = load i64, i64* %tmp13, align 8
  %mul118 = mul nsw i64 %147, 6270
  %add119 = add nsw i64 %146, %mul118
  %add120 = add nsw i64 %add119, 8192
  %shr121 = ashr i64 %add120, 14
  %148 = load i64*, i64** %dataptr, align 8
  %arrayidx122 = getelementptr inbounds i64, i64* %148, i64 16
  store i64 %shr121, i64* %arrayidx122, align 8
  %149 = load i64, i64* %z1, align 8
  %150 = load i64, i64* %tmp12, align 8
  %mul123 = mul nsw i64 %150, -15137
  %add124 = add nsw i64 %149, %mul123
  %add125 = add nsw i64 %add124, 8192
  %shr126 = ashr i64 %add125, 14
  %151 = load i64*, i64** %dataptr, align 8
  %arrayidx127 = getelementptr inbounds i64, i64* %151, i64 48
  store i64 %shr126, i64* %arrayidx127, align 8
  %152 = load i64, i64* %tmp4, align 8
  %153 = load i64, i64* %tmp7, align 8
  %add128 = add nsw i64 %152, %153
  store i64 %add128, i64* %z1, align 8
  %154 = load i64, i64* %tmp5, align 8
  %155 = load i64, i64* %tmp6, align 8
  %add129 = add nsw i64 %154, %155
  store i64 %add129, i64* %z2, align 8
  %156 = load i64, i64* %tmp4, align 8
  %157 = load i64, i64* %tmp6, align 8
  %add130 = add nsw i64 %156, %157
  store i64 %add130, i64* %z3, align 8
  %158 = load i64, i64* %tmp5, align 8
  %159 = load i64, i64* %tmp7, align 8
  %add131 = add nsw i64 %158, %159
  store i64 %add131, i64* %z4, align 8
  %160 = load i64, i64* %z3, align 8
  %161 = load i64, i64* %z4, align 8
  %add132 = add nsw i64 %160, %161
  %mul133 = mul nsw i64 %add132, 9633
  store i64 %mul133, i64* %z5, align 8
  %162 = load i64, i64* %tmp4, align 8
  %mul134 = mul nsw i64 %162, 2446
  store i64 %mul134, i64* %tmp4, align 8
  %163 = load i64, i64* %tmp5, align 8
  %mul135 = mul nsw i64 %163, 16819
  store i64 %mul135, i64* %tmp5, align 8
  %164 = load i64, i64* %tmp6, align 8
  %mul136 = mul nsw i64 %164, 25172
  store i64 %mul136, i64* %tmp6, align 8
  %165 = load i64, i64* %tmp7, align 8
  %mul137 = mul nsw i64 %165, 12299
  store i64 %mul137, i64* %tmp7, align 8
  %166 = load i64, i64* %z1, align 8
  %mul138 = mul nsw i64 %166, -7373
  store i64 %mul138, i64* %z1, align 8
  %167 = load i64, i64* %z2, align 8
  %mul139 = mul nsw i64 %167, -20995
  store i64 %mul139, i64* %z2, align 8
  %168 = load i64, i64* %z3, align 8
  %mul140 = mul nsw i64 %168, -16069
  store i64 %mul140, i64* %z3, align 8
  %169 = load i64, i64* %z4, align 8
  %mul141 = mul nsw i64 %169, -3196
  store i64 %mul141, i64* %z4, align 8
  %170 = load i64, i64* %z5, align 8
  %171 = load i64, i64* %z3, align 8
  %add142 = add nsw i64 %171, %170
  store i64 %add142, i64* %z3, align 8
  %172 = load i64, i64* %z5, align 8
  %173 = load i64, i64* %z4, align 8
  %add143 = add nsw i64 %173, %172
  store i64 %add143, i64* %z4, align 8
  %174 = load i64, i64* %tmp4, align 8
  %175 = load i64, i64* %z1, align 8
  %add144 = add nsw i64 %174, %175
  %176 = load i64, i64* %z3, align 8
  %add145 = add nsw i64 %add144, %176
  %add146 = add nsw i64 %add145, 8192
  %shr147 = ashr i64 %add146, 14
  %177 = load i64*, i64** %dataptr, align 8
  %arrayidx148 = getelementptr inbounds i64, i64* %177, i64 56
  store i64 %shr147, i64* %arrayidx148, align 8
  %178 = load i64, i64* %tmp5, align 8
  %179 = load i64, i64* %z2, align 8
  %add149 = add nsw i64 %178, %179
  %180 = load i64, i64* %z4, align 8
  %add150 = add nsw i64 %add149, %180
  %add151 = add nsw i64 %add150, 8192
  %shr152 = ashr i64 %add151, 14
  %181 = load i64*, i64** %dataptr, align 8
  %arrayidx153 = getelementptr inbounds i64, i64* %181, i64 40
  store i64 %shr152, i64* %arrayidx153, align 8
  %182 = load i64, i64* %tmp6, align 8
  %183 = load i64, i64* %z2, align 8
  %add154 = add nsw i64 %182, %183
  %184 = load i64, i64* %z3, align 8
  %add155 = add nsw i64 %add154, %184
  %add156 = add nsw i64 %add155, 8192
  %shr157 = ashr i64 %add156, 14
  %185 = load i64*, i64** %dataptr, align 8
  %arrayidx158 = getelementptr inbounds i64, i64* %185, i64 24
  store i64 %shr157, i64* %arrayidx158, align 8
  %186 = load i64, i64* %tmp7, align 8
  %187 = load i64, i64* %z1, align 8
  %add159 = add nsw i64 %186, %187
  %188 = load i64, i64* %z4, align 8
  %add160 = add nsw i64 %add159, %188
  %add161 = add nsw i64 %add160, 8192
  %shr162 = ashr i64 %add161, 14
  %189 = load i64*, i64** %dataptr, align 8
  %arrayidx163 = getelementptr inbounds i64, i64* %189, i64 8
  store i64 %shr162, i64* %arrayidx163, align 8
  %190 = load i64*, i64** %dataptr, align 8
  %incdec.ptr = getelementptr inbounds i64, i64* %190, i32 1
  store i64* %incdec.ptr, i64** %dataptr, align 8
  br label %for.inc164

for.inc164:                                       ; preds = %for.body79
  %191 = load i32, i32* %ctr, align 4
  %dec165 = add nsw i32 %191, -1
  store i32 %dec165, i32* %ctr, align 4
  br label %for.cond77

for.end166:                                       ; preds = %for.cond77
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* @i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc21, %entry
  %0 = load i32, i32* @i, align 4
  %cmp = icmp slt i32 %0, 1000
  br i1 %cmp, label %for.body, label %for.end23

for.body:                                         ; preds = %for.cond
  call void @jpeg_fdct_islow(i64* getelementptr inbounds ([8 x [8 x i64]], [8 x [8 x i64]]* @data, i32 0, i32 0, i32 0))
  %1 = load i32, i32* @i, align 4
  %cmp1 = icmp eq i32 %1, 0
  br i1 %cmp1, label %if.then, label %if.end20

if.then:                                          ; preds = %for.body
  store i32 0, i32* %j, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc17, %if.then
  %2 = load i32, i32* %j, align 4
  %cmp3 = icmp slt i32 %2, 8
  br i1 %cmp3, label %for.body4, label %for.end19

for.body4:                                        ; preds = %for.cond2
  store i32 0, i32* %k, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body4
  %3 = load i32, i32* %k, align 4
  %cmp6 = icmp slt i32 %3, 8
  br i1 %cmp6, label %for.body7, label %for.end

for.body7:                                        ; preds = %for.cond5
  %4 = load i32, i32* %k, align 4
  %idxprom = sext i32 %4 to i64
  %5 = load i32, i32* %j, align 4
  %idxprom8 = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds [8 x [8 x i64]], [8 x [8 x i64]]* @data, i32 0, i64 %idxprom8
  %arrayidx9 = getelementptr inbounds [8 x i64], [8 x i64]* %arrayidx, i32 0, i64 %idxprom
  %6 = load i64, i64* %arrayidx9, align 8
  %7 = load i32, i32* %k, align 4
  %idxprom10 = sext i32 %7 to i64
  %8 = load i32, i32* %j, align 4
  %idxprom11 = sext i32 %8 to i64
  %arrayidx12 = getelementptr inbounds [8 x [8 x i64]], [8 x [8 x i64]]* @data_ref, i32 0, i64 %idxprom11
  %arrayidx13 = getelementptr inbounds [8 x i64], [8 x i64]* %arrayidx12, i32 0, i64 %idxprom10
  %9 = load i64, i64* %arrayidx13, align 8
  %cmp14 = icmp ne i64 %6, %9
  br i1 %cmp14, label %if.then15, label %if.end

if.then15:                                        ; preds = %for.body7
  %10 = load i32, i32* %j, align 4
  %11 = load i32, i32* %k, align 4
  %add = add nsw i32 %10, %11
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32 %add)
  %12 = load i32, i32* %j, align 4
  %13 = load i32, i32* %k, align 4
  %add16 = add nsw i32 %12, %13
  store i32 %add16, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body7
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %14 = load i32, i32* %k, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  br label %for.inc17

for.inc17:                                        ; preds = %for.end
  %15 = load i32, i32* %j, align 4
  %inc18 = add nsw i32 %15, 1
  store i32 %inc18, i32* %j, align 4
  br label %for.cond2

for.end19:                                        ; preds = %for.cond2
  br label %if.end20

if.end20:                                         ; preds = %for.end19, %for.body
  br label %for.inc21

for.inc21:                                        ; preds = %if.end20
  %16 = load i32, i32* @i, align 4
  %inc22 = add nsw i32 %16, 1
  store i32 %inc22, i32* @i, align 4
  br label %for.cond

for.end23:                                        ; preds = %for.cond
  %call24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str1, i32 0, i32 0))
  store i32 -1, i32* %retval
  br label %return

return:                                           ; preds = %for.end23, %if.then15
  %17 = load i32, i32* %retval
  ret i32 %17
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
