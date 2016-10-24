.section .text
#.globl shift32RightJamming
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @shift32RightJamming
shift32RightJamming::
## BB#0:                                ## %entry
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB0_4
;;
## BB#1:                                ## %if.else
	c0	cmpgt $b0.0 = $r0.4, 31
;;
;;
	c0	br $b0.0, LBB0_3
;;
## BB#2:                                ## %if.then.2
	c0	mov $r0.2 = 0
;;
	c0	sub $r0.2 = $r0.2, $r0.4
;;
	c0	and $r0.2 = $r0.2, 31
;;
	c0	shl $r0.2 = $r0.3, $r0.2
;;
	c0	cmpne $b0.0 = $r0.2, 0
	c0	shru $r0.2 = $r0.3, $r0.4
;;
;;
	c0	mfb $r0.3 = $b0.0
;;
	c0	or $r0.3 = $r0.3, $r0.2
;;
.return ret()
	c0	stw 0[$r0.5] = $r0.3
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB0_3:                                 ## %if.else.4
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	mfb $r0.3 = $b0.0
;;
LBB0_4:                                 ## %if.end.7
.return ret()
	c0	stw 0[$r0.5] = $r0.3
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl shift64Right
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @shift64Right
shift64Right::
## BB#0:                                ## %entry
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB1_1
;;
## BB#2:                                ## %if.else
	c0	cmpgt $b0.0 = $r0.5, 31
	c0	mov $r0.2 = 0
;;
;;
	c0	br $b0.0, LBB1_4
;;
## BB#3:                                ## %if.then.2
	c0	sub $r0.2 = $r0.2, $r0.5
	c0	shru $r0.4 = $r0.4, $r0.5
;;
	c0	and $r0.8 = $r0.2, 31
	c0	shru $r0.2 = $r0.3, $r0.5
;;
	c0	shl $r0.3 = $r0.3, $r0.8
;;
	c0	or $r0.4 = $r0.3, $r0.4
	c0	goto LBB1_5
;;
LBB1_1:
	c0	mov $r0.2 = $r0.3
	c0	goto LBB1_5
;;
LBB1_4:                                 ## %if.else.4
	c0	and $r0.4 = $r0.5, 31
	c0	cmplt $b0.0 = $r0.5, 64
;;
	c0	shru $r0.3 = $r0.3, $r0.4
;;
	c0	slct $r0.4 = $b0.0, $r0.3, 0
;;
LBB1_5:                                 ## %if.end.8
	c0	stw 0[$r0.7] = $r0.4
;;
.return ret()
	c0	stw 0[$r0.6] = $r0.2
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl shift64RightJamming
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @shift64RightJamming
shift64RightJamming::
## BB#0:                                ## %entry
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB2_1
;;
## BB#2:                                ## %if.else
	c0	mov $r0.2 = 0
	c0	cmpgt $b0.0 = $r0.5, 31
;;
	c0	sub $r0.8 = $r0.2, $r0.5
;;
	c0	and $r0.8 = $r0.8, 31
	c0	br $b0.0, LBB2_4
;;
## BB#3:                                ## %if.then.2
	c0	shl $r0.2 = $r0.4, $r0.8
	c0	shl $r0.8 = $r0.3, $r0.8
	c0	shru $r0.4 = $r0.4, $r0.5
;;
	c0	cmpne $b0.0 = $r0.2, 0
	c0	shru $r0.2 = $r0.3, $r0.5
	c0	or $r0.3 = $r0.8, $r0.4
;;
;;
	c0	mfb $r0.4 = $b0.0
;;
	c0	or $r0.4 = $r0.3, $r0.4
	c0	goto LBB2_9
;;
LBB2_1:
	c0	mov $r0.2 = $r0.3
	c0	goto LBB2_9
;;
LBB2_4:                                 ## %if.else.7
	c0	cmpne $b0.0 = $r0.5, 32
;;
;;
	c0	brf $b0.0, LBB2_5
;;
## BB#6:                                ## %if.else.14
	c0	cmpgt $b0.0 = $r0.5, 63
;;
;;
	c0	br $b0.0, LBB2_8
;;
## BB#7:                                ## %if.then.17
	c0	shl $r0.8 = $r0.3, $r0.8
	c0	and $r0.5 = $r0.5, 31
;;
	c0	or $r0.4 = $r0.8, $r0.4
	c0	shru $r0.3 = $r0.3, $r0.5
;;
LBB2_5:                                 ## %if.then.10
	c0	cmpne $b0.0 = $r0.4, 0
;;
;;
	c0	mfb $r0.4 = $b0.0
;;
	c0	or $r0.4 = $r0.4, $r0.3
	c0	goto LBB2_9
;;
LBB2_8:                                 ## %if.else.25
	c0	or $r0.3 = $r0.4, $r0.3
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	mfb $r0.4 = $b0.0
;;
LBB2_9:                                 ## %if.end.31
	c0	stw 0[$r0.7] = $r0.4
;;
.return ret()
	c0	stw 0[$r0.6] = $r0.2
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl shift64ExtraRightJamming
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @shift64ExtraRightJamming
shift64ExtraRightJamming::
## BB#0:                                ## %entry
	c0	cmpeq $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB3_8
;;
## BB#1:                                ## %if.else
	c0	mov $r0.2 = 0
	c0	cmpgt $b0.0 = $r0.6, 31
;;
	c0	sub $r0.10 = $r0.2, $r0.6
;;
	c0	and $r0.10 = $r0.10, 31
	c0	br $b0.0, LBB3_3
;;
## BB#2:                                ## %if.then.2
	c0	shru $r0.11 = $r0.4, $r0.6
	c0	shl $r0.12 = $r0.3, $r0.10
	c0	shru $r0.2 = $r0.3, $r0.6
	c0	shl $r0.4 = $r0.4, $r0.10
;;
	c0	or $r0.3 = $r0.12, $r0.11
	c0	goto LBB3_7
;;
LBB3_3:                                 ## %if.else.5
	c0	cmpeq $b0.0 = $r0.6, 32
;;
;;
	c0	br $b0.0, LBB3_7
;;
## BB#4:                                ## %if.else.8
	c0	cmpgt $b0.0 = $r0.6, 63
	c0	or $r0.5 = $r0.5, $r0.4
;;
;;
	c0	br $b0.0, LBB3_6
;;
## BB#5:                                ## %if.then.11
	c0	and $r0.6 = $r0.6, 31
	c0	shl $r0.4 = $r0.3, $r0.10
;;
	c0	shru $r0.3 = $r0.3, $r0.6
	c0	goto LBB3_7
;;
LBB3_6:                                 ## %if.else.15
	c0	cmpne $b0.0 = $r0.3, 0
	c0	cmpeq $b0.1 = $r0.6, 64
	c0	mov $r0.2 = 0
;;
;;
	c0	mfb $r0.4 = $b0.0
;;
	c0	slct $r0.4 = $b0.1, $r0.3, $r0.4
	c0	mov $r0.3 = $r0.2
;;
LBB3_7:                                 ## %if.end.19
	c0	cmpne $b0.0 = $r0.5, 0
	c0	mov $r0.6 = $r0.3
	c0	mov $r0.3 = $r0.2
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	or $r0.5 = $r0.2, $r0.4
	c0	mov $r0.4 = $r0.6
;;
LBB3_8:                                 ## %if.end.23
	c0	stw 0[$r0.9] = $r0.5
;;
	c0	stw 0[$r0.8] = $r0.4
;;
.return ret()
	c0	stw 0[$r0.7] = $r0.3
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl shortShift64Left
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @shortShift64Left
shortShift64Left::
## BB#0:                                ## %entry
	c0	cmpeq $b0.0 = $r0.5, 0
	c0	shl $r0.2 = $r0.4, $r0.5
;;
	c0	stw 0[$r0.7] = $r0.2
;;
	c0	br $b0.0, LBB4_2
;;
## BB#1:                                ## %cond.false
	c0	mov $r0.2 = 0
;;
	c0	sub $r0.2 = $r0.2, $r0.5
;;
	c0	and $r0.2 = $r0.2, 31
	c0	shl $r0.3 = $r0.3, $r0.5
;;
	c0	shru $r0.2 = $r0.4, $r0.2
;;
	c0	or $r0.3 = $r0.2, $r0.3
;;
LBB4_2:                                 ## %cond.end
.return ret()
	c0	stw 0[$r0.6] = $r0.3
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl shortShift96Left
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @shortShift96Left
shortShift96Left::
## BB#0:                                ## %entry
	c0	cmplt $b0.0 = $r0.6, 1
	c0	shl $r0.2 = $r0.4, $r0.6
	c0	shl $r0.3 = $r0.3, $r0.6
	c0	shl $r0.10 = $r0.5, $r0.6
;;
;;
	c0	br $b0.0, LBB5_2
;;
## BB#1:                                ## %if.then
	c0	mov $r0.11 = 0
;;
	c0	sub $r0.6 = $r0.11, $r0.6
;;
	c0	and $r0.6 = $r0.6, 31
;;
	c0	shru $r0.5 = $r0.5, $r0.6
	c0	shru $r0.4 = $r0.4, $r0.6
;;
	c0	or $r0.2 = $r0.5, $r0.2
	c0	or $r0.3 = $r0.4, $r0.3
;;
LBB5_2:                                 ## %if.end
	c0	stw 0[$r0.9] = $r0.10
;;
	c0	stw 0[$r0.8] = $r0.2
;;
.return ret()
	c0	stw 0[$r0.7] = $r0.3
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl add64
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @add64
add64::
## BB#0:                                ## %entry
	c0	add $r0.2 = $r0.6, $r0.4
	c0	add $r0.3 = $r0.5, $r0.3
;;
	c0	cmpltu $r0.4 = $r0.2, $r0.6
;;
	c0	add $r0.3 = $r0.3, $r0.4
	c0	stw 0[$r0.8] = $r0.2
;;
.return ret()
	c0	stw 0[$r0.7] = $r0.3
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl add96
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @add96
add96::
## BB#0:                                ## %entry
	c0	add $r0.2 = $r0.8, $r0.5
	c0	add $r0.4 = $r0.7, $r0.4
;;
	c0	cmpltu $r0.5 = $r0.2, $r0.8
	c0	add $r0.3 = $r0.6, $r0.3
	c0	cmpltu $r0.6 = $r0.4, $r0.7
	c0	ldw $r0.7 = 16[$r0.1]
;;
	c0	add $r0.4 = $r0.5, $r0.4
	c0	add $r0.3 = $r0.3, $r0.6
;;
	c0	cmpltu $r0.5 = $r0.4, $r0.5
	c0	stw 0[$r0.7] = $r0.2
;;
	c0	add $r0.2 = $r0.3, $r0.5
	c0	stw 0[$r0.10] = $r0.4
;;
.return ret()
	c0	stw 0[$r0.9] = $r0.2
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl sub64
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @sub64
sub64::
## BB#0:                                ## %entry
	c0	mov $r0.2 = -1
	c0	cmpltu $r0.9 = $r0.4, $r0.6
;;
	c0	mtb $b0.0 = $r0.9
	c0	sub $r0.3 = $r0.3, $r0.5
	c0	sub $r0.4 = $r0.4, $r0.6
;;
;;
	c0	slct $r0.2 = $b0.0, $r0.2, 0
;;
	c0	add $r0.2 = $r0.3, $r0.2
	c0	stw 0[$r0.8] = $r0.4
;;
.return ret()
	c0	stw 0[$r0.7] = $r0.2
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl sub96
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @sub96
sub96::
## BB#0:                                ## %entry
	c0	cmpltu $b0.0 = $r0.5, $r0.8
	c0	cmpltu $r0.2 = $r0.4, $r0.7
	c0	sub $r0.4 = $r0.4, $r0.7
	c0	mov $r0.7 = -1
;;
;;
	c0	mfb $r0.11 = $b0.0
	c0	mtb $b0.0 = $r0.2
;;
	c0	cmpltu $r0.2 = $r0.4, $r0.11
	c0	sub $r0.3 = $r0.3, $r0.6
;;
	c0	slct $r0.6 = $b0.0, $r0.7, 0
	c0	ldw $r0.12 = 16[$r0.1]
	c0	mtb $b0.0 = $r0.2
;;
	c0	add $r0.2 = $r0.3, $r0.6
	c0	sub $r0.3 = $r0.5, $r0.8
;;
	c0	slct $r0.5 = $b0.0, $r0.7, 0
	c0	stw 0[$r0.12] = $r0.3
	c0	sub $r0.3 = $r0.4, $r0.11
;;
	c0	add $r0.2 = $r0.2, $r0.5
	c0	stw 0[$r0.10] = $r0.3
;;
.return ret()
	c0	stw 0[$r0.9] = $r0.2
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl mul32To64
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @mul32To64
mul32To64::
## BB#0:                                ## %entry
	c0	mov $r0.2 = 16
	c0	zxth $r0.7 = $r0.4
	c0	zxth $r0.8 = $r0.3
;;
	c0	shru $r0.3 = $r0.3, $r0.2
	c0	shru $r0.4 = $r0.4, $r0.2
;;
	c0	mpyhs $r0.9 = $r0.7, $r0.3
	c0	mpylu $r0.10 = $r0.7, $r0.3
;;
	c0	mpylu $r0.11 = $r0.4, $r0.8
	c0	mpyhs $r0.12 = $r0.4, $r0.8
;;
	c0	mpyhs $r0.13 = $r0.7, $r0.8
	c0	add $r0.9 = $r0.10, $r0.9
;;
	c0	add $r0.10 = $r0.11, $r0.12
	c0	mpylu $r0.7 = $r0.7, $r0.8
;;
	c0	add $r0.8 = $r0.10, $r0.9
	c0	mpyhs $r0.9 = $r0.4, $r0.3
	c0	mpylu $r0.3 = $r0.4, $r0.3
;;
	c0	add $r0.4 = $r0.7, $r0.13
	c0	cmpltu $r0.7 = $r0.8, $r0.10
	c0	shl $r0.10 = $r0.8, $r0.2
	c0	shru $r0.8 = $r0.8, $r0.2
;;
	c0	shl $r0.2 = $r0.7, $r0.2
	c0	add $r0.3 = $r0.3, $r0.9
	c0	add $r0.4 = $r0.10, $r0.4
;;
	c0	or $r0.2 = $r0.2, $r0.8
	c0	cmpltu $r0.7 = $r0.4, $r0.10
;;
	c0	add $r0.2 = $r0.2, $r0.3
;;
	c0	add $r0.2 = $r0.2, $r0.7
	c0	stw 0[$r0.6] = $r0.4
;;
.return ret()
	c0	stw 0[$r0.5] = $r0.2
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl mul64By32To96
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @mul64By32To96
mul64By32To96::
## BB#0:                                ## %entry
	c0	mov $r0.2 = 16
	c0	zxth $r0.9 = $r0.5
;;
	c0	shru $r0.10 = $r0.3, $r0.2
	c0	shru $r0.11 = $r0.4, $r0.2
	c0	shru $r0.5 = $r0.5, $r0.2
	c0	zxth $r0.4 = $r0.4
;;
	c0	zxth $r0.3 = $r0.3
	c0	mpylu $r0.12 = $r0.9, $r0.10
	c0	mpyhs $r0.13 = $r0.9, $r0.10
;;
	c0	mpylu $r0.14 = $r0.5, $r0.4
	c0	mpyhs $r0.15 = $r0.5, $r0.4
;;
	c0	mpyhs $r0.16 = $r0.5, $r0.3
	c0	mpylu $r0.17 = $r0.5, $r0.3
	c0	add $r0.12 = $r0.12, $r0.13
;;
	c0	mpylu $r0.13 = $r0.9, $r0.11
	c0	mpyhs $r0.18 = $r0.9, $r0.11
;;
	c0	add $r0.16 = $r0.17, $r0.16
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	add $r0.13 = $r0.13, $r0.18
	c0	mpyhs $r0.15 = $r0.9, $r0.3
	c0	mpylu $r0.3 = $r0.9, $r0.3
	c0	add $r0.12 = $r0.16, $r0.12
;;
	c0	add $r0.13 = $r0.14, $r0.13
	c0	mpylu $r0.17 = $r0.9, $r0.4
	c0	mpyhs $r0.4 = $r0.9, $r0.4
	c0	shl $r0.9 = $r0.12, $r0.2
;;
	c0	mpyhs $r0.18 = $r0.5, $r0.11
	c0	mpylu $r0.11 = $r0.5, $r0.11
	c0	cmpltu $r0.14 = $r0.13, $r0.14
	c0	add $r0.3 = $r0.3, $r0.15
;;
	c0	add $r0.3 = $r0.9, $r0.3
	c0	shru $r0.15 = $r0.13, $r0.2
	c0	shl $r0.14 = $r0.14, $r0.2
	c0	add $r0.4 = $r0.17, $r0.4
;;
	c0	shl $r0.13 = $r0.13, $r0.2
	c0	add $r0.11 = $r0.11, $r0.18
	c0	or $r0.14 = $r0.14, $r0.15
	c0	cmpltu $r0.15 = $r0.12, $r0.16
;;
	c0	add $r0.4 = $r0.13, $r0.4
	c0	add $r0.11 = $r0.3, $r0.11
	c0	mpylu $r0.16 = $r0.5, $r0.10
	c0	mpyhs $r0.5 = $r0.5, $r0.10
;;
	c0	cmpltu $r0.10 = $r0.4, $r0.13
	c0	add $r0.11 = $r0.11, $r0.14
	c0	shl $r0.13 = $r0.15, $r0.2
	c0	shru $r0.2 = $r0.12, $r0.2
;;
	c0	add $r0.10 = $r0.11, $r0.10
	c0	add $r0.5 = $r0.16, $r0.5
	c0	or $r0.2 = $r0.13, $r0.2
	c0	cmpltu $r0.9 = $r0.3, $r0.9
;;
	c0	cmpltu $b0.0 = $r0.10, $r0.3
	c0	add $r0.2 = $r0.2, $r0.5
;;
	c0	add $r0.2 = $r0.2, $r0.9
;;
	c0	mfb $r0.3 = $b0.0
	c0	stw 0[$r0.8] = $r0.4
;;
	c0	add $r0.2 = $r0.2, $r0.3
	c0	stw 0[$r0.7] = $r0.10
;;
.return ret()
	c0	stw 0[$r0.6] = $r0.2
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl mul64To128
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @mul64To128
mul64To128::
## BB#0:                                ## %entry
	c0	mov $r0.2 = 16
	c0	zxth $r0.11 = $r0.6
	c0	zxth $r0.12 = $r0.4
;;
	c0	shru $r0.13 = $r0.5, $r0.2
	c0	shru $r0.4 = $r0.4, $r0.2
	c0	shru $r0.6 = $r0.6, $r0.2
	c0	zxth $r0.5 = $r0.5
;;
	c0	mpylu $r0.14 = $r0.11, $r0.4
	c0	mpyhs $r0.15 = $r0.11, $r0.4
;;
	c0	mpylu $r0.16 = $r0.6, $r0.12
	c0	mpyhs $r0.17 = $r0.6, $r0.12
	c0	shru $r0.18 = $r0.3, $r0.2
;;
	c0	mpylu $r0.19 = $r0.5, $r0.4
	c0	mpyhs $r0.20 = $r0.5, $r0.4
	c0	zxth $r0.3 = $r0.3
;;
	c0	mpylu $r0.21 = $r0.13, $r0.12
	c0	mpyhs $r0.22 = $r0.13, $r0.12
	c0	add $r0.14 = $r0.14, $r0.15
	c0	add $r0.15 = $r0.16, $r0.17
;;
	c0	mpylu $r0.16 = $r0.5, $r0.12
	c0	mpyhs $r0.17 = $r0.5, $r0.12
	c0	add $r0.19 = $r0.19, $r0.20
	c0	add $r0.14 = $r0.15, $r0.14
;;
	c0	add $r0.20 = $r0.21, $r0.22
	c0	mpyhs $r0.21 = $r0.6, $r0.4
	c0	mpylu $r0.22 = $r0.6, $r0.4
	c0	cmpltu $r0.15 = $r0.14, $r0.15
;;
	c0	add $r0.19 = $r0.20, $r0.19
	c0	mpylu $r0.23 = $r0.11, $r0.12
	c0	mpyhs $r0.12 = $r0.11, $r0.12
	c0	add $r0.16 = $r0.16, $r0.17
;;
	c0	shl $r0.17 = $r0.19, $r0.2
	c0	shru $r0.24 = $r0.14, $r0.2
	c0	shl $r0.15 = $r0.15, $r0.2
	c0	shl $r0.14 = $r0.14, $r0.2
;;
	c0	mpyhs $r0.25 = $r0.5, $r0.18
	c0	mpylu $r0.26 = $r0.5, $r0.18
	c0	add $r0.16 = $r0.17, $r0.16
	c0	add $r0.21 = $r0.22, $r0.21
;;
	c0	mpyhs $r0.22 = $r0.13, $r0.3
	c0	mpylu $r0.27 = $r0.13, $r0.3
	c0	add $r0.12 = $r0.23, $r0.12
	c0	add $r0.21 = $r0.16, $r0.21
;;
	c0	mpylu $r0.23 = $r0.5, $r0.3
	c0	mpyhs $r0.5 = $r0.5, $r0.3
	c0	add $r0.25 = $r0.26, $r0.25
	c0	add $r0.12 = $r0.14, $r0.12
;;
	c0	add $r0.22 = $r0.27, $r0.22
	c0	mpylu $r0.26 = $r0.11, $r0.18
	c0	mpyhs $r0.27 = $r0.11, $r0.18
	c0	or $r0.15 = $r0.15, $r0.24
;;
	c0	mpyhs $r0.24 = $r0.6, $r0.3
	c0	mpylu $r0.28 = $r0.6, $r0.3
	c0	add $r0.25 = $r0.22, $r0.25
	c0	cmpltu $r0.20 = $r0.19, $r0.20
;;
	c0	mpyhs $r0.29 = $r0.13, $r0.4
	c0	mpylu $r0.4 = $r0.13, $r0.4
	c0	cmpltu $r0.14 = $r0.12, $r0.14
	c0	add $r0.15 = $r0.21, $r0.15
;;
	c0	shl $r0.21 = $r0.25, $r0.2
	c0	add $r0.5 = $r0.23, $r0.5
	c0	add $r0.23 = $r0.26, $r0.27
	c0	add $r0.24 = $r0.28, $r0.24
;;
	c0	add $r0.23 = $r0.24, $r0.23
	c0	add $r0.14 = $r0.15, $r0.14
	c0	add $r0.5 = $r0.21, $r0.5
	c0	add $r0.4 = $r0.4, $r0.29
;;
	c0	mpylu $r0.15 = $r0.11, $r0.3
	c0	mpyhs $r0.3 = $r0.11, $r0.3
	c0	shru $r0.11 = $r0.19, $r0.2
	c0	shl $r0.19 = $r0.20, $r0.2
;;
	c0	cmpltu $r0.20 = $r0.23, $r0.24
	c0	cmpltu $b0.0 = $r0.14, $r0.16
	c0	mpyhs $r0.24 = $r0.6, $r0.18
	c0	mpylu $r0.6 = $r0.6, $r0.18
;;
	c0	or $r0.11 = $r0.19, $r0.11
	c0	add $r0.4 = $r0.5, $r0.4
	c0	shru $r0.19 = $r0.23, $r0.2
	c0	shl $r0.20 = $r0.20, $r0.2
;;
	c0	shl $r0.23 = $r0.23, $r0.2
	c0	add $r0.3 = $r0.15, $r0.3
	c0	add $r0.4 = $r0.4, $r0.11
	c0	cmpltu $r0.11 = $r0.16, $r0.17
;;
	c0	add $r0.3 = $r0.23, $r0.3
	c0	cmpltu $r0.15 = $r0.25, $r0.22
	c0	add $r0.6 = $r0.6, $r0.24
	c0	or $r0.16 = $r0.20, $r0.19
;;
	c0	mfb $r0.17 = $b0.0
	c0	add $r0.4 = $r0.4, $r0.11
	c0	mpylu $r0.11 = $r0.13, $r0.18
	c0	mpyhs $r0.13 = $r0.13, $r0.18
;;
	c0	add $r0.18 = $r0.14, $r0.3
	c0	add $r0.4 = $r0.4, $r0.17
	c0	shl $r0.15 = $r0.15, $r0.2
	c0	shru $r0.2 = $r0.25, $r0.2
;;
	c0	cmpltu $r0.3 = $r0.3, $r0.23
	c0	add $r0.6 = $r0.16, $r0.6
	c0	cmpltu $b0.0 = $r0.4, $r0.5
	c0	cmpltu $r0.14 = $r0.18, $r0.14
;;
	c0	add $r0.3 = $r0.6, $r0.3
	c0	or $r0.2 = $r0.15, $r0.2
	c0	add $r0.6 = $r0.11, $r0.13
	c0	cmpltu $r0.5 = $r0.5, $r0.21
;;
	c0	add $r0.2 = $r0.2, $r0.6
	c0	add $r0.3 = $r0.3, $r0.14
	c0	mfb $r0.6 = $b0.0
;;
	c0	add $r0.2 = $r0.2, $r0.5
	c0	add $r0.4 = $r0.3, $r0.4
	c0	stw 0[$r0.10] = $r0.12
;;
	c0	cmpltu $r0.3 = $r0.4, $r0.3
	c0	add $r0.2 = $r0.2, $r0.6
	c0	stw 0[$r0.9] = $r0.18
;;
	c0	add $r0.2 = $r0.2, $r0.3
	c0	stw 0[$r0.8] = $r0.4
;;
.return ret()
	c0	stw 0[$r0.7] = $r0.2
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl eq64
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @eq64
eq64::
## BB#0:                                ## %entry
	c0	cmpeq $b0.0 = $r0.3, $r0.5
	c0	cmpeq $b0.1 = $r0.4, $r0.6
;;
;;
	c0	mfb $r0.2 = $b0.0
	c0	mfb $r0.3 = $b0.1
;;
	c0	and $r0.2 = $r0.2, $r0.3
;;
.return ret($r0.3:u32)
	c0	and $r0.3 = $r0.2, 1
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl le64
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @le64
le64::
## BB#0:                                ## %entry
	c0	cmpltu $b0.0 = $r0.3, $r0.5
;;
;;
	c0	brf $b0.0, LBB14_2
;;
## BB#1:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB14_2:                                ## %lor.rhs
	c0	cmpleu $b0.0 = $r0.4, $r0.6
	c0	cmpeq $b0.1 = $r0.3, $r0.5
;;
;;
	c0	mfb $r0.2 = $b0.0
	c0	mfb $r0.3 = $b0.1
;;
	c0	and $r0.2 = $r0.3, $r0.2
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl lt64
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @lt64
lt64::
## BB#0:                                ## %entry
	c0	cmpltu $b0.0 = $r0.3, $r0.5
;;
;;
	c0	brf $b0.0, LBB15_2
;;
## BB#1:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB15_2:                                ## %lor.rhs
	c0	cmpltu $b0.0 = $r0.4, $r0.6
	c0	cmpeq $b0.1 = $r0.3, $r0.5
;;
;;
	c0	mfb $r0.2 = $b0.0
	c0	mfb $r0.3 = $b0.1
;;
	c0	and $r0.2 = $r0.3, $r0.2
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl ne64
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @ne64
ne64::
## BB#0:                                ## %entry
	c0	cmpne $b0.0 = $r0.3, $r0.5
	c0	cmpne $b0.1 = $r0.4, $r0.6
;;
;;
	c0	mfb $r0.2 = $b0.0
	c0	mfb $r0.3 = $b0.1
;;
	c0	or $r0.2 = $r0.2, $r0.3
;;
.return ret($r0.3:u32)
	c0	and $r0.3 = $r0.2, 1
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl ge64
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @ge64
ge64::
## BB#0:                                ## %entry
	c0	cmpgtu $b0.0 = $r0.3, $r0.5
;;
;;
	c0	brf $b0.0, LBB17_2
;;
## BB#1:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB17_2:                                ## %lor.rhs
	c0	cmpgeu $b0.0 = $r0.4, $r0.6
	c0	cmpeq $b0.1 = $r0.3, $r0.5
;;
;;
	c0	mfb $r0.2 = $b0.0
	c0	mfb $r0.3 = $b0.1
;;
	c0	and $r0.2 = $r0.3, $r0.2
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl gt64
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @gt64
gt64::
## BB#0:                                ## %entry
	c0	cmpgtu $b0.0 = $r0.3, $r0.5
;;
;;
	c0	brf $b0.0, LBB18_2
;;
## BB#1:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB18_2:                                ## %lor.rhs
	c0	cmpgtu $b0.0 = $r0.4, $r0.6
	c0	cmpeq $b0.1 = $r0.3, $r0.5
;;
;;
	c0	mfb $r0.2 = $b0.0
	c0	mfb $r0.3 = $b0.1
;;
	c0	and $r0.2 = $r0.3, $r0.2
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float_raise
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float_raise
float_raise::
## BB#0:                                ## %entry
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
;;
;;
	c0	or $r0.3 = $r0.4, $r0.3
;;
.return ret()
	c0	stw 0[$r0.2] = $r0.3
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float32_is_nan
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_is_nan
float32_is_nan::
## BB#0:                                ## %entry
	c0	and $r0.2 = $r0.3, 2147483647
;;
	c0	cmpgtu $b0.0 = $r0.2, 2139095040
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float32_is_signaling_nan
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_is_signaling_nan
float32_is_signaling_nan::
## BB#0:                                ## %entry
	c0	and $r0.2 = $r0.3, 2143289344
	c0	and $r0.3 = $r0.3, 4194303
;;
	c0	cmpeq $b0.0 = $r0.2, 2139095040
	c0	cmpne $b0.1 = $r0.3, 0
;;
;;
	c0	mfb $r0.2 = $b0.1
	c0	mfb $r0.3 = $b0.0
;;
	c0	and $r0.2 = $r0.3, $r0.2
;;
.return ret($r0.3:u32)
	c0	and $r0.3 = $r0.2, 1
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float64_is_nan
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_is_nan
float64_is_nan::
## BB#0:                                ## %entry
	c0	mov $r0.2 = 1
;;
	c0	shl $r0.2 = $r0.3, $r0.2
;;
	c0	cmpltu $b0.0 = $r0.2, -2097152
;;
;;
	c0	br $b0.0, LBB22_1
;;
## BB#2:                                ## %land.rhs
	c0	cmpne $b0.0 = $r0.4, 0
;;
;;
	c0	brf $b0.0, LBB22_4
;;
## BB#3:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB22_1:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB22_4:                                ## %lor.rhs
	c0	and $r0.2 = $r0.3, 1048575
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float64_is_signaling_nan
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_is_signaling_nan
float64_is_signaling_nan::
## BB#0:                                ## %entry
	c0	and $r0.2 = $r0.3, 2146959360
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
;;
	c0	br $b0.0, LBB23_1
;;
## BB#2:                                ## %land.rhs
	c0	cmpne $b0.0 = $r0.4, 0
;;
;;
	c0	brf $b0.0, LBB23_4
;;
## BB#3:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB23_1:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB23_4:                                ## %lor.rhs
	c0	and $r0.2 = $r0.3, 524287
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl extractFloat32Frac
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @extractFloat32Frac
extractFloat32Frac::
## BB#0:                                ## %entry
.return ret($r0.3:u32)
	c0	and $r0.3 = $r0.3, 8388607
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl extractFloat32Exp
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @extractFloat32Exp
extractFloat32Exp::
## BB#0:                                ## %entry
	c0	mov $r0.2 = 23
;;
	c0	shru $r0.2 = $r0.3, $r0.2
;;
.return ret($r0.3:u32)
	c0	zxtb $r0.3 = $r0.2
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl extractFloat32Sign
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @extractFloat32Sign
extractFloat32Sign::
## BB#0:                                ## %entry
	c0	mov $r0.2 = 31
;;
.return ret($r0.3:u32)
	c0	shru $r0.3 = $r0.3, $r0.2
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl packFloat32
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @packFloat32
packFloat32::
## BB#0:                                ## %entry
	c0	mov $r0.2 = 23
	c0	mov $r0.6 = 31
;;
	c0	shl $r0.3 = $r0.3, $r0.6
	c0	shl $r0.2 = $r0.4, $r0.2
;;
	c0	add $r0.2 = $r0.2, $r0.3
;;
.return ret($r0.3:u32)
	c0	add $r0.3 = $r0.2, $r0.5
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl extractFloat64Frac1
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @extractFloat64Frac1
extractFloat64Frac1::
## BB#0:                                ## %entry
.return ret($r0.3:u32)
	c0	mov $r0.3 = $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl extractFloat64Frac0
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @extractFloat64Frac0
extractFloat64Frac0::
## BB#0:                                ## %entry
.return ret($r0.3:u32)
	c0	and $r0.3 = $r0.3, 1048575
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl extractFloat64Exp
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @extractFloat64Exp
extractFloat64Exp::
## BB#0:                                ## %entry
	c0	mov $r0.2 = 20
;;
	c0	shru $r0.2 = $r0.3, $r0.2
;;
.return ret($r0.3:u32)
	c0	and $r0.3 = $r0.2, 2047
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl extractFloat64Sign
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @extractFloat64Sign
extractFloat64Sign::
## BB#0:                                ## %entry
	c0	mov $r0.2 = 31
;;
.return ret($r0.3:u32)
	c0	shru $r0.3 = $r0.3, $r0.2
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl packFloat64
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @packFloat64
packFloat64::
## BB#0:                                ## %entry
	c0	mov $r0.2 = 20
	c0	mov $r0.7 = 31
;;
	c0	shl $r0.3 = $r0.3, $r0.7
	c0	shl $r0.2 = $r0.4, $r0.2
;;
	c0	add $r0.2 = $r0.2, $r0.3
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	add $r0.4 = $r0.2, $r0.5
	c0	mov $r0.3 = $r0.6
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl int32_to_float32
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @int32_to_float32
int32_to_float32::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $l0.0
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	brf $b0.0, LBB33_2
;;
## BB#1:
	c0	mov $r0.3 = 0
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB33_2:                                ## %entry
	c0	cmpne $b0.0 = $r0.3, -2147483648
;;
;;
	c0	br $b0.0, LBB33_4
;;
## BB#3:                                ## %if.then.2
	c0	mov $r0.3 = -822083584
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB33_4:                                ## %if.end.3
	c0	mov $r0.2 = 31
	c0	mov $r0.4 = 16
	c0	mov $r0.5 = 8
	c0	mov $r0.6 = 22
;;
	c0	shr $r0.7 = $r0.3, $r0.2
	c0	mov $r0.8 = 4
	c0	mov $r0.9 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	mov $r0.10 = 157
	c0	add $r0.11 = $r0.3, $r0.7
;;
	c0	xor $r0.7 = $r0.11, $r0.7
;;
	c0	cmpltu $b0.0 = $r0.7, 65536
	c0	shl $r0.4 = $r0.7, $r0.4
;;
;;
	c0	slct $r0.4 = $b0.0, $r0.4, $r0.7
	c0	mfb $r0.11 = $b0.0
;;
	c0	cmpltu $b0.0 = $r0.4, 16777216
	c0	shl $r0.5 = $r0.4, $r0.5
;;
;;
	c0	slct $r0.4 = $b0.0, $r0.5, $r0.4
;;
	c0	shru $r0.4 = $r0.4, $r0.6
;;
	c0	and $r0.4 = $r0.4, 1020
	c0	shl $r0.5 = $r0.11, $r0.8
;;
	c0	add $r0.4 = $r0.9, $r0.4
	c0	or $r0.6 = $r0.5, 8
;;
	c0	ldw $r0.4 = 0[$r0.4]
	c0	slct $r0.5 = $b0.0, $r0.6, $r0.5
;;
;;
	c0	add $r0.4 = $r0.5, $r0.4
	c0	shru $r0.3 = $r0.3, $r0.2
;;
	c0	add $r0.2 = $r0.4, -1
	c0	sub $r0.4 = $r0.10, $r0.4
;;
	c0	shl $r0.5 = $r0.7, $r0.2
;;
.call roundAndPackFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = roundAndPackFloat32
;;
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

#.globl int32_to_float64
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @int32_to_float64
int32_to_float64::
## BB#0:                                ## %entry
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = 0
;;
	c0	cmpeq $b0.0 = $r0.2, 0
	c0	mov $r0.4 = $r0.3
;;
;;
	c0	br $b0.0, LBB34_8
;;
## BB#1:                                ## %if.end
	c0	mov $r0.3 = 31
	c0	mov $r0.5 = 16
	c0	mov $r0.6 = 8
	c0	mov $r0.7 = 22
;;
	c0	shr $r0.3 = $r0.2, $r0.3
	c0	mov $r0.8 = countLeadingZeros32.countLeadingZerosHigh
	c0	mov $r0.9 = 4
;;
	c0	add $r0.4 = $r0.2, $r0.3
;;
	c0	xor $r0.4 = $r0.4, $r0.3
;;
	c0	cmpltu $b0.0 = $r0.4, 65536
	c0	shl $r0.3 = $r0.4, $r0.5
;;
;;
	c0	slct $r0.3 = $b0.0, $r0.3, $r0.4
;;
	c0	cmpltu $b0.1 = $r0.3, 16777216
	c0	shl $r0.5 = $r0.3, $r0.6
;;
;;
	c0	slct $r0.3 = $b0.1, $r0.5, $r0.3
;;
	c0	shru $r0.3 = $r0.3, $r0.7
	c0	mfb $r0.5 = $b0.0
;;
	c0	and $r0.3 = $r0.3, 1020
	c0	shl $r0.5 = $r0.5, $r0.9
;;
	c0	add $r0.3 = $r0.8, $r0.3
	c0	or $r0.6 = $r0.5, 8
;;
	c0	ldw $r0.3 = 0[$r0.3]
	c0	slct $r0.5 = $b0.1, $r0.6, $r0.5
;;
;;
	c0	add $r0.5 = $r0.3, $r0.5
;;
	c0	add $r0.6 = $r0.5, -11
	c0	and $r0.2 = $r0.2, -2147483648
;;
	c0	cmplt $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB34_3
;;
## BB#2:                                ## %if.then.6
	c0	mov $r0.3 = 0
	c0	shl $r0.4 = $r0.4, $r0.6
	c0	goto LBB34_7
;;
LBB34_3:                                ## %if.else
	c0	mov $r0.6 = 11
	c0	mov $r0.3 = 0
;;
	c0	sub $r0.6 = $r0.6, $r0.5
;;
	c0	cmpeq $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB34_7
;;
## BB#4:                                ## %if.else.i
	c0	cmpgt $b0.0 = $r0.6, 31
;;
;;
	c0	br $b0.0, LBB34_6
;;
## BB#5:                                ## %if.then.2.i
	c0	sub $r0.3 = $r0.3, $r0.6
	c0	shru $r0.6 = $r0.4, $r0.6
;;
	c0	and $r0.3 = $r0.3, 31
;;
	c0	shl $r0.3 = $r0.4, $r0.3
	c0	mov $r0.4 = $r0.6
	c0	goto LBB34_7
;;
LBB34_6:                                ## %if.else.4.i
	c0	and $r0.3 = $r0.6, 31
	c0	cmplt $b0.0 = $r0.6, 64
;;
	c0	shru $r0.3 = $r0.4, $r0.3
	c0	mov $r0.4 = 0
;;
	c0	slct $r0.3 = $b0.0, $r0.3, 0
;;
LBB34_7:                                ## %if.end.8
	c0	mov $r0.6 = 1053
	c0	mov $r0.7 = 20
;;
	c0	sub $r0.5 = $r0.6, $r0.5
;;
	c0	shl $r0.5 = $r0.5, $r0.7
;;
	c0	add $r0.2 = $r0.5, $r0.2
;;
	c0	add $r0.4 = $r0.2, $r0.4
;;
LBB34_8:                                ## %cleanup
.return ret($r0.3:u32,$r0.4:u32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float32_to_int32
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_to_int32
float32_to_int32::
## BB#0:                                ## %entry
	c0	mov $r0.2 = 23
	c0	mov $r0.8 = 31
;;
	c0	shru $r0.6 = $r0.3, $r0.2
;;
	c0	zxtb $r0.4 = $r0.6
;;
	c0	add $r0.7 = $r0.4, -150
;;
	c0	cmplt $b0.0 = $r0.7, 0
	c0	and $r0.5 = $r0.3, 8388607
	c0	shru $r0.2 = $r0.3, $r0.8
;;
;;
	c0	br $b0.0, LBB35_8
;;
## BB#1:                                ## %if.then
	c0	cmpltu $b0.0 = $r0.4, 158
;;
;;
	c0	br $b0.0, LBB35_7
;;
## BB#2:                                ## %if.then.4
	c0	cmpeq $b0.0 = $r0.3, -822083584
;;
;;
	c0	br $b0.0, LBB35_6
;;
## BB#3:                                ## %if.then.6
	c0	mov $r0.6 = float_exception_flags
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	ldw $r0.2 = 0[$r0.6]
	c0	mov $r0.3 = 2147483647
;;
;;
	c0	or $r0.2 = $r0.2, 16
;;
	c0	stw 0[$r0.6] = $r0.2
	c0	br $b0.0, LBB35_20
;;
## BB#4:                                ## %lor.lhs.false
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB35_6
;;
## BB#5:                                ## %lor.lhs.false
	c0	cmpeq $b0.0 = $r0.4, 255
;;
;;
	c0	br $b0.0, LBB35_20
;;
LBB35_6:                                ## %if.end.10
.return ret($r0.3:u32)
	c0	mov $r0.3 = -2147483648
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB35_8:                                ## %if.else
	c0	cmpgtu $b0.0 = $r0.4, 125
;;
;;
	c0	br $b0.0, LBB35_10
;;
## BB#9:                                ## %if.then.17
	c0	mov $r0.3 = 0
	c0	or $r0.4 = $r0.4, $r0.5
	c0	goto LBB35_11
;;
LBB35_7:                                ## %if.end.11
	c0	or $r0.3 = $r0.5, 8388608
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	shl $r0.2 = $r0.3, $r0.7
	c0	mov $r0.3 = 0
;;
	c0	sub $r0.3 = $r0.3, $r0.2
;;
.return ret($r0.3:u32)
	c0	slct $r0.3 = $b0.0, $r0.2, $r0.3
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB35_10:                               ## %if.else.19
	c0	add $r0.3 = $r0.6, 10
	c0	mov $r0.6 = 150
	c0	or $r0.5 = $r0.5, 8388608
;;
	c0	sub $r0.4 = $r0.6, $r0.4
	c0	and $r0.6 = $r0.3, 31
;;
	c0	shru $r0.3 = $r0.5, $r0.4
	c0	shl $r0.4 = $r0.5, $r0.6
;;
LBB35_11:                               ## %if.end.23
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB35_13
;;
## BB#12:                               ## %if.then.25
	c0	mov $r0.5 = float_exception_flags
;;
	c0	ldw $r0.6 = 0[$r0.5]
;;
;;
	c0	or $r0.6 = $r0.6, 1
;;
	c0	stw 0[$r0.5] = $r0.6
;;
LBB35_13:                               ## %if.end.27
	c0	mov $r0.5 = float_rounding_mode
;;
	c0	ldw $r0.5 = 0[$r0.5]
;;
;;
	c0	cmpne $b0.0 = $r0.5, 0
;;
;;
	c0	brf $b0.0, LBB35_14
;;
## BB#17:                               ## %if.else.42
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB35_19
;;
## BB#18:                               ## %if.then.45
	c0	cmpeq $b0.0 = $r0.5, 3
	c0	cmpne $b0.1 = $r0.4, 0
	c0	mov $r0.2 = 0
;;
;;
	c0	mfb $r0.4 = $b0.0
	c0	mfb $r0.5 = $b0.1
;;
	c0	and $r0.4 = $r0.5, $r0.4
;;
	c0	and $r0.4 = $r0.4, 1
;;
	c0	add $r0.3 = $r0.3, $r0.4
;;
.return ret($r0.3:u32)
	c0	sub $r0.3 = $r0.2, $r0.3
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB35_14:                               ## %if.then.29
	c0	cmpgt $b0.0 = $r0.4, -1
;;
;;
	c0	br $b0.0, LBB35_16
;;
## BB#15:                               ## %if.then.31
	c0	and $r0.4 = $r0.4, 2147483647
	c0	add $r0.3 = $r0.3, 1
;;
	c0	and $r0.5 = $r0.3, -2
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	slct $r0.3 = $b0.0, $r0.5, $r0.3
;;
LBB35_16:                               ## %if.end.37
	c0	mov $r0.4 = 0
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	sub $r0.2 = $r0.4, $r0.3
;;
.return ret($r0.3:u32)
	c0	slct $r0.3 = $b0.0, $r0.3, $r0.2
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB35_19:                               ## %if.else.50
	c0	cmpeq $b0.0 = $r0.5, 2
	c0	cmpne $b0.1 = $r0.4, 0
;;
;;
	c0	mfb $r0.2 = $b0.0
	c0	mfb $r0.4 = $b0.1
;;
	c0	and $r0.2 = $r0.4, $r0.2
;;
	c0	and $r0.2 = $r0.2, 1
;;
	c0	add $r0.3 = $r0.2, $r0.3
;;
LBB35_20:                               ## %cleanup
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float32_to_int32_round_to_zero
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_to_int32_round_to_zero
float32_to_int32_round_to_zero::
## BB#0:                                ## %entry
	c0	mov $r0.2 = 23
	c0	mov $r0.4 = 31
;;
	c0	shru $r0.6 = $r0.3, $r0.2
;;
	c0	zxtb $r0.2 = $r0.6
;;
	c0	add $r0.5 = $r0.2, -158
;;
	c0	cmplt $b0.0 = $r0.5, 0
	c0	and $r0.5 = $r0.3, 8388607
	c0	shru $r0.4 = $r0.3, $r0.4
;;
;;
	c0	br $b0.0, LBB36_6
;;
## BB#1:                                ## %if.then
	c0	cmpeq $b0.0 = $r0.3, -822083584
;;
;;
	c0	br $b0.0, LBB36_5
;;
## BB#2:                                ## %if.then.4
	c0	mov $r0.6 = float_exception_flags
	c0	cmpeq $b0.0 = $r0.4, 0
;;
	c0	ldw $r0.4 = 0[$r0.6]
	c0	mov $r0.3 = 2147483647
;;
;;
	c0	or $r0.4 = $r0.4, 16
;;
	c0	stw 0[$r0.6] = $r0.4
	c0	br $b0.0, LBB36_12
;;
## BB#3:                                ## %lor.lhs.false
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB36_5
;;
## BB#4:                                ## %lor.lhs.false
	c0	cmpeq $b0.0 = $r0.2, 255
;;
;;
	c0	br $b0.0, LBB36_12
;;
LBB36_5:                                ## %if.end.8
.return ret($r0.3:u32)
	c0	mov $r0.3 = -2147483648
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB36_6:                                ## %if.else
	c0	cmpgtu $b0.0 = $r0.2, 126
;;
;;
	c0	br $b0.0, LBB36_9
;;
## BB#7:                                ## %if.then.10
	c0	or $r0.2 = $r0.2, $r0.5
	c0	mov $r0.3 = 0
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB36_12
;;
## BB#8:                                ## %if.then.12
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
;;
;;
	c0	or $r0.4 = $r0.4, 1
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB36_9:                                ## %if.end.16
	c0	mov $r0.3 = 8
	c0	add $r0.6 = $r0.6, 2
	c0	mov $r0.7 = 158
;;
	c0	shl $r0.3 = $r0.5, $r0.3
	c0	and $r0.5 = $r0.6, 31
;;
	c0	or $r0.3 = $r0.3, -2147483648
	c0	sub $r0.2 = $r0.7, $r0.2
;;
	c0	shl $r0.5 = $r0.3, $r0.5
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB36_11
;;
## BB#10:                               ## %if.then.21
	c0	mov $r0.3 = float_exception_flags
;;
	c0	ldw $r0.5 = 0[$r0.3]
;;
;;
	c0	or $r0.5 = $r0.5, 1
;;
	c0	stw 0[$r0.3] = $r0.5
;;
LBB36_11:                               ## %if.end.23
	c0	mov $r0.3 = 0
	c0	cmpeq $b0.0 = $r0.4, 0
;;
	c0	sub $r0.3 = $r0.3, $r0.2
;;
	c0	slct $r0.3 = $b0.0, $r0.2, $r0.3
;;
LBB36_12:                               ## %cleanup
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float32_to_float64
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_to_float64
float32_to_float64::
## BB#0:                                ## %entry
	c0	mov $r0.4 = 23
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.4 = $r0.3, $r0.4
;;
	c0	zxtb $r0.6 = $r0.4
;;
	c0	cmpeq $b0.0 = $r0.6, 0
	c0	and $r0.5 = $r0.3, 8388607
	c0	shru $r0.4 = $r0.3, $r0.2
;;
;;
	c0	brf $b0.0, LBB37_1
;;
## BB#8:                                ## %if.then.8
	c0	cmpne $b0.0 = $r0.5, 0
;;
;;
	c0	brf $b0.0, LBB37_9
;;
## BB#10:                               ## %if.end.12
	c0	cmpltu $b0.0 = $r0.5, 65536
	c0	mov $r0.6 = 16
	c0	mov $r0.7 = 8
;;
	c0	mov $r0.8 = 22
	c0	shl $r0.3 = $r0.3, $r0.6
	c0	mov $r0.6 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	mov $r0.9 = 4
	c0	slct $r0.3 = $b0.0, $r0.3, $r0.5
;;
	c0	cmpltu $b0.1 = $r0.3, 16777216
	c0	shl $r0.10 = $r0.3, $r0.7
;;
;;
	c0	slct $r0.3 = $b0.1, $r0.10, $r0.3
;;
	c0	shru $r0.3 = $r0.3, $r0.8
	c0	mfb $r0.8 = $b0.0
;;
	c0	and $r0.3 = $r0.3, 1020
	c0	shl $r0.8 = $r0.8, $r0.9
;;
	c0	add $r0.3 = $r0.6, $r0.3
	c0	or $r0.6 = $r0.8, 8
;;
	c0	ldw $r0.3 = 0[$r0.3]
	c0	slct $r0.6 = $b0.1, $r0.6, $r0.8
;;
;;
	c0	add $r0.3 = $r0.3, $r0.6
;;
	c0	add $r0.8 = $r0.3, -8
	c0	sub $r0.6 = $r0.7, $r0.3
;;
	c0	shl $r0.5 = $r0.5, $r0.8
	c0	goto LBB37_11
;;
LBB37_1:                                ## %entry
	c0	cmpne $b0.0 = $r0.6, 255
;;
;;
	c0	br $b0.0, LBB37_11
;;
## BB#2:                                ## %if.then
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB37_7
;;
## BB#3:                                ## %if.then.3
	c0	and $r0.5 = $r0.3, 2143289344
;;
	c0	cmpne $b0.0 = $r0.5, 2139095040
;;
;;
	c0	br $b0.0, LBB37_6
;;
## BB#4:                                ## %if.then.3
	c0	and $r0.5 = $r0.3, 4194303
;;
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB37_6
;;
## BB#5:                                ## %if.then.i
	c0	mov $r0.5 = float_exception_flags
;;
	c0	ldw $r0.6 = 0[$r0.5]
;;
;;
	c0	or $r0.6 = $r0.6, 16
;;
	c0	stw 0[$r0.5] = $r0.6
;;
LBB37_6:                                ## %float32ToCommonNaN.exit
	c0	mov $r0.5 = 3
	c0	shl $r0.2 = $r0.4, $r0.2
	c0	mov $r0.4 = 29
;;
	c0	shru $r0.5 = $r0.3, $r0.5
	c0	shl $r0.3 = $r0.3, $r0.4
;;
	c0	or $r0.2 = $r0.5, $r0.2
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	or $r0.4 = $r0.2, 2146959360
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB37_11:                               ## %if.end.13
	c0	shl $r0.2 = $r0.4, $r0.2
	c0	mov $r0.3 = 3
	c0	mov $r0.4 = 20
	c0	mov $r0.7 = 29
;;
	c0	or $r0.2 = $r0.2, 939524096
	c0	shl $r0.4 = $r0.6, $r0.4
	c0	shru $r0.6 = $r0.5, $r0.3
;;
	c0	shl $r0.3 = $r0.5, $r0.7
	c0	add $r0.2 = $r0.2, $r0.6
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	add $r0.4 = $r0.2, $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB37_9:                                ## %if.then.10
.return ret($r0.3:u32,$r0.4:u32)
	c0	shl $r0.4 = $r0.4, $r0.2
	c0	mov $r0.3 = 0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB37_7:                                ## %if.end
	c0	shl $r0.2 = $r0.4, $r0.2
	c0	mov $r0.3 = 0
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	or $r0.4 = $r0.2, 2146435072
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float32_round_to_int
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_round_to_int
float32_round_to_int::
## BB#0:                                ## %entry
	c0	mov $r0.2 = 23
;;
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	zxtb $r0.2 = $r0.2
;;
	c0	cmpltu $b0.0 = $r0.2, 150
;;
;;
	c0	br $b0.0, LBB38_8
;;
## BB#1:                                ## %if.then
	c0	and $r0.4 = $r0.3, 8388607
;;
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB38_27
;;
## BB#2:                                ## %if.then
	c0	cmpne $b0.0 = $r0.2, 255
;;
;;
	c0	br $b0.0, LBB38_27
;;
## BB#3:                                ## %if.then.3
	c0	and $r0.4 = $r0.3, 2143289344
	c0	or $r0.2 = $r0.3, 4194304
;;
	c0	cmpne $b0.0 = $r0.4, 2139095040
;;
;;
	c0	br $b0.0, LBB38_4
;;
## BB#5:                                ## %if.then.3
	c0	and $r0.3 = $r0.3, 4194303
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB38_6
;;
## BB#7:                                ## %cond.end.15.i
	c0	mov $r0.4 = float_exception_flags
	c0	mov $r0.3 = $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.4]
;;
;;
	c0	or $r0.2 = $r0.2, 16
	c0	goto LBB38_26
;;
LBB38_8:                                ## %if.end.5
	c0	cmpgtu $b0.0 = $r0.2, 126
;;
;;
	c0	br $b0.0, LBB38_19
;;
## BB#9:                                ## %if.then.7
	c0	and $r0.4 = $r0.3, 2147483647
;;
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB38_27
;;
## BB#10:                               ## %if.end.10
	c0	mov $r0.7 = float_exception_flags
	c0	mov $r0.5 = float_rounding_mode
;;
	c0	mov $r0.4 = 31
	c0	ldw $r0.8 = 0[$r0.7]
;;
	c0	ldw $r0.6 = 0[$r0.5]
	c0	shru $r0.5 = $r0.3, $r0.4
;;
	c0	or $r0.8 = $r0.8, 1
;;
	c0	cmpeq $b0.0 = $r0.6, 3
	c0	stw 0[$r0.7] = $r0.8
;;
;;
	c0	br $b0.0, LBB38_16
;;
## BB#11:                               ## %if.end.10
	c0	cmpeq $b0.0 = $r0.6, 2
;;
;;
	c0	brf $b0.0, LBB38_12
;;
## BB#17:                               ## %sw.bb.21
	c0	cmpne $b0.0 = $r0.5, 0
	c0	mov $r0.2 = -2147483648
;;
;;
.return ret($r0.3:u32)
	c0	slct $r0.3 = $b0.0, $r0.2, 1065353216
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB38_19:                               ## %if.end.25
	c0	mov $r0.5 = float_rounding_mode
	c0	mov $r0.7 = 150
	c0	mov $r0.6 = 1
;;
	c0	mov $r0.4 = $r0.3
	c0	sub $r0.2 = $r0.7, $r0.2
	c0	ldw $r0.7 = 0[$r0.5]
;;
	c0	shl $r0.2 = $r0.6, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.7, 1
;;
;;
	c0	br $b0.0, LBB38_24
;;
## BB#20:                               ## %if.end.25
	c0	cmpne $b0.0 = $r0.7, 0
	c0	add $r0.5 = $r0.2, -1
;;
;;
	c0	br $b0.0, LBB38_23
;;
## BB#21:                               ## %if.then.29
	c0	shru $r0.4 = $r0.2, $r0.6
;;
	c0	add $r0.4 = $r0.4, $r0.3
;;
	c0	and $r0.5 = $r0.4, $r0.5
;;
	c0	cmpne $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB38_24
;;
## BB#22:                               ## %if.then.31
	c0	andc $r0.4 = $r0.2, $r0.4
	c0	goto LBB38_24
;;
LBB38_4:
.return ret($r0.3:u32)
	c0	mov $r0.3 = $r0.2
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB38_6:
.return ret($r0.3:u32)
	c0	mov $r0.3 = $r0.2
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB38_23:                               ## %if.then.35
	c0	cmpeq $b0.0 = $r0.7, 2
	c0	mov $r0.4 = 31
	c0	mov $r0.6 = 0
;;
	c0	shru $r0.4 = $r0.3, $r0.4
;;
	c0	mfb $r0.7 = $b0.0
;;
	c0	cmpeq $b0.0 = $r0.4, $r0.7
;;
;;
	c0	slct $r0.4 = $b0.0, $r0.6, $r0.5
;;
	c0	add $r0.4 = $r0.4, $r0.3
;;
LBB38_24:                               ## %if.end.43
	c0	mov $r0.5 = 0
;;
	c0	sub $r0.2 = $r0.5, $r0.2
;;
	c0	and $r0.2 = $r0.4, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.3
;;
;;
	c0	br $b0.0, LBB38_27
;;
## BB#25:                               ## %if.then.48
	c0	mov $r0.4 = float_exception_flags
;;
	c0	ldw $r0.5 = 0[$r0.4]
	c0	mov $r0.3 = $r0.2
;;
;;
	c0	or $r0.2 = $r0.5, 1
;;
LBB38_26:                               ## %cleanup
	c0	stw 0[$r0.4] = $r0.2
;;
LBB38_27:                               ## %cleanup
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB38_16:                               ## %sw.bb.19
	c0	cmpne $b0.0 = $r0.5, 0
	c0	mov $r0.2 = -1082130432
;;
;;
.return ret($r0.3:u32)
	c0	slct $r0.3 = $b0.0, $r0.2, 0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB38_12:                               ## %if.end.10
	c0	cmpne $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB38_18
;;
## BB#13:                               ## %sw.bb
	c0	and $r0.3 = $r0.3, 8388607
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB38_18
;;
## BB#14:                               ## %sw.bb
	c0	cmpne $b0.0 = $r0.2, 126
;;
;;
	c0	br $b0.0, LBB38_18
;;
## BB#15:                               ## %if.then.16
	c0	shl $r0.2 = $r0.5, $r0.4
;;
.return ret($r0.3:u32)
	c0	or $r0.3 = $r0.2, 1065353216
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB38_18:                               ## %sw.epilog
.return ret($r0.3:u32)
	c0	shl $r0.3 = $r0.5, $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float32_add
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_add
float32_add::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $l0.0
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.6 = $r0.4, $r0.2
	c0	shru $r0.5 = $r0.3, $r0.2
;;
	c0	cmpne $b0.0 = $r0.5, $r0.6
;;
;;
	c0	br $b0.0, LBB39_2
;;
## BB#1:                                ## %if.then
.call addFloat32Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = addFloat32Sigs
;;
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB39_2:                                ## %if.else
.call subFloat32Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = subFloat32Sigs
;;
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @addFloat32Sigs
addFloat32Sigs::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $l0.0
	c0	mov $r0.2 = 23
	c0	mov $r0.10 = 6
;;
	c0	shru $r0.6 = $r0.4, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	zxtb $r0.8 = $r0.6
	c0	zxtb $r0.2 = $r0.2
;;
	c0	sub $r0.9 = $r0.2, $r0.8
	c0	shl $r0.6 = $r0.3, $r0.10
	c0	shl $r0.11 = $r0.4, $r0.10
;;
	c0	cmplt $b0.0 = $r0.9, 1
	c0	and $r0.7 = $r0.6, 536870848
;;
	c0	and $r0.6 = $r0.11, 536870848
;;
;;
	c0	br $b0.0, LBB40_13
;;
## BB#1:                                ## %if.then
	c0	cmpne $b0.0 = $r0.2, 255
;;
;;
	c0	br $b0.0, LBB40_8
;;
## BB#2:                                ## %if.then.6
	c0	cmpeq $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB40_41
;;
## BB#3:                                ## %if.then.7
	c0	and $r0.6 = $r0.4, 4194303
	c0	and $r0.2 = $r0.3, 2143289344
;;
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.5 = $r0.3, 4194303
;;
	c0	cmpne $b0.0 = $r0.6, 0
	c0	cmpne $b0.1 = $r0.5, 0
	c0	cmpeq $b0.2 = $r0.2, 2139095040
;;
	c0	cmpeq $b0.3 = $r0.7, 2139095040
;;
	c0	mfb $r0.6 = $b0.2
;;
	c0	mfb $r0.7 = $b0.3
	c0	mfb $r0.8 = $b0.0
	c0	mfb $r0.9 = $b0.1
;;
	c0	and $r0.7 = $r0.7, $r0.8
	c0	and $r0.6 = $r0.6, $r0.9
;;
	c0	mtb $b0.0 = $r0.7
	c0	mtb $b0.1 = $r0.6
;;
;;
	c0	br $b0.1, LBB40_5
;;
## BB#4:                                ## %if.then.7
	c0	mfb $r0.6 = $b0.0
;;
	c0	cmpne $b0.1 = $r0.6, 1
;;
;;
	c0	br $b0.1, LBB40_6
;;
LBB40_5:                                ## %if.then.i.152
	c0	mov $r0.6 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.6]
;;
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.6] = $r0.7
;;
LBB40_6:                                ## %if.end.i.153
	c0	or $r0.6 = $r0.4, 4194304
	c0	brf $b0.0, LBB40_35
;;
## BB#7:
	c0	mov $r0.3 = $r0.6
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB40_13:                               ## %if.else.13
	c0	cmpgt $b0.0 = $r0.9, -1
;;
;;
	c0	brf $b0.0, LBB40_14
;;
## BB#27:                               ## %if.else.30
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB40_28
;;
## BB#36:                               ## %if.then.40
	c0	add $r0.2 = $r0.6, $r0.7
	c0	mov $r0.3 = 31
;;
	c0	shl $r0.3 = $r0.5, $r0.3
	c0	shru $r0.2 = $r0.2, $r0.10
;;
	c0	or $r0.3 = $r0.2, $r0.3
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB40_8:                                ## %if.end.9
	c0	cmpeq $b0.0 = $r0.8, 0
;;
;;
	c0	br $b0.0, LBB40_10
;;
## BB#9:                                ## %if.end.12.thread
	c0	or $r0.6 = $r0.6, 536870912
	c0	goto LBB40_11
;;
LBB40_14:                               ## %if.then.15
	c0	cmpne $b0.0 = $r0.8, 255
;;
;;
	c0	br $b0.0, LBB40_22
;;
## BB#15:                               ## %if.then.17
	c0	cmpeq $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB40_21
;;
## BB#16:                               ## %if.then.19
	c0	and $r0.6 = $r0.4, 4194303
	c0	and $r0.2 = $r0.3, 2143289344
;;
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.5 = $r0.3, 4194303
;;
	c0	cmpne $b0.0 = $r0.6, 0
	c0	cmpne $b0.1 = $r0.5, 0
	c0	cmpeq $b0.2 = $r0.2, 2139095040
;;
	c0	cmpeq $b0.3 = $r0.7, 2139095040
;;
	c0	mfb $r0.6 = $b0.2
;;
	c0	mfb $r0.7 = $b0.3
	c0	mfb $r0.8 = $b0.0
	c0	mfb $r0.9 = $b0.1
;;
	c0	and $r0.7 = $r0.7, $r0.8
	c0	and $r0.6 = $r0.6, $r0.9
;;
	c0	mtb $b0.0 = $r0.7
	c0	mtb $b0.1 = $r0.6
;;
;;
	c0	br $b0.1, LBB40_18
;;
## BB#17:                               ## %if.then.19
	c0	mfb $r0.6 = $b0.0
;;
	c0	cmpne $b0.1 = $r0.6, 1
;;
;;
	c0	br $b0.1, LBB40_19
;;
LBB40_18:                               ## %if.then.i.115
	c0	mov $r0.6 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.6]
;;
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.6] = $r0.7
;;
LBB40_19:                               ## %if.end.i.116
	c0	or $r0.6 = $r0.4, 4194304
	c0	brf $b0.0, LBB40_35
;;
## BB#20:
	c0	mov $r0.3 = $r0.6
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB40_28:                               ## %if.else.30
	c0	cmpne $b0.0 = $r0.2, 255
;;
;;
	c0	br $b0.0, LBB40_37
;;
## BB#29:                               ## %if.then.32
	c0	or $r0.2 = $r0.6, $r0.7
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB40_41
;;
## BB#30:                               ## %if.then.35
	c0	and $r0.6 = $r0.4, 4194303
	c0	and $r0.2 = $r0.3, 2143289344
;;
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.5 = $r0.3, 4194303
;;
	c0	cmpne $b0.0 = $r0.6, 0
	c0	cmpne $b0.1 = $r0.5, 0
	c0	cmpeq $b0.2 = $r0.2, 2139095040
;;
	c0	cmpeq $b0.3 = $r0.7, 2139095040
;;
	c0	mfb $r0.6 = $b0.2
;;
	c0	mfb $r0.7 = $b0.3
	c0	mfb $r0.8 = $b0.0
	c0	mfb $r0.9 = $b0.1
;;
	c0	and $r0.7 = $r0.7, $r0.8
	c0	and $r0.6 = $r0.6, $r0.9
;;
	c0	mtb $b0.0 = $r0.7
	c0	mtb $b0.1 = $r0.6
;;
;;
	c0	br $b0.1, LBB40_32
;;
## BB#31:                               ## %if.then.35
	c0	mfb $r0.6 = $b0.0
;;
	c0	cmpne $b0.1 = $r0.6, 1
;;
;;
	c0	br $b0.1, LBB40_33
;;
LBB40_32:                               ## %if.then.i
	c0	mov $r0.6 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.6]
;;
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.6] = $r0.7
;;
LBB40_33:                               ## %if.end.i
	c0	or $r0.6 = $r0.4, 4194304
	c0	brf $b0.0, LBB40_35
;;
## BB#34:
	c0	mov $r0.3 = $r0.6
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB40_35:                               ## %cond.false.i.157
	c0	cmpeq $b0.0 = $r0.5, 0
	c0	or $r0.3 = $r0.3, 4194304
;;
	c0	and $r0.4 = $r0.4, 2147483647
	c0	cmpne $b0.1 = $r0.2, 2139095040
;;
	c0	cmpgtu $b0.2 = $r0.4, 2139095040
;;
	c0	slct $r0.2 = $b0.0, $r0.6, $r0.3
;;
	c0	slct $r0.2 = $b0.1, $r0.6, $r0.2
;;
	c0	slct $r0.3 = $b0.2, $r0.2, $r0.3
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB40_10:                               ## %if.end.12
	c0	add $r0.9 = $r0.9, -1
;;
	c0	cmpeq $b0.0 = $r0.9, 0
;;
;;
	c0	br $b0.0, LBB40_39
;;
LBB40_11:                               ## %if.else.i.126
	c0	cmpgt $b0.0 = $r0.9, 31
;;
;;
	c0	br $b0.0, LBB40_38
;;
## BB#12:                               ## %if.then.2.i.133
	c0	mov $r0.3 = 0
;;
	c0	sub $r0.3 = $r0.3, $r0.9
	c0	shru $r0.4 = $r0.6, $r0.9
;;
	c0	and $r0.3 = $r0.3, 31
;;
	c0	shl $r0.3 = $r0.6, $r0.3
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	mfb $r0.3 = $b0.0
;;
	c0	or $r0.6 = $r0.3, $r0.4
	c0	goto LBB40_39
;;
LBB40_38:                               ## %if.else.4.i.136
	c0	cmpne $b0.0 = $r0.6, 0
;;
;;
	c0	mfb $r0.6 = $b0.0
	c0	goto LBB40_39
;;
LBB40_22:                               ## %if.end.23
	c0	cmpeq $b0.0 = $r0.2, 0
	c0	or $r0.2 = $r0.7, 536870912
;;
;;
	c0	mfb $r0.3 = $b0.0
	c0	slct $r0.7 = $b0.0, $r0.7, $r0.2
;;
	c0	add $r0.2 = $r0.9, $r0.3
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB40_23
;;
## BB#24:                               ## %if.else.i
	c0	cmplt $b0.0 = $r0.2, -31
;;
;;
	c0	br $b0.0, LBB40_26
;;
## BB#25:                               ## %if.then.2.i
	c0	and $r0.3 = $r0.2, 31
	c0	mov $r0.4 = 0
;;
	c0	shl $r0.3 = $r0.7, $r0.3
	c0	sub $r0.4 = $r0.4, $r0.2
	c0	mov $r0.2 = $r0.8
;;
	c0	cmpne $b0.0 = $r0.3, 0
	c0	shru $r0.3 = $r0.7, $r0.4
;;
;;
	c0	mfb $r0.4 = $b0.0
;;
	c0	or $r0.7 = $r0.4, $r0.3
	c0	goto LBB40_39
;;
LBB40_37:                               ## %if.end.42
	c0	or $r0.3 = $r0.7, 1073741824
;;
	c0	add $r0.6 = $r0.3, $r0.6
	c0	goto LBB40_40
;;
LBB40_21:                               ## %if.end.21
	c0	mov $r0.2 = 31
;;
	c0	shl $r0.2 = $r0.5, $r0.2
;;
	c0	or $r0.3 = $r0.2, 2139095040
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB40_23:
	c0	mov $r0.2 = $r0.8
	c0	goto LBB40_39
;;
LBB40_26:                               ## %if.else.4.i
	c0	cmpne $b0.0 = $r0.7, 0
	c0	mov $r0.2 = $r0.8
;;
;;
	c0	mfb $r0.7 = $b0.0
;;
LBB40_39:                               ## %if.end.46
	c0	or $r0.3 = $r0.7, 536870912
	c0	mov $r0.4 = 1
;;
	c0	add $r0.3 = $r0.3, $r0.6
;;
	c0	shl $r0.4 = $r0.3, $r0.4
	c0	mov $r0.7 = -1
;;
	c0	cmpgt $r0.6 = $r0.4, -1
	c0	cmplt $b0.0 = $r0.4, 0
;;
	c0	mtb $b0.1 = $r0.6
;;
	c0	slct $r0.6 = $b0.0, $r0.3, $r0.4
;;
	c0	slct $r0.3 = $b0.1, $r0.7, 0
;;
	c0	add $r0.2 = $r0.3, $r0.2
;;
LBB40_40:                               ## %roundAndPack
	c0	mov $r0.4 = $r0.2
	c0	mov $r0.3 = $r0.5
	c0	mov $r0.5 = $r0.6
;;
.call roundAndPackFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = roundAndPackFloat32
;;
LBB40_41:                               ## %cleanup
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @subFloat32Sigs
subFloat32Sigs::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $l0.0
	c0	mov $r0.2 = 23
	c0	mov $r0.6 = 7
;;
	c0	shru $r0.7 = $r0.4, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	zxtb $r0.7 = $r0.7
	c0	zxtb $r0.8 = $r0.2
;;
	c0	sub $r0.9 = $r0.8, $r0.7
	c0	shl $r0.2 = $r0.3, $r0.6
	c0	shl $r0.6 = $r0.4, $r0.6
;;
	c0	cmpgt $b0.0 = $r0.9, 0
	c0	and $r0.2 = $r0.2, 1073741696
;;
	c0	and $r0.6 = $r0.6, 1073741696
;;
;;
	c0	brf $b0.0, LBB41_1
;;
## BB#24:                               ## %aExpBigger
	c0	cmpne $b0.0 = $r0.8, 255
;;
;;
	c0	br $b0.0, LBB41_26
;;
## BB#25:                               ## %if.then.45
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB41_5
;;
	c0	goto LBB41_35
;;
LBB41_1:                                ## %if.end
	c0	cmplt $b0.0 = $r0.9, 0
;;
;;
	c0	br $b0.0, LBB41_15
;;
## BB#2:                                ## %if.end.7
	c0	cmpeq $b0.0 = $r0.8, 0
;;
;;
	c0	brf $b0.0, LBB41_3
;;
## BB#11:                               ## %if.then.15
	c0	mov $r0.8 = 1
;;
	c0	mov $r0.7 = $r0.8
	c0	goto LBB41_12
;;
LBB41_26:                               ## %if.end.50
	c0	cmpeq $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB41_28
;;
## BB#27:                               ## %if.end.56.thread
	c0	or $r0.6 = $r0.6, 1073741824
	c0	goto LBB41_29
;;
LBB41_15:                               ## %bExpBigger
	c0	cmpne $b0.0 = $r0.7, 255
;;
;;
	c0	br $b0.0, LBB41_18
;;
## BB#16:                               ## %if.then.27
	c0	cmpeq $b0.0 = $r0.6, 0
;;
;;
	c0	brf $b0.0, LBB41_5
;;
## BB#17:                               ## %if.end.31
	c0	mov $r0.2 = 31
;;
	c0	shl $r0.2 = $r0.5, $r0.2
;;
	c0	add $r0.2 = $r0.2, -8388608
	c0	goto LBB41_36
;;
LBB41_3:                                ## %if.end.7
	c0	cmpne $b0.0 = $r0.8, 255
;;
;;
	c0	br $b0.0, LBB41_12
;;
## BB#4:                                ## %if.then.9
	c0	or $r0.2 = $r0.6, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB41_10
;;
LBB41_5:                                ## %if.then.10
	c0	and $r0.2 = $r0.4, 4194303
	c0	and $r0.5 = $r0.3, 2143289344
;;
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.6 = $r0.3, 4194303
;;
	c0	cmpne $b0.0 = $r0.2, 0
	c0	cmpne $b0.1 = $r0.6, 0
	c0	cmpeq $b0.2 = $r0.5, 2139095040
;;
	c0	cmpeq $b0.3 = $r0.7, 2139095040
;;
	c0	mfb $r0.2 = $b0.2
;;
	c0	mfb $r0.7 = $b0.3
	c0	mfb $r0.8 = $b0.0
	c0	mfb $r0.9 = $b0.1
;;
	c0	and $r0.7 = $r0.7, $r0.8
	c0	and $r0.2 = $r0.2, $r0.9
;;
	c0	mtb $b0.0 = $r0.7
	c0	mtb $b0.1 = $r0.2
;;
;;
	c0	br $b0.1, LBB41_7
;;
## BB#6:                                ## %if.then.10
	c0	mfb $r0.2 = $b0.0
;;
	c0	cmpne $b0.1 = $r0.2, 1
;;
;;
	c0	br $b0.1, LBB41_8
;;
LBB41_7:                                ## %if.then.i.157
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.2]
;;
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.2] = $r0.7
;;
LBB41_8:                                ## %if.end.i.158
	c0	or $r0.2 = $r0.4, 4194304
	c0	br $b0.0, LBB41_36
;;
## BB#9:                                ## %cond.false.i.162
	c0	cmpeq $b0.0 = $r0.6, 0
	c0	or $r0.3 = $r0.3, 4194304
;;
	c0	and $r0.4 = $r0.4, 2147483647
	c0	cmpne $b0.1 = $r0.5, 2139095040
;;
	c0	cmpgtu $b0.2 = $r0.4, 2139095040
;;
	c0	slct $r0.4 = $b0.0, $r0.2, $r0.3
;;
	c0	slct $r0.2 = $b0.1, $r0.2, $r0.4
;;
	c0	slct $r0.2 = $b0.2, $r0.2, $r0.3
	c0	goto LBB41_36
;;
LBB41_12:                               ## %if.end.16
	c0	cmpltu $b0.0 = $r0.6, $r0.2
;;
;;
	c0	br $b0.0, LBB41_33
;;
## BB#13:                               ## %if.end.19
	c0	cmpltu $b0.0 = $r0.2, $r0.6
;;
;;
	c0	br $b0.0, LBB41_23
;;
## BB#14:                               ## %if.end.22
	c0	mov $r0.2 = float_rounding_mode
;;
	c0	ldw $r0.2 = 0[$r0.2]
	c0	mov $r0.3 = 31
;;
;;
	c0	cmpeq $b0.0 = $r0.2, 3
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	shl $r0.2 = $r0.2, $r0.3
	c0	goto LBB41_36
;;
LBB41_28:                               ## %if.end.56
	c0	add $r0.9 = $r0.9, -1
;;
	c0	cmpeq $b0.0 = $r0.9, 0
;;
;;
	c0	br $b0.0, LBB41_32
;;
LBB41_29:                               ## %if.else.i
	c0	cmpgt $b0.0 = $r0.9, 31
;;
;;
	c0	br $b0.0, LBB41_31
;;
## BB#30:                               ## %if.then.2.i
	c0	mov $r0.3 = 0
;;
	c0	sub $r0.3 = $r0.3, $r0.9
	c0	shru $r0.4 = $r0.6, $r0.9
;;
	c0	and $r0.3 = $r0.3, 31
;;
	c0	shl $r0.3 = $r0.6, $r0.3
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	mfb $r0.3 = $b0.0
;;
	c0	or $r0.6 = $r0.3, $r0.4
	c0	goto LBB41_32
;;
LBB41_31:                               ## %if.else.4.i
	c0	cmpne $b0.0 = $r0.6, 0
;;
;;
	c0	mfb $r0.6 = $b0.0
;;
LBB41_32:                               ## %shift32RightJamming.exit
	c0	or $r0.2 = $r0.2, 1073741824
;;
LBB41_33:                               ## %aBigger
	c0	sub $r0.2 = $r0.2, $r0.6
	c0	mov $r0.7 = $r0.8
	c0	goto LBB41_34
;;
LBB41_18:                               ## %if.end.33
	c0	cmpeq $b0.0 = $r0.8, 0
	c0	or $r0.3 = $r0.2, 1073741824
;;
;;
	c0	mfb $r0.4 = $b0.0
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.3
;;
	c0	add $r0.3 = $r0.9, $r0.4
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB41_22
;;
## BB#19:                               ## %if.else.i.106
	c0	cmplt $b0.0 = $r0.3, -31
;;
;;
	c0	br $b0.0, LBB41_21
;;
## BB#20:                               ## %if.then.2.i.113
	c0	and $r0.4 = $r0.3, 31
	c0	mov $r0.8 = 0
;;
	c0	shl $r0.4 = $r0.2, $r0.4
	c0	sub $r0.3 = $r0.8, $r0.3
;;
	c0	cmpne $b0.0 = $r0.4, 0
	c0	shru $r0.2 = $r0.2, $r0.3
;;
;;
	c0	mfb $r0.3 = $b0.0
;;
	c0	or $r0.2 = $r0.3, $r0.2
	c0	goto LBB41_22
;;
LBB41_21:                               ## %if.else.4.i.116
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
LBB41_22:                               ## %shift32RightJamming.exit118
	c0	or $r0.6 = $r0.6, 1073741824
;;
LBB41_23:                               ## %bBigger
	c0	xor $r0.5 = $r0.5, 1
	c0	sub $r0.2 = $r0.6, $r0.2
;;
LBB41_34:                               ## %normalizeRoundAndPack
	c0	mov $r0.3 = 16
	c0	cmpltu $b0.0 = $r0.2, 65536
	c0	mov $r0.4 = 8
;;
	c0	mov $r0.6 = 22
	c0	shl $r0.3 = $r0.2, $r0.3
	c0	mov $r0.8 = 4
;;
	c0	mfb $r0.9 = $b0.0
	c0	mov $r0.10 = countLeadingZeros32.countLeadingZerosHigh
	c0	slct $r0.3 = $b0.0, $r0.3, $r0.2
;;
	c0	shl $r0.8 = $r0.9, $r0.8
	c0	add $r0.7 = $r0.7, -1
	c0	cmpltu $b0.0 = $r0.3, 16777216
;;
	c0	shl $r0.4 = $r0.3, $r0.4
	c0	or $r0.9 = $r0.8, 8
;;
	c0	slct $r0.3 = $b0.0, $r0.4, $r0.3
;;
	c0	shru $r0.3 = $r0.3, $r0.6
;;
	c0	and $r0.3 = $r0.3, 1020
;;
	c0	add $r0.3 = $r0.10, $r0.3
;;
	c0	ldw $r0.3 = 0[$r0.3]
	c0	slct $r0.4 = $b0.0, $r0.9, $r0.8
;;
;;
	c0	add $r0.4 = $r0.3, $r0.4
	c0	mov $r0.3 = $r0.5
;;
	c0	add $r0.4 = $r0.4, -1
;;
	c0	shl $r0.5 = $r0.2, $r0.4
	c0	sub $r0.4 = $r0.7, $r0.4
;;
.call roundAndPackFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = roundAndPackFloat32
;;
LBB41_35:                               ## %cleanup
	c0	mov $r0.2 = $r0.3
;;
LBB41_36:                               ## %cleanup
	c0	mov $r0.3 = $r0.2
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB41_10:                               ## %if.end.12
	c0	mov $r0.3 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.3]
	c0	mov $r0.2 = 2147483647
;;
;;
	c0	or $r0.4 = $r0.4, 16
;;
	c0	stw 0[$r0.3] = $r0.4
	c0	goto LBB41_36
;;
.endp

#.globl float32_sub
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_sub
float32_sub::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $l0.0
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.6 = $r0.4, $r0.2
	c0	shru $r0.5 = $r0.3, $r0.2
;;
	c0	cmpne $b0.0 = $r0.5, $r0.6
;;
;;
	c0	br $b0.0, LBB42_2
;;
## BB#1:                                ## %if.then
.call subFloat32Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = subFloat32Sigs
;;
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB42_2:                                ## %if.else
.call addFloat32Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = addFloat32Sigs
;;
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

#.globl float32_mul
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_mul
float32_mul::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $l0.0
	c0	mov $r0.5 = 23
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.7 = 31
;;
	c0	shru $r0.3 = $r0.2, $r0.5
	c0	xor $r0.8 = $r0.4, $r0.2
	c0	shru $r0.10 = $r0.4, $r0.5
;;
	c0	zxtb $r0.9 = $r0.3
;;
	c0	cmpne $b0.0 = $r0.9, 255
	c0	and $r0.6 = $r0.2, 8388607
;;
	c0	and $r0.5 = $r0.4, 8388607
	c0	shru $r0.3 = $r0.8, $r0.7
	c0	zxtb $r0.8 = $r0.10
;;
;;
	c0	br $b0.0, LBB43_12
;;
## BB#1:                                ## %if.then
	c0	cmpne $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB43_4
;;
## BB#2:                                ## %lor.lhs.false
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB43_9
;;
## BB#3:                                ## %lor.lhs.false
	c0	cmpne $b0.0 = $r0.8, 255
;;
;;
	c0	br $b0.0, LBB43_9
;;
LBB43_4:                                ## %if.then.8
	c0	and $r0.3 = $r0.4, 4194303
	c0	and $r0.5 = $r0.2, 2143289344
;;
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.6 = $r0.2, 4194303
;;
	c0	cmpne $b0.0 = $r0.3, 0
	c0	cmpne $b0.1 = $r0.6, 0
	c0	cmpeq $b0.2 = $r0.7, 2139095040
;;
	c0	cmpeq $b0.3 = $r0.5, 2139095040
;;
	c0	mfb $r0.3 = $b0.0
	c0	mfb $r0.7 = $b0.2
	c0	mfb $r0.8 = $b0.1
;;
	c0	mfb $r0.9 = $b0.3
	c0	and $r0.3 = $r0.7, $r0.3
;;
	c0	and $r0.7 = $r0.9, $r0.8
	c0	mtb $b0.0 = $r0.3
;;
	c0	mtb $b0.1 = $r0.7
;;
;;
	c0	brf $b0.1, LBB43_5
;;
	c0	goto LBB43_6
;;
LBB43_12:                               ## %if.end.14
	c0	cmpne $b0.0 = $r0.8, 255
;;
;;
	c0	br $b0.0, LBB43_17
;;
## BB#13:                               ## %if.then.16
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB43_15
;;
## BB#14:                               ## %if.then.18
	c0	and $r0.3 = $r0.4, 4194303
	c0	and $r0.5 = $r0.2, 2143289344
;;
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.6 = $r0.2, 4194303
;;
	c0	cmpne $b0.0 = $r0.3, 0
	c0	cmpne $b0.1 = $r0.6, 0
	c0	cmpeq $b0.2 = $r0.5, 2139095040
;;
	c0	cmpeq $b0.3 = $r0.7, 2139095040
;;
	c0	mfb $r0.3 = $b0.2
;;
	c0	mfb $r0.7 = $b0.3
	c0	mfb $r0.8 = $b0.0
	c0	mfb $r0.9 = $b0.1
;;
	c0	and $r0.7 = $r0.7, $r0.8
	c0	and $r0.3 = $r0.3, $r0.9
;;
	c0	mtb $b0.0 = $r0.7
	c0	mtb $b0.1 = $r0.3
;;
;;
	c0	br $b0.1, LBB43_6
;;
LBB43_5:                                ## %if.then.8
	c0	mfb $r0.3 = $b0.0
;;
	c0	cmpne $b0.1 = $r0.3, 1
;;
;;
	c0	br $b0.1, LBB43_7
;;
LBB43_6:                                ## %if.then.i.120
	c0	mov $r0.3 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.3]
;;
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.3] = $r0.7
;;
LBB43_7:                                ## %if.end.i.121
	c0	or $r0.3 = $r0.4, 4194304
	c0	br $b0.0, LBB43_26
;;
## BB#8:                                ## %cond.false.i.125
	c0	cmpeq $b0.0 = $r0.6, 0
	c0	or $r0.2 = $r0.2, 4194304
;;
	c0	and $r0.4 = $r0.4, 2147483647
	c0	cmpne $b0.1 = $r0.5, 2139095040
;;
	c0	cmpgtu $b0.2 = $r0.4, 2139095040
;;
	c0	slct $r0.4 = $b0.0, $r0.3, $r0.2
;;
	c0	slct $r0.3 = $b0.1, $r0.3, $r0.4
;;
	c0	slct $r0.3 = $b0.2, $r0.3, $r0.2
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB43_17:                               ## %if.end.26
	c0	cmpne $b0.0 = $r0.9, 0
;;
;;
	c0	br $b0.0, LBB43_21
;;
## BB#18:                               ## %if.then.28
	c0	cmpne $b0.0 = $r0.6, 0
;;
;;
	c0	brf $b0.0, LBB43_19
;;
## BB#20:                               ## %if.end.32
	c0	cmpltu $b0.0 = $r0.6, 65536
	c0	mov $r0.9 = 16
	c0	mov $r0.10 = 8
;;
	c0	mov $r0.11 = 22
	c0	shl $r0.2 = $r0.2, $r0.9
	c0	mov $r0.9 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	mov $r0.12 = 4
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.6
;;
	c0	cmpltu $b0.1 = $r0.2, 16777216
	c0	shl $r0.10 = $r0.2, $r0.10
;;
;;
	c0	slct $r0.2 = $b0.1, $r0.10, $r0.2
;;
	c0	shru $r0.2 = $r0.2, $r0.11
	c0	mfb $r0.10 = $b0.0
;;
	c0	and $r0.2 = $r0.2, 1020
	c0	shl $r0.10 = $r0.10, $r0.12
;;
	c0	add $r0.2 = $r0.9, $r0.2
	c0	or $r0.9 = $r0.10, 8
;;
	c0	ldw $r0.2 = 0[$r0.2]
	c0	slct $r0.9 = $b0.1, $r0.9, $r0.10
;;
;;
	c0	add $r0.2 = $r0.2, $r0.9
	c0	mov $r0.9 = 9
;;
	c0	add $r0.10 = $r0.2, -8
	c0	sub $r0.9 = $r0.9, $r0.2
;;
	c0	shl $r0.6 = $r0.6, $r0.10
;;
LBB43_21:                               ## %if.end.33
	c0	cmpne $b0.0 = $r0.8, 0
;;
;;
	c0	br $b0.0, LBB43_25
;;
## BB#22:                               ## %if.then.35
	c0	cmpne $b0.0 = $r0.5, 0
;;
;;
	c0	brf $b0.0, LBB43_23
;;
## BB#24:                               ## %if.end.39
	c0	cmpltu $b0.0 = $r0.5, 65536
	c0	mov $r0.2 = 16
	c0	mov $r0.7 = 8
;;
	c0	mov $r0.8 = 22
	c0	shl $r0.2 = $r0.4, $r0.2
	c0	mov $r0.4 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	mov $r0.10 = 4
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.5
;;
	c0	cmpltu $b0.1 = $r0.2, 16777216
	c0	shl $r0.7 = $r0.2, $r0.7
;;
;;
	c0	slct $r0.2 = $b0.1, $r0.7, $r0.2
;;
	c0	shru $r0.2 = $r0.2, $r0.8
	c0	mfb $r0.7 = $b0.0
;;
	c0	and $r0.2 = $r0.2, 1020
	c0	shl $r0.7 = $r0.7, $r0.10
;;
	c0	add $r0.2 = $r0.4, $r0.2
	c0	or $r0.4 = $r0.7, 8
;;
	c0	ldw $r0.2 = 0[$r0.2]
	c0	slct $r0.4 = $b0.1, $r0.4, $r0.7
;;
;;
	c0	add $r0.2 = $r0.2, $r0.4
	c0	mov $r0.4 = 9
;;
	c0	add $r0.7 = $r0.2, -8
	c0	sub $r0.8 = $r0.4, $r0.2
;;
	c0	shl $r0.5 = $r0.5, $r0.7
;;
LBB43_25:                               ## %if.end.40
	c0	mov $r0.2 = 8
	c0	mov $r0.4 = 9
	c0	mov $r0.7 = 7
	c0	mov $r0.10 = 16
;;
	c0	shru $r0.11 = $r0.5, $r0.2
	c0	shru $r0.4 = $r0.6, $r0.4
	c0	shl $r0.2 = $r0.5, $r0.2
	c0	shl $r0.5 = $r0.6, $r0.7
;;
	c0	and $r0.4 = $r0.4, 49151
	c0	and $r0.6 = $r0.11, 32767
;;
	c0	zxth $r0.5 = $r0.5
	c0	zxth $r0.2 = $r0.2
	c0	or $r0.6 = $r0.6, 32768
;;
	c0	or $r0.4 = $r0.4, 16384
	c0	mpylu $r0.7 = $r0.2, $r0.5
	c0	mpyhs $r0.11 = $r0.2, $r0.5
;;
	c0	mpyhs $r0.12 = $r0.2, $r0.4
	c0	mpylu $r0.2 = $r0.2, $r0.4
	c0	mov $r0.13 = 1
	c0	mov $r0.14 = 30
;;
	c0	mpylu $r0.15 = $r0.6, $r0.5
	c0	mpyhs $r0.5 = $r0.6, $r0.5
	c0	add $r0.7 = $r0.7, $r0.11
	c0	add $r0.8 = $r0.8, $r0.9
;;
	c0	add $r0.2 = $r0.2, $r0.12
;;
	c0	add $r0.5 = $r0.15, $r0.5
	c0	mpyhs $r0.9 = $r0.6, $r0.4
	c0	mpylu $r0.4 = $r0.6, $r0.4
;;
	c0	add $r0.2 = $r0.5, $r0.2
;;
	c0	cmpltu $r0.5 = $r0.2, $r0.5
	c0	shl $r0.6 = $r0.2, $r0.10
	c0	shru $r0.2 = $r0.2, $r0.10
;;
	c0	add $r0.7 = $r0.6, $r0.7
	c0	shl $r0.5 = $r0.5, $r0.10
	c0	add $r0.4 = $r0.4, $r0.9
;;
	c0	cmpne $b0.0 = $r0.7, 0
	c0	or $r0.2 = $r0.5, $r0.2
	c0	cmpltu $r0.5 = $r0.7, $r0.6
;;
	c0	add $r0.2 = $r0.2, $r0.4
;;
	c0	mfb $r0.4 = $b0.0
	c0	add $r0.2 = $r0.2, $r0.5
;;
	c0	or $r0.5 = $r0.2, $r0.4
	c0	shru $r0.2 = $r0.2, $r0.14
;;
	c0	and $r0.2 = $r0.2, 1
	c0	shl $r0.6 = $r0.5, $r0.13
;;
	c0	or $r0.2 = $r0.2, -128
	c0	cmpgt $b0.0 = $r0.6, -1
;;
	c0	add $r0.4 = $r0.8, $r0.2
;;
	c0	slct $r0.5 = $b0.0, $r0.6, $r0.5
;;
.call roundAndPackFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = roundAndPackFloat32
;;
LBB43_26:                               ## %cleanup
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB43_9:                                ## %if.end
	c0	or $r0.2 = $r0.8, $r0.5
	c0	goto LBB43_10
;;
LBB43_15:                               ## %if.end.20
	c0	or $r0.2 = $r0.9, $r0.6
;;
LBB43_10:                               ## %if.end
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB43_11
;;
## BB#16:                               ## %if.end.12
	c0	shl $r0.2 = $r0.3, $r0.7
;;
	c0	or $r0.3 = $r0.2, 2139095040
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB43_11:                               ## %if.then.11
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
	c0	mov $r0.3 = 2147483647
;;
;;
	c0	or $r0.4 = $r0.4, 16
;;
	c0	stw 0[$r0.2] = $r0.4
;;
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB43_19:                               ## %if.then.30
	c0	shl $r0.3 = $r0.3, $r0.7
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB43_23:                               ## %if.then.37
	c0	shl $r0.3 = $r0.3, $r0.7
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @roundAndPackFloat32
roundAndPackFloat32::
## BB#0:                                ## %entry
	c0	mov $r0.2 = float_rounding_mode
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB44_1
;;
## BB#2:                                ## %if.then
	c0	cmpeq $b0.1 = $r0.2, 1
;;
;;
	c0	brf $b0.1, LBB44_4
;;
## BB#3:
	c0	mov $r0.2 = 0
	c0	goto LBB44_8
;;
LBB44_1:
	c0	mov $r0.2 = 64
	c0	goto LBB44_8
;;
LBB44_4:                                ## %if.else
	c0	cmpeq $b0.1 = $r0.3, 0
;;
;;
	c0	br $b0.1, LBB44_6
;;
## BB#5:                                ## %if.then.5
	c0	cmpeq $b0.1 = $r0.2, 2
	c0	goto LBB44_7
;;
LBB44_6:                                ## %if.else.9
	c0	cmpeq $b0.1 = $r0.2, 3
;;
LBB44_7:                                ## %if.end.16
	c0	mov $r0.2 = 0
;;
	c0	slct $r0.2 = $b0.1, $r0.2, 127
;;
LBB44_8:                                ## %if.end.16
	c0	zxth $r0.7 = $r0.4
	c0	and $r0.6 = $r0.5, 127
;;
	c0	cmpltu $b0.1 = $r0.7, 253
;;
;;
	c0	br $b0.1, LBB44_19
;;
## BB#9:                                ## %if.then.21
	c0	cmpgt $b0.1 = $r0.4, 253
;;
;;
	c0	br $b0.1, LBB44_12
;;
## BB#10:                               ## %lor.lhs.false
	c0	cmpne $b0.1 = $r0.4, 253
	c0	add $r0.7 = $r0.2, $r0.5
;;
;;
	c0	br $b0.1, LBB44_13
;;
## BB#11:                               ## %lor.lhs.false
	c0	cmpgt $b0.1 = $r0.7, -1
;;
;;
	c0	br $b0.1, LBB44_13
;;
LBB44_12:                               ## %if.then.28
	c0	mov $r0.4 = float_exception_flags
	c0	cmpeq $b0.0 = $r0.2, 0
	c0	mov $r0.2 = 31
;;
	c0	ldw $r0.5 = 0[$r0.4]
	c0	shl $r0.2 = $r0.3, $r0.2
;;
	c0	or $r0.2 = $r0.2, 2139095040
	c0	mfb $r0.3 = $b0.0
;;
	c0	or $r0.5 = $r0.5, 9
	c0	sub $r0.3 = $r0.2, $r0.3
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.4] = $r0.5
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB44_13:                               ## %if.end.31
	c0	cmpgt $b0.1 = $r0.4, -1
;;
;;
	c0	br $b0.1, LBB44_19
;;
## BB#14:                               ## %if.else.i
	c0	mov $r0.6 = float_detect_tininess
	c0	cmplt $b0.1 = $r0.4, -1
	c0	cmpgt $b0.2 = $r0.7, -1
;;
	c0	ldw $r0.6 = 0[$r0.6]
;;
;;
	c0	cmpeq $b0.3 = $r0.6, 1
	c0	cmplt $b0.4 = $r0.4, -31
	c0	mfb $r0.6 = $b0.1
	c0	mfb $r0.7 = $b0.2
;;
;;
	c0	mfb $r0.8 = $b0.3
;;
	c0	or $r0.6 = $r0.6, $r0.8
;;
	c0	or $r0.6 = $r0.7, $r0.6
;;
	c0	mtb $b0.1 = $r0.6
	c0	br $b0.4, LBB44_16
;;
## BB#15:                               ## %if.then.2.i
	c0	and $r0.6 = $r0.4, 31
	c0	mov $r0.7 = 0
;;
	c0	shl $r0.6 = $r0.5, $r0.6
	c0	sub $r0.4 = $r0.7, $r0.4
;;
	c0	cmpne $b0.2 = $r0.6, 0
	c0	shru $r0.4 = $r0.5, $r0.4
;;
;;
	c0	mfb $r0.5 = $b0.2
;;
	c0	or $r0.5 = $r0.5, $r0.4
	c0	goto LBB44_17
;;
LBB44_16:                               ## %if.else.4.i
	c0	cmpne $b0.2 = $r0.5, 0
;;
;;
	c0	mfb $r0.5 = $b0.2
;;
LBB44_17:                               ## %shift32RightJamming.exit
	c0	and $r0.6 = $r0.5, 127
	c0	mfb $r0.7 = $b0.1
;;
	c0	cmpne $b0.1 = $r0.6, 0
	c0	mov $r0.4 = 0
;;
;;
	c0	mfb $r0.8 = $b0.1
;;
	c0	and $r0.7 = $r0.7, $r0.8
;;
	c0	and $r0.7 = $r0.7, 1
;;
	c0	cmpeq $b0.1 = $r0.7, 0
;;
;;
	c0	br $b0.1, LBB44_19
;;
## BB#18:                               ## %if.then.48
	c0	mov $r0.7 = float_exception_flags
;;
	c0	ldw $r0.8 = 0[$r0.7]
;;
;;
	c0	or $r0.8 = $r0.8, 4
;;
	c0	stw 0[$r0.7] = $r0.8
;;
LBB44_19:                               ## %if.end.51
	c0	cmpeq $b0.1 = $r0.6, 0
;;
;;
	c0	br $b0.1, LBB44_21
;;
## BB#20:                               ## %if.then.53
	c0	mov $r0.7 = float_exception_flags
;;
	c0	ldw $r0.8 = 0[$r0.7]
;;
;;
	c0	or $r0.8 = $r0.8, 1
;;
	c0	stw 0[$r0.7] = $r0.8
;;
LBB44_21:                               ## %if.end.54
	c0	cmpeq $b0.1 = $r0.6, 64
	c0	mfb $r0.6 = $b0.0
	c0	add $r0.2 = $r0.5, $r0.2
	c0	mov $r0.5 = 7
;;
;;
	c0	mfb $r0.7 = $b0.1
	c0	shru $r0.2 = $r0.2, $r0.5
	c0	mov $r0.5 = 31
	c0	mov $r0.8 = 23
;;
	c0	and $r0.6 = $r0.6, $r0.7
	c0	shl $r0.3 = $r0.3, $r0.5
	c0	mov $r0.5 = 0
;;
	c0	orc $r0.6 = $r0.6, -2
	c0	shl $r0.4 = $r0.4, $r0.8
;;
	c0	and $r0.2 = $r0.2, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
	c0	or $r0.2 = $r0.2, $r0.3
;;
;;
	c0	slct $r0.3 = $b0.0, $r0.5, $r0.4
;;
.return ret($r0.3:u32)
	c0	add $r0.3 = $r0.2, $r0.3
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float32_div
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_div
float32_div::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $l0.0
	c0	mov $r0.5 = 23
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.7 = 31
;;
	c0	shru $r0.3 = $r0.2, $r0.5
	c0	xor $r0.9 = $r0.4, $r0.2
	c0	shru $r0.10 = $r0.4, $r0.5
;;
	c0	zxtb $r0.8 = $r0.3
;;
	c0	cmpne $b0.0 = $r0.8, 255
	c0	and $r0.6 = $r0.2, 8388607
;;
	c0	and $r0.5 = $r0.4, 8388607
	c0	shru $r0.3 = $r0.9, $r0.7
	c0	zxtb $r0.10 = $r0.10
;;
;;
	c0	br $b0.0, LBB45_12
;;
## BB#1:                                ## %if.then
	c0	cmpeq $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB45_7
;;
## BB#2:                                ## %if.then.6
	c0	and $r0.3 = $r0.4, 4194303
	c0	and $r0.5 = $r0.2, 2143289344
;;
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.6 = $r0.2, 4194303
;;
	c0	cmpne $b0.0 = $r0.3, 0
	c0	cmpne $b0.1 = $r0.6, 0
	c0	cmpeq $b0.2 = $r0.7, 2139095040
;;
	c0	cmpeq $b0.3 = $r0.5, 2139095040
;;
	c0	mfb $r0.3 = $b0.0
	c0	mfb $r0.7 = $b0.2
	c0	mfb $r0.8 = $b0.1
;;
	c0	mfb $r0.9 = $b0.3
	c0	and $r0.3 = $r0.7, $r0.3
;;
	c0	and $r0.7 = $r0.9, $r0.8
	c0	mtb $b0.0 = $r0.3
;;
	c0	mtb $b0.1 = $r0.7
;;
;;
	c0	brf $b0.1, LBB45_3
;;
	c0	goto LBB45_4
;;
LBB45_12:                               ## %if.end.16
	c0	cmpeq $b0.0 = $r0.10, 0
;;
;;
	c0	brf $b0.0, LBB45_13
;;
## BB#16:                               ## %if.then.26
	c0	cmpne $b0.0 = $r0.5, 0
;;
;;
	c0	brf $b0.0, LBB45_17
;;
## BB#20:                               ## %if.end.33
	c0	cmpltu $b0.0 = $r0.5, 65536
	c0	mov $r0.9 = 16
	c0	mov $r0.10 = 8
;;
	c0	mov $r0.11 = 22
	c0	shl $r0.4 = $r0.4, $r0.9
	c0	mov $r0.9 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	mov $r0.12 = 4
	c0	slct $r0.4 = $b0.0, $r0.4, $r0.5
;;
	c0	cmpltu $b0.1 = $r0.4, 16777216
	c0	shl $r0.10 = $r0.4, $r0.10
;;
;;
	c0	slct $r0.4 = $b0.1, $r0.10, $r0.4
;;
	c0	shru $r0.4 = $r0.4, $r0.11
	c0	mfb $r0.10 = $b0.0
;;
	c0	and $r0.4 = $r0.4, 1020
	c0	shl $r0.10 = $r0.10, $r0.12
;;
	c0	add $r0.4 = $r0.9, $r0.4
	c0	or $r0.9 = $r0.10, 8
;;
	c0	ldw $r0.4 = 0[$r0.4]
	c0	slct $r0.9 = $b0.1, $r0.9, $r0.10
;;
;;
	c0	add $r0.4 = $r0.4, $r0.9
	c0	mov $r0.9 = 9
;;
	c0	add $r0.11 = $r0.4, -8
	c0	sub $r0.10 = $r0.9, $r0.4
;;
	c0	shl $r0.5 = $r0.5, $r0.11
	c0	goto LBB45_21
;;
LBB45_13:                               ## %if.end.16
	c0	cmpne $b0.0 = $r0.10, 255
;;
;;
	c0	br $b0.0, LBB45_21
;;
## BB#14:                               ## %if.then.18
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	brf $b0.0, LBB45_9
;;
## BB#15:                               ## %if.end.22
	c0	shl $r0.3 = $r0.3, $r0.7
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB45_21:                               ## %if.end.34
	c0	cmpne $b0.0 = $r0.8, 0
;;
;;
	c0	br $b0.0, LBB45_25
;;
## BB#22:                               ## %if.then.36
	c0	cmpne $b0.0 = $r0.6, 0
;;
;;
	c0	brf $b0.0, LBB45_23
;;
## BB#24:                               ## %if.end.40
	c0	cmpltu $b0.0 = $r0.6, 65536
	c0	mov $r0.4 = 16
	c0	mov $r0.7 = 8
;;
	c0	mov $r0.8 = 22
	c0	shl $r0.2 = $r0.2, $r0.4
	c0	mov $r0.4 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	mov $r0.9 = 4
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.6
;;
	c0	cmpltu $b0.1 = $r0.2, 16777216
	c0	shl $r0.7 = $r0.2, $r0.7
;;
;;
	c0	slct $r0.2 = $b0.1, $r0.7, $r0.2
;;
	c0	shru $r0.2 = $r0.2, $r0.8
	c0	mfb $r0.7 = $b0.0
;;
	c0	and $r0.2 = $r0.2, 1020
	c0	shl $r0.7 = $r0.7, $r0.9
;;
	c0	add $r0.2 = $r0.4, $r0.2
	c0	or $r0.4 = $r0.7, 8
;;
	c0	ldw $r0.2 = 0[$r0.2]
	c0	slct $r0.4 = $b0.1, $r0.4, $r0.7
;;
;;
	c0	add $r0.2 = $r0.2, $r0.4
	c0	mov $r0.4 = 9
;;
	c0	add $r0.7 = $r0.2, -8
	c0	sub $r0.8 = $r0.4, $r0.2
;;
	c0	shl $r0.6 = $r0.6, $r0.7
;;
LBB45_25:                               ## %if.end.41
	c0	mov $r0.2 = 7
	c0	mov $r0.4 = 8
	c0	mov $r0.7 = 1
	c0	mov $r0.11 = 125
;;
	c0	shl $r0.2 = $r0.6, $r0.2
	c0	shl $r0.9 = $r0.5, $r0.4
;;
	c0	or $r0.4 = $r0.2, 1073741824
	c0	or $r0.2 = $r0.9, -2147483648
;;
	c0	shl $r0.6 = $r0.4, $r0.7
;;
	c0	cmpleu $b0.0 = $r0.2, $r0.6
	c0	sub $r0.7 = $r0.8, $r0.10
	c0	cmpgtu $b0.1 = $r0.2, $r0.6
;;
;;
	c0	mfb $r0.6 = $b0.0
	c0	slct $r0.8 = $b0.1, $r0.11, 126
;;
	c0	shru $r0.6 = $r0.4, $r0.6
	c0	add $r0.4 = $r0.7, $r0.8
;;
	c0	cmpleu $b0.0 = $r0.2, $r0.6
;;
;;
	c0	br $b0.0, LBB45_26
;;
## BB#27:                               ## %if.end.i
	c0	mov $r0.7 = 16
;;
	c0	shru $r0.8 = $r0.2, $r0.7
;;
	c0	shl $r0.13 = $r0.8, $r0.7
;;
	c0	cmpleu $b0.0 = $r0.13, $r0.6
;;
;;
	c0	br $b0.0, LBB45_28
;;
## BB#29:                               ## %cond.false.i
	c0	cmplt $r0.10 = $r0.8, $r0.0
	c0	mov $r0.11 = 0
;;
	c0	shru $r0.12 = $r0.6, $r0.10
	c0	mtb $b0.0 = $r0.11
	c0	shru $r0.14 = $r0.8, $r0.10
	c0	mtb $b0.1 = $r0.11
;;
;;
	c0	addcg $r0.11, $b0.0 = $r0.12, $r0.12, $b0.0
;;
	c0	divs $r0.12, $b0.0 = $r0.0, $r0.14, $b0.0
	c0	addcg $r0.15, $b0.1 = $r0.11, $r0.11, $b0.1
;;
	c0	addcg $r0.11, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.11, $r0.11, $b0.1
	c0	divs $r0.11, $b0.0 = $r0.12, $r0.14, $b0.0
;;
	c0	addcg $r0.12, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.11, $b0.0 = $r0.11, $r0.14, $b0.0
;;
	c0	addcg $r0.12, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.11, $b0.0 = $r0.11, $r0.14, $b0.0
;;
	c0	addcg $r0.12, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.11, $b0.0 = $r0.11, $r0.14, $b0.0
;;
	c0	addcg $r0.12, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.11, $b0.0 = $r0.11, $r0.14, $b0.0
;;
	c0	addcg $r0.12, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.11, $b0.0 = $r0.11, $r0.14, $b0.0
;;
	c0	addcg $r0.12, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.11, $b0.0 = $r0.11, $r0.14, $b0.0
;;
	c0	addcg $r0.12, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.11, $b0.0 = $r0.11, $r0.14, $b0.0
;;
	c0	addcg $r0.12, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.11, $b0.0 = $r0.11, $r0.14, $b0.0
;;
	c0	addcg $r0.12, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.11, $b0.0 = $r0.11, $r0.14, $b0.0
;;
	c0	addcg $r0.12, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.11, $b0.0 = $r0.11, $r0.14, $b0.0
;;
	c0	addcg $r0.12, $b0.2 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.14, $b0.1
	c0	mtb $b0.0 = $r0.10
;;
	c0	addcg $r0.10, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.14, $b0.2
;;
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.14, $b0.1
	c0	addcg $r0.12, $b0.2 = $r0.10, $r0.10, $b0.2
;;
	c0	addcg $r0.10, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.14, $b0.2
;;
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.14, $b0.1
	c0	addcg $r0.12, $b0.2 = $r0.10, $r0.10, $b0.2
;;
	c0	addcg $r0.10, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.14, $b0.2
;;
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.14, $b0.1
	c0	addcg $r0.12, $b0.2 = $r0.10, $r0.10, $b0.2
;;
	c0	addcg $r0.10, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.14, $b0.2
	c0	cmpgeu $r0.12 = $r0.6, $r0.8
;;
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.14, $b0.1
	c0	addcg $r0.14, $b0.2 = $r0.10, $r0.10, $b0.2
;;
	c0	cmpge $b0.2 = $r0.11, $r0.0
	c0	addcg $r0.10, $b0.1 = $r0.14, $r0.14, $b0.1
;;
	c0	orc $r0.10 = $r0.10, $r0.0
;;
	c0	mfb $r0.11 = $b0.2
;;
	c0	sh1add $r0.10 = $r0.10, $r0.11
;;
	c0	slct $r0.10 = $b0.0, $r0.12, $r0.10
;;
	c0	shl $r0.12 = $r0.10, $r0.7
	c0	goto LBB45_30
;;
LBB45_7:                                ## %if.end
	c0	cmpne $b0.0 = $r0.10, 255
;;
;;
	c0	br $b0.0, LBB45_11
;;
## BB#8:                                ## %if.then.9
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB45_10
;;
LBB45_9:                                ## %if.then.11
	c0	and $r0.3 = $r0.4, 4194303
	c0	and $r0.5 = $r0.2, 2143289344
;;
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.6 = $r0.2, 4194303
;;
	c0	cmpne $b0.0 = $r0.3, 0
	c0	cmpne $b0.1 = $r0.6, 0
	c0	cmpeq $b0.2 = $r0.5, 2139095040
;;
	c0	cmpeq $b0.3 = $r0.7, 2139095040
;;
	c0	mfb $r0.3 = $b0.2
;;
	c0	mfb $r0.7 = $b0.3
	c0	mfb $r0.8 = $b0.0
	c0	mfb $r0.9 = $b0.1
;;
	c0	and $r0.7 = $r0.7, $r0.8
	c0	and $r0.3 = $r0.3, $r0.9
;;
	c0	mtb $b0.0 = $r0.7
	c0	mtb $b0.1 = $r0.3
;;
;;
	c0	br $b0.1, LBB45_4
;;
LBB45_3:                                ## %if.then.6
	c0	mfb $r0.3 = $b0.0
;;
	c0	cmpne $b0.1 = $r0.3, 1
;;
;;
	c0	br $b0.1, LBB45_5
;;
LBB45_4:                                ## %if.then.i.169
	c0	mov $r0.3 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.3]
;;
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.3] = $r0.7
;;
LBB45_5:                                ## %if.end.i.170
	c0	or $r0.3 = $r0.4, 4194304
	c0	br $b0.0, LBB45_41
;;
## BB#6:                                ## %cond.false.i.174
	c0	cmpeq $b0.0 = $r0.6, 0
	c0	or $r0.2 = $r0.2, 4194304
;;
	c0	and $r0.4 = $r0.4, 2147483647
	c0	cmpne $b0.1 = $r0.5, 2139095040
;;
	c0	cmpgtu $b0.2 = $r0.4, 2139095040
;;
	c0	slct $r0.4 = $b0.0, $r0.3, $r0.2
;;
	c0	slct $r0.3 = $b0.1, $r0.3, $r0.4
;;
	c0	slct $r0.3 = $b0.2, $r0.3, $r0.2
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB45_26:
	c0	mov $r0.5 = -1
	c0	goto LBB45_40
;;
LBB45_17:                               ## %if.then.28
	c0	mov $r0.2 = float_exception_flags
	c0	or $r0.5 = $r0.8, $r0.6
;;
	c0	ldw $r0.4 = 0[$r0.2]
	c0	cmpne $b0.0 = $r0.5, 0
;;
;;
	c0	brf $b0.0, LBB45_18
;;
## BB#19:                               ## %if.end.31
	c0	shl $r0.3 = $r0.3, $r0.7
	c0	or $r0.4 = $r0.4, 2
;;
	c0	or $r0.3 = $r0.3, 2139095040
	c0	stw 0[$r0.2] = $r0.4
;;
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB45_11:                               ## %if.end.14
	c0	shl $r0.2 = $r0.3, $r0.7
;;
	c0	or $r0.3 = $r0.2, 2139095040
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB45_28:
	c0	mov $r0.12 = -65536
;;
LBB45_30:                               ## %cond.end.i
	c0	shru $r0.10 = $r0.12, $r0.7
	c0	and $r0.11 = $r0.9, 65280
	c0	mov $r0.9 = -1
;;
	c0	mpyhs $r0.14 = $r0.10, $r0.8
	c0	mpyhs $r0.15 = $r0.10, $r0.11
;;
	c0	mpylu $r0.16 = $r0.10, $r0.11
	c0	mpylu $r0.17 = $r0.10, $r0.8
;;
;;
	c0	add $r0.15 = $r0.16, $r0.15
	c0	mov $r0.10 = 0
	c0	add $r0.14 = $r0.17, $r0.14
;;
	c0	shl $r0.16 = $r0.15, $r0.7
	c0	shru $r0.15 = $r0.15, $r0.7
	c0	sub $r0.17 = $r0.6, $r0.14
;;
	c0	cmpne $r0.18 = $r0.16, 0
	c0	sub $r0.14 = $r0.10, $r0.16
	c0	sub $r0.15 = $r0.17, $r0.15
;;
	c0	mtb $b0.0 = $r0.18
;;
;;
	c0	slct $r0.16 = $b0.0, $r0.9, 0
;;
	c0	add $r0.15 = $r0.15, $r0.16
;;
	c0	cmpgt $b0.0 = $r0.15, -1
;;
;;
	c0	br $b0.0, LBB45_33
;;
## BB#31:                               ## %while.body.lr.ph.i
	c0	mov $r0.16 = 24
;;
	c0	shl $r0.5 = $r0.5, $r0.16
;;
LBB45_32:                               ## %while.body.i
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.14 = $r0.14, $r0.5
	c0	add $r0.15 = $r0.15, $r0.8
	c0	add $r0.12 = $r0.12, -65536
;;
	c0	cmpltu $r0.16 = $r0.14, $r0.5
;;
	c0	add $r0.15 = $r0.15, $r0.16
;;
	c0	cmplt $b0.0 = $r0.15, 0
;;
;;
	c0	br $b0.0, LBB45_32
;;
LBB45_33:                               ## %while.end.i
	c0	shl $r0.5 = $r0.15, $r0.7
	c0	shru $r0.14 = $r0.14, $r0.7
;;
	c0	or $r0.5 = $r0.14, $r0.5
;;
	c0	cmpleu $b0.0 = $r0.13, $r0.5
;;
;;
	c0	br $b0.0, LBB45_34
;;
## BB#35:                               ## %cond.false.10.i
	c0	cmplt $r0.13 = $r0.8, $r0.0
	c0	mov $r0.14 = 0
;;
	c0	shru $r0.15 = $r0.5, $r0.13
	c0	mtb $b0.0 = $r0.14
	c0	shru $r0.16 = $r0.8, $r0.13
	c0	mtb $b0.1 = $r0.14
;;
;;
	c0	addcg $r0.14, $b0.0 = $r0.15, $r0.15, $b0.0
;;
	c0	divs $r0.15, $b0.0 = $r0.0, $r0.16, $b0.0
	c0	addcg $r0.17, $b0.1 = $r0.14, $r0.14, $b0.1
;;
	c0	addcg $r0.14, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.15, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.2 = $r0.14, $r0.16, $b0.0
	c0	mtb $b0.0 = $r0.13
;;
	c0	addcg $r0.13, $b0.2 = $r0.17, $r0.17, $b0.2
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.13, $b0.2 = $r0.14, $r0.16, $b0.2
;;
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.16, $b0.1
	c0	addcg $r0.14, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	addcg $r0.15, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.16, $b0.2
;;
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.16, $b0.1
	c0	cmpgeu $r0.5 = $r0.5, $r0.8
	c0	addcg $r0.14, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	cmpge $b0.2 = $r0.13, $r0.0
	c0	addcg $r0.13, $b0.1 = $r0.14, $r0.14, $b0.1
;;
	c0	orc $r0.13 = $r0.13, $r0.0
;;
	c0	mfb $r0.14 = $b0.2
;;
	c0	sh1add $r0.13 = $r0.13, $r0.14
;;
	c0	slct $r0.5 = $b0.0, $r0.5, $r0.13
	c0	goto LBB45_36
;;
LBB45_34:
	c0	mov $r0.5 = 65535
;;
LBB45_36:                               ## %estimateDiv64To32.exit
	c0	or $r0.5 = $r0.5, $r0.12
;;
	c0	and $r0.12 = $r0.5, 63
;;
	c0	cmpgtu $b0.0 = $r0.12, 2
;;
;;
	c0	br $b0.0, LBB45_40
;;
## BB#37:                               ## %if.then.51
	c0	shru $r0.12 = $r0.5, $r0.7
	c0	zxth $r0.13 = $r0.5
;;
	c0	mpyhs $r0.14 = $r0.12, $r0.11
	c0	mpylu $r0.15 = $r0.12, $r0.11
;;
	c0	mpylu $r0.16 = $r0.13, $r0.8
	c0	mpyhs $r0.17 = $r0.13, $r0.8
;;
	c0	add $r0.14 = $r0.15, $r0.14
	c0	mpylu $r0.15 = $r0.13, $r0.11
	c0	mpyhs $r0.11 = $r0.13, $r0.11
;;
	c0	add $r0.13 = $r0.16, $r0.17
	c0	mpylu $r0.16 = $r0.12, $r0.8
	c0	mpyhs $r0.8 = $r0.12, $r0.8
;;
	c0	add $r0.12 = $r0.14, $r0.13
;;
	c0	shl $r0.13 = $r0.12, $r0.7
	c0	add $r0.11 = $r0.15, $r0.11
;;
	c0	add $r0.11 = $r0.13, $r0.11
;;
	c0	cmpltu $r0.13 = $r0.11, $r0.13
;;
	c0	mtb $b0.0 = $r0.13
	c0	add $r0.8 = $r0.16, $r0.8
;;
	c0	sub $r0.8 = $r0.6, $r0.8
	c0	cmpltu $r0.6 = $r0.12, $r0.14
	c0	shru $r0.12 = $r0.12, $r0.7
;;
	c0	shl $r0.7 = $r0.6, $r0.7
	c0	cmpne $r0.13 = $r0.11, 0
	c0	sub $r0.6 = $r0.10, $r0.11
;;
	c0	or $r0.7 = $r0.7, $r0.12
	c0	mtb $b0.1 = $r0.13
;;
	c0	sub $r0.7 = $r0.8, $r0.7
	c0	mfb $r0.8 = $b0.0
;;
	c0	slct $r0.9 = $b0.1, $r0.9, 0
	c0	add $r0.7 = $r0.7, $r0.8
;;
	c0	add $r0.7 = $r0.7, $r0.9
;;
	c0	cmpgt $b0.0 = $r0.7, -1
;;
;;
	c0	br $b0.0, LBB45_39
;;
LBB45_38:                               ## %while.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.6 = $r0.6, $r0.2
	c0	add $r0.5 = $r0.5, -1
;;
	c0	cmpltu $r0.8 = $r0.6, $r0.2
;;
	c0	add $r0.7 = $r0.8, $r0.7
;;
	c0	cmplt $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB45_38
;;
LBB45_39:                               ## %while.end
	c0	cmpne $b0.0 = $r0.6, 0
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	or $r0.5 = $r0.2, $r0.5
;;
LBB45_40:                               ## %if.end.55
.call roundAndPackFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = roundAndPackFloat32
;;
LBB45_41:                               ## %cleanup
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB45_23:                               ## %if.then.38
	c0	shl $r0.3 = $r0.3, $r0.7
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB45_10:                               ## %if.end.13
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
	c0	mov $r0.3 = 2147483647
;;
;;
	c0	or $r0.4 = $r0.4, 16
;;
	c0	stw 0[$r0.2] = $r0.4
;;
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB45_18:                               ## %if.then.30
	c0	or $r0.4 = $r0.4, 16
	c0	mov $r0.3 = 2147483647
;;
	c0	stw 0[$r0.2] = $r0.4
;;
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

#.globl float32_rem
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_rem
float32_rem::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $l0.0
	c0	mov $r0.2 = 23
;;
	c0	shru $r0.5 = $r0.3, $r0.2
;;
	c0	zxtb $r0.7 = $r0.5
	c0	shru $r0.2 = $r0.4, $r0.2
;;
	c0	cmpne $b0.0 = $r0.7, 255
	c0	and $r0.5 = $r0.3, 8388607
;;
	c0	and $r0.6 = $r0.4, 8388607
	c0	zxtb $r0.2 = $r0.2
;;
;;
	c0	br $b0.0, LBB46_9
;;
## BB#1:                                ## %if.then
	c0	cmpne $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB46_4
;;
## BB#2:                                ## %lor.lhs.false
	c0	cmpeq $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB46_19
;;
## BB#3:                                ## %lor.lhs.false
	c0	cmpne $b0.0 = $r0.2, 255
;;
;;
	c0	br $b0.0, LBB46_19
;;
LBB46_4:                                ## %if.then.8
	c0	and $r0.6 = $r0.4, 4194303
	c0	and $r0.2 = $r0.3, 2143289344
;;
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.5 = $r0.3, 4194303
;;
	c0	cmpne $b0.0 = $r0.6, 0
	c0	cmpne $b0.1 = $r0.5, 0
	c0	cmpeq $b0.2 = $r0.7, 2139095040
;;
	c0	cmpeq $b0.3 = $r0.2, 2139095040
;;
;;
	c0	mfb $r0.6 = $b0.3
	c0	mfb $r0.7 = $b0.2
	c0	mfb $r0.8 = $b0.0
	c0	mfb $r0.9 = $b0.1
;;
	c0	and $r0.7 = $r0.7, $r0.8
	c0	and $r0.6 = $r0.6, $r0.9
;;
	c0	mtb $b0.0 = $r0.7
	c0	mtb $b0.1 = $r0.6
;;
;;
	c0	br $b0.1, LBB46_6
;;
## BB#5:                                ## %if.then.8
	c0	mfb $r0.6 = $b0.0
;;
	c0	cmpne $b0.1 = $r0.6, 1
;;
;;
	c0	br $b0.1, LBB46_7
;;
LBB46_6:                                ## %if.then.i.250
	c0	mov $r0.6 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.6]
;;
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.6] = $r0.7
;;
LBB46_7:                                ## %if.end.i.251
	c0	or $r0.6 = $r0.4, 4194304
	c0	brf $b0.0, LBB46_17
;;
## BB#8:
	c0	mov $r0.3 = $r0.6
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB46_9:                                ## %if.end.10
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB46_10
;;
## BB#18:                               ## %if.then.19
	c0	cmpne $b0.0 = $r0.6, 0
;;
;;
	c0	brf $b0.0, LBB46_19
;;
## BB#20:                               ## %if.end.22
	c0	cmpltu $b0.0 = $r0.6, 65536
	c0	mov $r0.2 = 16
	c0	mov $r0.8 = 8
;;
	c0	mov $r0.9 = 22
	c0	shl $r0.2 = $r0.4, $r0.2
	c0	mov $r0.4 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	mov $r0.10 = 4
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.6
;;
	c0	cmpltu $b0.1 = $r0.2, 16777216
	c0	shl $r0.8 = $r0.2, $r0.8
;;
;;
	c0	slct $r0.2 = $b0.1, $r0.8, $r0.2
;;
	c0	shru $r0.2 = $r0.2, $r0.9
	c0	mfb $r0.8 = $b0.0
;;
	c0	and $r0.2 = $r0.2, 1020
	c0	shl $r0.8 = $r0.8, $r0.10
;;
	c0	add $r0.2 = $r0.4, $r0.2
	c0	or $r0.4 = $r0.8, 8
;;
	c0	ldw $r0.2 = 0[$r0.2]
	c0	slct $r0.4 = $b0.1, $r0.4, $r0.8
;;
;;
	c0	add $r0.2 = $r0.2, $r0.4
	c0	mov $r0.4 = 9
;;
	c0	add $r0.8 = $r0.2, -8
	c0	sub $r0.2 = $r0.4, $r0.2
;;
	c0	shl $r0.6 = $r0.6, $r0.8
	c0	goto LBB46_21
;;
LBB46_10:                               ## %if.end.10
	c0	cmpne $b0.0 = $r0.2, 255
;;
;;
	c0	br $b0.0, LBB46_21
;;
## BB#11:                               ## %if.then.12
	c0	cmpeq $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB46_62
;;
## BB#12:                               ## %if.then.14
	c0	and $r0.6 = $r0.4, 4194303
	c0	and $r0.2 = $r0.3, 2143289344
;;
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.5 = $r0.3, 4194303
;;
	c0	cmpne $b0.0 = $r0.6, 0
	c0	cmpne $b0.1 = $r0.5, 0
	c0	cmpeq $b0.2 = $r0.2, 2139095040
;;
	c0	cmpeq $b0.3 = $r0.7, 2139095040
;;
	c0	mfb $r0.6 = $b0.2
;;
	c0	mfb $r0.7 = $b0.3
	c0	mfb $r0.8 = $b0.0
	c0	mfb $r0.9 = $b0.1
;;
	c0	and $r0.7 = $r0.7, $r0.8
	c0	and $r0.6 = $r0.6, $r0.9
;;
	c0	mtb $b0.0 = $r0.7
	c0	mtb $b0.1 = $r0.6
;;
;;
	c0	br $b0.1, LBB46_14
;;
## BB#13:                               ## %if.then.14
	c0	mfb $r0.6 = $b0.0
;;
	c0	cmpne $b0.1 = $r0.6, 1
;;
;;
	c0	br $b0.1, LBB46_15
;;
LBB46_14:                               ## %if.then.i
	c0	mov $r0.6 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.6]
;;
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.6] = $r0.7
;;
LBB46_15:                               ## %if.end.i.233
	c0	or $r0.6 = $r0.4, 4194304
	c0	brf $b0.0, LBB46_17
;;
## BB#16:
	c0	mov $r0.3 = $r0.6
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB46_21:                               ## %if.end.23
	c0	cmpne $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB46_24
;;
## BB#22:                               ## %if.then.25
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB46_62
;;
## BB#23:                               ## %if.end.28
	c0	cmpltu $b0.0 = $r0.5, 65536
	c0	mov $r0.4 = 16
	c0	mov $r0.7 = 8
;;
	c0	mov $r0.8 = 22
	c0	shl $r0.4 = $r0.3, $r0.4
	c0	mov $r0.9 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	mov $r0.10 = 4
	c0	slct $r0.4 = $b0.0, $r0.4, $r0.5
;;
	c0	cmpltu $b0.1 = $r0.4, 16777216
	c0	shl $r0.7 = $r0.4, $r0.7
;;
;;
	c0	slct $r0.4 = $b0.1, $r0.7, $r0.4
;;
	c0	shru $r0.4 = $r0.4, $r0.8
	c0	mfb $r0.7 = $b0.0
;;
	c0	and $r0.4 = $r0.4, 1020
	c0	shl $r0.7 = $r0.7, $r0.10
;;
	c0	add $r0.4 = $r0.9, $r0.4
	c0	or $r0.8 = $r0.7, 8
;;
	c0	ldw $r0.4 = 0[$r0.4]
	c0	slct $r0.7 = $b0.1, $r0.8, $r0.7
;;
;;
	c0	add $r0.4 = $r0.4, $r0.7
	c0	mov $r0.7 = 9
;;
	c0	add $r0.8 = $r0.4, -8
	c0	sub $r0.7 = $r0.7, $r0.4
;;
	c0	shl $r0.5 = $r0.5, $r0.8
;;
LBB46_24:                               ## %if.end.29
	c0	mov $r0.4 = 8
	c0	sub $r0.9 = $r0.7, $r0.2
;;
	c0	shl $r0.8 = $r0.6, $r0.4
	c0	shl $r0.5 = $r0.5, $r0.4
	c0	cmpgt $b0.0 = $r0.9, -1
;;
	c0	or $r0.7 = $r0.5, -2147483648
	c0	or $r0.5 = $r0.8, -2147483648
;;
	c0	brf $b0.0, LBB46_25
;;
## BB#28:                               ## %if.end.37
	c0	cmpgeu $b0.0 = $r0.7, $r0.5
	c0	cmplt $b0.1 = $r0.9, 33
	c0	add $r0.9 = $r0.9, -32
;;
;;
	c0	slct $r0.10 = $b0.0, $r0.5, 0
;;
	c0	sub $r0.7 = $r0.7, $r0.10
	c0	br $b0.1, LBB46_29
;;
## BB#30:                               ## %while.body.lr.ph
	c0	mov $r0.10 = 16
	c0	mov $r0.17 = 2
;;
	c0	shru $r0.11 = $r0.5, $r0.10
	c0	mov $r0.12 = 0
	c0	mov $r0.18 = 24
;;
	c0	mov $r0.13 = 65535
	c0	and $r0.14 = $r0.8, 65280
;;
	c0	mov $r0.15 = -65536
	c0	mov $r0.16 = -1
	c0	mov $r0.21 = $r0.9
;;
	c0	shru $r0.9 = $r0.5, $r0.17
	c0	shl $r0.17 = $r0.6, $r0.18
	c0	cmplt $r0.18 = $r0.11, $r0.0
	c0	shl $r0.19 = $r0.11, $r0.10
;;
	c0	sub $r0.20 = $r0.12, $r0.9
	c0	mtb $b0.0 = $r0.18
	c0	shru $r0.22 = $r0.11, $r0.18
;;
LBB46_31:                               ## %while.body
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB46_35 Depth 2
	c0	cmpleu $b0.1 = $r0.5, $r0.7
	c0	mov $r0.9 = $r0.16
;;
;;
	c0	br $b0.1, LBB46_39
;;
## BB#32:                               ## %if.end.i.153
                                        ##   in Loop: Header=BB46_31 Depth=1
	c0	cmpleu $b0.1 = $r0.19, $r0.7
	c0	mov $r0.9 = $r0.15
;;
;;
	c0	br $b0.1, LBB46_34
;;
## BB#33:                               ## %cond.false.i.156
                                        ##   in Loop: Header=BB46_31 Depth=1
	c0	shru $r0.9 = $r0.7, $r0.18
	c0	mtb $b0.1 = $r0.12
	c0	mtb $b0.2 = $r0.12
	c0	cmpgeu $r0.23 = $r0.7, $r0.11
;;
;;
	c0	addcg $r0.24, $b0.1 = $r0.9, $r0.9, $b0.1
;;
	c0	divs $r0.9, $b0.1 = $r0.0, $r0.22, $b0.1
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.22, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.22, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.22, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.22, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.22, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.22, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.22, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.22, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.22, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.22, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.22, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.22, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.22, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.22, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.22, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.22, $b0.1
;;
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.22, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.22, $b0.1
;;
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.22, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.22, $b0.1
;;
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.22, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.22, $b0.1
;;
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.22, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.22, $b0.1
;;
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.22, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.22, $b0.1
;;
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.22, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.22, $b0.1
;;
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.22, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.22, $b0.1
;;
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.22, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	cmpge $b0.1 = $r0.9, $r0.0
	c0	addcg $r0.9, $b0.2 = $r0.24, $r0.24, $b0.2
;;
	c0	orc $r0.9 = $r0.9, $r0.0
;;
	c0	mfb $r0.24 = $b0.1
;;
	c0	sh1add $r0.9 = $r0.9, $r0.24
;;
	c0	slct $r0.9 = $b0.0, $r0.23, $r0.9
;;
	c0	shl $r0.9 = $r0.9, $r0.10
;;
LBB46_34:                               ## %cond.end.i.171
                                        ##   in Loop: Header=BB46_31 Depth=1
	c0	shru $r0.23 = $r0.9, $r0.10
;;
	c0	mpylu $r0.24 = $r0.23, $r0.14
	c0	mpyhs $r0.25 = $r0.23, $r0.14
;;
	c0	mpylu $r0.26 = $r0.23, $r0.11
	c0	mpyhs $r0.23 = $r0.23, $r0.11
;;
	c0	add $r0.24 = $r0.24, $r0.25
;;
	c0	add $r0.23 = $r0.26, $r0.23
	c0	shl $r0.25 = $r0.24, $r0.10
	c0	shru $r0.24 = $r0.24, $r0.10
;;
	c0	sub $r0.23 = $r0.7, $r0.23
	c0	cmpne $r0.26 = $r0.25, 0
	c0	sub $r0.7 = $r0.12, $r0.25
;;
	c0	sub $r0.23 = $r0.23, $r0.24
	c0	mtb $b0.1 = $r0.26
;;
;;
	c0	slct $r0.24 = $b0.1, $r0.16, 0
;;
	c0	add $r0.23 = $r0.23, $r0.24
;;
	c0	cmpgt $b0.1 = $r0.23, -1
;;
;;
	c0	br $b0.1, LBB46_36
;;
LBB46_35:                               ## %while.body.i.184
                                        ##   Parent Loop BB46_31 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	add $r0.7 = $r0.7, $r0.17
	c0	add $r0.23 = $r0.23, $r0.11
	c0	add $r0.9 = $r0.9, -65536
;;
	c0	cmpltu $r0.24 = $r0.7, $r0.17
;;
	c0	add $r0.23 = $r0.23, $r0.24
;;
	c0	cmplt $b0.1 = $r0.23, 0
;;
;;
	c0	br $b0.1, LBB46_35
;;
LBB46_36:                               ## %while.end.i.192
                                        ##   in Loop: Header=BB46_31 Depth=1
	c0	shl $r0.23 = $r0.23, $r0.10
	c0	shru $r0.24 = $r0.7, $r0.10
	c0	mov $r0.7 = $r0.13
;;
	c0	or $r0.23 = $r0.24, $r0.23
;;
	c0	cmpleu $b0.1 = $r0.19, $r0.23
;;
;;
	c0	br $b0.1, LBB46_38
;;
## BB#37:                               ## %cond.false.10.i.194
                                        ##   in Loop: Header=BB46_31 Depth=1
	c0	shru $r0.7 = $r0.23, $r0.18
	c0	mtb $b0.1 = $r0.12
	c0	mtb $b0.2 = $r0.12
	c0	cmpgeu $r0.23 = $r0.23, $r0.11
;;
;;
	c0	addcg $r0.24, $b0.1 = $r0.7, $r0.7, $b0.1
;;
	c0	divs $r0.7, $b0.1 = $r0.0, $r0.22, $b0.1
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.22, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.22, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.22, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.22, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.22, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.22, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.22, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.22, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.22, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.22, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.22, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.22, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.22, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.22, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.22, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.22, $b0.1
;;
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.22, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.22, $b0.1
;;
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.22, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.22, $b0.1
;;
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.22, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.22, $b0.1
;;
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.22, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.22, $b0.1
;;
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.22, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.22, $b0.1
;;
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.22, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.22, $b0.1
;;
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.22, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.22, $b0.1
;;
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.22, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	cmpge $b0.1 = $r0.7, $r0.0
	c0	addcg $r0.7, $b0.2 = $r0.24, $r0.24, $b0.2
;;
	c0	orc $r0.7 = $r0.7, $r0.0
;;
	c0	mfb $r0.24 = $b0.1
;;
	c0	sh1add $r0.7 = $r0.7, $r0.24
;;
	c0	slct $r0.7 = $b0.0, $r0.23, $r0.7
;;
LBB46_38:                               ## %cond.end.12.i.197
                                        ##   in Loop: Header=BB46_31 Depth=1
	c0	or $r0.9 = $r0.7, $r0.9
;;
LBB46_39:                               ## %estimateDiv64To32.exit199
                                        ##   in Loop: Header=BB46_31 Depth=1
	c0	cmpgtu $b0.1 = $r0.9, 2
	c0	add $r0.7 = $r0.9, -2
	c0	cmpgt $b0.2 = $r0.21, 30
	c0	add $r0.9 = $r0.21, -30
;;
;;
	c0	slct $r0.23 = $b0.1, $r0.7, 0
	c0	mov $r0.21 = $r0.9
;;
	c0	mpyhs $r0.7 = $r0.23, $r0.20
	c0	mpylu $r0.24 = $r0.23, $r0.20
;;
;;
	c0	add $r0.7 = $r0.24, $r0.7
	c0	br $b0.2, LBB46_31
;;
	c0	goto LBB46_40
;;
LBB46_17:                               ## %cond.false.i.255
	c0	cmpeq $b0.0 = $r0.5, 0
	c0	or $r0.3 = $r0.3, 4194304
;;
	c0	and $r0.4 = $r0.4, 2147483647
	c0	cmpne $b0.1 = $r0.2, 2139095040
;;
	c0	cmpgtu $b0.2 = $r0.4, 2139095040
;;
	c0	slct $r0.2 = $b0.0, $r0.6, $r0.3
;;
	c0	slct $r0.2 = $b0.1, $r0.6, $r0.2
;;
	c0	slct $r0.3 = $b0.2, $r0.2, $r0.3
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB46_19:                               ## %if.end
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
	c0	mov $r0.3 = 2147483647
;;
;;
	c0	or $r0.4 = $r0.4, 16
;;
	c0	stw 0[$r0.2] = $r0.4
;;
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB46_25:                               ## %if.then.33
	c0	cmplt $b0.0 = $r0.9, -1
;;
;;
	c0	br $b0.0, LBB46_62
;;
## BB#26:                               ## %while.end.thread
	c0	mov $r0.6 = 1
	c0	mov $r0.23 = 0
;;
	c0	shru $r0.7 = $r0.7, $r0.6
	c0	goto LBB46_27
;;
LBB46_29:
	c0	mfb $r0.23 = $b0.0
;;
LBB46_40:                               ## %while.end
	c0	cmplt $b0.0 = $r0.9, -31
;;
;;
	c0	br $b0.0, LBB46_27
;;
## BB#41:                               ## %if.then.55
	c0	cmpleu $b0.0 = $r0.5, $r0.7
;;
;;
	c0	br $b0.0, LBB46_42
;;
## BB#43:                               ## %if.end.i
	c0	mov $r0.13 = 16
;;
	c0	shru $r0.10 = $r0.5, $r0.13
;;
	c0	shl $r0.12 = $r0.10, $r0.13
;;
	c0	cmpleu $b0.0 = $r0.12, $r0.7
;;
;;
	c0	br $b0.0, LBB46_44
;;
## BB#45:                               ## %cond.false.i
	c0	cmplt $r0.11 = $r0.10, $r0.0
	c0	mov $r0.14 = 0
;;
	c0	shru $r0.15 = $r0.7, $r0.11
	c0	mtb $b0.0 = $r0.14
	c0	shru $r0.16 = $r0.10, $r0.11
	c0	mtb $b0.1 = $r0.14
;;
;;
	c0	addcg $r0.14, $b0.0 = $r0.15, $r0.15, $b0.0
;;
	c0	divs $r0.15, $b0.0 = $r0.0, $r0.16, $b0.0
	c0	addcg $r0.17, $b0.1 = $r0.14, $r0.14, $b0.1
;;
	c0	addcg $r0.14, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.15, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.2 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
	c0	mtb $b0.0 = $r0.11
;;
	c0	addcg $r0.11, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.2 = $r0.14, $r0.16, $b0.2
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
	c0	addcg $r0.15, $b0.2 = $r0.11, $r0.11, $b0.2
;;
	c0	addcg $r0.11, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.2 = $r0.14, $r0.16, $b0.2
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
	c0	addcg $r0.15, $b0.2 = $r0.11, $r0.11, $b0.2
;;
	c0	addcg $r0.11, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.2 = $r0.14, $r0.16, $b0.2
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
	c0	addcg $r0.15, $b0.2 = $r0.11, $r0.11, $b0.2
;;
	c0	addcg $r0.11, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.2 = $r0.14, $r0.16, $b0.2
	c0	cmpgeu $r0.15 = $r0.7, $r0.10
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
	c0	addcg $r0.16, $b0.2 = $r0.11, $r0.11, $b0.2
;;
	c0	cmpge $b0.2 = $r0.14, $r0.0
	c0	addcg $r0.11, $b0.1 = $r0.16, $r0.16, $b0.1
;;
	c0	orc $r0.11 = $r0.11, $r0.0
;;
	c0	mfb $r0.14 = $b0.2
;;
	c0	sh1add $r0.11 = $r0.11, $r0.14
;;
	c0	slct $r0.11 = $b0.0, $r0.15, $r0.11
;;
	c0	shl $r0.11 = $r0.11, $r0.13
	c0	goto LBB46_46
;;
LBB46_27:                               ## %if.else
	c0	mov $r0.6 = 2
;;
	c0	shru $r0.8 = $r0.5, $r0.6
	c0	shru $r0.6 = $r0.7, $r0.6
	c0	goto LBB46_54
;;
LBB46_42:
	c0	mov $r0.6 = -1
	c0	goto LBB46_53
;;
LBB46_44:
	c0	mov $r0.11 = -65536
;;
LBB46_46:                               ## %cond.end.i
	c0	shru $r0.14 = $r0.11, $r0.13
	c0	and $r0.8 = $r0.8, 65280
	c0	mov $r0.15 = -1
;;
	c0	mpyhs $r0.16 = $r0.14, $r0.10
	c0	mpyhs $r0.17 = $r0.14, $r0.8
;;
	c0	mpylu $r0.8 = $r0.14, $r0.8
	c0	mpylu $r0.14 = $r0.14, $r0.10
;;
;;
	c0	add $r0.8 = $r0.8, $r0.17
	c0	mov $r0.17 = 0
	c0	add $r0.14 = $r0.14, $r0.16
;;
	c0	shl $r0.16 = $r0.8, $r0.13
	c0	shru $r0.18 = $r0.8, $r0.13
	c0	sub $r0.14 = $r0.7, $r0.14
;;
	c0	cmpne $r0.19 = $r0.16, 0
	c0	sub $r0.8 = $r0.17, $r0.16
	c0	sub $r0.14 = $r0.14, $r0.18
;;
	c0	mtb $b0.0 = $r0.19
;;
;;
	c0	slct $r0.15 = $b0.0, $r0.15, 0
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	cmpgt $b0.0 = $r0.14, -1
;;
;;
	c0	br $b0.0, LBB46_49
;;
## BB#47:                               ## %while.body.lr.ph.i
	c0	mov $r0.15 = 24
;;
	c0	shl $r0.6 = $r0.6, $r0.15
;;
LBB46_48:                               ## %while.body.i
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.8 = $r0.8, $r0.6
	c0	add $r0.14 = $r0.14, $r0.10
	c0	add $r0.11 = $r0.11, -65536
;;
	c0	cmpltu $r0.15 = $r0.8, $r0.6
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	cmplt $b0.0 = $r0.14, 0
;;
;;
	c0	br $b0.0, LBB46_48
;;
LBB46_49:                               ## %while.end.i
	c0	shl $r0.6 = $r0.14, $r0.13
	c0	shru $r0.8 = $r0.8, $r0.13
;;
	c0	or $r0.6 = $r0.8, $r0.6
;;
	c0	cmpleu $b0.0 = $r0.12, $r0.6
;;
;;
	c0	br $b0.0, LBB46_50
;;
## BB#51:                               ## %cond.false.10.i
	c0	cmplt $r0.8 = $r0.10, $r0.0
	c0	mov $r0.12 = 0
;;
	c0	shru $r0.13 = $r0.6, $r0.8
	c0	mtb $b0.0 = $r0.12
	c0	shru $r0.14 = $r0.10, $r0.8
	c0	mtb $b0.1 = $r0.12
;;
;;
	c0	addcg $r0.12, $b0.0 = $r0.13, $r0.13, $b0.0
;;
	c0	divs $r0.13, $b0.0 = $r0.0, $r0.14, $b0.0
	c0	addcg $r0.15, $b0.1 = $r0.12, $r0.12, $b0.1
;;
	c0	addcg $r0.12, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.13, $r0.14, $b0.0
;;
	c0	addcg $r0.13, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.14, $b0.0
;;
	c0	addcg $r0.13, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.14, $b0.0
;;
	c0	addcg $r0.13, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.14, $b0.0
;;
	c0	addcg $r0.13, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.14, $b0.0
;;
	c0	addcg $r0.13, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.14, $b0.0
;;
	c0	addcg $r0.13, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.14, $b0.0
;;
	c0	addcg $r0.13, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.14, $b0.0
;;
	c0	addcg $r0.13, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.14, $b0.0
;;
	c0	addcg $r0.13, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.14, $b0.0
;;
	c0	addcg $r0.13, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.14, $b0.0
;;
	c0	addcg $r0.13, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.14, $b0.0
;;
	c0	addcg $r0.13, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.14, $b0.0
	c0	mtb $b0.0 = $r0.8
;;
	c0	addcg $r0.8, $b0.2 = $r0.15, $r0.15, $b0.2
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.14, $b0.1
;;
	c0	addcg $r0.13, $b0.1 = $r0.8, $r0.8, $b0.1
	c0	divs $r0.8, $b0.2 = $r0.12, $r0.14, $b0.2
;;
	c0	divs $r0.8, $b0.1 = $r0.8, $r0.14, $b0.1
	c0	addcg $r0.12, $b0.2 = $r0.13, $r0.13, $b0.2
;;
	c0	addcg $r0.13, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.8, $b0.2 = $r0.8, $r0.14, $b0.2
;;
	c0	divs $r0.8, $b0.1 = $r0.8, $r0.14, $b0.1
	c0	cmpgeu $r0.6 = $r0.6, $r0.10
	c0	addcg $r0.10, $b0.2 = $r0.13, $r0.13, $b0.2
;;
	c0	cmpge $b0.2 = $r0.8, $r0.0
	c0	addcg $r0.8, $b0.1 = $r0.10, $r0.10, $b0.1
;;
	c0	orc $r0.8 = $r0.8, $r0.0
;;
	c0	mfb $r0.10 = $b0.2
;;
	c0	sh1add $r0.8 = $r0.8, $r0.10
;;
	c0	slct $r0.6 = $b0.0, $r0.6, $r0.8
	c0	goto LBB46_52
;;
LBB46_50:
	c0	mov $r0.6 = 65535
;;
LBB46_52:                               ## %cond.end.12.i
	c0	or $r0.6 = $r0.6, $r0.11
;;
LBB46_53:                               ## %estimateDiv64To32.exit
	c0	cmpgtu $b0.0 = $r0.6, 2
	c0	add $r0.6 = $r0.6, -2
	c0	mov $r0.8 = 0
	c0	mov $r0.10 = 2
;;
	c0	sub $r0.11 = $r0.8, $r0.9
	c0	shru $r0.8 = $r0.5, $r0.10
	c0	mov $r0.5 = 1
	c0	add $r0.9 = $r0.9, 31
;;
	c0	slct $r0.6 = $b0.0, $r0.6, 0
	c0	shru $r0.5 = $r0.7, $r0.5
;;
	c0	shl $r0.5 = $r0.5, $r0.9
	c0	shru $r0.23 = $r0.6, $r0.11
;;
	c0	mpyhs $r0.6 = $r0.23, $r0.8
	c0	mpylu $r0.7 = $r0.23, $r0.8
;;
;;
	c0	add $r0.6 = $r0.7, $r0.6
;;
	c0	sub $r0.6 = $r0.5, $r0.6
;;
LBB46_54:                               ## %do.body.preheader
	c0	mov $r0.9 = 31
;;
	c0	shru $r0.3 = $r0.3, $r0.9
;;
LBB46_55:                               ## %do.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	mov $r0.5 = $r0.6
;;
	c0	sub $r0.6 = $r0.5, $r0.8
	c0	add $r0.23 = $r0.23, 1
;;
	c0	cmpgt $b0.0 = $r0.6, -1
;;
;;
	c0	br $b0.0, LBB46_55
;;
## BB#56:                               ## %do.end
	c0	add $r0.7 = $r0.6, $r0.5
;;
	c0	cmplt $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB46_59
;;
## BB#57:                               ## %lor.lhs.false.81
	c0	cmpne $b0.0 = $r0.7, 0
	c0	mov $r0.7 = 1
;;
;;
	c0	br $b0.0, LBB46_60
;;
## BB#58:                               ## %lor.lhs.false.81
	c0	and $r0.8 = $r0.23, 1
;;
	c0	cmpeq $b0.0 = $r0.8, 0
;;
;;
	c0	br $b0.0, LBB46_60
;;
LBB46_59:                               ## %if.end.87
	c0	cmpgt $b0.0 = $r0.5, -1
	c0	shru $r0.7 = $r0.5, $r0.9
	c0	mov $r0.6 = $r0.5
;;
;;
	c0	br $b0.0, LBB46_61
;;
LBB46_60:                               ## %if.then.91
	c0	mov $r0.5 = 0
;;
	c0	sub $r0.5 = $r0.5, $r0.6
;;
LBB46_61:                               ## %if.end.93
	c0	mov $r0.6 = 16
	c0	cmpltu $b0.0 = $r0.5, 65536
	c0	mov $r0.8 = 22
;;
	c0	mov $r0.9 = countLeadingZeros32.countLeadingZerosHigh
	c0	shl $r0.6 = $r0.5, $r0.6
;;
	c0	mfb $r0.10 = $b0.0
	c0	slct $r0.6 = $b0.0, $r0.6, $r0.5
;;
	c0	cmpltu $b0.0 = $r0.6, 16777216
	c0	shl $r0.4 = $r0.6, $r0.4
;;
;;
	c0	slct $r0.4 = $b0.0, $r0.4, $r0.6
;;
	c0	shru $r0.4 = $r0.4, $r0.8
	c0	mov $r0.6 = 4
;;
	c0	and $r0.4 = $r0.4, 1020
	c0	shl $r0.6 = $r0.10, $r0.6
;;
	c0	add $r0.4 = $r0.9, $r0.4
	c0	or $r0.8 = $r0.6, 8
;;
	c0	ldw $r0.4 = 0[$r0.4]
	c0	slct $r0.6 = $b0.0, $r0.8, $r0.6
;;
;;
	c0	add $r0.4 = $r0.4, $r0.6
	c0	xor $r0.3 = $r0.7, $r0.3
;;
	c0	add $r0.6 = $r0.4, -1
;;
	c0	sub $r0.4 = $r0.2, $r0.6
	c0	shl $r0.5 = $r0.5, $r0.6
;;
.call roundAndPackFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = roundAndPackFloat32
;;
LBB46_62:                               ## %cleanup
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

#.globl float32_sqrt
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_sqrt
float32_sqrt::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $l0.0
	c0	mov $r0.4 = 23
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.4 = $r0.3, $r0.4
;;
	c0	zxtb $r0.7 = $r0.4
;;
	c0	cmpne $b0.0 = $r0.7, 255
	c0	and $r0.4 = $r0.3, 8388607
	c0	shru $r0.5 = $r0.3, $r0.2
;;
;;
	c0	br $b0.0, LBB47_9
;;
## BB#1:                                ## %if.then
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB47_7
;;
## BB#2:                                ## %if.then.3
	c0	and $r0.4 = $r0.3, 2143289344
	c0	or $r0.2 = $r0.3, 4194304
;;
	c0	cmpne $b0.0 = $r0.4, 2139095040
;;
;;
	c0	br $b0.0, LBB47_3
;;
## BB#4:                                ## %if.then.3
	c0	and $r0.3 = $r0.3, 4194303
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB47_5
;;
## BB#6:                                ## %if.then.i.87
	c0	mov $r0.4 = float_exception_flags
	c0	mov $r0.3 = $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.4]
;;
;;
	c0	or $r0.2 = $r0.2, 16
;;
	c0	stw 0[$r0.4] = $r0.2
;;
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB47_9:                                ## %if.end.8
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB47_11
;;
## BB#10:                               ## %if.then.10
	c0	or $r0.2 = $r0.7, $r0.4
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB47_8
;;
	c0	goto LBB47_41
;;
LBB47_7:                                ## %if.end
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB47_41
;;
LBB47_8:                                ## %if.end.7
	c0	mov $r0.2 = float_exception_flags
	c0	mov $r0.3 = 2147483647
;;
	c0	ldw $r0.4 = 0[$r0.2]
;;
;;
	c0	or $r0.4 = $r0.4, 16
;;
	c0	stw 0[$r0.2] = $r0.4
;;
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB47_11:                               ## %if.end.14
	c0	cmpne $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB47_15
;;
## BB#12:                               ## %if.then.16
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB47_13
;;
## BB#14:                               ## %if.end.19
	c0	cmpltu $b0.0 = $r0.4, 65536
	c0	mov $r0.5 = 16
	c0	mov $r0.6 = 8
;;
	c0	mov $r0.7 = 22
	c0	shl $r0.3 = $r0.3, $r0.5
	c0	mov $r0.5 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	mov $r0.8 = 4
	c0	slct $r0.3 = $b0.0, $r0.3, $r0.4
;;
	c0	cmpltu $b0.1 = $r0.3, 16777216
	c0	shl $r0.6 = $r0.3, $r0.6
;;
;;
	c0	slct $r0.3 = $b0.1, $r0.6, $r0.3
;;
	c0	shru $r0.3 = $r0.3, $r0.7
	c0	mfb $r0.6 = $b0.0
;;
	c0	and $r0.3 = $r0.3, 1020
	c0	shl $r0.6 = $r0.6, $r0.8
;;
	c0	add $r0.3 = $r0.5, $r0.3
	c0	or $r0.5 = $r0.6, 8
;;
	c0	ldw $r0.3 = 0[$r0.3]
	c0	slct $r0.5 = $b0.1, $r0.5, $r0.6
;;
;;
	c0	add $r0.3 = $r0.3, $r0.5
	c0	mov $r0.5 = 9
;;
	c0	add $r0.6 = $r0.3, -8
	c0	sub $r0.7 = $r0.5, $r0.3
;;
	c0	shl $r0.4 = $r0.4, $r0.6
;;
LBB47_15:                               ## %if.end.20
	c0	mov $r0.8 = 8
	c0	and $r0.6 = $r0.7, 1
	c0	mov $r0.9 = 19
	c0	mov $r0.5 = 17
;;
	c0	add $r0.7 = $r0.7, -127
	c0	mov $r0.3 = 1
	c0	shru $r0.9 = $r0.4, $r0.9
	c0	shl $r0.8 = $r0.4, $r0.8
;;
	c0	cmpeq $b0.0 = $r0.6, 0
	c0	shr $r0.4 = $r0.7, $r0.3
	c0	or $r0.7 = $r0.8, -2147483648
;;
	c0	and $r0.8 = $r0.9, 15
	c0	shru $r0.9 = $r0.7, $r0.5
;;
	c0	brf $b0.0, LBB47_16
;;
## BB#19:                               ## %if.else.i
	c0	mov $r0.10 = estimateSqrt32.sqrtEvenAdjustments
	c0	or $r0.9 = $r0.9, 32768
;;
	c0	mov $r0.11 = 0
	c0	sh1add $r0.8 = $r0.8, $r0.10
;;
	c0	mtb $b0.0 = $r0.11
	c0	mtb $b0.1 = $r0.11
	c0	ldhu $r0.8 = 0[$r0.8]
;;
;;
	c0	sub $r0.8 = $r0.9, $r0.8
;;
	c0	cmplt $r0.9 = $r0.8, $r0.0
;;
	c0	shru $r0.10 = $r0.7, $r0.9
	c0	shru $r0.11 = $r0.8, $r0.9
;;
	c0	addcg $r0.12, $b0.0 = $r0.10, $r0.10, $b0.0
;;
	c0	addcg $r0.10, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.0, $r0.11, $b0.0
;;
	c0	addcg $r0.13, $b0.0 = $r0.10, $r0.10, $b0.0
	c0	divs $r0.10, $b0.1 = $r0.12, $r0.11, $b0.1
;;
	c0	addcg $r0.12, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	addcg $r0.13, $b0.0 = $r0.12, $r0.12, $b0.0
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
;;
	c0	addcg $r0.12, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	addcg $r0.13, $b0.0 = $r0.12, $r0.12, $b0.0
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
;;
	c0	addcg $r0.12, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	addcg $r0.13, $b0.0 = $r0.12, $r0.12, $b0.0
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
;;
	c0	addcg $r0.12, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.10, $b0.2 = $r0.10, $r0.11, $b0.0
	c0	mtb $b0.0 = $r0.9
;;
	c0	divs $r0.9, $b0.1 = $r0.10, $r0.11, $b0.1
	c0	addcg $r0.10, $b0.2 = $r0.12, $r0.12, $b0.2
;;
	c0	addcg $r0.12, $b0.1 = $r0.10, $r0.10, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.11, $b0.2
;;
	c0	addcg $r0.10, $b0.2 = $r0.12, $r0.12, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.11, $b0.1
;;
	c0	addcg $r0.12, $b0.1 = $r0.10, $r0.10, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.11, $b0.2
	c0	cmpgeu $r0.10 = $r0.7, $r0.8
;;
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.11, $b0.1
	c0	addcg $r0.13, $b0.2 = $r0.12, $r0.12, $b0.2
;;
	c0	addcg $r0.12, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.11, $b0.2
;;
	c0	addcg $r0.13, $b0.2 = $r0.12, $r0.12, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.11, $b0.1
;;
	c0	addcg $r0.12, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.11, $b0.2
;;
	c0	addcg $r0.13, $b0.2 = $r0.12, $r0.12, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.11, $b0.1
;;
	c0	addcg $r0.12, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.11, $b0.2
;;
	c0	addcg $r0.13, $b0.2 = $r0.12, $r0.12, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.11, $b0.1
;;
	c0	addcg $r0.12, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.11, $b0.2
;;
	c0	addcg $r0.13, $b0.2 = $r0.12, $r0.12, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.11, $b0.1
;;
	c0	addcg $r0.12, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.11, $b0.2
;;
	c0	addcg $r0.13, $b0.2 = $r0.12, $r0.12, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.11, $b0.1
	c0	mov $r0.12 = 15
;;
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.11, $b0.2
	c0	addcg $r0.14, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	addcg $r0.13, $b0.2 = $r0.14, $r0.14, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.11, $b0.1
;;
	c0	addcg $r0.14, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.11, $b0.2
;;
	c0	addcg $r0.13, $b0.2 = $r0.14, $r0.14, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.11, $b0.1
	c0	mov $r0.14 = -32768
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.11, $b0.2
;;
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.11, $b0.1
	c0	addcg $r0.13, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.11, $b0.2
;;
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.11, $b0.1
	c0	addcg $r0.11, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	cmpge $b0.2 = $r0.9, $r0.0
	c0	addcg $r0.9, $b0.1 = $r0.11, $r0.11, $b0.1
;;
	c0	orc $r0.9 = $r0.9, $r0.0
;;
	c0	mfb $r0.11 = $b0.2
;;
	c0	sh1add $r0.9 = $r0.9, $r0.11
;;
	c0	slct $r0.9 = $b0.0, $r0.10, $r0.9
	c0	mov $r0.13 = $r0.7
;;
	c0	add $r0.8 = $r0.8, $r0.9
;;
	c0	cmpgtu $b0.0 = $r0.8, 131071
	c0	shl $r0.8 = $r0.8, $r0.12
;;
;;
	c0	slct $r0.8 = $b0.0, $r0.14, $r0.8
;;
	c0	cmpgtu $b0.0 = $r0.8, $r0.7
;;
;;
	c0	br $b0.0, LBB47_17
;;
## BB#20:                               ## %if.then.17.i
	c0	shr $r0.9 = $r0.7, $r0.3
	c0	goto LBB47_32
;;
LBB47_16:                               ## %if.then.i
	c0	mov $r0.10 = estimateSqrt32.sqrtOddAdjustments
	c0	add $r0.9 = $r0.9, 16384
;;
	c0	mov $r0.11 = 0
	c0	sh1add $r0.8 = $r0.8, $r0.10
;;
	c0	mtb $b0.0 = $r0.11
	c0	mtb $b0.1 = $r0.11
	c0	ldhu $r0.8 = 0[$r0.8]
;;
;;
	c0	sub $r0.8 = $r0.9, $r0.8
;;
	c0	cmplt $r0.9 = $r0.8, $r0.0
;;
	c0	shru $r0.10 = $r0.7, $r0.9
	c0	shru $r0.11 = $r0.8, $r0.9
;;
	c0	addcg $r0.12, $b0.0 = $r0.10, $r0.10, $b0.0
;;
	c0	divs $r0.10, $b0.0 = $r0.0, $r0.11, $b0.0
	c0	addcg $r0.13, $b0.1 = $r0.12, $r0.12, $b0.1
;;
	c0	addcg $r0.12, $b0.0 = $r0.13, $r0.13, $b0.0
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
;;
	c0	addcg $r0.13, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	addcg $r0.12, $b0.0 = $r0.13, $r0.13, $b0.0
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
;;
	c0	addcg $r0.13, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	addcg $r0.12, $b0.0 = $r0.13, $r0.13, $b0.0
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
;;
	c0	addcg $r0.13, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	addcg $r0.12, $b0.0 = $r0.13, $r0.13, $b0.0
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
;;
	c0	addcg $r0.13, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	addcg $r0.12, $b0.0 = $r0.13, $r0.13, $b0.0
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
;;
	c0	addcg $r0.13, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	addcg $r0.12, $b0.0 = $r0.13, $r0.13, $b0.0
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
;;
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
	c0	addcg $r0.13, $b0.1 = $r0.12, $r0.12, $b0.1
;;
	c0	addcg $r0.12, $b0.0 = $r0.13, $r0.13, $b0.0
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
;;
	c0	addcg $r0.13, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	addcg $r0.12, $b0.0 = $r0.13, $r0.13, $b0.0
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
;;
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
	c0	addcg $r0.13, $b0.1 = $r0.12, $r0.12, $b0.1
;;
	c0	addcg $r0.12, $b0.0 = $r0.13, $r0.13, $b0.0
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
;;
	c0	addcg $r0.13, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	addcg $r0.12, $b0.0 = $r0.13, $r0.13, $b0.0
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
;;
	c0	addcg $r0.13, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	addcg $r0.12, $b0.0 = $r0.13, $r0.13, $b0.0
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
;;
	c0	addcg $r0.13, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	addcg $r0.12, $b0.0 = $r0.13, $r0.13, $b0.0
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
;;
	c0	addcg $r0.13, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	addcg $r0.12, $b0.0 = $r0.13, $r0.13, $b0.0
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
;;
	c0	addcg $r0.13, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	addcg $r0.12, $b0.0 = $r0.13, $r0.13, $b0.0
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
	c0	mov $r0.14 = 15
	c0	mov $r0.15 = 14
;;
	c0	addcg $r0.13, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
	c0	addcg $r0.12, $b0.0 = $r0.13, $r0.13, $b0.0
	c0	shru $r0.13 = $r0.7, $r0.3
	c0	cmpgeu $r0.16 = $r0.7, $r0.8
;;
	c0	addcg $r0.17, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
	c0	shl $r0.8 = $r0.8, $r0.14
	c0	mtb $b0.2 = $r0.9
;;
	c0	divs $r0.9, $b0.1 = $r0.10, $r0.11, $b0.1
;;
	c0	cmpge $b0.3 = $r0.9, $r0.0
	c0	addcg $r0.9, $b0.0 = $r0.17, $r0.17, $b0.0
;;
	c0	addcg $r0.10, $b0.0 = $r0.9, $r0.9, $b0.1
;;
	c0	orc $r0.9 = $r0.10, $r0.0
	c0	mfb $r0.10 = $b0.3
;;
	c0	sh1add $r0.9 = $r0.9, $r0.10
;;
	c0	slct $r0.9 = $b0.2, $r0.16, $r0.9
;;
	c0	shl $r0.9 = $r0.9, $r0.15
;;
	c0	add $r0.8 = $r0.8, $r0.9
;;
LBB47_17:                               ## %if.end.19.i
	c0	cmpleu $b0.0 = $r0.8, $r0.13
;;
;;
	c0	br $b0.0, LBB47_18
;;
## BB#21:                               ## %if.end.i
	c0	mov $r0.12 = 16
;;
	c0	shru $r0.9 = $r0.8, $r0.12
;;
	c0	shl $r0.11 = $r0.9, $r0.12
;;
	c0	cmpleu $b0.0 = $r0.11, $r0.13
;;
;;
	c0	br $b0.0, LBB47_22
;;
## BB#23:                               ## %cond.false.i
	c0	cmplt $r0.10 = $r0.9, $r0.0
	c0	mov $r0.14 = 0
;;
	c0	shru $r0.15 = $r0.13, $r0.10
	c0	mtb $b0.0 = $r0.14
	c0	shru $r0.16 = $r0.9, $r0.10
	c0	mtb $b0.1 = $r0.14
;;
;;
	c0	addcg $r0.14, $b0.0 = $r0.15, $r0.15, $b0.0
;;
	c0	divs $r0.15, $b0.0 = $r0.0, $r0.16, $b0.0
	c0	addcg $r0.17, $b0.1 = $r0.14, $r0.14, $b0.1
;;
	c0	addcg $r0.14, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.15, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.2 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
	c0	mtb $b0.0 = $r0.10
;;
	c0	addcg $r0.10, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.2 = $r0.14, $r0.16, $b0.2
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
	c0	addcg $r0.15, $b0.2 = $r0.10, $r0.10, $b0.2
;;
	c0	addcg $r0.10, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.2 = $r0.14, $r0.16, $b0.2
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
	c0	addcg $r0.15, $b0.2 = $r0.10, $r0.10, $b0.2
;;
	c0	addcg $r0.10, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.2 = $r0.14, $r0.16, $b0.2
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
	c0	addcg $r0.15, $b0.2 = $r0.10, $r0.10, $b0.2
;;
	c0	addcg $r0.10, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.2 = $r0.14, $r0.16, $b0.2
	c0	cmpgeu $r0.15 = $r0.13, $r0.9
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
	c0	addcg $r0.16, $b0.2 = $r0.10, $r0.10, $b0.2
;;
	c0	cmpge $b0.2 = $r0.14, $r0.0
	c0	addcg $r0.10, $b0.1 = $r0.16, $r0.16, $b0.1
;;
	c0	orc $r0.10 = $r0.10, $r0.0
;;
	c0	mfb $r0.14 = $b0.2
;;
	c0	sh1add $r0.10 = $r0.10, $r0.14
;;
	c0	slct $r0.10 = $b0.0, $r0.15, $r0.10
;;
	c0	shl $r0.10 = $r0.10, $r0.12
	c0	goto LBB47_24
;;
LBB47_3:
	c0	mov $r0.3 = $r0.2
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB47_5:
	c0	mov $r0.3 = $r0.2
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB47_18:
	c0	mov $r0.9 = 2147483647
	c0	goto LBB47_31
;;
LBB47_22:
	c0	mov $r0.10 = -65536
;;
LBB47_24:                               ## %cond.end.i
	c0	shru $r0.14 = $r0.10, $r0.12
	c0	zxth $r0.15 = $r0.8
	c0	mov $r0.16 = -1
;;
	c0	mpyhs $r0.17 = $r0.14, $r0.9
	c0	mpyhs $r0.18 = $r0.14, $r0.15
;;
	c0	mpylu $r0.15 = $r0.14, $r0.15
	c0	mpylu $r0.14 = $r0.14, $r0.9
;;
;;
	c0	add $r0.15 = $r0.15, $r0.18
	c0	mov $r0.18 = 0
	c0	add $r0.14 = $r0.14, $r0.17
;;
	c0	shl $r0.17 = $r0.15, $r0.12
	c0	shru $r0.15 = $r0.15, $r0.12
	c0	sub $r0.14 = $r0.13, $r0.14
;;
	c0	cmpne $r0.19 = $r0.17, 0
	c0	sub $r0.13 = $r0.18, $r0.17
	c0	sub $r0.14 = $r0.14, $r0.15
;;
	c0	mtb $b0.0 = $r0.19
;;
;;
	c0	slct $r0.15 = $b0.0, $r0.16, 0
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	cmpgt $b0.0 = $r0.14, -1
;;
;;
	c0	br $b0.0, LBB47_27
;;
## BB#25:                               ## %while.body.lr.ph.i
	c0	shl $r0.15 = $r0.8, $r0.12
;;
LBB47_26:                               ## %while.body.i
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.13 = $r0.13, $r0.15
	c0	add $r0.14 = $r0.14, $r0.9
	c0	add $r0.10 = $r0.10, -65536
;;
	c0	cmpltu $r0.16 = $r0.13, $r0.15
;;
	c0	add $r0.14 = $r0.14, $r0.16
;;
	c0	cmplt $b0.0 = $r0.14, 0
;;
;;
	c0	br $b0.0, LBB47_26
;;
LBB47_27:                               ## %while.end.i
	c0	shl $r0.14 = $r0.14, $r0.12
	c0	shru $r0.12 = $r0.13, $r0.12
;;
	c0	or $r0.12 = $r0.12, $r0.14
;;
	c0	cmpleu $b0.0 = $r0.11, $r0.12
;;
;;
	c0	br $b0.0, LBB47_28
;;
## BB#29:                               ## %cond.false.10.i
	c0	cmplt $r0.11 = $r0.9, $r0.0
	c0	mov $r0.13 = 0
;;
	c0	shru $r0.14 = $r0.12, $r0.11
	c0	mtb $b0.0 = $r0.13
	c0	shru $r0.15 = $r0.9, $r0.11
	c0	mtb $b0.1 = $r0.13
;;
;;
	c0	addcg $r0.13, $b0.0 = $r0.14, $r0.14, $b0.0
;;
	c0	divs $r0.14, $b0.0 = $r0.0, $r0.15, $b0.0
	c0	addcg $r0.16, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	addcg $r0.13, $b0.0 = $r0.16, $r0.16, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.15, $b0.1
;;
	c0	addcg $r0.16, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.14, $r0.15, $b0.0
;;
	c0	addcg $r0.14, $b0.0 = $r0.16, $r0.16, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.15, $b0.1
;;
	c0	addcg $r0.16, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.15, $b0.0
;;
	c0	addcg $r0.14, $b0.0 = $r0.16, $r0.16, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.15, $b0.1
;;
	c0	addcg $r0.16, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.15, $b0.0
;;
	c0	addcg $r0.14, $b0.0 = $r0.16, $r0.16, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.15, $b0.1
;;
	c0	addcg $r0.16, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.15, $b0.0
;;
	c0	addcg $r0.14, $b0.0 = $r0.16, $r0.16, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.15, $b0.1
;;
	c0	addcg $r0.16, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.15, $b0.0
;;
	c0	addcg $r0.14, $b0.0 = $r0.16, $r0.16, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.15, $b0.1
;;
	c0	addcg $r0.16, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.15, $b0.0
;;
	c0	addcg $r0.14, $b0.0 = $r0.16, $r0.16, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.15, $b0.1
;;
	c0	addcg $r0.16, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.15, $b0.0
;;
	c0	addcg $r0.14, $b0.0 = $r0.16, $r0.16, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.15, $b0.1
;;
	c0	addcg $r0.16, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.15, $b0.0
;;
	c0	addcg $r0.14, $b0.0 = $r0.16, $r0.16, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.15, $b0.1
;;
	c0	addcg $r0.16, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.15, $b0.0
;;
	c0	addcg $r0.14, $b0.0 = $r0.16, $r0.16, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.15, $b0.1
;;
	c0	addcg $r0.16, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.15, $b0.0
;;
	c0	addcg $r0.14, $b0.0 = $r0.16, $r0.16, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.15, $b0.1
;;
	c0	addcg $r0.16, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.15, $b0.0
;;
	c0	addcg $r0.14, $b0.0 = $r0.16, $r0.16, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.15, $b0.1
;;
	c0	addcg $r0.16, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.15, $b0.0
;;
	c0	addcg $r0.14, $b0.0 = $r0.16, $r0.16, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.15, $b0.1
;;
	c0	addcg $r0.16, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.15, $b0.0
	c0	mtb $b0.0 = $r0.11
;;
	c0	addcg $r0.11, $b0.2 = $r0.16, $r0.16, $b0.2
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.15, $b0.1
;;
	c0	addcg $r0.14, $b0.1 = $r0.11, $r0.11, $b0.1
	c0	divs $r0.11, $b0.2 = $r0.13, $r0.15, $b0.2
;;
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.15, $b0.1
	c0	addcg $r0.13, $b0.2 = $r0.14, $r0.14, $b0.2
;;
	c0	addcg $r0.14, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.15, $b0.2
;;
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.15, $b0.1
	c0	cmpgeu $r0.9 = $r0.12, $r0.9
	c0	addcg $r0.12, $b0.2 = $r0.14, $r0.14, $b0.2
;;
	c0	cmpge $b0.2 = $r0.11, $r0.0
	c0	addcg $r0.11, $b0.1 = $r0.12, $r0.12, $b0.1
;;
	c0	orc $r0.11 = $r0.11, $r0.0
;;
	c0	mfb $r0.12 = $b0.2
;;
	c0	sh1add $r0.11 = $r0.11, $r0.12
;;
	c0	slct $r0.9 = $b0.0, $r0.9, $r0.11
	c0	goto LBB47_30
;;
LBB47_28:
	c0	mov $r0.9 = 65535
;;
LBB47_30:                               ## %cond.end.12.i
	c0	or $r0.9 = $r0.9, $r0.10
;;
	c0	shru $r0.9 = $r0.9, $r0.3
;;
LBB47_31:                               ## %estimateDiv64To32.exit
	c0	shru $r0.8 = $r0.8, $r0.3
;;
	c0	add $r0.9 = $r0.9, $r0.8
;;
LBB47_32:                               ## %estimateSqrt32.exit
	c0	add $r0.8 = $r0.9, 2
	c0	add $r0.4 = $r0.4, 126
;;
	c0	and $r0.10 = $r0.8, 126
;;
	c0	cmpgtu $b0.0 = $r0.10, 5
;;
;;
	c0	br $b0.0, LBB47_39
;;
## BB#33:                               ## %if.then.25
	c0	cmpgtu $b0.0 = $r0.9, -3
;;
;;
	c0	brf $b0.0, LBB47_35
;;
## BB#34:
	c0	mov $r0.5 = 2147483647
	c0	goto LBB47_40
;;
LBB47_35:                               ## %if.else
	c0	mov $r0.10 = 16
	c0	zxth $r0.11 = $r0.8
	c0	shru $r0.6 = $r0.7, $r0.6
	c0	mov $r0.7 = 15
;;
	c0	shru $r0.12 = $r0.8, $r0.10
	c0	mpyhs $r0.13 = $r0.11, $r0.11
	c0	mpylu $r0.14 = $r0.11, $r0.11
	c0	mov $r0.15 = -1
;;
	c0	mpylu $r0.16 = $r0.12, $r0.11
	c0	mpyhs $r0.11 = $r0.12, $r0.11
;;
	c0	mpylu $r0.17 = $r0.12, $r0.12
	c0	mpyhs $r0.12 = $r0.12, $r0.12
;;
	c0	add $r0.11 = $r0.16, $r0.11
	c0	add $r0.13 = $r0.14, $r0.13
;;
	c0	shl $r0.5 = $r0.11, $r0.5
	c0	shl $r0.14 = $r0.11, $r0.3
;;
	c0	cmpltu $b0.0 = $r0.14, $r0.11
	c0	add $r0.13 = $r0.5, $r0.13
;;
	c0	cmpltu $r0.5 = $r0.13, $r0.5
	c0	cmpne $r0.14 = $r0.13, 0
;;
	c0	mtb $b0.1 = $r0.5
	c0	mtb $b0.2 = $r0.14
	c0	mov $r0.5 = 0
	c0	add $r0.12 = $r0.17, $r0.12
;;
	c0	shru $r0.7 = $r0.11, $r0.7
	c0	sub $r0.6 = $r0.6, $r0.12
;;
	c0	zxth $r0.7 = $r0.7
	c0	sub $r0.5 = $r0.5, $r0.13
	c0	mfb $r0.11 = $b0.0
;;
	c0	shl $r0.10 = $r0.11, $r0.10
	c0	mfb $r0.11 = $b0.1
	c0	slct $r0.12 = $b0.2, $r0.15, 0
;;
	c0	or $r0.7 = $r0.10, $r0.7
	c0	add $r0.6 = $r0.6, $r0.11
;;
	c0	add $r0.6 = $r0.6, $r0.12
;;
	c0	sub $r0.6 = $r0.6, $r0.7
;;
	c0	cmpgt $b0.0 = $r0.6, -1
;;
;;
	c0	br $b0.0, LBB47_38
;;
## BB#36:                               ## %while.body.preheader
	c0	mov $r0.7 = 3
;;
	c0	sh1add $r0.7 = $r0.9, $r0.7
;;
LBB47_37:                               ## %while.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.8 = $r0.8, -1
	c0	add $r0.5 = $r0.7, $r0.5
;;
	c0	cmpltu $r0.9 = $r0.5, $r0.7
	c0	shru $r0.10 = $r0.8, $r0.2
	c0	add $r0.7 = $r0.7, -2
;;
	c0	add $r0.6 = $r0.10, $r0.6
;;
	c0	add $r0.6 = $r0.6, $r0.9
;;
	c0	cmplt $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB47_37
;;
LBB47_38:                               ## %while.end
	c0	or $r0.2 = $r0.5, $r0.6
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	or $r0.8 = $r0.2, $r0.8
;;
LBB47_39:                               ## %if.end.36
	c0	and $r0.2 = $r0.8, 1
	c0	shru $r0.3 = $r0.8, $r0.3
;;
	c0	or $r0.5 = $r0.2, $r0.3
;;
LBB47_40:                               ## %roundAndPack
	c0	mov $r0.3 = 0
;;
.call roundAndPackFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = roundAndPackFloat32
;;
LBB47_41:                               ## %cleanup
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB47_13:
	c0	mov $r0.3 = 0
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

#.globl float32_eq
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_eq
float32_eq::
## BB#0:                                ## %entry
	c0	and $r0.2 = $r0.3, 2139095040
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB48_2
;;
## BB#1:                                ## %entry
	c0	and $r0.2 = $r0.3, 8388607
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB48_4
;;
LBB48_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 2139095040
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB48_9
;;
## BB#3:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 8388607
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB48_9
;;
LBB48_4:                                ## %if.then
	c0	and $r0.2 = $r0.3, 2143289344
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB48_6
;;
## BB#5:                                ## %if.then
	c0	and $r0.2 = $r0.3, 4194303
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB48_8
;;
LBB48_6:                                ## %lor.lhs.false.9
	c0	and $r0.2 = $r0.4, 2143289344
	c0	mov $r0.3 = 0
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB48_13
;;
## BB#7:                                ## %lor.lhs.false.9
	c0	and $r0.2 = $r0.4, 4194303
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB48_13
;;
LBB48_8:                                ## %if.then.12
	c0	mov $r0.2 = float_exception_flags
	c0	mov $r0.3 = 0
;;
	c0	ldw $r0.4 = 0[$r0.2]
;;
;;
	c0	or $r0.4 = $r0.4, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB48_9:                                ## %if.end.13
	c0	cmpeq $b0.0 = $r0.3, $r0.4
;;
;;
	c0	brf $b0.0, LBB48_11
;;
## BB#10:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB48_12
;;
LBB48_11:                               ## %lor.rhs
	c0	or $r0.2 = $r0.4, $r0.3
;;
	c0	and $r0.2 = $r0.2, 2147483647
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
LBB48_12:                               ## %lor.end
	c0	mfb $r0.3 = $b0.0
;;
LBB48_13:                               ## %return
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float32_le
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_le
float32_le::
## BB#0:                                ## %entry
	c0	and $r0.2 = $r0.3, 2139095040
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB49_2
;;
## BB#1:                                ## %entry
	c0	and $r0.2 = $r0.3, 8388607
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB49_4
;;
LBB49_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 2139095040
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB49_5
;;
## BB#3:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 8388607
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB49_5
;;
LBB49_4:                                ## %if.then
	c0	mov $r0.2 = float_exception_flags
	c0	mov $r0.3 = 0
;;
	c0	ldw $r0.4 = 0[$r0.2]
;;
;;
	c0	or $r0.4 = $r0.4, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB49_5:                                ## %if.end
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.5 = $r0.4, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.5
;;
;;
	c0	brf $b0.0, LBB49_6
;;
## BB#10:                               ## %if.end.13
	c0	cmpltu $b0.0 = $r0.3, $r0.4
	c0	cmpeq $b0.1 = $r0.3, $r0.4
;;
;;
	c0	mfb $r0.3 = $b0.0
	c0	mfb $r0.4 = $b0.1
;;
	c0	xor $r0.2 = $r0.3, $r0.2
;;
.return ret($r0.3:u32)
	c0	or $r0.3 = $r0.2, $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB49_6:                                ## %if.then.10
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB49_8
;;
## BB#7:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB49_8:                                ## %lor.rhs
	c0	or $r0.2 = $r0.4, $r0.3
;;
	c0	and $r0.2 = $r0.2, 2147483647
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float32_lt
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_lt
float32_lt::
## BB#0:                                ## %entry
	c0	and $r0.2 = $r0.3, 2139095040
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB50_2
;;
## BB#1:                                ## %entry
	c0	and $r0.2 = $r0.3, 8388607
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB50_4
;;
LBB50_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 2139095040
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB50_5
;;
## BB#3:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 8388607
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB50_5
;;
LBB50_4:                                ## %if.then
	c0	mov $r0.2 = float_exception_flags
	c0	mov $r0.3 = 0
;;
	c0	ldw $r0.4 = 0[$r0.2]
;;
;;
	c0	or $r0.4 = $r0.4, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB50_5:                                ## %if.end
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.5 = $r0.4, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.5
;;
;;
	c0	brf $b0.0, LBB50_6
;;
## BB#10:                               ## %if.end.13
	c0	cmpltu $b0.0 = $r0.3, $r0.4
	c0	cmpne $b0.1 = $r0.3, $r0.4
;;
;;
	c0	mfb $r0.3 = $b0.0
	c0	mfb $r0.4 = $b0.1
;;
	c0	cmpne $b0.0 = $r0.2, $r0.3
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	and $r0.2 = $r0.4, $r0.2
;;
.return ret($r0.3:u32)
	c0	and $r0.3 = $r0.2, 1
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB50_6:                                ## %if.then.10
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB50_7
;;
## BB#8:                                ## %land.rhs
	c0	or $r0.2 = $r0.4, $r0.3
;;
	c0	and $r0.2 = $r0.2, 2147483647
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB50_7:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float32_eq_signaling
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_eq_signaling
float32_eq_signaling::
## BB#0:                                ## %entry
	c0	and $r0.2 = $r0.3, 2139095040
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB51_2
;;
## BB#1:                                ## %entry
	c0	and $r0.2 = $r0.3, 8388607
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB51_4
;;
LBB51_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 2139095040
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB51_5
;;
## BB#3:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 8388607
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB51_5
;;
LBB51_4:                                ## %if.then
	c0	mov $r0.2 = float_exception_flags
	c0	mov $r0.3 = 0
;;
	c0	ldw $r0.4 = 0[$r0.2]
;;
;;
	c0	or $r0.4 = $r0.4, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB51_5:                                ## %if.end
	c0	cmpeq $b0.0 = $r0.3, $r0.4
;;
;;
	c0	brf $b0.0, LBB51_7
;;
## BB#6:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB51_7:                                ## %lor.rhs
	c0	or $r0.2 = $r0.4, $r0.3
;;
	c0	and $r0.2 = $r0.2, 2147483647
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float32_le_quiet
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_le_quiet
float32_le_quiet::
## BB#0:                                ## %entry
	c0	and $r0.2 = $r0.3, 2139095040
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB52_2
;;
## BB#1:                                ## %entry
	c0	and $r0.2 = $r0.3, 8388607
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB52_4
;;
LBB52_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 2139095040
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB52_9
;;
## BB#3:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 8388607
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB52_9
;;
LBB52_4:                                ## %if.then
	c0	and $r0.2 = $r0.3, 2143289344
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB52_6
;;
## BB#5:                                ## %if.then
	c0	and $r0.2 = $r0.3, 4194303
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB52_8
;;
LBB52_6:                                ## %lor.lhs.false.9
	c0	and $r0.2 = $r0.4, 2143289344
	c0	mov $r0.3 = 0
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB52_15
;;
## BB#7:                                ## %lor.lhs.false.9
	c0	and $r0.2 = $r0.4, 4194303
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB52_15
;;
LBB52_8:                                ## %if.then.12
	c0	mov $r0.2 = float_exception_flags
	c0	mov $r0.3 = 0
;;
	c0	ldw $r0.4 = 0[$r0.2]
;;
;;
	c0	or $r0.4 = $r0.4, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB52_9:                                ## %if.end.13
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.5 = $r0.4, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.5
;;
;;
	c0	brf $b0.0, LBB52_10
;;
## BB#14:                               ## %if.end.20
	c0	cmpltu $b0.0 = $r0.3, $r0.4
	c0	cmpeq $b0.1 = $r0.3, $r0.4
;;
;;
	c0	mfb $r0.3 = $b0.0
	c0	mfb $r0.4 = $b0.1
;;
	c0	xor $r0.2 = $r0.3, $r0.2
;;
	c0	or $r0.3 = $r0.2, $r0.4
;;
LBB52_15:                               ## %cleanup
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB52_10:                               ## %if.then.17
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB52_12
;;
## BB#11:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB52_12:                               ## %lor.rhs
	c0	or $r0.2 = $r0.4, $r0.3
;;
	c0	and $r0.2 = $r0.2, 2147483647
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float32_lt_quiet
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_lt_quiet
float32_lt_quiet::
## BB#0:                                ## %entry
	c0	and $r0.2 = $r0.3, 2139095040
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB53_2
;;
## BB#1:                                ## %entry
	c0	and $r0.2 = $r0.3, 8388607
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB53_4
;;
LBB53_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 2139095040
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB53_9
;;
## BB#3:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 8388607
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB53_9
;;
LBB53_4:                                ## %if.then
	c0	and $r0.2 = $r0.3, 2143289344
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB53_6
;;
## BB#5:                                ## %if.then
	c0	and $r0.2 = $r0.3, 4194303
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB53_8
;;
LBB53_6:                                ## %lor.lhs.false.9
	c0	and $r0.2 = $r0.4, 2143289344
	c0	mov $r0.3 = 0
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB53_15
;;
## BB#7:                                ## %lor.lhs.false.9
	c0	and $r0.2 = $r0.4, 4194303
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB53_15
;;
LBB53_8:                                ## %if.then.12
	c0	mov $r0.2 = float_exception_flags
	c0	mov $r0.3 = 0
;;
	c0	ldw $r0.4 = 0[$r0.2]
;;
;;
	c0	or $r0.4 = $r0.4, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB53_9:                                ## %if.end.13
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.5 = $r0.4, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.5
;;
;;
	c0	brf $b0.0, LBB53_10
;;
## BB#14:                               ## %if.end.20
	c0	cmpltu $b0.0 = $r0.3, $r0.4
	c0	cmpne $b0.1 = $r0.3, $r0.4
;;
;;
	c0	mfb $r0.3 = $b0.0
	c0	mfb $r0.4 = $b0.1
;;
	c0	cmpne $b0.0 = $r0.2, $r0.3
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	and $r0.2 = $r0.4, $r0.2
;;
	c0	and $r0.3 = $r0.2, 1
;;
LBB53_15:                               ## %cleanup
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB53_10:                               ## %if.then.17
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB53_11
;;
## BB#12:                               ## %land.rhs
	c0	or $r0.2 = $r0.4, $r0.3
;;
	c0	and $r0.2 = $r0.2, 2147483647
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB53_11:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float64_to_int32
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_to_int32
float64_to_int32::
## BB#0:                                ## %entry
	c0	mov $r0.2 = 20
	c0	mov $r0.5 = 31
;;
	c0	shru $r0.7 = $r0.3, $r0.2
;;
	c0	and $r0.8 = $r0.7, 2047
;;
	c0	add $r0.6 = $r0.8, -1043
;;
	c0	cmplt $b0.0 = $r0.6, 0
	c0	and $r0.9 = $r0.3, 1048575
	c0	shru $r0.2 = $r0.3, $r0.5
;;
;;
	c0	br $b0.0, LBB54_7
;;
## BB#1:                                ## %if.then
	c0	cmpltu $b0.0 = $r0.8, 1055
;;
;;
	c0	br $b0.0, LBB54_3
;;
## BB#2:                                ## %if.then.13
	c0	or $r0.3 = $r0.9, $r0.4
	c0	cmpne $b0.0 = $r0.8, 2047
;;
	c0	cmpeq $b0.1 = $r0.3, 0
;;
;;
	c0	slct $r0.3 = $b0.1, $r0.2, 0
;;
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.3
	c0	goto LBB54_19
;;
LBB54_7:                                ## %if.else
	c0	cmpne $b0.0 = $r0.4, 0
	c0	cmpgtu $b0.1 = $r0.8, 1021
;;
;;
	c0	mfb $r0.4 = $b0.0
	c0	br $b0.1, LBB54_9
;;
## BB#8:                                ## %if.then.24
	c0	or $r0.6 = $r0.8, $r0.9
	c0	mov $r0.3 = 0
;;
	c0	or $r0.4 = $r0.6, $r0.4
	c0	goto LBB54_10
;;
LBB54_3:                                ## %if.end.16
	c0	cmpeq $b0.0 = $r0.6, 0
	c0	or $r0.3 = $r0.9, 1048576
;;
;;
	c0	br $b0.0, LBB54_5
;;
## BB#4:                                ## %cond.false.i
	c0	mov $r0.8 = 1043
	c0	shl $r0.3 = $r0.3, $r0.6
;;
	c0	sub $r0.7 = $r0.8, $r0.7
;;
	c0	and $r0.7 = $r0.7, 31
;;
	c0	shru $r0.7 = $r0.4, $r0.7
;;
	c0	or $r0.3 = $r0.7, $r0.3
;;
LBB54_5:                                ## %shortShift64Left.exit
	c0	cmpgtu $b0.0 = $r0.3, -2147483648
;;
;;
	c0	br $b0.0, LBB54_19
;;
## BB#6:
	c0	shl $r0.4 = $r0.4, $r0.6
	c0	goto LBB54_10
;;
LBB54_9:                                ## %if.else.27
	c0	add $r0.3 = $r0.7, 13
	c0	mov $r0.6 = 1043
;;
	c0	or $r0.7 = $r0.9, 1048576
	c0	and $r0.3 = $r0.3, 31
	c0	sub $r0.6 = $r0.6, $r0.8
;;
	c0	shl $r0.8 = $r0.7, $r0.3
	c0	shru $r0.3 = $r0.7, $r0.6
;;
	c0	or $r0.4 = $r0.8, $r0.4
;;
LBB54_10:                               ## %if.end.32
	c0	mov $r0.6 = float_rounding_mode
;;
	c0	ldw $r0.6 = 0[$r0.6]
;;
;;
	c0	cmpne $b0.0 = $r0.6, 0
;;
;;
	c0	brf $b0.0, LBB54_11
;;
## BB#14:                               ## %if.else.48
	c0	cmpne $b0.0 = $r0.4, 0
	c0	cmpeq $b0.1 = $r0.2, 0
;;
;;
	c0	mfb $r0.4 = $b0.0
	c0	br $b0.1, LBB54_16
;;
## BB#15:                               ## %if.then.52
	c0	cmpeq $b0.1 = $r0.6, 3
	c0	mfb $r0.6 = $b0.0
	c0	mov $r0.7 = 0
;;
;;
	c0	mfb $r0.8 = $b0.1
;;
	c0	and $r0.6 = $r0.6, $r0.8
;;
	c0	and $r0.6 = $r0.6, 1
;;
	c0	add $r0.3 = $r0.3, $r0.6
;;
	c0	sub $r0.3 = $r0.7, $r0.3
	c0	goto LBB54_17
;;
LBB54_11:                               ## %if.then.35
	c0	cmpgt $b0.0 = $r0.4, -1
;;
;;
	c0	br $b0.0, LBB54_13
;;
## BB#12:                               ## %if.then.38
	c0	and $r0.6 = $r0.4, 2147483647
	c0	add $r0.3 = $r0.3, 1
;;
	c0	and $r0.7 = $r0.3, -2
	c0	cmpeq $b0.0 = $r0.6, 0
;;
;;
	c0	slct $r0.3 = $b0.0, $r0.7, $r0.3
;;
LBB54_13:                               ## %if.end.45
	c0	mov $r0.6 = 0
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	sub $r0.6 = $r0.6, $r0.3
;;
	c0	slct $r0.3 = $b0.0, $r0.6, $r0.3
	c0	goto LBB54_17
;;
LBB54_16:                               ## %if.else.57
	c0	cmpeq $b0.1 = $r0.6, 2
	c0	mfb $r0.6 = $b0.0
;;
;;
	c0	mfb $r0.7 = $b0.1
;;
	c0	and $r0.6 = $r0.6, $r0.7
;;
	c0	and $r0.6 = $r0.6, 1
;;
	c0	add $r0.3 = $r0.6, $r0.3
;;
LBB54_17:                               ## %if.end.63
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB54_20
;;
## BB#18:                               ## %if.end.63
	c0	shru $r0.5 = $r0.3, $r0.5
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.5
;;
;;
	c0	br $b0.0, LBB54_20
;;
LBB54_19:                               ## %invalid
	c0	mov $r0.4 = float_exception_flags
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	ldw $r0.2 = 0[$r0.4]
	c0	mov $r0.3 = -2147483648
;;
	c0	slct $r0.3 = $b0.0, $r0.3, 2147483647
;;
	c0	or $r0.2 = $r0.2, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.4] = $r0.2
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB54_20:                               ## %if.end.72
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB54_22
;;
## BB#21:                               ## %if.then.74
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
;;
;;
	c0	or $r0.4 = $r0.4, 1
;;
	c0	stw 0[$r0.2] = $r0.4
;;
LBB54_22:                               ## %cleanup
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float64_to_int32_round_to_zero
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_to_int32_round_to_zero
float64_to_int32_round_to_zero::
## BB#0:                                ## %entry
	c0	mov $r0.2 = 20
	c0	mov $r0.5 = 31
;;
	c0	shru $r0.7 = $r0.3, $r0.2
;;
	c0	and $r0.6 = $r0.7, 2047
;;
	c0	add $r0.9 = $r0.6, -1043
;;
	c0	cmplt $b0.0 = $r0.9, 0
	c0	and $r0.8 = $r0.3, 1048575
	c0	shru $r0.2 = $r0.3, $r0.5
;;
;;
	c0	br $b0.0, LBB55_5
;;
## BB#1:                                ## %if.then
	c0	cmpltu $b0.0 = $r0.6, 1055
;;
;;
	c0	br $b0.0, LBB55_3
;;
## BB#2:                                ## %if.then.13
	c0	or $r0.3 = $r0.8, $r0.4
	c0	cmpne $b0.0 = $r0.6, 2047
;;
	c0	cmpeq $b0.1 = $r0.3, 0
;;
;;
	c0	slct $r0.3 = $b0.1, $r0.2, 0
;;
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.3
	c0	goto LBB55_10
;;
LBB55_5:                                ## %if.else
	c0	cmpgtu $b0.0 = $r0.6, 1022
;;
;;
	c0	br $b0.0, LBB55_7
;;
## BB#6:                                ## %if.then.19
	c0	or $r0.2 = $r0.8, $r0.4
	c0	mov $r0.3 = 0
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB55_12
;;
	c0	goto LBB55_13
;;
LBB55_3:                                ## %if.end.16
	c0	cmpeq $b0.0 = $r0.9, 0
	c0	shl $r0.6 = $r0.4, $r0.9
	c0	or $r0.3 = $r0.8, 1048576
;;
;;
	c0	br $b0.0, LBB55_8
;;
## BB#4:                                ## %cond.false.i
	c0	mov $r0.8 = 1043
	c0	shl $r0.3 = $r0.3, $r0.9
;;
	c0	sub $r0.7 = $r0.8, $r0.7
;;
	c0	and $r0.7 = $r0.7, 31
;;
	c0	shru $r0.4 = $r0.4, $r0.7
;;
	c0	or $r0.3 = $r0.4, $r0.3
	c0	goto LBB55_8
;;
LBB55_7:                                ## %if.end.26
	c0	add $r0.3 = $r0.7, 13
	c0	mov $r0.7 = 1043
;;
	c0	or $r0.8 = $r0.8, 1048576
	c0	and $r0.3 = $r0.3, 31
	c0	sub $r0.6 = $r0.7, $r0.6
;;
	c0	shl $r0.7 = $r0.8, $r0.3
	c0	shru $r0.3 = $r0.8, $r0.6
;;
	c0	or $r0.6 = $r0.7, $r0.4
;;
LBB55_8:                                ## %if.end.30
	c0	mov $r0.4 = 0
	c0	cmpne $b0.0 = $r0.2, 0
	c0	cmpeq $b0.1 = $r0.3, 0
;;
	c0	sub $r0.4 = $r0.4, $r0.3
;;
	c0	slct $r0.3 = $b0.0, $r0.4, $r0.3
	c0	br $b0.1, LBB55_11
;;
## BB#9:                                ## %if.end.30
	c0	shru $r0.4 = $r0.3, $r0.5
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.4
;;
;;
	c0	br $b0.0, LBB55_11
;;
LBB55_10:                               ## %invalid
	c0	mov $r0.4 = float_exception_flags
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	ldw $r0.2 = 0[$r0.4]
	c0	mov $r0.3 = -2147483648
;;
	c0	slct $r0.3 = $b0.0, $r0.3, 2147483647
;;
	c0	or $r0.2 = $r0.2, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.4] = $r0.2
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB55_11:                               ## %if.end.40
	c0	cmpeq $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB55_13
;;
LBB55_12:                               ## %if.then.42
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
;;
;;
	c0	or $r0.4 = $r0.4, 1
;;
	c0	stw 0[$r0.2] = $r0.4
;;
LBB55_13:                               ## %cleanup
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float64_to_float32
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_to_float32
float64_to_float32::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $l0.0
	c0	mov $r0.6 = 20
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.5 = 31
;;
	c0	shru $r0.3 = $r0.2, $r0.6
;;
	c0	and $r0.7 = $r0.3, 2047
;;
	c0	cmpne $b0.0 = $r0.7, 2047
	c0	and $r0.8 = $r0.2, 1048575
;;
	c0	shru $r0.3 = $r0.2, $r0.5
;;
	c0	br $b0.0, LBB56_7
;;
## BB#1:                                ## %if.then
	c0	or $r0.7 = $r0.8, $r0.4
;;
	c0	cmpeq $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB56_6
;;
## BB#2:                                ## %if.then.12
	c0	and $r0.7 = $r0.2, 2146959360
;;
	c0	cmpne $b0.0 = $r0.7, 2146435072
;;
;;
	c0	br $b0.0, LBB56_5
;;
## BB#3:                                ## %land.rhs.i.i
	c0	and $r0.7 = $r0.2, 524287
;;
	c0	or $r0.7 = $r0.7, $r0.4
;;
	c0	cmpeq $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB56_5
;;
## BB#4:                                ## %if.then.i
	c0	mov $r0.7 = float_exception_flags
;;
	c0	ldw $r0.8 = 0[$r0.7]
;;
;;
	c0	or $r0.8 = $r0.8, 16
;;
	c0	stw 0[$r0.7] = $r0.8
;;
LBB56_5:                                ## %float64ToCommonNaN.exit
	c0	mov $r0.7 = 12
	c0	shru $r0.4 = $r0.4, $r0.6
	c0	mov $r0.6 = 9
	c0	shl $r0.3 = $r0.3, $r0.5
;;
	c0	shl $r0.2 = $r0.2, $r0.7
;;
	c0	or $r0.2 = $r0.4, $r0.2
;;
	c0	shru $r0.2 = $r0.2, $r0.6
;;
	c0	or $r0.2 = $r0.3, $r0.2
;;
	c0	or $r0.3 = $r0.2, 2143289344
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB56_7:                                ## %if.end.19
	c0	and $r0.2 = $r0.4, 4194303
	c0	mov $r0.5 = 22
	c0	mov $r0.6 = 10
;;
	c0	cmpeq $b0.0 = $r0.7, 0
	c0	cmpne $b0.1 = $r0.2, 0
	c0	shru $r0.2 = $r0.4, $r0.5
	c0	shl $r0.5 = $r0.8, $r0.6
;;
	c0	add $r0.4 = $r0.7, -897
;;
	c0	mfb $r0.6 = $b0.1
	c0	or $r0.2 = $r0.5, $r0.2
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
	c0	or $r0.5 = $r0.2, 1073741824
;;
	c0	slct $r0.5 = $b0.0, $r0.2, $r0.5
;;
.call roundAndPackFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = roundAndPackFloat32
;;
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB56_6:                                ## %if.end
	c0	shl $r0.2 = $r0.3, $r0.5
;;
	c0	or $r0.3 = $r0.2, 2139095040
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

#.globl float64_round_to_int
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_round_to_int
float64_round_to_int::
## BB#0:                                ## %entry
	c0	mov $r0.5 = 20
	c0	mov $r0.2 = $r0.3
;;
	c0	shru $r0.3 = $r0.2, $r0.5
;;
	c0	and $r0.3 = $r0.3, 2047
;;
	c0	cmpltu $b0.0 = $r0.3, 1043
;;
;;
	c0	br $b0.0, LBB57_22
;;
## BB#1:                                ## %if.then
	c0	cmpltu $b0.0 = $r0.3, 1075
;;
;;
	c0	br $b0.0, LBB57_12
;;
## BB#2:                                ## %if.then.4
	c0	cmpne $b0.0 = $r0.3, 2047
;;
;;
	c0	br $b0.0, LBB57_44
;;
## BB#3:                                ## %land.lhs.true
	c0	and $r0.3 = $r0.2, 1048575
;;
	c0	or $r0.3 = $r0.3, $r0.4
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB57_44
;;
## BB#4:                                ## %if.then.12
	c0	and $r0.3 = $r0.2, 2146959360
;;
	c0	cmpne $b0.0 = $r0.3, 2146435072
;;
;;
	c0	br $b0.0, LBB57_5
;;
## BB#6:                                ## %land.rhs.i.59.i
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB57_8
;;
## BB#7:                                ## %float64_is_signaling_nan.exit.thread.i
	c0	or $r0.2 = $r0.2, 524288
	c0	goto LBB57_11
;;
LBB57_22:                               ## %if.else.67
	c0	cmpgtu $b0.0 = $r0.3, 1022
;;
;;
	c0	br $b0.0, LBB57_33
;;
## BB#23:                               ## %if.then.70
	c0	mov $r0.5 = 1
;;
	c0	shl $r0.5 = $r0.2, $r0.5
;;
	c0	or $r0.5 = $r0.5, $r0.4
;;
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB57_44
;;
## BB#24:                               ## %if.end.78
	c0	mov $r0.8 = float_exception_flags
	c0	mov $r0.5 = float_rounding_mode
;;
	c0	ldw $r0.9 = 0[$r0.8]
;;
	c0	ldw $r0.7 = 0[$r0.5]
	c0	mov $r0.6 = 31
;;
	c0	shru $r0.5 = $r0.2, $r0.6
	c0	or $r0.9 = $r0.9, 1
;;
	c0	cmpeq $b0.0 = $r0.7, 3
	c0	stw 0[$r0.8] = $r0.9
;;
;;
	c0	br $b0.0, LBB57_30
;;
## BB#25:                               ## %if.end.78
	c0	cmpeq $b0.0 = $r0.7, 2
;;
;;
	c0	brf $b0.0, LBB57_26
;;
## BB#31:                               ## %sw.bb.101
	c0	cmpeq $b0.0 = $r0.5, 0
	c0	mov $r0.2 = 1072693248
	c0	mov $r0.4 = 0
;;
;;
	c0	slct $r0.2 = $b0.0, $r0.2, -2147483648
	c0	goto LBB57_44
;;
LBB57_12:                               ## %if.end.18
	c0	mov $r0.7 = float_rounding_mode
	c0	mov $r0.8 = 1074
;;
	c0	mov $r0.10 = 2
	c0	mov $r0.6 = $r0.4
	c0	mov $r0.5 = $r0.2
	c0	sub $r0.8 = $r0.8, $r0.3
;;
	c0	ldw $r0.9 = 0[$r0.7]
	c0	shl $r0.3 = $r0.10, $r0.8
;;
;;
	c0	cmpeq $b0.0 = $r0.9, 1
;;
;;
	c0	br $b0.0, LBB57_21
;;
## BB#13:                               ## %if.end.18
	c0	cmpne $b0.0 = $r0.9, 0
	c0	add $r0.7 = $r0.3, -1
;;
;;
	c0	br $b0.0, LBB57_19
;;
## BB#14:                               ## %if.then.22
	c0	cmpgtu $b0.0 = $r0.8, 30
;;
;;
	c0	br $b0.0, LBB57_17
;;
## BB#15:                               ## %if.then.24
	c0	mov $r0.5 = 1
;;
	c0	shru $r0.5 = $r0.3, $r0.5
;;
	c0	add $r0.6 = $r0.5, $r0.4
;;
	c0	and $r0.7 = $r0.6, $r0.7
	c0	cmpltu $r0.5 = $r0.6, $r0.5
;;
	c0	cmpne $b0.0 = $r0.7, 0
	c0	add $r0.5 = $r0.5, $r0.2
;;
;;
	c0	br $b0.0, LBB57_21
;;
## BB#16:                               ## %if.then.31
	c0	andc $r0.6 = $r0.3, $r0.6
	c0	goto LBB57_21
;;
LBB57_33:                               ## %if.end.109
	c0	mov $r0.6 = float_rounding_mode
	c0	mov $r0.8 = 1043
;;
	c0	mov $r0.7 = 1
	c0	mov $r0.5 = $r0.2
	c0	sub $r0.3 = $r0.8, $r0.3
	c0	ldw $r0.8 = 0[$r0.6]
;;
	c0	shl $r0.3 = $r0.7, $r0.3
;;
	c0	cmpeq $b0.0 = $r0.8, 1
;;
;;
	c0	br $b0.0, LBB57_39
;;
## BB#34:                               ## %if.end.109
	c0	cmpne $b0.0 = $r0.8, 0
	c0	add $r0.6 = $r0.3, -1
;;
;;
	c0	br $b0.0, LBB57_37
;;
## BB#35:                               ## %if.then.118
	c0	shru $r0.5 = $r0.3, $r0.7
;;
	c0	add $r0.5 = $r0.5, $r0.2
;;
	c0	and $r0.6 = $r0.5, $r0.6
;;
	c0	or $r0.6 = $r0.6, $r0.4
;;
	c0	cmpne $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB57_39
;;
## BB#36:                               ## %if.then.127
	c0	andc $r0.5 = $r0.3, $r0.5
	c0	goto LBB57_39
;;
LBB57_19:                               ## %if.then.50
	c0	cmpeq $b0.0 = $r0.9, 2
	c0	mov $r0.8 = 31
	c0	mov $r0.6 = $r0.4
	c0	mov $r0.5 = $r0.2
;;
	c0	shru $r0.8 = $r0.2, $r0.8
;;
	c0	mfb $r0.9 = $b0.0
;;
	c0	cmpeq $b0.0 = $r0.8, $r0.9
;;
;;
	c0	br $b0.0, LBB57_21
;;
## BB#20:                               ## %if.then.56
	c0	add $r0.6 = $r0.7, $r0.4
;;
	c0	cmpltu $r0.5 = $r0.6, $r0.7
;;
	c0	add $r0.5 = $r0.5, $r0.2
	c0	goto LBB57_21
;;
LBB57_37:                               ## %if.then.135
	c0	cmpeq $b0.0 = $r0.8, 2
	c0	mov $r0.7 = 31
	c0	mov $r0.5 = $r0.2
;;
	c0	shru $r0.7 = $r0.2, $r0.7
;;
	c0	mfb $r0.8 = $b0.0
;;
	c0	cmpeq $b0.0 = $r0.7, $r0.8
;;
;;
	c0	br $b0.0, LBB57_39
;;
## BB#38:                               ## %if.then.143
	c0	cmpne $b0.0 = $r0.4, 0
;;
;;
	c0	mfb $r0.5 = $b0.0
;;
	c0	or $r0.5 = $r0.5, $r0.2
;;
	c0	add $r0.5 = $r0.6, $r0.5
;;
LBB57_39:                               ## %if.end.153
	c0	mov $r0.6 = 0
;;
	c0	sub $r0.3 = $r0.6, $r0.3
;;
	c0	and $r0.5 = $r0.5, $r0.3
	c0	goto LBB57_40
;;
LBB57_30:                               ## %sw.bb.97
	c0	cmpeq $b0.0 = $r0.5, 0
	c0	mov $r0.4 = 0
;;
;;
	c0	slct $r0.2 = $b0.0, $r0.4, -1074790400
	c0	goto LBB57_44
;;
LBB57_26:                               ## %if.end.78
	c0	cmpne $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB57_32
;;
## BB#27:                               ## %sw.bb
	c0	cmpne $b0.0 = $r0.3, 1022
;;
;;
	c0	br $b0.0, LBB57_32
;;
## BB#28:                               ## %land.lhs.true.85
	c0	and $r0.2 = $r0.2, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB57_32
;;
## BB#29:                               ## %if.then.94
	c0	shl $r0.2 = $r0.5, $r0.6
	c0	mov $r0.4 = 0
;;
	c0	or $r0.2 = $r0.2, 1072693248
	c0	goto LBB57_44
;;
LBB57_32:                               ## %sw.epilog
	c0	mov $r0.4 = 0
	c0	shl $r0.2 = $r0.5, $r0.6
	c0	goto LBB57_44
;;
LBB57_5:
	c0	mov $r0.3 = 0
;;
	c0	mtb $b0.0 = $r0.3
	c0	goto LBB57_9
;;
LBB57_17:                               ## %if.else
	c0	cmpgt $b0.0 = $r0.4, -1
	c0	mov $r0.6 = $r0.4
	c0	mov $r0.5 = $r0.2
;;
;;
	c0	br $b0.0, LBB57_21
;;
## BB#18:                               ## %if.then.37
	c0	and $r0.5 = $r0.4, 2147483647
	c0	add $r0.7 = $r0.2, 1
	c0	mov $r0.6 = $r0.4
;;
	c0	and $r0.8 = $r0.7, -2
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	slct $r0.5 = $b0.0, $r0.8, $r0.7
;;
LBB57_21:                               ## %if.end.63
	c0	mov $r0.7 = 0
;;
	c0	sub $r0.3 = $r0.7, $r0.3
;;
	c0	and $r0.6 = $r0.6, $r0.3
;;
LBB57_40:                               ## %if.end.157
	c0	cmpne $b0.0 = $r0.6, $r0.4
;;
;;
	c0	br $b0.0, LBB57_42
;;
## BB#41:                               ## %if.end.157
	c0	cmpeq $b0.0 = $r0.5, $r0.2
;;
;;
	c0	br $b0.0, LBB57_44
;;
LBB57_42:                               ## %if.then.166
	c0	mov $r0.3 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.3]
	c0	mov $r0.2 = $r0.5
	c0	mov $r0.4 = $r0.6
;;
;;
	c0	or $r0.5 = $r0.7, 1
	c0	goto LBB57_43
;;
LBB57_8:                                ## %lor.rhs.i.i
	c0	and $r0.3 = $r0.2, 524287
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
LBB57_9:                                ## %float64_is_signaling_nan.exit.i
	c0	or $r0.2 = $r0.2, 524288
	c0	br $b0.0, LBB57_11
;;
## BB#10:                               ## %float64_is_signaling_nan.exit.i
	c0	mfb $r0.3 = $b0.0
;;
	c0	cmpne $b0.0 = $r0.3, 1
;;
;;
	c0	br $b0.0, LBB57_44
;;
LBB57_11:                               ## %if.then.i
	c0	mov $r0.3 = float_exception_flags
;;
	c0	ldw $r0.5 = 0[$r0.3]
;;
;;
	c0	or $r0.5 = $r0.5, 16
;;
LBB57_43:                               ## %cleanup
	c0	stw 0[$r0.3] = $r0.5
;;
LBB57_44:                               ## %cleanup
.return ret($r0.3:u32,$r0.4:u32)
	c0	mov $r0.3 = $r0.4
	c0	mov $r0.4 = $r0.2
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float64_add
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_add
float64_add::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $l0.0
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.8 = $r0.5, $r0.2
	c0	shru $r0.7 = $r0.3, $r0.2
;;
	c0	cmpne $b0.0 = $r0.7, $r0.8
;;
;;
	c0	br $b0.0, LBB58_2
;;
## BB#1:                                ## %if.then
.call addFloat64Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = addFloat64Sigs
;;
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB58_2:                                ## %if.else
.call subFloat64Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = subFloat64Sigs
;;
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @addFloat64Sigs
addFloat64Sigs::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $l0.0
	c0	mov $r0.8 = 20
	c0	mov $r0.2 = $r0.3
;;
	c0	and $r0.9 = $r0.5, 1048575
	c0	shru $r0.3 = $r0.5, $r0.8
	c0	shru $r0.8 = $r0.2, $r0.8
;;
	c0	and $r0.10 = $r0.3, 2047
	c0	and $r0.8 = $r0.8, 2047
;;
	c0	sub $r0.11 = $r0.8, $r0.10
;;
	c0	cmplt $b0.0 = $r0.11, 1
	c0	mov $r0.3 = $r0.4
	c0	and $r0.4 = $r0.2, 1048575
;;
;;
	c0	br $b0.0, LBB59_29
;;
## BB#1:                                ## %if.then
	c0	cmpne $b0.0 = $r0.8, 2047
;;
;;
	c0	br $b0.0, LBB59_17
;;
## BB#2:                                ## %if.then.22
	c0	or $r0.4 = $r0.4, $r0.3
;;
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB59_73
;;
## BB#3:                                ## %if.then.23
	c0	and $r0.4 = $r0.2, 2146959360
;;
	c0	cmpne $b0.0 = $r0.4, 2146435072
;;
;;
	c0	br $b0.0, LBB59_4
;;
## BB#5:                                ## %land.rhs.i.59.i.267
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	brf $b0.0, LBB59_7
;;
## BB#6:
	c0	mov $r0.4 = -1
;;
	c0	mtb $b0.2 = $r0.4
	c0	goto LBB59_8
;;
LBB59_29:                               ## %if.else.34
	c0	cmpgt $b0.0 = $r0.11, -1
;;
;;
	c0	brf $b0.0, LBB59_30
;;
## BB#57:                               ## %if.else.56
	c0	cmpne $b0.0 = $r0.8, 2047
;;
;;
	c0	br $b0.0, LBB59_65
;;
## BB#58:                               ## %if.then.58
	c0	or $r0.4 = $r0.4, $r0.3
;;
	c0	or $r0.4 = $r0.4, $r0.9
;;
	c0	or $r0.4 = $r0.4, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB59_73
;;
## BB#59:                               ## %if.then.63
	c0	and $r0.4 = $r0.2, 2146959360
;;
	c0	cmpne $b0.0 = $r0.4, 2146435072
;;
;;
	c0	br $b0.0, LBB59_60
;;
## BB#61:                               ## %land.rhs.i.59.i
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	brf $b0.0, LBB59_63
;;
## BB#62:
	c0	mov $r0.4 = -1
;;
	c0	mtb $b0.2 = $r0.4
	c0	goto LBB59_64
;;
LBB59_17:                               ## %if.end.29
	c0	cmpeq $b0.0 = $r0.10, 0
;;
;;
	c0	br $b0.0, LBB59_19
;;
## BB#18:                               ## %if.end.33.thread
	c0	mov $r0.2 = 0
	c0	or $r0.9 = $r0.9, 1048576
	c0	mov $r0.5 = $r0.11
;;
	c0	goto LBB59_21
;;
LBB59_30:                               ## %if.then.36
	c0	cmpne $b0.0 = $r0.10, 2047
;;
;;
	c0	br $b0.0, LBB59_47
;;
## BB#31:                               ## %if.then.38
	c0	or $r0.4 = $r0.9, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB59_46
;;
## BB#32:                               ## %if.then.41
	c0	and $r0.4 = $r0.2, 2146959360
;;
	c0	cmpne $b0.0 = $r0.4, 2146435072
;;
;;
	c0	br $b0.0, LBB59_33
;;
## BB#34:                               ## %land.rhs.i.59.i.184
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	brf $b0.0, LBB59_36
;;
## BB#35:
	c0	mov $r0.4 = -1
;;
	c0	mtb $b0.1 = $r0.4
	c0	goto LBB59_37
;;
LBB59_65:                               ## %if.end.70
	c0	add $r0.3 = $r0.6, $r0.3
	c0	cmpne $b0.0 = $r0.8, 0
	c0	add $r0.2 = $r0.9, $r0.4
;;
	c0	cmpltu $r0.4 = $r0.3, $r0.6
;;
	c0	add $r0.2 = $r0.2, $r0.4
	c0	brf $b0.0, LBB59_66
;;
## BB#70:                               ## %if.end.74
	c0	or $r0.5 = $r0.2, 2097152
	c0	mov $r0.2 = 0
	c0	goto LBB59_71
;;
LBB59_19:                               ## %if.end.33
	c0	add $r0.5 = $r0.11, -1
;;
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB59_67
;;
## BB#20:
	c0	mov $r0.2 = 1
;;
LBB59_21:                               ## %if.else.i.232
	c0	sub $r0.2 = $r0.2, $r0.11
	c0	cmpgt $b0.0 = $r0.5, 31
;;
	c0	and $r0.10 = $r0.2, 31
;;
	c0	br $b0.0, LBB59_23
;;
## BB#22:                               ## %if.then.2.i.238
	c0	shru $r0.11 = $r0.6, $r0.5
	c0	shl $r0.12 = $r0.9, $r0.10
	c0	shl $r0.10 = $r0.6, $r0.10
	c0	shru $r0.2 = $r0.9, $r0.5
;;
	c0	mov $r0.6 = 0
	c0	or $r0.9 = $r0.12, $r0.11
	c0	goto LBB59_28
;;
LBB59_23:                               ## %if.else.5.i.240
	c0	cmpeq $b0.0 = $r0.5, 32
	c0	mov $r0.2 = 0
;;
;;
	c0	brf $b0.0, LBB59_25
;;
## BB#24:
	c0	mov $r0.10 = $r0.6
	c0	mov $r0.6 = $r0.2
	c0	goto LBB59_28
;;
LBB59_4:
	c0	mov $r0.4 = 0
;;
	c0	mtb $b0.2 = $r0.4
	c0	goto LBB59_8
;;
LBB59_47:                               ## %if.end.49
	c0	cmpeq $b0.0 = $r0.8, 0
	c0	or $r0.5 = $r0.4, 1048576
	c0	mov $r0.2 = 0
;;
;;
	c0	mfb $r0.8 = $b0.0
	c0	slct $r0.4 = $b0.0, $r0.4, $r0.5
;;
	c0	add $r0.11 = $r0.11, $r0.8
;;
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB59_48
;;
## BB#49:                               ## %if.else.i
	c0	cmplt $b0.0 = $r0.11, -31
	c0	sub $r0.8 = $r0.2, $r0.11
	c0	and $r0.5 = $r0.11, 31
;;
;;
	c0	br $b0.0, LBB59_51
;;
## BB#50:                               ## %if.then.2.i
	c0	shru $r0.11 = $r0.3, $r0.8
	c0	shl $r0.12 = $r0.4, $r0.5
	c0	shl $r0.5 = $r0.3, $r0.5
	c0	shru $r0.2 = $r0.4, $r0.8
;;
	c0	mov $r0.3 = 0
	c0	or $r0.4 = $r0.12, $r0.11
	c0	goto LBB59_56
;;
LBB59_25:                               ## %if.else.8.i.242
	c0	cmpgt $b0.0 = $r0.5, 63
;;
;;
	c0	br $b0.0, LBB59_27
;;
## BB#26:                               ## %if.then.11.i.246
	c0	and $r0.5 = $r0.5, 31
	c0	shl $r0.10 = $r0.9, $r0.10
;;
	c0	shru $r0.9 = $r0.9, $r0.5
	c0	goto LBB59_28
;;
LBB59_66:                               ## %if.then.72
	c0	mov $r0.4 = 31
;;
	c0	shl $r0.4 = $r0.7, $r0.4
;;
	c0	or $r0.2 = $r0.2, $r0.4
	c0	goto LBB59_73
;;
LBB59_67:
	c0	mov $r0.2 = 0
	c0	goto LBB59_68
;;
LBB59_7:                                ## %lor.rhs.i.62.i.270
	c0	and $r0.4 = $r0.2, 524287
;;
	c0	cmpne $b0.2 = $r0.4, 0
;;
LBB59_8:                                ## %float64_is_signaling_nan.exit64.i.273
	c0	mov $r0.4 = 1
	c0	or $r0.7 = $r0.9, $r0.6
;;
	c0	shl $r0.4 = $r0.5, $r0.4
	c0	cmpne $b0.0 = $r0.7, 0
;;
	c0	cmpgtu $b0.1 = $r0.4, -2097153
	c0	and $r0.4 = $r0.5, 2146959360
;;
	c0	cmpne $b0.3 = $r0.4, 2146435072
	c0	mfb $r0.4 = $b0.0
;;
	c0	mfb $r0.7 = $b0.1
;;
	c0	and $r0.4 = $r0.7, $r0.4
;;
	c0	mtb $b0.0 = $r0.4
	c0	brf $b0.3, LBB59_10
;;
	c0	goto LBB59_9
;;
LBB59_60:
	c0	mov $r0.4 = 0
;;
	c0	mtb $b0.2 = $r0.4
	c0	goto LBB59_64
;;
LBB59_27:                               ## %if.else.15.i.251
	c0	cmpne $b0.0 = $r0.9, 0
	c0	cmpeq $b0.1 = $r0.5, 64
	c0	mov $r0.2 = 0
;;
;;
	c0	mfb $r0.5 = $b0.0
;;
	c0	slct $r0.10 = $b0.1, $r0.9, $r0.5
	c0	mov $r0.9 = $r0.2
;;
LBB59_28:                               ## %if.end.19.i.259
	c0	cmpne $b0.0 = $r0.6, 0
	c0	mov $r0.5 = $r0.9
	c0	mov $r0.9 = $r0.2
;;
	c0	mov $r0.6 = $r0.5
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	or $r0.2 = $r0.2, $r0.10
;;
LBB59_68:                               ## %if.end.77
	c0	add $r0.3 = $r0.6, $r0.3
	c0	or $r0.4 = $r0.4, 1048576
;;
	c0	cmpltu $r0.5 = $r0.3, $r0.6
	c0	add $r0.4 = $r0.9, $r0.4
;;
	c0	add $r0.5 = $r0.4, $r0.5
;;
	c0	cmpltu $b0.0 = $r0.5, 2097152
;;
;;
	c0	brf $b0.0, LBB59_71
;;
## BB#69:
	c0	add $r0.8 = $r0.8, -1
	c0	goto LBB59_72
;;
LBB59_71:                               ## %shiftRight1
	c0	cmpne $b0.0 = $r0.2, 0
	c0	mov $r0.2 = 31
	c0	mov $r0.4 = 1
;;
	c0	shl $r0.6 = $r0.3, $r0.2
	c0	shl $r0.2 = $r0.5, $r0.2
	c0	shru $r0.3 = $r0.3, $r0.4
	c0	shru $r0.5 = $r0.5, $r0.4
;;
	c0	mfb $r0.4 = $b0.0
	c0	or $r0.3 = $r0.3, $r0.2
;;
	c0	or $r0.2 = $r0.4, $r0.6
;;
LBB59_72:                               ## %roundAndPack
	c0	mov $r0.6 = $r0.3
	c0	mov $r0.4 = $r0.8
	c0	mov $r0.3 = $r0.7
	c0	mov $r0.7 = $r0.2
;;
.call roundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = roundAndPackFloat64
;;
	c0	mov $r0.2 = $r0.4
	c0	goto LBB59_73
;;
LBB59_46:                               ## %if.end.47
	c0	mov $r0.2 = 31
	c0	mov $r0.3 = 0
;;
	c0	shl $r0.2 = $r0.7, $r0.2
;;
	c0	or $r0.2 = $r0.2, 2146435072
	c0	goto LBB59_73
;;
LBB59_48:
	c0	mov $r0.8 = $r0.10
	c0	goto LBB59_68
;;
LBB59_33:
	c0	mov $r0.4 = 0
;;
	c0	mtb $b0.1 = $r0.4
	c0	goto LBB59_37
;;
LBB59_51:                               ## %if.else.5.i
	c0	cmpeq $b0.0 = $r0.8, 32
	c0	mov $r0.2 = 0
;;
;;
	c0	brf $b0.0, LBB59_53
;;
## BB#52:
	c0	mov $r0.5 = $r0.3
	c0	mov $r0.3 = $r0.2
	c0	goto LBB59_56
;;
LBB59_63:                               ## %lor.rhs.i.62.i
	c0	and $r0.4 = $r0.2, 524287
;;
	c0	cmpne $b0.2 = $r0.4, 0
;;
LBB59_64:                               ## %float64_is_signaling_nan.exit64.i
	c0	mov $r0.4 = 1
	c0	or $r0.7 = $r0.9, $r0.6
	c0	and $r0.8 = $r0.5, 2146959360
;;
	c0	shl $r0.4 = $r0.5, $r0.4
	c0	cmpne $b0.0 = $r0.7, 0
	c0	cmpne $b0.1 = $r0.8, 2146435072
;;
	c0	cmpgtu $b0.3 = $r0.4, -2097153
;;
	c0	mfb $r0.4 = $b0.0
;;
	c0	mfb $r0.7 = $b0.3
;;
	c0	and $r0.4 = $r0.7, $r0.4
;;
	c0	mtb $b0.0 = $r0.4
	c0	br $b0.1, LBB59_9
;;
LBB59_10:                               ## %land.rhs.i.i.283
	c0	cmpeq $b0.1 = $r0.6, 0
;;
;;
	c0	br $b0.1, LBB59_13
;;
## BB#11:                               ## %float64_is_signaling_nan.exit.thread.i.286
	c0	mov $r0.7 = -1
	c0	or $r0.2 = $r0.2, 524288
;;
	c0	or $r0.4 = $r0.5, 524288
	c0	mtb $b0.1 = $r0.7
	c0	goto LBB59_12
;;
LBB59_9:
	c0	mov $r0.4 = 0
;;
	c0	mtb $b0.1 = $r0.4
	c0	goto LBB59_14
;;
LBB59_13:                               ## %lor.rhs.i.i.289
	c0	and $r0.4 = $r0.5, 524287
;;
	c0	cmpne $b0.1 = $r0.4, 0
;;
LBB59_14:                               ## %float64_is_signaling_nan.exit.i.293
	c0	mfb $r0.7 = $b0.1
	c0	mfb $r0.8 = $b0.2
	c0	or $r0.4 = $r0.5, 524288
;;
	c0	or $r0.2 = $r0.2, 524288
	c0	or $r0.5 = $r0.8, $r0.7
;;
	c0	and $r0.5 = $r0.5, 1
;;
	c0	cmpeq $b0.2 = $r0.5, 0
;;
;;
	c0	br $b0.2, LBB59_15
;;
LBB59_12:                               ## %if.then.i.297
	c0	mov $r0.5 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.5]
	c0	mov $r0.8 = -1
;;
	c0	mtb $b0.2 = $r0.8
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.5] = $r0.7
	c0	goto LBB59_16
;;
LBB59_15:
	c0	mov $r0.5 = 0
;;
	c0	mtb $b0.2 = $r0.5
;;
;;
	c0	mfb $r0.11 = $b0.2
;;
	c0	mtb $b0.1 = $r0.11
;;
LBB59_16:                               ## %propagateFloat64NaN.exit311
	c0	slct $r0.5 = $b0.0, $r0.6, $r0.3
	c0	slct $r0.3 = $b0.1, $r0.6, $r0.3
	c0	slct $r0.6 = $b0.1, $r0.4, $r0.2
	c0	slct $r0.2 = $b0.0, $r0.4, $r0.2
;;
	c0	slct $r0.2 = $b0.2, $r0.6, $r0.2
	c0	slct $r0.3 = $b0.2, $r0.3, $r0.5
;;
LBB59_73:                               ## %cleanup
	c0	mov $r0.4 = $r0.2
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB59_53:                               ## %if.else.8.i
	c0	cmplt $b0.0 = $r0.11, -63
;;
;;
	c0	br $b0.0, LBB59_55
;;
## BB#54:                               ## %if.then.11.i
	c0	and $r0.8 = $r0.8, 31
	c0	shl $r0.5 = $r0.4, $r0.5
;;
	c0	shru $r0.4 = $r0.4, $r0.8
	c0	goto LBB59_56
;;
LBB59_36:                               ## %lor.rhs.i.62.i.187
	c0	and $r0.4 = $r0.2, 524287
;;
	c0	cmpne $b0.1 = $r0.4, 0
;;
LBB59_37:                               ## %float64_is_signaling_nan.exit64.i.190
	c0	and $r0.4 = $r0.5, 2146959360
	c0	mov $r0.7 = 1
;;
	c0	cmpne $b0.0 = $r0.4, 2146435072
	c0	shl $r0.4 = $r0.5, $r0.7
;;
;;
	c0	br $b0.0, LBB59_38
;;
## BB#39:                               ## %land.rhs.i.i.200
	c0	cmpeq $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB59_42
;;
## BB#40:                               ## %float64_is_signaling_nan.exit.thread.i.203
	c0	mov $r0.7 = -1
	c0	or $r0.2 = $r0.2, 524288
;;
	c0	or $r0.5 = $r0.5, 524288
	c0	mtb $b0.0 = $r0.7
	c0	goto LBB59_41
;;
LBB59_38:
	c0	mov $r0.7 = 0
;;
	c0	mtb $b0.0 = $r0.7
	c0	goto LBB59_43
;;
LBB59_42:                               ## %lor.rhs.i.i.206
	c0	and $r0.7 = $r0.5, 524287
;;
	c0	cmpne $b0.0 = $r0.7, 0
;;
LBB59_43:                               ## %float64_is_signaling_nan.exit.i.210
	c0	mfb $r0.7 = $b0.0
	c0	mfb $r0.8 = $b0.1
	c0	or $r0.5 = $r0.5, 524288
;;
	c0	or $r0.2 = $r0.2, 524288
	c0	or $r0.7 = $r0.8, $r0.7
;;
	c0	and $r0.7 = $r0.7, 1
;;
	c0	cmpeq $b0.1 = $r0.7, 0
;;
;;
	c0	br $b0.1, LBB59_44
;;
LBB59_41:                               ## %if.then.i.214
	c0	mov $r0.7 = float_exception_flags
;;
	c0	ldw $r0.8 = 0[$r0.7]
	c0	mov $r0.9 = -1
;;
	c0	mtb $b0.1 = $r0.9
;;
	c0	or $r0.8 = $r0.8, 16
;;
	c0	stw 0[$r0.7] = $r0.8
	c0	goto LBB59_45
;;
LBB59_44:
	c0	mov $r0.7 = 0
;;
	c0	mtb $b0.1 = $r0.7
;;
;;
	c0	mfb $r0.11 = $b0.1
;;
	c0	mtb $b0.0 = $r0.11
;;
LBB59_45:                               ## %propagateFloat64NaN.exit228
	c0	cmpgtu $b0.2 = $r0.4, -2097153
	c0	slct $r0.4 = $b0.0, $r0.6, $r0.3
	c0	slct $r0.7 = $b0.0, $r0.5, $r0.2
;;
;;
	c0	slct $r0.2 = $b0.2, $r0.5, $r0.2
	c0	slct $r0.3 = $b0.2, $r0.6, $r0.3
;;
	c0	slct $r0.2 = $b0.1, $r0.7, $r0.2
	c0	slct $r0.3 = $b0.1, $r0.4, $r0.3
	c0	goto LBB59_73
;;
LBB59_55:                               ## %if.else.15.i
	c0	cmpne $b0.0 = $r0.4, 0
	c0	cmpeq $b0.1 = $r0.8, 64
	c0	mov $r0.2 = 0
;;
;;
	c0	mfb $r0.5 = $b0.0
;;
	c0	slct $r0.5 = $b0.1, $r0.4, $r0.5
	c0	mov $r0.4 = $r0.2
;;
LBB59_56:                               ## %if.end.19.i
	c0	cmpne $b0.0 = $r0.3, 0
	c0	mov $r0.3 = $r0.4
	c0	mov $r0.8 = $r0.10
	c0	mov $r0.4 = $r0.2
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	or $r0.2 = $r0.2, $r0.5
	c0	goto LBB59_68
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @subFloat64Sigs
subFloat64Sigs::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $l0.0
	c0	mov $r0.8 = 20
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.9 = 10
;;
	c0	shru $r0.3 = $r0.5, $r0.8
	c0	shru $r0.8 = $r0.2, $r0.8
	c0	and $r0.13 = $r0.5, 1048575
;;
	c0	shl $r0.10 = $r0.2, $r0.9
	c0	and $r0.12 = $r0.3, 2047
;;
	c0	and $r0.11 = $r0.8, 2047
	c0	mov $r0.8 = 22
;;
	c0	sub $r0.14 = $r0.11, $r0.12
	c0	mov $r0.3 = $r0.4
;;
	c0	cmpgt $b0.0 = $r0.14, 0
	c0	shru $r0.4 = $r0.6, $r0.8
	c0	shru $r0.15 = $r0.3, $r0.8
	c0	shl $r0.16 = $r0.13, $r0.9
;;
	c0	and $r0.10 = $r0.10, 1073740800
	c0	shl $r0.8 = $r0.3, $r0.9
	c0	shl $r0.9 = $r0.6, $r0.9
;;
	c0	or $r0.4 = $r0.4, $r0.16
	c0	or $r0.10 = $r0.15, $r0.10
	c0	brf $b0.0, LBB60_1
;;
## BB#47:                               ## %aExpBigger
	c0	cmpne $b0.0 = $r0.11, 2047
;;
;;
	c0	br $b0.0, LBB60_49
;;
## BB#48:                               ## %if.then.79
	c0	or $r0.4 = $r0.10, $r0.8
;;
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	brf $b0.0, LBB60_28
;;
	c0	goto LBB60_63
;;
LBB60_1:                                ## %if.end
	c0	cmplt $b0.0 = $r0.14, 0
;;
;;
	c0	br $b0.0, LBB60_26
;;
## BB#2:                                ## %if.end.23
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	brf $b0.0, LBB60_3
;;
## BB#20:                               ## %if.then.39
	c0	mov $r0.11 = 1
;;
	c0	mov $r0.12 = $r0.11
	c0	goto LBB60_21
;;
LBB60_49:                               ## %if.end.89
	c0	cmpeq $b0.0 = $r0.12, 0
;;
;;
	c0	br $b0.0, LBB60_51
;;
## BB#50:                               ## %if.end.95.thread
	c0	mov $r0.3 = 0
	c0	or $r0.4 = $r0.4, 1073741824
	c0	mov $r0.2 = $r0.14
;;
	c0	goto LBB60_53
;;
LBB60_26:                               ## %bExpBigger
	c0	cmpne $b0.0 = $r0.12, 2047
;;
;;
	c0	br $b0.0, LBB60_35
;;
## BB#27:                               ## %if.then.57
	c0	or $r0.4 = $r0.4, $r0.9
;;
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB60_34
;;
LBB60_28:                               ## %if.then.60
	c0	and $r0.4 = $r0.2, 2146959360
;;
	c0	cmpne $b0.0 = $r0.4, 2146435072
;;
;;
	c0	br $b0.0, LBB60_29
;;
## BB#30:                               ## %land.rhs.i.59.i.219
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	brf $b0.0, LBB60_32
;;
## BB#31:
	c0	mov $r0.4 = -1
;;
	c0	mtb $b0.2 = $r0.4
	c0	goto LBB60_33
;;
LBB60_29:
	c0	mov $r0.4 = 0
;;
	c0	mtb $b0.2 = $r0.4
	c0	goto LBB60_33
;;
LBB60_3:                                ## %if.end.23
	c0	cmpne $b0.0 = $r0.11, 2047
;;
;;
	c0	br $b0.0, LBB60_21
;;
## BB#4:                                ## %if.then.25
	c0	or $r0.7 = $r0.10, $r0.8
;;
	c0	or $r0.7 = $r0.7, $r0.9
;;
	c0	or $r0.4 = $r0.7, $r0.4
;;
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB60_19
;;
## BB#5:                                ## %if.then.28
	c0	and $r0.4 = $r0.2, 2146959360
;;
	c0	cmpne $b0.0 = $r0.4, 2146435072
;;
;;
	c0	br $b0.0, LBB60_6
;;
## BB#7:                                ## %land.rhs.i.59.i.270
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	brf $b0.0, LBB60_9
;;
## BB#8:
	c0	mov $r0.4 = -1
;;
	c0	mtb $b0.2 = $r0.4
	c0	goto LBB60_10
;;
LBB60_21:                               ## %if.end.40
	c0	cmpltu $b0.0 = $r0.4, $r0.10
;;
;;
	c0	br $b0.0, LBB60_61
;;
## BB#22:                               ## %if.end.43
	c0	cmpltu $b0.0 = $r0.10, $r0.4
;;
;;
	c0	br $b0.0, LBB60_46
;;
## BB#23:                               ## %if.end.46
	c0	cmpltu $b0.0 = $r0.9, $r0.8
;;
;;
	c0	br $b0.0, LBB60_61
;;
## BB#24:                               ## %if.end.49
	c0	cmpltu $b0.0 = $r0.8, $r0.9
;;
;;
	c0	br $b0.0, LBB60_46
;;
## BB#25:                               ## %if.end.52
	c0	mov $r0.2 = float_rounding_mode
;;
	c0	ldw $r0.2 = 0[$r0.2]
	c0	mov $r0.4 = 31
	c0	mov $r0.3 = 0
;;
;;
	c0	cmpeq $b0.0 = $r0.2, 3
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	shl $r0.2 = $r0.2, $r0.4
	c0	goto LBB60_63
;;
LBB60_51:                               ## %if.end.95
	c0	add $r0.2 = $r0.14, -1
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB60_60
;;
## BB#52:
	c0	mov $r0.3 = 1
;;
LBB60_53:                               ## %if.else.i
	c0	sub $r0.3 = $r0.3, $r0.14
	c0	cmpgt $b0.0 = $r0.2, 31
;;
	c0	and $r0.3 = $r0.3, 31
;;
	c0	br $b0.0, LBB60_55
;;
## BB#54:                               ## %if.then.2.i
	c0	shl $r0.5 = $r0.9, $r0.3
	c0	shl $r0.3 = $r0.4, $r0.3
	c0	shru $r0.6 = $r0.9, $r0.2
	c0	shru $r0.4 = $r0.4, $r0.2
;;
	c0	cmpne $b0.0 = $r0.5, 0
	c0	or $r0.2 = $r0.3, $r0.6
;;
;;
	c0	mfb $r0.3 = $b0.0
;;
	c0	or $r0.9 = $r0.2, $r0.3
	c0	goto LBB60_60
;;
LBB60_55:                               ## %if.else.7.i
	c0	cmpne $b0.0 = $r0.2, 32
;;
;;
	c0	br $b0.0, LBB60_57
;;
## BB#56:                               ## %if.then.10.i
	c0	cmpne $b0.0 = $r0.9, 0
	c0	mov $r0.2 = 0
;;
;;
	c0	mfb $r0.3 = $b0.0
;;
	c0	or $r0.9 = $r0.4, $r0.3
	c0	mov $r0.4 = $r0.2
	c0	goto LBB60_60
;;
LBB60_35:                               ## %if.end.68
	c0	cmpeq $b0.0 = $r0.11, 0
	c0	or $r0.2 = $r0.10, 1073741824
;;
;;
	c0	mfb $r0.3 = $b0.0
	c0	slct $r0.2 = $b0.0, $r0.10, $r0.2
;;
	c0	add $r0.6 = $r0.14, $r0.3
;;
	c0	cmpeq $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB60_36
;;
## BB#37:                               ## %if.else.i.181
	c0	mov $r0.10 = 0
	c0	cmplt $b0.0 = $r0.6, -31
	c0	and $r0.5 = $r0.6, 31
;;
	c0	sub $r0.3 = $r0.10, $r0.6
;;
	c0	br $b0.0, LBB60_39
;;
## BB#38:                               ## %if.then.2.i.190
	c0	shl $r0.6 = $r0.8, $r0.5
	c0	shl $r0.5 = $r0.2, $r0.5
	c0	shru $r0.8 = $r0.8, $r0.3
	c0	shru $r0.10 = $r0.2, $r0.3
;;
	c0	cmpne $b0.0 = $r0.6, 0
	c0	or $r0.2 = $r0.5, $r0.8
	c0	goto LBB60_41
;;
LBB60_57:                               ## %if.else.14.i
	c0	cmpgt $b0.0 = $r0.2, 63
;;
;;
	c0	br $b0.0, LBB60_59
;;
## BB#58:                               ## %if.then.17.i
	c0	shl $r0.3 = $r0.4, $r0.3
	c0	and $r0.2 = $r0.2, 31
	c0	mov $r0.5 = 0
;;
	c0	shru $r0.2 = $r0.4, $r0.2
	c0	or $r0.3 = $r0.3, $r0.9
	c0	mov $r0.4 = $r0.5
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	mfb $r0.3 = $b0.0
;;
	c0	or $r0.9 = $r0.3, $r0.2
	c0	goto LBB60_60
;;
LBB60_32:                               ## %lor.rhs.i.62.i.222
	c0	and $r0.4 = $r0.2, 524287
;;
	c0	cmpne $b0.2 = $r0.4, 0
;;
LBB60_33:                               ## %float64_is_signaling_nan.exit64.i.225
	c0	mov $r0.4 = 1
	c0	or $r0.7 = $r0.13, $r0.6
	c0	and $r0.8 = $r0.5, 2146959360
;;
	c0	shl $r0.4 = $r0.5, $r0.4
	c0	cmpne $b0.0 = $r0.7, 0
	c0	cmpne $b0.1 = $r0.8, 2146435072
;;
	c0	cmpgtu $b0.3 = $r0.4, -2097153
;;
	c0	mfb $r0.4 = $b0.0
;;
	c0	mfb $r0.7 = $b0.3
;;
	c0	and $r0.4 = $r0.7, $r0.4
;;
	c0	mtb $b0.0 = $r0.4
	c0	br $b0.1, LBB60_11
;;
	c0	goto LBB60_12
;;
LBB60_59:                               ## %if.else.25.i
	c0	or $r0.2 = $r0.4, $r0.9
	c0	mov $r0.4 = 0
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	mfb $r0.9 = $b0.0
;;
LBB60_60:                               ## %shift64RightJamming.exit
	c0	or $r0.10 = $r0.10, 1073741824
;;
LBB60_61:                               ## %aBigger
	c0	cmpltu $r0.2 = $r0.8, $r0.9
	c0	mov $r0.3 = -1
	c0	sub $r0.4 = $r0.10, $r0.4
	c0	sub $r0.6 = $r0.8, $r0.9
;;
	c0	mov $r0.12 = $r0.11
	c0	goto LBB60_62
;;
LBB60_34:                               ## %if.end.66
	c0	mov $r0.2 = 31
	c0	mov $r0.3 = 0
;;
	c0	shl $r0.2 = $r0.7, $r0.2
;;
	c0	add $r0.2 = $r0.2, -1048576
	c0	goto LBB60_63
;;
LBB60_36:
	c0	mov $r0.10 = $r0.2
	c0	goto LBB60_45
;;
LBB60_19:                               ## %if.end.34
	c0	mov $r0.4 = float_exception_flags
;;
	c0	ldw $r0.5 = 0[$r0.4]
	c0	mov $r0.3 = -1
	c0	mov $r0.2 = 2147483647
;;
;;
	c0	or $r0.5 = $r0.5, 16
;;
	c0	stw 0[$r0.4] = $r0.5
	c0	goto LBB60_63
;;
LBB60_39:                               ## %if.else.7.i.192
	c0	cmpne $b0.0 = $r0.3, 32
;;
;;
	c0	br $b0.0, LBB60_42
;;
## BB#40:                               ## %if.then.10.i.196
	c0	cmpne $b0.0 = $r0.8, 0
;;
LBB60_41:                               ## %shift64RightJamming.exit213
	c0	mfb $r0.3 = $b0.0
;;
	c0	or $r0.8 = $r0.2, $r0.3
;;
LBB60_45:                               ## %shift64RightJamming.exit213
	c0	or $r0.4 = $r0.4, 1073741824
;;
LBB60_46:                               ## %bBigger
	c0	cmpltu $r0.2 = $r0.9, $r0.8
	c0	mov $r0.3 = -1
	c0	sub $r0.4 = $r0.4, $r0.10
	c0	xor $r0.7 = $r0.7, 1
;;
	c0	sub $r0.6 = $r0.9, $r0.8
;;
LBB60_62:                               ## %normalizeRoundAndPack
	c0	mtb $b0.0 = $r0.2
;;
;;
	c0	slct $r0.2 = $b0.0, $r0.3, 0
;;
	c0	add $r0.5 = $r0.4, $r0.2
	c0	add $r0.4 = $r0.12, -11
	c0	mov $r0.3 = $r0.7
;;
.call normalizeRoundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = normalizeRoundAndPackFloat64
;;
	c0	mov $r0.2 = $r0.4
	c0	goto LBB60_63
;;
LBB60_6:
	c0	mov $r0.4 = 0
;;
	c0	mtb $b0.2 = $r0.4
	c0	goto LBB60_10
;;
LBB60_42:                               ## %if.else.14.i.198
	c0	cmplt $b0.0 = $r0.6, -63
;;
;;
	c0	br $b0.0, LBB60_44
;;
## BB#43:                               ## %if.then.17.i.206
	c0	shl $r0.5 = $r0.2, $r0.5
	c0	and $r0.3 = $r0.3, 31
;;
	c0	or $r0.5 = $r0.5, $r0.8
	c0	shru $r0.2 = $r0.2, $r0.3
;;
	c0	cmpne $b0.0 = $r0.5, 0
;;
;;
	c0	mfb $r0.3 = $b0.0
;;
	c0	or $r0.8 = $r0.3, $r0.2
	c0	goto LBB60_45
;;
LBB60_9:                                ## %lor.rhs.i.62.i.273
	c0	and $r0.4 = $r0.2, 524287
;;
	c0	cmpne $b0.2 = $r0.4, 0
;;
LBB60_10:                               ## %float64_is_signaling_nan.exit64.i.276
	c0	mov $r0.4 = 1
	c0	or $r0.7 = $r0.13, $r0.6
;;
	c0	shl $r0.4 = $r0.5, $r0.4
	c0	cmpne $b0.0 = $r0.7, 0
;;
	c0	cmpgtu $b0.1 = $r0.4, -2097153
	c0	and $r0.4 = $r0.5, 2146959360
;;
	c0	cmpne $b0.3 = $r0.4, 2146435072
	c0	mfb $r0.4 = $b0.0
;;
	c0	mfb $r0.7 = $b0.1
;;
	c0	and $r0.4 = $r0.7, $r0.4
;;
	c0	mtb $b0.0 = $r0.4
	c0	br $b0.3, LBB60_11
;;
LBB60_12:                               ## %land.rhs.i.i.286
	c0	cmpeq $b0.1 = $r0.6, 0
;;
;;
	c0	br $b0.1, LBB60_15
;;
## BB#13:                               ## %float64_is_signaling_nan.exit.thread.i.289
	c0	mov $r0.7 = -1
	c0	or $r0.2 = $r0.2, 524288
;;
	c0	or $r0.4 = $r0.5, 524288
	c0	mtb $b0.1 = $r0.7
	c0	goto LBB60_14
;;
LBB60_11:
	c0	mov $r0.4 = 0
;;
	c0	mtb $b0.1 = $r0.4
	c0	goto LBB60_16
;;
LBB60_15:                               ## %lor.rhs.i.i.292
	c0	and $r0.4 = $r0.5, 524287
;;
	c0	cmpne $b0.1 = $r0.4, 0
;;
LBB60_16:                               ## %float64_is_signaling_nan.exit.i.296
	c0	mfb $r0.7 = $b0.1
	c0	mfb $r0.8 = $b0.2
	c0	or $r0.4 = $r0.5, 524288
;;
	c0	or $r0.2 = $r0.2, 524288
	c0	or $r0.5 = $r0.8, $r0.7
;;
	c0	and $r0.5 = $r0.5, 1
;;
	c0	cmpeq $b0.2 = $r0.5, 0
;;
;;
	c0	br $b0.2, LBB60_17
;;
LBB60_14:                               ## %if.then.i.300
	c0	mov $r0.5 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.5]
	c0	mov $r0.8 = -1
;;
	c0	mtb $b0.2 = $r0.8
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.5] = $r0.7
	c0	goto LBB60_18
;;
LBB60_17:
	c0	mov $r0.5 = 0
;;
	c0	mtb $b0.2 = $r0.5
;;
;;
	c0	mfb $r0.11 = $b0.2
;;
	c0	mtb $b0.1 = $r0.11
;;
LBB60_18:                               ## %propagateFloat64NaN.exit314
	c0	slct $r0.5 = $b0.0, $r0.6, $r0.3
	c0	slct $r0.3 = $b0.1, $r0.6, $r0.3
	c0	slct $r0.6 = $b0.1, $r0.4, $r0.2
	c0	slct $r0.2 = $b0.0, $r0.4, $r0.2
;;
	c0	slct $r0.2 = $b0.2, $r0.6, $r0.2
	c0	slct $r0.3 = $b0.2, $r0.3, $r0.5
;;
LBB60_63:                               ## %cleanup
	c0	mov $r0.4 = $r0.2
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB60_44:                               ## %if.else.25.i.210
	c0	or $r0.2 = $r0.2, $r0.8
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	mfb $r0.8 = $b0.0
	c0	goto LBB60_45
;;
.endp

#.globl float64_sub
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_sub
float64_sub::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $l0.0
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.8 = $r0.5, $r0.2
	c0	shru $r0.7 = $r0.3, $r0.2
;;
	c0	cmpne $b0.0 = $r0.7, $r0.8
;;
;;
	c0	br $b0.0, LBB61_2
;;
## BB#1:                                ## %if.then
.call subFloat64Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = subFloat64Sigs
;;
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB61_2:                                ## %if.else
.call addFloat64Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = addFloat64Sigs
;;
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

#.globl float64_mul
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_mul
float64_mul::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $l0.0
	c0	mov $r0.10 = 20
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.8 = 31
;;
	c0	shru $r0.3 = $r0.2, $r0.10
	c0	xor $r0.7 = $r0.5, $r0.2
	c0	shru $r0.13 = $r0.5, $r0.10
;;
	c0	and $r0.9 = $r0.3, 2047
;;
	c0	cmpne $b0.0 = $r0.9, 2047
	c0	and $r0.11 = $r0.5, 1048575
;;
	c0	and $r0.12 = $r0.2, 1048575
	c0	shru $r0.3 = $r0.7, $r0.8
;;
	c0	and $r0.7 = $r0.13, 2047
;;
	c0	br $b0.0, LBB62_20
;;
## BB#1:                                ## %if.then
	c0	or $r0.9 = $r0.12, $r0.4
;;
	c0	cmpne $b0.0 = $r0.9, 0
;;
;;
	c0	br $b0.0, LBB62_4
;;
## BB#2:                                ## %lor.lhs.false
	c0	cmpne $b0.0 = $r0.7, 2047
	c0	or $r0.9 = $r0.11, $r0.6
;;
;;
	c0	br $b0.0, LBB62_18
;;
## BB#3:                                ## %lor.lhs.false
	c0	cmpeq $b0.0 = $r0.9, 0
;;
;;
	c0	br $b0.0, LBB62_18
;;
LBB62_4:                                ## %if.then.30
	c0	and $r0.3 = $r0.2, 2146959360
;;
	c0	cmpne $b0.0 = $r0.3, 2146435072
;;
;;
	c0	br $b0.0, LBB62_5
;;
## BB#6:                                ## %land.rhs.i.59.i.236
	c0	cmpne $b0.0 = $r0.4, 0
;;
;;
	c0	brf $b0.0, LBB62_8
;;
## BB#7:
	c0	mov $r0.3 = -1
;;
	c0	mtb $b0.2 = $r0.3
	c0	goto LBB62_9
;;
LBB62_20:                               ## %if.end.42
	c0	cmpne $b0.0 = $r0.7, 2047
;;
;;
	c0	br $b0.0, LBB62_38
;;
## BB#21:                               ## %if.then.44
	c0	or $r0.7 = $r0.11, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB62_36
;;
## BB#22:                               ## %if.then.47
	c0	and $r0.3 = $r0.2, 2146959360
;;
	c0	cmpne $b0.0 = $r0.3, 2146435072
;;
;;
	c0	br $b0.0, LBB62_23
;;
## BB#24:                               ## %land.rhs.i.59.i
	c0	cmpne $b0.0 = $r0.4, 0
;;
;;
	c0	brf $b0.0, LBB62_26
;;
## BB#25:
	c0	mov $r0.3 = -1
;;
	c0	mtb $b0.1 = $r0.3
	c0	goto LBB62_27
;;
LBB62_38:                               ## %if.end.62
	c0	cmpne $b0.0 = $r0.9, 0
;;
;;
	c0	br $b0.0, LBB62_49
;;
## BB#39:                               ## %if.then.64
	c0	or $r0.9 = $r0.12, $r0.4
;;
	c0	cmpne $b0.0 = $r0.9, 0
;;
;;
	c0	brf $b0.0, LBB62_40
;;
## BB#41:                               ## %if.end.69
	c0	cmpne $b0.0 = $r0.12, 0
;;
;;
	c0	brf $b0.0, LBB62_42
;;
## BB#46:                               ## %if.else.7.i.204
	c0	cmpltu $b0.0 = $r0.12, 65536
	c0	mov $r0.9 = 16
	c0	mov $r0.13 = 8
;;
	c0	mov $r0.14 = 22
	c0	shl $r0.2 = $r0.2, $r0.9
	c0	mov $r0.9 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	mov $r0.15 = 4
	c0	mfb $r0.16 = $b0.0
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.12
;;
	c0	shl $r0.15 = $r0.16, $r0.15
	c0	cmpltu $b0.0 = $r0.2, 16777216
	c0	shl $r0.13 = $r0.2, $r0.13
;;
	c0	or $r0.16 = $r0.15, 8
;;
	c0	slct $r0.2 = $b0.0, $r0.13, $r0.2
	c0	slct $r0.13 = $b0.0, $r0.16, $r0.15
;;
	c0	shru $r0.2 = $r0.2, $r0.14
;;
	c0	and $r0.2 = $r0.2, 1020
;;
	c0	add $r0.2 = $r0.9, $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
;;
	c0	add $r0.2 = $r0.2, $r0.13
;;
	c0	add $r0.9 = $r0.2, -11
;;
	c0	cmpeq $b0.0 = $r0.9, 0
;;
;;
	c0	br $b0.0, LBB62_48
;;
## BB#47:                               ## %cond.false.i.i.210
	c0	mov $r0.13 = 11
	c0	shl $r0.12 = $r0.12, $r0.9
;;
	c0	sub $r0.13 = $r0.13, $r0.2
;;
	c0	and $r0.13 = $r0.13, 31
;;
	c0	shru $r0.13 = $r0.4, $r0.13
;;
	c0	or $r0.12 = $r0.13, $r0.12
;;
LBB62_48:                               ## %shortShift64Left.exit.i.213
	c0	mov $r0.13 = 12
	c0	shl $r0.4 = $r0.4, $r0.9
;;
	c0	sub $r0.9 = $r0.13, $r0.2
	c0	goto LBB62_49
;;
LBB62_5:
	c0	mov $r0.3 = 0
;;
	c0	mtb $b0.2 = $r0.3
	c0	goto LBB62_9
;;
LBB62_18:                               ## %if.end
	c0	or $r0.2 = $r0.9, $r0.7
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB62_19
;;
	c0	goto LBB62_37
;;
LBB62_36:                               ## %if.end.53
	c0	or $r0.2 = $r0.12, $r0.4
;;
	c0	or $r0.2 = $r0.2, $r0.9
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB62_37
;;
LBB62_19:                               ## %if.end.40
	c0	shl $r0.3 = $r0.3, $r0.8
	c0	mov $r0.2 = 0
;;
	c0	or $r0.4 = $r0.3, 2146435072
	c0	goto LBB62_63
;;
LBB62_23:
	c0	mov $r0.3 = 0
;;
	c0	mtb $b0.1 = $r0.3
	c0	goto LBB62_27
;;
LBB62_8:                                ## %lor.rhs.i.62.i.239
	c0	and $r0.3 = $r0.2, 524287
;;
	c0	cmpne $b0.2 = $r0.3, 0
;;
LBB62_9:                                ## %float64_is_signaling_nan.exit64.i.242
	c0	mov $r0.3 = 1
	c0	or $r0.7 = $r0.11, $r0.6
;;
	c0	shl $r0.3 = $r0.5, $r0.3
	c0	cmpne $b0.0 = $r0.7, 0
;;
	c0	cmpgtu $b0.1 = $r0.3, -2097153
;;
	c0	mfb $r0.3 = $b0.0
;;
	c0	mfb $r0.7 = $b0.1
	c0	and $r0.8 = $r0.5, 2146959360
;;
	c0	cmpne $b0.1 = $r0.8, 2146435072
	c0	and $r0.3 = $r0.7, $r0.3
;;
	c0	mtb $b0.0 = $r0.3
;;
	c0	br $b0.1, LBB62_10
;;
## BB#11:                               ## %land.rhs.i.i.252
	c0	cmpeq $b0.1 = $r0.6, 0
;;
;;
	c0	br $b0.1, LBB62_14
;;
## BB#12:                               ## %float64_is_signaling_nan.exit.thread.i.255
	c0	mov $r0.7 = -1
	c0	or $r0.2 = $r0.2, 524288
;;
	c0	or $r0.3 = $r0.5, 524288
	c0	mtb $b0.1 = $r0.7
	c0	goto LBB62_13
;;
LBB62_10:
	c0	mov $r0.3 = 0
;;
	c0	mtb $b0.1 = $r0.3
	c0	goto LBB62_15
;;
LBB62_14:                               ## %lor.rhs.i.i.258
	c0	and $r0.3 = $r0.5, 524287
;;
	c0	cmpne $b0.1 = $r0.3, 0
;;
LBB62_15:                               ## %float64_is_signaling_nan.exit.i.262
	c0	mfb $r0.7 = $b0.1
	c0	mfb $r0.8 = $b0.2
	c0	or $r0.3 = $r0.5, 524288
;;
	c0	or $r0.2 = $r0.2, 524288
	c0	or $r0.5 = $r0.8, $r0.7
;;
	c0	and $r0.5 = $r0.5, 1
;;
	c0	cmpeq $b0.2 = $r0.5, 0
;;
;;
	c0	br $b0.2, LBB62_16
;;
LBB62_13:                               ## %if.then.i.266
	c0	mov $r0.5 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.5]
	c0	mov $r0.8 = -1
;;
	c0	mtb $b0.2 = $r0.8
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.5] = $r0.7
	c0	goto LBB62_17
;;
LBB62_16:
	c0	mov $r0.5 = 0
;;
	c0	mtb $b0.2 = $r0.5
;;
;;
	c0	mfb $r0.11 = $b0.2
;;
	c0	mtb $b0.1 = $r0.11
;;
LBB62_17:                               ## %propagateFloat64NaN.exit281
	c0	slct $r0.5 = $b0.0, $r0.6, $r0.4
	c0	slct $r0.4 = $b0.1, $r0.6, $r0.4
	c0	slct $r0.6 = $b0.1, $r0.3, $r0.2
	c0	slct $r0.3 = $b0.0, $r0.3, $r0.2
;;
	c0	slct $r0.2 = $b0.2, $r0.4, $r0.5
	c0	slct $r0.4 = $b0.2, $r0.6, $r0.3
	c0	goto LBB62_63
;;
LBB62_37:                               ## %invalid
	c0	mov $r0.3 = float_exception_flags
;;
	c0	ldw $r0.5 = 0[$r0.3]
	c0	mov $r0.2 = -1
	c0	mov $r0.4 = 2147483647
;;
;;
	c0	or $r0.5 = $r0.5, 16
;;
	c0	stw 0[$r0.3] = $r0.5
	c0	goto LBB62_63
;;
LBB62_26:                               ## %lor.rhs.i.62.i
	c0	and $r0.3 = $r0.2, 524287
;;
	c0	cmpne $b0.1 = $r0.3, 0
;;
LBB62_27:                               ## %float64_is_signaling_nan.exit64.i
	c0	and $r0.3 = $r0.5, 2146959360
	c0	mov $r0.7 = 1
;;
	c0	cmpne $b0.0 = $r0.3, 2146435072
	c0	shl $r0.3 = $r0.5, $r0.7
;;
;;
	c0	br $b0.0, LBB62_28
;;
## BB#29:                               ## %land.rhs.i.i
	c0	cmpeq $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB62_32
;;
## BB#30:                               ## %float64_is_signaling_nan.exit.thread.i
	c0	mov $r0.7 = -1
	c0	or $r0.2 = $r0.2, 524288
;;
	c0	or $r0.5 = $r0.5, 524288
	c0	mtb $b0.0 = $r0.7
	c0	goto LBB62_31
;;
LBB62_28:
	c0	mov $r0.7 = 0
;;
	c0	mtb $b0.0 = $r0.7
	c0	goto LBB62_33
;;
LBB62_32:                               ## %lor.rhs.i.i
	c0	and $r0.7 = $r0.5, 524287
;;
	c0	cmpne $b0.0 = $r0.7, 0
;;
LBB62_33:                               ## %float64_is_signaling_nan.exit.i
	c0	mfb $r0.7 = $b0.0
	c0	mfb $r0.8 = $b0.1
	c0	or $r0.5 = $r0.5, 524288
;;
	c0	or $r0.2 = $r0.2, 524288
	c0	or $r0.7 = $r0.8, $r0.7
;;
	c0	and $r0.7 = $r0.7, 1
;;
	c0	cmpeq $b0.1 = $r0.7, 0
;;
;;
	c0	br $b0.1, LBB62_34
;;
LBB62_31:                               ## %if.then.i.227
	c0	mov $r0.7 = float_exception_flags
;;
	c0	ldw $r0.8 = 0[$r0.7]
	c0	mov $r0.9 = -1
;;
	c0	mtb $b0.1 = $r0.9
;;
	c0	or $r0.8 = $r0.8, 16
;;
	c0	stw 0[$r0.7] = $r0.8
	c0	goto LBB62_35
;;
LBB62_34:
	c0	mov $r0.7 = 0
;;
	c0	mtb $b0.1 = $r0.7
;;
;;
	c0	mfb $r0.11 = $b0.1
;;
	c0	mtb $b0.0 = $r0.11
;;
LBB62_35:                               ## %propagateFloat64NaN.exit
	c0	cmpgtu $b0.2 = $r0.3, -2097153
	c0	slct $r0.3 = $b0.0, $r0.5, $r0.2
	c0	slct $r0.7 = $b0.0, $r0.6, $r0.4
;;
;;
	c0	slct $r0.4 = $b0.2, $r0.6, $r0.4
	c0	slct $r0.5 = $b0.2, $r0.5, $r0.2
;;
	c0	slct $r0.2 = $b0.1, $r0.7, $r0.4
	c0	slct $r0.4 = $b0.1, $r0.3, $r0.5
	c0	goto LBB62_63
;;
LBB62_42:                               ## %if.then.i.178
	c0	mov $r0.2 = 16
	c0	cmpltu $b0.0 = $r0.4, 65536
	c0	mov $r0.9 = 8
;;
	c0	mov $r0.12 = 22
	c0	shl $r0.2 = $r0.4, $r0.2
	c0	mov $r0.13 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	mov $r0.14 = 4
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.4
;;
	c0	cmpltu $b0.1 = $r0.2, 16777216
	c0	shl $r0.9 = $r0.2, $r0.9
;;
;;
	c0	slct $r0.2 = $b0.1, $r0.9, $r0.2
;;
	c0	shru $r0.2 = $r0.2, $r0.12
	c0	mfb $r0.9 = $b0.0
;;
	c0	and $r0.2 = $r0.2, 1020
	c0	shl $r0.9 = $r0.9, $r0.14
;;
	c0	add $r0.2 = $r0.13, $r0.2
	c0	or $r0.12 = $r0.9, 8
;;
	c0	ldw $r0.2 = 0[$r0.2]
	c0	slct $r0.9 = $b0.1, $r0.12, $r0.9
;;
;;
	c0	add $r0.2 = $r0.2, $r0.9
;;
	c0	cmpgt $b0.0 = $r0.2, 10
	c0	add $r0.9 = $r0.2, -11
;;
;;
	c0	br $b0.0, LBB62_44
;;
## BB#43:                               ## %if.then.2.i.183
	c0	mov $r0.12 = 11
	c0	and $r0.9 = $r0.9, 31
;;
	c0	sub $r0.12 = $r0.12, $r0.2
;;
	c0	shru $r0.12 = $r0.4, $r0.12
	c0	shl $r0.4 = $r0.4, $r0.9
	c0	goto LBB62_45
;;
LBB62_44:                               ## %if.else.i.185
	c0	mov $r0.13 = 0
	c0	shl $r0.12 = $r0.4, $r0.9
;;
	c0	mov $r0.4 = $r0.13
;;
LBB62_45:                               ## %if.end.i.188
	c0	mov $r0.9 = -20
;;
	c0	sub $r0.9 = $r0.9, $r0.2
;;
LBB62_49:                               ## %if.end.70
	c0	cmpne $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB62_59
;;
## BB#50:                               ## %if.then.72
	c0	or $r0.2 = $r0.11, $r0.6
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB62_40
;;
## BB#51:                               ## %if.end.77
	c0	cmpne $b0.0 = $r0.11, 0
;;
;;
	c0	brf $b0.0, LBB62_52
;;
## BB#56:                               ## %if.else.7.i
	c0	cmpltu $b0.0 = $r0.11, 65536
	c0	mov $r0.2 = 16
	c0	mov $r0.7 = 8
;;
	c0	mov $r0.13 = 22
	c0	shl $r0.2 = $r0.5, $r0.2
	c0	mov $r0.5 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	mov $r0.14 = 4
	c0	mfb $r0.15 = $b0.0
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.11
;;
	c0	shl $r0.14 = $r0.15, $r0.14
	c0	cmpltu $b0.0 = $r0.2, 16777216
	c0	shl $r0.7 = $r0.2, $r0.7
;;
	c0	or $r0.15 = $r0.14, 8
;;
	c0	slct $r0.2 = $b0.0, $r0.7, $r0.2
	c0	slct $r0.7 = $b0.0, $r0.15, $r0.14
;;
	c0	shru $r0.2 = $r0.2, $r0.13
;;
	c0	and $r0.2 = $r0.2, 1020
;;
	c0	add $r0.2 = $r0.5, $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
;;
	c0	add $r0.2 = $r0.2, $r0.7
;;
	c0	add $r0.5 = $r0.2, -11
;;
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB62_58
;;
## BB#57:                               ## %cond.false.i.i
	c0	mov $r0.7 = 11
	c0	shl $r0.11 = $r0.11, $r0.5
;;
	c0	sub $r0.7 = $r0.7, $r0.2
;;
	c0	and $r0.7 = $r0.7, 31
;;
	c0	shru $r0.7 = $r0.6, $r0.7
;;
	c0	or $r0.11 = $r0.7, $r0.11
;;
LBB62_58:                               ## %shortShift64Left.exit.i
	c0	mov $r0.7 = 12
	c0	shl $r0.6 = $r0.6, $r0.5
;;
	c0	sub $r0.7 = $r0.7, $r0.2
	c0	goto LBB62_59
;;
LBB62_40:                               ## %if.then.67
	c0	mov $r0.2 = 0
	c0	shl $r0.4 = $r0.3, $r0.8
	c0	goto LBB62_63
;;
LBB62_52:                               ## %if.then.i
	c0	mov $r0.2 = 16
	c0	cmpltu $b0.0 = $r0.6, 65536
	c0	mov $r0.5 = 8
;;
	c0	mov $r0.7 = 22
	c0	shl $r0.2 = $r0.6, $r0.2
	c0	mov $r0.11 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	mov $r0.13 = 4
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.6
;;
	c0	cmpltu $b0.1 = $r0.2, 16777216
	c0	shl $r0.5 = $r0.2, $r0.5
;;
;;
	c0	slct $r0.2 = $b0.1, $r0.5, $r0.2
;;
	c0	shru $r0.2 = $r0.2, $r0.7
	c0	mfb $r0.5 = $b0.0
;;
	c0	and $r0.2 = $r0.2, 1020
	c0	shl $r0.5 = $r0.5, $r0.13
;;
	c0	add $r0.2 = $r0.11, $r0.2
	c0	or $r0.7 = $r0.5, 8
;;
	c0	ldw $r0.2 = 0[$r0.2]
	c0	slct $r0.5 = $b0.1, $r0.7, $r0.5
;;
;;
	c0	add $r0.2 = $r0.2, $r0.5
;;
	c0	cmpgt $b0.0 = $r0.2, 10
	c0	add $r0.5 = $r0.2, -11
;;
;;
	c0	br $b0.0, LBB62_54
;;
## BB#53:                               ## %if.then.2.i
	c0	mov $r0.7 = 11
	c0	and $r0.5 = $r0.5, 31
;;
	c0	sub $r0.7 = $r0.7, $r0.2
;;
	c0	shru $r0.11 = $r0.6, $r0.7
	c0	shl $r0.6 = $r0.6, $r0.5
	c0	goto LBB62_55
;;
LBB62_54:                               ## %if.else.i
	c0	mov $r0.7 = 0
	c0	shl $r0.11 = $r0.6, $r0.5
;;
	c0	mov $r0.6 = $r0.7
;;
LBB62_55:                               ## %if.end.i
	c0	mov $r0.5 = -20
;;
	c0	sub $r0.7 = $r0.5, $r0.2
;;
LBB62_59:                               ## %if.end.78
	c0	mov $r0.5 = 12
	c0	mov $r0.13 = 4
	c0	mov $r0.2 = 16
	c0	shru $r0.10 = $r0.6, $r0.10
;;
	c0	shl $r0.14 = $r0.11, $r0.5
	c0	shru $r0.15 = $r0.6, $r0.13
	c0	shru $r0.11 = $r0.11, $r0.13
	c0	shl $r0.5 = $r0.6, $r0.5
;;
	c0	zxth $r0.6 = $r0.14
	c0	zxth $r0.5 = $r0.5
	c0	shru $r0.13 = $r0.4, $r0.2
	c0	zxth $r0.11 = $r0.11
;;
	c0	zxth $r0.14 = $r0.4
	c0	or $r0.6 = $r0.10, $r0.6
	c0	zxth $r0.10 = $r0.15
	c0	zxth $r0.15 = $r0.12
;;
	c0	mpylu $r0.16 = $r0.11, $r0.14
	c0	mpyhs $r0.17 = $r0.11, $r0.14
	c0	or $r0.12 = $r0.12, 1048576
;;
	c0	shru $r0.18 = $r0.12, $r0.2
	c0	mpyhs $r0.19 = $r0.10, $r0.14
	c0	mpylu $r0.20 = $r0.10, $r0.14
;;
	c0	mpyhs $r0.21 = $r0.5, $r0.13
	c0	mpylu $r0.22 = $r0.5, $r0.13
;;
	c0	mpylu $r0.23 = $r0.6, $r0.13
	c0	mpyhs $r0.24 = $r0.6, $r0.13
;;
	c0	mpylu $r0.25 = $r0.6, $r0.14
	c0	mpyhs $r0.26 = $r0.6, $r0.14
;;
	c0	mpylu $r0.27 = $r0.11, $r0.15
	c0	mpyhs $r0.28 = $r0.11, $r0.15
;;
	c0	mpyhs $r0.29 = $r0.10, $r0.13
	c0	mpylu $r0.30 = $r0.10, $r0.13
;;
	c0	mpyhs $r0.31 = $r0.5, $r0.14
	c0	mpylu $r0.14 = $r0.5, $r0.14
;;
	c0	mpyhs $r0.32 = $r0.10, $r0.15
	c0	mpylu $r0.33 = $r0.10, $r0.15
;;
	c0	mpylu $r0.34 = $r0.11, $r0.13
	c0	mpyhs $r0.13 = $r0.11, $r0.13
;;
	c0	mpylu $r0.35 = $r0.5, $r0.15
	c0	mpyhs $r0.36 = $r0.5, $r0.15
;;
	c0	mpylu $r0.37 = $r0.5, $r0.18
	c0	mpyhs $r0.5 = $r0.5, $r0.18
;;
	c0	mpylu $r0.38 = $r0.10, $r0.18
	c0	mpyhs $r0.10 = $r0.10, $r0.18
;;
	c0	mpyhs $r0.39 = $r0.11, $r0.18
	c0	mpylu $r0.11 = $r0.11, $r0.18
;;
	c0	mpylu $r0.40 = $r0.6, $r0.15
	c0	mpyhs $r0.15 = $r0.6, $r0.15
;;
	c0	mpylu $r0.41 = $r0.6, $r0.18
	c0	mpyhs $r0.6 = $r0.6, $r0.18
	c0	add $r0.14 = $r0.14, $r0.31
	c0	add $r0.16 = $r0.16, $r0.17
;;
	c0	add $r0.17 = $r0.22, $r0.21
	c0	add $r0.18 = $r0.20, $r0.19
	c0	add $r0.19 = $r0.30, $r0.29
	c0	add $r0.20 = $r0.23, $r0.24
;;
	c0	add $r0.17 = $r0.18, $r0.17
	c0	add $r0.21 = $r0.25, $r0.26
;;
	c0	cmpltu $r0.18 = $r0.17, $r0.18
	c0	add $r0.16 = $r0.20, $r0.16
	c0	shl $r0.22 = $r0.17, $r0.2
	c0	shru $r0.17 = $r0.17, $r0.2
;;
	c0	shl $r0.23 = $r0.16, $r0.2
	c0	shl $r0.18 = $r0.18, $r0.2
	c0	add $r0.14 = $r0.22, $r0.14
;;
	c0	cmpltu $r0.22 = $r0.14, $r0.22
	c0	add $r0.21 = $r0.23, $r0.21
	c0	or $r0.17 = $r0.18, $r0.17
;;
	c0	add $r0.18 = $r0.21, $r0.19
;;
	c0	add $r0.17 = $r0.18, $r0.17
;;
	c0	add $r0.17 = $r0.17, $r0.22
;;
	c0	cmpltu $b0.0 = $r0.17, $r0.21
	c0	add $r0.13 = $r0.34, $r0.13
	c0	add $r0.18 = $r0.33, $r0.32
	c0	add $r0.5 = $r0.37, $r0.5
;;
	c0	add $r0.19 = $r0.27, $r0.28
	c0	add $r0.6 = $r0.41, $r0.6
	c0	add $r0.15 = $r0.40, $r0.15
	c0	add $r0.5 = $r0.18, $r0.5
;;
	c0	add $r0.19 = $r0.6, $r0.19
	c0	shru $r0.22 = $r0.16, $r0.2
	c0	cmpltu $r0.16 = $r0.16, $r0.20
;;
	c0	shl $r0.20 = $r0.19, $r0.2
	c0	cmpne $b0.1 = $r0.14, 0
	c0	shl $r0.14 = $r0.16, $r0.2
;;
	c0	add $r0.15 = $r0.20, $r0.15
	c0	cmpltu $r0.16 = $r0.21, $r0.23
	c0	or $r0.14 = $r0.14, $r0.22
;;
	c0	add $r0.13 = $r0.15, $r0.13
;;
	c0	add $r0.13 = $r0.13, $r0.14
;;
	c0	add $r0.13 = $r0.13, $r0.16
	c0	mfb $r0.14 = $b0.0
;;
	c0	add $r0.13 = $r0.13, $r0.14
;;
	c0	cmpltu $b0.0 = $r0.13, $r0.15
	c0	add $r0.9 = $r0.7, $r0.9
	c0	add $r0.7 = $r0.35, $r0.36
	c0	cmpltu $r0.14 = $r0.5, $r0.18
;;
	c0	add $r0.11 = $r0.11, $r0.39
	c0	shl $r0.16 = $r0.5, $r0.2
	c0	shru $r0.5 = $r0.5, $r0.2
	c0	shl $r0.14 = $r0.14, $r0.2
;;
	c0	add $r0.10 = $r0.38, $r0.10
	c0	add $r0.11 = $r0.11, $r0.12
	c0	add $r0.7 = $r0.16, $r0.7
	c0	or $r0.5 = $r0.14, $r0.5
;;
	c0	cmpltu $r0.6 = $r0.19, $r0.6
	c0	cmpltu $r0.12 = $r0.7, $r0.16
	c0	add $r0.5 = $r0.5, $r0.10
	c0	add $r0.7 = $r0.17, $r0.7
;;
	c0	shru $r0.10 = $r0.19, $r0.2
	c0	shl $r0.2 = $r0.6, $r0.2
	c0	add $r0.5 = $r0.5, $r0.12
	c0	cmpltu $r0.6 = $r0.7, $r0.17
;;
	c0	cmpltu $r0.12 = $r0.15, $r0.20
	c0	or $r0.2 = $r0.2, $r0.10
	c0	mfb $r0.10 = $b0.1
	c0	add $r0.5 = $r0.5, $r0.6
;;
	c0	add $r0.2 = $r0.11, $r0.2
;;
	c0	add $r0.2 = $r0.2, $r0.12
	c0	or $r0.7 = $r0.7, $r0.10
	c0	add $r0.10 = $r0.5, $r0.13
;;
	c0	add $r0.6 = $r0.10, $r0.4
	c0	cmpltu $r0.4 = $r0.10, $r0.5
	c0	mfb $r0.5 = $b0.0
;;
	c0	cmpltu $r0.10 = $r0.6, $r0.10
	c0	add $r0.2 = $r0.2, $r0.5
;;
	c0	add $r0.2 = $r0.2, $r0.4
;;
	c0	add $r0.5 = $r0.2, $r0.10
;;
	c0	cmpltu $b0.0 = $r0.5, 2097152
;;
;;
	c0	br $b0.0, LBB62_60
;;
## BB#61:                               ## %if.then.84
	c0	cmpne $b0.0 = $r0.7, 0
	c0	mov $r0.2 = 1
	c0	shl $r0.7 = $r0.5, $r0.8
	c0	shl $r0.8 = $r0.6, $r0.8
;;
	c0	add $r0.4 = $r0.9, -1023
	c0	shru $r0.6 = $r0.6, $r0.2
	c0	shru $r0.5 = $r0.5, $r0.2
;;
	c0	mfb $r0.2 = $b0.0
	c0	or $r0.6 = $r0.7, $r0.6
;;
	c0	or $r0.7 = $r0.8, $r0.2
	c0	goto LBB62_62
;;
LBB62_60:
	c0	add $r0.4 = $r0.9, -1024
;;
LBB62_62:                               ## %if.end.85
.call roundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = roundAndPackFloat64
;;
	c0	mov $r0.2 = $r0.3
;;
LBB62_63:                               ## %cleanup
	c0	mov $r0.3 = $r0.2
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @roundAndPackFloat64
roundAndPackFloat64::
## BB#0:                                ## %entry
	c0	mov $r0.2 = float_rounding_mode
;;
	c0	ldw $r0.8 = 0[$r0.2]
;;
;;
	c0	cmpeq $b0.0 = $r0.8, 0
	c0	mov $r0.2 = 31
;;
;;
	c0	br $b0.0, LBB63_1
;;
## BB#2:                                ## %if.then
	c0	cmpeq $b0.0 = $r0.8, 1
;;
;;
	c0	brf $b0.0, LBB63_4
;;
## BB#3:
	c0	mov $r0.9 = 0
	c0	goto LBB63_8
;;
LBB63_1:
	c0	shru $r0.9 = $r0.7, $r0.2
	c0	goto LBB63_8
;;
LBB63_4:                                ## %if.else
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB63_6
;;
## BB#5:                                ## %if.then.7
	c0	cmpeq $b0.0 = $r0.8, 3
	c0	goto LBB63_7
;;
LBB63_6:                                ## %if.else.11
	c0	cmpeq $b0.0 = $r0.8, 2
;;
LBB63_7:                                ## %if.end.19
	c0	cmpne $b0.1 = $r0.7, 0
	c0	mfb $r0.9 = $b0.0
;;
;;
	c0	mfb $r0.10 = $b0.1
;;
	c0	and $r0.9 = $r0.10, $r0.9
;;
	c0	and $r0.9 = $r0.9, 1
;;
LBB63_8:                                ## %if.end.19
	c0	zxth $r0.10 = $r0.4
;;
	c0	cmpltu $b0.0 = $r0.10, 2045
;;
;;
	c0	br $b0.0, LBB63_40
;;
## BB#9:                                ## %if.then.24
	c0	cmpgt $b0.0 = $r0.4, 2045
;;
;;
	c0	br $b0.0, LBB63_14
;;
## BB#10:                               ## %lor.lhs.false
	c0	cmpne $b0.0 = $r0.4, 2045
;;
;;
	c0	br $b0.0, LBB63_21
;;
## BB#11:                               ## %land.lhs.true
	c0	cmpne $b0.0 = $r0.5, 2097151
	c0	mov $r0.4 = 2045
;;
;;
	c0	br $b0.0, LBB63_40
;;
## BB#12:                               ## %land.lhs.true
	c0	cmpne $b0.0 = $r0.6, -1
;;
;;
	c0	br $b0.0, LBB63_40
;;
## BB#13:                               ## %land.lhs.true
	c0	cmpeq $b0.0 = $r0.9, 0
;;
;;
	c0	br $b0.0, LBB63_40
;;
LBB63_14:                               ## %if.then.32
	c0	mov $r0.4 = float_exception_flags
;;
	c0	ldw $r0.5 = 0[$r0.4]
	c0	cmpeq $b0.0 = $r0.8, 1
;;
;;
	c0	or $r0.5 = $r0.5, 9
;;
	c0	stw 0[$r0.4] = $r0.5
	c0	br $b0.0, LBB63_19
;;
## BB#15:                               ## %lor.lhs.false.35
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB63_17
;;
## BB#16:                               ## %lor.lhs.false.35
	c0	cmpeq $b0.0 = $r0.8, 2
;;
;;
	c0	br $b0.0, LBB63_19
;;
LBB63_17:                               ## %lor.lhs.false.40
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB63_20
;;
## BB#18:                               ## %lor.lhs.false.40
	c0	cmpne $b0.0 = $r0.8, 3
;;
;;
	c0	br $b0.0, LBB63_20
;;
LBB63_19:                               ## %if.then.45
	c0	shl $r0.2 = $r0.3, $r0.2
	c0	mov $r0.6 = -1
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	or $r0.4 = $r0.2, 2146435071
	c0	mov $r0.3 = $r0.6
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB63_21:                               ## %if.end.49
	c0	cmpgt $b0.0 = $r0.4, -1
;;
;;
	c0	br $b0.0, LBB63_40
;;
## BB#22:                               ## %if.then.52
	c0	mov $r0.10 = -1
	c0	cmpltu $b0.1 = $r0.5, 2097151
;;
	c0	mtb $b0.0 = $r0.10
;;
	c0	br $b0.1, LBB63_25
;;
## BB#23:                               ## %if.then.52
	c0	mov $r0.10 = float_detect_tininess
	c0	cmplt $b0.1 = $r0.4, -1
	c0	cmpeq $b0.2 = $r0.9, 0
;;
	c0	ldw $r0.9 = 0[$r0.10]
;;
	c0	mfb $r0.10 = $b0.1
	c0	mfb $r0.11 = $b0.2
;;
	c0	cmpeq $b0.1 = $r0.9, 1
;;
;;
	c0	mfb $r0.9 = $b0.1
;;
	c0	or $r0.9 = $r0.10, $r0.9
;;
	c0	or $r0.9 = $r0.11, $r0.9
;;
	c0	mtb $b0.1 = $r0.9
;;
;;
	c0	br $b0.1, LBB63_25
;;
## BB#24:                               ## %lor.rhs.i
	c0	cmpne $b0.0 = $r0.6, -1
	c0	cmpeq $b0.1 = $r0.5, 2097151
;;
;;
	c0	mfb $r0.9 = $b0.0
	c0	mfb $r0.10 = $b0.1
;;
	c0	and $r0.9 = $r0.10, $r0.9
;;
	c0	mtb $b0.0 = $r0.9
;;
LBB63_25:                               ## %if.else.i
	c0	mov $r0.10 = 0
	c0	cmplt $b0.1 = $r0.4, -31
	c0	and $r0.9 = $r0.4, 31
;;
	c0	sub $r0.11 = $r0.10, $r0.4
;;
	c0	br $b0.1, LBB63_27
;;
## BB#26:                               ## %if.then.2.i
	c0	shru $r0.4 = $r0.6, $r0.11
	c0	shl $r0.12 = $r0.5, $r0.9
	c0	shru $r0.10 = $r0.5, $r0.11
	c0	shl $r0.6 = $r0.6, $r0.9
;;
	c0	or $r0.11 = $r0.4, $r0.12
	c0	goto LBB63_32
;;
LBB63_20:                               ## %if.end.47
	c0	shl $r0.2 = $r0.3, $r0.2
	c0	mov $r0.6 = 0
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	or $r0.4 = $r0.2, 2146435072
	c0	mov $r0.3 = $r0.6
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB63_27:                               ## %if.else.5.i
	c0	cmpeq $b0.1 = $r0.11, 32
;;
;;
	c0	brf $b0.1, LBB63_29
;;
## BB#28:
	c0	mov $r0.11 = $r0.5
	c0	goto LBB63_32
;;
LBB63_29:                               ## %if.else.8.i
	c0	cmplt $b0.1 = $r0.4, -63
	c0	or $r0.7 = $r0.7, $r0.6
;;
;;
	c0	br $b0.1, LBB63_31
;;
## BB#30:                               ## %if.then.11.i
	c0	and $r0.4 = $r0.11, 31
	c0	shl $r0.6 = $r0.5, $r0.9
;;
	c0	shru $r0.11 = $r0.5, $r0.4
	c0	goto LBB63_32
;;
LBB63_31:                               ## %if.else.15.i
	c0	cmpne $b0.1 = $r0.5, 0
	c0	cmpeq $b0.2 = $r0.11, 64
	c0	mov $r0.10 = 0
;;
	c0	mov $r0.11 = $r0.10
;;
	c0	mfb $r0.4 = $b0.1
;;
	c0	slct $r0.6 = $b0.2, $r0.5, $r0.4
;;
LBB63_32:                               ## %shift64ExtraRightJamming.exit
	c0	cmpne $b0.1 = $r0.7, 0
	c0	mfb $r0.4 = $b0.0
;;
;;
	c0	mfb $r0.5 = $b0.1
;;
	c0	or $r0.7 = $r0.5, $r0.6
;;
	c0	cmpne $b0.0 = $r0.7, 0
;;
;;
	c0	mfb $r0.9 = $b0.0
;;
	c0	and $r0.4 = $r0.4, $r0.9
;;
	c0	and $r0.4 = $r0.4, 1
;;
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB63_34
;;
## BB#33:                               ## %if.then.65
	c0	mov $r0.4 = float_exception_flags
;;
	c0	ldw $r0.5 = 0[$r0.4]
;;
;;
	c0	or $r0.5 = $r0.5, 4
;;
	c0	stw 0[$r0.4] = $r0.5
;;
LBB63_34:                               ## %if.end.66
	c0	cmpne $b0.0 = $r0.8, 0
;;
;;
	c0	brf $b0.0, LBB63_35
;;
## BB#36:                               ## %if.else.71
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB63_38
;;
## BB#37:                               ## %if.then.73
	c0	cmpeq $b0.0 = $r0.8, 3
	c0	goto LBB63_39
;;
LBB63_35:                               ## %if.then.68
	c0	shru $r0.9 = $r0.6, $r0.2
	c0	mov $r0.5 = $r0.10
	c0	mov $r0.4 = 0
	c0	mov $r0.6 = $r0.11
;;
	c0	goto LBB63_40
;;
LBB63_38:                               ## %if.else.80
	c0	cmpeq $b0.0 = $r0.8, 2
;;
LBB63_39:                               ## %if.end.90
	c0	mov $r0.5 = $r0.10
	c0	mov $r0.4 = 0
	c0	mov $r0.6 = $r0.11
	c0	mfb $r0.10 = $b0.0
;;
	c0	and $r0.9 = $r0.10, $r0.9
;;
	c0	and $r0.9 = $r0.9, 1
;;
LBB63_40:                               ## %if.end.90
	c0	cmpeq $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB63_42
;;
## BB#41:                               ## %if.then.92
	c0	mov $r0.10 = float_exception_flags
;;
	c0	ldw $r0.11 = 0[$r0.10]
;;
;;
	c0	or $r0.11 = $r0.11, 1
;;
	c0	stw 0[$r0.10] = $r0.11
;;
LBB63_42:                               ## %if.end.93
	c0	cmpeq $b0.0 = $r0.9, 0
;;
;;
	c0	br $b0.0, LBB63_44
;;
## BB#43:                               ## %if.then.95
	c0	and $r0.7 = $r0.7, 2147483647
	c0	cmpeq $b0.0 = $r0.6, -1
	c0	add $r0.6 = $r0.6, 1
;;
	c0	or $r0.7 = $r0.7, $r0.8
;;
	c0	mfb $r0.8 = $b0.0
	c0	cmpeq $b0.0 = $r0.7, 0
;;
	c0	add $r0.5 = $r0.8, $r0.5
;;
	c0	mfb $r0.7 = $b0.0
;;
	c0	andc $r0.6 = $r0.7, $r0.6
	c0	goto LBB63_45
;;
LBB63_44:                               ## %if.else.99
	c0	or $r0.7 = $r0.6, $r0.5
	c0	mov $r0.8 = 0
;;
	c0	cmpeq $b0.0 = $r0.7, 0
;;
;;
	c0	slct $r0.4 = $b0.0, $r0.8, $r0.4
;;
LBB63_45:                               ## %if.end.105
	c0	shl $r0.2 = $r0.3, $r0.2
	c0	mov $r0.3 = 20
;;
	c0	shl $r0.3 = $r0.4, $r0.3
	c0	add $r0.2 = $r0.5, $r0.2
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	add $r0.4 = $r0.2, $r0.3
	c0	mov $r0.3 = $r0.6
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float64_div
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_div
float64_div::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $l0.0
	c0	mov $r0.2 = 20
	c0	mov $r0.7 = $r0.3
	c0	mov $r0.10 = 31
;;
	c0	shru $r0.3 = $r0.7, $r0.2
	c0	xor $r0.11 = $r0.5, $r0.7
	c0	shru $r0.12 = $r0.5, $r0.2
;;
	c0	and $r0.9 = $r0.3, 2047
;;
	c0	cmpne $b0.0 = $r0.9, 2047
	c0	mov $r0.2 = $r0.4
;;
	c0	and $r0.4 = $r0.5, 1048575
	c0	and $r0.8 = $r0.7, 1048575
;;
	c0	shru $r0.3 = $r0.11, $r0.10
	c0	and $r0.11 = $r0.12, 2047
;;
	c0	br $b0.0, LBB64_33
;;
## BB#1:                                ## %if.then
	c0	or $r0.8 = $r0.8, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.8, 0
;;
;;
	c0	br $b0.0, LBB64_16
;;
## BB#2:                                ## %if.then.27
	c0	and $r0.3 = $r0.7, 2146959360
;;
	c0	cmpne $b0.0 = $r0.3, 2146435072
;;
;;
	c0	br $b0.0, LBB64_3
;;
## BB#4:                                ## %land.rhs.i.59.i.471
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB64_6
;;
## BB#5:
	c0	mov $r0.3 = -1
;;
	c0	mtb $b0.2 = $r0.3
	c0	goto LBB64_7
;;
LBB64_33:                               ## %if.end.46
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	brf $b0.0, LBB64_34
;;
## BB#36:                               ## %if.then.61
	c0	or $r0.11 = $r0.4, $r0.6
;;
	c0	cmpne $b0.0 = $r0.11, 0
;;
;;
	c0	brf $b0.0, LBB64_37
;;
## BB#40:                               ## %if.end.73
	c0	cmpne $b0.0 = $r0.4, 0
;;
;;
	c0	brf $b0.0, LBB64_41
;;
## BB#45:                               ## %if.else.7.i.389
	c0	cmpltu $b0.0 = $r0.4, 65536
	c0	mov $r0.11 = 16
	c0	mov $r0.12 = 8
;;
	c0	mov $r0.13 = 22
	c0	shl $r0.5 = $r0.5, $r0.11
	c0	mov $r0.11 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	mov $r0.14 = 4
	c0	mfb $r0.15 = $b0.0
	c0	slct $r0.5 = $b0.0, $r0.5, $r0.4
;;
	c0	shl $r0.14 = $r0.15, $r0.14
	c0	cmpltu $b0.0 = $r0.5, 16777216
	c0	shl $r0.12 = $r0.5, $r0.12
;;
	c0	or $r0.15 = $r0.14, 8
;;
	c0	slct $r0.5 = $b0.0, $r0.12, $r0.5
	c0	slct $r0.12 = $b0.0, $r0.15, $r0.14
;;
	c0	shru $r0.5 = $r0.5, $r0.13
;;
	c0	and $r0.5 = $r0.5, 1020
;;
	c0	add $r0.5 = $r0.11, $r0.5
;;
	c0	ldw $r0.5 = 0[$r0.5]
;;
;;
	c0	add $r0.5 = $r0.5, $r0.12
;;
	c0	add $r0.11 = $r0.5, -11
;;
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB64_47
;;
## BB#46:                               ## %cond.false.i.i.395
	c0	mov $r0.12 = 11
	c0	shl $r0.4 = $r0.4, $r0.11
;;
	c0	sub $r0.12 = $r0.12, $r0.5
;;
	c0	and $r0.12 = $r0.12, 31
;;
	c0	shru $r0.12 = $r0.6, $r0.12
;;
	c0	or $r0.4 = $r0.12, $r0.4
;;
LBB64_47:                               ## %shortShift64Left.exit.i.398
	c0	mov $r0.12 = 12
	c0	shl $r0.6 = $r0.6, $r0.11
;;
	c0	sub $r0.11 = $r0.12, $r0.5
	c0	goto LBB64_48
;;
LBB64_34:                               ## %if.end.46
	c0	cmpne $b0.0 = $r0.11, 2047
;;
;;
	c0	br $b0.0, LBB64_48
;;
## BB#35:                               ## %if.then.48
	c0	or $r0.4 = $r0.4, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	brf $b0.0, LBB64_18
;;
	c0	goto LBB64_50
;;
LBB64_16:                               ## %if.end
	c0	cmpne $b0.0 = $r0.11, 2047
;;
;;
	c0	br $b0.0, LBB64_32
;;
## BB#17:                               ## %if.then.34
	c0	or $r0.3 = $r0.4, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB64_38
;;
LBB64_18:                               ## %if.then.37
	c0	and $r0.3 = $r0.7, 2146959360
;;
	c0	cmpne $b0.0 = $r0.3, 2146435072
;;
;;
	c0	br $b0.0, LBB64_19
;;
## BB#20:                               ## %land.rhs.i.59.i.422
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB64_22
;;
## BB#21:
	c0	mov $r0.3 = -1
;;
	c0	mtb $b0.1 = $r0.3
	c0	goto LBB64_23
;;
LBB64_3:
	c0	mov $r0.3 = 0
;;
	c0	mtb $b0.2 = $r0.3
	c0	goto LBB64_7
;;
LBB64_37:                               ## %if.then.64
	c0	or $r0.2 = $r0.8, $r0.2
;;
	c0	or $r0.2 = $r0.2, $r0.9
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB64_38
;;
## BB#39:                               ## %if.end.71
	c0	mov $r0.5 = float_exception_flags
	c0	shl $r0.3 = $r0.3, $r0.10
;;
	c0	ldw $r0.6 = 0[$r0.5]
	c0	mov $r0.2 = 0
	c0	or $r0.4 = $r0.3, 2146435072
;;
;;
	c0	or $r0.3 = $r0.6, 2
;;
	c0	stw 0[$r0.5] = $r0.3
	c0	goto LBB64_92
;;
LBB64_32:                               ## %if.end.44
	c0	shl $r0.3 = $r0.3, $r0.10
	c0	mov $r0.2 = 0
;;
	c0	or $r0.4 = $r0.3, 2146435072
	c0	goto LBB64_92
;;
LBB64_38:                               ## %invalid
	c0	mov $r0.3 = float_exception_flags
;;
	c0	ldw $r0.5 = 0[$r0.3]
	c0	mov $r0.2 = -1
	c0	mov $r0.4 = 2147483647
;;
;;
	c0	or $r0.5 = $r0.5, 16
;;
	c0	stw 0[$r0.3] = $r0.5
	c0	goto LBB64_92
;;
LBB64_19:
	c0	mov $r0.3 = 0
;;
	c0	mtb $b0.1 = $r0.3
	c0	goto LBB64_23
;;
LBB64_6:                                ## %lor.rhs.i.62.i.474
	c0	and $r0.3 = $r0.7, 524287
;;
	c0	cmpne $b0.2 = $r0.3, 0
;;
LBB64_7:                                ## %float64_is_signaling_nan.exit64.i.477
	c0	mov $r0.3 = 1
	c0	or $r0.4 = $r0.4, $r0.6
;;
	c0	shl $r0.3 = $r0.5, $r0.3
	c0	cmpne $b0.0 = $r0.4, 0
;;
	c0	cmpgtu $b0.1 = $r0.3, -2097153
;;
	c0	mfb $r0.3 = $b0.0
;;
	c0	mfb $r0.4 = $b0.1
	c0	and $r0.8 = $r0.5, 2146959360
;;
	c0	cmpne $b0.1 = $r0.8, 2146435072
	c0	and $r0.3 = $r0.4, $r0.3
;;
	c0	mtb $b0.0 = $r0.3
;;
	c0	br $b0.1, LBB64_8
;;
## BB#9:                                ## %land.rhs.i.i.487
	c0	cmpeq $b0.1 = $r0.6, 0
;;
;;
	c0	br $b0.1, LBB64_12
;;
## BB#10:                               ## %float64_is_signaling_nan.exit.thread.i.490
	c0	mov $r0.8 = -1
	c0	or $r0.4 = $r0.7, 524288
;;
	c0	or $r0.3 = $r0.5, 524288
	c0	mtb $b0.1 = $r0.8
	c0	goto LBB64_11
;;
LBB64_8:
	c0	mov $r0.3 = 0
;;
	c0	mtb $b0.1 = $r0.3
	c0	goto LBB64_13
;;
LBB64_41:                               ## %if.then.i.363
	c0	mov $r0.4 = 16
	c0	cmpltu $b0.0 = $r0.6, 65536
	c0	mov $r0.5 = 8
;;
	c0	mov $r0.11 = 22
	c0	shl $r0.4 = $r0.6, $r0.4
	c0	mov $r0.12 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	mov $r0.13 = 4
	c0	slct $r0.4 = $b0.0, $r0.4, $r0.6
;;
	c0	cmpltu $b0.1 = $r0.4, 16777216
	c0	shl $r0.5 = $r0.4, $r0.5
;;
;;
	c0	slct $r0.4 = $b0.1, $r0.5, $r0.4
;;
	c0	shru $r0.4 = $r0.4, $r0.11
	c0	mfb $r0.5 = $b0.0
;;
	c0	and $r0.4 = $r0.4, 1020
	c0	shl $r0.5 = $r0.5, $r0.13
;;
	c0	add $r0.4 = $r0.12, $r0.4
	c0	or $r0.11 = $r0.5, 8
;;
	c0	ldw $r0.4 = 0[$r0.4]
	c0	slct $r0.5 = $b0.1, $r0.11, $r0.5
;;
;;
	c0	add $r0.5 = $r0.4, $r0.5
;;
	c0	cmpgt $b0.0 = $r0.5, 10
	c0	add $r0.4 = $r0.5, -11
;;
;;
	c0	br $b0.0, LBB64_43
;;
## BB#42:                               ## %if.then.2.i.368
	c0	mov $r0.11 = 11
	c0	and $r0.12 = $r0.4, 31
;;
	c0	sub $r0.4 = $r0.11, $r0.5
;;
	c0	shru $r0.4 = $r0.6, $r0.4
	c0	shl $r0.6 = $r0.6, $r0.12
	c0	goto LBB64_44
;;
LBB64_12:                               ## %lor.rhs.i.i.493
	c0	and $r0.3 = $r0.5, 524287
;;
	c0	cmpne $b0.1 = $r0.3, 0
;;
LBB64_13:                               ## %float64_is_signaling_nan.exit.i.497
	c0	mfb $r0.8 = $b0.1
	c0	mfb $r0.9 = $b0.2
	c0	or $r0.3 = $r0.5, 524288
;;
	c0	or $r0.4 = $r0.7, 524288
	c0	or $r0.5 = $r0.9, $r0.8
;;
	c0	and $r0.5 = $r0.5, 1
;;
	c0	cmpeq $b0.2 = $r0.5, 0
;;
;;
	c0	br $b0.2, LBB64_14
;;
LBB64_11:                               ## %if.then.i.501
	c0	mov $r0.5 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.5]
	c0	mov $r0.8 = -1
;;
	c0	mtb $b0.2 = $r0.8
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.5] = $r0.7
	c0	goto LBB64_15
;;
LBB64_14:
	c0	mov $r0.5 = 0
;;
	c0	mtb $b0.2 = $r0.5
;;
;;
	c0	mfb $r0.11 = $b0.2
;;
	c0	mtb $b0.1 = $r0.11
;;
LBB64_15:                               ## %propagateFloat64NaN.exit516
	c0	slct $r0.5 = $b0.0, $r0.6, $r0.2
	c0	slct $r0.2 = $b0.1, $r0.6, $r0.2
	c0	slct $r0.6 = $b0.1, $r0.3, $r0.4
	c0	slct $r0.3 = $b0.0, $r0.3, $r0.4
;;
	c0	slct $r0.2 = $b0.2, $r0.2, $r0.5
	c0	slct $r0.4 = $b0.2, $r0.6, $r0.3
	c0	goto LBB64_92
;;
LBB64_43:                               ## %if.else.i.370
	c0	mov $r0.11 = 0
	c0	shl $r0.4 = $r0.6, $r0.4
;;
	c0	mov $r0.6 = $r0.11
;;
LBB64_44:                               ## %if.end.i.373
	c0	mov $r0.11 = -20
;;
	c0	sub $r0.11 = $r0.11, $r0.5
;;
LBB64_48:                               ## %if.end.74
	c0	cmpne $b0.0 = $r0.9, 0
;;
;;
	c0	br $b0.0, LBB64_59
;;
## BB#49:                               ## %if.then.76
	c0	or $r0.5 = $r0.8, $r0.2
;;
	c0	cmpne $b0.0 = $r0.5, 0
;;
;;
	c0	brf $b0.0, LBB64_50
;;
## BB#51:                               ## %if.end.81
	c0	cmpne $b0.0 = $r0.8, 0
;;
;;
	c0	brf $b0.0, LBB64_52
;;
## BB#56:                               ## %if.else.7.i
	c0	cmpltu $b0.0 = $r0.8, 65536
	c0	mov $r0.5 = 16
	c0	mov $r0.9 = 8
;;
	c0	mov $r0.12 = 22
	c0	shl $r0.5 = $r0.7, $r0.5
	c0	mov $r0.7 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	mov $r0.13 = 4
	c0	mfb $r0.14 = $b0.0
	c0	slct $r0.5 = $b0.0, $r0.5, $r0.8
;;
	c0	shl $r0.13 = $r0.14, $r0.13
	c0	cmpltu $b0.0 = $r0.5, 16777216
	c0	shl $r0.9 = $r0.5, $r0.9
;;
	c0	or $r0.14 = $r0.13, 8
;;
	c0	slct $r0.5 = $b0.0, $r0.9, $r0.5
	c0	slct $r0.9 = $b0.0, $r0.14, $r0.13
;;
	c0	shru $r0.5 = $r0.5, $r0.12
;;
	c0	and $r0.5 = $r0.5, 1020
;;
	c0	add $r0.5 = $r0.7, $r0.5
;;
	c0	ldw $r0.5 = 0[$r0.5]
;;
;;
	c0	add $r0.5 = $r0.5, $r0.9
;;
	c0	add $r0.7 = $r0.5, -11
;;
	c0	cmpeq $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB64_58
;;
## BB#57:                               ## %cond.false.i.i
	c0	mov $r0.9 = 11
	c0	shl $r0.8 = $r0.8, $r0.7
;;
	c0	sub $r0.9 = $r0.9, $r0.5
;;
	c0	and $r0.9 = $r0.9, 31
;;
	c0	shru $r0.9 = $r0.2, $r0.9
;;
	c0	or $r0.8 = $r0.9, $r0.8
;;
LBB64_58:                               ## %shortShift64Left.exit.i
	c0	mov $r0.9 = 12
	c0	shl $r0.2 = $r0.2, $r0.7
;;
	c0	sub $r0.9 = $r0.9, $r0.5
	c0	goto LBB64_59
;;
LBB64_50:                               ## %if.end.57
	c0	mov $r0.2 = 0
	c0	shl $r0.4 = $r0.3, $r0.10
	c0	goto LBB64_92
;;
LBB64_22:                               ## %lor.rhs.i.62.i.425
	c0	and $r0.3 = $r0.7, 524287
;;
	c0	cmpne $b0.1 = $r0.3, 0
;;
LBB64_23:                               ## %float64_is_signaling_nan.exit64.i.428
	c0	and $r0.3 = $r0.5, 2146959360
	c0	mov $r0.4 = 1
;;
	c0	cmpne $b0.0 = $r0.3, 2146435072
	c0	shl $r0.3 = $r0.5, $r0.4
;;
;;
	c0	br $b0.0, LBB64_24
;;
## BB#25:                               ## %land.rhs.i.i.438
	c0	cmpeq $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB64_28
;;
## BB#26:                               ## %float64_is_signaling_nan.exit.thread.i.441
	c0	mov $r0.8 = -1
	c0	or $r0.7 = $r0.7, 524288
;;
	c0	or $r0.4 = $r0.5, 524288
	c0	mtb $b0.0 = $r0.8
	c0	goto LBB64_27
;;
LBB64_24:
	c0	mov $r0.4 = 0
;;
	c0	mtb $b0.0 = $r0.4
	c0	goto LBB64_29
;;
LBB64_28:                               ## %lor.rhs.i.i.444
	c0	and $r0.4 = $r0.5, 524287
;;
	c0	cmpne $b0.0 = $r0.4, 0
;;
LBB64_29:                               ## %float64_is_signaling_nan.exit.i.448
	c0	mfb $r0.8 = $b0.0
	c0	mfb $r0.9 = $b0.1
	c0	or $r0.4 = $r0.5, 524288
;;
	c0	or $r0.7 = $r0.7, 524288
	c0	or $r0.5 = $r0.9, $r0.8
;;
	c0	and $r0.5 = $r0.5, 1
;;
	c0	cmpeq $b0.1 = $r0.5, 0
;;
;;
	c0	br $b0.1, LBB64_30
;;
LBB64_27:                               ## %if.then.i.452
	c0	mov $r0.5 = float_exception_flags
;;
	c0	ldw $r0.8 = 0[$r0.5]
	c0	mov $r0.9 = -1
;;
	c0	mtb $b0.1 = $r0.9
;;
	c0	or $r0.8 = $r0.8, 16
;;
	c0	stw 0[$r0.5] = $r0.8
	c0	goto LBB64_31
;;
LBB64_30:
	c0	mov $r0.5 = 0
;;
	c0	mtb $b0.1 = $r0.5
;;
;;
	c0	mfb $r0.11 = $b0.1
;;
	c0	mtb $b0.0 = $r0.11
;;
LBB64_31:                               ## %propagateFloat64NaN.exit467
	c0	cmpgtu $b0.2 = $r0.3, -2097153
	c0	slct $r0.3 = $b0.0, $r0.4, $r0.7
	c0	slct $r0.5 = $b0.0, $r0.6, $r0.2
;;
;;
	c0	slct $r0.2 = $b0.2, $r0.6, $r0.2
	c0	slct $r0.4 = $b0.2, $r0.4, $r0.7
;;
	c0	slct $r0.2 = $b0.1, $r0.5, $r0.2
	c0	slct $r0.4 = $b0.1, $r0.3, $r0.4
	c0	goto LBB64_92
;;
LBB64_52:                               ## %if.then.i
	c0	mov $r0.5 = 16
	c0	cmpltu $b0.0 = $r0.2, 65536
	c0	mov $r0.7 = 8
;;
	c0	mov $r0.8 = 22
	c0	shl $r0.5 = $r0.2, $r0.5
	c0	mov $r0.9 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	mov $r0.12 = 4
	c0	slct $r0.5 = $b0.0, $r0.5, $r0.2
;;
	c0	cmpltu $b0.1 = $r0.5, 16777216
	c0	shl $r0.7 = $r0.5, $r0.7
;;
;;
	c0	slct $r0.5 = $b0.1, $r0.7, $r0.5
;;
	c0	shru $r0.5 = $r0.5, $r0.8
	c0	mfb $r0.7 = $b0.0
;;
	c0	and $r0.5 = $r0.5, 1020
	c0	shl $r0.7 = $r0.7, $r0.12
;;
	c0	add $r0.5 = $r0.9, $r0.5
	c0	or $r0.8 = $r0.7, 8
;;
	c0	ldw $r0.5 = 0[$r0.5]
	c0	slct $r0.7 = $b0.1, $r0.8, $r0.7
;;
;;
	c0	add $r0.5 = $r0.5, $r0.7
;;
	c0	cmpgt $b0.0 = $r0.5, 10
	c0	add $r0.7 = $r0.5, -11
;;
;;
	c0	br $b0.0, LBB64_54
;;
## BB#53:                               ## %if.then.2.i
	c0	mov $r0.8 = 11
	c0	and $r0.7 = $r0.7, 31
;;
	c0	sub $r0.8 = $r0.8, $r0.5
;;
	c0	shru $r0.8 = $r0.2, $r0.8
	c0	shl $r0.2 = $r0.2, $r0.7
	c0	goto LBB64_55
;;
LBB64_54:                               ## %if.else.i
	c0	mov $r0.9 = 0
	c0	shl $r0.8 = $r0.2, $r0.7
;;
	c0	mov $r0.2 = $r0.9
;;
LBB64_55:                               ## %if.end.i.344
	c0	mov $r0.7 = -20
;;
	c0	sub $r0.9 = $r0.7, $r0.5
;;
LBB64_59:                               ## %if.end.82
	c0	mov $r0.5 = 11
	c0	mov $r0.7 = 21
;;
	c0	shl $r0.4 = $r0.4, $r0.5
	c0	shru $r0.12 = $r0.2, $r0.7
	c0	shl $r0.14 = $r0.8, $r0.5
	c0	shru $r0.15 = $r0.6, $r0.7
;;
	c0	sub $r0.13 = $r0.9, $r0.11
	c0	shl $r0.8 = $r0.6, $r0.5
	c0	or $r0.11 = $r0.4, -2147483648
;;
	c0	or $r0.4 = $r0.12, $r0.14
;;
	c0	or $r0.14 = $r0.4, -2147483648
	c0	or $r0.9 = $r0.15, $r0.11
;;
	c0	cmpltu $b0.0 = $r0.9, $r0.14
;;
;;
	c0	br $b0.0, LBB64_62
;;
## BB#60:                               ## %lor.rhs.i
	c0	shl $r0.15 = $r0.2, $r0.5
	c0	add $r0.4 = $r0.13, 1021
;;
	c0	cmpgtu $b0.0 = $r0.8, $r0.15
;;
;;
	c0	br $b0.0, LBB64_63
;;
## BB#61:                               ## %lor.rhs.i
	c0	cmpne $b0.0 = $r0.9, $r0.14
;;
;;
	c0	br $b0.0, LBB64_63
;;
LBB64_62:                               ## %if.then.87
	c0	mov $r0.15 = 10
	c0	mov $r0.16 = 1
	c0	shl $r0.10 = $r0.12, $r0.10
;;
	c0	add $r0.4 = $r0.13, 1022
	c0	shl $r0.2 = $r0.2, $r0.15
	c0	shru $r0.14 = $r0.14, $r0.16
;;
	c0	and $r0.2 = $r0.2, 2147482624
;;
	c0	or $r0.15 = $r0.10, $r0.2
;;
LBB64_63:                               ## %if.end.88
	c0	mov $r0.2 = 16
	c0	cmpgtu $b0.0 = $r0.9, $r0.14
;;
	c0	shru $r0.10 = $r0.11, $r0.2
;;
	c0	brf $b0.0, LBB64_64
;;
## BB#65:                               ## %if.end.i.268
	c0	shl $r0.13 = $r0.10, $r0.2
;;
	c0	cmpleu $b0.0 = $r0.13, $r0.14
;;
;;
	c0	br $b0.0, LBB64_66
;;
## BB#67:                               ## %cond.false.i.271
	c0	cmplt $r0.11 = $r0.10, $r0.0
	c0	mov $r0.12 = 0
;;
	c0	shru $r0.16 = $r0.14, $r0.11
	c0	mtb $b0.0 = $r0.12
	c0	shru $r0.17 = $r0.10, $r0.11
	c0	mtb $b0.1 = $r0.12
;;
;;
	c0	addcg $r0.12, $b0.0 = $r0.16, $r0.16, $b0.0
;;
	c0	divs $r0.16, $b0.0 = $r0.0, $r0.17, $b0.0
	c0	addcg $r0.18, $b0.1 = $r0.12, $r0.12, $b0.1
;;
	c0	addcg $r0.12, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.16, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.2 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.17, $b0.1
	c0	mtb $b0.0 = $r0.11
;;
	c0	addcg $r0.11, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.17, $b0.2
;;
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.17, $b0.1
	c0	addcg $r0.16, $b0.2 = $r0.11, $r0.11, $b0.2
;;
	c0	addcg $r0.11, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.17, $b0.2
;;
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.17, $b0.1
	c0	addcg $r0.16, $b0.2 = $r0.11, $r0.11, $b0.2
;;
	c0	addcg $r0.11, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.17, $b0.2
;;
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.17, $b0.1
	c0	addcg $r0.16, $b0.2 = $r0.11, $r0.11, $b0.2
;;
	c0	addcg $r0.11, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.17, $b0.2
	c0	cmpgeu $r0.16 = $r0.14, $r0.10
;;
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.17, $b0.1
	c0	addcg $r0.17, $b0.2 = $r0.11, $r0.11, $b0.2
;;
	c0	cmpge $b0.2 = $r0.12, $r0.0
	c0	addcg $r0.11, $b0.1 = $r0.17, $r0.17, $b0.1
;;
	c0	orc $r0.11 = $r0.11, $r0.0
;;
	c0	mfb $r0.12 = $b0.2
;;
	c0	sh1add $r0.11 = $r0.11, $r0.12
;;
	c0	slct $r0.11 = $b0.0, $r0.16, $r0.11
;;
	c0	shl $r0.12 = $r0.11, $r0.2
	c0	goto LBB64_68
;;
LBB64_64:                               ## %if.end.88.estimateDiv64To32.exit314_crit_edge
	c0	zxth $r0.11 = $r0.9
	c0	mov $r0.12 = -1
	c0	goto LBB64_75
;;
LBB64_66:
	c0	mov $r0.12 = -65536
;;
LBB64_68:                               ## %cond.end.i.286
	c0	shru $r0.16 = $r0.12, $r0.2
	c0	zxth $r0.11 = $r0.9
	c0	mov $r0.17 = -1
;;
	c0	mpyhs $r0.18 = $r0.16, $r0.10
	c0	mpyhs $r0.19 = $r0.16, $r0.11
;;
	c0	mpylu $r0.20 = $r0.16, $r0.11
	c0	mpylu $r0.16 = $r0.16, $r0.10
;;
;;
	c0	add $r0.19 = $r0.20, $r0.19
	c0	add $r0.16 = $r0.16, $r0.18
;;
	c0	shl $r0.18 = $r0.19, $r0.2
	c0	shru $r0.19 = $r0.19, $r0.2
	c0	sub $r0.20 = $r0.14, $r0.16
;;
	c0	cmpltu $r0.21 = $r0.15, $r0.18
	c0	sub $r0.16 = $r0.15, $r0.18
	c0	sub $r0.18 = $r0.20, $r0.19
;;
	c0	mtb $b0.0 = $r0.21
;;
;;
	c0	slct $r0.17 = $b0.0, $r0.17, 0
;;
	c0	add $r0.17 = $r0.18, $r0.17
;;
	c0	cmpgt $b0.0 = $r0.17, -1
;;
;;
	c0	br $b0.0, LBB64_71
;;
## BB#69:                               ## %while.body.lr.ph.i.288
	c0	shl $r0.18 = $r0.9, $r0.2
;;
LBB64_70:                               ## %while.body.i.299
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.16 = $r0.16, $r0.18
	c0	add $r0.17 = $r0.17, $r0.10
	c0	add $r0.12 = $r0.12, -65536
;;
	c0	cmpltu $r0.19 = $r0.16, $r0.18
;;
	c0	add $r0.17 = $r0.17, $r0.19
;;
	c0	cmplt $b0.0 = $r0.17, 0
;;
;;
	c0	br $b0.0, LBB64_70
;;
LBB64_71:                               ## %while.end.i.307
	c0	shl $r0.17 = $r0.17, $r0.2
	c0	shru $r0.16 = $r0.16, $r0.2
;;
	c0	or $r0.16 = $r0.16, $r0.17
;;
	c0	cmpleu $b0.0 = $r0.13, $r0.16
;;
;;
	c0	br $b0.0, LBB64_72
;;
## BB#73:                               ## %cond.false.10.i.309
	c0	cmplt $r0.13 = $r0.10, $r0.0
	c0	mov $r0.17 = 0
;;
	c0	shru $r0.18 = $r0.16, $r0.13
	c0	mtb $b0.0 = $r0.17
	c0	shru $r0.19 = $r0.10, $r0.13
	c0	mtb $b0.1 = $r0.17
;;
;;
	c0	addcg $r0.17, $b0.0 = $r0.18, $r0.18, $b0.0
;;
	c0	divs $r0.18, $b0.0 = $r0.0, $r0.19, $b0.0
	c0	addcg $r0.20, $b0.1 = $r0.17, $r0.17, $b0.1
;;
	c0	addcg $r0.17, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.18, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.2 = $r0.17, $r0.19, $b0.0
	c0	mtb $b0.0 = $r0.13
;;
	c0	addcg $r0.13, $b0.2 = $r0.20, $r0.20, $b0.2
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.13, $b0.2 = $r0.17, $r0.19, $b0.2
;;
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.19, $b0.1
	c0	addcg $r0.17, $b0.2 = $r0.18, $r0.18, $b0.2
;;
	c0	addcg $r0.18, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.19, $b0.2
;;
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.19, $b0.1
	c0	cmpgeu $r0.16 = $r0.16, $r0.10
	c0	addcg $r0.17, $b0.2 = $r0.18, $r0.18, $b0.2
;;
	c0	cmpge $b0.2 = $r0.13, $r0.0
	c0	addcg $r0.13, $b0.1 = $r0.17, $r0.17, $b0.1
;;
	c0	orc $r0.13 = $r0.13, $r0.0
;;
	c0	mfb $r0.17 = $b0.2
;;
	c0	sh1add $r0.13 = $r0.13, $r0.17
;;
	c0	slct $r0.13 = $b0.0, $r0.16, $r0.13
	c0	goto LBB64_74
;;
LBB64_72:
	c0	mov $r0.13 = 65535
;;
LBB64_74:                               ## %cond.end.12.i.312
	c0	or $r0.12 = $r0.13, $r0.12
;;
LBB64_75:                               ## %estimateDiv64To32.exit314
	c0	mov $r0.16 = 5
	c0	shru $r0.18 = $r0.12, $r0.2
	c0	zxth $r0.19 = $r0.12
;;
	c0	and $r0.13 = $r0.8, 63488
	c0	shru $r0.6 = $r0.6, $r0.16
	c0	mpyhs $r0.16 = $r0.19, $r0.10
;;
	c0	mpylu $r0.20 = $r0.19, $r0.10
	c0	mov $r0.17 = -1
	c0	zxth $r0.6 = $r0.6
	c0	mpylu $r0.21 = $r0.18, $r0.11
;;
	c0	mpyhs $r0.22 = $r0.18, $r0.11
	c0	mpyhs $r0.23 = $r0.18, $r0.13
;;
	c0	mpylu $r0.24 = $r0.18, $r0.13
	c0	add $r0.16 = $r0.20, $r0.16
	c0	mpylu $r0.20 = $r0.19, $r0.11
;;
	c0	mpyhs $r0.25 = $r0.19, $r0.11
	c0	add $r0.21 = $r0.21, $r0.22
;;
	c0	add $r0.22 = $r0.24, $r0.23
	c0	mpyhs $r0.23 = $r0.19, $r0.6
	c0	mpylu $r0.24 = $r0.19, $r0.6
	c0	add $r0.16 = $r0.21, $r0.16
;;
	c0	add $r0.20 = $r0.20, $r0.25
	c0	mpyhs $r0.25 = $r0.19, $r0.13
	c0	mpylu $r0.19 = $r0.19, $r0.13
	c0	shl $r0.26 = $r0.16, $r0.2
;;
	c0	mpyhs $r0.27 = $r0.18, $r0.6
	c0	mpylu $r0.28 = $r0.18, $r0.6
;;
	c0	mpylu $r0.29 = $r0.18, $r0.10
	c0	mpyhs $r0.18 = $r0.18, $r0.10
	c0	add $r0.23 = $r0.24, $r0.23
;;
	c0	add $r0.23 = $r0.22, $r0.23
	c0	add $r0.19 = $r0.19, $r0.25
	c0	add $r0.24 = $r0.28, $r0.27
;;
	c0	cmpltu $r0.22 = $r0.23, $r0.22
	c0	add $r0.20 = $r0.26, $r0.20
	c0	shl $r0.25 = $r0.23, $r0.2
	c0	shru $r0.23 = $r0.23, $r0.2
;;
	c0	shl $r0.22 = $r0.22, $r0.2
	c0	add $r0.24 = $r0.20, $r0.24
	c0	add $r0.19 = $r0.25, $r0.19
;;
	c0	or $r0.22 = $r0.22, $r0.23
	c0	cmpltu $r0.23 = $r0.19, $r0.25
	c0	cmpne $b0.1 = $r0.19, 0
;;
	c0	add $r0.22 = $r0.24, $r0.22
	c0	cmpltu $r0.24 = $r0.20, $r0.26
;;
	c0	mtb $b0.0 = $r0.24
	c0	add $r0.22 = $r0.22, $r0.23
	c0	mfb $r0.23 = $b0.1
;;
	c0	sub $r0.24 = $r0.15, $r0.22
	c0	cmpltu $r0.20 = $r0.22, $r0.20
	c0	cmpltu $r0.15 = $r0.15, $r0.22
;;
	c0	mtb $b0.1 = $r0.20
	c0	mtb $b0.2 = $r0.15
	c0	cmpltu $r0.15 = $r0.24, $r0.23
;;
	c0	mtb $b0.3 = $r0.15
	c0	mov $r0.15 = 0
	c0	add $r0.18 = $r0.29, $r0.18
;;
	c0	sub $r0.14 = $r0.14, $r0.18
	c0	shru $r0.18 = $r0.16, $r0.2
	c0	cmpltu $r0.16 = $r0.16, $r0.21
;;
	c0	shl $r0.16 = $r0.16, $r0.2
;;
	c0	or $r0.16 = $r0.16, $r0.18
;;
	c0	sub $r0.14 = $r0.14, $r0.16
	c0	sub $r0.16 = $r0.15, $r0.19
	c0	mfb $r0.18 = $b0.0
;;
	c0	add $r0.18 = $r0.14, $r0.18
	c0	sub $r0.14 = $r0.24, $r0.23
	c0	slct $r0.19 = $b0.1, $r0.17, 0
	c0	slct $r0.20 = $b0.2, $r0.17, 0
;;
	c0	slct $r0.21 = $b0.3, $r0.17, 0
	c0	add $r0.18 = $r0.18, $r0.19
;;
	c0	add $r0.18 = $r0.18, $r0.20
;;
	c0	add $r0.18 = $r0.18, $r0.21
;;
	c0	cmpgt $b0.0 = $r0.18, -1
;;
;;
	c0	br $b0.0, LBB64_77
;;
LBB64_76:                               ## %while.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.16 = $r0.8, $r0.16
	c0	add $r0.19 = $r0.14, $r0.9
;;
	c0	cmpltu $r0.20 = $r0.16, $r0.8
	c0	cmpltu $r0.14 = $r0.19, $r0.14
	c0	add $r0.12 = $r0.12, -1
;;
	c0	add $r0.18 = $r0.14, $r0.18
	c0	add $r0.14 = $r0.20, $r0.19
;;
	c0	cmpltu $r0.19 = $r0.14, $r0.20
;;
	c0	add $r0.18 = $r0.18, $r0.19
;;
	c0	cmplt $b0.0 = $r0.18, 0
;;
;;
	c0	br $b0.0, LBB64_76
;;
LBB64_77:                               ## %while.end
	c0	cmpleu $b0.0 = $r0.9, $r0.14
;;
;;
	c0	br $b0.0, LBB64_91
;;
## BB#78:                               ## %if.end.i
	c0	shl $r0.19 = $r0.10, $r0.2
;;
	c0	cmpleu $b0.0 = $r0.19, $r0.14
;;
;;
	c0	br $b0.0, LBB64_79
;;
## BB#80:                               ## %cond.false.i
	c0	cmplt $r0.17 = $r0.10, $r0.0
	c0	mov $r0.18 = 0
;;
	c0	shru $r0.20 = $r0.14, $r0.17
	c0	mtb $b0.0 = $r0.18
	c0	shru $r0.21 = $r0.10, $r0.17
	c0	mtb $b0.1 = $r0.18
;;
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
;;
	c0	divs $r0.20, $b0.0 = $r0.0, $r0.21, $b0.0
	c0	addcg $r0.22, $b0.1 = $r0.18, $r0.18, $b0.1
;;
	c0	addcg $r0.18, $b0.0 = $r0.22, $r0.22, $b0.0
	c0	divs $r0.20, $b0.1 = $r0.20, $r0.21, $b0.1
;;
	c0	addcg $r0.22, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.18, $b0.0 = $r0.20, $r0.21, $b0.0
;;
	c0	addcg $r0.20, $b0.0 = $r0.22, $r0.22, $b0.0
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.21, $b0.1
;;
	c0	addcg $r0.22, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.18, $b0.0 = $r0.18, $r0.21, $b0.0
;;
	c0	addcg $r0.20, $b0.0 = $r0.22, $r0.22, $b0.0
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.21, $b0.1
;;
	c0	addcg $r0.22, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.18, $b0.0 = $r0.18, $r0.21, $b0.0
;;
	c0	addcg $r0.20, $b0.0 = $r0.22, $r0.22, $b0.0
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.21, $b0.1
;;
	c0	addcg $r0.22, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.18, $b0.0 = $r0.18, $r0.21, $b0.0
;;
	c0	addcg $r0.20, $b0.0 = $r0.22, $r0.22, $b0.0
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.21, $b0.1
;;
	c0	addcg $r0.22, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.18, $b0.0 = $r0.18, $r0.21, $b0.0
;;
	c0	addcg $r0.20, $b0.0 = $r0.22, $r0.22, $b0.0
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.21, $b0.1
;;
	c0	addcg $r0.22, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.18, $b0.0 = $r0.18, $r0.21, $b0.0
;;
	c0	addcg $r0.20, $b0.0 = $r0.22, $r0.22, $b0.0
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.21, $b0.1
;;
	c0	addcg $r0.22, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.18, $b0.0 = $r0.18, $r0.21, $b0.0
;;
	c0	addcg $r0.20, $b0.0 = $r0.22, $r0.22, $b0.0
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.21, $b0.1
;;
	c0	addcg $r0.22, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.18, $b0.0 = $r0.18, $r0.21, $b0.0
;;
	c0	addcg $r0.20, $b0.0 = $r0.22, $r0.22, $b0.0
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.21, $b0.1
;;
	c0	addcg $r0.22, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.18, $b0.0 = $r0.18, $r0.21, $b0.0
;;
	c0	addcg $r0.20, $b0.0 = $r0.22, $r0.22, $b0.0
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.21, $b0.1
;;
	c0	addcg $r0.22, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.18, $b0.0 = $r0.18, $r0.21, $b0.0
;;
	c0	addcg $r0.20, $b0.0 = $r0.22, $r0.22, $b0.0
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.21, $b0.1
;;
	c0	addcg $r0.22, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.18, $b0.0 = $r0.18, $r0.21, $b0.0
;;
	c0	addcg $r0.20, $b0.2 = $r0.22, $r0.22, $b0.0
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.21, $b0.1
	c0	mtb $b0.0 = $r0.17
;;
	c0	addcg $r0.17, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.18, $b0.2 = $r0.18, $r0.21, $b0.2
;;
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.21, $b0.1
	c0	addcg $r0.20, $b0.2 = $r0.17, $r0.17, $b0.2
;;
	c0	addcg $r0.17, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.18, $b0.2 = $r0.18, $r0.21, $b0.2
;;
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.21, $b0.1
	c0	addcg $r0.20, $b0.2 = $r0.17, $r0.17, $b0.2
;;
	c0	addcg $r0.17, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.18, $b0.2 = $r0.18, $r0.21, $b0.2
;;
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.21, $b0.1
	c0	addcg $r0.20, $b0.2 = $r0.17, $r0.17, $b0.2
;;
	c0	addcg $r0.17, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.18, $b0.2 = $r0.18, $r0.21, $b0.2
	c0	cmpgeu $r0.20 = $r0.14, $r0.10
;;
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.21, $b0.1
	c0	addcg $r0.21, $b0.2 = $r0.17, $r0.17, $b0.2
;;
	c0	cmpge $b0.2 = $r0.18, $r0.0
	c0	addcg $r0.17, $b0.1 = $r0.21, $r0.21, $b0.1
;;
	c0	orc $r0.17 = $r0.17, $r0.0
;;
	c0	mfb $r0.18 = $b0.2
;;
	c0	sh1add $r0.17 = $r0.17, $r0.18
;;
	c0	slct $r0.17 = $b0.0, $r0.20, $r0.17
;;
	c0	shl $r0.17 = $r0.17, $r0.2
	c0	goto LBB64_81
;;
LBB64_79:
	c0	mov $r0.17 = -65536
;;
LBB64_81:                               ## %cond.end.i
	c0	shru $r0.20 = $r0.17, $r0.2
	c0	mov $r0.18 = -1
;;
	c0	mpyhs $r0.21 = $r0.20, $r0.11
	c0	mpylu $r0.22 = $r0.20, $r0.11
;;
	c0	mpyhs $r0.23 = $r0.20, $r0.10
	c0	mpylu $r0.20 = $r0.20, $r0.10
;;
	c0	add $r0.21 = $r0.22, $r0.21
;;
	c0	add $r0.20 = $r0.20, $r0.23
	c0	shl $r0.22 = $r0.21, $r0.2
	c0	shru $r0.21 = $r0.21, $r0.2
;;
	c0	sub $r0.23 = $r0.14, $r0.20
	c0	cmpltu $r0.24 = $r0.16, $r0.22
	c0	sub $r0.20 = $r0.16, $r0.22
;;
	c0	sub $r0.21 = $r0.23, $r0.21
	c0	mtb $b0.0 = $r0.24
;;
;;
	c0	slct $r0.22 = $b0.0, $r0.18, 0
;;
	c0	add $r0.21 = $r0.21, $r0.22
;;
	c0	cmpgt $b0.0 = $r0.21, -1
;;
;;
	c0	br $b0.0, LBB64_84
;;
## BB#82:                               ## %while.body.lr.ph.i
	c0	shl $r0.22 = $r0.9, $r0.2
;;
LBB64_83:                               ## %while.body.i
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.20 = $r0.20, $r0.22
	c0	add $r0.21 = $r0.21, $r0.10
	c0	add $r0.17 = $r0.17, -65536
;;
	c0	cmpltu $r0.23 = $r0.20, $r0.22
;;
	c0	add $r0.21 = $r0.21, $r0.23
;;
	c0	cmplt $b0.0 = $r0.21, 0
;;
;;
	c0	br $b0.0, LBB64_83
;;
LBB64_84:                               ## %while.end.i
	c0	shl $r0.21 = $r0.21, $r0.2
	c0	shru $r0.20 = $r0.20, $r0.2
;;
	c0	or $r0.20 = $r0.20, $r0.21
;;
	c0	cmpleu $b0.0 = $r0.19, $r0.20
;;
;;
	c0	br $b0.0, LBB64_85
;;
## BB#86:                               ## %cond.false.10.i
	c0	cmplt $r0.19 = $r0.10, $r0.0
	c0	mov $r0.21 = 0
;;
	c0	shru $r0.22 = $r0.20, $r0.19
	c0	mtb $b0.0 = $r0.21
	c0	shru $r0.23 = $r0.10, $r0.19
	c0	mtb $b0.1 = $r0.21
;;
;;
	c0	addcg $r0.21, $b0.0 = $r0.22, $r0.22, $b0.0
;;
	c0	divs $r0.22, $b0.0 = $r0.0, $r0.23, $b0.0
	c0	addcg $r0.24, $b0.1 = $r0.21, $r0.21, $b0.1
;;
	c0	addcg $r0.21, $b0.0 = $r0.24, $r0.24, $b0.0
	c0	divs $r0.22, $b0.1 = $r0.22, $r0.23, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.21, $r0.21, $b0.1
	c0	divs $r0.21, $b0.0 = $r0.22, $r0.23, $b0.0
;;
	c0	addcg $r0.22, $b0.0 = $r0.24, $r0.24, $b0.0
	c0	divs $r0.21, $b0.1 = $r0.21, $r0.23, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.22, $r0.22, $b0.1
	c0	divs $r0.21, $b0.0 = $r0.21, $r0.23, $b0.0
;;
	c0	addcg $r0.22, $b0.0 = $r0.24, $r0.24, $b0.0
	c0	divs $r0.21, $b0.1 = $r0.21, $r0.23, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.22, $r0.22, $b0.1
	c0	divs $r0.21, $b0.0 = $r0.21, $r0.23, $b0.0
;;
	c0	addcg $r0.22, $b0.0 = $r0.24, $r0.24, $b0.0
	c0	divs $r0.21, $b0.1 = $r0.21, $r0.23, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.22, $r0.22, $b0.1
	c0	divs $r0.21, $b0.0 = $r0.21, $r0.23, $b0.0
;;
	c0	addcg $r0.22, $b0.0 = $r0.24, $r0.24, $b0.0
	c0	divs $r0.21, $b0.1 = $r0.21, $r0.23, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.22, $r0.22, $b0.1
	c0	divs $r0.21, $b0.0 = $r0.21, $r0.23, $b0.0
;;
	c0	addcg $r0.22, $b0.0 = $r0.24, $r0.24, $b0.0
	c0	divs $r0.21, $b0.1 = $r0.21, $r0.23, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.22, $r0.22, $b0.1
	c0	divs $r0.21, $b0.0 = $r0.21, $r0.23, $b0.0
;;
	c0	addcg $r0.22, $b0.0 = $r0.24, $r0.24, $b0.0
	c0	divs $r0.21, $b0.1 = $r0.21, $r0.23, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.22, $r0.22, $b0.1
	c0	divs $r0.21, $b0.0 = $r0.21, $r0.23, $b0.0
;;
	c0	addcg $r0.22, $b0.0 = $r0.24, $r0.24, $b0.0
	c0	divs $r0.21, $b0.1 = $r0.21, $r0.23, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.22, $r0.22, $b0.1
	c0	divs $r0.21, $b0.0 = $r0.21, $r0.23, $b0.0
;;
	c0	addcg $r0.22, $b0.0 = $r0.24, $r0.24, $b0.0
	c0	divs $r0.21, $b0.1 = $r0.21, $r0.23, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.22, $r0.22, $b0.1
	c0	divs $r0.21, $b0.0 = $r0.21, $r0.23, $b0.0
;;
	c0	addcg $r0.22, $b0.0 = $r0.24, $r0.24, $b0.0
	c0	divs $r0.21, $b0.1 = $r0.21, $r0.23, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.22, $r0.22, $b0.1
	c0	divs $r0.21, $b0.0 = $r0.21, $r0.23, $b0.0
;;
	c0	addcg $r0.22, $b0.0 = $r0.24, $r0.24, $b0.0
	c0	divs $r0.21, $b0.1 = $r0.21, $r0.23, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.22, $r0.22, $b0.1
	c0	divs $r0.21, $b0.0 = $r0.21, $r0.23, $b0.0
;;
	c0	addcg $r0.22, $b0.0 = $r0.24, $r0.24, $b0.0
	c0	divs $r0.21, $b0.1 = $r0.21, $r0.23, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.22, $r0.22, $b0.1
	c0	divs $r0.21, $b0.0 = $r0.21, $r0.23, $b0.0
;;
	c0	addcg $r0.22, $b0.0 = $r0.24, $r0.24, $b0.0
	c0	divs $r0.21, $b0.1 = $r0.21, $r0.23, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.22, $r0.22, $b0.1
	c0	divs $r0.21, $b0.2 = $r0.21, $r0.23, $b0.0
	c0	mtb $b0.0 = $r0.19
;;
	c0	addcg $r0.19, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.21, $b0.1 = $r0.21, $r0.23, $b0.1
;;
	c0	addcg $r0.22, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.19, $b0.2 = $r0.21, $r0.23, $b0.2
;;
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.23, $b0.1
	c0	addcg $r0.21, $b0.2 = $r0.22, $r0.22, $b0.2
;;
	c0	addcg $r0.22, $b0.1 = $r0.21, $r0.21, $b0.1
	c0	divs $r0.19, $b0.2 = $r0.19, $r0.23, $b0.2
;;
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.23, $b0.1
	c0	cmpgeu $r0.20 = $r0.20, $r0.10
	c0	addcg $r0.21, $b0.2 = $r0.22, $r0.22, $b0.2
;;
	c0	cmpge $b0.2 = $r0.19, $r0.0
	c0	addcg $r0.19, $b0.1 = $r0.21, $r0.21, $b0.1
;;
	c0	orc $r0.19 = $r0.19, $r0.0
;;
	c0	mfb $r0.21 = $b0.2
;;
	c0	sh1add $r0.19 = $r0.19, $r0.21
;;
	c0	slct $r0.19 = $b0.0, $r0.20, $r0.19
	c0	goto LBB64_87
;;
LBB64_85:
	c0	mov $r0.19 = 65535
;;
LBB64_87:                               ## %estimateDiv64To32.exit
	c0	or $r0.17 = $r0.19, $r0.17
;;
	c0	and $r0.19 = $r0.17, 1023
;;
	c0	cmpgtu $b0.0 = $r0.19, 4
;;
;;
	c0	br $b0.0, LBB64_91
;;
## BB#88:                               ## %if.then.93
	c0	shru $r0.19 = $r0.17, $r0.2
	c0	zxth $r0.20 = $r0.17
;;
	c0	mpylu $r0.21 = $r0.19, $r0.13
	c0	mpyhs $r0.22 = $r0.19, $r0.13
;;
	c0	mpyhs $r0.23 = $r0.20, $r0.6
	c0	mpylu $r0.24 = $r0.20, $r0.6
;;
	c0	add $r0.21 = $r0.21, $r0.22
	c0	mpyhs $r0.22 = $r0.20, $r0.10
	c0	mpylu $r0.25 = $r0.20, $r0.10
;;
	c0	add $r0.23 = $r0.24, $r0.23
	c0	mpyhs $r0.24 = $r0.19, $r0.11
	c0	mpylu $r0.26 = $r0.19, $r0.11
;;
	c0	add $r0.22 = $r0.25, $r0.22
	c0	add $r0.23 = $r0.21, $r0.23
;;
	c0	add $r0.24 = $r0.26, $r0.24
	c0	mpylu $r0.25 = $r0.20, $r0.11
	c0	mpyhs $r0.11 = $r0.20, $r0.11
	c0	cmpltu $r0.21 = $r0.23, $r0.21
;;
	c0	add $r0.22 = $r0.24, $r0.22
	c0	mpylu $r0.26 = $r0.19, $r0.6
	c0	mpyhs $r0.6 = $r0.19, $r0.6
	c0	shru $r0.27 = $r0.23, $r0.2
;;
	c0	mpyhs $r0.28 = $r0.20, $r0.13
	c0	mpylu $r0.13 = $r0.20, $r0.13
	c0	shl $r0.20 = $r0.22, $r0.2
	c0	add $r0.11 = $r0.25, $r0.11
;;
	c0	add $r0.11 = $r0.20, $r0.11
	c0	shl $r0.21 = $r0.21, $r0.2
	c0	add $r0.6 = $r0.26, $r0.6
	c0	shl $r0.23 = $r0.23, $r0.2
;;
	c0	add $r0.13 = $r0.13, $r0.28
	c0	or $r0.21 = $r0.21, $r0.27
	c0	add $r0.6 = $r0.11, $r0.6
	c0	mpyhs $r0.25 = $r0.19, $r0.10
;;
	c0	add $r0.13 = $r0.23, $r0.13
	c0	add $r0.6 = $r0.6, $r0.21
;;
	c0	cmpltu $r0.21 = $r0.13, $r0.23
	c0	cmpne $b0.1 = $r0.13, 0
	c0	mpylu $r0.10 = $r0.19, $r0.10
	c0	cmpltu $r0.19 = $r0.11, $r0.20
;;
	c0	mtb $b0.0 = $r0.19
	c0	add $r0.6 = $r0.6, $r0.21
;;
	c0	mfb $r0.19 = $b0.1
	c0	sub $r0.20 = $r0.16, $r0.6
	c0	cmpltu $r0.11 = $r0.6, $r0.11
	c0	cmpltu $r0.6 = $r0.16, $r0.6
;;
	c0	mtb $b0.1 = $r0.11
	c0	mtb $b0.2 = $r0.6
	c0	cmpltu $r0.6 = $r0.20, $r0.19
;;
	c0	mtb $b0.3 = $r0.6
	c0	add $r0.6 = $r0.10, $r0.25
;;
	c0	sub $r0.6 = $r0.14, $r0.6
	c0	cmpltu $r0.10 = $r0.22, $r0.24
	c0	shru $r0.11 = $r0.22, $r0.2
;;
	c0	shl $r0.10 = $r0.10, $r0.2
	c0	sub $r0.2 = $r0.15, $r0.13
;;
	c0	or $r0.10 = $r0.10, $r0.11
;;
	c0	sub $r0.6 = $r0.6, $r0.10
	c0	mfb $r0.11 = $b0.0
	c0	sub $r0.10 = $r0.20, $r0.19
;;
	c0	add $r0.6 = $r0.6, $r0.11
	c0	slct $r0.11 = $b0.1, $r0.18, 0
	c0	slct $r0.13 = $b0.2, $r0.18, 0
	c0	slct $r0.14 = $b0.3, $r0.18, 0
;;
	c0	add $r0.6 = $r0.6, $r0.11
;;
	c0	add $r0.6 = $r0.6, $r0.13
;;
	c0	add $r0.6 = $r0.6, $r0.14
;;
	c0	cmpgt $b0.0 = $r0.6, -1
;;
;;
	c0	br $b0.0, LBB64_90
;;
LBB64_89:                               ## %while.body.96
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.2 = $r0.8, $r0.2
	c0	add $r0.11 = $r0.10, $r0.9
;;
	c0	cmpltu $r0.13 = $r0.2, $r0.8
	c0	cmpltu $r0.10 = $r0.11, $r0.10
	c0	add $r0.17 = $r0.17, -1
;;
	c0	add $r0.6 = $r0.10, $r0.6
	c0	add $r0.10 = $r0.13, $r0.11
;;
	c0	cmpltu $r0.11 = $r0.10, $r0.13
;;
	c0	add $r0.6 = $r0.6, $r0.11
;;
	c0	cmplt $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB64_89
;;
LBB64_90:                               ## %while.end.98
	c0	or $r0.6 = $r0.10, $r0.6
;;
	c0	or $r0.2 = $r0.6, $r0.2
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	or $r0.17 = $r0.2, $r0.17
;;
LBB64_91:                               ## %if.end.103
	c0	shru $r0.2 = $r0.17, $r0.5
	c0	shl $r0.6 = $r0.12, $r0.7
	c0	shl $r0.7 = $r0.17, $r0.7
	c0	shru $r0.5 = $r0.12, $r0.5
;;
	c0	or $r0.6 = $r0.2, $r0.6
;;
.call roundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = roundAndPackFloat64
;;
	c0	mov $r0.2 = $r0.3
;;
LBB64_92:                               ## %cleanup
	c0	mov $r0.3 = $r0.2
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

#.globl float64_rem
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_rem
float64_rem::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $l0.0
	c0	mov $r0.8 = 20
	c0	mov $r0.2 = $r0.3
;;
	c0	shru $r0.3 = $r0.2, $r0.8
;;
	c0	and $r0.7 = $r0.3, 2047
	c0	shru $r0.10 = $r0.5, $r0.8
;;
	c0	cmpne $b0.0 = $r0.7, 2047
	c0	and $r0.9 = $r0.2, 1048575
;;
	c0	mov $r0.3 = $r0.4
	c0	and $r0.8 = $r0.5, 1048575
;;
	c0	and $r0.4 = $r0.10, 2047
;;
	c0	br $b0.0, LBB65_18
;;
## BB#1:                                ## %if.then
	c0	or $r0.7 = $r0.9, $r0.3
;;
	c0	cmpne $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB65_4
;;
## BB#2:                                ## %lor.lhs.false
	c0	cmpne $b0.0 = $r0.4, 2047
;;
;;
	c0	br $b0.0, LBB65_36
;;
## BB#3:                                ## %lor.lhs.false
	c0	or $r0.4 = $r0.8, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB65_36
;;
LBB65_4:                                ## %if.then.30
	c0	and $r0.4 = $r0.2, 2146959360
;;
	c0	cmpne $b0.0 = $r0.4, 2146435072
;;
;;
	c0	br $b0.0, LBB65_5
;;
## BB#6:                                ## %land.rhs.i.59.i.475
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	brf $b0.0, LBB65_8
;;
## BB#7:
	c0	mov $r0.4 = -1
;;
	c0	mtb $b0.2 = $r0.4
	c0	goto LBB65_9
;;
LBB65_18:                               ## %if.end.36
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	brf $b0.0, LBB65_19
;;
## BB#35:                               ## %if.then.50
	c0	or $r0.4 = $r0.8, $r0.6
;;
	c0	cmpne $b0.0 = $r0.4, 0
;;
;;
	c0	brf $b0.0, LBB65_36
;;
## BB#37:                               ## %if.end.56
	c0	cmpne $b0.0 = $r0.8, 0
;;
;;
	c0	brf $b0.0, LBB65_38
;;
## BB#42:                               ## %if.else.7.i.452
	c0	cmpltu $b0.0 = $r0.8, 65536
	c0	mov $r0.4 = 16
	c0	mov $r0.10 = 8
;;
	c0	mov $r0.11 = 22
	c0	shl $r0.4 = $r0.5, $r0.4
	c0	mov $r0.5 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	mov $r0.12 = 4
	c0	mfb $r0.13 = $b0.0
	c0	slct $r0.4 = $b0.0, $r0.4, $r0.8
;;
	c0	shl $r0.12 = $r0.13, $r0.12
	c0	cmpltu $b0.0 = $r0.4, 16777216
	c0	shl $r0.10 = $r0.4, $r0.10
;;
	c0	or $r0.13 = $r0.12, 8
;;
	c0	slct $r0.4 = $b0.0, $r0.10, $r0.4
	c0	slct $r0.10 = $b0.0, $r0.13, $r0.12
;;
	c0	shru $r0.4 = $r0.4, $r0.11
;;
	c0	and $r0.4 = $r0.4, 1020
;;
	c0	add $r0.4 = $r0.5, $r0.4
;;
	c0	ldw $r0.4 = 0[$r0.4]
;;
;;
	c0	add $r0.4 = $r0.4, $r0.10
;;
	c0	add $r0.5 = $r0.4, -11
;;
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB65_44
;;
## BB#43:                               ## %cond.false.i.i.458
	c0	mov $r0.10 = 11
	c0	shl $r0.8 = $r0.8, $r0.5
;;
	c0	sub $r0.10 = $r0.10, $r0.4
;;
	c0	and $r0.10 = $r0.10, 31
;;
	c0	shru $r0.10 = $r0.6, $r0.10
;;
	c0	or $r0.8 = $r0.10, $r0.8
;;
LBB65_44:                               ## %shortShift64Left.exit.i.461
	c0	mov $r0.10 = 12
	c0	shl $r0.6 = $r0.6, $r0.5
;;
	c0	sub $r0.4 = $r0.10, $r0.4
	c0	goto LBB65_45
;;
LBB65_19:                               ## %if.end.36
	c0	cmpne $b0.0 = $r0.4, 2047
;;
;;
	c0	br $b0.0, LBB65_45
;;
## BB#20:                               ## %if.then.38
	c0	or $r0.4 = $r0.8, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB65_103
;;
## BB#21:                               ## %if.then.41
	c0	and $r0.4 = $r0.2, 2146959360
;;
	c0	cmpne $b0.0 = $r0.4, 2146435072
;;
;;
	c0	br $b0.0, LBB65_22
;;
## BB#23:                               ## %land.rhs.i.59.i
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	brf $b0.0, LBB65_25
;;
## BB#24:
	c0	mov $r0.4 = -1
;;
	c0	mtb $b0.1 = $r0.4
	c0	goto LBB65_26
;;
LBB65_5:
	c0	mov $r0.4 = 0
;;
	c0	mtb $b0.2 = $r0.4
	c0	goto LBB65_9
;;
LBB65_36:                               ## %invalid
	c0	mov $r0.4 = float_exception_flags
;;
	c0	ldw $r0.5 = 0[$r0.4]
	c0	mov $r0.3 = -1
	c0	mov $r0.2 = 2147483647
;;
;;
	c0	or $r0.5 = $r0.5, 16
;;
	c0	stw 0[$r0.4] = $r0.5
	c0	goto LBB65_103
;;
LBB65_8:                                ## %lor.rhs.i.62.i.478
	c0	and $r0.4 = $r0.2, 524287
;;
	c0	cmpne $b0.2 = $r0.4, 0
;;
LBB65_9:                                ## %float64_is_signaling_nan.exit64.i.481
	c0	mov $r0.4 = 1
	c0	or $r0.7 = $r0.8, $r0.6
;;
	c0	shl $r0.4 = $r0.5, $r0.4
	c0	cmpne $b0.0 = $r0.7, 0
;;
	c0	cmpgtu $b0.1 = $r0.4, -2097153
	c0	and $r0.4 = $r0.5, 2146959360
;;
	c0	cmpne $b0.3 = $r0.4, 2146435072
	c0	mfb $r0.4 = $b0.0
;;
	c0	mfb $r0.7 = $b0.1
;;
	c0	and $r0.4 = $r0.7, $r0.4
;;
	c0	mtb $b0.0 = $r0.4
	c0	br $b0.3, LBB65_10
;;
## BB#11:                               ## %land.rhs.i.i.491
	c0	cmpeq $b0.1 = $r0.6, 0
;;
;;
	c0	br $b0.1, LBB65_14
;;
## BB#12:                               ## %float64_is_signaling_nan.exit.thread.i.494
	c0	mov $r0.7 = -1
	c0	or $r0.2 = $r0.2, 524288
;;
	c0	or $r0.4 = $r0.5, 524288
	c0	mtb $b0.1 = $r0.7
	c0	goto LBB65_13
;;
LBB65_10:
	c0	mov $r0.4 = 0
;;
	c0	mtb $b0.1 = $r0.4
	c0	goto LBB65_15
;;
LBB65_14:                               ## %lor.rhs.i.i.497
	c0	and $r0.4 = $r0.5, 524287
;;
	c0	cmpne $b0.1 = $r0.4, 0
;;
LBB65_15:                               ## %float64_is_signaling_nan.exit.i.501
	c0	mfb $r0.7 = $b0.1
	c0	mfb $r0.8 = $b0.2
	c0	or $r0.4 = $r0.5, 524288
;;
	c0	or $r0.2 = $r0.2, 524288
	c0	or $r0.5 = $r0.8, $r0.7
;;
	c0	and $r0.5 = $r0.5, 1
;;
	c0	cmpeq $b0.2 = $r0.5, 0
;;
;;
	c0	br $b0.2, LBB65_16
;;
LBB65_13:                               ## %if.then.i.505
	c0	mov $r0.5 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.5]
	c0	mov $r0.8 = -1
;;
	c0	mtb $b0.2 = $r0.8
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.5] = $r0.7
	c0	goto LBB65_17
;;
LBB65_16:
	c0	mov $r0.5 = 0
;;
	c0	mtb $b0.2 = $r0.5
;;
;;
	c0	mfb $r0.11 = $b0.2
;;
	c0	mtb $b0.1 = $r0.11
;;
LBB65_17:                               ## %propagateFloat64NaN.exit520
	c0	slct $r0.5 = $b0.0, $r0.6, $r0.3
	c0	slct $r0.3 = $b0.1, $r0.6, $r0.3
	c0	slct $r0.6 = $b0.1, $r0.4, $r0.2
	c0	slct $r0.2 = $b0.0, $r0.4, $r0.2
;;
	c0	slct $r0.2 = $b0.2, $r0.6, $r0.2
	c0	slct $r0.3 = $b0.2, $r0.3, $r0.5
	c0	goto LBB65_103
;;
LBB65_38:                               ## %if.then.i.426
	c0	mov $r0.4 = 16
	c0	cmpltu $b0.0 = $r0.6, 65536
	c0	mov $r0.5 = 8
;;
	c0	mov $r0.8 = 22
	c0	shl $r0.4 = $r0.6, $r0.4
	c0	mov $r0.10 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	mov $r0.11 = 4
	c0	slct $r0.4 = $b0.0, $r0.4, $r0.6
;;
	c0	cmpltu $b0.1 = $r0.4, 16777216
	c0	shl $r0.5 = $r0.4, $r0.5
;;
;;
	c0	slct $r0.4 = $b0.1, $r0.5, $r0.4
;;
	c0	shru $r0.4 = $r0.4, $r0.8
	c0	mfb $r0.5 = $b0.0
;;
	c0	and $r0.4 = $r0.4, 1020
	c0	shl $r0.5 = $r0.5, $r0.11
;;
	c0	add $r0.4 = $r0.10, $r0.4
	c0	or $r0.8 = $r0.5, 8
;;
	c0	ldw $r0.4 = 0[$r0.4]
	c0	slct $r0.5 = $b0.1, $r0.8, $r0.5
;;
;;
	c0	add $r0.4 = $r0.4, $r0.5
;;
	c0	cmpgt $b0.0 = $r0.4, 10
	c0	add $r0.5 = $r0.4, -11
;;
;;
	c0	br $b0.0, LBB65_40
;;
## BB#39:                               ## %if.then.2.i.431
	c0	mov $r0.8 = 11
	c0	and $r0.5 = $r0.5, 31
;;
	c0	sub $r0.8 = $r0.8, $r0.4
;;
	c0	shru $r0.8 = $r0.6, $r0.8
	c0	shl $r0.6 = $r0.6, $r0.5
	c0	goto LBB65_41
;;
LBB65_22:
	c0	mov $r0.4 = 0
;;
	c0	mtb $b0.1 = $r0.4
	c0	goto LBB65_26
;;
LBB65_40:                               ## %if.else.i.433
	c0	mov $r0.10 = 0
	c0	shl $r0.8 = $r0.6, $r0.5
;;
	c0	mov $r0.6 = $r0.10
;;
LBB65_41:                               ## %if.end.i.436
	c0	mov $r0.5 = -20
;;
	c0	sub $r0.4 = $r0.5, $r0.4
;;
LBB65_45:                               ## %if.end.57
	c0	cmpne $b0.0 = $r0.7, 0
;;
;;
	c0	brf $b0.0, LBB65_47
;;
## BB#46:
	c0	mov $r0.13 = $r0.3
	c0	goto LBB65_56
;;
LBB65_47:                               ## %if.then.59
	c0	or $r0.5 = $r0.9, $r0.3
;;
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB65_103
;;
## BB#48:                               ## %if.end.63
	c0	cmpne $b0.0 = $r0.9, 0
;;
;;
	c0	brf $b0.0, LBB65_49
;;
## BB#53:                               ## %if.else.7.i
	c0	cmpltu $b0.0 = $r0.9, 65536
	c0	mov $r0.5 = 16
	c0	mov $r0.7 = 8
;;
	c0	mov $r0.10 = 22
	c0	shl $r0.5 = $r0.2, $r0.5
	c0	mov $r0.11 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	mov $r0.12 = 4
	c0	mfb $r0.13 = $b0.0
	c0	slct $r0.5 = $b0.0, $r0.5, $r0.9
;;
	c0	shl $r0.12 = $r0.13, $r0.12
	c0	cmpltu $b0.0 = $r0.5, 16777216
	c0	shl $r0.7 = $r0.5, $r0.7
;;
	c0	or $r0.13 = $r0.12, 8
;;
	c0	slct $r0.5 = $b0.0, $r0.7, $r0.5
	c0	slct $r0.7 = $b0.0, $r0.13, $r0.12
;;
	c0	shru $r0.5 = $r0.5, $r0.10
;;
	c0	and $r0.5 = $r0.5, 1020
;;
	c0	add $r0.5 = $r0.11, $r0.5
;;
	c0	ldw $r0.5 = 0[$r0.5]
;;
;;
	c0	add $r0.5 = $r0.5, $r0.7
;;
	c0	add $r0.7 = $r0.5, -11
;;
	c0	cmpeq $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB65_55
;;
## BB#54:                               ## %cond.false.i.i
	c0	mov $r0.10 = 11
	c0	shl $r0.9 = $r0.9, $r0.7
;;
	c0	sub $r0.10 = $r0.10, $r0.5
;;
	c0	and $r0.10 = $r0.10, 31
;;
	c0	shru $r0.10 = $r0.3, $r0.10
;;
	c0	or $r0.9 = $r0.10, $r0.9
;;
LBB65_55:                               ## %shortShift64Left.exit.i
	c0	mov $r0.10 = 12
	c0	shl $r0.13 = $r0.3, $r0.7
;;
	c0	sub $r0.7 = $r0.10, $r0.5
	c0	goto LBB65_56
;;
LBB65_49:                               ## %if.then.i
	c0	mov $r0.5 = 16
	c0	cmpltu $b0.0 = $r0.3, 65536
	c0	mov $r0.7 = 8
;;
	c0	mov $r0.9 = 22
	c0	shl $r0.5 = $r0.3, $r0.5
	c0	mov $r0.10 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	mov $r0.11 = 4
	c0	slct $r0.5 = $b0.0, $r0.5, $r0.3
;;
	c0	cmpltu $b0.1 = $r0.5, 16777216
	c0	shl $r0.7 = $r0.5, $r0.7
;;
;;
	c0	slct $r0.5 = $b0.1, $r0.7, $r0.5
;;
	c0	shru $r0.5 = $r0.5, $r0.9
	c0	mfb $r0.7 = $b0.0
;;
	c0	and $r0.5 = $r0.5, 1020
	c0	shl $r0.7 = $r0.7, $r0.11
;;
	c0	add $r0.5 = $r0.10, $r0.5
	c0	or $r0.9 = $r0.7, 8
;;
	c0	ldw $r0.5 = 0[$r0.5]
	c0	slct $r0.7 = $b0.1, $r0.9, $r0.7
;;
;;
	c0	add $r0.5 = $r0.5, $r0.7
;;
	c0	cmpgt $b0.0 = $r0.5, 10
	c0	add $r0.7 = $r0.5, -11
;;
;;
	c0	br $b0.0, LBB65_51
;;
## BB#50:                               ## %if.then.2.i.406
	c0	mov $r0.9 = 11
	c0	and $r0.7 = $r0.7, 31
;;
	c0	sub $r0.9 = $r0.9, $r0.5
	c0	shl $r0.13 = $r0.3, $r0.7
;;
	c0	shru $r0.9 = $r0.3, $r0.9
	c0	goto LBB65_52
;;
LBB65_25:                               ## %lor.rhs.i.62.i
	c0	and $r0.4 = $r0.2, 524287
;;
	c0	cmpne $b0.1 = $r0.4, 0
;;
LBB65_26:                               ## %float64_is_signaling_nan.exit64.i
	c0	and $r0.4 = $r0.5, 2146959360
	c0	mov $r0.7 = 1
;;
	c0	cmpne $b0.0 = $r0.4, 2146435072
	c0	shl $r0.4 = $r0.5, $r0.7
;;
;;
	c0	br $b0.0, LBB65_27
;;
## BB#28:                               ## %land.rhs.i.i
	c0	cmpeq $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB65_31
;;
## BB#29:                               ## %float64_is_signaling_nan.exit.thread.i
	c0	mov $r0.7 = -1
	c0	or $r0.2 = $r0.2, 524288
;;
	c0	or $r0.5 = $r0.5, 524288
	c0	mtb $b0.0 = $r0.7
	c0	goto LBB65_30
;;
LBB65_27:
	c0	mov $r0.7 = 0
;;
	c0	mtb $b0.0 = $r0.7
	c0	goto LBB65_32
;;
LBB65_31:                               ## %lor.rhs.i.i
	c0	and $r0.7 = $r0.5, 524287
;;
	c0	cmpne $b0.0 = $r0.7, 0
;;
LBB65_32:                               ## %float64_is_signaling_nan.exit.i
	c0	mfb $r0.7 = $b0.0
	c0	mfb $r0.8 = $b0.1
	c0	or $r0.5 = $r0.5, 524288
;;
	c0	or $r0.2 = $r0.2, 524288
	c0	or $r0.7 = $r0.8, $r0.7
;;
	c0	and $r0.7 = $r0.7, 1
;;
	c0	cmpeq $b0.1 = $r0.7, 0
;;
;;
	c0	br $b0.1, LBB65_33
;;
LBB65_30:                               ## %if.then.i.470
	c0	mov $r0.7 = float_exception_flags
;;
	c0	ldw $r0.8 = 0[$r0.7]
	c0	mov $r0.9 = -1
;;
	c0	mtb $b0.1 = $r0.9
;;
	c0	or $r0.8 = $r0.8, 16
;;
	c0	stw 0[$r0.7] = $r0.8
	c0	goto LBB65_34
;;
LBB65_33:
	c0	mov $r0.7 = 0
;;
	c0	mtb $b0.1 = $r0.7
;;
;;
	c0	mfb $r0.11 = $b0.1
;;
	c0	mtb $b0.0 = $r0.11
;;
LBB65_34:                               ## %propagateFloat64NaN.exit
	c0	cmpgtu $b0.2 = $r0.4, -2097153
	c0	slct $r0.4 = $b0.0, $r0.6, $r0.3
	c0	slct $r0.7 = $b0.0, $r0.5, $r0.2
;;
;;
	c0	slct $r0.2 = $b0.2, $r0.5, $r0.2
	c0	slct $r0.3 = $b0.2, $r0.6, $r0.3
;;
	c0	slct $r0.2 = $b0.1, $r0.7, $r0.2
	c0	slct $r0.3 = $b0.1, $r0.4, $r0.3
	c0	goto LBB65_103
;;
LBB65_51:                               ## %if.else.i.408
	c0	mov $r0.13 = 0
	c0	shl $r0.9 = $r0.3, $r0.7
;;
LBB65_52:                               ## %if.end.i.409
	c0	mov $r0.7 = -20
;;
	c0	sub $r0.7 = $r0.7, $r0.5
;;
LBB65_56:                               ## %if.end.64
	c0	sub $r0.11 = $r0.7, $r0.4
;;
	c0	cmplt $b0.0 = $r0.11, -1
;;
;;
	c0	br $b0.0, LBB65_103
;;
## BB#57:                               ## %if.end.67
	c0	mov $r0.7 = 31
	c0	mov $r0.10 = 11
	c0	mov $r0.3 = 0
	c0	mov $r0.5 = 21
;;
	c0	shru $r0.12 = $r0.11, $r0.7
	c0	shl $r0.8 = $r0.8, $r0.10
	c0	or $r0.14 = $r0.9, 1048576
;;
	c0	shru $r0.9 = $r0.6, $r0.5
	c0	sub $r0.15 = $r0.10, $r0.12
	c0	or $r0.5 = $r0.8, -2147483648
;;
	c0	shl $r0.19 = $r0.6, $r0.10
	c0	shl $r0.12 = $r0.13, $r0.15
	c0	shl $r0.8 = $r0.14, $r0.15
	c0	sub $r0.14 = $r0.3, $r0.15
;;
	c0	or $r0.10 = $r0.9, $r0.5
	c0	and $r0.14 = $r0.14, 23
;;
	c0	shru $r0.13 = $r0.13, $r0.14
;;
	c0	or $r0.8 = $r0.13, $r0.8
;;
	c0	cmpgtu $b0.0 = $r0.8, $r0.10
;;
;;
	c0	brf $b0.0, LBB65_59
;;
## BB#58:
	c0	mov $r0.26 = 1
	c0	goto LBB65_60
;;
LBB65_59:                               ## %le64.exit
	c0	cmpeq $b0.0 = $r0.8, $r0.10
	c0	cmpgeu $b0.1 = $r0.12, $r0.19
;;
;;
	c0	mfb $r0.13 = $b0.0
	c0	mfb $r0.14 = $b0.1
;;
	c0	and $r0.13 = $r0.14, $r0.13
;;
	c0	and $r0.26 = $r0.13, 1
;;
	c0	cmpeq $b0.0 = $r0.26, 0
;;
;;
	c0	br $b0.0, LBB65_61
;;
LBB65_60:                               ## %if.then.74
	c0	cmpltu $r0.13 = $r0.12, $r0.19
	c0	mov $r0.14 = -1
	c0	sub $r0.8 = $r0.8, $r0.10
	c0	sub $r0.12 = $r0.12, $r0.19
;;
	c0	mtb $b0.0 = $r0.13
;;
;;
	c0	slct $r0.13 = $b0.0, $r0.14, 0
;;
	c0	add $r0.8 = $r0.8, $r0.13
;;
LBB65_61:                               ## %if.end.75
	c0	cmplt $b0.0 = $r0.11, 33
	c0	add $r0.11 = $r0.11, -32
;;
;;
	c0	br $b0.0, LBB65_72
;;
## BB#62:                               ## %while.body.lr.ph
	c0	mov $r0.13 = 16
	c0	mov $r0.21 = 5
;;
	c0	shru $r0.14 = $r0.5, $r0.13
	c0	zxth $r0.15 = $r0.10
	c0	mov $r0.16 = 0
;;
	c0	mov $r0.17 = -65536
	c0	mov $r0.18 = -1
;;
	c0	and $r0.19 = $r0.19, 63488
	c0	mov $r0.20 = 65535
;;
	c0	shru $r0.24 = $r0.6, $r0.21
	c0	shl $r0.21 = $r0.10, $r0.13
	c0	cmplt $r0.22 = $r0.14, $r0.0
	c0	shl $r0.23 = $r0.14, $r0.13
;;
	c0	zxth $r0.24 = $r0.24
	c0	mtb $b0.0 = $r0.22
	c0	shru $r0.25 = $r0.14, $r0.22
;;
LBB65_63:                               ## %while.body
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB65_67 Depth 2
	c0	cmpleu $b0.1 = $r0.10, $r0.8
	c0	mov $r0.26 = $r0.18
;;
;;
	c0	br $b0.1, LBB65_71
;;
## BB#64:                               ## %if.end.i.327
                                        ##   in Loop: Header=BB65_63 Depth=1
	c0	cmpleu $b0.1 = $r0.23, $r0.8
	c0	mov $r0.26 = $r0.17
;;
;;
	c0	br $b0.1, LBB65_66
;;
## BB#65:                               ## %cond.false.i.330
                                        ##   in Loop: Header=BB65_63 Depth=1
	c0	shru $r0.26 = $r0.8, $r0.22
	c0	mtb $b0.1 = $r0.16
	c0	mtb $b0.2 = $r0.16
	c0	cmpgeu $r0.27 = $r0.8, $r0.14
;;
;;
	c0	addcg $r0.28, $b0.1 = $r0.26, $r0.26, $b0.1
;;
	c0	divs $r0.26, $b0.1 = $r0.0, $r0.25, $b0.1
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
;;
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.25, $b0.2
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.25, $b0.1
;;
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.25, $b0.2
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.25, $b0.1
;;
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.25, $b0.2
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.25, $b0.1
;;
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.25, $b0.2
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.25, $b0.1
;;
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.25, $b0.2
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.25, $b0.1
;;
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.25, $b0.2
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.25, $b0.1
;;
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.25, $b0.2
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.25, $b0.1
;;
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.25, $b0.2
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.25, $b0.1
;;
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.25, $b0.2
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.25, $b0.1
;;
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.25, $b0.2
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.25, $b0.1
;;
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.25, $b0.2
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.25, $b0.1
;;
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.25, $b0.2
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.25, $b0.1
;;
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.25, $b0.2
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.25, $b0.1
;;
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.25, $b0.2
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.25, $b0.1
;;
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.25, $b0.2
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.25, $b0.1
;;
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.25, $b0.2
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
;;
	c0	cmpge $b0.1 = $r0.26, $r0.0
	c0	addcg $r0.26, $b0.2 = $r0.28, $r0.28, $b0.2
;;
	c0	orc $r0.26 = $r0.26, $r0.0
;;
	c0	mfb $r0.28 = $b0.1
;;
	c0	sh1add $r0.26 = $r0.26, $r0.28
;;
	c0	slct $r0.26 = $b0.0, $r0.27, $r0.26
;;
	c0	shl $r0.26 = $r0.26, $r0.13
;;
LBB65_66:                               ## %cond.end.i.345
                                        ##   in Loop: Header=BB65_63 Depth=1
	c0	shru $r0.27 = $r0.26, $r0.13
;;
	c0	mpylu $r0.28 = $r0.27, $r0.15
	c0	mpyhs $r0.29 = $r0.27, $r0.15
;;
	c0	mpylu $r0.30 = $r0.27, $r0.14
	c0	mpyhs $r0.27 = $r0.27, $r0.14
;;
	c0	add $r0.28 = $r0.28, $r0.29
;;
	c0	add $r0.27 = $r0.30, $r0.27
	c0	shl $r0.29 = $r0.28, $r0.13
	c0	shru $r0.28 = $r0.28, $r0.13
;;
	c0	sub $r0.30 = $r0.8, $r0.27
	c0	cmpltu $r0.31 = $r0.12, $r0.29
	c0	sub $r0.27 = $r0.12, $r0.29
;;
	c0	sub $r0.28 = $r0.30, $r0.28
	c0	mtb $b0.1 = $r0.31
;;
;;
	c0	slct $r0.29 = $b0.1, $r0.18, 0
;;
	c0	add $r0.28 = $r0.28, $r0.29
;;
	c0	cmpgt $b0.1 = $r0.28, -1
;;
;;
	c0	br $b0.1, LBB65_68
;;
LBB65_67:                               ## %while.body.i.358
                                        ##   Parent Loop BB65_63 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	add $r0.27 = $r0.27, $r0.21
	c0	add $r0.28 = $r0.28, $r0.14
	c0	add $r0.26 = $r0.26, -65536
;;
	c0	cmpltu $r0.29 = $r0.27, $r0.21
;;
	c0	add $r0.28 = $r0.28, $r0.29
;;
	c0	cmplt $b0.1 = $r0.28, 0
;;
;;
	c0	br $b0.1, LBB65_67
;;
LBB65_68:                               ## %while.end.i.366
                                        ##   in Loop: Header=BB65_63 Depth=1
	c0	shl $r0.28 = $r0.28, $r0.13
	c0	shru $r0.29 = $r0.27, $r0.13
	c0	mov $r0.27 = $r0.20
;;
	c0	or $r0.28 = $r0.29, $r0.28
;;
	c0	cmpleu $b0.1 = $r0.23, $r0.28
;;
;;
	c0	br $b0.1, LBB65_70
;;
## BB#69:                               ## %cond.false.10.i.368
                                        ##   in Loop: Header=BB65_63 Depth=1
	c0	shru $r0.27 = $r0.28, $r0.22
	c0	mtb $b0.1 = $r0.16
	c0	mtb $b0.2 = $r0.16
	c0	cmpgeu $r0.28 = $r0.28, $r0.14
;;
;;
	c0	addcg $r0.29, $b0.1 = $r0.27, $r0.27, $b0.1
;;
	c0	divs $r0.27, $b0.1 = $r0.0, $r0.25, $b0.1
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
;;
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
	c0	divs $r0.27, $b0.2 = $r0.27, $r0.25, $b0.2
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.27, $b0.1 = $r0.27, $r0.25, $b0.1
;;
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
	c0	divs $r0.27, $b0.2 = $r0.27, $r0.25, $b0.2
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.27, $b0.1 = $r0.27, $r0.25, $b0.1
;;
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
	c0	divs $r0.27, $b0.2 = $r0.27, $r0.25, $b0.2
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.27, $b0.1 = $r0.27, $r0.25, $b0.1
;;
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
	c0	divs $r0.27, $b0.2 = $r0.27, $r0.25, $b0.2
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.27, $b0.1 = $r0.27, $r0.25, $b0.1
;;
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
	c0	divs $r0.27, $b0.2 = $r0.27, $r0.25, $b0.2
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.27, $b0.1 = $r0.27, $r0.25, $b0.1
;;
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
	c0	divs $r0.27, $b0.2 = $r0.27, $r0.25, $b0.2
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.27, $b0.1 = $r0.27, $r0.25, $b0.1
;;
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
	c0	divs $r0.27, $b0.2 = $r0.27, $r0.25, $b0.2
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.27, $b0.1 = $r0.27, $r0.25, $b0.1
;;
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
	c0	divs $r0.27, $b0.2 = $r0.27, $r0.25, $b0.2
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.27, $b0.1 = $r0.27, $r0.25, $b0.1
;;
	c0	divs $r0.27, $b0.2 = $r0.27, $r0.25, $b0.2
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.27, $b0.1 = $r0.27, $r0.25, $b0.1
;;
	c0	divs $r0.27, $b0.2 = $r0.27, $r0.25, $b0.2
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.27, $b0.1 = $r0.27, $r0.25, $b0.1
;;
	c0	divs $r0.27, $b0.2 = $r0.27, $r0.25, $b0.2
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.27, $b0.1 = $r0.27, $r0.25, $b0.1
;;
	c0	divs $r0.27, $b0.2 = $r0.27, $r0.25, $b0.2
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.27, $b0.1 = $r0.27, $r0.25, $b0.1
;;
	c0	divs $r0.27, $b0.2 = $r0.27, $r0.25, $b0.2
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.27, $b0.1 = $r0.27, $r0.25, $b0.1
;;
	c0	divs $r0.27, $b0.2 = $r0.27, $r0.25, $b0.2
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.27, $b0.1 = $r0.27, $r0.25, $b0.1
;;
	c0	divs $r0.27, $b0.2 = $r0.27, $r0.25, $b0.2
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.27, $b0.1 = $r0.27, $r0.25, $b0.1
;;
	c0	divs $r0.27, $b0.2 = $r0.27, $r0.25, $b0.2
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
;;
	c0	cmpge $b0.1 = $r0.27, $r0.0
	c0	addcg $r0.27, $b0.2 = $r0.29, $r0.29, $b0.2
;;
	c0	orc $r0.27 = $r0.27, $r0.0
;;
	c0	mfb $r0.29 = $b0.1
;;
	c0	sh1add $r0.27 = $r0.27, $r0.29
;;
	c0	slct $r0.27 = $b0.0, $r0.28, $r0.27
;;
LBB65_70:                               ## %cond.end.12.i.371
                                        ##   in Loop: Header=BB65_63 Depth=1
	c0	or $r0.26 = $r0.27, $r0.26
;;
LBB65_71:                               ## %estimateDiv64To32.exit373
                                        ##   in Loop: Header=BB65_63 Depth=1
	c0	cmpgtu $b0.2 = $r0.26, 4
	c0	add $r0.26 = $r0.26, -4
	c0	mov $r0.27 = 29
	c0	mov $r0.28 = 3
;;
	c0	shl $r0.8 = $r0.8, $r0.27
	c0	shru $r0.12 = $r0.12, $r0.28
	c0	cmpgt $b0.1 = $r0.11, 29
	c0	add $r0.11 = $r0.11, -29
;;
	c0	slct $r0.26 = $b0.2, $r0.26, 0
;;
	c0	zxth $r0.29 = $r0.26
	c0	shru $r0.30 = $r0.26, $r0.13
;;
	c0	mpylu $r0.31 = $r0.30, $r0.19
	c0	mpyhs $r0.32 = $r0.30, $r0.19
;;
	c0	mpyhs $r0.33 = $r0.29, $r0.14
	c0	mpylu $r0.34 = $r0.29, $r0.14
;;
	c0	mpylu $r0.35 = $r0.29, $r0.24
	c0	mpyhs $r0.36 = $r0.29, $r0.24
;;
	c0	mpylu $r0.37 = $r0.30, $r0.15
	c0	mpyhs $r0.38 = $r0.30, $r0.15
;;
	c0	mpyhs $r0.39 = $r0.29, $r0.19
	c0	mpylu $r0.40 = $r0.29, $r0.19
;;
	c0	mpylu $r0.41 = $r0.30, $r0.24
	c0	mpyhs $r0.42 = $r0.30, $r0.24
;;
	c0	mpylu $r0.43 = $r0.29, $r0.15
	c0	mpyhs $r0.29 = $r0.29, $r0.15
	c0	add $r0.33 = $r0.34, $r0.33
	c0	add $r0.31 = $r0.31, $r0.32
;;
	c0	add $r0.32 = $r0.35, $r0.36
	c0	add $r0.34 = $r0.37, $r0.38
	c0	mpyhs $r0.35 = $r0.30, $r0.14
	c0	add $r0.36 = $r0.40, $r0.39
;;
	c0	add $r0.32 = $r0.31, $r0.32
	c0	add $r0.33 = $r0.34, $r0.33
	c0	add $r0.29 = $r0.43, $r0.29
	c0	add $r0.34 = $r0.41, $r0.42
;;
	c0	cmpltu $r0.31 = $r0.32, $r0.31
	c0	shl $r0.37 = $r0.33, $r0.13
	c0	shru $r0.38 = $r0.32, $r0.13
	c0	shl $r0.32 = $r0.32, $r0.13
;;
	c0	shl $r0.31 = $r0.31, $r0.13
	c0	add $r0.29 = $r0.37, $r0.29
	c0	mpylu $r0.30 = $r0.30, $r0.14
	c0	add $r0.36 = $r0.32, $r0.36
;;
	c0	or $r0.31 = $r0.31, $r0.38
	c0	add $r0.34 = $r0.29, $r0.34
	c0	cmpltu $r0.32 = $r0.36, $r0.32
;;
	c0	add $r0.31 = $r0.34, $r0.31
;;
	c0	add $r0.31 = $r0.31, $r0.32
;;
	c0	cmpltu $b0.2 = $r0.31, $r0.29
	c0	or $r0.8 = $r0.8, $r0.12
	c0	add $r0.12 = $r0.30, $r0.35
	c0	shru $r0.30 = $r0.36, $r0.28
;;
	c0	shl $r0.32 = $r0.31, $r0.27
	c0	shru $r0.33 = $r0.33, $r0.13
;;
	c0	add $r0.12 = $r0.33, $r0.12
	c0	cmpltu $r0.29 = $r0.29, $r0.37
	c0	or $r0.30 = $r0.32, $r0.30
;;
	c0	add $r0.29 = $r0.12, $r0.29
	c0	shru $r0.28 = $r0.31, $r0.28
	c0	cmpne $r0.31 = $r0.30, 0
	c0	sub $r0.12 = $r0.16, $r0.30
;;
	c0	mfb $r0.30 = $b0.2
	c0	mtb $b0.2 = $r0.31
;;
	c0	add $r0.29 = $r0.29, $r0.30
;;
	c0	shl $r0.27 = $r0.29, $r0.27
	c0	slct $r0.29 = $b0.2, $r0.18, 0
;;
	c0	or $r0.27 = $r0.27, $r0.28
	c0	add $r0.8 = $r0.29, $r0.8
;;
	c0	sub $r0.8 = $r0.8, $r0.27
	c0	br $b0.1, LBB65_63
;;
LBB65_72:                               ## %while.end
	c0	cmplt $b0.0 = $r0.11, -31
;;
;;
	c0	br $b0.0, LBB65_94
;;
## BB#73:                               ## %if.then.86
	c0	cmpleu $b0.0 = $r0.10, $r0.8
;;
;;
	c0	br $b0.0, LBB65_74
;;
## BB#75:                               ## %if.end.i
	c0	mov $r0.16 = 16
;;
	c0	shru $r0.13 = $r0.5, $r0.16
;;
	c0	shl $r0.15 = $r0.13, $r0.16
;;
	c0	cmpleu $b0.0 = $r0.15, $r0.8
;;
;;
	c0	br $b0.0, LBB65_76
;;
## BB#77:                               ## %cond.false.i.248
	c0	cmplt $r0.14 = $r0.13, $r0.0
	c0	mov $r0.17 = 0
;;
	c0	shru $r0.18 = $r0.8, $r0.14
	c0	mtb $b0.0 = $r0.17
	c0	shru $r0.19 = $r0.13, $r0.14
	c0	mtb $b0.1 = $r0.17
;;
;;
	c0	addcg $r0.17, $b0.0 = $r0.18, $r0.18, $b0.0
;;
	c0	divs $r0.18, $b0.0 = $r0.0, $r0.19, $b0.0
	c0	addcg $r0.20, $b0.1 = $r0.17, $r0.17, $b0.1
;;
	c0	addcg $r0.17, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.18, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.2 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
	c0	mtb $b0.0 = $r0.14
;;
	c0	addcg $r0.14, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.2 = $r0.17, $r0.19, $b0.2
;;
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
	c0	addcg $r0.18, $b0.2 = $r0.14, $r0.14, $b0.2
;;
	c0	addcg $r0.14, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.2 = $r0.17, $r0.19, $b0.2
;;
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
	c0	addcg $r0.18, $b0.2 = $r0.14, $r0.14, $b0.2
;;
	c0	addcg $r0.14, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.2 = $r0.17, $r0.19, $b0.2
;;
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
	c0	addcg $r0.18, $b0.2 = $r0.14, $r0.14, $b0.2
;;
	c0	addcg $r0.14, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.2 = $r0.17, $r0.19, $b0.2
	c0	cmpgeu $r0.18 = $r0.8, $r0.13
;;
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
	c0	addcg $r0.19, $b0.2 = $r0.14, $r0.14, $b0.2
;;
	c0	cmpge $b0.2 = $r0.17, $r0.0
	c0	addcg $r0.14, $b0.1 = $r0.19, $r0.19, $b0.1
;;
	c0	orc $r0.14 = $r0.14, $r0.0
;;
	c0	mfb $r0.17 = $b0.2
;;
	c0	sh1add $r0.14 = $r0.14, $r0.17
;;
	c0	slct $r0.14 = $b0.0, $r0.18, $r0.14
;;
	c0	shl $r0.14 = $r0.14, $r0.16
	c0	goto LBB65_78
;;
LBB65_94:                               ## %if.else.101
	c0	mov $r0.5 = 3
	c0	mov $r0.11 = 8
	c0	mov $r0.13 = 24
;;
	c0	shru $r0.10 = $r0.10, $r0.11
	c0	shru $r0.12 = $r0.12, $r0.11
	c0	shl $r0.9 = $r0.9, $r0.13
	c0	shl $r0.13 = $r0.8, $r0.13
;;
	c0	shru $r0.8 = $r0.8, $r0.11
	c0	shl $r0.5 = $r0.6, $r0.5
;;
	c0	and $r0.5 = $r0.5, 16777208
	c0	or $r0.11 = $r0.13, $r0.12
;;
	c0	or $r0.9 = $r0.9, $r0.5
	c0	goto LBB65_95
;;
LBB65_74:
	c0	mov $r0.13 = -1
	c0	goto LBB65_85
;;
LBB65_76:
	c0	mov $r0.14 = -65536
;;
LBB65_78:                               ## %cond.end.i
	c0	shru $r0.17 = $r0.14, $r0.16
	c0	zxth $r0.18 = $r0.10
	c0	mov $r0.19 = -1
;;
	c0	mpylu $r0.20 = $r0.17, $r0.13
	c0	mpyhs $r0.21 = $r0.17, $r0.18
;;
	c0	mpylu $r0.18 = $r0.17, $r0.18
	c0	mpyhs $r0.17 = $r0.17, $r0.13
;;
;;
	c0	add $r0.18 = $r0.18, $r0.21
	c0	add $r0.17 = $r0.20, $r0.17
;;
	c0	shl $r0.20 = $r0.18, $r0.16
	c0	shru $r0.18 = $r0.18, $r0.16
	c0	sub $r0.21 = $r0.8, $r0.17
;;
	c0	cmpltu $r0.22 = $r0.12, $r0.20
	c0	sub $r0.17 = $r0.12, $r0.20
	c0	sub $r0.18 = $r0.21, $r0.18
;;
	c0	mtb $b0.0 = $r0.22
;;
;;
	c0	slct $r0.19 = $b0.0, $r0.19, 0
;;
	c0	add $r0.18 = $r0.18, $r0.19
;;
	c0	cmpgt $b0.0 = $r0.18, -1
;;
;;
	c0	br $b0.0, LBB65_81
;;
## BB#79:                               ## %while.body.lr.ph.i
	c0	shl $r0.19 = $r0.10, $r0.16
;;
LBB65_80:                               ## %while.body.i
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.17 = $r0.17, $r0.19
	c0	add $r0.18 = $r0.18, $r0.13
	c0	add $r0.14 = $r0.14, -65536
;;
	c0	cmpltu $r0.20 = $r0.17, $r0.19
;;
	c0	add $r0.18 = $r0.18, $r0.20
;;
	c0	cmplt $b0.0 = $r0.18, 0
;;
;;
	c0	br $b0.0, LBB65_80
;;
LBB65_81:                               ## %while.end.i
	c0	shl $r0.18 = $r0.18, $r0.16
	c0	shru $r0.16 = $r0.17, $r0.16
;;
	c0	or $r0.16 = $r0.16, $r0.18
;;
	c0	cmpleu $b0.0 = $r0.15, $r0.16
;;
;;
	c0	br $b0.0, LBB65_82
;;
## BB#83:                               ## %cond.false.10.i
	c0	cmplt $r0.15 = $r0.13, $r0.0
	c0	mov $r0.17 = 0
;;
	c0	shru $r0.18 = $r0.16, $r0.15
	c0	mtb $b0.0 = $r0.17
	c0	shru $r0.19 = $r0.13, $r0.15
	c0	mtb $b0.1 = $r0.17
;;
;;
	c0	addcg $r0.17, $b0.0 = $r0.18, $r0.18, $b0.0
;;
	c0	divs $r0.18, $b0.0 = $r0.0, $r0.19, $b0.0
	c0	addcg $r0.20, $b0.1 = $r0.17, $r0.17, $b0.1
;;
	c0	addcg $r0.17, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.18, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.19, $b0.0
;;
	c0	addcg $r0.18, $b0.0 = $r0.20, $r0.20, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.20, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.17, $b0.2 = $r0.17, $r0.19, $b0.0
	c0	mtb $b0.0 = $r0.15
;;
	c0	addcg $r0.15, $b0.2 = $r0.20, $r0.20, $b0.2
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.19, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.15, $b0.2 = $r0.17, $r0.19, $b0.2
;;
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.19, $b0.1
	c0	addcg $r0.17, $b0.2 = $r0.18, $r0.18, $b0.2
;;
	c0	addcg $r0.18, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.15, $b0.2 = $r0.15, $r0.19, $b0.2
;;
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.19, $b0.1
	c0	cmpgeu $r0.13 = $r0.16, $r0.13
	c0	addcg $r0.16, $b0.2 = $r0.18, $r0.18, $b0.2
;;
	c0	cmpge $b0.2 = $r0.15, $r0.0
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
;;
	c0	orc $r0.15 = $r0.15, $r0.0
;;
	c0	mfb $r0.16 = $b0.2
;;
	c0	sh1add $r0.15 = $r0.15, $r0.16
;;
	c0	slct $r0.13 = $b0.0, $r0.13, $r0.15
	c0	goto LBB65_84
;;
LBB65_82:
	c0	mov $r0.13 = 65535
;;
LBB65_84:                               ## %cond.end.12.i
	c0	or $r0.13 = $r0.13, $r0.14
;;
LBB65_85:                               ## %estimateDiv64To32.exit
	c0	mov $r0.14 = 3
	c0	cmpgtu $b0.0 = $r0.13, 4
	c0	add $r0.15 = $r0.13, -4
	c0	mov $r0.13 = 24
;;
	c0	shl $r0.14 = $r0.6, $r0.14
	c0	sub $r0.6 = $r0.3, $r0.11
	c0	cmpgt $b0.1 = $r0.11, -25
	c0	mov $r0.16 = 8
;;
	c0	shl $r0.9 = $r0.9, $r0.13
	c0	shru $r0.10 = $r0.10, $r0.16
	c0	and $r0.16 = $r0.14, 16777208
;;
	c0	slct $r0.15 = $b0.0, $r0.15, 0
	c0	or $r0.9 = $r0.9, $r0.16
;;
	c0	shru $r0.26 = $r0.15, $r0.6
	c0	br $b0.1, LBB65_91
;;
## BB#86:                               ## %if.then.98
	c0	mov $r0.6 = -24
;;
	c0	sub $r0.6 = $r0.6, $r0.11
;;
	c0	cmpeq $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB65_87
;;
## BB#88:                               ## %if.else.i
	c0	cmpgt $b0.0 = $r0.6, 31
;;
;;
	c0	br $b0.0, LBB65_90
;;
## BB#89:                               ## %if.then.2.i
	c0	sub $r0.11 = $r0.3, $r0.6
;;
	c0	and $r0.11 = $r0.11, 31
;;
	c0	shl $r0.11 = $r0.8, $r0.11
	c0	shru $r0.12 = $r0.12, $r0.6
	c0	shru $r0.8 = $r0.8, $r0.6
;;
	c0	or $r0.6 = $r0.11, $r0.12
	c0	goto LBB65_93
;;
LBB65_91:                               ## %if.else
	c0	add $r0.15 = $r0.11, 24
;;
	c0	cmpeq $b0.0 = $r0.15, 0
	c0	shl $r0.6 = $r0.12, $r0.15
;;
;;
	c0	br $b0.0, LBB65_93
;;
## BB#92:                               ## %cond.false.i
	c0	mov $r0.16 = -24
	c0	shl $r0.8 = $r0.8, $r0.15
;;
	c0	sub $r0.11 = $r0.16, $r0.11
;;
	c0	and $r0.11 = $r0.11, 31
;;
	c0	shru $r0.11 = $r0.12, $r0.11
;;
	c0	or $r0.8 = $r0.11, $r0.8
	c0	goto LBB65_93
;;
LBB65_87:
	c0	mov $r0.6 = $r0.12
	c0	goto LBB65_93
;;
LBB65_90:                               ## %if.else.4.i
	c0	and $r0.11 = $r0.6, 31
	c0	cmplt $b0.0 = $r0.6, 64
;;
	c0	shru $r0.6 = $r0.8, $r0.11
	c0	mov $r0.8 = $r0.3
;;
	c0	slct $r0.6 = $b0.0, $r0.6, 0
;;
LBB65_93:                               ## %if.end.100
	c0	mov $r0.11 = 16
	c0	and $r0.12 = $r0.14, 65528
	c0	zxth $r0.14 = $r0.26
;;
	c0	shru $r0.5 = $r0.5, $r0.13
	c0	shru $r0.13 = $r0.9, $r0.11
	c0	shru $r0.15 = $r0.26, $r0.11
	c0	zxth $r0.16 = $r0.10
;;
	c0	mpylu $r0.17 = $r0.14, $r0.12
	c0	mpylu $r0.18 = $r0.15, $r0.12
;;
	c0	mpyhs $r0.19 = $r0.15, $r0.12
	c0	mpylu $r0.20 = $r0.14, $r0.13
;;
	c0	mpyhs $r0.21 = $r0.14, $r0.13
	c0	mpyhs $r0.12 = $r0.14, $r0.12
;;
	c0	add $r0.18 = $r0.18, $r0.19
;;
	c0	add $r0.19 = $r0.20, $r0.21
	c0	mpyhs $r0.20 = $r0.15, $r0.16
;;
	c0	add $r0.19 = $r0.18, $r0.19
	c0	mpylu $r0.21 = $r0.15, $r0.16
	c0	mpyhs $r0.22 = $r0.14, $r0.5
;;
	c0	mpylu $r0.5 = $r0.14, $r0.5
	c0	mpyhs $r0.23 = $r0.14, $r0.16
;;
	c0	mpylu $r0.14 = $r0.14, $r0.16
	c0	mpyhs $r0.16 = $r0.15, $r0.13
;;
	c0	mpylu $r0.13 = $r0.15, $r0.13
	c0	shl $r0.15 = $r0.19, $r0.11
	c0	add $r0.12 = $r0.17, $r0.12
;;
	c0	add $r0.12 = $r0.15, $r0.12
;;
	c0	cmpltu $r0.15 = $r0.12, $r0.15
;;
	c0	mtb $b0.0 = $r0.15
	c0	mov $r0.15 = -1
	c0	add $r0.14 = $r0.14, $r0.23
	c0	add $r0.5 = $r0.5, $r0.22
;;
	c0	add $r0.13 = $r0.13, $r0.16
	c0	add $r0.16 = $r0.21, $r0.20
;;
	c0	add $r0.13 = $r0.13, $r0.14
	c0	add $r0.5 = $r0.16, $r0.5
	c0	cmpltu $r0.14 = $r0.19, $r0.18
	c0	shru $r0.16 = $r0.19, $r0.11
;;
	c0	shl $r0.5 = $r0.5, $r0.11
	c0	shl $r0.14 = $r0.14, $r0.11
;;
	c0	add $r0.5 = $r0.13, $r0.5
	c0	cmpltu $r0.13 = $r0.6, $r0.12
	c0	sub $r0.11 = $r0.6, $r0.12
	c0	or $r0.6 = $r0.14, $r0.16
;;
	c0	mtb $b0.1 = $r0.13
	c0	add $r0.5 = $r0.5, $r0.6
	c0	mfb $r0.6 = $b0.0
;;
;;
	c0	slct $r0.12 = $b0.1, $r0.15, 0
	c0	sub $r0.5 = $r0.6, $r0.5
;;
	c0	add $r0.5 = $r0.5, $r0.8
;;
	c0	add $r0.8 = $r0.5, $r0.12
;;
LBB65_95:                               ## %do.body.preheader
	c0	shru $r0.2 = $r0.2, $r0.7
	c0	mov $r0.12 = -1
;;
LBB65_96:                               ## %do.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	mov $r0.6 = $r0.11
	c0	mov $r0.5 = $r0.8
;;
	c0	cmpltu $r0.8 = $r0.6, $r0.9
	c0	sub $r0.13 = $r0.5, $r0.10
;;
	c0	mtb $b0.0 = $r0.8
	c0	add $r0.26 = $r0.26, 1
	c0	sub $r0.11 = $r0.6, $r0.9
;;
;;
	c0	slct $r0.8 = $b0.0, $r0.12, 0
;;
	c0	add $r0.8 = $r0.13, $r0.8
;;
	c0	cmpgt $b0.0 = $r0.8, -1
;;
;;
	c0	br $b0.0, LBB65_96
;;
## BB#97:                               ## %do.end
	c0	add $r0.10 = $r0.11, $r0.6
	c0	add $r0.9 = $r0.8, $r0.5
;;
	c0	cmpltu $r0.13 = $r0.10, $r0.11
;;
	c0	add $r0.13 = $r0.9, $r0.13
;;
	c0	cmplt $b0.0 = $r0.13, 0
;;
;;
	c0	br $b0.0, LBB65_100
;;
## BB#98:                               ## %lor.lhs.false.107
	c0	and $r0.14 = $r0.26, 1
	c0	mov $r0.9 = 1
;;
	c0	cmpeq $b0.0 = $r0.14, 0
;;
;;
	c0	br $b0.0, LBB65_101
;;
## BB#99:                               ## %lor.lhs.false.107
	c0	or $r0.10 = $r0.13, $r0.10
;;
	c0	cmpne $b0.0 = $r0.10, 0
;;
;;
	c0	br $b0.0, LBB65_101
;;
LBB65_100:                              ## %if.end.114
	c0	cmpgt $b0.0 = $r0.5, -1
	c0	mov $r0.8 = $r0.5
	c0	shru $r0.9 = $r0.5, $r0.7
	c0	mov $r0.11 = $r0.6
;;
;;
	c0	br $b0.0, LBB65_102
;;
LBB65_101:                              ## %if.then.118
	c0	cmpne $r0.5 = $r0.11, 0
	c0	sub $r0.6 = $r0.3, $r0.11
;;
	c0	mtb $b0.0 = $r0.5
;;
;;
	c0	slct $r0.3 = $b0.0, $r0.12, 0
;;
	c0	sub $r0.5 = $r0.3, $r0.8
;;
LBB65_102:                              ## %if.end.119
	c0	add $r0.4 = $r0.4, -4
	c0	xor $r0.3 = $r0.9, $r0.2
;;
.call normalizeRoundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = normalizeRoundAndPackFloat64
;;
	c0	mov $r0.2 = $r0.4
;;
LBB65_103:                              ## %cleanup
	c0	mov $r0.4 = $r0.2
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @normalizeRoundAndPackFloat64
normalizeRoundAndPackFloat64::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $l0.0
	c0	mov $r0.2 = 16
	c0	mov $r0.8 = 8
	c0	cmpeq $b0.0 = $r0.5, 0
;;
	c0	mov $r0.9 = 22
	c0	mov $r0.10 = 4
	c0	mov $r0.11 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	slct $r0.5 = $b0.0, $r0.6, $r0.5
	c0	mov $r0.7 = 0
;;
	c0	cmpltu $b0.1 = $r0.5, 65536
	c0	shl $r0.2 = $r0.5, $r0.2
;;
;;
	c0	slct $r0.2 = $b0.1, $r0.2, $r0.5
	c0	mfb $r0.12 = $b0.1
;;
	c0	cmpltu $b0.1 = $r0.2, 16777216
	c0	shl $r0.8 = $r0.2, $r0.8
;;
;;
	c0	slct $r0.2 = $b0.1, $r0.8, $r0.2
;;
	c0	shru $r0.2 = $r0.2, $r0.9
;;
	c0	and $r0.2 = $r0.2, 1020
	c0	shl $r0.8 = $r0.12, $r0.10
;;
	c0	add $r0.2 = $r0.11, $r0.2
	c0	or $r0.9 = $r0.8, 8
;;
	c0	ldw $r0.2 = 0[$r0.2]
	c0	slct $r0.8 = $b0.1, $r0.9, $r0.8
;;
;;
	c0	add $r0.9 = $r0.2, $r0.8
;;
	c0	add $r0.2 = $r0.9, -11
	c0	add $r0.8 = $r0.4, -32
;;
	c0	cmplt $b0.1 = $r0.2, 0
	c0	slct $r0.4 = $b0.0, $r0.8, $r0.4
	c0	slct $r0.8 = $b0.0, $r0.7, $r0.6
;;
;;
	c0	br $b0.1, LBB66_3
;;
## BB#1:                                ## %if.then.3
	c0	cmpeq $b0.0 = $r0.2, 0
	c0	shl $r0.6 = $r0.8, $r0.2
;;
;;
	c0	br $b0.0, LBB66_13
;;
## BB#2:                                ## %cond.false.i
	c0	mov $r0.10 = 11
	c0	shl $r0.5 = $r0.5, $r0.2
;;
	c0	sub $r0.9 = $r0.10, $r0.9
;;
	c0	and $r0.9 = $r0.9, 31
;;
	c0	shru $r0.8 = $r0.8, $r0.9
;;
	c0	or $r0.5 = $r0.8, $r0.5
	c0	goto LBB66_13
;;
LBB66_3:                                ## %if.else
	c0	mov $r0.6 = 11
;;
	c0	sub $r0.6 = $r0.6, $r0.9
;;
	c0	cmpeq $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB66_4
;;
## BB#5:                                ## %if.else.i
	c0	sub $r0.7 = $r0.7, $r0.6
	c0	cmpgt $b0.0 = $r0.6, 31
;;
	c0	and $r0.9 = $r0.7, 31
;;
	c0	br $b0.0, LBB66_7
;;
## BB#6:                                ## %if.then.2.i
	c0	shru $r0.10 = $r0.8, $r0.6
	c0	shl $r0.11 = $r0.5, $r0.9
	c0	shl $r0.9 = $r0.8, $r0.9
	c0	shru $r0.7 = $r0.5, $r0.6
;;
	c0	mov $r0.8 = 0
	c0	or $r0.5 = $r0.11, $r0.10
	c0	goto LBB66_12
;;
LBB66_4:
	c0	mov $r0.6 = $r0.8
	c0	goto LBB66_13
;;
LBB66_7:                                ## %if.else.5.i
	c0	cmpeq $b0.0 = $r0.6, 32
	c0	mov $r0.7 = 0
;;
;;
	c0	brf $b0.0, LBB66_9
;;
## BB#8:
	c0	mov $r0.9 = $r0.8
	c0	mov $r0.8 = $r0.7
	c0	goto LBB66_12
;;
LBB66_9:                                ## %if.else.8.i
	c0	cmpgt $b0.0 = $r0.6, 63
;;
;;
	c0	br $b0.0, LBB66_11
;;
## BB#10:                               ## %if.then.11.i
	c0	and $r0.6 = $r0.6, 31
	c0	shl $r0.9 = $r0.5, $r0.9
;;
	c0	shru $r0.5 = $r0.5, $r0.6
	c0	goto LBB66_12
;;
LBB66_11:                               ## %if.else.15.i
	c0	cmpne $b0.0 = $r0.5, 0
	c0	cmpeq $b0.1 = $r0.6, 64
	c0	mov $r0.7 = 0
;;
;;
	c0	mfb $r0.6 = $b0.0
;;
	c0	slct $r0.9 = $b0.1, $r0.5, $r0.6
	c0	mov $r0.5 = $r0.7
;;
LBB66_12:                               ## %if.end.19.i
	c0	cmpne $b0.0 = $r0.8, 0
	c0	mov $r0.6 = $r0.5
	c0	mov $r0.5 = $r0.7
;;
;;
	c0	mfb $r0.7 = $b0.0
;;
	c0	or $r0.7 = $r0.7, $r0.9
;;
LBB66_13:                               ## %if.end.5
	c0	sub $r0.4 = $r0.4, $r0.2
	c0	ldw $l0.0 = 28[$r0.1]
;;
.call roundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0	add $r0.1 = $r0.1, 32
	c0	call $l0.0 = roundAndPackFloat64
;;
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float64_sqrt
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_sqrt
float64_sqrt::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $l0.0
	c0	mov $r0.6 = 20
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.5 = 31
;;
	c0	shru $r0.3 = $r0.2, $r0.6
;;
	c0	and $r0.10 = $r0.3, 2047
;;
	c0	cmpne $b0.0 = $r0.10, 2047
	c0	and $r0.8 = $r0.2, 1048575
;;
	c0	mov $r0.3 = $r0.4
	c0	shru $r0.4 = $r0.2, $r0.5
;;
	c0	br $b0.0, LBB67_11
;;
## BB#1:                                ## %if.then
	c0	or $r0.5 = $r0.8, $r0.3
;;
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB67_13
;;
## BB#2:                                ## %if.then.12
	c0	and $r0.4 = $r0.2, 2146959360
;;
	c0	cmpne $b0.0 = $r0.4, 2146435072
;;
;;
	c0	br $b0.0, LBB67_3
;;
## BB#4:                                ## %land.rhs.i.59.i
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB67_6
;;
## BB#5:                                ## %float64_is_signaling_nan.exit.thread.i
	c0	or $r0.2 = $r0.2, 524288
	c0	goto LBB67_9
;;
LBB67_11:                               ## %if.end.21
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB67_15
;;
## BB#12:                               ## %if.then.23
	c0	or $r0.4 = $r0.8, $r0.3
;;
	c0	or $r0.4 = $r0.4, $r0.10
;;
LBB67_13:                               ## %if.then.23
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB67_61
;;
## BB#14:                               ## %invalid
	c0	mov $r0.4 = float_exception_flags
;;
	c0	ldw $r0.5 = 0[$r0.4]
	c0	mov $r0.3 = -1
	c0	mov $r0.2 = 2147483647
;;
	c0	goto LBB67_10
;;
LBB67_15:                               ## %if.end.31
	c0	cmpne $b0.0 = $r0.10, 0
;;
;;
	c0	br $b0.0, LBB67_26
;;
## BB#16:                               ## %if.then.33
	c0	or $r0.4 = $r0.8, $r0.3
;;
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB67_17
;;
## BB#18:                               ## %if.end.38
	c0	cmpne $b0.0 = $r0.8, 0
;;
;;
	c0	brf $b0.0, LBB67_19
;;
## BB#23:                               ## %if.else.7.i
	c0	cmpltu $b0.0 = $r0.8, 65536
	c0	mov $r0.4 = 16
	c0	mov $r0.6 = 8
;;
	c0	mov $r0.7 = 22
	c0	shl $r0.2 = $r0.2, $r0.4
	c0	mov $r0.4 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	mfb $r0.9 = $b0.0
	c0	mov $r0.10 = 4
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.8
;;
	c0	shl $r0.9 = $r0.9, $r0.10
	c0	cmpltu $b0.0 = $r0.2, 16777216
	c0	shl $r0.6 = $r0.2, $r0.6
;;
	c0	or $r0.10 = $r0.9, 8
;;
	c0	slct $r0.2 = $b0.0, $r0.6, $r0.2
	c0	slct $r0.6 = $b0.0, $r0.10, $r0.9
;;
	c0	shru $r0.2 = $r0.2, $r0.7
;;
	c0	and $r0.2 = $r0.2, 1020
;;
	c0	add $r0.2 = $r0.4, $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
;;
	c0	add $r0.2 = $r0.2, $r0.6
;;
	c0	add $r0.4 = $r0.2, -11
;;
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB67_25
;;
## BB#24:                               ## %cond.false.i.i
	c0	mov $r0.6 = 11
	c0	shl $r0.7 = $r0.8, $r0.4
;;
	c0	sub $r0.6 = $r0.6, $r0.2
;;
	c0	and $r0.6 = $r0.6, 31
;;
	c0	shru $r0.6 = $r0.3, $r0.6
;;
	c0	or $r0.8 = $r0.6, $r0.7
;;
LBB67_25:                               ## %shortShift64Left.exit.i
	c0	mov $r0.6 = 12
	c0	shl $r0.3 = $r0.3, $r0.4
;;
	c0	sub $r0.10 = $r0.6, $r0.2
	c0	goto LBB67_26
;;
LBB67_3:
	c0	mov $r0.4 = 0
;;
	c0	mtb $b0.0 = $r0.4
	c0	goto LBB67_7
;;
LBB67_6:                                ## %lor.rhs.i.i
	c0	and $r0.4 = $r0.2, 524287
;;
	c0	cmpne $b0.0 = $r0.4, 0
;;
LBB67_7:                                ## %float64_is_signaling_nan.exit.i
	c0	or $r0.2 = $r0.2, 524288
	c0	br $b0.0, LBB67_9
;;
## BB#8:                                ## %float64_is_signaling_nan.exit.i
	c0	mfb $r0.4 = $b0.0
;;
	c0	cmpne $b0.0 = $r0.4, 1
;;
;;
	c0	br $b0.0, LBB67_61
;;
LBB67_9:                                ## %if.then.i.283
	c0	mov $r0.4 = float_exception_flags
;;
	c0	ldw $r0.5 = 0[$r0.4]
;;
LBB67_10:                               ## %cleanup
	c0	or $r0.5 = $r0.5, 16
;;
	c0	stw 0[$r0.4] = $r0.5
	c0	goto LBB67_61
;;
LBB67_17:
	c0	mov $r0.2 = 0
;;
	c0	mov $r0.3 = $r0.2
	c0	goto LBB67_61
;;
LBB67_19:                               ## %if.then.i.267
	c0	mov $r0.2 = 16
	c0	cmpltu $b0.0 = $r0.3, 65536
	c0	mov $r0.4 = 8
;;
	c0	mov $r0.6 = 22
	c0	shl $r0.2 = $r0.3, $r0.2
	c0	mov $r0.7 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	mov $r0.8 = 4
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.3
;;
	c0	cmpltu $b0.1 = $r0.2, 16777216
	c0	shl $r0.4 = $r0.2, $r0.4
;;
;;
	c0	slct $r0.2 = $b0.1, $r0.4, $r0.2
;;
	c0	shru $r0.2 = $r0.2, $r0.6
	c0	mfb $r0.4 = $b0.0
;;
	c0	and $r0.2 = $r0.2, 1020
	c0	shl $r0.4 = $r0.4, $r0.8
;;
	c0	add $r0.2 = $r0.7, $r0.2
	c0	or $r0.6 = $r0.4, 8
;;
	c0	ldw $r0.2 = 0[$r0.2]
	c0	slct $r0.4 = $b0.1, $r0.6, $r0.4
;;
;;
	c0	add $r0.2 = $r0.2, $r0.4
;;
	c0	cmpgt $b0.0 = $r0.2, 10
	c0	add $r0.4 = $r0.2, -11
;;
;;
	c0	br $b0.0, LBB67_21
;;
## BB#20:                               ## %if.then.2.i
	c0	mov $r0.6 = 11
	c0	and $r0.4 = $r0.4, 31
;;
	c0	sub $r0.6 = $r0.6, $r0.2
;;
	c0	shru $r0.8 = $r0.3, $r0.6
	c0	shl $r0.3 = $r0.3, $r0.4
	c0	goto LBB67_22
;;
LBB67_21:                               ## %if.else.i.272
	c0	mov $r0.6 = 0
	c0	shl $r0.8 = $r0.3, $r0.4
;;
	c0	mov $r0.3 = $r0.6
;;
LBB67_22:                               ## %if.end.i.273
	c0	mov $r0.4 = -20
;;
	c0	sub $r0.10 = $r0.4, $r0.2
;;
LBB67_26:                               ## %if.end.39
	c0	and $r0.9 = $r0.10, 1
	c0	mov $r0.2 = 16
	c0	mov $r0.11 = 21
;;
	c0	or $r0.7 = $r0.8, 1048576
	c0	mov $r0.12 = 6
	c0	mov $r0.13 = 11
;;
	c0	mov $r0.6 = 1
	c0	add $r0.4 = $r0.10, -1023
	c0	shru $r0.14 = $r0.3, $r0.11
;;
	c0	cmpeq $b0.0 = $r0.9, 0
	c0	shru $r0.8 = $r0.8, $r0.2
	c0	shru $r0.11 = $r0.7, $r0.12
	c0	shl $r0.12 = $r0.7, $r0.13
;;
	c0	and $r0.10 = $r0.8, 15
	c0	and $r0.11 = $r0.11, 32767
	c0	or $r0.8 = $r0.14, $r0.12
;;
	c0	brf $b0.0, LBB67_27
;;
## BB#30:                               ## %if.else.i
	c0	mov $r0.12 = estimateSqrt32.sqrtEvenAdjustments
	c0	or $r0.11 = $r0.11, 32768
;;
	c0	mov $r0.13 = 0
	c0	sh1add $r0.10 = $r0.10, $r0.12
;;
	c0	mtb $b0.0 = $r0.13
	c0	mtb $b0.1 = $r0.13
	c0	ldhu $r0.10 = 0[$r0.10]
;;
;;
	c0	sub $r0.10 = $r0.11, $r0.10
;;
	c0	cmplt $r0.11 = $r0.10, $r0.0
;;
	c0	shru $r0.12 = $r0.8, $r0.11
	c0	shru $r0.13 = $r0.10, $r0.11
;;
	c0	addcg $r0.14, $b0.0 = $r0.12, $r0.12, $b0.0
;;
	c0	addcg $r0.12, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.0, $r0.13, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.12, $r0.12, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.14, $r0.13, $b0.1
;;
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.13, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.14, $r0.14, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
;;
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.13, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.14, $r0.14, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
;;
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.13, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.14, $r0.14, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
;;
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.13, $b0.0
	c0	mtb $b0.0 = $r0.11
;;
	c0	divs $r0.11, $b0.1 = $r0.12, $r0.13, $b0.1
	c0	addcg $r0.12, $b0.2 = $r0.14, $r0.14, $b0.2
;;
	c0	addcg $r0.14, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.13, $b0.2
;;
	c0	addcg $r0.12, $b0.2 = $r0.14, $r0.14, $b0.2
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.13, $b0.1
;;
	c0	addcg $r0.14, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.13, $b0.2
	c0	cmpgeu $r0.12 = $r0.8, $r0.10
;;
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.13, $b0.1
	c0	addcg $r0.15, $b0.2 = $r0.14, $r0.14, $b0.2
;;
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.13, $b0.2
;;
	c0	addcg $r0.15, $b0.2 = $r0.14, $r0.14, $b0.2
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.13, $b0.1
;;
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.13, $b0.2
;;
	c0	addcg $r0.15, $b0.2 = $r0.14, $r0.14, $b0.2
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.13, $b0.1
;;
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.13, $b0.2
;;
	c0	addcg $r0.15, $b0.2 = $r0.14, $r0.14, $b0.2
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.13, $b0.1
;;
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.13, $b0.2
;;
	c0	addcg $r0.15, $b0.2 = $r0.14, $r0.14, $b0.2
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.13, $b0.1
;;
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.13, $b0.2
;;
	c0	addcg $r0.15, $b0.2 = $r0.14, $r0.14, $b0.2
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.13, $b0.1
	c0	mov $r0.14 = 15
;;
	c0	addcg $r0.16, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.13, $b0.2
;;
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.13, $b0.1
	c0	addcg $r0.15, $b0.2 = $r0.16, $r0.16, $b0.2
;;
	c0	addcg $r0.16, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.13, $b0.2
;;
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.13, $b0.1
	c0	addcg $r0.15, $b0.2 = $r0.16, $r0.16, $b0.2
;;
	c0	addcg $r0.16, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.13, $b0.2
;;
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.13, $b0.1
	c0	addcg $r0.15, $b0.2 = $r0.16, $r0.16, $b0.2
;;
	c0	addcg $r0.16, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.13, $b0.2
;;
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.13, $b0.1
	c0	addcg $r0.13, $b0.2 = $r0.16, $r0.16, $b0.2
;;
	c0	cmpge $b0.2 = $r0.11, $r0.0
	c0	addcg $r0.11, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	orc $r0.11 = $r0.11, $r0.0
;;
	c0	mfb $r0.13 = $b0.2
;;
	c0	sh1add $r0.11 = $r0.11, $r0.13
;;
	c0	slct $r0.11 = $b0.0, $r0.12, $r0.11
	c0	mov $r0.12 = -32768
;;
	c0	add $r0.10 = $r0.10, $r0.11
;;
	c0	cmpgtu $b0.0 = $r0.10, 131071
	c0	shl $r0.10 = $r0.10, $r0.14
;;
;;
	c0	slct $r0.10 = $b0.0, $r0.12, $r0.10
;;
	c0	cmpgtu $b0.0 = $r0.10, $r0.8
;;
;;
	c0	br $b0.0, LBB67_28
;;
## BB#31:                               ## %if.then.17.i
	c0	shr $r0.8 = $r0.8, $r0.6
	c0	goto LBB67_43
;;
LBB67_27:                               ## %if.then.i
	c0	mov $r0.12 = estimateSqrt32.sqrtOddAdjustments
	c0	add $r0.11 = $r0.11, 16384
;;
	c0	mov $r0.13 = 0
	c0	sh1add $r0.10 = $r0.10, $r0.12
;;
	c0	mtb $b0.0 = $r0.13
	c0	mtb $b0.1 = $r0.13
	c0	ldhu $r0.10 = 0[$r0.10]
;;
;;
	c0	sub $r0.10 = $r0.11, $r0.10
;;
	c0	cmplt $r0.11 = $r0.10, $r0.0
;;
	c0	shru $r0.12 = $r0.8, $r0.11
	c0	shru $r0.13 = $r0.10, $r0.11
;;
	c0	addcg $r0.14, $b0.0 = $r0.12, $r0.12, $b0.0
;;
	c0	addcg $r0.12, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.0, $r0.13, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.12, $r0.12, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.14, $r0.13, $b0.1
;;
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.13, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.14, $r0.14, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
;;
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.13, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.14, $r0.14, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
;;
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.13, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.14, $r0.14, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
;;
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.13, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.14, $r0.14, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
;;
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.13, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.14, $r0.14, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
;;
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.13, $b0.0
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
;;
	c0	addcg $r0.15, $b0.0 = $r0.14, $r0.14, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
;;
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.13, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.14, $r0.14, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
;;
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.13, $b0.0
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
;;
	c0	addcg $r0.15, $b0.0 = $r0.14, $r0.14, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
;;
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.13, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.14, $r0.14, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
;;
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.13, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.14, $r0.14, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
;;
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.13, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.14, $r0.14, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
;;
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.13, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.14, $r0.14, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
;;
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.13, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.14, $r0.14, $b0.0
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
	c0	mov $r0.14 = 14
;;
	c0	addcg $r0.16, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.13, $b0.0
	c0	mov $r0.15 = 15
;;
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
	c0	addcg $r0.17, $b0.0 = $r0.16, $r0.16, $b0.0
	c0	cmpgeu $r0.16 = $r0.8, $r0.10
	c0	shl $r0.10 = $r0.10, $r0.15
;;
	c0	addcg $r0.15, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.13, $b0.0
	c0	mtb $b0.2 = $r0.11
	c0	shru $r0.8 = $r0.8, $r0.6
;;
	c0	divs $r0.11, $b0.1 = $r0.12, $r0.13, $b0.1
;;
	c0	cmpge $b0.3 = $r0.11, $r0.0
	c0	addcg $r0.11, $b0.0 = $r0.15, $r0.15, $b0.0
;;
	c0	addcg $r0.12, $b0.0 = $r0.11, $r0.11, $b0.1
;;
	c0	orc $r0.11 = $r0.12, $r0.0
	c0	mfb $r0.12 = $b0.3
;;
	c0	sh1add $r0.11 = $r0.11, $r0.12
;;
	c0	slct $r0.11 = $b0.2, $r0.16, $r0.11
;;
	c0	shl $r0.11 = $r0.11, $r0.14
;;
	c0	add $r0.10 = $r0.10, $r0.11
;;
LBB67_28:                               ## %if.end.19.i
	c0	cmpleu $b0.0 = $r0.10, $r0.8
;;
;;
	c0	br $b0.0, LBB67_29
;;
## BB#32:                               ## %if.end.i.210
	c0	shru $r0.11 = $r0.10, $r0.2
;;
	c0	shl $r0.13 = $r0.11, $r0.2
;;
	c0	cmpleu $b0.0 = $r0.13, $r0.8
;;
;;
	c0	br $b0.0, LBB67_33
;;
## BB#34:                               ## %cond.false.i.213
	c0	cmplt $r0.12 = $r0.11, $r0.0
	c0	mov $r0.14 = 0
;;
	c0	shru $r0.15 = $r0.8, $r0.12
	c0	mtb $b0.0 = $r0.14
	c0	shru $r0.16 = $r0.11, $r0.12
	c0	mtb $b0.1 = $r0.14
;;
;;
	c0	addcg $r0.14, $b0.0 = $r0.15, $r0.15, $b0.0
;;
	c0	divs $r0.15, $b0.0 = $r0.0, $r0.16, $b0.0
	c0	addcg $r0.17, $b0.1 = $r0.14, $r0.14, $b0.1
;;
	c0	addcg $r0.14, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.15, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.2 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
	c0	mtb $b0.0 = $r0.12
;;
	c0	addcg $r0.12, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.2 = $r0.14, $r0.16, $b0.2
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
	c0	addcg $r0.15, $b0.2 = $r0.12, $r0.12, $b0.2
;;
	c0	addcg $r0.12, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.2 = $r0.14, $r0.16, $b0.2
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
	c0	addcg $r0.15, $b0.2 = $r0.12, $r0.12, $b0.2
;;
	c0	addcg $r0.12, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.2 = $r0.14, $r0.16, $b0.2
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
	c0	addcg $r0.15, $b0.2 = $r0.12, $r0.12, $b0.2
;;
	c0	addcg $r0.12, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.2 = $r0.14, $r0.16, $b0.2
	c0	cmpgeu $r0.15 = $r0.8, $r0.11
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
	c0	addcg $r0.16, $b0.2 = $r0.12, $r0.12, $b0.2
;;
	c0	cmpge $b0.2 = $r0.14, $r0.0
	c0	addcg $r0.12, $b0.1 = $r0.16, $r0.16, $b0.1
;;
	c0	orc $r0.12 = $r0.12, $r0.0
;;
	c0	mfb $r0.14 = $b0.2
;;
	c0	sh1add $r0.12 = $r0.12, $r0.14
;;
	c0	slct $r0.12 = $b0.0, $r0.15, $r0.12
;;
	c0	shl $r0.12 = $r0.12, $r0.2
	c0	goto LBB67_35
;;
LBB67_29:
	c0	mov $r0.8 = 2147483647
	c0	goto LBB67_42
;;
LBB67_33:
	c0	mov $r0.12 = -65536
;;
LBB67_35:                               ## %cond.end.i.228
	c0	shru $r0.14 = $r0.12, $r0.2
	c0	zxth $r0.15 = $r0.10
	c0	mov $r0.16 = -1
;;
	c0	mpyhs $r0.17 = $r0.14, $r0.11
	c0	mpyhs $r0.18 = $r0.14, $r0.15
;;
	c0	mpylu $r0.15 = $r0.14, $r0.15
	c0	mpylu $r0.14 = $r0.14, $r0.11
;;
;;
	c0	add $r0.15 = $r0.15, $r0.18
	c0	mov $r0.18 = 0
	c0	add $r0.14 = $r0.14, $r0.17
;;
	c0	shl $r0.17 = $r0.15, $r0.2
	c0	shru $r0.15 = $r0.15, $r0.2
	c0	sub $r0.14 = $r0.8, $r0.14
;;
	c0	cmpne $r0.19 = $r0.17, 0
	c0	sub $r0.8 = $r0.18, $r0.17
	c0	sub $r0.14 = $r0.14, $r0.15
;;
	c0	mtb $b0.0 = $r0.19
;;
;;
	c0	slct $r0.15 = $b0.0, $r0.16, 0
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	cmpgt $b0.0 = $r0.14, -1
;;
;;
	c0	br $b0.0, LBB67_38
;;
## BB#36:                               ## %while.body.lr.ph.i.230
	c0	shl $r0.15 = $r0.10, $r0.2
;;
LBB67_37:                               ## %while.body.i.241
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.8 = $r0.8, $r0.15
	c0	add $r0.14 = $r0.14, $r0.11
	c0	add $r0.12 = $r0.12, -65536
;;
	c0	cmpltu $r0.16 = $r0.8, $r0.15
;;
	c0	add $r0.14 = $r0.14, $r0.16
;;
	c0	cmplt $b0.0 = $r0.14, 0
;;
;;
	c0	br $b0.0, LBB67_37
;;
LBB67_38:                               ## %while.end.i.249
	c0	shl $r0.14 = $r0.14, $r0.2
	c0	shru $r0.8 = $r0.8, $r0.2
;;
	c0	or $r0.8 = $r0.8, $r0.14
;;
	c0	cmpleu $b0.0 = $r0.13, $r0.8
;;
;;
	c0	br $b0.0, LBB67_39
;;
## BB#40:                               ## %cond.false.10.i.251
	c0	cmplt $r0.13 = $r0.11, $r0.0
	c0	mov $r0.14 = 0
;;
	c0	shru $r0.15 = $r0.8, $r0.13
	c0	mtb $b0.0 = $r0.14
	c0	shru $r0.16 = $r0.11, $r0.13
	c0	mtb $b0.1 = $r0.14
;;
;;
	c0	addcg $r0.14, $b0.0 = $r0.15, $r0.15, $b0.0
;;
	c0	divs $r0.15, $b0.0 = $r0.0, $r0.16, $b0.0
	c0	addcg $r0.17, $b0.1 = $r0.14, $r0.14, $b0.1
;;
	c0	addcg $r0.14, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.15, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.2 = $r0.14, $r0.16, $b0.0
	c0	mtb $b0.0 = $r0.13
;;
	c0	addcg $r0.13, $b0.2 = $r0.17, $r0.17, $b0.2
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.13, $b0.2 = $r0.14, $r0.16, $b0.2
;;
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.16, $b0.1
	c0	addcg $r0.14, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	addcg $r0.15, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.16, $b0.2
;;
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.16, $b0.1
	c0	cmpgeu $r0.8 = $r0.8, $r0.11
	c0	addcg $r0.11, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	cmpge $b0.2 = $r0.13, $r0.0
	c0	addcg $r0.13, $b0.1 = $r0.11, $r0.11, $b0.1
;;
	c0	orc $r0.11 = $r0.13, $r0.0
;;
	c0	mfb $r0.13 = $b0.2
;;
	c0	sh1add $r0.11 = $r0.11, $r0.13
;;
	c0	slct $r0.8 = $b0.0, $r0.8, $r0.11
	c0	goto LBB67_41
;;
LBB67_39:
	c0	mov $r0.8 = 65535
;;
LBB67_41:                               ## %cond.end.12.i.254
	c0	or $r0.8 = $r0.8, $r0.12
;;
	c0	shru $r0.8 = $r0.8, $r0.6
;;
LBB67_42:                               ## %estimateDiv64To32.exit256
	c0	shru $r0.10 = $r0.10, $r0.6
;;
	c0	add $r0.8 = $r0.8, $r0.10
;;
LBB67_43:                               ## %estimateSqrt32.exit
	c0	shru $r0.8 = $r0.8, $r0.6
	c0	mov $r0.12 = 9
	c0	mov $r0.11 = 17
	c0	mov $r0.10 = 0
;;
	c0	add $r0.8 = $r0.8, 1
	c0	sub $r0.12 = $r0.12, $r0.9
	c0	mov $r0.9 = 15
	c0	mov $r0.14 = -1
;;
	c0	shru $r0.13 = $r0.8, $r0.2
	c0	zxth $r0.15 = $r0.8
	c0	sub $r0.16 = $r0.10, $r0.12
	c0	shl $r0.17 = $r0.3, $r0.12
;;
	c0	mpyhs $r0.18 = $r0.13, $r0.15
	c0	mpylu $r0.19 = $r0.13, $r0.15
	c0	and $r0.16 = $r0.16, 31
	c0	shl $r0.7 = $r0.7, $r0.12
;;
	c0	mpylu $r0.12 = $r0.15, $r0.15
	c0	mpyhs $r0.15 = $r0.15, $r0.15
	c0	shru $r0.16 = $r0.3, $r0.16
;;
	c0	mpyhs $r0.20 = $r0.13, $r0.13
	c0	add $r0.18 = $r0.19, $r0.18
;;
	c0	shl $r0.3 = $r0.18, $r0.11
	c0	add $r0.12 = $r0.12, $r0.15
	c0	mpylu $r0.13 = $r0.13, $r0.13
	c0	shl $r0.15 = $r0.18, $r0.6
;;
	c0	cmpltu $b0.0 = $r0.15, $r0.18
	c0	add $r0.12 = $r0.3, $r0.12
;;
	c0	cmpltu $r0.3 = $r0.12, $r0.3
	c0	cmpltu $r0.15 = $r0.17, $r0.12
;;
	c0	mtb $b0.1 = $r0.3
	c0	mtb $b0.2 = $r0.15
	c0	shr $r0.4 = $r0.4, $r0.6
	c0	shl $r0.3 = $r0.8, $r0.6
;;
	c0	or $r0.7 = $r0.16, $r0.7
	c0	add $r0.13 = $r0.13, $r0.20
	c0	shru $r0.15 = $r0.18, $r0.9
;;
	c0	sub $r0.13 = $r0.7, $r0.13
	c0	zxth $r0.15 = $r0.15
	c0	sub $r0.7 = $r0.17, $r0.12
	c0	mfb $r0.12 = $b0.0
;;
	c0	shl $r0.12 = $r0.12, $r0.2
	c0	mfb $r0.16 = $b0.1
	c0	slct $r0.17 = $b0.2, $r0.14, 0
;;
	c0	or $r0.12 = $r0.12, $r0.15
	c0	add $r0.13 = $r0.13, $r0.16
;;
	c0	add $r0.13 = $r0.13, $r0.17
;;
	c0	sub $r0.12 = $r0.13, $r0.12
;;
	c0	cmpgt $b0.0 = $r0.12, -1
;;
;;
	c0	br $b0.0, LBB67_45
;;
LBB67_44:                               ## %while.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.13 = $r0.3, -1
;;
	c0	add $r0.7 = $r0.13, $r0.7
	c0	add $r0.8 = $r0.8, -1
	c0	add $r0.3 = $r0.3, -2
;;
	c0	cmpltu $r0.13 = $r0.7, $r0.13
;;
	c0	add $r0.12 = $r0.13, $r0.12
;;
	c0	cmplt $b0.0 = $r0.12, 0
;;
;;
	c0	br $b0.0, LBB67_44
;;
LBB67_45:                               ## %while.end
	c0	cmpleu $b0.0 = $r0.3, $r0.7
	c0	add $r0.4 = $r0.4, 1022
;;
;;
	c0	br $b0.0, LBB67_60
;;
## BB#46:                               ## %if.end.i
	c0	shru $r0.12 = $r0.3, $r0.2
;;
	c0	shl $r0.16 = $r0.12, $r0.2
;;
	c0	cmpleu $b0.0 = $r0.16, $r0.7
;;
;;
	c0	br $b0.0, LBB67_47
;;
## BB#48:                               ## %cond.false.i
	c0	cmplt $r0.13 = $r0.12, $r0.0
	c0	mov $r0.14 = 0
;;
	c0	shru $r0.15 = $r0.7, $r0.13
	c0	mtb $b0.0 = $r0.14
	c0	shru $r0.17 = $r0.12, $r0.13
	c0	mtb $b0.1 = $r0.14
;;
;;
	c0	addcg $r0.14, $b0.0 = $r0.15, $r0.15, $b0.0
;;
	c0	divs $r0.15, $b0.0 = $r0.0, $r0.17, $b0.0
	c0	addcg $r0.18, $b0.1 = $r0.14, $r0.14, $b0.1
;;
	c0	addcg $r0.14, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.15, $r0.17, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.17, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.17, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.17, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.17, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.17, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.17, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.17, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.17, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.17, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.17, $b0.0
;;
	c0	addcg $r0.15, $b0.2 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.17, $b0.1
	c0	mtb $b0.0 = $r0.13
;;
	c0	addcg $r0.13, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.2 = $r0.14, $r0.17, $b0.2
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.17, $b0.1
	c0	addcg $r0.15, $b0.2 = $r0.13, $r0.13, $b0.2
;;
	c0	addcg $r0.13, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.2 = $r0.14, $r0.17, $b0.2
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.17, $b0.1
	c0	addcg $r0.15, $b0.2 = $r0.13, $r0.13, $b0.2
;;
	c0	addcg $r0.13, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.2 = $r0.14, $r0.17, $b0.2
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.17, $b0.1
	c0	addcg $r0.15, $b0.2 = $r0.13, $r0.13, $b0.2
;;
	c0	addcg $r0.13, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.2 = $r0.14, $r0.17, $b0.2
	c0	cmpgeu $r0.15 = $r0.7, $r0.12
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.17, $b0.1
	c0	addcg $r0.17, $b0.2 = $r0.13, $r0.13, $b0.2
;;
	c0	cmpge $b0.2 = $r0.14, $r0.0
	c0	addcg $r0.13, $b0.1 = $r0.17, $r0.17, $b0.1
;;
	c0	orc $r0.13 = $r0.13, $r0.0
;;
	c0	mfb $r0.14 = $b0.2
;;
	c0	sh1add $r0.13 = $r0.13, $r0.14
;;
	c0	slct $r0.13 = $b0.0, $r0.15, $r0.13
;;
	c0	shl $r0.14 = $r0.13, $r0.2
	c0	goto LBB67_49
;;
LBB67_47:
	c0	mov $r0.14 = -65536
;;
LBB67_49:                               ## %cond.end.i
	c0	shru $r0.17 = $r0.14, $r0.2
	c0	and $r0.15 = $r0.3, 65534
	c0	mov $r0.13 = -1
;;
	c0	mpyhs $r0.18 = $r0.17, $r0.12
	c0	mpyhs $r0.19 = $r0.17, $r0.15
;;
	c0	mpylu $r0.20 = $r0.17, $r0.15
	c0	mpylu $r0.17 = $r0.17, $r0.12
;;
;;
	c0	add $r0.19 = $r0.20, $r0.19
	c0	add $r0.17 = $r0.17, $r0.18
;;
	c0	shl $r0.18 = $r0.19, $r0.2
	c0	shru $r0.19 = $r0.19, $r0.2
	c0	sub $r0.20 = $r0.7, $r0.17
;;
	c0	cmpne $r0.21 = $r0.18, 0
	c0	sub $r0.17 = $r0.10, $r0.18
	c0	sub $r0.18 = $r0.20, $r0.19
;;
	c0	mtb $b0.0 = $r0.21
;;
;;
	c0	slct $r0.19 = $b0.0, $r0.13, 0
;;
	c0	add $r0.18 = $r0.18, $r0.19
;;
	c0	cmpgt $b0.0 = $r0.18, -1
;;
;;
	c0	br $b0.0, LBB67_52
;;
## BB#50:                               ## %while.body.lr.ph.i
	c0	shl $r0.19 = $r0.3, $r0.2
;;
LBB67_51:                               ## %while.body.i
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.17 = $r0.17, $r0.19
	c0	add $r0.18 = $r0.18, $r0.12
	c0	add $r0.14 = $r0.14, -65536
;;
	c0	cmpltu $r0.20 = $r0.17, $r0.19
;;
	c0	add $r0.18 = $r0.18, $r0.20
;;
	c0	cmplt $b0.0 = $r0.18, 0
;;
;;
	c0	br $b0.0, LBB67_51
;;
LBB67_52:                               ## %while.end.i
	c0	shl $r0.18 = $r0.18, $r0.2
	c0	shru $r0.17 = $r0.17, $r0.2
;;
	c0	or $r0.17 = $r0.17, $r0.18
;;
	c0	cmpleu $b0.0 = $r0.16, $r0.17
;;
;;
	c0	br $b0.0, LBB67_53
;;
## BB#54:                               ## %cond.false.10.i
	c0	cmplt $r0.16 = $r0.12, $r0.0
	c0	mov $r0.18 = 0
;;
	c0	shru $r0.19 = $r0.17, $r0.16
	c0	mtb $b0.0 = $r0.18
	c0	shru $r0.20 = $r0.12, $r0.16
	c0	mtb $b0.1 = $r0.18
;;
;;
	c0	addcg $r0.18, $b0.0 = $r0.19, $r0.19, $b0.0
;;
	c0	divs $r0.19, $b0.0 = $r0.0, $r0.20, $b0.0
	c0	addcg $r0.21, $b0.1 = $r0.18, $r0.18, $b0.1
;;
	c0	addcg $r0.18, $b0.0 = $r0.21, $r0.21, $b0.0
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.20, $b0.1
;;
	c0	addcg $r0.21, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.18, $b0.0 = $r0.19, $r0.20, $b0.0
;;
	c0	addcg $r0.19, $b0.0 = $r0.21, $r0.21, $b0.0
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.20, $b0.1
;;
	c0	addcg $r0.21, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.18, $b0.0 = $r0.18, $r0.20, $b0.0
;;
	c0	addcg $r0.19, $b0.0 = $r0.21, $r0.21, $b0.0
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.20, $b0.1
;;
	c0	addcg $r0.21, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.18, $b0.0 = $r0.18, $r0.20, $b0.0
;;
	c0	addcg $r0.19, $b0.0 = $r0.21, $r0.21, $b0.0
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.20, $b0.1
;;
	c0	addcg $r0.21, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.18, $b0.0 = $r0.18, $r0.20, $b0.0
;;
	c0	addcg $r0.19, $b0.0 = $r0.21, $r0.21, $b0.0
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.20, $b0.1
;;
	c0	addcg $r0.21, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.18, $b0.0 = $r0.18, $r0.20, $b0.0
;;
	c0	addcg $r0.19, $b0.0 = $r0.21, $r0.21, $b0.0
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.20, $b0.1
;;
	c0	addcg $r0.21, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.18, $b0.0 = $r0.18, $r0.20, $b0.0
;;
	c0	addcg $r0.19, $b0.0 = $r0.21, $r0.21, $b0.0
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.20, $b0.1
;;
	c0	addcg $r0.21, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.18, $b0.0 = $r0.18, $r0.20, $b0.0
;;
	c0	addcg $r0.19, $b0.0 = $r0.21, $r0.21, $b0.0
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.20, $b0.1
;;
	c0	addcg $r0.21, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.18, $b0.0 = $r0.18, $r0.20, $b0.0
;;
	c0	addcg $r0.19, $b0.0 = $r0.21, $r0.21, $b0.0
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.20, $b0.1
;;
	c0	addcg $r0.21, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.18, $b0.0 = $r0.18, $r0.20, $b0.0
;;
	c0	addcg $r0.19, $b0.0 = $r0.21, $r0.21, $b0.0
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.20, $b0.1
;;
	c0	addcg $r0.21, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.18, $b0.0 = $r0.18, $r0.20, $b0.0
;;
	c0	addcg $r0.19, $b0.0 = $r0.21, $r0.21, $b0.0
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.20, $b0.1
;;
	c0	addcg $r0.21, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.18, $b0.0 = $r0.18, $r0.20, $b0.0
;;
	c0	addcg $r0.19, $b0.0 = $r0.21, $r0.21, $b0.0
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.20, $b0.1
;;
	c0	addcg $r0.21, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.18, $b0.0 = $r0.18, $r0.20, $b0.0
;;
	c0	addcg $r0.19, $b0.0 = $r0.21, $r0.21, $b0.0
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.20, $b0.1
;;
	c0	addcg $r0.21, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.18, $b0.2 = $r0.18, $r0.20, $b0.0
	c0	mtb $b0.0 = $r0.16
;;
	c0	addcg $r0.16, $b0.2 = $r0.21, $r0.21, $b0.2
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.20, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.16, $b0.2 = $r0.18, $r0.20, $b0.2
;;
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.20, $b0.1
	c0	addcg $r0.18, $b0.2 = $r0.19, $r0.19, $b0.2
;;
	c0	addcg $r0.19, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.16, $b0.2 = $r0.16, $r0.20, $b0.2
;;
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.20, $b0.1
	c0	cmpgeu $r0.17 = $r0.17, $r0.12
	c0	addcg $r0.18, $b0.2 = $r0.19, $r0.19, $b0.2
;;
	c0	cmpge $b0.2 = $r0.16, $r0.0
	c0	addcg $r0.16, $b0.1 = $r0.18, $r0.18, $b0.1
;;
	c0	orc $r0.16 = $r0.16, $r0.0
;;
	c0	mfb $r0.18 = $b0.2
;;
	c0	sh1add $r0.16 = $r0.16, $r0.18
;;
	c0	slct $r0.16 = $b0.0, $r0.17, $r0.16
	c0	goto LBB67_55
;;
LBB67_53:
	c0	mov $r0.16 = 65535
;;
LBB67_55:                               ## %estimateDiv64To32.exit
	c0	or $r0.14 = $r0.16, $r0.14
;;
	c0	and $r0.16 = $r0.14, 510
;;
	c0	cmpgtu $b0.0 = $r0.16, 5
;;
;;
	c0	br $b0.0, LBB67_60
;;
## BB#56:                               ## %if.then.55
	c0	cmpeq $b0.0 = $r0.14, 0
;;
;;
	c0	slct $r0.16 = $b0.0, $r0.6, $r0.14
;;
	c0	zxth $r0.17 = $r0.16
	c0	shru $r0.18 = $r0.16, $r0.2
;;
	c0	mpylu $r0.19 = $r0.18, $r0.17
	c0	mpyhs $r0.20 = $r0.18, $r0.17
;;
	c0	mpylu $r0.21 = $r0.17, $r0.12
	c0	mpylu $r0.22 = $r0.18, $r0.15
;;
	c0	mpyhs $r0.23 = $r0.18, $r0.15
	c0	mpylu $r0.24 = $r0.17, $r0.17
;;
	c0	mpyhs $r0.25 = $r0.17, $r0.17
	c0	mpyhs $r0.26 = $r0.17, $r0.15
;;
	c0	mpylu $r0.15 = $r0.17, $r0.15
	c0	mpyhs $r0.27 = $r0.18, $r0.18
;;
	c0	mpylu $r0.28 = $r0.18, $r0.18
	c0	mpyhs $r0.17 = $r0.17, $r0.12
	c0	add $r0.19 = $r0.19, $r0.20
;;
	c0	shl $r0.6 = $r0.19, $r0.6
;;
	c0	cmpltu $b0.0 = $r0.6, $r0.19
	c0	mpyhs $r0.6 = $r0.18, $r0.12
	c0	mpylu $r0.12 = $r0.18, $r0.12
	c0	add $r0.17 = $r0.21, $r0.17
;;
	c0	add $r0.18 = $r0.22, $r0.23
	c0	add $r0.20 = $r0.24, $r0.25
	c0	add $r0.15 = $r0.15, $r0.26
	c0	shl $r0.11 = $r0.19, $r0.11
;;
	c0	add $r0.17 = $r0.18, $r0.17
	c0	add $r0.21 = $r0.28, $r0.27
	c0	shru $r0.9 = $r0.19, $r0.9
;;
	c0	shl $r0.19 = $r0.17, $r0.2
	c0	add $r0.20 = $r0.11, $r0.20
	c0	zxth $r0.9 = $r0.9
;;
	c0	cmpltu $r0.11 = $r0.20, $r0.11
	c0	cmpne $b0.1 = $r0.20, 0
	c0	add $r0.15 = $r0.19, $r0.15
;;
	c0	cmpltu $r0.19 = $r0.15, $r0.19
	c0	sub $r0.22 = $r0.10, $r0.15
	c0	cmpne $r0.15 = $r0.15, 0
	c0	mfb $r0.23 = $b0.0
;;
	c0	add $r0.11 = $r0.11, $r0.21
	c0	shl $r0.21 = $r0.23, $r0.2
	c0	mtb $b0.0 = $r0.19
	c0	mtb $b0.2 = $r0.15
;;
	c0	or $r0.9 = $r0.21, $r0.9
;;
	c0	add $r0.9 = $r0.11, $r0.9
;;
	c0	cmpgtu $r0.11 = $r0.9, $r0.22
;;
	c0	mtb $b0.3 = $r0.11
	c0	add $r0.6 = $r0.12, $r0.6
;;
	c0	sub $r0.7 = $r0.7, $r0.6
	c0	shru $r0.11 = $r0.17, $r0.2
	c0	cmpltu $r0.12 = $r0.17, $r0.18
	c0	sub $r0.6 = $r0.10, $r0.20
;;
	c0	shl $r0.2 = $r0.12, $r0.2
;;
	c0	or $r0.2 = $r0.2, $r0.11
	c0	mfb $r0.10 = $b0.1
;;
	c0	sub $r0.2 = $r0.7, $r0.2
	c0	mfb $r0.7 = $b0.0
	c0	slct $r0.11 = $b0.2, $r0.13, 0
	c0	sub $r0.9 = $r0.22, $r0.9
;;
	c0	add $r0.7 = $r0.2, $r0.7
	c0	cmpltu $r0.12 = $r0.9, $r0.10
	c0	sub $r0.2 = $r0.9, $r0.10
;;
	c0	add $r0.7 = $r0.7, $r0.11
	c0	mtb $b0.0 = $r0.12
	c0	slct $r0.9 = $b0.3, $r0.13, 0
;;
;;
	c0	slct $r0.10 = $b0.0, $r0.13, 0
	c0	add $r0.7 = $r0.7, $r0.9
;;
	c0	add $r0.7 = $r0.7, $r0.10
;;
	c0	cmpgt $b0.0 = $r0.7, -1
;;
;;
	c0	br $b0.0, LBB67_59
;;
## BB#57:                               ## %while.body.61.preheader
	c0	maxu $r0.9 = $r0.14, 1
;;
	c0	sh1add $r0.9 = $r0.9, $r0.13
;;
LBB67_58:                               ## %while.body.61
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.16 = $r0.16, -1
	c0	add $r0.6 = $r0.9, $r0.6
;;
	c0	shru $r0.10 = $r0.16, $r0.5
;;
	c0	or $r0.10 = $r0.10, $r0.3
	c0	cmpltu $r0.11 = $r0.6, $r0.9
;;
	c0	add $r0.2 = $r0.10, $r0.2
	c0	add $r0.9 = $r0.9, -2
;;
	c0	cmpltu $r0.10 = $r0.2, $r0.10
	c0	add $r0.2 = $r0.11, $r0.2
;;
	c0	add $r0.7 = $r0.10, $r0.7
	c0	cmpltu $r0.10 = $r0.2, $r0.11
;;
	c0	add $r0.7 = $r0.7, $r0.10
;;
	c0	cmplt $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB67_58
;;
LBB67_59:                               ## %while.end.65
	c0	or $r0.2 = $r0.2, $r0.7
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	or $r0.14 = $r0.2, $r0.16
;;
LBB67_60:                               ## %if.end.70
	c0	mov $r0.2 = 22
	c0	mov $r0.6 = 10
	c0	mov $r0.3 = 0
;;
	c0	shru $r0.5 = $r0.8, $r0.6
	c0	shru $r0.6 = $r0.14, $r0.6
	c0	shl $r0.7 = $r0.14, $r0.2
	c0	shl $r0.2 = $r0.8, $r0.2
;;
	c0	or $r0.6 = $r0.6, $r0.2
;;
.call roundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = roundAndPackFloat64
;;
	c0	mov $r0.2 = $r0.4
;;
LBB67_61:                               ## %cleanup
	c0	mov $r0.4 = $r0.2
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

#.globl float64_eq
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_eq
float64_eq::
## BB#0:                                ## %entry
	c0	and $r0.2 = $r0.3, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
;;
	c0	br $b0.0, LBB68_2
;;
## BB#1:                                ## %land.lhs.true
	c0	and $r0.2 = $r0.3, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB68_4
;;
LBB68_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.5, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
;;
	c0	br $b0.0, LBB68_9
;;
## BB#3:                                ## %land.lhs.true.16
	c0	and $r0.2 = $r0.5, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB68_9
;;
LBB68_4:                                ## %if.then
	c0	and $r0.2 = $r0.3, 2146959360
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
;;
	c0	br $b0.0, LBB68_6
;;
## BB#5:                                ## %land.rhs.i.73
	c0	and $r0.2 = $r0.3, 524287
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB68_8
;;
LBB68_6:                                ## %lor.lhs.false.29
	c0	and $r0.2 = $r0.5, 2146959360
	c0	mov $r0.3 = 0
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
;;
	c0	br $b0.0, LBB68_16
;;
## BB#7:                                ## %land.rhs.i
	c0	and $r0.2 = $r0.5, 524287
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB68_16
;;
LBB68_8:                                ## %if.then.34
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
	c0	mov $r0.3 = 0
;;
;;
	c0	or $r0.4 = $r0.4, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB68_9:                                ## %if.end.35
	c0	cmpne $b0.0 = $r0.4, $r0.6
;;
;;
	c0	br $b0.0, LBB68_10
;;
## BB#11:                               ## %land.rhs
	c0	cmpeq $b0.0 = $r0.3, $r0.5
;;
;;
	c0	brf $b0.0, LBB68_13
;;
## BB#12:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB68_15
;;
LBB68_13:                               ## %lor.rhs
	c0	cmpne $b0.0 = $r0.4, 0
;;
;;
	c0	brf $b0.0, LBB68_14
;;
LBB68_10:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
;;
LBB68_15:                               ## %land.end.49
	c0	mfb $r0.3 = $b0.0
;;
LBB68_16:                               ## %return
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB68_14:                               ## %land.rhs.44
	c0	or $r0.2 = $r0.5, $r0.3
;;
	c0	and $r0.2 = $r0.2, 2147483647
;;
	c0	cmpeq $b0.0 = $r0.2, 0
	c0	goto LBB68_15
;;
.endp

#.globl float64_le
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_le
float64_le::
## BB#0:                                ## %entry
	c0	and $r0.2 = $r0.3, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
;;
	c0	br $b0.0, LBB69_2
;;
## BB#1:                                ## %land.lhs.true
	c0	and $r0.2 = $r0.3, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB69_4
;;
LBB69_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.5, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
;;
	c0	br $b0.0, LBB69_5
;;
## BB#3:                                ## %land.lhs.true.16
	c0	and $r0.2 = $r0.5, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB69_5
;;
LBB69_4:                                ## %if.then
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
	c0	mov $r0.3 = 0
;;
;;
	c0	or $r0.4 = $r0.4, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB69_5:                                ## %if.end
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.7 = $r0.5, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.7
;;
;;
	c0	brf $b0.0, LBB69_6
;;
## BB#9:                                ## %if.end.42
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB69_12
;;
## BB#10:                               ## %cond.true
	c0	cmpltu $b0.0 = $r0.5, $r0.3
;;
;;
	c0	br $b0.0, LBB69_7
;;
## BB#11:                               ## %lor.rhs.i.86
	c0	cmpleu $b0.0 = $r0.6, $r0.4
	c0	cmpeq $b0.1 = $r0.5, $r0.3
	c0	goto LBB69_14
;;
LBB69_6:                                ## %if.then.32
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB69_7
;;
## BB#8:                                ## %lor.rhs
	c0	or $r0.2 = $r0.5, $r0.3
	c0	mov $r0.3 = 1
	c0	or $r0.4 = $r0.6, $r0.4
;;
	c0	shl $r0.2 = $r0.2, $r0.3
;;
	c0	or $r0.2 = $r0.4, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB69_12:                               ## %cond.false
	c0	cmpltu $b0.0 = $r0.3, $r0.5
;;
;;
	c0	brf $b0.0, LBB69_13
;;
LBB69_7:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB69_13:                               ## %lor.rhs.i
	c0	cmpleu $b0.0 = $r0.4, $r0.6
	c0	cmpeq $b0.1 = $r0.3, $r0.5
;;
LBB69_14:                               ## %le64.exit
	c0	mfb $r0.2 = $b0.0
	c0	mfb $r0.3 = $b0.1
;;
	c0	and $r0.2 = $r0.3, $r0.2
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float64_lt
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_lt
float64_lt::
## BB#0:                                ## %entry
	c0	and $r0.2 = $r0.3, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
;;
	c0	br $b0.0, LBB70_2
;;
## BB#1:                                ## %land.lhs.true
	c0	and $r0.2 = $r0.3, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB70_4
;;
LBB70_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.5, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
;;
	c0	br $b0.0, LBB70_5
;;
## BB#3:                                ## %land.lhs.true.16
	c0	and $r0.2 = $r0.5, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB70_5
;;
LBB70_4:                                ## %if.then
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
	c0	mov $r0.3 = 0
;;
;;
	c0	or $r0.4 = $r0.4, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB70_5:                                ## %if.end
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.7 = $r0.5, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.7
;;
;;
	c0	brf $b0.0, LBB70_6
;;
## BB#9:                                ## %if.end.42
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB70_13
;;
## BB#10:                               ## %cond.true
	c0	cmpltu $b0.0 = $r0.5, $r0.3
;;
;;
	c0	br $b0.0, LBB70_11
;;
## BB#12:                               ## %lor.rhs.i.86
	c0	cmpltu $b0.0 = $r0.6, $r0.4
	c0	cmpeq $b0.1 = $r0.5, $r0.3
	c0	goto LBB70_15
;;
LBB70_6:                                ## %if.then.32
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB70_7
;;
## BB#8:                                ## %land.rhs
	c0	or $r0.2 = $r0.5, $r0.3
	c0	mov $r0.3 = 1
	c0	or $r0.4 = $r0.6, $r0.4
;;
	c0	shl $r0.2 = $r0.2, $r0.3
;;
	c0	or $r0.2 = $r0.4, $r0.2
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB70_13:                               ## %cond.false
	c0	cmpltu $b0.0 = $r0.3, $r0.5
;;
;;
	c0	brf $b0.0, LBB70_14
;;
LBB70_11:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB70_7:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB70_14:                               ## %lor.rhs.i
	c0	cmpltu $b0.0 = $r0.4, $r0.6
	c0	cmpeq $b0.1 = $r0.3, $r0.5
;;
LBB70_15:                               ## %lt64.exit
	c0	mfb $r0.2 = $b0.0
	c0	mfb $r0.3 = $b0.1
;;
	c0	and $r0.2 = $r0.3, $r0.2
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float64_eq_signaling
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_eq_signaling
float64_eq_signaling::
## BB#0:                                ## %entry
	c0	and $r0.2 = $r0.3, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
;;
	c0	br $b0.0, LBB71_2
;;
## BB#1:                                ## %land.lhs.true
	c0	and $r0.2 = $r0.3, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB71_4
;;
LBB71_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.5, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
;;
	c0	br $b0.0, LBB71_5
;;
## BB#3:                                ## %land.lhs.true.16
	c0	and $r0.2 = $r0.5, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB71_5
;;
LBB71_4:                                ## %if.then
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
	c0	mov $r0.3 = 0
;;
;;
	c0	or $r0.4 = $r0.4, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB71_5:                                ## %if.end
	c0	cmpne $b0.0 = $r0.4, $r0.6
;;
;;
	c0	br $b0.0, LBB71_6
;;
## BB#7:                                ## %land.rhs
	c0	cmpeq $b0.0 = $r0.3, $r0.5
;;
;;
	c0	brf $b0.0, LBB71_9
;;
## BB#8:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB71_9:                                ## %lor.rhs
	c0	cmpne $b0.0 = $r0.4, 0
;;
;;
	c0	brf $b0.0, LBB71_10
;;
LBB71_6:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB71_10:                               ## %land.rhs.33
	c0	or $r0.2 = $r0.5, $r0.3
;;
	c0	and $r0.2 = $r0.2, 2147483647
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float64_le_quiet
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_le_quiet
float64_le_quiet::
## BB#0:                                ## %entry
	c0	and $r0.2 = $r0.3, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
;;
	c0	br $b0.0, LBB72_2
;;
## BB#1:                                ## %land.lhs.true
	c0	and $r0.2 = $r0.3, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB72_4
;;
LBB72_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.5, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
;;
	c0	br $b0.0, LBB72_9
;;
## BB#3:                                ## %land.lhs.true.16
	c0	and $r0.2 = $r0.5, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB72_9
;;
LBB72_4:                                ## %if.then
	c0	and $r0.2 = $r0.3, 2146959360
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
;;
	c0	br $b0.0, LBB72_6
;;
## BB#5:                                ## %land.rhs.i.112
	c0	and $r0.2 = $r0.3, 524287
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB72_8
;;
LBB72_6:                                ## %lor.lhs.false.29
	c0	and $r0.2 = $r0.5, 2146959360
	c0	mov $r0.3 = 0
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
;;
	c0	br $b0.0, LBB72_20
;;
## BB#7:                                ## %land.rhs.i
	c0	and $r0.2 = $r0.5, 524287
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB72_20
;;
LBB72_8:                                ## %if.then.34
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
	c0	mov $r0.3 = 0
;;
;;
	c0	or $r0.4 = $r0.4, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB72_9:                                ## %if.end.35
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.7 = $r0.5, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.7
;;
;;
	c0	brf $b0.0, LBB72_10
;;
## BB#13:                               ## %if.end.53
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB72_16
;;
## BB#14:                               ## %cond.true
	c0	cmpltu $b0.0 = $r0.5, $r0.3
;;
;;
	c0	br $b0.0, LBB72_11
;;
## BB#15:                               ## %lor.rhs.i.101
	c0	cmpleu $b0.0 = $r0.6, $r0.4
	c0	cmpeq $b0.1 = $r0.5, $r0.3
	c0	goto LBB72_18
;;
LBB72_10:                               ## %if.then.43
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB72_11
;;
## BB#12:                               ## %lor.rhs
	c0	or $r0.2 = $r0.5, $r0.3
	c0	mov $r0.3 = 1
	c0	or $r0.4 = $r0.6, $r0.4
;;
	c0	shl $r0.2 = $r0.2, $r0.3
;;
	c0	or $r0.2 = $r0.4, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, 0
	c0	goto LBB72_19
;;
LBB72_16:                               ## %cond.false
	c0	cmpltu $b0.0 = $r0.3, $r0.5
;;
;;
	c0	brf $b0.0, LBB72_17
;;
LBB72_11:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB72_19
;;
LBB72_17:                               ## %lor.rhs.i
	c0	cmpleu $b0.0 = $r0.4, $r0.6
	c0	cmpeq $b0.1 = $r0.3, $r0.5
;;
LBB72_18:                               ## %le64.exit
	c0	mfb $r0.2 = $b0.0
	c0	mfb $r0.3 = $b0.1
;;
	c0	and $r0.2 = $r0.3, $r0.2
;;
	c0	mtb $b0.0 = $r0.2
;;
LBB72_19:                               ## %le64.exit
	c0	mfb $r0.3 = $b0.0
;;
LBB72_20:                               ## %cleanup
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float64_lt_quiet
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_lt_quiet
float64_lt_quiet::
## BB#0:                                ## %entry
	c0	and $r0.2 = $r0.3, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
;;
	c0	br $b0.0, LBB73_2
;;
## BB#1:                                ## %land.lhs.true
	c0	and $r0.2 = $r0.3, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB73_4
;;
LBB73_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.5, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
;;
	c0	br $b0.0, LBB73_9
;;
## BB#3:                                ## %land.lhs.true.16
	c0	and $r0.2 = $r0.5, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB73_9
;;
LBB73_4:                                ## %if.then
	c0	and $r0.2 = $r0.3, 2146959360
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
;;
	c0	br $b0.0, LBB73_6
;;
## BB#5:                                ## %land.rhs.i.112
	c0	and $r0.2 = $r0.3, 524287
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB73_8
;;
LBB73_6:                                ## %lor.lhs.false.29
	c0	and $r0.2 = $r0.5, 2146959360
	c0	mov $r0.3 = 0
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
;;
	c0	br $b0.0, LBB73_21
;;
## BB#7:                                ## %land.rhs.i
	c0	and $r0.2 = $r0.5, 524287
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB73_21
;;
LBB73_8:                                ## %if.then.34
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
	c0	mov $r0.3 = 0
;;
;;
	c0	or $r0.4 = $r0.4, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB73_9:                                ## %if.end.35
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.7 = $r0.5, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.7
;;
;;
	c0	brf $b0.0, LBB73_10
;;
## BB#13:                               ## %if.end.53
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB73_17
;;
## BB#14:                               ## %cond.true
	c0	cmpltu $b0.0 = $r0.5, $r0.3
;;
;;
	c0	br $b0.0, LBB73_15
;;
## BB#16:                               ## %lor.rhs.i.101
	c0	cmpltu $b0.0 = $r0.6, $r0.4
	c0	cmpeq $b0.1 = $r0.5, $r0.3
	c0	goto LBB73_19
;;
LBB73_10:                               ## %if.then.43
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB73_11
;;
## BB#12:                               ## %land.rhs
	c0	or $r0.2 = $r0.5, $r0.3
	c0	mov $r0.3 = 1
	c0	or $r0.4 = $r0.6, $r0.4
;;
	c0	shl $r0.2 = $r0.2, $r0.3
;;
	c0	or $r0.2 = $r0.4, $r0.2
;;
	c0	cmpne $b0.0 = $r0.2, 0
	c0	goto LBB73_20
;;
LBB73_17:                               ## %cond.false
	c0	cmpltu $b0.0 = $r0.3, $r0.5
;;
;;
	c0	brf $b0.0, LBB73_18
;;
LBB73_15:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB73_20
;;
LBB73_11:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB73_20
;;
LBB73_18:                               ## %lor.rhs.i
	c0	cmpltu $b0.0 = $r0.4, $r0.6
	c0	cmpeq $b0.1 = $r0.3, $r0.5
;;
LBB73_19:                               ## %lt64.exit
	c0	mfb $r0.2 = $b0.0
	c0	mfb $r0.3 = $b0.1
;;
	c0	and $r0.2 = $r0.3, $r0.2
;;
	c0	mtb $b0.0 = $r0.2
;;
LBB73_20:                               ## %lt64.exit
	c0	mfb $r0.3 = $b0.0
;;
LBB73_21:                               ## %cleanup
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float32_gt
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_gt
float32_gt::
## BB#0:                                ## %entry
	c0	and $r0.2 = $r0.3, 2139095040
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB74_2
;;
## BB#1:                                ## %entry
	c0	and $r0.2 = $r0.3, 8388607
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB74_4
;;
LBB74_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 2139095040
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB74_5
;;
## BB#3:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 8388607
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB74_5
;;
LBB74_4:                                ## %if.then
	c0	mov $r0.2 = float_exception_flags
	c0	mov $r0.3 = 0
;;
	c0	ldw $r0.4 = 0[$r0.2]
;;
;;
	c0	or $r0.4 = $r0.4, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB74_5:                                ## %if.end
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.5 = $r0.4, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.5
;;
;;
	c0	brf $b0.0, LBB74_6
;;
## BB#10:                               ## %if.end.13
	c0	cmpgtu $b0.0 = $r0.3, $r0.4
	c0	cmpne $b0.1 = $r0.3, $r0.4
;;
;;
	c0	mfb $r0.3 = $b0.0
	c0	mfb $r0.4 = $b0.1
;;
	c0	cmpne $b0.0 = $r0.2, $r0.3
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	and $r0.2 = $r0.4, $r0.2
;;
.return ret($r0.3:u32)
	c0	and $r0.3 = $r0.2, 1
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB74_6:                                ## %if.then.10
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB74_7
;;
## BB#8:                                ## %land.rhs
	c0	or $r0.2 = $r0.4, $r0.3
;;
	c0	and $r0.2 = $r0.2, 2147483647
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB74_7:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float32_ge
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_ge
float32_ge::
## BB#0:                                ## %entry
	c0	and $r0.2 = $r0.3, 2139095040
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB75_2
;;
## BB#1:                                ## %entry
	c0	and $r0.2 = $r0.3, 8388607
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB75_4
;;
LBB75_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 2139095040
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB75_5
;;
## BB#3:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 8388607
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB75_5
;;
LBB75_4:                                ## %if.then
	c0	mov $r0.2 = float_exception_flags
	c0	mov $r0.3 = 0
;;
	c0	ldw $r0.4 = 0[$r0.2]
;;
;;
	c0	or $r0.4 = $r0.4, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB75_5:                                ## %if.end
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.5 = $r0.4, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.5
;;
;;
	c0	brf $b0.0, LBB75_6
;;
## BB#10:                               ## %if.end.13
	c0	cmpgtu $b0.0 = $r0.3, $r0.4
	c0	cmpeq $b0.1 = $r0.3, $r0.4
;;
;;
	c0	mfb $r0.3 = $b0.0
	c0	mfb $r0.4 = $b0.1
;;
	c0	xor $r0.2 = $r0.3, $r0.2
;;
.return ret($r0.3:u32)
	c0	or $r0.3 = $r0.2, $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB75_6:                                ## %if.then.10
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB75_8
;;
## BB#7:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB75_8:                                ## %lor.rhs
	c0	or $r0.2 = $r0.4, $r0.3
;;
	c0	and $r0.2 = $r0.2, 2147483647
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float64_gt
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_gt
float64_gt::
## BB#0:                                ## %entry
	c0	and $r0.2 = $r0.3, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
;;
	c0	br $b0.0, LBB76_2
;;
## BB#1:                                ## %land.lhs.true
	c0	and $r0.2 = $r0.3, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB76_4
;;
LBB76_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.5, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
;;
	c0	br $b0.0, LBB76_5
;;
## BB#3:                                ## %land.lhs.true.16
	c0	and $r0.2 = $r0.5, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB76_5
;;
LBB76_4:                                ## %if.then
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
	c0	mov $r0.3 = 0
;;
;;
	c0	or $r0.4 = $r0.4, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB76_5:                                ## %if.end
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.7 = $r0.5, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.7
;;
;;
	c0	brf $b0.0, LBB76_6
;;
## BB#9:                                ## %if.end.42
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB76_13
;;
## BB#10:                               ## %cond.true
	c0	cmpgtu $b0.0 = $r0.5, $r0.3
;;
;;
	c0	br $b0.0, LBB76_11
;;
## BB#12:                               ## %lor.rhs.i.86
	c0	cmpgtu $b0.0 = $r0.6, $r0.4
	c0	cmpeq $b0.1 = $r0.5, $r0.3
	c0	goto LBB76_15
;;
LBB76_6:                                ## %if.then.32
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB76_7
;;
## BB#8:                                ## %land.rhs
	c0	or $r0.2 = $r0.5, $r0.3
	c0	mov $r0.3 = 1
	c0	or $r0.4 = $r0.6, $r0.4
;;
	c0	shl $r0.2 = $r0.2, $r0.3
;;
	c0	or $r0.2 = $r0.4, $r0.2
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB76_13:                               ## %cond.false
	c0	cmpgtu $b0.0 = $r0.3, $r0.5
;;
;;
	c0	brf $b0.0, LBB76_14
;;
LBB76_11:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB76_7:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB76_14:                               ## %lor.rhs.i
	c0	cmpgtu $b0.0 = $r0.4, $r0.6
	c0	cmpeq $b0.1 = $r0.3, $r0.5
;;
LBB76_15:                               ## %gt64.exit
	c0	mfb $r0.2 = $b0.0
	c0	mfb $r0.3 = $b0.1
;;
	c0	and $r0.2 = $r0.3, $r0.2
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float64_ge
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_ge
float64_ge::
## BB#0:                                ## %entry
	c0	and $r0.2 = $r0.3, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
;;
	c0	br $b0.0, LBB77_2
;;
## BB#1:                                ## %land.lhs.true
	c0	and $r0.2 = $r0.3, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB77_4
;;
LBB77_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.5, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
;;
	c0	br $b0.0, LBB77_5
;;
## BB#3:                                ## %land.lhs.true.16
	c0	and $r0.2 = $r0.5, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB77_5
;;
LBB77_4:                                ## %if.then
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
	c0	mov $r0.3 = 0
;;
;;
	c0	or $r0.4 = $r0.4, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB77_5:                                ## %if.end
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.7 = $r0.5, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.7
;;
;;
	c0	brf $b0.0, LBB77_6
;;
## BB#9:                                ## %if.end.42
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB77_12
;;
## BB#10:                               ## %cond.true
	c0	cmpgtu $b0.0 = $r0.5, $r0.3
;;
;;
	c0	br $b0.0, LBB77_7
;;
## BB#11:                               ## %lor.rhs.i.86
	c0	cmpgeu $b0.0 = $r0.6, $r0.4
	c0	cmpeq $b0.1 = $r0.5, $r0.3
	c0	goto LBB77_14
;;
LBB77_6:                                ## %if.then.32
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB77_7
;;
## BB#8:                                ## %lor.rhs
	c0	or $r0.2 = $r0.5, $r0.3
	c0	mov $r0.3 = 1
	c0	or $r0.4 = $r0.6, $r0.4
;;
	c0	shl $r0.2 = $r0.2, $r0.3
;;
	c0	or $r0.2 = $r0.4, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB77_12:                               ## %cond.false
	c0	cmpgtu $b0.0 = $r0.3, $r0.5
;;
;;
	c0	brf $b0.0, LBB77_13
;;
LBB77_7:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB77_13:                               ## %lor.rhs.i
	c0	cmpgeu $b0.0 = $r0.4, $r0.6
	c0	cmpeq $b0.1 = $r0.3, $r0.5
;;
LBB77_14:                               ## %ge64.exit
	c0	mfb $r0.2 = $b0.0
	c0	mfb $r0.3 = $b0.1
;;
	c0	and $r0.2 = $r0.3, $r0.2
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .data
#.globl float_rounding_mode             ## @float_rounding_mode
	.align	4
float_rounding_mode:
	.data4	0                       ## 0x0

#.globl float_exception_flags           ## @float_exception_flags
	.align	4
float_exception_flags:
	.data4	0                       ## 0x0

.section .data
#.globl float_detect_tininess           ## @float_detect_tininess
	.align	4
float_detect_tininess:
	.data4	1                       ## 0x1

	.section	.data 
	.align	4                       ## @countLeadingZeros32.countLeadingZerosHigh
countLeadingZeros32.countLeadingZerosHigh:
	.data4	8                       ## 0x8
	.data4	7                       ## 0x7
	.data4	6                       ## 0x6
	.data4	6                       ## 0x6
	.data4	5                       ## 0x5
	.data4	5                       ## 0x5
	.data4	5                       ## 0x5
	.data4	5                       ## 0x5
	.data4	4                       ## 0x4
	.data4	4                       ## 0x4
	.data4	4                       ## 0x4
	.data4	4                       ## 0x4
	.data4	4                       ## 0x4
	.data4	4                       ## 0x4
	.data4	4                       ## 0x4
	.data4	4                       ## 0x4
	.data4	3                       ## 0x3
	.data4	3                       ## 0x3
	.data4	3                       ## 0x3
	.data4	3                       ## 0x3
	.data4	3                       ## 0x3
	.data4	3                       ## 0x3
	.data4	3                       ## 0x3
	.data4	3                       ## 0x3
	.data4	3                       ## 0x3
	.data4	3                       ## 0x3
	.data4	3                       ## 0x3
	.data4	3                       ## 0x3
	.data4	3                       ## 0x3
	.data4	3                       ## 0x3
	.data4	3                       ## 0x3
	.data4	3                       ## 0x3
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
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

	.align	2                       ## @estimateSqrt32.sqrtOddAdjustments
estimateSqrt32.sqrtOddAdjustments:
	.data2	4                       ## 0x4
	.data2	34                      ## 0x22
	.data2	93                      ## 0x5d
	.data2	177                     ## 0xb1
	.data2	285                     ## 0x11d
	.data2	415                     ## 0x19f
	.data2	566                     ## 0x236
	.data2	736                     ## 0x2e0
	.data2	924                     ## 0x39c
	.data2	1128                    ## 0x468
	.data2	1349                    ## 0x545
	.data2	1585                    ## 0x631
	.data2	1835                    ## 0x72b
	.data2	2098                    ## 0x832
	.data2	2374                    ## 0x946
	.data2	2663                    ## 0xa67

	.align	2                       ## @estimateSqrt32.sqrtEvenAdjustments
estimateSqrt32.sqrtEvenAdjustments:
	.data2	2605                    ## 0xa2d
	.data2	2223                    ## 0x8af
	.data2	1882                    ## 0x75a
	.data2	1577                    ## 0x629
	.data2	1306                    ## 0x51a
	.data2	1065                    ## 0x429
	.data2	854                     ## 0x356
	.data2	670                     ## 0x29e
	.data2	512                     ## 0x200
	.data2	377                     ## 0x179
	.data2	265                     ## 0x109
	.data2	175                     ## 0xaf
	.data2	104                     ## 0x68
	.data2	52                      ## 0x34
	.data2	18                      ## 0x12
	.data2	2                       ## 0x2


.import addFloat32Sigs
.type addFloat32Sigs, @function
.import addFloat64Sigs
.type addFloat64Sigs, @function
.import normalizeRoundAndPackFloat64
.type normalizeRoundAndPackFloat64, @function
.import roundAndPackFloat32
.type roundAndPackFloat32, @function
.import roundAndPackFloat64
.type roundAndPackFloat64, @function
.import subFloat32Sigs
.type subFloat32Sigs, @function
.import subFloat64Sigs
.type subFloat64Sigs, @function
