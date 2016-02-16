#include "data.h"

int matrix_mul(){	
	
	int i , j , k;
			
	for(i = 0; i < ROW_SIZE; i++){  
		for(j = 0; j < COLUMN_SIZE; j++){
			for(k = 0; k < ROW_SIZE; k++)
				c[i][j] += a[i][k] * b[k][j];
		}
	}

	return 0;
}

int main(void)
{
	int i, j;
 matrix_mul();
//	for (i = 0; i < 10; i++)
//	{
//		for (j = 0; j < 10; j++)
//		{
//			if (c[i][j] != result[i][j])
//				return 1;
//		}
//	}
return 0;
}
