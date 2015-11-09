#define ROWS 100
#define COLS 100

#ifdef C
#include <stdio.h>
#endif

#include "input.txt"
#include "output.txt"
#include "output2.txt"

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
/*                                                                          */
/*  NAME                                                                    */
/*      IMG_boundary -- Returns coordinates of IMG_boundary pixels.         */
/*                                                                          */
/*  REVISION DATE                                                           */
/*      10-Jul-2001                                                         */
/*                                                                          */
/*  USAGE                                                                   */
/*      This routine is C callable, and is called as follows:               */
/*                                                                          */
/*          void IMG_boundary                                               */
/*          (                                                               */
/*              const unsigned char *restrict i_data,                       */
/*              int rows, int cols,                                         */
/*              int *restrict o_coord,                                      */
/*              int *restrict o_grey                                        */
/*          );                                                              */
/*                                                                          */
/*      The arguments are defined as follows:                               */
/*                                                                          */
/*          i_data   Input images that is cols-by-rows in size.             */
/*          rows     Height of the input image                              */
/*          cols     Width of the input image                               */
/*          o_coord  Array to write output coordinates to                   */
/*          o_grey   Array to write output grey levels to                   */
/*                                                                          */
/*  DESCRIPTION                                                             */
/*      This routine scans an image looking for non-zero pixels.            */
/*      The locations of those pixels are stored out to the o_coord         */
/*      as packed Y/X pairs, with Y in the upper half, and X in             */
/*      the lower half.  The grey levels encountered are stored             */
/*      in the o_grey array in parallel.                                    */
/*                                                                          */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2002 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */

void IMG_boundary_c
(
    const unsigned char* i_data,
    int rows, int cols,
    int* o_coord,
    int* o_grey
)
{
    int x, y, p;

    for (y = 0; y < rows; y++)
        for (x = 0; x < cols; x++)
            if ((p = *i_data++) != 0)
            {
                *o_coord++ = ((y & 0xFFFF) << 16) | (x & 0xFFFF);
                *o_grey++  = p;
            }
}

int main() {

	int rows = ROWS; int cols = COLS;
	int o_coord[COLS*ROWS];
	int o_grey[COLS*ROWS];

	IMG_boundary_c(i_data, rows, cols, o_coord, o_grey);

	int i;
	for (i = 0; i < ((COLS*ROWS)-36); i++) 
	  {
	    if (o_coord[i] != o_coord_ref[i]) 
	      {
                #ifdef C
		printf("%d, %d, line %d - 1\n", o_coord[i], o_coord_ref[i], i);
                #endif
		return i+10;
	      }
	  }
	

	for (i=0; i < ((COLS*ROWS)-36); i++)
	  {
	    if (o_grey[i] != o_grey_ref[i]) 
	      {
                #ifdef C
		printf("%d, %d, line %d - 2\n", o_grey[i], o_grey_ref[i], i);
                #endif
		return i+10;
	      }
	  }
	      
	#ifdef C
	printf("-1\n");
	#endif

	return -1;
}

/* ======================================================================== */
/*  End of file:  img_boundary.c                                            */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2002 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */
