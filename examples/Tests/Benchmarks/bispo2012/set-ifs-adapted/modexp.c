/* De CLRS, pg. 879  / Wikipedia: modular exponentiation */

typedef unsigned int uint32;

#define N_BASES 10
#define N_EXPONENT 10
#define N_MODULUS 10

// Seed 0
uint32 bases[N_BASES] = {
    -1155484576, -723955400, 1033096058,
    -1690734402, -1557280266, 1327362106,
    -1930858313, 502539523, -1728529858,
    -938301587
};

// Seed 1
uint32 exponents[N_EXPONENT] = {
    -1155869325, 431529176, 1761283695,
    1749940626, 892128508, 155629808,
    1429008869, -1465154083, -138487339,
    -1242363800
};


// Seed2
uint32 modulus[N_MODULUS] = {
    -1154715079, 1260042744, -423279216,
    17850135, 2133836778, -624140595,
    -60658084, 142959438, -613647601,
    -330177159
};

uint32 output[N_BASES*N_EXPONENT*N_MODULUS];
uint32 output_original[N_BASES*N_EXPONENT*N_MODULUS];

/* Pode ter overflow ... */
uint32 modular_pow(uint32 base, uint32 exponent, uint32 modulus)
{
  uint32 res = 1;
  while (exponent > 0) {
    if ((exponent & 1) == 1)
      res = (res * base) % modulus;
    exponent >>= 1;
    base = (base * base) % modulus;
  }
  return res;
}

/* Pode ter overflow ... */
uint32 modular_pow_adapted_mul(uint32 base, uint32 exponent, uint32 modulus)
{
  int condition;
  uint32 res = 1;

  while (exponent > 0) {
    condition = (exponent & 1) - 1;
    condition = condition == 0;
	res = ((res * base) % modulus)*condition | res*!condition;
    /*
    if (condition) {
		res = (res * base) % modulus;
	}
	*/

    exponent >>= 1;
    base = (base * base) % modulus;
  }
  return res;
}

//#include <stdio.h>
//#include <stdlib.h>

//int main(int argc, char **argv)
int main()
{
  //uint32 b, a,x, r;

  //uint32 r;

  //if (argc != 4)
  //  return 1;
  //b = atoi(argv[1]);
  //a = atoi(argv[2]);
  //x = atoi(argv[3]);

	int i, j, k;
/*
	for(i=0;i<N_BASES; i++) {
		for(j=0;j<N_EXPONENT; j++) {
			for(k=0;k<N_MODULUS; k++) {
				output_original[i+j+k] = modular_pow(bases[i], exponents[j], modulus[k]);
			}
		}
	}
*/
	for(i=0;i<N_BASES; i++) {
		for(j=0;j<N_EXPONENT; j++) {
			for(k=0;k<N_MODULUS; k++) {
				output[i+j+k] = modular_pow_adapted_mul(bases[i], exponents[j], modulus[k]);
			}
		}
	}
/*
 	for(i=0; i<	N_BASES*N_EXPONENT*N_MODULUS; i++) {
		if(output_original[i] != output[i]) {
			while(1);
		}
 	}
 	*/
  //r = modular_pow(6, 21, 1000);
  //r = modular_pow(6, 21, 657);
  //printf("%d^%d mod %d = %d\n", b, a, x, r);
  return 0;
}

/*
 Resultados confirmados
 modexp 6 21 1000    ---->  6^21 mod 1000 = 856
 modexp 6 21 657    ----->  6^21 mod 657 = 441
*/
//#endif
