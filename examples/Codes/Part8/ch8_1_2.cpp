// clang -target mips-unknown-linux-gnu -c ch8_1_2.cpp -emit-llvm -o ch8_1_2.bc
// /Users/Jonathan/llvm/test/cmake_debug_build/Debug/bin/llc -march=cpu0 -relocation-model=pic -filetype=asm ch8_1_2.bc -o -
#ifdef C
#include <stdio.h>
#endif
/// start
int main()
{
  int a = 0;
  int b = 1;
  int* p = &a;
  
  b = !(*p);
  if (b == 0) {
    a = a + b;
  } else if (b < 0) {
    a = a-1;
  } else if (b > 0) {
    a = a+1;
  } else if (b != 0) {
    a = a - b;
  }
  #ifdef C
  printf("%d\n", a);
  #endif
  return a;
}
