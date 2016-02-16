

extern __inline__ void __delay(unsigned long loops)
{
                             __asm__ __volatile__("1:\n\tc0\t cmpeq \t$b0.0 = %0, $r0.0\n"
                                 ";;\n"
                                 ";;\n\t"
                             "c0\t brf \t$b0.0, 1b\n\t"
                             "c0\t add \t%0 = %0, -1\n;;\n" :
                             "=&r" (loops) :
                             "0" (loops));
}

int main() {

	__delay(1000);

	return 0;
}
