; ModuleID = 'fir_print.c'
target datalayout = "E-m:e-p:32:32-i64:64-f128:64-n32-S64"
target triple = "sparc-unknown-linux-gnu"

@fir_int = global [36 x i32] [i32 -2, i32 1, i32 4, i32 3, i32 -2, i32 -4, i32 2, i32 7, i32 0, i32 -9, i32 -4, i32 12, i32 11, i32 -14, i32 -26, i32 15, i32 89, i32 127, i32 89, i32 15, i32 -26, i32 -14, i32 11, i32 12, i32 -4, i32 -9, i32 0, i32 7, i32 2, i32 -4, i32 -2, i32 3, i32 4, i32 1, i32 -2, i32 0], align 4
@in_data = global [701 x i32] [i32 0, i32 0, i32 0, i32 0, i32 127, i32 121, i32 114, i32 121, i32 13, i32 13, i32 0, i32 3, i32 5, i32 2, i32 3, i32 127, i32 127, i32 2, i32 126, i32 0, i32 1, i32 126, i32 1, i32 1, i32 127, i32 0, i32 127, i32 0, i32 2, i32 1, i32 1, i32 3, i32 1, i32 127, i32 1, i32 0, i32 1, i32 1, i32 125, i32 123, i32 115, i32 106, i32 119, i32 16, i32 14, i32 1, i32 5, i32 5, i32 5, i32 5, i32 125, i32 0, i32 2, i32 125, i32 0, i32 0, i32 126, i32 1, i32 126, i32 127, i32 3, i32 124, i32 126, i32 6, i32 0, i32 126, i32 3, i32 2, i32 127, i32 126, i32 127, i32 2, i32 1, i32 127, i32 1, i32 1, i32 0, i32 3, i32 0, i32 127, i32 2, i32 0, i32 127, i32 3, i32 1, i32 0, i32 0, i32 125, i32 0, i32 3, i32 0, i32 126, i32 127, i32 2, i32 1, i32 126, i32 0, i32 3, i32 127, i32 125, i32 1, i32 1, i32 1, i32 127, i32 0, i32 5, i32 0, i32 127, i32 2, i32 126, i32 127, i32 2, i32 1, i32 0, i32 126, i32 0, i32 5, i32 0, i32 127, i32 0, i32 126, i32 1, i32 0, i32 125, i32 1, i32 3, i32 127, i32 0, i32 0, i32 126, i32 2, i32 3, i32 126, i32 125, i32 114, i32 104, i32 113, i32 5, i32 12, i32 7, i32 2, i32 6, i32 13, i32 5, i32 125, i32 3, i32 2, i32 127, i32 0, i32 121, i32 122, i32 3, i32 126, i32 125, i32 0, i32 125, i32 2, i32 1, i32 125, i32 8, i32 3, i32 124, i32 6, i32 0, i32 122, i32 6, i32 2, i32 124, i32 3, i32 126, i32 121, i32 6, i32 5, i32 116, i32 127, i32 13, i32 122, i32 120, i32 6, i32 5, i32 1, i32 0, i32 125, i32 1, i32 4, i32 124, i32 127, i32 3, i32 127, i32 5, i32 3, i32 122, i32 6, i32 10, i32 118, i32 124, i32 10, i32 124, i32 127, i32 6, i32 121, i32 3, i32 12, i32 117, i32 120, i32 10, i32 0, i32 121, i32 3, i32 126, i32 124, i32 6, i32 0, i32 121, i32 2, i32 126, i32 127, i32 6, i32 118, i32 127, i32 13, i32 121, i32 127, i32 6, i32 121, i32 6, i32 3, i32 113, i32 6, i32 10, i32 115, i32 127, i32 10, i32 0, i32 127, i32 122, i32 124, i32 10, i32 0, i32 117, i32 127, i32 12, i32 10, i32 124, i32 121, i32 9, i32 13, i32 125, i32 122, i32 5, i32 11, i32 10, i32 121, i32 124, i32 22, i32 3, i32 114, i32 13, i32 7, i32 121, i32 12, i32 7, i32 122, i32 11, i32 7, i32 122, i32 10, i32 7, i32 121, i32 10, i32 5, i32 117, i32 6, i32 5, i32 121, i32 5, i32 6, i32 1, i32 6, i32 0, i32 122, i32 2, i32 7, i32 3, i32 125, i32 1, i32 10, i32 7, i32 2, i32 127, i32 127, i32 9, i32 7, i32 121, i32 121, i32 6, i32 8, i32 125, i32 122, i32 6, i32 12, i32 6, i32 125, i32 127, i32 13, i32 7, i32 121, i32 1, i32 6, i32 127, i32 127, i32 2, i32 3, i32 1, i32 126, i32 1, i32 1, i32 125, i32 1, i32 0, i32 125, i32 6, i32 3, i32 125, i32 5, i32 7, i32 127, i32 124, i32 1, i32 6, i32 6, i32 124, i32 122, i32 7, i32 10, i32 0, i32 120, i32 1, i32 8, i32 0, i32 121, i32 122, i32 4, i32 10, i32 0, i32 120, i32 1, i32 6, i32 122, i32 117, i32 122, i32 0, i32 0, i32 121, i32 118, i32 127, i32 7, i32 0, i32 122, i32 125, i32 2, i32 4, i32 124, i32 122, i32 2, i32 5, i32 124, i32 122, i32 125, i32 127, i32 0, i32 120, i32 117, i32 127, i32 0, i32 121, i32 120, i32 121, i32 1, i32 3, i32 121, i32 121, i32 0, i32 0, i32 127, i32 127, i32 121, i32 127, i32 2, i32 122, i32 124, i32 125, i32 124, i32 127, i32 125, i32 121, i32 125, i32 0, i32 121, i32 122, i32 124, i32 125, i32 0, i32 125, i32 125, i32 0, i32 0, i32 0, i32 0, i32 125, i32 125, i32 0, i32 125, i32 126, i32 0, i32 126, i32 3, i32 3, i32 125, i32 1, i32 5, i32 0, i32 126, i32 125, i32 127, i32 3, i32 125, i32 121, i32 1, i32 2, i32 125, i32 127, i32 1, i32 0, i32 0, i32 127, i32 127, i32 126, i32 127, i32 0, i32 127, i32 0, i32 124, i32 125, i32 0, i32 121, i32 120, i32 124, i32 124, i32 123, i32 123, i32 125, i32 127, i32 0, i32 0, i32 127, i32 0, i32 1, i32 2, i32 0, i32 127, i32 0, i32 0, i32 0, i32 127, i32 126, i32 0, i32 0, i32 127, i32 0, i32 2, i32 1, i32 2, i32 6, i32 5, i32 3, i32 6, i32 8, i32 5, i32 2, i32 1, i32 1, i32 3, i32 0, i32 125, i32 127, i32 0, i32 127, i32 126, i32 0, i32 2, i32 3, i32 2, i32 1, i32 2, i32 3, i32 1, i32 124, i32 125, i32 0, i32 0, i32 126, i32 124, i32 127, i32 1, i32 0, i32 126, i32 124, i32 127, i32 1, i32 0, i32 126, i32 127, i32 2, i32 3, i32 1, i32 0, i32 4, i32 6, i32 5, i32 6, i32 7, i32 10, i32 10, i32 4, i32 2, i32 5, i32 8, i32 9, i32 8, i32 7, i32 12, i32 20, i32 20, i32 16, i32 14, i32 20, i32 21, i32 15, i32 9, i32 7, i32 4, i32 126, i32 118, i32 100, i32 65, i32 72, i32 125, i32 108, i32 61, i32 103, i32 16, i32 6, i32 125, i32 117, i32 7, i32 29, i32 0, i32 108, i32 2, i32 125, i32 120, i32 119, i32 111, i32 119, i32 1, i32 0, i32 2, i32 7, i32 10, i32 28, i32 28, i32 23, i32 35, i32 47, i32 65, i32 67, i32 79, i32 85, i32 88, i32 126, i32 2, i32 76, i32 16, i32 105, i32 44, i32 13, i32 116, i32 42, i32 116, i32 99, i32 41, i32 124, i32 94, i32 33, i32 53, i32 70, i32 36, i32 103, i32 53, i32 60, i32 60, i32 38, i32 38, i32 47, i32 71, i32 100, i32 4, i32 19, i32 24, i32 39, i32 43, i32 48, i32 27, i32 127, i32 120, i32 114, i32 104, i32 92, i32 90, i32 104, i32 124, i32 3, i32 13, i32 38, i32 65, i32 81, i32 90, i32 106, i32 108, i32 84, i32 120, i32 9, i32 69, i32 121, i32 31, i32 11, i32 46, i32 96, i32 11, i32 102, i32 127, i32 104, i32 119, i32 78, i32 70, i32 74, i32 59, i32 18, i32 91, i32 55, i32 49, i32 33, i32 11, i32 18, i32 46, i32 87, i32 126, i32 25, i32 34, i32 43, i32 63, i32 58, i32 37, i32 11, i32 121, i32 113, i32 104, i32 97, i32 92, i32 102, i32 114, i32 6, i32 22, i32 41, i32 65, i32 94, i32 109, i32 102, i32 96, i32 110, i32 23, i32 72, i32 54, i32 18, i32 23, i32 47, i32 99, i32 120, i32 92, i32 119, i32 108, i32 117, i32 65, i32 73, i32 79, i32 59, i32 11, i32 84, i32 55, i32 0], align 4
@out_data = global [720 x i32] [i32 942, i32 -1803, i32 -1114, i32 8498, i32 25256, i32 39120, i32 38731, i32 24653, i32 9382, i32 2033, i32 2253, i32 1408, i32 -1996, i32 -284, i32 11511, i32 26195, i32 30697, i32 22742, i32 12462, i32 9656, i32 12940, i32 13757, i32 11383, i32 11124, i32 15776, i32 20472, i32 19023, i32 11262, i32 2325, i32 -3499, i32 -3235, i32 3870, i32 13375, i32 16894, i32 10712, i32 -134, i32 -2562, i32 8417, i32 25589, i32 37515, i32 38743, i32 31671, i32 22504, i32 13445, i32 5357, i32 -408, i32 -1547, i32 1333, i32 6016, i32 10256, i32 12948, i32 14140, i32 13516, i32 11793, i32 11004, i32 12227, i32 15646, i32 20755, i32 25325, i32 27187, i32 25799, i32 22586, i32 20210, i32 18719, i32 14396, i32 7750, i32 6611, i32 15841, i32 30111, i32 35128, i32 25408, i32 13441, i32 10266, i32 13862, i32 12197, i32 2450, i32 -3118, i32 2172, i32 10508, i32 14046, i32 13669, i32 14608, i32 14439, i32 8785, i32 1186, i32 2049, i32 10247, i32 14672, i32 9539, i32 4117, i32 8688, i32 21355, i32 27742, i32 21511, i32 9601, i32 4115, i32 9699, i32 21006, i32 26900, i32 21963, i32 10680, i32 3316, i32 6950, i32 14457, i32 14553, i32 6246, i32 1470, i32 11848, i32 28750, i32 33822, i32 21975, i32 6304, i32 2758, i32 11026, i32 15771, i32 10149, i32 3223, i32 6199, i32 17184, i32 23404, i32 18494, i32 10096, i32 8469, i32 13080, i32 15482, i32 12982, i32 10445, i32 11732, i32 14262, i32 12625, i32 9532, i32 12329, i32 22979, i32 35279, i32 40222, i32 33059, i32 20399, i32 9694, i32 4424, i32 2070, i32 -363, i32 -93, i32 5613, i32 12924, i32 15609, i32 12430, i32 9976, i32 14404, i32 22443, i32 26379, i32 24484, i32 22707, i32 24373, i32 26274, i32 23076, i32 15047, i32 9149, i32 9958, i32 14385, i32 16122, i32 13537, i32 10802, i32 12110, i32 15139, i32 14513, i32 10236, i32 8877, i32 15535, i32 25007, i32 27507, i32 21663, i32 14222, i32 12994, i32 18396, i32 24979, i32 29538, i32 29442, i32 21873, i32 9453, i32 1181, i32 2342, i32 9242, i32 13711, i32 12776, i32 14658, i32 22307, i32 27698, i32 24642, i32 16318, i32 10997, i32 10834, i32 12327, i32 13361, i32 16061, i32 21320, i32 24803, i32 25284, i32 26442, i32 27175, i32 22951, i32 14111, i32 8536, i32 14085, i32 25146, i32 26724, i32 15807, i32 6302, i32 10253, i32 24471, i32 32298, i32 24723, i32 11607, i32 6974, i32 13843, i32 23132, i32 27510, i32 26341, i32 23384, i32 22691, i32 24196, i32 26920, i32 27967, i32 24831, i32 19771, i32 16642, i32 15130, i32 10996, i32 6767, i32 9983, i32 20496, i32 26714, i32 20757, i32 11161, i32 13863, i32 27903, i32 34520, i32 25741, i32 14059, i32 13097, i32 19928, i32 22527, i32 18768, i32 17788, i32 20767, i32 20631, i32 16770, i32 17585, i32 23805, i32 24244, i32 13674, i32 3847, i32 9031, i32 24352, i32 30082, i32 20296, i32 8784, i32 8070, i32 14444, i32 17374, i32 14080, i32 11509, i32 12866, i32 14830, i32 14255, i32 13255, i32 13219, i32 13538, i32 12979, i32 13573, i32 14438, i32 13649, i32 10945, i32 10091, i32 13759, i32 17568, i32 12652, i32 898, i32 -4886, i32 2956, i32 14940, i32 16289, i32 6984, i32 3035, i32 11574, i32 19080, i32 11469, i32 -1561, i32 -646, i32 15678, i32 27789, i32 23711, i32 14338, i32 15121, i32 21656, i32 21776, i32 15653, i32 15468, i32 22341, i32 24666, i32 14713, i32 4179, i32 7866, i32 22505, i32 30199, i32 23343, i32 9909, i32 3917, i32 10414, i32 21582, i32 26804, i32 22181, i32 12169, i32 5389, i32 6464, i32 11814, i32 15258, i32 14666, i32 12039, i32 10671, i32 10934, i32 13676, i32 16107, i32 14155, i32 8472, i32 8486, i32 19045, i32 29651, i32 25111, i32 7659, i32 -559, i32 12103, i32 28315, i32 27134, i32 11258, i32 3011, i32 9763, i32 14980, i32 8829, i32 3151, i32 11399, i32 25090, i32 25802, i32 13237, i32 4725, i32 7733, i32 11436, i32 10136, i32 14027, i32 27373, i32 35386, i32 24753, i32 7861, i32 8524, i32 26634, i32 36788, i32 26265, i32 11841, i32 12666, i32 22351, i32 23153, i32 15317, i32 14560, i32 22145, i32 23838, i32 14289, i32 10281, i32 22828, i32 38289, i32 38179, i32 25858, i32 20182, i32 26658, i32 30602, i32 26035, i32 22796, i32 28248, i32 32313, i32 24156, i32 12232, i32 12731, i32 22919, i32 24690, i32 13919, i32 8831, i32 22049, i32 40335, i32 41166, i32 26103, i32 16621, i32 24229, i32 36676, i32 39212, i32 34478, i32 35059, i32 39382, i32 35726, i32 23685, i32 17931, i32 26004, i32 37503, i32 36475, i32 25537, i32 21163, i32 26205, i32 27042, i32 13312, i32 -3562, i32 -3814, i32 12832, i32 27198, i32 27799, i32 23076, i32 23985, i32 26977, i32 22973, i32 13908, i32 11107, i32 14863, i32 14465, i32 6857, i32 2646, i32 11281, i32 26168, i32 33133, i32 31162, i32 27002, i32 23514, i32 18455, i32 13100, i32 14900, i32 23978, i32 26424, i32 14210, i32 -107, i32 2974, i32 24667, i32 44473, i32 42964, i32 25554, i32 13303, i32 16143, i32 24828, i32 26833, i32 21423, i32 20148, i32 26869, i32 34429, i32 35548, i32 33921, i32 36505, i32 40436, i32 35766, i32 22560, i32 12449, i32 12503, i32 14640, i32 8789, i32 62, i32 1809, i32 11632, i32 15822, i32 8549, i32 2713, i32 10491, i32 23811, i32 26728, i32 17524, i32 9071, i32 9520, i32 11748, i32 7003, i32 -1374, i32 -3325, i32 1832, i32 5270, i32 2647, i32 -906, i32 371, i32 4366, i32 3653, i32 -1804, i32 -4176, i32 2693, i32 14346, i32 22168, i32 24690, i32 26463, i32 28112, i32 23778, i32 11182, i32 -240, i32 -1347, i32 3621, i32 2309, i32 -4792, i32 -2064, i32 15572, i32 30253, i32 24375, i32 8082, i32 7937, i32 27466, i32 40531, i32 27910, i32 6186, i32 5921, i32 27063, i32 39923, i32 27714, i32 8291, i32 7632, i32 23482, i32 30741, i32 17448, i32 -1569, i32 -7028, i32 444, i32 6121, i32 3581, i32 -679, i32 -79, i32 3842, i32 5082, i32 2688, i32 502, i32 355, i32 2137, i32 3432, i32 3218, i32 2196, i32 1919, i32 3729, i32 6543, i32 6769, i32 4605, i32 3499, i32 5661, i32 7993, i32 5621, i32 -80, i32 -33, i32 10908, i32 27275, i32 35163, i32 29825, i32 20669, i32 20648, i32 29895, i32 35627, i32 27595, i32 13091, i32 7292, i32 15704, i32 26443, i32 25870, i32 14249, i32 4460, i32 5515, i32 14204, i32 21865, i32 26948, i32 32217, i32 37468, i32 36201, i32 25216, i32 9318, i32 -1083, i32 -2355, i32 2788, i32 7104, i32 7381, i32 6381, i32 7294, i32 11134, i32 15805, i32 17555, i32 19069, i32 22771, i32 27983, i32 28851, i32 22764, i32 14796, i32 12611, i32 15488, i32 17667, i32 16079, i32 14853, i32 18276, i32 24021, i32 26618, i32 26107, i32 25357, i32 25635, i32 23657, i32 18559, i32 14333, i32 14571, i32 17988, i32 21200, i32 21436, i32 19204, i32 14535, i32 10788, i32 11607, i32 17512, i32 22778, i32 19636, i32 10239, i32 4158, i32 6281, i32 11754, i32 12823, i32 11414, i32 16285, i32 28319, i32 37697, i32 35805, i32 27217, i32 24570, i32 30075, i32 33038, i32 24553, i32 10410, i32 3470, i32 8653, i32 18320, i32 24591, i32 27579, i32 30191, i32 31376, i32 28251, i32 22328, i32 18890, i32 19644, i32 20238, i32 17000, i32 11982, i32 9966, i32 13080, i32 19700, i32 26513, i32 32122, i32 33938, i32 31334, i32 26104, i32 21202, i32 18025, i32 15775, i32 14526, i32 16450, i32 19160, i32 17453, i32 9147, i32 1484, i32 4580, i32 18149, i32 28742, i32 25886, i32 14943, i32 9424, i32 13360, i32 17830, i32 14791, i32 9866, i32 13759, i32 25513, i32 33556, i32 32216, i32 27576, i32 27793, i32 29556, i32 24480, i32 13054, i32 5203, i32 8423, i32 19296, i32 28808, i32 32311, i32 30788, i32 27306, i32 23856, i32 20453, i32 16475, i32 11830, i32 8010, i32 8633, i32 15334, i32 24793, i32 31666, i32 33337, i32 31781, i32 30229, i32 29116, i32 26424, i32 21527, i32 16693, i32 14689, i32 15517, i32 16067, i32 12574, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0], align 4
@output = global [720 x i32] [i32 1, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1], align 4
@.str = private unnamed_addr constant [7 x i8] c"0x%x, \00", align 1
@str = private unnamed_addr constant [3 x i8] c"-1\00"

; Function Attrs: nounwind
define i32 @main() #0 {
entry:
  br label %for.body.i.preheader

for.body.i.preheader:                             ; preds = %fir_filter_int.exit, %entry
  %i.018 = phi i32 [ 0, %entry ], [ %inc, %fir_filter_int.exit ]
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i.preheader, %for.end.i
  %out.addr.048.i = phi i32* [ %incdec.ptr12.i, %for.end.i ], [ getelementptr inbounds ([720 x i32], [720 x i32]* @output, i32 0, i32 0), %for.body.i.preheader ]
  %coef_start.047.i = phi i32* [ %coef_start.1.i, %for.end.i ], [ getelementptr inbounds ([36 x i32], [36 x i32]* @fir_int, i32 0, i32 0), %for.body.i.preheader ]
  %in_ptr.046.i = phi i32* [ %in_ptr.1.i, %for.end.i ], [ getelementptr inbounds ([701 x i32], [701 x i32]* @in_data, i32 0, i32 17), %for.body.i.preheader ]
  %acc_length.045.i = phi i32 [ %acc_length.2.i, %for.end.i ], [ 18, %for.body.i.preheader ]
  %i.044.i = phi i32 [ %inc21.i, %for.end.i ], [ 0, %for.body.i.preheader ]
  %incdec.ptr.i = getelementptr inbounds i32, i32* %coef_start.047.i, i32 1
  %0 = load i32, i32* %coef_start.047.i, align 4, !tbaa !1
  %1 = load i32, i32* %in_ptr.046.i, align 4, !tbaa !1
  %mul.i = mul nsw i32 %1, %0
  %cmp638.i = icmp sgt i32 %acc_length.045.i, 1
  br i1 %cmp638.i, label %for.body7.i.preheader, label %for.end.i

for.body7.i.preheader:                            ; preds = %for.body.i
  br label %for.body7.i

for.body7.i:                                      ; preds = %for.body7.i.preheader, %for.body7.i
  %in_ptr.046.pn.i = phi i32* [ %data_ptr.042.i, %for.body7.i ], [ %in_ptr.046.i, %for.body7.i.preheader ]
  %coef_ptr.041.i = phi i32* [ %incdec.ptr8.i, %for.body7.i ], [ %incdec.ptr.i, %for.body7.i.preheader ]
  %acc.040.i = phi i32 [ %add11.i, %for.body7.i ], [ %mul.i, %for.body7.i.preheader ]
  %j.039.i = phi i32 [ %inc.i, %for.body7.i ], [ 1, %for.body7.i.preheader ]
  %data_ptr.042.i = getelementptr inbounds i32, i32* %in_ptr.046.pn.i, i32 -1
  %incdec.ptr8.i = getelementptr inbounds i32, i32* %coef_ptr.041.i, i32 1
  %2 = load i32, i32* %coef_ptr.041.i, align 4, !tbaa !1
  %3 = load i32, i32* %data_ptr.042.i, align 4, !tbaa !1
  %mul10.i = mul nsw i32 %3, %2
  %add11.i = add nsw i32 %mul10.i, %acc.040.i
  %inc.i = add nuw nsw i32 %j.039.i, 1
  %exitcond.i = icmp eq i32 %inc.i, %acc_length.045.i
  br i1 %exitcond.i, label %for.end.i.loopexit, label %for.body7.i

for.end.i.loopexit:                               ; preds = %for.body7.i
  %add11.i.lcssa = phi i32 [ %add11.i, %for.body7.i ]
  br label %for.end.i

for.end.i:                                        ; preds = %for.end.i.loopexit, %for.body.i
  %acc.0.lcssa.i = phi i32 [ %mul.i, %for.body.i ], [ %add11.i.lcssa, %for.end.i.loopexit ]
  %incdec.ptr12.i = getelementptr inbounds i32, i32* %out.addr.048.i, i32 1
  store i32 %acc.0.lcssa.i, i32* %out.addr.048.i, align 4, !tbaa !1
  %cmp13.i = icmp eq i32* %in_ptr.046.i, getelementptr inbounds ([701 x i32], [701 x i32]* @in_data, i32 0, i32 699)
  %cmp15.i = icmp slt i32 %acc_length.045.i, 35
  %inc17.i = zext i1 %cmp15.i to i32
  %incdec.ptr18.i = getelementptr inbounds i32, i32* %in_ptr.046.i, i32 1
  %acc_length.2.v.i = select i1 %cmp13.i, i32 -1, i32 %inc17.i
  %acc_length.2.i = add i32 %acc_length.2.v.i, %acc_length.045.i
  %in_ptr.1.i = select i1 %cmp13.i, i32* getelementptr inbounds ([701 x i32], [701 x i32]* @in_data, i32 0, i32 699), i32* %incdec.ptr18.i
  %coef_start.1.i = select i1 %cmp13.i, i32* %incdec.ptr.i, i32* %coef_start.047.i
  %inc21.i = add nuw nsw i32 %i.044.i, 1
  %exitcond49.i = icmp eq i32 %inc21.i, 700
  br i1 %exitcond49.i, label %fir_filter_int.exit, label %for.body.i

fir_filter_int.exit:                              ; preds = %for.end.i
  %inc = add nuw nsw i32 %i.018, 1
  %exitcond19 = icmp eq i32 %inc, 200
  br i1 %exitcond19, label %for.body3.preheader, label %for.body.i.preheader

for.body3.preheader:                              ; preds = %fir_filter_int.exit
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.inc7
  %i.117 = phi i32 [ %inc8, %for.inc7 ], [ 0, %for.body3.preheader ]
  %arrayidx = getelementptr inbounds [720 x i32], [720 x i32]* @output, i32 0, i32 %i.117
  %4 = load i32, i32* %arrayidx, align 4, !tbaa !1
  %arrayidx4 = getelementptr inbounds [720 x i32], [720 x i32]* @out_data, i32 0, i32 %i.117
  %5 = load i32, i32* %arrayidx4, align 4, !tbaa !1
  %cmp5 = icmp eq i32 %4, %5
  br i1 %cmp5, label %for.inc7, label %if.then

if.then:                                          ; preds = %for.body3
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str, i32 0, i32 0), i32 %4) #1
  br label %for.inc7

for.inc7:                                         ; preds = %for.body3, %if.then
  %inc8 = add nuw nsw i32 %i.117, 1
  %exitcond = icmp eq i32 %inc8, 700
  br i1 %exitcond, label %for.end9, label %for.body3

for.end9:                                         ; preds = %for.inc7
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @str, i32 0, i32 0))
  ret i32 -1
}

; Function Attrs: nounwind
define void @fir_filter_int(i32* readonly %in, i32* nocapture %out, i32 %in_len, i32* nocapture readonly %coef, i32 %coef_len, i32 %scale) #0 {
entry:
  %add = add nsw i32 %coef_len, 1
  %shr = ashr i32 %add, 1
  %add.ptr.sum = add i32 %in_len, -1
  %add.ptr1 = getelementptr inbounds i32, i32* %in, i32 %add.ptr.sum
  %cmp43 = icmp sgt i32 %in_len, 0
  br i1 %cmp43, label %for.body.lr.ph, label %for.end22

for.body.lr.ph:                                   ; preds = %entry
  %add.ptr2.sum = add nsw i32 %shr, -1
  %add.ptr3 = getelementptr inbounds i32, i32* %in, i32 %add.ptr2.sum
  br label %for.body

for.body:                                         ; preds = %for.end, %for.body.lr.ph
  %out.addr.048 = phi i32* [ %out, %for.body.lr.ph ], [ %incdec.ptr12, %for.end ]
  %coef_start.047 = phi i32* [ %coef, %for.body.lr.ph ], [ %coef_start.1, %for.end ]
  %in_ptr.046 = phi i32* [ %add.ptr3, %for.body.lr.ph ], [ %in_ptr.1, %for.end ]
  %acc_length.045 = phi i32 [ %shr, %for.body.lr.ph ], [ %acc_length.2, %for.end ]
  %i.044 = phi i32 [ 0, %for.body.lr.ph ], [ %inc21, %for.end ]
  %incdec.ptr = getelementptr inbounds i32, i32* %coef_start.047, i32 1
  %0 = load i32, i32* %coef_start.047, align 4, !tbaa !1
  %1 = load i32, i32* %in_ptr.046, align 4, !tbaa !1
  %mul = mul nsw i32 %1, %0
  %cmp638 = icmp sgt i32 %acc_length.045, 1
  br i1 %cmp638, label %for.body7.preheader, label %for.end

for.body7.preheader:                              ; preds = %for.body
  br label %for.body7

for.body7:                                        ; preds = %for.body7.preheader, %for.body7
  %in_ptr.046.pn = phi i32* [ %data_ptr.042, %for.body7 ], [ %in_ptr.046, %for.body7.preheader ]
  %coef_ptr.041 = phi i32* [ %incdec.ptr8, %for.body7 ], [ %incdec.ptr, %for.body7.preheader ]
  %acc.040 = phi i32 [ %add11, %for.body7 ], [ %mul, %for.body7.preheader ]
  %j.039 = phi i32 [ %inc, %for.body7 ], [ 1, %for.body7.preheader ]
  %data_ptr.042 = getelementptr inbounds i32, i32* %in_ptr.046.pn, i32 -1
  %incdec.ptr8 = getelementptr inbounds i32, i32* %coef_ptr.041, i32 1
  %2 = load i32, i32* %coef_ptr.041, align 4, !tbaa !1
  %3 = load i32, i32* %data_ptr.042, align 4, !tbaa !1
  %mul10 = mul nsw i32 %3, %2
  %add11 = add nsw i32 %mul10, %acc.040
  %inc = add nuw nsw i32 %j.039, 1
  %exitcond = icmp eq i32 %inc, %acc_length.045
  br i1 %exitcond, label %for.end.loopexit, label %for.body7

for.end.loopexit:                                 ; preds = %for.body7
  %add11.lcssa = phi i32 [ %add11, %for.body7 ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body
  %acc.0.lcssa = phi i32 [ %mul, %for.body ], [ %add11.lcssa, %for.end.loopexit ]
  %incdec.ptr12 = getelementptr inbounds i32, i32* %out.addr.048, i32 1
  store i32 %acc.0.lcssa, i32* %out.addr.048, align 4, !tbaa !1
  %cmp13 = icmp eq i32* %in_ptr.046, %add.ptr1
  %cmp15 = icmp slt i32 %acc_length.045, %coef_len
  %inc17 = zext i1 %cmp15 to i32
  %incdec.ptr18 = getelementptr inbounds i32, i32* %in_ptr.046, i32 1
  %acc_length.2.v = select i1 %cmp13, i32 -1, i32 %inc17
  %acc_length.2 = add i32 %acc_length.045, %acc_length.2.v
  %in_ptr.1 = select i1 %cmp13, i32* %in_ptr.046, i32* %incdec.ptr18
  %coef_start.1 = select i1 %cmp13, i32* %incdec.ptr, i32* %coef_start.047
  %inc21 = add nuw nsw i32 %i.044, 1
  %exitcond49 = icmp eq i32 %inc21, %in_len
  br i1 %exitcond49, label %for.end22.loopexit, label %for.body

for.end22.loopexit:                               ; preds = %for.end
  br label %for.end22

for.end22:                                        ; preds = %for.end22.loopexit, %entry
  ret void
}

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #0

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-features"="+soft-float" "unsafe-fp-math"="false" "use-soft-float"="true" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.0 (trunk 234885)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
