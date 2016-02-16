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
.return ret($r0.3:s32)
	c0	shr $r0.4 = $r0.3, $r0.11
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @add
add::
## BB#0:                                ## %entry
	c0	add $r0.11 = $r0.6, $r0.4
;;
	c0	cmpltu $b0.0 = $r0.11, $r0.6
	c0	cmpltu $r0.12 = $r0.11, $r0.6
;;
;;
	c0	mfb $r0.13 = $b0.0
;;
	c0	or $r0.12 = $r0.12, $r0.13
	c0	add $r0.13 = $r0.5, $r0.3
;;
	c0	and $r0.12 = $r0.12, 1
;;
	c0	add $r0.4 = $r0.13, $r0.12
	c0	mov $r0.3 = $r0.11
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @neg
neg::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $r0.57
;;
	c0	stw 24[$r0.1] = $r0.58
;;
	c0	stw 20[$r0.1] = $l0.0
	c0	mov $r0.57 = $r0.4
;;
	c0	mov $r0.58 = $r0.3
	c0	mov $r0.3 = 1
;;
.call cast, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = cast
;;
	c0	mov $r0.6 = $r0.3
	c0	mov $r0.5 = $r0.4
;;
	c0	xor $r0.3 = $r0.58, -1
	c0	xor $r0.4 = $r0.57, -1
;;
	c0	call $l0.0 = add
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
.return ret($r0.3:s32)
	c0	mov $r0.4 = 0
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
;;
	c0	br $b0.0, LBB7_2
;;
## BB#1:                                ## %if.then
	c0	mov $r0.11 = 32
;;
	c0	sub $r0.11 = $r0.11, $r0.5
;;
	c0	shru $r0.12 = $r0.4, $r0.11
	c0	shl $r0.13 = $r0.3, $r0.5
;;
	c0	shl $r0.11 = $r0.4, $r0.5
	c0	or $r0.12 = $r0.12, $r0.13
;;
	c0	mov $r0.13 = 0
	c0	goto LBB7_3
;;
LBB7_2::                                ## %if.else
	c0	mov $r0.11 = 0
	c0	add $r0.12 = $r0.5, -32
;;
	c0	shl $r0.12 = $r0.4, $r0.12
	c0	mov $r0.13 = $r0.11
;;
LBB7_3::                                ## %if.end
	c0	or $r0.4 = $r0.13, $r0.12
	c0	mov $r0.3 = $r0.11
;;
.return ret($r0.3:s32)
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
;;
	c0	br $b0.0, LBB8_2
;;
## BB#1:                                ## %if.then
	c0	mov $r0.11 = 32
;;
	c0	sub $r0.11 = $r0.11, $r0.5
;;
	c0	shl $r0.12 = $r0.3, $r0.11
	c0	shru $r0.13 = $r0.4, $r0.5
;;
	c0	shr $r0.11 = $r0.3, $r0.5
	c0	or $r0.12 = $r0.12, $r0.13
;;
	c0	mov $r0.13 = 0
	c0	goto LBB8_3
;;
LBB8_2::                                ## %if.else
	c0	add $r0.11 = $r0.5, -32
;;
	c0	shr $r0.12 = $r0.3, $r0.11
	c0	mov $r0.11 = -1
;;
	c0	mov $r0.13 = 0
;;
LBB8_3::                                ## %if.end
	c0	or $r0.3 = $r0.12, $r0.13
	c0	mov $r0.4 = $r0.11
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @umult
umult::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 60[$r0.1] = $r0.57
;;
	c0	stw 56[$r0.1] = $r0.58
;;
	c0	stw 52[$r0.1] = $r0.59
;;
	c0	stw 48[$r0.1] = $r0.60
;;
	c0	stw 44[$r0.1] = $r0.61
;;
	c0	stw 40[$r0.1] = $r0.62
;;
	c0	stw 36[$r0.1] = $r0.63
;;
	c0	stw 32[$r0.1] = $l0.0
	c0	mov $r0.57 = $r0.3
;;
	c0	mov $r0.58 = 16
	c0	zxth $r0.11 = $r0.57
;;
	c0	zxth $r0.59 = $r0.4
	c0	shru $r0.60 = $r0.4, $r0.58
;;
	c0	mpylu $r0.12 = $r0.59, $r0.11
	c0	mpyhs $r0.13 = $r0.59, $r0.11
;;
	c0	mpylu $r0.61 = $r0.60, $r0.11
;;
	c0	add $r0.3 = $r0.12, $r0.13
	c0	mpyhs $r0.62 = $r0.60, $r0.11
;;
.call ucast, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = ucast
;;
	c0	stw 28[$r0.1] = $r0.3
	c0	mov $r0.63 = $r0.4
;;
	c0	add $r0.3 = $r0.61, $r0.62
;;
.call ucast, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = ucast
;;
	c0	mov $r0.11 = $r0.3
	c0	mov $r0.3 = $r0.4
;;
	c0	mov $r0.4 = $r0.11
	c0	mov $r0.5 = $r0.58
;;
.call sll, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = sll
;;
	c0	mov $r0.6 = $r0.3
	c0	mov $r0.5 = $r0.4
;;
	c0	shru $r0.57 = $r0.57, $r0.58
;;
	c0	mpylu $r0.61 = $r0.59, $r0.57
	c0	mpyhs $r0.59 = $r0.59, $r0.57
;;
	c0	mov $r0.3 = $r0.63
	c0	ldw $r0.4 = 28[$r0.1]
;;
.call add, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = add
;;
	c0	mov $r0.62 = $r0.3
	c0	mov $r0.63 = $r0.4
;;
	c0	add $r0.3 = $r0.61, $r0.59
;;
.call ucast, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = ucast
;;
	c0	mov $r0.11 = $r0.3
	c0	mov $r0.3 = $r0.4
;;
	c0	mov $r0.4 = $r0.11
	c0	mov $r0.5 = $r0.58
;;
.call sll, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = sll
;;
	c0	mov $r0.6 = $r0.3
	c0	mov $r0.5 = $r0.4
;;
	c0	mpylu $r0.58 = $r0.60, $r0.57
	c0	mpyhs $r0.57 = $r0.60, $r0.57
;;
	c0	mov $r0.3 = $r0.63
	c0	mov $r0.4 = $r0.62
;;
.call add, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = add
;;
	c0	mov $r0.59 = $r0.3
	c0	mov $r0.60 = $r0.4
;;
	c0	add $r0.3 = $r0.58, $r0.57
;;
.call ucast, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = ucast
;;
	c0	mov $r0.11 = $r0.3
	c0	mov $r0.5 = 32
;;
	c0	mov $r0.3 = $r0.4
	c0	mov $r0.4 = $r0.11
;;
.call sll, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = sll
;;
	c0	mov $r0.6 = $r0.3
	c0	mov $r0.5 = $r0.4
;;
	c0	mov $r0.3 = $r0.60
	c0	mov $r0.4 = $r0.59
;;
	c0	call $l0.0 = add
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @mult
mult::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $r0.57
;;
	c0	stw 24[$r0.1] = $r0.58
;;
	c0	stw 20[$r0.1] = $l0.0
	c0	mov $r0.57 = $r0.4
;;
	c0	mov $r0.58 = $r0.3
	c0	mov $r0.11 = 31
;;
	c0	shr $r0.12 = $r0.57, $r0.11
	c0	shr $r0.11 = $r0.58, $r0.11
;;
	c0	add $r0.13 = $r0.57, $r0.12
	c0	add $r0.14 = $r0.58, $r0.11
;;
	c0	xor $r0.4 = $r0.13, $r0.12
	c0	xor $r0.3 = $r0.14, $r0.11
;;
.call umult, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = umult
;;
	c0	xor $r0.12 = $r0.57, $r0.58
	c0	mov $r0.11 = $r0.3
;;
	c0	cmpgt $b0.0 = $r0.12, -1
	c0	mov $r0.12 = $r0.4
;;
;;
	c0	br $b0.0, LBB10_2
;;
## BB#1:                                ## %if.then
	c0	mov $r0.3 = $r0.4
	c0	mov $r0.4 = $r0.11
;;
.call neg, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = neg
;;
	c0	mov $r0.12 = $r0.4
	c0	mov $r0.11 = $r0.3
;;
LBB10_2::                               ## %if.end
	c0	mov $r0.3 = $r0.11
	c0	mov $r0.4 = $r0.12
;;
	c0	ldw $l0.0 = 20[$r0.1]
;;
	c0	ldw $r0.58 = 24[$r0.1]
;;
	c0	ldw $r0.57 = 28[$r0.1]
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg() ## @sum_rot_block_row
sum_rot_block_row::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -96
;;
	c0	stw 92[$r0.1] = $r0.57
;;
	c0	stw 88[$r0.1] = $r0.58
;;
	c0	stw 84[$r0.1] = $r0.59
;;
	c0	stw 80[$r0.1] = $r0.60
;;
	c0	stw 76[$r0.1] = $r0.61
;;
	c0	stw 72[$r0.1] = $r0.62
;;
	c0	stw 68[$r0.1] = $r0.63
;;
	c0	stw 64[$r0.1] = $l0.0
;;
	c0	stw 28[$r0.1] = $r0.3
	c0	mov $r0.11 = 0
;;
	c0	stw 32[$r0.1] = $r0.11
;;
	c0	stw 32[$r0.1] = $r0.11
;;
	c0	mov $r0.59 = dft_waves_cos
;;
	c0	mov $r0.60 = dft_waves_sin
;;
	c0	mov $r0.61 = rowsums
;;
	c0	stw 56[$r0.1] = $r0.61
	c0	mov $r0.62 = 17
;;
	c0	mov $r0.14 = 12
;;
	c0	stw 52[$r0.1] = $r0.14
	c0	mov $r0.14 = 5
;;
	c0	stw 48[$r0.1] = $r0.14
	c0	mov $r0.14 = $r0.11
;;
LBB11_1::                               ## %for.cond1.preheader
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB11_2 Depth 2
	c0	stw 36[$r0.1] = $r0.14
;;
	c0	stw 40[$r0.1] = $r0.60
;;
	c0	stw 44[$r0.1] = $r0.59
;;
	c0	ldw $r0.63 = 32[$r0.1]
;;
;;
	c0	mov $r0.58 = $r0.63
	c0	mov $r0.57 = $r0.63
;;
LBB11_2::                               ## %for.body3
                                        ##   Parent Loop BB11_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	add $r0.11 = $r0.61, $r0.58
	c0	ldw $r0.4 = 0[$r0.59]
;;
	c0	ldw $r0.11 = 0[$r0.11]
;;
;;
	c0	shl $r0.61 = $r0.11, $r0.62
;;
	c0	mov $r0.3 = $r0.61
;;
.call mult, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = mult
;;
	c0	mov $r0.11 = $r0.3
	c0	mov $r0.3 = $r0.4
;;
	c0	mov $r0.4 = $r0.11
	c0	mov $r0.5 = $r0.62
;;
.call sra, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = sra
;;
	c0	mov $r0.11 = $r0.3
	c0	mov $r0.3 = $r0.4
;;
	c0	mov $r0.4 = $r0.11
;;
.call cast_int32, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = cast_int32
;;
	c0	stw 60[$r0.1] = $r0.3
;;
	c0	ldw $r0.4 = 0[$r0.60]
	c0	mov $r0.3 = $r0.61
;;
.call mult, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	ldw $r0.61 = 56[$r0.1]
	c0	call $l0.0 = mult
;;
	c0	mov $r0.11 = $r0.3
	c0	mov $r0.3 = $r0.4
;;
	c0	mov $r0.4 = $r0.11
	c0	mov $r0.5 = $r0.62
;;
.call sra, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = sra
;;
	c0	mov $r0.11 = $r0.3
	c0	mov $r0.3 = $r0.4
;;
	c0	mov $r0.4 = $r0.11
;;
.call cast_int32, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = cast_int32
;;
	c0	add $r0.58 = $r0.58, 4
	c0	add $r0.63 = $r0.3, $r0.63
;;
	c0	ldw $r0.11 = 60[$r0.1]
;;
;;
	c0	add $r0.57 = $r0.11, $r0.57
	c0	cmpne $b0.0 = $r0.58, 96
;;
	c0	add $r0.59 = $r0.59, 4
	c0	add $r0.60 = $r0.60, 4
;;
	c0	br $b0.0, LBB11_2
;;
## BB#3:                                ## %for.end
                                        ##   in Loop: Header=BB11_1 Depth=1
	c0	ldw $r0.58 = 52[$r0.1]
;;
;;
	c0	stw 52[$r0.1] = $r0.58
	c0	shr $r0.11 = $r0.57, $r0.58
;;
	c0	mov $r0.3 = $r0.11
	c0	mov $r0.4 = $r0.11
;;
.call mult, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = mult
;;
	c0	mov $r0.11 = $r0.3
	c0	mov $r0.3 = $r0.4
;;
	c0	mov $r0.4 = $r0.11
	c0	ldw $r0.59 = 48[$r0.1]
;;
;;
	c0	stw 48[$r0.1] = $r0.59
	c0	mov $r0.5 = $r0.59
;;
.call sra, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = sra
;;
	c0	mov $r0.11 = $r0.3
	c0	mov $r0.3 = $r0.4
;;
	c0	mov $r0.4 = $r0.11
;;
.call cast_int32, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = cast_int32
;;
	c0	mov $r0.57 = $r0.3
	c0	shr $r0.11 = $r0.63, $r0.58
;;
	c0	mov $r0.3 = $r0.11
	c0	mov $r0.4 = $r0.11
;;
.call mult, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = mult
;;
	c0	mov $r0.11 = $r0.3
	c0	mov $r0.3 = $r0.4
;;
	c0	mov $r0.4 = $r0.11
	c0	mov $r0.5 = $r0.59
;;
.call sra, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = sra
;;
	c0	mov $r0.11 = $r0.3
	c0	mov $r0.3 = $r0.4
;;
	c0	mov $r0.4 = $r0.11
;;
.call cast_int32, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = cast_int32
;;
	c0	ldw $r0.14 = 36[$r0.1]
;;
;;
	c0	mpylu $r0.11 = $r0.14, 96
	c0	mpyhs $r0.12 = $r0.14, 96
;;
	c0	add $r0.14 = $r0.14, 1
;;
	c0	add $r0.11 = $r0.11, $r0.12
	c0	add $r0.12 = $r0.3, $r0.57
;;
	c0	ldw $r0.13 = 28[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.13, $r0.11
;;
	c0	stw 0[$r0.11] = $r0.12
;;
	c0	ldw $r0.60 = 40[$r0.1]
;;
;;
	c0	add $r0.60 = $r0.60, 96
	c0	ldw $r0.59 = 44[$r0.1]
;;
;;
	c0	add $r0.59 = $r0.59, 96
	c0	cmpne $b0.0 = $r0.14, 4
;;
;;
	c0	br $b0.0, LBB11_1
;;
## BB#4:                                ## %for.end52
	c0	ldw $l0.0 = 64[$r0.1]
;;
	c0	ldw $r0.63 = 68[$r0.1]
;;
	c0	ldw $r0.62 = 72[$r0.1]
;;
	c0	ldw $r0.61 = 76[$r0.1]
;;
	c0	ldw $r0.60 = 80[$r0.1]
;;
	c0	ldw $r0.59 = 84[$r0.1]
;;
	c0	ldw $r0.58 = 88[$r0.1]
;;
.return ret($r0.3:s32)
	c0	ldw $r0.57 = 92[$r0.1]
	c0	return $r0.1 = $r0.1, 96, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-448, arg() ## @main
main::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -448
;;
	c0	stw 428[$r0.1] = $r0.57
;;
	c0	stw 424[$r0.1] = $r0.58
;;
	c0	stw 420[$r0.1] = $r0.59
;;
	c0	stw 416[$r0.1] = $r0.60
;;
	c0	stw 412[$r0.1] = $l0.0
;;
	c0	mov $r0.57 = __stack_chk_guard
;;
	c0	mov $r0.58 = powers_temp
;;
	c0	ldw $r0.11 = 0[$r0.57]
	c0	mov $r0.59 = 0
;;
;;
	c0	stw 408[$r0.1] = $r0.11
;;
	c0	add $r0.60 = $r0.1, 24
;;
	c0	mov $r0.3 = $r0.60
;;
.call sum_rot_block_row, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = sum_rot_block_row
;;
	c0	mov $r0.11 = 1
	c0	mov $r0.12 = $r0.59
;;
LBB12_1::                               ## %for.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.13 = 0[$r0.58]
;;
	c0	ldw $r0.14 = 0[$r0.60]
;;
;;
	c0	cmpne $b0.0 = $r0.14, $r0.13
	c0	mov $r0.13 = $r0.59
;;
;;
	c0	br $b0.0, LBB12_3
;;
## BB#2:                                ## %for.inc
                                        ##   in Loop: Header=BB12_1 Depth=1
	c0	add $r0.12 = $r0.12, 1
	c0	add $r0.60 = $r0.60, 96
;;
	c0	add $r0.59 = $r0.59, 100
	c0	add $r0.58 = $r0.58, 96
;;
	c0	cmplt $b0.0 = $r0.12, 4
	c0	mov $r0.13 = $r0.11
;;
;;
	c0	br $b0.0, LBB12_1
;;
LBB12_3::                               ## %cleanup
	c0	ldw $r0.11 = 408[$r0.1]
;;
	c0	ldw $r0.12 = 0[$r0.57]
;;
;;
	c0	sub $r0.11 = $r0.12, $r0.11
;;
	c0	cmpne $r0.11 = $r0.11, 0
;;
	c0	mtb $b0.0 = $r0.11
;;
;;
	c0	br $b0.0, LBB12_4
;;
## BB#5:                                ## %cleanup
	c0	mov $r0.3 = $r0.13
;;
	c0	ldw $l0.0 = 412[$r0.1]
;;
	c0	ldw $r0.60 = 416[$r0.1]
;;
	c0	ldw $r0.59 = 420[$r0.1]
;;
	c0	ldw $r0.58 = 424[$r0.1]
;;
	c0	ldw $r0.57 = 428[$r0.1]
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 448, $l0.0
;;
LBB12_4::                               ## %cleanup
.call __stack_chk_fail, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = __stack_chk_fail
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


