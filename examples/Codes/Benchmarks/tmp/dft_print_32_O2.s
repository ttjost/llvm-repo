.section .text
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @cast_uint32
cast_uint32::
## BB#0:                                ## %entry
.return ret($r0.3:s32)
	c0	ldw $r0.3 = 4[$r0.3]
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @cast_int32
cast_int32::
## BB#0:                                ## %entry
	c0	ldw $r0.12 = 0[$r0.3]
;;
	c0	cmpgt $b0.0 = $r0.12, -1
;;
	c0	brf $b0.0, LBB1_1
;;
## BB#3:                                ## %if.else3
	c0	mov $r0.11 = 0
	c0	cmpne $b0.0 = $r0.12, 0
;;
	c0	br $b0.0, LBB1_5
;;
	c0	goto LBB1_4
;;
LBB1_1::                                ## %if.then
	c0	mov $r0.11 = 0
	c0	cmpne $b0.0 = $r0.12, -1
;;
	c0	br $b0.0, LBB1_5
;;
## BB#2:                                ## %if.then2
	c0	ldw $r0.11 = 4[$r0.3]
	c0	goto LBB1_5
;;
LBB1_4::                                ## %if.then6
	c0	ldw $r0.11 = 4[$r0.3]
;;
LBB1_5::                                ## %if.end10
.return ret($r0.3:s32)
	c0	mov $r0.3 = $r0.11
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @cast
cast::
## BB#0:                                ## %entry
	c0	mov $r0.11 = 31
;;
	c0	shr $r0.11 = $r0.4, $r0.11
;;
	c0	stw 0[$r0.3] = $r0.11
;;
.return ret($r0.3:s32)
	c0	stw 4[$r0.3] = $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @add
add::
## BB#0:                                ## %entry
	c0	ldw $r0.11 = 4[$r0.4]
;;
	c0	ldw $r0.12 = 4[$r0.5]
;;
	c0	add $r0.11 = $r0.12, $r0.11
	c0	ldw $r0.13 = 0[$r0.5]
;;
	c0	cmpltu $b0.0 = $r0.11, $r0.12
	c0	cmpltu $r0.12 = $r0.11, $r0.12
	c0	ldw $r0.14 = 0[$r0.4]
;;
	c0	add $r0.13 = $r0.13, $r0.14
	c0	mfb $r0.14 = $b0.0
;;
	c0	or $r0.12 = $r0.12, $r0.14
;;
	c0	and $r0.12 = $r0.12, 1
;;
	c0	add $r0.12 = $r0.13, $r0.12
;;
	c0	stw 0[$r0.3] = $r0.12
;;
.return ret($r0.3:s32)
	c0	stw 4[$r0.3] = $r0.11
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @neg
neg::
## BB#0:                                ## %entry
	c0	ldw $r0.11 = 4[$r0.4]
	c0	mov $r0.12 = 0
;;
	c0	xor $r0.13 = $r0.11, -1
	c0	cmpeq $b0.0 = $r0.11, 0
	c0	sub $r0.11 = $r0.12, $r0.11
;;
	c0	stw 4[$r0.4] = $r0.13
	c0	mfb $r0.12 = $b0.0
;;
	c0	ldw $r0.13 = 0[$r0.4]
;;
	c0	xor $r0.13 = $r0.13, -1
;;
	c0	add $r0.12 = $r0.12, $r0.13
;;
	c0	stw 0[$r0.3] = $r0.12
;;
.return ret($r0.3:s32)
	c0	stw 4[$r0.3] = $r0.11
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @abs
abs::
## BB#0:                                ## %entry
	c0	mov $r0.11 = 31
;;
	c0	shr $r0.11 = $r0.3, $r0.11
;;
	c0	add $r0.12 = $r0.3, $r0.11
;;
.return ret($r0.3:s32)
	c0	xor $r0.3 = $r0.12, $r0.11
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @ucast
ucast::
## BB#0:                                ## %entry
	c0	mov $r0.11 = 0
;;
	c0	stw 0[$r0.3] = $r0.11
;;
.return ret($r0.3:s32)
	c0	stw 4[$r0.3] = $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @sll
sll::
## BB#0:                                ## %entry
	c0	cmpgtu $b0.0 = $r0.5, 31
;;
	c0	br $b0.0, LBB7_2
;;
## BB#1:                                ## %if.then
	c0	mov $r0.11 = 32
;;
	c0	sub $r0.11 = $r0.11, $r0.5
	c0	ldw $r0.12 = 0[$r0.4]
;;
	c0	shl $r0.12 = $r0.12, $r0.5
	c0	ldw $r0.13 = 4[$r0.4]
;;
	c0	shru $r0.11 = $r0.13, $r0.11
	c0	shl $r0.13 = $r0.13, $r0.5
;;
	c0	or $r0.11 = $r0.11, $r0.12
;;
	c0	stw 0[$r0.4] = $r0.11
;;
	c0	stw 4[$r0.4] = $r0.13
	c0	goto LBB7_3
;;
LBB7_2::                                ## %if.else
	c0	add $r0.11 = $r0.5, -32
	c0	ldw $r0.12 = 4[$r0.4]
;;
	c0	shl $r0.11 = $r0.12, $r0.11
;;
	c0	stw 0[$r0.4] = $r0.11
	c0	mov $r0.11 = 0
;;
	c0	stw 4[$r0.4] = $r0.11
;;
LBB7_3::                                ## %if.end
	c0	ldw $r0.11 = 0[$r0.4]
;;
	c0	ldw $r0.12 = 4[$r0.4]
;;
	c0	stw 4[$r0.3] = $r0.12
;;
.return ret($r0.3:s32)
	c0	stw 0[$r0.3] = $r0.11
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @sra
sra::
## BB#0:                                ## %entry
	c0	cmpgtu $b0.0 = $r0.5, 31
;;
	c0	br $b0.0, LBB8_2
;;
## BB#1:                                ## %if.then
	c0	mov $r0.11 = 32
;;
	c0	sub $r0.11 = $r0.11, $r0.5
	c0	ldw $r0.12 = 4[$r0.4]
;;
	c0	shru $r0.12 = $r0.12, $r0.5
	c0	ldw $r0.13 = 0[$r0.4]
;;
	c0	shl $r0.11 = $r0.13, $r0.11
	c0	shr $r0.13 = $r0.13, $r0.5
;;
	c0	or $r0.11 = $r0.11, $r0.12
;;
	c0	stw 4[$r0.4] = $r0.11
;;
	c0	stw 0[$r0.4] = $r0.13
	c0	goto LBB8_3
;;
LBB8_2::                                ## %if.else
	c0	add $r0.11 = $r0.5, -32
	c0	ldw $r0.12 = 0[$r0.4]
;;
	c0	shr $r0.11 = $r0.12, $r0.11
;;
	c0	stw 4[$r0.4] = $r0.11
	c0	mov $r0.11 = -1
;;
	c0	stw 0[$r0.4] = $r0.11
;;
LBB8_3::                                ## %if.end
	c0	ldw $r0.11 = 0[$r0.4]
;;
	c0	ldw $r0.12 = 4[$r0.4]
;;
	c0	stw 4[$r0.3] = $r0.12
;;
.return ret($r0.3:s32)
	c0	stw 0[$r0.3] = $r0.11
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @umult
umult::
## BB#0:                                ## %entry
	c0	mov $r0.11 = 16
	c0	zxth $r0.12 = $r0.4
	c0	zxth $r0.13 = $r0.5
;;
	c0	mpyhs $r0.14 = $r0.13, $r0.12
	c0	shru $r0.15 = $r0.5, $r0.11
	c0	mpylu $r0.16 = $r0.13, $r0.12
	c0	shru $r0.17 = $r0.4, $r0.11
;;
	c0	mpylu $r0.18 = $r0.15, $r0.12
	c0	mpyhs $r0.12 = $r0.15, $r0.12
	c0	add $r0.14 = $r0.16, $r0.14
;;
	c0	mpylu $r0.16 = $r0.13, $r0.17
	c0	mpyhs $r0.13 = $r0.13, $r0.17
	c0	add $r0.12 = $r0.18, $r0.12
;;
	c0	mpylu $r0.18 = $r0.15, $r0.17
	c0	add $r0.13 = $r0.16, $r0.13
	c0	shl $r0.16 = $r0.12, $r0.11
	c0	mpyhs $r0.15 = $r0.15, $r0.17
;;
	c0	shl $r0.17 = $r0.13, $r0.11
	c0	add $r0.14 = $r0.16, $r0.14
	c0	shru $r0.12 = $r0.12, $r0.11
	c0	add $r0.15 = $r0.18, $r0.15
;;
	c0	cmpltu $b0.0 = $r0.14, $r0.16
	c0	cmpltu $r0.16 = $r0.14, $r0.16
	c0	add $r0.18 = $r0.14, $r0.17
	c0	shru $r0.11 = $r0.13, $r0.11
;;
	c0	cmpltu $b0.1 = $r0.18, $r0.17
	c0	cmpltu $r0.13 = $r0.18, $r0.14
	c0	add $r0.12 = $r0.12, $r0.15
	c0	mfb $r0.14 = $b0.0
;;
	c0	or $r0.14 = $r0.16, $r0.14
	c0	add $r0.11 = $r0.12, $r0.11
	c0	mfb $r0.12 = $b0.1
;;
	c0	or $r0.12 = $r0.13, $r0.12
	c0	and $r0.13 = $r0.14, 1
	c0	stw 4[$r0.3] = $r0.18
;;
	c0	add $r0.11 = $r0.11, $r0.13
	c0	and $r0.12 = $r0.12, 1
;;
	c0	add $r0.11 = $r0.11, $r0.12
;;
.return ret($r0.3:s32)
	c0	stw 0[$r0.3] = $r0.11
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @mult
mult::
## BB#0:                                ## %entry
	c0	mov $r0.11 = 31
;;
	c0	shr $r0.12 = $r0.4, $r0.11
	c0	shr $r0.11 = $r0.5, $r0.11
	c0	mov $r0.13 = 16
;;
	c0	add $r0.14 = $r0.5, $r0.11
	c0	add $r0.15 = $r0.4, $r0.12
	c0	xor $r0.16 = $r0.5, $r0.4
;;
	c0	xor $r0.11 = $r0.14, $r0.11
	c0	xor $r0.12 = $r0.15, $r0.12
;;
	c0	shru $r0.14 = $r0.11, $r0.13
	c0	shru $r0.15 = $r0.12, $r0.13
	c0	zxth $r0.12 = $r0.12
	c0	zxth $r0.11 = $r0.11
;;
	c0	mpylu $r0.17 = $r0.14, $r0.12
	c0	mpyhs $r0.18 = $r0.14, $r0.12
;;
	c0	mpylu $r0.19 = $r0.11, $r0.15
	c0	mpyhs $r0.20 = $r0.11, $r0.12
	c0	add $r0.17 = $r0.17, $r0.18
;;
	c0	mpylu $r0.12 = $r0.11, $r0.12
	c0	mpyhs $r0.11 = $r0.11, $r0.15
	c0	shl $r0.18 = $r0.17, $r0.13
	c0	shru $r0.17 = $r0.17, $r0.13
;;
	c0	add $r0.12 = $r0.12, $r0.20
	c0	add $r0.11 = $r0.19, $r0.11
	c0	mpylu $r0.19 = $r0.14, $r0.15
	c0	mpyhs $r0.14 = $r0.14, $r0.15
;;
	c0	shl $r0.15 = $r0.11, $r0.13
	c0	add $r0.12 = $r0.18, $r0.12
	c0	add $r0.14 = $r0.19, $r0.14
	c0	shru $r0.13 = $r0.11, $r0.13
;;
	c0	cmpltu $b0.0 = $r0.12, $r0.18
	c0	cmpltu $r0.18 = $r0.12, $r0.18
	c0	add $r0.11 = $r0.12, $r0.15
	c0	add $r0.14 = $r0.17, $r0.14
;;
	c0	cmpltu $b0.1 = $r0.11, $r0.15
	c0	cmpltu $r0.12 = $r0.11, $r0.12
	c0	mfb $r0.15 = $b0.0
	c0	add $r0.13 = $r0.14, $r0.13
;;
	c0	or $r0.14 = $r0.18, $r0.15
	c0	mfb $r0.15 = $b0.1
;;
	c0	or $r0.12 = $r0.12, $r0.15
	c0	and $r0.14 = $r0.14, 1
;;
	c0	add $r0.13 = $r0.13, $r0.14
	c0	and $r0.12 = $r0.12, 1
;;
	c0	add $r0.12 = $r0.13, $r0.12
	c0	cmpgt $b0.0 = $r0.16, -1
;;
	c0	br $b0.0, LBB10_2
;;
## BB#1:                                ## %if.then
	c0	cmpeq $b0.0 = $r0.11, 0
	c0	mov $r0.13 = 0
	c0	xor $r0.12 = $r0.12, -1
;;
	c0	mfb $r0.14 = $b0.0
	c0	sub $r0.11 = $r0.13, $r0.11
;;
	c0	add $r0.12 = $r0.14, $r0.12
;;
LBB10_2::                               ## %if.end
	c0	stw 0[$r0.3] = $r0.12
;;
.return ret($r0.3:s32)
	c0	stw 4[$r0.3] = $r0.11
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @sum_rot_block_row
sum_rot_block_row::
## BB#0:                                ## %entry
	c0	mov $r0.11 = 0
	c0	mov $r0.12 = dft_waves_cos
;;
	c0	mov $r0.13 = dft_waves_sin
	c0	mov $r0.14 = rowsums
;;
	c0	mov $r0.15 = 17
	c0	mov $r0.16 = 31
	c0	mov $r0.17 = 16
	c0	mov $r0.18 = 15
;;
	c0	mov $r0.19 = 12
	c0	mov $r0.20 = 5
	c0	mov $r0.21 = 27
	c0	mov $r0.22 = $r0.11
;;
LBB11_1::                               ## %for.cond1.preheader
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB11_2 Depth 2
	c0	mov $r0.24 = $r0.12
	c0	mov $r0.25 = $r0.13
	c0	mov $r0.27 = $r0.11
	c0	mov $r0.23 = $r0.11
;;
	c0	mov $r0.26 = $r0.11
;;
LBB11_2::                               ## %for.body3
                                        ##   Parent Loop BB11_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	add $r0.28 = $r0.14, $r0.27
;;
	c0	ldw $r0.28 = 0[$r0.28]
;;
	c0	shl $r0.28 = $r0.28, $r0.15
	c0	ldw $r0.29 = 0[$r0.24]
;;
	c0	shr $r0.30 = $r0.28, $r0.16
	c0	shr $r0.31 = $r0.29, $r0.16
	c0	xor $r0.32 = $r0.29, $r0.28
;;
	c0	add $r0.29 = $r0.29, $r0.31
	c0	add $r0.33 = $r0.28, $r0.30
;;
	c0	xor $r0.30 = $r0.33, $r0.30
	c0	xor $r0.29 = $r0.29, $r0.31
;;
	c0	shru $r0.31 = $r0.29, $r0.17
	c0	zxth $r0.33 = $r0.29
	c0	shru $r0.29 = $r0.30, $r0.17
;;
	c0	mpylu $r0.30 = $r0.33, $r0.29
	c0	mpyhs $r0.33 = $r0.33, $r0.29
;;
	c0	mpyhs $r0.34 = $r0.31, $r0.29
	c0	mpylu $r0.31 = $r0.31, $r0.29
	c0	add $r0.30 = $r0.30, $r0.33
;;
	c0	add $r0.31 = $r0.31, $r0.34
	c0	shru $r0.33 = $r0.30, $r0.17
	c0	shl $r0.30 = $r0.30, $r0.17
;;
	c0	add $r0.31 = $r0.33, $r0.31
	c0	cmpgt $b0.0 = $r0.32, -1
;;
	c0	br $b0.0, LBB11_4
;;
## BB#3:                                ## %if.then.i
                                        ##   in Loop: Header=BB11_2 Depth=2
	c0	cmpeq $b0.0 = $r0.30, 0
	c0	xor $r0.31 = $r0.31, -1
;;
	c0	mfb $r0.32 = $b0.0
	c0	sub $r0.30 = $r0.11, $r0.30
;;
	c0	add $r0.31 = $r0.32, $r0.31
;;
LBB11_4::                               ## %mult.exit
                                        ##   in Loop: Header=BB11_2 Depth=2
	c0	ldw $r0.32 = 0[$r0.25]
;;
	c0	shr $r0.33 = $r0.32, $r0.16
	c0	shr $r0.34 = $r0.31, $r0.15
;;
	c0	add $r0.35 = $r0.32, $r0.33
	c0	cmpeq $b0.0 = $r0.34, -1
	c0	cmpeq $b0.1 = $r0.34, 0
	c0	shl $r0.31 = $r0.31, $r0.18
;;
	c0	xor $r0.33 = $r0.35, $r0.33
	c0	mfb $r0.35 = $b0.1
	c0	mfb $r0.36 = $b0.0
	c0	cmplt $b0.0 = $r0.34, 0
;;
	c0	slct $r0.34 = $b0.0, $r0.36, $r0.35
	c0	zxth $r0.35 = $r0.33
;;
	c0	mpylu $r0.36 = $r0.35, $r0.29
	c0	shru $r0.30 = $r0.30, $r0.15
	c0	mpyhs $r0.35 = $r0.35, $r0.29
	c0	shru $r0.33 = $r0.33, $r0.17
;;
	c0	or $r0.30 = $r0.31, $r0.30
	c0	add $r0.31 = $r0.36, $r0.35
	c0	mtb $b0.0 = $r0.34
	c0	mpyhs $r0.34 = $r0.33, $r0.29
;;
	c0	mpylu $r0.29 = $r0.33, $r0.29
	c0	shru $r0.33 = $r0.31, $r0.17
	c0	slct $r0.30 = $b0.0, $r0.30, 0
;;
	c0	add $r0.34 = $r0.29, $r0.34
	c0	shl $r0.29 = $r0.31, $r0.17
;;
	c0	add $r0.31 = $r0.33, $r0.34
	c0	xor $r0.28 = $r0.32, $r0.28
;;
	c0	cmpgt $b0.0 = $r0.28, -1
;;
	c0	br $b0.0, LBB11_6
;;
## BB#5:                                ## %if.then.i204
                                        ##   in Loop: Header=BB11_2 Depth=2
	c0	cmpeq $b0.0 = $r0.29, 0
	c0	xor $r0.28 = $r0.31, -1
;;
	c0	mfb $r0.31 = $b0.0
	c0	sub $r0.29 = $r0.11, $r0.29
;;
	c0	add $r0.31 = $r0.31, $r0.28
;;
LBB11_6::                               ## %mult.exit206
                                        ##   in Loop: Header=BB11_2 Depth=2
	c0	add $r0.26 = $r0.30, $r0.26
	c0	shr $r0.28 = $r0.31, $r0.15
;;
	c0	cmpeq $b0.0 = $r0.28, -1
	c0	cmpeq $b0.1 = $r0.28, 0
	c0	shl $r0.30 = $r0.31, $r0.18
	c0	shru $r0.29 = $r0.29, $r0.15
;;
	c0	mfb $r0.31 = $b0.1
	c0	cmplt $b0.1 = $r0.28, 0
	c0	mfb $r0.28 = $b0.0
	c0	or $r0.29 = $r0.30, $r0.29
;;
	c0	slct $r0.28 = $b0.1, $r0.28, $r0.31
;;
	c0	mtb $b0.0 = $r0.28
	c0	add $r0.27 = $r0.27, 4
;;
	c0	slct $r0.28 = $b0.0, $r0.29, 0
;;
	c0	add $r0.23 = $r0.28, $r0.23
	c0	add $r0.24 = $r0.24, 4
	c0	add $r0.25 = $r0.25, 4
	c0	cmpne $b0.0 = $r0.27, 96
;;
	c0	br $b0.0, LBB11_2
;;
## BB#7:                                ## %for.end
                                        ##   in Loop: Header=BB11_1 Depth=1
	c0	shr $r0.24 = $r0.26, $r0.16
	c0	shr $r0.25 = $r0.26, $r0.19
	c0	shr $r0.26 = $r0.23, $r0.19
	c0	shr $r0.23 = $r0.23, $r0.16
;;
	c0	add $r0.26 = $r0.26, $r0.23
	c0	add $r0.25 = $r0.25, $r0.24
;;
	c0	xor $r0.24 = $r0.25, $r0.24
	c0	xor $r0.23 = $r0.26, $r0.23
;;
	c0	shru $r0.25 = $r0.23, $r0.17
	c0	shru $r0.26 = $r0.24, $r0.17
	c0	zxth $r0.23 = $r0.23
	c0	zxth $r0.24 = $r0.24
;;
	c0	mpylu $r0.27 = $r0.25, $r0.23
	c0	mpylu $r0.28 = $r0.26, $r0.24
;;
	c0	mpyhs $r0.29 = $r0.25, $r0.23
	c0	mpyhs $r0.30 = $r0.26, $r0.24
;;
	c0	add $r0.27 = $r0.27, $r0.29
	c0	add $r0.28 = $r0.28, $r0.30
	c0	mpyhs $r0.29 = $r0.24, $r0.24
	c0	mpylu $r0.30 = $r0.23, $r0.23
;;
	c0	mpylu $r0.24 = $r0.24, $r0.24
	c0	mpyhs $r0.23 = $r0.23, $r0.23
	c0	shl $r0.31 = $r0.27, $r0.17
	c0	shl $r0.32 = $r0.28, $r0.17
;;
	c0	add $r0.23 = $r0.30, $r0.23
	c0	add $r0.24 = $r0.24, $r0.29
	c0	mpyhs $r0.29 = $r0.25, $r0.25
	c0	mpylu $r0.30 = $r0.26, $r0.26
;;
	c0	add $r0.24 = $r0.32, $r0.24
	c0	add $r0.23 = $r0.31, $r0.23
	c0	mpyhs $r0.26 = $r0.26, $r0.26
	c0	mpylu $r0.25 = $r0.25, $r0.25
;;
	c0	cmpltu $b0.0 = $r0.23, $r0.31
	c0	cmpltu $b0.1 = $r0.24, $r0.32
	c0	add $r0.33 = $r0.24, $r0.32
	c0	cmpltu $r0.34 = $r0.24, $r0.32
;;
	c0	cmpltu $b0.2 = $r0.33, $r0.32
	c0	add $r0.32 = $r0.23, $r0.31
	c0	cmpltu $r0.35 = $r0.23, $r0.31
	c0	cmpltu $r0.24 = $r0.33, $r0.24
;;
	c0	cmpltu $b0.3 = $r0.32, $r0.31
	c0	cmpltu $r0.23 = $r0.32, $r0.23
	c0	mfb $r0.31 = $b0.0
	c0	mfb $r0.36 = $b0.1
;;
	c0	or $r0.31 = $r0.35, $r0.31
	c0	or $r0.34 = $r0.34, $r0.36
	c0	add $r0.25 = $r0.25, $r0.29
	c0	add $r0.26 = $r0.30, $r0.26
;;
	c0	mfb $r0.29 = $b0.3
	c0	mfb $r0.30 = $b0.2
	c0	shru $r0.27 = $r0.27, $r0.18
	c0	shru $r0.28 = $r0.28, $r0.18
;;
	c0	or $r0.24 = $r0.24, $r0.30
	c0	or $r0.23 = $r0.23, $r0.29
	c0	and $r0.29 = $r0.31, 1
	c0	and $r0.30 = $r0.34, 1
;;
	c0	add $r0.25 = $r0.29, $r0.25
	c0	add $r0.26 = $r0.30, $r0.26
	c0	and $r0.23 = $r0.23, 1
	c0	and $r0.24 = $r0.24, 1
;;
	c0	add $r0.23 = $r0.25, $r0.23
	c0	add $r0.24 = $r0.26, $r0.24
	c0	and $r0.25 = $r0.27, 131070
;;
	c0	and $r0.26 = $r0.28, 131070
	c0	add $r0.23 = $r0.23, $r0.25
;;
	c0	add $r0.24 = $r0.24, $r0.26
	c0	shru $r0.25 = $r0.32, $r0.20
	c0	shru $r0.26 = $r0.33, $r0.20
;;
	c0	shr $r0.27 = $r0.24, $r0.20
	c0	shr $r0.28 = $r0.23, $r0.20
	c0	shl $r0.24 = $r0.24, $r0.21
	c0	shl $r0.23 = $r0.23, $r0.21
;;
	c0	cmpeq $b0.0 = $r0.28, -1
	c0	cmpeq $b0.1 = $r0.27, -1
	c0	cmpeq $b0.2 = $r0.27, 0
	c0	cmpeq $b0.3 = $r0.28, 0
;;
	c0	mfb $r0.29 = $b0.0
	c0	mfb $r0.30 = $b0.3
	c0	mfb $r0.31 = $b0.2
	c0	cmplt $b0.0 = $r0.28, 0
;;
	c0	slct $r0.28 = $b0.0, $r0.29, $r0.30
	c0	cmplt $b0.0 = $r0.27, 0
	c0	mfb $r0.27 = $b0.1
	c0	or $r0.23 = $r0.23, $r0.25
;;
	c0	slct $r0.25 = $b0.0, $r0.27, $r0.31
	c0	or $r0.24 = $r0.24, $r0.26
	c0	mtb $b0.0 = $r0.28
;;
	c0	mtb $b0.1 = $r0.25
	c0	mpylu $r0.25 = $r0.22, 96
	c0	mpyhs $r0.26 = $r0.22, 96
	c0	slct $r0.23 = $b0.0, $r0.23, 0
;;
	c0	slct $r0.24 = $b0.1, $r0.24, 0
	c0	add $r0.22 = $r0.22, 1
	c0	add $r0.25 = $r0.25, $r0.26
;;
	c0	add $r0.23 = $r0.23, $r0.24
	c0	add $r0.24 = $r0.3, $r0.25
;;
	c0	stw 0[$r0.24] = $r0.23
	c0	add $r0.12 = $r0.12, 96
	c0	add $r0.13 = $r0.13, 96
	c0	cmpne $b0.0 = $r0.22, 4
;;
	c0	br $b0.0, LBB11_1
;;
## BB#8:                                ## %for.end30
.return ret($r0.3:s32)
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
	c0	stw 28[$r0.1] = $l0.0
;;
	c0	stw 24[$r0.1] = $r0.57
;;
	c0	stw 20[$r0.1] = $r0.58
	c0	mov $r0.58 = 200
	c0	mov $r0.57 = powers
;;
LBB12_2::                               ## %for.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.58 = $r0.58, -1
	c0	mov $r0.3 = $r0.57
;;
.call sum_rot_block_row, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = sum_rot_block_row
;;
	c0	cmpeq $b0.0 = $r0.58, 0
;;
	c0	brf $b0.0, LBB12_2
;;
## BB#1:                                ## %for.cond1.preheader
	c0	mov $r0.11 = powers_temp
;;
	c0	ldw $r0.12 = 0[$r0.11]
;;
	c0	ldw $r0.13 = 0[$r0.57]
;;
	c0	cmpeq $b0.0 = $r0.13, $r0.12
;;
	c0	brf $b0.0, LBB12_4
;;
## BB#3:                                ## %for.cond1
	c0	ldw $r0.12 = 96[$r0.11]
;;
	c0	ldw $r0.13 = 96[$r0.57]
;;
	c0	cmpeq $b0.0 = $r0.13, $r0.12
;;
	c0	brf $b0.0, LBB12_4
;;
## BB#6:                                ## %for.cond1.1
	c0	ldw $r0.12 = 192[$r0.11]
;;
	c0	ldw $r0.13 = 192[$r0.57]
;;
	c0	cmpne $b0.0 = $r0.13, $r0.12
;;
	c0	br $b0.0, LBB12_4
;;
## BB#7:                                ## %for.cond1.2
	c0	ldw $r0.11 = 288[$r0.11]
;;
	c0	ldw $r0.12 = 288[$r0.57]
;;
	c0	cmpne $b0.0 = $r0.12, $r0.11
;;
	c0	br $b0.0, LBB12_4
;;
## BB#8:                                ## %for.cond1.3
	c0	mov $r0.57 = -1
	c0	mov $r0.3 = str
;;
.call puts, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = puts
;;
	c0	goto LBB12_5
;;
LBB12_4::                               ## %if.then
	c0	mov $r0.57 = 666
	c0	mov $r0.3 = str2
;;
.call puts, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = puts
;;
LBB12_5::                               ## %return
	c0	mov $r0.3 = $r0.57
	c0	ldw $r0.58 = 20[$r0.1]
;;
	c0	ldw $r0.57 = 24[$r0.1]
;;
	c0	ldw $l0.0 = 28[$r0.1]
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .data
	.align	2                       ## @rowsums
rowsums::
	.data4	759                     ## 0x2f7
	.data4	776                     ## 0x308
	.data4	787                     ## 0x313
	.data4	795                     ## 0x31b
	.data4	797                     ## 0x31d
	.data4	796                     ## 0x31c
	.data4	801                     ## 0x321
	.data4	805                     ## 0x325
	.data4	800                     ## 0x320
	.data4	800                     ## 0x320
	.data4	799                     ## 0x31f
	.data4	801                     ## 0x321
	.data4	799                     ## 0x31f
	.data4	790                     ## 0x316
	.data4	781                     ## 0x30d
	.data4	775                     ## 0x307
	.data4	772                     ## 0x304
	.data4	769                     ## 0x301
	.data4	768                     ## 0x300
	.data4	767                     ## 0x2ff
	.data4	762                     ## 0x2fa
	.data4	761                     ## 0x2f9
	.data4	755                     ## 0x2f3
	.data4	751                     ## 0x2ef

.section .bss .section .data
	.align	2                       ## @powers
powers::
	.skip	384

.section .data
	.align	2                       ## @powers_temp
powers_temp::
	.data4	2436991                 ## 0x252f7f
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	63546                   ## 0xf83a
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	131381                  ## 0x20135
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	19272                   ## 0x4b48
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0

	.align	2                       ## @dft_waves_cos
dft_waves_cos::
	.data4	131072                  ## 0x20000
	.data4	126606                  ## 0x1ee8e
	.data4	113512                  ## 0x1bb68
	.data4	92683                   ## 0x16a0b
	.data4	65537                   ## 0x10001
	.data4	33926                   ## 0x8486
	.data4	3                       ## 0x3
	.data4	4294933375              ## 0xffff7b7f
	.data4	4294901764              ## 0xffff0004
	.data4	4294874617              ## 0xfffe95f9
	.data4	4294853787              ## 0xfffe449b
	.data4	4294840691              ## 0xfffe1173
	.data4	4294836224              ## 0xfffe0000
	.data4	4294840688              ## 0xfffe1170
	.data4	4294853780              ## 0xfffe4494
	.data4	4294874607              ## 0xfffe95ef
	.data4	4294901752              ## 0xfffefff8
	.data4	4294933362              ## 0xffff7b72
	.data4	4294967285              ## 0xfffffff5
	.data4	33913                   ## 0x8479
	.data4	65526                   ## 0xfff6
	.data4	92673                   ## 0x16a01
	.data4	113505                  ## 0x1bb61
	.data4	126602                  ## 0x1ee8a
	.data4	131072                  ## 0x20000
	.data4	113512                  ## 0x1bb68
	.data4	65537                   ## 0x10001
	.data4	3                       ## 0x3
	.data4	4294901764              ## 0xffff0004
	.data4	4294853787              ## 0xfffe449b
	.data4	4294836224              ## 0xfffe0000
	.data4	4294853780              ## 0xfffe4494
	.data4	4294901752              ## 0xfffefff8
	.data4	4294967285              ## 0xfffffff5
	.data4	65526                   ## 0xfff6
	.data4	113505                  ## 0x1bb61
	.data4	131072                  ## 0x20000
	.data4	113518                  ## 0x1bb6e
	.data4	65549                   ## 0x1000d
	.data4	16                      ## 0x10
	.data4	4294901775              ## 0xffff000f
	.data4	4294853793              ## 0xfffe44a1
	.data4	4294836224              ## 0xfffe0000
	.data4	4294853773              ## 0xfffe448d
	.data4	4294901740              ## 0xfffeffec
	.data4	4294967272              ## 0xffffffe8
	.data4	65514                   ## 0xffea
	.data4	113499                  ## 0x1bb5b
	.data4	131072                  ## 0x20000
	.data4	92683                   ## 0x16a0b
	.data4	3                       ## 0x3
	.data4	4294874617              ## 0xfffe95f9
	.data4	4294836224              ## 0xfffe0000
	.data4	4294874607              ## 0xfffe95ef
	.data4	4294967285              ## 0xfffffff5
	.data4	92673                   ## 0x16a01
	.data4	131072                  ## 0x20000
	.data4	92692                   ## 0x16a14
	.data4	16                      ## 0x10
	.data4	4294874627              ## 0xfffe9603
	.data4	4294836224              ## 0xfffe0000
	.data4	4294874598              ## 0xfffe95e6
	.data4	4294967272              ## 0xffffffe8
	.data4	92664                   ## 0x169f8
	.data4	131071                  ## 0x1ffff
	.data4	92701                   ## 0x16a1d
	.data4	29                      ## 0x1d
	.data4	4294874636              ## 0xfffe960c
	.data4	4294836224              ## 0xfffe0000
	.data4	4294874589              ## 0xfffe95dd
	.data4	4294967259              ## 0xffffffdb
	.data4	92654                   ## 0x169ee
	.data4	131072                  ## 0x20000
	.data4	65537                   ## 0x10001
	.data4	4294901764              ## 0xffff0004
	.data4	4294836224              ## 0xfffe0000
	.data4	4294901752              ## 0xfffefff8
	.data4	65526                   ## 0xfff6
	.data4	131072                  ## 0x20000
	.data4	65549                   ## 0x1000d
	.data4	4294901775              ## 0xffff000f
	.data4	4294836224              ## 0xfffe0000
	.data4	4294901740              ## 0xfffeffec
	.data4	65514                   ## 0xffea
	.data4	131071                  ## 0x1ffff
	.data4	65560                   ## 0x10018
	.data4	4294901786              ## 0xffff001a
	.data4	4294836224              ## 0xfffe0000
	.data4	4294901729              ## 0xfffeffe1
	.data4	65503                   ## 0xffdf
	.data4	131071                  ## 0x1ffff
	.data4	65571                   ## 0x10023
	.data4	4294901797              ## 0xffff0025
	.data4	4294836224              ## 0xfffe0000
	.data4	4294901718              ## 0xfffeffd6
	.data4	65492                   ## 0xffd4

	.align	2                       ## @dft_waves_sin
dft_waves_sin::
	.data4	0                       ## 0x0
	.data4	33923                   ## 0x8483
	.data4	65535                   ## 0xffff
	.data4	92680                   ## 0x16a08
	.data4	113510                  ## 0x1bb66
	.data4	126605                  ## 0x1ee8d
	.data4	131071                  ## 0x1ffff
	.data4	126606                  ## 0x1ee8e
	.data4	113514                  ## 0x1bb6a
	.data4	92685                   ## 0x16a0d
	.data4	65540                   ## 0x10004
	.data4	33929                   ## 0x8489
	.data4	6                       ## 0x6
	.data4	4294933379              ## 0xffff7b83
	.data4	4294901766              ## 0xffff0006
	.data4	4294874620              ## 0xfffe95fc
	.data4	4294853788              ## 0xfffe449c
	.data4	4294840692              ## 0xfffe1174
	.data4	4294836224              ## 0xfffe0000
	.data4	4294840687              ## 0xfffe116f
	.data4	4294853778              ## 0xfffe4492
	.data4	4294874605              ## 0xfffe95ed
	.data4	4294901749              ## 0xfffefff5
	.data4	4294933359              ## 0xffff7b6f
	.data4	0                       ## 0x0
	.data4	65535                   ## 0xffff
	.data4	113510                  ## 0x1bb66
	.data4	131071                  ## 0x1ffff
	.data4	113514                  ## 0x1bb6a
	.data4	65540                   ## 0x10004
	.data4	6                       ## 0x6
	.data4	4294901766              ## 0xffff0006
	.data4	4294853788              ## 0xfffe449c
	.data4	4294836224              ## 0xfffe0000
	.data4	4294853778              ## 0xfffe4492
	.data4	4294901749              ## 0xfffefff5
	.data4	4294967282              ## 0xfffffff2
	.data4	65523                   ## 0xfff3
	.data4	113504                  ## 0x1bb60
	.data4	131071                  ## 0x1ffff
	.data4	113520                  ## 0x1bb70
	.data4	65552                   ## 0x10010
	.data4	19                      ## 0x13
	.data4	4294901778              ## 0xffff0012
	.data4	4294853795              ## 0xfffe44a3
	.data4	4294836224              ## 0xfffe0000
	.data4	4294853772              ## 0xfffe448c
	.data4	4294901738              ## 0xfffeffea
	.data4	0                       ## 0x0
	.data4	92680                   ## 0x16a08
	.data4	131071                  ## 0x1ffff
	.data4	92685                   ## 0x16a0d
	.data4	6                       ## 0x6
	.data4	4294874620              ## 0xfffe95fc
	.data4	4294836224              ## 0xfffe0000
	.data4	4294874605              ## 0xfffe95ed
	.data4	4294967282              ## 0xfffffff2
	.data4	92671                   ## 0x169ff
	.data4	131071                  ## 0x1ffff
	.data4	92694                   ## 0x16a16
	.data4	19                      ## 0x13
	.data4	4294874629              ## 0xfffe9605
	.data4	4294836224              ## 0xfffe0000
	.data4	4294874596              ## 0xfffe95e4
	.data4	4294967269              ## 0xffffffe5
	.data4	92662                   ## 0x169f6
	.data4	131071                  ## 0x1ffff
	.data4	92704                   ## 0x16a20
	.data4	32                      ## 0x20
	.data4	4294874638              ## 0xfffe960e
	.data4	4294836224              ## 0xfffe0000
	.data4	4294874587              ## 0xfffe95db
	.data4	0                       ## 0x0
	.data4	113510                  ## 0x1bb66
	.data4	113514                  ## 0x1bb6a
	.data4	6                       ## 0x6
	.data4	4294853788              ## 0xfffe449c
	.data4	4294853778              ## 0xfffe4492
	.data4	4294967282              ## 0xfffffff2
	.data4	113504                  ## 0x1bb60
	.data4	113520                  ## 0x1bb70
	.data4	19                      ## 0x13
	.data4	4294853795              ## 0xfffe44a3
	.data4	4294853772              ## 0xfffe448c
	.data4	4294967269              ## 0xffffffe5
	.data4	113497                  ## 0x1bb59
	.data4	113527                  ## 0x1bb77
	.data4	32                      ## 0x20
	.data4	4294853801              ## 0xfffe44a9
	.data4	4294853765              ## 0xfffe4485
	.data4	4294967256              ## 0xffffffd8
	.data4	113491                  ## 0x1bb53
	.data4	113533                  ## 0x1bb7d
	.data4	45                      ## 0x2d
	.data4	4294853808              ## 0xfffe44b0
	.data4	4294853759              ## 0xfffe447f

	.section	.data
	.align	2                       ## @str
str::
	.data1 45
	.data1 49
	.data1 0

	.align	2                       ## @str2
str2::
	.data1 54
	.data1 54
	.data1 54
	.data1 0


.import printf
.type printf, @function
.import puts
.type puts, @function
