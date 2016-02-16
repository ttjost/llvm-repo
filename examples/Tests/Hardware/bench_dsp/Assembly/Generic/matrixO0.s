.section .text
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @matrix_mul
matrix_mul::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
	c0	mov $r0.11 = 0
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	mov $r0.12 = b
	c0	mov $r0.13 = a
	c0	mov $r0.14 = c
;;
LBB0_1::                                ## %for.cond
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_3 Depth 2
                                        ##       Child Loop BB0_5 Depth 3
	c0	ldw $r0.15 = 28[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.15, 9
;;
;;
	c0	br $b0.0, LBB0_9
;;
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	stw 24[$r0.1] = $r0.11
;;
LBB0_3::                                ## %for.cond1
                                        ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB0_5 Depth 3
	c0	ldw $r0.15 = 24[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.15, 9
;;
;;
	c0	br $b0.0, LBB0_8
;;
## BB#4:                                ## %for.body3
                                        ##   in Loop: Header=BB0_3 Depth=2
	c0	stw 20[$r0.1] = $r0.11
;;
LBB0_5::                                ## %for.cond4
                                        ##   Parent Loop BB0_1 Depth=1
                                        ##     Parent Loop BB0_3 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	c0	ldw $r0.15 = 20[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.15, 9
;;
;;
	c0	br $b0.0, LBB0_7
;;
## BB#6:                                ## %for.inc
                                        ##   in Loop: Header=BB0_5 Depth=3
	c0	ldw $r0.15 = 28[$r0.1]
;;
	c0	ldw $r0.16 = 20[$r0.1]
;;
	c0	mpyhs $r0.17 = $r0.15, 40
;;
	c0	mpylu $r0.15 = $r0.15, 40
	c0	mpylu $r0.18 = $r0.16, 40
	c0	mpyhs $r0.19 = $r0.16, 40
;;
;;
	c0	add $r0.15 = $r0.15, $r0.17
;;
	c0	ldw $r0.17 = 24[$r0.1]
	c0	add $r0.18 = $r0.18, $r0.19
;;
	c0	add $r0.19 = $r0.13, $r0.15
;;
	c0	add $r0.15 = $r0.14, $r0.15
	c0	add $r0.18 = $r0.12, $r0.18
	c0	sh2add $r0.16 = $r0.16, $r0.19
;;
	c0	sh2add $r0.15 = $r0.17, $r0.15
;;
	c0	sh2add $r0.17 = $r0.17, $r0.18
	c0	ldw $r0.16 = 0[$r0.16]
;;
	c0	ldw $r0.17 = 0[$r0.17]
;;
	c0	ldw $r0.18 = 0[$r0.15]
;;
	c0	mpyhs $r0.19 = $r0.16, $r0.17
;;
	c0	mpylu $r0.16 = $r0.16, $r0.17
;;
;;
	c0	add $r0.16 = $r0.16, $r0.19
;;
	c0	add $r0.16 = $r0.18, $r0.16
;;
	c0	stw 0[$r0.15] = $r0.16
;;
	c0	ldw $r0.15 = 20[$r0.1]
;;
;;
	c0	add $r0.15 = $r0.15, 1
;;
	c0	stw 20[$r0.1] = $r0.15
	c0	goto LBB0_5
;;
LBB0_7::                                ## %for.inc12
                                        ##   in Loop: Header=BB0_3 Depth=2
	c0	ldw $r0.15 = 24[$r0.1]
;;
;;
	c0	add $r0.15 = $r0.15, 1
;;
	c0	stw 24[$r0.1] = $r0.15
	c0	goto LBB0_3
;;
LBB0_8::                                ## %for.inc15
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.15 = 28[$r0.1]
;;
;;
	c0	add $r0.15 = $r0.15, 1
;;
	c0	stw 28[$r0.1] = $r0.15
	c0	goto LBB0_1
;;
LBB0_9::                                ## %for.end17
.return ret($r0.3:s32)
	c0	mov $r0.3 = 0
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @main
main::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 44[$r0.1] = $r0.57
;;
	c0	stw 40[$r0.1] = $l0.0
	c0	mov $r0.57 = 0
;;
.call matrix_mul, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	stw 36[$r0.1] = $r0.57
	c0	call $l0.0 = matrix_mul
;;
	c0	stw 32[$r0.1] = $r0.57
	c0	mov $r0.11 = c
	c0	mov $r0.12 = result
;;
LBB1_1::                                ## %for.cond
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_3 Depth 2
	c0	ldw $r0.13 = 32[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.13, 9
;;
;;
	c0	br $b0.0, LBB1_8
;;
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	stw 28[$r0.1] = $r0.57
;;
LBB1_3::                                ## %for.cond1
                                        ##   Parent Loop BB1_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldw $r0.13 = 28[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.13, 9
;;
;;
	c0	br $b0.0, LBB1_7
;;
## BB#4:                                ## %for.body3
                                        ##   in Loop: Header=BB1_3 Depth=2
	c0	ldw $r0.13 = 32[$r0.1]
;;
;;
	c0	mpylu $r0.14 = $r0.13, 40
;;
	c0	mpyhs $r0.13 = $r0.13, 40
	c0	ldw $r0.15 = 28[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.14, $r0.13
;;
	c0	add $r0.14 = $r0.12, $r0.13
;;
	c0	add $r0.13 = $r0.11, $r0.13
	c0	sh2add $r0.14 = $r0.15, $r0.14
;;
	c0	sh2add $r0.13 = $r0.15, $r0.13
	c0	ldw $r0.14 = 0[$r0.14]
;;
	c0	ldw $r0.13 = 0[$r0.13]
;;
;;
	c0	cmpeq $b0.0 = $r0.13, $r0.14
;;
;;
	c0	brf $b0.0, LBB1_5
;;
## BB#6:                                ## %for.inc
                                        ##   in Loop: Header=BB1_3 Depth=2
	c0	ldw $r0.13 = 28[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.13, 1
;;
	c0	stw 28[$r0.1] = $r0.13
	c0	goto LBB1_3
;;
LBB1_7::                                ## %for.inc8
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.13 = 32[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.13, 1
;;
	c0	stw 32[$r0.1] = $r0.13
	c0	goto LBB1_1
;;
LBB1_5::                                ## %if.then
	c0	mov $r0.11 = 1
;;
	c0	stw 36[$r0.1] = $r0.11
	c0	goto LBB1_9
;;
LBB1_8::                                ## %for.end10
	c0	mov $r0.11 = -1
;;
	c0	stw 36[$r0.1] = $r0.11
;;
LBB1_9::                                ## %return
	c0	ldw $r0.3 = 36[$r0.1]
;;
	c0	ldw $l0.0 = 40[$r0.1]
;;
	c0	ldw $r0.57 = 44[$r0.1]
;;
;;
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 64, $l0.0
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


