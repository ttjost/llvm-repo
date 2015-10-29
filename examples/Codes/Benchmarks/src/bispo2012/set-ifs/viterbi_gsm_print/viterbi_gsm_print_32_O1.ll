; ModuleID = 'viterbi_gsm_print.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@old = global [24 x i16] [i16 -19360, i16 20792, i16 -13446, i16 28862, i16 -13834, i16 -4038, i16 28855, i16 9475, i16 -17858, i16 -22675, i16 -13013, i16 -4021, i16 -15837, i16 -5811, i16 -27857, i16 3928, i16 6920, i16 -20217, i16 -19214, i16 -12047, i16 25103, i16 -28048, i16 26456, i16 -22282], align 2
@sd = global [379 x i16] [i16 -19360, i16 20792, i16 -13446, i16 28862, i16 -13834, i16 -4038, i16 28855, i16 9475, i16 -17858, i16 -22675, i16 -13013, i16 -4021, i16 -15837, i16 -5811, i16 -27857, i16 3928, i16 6920, i16 -20217, i16 -19214, i16 -12047, i16 25103, i16 -28048, i16 26456, i16 -22282, i16 -20584, i16 21816, i16 -4321, i16 -8012, i16 8968, i16 -28833, i16 -25533, i16 30842, i16 -6453, i16 -3353, i16 -26716, i16 3692, i16 -3941, i16 17098, i16 26341, i16 -8554, i16 513, i16 9006, i16 19094, i16 12356, i16 -21220, i16 14550, i16 -9580, i16 -15216, i16 24992, i16 19420, i16 -31569, i16 6715, i16 -14815, i16 24989, i16 -11890, i16 -25920, i16 -7791, i16 499, i16 -27697, i16 1190, i16 -9977, i16 7081, i16 25970, i16 -22763, i16 17857, i16 15403, i16 6007, i16 17068, i16 26476, i16 3709, i16 -2108, i16 -23663, i16 -18782, i16 21870, i16 4428, i16 18633, i16 -25677, i16 -10996, i16 -13714, i16 -21304, i16 19879, i16 -8358, i16 -31334, i16 843, i16 7555, i16 30784, i16 10298, i16 -32666, i16 -20021, i16 17602, i16 -21554, i16 31960, i16 -2488, i16 -18060, i16 7513, i16 2982, i16 -15349, i16 15405, i16 -20741, i16 -11034, i16 -31311, i16 11514, i16 -16417, i16 18907, i16 23527, i16 2646, i16 -426, i16 -31166, i16 -31184, i16 9367, i16 2116, i16 29419, i16 5093, i16 -27478, i16 11706, i16 -630, i16 8573, i16 27138, i16 14820, i16 31182, i16 9742, i16 17357, i16 26149, i16 32691, i16 5396, i16 -13976, i16 -9344, i16 -9452, i16 22640, i16 -18923, i16 26169, i16 24707, i16 -6478, i16 27627, i16 16315, i16 -17572, i16 -1638, i16 16909, i16 4796, i16 -30441, i16 10459, i16 542, i16 -25186, i16 21982, i16 -4829, i16 18676, i16 -26856, i16 20063, i16 -12457, i16 -16757, i16 -18155, i16 -17694, i16 -14301, i16 22843, i16 5596, i16 -26723, i16 -27727, i16 8237, i16 7024, i16 -8633, i16 -585, i16 8459, i16 -5831, i16 21738, i16 27063, i16 -29450, i16 -9245, i16 -2563, i16 7042, i16 12477, i16 29573, i16 17841, i16 1021, i16 -17334, i16 -2042, i16 10379, i16 5671, i16 -29345, i16 32700, i16 3890, i16 26714, i16 -3710, i16 15445, i16 -29814, i16 -23088, i16 4918, i16 12794, i16 -23808, i16 -27544, i16 1643, i16 -17231, i16 29223, i16 -19798, i16 -22474, i16 -30718, i16 -2684, i16 12808, i16 17860, i16 -8995, i16 2981, i16 -11930, i16 16012, i16 27066, i16 1144, i16 23516, i16 5572, i16 -5887, i16 20953, i16 -12358, i16 -22763, i16 18861, i16 11628, i16 29132, i16 29329, i16 15915, i16 18348, i16 20702, i16 13284, i16 21895, i16 -11196, i16 -638, i16 14537, i16 714, i16 -30819, i16 31248, i16 10944, i16 13981, i16 22967, i16 -22803, i16 16381, i16 28465, i16 8764, i16 -20720, i16 1955, i16 25186, i16 25042, i16 14530, i16 17713, i16 -23014, i16 -13136, i16 24228, i16 -28868, i16 -1293, i16 27252, i16 -19210, i16 -23202, i16 7456, i16 24370, i16 -8427, i16 -20114, i16 16269, i16 -20016, i16 31045, i16 -6159, i16 -27325, i16 -23664, i16 23217, i16 15311, i16 -29423, i16 27885, i16 29615, i16 6473, i16 -23704, i16 29611, i16 -13241, i16 23594, i16 -4474, i16 20009, i16 26357, i16 -2756, i16 -14121, i16 10233, i16 2990, i16 -3331, i16 15767, i16 23474, i16 16160, i16 -7790, i16 7099, i16 22020, i16 -5570, i16 -18948, i16 -11503, i16 5644, i16 30203, i16 -18295, i16 32678, i16 -8472, i16 24404, i16 8844, i16 -14489, i16 -4466, i16 -30828, i16 25424, i16 28170, i16 19929, i16 -15149, i16 16457, i16 -15570, i16 3556, i16 30399, i16 17548, i16 20160, i16 -31077, i16 9118, i16 13184, i16 24481, i16 27278, i16 24979, i16 29397, i16 24709, i16 -15352, i16 -28641, i16 -24651, i16 5918, i16 12128, i16 9706, i16 -15558, i16 12664, i16 -6514, i16 -26941, i16 -9697, i16 -14938, i16 29184, i16 5605, i16 -23623, i16 -22626, i16 4782, i16 -18308, i16 -5081, i16 -18079, i16 14700, i16 -17305, i16 -14904, i16 -26274, i16 -24706, i16 -2242, i16 26093, i16 21272, i16 -11151, i16 -20075, i16 -26417, i16 -2554, i16 21800, i16 29314, i16 195, i16 14009, i16 -32716, i16 32604, i16 -27477, i16 32324, i16 -1175, i16 5061, i16 4527, i16 3031, i16 24237, i16 -27157, i16 21549, i16 3245, i16 14355, i16 19210, i16 -13331, i16 -12760, i16 -17113, i16 20532, i16 32665, i16 28217, i16 -17013, i16 -9388, i16 21355, i16 -20987, i16 -21822, i16 2160, i16 -30936, i16 -13627, i16 -14005, i16 -18643, i16 -24756, i16 -32531], align 2
@.str = private unnamed_addr constant [5 x i8] c"%d, \00", align 1

; Function Attrs: nounwind
define void @vitgsm(i32 %n, i16* nocapture %old, i16* nocapture %new_s, i16* nocapture %trans, i16* nocapture %m, i16* nocapture readonly %sd) #0 {
entry:
  %cmp139 = icmp sgt i32 %n, 0
  br i1 %cmp139, label %for.body.lr.ph, label %for.body79

for.body.lr.ph:                                   ; preds = %entry
  %arrayidx13 = getelementptr inbounds i16, i16* %m, i32 2
  %arrayidx17 = getelementptr inbounds i16, i16* %m, i32 3
  %arrayidx18 = getelementptr inbounds i16, i16* %m, i32 1
  %arrayidx20 = getelementptr inbounds i16, i16* %m, i32 6
  %arrayidx21 = getelementptr inbounds i16, i16* %m, i32 4
  %arrayidx24 = getelementptr inbounds i16, i16* %m, i32 7
  %arrayidx25 = getelementptr inbounds i16, i16* %m, i32 5
  br label %for.body

for.body:                                         ; preds = %for.inc73, %for.body.lr.ph
  %i.0140 = phi i32 [ 0, %for.body.lr.ph ], [ %inc74, %for.inc73 ]
  %mul = shl nsw i32 %i.0140, 1
  %arrayidx = getelementptr inbounds i16, i16* %sd, i32 %mul
  %0 = load i16, i16* %arrayidx, align 2, !tbaa !1
  %conv = sext i16 %0 to i32
  %add132 = or i32 %mul, 1
  %arrayidx2 = getelementptr inbounds i16, i16* %sd, i32 %add132
  %1 = load i16, i16* %arrayidx2, align 2, !tbaa !1
  %conv3 = sext i16 %1 to i32
  %add4 = add nsw i32 %conv3, %conv
  %sub = sub nsw i32 %conv, %conv3
  %conv12 = trunc i32 %add4 to i16
  store i16 %conv12, i16* %arrayidx13, align 2, !tbaa !1
  store i16 %conv12, i16* %m, align 2, !tbaa !1
  %sub15 = sub nsw i32 0, %add4
  %conv16 = trunc i32 %sub15 to i16
  store i16 %conv16, i16* %arrayidx17, align 2, !tbaa !1
  store i16 %conv16, i16* %arrayidx18, align 2, !tbaa !1
  %conv19 = trunc i32 %sub to i16
  store i16 %conv19, i16* %arrayidx20, align 2, !tbaa !1
  store i16 %conv19, i16* %arrayidx21, align 2, !tbaa !1
  %sub22 = sub nsw i32 0, %sub
  %conv23 = trunc i32 %sub22 to i16
  store i16 %conv23, i16* %arrayidx24, align 2, !tbaa !1
  store i16 %conv23, i16* %arrayidx25, align 2, !tbaa !1
  %arrayidx50 = getelementptr inbounds i16, i16* %trans, i32 %i.0140
  br label %for.body29

for.body29:                                       ; preds = %for.inc58, %for.body
  %j.0137 = phi i32 [ 0, %for.body ], [ %inc, %for.inc58 ]
  %arrayidx30 = getelementptr inbounds i16, i16* %m, i32 %j.0137
  %2 = load i16, i16* %arrayidx30, align 2, !tbaa !1
  %conv31 = sext i16 %2 to i32
  %mul36 = shl nsw i32 %j.0137, 1
  %arrayidx37 = getelementptr inbounds i16, i16* %old, i32 %mul36
  %add41133 = or i32 %mul36, 1
  %arrayidx42 = getelementptr inbounds i16, i16* %old, i32 %add41133
  br label %for.body35

for.body35:                                       ; preds = %for.body29, %for.body35
  %mj.0136 = phi i32 [ %conv31, %for.body29 ], [ %sub56, %for.body35 ]
  %k.0135 = phi i32 [ 0, %for.body29 ], [ %add57, %for.body35 ]
  %3 = load i16, i16* %arrayidx37, align 2, !tbaa !1
  %conv38 = sext i16 %3 to i32
  %add39 = add nsw i32 %conv38, %mj.0136
  %4 = load i16, i16* %arrayidx42, align 2, !tbaa !1
  %conv43 = sext i16 %4 to i32
  %sub44 = sub nsw i32 %conv43, %mj.0136
  %cmp45 = icmp sgt i32 %sub44, %add39
  %cond = select i1 %cmp45, i32 %sub44, i32 %add39
  %conv47 = trunc i32 %cond to i16
  %add48 = add nuw nsw i32 %k.0135, %j.0137
  %arrayidx49 = getelementptr inbounds i16, i16* %new_s, i32 %add48
  store i16 %conv47, i16* %arrayidx49, align 2, !tbaa !1
  %5 = load i16, i16* %arrayidx50, align 2, !tbaa !1
  %shl = shl i16 %5, 1
  %conv53 = zext i1 %cmp45 to i16
  %or = or i16 %conv53, %shl
  store i16 %or, i16* %arrayidx50, align 2, !tbaa !1
  %sub56 = sub nsw i32 0, %mj.0136
  %add57 = add nuw nsw i32 %k.0135, 8
  %cmp33 = icmp slt i32 %add57, 16
  br i1 %cmp33, label %for.body35, label %for.inc58

for.inc58:                                        ; preds = %for.body35
  %inc = add nuw nsw i32 %j.0137, 1
  %exitcond141 = icmp eq i32 %inc, 8
  br i1 %exitcond141, label %for.body63, label %for.body29

for.body63:                                       ; preds = %for.inc58, %for.body63
  %j.1138 = phi i32 [ %inc71, %for.body63 ], [ 0, %for.inc58 ]
  %arrayidx64 = getelementptr inbounds i16, i16* %old, i32 %j.1138
  %6 = load i16, i16* %arrayidx64, align 2, !tbaa !1
  %arrayidx66 = getelementptr inbounds i16, i16* %new_s, i32 %j.1138
  %7 = load i16, i16* %arrayidx66, align 2, !tbaa !1
  store i16 %7, i16* %arrayidx64, align 2, !tbaa !1
  store i16 %6, i16* %arrayidx66, align 2, !tbaa !1
  %inc71 = add nuw nsw i32 %j.1138, 1
  %exitcond142 = icmp eq i32 %inc71, 8
  br i1 %exitcond142, label %for.inc73, label %for.body63

for.inc73:                                        ; preds = %for.body63
  %inc74 = add nuw nsw i32 %i.0140, 1
  %exitcond145 = icmp eq i32 %inc74, %n
  br i1 %exitcond145, label %for.body79, label %for.body

for.body79:                                       ; preds = %entry, %for.inc73, %for.body79
  %c.0134 = phi i32 [ %inc83, %for.body79 ], [ 0, %for.inc73 ], [ 0, %entry ]
  %arrayidx80 = getelementptr inbounds i16, i16* %old, i32 %c.0134
  %8 = load i16, i16* %arrayidx80, align 2, !tbaa !1
  %conv81 = sext i16 %8 to i32
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32 %conv81) #1
  %inc83 = add nuw nsw i32 %c.0134, 1
  %exitcond = icmp eq i32 %inc83, 24
  br i1 %exitcond, label %for.end84, label %for.body79

for.end84:                                        ; preds = %for.body79
  ret void
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #0

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %new_s = alloca [24 x i16], align 2
  %trans = alloca [189 x i16], align 2
  %m = alloca [8 x i16], align 2
  %0 = bitcast [24 x i16]* %new_s to i8*
  call void @llvm.lifetime.start(i64 48, i8* %0) #1
  %1 = bitcast [189 x i16]* %trans to i8*
  call void @llvm.lifetime.start(i64 378, i8* %1) #1
  %arraydecay = getelementptr inbounds [24 x i16], [24 x i16]* %new_s, i32 0, i32 0
  %arraydecay1 = getelementptr inbounds [189 x i16], [189 x i16]* %trans, i32 0, i32 0
  %arraydecay2 = getelementptr inbounds [8 x i16], [8 x i16]* %m, i32 0, i32 0
  call void @vitgsm(i32 189, i16* getelementptr inbounds ([24 x i16], [24 x i16]* @old, i32 0, i32 0), i16* %arraydecay, i16* %arraydecay1, i16* %arraydecay2, i16* getelementptr inbounds ([379 x i16], [379 x i16]* @sd, i32 0, i32 0))
  call void @llvm.lifetime.end(i64 378, i8* %1) #1
  call void @llvm.lifetime.end(i64 48, i8* %0) #1
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"short", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
