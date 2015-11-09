#define N 500

#ifdef C
#include <stdio.h>
#endif

#include "output_ref1.txt"

/* Mais geradores de números aleatórios */
/* Adaptados de: Source: http://random.mat.sbg.ac.at/publics/ftp/pub/software/gen/
   Ficheiro: external.c

*/

/* De: prng.h */

typedef unsigned long   prng_num;       /* Basic Numeric data type for all
                                           congruential generators. */
typedef signed   long   s_prng_num;     /* Signed version */

/* For the modular multiplication I need to know how many bits a
   prng_num is. If run on a 32 or 64 bit computer, the following clauses
   should suffice. If you get an error message, add an #elif command
   to test for your LONG_MAX and define PRNG_SAFE_MAX to be
   2^(bits in int/2 -1). For 32 bit systems, this is 2^15 = 32768.

   PRNG_MAX_MODULUS is the larges allowed modulus, it should be set to
   LONG_MAX + 1.
*/

/******************************************************************

      CTG

*******************************************************************/

/*
 * This generator was proposed by Pierre L'Ecuyer in 1995 in an
 * article titled "Maximally equidistributed combined Tausworthe generators".
 * (Not published yet, all I have is a preprint.)
 *
 * The following code is an adaption of the code printed there.
 *
 */

struct ctg_state {
  unsigned int  s1,s2,s3;
};

/*
 * prng_ctg_get_next_int: Return next ctg number (unscaled)
 *
 * Input:
 *      gen:  Pointer to a struct prng.
 *
 */
inline prng_num prng_ctg_get_next_int(struct ctg_state *g)
{
  unsigned int b;

  b     = (((g->s1 << 13) ^ g->s1) >> 19);
  g->s1 = (((g->s1 & 4294967294U) << 12) ^ b);
  b     = (((g->s2 << 2) ^ g->s2) >> 25);
  g->s2 = (((g->s2 & 4294967288U) << 4) ^ b);
  b     = (((g->s3 << 3) ^ g->s3) >> 11);
  g->s3 = (((g->s3 & 4294967280U) << 17) ^ b);

  return(g->s1 ^ g->s2 ^ g->s3);
}


/* Para usar:
   Valores de semente em ctg_state.s1, ctg_state.s2, ctg_state.s3
   Chamar prng_ctg_get_next_int( ... ) para obter o próximo número
*/

/* ---------------------------------------------------------------- *
*
 * This generator was proposed by L'Ecuyer, Blouin, and Couture.
 *
 * See:
 * "A search for good multiple recursive generators", ACM Trans. Model.
 * Comput. Simul. 3:87-98 (1993)
 *
 * The following code is an adaption of the code printed there, which is
 * optimized for 32 bit computers.
 *
 */

struct cmrg_state {
  int  x10, x11, x12, x20, x21, x22;
};

// Input
struct cmrg_state g;

/*
 * prng_cmrg_get_next_int: Return next cmrg number (unscaled)
 *
 * Input:
 *      gen:  Pointer to a struct prng.
 *
 */
inline prng_num prng_cmrg_get_next_int(struct cmrg_state *g)
{
  int h, p12, p13, p21, p23;

  /* Component 1 */
  h = g->x10 / 11714;
  p13 = 183326 * (g->x10 - h * 11714) - h * 2883;
  h = g->x11 / 33921;
  p12 = 63308 * (g->x11 - h * 33921) - h * 12979;
  if (p13 < 0)
    p13 = p13 + 2147483647U;
  if (p12 < 0)
    p12 = p12 + 2147483647U;
  g->x10 = g->x11;
  g->x11 = g->x12;
  g->x12 = p12 - p13;
  if (g->x12 < 0)
    g->x12 = g->x12+2147483647U;

  /* Component 2 */
  h = g->x20 / 3976;
  p23 = 539608 * (g->x20 - h * 3976) - h * 2071;
  h = g->x22 / 24919;
  p21 = 86098 * (g->x22 - h * 24919) - h * 7417;
  if (p23 < 0)
    p23 = p23 + 2145483479;
  if (p21 < 0)
    p21 = p21 + 2145483479U;
  g->x20 = g->x21;
  g->x21 = g->x22;
  g->x22 = p21 - p23;
  if (g->x22 < 0)
    g->x22 = g->x22+2145483479U;

  /* Combination */
  if (g->x12 < g->x22)
    return(g->x12 - g->x22 + 2147483647U);
  else
    return(g->x12 - g->x22);
}


/* Invocação semelhante à da outr função */
int main() {


  int i;
  unsigned long result[N];

	g.x10 = -1155484576;
	g.x11 =-723955400;
	g.x12 = 1033096058;
	g.x20 = -1690734402;
	g.x21 = -1557280266;
	g.x22 = 1327362106;

	for(i=0; i<N; i++)
	  {
	    result[i] = prng_cmrg_get_next_int(&g);
	  }

	int control, control1;
	for (i = 0; i < N; i++)
	  {
	    if (result[i] != output_ref1[i])
	      {
#ifdef C
		printf ("result %lu, ", result[i]);
#endif
	        return 666;
	      }
	  }

	#ifdef C
	printf ("-1\n");
	#endif
	
	return -1;
}
