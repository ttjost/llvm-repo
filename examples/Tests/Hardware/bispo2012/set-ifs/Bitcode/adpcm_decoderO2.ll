; ModuleID = 'adpcm_decoder.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@indata = global [513 x i16] [i16 -19360, i16 20792, i16 -13446, i16 28862, i16 -13834, i16 -4038, i16 28855, i16 9475, i16 -17858, i16 -22675, i16 -13013, i16 -4021, i16 -15837, i16 -5811, i16 -27857, i16 3928, i16 6920, i16 -20217, i16 -19214, i16 -12047, i16 25103, i16 -28048, i16 26456, i16 -22282, i16 -20584, i16 21816, i16 -4321, i16 -8012, i16 8968, i16 -28833, i16 -25533, i16 30842, i16 -6453, i16 -3353, i16 -26716, i16 3692, i16 -3941, i16 17098, i16 26341, i16 -8554, i16 513, i16 9006, i16 19094, i16 12356, i16 -21220, i16 14550, i16 -9580, i16 -15216, i16 24992, i16 19420, i16 -31569, i16 6715, i16 -14815, i16 24989, i16 -11890, i16 -25920, i16 -7791, i16 499, i16 -27697, i16 1190, i16 -9977, i16 7081, i16 25970, i16 -22763, i16 17857, i16 15403, i16 6007, i16 17068, i16 26476, i16 3709, i16 -2108, i16 -23663, i16 -18782, i16 21870, i16 4428, i16 18633, i16 -25677, i16 -10996, i16 -13714, i16 -21304, i16 19879, i16 -8358, i16 -31334, i16 843, i16 7555, i16 30784, i16 10298, i16 -32666, i16 -20021, i16 17602, i16 -21554, i16 31960, i16 -2488, i16 -18060, i16 7513, i16 2982, i16 -15349, i16 15405, i16 -20741, i16 -11034, i16 -31311, i16 11514, i16 -16417, i16 18907, i16 23527, i16 2646, i16 -426, i16 -31166, i16 -31184, i16 9367, i16 2116, i16 29419, i16 5093, i16 -27478, i16 11706, i16 -630, i16 8573, i16 27138, i16 14820, i16 31182, i16 9742, i16 17357, i16 26149, i16 32691, i16 5396, i16 -13976, i16 -9344, i16 -9452, i16 22640, i16 -18923, i16 26169, i16 24707, i16 -6478, i16 27627, i16 16315, i16 -17572, i16 -1638, i16 16909, i16 4796, i16 -30441, i16 10459, i16 542, i16 -25186, i16 21982, i16 -4829, i16 18676, i16 -26856, i16 20063, i16 -12457, i16 -16757, i16 -18155, i16 -17694, i16 -14301, i16 22843, i16 5596, i16 -26723, i16 -27727, i16 8237, i16 7024, i16 -8633, i16 -585, i16 8459, i16 -5831, i16 21738, i16 27063, i16 -29450, i16 -9245, i16 -2563, i16 7042, i16 12477, i16 29573, i16 17841, i16 1021, i16 -17334, i16 -2042, i16 10379, i16 5671, i16 -29345, i16 32700, i16 3890, i16 26714, i16 -3710, i16 15445, i16 -29814, i16 -23088, i16 4918, i16 12794, i16 -23808, i16 -27544, i16 1643, i16 -17231, i16 29223, i16 -19798, i16 -22474, i16 -30718, i16 -2684, i16 12808, i16 17860, i16 -8995, i16 2981, i16 -11930, i16 16012, i16 27066, i16 1144, i16 23516, i16 5572, i16 -5887, i16 20953, i16 -12358, i16 -22763, i16 18861, i16 11628, i16 29132, i16 29329, i16 15915, i16 18348, i16 20702, i16 13284, i16 21895, i16 -11196, i16 -638, i16 14537, i16 714, i16 -30819, i16 31248, i16 10944, i16 13981, i16 22967, i16 -22803, i16 16381, i16 28465, i16 8764, i16 -20720, i16 1955, i16 25186, i16 25042, i16 14530, i16 17713, i16 -23014, i16 -13136, i16 24228, i16 -28868, i16 -1293, i16 27252, i16 -19210, i16 -23202, i16 7456, i16 24370, i16 -8427, i16 -20114, i16 16269, i16 -20016, i16 31045, i16 -6159, i16 -27325, i16 -23664, i16 23217, i16 15311, i16 -29423, i16 27885, i16 29615, i16 6473, i16 -23704, i16 29611, i16 -13241, i16 23594, i16 -4474, i16 20009, i16 26357, i16 -2756, i16 -14121, i16 10233, i16 2990, i16 -3331, i16 15767, i16 23474, i16 16160, i16 -7790, i16 7099, i16 22020, i16 -5570, i16 -18948, i16 -11503, i16 5644, i16 30203, i16 -18295, i16 32678, i16 -8472, i16 24404, i16 8844, i16 -14489, i16 -4466, i16 -30828, i16 25424, i16 28170, i16 19929, i16 -15149, i16 16457, i16 -15570, i16 3556, i16 30399, i16 17548, i16 20160, i16 -31077, i16 9118, i16 13184, i16 24481, i16 27278, i16 24979, i16 29397, i16 24709, i16 -15352, i16 -28641, i16 -24651, i16 5918, i16 12128, i16 9706, i16 -15558, i16 12664, i16 -6514, i16 -26941, i16 -9697, i16 -14938, i16 29184, i16 5605, i16 -23623, i16 -22626, i16 4782, i16 -18308, i16 -5081, i16 -18079, i16 14700, i16 -17305, i16 -14904, i16 -26274, i16 -24706, i16 -2242, i16 26093, i16 21272, i16 -11151, i16 -20075, i16 -26417, i16 -2554, i16 21800, i16 29314, i16 195, i16 14009, i16 -32716, i16 32604, i16 -27477, i16 32324, i16 -1175, i16 5061, i16 4527, i16 3031, i16 24237, i16 -27157, i16 21549, i16 3245, i16 14355, i16 19210, i16 -13331, i16 -12760, i16 -17113, i16 20532, i16 32665, i16 28217, i16 -17013, i16 -9388, i16 21355, i16 -20987, i16 -21822, i16 2160, i16 -30936, i16 -13627, i16 -14005, i16 -18643, i16 -24756, i16 -32531, i16 -8463, i16 15512, i16 11654, i16 -25200, i16 -3487, i16 -4829, i16 11366, i16 -15870, i16 -4099, i16 -15636, i16 -7596, i16 15806, i16 18415, i16 -23483, i16 32708, i16 8842, i16 -9857, i16 3696, i16 -4953, i16 -2344, i16 -16471, i16 10410, i16 31012, i16 -21905, i16 -11542, i16 -31894, i16 25991, i16 -20150, i16 -2982, i16 2026, i16 30073, i16 26816, i16 30207, i16 -9242, i16 625, i16 10980, i16 13407, i16 15779, i16 16746, i16 -19410, i16 13654, i16 -25550, i16 -20522, i16 -16550, i16 -8150, i16 28661, i16 -9262, i16 -1136, i16 8924, i16 -26782, i16 -1126, i16 -16188, i16 6336, i16 15366, i16 2110, i16 9823, i16 1615, i16 -31795, i16 20373, i16 24606, i16 -16836, i16 -28032, i16 -20110, i16 -31430, i16 -15420, i16 -24690, i16 -1003, i16 9673, i16 -16822, i16 9230, i16 7140, i16 21092, i16 4642, i16 25860, i16 4699, i16 -1528, i16 -19796, i16 -8734, i16 -6081, i16 -15807, i16 -32347, i16 20306, i16 3865, i16 -17020, i16 -12359, i16 30258, i16 -6686, i16 -23588, i16 -11685, i16 -20768, i16 21754, i16 29129, i16 8921, i16 2230, i16 -19105, i16 -28316, i16 -25942, i16 -29224, i16 30490, i16 -3641, i16 8458, i16 -15572, i16 15100, i16 -20309, i16 15816, i16 -23383, i16 21386, i16 14929, i16 -31394, i16 -24107, i16 -7883, i16 934, i16 12866, i16 24200, i16 -562, i16 17057, i16 32635, i16 15349, i16 -21704, i16 18672, i16 -26506, i16 -4630, i16 31070, i16 25810, i16 12825, i16 -24490, i16 5991, i16 27718, i16 8472, i16 28940, i16 17448, i16 22117, i16 -32376, i16 16838], align 2
@stepsizeTable = internal unnamed_addr constant [89 x i32] [i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 16, i32 17, i32 19, i32 21, i32 23, i32 25, i32 28, i32 31, i32 34, i32 37, i32 41, i32 45, i32 50, i32 55, i32 60, i32 66, i32 73, i32 80, i32 88, i32 97, i32 107, i32 118, i32 130, i32 143, i32 157, i32 173, i32 190, i32 209, i32 230, i32 253, i32 279, i32 307, i32 337, i32 371, i32 408, i32 449, i32 494, i32 544, i32 598, i32 658, i32 724, i32 796, i32 876, i32 963, i32 1060, i32 1166, i32 1282, i32 1411, i32 1552, i32 1707, i32 1878, i32 2066, i32 2272, i32 2499, i32 2749, i32 3024, i32 3327, i32 3660, i32 4026, i32 4428, i32 4871, i32 5358, i32 5894, i32 6484, i32 7132, i32 7845, i32 8630, i32 9493, i32 10442, i32 11487, i32 12635, i32 13899, i32 15289, i32 16818, i32 18500, i32 20350, i32 22385, i32 24623, i32 27086, i32 29794, i32 32767], align 4
@indexTable = internal unnamed_addr constant [16 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 2, i32 4, i32 6, i32 8, i32 -1, i32 -1, i32 -1, i32 -1, i32 2, i32 4, i32 6, i32 8], align 4
@outdata_ref = global [1024 x i8] c"\07\08\0F\0E\19\0D\02\EF\CD\17`\1E\E2E\5C\C7(\88\A4\ABF\D15\9A\0Fc\8E\EE\11\92\12\DA\F6\F4\DE^Io\18}F\C0\C7\C6\FF\00\12\10\12\86\FF\FA\FF\92\94\82\81\F5\FF\01\FF\FF\FF\01\13\00\00\FE\00\EE\FF\01\03\00\00\00\00\FE\00\EE\ED\FF\FF\CB\CD\BB\FF\FF\FF\11\00\FE\00\EE\F0|\5Ca\02\00\00\00\FEAaq\A7\00\00\00\00\FF\00\AC\00\FE\00\00\00\EE\ED\FF\01]d\FF\FF\FF\01\FF\BC\9C\FF\FF\01\13\11\13\11\13\00\FE\00\A4\84\A0\FF\01\FF\01\00\00\00 %\00\07\00\00\00\00\07\FF\01]=q\B4{\97\F6\FF\FFY\FF\FF\01\03\00\FE\00\00\00\00\EE\EF\DD\FF\FF\01DK\FFBb.\00\00\00\FE\00\A4\00\00\00\00\00\00\00\FE\FF\FF\FF\FF\FF\FF\FF\FF\EF\FF\FF\FF\01\03\00\FE\00\00\00\00\00\00L\00\FF\BC\00\FE\00\00\FF\00\00\00\FE\EC\EE\ABW\FF\FF\00t\AD\FF\FF\FF\FF\FF\FF\FF[\22\FFY\07\BB\BD\00\004\00\00\009\00\00\00\FE\EC\EE\00\A4\00\00\00\00\00\FE\BB\B4\B2\B0$\FF\01\FF\FF\00C\EF\FF\01\FF\FF\FF\FFY\EC\00\00\00\00\A4\C4\90\8E\8D\FF\FF\01\FF\FFBbR\F3\F5\00\07\00\FE\00\FE\00\00\00\BD\9D\00\00\EE\F0\94\00\00\FE\00\8C\93\94\D7\F7\FF\FF\01\03\00\FE\BB\FF\01u\95\FF\FF\00C<;\F8\FF\01\03\8F\C8\FC\FD\FF\01D\F0\0C\FF\01Dd\FF\FF\FF\C6\FF\FF\C6\92\FF\01\00\00\EE\FF\FF\00\12\14\00\07\08\00\00\00\FE\FD\A1\9A\9C\00\00\10oq\00\FE\00\00\00\00\A4\C4\A8\00\00\00\00\00\FE\FF\FF\FF\FF\00\FF\F8\FA\00\00\00\00\FE\8A\00\FF\00\00\00\EE\00\00\00\00\FE\A2\C2\8E2kO\F5b\FF\11\0F!\1F\DC\FF\FFY\AB\B3\A4\D4\FE\16\A9\A7\FF\FF\01\FF\FF\01\FF\8B\FF\FF\FF\FF\FF\01\02\00\00\FF\ED\FF\01\FF\FF\FF[\94xB\D5\A1\9FC\00\00\00\00\FE\00\EE\EF2\12F\FF\FFB\09\FF\FF[TR\FF\11\00\FE\00\00\00\00\00\00\00\EE\F0\AD\CD\D2\08\B6\8C}\F4\08\17\E7\E0\00\FE\A2\DB\00\00\00\00\00\00_\00\00\EE\FF\00\12\10\FF\00\12\14\02\FF\FF\FF\DF\AB\AD\00\FE\EC\EE\AB\A4\00\FE\00\00\00\00\00\FF\00\00\00\00\00\8C\00\10\22\00\00\BD\00\FE\FF\FF\FFs\FF\CB\CD\BB\B9\CB\FF\FF\11\13\D0\B0\E4\E5YR\00\FE\A2\9B\00\EE\EDyrpr\CE\22\00\00\00\FE\00\FE\EC\FF\FF\FF\01\FF\FF\01\02\F0\F2\F0\F2\F0\02\00\00\FEryw\D3\FF\01\00\FF\ED\EB_&\FF\A0\C0\A4\DA\88\FF\FF\01\03\00\07\FF\FF\01\13\11\13%\00\FE\00\00\00\00\BD\00\00\00\FE\BB\F4\D8\00\00\FEr\92\C6\FF\FF\01]}m\7F\D1\1D\FF\FF\01\8D\FF\01\FF\FF\FF\FF\C6\92\FF\FF\01\BE\B7\FF\01\00\00\00\FEZ\00\00_a\ED\F4\F2\FF\FF\FF\FF\FF\FF\F8\00\00\00\FE\FF\01\13\00\00\FE\FF\01\FF\00C\FF\01\FF\FFB\FF\01\02E\00\00\00\AE\FAY[\00\00\EE\F0dk\FF\01\FF\01\13\00\EE\F0\00\FF\00\00\00\FE\FF\FF\11\FF\FF\01\03\C0\C7\C9\86\7F}\FF\FF\FF\F8\FF\FF\01\BE\9Ejhjh\C4\FD\C9\00\FE\FCX8\04\F2\00\FF\8B\92\90\A2\A0\A2\A0\A2\00\00\00\EE\EC\FE\FC\00\00\8C\93\91\FF\DF\AB\99\9A\AC\AA\98\9A\9C\8A\8C\18\00\00\FE\FF\FF\FF\FF\FF\FF\FF\01\8DT8\D9\00\FE\BB\B4\B2\B0\F3\FF\FF\FF\FFSN\FF\DF\CFu\FF\B3\B1\C3\00\FE\00\00\FF\00\00\00\00\00\00\00\07\FF\01\FF\FF\01D\00\00\A4\00\00\EE\ED0P\1C\00\00\00\00\00\00\00\00\00\00m\11\18\1A\00\FE\FC\FF\01\FF\FF\FFs:\06\00\00\A4\AB\AD\00\FE\FCpihV\FF\01\03\F1\F3\00\FE\A2\F6*\FF\FF\FF\FF\FF\FFs\ACx5\FC\FF\FF\00t", align 1

; Function Attrs: nounwind
define void @adpcm_decoder(i16* nocapture readonly %indata, i8* nocapture %outdata) #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %if.end34, %entry
  %inputbuffer.083 = phi i32 [ 0, %entry ], [ %inputbuffer.1, %if.end34 ]
  %bufferstep.082 = phi i32 [ 0, %entry ], [ %lnot.ext, %if.end34 ]
  %index.081 = phi i32 [ 0, %entry ], [ %..add, %if.end34 ]
  %valpred.080 = phi i32 [ 0, %entry ], [ %valpred.2, %if.end34 ]
  %step.079 = phi i32 [ 7, %entry ], [ %4, %if.end34 ]
  %i.078 = phi i32 [ 0, %entry ], [ %i.1, %if.end34 ]
  %len.077 = phi i32 [ 0, %entry ], [ %inc52, %if.end34 ]
  %tobool = icmp ne i32 %bufferstep.082, 0
  br i1 %tobool, label %if.end, label %if.else

if.else:                                          ; preds = %for.body
  %arrayidx1 = getelementptr inbounds i16, i16* %indata, i32 %i.078
  %0 = load i16, i16* %arrayidx1, align 2, !tbaa !1
  %conv = sext i16 %0 to i32
  %inc = add nsw i32 %i.078, 1
  %shr76 = lshr i32 %conv, 4
  br label %if.end

if.end:                                           ; preds = %for.body, %if.else
  %i.1 = phi i32 [ %inc, %if.else ], [ %i.078, %for.body ]
  %delta.0.in = phi i32 [ %shr76, %if.else ], [ %inputbuffer.083, %for.body ]
  %inputbuffer.1 = phi i32 [ %conv, %if.else ], [ %inputbuffer.083, %for.body ]
  %delta.0 = and i32 %delta.0.in, 15
  %1 = zext i1 %tobool to i32
  %lnot.ext = xor i32 %1, 1
  %arrayidx4 = getelementptr inbounds [16 x i32], [16 x i32]* @indexTable, i32 0, i32 %delta.0
  %2 = load i32, i32* %arrayidx4, align 4, !tbaa !5
  %add = add nsw i32 %2, %index.081
  %cmp5 = icmp slt i32 %add, 0
  %.add = select i1 %cmp5, i32 0, i32 %add
  %cmp9 = icmp sgt i32 %.add, 88
  %..add = select i1 %cmp9, i32 88, i32 %.add
  %and13 = and i32 %delta.0.in, 8
  %shr15 = ashr i32 %step.079, 3
  %and16 = and i32 %delta.0.in, 4
  %tobool17 = icmp eq i32 %and16, 0
  br i1 %tobool17, label %if.else20, label %if.then18

if.then18:                                        ; preds = %if.end
  %add19 = add nsw i32 %shr15, %step.079
  br label %if.end34

if.else20:                                        ; preds = %if.end
  %and21 = and i32 %delta.0.in, 2
  %tobool22 = icmp eq i32 %and21, 0
  br i1 %tobool22, label %if.else26, label %if.then23

if.then23:                                        ; preds = %if.else20
  %shr24 = ashr i32 %step.079, 1
  %add25 = add nsw i32 %shr15, %shr24
  br label %if.end34

if.else26:                                        ; preds = %if.else20
  %and27 = and i32 %delta.0.in, 1
  %tobool28 = icmp eq i32 %and27, 0
  br i1 %tobool28, label %if.end34, label %if.then29

if.then29:                                        ; preds = %if.else26
  %shr30 = ashr i32 %step.079, 2
  %add31 = add nsw i32 %shr15, %shr30
  br label %if.end34

if.end34:                                         ; preds = %if.else26, %if.then23, %if.then29, %if.then18
  %vpdiff.0 = phi i32 [ %add19, %if.then18 ], [ %add25, %if.then23 ], [ %add31, %if.then29 ], [ %shr15, %if.else26 ]
  %tobool35 = icmp eq i32 %and13, 0
  %3 = sub i32 0, %vpdiff.0
  %valpred.1.p = select i1 %tobool35, i32 %vpdiff.0, i32 %3
  %valpred.1 = add i32 %valpred.1.p, %valpred.080
  %cmp40 = icmp sgt i32 %valpred.1, 32767
  %cmp44 = icmp slt i32 %valpred.1, -32768
  %.valpred.1 = select i1 %cmp44, i32 -32768, i32 %valpred.1
  %valpred.2 = select i1 %cmp40, i32 32767, i32 %.valpred.1
  %arrayidx49 = getelementptr inbounds [89 x i32], [89 x i32]* @stepsizeTable, i32 0, i32 %..add
  %4 = load i32, i32* %arrayidx49, align 4, !tbaa !5
  %conv50 = trunc i32 %valpred.2 to i8
  %arrayidx51 = getelementptr inbounds i8, i8* %outdata, i32 %len.077
  store i8 %conv50, i8* %arrayidx51, align 1, !tbaa !7
  %inc52 = add nuw nsw i32 %len.077, 1
  %exitcond = icmp eq i32 %inc52, 1024
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end34
  ret void
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %outdata = alloca [1024 x i8], align 1
  %0 = getelementptr inbounds [1024 x i8], [1024 x i8]* %outdata, i32 0, i32 0
  call void @llvm.lifetime.start(i64 1024, i8* %0) #1
  call void @adpcm_decoder(i16* getelementptr inbounds ([513 x i16], [513 x i16]* @indata, i32 0, i32 0), i8* %0)
  br label %for.body

for.body:                                         ; preds = %entry, %for.inc
  %i.09 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %arrayidx = getelementptr inbounds [1024 x i8], [1024 x i8]* @outdata_ref, i32 0, i32 %i.09
  %1 = load i8, i8* %arrayidx, align 1, !tbaa !7
  %arrayidx1 = getelementptr inbounds [1024 x i8], [1024 x i8]* %outdata, i32 0, i32 %i.09
  %2 = load i8, i8* %arrayidx1, align 1, !tbaa !7
  %cmp3 = icmp eq i8 %1, %2
  br i1 %cmp3, label %for.inc, label %if.then

if.then:                                          ; preds = %for.body
  %i.09.lcssa = phi i32 [ %i.09, %for.body ]
  %add = add nsw i32 %i.09.lcssa, 10
  br label %cleanup

for.inc:                                          ; preds = %for.body
  %inc = add nuw nsw i32 %i.09, 1
  %cmp = icmp slt i32 %inc, 1024
  br i1 %cmp, label %for.body, label %cleanup.loopexit

cleanup.loopexit:                                 ; preds = %for.inc
  br label %cleanup

cleanup:                                          ; preds = %cleanup.loopexit, %if.then
  %retval.0 = phi i32 [ %add, %if.then ], [ -1, %cleanup.loopexit ]
  call void @llvm.lifetime.end(i64 1024, i8* %0) #1
  ret i32 %retval.0
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"short", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !3, i64 0}
!7 = !{!3, !3, i64 0}
