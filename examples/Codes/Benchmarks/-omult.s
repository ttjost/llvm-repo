 ## Target: VEX 1 cluster (big endian)
.comment ""
.comment "Copyright (C) 1990-2010 Hewlett-Packard Company"
.comment "VEX C compiler version 3.43 (20110131 release)"
.comment ""
.comment "-dir /home/jost/Downloads/vex-3.43 -S -o -omult.s"
.sversion 3.43
.rta 2
.section .bss
.align 32
.section .data
.align 32
 ## Begin mul
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=0, arg($r0.3:s32,$r0.4:s32)
mul::
.trace 1
	      ## auto_size == 0
	c0    mpyl $r0.3 = $r0.3, 10   ## bblock 0, line 5,  t18,  t1,  10(SI32)
	      xnop 1
;;								## 1
	c0    mpylu $r0.2 = $r0.3, $r0.4   ## bblock 0, line 5,  t19,  t18,  t0
	c0    mpyhs $r0.3 = $r0.3, $r0.4   ## bblock 0, line 5,  t20,  t18,  t0
	      xnop 1
;;								## 3
.return ret($r0.3:s32)
	c0    add $r0.3 = $r0.2, $r0.3   ## bblock 0, line 5,  t2,  t19,  t20
	c0    return $r0.1 = $r0.1, (0x0), $l0.0   ## bblock 0, line 5,  t4,  ?2.1?2auto_size(I32),  t3
;;								## 4
.endp
.section .bss
.section .data
.section .data
.section .text
.equ ?2.1?2auto_size, 0x0
 ## End mul
 ## Begin main
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg()
main::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    mov $r0.4 = 3   ## 3(SI32)
	c0    mov $r0.3 = 2   ## 2(SI32)
;;								## 0
.call mul, caller, arg($r0.3:s32,$r0.4:s32), ret($r0.3:s32)
	c0    call $l0.0 = mul   ## bblock 0, line 10,  raddr(mul)(P32),  2(SI32),  3(SI32)
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t5
;;								## 1
.call mul, caller, arg($r0.3:s32,$r0.4:s32), ret($r0.3:s32)
	c0    call $l0.0 = mul   ## bblock 1, line 10,  raddr(mul)(P32),  t1,  3(SI32)
	c0    mov $r0.4 = 3   ## 3(SI32)
;;								## 2
	c0    mov $r0.4 = 3   ## 3(SI32)
	c0    stw 0x14[$r0.1] = $r0.3  ## spill ## t0
;;								## 3
.call mul, caller, arg($r0.3:s32,$r0.4:s32), ret($r0.3:s32)
	c0    call $l0.0 = mul   ## bblock 2, line 10,  raddr(mul)(P32),  2(SI32),  3(SI32)
	c0    mov $r0.3 = 2   ## 2(SI32)
;;								## 4
	c0    ldw $r0.2 = 0x14[$r0.1]  ## restore ## t0
;;								## 5
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t5
	      xnop 1
;;								## 7
	c0    add $r0.3 = $r0.2, $r0.3   ## bblock 3, line 10,  t4,  t0,  t2
	      xnop 1
;;								## 9
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 3, line 14,  t6,  ?2.2?2auto_size(I32),  t5
;;								## 10
.endp
.section .bss
.section .data
.equ ?2.2?2scratch.0, 0x0
.equ ?2.2?2ras_p, 0x10
.equ ?2.2?2spill_p, 0x14
.section .data
.section .text
.equ ?2.2?2auto_size, 0x20
 ## End main
.section .bss
.section .data
.section .data
.section .text
.import mul
.type mul,@function
