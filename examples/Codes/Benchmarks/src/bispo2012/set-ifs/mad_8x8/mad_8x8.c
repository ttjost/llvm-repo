#define X 16
#define Y 16

#ifdef C
#include <stdio.h>
#endif

const unsigned char refImg[(X+8)*(Y+8)] = {
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
    96, -103, -10, 117, 8, -62, 33, 36, -15, 108, 80, 46, 82, -2, -93, 91
};

// Seed 1
const unsigned char srcImg[8*8] = {
    115, -40, 111, -110, -4, -16, -27, -35, -43, 104, 114, 18, -70, 126, -76, -28, -79, -4, -87, 59,
    -127, -104, 61, 54, 100, -98, 36, 115, -5, -52, -22, -115, -127, 124, 71, -26, 67, 8, -73, -91,
    79, 105, 74, 2, 107, 33, -72, -64, 73, 91, -72, -5, -8, 79, -111, 35, -100, -21, -16, 72,
    97, -81, -4, -105
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
/*      IMG_mad_8x8 -- Minimum Absolute Difference motion search            */
/*                                                                          */
/*                                                                          */
/*  REVISION DATE                                                           */
/*      20-Oct-2000                                                         */
/*                                                                          */
/*  USAGE                                                                   */
/*      This routine is C callable and has the following C prototype.       */
/*                                                                          */
/*      void IMG_mad_8x8                                                    */
/*      (                                                                   */
/*          const unsigned char *refImg,    // Ref. image to search //      */
/*          const unsigned char *srcImg,    // Source 8x8 block     //      */
/*          int                 pitch,      // Width of ref image   //      */
/*          int sx, int sy,                 // Search window size   //      */
/*          unsigned int        *motvec     // Motion vector result //      */
/*      );                                                                  */
/*                                                                          */
/*      This routine accepts an 8x8 source block and a pointer to           */
/*      a window to search within a bitmap.  The pointer "refImg"           */
/*      points to the upper left corner of the search window.  The          */
/*      parameters "sx" and "sy" describe the dimensions of the search      */
/*      area.  The bitmap itself may be wider than the search window.       */
/*      It's width is described by the "pitch" argument.                    */
/*                                                                          */
/*      The search area dimensions specify the range of positions that      */
/*      the 8x8 source block is compared to.  This means that the           */
/*      actual bitmap area examined extends 7 pixels beyond the right       */
/*      and bottom edges of the search area within the reference image.     */
/*                                                                          */
/*      The best match position and its absolute difference are returned    */
/*      in motvec, packed as follows:                                       */
/*                                                                          */
/*                     31             16 15             0                   */
/*                     +----------------+----------------+                  */
/*          motvec[0]: |    X offset    |    Y offset    |                  */
/*                     +----------------+----------------+                  */
/*                                                                          */
/*                     31                               0                   */
/*                     +---------------------------------+                  */
/*          motvec[1]: |   Sum of absolute differences   |                  */
/*                     +---------------------------------+                  */
/*                                                                          */
/*  DESCRIPTION                                                             */
/*      The IMG_mad_8x8 function performs a full search for an 8x8 block    */
/*      within a specified search window.  It finds the position within     */
/*      the search window that has the Minimum Absolute Difference with     */
/*      respect to the given source block.                                  */
/*                                                                          */
/*      This type of search is useful for video algorithms which use        */
/*      motion compensation.  The search performed by this routine is a     */
/*      full search, meaning that all possible starting positions from      */
/*      [0, 0] to [sx-1, sy-1] are checked for potential matches.           */
/*                                                                          */
/*      The Absolute Difference metric is calculated by summing the         */
/*      absolute values of the differences between pixels in the            */
/*      source block and their corresponding pixels for the match           */
/*      point being evaluated in the reference image.  Smaller sums         */
/*      denote better matches--that is, less overall difference between     */
/*      the source block and match point in the reference block.            */
/*                                                                          */
/*      The algorithm returns the X and Y offsets of the best match         */
/*      point, as well as the calculated Absolute Difference for that       */
/*      position.  If two match points have equal Absolute Differences,     */
/*      the earlier block in the search sequence is returned.  The          */
/*      search presently checks in vertical stripes from top to bottom,     */
/*      moving from 1 column to the right after each stripe.                */
/*                                                                          */
/*  ASSUMPTIONS                                                             */
/*      The input pointers do not alias the output pointer for motvec.      */
/*                                                                          */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2002 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */

unsigned int motvec_ref[2] = {524300, 4026};

void IMG_mad_8x8_c(const unsigned char *refImg, const unsigned char *srcImg, int pitch, int sx, int sy, unsigned int *motvec)
{
    int i, j, x, y, matx, maty;
    unsigned matpos, matval;

    matval = ~0U;
    matx   = maty = 0;

    for (x = 0; x < sx; x++)
        for (y = 0; y < sy; y++)
        {
            unsigned acc = 0;

            for (i = 0; i < 8; i++)
                for (j = 0; j < 8; j++)
                    acc += abs(srcImg[i*8 + j] - refImg[(i+y)*pitch + x + j]);

            if (acc < matval)
            {
                matval = acc;
                matx   = x;
                maty   = y;
            }
        }

    matpos    = (0xffff0000 & (matx << 16)) | (0x0000ffff & maty);
    motvec[0] = matpos;
    motvec[1] = matval;
}

int main()
{
  int pitch = X+8;
  int sx = X;
  int sy = Y;
  unsigned int motvec[2];
  

  IMG_mad_8x8_c(refImg, srcImg, pitch, sx, sy, motvec);

  if ((motvec[0] != motvec_ref[0]) || (motvec[1] != motvec[1]))
    {
      #ifdef C
      printf("%d, %d", motvec[0],motvec[1]);
      #endif
      return 666;
    }

  #ifdef C
  printf("-1\n");
  #endif
  
  return -1;
}

/* ======================================================================== */
/*  End of file:  img_mad_8x8.c                                             */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2002 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */
