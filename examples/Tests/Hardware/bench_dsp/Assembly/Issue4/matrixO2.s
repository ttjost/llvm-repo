.section .text
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @matrix_mul
matrix_mul::
## BB#0:                                ## %entry
	c0	mov $r0.11 = 0
	c0	mov $r0.12 = c
;;
	c0	mov $r0.13 = a
	c0	mov $r0.14 = -40
;;
	c0	mov $r0.15 = b
;;
LBB0_1::                                ## %for.cond1.preheader
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_2 Depth 2
	c0	mpyhs $r0.16 = $r0.11, 40
	c0	mpylu $r0.17 = $r0.11, 40
;;
;;
	c0	add $r0.16 = $r0.17, $r0.16
;;
	c0	add $r0.25 = $r0.13, $r0.16
;;
	c0	ldw $r0.16 = 32[$r0.25]
;;
	c0	ldw $r0.17 = 28[$r0.25]
;;
	c0	ldw $r0.18 = 24[$r0.25]
;;
	c0	ldw $r0.19 = 20[$r0.25]
;;
	c0	ldw $r0.20 = 16[$r0.25]
;;
	c0	ldw $r0.21 = 12[$r0.25]
;;
	c0	ldw $r0.22 = 8[$r0.25]
;;
	c0	ldw $r0.23 = 4[$r0.25]
;;
	c0	ldw $r0.24 = 0[$r0.25]
;;
	c0	ldw $r0.25 = 36[$r0.25]
	c0	mov $r0.26 = $r0.12
	c0	mov $r0.27 = $r0.14
;;
LBB0_2::                                ## %for.cond4.preheader
                                        ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	add $r0.28 = $r0.15, $r0.27
;;
	c0	ldw $r0.29 = 40[$r0.28]
;;
	c0	ldw $r0.30 = 80[$r0.28]
;;
	c0	mpyhs $r0.31 = $r0.29, $r0.24
	c0	mpylu $r0.29 = $r0.29, $r0.24
;;
	c0	mpylu $r0.32 = $r0.30, $r0.23
	c0	mpyhs $r0.30 = $r0.30, $r0.23
	c0	ldw $r0.33 = 120[$r0.28]
;;
	c0	add $r0.29 = $r0.29, $r0.31
;;
	c0	mpylu $r0.31 = $r0.33, $r0.22
	c0	mpyhs $r0.33 = $r0.33, $r0.22
	c0	ldw $r0.34 = 0[$r0.26]
	c0	add $r0.30 = $r0.32, $r0.30
;;
	c0	ldw $r0.32 = 160[$r0.28]
;;
	c0	add $r0.29 = $r0.34, $r0.29
	c0	add $r0.31 = $r0.31, $r0.33
;;
	c0	mpyhs $r0.33 = $r0.32, $r0.21
	c0	mpylu $r0.32 = $r0.32, $r0.21
	c0	ldw $r0.34 = 200[$r0.28]
	c0	add $r0.29 = $r0.29, $r0.30
;;
;;
	c0	mpylu $r0.30 = $r0.34, $r0.20
	c0	mpyhs $r0.34 = $r0.34, $r0.20
	c0	add $r0.32 = $r0.32, $r0.33
	c0	ldw $r0.33 = 240[$r0.28]
;;
	c0	add $r0.29 = $r0.29, $r0.31
;;
	c0	add $r0.30 = $r0.30, $r0.34
	c0	ldw $r0.31 = 280[$r0.28]
	c0	mpyhs $r0.34 = $r0.33, $r0.19
;;
	c0	mpylu $r0.33 = $r0.33, $r0.19
	c0	add $r0.29 = $r0.29, $r0.32
	c0	ldw $r0.32 = 320[$r0.28]
;;
	c0	add $r0.29 = $r0.29, $r0.30
;;
	c0	add $r0.30 = $r0.33, $r0.34
	c0	mpyhs $r0.33 = $r0.31, $r0.18
	c0	mpylu $r0.31 = $r0.31, $r0.18
;;
	c0	ldw $r0.34 = 360[$r0.28]
	c0	add $r0.29 = $r0.29, $r0.30
;;
;;
	c0	add $r0.30 = $r0.31, $r0.33
	c0	mpyhs $r0.31 = $r0.32, $r0.17
	c0	mpylu $r0.32 = $r0.32, $r0.17
;;
	c0	add $r0.29 = $r0.29, $r0.30
	c0	ldw $r0.28 = 400[$r0.28]
;;
	c0	add $r0.30 = $r0.32, $r0.31
	c0	mpyhs $r0.31 = $r0.34, $r0.16
	c0	mpylu $r0.32 = $r0.34, $r0.16
;;
	c0	add $r0.29 = $r0.29, $r0.30
	c0	mpyhs $r0.30 = $r0.28, $r0.25
	c0	mpylu $r0.28 = $r0.28, $r0.25
;;
	c0	add $r0.31 = $r0.32, $r0.31
	c0	add $r0.27 = $r0.27, 4
;;
	c0	add $r0.29 = $r0.29, $r0.31
	c0	add $r0.28 = $r0.28, $r0.30
	c0	add $r0.30 = $r0.26, 4
	c0	cmpne $b0.0 = $r0.27, 0
;;
	c0	add $r0.28 = $r0.29, $r0.28
;;
	c0	stw 0[$r0.26] = $r0.28
	c0	mov $r0.26 = $r0.30
	c0	br $b0.0, LBB0_2
;;
## BB#3:                                ## %for.inc15
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	add $r0.11 = $r0.11, 1
	c0	add $r0.12 = $r0.12, 40
;;
	c0	cmpne $b0.0 = $r0.11, 10
;;
;;
	c0	br $b0.0, LBB0_1
;;
## BB#4:                                ## %for.end17
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
	c0	stw 28[$r0.1] = $r0.57
;;
	c0	stw 24[$r0.1] = $r0.58
;;
	c0	stw 20[$r0.1] = $r0.59
;;
	c0	stw 16[$r0.1] = $l0.0
	c0	mov $r0.11 = result
;;
	c0	mov $r0.12 = c
	c0	mov $r0.57 = 0
;;
.call matrix_mul, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	add $r0.58 = $r0.12, 20
	c0	add $r0.59 = $r0.11, 20
	c0	call $l0.0 = matrix_mul
;;
	c0	mov $r0.11 = 1
	c0	mov $r0.12 = -1
;;
LBB1_1::                                ## %for.cond1.preheader
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.13 = -20[$r0.59]
;;
	c0	ldw $r0.14 = -20[$r0.58]
;;
;;
	c0	cmpne $b0.0 = $r0.14, $r0.13
	c0	mov $r0.13 = $r0.11
;;
;;
	c0	br $b0.0, LBB1_3
;;
## BB#2:                                ## %for.cond1
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.13 = -16[$r0.59]
;;
	c0	ldw $r0.14 = -16[$r0.58]
;;
;;
	c0	cmpeq $b0.0 = $r0.14, $r0.13
	c0	mov $r0.13 = $r0.11
;;
;;
	c0	brf $b0.0, LBB1_3
;;
## BB#4:                                ## %for.cond1.1
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.13 = -12[$r0.59]
;;
	c0	ldw $r0.14 = -12[$r0.58]
;;
;;
	c0	cmpne $b0.0 = $r0.14, $r0.13
	c0	mov $r0.13 = $r0.11
;;
;;
	c0	br $b0.0, LBB1_3
;;
## BB#5:                                ## %for.cond1.2
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.13 = -8[$r0.59]
;;
	c0	ldw $r0.14 = -8[$r0.58]
;;
;;
	c0	cmpne $b0.0 = $r0.14, $r0.13
	c0	mov $r0.13 = $r0.11
;;
;;
	c0	br $b0.0, LBB1_3
;;
## BB#6:                                ## %for.cond1.3
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.13 = -4[$r0.59]
;;
	c0	ldw $r0.14 = -4[$r0.58]
;;
;;
	c0	cmpne $b0.0 = $r0.14, $r0.13
	c0	mov $r0.13 = $r0.11
;;
;;
	c0	br $b0.0, LBB1_3
;;
## BB#7:                                ## %for.cond1.4
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.13 = 0[$r0.59]
;;
	c0	ldw $r0.14 = 0[$r0.58]
;;
;;
	c0	cmpne $b0.0 = $r0.14, $r0.13
	c0	mov $r0.13 = $r0.11
;;
;;
	c0	br $b0.0, LBB1_3
;;
## BB#8:                                ## %for.cond1.5
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.13 = 4[$r0.59]
;;
	c0	ldw $r0.14 = 4[$r0.58]
;;
;;
	c0	cmpne $b0.0 = $r0.14, $r0.13
	c0	mov $r0.13 = $r0.11
;;
;;
	c0	br $b0.0, LBB1_3
;;
## BB#9:                                ## %for.cond1.6
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.13 = 8[$r0.59]
;;
	c0	ldw $r0.14 = 8[$r0.58]
;;
;;
	c0	cmpne $b0.0 = $r0.14, $r0.13
	c0	mov $r0.13 = $r0.11
;;
;;
	c0	br $b0.0, LBB1_3
;;
## BB#10:                               ## %for.cond1.7
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.13 = 12[$r0.59]
;;
	c0	ldw $r0.14 = 12[$r0.58]
;;
;;
	c0	cmpne $b0.0 = $r0.14, $r0.13
	c0	mov $r0.13 = $r0.11
;;
;;
	c0	br $b0.0, LBB1_3
;;
## BB#11:                               ## %for.cond1.8
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.13 = 16[$r0.59]
;;
	c0	ldw $r0.14 = 16[$r0.58]
;;
;;
	c0	cmpne $b0.0 = $r0.14, $r0.13
	c0	mov $r0.13 = $r0.11
;;
;;
	c0	br $b0.0, LBB1_3
;;
## BB#12:                               ## %for.cond1.9
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	add $r0.57 = $r0.57, 1
	c0	add $r0.58 = $r0.58, 40
	c0	add $r0.59 = $r0.59, 40
;;
	c0	cmplt $b0.0 = $r0.57, 10
	c0	mov $r0.13 = $r0.12
;;
;;
	c0	br $b0.0, LBB1_1
;;
LBB1_3::                                ## %return
	c0	mov $r0.3 = $r0.13
	c0	ldw $l0.0 = 16[$r0.1]
;;
	c0	ldw $r0.59 = 20[$r0.1]
;;
	c0	ldw $r0.58 = 24[$r0.1]
;;
	c0	ldw $r0.57 = 28[$r0.1]
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .data
	.align	4                       ## @a
a::
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
b::
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

.section .bss
	.align	4                       ## @c
c::
	.skip	400

.section .data
	.align	4                       ## @result
result::
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


