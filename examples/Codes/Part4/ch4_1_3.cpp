// clang -target mips-unknown-linux-gnu -c ch4_1_3.cpp -emit-llvm -o ch4_1_3.bc
// /usr/local/llvm/test/cmake_debug_build/bin/llc -march=cpu0 -relocation-model=pic -filetype=asm ch4_1_3.bc -o -

// /Users/Jonathan/llvm/test/cmake_debug_build/Debug/bin/llc -march=cpu0 -relocation-model=pic -filetype=asm ch4_1_3.bc -o -

/// start

#include <stdio.h> 

int test_rotate_left()
{
  unsigned int a = 2000;
  int result = ((a << 30) | (a >> 2));
  
  return result;
}

//#ifdef TEST_ROXV

int test_rotate_left1(unsigned int a, int n)
{
  int result = ((a << n) | (a >> (32 - n)));
  
  return result;
}

int test_rotate_right(unsigned int a, int n)
{
  int result = ((a >> n) | (a << (32 - n)));
  
  return result;
}

//#endif

int main () {

	int a = test_rotate_left();
	int b = test_rotate_left1(a, 2);
	int c = test_rotate_right(b, 3);
	return c;
//	printf("%d\n", a);
//	printf("%d\n", b);
//	printf("%d\n", c);

}
