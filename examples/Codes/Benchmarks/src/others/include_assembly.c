#include "aux.s"

extern int sum_args(int, int, int, int);

int a = 10, b = 20, c = 30, d = 40;

int main () {

	printf("%d\n", sum_args(a, b, c, d));
	printf("%d\n", sum_args(b, c, a, d));

}
