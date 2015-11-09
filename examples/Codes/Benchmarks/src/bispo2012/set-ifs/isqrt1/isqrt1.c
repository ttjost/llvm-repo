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

int isqrt1(unsigned x) {
   unsigned x1;
   int s, g0, g1;

   if (x <= 1) return x;
   s = 1;
   x1 = x - 1;
   if (x1 > 65535) {s = s + 8; x1 = x1 >> 16;}
   if (x1 > 255)   {s = s + 4; x1 = x1 >> 8;}
   if (x1 > 15)    {s = s + 2; x1 = x1 >> 4;}
   if (x1 > 3)     {s = s + 1;}

   g0 = 1 << s;                // g0 = 2**s.
   g1 = (g0 + (x >> s)) >> 1;  // g1 = (g0 + x/g0)/2.

   while (g1 < g0) {           // Do while approximations
      g0 = g1;                 // strictly decrease.
      g1 = (g0 + (x/g0)) >> 1;
   }
   return g0;
}


int main() {
  int i;

  
  for(i=0; i<N; i++)
    {
      output[i] = isqrt1(input[i]);
    }
  
  for(i = 0; i < N; i++)
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

