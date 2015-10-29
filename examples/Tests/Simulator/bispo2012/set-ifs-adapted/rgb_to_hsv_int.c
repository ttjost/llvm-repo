/* Copyright (c) 2011 the authors listed at the following URL, and/or
the authors of referenced articles or incorporated external code:
http://en.literateprograms.org/RGB_to_HSV_color_space_conversion_(C)?action=history&offset=20110802173944

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Retrieved from: http://en.literateprograms.org/RGB_to_HSV_color_space_conversion_(C)?oldid=17206
*/

//#include <stdlib.h>
//#include <stdio.h>
#define N 500

//Seed 0
unsigned char r[N] = {
    96, 56, 122, -66, -10, 58, -73, 3, 62,
    109, 43, 75, 35, 77, 47, 88, 8, 7,
    -14, -15, 15, 112, 88, -10, -104, 56, 31,
    -76, 8, 95, 67, 122, -53, -25, -92, 108,
    -101, -54, -27, -106, 1, 46, -106, 68, 28,
    -42, -108, -112, -96, -36, -81, 59, 33, -99,
    -114, -64, -111, -13, -49, -90, 7, -87, 114,
    21, -63, 43, 119, -84, 108, 125, -60, -111,
    -94, 110, 76, -55, -77, 12, 110, -56, -89,
    90, -102, 75, -125, 64, 58, 102, -53, -62,
    -50, -40, 72, 116, 89, -90, 11, 45, -5,
    -26, -79, -6, -33, -37, -25, 86, 86, 66,
    48, -105, 68, -21, -27, -86, -70, -118, 125,
    2, -28, -50, 14, -51, 37, -77, 20, 104,
    -128, 20, 112, 21, 57, -125, -78, -21, -69,
    92, -102, 13, -68, 23, -37, 30, -98, -34,
    35, -12, 24, 95, 87, -117, 21, -30, 35,
    59, -36, -99, -79, 45, 112, 71, -73, 11,
    57, -22, -73, -10, -29, -3, -126, -67, -123,
    -79, -3, 74, 6, -117, 39, 95, -68, 50,
    90, -126, 85, -118, -48, 54, -6, 0, 104,
    107, -79, 39, -86, 54, 2, -124, 8, -60,
    -35, -91, 102, -116, -70, 120, -36, -60, 1,
    -39, -70, 21, -83, 108, -52, -111, 43, -84,
    -34, -28, -121, 68, -126, -55, -54, -99, 16,
    -64, -99, -73, -19, -3, 49, 60, 16, -93,
    98, -46, -62, 49, 26, -80, -92, 60, -13,
    116, -10, 94, 32, 50, 21, 110, -115, -48,
    69, -15, 67, -112, -79, -49, 17, -19, -81,
    73, 104, -85, 71, 42, -122, 41, -11, 60,
    -41, -7, -82, -3, -105, -78, 32, -110, -69,
    4, 62, -4, 17, 12, -5, -119, -90, -24,
    84, -116, 103, -114, -108, 80, 10, -39, -45,
    73, 46, -28, -65, -116, -64, -101, -98, -128,
    -95, -114, -109, -43, -123, 8, 31, -75, 30,
    96, -22, 58, 120, -114, -61, 31, -90, 0,
    -27, -71, -98, -82, 124, 39, 97, 108, 103,
    -56, 94, 126, 62, -19, 24, 113, -107, -49,
    6, 40, -126, -61, -71, 52, 92, -85, 68,
    105, -59, -81, -41, -83, -21, 45, -83, 19,
    10, -19, 40, 39, 52, -103, 57, -117, 84,
    107, 5, -62, 112, 40, -59, 75, 45, 76,
    -19, -15, -104, -122, -112, 97, 35, 102, 2,
    -3, -20, 84, -66, -17, 69, -60, -118, 127,
    112, -89, -40, -87, -86, 36, 111, -22, 106,
    -121, 74, 90, -22, 121, -64, -1, -26, 113,
    -28, 95, -93, 106, 46, 86, 50, -42, 90,
    42, -11, -46, -112, -36, 98, -102, -60, -64,
    6, 62, 95, 79, -51, -107, 30, 60, -128,
    114, 58, -60, -114, 21, -55, 74, 14, -28,
    100, 34, 4, 91, 8, -84, -30, 63, 65,
    -91, 82, 25, -124, -71, 50, -30, -36, 91,
    -32, -6, -55, -39, -74, 95, 100, -86, -40,
    26, -57, 10, 44, -4, -85, -56, -87, -118,
    81, 94, -43, 53, -90, 66, -120, -50, -95,
    123, -11, 56, -16, 118
};


//Seed 1
unsigned char g[N] = {
    115, -40, 111, -110, -4, -16, -27, -35, -43,
    104, 114, 18, -70, 126, -76, -28, -79, -4,
    -87, 59, -127, -104, 61, 54, 100, -98, 36,
    115, -5, -52, -22, -115, -127, 124, 71, -26,
    67, 8, -73, -91, 79, 105, 74, 2, 107,
    33, -72, -64, 73, 91, -72, -5, -8, 79,
    -111, 35, -100, -21, -16, 72, 97, -81, -4,
    -105, -84, -40, -88, 36, -109, -64, 71, -23,
    -113, -124, 101, 14, 112, -25, -45, 106, -112,
    117, 3, 73, 75, -21, -106, 111, -82, -43,
    51, 93, 109, 121, -102, -46, 26, -13, -8,
    -108, -108, -95, 124, 111, -68, -64, 41, 126,
    111, 87, -18, -88, -81, 83, -13, 109, 35,
    -13, 53, -30, -63, 102, 84, -7, -55, -79,
    -85, 6, -12, -42, -95, 126, -19, 50, 62,
    1, 0, 38, 1, -103, 16, -7, -17, 68,
    -50, -3, -17, -81, 40, -17, 85, 68, -2,
    -93, -69, 102, 27, -32, 23, -5, 98, -120,
    10, 42, 71, -4, 118, 101, -127, -66, 82,
    -87, -3, 87, -64, 4, 21, 122, 95, 88,
    1, 105, -34, 93, -115, -105, -47, -21, 12,
    -114, -57, 121, -116, 18, -101, -32, 74, -122,
    10, 101, 104, -113, -122, -11, -35, -10, 73,
    -78, -84, -46, -84, -82, 88, -26, -72, -11,
    -106, 71, -3, -47, 68, 66, -94, 72, -103,
    124, -67, -23, -98, 89, -28, -57, -35, -95,
    4, -58, 87, 97, 112, 21, -70, 15, 61,
    -6, -45, -15, -52, -44, 65, -66, -89, 94,
    107, -124, -111, 48, -77, -51, -41, -117, -21,
    -3, -20, 85, 7, -2, 52, 98, 20, 30,
    31, -12, 104, 55, 122, -123, 27, 15, 1,
    -61, -75, 2, 56, -37, 40, -34, 122, -6,
    0, 13, 82, 16, -40, -7, 9, -42, 16,
    -85, 127, 18, -68, -75, 62, 25, -33, 82,
    -53, -107, -40, -53, 63, -120, 27, 27, 23,
    -112, 36, -43, 71, 108, -87, 69, -108, -66,
    15, -42, 35, 18, 30, -77, 76, 30, -9,
    -81, -77, 75, 68, 105, -103, 116, -78, -85,
    111, -20, -100, 18, -84, -59, 8, -12, -33,
    79, -42, 125, 7, -33, 54, 27, 34, -47,
    90, 27, 3, -49, 108, -108, 104, 82, -62,
    -125, 75, 104, 80, 55, 120, -72, 94, -17,
    95, -61, 122, -63, 43, 108, -82, -68, 19,
    -71, -10, 81, -17, -37, -20, -18, 13, 107,
    -59, -21, 69, -10, -128, -87, 74, -69, 91,
    -8, 66, -78, -119, -71, -103, -48, 34, -60,
    18, -119, 91, 11, 30, -106, -10, -1, 113,
    -8, -5, 50, -47, 60, -88, 61, 48, -1,
    -91, -29, -3, -76, 123, 118, -74, -92, 71,
    121, -63, 54, -86, -122, 124, 112, 3, 114,
    -110, -67, -32, -82, -112, -16, -79, -17, -73,
    -120, -66, 17, 19, 53, 90, 56, -52, -101,
    88, 56, -69, 85, -66, 54, 64, 59, -72,
    -113, 82, -24, -49, -8, -42, 118, 90, -27,
    52, -117, 52, 47, 40, -103, -81, -16, -43,
    96, -57, -79, 31, -73
};


//Seed 2
unsigned char b[N] = {
    57, -8, -112, 23, -22, -51, 92, 78, 15,
    121, -100, -67, -12, -20, 36, 64, -73, 30,
    -123, 94, 44, 31, -114, 117, 1, 109, 21,
    55, 34, -123, -9, 84, 94, -68, 92, 120,
    74, 78, 63, 120, 101, -73, 45, -57, 124,
    65, 76, 46, 80, -34, -98, -68, 117, 55,
    -121, -6, 124, 4, -116, 99, 84, -99, 93,
    18, -19, -47, 21, -67, 29, -10, -65, -31,
    -57, 65, 27, 62, 57, 87, -94, -122, -42,
    35, -56, 80, -12, -22, -128, 82, 7, -100,
    5, -49, -2, 107, -42, 78, -19, -95, 1,
    -116, -21, -82, -92, -77, 61, -128, -80, -53,
    -77, 23, -16, 111, 82, 88, 73, -60, 50,
    32, 67, -89, -87, -101, -57, 37, -87, -41,
    42, 47, 102, -109, 106, -114, 59, 93, -74,
    20, -50, -37, 51, 19, 113, 104, -3, 19,
    -53, -30, 107, -66, -73, -63, -106, 31, 107,
    108, 28, 11, -35, -57, 33, -33, 97, 16,
    -106, 107, -106, -21, -67, 45, -125, -70, -20,
    -63, -4, 50, -112, -104, 74, 43, 116, -24,
    10, -74, 67, -29, 85, 116, 75, 42, 33,
    37, -125, -124, -26, 127, -49, -54, -124, 64,
    -127, 38, 99, -122, 35, 124, -37, 94, 115,
    39, -42, -102, -82, -24, -76, -26, 17, 26,
    110, 29, -100, 42, -3, -40, 25, 71, -4,
    72, 92, 85, -116, 69, -53, 38, 119, -90,
    32, -21, -105, -45, 109, -24, 120, -105, 96,
    102, 60, 58, -56, -18, -65, -50, 87, -77,
    -6, -55, -87, 79, -84, -44, -124, -78, 54,
    -31, 97, 87, -58, -125, 43, -73, -72, 121,
    70, 2, 56, -117, -46, 12, 43, -103, 48,
    -123, 79, -16, -60, 109, -96, -33, -4, -58,
    -3, -119, -111, -118, 11, -3, 13, -33, 89,
    -125, -116, -120, -59, 56, -58, -97, 29, -35,
    76, -127, 8, -21, 17, 8, 39, -22, 43,
    -1, 119, 2, -37, -46, -8, -46, -54, -123,
    -109, -128, -107, -25, 56, 16, -117, 6, 70,
    -7, -75, -27, 48, -11, 22, 108, 92, 24,
    51, -97, 78, 36, -43, 18, 5, 26, 12,
    -100, -91, 20, 119, 75, 85, 82, -61, -105,
    106, -111, 112, -39, -59, -93, -37, -3, 120,
    60, 120, 118, -81, 9, 94, 114, -51, 6,
    8, 78, -43, 16, 89, 76, 11, -71, -32,
    -125, -38, 91, 93, 22, -8, 111, -124, -88,
    -57, 31, 0, 15, -2, 25, -70, 71, -120,
    -91, 90, -88, -84, -7, 13, 91, 109, -53,
    -119, 10, 50, 40, 77, -42, -86, -124, 45,
    -114, -23, 17, 13, 29, -42, 83, -20, 66,
    -55, -12, 36, -121, 112, -44, -17, 107, -14,
    100, 45, -31, 85, 52, 99, -3, 36, -55,
    6, -20, 75, -76, -6, 37, 70, -33, 85,
    -34, 122, 41, 103, -64, -30, 53, -2, -35,
    -18, 127, -27, -31, -89, -81, -82, -121, 22,
    49, -79, 79, -26, 5, 84, 109, 72, -45,
    -117, 4, 22, 66, -94, -109, 59, -119, 58,
    -81, 81, 69, -112, -14
};



#define MIN3(x,y,z)  ((y) <= (z) ? \
                         ((x) <= (y) ? (x) : (y)) \
                     : \
                         ((x) <= (z) ? (x) : (z)))

#define MAX3(x,y,z)  ((y) >= (z) ? \
                         ((x) >= (y) ? (x) : (y)) \
                     : \
                         ((x) >= (z) ? (x) : (z)))

unsigned char min3(unsigned char a, unsigned char b, unsigned char c) {
	int condition1, condition2, condition3;
	unsigned char result;

	asm("cmpu %0,%1,%2": "=r" (condition1): "r" (c), "r" (b));
	condition1 = condition1 <= 0;
	asm("cmpu %0,%1,%2": "=r" (condition2): "r" (b), "r" (a));
	condition2 = condition2 <= 0;
	asm("cmpu %0,%1,%2": "=r" (condition3): "r" (c), "r" (a));
	condition3 = condition3 <= 0;

	result = a*(condition1 & condition2) | b*(condition1 & !condition2) | a*(!condition1 & condition3) | c*(!condition1 & !condition3);
	//result = a*(condition1 & condition2) + b*(condition1 & !condition2) + a*(!condition1 & condition3)+ c*(!condition1 & !condition3);
	return result;
}

unsigned char max3(unsigned char a, unsigned char b, unsigned char c) {
	int condition1, condition2, condition3;
	unsigned char result;

	asm("cmpu %0,%1,%2": "=r" (condition1): "r" (c), "r" (b));
	condition1 = condition1 >= 0;
	asm("cmpu %0,%1,%2": "=r" (condition2): "r" (b), "r" (a));
	condition2 = condition2 >= 0;
	asm("cmpu %0,%1,%2": "=r" (condition3): "r" (c), "r" (a));
	condition3 = condition3 >= 0;

	result = a*(condition1 & condition2) | b*(condition1 & !condition2) | a*(!condition1 & condition3) | c*(!condition1 & !condition3);
	//result = a*(condition1 & condition2) + b*(condition1 & !condition2) + a*(!condition1 & condition3)+ c*(!condition1 & !condition3);
	return result;
}

//struct rgb_color {
//    unsigned char r, g, b;    /* Channel intensities between 0 and 255 */
//};


struct hsv_color {
    unsigned char hue;        /* Hue degree between 0 and 255 */
    unsigned char sat;        /* Saturation between 0 (gray) and 255 */
    unsigned char val;        /* Value between 0 (black) and 255 */
};

// output
struct hsv_color hsv[N];
struct hsv_color hsv_original[N];


struct hsv_color rgb_to_hsv(unsigned char r, unsigned char g, unsigned char b) {
//struct hsv_color rgb_to_hsv(struct rgb_color rgb) {
    struct hsv_color hsv;
    unsigned char rgb_min, rgb_max;
    rgb_min = MIN3(r, g, b);
    rgb_max = MAX3(r, g, b);

    hsv.val = rgb_max;
    if (hsv.val == 0) {
        hsv.hue = hsv.sat = 0;
        return hsv;
    }

    hsv.sat = 255 * ((long)(rgb_max - rgb_min))/hsv.val;
    if (hsv.sat == 0) {
        hsv.hue = 0;
        return hsv;
    }

    /* Compute hue */

    if (rgb_max == r) {
        hsv.hue = 0 + 43*(g - b)/(rgb_max - rgb_min);
    } else if (rgb_max == g) {
        hsv.hue = 85 + 43*(b - r)/(rgb_max - rgb_min);
    } else  { // rgb_max == rgb.b
        hsv.hue = 171 + 43*(r - g)/(rgb_max - rgb_min);
    }

    return hsv;
}

struct hsv_color rgb_to_hsv_adapted_mul(unsigned char r, unsigned char g, unsigned char b) {
//struct hsv_color rgb_to_hsv(struct rgb_color rgb) {
    struct hsv_color hsv;
    unsigned char rgb_min, rgb_max;
    int condition1, condition2;
    //unsigned char temp;

    rgb_min = min3(r, g, b);
    rgb_max = max3(r, g, b);

    hsv.val = rgb_max;
    if (hsv.val == 0) {
        hsv.hue = hsv.sat = 0;
        return hsv;
    }

    hsv.sat = 255 * ((long)(rgb_max - rgb_min))/hsv.val;
    if (hsv.sat == 0) {
        hsv.hue = 0;
        return hsv;
    }

    /* Compute hue */
	asm("cmpu %0,%1,%2": "=r" (condition1): "r" (r), "r" (rgb_max));
	condition1 = condition1 == 0;
	asm("cmpu %0,%1,%2": "=r" (condition2): "r" (g), "r" (rgb_max));
	condition2 = condition2 == 0;
	condition2 = condition2 & !condition1;
/*
	hsv.hue = (0 + 43*(g - b)/(rgb_max - rgb_min))*condition1 + (85 + 43*(b - r)/(rgb_max - rgb_min))*condition2 +
	(171 + 43*(r - g)/(rgb_max - rgb_min))*(!condition1 & !condition2);
*/
	//temp = (g - b)*condition1 + (b - r)*condition2 + (r - g)*(!condition1 & !condition2);
	//temp = 43*temp;
	//temp = temp / (rgb_max - rgb_min);
	hsv.hue = 43*((g - b)*condition1 | (b - r)*condition2 | (r - g)*(!condition1 & !condition2))/(rgb_max - rgb_min) +
	(85*condition2 | 171*(!condition1 & !condition2));
	//hsv.hue = 43*((g - b)*condition1 + (b - r)*condition2 + (r - g)*(!condition1 & !condition2))/(rgb_max - rgb_min) +
	//85*condition2 + 171*(!condition1 & !condition2);
/*
    hsv.hue = (0 + 43*(g - b))*condition1 + (85 + 43*(b - r))*condition2 + (171 + 43*(r - g))*(!condition1 & !condition2);
    hsv.hue = hsv.hue / rgb_max - rgb_min;
    */
/*
	if (condition1) {
    //if (rgb_max == r) {
        hsv.hue = 0 + 43*(g - b)/(rgb_max - rgb_min);
    } else if (condition2) {
    //} else if (rgb_max == g) {
        hsv.hue = 85 + 43*(b - r)/(rgb_max - rgb_min);
    } else  { // rgb_max == rgb.b
        hsv.hue = 171 + 43*(r - g)/(rgb_max - rgb_min);
    }
*/
    return hsv;
}

int main() {
//int main(int argc, char* argv[]) {
    //struct rgb_color rgb;

    int i;
    //rgb.r = (unsigned char)atoi(argv[1]);
    //rgb.g = (unsigned char)atoi(argv[2]);
    //rgb.b = (unsigned char)atoi(argv[3]);
/*
    for(i=0;i<N;i++) {
		hsv_original[i] = rgb_to_hsv(r[i], g[i], b[i]);
	}
*/
    for(i=0;i<N;i++) {
		hsv[i] = rgb_to_hsv_adapted_mul(r[i], g[i], b[i]);
	}
    //hsv = rgb_to_hsv(rgb);
/*
 	for(i=0; i<N; i++) {
		if(hsv_original[i].hue != hsv[i].hue) {
			while(1);
		}

		if(hsv_original[i].sat != hsv[i].sat) {
			while(1);
		}

		if(hsv_original[i].val != hsv[i].val) {
					while(1);
		}
 	}
*/
    //printf("Hue: %d\nSaturation: %d\nValue: %d\n\n", hsv.hue, hsv.sat, hsv.val);
    return 0;
}

