

extern __inline__ void __delay(unsigned long loops)
{
        __asm__ __volatile__("cmp %0, 0\n\t"
                             "1: bne 1b\n\t"
                             "subcc %0, 1, %0\n" :
                             "=&r" (loops) :
                             "0" (loops));
}

int main() {

	__delay(1000);

	return 0;
}
