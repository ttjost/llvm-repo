; ModuleID = 'x264.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@fenc = global [256 x i8] c"\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F", align 1
@pix0 = global [256 x i8] zeroinitializer, align 1
@pix1 = global [256 x i8] zeroinitializer, align 1
@pix2 = global [256 x i8] zeroinitializer, align 1
@pix3 = global [256 x i8] zeroinitializer, align 1

; Function Attrs: nounwind readnone
define i32 @abs(i32 %a) #0 {
entry:
  %cmp = icmp slt i32 %a, 0
  %sub = sub nsw i32 0, %a
  %retval.0 = select i1 %cmp, i32 %sub, i32 %a
  ret i32 %retval.0
}

; Function Attrs: nounwind readonly
define i32 @main() #1 {
entry:
  br label %overflow.checked

overflow.checked:                                 ; preds = %entry, %vector.body
  %y.06.i.i = phi i32 [ 0, %entry ], [ %inc8.i.i, %vector.body ]
  %i_sum.05.i.i = phi i32 [ 0, %entry ], [ %43, %vector.body ]
  %pix1.addr.04.i.i = phi i8* [ getelementptr inbounds ([256 x i8], [256 x i8]* @fenc, i32 0, i32 0), %entry ], [ %add.ptr.i.i, %vector.body ]
  %pix2.addr.03.i.i = phi i8* [ getelementptr inbounds ([256 x i8], [256 x i8]* @pix0, i32 0, i32 0), %entry ], [ %add.ptr6.i.i, %vector.body ]
  %0 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %i_sum.05.i.i, i32 0
  br label %vector.body

vector.body:                                      ; preds = %overflow.checked
  %1 = bitcast i8* %pix1.addr.04.i.i to <4 x i8>*
  %wide.load = load <4 x i8>, <4 x i8>* %1, align 1, !tbaa !1
  %2 = zext <4 x i8> %wide.load to <4 x i32>
  %3 = bitcast i8* %pix2.addr.03.i.i to <4 x i8>*
  %wide.load5 = load <4 x i8>, <4 x i8>* %3, align 1, !tbaa !1
  %4 = zext <4 x i8> %wide.load5 to <4 x i32>
  %5 = sub nsw <4 x i32> %2, %4
  %6 = icmp sgt <4 x i32> %5, <i32 -1, i32 -1, i32 -1, i32 -1>
  %7 = sub nsw <4 x i32> zeroinitializer, %5
  %8 = select <4 x i1> %6, <4 x i32> %5, <4 x i32> %7
  %9 = add nsw <4 x i32> %8, %0
  %10 = getelementptr inbounds i8, i8* %pix1.addr.04.i.i, i32 4
  %11 = bitcast i8* %10 to <4 x i8>*
  %wide.load.1 = load <4 x i8>, <4 x i8>* %11, align 1, !tbaa !1
  %12 = zext <4 x i8> %wide.load.1 to <4 x i32>
  %13 = getelementptr inbounds i8, i8* %pix2.addr.03.i.i, i32 4
  %14 = bitcast i8* %13 to <4 x i8>*
  %wide.load5.1 = load <4 x i8>, <4 x i8>* %14, align 1, !tbaa !1
  %15 = zext <4 x i8> %wide.load5.1 to <4 x i32>
  %16 = sub nsw <4 x i32> %12, %15
  %17 = icmp sgt <4 x i32> %16, <i32 -1, i32 -1, i32 -1, i32 -1>
  %18 = sub nsw <4 x i32> zeroinitializer, %16
  %19 = select <4 x i1> %17, <4 x i32> %16, <4 x i32> %18
  %20 = add nsw <4 x i32> %19, %9
  %21 = getelementptr inbounds i8, i8* %pix1.addr.04.i.i, i32 8
  %22 = bitcast i8* %21 to <4 x i8>*
  %wide.load.2 = load <4 x i8>, <4 x i8>* %22, align 1, !tbaa !1
  %23 = zext <4 x i8> %wide.load.2 to <4 x i32>
  %24 = getelementptr inbounds i8, i8* %pix2.addr.03.i.i, i32 8
  %25 = bitcast i8* %24 to <4 x i8>*
  %wide.load5.2 = load <4 x i8>, <4 x i8>* %25, align 1, !tbaa !1
  %26 = zext <4 x i8> %wide.load5.2 to <4 x i32>
  %27 = sub nsw <4 x i32> %23, %26
  %28 = icmp sgt <4 x i32> %27, <i32 -1, i32 -1, i32 -1, i32 -1>
  %29 = sub nsw <4 x i32> zeroinitializer, %27
  %30 = select <4 x i1> %28, <4 x i32> %27, <4 x i32> %29
  %31 = add nsw <4 x i32> %30, %20
  %32 = getelementptr inbounds i8, i8* %pix1.addr.04.i.i, i32 12
  %33 = bitcast i8* %32 to <4 x i8>*
  %wide.load.3 = load <4 x i8>, <4 x i8>* %33, align 1, !tbaa !1
  %34 = zext <4 x i8> %wide.load.3 to <4 x i32>
  %35 = getelementptr inbounds i8, i8* %pix2.addr.03.i.i, i32 12
  %36 = bitcast i8* %35 to <4 x i8>*
  %wide.load5.3 = load <4 x i8>, <4 x i8>* %36, align 1, !tbaa !1
  %37 = zext <4 x i8> %wide.load5.3 to <4 x i32>
  %38 = sub nsw <4 x i32> %34, %37
  %39 = icmp sgt <4 x i32> %38, <i32 -1, i32 -1, i32 -1, i32 -1>
  %40 = sub nsw <4 x i32> zeroinitializer, %38
  %41 = select <4 x i1> %39, <4 x i32> %38, <4 x i32> %40
  %42 = add nsw <4 x i32> %41, %31
  %rdx.shuf = shufflevector <4 x i32> %42, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx = add <4 x i32> %42, %rdx.shuf
  %rdx.shuf6 = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx7 = add <4 x i32> %bin.rdx, %rdx.shuf6
  %43 = extractelement <4 x i32> %bin.rdx7, i32 0
  %add.ptr.i.i = getelementptr inbounds i8, i8* %pix1.addr.04.i.i, i32 16
  %add.ptr6.i.i = getelementptr inbounds i8, i8* %pix2.addr.03.i.i, i32 16
  %inc8.i.i = add nuw nsw i32 %y.06.i.i, 1
  %exitcond7.i.i = icmp eq i32 %inc8.i.i, 16
  br i1 %exitcond7.i.i, label %overflow.checked15.preheader, label %overflow.checked

overflow.checked15.preheader:                     ; preds = %vector.body
  %.lcssa95 = phi i32 [ %43, %vector.body ]
  br label %overflow.checked15

overflow.checked15:                               ; preds = %overflow.checked15.preheader, %vector.body11
  %y.06.i49.i = phi i32 [ %inc8.i69.i, %vector.body11 ], [ 0, %overflow.checked15.preheader ]
  %i_sum.05.i50.i = phi i32 [ %87, %vector.body11 ], [ 0, %overflow.checked15.preheader ]
  %pix1.addr.04.i51.i = phi i8* [ %add.ptr.i67.i, %vector.body11 ], [ getelementptr inbounds ([256 x i8], [256 x i8]* @fenc, i32 0, i32 0), %overflow.checked15.preheader ]
  %pix2.addr.03.i52.i = phi i8* [ %add.ptr6.i68.i, %vector.body11 ], [ getelementptr inbounds ([256 x i8], [256 x i8]* @pix1, i32 0, i32 0), %overflow.checked15.preheader ]
  %44 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %i_sum.05.i50.i, i32 0
  br label %vector.body11

vector.body11:                                    ; preds = %overflow.checked15
  %45 = bitcast i8* %pix1.addr.04.i51.i to <4 x i8>*
  %wide.load26 = load <4 x i8>, <4 x i8>* %45, align 1, !tbaa !1
  %46 = zext <4 x i8> %wide.load26 to <4 x i32>
  %47 = bitcast i8* %pix2.addr.03.i52.i to <4 x i8>*
  %wide.load27 = load <4 x i8>, <4 x i8>* %47, align 1, !tbaa !1
  %48 = zext <4 x i8> %wide.load27 to <4 x i32>
  %49 = sub nsw <4 x i32> %46, %48
  %50 = icmp sgt <4 x i32> %49, <i32 -1, i32 -1, i32 -1, i32 -1>
  %51 = sub nsw <4 x i32> zeroinitializer, %49
  %52 = select <4 x i1> %50, <4 x i32> %49, <4 x i32> %51
  %53 = add nsw <4 x i32> %52, %44
  %54 = getelementptr inbounds i8, i8* %pix1.addr.04.i51.i, i32 4
  %55 = bitcast i8* %54 to <4 x i8>*
  %wide.load26.1 = load <4 x i8>, <4 x i8>* %55, align 1, !tbaa !1
  %56 = zext <4 x i8> %wide.load26.1 to <4 x i32>
  %57 = getelementptr inbounds i8, i8* %pix2.addr.03.i52.i, i32 4
  %58 = bitcast i8* %57 to <4 x i8>*
  %wide.load27.1 = load <4 x i8>, <4 x i8>* %58, align 1, !tbaa !1
  %59 = zext <4 x i8> %wide.load27.1 to <4 x i32>
  %60 = sub nsw <4 x i32> %56, %59
  %61 = icmp sgt <4 x i32> %60, <i32 -1, i32 -1, i32 -1, i32 -1>
  %62 = sub nsw <4 x i32> zeroinitializer, %60
  %63 = select <4 x i1> %61, <4 x i32> %60, <4 x i32> %62
  %64 = add nsw <4 x i32> %63, %53
  %65 = getelementptr inbounds i8, i8* %pix1.addr.04.i51.i, i32 8
  %66 = bitcast i8* %65 to <4 x i8>*
  %wide.load26.2 = load <4 x i8>, <4 x i8>* %66, align 1, !tbaa !1
  %67 = zext <4 x i8> %wide.load26.2 to <4 x i32>
  %68 = getelementptr inbounds i8, i8* %pix2.addr.03.i52.i, i32 8
  %69 = bitcast i8* %68 to <4 x i8>*
  %wide.load27.2 = load <4 x i8>, <4 x i8>* %69, align 1, !tbaa !1
  %70 = zext <4 x i8> %wide.load27.2 to <4 x i32>
  %71 = sub nsw <4 x i32> %67, %70
  %72 = icmp sgt <4 x i32> %71, <i32 -1, i32 -1, i32 -1, i32 -1>
  %73 = sub nsw <4 x i32> zeroinitializer, %71
  %74 = select <4 x i1> %72, <4 x i32> %71, <4 x i32> %73
  %75 = add nsw <4 x i32> %74, %64
  %76 = getelementptr inbounds i8, i8* %pix1.addr.04.i51.i, i32 12
  %77 = bitcast i8* %76 to <4 x i8>*
  %wide.load26.3 = load <4 x i8>, <4 x i8>* %77, align 1, !tbaa !1
  %78 = zext <4 x i8> %wide.load26.3 to <4 x i32>
  %79 = getelementptr inbounds i8, i8* %pix2.addr.03.i52.i, i32 12
  %80 = bitcast i8* %79 to <4 x i8>*
  %wide.load27.3 = load <4 x i8>, <4 x i8>* %80, align 1, !tbaa !1
  %81 = zext <4 x i8> %wide.load27.3 to <4 x i32>
  %82 = sub nsw <4 x i32> %78, %81
  %83 = icmp sgt <4 x i32> %82, <i32 -1, i32 -1, i32 -1, i32 -1>
  %84 = sub nsw <4 x i32> zeroinitializer, %82
  %85 = select <4 x i1> %83, <4 x i32> %82, <4 x i32> %84
  %86 = add nsw <4 x i32> %85, %75
  %rdx.shuf29 = shufflevector <4 x i32> %86, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx30 = add <4 x i32> %86, %rdx.shuf29
  %rdx.shuf31 = shufflevector <4 x i32> %bin.rdx30, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx32 = add <4 x i32> %bin.rdx30, %rdx.shuf31
  %87 = extractelement <4 x i32> %bin.rdx32, i32 0
  %add.ptr.i67.i = getelementptr inbounds i8, i8* %pix1.addr.04.i51.i, i32 16
  %add.ptr6.i68.i = getelementptr inbounds i8, i8* %pix2.addr.03.i52.i, i32 16
  %inc8.i69.i = add nuw nsw i32 %y.06.i49.i, 1
  %exitcond7.i70.i = icmp eq i32 %inc8.i69.i, 16
  br i1 %exitcond7.i70.i, label %overflow.checked41.preheader, label %overflow.checked15

overflow.checked41.preheader:                     ; preds = %vector.body11
  %.lcssa94 = phi i32 [ %87, %vector.body11 ]
  br label %overflow.checked41

overflow.checked41:                               ; preds = %overflow.checked41.preheader, %vector.body37
  %y.06.i25.i = phi i32 [ %inc8.i45.i, %vector.body37 ], [ 0, %overflow.checked41.preheader ]
  %i_sum.05.i26.i = phi i32 [ %131, %vector.body37 ], [ 0, %overflow.checked41.preheader ]
  %pix1.addr.04.i27.i = phi i8* [ %add.ptr.i43.i, %vector.body37 ], [ getelementptr inbounds ([256 x i8], [256 x i8]* @fenc, i32 0, i32 0), %overflow.checked41.preheader ]
  %pix2.addr.03.i28.i = phi i8* [ %add.ptr6.i44.i, %vector.body37 ], [ getelementptr inbounds ([256 x i8], [256 x i8]* @pix2, i32 0, i32 0), %overflow.checked41.preheader ]
  %88 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %i_sum.05.i26.i, i32 0
  br label %vector.body37

vector.body37:                                    ; preds = %overflow.checked41
  %89 = bitcast i8* %pix1.addr.04.i27.i to <4 x i8>*
  %wide.load52 = load <4 x i8>, <4 x i8>* %89, align 1, !tbaa !1
  %90 = zext <4 x i8> %wide.load52 to <4 x i32>
  %91 = bitcast i8* %pix2.addr.03.i28.i to <4 x i8>*
  %wide.load53 = load <4 x i8>, <4 x i8>* %91, align 1, !tbaa !1
  %92 = zext <4 x i8> %wide.load53 to <4 x i32>
  %93 = sub nsw <4 x i32> %90, %92
  %94 = icmp sgt <4 x i32> %93, <i32 -1, i32 -1, i32 -1, i32 -1>
  %95 = sub nsw <4 x i32> zeroinitializer, %93
  %96 = select <4 x i1> %94, <4 x i32> %93, <4 x i32> %95
  %97 = add nsw <4 x i32> %96, %88
  %98 = getelementptr inbounds i8, i8* %pix1.addr.04.i27.i, i32 4
  %99 = bitcast i8* %98 to <4 x i8>*
  %wide.load52.1 = load <4 x i8>, <4 x i8>* %99, align 1, !tbaa !1
  %100 = zext <4 x i8> %wide.load52.1 to <4 x i32>
  %101 = getelementptr inbounds i8, i8* %pix2.addr.03.i28.i, i32 4
  %102 = bitcast i8* %101 to <4 x i8>*
  %wide.load53.1 = load <4 x i8>, <4 x i8>* %102, align 1, !tbaa !1
  %103 = zext <4 x i8> %wide.load53.1 to <4 x i32>
  %104 = sub nsw <4 x i32> %100, %103
  %105 = icmp sgt <4 x i32> %104, <i32 -1, i32 -1, i32 -1, i32 -1>
  %106 = sub nsw <4 x i32> zeroinitializer, %104
  %107 = select <4 x i1> %105, <4 x i32> %104, <4 x i32> %106
  %108 = add nsw <4 x i32> %107, %97
  %109 = getelementptr inbounds i8, i8* %pix1.addr.04.i27.i, i32 8
  %110 = bitcast i8* %109 to <4 x i8>*
  %wide.load52.2 = load <4 x i8>, <4 x i8>* %110, align 1, !tbaa !1
  %111 = zext <4 x i8> %wide.load52.2 to <4 x i32>
  %112 = getelementptr inbounds i8, i8* %pix2.addr.03.i28.i, i32 8
  %113 = bitcast i8* %112 to <4 x i8>*
  %wide.load53.2 = load <4 x i8>, <4 x i8>* %113, align 1, !tbaa !1
  %114 = zext <4 x i8> %wide.load53.2 to <4 x i32>
  %115 = sub nsw <4 x i32> %111, %114
  %116 = icmp sgt <4 x i32> %115, <i32 -1, i32 -1, i32 -1, i32 -1>
  %117 = sub nsw <4 x i32> zeroinitializer, %115
  %118 = select <4 x i1> %116, <4 x i32> %115, <4 x i32> %117
  %119 = add nsw <4 x i32> %118, %108
  %120 = getelementptr inbounds i8, i8* %pix1.addr.04.i27.i, i32 12
  %121 = bitcast i8* %120 to <4 x i8>*
  %wide.load52.3 = load <4 x i8>, <4 x i8>* %121, align 1, !tbaa !1
  %122 = zext <4 x i8> %wide.load52.3 to <4 x i32>
  %123 = getelementptr inbounds i8, i8* %pix2.addr.03.i28.i, i32 12
  %124 = bitcast i8* %123 to <4 x i8>*
  %wide.load53.3 = load <4 x i8>, <4 x i8>* %124, align 1, !tbaa !1
  %125 = zext <4 x i8> %wide.load53.3 to <4 x i32>
  %126 = sub nsw <4 x i32> %122, %125
  %127 = icmp sgt <4 x i32> %126, <i32 -1, i32 -1, i32 -1, i32 -1>
  %128 = sub nsw <4 x i32> zeroinitializer, %126
  %129 = select <4 x i1> %127, <4 x i32> %126, <4 x i32> %128
  %130 = add nsw <4 x i32> %129, %119
  %rdx.shuf55 = shufflevector <4 x i32> %130, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx56 = add <4 x i32> %130, %rdx.shuf55
  %rdx.shuf57 = shufflevector <4 x i32> %bin.rdx56, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx58 = add <4 x i32> %bin.rdx56, %rdx.shuf57
  %131 = extractelement <4 x i32> %bin.rdx58, i32 0
  %add.ptr.i43.i = getelementptr inbounds i8, i8* %pix1.addr.04.i27.i, i32 16
  %add.ptr6.i44.i = getelementptr inbounds i8, i8* %pix2.addr.03.i28.i, i32 16
  %inc8.i45.i = add nuw nsw i32 %y.06.i25.i, 1
  %exitcond7.i46.i = icmp eq i32 %inc8.i45.i, 16
  br i1 %exitcond7.i46.i, label %overflow.checked67.preheader, label %overflow.checked41

overflow.checked67.preheader:                     ; preds = %vector.body37
  %.lcssa93 = phi i32 [ %131, %vector.body37 ]
  br label %overflow.checked67

overflow.checked67:                               ; preds = %overflow.checked67.preheader, %vector.body63
  %y.06.i1.i = phi i32 [ %inc8.i21.i, %vector.body63 ], [ 0, %overflow.checked67.preheader ]
  %i_sum.05.i2.i = phi i32 [ %175, %vector.body63 ], [ 0, %overflow.checked67.preheader ]
  %pix1.addr.04.i3.i = phi i8* [ %add.ptr.i19.i, %vector.body63 ], [ getelementptr inbounds ([256 x i8], [256 x i8]* @fenc, i32 0, i32 0), %overflow.checked67.preheader ]
  %pix2.addr.03.i4.i = phi i8* [ %add.ptr6.i20.i, %vector.body63 ], [ getelementptr inbounds ([256 x i8], [256 x i8]* @pix3, i32 0, i32 0), %overflow.checked67.preheader ]
  %132 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %i_sum.05.i2.i, i32 0
  br label %vector.body63

vector.body63:                                    ; preds = %overflow.checked67
  %133 = bitcast i8* %pix1.addr.04.i3.i to <4 x i8>*
  %wide.load78 = load <4 x i8>, <4 x i8>* %133, align 1, !tbaa !1
  %134 = zext <4 x i8> %wide.load78 to <4 x i32>
  %135 = bitcast i8* %pix2.addr.03.i4.i to <4 x i8>*
  %wide.load79 = load <4 x i8>, <4 x i8>* %135, align 1, !tbaa !1
  %136 = zext <4 x i8> %wide.load79 to <4 x i32>
  %137 = sub nsw <4 x i32> %134, %136
  %138 = icmp sgt <4 x i32> %137, <i32 -1, i32 -1, i32 -1, i32 -1>
  %139 = sub nsw <4 x i32> zeroinitializer, %137
  %140 = select <4 x i1> %138, <4 x i32> %137, <4 x i32> %139
  %141 = add nsw <4 x i32> %140, %132
  %142 = getelementptr inbounds i8, i8* %pix1.addr.04.i3.i, i32 4
  %143 = bitcast i8* %142 to <4 x i8>*
  %wide.load78.1 = load <4 x i8>, <4 x i8>* %143, align 1, !tbaa !1
  %144 = zext <4 x i8> %wide.load78.1 to <4 x i32>
  %145 = getelementptr inbounds i8, i8* %pix2.addr.03.i4.i, i32 4
  %146 = bitcast i8* %145 to <4 x i8>*
  %wide.load79.1 = load <4 x i8>, <4 x i8>* %146, align 1, !tbaa !1
  %147 = zext <4 x i8> %wide.load79.1 to <4 x i32>
  %148 = sub nsw <4 x i32> %144, %147
  %149 = icmp sgt <4 x i32> %148, <i32 -1, i32 -1, i32 -1, i32 -1>
  %150 = sub nsw <4 x i32> zeroinitializer, %148
  %151 = select <4 x i1> %149, <4 x i32> %148, <4 x i32> %150
  %152 = add nsw <4 x i32> %151, %141
  %153 = getelementptr inbounds i8, i8* %pix1.addr.04.i3.i, i32 8
  %154 = bitcast i8* %153 to <4 x i8>*
  %wide.load78.2 = load <4 x i8>, <4 x i8>* %154, align 1, !tbaa !1
  %155 = zext <4 x i8> %wide.load78.2 to <4 x i32>
  %156 = getelementptr inbounds i8, i8* %pix2.addr.03.i4.i, i32 8
  %157 = bitcast i8* %156 to <4 x i8>*
  %wide.load79.2 = load <4 x i8>, <4 x i8>* %157, align 1, !tbaa !1
  %158 = zext <4 x i8> %wide.load79.2 to <4 x i32>
  %159 = sub nsw <4 x i32> %155, %158
  %160 = icmp sgt <4 x i32> %159, <i32 -1, i32 -1, i32 -1, i32 -1>
  %161 = sub nsw <4 x i32> zeroinitializer, %159
  %162 = select <4 x i1> %160, <4 x i32> %159, <4 x i32> %161
  %163 = add nsw <4 x i32> %162, %152
  %164 = getelementptr inbounds i8, i8* %pix1.addr.04.i3.i, i32 12
  %165 = bitcast i8* %164 to <4 x i8>*
  %wide.load78.3 = load <4 x i8>, <4 x i8>* %165, align 1, !tbaa !1
  %166 = zext <4 x i8> %wide.load78.3 to <4 x i32>
  %167 = getelementptr inbounds i8, i8* %pix2.addr.03.i4.i, i32 12
  %168 = bitcast i8* %167 to <4 x i8>*
  %wide.load79.3 = load <4 x i8>, <4 x i8>* %168, align 1, !tbaa !1
  %169 = zext <4 x i8> %wide.load79.3 to <4 x i32>
  %170 = sub nsw <4 x i32> %166, %169
  %171 = icmp sgt <4 x i32> %170, <i32 -1, i32 -1, i32 -1, i32 -1>
  %172 = sub nsw <4 x i32> zeroinitializer, %170
  %173 = select <4 x i1> %171, <4 x i32> %170, <4 x i32> %172
  %174 = add nsw <4 x i32> %173, %163
  %rdx.shuf81 = shufflevector <4 x i32> %174, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx82 = add <4 x i32> %174, %rdx.shuf81
  %rdx.shuf83 = shufflevector <4 x i32> %bin.rdx82, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx84 = add <4 x i32> %bin.rdx82, %rdx.shuf83
  %175 = extractelement <4 x i32> %bin.rdx84, i32 0
  %add.ptr.i19.i = getelementptr inbounds i8, i8* %pix1.addr.04.i3.i, i32 16
  %add.ptr6.i20.i = getelementptr inbounds i8, i8* %pix2.addr.03.i4.i, i32 16
  %inc8.i21.i = add nuw nsw i32 %y.06.i1.i, 1
  %exitcond7.i22.i = icmp eq i32 %inc8.i21.i, 16
  br i1 %exitcond7.i22.i, label %x264_pixel_sad_x4_16x16.exit, label %overflow.checked67

x264_pixel_sad_x4_16x16.exit:                     ; preds = %vector.body63
  %.lcssa = phi i32 [ %175, %vector.body63 ]
  %cmp1 = icmp eq i32 %.lcssa95, 1920
  br i1 %cmp1, label %for.inc, label %return

for.inc:                                          ; preds = %x264_pixel_sad_x4_16x16.exit
  %cmp1.1 = icmp eq i32 %.lcssa94, 1920
  br i1 %cmp1.1, label %for.inc.1, label %return

return:                                           ; preds = %for.inc.1, %for.inc, %x264_pixel_sad_x4_16x16.exit
  %retval.0 = phi i32 [ 0, %x264_pixel_sad_x4_16x16.exit ], [ 1, %for.inc ], [ 2, %for.inc.1 ]
  ret i32 %retval.0

for.inc.1:                                        ; preds = %for.inc
  %cmp1.2 = icmp eq i32 %.lcssa93, 1920
  br i1 %cmp1.2, label %for.inc.2, label %return

for.inc.2:                                        ; preds = %for.inc.1
  %cmp1.3 = icmp eq i32 %.lcssa, 1920
  %. = select i1 %cmp1.3, i32 -1, i32 3
  ret i32 %.
}

attributes #0 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
