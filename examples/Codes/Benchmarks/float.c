#include <stdio.h>

float a[10] = {100.0,99.0,98.0,97.0,96.0,95.0,94.0,93.0,92.0,91.0};
float b = 2.5;

int main () {

	int i;
        for (i = 0; i < 10; i++) {
                a[i] = a[i]+(b--);
                printf("%f, ", a[i]);
        }
        return 0;

}
