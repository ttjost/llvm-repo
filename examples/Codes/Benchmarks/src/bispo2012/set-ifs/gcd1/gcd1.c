/* Fonte: http://www.azillionmonkeys.com/qed/asmexample.html */

#define N 1000

#ifdef C
#include <stdio.h>
#endif

#include "input.txt"
#include "output_ref.txt"

unsigned output[N];

unsigned int gcd (unsigned int a, unsigned int b)
{
    if (a == 0 &&b == 0)
        b = 1;
    else if (b == 0)
        b = a;
    else if (a != 0)
        while (a != b)
            if (a <b)
                b -= a;
            else
                a -= b;

    return b;
}


int main() {
	int i;
	//int input1[N], input2[N], output[N];

	for(i = 0; i < N ; i++) {
		//gcd(i, (i+1)*11);
		output[i] = gcd(input1[i], input2[i]);
		//printf("%d, ", output[i]);
	}

	for(i = 0; i < N; i++)
	  {
	    if(output[i] != output_ref[i])
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
