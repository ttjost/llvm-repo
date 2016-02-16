#include <stdio.h>

int a = -10;
int b = 2;
int c = 5;
int key;

unsigned ua = 10;
unsigned ub = 2;
unsigned uc = 5;

int division() {

//	if (key > 0)
//		a = a/b;
//	else
//		a = a/c;

	ua = ua/uc;	
	//return a+ua;
	return ua;
}

int main() {
	
//	printf("Type a number: ");
//	scanf("%d",&key);
	
	key = division();

	printf("\nDiv is %d\n", key);
	return 0;
}
