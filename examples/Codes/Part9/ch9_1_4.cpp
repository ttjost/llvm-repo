// clang -target mips-unknown-linux-gnu -c ch9_1_4.cpp -emit-llvm -o ch9_1_4.bc
// /Users/Jonathan/llvm/test/cmake_debug_build/Debug/bin/llc -march=cpu0 -relocation-model=pic -filetype=asm ch9_1_4.bc -o -

#ifdef C
#include <stdio.h>
#endif

/// start
int multiply(int x, int y)
{
  return (x*y);
}

int add(int x, int y)
{
  return (x+y);
}

int madd(int x, int y, int z)
{
  return add(z, multiply(x, y));
}

int test_madd()
{
  int cc = 5;
  int a = madd(1, 2, cc);
  
  return a; // a = 7
}

int main(){

	int a, b,c;

	a = multiply(2, 3); 	// 6
	b = add(2,2);		// 4
	c = test_madd();	// 11

	#ifdef C
	printf("%d\n", a+b+c); 	// 17 
	#endif
	return a+b+c;


}

