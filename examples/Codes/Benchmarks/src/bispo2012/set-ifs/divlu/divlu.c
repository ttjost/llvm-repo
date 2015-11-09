/* Unsigned long division from "Hacker's Delight", H.S. Warren,  section 9-4 */

#define N 1000

#ifdef C
#include <stdio.h>
#endif

#include "input.txt"
#include "output_ref.txt"

unsigned output[N];

unsigned divlu(unsigned x, unsigned y, unsigned z)
{ /* Calcula divisão do número de 64 bits xy (concatenação) por z */
  int i;
  unsigned t;

  for ( i = 1; i <= 32; i++) {
    t = (int) x >> 31;
    x = ( x << 1) | (y>> 31);
    y = y << 1;
    if ((x | t) >= z) {
      x = x - z;
      y = y + 1;
    }
  }
  return y;
}


int main() {
  int i;
  //unsigned input1[N], input2[N], input3[N], output[N];

  for(i=0; i<N; i++) {
    //divlu(i, i, i-37);
    output[i] = divlu(input1[i], input2[i], input3[i]);
  }

  for(i=0; i < N; i++)
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

