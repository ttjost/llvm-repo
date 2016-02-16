#include<stdio.h>

long int a[10];

int main () {

        int aux1 = 999000000;
        int aux2 = 101001;
        int i;

        for (i = 0; i < 10; i++) {
                a[i] = (long int)aux1++*(long int)aux2++;
                printf("%ld\n", a[i]);
        }
}

