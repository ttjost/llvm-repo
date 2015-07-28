// clang -target mips-unknown-linux-gnu -c ch8_1_4.cpp -emit-llvm -o ch8_1_4.bc
// /Users/Jonathan/llvm/test/cmake_debug_build/Debug/bin/llc -march=cpu0 -relocation-model=pic -filetype=asm ch8_1_4.bc -o -
#ifdef C
#include <stdio.h>
#endif
/// start
int main()
{
  int a = 3;
  
  if (a != 0)
    a++;
  goto L1;
  a++;
L1:
  a--;
  #ifdef C
  printf("%d\n", a);
  #endif    
  return a;
}
