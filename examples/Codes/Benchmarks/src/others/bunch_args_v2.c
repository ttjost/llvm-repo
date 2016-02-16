#include<stdio.h> 

int a = 100, b = 2, c = 101, d = 106, e = 110, f = 116, g = 111, h = 121, i = 131;
char j = 141;
short k = -10;

int func (int a, int b, int c, int d,
	 int e, int f, int g, int h,
	 int i, char j, short k) {

	int res1 = a/b+c*d+e;
	int res2 = a/b+f+g+h+i+j+k;

	printf("%d  %d   =>   ", res1, res2);

	if (res1 > res2)
		return res1;
	return res2;
}

main () {


	printf("%d\n", func(a, b, c, d, e, f, g, h, i, j, k));
	printf("%d\n", func(c, b, a, d, e, f, g, h, i, j, k));

}
