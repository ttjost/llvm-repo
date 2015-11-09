/* integer square root from "Hacker's Delight", H.S. Warren,  section 11-1 */
/* http://www.hackersdelight.org/
 */

#define N 1000

#ifdef C
#include <stdio.h>
#endif

#include "input.txt"
#include "output_ref.txt"

int output[N];


int isqrt4(unsigned x) {
   unsigned m, y, b;

   m = 0x40000000;
   y = 0;
   while(m != 0) {              // Do 16 times.
      b = y | m;
      y = y >> 1;
      if (x >= b) {
         x = x - b;
         y = y | m;
      }
      m = m >> 2;
   }
   return y;
}

int main() {
	int i;
	//unsigned input[N];
	//int output[N];

	for(i=0; i<N; i++) {
		//isqrt4(i);
		output[i] = isqrt4(input[i]);
	}

	for (i = 0; i < N; i++)
	  {
	    if (output[i] != output_ref[i])
	      {
		#ifdef C
		printf("%d, ", output[i]);
		#endif
		return 666;
	      }
	  }

	#ifdef C
	printf("-1\n");
	#endif
	
	return -1;
}

