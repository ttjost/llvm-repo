.section .text
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @cast_uint32
cast_uint32::
## BB#0:                                ## %entry
.return ret($r0.3:s32)
	c0	mov $r0.3 = $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @cast_int32
cast_int32::
## BB#0:                                ## %entry
	c0	cmpgt $b0.0 = $r0.3, -1
;;
;;
	c0	brf $b0.0, LBB1_1
;;
## BB#2:                                ## %if.else5
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
.return ret($r0.3:s32)
	c0	slct $r0.3 = $b0.0, $r0.4, 0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB1_1::                                ## %if.then
	c0	cmpeq $b0.0 = $r0.3, -1
;;
;;
.return ret($r0.3:s32)
	c0	slct $r0.3 = $b0.0, $r0.4, 0
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
	c0	add $r0.11 = $r0.7, $r0.5
;;
	c0	cmpltu $b0.0 = $r0.11, $r0.7
	c0	cmpltu $r0.12 = $r0.11, $r0.7
;;
;;
	c0	mfb $r0.13 = $b0.0
	c0	add $r0.14 = $r0.6, $r0.4
;;
;;
	c0	or $r0.12 = $r0.12, $r0.13
;;
	c0	and $r0.12 = $r0.12, 1
;;
	c0	add $r0.12 = $r0.14, $r0.12
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
	c0	mov $r0.11 = 0
	c0	xor $r0.12 = $r0.5, -1
	c0	cmpeq $b0.0 = $r0.5, 0
;;
	c0	sub $r0.11 = $r0.11, $r0.5
;;
	c0	mfb $r0.13 = $b0.0
	c0	xor $r0.14 = $r0.4, -1
	c0	cmpltu $b0.0 = $r0.11, $r0.12
;;
;;
	c0	mfb $r0.12 = $b0.0
;;
;;
	c0	or $r0.12 = $r0.12, $r0.13
;;
	c0	and $r0.12 = $r0.12, 1
;;
	c0	add $r0.12 = $r0.12, $r0.14
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
	c0	cmpgtu $b0.0 = $r0.6, 31
;;
;;
	c0	br $b0.0, LBB7_2
;;
## BB#1:                                ## %if.then
	c0	mov $r0.11 = 32
;;
	c0	sub $r0.11 = $r0.11, $r0.6
;;
	c0	shru $r0.12 = $r0.5, $r0.11
	c0	shl $r0.13 = $r0.4, $r0.6
	c0	shl $r0.11 = $r0.5, $r0.6
;;
	c0	or $r0.12 = $r0.12, $r0.13
	c0	goto LBB7_3
;;
LBB7_2::                                ## %if.else
	c0	add $r0.11 = $r0.6, -32
;;
	c0	shl $r0.12 = $r0.5, $r0.11
	c0	mov $r0.11 = 0
;;
LBB7_3::                                ## %if.end
	c0	stw 0[$r0.3] = $r0.12
;;
.return ret($r0.3:s32)
	c0	stw 4[$r0.3] = $r0.11
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @sra
sra::
## BB#0:                                ## %entry
	c0	cmpgtu $b0.0 = $r0.6, 31
;;
;;
	c0	br $b0.0, LBB8_2
;;
## BB#1:                                ## %if.then
	c0	mov $r0.11 = 32
;;
	c0	sub $r0.11 = $r0.11, $r0.6
;;
	c0	shl $r0.11 = $r0.4, $r0.11
	c0	shru $r0.13 = $r0.5, $r0.6
	c0	shr $r0.12 = $r0.4, $r0.6
;;
	c0	or $r0.11 = $r0.11, $r0.13
	c0	goto LBB8_3
;;
LBB8_2::                                ## %if.else
	c0	add $r0.11 = $r0.6, -32
;;
	c0	shr $r0.11 = $r0.4, $r0.11
	c0	mov $r0.12 = -1
;;
LBB8_3::                                ## %if.end
	c0	stw 0[$r0.3] = $r0.12
;;
.return ret($r0.3:s32)
	c0	stw 4[$r0.3] = $r0.11
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
;;
	c0	add $r0.14 = $r0.16, $r0.14
	c0	mpyhs $r0.16 = $r0.13, $r0.17
	c0	mpylu $r0.13 = $r0.13, $r0.17
;;
	c0	add $r0.12 = $r0.18, $r0.12
;;
	c0	add $r0.13 = $r0.13, $r0.16
	c0	shl $r0.16 = $r0.12, $r0.11
	c0	mpyhs $r0.18 = $r0.15, $r0.17
	c0	mpylu $r0.15 = $r0.15, $r0.17
;;
	c0	shl $r0.17 = $r0.13, $r0.11
	c0	add $r0.14 = $r0.16, $r0.14
	c0	shru $r0.12 = $r0.12, $r0.11
;;
	c0	add $r0.15 = $r0.15, $r0.18
	c0	cmpltu $b0.0 = $r0.14, $r0.16
	c0	add $r0.18 = $r0.14, $r0.17
	c0	cmpltu $r0.16 = $r0.14, $r0.16
;;
	c0	shru $r0.11 = $r0.13, $r0.11
	c0	cmpltu $b0.1 = $r0.18, $r0.17
;;
	c0	mfb $r0.13 = $b0.0
	c0	add $r0.12 = $r0.12, $r0.15
	c0	cmpltu $r0.14 = $r0.18, $r0.14
;;
;;
	c0	or $r0.13 = $r0.16, $r0.13
	c0	mfb $r0.15 = $b0.1
	c0	add $r0.11 = $r0.12, $r0.11
;;
;;
	c0	or $r0.12 = $r0.14, $r0.15
	c0	and $r0.13 = $r0.13, 1
	c0	stw 0[$r0.3] = $r0.18
;;
	c0	add $r0.11 = $r0.11, $r0.13
	c0	and $r0.12 = $r0.12, 1
;;
	c0	add $r0.11 = $r0.11, $r0.12
;;
.return ret($r0.3:s32)
	c0	stw 4[$r0.3] = $r0.11
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
	c0	mpylu $r0.20 = $r0.11, $r0.12
;;
	c0	add $r0.17 = $r0.17, $r0.18
	c0	mpyhs $r0.12 = $r0.11, $r0.12
	c0	mpyhs $r0.11 = $r0.11, $r0.15
;;
	c0	shl $r0.18 = $r0.17, $r0.13
	c0	shru $r0.17 = $r0.17, $r0.13
;;
	c0	add $r0.12 = $r0.20, $r0.12
	c0	add $r0.11 = $r0.19, $r0.11
	c0	mpylu $r0.19 = $r0.14, $r0.15
	c0	mpyhs $r0.14 = $r0.14, $r0.15
;;
	c0	shl $r0.15 = $r0.11, $r0.13
	c0	add $r0.12 = $r0.18, $r0.12
;;
	c0	add $r0.14 = $r0.19, $r0.14
	c0	shru $r0.13 = $r0.11, $r0.13
	c0	cmpltu $b0.0 = $r0.12, $r0.18
	c0	add $r0.11 = $r0.12, $r0.15
;;
	c0	cmpltu $r0.18 = $r0.12, $r0.18
	c0	add $r0.14 = $r0.17, $r0.14
	c0	cmpltu $b0.1 = $r0.11, $r0.15
;;
	c0	mfb $r0.15 = $b0.0
	c0	cmpltu $r0.12 = $r0.11, $r0.12
	c0	add $r0.13 = $r0.14, $r0.13
;;
;;
	c0	or $r0.14 = $r0.18, $r0.15
	c0	mfb $r0.15 = $b0.1
	c0	cmpgt $b0.0 = $r0.16, -1
;;
;;
	c0	or $r0.12 = $r0.12, $r0.15
	c0	and $r0.14 = $r0.14, 1
;;
	c0	add $r0.13 = $r0.13, $r0.14
	c0	and $r0.12 = $r0.12, 1
;;
	c0	add $r0.12 = $r0.13, $r0.12
	c0	br $b0.0, LBB10_2
;;
## BB#1:                                ## %if.then
	c0	mov $r0.13 = 0
	c0	xor $r0.14 = $r0.11, -1
	c0	cmpeq $b0.0 = $r0.11, 0
;;
	c0	sub $r0.11 = $r0.13, $r0.11
;;
	c0	mfb $r0.13 = $b0.0
	c0	xor $r0.12 = $r0.12, -1
	c0	cmpltu $b0.0 = $r0.11, $r0.14
;;
;;
	c0	mfb $r0.14 = $b0.0
;;
;;
	c0	or $r0.13 = $r0.14, $r0.13
;;
	c0	and $r0.13 = $r0.13, 1
;;
	c0	add $r0.12 = $r0.13, $r0.12
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
.entry caller, sp=$r0.1, rl=$l0.0, asize=-192, arg() ## @sum_rot_block_row
sum_rot_block_row::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -192
;;
	c0	stw 188[$r0.1] = $r0.57
;;
	c0	stw 184[$r0.1] = $r0.58
;;
	c0	stw 180[$r0.1] = $r0.59
;;
	c0	stw 176[$r0.1] = $r0.60
;;
	c0	stw 172[$r0.1] = $r0.61
;;
	c0	stw 168[$r0.1] = $r0.62
;;
	c0	stw 164[$r0.1] = $r0.63
	c0	mov $r0.41 = 0
;;
	c0	stw 40[$r0.1] = $r0.41
	c0	mov $r0.11 = dft_waves_cos
;;
	c0	mov $r0.12 = dft_waves_sin
	c0	mov $r0.28 = rowsums
;;
	c0	stw 36[$r0.1] = $r0.28
	c0	mov $r0.29 = 31
;;
	c0	stw 32[$r0.1] = $r0.29
	c0	mov $r0.16 = 17
	c0	mov $r0.17 = 16
	c0	mov $r0.13 = 15
;;
	c0	stw 28[$r0.1] = $r0.13
	c0	mov $r0.24 = $r0.41
;;
LBB11_1::                               ## %for.cond1.preheader
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB11_2 Depth 2
	c0	stw 16[$r0.1] = $r0.24
;;
	c0	stw 20[$r0.1] = $r0.12
;;
	c0	stw 24[$r0.1] = $r0.11
	c0	mov $r0.22 = $r0.11
	c0	mov $r0.24 = $r0.12
	c0	mov $r0.25 = $r0.41
;;
	c0	mov $r0.20 = $r0.41
	c0	mov $r0.15 = $r0.41
	c0	mov $r0.23 = $r0.41
	c0	mov $r0.21 = $r0.41
;;
	c0	mov $r0.18 = $r0.41
	c0	mov $r0.14 = $r0.41
	c0	mov $r0.12 = $r0.41
	c0	mov $r0.19 = $r0.41
;;
LBB11_2::                               ## %vector.body
                                        ##   Parent Loop BB11_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	stw 124[$r0.1] = $r0.12
;;
	c0	stw 128[$r0.1] = $r0.19
;;
	c0	stw 132[$r0.1] = $r0.18
;;
	c0	stw 136[$r0.1] = $r0.14
;;
	c0	stw 140[$r0.1] = $r0.25
;;
	c0	stw 144[$r0.1] = $r0.23
;;
	c0	stw 148[$r0.1] = $r0.21
;;
	c0	stw 152[$r0.1] = $r0.22
;;
	c0	stw 160[$r0.1] = $r0.20
;;
	c0	stw 156[$r0.1] = $r0.15
	c0	add $r0.31 = $r0.28, $r0.25
;;
	c0	ldw $r0.11 = 4[$r0.22]
;;
;;
	c0	stw 120[$r0.1] = $r0.11
;;
	c0	ldw $r0.32 = 8[$r0.31]
	c0	shr $r0.33 = $r0.11, $r0.29
;;
	c0	ldw $r0.34 = 0[$r0.31]
;;
	c0	shl $r0.12 = $r0.32, $r0.16
;;
	c0	stw 108[$r0.1] = $r0.12
	c0	add $r0.32 = $r0.11, $r0.33
	c0	shr $r0.35 = $r0.12, $r0.29
;;
	c0	ldw $r0.36 = 12[$r0.31]
	c0	shl $r0.11 = $r0.34, $r0.16
;;
	c0	stw 112[$r0.1] = $r0.11
	c0	xor $r0.59 = $r0.32, $r0.33
;;
	c0	ldw $r0.31 = 4[$r0.31]
	c0	shr $r0.32 = $r0.11, $r0.29
	c0	shl $r0.47 = $r0.36, $r0.16
	c0	add $r0.33 = $r0.12, $r0.35
;;
	c0	ldw $r0.12 = 8[$r0.24]
;;
;;
	c0	stw 100[$r0.1] = $r0.12
	c0	shr $r0.34 = $r0.47, $r0.29
	c0	shl $r0.48 = $r0.31, $r0.16
	c0	add $r0.31 = $r0.11, $r0.32
;;
	c0	ldw $r0.11 = 0[$r0.24]
;;
;;
	c0	stw 104[$r0.1] = $r0.11
	c0	shr $r0.36 = $r0.12, $r0.29
	c0	shr $r0.37 = $r0.48, $r0.29
	c0	add $r0.38 = $r0.47, $r0.34
;;
	c0	ldw $r0.13 = 12[$r0.22]
;;
;;
	c0	stw 96[$r0.1] = $r0.13
	c0	shr $r0.39 = $r0.11, $r0.29
	c0	add $r0.40 = $r0.48, $r0.37
	c0	add $r0.43 = $r0.12, $r0.36
;;
	c0	ldw $r0.14 = 12[$r0.24]
;;
;;
	c0	stw 92[$r0.1] = $r0.14
	c0	mov $r0.12 = $r0.13
;;
	c0	shr $r0.45 = $r0.12, $r0.29
	c0	add $r0.46 = $r0.11, $r0.39
	c0	xor $r0.33 = $r0.33, $r0.35
	c0	ldw $r0.13 = 8[$r0.22]
;;
;;
	c0	stw 88[$r0.1] = $r0.13
	c0	mov $r0.11 = $r0.14
;;
	c0	shr $r0.35 = $r0.11, $r0.29
	c0	add $r0.49 = $r0.12, $r0.45
	c0	xor $r0.31 = $r0.31, $r0.32
	c0	ldw $r0.14 = 0[$r0.22]
;;
;;
	c0	stw 84[$r0.1] = $r0.14
	c0	mov $r0.12 = $r0.13
;;
	c0	shr $r0.32 = $r0.12, $r0.29
	c0	add $r0.51 = $r0.11, $r0.35
	c0	xor $r0.34 = $r0.38, $r0.34
	c0	ldw $r0.13 = 4[$r0.24]
;;
;;
	c0	stw 80[$r0.1] = $r0.13
	c0	shr $r0.38 = $r0.14, $r0.29
	c0	add $r0.56 = $r0.12, $r0.32
	c0	xor $r0.37 = $r0.40, $r0.37
;;
	c0	shr $r0.40 = $r0.13, $r0.29
	c0	add $r0.60 = $r0.14, $r0.38
	c0	xor $r0.39 = $r0.46, $r0.39
	c0	xor $r0.61 = $r0.49, $r0.45
;;
	c0	add $r0.45 = $r0.13, $r0.40
	c0	xor $r0.60 = $r0.60, $r0.38
	c0	xor $r0.35 = $r0.51, $r0.35
	c0	xor $r0.36 = $r0.43, $r0.36
;;
	c0	xor $r0.38 = $r0.45, $r0.40
	c0	xor $r0.62 = $r0.56, $r0.32
	c0	zxth $r0.32 = $r0.36
	c0	zxth $r0.40 = $r0.39
;;
	c0	zxth $r0.43 = $r0.62
	c0	zxth $r0.45 = $r0.60
	c0	zxth $r0.46 = $r0.35
	c0	zxth $r0.49 = $r0.59
;;
	c0	zxth $r0.51 = $r0.38
	c0	zxth $r0.56 = $r0.61
	c0	shru $r0.63 = $r0.33, $r0.17
	c0	shru $r0.12 = $r0.34, $r0.17
;;
	c0	mpyhs $r0.33 = $r0.43, $r0.63
	c0	mpylu $r0.34 = $r0.46, $r0.12
	c0	shru $r0.13 = $r0.31, $r0.17
	c0	shru $r0.19 = $r0.37, $r0.17
;;
	c0	mpylu $r0.31 = $r0.43, $r0.63
	c0	mpylu $r0.43 = $r0.51, $r0.19
	c0	shru $r0.14 = $r0.35, $r0.17
	c0	shru $r0.20 = $r0.38, $r0.17
;;
	c0	mpyhs $r0.35 = $r0.49, $r0.19
	c0	mpylu $r0.38 = $r0.32, $r0.63
;;
	c0	add $r0.21 = $r0.31, $r0.33
	c0	shru $r0.23 = $r0.36, $r0.17
	c0	mpyhs $r0.31 = $r0.32, $r0.63
	c0	mpylu $r0.32 = $r0.49, $r0.19
;;
	c0	shl $r0.37 = $r0.21, $r0.17
	c0	shru $r0.25 = $r0.39, $r0.17
	c0	mpyhs $r0.33 = $r0.46, $r0.12
	c0	mpylu $r0.36 = $r0.40, $r0.13
;;
	c0	add $r0.27 = $r0.38, $r0.31
	c0	add $r0.28 = $r0.32, $r0.35
	c0	mpyhs $r0.35 = $r0.45, $r0.13
	c0	mpylu $r0.38 = $r0.56, $r0.12
;;
	c0	add $r0.29 = $r0.34, $r0.33
	c0	shl $r0.32 = $r0.28, $r0.17
	c0	mpyhs $r0.34 = $r0.56, $r0.12
	c0	mpylu $r0.39 = $r0.45, $r0.13
;;
	c0	shl $r0.33 = $r0.29, $r0.17
	c0	sub $r0.22 = $r0.41, $r0.32
;;
	c0	stw 116[$r0.1] = $r0.22
	c0	mpyhs $r0.45 = $r0.51, $r0.19
	c0	mpyhs $r0.40 = $r0.40, $r0.13
	c0	add $r0.18 = $r0.38, $r0.34
;;
	c0	add $r0.30 = $r0.39, $r0.35
;;
	c0	add $r0.11 = $r0.43, $r0.45
	c0	add $r0.26 = $r0.36, $r0.40
	c0	shl $r0.36 = $r0.30, $r0.17
	c0	shl $r0.49 = $r0.27, $r0.17
;;
	c0	shl $r0.45 = $r0.26, $r0.17
	c0	sub $r0.51 = $r0.41, $r0.37
	c0	sub $r0.38 = $r0.41, $r0.33
	c0	shl $r0.40 = $r0.11, $r0.17
;;
	c0	sub $r0.46 = $r0.41, $r0.45
	c0	sub $r0.43 = $r0.41, $r0.40
	c0	shl $r0.34 = $r0.18, $r0.17
	c0	sub $r0.39 = $r0.41, $r0.36
;;
	c0	sub $r0.35 = $r0.41, $r0.34
	c0	sub $r0.56 = $r0.41, $r0.49
	c0	xor $r0.41 = $r0.34, -1
	c0	xor $r0.15 = $r0.49, -1
;;
	c0	cmpltu $b0.0 = $r0.35, $r0.41
;;
;;
	c0	mfb $r0.31 = $b0.0
;;
	c0	stw 76[$r0.1] = $r0.31
	c0	cmpltu $b0.0 = $r0.56, $r0.15
;;
;;
	c0	mfb $r0.15 = $b0.0
;;
	c0	stw 72[$r0.1] = $r0.15
;;
	c0	shru $r0.15 = $r0.62, $r0.17
	c0	shru $r0.41 = $r0.61, $r0.17
	c0	shru $r0.60 = $r0.60, $r0.17
	c0	shru $r0.59 = $r0.59, $r0.17
;;
	c0	xor $r0.61 = $r0.32, -1
	c0	xor $r0.62 = $r0.36, -1
;;
	c0	cmpltu $b0.0 = $r0.22, $r0.61
;;
;;
	c0	mfb $r0.22 = $b0.0
;;
	c0	stw 64[$r0.1] = $r0.22
	c0	cmpltu $b0.0 = $r0.39, $r0.62
;;
;;
	c0	mfb $r0.22 = $b0.0
;;
	c0	stw 68[$r0.1] = $r0.22
	c0	xor $r0.61 = $r0.45, -1
	c0	xor $r0.62 = $r0.37, -1
;;
	c0	cmpltu $b0.0 = $r0.46, $r0.61
;;
;;
	c0	mfb $r0.22 = $b0.0
;;
	c0	stw 60[$r0.1] = $r0.22
	c0	cmpltu $b0.0 = $r0.51, $r0.62
;;
;;
	c0	mfb $r0.22 = $b0.0
;;
	c0	stw 56[$r0.1] = $r0.22
	c0	xor $r0.61 = $r0.33, -1
	c0	xor $r0.62 = $r0.40, -1
;;
	c0	cmpltu $b0.0 = $r0.38, $r0.61
;;
;;
	c0	mfb $r0.22 = $b0.0
;;
	c0	stw 52[$r0.1] = $r0.22
	c0	cmpltu $b0.0 = $r0.43, $r0.62
;;
;;
	c0	mfb $r0.22 = $b0.0
;;
	c0	stw 48[$r0.1] = $r0.22
	c0	mpylu $r0.61 = $r0.20, $r0.19
	c0	mpylu $r0.62 = $r0.23, $r0.63
;;
	c0	mpyhs $r0.20 = $r0.20, $r0.19
	c0	mpyhs $r0.23 = $r0.23, $r0.63
	c0	cmpeq $b0.0 = $r0.45, 0
;;
;;
	c0	mfb $r0.22 = $b0.0
;;
	c0	stw 44[$r0.1] = $r0.22
	c0	cmpeq $b0.7 = $r0.49, 0
	c0	mpyhs $r0.50 = $r0.41, $r0.12
	c0	mpylu $r0.52 = $r0.25, $r0.13
;;
	c0	cmpeq $b0.4 = $r0.37, 0
	c0	cmpeq $b0.2 = $r0.33, 0
	c0	mpylu $r0.53 = $r0.14, $r0.12
	c0	mpylu $r0.41 = $r0.41, $r0.12
;;
	c0	cmpeq $b0.5 = $r0.34, 0
	c0	cmpeq $b0.0 = $r0.40, 0
	c0	mpyhs $r0.25 = $r0.25, $r0.13
	c0	mpyhs $r0.12 = $r0.14, $r0.12
;;
	c0	cmpeq $b0.3 = $r0.32, 0
	c0	cmpeq $b0.1 = $r0.36, 0
	c0	mpyhs $r0.14 = $r0.15, $r0.63
	c0	mpylu $r0.54 = $r0.60, $r0.13
;;
	c0	add $r0.31 = $r0.61, $r0.20
	c0	add $r0.23 = $r0.62, $r0.23
	c0	mpyhs $r0.13 = $r0.60, $r0.13
	c0	mpylu $r0.15 = $r0.15, $r0.63
;;
	c0	shru $r0.27 = $r0.27, $r0.17
	c0	shru $r0.20 = $r0.11, $r0.17
	c0	mpylu $r0.60 = $r0.59, $r0.19
	c0	mpyhs $r0.19 = $r0.59, $r0.19
;;
	c0	add $r0.13 = $r0.54, $r0.13
	c0	shru $r0.26 = $r0.26, $r0.17
;;
	c0	add $r0.19 = $r0.60, $r0.19
	c0	add $r0.25 = $r0.52, $r0.25
	c0	shru $r0.28 = $r0.28, $r0.17
	c0	add $r0.12 = $r0.53, $r0.12
;;
	c0	add $r0.41 = $r0.41, $r0.50
	c0	shru $r0.29 = $r0.29, $r0.17
	c0	shru $r0.18 = $r0.18, $r0.17
	c0	shru $r0.30 = $r0.30, $r0.17
;;
	c0	shru $r0.21 = $r0.21, $r0.17
	c0	add $r0.14 = $r0.15, $r0.14
	c0	ldw $r0.11 = 52[$r0.1]
;;
	c0	mtb $b0.6 = $r0.11
;;
;;
	c0	mfb $r0.15 = $b0.6
	c0	ldw $r0.11 = 48[$r0.1]
;;
	c0	mtb $b0.6 = $r0.11
;;
;;
	c0	mfb $r0.50 = $b0.6
	c0	mfb $r0.52 = $b0.2
	c0	mfb $r0.53 = $b0.0
	c0	ldw $r0.11 = 44[$r0.1]
;;
	c0	mtb $b0.0 = $r0.11
;;
;;
	c0	mfb $r0.54 = $b0.0
	c0	mfb $r0.59 = $b0.7
	c0	mfb $r0.60 = $b0.4
	c0	ldw $r0.11 = 72[$r0.1]
;;
	c0	mtb $b0.0 = $r0.11
;;
;;
	c0	mfb $r0.61 = $b0.0
	c0	ldw $r0.11 = 56[$r0.1]
;;
	c0	mtb $b0.0 = $r0.11
;;
;;
	c0	mfb $r0.62 = $b0.0
	c0	mfb $r0.63 = $b0.1
	c0	ldw $r0.11 = 64[$r0.1]
;;
	c0	mtb $b0.0 = $r0.11
;;
;;
	c0	mfb $r0.55 = $b0.0
	c0	mfb $r0.57 = $b0.5
	c0	mfb $r0.22 = $b0.3
	c0	ldw $r0.11 = 76[$r0.1]
;;
	c0	mtb $b0.0 = $r0.11
;;
;;
	c0	mfb $r0.58 = $b0.0
	c0	ldw $r0.11 = 60[$r0.1]
;;
	c0	mtb $b0.0 = $r0.11
;;
;;
	c0	mfb $r0.42 = $b0.0
	c0	ldw $r0.11 = 68[$r0.1]
;;
	c0	mtb $b0.0 = $r0.11
;;
;;
	c0	mfb $r0.44 = $b0.0
	c0	or $r0.15 = $r0.15, $r0.52
	c0	or $r0.50 = $r0.50, $r0.53
	c0	or $r0.42 = $r0.42, $r0.54
;;
	c0	mov $r0.11 = $r0.24
	c0	ldw $r0.24 = 108[$r0.1]
;;
	c0	ldw $r0.52 = 100[$r0.1]
;;
;;
	c0	xor $r0.52 = $r0.52, $r0.24
	c0	or $r0.53 = $r0.61, $r0.59
	c0	or $r0.54 = $r0.62, $r0.60
	c0	ldw $r0.59 = 96[$r0.1]
;;
;;
	c0	xor $r0.59 = $r0.59, $r0.47
	c0	ldw $r0.60 = 120[$r0.1]
;;
;;
	c0	xor $r0.60 = $r0.60, $r0.48
	c0	ldw $r0.62 = 112[$r0.1]
;;
	c0	ldw $r0.61 = 104[$r0.1]
;;
;;
	c0	xor $r0.61 = $r0.61, $r0.62
	c0	or $r0.22 = $r0.55, $r0.22
	c0	ldw $r0.55 = 92[$r0.1]
;;
;;
	c0	xor $r0.47 = $r0.55, $r0.47
	c0	ldw $r0.55 = 88[$r0.1]
;;
;;
	c0	xor $r0.55 = $r0.55, $r0.24
	c0	mov $r0.24 = $r0.11
	c0	ldw $r0.11 = 84[$r0.1]
;;
;;
	c0	xor $r0.62 = $r0.11, $r0.62
	c0	ldw $r0.11 = 80[$r0.1]
;;
;;
	c0	xor $r0.48 = $r0.11, $r0.48
	c0	or $r0.57 = $r0.58, $r0.57
	c0	or $r0.44 = $r0.44, $r0.63
	c0	add $r0.14 = $r0.21, $r0.14
;;
	c0	add $r0.13 = $r0.30, $r0.13
	c0	add $r0.11 = $r0.20, $r0.31
	c0	add $r0.20 = $r0.27, $r0.23
	c0	add $r0.19 = $r0.28, $r0.19
;;
	c0	add $r0.12 = $r0.29, $r0.12
	c0	add $r0.18 = $r0.18, $r0.41
	c0	add $r0.21 = $r0.26, $r0.25
	c0	and $r0.23 = $r0.44, 1
;;
	c0	xor $r0.25 = $r0.14, -1
	c0	xor $r0.26 = $r0.21, -1
	c0	and $r0.27 = $r0.54, 1
	c0	and $r0.28 = $r0.42, 1
;;
	c0	xor $r0.29 = $r0.13, -1
	c0	add $r0.25 = $r0.27, $r0.25
;;
	c0	add $r0.23 = $r0.23, $r0.29
	c0	add $r0.26 = $r0.28, $r0.26
	c0	and $r0.27 = $r0.50, 1
	c0	and $r0.15 = $r0.15, 1
;;
	c0	xor $r0.28 = $r0.11, -1
	c0	xor $r0.29 = $r0.12, -1
	c0	xor $r0.30 = $r0.18, -1
;;
	c0	add $r0.27 = $r0.27, $r0.28
	c0	add $r0.15 = $r0.15, $r0.29
	c0	and $r0.28 = $r0.57, 1
	c0	and $r0.29 = $r0.53, 1
;;
	c0	add $r0.28 = $r0.28, $r0.30
	c0	xor $r0.30 = $r0.20, -1
	c0	xor $r0.41 = $r0.19, -1
	c0	and $r0.22 = $r0.22, 1
;;
	c0	add $r0.29 = $r0.29, $r0.30
	c0	add $r0.22 = $r0.22, $r0.41
	c0	cmplt $b0.7 = $r0.55, 0
	c0	cmplt $b0.0 = $r0.60, 0
;;
;;
	c0	mfb $r0.30 = $b0.0
;;
	c0	stw 112[$r0.1] = $r0.30
	c0	cmplt $b0.6 = $r0.52, 0
	c0	cmplt $b0.1 = $r0.62, 0
;;
;;
	c0	mfb $r0.30 = $b0.1
;;
	c0	stw 108[$r0.1] = $r0.30
	c0	slct $r0.19 = $b0.0, $r0.22, $r0.19
	c0	cmplt $b0.3 = $r0.61, 0
;;
;;
	c0	mfb $r0.22 = $b0.3
;;
	c0	stw 84[$r0.1] = $r0.22
	c0	slct $r0.20 = $b0.6, $r0.29, $r0.20
	c0	slct $r0.13 = $b0.1, $r0.23, $r0.13
	c0	cmplt $b0.1 = $r0.47, 0
;;
;;
	c0	mfb $r0.22 = $b0.1
;;
	c0	stw 100[$r0.1] = $r0.22
	c0	cmplt $b0.2 = $r0.48, 0
;;
;;
	c0	mfb $r0.22 = $b0.2
;;
	c0	stw 104[$r0.1] = $r0.22
	c0	cmplt $b0.0 = $r0.59, 0
;;
;;
	c0	mfb $r0.22 = $b0.0
;;
	c0	stw 120[$r0.1] = $r0.22
	c0	slct $r0.14 = $b0.7, $r0.25, $r0.14
	c0	slct $r0.11 = $b0.2, $r0.27, $r0.11
	c0	slct $r0.21 = $b0.3, $r0.26, $r0.21
;;
	c0	slct $r0.18 = $b0.0, $r0.28, $r0.18
	c0	slct $r0.12 = $b0.1, $r0.15, $r0.12
	c0	shr $r0.15 = $r0.19, $r0.16
	c0	shr $r0.22 = $r0.13, $r0.16
;;
	c0	shr $r0.23 = $r0.12, $r0.16
	c0	shr $r0.25 = $r0.21, $r0.16
	c0	shr $r0.26 = $r0.20, $r0.16
	c0	shr $r0.27 = $r0.11, $r0.16
;;
	c0	shr $r0.28 = $r0.18, $r0.16
	c0	shr $r0.29 = $r0.14, $r0.16
	c0	cmpeq $b0.0 = $r0.22, -1
;;
;;
	c0	mfb $r0.30 = $b0.0
;;
	c0	stw 56[$r0.1] = $r0.30
	c0	cmpeq $b0.0 = $r0.15, -1
;;
;;
	c0	mfb $r0.30 = $b0.0
;;
	c0	stw 80[$r0.1] = $r0.30
	c0	cmpeq $b0.0 = $r0.29, -1
;;
;;
	c0	mfb $r0.30 = $b0.0
;;
	c0	stw 68[$r0.1] = $r0.30
	c0	cmpeq $b0.0 = $r0.23, -1
;;
;;
	c0	mfb $r0.30 = $b0.0
;;
	c0	stw 96[$r0.1] = $r0.30
	c0	cmpeq $b0.0 = $r0.25, -1
;;
;;
	c0	mfb $r0.30 = $b0.0
;;
	c0	stw 64[$r0.1] = $r0.30
	c0	cmpeq $b0.0 = $r0.26, -1
;;
;;
	c0	mfb $r0.30 = $b0.0
;;
	c0	stw 60[$r0.1] = $r0.30
	c0	cmpeq $b0.0 = $r0.27, -1
;;
;;
	c0	mfb $r0.30 = $b0.0
;;
	c0	stw 92[$r0.1] = $r0.30
	c0	cmpeq $b0.5 = $r0.28, -1
	c0	cmpeq $b0.0 = $r0.15, 0
;;
;;
	c0	mfb $r0.30 = $b0.0
;;
	c0	stw 72[$r0.1] = $r0.30
	c0	cmpeq $b0.0 = $r0.22, 0
;;
;;
	c0	mfb $r0.30 = $b0.0
;;
	c0	stw 76[$r0.1] = $r0.30
	c0	cmpeq $b0.0 = $r0.23, 0
;;
;;
	c0	mfb $r0.30 = $b0.0
;;
	c0	stw 88[$r0.1] = $r0.30
	c0	cmpeq $b0.4 = $r0.25, 0
	c0	cmpeq $b0.3 = $r0.26, 0
	c0	cmpeq $b0.2 = $r0.27, 0
;;
	c0	cmpeq $b0.0 = $r0.28, 0
	c0	cmpeq $b0.1 = $r0.29, 0
	c0	slct $r0.30 = $b0.6, $r0.56, $r0.49
	c0	slct $r0.37 = $b0.7, $r0.51, $r0.37
;;
;;
	c0	mfb $r0.41 = $b0.0
	c0	ldw $r0.31 = 56[$r0.1]
;;
	c0	mtb $b0.0 = $r0.31
;;
;;
	c0	mfb $r0.42 = $b0.0
	c0	mfb $r0.44 = $b0.1
	c0	mfb $r0.47 = $b0.2
	c0	cmplt $b0.1 = $r0.28, 0
;;
	c0	mfb $r0.28 = $b0.3
	c0	mfb $r0.48 = $b0.5
	c0	mfb $r0.49 = $b0.4
	c0	cmplt $b0.0 = $r0.26, 0
;;
;;
	c0	slct $r0.26 = $b0.1, $r0.48, $r0.41
	c0	ldw $r0.31 = 60[$r0.1]
;;
	c0	mtb $b0.1 = $r0.31
;;
;;
	c0	mfb $r0.41 = $b0.1
	c0	ldw $r0.31 = 84[$r0.1]
;;
	c0	mtb $b0.1 = $r0.31
;;
;;
	c0	slct $r0.45 = $b0.1, $r0.46, $r0.45
	c0	cmplt $b0.2 = $r0.25, 0
	c0	cmplt $b0.3 = $r0.29, 0
	c0	ldw $r0.25 = 64[$r0.1]
;;
	c0	mtb $b0.1 = $r0.25
;;
;;
	c0	mfb $r0.25 = $b0.1
	c0	ldw $r0.29 = 68[$r0.1]
;;
	c0	mtb $b0.1 = $r0.29
;;
;;
	c0	mfb $r0.29 = $b0.1
	c0	cmplt $b0.1 = $r0.23, 0
	c0	slct $r0.23 = $b0.2, $r0.25, $r0.49
;;
;;
	c0	slct $r0.25 = $b0.3, $r0.29, $r0.44
	c0	ldw $r0.29 = 104[$r0.1]
;;
	c0	mtb $b0.2 = $r0.29
;;
;;
	c0	slct $r0.29 = $b0.2, $r0.43, $r0.40
	c0	ldw $r0.31 = 100[$r0.1]
;;
	c0	mtb $b0.2 = $r0.31
;;
;;
	c0	slct $r0.33 = $b0.2, $r0.38, $r0.33
	c0	ldw $r0.31 = 80[$r0.1]
;;
	c0	mtb $b0.2 = $r0.31
;;
;;
	c0	mfb $r0.38 = $b0.2
	c0	ldw $r0.31 = 116[$r0.1]
;;
	c0	ldw $r0.40 = 112[$r0.1]
;;
	c0	mtb $b0.2 = $r0.40
;;
;;
	c0	slct $r0.31 = $b0.2, $r0.31, $r0.32
	c0	ldw $r0.32 = 72[$r0.1]
;;
	c0	mtb $b0.2 = $r0.32
;;
;;
	c0	mfb $r0.32 = $b0.2
	c0	ldw $r0.40 = 108[$r0.1]
;;
	c0	mtb $b0.2 = $r0.40
;;
;;
	c0	slct $r0.36 = $b0.2, $r0.39, $r0.36
	c0	cmplt $b0.2 = $r0.15, 0
	c0	ldw $r0.15 = 76[$r0.1]
;;
	c0	mtb $b0.3 = $r0.15
;;
;;
	c0	mfb $r0.15 = $b0.3
	c0	cmplt $b0.3 = $r0.27, 0
	c0	slct $r0.27 = $b0.2, $r0.38, $r0.32
	c0	ldw $r0.32 = 92[$r0.1]
;;
	c0	mtb $b0.2 = $r0.32
;;
;;
	c0	mfb $r0.32 = $b0.2
	c0	ldw $r0.38 = 96[$r0.1]
;;
	c0	mtb $b0.2 = $r0.38
;;
;;
	c0	mfb $r0.38 = $b0.2
	c0	cmplt $b0.2 = $r0.22, 0
	c0	slct $r0.22 = $b0.3, $r0.32, $r0.47
	c0	ldw $r0.32 = 88[$r0.1]
;;
	c0	mtb $b0.3 = $r0.32
;;
;;
	c0	mfb $r0.32 = $b0.3
	c0	slct $r0.28 = $b0.0, $r0.41, $r0.28
	c0	ldw $r0.41 = 40[$r0.1]
	c0	slct $r0.15 = $b0.2, $r0.42, $r0.15
;;
	c0	ldw $r0.39 = 120[$r0.1]
;;
	c0	mtb $b0.0 = $r0.39
;;
;;
	c0	slct $r0.34 = $b0.0, $r0.35, $r0.34
	c0	slct $r0.32 = $b0.1, $r0.38, $r0.32
	c0	shru $r0.35 = $r0.37, $r0.16
	c0	shru $r0.30 = $r0.30, $r0.16
;;
	c0	shru $r0.34 = $r0.34, $r0.16
	c0	shru $r0.37 = $r0.45, $r0.16
	c0	shru $r0.29 = $r0.29, $r0.16
	c0	shru $r0.33 = $r0.33, $r0.16
;;
	c0	shru $r0.31 = $r0.31, $r0.16
	c0	shru $r0.36 = $r0.36, $r0.16
	c0	mtb $b0.0 = $r0.27
;;
;;
	c0	mfb $r0.27 = $b0.0
;;
	c0	stw 120[$r0.1] = $r0.27
	c0	mtb $b0.5 = $r0.32
;;
	c0	ldw $r0.32 = 28[$r0.1]
	c0	mtb $b0.3 = $r0.15
	c0	mtb $b0.2 = $r0.26
	c0	mtb $b0.7 = $r0.28
;;
	c0	ldw $r0.28 = 36[$r0.1]
	c0	mtb $b0.6 = $r0.22
;;
	c0	ldw $r0.22 = 152[$r0.1]
	c0	mtb $b0.0 = $r0.23
;;
	c0	ldw $r0.23 = 144[$r0.1]
	c0	mtb $b0.4 = $r0.25
;;
	c0	ldw $r0.25 = 140[$r0.1]
;;
;;
	c0	add $r0.25 = $r0.25, 16
	c0	add $r0.24 = $r0.24, 16
;;
	c0	cmpne $b0.1 = $r0.25, 96
;;
;;
	c0	mfb $r0.15 = $b0.1
;;
	c0	stw 140[$r0.1] = $r0.15
	c0	add $r0.22 = $r0.22, 16
;;
	c0	shl $r0.15 = $r0.20, $r0.32
	c0	shl $r0.12 = $r0.12, $r0.32
	c0	shl $r0.13 = $r0.13, $r0.32
	c0	shl $r0.19 = $r0.19, $r0.32
;;
	c0	shl $r0.14 = $r0.14, $r0.32
	c0	shl $r0.18 = $r0.18, $r0.32
	c0	shl $r0.20 = $r0.21, $r0.32
	c0	ldw $r0.21 = 148[$r0.1]
;;
	c0	shl $r0.11 = $r0.11, $r0.32
	c0	or $r0.15 = $r0.30, $r0.15
;;
	c0	or $r0.11 = $r0.29, $r0.11
	c0	ldw $r0.29 = 32[$r0.1]
	c0	or $r0.12 = $r0.33, $r0.12
	c0	or $r0.13 = $r0.36, $r0.13
;;
	c0	or $r0.19 = $r0.31, $r0.19
	c0	or $r0.14 = $r0.35, $r0.14
	c0	or $r0.18 = $r0.34, $r0.18
	c0	or $r0.20 = $r0.37, $r0.20
;;
	c0	slct $r0.15 = $b0.7, $r0.15, 0
	c0	slct $r0.20 = $b0.0, $r0.20, 0
	c0	slct $r0.11 = $b0.6, $r0.11, 0
	c0	slct $r0.12 = $b0.5, $r0.12, 0
;;
	c0	add $r0.23 = $r0.15, $r0.23
	c0	ldw $r0.15 = 156[$r0.1]
	c0	add $r0.21 = $r0.12, $r0.21
;;
	c0	ldw $r0.12 = 160[$r0.1]
;;
;;
	c0	add $r0.12 = $r0.20, $r0.12
;;
	c0	stw 160[$r0.1] = $r0.12
;;
	c0	ldw $r0.20 = 160[$r0.1]
	c0	add $r0.15 = $r0.11, $r0.15
	c0	slct $r0.11 = $b0.3, $r0.13, 0
;;
	c0	ldw $r0.12 = 120[$r0.1]
;;
	c0	mtb $b0.0 = $r0.12
;;
;;
	c0	slct $r0.12 = $b0.0, $r0.19, 0
	c0	ldw $r0.19 = 128[$r0.1]
	c0	slct $r0.13 = $b0.4, $r0.14, 0
	c0	slct $r0.14 = $b0.2, $r0.18, 0
;;
	c0	ldw $r0.18 = 132[$r0.1]
;;
;;
	c0	add $r0.18 = $r0.11, $r0.18
	c0	add $r0.19 = $r0.14, $r0.19
	c0	ldw $r0.14 = 136[$r0.1]
;;
;;
	c0	add $r0.14 = $r0.12, $r0.14
	c0	ldw $r0.12 = 124[$r0.1]
;;
;;
	c0	add $r0.12 = $r0.13, $r0.12
	c0	ldw $r0.11 = 140[$r0.1]
;;
	c0	mtb $b0.0 = $r0.11
;;
;;
	c0	br $b0.0, LBB11_2
;;
## BB#3:                                ## %middle.block
                                        ##   in Loop: Header=BB11_1 Depth=1
	c0	mov $r0.11 = 12
	c0	add $r0.12 = $r0.18, $r0.12
	c0	add $r0.13 = $r0.20, $r0.23
	c0	add $r0.14 = $r0.14, $r0.19
;;
	c0	add $r0.15 = $r0.15, $r0.21
	c0	add $r0.12 = $r0.12, $r0.14
;;
	c0	add $r0.13 = $r0.13, $r0.15
	c0	shr $r0.14 = $r0.12, $r0.11
	c0	shr $r0.12 = $r0.12, $r0.29
	c0	mov $r0.15 = 5
;;
	c0	shr $r0.11 = $r0.13, $r0.11
	c0	shr $r0.13 = $r0.13, $r0.29
	c0	add $r0.14 = $r0.14, $r0.12
;;
	c0	add $r0.11 = $r0.11, $r0.13
	c0	xor $r0.12 = $r0.14, $r0.12
;;
	c0	xor $r0.11 = $r0.11, $r0.13
	c0	shru $r0.13 = $r0.12, $r0.17
	c0	zxth $r0.12 = $r0.12
;;
	c0	mpyhs $r0.14 = $r0.13, $r0.12
	c0	mpylu $r0.18 = $r0.13, $r0.12
	c0	shru $r0.19 = $r0.11, $r0.17
	c0	zxth $r0.11 = $r0.11
;;
	c0	mpyhs $r0.20 = $r0.19, $r0.11
	c0	mpylu $r0.21 = $r0.19, $r0.11
;;
	c0	add $r0.14 = $r0.18, $r0.14
;;
	c0	add $r0.18 = $r0.21, $r0.20
	c0	mpylu $r0.20 = $r0.12, $r0.12
	c0	mpylu $r0.21 = $r0.11, $r0.11
	c0	shl $r0.22 = $r0.14, $r0.17
;;
	c0	mpyhs $r0.12 = $r0.12, $r0.12
	c0	mpyhs $r0.11 = $r0.11, $r0.11
	c0	shl $r0.23 = $r0.18, $r0.17
	c0	shru $r0.18 = $r0.18, $r0.32
;;
;;
	c0	add $r0.11 = $r0.21, $r0.11
	c0	add $r0.12 = $r0.20, $r0.12
	c0	mpylu $r0.20 = $r0.13, $r0.13
	c0	mpylu $r0.21 = $r0.19, $r0.19
;;
	c0	add $r0.11 = $r0.23, $r0.11
	c0	add $r0.12 = $r0.22, $r0.12
	c0	mpyhs $r0.19 = $r0.19, $r0.19
	c0	mpyhs $r0.13 = $r0.13, $r0.13
;;
	c0	cmpltu $b0.0 = $r0.12, $r0.22
	c0	cmpltu $b0.1 = $r0.11, $r0.23
	c0	add $r0.24 = $r0.11, $r0.23
	c0	add $r0.25 = $r0.12, $r0.22
;;
	c0	cmpltu $b0.2 = $r0.24, $r0.23
	c0	cmpltu $b0.3 = $r0.25, $r0.22
	c0	cmpltu $r0.22 = $r0.12, $r0.22
	c0	cmpltu $r0.23 = $r0.11, $r0.23
;;
	c0	mfb $r0.26 = $b0.0
	c0	mfb $r0.27 = $b0.1
	c0	cmpltu $r0.12 = $r0.25, $r0.12
	c0	cmpltu $r0.11 = $r0.24, $r0.11
;;
;;
	c0	or $r0.23 = $r0.23, $r0.27
	c0	or $r0.22 = $r0.22, $r0.26
	c0	mfb $r0.26 = $b0.3
	c0	mfb $r0.27 = $b0.2
;;
	c0	add $r0.19 = $r0.21, $r0.19
;;
	c0	or $r0.12 = $r0.12, $r0.26
	c0	or $r0.11 = $r0.11, $r0.27
	c0	add $r0.13 = $r0.20, $r0.13
	c0	shru $r0.14 = $r0.14, $r0.32
;;
	c0	and $r0.20 = $r0.23, 1
	c0	and $r0.21 = $r0.22, 1
	c0	and $r0.12 = $r0.12, 1
;;
	c0	add $r0.19 = $r0.20, $r0.19
	c0	add $r0.13 = $r0.21, $r0.13
	c0	and $r0.11 = $r0.11, 1
;;
	c0	and $r0.18 = $r0.18, 131070
	c0	add $r0.12 = $r0.13, $r0.12
	c0	add $r0.11 = $r0.19, $r0.11
;;
	c0	and $r0.13 = $r0.14, 131070
	c0	shru $r0.14 = $r0.24, $r0.15
	c0	add $r0.11 = $r0.11, $r0.18
;;
	c0	add $r0.12 = $r0.12, $r0.13
	c0	shru $r0.13 = $r0.25, $r0.15
;;
	c0	shr $r0.18 = $r0.12, $r0.15
	c0	shr $r0.15 = $r0.11, $r0.15
	c0	mov $r0.19 = 27
	c0	ldw $r0.24 = 16[$r0.1]
;;
;;
	c0	mpylu $r0.20 = $r0.24, 96
	c0	cmpeq $b0.0 = $r0.15, -1
	c0	cmpeq $b0.1 = $r0.18, -1
	c0	cmpeq $b0.2 = $r0.18, 0
;;
	c0	cmpeq $b0.3 = $r0.15, 0
	c0	cmplt $b0.4 = $r0.15, 0
;;
	c0	mfb $r0.15 = $b0.2
;;
	c0	mfb $r0.21 = $b0.3
	c0	mfb $r0.22 = $b0.1
	c0	mfb $r0.23 = $b0.0
	c0	cmplt $b0.0 = $r0.18, 0
;;
	c0	shl $r0.11 = $r0.11, $r0.19
	c0	shl $r0.12 = $r0.12, $r0.19
;;
	c0	slct $r0.18 = $b0.4, $r0.23, $r0.21
	c0	slct $r0.15 = $b0.0, $r0.22, $r0.15
	c0	or $r0.12 = $r0.12, $r0.13
	c0	or $r0.11 = $r0.11, $r0.14
;;
	c0	mpyhs $r0.13 = $r0.24, 96
	c0	mtb $b0.0 = $r0.18
	c0	mtb $b0.1 = $r0.15
	c0	add $r0.24 = $r0.24, 1
;;
;;
	c0	add $r0.13 = $r0.20, $r0.13
	c0	slct $r0.11 = $b0.0, $r0.11, 0
	c0	slct $r0.12 = $b0.1, $r0.12, 0
;;
	c0	add $r0.11 = $r0.11, $r0.12
	c0	add $r0.12 = $r0.3, $r0.13
;;
	c0	stw 0[$r0.12] = $r0.11
;;
	c0	ldw $r0.12 = 20[$r0.1]
;;
;;
	c0	add $r0.12 = $r0.12, 96
	c0	ldw $r0.11 = 24[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 96
	c0	cmpne $b0.0 = $r0.24, 4
;;
;;
	c0	br $b0.0, LBB11_1
;;
## BB#4:                                ## %for.end44
	c0	ldw $r0.63 = 164[$r0.1]
;;
	c0	ldw $r0.62 = 168[$r0.1]
;;
	c0	ldw $r0.61 = 172[$r0.1]
;;
	c0	ldw $r0.60 = 176[$r0.1]
;;
	c0	ldw $r0.59 = 180[$r0.1]
;;
	c0	ldw $r0.58 = 184[$r0.1]
;;
.return ret($r0.3:s32)
	c0	ldw $r0.57 = 188[$r0.1]
	c0	return $r0.1 = $r0.1, 192, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-416, arg() ## @main
main::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -416
;;
	c0	stw 412[$r0.1] = $r0.57
;;
	c0	stw 408[$r0.1] = $l0.0
	c0	add $r0.57 = $r0.1, 24
;;
	c0	mov $r0.3 = $r0.57
;;
.call sum_rot_block_row, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = sum_rot_block_row
;;
	c0	mov $r0.13 = powers_temp
	c0	ldw $r0.11 = 24[$r0.1]
;;
	c0	ldw $r0.12 = 0[$r0.13]
;;
;;
	c0	cmpne $b0.0 = $r0.11, $r0.12
;;
;;
	c0	br $b0.0, LBB12_2
;;
## BB#1:                                ## %for.cond
	c0	ldw $r0.11 = 120[$r0.1]
	c0	add $r0.14 = $r0.1, 24
;;
	c0	ldw $r0.12 = 96[$r0.13]
	c0	add $r0.57 = $r0.14, 96
;;
;;
	c0	cmpeq $b0.0 = $r0.11, $r0.12
;;
;;
	c0	brf $b0.0, LBB12_2
;;
## BB#4:                                ## %for.cond.1
	c0	ldw $r0.11 = 216[$r0.1]
;;
	c0	ldw $r0.12 = 192[$r0.13]
	c0	add $r0.57 = $r0.14, 192
;;
;;
	c0	cmpne $b0.0 = $r0.11, $r0.12
;;
;;
	c0	br $b0.0, LBB12_2
;;
## BB#5:                                ## %for.cond.2
	c0	ldw $r0.11 = 312[$r0.1]
;;
	c0	ldw $r0.12 = 288[$r0.13]
	c0	add $r0.57 = $r0.14, 288
;;
;;
	c0	cmpne $b0.0 = $r0.11, $r0.12
;;
;;
	c0	br $b0.0, LBB12_2
;;
## BB#6:                                ## %for.cond.3
	c0	mov $r0.57 = -1
	c0	mov $r0.3 = str
;;
.call puts, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = puts
;;
	c0	goto LBB12_3
;;
LBB12_2::                               ## %if.then
	c0	mov $r0.3 = .str
	c0	mov $r0.4 = $r0.11
	c0	mov $r0.5 = $r0.12
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	ldw $r0.57 = 0[$r0.57]
;;
LBB12_3::                               ## %cleanup
	c0	mov $r0.3 = $r0.57
	c0	ldw $l0.0 = 408[$r0.1]
;;
	c0	ldw $r0.57 = 412[$r0.1]
;;
;;
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 416, $l0.0
;;
.endp

.section .data
	.align	4                       ## @rowsums
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

	.align	4                       ## @dft_waves_cos
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

	.align	4                       ## @dft_waves_sin
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

	.align	4                       ## @powers_temp
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
	.data4	19271                   ## 0x4b47
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

	.section	.data
.str::                                  ## @.str
	.data1 70
	.data1 97
	.data1 105
	.data1 108
	.data1 101
	.data1 100
	.data1 32
	.data1 116
	.data1 111
	.data1 32
	.data1 99
	.data1 111
	.data1 109
	.data1 112
	.data1 108
	.data1 101
	.data1 116
	.data1 101
	.data1 58
	.data1 32
	.data1 37
	.data1 100
	.data1 32
	.data1 33
	.data1 61
	.data1 32
	.data1 37
	.data1 100
	.data1 10
	.data1 0
.skip 2

	.section	.data
	.align	4                       ## @str
str::
	.data1 83
	.data1 117
	.data1 99
	.data1 99
	.data1 101
	.data1 115
	.data1 115
	.data1 33
	.data1 0
.skip 7

.import printf
.type printf, @function

.import puts
.type puts, @function
