
/********************************************/
/*         SYSTEM HEADER                    */
/********************************************/

extern int sim_mem_probe(volatile unsigned int);
extern unsigned int sim_mem_access32(volatile unsigned int);
extern unsigned short sim_mem_access16(volatile unsigned int);
extern unsigned char sim_mem_access8(volatile unsigned int);
extern unsigned long long sim_cycle_counter;
extern unsigned long long sim_stall_counter;
extern unsigned long long sim_branch_stall;
extern unsigned long long sim_bundle_index[];
extern unsigned long long sim_oper_counter;
extern unsigned long long sim_bnt_counter;
extern unsigned long long sim_btc_counter;
extern unsigned long long sim_btu_counter;
extern unsigned long long sim_nop_counter;
extern unsigned int mem_trace_ld(unsigned int, unsigned int, unsigned int);
extern unsigned int mem_trace_st(unsigned int, unsigned int, unsigned int);
extern unsigned int mem_trace_pf(unsigned int, unsigned int, unsigned int);
extern unsigned int mem_trace_lds(unsigned int, unsigned int, unsigned int);
extern unsigned int mem_trace_sts(unsigned int, unsigned int, unsigned int);
extern unsigned int mem_trace_pfs(unsigned int, unsigned int, unsigned int);
extern void sim_ta_init(int);
/*         TRACING HANDLES                */
#define _GOTO(x) /**/
#define _CALL(x) /**/
#define _ENTRY(x) /**/
#define _RETURN(x) /**/
#define _BRANCH(x) /**/
#define _BRANCHF(x) /**/
#define _LABEL(x) /**/
#define _INC_STALL_CNT() sim_stall_counter += sim_branch_stall
#define _INC_BNT_CNT() sim_bnt_counter++
#define _INC_BTC_CNT() sim_btc_counter++
#define _INC_BTU_CNT() sim_btu_counter++
#define _INC_NOP_CNT(n) sim_nop_counter += (n)
#define _INC_BUNDLE_CNT(index) sim_bundle_index[index]++
#define _ADD_CYCLES(cycles)  sim_cycle_counter += (cycles)

typedef struct
{
  char *name;
  int length;
  int init;
  int offset;
  int linesize;
  int rta;
} sim_fileinfo_t;

extern int sim_init_fileinfo(sim_fileinfo_t *);
extern void sim_icache_fetch(int, int);
extern void sim_gprof_enter(int *, char *f);
extern void sim_gprof_start(int *);
extern void sim_gprof_stop(int *);
extern void sim_gprof_exit(int *);
/***********************************************/
/*         MACHINE MODEL HEADER                */
/***********************************************/

#define _UINT8(s)  ((s) & 0xff)
#define _INT8(s)   (((int) ((s) << 24)) >> 24)
#define _UINT16(s) ((s) & 0xffff)
#define _INT16(s)  (((int) ((s) << 16)) >> 16)
#define _UINT32(s) ((unsigned int) (s))
#define _INT32(s)  ((int) (s))


 		 /*  MEMORY MACROS */

#define _ADDR8(a)  ((a) ^ 0x3)
#define _ADDR16(a) ((a) ^ 0x2)
#define _ADDR32(a) (a)
#define _MEM8(a) (*((volatile unsigned char  *)(_ADDR8(a))))
#define _MEM16(a) (*((volatile unsigned short *)(_ADDR16(a))))
#define _MEM32(a) (*((volatile unsigned int *)(_ADDR32(a))))
#define _MEMSPEC8(a) sim_mem_access8(_ADDR8(a))
#define _MEMSPEC16(a) sim_mem_access16(_ADDR16(a))
#define _MEMSPEC32(a) sim_mem_access32(_ADDR32(a))
#define _LDBs(t,s1) t = _INT8(_MEMSPEC8(s1))
#define _LDB(t,s1) t = _INT8(_MEM8(s1))
#define _LDBUs(t,s1) t = _UINT8(_MEMSPEC8(s1))
#define _LDBU(t,s1) t = _UINT8(_MEM8(s1))
#define _LDHs(t,s1) t = _INT16(_MEMSPEC16(s1))
#define _LDH(t,s1) t = _INT16(_MEM16(s1))
#define _LDHUs(t,s1) t = _UINT16(_MEMSPEC16(s1))
#define _LDHU(t,s1) t = _UINT16(_MEM16(s1))
#define _LDWs(t,s1) t = _INT32(_MEMSPEC32(s1))
#define _LDW(t,s1) t = _INT32(_MEM32(s1))
#define _STB(t,s1) _MEM8(t) = _UINT8(s1)
#define _STH(t,s1) _MEM16(t) = _UINT16(s1)
#define _STW(t,s1) _MEM32(t) = _UINT32(s1)


 		 /*  INSTRUCTION MACROS */

#define _MULL(t,s1,s2) t = (s1) * _INT16(s2)
#define _MULLU(t,s1,s2) t = (s1) * _UINT16(s2)
#define _MULH(t,s1,s2) t = (s1) * _INT16((s2) >> 16)
#define _MULHU(t,s1,s2) t = (s1) * _UINT16((s2) >> 16)
#define _MULHS(t,s1,s2) t = ((s1) * _UINT16((s2) >> 16)) << 16
#define _MULLL(t,s1,s2)  t = _INT16(s1) * _INT16(s2)
#define _MULLLU(t,s1,s2) t = _UINT16(s1) * _UINT16(s2)
#define _MULLH(t,s1,s2)  t = _INT16(s1) * _INT16((s2) >> 16)
#define _MULLHU(t,s1,s2) t = _UINT16(s1) * _UINT16((s2) >> 16)
#define _MULHH(t,s1,s2)  t = _INT16((s1) >> 16) * _INT16((s2) >> 16)
#define _MULHHU(t,s1,s2) t = _UINT16((s1) >> 16) * _UINT16((s2) >> 16)
#define _ADD(t,s1,s2) t = (s1) + (s2)
#define _AND(t,s1,s2) t = (s1) & (s2)
#define _ANDC(t,s1,s2) t = ~(s1) & (s2)
#define _ANDL(t,s1,s2) t = ((((s1) == 0) | ((s2) == 0)) ? 0 : 1)
#define _CMPEQ(t,s1,s2) t = ((s1) == (s2))
#define _CMPGE(t,s1,s2) t = ((int) (s1) >= (int) (s2))
#define _CMPGEU(t,s1,s2) t = ((unsigned int) (s1) >= (unsigned int) (s2))
#define _CMPGT(t,s1,s2) t = ((int) (s1) > (int) (s2))
#define _CMPGTU(t,s1,s2) t = ((unsigned int) (s1) > (unsigned int) (s2))
#define _CMPLE(t,s1,s2) t = ((int) (s1) <= (int) (s2))
#define _CMPLEU(t,s1,s2) t = ((unsigned int) (s1) <= (unsigned int) (s2))
#define _CMPLT(t,s1,s2) t = ((int) (s1) < (int) (s2))
#define _CMPLTU(t,s1,s2) t = ((unsigned int) (s1) < (unsigned int) (s2))
#define _CMPNE(t,s1,s2) t = ( (s1) !=  (s2))
#define _MAX(t,s1,s2) t = ((int) (s1) > (int) (s2)) ? (s1) : (s2)
#define _MAXU(t,s1,s2) t = ((unsigned int) (s1) > (unsigned int) (s2)) ? (s1) : (s2)
#define _MIN(t,s1,s2) t = ((int) (s1) < (int) (s2)) ? (s1) : (s2)
#define _MINU(t,s1,s2) t = ((unsigned int) (s1) < (unsigned int) (s2)) ? (s1) : (s2)
#define _MFB(t,s1) t = s1
#define _MFL(t,s1) t = s1
#define _MOV(t,s1) t = s1
#define _MTL(t,s1) t = s1
#define _MTB(t,s1) t = ((s1) == 0) ? 0 : 1
#define _MTBINV(t,s1) t = ((s1) == 0) ? 1 : 0
#define _MUL(t,s1,s2) t = (s1) * (s2)
#define _NANDL(t,s1,s2) t = (((s1) == 0) | ((s2) == 0)) ? 1 : 0
#define _NOP()
#define _NORL(t,s1,s2) t = (((s1) == 0) & ((s2) == 0)) ? 1 : 0
#define _ORL(t,s1,s2) t = (((s1) == 0) & ((s2) == 0)) ? 0 : 1
#define _OR(t,s1,s2) t = (s1) | (s2)
#define _ORC(t,s1,s2) t = (~(s1)) | (s2)
#define _PFT(s1) (s1)
#define _SBIT(t,s1,s2) t = (s1) | ((unsigned int) 1 << (s2))
#define _SBITF(t,s1,s2) t = (s1) & ~((unsigned int) 1 << (s2))
#define _SH1ADD(t,s1,s2) t = ((s1) << 1) + (s2)
#define _SH2ADD(t,s1,s2) t = ((s1) << 2) + (s2)
#define _SH3ADD(t,s1,s2) t = ((s1) << 3) + (s2)
#define _SH4ADD(t,s1,s2) t = ((s1) << 4) + (s2)
#define _SHL(t,s1,s2) t = ((int) (s1)) << (s2)
#define _SHR(t,s1,s2) t = ((int) (s1)) >> (s2)
#define _SHRU(t,s1,s2) t = ((unsigned int) (s1)) >> (s2)
#define _SLCT(t,s1,s2,s3) t = (unsigned int) (((s1) != 0) ? (s2) : (s3))
#define _SLCTF(t,s1,s2,s3) t = (unsigned int) (((s1) == 0) ? (s2) : (s3))
#define _SUB(t,s1,s2) t = (s1) - (s2)
#define _SXTB(t,s1) t = (unsigned int) (((signed int) ((s1) << 24)) >> 24)
#define _SXTH(t,s1) t = (unsigned int) (((signed int) ((s1) << 16)) >> 16)
#define _TBIT(t,s1,s2) t = ((s1) & ((unsigned int) 1 << (s2))) ? 1 : 0
#define _TBITF(t,s1,s2) t = ((s1) & ((unsigned int) 1 << (s2))) ? 0 : 1
#define _XNOP(s1)
#define _XOR(t,s1,s2) t = (s1) ^ (s2)
#define _ZXTB(t,s1) t = ((s1) & 0xff)
#define _ZXTH(t,s1) t = ((s1) & 0xffff)
#define _ADDCG(t,cout,s1,s2,cin) {\
    t = (s1) + (s2) + ((cin) & 0x1);\
    cout =   ((cin) & 0x1)\
           ? ((unsigned int) t <= (unsigned int) (s1))\
           : ((unsigned int) t <  (unsigned int) (s1));\
}
#define _DIVS(t,cout,s1,s2,cin) {\
    unsigned int tmp = ((s1) << 1) | (cin);\
    cout = (unsigned int) (s1) >> 31;\
    t = cout ? tmp + (s2) : tmp - (s2);\
}
static sim_fileinfo_t t_thisfile;
extern void sim_asm_op0(int, ...);
extern unsigned int sim_asm_op1(int, ...);
typedef struct { unsigned int n0,n1; } sim_asm2_t;
extern sim_asm2_t sim_asm_op2(int, ...);
typedef struct { unsigned int n0,n1,n2; } sim_asm3_t;
extern sim_asm3_t sim_asm_op3(int, ...);
typedef struct { unsigned int n0,n1,n2,n3; } sim_asm4_t;
extern sim_asm4_t sim_asm_op4(int, ...);

/*********************************
            BSS SYMBOLS
*********************************/


/*********************************
            ENTRY SYMBOLS
*********************************/

extern unsigned int FindMax(  );
extern unsigned int __vex_main(  );

/*********************************
            DATA SYMBOLS
*********************************/

static unsigned int Xstr[8]; 
extern unsigned int printf[];
extern unsigned int puts[];
static unsigned int Xstr[8] = { 
	0x54686520,
	0x6C617267,
	0x65737420,
	0x76616C75,
	0x65206973,
	0x3A202564,
	0x0A000000,
	0x00000000
}; 


/*********************************
            TEXT
*********************************/
extern unsigned int sim_create_stack(unsigned int, unsigned int);
extern void sim_check_stack(unsigned int, unsigned int);
extern void sim_bad_label(int);
unsigned int reg_b0_0;
unsigned int reg_b0_1;
unsigned int reg_b0_2;
unsigned int reg_b0_3;
unsigned int reg_b0_4;
unsigned int reg_b0_5;
unsigned int reg_b0_6;
unsigned int reg_b0_7;
unsigned int reg_b0_8;
unsigned int reg_b0_9;
unsigned int reg_b0_10;
unsigned int reg_b0_11;
unsigned int reg_b0_12;
unsigned int reg_b0_13;
unsigned int reg_b0_14;
unsigned int reg_b0_15;
unsigned int reg_b1_0;
unsigned int reg_b1_1;
unsigned int reg_b1_2;
unsigned int reg_b1_3;
unsigned int reg_b1_4;
unsigned int reg_b1_5;
unsigned int reg_b1_6;
unsigned int reg_b1_7;
unsigned int reg_b1_8;
unsigned int reg_b1_9;
unsigned int reg_b1_10;
unsigned int reg_b1_11;
unsigned int reg_b1_12;
unsigned int reg_b1_13;
unsigned int reg_b1_14;
unsigned int reg_b1_15;
unsigned int reg_b2_0;
unsigned int reg_b2_1;
unsigned int reg_b2_2;
unsigned int reg_b2_3;
unsigned int reg_b2_4;
unsigned int reg_b2_5;
unsigned int reg_b2_6;
unsigned int reg_b2_7;
unsigned int reg_b2_8;
unsigned int reg_b2_9;
unsigned int reg_b2_10;
unsigned int reg_b2_11;
unsigned int reg_b2_12;
unsigned int reg_b2_13;
unsigned int reg_b2_14;
unsigned int reg_b2_15;
unsigned int reg_b3_0;
unsigned int reg_b3_1;
unsigned int reg_b3_2;
unsigned int reg_b3_3;
unsigned int reg_b3_4;
unsigned int reg_b3_5;
unsigned int reg_b3_6;
unsigned int reg_b3_7;
unsigned int reg_b3_8;
unsigned int reg_b3_9;
unsigned int reg_b3_10;
unsigned int reg_b3_11;
unsigned int reg_b3_12;
unsigned int reg_b3_13;
unsigned int reg_b3_14;
unsigned int reg_b3_15;
unsigned int reg_l0_0;
unsigned int reg_r0_0;
unsigned int reg_r0_1;
unsigned int reg_r0_2;
unsigned int reg_r0_3;
unsigned int reg_r0_4;
unsigned int reg_r0_5;
unsigned int reg_r0_6;
unsigned int reg_r0_7;
unsigned int reg_r0_8;
unsigned int reg_r0_9;
unsigned int reg_r0_10;
unsigned int reg_r0_11;
unsigned int reg_r0_12;
unsigned int reg_r0_13;
unsigned int reg_r0_14;
unsigned int reg_r0_15;
unsigned int reg_r0_16;
unsigned int reg_r0_17;
unsigned int reg_r0_18;
unsigned int reg_r0_19;
unsigned int reg_r0_20;
unsigned int reg_r0_21;
unsigned int reg_r0_22;
unsigned int reg_r0_23;
unsigned int reg_r0_24;
unsigned int reg_r0_25;
unsigned int reg_r0_26;
unsigned int reg_r0_27;
unsigned int reg_r0_28;
unsigned int reg_r0_29;
unsigned int reg_r0_30;
unsigned int reg_r0_31;
unsigned int reg_r0_32;
unsigned int reg_r0_33;
unsigned int reg_r0_34;
unsigned int reg_r0_35;
unsigned int reg_r0_36;
unsigned int reg_r0_37;
unsigned int reg_r0_38;
unsigned int reg_r0_39;
unsigned int reg_r0_40;
unsigned int reg_r0_41;
unsigned int reg_r0_42;
unsigned int reg_r0_43;
unsigned int reg_r0_44;
unsigned int reg_r0_45;
unsigned int reg_r0_46;
unsigned int reg_r0_47;
unsigned int reg_r0_48;
unsigned int reg_r0_49;
unsigned int reg_r0_50;
unsigned int reg_r0_51;
unsigned int reg_r0_52;
unsigned int reg_r0_53;
unsigned int reg_r0_54;
unsigned int reg_r0_55;
unsigned int reg_r0_56;
unsigned int reg_r0_57;
unsigned int reg_r0_58;
unsigned int reg_r0_59;
unsigned int reg_r0_60;
unsigned int reg_r0_61;
unsigned int reg_r0_62;
unsigned int reg_r0_63;
unsigned int reg_r0_64;
unsigned int reg_r0_65;
unsigned int reg_r0_66;
unsigned int reg_r0_67;
unsigned int reg_r0_68;
unsigned int reg_r0_69;
unsigned int reg_r0_70;
unsigned int reg_r0_71;
unsigned int reg_r0_72;
unsigned int reg_r0_73;
unsigned int reg_r0_74;
unsigned int reg_r0_75;
unsigned int reg_r0_76;
unsigned int reg_r0_77;
unsigned int reg_r0_78;
unsigned int reg_r0_79;
unsigned int reg_r0_80;
unsigned int reg_r0_81;
unsigned int reg_r0_82;
unsigned int reg_r0_83;
unsigned int reg_r0_84;
unsigned int reg_r0_85;
unsigned int reg_r0_86;
unsigned int reg_r0_87;
unsigned int reg_r0_88;
unsigned int reg_r0_89;
unsigned int reg_r0_90;
unsigned int reg_r0_91;
unsigned int reg_r0_92;
unsigned int reg_r0_93;
unsigned int reg_r0_94;
unsigned int reg_r0_95;
unsigned int reg_r0_96;
unsigned int reg_r0_97;
unsigned int reg_r0_98;
unsigned int reg_r0_99;
unsigned int reg_r0_100;
unsigned int reg_r0_101;
unsigned int reg_r0_102;
unsigned int reg_r0_103;
unsigned int reg_r0_104;
unsigned int reg_r0_105;
unsigned int reg_r0_106;
unsigned int reg_r0_107;
unsigned int reg_r0_108;
unsigned int reg_r0_109;
unsigned int reg_r0_110;
unsigned int reg_r0_111;
unsigned int reg_r0_112;
unsigned int reg_r0_113;
unsigned int reg_r0_114;
unsigned int reg_r0_115;
unsigned int reg_r0_116;
unsigned int reg_r0_117;
unsigned int reg_r0_118;
unsigned int reg_r0_119;
unsigned int reg_r0_120;
unsigned int reg_r0_121;
unsigned int reg_r0_122;
unsigned int reg_r0_123;
unsigned int reg_r0_124;
unsigned int reg_r0_125;
unsigned int reg_r0_126;
unsigned int reg_r0_127;
unsigned int reg_r1_0;
unsigned int reg_r1_1;
unsigned int reg_r1_2;
unsigned int reg_r1_3;
unsigned int reg_r1_4;
unsigned int reg_r1_5;
unsigned int reg_r1_6;
unsigned int reg_r1_7;
unsigned int reg_r1_8;
unsigned int reg_r1_9;
unsigned int reg_r1_10;
unsigned int reg_r1_11;
unsigned int reg_r1_12;
unsigned int reg_r1_13;
unsigned int reg_r1_14;
unsigned int reg_r1_15;
unsigned int reg_r1_16;
unsigned int reg_r1_17;
unsigned int reg_r1_18;
unsigned int reg_r1_19;
unsigned int reg_r1_20;
unsigned int reg_r1_21;
unsigned int reg_r1_22;
unsigned int reg_r1_23;
unsigned int reg_r1_24;
unsigned int reg_r1_25;
unsigned int reg_r1_26;
unsigned int reg_r1_27;
unsigned int reg_r1_28;
unsigned int reg_r1_29;
unsigned int reg_r1_30;
unsigned int reg_r1_31;
unsigned int reg_r1_32;
unsigned int reg_r1_33;
unsigned int reg_r1_34;
unsigned int reg_r1_35;
unsigned int reg_r1_36;
unsigned int reg_r1_37;
unsigned int reg_r1_38;
unsigned int reg_r1_39;
unsigned int reg_r1_40;
unsigned int reg_r1_41;
unsigned int reg_r1_42;
unsigned int reg_r1_43;
unsigned int reg_r1_44;
unsigned int reg_r1_45;
unsigned int reg_r1_46;
unsigned int reg_r1_47;
unsigned int reg_r1_48;
unsigned int reg_r1_49;
unsigned int reg_r1_50;
unsigned int reg_r1_51;
unsigned int reg_r1_52;
unsigned int reg_r1_53;
unsigned int reg_r1_54;
unsigned int reg_r1_55;
unsigned int reg_r1_56;
unsigned int reg_r1_57;
unsigned int reg_r1_58;
unsigned int reg_r1_59;
unsigned int reg_r1_60;
unsigned int reg_r1_61;
unsigned int reg_r1_62;
unsigned int reg_r1_63;
unsigned int reg_r1_64;
unsigned int reg_r1_65;
unsigned int reg_r1_66;
unsigned int reg_r1_67;
unsigned int reg_r1_68;
unsigned int reg_r1_69;
unsigned int reg_r1_70;
unsigned int reg_r1_71;
unsigned int reg_r1_72;
unsigned int reg_r1_73;
unsigned int reg_r1_74;
unsigned int reg_r1_75;
unsigned int reg_r1_76;
unsigned int reg_r1_77;
unsigned int reg_r1_78;
unsigned int reg_r1_79;
unsigned int reg_r1_80;
unsigned int reg_r1_81;
unsigned int reg_r1_82;
unsigned int reg_r1_83;
unsigned int reg_r1_84;
unsigned int reg_r1_85;
unsigned int reg_r1_86;
unsigned int reg_r1_87;
unsigned int reg_r1_88;
unsigned int reg_r1_89;
unsigned int reg_r1_90;
unsigned int reg_r1_91;
unsigned int reg_r1_92;
unsigned int reg_r1_93;
unsigned int reg_r1_94;
unsigned int reg_r1_95;
unsigned int reg_r1_96;
unsigned int reg_r1_97;
unsigned int reg_r1_98;
unsigned int reg_r1_99;
unsigned int reg_r1_100;
unsigned int reg_r1_101;
unsigned int reg_r1_102;
unsigned int reg_r1_103;
unsigned int reg_r1_104;
unsigned int reg_r1_105;
unsigned int reg_r1_106;
unsigned int reg_r1_107;
unsigned int reg_r1_108;
unsigned int reg_r1_109;
unsigned int reg_r1_110;
unsigned int reg_r1_111;
unsigned int reg_r1_112;
unsigned int reg_r1_113;
unsigned int reg_r1_114;
unsigned int reg_r1_115;
unsigned int reg_r1_116;
unsigned int reg_r1_117;
unsigned int reg_r1_118;
unsigned int reg_r1_119;
unsigned int reg_r1_120;
unsigned int reg_r1_121;
unsigned int reg_r1_122;
unsigned int reg_r1_123;
unsigned int reg_r1_124;
unsigned int reg_r1_125;
unsigned int reg_r1_126;
unsigned int reg_r1_127;
unsigned int reg_r2_0;
unsigned int reg_r2_1;
unsigned int reg_r2_2;
unsigned int reg_r2_3;
unsigned int reg_r2_4;
unsigned int reg_r2_5;
unsigned int reg_r2_6;
unsigned int reg_r2_7;
unsigned int reg_r2_8;
unsigned int reg_r2_9;
unsigned int reg_r2_10;
unsigned int reg_r2_11;
unsigned int reg_r2_12;
unsigned int reg_r2_13;
unsigned int reg_r2_14;
unsigned int reg_r2_15;
unsigned int reg_r2_16;
unsigned int reg_r2_17;
unsigned int reg_r2_18;
unsigned int reg_r2_19;
unsigned int reg_r2_20;
unsigned int reg_r2_21;
unsigned int reg_r2_22;
unsigned int reg_r2_23;
unsigned int reg_r2_24;
unsigned int reg_r2_25;
unsigned int reg_r2_26;
unsigned int reg_r2_27;
unsigned int reg_r2_28;
unsigned int reg_r2_29;
unsigned int reg_r2_30;
unsigned int reg_r2_31;
unsigned int reg_r2_32;
unsigned int reg_r2_33;
unsigned int reg_r2_34;
unsigned int reg_r2_35;
unsigned int reg_r2_36;
unsigned int reg_r2_37;
unsigned int reg_r2_38;
unsigned int reg_r2_39;
unsigned int reg_r2_40;
unsigned int reg_r2_41;
unsigned int reg_r2_42;
unsigned int reg_r2_43;
unsigned int reg_r2_44;
unsigned int reg_r2_45;
unsigned int reg_r2_46;
unsigned int reg_r2_47;
unsigned int reg_r2_48;
unsigned int reg_r2_49;
unsigned int reg_r2_50;
unsigned int reg_r2_51;
unsigned int reg_r2_52;
unsigned int reg_r2_53;
unsigned int reg_r2_54;
unsigned int reg_r2_55;
unsigned int reg_r2_56;
unsigned int reg_r2_57;
unsigned int reg_r2_58;
unsigned int reg_r2_59;
unsigned int reg_r2_60;
unsigned int reg_r2_61;
unsigned int reg_r2_62;
unsigned int reg_r2_63;
unsigned int reg_r2_64;
unsigned int reg_r2_65;
unsigned int reg_r2_66;
unsigned int reg_r2_67;
unsigned int reg_r2_68;
unsigned int reg_r2_69;
unsigned int reg_r2_70;
unsigned int reg_r2_71;
unsigned int reg_r2_72;
unsigned int reg_r2_73;
unsigned int reg_r2_74;
unsigned int reg_r2_75;
unsigned int reg_r2_76;
unsigned int reg_r2_77;
unsigned int reg_r2_78;
unsigned int reg_r2_79;
unsigned int reg_r2_80;
unsigned int reg_r2_81;
unsigned int reg_r2_82;
unsigned int reg_r2_83;
unsigned int reg_r2_84;
unsigned int reg_r2_85;
unsigned int reg_r2_86;
unsigned int reg_r2_87;
unsigned int reg_r2_88;
unsigned int reg_r2_89;
unsigned int reg_r2_90;
unsigned int reg_r2_91;
unsigned int reg_r2_92;
unsigned int reg_r2_93;
unsigned int reg_r2_94;
unsigned int reg_r2_95;
unsigned int reg_r2_96;
unsigned int reg_r2_97;
unsigned int reg_r2_98;
unsigned int reg_r2_99;
unsigned int reg_r2_100;
unsigned int reg_r2_101;
unsigned int reg_r2_102;
unsigned int reg_r2_103;
unsigned int reg_r2_104;
unsigned int reg_r2_105;
unsigned int reg_r2_106;
unsigned int reg_r2_107;
unsigned int reg_r2_108;
unsigned int reg_r2_109;
unsigned int reg_r2_110;
unsigned int reg_r2_111;
unsigned int reg_r2_112;
unsigned int reg_r2_113;
unsigned int reg_r2_114;
unsigned int reg_r2_115;
unsigned int reg_r2_116;
unsigned int reg_r2_117;
unsigned int reg_r2_118;
unsigned int reg_r2_119;
unsigned int reg_r2_120;
unsigned int reg_r2_121;
unsigned int reg_r2_122;
unsigned int reg_r2_123;
unsigned int reg_r2_124;
unsigned int reg_r2_125;
unsigned int reg_r2_126;
unsigned int reg_r2_127;
unsigned int reg_r3_0;
unsigned int reg_r3_1;
unsigned int reg_r3_2;
unsigned int reg_r3_3;
unsigned int reg_r3_4;
unsigned int reg_r3_5;
unsigned int reg_r3_6;
unsigned int reg_r3_7;
unsigned int reg_r3_8;
unsigned int reg_r3_9;
unsigned int reg_r3_10;
unsigned int reg_r3_11;
unsigned int reg_r3_12;
unsigned int reg_r3_13;
unsigned int reg_r3_14;
unsigned int reg_r3_15;
unsigned int reg_r3_16;
unsigned int reg_r3_17;
unsigned int reg_r3_18;
unsigned int reg_r3_19;
unsigned int reg_r3_20;
unsigned int reg_r3_21;
unsigned int reg_r3_22;
unsigned int reg_r3_23;
unsigned int reg_r3_24;
unsigned int reg_r3_25;
unsigned int reg_r3_26;
unsigned int reg_r3_27;
unsigned int reg_r3_28;
unsigned int reg_r3_29;
unsigned int reg_r3_30;
unsigned int reg_r3_31;
unsigned int reg_r3_32;
unsigned int reg_r3_33;
unsigned int reg_r3_34;
unsigned int reg_r3_35;
unsigned int reg_r3_36;
unsigned int reg_r3_37;
unsigned int reg_r3_38;
unsigned int reg_r3_39;
unsigned int reg_r3_40;
unsigned int reg_r3_41;
unsigned int reg_r3_42;
unsigned int reg_r3_43;
unsigned int reg_r3_44;
unsigned int reg_r3_45;
unsigned int reg_r3_46;
unsigned int reg_r3_47;
unsigned int reg_r3_48;
unsigned int reg_r3_49;
unsigned int reg_r3_50;
unsigned int reg_r3_51;
unsigned int reg_r3_52;
unsigned int reg_r3_53;
unsigned int reg_r3_54;
unsigned int reg_r3_55;
unsigned int reg_r3_56;
unsigned int reg_r3_57;
unsigned int reg_r3_58;
unsigned int reg_r3_59;
unsigned int reg_r3_60;
unsigned int reg_r3_61;
unsigned int reg_r3_62;
unsigned int reg_r3_63;
unsigned int reg_r3_64;
unsigned int reg_r3_65;
unsigned int reg_r3_66;
unsigned int reg_r3_67;
unsigned int reg_r3_68;
unsigned int reg_r3_69;
unsigned int reg_r3_70;
unsigned int reg_r3_71;
unsigned int reg_r3_72;
unsigned int reg_r3_73;
unsigned int reg_r3_74;
unsigned int reg_r3_75;
unsigned int reg_r3_76;
unsigned int reg_r3_77;
unsigned int reg_r3_78;
unsigned int reg_r3_79;
unsigned int reg_r3_80;
unsigned int reg_r3_81;
unsigned int reg_r3_82;
unsigned int reg_r3_83;
unsigned int reg_r3_84;
unsigned int reg_r3_85;
unsigned int reg_r3_86;
unsigned int reg_r3_87;
unsigned int reg_r3_88;
unsigned int reg_r3_89;
unsigned int reg_r3_90;
unsigned int reg_r3_91;
unsigned int reg_r3_92;
unsigned int reg_r3_93;
unsigned int reg_r3_94;
unsigned int reg_r3_95;
unsigned int reg_r3_96;
unsigned int reg_r3_97;
unsigned int reg_r3_98;
unsigned int reg_r3_99;
unsigned int reg_r3_100;
unsigned int reg_r3_101;
unsigned int reg_r3_102;
unsigned int reg_r3_103;
unsigned int reg_r3_104;
unsigned int reg_r3_105;
unsigned int reg_r3_106;
unsigned int reg_r3_107;
unsigned int reg_r3_108;
unsigned int reg_r3_109;
unsigned int reg_r3_110;
unsigned int reg_r3_111;
unsigned int reg_r3_112;
unsigned int reg_r3_113;
unsigned int reg_r3_114;
unsigned int reg_r3_115;
unsigned int reg_r3_116;
unsigned int reg_r3_117;
unsigned int reg_r3_118;
unsigned int reg_r3_119;
unsigned int reg_r3_120;
unsigned int reg_r3_121;
unsigned int reg_r3_122;
unsigned int reg_r3_123;
unsigned int reg_r3_124;
unsigned int reg_r3_125;
unsigned int reg_r3_126;
unsigned int reg_r3_127;


extern unsigned int FindMax(  )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   _ENTRY(FindMax);
  sim_check_stack(reg_r0_1, -96); 

  t_client_rpc = reg_l0_0; 
  reg_l0_0 = (105 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(0 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _ADD(reg_r0_1, reg_r0_1, (unsigned int) -64); /* line 9 */
} /* line 9 */
  sim_icache_fetch(1 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _STW(mem_trace_st((reg_r0_1 + (unsigned int) 76),0,4), reg_r0_10); /* line 11 */
} /* line 11 */
  sim_icache_fetch(2 + t_thisfile.offset, 2);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(2);
   _STW(mem_trace_st((reg_r0_1 + (unsigned int) 56),0,4), reg_r0_5); /* line 13 */
   _ADD(reg_r0_2, reg_r0_1, (unsigned int) 52); /* line 14 */
} /* line 14 */
  sim_icache_fetch(4 + t_thisfile.offset, 2);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(2);
   _STW(mem_trace_st((reg_r0_1 + (unsigned int) 52),0,4), reg_r0_4); /* line 16 */
   _OR(reg_r0_4, reg_r0_2, (unsigned int) 4); /* line 17 */
} /* line 17 */
  sim_icache_fetch(6 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _STW(mem_trace_st((reg_r0_1 + (unsigned int) 60),0,4), reg_r0_6); /* line 19 */
} /* line 19 */
  sim_icache_fetch(7 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _STW(mem_trace_st((reg_r0_1 + (unsigned int) 64),0,4), reg_r0_7); /* line 21 */
} /* line 21 */
  sim_icache_fetch(8 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _STW(mem_trace_st((reg_r0_1 + (unsigned int) 68),0,4), reg_r0_8); /* line 23 */
} /* line 23 */
  sim_icache_fetch(9 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _STW(mem_trace_st((reg_r0_1 + (unsigned int) 72),0,4), reg_r0_9); /* line 25 */
} /* line 25 */
  sim_icache_fetch(10 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _STW(mem_trace_st((reg_r0_1 + (unsigned int) 48),0,4), reg_r0_3); /* line 27 */
} /* line 27 */
  sim_icache_fetch(11 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _STW(mem_trace_st((reg_r0_1 + (unsigned int) 32),0,4), reg_r0_2); /* line 29 */
} /* line 29 */
  sim_icache_fetch(12 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _STW(mem_trace_st((reg_r0_1 + (unsigned int) 32),0,4), reg_r0_4); /* line 31 */
} /* line 31 */
  sim_icache_fetch(13 + t_thisfile.offset, 2);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(2);
   _LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 52),0,4)); /* line 33 */
   _MOV(reg_r0_3, (unsigned int) 1); /* line 34 */
} /* line 34 */
  sim_icache_fetch(15 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(0);
} /* line 35 */
  sim_icache_fetch(16 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _STW(mem_trace_st((reg_r0_1 + (unsigned int) 36),0,4), reg_r0_2); /* line 37 */
} /* line 37 */
  sim_icache_fetch(17 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _STW(mem_trace_st((reg_r0_1 + (unsigned int) 44),0,4), reg_r0_3); /* line 39 */
} /* line 39 */
l_LBB0_1: ;/* line 42 */
_LABEL(l_LBB0_1);
  sim_icache_fetch(18 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 48),0,4)); /* line 43 */
} /* line 43 */
  sim_icache_fetch(19 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 44),0,4)); /* line 45 */
} /* line 45 */
  sim_icache_fetch(20 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(0);
} /* line 46 */
  sim_icache_fetch(21 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _CMPGE(reg_b0_0, reg_r0_3, reg_r0_2); /* line 48 */
} /* line 48 */
  sim_icache_fetch(22 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(0);
} /* line 49 */
  sim_icache_fetch(23 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   if (reg_b0_0) {    _BRANCH(reg_b0_0);
      _INC_BTC_CNT();
      _INC_STALL_CNT();
      goto l_LBB0_7; 
   } else {
      _INC_BNT_CNT();
   }
} /* line 51 */
  sim_icache_fetch(24 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 32),0,4)); /* line 55 */
} /* line 55 */
  sim_icache_fetch(25 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(0);
} /* line 56 */
  sim_icache_fetch(26 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _ADD(reg_r0_3, reg_r0_2, (unsigned int) 4); /* line 58 */
} /* line 58 */
  sim_icache_fetch(27 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _STW(mem_trace_st((reg_r0_1 + (unsigned int) 32),0,4), reg_r0_3); /* line 60 */
} /* line 60 */
  sim_icache_fetch(28 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _LDW(reg_r0_2, mem_trace_ld(reg_r0_2,0,4)); /* line 62 */
} /* line 62 */
  sim_icache_fetch(29 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(0);
} /* line 63 */
  sim_icache_fetch(30 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _STW(mem_trace_st((reg_r0_1 + (unsigned int) 40),0,4), reg_r0_2); /* line 65 */
} /* line 65 */
  sim_icache_fetch(31 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 67 */
} /* line 67 */
  sim_icache_fetch(32 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(0);
} /* line 68 */
  sim_icache_fetch(33 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _CMPLE(reg_b0_0, reg_r0_3, reg_r0_2); /* line 70 */
} /* line 70 */
  sim_icache_fetch(34 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(0);
} /* line 71 */
  sim_icache_fetch(35 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   if (reg_b0_0) {    _BRANCH(reg_b0_0);
      _INC_BTC_CNT();
      _INC_STALL_CNT();
      goto l_LBB0_4; 
   } else {
      _INC_BNT_CNT();
   }
} /* line 73 */
  sim_icache_fetch(36 + t_thisfile.offset, 2);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(2);
   _LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 77 */
   _GOTO(l_LBB0_5);   _INC_BTU_CNT();
   _INC_STALL_CNT();
   goto l_LBB0_5;
} /* line 78 */
l_LBB0_4: ;/* line 81 */
_LABEL(l_LBB0_4);
  sim_icache_fetch(38 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 40),0,4)); /* line 82 */
} /* line 82 */
l_LBB0_5: ;/* line 85 */
_LABEL(l_LBB0_5);
  sim_icache_fetch(39 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _STW(mem_trace_st((reg_r0_1 + (unsigned int) 36),0,4), reg_r0_2); /* line 86 */
} /* line 86 */
  sim_icache_fetch(40 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _LDW(reg_r0_2, mem_trace_ld((reg_r0_1 + (unsigned int) 44),0,4)); /* line 90 */
} /* line 90 */
  sim_icache_fetch(41 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(0);
} /* line 91 */
  sim_icache_fetch(42 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _ADD(reg_r0_2, reg_r0_2, (unsigned int) 1); /* line 93 */
} /* line 93 */
  sim_icache_fetch(43 + t_thisfile.offset, 2);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(2);
   _STW(mem_trace_st((reg_r0_1 + (unsigned int) 44),0,4), reg_r0_2); /* line 95 */
   _GOTO(l_LBB0_1);   _INC_BTU_CNT();
   _INC_STALL_CNT();
   goto l_LBB0_1;
} /* line 96 */
l_LBB0_7: ;/* line 98 */
_LABEL(l_LBB0_7);
  sim_icache_fetch(45 + t_thisfile.offset, 2);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(2);
   _LDW(reg_r0_3, mem_trace_ld((reg_r0_1 + (unsigned int) 36),0,4)); /* line 100 */
   _RETURN(FindMax);   _INC_BTU_CNT();
   _INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 96; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 101 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 101: goto l_LBB0_1;
    case 102: goto l_LBB0_4;
    case 103: goto l_LBB0_5;
    case 104: goto l_LBB0_7;
    case 105:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}

extern unsigned int __vex_main(  )
{
  unsigned int t_client_rpc;
  int t_labelnum;
  unsigned int t_bitbucket;
  static int sim_gprof_idx = 0;
   _ENTRY(__vex_main);
  sim_ta_init(1); /* enable cache simulation */
  reg_r0_1 = sim_create_stack(1048576,reg_r0_1); 

  sim_check_stack(reg_r0_1, -64); 

  t_client_rpc = reg_l0_0; 
  reg_l0_0 = (110 << 5);
  if (!t_thisfile.init) sim_init_fileinfo(&t_thisfile);

		/*  CODE */

  sim_icache_fetch(47 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _ADD(reg_r0_1, reg_r0_1, (unsigned int) -32); /* line 110 */
} /* line 110 */
  sim_icache_fetch(48 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _STW(mem_trace_st((reg_r0_1 + (unsigned int) 16),0,4), reg_r0_57); /* line 112 */
} /* line 112 */
  sim_icache_fetch(49 + t_thisfile.offset, 4);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(3);
   _STW(mem_trace_st((reg_r0_1 + (unsigned int) 12),0,4), reg_l0_0); /* line 114 */
   _MOV(reg_r0_57, 0); /* line 115 */
   _MOV(reg_r0_7, (unsigned int) 834); /* line 116 */
} /* line 116 */
  sim_icache_fetch(53 + t_thisfile.offset, 4);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(3);
   _MOV(reg_r0_6, (unsigned int) 631); /* line 118 */
   _MOV(reg_r0_3, (unsigned int) 4); /* line 119 */
   _STW(mem_trace_st((reg_r0_1 + (unsigned int) 8),0,4), reg_r0_57); /* line 120 */
} /* line 120 */
  sim_icache_fetch(57 + t_thisfile.offset, 4);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(2);
   _MOV(reg_r0_5, (unsigned int) 422); /* line 122 */
   _MOV(reg_r0_4, (unsigned int) 702); /* line 123 */
} /* line 123 */
		 /* line 124 */
  sim_icache_fetch(61 + t_thisfile.offset, 2);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _INC_BTU_CNT();
   _INC_STALL_CNT();
   _CALL(FindMax);
   reg_l0_0 = (110 << 5);
   {
    typedef void t_FT (unsigned int, unsigned int, unsigned int, unsigned int, unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) FindMax;
    (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6, reg_r0_7, reg_r0_8, reg_r0_9, reg_r0_10);
   }
} /* line 126 */
l_lr_6: ;/* line 126 */
_LABEL(l_lr_6);
  sim_icache_fetch(63 + t_thisfile.offset, 3);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(2);
   _MOV(reg_r0_2, reg_r0_3); /* line 128 */
   _MOV(reg_r0_3, (unsigned int) Xstr); /* line 129 */
} /* line 129 */
  sim_icache_fetch(66 + t_thisfile.offset, 2);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(2);
   _STW(mem_trace_st((reg_r0_1 + (unsigned int) 4),0,4), reg_r0_2); /* line 131 */
   _MOV(reg_r0_4, reg_r0_2); /* line 132 */
} /* line 132 */
		 /* line 133 */
  sim_icache_fetch(68 + t_thisfile.offset, 2);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _INC_BTU_CNT();
   _INC_STALL_CNT();
   _CALL(printf);
   reg_l0_0 = (110 << 5);
   {
    typedef void t_FT (unsigned int, unsigned int, unsigned int, unsigned int, unsigned int, unsigned int, unsigned int, unsigned int);
    t_FT *t_call = (t_FT*) printf;
    (*t_call)(reg_r0_3, reg_r0_4, reg_r0_5, reg_r0_6, reg_r0_7, reg_r0_8, reg_r0_9, reg_r0_10);
   }
} /* line 135 */
l_lr_8: ;/* line 135 */
_LABEL(l_lr_8);
  sim_icache_fetch(70 + t_thisfile.offset, 2);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(2);
   _MOV(reg_r0_3, reg_r0_57); /* line 137 */
   _LDW(reg_l0_0, mem_trace_ld((reg_r0_1 + (unsigned int) 12),0,4)); /* line 138 */
} /* line 138 */
  sim_icache_fetch(72 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _LDW(reg_r0_57, mem_trace_ld((reg_r0_1 + (unsigned int) 16),0,4)); /* line 140 */
} /* line 140 */
  sim_icache_fetch(73 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(0);
} /* line 141 */
  sim_icache_fetch(74 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(0);
} /* line 142 */
  sim_icache_fetch(75 + t_thisfile.offset, 1);
{
   _ADD_CYCLES(1);
   _INC_BUNDLE_CNT(1);
   _RETURN(__vex_main);   _INC_BTU_CNT();
   _INC_STALL_CNT();
   reg_r0_1 = reg_r0_1 + (unsigned int) 64; /* pop frame */
   t_labelnum = reg_l0_0;
   goto labelfinder;
} /* line 145 */
  reg_l0_0 = t_client_rpc;
  return reg_r0_3;

labelfinder:
  switch (t_labelnum >> 5) {
    case 107: goto l_lr_6;
    case 109: goto l_lr_8;
    case 110:
      reg_l0_0 = t_client_rpc;
      return reg_r0_3;
    default:
      sim_bad_label(t_labelnum);
    }
}


static sim_fileinfo_t t_thisfile = {"/tmp/cpp26689a", 80, 0, 0, 0, 0};

