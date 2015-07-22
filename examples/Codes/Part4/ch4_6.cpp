// clang -target mips-unknown-linux-gnu -c ch4_6.cpp -emit-llvm -o ch4_6.bc
// /Users/Jonathan/llvm/test/cmake_debug_build/Debug/bin/llc -march=cpu0 -mcpu=cpu032I -relocation-model=static -filetype=asm ch4_6.bc -o -
// /Users/Jonathan/llvm/test/cmake_debug_build/Debug/bin/llc -march=cpu0 -mcpu=cpu032II -relocation-model=static -filetype=asm ch4_6.bc -o -
#include <stdio.h>

/// start
int test_OptSlt()
{
  int a = 10, b = 1;
  int d = 0, e = 0, f = 0;

  d = (a > 2);
  e = d + (b < 1);
  e = e + (e > 1);
  f = d + e;
//printf("%d", f);
  return (f);
}

int main(){

	int a = test_OptSlt();

	return a + 100;

}
