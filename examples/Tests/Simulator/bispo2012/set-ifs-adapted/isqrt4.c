#define LOOP_COUNT 100

short input[LOOP_COUNT] = {
    -10893, -25384, 3695, -1646, -13060, -18192, -3611,
    -31267, -9771, 2152, -6798, -18414, 23482, 7038,
    1204, -20764, 23985, 3324, -25175, -15813, 14209,
    30872, -3779, 31286, 21092, -3170, -5852, 29299,
    1275, -5172, -10518, -21107, -17791, 4220, -28601,
    7398, -9917, -22008, 31927, 24741, 7247, -31895,
    26698, 1026, 21611, 18977, 12216, -17984, -15287,
    -30629, -26184, 23803, -29704, -25265, -3695, -17885,
    -10340, 22507, 14064, 25672, -15007, 6063, -2308,
    6807, 13996, -26664, 8872, -32220, 147, -14144,
    30279, 14313, 12175, 23428, 18021, 32526, 21104,
    -7193, -14893, 3946, 144, -19339, 6403, -14263,
    3915, -10005, -13674, 19311, 10926, -11563, 30003,
    -15267, -14995, -903, -18790, 24530, -27622, -18957,
    -16392, 14228
};



short ssqrt(short vsqn) {
	int i;
	short vsq = vsqn, asq = 0, a = 0, tvsq = 0;
	for (i = 0; i < 6; i++) {
		short nasq = (short) (((asq+a) << 2) | 1);
		short sa = (short) (a << 1);
		tvsq = (short) ((tvsq << 2) | ((vsq >> 10) & 3));
		vsq = (short) (vsq << 2);
		if (nasq <= tvsq) {
			a = (short) (sa | 1);
			asq = nasq;
		} else {
			a = sa;
			asq = (short) (asq << 2);
		}
	}
	return a;
}

short ssqrt_adapted_mul(short vsqn) {
	int i;
	short vsq = vsqn, asq = 0, a = 0, tvsq = 0;
	int condition;

	for (i = 0; i < 6; i++) {
		short nasq = (short) (((asq+a) << 2) | 1);
		short sa = (short) (a << 1);
		tvsq = (short) ((tvsq << 2) | ((vsq >> 10) & 3));
		vsq = (short) (vsq << 2);

		asm("cmp %0,%1,%2": "=r" (condition): "r" (tvsq), "r" (nasq)) ;
		condition = condition <= 0;

		a = ((short) (sa | 1))*condition | sa*!condition;
		asq = nasq*condition | ((short) (asq << 2))*!condition;
		//a = ((short) (sa | 1))*condition + sa*!condition;
		//asq = nasq*condition + ((short) (asq << 2))*!condition;
		/*
		if (nasq <= tvsq) {
			a = (short) (sa | 1);
			asq = nasq;
		} else {
			a = sa;
			asq = (short) (asq << 2);
		}
		*/
	}
	return a;
}



int main() {

	short output[LOOP_COUNT];
	//short output_original[LOOP_COUNT];

	int i;

/*
	for(i=0; i<LOOP_COUNT; i++) {
		output_original[i] = ssqrt(input[i]);
	}
*/
	for(i=0; i<LOOP_COUNT; i++) {
		output[i] = ssqrt_adapted_mul(input[i]);
	}
/*
 	for(i=0; i<LOOP_COUNT; i++) {
		if(output_original[i] != output[i]) {
			while(1);
		}
 	}
*/
	return 0;
}
