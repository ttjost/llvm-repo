#define DATASIZE 1024

//short indata[DATASIZE];
//char outdata[(DATASIZE/2)+1];

static int indexTable[16] = {
    -1, -1, -1, -1, 2, 4, 6, 8,
    -1, -1, -1, -1, 2, 4, 6, 8,
};

static int stepsizeTable[89] = {
    7, 8, 9, 10, 11, 12, 13, 14, 16, 17,
    19, 21, 23, 25, 28, 31, 34, 37, 41, 45,
    50, 55, 60, 66, 73, 80, 88, 97, 107, 118,
    130, 143, 157, 173, 190, 209, 230, 253, 279, 307,
    337, 371, 408, 449, 494, 544, 598, 658, 724, 796,
    876, 963, 1060, 1166, 1282, 1411, 1552, 1707, 1878, 2066,
    2272, 2499, 2749, 3024, 3327, 3660, 4026, 4428, 4871, 5358,
    5894, 6484, 7132, 7845, 8630, 9493, 10442, 11487, 12635, 13899,
    15289, 16818, 18500, 20350, 22385, 24623, 27086, 29794, 32767
};

short indata[1024] = {
    -19360, 20792, -13446, 28862, -13834, -4038, 28855,
    9475, -17858, -22675, -13013, -4021, -15837, -5811,
    -27857, 3928, 6920, -20217, -19214, -12047, 25103,
    -28048, 26456, -22282, -20584, 21816, -4321, -8012,
    8968, -28833, -25533, 30842, -6453, -3353, -26716,
    3692, -3941, 17098, 26341, -8554, 513, 9006,
    19094, 12356, -21220, 14550, -9580, -15216, 24992,
    19420, -31569, 6715, -14815, 24989, -11890, -25920,
    -7791, 499, -27697, 1190, -9977, 7081, 25970,
    -22763, 17857, 15403, 6007, 17068, 26476, 3709,
    -2108, -23663, -18782, 21870, 4428, 18633, -25677,
    -10996, -13714, -21304, 19879, -8358, -31334, 843,
    7555, 30784, 10298, -32666, -20021, 17602, -21554,
    31960, -2488, -18060, 7513, 2982, -15349, 15405,
    -20741, -11034, -31311, 11514, -16417, 18907, 23527,
    2646, -426, -31166, -31184, 9367, 2116, 29419,
    5093, -27478, 11706, -630, 8573, 27138, 14820,
    31182, 9742, 17357, 26149, 32691, 5396, -13976,
    -9344, -9452, 22640, -18923, 26169, 24707, -6478,
    27627, 16315, -17572, -1638, 16909, 4796, -30441,
    10459, 542, -25186, 21982, -4829, 18676, -26856,
    20063, -12457, -16757, -18155, -17694, -14301, 22843,
    5596, -26723, -27727, 8237, 7024, -8633, -585,
    8459, -5831, 21738, 27063, -29450, -9245, -2563,
    7042, 12477, 29573, 17841, 1021, -17334, -2042,
    10379, 5671, -29345, 32700, 3890, 26714, -3710,
    15445, -29814, -23088, 4918, 12794, -23808, -27544,
    1643, -17231, 29223, -19798, -22474, -30718, -2684,
    12808, 17860, -8995, 2981, -11930, 16012, 27066,
    1144, 23516, 5572, -5887, 20953, -12358, -22763,
    18861, 11628, 29132, 29329, 15915, 18348, 20702,
    13284, 21895, -11196, -638, 14537, 714, -30819,
    31248, 10944, 13981, 22967, -22803, 16381, 28465,
    8764, -20720, 1955, 25186, 25042, 14530, 17713,
    -23014, -13136, 24228, -28868, -1293, 27252, -19210,
    -23202, 7456, 24370, -8427, -20114, 16269, -20016,
    31045, -6159, -27325, -23664, 23217, 15311, -29423,
    27885, 29615, 6473, -23704, 29611, -13241, 23594,
    -4474, 20009, 26357, -2756, -14121, 10233, 2990,
    -3331, 15767, 23474, 16160, -7790, 7099, 22020,
    -5570, -18948, -11503, 5644, 30203, -18295, 32678,
    -8472, 24404, 8844, -14489, -4466, -30828, 25424,
    28170, 19929, -15149, 16457, -15570, 3556, 30399,
    17548, 20160, -31077, 9118, 13184, 24481, 27278,
    24979, 29397, 24709, -15352, -28641, -24651, 5918,
    12128, 9706, -15558, 12664, -6514, -26941, -9697,
    -14938, 29184, 5605, -23623, -22626, 4782, -18308,
    -5081, -18079, 14700, -17305, -14904, -26274, -24706,
    -2242, 26093, 21272, -11151, -20075, -26417, -2554,
    21800, 29314, 195, 14009, -32716, 32604, -27477,
    32324, -1175, 5061, 4527, 3031, 24237, -27157,
    21549, 3245, 14355, 19210, -13331, -12760, -17113,
    20532, 32665, 28217, -17013, -9388, 21355, -20987,
    -21822, 2160, -30936, -13627, -14005, -18643, -24756,
    -32531, -8463, 15512, 11654, -25200, -3487, -4829,
    11366, -15870, -4099, -15636, -7596, 15806, 18415,
    -23483, 32708, 8842, -9857, 3696, -4953, -2344,
    -16471, 10410, 31012, -21905, -11542, -31894, 25991,
    -20150, -2982, 2026, 30073, 26816, 30207, -9242,
    625, 10980, 13407, 15779, 16746, -19410, 13654,
    -25550, -20522, -16550, -8150, 28661, -9262, -1136,
    8924, -26782, -1126, -16188, 6336, 15366, 2110,
    9823, 1615, -31795, 20373, 24606, -16836, -28032,
    -20110, -31430, -15420, -24690, -1003, 9673, -16822,
    9230, 7140, 21092, 4642, 25860, 4699, -1528,
    -19796, -8734, -6081, -15807, -32347, 20306, 3865,
    -17020, -12359, 30258, -6686, -23588, -11685, -20768,
    21754, 29129, 8921, 2230, -19105, -28316, -25942,
    -29224, 30490, -3641, 8458, -15572, 15100, -20309,
    15816, -23383, 21386, 14929, -31394, -24107, -7883,
    934, 12866, 24200, -562, 17057, 32635, 15349,
    -21704, 18672, -26506, -4630, 31070, 25810, 12825,
    -24490, 5991, 27718, 8472, 28940, 17448, 22117,
    -32376, 16838, -11814, -30964, 17329, 9835, -20212,
    -20291, 12839, -3180, 14042, 28870, -15077, -20148,
    4703, 2467, 22254, -2537, -23193, -8288, -29178,
    28213, -19351, -25662, 4069, 4903, -24141, 6375,
    -11913, -10382, -22553, 32556, -26454, -13662, -14427,
    12686, -31932, -1647, 23689, 29139, -22800, -28951,
    -29352, -8534, 7833, -2074, 2933, 12305, 6394,
    4448, -10855, -10762, -17291, -24312, -3646, 23841,
    -3036, -24847, 21100, -16816, 31278, 4946, 23294,
    -1117, -19621, -29559, -18553, -20422, 12265, 29027,
    31657, 30236, -6753, -19558, -17195, 18010, 30499,
    -22882, 7096, 14195, 7304, -360, -3852, 15866,
    299, 15275, 4371, -11402, 10942, 1404, 23480,
    -22648, 15781, 15092, -30186, -16557, -19840, -17852,
    -3930, -22761, 20744, 9513, 10260, -26081, 1054,
    9585, -11911, -15139, 23329, -2627, -5681, 1362,
    19583, 12935, 24737, -12877, 3470, 14182, -6654,
    3401, 5020, -29552, 9151, 17304, -28092, 10400,
    -10793, 8643, 2819, -30054, 30251, 24110, -15862,
    -4053, 28529, -24987, 11349, 11316, 2926, -25796,
    -21765, -7799, -28572, -7370, 10184, 9717, 16840,
    -8406, 26376, -11903, 14392, -733, 8869, -523,
    17579, 9608, 17012, 31391, 21225, -8580, -14901,
    14418, -194, -15993, 12886, -3663, 21354, 10101,
    -25558, -27731, -8485, 11902, -25830, 10827, -25059,
    32422, -16055, 21930, 26001, 28774, 26368, -29884,
    -15524, 31116, -8254, -22668, -29534, 1119, 27804,
    -27849, -30220, 5382, 32704, 566, -2298, 24873,
    9556, -29437, -13915, -16936, -23161, -21597, -3097,
    1964, -19482, 21580, 5539, -5845, -16404, 17007,
    20771, 9072, 15071, 10743, 14104, 15627, -6439,
    23251, -563, -17627, -31964, -26446, 30623, 18664,
    27083, 11021, 31916, 28957, -3475, 26986, -17461,
    -12778, -20908, 18397, 9915, -11315, -11835, -22574,
    28062, -26547, 24217, 28938, 15783, 15952, -7156,
    -18717, 14098, -6615, -6188, 28123, -12716, 18660,
    19573, 30038, -29548, 25003, 18643, -1633, 25433,
    -13974, -15096, 29228, 1923, -22346, 12407, -16347,
    -30849, 25578, 9505, 12583, -28490, 26003, 27703,
    27204, 6213, -21747, 14319, 32590, 23283, -2195,
    -22886, -17835, 26719, -12127, -7434, -10387, -21127,
    -21802, 30144, -18252, 12851, -6631, -25459, -10606,
    32375, -32192, -17958, -4030, 23131, -21237, 12897,
    -16239, -8814, -29051, 19374, -17690, -32219, -2128,
    -8208, 5249, 11875, -10400, -1260, -25081, 27158,
    -26265, -19185, 12605, 13047, -11278, -8837, -18668,
    9314, -6350, 19557, 2533, -6579, 29502, -5020,
    14332, 6006, -14281, -11794, -5542, 9947, -19284,
    -3098, -3146, -12177, 22080, 22904, 19397, 12554,
    -12150, -11991, -1349, -23136, 3644, -31447, -18160,
    -5707, -3962, 235, 18311, 10512, -28484, 31735,
    -15509, -1874, 30773, 32254, 31515, 27385, -3466,
    12334, 1737, -19654, -8816, -4152, -22146, 3147,
    -25402, -2578, 15968, -10608, 4466, 10433, 13879,
    8486, -16856, 27051, 26925, 4701, 30747, -2824,
    -16171, -7324, 19135, -22869, -402, 25410, 29104,
    14479, 8551, 13581, -29487, -12917, 12838, 15701,
    29368, 24122, 29956, -3360, 17737, -9541, 18844,
    -31076, -21344, 5573, 14917, 5841, 23604, -13059,
    -36, 24981, 17976, 25227, 32198, -21883, 8516,
    7146, -1484, -14415, 9268, -1537, 5801, -30248,
    7248, 32365, 19640, -3116, 16813, -3545, -3310,
    -2729, 28114, 326, 3776, -25385, -26467, -16357,
    29868, -2874, -16537, 28040, -155, 6, -26010,
    -31093, -8926, -30308, -15277, -229, 14855, -17501,
    14412, -19401, -13657, -20094, 18939, 27451, -1335,
    31073, 31734, -3468, -15249, 14552, -10136, 14071,
    29459, 26857, -20495, 25518, -10445, 23856, -7477,
    23987, -20976, -30120, 6189, 12768, 16817, 16337,
    -30733, 18342, -31442, -14145, 14974, 27933, 12586,
    10293, -7464, 4189, -23392, -7006, -18660, 14859,
    -29213, -26997, -5356, 7478, -24609, 11898, -20189,
    20579, -10332, 9782, -6811, 998, 5669, 4403,
    -14572, -13965
};



char outdata[(DATASIZE/2)+1];
//char outdata_original[(DATASIZE/2)+1];



void adpcm_coder(short* indata, char* outdata) {
	int i;
	  int len;
	  int sign;
	  int delta;
	  int step;
	  int valpred = 0;
	  int vpdiff;
	  int index = 0;
	  int bufferstep;
	  int outputbuffer = 0;
	  int diff;
	  int val;
	  step = stepsizeTable[index];
	  bufferstep = 1;
	  i=0;
	  for (len = 0 ; len < DATASIZE ; len++ ) {
	    val = indata[len];
	    diff = val - valpred;
	    sign = (diff < 0) ? 8 : 0;
	    if ( sign )
	        diff = (-diff);
	    delta = 0;
	    vpdiff = (step >> 3);
	    if ( diff >= step ) {
	      delta = 4;
	      diff -= step;
	      vpdiff += step;
	    }
	    step >>= 1;
	    if ( diff >= step  ) {
	      delta |= 2;
	      diff -= step;
	      vpdiff += step;
	    }
	    step >>= 1;
	    if ( diff >= step ) {
	      delta |= 1;
	      vpdiff += step;
	    }
	    if ( sign )
	      valpred -= vpdiff;
	    else
	      valpred += vpdiff;
	    if ( valpred > 32767 )
	      valpred = 32767;
	    else if ( valpred < -32768 )
	      valpred = -32768;
	    delta |= sign;
	    index += indexTable[delta];
	    if ( index < 0 )
	        index = 0;
	    if ( index > 88 )
	        index = 88;
	    step = stepsizeTable[index];
	    if ( bufferstep ) {
	      outputbuffer = (delta << 4) & 0xf0;
	    } else {
	      outdata[i] = (delta & 0x0f) | outputbuffer;
	      // Added this line, think it is a bug
      	  i++;
	    }
	    bufferstep = !bufferstep;
	  }
	  if ( !bufferstep )
	    outdata[i] = outputbuffer;
}

void adpcm_coder_adapted_mul(short* indata, char* outdata) {
	int i;
	  int len;
	  int sign;
	  int delta;
	  int step;
	  int valpred = 0;
	  int vpdiff;
	  int index = 0;
	  int bufferstep;
	  int outputbuffer = 0;
	  int diff;
	  int val;

	  int test, term;

	  step = stepsizeTable[index];
	  bufferstep = 1;
	  i=0;
	  for (len = 0 ; len < DATASIZE ; len++ ) {
	    val = indata[len];
	    diff = val - valpred;

	    test = diff < 0;
	    /*
	    test = ~test;
	    test++;
	    sign = (8&test) + (0&~test);
		*/
	    sign = 8*test | 0*!test;
	    //sign = 8*test + 0*!test;
	    //sign = (diff < 0) ? 8 : 0;

		test = sign != 0;
		diff = -diff*test | diff*!test;
		//diff = -diff*test + diff*!test;
		/*
	    if ( sign )
	        diff = (-diff);
	    */
	    delta = 0;
	    vpdiff = (step >> 3);

	    term = diff - step;
		test = term >= 0;
		// delta is zero at this point
	    delta = 4*test;
		diff -= step*test;
		vpdiff += step*test;
	    /*
	    if ( diff >= step ) {
	      delta = 4;
	      diff -= step;
	      vpdiff += step;
	    }
	    */

	    step >>= 1;

	    term = diff - step;
		test = term >= 0;
		delta |= 2*test;
		diff -= step*test;
    	vpdiff += step*test;
	    /*
	    if ( diff >= step  ) {
	      delta |= 2;
	      diff -= step;
	      vpdiff += step;
	    }
	    */

	    step >>= 1;

	    term = diff - step;
		test = term >= 0;
		delta |= 1*test;
    	vpdiff += step*test;
		/*
	    if ( diff >= step ) {
	      delta |= 1;
	      vpdiff += step;
	    }
	    */

	    test = sign != 0;
    	valpred += (vpdiff*!test) | (-vpdiff*test);
    	//valpred += vpdiff*!test - vpdiff*test;
    	/*
	    if ( sign )
	      valpred -= vpdiff;
	    else
	      valpred += vpdiff;
	    */


	    term = valpred - 32767;
		test = term > 0;
		valpred = 32767*test | valpred*!test;
		//valpred = 32767*test + valpred*!test;
		term = valpred + 32768;
		test = term < 0;
		valpred = -32768*test | valpred*!test;
		//valpred = -32768*test + valpred*!test;

		/*
	    if ( valpred > 32767 )
	      valpred = 32767;
	    else if ( valpred < -32768 )
	      valpred = -32768;
	    */

	    delta |= sign;
	    index += indexTable[delta];

	    test = index < 0;
		index = 0*test | index*!test;
		//index = 0*test + index*!test;
		/*
	    if ( index < 0 )
	        index = 0;
	    */
		term = index-88;
		test = term > 0;
		index = 88*test | index*!test;
		//index = 88*test + index*!test;
	    /*
	    if ( index > 88 )
	        index = 88;
	    */
	    step = stepsizeTable[index];

	    test = bufferstep != 0;
		outputbuffer = ((delta << 4) & 0xf0)*test | outputbuffer*!test;
		//outputbuffer = ((delta << 4) & 0xf0)*test + outputbuffer*!test;

		outdata[i] = (delta & 0x0f) | outputbuffer;
		i += 1*!test;
		/*
	    if ( bufferstep ) {
	      outputbuffer = (delta << 4) & 0xf0;
	    } else {
	      outdata[i] = (delta & 0x0f) | outputbuffer;
	      // Added this line, think it is a bug
      	  i++;
	    }
	    */

	    bufferstep = !bufferstep;
	  }
	  if ( !bufferstep )
	    outdata[i] = outputbuffer;
}


void adpcm_coder_adapted_and(short* indata, char* outdata) {
	int i;
	  int len;
	  int sign;
	  int delta;
	  int step;
	  int valpred = 0;
	  int vpdiff;
	  int index = 0;
	  int bufferstep;
	  int outputbuffer = 0;
	  int diff;
	  int val;

	  int test, test2, term;

	  step = stepsizeTable[index];
	  bufferstep = 1;
	  i=0;
	  for (len = 0 ; len < DATASIZE ; len++ ) {
	    val = indata[len];
	    diff = val - valpred;

	    test = diff < 0;
	    test = ~test;
	    test++;

	    sign = (8&test) + (0&~test);
	    //sign = (diff < 0) ? 8 : 0;

		test = sign != 0;
		test = ~test;
	    test++;
		diff = (-diff&test) + (diff&~test);
		/*
	    if ( sign )
	        diff = (-diff);
	    */
	    delta = 0;
	    vpdiff = (step >> 3);

	    term = diff - step;
		test = term >= 0;
		test = ~test;
	    test++;
		// delta is zero at this point
	    delta = 4&test;
		diff -= step&test;
		vpdiff += step&test;
	    /*
	    if ( diff >= step ) {
	      delta = 4;
	      diff -= step;
	      vpdiff += step;
	    }
	    */

	    step >>= 1;

	    term = diff - step;
		test = term >= 0;
		test = ~test;
	    test++;

		delta |= 2&test;
		diff -= step&test;
    	vpdiff += step&test;
	    /*
	    if ( diff >= step  ) {
	      delta |= 2;
	      diff -= step;
	      vpdiff += step;
	    }
	    */

	    step >>= 1;

	    term = diff - step;
		test = term >= 0;
		test = ~test;
	    test++;

		delta |= 1&test;
    	vpdiff += step&test;
		/*
	    if ( diff >= step ) {
	      delta |= 1;
	      vpdiff += step;
	    }
	    */

	    test = sign != 0;
	    test = ~test;
	    test++;

    	valpred += (vpdiff&~test) - (vpdiff&test);
    	/*
	    if ( sign )
	      valpred -= vpdiff;
	    else
	      valpred += vpdiff;
	    */


	    term = valpred - 32767;
		test = term > 0;
	    test = ~test;
	    test++;

		//valpred = (32767&test) + (valpred&!test);


		term = valpred + 32768;
		test2 = term < 0;
		//test2 = test2 & ~test;
		test2 = ~test2;
	    test2++;

		//valpred = (-32768&test2) + (valpred&~test2);

		//test2 = ~test & ~test2:
		valpred = (32767 & test) + (-32768 & (test2 & ~test)) + (valpred & (~test2 & ~test));
		/*
	    if ( valpred > 32767 )
	      valpred = 32767;
	    else if ( valpred < -32768 )
	      valpred = -32768;
		*/

	    delta |= sign;
	    index += indexTable[delta];

	    test = index < 0;
	    test = ~test;
	    test++;

		index = (0&test) + (index&~test);
		//index = 0*test + index*!test;
		/*
	    if ( index < 0 )
	        index = 0;
	    */
		term = index-88;
		test = term > 0;
		test = ~test;
	    test++;

		index = (88&test) + (index&~test);
		//index = 88*test + index*!test;
	    /*
	    if ( index > 88 )
	        index = 88;
	    */
	    step = stepsizeTable[index];

	    test = bufferstep != 0;
		test = ~test;
	    test++;

	    outputbuffer = (((delta << 4) & 0xf0)&test) + (outputbuffer&~test);
		//outputbuffer = ((delta << 4) & 0xf0)*test + outputbuffer*!test;

		outdata[i] = (delta & 0x0f) | outputbuffer;

		i += 1&~test;
		//i += 1*!test;
		/*
	    if ( bufferstep ) {
	      outputbuffer = (delta << 4) & 0xf0;
	    } else {
	      outdata[i] = (delta & 0x0f) | outputbuffer;
	      // Added this line, think it is a bug
      	  i++;
	    }
	    */

	    bufferstep = !bufferstep;
	  }
	  if ( !bufferstep )
	    outdata[i] = outputbuffer;
}


int main() {

	//int i;

	//adpcm_coder(indata, outdata_original);

	//adpcm_coder(indata, outdata);
	adpcm_coder_adapted_mul(indata, outdata);
	//adpcm_coder_adapted_and(indata, outdata);
/*
	for(i=0; i<(DATASIZE/2)+1; i++) {
		if(outdata_original[i] != outdata[i]) {
			while(1);
		}
	}
*/
	return 0;
}