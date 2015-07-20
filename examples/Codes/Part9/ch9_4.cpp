// Don't use -target mips-unknown-linux-gnu option in clang since my PC is 64 bits computer.

// clang -I/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk/usr/include/ -c ch9_4.cpp -emit-llvm -o ch9_4.bc
// /Users/Jonathan/llvm/test/cmake_debug_build/Debug/bin/llc -march=cpu0 -relocation-model=pic -filetype=asm ch9_4.bc -o -

// clang -c ch9_4.cpp -emit-llvm -o ch9_4.bc
// /usr/local/llvm/test/cmake_debug_build/bin/llc -march=cpu0 -relocation-model=pic -filetype=asm ch9_4.bc -o -

/// start
//#include <alloca.h>
#include <stdlib.h>

int sum(int x1, int x2, int x3, int x4, int x5, int x6)
{
  int sum = x1 + x2 + x3 + x4 + x5 + x6;
  
  return sum; 
}

int weight_sum(int x1, int x2, int x3, int x4, int x5, int x6)
{
  int *b = (int*)alloca(sizeof(int) * x1);
  *b = 1111;
  int weight = sum(6*x1, x2, x3, x4, 2*x5, x6);
  
  return weight; 
}

int test_alloc()
{
  int a = weight_sum(1, 2, 3, 4, 5, 6); // 31
  
  return a;
}
