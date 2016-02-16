#include <stdio.h>

int a[10] = {100,99,98,97,96,95,94,93,92,91};
int  b = 10;
int main() {

	int i;

	for (i = 0; i < 10; i++) {
		a[i] = a[i]/b++;
		printf("%d, ", a[i]);
	}	
	return 0;
}
