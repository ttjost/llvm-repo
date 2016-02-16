#include <stdio.h>

typedef struct  {
    int low;
    int high;
} int_64_t;

int_64_t updateNumber(int_64_t n) {

    int_64_t newNumber;
    newNumber.low = n.low + 1;
    newNumber.high = n.high + 1;
    
    printf("New low: %d, New high: %d\n", newNumber.low, newNumber.high);
    return newNumber;
}

int main() {

    int_64_t number;
    
    number.low = 10;
    number.high = 2;
    
    number = updateNumber(number);
    
    return 0;
}
