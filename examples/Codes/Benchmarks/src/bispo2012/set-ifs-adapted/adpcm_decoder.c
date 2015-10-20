#define DATASIZE 1024

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


short indata[(DATASIZE/2)+1] = {
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
    -32376, 16838
};


char outdata[DATASIZE];
//char outdata_original[DATASIZE];

void adpcm_decoder(short* indata, char* outdata) {
	  int i;
	  int len;
	  int sign;
	  int delta;
	  int step;
	  int valpred = 0;
	  int vpdiff;
	  int index = 0;
	  int bufferstep;
	  int inputbuffer = 0;
	  step = stepsizeTable[index];
	  bufferstep = 0;
	  i=0;
	  for (len = 0 ; len < DATASIZE ; len++ ) {
	    if ( bufferstep ) {
	      delta = inputbuffer & 0xf;
	    }
	    else {
	      inputbuffer = indata[i];
	      i++;
	      delta = (inputbuffer >> 4) & 0xf;
	    }
	    bufferstep = !bufferstep;
	    index += indexTable[delta];
	    if ( index < 0 )
	    	index = 0;
	    if ( index > 88 )
	    	index = 88;
	    sign = delta & 8;
	    delta = delta & 7;
	    vpdiff = step >> 3;
	    if ( delta & 4 )
	    	vpdiff += step;
	    else
	    	if ( delta & 2 )
	    		vpdiff += step>>1;
	    	else
	    		if ( delta & 1 )
	    			vpdiff += step>>2;
	    if ( sign )
	      valpred -= vpdiff;
	    else
	      valpred += vpdiff;
	    if ( valpred > 32767 )
	      valpred = 32767;
	    else if ( valpred < -32768 )
	      valpred = -32768;
	    step = stepsizeTable[index];
	    outdata[len] = valpred;
	  }
}

void adpcm_decoder_adapted_mul(short* indata, char* outdata) {
	  int i;
	  int len;
	  int sign;
	  int delta;
	  int step;
	  int valpred = 0;
	  int vpdiff;
	  int index = 0;
	  int bufferstep;
	  int inputbuffer = 0;

	  int test, test2, test3, term;

	  step = stepsizeTable[index];
	  bufferstep = 0;
	  i=0;
	  for (len = 0 ; len < DATASIZE ; len++ ) {

	    test = bufferstep != 0;
		inputbuffer = indata[i]*!test + inputbuffer*test;
		i += 1*!test;
    	delta = (inputbuffer & 0xf)*test | ((inputbuffer >> 4) & 0xf)*!test;
    	//delta = (inputbuffer & 0xf)*test + ((inputbuffer >> 4) & 0xf)*!test;
    	/*
	    if ( bufferstep ) {
	      delta = inputbuffer & 0xf;
	    }
	    else {
	      inputbuffer = indata[i];
	      i++;
	      delta = (inputbuffer >> 4) & 0xf;
	    }
	    */

	    bufferstep = !bufferstep;
	    index += indexTable[delta];

	    test = index < 0;
		index = test*0 | !test*index;
		//index = test*0 + !test*index;
		/*
	    if ( index < 0 )
	    	index = 0;
	    */

	    term = index - 88;
		test = term > 0;
		index = test*88 | !test*index;
    	//index = test*88 + !test*index;
	    /*
	    if ( index > 88 )
	    	index = 88;
	    */

	    sign = delta & 8;
	    delta = delta & 7;
	    vpdiff = step >> 3;


	    term = delta & 4;
		test = term != 0;
		//vpdiff += step*test;
		term = delta & 2;
		test2 = term != 0;
		test2 = test2 & (!test);
		//test2 = test2 & (test == 0);
		//vpdiff += (step>>1)*test2;
		term = delta & 1;
		test3 = term != 0;
		//test3 = test3 & (test2 == 0) & (test == 0);
		test3 = test3 & (!test2) & (!test);
		//vpdiff += (step>>2)*test3;

		vpdiff += step*test | (step>>1)*test2 | (step>>2)*test3;
		/*
	    if ( delta & 4 )
	    	vpdiff += step;
	    else
	    	if ( delta & 2 )
	    		vpdiff += step>>1;
	    	else
	    		if ( delta & 1 )
	    			vpdiff += step>>2;
	    */

	    test = sign != 0;
		valpred += (-vpdiff)*test | vpdiff*!test;
		//valpred += (-vpdiff)*test + vpdiff*!test;
	    /*
	    if ( sign )
	      valpred -= vpdiff;
	    else
	      valpred += vpdiff;
	    */
		term = valpred - 32767;
		test = term > 0;
		//valpred = 32767*test + valpred*!test;
		valpred = 32767*test | valpred*!test;
		term = valpred+32768;
		test = term < 0;
		valpred = -32768*test | valpred*!test;
		//valpred = -32768*test + valpred*!test
		/*
	    if ( valpred > 32767 )
	      valpred = 32767;
	    else if ( valpred < -32768 )
	      valpred = -32768;
	    */
	    step = stepsizeTable[index];
	    outdata[len] = valpred;
	  }
}

int main() {

	//int i;

//	adpcm_decoder(indata, outdata_original);
	adpcm_decoder_adapted_mul(indata, outdata);
/*
	for(i=0; i<DATASIZE; i++) {
		if(outdata[i] != outdata_original[i]) {
			while(1);
		}
	}
*/
	return 0;

}
