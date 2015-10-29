//#define TP

/*===============================================================================
*
*       TEXAS INSTRUMENTS, INC.
*
*       GSM RATE-1/2 CONVOLUTIONAL DECODER (VITERBI ALGORITHM, SOFT DECISION)
*
*       Revision Data: 04/22/97
*
*       USAGE This routine is C callable and can be called as
*
*               void vitgsm(int n, short old[], short new_s[],
*                           short trans[], short m[], short sd[])
*
*               n       --- decoder input length                (input)
*               old[]   --- state metrics at previous instant   (input)
*               new_s[] --- state metrics at current instant    (output)
*               trans[] --- path transition of each state       (output)
*               m[]     --- local variable array to store path metrics
*               sd[]    --- soft decision values of input bit stream (input)
*
*       C CODE
*               This is the C equivalent of the Assembly Code without the
*               assumptions listed below. Note that the assembly code is hand
*               optimized and assumptions apply.
*
*/

//#include "XPP.h"
#include <stdio.h>

// decoder input length
#define N 189

 // input
 // seed 0
 short old[24] = {
    -19360, 20792, -13446, 28862, -13834, -4038, 28855,
    9475, -17858, -22675, -13013, -4021, -15837, -5811,
    -27857, 3928, 6920, -20217, -19214, -12047, 25103,
    -28048, 26456, -22282
};


short sd[2*N+1] = {
    -19360, 20792, -13446, 28862, -13834, -4038, 28855,
    9475, -17858, -22675, -13013, -4021, -15837, -5811,
    -27857, 3928, 6920, -20217, -19214, -12047, 25103,
    -28048, 26456, -22282, -20584, 21816, -4321, -8012,
    8968, -28833, -25533, 30842, -6453, -3353, -26716,
    3692, -3941, 17098, 26341, -8554, 513, 9006,
    19094, 12356, -21220, 14550, -9580, -15216, 24992,
    19420, -31569, 6715, -14815, 24989, -11890, -25920,
    -7791, 499, -27697, 1190, -9977, 7081, 25970,
    -22763, 17857, 15403, 6007, 17068, 26476, 3709,
    -2108, -23663, -18782, 21870, 4428, 18633, -25677,
    -10996, -13714, -21304, 19879, -8358, -31334, 843,
    7555, 30784, 10298, -32666, -20021, 17602, -21554,
    31960, -2488, -18060, 7513, 2982, -15349, 15405,
    -20741, -11034, -31311, 11514, -16417, 18907, 23527,
    2646, -426, -31166, -31184, 9367, 2116, 29419,
    5093, -27478, 11706, -630, 8573, 27138, 14820,
    31182, 9742, 17357, 26149, 32691, 5396, -13976,
    -9344, -9452, 22640, -18923, 26169, 24707, -6478,
    27627, 16315, -17572, -1638, 16909, 4796, -30441,
    10459, 542, -25186, 21982, -4829, 18676, -26856,
    20063, -12457, -16757, -18155, -17694, -14301, 22843,
    5596, -26723, -27727, 8237, 7024, -8633, -585,
    8459, -5831, 21738, 27063, -29450, -9245, -2563,
    7042, 12477, 29573, 17841, 1021, -17334, -2042,
    10379, 5671, -29345, 32700, 3890, 26714, -3710,
    15445, -29814, -23088, 4918, 12794, -23808, -27544,
    1643, -17231, 29223, -19798, -22474, -30718, -2684,
    12808, 17860, -8995, 2981, -11930, 16012, 27066,
    1144, 23516, 5572, -5887, 20953, -12358, -22763,
    18861, 11628, 29132, 29329, 15915, 18348, 20702,
    13284, 21895, -11196, -638, 14537, 714, -30819,
    31248, 10944, 13981, 22967, -22803, 16381, 28465,
    8764, -20720, 1955, 25186, 25042, 14530, 17713,
    -23014, -13136, 24228, -28868, -1293, 27252, -19210,
    -23202, 7456, 24370, -8427, -20114, 16269, -20016,
    31045, -6159, -27325, -23664, 23217, 15311, -29423,
    27885, 29615, 6473, -23704, 29611, -13241, 23594,
    -4474, 20009, 26357, -2756, -14121, 10233, 2990,
    -3331, 15767, 23474, 16160, -7790, 7099, 22020,
    -5570, -18948, -11503, 5644, 30203, -18295, 32678,
    -8472, 24404, 8844, -14489, -4466, -30828, 25424,
    28170, 19929, -15149, 16457, -15570, 3556, 30399,
    17548, 20160, -31077, 9118, 13184, 24481, 27278,
    24979, 29397, 24709, -15352, -28641, -24651, 5918,
    12128, 9706, -15558, 12664, -6514, -26941, -9697,
    -14938, 29184, 5605, -23623, -22626, 4782, -18308,
    -5081, -18079, 14700, -17305, -14904, -26274, -24706,
    -2242, 26093, 21272, -11151, -20075, -26417, -2554,
    21800, 29314, 195, 14009, -32716, 32604, -27477,
    32324, -1175, 5061, 4527, 3031, 24237, -27157,
    21549, 3245, 14355, 19210, -13331, -12760, -17113,
    20532, 32665, 28217, -17013, -9388, 21355, -20987,
    -21822, 2160, -30936, -13627, -14005, -18643, -24756,
    -32531
};


void vitgsm(int n, short old[], short new_s[], short trans[], short m[], short sd[]) 
{  
  int tmp1;
  int   i, j, k, a, b, m0, m1, mj;

  for (i = 0; i < n; i++) {
    m0 = sd[2 * i] + sd[2 * i + 1];
    m1 = sd[2 * i] - sd[2 * i + 1];
    m[0] = m[2] = m0;
    m[1] = m[3] = -m0;
    m[4] = m[6] = m1;
    m[5] = m[7] = -m1;
    for (j = 0; j < 8; j++) {
      mj = m[j];
      for (k = 0; k < 16; k += 8) {

	a = old[2 * j] + mj;
	b = old[2 * j + 1] - mj;

	new_s[j + k] = (b > a) ? b : a;

	trans[i] = (trans[i] << 1) | (b > a);
	mj = -mj;
      }
    }
		

    // change of values (POINTERs)
    //tmp = old;
    //old = new_s;
    //new_s = tmp;
    for (j = 0; j < 8; j++) { // NO POINTERs
      tmp1 = old[j];
      old[j] = new_s[j];
      new_s[j] = tmp1;
    }
  }


int c;

for (c=0; c < 24; c++)
{
	printf("%d, ", old[c]);
}

}

int main() {

 // ouput --> testar
 short new_s[24];
 short trans[N];

 // local
 short m[8];

 int n = N;

 vitgsm(n, old, new_s, trans, m, sd);

/*
old e sd definidos no início
n, new_s, trans e m definidos acima
*/

 return 0;
}
