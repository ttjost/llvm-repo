; ModuleID = 'huffman.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@luminance_dc_code_table = global [12 x i16] [i16 0, i16 2, i16 3, i16 4, i16 5, i16 6, i16 14, i16 30, i16 62, i16 126, i16 254, i16 510], align 2
@luminance_dc_size_table = global [12 x i16] [i16 2, i16 3, i16 3, i16 3, i16 3, i16 3, i16 4, i16 5, i16 6, i16 7, i16 8, i16 9], align 2
@chrominance_dc_code_table = global [12 x i16] [i16 0, i16 1, i16 2, i16 6, i16 14, i16 30, i16 62, i16 126, i16 254, i16 510, i16 1022, i16 2046], align 2
@chrominance_dc_size_table = global [12 x i16] [i16 2, i16 2, i16 2, i16 3, i16 4, i16 5, i16 6, i16 7, i16 8, i16 9, i16 10, i16 11], align 2
@luminance_ac_code_table = global [162 x i16] [i16 10, i16 0, i16 1, i16 4, i16 11, i16 26, i16 120, i16 248, i16 1014, i16 -126, i16 -125, i16 12, i16 27, i16 121, i16 502, i16 2038, i16 -124, i16 -123, i16 -122, i16 -121, i16 -120, i16 28, i16 249, i16 1015, i16 4084, i16 -119, i16 -118, i16 -117, i16 -116, i16 -115, i16 -114, i16 58, i16 503, i16 4085, i16 -113, i16 -112, i16 -111, i16 -110, i16 -109, i16 -108, i16 -107, i16 59, i16 1016, i16 -106, i16 -105, i16 -104, i16 -103, i16 -102, i16 -101, i16 -100, i16 -99, i16 122, i16 2039, i16 -98, i16 -97, i16 -96, i16 -95, i16 -94, i16 -93, i16 -92, i16 -91, i16 123, i16 4086, i16 -90, i16 -89, i16 -88, i16 -87, i16 -86, i16 -85, i16 -84, i16 -83, i16 250, i16 4087, i16 -82, i16 -81, i16 -80, i16 -79, i16 -78, i16 -77, i16 -76, i16 -75, i16 504, i16 32704, i16 -74, i16 -73, i16 -72, i16 -71, i16 -70, i16 -69, i16 -68, i16 -67, i16 505, i16 -66, i16 -65, i16 -64, i16 -63, i16 -62, i16 -61, i16 -60, i16 -59, i16 -58, i16 506, i16 -57, i16 -56, i16 -55, i16 -54, i16 -53, i16 -52, i16 -51, i16 -50, i16 -49, i16 1017, i16 -48, i16 -47, i16 -46, i16 -45, i16 -44, i16 -43, i16 -42, i16 -41, i16 -40, i16 1018, i16 -39, i16 -38, i16 -37, i16 -36, i16 -35, i16 -34, i16 -33, i16 -32, i16 -31, i16 2040, i16 -30, i16 -29, i16 -28, i16 -27, i16 -26, i16 -25, i16 -24, i16 -23, i16 -22, i16 -21, i16 -20, i16 -19, i16 -18, i16 -17, i16 -16, i16 -15, i16 -14, i16 -13, i16 -12, i16 -11, i16 -10, i16 -9, i16 -8, i16 -7, i16 -6, i16 -5, i16 -4, i16 -3, i16 -2, i16 2041], align 2
@luminance_ac_size_table = global [162 x i16] [i16 4, i16 2, i16 2, i16 3, i16 4, i16 5, i16 7, i16 8, i16 10, i16 16, i16 16, i16 4, i16 5, i16 7, i16 9, i16 11, i16 16, i16 16, i16 16, i16 16, i16 16, i16 5, i16 8, i16 10, i16 12, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 6, i16 9, i16 12, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 6, i16 10, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 7, i16 11, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 7, i16 12, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 8, i16 12, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 9, i16 15, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 9, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 9, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 10, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 10, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 11, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 11], align 2
@chrominance_ac_code_table = global [162 x i16] [i16 0, i16 1, i16 4, i16 10, i16 24, i16 25, i16 56, i16 120, i16 500, i16 1014, i16 4084, i16 11, i16 57, i16 246, i16 501, i16 2038, i16 4085, i16 -120, i16 -119, i16 -118, i16 -117, i16 26, i16 247, i16 1015, i16 4086, i16 32706, i16 -116, i16 -115, i16 -114, i16 -113, i16 -112, i16 27, i16 248, i16 1016, i16 4087, i16 -111, i16 -110, i16 -109, i16 -108, i16 -107, i16 -106, i16 58, i16 502, i16 -105, i16 -104, i16 -103, i16 -102, i16 -101, i16 -100, i16 -99, i16 -98, i16 59, i16 1017, i16 -97, i16 -96, i16 -95, i16 -94, i16 -93, i16 -92, i16 -91, i16 -90, i16 121, i16 2039, i16 -89, i16 -88, i16 -87, i16 -86, i16 -85, i16 -84, i16 -83, i16 -82, i16 122, i16 2040, i16 -81, i16 -80, i16 -79, i16 -78, i16 -77, i16 -76, i16 -75, i16 -74, i16 249, i16 -73, i16 -72, i16 -71, i16 -70, i16 -69, i16 -68, i16 -67, i16 -66, i16 -65, i16 503, i16 -64, i16 -63, i16 -62, i16 -61, i16 -60, i16 -59, i16 -58, i16 -57, i16 -56, i16 504, i16 -55, i16 -54, i16 -53, i16 -52, i16 -51, i16 -50, i16 -49, i16 -48, i16 -47, i16 505, i16 -46, i16 -45, i16 -44, i16 -43, i16 -42, i16 -41, i16 -40, i16 -39, i16 -38, i16 506, i16 -37, i16 -36, i16 -35, i16 -34, i16 -33, i16 -32, i16 -31, i16 -30, i16 -29, i16 2041, i16 -28, i16 -27, i16 -26, i16 -25, i16 -24, i16 -23, i16 -22, i16 -21, i16 -20, i16 16352, i16 -19, i16 -18, i16 -17, i16 -16, i16 -15, i16 -14, i16 -13, i16 -12, i16 -11, i16 32707, i16 -10, i16 -9, i16 -8, i16 -7, i16 -6, i16 -5, i16 -4, i16 -3, i16 -2, i16 1018], align 2
@chrominance_ac_size_table = global [162 x i16] [i16 2, i16 2, i16 3, i16 4, i16 5, i16 5, i16 6, i16 7, i16 9, i16 10, i16 12, i16 4, i16 6, i16 8, i16 9, i16 11, i16 12, i16 16, i16 16, i16 16, i16 16, i16 5, i16 8, i16 10, i16 12, i16 15, i16 16, i16 16, i16 16, i16 16, i16 16, i16 5, i16 8, i16 10, i16 12, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 6, i16 9, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 6, i16 10, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 7, i16 11, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 7, i16 11, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 8, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 9, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 9, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 9, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 9, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 11, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 14, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 15, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 16, i16 10], align 2
@bitsize = global [256 x i8] c"\00\01\02\02\03\03\03\03\04\04\04\04\04\04\04\04\05\05\05\05\05\05\05\05\05\05\05\05\05\05\05\05\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\06\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\07\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08\08", align 1
@.str = private unnamed_addr constant [13 x i8] c"huffman: %d\0A\00", align 1
@Temp = external global [64 x i16], align 2
@.str.1 = private unnamed_addr constant [11 x i8] c"Coeff: %d\0A\00", align 1
@global_ldc1 = external global i16, align 2
@global_ldc2 = external global i16, align 2
@global_ldc3 = external global i16, align 2
@.str.4 = private unnamed_addr constant [14 x i8] c"Huffsize: %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [14 x i8] c"DataSize: %d\0A\00", align 1
@.str.6 = private unnamed_addr constant [20 x i8] c"before putbits: %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [21 x i8] c"before bitindex: %d\0A\00", align 1
@bitindex = external global i16, align 2
@.str.8 = private unnamed_addr constant [20 x i8] c"before numbits: %d\0A\00", align 1
@lcode = external global i32, align 4
@.str.9 = private unnamed_addr constant [20 x i8] c"after putbits: %d\0A\0A\00", align 1
@.str.10 = private unnamed_addr constant [20 x i8] c"after bitindex: %d\0A\00", align 1
@.str.11 = private unnamed_addr constant [19 x i8] c"after numbits: %d\0A\00", align 1
@str = private unnamed_addr constant [11 x i8] c"Component2\00"
@str.12 = private unnamed_addr constant [11 x i8] c"Component1\00"

; Function Attrs: nounwind
define i32 @huffman(i16 zeroext %component, i8* %output_ptr, i32 %k) #0 {
entry:
  %call = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0), i32 %k) #1
  %0 = load i16, i16* getelementptr inbounds ([64 x i16], [64 x i16]* @Temp, i32 0, i32 0), align 2, !tbaa !1
  %conv = sext i16 %0 to i32
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 %conv) #1
  %cmp = icmp eq i16 %component, 1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %puts571 = tail call i32 @puts(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @str.12, i32 0, i32 0))
  %1 = load i16, i16* @global_ldc1, align 2, !tbaa !1
  store i16 %0, i16* @global_ldc1, align 2, !tbaa !1
  br label %if.end.11

if.else:                                          ; preds = %entry
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @str, i32 0, i32 0))
  %cmp7 = icmp eq i16 %component, 2
  br i1 %cmp7, label %if.then.9, label %if.else.10

if.then.9:                                        ; preds = %if.else
  %2 = load i16, i16* @global_ldc2, align 2, !tbaa !1
  store i16 %0, i16* @global_ldc2, align 2, !tbaa !1
  br label %if.end.11

if.else.10:                                       ; preds = %if.else
  %3 = load i16, i16* @global_ldc3, align 2, !tbaa !1
  store i16 %0, i16* @global_ldc3, align 2, !tbaa !1
  br label %if.end.11

if.end.11:                                        ; preds = %if.then.9, %if.else.10, %if.then
  %DcCodeTable.0 = phi i16* [ getelementptr inbounds ([12 x i16], [12 x i16]* @luminance_dc_code_table, i32 0, i32 0), %if.then ], [ getelementptr inbounds ([12 x i16], [12 x i16]* @chrominance_dc_code_table, i32 0, i32 0), %if.then.9 ], [ getelementptr inbounds ([12 x i16], [12 x i16]* @chrominance_dc_code_table, i32 0, i32 0), %if.else.10 ]
  %DcSizeTable.0 = phi i16* [ getelementptr inbounds ([12 x i16], [12 x i16]* @luminance_dc_size_table, i32 0, i32 0), %if.then ], [ getelementptr inbounds ([12 x i16], [12 x i16]* @chrominance_dc_size_table, i32 0, i32 0), %if.then.9 ], [ getelementptr inbounds ([12 x i16], [12 x i16]* @chrominance_dc_size_table, i32 0, i32 0), %if.else.10 ]
  %AcCodeTable.0 = phi i16* [ getelementptr inbounds ([162 x i16], [162 x i16]* @luminance_ac_code_table, i32 0, i32 0), %if.then ], [ getelementptr inbounds ([162 x i16], [162 x i16]* @chrominance_ac_code_table, i32 0, i32 0), %if.then.9 ], [ getelementptr inbounds ([162 x i16], [162 x i16]* @chrominance_ac_code_table, i32 0, i32 0), %if.else.10 ]
  %AcSizeTable.0 = phi i16* [ getelementptr inbounds ([162 x i16], [162 x i16]* @luminance_ac_size_table, i32 0, i32 0), %if.then ], [ getelementptr inbounds ([162 x i16], [162 x i16]* @chrominance_ac_size_table, i32 0, i32 0), %if.then.9 ], [ getelementptr inbounds ([162 x i16], [162 x i16]* @chrominance_ac_size_table, i32 0, i32 0), %if.else.10 ]
  %LastDc.0 = phi i16 [ %1, %if.then ], [ %2, %if.then.9 ], [ %3, %if.else.10 ]
  %sub = sub i16 %0, %LastDc.0
  %cmp16 = icmp slt i16 %sub, 0
  %sub19 = sub i16 0, %sub
  %sub.lobit = ashr i16 %sub, 15
  %Coeff.0 = add i16 %sub.lobit, %sub
  %cond = select i1 %cmp16, i16 %sub19, i16 %sub
  %cmp23.591 = icmp eq i16 %cond, 0
  br i1 %cmp23.591, label %while.end, label %while.body.preheader

while.body.preheader:                             ; preds = %if.end.11
  br label %while.body

while.body:                                       ; preds = %while.body.preheader, %while.body
  %DataSize.0593 = phi i16 [ %inc, %while.body ], [ 0, %while.body.preheader ]
  %AbsCoeff.0592 = phi i16 [ %shr.570, %while.body ], [ %cond, %while.body.preheader ]
  %shr.570 = lshr i16 %AbsCoeff.0592, 1
  %inc = add i16 %DataSize.0593, 1
  %cmp23 = icmp eq i16 %shr.570, 0
  br i1 %cmp23, label %while.end.loopexit, label %while.body

while.end.loopexit:                               ; preds = %while.body
  %inc.lcssa = phi i16 [ %inc, %while.body ]
  br label %while.end

while.end:                                        ; preds = %while.end.loopexit, %if.end.11
  %DataSize.0.lcssa = phi i16 [ 0, %if.end.11 ], [ %inc.lcssa, %while.end.loopexit ]
  %idxprom = zext i16 %DataSize.0.lcssa to i32
  %arrayidx = getelementptr inbounds i16, i16* %DcCodeTable.0, i32 %idxprom
  %4 = load i16, i16* %arrayidx, align 2, !tbaa !1
  %arrayidx28 = getelementptr inbounds i16, i16* %DcSizeTable.0, i32 %idxprom
  %5 = load i16, i16* %arrayidx28, align 2, !tbaa !1
  %shl = shl i32 1, %idxprom
  %sub30 = add i32 %shl, 65535
  %conv31.564 = zext i16 %Coeff.0 to i32
  %and = and i32 %sub30, %conv31.564
  %conv33 = zext i16 %4 to i32
  %shl35 = shl i32 %conv33, %idxprom
  %sext = shl nuw i32 %and, 16
  %conv36 = ashr exact i32 %sext, 16
  %or = or i32 %shl35, %conv36
  %conv37 = zext i16 %5 to i32
  %add = add i16 %5, %DataSize.0.lcssa
  %call41 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.4, i32 0, i32 0), i32 %conv37) #1
  %call43 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.5, i32 0, i32 0), i32 %idxprom) #1
  %call44 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.6, i32 0, i32 0), i32 %k) #1
  %6 = load i16, i16* @bitindex, align 2, !tbaa !1
  %conv45 = zext i16 %6 to i32
  %call46 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.7, i32 0, i32 0), i32 %conv45) #1
  %conv47 = zext i16 %add to i32
  %call48 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.8, i32 0, i32 0), i32 %conv47) #1
  %7 = load i16, i16* @bitindex, align 2, !tbaa !1
  %add51 = add i16 %add, -32
  %sub52 = add i16 %add51, %7
  %cmp55 = icmp slt i16 %sub52, 0
  %8 = load i32, i32* @lcode, align 4, !tbaa !5
  br i1 %cmp55, label %if.then.57, label %if.else.65

if.then.57:                                       ; preds = %while.end
  %shl59 = shl i32 %8, %conv47
  %or60 = or i32 %shl59, %or
  store i32 %or60, i32* @lcode, align 4, !tbaa !5
  %add63 = add i16 %7, %add
  br label %if.end.115

if.else.65:                                       ; preds = %while.end
  %conv54 = sext i16 %sub52 to i32
  %conv49 = zext i16 %7 to i32
  %sub67 = sub nsw i32 32, %conv49
  %shl68 = shl i32 %8, %sub67
  %shr70 = lshr i32 %or, %conv54
  %or71 = or i32 %shr70, %shl68
  store i32 %or71, i32* @lcode, align 4, !tbaa !5
  %shr72 = lshr i32 %or71, 24
  %conv73 = trunc i32 %shr72 to i8
  %inc74 = add nsw i32 %k, 1
  %arrayidx75 = getelementptr inbounds i8, i8* %output_ptr, i32 %k
  store i8 %conv73, i8* %arrayidx75, align 1, !tbaa !7
  %cmp77 = icmp eq i32 %shr72, 255
  br i1 %cmp77, label %if.then.79, label %if.end.82

if.then.79:                                       ; preds = %if.else.65
  %inc80 = add nsw i32 %k, 2
  %arrayidx81 = getelementptr inbounds i8, i8* %output_ptr, i32 %inc74
  store i8 0, i8* %arrayidx81, align 1, !tbaa !7
  br label %if.end.82

if.end.82:                                        ; preds = %if.then.79, %if.else.65
  %k.addr.0 = phi i32 [ %inc80, %if.then.79 ], [ %inc74, %if.else.65 ]
  %9 = load i32, i32* @lcode, align 4, !tbaa !5
  %shr83 = lshr i32 %9, 16
  %conv84 = trunc i32 %shr83 to i8
  %inc85 = add nsw i32 %k.addr.0, 1
  %arrayidx86 = getelementptr inbounds i8, i8* %output_ptr, i32 %k.addr.0
  store i8 %conv84, i8* %arrayidx86, align 1, !tbaa !7
  %conv87 = and i32 %shr83, 255
  %cmp88 = icmp eq i32 %conv87, 255
  br i1 %cmp88, label %if.then.90, label %if.end.93

if.then.90:                                       ; preds = %if.end.82
  %inc91 = add nsw i32 %k.addr.0, 2
  %arrayidx92 = getelementptr inbounds i8, i8* %output_ptr, i32 %inc85
  store i8 0, i8* %arrayidx92, align 1, !tbaa !7
  br label %if.end.93

if.end.93:                                        ; preds = %if.then.90, %if.end.82
  %k.addr.1 = phi i32 [ %inc91, %if.then.90 ], [ %inc85, %if.end.82 ]
  %10 = load i32, i32* @lcode, align 4, !tbaa !5
  %shr94 = lshr i32 %10, 8
  %conv95 = trunc i32 %shr94 to i8
  %inc96 = add nsw i32 %k.addr.1, 1
  %arrayidx97 = getelementptr inbounds i8, i8* %output_ptr, i32 %k.addr.1
  store i8 %conv95, i8* %arrayidx97, align 1, !tbaa !7
  %conv98 = and i32 %shr94, 255
  %cmp99 = icmp eq i32 %conv98, 255
  br i1 %cmp99, label %if.then.101, label %if.end.104

if.then.101:                                      ; preds = %if.end.93
  %inc102 = add nsw i32 %k.addr.1, 2
  %arrayidx103 = getelementptr inbounds i8, i8* %output_ptr, i32 %inc96
  store i8 0, i8* %arrayidx103, align 1, !tbaa !7
  br label %if.end.104

if.end.104:                                       ; preds = %if.then.101, %if.end.93
  %k.addr.2 = phi i32 [ %inc102, %if.then.101 ], [ %inc96, %if.end.93 ]
  %11 = load i32, i32* @lcode, align 4, !tbaa !5
  %conv105 = trunc i32 %11 to i8
  %inc106 = add nsw i32 %k.addr.2, 1
  %arrayidx107 = getelementptr inbounds i8, i8* %output_ptr, i32 %k.addr.2
  store i8 %conv105, i8* %arrayidx107, align 1, !tbaa !7
  %conv108 = and i32 %11, 255
  %cmp109 = icmp eq i32 %conv108, 255
  br i1 %cmp109, label %if.then.111, label %if.end.114

if.then.111:                                      ; preds = %if.end.104
  %inc112 = add nsw i32 %k.addr.2, 2
  %arrayidx113 = getelementptr inbounds i8, i8* %output_ptr, i32 %inc106
  store i8 0, i8* %arrayidx113, align 1, !tbaa !7
  br label %if.end.114

if.end.114:                                       ; preds = %if.then.111, %if.end.104
  %k.addr.3 = phi i32 [ %inc112, %if.then.111 ], [ %inc106, %if.end.104 ]
  store i32 %or, i32* @lcode, align 4, !tbaa !5
  br label %if.end.115

if.end.115:                                       ; preds = %if.end.114, %if.then.57
  %storemerge = phi i16 [ %sub52, %if.end.114 ], [ %add63, %if.then.57 ]
  %k.addr.4 = phi i32 [ %k.addr.3, %if.end.114 ], [ %k, %if.then.57 ]
  store i16 %storemerge, i16* @bitindex, align 2, !tbaa !1
  %call116 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.9, i32 0, i32 0), i32 %k.addr.4) #1
  %12 = load i16, i16* @bitindex, align 2, !tbaa !1
  %conv117 = zext i16 %12 to i32
  %call118 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.10, i32 0, i32 0), i32 %conv117) #1
  %call120 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.11, i32 0, i32 0), i32 %conv47) #1
  %arrayidx137 = getelementptr inbounds i16, i16* %AcCodeTable.0, i32 161
  %arrayidx139 = getelementptr inbounds i16, i16* %AcSizeTable.0, i32 161
  br label %for.body

for.body:                                         ; preds = %if.end.115, %for.inc
  %k.addr.5590 = phi i32 [ %k.addr.4, %if.end.115 ], [ %k.addr.16, %for.inc ]
  %RunLength.0589 = phi i16 [ 0, %if.end.115 ], [ %RunLength.2, %for.inc ]
  %Temp_Ptr.0588 = phi i16* [ getelementptr inbounds ([64 x i16], [64 x i16]* @Temp, i32 0, i32 1), %if.end.115 ], [ %incdec.ptr124, %for.inc ]
  %i.0587 = phi i16 [ 63, %if.end.115 ], [ %dec329, %for.inc ]
  %incdec.ptr124 = getelementptr inbounds i16, i16* %Temp_Ptr.0588, i32 1
  %13 = load i16, i16* %Temp_Ptr.0588, align 2, !tbaa !1
  %cmp126 = icmp eq i16 %13, 0
  br i1 %cmp126, label %if.else.326, label %while.cond.129.preheader

while.cond.129.preheader:                         ; preds = %for.body
  %cmp131.575.582 = icmp ugt i16 %RunLength.0589, 15
  br i1 %cmp131.575.582, label %while.body.133.lr.ph.lr.ph, label %while.end.207

while.body.133.lr.ph.lr.ph:                       ; preds = %while.cond.129.preheader
  %.pre.pre = load i16, i16* @bitindex, align 2, !tbaa !1
  %.pre601.pre = load i32, i32* @lcode, align 4, !tbaa !5
  br label %while.body.133.lr.ph

while.body.133.lr.ph:                             ; preds = %while.body.133.lr.ph.lr.ph, %if.end.205
  %.pre601 = phi i32 [ %.pre601.pre, %while.body.133.lr.ph.lr.ph ], [ %conv138, %if.end.205 ]
  %.pre = phi i16 [ %.pre.pre, %while.body.133.lr.ph.lr.ph ], [ %sub143.lcssa, %if.end.205 ]
  %k.addr.6.ph584 = phi i32 [ %k.addr.5590, %while.body.133.lr.ph.lr.ph ], [ %k.addr.10, %if.end.205 ]
  %RunLength.1.ph583 = phi i16 [ %RunLength.0589, %while.body.133.lr.ph.lr.ph ], [ %sub135.lcssa, %if.end.205 ]
  %14 = load i16, i16* %arrayidx137, align 2, !tbaa !1
  %conv138 = zext i16 %14 to i32
  %15 = load i16, i16* %arrayidx139, align 2, !tbaa !1
  %add142 = add i16 %15, -32
  %conv141 = zext i16 %15 to i32
  br label %while.body.133

while.body.133:                                   ; preds = %while.body.133.lr.ph, %if.then.148
  %16 = phi i32 [ %.pre601, %while.body.133.lr.ph ], [ %or151, %if.then.148 ]
  %17 = phi i16 [ %.pre, %while.body.133.lr.ph ], [ %add154, %if.then.148 ]
  %RunLength.1576 = phi i16 [ %RunLength.1.ph583, %while.body.133.lr.ph ], [ %sub135, %if.then.148 ]
  %sub135 = add i16 %RunLength.1576, -16
  %sub143 = add i16 %add142, %17
  %cmp146 = icmp slt i16 %sub143, 0
  br i1 %cmp146, label %if.then.148, label %if.else.156

if.then.148:                                      ; preds = %while.body.133
  %shl150 = shl i32 %16, %conv141
  %or151 = or i32 %shl150, %conv138
  store i32 %or151, i32* @lcode, align 4, !tbaa !5
  %add154 = add i16 %17, %15
  store i16 %add154, i16* @bitindex, align 2, !tbaa !1
  %cmp131 = icmp ugt i16 %sub135, 15
  br i1 %cmp131, label %while.body.133, label %while.end.207.loopexit

if.else.156:                                      ; preds = %while.body.133
  %sub143.lcssa = phi i16 [ %sub143, %while.body.133 ]
  %sub135.lcssa = phi i16 [ %sub135, %while.body.133 ]
  %.lcssa626 = phi i16 [ %17, %while.body.133 ]
  %.lcssa = phi i32 [ %16, %while.body.133 ]
  %conv145 = sext i16 %sub143.lcssa to i32
  %conv140 = zext i16 %.lcssa626 to i32
  %sub158 = sub nsw i32 32, %conv140
  %shl159 = shl i32 %.lcssa, %sub158
  %shr161 = lshr i32 %conv138, %conv145
  %or162 = or i32 %shr161, %shl159
  store i32 %or162, i32* @lcode, align 4, !tbaa !5
  %shr163 = lshr i32 %or162, 24
  %conv164 = trunc i32 %shr163 to i8
  %inc165 = add nsw i32 %k.addr.6.ph584, 1
  %arrayidx166 = getelementptr inbounds i8, i8* %output_ptr, i32 %k.addr.6.ph584
  store i8 %conv164, i8* %arrayidx166, align 1, !tbaa !7
  %cmp168 = icmp eq i32 %shr163, 255
  br i1 %cmp168, label %if.then.170, label %if.end.173

if.then.170:                                      ; preds = %if.else.156
  %inc171 = add nsw i32 %k.addr.6.ph584, 2
  %arrayidx172 = getelementptr inbounds i8, i8* %output_ptr, i32 %inc165
  store i8 0, i8* %arrayidx172, align 1, !tbaa !7
  br label %if.end.173

if.end.173:                                       ; preds = %if.then.170, %if.else.156
  %k.addr.7 = phi i32 [ %inc171, %if.then.170 ], [ %inc165, %if.else.156 ]
  %18 = load i32, i32* @lcode, align 4, !tbaa !5
  %shr174 = lshr i32 %18, 16
  %conv175 = trunc i32 %shr174 to i8
  %inc176 = add nsw i32 %k.addr.7, 1
  %arrayidx177 = getelementptr inbounds i8, i8* %output_ptr, i32 %k.addr.7
  store i8 %conv175, i8* %arrayidx177, align 1, !tbaa !7
  %conv178 = and i32 %shr174, 255
  %cmp179 = icmp eq i32 %conv178, 255
  br i1 %cmp179, label %if.then.181, label %if.end.184

if.then.181:                                      ; preds = %if.end.173
  %inc182 = add nsw i32 %k.addr.7, 2
  %arrayidx183 = getelementptr inbounds i8, i8* %output_ptr, i32 %inc176
  store i8 0, i8* %arrayidx183, align 1, !tbaa !7
  br label %if.end.184

if.end.184:                                       ; preds = %if.then.181, %if.end.173
  %k.addr.8 = phi i32 [ %inc182, %if.then.181 ], [ %inc176, %if.end.173 ]
  %19 = load i32, i32* @lcode, align 4, !tbaa !5
  %shr185 = lshr i32 %19, 8
  %conv186 = trunc i32 %shr185 to i8
  %inc187 = add nsw i32 %k.addr.8, 1
  %arrayidx188 = getelementptr inbounds i8, i8* %output_ptr, i32 %k.addr.8
  store i8 %conv186, i8* %arrayidx188, align 1, !tbaa !7
  %conv189 = and i32 %shr185, 255
  %cmp190 = icmp eq i32 %conv189, 255
  br i1 %cmp190, label %if.then.192, label %if.end.195

if.then.192:                                      ; preds = %if.end.184
  %inc193 = add nsw i32 %k.addr.8, 2
  %arrayidx194 = getelementptr inbounds i8, i8* %output_ptr, i32 %inc187
  store i8 0, i8* %arrayidx194, align 1, !tbaa !7
  br label %if.end.195

if.end.195:                                       ; preds = %if.then.192, %if.end.184
  %k.addr.9 = phi i32 [ %inc193, %if.then.192 ], [ %inc187, %if.end.184 ]
  %20 = load i32, i32* @lcode, align 4, !tbaa !5
  %conv196 = trunc i32 %20 to i8
  %inc197 = add nsw i32 %k.addr.9, 1
  %arrayidx198 = getelementptr inbounds i8, i8* %output_ptr, i32 %k.addr.9
  store i8 %conv196, i8* %arrayidx198, align 1, !tbaa !7
  %conv199 = and i32 %20, 255
  %cmp200 = icmp eq i32 %conv199, 255
  br i1 %cmp200, label %if.then.202, label %if.end.205

if.then.202:                                      ; preds = %if.end.195
  %inc203 = add nsw i32 %k.addr.9, 2
  %arrayidx204 = getelementptr inbounds i8, i8* %output_ptr, i32 %inc197
  store i8 0, i8* %arrayidx204, align 1, !tbaa !7
  br label %if.end.205

if.end.205:                                       ; preds = %if.then.202, %if.end.195
  %k.addr.10 = phi i32 [ %inc203, %if.then.202 ], [ %inc197, %if.end.195 ]
  store i32 %conv138, i32* @lcode, align 4, !tbaa !5
  store i16 %sub143.lcssa, i16* @bitindex, align 2, !tbaa !1
  %cmp131.575 = icmp ugt i16 %sub135.lcssa, 15
  br i1 %cmp131.575, label %while.body.133.lr.ph, label %while.end.207.loopexit618

while.end.207.loopexit:                           ; preds = %if.then.148
  %k.addr.6.ph584.lcssa630 = phi i32 [ %k.addr.6.ph584, %if.then.148 ]
  %sub135.lcssa628 = phi i16 [ %sub135, %if.then.148 ]
  br label %while.end.207

while.end.207.loopexit618:                        ; preds = %if.end.205
  %k.addr.10.lcssa = phi i32 [ %k.addr.10, %if.end.205 ]
  %sub135.lcssa.lcssa = phi i16 [ %sub135.lcssa, %if.end.205 ]
  br label %while.end.207

while.end.207:                                    ; preds = %while.end.207.loopexit618, %while.end.207.loopexit, %while.cond.129.preheader
  %k.addr.6.ph.lcssa = phi i32 [ %k.addr.5590, %while.cond.129.preheader ], [ %k.addr.6.ph584.lcssa630, %while.end.207.loopexit ], [ %k.addr.10.lcssa, %while.end.207.loopexit618 ]
  %conv130.lcssa.in = phi i16 [ %RunLength.0589, %while.cond.129.preheader ], [ %sub135.lcssa628, %while.end.207.loopexit ], [ %sub135.lcssa.lcssa, %while.end.207.loopexit618 ]
  %conv130.lcssa = zext i16 %conv130.lcssa.in to i32
  %cmp209 = icmp slt i16 %13, 0
  %sub214 = sub i16 0, %13
  %.lobit = ashr i16 %13, 15
  %Coeff.1 = add i16 %.lobit, %13
  %cond218 = select i1 %cmp209, i16 %sub214, i16 %13
  %conv220 = zext i16 %cond218 to i32
  %shr221.565 = lshr i32 %conv220, 8
  %cmp222 = icmp eq i32 %shr221.565, 0
  br i1 %cmp222, label %if.then.224, label %if.else.228

if.then.224:                                      ; preds = %while.end.207
  %arrayidx226 = getelementptr inbounds [256 x i8], [256 x i8]* @bitsize, i32 0, i32 %conv220
  %21 = load i8, i8* %arrayidx226, align 1, !tbaa !7
  %conv227 = zext i8 %21 to i32
  br label %if.end.235

if.else.228:                                      ; preds = %while.end.207
  %arrayidx231 = getelementptr inbounds [256 x i8], [256 x i8]* @bitsize, i32 0, i32 %shr221.565
  %22 = load i8, i8* %arrayidx231, align 1, !tbaa !7
  %conv232 = zext i8 %22 to i32
  %add233 = add nuw nsw i32 %conv232, 8
  br label %if.end.235

if.end.235:                                       ; preds = %if.else.228, %if.then.224
  %DataSize.1 = phi i32 [ %conv227, %if.then.224 ], [ %add233, %if.else.228 ]
  %mul = mul nuw nsw i32 %conv130.lcssa, 10
  %conv237 = and i32 %DataSize.1, 65535
  %add238 = add nsw i32 %DataSize.1, %mul
  %idxprom240 = and i32 %add238, 65535
  %arrayidx241 = getelementptr inbounds i16, i16* %AcCodeTable.0, i32 %idxprom240
  %23 = load i16, i16* %arrayidx241, align 2, !tbaa !1
  %arrayidx243 = getelementptr inbounds i16, i16* %AcSizeTable.0, i32 %idxprom240
  %24 = load i16, i16* %arrayidx243, align 2, !tbaa !1
  %shl245 = shl i32 1, %conv237
  %sub246 = add i32 %shl245, 65535
  %conv247.566 = zext i16 %Coeff.1 to i32
  %and248 = and i32 %sub246, %conv247.566
  %conv250 = zext i16 %23 to i32
  %shl252 = shl i32 %conv250, %conv237
  %sext567 = shl nuw i32 %and248, 16
  %conv253 = ashr exact i32 %sext567, 16
  %or254 = or i32 %conv253, %shl252
  %conv255 = zext i16 %24 to i32
  %add257 = add nsw i32 %conv255, %DataSize.1
  %25 = load i16, i16* @bitindex, align 2, !tbaa !1
  %conv259 = zext i16 %25 to i32
  %conv260 = and i32 %add257, 65535
  %add261 = add nsw i32 %add257, 65504
  %sub262 = add nsw i32 %add261, %conv259
  %sext568 = shl i32 %sub262, 16
  %cmp265 = icmp slt i32 %sext568, 0
  %26 = load i32, i32* @lcode, align 4, !tbaa !5
  br i1 %cmp265, label %if.then.267, label %if.else.275

if.then.267:                                      ; preds = %if.end.235
  %shl269 = shl i32 %26, %conv260
  %or270 = or i32 %or254, %shl269
  store i32 %or270, i32* @lcode, align 4, !tbaa !5
  %add273 = add nuw nsw i32 %conv259, %conv260
  br label %if.end.325

if.else.275:                                      ; preds = %if.end.235
  %conv264 = ashr exact i32 %sext568, 16
  %sub277 = sub nsw i32 32, %conv259
  %shl278 = shl i32 %26, %sub277
  %shr280 = lshr i32 %or254, %conv264
  %or281 = or i32 %shr280, %shl278
  store i32 %or281, i32* @lcode, align 4, !tbaa !5
  %shr282 = lshr i32 %or281, 24
  %conv283 = trunc i32 %shr282 to i8
  %inc284 = add nsw i32 %k.addr.6.ph.lcssa, 1
  %arrayidx285 = getelementptr inbounds i8, i8* %output_ptr, i32 %k.addr.6.ph.lcssa
  store i8 %conv283, i8* %arrayidx285, align 1, !tbaa !7
  %cmp287 = icmp eq i32 %shr282, 255
  br i1 %cmp287, label %if.then.289, label %if.end.292

if.then.289:                                      ; preds = %if.else.275
  %inc290 = add nsw i32 %k.addr.6.ph.lcssa, 2
  %arrayidx291 = getelementptr inbounds i8, i8* %output_ptr, i32 %inc284
  store i8 0, i8* %arrayidx291, align 1, !tbaa !7
  br label %if.end.292

if.end.292:                                       ; preds = %if.then.289, %if.else.275
  %k.addr.11 = phi i32 [ %inc290, %if.then.289 ], [ %inc284, %if.else.275 ]
  %27 = load i32, i32* @lcode, align 4, !tbaa !5
  %shr293 = lshr i32 %27, 16
  %conv294 = trunc i32 %shr293 to i8
  %inc295 = add nsw i32 %k.addr.11, 1
  %arrayidx296 = getelementptr inbounds i8, i8* %output_ptr, i32 %k.addr.11
  store i8 %conv294, i8* %arrayidx296, align 1, !tbaa !7
  %conv297 = and i32 %shr293, 255
  %cmp298 = icmp eq i32 %conv297, 255
  br i1 %cmp298, label %if.then.300, label %if.end.303

if.then.300:                                      ; preds = %if.end.292
  %inc301 = add nsw i32 %k.addr.11, 2
  %arrayidx302 = getelementptr inbounds i8, i8* %output_ptr, i32 %inc295
  store i8 0, i8* %arrayidx302, align 1, !tbaa !7
  br label %if.end.303

if.end.303:                                       ; preds = %if.then.300, %if.end.292
  %k.addr.12 = phi i32 [ %inc301, %if.then.300 ], [ %inc295, %if.end.292 ]
  %28 = load i32, i32* @lcode, align 4, !tbaa !5
  %shr304 = lshr i32 %28, 8
  %conv305 = trunc i32 %shr304 to i8
  %inc306 = add nsw i32 %k.addr.12, 1
  %arrayidx307 = getelementptr inbounds i8, i8* %output_ptr, i32 %k.addr.12
  store i8 %conv305, i8* %arrayidx307, align 1, !tbaa !7
  %conv308 = and i32 %shr304, 255
  %cmp309 = icmp eq i32 %conv308, 255
  br i1 %cmp309, label %if.then.311, label %if.end.314

if.then.311:                                      ; preds = %if.end.303
  %inc312 = add nsw i32 %k.addr.12, 2
  %arrayidx313 = getelementptr inbounds i8, i8* %output_ptr, i32 %inc306
  store i8 0, i8* %arrayidx313, align 1, !tbaa !7
  br label %if.end.314

if.end.314:                                       ; preds = %if.then.311, %if.end.303
  %k.addr.13 = phi i32 [ %inc312, %if.then.311 ], [ %inc306, %if.end.303 ]
  %29 = load i32, i32* @lcode, align 4, !tbaa !5
  %conv315 = trunc i32 %29 to i8
  %inc316 = add nsw i32 %k.addr.13, 1
  %arrayidx317 = getelementptr inbounds i8, i8* %output_ptr, i32 %k.addr.13
  store i8 %conv315, i8* %arrayidx317, align 1, !tbaa !7
  %conv318 = and i32 %29, 255
  %cmp319 = icmp eq i32 %conv318, 255
  br i1 %cmp319, label %if.then.321, label %if.end.324

if.then.321:                                      ; preds = %if.end.314
  %inc322 = add nsw i32 %k.addr.13, 2
  %arrayidx323 = getelementptr inbounds i8, i8* %output_ptr, i32 %inc316
  store i8 0, i8* %arrayidx323, align 1, !tbaa !7
  br label %if.end.324

if.end.324:                                       ; preds = %if.then.321, %if.end.314
  %k.addr.14 = phi i32 [ %inc322, %if.then.321 ], [ %inc316, %if.end.314 ]
  store i32 %or254, i32* @lcode, align 4, !tbaa !5
  br label %if.end.325

if.end.325:                                       ; preds = %if.end.324, %if.then.267
  %storemerge.569.in = phi i32 [ %sub262, %if.end.324 ], [ %add273, %if.then.267 ]
  %k.addr.15 = phi i32 [ %k.addr.14, %if.end.324 ], [ %k.addr.6.ph.lcssa, %if.then.267 ]
  %storemerge.569 = trunc i32 %storemerge.569.in to i16
  store i16 %storemerge.569, i16* @bitindex, align 2, !tbaa !1
  br label %for.inc

if.else.326:                                      ; preds = %for.body
  %inc327 = add i16 %RunLength.0589, 1
  br label %for.inc

for.inc:                                          ; preds = %if.end.325, %if.else.326
  %RunLength.2 = phi i16 [ 0, %if.end.325 ], [ %inc327, %if.else.326 ]
  %k.addr.16 = phi i32 [ %k.addr.15, %if.end.325 ], [ %k.addr.5590, %if.else.326 ]
  %dec329 = add nsw i16 %i.0587, -1
  %cmp122 = icmp eq i16 %dec329, 0
  br i1 %cmp122, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc
  %k.addr.16.lcssa = phi i32 [ %k.addr.16, %for.inc ]
  %RunLength.2.lcssa = phi i16 [ %RunLength.2, %for.inc ]
  %cmp331 = icmp eq i16 %RunLength.2.lcssa, 0
  br i1 %cmp331, label %if.end.404, label %if.then.333

if.then.333:                                      ; preds = %for.end
  %30 = load i16, i16* %AcCodeTable.0, align 2, !tbaa !1
  %conv335 = zext i16 %30 to i32
  %31 = load i16, i16* %AcSizeTable.0, align 2, !tbaa !1
  %32 = load i16, i16* @bitindex, align 2, !tbaa !1
  %add339 = add i16 %31, -32
  %sub340 = add i16 %add339, %32
  %cmp343 = icmp slt i16 %sub340, 0
  %33 = load i32, i32* @lcode, align 4, !tbaa !5
  br i1 %cmp343, label %if.then.345, label %if.else.353

if.then.345:                                      ; preds = %if.then.333
  %conv338 = zext i16 %31 to i32
  %shl347 = shl i32 %33, %conv338
  %or348 = or i32 %shl347, %conv335
  store i32 %or348, i32* @lcode, align 4, !tbaa !5
  %add351 = add i16 %32, %31
  store i16 %add351, i16* @bitindex, align 2, !tbaa !1
  br label %if.end.404

if.else.353:                                      ; preds = %if.then.333
  %conv342 = sext i16 %sub340 to i32
  %conv337 = zext i16 %32 to i32
  %sub355 = sub nsw i32 32, %conv337
  %shl356 = shl i32 %33, %sub355
  %shr358 = lshr i32 %conv335, %conv342
  %or359 = or i32 %shr358, %shl356
  store i32 %or359, i32* @lcode, align 4, !tbaa !5
  %shr360 = lshr i32 %or359, 24
  %conv361 = trunc i32 %shr360 to i8
  %inc362 = add nsw i32 %k.addr.16.lcssa, 1
  %arrayidx363 = getelementptr inbounds i8, i8* %output_ptr, i32 %k.addr.16.lcssa
  store i8 %conv361, i8* %arrayidx363, align 1, !tbaa !7
  %cmp365 = icmp eq i32 %shr360, 255
  br i1 %cmp365, label %if.then.367, label %if.end.370

if.then.367:                                      ; preds = %if.else.353
  %inc368 = add nsw i32 %k.addr.16.lcssa, 2
  %arrayidx369 = getelementptr inbounds i8, i8* %output_ptr, i32 %inc362
  store i8 0, i8* %arrayidx369, align 1, !tbaa !7
  br label %if.end.370

if.end.370:                                       ; preds = %if.then.367, %if.else.353
  %k.addr.17 = phi i32 [ %inc368, %if.then.367 ], [ %inc362, %if.else.353 ]
  %34 = load i32, i32* @lcode, align 4, !tbaa !5
  %shr371 = lshr i32 %34, 16
  %conv372 = trunc i32 %shr371 to i8
  %inc373 = add nsw i32 %k.addr.17, 1
  %arrayidx374 = getelementptr inbounds i8, i8* %output_ptr, i32 %k.addr.17
  store i8 %conv372, i8* %arrayidx374, align 1, !tbaa !7
  %conv375 = and i32 %shr371, 255
  %cmp376 = icmp eq i32 %conv375, 255
  br i1 %cmp376, label %if.then.378, label %if.end.381

if.then.378:                                      ; preds = %if.end.370
  %inc379 = add nsw i32 %k.addr.17, 2
  %arrayidx380 = getelementptr inbounds i8, i8* %output_ptr, i32 %inc373
  store i8 0, i8* %arrayidx380, align 1, !tbaa !7
  br label %if.end.381

if.end.381:                                       ; preds = %if.then.378, %if.end.370
  %k.addr.18 = phi i32 [ %inc379, %if.then.378 ], [ %inc373, %if.end.370 ]
  %35 = load i32, i32* @lcode, align 4, !tbaa !5
  %shr382 = lshr i32 %35, 8
  %conv383 = trunc i32 %shr382 to i8
  %inc384 = add nsw i32 %k.addr.18, 1
  %arrayidx385 = getelementptr inbounds i8, i8* %output_ptr, i32 %k.addr.18
  store i8 %conv383, i8* %arrayidx385, align 1, !tbaa !7
  %conv386 = and i32 %shr382, 255
  %cmp387 = icmp eq i32 %conv386, 255
  br i1 %cmp387, label %if.then.389, label %if.end.392

if.then.389:                                      ; preds = %if.end.381
  %inc390 = add nsw i32 %k.addr.18, 2
  %arrayidx391 = getelementptr inbounds i8, i8* %output_ptr, i32 %inc384
  store i8 0, i8* %arrayidx391, align 1, !tbaa !7
  br label %if.end.392

if.end.392:                                       ; preds = %if.then.389, %if.end.381
  %k.addr.19 = phi i32 [ %inc390, %if.then.389 ], [ %inc384, %if.end.381 ]
  %36 = load i32, i32* @lcode, align 4, !tbaa !5
  %conv393 = trunc i32 %36 to i8
  %inc394 = add nsw i32 %k.addr.19, 1
  %arrayidx395 = getelementptr inbounds i8, i8* %output_ptr, i32 %k.addr.19
  store i8 %conv393, i8* %arrayidx395, align 1, !tbaa !7
  %conv396 = and i32 %36, 255
  %cmp397 = icmp eq i32 %conv396, 255
  br i1 %cmp397, label %if.then.399, label %if.end.402

if.then.399:                                      ; preds = %if.end.392
  %inc400 = add nsw i32 %k.addr.19, 2
  %arrayidx401 = getelementptr inbounds i8, i8* %output_ptr, i32 %inc394
  store i8 0, i8* %arrayidx401, align 1, !tbaa !7
  br label %if.end.402

if.end.402:                                       ; preds = %if.then.399, %if.end.392
  %k.addr.20 = phi i32 [ %inc400, %if.then.399 ], [ %inc394, %if.end.392 ]
  store i32 %conv335, i32* @lcode, align 4, !tbaa !5
  store i16 %sub340, i16* @bitindex, align 2, !tbaa !1
  br label %if.end.404

if.end.404:                                       ; preds = %for.end, %if.then.345, %if.end.402
  %k.addr.21 = phi i32 [ %k.addr.16.lcssa, %if.then.345 ], [ %k.addr.20, %if.end.402 ], [ %k.addr.16.lcssa, %for.end ]
  ret i32 %k.addr.21
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #0

; Function Attrs: nounwind
define i32 @closeBitstream(i8* nocapture %outputBuffer, i32 %k) #0 {
entry:
  %0 = load i16, i16* @bitindex, align 2, !tbaa !1
  %cmp = icmp eq i16 %0, 0
  br i1 %cmp, label %if.end.14, label %if.then

if.then:                                          ; preds = %entry
  %conv = zext i16 %0 to i32
  %sub = sub nsw i32 32, %conv
  %1 = load i32, i32* @lcode, align 4, !tbaa !5
  %shl = shl i32 %1, %sub
  store i32 %shl, i32* @lcode, align 4, !tbaa !5
  %add = add nuw nsw i32 %conv, 7
  %shr.22 = lshr i32 %add, 3
  %conv4 = trunc i32 %shr.22 to i16
  %cmp6.23 = icmp eq i16 %conv4, 0
  br i1 %cmp6.23, label %if.end.14, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %if.then
  %2 = lshr i32 %shl, 24
  %3 = trunc i32 %2 to i8
  br label %for.body

for.body:                                         ; preds = %for.inc.for.body_crit_edge, %for.body.lr.ph
  %4 = phi i8 [ %3, %for.body.lr.ph ], [ %.pre, %for.inc.for.body_crit_edge ]
  %ptr.026 = phi i8* [ getelementptr (i8, i8* bitcast (i32* @lcode to i8*), i32 3), %for.body.lr.ph ], [ %incdec.ptr, %for.inc.for.body_crit_edge ]
  %k.addr.025 = phi i32 [ %k, %for.body.lr.ph ], [ %k.addr.1, %for.inc.for.body_crit_edge ]
  %i.024 = phi i16 [ %conv4, %for.body.lr.ph ], [ %dec, %for.inc.for.body_crit_edge ]
  %incdec.ptr = getelementptr inbounds i8, i8* %ptr.026, i32 -1
  %inc = add nsw i32 %k.addr.025, 1
  %arrayidx = getelementptr inbounds i8, i8* %outputBuffer, i32 %k.addr.025
  store i8 %4, i8* %arrayidx, align 1, !tbaa !7
  %cmp9 = icmp eq i8 %4, -1
  br i1 %cmp9, label %if.then.11, label %for.inc

if.then.11:                                       ; preds = %for.body
  %inc12 = add nsw i32 %k.addr.025, 2
  %arrayidx13 = getelementptr inbounds i8, i8* %outputBuffer, i32 %inc
  store i8 0, i8* %arrayidx13, align 1, !tbaa !7
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then.11
  %k.addr.1 = phi i32 [ %inc12, %if.then.11 ], [ %inc, %for.body ]
  %dec = add i16 %i.024, -1
  %cmp6 = icmp eq i16 %dec, 0
  br i1 %cmp6, label %if.end.14.loopexit, label %for.inc.for.body_crit_edge

for.inc.for.body_crit_edge:                       ; preds = %for.inc
  %.pre = load i8, i8* %incdec.ptr, align 1, !tbaa !7
  br label %for.body

if.end.14.loopexit:                               ; preds = %for.inc
  %k.addr.1.lcssa = phi i32 [ %k.addr.1, %for.inc ]
  br label %if.end.14

if.end.14:                                        ; preds = %if.end.14.loopexit, %if.then, %entry
  %k.addr.2 = phi i32 [ %k, %entry ], [ %k, %if.then ], [ %k.addr.1.lcssa, %if.end.14.loopexit ]
  ret i32 %k.addr.2
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #1

attributes #0 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.1 (tags/RELEASE_371/final)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"short", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !3, i64 0}
!7 = !{!3, !3, i64 0}
