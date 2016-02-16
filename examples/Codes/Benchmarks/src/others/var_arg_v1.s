 ## Target: VEX 1 cluster (big endian)
.comment ""
.comment "Copyright (C) 1990-2010 Hewlett-Packard Company"
.comment "VEX C compiler version 3.43 (20110131 release)"
.comment ""
.comment "-dir /home/jost/Dropbox/Universidade/Mestrado/vex-3.43 -S -o var_arg_v1.s"
.sversion 3.43
.rta 2
.section .bss
.align 32
.section .data
.align 32
.equ _?1TEMPLATEPACKET.9, 0x0
 ## Begin FindMax
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.1 + 16, 32; $r0.3:s32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32,$r0.9:u32,$r0.10:u32)
FindMax::
.trace 3
	c0    add $r0.1 = $r0.1, (-0x20)
;;								## 0
	c0    stw 0x14[$r0.1] = $r0.4   ## bblock 0, line 5, t25, t36
	c0    add $r0.11 = $r0.1, 0x1b   ## bblock 0, line 10,  t3,  t25,  (offset(n?1.1)(P32) + 0xb(I32))(P32)
;;								## 1
	c0    stw 0x10[$r0.1] = $r0.3   ## bblock 0, line 5, t25, t47
	c0    and $r0.2 = $r0.11, (~0x3)   ## bblock 0, line 10,  t43,  t3,  (~0x3)(I32)
	c0    sub $r0.4 = 4, $r0.3   ## bblock 0, line 0,  t73,  4(I32),  t47
;;								## 2
	c0    stw 0x18[$r0.1] = $r0.5   ## bblock 0, line 5, t25, t37
;;								## 3
	c0    stw 0x1c[$r0.1] = $r0.6   ## bblock 0, line 5, t25, t38
;;								## 4
	c0    stw 0x20[$r0.1] = $r0.7   ## bblock 0, line 5, t25, t39
;;								## 5
	c0    stw 0x24[$r0.1] = $r0.8   ## bblock 0, line 5, t25, t40
;;								## 6
	c0    stw 0x28[$r0.1] = $r0.9   ## bblock 0, line 5, t25, t41
;;								## 7
	c0    stw 0x2c[$r0.1] = $r0.10   ## bblock 0, line 5, t25, t42
;;								## 8
	c0    ldw $r0.3 = (~0x3)[$r0.2]   ## bblock 0, line 10, t61, t43
	      xnop 2
;;								## 11
	c0    mov $r0.5 = $r0.3   ## bblock 0, line 10,  t49,  t61
;;								## 12
.trace 1
L0?3:
	c0    cmplt $b0.0 = $r0.4, 3   ## bblock 1, line 11,  t88(I1),  t73,  3(SI32)
	c0    add $r0.2 = $r0.2, 7   ## [spec] bblock 3, line 13,  t56,  t43,  7(SI32)
	c0    cmplt $b0.1 = $r0.4, 2   ## [spec] bblock 3, line 11-1,  t89(I1),  t73,  2(SI32)
	c0    cmplt $b0.2 = $r0.4, 1   ## [spec] bblock 11, line 11-2,  t91(I1),  t73,  1(SI32)
;;								## 0
	c0    and $r0.2 = $r0.2, (~0x3)   ## [spec] bblock 3, line 13,  t50,  t56,  (~0x3)(I32)
	c0    cmplt $b0.3 = $r0.4, $r0.0   ## [spec] bblock 8, line 11-3,  t90(I1),  t73,  0(SI32)
	c0    add $r0.4 = $r0.4, 4   ## [spec] bblock 5, line 0,  t73,  t73,  4(I32)
;;								## 1
	c0    ldw.d $r0.6 = (~0x3)[$r0.2]   ## [spec] bblock 3, line 13, t21, t50
	c0    add $r0.2 = $r0.2, 7   ## [spec] bblock 11, line 13-1,  t64,  t50,  7(SI32)
	c0    brf $b0.0, L1?3   ## bblock 1, line 11,  t88(I1)
;;								## 2
	c0    and $r0.2 = $r0.2, (~0x3)   ## [spec] bblock 11, line 13-1,  t65,  t64,  (~0x3)(I32)
;;								## 3
	c0    ldw.d $r0.7 = (~0x3)[$r0.2]   ## [spec] bblock 11, line 13-1, t66, t65
	c0    add $r0.2 = $r0.2, 7   ## [spec] bblock 8, line 13-2,  t59,  t65,  7(SI32)
;;								## 4
	c0    max $r0.3 = $r0.3, $r0.6   ## bblock 3, line 14,  t52,  t61,  t21
	c0    and $r0.2 = $r0.2, (~0x3)   ## [spec] bblock 8, line 13-2,  t58,  t59,  (~0x3)(I32)
	c0    brf $b0.1, L2?3   ## bblock 3, line 11-1,  t89(I1)
;;								## 5
	c0    ldw.d $r0.6 = (~0x3)[$r0.2]   ## [spec] bblock 8, line 13-2, t57, t58
	c0    add $r0.2 = $r0.2, 7   ## [spec] bblock 5, line 13-3,  t13,  t58,  7(SI32)
;;								## 6
	c0    max $r0.5 = $r0.5, $r0.7   ## bblock 11, line 14-1,  t69,  t49,  t66
	c0    and $r0.2 = $r0.2, (~0x3)   ## [spec] bblock 5, line 13-3,  t43,  t13,  (~0x3)(I32)
	c0    brf $b0.2, L3?3   ## bblock 11, line 11-2,  t91(I1)
;;								## 7
	c0    ldw.d $r0.7 = (~0x3)[$r0.2]   ## [spec] bblock 5, line 13-3, t51, t43
;;								## 8
	c0    max $r0.3 = $r0.3, $r0.6   ## bblock 8, line 14-2,  t61,  t52,  t57
	c0    brf $b0.3, L4?3   ## bblock 8, line 11-3,  t90(I1)
;;								## 9
;;								## 10
	c0    max $r0.5 = $r0.5, $r0.7   ## bblock 5, line 14-3,  t49,  t69,  t51
	c0    goto L0?3 ## goto
;;								## 11
.trace 7
L4?3:
	   ## bblock 6, line 0,  t60,  t69## $r0.5(skipped)
	   ## bblock 6, line 0,  t44,  t61## $r0.3(skipped)
;;								## 0
.return ret($r0.3:s32)
	c0    max $r0.3 = $r0.3, $r0.5   ## bblock 2, line 0,  t53,  t44,  t60
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 2, line 17,  t25,  ?2.1?2auto_size(I32),  t24
;;								## 1
.trace 6
L3?3:
	   ## bblock 9, line 0,  t60,  t69## $r0.5(skipped)
	   ## bblock 9, line 0,  t44,  t52## $r0.3(skipped)
;;								## 0
.return ret($r0.3:s32)
	c0    max $r0.3 = $r0.3, $r0.5   ## bblock 2, line 0,  t53,  t44,  t60
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 2, line 17,  t25,  ?2.1?2auto_size(I32),  t24
;;								## 1
.trace 5
L2?3:
	   ## bblock 12, line 0,  t60,  t49## $r0.5(skipped)
	   ## bblock 12, line 0,  t44,  t52## $r0.3(skipped)
;;								## 0
.return ret($r0.3:s32)
	c0    max $r0.3 = $r0.3, $r0.5   ## bblock 2, line 0,  t53,  t44,  t60
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 2, line 17,  t25,  ?2.1?2auto_size(I32),  t24
;;								## 1
.trace 4
L1?3:
	   ## bblock 13, line 0,  t60,  t49## $r0.5(skipped)
	   ## bblock 13, line 0,  t44,  t61## $r0.3(skipped)
;;								## 0
.return ret($r0.3:s32)
	c0    max $r0.3 = $r0.3, $r0.5   ## bblock 2, line 0,  t53,  t44,  t60
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 2, line 17,  t25,  ?2.1?2auto_size(I32),  t24
;;								## 1
.endp
.section .bss
.section .data
.equ ?2.1?2pab_p.1, 0x10
.section .data
.section .text
.equ ?2.1?2auto_size, 0x20
 ## End FindMax
 ## Begin main
.section .text
.proc
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg()
main::
.trace 1
	c0    add $r0.1 = $r0.1, (-0x20)
	c0    mov $r0.9 = 104   ## 104(SI32)
	c0    mov $r0.3 = 7   ## 7(SI32)
;;								## 0
	c0    stw 0x10[$r0.1] = $l0.0  ## spill ## t5
	c0    mov $r0.4 = 702   ## 702(SI32)
;;								## 1
	c0    mov $r0.5 = 422   ## 422(SI32)
	c0    mov $r0.6 = 631   ## 631(SI32)
;;								## 2
	c0    mov $r0.7 = 834   ## 834(SI32)
	c0    mov $r0.8 = 892   ## 892(SI32)
;;								## 3
.call FindMax, caller, arg($r0.3:s32,$r0.4:s32,$r0.5:s32,$r0.6:s32,$r0.7:s32,$r0.8:s32,$r0.9:s32,$r0.10:s32), ret($r0.3:s32)
	c0    call $l0.0 = FindMax   ## bblock 0, line 23,  raddr(FindMax)(P32),  7(SI32),  702(SI32),  422(SI32),  631(SI32),  834(SI32),  892(SI32),  104(SI32),  772(SI32)
	c0    mov $r0.10 = 772   ## 772(SI32)
;;								## 4
.call printf, caller, arg($r0.3:u32,$r0.4:s32), ret($r0.3:s32)
	c0    call $l0.0 = printf   ## bblock 1, line 26,  raddr(printf)(P32),  addr(_?1STRINGVAR.1)(P32),  t0
	c0    mov $r0.3 = (_?1STRINGPACKET.1 + 0)   ## addr(_?1STRINGVAR.1)(P32)
	c0    mov $r0.4 = $r0.3   ## t0
;;								## 5
	c0    mov $r0.3 = $r0.0   ## 0(SI32)
	c0    ldw $l0.0 = 0x10[$r0.1]  ## restore ## t5
	      xnop 3
;;								## 9
.return ret($r0.3:s32)
	c0    return $r0.1 = $r0.1, (0x20), $l0.0   ## bblock 2, line 27,  t6,  ?2.2?2auto_size(I32),  t5
;;								## 10
.endp
.section .bss
.section .data
_?1STRINGPACKET.1:
    .data1 84
    .data1 104
    .data1 101
    .data1 32
    .data1 108
    .data1 97
    .data1 114
    .data1 103
    .data1 101
    .data1 115
    .data1 116
    .data1 32
    .data1 118
    .data1 97
    .data1 108
    .data1 117
    .data1 101
    .data1 32
    .data1 105
    .data1 115
    .data1 58
    .data1 32
    .data1 37
    .data1 100
    .data1 10
    .data1 0
.equ ?2.2?2scratch.0, 0x0
.equ ?2.2?2ras_p, 0x10
.section .data
.section .text
.equ ?2.2?2auto_size, 0x20
 ## End main
.section .bss
.section .data
.section .data
.section .text
.import FindMax
.type FindMax,@function
.import printf
.type printf,@function
