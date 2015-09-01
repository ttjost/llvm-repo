#include <stdio.h> 
//This program prints the result of a matrix multiplication

int matrix_mul();

int a[10][10] = { {1, -1, 1, 1, -1, 1, 1, 1, -1, 1},
			{1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
			{1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
			{1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
			{-1, 1, 1, 1, 1, -1, 1, 1, 1, 1},
			{1, 1,-1, 1, 1, 1, 1, 1, 1, 1},
			{1, 1, 1, 1, 1, 1, 1, -1, 1, 1},
			{1, 1, -1, 1, 1, 1, 1, 1, 1, 1},
			{1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
			{1, 1, 1, 1, 1, 1, 1, 1, 1, 1} };

int b[10][10] = { {1, 1, 1, 1, -1, 1, 1, 1, 1, 1},
			{-1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
			{1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
			{1, 1, 1, -1, 1, 1, 1, 1, 1, 1},
			{1, 1, 1, 1, 1, -1, 1, 1, -1, 1},
			{1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
			{1, 1, 1, -1, 1, 1, -1, 1, 1, 1},
			{1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
			{-1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
			{1, 1, 1, 1, 1, -1, 1, 1, 1, 1} };

int c[10][10] = { {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			{0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
			{0, 0, 0, 0, 0, 0, 0, 0, 0, 0} };

int result[10][10] = {{8, 4, 4, 0, 2, 4, 2, 4, 6, 4, },
	{6, 10, 10, 6, 8, 6, 8, 10, 8, 10, },
	{6, 10, 10, 6, 8, 6, 8, 10, 8, 10, },
	{6, 10, 10, 6, 8, 6, 8, 10, 8, 10, },
	{2, 6, 6, 2, 8, 2, 4, 6, 4, 6, },
	{4, 8, 8, 4, 6, 4, 6, 8, 6, 8, },
	{4, 8, 8, 4, 6, 4, 6, 8, 6, 8, },
	{4, 8, 8, 4, 6, 4, 6, 8, 6, 8, },
	{6, 10, 10, 6, 8, 6, 8, 10, 8, 10, },
	{6, 10, 10, 6, 8, 6, 8, 10, 8, 10, },
};

					

int matrix_mul(){	
	
	int i , j , k;
	int var;
			
	for(i = 0; i < 10; i++){  
		for(j = 0; j < 10; j++){
			var = 0;
			for(k = 0; k < 10; k++){
			//	c[i][j] += a[i][k] * b[k][j];
				var += a[i][k] * b[k][j];
			}
			c[i][j] = var;
		}
	}

	return 0;
}
int main(void)
{
	int i, j;
	for(i=0; i<1000; i++)
 		matrix_mul();
    for (i = 0; i < 10; i++)
	{
		for (j = 0; j < 10; j++)
		{
			if (c[i][j] != result[i][j]){
				printf("666\n");        	        
				return 666;
			}
		}
    }
	printf("-1");
    return -1;
}