; ModuleID = 'fir_nodiv.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@fir_int = global [36 x i32] [i32 -2, i32 1, i32 4, i32 3, i32 -2, i32 -4, i32 2, i32 7, i32 0, i32 -9, i32 -4, i32 12, i32 11, i32 -14, i32 -26, i32 15, i32 89, i32 127, i32 89, i32 15, i32 -26, i32 -14, i32 11, i32 12, i32 -4, i32 -9, i32 0, i32 7, i32 2, i32 -4, i32 -2, i32 3, i32 4, i32 1, i32 -2, i32 0], align 16
@in_data = global [701 x i32] [i32 0, i32 0, i32 0, i32 0, i32 127, i32 121, i32 114, i32 121, i32 13, i32 13, i32 0, i32 3, i32 5, i32 2, i32 3, i32 127, i32 127, i32 2, i32 126, i32 0, i32 1, i32 126, i32 1, i32 1, i32 127, i32 0, i32 127, i32 0, i32 2, i32 1, i32 1, i32 3, i32 1, i32 127, i32 1, i32 0, i32 1, i32 1, i32 125, i32 123, i32 115, i32 106, i32 119, i32 16, i32 14, i32 1, i32 5, i32 5, i32 5, i32 5, i32 125, i32 0, i32 2, i32 125, i32 0, i32 0, i32 126, i32 1, i32 126, i32 127, i32 3, i32 124, i32 126, i32 6, i32 0, i32 126, i32 3, i32 2, i32 127, i32 126, i32 127, i32 2, i32 1, i32 127, i32 1, i32 1, i32 0, i32 3, i32 0, i32 127, i32 2, i32 0, i32 127, i32 3, i32 1, i32 0, i32 0, i32 125, i32 0, i32 3, i32 0, i32 126, i32 127, i32 2, i32 1, i32 126, i32 0, i32 3, i32 127, i32 125, i32 1, i32 1, i32 1, i32 127, i32 0, i32 5, i32 0, i32 127, i32 2, i32 126, i32 127, i32 2, i32 1, i32 0, i32 126, i32 0, i32 5, i32 0, i32 127, i32 0, i32 126, i32 1, i32 0, i32 125, i32 1, i32 3, i32 127, i32 0, i32 0, i32 126, i32 2, i32 3, i32 126, i32 125, i32 114, i32 104, i32 113, i32 5, i32 12, i32 7, i32 2, i32 6, i32 13, i32 5, i32 125, i32 3, i32 2, i32 127, i32 0, i32 121, i32 122, i32 3, i32 126, i32 125, i32 0, i32 125, i32 2, i32 1, i32 125, i32 8, i32 3, i32 124, i32 6, i32 0, i32 122, i32 6, i32 2, i32 124, i32 3, i32 126, i32 121, i32 6, i32 5, i32 116, i32 127, i32 13, i32 122, i32 120, i32 6, i32 5, i32 1, i32 0, i32 125, i32 1, i32 4, i32 124, i32 127, i32 3, i32 127, i32 5, i32 3, i32 122, i32 6, i32 10, i32 118, i32 124, i32 10, i32 124, i32 127, i32 6, i32 121, i32 3, i32 12, i32 117, i32 120, i32 10, i32 0, i32 121, i32 3, i32 126, i32 124, i32 6, i32 0, i32 121, i32 2, i32 126, i32 127, i32 6, i32 118, i32 127, i32 13, i32 121, i32 127, i32 6, i32 121, i32 6, i32 3, i32 113, i32 6, i32 10, i32 115, i32 127, i32 10, i32 0, i32 127, i32 122, i32 124, i32 10, i32 0, i32 117, i32 127, i32 12, i32 10, i32 124, i32 121, i32 9, i32 13, i32 125, i32 122, i32 5, i32 11, i32 10, i32 121, i32 124, i32 22, i32 3, i32 114, i32 13, i32 7, i32 121, i32 12, i32 7, i32 122, i32 11, i32 7, i32 122, i32 10, i32 7, i32 121, i32 10, i32 5, i32 117, i32 6, i32 5, i32 121, i32 5, i32 6, i32 1, i32 6, i32 0, i32 122, i32 2, i32 7, i32 3, i32 125, i32 1, i32 10, i32 7, i32 2, i32 127, i32 127, i32 9, i32 7, i32 121, i32 121, i32 6, i32 8, i32 125, i32 122, i32 6, i32 12, i32 6, i32 125, i32 127, i32 13, i32 7, i32 121, i32 1, i32 6, i32 127, i32 127, i32 2, i32 3, i32 1, i32 126, i32 1, i32 1, i32 125, i32 1, i32 0, i32 125, i32 6, i32 3, i32 125, i32 5, i32 7, i32 127, i32 124, i32 1, i32 6, i32 6, i32 124, i32 122, i32 7, i32 10, i32 0, i32 120, i32 1, i32 8, i32 0, i32 121, i32 122, i32 4, i32 10, i32 0, i32 120, i32 1, i32 6, i32 122, i32 117, i32 122, i32 0, i32 0, i32 121, i32 118, i32 127, i32 7, i32 0, i32 122, i32 125, i32 2, i32 4, i32 124, i32 122, i32 2, i32 5, i32 124, i32 122, i32 125, i32 127, i32 0, i32 120, i32 117, i32 127, i32 0, i32 121, i32 120, i32 121, i32 1, i32 3, i32 121, i32 121, i32 0, i32 0, i32 127, i32 127, i32 121, i32 127, i32 2, i32 122, i32 124, i32 125, i32 124, i32 127, i32 125, i32 121, i32 125, i32 0, i32 121, i32 122, i32 124, i32 125, i32 0, i32 125, i32 125, i32 0, i32 0, i32 0, i32 0, i32 125, i32 125, i32 0, i32 125, i32 126, i32 0, i32 126, i32 3, i32 3, i32 125, i32 1, i32 5, i32 0, i32 126, i32 125, i32 127, i32 3, i32 125, i32 121, i32 1, i32 2, i32 125, i32 127, i32 1, i32 0, i32 0, i32 127, i32 127, i32 126, i32 127, i32 0, i32 127, i32 0, i32 124, i32 125, i32 0, i32 121, i32 120, i32 124, i32 124, i32 123, i32 123, i32 125, i32 127, i32 0, i32 0, i32 127, i32 0, i32 1, i32 2, i32 0, i32 127, i32 0, i32 0, i32 0, i32 127, i32 126, i32 0, i32 0, i32 127, i32 0, i32 2, i32 1, i32 2, i32 6, i32 5, i32 3, i32 6, i32 8, i32 5, i32 2, i32 1, i32 1, i32 3, i32 0, i32 125, i32 127, i32 0, i32 127, i32 126, i32 0, i32 2, i32 3, i32 2, i32 1, i32 2, i32 3, i32 1, i32 124, i32 125, i32 0, i32 0, i32 126, i32 124, i32 127, i32 1, i32 0, i32 126, i32 124, i32 127, i32 1, i32 0, i32 126, i32 127, i32 2, i32 3, i32 1, i32 0, i32 4, i32 6, i32 5, i32 6, i32 7, i32 10, i32 10, i32 4, i32 2, i32 5, i32 8, i32 9, i32 8, i32 7, i32 12, i32 20, i32 20, i32 16, i32 14, i32 20, i32 21, i32 15, i32 9, i32 7, i32 4, i32 126, i32 118, i32 100, i32 65, i32 72, i32 125, i32 108, i32 61, i32 103, i32 16, i32 6, i32 125, i32 117, i32 7, i32 29, i32 0, i32 108, i32 2, i32 125, i32 120, i32 119, i32 111, i32 119, i32 1, i32 0, i32 2, i32 7, i32 10, i32 28, i32 28, i32 23, i32 35, i32 47, i32 65, i32 67, i32 79, i32 85, i32 88, i32 126, i32 2, i32 76, i32 16, i32 105, i32 44, i32 13, i32 116, i32 42, i32 116, i32 99, i32 41, i32 124, i32 94, i32 33, i32 53, i32 70, i32 36, i32 103, i32 53, i32 60, i32 60, i32 38, i32 38, i32 47, i32 71, i32 100, i32 4, i32 19, i32 24, i32 39, i32 43, i32 48, i32 27, i32 127, i32 120, i32 114, i32 104, i32 92, i32 90, i32 104, i32 124, i32 3, i32 13, i32 38, i32 65, i32 81, i32 90, i32 106, i32 108, i32 84, i32 120, i32 9, i32 69, i32 121, i32 31, i32 11, i32 46, i32 96, i32 11, i32 102, i32 127, i32 104, i32 119, i32 78, i32 70, i32 74, i32 59, i32 18, i32 91, i32 55, i32 49, i32 33, i32 11, i32 18, i32 46, i32 87, i32 126, i32 25, i32 34, i32 43, i32 63, i32 58, i32 37, i32 11, i32 121, i32 113, i32 104, i32 97, i32 92, i32 102, i32 114, i32 6, i32 22, i32 41, i32 65, i32 94, i32 109, i32 102, i32 96, i32 110, i32 23, i32 72, i32 54, i32 18, i32 23, i32 47, i32 99, i32 120, i32 92, i32 119, i32 108, i32 117, i32 65, i32 73, i32 79, i32 59, i32 11, i32 84, i32 55, i32 0], align 16
@out_data = global [720 x i32] [i32 1227, i32 -1518, i32 -829, i32 8783, i32 25541, i32 39405, i32 39016, i32 24938, i32 9667, i32 2318, i32 2538, i32 1693, i32 -1711, i32 1, i32 11796, i32 26480, i32 30982, i32 23027, i32 12747, i32 9941, i32 13225, i32 14042, i32 11668, i32 11409, i32 16061, i32 20757, i32 19308, i32 11547, i32 2610, i32 -3214, i32 -2950, i32 4155, i32 13660, i32 17179, i32 10997, i32 151, i32 -2277, i32 8702, i32 25874, i32 37800, i32 39028, i32 31956, i32 22789, i32 13730, i32 5642, i32 -123, i32 -1262, i32 1618, i32 6301, i32 10541, i32 13233, i32 14425, i32 13801, i32 12078, i32 11289, i32 12512, i32 15931, i32 21040, i32 25610, i32 27472, i32 26084, i32 22871, i32 20495, i32 19004, i32 14681, i32 8035, i32 6896, i32 16126, i32 30396, i32 35413, i32 25693, i32 13726, i32 10551, i32 14147, i32 12482, i32 2735, i32 -2833, i32 2457, i32 10793, i32 14331, i32 13954, i32 14893, i32 14724, i32 9070, i32 1471, i32 2334, i32 10532, i32 14957, i32 9824, i32 4402, i32 8973, i32 21640, i32 28027, i32 21796, i32 9886, i32 4400, i32 9984, i32 21291, i32 27185, i32 22248, i32 10965, i32 3601, i32 7235, i32 14742, i32 14838, i32 6531, i32 1755, i32 12133, i32 29035, i32 34107, i32 22260, i32 6589, i32 3043, i32 11311, i32 16056, i32 10434, i32 3508, i32 6484, i32 17469, i32 23689, i32 18779, i32 10381, i32 8754, i32 13365, i32 15767, i32 13267, i32 10730, i32 12017, i32 14547, i32 12910, i32 9817, i32 12614, i32 23264, i32 35564, i32 40507, i32 33344, i32 20684, i32 9979, i32 4709, i32 2355, i32 -78, i32 192, i32 5898, i32 13209, i32 15894, i32 12715, i32 10261, i32 14689, i32 22728, i32 26664, i32 24769, i32 22992, i32 24658, i32 26559, i32 23361, i32 15332, i32 9434, i32 10243, i32 14670, i32 16407, i32 13822, i32 11087, i32 12395, i32 15424, i32 14798, i32 10521, i32 9162, i32 15820, i32 25292, i32 27792, i32 21948, i32 14507, i32 13279, i32 18681, i32 25264, i32 29823, i32 29727, i32 22158, i32 9738, i32 1466, i32 2627, i32 9527, i32 13996, i32 13061, i32 14943, i32 22592, i32 27983, i32 24927, i32 16603, i32 11282, i32 11119, i32 12612, i32 13646, i32 16346, i32 21605, i32 25088, i32 25569, i32 26727, i32 27460, i32 23236, i32 14396, i32 8821, i32 14370, i32 25431, i32 27009, i32 16092, i32 6587, i32 10538, i32 24756, i32 32583, i32 25008, i32 11892, i32 7259, i32 14128, i32 23417, i32 27795, i32 26626, i32 23669, i32 22976, i32 24481, i32 27205, i32 28252, i32 25116, i32 20056, i32 16927, i32 15415, i32 11281, i32 7052, i32 10268, i32 20781, i32 26999, i32 21042, i32 11446, i32 14148, i32 28188, i32 34805, i32 26026, i32 14344, i32 13382, i32 20213, i32 22812, i32 19053, i32 18073, i32 21052, i32 20916, i32 17055, i32 17870, i32 24090, i32 24529, i32 13959, i32 4132, i32 9316, i32 24637, i32 30367, i32 20581, i32 9069, i32 8355, i32 14729, i32 17659, i32 14365, i32 11794, i32 13151, i32 15115, i32 14540, i32 13540, i32 13504, i32 13823, i32 13264, i32 13858, i32 14723, i32 13934, i32 11230, i32 10376, i32 14044, i32 17853, i32 12937, i32 1183, i32 -4601, i32 3241, i32 15225, i32 16574, i32 7269, i32 3320, i32 11859, i32 19365, i32 11754, i32 -1276, i32 -361, i32 15963, i32 28074, i32 23996, i32 14623, i32 15406, i32 21941, i32 22061, i32 15938, i32 15753, i32 22626, i32 24951, i32 14998, i32 4464, i32 8151, i32 22790, i32 30484, i32 23628, i32 10194, i32 4202, i32 10699, i32 21867, i32 27089, i32 22466, i32 12454, i32 5674, i32 6749, i32 12099, i32 15543, i32 14951, i32 12324, i32 10956, i32 11219, i32 13961, i32 16392, i32 14440, i32 8757, i32 8771, i32 19330, i32 29936, i32 25396, i32 7944, i32 -274, i32 12388, i32 28600, i32 27419, i32 11543, i32 3296, i32 10048, i32 15265, i32 9114, i32 3436, i32 11684, i32 25375, i32 26087, i32 13522, i32 5010, i32 8018, i32 11721, i32 10421, i32 14312, i32 27658, i32 35671, i32 25038, i32 8146, i32 8809, i32 26919, i32 37073, i32 26550, i32 12126, i32 12951, i32 22636, i32 23438, i32 15602, i32 14845, i32 22430, i32 24123, i32 14574, i32 10566, i32 23113, i32 38574, i32 38464, i32 26143, i32 20467, i32 26943, i32 30887, i32 26320, i32 23081, i32 28533, i32 32598, i32 24441, i32 12517, i32 13016, i32 23204, i32 24975, i32 14204, i32 9116, i32 22334, i32 40620, i32 41451, i32 26388, i32 16906, i32 24514, i32 36961, i32 39497, i32 34763, i32 35344, i32 39667, i32 36011, i32 23970, i32 18216, i32 26289, i32 37788, i32 36760, i32 25822, i32 21448, i32 26490, i32 27327, i32 13597, i32 -3277, i32 -3529, i32 13117, i32 27483, i32 28084, i32 23361, i32 24270, i32 27262, i32 23258, i32 14193, i32 11392, i32 15148, i32 14750, i32 7142, i32 2931, i32 11566, i32 26453, i32 33418, i32 31447, i32 27287, i32 23799, i32 18740, i32 13385, i32 15185, i32 24263, i32 26709, i32 14495, i32 178, i32 3259, i32 24952, i32 44758, i32 43249, i32 25839, i32 13588, i32 16428, i32 25113, i32 27118, i32 21708, i32 20433, i32 27154, i32 34714, i32 35833, i32 34206, i32 36790, i32 40721, i32 36051, i32 22845, i32 12734, i32 12788, i32 14925, i32 9074, i32 347, i32 2094, i32 11917, i32 16107, i32 8834, i32 2998, i32 10776, i32 24096, i32 27013, i32 17809, i32 9356, i32 9805, i32 12033, i32 7288, i32 -1089, i32 -3040, i32 2117, i32 5555, i32 2932, i32 -621, i32 656, i32 4651, i32 3938, i32 -1519, i32 -3891, i32 2978, i32 14631, i32 22453, i32 24975, i32 26748, i32 28397, i32 24063, i32 11467, i32 45, i32 -1062, i32 3906, i32 2594, i32 -4507, i32 -1779, i32 15857, i32 30538, i32 24660, i32 8367, i32 8222, i32 27751, i32 40816, i32 28195, i32 6471, i32 6206, i32 27348, i32 40208, i32 27999, i32 8576, i32 7917, i32 23767, i32 31026, i32 17733, i32 -1284, i32 -6743, i32 729, i32 6406, i32 3866, i32 -394, i32 206, i32 4127, i32 5367, i32 2973, i32 787, i32 640, i32 2422, i32 3717, i32 3503, i32 2481, i32 2204, i32 4014, i32 6828, i32 7054, i32 4890, i32 3784, i32 5946, i32 8278, i32 5906, i32 205, i32 252, i32 11193, i32 27560, i32 35448, i32 30110, i32 20954, i32 20933, i32 30180, i32 35912, i32 27880, i32 13376, i32 7577, i32 15989, i32 26728, i32 26155, i32 14534, i32 4745, i32 5800, i32 14489, i32 22150, i32 27233, i32 32502, i32 37753, i32 36486, i32 25501, i32 9603, i32 -798, i32 -2070, i32 3073, i32 7389, i32 7666, i32 6666, i32 7579, i32 11419, i32 16090, i32 17840, i32 19354, i32 23056, i32 28268, i32 29136, i32 23049, i32 15081, i32 12896, i32 15773, i32 17952, i32 16364, i32 15138, i32 18561, i32 24306, i32 26903, i32 26392, i32 25642, i32 25920, i32 23942, i32 18844, i32 14618, i32 14856, i32 18273, i32 21485, i32 21721, i32 19489, i32 14820, i32 11073, i32 11892, i32 17797, i32 23063, i32 19921, i32 10524, i32 4443, i32 6566, i32 12039, i32 13108, i32 11699, i32 16570, i32 28604, i32 37982, i32 36090, i32 27502, i32 24855, i32 30360, i32 33323, i32 24838, i32 10695, i32 3755, i32 8938, i32 18605, i32 24876, i32 27864, i32 30476, i32 31661, i32 28536, i32 22613, i32 19175, i32 19929, i32 20523, i32 17285, i32 12267, i32 10251, i32 13365, i32 19985, i32 26798, i32 32407, i32 34223, i32 31619, i32 26389, i32 21487, i32 18310, i32 16060, i32 14811, i32 16735, i32 19445, i32 17738, i32 9432, i32 1769, i32 4865, i32 18434, i32 29027, i32 26171, i32 15228, i32 9709, i32 13645, i32 18115, i32 15076, i32 10151, i32 14044, i32 25798, i32 33841, i32 32501, i32 27861, i32 28078, i32 29841, i32 24765, i32 13339, i32 5488, i32 8708, i32 19581, i32 29093, i32 32596, i32 31073, i32 27591, i32 24141, i32 20738, i32 16760, i32 12115, i32 8295, i32 8918, i32 15619, i32 25078, i32 31951, i32 33622, i32 32066, i32 30514, i32 29401, i32 26709, i32 21812, i32 16978, i32 14974, i32 15802, i32 16352, i32 12859, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], align 16
@output = global [720 x i32] [i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1], align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  br label %for.body.i.preheader

for.body.i.preheader:                             ; preds = %fir_filter_int.exit, %entry
  %i.017 = phi i32 [ 0, %entry ], [ %inc, %fir_filter_int.exit ]
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i.preheader, %for.end.i
  %out.addr.049.i = phi i32* [ %incdec.ptr13.i, %for.end.i ], [ getelementptr inbounds ([720 x i32], [720 x i32]* @output, i64 0, i64 0), %for.body.i.preheader ]
  %coef_start.048.i = phi i32* [ %coef_start.1.i, %for.end.i ], [ getelementptr inbounds ([36 x i32], [36 x i32]* @fir_int, i64 0, i64 0), %for.body.i.preheader ]
  %in_ptr.047.i = phi i32* [ %in_ptr.1.i, %for.end.i ], [ getelementptr inbounds ([701 x i32], [701 x i32]* @in_data, i64 0, i64 17), %for.body.i.preheader ]
  %acc_length.046.i = phi i32 [ %acc_length.2.i, %for.end.i ], [ 18, %for.body.i.preheader ]
  %i.045.i = phi i32 [ %inc22.i, %for.end.i ], [ 0, %for.body.i.preheader ]
  %incdec.ptr.i = getelementptr inbounds i32, i32* %coef_start.048.i, i64 1
  %0 = load i32, i32* %coef_start.048.i, align 4, !tbaa !1
  %1 = load i32, i32* %in_ptr.047.i, align 4, !tbaa !1
  %mul.i = mul nsw i32 %1, %0
  %cmp739.i = icmp sgt i32 %acc_length.046.i, 1
  br i1 %cmp739.i, label %overflow.checked, label %for.end.i

overflow.checked:                                 ; preds = %for.body.i
  %2 = add i32 %acc_length.046.i, -2
  %3 = zext i32 %2 to i64
  %4 = add nuw nsw i64 %3, 1
  %end.idx = add nuw nsw i64 %3, 2
  %n.vec = and i64 %4, 8589934584
  %end.idx.rnd.down69 = or i64 %n.vec, 1
  %cmp.zero = icmp eq i64 %end.idx.rnd.down69, 1
  %5 = sub nsw i64 0, %n.vec
  %ptr.ind.end = getelementptr i32, i32* %in_ptr.047.i, i64 %5
  %incdec.ptr.i.sum70 = or i64 %n.vec, 1
  %ptr.ind.end23 = getelementptr i32, i32* %coef_start.048.i, i64 %incdec.ptr.i.sum70
  %6 = trunc i64 %end.idx.rnd.down69 to i32
  %7 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %mul.i, i32 0
  br i1 %cmp.zero, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %overflow.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 1, %vector.body.preheader ]
  %vec.phi = phi <4 x i32> [ %18, %vector.body ], [ %7, %vector.body.preheader ]
  %vec.phi57 = phi <4 x i32> [ %19, %vector.body ], [ zeroinitializer, %vector.body.preheader ]
  %8 = sub i64 1, %index
  %next.gep41 = getelementptr i32, i32* %coef_start.048.i, i64 %index
  %9 = bitcast i32* %next.gep41 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %9, align 4, !tbaa !1
  %next.gep41.sum = add i64 %index, 4
  %10 = getelementptr i32, i32* %coef_start.048.i, i64 %next.gep41.sum
  %11 = bitcast i32* %10 to <4 x i32>*
  %wide.load59 = load <4 x i32>, <4 x i32>* %11, align 4, !tbaa !1
  %.sum = add i64 %8, -4
  %12 = getelementptr i32, i32* %in_ptr.047.i, i64 %.sum
  %13 = bitcast i32* %12 to <4 x i32>*
  %wide.load60 = load <4 x i32>, <4 x i32>* %13, align 4, !tbaa !1
  %reverse = shufflevector <4 x i32> %wide.load60, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %.sum78 = add i64 %8, -8
  %14 = getelementptr i32, i32* %in_ptr.047.i, i64 %.sum78
  %15 = bitcast i32* %14 to <4 x i32>*
  %wide.load61 = load <4 x i32>, <4 x i32>* %15, align 4, !tbaa !1
  %reverse62 = shufflevector <4 x i32> %wide.load61, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %16 = mul nsw <4 x i32> %reverse, %wide.load
  %17 = mul nsw <4 x i32> %reverse62, %wide.load59
  %18 = add nsw <4 x i32> %16, %vec.phi
  %19 = add nsw <4 x i32> %17, %vec.phi57
  %index.next = add i64 %index, 8
  %20 = icmp eq i64 %index.next, %end.idx.rnd.down69
  br i1 %20, label %middle.block.loopexit, label %vector.body, !llvm.loop !5

middle.block.loopexit:                            ; preds = %vector.body
  %.lcssa81 = phi <4 x i32> [ %19, %vector.body ]
  %.lcssa = phi <4 x i32> [ %18, %vector.body ]
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %overflow.checked
  %resume.val = phi i32* [ %in_ptr.047.i, %overflow.checked ], [ %ptr.ind.end, %middle.block.loopexit ]
  %resume.val21 = phi i32* [ %incdec.ptr.i, %overflow.checked ], [ %ptr.ind.end23, %middle.block.loopexit ]
  %resume.val24 = phi i64 [ 1, %overflow.checked ], [ %end.idx.rnd.down69, %middle.block.loopexit ]
  %trunc.resume.val = phi i32 [ 1, %overflow.checked ], [ %6, %middle.block.loopexit ]
  %rdx.vec.exit.phi = phi <4 x i32> [ %7, %overflow.checked ], [ %.lcssa, %middle.block.loopexit ]
  %rdx.vec.exit.phi65 = phi <4 x i32> [ zeroinitializer, %overflow.checked ], [ %.lcssa81, %middle.block.loopexit ]
  %bin.rdx = add <4 x i32> %rdx.vec.exit.phi65, %rdx.vec.exit.phi
  %rdx.shuf = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx66 = add <4 x i32> %bin.rdx, %rdx.shuf
  %rdx.shuf67 = shufflevector <4 x i32> %bin.rdx66, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx68 = add <4 x i32> %bin.rdx66, %rdx.shuf67
  %21 = extractelement <4 x i32> %bin.rdx68, i32 0
  %cmp.n = icmp eq i64 %end.idx, %resume.val24
  br i1 %cmp.n, label %for.end.i, label %for.body8.i.preheader

for.body8.i.preheader:                            ; preds = %middle.block
  br label %for.body8.i

for.body8.i:                                      ; preds = %for.body8.i.preheader, %for.body8.i
  %in_ptr.047.pn.i = phi i32* [ %data_ptr.043.i, %for.body8.i ], [ %resume.val, %for.body8.i.preheader ]
  %coef_ptr.042.i = phi i32* [ %incdec.ptr9.i, %for.body8.i ], [ %resume.val21, %for.body8.i.preheader ]
  %acc.041.i = phi i32 [ %add12.i, %for.body8.i ], [ %21, %for.body8.i.preheader ]
  %j.040.i = phi i32 [ %inc.i, %for.body8.i ], [ %trunc.resume.val, %for.body8.i.preheader ]
  %data_ptr.043.i = getelementptr inbounds i32, i32* %in_ptr.047.pn.i, i64 -1
  %incdec.ptr9.i = getelementptr inbounds i32, i32* %coef_ptr.042.i, i64 1
  %22 = load i32, i32* %coef_ptr.042.i, align 4, !tbaa !1
  %23 = load i32, i32* %data_ptr.043.i, align 4, !tbaa !1
  %mul11.i = mul nsw i32 %23, %22
  %add12.i = add nsw i32 %mul11.i, %acc.041.i
  %inc.i = add nuw nsw i32 %j.040.i, 1
  %exitcond.i = icmp eq i32 %inc.i, %acc_length.046.i
  br i1 %exitcond.i, label %for.end.i.loopexit, label %for.body8.i, !llvm.loop !8

for.end.i.loopexit:                               ; preds = %for.body8.i
  %add12.i.lcssa = phi i32 [ %add12.i, %for.body8.i ]
  br label %for.end.i

for.end.i:                                        ; preds = %for.end.i.loopexit, %middle.block, %for.body.i
  %acc.0.lcssa.i = phi i32 [ %mul.i, %for.body.i ], [ %21, %middle.block ], [ %add12.i.lcssa, %for.end.i.loopexit ]
  %incdec.ptr13.i = getelementptr inbounds i32, i32* %out.addr.049.i, i64 1
  store i32 %acc.0.lcssa.i, i32* %out.addr.049.i, align 4, !tbaa !1
  %cmp14.i = icmp eq i32* %in_ptr.047.i, getelementptr inbounds ([701 x i32], [701 x i32]* @in_data, i64 0, i64 699)
  %cmp16.i = icmp slt i32 %acc_length.046.i, 35
  %inc18.i = zext i1 %cmp16.i to i32
  %incdec.ptr19.i = getelementptr inbounds i32, i32* %in_ptr.047.i, i64 1
  %acc_length.2.v.i = select i1 %cmp14.i, i32 -1, i32 %inc18.i
  %acc_length.2.i = add i32 %acc_length.2.v.i, %acc_length.046.i
  %in_ptr.1.i = select i1 %cmp14.i, i32* getelementptr inbounds ([701 x i32], [701 x i32]* @in_data, i64 0, i64 699), i32* %incdec.ptr19.i
  %coef_start.1.i = select i1 %cmp14.i, i32* %incdec.ptr.i, i32* %coef_start.048.i
  %inc22.i = add nuw nsw i32 %i.045.i, 1
  %exitcond50.i = icmp eq i32 %inc22.i, 700
  br i1 %exitcond50.i, label %fir_filter_int.exit, label %for.body.i

fir_filter_int.exit:                              ; preds = %for.end.i
  %inc = add nuw nsw i32 %i.017, 1
  %exitcond = icmp eq i32 %inc, 200
  br i1 %exitcond, label %for.body3.preheader, label %for.body.i.preheader

for.body3.preheader:                              ; preds = %fir_filter_int.exit
  br label %for.body3

for.body3:                                        ; preds = %for.inc7.1, %for.body3.preheader
  %indvars.iv = phi i64 [ 0, %for.body3.preheader ], [ %indvars.iv.next.1, %for.inc7.1 ]
  %arrayidx = getelementptr inbounds [720 x i32], [720 x i32]* @output, i64 0, i64 %indvars.iv
  %24 = load i32, i32* %arrayidx, align 4, !tbaa !1
  %arrayidx5 = getelementptr inbounds [720 x i32], [720 x i32]* @out_data, i64 0, i64 %indvars.iv
  %25 = load i32, i32* %arrayidx5, align 4, !tbaa !1
  %cmp6 = icmp eq i32 %24, %25
  br i1 %cmp6, label %for.inc7, label %if.then

if.then:                                          ; preds = %for.inc7, %for.body3
  %indvars.iv.lcssa = phi i64 [ %indvars.iv, %for.body3 ], [ %indvars.iv.next, %for.inc7 ]
  %26 = trunc i64 %indvars.iv.lcssa to i32
  %add = add nsw i32 %26, 100
  br label %return

for.inc7:                                         ; preds = %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx.1 = getelementptr inbounds [720 x i32], [720 x i32]* @output, i64 0, i64 %indvars.iv.next
  %27 = load i32, i32* %arrayidx.1, align 4, !tbaa !1
  %arrayidx5.1 = getelementptr inbounds [720 x i32], [720 x i32]* @out_data, i64 0, i64 %indvars.iv.next
  %28 = load i32, i32* %arrayidx5.1, align 4, !tbaa !1
  %cmp6.1 = icmp eq i32 %27, %28
  br i1 %cmp6.1, label %for.inc7.1, label %if.then

return.loopexit:                                  ; preds = %for.inc7.1
  br label %return

return:                                           ; preds = %return.loopexit, %if.then
  %retval.0 = phi i32 [ %add, %if.then ], [ -1, %return.loopexit ]
  ret i32 %retval.0

for.inc7.1:                                       ; preds = %for.inc7
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.next, 1
  %cmp2.1 = icmp slt i64 %indvars.iv.next.1, 700
  br i1 %cmp2.1, label %for.body3, label %return.loopexit
}

; Function Attrs: nounwind uwtable
define void @fir_filter_int(i32* readonly %in, i32* nocapture %out, i32 %in_len, i32* nocapture readonly %coef, i32 %coef_len, i32 %scale) #0 {
entry:
  %add = add nsw i32 %coef_len, 1
  %shr = ashr i32 %add, 1
  %idx.ext = sext i32 %in_len to i64
  %add.ptr.sum = add nsw i64 %idx.ext, -1
  %add.ptr1 = getelementptr inbounds i32, i32* %in, i64 %add.ptr.sum
  %cmp44 = icmp sgt i32 %in_len, 0
  br i1 %cmp44, label %for.body.lr.ph, label %for.end23

for.body.lr.ph:                                   ; preds = %entry
  %addconv = add nsw i32 %shr, -1
  %add.ptr3.sum = sext i32 %addconv to i64
  %add.ptr4 = getelementptr inbounds i32, i32* %in, i64 %add.ptr3.sum
  br label %for.body

for.body:                                         ; preds = %for.end, %for.body.lr.ph
  %out.addr.049 = phi i32* [ %out, %for.body.lr.ph ], [ %incdec.ptr13, %for.end ]
  %coef_start.048 = phi i32* [ %coef, %for.body.lr.ph ], [ %coef_start.1, %for.end ]
  %in_ptr.047 = phi i32* [ %add.ptr4, %for.body.lr.ph ], [ %in_ptr.1, %for.end ]
  %acc_length.046 = phi i32 [ %shr, %for.body.lr.ph ], [ %acc_length.2, %for.end ]
  %i.045 = phi i32 [ 0, %for.body.lr.ph ], [ %inc22, %for.end ]
  %incdec.ptr = getelementptr inbounds i32, i32* %coef_start.048, i64 1
  %0 = load i32, i32* %coef_start.048, align 4, !tbaa !1
  %1 = load i32, i32* %in_ptr.047, align 4, !tbaa !1
  %mul = mul nsw i32 %1, %0
  %cmp739 = icmp sgt i32 %acc_length.046, 1
  br i1 %cmp739, label %overflow.checked, label %for.end

overflow.checked:                                 ; preds = %for.body
  %2 = add i32 %acc_length.046, -2
  %3 = zext i32 %2 to i64
  %4 = add nuw nsw i64 %3, 1
  %end.idx = add nuw nsw i64 %3, 2
  %n.vec = and i64 %4, 8589934584
  %end.idx.rnd.down99 = or i64 %n.vec, 1
  %cmp.zero = icmp eq i64 %end.idx.rnd.down99, 1
  %5 = sub nsw i64 0, %n.vec
  %ptr.ind.end = getelementptr i32, i32* %in_ptr.047, i64 %5
  %incdec.ptr.sum100 = or i64 %n.vec, 1
  %ptr.ind.end53 = getelementptr i32, i32* %coef_start.048, i64 %incdec.ptr.sum100
  %6 = trunc i64 %end.idx.rnd.down99 to i32
  %7 = insertelement <4 x i32> <i32 undef, i32 0, i32 0, i32 0>, i32 %mul, i32 0
  br i1 %cmp.zero, label %middle.block, label %vector.body.preheader

vector.body.preheader:                            ; preds = %overflow.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 1, %vector.body.preheader ]
  %vec.phi = phi <4 x i32> [ %18, %vector.body ], [ %7, %vector.body.preheader ]
  %vec.phi87 = phi <4 x i32> [ %19, %vector.body ], [ zeroinitializer, %vector.body.preheader ]
  %8 = sub i64 1, %index
  %next.gep71 = getelementptr i32, i32* %coef_start.048, i64 %index
  %9 = bitcast i32* %next.gep71 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %9, align 4, !tbaa !1
  %next.gep71.sum = add i64 %index, 4
  %10 = getelementptr i32, i32* %coef_start.048, i64 %next.gep71.sum
  %11 = bitcast i32* %10 to <4 x i32>*
  %wide.load89 = load <4 x i32>, <4 x i32>* %11, align 4, !tbaa !1
  %.sum = add i64 %8, -4
  %12 = getelementptr i32, i32* %in_ptr.047, i64 %.sum
  %13 = bitcast i32* %12 to <4 x i32>*
  %wide.load90 = load <4 x i32>, <4 x i32>* %13, align 4, !tbaa !1
  %reverse = shufflevector <4 x i32> %wide.load90, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %.sum108 = add i64 %8, -8
  %14 = getelementptr i32, i32* %in_ptr.047, i64 %.sum108
  %15 = bitcast i32* %14 to <4 x i32>*
  %wide.load91 = load <4 x i32>, <4 x i32>* %15, align 4, !tbaa !1
  %reverse92 = shufflevector <4 x i32> %wide.load91, <4 x i32> undef, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %16 = mul nsw <4 x i32> %reverse, %wide.load
  %17 = mul nsw <4 x i32> %reverse92, %wide.load89
  %18 = add nsw <4 x i32> %16, %vec.phi
  %19 = add nsw <4 x i32> %17, %vec.phi87
  %index.next = add i64 %index, 8
  %20 = icmp eq i64 %index.next, %end.idx.rnd.down99
  br i1 %20, label %middle.block.loopexit, label %vector.body, !llvm.loop !10

middle.block.loopexit:                            ; preds = %vector.body
  %.lcssa110 = phi <4 x i32> [ %19, %vector.body ]
  %.lcssa = phi <4 x i32> [ %18, %vector.body ]
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %overflow.checked
  %resume.val = phi i32* [ %in_ptr.047, %overflow.checked ], [ %ptr.ind.end, %middle.block.loopexit ]
  %resume.val51 = phi i32* [ %incdec.ptr, %overflow.checked ], [ %ptr.ind.end53, %middle.block.loopexit ]
  %resume.val54 = phi i64 [ 1, %overflow.checked ], [ %end.idx.rnd.down99, %middle.block.loopexit ]
  %trunc.resume.val = phi i32 [ 1, %overflow.checked ], [ %6, %middle.block.loopexit ]
  %rdx.vec.exit.phi = phi <4 x i32> [ %7, %overflow.checked ], [ %.lcssa, %middle.block.loopexit ]
  %rdx.vec.exit.phi95 = phi <4 x i32> [ zeroinitializer, %overflow.checked ], [ %.lcssa110, %middle.block.loopexit ]
  %bin.rdx = add <4 x i32> %rdx.vec.exit.phi95, %rdx.vec.exit.phi
  %rdx.shuf = shufflevector <4 x i32> %bin.rdx, <4 x i32> undef, <4 x i32> <i32 2, i32 3, i32 undef, i32 undef>
  %bin.rdx96 = add <4 x i32> %bin.rdx, %rdx.shuf
  %rdx.shuf97 = shufflevector <4 x i32> %bin.rdx96, <4 x i32> undef, <4 x i32> <i32 1, i32 undef, i32 undef, i32 undef>
  %bin.rdx98 = add <4 x i32> %bin.rdx96, %rdx.shuf97
  %21 = extractelement <4 x i32> %bin.rdx98, i32 0
  %cmp.n = icmp eq i64 %end.idx, %resume.val54
  br i1 %cmp.n, label %for.end, label %for.body8.preheader

for.body8.preheader:                              ; preds = %middle.block
  br label %for.body8

for.body8:                                        ; preds = %for.body8.preheader, %for.body8
  %in_ptr.047.pn = phi i32* [ %data_ptr.043, %for.body8 ], [ %resume.val, %for.body8.preheader ]
  %coef_ptr.042 = phi i32* [ %incdec.ptr9, %for.body8 ], [ %resume.val51, %for.body8.preheader ]
  %acc.041 = phi i32 [ %add12, %for.body8 ], [ %21, %for.body8.preheader ]
  %j.040 = phi i32 [ %inc, %for.body8 ], [ %trunc.resume.val, %for.body8.preheader ]
  %data_ptr.043 = getelementptr inbounds i32, i32* %in_ptr.047.pn, i64 -1
  %incdec.ptr9 = getelementptr inbounds i32, i32* %coef_ptr.042, i64 1
  %22 = load i32, i32* %coef_ptr.042, align 4, !tbaa !1
  %23 = load i32, i32* %data_ptr.043, align 4, !tbaa !1
  %mul11 = mul nsw i32 %23, %22
  %add12 = add nsw i32 %mul11, %acc.041
  %inc = add nuw nsw i32 %j.040, 1
  %exitcond = icmp eq i32 %inc, %acc_length.046
  br i1 %exitcond, label %for.end.loopexit, label %for.body8, !llvm.loop !11

for.end.loopexit:                                 ; preds = %for.body8
  %add12.lcssa = phi i32 [ %add12, %for.body8 ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %middle.block, %for.body
  %acc.0.lcssa = phi i32 [ %mul, %for.body ], [ %21, %middle.block ], [ %add12.lcssa, %for.end.loopexit ]
  %incdec.ptr13 = getelementptr inbounds i32, i32* %out.addr.049, i64 1
  store i32 %acc.0.lcssa, i32* %out.addr.049, align 4, !tbaa !1
  %cmp14 = icmp eq i32* %in_ptr.047, %add.ptr1
  %cmp16 = icmp slt i32 %acc_length.046, %coef_len
  %inc18 = zext i1 %cmp16 to i32
  %incdec.ptr19 = getelementptr inbounds i32, i32* %in_ptr.047, i64 1
  %acc_length.2.v = select i1 %cmp14, i32 -1, i32 %inc18
  %acc_length.2 = add i32 %acc_length.046, %acc_length.2.v
  %in_ptr.1 = select i1 %cmp14, i32* %in_ptr.047, i32* %incdec.ptr19
  %coef_start.1 = select i1 %cmp14, i32* %incdec.ptr, i32* %coef_start.048
  %inc22 = add nuw nsw i32 %i.045, 1
  %exitcond50 = icmp eq i32 %inc22, %in_len
  br i1 %exitcond50, label %for.end23.loopexit, label %for.body

for.end23.loopexit:                               ; preds = %for.end
  br label %for.end23

for.end23:                                        ; preds = %for.end23.loopexit, %entry
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = distinct !{!5, !6, !7}
!6 = !{!"llvm.loop.vectorize.width", i32 1}
!7 = !{!"llvm.loop.interleave.count", i32 1}
!8 = distinct !{!8, !9, !6, !7}
!9 = !{!"llvm.loop.unroll.runtime.disable"}
!10 = distinct !{!10, !6, !7}
!11 = distinct !{!11, !9, !6, !7}
