#define N 2048

#ifdef C
#include <stdio.h>
#endif

#include "input.txt"

int output_ref[1] = {2144166293};

int max(int* v, int n) {
	int max=0, i;
	for (i=0; i<n; i++) {
		if (v[i] > max) {
			max = v[i];
		}
	}
	return max;
}

int main() {

	int output[1];

	output[0] = max(input, N);

	if (output[0] != output_ref[0])
	  {
#ifdef C
	    printf ("%d", output[0]);
#endif
	    return 666;
	  }

#ifdef C
	printf ("-1\n");
#endif

	return -1;
}

