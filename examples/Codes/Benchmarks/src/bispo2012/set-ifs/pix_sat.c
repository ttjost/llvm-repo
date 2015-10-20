// Number of pixels
#define N 2000

const short   in_data[N] = {
    -19360, 20792, -13446, 28862, -13834, -4038, 28855, 9475, -17858, -22675, -13013, -4021, -15837, -5811, -27857,
    3928, 6920, -20217, -19214, -12047, 25103, -28048, 26456, -22282, -20584, 21816, -4321, -8012, 8968, -28833,
    -25533, 30842, -6453, -3353, -26716, 3692, -3941, 17098, 26341, -8554, 513, 9006, 19094, 12356, -21220,
    14550, -9580, -15216, 24992, 19420, -31569, 6715, -14815, 24989, -11890, -25920, -7791, 499, -27697, 1190,
    -9977, 7081, 25970, -22763, 17857, 15403, 6007, 17068, 26476, 3709, -2108, -23663, -18782, 21870, 4428,
    18633, -25677, -10996, -13714, -21304, 19879, -8358, -31334, 843, 7555, 30784, 10298, -32666, -20021, 17602,
    -21554, 31960, -2488, -18060, 7513, 2982, -15349, 15405, -20741, -11034, -31311, 11514, -16417, 18907, 23527,
    2646, -426, -31166, -31184, 9367, 2116, 29419, 5093, -27478, 11706, -630, 8573, 27138, 14820, 31182,
    9742, 17357, 26149, 32691, 5396, -13976, -9344, -9452, 22640, -18923, 26169, 24707, -6478, 27627, 16315,
    -17572, -1638, 16909, 4796, -30441, 10459, 542, -25186, 21982, -4829, 18676, -26856, 20063, -12457, -16757,
    -18155, -17694, -14301, 22843, 5596, -26723, -27727, 8237, 7024, -8633, -585, 8459, -5831, 21738, 27063,
    -29450, -9245, -2563, 7042, 12477, 29573, 17841, 1021, -17334, -2042, 10379, 5671, -29345, 32700, 3890,
    26714, -3710, 15445, -29814, -23088, 4918, 12794, -23808, -27544, 1643, -17231, 29223, -19798, -22474, -30718,
    -2684, 12808, 17860, -8995, 2981, -11930, 16012, 27066, 1144, 23516, 5572, -5887, 20953, -12358, -22763,
    18861, 11628, 29132, 29329, 15915, 18348, 20702, 13284, 21895, -11196, -638, 14537, 714, -30819, 31248,
    10944, 13981, 22967, -22803, 16381, 28465, 8764, -20720, 1955, 25186, 25042, 14530, 17713, -23014, -13136,
    24228, -28868, -1293, 27252, -19210, -23202, 7456, 24370, -8427, -20114, 16269, -20016, 31045, -6159, -27325,
    -23664, 23217, 15311, -29423, 27885, 29615, 6473, -23704, 29611, -13241, 23594, -4474, 20009, 26357, -2756,
    -14121, 10233, 2990, -3331, 15767, 23474, 16160, -7790, 7099, 22020, -5570, -18948, -11503, 5644, 30203,
    -18295, 32678, -8472, 24404, 8844, -14489, -4466, -30828, 25424, 28170, 19929, -15149, 16457, -15570, 3556,
    30399, 17548, 20160, -31077, 9118, 13184, 24481, 27278, 24979, 29397, 24709, -15352, -28641, -24651, 5918,
    12128, 9706, -15558, 12664, -6514, -26941, -9697, -14938, 29184, 5605, -23623, -22626, 4782, -18308, -5081,
    -18079, 14700, -17305, -14904, -26274, -24706, -2242, 26093, 21272, -11151, -20075, -26417, -2554, 21800, 29314,
    195, 14009, -32716, 32604, -27477, 32324, -1175, 5061, 4527, 3031, 24237, -27157, 21549, 3245, 14355,
    19210, -13331, -12760, -17113, 20532, 32665, 28217, -17013, -9388, 21355, -20987, -21822, 2160, -30936, -13627,
    -14005, -18643, -24756, -32531, -8463, 15512, 11654, -25200, -3487, -4829, 11366, -15870, -4099, -15636, -7596,
    15806, 18415, -23483, 32708, 8842, -9857, 3696, -4953, -2344, -16471, 10410, 31012, -21905, -11542, -31894,
    25991, -20150, -2982, 2026, 30073, 26816, 30207, -9242, 625, 10980, 13407, 15779, 16746, -19410, 13654,
    -25550, -20522, -16550, -8150, 28661, -9262, -1136, 8924, -26782, -1126, -16188, 6336, 15366, 2110, 9823,
    1615, -31795, 20373, 24606, -16836, -28032, -20110, -31430, -15420, -24690, -1003, 9673, -16822, 9230, 7140,
    21092, 4642, 25860, 4699, -1528, -19796, -8734, -6081, -15807, -32347, 20306, 3865, -17020, -12359, 30258,
    -6686, -23588, -11685, -20768, 21754, 29129, 8921, 2230, -19105, -28316, -25942, -29224, 30490, -3641, 8458,
    -15572, 15100, -20309, 15816, -23383, 21386, 14929, -31394, -24107, -7883, 934, 12866, 24200, -562, 17057,
    32635, 15349, -21704, 18672, -26506, -4630, 31070, 25810, 12825, -24490, 5991, 27718, 8472, 28940, 17448,
    22117, -32376, 16838, -11814, -30964, 17329, 9835, -20212, -20291, 12839, -3180, 14042, 28870, -15077, -20148,
    4703, 2467, 22254, -2537, -23193, -8288, -29178, 28213, -19351, -25662, 4069, 4903, -24141, 6375, -11913,
    -10382, -22553, 32556, -26454, -13662, -14427, 12686, -31932, -1647, 23689, 29139, -22800, -28951, -29352, -8534,
    7833, -2074, 2933, 12305, 6394, 4448, -10855, -10762, -17291, -24312, -3646, 23841, -3036, -24847, 21100,
    -16816, 31278, 4946, 23294, -1117, -19621, -29559, -18553, -20422, 12265, 29027, 31657, 30236, -6753, -19558,
    -17195, 18010, 30499, -22882, 7096, 14195, 7304, -360, -3852, 15866, 299, 15275, 4371, -11402, 10942,
    1404, 23480, -22648, 15781, 15092, -30186, -16557, -19840, -17852, -3930, -22761, 20744, 9513, 10260, -26081,
    1054, 9585, -11911, -15139, 23329, -2627, -5681, 1362, 19583, 12935, 24737, -12877, 3470, 14182, -6654,
    3401, 5020, -29552, 9151, 17304, -28092, 10400, -10793, 8643, 2819, -30054, 30251, 24110, -15862, -4053,
    28529, -24987, 11349, 11316, 2926, -25796, -21765, -7799, -28572, -7370, 10184, 9717, 16840, -8406, 26376,
    -11903, 14392, -733, 8869, -523, 17579, 9608, 17012, 31391, 21225, -8580, -14901, 14418, -194, -15993,
    12886, -3663, 21354, 10101, -25558, -27731, -8485, 11902, -25830, 10827, -25059, 32422, -16055, 21930, 26001,
    28774, 26368, -29884, -15524, 31116, -8254, -22668, -29534, 1119, 27804, -27849, -30220, 5382, 32704, 566,
    -2298, 24873, 9556, -29437, -13915, -16936, -23161, -21597, -3097, 1964, -19482, 21580, 5539, -5845, -16404,
    17007, 20771, 9072, 15071, 10743, 14104, 15627, -6439, 23251, -563, -17627, -31964, -26446, 30623, 18664,
    27083, 11021, 31916, 28957, -3475, 26986, -17461, -12778, -20908, 18397, 9915, -11315, -11835, -22574, 28062,
    -26547, 24217, 28938, 15783, 15952, -7156, -18717, 14098, -6615, -6188, 28123, -12716, 18660, 19573, 30038,
    -29548, 25003, 18643, -1633, 25433, -13974, -15096, 29228, 1923, -22346, 12407, -16347, -30849, 25578, 9505,
    12583, -28490, 26003, 27703, 27204, 6213, -21747, 14319, 32590, 23283, -2195, -22886, -17835, 26719, -12127,
    -7434, -10387, -21127, -21802, 30144, -18252, 12851, -6631, -25459, -10606, 32375, -32192, -17958, -4030, 23131,
    -21237, 12897, -16239, -8814, -29051, 19374, -17690, -32219, -2128, -8208, 5249, 11875, -10400, -1260, -25081,
    27158, -26265, -19185, 12605, 13047, -11278, -8837, -18668, 9314, -6350, 19557, 2533, -6579, 29502, -5020,
    14332, 6006, -14281, -11794, -5542, 9947, -19284, -3098, -3146, -12177, 22080, 22904, 19397, 12554, -12150,
    -11991, -1349, -23136, 3644, -31447, -18160, -5707, -3962, 235, 18311, 10512, -28484, 31735, -15509, -1874,
    30773, 32254, 31515, 27385, -3466, 12334, 1737, -19654, -8816, -4152, -22146, 3147, -25402, -2578, 15968,
    -10608, 4466, 10433, 13879, 8486, -16856, 27051, 26925, 4701, 30747, -2824, -16171, -7324, 19135, -22869,
    -402, 25410, 29104, 14479, 8551, 13581, -29487, -12917, 12838, 15701, 29368, 24122, 29956, -3360, 17737,
    -9541, 18844, -31076, -21344, 5573, 14917, 5841, 23604, -13059, -36, 24981, 17976, 25227, 32198, -21883,
    8516, 7146, -1484, -14415, 9268, -1537, 5801, -30248, 7248, 32365, 19640, -3116, 16813, -3545, -3310,
    -2729, 28114, 326, 3776, -25385, -26467, -16357, 29868, -2874, -16537, 28040, -155, 6, -26010, -31093,
    -8926, -30308, -15277, -229, 14855, -17501, 14412, -19401, -13657, -20094, 18939, 27451, -1335, 31073, 31734,
    -3468, -15249, 14552, -10136, 14071, 29459, 26857, -20495, 25518, -10445, 23856, -7477, 23987, -20976, -30120,
    6189, 12768, 16817, 16337, -30733, 18342, -31442, -14145, 14974, 27933, 12586, 10293, -7464, 4189, -23392,
    -7006, -18660, 14859, -29213, -26997, -5356, 7478, -24609, 11898, -20189, 20579, -10332, 9782, -6811, 998,
    5669, 4403, -14572, -13965, 4668, 16459, 25645, -16140, -6416, 27822, -25773, 16028, -15878, -25065, -10254,
    15931, 30341, -16320, -4954, 14291, -1994, -25704, -20514, 10604, 619, 9522, 16060, -5596, 28614, 23039,
    2623, 6793, 1516, 6463, 4772, 17962, -18039, -19916, -2808, 2667, -20841, 6425, -20654, 22169, 30944,
    -2223, 15951, 6462, 24769, 2787, 31261, -4427, -20433, -30426, -11059, -23296, 19455, 30904, -8380, -22312,
    7521, 14004, -18335, -20475, 4013, -25821, -13724, 13552, -22942, 28850, 31373, -26763, 28522, 13221, -20733,
    -2306, -10846, 19468, 20215, 6605, 6042, 14131, 8457, -2664, 26264, 21598, -21526, -21158, 29155, 18613,
    -702, 6247, -7619, 11901, 31443, 9921, -30288, 904, 8669, -18774, 19341, 2798, -10044, -20614, 177,
    5629, -18704, 30130, -9206, -6035, 26356, 3152, 4953, 11224, 1777, 30564, -12231, -22936, 11068, 13283,
    -21153, -22319, -6338, -10054, 17442, -6270, 155, 13606, -29123, 13078, -20330, -32702, 8148, -15344, -26700,
    28129, 32180, 3528, -14434, 15517, 5087, 19615, 1867, 4399, -28602, 17273, -19106, 13057, -23080, -9108,
    -4916, -511, 31675, -24396, -12351, -25160, 19672, 15338, 7364, -6758, -1123, 32373, 29208, -9569, -25091,
    -27840, -7323, -15854, 17851, 23725, -14952, -13912, -30488, 11464, -11001, -25389, -29014, 19648, 6615, 31576,
    -23490, 1938, 11937, -23265, -25025, 11270, -12973, 12105, -30169, 14815, -14764, -27001, 29718, -20915, -14869,
    -23895, 17618, 9126, -29727, 28533, -1009, 14421, 31076, -20806, -13585, 28946, -26323, 30628, -11573, -30125,
    -31259, 14160, -29645, -4863, -11580, -26974, 6707, 14959, -9605, 26966, 3544, 9095, 6228, -1451, 24050,
    -187, 28566, 18761, -26854, -11159, 1325, 3443, -30730, -13720, -28790, -28229, -4677, 13731, 16584, -16888,
    -6925, -19750, -20721, -7727, 8831, 1507, 24381, 5108, 14559, -20586, -10814, 15302, 28081, 28427, 20939,
    5994, -7305, 8711, -26974, -11418, 7069, -18254, 26452, 1907, 5305, 12430, -26477, 11412, -30444, -13660,
    -8994, -8087, 4456, -3841, -20770, -30268, 12267, 32606, -493, 12924, -30836, 25380, -32337, -21887, -15493,
    -14701, -10815, 18480, -3345, 15161, -14698, -9751, 23843, -26711, 28252, -25379, 4512, 31854, 2311, 19756,
    -18238, -19396, -23945, -23762, 26740, -7319, 730, -11760, -32451, 15003, 32079, -9309, -10368, 8385, -31541,
    -12944, -21249, 2118, 11072, 15119, 16032, -7292, -4357, -30280, -5516, -5002, 31309, -7910, 12788, -19534,
    14701, -10901, 7309, -21867, -5476, 7872, -16803, -25409, -29558, -3683, -6337, -13119, 20216, -13104, 15877,
    -22507, 27038, -12166, 19459, 17998, -690, -3475, 15572, 10127, 25432, -23619, 22104, -6591, -28880, -17519,
    27899, -12288, 26190, -17607, -10179, -26155, 12885, -16507, -21651, -23638, -28297, -19628, 14007, 32506, -30441,
    -26773, 5217, -21305, -24913, -3193, 18001, -14639, 6899, -15180, 10194, -30716, -9418, 31967, 14231, 26673,
    21773, -6230, -513, -16639, -20431, 2175, -27750, -24027, 6825, 17895, -29717, -3374, -17624, 30236, 18543,
    20076, -6733, -24356, -2082, -10623, 30342, -30081, -14928, 1016, 30520, 23628, -542, -1655, 29213, -505,
    10489, 2416, 6123, -2866, 25670, 25180, 7071, -9436, 31340, 6061, 26785, -14770, -32737, -1825, 5926,
    11485, -1746, -5056, -15659, 8844, -13886, -16151, 10156, -693, 30695, -21525, 10533, -18533, -32436, -6969,
    -22636, -23524, -14010, 5412, -14382, 18020, 25370, -28741, -28385, 25873, 15483, -32107, 1348, -22239, 27729,
    -26504, 5880, 24192, 10683, -16994, 8836, 10722, -20649, -1112, -13143, -14382, -28992, -24366, 27585, 10507,
    14424, 9830, 24355, -32762, -17594, -30091, -1844, 5076, 450, 4293, -8902, -5075, 3471, -24827, -613,
    -21816, -1847, 10311, -28633, 9708, -16672, -9298, -21815, -26554, 4580, 2662, 25604, 31229, -16382, -1836,
    -25068, 22275, 27982, 3854, -8109, 13998, -23102, 7309, -7458, 26758, -29818, -23775, -20360, -13728, -23183,
    23844, -32082, -9301, -28209, 29426, -17350, 12809, -24220, 5016, -23124, 8993, -24911, 25802, -12218, -18509,
    17781, -486, 17192, 15340, 11894, 25447, -10580, 251, 13184, 12947, 25107, 9187, -28755, -1928, -24736,
    28050, 16359, -7909, -5756, -24525, 26539, -18654, 14522, -14913, -16881, -6525, 308, 21466, 18181, 30334,
    -10249, 14556, -8991, 11980, 514, 9773, 19992, 23576, 20917, -21547, 4938, -6226, -2447, -1710, -7807,
    -18830, 8827, 22444, -25413, -31982, -21723, -20281, 28325, -22657, 1839, -18441, 1449, -30312, 20330, -30759,
    16426, -24792, 9630, -13984, -14322, 15634, -23123, -18386, 25212, -23094, -15113, -26588, -2074, 2823, -15360,
    28732, -26551, 30390, -27056, 7829, -77, -12495, 25754, 6607, 24325, 27312, -29408, 29592, 27898, -6657,
    -14763, -3961, 871, 12913, 18371, 18728, -13116, 3860, 7471, -6057, -14870, 24869, 2042, -17711, -26594,
    8134, -27959, -7161, 3917, -14610, 15208, 27701, 12441, -31328, -10517, 15283, -19180, -25761, -27626, -2165,
    -4918, -26400, 16382, -27829, 19972, 30721, -20241, -21477, 13515, -16646, 31632, 273, -26965, 8913, 22085,
    -25405, -20808, 23827, -12588, -31715, -6698, 10432, 13898, -395, 31540, -25978, -6369, -13604, -20200, 18482,
    18840, -10569, -32287, -3229, 14956, 18829, 8522, -21632, -18518, -1503, -12821, -25877, -2087, -24381, -18683,
    -3210, 20320, 23266, -1410, -20971, -30680, 21478, -214, 4565, -28801, -22724, -20661, 13837, -25025, -12366,
    22363, -3118, 16175, 14340, 11528, -1361, -10328, -16203, -15745, -875, -27013, 20259, -5651, 9488, -4846,
    -17963, -12990, 20411, -2348, -23017, 15927, -19978, 29390, 10953, -32110, -5163, 13199, 19570, 8360, -19365,
    10578, -22885, 28707, -27417, 27234, -10662, -3323, 26606, -8774, 31276, -17684, -28950, 27627, -9464, 24215,
    5009, -9662, -27984, 17320, 10314, -19415, -15543, 16555, -17444, -6451, -19410, -9386, 5224, -3327, -6144,
    -22766, -23143, -9887, 1, -30790, -27111, 9402, 162, -9055, -22458, -18775, -13479, -10279, 31269, 14977,
    -7752, -31310, 20630, 25202, -14917, 18561, -7735, 21222, -29855, -13150, -11536, -8146, 28541, -18241, -8907,
    -32163, -30771, -25007, -12818, 9076, -8117, -4506, -10737, 11199, -26173, -2395, -8992, 28797, -8795, 10895,
    -13841, -5946, -17636, 15623, -1465, 19625, 16734, -12781, 21729, 660, 27461, -20252, -19878, -264, -20449,
    3603, -29722, 31277, 19905, -6611, 9604, -24430, -24606, -18319, -22669, -24328, 6309, 20951, -9501, -17088,
    -20873, 2132, 32240, 16706, -11493, -6564, 25291, -31760, 18434, -30040, -12743, 22202, 25567, -16327, -14015,
    -30924, -25221, 4763, 23073, 22262, 28613, -7570, -10111, 3524, -5332, -16862, -12053, 2541, -30671, 769,
    11129, -3337, 3895, 2674, -30257, -3460, -22115, 26491, 4171, 5966, 28686, -1913, 3707, 18145, 2583,
    -11927, 15055, 24810, 13049, 16800, 30095, 31043, 14272, 31452, 18190, 19473, -15725, -25664, -29408, 20520,
    -30898, 8938, 3016, 2989, -23219, 3631, -10954, -28932, -11638, 10794, -17169, 14796, -23574, 22008, 19021,
    11921, -31021, -16580, -8662, 6177, 16385, 23145, -40, 9626, 922, 6975, 1363, 24705, 31359, -20075,
    -30023, -16082, 18660, -12711, 27897, -23192, -5598, 13525, 15307, -29365, -2613, 7219, 22239, 17010, 8703,
    -23229, 10841, -12975, -26883, 26746, 15995, -8990, 26620, 24637, 3747, -31613, 17723, -19617, -9352, 29726,
    -17577, 9192, -5024, 3722, -27685
};


/* ======================================================================== */
/*  TEXAS INSTRUMENTS, INC.                                                 */
/*                                                                          */
/*  IMGLIB  DSP Image/Video Processing Library                              */
/*                                                                          */
/*  This library contains proprietary intellectual property of Texas        */
/*  Instruments, Inc.  The library and its source code are protected by     */
/*  various copyrights, and portions may also be protected by patents or    */
/*  other legal protections.                                                */
/*                                                                          */
/*  This software is licensed for use with Texas Instruments TMS320         */
/*  family DSPs.  This license was provided to you prior to installing      */
/*  the software.  You may review this license by consulting the file       */
/*  TI_license.PDF which accompanies the files in this library.             */
/* ------------------------------------------------------------------------ */
/*          Copyright (C) 2002 Texas Instruments, Incorporated.             */
/*                          All Rights Reserved.                            */
/* ======================================================================== */


/* ======================================================================== */
/*  TEXAS INSTRUMENTS, INC.                                                 */
/*                                                                          */
/*  NAME                                                                    */
/*      IMG_pix_sat                                                         */
/*                                                                          */
/*  REVISION DATE                                                           */
/*      02-Oct-2000                                                         */
/*                                                                          */
/*  USAGE                                                                   */
/*      This routine is C callable, and has the following C prototype:      */
/*                                                                          */
/*          void IMG_pix_sat                                                */
/*          (                                                               */
/*              int n,                            // Number of pixels //    */
/*              const short   *restrict in_data,  // Incoming data    //    */
/*              unsigned char *restrict out_data  // Outgoing data    //    */
/*          );                                                              */
/*                                                                          */
/*      This code performs the saturation of 16 bit signed numbers          */
/*      to 8 bit unsigned numbers. If the data is over 255 it is            */
/*      saturated to 255, if it is less than 0 it is saturated to 0.        */
/*                                                                          */
/*  DESCRIPTION                                                             */
/*      The function IMG_pix_sat() takes signed 16-bit input pixels and     */
/*      saturates them to unsigned 8-bit results.  Pixel values above       */
/*      255 are clamped to 255, and values below 0 are clamped to 0.        */
/*                                                                          */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2002 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */
void IMG_pix_sat_c
(
    int                     n,
    const short   *in_data,
    unsigned char *out_data
)
{
    int i, pixel;

    for (i = 0; i < n; i++)
    {
        pixel = in_data[i];
        if (pixel > 0xFF)
        {
            out_data[i] = 0xFF;
        } else if (pixel < 0x00)
        {
            out_data[i] = 0x00;
        } else
        {
            out_data[i] = pixel;
        }
    }
}

int main() {

    int                    n = N;

    unsigned char out_data[N];

IMG_pix_sat_c
(
    n,
    in_data,
    out_data
);

	return 0;
}

/* ======================================================================== */
/*  End of file:  img_pix_sat.c                                             */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2002 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */
