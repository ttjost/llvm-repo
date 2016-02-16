
struct pt_regs {

	unsigned long  sccr;	/* rVEX Context Control Register */
	unsigned long  pc;		/* Program counter */	

	unsigned long  r1;		/* Stack pointer */
	unsigned long  r2;		/* Retval LS 32bits */
	unsigned long  r3;		/* r3-r10 Register arguments */
	unsigned long  r4;
	unsigned long  r5;
	unsigned long  r6;
	unsigned long  r7;
	unsigned long  r8;
	unsigned long  r9;
	unsigned long  r10;

	unsigned long  r11;		/* r11-r15 Caller-saved GP registers */
	unsigned long  r12;
	unsigned long  r13;
	unsigned long  r14;
	unsigned long  r15;

	unsigned long  r16;		/* r16-56 Scratch temporaries (user mode only) */
	unsigned long  r17;
	unsigned long  r18;
	unsigned long  r19;
	unsigned long  r20;
	unsigned long  r21;
	unsigned long  r22;
	unsigned long  r23;
	unsigned long  r24;
	unsigned long  r25;
	unsigned long  r26;
	unsigned long  r27;
	unsigned long  r28;
	unsigned long  r29;
	unsigned long  r30;
	unsigned long  r31;
	unsigned long  r32;
	unsigned long  r33;
	unsigned long  r34;
	unsigned long  r35;
	unsigned long  r36;
	unsigned long  r37;
	unsigned long  r38;
	unsigned long  r39;
	unsigned long  r40;
	unsigned long  r41;
	unsigned long  r42;
	unsigned long  r43;
	unsigned long  r44;
	unsigned long  r45;
	unsigned long  r46;
	unsigned long  r47;
	unsigned long  r48;
	unsigned long  r49;
	unsigned long  r50;
	unsigned long  r51;
	unsigned long  r52;
	unsigned long  r53;
	unsigned long  r54;
	unsigned long  r55;
	unsigned long  r56;

	unsigned long  r57;  /* 57 - 63 callee-saved registers (63 not used, 62 Frame Pointer)*/
	unsigned long  r58;
	unsigned long  r59;
	unsigned long  r60;
	unsigned long  r61;
	unsigned long  r62;	/* Frame pointer */
	unsigned long  r63;
	
	unsigned char  br; /* Branch registers stored as single byte */

	unsigned long  lr;		/* Linker register */
	unsigned long padding[5]; /* Padd structure to 0x120 bytes. */
};

struct syscallparams {
	unsigned int pad[4];
	struct pt_regs regs;
};


int
st200_clone(unsigned long clone_flags, unsigned long newsp,
            int *parent_tidptr, int *child_tidptr,
            unsigned long tls_value,int arg8, int arg9, int arg10,
                struct syscallparams params)
{
    struct pt_regs *regs = &params.regs;

    if (regs->r1 == 0)
        return 2*(clone_flags+newsp+(*parent_tidptr)+
                  (*child_tidptr)+tls_value+arg8+arg9+arg10);
    
    return 4*(clone_flags+newsp+(*parent_tidptr)+
              (*child_tidptr)+tls_value+arg8+arg9+arg10);
}

int main () {

    int a = 10000;
    struct syscallparams par;
    par.pad[0] = 1;
    par.pad[1] = 10;
    par.pad[2] = 100;
    par.pad[3] = 1000;
    
    par.regs.r1 = 0;
    printf("%d\n\n", st200_clone(100, 1000, &a, &a, 100000, 2, 3, 4, par));
    
    par.regs.r1 = 1;
    printf("%d\n\n", st200_clone(100, 1000, &a, &a, 100000, 2, 3, 4, par));

	return 1;
}

