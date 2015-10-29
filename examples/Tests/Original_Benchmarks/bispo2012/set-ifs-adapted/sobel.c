#define COLS 32
#define ROWS 32

const unsigned char in[COLS*ROWS] = {
    96, 56, 122, -66, -10, 58, -73, 3, 62, 109, 43, 75, 35, 77, 47, 88, 8, 7, -14, -15,
    15, 112, 88, -10, -104, 56, 31, -76, 8, 95, 67, 122, -53, -25, -92, 108, -101, -54, -27, -106,
    1, 46, -106, 68, 28, -42, -108, -112, -96, -36, -81, 59, 33, -99, -114, -64, -111, -13, -49, -90,
    7, -87, 114, 21, -63, 43, 119, -84, 108, 125, -60, -111, -94, 110, 76, -55, -77, 12, 110, -56,
    -89, 90, -102, 75, -125, 64, 58, 102, -53, -62, -50, -40, 72, 116, 89, -90, 11, 45, -5, -26,
    -79, -6, -33, -37, -25, 86, 86, 66, 48, -105, 68, -21, -27, -86, -70, -118, 125, 2, -28, -50,
    14, -51, 37, -77, 20, 104, -128, 20, 112, 21, 57, -125, -78, -21, -69, 92, -102, 13, -68, 23,
    -37, 30, -98, -34, 35, -12, 24, 95, 87, -117, 21, -30, 35, 59, -36, -99, -79, 45, 112, 71,
    -73, 11, 57, -22, -73, -10, -29, -3, -126, -67, -123, -79, -3, 74, 6, -117, 39, 95, -68, 50,
    90, -126, 85, -118, -48, 54, -6, 0, 104, 107, -79, 39, -86, 54, 2, -124, 8, -60, -35, -91,
    102, -116, -70, 120, -36, -60, 1, -39, -70, 21, -83, 108, -52, -111, 43, -84, -34, -28, -121, 68,
    -126, -55, -54, -99, 16, -64, -99, -73, -19, -3, 49, 60, 16, -93, 98, -46, -62, 49, 26, -80,
    -92, 60, -13, 116, -10, 94, 32, 50, 21, 110, -115, -48, 69, -15, 67, -112, -79, -49, 17, -19,
    -81, 73, 104, -85, 71, 42, -122, 41, -11, 60, -41, -7, -82, -3, -105, -78, 32, -110, -69, 4,
    62, -4, 17, 12, -5, -119, -90, -24, 84, -116, 103, -114, -108, 80, 10, -39, -45, 73, 46, -28,
    -65, -116, -64, -101, -98, -128, -95, -114, -109, -43, -123, 8, 31, -75, 30, 96, -22, 58, 120, -114,
    -61, 31, -90, 0, -27, -71, -98, -82, 124, 39, 97, 108, 103, -56, 94, 126, 62, -19, 24, 113,
    -107, -49, 6, 40, -126, -61, -71, 52, 92, -85, 68, 105, -59, -81, -41, -83, -21, 45, -83, 19,
    10, -19, 40, 39, 52, -103, 57, -117, 84, 107, 5, -62, 112, 40, -59, 75, 45, 76, -19, -15,
    -104, -122, -112, 97, 35, 102, 2, -3, -20, 84, -66, -17, 69, -60, -118, 127, 112, -89, -40, -87,
    -86, 36, 111, -22, 106, -121, 74, 90, -22, 121, -64, -1, -26, 113, -28, 95, -93, 106, 46, 86,
    50, -42, 90, 42, -11, -46, -112, -36, 98, -102, -60, -64, 6, 62, 95, 79, -51, -107, 30, 60,
    -128, 114, 58, -60, -114, 21, -55, 74, 14, -28, 100, 34, 4, 91, 8, -84, -30, 63, 65, -91,
    82, 25, -124, -71, 50, -30, -36, 91, -32, -6, -55, -39, -74, 95, 100, -86, -40, 26, -57, 10,
    44, -4, -85, -56, -87, -118, 81, 94, -43, 53, -90, 66, -120, -50, -95, 123, -11, 56, -16, 118,
    -22, 94, -46, 25, 86, 103, 70, 24, 12, 40, 101, -120, -58, -38, 12, -79, 107, 12, -67, 39,
    -108, -38, -58, 27, 76, 95, -93, -18, 23, 103, -96, 6, 53, 105, -62, -27, 39, -77, -25, 119,
    114, -25, 44, -86, -94, -91, -114, 68, -111, -119, -45, -16, -23, 88, -86, -103, -26, 117, 17, -6,
    96, -103, -10, 117, 8, -62, 33, 36, -15, 108, 80, 46, 82, -2, -93, 91, -119, -121, 58, -23,
    99, -87, 28, -97, -102, -43, 90, 35, -98, -72, 115, -120, -104, -12, -6, 43, -85, 19, 118, -66,
    124, -72, -120, -91, -12, 22, 83, -128, 68, -90, 23, 8, 41, 20, 31, 30, 113, 121, -35, 33,
    -67, -49, 82, 127, -121, -95, -77, -114, 102, 2, 73, -100, -112, -65, -104, 68, -96, -41, -61, 3,
    -102, 43, 46, 10, 43, 113, 101, 85, 52, 110, 60, -5, -119, 100, 54, -56, -11, -56, 42, 8,
    -127, 56, 35, -91, -11, -85, -120, 116, -97, -23, 124, -53, 82, 62, -121, 86, -79, 106, 117, 42,
    -83, -37, 126, 26, 75, 29, -90, 73, -86, -111, 102, 0, 68, 92, -116, -62, 116, -94, 95, -100,
    55, -12, 6, -64, 54, 6, 41, 84, 3, -91, -40, -121, -93, -25, -84, -26, 76, -93, 43, -20,
    111, 35, 112, -33, -9, 24, 11, -39, -45, -51, 37, 36, -78, -97, -24, -53, 13, -84, 29, 109,
    106, -53, 22, 84, -35, -69, -51, -59, -46, -98, 77, -103, 10, -89, 80, 12, -29, 18, 41, -44,
    -37, 84, -28, 117, 86, -108, -85, -45, -97, 89, 106, 8, 44, -125, -74, 119, 37, 127, -22, 33,
    39, -74, -109, 55, 68, 69, 13, -17, 78, -13, 109, -102, 85, 95, -95, -10, 109, 121, -42, -64,
    -76, 51, 25, -115, -110, 119, 64, -38, 66, 91, 11, 97, -111, -110, -123, -82, -26, 37, -80, -16,
    -127, 99, 96, 20, 7, 22, 103, 15, 61, -9, -14, 123, 20, 98, 50, 101, -27, 77, 62, 100,
    -4, 118, 55, -18, 90, -37, -84, -26, -74, 111, 64, 120, -59, 10, -118, 41, -69, -96, 60, 41,
    16, -75, -122, -21, -121, 16, -68, -9, 107, -82, 53, -2, 27, -7, 118, 46, -55, 58, -112, -56,
    126, 75, -58, -18, 96, -112, 114, -63, 55, 38, 40, -85, 45, 93, 27, -8, -43, 100, -65, -85,
    110, 66, -80, -113, 103, 13, -47, -117, 38, 85, -72, 58, 4, -32, 73, -69, -100, -100, -96, -59,
    69, -47, 52, -3, -36, -107, 56, -117, -58, -123, 68, -22, 52, -79, 52, -1, -87, -40, 80, 109,
    -72, -44, -83, 39, 18, 87, -46, 70, -64, -41, -99, 27, -84, -58, 103, -120, 101, 6, 102, -117,
    34, -100, 83, 27, 7, -93, 76, 55, -89, -126, -5, 59, -55, 97, -10, 116, 111, -40, 104, -9,
    19, -23, -15, -82, 51, 48, -53, -77, 16, 88, 45, -32, -79, -47, -13, -90, 46, -65, 126, 29,
    42, 53, -40, 93, -96, -94, 28, 11, -29, -117, 20, 54, -33, 122, 35, 99, -92, 54, 101, -26,
    37, 51, 20, 115
};


    unsigned char       out[COLS*ROWS];  /* Output image data  */
	//unsigned char       out_original[COLS*ROWS];  /* Output image data  */
/* ======================================================================== */
/*  TEXAS INSTRUMENTS, INC.                                                 */
/*                                                                          */
/*  IMGLIB  DSP Image/Video Processing Library                              */
/*                                                                          */
/*  This library contains proprietary intellectual property of Texas        */
/*  Instruments, Inc.  The library and its source code are protected by     */
/*  various copyrights, and portions may also be protected by patents or    */
/*  other legal protections.                                                */
/*                                                                          */
/*  This software is licensed for use with Texas Instruments TMS320         */
/*  family DSPs.  This license was provided to you prior to installing      */
/*  the software.  You may review this license by consulting the file       */
/*  TI_license.PDF which accompanies the files in this library.             */
/* ------------------------------------------------------------------------ */
/*          Copyright (C) 2002 Texas Instruments, Incorporated.             */
/*                          All Rights Reserved.                            */
/* ======================================================================== */


/* ======================================================================== */
/*  TEXAS INSTRUMENTS, INC.                                                 */
/*                                                                          */
/*  NAME                                                                    */
/*      IMG_sobel                                                           */
/*                                                                          */
/*  REVISION DATE                                                           */
/*      22-Jan-2001                                                         */
/*                                                                          */
/*  USAGE                                                                   */
/*      This routine is C-callable and can be called as:                    */
/*                                                                          */
/*      void IMG_sobel                                                      */
/*      (                                                                   */
/*          const unsigned char *in_data,      // Input image data  //      */
/*          unsigned char       *out_data,     // Output image data //      */
/*          short cols, short rows             // Image dimensions  //      */
/*      )                                                                   */
/*                                                                          */
/*      The IMG_sobel filter is applied to the input image. The input image */
/*      dimensions are given by the arguments 'cols' and 'rows'.  The       */
/*      output image is 'cols' pixels wide and 'rows - 2' pixels tall.      */
/*                                                                          */
/*  DESCRIPTION                                                             */
/*                                                                          */
/*      To see how the implementation is going to work on the input         */
/*      buffer, lets imagine we have the following input buffer:            */
/*      lets imagine we have the following input buffer:                    */
/*                                                                          */
/*              yyyyyyyyyyyyyyyy                                            */
/*              yxxxxxxxxxxxxxxy                                            */
/*              yxxxxxxxxxxxxxxy                                            */
/*              yxxxxxxxxxxxxxxy                                            */
/*              yxxxxxxxxxxxxxxy                                            */
/*              yyyyyyyyyyyyyyyy                                            */
/*                                                                          */
/*      The output buffer would be:                                         */
/*                                                                          */
/*              tXXXXXXXXXXXXXXz                                            */
/*              zXXXXXXXXXXXXXXz                                            */
/*              zXXXXXXXXXXXXXXz                                            */
/*              zXXXXXXXXXXXXXXt                                            */
/*                                                                          */
/*      Where:                                                              */
/*                                                                          */
/*          X = IMG_sobel(x)    The algorithm is applied to that pixel.     */
/*                          The correct output is obtained, the data        */
/*                          around the pixels we work on is used            */
/*                                                                          */
/*          t               Whatever was in the output buffer in that       */
/*                          position is kept there.                         */
/*                                                                          */
/*          z = IMG_sobel(y)    The algorithm is applied to that pixel.     */
/*                          The output is not meaningful, because the       */
/*                          necessary data to process the pixel is not      */
/*                          available.  This is because for each output     */
/*                          pixel we need input pixels from the right and   */
/*                          from the left of the output pixel.  But this    */
/*                          data doesn't exist.                             */
/*                                                                          */
/*      This means that we will only process (rows-2) lines.  Then, we      */
/*      will process all the pixels inside each line. Even though the       */
/*      results for the first and last pixels in each line will not         */
/*      be relevant, it makes the control much simpler and ends up          */
/*      saving cycles.                                                      */
/*                                                                          */
/*      Also the fist pixel in the first processed line and the             */
/*      last pixel in the last processed line will not be computed.         */
/*      It is not necessary, since the results would be bogus, and          */
/*      not computing them saves some time.                                 */
/*                                                                          */
/*      The following horizontal and vertical masks that are                */
/*      applied to the input buffer to obtain one output pixel.             */
/*                                                                          */
/*          Horizontal:                                                     */
/*              -1 -2 -1                                                    */
/*               0  0  0                                                    */
/*               1  2  1                                                    */
/*                                                                          */
/*          Vertical:                                                       */
/*              -1  0  1                                                    */
/*              -2  0  2                                                    */
/*              -1  0  1                                                    */
/*                                                                          */
/*  ASSUMPTIONS                                                             */
/*      n/a                                                                 */
/*                                                                          */
/*  NOTES                                                                   */
/*      The values of the left-most and right-most pixels on each line      */
/*      of the output are not well-defined.                                 */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2002 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */

void IMG_sobel_c
(
    const unsigned char *in,   /* Input image data   */
    unsigned char       *out,  /* Output image data  */
    short cols, short rows              /* Image dimensions   */
)
{
    int H, O, V, i;
    int i00, i01, i02;
    int i10,      i12;
    int i20, i21, i22;
    int w = cols;

    /* -------------------------------------------------------------------- */
    /*  Iterate over entire image as a single, continuous raster line.      */
    /* -------------------------------------------------------------------- */
    for (i = 0; i < cols*(rows-2) - 2; i++)
    {
        /* ---------------------------------------------------------------- */
        /*  Read in the required 3x3 region from the input.                 */
        /* ---------------------------------------------------------------- */
        i00=in[i    ]; i01=in[i    +1]; i02=in[i    +2];
        i10=in[i+  w];                  i12=in[i+  w+2];
        i20=in[i+2*w]; i21=in[i+2*w+1]; i22=in[i+2*w+2];

        /* ---------------------------------------------------------------- */
        /*  Apply horizontal and vertical filter masks.  The final filter   */
        /*  output is the sum of the absolute values of these filters.      */
        /* ---------------------------------------------------------------- */

        H = -   i00 - 2*i01 -   i02 +
            +   i20 + 2*i21 +   i22;

        V = -   i00         +   i02
            - 2*i10         + 2*i12
            -   i20         +   i22;

        O = abs(H) + abs(V);

        /* ---------------------------------------------------------------- */
        /*  Clamp to 8-bit range.  The output is always positive due to     */
        /*  the absolute value, so we only need to check for overflow.      */
        /* ---------------------------------------------------------------- */
        if (O > 255) O = 255;

        /* ---------------------------------------------------------------- */
        /*  Store it.                                                       */
        /* ---------------------------------------------------------------- */
        out[i + 1] = O;
    }
}

void IMG_sobel_c_adapted_mul
(
    const unsigned char *in,   /* Input image data   */
    unsigned char       *out,  /* Output image data  */
    short cols, short rows              /* Image dimensions   */
)
{
    int H, O, V, i;
    int i00, i01, i02;
    int i10,      i12;
    int i20, i21, i22;
    int w = cols;

    int condition, temp;

    /* -------------------------------------------------------------------- */
    /*  Iterate over entire image as a single, continuous raster line.      */
    /* -------------------------------------------------------------------- */
    for (i = 0; i < cols*(rows-2) - 2; i++)
    {
        /* ---------------------------------------------------------------- */
        /*  Read in the required 3x3 region from the input.                 */
        /* ---------------------------------------------------------------- */
        i00=in[i    ]; i01=in[i    +1]; i02=in[i    +2];
        i10=in[i+  w];                  i12=in[i+  w+2];
        i20=in[i+2*w]; i21=in[i+2*w+1]; i22=in[i+2*w+2];

        /* ---------------------------------------------------------------- */
        /*  Apply horizontal and vertical filter masks.  The final filter   */
        /*  output is the sum of the absolute values of these filters.      */
        /* ---------------------------------------------------------------- */

        H = -   i00 - 2*i01 -   i02 +
            +   i20 + 2*i21 +   i22;

        V = -   i00         +   i02
            - 2*i10         + 2*i12
            -   i20         +   i22;

		// ABS
		condition = H < 0;
		H = -H*condition | H*!condition;
		// ABS
		condition = V < 0;
		V = -V*condition | V*!condition;
        O = H + V;
        //O = abs(H) + abs(V);

        /* ---------------------------------------------------------------- */
        /*  Clamp to 8-bit range.  The output is always positive due to     */
        /*  the absolute value, so we only need to check for overflow.      */
        /* ---------------------------------------------------------------- */
        temp = 255;
        asm("cmpu %0,%1,%2": "=r" (condition): "r" (temp), "r" (O));
        condition = condition > 0;
        O = 255*condition | O*!condition;
        //if (O > 255) O = 255;

        /* ---------------------------------------------------------------- */
        /*  Store it.                                                       */
        /* ---------------------------------------------------------------- */
        out[i + 1] = O;
    }
}

int main() {

	//int i;

    short cols = COLS; short rows = ROWS;              /* Image dimensions   */


//IMG_sobel_c
//(
//    in,   /* Input image data   */
    //out_original,  /* Output image data  */
    //cols, rows              /* Image dimensions   */
//);

IMG_sobel_c_adapted_mul
(
    in,   /* Input image data   */
    out,  /* Output image data  */
    cols, rows              /* Image dimensions   */
);
/*
 	for(i=0; i<COLS*ROWS; i++) {
		if(out_original[i] != out[i]) {
			while(1);
		}
 	}
*/
	return 0;
}

/* ======================================================================== */
/*  End of file:  img_sobel.c                                               */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2002 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */
