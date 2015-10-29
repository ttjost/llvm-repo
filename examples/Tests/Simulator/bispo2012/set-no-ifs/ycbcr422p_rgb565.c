#define NUM_PIXELS 1000

    const short             coeff[5] = {
	    -19360, 20792, -13446, 28862, -13834
	};

	// Seed 1
    const unsigned char     y_data[NUM_PIXELS/2] = {
    115, -40, 111, -110, -4, -16, -27, -35, -43, 104, 114, 18, -70, 126, -76, -28, -79, -4, -87, 59,
    -127, -104, 61, 54, 100, -98, 36, 115, -5, -52, -22, -115, -127, 124, 71, -26, 67, 8, -73, -91,
    79, 105, 74, 2, 107, 33, -72, -64, 73, 91, -72, -5, -8, 79, -111, 35, -100, -21, -16, 72,
    97, -81, -4, -105, -84, -40, -88, 36, -109, -64, 71, -23, -113, -124, 101, 14, 112, -25, -45, 106,
    -112, 117, 3, 73, 75, -21, -106, 111, -82, -43, 51, 93, 109, 121, -102, -46, 26, -13, -8, -108,
    -108, -95, 124, 111, -68, -64, 41, 126, 111, 87, -18, -88, -81, 83, -13, 109, 35, -13, 53, -30,
    -63, 102, 84, -7, -55, -79, -85, 6, -12, -42, -95, 126, -19, 50, 62, 1, 0, 38, 1, -103,
    16, -7, -17, 68, -50, -3, -17, -81, 40, -17, 85, 68, -2, -93, -69, 102, 27, -32, 23, -5,
    98, -120, 10, 42, 71, -4, 118, 101, -127, -66, 82, -87, -3, 87, -64, 4, 21, 122, 95, 88,
    1, 105, -34, 93, -115, -105, -47, -21, 12, -114, -57, 121, -116, 18, -101, -32, 74, -122, 10, 101,
    104, -113, -122, -11, -35, -10, 73, -78, -84, -46, -84, -82, 88, -26, -72, -11, -106, 71, -3, -47,
    68, 66, -94, 72, -103, 124, -67, -23, -98, 89, -28, -57, -35, -95, 4, -58, 87, 97, 112, 21,
    -70, 15, 61, -6, -45, -15, -52, -44, 65, -66, -89, 94, 107, -124, -111, 48, -77, -51, -41, -117,
    -21, -3, -20, 85, 7, -2, 52, 98, 20, 30, 31, -12, 104, 55, 122, -123, 27, 15, 1, -61,
    -75, 2, 56, -37, 40, -34, 122, -6, 0, 13, 82, 16, -40, -7, 9, -42, 16, -85, 127, 18,
    -68, -75, 62, 25, -33, 82, -53, -107, -40, -53, 63, -120, 27, 27, 23, -112, 36, -43, 71, 108,
    -87, 69, -108, -66, 15, -42, 35, 18, 30, -77, 76, 30, -9, -81, -77, 75, 68, 105, -103, 116,
    -78, -85, 111, -20, -100, 18, -84, -59, 8, -12, -33, 79, -42, 125, 7, -33, 54, 27, 34, -47,
    90, 27, 3, -49, 108, -108, 104, 82, -62, -125, 75, 104, 80, 55, 120, -72, 94, -17, 95, -61,
    122, -63, 43, 108, -82, -68, 19, -71, -10, 81, -17, -37, -20, -18, 13, 107, -59, -21, 69, -10,
    -128, -87, 74, -69, 91, -8, 66, -78, -119, -71, -103, -48, 34, -60, 18, -119, 91, 11, 30, -106,
    -10, -1, 113, -8, -5, 50, -47, 60, -88, 61, 48, -1, -91, -29, -3, -76, 123, 118, -74, -92,
    71, 121, -63, 54, -86, -122, 124, 112, 3, 114, -110, -67, -32, -82, -112, -16, -79, -17, -73, -120,
    -66, 17, 19, 53, 90, 56, -52, -101, 88, 56, -69, 85, -66, 54, 64, 59, -72, -113, 82, -24,
    -49, -8, -42, 118, 90, -27, 52, -117, 52, 47, 40, -103, -81, -16, -43, 96, -57, -79, 31, -73
};


    // Seed 2
    const unsigned char     cb_data[NUM_PIXELS/2] = {
    57, -8, -112, 23, -22, -51, 92, 78, 15, 121, -100, -67, -12, -20, 36, 64, -73, 30, -123, 94,
    44, 31, -114, 117, 1, 109, 21, 55, 34, -123, -9, 84, 94, -68, 92, 120, 74, 78, 63, 120,
    101, -73, 45, -57, 124, 65, 76, 46, 80, -34, -98, -68, 117, 55, -121, -6, 124, 4, -116, 99,
    84, -99, 93, 18, -19, -47, 21, -67, 29, -10, -65, -31, -57, 65, 27, 62, 57, 87, -94, -122,
    -42, 35, -56, 80, -12, -22, -128, 82, 7, -100, 5, -49, -2, 107, -42, 78, -19, -95, 1, -116,
    -21, -82, -92, -77, 61, -128, -80, -53, -77, 23, -16, 111, 82, 88, 73, -60, 50, 32, 67, -89,
    -87, -101, -57, 37, -87, -41, 42, 47, 102, -109, 106, -114, 59, 93, -74, 20, -50, -37, 51, 19,
    113, 104, -3, 19, -53, -30, 107, -66, -73, -63, -106, 31, 107, 108, 28, 11, -35, -57, 33, -33,
    97, 16, -106, 107, -106, -21, -67, 45, -125, -70, -20, -63, -4, 50, -112, -104, 74, 43, 116, -24,
    10, -74, 67, -29, 85, 116, 75, 42, 33, 37, -125, -124, -26, 127, -49, -54, -124, 64, -127, 38,
    99, -122, 35, 124, -37, 94, 115, 39, -42, -102, -82, -24, -76, -26, 17, 26, 110, 29, -100, 42,
    -3, -40, 25, 71, -4, 72, 92, 85, -116, 69, -53, 38, 119, -90, 32, -21, -105, -45, 109, -24,
    120, -105, 96, 102, 60, 58, -56, -18, -65, -50, 87, -77, -6, -55, -87, 79, -84, -44, -124, -78,
    54, -31, 97, 87, -58, -125, 43, -73, -72, 121, 70, 2, 56, -117, -46, 12, 43, -103, 48, -123,
    79, -16, -60, 109, -96, -33, -4, -58, -3, -119, -111, -118, 11, -3, 13, -33, 89, -125, -116, -120,
    -59, 56, -58, -97, 29, -35, 76, -127, 8, -21, 17, 8, 39, -22, 43, -1, 119, 2, -37, -46,
    -8, -46, -54, -123, -109, -128, -107, -25, 56, 16, -117, 6, 70, -7, -75, -27, 48, -11, 22, 108,
    92, 24, 51, -97, 78, 36, -43, 18, 5, 26, 12, -100, -91, 20, 119, 75, 85, 82, -61, -105,
    106, -111, 112, -39, -59, -93, -37, -3, 120, 60, 120, 118, -81, 9, 94, 114, -51, 6, 8, 78,
    -43, 16, 89, 76, 11, -71, -32, -125, -38, 91, 93, 22, -8, 111, -124, -88, -57, 31, 0, 15,
    -2, 25, -70, 71, -120, -91, 90, -88, -84, -7, 13, 91, 109, -53, -119, 10, 50, 40, 77, -42,
    -86, -124, 45, -114, -23, 17, 13, 29, -42, 83, -20, 66, -55, -12, 36, -121, 112, -44, -17, 107,
    -14, 100, 45, -31, 85, 52, 99, -3, 36, -55, 6, -20, 75, -76, -6, 37, 70, -33, 85, -34,
    122, 41, 103, -64, -30, 53, -2, -35, -18, 127, -27, -31, -89, -81, -82, -121, 22, 49, -79, 79,
    -26, 5, 84, 109, 72, -45, -117, 4, 22, 66, -94, -109, 59, -119, 58, -81, 81, 69, -112, -14
};


    // Seed 3
    const unsigned char     cr_data[NUM_PIXELS/2] = {
    76, -104, -123, -22, -16, -124, -118, 40, -90, 115, -29, -124, -117, 29, -86, -52, 96, 19, 60, -89,
    -98, 72, 115, -74, -51, -46, 26, -10, 21, -14, -99, 103, 21, 81, 0, -14, -13, -116, 18, -121,
    -77, -14, -31, -123, -52, -116, 112, 95, -8, 93, -89, 123, 75, -22, -118, 93, -121, -4, -83, 4,
    -83, -93, -25, -108, -41, 126, 70, 52, 69, 58, 66, 57, -76, 87, 52, -124, -10, 50, 8, 39,
    -65, 63, 49, 78, -68, -107, -35, 92, -23, -81, 105, 84, 35, 112, 23, 122, -4, 103, -2, 57,
    -50, 84, 65, 71, 18, -21, -125, 6, -14, -41, -102, 45, 28, 1, -126, -89, -40, 17, -109, -69,
    92, 52, -10, 108, 94, 32, 85, 33, -21, 84, -47, -119, 119, -92, 57, -72, 52, -12, 120, -107,
    -90, 67, 77, 120, 119, -21, 66, 15, -121, 38, -42, -127, 71, -44, -4, -44, 71, 122, -56, -109,
    12, -115, 103, -86, 39, -15, 80, -107, -126, -68, -71, -71, -4, 62, 75, 17, 56, 69, 24, 13,
    -78, -100, -52, -74, 18, -43, 34, 21, -60, 72, -102, -43, -56, 91, 104, 39, -58, 2, -81, -27,
    101, -119, -18, -6, -36, -111, -70, 0, -56, 87, -83, 42, 64, 60, -98, 99, 38, -127, 18, -73,
    -64, 81, -15, -14, -122, 4, 124, -122, 61, -95, 126, -79, 68, -91, -63, -33, 45, 2, -61, 76,
    -114, 106, -86, -19, 25, -52, 116, -112, -22, 30, 114, 65, 32, 93, -10, -16, -82, -47, 75, 80,
    114, -107, -27, 1, -121, 86, -39, -16, -41, 90, -114, -2, -13, -60, -76, -33, 38, 22, 117, 68,
    -58, -10, -21, 60, -50, 52, -47, -41, -87, 11, 124, 12, 80, -90, 11, -36, -106, -26, -35, -74,
    -62, 98, 67, 29, 94, -82, 118, -121, 78, -32, -53, -120, 35, 80, 36, 48, -79, -98, -86, -80,
    -34, -8, -72, 67, -68, -100, 26, 74, -38, -100, 118, -71, -42, -32, 10, -78, 55, 113, -105, 110,
    121, -12, -100, 100, 104, 115, -57, -93, -79, 99, -88, -125, -75, -30, -89, 124, -96, 63, 56, 85,
    -70, -65, 76, -128, -4, -98, 10, -60, -26, 84, -66, 28, -113, 24, 17, -33, -3, -87, 122, 32,
    -74, 75, -12, 87, -105, 15, -15, 64, -29, 88, -114, 2, -98, -103, 7, -108, 28, 99, 108, 92,
    -44, -98, -108, 24, 121, 22, 82, 1, 75, 57, -26, 45, -87, 30, -74, 52, -21, -55, 62, 22,
    110, -83, 67, 92, -17, 113, 78, 124, 28, -9, 88, -127, 104, -103, -63, -21, 30, -75, -121, -45,
    -71, 107, -77, 83, 114, -91, 22, 36, 25, 87, 53, -121, 40, 7, -127, 105, 20, -113, -53, -63,
    -26, 33, -10, 60, 10, -116, -19, 28, 103, -67, -41, 93, -81, -121, -119, 25, -9, -90, 60, 44,
    -119, 1, 127, 27, -7, 46, 110, 49, 118, 59, 36, -21, 97, -85, 109, -107, 35, -66, -64, 52
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
/*      IMG_ycbcr422p_rgb565 -- Planarized YCbCr 4:2:2/4:2:0 to 16-bit      */
/*                              RGB 5:6:5 color space conversion.           */
/*                                                                          */
/*  REVISION DATE                                                           */
/*      26-Aug-2001                                                         */
/*                                                                          */
/*  USAGE                                                                   */
/*      This function is C callable, and is called according to this        */
/*      C prototype:                                                        */
/*                                                                          */
/*      void IMG_ycbcr422p_rgb565                                           */
/*      (                                                                   */
/*        const short         coeff[5],  // Matrix coefficients.        //  */
/*        const unsigned char *y_data,   // Luminence data  (Y')        //  */
/*        const unsigned char *cb_data,  // Blue color-diff (B'-Y')     //  */
/*        const unsigned char *cr_data,  // Red color-diff  (R'-Y')     //  */
/*        unsigned short                                                    */
/*                   *restrict rgb_data, // RGB 5:6:5 packed pixel out. //  */
/*        unsigned            num_pixels // # of luma pixels to process //  */
/*      );                                                                  */
/*                                                                          */
/*      The 'coeff[]' array contains the color-space-conversion matrix      */
/*      coefficients.  The 'y_data', 'cb_data' and 'cr_data' pointers       */
/*      point to the separate input image planes.  The 'rgb_data' pointer   */
/*      points to the output image buffer.                                  */
/*                                                                          */
/*      The kernel is designed to process arbitrary amounts of 4:2:2        */
/*      image data, although 4:2:0 image data may be processed as well.     */
/*      For 4:2:2 input data, the 'y_data', 'cb_data' and 'cr_data'         */
/*      arrays may hold an arbitrary amount of image data, including        */
/*      multiple scan lines of image data.                                  */
/*                                                                          */
/*      For 4:2:0 input data, only a single scan-line (or portion           */
/*      thereof) may be processed at a time.  This is achieved by           */
/*      calling the function twice using the same row data for              */
/*      'cr_data' and 'cb_data', and providing new row data for             */
/*      'y_data'.  This is numerically equivalent to replicating the Cr     */
/*      and Cb pixels vertically.                                           */
/*                                                                          */
/*      The coefficients in the coeff array must be in signed Q13 form.     */
/*      These coefficients correspond to the following matrix equation:     */
/*                                                                          */
/*          [ coeff[0] 0.0000   coeff[1] ]   [ Y' -  16 ]     [ R']         */
/*          [ coeff[0] coeff[2] coeff[3] ] * [ Cb - 128 ]  =  [ G']         */
/*          [ coeff[0] coeff[4] 0.0000   ]   [ Cr - 128 ]     [ B']         */
/*                                                                          */
/*      The output from this kernel is 16-bit RGB in 5:6:5 format.          */
/*      The RGB components are packed into halfwords as shown below.        */
/*                                                                          */
/*                     15      11 10       5 4        0                     */
/*                    +----------+----------+----------+                    */
/*                    |   Red    |  Green   |   Blue   |                    */
/*                    +----------+----------+----------+                    */
/*                                                                          */
/*      This kernel can also return the red, green, and blue values in      */
/*      the opposite order if a particular application requires it.         */
/*      This is achieved by exchanging the 'cb_data' and 'cr_data'          */
/*      arguments when calling the function, and by reversing the order     */
/*      of coefficients in coeff[1] through coeff[4].  This essentially     */
/*      implements the following matrix multiply:                           */
/*                                                                          */
/*          [ coeff[0] 0.0000   coeff[4] ]   [ Y' -  16 ]     [ B']         */
/*          [ coeff[0] coeff[3] coeff[2] ] * [ Cr - 128 ]  =  [ G']         */
/*          [ coeff[0] coeff[1] 0.0000   ]   [ Cb - 128 ]     [ R']         */
/*                                                                          */
/*      The reversed RGB ordering output by this mode is as follows:        */
/*                                                                          */
/*                     15      11 10       5 4        0                     */
/*                    +----------+----------+----------+                    */
/*                    |   Blue   |  Green   |   Red    |                    */
/*                    +----------+----------+----------+                    */
/*                                                                          */
/*  DESCRIPTION                                                             */
/*      This kernel performs Y'CbCr to RGB conversion.  From the Color      */
/*      FAQ, http://home.inforamp.net/~poynton/ColorFAQ.html :              */
/*                                                                          */
/*          Various scale factors are applied to (B'-Y') and (R'-Y')        */
/*          for different applications.  The Y'PbPr scale factors are       */
/*          optimized for component analog video.  The Y'CbCr scaling       */
/*          is appropriate for component digital video, JPEG and MPEG.      */
/*          Kodak's PhotoYCC(tm) uses scale factors optimized for the       */
/*          gamut of film colors.  Y'UV scaling is appropriate as an        */
/*          intermediate step in the formation of composite NTSC or PAL     */
/*          video signals, but is not appropriate when the components       */
/*          are keps separate.  Y'UV nomenclature is now used rather        */
/*          loosely, and it sometimes denotes any scaling of (B'-Y')        */
/*          and (R'-Y').  Y'IQ coding is obsolete.                          */
/*                                                                          */
/*      This code can perform various flavors of Y'CbCr to RGB              */
/*      conversion as long as the offsets on Y, Cb, and Cr are -16,         */
/*      -128, and -128, respectively, and the coefficients match the        */
/*      pattern shown.                                                      */
/*                                                                          */
/*      The kernel implements the following matrix form, which involves 5   */
/*      unique coefficients:                                                */
/*                                                                          */
/*          [ coeff[0] 0.0000   coeff[1] ]   [ Y' -  16 ]     [ R']         */
/*          [ coeff[0] coeff[2] coeff[3] ] * [ Cb - 128 ]  =  [ G']         */
/*          [ coeff[0] coeff[4] 0.0000   ]   [ Cr - 128 ]     [ B']         */
/*                                                                          */
/*                                                                          */
/*      Below are some common coefficient sets, along with the matrix       */
/*      equation that they correspond to.   Coefficients are in signed      */
/*      Q13 notation, which gives a suitable balance between precision      */
/*      and range.                                                          */
/*                                                                          */
/*      1.  Y'CbCr -> RGB conversion with RGB levels that correspond to     */
/*          the 219-level range of Y'.  Expected ranges are [16..235] for   */
/*          Y' and [16..240] for Cb and Cr.                                 */
/*                                                                          */
/*          coeff[] = { 0x2000, 0x2BDD, -0x0AC5, -0x1658, 0x3770 };         */
/*                                                                          */
/*          [ 1.0000    0.0000    1.3707 ]   [ Y' -  16 ]     [ R']         */
/*          [ 1.0000   -0.3365   -0.6982 ] * [ Cb - 128 ]  =  [ G']         */
/*          [ 1.0000    1.7324    0.0000 ]   [ Cr - 128 ]     [ B']         */
/*                                                                          */
/*      2.  Y'CbCr -> RGB conversion with the 219-level range of Y'         */
/*          expanded to fill the full RGB dynamic range.  (The matrix       */
/*          has been scaled by 255/219.)  Expected ranges are [16..235]     */
/*          for Y' and [16..240] for Cb and Cr.                             */
/*                                                                          */
/*          coeff[] = { 0x2543, 0x3313, -0x0C8A, -0x1A04, 0x408D };         */
/*                                                                          */
/*          [ 1.1644    0.0000    1.5960 ]   [ Y' -  16 ]     [ R']         */
/*          [ 1.1644   -0.3918   -0.8130 ] * [ Cb - 128 ]  =  [ G']         */
/*          [ 1.1644    2.0172    0.0000 ]   [ Cr - 128 ]     [ B']         */
/*                                                                          */
/*      3.  Y'CbCr -> BGR conversion with RGB levels that correspond to     */
/*          the 219-level range of Y'.  This is equivalent to #1 above,     */
/*          except that the R, G, and B output order in the packed          */
/*          pixels is reversed.  Note:  The 'cr_data' and 'cb_data'         */
/*          input arguments must be exchanged for this example as           */
/*          indicated under USAGE above.                                    */
/*                                                                          */
/*          coeff[] = { 0x2000, 0x3770, -0x1658, -0x0AC5, 0x2BDD };         */
/*                                                                          */
/*          [ 1.0000    0.0000    1.7324 ]   [ Y' -  16 ]     [ B']         */
/*          [ 1.0000   -0.6982   -0.3365 ] * [ Cr - 128 ]  =  [ G']         */
/*          [ 1.0000    1.3707    0.0000 ]   [ Cb - 128 ]     [ R']         */
/*                                                                          */
/*      4.  Y'CbCr -> BGR conversion with the 219-level range of Y'         */
/*          expanded to fill the full RGB dynamic range.  This is           */
/*          equivalent to #2 above, except that the R, G, and B output      */
/*          order in the packed pixels is reversed.  Note:  The             */
/*          'cr_data' and 'cb_data' input arguments must be exchanged       */
/*          for this example as indicated under USAGE above.                */
/*                                                                          */
/*          coeff[] = { 0x2000, 0x408D, -0x1A04, -0x0C8A, 0x3313 };         */
/*                                                                          */
/*          [ 1.0000    0.0000    2.0172 ]   [ Y' -  16 ]     [ B']         */
/*          [ 1.0000   -0.8130   -0.3918 ] * [ Cr - 128 ]  =  [ G']         */
/*          [ 1.0000    1.5960    0.0000 ]   [ Cb - 128 ]     [ R']         */
/*                                                                          */
/*      Other scalings of the color differences (B'-Y') and (R'-Y')         */
/*      (sometimes incorrectly referred to as U and V) are supported, as    */
/*      long as the color differences are unsigned values centered around   */
/*      128 rather than signed values centered around 0, as noted above.    */
/*                                                                          */
/*      In addition to performing plain color-space conversion, color       */
/*      saturation can be adjusted by scaling coeff[1] through coeff[4].    */
/*      Similarly, brightness can be adjusted by scaling coeff[0].          */
/*      General hue adjustment can not be performed, however, due to the    */
/*      two zeros hard-coded in the matrix.                                 */
/*                                                                          */
/*  TECHNIQUES                                                              */
/*      Pixel replication is performed implicitly on chroma data to         */
/*      reduce the total number of multiplies required.  The chroma         */
/*      portion of the matrix is calculated once for each Cb, Cr pair,      */
/*      and the result is added to both Y' samples.                         */
/*                                                                          */
/*  SOURCE                                                                  */
/*      Poynton, Charles et al.  "The Color FAQ,"  1999.                    */
/*          http://home.inforamp.net/~poynton/ColorFAQ.html                 */
/*                                                                          */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2002 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */

void IMG_ycbcr422p_rgb565_c
(
    const short             coeff[5],   /* Matrix coefficients.             */
    const unsigned char     *y_data,    /* Luminence data        (Y')       */
    const unsigned char     *cb_data,   /* Blue color-difference (B'-Y')    */
    const unsigned char     *cr_data,   /* Red color-difference  (R'-Y')    */
    unsigned short *rgb_data,  /* RGB 5:6:5 packed pixel output.   */
    unsigned                num_pixels  /* # of luma pixels to process.     */
)
{
    int     i;                      /* Loop counter                     */
    int     y0, y1;                 /* Individual Y components          */
    int     cb, cr;                 /* Color difference components      */
    int     y0t,y1t;                /* Temporary Y values               */
    int     rt, gt, bt;             /* Temporary RGB values             */
    int     r0, g0, b0;             /* Individual RGB components        */
    int     r1, g1, b1;             /* Individual RGB components        */
    int     r0t,g0t,b0t;            /* Truncated RGB components         */
    int     r1t,g1t,b1t;            /* Truncated RGB components         */
    int     r0s,g0s,b0s;            /* Saturated RGB components         */
    int     r1s,g1s,b1s;            /* Saturated RGB components         */

    short   luma = coeff[0];        /* Luma scaling coefficient.        */
    short   r_cr = coeff[1];        /* Cr's contribution to Red.        */
    short   g_cb = coeff[2];        /* Cb's contribution to Green.      */
    short   g_cr = coeff[3];        /* Cr's contribution to Green.      */
    short   b_cb = coeff[4];        /* Cb's contribution to Blue.       */

    unsigned short  rgb0, rgb1;     /* Packed RGB pixel data            */

    /* -------------------------------------------------------------------- */
    /*  Iterate for num_pixels/2 iters, since we process pixels in pairs.   */
    /* -------------------------------------------------------------------- */
    i = num_pixels >> 1;

    while (i-->0)
    {
        /* ---------------------------------------------------------------- */
        /*  Read in YCbCr data from the separate data planes.               */
        /*                                                                  */
        /*  The Cb and Cr channels come in biased upwards by 128, so        */
        /*  subtract the bias here before performing the multiplies for     */
        /*  the color space conversion itself.  Also handle Y's upward      */
        /*  bias of 16 here.                                                */
        /* ---------------------------------------------------------------- */

        y0 = *y_data++  - 16;
        y1 = *y_data++  - 16;
        cb = *cb_data++ - 128;
        cr = *cr_data++ - 128;

        /* ================================================================ */
        /*  Convert YCrCb data to RGB format using the following matrix:    */
        /*                                                                  */
        /*      [ coeff[0] 0.0000   coeff[1] ]   [ Y' -  16 ]     [ R']     */
        /*      [ coeff[0] coeff[2] coeff[3] ] * [ Cb - 128 ]  =  [ G']     */
        /*      [ coeff[0] coeff[4] 0.0000   ]   [ Cr - 128 ]     [ B']     */
        /*                                                                  */
        /*  We use signed Q13 coefficients for the coefficients to make     */
        /*  good use of our 16-bit multiplier.  Although a larger Q-point   */
        /*  may be used with unsigned coefficients, signed coefficients     */
        /*  add a bit of flexibility to the kernel without significant      */
        /*  loss of precision.                                              */
        /* ================================================================ */

        /* ---------------------------------------------------------------- */
        /*  Calculate chroma channel's contribution to RGB.                 */
        /* ---------------------------------------------------------------- */
        rt  = r_cr * (short)cr;
        gt  = g_cb * (short)cb + g_cr * (short)cr;
        bt  = b_cb * (short)cb;

        /* ---------------------------------------------------------------- */
        /*  Calculate intermediate luma values.  Include bias of 16 here.   */
        /* ---------------------------------------------------------------- */
        y0t = luma * (short)y0;
        y1t = luma * (short)y1;

        /* ---------------------------------------------------------------- */
        /*  Mix luma, chroma channels.                                      */
        /* ---------------------------------------------------------------- */
        r0  = y0t + rt; r1 = y1t + rt;
        g0  = y0t + gt; g1 = y1t + gt;
        b0  = y0t + bt; b1 = y1t + bt;

        /* ================================================================ */
        /*  At this point in the calculation, the RGB components are        */
        /*  nominally in the format below.  If the color is outside the     */
        /*  our RGB gamut, some of the sign bits may be non-zero,           */
        /*  triggering saturation.                                          */
        /*                                                                  */
        /*                  3     2 2        1 1                            */
        /*                  1     1 0        3 2         0                  */
        /*                 [ SIGN  | COLOR    | FRACTION ]                  */
        /*                                                                  */
        /*  This gives us an 8-bit range for each of the R, G, and B        */
        /*  components.  (The transform matrix is designed to transform     */
        /*  8-bit Y/C values into 8-bit R,G,B values.)  To get our final    */
        /*  5:6:5 result, we "divide" our R, G and B components by 4, 8,    */
        /*  and 4, respectively, by reinterpreting the numbers in the       */
        /*  format below:                                                   */
        /*                                                                  */
        /*          Red,    3     2 2     1 1                               */
        /*          Blue    1     1 0     6 5            0                  */
        /*                 [ SIGN  | COLOR | FRACTION    ]                  */
        /*                                                                  */
        /*                  3     2 2      1 1                              */
        /*          Green   1     1 0      5 4           0                  */
        /*                 [ SIGN  | COLOR  | FRACTION   ]                  */
        /*                                                                  */
        /*  "Divide" is in quotation marks because this step requires no    */
        /*  actual work.  The code merely treats the numbers as having a    */
        /*  different Q-point.                                              */
        /* ================================================================ */

        /* ---------------------------------------------------------------- */
        /*  Shift away the fractional portion, and then saturate to the     */
        /*  RGB 5:6:5 gamut.                                                */
        /* ---------------------------------------------------------------- */
        r0t = r0 >> 16;
        g0t = g0 >> 15;
        b0t = b0 >> 16;
        r1t = r1 >> 16;
        g1t = g1 >> 15;
        b1t = b1 >> 16;

        r0s = r0t < 0 ? 0 : r0t > 31 ? 31 : r0t;
        g0s = g0t < 0 ? 0 : g0t > 63 ? 63 : g0t;
        b0s = b0t < 0 ? 0 : b0t > 31 ? 31 : b0t;
        r1s = r1t < 0 ? 0 : r1t > 31 ? 31 : r1t;
        g1s = g1t < 0 ? 0 : g1t > 63 ? 63 : g1t;
        b1s = b1t < 0 ? 0 : b1t > 31 ? 31 : b1t;

        /* ---------------------------------------------------------------- */
        /*  Merge values into output pixels.                                */
        /* ---------------------------------------------------------------- */
        rgb0 = (r0s << 11) + (g0s <<  5) + (b0s <<  0);
        rgb1 = (r1s << 11) + (g1s <<  5) + (b1s <<  0);

        /* ---------------------------------------------------------------- */
        /*  Store resulting pixels to memory.                               */
        /* ---------------------------------------------------------------- */
        *rgb_data++ = rgb0;
        *rgb_data++ = rgb1;
    }

    return;
}

int main() {


    unsigned short rgb_data[NUM_PIXELS];  /* RGB 5:6:5 packed pixel output.   */
    unsigned                num_pixels = NUM_PIXELS;  /* # of luma pixels to process.     */


IMG_ycbcr422p_rgb565_c
(
    coeff,   /* Matrix coefficients.             */
    y_data,    /* Luminence data        (Y')       */
    cb_data,   /* Blue color-difference (B'-Y')    */
    cr_data,   /* Red color-difference  (R'-Y')    */
    rgb_data,  /* RGB 5:6:5 packed pixel output.   */
    num_pixels  /* # of luma pixels to process.     */
);

	return 0;
}

/* ======================================================================== */
/*  End of file:  img_ycbcr422p_rgb565.c                                    */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2002 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */
