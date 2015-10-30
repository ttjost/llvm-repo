; ModuleID = 'sobel_print.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@in = constant [1024 x i8] c"`8z\BE\F6:\B7\03>m+K#M/X\08\07\F2\F1\0FpX\F6\988\1F\B4\08_Cz\CB\E7\A4l\9B\CA\E5\96\01.\96D\1C\D6\94\90\A0\DC\AF;!\9D\8E\C0\91\F3\CF\A6\07\A9r\15\C1+w\ACl}\C4\91\A2nL\C9\B3\0Cn\C8\A7Z\9AK\83@:f\CB\C2\CE\D8HtY\A6\0B-\FB\E6\B1\FA\DF\DB\E7VVB0\97D\EB\E5\AA\BA\8A}\02\E4\CE\0E\CD%\B3\14h\80\14p\159\83\B2\EB\BB\5C\9A\0D\BC\17\DB\1E\9E\DE#\F4\18_W\8B\15\E2#;\DC\9D\B1-pG\B7\0B9\EA\B7\F6\E3\FD\82\BD\85\B1\FDJ\06\8B'_\BC2Z\82U\8A\D06\FA\00hk\B1'\AA6\02\84\08\C4\DD\A5f\8C\BAx\DC\C4\01\D9\BA\15\ADl\CC\91+\AC\DE\E4\87D\82\C9\CA\9D\10\C0\9D\B7\ED\FD1<\10\A3b\D2\C21\1A\B0\A4<\F3t\F6^ 2\15n\8D\D0E\F1C\90\B1\CF\11\ED\AFIh\ABG*\86)\F5<\D7\F9\AE\FD\97\B2 \92\BB\04>\FC\11\0C\FB\89\A6\E8T\8Cg\8E\94P\0A\D9\D3I.\E4\BF\8C\C0\9B\9E\80\A1\8E\93\D5\85\08\1F\B5\1E`\EA:x\8E\C3\1F\A6\00\E5\B9\9E\AE|'alg\C8^~>\ED\18q\95\CF\06(\82\C3\B94\5C\ABDi\C5\AF\D7\AD\EB-\AD\13\0A\ED('4\999\8BTk\05\C2p(\C5K-L\ED\F1\98\86\90a#f\02\FD\ECT\BE\EFE\C4\8A\7Fp\A7\D8\A9\AA$o\EAj\87JZ\EAy\C0\FF\E6q\E4_\A3j.V2\D6Z*\F5\D2\90\DCb\9A\C4\C0\06>_O\CD\95\1E<\80r:\C4\8E\15\C9J\0E\E4d\22\04[\08\AC\E2?A\A5R\19\84\B92\E2\DC[\E0\FA\C9\D9\B6_d\AA\D8\1A\C7\0A,\FC\AB\C8\A9\8AQ^\D55\A6B\88\CE\A1{\F58\F0v\EA^\D2\19VgF\18\0C(e\88\C6\DA\0C\B1k\0C\BD'\94\DA\C6\1BL_\A3\EE\17g\A0\065i\C2\E5'\B3\E7wr\E7,\AA\A2\A5\8ED\91\89\D3\F0\E9X\AA\99\E6u\11\FA`\99\F6u\08\C2!$\F1lP.R\FE\A3[\89\87:\E9c\A9\1C\9F\9A\D5Z#\9E\B8s\88\98\F4\FA+\AB\13v\BE|\B8\88\A5\F4\16S\80D\A6\17\08)\14\1F\1Eqy\DD!\BD\CFR\7F\87\A1\B3\8Ef\02I\9C\90\BF\98D\A0\D7\C3\03\9A+.\0A+qeU4n<\FB\89d6\C8\F5\C8*\08\818#\A5\F5\AB\88t\9F\E9|\CBR>\87V\B1ju*\AD\DB~\1AK\1D\A6I\AA\91f\00D\5C\8C\C2t\A2_\9C7\F4\06\C06\06)T\03\A5\D8\87\A3\E7\AC\E6L\A3+\ECo#p\DF\F7\18\0B\D9\D3\CD%$\B2\9F\E8\CB\0D\AC\1Dmj\CB\16T\DD\BB\CD\C5\D2\9EM\99\0A\A7P\0C\E3\12)\D4\DBT\E4uV\94\AB\D3\9FYj\08,\83\B6w%\7F\EA!'\B6\937DE\0D\EFN\F3m\9AU_\A1\F6my\D6\C0\B43\19\8D\92w@\DAB[\0Ba\91\92\85\AE\E6%\B0\F0\81c`\14\07\16g\0F=\F7\F2{\14b2e\E5M>d\FCv7\EEZ\DB\AC\E6\B6o@x\C5\0A\8A)\BB\A0<)\10\B5\86\EB\87\10\BC\F7k\AE5\FE\1B\F9v.\C9:\90\C8~K\C6\EE`\90r\C17&(\AB-]\1B\F8\D5d\BF\ABnB\B0\8Fg\0D\D1\8B&U\B8:\04\E0I\BB\9C\9C\A0\C5E\D14\FD\DC\958\8B\C6\85D\EA4\B14\FF\A9\D8Pm\B8\D4\AD'\12W\D2F\C0\D7\9D\1B\AC\C6g\88e\06f\8B\22\9CS\1B\07\A3L7\A7\82\FB;\C9a\F6to\D8h\F7\13\E9\F1\AE30\CB\B3\10X-\E0\B1\D1\F3\A6.\BF~\1D*5\D8]\A0\A2\1C\0B\E3\8B\146\DFz#c\A46e\E6%3\14s", align 1
@out_comp = constant [958 x i8] c"\00\C26\FF\EC\B6\FF\FF\FF\FF\FF\FF\FF\FF\E8\FF\FF\FF\FF\FFJ\E4\FF\FFd\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\EA\FF\94\FF\FF\FF\FF^\AC\BC\FF\FF\FFJ\FF\FF\A8\C6\FF`\FF\FF\FF\FF\FF\FF\AA\A2\FF\FF\FFp\FF\FF\E0\AE\FF\FFp\FF\5C\D6\FF\FF\FF\9C\FF\D8\F6\88\FF\FF\FF\FF\EA\D4\FF\B6\D4,\FF^\FF\FF\FCn\FF\B8\FF\E2\FF\FF\FF\FF\FF\FF\FF\FF\FF\F2>p\FF\94\FF\FF\D4\FF\C8\BE\DC\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FE\FF\FF\FF\FF\90\FF\FF\F0\FF\FF\FF\86\FF\FF\FF\FF\FF\FF\FF\FF\E0H\FF\FF\FF\FF\FF\FF\FF\FF\FFD\FF\DE\FF\FF\FF\FF\FF\FF\FF\FF\FF\F8\FF\FF\C4\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\CE\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\88\FF\FF\FF\FF\FF\FF\FF\C2\FF<\CC\E6\E4\FA\FE\FF\FF\FF\EA\FF\FFP\FF\FF\FF\FF\FF\8C\AAT\96\FFD\FF\FF\FF\FFF\FF\FF\FF\FF\FFX\FF\FFv\FFx\FF\FF\FF\FF\FF\FF\FF\8E6\FF\FF\FF\FF\FF\A2\FFJ\FF\F6\FF\82\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\B6\FF\FF\FF\84\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\DA\FF\FF\FF\FF\96\FF\A4\FF\FF\D0x\FF\FF\FFx\FF\FF\FF\FF\5C\FF\AA\FF\FF\90\FF\FF\FF\FF|\FF\FF\FF\FF\FF\FF\FF\E0\FF\FF\EE\FF\FF\FF\FF\B8\8A\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\BA\FF\FE\FF\FF\FF\FF\FF:\FF\FF\FF\E2*\FF\F2\FF\BA\FF\FF\FF\FF\FF\FF\FF\FF\80\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\14\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FFR`\FF\FF\FF\FF\FF\E8\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\84\F2\FF\FF\FF\FF\FF\EC\FF\FF\E6\FF\FF\FF\D8\AA\FF\92\FF\FF\FF\FF\FF\FF\A4\FF\FF\FF\FF\FF\FF\C2\FF\CE\EA\FF\BE2\F4\AA\FF\FF\FF\FF\FF\FF\F6\FF\FF\FFh\FF\FF\FF\F2\FF\9C\FF\FF\FF\FF\FF\FF\FF\E2\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\CA\FF\FF\FF\FF\D6\C6\FC\FFL\FF\FF\FF\B2\FF\FF\FF\FF\FF\FF\FF\FF\E0v\FF\84\FF\FF\FF\BE\FF\FF\FF\FF\FF\FF\FF\FF\FFV\FF\FF\FF\FF\8C\FF\BE\FF\FF\FF\84\FF\FF\FFh\FF\FF\FF\D0\EE\E2\E0\FF\FF\FF\FF\FF\80\22\FF\FF\FF\FF\FF\FF\FF\FA\FF\FF\DC\FF\FF\FF\FF\FF\FF\FF\B0\FF\FF\FF\FF\FF\FF\18\FF\FF\FF\FF\FF\FF\D2\FF\EEd\FF\FF\FF\E4\FFj\FF\FF\FF\A8\FF\FF\FF>\FF\FF\1C\FF\FF\FF\A6\FF\C2x\92\FF\FF\FF\FF\FF\FF\FF\82\FFx\FF\FF\FF\FF\FF\FF\FF\D8\FF\FFX\FF\FF\FF\FFd\E8\CC\FFX\C4\AE\FF\FF\FF\BA\FFl\FF\FF\FF\FF\D8\A2\FF\8EV\FF\FF\FF\FF\FF\FF\FF\FF\BA\FF\94\FF\FF\FF\FF\FFd\FF\F4\FF\FF\FF\FF\FC\FF\FF\FFn\FF\FF\A0\C4\FF\FF\FF\FF\FF\FF\FF\FF\FF^\FF\FF\FF\FF\FF\E8\AE\FF\C4\B2\F4\FF\FF\FF\FF\FFh\FF\FF\FF\96\FF\FF\F0\FF@\FF\FF\FF\FF\FFB\FF\EA\FF\FF\FFp\FF\FF\EC\FFj\FF\80\C8\FF\FF\FF\FF\FF\FF\FF\FF\AC\FF\FF\FF\F8\DC\FF\FF\FF\FF\FF\B4\FF\FFZ\FF\FF\E2\FF\FF\FF\D4\FF\FF\FF2\CC\E8\8C\FF\E0\FF\84\FF\D0\FF\FF\FF\BE\9E\FF\FF\FF\FF\FF\FF\FF\FF\E2\FF\EC\FFt\FF\FF\FF~\FF\FF\FF\FF\FF\98\FFr\FF\FF\FF\FF\D2\CA\FF\FF\FF\90\FF\FF\FF\FF\FF\FF\FF\80\FF\C6\FF\FCh\E2\BE\FF\88\FF\FF\FF\CC\FFj\FFB\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\90\FF\FF\FF\FF\FF:\FF\FF\FF\FF\FF\FF\9A4\FF\FE\FF\FF\FF\C0v\E0\FF\FF\FF\FF\84\FF\FF\FF\FF\FF\FF\FF\FF\FF\FF\84\FF\FF\FF\EA\FF\98\FF\CE\E8\FF\FF\FA\D6\FF\FF\FF\FFb", align 1
@.str = private unnamed_addr constant [5 x i8] c"666\0A\00", align 1
@.str1 = private unnamed_addr constant [35 x i8] c"out: %d, out_comp: %d, indice: %d\0A\00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c"-1\0A\00", align 1
@str = private unnamed_addr constant [3 x i8] c"-1\00"
@str3 = private unnamed_addr constant [4 x i8] c"666\00"

; Function Attrs: nounwind
define void @IMG_sobel_c(i8* nocapture readonly %in, i8* nocapture %out, i16 signext %cols, i16 signext %rows) #0 {
entry:
  %conv = sext i16 %cols to i32
  %conv2 = sext i16 %rows to i32
  %sub = add nsw i32 %conv2, -2
  %mul = mul nsw i32 %sub, %conv
  %cmp84 = icmp sgt i32 %mul, 2
  br i1 %cmp84, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %mul18 = shl nsw i32 %conv, 1
  %0 = sext i16 %rows to i32
  %1 = add nsw i32 %0, -2
  %2 = sext i16 %cols to i32
  %3 = mul i32 %1, %2
  %4 = add i32 %3, -2
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %i.085 = phi i32 [ 0, %for.body.lr.ph ], [ %add, %for.body ]
  %arrayidx = getelementptr inbounds i8, i8* %in, i32 %i.085
  %5 = load i8, i8* %arrayidx, align 1, !tbaa !1
  %conv5 = zext i8 %5 to i32
  %add = add nuw nsw i32 %i.085, 1
  %arrayidx6 = getelementptr inbounds i8, i8* %in, i32 %add
  %6 = load i8, i8* %arrayidx6, align 1, !tbaa !1
  %conv7 = zext i8 %6 to i32
  %add8 = add nuw nsw i32 %i.085, 2
  %arrayidx9 = getelementptr inbounds i8, i8* %in, i32 %add8
  %7 = load i8, i8* %arrayidx9, align 1, !tbaa !1
  %conv10 = zext i8 %7 to i32
  %add11 = add nsw i32 %i.085, %conv
  %arrayidx12 = getelementptr inbounds i8, i8* %in, i32 %add11
  %8 = load i8, i8* %arrayidx12, align 1, !tbaa !1
  %conv13 = zext i8 %8 to i32
  %add15 = add nsw i32 %add11, 2
  %arrayidx16 = getelementptr inbounds i8, i8* %in, i32 %add15
  %9 = load i8, i8* %arrayidx16, align 1, !tbaa !1
  %conv17 = zext i8 %9 to i32
  %add19 = add nsw i32 %i.085, %mul18
  %arrayidx20 = getelementptr inbounds i8, i8* %in, i32 %add19
  %10 = load i8, i8* %arrayidx20, align 1, !tbaa !1
  %conv21 = zext i8 %10 to i32
  %add24 = add nsw i32 %add19, 1
  %arrayidx25 = getelementptr inbounds i8, i8* %in, i32 %add24
  %11 = load i8, i8* %arrayidx25, align 1, !tbaa !1
  %conv26 = zext i8 %11 to i32
  %add29 = add nsw i32 %add19, 2
  %arrayidx30 = getelementptr inbounds i8, i8* %in, i32 %add29
  %12 = load i8, i8* %arrayidx30, align 1, !tbaa !1
  %conv31 = zext i8 %12 to i32
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
  %13 = select i1 %ispos, i32 %add39, i32 %neg
  %ispos82 = icmp sgt i32 %add47, -1
  %neg83 = sub nsw i32 0, %add47
  %14 = select i1 %ispos82, i32 %add47, i32 %neg83
  %add49 = add nsw i32 %13, %14
  %cmp50 = icmp sgt i32 %add49, 255
  %15 = trunc i32 %add49 to i8
  %conv52 = select i1 %cmp50, i8 -1, i8 %15
  %arrayidx54 = getelementptr inbounds i8, i8* %out, i32 %add
  store i8 %conv52, i8* %arrayidx54, align 1, !tbaa !1
  %exitcond = icmp eq i32 %add, %4
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
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
  %puts23 = tail call i32 @puts(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @str3, i32 0, i32 0))
  %3 = load i8, i8* %arrayidx, align 1, !tbaa !1
  %conv10 = zext i8 %3 to i32
  %4 = load i8, i8* %arrayidx5, align 1, !tbaa !1
  %conv12 = zext i8 %4 to i32
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str1, i32 0, i32 0), i32 %conv10, i32 %conv12, i32 %control.025) #1
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
