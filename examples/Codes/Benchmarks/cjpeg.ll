; ModuleID = 'cjpeg.c'
target datalayout = "E-m:m-p:32:32-i8:8:32-i16:16:32-i64:64-n32-S64"
target triple = "mips-unknown-linux-gnu"

@data = global [8 x [8 x i32]] [[8 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8], [8 x i32] [i32 11, i32 22, i32 33, i32 40, i32 51, i32 62, i32 73, i32 84], [8 x i32] [i32 12, i32 23, i32 34, i32 41, i32 52, i32 63, i32 74, i32 85], [8 x i32] [i32 13, i32 24, i32 35, i32 42, i32 53, i32 64, i32 75, i32 86], [8 x i32] [i32 14, i32 25, i32 36, i32 43, i32 54, i32 65, i32 76, i32 87], [8 x i32] [i32 15, i32 26, i32 37, i32 44, i32 55, i32 66, i32 77, i32 88], [8 x i32] [i32 16, i32 27, i32 38, i32 45, i32 56, i32 67, i32 78, i32 89], [8 x i32] [i32 17, i32 28, i32 39, i32 46, i32 57, i32 68, i32 79, i32 80]], align 4
@data_ref = global [8 x [8 x i32]] [[8 x i32] [i32 2826, i32 -1313, i32 22, i32 -151, i32 -38, i32 -45, i32 9, i32 10], [8 x i32] [i32 -592, i32 215, i32 11, i32 12, i32 19, i32 -1, i32 4, i32 -6], [8 x i32] [i32 -447, i32 239, i32 -24, i32 43, i32 -8, i32 20, i32 -9, i32 3], [8 x i32] [i32 -394, i32 182, i32 9, i32 11, i32 16, i32 -1, i32 4, i32 -5], [8 x i32] [i32 -342, i32 183, i32 -18, i32 33, i32 -6, i32 15, i32 -7, i32 2], [8 x i32] [i32 -258, i32 122, i32 6, i32 7, i32 11, i32 -1, i32 2, i32 -3], [8 x i32] [i32 -185, i32 99, i32 -10, i32 18, i32 -3, i32 8, i32 -4, i32 1], [8 x i32] [i32 -90, i32 43, i32 2, i32 2, i32 4, i32 0, i32 1, i32 -1]], align 4
@i = global i32 0, align 4
@a = global i32 0, align 4

; Function Attrs: nounwind
define void @jpeg_fdct_islow(i32* %data) #0 {
entry:
  %data.addr = alloca i32*, align 4
  %tmp0 = alloca i32, align 4
  %tmp1 = alloca i32, align 4
  %tmp2 = alloca i32, align 4
  %tmp3 = alloca i32, align 4
  %tmp4 = alloca i32, align 4
  %tmp5 = alloca i32, align 4
  %tmp6 = alloca i32, align 4
  %tmp7 = alloca i32, align 4
  %tmp10 = alloca i32, align 4
  %tmp11 = alloca i32, align 4
  %tmp12 = alloca i32, align 4
  %tmp13 = alloca i32, align 4
  %z1 = alloca i32, align 4
  %z2 = alloca i32, align 4
  %z3 = alloca i32, align 4
  %z4 = alloca i32, align 4
  %z5 = alloca i32, align 4
  %dataptr = alloca i32*, align 4
  %ctr = alloca i32, align 4
  store i32* %data, i32** %data.addr, align 4
  %0 = load i32*, i32** %data.addr, align 4
  store i32* %0, i32** %dataptr, align 4
  store i32 7, i32* %ctr, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %ctr, align 4
  %cmp = icmp sge i32 %1, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %dataptr, align 4
  %arrayidx = getelementptr inbounds i32, i32* %2, i32 0
  %3 = load i32, i32* %arrayidx, align 4
  %4 = load i32*, i32** %dataptr, align 4
  %arrayidx1 = getelementptr inbounds i32, i32* %4, i32 7
  %5 = load i32, i32* %arrayidx1, align 4
  %add = add nsw i32 %3, %5
  store i32 %add, i32* %tmp0, align 4
  %6 = load i32*, i32** %dataptr, align 4
  %arrayidx2 = getelementptr inbounds i32, i32* %6, i32 0
  %7 = load i32, i32* %arrayidx2, align 4
  %8 = load i32*, i32** %dataptr, align 4
  %arrayidx3 = getelementptr inbounds i32, i32* %8, i32 7
  %9 = load i32, i32* %arrayidx3, align 4
  %sub = sub nsw i32 %7, %9
  store i32 %sub, i32* %tmp7, align 4
  %10 = load i32*, i32** %dataptr, align 4
  %arrayidx4 = getelementptr inbounds i32, i32* %10, i32 1
  %11 = load i32, i32* %arrayidx4, align 4
  %12 = load i32*, i32** %dataptr, align 4
  %arrayidx5 = getelementptr inbounds i32, i32* %12, i32 6
  %13 = load i32, i32* %arrayidx5, align 4
  %add6 = add nsw i32 %11, %13
  store i32 %add6, i32* %tmp1, align 4
  %14 = load i32*, i32** %dataptr, align 4
  %arrayidx7 = getelementptr inbounds i32, i32* %14, i32 1
  %15 = load i32, i32* %arrayidx7, align 4
  %16 = load i32*, i32** %dataptr, align 4
  %arrayidx8 = getelementptr inbounds i32, i32* %16, i32 6
  %17 = load i32, i32* %arrayidx8, align 4
  %sub9 = sub nsw i32 %15, %17
  store i32 %sub9, i32* %tmp6, align 4
  %18 = load i32*, i32** %dataptr, align 4
  %arrayidx10 = getelementptr inbounds i32, i32* %18, i32 2
  %19 = load i32, i32* %arrayidx10, align 4
  %20 = load i32*, i32** %dataptr, align 4
  %arrayidx11 = getelementptr inbounds i32, i32* %20, i32 5
  %21 = load i32, i32* %arrayidx11, align 4
  %add12 = add nsw i32 %19, %21
  store i32 %add12, i32* %tmp2, align 4
  %22 = load i32*, i32** %dataptr, align 4
  %arrayidx13 = getelementptr inbounds i32, i32* %22, i32 2
  %23 = load i32, i32* %arrayidx13, align 4
  %24 = load i32*, i32** %dataptr, align 4
  %arrayidx14 = getelementptr inbounds i32, i32* %24, i32 5
  %25 = load i32, i32* %arrayidx14, align 4
  %sub15 = sub nsw i32 %23, %25
  store i32 %sub15, i32* %tmp5, align 4
  %26 = load i32*, i32** %dataptr, align 4
  %arrayidx16 = getelementptr inbounds i32, i32* %26, i32 3
  %27 = load i32, i32* %arrayidx16, align 4
  %28 = load i32*, i32** %dataptr, align 4
  %arrayidx17 = getelementptr inbounds i32, i32* %28, i32 4
  %29 = load i32, i32* %arrayidx17, align 4
  %add18 = add nsw i32 %27, %29
  store i32 %add18, i32* %tmp3, align 4
  %30 = load i32*, i32** %dataptr, align 4
  %arrayidx19 = getelementptr inbounds i32, i32* %30, i32 3
  %31 = load i32, i32* %arrayidx19, align 4
  %32 = load i32*, i32** %dataptr, align 4
  %arrayidx20 = getelementptr inbounds i32, i32* %32, i32 4
  %33 = load i32, i32* %arrayidx20, align 4
  %sub21 = sub nsw i32 %31, %33
  store i32 %sub21, i32* %tmp4, align 4
  %34 = load i32, i32* %tmp0, align 4
  %35 = load i32, i32* %tmp3, align 4
  %add22 = add nsw i32 %34, %35
  store i32 %add22, i32* %tmp10, align 4
  %36 = load i32, i32* %tmp0, align 4
  %37 = load i32, i32* %tmp3, align 4
  %sub23 = sub nsw i32 %36, %37
  store i32 %sub23, i32* %tmp13, align 4
  %38 = load i32, i32* %tmp1, align 4
  %39 = load i32, i32* %tmp2, align 4
  %add24 = add nsw i32 %38, %39
  store i32 %add24, i32* %tmp11, align 4
  %40 = load i32, i32* %tmp1, align 4
  %41 = load i32, i32* %tmp2, align 4
  %sub25 = sub nsw i32 %40, %41
  store i32 %sub25, i32* %tmp12, align 4
  %42 = load i32, i32* %tmp10, align 4
  %43 = load i32, i32* %tmp11, align 4
  %add26 = add nsw i32 %42, %43
  %shl = shl i32 %add26, 1
  %44 = load i32*, i32** %dataptr, align 4
  %arrayidx27 = getelementptr inbounds i32, i32* %44, i32 0
  store i32 %shl, i32* %arrayidx27, align 4
  %45 = load i32, i32* %tmp10, align 4
  %46 = load i32, i32* %tmp11, align 4
  %sub28 = sub nsw i32 %45, %46
  %shl29 = shl i32 %sub28, 1
  %47 = load i32*, i32** %dataptr, align 4
  %arrayidx30 = getelementptr inbounds i32, i32* %47, i32 4
  store i32 %shl29, i32* %arrayidx30, align 4
  %48 = load i32, i32* %tmp12, align 4
  %49 = load i32, i32* %tmp13, align 4
  %add31 = add nsw i32 %48, %49
  %mul = mul nsw i32 %add31, 4433
  store i32 %mul, i32* %z1, align 4
  %50 = load i32, i32* %z1, align 4
  %51 = load i32, i32* %tmp13, align 4
  %mul32 = mul nsw i32 %51, 6270
  %add33 = add nsw i32 %50, %mul32
  %add34 = add nsw i32 %add33, 2048
  %shr = ashr i32 %add34, 12
  %52 = load i32*, i32** %dataptr, align 4
  %arrayidx35 = getelementptr inbounds i32, i32* %52, i32 2
  store i32 %shr, i32* %arrayidx35, align 4
  %53 = load i32, i32* %z1, align 4
  %54 = load i32, i32* %tmp12, align 4
  %mul36 = mul nsw i32 %54, -15137
  %add37 = add nsw i32 %53, %mul36
  %add38 = add nsw i32 %add37, 2048
  %shr39 = ashr i32 %add38, 12
  %55 = load i32*, i32** %dataptr, align 4
  %arrayidx40 = getelementptr inbounds i32, i32* %55, i32 6
  store i32 %shr39, i32* %arrayidx40, align 4
  %56 = load i32, i32* %tmp4, align 4
  %57 = load i32, i32* %tmp7, align 4
  %add41 = add nsw i32 %56, %57
  store i32 %add41, i32* %z1, align 4
  %58 = load i32, i32* %tmp5, align 4
  %59 = load i32, i32* %tmp6, align 4
  %add42 = add nsw i32 %58, %59
  store i32 %add42, i32* %z2, align 4
  %60 = load i32, i32* %tmp4, align 4
  %61 = load i32, i32* %tmp6, align 4
  %add43 = add nsw i32 %60, %61
  store i32 %add43, i32* %z3, align 4
  %62 = load i32, i32* %tmp5, align 4
  %63 = load i32, i32* %tmp7, align 4
  %add44 = add nsw i32 %62, %63
  store i32 %add44, i32* %z4, align 4
  %64 = load i32, i32* %z3, align 4
  %65 = load i32, i32* %z4, align 4
  %add45 = add nsw i32 %64, %65
  %mul46 = mul nsw i32 %add45, 9633
  store i32 %mul46, i32* %z5, align 4
  %66 = load i32, i32* %tmp4, align 4
  %mul47 = mul nsw i32 %66, 2446
  store i32 %mul47, i32* %tmp4, align 4
  %67 = load i32, i32* %tmp5, align 4
  %mul48 = mul nsw i32 %67, 16819
  store i32 %mul48, i32* %tmp5, align 4
  %68 = load i32, i32* %tmp6, align 4
  %mul49 = mul nsw i32 %68, 25172
  store i32 %mul49, i32* %tmp6, align 4
  %69 = load i32, i32* %tmp7, align 4
  %mul50 = mul nsw i32 %69, 12299
  store i32 %mul50, i32* %tmp7, align 4
  %70 = load i32, i32* %z1, align 4
  %mul51 = mul nsw i32 %70, -7373
  store i32 %mul51, i32* %z1, align 4
  %71 = load i32, i32* %z2, align 4
  %mul52 = mul nsw i32 %71, -20995
  store i32 %mul52, i32* %z2, align 4
  %72 = load i32, i32* %z3, align 4
  %mul53 = mul nsw i32 %72, -16069
  store i32 %mul53, i32* %z3, align 4
  %73 = load i32, i32* %z4, align 4
  %mul54 = mul nsw i32 %73, -3196
  store i32 %mul54, i32* %z4, align 4
  %74 = load i32, i32* %z5, align 4
  %75 = load i32, i32* %z3, align 4
  %add55 = add nsw i32 %75, %74
  store i32 %add55, i32* %z3, align 4
  %76 = load i32, i32* %z5, align 4
  %77 = load i32, i32* %z4, align 4
  %add56 = add nsw i32 %77, %76
  store i32 %add56, i32* %z4, align 4
  %78 = load i32, i32* %tmp4, align 4
  %79 = load i32, i32* %z1, align 4
  %add57 = add nsw i32 %78, %79
  %80 = load i32, i32* %z3, align 4
  %add58 = add nsw i32 %add57, %80
  %add59 = add nsw i32 %add58, 2048
  %shr60 = ashr i32 %add59, 12
  %81 = load i32*, i32** %dataptr, align 4
  %arrayidx61 = getelementptr inbounds i32, i32* %81, i32 7
  store i32 %shr60, i32* %arrayidx61, align 4
  %82 = load i32, i32* %tmp5, align 4
  %83 = load i32, i32* %z2, align 4
  %add62 = add nsw i32 %82, %83
  %84 = load i32, i32* %z4, align 4
  %add63 = add nsw i32 %add62, %84
  %add64 = add nsw i32 %add63, 2048
  %shr65 = ashr i32 %add64, 12
  %85 = load i32*, i32** %dataptr, align 4
  %arrayidx66 = getelementptr inbounds i32, i32* %85, i32 5
  store i32 %shr65, i32* %arrayidx66, align 4
  %86 = load i32, i32* %tmp6, align 4
  %87 = load i32, i32* %z2, align 4
  %add67 = add nsw i32 %86, %87
  %88 = load i32, i32* %z3, align 4
  %add68 = add nsw i32 %add67, %88
  %add69 = add nsw i32 %add68, 2048
  %shr70 = ashr i32 %add69, 12
  %89 = load i32*, i32** %dataptr, align 4
  %arrayidx71 = getelementptr inbounds i32, i32* %89, i32 3
  store i32 %shr70, i32* %arrayidx71, align 4
  %90 = load i32, i32* %tmp7, align 4
  %91 = load i32, i32* %z1, align 4
  %add72 = add nsw i32 %90, %91
  %92 = load i32, i32* %z4, align 4
  %add73 = add nsw i32 %add72, %92
  %add74 = add nsw i32 %add73, 2048
  %shr75 = ashr i32 %add74, 12
  %93 = load i32*, i32** %dataptr, align 4
  %arrayidx76 = getelementptr inbounds i32, i32* %93, i32 1
  store i32 %shr75, i32* %arrayidx76, align 4
  %94 = load i32*, i32** %dataptr, align 4
  %add.ptr = getelementptr inbounds i32, i32* %94, i32 8
  store i32* %add.ptr, i32** %dataptr, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %95 = load i32, i32* %ctr, align 4
  %dec = add nsw i32 %95, -1
  store i32 %dec, i32* %ctr, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %96 = load i32*, i32** %data.addr, align 4
  store i32* %96, i32** %dataptr, align 4
  store i32 7, i32* %ctr, align 4
  br label %for.cond77

for.cond77:                                       ; preds = %for.inc164, %for.end
  %97 = load i32, i32* %ctr, align 4
  %cmp78 = icmp sge i32 %97, 0
  br i1 %cmp78, label %for.body79, label %for.end166

for.body79:                                       ; preds = %for.cond77
  %98 = load i32*, i32** %dataptr, align 4
  %arrayidx80 = getelementptr inbounds i32, i32* %98, i32 0
  %99 = load i32, i32* %arrayidx80, align 4
  %100 = load i32*, i32** %dataptr, align 4
  %arrayidx81 = getelementptr inbounds i32, i32* %100, i32 56
  %101 = load i32, i32* %arrayidx81, align 4
  %add82 = add nsw i32 %99, %101
  store i32 %add82, i32* %tmp0, align 4
  %102 = load i32*, i32** %dataptr, align 4
  %arrayidx83 = getelementptr inbounds i32, i32* %102, i32 0
  %103 = load i32, i32* %arrayidx83, align 4
  %104 = load i32*, i32** %dataptr, align 4
  %arrayidx84 = getelementptr inbounds i32, i32* %104, i32 56
  %105 = load i32, i32* %arrayidx84, align 4
  %sub85 = sub nsw i32 %103, %105
  store i32 %sub85, i32* %tmp7, align 4
  %106 = load i32*, i32** %dataptr, align 4
  %arrayidx86 = getelementptr inbounds i32, i32* %106, i32 8
  %107 = load i32, i32* %arrayidx86, align 4
  %108 = load i32*, i32** %dataptr, align 4
  %arrayidx87 = getelementptr inbounds i32, i32* %108, i32 48
  %109 = load i32, i32* %arrayidx87, align 4
  %add88 = add nsw i32 %107, %109
  store i32 %add88, i32* %tmp1, align 4
  %110 = load i32*, i32** %dataptr, align 4
  %arrayidx89 = getelementptr inbounds i32, i32* %110, i32 8
  %111 = load i32, i32* %arrayidx89, align 4
  %112 = load i32*, i32** %dataptr, align 4
  %arrayidx90 = getelementptr inbounds i32, i32* %112, i32 48
  %113 = load i32, i32* %arrayidx90, align 4
  %sub91 = sub nsw i32 %111, %113
  store i32 %sub91, i32* %tmp6, align 4
  %114 = load i32*, i32** %dataptr, align 4
  %arrayidx92 = getelementptr inbounds i32, i32* %114, i32 16
  %115 = load i32, i32* %arrayidx92, align 4
  %116 = load i32*, i32** %dataptr, align 4
  %arrayidx93 = getelementptr inbounds i32, i32* %116, i32 40
  %117 = load i32, i32* %arrayidx93, align 4
  %add94 = add nsw i32 %115, %117
  store i32 %add94, i32* %tmp2, align 4
  %118 = load i32*, i32** %dataptr, align 4
  %arrayidx95 = getelementptr inbounds i32, i32* %118, i32 16
  %119 = load i32, i32* %arrayidx95, align 4
  %120 = load i32*, i32** %dataptr, align 4
  %arrayidx96 = getelementptr inbounds i32, i32* %120, i32 40
  %121 = load i32, i32* %arrayidx96, align 4
  %sub97 = sub nsw i32 %119, %121
  store i32 %sub97, i32* %tmp5, align 4
  %122 = load i32*, i32** %dataptr, align 4
  %arrayidx98 = getelementptr inbounds i32, i32* %122, i32 24
  %123 = load i32, i32* %arrayidx98, align 4
  %124 = load i32*, i32** %dataptr, align 4
  %arrayidx99 = getelementptr inbounds i32, i32* %124, i32 32
  %125 = load i32, i32* %arrayidx99, align 4
  %add100 = add nsw i32 %123, %125
  store i32 %add100, i32* %tmp3, align 4
  %126 = load i32*, i32** %dataptr, align 4
  %arrayidx101 = getelementptr inbounds i32, i32* %126, i32 24
  %127 = load i32, i32* %arrayidx101, align 4
  %128 = load i32*, i32** %dataptr, align 4
  %arrayidx102 = getelementptr inbounds i32, i32* %128, i32 32
  %129 = load i32, i32* %arrayidx102, align 4
  %sub103 = sub nsw i32 %127, %129
  store i32 %sub103, i32* %tmp4, align 4
  %130 = load i32, i32* %tmp0, align 4
  %131 = load i32, i32* %tmp3, align 4
  %add104 = add nsw i32 %130, %131
  store i32 %add104, i32* %tmp10, align 4
  %132 = load i32, i32* %tmp0, align 4
  %133 = load i32, i32* %tmp3, align 4
  %sub105 = sub nsw i32 %132, %133
  store i32 %sub105, i32* %tmp13, align 4
  %134 = load i32, i32* %tmp1, align 4
  %135 = load i32, i32* %tmp2, align 4
  %add106 = add nsw i32 %134, %135
  store i32 %add106, i32* %tmp11, align 4
  %136 = load i32, i32* %tmp1, align 4
  %137 = load i32, i32* %tmp2, align 4
  %sub107 = sub nsw i32 %136, %137
  store i32 %sub107, i32* %tmp12, align 4
  %138 = load i32, i32* %tmp10, align 4
  %139 = load i32, i32* %tmp11, align 4
  %add108 = add nsw i32 %138, %139
  %add109 = add nsw i32 %add108, 1
  %shr110 = ashr i32 %add109, 1
  %140 = load i32*, i32** %dataptr, align 4
  %arrayidx111 = getelementptr inbounds i32, i32* %140, i32 0
  store i32 %shr110, i32* %arrayidx111, align 4
  %141 = load i32, i32* %tmp10, align 4
  %142 = load i32, i32* %tmp11, align 4
  %sub112 = sub nsw i32 %141, %142
  %add113 = add nsw i32 %sub112, 1
  %shr114 = ashr i32 %add113, 1
  %143 = load i32*, i32** %dataptr, align 4
  %arrayidx115 = getelementptr inbounds i32, i32* %143, i32 32
  store i32 %shr114, i32* %arrayidx115, align 4
  %144 = load i32, i32* %tmp12, align 4
  %145 = load i32, i32* %tmp13, align 4
  %add116 = add nsw i32 %144, %145
  %mul117 = mul nsw i32 %add116, 4433
  store i32 %mul117, i32* %z1, align 4
  %146 = load i32, i32* %z1, align 4
  %147 = load i32, i32* %tmp13, align 4
  %mul118 = mul nsw i32 %147, 6270
  %add119 = add nsw i32 %146, %mul118
  %add120 = add nsw i32 %add119, 8192
  %shr121 = ashr i32 %add120, 14
  %148 = load i32*, i32** %dataptr, align 4
  %arrayidx122 = getelementptr inbounds i32, i32* %148, i32 16
  store i32 %shr121, i32* %arrayidx122, align 4
  %149 = load i32, i32* %z1, align 4
  %150 = load i32, i32* %tmp12, align 4
  %mul123 = mul nsw i32 %150, -15137
  %add124 = add nsw i32 %149, %mul123
  %add125 = add nsw i32 %add124, 8192
  %shr126 = ashr i32 %add125, 14
  %151 = load i32*, i32** %dataptr, align 4
  %arrayidx127 = getelementptr inbounds i32, i32* %151, i32 48
  store i32 %shr126, i32* %arrayidx127, align 4
  %152 = load i32, i32* %tmp4, align 4
  %153 = load i32, i32* %tmp7, align 4
  %add128 = add nsw i32 %152, %153
  store i32 %add128, i32* %z1, align 4
  %154 = load i32, i32* %tmp5, align 4
  %155 = load i32, i32* %tmp6, align 4
  %add129 = add nsw i32 %154, %155
  store i32 %add129, i32* %z2, align 4
  %156 = load i32, i32* %tmp4, align 4
  %157 = load i32, i32* %tmp6, align 4
  %add130 = add nsw i32 %156, %157
  store i32 %add130, i32* %z3, align 4
  %158 = load i32, i32* %tmp5, align 4
  %159 = load i32, i32* %tmp7, align 4
  %add131 = add nsw i32 %158, %159
  store i32 %add131, i32* %z4, align 4
  %160 = load i32, i32* %z3, align 4
  %161 = load i32, i32* %z4, align 4
  %add132 = add nsw i32 %160, %161
  %mul133 = mul nsw i32 %add132, 9633
  store i32 %mul133, i32* %z5, align 4
  %162 = load i32, i32* %tmp4, align 4
  %mul134 = mul nsw i32 %162, 2446
  store i32 %mul134, i32* %tmp4, align 4
  %163 = load i32, i32* %tmp5, align 4
  %mul135 = mul nsw i32 %163, 16819
  store i32 %mul135, i32* %tmp5, align 4
  %164 = load i32, i32* %tmp6, align 4
  %mul136 = mul nsw i32 %164, 25172
  store i32 %mul136, i32* %tmp6, align 4
  %165 = load i32, i32* %tmp7, align 4
  %mul137 = mul nsw i32 %165, 12299
  store i32 %mul137, i32* %tmp7, align 4
  %166 = load i32, i32* %z1, align 4
  %mul138 = mul nsw i32 %166, -7373
  store i32 %mul138, i32* %z1, align 4
  %167 = load i32, i32* %z2, align 4
  %mul139 = mul nsw i32 %167, -20995
  store i32 %mul139, i32* %z2, align 4
  %168 = load i32, i32* %z3, align 4
  %mul140 = mul nsw i32 %168, -16069
  store i32 %mul140, i32* %z3, align 4
  %169 = load i32, i32* %z4, align 4
  %mul141 = mul nsw i32 %169, -3196
  store i32 %mul141, i32* %z4, align 4
  %170 = load i32, i32* %z5, align 4
  %171 = load i32, i32* %z3, align 4
  %add142 = add nsw i32 %171, %170
  store i32 %add142, i32* %z3, align 4
  %172 = load i32, i32* %z5, align 4
  %173 = load i32, i32* %z4, align 4
  %add143 = add nsw i32 %173, %172
  store i32 %add143, i32* %z4, align 4
  %174 = load i32, i32* %tmp4, align 4
  %175 = load i32, i32* %z1, align 4
  %add144 = add nsw i32 %174, %175
  %176 = load i32, i32* %z3, align 4
  %add145 = add nsw i32 %add144, %176
  %add146 = add nsw i32 %add145, 8192
  %shr147 = ashr i32 %add146, 14
  %177 = load i32*, i32** %dataptr, align 4
  %arrayidx148 = getelementptr inbounds i32, i32* %177, i32 56
  store i32 %shr147, i32* %arrayidx148, align 4
  %178 = load i32, i32* %tmp5, align 4
  %179 = load i32, i32* %z2, align 4
  %add149 = add nsw i32 %178, %179
  %180 = load i32, i32* %z4, align 4
  %add150 = add nsw i32 %add149, %180
  %add151 = add nsw i32 %add150, 8192
  %shr152 = ashr i32 %add151, 14
  %181 = load i32*, i32** %dataptr, align 4
  %arrayidx153 = getelementptr inbounds i32, i32* %181, i32 40
  store i32 %shr152, i32* %arrayidx153, align 4
  %182 = load i32, i32* %tmp6, align 4
  %183 = load i32, i32* %z2, align 4
  %add154 = add nsw i32 %182, %183
  %184 = load i32, i32* %z3, align 4
  %add155 = add nsw i32 %add154, %184
  %add156 = add nsw i32 %add155, 8192
  %shr157 = ashr i32 %add156, 14
  %185 = load i32*, i32** %dataptr, align 4
  %arrayidx158 = getelementptr inbounds i32, i32* %185, i32 24
  store i32 %shr157, i32* %arrayidx158, align 4
  %186 = load i32, i32* %tmp7, align 4
  %187 = load i32, i32* %z1, align 4
  %add159 = add nsw i32 %186, %187
  %188 = load i32, i32* %z4, align 4
  %add160 = add nsw i32 %add159, %188
  %add161 = add nsw i32 %add160, 8192
  %shr162 = ashr i32 %add161, 14
  %189 = load i32*, i32** %dataptr, align 4
  %arrayidx163 = getelementptr inbounds i32, i32* %189, i32 8
  store i32 %shr162, i32* %arrayidx163, align 4
  %190 = load i32*, i32** %dataptr, align 4
  %incdec.ptr = getelementptr inbounds i32, i32* %190, i32 1
  store i32* %incdec.ptr, i32** %dataptr, align 4
  br label %for.inc164

for.inc164:                                       ; preds = %for.body79
  %191 = load i32, i32* %ctr, align 4
  %dec165 = add nsw i32 %191, -1
  store i32 %dec165, i32* %ctr, align 4
  br label %for.cond77

for.end166:                                       ; preds = %for.cond77
  ret void
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* @i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc17, %entry
  %0 = load i32, i32* @i, align 4
  %cmp = icmp slt i32 %0, 1000
  br i1 %cmp, label %for.body, label %for.end19

for.body:                                         ; preds = %for.cond
  call void @jpeg_fdct_islow(i32* getelementptr inbounds ([8 x [8 x i32]], [8 x [8 x i32]]* @data, i32 0, i32 0, i32 0))
  %1 = load i32, i32* @i, align 4
  %cmp1 = icmp eq i32 %1, 0
  br i1 %cmp1, label %if.then, label %if.end16

if.then:                                          ; preds = %for.body
  store i32 0, i32* %j, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc13, %if.then
  %2 = load i32, i32* %j, align 4
  %cmp3 = icmp slt i32 %2, 8
  br i1 %cmp3, label %for.body4, label %for.end15

for.body4:                                        ; preds = %for.cond2
  store i32 0, i32* %k, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body4
  %3 = load i32, i32* %k, align 4
  %cmp6 = icmp slt i32 %3, 8
  br i1 %cmp6, label %for.body7, label %for.end

for.body7:                                        ; preds = %for.cond5
  %4 = load i32, i32* %k, align 4
  %5 = load i32, i32* %j, align 4
  %arrayidx = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data, i32 0, i32 %5
  %arrayidx8 = getelementptr inbounds [8 x i32], [8 x i32]* %arrayidx, i32 0, i32 %4
  %6 = load i32, i32* %arrayidx8, align 4
  %7 = load i32, i32* %k, align 4
  %8 = load i32, i32* %j, align 4
  %arrayidx9 = getelementptr inbounds [8 x [8 x i32]], [8 x [8 x i32]]* @data_ref, i32 0, i32 %8
  %arrayidx10 = getelementptr inbounds [8 x i32], [8 x i32]* %arrayidx9, i32 0, i32 %7
  %9 = load i32, i32* %arrayidx10, align 4
  %cmp11 = icmp ne i32 %6, %9
  br i1 %cmp11, label %if.then12, label %if.end

if.then12:                                        ; preds = %for.body7
  %10 = load i32, i32* %j, align 4
  %11 = load i32, i32* %k, align 4
  %add = add nsw i32 %10, %11
  store i32 %add, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body7
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %12 = load i32, i32* %k, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  br label %for.inc13

for.inc13:                                        ; preds = %for.end
  %13 = load i32, i32* %j, align 4
  %inc14 = add nsw i32 %13, 1
  store i32 %inc14, i32* %j, align 4
  br label %for.cond2

for.end15:                                        ; preds = %for.cond2
  br label %if.end16

if.end16:                                         ; preds = %for.end15, %for.body
  br label %for.inc17

for.inc17:                                        ; preds = %if.end16
  %14 = load i32, i32* @i, align 4
  %inc18 = add nsw i32 %14, 1
  store i32 %inc18, i32* @i, align 4
  br label %for.cond

for.end19:                                        ; preds = %for.cond
  store i32 -1, i32* %retval
  br label %return

return:                                           ; preds = %for.end19, %if.then12
  %15 = load i32, i32* %retval
  ret i32 %15
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="mips32r2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
