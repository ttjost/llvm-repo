#include "common.h"

#include <stdint.h>

uint8_t gQSortNum[1000] = {
  57, 126, 223, 44, 11, 138, 251, 232, 143, 86, 215, 60, 83, 30, 115, 48, 87, 46, 49, 164, 101, 198, 235, 72, 31,
  6, 57, 12, 227, 110, 157, 96, 25, 34, 191, 140, 43, 22, 37, 136, 175, 182, 183, 220, 115, 66, 173, 144, 137, 114,
  81, 68, 69, 102, 203, 168, 193, 102, 167, 172, 3, 14, 67, 64, 249, 62, 159, 20, 75, 74, 187, 216, 207, 22, 151,
  124, 109, 162, 51, 16, 151, 18, 143, 28, 37, 250, 171, 8, 95, 58, 135, 76, 221, 82, 221, 224, 217, 158, 127, 76,
  107, 170, 155, 200, 239, 138, 119, 228, 77, 2, 237, 176, 183, 178, 111, 132, 5, 166, 139, 104, 129, 218, 103, 20, 189,
  78, 3, 128, 185, 2, 95, 172, 139, 10, 123, 104, 241, 214, 169, 188, 211, 98, 13, 80, 41, 82, 177, 220, 229, 186,
  149, 200, 159, 134, 71, 116, 99, 18, 29, 224, 103, 162, 193, 12, 171, 150, 165, 248, 209, 202, 201, 92, 13, 62, 211,
  16, 247, 14, 209, 60, 59, 26, 181, 40, 191, 230, 39, 44, 125, 114, 195, 64, 135, 190, 225, 148, 53, 202, 197, 168,
  79, 106, 23, 4, 19, 34, 77, 144, 23, 146, 241, 156, 91, 122, 43, 136, 223, 70, 249, 52, 163, 46, 93, 96, 89,
  30, 255, 52, 21, 214, 229, 72, 111, 10, 9, 156, 205, 126, 147, 48, 55, 50, 239, 252, 133, 38, 11, 232, 1, 166,
  25, 108, 61, 206, 125, 0, 199, 126, 223, 44, 11, 118, 251, 24, 113, 170, 215, 60, 83, 30, 115, 48, 169, 210, 49,
  92, 101, 58, 21, 184, 225, 6, 199, 244, 227, 146, 99, 96, 25, 222, 65, 140, 213, 22, 219, 136, 175, 182, 73, 36,
  141, 190, 83, 112, 137, 114, 175, 188, 187, 102, 53, 168, 193, 154, 167, 172, 3, 242, 67, 64, 7, 62, 159, 236, 75,
  182, 187, 40, 49, 234, 105, 124, 109, 162, 205, 16, 105, 238, 143, 28, 37, 6, 85, 248, 161, 58, 121, 180, 221, 174,
  221, 32, 217, 98, 129, 76, 149, 170, 101, 200, 239, 118, 137, 28, 179, 254, 19, 80, 183, 178, 145, 124, 251, 166, 139,
  152, 129, 38, 153, 20, 189, 78, 3, 128, 71, 254, 95, 84, 139, 10, 123, 152, 241, 214, 169, 68, 211, 98, 13, 80,
  215, 82, 79, 36, 229, 70, 149, 56, 159, 134, 185, 140, 99, 18, 29, 224, 153, 94, 63, 244, 85, 150, 91, 248, 209,
  202, 55, 92, 243, 194, 211, 240, 247, 242, 209, 196, 197, 26, 75, 40, 191, 26, 39, 44, 131, 142, 195, 64, 121, 190,
  225, 148, 53, 54, 197, 88, 79, 106, 233, 252, 19, 34, 77, 144, 233, 146, 241, 100, 91, 134, 43, 136, 33, 70, 249,
  204, 163, 210, 163, 96, 89, 226, 1, 52, 235, 214, 27, 72, 111, 246, 247, 156, 51, 130, 109, 208, 55, 50, 17, 252,
  123, 218, 245, 232, 255, 90, 231, 108, 195, 50, 125, 0, 199, 130, 223, 212, 11, 138, 251, 232, 143, 86, 215, 196, 83,
  30, 141, 48, 87, 46, 207, 92, 155, 58, 235, 184, 31, 6, 199, 12, 29, 146, 157, 160, 231, 34, 191, 116, 213, 22,
  37, 136, 175, 74, 183, 36, 115, 66, 173, 144, 137, 142, 175, 188, 69, 102, 53, 168, 193, 102, 89, 172, 253, 242, 67,
  192, 7, 62, 159, 20, 181, 182, 187, 216, 207, 22, 105, 132, 109, 162, 205, 16, 151, 18, 113, 228, 37, 6, 85, 8,
  161, 58, 135, 76, 35, 174, 35, 224, 39, 158, 127, 180, 149, 86, 155, 200, 239, 118, 119, 28, 77, 254, 19, 176, 183,
  78, 145, 132, 5, 90, 117, 152, 127, 218, 153, 20, 67, 178, 3, 128, 185, 254, 95, 172, 139, 246, 123, 104, 15, 42,
  169, 68, 211, 98, 243, 80, 41, 174, 79, 36, 27, 186, 107, 56, 97, 134, 71, 116, 157, 238, 227, 32, 153, 162, 193,
  244, 171, 150, 165, 248, 209, 54, 55, 164, 13, 194, 45, 16, 247, 242, 47, 60, 59, 26, 75, 40, 65, 230, 217, 44,
  131, 142, 195, 192, 121, 190, 225, 108, 203, 202, 197, 168, 177, 150, 233, 252, 19, 34, 77, 144, 23, 110, 15, 100, 91,
  122, 213, 120, 223, 70, 7, 52, 93, 46, 93, 160, 167, 226, 255, 204, 21, 42, 229, 72, 111, 246, 9, 100, 205, 126,
  147, 48, 55, 206, 239, 4, 133, 218, 245, 232, 255, 166, 231, 108, 195, 50, 131, 0, 57, 130, 223, 44, 245, 118, 251,
  232, 113, 86, 215, 196, 83, 30, 141, 48, 87, 46, 207, 92, 155, 198, 235, 72, 31, 250, 57, 244, 29, 110, 99, 160,
  231, 34, 65, 116, 43, 22, 219, 136, 175, 74, 73, 220, 141, 190, 83, 112, 137, 142, 81, 68, 69, 154, 203, 88, 63,
  154, 89, 172, 3, 242, 67, 192, 249, 62, 159, 20, 181, 74, 69, 216, 49, 22, 105, 132, 109, 162, 205, 16, 151, 18,
  113, 228, 219, 250, 171, 8, 95, 58, 135, 180, 35, 82, 221, 224, 39, 98, 129, 180, 107, 86, 101, 200, 239, 118, 119,
  228, 179, 2, 237, 80, 183, 78, 111, 124, 5, 90, 117, 104, 127, 38, 153, 20, 67, 178, 253, 128, 185, 254, 95, 172,
  117, 10, 123, 152, 241, 42, 87, 188, 211, 98, 243, 80, 215, 82, 79, 36, 27, 186, 107, 200, 159, 122, 71, 140, 157,
  238, 29, 224, 153, 94, 63, 244, 85, 106, 91, 248, 47, 54, 201, 164, 243, 62, 211, 240, 247, 242, 47, 196, 197, 230,
  181, 216, 65, 26, 217, 44, 125, 114, 195, 192, 135, 190, 31, 148, 203, 202, 59, 88, 79, 150, 233, 252, 19, 34, 77,
  144, 233, 146, 15, 100, 165, 122, 213, 136, 223, 70, 249, 204, 93, 46, 93, 96, 167, 30, 1, 204, 21, 42, 27, 72
};
void QSORT(int8_t *base, int32_t n, int32_t size, int32_t (*compar) ());
int32_t compare(int8_t *n1, int8_t *n2)
{
  return (*((uint8_t *) n1) - *((uint8_t *) n2));
}
int main()
{
  uint8_t SortArr[1000];
  int32_t j;
  memcpy(SortArr, gQSortNum, 1000);
  QSORT((int8_t *) SortArr, (int32_t) 1000, sizeof(uint8_t), compare);
  for (j = 1; j < 1000; j++)
  {
      if (SortArr[j] < SortArr[j - 1])
      {
	  return 0x0F;
      }
  }
  return 0x42;
}
static int32_t (*qcmp) ();
static int32_t qsz;
static int32_t thresh;
static int32_t mthresh;
static void qst(int8_t *, int8_t *);
void QSORT(base, n, size, compar)
     int8_t *base;
     int32_t n;
     int32_t size;
     int32_t (*compar) ();
{
  register int8_t c, *i, *j, *lo, *hi;
  int8_t *min, *max;
  if (n <= 1)
    return;
  qsz = size;
  qcmp = compar;
  thresh = qsz * 4;
  mthresh = qsz * 6;
  max = base + n * qsz;
  if (n >= 4)
    {
      qst(base, max);
      hi = base + thresh;
    } 
  else
    {
      hi = max;
    }
  for (j = lo = base; (lo += qsz) < hi;)
    if ((*qcmp) (j, lo) > 0)
      j = lo;
  if (j != base)
    {
      for (i = base, hi = base + qsz; i < hi;)
	{
	  c = *j;
	  *j++ = *i;
	  *i++ = c;
	}
    }
  for (min = base; (hi = min += qsz) < max;)
    {
      while ((*qcmp) (hi -= qsz, min) > 0)
	;
      if ((hi += qsz) != min)
	{
	  for (lo = min + qsz; --lo >= min;)
	    {
	      c = *lo;
	      for (i = j = lo; (j -= qsz) >= hi; i = j)
		*i = *j;
	      *i = c;
	    }
	}
    }
}
static
void qst(base, max)
     int8_t *base, *max;
{
  register int8_t c, *i, *j, *jj;
  register int32_t ii;
  int8_t *mid, *tmp;
  int32_t lo, hi;
  lo = max - base;
  do
    {
      mid = i = base + qsz * ((lo / qsz) >> 1);
      if (lo >= mthresh)
	{
	  j = ((*qcmp) ((jj = base), i) > 0 ? jj : i);
	  if ((*qcmp) (j, (tmp = max - qsz)) > 0)
	    {
	      j = (j == jj ? i : jj);
	      if ((*qcmp) (j, tmp) < 0)
		j = tmp;
	    }
	  if (j != i)
	    {
	      ii = qsz;
	      do
		{
		  c = *i;
		  *i++ = *j;
		  *j++ = c;
		}
	      while (--ii);
	    }
	}
      for (i = base, j = max - qsz;;)
	{
	  while (i < mid && (*qcmp) (i, mid) <= 0)
            i += qsz;
	  while (j > mid)
	    {
	      if ((*qcmp) (mid, j) <= 0)
		{
		  j -= qsz;
		  continue;
		}
	      tmp = i + qsz;
	      if (i == mid)
		{
		  mid = jj = j;
		} 
	      else
		{
		  jj = j;
		  j -= qsz;
		}
	      goto swap;
	    }
	  if (i == mid)
	    {
	      break;
	    } 
	  else
	    {
	      jj = mid;
	      tmp = mid = i;
	      j -= qsz;
	    }
	swap:
	  ii = qsz;
	  do
	    {
	      c = *i;
	      *i++ = *jj;
	      *jj++ = c;
	    }
	  while (--ii);
	  i = tmp;
	}
      i = (j = mid) + qsz;
      if ((lo = j - base) <= (hi = max - i))
	{
	  if (lo >= thresh)
            qst(base, j);
	  base = i;
	  lo = hi;
	} 
      else
	{
	  if (hi >= thresh)
            qst(i, max);
	  max = j;
	}
    }
  while (lo >= thresh);
}
