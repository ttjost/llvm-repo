	.text
	.file	"cjpegO3.ll"
	.globl	jpeg_fdct_islow
	.align	2
	.type	jpeg_fdct_islow,@function
jpeg_fdct_islow::                       ## @jpeg_fdct_islow
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -80
	c0	stw 76[$r0.1] = $r0.30  ## 4-byte Folded Spill
	c0	stw 72[$r0.1] = $r0.29  ## 4-byte Folded Spill
	c0	stw 68[$r0.1] = $r0.28  ## 4-byte Folded Spill
	c0	stw 64[$r0.1] = $r0.27  ## 4-byte Folded Spill
	c0	stw 60[$r0.1] = $r0.26  ## 4-byte Folded Spill
	c0	stw 56[$r0.1] = $r0.25  ## 4-byte Folded Spill
	c0	stw 52[$r0.1] = $r0.24  ## 4-byte Folded Spill
	c0	stw 48[$r0.1] = $r0.23  ## 4-byte Folded Spill
	c0	stw 44[$r0.1] = $r0.22  ## 4-byte Folded Spill
	c0	stw 40[$r0.1] = $r0.21  ## 4-byte Folded Spill
	c0	stw 36[$r0.1] = $r0.20  ## 4-byte Folded Spill
	c0	stw 32[$r0.1] = $r0.19  ## 4-byte Folded Spill
	c0	stw 28[$r0.1] = $r0.18  ## 4-byte Folded Spill
	c0	stw 24[$r0.1] = $r0.17  ## 4-byte Folded Spill
	c0	stw 20[$r0.1] = $r0.16  ## 4-byte Folded Spill
	c0	stw 16[$r0.1] = $r0.15  ## 4-byte Folded Spill
	c0	stw 12[$r0.1] = $r0.14  ## 4-byte Folded Spill
	c0	stw 8[$r0.1] = $r0.13   ## 4-byte Folded Spill
	c0	stw 4[$r0.1] = $r0.12   ## 4-byte Folded Spill
	c0	stw 0[$r0.1] = $r0.11   ## 4-byte Folded Spill
	c0	mov $r0.60 = $r0.3
	c0	mov $r0.58 = 8
	c0	mov $r0.59 = 1
	c0	mov $r0.61 = 12
	c0	mov $r0.62 = $r0.58
	c0	mov $r0.63 = $r0.60
LBB0_1::                                ## %for.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.11 = 16[$r0.63]
	c0	ldw $r0.12 = 12[$r0.63]
	c0	add $r0.13 = $r0.11, $r0.12
	c0	ldw $r0.14 = 24[$r0.63]
	c0	sub $r0.11 = $r0.12, $r0.11
	c0	ldw $r0.12 = 4[$r0.63]
	c0	mpylu $r0.15 = $r0.11, 2446
	c0	add $r0.16 = $r0.14, $r0.12
	c0	ldw $r0.17 = 8[$r0.63]
	c0	sub $r0.12 = $r0.12, $r0.14
	c0	mpyhs $r0.14 = $r0.11, 2446
	c0	ldw $r0.18 = 20[$r0.63]
	c0	add $r0.19 = $r0.11, $r0.12
	c0	add $r0.14 = $r0.15, $r0.14
	c0	mpyhs $r0.15 = $r0.12, 25172
	c0	add $r0.20 = $r0.18, $r0.17
	c0	ldw $r0.21 = 28[$r0.63]
	c0	sub $r0.17 = $r0.17, $r0.18
	c0	mpylu $r0.18 = $r0.19, -16069
	c0	ldw $r0.22 = 0[$r0.63]
	c0	sub $r0.23 = $r0.16, $r0.20
	c0	add $r0.16 = $r0.20, $r0.16
	c0	add $r0.20 = $r0.17, $r0.12
	c0	add $r0.24 = $r0.21, $r0.22
	c0	sub $r0.21 = $r0.22, $r0.21
	c0	mpylu $r0.22 = $r0.23, -15137
	c0	sub $r0.25 = $r0.24, $r0.13
	c0	add $r0.26 = $r0.17, $r0.21
	c0	add $r0.11 = $r0.11, $r0.21
	c0	add $r0.13 = $r0.13, $r0.24
	c0	add $r0.24 = $r0.25, $r0.23
	c0	add $r0.27 = $r0.19, $r0.26
	c0	add $r0.28 = $r0.13, $r0.16
	c0	mpyhs $r0.29 = $r0.25, 6270
	c0	mpylu $r0.30 = $r0.24, 4433
	c0	shl $r0.28 = $r0.28, $r0.59
	c0	sub $r0.13 = $r0.13, $r0.16
	c0	stw 0[$r0.63] = $r0.28
	c0	mpyhs $r0.16 = $r0.24, 4433
	c0	shl $r0.13 = $r0.13, $r0.59
	c0	stw 16[$r0.63] = $r0.13
	c0	add $r0.13 = $r0.30, $r0.16
	c0	mpylu $r0.16 = $r0.25, 6270
	c0	add $r0.16 = $r0.16, $r0.29
	c0	mpyhs $r0.19 = $r0.19, -16069
	c0	add $r0.16 = $r0.16, $r0.13
	c0	add $r0.18 = $r0.18, $r0.19
	c0	mpyhs $r0.19 = $r0.23, -15137
	c0	add $r0.19 = $r0.22, $r0.19
	c0	mpylu $r0.22 = $r0.11, -7373
	c0	add $r0.16 = $r0.16, 2048
	c0	add $r0.13 = $r0.19, $r0.13
	c0	mpyhs $r0.11 = $r0.11, -7373
	c0	shr $r0.16 = $r0.16, $r0.61
	c0	stw 8[$r0.63] = $r0.16
	c0	add $r0.11 = $r0.22, $r0.11
	c0	mpylu $r0.16 = $r0.27, 9633
	c0	add $r0.13 = $r0.13, 2048
	c0	mpyhs $r0.19 = $r0.27, 9633
	c0	add $r0.14 = $r0.14, $r0.11
	c0	shr $r0.13 = $r0.13, $r0.61
	c0	add $r0.16 = $r0.16, $r0.19
	c0	mpyhs $r0.19 = $r0.17, 16819
	c0	stw 24[$r0.63] = $r0.13
	c0	add $r0.13 = $r0.16, $r0.18
	c0	mpyhs $r0.18 = $r0.20, -20995
	c0	add $r0.14 = $r0.14, $r0.13
	c0	mpylu $r0.20 = $r0.20, -20995
	c0	add $r0.18 = $r0.20, $r0.18
	c0	mpylu $r0.20 = $r0.26, -3196
	c0	add $r0.14 = $r0.14, 2048
	c0	mpyhs $r0.22 = $r0.26, -3196
	c0	shr $r0.14 = $r0.14, $r0.61
	c0	add $r0.20 = $r0.20, $r0.22
	c0	mpylu $r0.17 = $r0.17, 16819
	c0	stw 28[$r0.63] = $r0.14
	c0	add $r0.14 = $r0.17, $r0.19
	c0	add $r0.16 = $r0.16, $r0.20
	c0	mpylu $r0.12 = $r0.12, 25172
	c0	add $r0.14 = $r0.14, $r0.18
	c0	add $r0.12 = $r0.12, $r0.15
	c0	mpylu $r0.15 = $r0.21, 12299
	c0	add $r0.12 = $r0.12, $r0.18
	c0	add $r0.14 = $r0.14, $r0.16
	c0	mpyhs $r0.17 = $r0.21, 12299
	c0	add $r0.15 = $r0.15, $r0.17
	c0	add $r0.12 = $r0.12, $r0.13
	c0	add $r0.13 = $r0.14, 2048
	c0	add $r0.14 = $r0.63, 32
	c0	add $r0.11 = $r0.15, $r0.11
	c0	shr $r0.13 = $r0.13, $r0.61
	c0	add $r0.12 = $r0.12, 2048
	c0	stw 20[$r0.63] = $r0.13
	c0	add $r0.11 = $r0.11, $r0.16
	c0	shr $r0.12 = $r0.12, $r0.61
	c0	stw 12[$r0.63] = $r0.12
	c0	add $r0.11 = $r0.11, 2048
	c0	add $r0.62 = $r0.62, -1
	c0	shr $r0.11 = $r0.11, $r0.61
	c0	stw 4[$r0.63] = $r0.11
	c0	cmpgt $b0.0 = $r0.62, 0
	c0	mov $r0.63 = $r0.14
	c0	br $b0.0, LBB0_1
	c0	goto LBB0_2
LBB0_2::                                ## %for.body79
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.61 = 128[$r0.60]
	c0	mov $r0.62 = 14
	c0	ldw $r0.63 = 96[$r0.60]
	c0	add $r0.11 = $r0.61, $r0.63
	c0	ldw $r0.12 = 192[$r0.60]
	c0	sub $r0.61 = $r0.63, $r0.61
	c0	ldw $r0.63 = 32[$r0.60]
	c0	mpylu $r0.13 = $r0.61, 2446
	c0	add $r0.14 = $r0.12, $r0.63
	c0	ldw $r0.15 = 64[$r0.60]
	c0	sub $r0.63 = $r0.63, $r0.12
	c0	mpyhs $r0.12 = $r0.61, 2446
	c0	ldw $r0.16 = 160[$r0.60]
	c0	add $r0.17 = $r0.61, $r0.63
	c0	add $r0.12 = $r0.13, $r0.12
	c0	mpyhs $r0.13 = $r0.63, 25172
	c0	add $r0.18 = $r0.16, $r0.15
	c0	ldw $r0.19 = 224[$r0.60]
	c0	sub $r0.15 = $r0.15, $r0.16
	c0	mpylu $r0.16 = $r0.17, -16069
	c0	ldw $r0.20 = 0[$r0.60]
	c0	sub $r0.21 = $r0.14, $r0.18
	c0	add $r0.14 = $r0.18, $r0.14
	c0	add $r0.18 = $r0.15, $r0.63
	c0	add $r0.22 = $r0.19, $r0.20
	c0	sub $r0.19 = $r0.20, $r0.19
	c0	sub $r0.20 = $r0.59, $r0.14
	c0	mpylu $r0.23 = $r0.21, -15137
	c0	sub $r0.24 = $r0.22, $r0.11
	c0	add $r0.11 = $r0.11, $r0.22
	c0	add $r0.22 = $r0.15, $r0.19
	c0	add $r0.61 = $r0.61, $r0.19
	c0	add $r0.25 = $r0.24, $r0.21
	c0	add $r0.14 = $r0.14, $r0.11
	c0	add $r0.26 = $r0.17, $r0.22
	c0	mpyhs $r0.27 = $r0.24, 6270
	c0	mpylu $r0.28 = $r0.25, 4433
	c0	add $r0.11 = $r0.20, $r0.11
	c0	add $r0.14 = $r0.14, 1
	c0	mpyhs $r0.20 = $r0.25, 4433
	c0	shr $r0.14 = $r0.14, $r0.59
	c0	shr $r0.11 = $r0.11, $r0.59
	c0	stw 0[$r0.60] = $r0.14
	c0	add $r0.14 = $r0.28, $r0.20
	c0	mpylu $r0.20 = $r0.24, 6270
	c0	add $r0.20 = $r0.20, $r0.27
	c0	mpylu $r0.24 = $r0.26, 9633
	c0	stw 128[$r0.60] = $r0.11
	c0	add $r0.11 = $r0.20, $r0.14
	c0	mpyhs $r0.17 = $r0.17, -16069
	c0	add $r0.16 = $r0.16, $r0.17
	c0	mpyhs $r0.17 = $r0.61, -7373
	c0	add $r0.11 = $r0.11, 8192
	c0	shr $r0.11 = $r0.11, $r0.62
	c0	mpylu $r0.61 = $r0.61, -7373
	c0	stw 64[$r0.60] = $r0.11
	c0	add $r0.61 = $r0.61, $r0.17
	c0	mpyhs $r0.11 = $r0.26, 9633
	c0	add $r0.12 = $r0.12, $r0.61
	c0	add $r0.11 = $r0.24, $r0.11
	c0	mpyhs $r0.17 = $r0.21, -15137
	c0	add $r0.17 = $r0.23, $r0.17
	c0	mpyhs $r0.20 = $r0.15, 16819
	c0	add $r0.16 = $r0.11, $r0.16
	c0	add $r0.14 = $r0.17, $r0.14
	c0	mpylu $r0.17 = $r0.18, -20995
	c0	add $r0.12 = $r0.12, $r0.16
	c0	mpyhs $r0.18 = $r0.18, -20995
	c0	add $r0.14 = $r0.14, 8192
	c0	add $r0.12 = $r0.12, 8192
	c0	shr $r0.14 = $r0.14, $r0.62
	c0	add $r0.17 = $r0.17, $r0.18
	c0	mpylu $r0.18 = $r0.22, -3196
	c0	shr $r0.12 = $r0.12, $r0.62
	c0	mpyhs $r0.21 = $r0.22, -3196
	c0	stw 192[$r0.60] = $r0.14
	c0	add $r0.14 = $r0.18, $r0.21
	c0	mpylu $r0.15 = $r0.15, 16819
	c0	stw 224[$r0.60] = $r0.12
	c0	add $r0.12 = $r0.15, $r0.20
	c0	mpylu $r0.63 = $r0.63, 25172
	c0	add $r0.11 = $r0.11, $r0.14
	c0	add $r0.63 = $r0.63, $r0.13
	c0	add $r0.12 = $r0.12, $r0.17
	c0	mpylu $r0.13 = $r0.19, 12299
	c0	add $r0.12 = $r0.12, $r0.11
	c0	add $r0.63 = $r0.63, $r0.17
	c0	mpyhs $r0.14 = $r0.19, 12299
	c0	add $r0.13 = $r0.13, $r0.14
	c0	add $r0.63 = $r0.63, $r0.16
	c0	add $r0.12 = $r0.12, 8192
	c0	add $r0.14 = $r0.60, 4
	c0	add $r0.61 = $r0.13, $r0.61
	c0	shr $r0.12 = $r0.12, $r0.62
	c0	add $r0.63 = $r0.63, 8192
	c0	stw 160[$r0.60] = $r0.12
	c0	add $r0.61 = $r0.61, $r0.11
	c0	shr $r0.63 = $r0.63, $r0.62
	c0	stw 96[$r0.60] = $r0.63
	c0	add $r0.61 = $r0.61, 8192
	c0	add $r0.58 = $r0.58, -1
	c0	shr $r0.61 = $r0.61, $r0.62
	c0	stw 32[$r0.60] = $r0.61
	c0	cmpgt $b0.0 = $r0.58, 0
	c0	mov $r0.60 = $r0.14
	c0	br $b0.0, LBB0_2
	c0	goto LBB0_3
LBB0_3::                                ## %for.end166
	c0	ldw $r0.11 = 0[$r0.1]   ## 4-byte Folded Reload
	c0	ldw $r0.12 = 4[$r0.1]   ## 4-byte Folded Reload
	c0	ldw $r0.13 = 8[$r0.1]   ## 4-byte Folded Reload
	c0	ldw $r0.14 = 12[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.15 = 16[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.16 = 20[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.17 = 24[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.18 = 28[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.19 = 32[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.20 = 36[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.21 = 40[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.22 = 44[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.23 = 48[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.24 = 52[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.25 = 56[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.26 = 60[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.27 = 64[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.28 = 68[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.29 = 72[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.30 = 76[$r0.1]  ## 4-byte Folded Reload
	c0	return $r0.1 = $r0.1, 80, $l0.0
$func_end0::
	.size	jpeg_fdct_islow, ($func_end0)-jpeg_fdct_islow

	.globl	main
	.align	2
	.type	main,@function
main::                                  ## @main
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -56
	c0	stw 52[$r0.1] = $l0.0   ## 4-byte Folded Spill
	c0	stw 48[$r0.1] = $r0.23  ## 4-byte Folded Spill
	c0	stw 44[$r0.1] = $r0.22  ## 4-byte Folded Spill
	c0	stw 40[$r0.1] = $r0.21  ## 4-byte Folded Spill
	c0	stw 36[$r0.1] = $r0.20  ## 4-byte Folded Spill
	c0	stw 32[$r0.1] = $r0.19  ## 4-byte Folded Spill
	c0	stw 28[$r0.1] = $r0.18  ## 4-byte Folded Spill
	c0	stw 24[$r0.1] = $r0.17  ## 4-byte Folded Spill
	c0	stw 20[$r0.1] = $r0.16  ## 4-byte Folded Spill
	c0	stw 16[$r0.1] = $r0.15  ## 4-byte Folded Spill
	c0	stw 12[$r0.1] = $r0.14  ## 4-byte Folded Spill
	c0	stw 8[$r0.1] = $r0.13   ## 4-byte Folded Spill
	c0	stw 4[$r0.1] = $r0.12   ## 4-byte Folded Spill
	c0	stw 0[$r0.1] = $r0.11   ## 4-byte Folded Spill
	c0	mov $r0.11 = i
	c0	mov $r0.12 = 0
	c0	stw 0[$r0.11] = $r0.12
	c0	mov $r0.13 = data
	c0	mov $r0.58 = data_ref
	c0	add $r0.14 = $r0.13, 16
	c0	add $r0.15 = $r0.58, 16
	c0	mov $r0.16 = 1
	c0	mov $r0.17 = 2
	c0	mov $r0.18 = 3
	c0	mov $r0.20 = 4
	c0	mov $r0.21 = 5
	c0	mov $r0.22 = 6
	c0	mov $r0.23 = 7
	c0	mov $r0.19 = -1
LBB1_1::                                ## %for.body
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_2 Depth 2
	c0	mov $r0.3 = $r0.13
	c0	call $l0.0 = jpeg_fdct_islow
	c0	ldw $r0.58 = 0[$r0.11]
	c0	cmpne $b0.0 = $r0.58, 0
	c0	mov $r0.60 = $r0.14
	c0	mov $r0.61 = $r0.15
	c0	mov $r0.59 = $r0.12
	c0	br $b0.0, LBB1_5
	c0	goto LBB1_2
LBB1_2::                                ## %for.cond5.preheader
                                        ##   Parent Loop BB1_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldw $r0.62 = -16[$r0.60]
	c0	ldw $r0.63 = -16[$r0.61]
	c0	cmpeq $b0.0 = $r0.62, $r0.63
	c0	mov $r0.62 = $r0.12
	c0	br $b0.0, LBB1_4
	c0	goto LBB1_3
LBB1_4::                                ## %for.inc
                                        ##   in Loop: Header=BB1_2 Depth=2
	c0	ldw $r0.62 = -12[$r0.60]
	c0	ldw $r0.63 = -12[$r0.61]
	c0	cmpeq $b0.0 = $r0.62, $r0.63
	c0	mov $r0.62 = $r0.16
	c0	br $b0.0, LBB1_7
	c0	goto LBB1_3
LBB1_7::                                ## %for.inc.1
                                        ##   in Loop: Header=BB1_2 Depth=2
	c0	ldw $r0.62 = -8[$r0.60]
	c0	ldw $r0.63 = -8[$r0.61]
	c0	cmpne $b0.0 = $r0.62, $r0.63
	c0	mov $r0.62 = $r0.17
	c0	br $b0.0, LBB1_3
	c0	goto LBB1_8
LBB1_8::                                ## %for.inc.2
                                        ##   in Loop: Header=BB1_2 Depth=2
	c0	ldw $r0.62 = -4[$r0.60]
	c0	ldw $r0.63 = -4[$r0.61]
	c0	cmpne $b0.0 = $r0.62, $r0.63
	c0	mov $r0.62 = $r0.18
	c0	br $b0.0, LBB1_3
	c0	goto LBB1_9
LBB1_9::                                ## %for.inc.3
                                        ##   in Loop: Header=BB1_2 Depth=2
	c0	ldw $r0.62 = 0[$r0.60]
	c0	ldw $r0.63 = 0[$r0.61]
	c0	cmpne $b0.0 = $r0.62, $r0.63
	c0	mov $r0.62 = $r0.20
	c0	br $b0.0, LBB1_3
	c0	goto LBB1_10
LBB1_10::                               ## %for.inc.4
                                        ##   in Loop: Header=BB1_2 Depth=2
	c0	ldw $r0.62 = 4[$r0.60]
	c0	ldw $r0.63 = 4[$r0.61]
	c0	cmpne $b0.0 = $r0.62, $r0.63
	c0	mov $r0.62 = $r0.21
	c0	br $b0.0, LBB1_3
	c0	goto LBB1_11
LBB1_11::                               ## %for.inc.5
                                        ##   in Loop: Header=BB1_2 Depth=2
	c0	ldw $r0.62 = 8[$r0.60]
	c0	ldw $r0.63 = 8[$r0.61]
	c0	cmpne $b0.0 = $r0.62, $r0.63
	c0	mov $r0.62 = $r0.22
	c0	br $b0.0, LBB1_3
	c0	goto LBB1_12
LBB1_12::                               ## %for.inc.6
                                        ##   in Loop: Header=BB1_2 Depth=2
	c0	ldw $r0.62 = 12[$r0.60]
	c0	ldw $r0.63 = 12[$r0.61]
	c0	cmpne $b0.0 = $r0.62, $r0.63
	c0	mov $r0.62 = $r0.23
	c0	br $b0.0, LBB1_3
	c0	goto LBB1_13
LBB1_13::                               ## %for.inc.7
                                        ##   in Loop: Header=BB1_2 Depth=2
	c0	add $r0.59 = $r0.59, 1
	c0	add $r0.60 = $r0.60, 32
	c0	add $r0.61 = $r0.61, 32
	c0	cmplt $b0.0 = $r0.59, 8
	c0	br $b0.0, LBB1_2
	c0	goto LBB1_5
LBB1_5::                                ## %for.inc17
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	add $r0.58 = $r0.58, 1
	c0	stw 0[$r0.11] = $r0.58
	c0	cmplt $b0.0 = $r0.58, 1000
	c0	br $b0.0, LBB1_1
	c0	goto LBB1_6
LBB1_3::                                ## %if.then12
	c0	add $r0.19 = $r0.62, $r0.59
	c0	goto LBB1_6
LBB1_6::                                ## %return
	c0	mov $r0.3 = $r0.19
	c0	ldw $r0.11 = 0[$r0.1]   ## 4-byte Folded Reload
	c0	ldw $r0.12 = 4[$r0.1]   ## 4-byte Folded Reload
	c0	ldw $r0.13 = 8[$r0.1]   ## 4-byte Folded Reload
	c0	ldw $r0.14 = 12[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.15 = 16[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.16 = 20[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.17 = 24[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.18 = 28[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.19 = 32[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.20 = 36[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.21 = 40[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.22 = 44[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.23 = 48[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $l0.0 = 52[$r0.1]   ## 4-byte Folded Reload
	c0	return $r0.1 = $r0.1, 56, $l0.0
$func_end1::
	.size	main, ($func_end1)-main

	.type	data,@object            ## @data
	.section .data
	.globl	data
	.align	2
data::
	.data4	1                       ## 0x1
	.data4	2                       ## 0x2
	.data4	3                       ## 0x3
	.data4	4                       ## 0x4
	.data4	5                       ## 0x5
	.data4	6                       ## 0x6
	.data4	7                       ## 0x7
	.data4	8                       ## 0x8
	.data4	11                      ## 0xb
	.data4	22                      ## 0x16
	.data4	33                      ## 0x21
	.data4	40                      ## 0x28
	.data4	51                      ## 0x33
	.data4	62                      ## 0x3e
	.data4	73                      ## 0x49
	.data4	84                      ## 0x54
	.data4	12                      ## 0xc
	.data4	23                      ## 0x17
	.data4	34                      ## 0x22
	.data4	41                      ## 0x29
	.data4	52                      ## 0x34
	.data4	63                      ## 0x3f
	.data4	74                      ## 0x4a
	.data4	85                      ## 0x55
	.data4	13                      ## 0xd
	.data4	24                      ## 0x18
	.data4	35                      ## 0x23
	.data4	42                      ## 0x2a
	.data4	53                      ## 0x35
	.data4	64                      ## 0x40
	.data4	75                      ## 0x4b
	.data4	86                      ## 0x56
	.data4	14                      ## 0xe
	.data4	25                      ## 0x19
	.data4	36                      ## 0x24
	.data4	43                      ## 0x2b
	.data4	54                      ## 0x36
	.data4	65                      ## 0x41
	.data4	76                      ## 0x4c
	.data4	87                      ## 0x57
	.data4	15                      ## 0xf
	.data4	26                      ## 0x1a
	.data4	37                      ## 0x25
	.data4	44                      ## 0x2c
	.data4	55                      ## 0x37
	.data4	66                      ## 0x42
	.data4	77                      ## 0x4d
	.data4	88                      ## 0x58
	.data4	16                      ## 0x10
	.data4	27                      ## 0x1b
	.data4	38                      ## 0x26
	.data4	45                      ## 0x2d
	.data4	56                      ## 0x38
	.data4	67                      ## 0x43
	.data4	78                      ## 0x4e
	.data4	89                      ## 0x59
	.data4	17                      ## 0x11
	.data4	28                      ## 0x1c
	.data4	39                      ## 0x27
	.data4	46                      ## 0x2e
	.data4	57                      ## 0x39
	.data4	68                      ## 0x44
	.data4	79                      ## 0x4f
	.data4	80                      ## 0x50
	.size	data, 256

	.type	data_ref,@object        ## @data_ref
	.globl	data_ref
	.align	2
data_ref::
	.data4	2826                    ## 0xb0a
	.data4	4294965983              ## 0xfffffadf
	.data4	22                      ## 0x16
	.data4	4294967145              ## 0xffffff69
	.data4	4294967258              ## 0xffffffda
	.data4	4294967251              ## 0xffffffd3
	.data4	9                       ## 0x9
	.data4	10                      ## 0xa
	.data4	4294966704              ## 0xfffffdb0
	.data4	215                     ## 0xd7
	.data4	11                      ## 0xb
	.data4	12                      ## 0xc
	.data4	19                      ## 0x13
	.data4	4294967295              ## 0xffffffff
	.data4	4                       ## 0x4
	.data4	4294967290              ## 0xfffffffa
	.data4	4294966849              ## 0xfffffe41
	.data4	239                     ## 0xef
	.data4	4294967272              ## 0xffffffe8
	.data4	43                      ## 0x2b
	.data4	4294967288              ## 0xfffffff8
	.data4	20                      ## 0x14
	.data4	4294967287              ## 0xfffffff7
	.data4	3                       ## 0x3
	.data4	4294966902              ## 0xfffffe76
	.data4	182                     ## 0xb6
	.data4	9                       ## 0x9
	.data4	11                      ## 0xb
	.data4	16                      ## 0x10
	.data4	4294967295              ## 0xffffffff
	.data4	4                       ## 0x4
	.data4	4294967291              ## 0xfffffffb
	.data4	4294966954              ## 0xfffffeaa
	.data4	183                     ## 0xb7
	.data4	4294967278              ## 0xffffffee
	.data4	33                      ## 0x21
	.data4	4294967290              ## 0xfffffffa
	.data4	15                      ## 0xf
	.data4	4294967289              ## 0xfffffff9
	.data4	2                       ## 0x2
	.data4	4294967038              ## 0xfffffefe
	.data4	122                     ## 0x7a
	.data4	6                       ## 0x6
	.data4	7                       ## 0x7
	.data4	11                      ## 0xb
	.data4	4294967295              ## 0xffffffff
	.data4	2                       ## 0x2
	.data4	4294967293              ## 0xfffffffd
	.data4	4294967111              ## 0xffffff47
	.data4	99                      ## 0x63
	.data4	4294967286              ## 0xfffffff6
	.data4	18                      ## 0x12
	.data4	4294967293              ## 0xfffffffd
	.data4	8                       ## 0x8
	.data4	4294967292              ## 0xfffffffc
	.data4	1                       ## 0x1
	.data4	4294967206              ## 0xffffffa6
	.data4	43                      ## 0x2b
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	4                       ## 0x4
	.data4	0                       ## 0x0
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.size	data_ref, 256

	.type	i,@object               ## @i
	.bss
	.globl	i
	.align	2
i::
	.data4	0                       ## 0x0
	.size	i, 4

	.type	a,@object               ## @a
	.globl	a
	.align	2
a::
	.data4	0                       ## 0x0
	.size	a, 4


