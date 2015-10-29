#define N 32 // 512 originally

short in[N] = {
    -19360, 20792, -13446, 28862, -13834, -4038, 28855,
    9475, -17858, -22675, -13013, -4021, -15837, -5811,
    -27857, 3928, 6920, -20217, -19214, -12047, 25103,
    -28048, 26456, -22282, -20584, 21816, -4321, -8012,
    8968, -28833, -25533, 30842
};



void doSmooth(short* IN, short* OUT, int DIM) {

      int row;
      int col;
      int wrow;
      int wcol;

           short K[]  =  {1, 2, 1, 2, 4, 2, 1, 2, 1};
           for (row=0; row < DIM-3+1; row++) {
              for (col = 0; col< DIM-3+1; col++) {
                 int sumval = 0;
                 for (wrow=0; wrow < 3; wrow++) {
                    for (wcol = 0; wcol<3; wcol++) {
                              sumval += IN[(row +wrow)*DIM+(col+wcol)]*K[wrow*3+wcol];
                    }
                 }
                 sumval = sumval / 16;
                 OUT[row * DIM + col] =  (short) sumval;
              }
           }

    //return 0;
}


int main() {

	//int result;
	short out[N];
	doSmooth(in, out, N);

	//return result
	return 0;
}
