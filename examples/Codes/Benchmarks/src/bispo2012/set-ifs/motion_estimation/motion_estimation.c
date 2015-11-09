#define nVERT 16
#define nHORZ 16
//#define CHAR_BIT 8

#ifdef C
#include <stdio.h>
#endif

#include <stdlib.h>

#include "input.txt"
#include "result_ref.txt"

/*
  Taken from here: http://blog.ivandemarino.me/2010/01/13/calculate-absint-without-branching/
*/
int abs_nobranch(const int value) {
   int A;
   int B;

   A = value >> sizeof(int);     // 0x00000000 if Positive, 0xFFFFFFFF if Negative
   B = -A;              // 0x00000000 if Positive, 0x00000001 if Negative
   return (value ^ A) + B;  // value ^ A = value if Positive, value ^ A = ~value if Negative
}

/*
// From http://www.geeksforgeeks.org/archives/2648
unsigned int cabs(int v) {
	//int v;           // we want to find the absolute value of v
	//unsigned int r;  // the result goes here
	int const mask = v >> (sizeof(int) * CHAR_BIT - 1);

	return (v + mask) ^ mask;
}
*/
void motion_estimation(int* x, int* y, int* result, int v, int h) {
//void motion_estimation(int x[][nHORZ+16], int y[][nHORZ+16], int result[][nHORZ], int v, int h) {
	int l, k, j, i, answer;
	int width = h + 16;
	int index;
	//int temp, mask;

	for(l=0; l<v; l++) {
		for(k=0; k<h; k++) {
			answer = 0;
			for(j=0; j<16; j++) {
				for(i=0; i<16; i++) {
					index = (l+j)*width+(k+i);
					//answer += abs(x[l+j][k+i] - y[l+j][k+i]);
					//answer += abs(x[(l+j-1)*width+(k+i)] - y[(l+j-1)*width+(k+i)]);
					answer += abs(x[index] - y[index]);
					//result[l][k] = answer;
					result[l*h+k] = answer;
				}
			}
		}
	}
}

int main() {

	int result[nVERT*nHORZ];

	motion_estimation(x, y, result, nVERT, nHORZ);

	int i;
	for (i = 0; i < (nVERT*nHORZ); i++)
	  {
	    if (result[i] != result_ref[i])
	      {
#ifdef C
		printf("%d, ", result[i]);
#endif
		return 666;
	      }
	  }

	#ifdef C
	printf ("-1\n");
	#endif
	return -1;
}
