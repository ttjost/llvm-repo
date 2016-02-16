 ## Target: VEX 1 cluster (big endian)
.comment ""
.comment "Copyright (C) 1990-2010 Hewlett-Packard Company"
.comment "VEX C compiler version 3.43 (20110131 release)"
.comment ""
.comment "-dir /home/jost/Dropbox/Universidade/Mestrado/vex-3.43 -S -o struct_arg_vex.s"
.sversion 3.43
.rta 2
.section .bss
.align 32
.section .data
.align 32
.equ _?1TEMPLATEPACKET.9, 0x0
.equ _?1TEMPLATEPACKET.12, 0x0
 ## Begin st200_clone
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.1 + 16, 336; $r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:s32,$r0.9:s32,$r0.10:s32,32:[304])
st200_clone::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    add $r0.11 = $r0.7, $r0.10   ## [spec] bblock 2, line 96,  t56,  t42,  t45
	c0    add $r0.2 = $r0.8, $r0.9   ## [spec] bblock 2, line 96,  t57,  t43,  t44
;;								## 0
	c0    stw 0x10[$r0.1] = $r0.3   ## bblock 0, line 87, t28, t38
	c0    add $r0.12 = $r0.1, 0x40   ## bblock 0, line 92,  t1,  t28,  offset(regs.params?1.1.1)(P32)
;;								## 1
	c0    ldw $r0.12 = 8[$r0.12]   ## bblock 0, line 94, t2, t1
;;								## 2
	c0    stw 0x14[$r0.1] = $r0.4   ## bblock 0, line 87, t28, t39
;;								## 3
	c0    stw 0x18[$r0.1] = $r0.5   ## bblock 0, line 87, t28, t40
;;								## 4
	c0    stw 0x1c[$r0.1] = $r0.6   ## bblock 0, line 87, t28, t41
	c0    cmpeq $b0.0 = $r0.12, $r0.0   ## bblock 0, line 94,  t47(I1),  t2,  0(SI32)
;;								## 5
	c0    stw 0x20[$r0.1] = $r0.7   ## bblock 0, line 87, t28, t42
;;								## 6
	c0    stw 0x24[$r0.1] = $r0.8   ## bblock 0, line 87, t28, t43
;;								## 7
	c0    stw 0x28[$r0.1] = $r0.9   ## bblock 0, line 87, t28, t44
;;								## 8
	c0    stw 0x2c[$r0.1] = $r0.10   ## bblock 0, line 87, t28, t45
	c0    brf $b0.0, L0?3   ## bblock 0, line 94,  t47(I1)
;;								## 9
	c0    ldw $r0.5 = 0[$r0.5]   ## bblock 2, line 95, t10, t40
;;								## 10
	c0    ldw $r0.6 = 0[$r0.6]   ## bblock 2, line 96, t8, t41
	      xnop 1
;;								## 12
	c0    add $r0.3 = $r0.3, $r0.5   ## bblock 2, line 96,  t54,  t38,  t10
;;								## 13
	c0    add $r0.4 = $r0.4, $r0.6   ## bblock 2, line 96,  t55,  t39,  t8
	c0    add $r0.3 = $r0.3, $r0.2   ## bblock 2, line 96,  t58,  t54,  t57
;;								## 14
	c0    add $r0.4 = $r0.4, $r0.11   ## bblock 2, line 96,  t59,  t55,  t56
;;								## 15
	c0    add $r0.3 = $r0.3, $r0.4   ## bblock 2, line 96,  t13,  t58,  t59
;;								## 16
.return ret($r0.3:s32)
	c0    shl $r0.3 = $r0.3, 1   ## bblock 2, line 96,  t14,  t13,  1(I32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 2, line 96,  t28,  ?2.1?2auto_size(I32),  t27
;;								## 17
.trace 2
L0?3:
	c0    ldw $r0.2 = 0x1c[$r0.1]   ## bblock 1, line 99, t19, t28
;;								## 0
	c0    ldw $r0.4 = 0x20[$r0.1]   ## bblock 1, line 99, t18, t28
;;								## 1
	c0    ldw $r0.5 = 0x2c[$r0.1]   ## bblock 1, line 99, t15, t28
;;								## 2
	c0    ldw $r0.2 = 0[$r0.2]   ## bblock 1, line 99, t20, t19
;;								## 3
	c0    ldw $r0.6 = 0x10[$r0.1]   ## bblock 1, line 98, t24, t28
;;								## 4
	c0    ldw $r0.7 = 0x18[$r0.1]   ## bblock 1, line 98, t21, t28
;;								## 5
	c0    ldw $r0.2 = 0x24[$r0.1]   ## bblock 1, line 99, t17, t28
	c0    add $r0.4 = $r0.4, $r0.2   ## bblock 1, line 99,  t51,  t18,  t20
;;								## 6
	c0    ldw $r0.6 = 0x28[$r0.1]   ## bblock 1, line 99, t16, t28
	c0    add $r0.5 = $r0.5, $r0.6   ## bblock 1, line 99,  t48,  t15,  t24
;;								## 7
	c0    ldw $r0.7 = 0[$r0.7]   ## bblock 1, line 98, t22, t21
	c0    add $r0.5 = $r0.5, $r0.4   ## bblock 1, line 99,  t52,  t48,  t51
;;								## 8
	c0    ldw $r0.4 = 0x14[$r0.1]   ## bblock 1, line 98, t23, t28
	      xnop 1
;;								## 10
	c0    add $r0.2 = $r0.2, $r0.7   ## bblock 1, line 99,  t50,  t17,  t22
;;								## 11
	c0    add $r0.6 = $r0.6, $r0.4   ## bblock 1, line 99,  t49,  t16,  t23
;;								## 12
	c0    add $r0.6 = $r0.6, $r0.2   ## bblock 1, line 99,  t53,  t49,  t50
;;								## 13
	c0    add $r0.5 = $r0.5, $r0.6   ## bblock 1, line 99,  t25,  t52,  t53
;;								## 14
.return ret($r0.3:s32)
	c0    shl $r0.3 = $r0.5, 2   ## bblock 1, line 99,  t26,  t25,  2(I32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 1, line 99,  t28,  ?2.1?2auto_size(I32),  t27
;;								## 15
.endp
.section .bss
.section .data
.equ ?2.1?2pab_p.1, 0x10
.section .data
.section .text
.equ ?2.1?2auto_size, 0x20
 ## End st200_clone
 ## Begin main
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-640, arg()
main::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x280)
	c0    mov $r0.6 = 10   ## 10(SI32)
	c0    mov $r0.2 = 1   ## 1(SI32)
;;								## 0
	c0    add $r0.3 = $r0.1, 0x140   ## bblock 0, line 112,  t8,  t17,  offset(pad.par?1.4.2)=0x140(P32)
	c0    stw 0x274[$r0.1] = $l0.0  ## spill ## t16
;;								## 1
	c0    add $r0.4 = $r0.1, 0x10   ## bblock 0, line 112,  t27,  t17,  offset(syscallparams?1TAG.0?2ab_v.2.1)=0x10(P32)
	c0    mov $r0.7 = 100   ## 100(SI32)
	c0    stw 0x278[$r0.1] = $r0.3  ## spill ## t8
;;								## 2
	c0    add $r0.8 = $r0.1, 0x140   ## bblock 0, line 105,  t0,  t17,  offset(pad.par?1.4.2)=0x140(P32)
	c0    mov $r0.9 = 1000   ## 1000(SI32)
;;								## 3
	c0    add $r0.5 = $r0.1, 0x270   ## bblock 0, line 112,  t7,  t17,  offset(a?1.4)=0x270(P32)
	c0    mov $r0.10 = 10000   ## 10000(SI32)
;;								## 4
	c0    stw 0x27c[$r0.1] = $r0.5  ## spill ## t7
;;								## 5
	c0    stw 0[$r0.8] = $r0.2   ## bblock 0, line 106, t0, 1(SI32)
	c0    mov $r0.5 = 304   ## 304(SI32)
;;								## 6
	c0    stw 4[$r0.8] = $r0.6   ## bblock 0, line 107, t0, 10(SI32)
;;								## 7
	c0    stw 8[$r0.8] = $r0.7   ## bblock 0, line 108, t0, 100(SI32)
;;								## 8
	c0    stw 12[$r0.8] = $r0.9   ## bblock 0, line 109, t0, 1000(SI32)
;;								## 9
	c0    stw 0x270[$r0.1] = $r0.10   ## bblock 0, line 104, t17, 10000(SI32)
;;								## 10
.call _bcopy, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:s32), ret()
	c0    stw 0x158[$r0.1] = $r0.0   ## bblock 0, line 111, t17, 0(SI32)
	c0    call $l0.0 = _bcopy   ## bblock 0, line 112,  raddr(_bcopy)(P32),  t8,  t27,  304(SI32)
;;								## 11
	c0    mov $r0.10 = 4   ## 4(SI32)
	c0    mov $r0.9 = 3   ## 3(SI32)
	c0    ldw $r0.6 = 0x27c[$r0.1]  ## restore ## t7
;;								## 12
	c0    mov $r0.8 = 2   ## 2(SI32)
	c0    mov $r0.3 = 100   ## 100(I32)
	c0    mov $r0.4 = 1000   ## 1000(I32)
;;								## 13
	c0    mov $r0.7 = 100000   ## 100000(I32)
;;								## 14
.call st200_clone, caller, arg($r0.1 + 16, 304; $r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:s32,$r0.9:s32,$r0.10:s32,0:[304]), ret($r0.3:s32)
	c0    call $l0.0 = st200_clone   ## bblock 0, line 112,  raddr(st200_clone)(P32),  100(I32),  1000(I32),  t7,  t7,  100000(I32),  2(SI32),  3(SI32),  4(SI32)
	c0    mov $r0.5 = $r0.6   ## t7
;;								## 15
.call printf, caller, arg($r0.3:u32,$r0.4:s32), ret($r0.3:s32)
	c0    call $l0.0 = printf   ## bblock 1, line 112,  raddr(printf)(P32),  addr(_?1STRINGVAR.1)(P32),  t5
	c0    mov $r0.3 = (_?1STRINGPACKET.1 + 0)   ## addr(_?1STRINGVAR.1)(P32)
	c0    mov $r0.4 = $r0.3   ## t5
;;								## 16
	c0    add $r0.4 = $r0.1, 0x10   ## bblock 2, line 115,  t29,  t17,  offset(syscallparams?1TAG.0?2ab_v.2.2)=0x10(P32)
	c0    mov $r0.2 = 1   ## 1(SI32)
	c0    ldw $r0.3 = 0x278[$r0.1]  ## restore ## t8
;;								## 17
	c0    stw 0x158[$r0.1] = $r0.2   ## bblock 2, line 114, t17, 1(SI32)
	c0    mov $r0.5 = 304   ## 304(SI32)
;;								## 18
.call _bcopy, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:s32), ret()
	c0    call $l0.0 = _bcopy   ## bblock 2, line 115,  raddr(_bcopy)(P32),  t8,  t29,  304(SI32)
;;								## 19
	c0    mov $r0.10 = 4   ## 4(SI32)
	c0    mov $r0.9 = 3   ## 3(SI32)
	c0    ldw $r0.6 = 0x27c[$r0.1]  ## restore ## t7
;;								## 20
	c0    mov $r0.8 = 2   ## 2(SI32)
	c0    mov $r0.3 = 100   ## 100(I32)
	c0    mov $r0.4 = 1000   ## 1000(I32)
;;								## 21
	c0    mov $r0.7 = 100000   ## 100000(I32)
;;								## 22
.call st200_clone, caller, arg($r0.1 + 16, 304; $r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:s32,$r0.9:s32,$r0.10:s32,0:[304]), ret($r0.3:s32)
	c0    call $l0.0 = st200_clone   ## bblock 2, line 115,  raddr(st200_clone)(P32),  100(I32),  1000(I32),  t7,  t7,  100000(I32),  2(SI32),  3(SI32),  4(SI32)
	c0    mov $r0.5 = $r0.6   ## t7
;;								## 23
.call printf, caller, arg($r0.3:u32,$r0.4:s32), ret($r0.3:s32)
	c0    call $l0.0 = printf   ## bblock 3, line 115,  raddr(printf)(P32),  addr(_?1STRINGVAR.2)(P32),  t12
	c0    mov $r0.3 = (_?1STRINGPACKET.2 + 0)   ## addr(_?1STRINGVAR.2)(P32)
	c0    mov $r0.4 = $r0.3   ## t12
;;								## 24
	c0    mov $r0.3 = 1   ## 1(SI32)
	c0    ldw $l0.0 = 0x274[$r0.1]  ## restore ## t16
	      xnop 3
;;								## 28
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x280), $l0.0   ## bblock 4, line 117,  t17,  ?2.2?2auto_size(I32),  t16
;;								## 29
.endp
.section .bss
.section .data
_?1STRINGPACKET.1:
    .data1 37
    .data1 100
    .data1 10
    .data1 10
    .data1 0
.skip 3
_?1STRINGPACKET.2:
    .data1 37
    .data1 100
    .data1 10
    .data1 10
    .data1 0
.equ ?2.2?2scratch.0, 0x0
.equ ?2.2?2ab_p.1, 0x10
.equ _?1PACKET.3, 0x140
.equ _?1PACKET.2, 0x270
.equ ?2.2?2ras_p, 0x274
.equ ?2.2?2spill_p, 0x278
.section .data
.section .text
.equ ?2.2?2auto_size, 0x280
 ## End main
.section .bss
.section .data
.section .data
.section .text
.import _bcopy
.type _bcopy,@function
.import printf
.type printf,@function
.import st200_clone
.type st200_clone,@function
