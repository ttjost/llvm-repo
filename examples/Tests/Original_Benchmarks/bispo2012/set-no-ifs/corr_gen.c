#define X_DIM 150
// What is a usual value for the MASK?
#define MASK 8

// Seed 0
const short x[X_DIM] = {
    -19360, 20792, -13446, 28862, -13834, -4038, 28855, 9475, -17858, -22675, -13013, -4021, -15837, -5811, -27857,
    3928, 6920, -20217, -19214, -12047, 25103, -28048, 26456, -22282, -20584, 21816, -4321, -8012, 8968, -28833,
    -25533, 30842, -6453, -3353, -26716, 3692, -3941, 17098, 26341, -8554, 513, 9006, 19094, 12356, -21220,
    14550, -9580, -15216, 24992, 19420, -31569, 6715, -14815, 24989, -11890, -25920, -7791, 499, -27697, 1190,
    -9977, 7081, 25970, -22763, 17857, 15403, 6007, 17068, 26476, 3709, -2108, -23663, -18782, 21870, 4428,
    18633, -25677, -10996, -13714, -21304, 19879, -8358, -31334, 843, 7555, 30784, 10298, -32666, -20021, 17602,
    -21554, 31960, -2488, -18060, 7513, 2982, -15349, 15405, -20741, -11034, -31311, 11514, -16417, 18907, 23527,
    2646, -426, -31166, -31184, 9367, 2116, 29419, 5093, -27478, 11706, -630, 8573, 27138, 14820, 31182,
    9742, 17357, 26149, 32691, 5396, -13976, -9344, -9452, 22640, -18923, 26169, 24707, -6478, 27627, 16315,
    -17572, -1638, 16909, 4796, -30441, 10459, 542, -25186, 21982, -4829, 18676, -26856, 20063, -12457, -16757
};

// Seed 1
const short h[MASK] = {
    -10893, -25384, 3695, -1646, -13060, -18192, -3611, -31267
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


/* ======================================================================= */
/*  TEXAS INSTRUMENTS, INC.                                                */
/*                                                                         */
/*  NAME                                                                   */
/*      IMG_corr_gen                                                       */
/*                                                                         */
/*  REVISION DATE                                                          */
/*      15-Oct-2000                                                        */
/*                                                                         */
/*  USAGE                                                                   */
/*      This routine is C-callable and can be called as:                    */
/*                                                                          */
/*      void IMG_corr_gen                                                   */
/*      (                                                                   */
/*          short   *x,                                                     */
/*          short   *h,                                                     */
/*          short   *y,                                                     */
/*          int     m,                                                      */
/*          int     x_dim                                                   */
/*      );                                                                  */
/*                                                                          */
/*      x[]   : Input pixel array.                                          */
/*      h[M]  : Input 1xM mask array                                        */
/*      y[]   : Output array of correlation sum                             */
/*      M     : Length of filter.                                           */
/*      x_dim : Width of input image                                        */
/*                                                                          */
/*  DESCRIPTION                                                             */
/*      The routine performs a generalized correlation with a 1 by M tap    */
/*      filter. It can be called repetitively to form an arbitrary MxN 2D   */
/*      generalized correlation kernel. The correlation sum is stored as    */
/*      half words. The input pixel, and mask data is assumed to come in    */
/*      as shorts.  No restrictions apply to x_dim and M.                   */
/*                                                                          */
/*      If the width of the input image is x_dim and the mask is M then     */
/*      the output array must have at-least a dimension of (x_dim - m + 8). */
/*                                                                          */
/*  C CODE                                                                  */
/*      void IMG_corr_gen(short *x, short *h, short *y, int M, int x_dim)   */
/*      {                                                                   */
/*          iters = x_dim - M;                                              */
/*          for (j = 0; j < iters; j++)                                     */
/*          {                                                               */
/*              sum =  y[j];                                                */
/*              for (i = 0; i < M; i++)                                     */
/*              {                                                           */
/*                  sum += xptr[i + j] * hptr[i];                           */
/*              }                                                           */
/*              y[j] = sum;                                                 */
/*          }                                                               */
/*      }                                                                   */
/*                                                                          */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2002 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */
// Input arrays: x, h
// Output arrays: y
void IMG_corr_gen_c
(
    const short *x,
    const short *h,
    short       *y,
    int                   m,
    int                   x_dim
)
{
    int i, j;

    for (j = 0; j < x_dim - m; j++)
    {
         for (i = 0; i < m; i++)
             y[j] += x[i + j] * h[i];
    }
}

int main() {

    short       y[X_DIM - MASK + 8];
    int                   m = MASK;
    int                   x_dim = X_DIM;


IMG_corr_gen_c(
x,
h,
y,
m,
x_dim
);


	return 0;
}

/* ======================================================================== */
/*  End of file:  img_corr_gen.c                                            */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2002 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */
