#include <stdio.h>

typedef unsigned int uint32_t;
typedef signed int int32_t;
typedef unsigned char uint8_t;
typedef signed char int8_t;


typedef int32_t fp15p17_t;
typedef uint32_t ufp27p5_t;

/* a 64 bit integer*/
typedef struct {
	uint32_t high;
	uint32_t low;
} int_64_t;

int_64_t neg(int_64_t x)
{	
	x.low = ~x.low;
	x.high = ~x.high;

    printf("neg high: %d\n", x.high);
    printf("neg low: %d\n", x.low);
    
	return x;
}

int main(void) 
{
    int_64_t i;
    
    i.low = 1;
    i.high = 2;
    
    printf("1. high: %d\n", i.high);
    printf("1. low: %d\n", i.low);

    i = neg(i);

    printf("2. high: %d\n", i.high);
    printf("2. low: %d\n", i.low);
    
    printf("-1\n");
    
    return -1;
}
 


