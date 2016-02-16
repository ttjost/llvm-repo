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
  %div.i.i = sdiv i32 65536, %hc_count.038
  %mul1.i.i = mul nsw i32 %div.i.i, %hc_count.038
  %sub.i.i = sub nsw i32 65536, %mul1.i.i
  %mul.i = mul nsw i32 %div.i.i, 458
  %mul.i.i = shl nsw i32 %sub.i.i, 16
  %div.i3.i = sdiv i32 %mul.i.i, %hc_count.038
  %div.i = sdiv i32 %div.i3.i, 143
  %add.i = add nsw i32 %div.i, %mul.i
  %div = udiv i32 %hc_count.038, 25
  br label %while.cond3

while.cond3:                                      ; preds = %while.cond3, %while.body
  %rtp.0 = phi %struct.rtable* [ getelementptr inbounds ([8 x %struct.rtable], [8 x %struct.rtable]* @rpm_vfi_tab, i32 0, i32 0), %while.body ], [ %incdec.ptr, %while.cond3 ]
  %r_rpm = getelementptr inbounds %struct.rtable, %struct.rtable* %rtp.0, i32 0, i32 0
  %0 = load i16, i16* %r_rpm, align 2, !tbaa !4
  %conv4 = zext i16 %0 to i32
  %cmp5 = icmp slt i32 %conv4, %add.i
  %incdec.ptr = getelementptr inbounds %struct.rtable, %struct.rtable* %rtp.0, i32 1
  br i1 %cmp5, label %while.cond3, label %while.end

while.end:                                        ; preds = %while.cond3
  %conv4.lcssa = phi i32 [ %conv4, %while.cond3 ]
  %.lcssa = phi i16 [ %0, %while.cond3 ]
  %rtp.0.lcssa = phi %struct.rtable* [ %rtp.0, %while.cond3 ]
  %sub = sub i32 %hc_count.038, %div
  %cmp10 = icmp eq i32 %conv4.lcssa, %add.i
  %r_tab = getelementptr inbounds %struct.rtable, %struct.rtable* %rtp.0.lcssa, i32 0, i32 1
  %1 = bitcast %struct.table** %r_tab to i32*
  %2 = load i32, i32* %1, align 4, !tbaa !8
  store i32 %2, i32* bitcast (%struct.table** @tab2 to i32*), align 4, !tbaa !9
  br i1 %cmp10, label %if.then, label %if.else

if.then:                                          ; preds = %while.end
  store i32 %2, i32* bitcast (%struct.table** @tab1 to i32*), align 4, !tbaa !9
  %conv12 = trunc i32 %add.i to i16
  store i16 %conv12, i16* @rpm2, align 2, !tbaa !10
  br label %if.end

if.else:                                          ; preds = %while.end
  store i16 %.lcssa, i16* @rpm2, align 2, !tbaa !10
  %r_tab16 = getelementptr inbounds %struct.rtable, %struct.rtable* %rtp.0.lcssa, i32 -1, i32 1
  %3 = bitcast %struct.table** %r_tab16 to i32*
  %4 = load i32, i32* %3, align 4, !tbaa !8
  store i32 %4, i32* bitcast (%struct.table** @tab1 to i32*), align 4, !tbaa !9
  %r_rpm17 = getelementptr inbounds %struct.rtable, %struct.rtable* %rtp.0.lcssa, i32 -1, i32 0
  %5 = load i16, i16* %r_rpm17, align 2, !tbaa !4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %storemerge = phi i16 [ %5, %if.else ], [ %conv12, %if.then ]
  store i16 %storemerge, i16* @rpm1, align 2, !tbaa !10
  tail call void @interpolate()
  %cmp1 = icmp ugt i32 %sub, 4000
  br i1 %cmp1, label %while.body, label %while.end18

while.end18:                                      ; preds = %if.end
  %6 = load i32, i32* @debug_val, align 4, !tbaa !11
  %add = add nsw i32 %6, 7382
  store i32 %add, i32* @debug_val, align 4, !tbaa !11
  %7 = load i32, i32* @debug_base, align 4, !tbaa !11
  %add19 = add nsw i32 %7, %vaf.039
  store i32 %add19, i32* @debug_base, align 4, !tbaa !11
  %8 = load i16, i16* @inter_val, align 2, !tbaa !10
  %conv20 = zext i16 %8 to i32
  %9 = load i32, i32* @debug_interval, align 4, !tbaa !11
  %add21 = add nsw i32 %9, %conv20
  store i32 %add21, i32* @debug_interval, align 4, !tbaa !11
  %add22 = add nuw nsw i32 %vaf.039, 10
  %cmp = icmp slt i32 %add22, 255
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %while.end18
  ret void
}

; Function Attrs: nounwind readnone
define i32 @edge_to_rpm(i32 %count) #1 {
entry:
  %div.i = sdiv i32 65536, %count
  %mul1.i = mul nsw i32 %div.i, %count
  %sub.i = sub nsw i32 65536, %mul1.i
  %mul = mul nsw i32 %div.i, 458
  %mul.i = shl nsw i32 %sub.i, 16
  %div.i3 = sdiv i32 %mul.i, %count
  %div = sdiv i32 %div.i3, 143
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
  br i1 %cmp98, label %while.body.preheader, label %while.end

while.body.preheader:                             ; preds = %entry
  br label %while.body

while.body:                                       ; preds = %while.body.preheader, %while.body
  %3 = phi %struct.table* [ %incdec.ptr, %while.body ], [ %.cast, %while.body.preheader ]
  %incdec.ptr = getelementptr inbounds %struct.table, %struct.table* %3, i32 1
  %t_val = getelementptr inbounds %struct.table, %struct.table* %incdec.ptr, i32 0, i32 0
  %4 = load i8, i8* %t_val, align 1, !tbaa !13
  %cmp = icmp ult i8 %4, %2
  br i1 %cmp, label %while.body, label %while.cond.while.end_crit_edge

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %.lcssa106 = phi i8 [ %4, %while.body ]
  %incdec.ptr.lcssa = phi %struct.table* [ %incdec.ptr, %while.body ]
  store %struct.table* %incdec.ptr.lcssa, %struct.table** @tabptr, align 4, !tbaa !9
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %.lcssa94 = phi i8 [ %.lcssa106, %while.cond.while.end_crit_edge ], [ %1, %entry ]
  %.lcssa93 = phi %struct.table* [ %incdec.ptr.lcssa, %while.cond.while.end_crit_edge ], [ %.cast, %entry ]
  %cmp6 = icmp eq i8 %.lcssa94, %2
  br i1 %cmp6, label %if.then, label %if.else

if.then:                                          ; preds = %while.end
  %t_base = getelementptr inbounds %struct.table, %struct.table* %.lcssa93, i32 0, i32 1
  %5 = load i16, i16* %t_base, align 2, !tbaa !15
  br label %if.end

if.else:                                          ; preds = %while.end
  %incdec.ptr8 = getelementptr inbounds %struct.table, %struct.table* %.lcssa93, i32 -1
  store %struct.table* %incdec.ptr8, %struct.table** @tabptr, align 4, !tbaa !9
  %t_base9 = getelementptr inbounds %struct.table, %struct.table* %.lcssa93, i32 -1, i32 1
  %6 = load i16, i16* %t_base9, align 2, !tbaa !15
  %conv11 = zext i8 %2 to i16
  %t_val12 = getelementptr inbounds %struct.table, %struct.table* %incdec.ptr8, i32 0, i32 0
  %7 = load i8, i8* %t_val12, align 1, !tbaa !13
  %conv13 = zext i8 %7 to i16
  %sub = sub nsw i16 %conv11, %conv13
  %t_increment = getelementptr inbounds %struct.table, %struct.table* %.lcssa93, i32 -1, i32 2
  %8 = load i16, i16* %t_increment, align 2, !tbaa !16
  %mul = mul i16 %sub, %8
  %add = add i16 %mul, %6
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %storemerge89.pre = phi i16 [ %add, %if.else ], [ %5, %if.then ]
  store i16 %storemerge89.pre, i16* @inter1, align 2, !tbaa !10
  %9 = load %struct.table*, %struct.table** @tab2, align 4, !tbaa !9
  %cmp16 = icmp eq %struct.table* %9, %.cast
  br i1 %cmp16, label %if.end86, label %while.cond20.preheader

while.cond20.preheader:                           ; preds = %if.end
  br label %while.cond20

while.cond20:                                     ; preds = %while.cond20.preheader, %while.cond20
  %storemerge87 = phi %struct.table* [ %incdec.ptr27, %while.cond20 ], [ %9, %while.cond20.preheader ]
  %t_val21 = getelementptr inbounds %struct.table, %struct.table* %storemerge87, i32 0, i32 0
  %10 = load i8, i8* %t_val21, align 1, !tbaa !13
  %cmp24 = icmp ult i8 %10, %2
  %incdec.ptr27 = getelementptr inbounds %struct.table, %struct.table* %storemerge87, i32 1
  br i1 %cmp24, label %while.cond20, label %while.end28

while.end28:                                      ; preds = %while.cond20
  %.lcssa = phi i8 [ %10, %while.cond20 ]
  %storemerge87.lcssa = phi %struct.table* [ %storemerge87, %while.cond20 ]
  store %struct.table* %storemerge87.lcssa, %struct.table** @tabptr, align 4, !tbaa !9
  %cmp32 = icmp eq i8 %.lcssa, %2
  br i1 %cmp32, label %if.then34, label %if.else36

if.then34:                                        ; preds = %while.end28
  %t_base35 = getelementptr inbounds %struct.table, %struct.table* %storemerge87.lcssa, i32 0, i32 1
  %11 = load i16, i16* %t_base35, align 2, !tbaa !15
  br label %if.end49

if.else36:                                        ; preds = %while.end28
  %incdec.ptr37 = getelementptr inbounds %struct.table, %struct.table* %storemerge87.lcssa, i32 -1
  store %struct.table* %incdec.ptr37, %struct.table** @tabptr, align 4, !tbaa !9
  %t_base38 = getelementptr inbounds %struct.table, %struct.table* %storemerge87.lcssa, i32 -1, i32 1
  %12 = load i16, i16* %t_base38, align 2, !tbaa !15
  %conv40 = zext i8 %2 to i16
  %t_val41 = getelementptr inbounds %struct.table, %struct.table* %incdec.ptr37, i32 0, i32 0
  %13 = load i8, i8* %t_val41, align 1, !tbaa !13
  %conv42 = zext i8 %13 to i16
  %sub43 = sub nsw i16 %conv40, %conv42
  %t_increment44 = getelementptr inbounds %struct.table, %struct.table* %storemerge87.lcssa, i32 -1, i32 2
  %14 = load i16, i16* %t_increment44, align 2, !tbaa !16
  %mul46 = mul i16 %sub43, %14
  %add47 = add i16 %mul46, %12
  br label %if.end49

if.end49:                                         ; preds = %if.else36, %if.then34
  %storemerge88 = phi i16 [ %add47, %if.else36 ], [ %11, %if.then34 ]
  store i16 %storemerge88, i16* @inter2, align 2, !tbaa !10
  %15 = load i16, i16* @rpm2, align 2, !tbaa !10
  %16 = load i16, i16* @rpm1, align 2, !tbaa !10
  %sub52 = sub i16 %15, %16
  store i16 %sub52, i16* @rpm_delta, align 2, !tbaa !10
  %cmp56 = icmp ugt i16 %storemerge88, %storemerge89.pre
  br i1 %cmp56, label %if.then58, label %if.else67

if.then58:                                        ; preds = %if.end49
  %sub61 = sub i16 %storemerge88, %storemerge89.pre
  store i16 %sub61, i16* @inter_delta, align 2, !tbaa !10
  %17 = load i16, i16* @rpm, align 2, !tbaa !10
  %sub65 = sub i16 %17, %16
  br label %if.end76

if.else67:                                        ; preds = %if.end49
  %sub70 = sub i16 %storemerge89.pre, %storemerge88
  store i16 %sub70, i16* @inter_delta, align 2, !tbaa !10
  %18 = load i16, i16* @rpm, align 2, !tbaa !10
  %sub74 = sub i16 %15, %18
  br label %if.end76

if.end76:                                         ; preds = %if.else67, %if.then58
  %19 = phi i16 [ %sub70, %if.else67 ], [ %sub61, %if.then58 ]
  %storemerge89 = phi i16 [ %storemerge88, %if.else67 ], [ %storemerge89.pre, %if.then58 ]
  %storemerge91 = phi i16 [ %sub74, %if.else67 ], [ %sub65, %if.then58 ]
  store i16 %storemerge91, i16* @offset, align 2, !tbaa !10
  store i16 %storemerge89, i16* @inter_temp, align 2, !tbaa !10
  %conv77 = zext i16 %storemerge91 to i32
  %conv78 = zext i16 %19 to i32
  %mul79 = mul nuw nsw i32 %conv78, %conv77
  store i32 %mul79, i32* @big_temp, align 4, !tbaa !11
  %conv80 = zext i16 %sub52 to i32
  %div = udiv i32 %mul79, %conv80
  %conv81 = trunc i32 %div to i16
  store i16 %conv81, i16* @inter_val, align 2, !tbaa !10
  %conv82 = zext i16 %storemerge89 to i32
  %add84 = add nuw nsw i32 %conv82, %div
  %conv85 = trunc i32 %add84 to i16
  br label %if.end86

if.end86:                                         ; preds = %if.end, %if.end76
  %storemerge90 = phi i16 [ %conv85, %if.end76 ], [ %storemerge89.pre, %if.end ]
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
  br label %for.body.i

for.body.i:                                       ; preds = %while.end18.i, %entry
  %vaf.039.i = phi i32 [ 0, %entry ], [ %add22.i, %while.end18.i ]
  %conv.i = trunc i32 %vaf.039.i to i8
  store i8 %conv.i, i8* @ival, align 1, !tbaa !1
  br label %while.body.i

while.body.i:                                     ; preds = %if.end.i, %for.body.i
  %hc_count.038.i = phi i32 [ 60000, %for.body.i ], [ %sub.i, %if.end.i ]
  %div.i.i.i = sdiv i32 65536, %hc_count.038.i
  %mul1.i.i.i = mul nsw i32 %div.i.i.i, %hc_count.038.i
  %sub.i.i.i = sub nsw i32 65536, %mul1.i.i.i
  %mul.i.i = mul nsw i32 %div.i.i.i, 458
  %mul.i.i.i = shl nsw i32 %sub.i.i.i, 16
  %div.i3.i.i = sdiv i32 %mul.i.i.i, %hc_count.038.i
  %div.i.i = sdiv i32 %div.i3.i.i, 143
  %add.i.i = add nsw i32 %div.i.i, %mul.i.i
  br label %while.cond3.i

while.cond3.i:                                    ; preds = %while.cond3.i, %while.body.i
  %rtp.0.i = phi %struct.rtable* [ getelementptr inbounds ([8 x %struct.rtable], [8 x %struct.rtable]* @rpm_vfi_tab, i32 0, i32 0), %while.body.i ], [ %incdec.ptr.i, %while.cond3.i ]
  %r_rpm.i = getelementptr inbounds %struct.rtable, %struct.rtable* %rtp.0.i, i32 0, i32 0
  %0 = load i16, i16* %r_rpm.i, align 2, !tbaa !4
  %conv4.i = zext i16 %0 to i32
  %cmp5.i = icmp slt i32 %conv4.i, %add.i.i
  %incdec.ptr.i = getelementptr inbounds %struct.rtable, %struct.rtable* %rtp.0.i, i32 1
  br i1 %cmp5.i, label %while.cond3.i, label %while.end.i

while.end.i:                                      ; preds = %while.cond3.i
  %conv4.i.lcssa = phi i32 [ %conv4.i, %while.cond3.i ]
  %.lcssa = phi i16 [ %0, %while.cond3.i ]
  %rtp.0.i.lcssa = phi %struct.rtable* [ %rtp.0.i, %while.cond3.i ]
  %div.i = udiv i32 %hc_count.038.i, 25
  %sub.i = sub i32 %hc_count.038.i, %div.i
  %cmp10.i = icmp eq i32 %conv4.i.lcssa, %add.i.i
  %r_tab.i = getelementptr inbounds %struct.rtable, %struct.rtable* %rtp.0.i.lcssa, i32 0, i32 1
  %1 = bitcast %struct.table** %r_tab.i to i32*
  %2 = load i32, i32* %1, align 4, !tbaa !8
  store i32 %2, i32* bitcast (%struct.table** @tab2 to i32*), align 4, !tbaa !9
  br i1 %cmp10.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %while.end.i
  store i32 %2, i32* bitcast (%struct.table** @tab1 to i32*), align 4, !tbaa !9
  %conv12.i = trunc i32 %add.i.i to i16
  store i16 %conv12.i, i16* @rpm2, align 2, !tbaa !10
  br label %if.end.i

if.else.i:                                        ; preds = %while.end.i
  store i16 %.lcssa, i16* @rpm2, align 2, !tbaa !10
  %r_tab16.i = getelementptr inbounds %struct.rtable, %struct.rtable* %rtp.0.i.lcssa, i32 -1, i32 1
  %3 = bitcast %struct.table** %r_tab16.i to i32*
  %4 = load i32, i32* %3, align 4, !tbaa !8
  store i32 %4, i32* bitcast (%struct.table** @tab1 to i32*), align 4, !tbaa !9
  %r_rpm17.i = getelementptr inbounds %struct.rtable, %struct.rtable* %rtp.0.i.lcssa, i32 -1, i32 0
  %5 = load i16, i16* %r_rpm17.i, align 2, !tbaa !4
  br label %if.end.i

if.end.i:                                         ; preds = %if.else.i, %if.then.i
  %storemerge.i = phi i16 [ %5, %if.else.i ], [ %conv12.i, %if.then.i ]
  store i16 %storemerge.i, i16* @rpm1, align 2, !tbaa !10
  tail call void @interpolate() #2
  %cmp1.i = icmp ugt i32 %sub.i, 4000
  br i1 %cmp1.i, label %while.body.i, label %while.end18.i

while.end18.i:                                    ; preds = %if.end.i
  %6 = load i32, i32* @debug_val, align 4, !tbaa !11
  %add.i = add nsw i32 %6, 7382
  store i32 %add.i, i32* @debug_val, align 4, !tbaa !11
  %7 = load i32, i32* @debug_base, align 4, !tbaa !11
  %add19.i = add nsw i32 %7, %vaf.039.i
  store i32 %add19.i, i32* @debug_base, align 4, !tbaa !11
  %8 = load i16, i16* @inter_val, align 2, !tbaa !10
  %conv20.i = zext i16 %8 to i32
  %9 = load i32, i32* @debug_interval, align 4, !tbaa !11
  %add21.i = add nsw i32 %9, %conv20.i
  store i32 %add21.i, i32* @debug_interval, align 4, !tbaa !11
  %add22.i = add nuw nsw i32 %vaf.039.i, 10
  %cmp.i = icmp slt i32 %add22.i, 255
  br i1 %cmp.i, label %for.body.i, label %engine.exit

engine.exit:                                      ; preds = %while.end18.i
  %add21.i.lcssa = phi i32 [ %add21.i, %while.end18.i ]
  %add19.i.lcssa = phi i32 [ %add19.i, %while.end18.i ]
  %add.i.lcssa = phi i32 [ %add.i, %while.end18.i ]
  %cmp = icmp ne i32 %add.i.lcssa, 191932
  %cmp1 = icmp ne i32 %add19.i.lcssa, 3250
  %or.cond = or i1 %cmp, %cmp1
  %cmp3 = icmp ne i32 %add21.i.lcssa, 418230
  %or.cond5 = or i1 %cmp3, %or.cond
  br i1 %or.cond5, label %if.then, label %if.end

if.then:                                          ; preds = %engine.exit
  %puts6 = tail call i32 @puts(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str2, i32 0, i32 0))
  br label %return

if.end:                                           ; preds = %engine.exit
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str, i32 0, i32 0))
  br label %return

return:                                           ; preds = %if.end, %if.then
  %retval.0 = phi i32 [ 15, %if.then ], [ 66, %if.end ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

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
