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

; Function Attrs: nounwind
define void @engine() #0 {
entry:
  %rtp = alloca %struct.rtable*, align 4
  %vaf = alloca i32, align 4
  %rpm = alloca i32, align 4
  %hc_count = alloca i32, align 4
  store i32 0, i32* %vaf, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %vaf, align 4
  %cmp = icmp slt i32 %0, 255
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %vaf, align 4
  %conv = trunc i32 %1 to i8
  store i8 %conv, i8* @ival, align 1
  store i32 60000, i32* %hc_count, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %for.body
  %2 = load i32, i32* %hc_count, align 4
  %cmp1 = icmp ugt i32 %2, 4000
  br i1 %cmp1, label %while.body, label %while.end18

while.body:                                       ; preds = %while.cond
  %3 = load i32, i32* %hc_count, align 4
  %call = call i32 @edge_to_rpm(i32 %3)
  store i32 %call, i32* %rpm, align 4
  %4 = load i32, i32* %hc_count, align 4
  %div = udiv i32 %4, 25
  %5 = load i32, i32* %hc_count, align 4
  %sub = sub i32 %5, %div
  store i32 %sub, i32* %hc_count, align 4
  store %struct.rtable* getelementptr inbounds ([8 x %struct.rtable], [8 x %struct.rtable]* @rpm_vfi_tab, i32 0, i32 0), %struct.rtable** %rtp, align 4
  br label %while.cond3

while.cond3:                                      ; preds = %while.body7, %while.body
  %6 = load %struct.rtable*, %struct.rtable** %rtp, align 4
  %r_rpm = getelementptr inbounds %struct.rtable, %struct.rtable* %6, i32 0, i32 0
  %7 = load i16, i16* %r_rpm, align 2
  %conv4 = zext i16 %7 to i32
  %8 = load i32, i32* %rpm, align 4
  %cmp5 = icmp slt i32 %conv4, %8
  br i1 %cmp5, label %while.body7, label %while.end

while.body7:                                      ; preds = %while.cond3
  %9 = load %struct.rtable*, %struct.rtable** %rtp, align 4
  %incdec.ptr = getelementptr inbounds %struct.rtable, %struct.rtable* %9, i32 1
  store %struct.rtable* %incdec.ptr, %struct.rtable** %rtp, align 4
  br label %while.cond3

while.end:                                        ; preds = %while.cond3
  %10 = load %struct.rtable*, %struct.rtable** %rtp, align 4
  %r_rpm8 = getelementptr inbounds %struct.rtable, %struct.rtable* %10, i32 0, i32 0
  %11 = load i16, i16* %r_rpm8, align 2
  %conv9 = zext i16 %11 to i32
  %12 = load i32, i32* %rpm, align 4
  %cmp10 = icmp eq i32 %conv9, %12
  br i1 %cmp10, label %if.then, label %if.else

if.then:                                          ; preds = %while.end
  %13 = load %struct.rtable*, %struct.rtable** %rtp, align 4
  %r_tab = getelementptr inbounds %struct.rtable, %struct.rtable* %13, i32 0, i32 1
  %14 = load %struct.table*, %struct.table** %r_tab, align 4
  store %struct.table* %14, %struct.table** @tab2, align 4
  store %struct.table* %14, %struct.table** @tab1, align 4
  %15 = load i32, i32* %rpm, align 4
  %conv12 = trunc i32 %15 to i16
  store i16 %conv12, i16* @rpm2, align 2
  store i16 %conv12, i16* @rpm1, align 2
  br label %if.end

if.else:                                          ; preds = %while.end
  %16 = load %struct.rtable*, %struct.rtable** %rtp, align 4
  %r_tab13 = getelementptr inbounds %struct.rtable, %struct.rtable* %16, i32 0, i32 1
  %17 = load %struct.table*, %struct.table** %r_tab13, align 4
  store %struct.table* %17, %struct.table** @tab2, align 4
  %18 = load %struct.rtable*, %struct.rtable** %rtp, align 4
  %r_rpm14 = getelementptr inbounds %struct.rtable, %struct.rtable* %18, i32 0, i32 0
  %19 = load i16, i16* %r_rpm14, align 2
  store i16 %19, i16* @rpm2, align 2
  %20 = load %struct.rtable*, %struct.rtable** %rtp, align 4
  %incdec.ptr15 = getelementptr inbounds %struct.rtable, %struct.rtable* %20, i32 -1
  store %struct.rtable* %incdec.ptr15, %struct.rtable** %rtp, align 4
  %21 = load %struct.rtable*, %struct.rtable** %rtp, align 4
  %r_tab16 = getelementptr inbounds %struct.rtable, %struct.rtable* %21, i32 0, i32 1
  %22 = load %struct.table*, %struct.table** %r_tab16, align 4
  store %struct.table* %22, %struct.table** @tab1, align 4
  %23 = load %struct.rtable*, %struct.rtable** %rtp, align 4
  %r_rpm17 = getelementptr inbounds %struct.rtable, %struct.rtable* %23, i32 0, i32 0
  %24 = load i16, i16* %r_rpm17, align 2
  store i16 %24, i16* @rpm1, align 2
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @interpolate()
  br label %while.cond

while.end18:                                      ; preds = %while.cond
  %25 = load i32, i32* %rpm, align 4
  %26 = load i32, i32* @debug_val, align 4
  %add = add nsw i32 %26, %25
  store i32 %add, i32* @debug_val, align 4
  %27 = load i32, i32* %vaf, align 4
  %28 = load i32, i32* @debug_base, align 4
  %add19 = add nsw i32 %28, %27
  store i32 %add19, i32* @debug_base, align 4
  %29 = load i16, i16* @inter_val, align 2
  %conv20 = zext i16 %29 to i32
  %30 = load i32, i32* @debug_interval, align 4
  %add21 = add nsw i32 %30, %conv20
  store i32 %add21, i32* @debug_interval, align 4
  br label %for.inc

for.inc:                                          ; preds = %while.end18
  %31 = load i32, i32* %vaf, align 4
  %add22 = add nsw i32 %31, 10
  store i32 %add22, i32* %vaf, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind
define i32 @edge_to_rpm(i32 %count) #0 {
entry:
  %count.addr = alloca i32, align 4
  %rpm = alloca i32, align 4
  %quot = alloca i32, align 4
  %rem = alloca i32, align 4
  store i32 %count, i32* %count.addr, align 4
  %0 = load i32, i32* %count.addr, align 4
  call void @fdiv_func(i32 1, i32 %0, i32* %quot, i32* %rem)
  %1 = load i32, i32* %quot, align 4
  %mul = mul nsw i32 %1, 458
  store i32 %mul, i32* %rpm, align 4
  %2 = load i32, i32* %rem, align 4
  %3 = load i32, i32* %count.addr, align 4
  call void @fdiv_func(i32 %2, i32 %3, i32* %quot, i32* %rem)
  %4 = load i32, i32* %quot, align 4
  %div = sdiv i32 %4, 143
  %5 = load i32, i32* %rpm, align 4
  %add = add nsw i32 %5, %div
  store i32 %add, i32* %rpm, align 4
  %6 = load i32, i32* %rpm, align 4
  ret i32 %6
}

; Function Attrs: nounwind
define void @interpolate() #0 {
entry:
  %0 = load %struct.table*, %struct.table** @tab1, align 4
  store %struct.table* %0, %struct.table** @tabptr, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %1 = load %struct.table*, %struct.table** @tabptr, align 4
  %t_val = getelementptr inbounds %struct.table, %struct.table* %1, i32 0, i32 0
  %2 = load i8, i8* %t_val, align 1
  %conv = zext i8 %2 to i32
  %3 = load i8, i8* @ival, align 1
  %conv1 = zext i8 %3 to i32
  %cmp = icmp slt i32 %conv, %conv1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %4 = load %struct.table*, %struct.table** @tabptr, align 4
  %incdec.ptr = getelementptr inbounds %struct.table, %struct.table* %4, i32 1
  store %struct.table* %incdec.ptr, %struct.table** @tabptr, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %5 = load %struct.table*, %struct.table** @tabptr, align 4
  %t_val3 = getelementptr inbounds %struct.table, %struct.table* %5, i32 0, i32 0
  %6 = load i8, i8* %t_val3, align 1
  %conv4 = zext i8 %6 to i32
  %7 = load i8, i8* @ival, align 1
  %conv5 = zext i8 %7 to i32
  %cmp6 = icmp eq i32 %conv4, %conv5
  br i1 %cmp6, label %if.then, label %if.else

if.then:                                          ; preds = %while.end
  %8 = load %struct.table*, %struct.table** @tabptr, align 4
  %t_base = getelementptr inbounds %struct.table, %struct.table* %8, i32 0, i32 1
  %9 = load i16, i16* %t_base, align 2
  store i16 %9, i16* @inter1, align 2
  br label %if.end

if.else:                                          ; preds = %while.end
  %10 = load %struct.table*, %struct.table** @tabptr, align 4
  %incdec.ptr8 = getelementptr inbounds %struct.table, %struct.table* %10, i32 -1
  store %struct.table* %incdec.ptr8, %struct.table** @tabptr, align 4
  %11 = load %struct.table*, %struct.table** @tabptr, align 4
  %t_base9 = getelementptr inbounds %struct.table, %struct.table* %11, i32 0, i32 1
  %12 = load i16, i16* %t_base9, align 2
  %conv10 = zext i16 %12 to i32
  %13 = load i8, i8* @ival, align 1
  %conv11 = zext i8 %13 to i32
  %14 = load %struct.table*, %struct.table** @tabptr, align 4
  %t_val12 = getelementptr inbounds %struct.table, %struct.table* %14, i32 0, i32 0
  %15 = load i8, i8* %t_val12, align 1
  %conv13 = zext i8 %15 to i32
  %sub = sub nsw i32 %conv11, %conv13
  %16 = load %struct.table*, %struct.table** @tabptr, align 4
  %t_increment = getelementptr inbounds %struct.table, %struct.table* %16, i32 0, i32 2
  %17 = load i16, i16* %t_increment, align 2
  %conv14 = zext i16 %17 to i32
  %mul = mul nsw i32 %sub, %conv14
  %add = add nsw i32 %conv10, %mul
  %conv15 = trunc i32 %add to i16
  store i16 %conv15, i16* @inter1, align 2
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %18 = load %struct.table*, %struct.table** @tab2, align 4
  %19 = load %struct.table*, %struct.table** @tab1, align 4
  %cmp16 = icmp eq %struct.table* %18, %19
  br i1 %cmp16, label %if.then18, label %if.else19

if.then18:                                        ; preds = %if.end
  %20 = load i16, i16* @inter1, align 2
  store i16 %20, i16* @inter_val, align 2
  br label %if.end86

if.else19:                                        ; preds = %if.end
  %21 = load %struct.table*, %struct.table** @tab2, align 4
  store %struct.table* %21, %struct.table** @tabptr, align 4
  br label %while.cond20

while.cond20:                                     ; preds = %while.body26, %if.else19
  %22 = load %struct.table*, %struct.table** @tabptr, align 4
  %t_val21 = getelementptr inbounds %struct.table, %struct.table* %22, i32 0, i32 0
  %23 = load i8, i8* %t_val21, align 1
  %conv22 = zext i8 %23 to i32
  %24 = load i8, i8* @ival, align 1
  %conv23 = zext i8 %24 to i32
  %cmp24 = icmp slt i32 %conv22, %conv23
  br i1 %cmp24, label %while.body26, label %while.end28

while.body26:                                     ; preds = %while.cond20
  %25 = load %struct.table*, %struct.table** @tabptr, align 4
  %incdec.ptr27 = getelementptr inbounds %struct.table, %struct.table* %25, i32 1
  store %struct.table* %incdec.ptr27, %struct.table** @tabptr, align 4
  br label %while.cond20

while.end28:                                      ; preds = %while.cond20
  %26 = load %struct.table*, %struct.table** @tabptr, align 4
  %t_val29 = getelementptr inbounds %struct.table, %struct.table* %26, i32 0, i32 0
  %27 = load i8, i8* %t_val29, align 1
  %conv30 = zext i8 %27 to i32
  %28 = load i8, i8* @ival, align 1
  %conv31 = zext i8 %28 to i32
  %cmp32 = icmp eq i32 %conv30, %conv31
  br i1 %cmp32, label %if.then34, label %if.else36

if.then34:                                        ; preds = %while.end28
  %29 = load %struct.table*, %struct.table** @tabptr, align 4
  %t_base35 = getelementptr inbounds %struct.table, %struct.table* %29, i32 0, i32 1
  %30 = load i16, i16* %t_base35, align 2
  store i16 %30, i16* @inter2, align 2
  br label %if.end49

if.else36:                                        ; preds = %while.end28
  %31 = load %struct.table*, %struct.table** @tabptr, align 4
  %incdec.ptr37 = getelementptr inbounds %struct.table, %struct.table* %31, i32 -1
  store %struct.table* %incdec.ptr37, %struct.table** @tabptr, align 4
  %32 = load %struct.table*, %struct.table** @tabptr, align 4
  %t_base38 = getelementptr inbounds %struct.table, %struct.table* %32, i32 0, i32 1
  %33 = load i16, i16* %t_base38, align 2
  %conv39 = zext i16 %33 to i32
  %34 = load i8, i8* @ival, align 1
  %conv40 = zext i8 %34 to i32
  %35 = load %struct.table*, %struct.table** @tabptr, align 4
  %t_val41 = getelementptr inbounds %struct.table, %struct.table* %35, i32 0, i32 0
  %36 = load i8, i8* %t_val41, align 1
  %conv42 = zext i8 %36 to i32
  %sub43 = sub nsw i32 %conv40, %conv42
  %37 = load %struct.table*, %struct.table** @tabptr, align 4
  %t_increment44 = getelementptr inbounds %struct.table, %struct.table* %37, i32 0, i32 2
  %38 = load i16, i16* %t_increment44, align 2
  %conv45 = zext i16 %38 to i32
  %mul46 = mul nsw i32 %sub43, %conv45
  %add47 = add nsw i32 %conv39, %mul46
  %conv48 = trunc i32 %add47 to i16
  store i16 %conv48, i16* @inter2, align 2
  br label %if.end49

if.end49:                                         ; preds = %if.else36, %if.then34
  %39 = load i16, i16* @rpm2, align 2
  %conv50 = zext i16 %39 to i32
  %40 = load i16, i16* @rpm1, align 2
  %conv51 = zext i16 %40 to i32
  %sub52 = sub nsw i32 %conv50, %conv51
  %conv53 = trunc i32 %sub52 to i16
  store i16 %conv53, i16* @rpm_delta, align 2
  %41 = load i16, i16* @inter2, align 2
  %conv54 = zext i16 %41 to i32
  %42 = load i16, i16* @inter1, align 2
  %conv55 = zext i16 %42 to i32
  %cmp56 = icmp sgt i32 %conv54, %conv55
  br i1 %cmp56, label %if.then58, label %if.else67

if.then58:                                        ; preds = %if.end49
  %43 = load i16, i16* @inter2, align 2
  %conv59 = zext i16 %43 to i32
  %44 = load i16, i16* @inter1, align 2
  %conv60 = zext i16 %44 to i32
  %sub61 = sub nsw i32 %conv59, %conv60
  %conv62 = trunc i32 %sub61 to i16
  store i16 %conv62, i16* @inter_delta, align 2
  %45 = load i16, i16* @rpm, align 2
  %conv63 = zext i16 %45 to i32
  %46 = load i16, i16* @rpm1, align 2
  %conv64 = zext i16 %46 to i32
  %sub65 = sub nsw i32 %conv63, %conv64
  %conv66 = trunc i32 %sub65 to i16
  store i16 %conv66, i16* @offset, align 2
  %47 = load i16, i16* @inter1, align 2
  store i16 %47, i16* @inter_temp, align 2
  br label %if.end76

if.else67:                                        ; preds = %if.end49
  %48 = load i16, i16* @inter1, align 2
  %conv68 = zext i16 %48 to i32
  %49 = load i16, i16* @inter2, align 2
  %conv69 = zext i16 %49 to i32
  %sub70 = sub nsw i32 %conv68, %conv69
  %conv71 = trunc i32 %sub70 to i16
  store i16 %conv71, i16* @inter_delta, align 2
  %50 = load i16, i16* @rpm2, align 2
  %conv72 = zext i16 %50 to i32
  %51 = load i16, i16* @rpm, align 2
  %conv73 = zext i16 %51 to i32
  %sub74 = sub nsw i32 %conv72, %conv73
  %conv75 = trunc i32 %sub74 to i16
  store i16 %conv75, i16* @offset, align 2
  %52 = load i16, i16* @inter2, align 2
  store i16 %52, i16* @inter_temp, align 2
  br label %if.end76

if.end76:                                         ; preds = %if.else67, %if.then58
  %53 = load i16, i16* @offset, align 2
  %conv77 = zext i16 %53 to i32
  %54 = load i16, i16* @inter_delta, align 2
  %conv78 = zext i16 %54 to i32
  %mul79 = mul nsw i32 %conv77, %conv78
  store i32 %mul79, i32* @big_temp, align 4
  %55 = load i32, i32* @big_temp, align 4
  %56 = load i16, i16* @rpm_delta, align 2
  %conv80 = zext i16 %56 to i32
  %div = udiv i32 %55, %conv80
  %conv81 = trunc i32 %div to i16
  store i16 %conv81, i16* @inter_val, align 2
  %57 = load i16, i16* @inter_temp, align 2
  %conv82 = zext i16 %57 to i32
  %58 = load i16, i16* @inter_val, align 2
  %conv83 = zext i16 %58 to i32
  %add84 = add nsw i32 %conv83, %conv82
  %conv85 = trunc i32 %add84 to i16
  store i16 %conv85, i16* @inter_val, align 2
  br label %if.end86

if.end86:                                         ; preds = %if.end76, %if.then18
  ret void
}

; Function Attrs: nounwind
define void @fdiv_func(i32 %num, i32 %den, i32* %quot, i32* %rem) #0 {
entry:
  %num.addr = alloca i32, align 4
  %den.addr = alloca i32, align 4
  %quot.addr = alloca i32*, align 4
  %rem.addr = alloca i32*, align 4
  %temp = alloca i32, align 4
  store i32 %num, i32* %num.addr, align 4
  store i32 %den, i32* %den.addr, align 4
  store i32* %quot, i32** %quot.addr, align 4
  store i32* %rem, i32** %rem.addr, align 4
  %0 = load i32, i32* %num.addr, align 4
  %mul = mul nsw i32 %0, 65536
  store i32 %mul, i32* %temp, align 4
  %1 = load i32, i32* %temp, align 4
  %2 = load i32, i32* %den.addr, align 4
  %div = sdiv i32 %1, %2
  %3 = load i32*, i32** %quot.addr, align 4
  store i32 %div, i32* %3, align 4
  %4 = load i32, i32* %temp, align 4
  %5 = load i32*, i32** %quot.addr, align 4
  %6 = load i32, i32* %5, align 4
  %7 = load i32, i32* %den.addr, align 4
  %mul1 = mul nsw i32 %6, %7
  %sub = sub nsw i32 %4, %mul1
  %8 = load i32*, i32** %rem.addr, align 4
  store i32 %sub, i32* %8, align 4
  ret void
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @engine()
  %0 = load i32, i32* @debug_val, align 4
  %cmp = icmp ne i32 %0, 191932
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, i32* @debug_base, align 4
  %cmp1 = icmp ne i32 %1, 3250
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load i32, i32* @debug_interval, align 4
  %cmp3 = icmp ne i32 %2, 418230
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0))
  store i32 15, i32* %retval
  br label %return

if.end:                                           ; preds = %lor.lhs.false2
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str1, i32 0, i32 0))
  store i32 66, i32* %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %3 = load i32, i32* %retval
  ret i32 %3
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"}
