#include<stdio.h> 

int a = 100, b = 2, c = 10, d = 10, e = 10, f = 10, g = 10, h = 10, i = 10, j = 10, k = 10;

int func (int a, int b, int c, int d,
	 int e, int f, int g, int h,
	 int i, int j, int k) {

	int res1 = a/b+c*d+e;
	int res2 = a/b+f+g+h+i+j+k;

	if (res1 > res2)
		return res1;
	return res2;
}

main () {


	printf("%d\n", func(a, b, c, d, e, f, g, h, i, j, k));
	printf("%d\n", func(b, c, a, d, e, f, g, h, i, j, k));

}
