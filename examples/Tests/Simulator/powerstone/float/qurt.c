#define ENABLE_FLOAT
#include "../common.h"

int qurt(double a[], double x1[], double x2[])
{
  double d, w1, w2;
  if(a[0] == 0.0)
    return (999);
  d = a[1] * a[1] - 4 * a[0] * a[2];
  w1 = 2.0 * a[0];
  w2 = sqrt(fabs(d));
  if(d > 0.0)
    {
      x1[0] = (-a[1] + w2) / w1;
      x1[1] = 0.0;
      x2[0] = (-a[1] - w2) / w1;
      x2[1] = 0.0;
      return (0);
    } 
  else if(d == 0.0)
    {
      x1[0] = -a[1] / w1;
      x1[1] = 0.0;
      x2[0] = x1[0];
      x2[1] = 0.0;
      return (0);
    } 
  else
    {
      w2 /= w1;
      x1[0] = -a[1] / w1;
      x1[1] = w2;
      x2[0] = x1[0];
      x2[1] = -w2;
      return (0);
    }
}
int main()
{
  double a[3], x1[2], x2[2];
  int result;
  double result2;
  a[0] = 1.75;
  a[1] = -3.2;
  a[2] = 2.45;
  qurt(a, x1, x2);
  result = *(int *) &x1[0];
  result2 = x1[0];
  a[0] = 1.5;
  a[1] = -2.5;
  a[2] = 1.5;
  qurt(a, x1, x2);
  result += *(int *) &x1[1];
  result2 += x1[1];
  a[0] = 1.8;
  a[1] = -4.275;
  a[2] = 8.31;
  qurt(a, x1, x2);
  result -= *(int *) &x1[1];
  result2 += x1[1];
  if(result != -1776094907 && (result2 < 3.257729 || result2 > 3.257731))
    {
      return 0x0F;
    } 
  else
    {
      return 0x42;
    }
  return 0;
}
