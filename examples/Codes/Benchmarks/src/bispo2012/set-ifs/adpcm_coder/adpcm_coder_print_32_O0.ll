; ModuleID = 'adpcm_coder_print.c'
target datalayout = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i386-unknown-linux-gnu"

@indata = global [1024 x i16] [i16 -19360, i16 20792, i16 -13446, i16 28862, i16 -13834, i16 -4038, i16 28855, i16 9475, i16 -17858, i16 -22675, i16 -13013, i16 -4021, i16 -15837, i16 -5811, i16 -27857, i16 3928, i16 6920, i16 -20217, i16 -19214, i16 -12047, i16 25103, i16 -28048, i16 26456, i16 -22282, i16 -20584, i16 21816, i16 -4321, i16 -8012, i16 8968, i16 -28833, i16 -25533, i16 30842, i16 -6453, i16 -3353, i16 -26716, i16 3692, i16 -3941, i16 17098, i16 26341, i16 -8554, i16 513, i16 9006, i16 19094, i16 12356, i16 -21220, i16 14550, i16 -9580, i16 -15216, i16 24992, i16 19420, i16 -31569, i16 6715, i16 -14815, i16 24989, i16 -11890, i16 -25920, i16 -7791, i16 499, i16 -27697, i16 1190, i16 -9977, i16 7081, i16 25970, i16 -22763, i16 17857, i16 15403, i16 6007, i16 17068, i16 26476, i16 3709, i16 -2108, i16 -23663, i16 -18782, i16 21870, i16 4428, i16 18633, i16 -25677, i16 -10996, i16 -13714, i16 -21304, i16 19879, i16 -8358, i16 -31334, i16 843, i16 7555, i16 30784, i16 10298, i16 -32666, i16 -20021, i16 17602, i16 -21554, i16 31960, i16 -2488, i16 -18060, i16 7513, i16 2982, i16 -15349, i16 15405, i16 -20741, i16 -11034, i16 -31311, i16 11514, i16 -16417, i16 18907, i16 23527, i16 2646, i16 -426, i16 -31166, i16 -31184, i16 9367, i16 2116, i16 29419, i16 5093, i16 -27478, i16 11706, i16 -630, i16 8573, i16 27138, i16 14820, i16 31182, i16 9742, i16 17357, i16 26149, i16 32691, i16 5396, i16 -13976, i16 -9344, i16 -9452, i16 22640, i16 -18923, i16 26169, i16 24707, i16 -6478, i16 27627, i16 16315, i16 -17572, i16 -1638, i16 16909, i16 4796, i16 -30441, i16 10459, i16 542, i16 -25186, i16 21982, i16 -4829, i16 18676, i16 -26856, i16 20063, i16 -12457, i16 -16757, i16 -18155, i16 -17694, i16 -14301, i16 22843, i16 5596, i16 -26723, i16 -27727, i16 8237, i16 7024, i16 -8633, i16 -585, i16 8459, i16 -5831, i16 21738, i16 27063, i16 -29450, i16 -9245, i16 -2563, i16 7042, i16 12477, i16 29573, i16 17841, i16 1021, i16 -17334, i16 -2042, i16 10379, i16 5671, i16 -29345, i16 32700, i16 3890, i16 26714, i16 -3710, i16 15445, i16 -29814, i16 -23088, i16 4918, i16 12794, i16 -23808, i16 -27544, i16 1643, i16 -17231, i16 29223, i16 -19798, i16 -22474, i16 -30718, i16 -2684, i16 12808, i16 17860, i16 -8995, i16 2981, i16 -11930, i16 16012, i16 27066, i16 1144, i16 23516, i16 5572, i16 -5887, i16 20953, i16 -12358, i16 -22763, i16 18861, i16 11628, i16 29132, i16 29329, i16 15915, i16 18348, i16 20702, i16 13284, i16 21895, i16 -11196, i16 -638, i16 14537, i16 714, i16 -30819, i16 31248, i16 10944, i16 13981, i16 22967, i16 -22803, i16 16381, i16 28465, i16 8764, i16 -20720, i16 1955, i16 25186, i16 25042, i16 14530, i16 17713, i16 -23014, i16 -13136, i16 24228, i16 -28868, i16 -1293, i16 27252, i16 -19210, i16 -23202, i16 7456, i16 24370, i16 -8427, i16 -20114, i16 16269, i16 -20016, i16 31045, i16 -6159, i16 -27325, i16 -23664, i16 23217, i16 15311, i16 -29423, i16 27885, i16 29615, i16 6473, i16 -23704, i16 29611, i16 -13241, i16 23594, i16 -4474, i16 20009, i16 26357, i16 -2756, i16 -14121, i16 10233, i16 2990, i16 -3331, i16 15767, i16 23474, i16 16160, i16 -7790, i16 7099, i16 22020, i16 -5570, i16 -18948, i16 -11503, i16 5644, i16 30203, i16 -18295, i16 32678, i16 -8472, i16 24404, i16 8844, i16 -14489, i16 -4466, i16 -30828, i16 25424, i16 28170, i16 19929, i16 -15149, i16 16457, i16 -15570, i16 3556, i16 30399, i16 17548, i16 20160, i16 -31077, i16 9118, i16 13184, i16 24481, i16 27278, i16 24979, i16 29397, i16 24709, i16 -15352, i16 -28641, i16 -24651, i16 5918, i16 12128, i16 9706, i16 -15558, i16 12664, i16 -6514, i16 -26941, i16 -9697, i16 -14938, i16 29184, i16 5605, i16 -23623, i16 -22626, i16 4782, i16 -18308, i16 -5081, i16 -18079, i16 14700, i16 -17305, i16 -14904, i16 -26274, i16 -24706, i16 -2242, i16 26093, i16 21272, i16 -11151, i16 -20075, i16 -26417, i16 -2554, i16 21800, i16 29314, i16 195, i16 14009, i16 -32716, i16 32604, i16 -27477, i16 32324, i16 -1175, i16 5061, i16 4527, i16 3031, i16 24237, i16 -27157, i16 21549, i16 3245, i16 14355, i16 19210, i16 -13331, i16 -12760, i16 -17113, i16 20532, i16 32665, i16 28217, i16 -17013, i16 -9388, i16 21355, i16 -20987, i16 -21822, i16 2160, i16 -30936, i16 -13627, i16 -14005, i16 -18643, i16 -24756, i16 -32531, i16 -8463, i16 15512, i16 11654, i16 -25200, i16 -3487, i16 -4829, i16 11366, i16 -15870, i16 -4099, i16 -15636, i16 -7596, i16 15806, i16 18415, i16 -23483, i16 32708, i16 8842, i16 -9857, i16 3696, i16 -4953, i16 -2344, i16 -16471, i16 10410, i16 31012, i16 -21905, i16 -11542, i16 -31894, i16 25991, i16 -20150, i16 -2982, i16 2026, i16 30073, i16 26816, i16 30207, i16 -9242, i16 625, i16 10980, i16 13407, i16 15779, i16 16746, i16 -19410, i16 13654, i16 -25550, i16 -20522, i16 -16550, i16 -8150, i16 28661, i16 -9262, i16 -1136, i16 8924, i16 -26782, i16 -1126, i16 -16188, i16 6336, i16 15366, i16 2110, i16 9823, i16 1615, i16 -31795, i16 20373, i16 24606, i16 -16836, i16 -28032, i16 -20110, i16 -31430, i16 -15420, i16 -24690, i16 -1003, i16 9673, i16 -16822, i16 9230, i16 7140, i16 21092, i16 4642, i16 25860, i16 4699, i16 -1528, i16 -19796, i16 -8734, i16 -6081, i16 -15807, i16 -32347, i16 20306, i16 3865, i16 -17020, i16 -12359, i16 30258, i16 -6686, i16 -23588, i16 -11685, i16 -20768, i16 21754, i16 29129, i16 8921, i16 2230, i16 -19105, i16 -28316, i16 -25942, i16 -29224, i16 30490, i16 -3641, i16 8458, i16 -15572, i16 15100, i16 -20309, i16 15816, i16 -23383, i16 21386, i16 14929, i16 -31394, i16 -24107, i16 -7883, i16 934, i16 12866, i16 24200, i16 -562, i16 17057, i16 32635, i16 15349, i16 -21704, i16 18672, i16 -26506, i16 -4630, i16 31070, i16 25810, i16 12825, i16 -24490, i16 5991, i16 27718, i16 8472, i16 28940, i16 17448, i16 22117, i16 -32376, i16 16838, i16 -11814, i16 -30964, i16 17329, i16 9835, i16 -20212, i16 -20291, i16 12839, i16 -3180, i16 14042, i16 28870, i16 -15077, i16 -20148, i16 4703, i16 2467, i16 22254, i16 -2537, i16 -23193, i16 -8288, i16 -29178, i16 28213, i16 -19351, i16 -25662, i16 4069, i16 4903, i16 -24141, i16 6375, i16 -11913, i16 -10382, i16 -22553, i16 32556, i16 -26454, i16 -13662, i16 -14427, i16 12686, i16 -31932, i16 -1647, i16 23689, i16 29139, i16 -22800, i16 -28951, i16 -29352, i16 -8534, i16 7833, i16 -2074, i16 2933, i16 12305, i16 6394, i16 4448, i16 -10855, i16 -10762, i16 -17291, i16 -24312, i16 -3646, i16 23841, i16 -3036, i16 -24847, i16 21100, i16 -16816, i16 31278, i16 4946, i16 23294, i16 -1117, i16 -19621, i16 -29559, i16 -18553, i16 -20422, i16 12265, i16 29027, i16 31657, i16 30236, i16 -6753, i16 -19558, i16 -17195, i16 18010, i16 30499, i16 -22882, i16 7096, i16 14195, i16 7304, i16 -360, i16 -3852, i16 15866, i16 299, i16 15275, i16 4371, i16 -11402, i16 10942, i16 1404, i16 23480, i16 -22648, i16 15781, i16 15092, i16 -30186, i16 -16557, i16 -19840, i16 -17852, i16 -3930, i16 -22761, i16 20744, i16 9513, i16 10260, i16 -26081, i16 1054, i16 9585, i16 -11911, i16 -15139, i16 23329, i16 -2627, i16 -5681, i16 1362, i16 19583, i16 12935, i16 24737, i16 -12877, i16 3470, i16 14182, i16 -6654, i16 3401, i16 5020, i16 -29552, i16 9151, i16 17304, i16 -28092, i16 10400, i16 -10793, i16 8643, i16 2819, i16 -30054, i16 30251, i16 24110, i16 -15862, i16 -4053, i16 28529, i16 -24987, i16 11349, i16 11316, i16 2926, i16 -25796, i16 -21765, i16 -7799, i16 -28572, i16 -7370, i16 10184, i16 9717, i16 16840, i16 -8406, i16 26376, i16 -11903, i16 14392, i16 -733, i16 8869, i16 -523, i16 17579, i16 9608, i16 17012, i16 31391, i16 21225, i16 -8580, i16 -14901, i16 14418, i16 -194, i16 -15993, i16 12886, i16 -3663, i16 21354, i16 10101, i16 -25558, i16 -27731, i16 -8485, i16 11902, i16 -25830, i16 10827, i16 -25059, i16 32422, i16 -16055, i16 21930, i16 26001, i16 28774, i16 26368, i16 -29884, i16 -15524, i16 31116, i16 -8254, i16 -22668, i16 -29534, i16 1119, i16 27804, i16 -27849, i16 -30220, i16 5382, i16 32704, i16 566, i16 -2298, i16 24873, i16 9556, i16 -29437, i16 -13915, i16 -16936, i16 -23161, i16 -21597, i16 -3097, i16 1964, i16 -19482, i16 21580, i16 5539, i16 -5845, i16 -16404, i16 17007, i16 20771, i16 9072, i16 15071, i16 10743, i16 14104, i16 15627, i16 -6439, i16 23251, i16 -563, i16 -17627, i16 -31964, i16 -26446, i16 30623, i16 18664, i16 27083, i16 11021, i16 31916, i16 28957, i16 -3475, i16 26986, i16 -17461, i16 -12778, i16 -20908, i16 18397, i16 9915, i16 -11315, i16 -11835, i16 -22574, i16 28062, i16 -26547, i16 24217, i16 28938, i16 15783, i16 15952, i16 -7156, i16 -18717, i16 14098, i16 -6615, i16 -6188, i16 28123, i16 -12716, i16 18660, i16 19573, i16 30038, i16 -29548, i16 25003, i16 18643, i16 -1633, i16 25433, i16 -13974, i16 -15096, i16 29228, i16 1923, i16 -22346, i16 12407, i16 -16347, i16 -30849, i16 25578, i16 9505, i16 12583, i16 -28490, i16 26003, i16 27703, i16 27204, i16 6213, i16 -21747, i16 14319, i16 32590, i16 23283, i16 -2195, i16 -22886, i16 -17835, i16 26719, i16 -12127, i16 -7434, i16 -10387, i16 -21127, i16 -21802, i16 30144, i16 -18252, i16 12851, i16 -6631, i16 -25459, i16 -10606, i16 32375, i16 -32192, i16 -17958, i16 -4030, i16 23131, i16 -21237, i16 12897, i16 -16239, i16 -8814, i16 -29051, i16 19374, i16 -17690, i16 -32219, i16 -2128, i16 -8208, i16 5249, i16 11875, i16 -10400, i16 -1260, i16 -25081, i16 27158, i16 -26265, i16 -19185, i16 12605, i16 13047, i16 -11278, i16 -8837, i16 -18668, i16 9314, i16 -6350, i16 19557, i16 2533, i16 -6579, i16 29502, i16 -5020, i16 14332, i16 6006, i16 -14281, i16 -11794, i16 -5542, i16 9947, i16 -19284, i16 -3098, i16 -3146, i16 -12177, i16 22080, i16 22904, i16 19397, i16 12554, i16 -12150, i16 -11991, i16 -1349, i16 -23136, i16 3644, i16 -31447, i16 -18160, i16 -5707, i16 -3962, i16 235, i16 18311, i16 10512, i16 -28484, i16 31735, i16 -15509, i16 -1874, i16 30773, i16 32254, i16 31515, i16 27385, i16 -3466, i16 12334, i16 1737, i16 -19654, i16 -8816, i16 -4152, i16 -22146, i16 3147, i16 -25402, i16 -2578, i16 15968, i16 -10608, i16 4466, i16 10433, i16 13879, i16 8486, i16 -16856, i16 27051, i16 26925, i16 4701, i16 30747, i16 -2824, i16 -16171, i16 -7324, i16 19135, i16 -22869, i16 -402, i16 25410, i16 29104, i16 14479, i16 8551, i16 13581, i16 -29487, i16 -12917, i16 12838, i16 15701, i16 29368, i16 24122, i16 29956, i16 -3360, i16 17737, i16 -9541, i16 18844, i16 -31076, i16 -21344, i16 5573, i16 14917, i16 5841, i16 23604, i16 -13059, i16 -36, i16 24981, i16 17976, i16 25227, i16 32198, i16 -21883, i16 8516, i16 7146, i16 -1484, i16 -14415, i16 9268, i16 -1537, i16 5801, i16 -30248, i16 7248, i16 32365, i16 19640, i16 -3116, i16 16813, i16 -3545, i16 -3310, i16 -2729, i16 28114, i16 326, i16 3776, i16 -25385, i16 -26467, i16 -16357, i16 29868, i16 -2874, i16 -16537, i16 28040, i16 -155, i16 6, i16 -26010, i16 -31093, i16 -8926, i16 -30308, i16 -15277, i16 -229, i16 14855, i16 -17501, i16 14412, i16 -19401, i16 -13657, i16 -20094, i16 18939, i16 27451, i16 -1335, i16 31073, i16 31734, i16 -3468, i16 -15249, i16 14552, i16 -10136, i16 14071, i16 29459, i16 26857, i16 -20495, i16 25518, i16 -10445, i16 23856, i16 -7477, i16 23987, i16 -20976, i16 -30120, i16 6189, i16 12768, i16 16817, i16 16337, i16 -30733, i16 18342, i16 -31442, i16 -14145, i16 14974, i16 27933, i16 12586, i16 10293, i16 -7464, i16 4189, i16 -23392, i16 -7006, i16 -18660, i16 14859, i16 -29213, i16 -26997, i16 -5356, i16 7478, i16 -24609, i16 11898, i16 -20189, i16 20579, i16 -10332, i16 9782, i16 -6811, i16 998, i16 5669, i16 4403, i16 -14572, i16 -13965], align 2
@stepsizeTable = internal global [89 x i32] [i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 16, i32 17, i32 19, i32 21, i32 23, i32 25, i32 28, i32 31, i32 34, i32 37, i32 41, i32 45, i32 50, i32 55, i32 60, i32 66, i32 73, i32 80, i32 88, i32 97, i32 107, i32 118, i32 130, i32 143, i32 157, i32 173, i32 190, i32 209, i32 230, i32 253, i32 279, i32 307, i32 337, i32 371, i32 408, i32 449, i32 494, i32 544, i32 598, i32 658, i32 724, i32 796, i32 876, i32 963, i32 1060, i32 1166, i32 1282, i32 1411, i32 1552, i32 1707, i32 1878, i32 2066, i32 2272, i32 2499, i32 2749, i32 3024, i32 3327, i32 3660, i32 4026, i32 4428, i32 4871, i32 5358, i32 5894, i32 6484, i32 7132, i32 7845, i32 8630, i32 9493, i32 10442, i32 11487, i32 12635, i32 13899, i32 15289, i32 16818, i32 18500, i32 20350, i32 22385, i32 24623, i32 27086, i32 29794, i32 32767], align 4
@indexTable = internal global [16 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 2, i32 4, i32 6, i32 8, i32 -1, i32 -1, i32 -1, i32 -1, i32 2, i32 4, i32 6, i32 8], align 4
@.str = private unnamed_addr constant [5 x i8] c"%d, \00", align 1

; Function Attrs: nounwind
define void @adpcm_coder(i16* %indata, i8* %outdata) #0 {
entry:
  %indata.addr = alloca i16*, align 4
  %outdata.addr = alloca i8*, align 4
  %i = alloca i32, align 4
  %len = alloca i32, align 4
  %sign = alloca i32, align 4
  %delta = alloca i32, align 4
  %step = alloca i32, align 4
  %valpred = alloca i32, align 4
  %vpdiff = alloca i32, align 4
  %index = alloca i32, align 4
  %bufferstep = alloca i32, align 4
  %outputbuffer = alloca i32, align 4
  %diff = alloca i32, align 4
  %val = alloca i32, align 4
  store i16* %indata, i16** %indata.addr, align 4
  store i8* %outdata, i8** %outdata.addr, align 4
  store i32 0, i32* %valpred, align 4
  store i32 0, i32* %index, align 4
  store i32 0, i32* %outputbuffer, align 4
  %0 = load i32, i32* %index, align 4
  %arrayidx = getelementptr inbounds [89 x i32], [89 x i32]* @stepsizeTable, i32 0, i32 %0
  %1 = load i32, i32* %arrayidx, align 4
  store i32 %1, i32* %step, align 4
  store i32 1, i32* %bufferstep, align 4
  store i32 0, i32* %i, align 4
  store i32 0, i32* %len, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %len, align 4
  %cmp = icmp slt i32 %2, 1024
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32, i32* %len, align 4
  %4 = load i16*, i16** %indata.addr, align 4
  %arrayidx1 = getelementptr inbounds i16, i16* %4, i32 %3
  %5 = load i16, i16* %arrayidx1, align 2
  %conv = sext i16 %5 to i32
  store i32 %conv, i32* %val, align 4
  %6 = load i32, i32* %val, align 4
  %7 = load i32, i32* %valpred, align 4
  %sub = sub nsw i32 %6, %7
  store i32 %sub, i32* %diff, align 4
  %8 = load i32, i32* %diff, align 4
  %cmp2 = icmp slt i32 %8, 0
  %cond = select i1 %cmp2, i32 8, i32 0
  store i32 %cond, i32* %sign, align 4
  %9 = load i32, i32* %sign, align 4
  %tobool = icmp ne i32 %9, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %10 = load i32, i32* %diff, align 4
  %sub4 = sub nsw i32 0, %10
  store i32 %sub4, i32* %diff, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  store i32 0, i32* %delta, align 4
  %11 = load i32, i32* %step, align 4
  %shr = ashr i32 %11, 3
  store i32 %shr, i32* %vpdiff, align 4
  %12 = load i32, i32* %diff, align 4
  %13 = load i32, i32* %step, align 4
  %cmp5 = icmp sge i32 %12, %13
  br i1 %cmp5, label %if.then7, label %if.end9

if.then7:                                         ; preds = %if.end
  store i32 4, i32* %delta, align 4
  %14 = load i32, i32* %step, align 4
  %15 = load i32, i32* %diff, align 4
  %sub8 = sub nsw i32 %15, %14
  store i32 %sub8, i32* %diff, align 4
  %16 = load i32, i32* %step, align 4
  %17 = load i32, i32* %vpdiff, align 4
  %add = add nsw i32 %17, %16
  store i32 %add, i32* %vpdiff, align 4
  br label %if.end9

if.end9:                                          ; preds = %if.then7, %if.end
  %18 = load i32, i32* %step, align 4
  %shr10 = ashr i32 %18, 1
  store i32 %shr10, i32* %step, align 4
  %19 = load i32, i32* %diff, align 4
  %20 = load i32, i32* %step, align 4
  %cmp11 = icmp sge i32 %19, %20
  br i1 %cmp11, label %if.then13, label %if.end16

if.then13:                                        ; preds = %if.end9
  %21 = load i32, i32* %delta, align 4
  %or = or i32 %21, 2
  store i32 %or, i32* %delta, align 4
  %22 = load i32, i32* %step, align 4
  %23 = load i32, i32* %diff, align 4
  %sub14 = sub nsw i32 %23, %22
  store i32 %sub14, i32* %diff, align 4
  %24 = load i32, i32* %step, align 4
  %25 = load i32, i32* %vpdiff, align 4
  %add15 = add nsw i32 %25, %24
  store i32 %add15, i32* %vpdiff, align 4
  br label %if.end16

if.end16:                                         ; preds = %if.then13, %if.end9
  %26 = load i32, i32* %step, align 4
  %shr17 = ashr i32 %26, 1
  store i32 %shr17, i32* %step, align 4
  %27 = load i32, i32* %diff, align 4
  %28 = load i32, i32* %step, align 4
  %cmp18 = icmp sge i32 %27, %28
  br i1 %cmp18, label %if.then20, label %if.end23

if.then20:                                        ; preds = %if.end16
  %29 = load i32, i32* %delta, align 4
  %or21 = or i32 %29, 1
  store i32 %or21, i32* %delta, align 4
  %30 = load i32, i32* %step, align 4
  %31 = load i32, i32* %vpdiff, align 4
  %add22 = add nsw i32 %31, %30
  store i32 %add22, i32* %vpdiff, align 4
  br label %if.end23

if.end23:                                         ; preds = %if.then20, %if.end16
  %32 = load i32, i32* %sign, align 4
  %tobool24 = icmp ne i32 %32, 0
  br i1 %tobool24, label %if.then25, label %if.else

if.then25:                                        ; preds = %if.end23
  %33 = load i32, i32* %vpdiff, align 4
  %34 = load i32, i32* %valpred, align 4
  %sub26 = sub nsw i32 %34, %33
  store i32 %sub26, i32* %valpred, align 4
  br label %if.end28

if.else:                                          ; preds = %if.end23
  %35 = load i32, i32* %vpdiff, align 4
  %36 = load i32, i32* %valpred, align 4
  %add27 = add nsw i32 %36, %35
  store i32 %add27, i32* %valpred, align 4
  br label %if.end28

if.end28:                                         ; preds = %if.else, %if.then25
  %37 = load i32, i32* %valpred, align 4
  %cmp29 = icmp sgt i32 %37, 32767
  br i1 %cmp29, label %if.then31, label %if.else32

if.then31:                                        ; preds = %if.end28
  store i32 32767, i32* %valpred, align 4
  br label %if.end37

if.else32:                                        ; preds = %if.end28
  %38 = load i32, i32* %valpred, align 4
  %cmp33 = icmp slt i32 %38, -32768
  br i1 %cmp33, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.else32
  store i32 -32768, i32* %valpred, align 4
  br label %if.end36

if.end36:                                         ; preds = %if.then35, %if.else32
  br label %if.end37

if.end37:                                         ; preds = %if.end36, %if.then31
  %39 = load i32, i32* %sign, align 4
  %40 = load i32, i32* %delta, align 4
  %or38 = or i32 %40, %39
  store i32 %or38, i32* %delta, align 4
  %41 = load i32, i32* %delta, align 4
  %arrayidx39 = getelementptr inbounds [16 x i32], [16 x i32]* @indexTable, i32 0, i32 %41
  %42 = load i32, i32* %arrayidx39, align 4
  %43 = load i32, i32* %index, align 4
  %add40 = add nsw i32 %43, %42
  store i32 %add40, i32* %index, align 4
  %44 = load i32, i32* %index, align 4
  %cmp41 = icmp slt i32 %44, 0
  br i1 %cmp41, label %if.then43, label %if.end44

if.then43:                                        ; preds = %if.end37
  store i32 0, i32* %index, align 4
  br label %if.end44

if.end44:                                         ; preds = %if.then43, %if.end37
  %45 = load i32, i32* %index, align 4
  %cmp45 = icmp sgt i32 %45, 88
  br i1 %cmp45, label %if.then47, label %if.end48

if.then47:                                        ; preds = %if.end44
  store i32 88, i32* %index, align 4
  br label %if.end48

if.end48:                                         ; preds = %if.then47, %if.end44
  %46 = load i32, i32* %index, align 4
  %arrayidx49 = getelementptr inbounds [89 x i32], [89 x i32]* @stepsizeTable, i32 0, i32 %46
  %47 = load i32, i32* %arrayidx49, align 4
  store i32 %47, i32* %step, align 4
  %48 = load i32, i32* %bufferstep, align 4
  %tobool50 = icmp ne i32 %48, 0
  br i1 %tobool50, label %if.then51, label %if.else52

if.then51:                                        ; preds = %if.end48
  %49 = load i32, i32* %delta, align 4
  %shl = shl i32 %49, 4
  %and = and i32 %shl, 240
  store i32 %and, i32* %outputbuffer, align 4
  br label %if.end57

if.else52:                                        ; preds = %if.end48
  %50 = load i32, i32* %delta, align 4
  %and53 = and i32 %50, 15
  %51 = load i32, i32* %outputbuffer, align 4
  %or54 = or i32 %and53, %51
  %conv55 = trunc i32 %or54 to i8
  %52 = load i32, i32* %i, align 4
  %53 = load i8*, i8** %outdata.addr, align 4
  %arrayidx56 = getelementptr inbounds i8, i8* %53, i32 %52
  store i8 %conv55, i8* %arrayidx56, align 1
  %54 = load i32, i32* %i, align 4
  %inc = add nsw i32 %54, 1
  store i32 %inc, i32* %i, align 4
  br label %if.end57

if.end57:                                         ; preds = %if.else52, %if.then51
  %55 = load i32, i32* %bufferstep, align 4
  %tobool58 = icmp ne i32 %55, 0
  %lnot = xor i1 %tobool58, true
  %lnot.ext = zext i1 %lnot to i32
  store i32 %lnot.ext, i32* %bufferstep, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end57
  %56 = load i32, i32* %len, align 4
  %inc59 = add nsw i32 %56, 1
  store i32 %inc59, i32* %len, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %57 = load i32, i32* %bufferstep, align 4
  %tobool60 = icmp ne i32 %57, 0
  br i1 %tobool60, label %if.end64, label %if.then61

if.then61:                                        ; preds = %for.end
  %58 = load i32, i32* %outputbuffer, align 4
  %conv62 = trunc i32 %58 to i8
  %59 = load i32, i32* %i, align 4
  %60 = load i8*, i8** %outdata.addr, align 4
  %arrayidx63 = getelementptr inbounds i8, i8* %60, i32 %59
  store i8 %conv62, i8* %arrayidx63, align 1
  br label %if.end64

if.end64:                                         ; preds = %if.then61, %for.end
  ret void
}

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %outdata = alloca [513 x i8], align 1
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  %arraydecay = getelementptr inbounds [513 x i8], [513 x i8]* %outdata, i32 0, i32 0
  call void @adpcm_coder(i16* getelementptr inbounds ([1024 x i16], [1024 x i16]* @indata, i32 0, i32 0), i8* %arraydecay)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %cmp = icmp slt i32 %0, 513
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, i32* %i, align 4
  %arrayidx = getelementptr inbounds [513 x i8], [513 x i8]* %outdata, i32 0, i32 %1
  %2 = load i8, i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32 %conv)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32, i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="pentium4" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk)"}
