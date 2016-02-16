#include <stdio.h>

typedef struct  {
    int low;
    int high;
} int_64_t;

int_64_t returnInt64() {

    int_64_t number;
    number.low = 10;
    number.high = 66;

    return number;
}

int main () {

    int_64_t n = returnInt64();
    printf("%d   %d\n", n.low, n.high);

    return 0;
}

