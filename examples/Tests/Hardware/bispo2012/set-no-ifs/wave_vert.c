#define COLS 40

const short in_data[8][COLS] = {
    {-19360, 20792, -13446, 28862, -13834, -4038, 28855, 9475, -17858, -22675, -13013, -4021, -15837, -5811, -27857, 3928, 6920, -20217, -19214, -12047, 25103, -28048, 26456, -22282, -20584, 21816, -4321, -8012, 8968, -28833, -25533, 30842, -6453, -3353, -26716, 3692, -3941, 17098, 26341, -8554},
    {513, 9006, 19094, 12356, -21220, 14550, -9580, -15216, 24992, 19420, -31569, 6715, -14815, 24989, -11890, -25920, -7791, 499, -27697, 1190, -9977, 7081, 25970, -22763, 17857, 15403, 6007, 17068, 26476, 3709, -2108, -23663, -18782, 21870, 4428, 18633, -25677, -10996, -13714, -21304},
    {19879, -8358, -31334, 843, 7555, 30784, 10298, -32666, -20021, 17602, -21554, 31960, -2488, -18060, 7513, 2982, -15349, 15405, -20741, -11034, -31311, 11514, -16417, 18907, 23527, 2646, -426, -31166, -31184, 9367, 2116, 29419, 5093, -27478, 11706, -630, 8573, 27138, 14820, 31182},
    {9742, 17357, 26149, 32691, 5396, -13976, -9344, -9452, 22640, -18923, 26169, 24707, -6478, 27627, 16315, -17572, -1638, 16909, 4796, -30441, 10459, 542, -25186, 21982, -4829, 18676, -26856, 20063, -12457, -16757, -18155, -17694, -14301, 22843, 5596, -26723, -27727, 8237, 7024, -8633},
    {-585, 8459, -5831, 21738, 27063, -29450, -9245, -2563, 7042, 12477, 29573, 17841, 1021, -17334, -2042, 10379, 5671, -29345, 32700, 3890, 26714, -3710, 15445, -29814, -23088, 4918, 12794, -23808, -27544, 1643, -17231, 29223, -19798, -22474, -30718, -2684, 12808, 17860, -8995, 2981},
    {-11930, 16012, 27066, 1144, 23516, 5572, -5887, 20953, -12358, -22763, 18861, 11628, 29132, 29329, 15915, 18348, 20702, 13284, 21895, -11196, -638, 14537, 714, -30819, 31248, 10944, 13981, 22967, -22803, 16381, 28465, 8764, -20720, 1955, 25186, 25042, 14530, 17713, -23014, -13136},
    {24228, -28868, -1293, 27252, -19210, -23202, 7456, 24370, -8427, -20114, 16269, -20016, 31045, -6159, -27325, -23664, 23217, 15311, -29423, 27885, 29615, 6473, -23704, 29611, -13241, 23594, -4474, 20009, 26357, -2756, -14121, 10233, 2990, -3331, 15767, 23474, 16160, -7790, 7099, 22020},
    {-5570, -18948, -11503, 5644, 30203, -18295, 32678, -8472, 24404, 8844, -14489, -4466, -30828, 25424, 28170, 19929, -15149, 16457, -15570, 3556, 30399, 17548, 20160, -31077, 9118, 13184, 24481, 27278, 24979, 29397, 24709, -15352, -28641, -24651, 5918, 12128, 9706, -15558, 12664, -6514}
};

// Seed 1
const short lp_filt[8] = {
    -10893, -25384, 3695, -1646,
    -13060, -18192, -3611, -31267
};


// Seed 2
const short hp_filt[8] = {
    29241, -17928, 17808, 24343,
    -15382, 24269, 28252, 25422
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
/*  TEXAS INSTRUMENTS, INC.                                                 */
/*                                                                          */
/*  NAME                                                                    */
/*      IMG_wave_vert                                                       */
/*                                                                          */
/*  REVISION DATE                                                           */
/*      18-Oct-2000                                                         */
/*                                                                          */
/*  USAGE                                                                   */
/*      This routine is C-callable and can be called as:                    */
/*                                                                          */
/*          void IMG_wave_vert                                              */
/*          (                                                               */
/*              const short *restrict                                       */
/*                    const *restrict in_data,                              */
/*              const short *restrict lp_filt,                              */
/*              const short *restrict hp_filt,                              */
/*              short       *restrict out_ldata,                            */
/*              short       *restrict out_hdata,                            */
/*              int cols                                                    */
/*          )                                                               */
/*                                                                          */
/*          in_data   = Eight pointers to input image rows.                 */
/*          lp_filt   = Low-pass quadrature mirror filter coeffs (8 taps)   */
/*          hp_filt   = High-pass quadrature mirror filter coeffs (8 taps)  */
/*          out_ldata = Outgoing low-pass image data.                       */
/*          out_hdata = Outgoing high-pass image data.                      */
/*          cols      = Total number of colums in row of image.             */
/*                                                                          */
/*  DESCRIPTION                                                             */
/*      This function performs the vertical pass of 2D wavelet              */
/*      transform It performs a vertical filter on 8 rows which are         */
/*      pointed to by the pointers contained in an array of pointers.       */
/*      It produces two lines worth of output, one being the low-pass       */
/*      and the other being the high pass result.  Instead of               */
/*      transposing the input image and re-using the horizontal wavelet     */
/*      function, the vertical filter is applied directly to the image      */
/*      data as-is, producing a single line of high pass and a single       */
/*      line of low pass outputs.                                           */
/*                                                                          */
/*      This function accepts eight row pointers for the eight rows         */
/*      that form the context for the two filters.  It also accepts         */
/*      two output pointers, one for the high-pass filtered output          */
/*      and one for the low-pass filtered output.  Finally, it also         */
/*      accepts two input pointers for the low- and high-pass filters.      */
/*                                                                          */
/*      In a traditional wavelet implementation, for a given pair of        */
/*      output lines, the input context for the low-pass filter is          */
/*      offset by a number of lines from the input context for the          */
/*      high-pass filter.  The amount of offset is determined by the        */
/*      number of filter taps and is generally "num_taps - 2" rows.         */
/*      This implementation is fixed at 8 taps, so the offset would be      */
/*      6 rows.                                                             */
/*                                                                          */
/*      This implementation breaks from the traditional model so that       */
/*      it can reuse the same input context for both low-pass and           */
/*      high-pass filters simultaneously.  The result is that the           */
/*      low-pass and high-pass *outputs* must instead be offset by the      */
/*      calling function.  The following sample pseudo-code illustrates     */
/*      one possible method for producing the desired result.               */
/*                                                                          */
/*          // ------------------------------------------------------ //    */
/*          //  Iterate over whole input image, starting at the top.  //    */
/*          // ------------------------------------------------------ //    */
/*          for (y = 0; y < y_dim; y += 2)                                  */
/*          {                                                               */
/*              // -------------------------------------------------- //    */
/*              //  Set up our eight input pointers, wrapping around  //    */
/*              //  the bottom as necessary.                          //    */
/*              // -------------------------------------------------- //    */
/*              for (y0 = 0; y0 < 8; y0++)                                  */
/*                  in_data[y0] = in_image + ((y + y0) % y_dim) * x_dim;    */
/*                                                                          */
/*              // -------------------------------------------------- //    */
/*              //  Set up our output pointers.  The high-pass data   //    */
/*              //  is three rows ahead of the low-pass data.         //    */
/*              // -------------------------------------------------- //    */
/*              out_ldata = out_image + (y / 2);                            */
/*              out_hdata = out_image + ((y + 6) % y_dim) / 2 + y_dim;      */
/*                                                                          */
/*              // -------------------------------------------------- //    */
/*              //  Perform the wavelet.                              //    */
/*              // -------------------------------------------------- //    */
/*              IMG_wave_vert(in_data, lpf, hpf, out_ldata, out_hdata, x_dim); */
/*          }                                                               */
/*                                                                          */
/*  BIBLIOGRAPHY                                                            */
/*      A Wavelet Tour of Signal Processing Stephane Mallat                 */
/*                                                                          */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2002 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */

void IMG_wave_vert_c
(
    //const short *
    //const       * in_data,   /* Array of row pointers */
    const short in_data[][COLS],
    const short * lp_filt,   /* Low pass QMF filter   */
    const short * hp_filt,   /* High pass QMF filter  */
    short       * out_ldata, /* Low pass output data  */
    short       * out_hdata, /* High pass output data */
    int cols                    /* Length of rows to process */
)
{
    int   i, j;

    /* -------------------------------------------------------------------- */
    /*  First, perform the low-pass filter on the eight input rows.         */
    /* -------------------------------------------------------------------- */
    for (i = 0; i < cols; i++)
    {
        int sum = 1 << 14;

        for (j = 0; j < 8; j++)
            sum += in_data[j][i] * lp_filt[j];

        out_ldata[i] = sum >> 15;
    }

    /* -------------------------------------------------------------------- */
    /*  Next, perform the high-pass filter on the same eight input rows.    */
    /* -------------------------------------------------------------------- */
    for (i = 0; i < cols; i++)
    {
        int sum = 1 << 14;

        for (j = 0; j < 8; j++)
            sum += in_data[j][i] * hp_filt[7 - j];

        out_hdata[i] = sum >> 15;
    }
}

int main() {

    //const short*
    //const       * in_data[8][COLS];   /* Array of row pointers */

    short       out_ldata[COLS]; /* Low pass output data  */
    short       out_hdata[COLS]; /* High pass output data */
    int cols  = COLS;

IMG_wave_vert_c
(
    in_data, /* Array of row pointers */
    lp_filt,   /* Low pass QMF filter   */
    hp_filt,   /* High pass QMF filter  */
    out_ldata, /* Low pass output data  */
    out_hdata, /* High pass output data */
    cols                   /* Length of rows to process */
);

	return 0;
}

/* ======================================================================== */
/*  End of file:  img_wave_vert.c                                           */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2002 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */
