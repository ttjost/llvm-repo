 ## Target: VEX 1 cluster (big endian)
.comment ""
.comment "Copyright (C) 1990-2010 Hewlett-Packard Company"
.comment "VEX C compiler version 3.43 (20110131 release)"
.comment ""
.comment "-dir /home/jost/Dropbox/Universidade/Mestrado/vex-3.43 -O0 -S -o bunch_args_v2_vex.s"
.sversion 3.43
.rta 2
.section .bss
.align 32
.section .data
.align 32
 ## Begin func
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.1 + 48, 44; $r0.3:s32,$r0.4:s32,$r0.5:s32,$r0.6:s32,$r0.7:s32,$r0.8:s32,$r0.9:s32,$r0.10:s32,32:s32,36:[4],40:[4])
func::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x40)
	c0    mpylu $r0.2 = $r0.5, $r0.6   ## bblock 0, line 11,  t54,  t2,  t1
	c0    mpyhs $r0.5 = $r0.5, $r0.6   ## bblock 0, line 11,  t55,  t2,  t1
;;								## 0
	c0    stw 0x0[$r0.1] = $l0.0  ## spill ## t22
;;								## 1
	c0    add $r0.6 = $r0.2, $r0.5   ## bblock 0, line 11,  t3,  t54,  t55
	c0    stw 0x4[$r0.1] = $r0.10  ## spill ## t11
;;								## 2
	c0    stw 0x8[$r0.1] = $r0.9  ## spill ## t12
;;								## 3
	c0    stw 0xc[$r0.1] = $r0.8  ## spill ## t13
;;								## 4
	c0    stw 0x10[$r0.1] = $r0.7  ## spill ## t0
;;								## 5
.call _i_div, caller, arg($r0.3:s32,$r0.4:s32), ret($r0.3:s32)
	c0    call $l0.0 = _i_div   ## bblock 0, line 11,  raddr(_i_div)(P32),  t14,  t15
	c0    stw 0x14[$r0.1] = $r0.6  ## spill ## t3
;;								## 6
	c0    ldw $r0.2 = 0x50[$r0.1]   ## bblock 0, line 7, t10, t23
;;								## 7
	c0    ldw $r0.8 = 0xc[$r0.1]  ## restore ## t13
;;								## 8
	c0    ldh $r0.4 = 0x5a[$r0.1]   ## bblock 0, line 7, t8(SI16), t23
;;								## 9
	c0    ldw $r0.9 = 0x8[$r0.1]  ## restore ## t12
;;								## 10
	c0    ldb $r0.2 = 0x57[$r0.1]   ## bblock 0, line 7, t9(SI8), t23
	c0    add $r0.8 = $r0.8, $r0.2   ## bblock 0, line 12,  t57,  t13,  t10
;;								## 11
	c0    add $r0.8 = $r0.8, $r0.3   ## bblock 0, line 12,  t60,  t57,  t16
	c0    ldw $r0.10 = 0x4[$r0.1]  ## restore ## t11
;;								## 12
	c0    add $r0.9 = $r0.9, $r0.4   ## bblock 0, line 12,  t58,  t12,  t8(SI16)
	c0    ldw $r0.7 = 0x10[$r0.1]  ## restore ## t0
;;								## 13
	c0    ldw $r0.6 = 0x14[$r0.1]  ## restore ## t3
;;								## 14
	c0    add $r0.10 = $r0.10, $r0.2   ## bblock 0, line 12,  t59,  t11,  t9(SI8)
;;								## 15
	c0    add $r0.7 = $r0.7, $r0.3   ## bblock 0, line 11,  t56,  t0,  t16
	c0    add $r0.9 = $r0.9, $r0.10   ## bblock 0, line 12,  t61,  t58,  t59
;;								## 16
	c0    add $r0.7 = $r0.7, $r0.6   ## bblock 0, line 11,  t53,  t56,  t3
	c0    add $r0.8 = $r0.8, $r0.9   ## bblock 0, line 12,  t52,  t60,  t61
;;								## 17
	c0    cmpgt $r0.2 = $r0.7, $r0.8   ## bblock 0, line 14,  t62(I1),  t53,  t52
;;								## 18
.trace 2
	c0    mov $r0.3 = $r0.7   ## t53
	c0    ldw $l0.0 = 0x0[$r0.1]  ## restore ## t22
	c0    mtb $b0.0 = $r0.2   ## t62(I1)
	      xnop 1
;;								## 1
	c0    brf $b0.0, L0?3   ## bblock 0, line 14,  t62(I1)
;;								## 2
;;								## 3
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 2, line 15,  t23,  ?2.1?2auto_size(I32),  t22
;;								## 4
.trace 3
L0?3:
	c0    mov $r0.3 = $r0.8   ## t52
;;								## 0
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x40), $l0.0   ## bblock 1, line 16,  t23,  ?2.1?2auto_size(I32),  t22
;;								## 1
.endp
.section .bss
.section .data
.equ ?2.1?2ras_p, 0x0
.equ ?2.1?2spill_p, 0x4
.equ ?2.1?2pab_p.1, 0x30
.section .data
.section .text
.equ ?2.1?2auto_size, 0x40
 ## End func
 ## Begin main
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg()
main::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    ldw $r0.3 = ((a + 0) + 0)[$r0.0]   ## bblock 0, line 22, t4, 0(I32)
;;								## 0
	c0    stw 0x1c[$r0.1] = $l0.0  ## spill ## t30
;;								## 1
	c0    ldw $r0.4 = ((b + 0) + 0)[$r0.0]   ## bblock 0, line 22, t5, 0(I32)
;;								## 2
	c0    ldw $r0.5 = ((c + 0) + 0)[$r0.0]   ## bblock 0, line 22, t6, 0(I32)
;;								## 3
	c0    ldw $r0.6 = ((d + 0) + 0)[$r0.0]   ## bblock 0, line 22, t7, 0(I32)
;;								## 4
	c0    ldw $r0.7 = ((e + 0) + 0)[$r0.0]   ## bblock 0, line 22, t8, 0(I32)
;;								## 5
	c0    ldw $r0.8 = ((f + 0) + 0)[$r0.0]   ## bblock 0, line 22, t9, 0(I32)
;;								## 6
	c0    ldw $r0.9 = ((g + 0) + 0)[$r0.0]   ## bblock 0, line 22, t10, 0(I32)
;;								## 7
	c0    ldw $r0.10 = ((h + 0) + 0)[$r0.0]   ## bblock 0, line 22, t11, 0(I32)
;;								## 8
	c0    ldw $r0.2 = ((i + 0) + 0)[$r0.0]   ## bblock 0, line 22, t12, 0(I32)
;;								## 9
	c0    ldb $r0.11 = ((j + 0) + 0)[$r0.0]   ## bblock 0, line 22, t13(SI8), 0(I32)
;;								## 10
	c0    ldh $r0.12 = ((k + 0) + 0)[$r0.0]   ## bblock 0, line 22, t14(SI16), 0(I32)
;;								## 11
	c0    stw 0x10[$r0.1] = $r0.2   ## bblock 0, line 22, t31, t12
;;								## 12
	c0    stw 0x14[$r0.1] = $r0.11   ## bblock 0, line 22, t31, t13(SI8)
;;								## 13
.call func, caller, arg($r0.1 + 16, 12; $r0.3:s32,$r0.4:s32,$r0.5:s32,$r0.6:s32,$r0.7:s32,$r0.8:s32,$r0.9:s32,$r0.10:s32,0:s32,4:s32,8:s32), ret($r0.3:s32)
	c0    stw 0x18[$r0.1] = $r0.12   ## bblock 0, line 22, t31, t14(SI16)
	c0    call $l0.0 = func   ## bblock 0, line 22,  raddr(func)(P32),  t4,  t5,  t6,  t7,  t8,  t9,  t10,  t11
;;								## 14
.call printf, caller, arg($r0.3:u32,$r0.4:s32), ret($r0.3:s32)
	c0    call $l0.0 = printf   ## bblock 1, line 22,  raddr(printf)(P32),  addr(_?1STRINGVAR.1)(P32),  t3
	c0    mov $r0.3 = (_?1STRINGPACKET.1 + 0)   ## addr(_?1STRINGVAR.1)(P32)
	c0    mov $r0.4 = $r0.3   ## t3
;;								## 15
	c0    ldw $r0.3 = ((b + 0) + 0)[$r0.0]   ## bblock 2, line 23, t19, 0(I32)
;;								## 16
	c0    ldw $r0.4 = ((c + 0) + 0)[$r0.0]   ## bblock 2, line 23, t20, 0(I32)
;;								## 17
	c0    ldw $r0.5 = ((a + 0) + 0)[$r0.0]   ## bblock 2, line 23, t21, 0(I32)
;;								## 18
	c0    ldw $r0.6 = ((d + 0) + 0)[$r0.0]   ## bblock 2, line 23, t22, 0(I32)
;;								## 19
	c0    ldw $r0.7 = ((e + 0) + 0)[$r0.0]   ## bblock 2, line 23, t23, 0(I32)
;;								## 20
	c0    ldw $r0.8 = ((f + 0) + 0)[$r0.0]   ## bblock 2, line 23, t24, 0(I32)
;;								## 21
	c0    ldw $r0.9 = ((g + 0) + 0)[$r0.0]   ## bblock 2, line 23, t25, 0(I32)
;;								## 22
	c0    ldw $r0.10 = ((h + 0) + 0)[$r0.0]   ## bblock 2, line 23, t26, 0(I32)
;;								## 23
	c0    ldw $r0.2 = ((i + 0) + 0)[$r0.0]   ## bblock 2, line 23, t27, 0(I32)
;;								## 24
	c0    ldb $r0.11 = ((j + 0) + 0)[$r0.0]   ## bblock 2, line 23, t28(SI8), 0(I32)
;;								## 25
	c0    ldh $r0.12 = ((k + 0) + 0)[$r0.0]   ## bblock 2, line 23, t29(SI16), 0(I32)
;;								## 26
	c0    stw 0x10[$r0.1] = $r0.2   ## bblock 2, line 23, t31, t27
;;								## 27
	c0    stw 0x14[$r0.1] = $r0.11   ## bblock 2, line 23, t31, t28(SI8)
;;								## 28
.call func, caller, arg($r0.1 + 16, 12; $r0.3:s32,$r0.4:s32,$r0.5:s32,$r0.6:s32,$r0.7:s32,$r0.8:s32,$r0.9:s32,$r0.10:s32,0:s32,4:s32,8:s32), ret($r0.3:s32)
	c0    stw 0x18[$r0.1] = $r0.12   ## bblock 2, line 23, t31, t29(SI16)
	c0    call $l0.0 = func   ## bblock 2, line 23,  raddr(func)(P32),  t19,  t20,  t21,  t22,  t23,  t24,  t25,  t26
;;								## 29
.call printf, caller, arg($r0.3:u32,$r0.4:s32), ret($r0.3:s32)
	c0    call $l0.0 = printf   ## bblock 3, line 23,  raddr(printf)(P32),  addr(_?1STRINGVAR.2)(P32),  t18
	c0    mov $r0.3 = (_?1STRINGPACKET.2 + 0)   ## addr(_?1STRINGVAR.2)(P32)
	c0    mov $r0.4 = $r0.3   ## t18
;;								## 30
	c0    mov $r0.3 = $r0.0   ## 0(SI32)
	c0    ldw $l0.0 = 0x1c[$r0.1]  ## restore ## t30
	      xnop 3
;;								## 34
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 4, line 25,  t31,  ?2.2?2auto_size(I32),  t30
;;								## 35
.endp
.section .bss
.section .data
_?1STRINGPACKET.1:
    .data1 37
    .data1 100
    .data1 10
    .data1 0
_?1STRINGPACKET.2:
    .data1 37
    .data1 100
    .data1 10
    .data1 0
.equ ?2.2?2scratch.0, 0x0
.equ ?2.2?2ab_p.1, 0x10
.equ ?2.2?2ras_p, 0x1c
.section .data
.section .text
.equ ?2.2?2auto_size, 0x20
 ## End main
.section .bss
.section .data
a::
    .data4 100
b::
    .data4 2
c::
    .data4 10
d::
    .data4 10
e::
    .data4 10
f::
    .data4 10
g::
    .data4 10
h::
    .data4 10
i::
    .data4 10
j::
    .data1 10
.skip 3
k::
    .data2 -10
.section .data
.section .text
.import _i_div
.type _i_div,@function
.import func
.type func,@function
.import printf
.type printf,@function
