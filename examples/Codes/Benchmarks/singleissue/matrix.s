	.text
	.file	"matrix.ll"
	.globl	matrix_mul
	.align	2
	.type	matrix_mul,@function
matrix_mul::                            ## @matrix_mul
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
	c0	stw 28[$r0.1] = $r0.14  ## 4-byte Folded Spill
	c0	stw 24[$r0.1] = $r0.13  ## 4-byte Folded Spill
	c0	stw 20[$r0.1] = $r0.12  ## 4-byte Folded Spill
	c0	stw 16[$r0.1] = $r0.11  ## 4-byte Folded Spill
	c0	mov $r0.58 = 0
	c0	stw 12[$r0.1] = $r0.58
	c0	mov $r0.59 = b
	c0	mov $r0.60 = a
	c0	mov $r0.61 = c
LBB0_1::                                ## %for.cond
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_3 Depth 2
                                        ##       Child Loop BB0_5 Depth 3
	c0	ldw $r0.62 = 12[$r0.1]
	c0	cmpgt $b0.0 = $r0.62, 9
	c0	br $b0.0, LBB0_9
	c0	goto LBB0_2
LBB0_2::                                ## %for.body
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	stw 8[$r0.1] = $r0.58
LBB0_3::                                ## %for.cond1
                                        ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB0_5 Depth 3
	c0	ldw $r0.62 = 8[$r0.1]
	c0	cmpgt $b0.0 = $r0.62, 9
	c0	br $b0.0, LBB0_8
	c0	goto LBB0_4
LBB0_4::                                ## %for.body3
                                        ##   in Loop: Header=BB0_3 Depth=2
	c0	stw 0[$r0.1] = $r0.58
	c0	stw 4[$r0.1] = $r0.58
LBB0_5::                                ## %for.cond4
                                        ##   Parent Loop BB0_1 Depth=1
                                        ##     Parent Loop BB0_3 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	c0	ldw $r0.62 = 4[$r0.1]
	c0	cmpgt $b0.0 = $r0.62, 9
	c0	br $b0.0, LBB0_7
	c0	goto LBB0_6
LBB0_6::                                ## %for.inc
                                        ##   in Loop: Header=BB0_5 Depth=3
	c0	ldw $r0.62 = 12[$r0.1]
	c0	mpylu $r0.63 = $r0.62, 40
	c0	ldw $r0.11 = 4[$r0.1]
	c0	mpyhs $r0.62 = $r0.62, 40
	c0	ldw $r0.12 = 8[$r0.1]
	c0	add $r0.62 = $r0.63, $r0.62
	c0	mpylu $r0.63 = $r0.11, 40
	c0	ldw $r0.13 = 0[$r0.1]
	c0	add $r0.62 = $r0.60, $r0.62
	c0	mpyhs $r0.14 = $r0.11, 40
	c0	add $r0.63 = $r0.63, $r0.14
	c0	sh2add $r0.62 = $r0.11, $r0.62
	c0	add $r0.63 = $r0.59, $r0.63
	c0	ldw $r0.62 = 0[$r0.62]
	c0	sh2add $r0.63 = $r0.12, $r0.63
	c0	ldw $r0.63 = 0[$r0.63]
	c0	mpyhs $r0.11 = $r0.62, $r0.63
	c0	mpylu $r0.62 = $r0.62, $r0.63
	c0	add $r0.62 = $r0.62, $r0.11
	c0	add $r0.62 = $r0.13, $r0.62
	c0	stw 0[$r0.1] = $r0.62
	c0	ldw $r0.62 = 4[$r0.1]
	c0	add $r0.62 = $r0.62, 1
	c0	stw 4[$r0.1] = $r0.62
	c0	goto LBB0_5
LBB0_7::                                ## %for.inc12
                                        ##   in Loop: Header=BB0_3 Depth=2
	c0	ldw $r0.62 = 12[$r0.1]
	c0	mpylu $r0.63 = $r0.62, 40
	c0	ldw $r0.11 = 8[$r0.1]
	c0	mpyhs $r0.62 = $r0.62, 40
	c0	ldw $r0.12 = 0[$r0.1]
	c0	add $r0.62 = $r0.63, $r0.62
	c0	add $r0.62 = $r0.61, $r0.62
	c0	sh2add $r0.62 = $r0.11, $r0.62
	c0	stw 0[$r0.62] = $r0.12
	c0	ldw $r0.62 = 8[$r0.1]
	c0	add $r0.62 = $r0.62, 1
	c0	stw 8[$r0.1] = $r0.62
	c0	goto LBB0_3
LBB0_8::                                ## %for.inc15
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.62 = 12[$r0.1]
	c0	add $r0.62 = $r0.62, 1
	c0	stw 12[$r0.1] = $r0.62
	c0	goto LBB0_1
LBB0_9::                                ## %for.end17
	c0	mov $r0.3 = 0
	c0	ldw $r0.11 = 16[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.12 = 20[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.13 = 24[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.14 = 28[$r0.1]  ## 4-byte Folded Reload
	c0	return $r0.1 = $r0.1, 32, $l0.0
$func_end0::
	.size	matrix_mul, ($func_end0)-matrix_mul

	.globl	main
	.align	2
	.type	main,@function
main::                                  ## @main
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -24
	c0	stw 20[$r0.1] = $l0.0   ## 4-byte Folded Spill
	c0	stw 16[$r0.1] = $r0.11  ## 4-byte Folded Spill
	c0	mov $r0.11 = 0
	c0	stw 12[$r0.1] = $r0.11
	c0	stw 8[$r0.1] = $r0.11
LBB1_1::                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.58 = 8[$r0.1]
	c0	cmpgt $b0.0 = $r0.58, 999
	c0	br $b0.0, LBB1_3
	c0	goto LBB1_2
LBB1_2::                                ## %for.inc
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	call $l0.0 = matrix_mul
	c0	ldw $r0.58 = 8[$r0.1]
	c0	add $r0.58 = $r0.58, 1
	c0	stw 8[$r0.1] = $r0.58
	c0	goto LBB1_1
LBB1_3::                                ## %for.end
	c0	stw 8[$r0.1] = $r0.11
	c0	mov $r0.58 = c
	c0	mov $r0.59 = result
LBB1_4::                                ## %for.cond1
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_6 Depth 2
	c0	ldw $r0.60 = 8[$r0.1]
	c0	cmpgt $b0.0 = $r0.60, 9
	c0	br $b0.0, LBB1_11
	c0	goto LBB1_5
LBB1_5::                                ## %for.body3
                                        ##   in Loop: Header=BB1_4 Depth=1
	c0	stw 4[$r0.1] = $r0.11
LBB1_6::                                ## %for.cond4
                                        ##   Parent Loop BB1_4 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldw $r0.60 = 4[$r0.1]
	c0	cmpgt $b0.0 = $r0.60, 9
	c0	br $b0.0, LBB1_10
	c0	goto LBB1_7
LBB1_7::                                ## %for.body6
                                        ##   in Loop: Header=BB1_6 Depth=2
	c0	ldw $r0.60 = 8[$r0.1]
	c0	mpylu $r0.61 = $r0.60, 40
	c0	ldw $r0.62 = 4[$r0.1]
	c0	mpyhs $r0.60 = $r0.60, 40
	c0	add $r0.60 = $r0.61, $r0.60
	c0	add $r0.61 = $r0.59, $r0.60
	c0	add $r0.60 = $r0.58, $r0.60
	c0	sh2add $r0.61 = $r0.62, $r0.61
	c0	sh2add $r0.60 = $r0.62, $r0.60
	c0	ldw $r0.61 = 0[$r0.61]
	c0	ldw $r0.60 = 0[$r0.60]
	c0	cmpeq $b0.0 = $r0.60, $r0.61
	c0	br $b0.0, LBB1_9
	c0	goto LBB1_8
LBB1_9::                                ## %for.inc11
                                        ##   in Loop: Header=BB1_6 Depth=2
	c0	ldw $r0.60 = 4[$r0.1]
	c0	add $r0.60 = $r0.60, 1
	c0	stw 4[$r0.1] = $r0.60
	c0	goto LBB1_6
LBB1_10::                               ## %for.inc14
                                        ##   in Loop: Header=BB1_4 Depth=1
	c0	ldw $r0.60 = 8[$r0.1]
	c0	add $r0.60 = $r0.60, 1
	c0	stw 8[$r0.1] = $r0.60
	c0	goto LBB1_4
LBB1_8::                                ## %if.then
	c0	ldw $r0.58 = 8[$r0.1]
	c0	mpyhs $r0.59 = $r0.58, 100
	c0	ldw $r0.60 = 4[$r0.1]
	c0	mpylu $r0.58 = $r0.58, 100
	c0	add $r0.58 = $r0.58, $r0.59
	c0	add $r0.58 = $r0.58, $r0.60
	c0	stw 12[$r0.1] = $r0.58
	c0	goto LBB1_12
LBB1_11::                               ## %for.end16
	c0	mov $r0.58 = -1
	c0	stw 12[$r0.1] = $r0.58
LBB1_12::                               ## %return
	c0	ldw $r0.3 = 12[$r0.1]
	c0	ldw $r0.11 = 16[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $l0.0 = 20[$r0.1]   ## 4-byte Folded Reload
	c0	return $r0.1 = $r0.1, 24, $l0.0
$func_end1::
	.size	main, ($func_end1)-main

	.type	a,@object               ## @a
	.section .data
	.globl	a
	.align	2
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
	.size	a, 400

	.type	b,@object               ## @b
	.globl	b
	.align	2
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
	.size	b, 400

	.type	c,@object               ## @c
	.bss
	.globl	c
	.align	2
c::
	.zero	400
	.size	c, 400

	.type	result,@object          ## @result
	.data
	.globl	result
	.align	2
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
	.size	result, 400


