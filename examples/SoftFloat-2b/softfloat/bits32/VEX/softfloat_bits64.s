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
;;
	c0	or $r0.4 = $r0.8, $r0.4
	c0	and $r0.5 = $r0.5, 31
;;
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
	c0	ldw $r0.2 = 16[$r0.1]
	c0	add $r0.5 = $r0.8, $r0.5
	c0	add $r0.4 = $r0.7, $r0.4
	c0	add $r0.3 = $r0.6, $r0.3
;;
	c0	cmpltu $r0.6 = $r0.5, $r0.8
	c0	cmpltu $r0.7 = $r0.4, $r0.7
;;
	c0	add $r0.4 = $r0.6, $r0.4
	c0	add $r0.3 = $r0.3, $r0.7
;;
	c0	cmpltu $r0.6 = $r0.4, $r0.6
	c0	stw 0[$r0.2] = $r0.5
;;
	c0	add $r0.2 = $r0.3, $r0.6
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
	c0	sub $r0.3 = $r0.3, $r0.5
;;
	c0	mtb $b0.0 = $r0.9
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
	c0	mov $r0.2 = -1
	c0	cmpltu $b0.1 = $r0.5, $r0.8
	c0	cmpltu $r0.11 = $r0.4, $r0.7
	c0	sub $r0.4 = $r0.4, $r0.7
	c0	sub $r0.3 = $r0.3, $r0.6
	c0	ldw $r0.6 = 16[$r0.1]
;;
	c0	mtb $b0.0 = $r0.11
;;
	c0	mfb $r0.7 = $b0.1
	c0	sub $r0.5 = $r0.5, $r0.8
;;
	c0	cmpltu $r0.8 = $r0.4, $r0.7
;;
	c0	mtb $b0.1 = $r0.8
	c0	slct $r0.8 = $b0.0, $r0.2, 0
;;
	c0	add $r0.3 = $r0.3, $r0.8
;;
	c0	slct $r0.2 = $b0.1, $r0.2, 0
	c0	stw 0[$r0.6] = $r0.5
	c0	sub $r0.4 = $r0.4, $r0.7
;;
	c0	add $r0.2 = $r0.3, $r0.2
	c0	stw 0[$r0.10] = $r0.4
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
	c0	mpyhs $r0.9 = $r0.7, $r0.8
;;
	c0	mpyhs $r0.10 = $r0.7, $r0.3
	c0	mpylu $r0.11 = $r0.7, $r0.3
	c0	mpylu $r0.12 = $r0.4, $r0.8
	c0	mpyhs $r0.13 = $r0.4, $r0.8
;;
	c0	mpylu $r0.7 = $r0.7, $r0.8
	c0	mpyhs $r0.8 = $r0.4, $r0.3
	c0	mpylu $r0.3 = $r0.4, $r0.3
;;
;;
	c0	add $r0.4 = $r0.7, $r0.9
	c0	add $r0.7 = $r0.11, $r0.10
	c0	add $r0.9 = $r0.12, $r0.13
;;
	c0	add $r0.7 = $r0.9, $r0.7
;;
	c0	cmpltu $r0.9 = $r0.7, $r0.9
	c0	shl $r0.10 = $r0.7, $r0.2
	c0	shru $r0.7 = $r0.7, $r0.2
;;
	c0	shl $r0.2 = $r0.9, $r0.2
	c0	add $r0.3 = $r0.3, $r0.8
	c0	add $r0.4 = $r0.10, $r0.4
;;
	c0	or $r0.2 = $r0.2, $r0.7
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
	c0	zxth $r0.10 = $r0.4
;;
	c0	shru $r0.11 = $r0.3, $r0.2
	c0	shru $r0.5 = $r0.5, $r0.2
	c0	zxth $r0.3 = $r0.3
	c0	shru $r0.4 = $r0.4, $r0.2
;;
	c0	mpylu $r0.12 = $r0.9, $r0.3
	c0	mpyhs $r0.13 = $r0.9, $r0.11
	c0	mpylu $r0.14 = $r0.9, $r0.11
	c0	mpylu $r0.15 = $r0.9, $r0.4
;;
	c0	mpyhs $r0.16 = $r0.9, $r0.4
	c0	mpylu $r0.17 = $r0.5, $r0.10
	c0	mpyhs $r0.18 = $r0.5, $r0.10
	c0	mpylu $r0.19 = $r0.5, $r0.3
;;
	c0	mpyhs $r0.20 = $r0.5, $r0.3
	c0	mpyhs $r0.3 = $r0.9, $r0.3
;;
	c0	add $r0.15 = $r0.15, $r0.16
	c0	add $r0.13 = $r0.14, $r0.13
	c0	mpylu $r0.14 = $r0.9, $r0.10
	c0	mpyhs $r0.9 = $r0.9, $r0.10
	c0	mpyhs $r0.10 = $r0.5, $r0.4
;;
	c0	add $r0.16 = $r0.19, $r0.20
	c0	add $r0.17 = $r0.17, $r0.18
	c0	mpylu $r0.4 = $r0.5, $r0.4
	c0	add $r0.3 = $r0.12, $r0.3
	c0	mpyhs $r0.12 = $r0.5, $r0.11
	c0	mpylu $r0.5 = $r0.5, $r0.11
;;
	c0	add $r0.11 = $r0.16, $r0.13
	c0	add $r0.13 = $r0.17, $r0.15
	c0	add $r0.9 = $r0.14, $r0.9
;;
	c0	add $r0.4 = $r0.4, $r0.10
	c0	cmpltu $r0.10 = $r0.13, $r0.17
	c0	shl $r0.14 = $r0.11, $r0.2
	c0	shl $r0.15 = $r0.13, $r0.2
	c0	shru $r0.13 = $r0.13, $r0.2
	c0	cmpltu $r0.16 = $r0.11, $r0.16
;;
	c0	add $r0.3 = $r0.14, $r0.3
	c0	shl $r0.10 = $r0.10, $r0.2
	c0	add $r0.9 = $r0.15, $r0.9
;;
	c0	or $r0.10 = $r0.10, $r0.13
	c0	add $r0.4 = $r0.3, $r0.4
	c0	cmpltu $r0.13 = $r0.9, $r0.15
;;
	c0	add $r0.4 = $r0.4, $r0.10
	c0	shru $r0.10 = $r0.11, $r0.2
	c0	shl $r0.2 = $r0.16, $r0.2
;;
	c0	add $r0.4 = $r0.4, $r0.13
	c0	add $r0.5 = $r0.5, $r0.12
	c0	or $r0.2 = $r0.2, $r0.10
;;
	c0	cmpltu $b0.0 = $r0.4, $r0.3
	c0	cmpltu $r0.3 = $r0.3, $r0.14
	c0	add $r0.2 = $r0.2, $r0.5
;;
	c0	add $r0.2 = $r0.2, $r0.3
;;
	c0	mfb $r0.3 = $b0.0
	c0	stw 0[$r0.8] = $r0.9
;;
	c0	add $r0.2 = $r0.2, $r0.3
	c0	stw 0[$r0.7] = $r0.4
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
	c0	zxth $r0.11 = $r0.4
	c0	zxth $r0.12 = $r0.6
;;
	c0	shru $r0.13 = $r0.5, $r0.2
	c0	shru $r0.4 = $r0.4, $r0.2
	c0	zxth $r0.5 = $r0.5
	c0	shru $r0.6 = $r0.6, $r0.2
	c0	zxth $r0.14 = $r0.3
	c0	shru $r0.3 = $r0.3, $r0.2
;;
	c0	mpyhs $r0.15 = $r0.13, $r0.11
	c0	mpylu $r0.16 = $r0.13, $r0.11
	c0	mpyhs $r0.17 = $r0.6, $r0.11
	c0	mpylu $r0.18 = $r0.6, $r0.11
;;
	c0	mpyhs $r0.19 = $r0.12, $r0.4
	c0	mpylu $r0.20 = $r0.12, $r0.4
	c0	mpyhs $r0.21 = $r0.5, $r0.4
	c0	mpylu $r0.22 = $r0.5, $r0.4
;;
	c0	mpyhs $r0.23 = $r0.5, $r0.11
	c0	mpylu $r0.24 = $r0.5, $r0.11
;;
	c0	add $r0.19 = $r0.20, $r0.19
	c0	add $r0.17 = $r0.18, $r0.17
	c0	add $r0.15 = $r0.16, $r0.15
	c0	mpyhs $r0.16 = $r0.6, $r0.4
	c0	mpylu $r0.18 = $r0.6, $r0.4
	c0	mpylu $r0.20 = $r0.12, $r0.11
	c0	add $r0.21 = $r0.22, $r0.21
;;
	c0	add $r0.19 = $r0.17, $r0.19
	c0	mpyhs $r0.11 = $r0.12, $r0.11
	c0	mpylu $r0.22 = $r0.5, $r0.3
	c0	mpyhs $r0.25 = $r0.5, $r0.3
	c0	add $r0.23 = $r0.24, $r0.23
	c0	mpylu $r0.24 = $r0.13, $r0.14
	c0	add $r0.21 = $r0.15, $r0.21
;;
	c0	mpyhs $r0.26 = $r0.13, $r0.14
	c0	cmpltu $r0.17 = $r0.19, $r0.17
	c0	mpyhs $r0.27 = $r0.5, $r0.14
	c0	mpylu $r0.5 = $r0.5, $r0.14
;;
	c0	add $r0.11 = $r0.20, $r0.11
	c0	shl $r0.20 = $r0.19, $r0.2
	c0	shl $r0.28 = $r0.21, $r0.2
	c0	add $r0.16 = $r0.18, $r0.16
	c0	mpyhs $r0.18 = $r0.6, $r0.14
	c0	mpylu $r0.29 = $r0.6, $r0.14
;;
	c0	add $r0.24 = $r0.24, $r0.26
	c0	add $r0.22 = $r0.22, $r0.25
	c0	shl $r0.17 = $r0.17, $r0.2
	c0	shru $r0.19 = $r0.19, $r0.2
	c0	add $r0.23 = $r0.28, $r0.23
	c0	mpyhs $r0.25 = $r0.12, $r0.3
	c0	mpylu $r0.26 = $r0.12, $r0.3
;;
	c0	add $r0.22 = $r0.24, $r0.22
	c0	add $r0.11 = $r0.20, $r0.11
	c0	mpyhs $r0.30 = $r0.13, $r0.4
	c0	mpylu $r0.4 = $r0.13, $r0.4
	c0	or $r0.17 = $r0.17, $r0.19
	c0	add $r0.16 = $r0.23, $r0.16
	c0	cmpltu $r0.15 = $r0.21, $r0.15
;;
	c0	cmpltu $r0.19 = $r0.11, $r0.20
	c0	add $r0.5 = $r0.5, $r0.27
	c0	shl $r0.20 = $r0.22, $r0.2
	c0	add $r0.18 = $r0.29, $r0.18
	c0	mpylu $r0.27 = $r0.12, $r0.14
	c0	mpyhs $r0.12 = $r0.12, $r0.14
	c0	add $r0.14 = $r0.26, $r0.25
	c0	add $r0.16 = $r0.16, $r0.17
;;
	c0	add $r0.5 = $r0.20, $r0.5
	c0	add $r0.4 = $r0.4, $r0.30
	c0	shl $r0.15 = $r0.15, $r0.2
	c0	shru $r0.17 = $r0.21, $r0.2
	c0	mpyhs $r0.21 = $r0.6, $r0.3
	c0	mpylu $r0.6 = $r0.6, $r0.3
	c0	add $r0.14 = $r0.18, $r0.14
	c0	add $r0.16 = $r0.16, $r0.19
;;
	c0	or $r0.15 = $r0.15, $r0.17
	c0	add $r0.4 = $r0.5, $r0.4
	c0	cmpltu $r0.17 = $r0.23, $r0.28
	c0	add $r0.12 = $r0.27, $r0.12
	c0	cmpltu $r0.19 = $r0.22, $r0.24
	c0	mpylu $r0.24 = $r0.13, $r0.3
	c0	cmpltu $b0.0 = $r0.16, $r0.23
	c0	cmpltu $r0.18 = $r0.14, $r0.18
;;
	c0	add $r0.4 = $r0.4, $r0.15
	c0	shl $r0.15 = $r0.14, $r0.2
	c0	shru $r0.14 = $r0.14, $r0.2
	c0	mpyhs $r0.3 = $r0.13, $r0.3
	c0	add $r0.6 = $r0.6, $r0.21
	c0	shl $r0.13 = $r0.19, $r0.2
	c0	shl $r0.18 = $r0.18, $r0.2
;;
	c0	add $r0.12 = $r0.15, $r0.12
	c0	add $r0.4 = $r0.4, $r0.17
	c0	shru $r0.2 = $r0.22, $r0.2
;;
	c0	add $r0.3 = $r0.24, $r0.3
	c0	cmpltu $r0.17 = $r0.5, $r0.20
	c0	or $r0.2 = $r0.13, $r0.2
	c0	mfb $r0.13 = $b0.0
	c0	or $r0.14 = $r0.18, $r0.14
	c0	add $r0.18 = $r0.16, $r0.12
	c0	cmpltu $r0.12 = $r0.12, $r0.15
;;
	c0	add $r0.2 = $r0.2, $r0.3
	c0	add $r0.3 = $r0.4, $r0.13
	c0	add $r0.4 = $r0.14, $r0.6
	c0	cmpltu $r0.6 = $r0.18, $r0.16
;;
	c0	add $r0.4 = $r0.4, $r0.12
	c0	cmpltu $b0.0 = $r0.3, $r0.5
;;
	c0	add $r0.4 = $r0.4, $r0.6
	c0	add $r0.2 = $r0.2, $r0.17
;;
	c0	add $r0.3 = $r0.4, $r0.3
	c0	mfb $r0.5 = $b0.0
	c0	stw 0[$r0.10] = $r0.11
;;
	c0	cmpltu $r0.4 = $r0.3, $r0.4
	c0	add $r0.2 = $r0.2, $r0.5
	c0	stw 0[$r0.9] = $r0.18
;;
	c0	add $r0.2 = $r0.2, $r0.4
	c0	stw 0[$r0.8] = $r0.3
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
	c0	mfb $r0.2 = $b0.1
	c0	mfb $r0.3 = $b0.0
;;
	c0	or $r0.2 = $r0.3, $r0.2
;;
.return ret($r0.3:u32)
	c0	and $r0.3 = $r0.2, 1
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
	c0	add $r0.2 = $r0.3, $r0.3
;;
	c0	cmpltu $b0.0 = $r0.2, -2097152
;;
;;
	c0	br $b0.0, LBB20_1
;;
## BB#2:                                ## %land.rhs
	c0	cmpne $b0.0 = $r0.4, 0
;;
;;
	c0	brf $b0.0, LBB20_4
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
LBB20_1:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB20_4:                                ## %lor.rhs
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
	c0	xor $r0.2 = $r0.2, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB21_1
;;
## BB#2:                                ## %land.rhs
	c0	cmpne $b0.0 = $r0.4, 0
;;
;;
	c0	brf $b0.0, LBB21_4
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
LBB21_1:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB21_4:                                ## %lor.rhs
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
	c0	add $r0.3 = $r0.2, $r0.5
	c0	mov $r0.4 = $r0.6
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
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	brf $b0.0, LBB31_2
;;
## BB#1:
.return ret($r0.3:u32)
	c0	mov $r0.3 = 0
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB31_2:                                ## %entry
	c0	cmpne $b0.0 = $r0.3, -2147483648
;;
;;
	c0	br $b0.0, LBB31_4
;;
## BB#3:                                ## %if.then.2
.return ret($r0.3:u32)
	c0	mov $r0.3 = -822083584
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB31_4:                                ## %if.end.3
	c0	mov $r0.2 = 31
	c0	mov $r0.4 = 16
	c0	mov $r0.5 = 8
	c0	mov $r0.6 = 22
	c0	mov $r0.7 = countLeadingZeros32.countLeadingZerosHigh
	c0	mov $r0.8 = 4
;;
	c0	shr $r0.9 = $r0.3, $r0.2
;;
	c0	add $r0.10 = $r0.3, $r0.9
;;
	c0	xor $r0.9 = $r0.10, $r0.9
;;
	c0	cmpltu $b0.0 = $r0.9, 65536
	c0	shl $r0.4 = $r0.9, $r0.4
;;
;;
	c0	slct $r0.4 = $b0.0, $r0.4, $r0.9
;;
	c0	cmpltu $b0.1 = $r0.4, 16777216
	c0	shl $r0.5 = $r0.4, $r0.5
;;
;;
	c0	slct $r0.4 = $b0.1, $r0.5, $r0.4
;;
	c0	shru $r0.4 = $r0.4, $r0.6
	c0	mfb $r0.5 = $b0.0
;;
	c0	and $r0.4 = $r0.4, 1020
	c0	shl $r0.5 = $r0.5, $r0.8
;;
	c0	add $r0.4 = $r0.7, $r0.4
	c0	or $r0.6 = $r0.5, 8
;;
	c0	ldw $r0.4 = 0[$r0.4]
	c0	slct $r0.5 = $b0.1, $r0.6, $r0.5
;;
;;
	c0	add $r0.4 = $r0.5, $r0.4
	c0	mov $r0.5 = 157
;;
	c0	add $r0.6 = $r0.4, -1
	c0	shru $r0.3 = $r0.3, $r0.2
	c0	sub $r0.4 = $r0.5, $r0.4
;;
	c0	shl $r0.5 = $r0.9, $r0.6
;;
.call roundAndPackFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = roundAndPackFloat32
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
	c0	mov $r0.2 = 0
	c0	cmpeq $b0.0 = $r0.3, 0
;;
	c0	mov $r0.4 = $r0.2
;;
	c0	br $b0.0, LBB32_8
;;
## BB#1:                                ## %if.end
	c0	mov $r0.2 = 31
	c0	mov $r0.4 = 16
	c0	mov $r0.5 = 8
	c0	mov $r0.6 = 22
	c0	mov $r0.7 = countLeadingZeros32.countLeadingZerosHigh
	c0	mov $r0.8 = 4
;;
	c0	shr $r0.2 = $r0.3, $r0.2
;;
	c0	add $r0.9 = $r0.3, $r0.2
;;
	c0	xor $r0.2 = $r0.9, $r0.2
;;
	c0	cmpltu $b0.0 = $r0.2, 65536
	c0	shl $r0.4 = $r0.2, $r0.4
;;
;;
	c0	slct $r0.4 = $b0.0, $r0.4, $r0.2
;;
	c0	cmpltu $b0.1 = $r0.4, 16777216
	c0	shl $r0.5 = $r0.4, $r0.5
;;
;;
	c0	slct $r0.4 = $b0.1, $r0.5, $r0.4
;;
	c0	shru $r0.4 = $r0.4, $r0.6
	c0	mfb $r0.5 = $b0.0
;;
	c0	and $r0.4 = $r0.4, 1020
	c0	shl $r0.5 = $r0.5, $r0.8
;;
	c0	add $r0.4 = $r0.7, $r0.4
	c0	or $r0.6 = $r0.5, 8
;;
	c0	ldw $r0.4 = 0[$r0.4]
	c0	slct $r0.5 = $b0.1, $r0.6, $r0.5
;;
;;
	c0	add $r0.5 = $r0.4, $r0.5
;;
	c0	add $r0.6 = $r0.5, -11
	c0	and $r0.3 = $r0.3, -2147483648
;;
	c0	cmplt $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB32_3
;;
## BB#2:                                ## %if.then.6
	c0	mov $r0.4 = 0
	c0	shl $r0.2 = $r0.2, $r0.6
	c0	goto LBB32_7
;;
LBB32_3:                                ## %if.else
	c0	mov $r0.6 = 11
	c0	mov $r0.4 = 0
;;
	c0	sub $r0.6 = $r0.6, $r0.5
;;
	c0	cmpeq $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB32_7
;;
## BB#4:                                ## %if.else.i
	c0	cmpgt $b0.0 = $r0.6, 31
;;
;;
	c0	br $b0.0, LBB32_6
;;
## BB#5:                                ## %if.then.2.i
	c0	sub $r0.4 = $r0.4, $r0.6
	c0	shru $r0.6 = $r0.2, $r0.6
;;
	c0	and $r0.4 = $r0.4, 31
;;
	c0	shl $r0.4 = $r0.2, $r0.4
	c0	mov $r0.2 = $r0.6
	c0	goto LBB32_7
;;
LBB32_6:                                ## %if.else.4.i
	c0	and $r0.4 = $r0.6, 31
	c0	cmplt $b0.0 = $r0.6, 64
;;
	c0	shru $r0.4 = $r0.2, $r0.4
	c0	mov $r0.2 = 0
;;
	c0	slct $r0.4 = $b0.0, $r0.4, 0
;;
LBB32_7:                                ## %if.end.8
	c0	mov $r0.6 = 1053
	c0	mov $r0.7 = 20
;;
	c0	sub $r0.5 = $r0.6, $r0.5
;;
	c0	shl $r0.5 = $r0.5, $r0.7
;;
	c0	add $r0.3 = $r0.5, $r0.3
;;
	c0	add $r0.2 = $r0.3, $r0.2
;;
LBB32_8:                                ## %cleanup
.return ret($r0.3:u32,$r0.4:u32)
	c0	mov $r0.3 = $r0.2
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
	c0	br $b0.0, LBB33_8
;;
## BB#1:                                ## %if.then
	c0	cmpltu $b0.0 = $r0.4, 158
;;
;;
	c0	br $b0.0, LBB33_7
;;
## BB#2:                                ## %if.then.4
	c0	cmpeq $b0.0 = $r0.3, -822083584
;;
;;
	c0	br $b0.0, LBB33_6
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
	c0	br $b0.0, LBB33_20
;;
## BB#4:                                ## %lor.lhs.false
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB33_6
;;
## BB#5:                                ## %lor.lhs.false
	c0	cmpeq $b0.0 = $r0.4, 255
;;
;;
	c0	br $b0.0, LBB33_20
;;
LBB33_6:                                ## %if.end.10
.return ret($r0.3:u32)
	c0	mov $r0.3 = -2147483648
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB33_8:                                ## %if.else
	c0	cmpgtu $b0.0 = $r0.4, 125
;;
;;
	c0	br $b0.0, LBB33_10
;;
## BB#9:                                ## %if.then.17
	c0	mov $r0.3 = 0
	c0	or $r0.4 = $r0.4, $r0.5
	c0	goto LBB33_11
;;
LBB33_7:                                ## %if.end.11
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
LBB33_10:                               ## %if.else.19
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
LBB33_11:                               ## %if.end.23
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB33_13
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
LBB33_13:                               ## %if.end.27
	c0	mov $r0.5 = float_rounding_mode
;;
	c0	ldw $r0.5 = 0[$r0.5]
;;
;;
	c0	cmpne $b0.0 = $r0.5, 0
;;
;;
	c0	brf $b0.0, LBB33_14
;;
## BB#17:                               ## %if.else.42
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB33_19
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
LBB33_14:                               ## %if.then.29
	c0	cmpgt $b0.0 = $r0.4, -1
;;
;;
	c0	br $b0.0, LBB33_16
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
LBB33_16:                               ## %if.end.37
	c0	mov $r0.4 = 0
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	sub $r0.2 = $r0.4, $r0.3
;;
.return ret($r0.3:u32)
	c0	slct $r0.3 = $b0.0, $r0.3, $r0.2
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB33_19:                               ## %if.else.50
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
LBB33_20:                               ## %cleanup
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
	c0	br $b0.0, LBB34_6
;;
## BB#1:                                ## %if.then
	c0	cmpeq $b0.0 = $r0.3, -822083584
;;
;;
	c0	br $b0.0, LBB34_5
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
	c0	br $b0.0, LBB34_12
;;
## BB#3:                                ## %lor.lhs.false
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB34_5
;;
## BB#4:                                ## %lor.lhs.false
	c0	cmpeq $b0.0 = $r0.2, 255
;;
;;
	c0	br $b0.0, LBB34_12
;;
LBB34_5:                                ## %if.end.8
.return ret($r0.3:u32)
	c0	mov $r0.3 = -2147483648
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB34_6:                                ## %if.else
	c0	cmpgtu $b0.0 = $r0.2, 126
;;
;;
	c0	br $b0.0, LBB34_9
;;
## BB#7:                                ## %if.then.10
	c0	or $r0.2 = $r0.2, $r0.5
	c0	mov $r0.3 = 0
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB34_12
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
LBB34_9:                                ## %if.end.16
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
	c0	br $b0.0, LBB34_11
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
LBB34_11:                               ## %if.end.23
	c0	mov $r0.3 = 0
	c0	cmpeq $b0.0 = $r0.4, 0
;;
	c0	sub $r0.3 = $r0.3, $r0.2
;;
	c0	slct $r0.3 = $b0.0, $r0.2, $r0.3
;;
LBB34_12:                               ## %cleanup
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
	c0	and $r0.4 = $r0.3, 8388607
	c0	shru $r0.5 = $r0.3, $r0.2
;;
;;
	c0	brf $b0.0, LBB35_1
;;
## BB#8:                                ## %if.then.9
	c0	cmpne $b0.0 = $r0.4, 0
;;
;;
	c0	brf $b0.0, LBB35_9
;;
## BB#10:                               ## %if.end.13
	c0	cmpltu $b0.0 = $r0.4, 65536
	c0	mov $r0.6 = 16
	c0	mov $r0.7 = 8
	c0	mov $r0.8 = 22
	c0	mov $r0.9 = countLeadingZeros32.countLeadingZerosHigh
	c0	mov $r0.10 = 4
;;
	c0	shl $r0.3 = $r0.3, $r0.6
;;
	c0	slct $r0.3 = $b0.0, $r0.3, $r0.4
;;
	c0	cmpltu $b0.1 = $r0.3, 16777216
	c0	shl $r0.6 = $r0.3, $r0.7
;;
;;
	c0	slct $r0.3 = $b0.1, $r0.6, $r0.3
;;
	c0	shru $r0.3 = $r0.3, $r0.8
	c0	mfb $r0.6 = $b0.0
;;
	c0	and $r0.3 = $r0.3, 1020
	c0	shl $r0.6 = $r0.6, $r0.10
;;
	c0	add $r0.3 = $r0.9, $r0.3
	c0	or $r0.8 = $r0.6, 8
;;
	c0	ldw $r0.3 = 0[$r0.3]
	c0	slct $r0.6 = $b0.1, $r0.8, $r0.6
;;
;;
	c0	add $r0.3 = $r0.3, $r0.6
;;
	c0	add $r0.8 = $r0.3, -8
	c0	sub $r0.6 = $r0.7, $r0.3
;;
	c0	shl $r0.4 = $r0.4, $r0.8
	c0	goto LBB35_11
;;
LBB35_1:                                ## %entry
	c0	cmpne $b0.0 = $r0.6, 255
;;
;;
	c0	br $b0.0, LBB35_11
;;
## BB#2:                                ## %if.then
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB35_7
;;
## BB#3:                                ## %if.then.3
	c0	and $r0.4 = $r0.3, 2143289344
;;
	c0	cmpne $b0.0 = $r0.4, 2139095040
;;
;;
	c0	br $b0.0, LBB35_6
;;
## BB#4:                                ## %if.then.3
	c0	and $r0.4 = $r0.3, 4194303
;;
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB35_6
;;
## BB#5:                                ## %if.then.i
	c0	mov $r0.4 = float_exception_flags
;;
	c0	ldw $r0.6 = 0[$r0.4]
;;
;;
	c0	or $r0.6 = $r0.6, 16
;;
	c0	stw 0[$r0.4] = $r0.6
;;
LBB35_6:                                ## %float32ToCommonNaN.exit
	c0	mov $r0.4 = 9
	c0	mov $r0.6 = 12
	c0	shl $r0.2 = $r0.5, $r0.2
	c0	mov $r0.5 = 29
;;
	c0	shl $r0.7 = $r0.3, $r0.4
	c0	shl $r0.4 = $r0.3, $r0.5
;;
	c0	shru $r0.3 = $r0.7, $r0.6
;;
	c0	or $r0.2 = $r0.3, $r0.2
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	or $r0.3 = $r0.2, 2146959360
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB35_11:                               ## %if.end.14
	c0	shl $r0.2 = $r0.5, $r0.2
	c0	mov $r0.3 = 3
	c0	mov $r0.5 = 20
	c0	mov $r0.7 = 29
;;
	c0	or $r0.2 = $r0.2, 939524096
	c0	shl $r0.5 = $r0.6, $r0.5
	c0	shru $r0.3 = $r0.4, $r0.3
	c0	shl $r0.4 = $r0.4, $r0.7
;;
	c0	add $r0.2 = $r0.2, $r0.3
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	add $r0.3 = $r0.2, $r0.5
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB35_9:                                ## %if.then.11
.return ret($r0.3:u32,$r0.4:u32)
	c0	mov $r0.4 = 0
	c0	shl $r0.3 = $r0.5, $r0.2
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB35_7:                                ## %if.end
	c0	shl $r0.2 = $r0.5, $r0.2
	c0	mov $r0.4 = 0
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	or $r0.3 = $r0.2, 2146435072
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
	c0	br $b0.0, LBB36_8
;;
## BB#1:                                ## %if.then
	c0	and $r0.4 = $r0.3, 8388607
;;
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB36_27
;;
## BB#2:                                ## %if.then
	c0	cmpne $b0.0 = $r0.2, 255
;;
;;
	c0	br $b0.0, LBB36_27
;;
## BB#3:                                ## %if.then.3
	c0	and $r0.4 = $r0.3, 2143289344
	c0	or $r0.2 = $r0.3, 4194304
;;
	c0	cmpne $b0.0 = $r0.4, 2139095040
;;
;;
	c0	br $b0.0, LBB36_4
;;
## BB#5:                                ## %if.then.3
	c0	and $r0.3 = $r0.3, 4194303
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB36_6
;;
## BB#7:                                ## %cond.end.15.i
	c0	mov $r0.4 = float_exception_flags
	c0	mov $r0.3 = $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.4]
;;
;;
	c0	or $r0.2 = $r0.2, 16
	c0	goto LBB36_26
;;
LBB36_8:                                ## %if.end.5
	c0	cmpgtu $b0.0 = $r0.2, 126
;;
;;
	c0	br $b0.0, LBB36_19
;;
## BB#9:                                ## %if.then.7
	c0	and $r0.4 = $r0.3, 2147483647
;;
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB36_27
;;
## BB#10:                               ## %if.end.10
	c0	mov $r0.7 = float_exception_flags
	c0	mov $r0.5 = float_rounding_mode
	c0	mov $r0.4 = 31
;;
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
	c0	br $b0.0, LBB36_16
;;
## BB#11:                               ## %if.end.10
	c0	cmpeq $b0.0 = $r0.6, 2
;;
;;
	c0	brf $b0.0, LBB36_12
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
LBB36_19:                               ## %if.end.25
	c0	mov $r0.5 = float_rounding_mode
	c0	mov $r0.7 = 150
	c0	mov $r0.6 = 1
	c0	mov $r0.4 = $r0.3
;;
	c0	sub $r0.2 = $r0.7, $r0.2
	c0	ldw $r0.7 = 0[$r0.5]
;;
	c0	shl $r0.2 = $r0.6, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.7, 1
;;
;;
	c0	br $b0.0, LBB36_24
;;
## BB#20:                               ## %if.end.25
	c0	cmpne $b0.0 = $r0.7, 0
	c0	add $r0.5 = $r0.2, -1
;;
;;
	c0	br $b0.0, LBB36_23
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
	c0	br $b0.0, LBB36_24
;;
## BB#22:                               ## %if.then.31
	c0	andc $r0.4 = $r0.2, $r0.4
	c0	goto LBB36_24
;;
LBB36_4:
.return ret($r0.3:u32)
	c0	mov $r0.3 = $r0.2
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB36_6:
.return ret($r0.3:u32)
	c0	mov $r0.3 = $r0.2
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB36_23:                               ## %if.then.35
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
LBB36_24:                               ## %if.end.43
	c0	mov $r0.5 = 0
;;
	c0	sub $r0.2 = $r0.5, $r0.2
;;
	c0	and $r0.2 = $r0.4, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.3
;;
;;
	c0	br $b0.0, LBB36_27
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
LBB36_26:                               ## %cleanup
	c0	stw 0[$r0.4] = $r0.2
;;
LBB36_27:                               ## %cleanup
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB36_16:                               ## %sw.bb.19
	c0	cmpne $b0.0 = $r0.5, 0
	c0	mov $r0.2 = -1082130432
;;
;;
.return ret($r0.3:u32)
	c0	slct $r0.3 = $b0.0, $r0.2, 0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB36_12:                               ## %if.end.10
	c0	cmpne $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB36_18
;;
## BB#13:                               ## %sw.bb
	c0	and $r0.3 = $r0.3, 8388607
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB36_18
;;
## BB#14:                               ## %sw.bb
	c0	cmpne $b0.0 = $r0.2, 126
;;
;;
	c0	br $b0.0, LBB36_18
;;
## BB#15:                               ## %if.then.16
	c0	shl $r0.2 = $r0.5, $r0.4
;;
.return ret($r0.3:u32)
	c0	or $r0.3 = $r0.2, 1065353216
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB36_18:                               ## %sw.epilog
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
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.6 = $r0.4, $r0.2
	c0	shru $r0.5 = $r0.3, $r0.2
;;
	c0	cmpne $b0.0 = $r0.5, $r0.6
;;
;;
	c0	br $b0.0, LBB37_2
;;
## BB#1:                                ## %if.then
.call addFloat32Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = addFloat32Sigs
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB37_2:                                ## %if.else
.call subFloat32Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = subFloat32Sigs
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
	c0	and $r0.6 = $r0.11, 536870848
;;
;;
	c0	br $b0.0, LBB38_13
;;
## BB#1:                                ## %if.then
	c0	cmpne $b0.0 = $r0.2, 255
;;
;;
	c0	br $b0.0, LBB38_8
;;
## BB#2:                                ## %if.then.6
	c0	cmpeq $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB38_41
;;
## BB#3:                                ## %if.then.7
	c0	and $r0.6 = $r0.4, 4194303
	c0	and $r0.2 = $r0.3, 2143289344
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.5 = $r0.3, 4194303
;;
	c0	cmpne $b0.0 = $r0.6, 0
	c0	cmpne $b0.1 = $r0.5, 0
	c0	cmpeq $b0.2 = $r0.7, 2139095040
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
	c0	br $b0.1, LBB38_5
;;
## BB#4:                                ## %if.then.7
	c0	mfb $r0.6 = $b0.0
;;
	c0	cmpne $b0.1 = $r0.6, 1
;;
;;
	c0	br $b0.1, LBB38_6
;;
LBB38_5:                                ## %if.then.i.152
	c0	mov $r0.6 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.6]
;;
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.6] = $r0.7
;;
LBB38_6:                                ## %if.end.i.153
	c0	or $r0.6 = $r0.4, 4194304
	c0	brf $b0.0, LBB38_35
;;
## BB#7:
.return ret($r0.3:u32)
	c0	mov $r0.3 = $r0.6
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB38_13:                               ## %if.else.13
	c0	cmpgt $b0.0 = $r0.9, -1
;;
;;
	c0	brf $b0.0, LBB38_14
;;
## BB#27:                               ## %if.else.30
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB38_28
;;
## BB#36:                               ## %if.then.40
	c0	add $r0.2 = $r0.6, $r0.7
	c0	mov $r0.3 = 31
;;
	c0	shl $r0.3 = $r0.5, $r0.3
	c0	shru $r0.2 = $r0.2, $r0.10
;;
.return ret($r0.3:u32)
	c0	or $r0.3 = $r0.2, $r0.3
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB38_8:                                ## %if.end.9
	c0	cmpeq $b0.0 = $r0.8, 0
;;
;;
	c0	br $b0.0, LBB38_10
;;
## BB#9:                                ## %if.end.12.thread
	c0	or $r0.6 = $r0.6, 536870912
	c0	goto LBB38_11
;;
LBB38_14:                               ## %if.then.15
	c0	cmpne $b0.0 = $r0.8, 255
;;
;;
	c0	br $b0.0, LBB38_22
;;
## BB#15:                               ## %if.then.17
	c0	cmpeq $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB38_21
;;
## BB#16:                               ## %if.then.19
	c0	and $r0.6 = $r0.4, 4194303
	c0	and $r0.2 = $r0.3, 2143289344
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.5 = $r0.3, 4194303
;;
	c0	cmpne $b0.0 = $r0.6, 0
	c0	cmpne $b0.1 = $r0.5, 0
	c0	cmpeq $b0.2 = $r0.7, 2139095040
	c0	cmpeq $b0.3 = $r0.2, 2139095040
;;
;;
	c0	mfb $r0.6 = $b0.2
	c0	mfb $r0.7 = $b0.3
	c0	mfb $r0.8 = $b0.0
	c0	mfb $r0.9 = $b0.1
;;
	c0	and $r0.6 = $r0.6, $r0.8
	c0	and $r0.7 = $r0.7, $r0.9
;;
	c0	mtb $b0.0 = $r0.6
	c0	mtb $b0.1 = $r0.7
;;
;;
	c0	br $b0.1, LBB38_18
;;
## BB#17:                               ## %if.then.19
	c0	mfb $r0.6 = $b0.0
;;
	c0	cmpne $b0.1 = $r0.6, 1
;;
;;
	c0	br $b0.1, LBB38_19
;;
LBB38_18:                               ## %if.then.i.115
	c0	mov $r0.6 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.6]
;;
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.6] = $r0.7
;;
LBB38_19:                               ## %if.end.i.116
	c0	or $r0.6 = $r0.4, 4194304
	c0	brf $b0.0, LBB38_35
;;
## BB#20:
.return ret($r0.3:u32)
	c0	mov $r0.3 = $r0.6
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB38_28:                               ## %if.else.30
	c0	cmpne $b0.0 = $r0.2, 255
;;
;;
	c0	br $b0.0, LBB38_37
;;
## BB#29:                               ## %if.then.32
	c0	or $r0.2 = $r0.6, $r0.7
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB38_41
;;
## BB#30:                               ## %if.then.35
	c0	and $r0.6 = $r0.4, 4194303
	c0	and $r0.2 = $r0.3, 2143289344
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.5 = $r0.3, 4194303
;;
	c0	cmpne $b0.0 = $r0.6, 0
	c0	cmpne $b0.1 = $r0.5, 0
	c0	cmpeq $b0.2 = $r0.7, 2139095040
	c0	cmpeq $b0.3 = $r0.2, 2139095040
;;
;;
	c0	mfb $r0.6 = $b0.2
	c0	mfb $r0.7 = $b0.3
	c0	mfb $r0.8 = $b0.0
	c0	mfb $r0.9 = $b0.1
;;
	c0	and $r0.6 = $r0.6, $r0.8
	c0	and $r0.7 = $r0.7, $r0.9
;;
	c0	mtb $b0.0 = $r0.6
	c0	mtb $b0.1 = $r0.7
;;
;;
	c0	br $b0.1, LBB38_32
;;
## BB#31:                               ## %if.then.35
	c0	mfb $r0.6 = $b0.0
;;
	c0	cmpne $b0.1 = $r0.6, 1
;;
;;
	c0	br $b0.1, LBB38_33
;;
LBB38_32:                               ## %if.then.i
	c0	mov $r0.6 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.6]
;;
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.6] = $r0.7
;;
LBB38_33:                               ## %if.end.i
	c0	or $r0.6 = $r0.4, 4194304
	c0	brf $b0.0, LBB38_35
;;
## BB#34:
.return ret($r0.3:u32)
	c0	mov $r0.3 = $r0.6
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB38_35:                               ## %cond.false.i.157
	c0	cmpeq $b0.0 = $r0.5, 0
	c0	or $r0.3 = $r0.3, 4194304
	c0	and $r0.4 = $r0.4, 2147483647
	c0	cmpne $b0.1 = $r0.2, 2139095040
;;
	c0	cmpgtu $b0.2 = $r0.4, 2139095040
;;
	c0	slct $r0.2 = $b0.0, $r0.6, $r0.3
;;
	c0	slct $r0.2 = $b0.1, $r0.6, $r0.2
;;
.return ret($r0.3:u32)
	c0	slct $r0.3 = $b0.2, $r0.2, $r0.3
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB38_10:                               ## %if.end.12
	c0	add $r0.9 = $r0.9, -1
;;
	c0	cmpeq $b0.0 = $r0.9, 0
;;
;;
	c0	br $b0.0, LBB38_39
;;
LBB38_11:                               ## %if.else.i.126
	c0	cmpgt $b0.0 = $r0.9, 31
;;
;;
	c0	br $b0.0, LBB38_38
;;
## BB#12:                               ## %if.then.2.i.133
	c0	mov $r0.3 = 0
;;
	c0	sub $r0.3 = $r0.3, $r0.9
;;
	c0	and $r0.3 = $r0.3, 31
	c0	shru $r0.4 = $r0.6, $r0.9
;;
	c0	shl $r0.3 = $r0.6, $r0.3
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	mfb $r0.3 = $b0.0
;;
	c0	or $r0.6 = $r0.3, $r0.4
	c0	goto LBB38_39
;;
LBB38_38:                               ## %if.else.4.i.136
	c0	cmpne $b0.0 = $r0.6, 0
;;
;;
	c0	mfb $r0.6 = $b0.0
	c0	goto LBB38_39
;;
LBB38_22:                               ## %if.end.23
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
	c0	br $b0.0, LBB38_23
;;
## BB#24:                               ## %if.else.i
	c0	cmplt $b0.0 = $r0.2, -31
;;
;;
	c0	br $b0.0, LBB38_26
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
	c0	goto LBB38_39
;;
LBB38_37:                               ## %if.end.42
	c0	or $r0.3 = $r0.7, 1073741824
;;
	c0	add $r0.6 = $r0.3, $r0.6
	c0	goto LBB38_40
;;
LBB38_21:                               ## %if.end.21
	c0	mov $r0.2 = 31
;;
	c0	shl $r0.2 = $r0.5, $r0.2
;;
.return ret($r0.3:u32)
	c0	or $r0.3 = $r0.2, 2139095040
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB38_23:
	c0	mov $r0.2 = $r0.8
	c0	goto LBB38_39
;;
LBB38_26:                               ## %if.else.4.i
	c0	cmpne $b0.0 = $r0.7, 0
	c0	mov $r0.2 = $r0.8
;;
;;
	c0	mfb $r0.7 = $b0.0
;;
LBB38_39:                               ## %if.end.46
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
LBB38_40:                               ## %roundAndPack
	c0	mov $r0.4 = $r0.2
	c0	mov $r0.3 = $r0.5
	c0	mov $r0.5 = $r0.6
;;
.call roundAndPackFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = roundAndPackFloat32
;;
LBB38_41:                               ## %cleanup
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
	c0	and $r0.6 = $r0.6, 1073741696
;;
;;
	c0	brf $b0.0, LBB39_1
;;
## BB#25:                               ## %aExpBigger
	c0	cmpne $b0.0 = $r0.8, 255
;;
;;
	c0	br $b0.0, LBB39_27
;;
## BB#26:                               ## %if.then.45
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB39_17
;;
	c0	goto LBB39_36
;;
LBB39_1:                                ## %if.end
	c0	cmplt $b0.0 = $r0.9, 0
;;
;;
	c0	br $b0.0, LBB39_15
;;
## BB#2:                                ## %if.end.7
	c0	cmpeq $b0.0 = $r0.8, 0
;;
;;
	c0	brf $b0.0, LBB39_3
;;
## BB#11:                               ## %if.then.15
	c0	mov $r0.8 = 1
;;
	c0	mov $r0.7 = $r0.8
	c0	goto LBB39_12
;;
LBB39_27:                               ## %if.end.50
	c0	cmpeq $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB39_29
;;
## BB#28:                               ## %if.end.56.thread
	c0	or $r0.6 = $r0.6, 1073741824
	c0	goto LBB39_30
;;
LBB39_15:                               ## %bExpBigger
	c0	cmpne $b0.0 = $r0.7, 255
;;
;;
	c0	br $b0.0, LBB39_19
;;
## BB#16:                               ## %if.then.27
	c0	cmpeq $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB39_18
;;
LBB39_17:                               ## %if.then.29
	c0	and $r0.2 = $r0.4, 4194303
	c0	and $r0.5 = $r0.3, 2143289344
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.6 = $r0.3, 4194303
;;
	c0	cmpne $b0.0 = $r0.2, 0
	c0	cmpne $b0.1 = $r0.6, 0
	c0	cmpeq $b0.2 = $r0.7, 2139095040
	c0	cmpeq $b0.3 = $r0.5, 2139095040
;;
;;
	c0	mfb $r0.2 = $b0.2
	c0	mfb $r0.7 = $b0.3
	c0	mfb $r0.8 = $b0.0
	c0	mfb $r0.9 = $b0.1
;;
	c0	and $r0.2 = $r0.2, $r0.8
	c0	and $r0.7 = $r0.7, $r0.9
;;
	c0	mtb $b0.0 = $r0.2
	c0	mtb $b0.1 = $r0.7
;;
;;
	c0	brf $b0.1, LBB39_6
;;
	c0	goto LBB39_7
;;
LBB39_3:                                ## %if.end.7
	c0	cmpne $b0.0 = $r0.8, 255
;;
;;
	c0	br $b0.0, LBB39_12
;;
## BB#4:                                ## %if.then.9
	c0	or $r0.2 = $r0.6, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB39_10
;;
## BB#5:                                ## %if.then.10
	c0	and $r0.2 = $r0.4, 4194303
	c0	and $r0.5 = $r0.3, 2143289344
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.6 = $r0.3, 4194303
;;
	c0	cmpne $b0.0 = $r0.2, 0
	c0	cmpne $b0.1 = $r0.6, 0
	c0	cmpeq $b0.2 = $r0.7, 2139095040
	c0	cmpeq $b0.3 = $r0.5, 2139095040
;;
;;
	c0	mfb $r0.2 = $b0.3
	c0	mfb $r0.7 = $b0.2
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
	c0	br $b0.1, LBB39_7
;;
LBB39_6:                                ## %if.then.10
	c0	mfb $r0.2 = $b0.0
;;
	c0	cmpne $b0.1 = $r0.2, 1
;;
;;
	c0	br $b0.1, LBB39_8
;;
LBB39_7:                                ## %if.then.i.157
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.2]
;;
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.2] = $r0.7
;;
LBB39_8:                                ## %if.end.i.158
	c0	or $r0.2 = $r0.4, 4194304
	c0	br $b0.0, LBB39_37
;;
## BB#9:                                ## %cond.false.i.162
	c0	cmpeq $b0.0 = $r0.6, 0
	c0	or $r0.3 = $r0.3, 4194304
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
;;
.return ret($r0.3:u32)
	c0	mov $r0.3 = $r0.2
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB39_12:                               ## %if.end.16
	c0	cmpltu $b0.0 = $r0.6, $r0.2
;;
;;
	c0	br $b0.0, LBB39_34
;;
## BB#13:                               ## %if.end.19
	c0	cmpltu $b0.0 = $r0.2, $r0.6
;;
;;
	c0	br $b0.0, LBB39_24
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
;;
.return ret($r0.3:u32)
	c0	mov $r0.3 = $r0.2
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB39_29:                               ## %if.end.56
	c0	add $r0.9 = $r0.9, -1
;;
	c0	cmpeq $b0.0 = $r0.9, 0
;;
;;
	c0	br $b0.0, LBB39_33
;;
LBB39_30:                               ## %if.else.i
	c0	cmpgt $b0.0 = $r0.9, 31
;;
;;
	c0	br $b0.0, LBB39_32
;;
## BB#31:                               ## %if.then.2.i
	c0	mov $r0.3 = 0
;;
	c0	sub $r0.3 = $r0.3, $r0.9
;;
	c0	and $r0.3 = $r0.3, 31
	c0	shru $r0.4 = $r0.6, $r0.9
;;
	c0	shl $r0.3 = $r0.6, $r0.3
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	mfb $r0.3 = $b0.0
;;
	c0	or $r0.6 = $r0.3, $r0.4
	c0	goto LBB39_33
;;
LBB39_32:                               ## %if.else.4.i
	c0	cmpne $b0.0 = $r0.6, 0
;;
;;
	c0	mfb $r0.6 = $b0.0
;;
LBB39_33:                               ## %shift32RightJamming.exit
	c0	or $r0.2 = $r0.2, 1073741824
;;
LBB39_34:                               ## %aBigger
	c0	sub $r0.2 = $r0.2, $r0.6
	c0	mov $r0.7 = $r0.8
	c0	goto LBB39_35
;;
LBB39_19:                               ## %if.end.33
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
	c0	br $b0.0, LBB39_23
;;
## BB#20:                               ## %if.else.i.106
	c0	cmplt $b0.0 = $r0.3, -31
;;
;;
	c0	br $b0.0, LBB39_22
;;
## BB#21:                               ## %if.then.2.i.113
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
	c0	goto LBB39_23
;;
LBB39_18:                               ## %if.end.31
	c0	mov $r0.2 = 31
;;
	c0	shl $r0.2 = $r0.5, $r0.2
;;
	c0	add $r0.2 = $r0.2, -8388608
;;
.return ret($r0.3:u32)
	c0	mov $r0.3 = $r0.2
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB39_10:                               ## %if.end.12
	c0	mov $r0.3 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.3]
	c0	mov $r0.2 = 2147483647
;;
;;
	c0	or $r0.4 = $r0.4, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.3] = $r0.4
	c0	mov $r0.3 = $r0.2
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB39_22:                               ## %if.else.4.i.116
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
LBB39_23:                               ## %shift32RightJamming.exit118
	c0	or $r0.6 = $r0.6, 1073741824
;;
LBB39_24:                               ## %bBigger
	c0	xor $r0.5 = $r0.5, 1
	c0	sub $r0.2 = $r0.6, $r0.2
;;
LBB39_35:                               ## %normalizeRoundAndPack
	c0	mov $r0.3 = 16
	c0	cmpltu $b0.0 = $r0.2, 65536
	c0	mov $r0.4 = 8
	c0	mov $r0.6 = 22
	c0	mov $r0.8 = 4
	c0	mov $r0.9 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	shl $r0.3 = $r0.2, $r0.3
;;
	c0	mfb $r0.10 = $b0.0
	c0	add $r0.7 = $r0.7, -1
;;
	c0	shl $r0.8 = $r0.10, $r0.8
	c0	slct $r0.3 = $b0.0, $r0.3, $r0.2
;;
	c0	or $r0.10 = $r0.8, 8
	c0	cmpltu $b0.0 = $r0.3, 16777216
	c0	shl $r0.4 = $r0.3, $r0.4
;;
;;
	c0	slct $r0.3 = $b0.0, $r0.4, $r0.3
;;
	c0	shru $r0.3 = $r0.3, $r0.6
;;
	c0	and $r0.3 = $r0.3, 1020
;;
	c0	add $r0.3 = $r0.9, $r0.3
;;
	c0	ldw $r0.3 = 0[$r0.3]
	c0	slct $r0.4 = $b0.0, $r0.10, $r0.8
;;
;;
	c0	add $r0.3 = $r0.3, $r0.4
;;
	c0	add $r0.4 = $r0.3, -1
	c0	mov $r0.3 = $r0.5
;;
	c0	shl $r0.5 = $r0.2, $r0.4
	c0	sub $r0.4 = $r0.7, $r0.4
;;
.call roundAndPackFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = roundAndPackFloat32
;;
LBB39_36:                               ## %cleanup
	c0	mov $r0.2 = $r0.3
;;
LBB39_37:                               ## %cleanup
.return ret($r0.3:u32)
	c0	mov $r0.3 = $r0.2
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

#.globl float32_sub
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_sub
float32_sub::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.6 = $r0.4, $r0.2
	c0	shru $r0.5 = $r0.3, $r0.2
;;
	c0	cmpne $b0.0 = $r0.5, $r0.6
;;
;;
	c0	br $b0.0, LBB40_2
;;
## BB#1:                                ## %if.then
.call subFloat32Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = subFloat32Sigs
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB40_2:                                ## %if.else
.call addFloat32Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = addFloat32Sigs
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
	c0	mov $r0.5 = 23
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.7 = 31
;;
	c0	xor $r0.3 = $r0.4, $r0.2
	c0	shru $r0.6 = $r0.2, $r0.5
	c0	shru $r0.8 = $r0.4, $r0.5
;;
	c0	zxtb $r0.9 = $r0.6
;;
	c0	cmpne $b0.0 = $r0.9, 255
	c0	and $r0.6 = $r0.2, 8388607
	c0	and $r0.5 = $r0.4, 8388607
	c0	shru $r0.3 = $r0.3, $r0.7
	c0	zxtb $r0.8 = $r0.8
;;
;;
	c0	br $b0.0, LBB41_13
;;
## BB#1:                                ## %if.then
	c0	cmpne $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB41_4
;;
## BB#2:                                ## %lor.lhs.false
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB41_10
;;
## BB#3:                                ## %lor.lhs.false
	c0	cmpne $b0.0 = $r0.8, 255
;;
;;
	c0	br $b0.0, LBB41_10
;;
LBB41_4:                                ## %if.then.8
	c0	and $r0.3 = $r0.4, 4194303
	c0	and $r0.5 = $r0.2, 2143289344
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.6 = $r0.2, 4194303
;;
	c0	cmpne $b0.0 = $r0.3, 0
	c0	cmpne $b0.1 = $r0.6, 0
	c0	cmpeq $b0.2 = $r0.7, 2139095040
	c0	cmpeq $b0.3 = $r0.5, 2139095040
;;
;;
	c0	mfb $r0.3 = $b0.0
	c0	mfb $r0.7 = $b0.2
	c0	mfb $r0.8 = $b0.1
	c0	mfb $r0.9 = $b0.3
;;
	c0	and $r0.3 = $r0.7, $r0.3
	c0	and $r0.7 = $r0.9, $r0.8
	c0	goto LBB41_5
;;
LBB41_13:                               ## %if.end.14
	c0	cmpne $b0.0 = $r0.8, 255
;;
;;
	c0	br $b0.0, LBB41_18
;;
## BB#14:                               ## %if.then.16
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB41_16
;;
## BB#15:                               ## %if.then.18
	c0	and $r0.3 = $r0.4, 4194303
	c0	and $r0.5 = $r0.2, 2143289344
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.6 = $r0.2, 4194303
;;
	c0	cmpne $b0.0 = $r0.3, 0
	c0	cmpne $b0.1 = $r0.6, 0
	c0	cmpeq $b0.2 = $r0.7, 2139095040
	c0	cmpeq $b0.3 = $r0.5, 2139095040
;;
;;
	c0	mfb $r0.3 = $b0.2
	c0	mfb $r0.7 = $b0.3
	c0	mfb $r0.8 = $b0.0
	c0	mfb $r0.9 = $b0.1
;;
	c0	and $r0.3 = $r0.3, $r0.8
	c0	and $r0.7 = $r0.7, $r0.9
;;
LBB41_5:                                ## %if.then.8
	c0	mtb $b0.0 = $r0.3
	c0	mtb $b0.1 = $r0.7
;;
;;
	c0	br $b0.1, LBB41_7
;;
## BB#6:                                ## %if.then.8
	c0	mfb $r0.3 = $b0.0
;;
	c0	cmpne $b0.1 = $r0.3, 1
;;
;;
	c0	br $b0.1, LBB41_8
;;
LBB41_7:                                ## %if.then.i.121
	c0	mov $r0.3 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.3]
;;
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.3] = $r0.7
;;
LBB41_8:                                ## %if.end.i.122
	c0	or $r0.3 = $r0.4, 4194304
	c0	br $b0.0, LBB41_27
;;
## BB#9:                                ## %cond.false.i.126
	c0	cmpeq $b0.0 = $r0.6, 0
	c0	or $r0.2 = $r0.2, 4194304
	c0	and $r0.4 = $r0.4, 2147483647
	c0	cmpne $b0.1 = $r0.5, 2139095040
;;
	c0	cmpgtu $b0.2 = $r0.4, 2139095040
;;
	c0	slct $r0.4 = $b0.0, $r0.3, $r0.2
;;
	c0	slct $r0.3 = $b0.1, $r0.3, $r0.4
;;
.return ret($r0.3:u32)
	c0	slct $r0.3 = $b0.2, $r0.3, $r0.2
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB41_18:                               ## %if.end.26
	c0	cmpne $b0.0 = $r0.9, 0
;;
;;
	c0	br $b0.0, LBB41_22
;;
## BB#19:                               ## %if.then.28
	c0	cmpne $b0.0 = $r0.6, 0
;;
;;
	c0	brf $b0.0, LBB41_20
;;
## BB#21:                               ## %if.end.32
	c0	cmpltu $b0.0 = $r0.6, 65536
	c0	mov $r0.9 = 16
	c0	mov $r0.10 = 8
	c0	mov $r0.11 = 22
	c0	mov $r0.12 = countLeadingZeros32.countLeadingZerosHigh
	c0	mov $r0.13 = 4
;;
	c0	shl $r0.2 = $r0.2, $r0.9
;;
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.6
;;
	c0	cmpltu $b0.1 = $r0.2, 16777216
	c0	shl $r0.9 = $r0.2, $r0.10
;;
;;
	c0	slct $r0.2 = $b0.1, $r0.9, $r0.2
;;
	c0	shru $r0.2 = $r0.2, $r0.11
	c0	mfb $r0.9 = $b0.0
;;
	c0	and $r0.2 = $r0.2, 1020
	c0	shl $r0.9 = $r0.9, $r0.13
;;
	c0	add $r0.2 = $r0.12, $r0.2
	c0	or $r0.10 = $r0.9, 8
;;
	c0	ldw $r0.2 = 0[$r0.2]
	c0	slct $r0.9 = $b0.1, $r0.10, $r0.9
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
LBB41_22:                               ## %if.end.33
	c0	cmpne $b0.0 = $r0.8, 0
;;
;;
	c0	br $b0.0, LBB41_26
;;
## BB#23:                               ## %if.then.35
	c0	cmpne $b0.0 = $r0.5, 0
;;
;;
	c0	brf $b0.0, LBB41_24
;;
## BB#25:                               ## %if.end.39
	c0	cmpltu $b0.0 = $r0.5, 65536
	c0	mov $r0.2 = 16
	c0	mov $r0.7 = 8
	c0	mov $r0.8 = 22
	c0	mov $r0.10 = countLeadingZeros32.countLeadingZerosHigh
	c0	mov $r0.11 = 4
;;
	c0	shl $r0.2 = $r0.4, $r0.2
;;
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.5
;;
	c0	cmpltu $b0.1 = $r0.2, 16777216
	c0	shl $r0.4 = $r0.2, $r0.7
;;
;;
	c0	slct $r0.2 = $b0.1, $r0.4, $r0.2
;;
	c0	shru $r0.2 = $r0.2, $r0.8
	c0	mfb $r0.4 = $b0.0
;;
	c0	and $r0.2 = $r0.2, 1020
	c0	shl $r0.4 = $r0.4, $r0.11
;;
	c0	add $r0.2 = $r0.10, $r0.2
	c0	or $r0.7 = $r0.4, 8
;;
	c0	ldw $r0.2 = 0[$r0.2]
	c0	slct $r0.4 = $b0.1, $r0.7, $r0.4
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
LBB41_26:                               ## %if.end.40
	c0	mov $r0.2 = 8
	c0	mov $r0.4 = 9
	c0	mov $r0.7 = 7
	c0	mov $r0.10 = 16
	c0	mov $r0.11 = 1
	c0	mov $r0.12 = 30
;;
	c0	shru $r0.13 = $r0.5, $r0.2
	c0	shru $r0.4 = $r0.6, $r0.4
	c0	shl $r0.6 = $r0.6, $r0.7
	c0	shl $r0.2 = $r0.5, $r0.2
;;
	c0	and $r0.5 = $r0.13, 32767
	c0	and $r0.4 = $r0.4, 49151
	c0	zxth $r0.2 = $r0.2
	c0	zxth $r0.6 = $r0.6
;;
	c0	or $r0.4 = $r0.4, 16384
	c0	or $r0.5 = $r0.5, 32768
	c0	mpyhs $r0.7 = $r0.2, $r0.6
	c0	mpylu $r0.13 = $r0.2, $r0.6
;;
	c0	mpylu $r0.14 = $r0.5, $r0.6
	c0	mpyhs $r0.6 = $r0.5, $r0.6
	c0	mpyhs $r0.15 = $r0.2, $r0.4
	c0	mpylu $r0.2 = $r0.2, $r0.4
;;
	c0	mpyhs $r0.16 = $r0.5, $r0.4
;;
	c0	add $r0.6 = $r0.14, $r0.6
	c0	mpylu $r0.4 = $r0.5, $r0.4
	c0	add $r0.5 = $r0.13, $r0.7
	c0	add $r0.7 = $r0.8, $r0.9
	c0	add $r0.2 = $r0.2, $r0.15
;;
;;
	c0	add $r0.4 = $r0.4, $r0.16
	c0	add $r0.2 = $r0.6, $r0.2
;;
	c0	cmpltu $r0.6 = $r0.2, $r0.6
	c0	shl $r0.8 = $r0.2, $r0.10
	c0	shru $r0.2 = $r0.2, $r0.10
;;
	c0	add $r0.5 = $r0.8, $r0.5
	c0	shl $r0.6 = $r0.6, $r0.10
;;
	c0	cmpne $b0.0 = $r0.5, 0
	c0	or $r0.2 = $r0.6, $r0.2
	c0	cmpltu $r0.5 = $r0.5, $r0.8
;;
	c0	add $r0.2 = $r0.2, $r0.4
;;
	c0	mfb $r0.4 = $b0.0
	c0	add $r0.2 = $r0.2, $r0.5
;;
	c0	or $r0.5 = $r0.2, $r0.4
;;
	c0	shl $r0.6 = $r0.5, $r0.11
	c0	shru $r0.2 = $r0.2, $r0.12
;;
	c0	and $r0.2 = $r0.2, 1
;;
	c0	or $r0.2 = $r0.2, -128
	c0	cmpgt $b0.0 = $r0.6, -1
;;
	c0	add $r0.4 = $r0.7, $r0.2
;;
	c0	slct $r0.5 = $b0.0, $r0.6, $r0.5
;;
.call roundAndPackFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = roundAndPackFloat32
;;
LBB41_27:                               ## %cleanup
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB41_10:                               ## %if.end
	c0	or $r0.2 = $r0.8, $r0.5
	c0	goto LBB41_11
;;
LBB41_16:                               ## %if.end.20
	c0	or $r0.2 = $r0.9, $r0.6
;;
LBB41_11:                               ## %if.end
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB41_12
;;
## BB#17:                               ## %if.end.12
	c0	shl $r0.2 = $r0.3, $r0.7
;;
.return ret($r0.3:u32)
	c0	or $r0.3 = $r0.2, 2139095040
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB41_12:                               ## %if.then.11
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
	c0	mov $r0.3 = 2147483647
;;
;;
	c0	or $r0.4 = $r0.4, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB41_20:                               ## %if.then.30
.return ret($r0.3:u32)
	c0	shl $r0.3 = $r0.3, $r0.7
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB41_24:                               ## %if.then.37
.return ret($r0.3:u32)
	c0	shl $r0.3 = $r0.3, $r0.7
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
	c0	br $b0.0, LBB42_1
;;
## BB#2:                                ## %if.then
	c0	cmpeq $b0.1 = $r0.2, 1
;;
;;
	c0	brf $b0.1, LBB42_4
;;
## BB#3:
	c0	mov $r0.2 = 0
	c0	goto LBB42_8
;;
LBB42_1:
	c0	mov $r0.2 = 64
	c0	goto LBB42_8
;;
LBB42_4:                                ## %if.else
	c0	cmpeq $b0.1 = $r0.3, 0
;;
;;
	c0	br $b0.1, LBB42_6
;;
## BB#5:                                ## %if.then.5
	c0	cmpeq $b0.1 = $r0.2, 2
	c0	goto LBB42_7
;;
LBB42_6:                                ## %if.else.9
	c0	cmpeq $b0.1 = $r0.2, 3
;;
LBB42_7:                                ## %if.end.16
	c0	mov $r0.2 = 0
;;
	c0	slct $r0.2 = $b0.1, $r0.2, 127
;;
LBB42_8:                                ## %if.end.16
	c0	zxth $r0.7 = $r0.4
	c0	and $r0.6 = $r0.5, 127
;;
	c0	cmpltu $b0.1 = $r0.7, 253
;;
;;
	c0	br $b0.1, LBB42_19
;;
## BB#9:                                ## %if.then.21
	c0	cmpgt $b0.1 = $r0.4, 253
;;
;;
	c0	br $b0.1, LBB42_12
;;
## BB#10:                               ## %lor.lhs.false
	c0	cmpne $b0.1 = $r0.4, 253
	c0	add $r0.7 = $r0.2, $r0.5
;;
;;
	c0	br $b0.1, LBB42_13
;;
## BB#11:                               ## %lor.lhs.false
	c0	cmpgt $b0.1 = $r0.7, -1
;;
;;
	c0	br $b0.1, LBB42_13
;;
LBB42_12:                               ## %if.then.28
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
LBB42_13:                               ## %if.end.31
	c0	cmpgt $b0.1 = $r0.4, -1
;;
;;
	c0	br $b0.1, LBB42_19
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
	c0	mfb $r0.6 = $b0.1
;;
;;
	c0	mfb $r0.7 = $b0.3
	c0	cmplt $b0.3 = $r0.4, -31
	c0	mfb $r0.8 = $b0.2
;;
	c0	or $r0.6 = $r0.6, $r0.7
;;
	c0	or $r0.6 = $r0.8, $r0.6
;;
	c0	mtb $b0.1 = $r0.6
	c0	br $b0.3, LBB42_16
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
	c0	goto LBB42_17
;;
LBB42_16:                               ## %if.else.4.i
	c0	cmpne $b0.2 = $r0.5, 0
;;
;;
	c0	mfb $r0.5 = $b0.2
;;
LBB42_17:                               ## %shift32RightJamming.exit
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
	c0	br $b0.1, LBB42_19
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
LBB42_19:                               ## %if.end.51
	c0	cmpeq $b0.1 = $r0.6, 0
;;
;;
	c0	br $b0.1, LBB42_21
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
LBB42_21:                               ## %if.end.54
	c0	cmpeq $b0.1 = $r0.6, 64
	c0	mfb $r0.6 = $b0.0
	c0	add $r0.2 = $r0.5, $r0.2
	c0	mov $r0.5 = 7
	c0	mov $r0.7 = 31
	c0	mov $r0.8 = 23
	c0	mov $r0.9 = 0
;;
;;
	c0	mfb $r0.10 = $b0.1
	c0	shru $r0.2 = $r0.2, $r0.5
	c0	shl $r0.4 = $r0.4, $r0.8
;;
	c0	and $r0.5 = $r0.6, $r0.10
;;
	c0	orc $r0.5 = $r0.5, -2
;;
	c0	and $r0.2 = $r0.2, $r0.5
	c0	shl $r0.3 = $r0.3, $r0.7
;;
	c0	cmpeq $b0.0 = $r0.2, 0
	c0	or $r0.2 = $r0.2, $r0.3
;;
;;
	c0	slct $r0.3 = $b0.0, $r0.9, $r0.4
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
	c0	mov $r0.5 = 23
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.7 = 31
;;
	c0	xor $r0.3 = $r0.4, $r0.2
	c0	shru $r0.6 = $r0.2, $r0.5
	c0	shru $r0.9 = $r0.4, $r0.5
;;
	c0	zxtb $r0.8 = $r0.6
;;
	c0	cmpne $b0.0 = $r0.8, 255
	c0	and $r0.6 = $r0.2, 8388607
	c0	and $r0.5 = $r0.4, 8388607
	c0	shru $r0.3 = $r0.3, $r0.7
	c0	zxtb $r0.10 = $r0.9
;;
;;
	c0	br $b0.0, LBB43_13
;;
## BB#1:                                ## %if.then
	c0	cmpeq $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB43_8
;;
## BB#2:                                ## %if.then.6
	c0	and $r0.3 = $r0.4, 4194303
	c0	and $r0.5 = $r0.2, 2143289344
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.6 = $r0.2, 4194303
;;
	c0	cmpne $b0.0 = $r0.3, 0
	c0	cmpne $b0.1 = $r0.6, 0
	c0	cmpeq $b0.2 = $r0.7, 2139095040
	c0	cmpeq $b0.3 = $r0.5, 2139095040
;;
;;
	c0	mfb $r0.3 = $b0.0
	c0	mfb $r0.7 = $b0.2
	c0	mfb $r0.8 = $b0.1
	c0	mfb $r0.9 = $b0.3
;;
	c0	and $r0.3 = $r0.7, $r0.3
	c0	and $r0.7 = $r0.9, $r0.8
	c0	goto LBB43_3
;;
LBB43_13:                               ## %if.end.16
	c0	cmpeq $b0.0 = $r0.10, 0
;;
;;
	c0	brf $b0.0, LBB43_14
;;
## BB#17:                               ## %if.then.26
	c0	cmpne $b0.0 = $r0.5, 0
;;
;;
	c0	brf $b0.0, LBB43_18
;;
## BB#21:                               ## %if.end.33
	c0	cmpltu $b0.0 = $r0.5, 65536
	c0	mov $r0.9 = 16
	c0	mov $r0.10 = 8
	c0	mov $r0.11 = 22
	c0	mov $r0.12 = countLeadingZeros32.countLeadingZerosHigh
	c0	mov $r0.13 = 4
;;
	c0	shl $r0.4 = $r0.4, $r0.9
;;
	c0	slct $r0.4 = $b0.0, $r0.4, $r0.5
;;
	c0	cmpltu $b0.1 = $r0.4, 16777216
	c0	shl $r0.9 = $r0.4, $r0.10
;;
;;
	c0	slct $r0.4 = $b0.1, $r0.9, $r0.4
;;
	c0	shru $r0.4 = $r0.4, $r0.11
	c0	mfb $r0.9 = $b0.0
;;
	c0	and $r0.4 = $r0.4, 1020
	c0	shl $r0.9 = $r0.9, $r0.13
;;
	c0	add $r0.4 = $r0.12, $r0.4
	c0	or $r0.10 = $r0.9, 8
;;
	c0	ldw $r0.4 = 0[$r0.4]
	c0	slct $r0.9 = $b0.1, $r0.10, $r0.9
;;
;;
	c0	add $r0.4 = $r0.4, $r0.9
	c0	mov $r0.9 = 9
;;
	c0	add $r0.11 = $r0.4, -8
	c0	sub $r0.10 = $r0.9, $r0.4
;;
	c0	shl $r0.5 = $r0.5, $r0.11
	c0	goto LBB43_22
;;
LBB43_14:                               ## %if.end.16
	c0	cmpne $b0.0 = $r0.10, 255
;;
;;
	c0	br $b0.0, LBB43_22
;;
## BB#15:                               ## %if.then.18
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	brf $b0.0, LBB43_10
;;
## BB#16:                               ## %if.end.22
.return ret($r0.3:u32)
	c0	shl $r0.3 = $r0.3, $r0.7
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB43_22:                               ## %if.end.34
	c0	cmpne $b0.0 = $r0.8, 0
;;
;;
	c0	br $b0.0, LBB43_26
;;
## BB#23:                               ## %if.then.36
	c0	cmpne $b0.0 = $r0.6, 0
;;
;;
	c0	brf $b0.0, LBB43_24
;;
## BB#25:                               ## %if.end.40
	c0	cmpltu $b0.0 = $r0.6, 65536
	c0	mov $r0.4 = 16
	c0	mov $r0.7 = 8
	c0	mov $r0.8 = 22
	c0	mov $r0.9 = countLeadingZeros32.countLeadingZerosHigh
	c0	mov $r0.11 = 4
;;
	c0	shl $r0.2 = $r0.2, $r0.4
;;
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.6
;;
	c0	cmpltu $b0.1 = $r0.2, 16777216
	c0	shl $r0.4 = $r0.2, $r0.7
;;
;;
	c0	slct $r0.2 = $b0.1, $r0.4, $r0.2
;;
	c0	shru $r0.2 = $r0.2, $r0.8
	c0	mfb $r0.4 = $b0.0
;;
	c0	and $r0.2 = $r0.2, 1020
	c0	shl $r0.4 = $r0.4, $r0.11
;;
	c0	add $r0.2 = $r0.9, $r0.2
	c0	or $r0.7 = $r0.4, 8
;;
	c0	ldw $r0.2 = 0[$r0.2]
	c0	slct $r0.4 = $b0.1, $r0.7, $r0.4
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
LBB43_26:                               ## %if.end.41
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
	c0	sub $r0.7 = $r0.8, $r0.10
;;
	c0	cmpleu $b0.0 = $r0.2, $r0.6
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
	c0	br $b0.0, LBB43_27
;;
## BB#28:                               ## %if.end.i
	c0	mov $r0.7 = 16
;;
	c0	shru $r0.8 = $r0.2, $r0.7
;;
	c0	shl $r0.13 = $r0.8, $r0.7
;;
	c0	cmpleu $b0.0 = $r0.13, $r0.6
;;
;;
	c0	br $b0.0, LBB43_29
;;
## BB#30:                               ## %cond.false.i
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
	c0	goto LBB43_31
;;
LBB43_8:                                ## %if.end
	c0	cmpne $b0.0 = $r0.10, 255
;;
;;
	c0	br $b0.0, LBB43_12
;;
## BB#9:                                ## %if.then.9
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB43_11
;;
LBB43_10:                               ## %if.then.11
	c0	and $r0.3 = $r0.4, 4194303
	c0	and $r0.5 = $r0.2, 2143289344
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.6 = $r0.2, 4194303
;;
	c0	cmpne $b0.0 = $r0.3, 0
	c0	cmpne $b0.1 = $r0.6, 0
	c0	cmpeq $b0.2 = $r0.7, 2139095040
	c0	cmpeq $b0.3 = $r0.5, 2139095040
;;
;;
	c0	mfb $r0.3 = $b0.2
	c0	mfb $r0.7 = $b0.3
	c0	mfb $r0.8 = $b0.0
	c0	mfb $r0.9 = $b0.1
;;
	c0	and $r0.3 = $r0.3, $r0.8
	c0	and $r0.7 = $r0.7, $r0.9
;;
LBB43_3:                                ## %if.then.6
	c0	mtb $b0.0 = $r0.3
	c0	mtb $b0.1 = $r0.7
;;
;;
	c0	br $b0.1, LBB43_5
;;
## BB#4:                                ## %if.then.6
	c0	mfb $r0.3 = $b0.0
;;
	c0	cmpne $b0.1 = $r0.3, 1
;;
;;
	c0	br $b0.1, LBB43_6
;;
LBB43_5:                                ## %if.then.i.170
	c0	mov $r0.3 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.3]
;;
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.3] = $r0.7
;;
LBB43_6:                                ## %if.end.i.171
	c0	or $r0.3 = $r0.4, 4194304
	c0	br $b0.0, LBB43_42
;;
## BB#7:                                ## %cond.false.i.175
	c0	cmpeq $b0.0 = $r0.6, 0
	c0	or $r0.2 = $r0.2, 4194304
	c0	and $r0.4 = $r0.4, 2147483647
	c0	cmpne $b0.1 = $r0.5, 2139095040
;;
	c0	cmpgtu $b0.2 = $r0.4, 2139095040
;;
	c0	slct $r0.4 = $b0.0, $r0.3, $r0.2
;;
	c0	slct $r0.3 = $b0.1, $r0.3, $r0.4
;;
.return ret($r0.3:u32)
	c0	slct $r0.3 = $b0.2, $r0.3, $r0.2
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB43_27:
	c0	mov $r0.5 = -1
	c0	goto LBB43_41
;;
LBB43_18:                               ## %if.then.28
	c0	mov $r0.2 = float_exception_flags
	c0	or $r0.5 = $r0.8, $r0.6
;;
	c0	ldw $r0.4 = 0[$r0.2]
	c0	cmpne $b0.0 = $r0.5, 0
;;
;;
	c0	brf $b0.0, LBB43_19
;;
## BB#20:                               ## %if.end.31
	c0	shl $r0.3 = $r0.3, $r0.7
	c0	or $r0.4 = $r0.4, 2
;;
.return ret($r0.3:u32)
	c0	or $r0.3 = $r0.3, 2139095040
	c0	stw 0[$r0.2] = $r0.4
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB43_12:                               ## %if.end.14
	c0	shl $r0.2 = $r0.3, $r0.7
;;
.return ret($r0.3:u32)
	c0	or $r0.3 = $r0.2, 2139095040
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB43_29:
	c0	mov $r0.12 = -65536
;;
LBB43_31:                               ## %cond.end.i
	c0	shru $r0.10 = $r0.12, $r0.7
	c0	and $r0.11 = $r0.9, 65280
	c0	mov $r0.9 = -1
;;
	c0	mpylu $r0.14 = $r0.10, $r0.8
	c0	mpyhs $r0.15 = $r0.10, $r0.11
	c0	mpylu $r0.16 = $r0.10, $r0.11
	c0	mpyhs $r0.17 = $r0.10, $r0.8
;;
;;
	c0	add $r0.15 = $r0.16, $r0.15
	c0	mov $r0.10 = 0
	c0	add $r0.14 = $r0.14, $r0.17
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
	c0	br $b0.0, LBB43_34
;;
## BB#32:                               ## %while.body.lr.ph.i
	c0	mov $r0.16 = 24
;;
	c0	shl $r0.5 = $r0.5, $r0.16
;;
LBB43_33:                               ## %while.body.i
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
	c0	br $b0.0, LBB43_33
;;
LBB43_34:                               ## %while.end.i
	c0	shl $r0.5 = $r0.15, $r0.7
	c0	shru $r0.14 = $r0.14, $r0.7
;;
	c0	or $r0.5 = $r0.14, $r0.5
;;
	c0	cmpleu $b0.0 = $r0.13, $r0.5
;;
;;
	c0	br $b0.0, LBB43_35
;;
## BB#36:                               ## %cond.false.10.i
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
	c0	goto LBB43_37
;;
LBB43_35:
	c0	mov $r0.5 = 65535
;;
LBB43_37:                               ## %estimateDiv64To32.exit
	c0	or $r0.5 = $r0.5, $r0.12
;;
	c0	and $r0.12 = $r0.5, 63
;;
	c0	cmpgtu $b0.0 = $r0.12, 2
;;
;;
	c0	br $b0.0, LBB43_41
;;
## BB#38:                               ## %if.then.51
	c0	shru $r0.12 = $r0.5, $r0.7
	c0	zxth $r0.13 = $r0.5
;;
	c0	mpyhs $r0.14 = $r0.12, $r0.11
	c0	mpylu $r0.15 = $r0.12, $r0.11
	c0	mpyhs $r0.16 = $r0.13, $r0.8
	c0	mpylu $r0.17 = $r0.13, $r0.8
;;
	c0	mpyhs $r0.18 = $r0.13, $r0.11
	c0	mpylu $r0.11 = $r0.13, $r0.11
;;
	c0	add $r0.13 = $r0.15, $r0.14
	c0	mpylu $r0.14 = $r0.12, $r0.8
	c0	add $r0.15 = $r0.17, $r0.16
;;
	c0	add $r0.15 = $r0.13, $r0.15
	c0	mpyhs $r0.8 = $r0.12, $r0.8
	c0	add $r0.11 = $r0.11, $r0.18
;;
	c0	shl $r0.12 = $r0.15, $r0.7
;;
	c0	add $r0.8 = $r0.14, $r0.8
	c0	add $r0.11 = $r0.12, $r0.11
;;
	c0	sub $r0.8 = $r0.6, $r0.8
	c0	cmpltu $r0.6 = $r0.15, $r0.13
	c0	shru $r0.13 = $r0.15, $r0.7
;;
	c0	shl $r0.7 = $r0.6, $r0.7
	c0	cmpne $r0.14 = $r0.11, 0
	c0	cmpltu $r0.12 = $r0.11, $r0.12
	c0	sub $r0.6 = $r0.10, $r0.11
;;
	c0	or $r0.7 = $r0.7, $r0.13
	c0	mtb $b0.0 = $r0.14
	c0	mtb $b0.1 = $r0.12
;;
	c0	sub $r0.7 = $r0.8, $r0.7
;;
	c0	mfb $r0.8 = $b0.1
	c0	slct $r0.9 = $b0.0, $r0.9, 0
;;
	c0	add $r0.7 = $r0.7, $r0.8
;;
	c0	add $r0.7 = $r0.7, $r0.9
;;
	c0	cmpgt $b0.0 = $r0.7, -1
;;
;;
	c0	br $b0.0, LBB43_40
;;
LBB43_39:                               ## %while.body
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
	c0	br $b0.0, LBB43_39
;;
LBB43_40:                               ## %while.end
	c0	cmpne $b0.0 = $r0.6, 0
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	or $r0.5 = $r0.2, $r0.5
;;
LBB43_41:                               ## %if.end.55
.call roundAndPackFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = roundAndPackFloat32
;;
LBB43_42:                               ## %cleanup
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB43_24:                               ## %if.then.38
.return ret($r0.3:u32)
	c0	shl $r0.3 = $r0.3, $r0.7
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB43_11:                               ## %if.end.13
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
	c0	mov $r0.3 = 2147483647
;;
;;
	c0	or $r0.4 = $r0.4, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB43_19:                               ## %if.then.30
	c0	or $r0.4 = $r0.4, 16
	c0	mov $r0.3 = 2147483647
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
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
	c0	mov $r0.2 = 23
;;
	c0	shru $r0.5 = $r0.3, $r0.2
;;
	c0	zxtb $r0.7 = $r0.5
	c0	shru $r0.2 = $r0.4, $r0.2
;;
	c0	cmpne $b0.0 = $r0.7, 255
	c0	and $r0.6 = $r0.4, 8388607
	c0	and $r0.5 = $r0.3, 8388607
	c0	zxtb $r0.2 = $r0.2
;;
;;
	c0	br $b0.0, LBB44_9
;;
## BB#1:                                ## %if.then
	c0	cmpne $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB44_4
;;
## BB#2:                                ## %lor.lhs.false
	c0	cmpeq $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB44_19
;;
## BB#3:                                ## %lor.lhs.false
	c0	cmpne $b0.0 = $r0.2, 255
;;
;;
	c0	br $b0.0, LBB44_19
;;
LBB44_4:                                ## %if.then.8
	c0	and $r0.6 = $r0.4, 4194303
	c0	and $r0.2 = $r0.3, 2143289344
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.5 = $r0.3, 4194303
;;
	c0	cmpne $b0.0 = $r0.6, 0
	c0	cmpne $b0.1 = $r0.5, 0
	c0	cmpeq $b0.2 = $r0.7, 2139095040
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
	c0	br $b0.1, LBB44_6
;;
## BB#5:                                ## %if.then.8
	c0	mfb $r0.6 = $b0.0
;;
	c0	cmpne $b0.1 = $r0.6, 1
;;
;;
	c0	br $b0.1, LBB44_7
;;
LBB44_6:                                ## %if.then.i.252
	c0	mov $r0.6 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.6]
;;
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.6] = $r0.7
;;
LBB44_7:                                ## %if.end.i.253
	c0	or $r0.6 = $r0.4, 4194304
	c0	brf $b0.0, LBB44_17
;;
## BB#8:
.return ret($r0.3:u32)
	c0	mov $r0.3 = $r0.6
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB44_9:                                ## %if.end.10
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB44_10
;;
## BB#18:                               ## %if.then.19
	c0	cmpne $b0.0 = $r0.6, 0
;;
;;
	c0	brf $b0.0, LBB44_19
;;
## BB#20:                               ## %if.end.22
	c0	cmpltu $b0.0 = $r0.6, 65536
	c0	mov $r0.2 = 16
	c0	mov $r0.8 = 8
	c0	mov $r0.9 = 22
	c0	mov $r0.10 = countLeadingZeros32.countLeadingZerosHigh
	c0	mov $r0.11 = 4
;;
	c0	shl $r0.2 = $r0.4, $r0.2
;;
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.6
;;
	c0	cmpltu $b0.1 = $r0.2, 16777216
	c0	shl $r0.4 = $r0.2, $r0.8
;;
;;
	c0	slct $r0.2 = $b0.1, $r0.4, $r0.2
;;
	c0	shru $r0.2 = $r0.2, $r0.9
	c0	mfb $r0.4 = $b0.0
;;
	c0	and $r0.2 = $r0.2, 1020
	c0	shl $r0.4 = $r0.4, $r0.11
;;
	c0	add $r0.2 = $r0.10, $r0.2
	c0	or $r0.8 = $r0.4, 8
;;
	c0	ldw $r0.2 = 0[$r0.2]
	c0	slct $r0.4 = $b0.1, $r0.8, $r0.4
;;
;;
	c0	add $r0.2 = $r0.2, $r0.4
	c0	mov $r0.4 = 9
;;
	c0	add $r0.8 = $r0.2, -8
	c0	sub $r0.2 = $r0.4, $r0.2
;;
	c0	shl $r0.6 = $r0.6, $r0.8
	c0	goto LBB44_21
;;
LBB44_10:                               ## %if.end.10
	c0	cmpne $b0.0 = $r0.2, 255
;;
;;
	c0	br $b0.0, LBB44_21
;;
## BB#11:                               ## %if.then.12
	c0	cmpeq $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB44_62
;;
## BB#12:                               ## %if.then.14
	c0	and $r0.6 = $r0.4, 4194303
	c0	and $r0.2 = $r0.3, 2143289344
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.5 = $r0.3, 4194303
;;
	c0	cmpne $b0.0 = $r0.6, 0
	c0	cmpne $b0.1 = $r0.5, 0
	c0	cmpeq $b0.2 = $r0.7, 2139095040
	c0	cmpeq $b0.3 = $r0.2, 2139095040
;;
;;
	c0	mfb $r0.6 = $b0.2
	c0	mfb $r0.7 = $b0.3
	c0	mfb $r0.8 = $b0.0
	c0	mfb $r0.9 = $b0.1
;;
	c0	and $r0.6 = $r0.6, $r0.8
	c0	and $r0.7 = $r0.7, $r0.9
;;
	c0	mtb $b0.0 = $r0.6
	c0	mtb $b0.1 = $r0.7
;;
;;
	c0	br $b0.1, LBB44_14
;;
## BB#13:                               ## %if.then.14
	c0	mfb $r0.6 = $b0.0
;;
	c0	cmpne $b0.1 = $r0.6, 1
;;
;;
	c0	br $b0.1, LBB44_15
;;
LBB44_14:                               ## %if.then.i
	c0	mov $r0.6 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.6]
;;
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.6] = $r0.7
;;
LBB44_15:                               ## %if.end.i.235
	c0	or $r0.6 = $r0.4, 4194304
	c0	brf $b0.0, LBB44_17
;;
## BB#16:
.return ret($r0.3:u32)
	c0	mov $r0.3 = $r0.6
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB44_21:                               ## %if.end.23
	c0	cmpne $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB44_24
;;
## BB#22:                               ## %if.then.25
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB44_62
;;
## BB#23:                               ## %if.end.28
	c0	cmpltu $b0.0 = $r0.5, 65536
	c0	mov $r0.4 = 16
	c0	mov $r0.7 = 8
	c0	mov $r0.8 = 22
	c0	mov $r0.9 = countLeadingZeros32.countLeadingZerosHigh
	c0	mov $r0.10 = 4
;;
	c0	shl $r0.4 = $r0.3, $r0.4
;;
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
LBB44_24:                               ## %if.end.29
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
	c0	brf $b0.0, LBB44_25
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
	c0	br $b0.1, LBB44_29
;;
## BB#30:                               ## %while.body.lr.ph
	c0	mov $r0.10 = 16
	c0	mov $r0.18 = 2
	c0	mov $r0.11 = 0
	c0	mov $r0.19 = 24
;;
	c0	shru $r0.12 = $r0.5, $r0.10
;;
	c0	cmplt $r0.13 = $r0.12, $r0.0
	c0	mov $r0.14 = 65535
	c0	and $r0.15 = $r0.8, 65280
	c0	mov $r0.16 = -65536
	c0	mov $r0.17 = -1
;;
	c0	mov $r0.22 = $r0.9
	c0	shru $r0.9 = $r0.5, $r0.18
	c0	shl $r0.18 = $r0.6, $r0.19
	c0	shl $r0.19 = $r0.12, $r0.10
;;
	c0	sub $r0.20 = $r0.11, $r0.9
	c0	mtb $b0.0 = $r0.13
	c0	shru $r0.21 = $r0.12, $r0.13
;;
LBB44_31:                               ## %while.body
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB44_35 Depth 2
	c0	cmpleu $b0.1 = $r0.5, $r0.7
	c0	mov $r0.9 = $r0.17
;;
;;
	c0	br $b0.1, LBB44_39
;;
## BB#32:                               ## %if.end.i.153
                                        ##   in Loop: Header=BB44_31 Depth=1
	c0	cmpleu $b0.1 = $r0.19, $r0.7
	c0	mov $r0.9 = $r0.16
;;
;;
	c0	br $b0.1, LBB44_34
;;
## BB#33:                               ## %cond.false.i.156
                                        ##   in Loop: Header=BB44_31 Depth=1
	c0	shru $r0.9 = $r0.7, $r0.13
	c0	mtb $b0.1 = $r0.11
	c0	mtb $b0.2 = $r0.11
	c0	cmpgeu $r0.23 = $r0.7, $r0.12
;;
;;
	c0	addcg $r0.24, $b0.1 = $r0.9, $r0.9, $b0.1
;;
	c0	divs $r0.9, $b0.1 = $r0.0, $r0.21, $b0.1
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.21, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.21, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.21, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.21, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.21, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.21, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.21, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.21, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.21, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.21, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.21, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.21, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.21, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.21, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.21, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.21, $b0.1
;;
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.21, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.21, $b0.1
;;
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.21, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.21, $b0.1
;;
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.21, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.21, $b0.1
;;
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.21, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.21, $b0.1
;;
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.21, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.21, $b0.1
;;
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.21, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.21, $b0.1
;;
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.21, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.21, $b0.1
;;
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.21, $b0.2
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
LBB44_34:                               ## %cond.end.i.171
                                        ##   in Loop: Header=BB44_31 Depth=1
	c0	shru $r0.23 = $r0.9, $r0.10
;;
	c0	mpylu $r0.24 = $r0.23, $r0.15
	c0	mpyhs $r0.25 = $r0.23, $r0.15
	c0	mpylu $r0.26 = $r0.23, $r0.12
	c0	mpyhs $r0.23 = $r0.23, $r0.12
;;
;;
	c0	add $r0.24 = $r0.24, $r0.25
	c0	add $r0.23 = $r0.26, $r0.23
;;
	c0	shl $r0.25 = $r0.24, $r0.10
	c0	shru $r0.24 = $r0.24, $r0.10
	c0	sub $r0.23 = $r0.7, $r0.23
;;
	c0	cmpne $r0.26 = $r0.25, 0
	c0	sub $r0.7 = $r0.11, $r0.25
	c0	sub $r0.23 = $r0.23, $r0.24
;;
	c0	mtb $b0.1 = $r0.26
;;
;;
	c0	slct $r0.24 = $b0.1, $r0.17, 0
;;
	c0	add $r0.23 = $r0.23, $r0.24
;;
	c0	cmpgt $b0.1 = $r0.23, -1
;;
;;
	c0	br $b0.1, LBB44_36
;;
LBB44_35:                               ## %while.body.i.184
                                        ##   Parent Loop BB44_31 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	add $r0.7 = $r0.7, $r0.18
	c0	add $r0.23 = $r0.23, $r0.12
	c0	add $r0.9 = $r0.9, -65536
;;
	c0	cmpltu $r0.24 = $r0.7, $r0.18
;;
	c0	add $r0.23 = $r0.23, $r0.24
;;
	c0	cmplt $b0.1 = $r0.23, 0
;;
;;
	c0	br $b0.1, LBB44_35
;;
LBB44_36:                               ## %while.end.i.192
                                        ##   in Loop: Header=BB44_31 Depth=1
	c0	shl $r0.23 = $r0.23, $r0.10
	c0	shru $r0.24 = $r0.7, $r0.10
	c0	mov $r0.7 = $r0.14
;;
	c0	or $r0.23 = $r0.24, $r0.23
;;
	c0	cmpleu $b0.1 = $r0.19, $r0.23
;;
;;
	c0	br $b0.1, LBB44_38
;;
## BB#37:                               ## %cond.false.10.i.194
                                        ##   in Loop: Header=BB44_31 Depth=1
	c0	shru $r0.7 = $r0.23, $r0.13
	c0	mtb $b0.1 = $r0.11
	c0	mtb $b0.2 = $r0.11
	c0	cmpgeu $r0.23 = $r0.23, $r0.12
;;
;;
	c0	addcg $r0.24, $b0.1 = $r0.7, $r0.7, $b0.1
;;
	c0	divs $r0.7, $b0.1 = $r0.0, $r0.21, $b0.1
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.21, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.21, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.21, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.21, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.21, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.21, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.21, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.21, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.21, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.21, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.21, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.21, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.21, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.21, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.21, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.21, $b0.1
;;
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.21, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.21, $b0.1
;;
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.21, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.21, $b0.1
;;
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.21, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.21, $b0.1
;;
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.21, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.21, $b0.1
;;
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.21, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.21, $b0.1
;;
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.21, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.21, $b0.1
;;
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.21, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.7, $b0.1 = $r0.7, $r0.21, $b0.1
;;
	c0	divs $r0.7, $b0.2 = $r0.7, $r0.21, $b0.2
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
LBB44_38:                               ## %cond.end.12.i.197
                                        ##   in Loop: Header=BB44_31 Depth=1
	c0	or $r0.9 = $r0.7, $r0.9
;;
LBB44_39:                               ## %estimateDiv64To32.exit199
                                        ##   in Loop: Header=BB44_31 Depth=1
	c0	cmpgtu $b0.1 = $r0.9, 2
	c0	add $r0.7 = $r0.9, -2
	c0	cmpgt $b0.2 = $r0.22, 30
;;
;;
	c0	slct $r0.23 = $b0.1, $r0.7, 0
	c0	add $r0.9 = $r0.22, -30
;;
	c0	mov $r0.22 = $r0.9
	c0	mpyhs $r0.7 = $r0.23, $r0.20
	c0	mpylu $r0.24 = $r0.23, $r0.20
;;
;;
	c0	add $r0.7 = $r0.24, $r0.7
	c0	br $b0.2, LBB44_31
;;
	c0	goto LBB44_40
;;
LBB44_17:                               ## %cond.false.i.257
	c0	cmpeq $b0.0 = $r0.5, 0
	c0	or $r0.3 = $r0.3, 4194304
	c0	and $r0.4 = $r0.4, 2147483647
	c0	cmpne $b0.1 = $r0.2, 2139095040
;;
	c0	cmpgtu $b0.2 = $r0.4, 2139095040
;;
	c0	slct $r0.2 = $b0.0, $r0.6, $r0.3
;;
	c0	slct $r0.2 = $b0.1, $r0.6, $r0.2
;;
.return ret($r0.3:u32)
	c0	slct $r0.3 = $b0.2, $r0.2, $r0.3
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB44_19:                               ## %if.end
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
	c0	mov $r0.3 = 2147483647
;;
;;
	c0	or $r0.4 = $r0.4, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB44_25:                               ## %if.then.33
	c0	cmplt $b0.0 = $r0.9, -1
;;
;;
	c0	br $b0.0, LBB44_62
;;
## BB#26:                               ## %while.end.thread
	c0	mov $r0.6 = 1
	c0	mov $r0.23 = 0
;;
	c0	shru $r0.7 = $r0.7, $r0.6
	c0	goto LBB44_27
;;
LBB44_29:
	c0	mfb $r0.23 = $b0.0
;;
LBB44_40:                               ## %while.end
	c0	cmplt $b0.0 = $r0.9, -31
;;
;;
	c0	br $b0.0, LBB44_27
;;
## BB#41:                               ## %if.then.55
	c0	cmpleu $b0.0 = $r0.5, $r0.7
;;
;;
	c0	br $b0.0, LBB44_42
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
	c0	br $b0.0, LBB44_44
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
	c0	goto LBB44_46
;;
LBB44_27:                               ## %if.else
	c0	mov $r0.6 = 2
;;
	c0	shru $r0.8 = $r0.5, $r0.6
	c0	shru $r0.6 = $r0.7, $r0.6
	c0	goto LBB44_54
;;
LBB44_42:
	c0	mov $r0.6 = -1
	c0	goto LBB44_53
;;
LBB44_44:
	c0	mov $r0.11 = -65536
;;
LBB44_46:                               ## %cond.end.i
	c0	shru $r0.14 = $r0.11, $r0.13
	c0	and $r0.8 = $r0.8, 65280
	c0	mov $r0.15 = -1
;;
	c0	mpyhs $r0.16 = $r0.14, $r0.10
	c0	mpyhs $r0.17 = $r0.14, $r0.8
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
	c0	br $b0.0, LBB44_49
;;
## BB#47:                               ## %while.body.lr.ph.i
	c0	mov $r0.15 = 24
;;
	c0	shl $r0.6 = $r0.6, $r0.15
;;
LBB44_48:                               ## %while.body.i
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
	c0	br $b0.0, LBB44_48
;;
LBB44_49:                               ## %while.end.i
	c0	shl $r0.6 = $r0.14, $r0.13
	c0	shru $r0.8 = $r0.8, $r0.13
;;
	c0	or $r0.6 = $r0.8, $r0.6
;;
	c0	cmpleu $b0.0 = $r0.12, $r0.6
;;
;;
	c0	br $b0.0, LBB44_50
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
	c0	goto LBB44_52
;;
LBB44_50:
	c0	mov $r0.6 = 65535
;;
LBB44_52:                               ## %cond.end.12.i
	c0	or $r0.6 = $r0.6, $r0.11
;;
LBB44_53:                               ## %estimateDiv64To32.exit
	c0	cmpgtu $b0.0 = $r0.6, 2
	c0	add $r0.6 = $r0.6, -2
	c0	mov $r0.8 = 0
	c0	mov $r0.10 = 2
	c0	mov $r0.11 = 1
	c0	add $r0.12 = $r0.9, 31
;;
	c0	sub $r0.9 = $r0.8, $r0.9
;;
	c0	slct $r0.6 = $b0.0, $r0.6, 0
	c0	shru $r0.8 = $r0.5, $r0.10
;;
	c0	shru $r0.23 = $r0.6, $r0.9
	c0	shru $r0.5 = $r0.7, $r0.11
;;
	c0	shl $r0.5 = $r0.5, $r0.12
	c0	mpyhs $r0.6 = $r0.23, $r0.8
	c0	mpylu $r0.7 = $r0.23, $r0.8
;;
;;
	c0	add $r0.6 = $r0.7, $r0.6
;;
	c0	sub $r0.6 = $r0.5, $r0.6
;;
LBB44_54:                               ## %do.body.preheader
	c0	mov $r0.9 = 31
;;
	c0	shru $r0.3 = $r0.3, $r0.9
;;
LBB44_55:                               ## %do.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	mov $r0.5 = $r0.6
;;
	c0	sub $r0.6 = $r0.5, $r0.8
	c0	add $r0.23 = $r0.23, 1
;;
	c0	cmpgt $b0.0 = $r0.6, -1
;;
;;
	c0	br $b0.0, LBB44_55
;;
## BB#56:                               ## %do.end
	c0	add $r0.7 = $r0.6, $r0.5
;;
	c0	cmplt $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB44_59
;;
## BB#57:                               ## %lor.lhs.false.81
	c0	cmpne $b0.0 = $r0.7, 0
	c0	mov $r0.7 = 1
;;
;;
	c0	br $b0.0, LBB44_60
;;
## BB#58:                               ## %lor.lhs.false.81
	c0	and $r0.8 = $r0.23, 1
;;
	c0	cmpeq $b0.0 = $r0.8, 0
;;
;;
	c0	br $b0.0, LBB44_60
;;
LBB44_59:                               ## %if.end.87
	c0	cmpgt $b0.0 = $r0.5, -1
	c0	shru $r0.7 = $r0.5, $r0.9
	c0	mov $r0.6 = $r0.5
;;
;;
	c0	br $b0.0, LBB44_61
;;
LBB44_60:                               ## %if.then.91
	c0	mov $r0.5 = 0
;;
	c0	sub $r0.5 = $r0.5, $r0.6
;;
LBB44_61:                               ## %if.end.93
	c0	mov $r0.6 = 16
	c0	cmpltu $b0.0 = $r0.5, 65536
	c0	mov $r0.8 = 22
	c0	mov $r0.9 = countLeadingZeros32.countLeadingZerosHigh
	c0	mov $r0.10 = 4
;;
	c0	shl $r0.6 = $r0.5, $r0.6
;;
	c0	slct $r0.6 = $b0.0, $r0.6, $r0.5
;;
	c0	cmpltu $b0.1 = $r0.6, 16777216
	c0	shl $r0.4 = $r0.6, $r0.4
;;
;;
	c0	slct $r0.4 = $b0.1, $r0.4, $r0.6
;;
	c0	shru $r0.4 = $r0.4, $r0.8
	c0	mfb $r0.6 = $b0.0
;;
	c0	and $r0.4 = $r0.4, 1020
	c0	shl $r0.6 = $r0.6, $r0.10
;;
	c0	add $r0.4 = $r0.9, $r0.4
	c0	or $r0.8 = $r0.6, 8
;;
	c0	ldw $r0.4 = 0[$r0.4]
	c0	slct $r0.6 = $b0.1, $r0.8, $r0.6
;;
;;
	c0	add $r0.4 = $r0.4, $r0.6
;;
	c0	add $r0.6 = $r0.4, -1
	c0	xor $r0.3 = $r0.7, $r0.3
;;
	c0	sub $r0.4 = $r0.2, $r0.6
	c0	shl $r0.5 = $r0.5, $r0.6
;;
.call roundAndPackFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = roundAndPackFloat32
;;
LBB44_62:                               ## %cleanup
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
	c0	br $b0.0, LBB45_9
;;
## BB#1:                                ## %if.then
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB45_7
;;
## BB#2:                                ## %if.then.3
	c0	and $r0.4 = $r0.3, 2143289344
	c0	or $r0.2 = $r0.3, 4194304
;;
	c0	cmpne $b0.0 = $r0.4, 2139095040
;;
;;
	c0	br $b0.0, LBB45_3
;;
## BB#4:                                ## %if.then.3
	c0	and $r0.3 = $r0.3, 4194303
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB45_5
;;
## BB#6:                                ## %if.then.i.86
	c0	mov $r0.4 = float_exception_flags
	c0	mov $r0.3 = $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.4]
;;
;;
	c0	or $r0.2 = $r0.2, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.4] = $r0.2
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB45_9:                                ## %if.end.8
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB45_11
;;
## BB#10:                               ## %if.then.10
	c0	or $r0.2 = $r0.7, $r0.4
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB45_8
;;
	c0	goto LBB45_41
;;
LBB45_7:                                ## %if.end
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB45_41
;;
LBB45_8:                                ## %if.end.7
	c0	mov $r0.2 = float_exception_flags
	c0	mov $r0.3 = 2147483647
;;
	c0	ldw $r0.4 = 0[$r0.2]
;;
;;
	c0	or $r0.4 = $r0.4, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB45_11:                               ## %if.end.14
	c0	cmpne $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB45_15
;;
## BB#12:                               ## %if.then.16
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB45_13
;;
## BB#14:                               ## %if.end.19
	c0	cmpltu $b0.0 = $r0.4, 65536
	c0	mov $r0.5 = 16
	c0	mov $r0.6 = 8
	c0	mov $r0.7 = 22
	c0	mov $r0.8 = countLeadingZeros32.countLeadingZerosHigh
	c0	mov $r0.9 = 4
;;
	c0	shl $r0.3 = $r0.3, $r0.5
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
	c0	add $r0.3 = $r0.3, $r0.5
	c0	mov $r0.5 = 9
;;
	c0	add $r0.6 = $r0.3, -8
	c0	sub $r0.7 = $r0.5, $r0.3
;;
	c0	shl $r0.4 = $r0.4, $r0.6
;;
LBB45_15:                               ## %if.end.20
	c0	mov $r0.8 = 8
	c0	and $r0.6 = $r0.7, 1
	c0	mov $r0.9 = 19
	c0	mov $r0.5 = 17
	c0	add $r0.7 = $r0.7, -127
	c0	mov $r0.3 = 1
;;
	c0	shru $r0.9 = $r0.4, $r0.9
	c0	shl $r0.8 = $r0.4, $r0.8
	c0	cmpeq $b0.0 = $r0.6, 0
	c0	shr $r0.4 = $r0.7, $r0.3
;;
	c0	or $r0.7 = $r0.8, -2147483648
	c0	and $r0.8 = $r0.9, 15
;;
	c0	shru $r0.9 = $r0.7, $r0.5
	c0	brf $b0.0, LBB45_16
;;
## BB#19:                               ## %if.else.i
	c0	mov $r0.10 = estimateSqrt32.sqrtEvenAdjustments
	c0	or $r0.9 = $r0.9, 32768
	c0	mov $r0.11 = 0
;;
	c0	sh1add $r0.8 = $r0.8, $r0.10
	c0	mtb $b0.0 = $r0.11
	c0	mtb $b0.1 = $r0.11
;;
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
;;
	c0	addcg $r0.12, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.11, $b0.2
	c0	mov $r0.14 = 15
;;
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.11, $b0.1
	c0	addcg $r0.13, $b0.2 = $r0.12, $r0.12, $b0.2
;;
	c0	addcg $r0.12, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.11, $b0.2
;;
	c0	addcg $r0.13, $b0.2 = $r0.12, $r0.12, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.11, $b0.1
	c0	mov $r0.12 = -32768
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
;;
	c0	add $r0.8 = $r0.8, $r0.9
	c0	mov $r0.13 = $r0.7
;;
	c0	cmpgtu $b0.0 = $r0.8, 131071
	c0	shl $r0.8 = $r0.8, $r0.14
;;
;;
	c0	slct $r0.8 = $b0.0, $r0.12, $r0.8
;;
	c0	cmpgtu $b0.0 = $r0.8, $r0.7
;;
;;
	c0	br $b0.0, LBB45_17
;;
## BB#20:                               ## %if.then.18.i
	c0	shr $r0.9 = $r0.7, $r0.3
	c0	goto LBB45_32
;;
LBB45_16:                               ## %if.then.i
	c0	mov $r0.10 = estimateSqrt32.sqrtOddAdjustments
	c0	add $r0.9 = $r0.9, 16384
	c0	mov $r0.11 = 0
	c0	mov $r0.12 = 14
	c0	mov $r0.14 = 15
;;
	c0	sh1add $r0.8 = $r0.8, $r0.10
	c0	mtb $b0.0 = $r0.11
	c0	mtb $b0.1 = $r0.11
;;
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
	c0	addcg $r0.13, $b0.0 = $r0.10, $r0.10, $b0.0
;;
	c0	divs $r0.10, $b0.0 = $r0.0, $r0.11, $b0.0
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	addcg $r0.13, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	addcg $r0.13, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	addcg $r0.13, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	addcg $r0.13, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	addcg $r0.13, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	addcg $r0.13, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	addcg $r0.13, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
	c0	addcg $r0.13, $b0.0 = $r0.15, $r0.15, $b0.0
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
	c0	addcg $r0.13, $b0.0 = $r0.15, $r0.15, $b0.0
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
	c0	addcg $r0.13, $b0.0 = $r0.15, $r0.15, $b0.0
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
	c0	addcg $r0.13, $b0.0 = $r0.15, $r0.15, $b0.0
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
	c0	addcg $r0.13, $b0.0 = $r0.15, $r0.15, $b0.0
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
	c0	addcg $r0.13, $b0.0 = $r0.15, $r0.15, $b0.0
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
	c0	addcg $r0.13, $b0.0 = $r0.15, $r0.15, $b0.0
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
	c0	addcg $r0.13, $b0.0 = $r0.15, $r0.15, $b0.0
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
	c0	shru $r0.13 = $r0.7, $r0.3
	c0	cmpgeu $r0.16 = $r0.7, $r0.8
	c0	shl $r0.8 = $r0.8, $r0.14
	c0	mtb $b0.2 = $r0.9
;;
	c0	divs $r0.9, $b0.1 = $r0.10, $r0.11, $b0.1
	c0	addcg $r0.10, $b0.0 = $r0.15, $r0.15, $b0.0
;;
	c0	cmpge $b0.0 = $r0.9, $r0.0
	c0	addcg $r0.9, $b0.1 = $r0.10, $r0.10, $b0.1
;;
	c0	orc $r0.9 = $r0.9, $r0.0
;;
	c0	mfb $r0.10 = $b0.0
;;
	c0	sh1add $r0.9 = $r0.9, $r0.10
;;
	c0	slct $r0.9 = $b0.2, $r0.16, $r0.9
;;
	c0	shl $r0.9 = $r0.9, $r0.12
;;
	c0	add $r0.8 = $r0.8, $r0.9
;;
LBB45_17:                               ## %if.end.20.i
	c0	cmpleu $b0.0 = $r0.8, $r0.13
;;
;;
	c0	br $b0.0, LBB45_18
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
	c0	br $b0.0, LBB45_22
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
	c0	goto LBB45_24
;;
LBB45_3:
.return ret($r0.3:u32)
	c0	mov $r0.3 = $r0.2
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB45_5:
.return ret($r0.3:u32)
	c0	mov $r0.3 = $r0.2
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB45_18:
	c0	mov $r0.9 = 2147483647
	c0	goto LBB45_31
;;
LBB45_22:
	c0	mov $r0.10 = -65536
;;
LBB45_24:                               ## %cond.end.i
	c0	shru $r0.14 = $r0.10, $r0.12
	c0	zxth $r0.15 = $r0.8
	c0	mov $r0.16 = -1
;;
	c0	mpyhs $r0.17 = $r0.14, $r0.9
	c0	mpyhs $r0.18 = $r0.14, $r0.15
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
	c0	br $b0.0, LBB45_27
;;
## BB#25:                               ## %while.body.lr.ph.i
	c0	shl $r0.15 = $r0.8, $r0.12
;;
LBB45_26:                               ## %while.body.i
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
	c0	br $b0.0, LBB45_26
;;
LBB45_27:                               ## %while.end.i
	c0	shl $r0.14 = $r0.14, $r0.12
	c0	shru $r0.12 = $r0.13, $r0.12
;;
	c0	or $r0.12 = $r0.12, $r0.14
;;
	c0	cmpleu $b0.0 = $r0.11, $r0.12
;;
;;
	c0	br $b0.0, LBB45_28
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
	c0	goto LBB45_30
;;
LBB45_28:
	c0	mov $r0.9 = 65535
;;
LBB45_30:                               ## %cond.end.12.i
	c0	or $r0.9 = $r0.9, $r0.10
;;
	c0	shru $r0.9 = $r0.9, $r0.3
;;
LBB45_31:                               ## %estimateDiv64To32.exit
	c0	shru $r0.8 = $r0.8, $r0.3
;;
	c0	add $r0.9 = $r0.9, $r0.8
;;
LBB45_32:                               ## %estimateSqrt32.exit
	c0	add $r0.8 = $r0.9, 2
	c0	add $r0.4 = $r0.4, 126
;;
	c0	and $r0.10 = $r0.8, 126
;;
	c0	cmpgtu $b0.0 = $r0.10, 5
;;
;;
	c0	br $b0.0, LBB45_39
;;
## BB#33:                               ## %if.then.25
	c0	cmpgtu $b0.0 = $r0.9, -3
;;
;;
	c0	brf $b0.0, LBB45_35
;;
## BB#34:
	c0	mov $r0.5 = 2147483647
	c0	goto LBB45_40
;;
LBB45_35:                               ## %if.else
	c0	mov $r0.10 = 16
	c0	zxth $r0.11 = $r0.8
	c0	shru $r0.6 = $r0.7, $r0.6
	c0	mov $r0.7 = 15
	c0	mov $r0.12 = -1
;;
	c0	shru $r0.13 = $r0.8, $r0.10
	c0	mpylu $r0.14 = $r0.11, $r0.11
	c0	mpyhs $r0.15 = $r0.11, $r0.11
;;
	c0	mpylu $r0.16 = $r0.13, $r0.11
	c0	mpyhs $r0.11 = $r0.13, $r0.11
	c0	mpylu $r0.17 = $r0.13, $r0.13
;;
;;
	c0	add $r0.11 = $r0.16, $r0.11
	c0	mpyhs $r0.13 = $r0.13, $r0.13
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	shl $r0.15 = $r0.11, $r0.3
	c0	shl $r0.5 = $r0.11, $r0.5
;;
	c0	cmpltu $b0.0 = $r0.15, $r0.11
	c0	mov $r0.15 = 0
	c0	add $r0.13 = $r0.17, $r0.13
	c0	shru $r0.7 = $r0.11, $r0.7
	c0	add $r0.11 = $r0.5, $r0.14
;;
	c0	sub $r0.6 = $r0.6, $r0.13
	c0	zxth $r0.7 = $r0.7
	c0	cmpltu $r0.13 = $r0.11, $r0.5
	c0	cmpne $r0.14 = $r0.11, 0
	c0	sub $r0.5 = $r0.15, $r0.11
;;
	c0	mtb $b0.1 = $r0.14
	c0	mfb $r0.11 = $b0.0
	c0	mtb $b0.0 = $r0.13
;;
	c0	shl $r0.10 = $r0.11, $r0.10
;;
	c0	mfb $r0.11 = $b0.0
	c0	slct $r0.12 = $b0.1, $r0.12, 0
	c0	or $r0.7 = $r0.10, $r0.7
;;
	c0	add $r0.6 = $r0.6, $r0.11
;;
	c0	add $r0.6 = $r0.6, $r0.12
;;
	c0	sub $r0.6 = $r0.6, $r0.7
;;
	c0	cmpgt $b0.0 = $r0.6, -1
;;
;;
	c0	br $b0.0, LBB45_38
;;
## BB#36:                               ## %while.body.preheader
	c0	mov $r0.7 = 3
;;
	c0	sh1add $r0.7 = $r0.9, $r0.7
;;
LBB45_37:                               ## %while.body
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
	c0	br $b0.0, LBB45_37
;;
LBB45_38:                               ## %while.end
	c0	or $r0.2 = $r0.5, $r0.6
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	or $r0.8 = $r0.2, $r0.8
;;
LBB45_39:                               ## %if.end.36
	c0	and $r0.2 = $r0.8, 1
	c0	shru $r0.3 = $r0.8, $r0.3
;;
	c0	or $r0.5 = $r0.2, $r0.3
;;
LBB45_40:                               ## %roundAndPack
	c0	mov $r0.3 = 0
;;
.call roundAndPackFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = roundAndPackFloat32
;;
LBB45_41:                               ## %cleanup
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB45_13:
.return ret($r0.3:u32)
	c0	mov $r0.3 = 0
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
	c0	br $b0.0, LBB46_2
;;
## BB#1:                                ## %entry
	c0	and $r0.2 = $r0.3, 8388607
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB46_4
;;
LBB46_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 2139095040
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB46_9
;;
## BB#3:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 8388607
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB46_9
;;
LBB46_4:                                ## %if.then
	c0	and $r0.2 = $r0.3, 2143289344
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB46_6
;;
## BB#5:                                ## %if.then
	c0	and $r0.2 = $r0.3, 4194303
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB46_8
;;
LBB46_6:                                ## %lor.lhs.false.9
	c0	and $r0.2 = $r0.4, 2143289344
	c0	mov $r0.3 = 0
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB46_13
;;
## BB#7:                                ## %lor.lhs.false.9
	c0	and $r0.2 = $r0.4, 4194303
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB46_13
;;
LBB46_8:                                ## %if.then.12
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
LBB46_9:                                ## %if.end.13
	c0	cmpeq $b0.0 = $r0.3, $r0.4
;;
;;
	c0	brf $b0.0, LBB46_11
;;
## BB#10:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB46_12
;;
LBB46_11:                               ## %lor.rhs
	c0	or $r0.2 = $r0.4, $r0.3
;;
	c0	and $r0.2 = $r0.2, 2147483647
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
LBB46_12:                               ## %lor.end
	c0	mfb $r0.3 = $b0.0
;;
LBB46_13:                               ## %return
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
	c0	br $b0.0, LBB47_2
;;
## BB#1:                                ## %entry
	c0	and $r0.2 = $r0.3, 8388607
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB47_4
;;
LBB47_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 2139095040
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB47_5
;;
## BB#3:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 8388607
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB47_5
;;
LBB47_4:                                ## %if.then
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
LBB47_5:                                ## %if.end
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.5 = $r0.4, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.5
;;
;;
	c0	brf $b0.0, LBB47_6
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
LBB47_6:                                ## %if.then.10
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB47_8
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
LBB47_8:                                ## %lor.rhs
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
	c0	br $b0.0, LBB48_5
;;
## BB#3:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 8388607
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB48_5
;;
LBB48_4:                                ## %if.then
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
LBB48_5:                                ## %if.end
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.5 = $r0.4, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.5
;;
;;
	c0	brf $b0.0, LBB48_6
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
LBB48_6:                                ## %if.then.10
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB48_7
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
LBB48_7:
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
	c0	cmpeq $b0.0 = $r0.3, $r0.4
;;
;;
	c0	brf $b0.0, LBB49_7
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
LBB49_7:                                ## %lor.rhs
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
	c0	br $b0.0, LBB50_9
;;
## BB#3:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 8388607
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB50_9
;;
LBB50_4:                                ## %if.then
	c0	and $r0.2 = $r0.3, 2143289344
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB50_6
;;
## BB#5:                                ## %if.then
	c0	and $r0.2 = $r0.3, 4194303
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB50_8
;;
LBB50_6:                                ## %lor.lhs.false.9
	c0	and $r0.2 = $r0.4, 2143289344
	c0	mov $r0.3 = 0
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB50_15
;;
## BB#7:                                ## %lor.lhs.false.9
	c0	and $r0.2 = $r0.4, 4194303
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB50_15
;;
LBB50_8:                                ## %if.then.12
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
LBB50_9:                                ## %if.end.13
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.5 = $r0.4, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.5
;;
;;
	c0	brf $b0.0, LBB50_10
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
LBB50_15:                               ## %cleanup
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB50_10:                               ## %if.then.17
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB50_12
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
LBB50_12:                               ## %lor.rhs
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
	c0	br $b0.0, LBB51_9
;;
## BB#3:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 8388607
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB51_9
;;
LBB51_4:                                ## %if.then
	c0	and $r0.2 = $r0.3, 2143289344
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB51_6
;;
## BB#5:                                ## %if.then
	c0	and $r0.2 = $r0.3, 4194303
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB51_8
;;
LBB51_6:                                ## %lor.lhs.false.9
	c0	and $r0.2 = $r0.4, 2143289344
	c0	mov $r0.3 = 0
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
;;
	c0	br $b0.0, LBB51_15
;;
## BB#7:                                ## %lor.lhs.false.9
	c0	and $r0.2 = $r0.4, 4194303
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB51_15
;;
LBB51_8:                                ## %if.then.12
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
LBB51_9:                                ## %if.end.13
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.5 = $r0.4, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.5
;;
;;
	c0	brf $b0.0, LBB51_10
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
LBB51_15:                               ## %cleanup
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB51_10:                               ## %if.then.17
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB51_11
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
LBB51_11:
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
	c0	br $b0.0, LBB52_7
;;
## BB#1:                                ## %if.then
	c0	cmpltu $b0.0 = $r0.8, 1055
;;
;;
	c0	br $b0.0, LBB52_3
;;
## BB#2:                                ## %if.then.5
	c0	or $r0.3 = $r0.9, $r0.4
	c0	cmpne $b0.0 = $r0.8, 2047
;;
	c0	cmpeq $b0.1 = $r0.3, 0
;;
;;
	c0	slct $r0.3 = $b0.1, $r0.2, 0
;;
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.3
	c0	goto LBB52_19
;;
LBB52_7:                                ## %if.else
	c0	cmpne $b0.0 = $r0.4, 0
	c0	cmpgtu $b0.1 = $r0.8, 1021
;;
;;
	c0	mfb $r0.4 = $b0.0
	c0	br $b0.1, LBB52_9
;;
## BB#8:                                ## %if.then.16
	c0	or $r0.6 = $r0.8, $r0.9
	c0	mov $r0.3 = 0
;;
	c0	or $r0.4 = $r0.6, $r0.4
	c0	goto LBB52_10
;;
LBB52_3:                                ## %if.end.8
	c0	cmpeq $b0.0 = $r0.6, 0
	c0	or $r0.3 = $r0.9, 1048576
;;
;;
	c0	br $b0.0, LBB52_5
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
LBB52_5:                                ## %shortShift64Left.exit
	c0	cmpgtu $b0.0 = $r0.3, -2147483648
;;
;;
	c0	br $b0.0, LBB52_19
;;
## BB#6:
	c0	shl $r0.4 = $r0.4, $r0.6
	c0	goto LBB52_10
;;
LBB52_9:                                ## %if.else.19
	c0	add $r0.3 = $r0.7, 13
	c0	mov $r0.6 = 1043
	c0	or $r0.7 = $r0.9, 1048576
;;
	c0	and $r0.3 = $r0.3, 31
	c0	sub $r0.6 = $r0.6, $r0.8
;;
	c0	shl $r0.8 = $r0.7, $r0.3
	c0	shru $r0.3 = $r0.7, $r0.6
;;
	c0	or $r0.4 = $r0.8, $r0.4
;;
LBB52_10:                               ## %if.end.24
	c0	mov $r0.6 = float_rounding_mode
;;
	c0	ldw $r0.6 = 0[$r0.6]
;;
;;
	c0	cmpne $b0.0 = $r0.6, 0
;;
;;
	c0	brf $b0.0, LBB52_11
;;
## BB#14:                               ## %if.else.40
	c0	cmpne $b0.0 = $r0.4, 0
	c0	cmpeq $b0.1 = $r0.2, 0
;;
;;
	c0	mfb $r0.4 = $b0.0
	c0	br $b0.1, LBB52_16
;;
## BB#15:                               ## %if.then.44
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
	c0	goto LBB52_17
;;
LBB52_11:                               ## %if.then.27
	c0	cmpgt $b0.0 = $r0.4, -1
;;
;;
	c0	br $b0.0, LBB52_13
;;
## BB#12:                               ## %if.then.30
	c0	and $r0.6 = $r0.4, 2147483647
	c0	add $r0.3 = $r0.3, 1
;;
	c0	and $r0.7 = $r0.3, -2
	c0	cmpeq $b0.0 = $r0.6, 0
;;
;;
	c0	slct $r0.3 = $b0.0, $r0.7, $r0.3
;;
LBB52_13:                               ## %if.end.37
	c0	mov $r0.6 = 0
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	sub $r0.6 = $r0.6, $r0.3
;;
	c0	slct $r0.3 = $b0.0, $r0.6, $r0.3
	c0	goto LBB52_17
;;
LBB52_16:                               ## %if.else.49
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
LBB52_17:                               ## %if.end.55
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB52_20
;;
## BB#18:                               ## %if.end.55
	c0	shru $r0.5 = $r0.3, $r0.5
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.5
;;
;;
	c0	br $b0.0, LBB52_20
;;
LBB52_19:                               ## %invalid
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
LBB52_20:                               ## %if.end.64
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB52_22
;;
## BB#21:                               ## %if.then.66
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
;;
;;
	c0	or $r0.4 = $r0.4, 1
;;
	c0	stw 0[$r0.2] = $r0.4
;;
LBB52_22:                               ## %cleanup
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
	c0	br $b0.0, LBB53_5
;;
## BB#1:                                ## %if.then
	c0	cmpltu $b0.0 = $r0.6, 1055
;;
;;
	c0	br $b0.0, LBB53_3
;;
## BB#2:                                ## %if.then.5
	c0	or $r0.3 = $r0.8, $r0.4
	c0	cmpne $b0.0 = $r0.6, 2047
;;
	c0	cmpeq $b0.1 = $r0.3, 0
;;
;;
	c0	slct $r0.3 = $b0.1, $r0.2, 0
;;
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.3
	c0	goto LBB53_10
;;
LBB53_5:                                ## %if.else
	c0	cmpgtu $b0.0 = $r0.6, 1022
;;
;;
	c0	br $b0.0, LBB53_7
;;
## BB#6:                                ## %if.then.11
	c0	or $r0.2 = $r0.8, $r0.4
	c0	mov $r0.3 = 0
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB53_12
;;
	c0	goto LBB53_13
;;
LBB53_3:                                ## %if.end.8
	c0	cmpeq $b0.0 = $r0.9, 0
	c0	shl $r0.6 = $r0.4, $r0.9
	c0	or $r0.3 = $r0.8, 1048576
;;
;;
	c0	br $b0.0, LBB53_8
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
	c0	goto LBB53_8
;;
LBB53_7:                                ## %if.end.18
	c0	add $r0.3 = $r0.7, 13
	c0	mov $r0.7 = 1043
	c0	or $r0.8 = $r0.8, 1048576
;;
	c0	and $r0.3 = $r0.3, 31
	c0	sub $r0.6 = $r0.7, $r0.6
;;
	c0	shl $r0.7 = $r0.8, $r0.3
	c0	shru $r0.3 = $r0.8, $r0.6
;;
	c0	or $r0.6 = $r0.7, $r0.4
;;
LBB53_8:                                ## %if.end.22
	c0	mov $r0.4 = 0
	c0	cmpne $b0.0 = $r0.2, 0
	c0	cmpeq $b0.1 = $r0.3, 0
;;
	c0	sub $r0.4 = $r0.4, $r0.3
;;
	c0	slct $r0.3 = $b0.0, $r0.4, $r0.3
	c0	br $b0.1, LBB53_11
;;
## BB#9:                                ## %if.end.22
	c0	shru $r0.4 = $r0.3, $r0.5
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.4
;;
;;
	c0	br $b0.0, LBB53_11
;;
LBB53_10:                               ## %invalid
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
LBB53_11:                               ## %if.end.32
	c0	cmpeq $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB53_13
;;
LBB53_12:                               ## %if.then.34
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
;;
;;
	c0	or $r0.4 = $r0.4, 1
;;
	c0	stw 0[$r0.2] = $r0.4
;;
LBB53_13:                               ## %cleanup
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
	c0	mov $r0.6 = 20
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.5 = 31
;;
	c0	shru $r0.3 = $r0.2, $r0.6
;;
	c0	and $r0.8 = $r0.3, 2047
;;
	c0	cmpne $b0.0 = $r0.8, 2047
	c0	and $r0.7 = $r0.2, 1048575
	c0	shru $r0.3 = $r0.2, $r0.5
;;
;;
	c0	br $b0.0, LBB54_8
;;
## BB#1:                                ## %if.then
	c0	or $r0.7 = $r0.7, $r0.4
;;
	c0	cmpeq $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB54_7
;;
## BB#2:                                ## %if.then.4
	c0	and $r0.7 = $r0.2, 2146959360
;;
	c0	xor $r0.7 = $r0.7, 2146435072
;;
	c0	cmpne $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB54_6
;;
## BB#3:                                ## %land.rhs.i.i
	c0	cmpne $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB54_5
;;
## BB#4:                                ## %land.rhs.i.i
	c0	and $r0.7 = $r0.2, 524287
;;
	c0	cmpeq $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB54_6
;;
LBB54_5:                                ## %if.then.i
	c0	mov $r0.7 = float_exception_flags
;;
	c0	ldw $r0.8 = 0[$r0.7]
;;
;;
	c0	or $r0.8 = $r0.8, 16
;;
	c0	stw 0[$r0.7] = $r0.8
;;
LBB54_6:                                ## %float64ToCommonNaN.exit
	c0	mov $r0.7 = 12
	c0	shru $r0.4 = $r0.4, $r0.6
	c0	mov $r0.6 = 9
	c0	shl $r0.3 = $r0.3, $r0.5
;;
	c0	shl $r0.2 = $r0.2, $r0.7
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	shru $r0.2 = $r0.2, $r0.6
;;
	c0	or $r0.2 = $r0.3, $r0.2
;;
.return ret($r0.3:u32)
	c0	or $r0.3 = $r0.2, 2143289344
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB54_8:                                ## %if.end.8
	c0	and $r0.5 = $r0.4, 4194303
	c0	mov $r0.6 = 22
	c0	mov $r0.9 = 10
	c0	cmpeq $b0.0 = $r0.8, 0
	c0	add $r0.2 = $r0.8, -897
;;
	c0	cmpne $b0.1 = $r0.5, 0
	c0	shru $r0.4 = $r0.4, $r0.6
	c0	shl $r0.5 = $r0.7, $r0.9
;;
	c0	or $r0.4 = $r0.5, $r0.4
;;
	c0	mfb $r0.5 = $b0.1
;;
	c0	or $r0.5 = $r0.4, $r0.5
	c0	mov $r0.4 = $r0.2
;;
	c0	or $r0.2 = $r0.5, 1073741824
;;
	c0	slct $r0.5 = $b0.0, $r0.5, $r0.2
;;
.call roundAndPackFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = roundAndPackFloat32
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB54_7:                                ## %if.end
	c0	shl $r0.2 = $r0.3, $r0.5
;;
.return ret($r0.3:u32)
	c0	or $r0.3 = $r0.2, 2139095040
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

#.globl float64_round_to_int
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_round_to_int
float64_round_to_int::
## BB#0:                                ## %entry
	c0	mov $r0.2 = 20
;;
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	and $r0.2 = $r0.2, 2047
;;
	c0	cmpltu $b0.0 = $r0.2, 1043
;;
;;
	c0	br $b0.0, LBB55_22
;;
## BB#1:                                ## %if.then
	c0	cmpltu $b0.0 = $r0.2, 1075
;;
;;
	c0	br $b0.0, LBB55_12
;;
## BB#2:                                ## %if.then.2
	c0	cmpne $b0.0 = $r0.2, 2047
;;
;;
	c0	br $b0.0, LBB55_44
;;
## BB#3:                                ## %land.lhs.true
	c0	and $r0.2 = $r0.3, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB55_44
;;
## BB#4:                                ## %if.then.6
	c0	and $r0.2 = $r0.3, 2146959360
;;
	c0	xor $r0.2 = $r0.2, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB55_5
;;
## BB#6:                                ## %land.rhs.i.61.i
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB55_8
;;
## BB#7:                                ## %float64_is_signaling_nan.exit.thread.i
	c0	or $r0.3 = $r0.3, 524288
	c0	goto LBB55_11
;;
LBB55_22:                               ## %if.else.53
	c0	cmpgtu $b0.0 = $r0.2, 1022
;;
;;
	c0	br $b0.0, LBB55_33
;;
## BB#23:                               ## %if.then.56
	c0	add $r0.5 = $r0.3, $r0.3
;;
	c0	or $r0.5 = $r0.5, $r0.4
;;
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB55_44
;;
## BB#24:                               ## %if.end.64
	c0	mov $r0.8 = float_exception_flags
	c0	mov $r0.5 = float_rounding_mode
;;
	c0	ldw $r0.9 = 0[$r0.8]
;;
	c0	ldw $r0.7 = 0[$r0.5]
	c0	mov $r0.6 = 31
;;
	c0	shru $r0.5 = $r0.3, $r0.6
	c0	or $r0.9 = $r0.9, 1
;;
	c0	cmpeq $b0.0 = $r0.7, 3
	c0	stw 0[$r0.8] = $r0.9
;;
;;
	c0	br $b0.0, LBB55_30
;;
## BB#25:                               ## %if.end.64
	c0	cmpeq $b0.0 = $r0.7, 2
;;
;;
	c0	brf $b0.0, LBB55_26
;;
## BB#31:                               ## %sw.bb.81
	c0	cmpeq $b0.0 = $r0.5, 0
	c0	mov $r0.2 = 1072693248
	c0	mov $r0.4 = 0
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	slct $r0.3 = $b0.0, $r0.2, -2147483648
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB55_12:                               ## %if.end.8
	c0	mov $r0.7 = float_rounding_mode
	c0	mov $r0.8 = 1074
	c0	mov $r0.10 = 2
	c0	mov $r0.5 = $r0.3
	c0	mov $r0.6 = $r0.4
;;
	c0	sub $r0.8 = $r0.8, $r0.2
	c0	ldw $r0.9 = 0[$r0.7]
;;
	c0	shl $r0.2 = $r0.10, $r0.8
;;
	c0	cmpeq $b0.0 = $r0.9, 1
;;
;;
	c0	br $b0.0, LBB55_21
;;
## BB#13:                               ## %if.end.8
	c0	cmpne $b0.0 = $r0.9, 0
	c0	add $r0.7 = $r0.2, -1
;;
;;
	c0	br $b0.0, LBB55_19
;;
## BB#14:                               ## %if.then.12
	c0	cmpgtu $b0.0 = $r0.8, 30
;;
;;
	c0	br $b0.0, LBB55_17
;;
## BB#15:                               ## %if.then.14
	c0	mov $r0.5 = 1
;;
	c0	shru $r0.5 = $r0.2, $r0.5
;;
	c0	add $r0.6 = $r0.5, $r0.4
;;
	c0	and $r0.7 = $r0.6, $r0.7
	c0	cmpltu $r0.5 = $r0.6, $r0.5
;;
	c0	cmpne $b0.0 = $r0.7, 0
	c0	add $r0.5 = $r0.5, $r0.3
;;
;;
	c0	br $b0.0, LBB55_21
;;
## BB#16:                               ## %if.then.19
	c0	andc $r0.6 = $r0.2, $r0.6
	c0	goto LBB55_21
;;
LBB55_33:                               ## %if.end.89
	c0	mov $r0.6 = float_rounding_mode
	c0	mov $r0.8 = 1043
	c0	mov $r0.7 = 1
	c0	mov $r0.5 = $r0.3
;;
	c0	sub $r0.2 = $r0.8, $r0.2
	c0	ldw $r0.8 = 0[$r0.6]
;;
	c0	shl $r0.2 = $r0.7, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.8, 1
;;
;;
	c0	br $b0.0, LBB55_39
;;
## BB#34:                               ## %if.end.89
	c0	cmpne $b0.0 = $r0.8, 0
	c0	add $r0.6 = $r0.2, -1
;;
;;
	c0	br $b0.0, LBB55_37
;;
## BB#35:                               ## %if.then.98
	c0	shru $r0.5 = $r0.2, $r0.7
;;
	c0	add $r0.5 = $r0.5, $r0.3
;;
	c0	and $r0.6 = $r0.5, $r0.6
;;
	c0	or $r0.6 = $r0.6, $r0.4
;;
	c0	cmpne $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB55_39
;;
## BB#36:                               ## %if.then.107
	c0	andc $r0.5 = $r0.2, $r0.5
	c0	goto LBB55_39
;;
LBB55_19:                               ## %if.then.38
	c0	cmpeq $b0.0 = $r0.9, 2
	c0	mov $r0.8 = 31
	c0	mov $r0.5 = $r0.3
	c0	mov $r0.6 = $r0.4
;;
	c0	shru $r0.8 = $r0.3, $r0.8
;;
	c0	mfb $r0.9 = $b0.0
;;
	c0	cmpeq $b0.0 = $r0.8, $r0.9
;;
;;
	c0	br $b0.0, LBB55_21
;;
## BB#20:                               ## %if.then.42
	c0	add $r0.6 = $r0.7, $r0.4
;;
	c0	cmpltu $r0.5 = $r0.6, $r0.7
;;
	c0	add $r0.5 = $r0.5, $r0.3
	c0	goto LBB55_21
;;
LBB55_37:                               ## %if.then.115
	c0	cmpeq $b0.0 = $r0.8, 2
	c0	mov $r0.7 = 31
	c0	mov $r0.5 = $r0.3
;;
	c0	shru $r0.7 = $r0.3, $r0.7
;;
	c0	mfb $r0.8 = $b0.0
;;
	c0	cmpeq $b0.0 = $r0.7, $r0.8
;;
;;
	c0	br $b0.0, LBB55_39
;;
## BB#38:                               ## %if.then.121
	c0	cmpne $b0.0 = $r0.4, 0
;;
;;
	c0	mfb $r0.5 = $b0.0
;;
	c0	or $r0.5 = $r0.5, $r0.3
;;
	c0	add $r0.5 = $r0.6, $r0.5
;;
LBB55_39:                               ## %if.end.131
	c0	mov $r0.6 = 0
;;
	c0	sub $r0.2 = $r0.6, $r0.2
;;
	c0	and $r0.5 = $r0.5, $r0.2
	c0	goto LBB55_40
;;
LBB55_30:                               ## %sw.bb.77
	c0	cmpeq $b0.0 = $r0.5, 0
	c0	mov $r0.4 = 0
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	slct $r0.3 = $b0.0, $r0.4, -1074790400
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB55_26:                               ## %if.end.64
	c0	cmpne $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB55_32
;;
## BB#27:                               ## %sw.bb
	c0	cmpne $b0.0 = $r0.2, 1022
;;
;;
	c0	br $b0.0, LBB55_32
;;
## BB#28:                               ## %land.lhs.true.69
	c0	and $r0.2 = $r0.3, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB55_32
;;
## BB#29:                               ## %if.then.74
	c0	shl $r0.2 = $r0.5, $r0.6
	c0	mov $r0.4 = 0
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	or $r0.3 = $r0.2, 1072693248
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB55_32:                               ## %sw.epilog
.return ret($r0.3:u32,$r0.4:u32)
	c0	mov $r0.4 = 0
	c0	shl $r0.3 = $r0.5, $r0.6
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB55_5:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB55_9
;;
LBB55_17:                               ## %if.else
	c0	cmpgt $b0.0 = $r0.4, -1
	c0	mov $r0.5 = $r0.3
	c0	mov $r0.6 = $r0.4
;;
;;
	c0	br $b0.0, LBB55_21
;;
## BB#18:                               ## %if.then.25
	c0	and $r0.5 = $r0.4, 2147483647
	c0	add $r0.7 = $r0.3, 1
	c0	mov $r0.6 = $r0.4
;;
	c0	and $r0.8 = $r0.7, -2
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	slct $r0.5 = $b0.0, $r0.8, $r0.7
;;
LBB55_21:                               ## %if.end.49
	c0	mov $r0.7 = 0
;;
	c0	sub $r0.2 = $r0.7, $r0.2
;;
	c0	and $r0.6 = $r0.6, $r0.2
;;
LBB55_40:                               ## %if.end.135
	c0	cmpne $b0.0 = $r0.5, $r0.3
;;
;;
	c0	br $b0.0, LBB55_42
;;
## BB#41:                               ## %if.end.135
	c0	cmpeq $b0.0 = $r0.6, $r0.4
;;
;;
	c0	br $b0.0, LBB55_44
;;
LBB55_42:                               ## %if.then.144
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.2]
	c0	mov $r0.4 = $r0.6
	c0	mov $r0.3 = $r0.5
;;
;;
	c0	or $r0.5 = $r0.7, 1
	c0	goto LBB55_43
;;
LBB55_8:                                ## %lor.rhs.i.i
	c0	and $r0.2 = $r0.3, 524287
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
LBB55_9:                                ## %float64_is_signaling_nan.exit.i
	c0	or $r0.3 = $r0.3, 524288
	c0	br $b0.0, LBB55_11
;;
## BB#10:                               ## %float64_is_signaling_nan.exit.i
	c0	mfb $r0.2 = $b0.0
;;
	c0	cmpne $b0.0 = $r0.2, 1
;;
;;
	c0	br $b0.0, LBB55_44
;;
LBB55_11:                               ## %if.then.i
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.5 = 0[$r0.2]
;;
;;
	c0	or $r0.5 = $r0.5, 16
;;
LBB55_43:                               ## %cleanup
	c0	stw 0[$r0.2] = $r0.5
;;
LBB55_44:                               ## %cleanup
.return ret($r0.3:u32,$r0.4:u32)
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
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.8 = $r0.5, $r0.2
	c0	shru $r0.7 = $r0.3, $r0.2
;;
	c0	cmpne $b0.0 = $r0.7, $r0.8
;;
;;
	c0	br $b0.0, LBB56_2
;;
## BB#1:                                ## %if.then
.call addFloat64Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = addFloat64Sigs
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB56_2:                                ## %if.else
.call subFloat64Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = subFloat64Sigs
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
	c0	mov $r0.2 = 20
;;
	c0	shru $r0.8 = $r0.5, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	and $r0.11 = $r0.8, 2047
	c0	and $r0.2 = $r0.2, 2047
;;
	c0	sub $r0.12 = $r0.2, $r0.11
;;
	c0	cmplt $b0.0 = $r0.12, 1
	c0	and $r0.9 = $r0.5, 1048575
	c0	and $r0.10 = $r0.3, 1048575
;;
;;
	c0	br $b0.0, LBB57_35
;;
## BB#1:                                ## %if.then
	c0	cmpne $b0.0 = $r0.2, 2047
;;
;;
	c0	br $b0.0, LBB57_23
;;
## BB#2:                                ## %if.then.7
	c0	or $r0.2 = $r0.10, $r0.4
	c0	goto LBB57_3
;;
LBB57_35:                               ## %if.else.15
	c0	cmpgt $b0.0 = $r0.12, -1
;;
;;
	c0	brf $b0.0, LBB57_36
;;
## BB#49:                               ## %if.else.33
	c0	cmpne $b0.0 = $r0.2, 2047
;;
;;
	c0	br $b0.0, LBB57_51
;;
## BB#50:                               ## %if.then.35
	c0	or $r0.2 = $r0.6, $r0.4
;;
	c0	or $r0.2 = $r0.2, $r0.10
;;
	c0	or $r0.2 = $r0.2, $r0.9
;;
LBB57_3:                                ## %if.then.7
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB57_4
;;
	c0	goto LBB57_59
;;
LBB57_23:                               ## %if.end.10
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB57_25
;;
## BB#24:                               ## %if.end.14.thread
	c0	mov $r0.3 = 0
	c0	or $r0.9 = $r0.9, 1048576
	c0	mov $r0.5 = $r0.12
	c0	goto LBB57_27
;;
LBB57_36:                               ## %if.then.17
	c0	cmpne $b0.0 = $r0.11, 2047
;;
;;
	c0	br $b0.0, LBB57_39
;;
## BB#37:                               ## %if.then.19
	c0	or $r0.2 = $r0.9, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB57_38
;;
LBB57_4:                                ## %if.then.8
	c0	and $r0.2 = $r0.3, 2146959360
;;
	c0	xor $r0.2 = $r0.2, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB57_5
;;
## BB#6:                                ## %land.rhs.i.61.i.226
	c0	cmpne $b0.0 = $r0.4, 0
;;
;;
	c0	brf $b0.0, LBB57_8
;;
## BB#7:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.1 = $r0.2
	c0	goto LBB57_9
;;
LBB57_5:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.1 = $r0.2
	c0	goto LBB57_9
;;
LBB57_51:                               ## %if.end.43
	c0	add $r0.4 = $r0.6, $r0.4
	c0	cmpne $b0.0 = $r0.2, 0
	c0	add $r0.3 = $r0.9, $r0.10
;;
	c0	cmpltu $r0.5 = $r0.4, $r0.6
;;
	c0	add $r0.3 = $r0.3, $r0.5
	c0	brf $b0.0, LBB57_52
;;
## BB#56:                               ## %if.end.47
	c0	or $r0.5 = $r0.3, 2097152
	c0	mov $r0.8 = 0
	c0	goto LBB57_57
;;
LBB57_25:                               ## %if.end.14
	c0	add $r0.5 = $r0.12, -1
;;
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB57_53
;;
## BB#26:
	c0	mov $r0.3 = 1
;;
LBB57_27:                               ## %if.else.i.186
	c0	sub $r0.3 = $r0.3, $r0.12
	c0	cmpgt $b0.0 = $r0.5, 31
;;
	c0	and $r0.8 = $r0.3, 31
;;
	c0	br $b0.0, LBB57_29
;;
## BB#28:                               ## %if.then.2.i.192
	c0	shru $r0.11 = $r0.6, $r0.5
	c0	shl $r0.12 = $r0.9, $r0.8
	c0	shl $r0.8 = $r0.6, $r0.8
	c0	shru $r0.3 = $r0.9, $r0.5
	c0	mov $r0.6 = 0
;;
	c0	or $r0.9 = $r0.12, $r0.11
	c0	goto LBB57_34
;;
LBB57_29:                               ## %if.else.5.i.194
	c0	cmpeq $b0.0 = $r0.5, 32
	c0	mov $r0.3 = 0
;;
;;
	c0	brf $b0.0, LBB57_31
;;
## BB#30:
	c0	mov $r0.8 = $r0.6
	c0	mov $r0.6 = $r0.3
	c0	goto LBB57_34
;;
LBB57_39:                               ## %if.end.26
	c0	cmpeq $b0.0 = $r0.2, 0
	c0	or $r0.2 = $r0.10, 1048576
	c0	mov $r0.8 = 0
;;
;;
	c0	mfb $r0.3 = $b0.0
	c0	slct $r0.10 = $b0.0, $r0.10, $r0.2
;;
	c0	add $r0.12 = $r0.12, $r0.3
;;
	c0	cmpeq $b0.0 = $r0.12, 0
;;
;;
	c0	br $b0.0, LBB57_40
;;
## BB#41:                               ## %if.else.i
	c0	cmplt $b0.0 = $r0.12, -31
	c0	sub $r0.2 = $r0.8, $r0.12
	c0	and $r0.5 = $r0.12, 31
;;
;;
	c0	br $b0.0, LBB57_43
;;
## BB#42:                               ## %if.then.2.i
	c0	shru $r0.8 = $r0.4, $r0.2
	c0	shl $r0.12 = $r0.10, $r0.5
	c0	shl $r0.5 = $r0.4, $r0.5
	c0	shru $r0.3 = $r0.10, $r0.2
	c0	mov $r0.4 = 0
;;
	c0	or $r0.10 = $r0.12, $r0.8
	c0	goto LBB57_48
;;
LBB57_31:                               ## %if.else.8.i.196
	c0	cmpgt $b0.0 = $r0.5, 63
;;
;;
	c0	br $b0.0, LBB57_33
;;
## BB#32:                               ## %if.then.11.i.200
	c0	and $r0.5 = $r0.5, 31
	c0	shl $r0.8 = $r0.9, $r0.8
;;
	c0	shru $r0.9 = $r0.9, $r0.5
	c0	goto LBB57_34
;;
LBB57_8:                                ## %lor.rhs.i.64.i.229
	c0	and $r0.2 = $r0.3, 524287
;;
	c0	cmpne $b0.1 = $r0.2, 0
;;
LBB57_9:                                ## %float64_is_signaling_nan.exit66.i.233
	c0	add $r0.2 = $r0.5, $r0.5
;;
	c0	cmpltu $b0.0 = $r0.2, -2097152
;;
;;
	c0	br $b0.0, LBB57_10
;;
## BB#11:                               ## %land.rhs.i.53.i.236
	c0	cmpne $b0.0 = $r0.6, 0
;;
;;
	c0	brf $b0.0, LBB57_13
;;
## BB#12:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB57_14
;;
LBB57_10:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB57_14
;;
LBB57_13:                               ## %lor.rhs.i.55.i.239
	c0	and $r0.2 = $r0.5, 1048575
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
LBB57_14:                               ## %float64_is_nan.exit.i.242
	c0	and $r0.2 = $r0.5, 2146959360
;;
	c0	xor $r0.2 = $r0.2, 2146435072
;;
	c0	cmpne $b0.2 = $r0.2, 0
;;
;;
	c0	br $b0.2, LBB57_15
;;
## BB#16:                               ## %land.rhs.i.i.245
	c0	cmpeq $b0.2 = $r0.6, 0
;;
;;
	c0	br $b0.2, LBB57_19
;;
## BB#17:                               ## %float64_is_signaling_nan.exit.thread.i.248
	c0	mov $r0.7 = -1
	c0	or $r0.3 = $r0.3, 524288
	c0	or $r0.2 = $r0.5, 524288
;;
	c0	mtb $b0.2 = $r0.7
	c0	goto LBB57_18
;;
LBB57_15:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.2 = $r0.2
	c0	goto LBB57_20
;;
LBB57_19:                               ## %lor.rhs.i.i.251
	c0	and $r0.2 = $r0.5, 524287
;;
	c0	cmpne $b0.2 = $r0.2, 0
;;
LBB57_20:                               ## %float64_is_signaling_nan.exit.i.255
	c0	mfb $r0.7 = $b0.2
	c0	mfb $r0.8 = $b0.1
	c0	or $r0.2 = $r0.5, 524288
	c0	or $r0.3 = $r0.3, 524288
;;
	c0	or $r0.5 = $r0.8, $r0.7
;;
	c0	and $r0.5 = $r0.5, 1
;;
	c0	cmpeq $b0.1 = $r0.5, 0
;;
;;
	c0	br $b0.1, LBB57_21
;;
LBB57_18:                               ## %if.then.i.259
	c0	mov $r0.5 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.5]
	c0	mov $r0.8 = -1
;;
	c0	mtb $b0.1 = $r0.8
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.5] = $r0.7
	c0	goto LBB57_22
;;
LBB57_21:
	c0	mov $r0.5 = 0
;;
	c0	mtb $b0.1 = $r0.5
;;
;;
	c0	mfb $r0.11 = $b0.1
;;
	c0	mtb $b0.2 = $r0.11
;;
LBB57_22:                               ## %propagateFloat64NaN.exit273
	c0	slct $r0.5 = $b0.0, $r0.2, $r0.3
	c0	slct $r0.2 = $b0.2, $r0.2, $r0.3
	c0	slct $r0.7 = $b0.2, $r0.6, $r0.4
	c0	slct $r0.4 = $b0.0, $r0.6, $r0.4
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	slct $r0.3 = $b0.1, $r0.2, $r0.5
	c0	slct $r0.4 = $b0.1, $r0.7, $r0.4
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB57_52:                               ## %if.then.45
	c0	mov $r0.2 = 31
;;
	c0	shl $r0.2 = $r0.7, $r0.2
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	or $r0.3 = $r0.3, $r0.2
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB57_53:
	c0	mov $r0.8 = 0
	c0	goto LBB57_54
;;
LBB57_33:                               ## %if.else.15.i.205
	c0	cmpne $b0.0 = $r0.9, 0
	c0	cmpeq $b0.1 = $r0.5, 64
	c0	mov $r0.3 = 0
;;
;;
	c0	mfb $r0.5 = $b0.0
;;
	c0	slct $r0.8 = $b0.1, $r0.9, $r0.5
	c0	mov $r0.9 = $r0.3
;;
LBB57_34:                               ## %if.end.19.i.213
	c0	cmpne $b0.0 = $r0.6, 0
	c0	mov $r0.5 = $r0.9
	c0	mov $r0.9 = $r0.3
;;
	c0	mov $r0.6 = $r0.5
;;
	c0	mfb $r0.3 = $b0.0
;;
	c0	or $r0.8 = $r0.3, $r0.8
;;
LBB57_54:                               ## %if.end.50
	c0	add $r0.4 = $r0.6, $r0.4
	c0	or $r0.3 = $r0.10, 1048576
;;
	c0	cmpltu $r0.5 = $r0.4, $r0.6
	c0	add $r0.3 = $r0.9, $r0.3
;;
	c0	add $r0.5 = $r0.3, $r0.5
;;
	c0	cmpltu $b0.0 = $r0.5, 2097152
;;
;;
	c0	brf $b0.0, LBB57_57
;;
## BB#55:
	c0	add $r0.2 = $r0.2, -1
	c0	goto LBB57_58
;;
LBB57_57:                               ## %shiftRight1
	c0	cmpne $b0.0 = $r0.8, 0
	c0	mov $r0.3 = 31
	c0	mov $r0.6 = 1
;;
	c0	shl $r0.8 = $r0.5, $r0.3
	c0	shl $r0.3 = $r0.4, $r0.3
	c0	shru $r0.4 = $r0.4, $r0.6
	c0	shru $r0.5 = $r0.5, $r0.6
;;
	c0	mfb $r0.6 = $b0.0
	c0	or $r0.4 = $r0.4, $r0.8
;;
	c0	or $r0.8 = $r0.6, $r0.3
;;
LBB57_58:                               ## %roundAndPack
	c0	mov $r0.6 = $r0.4
	c0	mov $r0.4 = $r0.2
	c0	mov $r0.3 = $r0.7
	c0	mov $r0.7 = $r0.8
;;
.call roundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = roundAndPackFloat64
;;
LBB57_59:                               ## %cleanup
.return ret($r0.3:u32,$r0.4:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB57_38:                               ## %if.end.24
	c0	mov $r0.2 = 31
	c0	mov $r0.4 = 0
;;
	c0	shl $r0.2 = $r0.7, $r0.2
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	or $r0.3 = $r0.2, 2146435072
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB57_40:
	c0	mov $r0.2 = $r0.11
	c0	goto LBB57_54
;;
LBB57_43:                               ## %if.else.5.i
	c0	cmpeq $b0.0 = $r0.2, 32
	c0	mov $r0.3 = 0
;;
;;
	c0	brf $b0.0, LBB57_45
;;
## BB#44:
	c0	mov $r0.5 = $r0.4
	c0	mov $r0.4 = $r0.3
	c0	goto LBB57_48
;;
LBB57_45:                               ## %if.else.8.i
	c0	cmplt $b0.0 = $r0.12, -63
;;
;;
	c0	br $b0.0, LBB57_47
;;
## BB#46:                               ## %if.then.11.i
	c0	and $r0.2 = $r0.2, 31
	c0	shl $r0.5 = $r0.10, $r0.5
;;
	c0	shru $r0.10 = $r0.10, $r0.2
	c0	goto LBB57_48
;;
LBB57_47:                               ## %if.else.15.i
	c0	cmpne $b0.0 = $r0.10, 0
	c0	cmpeq $b0.1 = $r0.2, 64
	c0	mov $r0.3 = 0
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	slct $r0.5 = $b0.1, $r0.10, $r0.2
	c0	mov $r0.10 = $r0.3
;;
LBB57_48:                               ## %if.end.19.i
	c0	cmpne $b0.0 = $r0.4, 0
	c0	mov $r0.4 = $r0.10
	c0	mov $r0.2 = $r0.11
	c0	mov $r0.10 = $r0.3
;;
;;
	c0	mfb $r0.3 = $b0.0
;;
	c0	or $r0.8 = $r0.3, $r0.5
	c0	goto LBB57_54
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @subFloat64Sigs
subFloat64Sigs::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
	c0	mov $r0.2 = 20
	c0	mov $r0.9 = 10
	c0	mov $r0.8 = 22
;;
	c0	shru $r0.10 = $r0.5, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.2
	c0	shl $r0.14 = $r0.3, $r0.9
	c0	shl $r0.15 = $r0.5, $r0.9
;;
	c0	and $r0.12 = $r0.10, 2047
	c0	and $r0.11 = $r0.2, 2047
;;
	c0	sub $r0.13 = $r0.11, $r0.12
	c0	shru $r0.2 = $r0.4, $r0.8
	c0	shru $r0.16 = $r0.6, $r0.8
	c0	and $r0.10 = $r0.14, 1073740800
	c0	and $r0.14 = $r0.15, 1073740800
;;
	c0	cmpgt $b0.0 = $r0.13, 0
	c0	shl $r0.8 = $r0.4, $r0.9
	c0	shl $r0.9 = $r0.6, $r0.9
	c0	or $r0.10 = $r0.10, $r0.2
	c0	or $r0.2 = $r0.14, $r0.16
;;
;;
	c0	brf $b0.0, LBB58_1
;;
## BB#45:                               ## %aExpBigger
	c0	cmpne $b0.0 = $r0.11, 2047
;;
;;
	c0	br $b0.0, LBB58_47
;;
## BB#46:                               ## %if.then.54
	c0	or $r0.2 = $r0.10, $r0.8
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB58_5
;;
	c0	goto LBB58_61
;;
LBB58_1:                                ## %if.end
	c0	cmplt $b0.0 = $r0.13, 0
;;
;;
	c0	br $b0.0, LBB58_30
;;
## BB#2:                                ## %if.end.8
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	brf $b0.0, LBB58_3
;;
## BB#24:                               ## %if.then.18
	c0	mov $r0.11 = 1
;;
	c0	mov $r0.12 = $r0.11
	c0	goto LBB58_25
;;
LBB58_47:                               ## %if.end.60
	c0	cmpeq $b0.0 = $r0.12, 0
;;
;;
	c0	br $b0.0, LBB58_49
;;
## BB#48:                               ## %if.end.66.thread
	c0	mov $r0.4 = 0
	c0	or $r0.2 = $r0.2, 1073741824
	c0	mov $r0.3 = $r0.13
	c0	goto LBB58_51
;;
LBB58_30:                               ## %bExpBigger
	c0	cmpne $b0.0 = $r0.12, 2047
;;
;;
	c0	br $b0.0, LBB58_33
;;
## BB#31:                               ## %if.then.36
	c0	or $r0.2 = $r0.2, $r0.9
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB58_5
;;
## BB#32:                               ## %if.end.41
	c0	mov $r0.2 = 31
	c0	mov $r0.4 = 0
;;
	c0	shl $r0.3 = $r0.7, $r0.2
	c0	mov $r0.2 = $r0.4
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	add $r0.3 = $r0.3, -1048576
	c0	or $r0.4 = $r0.2, $r0.4
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB58_3:                                ## %if.end.8
	c0	cmpne $b0.0 = $r0.11, 2047
;;
;;
	c0	br $b0.0, LBB58_25
;;
## BB#4:                                ## %if.then.10
	c0	or $r0.7 = $r0.9, $r0.8
;;
	c0	or $r0.7 = $r0.7, $r0.10
;;
	c0	or $r0.2 = $r0.7, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB58_23
;;
LBB58_5:                                ## %if.then.13
	c0	and $r0.2 = $r0.3, 2146959360
;;
	c0	xor $r0.2 = $r0.2, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB58_6
;;
## BB#7:                                ## %land.rhs.i.61.i.247
	c0	cmpne $b0.0 = $r0.4, 0
;;
;;
	c0	brf $b0.0, LBB58_9
;;
## BB#8:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.1 = $r0.2
	c0	goto LBB58_10
;;
LBB58_25:                               ## %if.end.19
	c0	cmpltu $b0.0 = $r0.2, $r0.10
;;
;;
	c0	br $b0.0, LBB58_59
;;
## BB#26:                               ## %if.end.22
	c0	cmpltu $b0.0 = $r0.10, $r0.2
;;
;;
	c0	br $b0.0, LBB58_44
;;
## BB#27:                               ## %if.end.25
	c0	cmpltu $b0.0 = $r0.9, $r0.8
;;
;;
	c0	br $b0.0, LBB58_59
;;
## BB#28:                               ## %if.end.28
	c0	cmpltu $b0.0 = $r0.8, $r0.9
;;
;;
	c0	br $b0.0, LBB58_44
;;
## BB#29:                               ## %if.end.31
	c0	mov $r0.2 = float_rounding_mode
;;
	c0	ldw $r0.3 = 0[$r0.2]
	c0	mov $r0.5 = 31
	c0	mov $r0.4 = 0
;;
	c0	mov $r0.2 = $r0.4
;;
	c0	cmpeq $b0.0 = $r0.3, 3
;;
;;
	c0	mfb $r0.3 = $b0.0
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	shl $r0.3 = $r0.3, $r0.5
	c0	or $r0.4 = $r0.2, $r0.4
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB58_6:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.1 = $r0.2
	c0	goto LBB58_10
;;
LBB58_49:                               ## %if.end.66
	c0	add $r0.3 = $r0.13, -1
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB58_58
;;
## BB#50:
	c0	mov $r0.4 = 1
;;
LBB58_51:                               ## %if.else.i
	c0	sub $r0.4 = $r0.4, $r0.13
	c0	cmpgt $b0.0 = $r0.3, 31
;;
	c0	and $r0.4 = $r0.4, 31
;;
	c0	br $b0.0, LBB58_53
;;
## BB#52:                               ## %if.then.2.i
	c0	shl $r0.5 = $r0.9, $r0.4
	c0	shl $r0.4 = $r0.2, $r0.4
	c0	shru $r0.6 = $r0.9, $r0.3
	c0	shru $r0.2 = $r0.2, $r0.3
;;
	c0	cmpne $b0.0 = $r0.5, 0
	c0	or $r0.3 = $r0.4, $r0.6
;;
;;
	c0	mfb $r0.4 = $b0.0
;;
	c0	or $r0.9 = $r0.3, $r0.4
	c0	goto LBB58_58
;;
LBB58_53:                               ## %if.else.7.i
	c0	cmpne $b0.0 = $r0.3, 32
;;
;;
	c0	br $b0.0, LBB58_55
;;
## BB#54:                               ## %if.then.10.i
	c0	cmpne $b0.0 = $r0.9, 0
	c0	mov $r0.3 = 0
;;
;;
	c0	mfb $r0.4 = $b0.0
;;
	c0	or $r0.9 = $r0.2, $r0.4
	c0	mov $r0.2 = $r0.3
	c0	goto LBB58_58
;;
LBB58_33:                               ## %if.end.43
	c0	cmpeq $b0.0 = $r0.11, 0
	c0	or $r0.3 = $r0.10, 1073741824
;;
;;
	c0	mfb $r0.4 = $b0.0
	c0	slct $r0.3 = $b0.0, $r0.10, $r0.3
;;
	c0	add $r0.6 = $r0.13, $r0.4
;;
	c0	cmpeq $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB58_34
;;
## BB#35:                               ## %if.else.i.145
	c0	mov $r0.10 = 0
	c0	cmplt $b0.0 = $r0.6, -31
	c0	and $r0.5 = $r0.6, 31
;;
	c0	sub $r0.4 = $r0.10, $r0.6
;;
	c0	br $b0.0, LBB58_37
;;
## BB#36:                               ## %if.then.2.i.154
	c0	shl $r0.6 = $r0.8, $r0.5
	c0	shl $r0.5 = $r0.3, $r0.5
	c0	shru $r0.8 = $r0.8, $r0.4
	c0	shru $r0.10 = $r0.3, $r0.4
;;
	c0	cmpne $b0.0 = $r0.6, 0
	c0	or $r0.3 = $r0.5, $r0.8
	c0	goto LBB58_39
;;
LBB58_55:                               ## %if.else.14.i
	c0	cmpgt $b0.0 = $r0.3, 63
;;
;;
	c0	br $b0.0, LBB58_57
;;
## BB#56:                               ## %if.then.17.i
	c0	shl $r0.4 = $r0.2, $r0.4
	c0	and $r0.3 = $r0.3, 31
;;
	c0	shru $r0.3 = $r0.2, $r0.3
	c0	mov $r0.2 = 0
	c0	or $r0.4 = $r0.4, $r0.9
;;
	c0	cmpne $b0.0 = $r0.4, 0
;;
;;
	c0	mfb $r0.4 = $b0.0
;;
	c0	or $r0.9 = $r0.4, $r0.3
	c0	goto LBB58_58
;;
LBB58_9:                                ## %lor.rhs.i.64.i.250
	c0	and $r0.2 = $r0.3, 524287
;;
	c0	cmpne $b0.1 = $r0.2, 0
;;
LBB58_10:                               ## %float64_is_signaling_nan.exit66.i.254
	c0	add $r0.2 = $r0.5, $r0.5
;;
	c0	cmpltu $b0.0 = $r0.2, -2097152
;;
;;
	c0	br $b0.0, LBB58_11
;;
## BB#12:                               ## %land.rhs.i.53.i.257
	c0	cmpne $b0.0 = $r0.6, 0
;;
;;
	c0	brf $b0.0, LBB58_14
;;
## BB#13:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB58_15
;;
LBB58_11:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB58_15
;;
LBB58_14:                               ## %lor.rhs.i.55.i.260
	c0	and $r0.2 = $r0.5, 1048575
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
LBB58_15:                               ## %float64_is_nan.exit.i.263
	c0	and $r0.7 = $r0.5, 2146959360
	c0	mov $r0.2 = 0
;;
	c0	xor $r0.7 = $r0.7, 2146435072
	c0	mtb $b0.2 = $r0.2
;;
	c0	cmpne $b0.3 = $r0.7, 0
;;
;;
	c0	br $b0.3, LBB58_20
;;
## BB#16:                               ## %land.rhs.i.i.266
	c0	cmpeq $b0.2 = $r0.6, 0
;;
;;
	c0	br $b0.2, LBB58_19
;;
## BB#17:                               ## %float64_is_signaling_nan.exit.thread.i.269
	c0	mov $r0.7 = -1
	c0	or $r0.3 = $r0.3, 524288
	c0	or $r0.5 = $r0.5, 524288
;;
	c0	mtb $b0.2 = $r0.7
	c0	goto LBB58_18
;;
LBB58_19:                               ## %lor.rhs.i.i.272
	c0	and $r0.7 = $r0.5, 524287
;;
	c0	cmpne $b0.2 = $r0.7, 0
;;
LBB58_20:                               ## %float64_is_signaling_nan.exit.i.276
	c0	mfb $r0.7 = $b0.2
	c0	mfb $r0.8 = $b0.1
	c0	or $r0.5 = $r0.5, 524288
	c0	or $r0.3 = $r0.3, 524288
;;
	c0	or $r0.7 = $r0.8, $r0.7
;;
	c0	and $r0.7 = $r0.7, 1
;;
	c0	cmpeq $b0.1 = $r0.7, 0
;;
;;
	c0	br $b0.1, LBB58_21
;;
LBB58_18:                               ## %if.then.i.280
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
	c0	goto LBB58_22
;;
LBB58_21:
	c0	mov $r0.7 = 0
;;
	c0	mtb $b0.1 = $r0.7
;;
;;
	c0	mfb $r0.11 = $b0.1
;;
	c0	mtb $b0.2 = $r0.11
;;
LBB58_22:                               ## %propagateFloat64NaN.exit294
	c0	slct $r0.7 = $b0.0, $r0.5, $r0.3
	c0	slct $r0.3 = $b0.2, $r0.5, $r0.3
	c0	slct $r0.5 = $b0.2, $r0.6, $r0.4
	c0	slct $r0.4 = $b0.0, $r0.6, $r0.4
;;
	c0	slct $r0.3 = $b0.1, $r0.3, $r0.7
	c0	slct $r0.4 = $b0.1, $r0.5, $r0.4
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	or $r0.4 = $r0.2, $r0.4
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB58_57:                               ## %if.else.25.i
	c0	or $r0.3 = $r0.2, $r0.9
	c0	mov $r0.2 = 0
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	mfb $r0.9 = $b0.0
;;
LBB58_58:                               ## %shift64RightJamming.exit
	c0	or $r0.10 = $r0.10, 1073741824
;;
LBB58_59:                               ## %aBigger
	c0	cmpltu $r0.3 = $r0.8, $r0.9
	c0	mov $r0.4 = -1
	c0	sub $r0.2 = $r0.10, $r0.2
	c0	sub $r0.6 = $r0.8, $r0.9
	c0	mov $r0.12 = $r0.11
	c0	goto LBB58_60
;;
LBB58_34:
	c0	mov $r0.10 = $r0.3
	c0	goto LBB58_43
;;
LBB58_23:                               ## %if.end.15
	c0	mov $r0.5 = float_exception_flags
;;
	c0	ldw $r0.6 = 0[$r0.5]
	c0	mov $r0.4 = -1
	c0	mov $r0.3 = 2147483647
	c0	mov $r0.2 = 0
;;
;;
	c0	or $r0.6 = $r0.6, 16
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	stw 0[$r0.5] = $r0.6
	c0	or $r0.4 = $r0.2, $r0.4
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB58_37:                               ## %if.else.7.i.156
	c0	cmpne $b0.0 = $r0.4, 32
;;
;;
	c0	br $b0.0, LBB58_40
;;
## BB#38:                               ## %if.then.10.i.160
	c0	cmpne $b0.0 = $r0.8, 0
;;
LBB58_39:                               ## %shift64RightJamming.exit177
	c0	mfb $r0.4 = $b0.0
;;
	c0	or $r0.8 = $r0.3, $r0.4
;;
LBB58_43:                               ## %shift64RightJamming.exit177
	c0	or $r0.2 = $r0.2, 1073741824
;;
LBB58_44:                               ## %bBigger
	c0	cmpltu $r0.3 = $r0.9, $r0.8
	c0	mov $r0.4 = -1
	c0	sub $r0.2 = $r0.2, $r0.10
	c0	xor $r0.7 = $r0.7, 1
	c0	sub $r0.6 = $r0.9, $r0.8
;;
LBB58_60:                               ## %normalizeRoundAndPack
	c0	mtb $b0.0 = $r0.3
;;
;;
	c0	slct $r0.3 = $b0.0, $r0.4, 0
;;
	c0	add $r0.5 = $r0.2, $r0.3
	c0	add $r0.4 = $r0.12, -11
	c0	mov $r0.3 = $r0.7
;;
.call normalizeRoundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = normalizeRoundAndPackFloat64
;;
LBB58_61:                               ## %cleanup
	c0	mov $r0.2 = 0
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	or $r0.4 = $r0.2, $r0.4
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB58_40:                               ## %if.else.14.i.162
	c0	cmplt $b0.0 = $r0.6, -63
;;
;;
	c0	br $b0.0, LBB58_42
;;
## BB#41:                               ## %if.then.17.i.170
	c0	shl $r0.5 = $r0.3, $r0.5
	c0	and $r0.4 = $r0.4, 31
;;
	c0	or $r0.5 = $r0.5, $r0.8
	c0	shru $r0.3 = $r0.3, $r0.4
;;
	c0	cmpne $b0.0 = $r0.5, 0
;;
;;
	c0	mfb $r0.4 = $b0.0
;;
	c0	or $r0.8 = $r0.4, $r0.3
	c0	goto LBB58_43
;;
LBB58_42:                               ## %if.else.25.i.174
	c0	or $r0.3 = $r0.3, $r0.8
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	mfb $r0.8 = $b0.0
	c0	goto LBB58_43
;;
.endp

#.globl float64_sub
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_sub
float64_sub::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.8 = $r0.5, $r0.2
	c0	shru $r0.7 = $r0.3, $r0.2
;;
	c0	cmpne $b0.0 = $r0.7, $r0.8
;;
;;
	c0	br $b0.0, LBB59_2
;;
## BB#1:                                ## %if.then
.call subFloat64Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = subFloat64Sigs
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB59_2:                                ## %if.else
.call addFloat64Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = addFloat64Sigs
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
	c0	mov $r0.10 = 20
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.8 = 31
;;
	c0	xor $r0.3 = $r0.5, $r0.2
	c0	shru $r0.7 = $r0.2, $r0.10
	c0	shru $r0.13 = $r0.5, $r0.10
;;
	c0	and $r0.9 = $r0.7, 2047
;;
	c0	cmpne $b0.0 = $r0.9, 2047
	c0	and $r0.12 = $r0.2, 1048575
	c0	and $r0.11 = $r0.5, 1048575
	c0	shru $r0.3 = $r0.3, $r0.8
;;
	c0	and $r0.7 = $r0.13, 2047
;;
;;
	c0	br $b0.0, LBB60_24
;;
## BB#1:                                ## %if.then
	c0	or $r0.9 = $r0.12, $r0.4
;;
	c0	cmpne $b0.0 = $r0.9, 0
;;
;;
	c0	br $b0.0, LBB60_4
;;
## BB#2:                                ## %lor.lhs.false
	c0	cmpne $b0.0 = $r0.7, 2047
	c0	or $r0.9 = $r0.11, $r0.6
;;
;;
	c0	br $b0.0, LBB60_22
;;
## BB#3:                                ## %lor.lhs.false
	c0	cmpeq $b0.0 = $r0.9, 0
;;
;;
	c0	brf $b0.0, LBB60_4
;;
LBB60_22:                               ## %if.end
	c0	or $r0.2 = $r0.9, $r0.7
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB60_23
;;
	c0	goto LBB60_27
;;
LBB60_24:                               ## %if.end.19
	c0	cmpne $b0.0 = $r0.7, 2047
;;
;;
	c0	br $b0.0, LBB60_28
;;
## BB#25:                               ## %if.then.21
	c0	or $r0.7 = $r0.11, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB60_26
;;
LBB60_4:                                ## %if.then.11
	c0	and $r0.3 = $r0.2, 2146959360
;;
	c0	xor $r0.3 = $r0.3, 2146435072
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB60_5
;;
## BB#6:                                ## %land.rhs.i.61.i.207
	c0	cmpne $b0.0 = $r0.4, 0
;;
;;
	c0	brf $b0.0, LBB60_8
;;
## BB#7:
	c0	mov $r0.3 = -1
;;
	c0	mtb $b0.1 = $r0.3
	c0	goto LBB60_9
;;
LBB60_5:
	c0	mov $r0.3 = 0
;;
	c0	mtb $b0.1 = $r0.3
	c0	goto LBB60_9
;;
LBB60_28:                               ## %if.end.33
	c0	cmpne $b0.0 = $r0.9, 0
;;
;;
	c0	br $b0.0, LBB60_39
;;
## BB#29:                               ## %if.then.35
	c0	or $r0.9 = $r0.12, $r0.4
;;
	c0	cmpne $b0.0 = $r0.9, 0
;;
;;
	c0	brf $b0.0, LBB60_30
;;
## BB#31:                               ## %if.end.40
	c0	cmpne $b0.0 = $r0.12, 0
;;
;;
	c0	brf $b0.0, LBB60_32
;;
## BB#36:                               ## %if.else.7.i.167
	c0	cmpltu $b0.0 = $r0.12, 65536
	c0	mov $r0.9 = 16
	c0	mov $r0.13 = 8
	c0	mov $r0.14 = 22
	c0	mov $r0.15 = countLeadingZeros32.countLeadingZerosHigh
	c0	mov $r0.16 = 4
;;
	c0	shl $r0.2 = $r0.2, $r0.9
;;
	c0	mfb $r0.9 = $b0.0
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.12
;;
	c0	cmpltu $b0.0 = $r0.2, 16777216
	c0	shl $r0.13 = $r0.2, $r0.13
	c0	shl $r0.9 = $r0.9, $r0.16
;;
	c0	or $r0.16 = $r0.9, 8
;;
	c0	slct $r0.2 = $b0.0, $r0.13, $r0.2
	c0	slct $r0.9 = $b0.0, $r0.16, $r0.9
;;
	c0	shru $r0.2 = $r0.2, $r0.14
;;
	c0	and $r0.2 = $r0.2, 1020
;;
	c0	add $r0.2 = $r0.15, $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
;;
	c0	add $r0.2 = $r0.2, $r0.9
;;
	c0	add $r0.9 = $r0.2, -11
;;
	c0	cmpeq $b0.0 = $r0.9, 0
;;
;;
	c0	br $b0.0, LBB60_38
;;
## BB#37:                               ## %cond.false.i.i.173
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
LBB60_38:                               ## %shortShift64Left.exit.i.176
	c0	mov $r0.13 = 12
	c0	shl $r0.4 = $r0.4, $r0.9
;;
	c0	sub $r0.9 = $r0.13, $r0.2
	c0	goto LBB60_39
;;
LBB60_8:                                ## %lor.rhs.i.64.i.210
	c0	and $r0.3 = $r0.2, 524287
;;
	c0	cmpne $b0.1 = $r0.3, 0
;;
LBB60_9:                                ## %float64_is_signaling_nan.exit66.i.214
	c0	add $r0.3 = $r0.5, $r0.5
;;
	c0	cmpltu $b0.0 = $r0.3, -2097152
;;
;;
	c0	br $b0.0, LBB60_10
;;
## BB#11:                               ## %land.rhs.i.53.i.217
	c0	cmpne $b0.0 = $r0.6, 0
;;
;;
	c0	brf $b0.0, LBB60_13
;;
## BB#12:
	c0	mov $r0.3 = -1
;;
	c0	mtb $b0.0 = $r0.3
	c0	goto LBB60_14
;;
LBB60_10:
	c0	mov $r0.3 = 0
;;
	c0	mtb $b0.0 = $r0.3
	c0	goto LBB60_14
;;
LBB60_13:                               ## %lor.rhs.i.55.i.220
	c0	and $r0.3 = $r0.5, 1048575
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
LBB60_14:                               ## %float64_is_nan.exit.i.223
	c0	and $r0.3 = $r0.5, 2146959360
	c0	mov $r0.7 = 0
;;
	c0	xor $r0.3 = $r0.3, 2146435072
	c0	mtb $b0.2 = $r0.7
;;
	c0	cmpne $b0.3 = $r0.3, 0
;;
;;
	c0	br $b0.3, LBB60_19
;;
## BB#15:                               ## %land.rhs.i.i.226
	c0	cmpeq $b0.2 = $r0.6, 0
;;
;;
	c0	br $b0.2, LBB60_18
;;
## BB#16:                               ## %float64_is_signaling_nan.exit.thread.i.229
	c0	mov $r0.8 = -1
	c0	or $r0.2 = $r0.2, 524288
	c0	or $r0.3 = $r0.5, 524288
;;
	c0	mtb $b0.2 = $r0.8
	c0	goto LBB60_17
;;
LBB60_18:                               ## %lor.rhs.i.i.232
	c0	and $r0.3 = $r0.5, 524287
;;
	c0	cmpne $b0.2 = $r0.3, 0
;;
LBB60_19:                               ## %float64_is_signaling_nan.exit.i.236
	c0	mfb $r0.8 = $b0.2
	c0	mfb $r0.9 = $b0.1
	c0	or $r0.3 = $r0.5, 524288
	c0	or $r0.2 = $r0.2, 524288
;;
	c0	or $r0.5 = $r0.9, $r0.8
;;
	c0	and $r0.5 = $r0.5, 1
;;
	c0	cmpeq $b0.1 = $r0.5, 0
;;
;;
	c0	br $b0.1, LBB60_20
;;
LBB60_17:                               ## %if.then.i.240
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
	c0	goto LBB60_21
;;
LBB60_20:
	c0	mov $r0.5 = 0
;;
	c0	mtb $b0.1 = $r0.5
;;
;;
	c0	mfb $r0.11 = $b0.1
;;
	c0	mtb $b0.2 = $r0.11
;;
LBB60_21:                               ## %propagateFloat64NaN.exit255
	c0	slct $r0.5 = $b0.0, $r0.3, $r0.2
	c0	slct $r0.2 = $b0.2, $r0.3, $r0.2
	c0	slct $r0.3 = $b0.2, $r0.6, $r0.4
	c0	slct $r0.4 = $b0.0, $r0.6, $r0.4
;;
	c0	slct $r0.4 = $b0.1, $r0.3, $r0.4
	c0	slct $r0.3 = $b0.1, $r0.2, $r0.5
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	or $r0.4 = $r0.7, $r0.4
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB60_26:                               ## %if.end.26
	c0	or $r0.2 = $r0.12, $r0.4
;;
	c0	or $r0.2 = $r0.2, $r0.9
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB60_27
;;
LBB60_23:                               ## %if.end.17
	c0	shl $r0.2 = $r0.3, $r0.8
	c0	mov $r0.4 = 0
;;
	c0	or $r0.3 = $r0.2, 2146435072
	c0	mov $r0.7 = $r0.4
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	or $r0.4 = $r0.7, $r0.4
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB60_27:                               ## %invalid
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.5 = 0[$r0.2]
	c0	mov $r0.4 = -1
	c0	mov $r0.3 = 2147483647
	c0	mov $r0.7 = 0
;;
;;
	c0	or $r0.5 = $r0.5, 16
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	stw 0[$r0.2] = $r0.5
	c0	or $r0.4 = $r0.7, $r0.4
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB60_32:                               ## %if.then.i.140
	c0	mov $r0.2 = 16
	c0	cmpltu $b0.0 = $r0.4, 65536
	c0	mov $r0.9 = 8
	c0	mov $r0.12 = 22
	c0	mov $r0.13 = countLeadingZeros32.countLeadingZerosHigh
	c0	mov $r0.14 = 4
;;
	c0	shl $r0.2 = $r0.4, $r0.2
;;
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
	c0	br $b0.0, LBB60_34
;;
## BB#33:                               ## %if.then.2.i.145
	c0	mov $r0.12 = 11
	c0	and $r0.9 = $r0.9, 31
;;
	c0	sub $r0.12 = $r0.12, $r0.2
;;
	c0	shru $r0.12 = $r0.4, $r0.12
	c0	shl $r0.4 = $r0.4, $r0.9
	c0	goto LBB60_35
;;
LBB60_34:                               ## %if.else.i.147
	c0	mov $r0.13 = 0
	c0	shl $r0.12 = $r0.4, $r0.9
;;
	c0	mov $r0.4 = $r0.13
;;
LBB60_35:                               ## %if.end.i.150
	c0	mov $r0.9 = -20
;;
	c0	sub $r0.9 = $r0.9, $r0.2
;;
LBB60_39:                               ## %if.end.41
	c0	cmpne $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB60_49
;;
## BB#40:                               ## %if.then.43
	c0	or $r0.2 = $r0.11, $r0.6
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB60_30
;;
## BB#41:                               ## %if.end.48
	c0	cmpne $b0.0 = $r0.11, 0
;;
;;
	c0	brf $b0.0, LBB60_42
;;
## BB#46:                               ## %if.else.7.i
	c0	cmpltu $b0.0 = $r0.11, 65536
	c0	mov $r0.2 = 16
	c0	mov $r0.7 = 8
	c0	mov $r0.13 = 22
	c0	mov $r0.14 = countLeadingZeros32.countLeadingZerosHigh
	c0	mov $r0.15 = 4
;;
	c0	shl $r0.2 = $r0.5, $r0.2
;;
	c0	mfb $r0.5 = $b0.0
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.11
;;
	c0	cmpltu $b0.0 = $r0.2, 16777216
	c0	shl $r0.7 = $r0.2, $r0.7
	c0	shl $r0.5 = $r0.5, $r0.15
;;
	c0	or $r0.15 = $r0.5, 8
;;
	c0	slct $r0.2 = $b0.0, $r0.7, $r0.2
	c0	slct $r0.5 = $b0.0, $r0.15, $r0.5
;;
	c0	shru $r0.2 = $r0.2, $r0.13
;;
	c0	and $r0.2 = $r0.2, 1020
;;
	c0	add $r0.2 = $r0.14, $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
;;
	c0	add $r0.2 = $r0.2, $r0.5
;;
	c0	add $r0.5 = $r0.2, -11
;;
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB60_48
;;
## BB#47:                               ## %cond.false.i.i
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
LBB60_48:                               ## %shortShift64Left.exit.i
	c0	mov $r0.7 = 12
	c0	shl $r0.6 = $r0.6, $r0.5
;;
	c0	sub $r0.7 = $r0.7, $r0.2
	c0	goto LBB60_49
;;
LBB60_30:                               ## %if.then.38
	c0	mov $r0.4 = 0
	c0	shl $r0.3 = $r0.3, $r0.8
;;
	c0	mov $r0.7 = $r0.4
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	or $r0.4 = $r0.7, $r0.4
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB60_42:                               ## %if.then.i
	c0	mov $r0.2 = 16
	c0	cmpltu $b0.0 = $r0.6, 65536
	c0	mov $r0.5 = 8
	c0	mov $r0.7 = 22
	c0	mov $r0.11 = countLeadingZeros32.countLeadingZerosHigh
	c0	mov $r0.13 = 4
;;
	c0	shl $r0.2 = $r0.6, $r0.2
;;
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
	c0	br $b0.0, LBB60_44
;;
## BB#43:                               ## %if.then.2.i
	c0	mov $r0.7 = 11
	c0	and $r0.5 = $r0.5, 31
;;
	c0	sub $r0.7 = $r0.7, $r0.2
;;
	c0	shru $r0.11 = $r0.6, $r0.7
	c0	shl $r0.6 = $r0.6, $r0.5
	c0	goto LBB60_45
;;
LBB60_44:                               ## %if.else.i
	c0	mov $r0.7 = 0
	c0	shl $r0.11 = $r0.6, $r0.5
;;
	c0	mov $r0.6 = $r0.7
;;
LBB60_45:                               ## %if.end.i
	c0	mov $r0.5 = -20
;;
	c0	sub $r0.7 = $r0.5, $r0.2
;;
LBB60_49:                               ## %if.end.49
	c0	mov $r0.2 = 12
	c0	mov $r0.5 = 4
	c0	mov $r0.13 = 16
	c0	shru $r0.10 = $r0.6, $r0.10
	c0	zxth $r0.14 = $r0.4
	c0	or $r0.15 = $r0.12, 1048576
	c0	zxth $r0.12 = $r0.12
;;
	c0	shl $r0.16 = $r0.11, $r0.2
	c0	shru $r0.11 = $r0.11, $r0.5
	c0	shl $r0.2 = $r0.6, $r0.2
	c0	shru $r0.5 = $r0.6, $r0.5
	c0	shru $r0.6 = $r0.4, $r0.13
	c0	shru $r0.17 = $r0.15, $r0.13
;;
	c0	zxth $r0.5 = $r0.5
	c0	zxth $r0.2 = $r0.2
	c0	zxth $r0.11 = $r0.11
	c0	zxth $r0.16 = $r0.16
;;
	c0	or $r0.10 = $r0.10, $r0.16
	c0	mpylu $r0.16 = $r0.11, $r0.14
	c0	mpyhs $r0.18 = $r0.11, $r0.14
	c0	mpyhs $r0.19 = $r0.2, $r0.6
	c0	mpylu $r0.20 = $r0.2, $r0.6
;;
	c0	mpylu $r0.21 = $r0.10, $r0.6
	c0	mpyhs $r0.22 = $r0.10, $r0.6
	c0	mpyhs $r0.23 = $r0.5, $r0.14
	c0	mpylu $r0.24 = $r0.5, $r0.14
;;
	c0	mpylu $r0.25 = $r0.10, $r0.14
	c0	mpyhs $r0.26 = $r0.10, $r0.14
;;
	c0	add $r0.21 = $r0.21, $r0.22
	c0	add $r0.16 = $r0.16, $r0.18
	c0	add $r0.18 = $r0.20, $r0.19
	c0	mpyhs $r0.19 = $r0.10, $r0.17
	c0	mpylu $r0.20 = $r0.10, $r0.17
	c0	mpylu $r0.22 = $r0.11, $r0.12
	c0	add $r0.23 = $r0.24, $r0.23
;;
	c0	add $r0.16 = $r0.21, $r0.16
	c0	mpyhs $r0.24 = $r0.11, $r0.12
	c0	mpyhs $r0.27 = $r0.5, $r0.6
	c0	mpylu $r0.28 = $r0.5, $r0.6
	c0	add $r0.25 = $r0.25, $r0.26
	c0	mpylu $r0.26 = $r0.2, $r0.14
	c0	add $r0.18 = $r0.23, $r0.18
;;
	c0	mpyhs $r0.14 = $r0.2, $r0.14
	c0	shl $r0.29 = $r0.16, $r0.13
	c0	mpyhs $r0.30 = $r0.5, $r0.12
	c0	mpylu $r0.31 = $r0.5, $r0.12
;;
	c0	add $r0.22 = $r0.22, $r0.24
	c0	add $r0.19 = $r0.20, $r0.19
	c0	cmpltu $r0.20 = $r0.18, $r0.23
	c0	add $r0.23 = $r0.29, $r0.25
	c0	add $r0.24 = $r0.28, $r0.27
	c0	mpylu $r0.25 = $r0.2, $r0.17
	c0	mpyhs $r0.27 = $r0.2, $r0.17
	c0	shru $r0.28 = $r0.18, $r0.13
;;
	c0	mpylu $r0.32 = $r0.10, $r0.12
	c0	mpyhs $r0.10 = $r0.10, $r0.12
	c0	shl $r0.20 = $r0.20, $r0.13
	c0	add $r0.14 = $r0.26, $r0.14
	c0	shl $r0.18 = $r0.18, $r0.13
	c0	add $r0.22 = $r0.19, $r0.22
	c0	mpylu $r0.26 = $r0.11, $r0.6
	c0	mpyhs $r0.6 = $r0.11, $r0.6
;;
	c0	add $r0.24 = $r0.23, $r0.24
	c0	cmpltu $r0.21 = $r0.16, $r0.21
	c0	add $r0.14 = $r0.18, $r0.14
	c0	or $r0.20 = $r0.20, $r0.28
	c0	shl $r0.28 = $r0.22, $r0.13
;;
	c0	add $r0.10 = $r0.32, $r0.10
	c0	add $r0.25 = $r0.25, $r0.27
	c0	add $r0.27 = $r0.31, $r0.30
	c0	shl $r0.21 = $r0.21, $r0.13
	c0	shru $r0.16 = $r0.16, $r0.13
	c0	add $r0.20 = $r0.24, $r0.20
	c0	cmpltu $r0.18 = $r0.14, $r0.18
;;
	c0	add $r0.24 = $r0.27, $r0.25
	c0	add $r0.10 = $r0.28, $r0.10
	c0	add $r0.6 = $r0.26, $r0.6
	c0	mpyhs $r0.25 = $r0.2, $r0.12
	c0	mpylu $r0.2 = $r0.2, $r0.12
	c0	mpyhs $r0.12 = $r0.5, $r0.17
	c0	add $r0.18 = $r0.20, $r0.18
	c0	mpylu $r0.5 = $r0.5, $r0.17
;;
	c0	cmpltu $r0.20 = $r0.24, $r0.27
	c0	or $r0.16 = $r0.21, $r0.16
	c0	add $r0.6 = $r0.10, $r0.6
	c0	mpylu $r0.21 = $r0.11, $r0.17
	c0	shru $r0.26 = $r0.24, $r0.13
	c0	shl $r0.24 = $r0.24, $r0.13
;;
	c0	add $r0.2 = $r0.2, $r0.25
	c0	shl $r0.20 = $r0.20, $r0.13
	c0	add $r0.5 = $r0.5, $r0.12
;;
	c0	add $r0.2 = $r0.24, $r0.2
	c0	or $r0.12 = $r0.20, $r0.26
	c0	cmpltu $b0.0 = $r0.18, $r0.23
	c0	mpyhs $r0.11 = $r0.11, $r0.17
	c0	cmpne $b0.1 = $r0.14, 0
;;
	c0	cmpltu $r0.14 = $r0.2, $r0.24
	c0	cmpltu $r0.17 = $r0.23, $r0.29
	c0	add $r0.5 = $r0.12, $r0.5
	c0	add $r0.6 = $r0.6, $r0.16
	c0	add $r0.12 = $r0.18, $r0.2
;;
	c0	add $r0.5 = $r0.5, $r0.14
	c0	add $r0.6 = $r0.6, $r0.17
	c0	cmpltu $r0.14 = $r0.12, $r0.18
	c0	mfb $r0.16 = $b0.0
	c0	add $r0.2 = $r0.7, $r0.9
	c0	add $r0.7 = $r0.21, $r0.11
;;
	c0	add $r0.7 = $r0.7, $r0.15
	c0	cmpltu $r0.9 = $r0.22, $r0.19
	c0	shru $r0.11 = $r0.22, $r0.13
;;
	c0	shl $r0.9 = $r0.9, $r0.13
	c0	add $r0.5 = $r0.5, $r0.14
	c0	add $r0.6 = $r0.6, $r0.16
	c0	cmpltu $r0.13 = $r0.10, $r0.28
;;
	c0	or $r0.9 = $r0.9, $r0.11
	c0	mfb $r0.11 = $b0.1
;;
	c0	add $r0.7 = $r0.7, $r0.9
;;
	c0	add $r0.9 = $r0.7, $r0.13
	c0	or $r0.7 = $r0.12, $r0.11
	c0	cmpltu $b0.0 = $r0.6, $r0.10
	c0	add $r0.10 = $r0.5, $r0.6
;;
	c0	add $r0.6 = $r0.10, $r0.4
	c0	cmpltu $r0.4 = $r0.10, $r0.5
;;
	c0	mfb $r0.5 = $b0.0
	c0	cmpltu $r0.10 = $r0.6, $r0.10
;;
	c0	add $r0.5 = $r0.9, $r0.5
;;
	c0	add $r0.4 = $r0.5, $r0.4
;;
	c0	add $r0.5 = $r0.4, $r0.10
;;
	c0	cmpltu $b0.0 = $r0.5, 2097152
;;
;;
	c0	br $b0.0, LBB60_50
;;
## BB#51:                               ## %if.then.55
	c0	cmpne $b0.0 = $r0.7, 0
	c0	mov $r0.7 = 1
	c0	shl $r0.9 = $r0.6, $r0.8
	c0	shl $r0.8 = $r0.5, $r0.8
	c0	add $r0.4 = $r0.2, -1023
;;
	c0	shru $r0.2 = $r0.6, $r0.7
	c0	shru $r0.5 = $r0.5, $r0.7
;;
	c0	mfb $r0.7 = $b0.0
	c0	or $r0.6 = $r0.8, $r0.2
;;
	c0	or $r0.7 = $r0.9, $r0.7
	c0	goto LBB60_52
;;
LBB60_50:
	c0	add $r0.4 = $r0.2, -1024
;;
LBB60_52:                               ## %if.end.56
.call roundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = roundAndPackFloat64
;;
	c0	mov $r0.7 = 0
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	or $r0.4 = $r0.7, $r0.4
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
	c0	br $b0.0, LBB61_1
;;
## BB#2:                                ## %if.then
	c0	cmpeq $b0.0 = $r0.8, 1
;;
;;
	c0	brf $b0.0, LBB61_4
;;
## BB#3:
	c0	mov $r0.9 = 0
	c0	goto LBB61_8
;;
LBB61_1:
	c0	shru $r0.9 = $r0.7, $r0.2
	c0	goto LBB61_8
;;
LBB61_4:                                ## %if.else
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB61_6
;;
## BB#5:                                ## %if.then.7
	c0	cmpeq $b0.0 = $r0.8, 3
	c0	goto LBB61_7
;;
LBB61_6:                                ## %if.else.11
	c0	cmpeq $b0.0 = $r0.8, 2
;;
LBB61_7:                                ## %if.end.19
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
LBB61_8:                                ## %if.end.19
	c0	zxth $r0.10 = $r0.4
;;
	c0	cmpltu $b0.0 = $r0.10, 2045
;;
;;
	c0	br $b0.0, LBB61_40
;;
## BB#9:                                ## %if.then.24
	c0	cmpgt $b0.0 = $r0.4, 2045
;;
;;
	c0	br $b0.0, LBB61_14
;;
## BB#10:                               ## %lor.lhs.false
	c0	cmpne $b0.0 = $r0.4, 2045
;;
;;
	c0	br $b0.0, LBB61_21
;;
## BB#11:                               ## %land.lhs.true
	c0	cmpne $b0.0 = $r0.5, 2097151
	c0	mov $r0.4 = 2045
;;
;;
	c0	br $b0.0, LBB61_40
;;
## BB#12:                               ## %land.lhs.true
	c0	cmpne $b0.0 = $r0.6, -1
;;
;;
	c0	br $b0.0, LBB61_40
;;
## BB#13:                               ## %land.lhs.true
	c0	cmpeq $b0.0 = $r0.9, 0
;;
;;
	c0	br $b0.0, LBB61_40
;;
LBB61_14:                               ## %if.then.32
	c0	mov $r0.4 = float_exception_flags
;;
	c0	ldw $r0.5 = 0[$r0.4]
	c0	cmpeq $b0.0 = $r0.8, 1
;;
;;
	c0	or $r0.5 = $r0.5, 9
;;
	c0	stw 0[$r0.4] = $r0.5
	c0	br $b0.0, LBB61_19
;;
## BB#15:                               ## %lor.lhs.false.35
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB61_17
;;
## BB#16:                               ## %lor.lhs.false.35
	c0	cmpeq $b0.0 = $r0.8, 2
;;
;;
	c0	br $b0.0, LBB61_19
;;
LBB61_17:                               ## %lor.lhs.false.40
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB61_20
;;
## BB#18:                               ## %lor.lhs.false.40
	c0	cmpne $b0.0 = $r0.8, 3
;;
;;
	c0	br $b0.0, LBB61_20
;;
LBB61_19:                               ## %if.then.45
	c0	shl $r0.2 = $r0.3, $r0.2
	c0	mov $r0.6 = -1
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	or $r0.3 = $r0.2, 2146435071
	c0	mov $r0.4 = $r0.6
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB61_21:                               ## %if.end.49
	c0	cmpgt $b0.0 = $r0.4, -1
;;
;;
	c0	br $b0.0, LBB61_40
;;
## BB#22:                               ## %if.then.52
	c0	mov $r0.10 = -1
	c0	cmpltu $b0.1 = $r0.5, 2097151
;;
	c0	mtb $b0.0 = $r0.10
;;
	c0	br $b0.1, LBB61_25
;;
## BB#23:                               ## %if.then.52
	c0	mov $r0.10 = float_detect_tininess
	c0	cmplt $b0.1 = $r0.4, -1
	c0	cmpeq $b0.2 = $r0.9, 0
;;
	c0	ldw $r0.9 = 0[$r0.10]
;;
;;
	c0	cmpeq $b0.3 = $r0.9, 1
	c0	mfb $r0.9 = $b0.1
	c0	mfb $r0.10 = $b0.2
;;
;;
	c0	mfb $r0.11 = $b0.3
;;
	c0	or $r0.9 = $r0.9, $r0.11
;;
	c0	or $r0.9 = $r0.10, $r0.9
;;
	c0	mtb $b0.1 = $r0.9
;;
;;
	c0	br $b0.1, LBB61_25
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
LBB61_25:                               ## %if.else.i
	c0	mov $r0.10 = 0
	c0	cmplt $b0.1 = $r0.4, -31
	c0	and $r0.9 = $r0.4, 31
;;
	c0	sub $r0.11 = $r0.10, $r0.4
;;
	c0	br $b0.1, LBB61_27
;;
## BB#26:                               ## %if.then.2.i
	c0	shru $r0.4 = $r0.6, $r0.11
	c0	shl $r0.12 = $r0.5, $r0.9
	c0	shru $r0.10 = $r0.5, $r0.11
	c0	shl $r0.6 = $r0.6, $r0.9
;;
	c0	or $r0.11 = $r0.4, $r0.12
	c0	goto LBB61_32
;;
LBB61_20:                               ## %if.end.47
	c0	shl $r0.2 = $r0.3, $r0.2
	c0	mov $r0.6 = 0
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	or $r0.3 = $r0.2, 2146435072
	c0	mov $r0.4 = $r0.6
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB61_27:                               ## %if.else.5.i
	c0	cmpeq $b0.1 = $r0.11, 32
;;
;;
	c0	brf $b0.1, LBB61_29
;;
## BB#28:
	c0	mov $r0.11 = $r0.5
	c0	goto LBB61_32
;;
LBB61_29:                               ## %if.else.8.i
	c0	cmplt $b0.1 = $r0.4, -63
	c0	or $r0.7 = $r0.7, $r0.6
;;
;;
	c0	br $b0.1, LBB61_31
;;
## BB#30:                               ## %if.then.11.i
	c0	and $r0.4 = $r0.11, 31
	c0	shl $r0.6 = $r0.5, $r0.9
;;
	c0	shru $r0.11 = $r0.5, $r0.4
	c0	goto LBB61_32
;;
LBB61_31:                               ## %if.else.15.i
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
LBB61_32:                               ## %shift64ExtraRightJamming.exit
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
	c0	br $b0.0, LBB61_34
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
LBB61_34:                               ## %if.end.66
	c0	cmpne $b0.0 = $r0.8, 0
;;
;;
	c0	brf $b0.0, LBB61_35
;;
## BB#36:                               ## %if.else.71
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB61_38
;;
## BB#37:                               ## %if.then.73
	c0	cmpeq $b0.0 = $r0.8, 3
	c0	goto LBB61_39
;;
LBB61_35:                               ## %if.then.68
	c0	shru $r0.9 = $r0.6, $r0.2
	c0	mov $r0.5 = $r0.10
	c0	mov $r0.4 = 0
	c0	mov $r0.6 = $r0.11
	c0	goto LBB61_40
;;
LBB61_38:                               ## %if.else.80
	c0	cmpeq $b0.0 = $r0.8, 2
;;
LBB61_39:                               ## %if.end.90
	c0	mov $r0.5 = $r0.10
	c0	mov $r0.4 = 0
	c0	mov $r0.6 = $r0.11
	c0	mfb $r0.10 = $b0.0
;;
	c0	and $r0.9 = $r0.10, $r0.9
;;
	c0	and $r0.9 = $r0.9, 1
;;
LBB61_40:                               ## %if.end.90
	c0	cmpeq $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB61_42
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
LBB61_42:                               ## %if.end.93
	c0	cmpeq $b0.0 = $r0.9, 0
;;
;;
	c0	br $b0.0, LBB61_44
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
	c0	goto LBB61_45
;;
LBB61_44:                               ## %if.else.99
	c0	or $r0.7 = $r0.6, $r0.5
	c0	mov $r0.8 = 0
;;
	c0	cmpeq $b0.0 = $r0.7, 0
;;
;;
	c0	slct $r0.4 = $b0.0, $r0.8, $r0.4
;;
LBB61_45:                               ## %if.end.105
	c0	shl $r0.2 = $r0.3, $r0.2
	c0	mov $r0.3 = 20
;;
	c0	shl $r0.3 = $r0.4, $r0.3
	c0	add $r0.2 = $r0.5, $r0.2
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	add $r0.3 = $r0.2, $r0.3
	c0	mov $r0.4 = $r0.6
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
	c0	stw 28[$r0.1] = $r0.57
	c0	mov $r0.2 = 20
	c0	mov $r0.7 = $r0.3
	c0	mov $r0.10 = 31
;;
	c0	xor $r0.3 = $r0.5, $r0.7
	c0	shru $r0.8 = $r0.7, $r0.2
	c0	shru $r0.11 = $r0.5, $r0.2
;;
	c0	and $r0.9 = $r0.8, 2047
;;
	c0	cmpne $b0.0 = $r0.9, 2047
	c0	mov $r0.2 = $r0.4
	c0	and $r0.8 = $r0.7, 1048575
	c0	and $r0.4 = $r0.5, 1048575
	c0	shru $r0.3 = $r0.3, $r0.10
;;
	c0	and $r0.11 = $r0.11, 2047
;;
	c0	br $b0.0, LBB62_23
;;
## BB#1:                                ## %if.then
	c0	or $r0.8 = $r0.8, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.8, 0
;;
;;
	c0	brf $b0.0, LBB62_2
;;
## BB#20:                               ## %if.end
	c0	cmpne $b0.0 = $r0.11, 2047
;;
;;
	c0	br $b0.0, LBB62_22
;;
## BB#21:                               ## %if.then.11
	c0	or $r0.3 = $r0.4, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	brf $b0.0, LBB62_2
;;
	c0	goto LBB62_28
;;
LBB62_23:                               ## %if.end.19
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	brf $b0.0, LBB62_24
;;
## BB#26:                               ## %if.then.30
	c0	or $r0.11 = $r0.4, $r0.6
;;
	c0	cmpne $b0.0 = $r0.11, 0
;;
;;
	c0	brf $b0.0, LBB62_27
;;
## BB#30:                               ## %if.end.40
	c0	cmpne $b0.0 = $r0.4, 0
;;
;;
	c0	brf $b0.0, LBB62_31
;;
## BB#35:                               ## %if.else.7.i.346
	c0	cmpltu $b0.0 = $r0.4, 65536
	c0	mov $r0.11 = 16
	c0	mov $r0.12 = 8
	c0	mov $r0.13 = 22
	c0	mov $r0.14 = countLeadingZeros32.countLeadingZerosHigh
	c0	mov $r0.15 = 4
;;
	c0	shl $r0.5 = $r0.5, $r0.11
;;
	c0	mfb $r0.11 = $b0.0
	c0	slct $r0.5 = $b0.0, $r0.5, $r0.4
;;
	c0	cmpltu $b0.0 = $r0.5, 16777216
	c0	shl $r0.12 = $r0.5, $r0.12
	c0	shl $r0.11 = $r0.11, $r0.15
;;
	c0	or $r0.15 = $r0.11, 8
;;
	c0	slct $r0.5 = $b0.0, $r0.12, $r0.5
	c0	slct $r0.11 = $b0.0, $r0.15, $r0.11
;;
	c0	shru $r0.5 = $r0.5, $r0.13
;;
	c0	and $r0.5 = $r0.5, 1020
;;
	c0	add $r0.5 = $r0.14, $r0.5
;;
	c0	ldw $r0.5 = 0[$r0.5]
;;
;;
	c0	add $r0.5 = $r0.5, $r0.11
;;
	c0	add $r0.11 = $r0.5, -11
;;
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB62_37
;;
## BB#36:                               ## %cond.false.i.i.352
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
LBB62_37:                               ## %shortShift64Left.exit.i.355
	c0	mov $r0.12 = 12
	c0	shl $r0.6 = $r0.6, $r0.11
;;
	c0	sub $r0.11 = $r0.12, $r0.5
	c0	goto LBB62_38
;;
LBB62_24:                               ## %if.end.19
	c0	cmpne $b0.0 = $r0.11, 2047
;;
;;
	c0	br $b0.0, LBB62_38
;;
## BB#25:                               ## %if.then.21
	c0	or $r0.4 = $r0.4, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB62_40
;;
LBB62_2:                                ## %if.then.8
	c0	and $r0.3 = $r0.7, 2146959360
;;
	c0	xor $r0.3 = $r0.3, 2146435072
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB62_3
;;
## BB#4:                                ## %land.rhs.i.61.i.444
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB62_6
;;
## BB#5:
	c0	mov $r0.3 = -1
;;
	c0	mtb $b0.1 = $r0.3
	c0	goto LBB62_7
;;
LBB62_3:
	c0	mov $r0.3 = 0
;;
	c0	mtb $b0.1 = $r0.3
	c0	goto LBB62_7
;;
LBB62_22:                               ## %if.end.17
	c0	shl $r0.2 = $r0.3, $r0.10
	c0	mov $r0.4 = 0
;;
	c0	or $r0.3 = $r0.2, 2146435072
	c0	mov $r0.57 = $r0.4
	c0	goto LBB62_82
;;
LBB62_27:                               ## %if.then.33
	c0	or $r0.2 = $r0.8, $r0.2
;;
	c0	or $r0.2 = $r0.2, $r0.9
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB62_28
;;
## BB#29:                               ## %if.end.38
	c0	mov $r0.2 = float_exception_flags
	c0	mov $r0.4 = 0
;;
	c0	ldw $r0.5 = 0[$r0.2]
	c0	shl $r0.3 = $r0.3, $r0.10
;;
	c0	or $r0.3 = $r0.3, 2146435072
	c0	mov $r0.57 = $r0.4
;;
	c0	or $r0.5 = $r0.5, 2
;;
	c0	stw 0[$r0.2] = $r0.5
	c0	goto LBB62_82
;;
LBB62_6:                                ## %lor.rhs.i.64.i.447
	c0	and $r0.3 = $r0.7, 524287
;;
	c0	cmpne $b0.1 = $r0.3, 0
;;
LBB62_7:                                ## %float64_is_signaling_nan.exit66.i.451
	c0	add $r0.3 = $r0.5, $r0.5
;;
	c0	cmpltu $b0.0 = $r0.3, -2097152
;;
;;
	c0	br $b0.0, LBB62_8
;;
## BB#9:                                ## %land.rhs.i.53.i.454
	c0	cmpne $b0.0 = $r0.6, 0
;;
;;
	c0	brf $b0.0, LBB62_11
;;
## BB#10:
	c0	mov $r0.3 = -1
;;
	c0	mtb $b0.0 = $r0.3
	c0	goto LBB62_12
;;
LBB62_8:
	c0	mov $r0.3 = 0
;;
	c0	mtb $b0.0 = $r0.3
	c0	goto LBB62_12
;;
LBB62_11:                               ## %lor.rhs.i.55.i.457
	c0	and $r0.3 = $r0.5, 1048575
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
LBB62_12:                               ## %float64_is_nan.exit.i.460
	c0	and $r0.3 = $r0.5, 2146959360
	c0	mov $r0.57 = 0
;;
	c0	xor $r0.3 = $r0.3, 2146435072
	c0	mtb $b0.2 = $r0.57
;;
	c0	cmpne $b0.3 = $r0.3, 0
;;
;;
	c0	br $b0.3, LBB62_17
;;
## BB#13:                               ## %land.rhs.i.i.463
	c0	cmpeq $b0.2 = $r0.6, 0
;;
;;
	c0	br $b0.2, LBB62_16
;;
## BB#14:                               ## %float64_is_signaling_nan.exit.thread.i.466
	c0	mov $r0.8 = -1
	c0	or $r0.4 = $r0.7, 524288
	c0	or $r0.3 = $r0.5, 524288
;;
	c0	mtb $b0.2 = $r0.8
	c0	goto LBB62_15
;;
LBB62_16:                               ## %lor.rhs.i.i.469
	c0	and $r0.3 = $r0.5, 524287
;;
	c0	cmpne $b0.2 = $r0.3, 0
;;
LBB62_17:                               ## %float64_is_signaling_nan.exit.i.473
	c0	mfb $r0.8 = $b0.2
	c0	mfb $r0.9 = $b0.1
	c0	or $r0.3 = $r0.5, 524288
	c0	or $r0.4 = $r0.7, 524288
;;
	c0	or $r0.5 = $r0.9, $r0.8
;;
	c0	and $r0.5 = $r0.5, 1
;;
	c0	cmpeq $b0.1 = $r0.5, 0
;;
;;
	c0	br $b0.1, LBB62_18
;;
LBB62_15:                               ## %if.then.i.477
	c0	mov $r0.5 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.5]
	c0	mov $r0.8 = -1
;;
	c0	mtb $b0.1 = $r0.8
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.5] = $r0.7
	c0	goto LBB62_19
;;
LBB62_18:
	c0	mov $r0.5 = 0
;;
	c0	mtb $b0.1 = $r0.5
;;
;;
	c0	mfb $r0.11 = $b0.1
;;
	c0	mtb $b0.2 = $r0.11
;;
LBB62_19:                               ## %propagateFloat64NaN.exit492
	c0	slct $r0.5 = $b0.0, $r0.3, $r0.4
	c0	slct $r0.3 = $b0.2, $r0.3, $r0.4
	c0	slct $r0.4 = $b0.2, $r0.6, $r0.2
	c0	slct $r0.2 = $b0.0, $r0.6, $r0.2
;;
	c0	slct $r0.4 = $b0.1, $r0.4, $r0.2
	c0	slct $r0.3 = $b0.1, $r0.3, $r0.5
	c0	goto LBB62_82
;;
LBB62_28:                               ## %invalid
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.5 = 0[$r0.2]
	c0	mov $r0.4 = -1
	c0	mov $r0.3 = 2147483647
	c0	mov $r0.57 = 0
;;
;;
	c0	or $r0.5 = $r0.5, 16
;;
	c0	stw 0[$r0.2] = $r0.5
	c0	goto LBB62_82
;;
LBB62_31:                               ## %if.then.i.319
	c0	mov $r0.4 = 16
	c0	cmpltu $b0.0 = $r0.6, 65536
	c0	mov $r0.5 = 8
	c0	mov $r0.11 = 22
	c0	mov $r0.12 = countLeadingZeros32.countLeadingZerosHigh
	c0	mov $r0.13 = 4
;;
	c0	shl $r0.4 = $r0.6, $r0.4
;;
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
	c0	br $b0.0, LBB62_33
;;
## BB#32:                               ## %if.then.2.i.324
	c0	mov $r0.11 = 11
	c0	and $r0.12 = $r0.4, 31
;;
	c0	sub $r0.4 = $r0.11, $r0.5
;;
	c0	shru $r0.4 = $r0.6, $r0.4
	c0	shl $r0.6 = $r0.6, $r0.12
	c0	goto LBB62_34
;;
LBB62_33:                               ## %if.else.i.326
	c0	mov $r0.11 = 0
	c0	shl $r0.4 = $r0.6, $r0.4
;;
	c0	mov $r0.6 = $r0.11
;;
LBB62_34:                               ## %if.end.i.329
	c0	mov $r0.11 = -20
;;
	c0	sub $r0.11 = $r0.11, $r0.5
;;
LBB62_38:                               ## %if.end.41
	c0	cmpne $b0.0 = $r0.9, 0
;;
;;
	c0	br $b0.0, LBB62_49
;;
## BB#39:                               ## %if.then.43
	c0	or $r0.5 = $r0.8, $r0.2
;;
	c0	cmpne $b0.0 = $r0.5, 0
;;
;;
	c0	brf $b0.0, LBB62_40
;;
## BB#41:                               ## %if.end.48
	c0	cmpne $b0.0 = $r0.8, 0
;;
;;
	c0	brf $b0.0, LBB62_42
;;
## BB#46:                               ## %if.else.7.i
	c0	cmpltu $b0.0 = $r0.8, 65536
	c0	mov $r0.5 = 16
	c0	mov $r0.9 = 8
	c0	mov $r0.12 = 22
	c0	mov $r0.13 = countLeadingZeros32.countLeadingZerosHigh
	c0	mov $r0.14 = 4
;;
	c0	shl $r0.5 = $r0.7, $r0.5
;;
	c0	mfb $r0.7 = $b0.0
	c0	slct $r0.5 = $b0.0, $r0.5, $r0.8
;;
	c0	cmpltu $b0.0 = $r0.5, 16777216
	c0	shl $r0.9 = $r0.5, $r0.9
	c0	shl $r0.7 = $r0.7, $r0.14
;;
	c0	or $r0.14 = $r0.7, 8
;;
	c0	slct $r0.5 = $b0.0, $r0.9, $r0.5
	c0	slct $r0.7 = $b0.0, $r0.14, $r0.7
;;
	c0	shru $r0.5 = $r0.5, $r0.12
;;
	c0	and $r0.5 = $r0.5, 1020
;;
	c0	add $r0.5 = $r0.13, $r0.5
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
	c0	br $b0.0, LBB62_48
;;
## BB#47:                               ## %cond.false.i.i
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
LBB62_48:                               ## %shortShift64Left.exit.i
	c0	mov $r0.9 = 12
	c0	shl $r0.2 = $r0.2, $r0.7
;;
	c0	sub $r0.9 = $r0.9, $r0.5
	c0	goto LBB62_49
;;
LBB62_40:                               ## %if.end.26
	c0	mov $r0.4 = 0
	c0	shl $r0.3 = $r0.3, $r0.10
;;
	c0	mov $r0.57 = $r0.4
	c0	goto LBB62_82
;;
LBB62_42:                               ## %if.then.i
	c0	mov $r0.5 = 16
	c0	cmpltu $b0.0 = $r0.2, 65536
	c0	mov $r0.7 = 8
	c0	mov $r0.8 = 22
	c0	mov $r0.9 = countLeadingZeros32.countLeadingZerosHigh
	c0	mov $r0.12 = 4
;;
	c0	shl $r0.5 = $r0.2, $r0.5
;;
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
	c0	br $b0.0, LBB62_44
;;
## BB#43:                               ## %if.then.2.i
	c0	mov $r0.8 = 11
	c0	and $r0.7 = $r0.7, 31
;;
	c0	sub $r0.8 = $r0.8, $r0.5
;;
	c0	shru $r0.8 = $r0.2, $r0.8
	c0	shl $r0.2 = $r0.2, $r0.7
	c0	goto LBB62_45
;;
LBB62_44:                               ## %if.else.i
	c0	mov $r0.9 = 0
	c0	shl $r0.8 = $r0.2, $r0.7
;;
	c0	mov $r0.2 = $r0.9
;;
LBB62_45:                               ## %if.end.i.299
	c0	mov $r0.7 = -20
;;
	c0	sub $r0.9 = $r0.7, $r0.5
;;
LBB62_49:                               ## %if.end.49
	c0	mov $r0.5 = 11
	c0	mov $r0.7 = 21
;;
	c0	shl $r0.4 = $r0.4, $r0.5
	c0	shru $r0.12 = $r0.2, $r0.7
	c0	shl $r0.14 = $r0.8, $r0.5
	c0	shru $r0.15 = $r0.6, $r0.7
	c0	sub $r0.13 = $r0.9, $r0.11
	c0	shl $r0.8 = $r0.6, $r0.5
;;
	c0	or $r0.11 = $r0.4, -2147483648
	c0	or $r0.4 = $r0.12, $r0.14
;;
	c0	or $r0.14 = $r0.4, -2147483648
	c0	or $r0.9 = $r0.15, $r0.11
;;
	c0	cmpltu $b0.0 = $r0.9, $r0.14
;;
;;
	c0	br $b0.0, LBB62_52
;;
## BB#50:                               ## %lor.rhs.i
	c0	shl $r0.15 = $r0.2, $r0.5
	c0	add $r0.4 = $r0.13, 1021
;;
	c0	cmpgtu $b0.0 = $r0.8, $r0.15
;;
;;
	c0	br $b0.0, LBB62_53
;;
## BB#51:                               ## %lor.rhs.i
	c0	cmpne $b0.0 = $r0.9, $r0.14
;;
;;
	c0	br $b0.0, LBB62_53
;;
LBB62_52:                               ## %if.then.54
	c0	mov $r0.15 = 10
	c0	mov $r0.16 = 1
	c0	shl $r0.10 = $r0.12, $r0.10
	c0	add $r0.4 = $r0.13, 1022
;;
	c0	shl $r0.2 = $r0.2, $r0.15
	c0	shru $r0.14 = $r0.14, $r0.16
;;
	c0	and $r0.2 = $r0.2, 2147482624
;;
	c0	or $r0.15 = $r0.10, $r0.2
;;
LBB62_53:                               ## %if.end.55
	c0	mov $r0.2 = 16
	c0	cmpgtu $b0.0 = $r0.9, $r0.14
;;
	c0	shru $r0.10 = $r0.11, $r0.2
;;
	c0	brf $b0.0, LBB62_54
;;
## BB#55:                               ## %if.end.i.223
	c0	shl $r0.13 = $r0.10, $r0.2
;;
	c0	cmpleu $b0.0 = $r0.13, $r0.14
;;
;;
	c0	br $b0.0, LBB62_56
;;
## BB#57:                               ## %cond.false.i.226
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
	c0	goto LBB62_58
;;
LBB62_54:                               ## %if.end.55.estimateDiv64To32.exit269_crit_edge
	c0	zxth $r0.11 = $r0.9
	c0	mov $r0.12 = -1
	c0	goto LBB62_65
;;
LBB62_56:
	c0	mov $r0.12 = -65536
;;
LBB62_58:                               ## %cond.end.i.241
	c0	shru $r0.16 = $r0.12, $r0.2
	c0	zxth $r0.11 = $r0.9
	c0	mov $r0.17 = -1
;;
	c0	mpylu $r0.18 = $r0.16, $r0.10
	c0	mpyhs $r0.19 = $r0.16, $r0.11
	c0	mpylu $r0.20 = $r0.16, $r0.11
	c0	mpyhs $r0.16 = $r0.16, $r0.10
;;
;;
	c0	add $r0.19 = $r0.20, $r0.19
	c0	add $r0.16 = $r0.18, $r0.16
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
	c0	br $b0.0, LBB62_61
;;
## BB#59:                               ## %while.body.lr.ph.i.243
	c0	shl $r0.18 = $r0.9, $r0.2
;;
LBB62_60:                               ## %while.body.i.254
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
	c0	br $b0.0, LBB62_60
;;
LBB62_61:                               ## %while.end.i.262
	c0	shl $r0.17 = $r0.17, $r0.2
	c0	shru $r0.16 = $r0.16, $r0.2
;;
	c0	or $r0.16 = $r0.16, $r0.17
;;
	c0	cmpleu $b0.0 = $r0.13, $r0.16
;;
;;
	c0	br $b0.0, LBB62_62
;;
## BB#63:                               ## %cond.false.10.i.264
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
	c0	goto LBB62_64
;;
LBB62_62:
	c0	mov $r0.13 = 65535
;;
LBB62_64:                               ## %cond.end.12.i.267
	c0	or $r0.12 = $r0.13, $r0.12
;;
LBB62_65:                               ## %estimateDiv64To32.exit269
	c0	mov $r0.17 = 5
	c0	shru $r0.18 = $r0.12, $r0.2
	c0	zxth $r0.19 = $r0.12
	c0	and $r0.13 = $r0.8, 63488
	c0	mov $r0.16 = -1
;;
	c0	shru $r0.6 = $r0.6, $r0.17
	c0	mpyhs $r0.17 = $r0.19, $r0.10
	c0	mpylu $r0.20 = $r0.19, $r0.10
	c0	mpylu $r0.21 = $r0.18, $r0.11
	c0	mpyhs $r0.22 = $r0.18, $r0.11
;;
	c0	zxth $r0.6 = $r0.6
	c0	mpylu $r0.23 = $r0.18, $r0.13
	c0	mpyhs $r0.24 = $r0.18, $r0.13
	c0	mpylu $r0.25 = $r0.19, $r0.11
	c0	mpyhs $r0.26 = $r0.19, $r0.11
;;
	c0	mpylu $r0.27 = $r0.19, $r0.13
	c0	add $r0.17 = $r0.20, $r0.17
	c0	add $r0.20 = $r0.21, $r0.22
	c0	mpyhs $r0.21 = $r0.19, $r0.13
	c0	mpylu $r0.22 = $r0.18, $r0.10
	c0	mpyhs $r0.28 = $r0.19, $r0.6
;;
	c0	mpylu $r0.19 = $r0.19, $r0.6
	c0	add $r0.23 = $r0.23, $r0.24
	c0	add $r0.17 = $r0.20, $r0.17
	c0	mpylu $r0.24 = $r0.18, $r0.6
	c0	mpyhs $r0.29 = $r0.18, $r0.6
	c0	add $r0.25 = $r0.25, $r0.26
;;
	c0	add $r0.21 = $r0.27, $r0.21
	c0	shl $r0.26 = $r0.17, $r0.2
;;
	c0	add $r0.19 = $r0.19, $r0.28
	c0	add $r0.25 = $r0.26, $r0.25
	c0	add $r0.24 = $r0.24, $r0.29
;;
	c0	add $r0.19 = $r0.23, $r0.19
	c0	add $r0.24 = $r0.25, $r0.24
;;
	c0	cmpltu $r0.23 = $r0.19, $r0.23
	c0	shl $r0.27 = $r0.19, $r0.2
	c0	shru $r0.19 = $r0.19, $r0.2
;;
	c0	shl $r0.23 = $r0.23, $r0.2
	c0	add $r0.21 = $r0.27, $r0.21
;;
	c0	or $r0.19 = $r0.23, $r0.19
	c0	mpyhs $r0.18 = $r0.18, $r0.10
	c0	cmpltu $r0.23 = $r0.25, $r0.26
;;
	c0	mtb $b0.0 = $r0.23
	c0	cmpne $b0.1 = $r0.21, 0
	c0	cmpltu $r0.23 = $r0.21, $r0.27
	c0	add $r0.19 = $r0.24, $r0.19
	c0	mov $r0.57 = 0
;;
	c0	add $r0.18 = $r0.22, $r0.18
;;
	c0	sub $r0.14 = $r0.14, $r0.18
	c0	add $r0.18 = $r0.19, $r0.23
	c0	cmpltu $r0.19 = $r0.17, $r0.20
	c0	shru $r0.17 = $r0.17, $r0.2
;;
	c0	shl $r0.19 = $r0.19, $r0.2
;;
	c0	or $r0.17 = $r0.19, $r0.17
;;
	c0	sub $r0.17 = $r0.14, $r0.17
	c0	sub $r0.14 = $r0.57, $r0.21
	c0	mfb $r0.19 = $b0.1
	c0	sub $r0.20 = $r0.15, $r0.18
	c0	mfb $r0.21 = $b0.0
;;
	c0	add $r0.17 = $r0.17, $r0.21
	c0	cmpltu $r0.21 = $r0.18, $r0.25
	c0	cmpltu $r0.18 = $r0.15, $r0.18
	c0	cmpltu $r0.22 = $r0.20, $r0.19
	c0	sub $r0.15 = $r0.20, $r0.19
;;
	c0	mtb $b0.0 = $r0.18
	c0	mtb $b0.1 = $r0.21
	c0	mtb $b0.2 = $r0.22
;;
;;
	c0	slct $r0.18 = $b0.1, $r0.16, 0
	c0	slct $r0.19 = $b0.0, $r0.16, 0
	c0	slct $r0.20 = $b0.2, $r0.16, 0
;;
	c0	add $r0.17 = $r0.17, $r0.18
;;
	c0	add $r0.17 = $r0.17, $r0.19
;;
	c0	add $r0.17 = $r0.17, $r0.20
;;
	c0	cmpgt $b0.0 = $r0.17, -1
;;
;;
	c0	br $b0.0, LBB62_67
;;
LBB62_66:                               ## %while.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.14 = $r0.8, $r0.14
	c0	add $r0.18 = $r0.15, $r0.9
;;
	c0	cmpltu $r0.19 = $r0.14, $r0.8
	c0	cmpltu $r0.15 = $r0.18, $r0.15
	c0	add $r0.12 = $r0.12, -1
;;
	c0	add $r0.17 = $r0.15, $r0.17
	c0	add $r0.15 = $r0.19, $r0.18
;;
	c0	cmpltu $r0.18 = $r0.15, $r0.19
;;
	c0	add $r0.17 = $r0.17, $r0.18
;;
	c0	cmplt $b0.0 = $r0.17, 0
;;
;;
	c0	br $b0.0, LBB62_66
;;
LBB62_67:                               ## %while.end
	c0	cmpleu $b0.0 = $r0.9, $r0.15
;;
;;
	c0	br $b0.0, LBB62_81
;;
## BB#68:                               ## %if.end.i
	c0	shl $r0.18 = $r0.10, $r0.2
;;
	c0	cmpleu $b0.0 = $r0.18, $r0.15
;;
;;
	c0	br $b0.0, LBB62_69
;;
## BB#70:                               ## %cond.false.i
	c0	cmplt $r0.16 = $r0.10, $r0.0
	c0	mov $r0.17 = 0
;;
	c0	shru $r0.19 = $r0.15, $r0.16
	c0	mtb $b0.0 = $r0.17
	c0	shru $r0.20 = $r0.10, $r0.16
	c0	mtb $b0.1 = $r0.17
;;
;;
	c0	addcg $r0.17, $b0.0 = $r0.19, $r0.19, $b0.0
;;
	c0	divs $r0.19, $b0.0 = $r0.0, $r0.20, $b0.0
	c0	addcg $r0.21, $b0.1 = $r0.17, $r0.17, $b0.1
;;
	c0	addcg $r0.17, $b0.0 = $r0.21, $r0.21, $b0.0
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.20, $b0.1
;;
	c0	addcg $r0.21, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.19, $r0.20, $b0.0
;;
	c0	addcg $r0.19, $b0.0 = $r0.21, $r0.21, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.20, $b0.1
;;
	c0	addcg $r0.21, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.20, $b0.0
;;
	c0	addcg $r0.19, $b0.0 = $r0.21, $r0.21, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.20, $b0.1
;;
	c0	addcg $r0.21, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.20, $b0.0
;;
	c0	addcg $r0.19, $b0.0 = $r0.21, $r0.21, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.20, $b0.1
;;
	c0	addcg $r0.21, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.20, $b0.0
;;
	c0	addcg $r0.19, $b0.0 = $r0.21, $r0.21, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.20, $b0.1
;;
	c0	addcg $r0.21, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.20, $b0.0
;;
	c0	addcg $r0.19, $b0.0 = $r0.21, $r0.21, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.20, $b0.1
;;
	c0	addcg $r0.21, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.20, $b0.0
;;
	c0	addcg $r0.19, $b0.0 = $r0.21, $r0.21, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.20, $b0.1
;;
	c0	addcg $r0.21, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.20, $b0.0
;;
	c0	addcg $r0.19, $b0.0 = $r0.21, $r0.21, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.20, $b0.1
;;
	c0	addcg $r0.21, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.20, $b0.0
;;
	c0	addcg $r0.19, $b0.0 = $r0.21, $r0.21, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.20, $b0.1
;;
	c0	addcg $r0.21, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.20, $b0.0
;;
	c0	addcg $r0.19, $b0.0 = $r0.21, $r0.21, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.20, $b0.1
;;
	c0	addcg $r0.21, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.20, $b0.0
;;
	c0	addcg $r0.19, $b0.0 = $r0.21, $r0.21, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.20, $b0.1
;;
	c0	addcg $r0.21, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.17, $r0.20, $b0.0
;;
	c0	addcg $r0.19, $b0.2 = $r0.21, $r0.21, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.20, $b0.1
	c0	mtb $b0.0 = $r0.16
;;
	c0	addcg $r0.16, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.17, $b0.2 = $r0.17, $r0.20, $b0.2
;;
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.20, $b0.1
	c0	addcg $r0.19, $b0.2 = $r0.16, $r0.16, $b0.2
;;
	c0	addcg $r0.16, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.17, $b0.2 = $r0.17, $r0.20, $b0.2
;;
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.20, $b0.1
	c0	addcg $r0.19, $b0.2 = $r0.16, $r0.16, $b0.2
;;
	c0	addcg $r0.16, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.17, $b0.2 = $r0.17, $r0.20, $b0.2
;;
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.20, $b0.1
	c0	addcg $r0.19, $b0.2 = $r0.16, $r0.16, $b0.2
;;
	c0	addcg $r0.16, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.17, $b0.2 = $r0.17, $r0.20, $b0.2
	c0	cmpgeu $r0.19 = $r0.15, $r0.10
;;
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.20, $b0.1
	c0	addcg $r0.20, $b0.2 = $r0.16, $r0.16, $b0.2
;;
	c0	cmpge $b0.2 = $r0.17, $r0.0
	c0	addcg $r0.16, $b0.1 = $r0.20, $r0.20, $b0.1
;;
	c0	orc $r0.16 = $r0.16, $r0.0
;;
	c0	mfb $r0.17 = $b0.2
;;
	c0	sh1add $r0.16 = $r0.16, $r0.17
;;
	c0	slct $r0.16 = $b0.0, $r0.19, $r0.16
;;
	c0	shl $r0.16 = $r0.16, $r0.2
	c0	goto LBB62_71
;;
LBB62_69:
	c0	mov $r0.16 = -65536
;;
LBB62_71:                               ## %cond.end.i
	c0	shru $r0.19 = $r0.16, $r0.2
	c0	mov $r0.17 = -1
;;
	c0	mpyhs $r0.20 = $r0.19, $r0.11
	c0	mpylu $r0.21 = $r0.19, $r0.11
	c0	mpyhs $r0.22 = $r0.19, $r0.10
	c0	mpylu $r0.19 = $r0.19, $r0.10
;;
;;
	c0	add $r0.20 = $r0.21, $r0.20
	c0	add $r0.19 = $r0.19, $r0.22
;;
	c0	shl $r0.21 = $r0.20, $r0.2
	c0	shru $r0.20 = $r0.20, $r0.2
	c0	sub $r0.22 = $r0.15, $r0.19
;;
	c0	cmpltu $r0.23 = $r0.14, $r0.21
	c0	sub $r0.19 = $r0.14, $r0.21
	c0	sub $r0.20 = $r0.22, $r0.20
;;
	c0	mtb $b0.0 = $r0.23
;;
;;
	c0	slct $r0.21 = $b0.0, $r0.17, 0
;;
	c0	add $r0.20 = $r0.20, $r0.21
;;
	c0	cmpgt $b0.0 = $r0.20, -1
;;
;;
	c0	br $b0.0, LBB62_74
;;
## BB#72:                               ## %while.body.lr.ph.i
	c0	shl $r0.21 = $r0.9, $r0.2
;;
LBB62_73:                               ## %while.body.i
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.19 = $r0.19, $r0.21
	c0	add $r0.20 = $r0.20, $r0.10
	c0	add $r0.16 = $r0.16, -65536
;;
	c0	cmpltu $r0.22 = $r0.19, $r0.21
;;
	c0	add $r0.20 = $r0.20, $r0.22
;;
	c0	cmplt $b0.0 = $r0.20, 0
;;
;;
	c0	br $b0.0, LBB62_73
;;
LBB62_74:                               ## %while.end.i
	c0	shl $r0.20 = $r0.20, $r0.2
	c0	shru $r0.19 = $r0.19, $r0.2
;;
	c0	or $r0.19 = $r0.19, $r0.20
;;
	c0	cmpleu $b0.0 = $r0.18, $r0.19
;;
;;
	c0	br $b0.0, LBB62_75
;;
## BB#76:                               ## %cond.false.10.i
	c0	cmplt $r0.18 = $r0.10, $r0.0
	c0	mov $r0.20 = 0
;;
	c0	shru $r0.21 = $r0.19, $r0.18
	c0	mtb $b0.0 = $r0.20
	c0	shru $r0.22 = $r0.10, $r0.18
	c0	mtb $b0.1 = $r0.20
;;
;;
	c0	addcg $r0.20, $b0.0 = $r0.21, $r0.21, $b0.0
;;
	c0	divs $r0.21, $b0.0 = $r0.0, $r0.22, $b0.0
	c0	addcg $r0.23, $b0.1 = $r0.20, $r0.20, $b0.1
;;
	c0	addcg $r0.20, $b0.0 = $r0.23, $r0.23, $b0.0
	c0	divs $r0.21, $b0.1 = $r0.21, $r0.22, $b0.1
;;
	c0	addcg $r0.23, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.20, $b0.0 = $r0.21, $r0.22, $b0.0
;;
	c0	addcg $r0.21, $b0.0 = $r0.23, $r0.23, $b0.0
	c0	divs $r0.20, $b0.1 = $r0.20, $r0.22, $b0.1
;;
	c0	addcg $r0.23, $b0.1 = $r0.21, $r0.21, $b0.1
	c0	divs $r0.20, $b0.0 = $r0.20, $r0.22, $b0.0
;;
	c0	addcg $r0.21, $b0.0 = $r0.23, $r0.23, $b0.0
	c0	divs $r0.20, $b0.1 = $r0.20, $r0.22, $b0.1
;;
	c0	addcg $r0.23, $b0.1 = $r0.21, $r0.21, $b0.1
	c0	divs $r0.20, $b0.0 = $r0.20, $r0.22, $b0.0
;;
	c0	addcg $r0.21, $b0.0 = $r0.23, $r0.23, $b0.0
	c0	divs $r0.20, $b0.1 = $r0.20, $r0.22, $b0.1
;;
	c0	addcg $r0.23, $b0.1 = $r0.21, $r0.21, $b0.1
	c0	divs $r0.20, $b0.0 = $r0.20, $r0.22, $b0.0
;;
	c0	addcg $r0.21, $b0.0 = $r0.23, $r0.23, $b0.0
	c0	divs $r0.20, $b0.1 = $r0.20, $r0.22, $b0.1
;;
	c0	addcg $r0.23, $b0.1 = $r0.21, $r0.21, $b0.1
	c0	divs $r0.20, $b0.0 = $r0.20, $r0.22, $b0.0
;;
	c0	addcg $r0.21, $b0.0 = $r0.23, $r0.23, $b0.0
	c0	divs $r0.20, $b0.1 = $r0.20, $r0.22, $b0.1
;;
	c0	addcg $r0.23, $b0.1 = $r0.21, $r0.21, $b0.1
	c0	divs $r0.20, $b0.0 = $r0.20, $r0.22, $b0.0
;;
	c0	addcg $r0.21, $b0.0 = $r0.23, $r0.23, $b0.0
	c0	divs $r0.20, $b0.1 = $r0.20, $r0.22, $b0.1
;;
	c0	addcg $r0.23, $b0.1 = $r0.21, $r0.21, $b0.1
	c0	divs $r0.20, $b0.0 = $r0.20, $r0.22, $b0.0
;;
	c0	addcg $r0.21, $b0.0 = $r0.23, $r0.23, $b0.0
	c0	divs $r0.20, $b0.1 = $r0.20, $r0.22, $b0.1
;;
	c0	addcg $r0.23, $b0.1 = $r0.21, $r0.21, $b0.1
	c0	divs $r0.20, $b0.0 = $r0.20, $r0.22, $b0.0
;;
	c0	addcg $r0.21, $b0.0 = $r0.23, $r0.23, $b0.0
	c0	divs $r0.20, $b0.1 = $r0.20, $r0.22, $b0.1
;;
	c0	addcg $r0.23, $b0.1 = $r0.21, $r0.21, $b0.1
	c0	divs $r0.20, $b0.0 = $r0.20, $r0.22, $b0.0
;;
	c0	addcg $r0.21, $b0.0 = $r0.23, $r0.23, $b0.0
	c0	divs $r0.20, $b0.1 = $r0.20, $r0.22, $b0.1
;;
	c0	addcg $r0.23, $b0.1 = $r0.21, $r0.21, $b0.1
	c0	divs $r0.20, $b0.0 = $r0.20, $r0.22, $b0.0
;;
	c0	addcg $r0.21, $b0.0 = $r0.23, $r0.23, $b0.0
	c0	divs $r0.20, $b0.1 = $r0.20, $r0.22, $b0.1
;;
	c0	addcg $r0.23, $b0.1 = $r0.21, $r0.21, $b0.1
	c0	divs $r0.20, $b0.0 = $r0.20, $r0.22, $b0.0
;;
	c0	addcg $r0.21, $b0.0 = $r0.23, $r0.23, $b0.0
	c0	divs $r0.20, $b0.1 = $r0.20, $r0.22, $b0.1
;;
	c0	addcg $r0.23, $b0.1 = $r0.21, $r0.21, $b0.1
	c0	divs $r0.20, $b0.0 = $r0.20, $r0.22, $b0.0
;;
	c0	addcg $r0.21, $b0.0 = $r0.23, $r0.23, $b0.0
	c0	divs $r0.20, $b0.1 = $r0.20, $r0.22, $b0.1
;;
	c0	addcg $r0.23, $b0.1 = $r0.21, $r0.21, $b0.1
	c0	divs $r0.20, $b0.2 = $r0.20, $r0.22, $b0.0
	c0	mtb $b0.0 = $r0.18
;;
	c0	addcg $r0.18, $b0.2 = $r0.23, $r0.23, $b0.2
	c0	divs $r0.20, $b0.1 = $r0.20, $r0.22, $b0.1
;;
	c0	addcg $r0.21, $b0.1 = $r0.18, $r0.18, $b0.1
	c0	divs $r0.18, $b0.2 = $r0.20, $r0.22, $b0.2
;;
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.22, $b0.1
	c0	addcg $r0.20, $b0.2 = $r0.21, $r0.21, $b0.2
;;
	c0	addcg $r0.21, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.18, $b0.2 = $r0.18, $r0.22, $b0.2
;;
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.22, $b0.1
	c0	cmpgeu $r0.19 = $r0.19, $r0.10
	c0	addcg $r0.20, $b0.2 = $r0.21, $r0.21, $b0.2
;;
	c0	cmpge $b0.2 = $r0.18, $r0.0
	c0	addcg $r0.18, $b0.1 = $r0.20, $r0.20, $b0.1
;;
	c0	orc $r0.18 = $r0.18, $r0.0
;;
	c0	mfb $r0.20 = $b0.2
;;
	c0	sh1add $r0.18 = $r0.18, $r0.20
;;
	c0	slct $r0.18 = $b0.0, $r0.19, $r0.18
	c0	goto LBB62_77
;;
LBB62_75:
	c0	mov $r0.18 = 65535
;;
LBB62_77:                               ## %estimateDiv64To32.exit
	c0	or $r0.16 = $r0.18, $r0.16
;;
	c0	and $r0.18 = $r0.16, 1023
;;
	c0	cmpgtu $b0.0 = $r0.18, 4
;;
;;
	c0	br $b0.0, LBB62_81
;;
## BB#78:                               ## %if.then.60
	c0	shru $r0.18 = $r0.16, $r0.2
	c0	zxth $r0.19 = $r0.16
;;
	c0	mpylu $r0.20 = $r0.18, $r0.13
	c0	mpyhs $r0.21 = $r0.18, $r0.13
	c0	mpyhs $r0.22 = $r0.19, $r0.6
	c0	mpylu $r0.23 = $r0.19, $r0.6
;;
	c0	mpyhs $r0.24 = $r0.19, $r0.10
	c0	mpylu $r0.25 = $r0.19, $r0.10
	c0	mpyhs $r0.26 = $r0.18, $r0.11
	c0	mpylu $r0.27 = $r0.18, $r0.11
;;
	c0	add $r0.20 = $r0.20, $r0.21
	c0	mpylu $r0.21 = $r0.19, $r0.11
	c0	mpyhs $r0.11 = $r0.19, $r0.11
	c0	add $r0.22 = $r0.23, $r0.22
;;
	c0	add $r0.23 = $r0.25, $r0.24
	c0	mpyhs $r0.24 = $r0.19, $r0.13
	c0	mpylu $r0.13 = $r0.19, $r0.13
	c0	mpylu $r0.19 = $r0.18, $r0.6
	c0	add $r0.25 = $r0.27, $r0.26
	c0	add $r0.22 = $r0.20, $r0.22
	c0	mpyhs $r0.6 = $r0.18, $r0.6
;;
	c0	add $r0.11 = $r0.21, $r0.11
	c0	mpyhs $r0.21 = $r0.18, $r0.10
	c0	add $r0.23 = $r0.25, $r0.23
	c0	cmpltu $r0.20 = $r0.22, $r0.20
;;
	c0	add $r0.13 = $r0.13, $r0.24
	c0	shl $r0.24 = $r0.22, $r0.2
	c0	shru $r0.22 = $r0.22, $r0.2
	c0	add $r0.6 = $r0.19, $r0.6
	c0	shl $r0.19 = $r0.23, $r0.2
	c0	shl $r0.20 = $r0.20, $r0.2
;;
	c0	add $r0.13 = $r0.24, $r0.13
	c0	add $r0.11 = $r0.19, $r0.11
	c0	or $r0.20 = $r0.20, $r0.22
;;
	c0	add $r0.6 = $r0.11, $r0.6
	c0	mpylu $r0.10 = $r0.18, $r0.10
	c0	cmpltu $r0.18 = $r0.11, $r0.19
	c0	cmpltu $r0.19 = $r0.13, $r0.24
	c0	cmpne $b0.0 = $r0.13, 0
;;
	c0	mtb $b0.1 = $r0.18
	c0	add $r0.6 = $r0.6, $r0.20
	c0	mov $r0.18 = 0
;;
	c0	add $r0.10 = $r0.10, $r0.21
;;
	c0	sub $r0.10 = $r0.15, $r0.10
	c0	add $r0.6 = $r0.6, $r0.19
	c0	cmpltu $r0.15 = $r0.23, $r0.25
	c0	shru $r0.19 = $r0.23, $r0.2
;;
	c0	shl $r0.15 = $r0.15, $r0.2
	c0	sub $r0.2 = $r0.18, $r0.13
;;
	c0	or $r0.13 = $r0.15, $r0.19
;;
	c0	sub $r0.10 = $r0.10, $r0.13
	c0	mfb $r0.13 = $b0.0
	c0	sub $r0.15 = $r0.14, $r0.6
	c0	cmpltu $r0.11 = $r0.6, $r0.11
	c0	cmpltu $r0.14 = $r0.14, $r0.6
	c0	mfb $r0.18 = $b0.1
;;
	c0	cmpltu $r0.19 = $r0.15, $r0.13
	c0	sub $r0.6 = $r0.15, $r0.13
	c0	mtb $b0.0 = $r0.14
	c0	mtb $b0.1 = $r0.11
	c0	add $r0.10 = $r0.10, $r0.18
;;
	c0	mtb $b0.2 = $r0.19
;;
	c0	slct $r0.11 = $b0.1, $r0.17, 0
	c0	slct $r0.13 = $b0.0, $r0.17, 0
;;
	c0	slct $r0.14 = $b0.2, $r0.17, 0
	c0	add $r0.10 = $r0.10, $r0.11
;;
	c0	add $r0.10 = $r0.10, $r0.13
;;
	c0	add $r0.10 = $r0.10, $r0.14
;;
	c0	cmpgt $b0.0 = $r0.10, -1
;;
;;
	c0	br $b0.0, LBB62_80
;;
LBB62_79:                               ## %while.body.63
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.2 = $r0.8, $r0.2
	c0	add $r0.11 = $r0.6, $r0.9
;;
	c0	cmpltu $r0.13 = $r0.2, $r0.8
	c0	cmpltu $r0.6 = $r0.11, $r0.6
	c0	add $r0.16 = $r0.16, -1
;;
	c0	add $r0.10 = $r0.6, $r0.10
	c0	add $r0.6 = $r0.13, $r0.11
;;
	c0	cmpltu $r0.11 = $r0.6, $r0.13
;;
	c0	add $r0.10 = $r0.10, $r0.11
;;
	c0	cmplt $b0.0 = $r0.10, 0
;;
;;
	c0	br $b0.0, LBB62_79
;;
LBB62_80:                               ## %while.end.65
	c0	or $r0.6 = $r0.6, $r0.10
;;
	c0	or $r0.2 = $r0.6, $r0.2
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	or $r0.16 = $r0.2, $r0.16
;;
LBB62_81:                               ## %if.end.70
	c0	shru $r0.2 = $r0.16, $r0.5
	c0	shl $r0.6 = $r0.12, $r0.7
	c0	shl $r0.7 = $r0.16, $r0.7
	c0	shru $r0.5 = $r0.12, $r0.5
;;
	c0	or $r0.6 = $r0.2, $r0.6
;;
.call roundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = roundAndPackFloat64
;;
LBB62_82:                               ## %cleanup
.return ret($r0.3:u32,$r0.4:u32)
	c0	or $r0.4 = $r0.57, $r0.4
	c0	ldw $r0.57 = 28[$r0.1]
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
	c0	stw 28[$r0.1] = $r0.57
	c0	mov $r0.2 = 20
;;
	c0	shru $r0.7 = $r0.3, $r0.2
;;
	c0	and $r0.9 = $r0.7, 2047
	c0	shru $r0.2 = $r0.5, $r0.2
;;
	c0	cmpne $b0.0 = $r0.9, 2047
	c0	and $r0.7 = $r0.5, 1048575
	c0	and $r0.8 = $r0.3, 1048575
	c0	and $r0.2 = $r0.2, 2047
;;
;;
	c0	br $b0.0, LBB63_22
;;
## BB#1:                                ## %if.then
	c0	or $r0.8 = $r0.8, $r0.4
;;
	c0	cmpne $b0.0 = $r0.8, 0
;;
;;
	c0	br $b0.0, LBB63_4
;;
## BB#2:                                ## %lor.lhs.false
	c0	cmpne $b0.0 = $r0.2, 2047
;;
;;
	c0	br $b0.0, LBB63_27
;;
## BB#3:                                ## %lor.lhs.false
	c0	or $r0.2 = $r0.7, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB63_4
;;
	c0	goto LBB63_27
;;
LBB63_22:                               ## %if.end.13
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB63_23
;;
## BB#26:                               ## %if.then.23
	c0	or $r0.2 = $r0.7, $r0.6
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB63_27
;;
## BB#28:                               ## %if.end.27
	c0	cmpne $b0.0 = $r0.7, 0
;;
;;
	c0	brf $b0.0, LBB63_29
;;
## BB#33:                               ## %if.else.7.i.419
	c0	cmpltu $b0.0 = $r0.7, 65536
	c0	mov $r0.2 = 16
	c0	mov $r0.10 = 8
	c0	mov $r0.11 = 22
	c0	mov $r0.12 = countLeadingZeros32.countLeadingZerosHigh
	c0	mov $r0.13 = 4
;;
	c0	shl $r0.2 = $r0.5, $r0.2
;;
	c0	mfb $r0.5 = $b0.0
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.7
;;
	c0	cmpltu $b0.0 = $r0.2, 16777216
	c0	shl $r0.10 = $r0.2, $r0.10
	c0	shl $r0.5 = $r0.5, $r0.13
;;
	c0	or $r0.13 = $r0.5, 8
;;
	c0	slct $r0.2 = $b0.0, $r0.10, $r0.2
	c0	slct $r0.5 = $b0.0, $r0.13, $r0.5
;;
	c0	shru $r0.2 = $r0.2, $r0.11
;;
	c0	and $r0.2 = $r0.2, 1020
;;
	c0	add $r0.2 = $r0.12, $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
;;
	c0	add $r0.2 = $r0.2, $r0.5
;;
	c0	add $r0.5 = $r0.2, -11
;;
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB63_35
;;
## BB#34:                               ## %cond.false.i.i.425
	c0	mov $r0.10 = 11
	c0	shl $r0.7 = $r0.7, $r0.5
;;
	c0	sub $r0.10 = $r0.10, $r0.2
;;
	c0	and $r0.10 = $r0.10, 31
;;
	c0	shru $r0.10 = $r0.6, $r0.10
;;
	c0	or $r0.7 = $r0.10, $r0.7
;;
LBB63_35:                               ## %shortShift64Left.exit.i.428
	c0	mov $r0.10 = 12
	c0	shl $r0.6 = $r0.6, $r0.5
;;
	c0	sub $r0.2 = $r0.10, $r0.2
	c0	goto LBB63_36
;;
LBB63_23:                               ## %if.end.13
	c0	cmpne $b0.0 = $r0.2, 2047
;;
;;
	c0	br $b0.0, LBB63_36
;;
## BB#24:                               ## %if.then.15
	c0	or $r0.2 = $r0.7, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB63_25
;;
LBB63_4:                                ## %if.then.11
	c0	and $r0.2 = $r0.3, 2146959360
;;
	c0	xor $r0.2 = $r0.2, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB63_5
;;
## BB#6:                                ## %land.rhs.i.61.i.448
	c0	cmpne $b0.0 = $r0.4, 0
;;
;;
	c0	brf $b0.0, LBB63_8
;;
## BB#7:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.1 = $r0.2
	c0	goto LBB63_9
;;
LBB63_5:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.1 = $r0.2
	c0	goto LBB63_9
;;
LBB63_27:                               ## %invalid
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.5 = 0[$r0.2]
	c0	mov $r0.4 = -1
	c0	mov $r0.3 = 2147483647
	c0	mov $r0.57 = 0
;;
;;
	c0	or $r0.5 = $r0.5, 16
;;
	c0	stw 0[$r0.2] = $r0.5
	c0	goto LBB63_97
;;
LBB63_8:                                ## %lor.rhs.i.64.i.451
	c0	and $r0.2 = $r0.3, 524287
;;
	c0	cmpne $b0.1 = $r0.2, 0
;;
LBB63_9:                                ## %float64_is_signaling_nan.exit66.i.455
	c0	add $r0.2 = $r0.5, $r0.5
;;
	c0	cmpltu $b0.0 = $r0.2, -2097152
;;
;;
	c0	br $b0.0, LBB63_10
;;
## BB#11:                               ## %land.rhs.i.53.i.458
	c0	cmpne $b0.0 = $r0.6, 0
;;
;;
	c0	brf $b0.0, LBB63_13
;;
## BB#12:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB63_14
;;
LBB63_10:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB63_14
;;
LBB63_13:                               ## %lor.rhs.i.55.i.461
	c0	and $r0.2 = $r0.5, 1048575
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
LBB63_14:                               ## %float64_is_nan.exit.i.464
	c0	and $r0.2 = $r0.5, 2146959360
	c0	mov $r0.57 = 0
;;
	c0	xor $r0.2 = $r0.2, 2146435072
	c0	mtb $b0.2 = $r0.57
;;
	c0	cmpne $b0.3 = $r0.2, 0
;;
;;
	c0	br $b0.3, LBB63_19
;;
## BB#15:                               ## %land.rhs.i.i.467
	c0	cmpeq $b0.2 = $r0.6, 0
;;
;;
	c0	br $b0.2, LBB63_18
;;
## BB#16:                               ## %float64_is_signaling_nan.exit.thread.i.470
	c0	mov $r0.7 = -1
	c0	or $r0.3 = $r0.3, 524288
	c0	or $r0.2 = $r0.5, 524288
;;
	c0	mtb $b0.2 = $r0.7
	c0	goto LBB63_17
;;
LBB63_18:                               ## %lor.rhs.i.i.473
	c0	and $r0.2 = $r0.5, 524287
;;
	c0	cmpne $b0.2 = $r0.2, 0
;;
LBB63_19:                               ## %float64_is_signaling_nan.exit.i.477
	c0	mfb $r0.7 = $b0.2
	c0	mfb $r0.8 = $b0.1
	c0	or $r0.2 = $r0.5, 524288
	c0	or $r0.3 = $r0.3, 524288
;;
	c0	or $r0.5 = $r0.8, $r0.7
;;
	c0	and $r0.5 = $r0.5, 1
;;
	c0	cmpeq $b0.1 = $r0.5, 0
;;
;;
	c0	br $b0.1, LBB63_20
;;
LBB63_17:                               ## %if.then.i.481
	c0	mov $r0.5 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.5]
	c0	mov $r0.8 = -1
;;
	c0	mtb $b0.1 = $r0.8
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.5] = $r0.7
	c0	goto LBB63_21
;;
LBB63_20:
	c0	mov $r0.5 = 0
;;
	c0	mtb $b0.1 = $r0.5
;;
;;
	c0	mfb $r0.11 = $b0.1
;;
	c0	mtb $b0.2 = $r0.11
;;
LBB63_21:                               ## %propagateFloat64NaN.exit496
	c0	slct $r0.5 = $b0.0, $r0.2, $r0.3
	c0	slct $r0.2 = $b0.2, $r0.2, $r0.3
	c0	slct $r0.7 = $b0.2, $r0.6, $r0.4
	c0	slct $r0.4 = $b0.0, $r0.6, $r0.4
;;
	c0	slct $r0.3 = $b0.1, $r0.2, $r0.5
	c0	slct $r0.4 = $b0.1, $r0.7, $r0.4
	c0	goto LBB63_97
;;
LBB63_29:                               ## %if.then.i.392
	c0	mov $r0.2 = 16
	c0	cmpltu $b0.0 = $r0.6, 65536
	c0	mov $r0.5 = 8
	c0	mov $r0.7 = 22
	c0	mov $r0.10 = countLeadingZeros32.countLeadingZerosHigh
	c0	mov $r0.11 = 4
;;
	c0	shl $r0.2 = $r0.6, $r0.2
;;
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
	c0	shl $r0.5 = $r0.5, $r0.11
;;
	c0	add $r0.2 = $r0.10, $r0.2
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
	c0	br $b0.0, LBB63_31
;;
## BB#30:                               ## %if.then.2.i.397
	c0	mov $r0.7 = 11
	c0	and $r0.5 = $r0.5, 31
;;
	c0	sub $r0.7 = $r0.7, $r0.2
;;
	c0	shru $r0.7 = $r0.6, $r0.7
	c0	shl $r0.6 = $r0.6, $r0.5
	c0	goto LBB63_32
;;
LBB63_25:                               ## %if.end.20
	c0	mov $r0.57 = 0
	c0	goto LBB63_97
;;
LBB63_31:                               ## %if.else.i.399
	c0	mov $r0.10 = 0
	c0	shl $r0.7 = $r0.6, $r0.5
;;
	c0	mov $r0.6 = $r0.10
;;
LBB63_32:                               ## %if.end.i.402
	c0	mov $r0.5 = -20
;;
	c0	sub $r0.2 = $r0.5, $r0.2
;;
LBB63_36:                               ## %if.end.28
	c0	cmpne $b0.0 = $r0.9, 0
;;
;;
	c0	brf $b0.0, LBB63_38
;;
## BB#37:
	c0	mov $r0.12 = $r0.4
	c0	goto LBB63_48
;;
LBB63_38:                               ## %if.then.30
	c0	or $r0.5 = $r0.8, $r0.4
;;
	c0	cmpne $b0.0 = $r0.5, 0
;;
;;
	c0	brf $b0.0, LBB63_39
;;
## BB#40:                               ## %if.end.34
	c0	cmpne $b0.0 = $r0.8, 0
;;
;;
	c0	brf $b0.0, LBB63_41
;;
## BB#45:                               ## %if.else.7.i
	c0	cmpltu $b0.0 = $r0.8, 65536
	c0	mov $r0.5 = 16
	c0	mov $r0.9 = 8
	c0	mov $r0.10 = 22
	c0	mov $r0.11 = countLeadingZeros32.countLeadingZerosHigh
	c0	mov $r0.12 = 4
;;
	c0	shl $r0.5 = $r0.3, $r0.5
;;
	c0	mfb $r0.13 = $b0.0
	c0	slct $r0.5 = $b0.0, $r0.5, $r0.8
;;
	c0	cmpltu $b0.0 = $r0.5, 16777216
	c0	shl $r0.9 = $r0.5, $r0.9
	c0	shl $r0.12 = $r0.13, $r0.12
;;
	c0	or $r0.13 = $r0.12, 8
;;
	c0	slct $r0.5 = $b0.0, $r0.9, $r0.5
	c0	slct $r0.9 = $b0.0, $r0.13, $r0.12
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
	c0	add $r0.5 = $r0.5, $r0.9
;;
	c0	add $r0.9 = $r0.5, -11
;;
	c0	cmpeq $b0.0 = $r0.9, 0
;;
;;
	c0	br $b0.0, LBB63_47
;;
## BB#46:                               ## %cond.false.i.i
	c0	mov $r0.10 = 11
	c0	shl $r0.8 = $r0.8, $r0.9
;;
	c0	sub $r0.10 = $r0.10, $r0.5
;;
	c0	and $r0.10 = $r0.10, 31
;;
	c0	shru $r0.10 = $r0.4, $r0.10
;;
	c0	or $r0.8 = $r0.10, $r0.8
;;
LBB63_47:                               ## %shortShift64Left.exit.i
	c0	mov $r0.10 = 12
	c0	shl $r0.12 = $r0.4, $r0.9
;;
	c0	sub $r0.9 = $r0.10, $r0.5
	c0	goto LBB63_48
;;
LBB63_39:                               ## %if.then.33
	c0	mov $r0.57 = 0
	c0	goto LBB63_97
;;
LBB63_41:                               ## %if.then.i
	c0	mov $r0.5 = 16
	c0	cmpltu $b0.0 = $r0.4, 65536
	c0	mov $r0.8 = 8
	c0	mov $r0.9 = 22
	c0	mov $r0.10 = countLeadingZeros32.countLeadingZerosHigh
	c0	mov $r0.11 = 4
;;
	c0	shl $r0.5 = $r0.4, $r0.5
;;
	c0	slct $r0.5 = $b0.0, $r0.5, $r0.4
;;
	c0	cmpltu $b0.1 = $r0.5, 16777216
	c0	shl $r0.8 = $r0.5, $r0.8
;;
;;
	c0	slct $r0.5 = $b0.1, $r0.8, $r0.5
;;
	c0	shru $r0.5 = $r0.5, $r0.9
	c0	mfb $r0.8 = $b0.0
;;
	c0	and $r0.5 = $r0.5, 1020
	c0	shl $r0.8 = $r0.8, $r0.11
;;
	c0	add $r0.5 = $r0.10, $r0.5
	c0	or $r0.9 = $r0.8, 8
;;
	c0	ldw $r0.5 = 0[$r0.5]
	c0	slct $r0.8 = $b0.1, $r0.9, $r0.8
;;
;;
	c0	add $r0.5 = $r0.5, $r0.8
;;
	c0	cmpgt $b0.0 = $r0.5, 10
	c0	add $r0.8 = $r0.5, -11
;;
;;
	c0	br $b0.0, LBB63_43
;;
## BB#42:                               ## %if.then.2.i.371
	c0	mov $r0.9 = 11
	c0	and $r0.8 = $r0.8, 31
;;
	c0	sub $r0.9 = $r0.9, $r0.5
	c0	shl $r0.12 = $r0.4, $r0.8
;;
	c0	shru $r0.8 = $r0.4, $r0.9
	c0	goto LBB63_44
;;
LBB63_43:                               ## %if.else.i.373
	c0	mov $r0.12 = 0
	c0	shl $r0.8 = $r0.4, $r0.8
;;
LBB63_44:                               ## %if.end.i.374
	c0	mov $r0.9 = -20
;;
	c0	sub $r0.9 = $r0.9, $r0.5
;;
LBB63_48:                               ## %if.end.35
	c0	sub $r0.10 = $r0.9, $r0.2
;;
	c0	cmpgt $b0.0 = $r0.10, -2
;;
;;
	c0	br $b0.0, LBB63_50
;;
## BB#49:                               ## %if.then.37
	c0	mov $r0.57 = 0
	c0	goto LBB63_97
;;
LBB63_50:                               ## %if.end.38
	c0	mov $r0.4 = 31
	c0	mov $r0.5 = 11
	c0	mov $r0.57 = 0
	c0	mov $r0.9 = 21
	c0	or $r0.13 = $r0.8, 1048576
;;
	c0	shru $r0.11 = $r0.10, $r0.4
	c0	shl $r0.7 = $r0.7, $r0.5
	c0	shru $r0.8 = $r0.6, $r0.9
	c0	shl $r0.19 = $r0.6, $r0.5
;;
	c0	sub $r0.9 = $r0.5, $r0.11
	c0	or $r0.5 = $r0.7, -2147483648
;;
	c0	shl $r0.11 = $r0.12, $r0.9
	c0	shl $r0.7 = $r0.13, $r0.9
	c0	sub $r0.13 = $r0.57, $r0.9
	c0	or $r0.9 = $r0.8, $r0.5
;;
	c0	and $r0.13 = $r0.13, 23
;;
	c0	shru $r0.12 = $r0.12, $r0.13
;;
	c0	or $r0.7 = $r0.12, $r0.7
;;
	c0	cmpgtu $b0.0 = $r0.7, $r0.9
;;
;;
	c0	brf $b0.0, LBB63_52
;;
## BB#51:
	c0	mov $r0.25 = 1
	c0	goto LBB63_53
;;
LBB63_52:                               ## %le64.exit
	c0	cmpeq $b0.0 = $r0.7, $r0.9
	c0	cmpgeu $b0.1 = $r0.11, $r0.19
;;
;;
	c0	mfb $r0.12 = $b0.0
	c0	mfb $r0.13 = $b0.1
;;
	c0	and $r0.12 = $r0.13, $r0.12
;;
	c0	and $r0.25 = $r0.12, 1
;;
	c0	cmpeq $b0.0 = $r0.25, 0
;;
;;
	c0	br $b0.0, LBB63_54
;;
LBB63_53:                               ## %if.then.45
	c0	cmpltu $r0.12 = $r0.11, $r0.19
	c0	mov $r0.13 = -1
	c0	sub $r0.7 = $r0.7, $r0.9
	c0	sub $r0.11 = $r0.11, $r0.19
;;
	c0	mtb $b0.0 = $r0.12
;;
;;
	c0	slct $r0.12 = $b0.0, $r0.13, 0
;;
	c0	add $r0.7 = $r0.7, $r0.12
;;
LBB63_54:                               ## %if.end.46
	c0	cmplt $b0.0 = $r0.10, 33
	c0	add $r0.10 = $r0.10, -32
;;
;;
	c0	br $b0.0, LBB63_65
;;
## BB#55:                               ## %while.body.lr.ph
	c0	mov $r0.12 = 16
	c0	mov $r0.22 = 5
;;
	c0	shru $r0.13 = $r0.5, $r0.12
;;
	c0	cmplt $r0.14 = $r0.13, $r0.0
	c0	zxth $r0.15 = $r0.9
	c0	mov $r0.16 = 0
	c0	mov $r0.17 = -65536
	c0	mov $r0.18 = -1
	c0	and $r0.19 = $r0.19, 63488
;;
	c0	mov $r0.20 = 65535
	c0	shl $r0.21 = $r0.9, $r0.12
	c0	shru $r0.23 = $r0.6, $r0.22
	c0	shl $r0.22 = $r0.13, $r0.12
;;
	c0	zxth $r0.23 = $r0.23
	c0	mtb $b0.0 = $r0.14
	c0	shru $r0.24 = $r0.13, $r0.14
;;
LBB63_56:                               ## %while.body
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB63_60 Depth 2
	c0	cmpleu $b0.1 = $r0.9, $r0.7
	c0	mov $r0.25 = $r0.18
;;
;;
	c0	br $b0.1, LBB63_64
;;
## BB#57:                               ## %if.end.i.292
                                        ##   in Loop: Header=BB63_56 Depth=1
	c0	cmpleu $b0.1 = $r0.22, $r0.7
	c0	mov $r0.25 = $r0.17
;;
;;
	c0	br $b0.1, LBB63_59
;;
## BB#58:                               ## %cond.false.i.295
                                        ##   in Loop: Header=BB63_56 Depth=1
	c0	shru $r0.25 = $r0.7, $r0.14
	c0	mtb $b0.1 = $r0.16
	c0	mtb $b0.2 = $r0.16
	c0	cmpgeu $r0.26 = $r0.7, $r0.13
;;
;;
	c0	addcg $r0.27, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	divs $r0.25, $b0.1 = $r0.0, $r0.24, $b0.1
	c0	addcg $r0.28, $b0.2 = $r0.27, $r0.27, $b0.2
;;
	c0	addcg $r0.27, $b0.1 = $r0.28, $r0.28, $b0.1
	c0	divs $r0.25, $b0.2 = $r0.25, $r0.24, $b0.2
;;
	c0	addcg $r0.28, $b0.2 = $r0.27, $r0.27, $b0.2
	c0	divs $r0.25, $b0.1 = $r0.25, $r0.24, $b0.1
;;
	c0	addcg $r0.27, $b0.1 = $r0.28, $r0.28, $b0.1
	c0	divs $r0.25, $b0.2 = $r0.25, $r0.24, $b0.2
;;
	c0	addcg $r0.28, $b0.2 = $r0.27, $r0.27, $b0.2
	c0	divs $r0.25, $b0.1 = $r0.25, $r0.24, $b0.1
;;
	c0	addcg $r0.27, $b0.1 = $r0.28, $r0.28, $b0.1
	c0	divs $r0.25, $b0.2 = $r0.25, $r0.24, $b0.2
;;
	c0	addcg $r0.28, $b0.2 = $r0.27, $r0.27, $b0.2
	c0	divs $r0.25, $b0.1 = $r0.25, $r0.24, $b0.1
;;
	c0	addcg $r0.27, $b0.1 = $r0.28, $r0.28, $b0.1
	c0	divs $r0.25, $b0.2 = $r0.25, $r0.24, $b0.2
;;
	c0	addcg $r0.28, $b0.2 = $r0.27, $r0.27, $b0.2
	c0	divs $r0.25, $b0.1 = $r0.25, $r0.24, $b0.1
;;
	c0	addcg $r0.27, $b0.1 = $r0.28, $r0.28, $b0.1
	c0	divs $r0.25, $b0.2 = $r0.25, $r0.24, $b0.2
;;
	c0	addcg $r0.28, $b0.2 = $r0.27, $r0.27, $b0.2
	c0	divs $r0.25, $b0.1 = $r0.25, $r0.24, $b0.1
;;
	c0	addcg $r0.27, $b0.1 = $r0.28, $r0.28, $b0.1
	c0	divs $r0.25, $b0.2 = $r0.25, $r0.24, $b0.2
;;
	c0	addcg $r0.28, $b0.2 = $r0.27, $r0.27, $b0.2
	c0	divs $r0.25, $b0.1 = $r0.25, $r0.24, $b0.1
;;
	c0	addcg $r0.27, $b0.1 = $r0.28, $r0.28, $b0.1
	c0	divs $r0.25, $b0.2 = $r0.25, $r0.24, $b0.2
;;
	c0	addcg $r0.28, $b0.2 = $r0.27, $r0.27, $b0.2
	c0	divs $r0.25, $b0.1 = $r0.25, $r0.24, $b0.1
;;
	c0	addcg $r0.27, $b0.1 = $r0.28, $r0.28, $b0.1
	c0	divs $r0.25, $b0.2 = $r0.25, $r0.24, $b0.2
;;
	c0	addcg $r0.28, $b0.2 = $r0.27, $r0.27, $b0.2
	c0	divs $r0.25, $b0.1 = $r0.25, $r0.24, $b0.1
;;
	c0	divs $r0.25, $b0.2 = $r0.25, $r0.24, $b0.2
	c0	addcg $r0.27, $b0.1 = $r0.28, $r0.28, $b0.1
;;
	c0	addcg $r0.28, $b0.2 = $r0.27, $r0.27, $b0.2
	c0	divs $r0.25, $b0.1 = $r0.25, $r0.24, $b0.1
;;
	c0	divs $r0.25, $b0.2 = $r0.25, $r0.24, $b0.2
	c0	addcg $r0.27, $b0.1 = $r0.28, $r0.28, $b0.1
;;
	c0	addcg $r0.28, $b0.2 = $r0.27, $r0.27, $b0.2
	c0	divs $r0.25, $b0.1 = $r0.25, $r0.24, $b0.1
;;
	c0	divs $r0.25, $b0.2 = $r0.25, $r0.24, $b0.2
	c0	addcg $r0.27, $b0.1 = $r0.28, $r0.28, $b0.1
;;
	c0	addcg $r0.28, $b0.2 = $r0.27, $r0.27, $b0.2
	c0	divs $r0.25, $b0.1 = $r0.25, $r0.24, $b0.1
;;
	c0	divs $r0.25, $b0.2 = $r0.25, $r0.24, $b0.2
	c0	addcg $r0.27, $b0.1 = $r0.28, $r0.28, $b0.1
;;
	c0	addcg $r0.28, $b0.2 = $r0.27, $r0.27, $b0.2
	c0	divs $r0.25, $b0.1 = $r0.25, $r0.24, $b0.1
;;
	c0	divs $r0.25, $b0.2 = $r0.25, $r0.24, $b0.2
	c0	addcg $r0.27, $b0.1 = $r0.28, $r0.28, $b0.1
;;
	c0	addcg $r0.28, $b0.2 = $r0.27, $r0.27, $b0.2
	c0	divs $r0.25, $b0.1 = $r0.25, $r0.24, $b0.1
;;
	c0	divs $r0.25, $b0.2 = $r0.25, $r0.24, $b0.2
	c0	addcg $r0.27, $b0.1 = $r0.28, $r0.28, $b0.1
;;
	c0	addcg $r0.28, $b0.2 = $r0.27, $r0.27, $b0.2
	c0	divs $r0.25, $b0.1 = $r0.25, $r0.24, $b0.1
;;
	c0	divs $r0.25, $b0.2 = $r0.25, $r0.24, $b0.2
	c0	addcg $r0.27, $b0.1 = $r0.28, $r0.28, $b0.1
;;
	c0	addcg $r0.28, $b0.2 = $r0.27, $r0.27, $b0.2
	c0	divs $r0.25, $b0.1 = $r0.25, $r0.24, $b0.1
;;
	c0	divs $r0.25, $b0.2 = $r0.25, $r0.24, $b0.2
	c0	addcg $r0.27, $b0.1 = $r0.28, $r0.28, $b0.1
;;
	c0	cmpge $b0.1 = $r0.25, $r0.0
	c0	addcg $r0.25, $b0.2 = $r0.27, $r0.27, $b0.2
;;
	c0	orc $r0.25 = $r0.25, $r0.0
;;
	c0	mfb $r0.27 = $b0.1
;;
	c0	sh1add $r0.25 = $r0.25, $r0.27
;;
	c0	slct $r0.25 = $b0.0, $r0.26, $r0.25
;;
	c0	shl $r0.25 = $r0.25, $r0.12
;;
LBB63_59:                               ## %cond.end.i.310
                                        ##   in Loop: Header=BB63_56 Depth=1
	c0	shru $r0.26 = $r0.25, $r0.12
;;
	c0	mpylu $r0.27 = $r0.26, $r0.15
	c0	mpyhs $r0.28 = $r0.26, $r0.15
	c0	mpylu $r0.29 = $r0.26, $r0.13
	c0	mpyhs $r0.26 = $r0.26, $r0.13
;;
;;
	c0	add $r0.27 = $r0.27, $r0.28
	c0	add $r0.26 = $r0.29, $r0.26
;;
	c0	shl $r0.28 = $r0.27, $r0.12
	c0	shru $r0.27 = $r0.27, $r0.12
	c0	sub $r0.29 = $r0.7, $r0.26
;;
	c0	cmpltu $r0.30 = $r0.11, $r0.28
	c0	sub $r0.26 = $r0.11, $r0.28
	c0	sub $r0.27 = $r0.29, $r0.27
;;
	c0	mtb $b0.1 = $r0.30
;;
;;
	c0	slct $r0.28 = $b0.1, $r0.18, 0
;;
	c0	add $r0.27 = $r0.27, $r0.28
;;
	c0	cmpgt $b0.1 = $r0.27, -1
;;
;;
	c0	br $b0.1, LBB63_61
;;
LBB63_60:                               ## %while.body.i.323
                                        ##   Parent Loop BB63_56 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	add $r0.26 = $r0.26, $r0.21
	c0	add $r0.27 = $r0.27, $r0.13
	c0	add $r0.25 = $r0.25, -65536
;;
	c0	cmpltu $r0.28 = $r0.26, $r0.21
;;
	c0	add $r0.27 = $r0.27, $r0.28
;;
	c0	cmplt $b0.1 = $r0.27, 0
;;
;;
	c0	br $b0.1, LBB63_60
;;
LBB63_61:                               ## %while.end.i.331
                                        ##   in Loop: Header=BB63_56 Depth=1
	c0	shl $r0.27 = $r0.27, $r0.12
	c0	shru $r0.28 = $r0.26, $r0.12
	c0	mov $r0.26 = $r0.20
;;
	c0	or $r0.27 = $r0.28, $r0.27
;;
	c0	cmpleu $b0.1 = $r0.22, $r0.27
;;
;;
	c0	br $b0.1, LBB63_63
;;
## BB#62:                               ## %cond.false.10.i.333
                                        ##   in Loop: Header=BB63_56 Depth=1
	c0	shru $r0.26 = $r0.27, $r0.14
	c0	mtb $b0.1 = $r0.16
	c0	mtb $b0.2 = $r0.16
	c0	cmpgeu $r0.27 = $r0.27, $r0.13
;;
;;
	c0	addcg $r0.28, $b0.1 = $r0.26, $r0.26, $b0.1
;;
	c0	divs $r0.26, $b0.1 = $r0.0, $r0.24, $b0.1
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
;;
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.24, $b0.2
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.24, $b0.1
;;
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.24, $b0.2
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.24, $b0.1
;;
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.24, $b0.2
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.24, $b0.1
;;
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.24, $b0.2
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.24, $b0.1
;;
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.24, $b0.2
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.24, $b0.1
;;
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.24, $b0.2
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.24, $b0.1
;;
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.24, $b0.2
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.24, $b0.1
;;
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.24, $b0.2
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.24, $b0.1
;;
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.24, $b0.2
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.24, $b0.1
;;
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.24, $b0.2
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.24, $b0.1
;;
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.24, $b0.2
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.24, $b0.1
;;
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.24, $b0.2
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.24, $b0.1
;;
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.24, $b0.2
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.24, $b0.1
;;
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.24, $b0.2
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.24, $b0.1
;;
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.24, $b0.2
	c0	addcg $r0.28, $b0.1 = $r0.29, $r0.29, $b0.1
;;
	c0	addcg $r0.29, $b0.2 = $r0.28, $r0.28, $b0.2
	c0	divs $r0.26, $b0.1 = $r0.26, $r0.24, $b0.1
;;
	c0	divs $r0.26, $b0.2 = $r0.26, $r0.24, $b0.2
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
LBB63_63:                               ## %cond.end.12.i.336
                                        ##   in Loop: Header=BB63_56 Depth=1
	c0	or $r0.25 = $r0.26, $r0.25
;;
LBB63_64:                               ## %estimateDiv64To32.exit338
                                        ##   in Loop: Header=BB63_56 Depth=1
	c0	cmpgtu $b0.2 = $r0.25, 4
	c0	add $r0.25 = $r0.25, -4
	c0	mov $r0.26 = 29
	c0	mov $r0.27 = 3
	c0	cmpgt $b0.1 = $r0.10, 29
;;
	c0	shru $r0.11 = $r0.11, $r0.27
;;
	c0	slct $r0.25 = $b0.2, $r0.25, 0
;;
	c0	zxth $r0.28 = $r0.25
	c0	shru $r0.29 = $r0.25, $r0.12
;;
	c0	mpylu $r0.30 = $r0.29, $r0.19
	c0	mpyhs $r0.31 = $r0.29, $r0.19
	c0	mpylu $r0.32 = $r0.29, $r0.15
	c0	mpyhs $r0.33 = $r0.29, $r0.15
;;
	c0	mpylu $r0.34 = $r0.28, $r0.13
	c0	mpylu $r0.35 = $r0.28, $r0.23
	c0	mpyhs $r0.36 = $r0.28, $r0.23
	c0	mpyhs $r0.37 = $r0.28, $r0.13
;;
	c0	mpylu $r0.38 = $r0.28, $r0.15
	c0	mpyhs $r0.39 = $r0.28, $r0.15
;;
	c0	add $r0.34 = $r0.34, $r0.37
	c0	add $r0.32 = $r0.32, $r0.33
	c0	add $r0.33 = $r0.35, $r0.36
	c0	add $r0.30 = $r0.30, $r0.31
	c0	mpylu $r0.31 = $r0.28, $r0.19
	c0	mpyhs $r0.35 = $r0.29, $r0.23
	c0	mpylu $r0.36 = $r0.29, $r0.23
	c0	mpyhs $r0.28 = $r0.28, $r0.19
;;
	c0	add $r0.32 = $r0.32, $r0.34
	c0	add $r0.33 = $r0.30, $r0.33
	c0	add $r0.34 = $r0.38, $r0.39
;;
	c0	cmpltu $r0.30 = $r0.33, $r0.30
	c0	shl $r0.37 = $r0.32, $r0.12
	c0	add $r0.28 = $r0.31, $r0.28
	c0	add $r0.31 = $r0.36, $r0.35
	c0	shru $r0.35 = $r0.33, $r0.12
	c0	shl $r0.33 = $r0.33, $r0.12
;;
	c0	shl $r0.30 = $r0.30, $r0.12
	c0	add $r0.34 = $r0.37, $r0.34
	c0	add $r0.28 = $r0.33, $r0.28
;;
	c0	or $r0.30 = $r0.30, $r0.35
	c0	add $r0.31 = $r0.34, $r0.31
	c0	cmpltu $r0.33 = $r0.28, $r0.33
;;
	c0	add $r0.30 = $r0.31, $r0.30
;;
	c0	add $r0.30 = $r0.30, $r0.33
	c0	mpyhs $r0.31 = $r0.29, $r0.13
	c0	mpylu $r0.29 = $r0.29, $r0.13
	c0	shru $r0.28 = $r0.28, $r0.27
;;
	c0	shl $r0.33 = $r0.30, $r0.26
	c0	add $r0.10 = $r0.10, -29
	c0	shl $r0.7 = $r0.7, $r0.26
;;
	c0	or $r0.7 = $r0.7, $r0.11
	c0	add $r0.11 = $r0.29, $r0.31
	c0	or $r0.28 = $r0.33, $r0.28
	c0	shru $r0.29 = $r0.32, $r0.12
;;
	c0	add $r0.11 = $r0.29, $r0.11
	c0	cmpltu $r0.29 = $r0.34, $r0.37
;;
	c0	add $r0.29 = $r0.11, $r0.29
	c0	shru $r0.27 = $r0.30, $r0.27
	c0	cmpltu $b0.2 = $r0.30, $r0.34
	c0	cmpne $r0.30 = $r0.28, 0
	c0	sub $r0.11 = $r0.16, $r0.28
;;
;;
	c0	mfb $r0.28 = $b0.2
	c0	mtb $b0.2 = $r0.30
;;
	c0	add $r0.28 = $r0.29, $r0.28
;;
	c0	shl $r0.26 = $r0.28, $r0.26
	c0	slct $r0.28 = $b0.2, $r0.18, 0
;;
	c0	or $r0.26 = $r0.26, $r0.27
	c0	add $r0.7 = $r0.28, $r0.7
;;
	c0	sub $r0.7 = $r0.7, $r0.26
	c0	br $b0.1, LBB63_56
;;
LBB63_65:                               ## %while.end
	c0	cmplt $b0.0 = $r0.10, -31
;;
;;
	c0	br $b0.0, LBB63_88
;;
## BB#66:                               ## %if.then.57
	c0	cmpleu $b0.0 = $r0.9, $r0.7
;;
;;
	c0	br $b0.0, LBB63_67
;;
## BB#68:                               ## %if.end.i
	c0	mov $r0.15 = 16
;;
	c0	shru $r0.12 = $r0.5, $r0.15
;;
	c0	shl $r0.14 = $r0.12, $r0.15
;;
	c0	cmpleu $b0.0 = $r0.14, $r0.7
;;
;;
	c0	br $b0.0, LBB63_69
;;
## BB#70:                               ## %cond.false.i.213
	c0	cmplt $r0.13 = $r0.12, $r0.0
	c0	mov $r0.16 = 0
;;
	c0	shru $r0.17 = $r0.7, $r0.13
	c0	mtb $b0.0 = $r0.16
	c0	shru $r0.18 = $r0.12, $r0.13
	c0	mtb $b0.1 = $r0.16
;;
;;
	c0	addcg $r0.16, $b0.0 = $r0.17, $r0.17, $b0.0
;;
	c0	divs $r0.17, $b0.0 = $r0.0, $r0.18, $b0.0
	c0	addcg $r0.19, $b0.1 = $r0.16, $r0.16, $b0.1
;;
	c0	addcg $r0.16, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.16, $b0.0 = $r0.17, $r0.18, $b0.0
;;
	c0	addcg $r0.17, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.16, $b0.0 = $r0.16, $r0.18, $b0.0
;;
	c0	addcg $r0.17, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.16, $b0.0 = $r0.16, $r0.18, $b0.0
;;
	c0	addcg $r0.17, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.16, $b0.0 = $r0.16, $r0.18, $b0.0
;;
	c0	addcg $r0.17, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.16, $b0.0 = $r0.16, $r0.18, $b0.0
;;
	c0	addcg $r0.17, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.16, $b0.0 = $r0.16, $r0.18, $b0.0
;;
	c0	addcg $r0.17, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.16, $b0.0 = $r0.16, $r0.18, $b0.0
;;
	c0	addcg $r0.17, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.16, $b0.0 = $r0.16, $r0.18, $b0.0
;;
	c0	addcg $r0.17, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.16, $b0.0 = $r0.16, $r0.18, $b0.0
;;
	c0	addcg $r0.17, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.16, $b0.0 = $r0.16, $r0.18, $b0.0
;;
	c0	addcg $r0.17, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.16, $b0.0 = $r0.16, $r0.18, $b0.0
;;
	c0	addcg $r0.17, $b0.2 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.18, $b0.1
	c0	mtb $b0.0 = $r0.13
;;
	c0	addcg $r0.13, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.16, $b0.2 = $r0.16, $r0.18, $b0.2
;;
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.18, $b0.1
	c0	addcg $r0.17, $b0.2 = $r0.13, $r0.13, $b0.2
;;
	c0	addcg $r0.13, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.16, $b0.2 = $r0.16, $r0.18, $b0.2
;;
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.18, $b0.1
	c0	addcg $r0.17, $b0.2 = $r0.13, $r0.13, $b0.2
;;
	c0	addcg $r0.13, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.16, $b0.2 = $r0.16, $r0.18, $b0.2
;;
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.18, $b0.1
	c0	addcg $r0.17, $b0.2 = $r0.13, $r0.13, $b0.2
;;
	c0	addcg $r0.13, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.16, $b0.2 = $r0.16, $r0.18, $b0.2
	c0	cmpgeu $r0.17 = $r0.7, $r0.12
;;
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.18, $b0.1
	c0	addcg $r0.18, $b0.2 = $r0.13, $r0.13, $b0.2
;;
	c0	cmpge $b0.2 = $r0.16, $r0.0
	c0	addcg $r0.13, $b0.1 = $r0.18, $r0.18, $b0.1
;;
	c0	orc $r0.13 = $r0.13, $r0.0
;;
	c0	mfb $r0.16 = $b0.2
;;
	c0	sh1add $r0.13 = $r0.13, $r0.16
;;
	c0	slct $r0.13 = $b0.0, $r0.17, $r0.13
;;
	c0	shl $r0.13 = $r0.13, $r0.15
	c0	goto LBB63_71
;;
LBB63_88:                               ## %if.else.72
	c0	mov $r0.5 = 3
	c0	mov $r0.10 = 8
	c0	mov $r0.12 = 24
;;
	c0	shru $r0.9 = $r0.9, $r0.10
	c0	shru $r0.11 = $r0.11, $r0.10
	c0	shl $r0.8 = $r0.8, $r0.12
	c0	shl $r0.12 = $r0.7, $r0.12
	c0	shru $r0.10 = $r0.7, $r0.10
	c0	shl $r0.5 = $r0.6, $r0.5
;;
	c0	and $r0.5 = $r0.5, 16777208
	c0	or $r0.7 = $r0.12, $r0.11
;;
	c0	or $r0.8 = $r0.8, $r0.5
	c0	goto LBB63_89
;;
LBB63_67:
	c0	mov $r0.12 = -1
	c0	goto LBB63_78
;;
LBB63_69:
	c0	mov $r0.13 = -65536
;;
LBB63_71:                               ## %cond.end.i
	c0	shru $r0.16 = $r0.13, $r0.15
	c0	zxth $r0.17 = $r0.9
	c0	mov $r0.18 = -1
;;
	c0	mpyhs $r0.19 = $r0.16, $r0.12
	c0	mpyhs $r0.20 = $r0.16, $r0.17
	c0	mpylu $r0.17 = $r0.16, $r0.17
	c0	mpylu $r0.16 = $r0.16, $r0.12
;;
;;
	c0	add $r0.17 = $r0.17, $r0.20
	c0	add $r0.16 = $r0.16, $r0.19
;;
	c0	shl $r0.19 = $r0.17, $r0.15
	c0	shru $r0.17 = $r0.17, $r0.15
	c0	sub $r0.20 = $r0.7, $r0.16
;;
	c0	cmpltu $r0.21 = $r0.11, $r0.19
	c0	sub $r0.16 = $r0.11, $r0.19
	c0	sub $r0.17 = $r0.20, $r0.17
;;
	c0	mtb $b0.0 = $r0.21
;;
;;
	c0	slct $r0.18 = $b0.0, $r0.18, 0
;;
	c0	add $r0.17 = $r0.17, $r0.18
;;
	c0	cmpgt $b0.0 = $r0.17, -1
;;
;;
	c0	br $b0.0, LBB63_74
;;
## BB#72:                               ## %while.body.lr.ph.i
	c0	shl $r0.18 = $r0.9, $r0.15
;;
LBB63_73:                               ## %while.body.i
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.16 = $r0.16, $r0.18
	c0	add $r0.17 = $r0.17, $r0.12
	c0	add $r0.13 = $r0.13, -65536
;;
	c0	cmpltu $r0.19 = $r0.16, $r0.18
;;
	c0	add $r0.17 = $r0.17, $r0.19
;;
	c0	cmplt $b0.0 = $r0.17, 0
;;
;;
	c0	br $b0.0, LBB63_73
;;
LBB63_74:                               ## %while.end.i
	c0	shl $r0.17 = $r0.17, $r0.15
	c0	shru $r0.15 = $r0.16, $r0.15
;;
	c0	or $r0.15 = $r0.15, $r0.17
;;
	c0	cmpleu $b0.0 = $r0.14, $r0.15
;;
;;
	c0	br $b0.0, LBB63_75
;;
## BB#76:                               ## %cond.false.10.i
	c0	cmplt $r0.14 = $r0.12, $r0.0
	c0	mov $r0.16 = 0
;;
	c0	shru $r0.17 = $r0.15, $r0.14
	c0	mtb $b0.0 = $r0.16
	c0	shru $r0.18 = $r0.12, $r0.14
	c0	mtb $b0.1 = $r0.16
;;
;;
	c0	addcg $r0.16, $b0.0 = $r0.17, $r0.17, $b0.0
;;
	c0	divs $r0.17, $b0.0 = $r0.0, $r0.18, $b0.0
	c0	addcg $r0.19, $b0.1 = $r0.16, $r0.16, $b0.1
;;
	c0	addcg $r0.16, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.16, $b0.0 = $r0.17, $r0.18, $b0.0
;;
	c0	addcg $r0.17, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.16, $b0.0 = $r0.16, $r0.18, $b0.0
;;
	c0	addcg $r0.17, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.16, $b0.0 = $r0.16, $r0.18, $b0.0
;;
	c0	addcg $r0.17, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.16, $b0.0 = $r0.16, $r0.18, $b0.0
;;
	c0	addcg $r0.17, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.16, $b0.0 = $r0.16, $r0.18, $b0.0
;;
	c0	addcg $r0.17, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.16, $b0.0 = $r0.16, $r0.18, $b0.0
;;
	c0	addcg $r0.17, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.16, $b0.0 = $r0.16, $r0.18, $b0.0
;;
	c0	addcg $r0.17, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.16, $b0.0 = $r0.16, $r0.18, $b0.0
;;
	c0	addcg $r0.17, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.16, $b0.0 = $r0.16, $r0.18, $b0.0
;;
	c0	addcg $r0.17, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.16, $b0.0 = $r0.16, $r0.18, $b0.0
;;
	c0	addcg $r0.17, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.16, $b0.0 = $r0.16, $r0.18, $b0.0
;;
	c0	addcg $r0.17, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.16, $b0.0 = $r0.16, $r0.18, $b0.0
;;
	c0	addcg $r0.17, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.16, $b0.2 = $r0.16, $r0.18, $b0.0
	c0	mtb $b0.0 = $r0.14
;;
	c0	addcg $r0.14, $b0.2 = $r0.19, $r0.19, $b0.2
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.18, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.14, $b0.2 = $r0.16, $r0.18, $b0.2
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.18, $b0.1
	c0	addcg $r0.16, $b0.2 = $r0.17, $r0.17, $b0.2
;;
	c0	addcg $r0.17, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.14, $b0.2 = $r0.14, $r0.18, $b0.2
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.18, $b0.1
	c0	cmpgeu $r0.12 = $r0.15, $r0.12
	c0	addcg $r0.15, $b0.2 = $r0.17, $r0.17, $b0.2
;;
	c0	cmpge $b0.2 = $r0.14, $r0.0
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
;;
	c0	orc $r0.14 = $r0.14, $r0.0
;;
	c0	mfb $r0.15 = $b0.2
;;
	c0	sh1add $r0.14 = $r0.14, $r0.15
;;
	c0	slct $r0.12 = $b0.0, $r0.12, $r0.14
	c0	goto LBB63_77
;;
LBB63_75:
	c0	mov $r0.12 = 65535
;;
LBB63_77:                               ## %cond.end.12.i
	c0	or $r0.12 = $r0.12, $r0.13
;;
LBB63_78:                               ## %estimateDiv64To32.exit
	c0	mov $r0.14 = 3
	c0	cmpgtu $b0.0 = $r0.12, 4
	c0	add $r0.15 = $r0.12, -4
	c0	mov $r0.12 = 0
	c0	mov $r0.13 = 24
	c0	cmpgt $b0.1 = $r0.10, -25
	c0	mov $r0.16 = 8
;;
	c0	shl $r0.8 = $r0.8, $r0.13
	c0	sub $r0.17 = $r0.12, $r0.10
	c0	shl $r0.14 = $r0.6, $r0.14
	c0	shru $r0.9 = $r0.9, $r0.16
;;
	c0	and $r0.6 = $r0.14, 16777208
	c0	slct $r0.15 = $b0.0, $r0.15, 0
;;
	c0	or $r0.8 = $r0.8, $r0.6
	c0	shru $r0.25 = $r0.15, $r0.17
	c0	br $b0.1, LBB63_84
;;
## BB#79:                               ## %if.then.69
	c0	mov $r0.6 = -24
;;
	c0	sub $r0.6 = $r0.6, $r0.10
;;
	c0	cmpeq $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB63_80
;;
## BB#81:                               ## %if.else.i
	c0	cmpgt $b0.0 = $r0.6, 31
;;
;;
	c0	br $b0.0, LBB63_83
;;
## BB#82:                               ## %if.then.2.i
	c0	sub $r0.10 = $r0.12, $r0.6
	c0	shru $r0.11 = $r0.11, $r0.6
	c0	shru $r0.12 = $r0.7, $r0.6
;;
	c0	and $r0.6 = $r0.10, 31
;;
	c0	shl $r0.6 = $r0.7, $r0.6
;;
	c0	or $r0.6 = $r0.6, $r0.11
	c0	goto LBB63_87
;;
LBB63_84:                               ## %if.else
	c0	add $r0.12 = $r0.10, 24
;;
	c0	cmpeq $b0.0 = $r0.12, 0
	c0	shl $r0.6 = $r0.11, $r0.12
;;
;;
	c0	br $b0.0, LBB63_85
;;
## BB#86:                               ## %cond.false.i
	c0	mov $r0.15 = -24
	c0	shl $r0.7 = $r0.7, $r0.12
;;
	c0	sub $r0.10 = $r0.15, $r0.10
;;
	c0	and $r0.10 = $r0.10, 31
;;
	c0	shru $r0.10 = $r0.11, $r0.10
;;
	c0	or $r0.12 = $r0.10, $r0.7
	c0	goto LBB63_87
;;
LBB63_80:
	c0	mov $r0.6 = $r0.11
	c0	mov $r0.12 = $r0.7
	c0	goto LBB63_87
;;
LBB63_85:
	c0	mov $r0.12 = $r0.7
	c0	goto LBB63_87
;;
LBB63_83:                               ## %if.else.4.i
	c0	and $r0.10 = $r0.6, 31
	c0	cmplt $b0.0 = $r0.6, 64
;;
	c0	shru $r0.6 = $r0.7, $r0.10
;;
	c0	slct $r0.6 = $b0.0, $r0.6, 0
;;
LBB63_87:                               ## %if.end.71
	c0	mov $r0.7 = 16
	c0	and $r0.10 = $r0.14, 65528
	c0	zxth $r0.11 = $r0.25
	c0	shru $r0.5 = $r0.5, $r0.13
	c0	zxth $r0.13 = $r0.9
;;
	c0	shru $r0.14 = $r0.25, $r0.7
	c0	shru $r0.15 = $r0.8, $r0.7
	c0	mpylu $r0.16 = $r0.11, $r0.10
	c0	mpyhs $r0.17 = $r0.11, $r0.10
	c0	mpylu $r0.18 = $r0.11, $r0.5
	c0	mpyhs $r0.5 = $r0.11, $r0.5
;;
	c0	mpylu $r0.19 = $r0.11, $r0.15
	c0	mpyhs $r0.20 = $r0.11, $r0.15
	c0	mpylu $r0.21 = $r0.14, $r0.10
	c0	mpyhs $r0.10 = $r0.14, $r0.10
;;
	c0	mpylu $r0.22 = $r0.14, $r0.13
;;
	c0	add $r0.19 = $r0.19, $r0.20
	c0	mpyhs $r0.20 = $r0.14, $r0.13
	c0	mpyhs $r0.23 = $r0.11, $r0.13
	c0	mpylu $r0.11 = $r0.11, $r0.13
	c0	add $r0.10 = $r0.21, $r0.10
	c0	mpyhs $r0.13 = $r0.14, $r0.15
;;
	c0	mpylu $r0.14 = $r0.14, $r0.15
	c0	add $r0.15 = $r0.10, $r0.19
	c0	mov $r0.19 = -1
	c0	add $r0.16 = $r0.16, $r0.17
;;
	c0	shl $r0.17 = $r0.15, $r0.7
	c0	add $r0.11 = $r0.11, $r0.23
	c0	add $r0.5 = $r0.18, $r0.5
;;
	c0	add $r0.13 = $r0.14, $r0.13
	c0	add $r0.14 = $r0.22, $r0.20
;;
	c0	add $r0.11 = $r0.13, $r0.11
	c0	add $r0.5 = $r0.14, $r0.5
	c0	cmpltu $r0.10 = $r0.15, $r0.10
	c0	add $r0.13 = $r0.17, $r0.16
	c0	shru $r0.14 = $r0.15, $r0.7
;;
	c0	shl $r0.5 = $r0.5, $r0.7
	c0	shl $r0.10 = $r0.10, $r0.7
;;
	c0	add $r0.5 = $r0.11, $r0.5
	c0	cmpltu $r0.11 = $r0.6, $r0.13
	c0	cmpltu $r0.15 = $r0.13, $r0.17
	c0	sub $r0.7 = $r0.6, $r0.13
	c0	or $r0.6 = $r0.10, $r0.14
;;
	c0	mtb $b0.0 = $r0.11
	c0	mtb $b0.1 = $r0.15
	c0	add $r0.5 = $r0.5, $r0.6
;;
;;
	c0	mfb $r0.6 = $b0.1
	c0	slct $r0.10 = $b0.0, $r0.19, 0
;;
	c0	sub $r0.5 = $r0.6, $r0.5
;;
	c0	add $r0.5 = $r0.5, $r0.12
;;
	c0	add $r0.10 = $r0.5, $r0.10
;;
LBB63_89:                               ## %do.body.preheader
	c0	shru $r0.3 = $r0.3, $r0.4
	c0	mov $r0.11 = -1
;;
LBB63_90:                               ## %do.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	mov $r0.6 = $r0.7
	c0	mov $r0.5 = $r0.10
;;
	c0	cmpltu $r0.7 = $r0.6, $r0.8
	c0	sub $r0.10 = $r0.5, $r0.9
;;
	c0	mtb $b0.0 = $r0.7
	c0	add $r0.25 = $r0.25, 1
	c0	sub $r0.7 = $r0.6, $r0.8
;;
;;
	c0	slct $r0.12 = $b0.0, $r0.11, 0
;;
	c0	add $r0.10 = $r0.10, $r0.12
;;
	c0	cmpgt $b0.0 = $r0.10, -1
;;
;;
	c0	br $b0.0, LBB63_90
;;
## BB#91:                               ## %do.end
	c0	add $r0.9 = $r0.7, $r0.6
	c0	add $r0.8 = $r0.10, $r0.5
;;
	c0	cmpltu $r0.12 = $r0.9, $r0.7
;;
	c0	add $r0.12 = $r0.8, $r0.12
;;
	c0	cmplt $b0.0 = $r0.12, 0
;;
;;
	c0	br $b0.0, LBB63_94
;;
## BB#92:                               ## %lor.lhs.false.78
	c0	and $r0.13 = $r0.25, 1
	c0	mov $r0.8 = 1
;;
	c0	cmpeq $b0.0 = $r0.13, 0
;;
;;
	c0	br $b0.0, LBB63_95
;;
## BB#93:                               ## %lor.lhs.false.78
	c0	or $r0.9 = $r0.12, $r0.9
;;
	c0	cmpne $b0.0 = $r0.9, 0
;;
;;
	c0	br $b0.0, LBB63_95
;;
LBB63_94:                               ## %if.end.85
	c0	cmpgt $b0.0 = $r0.5, -1
	c0	mov $r0.10 = $r0.5
	c0	shru $r0.8 = $r0.5, $r0.4
	c0	mov $r0.7 = $r0.6
;;
;;
	c0	br $b0.0, LBB63_96
;;
LBB63_95:                               ## %if.then.89
	c0	cmpne $r0.4 = $r0.7, 0
	c0	mov $r0.5 = 0
;;
	c0	mtb $b0.0 = $r0.4
	c0	sub $r0.6 = $r0.5, $r0.7
;;
;;
	c0	slct $r0.4 = $b0.0, $r0.11, 0
;;
	c0	sub $r0.5 = $r0.4, $r0.10
;;
LBB63_96:                               ## %if.end.90
	c0	add $r0.4 = $r0.2, -4
	c0	xor $r0.3 = $r0.8, $r0.3
;;
.call normalizeRoundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = normalizeRoundAndPackFloat64
;;
LBB63_97:                               ## %cleanup
.return ret($r0.3:u32,$r0.4:u32)
	c0	or $r0.4 = $r0.57, $r0.4
	c0	ldw $r0.57 = 28[$r0.1]
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @normalizeRoundAndPackFloat64
normalizeRoundAndPackFloat64::
## BB#0:                                ## %entry
	c0	mov $r0.2 = 16
	c0	mov $r0.8 = 8
	c0	mov $r0.9 = 22
	c0	mov $r0.10 = countLeadingZeros32.countLeadingZerosHigh
	c0	mov $r0.11 = 4
	c0	cmpeq $b0.0 = $r0.5, 0
	c0	mov $r0.7 = 0
;;
;;
	c0	slct $r0.5 = $b0.0, $r0.6, $r0.5
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
	c0	shl $r0.8 = $r0.12, $r0.11
;;
	c0	add $r0.2 = $r0.10, $r0.2
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
	c0	br $b0.1, LBB64_3
;;
## BB#1:                                ## %if.then.3
	c0	cmpeq $b0.0 = $r0.2, 0
	c0	shl $r0.6 = $r0.8, $r0.2
;;
;;
	c0	br $b0.0, LBB64_13
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
.call roundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0	or $r0.5 = $r0.8, $r0.5
	c0	sub $r0.4 = $r0.4, $r0.2
	c0	add $r0.1 = $r0.1, 0
	c0	call $l0.0 = roundAndPackFloat64
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB64_3:                                ## %if.else
	c0	mov $r0.6 = 11
;;
	c0	sub $r0.6 = $r0.6, $r0.9
;;
	c0	cmpeq $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB64_4
;;
## BB#5:                                ## %if.else.i
	c0	sub $r0.7 = $r0.7, $r0.6
	c0	cmpgt $b0.0 = $r0.6, 31
;;
	c0	and $r0.9 = $r0.7, 31
;;
	c0	br $b0.0, LBB64_7
;;
## BB#6:                                ## %if.then.2.i
	c0	shru $r0.10 = $r0.8, $r0.6
	c0	shl $r0.11 = $r0.5, $r0.9
	c0	shl $r0.9 = $r0.8, $r0.9
	c0	shru $r0.7 = $r0.5, $r0.6
	c0	mov $r0.8 = 0
;;
	c0	or $r0.5 = $r0.11, $r0.10
	c0	goto LBB64_12
;;
LBB64_4:
.call roundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0	mov $r0.6 = $r0.8
	c0	sub $r0.4 = $r0.4, $r0.2
	c0	add $r0.1 = $r0.1, 0
	c0	call $l0.0 = roundAndPackFloat64
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB64_7:                                ## %if.else.5.i
	c0	cmpeq $b0.0 = $r0.6, 32
	c0	mov $r0.7 = 0
;;
;;
	c0	brf $b0.0, LBB64_9
;;
## BB#8:
	c0	mov $r0.9 = $r0.8
	c0	mov $r0.8 = $r0.7
	c0	goto LBB64_12
;;
LBB64_9:                                ## %if.else.8.i
	c0	cmpgt $b0.0 = $r0.6, 63
;;
;;
	c0	br $b0.0, LBB64_11
;;
## BB#10:                               ## %if.then.11.i
	c0	and $r0.6 = $r0.6, 31
	c0	shl $r0.9 = $r0.5, $r0.9
;;
	c0	shru $r0.5 = $r0.5, $r0.6
	c0	goto LBB64_12
;;
LBB64_11:                               ## %if.else.15.i
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
LBB64_12:                               ## %if.end.19.i
	c0	cmpne $b0.0 = $r0.8, 0
	c0	mov $r0.6 = $r0.5
	c0	mov $r0.5 = $r0.7
;;
;;
	c0	mfb $r0.7 = $b0.0
;;
	c0	or $r0.7 = $r0.7, $r0.9
;;
LBB64_13:                               ## %if.end.5
.call roundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0	sub $r0.4 = $r0.4, $r0.2
	c0	add $r0.1 = $r0.1, 0
	c0	call $l0.0 = roundAndPackFloat64
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
	c0	stw 28[$r0.1] = $r0.57
	c0	mov $r0.2 = 20
	c0	mov $r0.6 = 31
;;
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	and $r0.5 = $r0.2, 2047
;;
	c0	cmpne $b0.0 = $r0.5, 2047
	c0	and $r0.9 = $r0.3, 1048575
	c0	shru $r0.2 = $r0.3, $r0.6
;;
;;
	c0	br $b0.0, LBB65_11
;;
## BB#1:                                ## %if.then
	c0	or $r0.5 = $r0.9, $r0.4
;;
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB65_9
;;
## BB#2:                                ## %if.then.4
	c0	and $r0.2 = $r0.3, 2146959360
	c0	mov $r0.57 = 0
;;
	c0	xor $r0.2 = $r0.2, 2146435072
	c0	mtb $b0.0 = $r0.57
;;
	c0	cmpne $b0.1 = $r0.2, 0
;;
;;
	c0	br $b0.1, LBB65_6
;;
## BB#3:                                ## %land.rhs.i.61.i
	c0	cmpeq $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB65_5
;;
## BB#4:                                ## %float64_is_signaling_nan.exit.thread.i
	c0	or $r0.2 = $r0.3, 524288
	c0	goto LBB65_8
;;
LBB65_11:                               ## %if.end.9
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB65_14
;;
## BB#12:                               ## %if.then.11
	c0	or $r0.2 = $r0.9, $r0.4
;;
	c0	or $r0.2 = $r0.2, $r0.5
;;
LBB65_9:                                ## %if.end
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB65_10
;;
## BB#13:                               ## %invalid
	c0	mov $r0.3 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.3]
	c0	mov $r0.5 = -1
	c0	mov $r0.2 = 2147483647
	c0	mov $r0.57 = 0
;;
;;
	c0	or $r0.4 = $r0.4, 16
;;
	c0	stw 0[$r0.3] = $r0.4
	c0	goto LBB65_60
;;
LBB65_14:                               ## %if.end.17
	c0	cmpne $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB65_24
;;
## BB#15:                               ## %if.then.19
	c0	or $r0.7 = $r0.9, $r0.4
	c0	mov $r0.5 = 0
;;
	c0	mov $r0.2 = $r0.5
	c0	mov $r0.57 = $r0.5
	c0	cmpeq $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB65_60
;;
## BB#16:                               ## %if.end.24
	c0	cmpne $b0.0 = $r0.9, 0
;;
;;
	c0	brf $b0.0, LBB65_17
;;
## BB#21:                               ## %if.else.7.i
	c0	cmpltu $b0.0 = $r0.9, 65536
	c0	mov $r0.2 = 16
	c0	mov $r0.5 = 8
	c0	mov $r0.7 = 22
	c0	mov $r0.8 = countLeadingZeros32.countLeadingZerosHigh
	c0	mov $r0.10 = 4
;;
	c0	shl $r0.2 = $r0.3, $r0.2
;;
	c0	mfb $r0.3 = $b0.0
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.9
;;
	c0	cmpltu $b0.0 = $r0.2, 16777216
	c0	shl $r0.5 = $r0.2, $r0.5
	c0	shl $r0.3 = $r0.3, $r0.10
;;
	c0	or $r0.10 = $r0.3, 8
;;
	c0	slct $r0.2 = $b0.0, $r0.5, $r0.2
	c0	slct $r0.3 = $b0.0, $r0.10, $r0.3
;;
	c0	shru $r0.2 = $r0.2, $r0.7
;;
	c0	and $r0.2 = $r0.2, 1020
;;
	c0	add $r0.2 = $r0.8, $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
;;
	c0	add $r0.2 = $r0.2, $r0.3
;;
	c0	add $r0.3 = $r0.2, -11
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB65_23
;;
## BB#22:                               ## %cond.false.i.i
	c0	mov $r0.5 = 11
	c0	shl $r0.7 = $r0.9, $r0.3
;;
	c0	sub $r0.5 = $r0.5, $r0.2
;;
	c0	and $r0.5 = $r0.5, 31
;;
	c0	shru $r0.5 = $r0.4, $r0.5
;;
	c0	or $r0.9 = $r0.5, $r0.7
;;
LBB65_23:                               ## %shortShift64Left.exit.i
	c0	mov $r0.5 = 12
	c0	shl $r0.4 = $r0.4, $r0.3
;;
	c0	sub $r0.5 = $r0.5, $r0.2
	c0	goto LBB65_24
;;
LBB65_10:                               ## %if.then.7
	c0	mov $r0.5 = $r0.4
	c0	mov $r0.57 = 0
	c0	mov $r0.2 = $r0.3
	c0	goto LBB65_60
;;
LBB65_5:                                ## %lor.rhs.i.i
	c0	and $r0.2 = $r0.3, 524287
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
LBB65_6:                                ## %float64_is_signaling_nan.exit.i
	c0	or $r0.2 = $r0.3, 524288
	c0	br $b0.0, LBB65_8
;;
## BB#7:                                ## %float64_is_signaling_nan.exit.i
	c0	mfb $r0.3 = $b0.0
;;
	c0	cmpne $b0.0 = $r0.3, 1
;;
;;
	c0	br $b0.0, LBB65_59
;;
LBB65_8:                                ## %if.then.i.266
	c0	mov $r0.3 = float_exception_flags
;;
	c0	ldw $r0.5 = 0[$r0.3]
;;
;;
	c0	or $r0.5 = $r0.5, 16
;;
	c0	stw 0[$r0.3] = $r0.5
	c0	goto LBB65_59
;;
LBB65_17:                               ## %if.then.i.250
	c0	mov $r0.2 = 16
	c0	cmpltu $b0.0 = $r0.4, 65536
	c0	mov $r0.3 = 8
	c0	mov $r0.5 = 22
	c0	mov $r0.7 = countLeadingZeros32.countLeadingZerosHigh
	c0	mov $r0.8 = 4
;;
	c0	shl $r0.2 = $r0.4, $r0.2
;;
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.4
;;
	c0	cmpltu $b0.1 = $r0.2, 16777216
	c0	shl $r0.3 = $r0.2, $r0.3
;;
;;
	c0	slct $r0.2 = $b0.1, $r0.3, $r0.2
;;
	c0	shru $r0.2 = $r0.2, $r0.5
	c0	mfb $r0.3 = $b0.0
;;
	c0	and $r0.2 = $r0.2, 1020
	c0	shl $r0.3 = $r0.3, $r0.8
;;
	c0	add $r0.2 = $r0.7, $r0.2
	c0	or $r0.5 = $r0.3, 8
;;
	c0	ldw $r0.2 = 0[$r0.2]
	c0	slct $r0.3 = $b0.1, $r0.5, $r0.3
;;
;;
	c0	add $r0.2 = $r0.2, $r0.3
;;
	c0	cmpgt $b0.0 = $r0.2, 10
	c0	add $r0.3 = $r0.2, -11
;;
;;
	c0	br $b0.0, LBB65_19
;;
## BB#18:                               ## %if.then.2.i
	c0	mov $r0.5 = 11
	c0	and $r0.3 = $r0.3, 31
;;
	c0	sub $r0.5 = $r0.5, $r0.2
;;
	c0	shru $r0.9 = $r0.4, $r0.5
	c0	shl $r0.4 = $r0.4, $r0.3
	c0	goto LBB65_20
;;
LBB65_19:                               ## %if.else.i.255
	c0	mov $r0.5 = 0
	c0	shl $r0.9 = $r0.4, $r0.3
;;
	c0	mov $r0.4 = $r0.5
;;
LBB65_20:                               ## %if.end.i.256
	c0	mov $r0.3 = -20
;;
	c0	sub $r0.5 = $r0.3, $r0.2
;;
LBB65_24:                               ## %if.end.25
	c0	and $r0.8 = $r0.5, 1
	c0	mov $r0.2 = 16
	c0	mov $r0.10 = 21
	c0	or $r0.7 = $r0.9, 1048576
	c0	mov $r0.11 = 6
	c0	mov $r0.12 = 11
	c0	mov $r0.3 = 1
;;
	c0	add $r0.5 = $r0.5, -1023
	c0	shru $r0.13 = $r0.4, $r0.10
	c0	cmpeq $b0.0 = $r0.8, 0
	c0	shru $r0.9 = $r0.9, $r0.2
	c0	shru $r0.11 = $r0.7, $r0.11
	c0	shl $r0.12 = $r0.7, $r0.12
;;
	c0	and $r0.10 = $r0.9, 15
	c0	and $r0.11 = $r0.11, 32767
	c0	or $r0.9 = $r0.13, $r0.12
;;
	c0	brf $b0.0, LBB65_25
;;
## BB#28:                               ## %if.else.i
	c0	mov $r0.12 = estimateSqrt32.sqrtEvenAdjustments
	c0	or $r0.11 = $r0.11, 32768
	c0	mov $r0.13 = 0
;;
	c0	sh1add $r0.10 = $r0.10, $r0.12
	c0	mtb $b0.0 = $r0.13
	c0	mtb $b0.1 = $r0.13
;;
	c0	ldhu $r0.10 = 0[$r0.10]
;;
;;
	c0	sub $r0.10 = $r0.11, $r0.10
;;
	c0	cmplt $r0.11 = $r0.10, $r0.0
;;
	c0	shru $r0.12 = $r0.9, $r0.11
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
	c0	cmpgeu $r0.12 = $r0.9, $r0.10
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
;;
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.13, $b0.2
	c0	mov $r0.15 = 15
;;
	c0	addcg $r0.16, $b0.2 = $r0.14, $r0.14, $b0.2
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.13, $b0.1
;;
	c0	addcg $r0.14, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.13, $b0.2
;;
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.13, $b0.1
	c0	addcg $r0.16, $b0.2 = $r0.14, $r0.14, $b0.2
;;
	c0	addcg $r0.14, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.13, $b0.2
;;
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.13, $b0.1
	c0	addcg $r0.16, $b0.2 = $r0.14, $r0.14, $b0.2
;;
	c0	addcg $r0.14, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.13, $b0.2
;;
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.13, $b0.1
	c0	addcg $r0.13, $b0.2 = $r0.14, $r0.14, $b0.2
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
;;
	c0	add $r0.10 = $r0.10, $r0.11
	c0	mov $r0.11 = -32768
;;
	c0	cmpgtu $b0.0 = $r0.10, 131071
	c0	shl $r0.10 = $r0.10, $r0.15
;;
;;
	c0	slct $r0.10 = $b0.0, $r0.11, $r0.10
;;
	c0	cmpgtu $b0.0 = $r0.10, $r0.9
;;
;;
	c0	br $b0.0, LBB65_26
;;
## BB#29:                               ## %if.then.18.i
	c0	shr $r0.9 = $r0.9, $r0.3
	c0	goto LBB65_41
;;
LBB65_25:                               ## %if.then.i
	c0	mov $r0.12 = estimateSqrt32.sqrtOddAdjustments
	c0	add $r0.11 = $r0.11, 16384
	c0	mov $r0.13 = 0
;;
	c0	sh1add $r0.10 = $r0.10, $r0.12
	c0	mtb $b0.0 = $r0.13
	c0	mtb $b0.1 = $r0.13
;;
	c0	ldhu $r0.10 = 0[$r0.10]
;;
;;
	c0	sub $r0.10 = $r0.11, $r0.10
;;
	c0	cmplt $r0.11 = $r0.10, $r0.0
;;
	c0	shru $r0.12 = $r0.9, $r0.11
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
;;
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
	c0	addcg $r0.15, $b0.0 = $r0.16, $r0.16, $b0.0
;;
	c0	addcg $r0.16, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.12, $r0.13, $b0.0
	c0	mov $r0.15 = 15
	c0	cmpgeu $r0.17 = $r0.9, $r0.10
;;
	c0	shl $r0.10 = $r0.10, $r0.15
	c0	mtb $b0.2 = $r0.11
	c0	shru $r0.9 = $r0.9, $r0.3
	c0	divs $r0.11, $b0.1 = $r0.12, $r0.13, $b0.1
	c0	addcg $r0.12, $b0.0 = $r0.16, $r0.16, $b0.0
;;
	c0	cmpge $b0.0 = $r0.11, $r0.0
	c0	addcg $r0.11, $b0.1 = $r0.12, $r0.12, $b0.1
;;
	c0	orc $r0.11 = $r0.11, $r0.0
;;
	c0	mfb $r0.12 = $b0.0
;;
	c0	sh1add $r0.11 = $r0.11, $r0.12
;;
	c0	slct $r0.11 = $b0.2, $r0.17, $r0.11
;;
	c0	shl $r0.11 = $r0.11, $r0.14
;;
	c0	add $r0.10 = $r0.10, $r0.11
;;
LBB65_26:                               ## %if.end.20.i
	c0	cmpleu $b0.0 = $r0.10, $r0.9
;;
;;
	c0	br $b0.0, LBB65_27
;;
## BB#30:                               ## %if.end.i.193
	c0	shru $r0.11 = $r0.10, $r0.2
;;
	c0	shl $r0.13 = $r0.11, $r0.2
;;
	c0	cmpleu $b0.0 = $r0.13, $r0.9
;;
;;
	c0	br $b0.0, LBB65_31
;;
## BB#32:                               ## %cond.false.i.196
	c0	cmplt $r0.12 = $r0.11, $r0.0
	c0	mov $r0.14 = 0
;;
	c0	shru $r0.15 = $r0.9, $r0.12
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
	c0	cmpgeu $r0.15 = $r0.9, $r0.11
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
	c0	goto LBB65_33
;;
LBB65_27:
	c0	mov $r0.9 = 2147483647
	c0	goto LBB65_40
;;
LBB65_31:
	c0	mov $r0.12 = -65536
;;
LBB65_33:                               ## %cond.end.i.211
	c0	shru $r0.14 = $r0.12, $r0.2
	c0	zxth $r0.15 = $r0.10
	c0	mov $r0.16 = -1
;;
	c0	mpyhs $r0.17 = $r0.14, $r0.11
	c0	mpyhs $r0.18 = $r0.14, $r0.15
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
	c0	sub $r0.14 = $r0.9, $r0.14
;;
	c0	cmpne $r0.19 = $r0.17, 0
	c0	sub $r0.9 = $r0.18, $r0.17
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
	c0	br $b0.0, LBB65_36
;;
## BB#34:                               ## %while.body.lr.ph.i.213
	c0	shl $r0.15 = $r0.10, $r0.2
;;
LBB65_35:                               ## %while.body.i.224
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.9 = $r0.9, $r0.15
	c0	add $r0.14 = $r0.14, $r0.11
	c0	add $r0.12 = $r0.12, -65536
;;
	c0	cmpltu $r0.16 = $r0.9, $r0.15
;;
	c0	add $r0.14 = $r0.14, $r0.16
;;
	c0	cmplt $b0.0 = $r0.14, 0
;;
;;
	c0	br $b0.0, LBB65_35
;;
LBB65_36:                               ## %while.end.i.232
	c0	shl $r0.14 = $r0.14, $r0.2
	c0	shru $r0.9 = $r0.9, $r0.2
;;
	c0	or $r0.9 = $r0.9, $r0.14
;;
	c0	cmpleu $b0.0 = $r0.13, $r0.9
;;
;;
	c0	br $b0.0, LBB65_37
;;
## BB#38:                               ## %cond.false.10.i.234
	c0	cmplt $r0.13 = $r0.11, $r0.0
	c0	mov $r0.14 = 0
;;
	c0	shru $r0.15 = $r0.9, $r0.13
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
	c0	cmpgeu $r0.9 = $r0.9, $r0.11
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
	c0	slct $r0.9 = $b0.0, $r0.9, $r0.11
	c0	goto LBB65_39
;;
LBB65_37:
	c0	mov $r0.9 = 65535
;;
LBB65_39:                               ## %cond.end.12.i.237
	c0	or $r0.9 = $r0.9, $r0.12
;;
	c0	shru $r0.9 = $r0.9, $r0.3
;;
LBB65_40:                               ## %estimateDiv64To32.exit239
	c0	shru $r0.10 = $r0.10, $r0.3
;;
	c0	add $r0.9 = $r0.9, $r0.10
;;
LBB65_41:                               ## %estimateSqrt32.exit
	c0	shru $r0.9 = $r0.9, $r0.3
	c0	mov $r0.12 = 9
	c0	mov $r0.11 = 17
	c0	mov $r0.57 = 0
	c0	mov $r0.10 = 15
	c0	mov $r0.14 = -1
;;
	c0	add $r0.9 = $r0.9, 1
	c0	sub $r0.8 = $r0.12, $r0.8
;;
	c0	shru $r0.12 = $r0.9, $r0.2
	c0	zxth $r0.13 = $r0.9
	c0	sub $r0.15 = $r0.57, $r0.8
	c0	shl $r0.16 = $r0.4, $r0.8
	c0	shl $r0.7 = $r0.7, $r0.8
;;
	c0	mpylu $r0.8 = $r0.12, $r0.13
	c0	mpyhs $r0.17 = $r0.12, $r0.13
	c0	mpylu $r0.18 = $r0.13, $r0.13
	c0	mpyhs $r0.13 = $r0.13, $r0.13
;;
;;
	c0	add $r0.17 = $r0.8, $r0.17
	c0	mpylu $r0.19 = $r0.12, $r0.12
	c0	mpyhs $r0.12 = $r0.12, $r0.12
;;
	c0	shl $r0.8 = $r0.17, $r0.3
;;
	c0	cmpltu $b0.0 = $r0.8, $r0.17
	c0	add $r0.13 = $r0.18, $r0.13
	c0	shl $r0.18 = $r0.17, $r0.11
	c0	shr $r0.8 = $r0.5, $r0.3
	c0	shl $r0.5 = $r0.9, $r0.3
	c0	and $r0.15 = $r0.15, 31
;;
	c0	shru $r0.4 = $r0.4, $r0.15
	c0	add $r0.12 = $r0.19, $r0.12
;;
	c0	or $r0.4 = $r0.4, $r0.7
	c0	shru $r0.7 = $r0.17, $r0.10
	c0	add $r0.13 = $r0.18, $r0.13
;;
	c0	sub $r0.4 = $r0.4, $r0.12
	c0	zxth $r0.12 = $r0.7
	c0	cmpltu $r0.15 = $r0.13, $r0.18
	c0	cmpltu $r0.17 = $r0.16, $r0.13
	c0	sub $r0.7 = $r0.16, $r0.13
;;
	c0	mtb $b0.1 = $r0.17
	c0	mfb $r0.13 = $b0.0
	c0	mtb $b0.0 = $r0.15
;;
	c0	shl $r0.13 = $r0.13, $r0.2
;;
	c0	mfb $r0.15 = $b0.0
	c0	slct $r0.16 = $b0.1, $r0.14, 0
	c0	or $r0.12 = $r0.13, $r0.12
;;
	c0	add $r0.4 = $r0.4, $r0.15
;;
	c0	add $r0.4 = $r0.4, $r0.16
;;
	c0	sub $r0.4 = $r0.4, $r0.12
;;
	c0	cmpgt $b0.0 = $r0.4, -1
;;
;;
	c0	br $b0.0, LBB65_43
;;
LBB65_42:                               ## %while.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.12 = $r0.5, -1
;;
	c0	add $r0.7 = $r0.12, $r0.7
	c0	add $r0.9 = $r0.9, -1
	c0	add $r0.5 = $r0.5, -2
;;
	c0	cmpltu $r0.12 = $r0.7, $r0.12
;;
	c0	add $r0.4 = $r0.12, $r0.4
;;
	c0	cmplt $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB65_42
;;
LBB65_43:                               ## %while.end
	c0	cmpleu $b0.0 = $r0.5, $r0.7
	c0	add $r0.4 = $r0.8, 1022
;;
;;
	c0	br $b0.0, LBB65_58
;;
## BB#44:                               ## %if.end.i
	c0	shru $r0.8 = $r0.5, $r0.2
;;
	c0	shl $r0.16 = $r0.8, $r0.2
;;
	c0	cmpleu $b0.0 = $r0.16, $r0.7
;;
;;
	c0	br $b0.0, LBB65_45
;;
## BB#46:                               ## %cond.false.i
	c0	cmplt $r0.12 = $r0.8, $r0.0
	c0	mov $r0.13 = 0
;;
	c0	shru $r0.14 = $r0.7, $r0.12
	c0	mtb $b0.0 = $r0.13
	c0	shru $r0.15 = $r0.8, $r0.12
	c0	mtb $b0.1 = $r0.13
;;
;;
	c0	addcg $r0.13, $b0.0 = $r0.14, $r0.14, $b0.0
;;
	c0	divs $r0.14, $b0.0 = $r0.0, $r0.15, $b0.0
	c0	addcg $r0.17, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	addcg $r0.13, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.15, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.14, $r0.15, $b0.0
;;
	c0	addcg $r0.14, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.15, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.15, $b0.0
;;
	c0	addcg $r0.14, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.15, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.15, $b0.0
;;
	c0	addcg $r0.14, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.15, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.15, $b0.0
;;
	c0	addcg $r0.14, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.15, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.15, $b0.0
;;
	c0	addcg $r0.14, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.15, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.15, $b0.0
;;
	c0	addcg $r0.14, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.15, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.15, $b0.0
;;
	c0	addcg $r0.14, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.15, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.15, $b0.0
;;
	c0	addcg $r0.14, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.15, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.15, $b0.0
;;
	c0	addcg $r0.14, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.15, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.15, $b0.0
;;
	c0	addcg $r0.14, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.15, $b0.1
;;
	c0	addcg $r0.17, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.15, $b0.0
;;
	c0	addcg $r0.14, $b0.2 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.15, $b0.1
	c0	mtb $b0.0 = $r0.12
;;
	c0	addcg $r0.12, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.15, $b0.2
;;
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.15, $b0.1
	c0	addcg $r0.14, $b0.2 = $r0.12, $r0.12, $b0.2
;;
	c0	addcg $r0.12, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.15, $b0.2
;;
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.15, $b0.1
	c0	addcg $r0.14, $b0.2 = $r0.12, $r0.12, $b0.2
;;
	c0	addcg $r0.12, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.15, $b0.2
;;
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.15, $b0.1
	c0	addcg $r0.14, $b0.2 = $r0.12, $r0.12, $b0.2
;;
	c0	addcg $r0.12, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.15, $b0.2
	c0	cmpgeu $r0.14 = $r0.7, $r0.8
;;
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.15, $b0.1
	c0	addcg $r0.15, $b0.2 = $r0.12, $r0.12, $b0.2
;;
	c0	cmpge $b0.2 = $r0.13, $r0.0
	c0	addcg $r0.12, $b0.1 = $r0.15, $r0.15, $b0.1
;;
	c0	orc $r0.12 = $r0.12, $r0.0
;;
	c0	mfb $r0.13 = $b0.2
;;
	c0	sh1add $r0.12 = $r0.12, $r0.13
;;
	c0	slct $r0.12 = $b0.0, $r0.14, $r0.12
;;
	c0	shl $r0.14 = $r0.12, $r0.2
	c0	goto LBB65_47
;;
LBB65_45:
	c0	mov $r0.14 = -65536
;;
LBB65_47:                               ## %cond.end.i
	c0	shru $r0.13 = $r0.14, $r0.2
	c0	and $r0.15 = $r0.5, 65534
	c0	mov $r0.12 = -1
;;
	c0	mpylu $r0.17 = $r0.13, $r0.8
	c0	mpyhs $r0.18 = $r0.13, $r0.15
	c0	mpylu $r0.19 = $r0.13, $r0.15
	c0	mpyhs $r0.20 = $r0.13, $r0.8
;;
;;
	c0	add $r0.18 = $r0.19, $r0.18
	c0	mov $r0.13 = 0
	c0	add $r0.17 = $r0.17, $r0.20
;;
	c0	shl $r0.19 = $r0.18, $r0.2
	c0	shru $r0.18 = $r0.18, $r0.2
	c0	sub $r0.20 = $r0.7, $r0.17
;;
	c0	cmpne $r0.21 = $r0.19, 0
	c0	sub $r0.17 = $r0.13, $r0.19
	c0	sub $r0.18 = $r0.20, $r0.18
;;
	c0	mtb $b0.0 = $r0.21
;;
;;
	c0	slct $r0.19 = $b0.0, $r0.12, 0
;;
	c0	add $r0.18 = $r0.18, $r0.19
;;
	c0	cmpgt $b0.0 = $r0.18, -1
;;
;;
	c0	br $b0.0, LBB65_50
;;
## BB#48:                               ## %while.body.lr.ph.i
	c0	shl $r0.19 = $r0.5, $r0.2
;;
LBB65_49:                               ## %while.body.i
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.17 = $r0.17, $r0.19
	c0	add $r0.18 = $r0.18, $r0.8
	c0	add $r0.14 = $r0.14, -65536
;;
	c0	cmpltu $r0.20 = $r0.17, $r0.19
;;
	c0	add $r0.18 = $r0.18, $r0.20
;;
	c0	cmplt $b0.0 = $r0.18, 0
;;
;;
	c0	br $b0.0, LBB65_49
;;
LBB65_50:                               ## %while.end.i
	c0	shl $r0.18 = $r0.18, $r0.2
	c0	shru $r0.17 = $r0.17, $r0.2
;;
	c0	or $r0.17 = $r0.17, $r0.18
;;
	c0	cmpleu $b0.0 = $r0.16, $r0.17
;;
;;
	c0	br $b0.0, LBB65_51
;;
## BB#52:                               ## %cond.false.10.i
	c0	cmplt $r0.16 = $r0.8, $r0.0
	c0	mov $r0.18 = 0
;;
	c0	shru $r0.19 = $r0.17, $r0.16
	c0	mtb $b0.0 = $r0.18
	c0	shru $r0.20 = $r0.8, $r0.16
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
	c0	cmpgeu $r0.17 = $r0.17, $r0.8
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
	c0	goto LBB65_53
;;
LBB65_51:
	c0	mov $r0.16 = 65535
;;
LBB65_53:                               ## %estimateDiv64To32.exit
	c0	or $r0.14 = $r0.16, $r0.14
;;
	c0	and $r0.16 = $r0.14, 510
;;
	c0	cmpgtu $b0.0 = $r0.16, 5
;;
;;
	c0	br $b0.0, LBB65_58
;;
## BB#54:                               ## %if.then.41
	c0	cmpeq $b0.0 = $r0.14, 0
;;
;;
	c0	slct $r0.16 = $b0.0, $r0.3, $r0.14
;;
	c0	zxth $r0.17 = $r0.16
	c0	shru $r0.18 = $r0.16, $r0.2
;;
	c0	mpyhs $r0.19 = $r0.18, $r0.17
	c0	mpylu $r0.20 = $r0.18, $r0.17
	c0	mpyhs $r0.21 = $r0.17, $r0.8
	c0	mpylu $r0.22 = $r0.17, $r0.8
;;
	c0	mpylu $r0.23 = $r0.18, $r0.15
	c0	mpyhs $r0.24 = $r0.18, $r0.15
;;
	c0	add $r0.19 = $r0.20, $r0.19
	c0	mpylu $r0.20 = $r0.17, $r0.15
	c0	mpyhs $r0.25 = $r0.17, $r0.17
	c0	mpylu $r0.26 = $r0.17, $r0.17
	c0	mpyhs $r0.15 = $r0.17, $r0.15
;;
	c0	shl $r0.3 = $r0.19, $r0.3
	c0	add $r0.17 = $r0.23, $r0.24
	c0	add $r0.21 = $r0.22, $r0.21
;;
	c0	cmpltu $b0.0 = $r0.3, $r0.19
	c0	mpylu $r0.3 = $r0.18, $r0.18
	c0	mpyhs $r0.22 = $r0.18, $r0.18
	c0	add $r0.23 = $r0.26, $r0.25
	c0	shl $r0.11 = $r0.19, $r0.11
	c0	add $r0.21 = $r0.17, $r0.21
	c0	add $r0.15 = $r0.20, $r0.15
	c0	shru $r0.10 = $r0.19, $r0.10
;;
	c0	shl $r0.19 = $r0.21, $r0.2
	c0	add $r0.20 = $r0.11, $r0.23
;;
	c0	mfb $r0.23 = $b0.0
	c0	mpylu $r0.24 = $r0.18, $r0.8
	c0	add $r0.3 = $r0.3, $r0.22
	c0	zxth $r0.10 = $r0.10
	c0	cmpltu $r0.11 = $r0.20, $r0.11
	c0	add $r0.15 = $r0.19, $r0.15
;;
	c0	shl $r0.22 = $r0.23, $r0.2
	c0	mpyhs $r0.8 = $r0.18, $r0.8
	c0	cmpne $b0.0 = $r0.20, 0
	c0	cmpltu $r0.18 = $r0.15, $r0.19
	c0	cmpne $r0.19 = $r0.15, 0
	c0	add $r0.3 = $r0.11, $r0.3
;;
	c0	mtb $b0.1 = $r0.19
	c0	mtb $b0.2 = $r0.18
	c0	or $r0.10 = $r0.22, $r0.10
	c0	sub $r0.11 = $r0.13, $r0.15
;;
	c0	add $r0.10 = $r0.3, $r0.10
	c0	add $r0.3 = $r0.24, $r0.8
;;
	c0	sub $r0.7 = $r0.7, $r0.3
	c0	shru $r0.8 = $r0.21, $r0.2
	c0	cmpltu $r0.15 = $r0.21, $r0.17
	c0	sub $r0.3 = $r0.13, $r0.20
;;
	c0	shl $r0.2 = $r0.15, $r0.2
	c0	mfb $r0.13 = $b0.0
	c0	sub $r0.15 = $r0.11, $r0.10
;;
	c0	or $r0.2 = $r0.2, $r0.8
;;
	c0	sub $r0.2 = $r0.7, $r0.2
	c0	mfb $r0.7 = $b0.2
	c0	slct $r0.8 = $b0.1, $r0.12, 0
	c0	cmpgtu $r0.10 = $r0.10, $r0.11
;;
	c0	add $r0.7 = $r0.2, $r0.7
	c0	cmpltu $r0.11 = $r0.15, $r0.13
	c0	sub $r0.2 = $r0.15, $r0.13
	c0	mtb $b0.0 = $r0.10
;;
	c0	add $r0.7 = $r0.7, $r0.8
	c0	mtb $b0.1 = $r0.11
;;
	c0	slct $r0.8 = $b0.0, $r0.12, 0
;;
	c0	slct $r0.10 = $b0.1, $r0.12, 0
	c0	add $r0.7 = $r0.7, $r0.8
;;
	c0	add $r0.7 = $r0.7, $r0.10
;;
	c0	cmpgt $b0.0 = $r0.7, -1
;;
;;
	c0	br $b0.0, LBB65_57
;;
## BB#55:                               ## %while.body.47.preheader
	c0	maxu $r0.8 = $r0.14, 1
;;
	c0	sh1add $r0.8 = $r0.8, $r0.12
;;
LBB65_56:                               ## %while.body.47
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.16 = $r0.16, -1
	c0	add $r0.3 = $r0.8, $r0.3
;;
	c0	shru $r0.10 = $r0.16, $r0.6
;;
	c0	or $r0.10 = $r0.10, $r0.5
	c0	cmpltu $r0.11 = $r0.3, $r0.8
;;
	c0	add $r0.2 = $r0.10, $r0.2
	c0	add $r0.8 = $r0.8, -2
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
	c0	br $b0.0, LBB65_56
;;
LBB65_57:                               ## %while.end.51
	c0	or $r0.2 = $r0.2, $r0.7
;;
	c0	or $r0.2 = $r0.2, $r0.3
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	or $r0.14 = $r0.2, $r0.16
;;
LBB65_58:                               ## %if.end.56
	c0	mov $r0.2 = 22
	c0	mov $r0.5 = 10
	c0	mov $r0.3 = $r0.57
;;
	c0	shru $r0.6 = $r0.14, $r0.5
	c0	shru $r0.5 = $r0.9, $r0.5
	c0	shl $r0.7 = $r0.14, $r0.2
	c0	shl $r0.2 = $r0.9, $r0.2
;;
	c0	or $r0.6 = $r0.6, $r0.2
;;
.call roundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = roundAndPackFloat64
;;
	c0	mov $r0.2 = $r0.3
;;
LBB65_59:                               ## %cleanup
	c0	mov $r0.5 = $r0.4
;;
LBB65_60:                               ## %cleanup
.return ret($r0.3:u32,$r0.4:u32)
	c0	or $r0.4 = $r0.57, $r0.5
	c0	mov $r0.3 = $r0.2
	c0	ldw $r0.57 = 28[$r0.1]
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

#.globl float64_eq
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_eq
float64_eq::
## BB#0:                                ## %entry
	c0	andc $r0.2 = $r0.3, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB66_2
;;
## BB#1:                                ## %land.lhs.true
	c0	and $r0.2 = $r0.3, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB66_4
;;
LBB66_2:                                ## %lor.lhs.false
	c0	andc $r0.2 = $r0.5, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB66_13
;;
## BB#3:                                ## %land.lhs.true.5
	c0	and $r0.2 = $r0.5, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB66_13
;;
LBB66_4:                                ## %if.then
	c0	and $r0.2 = $r0.3, 2146959360
;;
	c0	xor $r0.2 = $r0.2, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB66_7
;;
## BB#5:                                ## %land.rhs.i.94
	c0	cmpne $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB66_12
;;
## BB#6:                                ## %land.rhs.i.94
	c0	and $r0.2 = $r0.3, 524287
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB66_12
;;
LBB66_7:                                ## %lor.lhs.false.12
	c0	and $r0.2 = $r0.5, 2146959360
;;
	c0	xor $r0.2 = $r0.2, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB66_8
;;
## BB#9:                                ## %land.rhs.i
	c0	cmpne $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB66_12
;;
## BB#10:                               ## %land.rhs.i
	c0	and $r0.2 = $r0.5, 524287
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB66_12
;;
## BB#11:
.return ret($r0.3:u32)
	c0	mov $r0.3 = 0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB66_13:                               ## %if.end.16
	c0	cmpne $b0.0 = $r0.4, $r0.6
;;
;;
	c0	br $b0.0, LBB66_14
;;
## BB#15:                               ## %land.rhs
	c0	cmpeq $b0.0 = $r0.3, $r0.5
;;
;;
	c0	brf $b0.0, LBB66_17
;;
## BB#16:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB66_12:                               ## %if.then.15
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
LBB66_8:
.return ret($r0.3:u32)
	c0	mov $r0.3 = 0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB66_17:                               ## %lor.rhs
	c0	cmpne $b0.0 = $r0.4, 0
;;
;;
	c0	brf $b0.0, LBB66_18
;;
LBB66_14:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB66_18:                               ## %land.rhs.23
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

#.globl float64_le
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_le
float64_le::
## BB#0:                                ## %entry
	c0	andc $r0.2 = $r0.3, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB67_2
;;
## BB#1:                                ## %land.lhs.true
	c0	and $r0.2 = $r0.3, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB67_4
;;
LBB67_2:                                ## %lor.lhs.false
	c0	andc $r0.2 = $r0.5, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB67_5
;;
## BB#3:                                ## %land.lhs.true.5
	c0	and $r0.2 = $r0.5, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB67_5
;;
LBB67_4:                                ## %if.then
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
LBB67_5:                                ## %if.end
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.7 = $r0.5, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.7
;;
;;
	c0	brf $b0.0, LBB67_6
;;
## BB#9:                                ## %if.end.21
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB67_12
;;
## BB#10:                               ## %cond.true
	c0	cmpltu $b0.0 = $r0.5, $r0.3
;;
;;
	c0	br $b0.0, LBB67_7
;;
## BB#11:                               ## %lor.rhs.i.106
	c0	cmpeq $b0.0 = $r0.5, $r0.3
	c0	cmpleu $b0.1 = $r0.6, $r0.4
	c0	goto LBB67_14
;;
LBB67_6:                                ## %if.then.13
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB67_7
;;
## BB#8:                                ## %lor.rhs
	c0	mov $r0.2 = 1
	c0	or $r0.3 = $r0.5, $r0.3
	c0	or $r0.4 = $r0.6, $r0.4
;;
	c0	shl $r0.2 = $r0.3, $r0.2
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
LBB67_12:                               ## %cond.false
	c0	cmpltu $b0.0 = $r0.3, $r0.5
;;
;;
	c0	brf $b0.0, LBB67_13
;;
LBB67_7:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB67_13:                               ## %lor.rhs.i
	c0	cmpeq $b0.0 = $r0.3, $r0.5
	c0	cmpleu $b0.1 = $r0.4, $r0.6
;;
LBB67_14:                               ## %le64.exit
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
	c0	andc $r0.2 = $r0.3, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 0
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
	c0	andc $r0.2 = $r0.5, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB68_5
;;
## BB#3:                                ## %land.lhs.true.5
	c0	and $r0.2 = $r0.5, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB68_5
;;
LBB68_4:                                ## %if.then
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
LBB68_5:                                ## %if.end
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.7 = $r0.5, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.7
;;
;;
	c0	brf $b0.0, LBB68_6
;;
## BB#9:                                ## %if.end.21
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB68_13
;;
## BB#10:                               ## %cond.true
	c0	cmpltu $b0.0 = $r0.5, $r0.3
;;
;;
	c0	br $b0.0, LBB68_11
;;
## BB#12:                               ## %lor.rhs.i.106
	c0	cmpeq $b0.0 = $r0.5, $r0.3
	c0	cmpltu $b0.1 = $r0.6, $r0.4
	c0	goto LBB68_15
;;
LBB68_6:                                ## %if.then.13
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB68_7
;;
## BB#8:                                ## %land.rhs
	c0	mov $r0.2 = 1
	c0	or $r0.3 = $r0.5, $r0.3
	c0	or $r0.4 = $r0.6, $r0.4
;;
	c0	shl $r0.2 = $r0.3, $r0.2
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
LBB68_13:                               ## %cond.false
	c0	cmpltu $b0.0 = $r0.3, $r0.5
;;
;;
	c0	brf $b0.0, LBB68_14
;;
LBB68_11:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB68_7:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB68_14:                               ## %lor.rhs.i
	c0	cmpeq $b0.0 = $r0.3, $r0.5
	c0	cmpltu $b0.1 = $r0.4, $r0.6
;;
LBB68_15:                               ## %lt64.exit
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
	c0	andc $r0.2 = $r0.3, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 0
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
	c0	andc $r0.2 = $r0.5, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB69_5
;;
## BB#3:                                ## %land.lhs.true.5
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
	c0	cmpne $b0.0 = $r0.4, $r0.6
;;
;;
	c0	br $b0.0, LBB69_6
;;
## BB#7:                                ## %land.rhs
	c0	cmpeq $b0.0 = $r0.3, $r0.5
;;
;;
	c0	brf $b0.0, LBB69_9
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
LBB69_9:                                ## %lor.rhs
	c0	cmpne $b0.0 = $r0.4, 0
;;
;;
	c0	brf $b0.0, LBB69_10
;;
LBB69_6:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB69_10:                               ## %land.rhs.16
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
	c0	andc $r0.2 = $r0.3, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 0
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
	c0	andc $r0.2 = $r0.5, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB70_13
;;
## BB#3:                                ## %land.lhs.true.5
	c0	and $r0.2 = $r0.5, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB70_13
;;
LBB70_4:                                ## %if.then
	c0	and $r0.2 = $r0.3, 2146959360
;;
	c0	xor $r0.2 = $r0.2, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB70_7
;;
## BB#5:                                ## %land.rhs.i.145
	c0	cmpne $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB70_12
;;
## BB#6:                                ## %land.rhs.i.145
	c0	and $r0.2 = $r0.3, 524287
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB70_12
;;
LBB70_7:                                ## %lor.lhs.false.12
	c0	and $r0.2 = $r0.5, 2146959360
;;
	c0	xor $r0.2 = $r0.2, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB70_8
;;
## BB#9:                                ## %land.rhs.i
	c0	cmpne $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB70_12
;;
## BB#10:                               ## %land.rhs.i
	c0	and $r0.2 = $r0.5, 524287
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB70_12
;;
## BB#11:
.return ret($r0.3:u32)
	c0	mov $r0.3 = 0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB70_13:                               ## %if.end.16
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.7 = $r0.5, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.7
;;
;;
	c0	brf $b0.0, LBB70_14
;;
## BB#17:                               ## %if.end.28
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB70_20
;;
## BB#18:                               ## %cond.true
	c0	cmpltu $b0.0 = $r0.5, $r0.3
;;
;;
	c0	br $b0.0, LBB70_15
;;
## BB#19:                               ## %lor.rhs.i.131
	c0	cmpeq $b0.0 = $r0.5, $r0.3
	c0	cmpleu $b0.1 = $r0.6, $r0.4
	c0	goto LBB70_22
;;
LBB70_14:                               ## %if.then.20
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB70_15
;;
## BB#16:                               ## %lor.rhs
	c0	mov $r0.2 = 1
	c0	or $r0.3 = $r0.5, $r0.3
	c0	or $r0.4 = $r0.6, $r0.4
;;
	c0	shl $r0.2 = $r0.3, $r0.2
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
LBB70_12:                               ## %if.then.15
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
LBB70_8:
.return ret($r0.3:u32)
	c0	mov $r0.3 = 0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB70_20:                               ## %cond.false
	c0	cmpltu $b0.0 = $r0.3, $r0.5
;;
;;
	c0	brf $b0.0, LBB70_21
;;
LBB70_15:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB70_21:                               ## %lor.rhs.i
	c0	cmpeq $b0.0 = $r0.3, $r0.5
	c0	cmpleu $b0.1 = $r0.4, $r0.6
;;
LBB70_22:                               ## %le64.exit
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

#.globl float64_lt_quiet
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_lt_quiet
float64_lt_quiet::
## BB#0:                                ## %entry
	c0	andc $r0.2 = $r0.3, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 0
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
	c0	andc $r0.2 = $r0.5, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB71_13
;;
## BB#3:                                ## %land.lhs.true.5
	c0	and $r0.2 = $r0.5, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB71_13
;;
LBB71_4:                                ## %if.then
	c0	and $r0.2 = $r0.3, 2146959360
;;
	c0	xor $r0.2 = $r0.2, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB71_7
;;
## BB#5:                                ## %land.rhs.i.145
	c0	cmpne $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB71_12
;;
## BB#6:                                ## %land.rhs.i.145
	c0	and $r0.2 = $r0.3, 524287
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB71_12
;;
LBB71_7:                                ## %lor.lhs.false.12
	c0	and $r0.2 = $r0.5, 2146959360
;;
	c0	xor $r0.2 = $r0.2, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB71_8
;;
## BB#9:                                ## %land.rhs.i
	c0	cmpne $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB71_12
;;
## BB#10:                               ## %land.rhs.i
	c0	and $r0.2 = $r0.5, 524287
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB71_12
;;
## BB#11:
.return ret($r0.3:u32)
	c0	mov $r0.3 = 0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB71_13:                               ## %if.end.16
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.7 = $r0.5, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.7
;;
;;
	c0	brf $b0.0, LBB71_14
;;
## BB#17:                               ## %if.end.28
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB71_21
;;
## BB#18:                               ## %cond.true
	c0	cmpltu $b0.0 = $r0.5, $r0.3
;;
;;
	c0	br $b0.0, LBB71_19
;;
## BB#20:                               ## %lor.rhs.i.131
	c0	cmpeq $b0.0 = $r0.5, $r0.3
	c0	cmpltu $b0.1 = $r0.6, $r0.4
	c0	goto LBB71_23
;;
LBB71_14:                               ## %if.then.20
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB71_15
;;
## BB#16:                               ## %land.rhs
	c0	mov $r0.2 = 1
	c0	or $r0.3 = $r0.5, $r0.3
	c0	or $r0.4 = $r0.6, $r0.4
;;
	c0	shl $r0.2 = $r0.3, $r0.2
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
LBB71_12:                               ## %if.then.15
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
LBB71_8:
.return ret($r0.3:u32)
	c0	mov $r0.3 = 0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB71_21:                               ## %cond.false
	c0	cmpltu $b0.0 = $r0.3, $r0.5
;;
;;
	c0	brf $b0.0, LBB71_22
;;
LBB71_19:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB71_15:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB71_22:                               ## %lor.rhs.i
	c0	cmpeq $b0.0 = $r0.3, $r0.5
	c0	cmpltu $b0.1 = $r0.4, $r0.6
;;
LBB71_23:                               ## %lt64.exit
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

	.section	.bss .section .data
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
	.align	16                      ## @countLeadingZeros32.countLeadingZerosHigh
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

	.align	16                      ## @estimateSqrt32.sqrtOddAdjustments
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

	.align	16                      ## @estimateSqrt32.sqrtEvenAdjustments
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
