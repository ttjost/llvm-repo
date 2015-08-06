	.text
	.file	"x264_wrong.ll"
	.globl	abs
	.align	2
	.type	abs,@function
abs::                                   ## @abs
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -8
	c0	stw 0[$r0.1] = $r0.3
	c0	cmpgt $b0.0 = $r0.3, -1
	c0	br $b0.0, LBB0_2
	c0	goto LBB0_1
LBB0_1::                                ## %if.then
	c0	ldw $r0.58 = 0[$r0.1]
	c0	mov $r0.59 = 0
	c0	sub $r0.58 = $r0.59, $r0.58
	c0	stw 4[$r0.1] = $r0.58
	c0	goto LBB0_3
LBB0_2::                                ## %if.else
	c0	ldw $r0.58 = 0[$r0.1]
	c0	stw 4[$r0.1] = $r0.58
LBB0_3::                                ## %return
	c0	ldw $r0.3 = 4[$r0.1]
	c0	return $r0.1 = $r0.1, 8, $l0.0
$func_end0::
	.size	abs, ($func_end0)-abs

	.globl	main
	.align	2
	.type	main,@function
main::                                  ## @main
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
	c0	stw 60[$r0.1] = $l0.0   ## 4-byte Folded Spill
	c0	stw 56[$r0.1] = $r0.17  ## 4-byte Folded Spill
	c0	stw 52[$r0.1] = $r0.16  ## 4-byte Folded Spill
	c0	stw 48[$r0.1] = $r0.15  ## 4-byte Folded Spill
	c0	stw 44[$r0.1] = $r0.14  ## 4-byte Folded Spill
	c0	stw 40[$r0.1] = $r0.13  ## 4-byte Folded Spill
	c0	stw 36[$r0.1] = $r0.12  ## 4-byte Folded Spill
	c0	stw 32[$r0.1] = $r0.11  ## 4-byte Folded Spill
	c0	stw 28[$r0.1] = $r0.9   ## 4-byte Folded Spill
	c0	stw 24[$r0.1] = $r0.8   ## 4-byte Folded Spill
	c0	stw 20[$r0.1] = $r0.7   ## 4-byte Folded Spill
	c0	stw 16[$r0.1] = $r0.6   ## 4-byte Folded Spill
	c0	mov $r0.12 = 0
	c0	mov $r0.58 = 16
	c0	stw 12[$r0.1] = $r0.12
	c0	stw 8[$r0.1] = $r0.58
	c0	stw 4[$r0.1] = $r0.12
	c0	mov $r0.11 = scores
	c0	mov $r0.13 = pix0
	c0	mov $r0.14 = pix1
	c0	mov $r0.15 = pix2
	c0	mov $r0.16 = pix3
	c0	mov $r0.17 = fenc
LBB1_1::                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.58 = 4[$r0.1]
	c0	cmpgt $b0.0 = $r0.58, 999
	c0	br $b0.0, LBB1_3
	c0	goto LBB1_2
LBB1_2::                                ## %for.inc
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.8 = 8[$r0.1]
	c0	mov $r0.3 = $r0.17
	c0	mov $r0.4 = $r0.13
	c0	mov $r0.5 = $r0.14
	c0	mov $r0.6 = $r0.15
	c0	mov $r0.7 = $r0.16
	c0	mov $r0.9 = $r0.11
	c0	call $l0.0 = x264_pixel_sad_x4_16x16
	c0	ldw $r0.58 = 4[$r0.1]
	c0	add $r0.58 = $r0.58, 1
	c0	stw 4[$r0.1] = $r0.58
	c0	goto LBB1_1
LBB1_3::                                ## %for.end
	c0	stw 4[$r0.1] = $r0.12
	c0	mov $r0.58 = scores_temp
LBB1_4::                                ## %for.cond1
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.59 = 4[$r0.1]
	c0	cmpgt $b0.0 = $r0.59, 3
	c0	br $b0.0, LBB1_8
	c0	goto LBB1_5
LBB1_5::                                ## %for.body3
                                        ##   in Loop: Header=BB1_4 Depth=1
	c0	ldw $r0.59 = 4[$r0.1]
	c0	sh2add $r0.60 = $r0.59, $r0.58
	c0	sh2add $r0.59 = $r0.59, $r0.11
	c0	ldw $r0.60 = 0[$r0.60]
	c0	ldw $r0.59 = 0[$r0.59]
	c0	cmpeq $b0.0 = $r0.59, $r0.60
	c0	br $b0.0, LBB1_7
	c0	goto LBB1_6
LBB1_7::                                ## %for.inc6
                                        ##   in Loop: Header=BB1_4 Depth=1
	c0	ldw $r0.59 = 4[$r0.1]
	c0	add $r0.59 = $r0.59, 1
	c0	stw 4[$r0.1] = $r0.59
	c0	goto LBB1_4
LBB1_6::                                ## %if.then
	c0	ldw $r0.58 = 4[$r0.1]
	c0	mpyhs $r0.59 = $r0.58, 100
	c0	mpylu $r0.58 = $r0.58, 100
	c0	add $r0.58 = $r0.58, $r0.59
	c0	stw 12[$r0.1] = $r0.58
	c0	goto LBB1_9
LBB1_8::                                ## %for.end8
	c0	mov $r0.58 = -1
	c0	stw 12[$r0.1] = $r0.58
LBB1_9::                                ## %return
	c0	ldw $r0.3 = 12[$r0.1]
	c0	ldw $r0.6 = 16[$r0.1]   ## 4-byte Folded Reload
	c0	ldw $r0.7 = 20[$r0.1]   ## 4-byte Folded Reload
	c0	ldw $r0.8 = 24[$r0.1]   ## 4-byte Folded Reload
	c0	ldw $r0.9 = 28[$r0.1]   ## 4-byte Folded Reload
	c0	ldw $r0.11 = 32[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.12 = 36[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.13 = 40[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.14 = 44[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.15 = 48[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.16 = 52[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.17 = 56[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $l0.0 = 60[$r0.1]   ## 4-byte Folded Reload
	c0	return $r0.1 = $r0.1, 64, $l0.0
$func_end1::
	.size	main, ($func_end1)-main

	.align	2
	.type	x264_pixel_sad_x4_16x16,@function
x264_pixel_sad_x4_16x16::               ## @x264_pixel_sad_x4_16x16
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -56
	c0	stw 52[$r0.1] = $l0.0   ## 4-byte Folded Spill
	c0	stw 48[$r0.1] = $r0.11  ## 4-byte Folded Spill
	c0	stw 44[$r0.1] = $r0.9   ## 4-byte Folded Spill
	c0	stw 40[$r0.1] = $r0.8   ## 4-byte Folded Spill
	c0	stw 36[$r0.1] = $r0.7   ## 4-byte Folded Spill
	c0	stw 32[$r0.1] = $r0.6   ## 4-byte Folded Spill
	c0	stw 28[$r0.1] = $r0.3
	c0	stw 24[$r0.1] = $r0.4
	c0	stw 20[$r0.1] = $r0.5
	c0	stw 16[$r0.1] = $r0.6
	c0	stw 12[$r0.1] = $r0.7
	c0	stw 8[$r0.1] = $r0.8
	c0	stw 4[$r0.1] = $r0.9
	c0	mov $r0.11 = 16
	c0	ldw $r0.5 = 24[$r0.1]
	c0	ldw $r0.3 = 28[$r0.1]
	c0	ldw $r0.6 = 8[$r0.1]
	c0	mov $r0.4 = $r0.11
	c0	call $l0.0 = x264_pixel_sad_16x16
	c0	ldw $r0.58 = 4[$r0.1]
	c0	stw 0[$r0.58] = $r0.3
	c0	ldw $r0.6 = 8[$r0.1]
	c0	ldw $r0.5 = 20[$r0.1]
	c0	ldw $r0.3 = 28[$r0.1]
	c0	mov $r0.4 = $r0.11
	c0	call $l0.0 = x264_pixel_sad_16x16
	c0	ldw $r0.58 = 4[$r0.1]
	c0	stw 4[$r0.58] = $r0.3
	c0	ldw $r0.6 = 8[$r0.1]
	c0	ldw $r0.5 = 16[$r0.1]
	c0	ldw $r0.3 = 28[$r0.1]
	c0	mov $r0.4 = $r0.11
	c0	call $l0.0 = x264_pixel_sad_16x16
	c0	ldw $r0.58 = 4[$r0.1]
	c0	stw 8[$r0.58] = $r0.3
	c0	ldw $r0.6 = 8[$r0.1]
	c0	ldw $r0.5 = 12[$r0.1]
	c0	ldw $r0.3 = 28[$r0.1]
	c0	mov $r0.4 = $r0.11
	c0	call $l0.0 = x264_pixel_sad_16x16
	c0	ldw $r0.58 = 4[$r0.1]
	c0	stw 12[$r0.58] = $r0.3
	c0	ldw $r0.6 = 32[$r0.1]   ## 4-byte Folded Reload
	c0	ldw $r0.7 = 36[$r0.1]   ## 4-byte Folded Reload
	c0	ldw $r0.8 = 40[$r0.1]   ## 4-byte Folded Reload
	c0	ldw $r0.9 = 44[$r0.1]   ## 4-byte Folded Reload
	c0	ldw $r0.11 = 48[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $l0.0 = 52[$r0.1]   ## 4-byte Folded Reload
	c0	return $r0.1 = $r0.1, 56, $l0.0
$func_end2::
	.size	x264_pixel_sad_x4_16x16, ($func_end2)-x264_pixel_sad_x4_16x16

	.align	2
	.type	x264_pixel_sad_16x16,@function
x264_pixel_sad_16x16::                  ## @x264_pixel_sad_16x16
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -40
	c0	stw 36[$r0.1] = $l0.0   ## 4-byte Folded Spill
	c0	stw 32[$r0.1] = $r0.11  ## 4-byte Folded Spill
	c0	stw 28[$r0.1] = $r0.6   ## 4-byte Folded Spill
	c0	stw 24[$r0.1] = $r0.3
	c0	stw 20[$r0.1] = $r0.4
	c0	stw 16[$r0.1] = $r0.5
	c0	stw 12[$r0.1] = $r0.6
	c0	mov $r0.11 = 0
	c0	stw 8[$r0.1] = $r0.11
	c0	stw 0[$r0.1] = $r0.11
LBB3_1::                                ## %for.cond
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB3_3 Depth 2
	c0	ldw $r0.58 = 0[$r0.1]
	c0	cmpgt $b0.0 = $r0.58, 15
	c0	br $b0.0, LBB3_8
	c0	goto LBB3_2
LBB3_2::                                ## %for.body
                                        ##   in Loop: Header=BB3_1 Depth=1
	c0	stw 4[$r0.1] = $r0.11
LBB3_3::                                ## %for.cond1
                                        ##   Parent Loop BB3_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldw $r0.58 = 4[$r0.1]
	c0	cmpgt $b0.0 = $r0.58, 15
	c0	br $b0.0, LBB3_6
	c0	goto LBB3_4
LBB3_4::                                ## %for.body3
                                        ##   in Loop: Header=BB3_3 Depth=2
	c0	ldw $r0.58 = 16[$r0.1]
	c0	ldw $r0.59 = 24[$r0.1]
	c0	ldw $r0.60 = 4[$r0.1]
	c0	add $r0.58 = $r0.58, $r0.60
	c0	add $r0.59 = $r0.59, $r0.60
	c0	ldbu $r0.58 = 0[$r0.58]
	c0	ldbu $r0.59 = 0[$r0.59]
	c0	sub $r0.3 = $r0.59, $r0.58
	c0	call $l0.0 = abs
	c0	ldw $r0.58 = 8[$r0.1]
	c0	add $r0.58 = $r0.58, $r0.3
	c0	stw 8[$r0.1] = $r0.58
## BB#5:                                ## %for.inc
                                        ##   in Loop: Header=BB3_3 Depth=2
	c0	ldw $r0.58 = 4[$r0.1]
	c0	add $r0.58 = $r0.58, 1
	c0	stw 4[$r0.1] = $r0.58
	c0	goto LBB3_3
LBB3_6::                                ## %for.end
                                        ##   in Loop: Header=BB3_1 Depth=1
	c0	ldw $r0.58 = 24[$r0.1]
	c0	ldw $r0.59 = 20[$r0.1]
	c0	add $r0.58 = $r0.58, $r0.59
	c0	stw 24[$r0.1] = $r0.58
	c0	ldw $r0.58 = 16[$r0.1]
	c0	ldw $r0.59 = 12[$r0.1]
	c0	add $r0.58 = $r0.58, $r0.59
	c0	stw 16[$r0.1] = $r0.58
## BB#7:                                ## %for.inc7
                                        ##   in Loop: Header=BB3_1 Depth=1
	c0	ldw $r0.58 = 0[$r0.1]
	c0	add $r0.58 = $r0.58, 1
	c0	stw 0[$r0.1] = $r0.58
	c0	goto LBB3_1
LBB3_8::                                ## %for.end9
	c0	ldw $r0.3 = 8[$r0.1]
	c0	ldw $r0.6 = 28[$r0.1]   ## 4-byte Folded Reload
	c0	ldw $r0.11 = 32[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $l0.0 = 36[$r0.1]   ## 4-byte Folded Reload
	c0	return $r0.1 = $r0.1, 40, $l0.0
$func_end3::
	.size	x264_pixel_sad_16x16, ($func_end3)-x264_pixel_sad_16x16

	.type	fenc,@object            ## @fenc
.section .data
	.globl	fenc
	.align	1
fenc::
	.data1	0                       ## 0x0
	.data1	1                       ## 0x1
	.data1	2                       ## 0x2
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	0                       ## 0x0
	.data1	1                       ## 0x1
	.data1	2                       ## 0x2
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	0                       ## 0x0
	.data1	1                       ## 0x1
	.data1	2                       ## 0x2
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	0                       ## 0x0
	.data1	1                       ## 0x1
	.data1	2                       ## 0x2
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	0                       ## 0x0
	.data1	1                       ## 0x1
	.data1	2                       ## 0x2
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	0                       ## 0x0
	.data1	1                       ## 0x1
	.data1	2                       ## 0x2
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	0                       ## 0x0
	.data1	1                       ## 0x1
	.data1	2                       ## 0x2
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	0                       ## 0x0
	.data1	1                       ## 0x1
	.data1	2                       ## 0x2
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	0                       ## 0x0
	.data1	1                       ## 0x1
	.data1	2                       ## 0x2
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	0                       ## 0x0
	.data1	1                       ## 0x1
	.data1	2                       ## 0x2
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	0                       ## 0x0
	.data1	1                       ## 0x1
	.data1	2                       ## 0x2
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	0                       ## 0x0
	.data1	1                       ## 0x1
	.data1	2                       ## 0x2
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	0                       ## 0x0
	.data1	1                       ## 0x1
	.data1	2                       ## 0x2
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	0                       ## 0x0
	.data1	1                       ## 0x1
	.data1	2                       ## 0x2
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	0                       ## 0x0
	.data1	1                       ## 0x1
	.data1	2                       ## 0x2
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	0                       ## 0x0
	.data1	1                       ## 0x1
	.data1	2                       ## 0x2
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.size	fenc, 256

	.type	pix0,@object            ## @pix0
	.globl	pix0
	.align	1
pix0::
	.data1	0                       ## 0x0
	.data1	11                      ## 0xb
	.data1	22                      ## 0x16
	.data1	33                      ## 0x21
	.data1	44                      ## 0x2c
	.data1	55                      ## 0x37
	.data1	66                      ## 0x42
	.data1	77                      ## 0x4d
	.data1	88                      ## 0x58
	.data1	99                      ## 0x63
	.data1	10                      ## 0xa
	.data1	111                     ## 0x6f
	.data1	212                     ## 0xd4
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	10                      ## 0xa
	.data1	21                      ## 0x15
	.data1	32                      ## 0x20
	.data1	43                      ## 0x2b
	.data1	54                      ## 0x36
	.data1	65                      ## 0x41
	.data1	76                      ## 0x4c
	.data1	87                      ## 0x57
	.data1	98                      ## 0x62
	.data1	9                       ## 0x9
	.data1	110                     ## 0x6e
	.data1	211                     ## 0xd3
	.data1	112                     ## 0x70
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	20                      ## 0x14
	.data1	31                      ## 0x1f
	.data1	42                      ## 0x2a
	.data1	53                      ## 0x35
	.data1	64                      ## 0x40
	.data1	75                      ## 0x4b
	.data1	86                      ## 0x56
	.data1	97                      ## 0x61
	.data1	8                       ## 0x8
	.data1	19                      ## 0x13
	.data1	210                     ## 0xd2
	.data1	311                     ## 0x137
	.data1	212                     ## 0xd4
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	10                      ## 0xa
	.data1	21                      ## 0x15
	.data1	42                      ## 0x2a
	.data1	34                      ## 0x22
	.data1	44                      ## 0x2c
	.data1	55                      ## 0x37
	.data1	66                      ## 0x42
	.data1	77                      ## 0x4d
	.data1	88                      ## 0x58
	.data1	99                      ## 0x63
	.data1	110                     ## 0x6e
	.data1	211                     ## 0xd3
	.data1	142                     ## 0x8e
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	20                      ## 0x14
	.data1	41                      ## 0x29
	.data1	52                      ## 0x34
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	113                     ## 0x71
	.data1	149                     ## 0x95
	.data1	151                     ## 0x97
	.data1	30                      ## 0x1e
	.data1	61                      ## 0x3d
	.data1	62                      ## 0x3e
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	18                      ## 0x12
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	123                     ## 0x7b
	.data1	148                     ## 0x94
	.data1	152                     ## 0x98
	.data1	40                      ## 0x28
	.data1	71                      ## 0x47
	.data1	72                      ## 0x48
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	143                     ## 0x8f
	.data1	146                     ## 0x92
	.data1	153                     ## 0x99
	.data1	50                      ## 0x32
	.data1	81                      ## 0x51
	.data1	82                      ## 0x52
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	28                      ## 0x1c
	.data1	92                      ## 0x5c
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	135                     ## 0x87
	.data1	142                     ## 0x8e
	.data1	154                     ## 0x9a
	.data1	60                      ## 0x3c
	.data1	91                      ## 0x5b
	.data1	92                      ## 0x5c
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	137                     ## 0x89
	.data1	154                     ## 0x9a
	.data1	155                     ## 0x9b
	.data1	70                      ## 0x46
	.data1	1                       ## 0x1
	.data1	20                      ## 0x14
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	130                     ## 0x82
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	138                     ## 0x8a
	.data1	142                     ## 0x8e
	.data1	156                     ## 0x9c
	.data1	80                      ## 0x50
	.data1	21                      ## 0x15
	.data1	62                      ## 0x3e
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	28                      ## 0x1c
	.data1	9                       ## 0x9
	.data1	150                     ## 0x96
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	193                     ## 0xc1
	.data1	154                     ## 0x9a
	.data1	157                     ## 0x9d
	.data1	90                      ## 0x5a
	.data1	31                      ## 0x1f
	.data1	22                      ## 0x16
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	113                     ## 0x71
	.data1	174                     ## 0xae
	.data1	158                     ## 0x9e
	.data1	0                       ## 0x0
	.data1	41                      ## 0x29
	.data1	2                       ## 0x2
	.data1	43                      ## 0x2b
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	103                     ## 0x67
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	133                     ## 0x85
	.data1	146                     ## 0x92
	.data1	159                     ## 0x9f
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	2                       ## 0x2
	.data1	23                      ## 0x17
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	113                     ## 0x71
	.data1	144                     ## 0x90
	.data1	115                     ## 0x73
	.data1	20                      ## 0x14
	.data1	31                      ## 0x1f
	.data1	2                       ## 0x2
	.data1	33                      ## 0x21
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	18                      ## 0x12
	.data1	9                       ## 0x9
	.data1	101                     ## 0x65
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	123                     ## 0x7b
	.data1	142                     ## 0x8e
	.data1	152                     ## 0x98
	.data1	30                      ## 0x1e
	.data1	41                      ## 0x29
	.data1	2                       ## 0x2
	.data1	43                      ## 0x2b
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	98                      ## 0x62
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	133                     ## 0x85
	.data1	141                     ## 0x8d
	.data1	153                     ## 0x99
	.size	pix0, 256

	.type	pix1,@object            ## @pix1
	.globl	pix1
	.align	1
pix1::
	.data1	0                       ## 0x0
	.data1	11                      ## 0xb
	.data1	22                      ## 0x16
	.data1	33                      ## 0x21
	.data1	44                      ## 0x2c
	.data1	55                      ## 0x37
	.data1	66                      ## 0x42
	.data1	77                      ## 0x4d
	.data1	88                      ## 0x58
	.data1	99                      ## 0x63
	.data1	10                      ## 0xa
	.data1	111                     ## 0x6f
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	10                      ## 0xa
	.data1	21                      ## 0x15
	.data1	32                      ## 0x20
	.data1	43                      ## 0x2b
	.data1	54                      ## 0x36
	.data1	65                      ## 0x41
	.data1	76                      ## 0x4c
	.data1	87                      ## 0x57
	.data1	98                      ## 0x62
	.data1	9                       ## 0x9
	.data1	110                     ## 0x6e
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	20                      ## 0x14
	.data1	31                      ## 0x1f
	.data1	42                      ## 0x2a
	.data1	53                      ## 0x35
	.data1	64                      ## 0x40
	.data1	75                      ## 0x4b
	.data1	86                      ## 0x56
	.data1	97                      ## 0x61
	.data1	8                       ## 0x8
	.data1	19                      ## 0x13
	.data1	120                     ## 0x78
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	10                      ## 0xa
	.data1	21                      ## 0x15
	.data1	42                      ## 0x2a
	.data1	34                      ## 0x22
	.data1	44                      ## 0x2c
	.data1	55                      ## 0x37
	.data1	66                      ## 0x42
	.data1	77                      ## 0x4d
	.data1	88                      ## 0x58
	.data1	99                      ## 0x63
	.data1	110                     ## 0x6e
	.data1	11                      ## 0xb
	.data1	142                     ## 0x8e
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	60                      ## 0x3c
	.data1	91                      ## 0x5b
	.data1	92                      ## 0x5c
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	15                      ## 0xf
	.data1	115                     ## 0x73
	.data1	70                      ## 0x46
	.data1	1                       ## 0x1
	.data1	20                      ## 0x14
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	130                     ## 0x82
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	142                     ## 0x8e
	.data1	126                     ## 0x7e
	.data1	80                      ## 0x50
	.data1	21                      ## 0x15
	.data1	62                      ## 0x3e
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	28                      ## 0x1c
	.data1	9                       ## 0x9
	.data1	150                     ## 0x96
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	193                     ## 0xc1
	.data1	154                     ## 0x9a
	.data1	117                     ## 0x75
	.data1	20                      ## 0x14
	.data1	41                      ## 0x29
	.data1	52                      ## 0x34
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	113                     ## 0x71
	.data1	149                     ## 0x95
	.data1	121                     ## 0x79
	.data1	30                      ## 0x1e
	.data1	61                      ## 0x3d
	.data1	62                      ## 0x3e
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	18                      ## 0x12
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	123                     ## 0x7b
	.data1	148                     ## 0x94
	.data1	92                      ## 0x5c
	.data1	40                      ## 0x28
	.data1	71                      ## 0x47
	.data1	72                      ## 0x48
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	0                       ## 0x0
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	123                     ## 0x7b
	.data1	146                     ## 0x92
	.data1	13                      ## 0xd
	.data1	50                      ## 0x32
	.data1	81                      ## 0x51
	.data1	82                      ## 0x52
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	2                       ## 0x2
	.data1	92                      ## 0x5c
	.data1	10                      ## 0xa
	.data1	1                       ## 0x1
	.data1	12                      ## 0xc
	.data1	125                     ## 0x7d
	.data1	142                     ## 0x8e
	.data1	14                      ## 0xe
	.data1	90                      ## 0x5a
	.data1	31                      ## 0x1f
	.data1	22                      ## 0x16
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	174                     ## 0xae
	.data1	18                      ## 0x12
	.data1	0                       ## 0x0
	.data1	41                      ## 0x29
	.data1	2                       ## 0x2
	.data1	43                      ## 0x2b
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	103                     ## 0x67
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	123                     ## 0x7b
	.data1	146                     ## 0x92
	.data1	19                      ## 0x13
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	2                       ## 0x2
	.data1	23                      ## 0x17
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	113                     ## 0x71
	.data1	14                      ## 0xe
	.data1	11                      ## 0xb
	.data1	20                      ## 0x14
	.data1	31                      ## 0x1f
	.data1	2                       ## 0x2
	.data1	33                      ## 0x21
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	101                     ## 0x65
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	12                      ## 0xc
	.data1	12                      ## 0xc
	.data1	30                      ## 0x1e
	.data1	41                      ## 0x29
	.data1	2                       ## 0x2
	.data1	43                      ## 0x2b
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	92                      ## 0x5c
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	11                      ## 0xb
	.data1	13                      ## 0xd
	.size	pix1, 256

	.type	pix2,@object            ## @pix2
	.globl	pix2
	.align	1
pix2::
	.data1	0                       ## 0x0
	.data1	11                      ## 0xb
	.data1	22                      ## 0x16
	.data1	33                      ## 0x21
	.data1	44                      ## 0x2c
	.data1	55                      ## 0x37
	.data1	66                      ## 0x42
	.data1	77                      ## 0x4d
	.data1	88                      ## 0x58
	.data1	99                      ## 0x63
	.data1	10                      ## 0xa
	.data1	111                     ## 0x6f
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	10                      ## 0xa
	.data1	21                      ## 0x15
	.data1	32                      ## 0x20
	.data1	43                      ## 0x2b
	.data1	54                      ## 0x36
	.data1	65                      ## 0x41
	.data1	76                      ## 0x4c
	.data1	87                      ## 0x57
	.data1	98                      ## 0x62
	.data1	9                       ## 0x9
	.data1	110                     ## 0x6e
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	20                      ## 0x14
	.data1	31                      ## 0x1f
	.data1	42                      ## 0x2a
	.data1	53                      ## 0x35
	.data1	64                      ## 0x40
	.data1	75                      ## 0x4b
	.data1	86                      ## 0x56
	.data1	97                      ## 0x61
	.data1	8                       ## 0x8
	.data1	19                      ## 0x13
	.data1	120                     ## 0x78
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	10                      ## 0xa
	.data1	21                      ## 0x15
	.data1	42                      ## 0x2a
	.data1	34                      ## 0x22
	.data1	44                      ## 0x2c
	.data1	55                      ## 0x37
	.data1	66                      ## 0x42
	.data1	77                      ## 0x4d
	.data1	88                      ## 0x58
	.data1	99                      ## 0x63
	.data1	110                     ## 0x6e
	.data1	11                      ## 0xb
	.data1	142                     ## 0x8e
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	60                      ## 0x3c
	.data1	91                      ## 0x5b
	.data1	92                      ## 0x5c
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	114                     ## 0x72
	.data1	122                     ## 0x7a
	.data1	13                      ## 0xd
	.data1	15                      ## 0xf
	.data1	115                     ## 0x73
	.data1	70                      ## 0x46
	.data1	1                       ## 0x1
	.data1	20                      ## 0x14
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	130                     ## 0x82
	.data1	113                     ## 0x71
	.data1	121                     ## 0x79
	.data1	13                      ## 0xd
	.data1	142                     ## 0x8e
	.data1	126                     ## 0x7e
	.data1	80                      ## 0x50
	.data1	21                      ## 0x15
	.data1	62                      ## 0x3e
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	28                      ## 0x1c
	.data1	9                       ## 0x9
	.data1	150                     ## 0x96
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	193                     ## 0xc1
	.data1	154                     ## 0x9a
	.data1	117                     ## 0x75
	.data1	20                      ## 0x14
	.data1	41                      ## 0x29
	.data1	52                      ## 0x34
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	113                     ## 0x71
	.data1	149                     ## 0x95
	.data1	121                     ## 0x79
	.data1	30                      ## 0x1e
	.data1	61                      ## 0x3d
	.data1	62                      ## 0x3e
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	18                      ## 0x12
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	123                     ## 0x7b
	.data1	168                     ## 0xa8
	.data1	92                      ## 0x5c
	.data1	40                      ## 0x28
	.data1	71                      ## 0x47
	.data1	72                      ## 0x48
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	0                       ## 0x0
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	126                     ## 0x7e
	.data1	123                     ## 0x7b
	.data1	149                     ## 0x95
	.data1	13                      ## 0xd
	.data1	50                      ## 0x32
	.data1	81                      ## 0x51
	.data1	82                      ## 0x52
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	2                       ## 0x2
	.data1	92                      ## 0x5c
	.data1	10                      ## 0xa
	.data1	1                       ## 0x1
	.data1	127                     ## 0x7f
	.data1	125                     ## 0x7d
	.data1	142                     ## 0x8e
	.data1	14                      ## 0xe
	.data1	90                      ## 0x5a
	.data1	31                      ## 0x1f
	.data1	22                      ## 0x16
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	129                     ## 0x81
	.data1	13                      ## 0xd
	.data1	194                     ## 0xc2
	.data1	18                      ## 0x12
	.data1	0                       ## 0x0
	.data1	41                      ## 0x29
	.data1	2                       ## 0x2
	.data1	43                      ## 0x2b
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	103                     ## 0x67
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	193                     ## 0xc1
	.data1	196                     ## 0xc4
	.data1	19                      ## 0x13
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	2                       ## 0x2
	.data1	23                      ## 0x17
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	113                     ## 0x71
	.data1	14                      ## 0xe
	.data1	11                      ## 0xb
	.data1	20                      ## 0x14
	.data1	31                      ## 0x1f
	.data1	2                       ## 0x2
	.data1	33                      ## 0x21
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	101                     ## 0x65
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	12                      ## 0xc
	.data1	12                      ## 0xc
	.data1	30                      ## 0x1e
	.data1	41                      ## 0x29
	.data1	2                       ## 0x2
	.data1	43                      ## 0x2b
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	92                      ## 0x5c
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	11                      ## 0xb
	.data1	13                      ## 0xd
	.size	pix2, 256

	.type	pix3,@object            ## @pix3
	.globl	pix3
	.align	1
pix3::
	.data1	0                       ## 0x0
	.data1	11                      ## 0xb
	.data1	22                      ## 0x16
	.data1	33                      ## 0x21
	.data1	44                      ## 0x2c
	.data1	55                      ## 0x37
	.data1	66                      ## 0x42
	.data1	77                      ## 0x4d
	.data1	88                      ## 0x58
	.data1	99                      ## 0x63
	.data1	10                      ## 0xa
	.data1	111                     ## 0x6f
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	10                      ## 0xa
	.data1	21                      ## 0x15
	.data1	32                      ## 0x20
	.data1	43                      ## 0x2b
	.data1	54                      ## 0x36
	.data1	65                      ## 0x41
	.data1	76                      ## 0x4c
	.data1	87                      ## 0x57
	.data1	98                      ## 0x62
	.data1	9                       ## 0x9
	.data1	110                     ## 0x6e
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	20                      ## 0x14
	.data1	31                      ## 0x1f
	.data1	42                      ## 0x2a
	.data1	53                      ## 0x35
	.data1	64                      ## 0x40
	.data1	75                      ## 0x4b
	.data1	86                      ## 0x56
	.data1	97                      ## 0x61
	.data1	8                       ## 0x8
	.data1	19                      ## 0x13
	.data1	120                     ## 0x78
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	10                      ## 0xa
	.data1	21                      ## 0x15
	.data1	42                      ## 0x2a
	.data1	34                      ## 0x22
	.data1	44                      ## 0x2c
	.data1	55                      ## 0x37
	.data1	66                      ## 0x42
	.data1	77                      ## 0x4d
	.data1	88                      ## 0x58
	.data1	99                      ## 0x63
	.data1	110                     ## 0x6e
	.data1	11                      ## 0xb
	.data1	142                     ## 0x8e
	.data1	13                      ## 0xd
	.data1	14                      ## 0xe
	.data1	15                      ## 0xf
	.data1	60                      ## 0x3c
	.data1	91                      ## 0x5b
	.data1	92                      ## 0x5c
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	114                     ## 0x72
	.data1	122                     ## 0x7a
	.data1	13                      ## 0xd
	.data1	15                      ## 0xf
	.data1	115                     ## 0x73
	.data1	70                      ## 0x46
	.data1	1                       ## 0x1
	.data1	20                      ## 0x14
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	130                     ## 0x82
	.data1	113                     ## 0x71
	.data1	121                     ## 0x79
	.data1	13                      ## 0xd
	.data1	142                     ## 0x8e
	.data1	126                     ## 0x7e
	.data1	80                      ## 0x50
	.data1	21                      ## 0x15
	.data1	62                      ## 0x3e
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	28                      ## 0x1c
	.data1	9                       ## 0x9
	.data1	150                     ## 0x96
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	193                     ## 0xc1
	.data1	154                     ## 0x9a
	.data1	117                     ## 0x75
	.data1	20                      ## 0x14
	.data1	41                      ## 0x29
	.data1	52                      ## 0x34
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	84                      ## 0x54
	.data1	95                      ## 0x5f
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	113                     ## 0x71
	.data1	149                     ## 0x95
	.data1	121                     ## 0x79
	.data1	30                      ## 0x1e
	.data1	61                      ## 0x3d
	.data1	62                      ## 0x3e
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	183                     ## 0xb7
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	123                     ## 0x7b
	.data1	168                     ## 0xa8
	.data1	92                      ## 0x5c
	.data1	40                      ## 0x28
	.data1	71                      ## 0x47
	.data1	72                      ## 0x48
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	0                       ## 0x0
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	126                     ## 0x7e
	.data1	123                     ## 0x7b
	.data1	149                     ## 0x95
	.data1	13                      ## 0xd
	.data1	50                      ## 0x32
	.data1	81                      ## 0x51
	.data1	82                      ## 0x52
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	2                       ## 0x2
	.data1	92                      ## 0x5c
	.data1	10                      ## 0xa
	.data1	1                       ## 0x1
	.data1	127                     ## 0x7f
	.data1	125                     ## 0x7d
	.data1	142                     ## 0x8e
	.data1	14                      ## 0xe
	.data1	90                      ## 0x5a
	.data1	31                      ## 0x1f
	.data1	22                      ## 0x16
	.data1	3                       ## 0x3
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	92                      ## 0x5c
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	129                     ## 0x81
	.data1	13                      ## 0xd
	.data1	194                     ## 0xc2
	.data1	18                      ## 0x12
	.data1	0                       ## 0x0
	.data1	41                      ## 0x29
	.data1	2                       ## 0x2
	.data1	43                      ## 0x2b
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	91                      ## 0x5b
	.data1	103                     ## 0x67
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	193                     ## 0xc1
	.data1	196                     ## 0xc4
	.data1	19                      ## 0x13
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	2                       ## 0x2
	.data1	23                      ## 0x17
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	113                     ## 0x71
	.data1	14                      ## 0xe
	.data1	11                      ## 0xb
	.data1	20                      ## 0x14
	.data1	31                      ## 0x1f
	.data1	2                       ## 0x2
	.data1	33                      ## 0x21
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	8                       ## 0x8
	.data1	9                       ## 0x9
	.data1	101                     ## 0x65
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	12                      ## 0xc
	.data1	12                      ## 0xc
	.data1	30                      ## 0x1e
	.data1	41                      ## 0x29
	.data1	2                       ## 0x2
	.data1	43                      ## 0x2b
	.data1	4                       ## 0x4
	.data1	5                       ## 0x5
	.data1	6                       ## 0x6
	.data1	7                       ## 0x7
	.data1	92                      ## 0x5c
	.data1	9                       ## 0x9
	.data1	10                      ## 0xa
	.data1	11                      ## 0xb
	.data1	12                      ## 0xc
	.data1	13                      ## 0xd
	.data1	11                      ## 0xb
	.data1	13                      ## 0xd
	.size	pix3, 256

	.type	scores_temp,@object     ## @scores_temp
	.globl	scores_temp
	.align	2
scores_temp::
	.data4	10370                   ## 0x2882
	.data4	7067                    ## 0x1b9b
	.data4	8000                    ## 0x1f40
	.data4	849                     ## 0x351
	.size	scores_temp, 16

	.type	scores,@object          ## @scores
	.bss
	.globl	scores
	.align	2
scores::
	.zero	16
	.size	scores, 16


