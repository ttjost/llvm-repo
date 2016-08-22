 ## Target: VEX 1 cluster (big endian)
.comment ""
.comment "Copyright (C) 1990-2010 Hewlett-Packard Company"
.comment "VEX C compiler version 3.43 (20110131 release)"
.comment ""
.comment "-dir /home/ttjost/Dropbox/Universidade/Mestrado/vex-3.43 -S -o float_vex.s"
.sversion 3.43
.rta 2
.section .bss
.align 32
.section .data
.align 32
 ## Begin main
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg()
main::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    ldw $r0.3 = ((b + 0) + 0)[$r0.0]   ## bblock 0, line 9, t0, 0(I32)
;;								## 0
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t17
;;								## 1
	c0    ldw $r0.4 = ((a + 0) + 0)[$r0.0]   ## bblock 0, line 9, t1, 0(I32)
	      xnop 1
        c0    mov $r0.57 = (_?1STRINGPACKET.2 + 0)
;;								## 3
.call _r_mul, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0    call $l0.0 = _r_mul   ## bblock 0, line 9,  raddr(_r_mul)(P32),  t0,  t1
;;	
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32), ret($r0.3:s32)
	c0	mov $r0.60 = $r0.3
        c0      mov $r0.3 = $r0.57
        c0      mov $r0.4 = $r0.3
        c0      call $l0.0 = printf
;;
.call _d_r, caller, arg($r0.3:u32), ret($r0.3:u32,$r0.4:u32)
	c0	mov $r0.3 = $r0.60
	c0    stw ((c + 0) + 0)[$r0.0] = $r0.3   ## bblock 0, line 9, 0(I32), t6
	c0    call $l0.0 = _d_r   ## bblock 0, line 11,  raddr(_d_r)(P32),  t6
;;								## 5
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32), ret($r0.3:s32)
	c0	mov $r0.60 = $r0.3
	c0	mov $r0.61 = $r0.4
        c0      mov $r0.3 = $r0.57
        c0      mov $r0.4 = $r0.3
        c0      call $l0.0 = printf
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32), ret($r0.3:s32)
        c0      mov $r0.3 = $r0.57
        c0      mov $r0.4 = $r0.61
        c0      call $l0.0 = printf
;;							## 4
	c0    ldw $r0.3 = ((c + 0) + 0)[$r0.0]   ## bblock 1, line 12, t11, 0(I32)
	      xnop 1
;;								## 9
	c0    mov $r0.3 = (_?1STRINGPACKET.1 + 0)   ## addr(_?1STRINGVAR.2)(P32)
;;								## 11
.call printf, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:s32)
	c0	mov $r0.5 = $r0.60
	c0	mov $r0.6 = $r0.61
	c0    call $l0.0 = printf   ## bblock 1, line 12,  raddr(printf)(P32),  addr(_?1STRINGVAR.2)(P32),  0(I32),  t15,  t16
	c0    mov $r0.4 = $r0.0   ## 0(I32)
;;								## 12
	c0    mov $r0.3 = $r0.0   ## 0(SI32)
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t17
	      xnop 3
;;								## 16
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 2, line 13,  t18,  ?2.1?2auto_size(I32),  t17
;;								## 17
.endp
.section .bss
.section .data
_?1STRINGPACKET.1:
    .data1 37
    .data1 102
    .data1 10
    .data1 0
_?1STRINGPACKET.2:
    .data1 37
    .data1 100
    .data1 10
    .data1 0
.equ ?2.1?2scratch.0, 0x0
.equ ?2.1?2ras_p, 0x10
.section .data
.section .text
.equ ?2.1?2auto_size, 0x20
 ## End main
.section .bss
.section .data
b::
    .real4 0x4019999a
a::
    .real4 0x3f99999a
.section .data
.comm c, 0x4, 4
.section .text
.import _d_r
.type _d_r,@function
.import _r_mul
.type _r_mul,@function
.import printf
.type printf,@function
