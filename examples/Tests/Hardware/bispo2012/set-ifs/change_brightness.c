#include <stdio.h>
#include <stdlib.h>

typedef unsigned char Xuint8;
typedef unsigned long Xuint32;

//#define NROWS 256
//#define NCOLS 256
#define N_ELEM 100
#define N_DELTA 10

//Xuint8 image1[256]; Xuint8 imageR[256];

// Seed 0
Xuint8 image1[N_ELEM] = {
    96, 56, 122, -66, -10, 58, -73,
    3, 62, 109, 43, 75, 35, 77,
    47, 88, 8, 7, -14, -15, 15,
    112, 88, -10, -104, 56, 31, -76,
    8, 95, 67, 122, -53, -25, -92,
    108, -101, -54, -27, -106, 1, 46,
    -106, 68, 28, -42, -108, -112, -96,
    -36, -81, 59, 33, -99, -114, -64,
    -111, -13, -49, -90, 7, -87, 114,
    21, -63, 43, 119, -84, 108, 125,
    -60, -111, -94, 110, 76, -55, -77,
    12, 110, -56, -89, 90, -102, 75,
    -125, 64, 58, 102, -53, -62, -50,
    -40, 72, 116, 89, -90, 11, 45,
    -5, -26
};

// Seed 1
Xuint8 imageR[N_ELEM] = {
    115, -40, 111, -110, -4, -16, -27,
    -35, -43, 104, 114, 18, -70, 126,
    -76, -28, -79, -4, -87, 59, -127,
    -104, 61, 54, 100, -98, 36, 115,
    -5, -52, -22, -115, -127, 124, 71,
    -26, 67, 8, -73, -91, 79, 105,
    74, 2, 107, 33, -72, -64, 73,
    91, -72, -5, -8, 79, -111, 35,
    -100, -21, -16, 72, 97, -81, -4,
    -105, -84, -40, -88, 36, -109, -64,
    71, -23, -113, -124, 101, 14, 112,
    -25, -45, 106, -112, 117, 3, 73,
    75, -21, -106, 111, -82, -43, 51,
    93, 109, 121, -102, -46, 26, -13,
    -8, -108
};

// Seed 2
signed char deltas[N_DELTA] = {
    57, -8, -112, 23, -22, -51, 92,
    78, 15, 121
};


void change_brightness(Xuint8 *image, Xuint8 *imageR, int nelem, signed char delta);

void change_brightness(Xuint8 *image, Xuint8 *imageR, int nelem, signed char delta)
{
  Xuint8 abs_delta;
  int i, T;

  if (delta < 0)
    abs_delta = -delta;
  else
    abs_delta = delta;

  for (i = 0; i < nelem; i++, image++) {
  if (delta > 0) {
      T = *image + abs_delta;
      if (T > 255) T = 255;
      *imageR++ = (Xuint8) T;
    }
  else {
      T = *image - abs_delta;
      if (T < 0) T = 0;
      *imageR++ = (Xuint8) T;
    }
  }
  return;
}


int main() {

	int i;
	int nelem = N_ELEM;
	//signed char delta = 2;
	for(i=0; i<N_DELTA; i++) {
		change_brightness(image1, imageR, nelem, deltas[i]);
	}
	//change_brightness(image1, imageR, nelem, delta);

	return 0;
}
