#include <stdio.h>

int a = -10;
int b = 2;
int c = 5;
int key;

unsigned ua = 10;
unsigned ub = 2;
unsigned uc = 5;

int division() {

	ua = ua%uc+ua%ub+uc%ub+a%b+a%c+a%ua+a%ub;	
	//return a+ua;
	return ua;
}

int main() {
	
//	printf("Type a number: ");
//	scanf("%d",&key);
	
	if(division() == 7)
		//printf("-1\n");
		return -1;
	else
		//printf("666\n");
		return 666;
}
