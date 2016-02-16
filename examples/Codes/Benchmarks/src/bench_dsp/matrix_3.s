.section .text

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @matrix_mul
matrix_mul::
## BB#0:                                ## %entry
	c0	mov $r0.2 = 0
	c0	mov $r0.3 = c
	c0	mov $r0.4 = a
	c0	mov $r0.5 = -40
	c0	mov $r0.6 = b
;;
LBB0_1:                                 ## %for.cond1.preheader
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_2 Depth 2
	c0	mpyhs $r0.7 = $r0.2, 40
	c0	mpylu $r0.8 = $r0.2, 40
;;
	c0	add $r0.7 = $r0.8, $r0.7
;;
	c0	add $r0.16 = $r0.4, $r0.7
;;
	c0	ldw $r0.7 = 32[$r0.16]
;;
	c0	ldw $r0.8 = 28[$r0.16]
;;
	c0	ldw $r0.9 = 36[$r0.16]
;;
	c0	ldw $r0.10 = 24[$r0.16]
;;
	c0	ldw $r0.11 = 20[$r0.16]
;;
	c0	ldw $r0.12 = 16[$r0.16]
;;
	c0	ldw $r0.13 = 12[$r0.16]
;;
	c0	ldw $r0.14 = 8[$r0.16]
;;
	c0	ldw $r0.15 = 4[$r0.16]
;;
	c0	ldw $r0.16 = 0[$r0.16]
	c0	mov $r0.18 = $r0.3
	c0	mov $r0.17 = $r0.5
;;
LBB0_2:                                 ## %for.cond4.preheader
                                        ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldw $r0.19 = 0[$r0.18]
	c0	add $r0.20 = $r0.6, $r0.17
;;
	c0	ldw $r0.21 = 40[$r0.20]
;;
	c0	mpylu $r0.22 = $r0.21, $r0.16
	c0	mpyhs $r0.21 = $r0.21, $r0.16
	c0	ldw $r0.23 = 80[$r0.20]
;;
	c0	mpylu $r0.24 = $r0.23, $r0.15
	c0	add $r0.21 = $r0.22, $r0.21
	c0	mpyhs $r0.22 = $r0.23, $r0.15
	c0	ldw $r0.23 = 120[$r0.20]
;;
	c0	mpylu $r0.25 = $r0.23, $r0.14
	c0	add $r0.22 = $r0.24, $r0.22
	c0	mpyhs $r0.23 = $r0.23, $r0.14
	c0	add $r0.19 = $r0.19, $r0.21
	c0	ldw $r0.21 = 160[$r0.20]
;;
	c0	mpylu $r0.24 = $r0.21, $r0.13
	c0	add $r0.19 = $r0.19, $r0.22
	c0	mpyhs $r0.21 = $r0.21, $r0.13
	c0	add $r0.22 = $r0.25, $r0.23
	c0	ldw $r0.23 = 200[$r0.20]
;;
	c0	mpylu $r0.25 = $r0.23, $r0.12
	c0	add $r0.19 = $r0.19, $r0.22
	c0	mpyhs $r0.22 = $r0.23, $r0.12
	c0	add $r0.21 = $r0.24, $r0.21
	c0	ldw $r0.23 = 240[$r0.20]
;;
	c0	mpyhs $r0.24 = $r0.23, $r0.11
	c0	add $r0.19 = $r0.19, $r0.21
	c0	mpylu $r0.21 = $r0.23, $r0.11
	c0	add $r0.22 = $r0.25, $r0.22
	c0	ldw $r0.23 = 280[$r0.20]
;;
	c0	mpylu $r0.25 = $r0.23, $r0.10
	c0	add $r0.21 = $r0.21, $r0.24
	c0	mpyhs $r0.23 = $r0.23, $r0.10
	c0	add $r0.19 = $r0.19, $r0.22
	c0	ldw $r0.22 = 320[$r0.20]
;;
	c0	add $r0.23 = $r0.25, $r0.23
	c0	mpylu $r0.24 = $r0.22, $r0.8
	c0	add $r0.19 = $r0.19, $r0.21
	c0	mpyhs $r0.21 = $r0.22, $r0.8
	c0	ldw $r0.22 = 360[$r0.20]
	c0	add $r0.25 = $r0.18, 4
;;
	c0	mpylu $r0.26 = $r0.22, $r0.7
	c0	add $r0.21 = $r0.24, $r0.21
	c0	mpyhs $r0.22 = $r0.22, $r0.7
	c0	add $r0.19 = $r0.19, $r0.23
	c0	ldw $r0.20 = 400[$r0.20]
;;
	c0	add $r0.22 = $r0.26, $r0.22
	c0	mpyhs $r0.23 = $r0.20, $r0.9
	c0	add $r0.19 = $r0.19, $r0.21
	c0	mpylu $r0.20 = $r0.20, $r0.9
	c0	add $r0.17 = $r0.17, 4
;;
	c0	add $r0.20 = $r0.20, $r0.23
	c0	add $r0.19 = $r0.19, $r0.22
;;
	c0	add $r0.19 = $r0.19, $r0.20
;;
	c0	stw 0[$r0.18] = $r0.19
	c0	cmpne $b0.0 = $r0.17, 0
	c0	mov $r0.18 = $r0.25
;;
	c0	br $b0.0, LBB0_2
;;
	c0	goto LBB0_3
;;
LBB0_3:                                 ## %for.inc15
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	add $r0.2 = $r0.2, 1
	c0	add $r0.3 = $r0.3, 40
;;
	c0	cmpne $b0.0 = $r0.2, 10
;;
	c0	br $b0.0, LBB0_1
;;
	c0	goto LBB0_4
;;
LBB0_4:                                 ## %for.end17
.return ret($r0.3:s32)
	c0	mov $r0.3 = 0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @main
main::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
.call matrix_mul, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	stw 28[$r0.1] = $l0.0
	c0	call $l0.0 = matrix_mul
;;
	c0	mov $r0.3 = 0
	c0	ldw $l0.0 = 28[$r0.1]
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .data

	.align	4                       ## @a
a:
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1

	.align	4                       ## @b
b:
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1

.section .bss .section .data

	.align	4                       ## @c
c:
	.skip	400

.section .data

	.align	4                       ## @result
result:
	.data4	8                       ## 0x8
	.data4	4                       ## 0x4
	.data4	4                       ## 0x4
	.data4	0                       ## 0x0
	.data4	2                       ## 0x2
	.data4	4                       ## 0x4
	.data4	2                       ## 0x2
	.data4	4                       ## 0x4
	.data4	6                       ## 0x6
	.data4	4                       ## 0x4
	.data4	6                       ## 0x6
	.data4	10                      ## 0xa
	.data4	10                      ## 0xa
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	10                      ## 0xa
	.data4	8                       ## 0x8
	.data4	10                      ## 0xa
	.data4	6                       ## 0x6
	.data4	10                      ## 0xa
	.data4	10                      ## 0xa
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	10                      ## 0xa
	.data4	8                       ## 0x8
	.data4	10                      ## 0xa
	.data4	6                       ## 0x6
	.data4	10                      ## 0xa
	.data4	10                      ## 0xa
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	10                      ## 0xa
	.data4	8                       ## 0x8
	.data4	10                      ## 0xa
	.data4	2                       ## 0x2
	.data4	6                       ## 0x6
	.data4	6                       ## 0x6
	.data4	2                       ## 0x2
	.data4	8                       ## 0x8
	.data4	2                       ## 0x2
	.data4	4                       ## 0x4
	.data4	6                       ## 0x6
	.data4	4                       ## 0x4
	.data4	6                       ## 0x6
	.data4	4                       ## 0x4
	.data4	8                       ## 0x8
	.data4	8                       ## 0x8
	.data4	4                       ## 0x4
	.data4	6                       ## 0x6
	.data4	4                       ## 0x4
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	4                       ## 0x4
	.data4	8                       ## 0x8
	.data4	8                       ## 0x8
	.data4	4                       ## 0x4
	.data4	6                       ## 0x6
	.data4	4                       ## 0x4
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	4                       ## 0x4
	.data4	8                       ## 0x8
	.data4	8                       ## 0x8
	.data4	4                       ## 0x4
	.data4	6                       ## 0x6
	.data4	4                       ## 0x4
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	6                       ## 0x6
	.data4	10                      ## 0xa
	.data4	10                      ## 0xa
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	10                      ## 0xa
	.data4	8                       ## 0x8
	.data4	10                      ## 0xa
	.data4	6                       ## 0x6
	.data4	10                      ## 0xa
	.data4	10                      ## 0xa
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	10                      ## 0xa
	.data4	8                       ## 0x8
	.data4	10                      ## 0xa


.import printf
.type printf, @function
.import puts
.type puts, @function
