// Width of ref image
#define PITCH 100
#define N 20

#ifdef C
#include <stdio.h>
#endif

#include "input.txt"
#include "output_ref.txt"


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
/*      IMG_sad_8x8   -- Sum of Absolute Differences on single 8x8 block    */
/*                                                                          */
/*  USAGE                                                                   */
/*      unsigned IMG_sad_8x8                                                */
/*      (                                                                   */
/*          const unsigned char *restrict srcImg,  // 8x8 source block   // */
/*          const unsigned char *restrict refImg,  // Reference image    // */
/*          int pitch                              // Width of ref image // */
/*      );                                                                  */
/*                                                                          */
/*      The code accepts a pointer to the 8x8 source block (srcImg),        */
/*      and a pointer to the upper-left corner of a target position in      */
/*      a reference image (refImg).  The width of the reference image       */
/*      is given by the pitch argument.                                     */
/*                                                                          */
/*      The function returns the sum of the absolute differences            */
/*      between the source block and the 8x8 region pointed to in the       */
/*      reference image.                                                    */
/*                                                                          */
/*  DESCRIPTION                                                             */
/*      The algorithm takes the difference between the pixel values in      */
/*      the source image block and the corresponding pixels in the          */
/*      reference image.  It then takes the absolute values of these        */
/*      differences, and accumulates them over the entire 8x8 region.       */
/*      It returns the final accumulation.                                  */
/*                                                                          */
/*  ASSUMPTIONS                                                             */
/*      Some versions of this kernel may assume that srcImg is double-      */
/*      word aligned.                                                       */
/*                                                                          */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2002 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */

unsigned IMG_sad_8x8_c(const unsigned char *srcImg, const unsigned char *refImg, int pitch)
{
    int i, j;
    unsigned sad = 0;


    for (i = 0; i < 8; i++)
        for (j = 0; j < 8; j++)
            sad += abs(srcImg[j + i*8] - refImg[j + i*pitch]);

    return sad;
}

int main() {


    //int pitch = PITCH;
    int i;
    int output[N];
    for(i=0; i<N; i++)
      {
	output[i] = IMG_sad_8x8_c(srcImg, refImg, i*PITCH);
	if (output[i] != output_ref[i])
	  {
#ifdef C
	    printf ("%d, ", output[i]);
#endif
	    return 666;
	  }
      }
    
#ifdef C
    printf ("-1\n");
#endif
    
    return -1;
}

/* ======================================================================== */
/*  End of file: img_sad_8x8.c                                              */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2002 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */
