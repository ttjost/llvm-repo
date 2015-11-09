#define X_DIM 150

#ifdef C
#include <stdio.h>
#endif

const unsigned char inptr[X_DIM*3+4] = {
    96, 56, 122, -66, -10, 58, -73, 3, 62, 109, 43, 75, 35, 77, 47,
    88, 8, 7, -14, -15, 15, 112, 88, -10, -104, 56, 31, -76, 8, 95,
    67, 122, -53, -25, -92, 108, -101, -54, -27, -106, 1, 46, -106, 68, 28,
    -42, -108, -112, -96, -36, -81, 59, 33, -99, -114, -64, -111, -13, -49, -90,
    7, -87, 114, 21, -63, 43, 119, -84, 108, 125, -60, -111, -94, 110, 76,
    -55, -77, 12, 110, -56, -89, 90, -102, 75, -125, 64, 58, 102, -53, -62,
    -50, -40, 72, 116, 89, -90, 11, 45, -5, -26, -79, -6, -33, -37, -25,
    86, 86, 66, 48, -105, 68, -21, -27, -86, -70, -118, 125, 2, -28, -50,
    14, -51, 37, -77, 20, 104, -128, 20, 112, 21, 57, -125, -78, -21, -69,
    92, -102, 13, -68, 23, -37, 30, -98, -34, 35, -12, 24, 95, 87, -117,
    21, -30, 35, 59, -36, -99, -79, 45, 112, 71, -73, 11, 57, -22, -73,
    -10, -29, -3, -126, -67, -123, -79, -3, 74, 6, -117, 39, 95, -68, 50,
    90, -126, 85, -118, -48, 54, -6, 0, 104, 107, -79, 39, -86, 54, 2,
    -124, 8, -60, -35, -91, 102, -116, -70, 120, -36, -60, 1, -39, -70, 21,
    -83, 108, -52, -111, 43, -84, -34, -28, -121, 68, -126, -55, -54, -99, 16,
    -64, -99, -73, -19, -3, 49, 60, 16, -93, 98, -46, -62, 49, 26, -80,
    -92, 60, -13, 116, -10, 94, 32, 50, 21, 110, -115, -48, 69, -15, 67,
    -112, -79, -49, 17, -19, -81, 73, 104, -85, 71, 42, -122, 41, -11, 60,
    -41, -7, -82, -3, -105, -78, 32, -110, -69, 4, 62, -4, 17, 12, -5,
    -119, -90, -24, 84, -116, 103, -114, -108, 80, 10, -39, -45, 73, 46, -28,
    -65, -116, -64, -101, -98, -128, -95, -114, -109, -43, -123, 8, 31, -75, 30,
    96, -22, 58, 120, -114, -61, 31, -90, 0, -27, -71, -98, -82, 124, 39,
    97, 108, 103, -56, 94, 126, 62, -19, 24, 113, -107, -49, 6, 40, -126,
    -61, -71, 52, 92, -85, 68, 105, -59, -81, -41, -83, -21, 45, -83, 19,
    10, -19, 40, 39, 52, -103, 57, -117, 84, 107, 5, -62, 112, 40, -59,
    75, 45, 76, -19, -15, -104, -122, -112, 97, 35, 102, 2, -3, -20, 84,
    -66, -17, 69, -60, -118, 127, 112, -89, -40, -87, -86, 36, 111, -22, 106,
    -121, 74, 90, -22, 121, -64, -1, -26, 113, -28, 95, -93, 106, 46, 86,
    50, -42, 90, 42, -11, -46, -112, -36, 98, -102, -60, -64, 6, 62, 95,
    79, -51, -107, 30, 60, -128, 114, 58, -60, -114, 21, -55, 74, 14, -28, 66, 67, 68, 69
};

const unsigned char outptr_ref[X_DIM] = {255, 0, 255, 0, 255, 0, 0, 0, 0, 0, 0, 255, 0, 0, 0, 0, 0, 0, 0, 255, 0, 255, 0, 255, 0, 0, 0, 255, 0, 255, 255, 0, 255, 255, 0, 255, 0, 255, 0, 0, 0, 0, 0, 255, 0, 255, 255, 0, 0, 0, 0, 0, 0, 0, 0, 255, 255, 255, 0, 255, 0, 0, 255, 0, 255, 0, 0, 0, 255, 8, 255, 0, 0, 255, 255, 0, 0, 0, 0, 0, 255, 0, 255, 0, 0, 0, 0, 0, 255, 0, 0, 255, 0, 0, 0, 0, 255, 0, 255, 255, 255, 255, 255, 0, 255, 0, 0, 0, 0, 0, 0, 255, 255, 0, 255, 0, 255, 0, 0, 255, 0, 0, 0, 0, 0, 0, 255, 0, 0, 0, 255, 0, 255, 255, 0, 0, 255, 0, 255, 0, 255, 0, 0, 255, 0, 255, 0, 0, 0, 255};

// Seed 1
const char          mask[3*3+4] = {
    115, -40, 111, -110, -4, -16, -27, -35, -43, 77, 78, 79, 80
};



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
/*  NAME                                                                    */
/*      IMG_conv_3x3    -- 3x3 convolution                                  */
/*                                                                          */
/*  REVISION DATE                                                           */
/*      31-JUl-2001                                                         */
/*                                                                          */
/*  USAGE                                                                   */
/*      This routine has the following C prototype:                         */
/*                                                                          */
/*      void IMG_conv_3x3   (    const unsigned char *restrict inptr,       */
/*                                 unsigned char *restrict outptr,          */
/*                                          int            x_dim,           */
/*                           const          char *restrict mask,            */
/*                                          int            shift)           */
/*                                                                          */
/*     The convolution routine accepts three rows of 'x_dim' input points   */
/*     and performs some operation on each.  A total of 'x_dim' outputs     */
/*     are written to the output array. The 'mask' array has the 3 by 3     */
/*     array of coefficients.                                               */
/*                                                                          */
/*  DESCRIPTION                                                             */
/*                                                                          */
/*     The convolution kernel accepts three rows of 'x_dim' input points    */
/*     and produces one output row of 'x_dim' points using the input mask   */
/*     of 3 by 3. The user defined shift value is used to shift the convo-  */
/*     lution value, down to the byte range. The convolution sum is also    */
/*     range limited to 0..255. The shift amount is non-zero for low pass   */
/*     filters, and zero for high pass and sharpening filters.              */
/*                                                                          */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2002 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */

/* ======================================================================== */
/*  IMG_conv_3x3   -- Natural C version of IMG_conv_3x3().                  */
/* ======================================================================== */

void IMG_conv_3x3_c(const unsigned char *inptr,
                    unsigned char       *outptr,
                    int                 x_dim,
                    const char          *mask,
                    int                 shift)
{
     const unsigned char     *IN1,*IN2,*IN3;
     unsigned char           *OUT;

     short    pix10,  pix20,  pix30;
     short    mask10, mask20, mask30;

     int      sum,    sum00,  sum11;
     int      i;
     int      sum22,  j;

     /*-------------------------------------------------------------------*/
     /* Set imgcols to the width of the image and set three pointers for  */
     /* reading data from the three input rows. Alos set the output poin- */
     /* ter.                                                              */
     /*-------------------------------------------------------------------*/

     IN1      =   inptr;
     IN2      =   IN1 + x_dim;
     IN3      =   IN2 + x_dim;
     OUT      =   outptr;

     /*-------------------------------------------------------------------*/
     /* The j: loop iterates to produce one output pixel per iteration.   */
     /* The mask values and the input values are read using the i loop.   */
     /* The convolution sum is then computed. The convolution sum is      */
     /* then shifted and range limited to 0..255                          */
     /*-------------------------------------------------------------------*/

     for (j = 0; j < x_dim ; j++)
     {
         /*---------------------------------------------------------------*/
         /* Initialize convolution sum to zero, for every iteration of    */
         /* outer loop. The inner loop computes convolution sum.          */
         /*---------------------------------------------------------------*/

         sum = 0;

         for (i = 0; i < 3; i++)
         {
             pix10  =   IN1[i];
             pix20  =   IN2[i];
             pix30  =   IN3[i];

             mask10 =   mask[i];
             mask20 =   mask[i + 3];
             mask30 =   mask[i + 6];

             sum00  =   pix10 * mask10;
             sum11  =   pix20 * mask20;
             sum22  =   pix30 * mask30;

             sum   +=   sum00 + sum11+ sum22;
         }

         /*---------------------------------------------------------------*/
         /*  Increment input pointers and shift sum and range limit to    */
         /*  0..255.                                                      */
         /*---------------------------------------------------------------*/

         IN1++;
         IN2++;
         IN3++;

         sum = (sum >> shift);
	
         if ( sum <  0  )       sum = 0;
         if ( sum > 255 )       sum = 255;

         /*--------------------------------------------------------------*/
         /* Store output sum into the output pointer OUT                 */
         /*--------------------------------------------------------------*/

         *OUT++   =       sum;
     }
}

int main() 
{
	unsigned char       outptr[X_DIM];
	int                 x_dim = X_DIM;
	int                 shift = 0;

	int i;

	IMG_conv_3x3_c(inptr, outptr, x_dim, mask, shift);


	for (i = 0; i < X_DIM; i++)
	  {
	    if (outptr[i] != outptr_ref[i])
	      {
	    #ifdef C
		printf("%d, ", outptr[i]);
		#endif

		return 666;
	      }
	  }

	#ifdef C
	printf("-1\n");
	#endif
	
	return -1;
}

/* ======================================================================== */
/*  End of file:  img_conv_3x3.c                                            */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2002 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */
