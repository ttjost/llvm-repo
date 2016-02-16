; ModuleID = 'engine.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

%struct.table = type { i8, i16, i16 }
%struct.rtable = type { i16, %struct.table* }

@vaf_fi_tab0 = global [6 x %struct.table] [%struct.table { i8 0, i16 2400, i16 20 }, %struct.table { i8 50, i16 3400, i16 115 }, %struct.table { i8 100, i16 9150, i16 120 }, %struct.table { i8 -106, i16 15150, i16 100 }, %struct.table { i8 -56, i16 20150, i16 100 }, %struct.table { i8 -1, i16 25650, i16 0 }], align 2
@vaf_fi_tab1000 = global [6 x %struct.table] [%struct.table { i8 0, i16 2500, i16 20 }, %struct.table { i8 50, i16 3500, i16 40 }, %struct.table { i8 75, i16 4500, i16 150 }, %struct.table { i8 100, i16 8250, i16 200 }, %struct.table { i8 -56, i16 28250, i16 200 }, %struct.table { i8 -1, i16 -26286, i16 0 }], align 2
@vaf_fi_tab1500 = global [7 x %struct.table] [%struct.table { i8 0, i16 2600, i16 20 }, %struct.table { i8 50, i16 3600, i16 40 }, %struct.table { i8 75, i16 4600, i16 200 }, %struct.table { i8 100, i16 9600, i16 150 }, %struct.table { i8 -106, i16 17100, i16 100 }, %struct.table { i8 -56, i16 22100, i16 200 }, %struct.table { i8 -1, i16 -32436, i16 0 }], align 2
@vaf_fi_tab2000 = global [8 x %struct.table] [%struct.table { i8 0, i16 2500, i16 10 }, %struct.table { i8 50, i16 3000, i16 30 }, %struct.table { i8 100, i16 4500, i16 120 }, %struct.table { i8 125, i16 7500, i16 180 }, %struct.table { i8 -106, i16 12000, i16 300 }, %struct.table { i8 -81, i16 19500, i16 400 }, %struct.table { i8 -56, i16 29500, i16 300 }, %struct.table { i8 -1, i16 -19536, i16 0 }], align 2
@vaf_fi_tab4000 = global [8 x %struct.table] [%struct.table { i8 0, i16 2500, i16 10 }, %struct.table { i8 50, i16 3000, i16 30 }, %struct.table { i8 100, i16 4500, i16 180 }, %struct.table { i8 125, i16 9000, i16 250 }, %struct.table { i8 -106, i16 15250, i16 300 }, %struct.table { i8 -81, i16 22750, i16 300 }, %struct.table { i8 -56, i16 30250, i16 300 }, %struct.table { i8 -1, i16 -18786, i16 0 }], align 2
@vaf_fi_tab4500 = global [8 x %struct.table] [%struct.table { i8 0, i16 2500, i16 10 }, %struct.table { i8 50, i16 3000, i16 30 }, %struct.table { i8 100, i16 4500, i16 180 }, %struct.table { i8 125, i16 9000, i16 250 }, %struct.table { i8 -106, i16 15250, i16 325 }, %struct.table { i8 -81, i16 23375, i16 325 }, %struct.table { i8 -56, i16 31500, i16 300 }, %struct.table { i8 -1, i16 -17536, i16 0 }], align 2
@vaf_fi_tab5000 = global [8 x %struct.table] [%struct.table { i8 0, i16 2500, i16 10 }, %struct.table { i8 50, i16 3000, i16 30 }, %struct.table { i8 100, i16 4500, i16 180 }, %struct.table { i8 125, i16 9000, i16 200 }, %struct.table { i8 -106, i16 14000, i16 300 }, %struct.table { i8 -81, i16 21500, i16 300 }, %struct.table { i8 -56, i16 29000, i16 300 }, %struct.table { i8 -1, i16 -20036, i16 0 }], align 2
@vaf_fi_tab8000 = global [8 x %struct.table] [%struct.table { i8 0, i16 2500, i16 10 }, %struct.table { i8 50, i16 3000, i16 30 }, %struct.table { i8 100, i16 4500, i16 180 }, %struct.table { i8 -106, i16 13500, i16 275 }, %struct.table { i8 -81, i16 20375, i16 280 }, %struct.table { i8 -56, i16 27375, i16 290 }, %struct.table { i8 -31, i16 -30911, i16 300 }, %struct.table { i8 -1, i16 -21911, i16 0 }], align 2
@rpm_vfi_tab = global [8 x %struct.rtable] [%struct.rtable { i16 0, %struct.table* getelementptr inbounds ([6 x %struct.table], [6 x %struct.table]* @vaf_fi_tab0, i32 0, i32 0) }, %struct.rtable { i16 1000, %struct.table* getelementptr inbounds ([6 x %struct.table], [6 x %struct.table]* @vaf_fi_tab1000, i32 0, i32 0) }, %struct.rtable { i16 1500, %struct.table* getelementptr inbounds ([7 x %struct.table], [7 x %struct.table]* @vaf_fi_tab1500, i32 0, i32 0) }, %struct.rtable { i16 2000, %struct.table* getelementptr inbounds ([8 x %struct.table], [8 x %struct.table]* @vaf_fi_tab2000, i32 0, i32 0) }, %struct.rtable { i16 4000, %struct.table* getelementptr inbounds ([8 x %struct.table], [8 x %struct.table]* @vaf_fi_tab4000, i32 0, i32 0) }, %struct.rtable { i16 4500, %struct.table* getelementptr inbounds ([8 x %struct.table], [8 x %struct.table]* @vaf_fi_tab4500, i32 0, i32 0) }, %struct.rtable { i16 5000, %struct.table* getelementptr inbounds ([8 x %struct.table], [8 x %struct.table]* @vaf_fi_tab5000, i32 0, i32 0) }, %struct.rtable { i16 8000, %struct.table* getelementptr inbounds ([8 x %struct.table], [8 x %struct.table]* @vaf_fi_tab8000, i32 0, i32 0) }], align 4
@ival = common global i8 0, align 1
@tab2 = common global %struct.table* null, align 4
@tab1 = common global %struct.table* null, align 4
@rpm2 = common global i16 0, align 2
@rpm1 = common global i16 0, align 2
@debug_val = common global i32 0, align 4
@debug_base = common global i32 0, align 4
@inter_val = common global i16 0, align 2
@debug_interval = common global i32 0, align 4
@tabptr = common global %struct.table* null, align 4
@inter1 = common global i16 0, align 2
@inter2 = common global i16 0, align 2
@rpm_delta = common global i16 0, align 2
@inter_delta = common global i16 0, align 2
@rpm = common global i16 0, align 2
@offset = common global i16 0, align 2
@inter_temp = common global i16 0, align 2
@big_temp = common global i32 0, align 4
@.str = private unnamed_addr constant [5 x i8] c"666\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"-1\0A\00", align 1
@str = private unnamed_addr constant [3 x i8] c"-1\00"
@str2 = private unnamed_addr constant [4 x i8] c"666\00"

; Function Attrs: nounwind
define void @engine() #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %entry, %while.end18
  %vaf.039 = phi i32 [ 0, %entry ], [ %add22, %while.end18 ]
  %conv = trunc i32 %vaf.039 to i8
  store i8 %conv, i8* @ival, align 1, !tbaa !1
  br label %while.body

while.body:                                       ; preds = %for.body, %if.end
  %hc_count.038 = phi i32 [ 60000, %for.body ], [ %sub, %if.end ]
  %call = tail call i32 @edge_to_rpm(i32 %hc_count.038)
  %div = udiv i32 %hc_count.038, 25
  br label %while.cond3

while.cond3:                                      ; preds = %while.cond3, %while.body
  %rtp.0 = phi %struct.rtable* [ getelementptr inbounds ([8 x %struct.rtable], [8 x %struct.rtable]* @rpm_vfi_tab, i32 0, i32 0), %while.body ], [ %incdec.ptr, %while.cond3 ]
  %r_rpm = getelementptr inbounds %struct.rtable, %struct.rtable* %rtp.0, i32 0, i32 0
  %0 = load i16, i16* %r_rpm, align 2, !tbaa !4
  %conv4 = zext i16 %0 to i32
  %cmp5 = icmp slt i32 %conv4, %call
  %incdec.ptr = getelementptr inbounds %struct.rtable, %struct.rtable* %rtp.0, i32 1
  br i1 %cmp5, label %while.cond3, label %while.end

while.end:                                        ; preds = %while.cond3
  %sub = sub i32 %hc_count.038, %div
  %cmp10 = icmp eq i32 %conv4, %call
  %r_tab = getelementptr inbounds %struct.rtable, %struct.rtable* %rtp.0, i32 0, i32 1
  %1 = bitcast %struct.table** %r_tab to i32*
  %2 = load i32, i32* %1, align 4, !tbaa !8
  store i32 %2, i32* bitcast (%struct.table** @tab2 to i32*), align 4, !tbaa !9
  br i1 %cmp10, label %if.then, label %if.else

if.then:                                          ; preds = %while.end
  store i32 %2, i32* bitcast (%struct.table** @tab1 to i32*), align 4, !tbaa !9
  %conv12 = trunc i32 %call to i16
  store i16 %conv12, i16* @rpm2, align 2, !tbaa !10
  br label %if.end

if.else:                                          ; preds = %while.end
  %3 = load i16, i16* %r_rpm, align 2, !tbaa !4
  store i16 %3, i16* @rpm2, align 2, !tbaa !10
  %r_tab16 = getelementptr inbounds %struct.rtable, %struct.rtable* %rtp.0, i32 -1, i32 1
  %4 = bitcast %struct.table** %r_tab16 to i32*
  %5 = load i32, i32* %4, align 4, !tbaa !8
  store i32 %5, i32* bitcast (%struct.table** @tab1 to i32*), align 4, !tbaa !9
  %r_rpm17 = getelementptr inbounds %struct.rtable, %struct.rtable* %rtp.0, i32 -1, i32 0
  %6 = load i16, i16* %r_rpm17, align 2, !tbaa !4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %storemerge = phi i16 [ %6, %if.else ], [ %conv12, %if.then ]
  store i16 %storemerge, i16* @rpm1, align 2, !tbaa !10
  tail call void @interpolate()
  %cmp1 = icmp ugt i32 %sub, 4000
  br i1 %cmp1, label %while.body, label %while.end18

while.end18:                                      ; preds = %if.end
  %7 = load i32, i32* @debug_val, align 4, !tbaa !11
  %add = add nsw i32 %7, %call
  store i32 %add, i32* @debug_val, align 4, !tbaa !11
  %8 = load i32, i32* @debug_base, align 4, !tbaa !11
  %add19 = add nsw i32 %8, %vaf.039
  store i32 %add19, i32* @debug_base, align 4, !tbaa !11
  %9 = load i16, i16* @inter_val, align 2, !tbaa !10
  %conv20 = zext i16 %9 to i32
  %10 = load i32, i32* @debug_interval, align 4, !tbaa !11
  %add21 = add nsw i32 %10, %conv20
  store i32 %add21, i32* @debug_interval, align 4, !tbaa !11
  %add22 = add nuw nsw i32 %vaf.039, 10
  %cmp = icmp slt i32 %add22, 255
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %while.end18
  ret void
}

; Function Attrs: nounwind
define i32 @edge_to_rpm(i32 %count) #0 {
entry:
  %quot = alloca i32, align 4
  %rem = alloca i32, align 4
  call void @fdiv_func(i32 1, i32 %count, i32* %quot, i32* %rem)
  %0 = load i32, i32* %quot, align 4, !tbaa !11
  %mul = mul nsw i32 %0, 458
  %1 = load i32, i32* %rem, align 4, !tbaa !11
  call void @fdiv_func(i32 %1, i32 %count, i32* %quot, i32* %rem)
  %2 = load i32, i32* %quot, align 4, !tbaa !11
  %div = sdiv i32 %2, 143
  %add = add nsw i32 %div, %mul
  ret i32 %add
}

; Function Attrs: nounwind
define void @interpolate() #0 {
entry:
  %0 = load i32, i32* bitcast (%struct.table** @tab1 to i32*), align 4, !tbaa !9
  store i32 %0, i32* bitcast (%struct.table** @tabptr to i32*), align 4, !tbaa !9
  %.cast = inttoptr i32 %0 to %struct.table*
  %t_val97 = getelementptr inbounds %struct.table, %struct.table* %.cast, i32 0, i32 0
  %1 = load i8, i8* %t_val97, align 1, !tbaa !13
  %2 = load i8, i8* @ival, align 1, !tbaa !1
  %cmp98 = icmp ult i8 %1, %2
  br i1 %cmp98, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %entry
  %3 = load i8, i8* @ival, align 1, !tbaa !1
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %4 = phi %struct.table* [ %.cast, %while.body.lr.ph ], [ %incdec.ptr, %while.body ]
  %incdec.ptr = getelementptr inbounds %struct.table, %struct.table* %4, i32 1
  %t_val = getelementptr inbounds %struct.table, %struct.table* %incdec.ptr, i32 0, i32 0
  %5 = load i8, i8* %t_val, align 1, !tbaa !13
  %cmp = icmp ult i8 %5, %3
  br i1 %cmp, label %while.body, label %while.cond.while.end_crit_edge

while.cond.while.end_crit_edge:                   ; preds = %while.body
  store %struct.table* %incdec.ptr, %struct.table** @tabptr, align 4, !tbaa !9
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %.lcssa95 = phi i8 [ %3, %while.cond.while.end_crit_edge ], [ %2, %entry ]
  %.lcssa94 = phi i8 [ %5, %while.cond.while.end_crit_edge ], [ %1, %entry ]
  %.lcssa93 = phi %struct.table* [ %incdec.ptr, %while.cond.while.end_crit_edge ], [ %.cast, %entry ]
  %cmp6 = icmp eq i8 %.lcssa94, %.lcssa95
  br i1 %cmp6, label %if.then, label %if.else

if.then:                                          ; preds = %while.end
  %t_base = getelementptr inbounds %struct.table, %struct.table* %.lcssa93, i32 0, i32 1
  %6 = load i16, i16* %t_base, align 2, !tbaa !15
  br label %if.end

if.else:                                          ; preds = %while.end
  %incdec.ptr8 = getelementptr inbounds %struct.table, %struct.table* %.lcssa93, i32 -1
  store %struct.table* %incdec.ptr8, %struct.table** @tabptr, align 4, !tbaa !9
  %t_base9 = getelementptr inbounds %struct.table, %struct.table* %.lcssa93, i32 -1, i32 1
  %7 = load i16, i16* %t_base9, align 2, !tbaa !15
  %8 = load i8, i8* @ival, align 1, !tbaa !1
  %conv11 = zext i8 %8 to i16
  %t_val12 = getelementptr inbounds %struct.table, %struct.table* %incdec.ptr8, i32 0, i32 0
  %9 = load i8, i8* %t_val12, align 1, !tbaa !13
  %conv13 = zext i8 %9 to i16
  %sub = sub nsw i16 %conv11, %conv13
  %t_increment = getelementptr inbounds %struct.table, %struct.table* %.lcssa93, i32 -1, i32 2
  %10 = load i16, i16* %t_increment, align 2, !tbaa !16
  %mul = mul i16 %sub, %10
  %add = add i16 %mul, %7
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %storemerge = phi i16 [ %add, %if.else ], [ %6, %if.then ]
  store i16 %storemerge, i16* @inter1, align 2, !tbaa !10
  %11 = load %struct.table*, %struct.table** @tab2, align 4, !tbaa !9
  %12 = load %struct.table*, %struct.table** @tab1, align 4, !tbaa !9
  %cmp16 = icmp eq %struct.table* %11, %12
  br i1 %cmp16, label %if.end86, label %while.cond20.preheader

while.cond20.preheader:                           ; preds = %if.end
  %13 = load i8, i8* @ival, align 1, !tbaa !1
  br label %while.cond20

while.cond20:                                     ; preds = %while.cond20, %while.cond20.preheader
  %storemerge87 = phi %struct.table* [ %incdec.ptr27, %while.cond20 ], [ %11, %while.cond20.preheader ]
  %t_val21 = getelementptr inbounds %struct.table, %struct.table* %storemerge87, i32 0, i32 0
  %14 = load i8, i8* %t_val21, align 1, !tbaa !13
  %cmp24 = icmp ult i8 %14, %13
  %incdec.ptr27 = getelementptr inbounds %struct.table, %struct.table* %storemerge87, i32 1
  br i1 %cmp24, label %while.cond20, label %while.end28

while.end28:                                      ; preds = %while.cond20
  store %struct.table* %storemerge87, %struct.table** @tabptr, align 4, !tbaa !9
  %cmp32 = icmp eq i8 %14, %13
  br i1 %cmp32, label %if.then34, label %if.else36

if.then34:                                        ; preds = %while.end28
  %t_base35 = getelementptr inbounds %struct.table, %struct.table* %storemerge87, i32 0, i32 1
  %15 = load i16, i16* %t_base35, align 2, !tbaa !15
  br label %if.end49

if.else36:                                        ; preds = %while.end28
  %incdec.ptr37 = getelementptr inbounds %struct.table, %struct.table* %storemerge87, i32 -1
  store %struct.table* %incdec.ptr37, %struct.table** @tabptr, align 4, !tbaa !9
  %t_base38 = getelementptr inbounds %struct.table, %struct.table* %storemerge87, i32 -1, i32 1
  %16 = load i16, i16* %t_base38, align 2, !tbaa !15
  %17 = load i8, i8* @ival, align 1, !tbaa !1
  %conv40 = zext i8 %17 to i16
  %t_val41 = getelementptr inbounds %struct.table, %struct.table* %incdec.ptr37, i32 0, i32 0
  %18 = load i8, i8* %t_val41, align 1, !tbaa !13
  %conv42 = zext i8 %18 to i16
  %sub43 = sub nsw i16 %conv40, %conv42
  %t_increment44 = getelementptr inbounds %struct.table, %struct.table* %storemerge87, i32 -1, i32 2
  %19 = load i16, i16* %t_increment44, align 2, !tbaa !16
  %mul46 = mul i16 %sub43, %19
  %add47 = add i16 %mul46, %16
  br label %if.end49

if.end49:                                         ; preds = %if.else36, %if.then34
  %storemerge88 = phi i16 [ %add47, %if.else36 ], [ %15, %if.then34 ]
  store i16 %storemerge88, i16* @inter2, align 2, !tbaa !10
  %20 = load i16, i16* @rpm2, align 2, !tbaa !10
  %21 = load i16, i16* @rpm1, align 2, !tbaa !10
  %sub52 = sub i16 %20, %21
  store i16 %sub52, i16* @rpm_delta, align 2, !tbaa !10
  %22 = load i16, i16* @inter1, align 2, !tbaa !10
  %cmp56 = icmp ugt i16 %storemerge88, %22
  br i1 %cmp56, label %if.then58, label %if.else67

if.then58:                                        ; preds = %if.end49
  %sub61 = sub i16 %storemerge88, %22
  store i16 %sub61, i16* @inter_delta, align 2, !tbaa !10
  %23 = load i16, i16* @rpm, align 2, !tbaa !10
  %24 = load i16, i16* @rpm1, align 2, !tbaa !10
  %sub65 = sub i16 %23, %24
  br label %if.end76

if.else67:                                        ; preds = %if.end49
  %sub70 = sub i16 %22, %storemerge88
  store i16 %sub70, i16* @inter_delta, align 2, !tbaa !10
  %25 = load i16, i16* @rpm2, align 2, !tbaa !10
  %26 = load i16, i16* @rpm, align 2, !tbaa !10
  %sub74 = sub i16 %25, %26
  br label %if.end76

if.end76:                                         ; preds = %if.else67, %if.then58
  %storemerge91 = phi i16 [ %sub74, %if.else67 ], [ %sub65, %if.then58 ]
  %storemerge89.in = phi i16* [ @inter2, %if.else67 ], [ @inter1, %if.then58 ]
  store i16 %storemerge91, i16* @offset, align 2, !tbaa !10
  %storemerge89 = load i16, i16* %storemerge89.in, align 2
  store i16 %storemerge89, i16* @inter_temp, align 2, !tbaa !10
  %conv77 = zext i16 %storemerge91 to i32
  %27 = load i16, i16* @inter_delta, align 2, !tbaa !10
  %conv78 = zext i16 %27 to i32
  %mul79 = mul nuw nsw i32 %conv78, %conv77
  store i32 %mul79, i32* @big_temp, align 4, !tbaa !11
  %28 = load i16, i16* @rpm_delta, align 2, !tbaa !10
  %conv80 = zext i16 %28 to i32
  %div = udiv i32 %mul79, %conv80
  %conv81 = trunc i32 %div to i16
  store i16 %conv81, i16* @inter_val, align 2, !tbaa !10
  %29 = load i16, i16* @inter_temp, align 2, !tbaa !10
  %conv82 = zext i16 %29 to i32
  %add84 = add nuw nsw i32 %conv82, %div
  %conv85 = trunc i32 %add84 to i16
  br label %if.end86

if.end86:                                         ; preds = %if.end, %if.end76
  %storemerge90 = phi i16 [ %conv85, %if.end76 ], [ %storemerge, %if.end ]
  store i16 %storemerge90, i16* @inter_val, align 2, !tbaa !10
  ret void
}

; Function Attrs: nounwind
define void @fdiv_func(i32 %num, i32 %den, i32* nocapture %quot, i32* nocapture %rem) #0 {
entry:
  %mul = shl nsw i32 %num, 16
  %div = sdiv i32 %mul, %den
  store i32 %div, i32* %quot, align 4, !tbaa !11
  %mul1 = mul nsw i32 %div, %den
  %sub = sub nsw i32 %mul, %mul1
  store i32 %sub, i32* %rem, align 4, !tbaa !11
  ret void
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  tail call void @engine()
  %0 = load i32, i32* @debug_val, align 4, !tbaa !11
  %cmp = icmp ne i32 %0, 191932
  %1 = load i32, i32* @debug_base, align 4
  %cmp1 = icmp ne i32 %1, 3250
  %or.cond = or i1 %cmp, %cmp1
  %2 = load i32, i32* @debug_interval, align 4
  %cmp3 = icmp ne i32 %2, 418230
  %or.cond5 = or i1 %or.cond, %cmp3
  br i1 %or.cond5, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %puts6 = tail call i32 @puts(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str2, i32 0, i32 0))
  br label %return

if.end:                                           ; preds = %entry
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str, i32 0, i32 0))
  br label %return

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi i32 [ 15, %if.then ], [ 66, %if.end ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
!4 = !{!5, !6, i64 0}
!5 = !{!"rtable", !6, i64 0, !7, i64 4}
!6 = !{!"short", !2, i64 0}
!7 = !{!"any pointer", !2, i64 0}
!8 = !{!5, !7, i64 4}
!9 = !{!7, !7, i64 0}
!10 = !{!6, !6, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !2, i64 0}
!13 = !{!14, !2, i64 0}
!14 = !{!"table", !2, i64 0, !6, i64 2, !6, i64 4}
!15 = !{!14, !6, i64 2}
!16 = !{!14, !6, i64 4}
