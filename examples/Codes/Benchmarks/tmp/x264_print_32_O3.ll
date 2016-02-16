; ModuleID = 'x264_print.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@fenc = global [256 x i8] c"\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F", align 1
@pix0 = global [256 x i8] c"\00\0B\16!,7BMXc\0Ao\D4\0D\0E\0F\0A\15 +6ALWb\09n\D3p\0D\0E\0F\14\1F*5@KVa\08\13\D27\D4\0D\0E\0F\0A\15*\22,7BMXcn\D3\8E\0D\0E\0F\14)4\03\04\05\06\07\08\09\0A\0B\0Cq\95\97\1E=>\03\04\05\06\07\12\09\0A\0B\0C{\94\98(GH\03\04\05\06\07\08\09\0A\0B\0C\8F\92\992QR\03\04\05\06\07\1C\5C\0A\0B\0C\87\8E\9A<[\5C\03\04\05\06\07\08\09\0A\0B\0C\89\9A\9BF\01\14\03\04\05\06\07\08\09\82\0B\0C\8A\8E\9CP\15>\03\04\05\06\07\1C\09\96\0B\0C\C1\9A\9DZ\1F\16\03\04\05\06\07\08\09\0A\0B\0Cq\AE\9E\00)\02+\04\05\06\07\08\09g\0B\0C\85\92\9F\0A\0B\02\17\04\05\06\07\08\09\0A\0B\0Cq\90s\14\1F\02!\04\05\06\07\12\09e\0B\0C{\8E\98\1E)\02+\04\05\06\07b\09\0A\0B\0C\85\8D\99", align 1
@pix1 = global [256 x i8] c"\00\0B\16!,7BMXc\0Ao\0C\0D\0E\0F\0A\15 +6ALWb\09n\0B\0C\0D\0E\0F\14\1F*5@KVa\08\13x\0B\0C\0D\0E\0F\0A\15*\22,7BMXcn\0B\8E\0D\0E\0F<[\5C\03\04\05\06\07\08\09\0A\0B\0C\0D\0FsF\01\14\03\04\05\06\07\08\09\82\0B\0C\0D\8E~P\15>\03\04\05\06\07\1C\09\96\0B\0C\C1\9Au\14)4\03\04\05\06\07\08\09\0A\0B\0Cq\95y\1E=>\03\04\05\06\07\12\09\0A\0B\0C{\94\5C(GH\03\04\05\06\07\08\00\0A\0B\0C{\92\0D2QR\03\04\05\06\07\02\5C\0A\01\0C}\8E\0EZ\1F\16\03\04\05\06\07\08\09\0A\0B\0C\0D\AE\12\00)\02+\04\05\06\07\08\09g\0B\0C{\92\13\0A\0B\02\17\04\05\06\07\08\09\0A\0B\0Cq\0E\0B\14\1F\02!\04\05\06\07\08\09e\0B\0C\0D\0C\0C\1E)\02+\04\05\06\07\5C\09\0A\0B\0C\0D\0B\0D", align 1
@pix2 = global [256 x i8] c"\00\0B\16!,7BMXc\0Ao\0C\0D\0E\0F\0A\15 +6ALWb\09n\0B\0C\0D\0E\0F\14\1F*5@KVa\08\13x\0B\0C\0D\0E\0F\0A\15*\22,7BMXcn\0B\8E\0D\0E\0F<[\5C\03\04\05\06\07\08\09\0Arz\0D\0FsF\01\14\03\04\05\06\07\08\09\82qy\0D\8E~P\15>\03\04\05\06\07\1C\09\96\0B\0C\C1\9Au\14)4\03\04\05\06\07\08\09\0A\0B\0Cq\95y\1E=>\03\04\05\06\07\12\09\0A\0B\0C{\A8\5C(GH\03\04\05\06\07\08\00\0A\0B~{\95\0D2QR\03\04\05\06\07\02\5C\0A\01\7F}\8E\0EZ\1F\16\03\04\05\06\07\08\09\0A\0B\81\0D\C2\12\00)\02+\04\05\06\07\08\09g\0B\0C\C1\C4\13\0A\0B\02\17\04\05\06\07\08\09\0A\0B\0Cq\0E\0B\14\1F\02!\04\05\06\07\08\09e\0B\0C\0D\0C\0C\1E)\02+\04\05\06\07\5C\09\0A\0B\0C\0D\0B\0D", align 1
@pix3 = global [256 x i8] c"\00\0B\16!,7BMXc\0Ao\0C\0D\0E\0F\0A\15 +6ALWb\09n\0B\0C\0D\0E\0F\14\1F*5@KVa\08\13x\0B\0C\0D\0E\0F\0A\15*\22,7BMXcn\0B\8E\0D\0E\0F<[\5C\03\04\05\06\07\08\09\0Arz\0D\0FsF\01\14\03\04\05\06\07\08\09\82qy\0D\8E~P\15>\03\04\05\06\07\1C\09\96\0B\0C\C1\9Au\14)4\03\04\05\06\07T_\0A\0B\0Cq\95y\1E=>\03\04\05\06\07\B7\09\0A\0B\0C{\A8\5C(GH\03\04\05\06\07\08\00\0A\0B~{\95\0D2QR\03\04\05\06\07\02\5C\0A\01\7F}\8E\0EZ\1F\16\03\04\05\06\07\08\5C\0A\0B\81\0D\C2\12\00)\02+\04\05\06\07\08[g\0B\0C\C1\C4\13\0A\0B\02\17\04\05\06\07\08\09\0A\0B\0Cq\0E\0B\14\1F\02!\04\05\06\07\08\09e\0B\0C\0D\0C\0C\1E)\02+\04\05\06\07\5C\09\0A\0B\0C\0D\0B\0D", align 1
@scores_temp = global [4 x i32] [i32 10370, i32 7067, i32 8000, i32 8492], align 4
@scores = global [4 x i32] zeroinitializer, align 4
@str = private unnamed_addr constant [3 x i8] c"-1\00"
@str2 = private unnamed_addr constant [4 x i8] c"666\00"

; Function Attrs: nounwind readnone
define i32 @abs(i32 %a) #0 {
entry:
  %cmp = icmp slt i32 %a, 0
  %sub = sub nsw i32 0, %a
  %retval.0 = select i1 %cmp, i32 %sub, i32 %a
  ret i32 %retval.0
}

; Function Attrs: nounwind
define i32 @main() #1 {
entry:
  br label %for.cond1.preheader.i.i.preheader

for.cond1.preheader.i.i.preheader:                ; preds = %x264_pixel_sad_x4_16x16.exit, %entry
  %i.017 = phi i32 [ 0, %entry ], [ %inc, %x264_pixel_sad_x4_16x16.exit ]
  br label %overflow.checked82

for.cond1.preheader:                              ; preds = %x264_pixel_sad_x4_16x16.exit
  %.lcssa110.lcssa = phi i32 [ %.lcssa110, %x264_pixel_sad_x4_16x16.exit ]
  %.lcssa109.lcssa = phi i32 [ %.lcssa109, %x264_pixel_sad_x4_16x16.exit ]
  %.lcssa108.lcssa = phi i32 [ %.lcssa108, %x264_pixel_sad_x4_16x16.exit ]
  %.lcssa.lcssa = phi i32 [ %.lcssa, %x264_pixel_sad_x4_16x16.exit ]
  %0 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @scores_temp, i32 0, i32 0), align 4, !tbaa !1
  %cmp5 = icmp eq i32 %.lcssa.lcssa, %0
  %1 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @scores_temp, i32 0, i32 1), align 4
  %cmp5.1 = icmp eq i32 %.lcssa108.lcssa, %1
  %or.cond = and i1 %cmp5, %cmp5.1
  %2 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @scores_temp, i32 0, i32 2), align 4
  %cmp5.2 = icmp eq i32 %.lcssa109.lcssa, %2
  %or.cond18 = and i1 %or.cond, %cmp5.2
  %3 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @scores_temp, i32 0, i32 3), align 4
  %cmp5.3 = icmp eq i32 %.lcssa110.lcssa, %3
  %or.cond19 = and i1 %or.cond18, %cmp5.3
  br i1 %or.cond19, label %for.cond1.3, label %if.then

overflow.checked82:                               ; preds = %vector.body78, %for.cond1.preheader.i.i.preheader
  %y.06.i.i = phi i32 [ %inc8.i.i, %vector.body78 ], [ 0, %for.cond1.preheader.i.i.preheader ]
  %i_sum.05.i.i = phi i32 [ %47, %vector.body78 ], [ 0, %for.cond1.preheader.i.i.preheader ]
  %pix1.addr.04.i.i = phi i8* [ %add.ptr.i.i, %vector.body78 ], [ getelementptr inbounds ([256 x i8], [256 x i8]* @fenc, i32 0, i32 0), %for.cond1.preheader.i.i.preheader ]
  %pix2.addr.03.i.i = phi i8* [ %add.ptr6.i.i, %vector.body78 ], [ getelementptr inbounds ([256 x i8], [256 x i8]* @pix0, i32 0, i32 0), %for.cond1.preheader.i.i.preheader ]
  %4 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %i_sum.05.i.i, i32 0
  br label %vector.body78

vector.body78:                                    ; preds = %overflow.checked82
  %5 = bitcast i8* %pix1.addr.04.i.i to <4 x i8>*
  %wide.load93 = load <4 x i8>, <4 x i8>* %5, align 1, !tbaa !5
  %6 = zext <4 x i8> %wide.load93 to <4 x i32>
  %7 = bitcast i8* %pix2.addr.03.i.i to <4 x i8>*
  %wide.load94 = load <4 x i8>, <4 x i8>* %7, align 1, !tbaa !5
  %8 = zext <4 x i8> %wide.load94 to <4 x i32>
  %9 = sub nsw <4 x i32> %6, %8
  %10 = icmp sgt <4 x i32> %9, <i32 -1, i32 -1, i32 -1, i32 -1>
  %11 = sub nsw <4 x i32> zeroinitializer, %9
  %12 = select <4 x i1> %10, <4 x i32> %9, <4 x i32> %11
  %13 = add nsw <4 x i32> %12, %4
  %14 = getelementptr inbounds i8, i8* %pix1.addr.04.i.i, i32 4
  %15 = bitcast i8* %14 to <4 x i8>*
  %wide.load93.1 = load <4 x i8>, <4 x i8>* %15, align 1, !tbaa !5
  %16 = zext <4 x i8> %wide.load93.1 to <4 x i32>
  %17 = getelementptr inbounds i8, i8* %pix2.addr.03.i.i, i32 4
  %18 = bitcast i8* %17 to <4 x i8>*
  %wide.load94.1 = load <4 x i8>, <4 x i8>* %18, align 1, !tbaa !5
  %19 = zext <4 x i8> %wide.load94.1 to <4 x i32>
  %20 = sub nsw <4 x i32> %16, %19
  %21 = icmp sgt <4 x i32> %20, <i32 -1, i32 -1, i32 -1, i32 -1>
  %22 = sub nsw <4 x i32> zeroinitializer, %20
  %23 = select <4 x i1> %21, <4 x i32> %20, <4 x i32> %22
  %24 = add nsw <4 x i32> %23, %13
  %25 = getelementptr inbounds i8, i8* %pix1.addr.04.i.i, i32 8
  %26 = bitcast i8* %25 to <4 x i8>*
  %wide.load93.2 = load <4 x i8>, <4 x i8>* %26, align 1, !tbaa !5
  %27 = zext <4 x i8> %wide.load93.2 to <4 x i32>
  %28 = getelementptr inbounds i8, i8* %pix2.addr.03.i.i, i32 8
  %29 = bitcast i8* %28 to <4 x i8>*
  %wide.load94.2 = load <4 x i8>, <4 x i8>* %29, align 1, !tbaa !5
  %30 = zext <4 x i8> %wide.load94.2 to <4 x i32>
  %31 = sub nsw <4 x i32> %27, %30
  %32 = icmp sgt <4 x i32> %31, <i32 -1, i32 -1, i32 -1, i32 -1>
  %33 = sub nsw <4 x i32> zeroinitializer, %31
  %34 = select <4 x i1> %32, <4 x i32> %31, <4 x i32> %33
  %35 = add nsw <4 x i32> %34, %24
  %36 = getelementptr inbounds i8, i8* %pix1.addr.04.i.i, i32 12
  %37 = bitcast i8* %36 to <4 x i8>*
  %wide.load93.3 = load <4 x i8>, <4 x i8>* %37, align 1, !tbaa !5
  %38 = zext <4 x i8> %wide.load93.3 to <4 x i32>
  %39 = getelementptr inbounds i8, i8* %pix2.addr.03.i.i, i32 12
  %40 = bitcast i8* %39 to <4 x i8>*
  %wide.load94.3 = load <4 x i8>, <4 x i8>* %40, align 1, !tbaa !5
  %41 = zext <4 x i8> %wide.load94.3 to <4 x i32>
  %42 = sub nsw <4 x i32> %38, %41
  %43 = icmp sgt <4 x i32> %42, <i32 -1, i32 -1, i32 -1, i32 -1>
  %44 = sub nsw <4 x i32> zeroinitializer, %42
  %45 = select <4 x i1> %43, <4 x i32> %42, <4 x i32> %44
  %46 = add nsw <4 x i32> %45, %35
  %rdx.shuf96 = shufflevector <4 x i32> %46, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx97 = add <4 x i32> %46, %rdx.shuf96
  %rdx.shuf98 = shufflevector <4 x i32> %bin.rdx97, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx99 = add <4 x i32> %bin.rdx97, %rdx.shuf98
  %47 = extractelement <4 x i32> %bin.rdx99, i32 0
  %add.ptr.i.i = getelementptr inbounds i8, i8* %pix1.addr.04.i.i, i32 16
  %add.ptr6.i.i = getelementptr inbounds i8, i8* %pix2.addr.03.i.i, i32 16
  %inc8.i.i = add nuw nsw i32 %y.06.i.i, 1
  %exitcond7.i.i = icmp eq i32 %inc8.i.i, 16
  br i1 %exitcond7.i.i, label %x264_pixel_sad_16x16.exit.i, label %overflow.checked82

x264_pixel_sad_16x16.exit.i:                      ; preds = %vector.body78
  %.lcssa = phi i32 [ %47, %vector.body78 ]
  store i32 %.lcssa, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @scores, i32 0, i32 0), align 4, !tbaa !1
  br label %overflow.checked56

overflow.checked56:                               ; preds = %x264_pixel_sad_16x16.exit.i, %vector.body52
  %y.06.i49.i = phi i32 [ 0, %x264_pixel_sad_16x16.exit.i ], [ %inc8.i69.i, %vector.body52 ]
  %i_sum.05.i50.i = phi i32 [ 0, %x264_pixel_sad_16x16.exit.i ], [ %91, %vector.body52 ]
  %pix1.addr.04.i51.i = phi i8* [ getelementptr inbounds ([256 x i8], [256 x i8]* @fenc, i32 0, i32 0), %x264_pixel_sad_16x16.exit.i ], [ %add.ptr.i67.i, %vector.body52 ]
  %pix2.addr.03.i52.i = phi i8* [ getelementptr inbounds ([256 x i8], [256 x i8]* @pix1, i32 0, i32 0), %x264_pixel_sad_16x16.exit.i ], [ %add.ptr6.i68.i, %vector.body52 ]
  %48 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %i_sum.05.i50.i, i32 0
  br label %vector.body52

vector.body52:                                    ; preds = %overflow.checked56
  %49 = bitcast i8* %pix1.addr.04.i51.i to <4 x i8>*
  %wide.load67 = load <4 x i8>, <4 x i8>* %49, align 1, !tbaa !5
  %50 = zext <4 x i8> %wide.load67 to <4 x i32>
  %51 = bitcast i8* %pix2.addr.03.i52.i to <4 x i8>*
  %wide.load68 = load <4 x i8>, <4 x i8>* %51, align 1, !tbaa !5
  %52 = zext <4 x i8> %wide.load68 to <4 x i32>
  %53 = sub nsw <4 x i32> %50, %52
  %54 = icmp sgt <4 x i32> %53, <i32 -1, i32 -1, i32 -1, i32 -1>
  %55 = sub nsw <4 x i32> zeroinitializer, %53
  %56 = select <4 x i1> %54, <4 x i32> %53, <4 x i32> %55
  %57 = add nsw <4 x i32> %56, %48
  %58 = getelementptr inbounds i8, i8* %pix1.addr.04.i51.i, i32 4
  %59 = bitcast i8* %58 to <4 x i8>*
  %wide.load67.1 = load <4 x i8>, <4 x i8>* %59, align 1, !tbaa !5
  %60 = zext <4 x i8> %wide.load67.1 to <4 x i32>
  %61 = getelementptr inbounds i8, i8* %pix2.addr.03.i52.i, i32 4
  %62 = bitcast i8* %61 to <4 x i8>*
  %wide.load68.1 = load <4 x i8>, <4 x i8>* %62, align 1, !tbaa !5
  %63 = zext <4 x i8> %wide.load68.1 to <4 x i32>
  %64 = sub nsw <4 x i32> %60, %63
  %65 = icmp sgt <4 x i32> %64, <i32 -1, i32 -1, i32 -1, i32 -1>
  %66 = sub nsw <4 x i32> zeroinitializer, %64
  %67 = select <4 x i1> %65, <4 x i32> %64, <4 x i32> %66
  %68 = add nsw <4 x i32> %67, %57
  %69 = getelementptr inbounds i8, i8* %pix1.addr.04.i51.i, i32 8
  %70 = bitcast i8* %69 to <4 x i8>*
  %wide.load67.2 = load <4 x i8>, <4 x i8>* %70, align 1, !tbaa !5
  %71 = zext <4 x i8> %wide.load67.2 to <4 x i32>
  %72 = getelementptr inbounds i8, i8* %pix2.addr.03.i52.i, i32 8
  %73 = bitcast i8* %72 to <4 x i8>*
  %wide.load68.2 = load <4 x i8>, <4 x i8>* %73, align 1, !tbaa !5
  %74 = zext <4 x i8> %wide.load68.2 to <4 x i32>
  %75 = sub nsw <4 x i32> %71, %74
  %76 = icmp sgt <4 x i32> %75, <i32 -1, i32 -1, i32 -1, i32 -1>
  %77 = sub nsw <4 x i32> zeroinitializer, %75
  %78 = select <4 x i1> %76, <4 x i32> %75, <4 x i32> %77
  %79 = add nsw <4 x i32> %78, %68
  %80 = getelementptr inbounds i8, i8* %pix1.addr.04.i51.i, i32 12
  %81 = bitcast i8* %80 to <4 x i8>*
  %wide.load67.3 = load <4 x i8>, <4 x i8>* %81, align 1, !tbaa !5
  %82 = zext <4 x i8> %wide.load67.3 to <4 x i32>
  %83 = getelementptr inbounds i8, i8* %pix2.addr.03.i52.i, i32 12
  %84 = bitcast i8* %83 to <4 x i8>*
  %wide.load68.3 = load <4 x i8>, <4 x i8>* %84, align 1, !tbaa !5
  %85 = zext <4 x i8> %wide.load68.3 to <4 x i32>
  %86 = sub nsw <4 x i32> %82, %85
  %87 = icmp sgt <4 x i32> %86, <i32 -1, i32 -1, i32 -1, i32 -1>
  %88 = sub nsw <4 x i32> zeroinitializer, %86
  %89 = select <4 x i1> %87, <4 x i32> %86, <4 x i32> %88
  %90 = add nsw <4 x i32> %89, %79
  %rdx.shuf70 = shufflevector <4 x i32> %90, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx71 = add <4 x i32> %90, %rdx.shuf70
  %rdx.shuf72 = shufflevector <4 x i32> %bin.rdx71, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx73 = add <4 x i32> %bin.rdx71, %rdx.shuf72
  %91 = extractelement <4 x i32> %bin.rdx73, i32 0
  %add.ptr.i67.i = getelementptr inbounds i8, i8* %pix1.addr.04.i51.i, i32 16
  %add.ptr6.i68.i = getelementptr inbounds i8, i8* %pix2.addr.03.i52.i, i32 16
  %inc8.i69.i = add nuw nsw i32 %y.06.i49.i, 1
  %exitcond7.i70.i = icmp eq i32 %inc8.i69.i, 16
  br i1 %exitcond7.i70.i, label %x264_pixel_sad_16x16.exit72.i, label %overflow.checked56

x264_pixel_sad_16x16.exit72.i:                    ; preds = %vector.body52
  %.lcssa108 = phi i32 [ %91, %vector.body52 ]
  store i32 %.lcssa108, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @scores, i32 0, i32 1), align 4, !tbaa !1
  br label %overflow.checked30

overflow.checked30:                               ; preds = %x264_pixel_sad_16x16.exit72.i, %vector.body26
  %y.06.i25.i = phi i32 [ 0, %x264_pixel_sad_16x16.exit72.i ], [ %inc8.i45.i, %vector.body26 ]
  %i_sum.05.i26.i = phi i32 [ 0, %x264_pixel_sad_16x16.exit72.i ], [ %135, %vector.body26 ]
  %pix1.addr.04.i27.i = phi i8* [ getelementptr inbounds ([256 x i8], [256 x i8]* @fenc, i32 0, i32 0), %x264_pixel_sad_16x16.exit72.i ], [ %add.ptr.i43.i, %vector.body26 ]
  %pix2.addr.03.i28.i = phi i8* [ getelementptr inbounds ([256 x i8], [256 x i8]* @pix2, i32 0, i32 0), %x264_pixel_sad_16x16.exit72.i ], [ %add.ptr6.i44.i, %vector.body26 ]
  %92 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %i_sum.05.i26.i, i32 0
  br label %vector.body26

vector.body26:                                    ; preds = %overflow.checked30
  %93 = bitcast i8* %pix1.addr.04.i27.i to <4 x i8>*
  %wide.load41 = load <4 x i8>, <4 x i8>* %93, align 1, !tbaa !5
  %94 = zext <4 x i8> %wide.load41 to <4 x i32>
  %95 = bitcast i8* %pix2.addr.03.i28.i to <4 x i8>*
  %wide.load42 = load <4 x i8>, <4 x i8>* %95, align 1, !tbaa !5
  %96 = zext <4 x i8> %wide.load42 to <4 x i32>
  %97 = sub nsw <4 x i32> %94, %96
  %98 = icmp sgt <4 x i32> %97, <i32 -1, i32 -1, i32 -1, i32 -1>
  %99 = sub nsw <4 x i32> zeroinitializer, %97
  %100 = select <4 x i1> %98, <4 x i32> %97, <4 x i32> %99
  %101 = add nsw <4 x i32> %100, %92
  %102 = getelementptr inbounds i8, i8* %pix1.addr.04.i27.i, i32 4
  %103 = bitcast i8* %102 to <4 x i8>*
  %wide.load41.1 = load <4 x i8>, <4 x i8>* %103, align 1, !tbaa !5
  %104 = zext <4 x i8> %wide.load41.1 to <4 x i32>
  %105 = getelementptr inbounds i8, i8* %pix2.addr.03.i28.i, i32 4
  %106 = bitcast i8* %105 to <4 x i8>*
  %wide.load42.1 = load <4 x i8>, <4 x i8>* %106, align 1, !tbaa !5
  %107 = zext <4 x i8> %wide.load42.1 to <4 x i32>
  %108 = sub nsw <4 x i32> %104, %107
  %109 = icmp sgt <4 x i32> %108, <i32 -1, i32 -1, i32 -1, i32 -1>
  %110 = sub nsw <4 x i32> zeroinitializer, %108
  %111 = select <4 x i1> %109, <4 x i32> %108, <4 x i32> %110
  %112 = add nsw <4 x i32> %111, %101
  %113 = getelementptr inbounds i8, i8* %pix1.addr.04.i27.i, i32 8
  %114 = bitcast i8* %113 to <4 x i8>*
  %wide.load41.2 = load <4 x i8>, <4 x i8>* %114, align 1, !tbaa !5
  %115 = zext <4 x i8> %wide.load41.2 to <4 x i32>
  %116 = getelementptr inbounds i8, i8* %pix2.addr.03.i28.i, i32 8
  %117 = bitcast i8* %116 to <4 x i8>*
  %wide.load42.2 = load <4 x i8>, <4 x i8>* %117, align 1, !tbaa !5
  %118 = zext <4 x i8> %wide.load42.2 to <4 x i32>
  %119 = sub nsw <4 x i32> %115, %118
  %120 = icmp sgt <4 x i32> %119, <i32 -1, i32 -1, i32 -1, i32 -1>
  %121 = sub nsw <4 x i32> zeroinitializer, %119
  %122 = select <4 x i1> %120, <4 x i32> %119, <4 x i32> %121
  %123 = add nsw <4 x i32> %122, %112
  %124 = getelementptr inbounds i8, i8* %pix1.addr.04.i27.i, i32 12
  %125 = bitcast i8* %124 to <4 x i8>*
  %wide.load41.3 = load <4 x i8>, <4 x i8>* %125, align 1, !tbaa !5
  %126 = zext <4 x i8> %wide.load41.3 to <4 x i32>
  %127 = getelementptr inbounds i8, i8* %pix2.addr.03.i28.i, i32 12
  %128 = bitcast i8* %127 to <4 x i8>*
  %wide.load42.3 = load <4 x i8>, <4 x i8>* %128, align 1, !tbaa !5
  %129 = zext <4 x i8> %wide.load42.3 to <4 x i32>
  %130 = sub nsw <4 x i32> %126, %129
  %131 = icmp sgt <4 x i32> %130, <i32 -1, i32 -1, i32 -1, i32 -1>
  %132 = sub nsw <4 x i32> zeroinitializer, %130
  %133 = select <4 x i1> %131, <4 x i32> %130, <4 x i32> %132
  %134 = add nsw <4 x i32> %133, %123
  %rdx.shuf44 = shufflevector <4 x i32> %134, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx45 = add <4 x i32> %134, %rdx.shuf44
  %rdx.shuf46 = shufflevector <4 x i32> %bin.rdx45, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx47 = add <4 x i32> %bin.rdx45, %rdx.shuf46
  %135 = extractelement <4 x i32> %bin.rdx47, i32 0
  %add.ptr.i43.i = getelementptr inbounds i8, i8* %pix1.addr.04.i27.i, i32 16
  %add.ptr6.i44.i = getelementptr inbounds i8, i8* %pix2.addr.03.i28.i, i32 16
  %inc8.i45.i = add nuw nsw i32 %y.06.i25.i, 1
  %exitcond7.i46.i = icmp eq i32 %inc8.i45.i, 16
  br i1 %exitcond7.i46.i, label %x264_pixel_sad_16x16.exit48.i, label %overflow.checked30

x264_pixel_sad_16x16.exit48.i:                    ; preds = %vector.body26
  %.lcssa109 = phi i32 [ %135, %vector.body26 ]
  store i32 %.lcssa109, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @scores, i32 0, i32 2), align 4, !tbaa !1
  br label %overflow.checked

overflow.checked:                                 ; preds = %x264_pixel_sad_16x16.exit48.i, %vector.body
  %y.06.i1.i = phi i32 [ 0, %x264_pixel_sad_16x16.exit48.i ], [ %inc8.i21.i, %vector.body ]
  %i_sum.05.i2.i = phi i32 [ 0, %x264_pixel_sad_16x16.exit48.i ], [ %179, %vector.body ]
  %pix1.addr.04.i3.i = phi i8* [ getelementptr inbounds ([256 x i8], [256 x i8]* @fenc, i32 0, i32 0), %x264_pixel_sad_16x16.exit48.i ], [ %add.ptr.i19.i, %vector.body ]
  %pix2.addr.03.i4.i = phi i8* [ getelementptr inbounds ([256 x i8], [256 x i8]* @pix3, i32 0, i32 0), %x264_pixel_sad_16x16.exit48.i ], [ %add.ptr6.i20.i, %vector.body ]
  %136 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %i_sum.05.i2.i, i32 0
  br label %vector.body

vector.body:                                      ; preds = %overflow.checked
  %137 = bitcast i8* %pix1.addr.04.i3.i to <4 x i8>*
  %wide.load = load <4 x i8>, <4 x i8>* %137, align 1, !tbaa !5
  %138 = zext <4 x i8> %wide.load to <4 x i32>
  %139 = bitcast i8* %pix2.addr.03.i4.i to <4 x i8>*
  %wide.load20 = load <4 x i8>, <4 x i8>* %139, align 1, !tbaa !5
  %140 = zext <4 x i8> %wide.load20 to <4 x i32>
  %141 = sub nsw <4 x i32> %138, %140
  %142 = icmp sgt <4 x i32> %141, <i32 -1, i32 -1, i32 -1, i32 -1>
  %143 = sub nsw <4 x i32> zeroinitializer, %141
  %144 = select <4 x i1> %142, <4 x i32> %141, <4 x i32> %143
  %145 = add nsw <4 x i32> %144, %136
  %146 = getelementptr inbounds i8, i8* %pix1.addr.04.i3.i, i32 4
  %147 = bitcast i8* %146 to <4 x i8>*
  %wide.load.1 = load <4 x i8>, <4 x i8>* %147, align 1, !tbaa !5
  %148 = zext <4 x i8> %wide.load.1 to <4 x i32>
  %149 = getelementptr inbounds i8, i8* %pix2.addr.03.i4.i, i32 4
  %150 = bitcast i8* %149 to <4 x i8>*
  %wide.load20.1 = load <4 x i8>, <4 x i8>* %150, align 1, !tbaa !5
  %151 = zext <4 x i8> %wide.load20.1 to <4 x i32>
  %152 = sub nsw <4 x i32> %148, %151
  %153 = icmp sgt <4 x i32> %152, <i32 -1, i32 -1, i32 -1, i32 -1>
  %154 = sub nsw <4 x i32> zeroinitializer, %152
  %155 = select <4 x i1> %153, <4 x i32> %152, <4 x i32> %154
  %156 = add nsw <4 x i32> %155, %145
  %157 = getelementptr inbounds i8, i8* %pix1.addr.04.i3.i, i32 8
  %158 = bitcast i8* %157 to <4 x i8>*
  %wide.load.2 = load <4 x i8>, <4 x i8>* %158, align 1, !tbaa !5
  %159 = zext <4 x i8> %wide.load.2 to <4 x i32>
  %160 = getelementptr inbounds i8, i8* %pix2.addr.03.i4.i, i32 8
  %161 = bitcast i8* %160 to <4 x i8>*
  %wide.load20.2 = load <4 x i8>, <4 x i8>* %161, align 1, !tbaa !5
  %162 = zext <4 x i8> %wide.load20.2 to <4 x i32>
  %163 = sub nsw <4 x i32> %159, %162
  %164 = icmp sgt <4 x i32> %163, <i32 -1, i32 -1, i32 -1, i32 -1>
  %165 = sub nsw <4 x i32> zeroinitializer, %163
  %166 = select <4 x i1> %164, <4 x i32> %163, <4 x i32> %165
  %167 = add nsw <4 x i32> %166, %156
  %168 = getelementptr inbounds i8, i8* %pix1.addr.04.i3.i, i32 12
  %169 = bitcast i8* %168 to <4 x i8>*
  %wide.load.3 = load <4 x i8>, <4 x i8>* %169, align 1, !tbaa !5
  %170 = zext <4 x i8> %wide.load.3 to <4 x i32>
  %171 = getelementptr inbounds i8, i8* %pix2.addr.03.i4.i, i32 12
  %172 = bitcast i8* %171 to <4 x i8>*
  %wide.load20.3 = load <4 x i8>, <4 x i8>* %172, align 1, !tbaa !5
  %173 = zext <4 x i8> %wide.load20.3 to <4 x i32>
  %174 = sub nsw <4 x i32> %170, %173
  %175 = icmp sgt <4 x i32> %174, <i32 -1, i32 -1, i32 -1, i32 -1>
  %176 = sub nsw <4 x i32> zeroinitializer, %174
  %177 = select <4 x i1> %175, <4 x i32> %174, <4 x i32> %176
  %178 = add nsw <4 x i32> %177, %167
  %rdx.shuf = shufflevector <4 x i32> %178, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx = add <4 x i32> %178, %rdx.shuf
  %rdx.shuf21 = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx22 = add <4 x i32> %bin.rdx, %rdx.shuf21
  %179 = extractelement <4 x i32> %bin.rdx22, i32 0
  %add.ptr.i19.i = getelementptr inbounds i8, i8* %pix1.addr.04.i3.i, i32 16
  %add.ptr6.i20.i = getelementptr inbounds i8, i8* %pix2.addr.03.i4.i, i32 16
  %inc8.i21.i = add nuw nsw i32 %y.06.i1.i, 1
  %exitcond7.i22.i = icmp eq i32 %inc8.i21.i, 16
  br i1 %exitcond7.i22.i, label %x264_pixel_sad_x4_16x16.exit, label %overflow.checked

x264_pixel_sad_x4_16x16.exit:                     ; preds = %vector.body
  %.lcssa110 = phi i32 [ %179, %vector.body ]
  store i32 %.lcssa110, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @scores, i32 0, i32 3), align 4, !tbaa !1
  %inc = add nuw nsw i32 %i.017, 1
  %exitcond = icmp eq i32 %inc, 1000
  br i1 %exitcond, label %for.cond1.preheader, label %for.cond1.preheader.i.i.preheader

if.then:                                          ; preds = %for.cond1.preheader
  %puts15 = tail call i32 @puts(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str2, i32 0, i32 0))
  br label %return

return:                                           ; preds = %for.cond1.3, %if.then
  %retval.0 = phi i32 [ 666, %if.then ], [ -1, %for.cond1.3 ]
  ret i32 %retval.0

for.cond1.3:                                      ; preds = %for.cond1.preheader
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str, i32 0, i32 0))
  br label %return
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

attributes #0 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!3, !3, i64 0}
