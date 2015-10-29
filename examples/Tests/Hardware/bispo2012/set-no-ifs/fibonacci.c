
#define N 7


int v[N] = {
	10, 50, 100, 500, 1000, 5000, 10000
};


int fib(int n)
{
       int  i, Fnew, Fold, temp;

       Fnew = 1;  Fold = 0;
       i = 2;

       while( i <= n ) {
               temp = Fnew;
               Fnew = Fnew + Fold;
               Fold = temp;
               i++;
       }

       return Fnew;
}

/*
void fib(int* output, int n)
{
       int  i, Fnew, Fold, temp;

       Fnew = 1;  Fold = 0;
       i = 2;

	  output[0] = 0;
	  output[1] = 1;

       while( i <= n ) {
               temp = Fnew;
               Fnew = Fnew + Fold;
               Fold = temp;
			   output[i] = Fnew;

               i++;
       }
}
*/
/*
void fibonacci(int* v, int n) {
    //int v[N] = {0, 1};
	  int i;

	  v[0] = 0;
	  v[1] = 1;

	  for (i=2; i<N; i++) {
	    v[i] = v[i-1] + v[i-2];
  }
}
*/

int main() {

	int i;
	int output[N];

	for(i=0; i<N; i++) {
		output[i] = fib(v[i]);
	}





  return 0;
}

