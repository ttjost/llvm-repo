#define LOOP_COUNT 1000

#ifdef C
#include <stdio.h>
#endif

#include "input.txt"
#include "output_ref.txt"


int crc_32(int data) {
	int ans, i;

	data = data & 0xff;
	ans = data << 24;
	for(i=0; i<8; i++) {
		if((ans & 0x80000000) == 0x80000000) {
			ans = (ans << 1) ^ 0x04c11db7;
		}
		else {
			ans <<= 1;
		}
	}
	return ans;
}


int main() {

  int i;
  int output[LOOP_COUNT];

  for(i=0; i<LOOP_COUNT; i++)
    {
      output[i] = crc_32(input[i]);
    }


  for(i=0; i < LOOP_COUNT; i++)
    {
      if (output[i] != output_ref[i])
	{
#ifdef C
	  printf("%d, line: %d, ref: %d", output[i], i, output_ref[i]);
#endif
	  return 666;
	}
    }

#ifdef C
  printf("-1\n");
#endif
	
  return -1;
}
