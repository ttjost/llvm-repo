; ModuleID = 'viterbi_gsm_print.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@old = global [24 x i16] [i16 -19360, i16 20792, i16 -13446, i16 28862, i16 -13834, i16 -4038, i16 28855, i16 9475, i16 -17858, i16 -22675, i16 -13013, i16 -4021, i16 -15837, i16 -5811, i16 -27857, i16 3928, i16 6920, i16 -20217, i16 -19214, i16 -12047, i16 25103, i16 -28048, i16 26456, i16 -22282], align 2
@sd = global [379 x i16] [i16 -19360, i16 20792, i16 -13446, i16 28862, i16 -13834, i16 -4038, i16 28855, i16 9475, i16 -17858, i16 -22675, i16 -13013, i16 -4021, i16 -15837, i16 -5811, i16 -27857, i16 3928, i16 6920, i16 -20217, i16 -19214, i16 -12047, i16 25103, i16 -28048, i16 26456, i16 -22282, i16 -20584, i16 21816, i16 -4321, i16 -8012, i16 8968, i16 -28833, i16 -25533, i16 30842, i16 -6453, i16 -3353, i16 -26716, i16 3692, i16 -3941, i16 17098, i16 26341, i16 -8554, i16 513, i16 9006, i16 19094, i16 12356, i16 -21220, i16 14550, i16 -9580, i16 -15216, i16 24992, i16 19420, i16 -31569, i16 6715, i16 -14815, i16 24989, i16 -11890, i16 -25920, i16 -7791, i16 499, i16 -27697, i16 1190, i16 -9977, i16 7081, i16 25970, i16 -22763, i16 17857, i16 15403, i16 6007, i16 17068, i16 26476, i16 3709, i16 -2108, i16 -23663, i16 -18782, i16 21870, i16 4428, i16 18633, i16 -25677, i16 -10996, i16 -13714, i16 -21304, i16 19879, i16 -8358, i16 -31334, i16 843, i16 7555, i16 30784, i16 10298, i16 -32666, i16 -20021, i16 17602, i16 -21554, i16 31960, i16 -2488, i16 -18060, i16 7513, i16 2982, i16 -15349, i16 15405, i16 -20741, i16 -11034, i16 -31311, i16 11514, i16 -16417, i16 18907, i16 23527, i16 2646, i16 -426, i16 -31166, i16 -31184, i16 9367, i16 2116, i16 29419, i16 5093, i16 -27478, i16 11706, i16 -630, i16 8573, i16 27138, i16 14820, i16 31182, i16 9742, i16 17357, i16 26149, i16 32691, i16 5396, i16 -13976, i16 -9344, i16 -9452, i16 22640, i16 -18923, i16 26169, i16 24707, i16 -6478, i16 27627, i16 16315, i16 -17572, i16 -1638, i16 16909, i16 4796, i16 -30441, i16 10459, i16 542, i16 -25186, i16 21982, i16 -4829, i16 18676, i16 -26856, i16 20063, i16 -12457, i16 -16757, i16 -18155, i16 -17694, i16 -14301, i16 22843, i16 5596, i16 -26723, i16 -27727, i16 8237, i16 7024, i16 -8633, i16 -585, i16 8459, i16 -5831, i16 21738, i16 27063, i16 -29450, i16 -9245, i16 -2563, i16 7042, i16 12477, i16 29573, i16 17841, i16 1021, i16 -17334, i16 -2042, i16 10379, i16 5671, i16 -29345, i16 32700, i16 3890, i16 26714, i16 -3710, i16 15445, i16 -29814, i16 -23088, i16 4918, i16 12794, i16 -23808, i16 -27544, i16 1643, i16 -17231, i16 29223, i16 -19798, i16 -22474, i16 -30718, i16 -2684, i16 12808, i16 17860, i16 -8995, i16 2981, i16 -11930, i16 16012, i16 27066, i16 1144, i16 23516, i16 5572, i16 -5887, i16 20953, i16 -12358, i16 -22763, i16 18861, i16 11628, i16 29132, i16 29329, i16 15915, i16 18348, i16 20702, i16 13284, i16 21895, i16 -11196, i16 -638, i16 14537, i16 714, i16 -30819, i16 31248, i16 10944, i16 13981, i16 22967, i16 -22803, i16 16381, i16 28465, i16 8764, i16 -20720, i16 1955, i16 25186, i16 25042, i16 14530, i16 17713, i16 -23014, i16 -13136, i16 24228, i16 -28868, i16 -1293, i16 27252, i16 -19210, i16 -23202, i16 7456, i16 24370, i16 -8427, i16 -20114, i16 16269, i16 -20016, i16 31045, i16 -6159, i16 -27325, i16 -23664, i16 23217, i16 15311, i16 -29423, i16 27885, i16 29615, i16 6473, i16 -23704, i16 29611, i16 -13241, i16 23594, i16 -4474, i16 20009, i16 26357, i16 -2756, i16 -14121, i16 10233, i16 2990, i16 -3331, i16 15767, i16 23474, i16 16160, i16 -7790, i16 7099, i16 22020, i16 -5570, i16 -18948, i16 -11503, i16 5644, i16 30203, i16 -18295, i16 32678, i16 -8472, i16 24404, i16 8844, i16 -14489, i16 -4466, i16 -30828, i16 25424, i16 28170, i16 19929, i16 -15149, i16 16457, i16 -15570, i16 3556, i16 30399, i16 17548, i16 20160, i16 -31077, i16 9118, i16 13184, i16 24481, i16 27278, i16 24979, i16 29397, i16 24709, i16 -15352, i16 -28641, i16 -24651, i16 5918, i16 12128, i16 9706, i16 -15558, i16 12664, i16 -6514, i16 -26941, i16 -9697, i16 -14938, i16 29184, i16 5605, i16 -23623, i16 -22626, i16 4782, i16 -18308, i16 -5081, i16 -18079, i16 14700, i16 -17305, i16 -14904, i16 -26274, i16 -24706, i16 -2242, i16 26093, i16 21272, i16 -11151, i16 -20075, i16 -26417, i16 -2554, i16 21800, i16 29314, i16 195, i16 14009, i16 -32716, i16 32604, i16 -27477, i16 32324, i16 -1175, i16 5061, i16 4527, i16 3031, i16 24237, i16 -27157, i16 21549, i16 3245, i16 14355, i16 19210, i16 -13331, i16 -12760, i16 -17113, i16 20532, i16 32665, i16 28217, i16 -17013, i16 -9388, i16 21355, i16 -20987, i16 -21822, i16 2160, i16 -30936, i16 -13627, i16 -14005, i16 -18643, i16 -24756, i16 -32531], align 2
@.str = private unnamed_addr constant [5 x i8] c"%d, \00", align 1

; Function Attrs: nounwind
define void @vitgsm(i32 %n, i16* %old, i16* %new_s, i16* %trans, i16* %m, i16* %sd) #0 {
entry:
  %n.addr = alloca i32, align 4
  %old.addr = alloca i16*, align 4
  %new_s.addr = alloca i16*, align 4
  %trans.addr = alloca i16*, align 4
  %m.addr = alloca i16*, align 4
  %sd.addr = alloca i16*, align 4
  %tmp1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %m0 = alloca i32, align 4
  %m1 = alloca i32, align 4
  %mj = alloca i32, align 4
  %c = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store i16* %old, i16** %old.addr, align 4
  store i16* %new_s, i16** %new_s.addr, align 4
  store i16* %trans, i16** %trans.addr, align 4
  store i16* %m, i16** %m.addr, align 4
  store i16* %sd, i16** %sd.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc73, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %n.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end75

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  %mul = mul nsw i32 2, %2
  %3 = load i16*, i16** %sd.addr, align 4
  %arrayidx = getelementptr inbounds i16, i16* %3, i32 %mul
  %4 = load i16, i16* %arrayidx, align 2
  %conv = sext i16 %4 to i32
  %5 = load i32, i32* %i, align 4
  %mul1 = mul nsw i32 2, %5
  %add = add nsw i32 %mul1, 1
  %6 = load i16*, i16** %sd.addr, align 4
  %arrayidx2 = getelementptr inbounds i16, i16* %6, i32 %add
  %7 = load i16, i16* %arrayidx2, align 2
  %conv3 = sext i16 %7 to i32
  %add4 = add nsw i32 %conv, %conv3
  store i32 %add4, i32* %m0, align 4
  %8 = load i32, i32* %i, align 4
  %mul5 = mul nsw i32 2, %8
  %9 = load i16*, i16** %sd.addr, align 4
  %arrayidx6 = getelementptr inbounds i16, i16* %9, i32 %mul5
  %10 = load i16, i16* %arrayidx6, align 2
  %conv7 = sext i16 %10 to i32
  %11 = load i32, i32* %i, align 4
  %mul8 = mul nsw i32 2, %11
  %add9 = add nsw i32 %mul8, 1
  %12 = load i16*, i16** %sd.addr, align 4
  %arrayidx10 = getelementptr inbounds i16, i16* %12, i32 %add9
  %13 = load i16, i16* %arrayidx10, align 2
  %conv11 = sext i16 %13 to i32
  %sub = sub nsw i32 %conv7, %conv11
  store i32 %sub, i32* %m1, align 4
  %14 = load i32, i32* %m0, align 4
  %conv12 = trunc i32 %14 to i16
  %15 = load i16*, i16** %m.addr, align 4
  %arrayidx13 = getelementptr inbounds i16, i16* %15, i32 2
  store i16 %conv12, i16* %arrayidx13, align 2
  %16 = load i16*, i16** %m.addr, align 4
  %arrayidx14 = getelementptr inbounds i16, i16* %16, i32 0
  store i16 %conv12, i16* %arrayidx14, align 2
  %17 = load i32, i32* %m0, align 4
  %sub15 = sub nsw i32 0, %17
  %conv16 = trunc i32 %sub15 to i16
  %18 = load i16*, i16** %m.addr, align 4
  %arrayidx17 = getelementptr inbounds i16, i16* %18, i32 3
  store i16 %conv16, i16* %arrayidx17, align 2
  %19 = load i16*, i16** %m.addr, align 4
  %arrayidx18 = getelementptr inbounds i16, i16* %19, i32 1
  store i16 %conv16, i16* %arrayidx18, align 2
  %20 = load i32, i32* %m1, align 4
  %conv19 = trunc i32 %20 to i16
  %21 = load i16*, i16** %m.addr, align 4
  %arrayidx20 = getelementptr inbounds i16, i16* %21, i32 6
  store i16 %conv19, i16* %arrayidx20, align 2
  %22 = load i16*, i16** %m.addr, align 4
  %arrayidx21 = getelementptr inbounds i16, i16* %22, i32 4
  store i16 %conv19, i16* %arrayidx21, align 2
  %23 = load i32, i32* %m1, align 4
  %sub22 = sub nsw i32 0, %23
  %conv23 = trunc i32 %sub22 to i16
  %24 = load i16*, i16** %m.addr, align 4
  %arrayidx24 = getelementptr inbounds i16, i16* %24, i32 7
  store i16 %conv23, i16* %arrayidx24, align 2
  %25 = load i16*, i16** %m.addr, align 4
  %arrayidx25 = getelementptr inbounds i16, i16* %25, i32 5
  store i16 %conv23, i16* %arrayidx25, align 2
  store i32 0, i32* %j, align 4
  br label %for.cond26

for.cond26:                                       ; preds = %for.inc58, %for.body
  %26 = load i32, i32* %j, align 4
  %cmp27 = icmp slt i32 %26, 8
  br i1 %cmp27, label %for.body29, label %for.end59

for.body29:                                       ; preds = %for.cond26
  %27 = load i32, i32* %j, align 4
  %28 = load i16*, i16** %m.addr, align 4
  %arrayidx30 = getelementptr inbounds i16, i16* %28, i32 %27
  %29 = load i16, i16* %arrayidx30, align 2
  %conv31 = sext i16 %29 to i32
  store i32 %conv31, i32* %mj, align 4
  store i32 0, i32* %k, align 4
  br label %for.cond32

for.cond32:                                       ; preds = %for.inc, %for.body29
  %30 = load i32, i32* %k, align 4
  %cmp33 = icmp slt i32 %30, 16
  br i1 %cmp33, label %for.body35, label %for.end

for.body35:                                       ; preds = %for.cond32
  %31 = load i32, i32* %j, align 4
  %mul36 = mul nsw i32 2, %31
  %32 = load i16*, i16** %old.addr, align 4
  %arrayidx37 = getelementptr inbounds i16, i16* %32, i32 %mul36
  %33 = load i16, i16* %arrayidx37, align 2
  %conv38 = sext i16 %33 to i32
  %34 = load i32, i32* %mj, align 4
  %add39 = add nsw i32 %conv38, %34
  store i32 %add39, i32* %a, align 4
  %35 = load i32, i32* %j, align 4
  %mul40 = mul nsw i32 2, %35
  %add41 = add nsw i32 %mul40, 1
  %36 = load i16*, i16** %old.addr, align 4
  %arrayidx42 = getelementptr inbounds i16, i16* %36, i32 %add41
  %37 = load i16, i16* %arrayidx42, align 2
  %conv43 = sext i16 %37 to i32
  %38 = load i32, i32* %mj, align 4
  %sub44 = sub nsw i32 %conv43, %38
  store i32 %sub44, i32* %b, align 4
  %39 = load i32, i32* %b, align 4
  %40 = load i32, i32* %a, align 4
  %cmp45 = icmp sgt i32 %39, %40
  br i1 %cmp45, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body35
  %41 = load i32, i32* %b, align 4
  br label %cond.end

cond.false:                                       ; preds = %for.body35
  %42 = load i32, i32* %a, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %41, %cond.true ], [ %42, %cond.false ]
  %conv47 = trunc i32 %cond to i16
  %43 = load i32, i32* %j, align 4
  %44 = load i32, i32* %k, align 4
  %add48 = add nsw i32 %43, %44
  %45 = load i16*, i16** %new_s.addr, align 4
  %arrayidx49 = getelementptr inbounds i16, i16* %45, i32 %add48
  store i16 %conv47, i16* %arrayidx49, align 2
  %46 = load i32, i32* %i, align 4
  %47 = load i16*, i16** %trans.addr, align 4
  %arrayidx50 = getelementptr inbounds i16, i16* %47, i32 %46
  %48 = load i16, i16* %arrayidx50, align 2
  %conv51 = sext i16 %48 to i32
  %shl = shl i32 %conv51, 1
  %49 = load i32, i32* %b, align 4
  %50 = load i32, i32* %a, align 4
  %cmp52 = icmp sgt i32 %49, %50
  %conv53 = zext i1 %cmp52 to i32
  %or = or i32 %shl, %conv53
  %conv54 = trunc i32 %or to i16
  %51 = load i32, i32* %i, align 4
  %52 = load i16*, i16** %trans.addr, align 4
  %arrayidx55 = getelementptr inbounds i16, i16* %52, i32 %51
  store i16 %conv54, i16* %arrayidx55, align 2
  %53 = load i32, i32* %mj, align 4
  %sub56 = sub nsw i32 0, %53
  store i32 %sub56, i32* %mj, align 4
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %54 = load i32, i32* %k, align 4
  %add57 = add nsw i32 %54, 8
  store i32 %add57, i32* %k, align 4
  br label %for.cond32

for.end:                                          ; preds = %for.cond32
  br label %for.inc58

for.inc58:                                        ; preds = %for.end
  %55 = load i32, i32* %j, align 4
  %inc = add nsw i32 %55, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond26

for.end59:                                        ; preds = %for.cond26
  store i32 0, i32* %j, align 4
  br label %for.cond60

for.cond60:                                       ; preds = %for.inc70, %for.end59
  %56 = load i32, i32* %j, align 4
  %cmp61 = icmp slt i32 %56, 8
  br i1 %cmp61, label %for.body63, label %for.end72

for.body63:                                       ; preds = %for.cond60
  %57 = load i32, i32* %j, align 4
  %58 = load i16*, i16** %old.addr, align 4
  %arrayidx64 = getelementptr inbounds i16, i16* %58, i32 %57
  %59 = load i16, i16* %arrayidx64, align 2
  %conv65 = sext i16 %59 to i32
  store i32 %conv65, i32* %tmp1, align 4
  %60 = load i32, i32* %j, align 4
  %61 = load i16*, i16** %new_s.addr, align 4
  %arrayidx66 = getelementptr inbounds i16, i16* %61, i32 %60
  %62 = load i16, i16* %arrayidx66, align 2
  %63 = load i32, i32* %j, align 4
  %64 = load i16*, i16** %old.addr, align 4
  %arrayidx67 = getelementptr inbounds i16, i16* %64, i32 %63
  store i16 %62, i16* %arrayidx67, align 2
  %65 = load i32, i32* %tmp1, align 4
  %conv68 = trunc i32 %65 to i16
  %66 = load i32, i32* %j, align 4
  %67 = load i16*, i16** %new_s.addr, align 4
  %arrayidx69 = getelementptr inbounds i16, i16* %67, i32 %66
  store i16 %conv68, i16* %arrayidx69, align 2
  br label %for.inc70

for.inc70:                                        ; preds = %for.body63
  %68 = load i32, i32* %j, align 4
  %inc71 = add nsw i32 %68, 1
  store i32 %inc71, i32* %j, align 4
  br label %for.cond60

for.end72:                                        ; preds = %for.cond60
  br label %for.inc73

for.inc73:                                        ; preds = %for.end72
  %69 = load i32, i32* %i, align 4
  %inc74 = add nsw i32 %69, 1
  store i32 %inc74, i32* %i, align 4
  br label %for.cond

for.end75:                                        ; preds = %for.cond
  store i32 0, i32* %c, align 4
  br label %for.cond76

for.cond76:                                       ; preds = %for.inc82, %for.end75
  %70 = load i32, i32* %c, align 4
  %cmp77 = icmp slt i32 %70, 24
  br i1 %cmp77, label %for.body79, label %for.end84

for.body79:                                       ; preds = %for.cond76
  %71 = load i32, i32* %c, align 4
  %72 = load i16*, i16** %old.addr, align 4
  %arrayidx80 = getelementptr inbounds i16, i16* %72, i32 %71
  %73 = load i16, i16* %arrayidx80, align 2
  %conv81 = sext i16 %73 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32 %conv81)
  br label %for.inc82

for.inc82:                                        ; preds = %for.body79
  %74 = load i32, i32* %c, align 4
  %inc83 = add nsw i32 %74, 1
  store i32 %inc83, i32* %c, align 4
  br label %for.cond76

for.end84:                                        ; preds = %for.cond76
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %new_s = alloca [24 x i16], align 2
  %trans = alloca [189 x i16], align 2
  %m = alloca [8 x i16], align 2
  %n = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 189, i32* %n, align 4
  %0 = load i32, i32* %n, align 4
  %arraydecay = getelementptr inbounds [24 x i16], [24 x i16]* %new_s, i32 0, i32 0
  %arraydecay1 = getelementptr inbounds [189 x i16], [189 x i16]* %trans, i32 0, i32 0
  %arraydecay2 = getelementptr inbounds [8 x i16], [8 x i16]* %m, i32 0, i32 0
  call void @vitgsm(i32 %0, i16* getelementptr inbounds ([24 x i16], [24 x i16]* @old, i32 0, i32 0), i16* %arraydecay, i16* %arraydecay1, i16* %arraydecay2, i16* getelementptr inbounds ([379 x i16], [379 x i16]* @sd, i32 0, i32 0))
  ret i32 0
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk)"}
