; ModuleID = 'sobel_print.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@in = constant [1024 x i8] c"`8z\BE\F6:\B7\03>m+K#M/X\08\07\F2\F1\0FpX\F6\988\1F\B4\08_Cz\CB\E7\A4l\9B\CA\E5\96\01.\96D\1C\D6\94\90\A0\DC\AF;!\9D\8E\C0\91\F3\CF\A6\07\A9r\15\C1+w\ACl}\C4\91\A2nL\C9\B3\0Cn\C8\A7Z\9AK\83@:f\CB\C2\CE\D8HtY\A6\0B-\FB\E6\B1\FA\DF\DB\E7VVB0\97D\EB\E5\AA\BA\8A}\02\E4\CE\0E\CD%\B3\14h\80\14p\159\83\B2\EB\BB\5C\9A\0D\BC\17\DB\1E\9E\DE#\F4\18_W\8B\15\E2#;\DC\9D\B1-pG\B7\0B9\EA\B7\F6\E3\FD\82\BD\85\B1\FDJ\06\8B'_\BC2Z\82U\8A\D06\FA\00hk\B1'\AA6\02\84\08\C4\DD\A5f\8C\BAx\DC\C4\01\D9\BA\15\ADl\CC\91+\AC\DE\E4\87D\82\C9\CA\9D\10\C0\9D\B7\ED\FD1<\10\A3b\D2\C21\1A\B0\A4<\F3t\F6^ 2\15n\8D\D0E\F1C\90\B1\CF\11\ED\AFIh\ABG*\86)\F5<\D7\F9\AE\FD\97\B2 \92\BB\04>\FC\11\0C\FB\89\A6\E8T\8Cg\8E\94P\0A\D9\D3I.\E4\BF\8C\C0\9B\9E\80\A1\8E\93\D5\85\08\1F\B5\1E`\EA:x\8E\C3\1F\A6\00\E5\B9\9E\AE|'alg\C8^~>\ED\18q\95\CF\06(\82\C3\B94\5C\ABDi\C5\AF\D7\AD\EB-\AD\13\0A\ED('4\999\8BTk\05\C2p(\C5K-L\ED\F1\98\86\90a#f\02\FD\ECT\BE\EFE\C4\8A\7Fp\A7\D8\A9\AA$o\EAj\87JZ\EAy\C0\FF\E6q\E4_\A3j.V2\D6Z*\F5\D2\90\DCb\9A\C4\C0\06>_O\CD\95\1E<\80r:\C4\8E\15\C9J\0E\E4d\22\04[\08\AC\E2?A\A5R\19\84\B92\E2\DC[\E0\FA\C9\D9\B6_d\AA\D8\1A\C7\0A,\FC\AB\C8\A9\8AQ^\D55\A6B\88\CE\A1{\F58\F0v\EA^\D2\19VgF\18\0C(e\88\C6\DA\0C\B1k\0C\BD'\94\DA\C6\1BL_\A3\EE\17g\A0\065i\C2\E5'\B3\E7wr\E7,\AA\A2\A5\8ED\91\89\D3\F0\E9X\AA\99\E6u\11\FA`\99\F6u\08\C2!$\F1lP.R\FE\A3[\89\87:\E9c\A9\1C\9F\9A\D5Z#\9E\B8s\88\98\F4\FA+\AB\13v\BE|\B8\88\A5\F4\16S\80D\A6\17\08)\14\1F\1Eqy\DD!\BD\CFR\7F\87\A1\B3\8Ef\02I\9C\90\BF\98D\A0\D7\C3\03\9A+.\0A+qeU4n<\FB\89d6\C8\F5\C8*\08\818#\A5\F5\AB\88t\9F\E9|\CBR>\87V\B1ju*\AD\DB~\1AK\1D\A6I\AA\91f\00D\5C\8C\C2t\A2_\9C7\F4\06\C06\06)T\03\A5\D8\87\A3\E7\AC\E6L\A3+\ECo#p\DF\F7\18\0B\D9\D3\CD%$\B2\9F\E8\CB\0D\AC\1Dmj\CB\16T\DD\BB\CD\C5\D2\9EM\99\0A\A7P\0C\E3\12)\D4\DBT\E4uV\94\AB\D3\9FYj\08,\83\B6w%\7F\EA!'\B6\937DE\0D\EFN\F3m\9AU_\A1\F6my\D6\C0\B43\19\8D\92w@\DAB[\0Ba\91\92\85\AE\E6%\B0\F0\81c`\14\07\16g\0F=\F7\F2{\14b2e\E5M>d\FCv7\EEZ\DB\AC\E6\B6o@x\C5\0A\8A)\BB\A0<)\10\B5\86\EB\87\10\BC\F7k\AE5\FE\1B\F9v.\C9:\90\C8~K\C6\EE`\90r\C17&(\AB-]\1B\F8\D5d\BF\ABnB\B0\8Fg\0D\D1\8B&U\B8:\04\E0I\BB\9C\9C\A0\C5E\D14\FD\DC\958\8B\C6\85D\EA4\B14\FF\A9\D8Pm\B8\D4\AD'\12W\D2F\C0\D7\9D\1B\AC\C6g\88e\06f\8B\22\9CS\1B\07\A3L7\A7\82\FB;\C9a\F6to\D8h\F7\13\E9\F1\AE30\CB\B3\10X-\E0\B1\D1\F3\A6.\BF~\1D*5\D8]\A0\A2\1C\0B\E3\8B\146\DFz#c\A46e\E6%3\14s", align 1
@out_comp = constant [958 x i8] c"\00\C26\FF\EC\B6\FF\FF\FF\FF\FF\FF\FF\FF\E8\FF\FF\FF\FF\FFJ\E4\FF\FFd\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\EA\FF\94\FF\FF\FF\FF^\AC\BC\FF\FF\FFJ\FF\FF\A8\C6\FF`\FF\FF\FF\FF\FF\FF\AA\A2\FF\FF\FFp\FF\FF\E0\AE\FF\FFp\FF\5C\D6\FF\FF\FF\9C\FF\D8\F6\88\FF\FF\FF\FF\EA\D4\FF\B6\D4,\FF^\FF\FF\FCn\FF\B8\FF\E2\FF\FF\FF\FF\FF\FF\FF\FF\FF\F2>p\FF\94\FF\FF\D4\FF\C8\BE\DC\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FE\FF\FF\FF\FF\90\FF\FF\F0\FF\FF\FF\86\FF\FF\FF\FF\FF\FF\FF\FF\E0H\FF\FF\FF\FF\FF\FF\FF\FF\FFD\FF\DE\FF\FF\FF\FF\FF\FF\FF\FF\FF\F8\FF\FF\C4\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\CE\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\88\FF\FF\FF\FF\FF\FF\FF\C2\FF<\CC\E6\E4\FA\FE\FF\FF\FF\EA\FF\FFP\FF\FF\FF\FF\FF\8C\AAT\96\FFD\FF\FF\FF\FFF\FF\FF\FF\FF\FFX\FF\FFv\FFx\FF\FF\FF\FF\FF\FF\FF\8E6\FF\FF\FF\FF\FF\A2\FFJ\FF\F6\FF\82\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\B6\FF\FF\FF\84\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\DA\FF\FF\FF\FF\96\FF\A4\FF\FF\D0x\FF\FF\FFx\FF\FF\FF\FF\5C\FF\AA\FF\FF\90\FF\FF\FF\FF|\FF\FF\FF\FF\FF\FF\FF\E0\FF\FF\EE\FF\FF\FF\FF\B8\8A\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\BA\FF\FE\FF\FF\FF\FF\FF:\FF\FF\FF\E2*\FF\F2\FF\BA\FF\FF\FF\FF\FF\FF\FF\FF\80\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\14\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FFR`\FF\FF\FF\FF\FF\E8\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\84\F2\FF\FF\FF\FF\FF\EC\FF\FF\E6\FF\FF\FF\D8\AA\FF\92\FF\FF\FF\FF\FF\FF\A4\FF\FF\FF\FF\FF\FF\C2\FF\CE\EA\FF\BE2\F4\AA\FF\FF\FF\FF\FF\FF\F6\FF\FF\FFh\FF\FF\FF\F2\FF\9C\FF\FF\FF\FF\FF\FF\FF\E2\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\CA\FF\FF\FF\FF\D6\C6\FC\FFL\FF\FF\FF\B2\FF\FF\FF\FF\FF\FF\FF\FF\E0v\FF\84\FF\FF\FF\BE\FF\FF\FF\FF\FF\FF\FF\FF\FFV\FF\FF\FF\FF\8C\FF\BE\FF\FF\FF\84\FF\FF\FFh\FF\FF\FF\D0\EE\E2\E0\FF\FF\FF\FF\FF\80\22\FF\FF\FF\FF\FF\FF\FF\FA\FF\FF\DC\FF\FF\FF\FF\FF\FF\FF\B0\FF\FF\FF\FF\FF\FF\18\FF\FF\FF\FF\FF\FF\D2\FF\EEd\FF\FF\FF\E4\FFj\FF\FF\FF\A8\FF\FF\FF>\FF\FF\1C\FF\FF\FF\A6\FF\C2x\92\FF\FF\FF\FF\FF\FF\FF\82\FFx\FF\FF\FF\FF\FF\FF\FF\D8\FF\FFX\FF\FF\FF\FFd\E8\CC\FFX\C4\AE\FF\FF\FF\BA\FFl\FF\FF\FF\FF\D8\A2\FF\8EV\FF\FF\FF\FF\FF\FF\FF\FF\BA\FF\94\FF\FF\FF\FF\FFd\FF\F4\FF\FF\FF\FF\FC\FF\FF\FFn\FF\FF\A0\C4\FF\FF\FF\FF\FF\FF\FF\FF\FF^\FF\FF\FF\FF\FF\E8\AE\FF\C4\B2\F4\FF\FF\FF\FF\FFh\FF\FF\FF\96\FF\FF\F0\FF@\FF\FF\FF\FF\FFB\FF\EA\FF\FF\FFp\FF\FF\EC\FFj\FF\80\C8\FF\FF\FF\FF\FF\FF\FF\FF\AC\FF\FF\FF\F8\DC\FF\FF\FF\FF\FF\B4\FF\FFZ\FF\FF\E2\FF\FF\FF\D4\FF\FF\FF2\CC\E8\8C\FF\E0\FF\84\FF\D0\FF\FF\FF\BE\9E\FF\FF\FF\FF\FF\FF\FF\FF\E2\FF\EC\FFt\FF\FF\FF~\FF\FF\FF\FF\FF\98\FFr\FF\FF\FF\FF\D2\CA\FF\FF\FF\90\FF\FF\FF\FF\FF\FF\FF\80\FF\C6\FF\FCh\E2\BE\FF\88\FF\FF\FF\CC\FFj\FFB\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\90\FF\FF\FF\FF\FF:\FF\FF\FF\FF\FF\FF\9A4\FF\FE\FF\FF\FF\C0v\E0\FF\FF\FF\FF\84\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\84\FF\FF\FF\EA\FF\98\FF\CE\E8\FF\FF\FA\D6\FF\FF\FF\FFb", align 1
@.str1 = private unnamed_addr constant [35 x i8] c"out: %d, out_comp: %d, indice: %d\0A\00", align 1
@str = private unnamed_addr constant [3 x i8] c"-1\00"
@str3 = private unnamed_addr constant [4 x i8] c"666\00"

; Function Attrs: nounwind
define void @IMG_sobel_c(i8* nocapture readonly %in, i8* nocapture %out, i16 signext %cols, i16 signext %rows) #0 {
entry:
  %conv = sext i16 %cols to i32
  %conv2 = sext i16 %rows to i32
  %sub = add nsw i32 %conv2, -2
  %mul = mul i32 %sub, %conv
  %cmp84 = icmp sgt i32 %mul, 2
  br i1 %cmp84, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %mul18 = shl nsw i32 %conv, 1
  %0 = add i32 %mul, -2
  %1 = sext i16 %rows to i32
  %2 = add nsw i32 %1, -2
  %3 = sext i16 %cols to i32
  %4 = mul i32 %2, %3
  %backedge.overflow = icmp eq i32 %4, 2
  br i1 %backedge.overflow, label %for.body.preheader, label %overflow.checked

overflow.checked:                                 ; preds = %for.body.lr.ph
  %5 = add i32 %4, -2
  %end.idx = add i32 %4, -2
  %n.vec = and i32 %5, -4
  %cmp.zero = icmp eq i32 %n.vec, 0
  %scevgep = getelementptr i8, i8* %out, i32 1
  %6 = sext i16 %rows to i32
  %7 = add nsw i32 %6, -2
  %8 = sext i16 %cols to i32
  %9 = mul i32 %7, %8
  %10 = add i32 %9, -2
  %scevgep87 = getelementptr i8, i8* %out, i32 %10
  %11 = add nsw i32 %6, -1
  %12 = mul i32 %11, %8
  %13 = shl nsw i32 %8, 1
  %14 = mul nsw i32 %6, %8
  br i1 %cmp.zero, label %middle.block, label %vector.memcheck

vector.memcheck:                                  ; preds = %overflow.checked
  %15 = add i32 %14, -1
  %scevgep102 = getelementptr i8, i8* %in, i32 %15
  %16 = add nsw i32 %13, 2
  %scevgep101 = getelementptr i8, i8* %in, i32 %16
  %17 = add i32 %14, -2
  %scevgep100 = getelementptr i8, i8* %in, i32 %17
  %18 = or i32 %13, 1
  %scevgep99 = getelementptr i8, i8* %in, i32 %18
  %19 = add i32 %14, -3
  %scevgep98 = getelementptr i8, i8* %in, i32 %19
  %scevgep97 = getelementptr i8, i8* %in, i32 %13
  %20 = add i32 %12, -1
  %scevgep96 = getelementptr i8, i8* %in, i32 %20
  %21 = add nsw i32 %8, 2
  %scevgep95 = getelementptr i8, i8* %in, i32 %21
  %22 = add i32 %12, -3
  %scevgep94 = getelementptr i8, i8* %in, i32 %22
  %scevgep93 = getelementptr i8, i8* %in, i32 %8
  %23 = add i32 %9, -1
  %scevgep92 = getelementptr i8, i8* %in, i32 %23
  %scevgep91 = getelementptr i8, i8* %in, i32 2
  %scevgep90 = getelementptr i8, i8* %in, i32 %10
  %scevgep89 = getelementptr i8, i8* %in, i32 1
  %24 = add i32 %9, -3
  %scevgep88 = getelementptr i8, i8* %in, i32 %24
  %bound0 = icmp ule i8* %scevgep, %scevgep88
  %bound1 = icmp uge i8* %scevgep87, %in
  %found.conflict = and i1 %bound0, %bound1
  %bound0103 = icmp ule i8* %scevgep, %scevgep90
  %bound1104 = icmp ule i8* %scevgep89, %scevgep87
  %found.conflict105 = and i1 %bound0103, %bound1104
  %conflict.rdx = or i1 %found.conflict, %found.conflict105
  %bound0106 = icmp ule i8* %scevgep, %scevgep92
  %bound1107 = icmp ule i8* %scevgep91, %scevgep87
  %found.conflict108 = and i1 %bound0106, %bound1107
  %conflict.rdx109 = or i1 %conflict.rdx, %found.conflict108
  %bound0110 = icmp ule i8* %scevgep, %scevgep94
  %bound1111 = icmp ule i8* %scevgep93, %scevgep87
  %found.conflict112 = and i1 %bound0110, %bound1111
  %conflict.rdx113 = or i1 %conflict.rdx109, %found.conflict112
  %bound0114 = icmp ule i8* %scevgep, %scevgep96
  %bound1115 = icmp ule i8* %scevgep95, %scevgep87
  %found.conflict116 = and i1 %bound0114, %bound1115
  %conflict.rdx117 = or i1 %conflict.rdx113, %found.conflict116
  %bound0118 = icmp ule i8* %scevgep, %scevgep98
  %bound1119 = icmp ule i8* %scevgep97, %scevgep87
  %found.conflict120 = and i1 %bound0118, %bound1119
  %conflict.rdx121 = or i1 %conflict.rdx117, %found.conflict120
  %bound0122 = icmp ule i8* %scevgep, %scevgep100
  %bound1123 = icmp ule i8* %scevgep99, %scevgep87
  %found.conflict124 = and i1 %bound0122, %bound1123
  %conflict.rdx125 = or i1 %conflict.rdx121, %found.conflict124
  %bound0126 = icmp ule i8* %scevgep, %scevgep102
  %bound1127 = icmp ule i8* %scevgep101, %scevgep87
  %found.conflict128 = and i1 %bound0126, %bound1127
  %conflict.rdx129 = or i1 %conflict.rdx125, %found.conflict128
  br i1 %conflict.rdx129, label %middle.block, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert132 = insertelement <4 x i32> undef, i32 %conv, i32 0
  %broadcast.splat133 = shufflevector <4 x i32> %broadcast.splatinsert132, <4 x i32> undef, <4 x i32> zeroinitializer
  %broadcast.splatinsert136 = insertelement <4 x i32> undef, i32 %mul18, i32 0
  %broadcast.splat137 = shufflevector <4 x i32> %broadcast.splatinsert136, <4 x i32> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i32 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %broadcast.splatinsert = insertelement <4 x i32> undef, i32 %index, i32 0
  %broadcast.splat = shufflevector <4 x i32> %broadcast.splatinsert, <4 x i32> undef, <4 x i32> zeroinitializer
  %induction = add <4 x i32> %broadcast.splat, <i32 0, i32 1, i32 2, i32 3>
  %25 = getelementptr inbounds i8, i8* %in, i32 %index
  %26 = bitcast i8* %25 to <4 x i8>*
  %wide.load = load <4 x i8>, <4 x i8>* %26, align 1, !tbaa !1
  %27 = zext <4 x i8> %wide.load to <4 x i32>
  %28 = or i32 %index, 1
  %29 = getelementptr inbounds i8, i8* %in, i32 %28
  %30 = bitcast i8* %29 to <4 x i8>*
  %wide.load130 = load <4 x i8>, <4 x i8>* %30, align 1, !tbaa !1
  %31 = zext <4 x i8> %wide.load130 to <4 x i32>
  %32 = or i32 %index, 2
  %33 = getelementptr inbounds i8, i8* %in, i32 %32
  %34 = bitcast i8* %33 to <4 x i8>*
  %wide.load131 = load <4 x i8>, <4 x i8>* %34, align 1, !tbaa !1
  %35 = zext <4 x i8> %wide.load131 to <4 x i32>
  %36 = add nsw <4 x i32> %induction, %broadcast.splat133
  %37 = extractelement <4 x i32> %36, i32 0
  %38 = getelementptr inbounds i8, i8* %in, i32 %37
  %39 = bitcast i8* %38 to <4 x i8>*
  %wide.load134 = load <4 x i8>, <4 x i8>* %39, align 1, !tbaa !1
  %40 = zext <4 x i8> %wide.load134 to <4 x i32>
  %.lhs = extractelement <4 x i32> %36, i32 0
  %41 = add i32 %.lhs, 2
  %42 = getelementptr inbounds i8, i8* %in, i32 %41
  %43 = bitcast i8* %42 to <4 x i8>*
  %wide.load135 = load <4 x i8>, <4 x i8>* %43, align 1, !tbaa !1
  %44 = zext <4 x i8> %wide.load135 to <4 x i32>
  %45 = add nsw <4 x i32> %induction, %broadcast.splat137
  %46 = extractelement <4 x i32> %45, i32 0
  %47 = getelementptr inbounds i8, i8* %in, i32 %46
  %48 = bitcast i8* %47 to <4 x i8>*
  %wide.load138 = load <4 x i8>, <4 x i8>* %48, align 1, !tbaa !1
  %49 = zext <4 x i8> %wide.load138 to <4 x i32>
  %.lhs143 = extractelement <4 x i32> %45, i32 0
  %50 = add i32 %.lhs143, 1
  %51 = getelementptr inbounds i8, i8* %in, i32 %50
  %52 = bitcast i8* %51 to <4 x i8>*
  %wide.load139 = load <4 x i8>, <4 x i8>* %52, align 1, !tbaa !1
  %53 = zext <4 x i8> %wide.load139 to <4 x i32>
  %.lhs144 = extractelement <4 x i32> %45, i32 0
  %54 = add i32 %.lhs144, 2
  %55 = getelementptr inbounds i8, i8* %in, i32 %54
  %56 = bitcast i8* %55 to <4 x i8>*
  %wide.load140 = load <4 x i8>, <4 x i8>* %56, align 1, !tbaa !1
  %57 = zext <4 x i8> %wide.load140 to <4 x i32>
  %58 = shl nuw nsw <4 x i32> %31, <i32 1, i32 1, i32 1, i32 1>
  %59 = add nuw nsw <4 x i32> %58, %27
  %60 = add nuw nsw <4 x i32> %59, %35
  %61 = sub nsw <4 x i32> %49, %60
  %62 = shl nuw nsw <4 x i32> %53, <i32 1, i32 1, i32 1, i32 1>
  %63 = add nsw <4 x i32> %61, %62
  %64 = add nsw <4 x i32> %63, %57
  %65 = sub nsw <4 x i32> %35, %27
  %66 = shl nuw nsw <4 x i32> %40, <i32 1, i32 1, i32 1, i32 1>
  %67 = sub nsw <4 x i32> %65, %66
  %68 = shl nuw nsw <4 x i32> %44, <i32 1, i32 1, i32 1, i32 1>
  %69 = add nsw <4 x i32> %67, %68
  %70 = sub nsw <4 x i32> %69, %49
  %71 = add nsw <4 x i32> %70, %57
  %72 = icmp sgt <4 x i32> %64, <i32 -1, i32 -1, i32 -1, i32 -1>
  %73 = sub <4 x i32> zeroinitializer, %64
  %74 = select <4 x i1> %72, <4 x i32> %64, <4 x i32> %73
  %75 = icmp sgt <4 x i32> %71, <i32 -1, i32 -1, i32 -1, i32 -1>
  %76 = sub nsw <4 x i32> zeroinitializer, %71
  %77 = select <4 x i1> %75, <4 x i32> %71, <4 x i32> %76
  %78 = add nsw <4 x i32> %74, %77
  %79 = icmp sgt <4 x i32> %78, <i32 255, i32 255, i32 255, i32 255>
  %80 = trunc <4 x i32> %78 to <4 x i8>
  %81 = select <4 x i1> %79, <4 x i8> <i8 -1, i8 -1, i8 -1, i8 -1>, <4 x i8> %80
  %82 = getelementptr inbounds i8, i8* %out, i32 %28
  %83 = bitcast i8* %82 to <4 x i8>*
  store <4 x i8> %81, <4 x i8>* %83, align 1, !tbaa !1
  %index.next = add i32 %index, 4
  %84 = icmp eq i32 %index.next, %n.vec
  br i1 %84, label %middle.block.loopexit, label %vector.body, !llvm.loop !4

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.memcheck, %overflow.checked
  %resume.val = phi i32 [ 0, %overflow.checked ], [ 0, %vector.memcheck ], [ %n.vec, %middle.block.loopexit ]
  %cmp.n = icmp eq i32 %end.idx, %resume.val
  br i1 %cmp.n, label %for.end, label %for.body.preheader

for.body.preheader:                               ; preds = %middle.block, %for.body.lr.ph
  %i.085.ph = phi i32 [ 0, %for.body.lr.ph ], [ %resume.val, %middle.block ]
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.body
  %i.085 = phi i32 [ %add, %for.body ], [ %i.085.ph, %for.body.preheader ]
  %arrayidx = getelementptr inbounds i8, i8* %in, i32 %i.085
  %85 = load i8, i8* %arrayidx, align 1, !tbaa !1
  %conv5 = zext i8 %85 to i32
  %add = add nuw nsw i32 %i.085, 1
  %arrayidx6 = getelementptr inbounds i8, i8* %in, i32 %add
  %86 = load i8, i8* %arrayidx6, align 1, !tbaa !1
  %conv7 = zext i8 %86 to i32
  %add8 = add nuw nsw i32 %i.085, 2
  %arrayidx9 = getelementptr inbounds i8, i8* %in, i32 %add8
  %87 = load i8, i8* %arrayidx9, align 1, !tbaa !1
  %conv10 = zext i8 %87 to i32
  %add11 = add nsw i32 %i.085, %conv
  %arrayidx12 = getelementptr inbounds i8, i8* %in, i32 %add11
  %88 = load i8, i8* %arrayidx12, align 1, !tbaa !1
  %conv13 = zext i8 %88 to i32
  %add15 = add nsw i32 %add11, 2
  %arrayidx16 = getelementptr inbounds i8, i8* %in, i32 %add15
  %89 = load i8, i8* %arrayidx16, align 1, !tbaa !1
  %conv17 = zext i8 %89 to i32
  %add19 = add nsw i32 %i.085, %mul18
  %arrayidx20 = getelementptr inbounds i8, i8* %in, i32 %add19
  %90 = load i8, i8* %arrayidx20, align 1, !tbaa !1
  %conv21 = zext i8 %90 to i32
  %add24 = add nsw i32 %add19, 1
  %arrayidx25 = getelementptr inbounds i8, i8* %in, i32 %add24
  %91 = load i8, i8* %arrayidx25, align 1, !tbaa !1
  %conv26 = zext i8 %91 to i32
  %add29 = add nsw i32 %add19, 2
  %arrayidx30 = getelementptr inbounds i8, i8* %in, i32 %add29
  %92 = load i8, i8* %arrayidx30, align 1, !tbaa !1
  %conv31 = zext i8 %92 to i32
  %mul33 = shl nuw nsw i32 %conv7, 1
  %sum = add nuw nsw i32 %mul33, %conv5
  %sum86 = add nuw nsw i32 %sum, %conv10
  %add36 = sub nsw i32 %conv21, %sum86
  %mul37 = shl nuw nsw i32 %conv26, 1
  %add38 = add nsw i32 %add36, %mul37
  %add39 = add nsw i32 %add38, %conv31
  %add41 = sub nsw i32 %conv10, %conv5
  %mul42 = shl nuw nsw i32 %conv13, 1
  %sub43 = sub nsw i32 %add41, %mul42
  %mul44 = shl nuw nsw i32 %conv17, 1
  %add45 = add nsw i32 %sub43, %mul44
  %sub46 = sub nsw i32 %add45, %conv21
  %add47 = add nsw i32 %sub46, %conv31
  %ispos = icmp sgt i32 %add39, -1
  %neg = sub i32 0, %add39
  %93 = select i1 %ispos, i32 %add39, i32 %neg
  %ispos82 = icmp sgt i32 %add47, -1
  %neg83 = sub nsw i32 0, %add47
  %94 = select i1 %ispos82, i32 %add47, i32 %neg83
  %add49 = add nsw i32 %93, %94
  %cmp50 = icmp sgt i32 %add49, 255
  %95 = trunc i32 %add49 to i8
  %conv52 = select i1 %cmp50, i8 -1, i8 %95
  %arrayidx54 = getelementptr inbounds i8, i8* %out, i32 %add
  store i8 %conv52, i8* %arrayidx54, align 1, !tbaa !1
  %exitcond = icmp eq i32 %add, %0
  br i1 %exitcond, label %for.end.loopexit, label %for.body, !llvm.loop !7

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %middle.block, %entry
  ret void
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %out = alloca [1024 x i8], align 1
  %0 = getelementptr inbounds [1024 x i8], [1024 x i8]* %out, i32 0, i32 0
  call void @llvm.lifetime.start(i64 1024, i8* %0) #1
  call void @IMG_sobel_c(i8* getelementptr inbounds ([1024 x i8], [1024 x i8]* @in, i32 0, i32 0), i8* %0, i16 signext 32, i16 signext 32)
  br label %for.body

for.body:                                         ; preds = %entry, %for.inc
  %control.025 = phi i32 [ 1, %entry ], [ %inc, %for.inc ]
  %arrayidx = getelementptr inbounds [1024 x i8], [1024 x i8]* %out, i32 0, i32 %control.025
  %1 = load i8, i8* %arrayidx, align 1, !tbaa !1
  %arrayidx5 = getelementptr inbounds [958 x i8], [958 x i8]* @out_comp, i32 0, i32 %control.025
  %2 = load i8, i8* %arrayidx5, align 1, !tbaa !1
  %cmp7 = icmp eq i8 %1, %2
  br i1 %cmp7, label %for.inc, label %if.then

if.then:                                          ; preds = %for.body
  %.lcssa43 = phi i8 [ %2, %for.body ]
  %.lcssa = phi i8 [ %1, %for.body ]
  %control.025.lcssa = phi i32 [ %control.025, %for.body ]
  %puts23 = tail call i32 @puts(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str3, i32 0, i32 0))
  %conv10 = zext i8 %.lcssa to i32
  %conv12 = zext i8 %.lcssa43 to i32
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str1, i32 0, i32 0), i32 %conv10, i32 %conv12, i32 %control.025.lcssa) #1
  br label %cleanup

for.inc:                                          ; preds = %for.body
  %inc = add nuw nsw i32 %control.025, 1
  %cmp = icmp slt i32 %inc, 958
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.inc
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str, i32 0, i32 0))
  br label %cleanup

cleanup:                                          ; preds = %for.end, %if.then
  %retval.0 = phi i32 [ 666, %if.then ], [ -1, %for.end ]
  call void @llvm.lifetime.end(i64 1024, i8* %0) #1
  ret i32 %retval.0
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #0

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
!4 = distinct !{!4, !5, !6}
!5 = !{!"llvm.loop.vectorize.width", i32 1}
!6 = !{!"llvm.loop.interleave.count", i32 1}
!7 = distinct !{!7, !5, !6}
