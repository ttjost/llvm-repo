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

overflow.checked82:                               ; preds = %middle.block79, %for.cond1.preheader.i.i.preheader
  %y.06.i.i = phi i32 [ %inc8.i.i, %middle.block79 ], [ 0, %for.cond1.preheader.i.i.preheader ]
  %i_sum.05.i.i = phi i32 [ %13, %middle.block79 ], [ 0, %for.cond1.preheader.i.i.preheader ]
  %pix1.addr.04.i.i = phi i8* [ %add.ptr.i.i, %middle.block79 ], [ getelementptr inbounds ([256 x i8], [256 x i8]* @fenc, i32 0, i32 0), %for.cond1.preheader.i.i.preheader ]
  %pix2.addr.03.i.i = phi i8* [ %add.ptr6.i.i, %middle.block79 ], [ getelementptr inbounds ([256 x i8], [256 x i8]* @pix0, i32 0, i32 0), %for.cond1.preheader.i.i.preheader ]
  %0 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %i_sum.05.i.i, i32 0
  br label %vector.body78

vector.body78:                                    ; preds = %vector.body78, %overflow.checked82
  %index81 = phi i32 [ 0, %overflow.checked82 ], [ %index.next88, %vector.body78 ]
  %vec.phi92 = phi <4 x i32> [ %0, %overflow.checked82 ], [ %11, %vector.body78 ]
  %1 = getelementptr inbounds i8, i8* %pix1.addr.04.i.i, i32 %index81
  %2 = bitcast i8* %1 to <4 x i8>*
  %wide.load93 = load <4 x i8>, <4 x i8>* %2, align 1, !tbaa !1
  %3 = zext <4 x i8> %wide.load93 to <4 x i32>
  %4 = getelementptr inbounds i8, i8* %pix2.addr.03.i.i, i32 %index81
  %5 = bitcast i8* %4 to <4 x i8>*
  %wide.load94 = load <4 x i8>, <4 x i8>* %5, align 1, !tbaa !1
  %6 = zext <4 x i8> %wide.load94 to <4 x i32>
  %7 = sub nsw <4 x i32> %3, %6
  %8 = icmp sgt <4 x i32> %7, <i32 -1, i32 -1, i32 -1, i32 -1>
  %9 = sub nsw <4 x i32> zeroinitializer, %7
  %10 = select <4 x i1> %8, <4 x i32> %7, <4 x i32> %9
  %11 = add nsw <4 x i32> %10, %vec.phi92
  %index.next88 = add i32 %index81, 4
  %12 = icmp eq i32 %index.next88, 16
  br i1 %12, label %middle.block79, label %vector.body78, !llvm.loop !4

middle.block79:                                   ; preds = %vector.body78
  %rdx.shuf96 = shufflevector <4 x i32> %11, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx97 = add <4 x i32> %11, %rdx.shuf96
  %rdx.shuf98 = shufflevector <4 x i32> %bin.rdx97, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx99 = add <4 x i32> %bin.rdx97, %rdx.shuf98
  %13 = extractelement <4 x i32> %bin.rdx99, i32 0
  %add.ptr.i.i = getelementptr inbounds i8, i8* %pix1.addr.04.i.i, i32 16
  %add.ptr6.i.i = getelementptr inbounds i8, i8* %pix2.addr.03.i.i, i32 16
  %inc8.i.i = add nuw nsw i32 %y.06.i.i, 1
  %exitcond7.i.i = icmp eq i32 %inc8.i.i, 16
  br i1 %exitcond7.i.i, label %x264_pixel_sad_16x16.exit.i, label %overflow.checked82

x264_pixel_sad_16x16.exit.i:                      ; preds = %middle.block79
  store i32 %13, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @scores, i32 0, i32 0), align 4, !tbaa !7
  br label %overflow.checked56

overflow.checked56:                               ; preds = %x264_pixel_sad_16x16.exit.i, %middle.block53
  %y.06.i49.i = phi i32 [ 0, %x264_pixel_sad_16x16.exit.i ], [ %inc8.i69.i, %middle.block53 ]
  %i_sum.05.i50.i = phi i32 [ 0, %x264_pixel_sad_16x16.exit.i ], [ %27, %middle.block53 ]
  %pix1.addr.04.i51.i = phi i8* [ getelementptr inbounds ([256 x i8], [256 x i8]* @fenc, i32 0, i32 0), %x264_pixel_sad_16x16.exit.i ], [ %add.ptr.i67.i, %middle.block53 ]
  %pix2.addr.03.i52.i = phi i8* [ getelementptr inbounds ([256 x i8], [256 x i8]* @pix1, i32 0, i32 0), %x264_pixel_sad_16x16.exit.i ], [ %add.ptr6.i68.i, %middle.block53 ]
  %14 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %i_sum.05.i50.i, i32 0
  br label %vector.body52

vector.body52:                                    ; preds = %vector.body52, %overflow.checked56
  %index55 = phi i32 [ 0, %overflow.checked56 ], [ %index.next62, %vector.body52 ]
  %vec.phi66 = phi <4 x i32> [ %14, %overflow.checked56 ], [ %25, %vector.body52 ]
  %15 = getelementptr inbounds i8, i8* %pix1.addr.04.i51.i, i32 %index55
  %16 = bitcast i8* %15 to <4 x i8>*
  %wide.load67 = load <4 x i8>, <4 x i8>* %16, align 1, !tbaa !1
  %17 = zext <4 x i8> %wide.load67 to <4 x i32>
  %18 = getelementptr inbounds i8, i8* %pix2.addr.03.i52.i, i32 %index55
  %19 = bitcast i8* %18 to <4 x i8>*
  %wide.load68 = load <4 x i8>, <4 x i8>* %19, align 1, !tbaa !1
  %20 = zext <4 x i8> %wide.load68 to <4 x i32>
  %21 = sub nsw <4 x i32> %17, %20
  %22 = icmp sgt <4 x i32> %21, <i32 -1, i32 -1, i32 -1, i32 -1>
  %23 = sub nsw <4 x i32> zeroinitializer, %21
  %24 = select <4 x i1> %22, <4 x i32> %21, <4 x i32> %23
  %25 = add nsw <4 x i32> %24, %vec.phi66
  %index.next62 = add i32 %index55, 4
  %26 = icmp eq i32 %index.next62, 16
  br i1 %26, label %middle.block53, label %vector.body52, !llvm.loop !9

middle.block53:                                   ; preds = %vector.body52
  %rdx.shuf70 = shufflevector <4 x i32> %25, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx71 = add <4 x i32> %25, %rdx.shuf70
  %rdx.shuf72 = shufflevector <4 x i32> %bin.rdx71, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx73 = add <4 x i32> %bin.rdx71, %rdx.shuf72
  %27 = extractelement <4 x i32> %bin.rdx73, i32 0
  %add.ptr.i67.i = getelementptr inbounds i8, i8* %pix1.addr.04.i51.i, i32 16
  %add.ptr6.i68.i = getelementptr inbounds i8, i8* %pix2.addr.03.i52.i, i32 16
  %inc8.i69.i = add nuw nsw i32 %y.06.i49.i, 1
  %exitcond7.i70.i = icmp eq i32 %inc8.i69.i, 16
  br i1 %exitcond7.i70.i, label %x264_pixel_sad_16x16.exit72.i, label %overflow.checked56

x264_pixel_sad_16x16.exit72.i:                    ; preds = %middle.block53
  store i32 %27, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @scores, i32 0, i32 1), align 4, !tbaa !7
  br label %overflow.checked30

overflow.checked30:                               ; preds = %x264_pixel_sad_16x16.exit72.i, %middle.block27
  %y.06.i25.i = phi i32 [ 0, %x264_pixel_sad_16x16.exit72.i ], [ %inc8.i45.i, %middle.block27 ]
  %i_sum.05.i26.i = phi i32 [ 0, %x264_pixel_sad_16x16.exit72.i ], [ %41, %middle.block27 ]
  %pix1.addr.04.i27.i = phi i8* [ getelementptr inbounds ([256 x i8], [256 x i8]* @fenc, i32 0, i32 0), %x264_pixel_sad_16x16.exit72.i ], [ %add.ptr.i43.i, %middle.block27 ]
  %pix2.addr.03.i28.i = phi i8* [ getelementptr inbounds ([256 x i8], [256 x i8]* @pix2, i32 0, i32 0), %x264_pixel_sad_16x16.exit72.i ], [ %add.ptr6.i44.i, %middle.block27 ]
  %28 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %i_sum.05.i26.i, i32 0
  br label %vector.body26

vector.body26:                                    ; preds = %vector.body26, %overflow.checked30
  %index29 = phi i32 [ 0, %overflow.checked30 ], [ %index.next36, %vector.body26 ]
  %vec.phi40 = phi <4 x i32> [ %28, %overflow.checked30 ], [ %39, %vector.body26 ]
  %29 = getelementptr inbounds i8, i8* %pix1.addr.04.i27.i, i32 %index29
  %30 = bitcast i8* %29 to <4 x i8>*
  %wide.load41 = load <4 x i8>, <4 x i8>* %30, align 1, !tbaa !1
  %31 = zext <4 x i8> %wide.load41 to <4 x i32>
  %32 = getelementptr inbounds i8, i8* %pix2.addr.03.i28.i, i32 %index29
  %33 = bitcast i8* %32 to <4 x i8>*
  %wide.load42 = load <4 x i8>, <4 x i8>* %33, align 1, !tbaa !1
  %34 = zext <4 x i8> %wide.load42 to <4 x i32>
  %35 = sub nsw <4 x i32> %31, %34
  %36 = icmp sgt <4 x i32> %35, <i32 -1, i32 -1, i32 -1, i32 -1>
  %37 = sub nsw <4 x i32> zeroinitializer, %35
  %38 = select <4 x i1> %36, <4 x i32> %35, <4 x i32> %37
  %39 = add nsw <4 x i32> %38, %vec.phi40
  %index.next36 = add i32 %index29, 4
  %40 = icmp eq i32 %index.next36, 16
  br i1 %40, label %middle.block27, label %vector.body26, !llvm.loop !10

middle.block27:                                   ; preds = %vector.body26
  %rdx.shuf44 = shufflevector <4 x i32> %39, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx45 = add <4 x i32> %39, %rdx.shuf44
  %rdx.shuf46 = shufflevector <4 x i32> %bin.rdx45, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx47 = add <4 x i32> %bin.rdx45, %rdx.shuf46
  %41 = extractelement <4 x i32> %bin.rdx47, i32 0
  %add.ptr.i43.i = getelementptr inbounds i8, i8* %pix1.addr.04.i27.i, i32 16
  %add.ptr6.i44.i = getelementptr inbounds i8, i8* %pix2.addr.03.i28.i, i32 16
  %inc8.i45.i = add nuw nsw i32 %y.06.i25.i, 1
  %exitcond7.i46.i = icmp eq i32 %inc8.i45.i, 16
  br i1 %exitcond7.i46.i, label %x264_pixel_sad_16x16.exit48.i, label %overflow.checked30

x264_pixel_sad_16x16.exit48.i:                    ; preds = %middle.block27
  store i32 %41, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @scores, i32 0, i32 2), align 4, !tbaa !7
  br label %overflow.checked

overflow.checked:                                 ; preds = %x264_pixel_sad_16x16.exit48.i, %middle.block
  %y.06.i1.i = phi i32 [ 0, %x264_pixel_sad_16x16.exit48.i ], [ %inc8.i21.i, %middle.block ]
  %i_sum.05.i2.i = phi i32 [ 0, %x264_pixel_sad_16x16.exit48.i ], [ %55, %middle.block ]
  %pix1.addr.04.i3.i = phi i8* [ getelementptr inbounds ([256 x i8], [256 x i8]* @fenc, i32 0, i32 0), %x264_pixel_sad_16x16.exit48.i ], [ %add.ptr.i19.i, %middle.block ]
  %pix2.addr.03.i4.i = phi i8* [ getelementptr inbounds ([256 x i8], [256 x i8]* @pix3, i32 0, i32 0), %x264_pixel_sad_16x16.exit48.i ], [ %add.ptr6.i20.i, %middle.block ]
  %42 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %i_sum.05.i2.i, i32 0
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %overflow.checked
  %index = phi i32 [ 0, %overflow.checked ], [ %index.next, %vector.body ]
  %vec.phi = phi <4 x i32> [ %42, %overflow.checked ], [ %53, %vector.body ]
  %43 = getelementptr inbounds i8, i8* %pix1.addr.04.i3.i, i32 %index
  %44 = bitcast i8* %43 to <4 x i8>*
  %wide.load = load <4 x i8>, <4 x i8>* %44, align 1, !tbaa !1
  %45 = zext <4 x i8> %wide.load to <4 x i32>
  %46 = getelementptr inbounds i8, i8* %pix2.addr.03.i4.i, i32 %index
  %47 = bitcast i8* %46 to <4 x i8>*
  %wide.load20 = load <4 x i8>, <4 x i8>* %47, align 1, !tbaa !1
  %48 = zext <4 x i8> %wide.load20 to <4 x i32>
  %49 = sub nsw <4 x i32> %45, %48
  %50 = icmp sgt <4 x i32> %49, <i32 -1, i32 -1, i32 -1, i32 -1>
  %51 = sub nsw <4 x i32> zeroinitializer, %49
  %52 = select <4 x i1> %50, <4 x i32> %49, <4 x i32> %51
  %53 = add nsw <4 x i32> %52, %vec.phi
  %index.next = add i32 %index, 4
  %54 = icmp eq i32 %index.next, 16
  br i1 %54, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  %rdx.shuf = shufflevector <4 x i32> %53, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx = add <4 x i32> %53, %rdx.shuf
  %rdx.shuf21 = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx22 = add <4 x i32> %bin.rdx, %rdx.shuf21
  %55 = extractelement <4 x i32> %bin.rdx22, i32 0
  %add.ptr.i19.i = getelementptr inbounds i8, i8* %pix1.addr.04.i3.i, i32 16
  %add.ptr6.i20.i = getelementptr inbounds i8, i8* %pix2.addr.03.i4.i, i32 16
  %inc8.i21.i = add nuw nsw i32 %y.06.i1.i, 1
  %exitcond7.i22.i = icmp eq i32 %inc8.i21.i, 16
  br i1 %exitcond7.i22.i, label %x264_pixel_sad_x4_16x16.exit, label %overflow.checked

x264_pixel_sad_x4_16x16.exit:                     ; preds = %middle.block
  store i32 %55, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @scores, i32 0, i32 3), align 4, !tbaa !7
  %inc = add nuw nsw i32 %i.017, 1
  %exitcond = icmp eq i32 %inc, 1000
  br i1 %exitcond, label %for.body3.preheader, label %for.cond1.preheader.i.i.preheader

for.body3.preheader:                              ; preds = %x264_pixel_sad_x4_16x16.exit
  %56 = load i32, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @scores_temp, i32 0, i32 0), align 4, !tbaa !7
  %cmp518 = icmp eq i32 %13, %56
  br i1 %cmp518, label %for.cond1, label %if.then

for.cond1:                                        ; preds = %for.body3.preheader, %for.cond1.for.body3_crit_edge
  %inc719 = phi i32 [ %inc7, %for.cond1.for.body3_crit_edge ], [ 1, %for.body3.preheader ]
  %cmp2 = icmp slt i32 %inc719, 4
  br i1 %cmp2, label %for.cond1.for.body3_crit_edge, label %for.end8

for.cond1.for.body3_crit_edge:                    ; preds = %for.cond1
  %arrayidx.phi.trans.insert = getelementptr inbounds [4 x i32], [4 x i32]* @scores, i32 0, i32 %inc719
  %.pre = load i32, i32* %arrayidx.phi.trans.insert, align 4, !tbaa !7
  %arrayidx4 = getelementptr inbounds [4 x i32], [4 x i32]* @scores_temp, i32 0, i32 %inc719
  %57 = load i32, i32* %arrayidx4, align 4, !tbaa !7
  %cmp5 = icmp eq i32 %.pre, %57
  %inc7 = add nuw nsw i32 %inc719, 1
  br i1 %cmp5, label %for.cond1, label %if.then

if.then:                                          ; preds = %for.cond1.for.body3_crit_edge, %for.body3.preheader
  %puts15 = tail call i32 @puts(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str2, i32 0, i32 0))
  br label %return

for.end8:                                         ; preds = %for.cond1
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str, i32 0, i32 0))
  br label %return

return:                                           ; preds = %for.end8, %if.then
  %retval.0 = phi i32 [ 666, %if.then ], [ -1, %for.end8 ]
  ret i32 %retval.0
}

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #2

attributes #0 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
!4 = distinct !{!4, !5, !6}
!5 = !{!"llvm.loop.vectorize.width", i32 1}
!6 = !{!"llvm.loop.interleave.count", i32 1}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !2, i64 0}
!9 = distinct !{!9, !5, !6}
!10 = distinct !{!10, !5, !6}
!11 = distinct !{!11, !5, !6}
