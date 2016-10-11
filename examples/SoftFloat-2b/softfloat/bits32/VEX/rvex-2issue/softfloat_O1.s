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
;;
	c0	cmpne $b0.0 = $r0.2, 0
	c0	shru $r0.4 = $r0.4, $r0.5
;;
	c0	shru $r0.2 = $r0.3, $r0.5
	c0	or $r0.3 = $r0.8, $r0.4
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
;;
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
;;
	c0	mov $r0.2 = 0
;;
	c0	mfb $r0.4 = $b0.0
;;
	c0	slct $r0.4 = $b0.1, $r0.3, $r0.4
	c0	mov $r0.3 = $r0.2
;;
LBB3_7:                                 ## %if.end.19
	c0	cmpne $b0.0 = $r0.5, 0
	c0	mov $r0.6 = $r0.3
;;
	c0	mov $r0.3 = $r0.2
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
	c0	shl $r0.3 = $r0.3, $r0.5
;;
	c0	and $r0.2 = $r0.2, 31
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
;;
	c0	shl $r0.3 = $r0.3, $r0.6
	c0	shl $r0.10 = $r0.5, $r0.6
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
;;
	c0	cmpltu $r0.4 = $r0.2, $r0.6
	c0	add $r0.3 = $r0.5, $r0.3
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
;;
	c0	cmpltu $r0.5 = $r0.2, $r0.8
	c0	add $r0.4 = $r0.7, $r0.4
;;
	c0	add $r0.8 = $r0.5, $r0.4
	c0	cmpltu $r0.4 = $r0.4, $r0.7
;;
	c0	add $r0.3 = $r0.6, $r0.3
	c0	ldw $r0.6 = 16[$r0.1]
;;
	c0	add $r0.3 = $r0.3, $r0.4
	c0	cmpltu $r0.4 = $r0.8, $r0.5
;;
	c0	stw 0[$r0.6] = $r0.2
	c0	add $r0.2 = $r0.3, $r0.4
;;
	c0	stw 0[$r0.10] = $r0.8
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
	c0	cmpltu $r0.2 = $r0.4, $r0.6
	c0	mov $r0.9 = -1
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
	c0	slct $r0.2 = $b0.0, $r0.9, 0
	c0	sub $r0.3 = $r0.3, $r0.5
;;
	c0	sub $r0.4 = $r0.4, $r0.6
	c0	add $r0.2 = $r0.3, $r0.2
;;
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
;;
;;
	c0	mfb $r0.2 = $b0.0
	c0	sub $r0.11 = $r0.4, $r0.7
;;
	c0	cmpltu $r0.4 = $r0.4, $r0.7
	c0	cmpltu $r0.7 = $r0.11, $r0.2
;;
	c0	mtb $b0.0 = $r0.4
	c0	mov $r0.4 = -1
;;
	c0	mtb $b0.1 = $r0.7
;;
	c0	slct $r0.7 = $b0.0, $r0.4, 0
	c0	sub $r0.3 = $r0.3, $r0.6
;;
	c0	slct $r0.4 = $b0.1, $r0.4, 0
	c0	add $r0.3 = $r0.3, $r0.7
;;
	c0	ldw $r0.6 = 16[$r0.1]
	c0	sub $r0.5 = $r0.5, $r0.8
;;
;;
	c0	stw 0[$r0.6] = $r0.5
	c0	sub $r0.2 = $r0.11, $r0.2
;;
	c0	add $r0.3 = $r0.3, $r0.4
	c0	stw 0[$r0.10] = $r0.2
;;
.return ret()
	c0	stw 0[$r0.9] = $r0.3
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
;;
	c0	shru $r0.7 = $r0.4, $r0.2
	c0	zxth $r0.8 = $r0.3
;;
	c0	shru $r0.3 = $r0.3, $r0.2
	c0	zxth $r0.4 = $r0.4
;;
	c0	mpyhs $r0.9 = $r0.7, $r0.8
	c0	mpylu $r0.10 = $r0.7, $r0.8
;;
	c0	mpylu $r0.11 = $r0.4, $r0.3
	c0	mpyhs $r0.12 = $r0.4, $r0.3
;;
	c0	mpyhs $r0.13 = $r0.4, $r0.8
	c0	mpylu $r0.4 = $r0.4, $r0.8
;;
	c0	mpyhs $r0.8 = $r0.7, $r0.3
	c0	mpylu $r0.3 = $r0.7, $r0.3
;;
	c0	add $r0.4 = $r0.4, $r0.13
	c0	add $r0.7 = $r0.11, $r0.12
;;
	c0	add $r0.9 = $r0.10, $r0.9
	c0	add $r0.3 = $r0.3, $r0.8
;;
	c0	add $r0.7 = $r0.9, $r0.7
;;
	c0	cmpltu $r0.8 = $r0.7, $r0.9
	c0	shl $r0.9 = $r0.7, $r0.2
;;
	c0	shru $r0.7 = $r0.7, $r0.2
	c0	shl $r0.2 = $r0.8, $r0.2
;;
	c0	add $r0.4 = $r0.9, $r0.4
	c0	or $r0.2 = $r0.2, $r0.7
;;
	c0	cmpltu $r0.7 = $r0.4, $r0.9
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
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @mul64By32To96
mul64By32To96::
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
	c0	add $r0.2 = $r0.1, 52
;;
	c0	add $r0.57 = $r0.1, 56
	c0	stw 44[$r0.1] = $r0.6
;;
	c0	mov $r0.59 = $r0.5
	c0	mov $r0.5 = $r0.4
;;
	c0	mov $r0.60 = $r0.3
	c0	add $r0.61 = $r0.1, 48
;;
	c0	mov $r0.62 = $r0.7
	c0	mov $r0.63 = $r0.8
;;
	c0	add $r0.58 = $r0.1, 60
	c0	mov $r0.4 = $r0.59
;;
	c0	mov $r0.3 = $r0.5
	c0	mov $r0.5 = $r0.57
;;
	c0	mov $r0.6 = $r0.2
;;
.call mul32To64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret()
	c0	call $l0.0 = mul32To64
;;
	c0	mov $r0.5 = $r0.58
	c0	mov $r0.4 = $r0.59
;;
	c0	mov $r0.3 = $r0.60
	c0	mov $r0.6 = $r0.61
;;
.call mul32To64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret()
	c0	call $l0.0 = mul32To64
;;
	c0	ldw $r0.6 = 56[$r0.1]
	c0	mov $r0.5 = 0
;;
	c0	ldw $r0.4 = 48[$r0.1]
;;
	c0	ldw $r0.3 = 60[$r0.1]
	c0	mov $r0.7 = $r0.58
;;
	c0	mov $r0.8 = $r0.57
;;
.call add64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = add64
;;
	c0	ldw $r0.2 = 52[$r0.1]
;;
;;
	c0	stw 0[$r0.63] = $r0.2
;;
	c0	ldw $r0.2 = 56[$r0.1]
;;
;;
	c0	stw 0[$r0.62] = $r0.2
;;
	c0	ldw $r0.2 = 60[$r0.1]
;;
	c0	ldw $r0.3 = 44[$r0.1]
;;
;;
	c0	stw 0[$r0.3] = $r0.2
;;
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
.return ret()
	c0	ldw $r0.57 = 92[$r0.1]
	c0	return $r0.1 = $r0.1, 96, $l0.0
;;
.endp

#.globl mul64To128
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @mul64To128
mul64To128::
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
	c0	add $r0.2 = $r0.1, 48
;;
	c0	add $r0.57 = $r0.1, 52
	c0	stw 16[$r0.1] = $r0.6
;;
	c0	mov $r0.59 = $r0.5
	c0	mov $r0.60 = $r0.4
;;
	c0	stw 20[$r0.1] = $r0.3
	c0	mov $r0.62 = 0
;;
	c0	add $r0.63 = $r0.1, 56
	c0	add $r0.58 = $r0.1, 40
;;
	c0	stw 36[$r0.1] = $r0.7
;;
	c0	stw 32[$r0.1] = $r0.8
;;
	c0	stw 28[$r0.1] = $r0.9
;;
	c0	stw 24[$r0.1] = $r0.10
	c0	add $r0.61 = $r0.1, 44
;;
	c0	mov $r0.4 = $r0.6
	c0	mov $r0.3 = $r0.60
;;
	c0	mov $r0.6 = $r0.2
	c0	mov $r0.5 = $r0.57
;;
.call mul32To64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret()
	c0	call $l0.0 = mul32To64
;;
	c0	mov $r0.5 = $r0.63
	c0	mov $r0.4 = $r0.59
;;
	c0	mov $r0.3 = $r0.60
	c0	mov $r0.6 = $r0.58
;;
.call mul32To64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret()
	c0	call $l0.0 = mul32To64
;;
	c0	ldw $r0.6 = 52[$r0.1]
;;
	c0	ldw $r0.4 = 40[$r0.1]
;;
	c0	ldw $r0.3 = 56[$r0.1]
	c0	mov $r0.8 = $r0.57
;;
	c0	mov $r0.7 = $r0.63
	c0	mov $r0.5 = $r0.62
;;
.call add64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	add $r0.60 = $r0.1, 60
	c0	call $l0.0 = add64
;;
	c0	mov $r0.5 = $r0.60
	c0	mov $r0.4 = $r0.59
;;
	c0	ldw $r0.59 = 20[$r0.1]
;;
;;
	c0	mov $r0.3 = $r0.59
	c0	mov $r0.6 = $r0.61
;;
.call mul32To64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret()
	c0	call $l0.0 = mul32To64
;;
	c0	ldw $r0.6 = 56[$r0.1]
;;
	c0	ldw $r0.4 = 44[$r0.1]
;;
	c0	ldw $r0.3 = 60[$r0.1]
	c0	mov $r0.7 = $r0.60
;;
	c0	mov $r0.5 = $r0.62
	c0	mov $r0.8 = $r0.63
;;
.call add64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = add64
;;
	c0	mov $r0.5 = $r0.61
	c0	ldw $r0.4 = 16[$r0.1]
;;
	c0	mov $r0.3 = $r0.59
	c0	mov $r0.6 = $r0.58
;;
.call mul32To64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret()
	c0	call $l0.0 = mul32To64
;;
	c0	ldw $r0.6 = 52[$r0.1]
;;
	c0	ldw $r0.4 = 40[$r0.1]
;;
	c0	ldw $r0.3 = 44[$r0.1]
	c0	mov $r0.7 = $r0.61
;;
	c0	mov $r0.5 = $r0.62
	c0	mov $r0.8 = $r0.57
;;
.call add64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = add64
;;
	c0	ldw $r0.6 = 44[$r0.1]
;;
	c0	ldw $r0.4 = 56[$r0.1]
;;
	c0	ldw $r0.3 = 60[$r0.1]
	c0	mov $r0.7 = $r0.60
;;
	c0	mov $r0.5 = $r0.62
	c0	mov $r0.8 = $r0.63
;;
.call add64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = add64
;;
	c0	ldw $r0.2 = 48[$r0.1]
;;
	c0	ldw $r0.3 = 24[$r0.1]
;;
;;
	c0	stw 0[$r0.3] = $r0.2
;;
	c0	ldw $r0.2 = 52[$r0.1]
;;
	c0	ldw $r0.3 = 28[$r0.1]
;;
;;
	c0	stw 0[$r0.3] = $r0.2
;;
	c0	ldw $r0.2 = 56[$r0.1]
;;
	c0	ldw $r0.3 = 32[$r0.1]
;;
;;
	c0	stw 0[$r0.3] = $r0.2
;;
	c0	ldw $r0.2 = 60[$r0.1]
;;
	c0	ldw $r0.3 = 36[$r0.1]
;;
;;
	c0	stw 0[$r0.3] = $r0.2
;;
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
.return ret()
	c0	ldw $r0.57 = 92[$r0.1]
	c0	return $r0.1 = $r0.1, 96, $l0.0
;;
.endp

#.globl eq64
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @eq64
eq64::
## BB#0:                                ## %entry
	c0	cmpeq $b0.0 = $r0.3, $r0.5
;;
;;
	c0	mfb $r0.2 = $b0.0
	c0	cmpeq $b0.0 = $r0.4, $r0.6
;;
;;
	c0	mfb $r0.3 = $b0.0
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
;;
;;
	c0	mfb $r0.2 = $b0.0
	c0	cmpne $b0.0 = $r0.4, $r0.6
;;
;;
	c0	mfb $r0.3 = $b0.0
;;
	c0	or $r0.2 = $r0.2, $r0.3
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
;;
	c0	and $r0.3 = $r0.3, 4194303
;;
	c0	cmpeq $b0.0 = $r0.2, 2139095040
;;
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
	c0	cmpne $b0.0 = $r0.2, 2146435072
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
	c0	and $r0.3 = $r0.3, 8388607
;;
.return ret($r0.3:u32)
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
	c0	and $r0.3 = $r0.3, 1048575
;;
.return ret($r0.3:u32)
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
	c0	and $r0.3 = $r0.2, 2047
;;
.return ret($r0.3:u32)
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
	c0	mov $r0.2 = 31
	c0	mov $r0.7 = 20
;;
	c0	shl $r0.4 = $r0.4, $r0.7
	c0	shl $r0.2 = $r0.3, $r0.2
;;
	c0	add $r0.2 = $r0.4, $r0.2
;;
	c0	add $r0.4 = $r0.2, $r0.5
	c0	mov $r0.3 = $r0.6
;;
.return ret($r0.3:u32,$r0.4:u32)
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
	c0	brf $b0.0, LBB31_2
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
LBB31_2:                                ## %entry
	c0	cmpne $b0.0 = $r0.3, -2147483648
;;
;;
	c0	br $b0.0, LBB31_4
;;
## BB#3:                                ## %if.then.2
	c0	mov $r0.5 = 0
	c0	mov $r0.4 = 158
;;
	c0	mov $r0.3 = 1
;;
.call packFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = packFloat32
;;
	c0	ldw $l0.0 = 28[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB31_4:                                ## %if.end.3
	c0	mov $r0.2 = 31
	c0	mov $r0.4 = 156
;;
	c0	shr $r0.5 = $r0.3, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	add $r0.6 = $r0.3, $r0.5
	c0	mov $r0.3 = $r0.2
;;
	c0	xor $r0.5 = $r0.6, $r0.5
;;
.call normalizeRoundAndPackFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = normalizeRoundAndPackFloat32
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
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @normalizeRoundAndPackFloat32
normalizeRoundAndPackFloat32::
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
	c0	mov $r0.57 = $r0.5
;;
	c0	mov $r0.58 = $r0.3
	c0	mov $r0.59 = $r0.4
;;
	c0	mov $r0.3 = $r0.57
;;
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = countLeadingZeros32
;;
	c0	add $r0.2 = $r0.3, -1
	c0	mov $r0.3 = $r0.58
;;
	c0	sub $r0.4 = $r0.59, $r0.2
	c0	shl $r0.5 = $r0.57, $r0.2
;;
	c0	ldw $l0.0 = 16[$r0.1]
;;
	c0	ldw $r0.59 = 20[$r0.1]
;;
	c0	ldw $r0.58 = 24[$r0.1]
;;
	c0	ldw $r0.57 = 28[$r0.1]
	c0	add $r0.1 = $r0.1, 32
;;
.call roundAndPackFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = roundAndPackFloat32
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl int32_to_float64
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @int32_to_float64
int32_to_float64::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 60[$r0.1] = $r0.57
;;
	c0	stw 56[$r0.1] = $r0.58
;;
	c0	stw 52[$r0.1] = $r0.59
;;
	c0	stw 48[$r0.1] = $l0.0
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	brf $b0.0, LBB33_1
;;
## BB#2:                                ## %if.end
	c0	mov $r0.2 = 31
;;
	c0	shr $r0.4 = $r0.3, $r0.2
	c0	shru $r0.57 = $r0.3, $r0.2
;;
	c0	add $r0.2 = $r0.3, $r0.4
;;
	c0	xor $r0.59 = $r0.2, $r0.4
;;
	c0	mov $r0.3 = $r0.59
;;
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = countLeadingZeros32
;;
	c0	mov $r0.58 = $r0.3
;;
	c0	add $r0.2 = $r0.58, -11
;;
	c0	cmplt $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB33_4
;;
## BB#3:                                ## %if.then.6
	c0	shl $r0.2 = $r0.59, $r0.2
	c0	mov $r0.3 = 0
;;
	c0	stw 44[$r0.1] = $r0.2
;;
	c0	stw 40[$r0.1] = $r0.3
	c0	goto LBB33_5
;;
LBB33_1:                                ## %if.then
	c0	mov $r0.3 = 0
;;
	c0	mov $r0.5 = $r0.3
	c0	mov $r0.4 = $r0.3
;;
	c0	mov $r0.6 = $r0.3
	c0	goto LBB33_6
;;
LBB33_4:                                ## %if.else
	c0	mov $r0.2 = 11
	c0	add $r0.7 = $r0.1, 40
;;
	c0	add $r0.6 = $r0.1, 44
	c0	mov $r0.4 = 0
;;
	c0	mov $r0.3 = $r0.59
	c0	sub $r0.5 = $r0.2, $r0.58
;;
.call shift64Right, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = shift64Right
;;
LBB33_5:                                ## %if.end.8
	c0	ldw $r0.6 = 40[$r0.1]
;;
	c0	mov $r0.2 = 1053
;;
	c0	ldw $r0.5 = 44[$r0.1]
	c0	mov $r0.3 = $r0.57
;;
	c0	sub $r0.4 = $r0.2, $r0.58
;;
LBB33_6:                                ## %cleanup
.call packFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = packFloat64
;;
	c0	ldw $l0.0 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
	c0	ldw $r0.57 = 60[$r0.1]
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @countLeadingZeros32
countLeadingZeros32::
## BB#0:                                ## %entry
	c0	mov $r0.2 = 16
;;
	c0	cmpltu $b0.0 = $r0.3, 65536
;;
	c0	shl $r0.2 = $r0.3, $r0.2
	c0	mov $r0.4 = 8
;;
	c0	mov $r0.5 = 22
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.3
;;
	c0	mov $r0.3 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	cmpltu $b0.1 = $r0.2, 16777216
;;
	c0	shl $r0.4 = $r0.2, $r0.4
	c0	mfb $r0.6 = $b0.0
;;
	c0	slct $r0.2 = $b0.1, $r0.4, $r0.2
;;
	c0	shru $r0.2 = $r0.2, $r0.5
	c0	mov $r0.4 = 4
;;
	c0	and $r0.2 = $r0.2, 1020
;;
	c0	shl $r0.4 = $r0.6, $r0.4
	c0	add $r0.2 = $r0.3, $r0.2
;;
	c0	or $r0.3 = $r0.4, 8
	c0	ldw $r0.2 = 0[$r0.2]
;;
	c0	slct $r0.3 = $b0.1, $r0.3, $r0.4
;;
.return ret($r0.3:u32)
	c0	add $r0.3 = $r0.2, $r0.3
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

#.globl float32_to_int32
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_to_int32
float32_to_int32::
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
	c0	stw 44[$r0.1] = $l0.0
	c0	mov $r0.60 = $r0.3
;;
.call extractFloat32Frac, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Frac
;;
	c0	mov $r0.59 = $r0.3
	c0	mov $r0.3 = $r0.60
;;
.call extractFloat32Exp, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Exp
;;
	c0	mov $r0.58 = $r0.3
	c0	mov $r0.3 = $r0.60
;;
.call extractFloat32Sign, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Sign
;;
	c0	add $r0.2 = $r0.58, -150
;;
	c0	cmplt $b0.0 = $r0.2, 0
	c0	mov $r0.57 = $r0.3
;;
;;
	c0	br $b0.0, LBB35_8
;;
## BB#1:                                ## %if.then
	c0	cmplt $b0.0 = $r0.58, 158
;;
;;
	c0	br $b0.0, LBB35_7
;;
## BB#2:                                ## %if.then.4
	c0	cmpeq $b0.0 = $r0.60, -822083584
;;
;;
	c0	br $b0.0, LBB35_6
;;
## BB#3:                                ## %if.then.6
	c0	mov $r0.3 = 16
;;
	c0	mov $r0.60 = 2147483647
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
	c0	cmpeq $b0.0 = $r0.57, 0
;;
;;
	c0	br $b0.0, LBB35_20
;;
## BB#4:                                ## %lor.lhs.false
	c0	cmpeq $b0.0 = $r0.59, 0
;;
;;
	c0	br $b0.0, LBB35_6
;;
## BB#5:                                ## %lor.lhs.false
	c0	cmpeq $b0.0 = $r0.58, 255
;;
;;
	c0	br $b0.0, LBB35_20
;;
LBB35_6:                                ## %if.end.10
	c0	mov $r0.60 = -2147483648
;;
	c0	goto LBB35_20
;;
LBB35_8:                                ## %if.else
	c0	cmpgt $b0.0 = $r0.58, 125
;;
;;
	c0	br $b0.0, LBB35_10
;;
## BB#9:                                ## %if.then.17
	c0	mov $r0.2 = 0
	c0	or $r0.3 = $r0.58, $r0.59
;;
	c0	goto LBB35_11
;;
LBB35_7:                                ## %if.end.11
	c0	or $r0.3 = $r0.59, 8388608
;;
	c0	cmpeq $b0.0 = $r0.57, 0
	c0	shl $r0.2 = $r0.3, $r0.2
;;
	c0	mov $r0.3 = 0
;;
	c0	sub $r0.3 = $r0.3, $r0.2
;;
	c0	slct $r0.60 = $b0.0, $r0.2, $r0.3
	c0	goto LBB35_20
;;
LBB35_10:                               ## %if.else.19
	c0	mov $r0.3 = 150
;;
	c0	or $r0.4 = $r0.59, 8388608
;;
	c0	and $r0.2 = $r0.2, 31
	c0	sub $r0.5 = $r0.3, $r0.58
;;
	c0	shl $r0.3 = $r0.4, $r0.2
	c0	shru $r0.2 = $r0.4, $r0.5
;;
LBB35_11:                               ## %if.end.23
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB35_13
;;
## BB#12:                               ## %if.then.25
	c0	mov $r0.4 = float_exception_flags
;;
	c0	ldw $r0.5 = 0[$r0.4]
;;
;;
	c0	or $r0.5 = $r0.5, 1
;;
	c0	stw 0[$r0.4] = $r0.5
;;
LBB35_13:                               ## %if.end.27
	c0	mov $r0.4 = float_rounding_mode
;;
	c0	ldw $r0.4 = 0[$r0.4]
;;
;;
	c0	cmpne $b0.0 = $r0.4, 0
;;
;;
	c0	brf $b0.0, LBB35_14
;;
## BB#17:                               ## %if.else.42
	c0	cmpeq $b0.0 = $r0.57, 0
;;
;;
	c0	br $b0.0, LBB35_19
;;
## BB#18:                               ## %if.then.45
	c0	cmpeq $b0.0 = $r0.4, 3
	c0	cmpne $b0.1 = $r0.3, 0
;;
;;
	c0	mfb $r0.3 = $b0.0
	c0	mfb $r0.4 = $b0.1
;;
	c0	mov $r0.5 = 0
	c0	and $r0.3 = $r0.4, $r0.3
;;
	c0	and $r0.3 = $r0.3, 1
;;
	c0	add $r0.2 = $r0.2, $r0.3
;;
	c0	sub $r0.60 = $r0.5, $r0.2
	c0	goto LBB35_20
;;
LBB35_14:                               ## %if.then.29
	c0	cmpgt $b0.0 = $r0.3, -1
;;
;;
	c0	br $b0.0, LBB35_16
;;
## BB#15:                               ## %if.then.31
	c0	and $r0.3 = $r0.3, 2147483647
;;
	c0	add $r0.2 = $r0.2, 1
	c0	cmpeq $b0.0 = $r0.3, 0
;;
	c0	and $r0.3 = $r0.2, -2
;;
	c0	slct $r0.2 = $b0.0, $r0.3, $r0.2
;;
LBB35_16:                               ## %if.end.37
	c0	mov $r0.3 = 0
	c0	cmpeq $b0.0 = $r0.57, 0
;;
	c0	sub $r0.3 = $r0.3, $r0.2
;;
	c0	slct $r0.3 = $b0.0, $r0.2, $r0.3
	c0	goto LBB35_21
;;
LBB35_19:                               ## %if.else.50
	c0	cmpeq $b0.0 = $r0.4, 2
	c0	cmpne $b0.1 = $r0.3, 0
;;
;;
	c0	mfb $r0.3 = $b0.0
	c0	mfb $r0.4 = $b0.1
;;
	c0	and $r0.3 = $r0.4, $r0.3
;;
	c0	and $r0.3 = $r0.3, 1
;;
	c0	add $r0.60 = $r0.3, $r0.2
;;
LBB35_20:                               ## %cleanup
	c0	mov $r0.3 = $r0.60
;;
LBB35_21:                               ## %cleanup
	c0	ldw $l0.0 = 44[$r0.1]
;;
	c0	ldw $r0.60 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
.return ret($r0.3:u32)
	c0	ldw $r0.57 = 60[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

#.globl float32_to_int32_round_to_zero
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_to_int32_round_to_zero
float32_to_int32_round_to_zero::
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
	c0	stw 44[$r0.1] = $l0.0
	c0	mov $r0.57 = $r0.3
;;
.call extractFloat32Frac, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Frac
;;
	c0	mov $r0.60 = $r0.3
	c0	mov $r0.3 = $r0.57
;;
.call extractFloat32Exp, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Exp
;;
	c0	mov $r0.58 = $r0.3
	c0	mov $r0.3 = $r0.57
;;
.call extractFloat32Sign, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Sign
;;
	c0	add $r0.2 = $r0.58, -158
;;
	c0	cmplt $b0.0 = $r0.2, 0
	c0	mov $r0.59 = $r0.3
;;
;;
	c0	br $b0.0, LBB36_6
;;
## BB#1:                                ## %if.then
	c0	cmpeq $b0.0 = $r0.57, -822083584
;;
;;
	c0	br $b0.0, LBB36_5
;;
## BB#2:                                ## %if.then.4
	c0	mov $r0.3 = 16
;;
	c0	mov $r0.57 = 2147483647
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
	c0	cmpeq $b0.0 = $r0.59, 0
;;
;;
	c0	br $b0.0, LBB36_12
;;
## BB#3:                                ## %lor.lhs.false
	c0	cmpeq $b0.0 = $r0.60, 0
;;
;;
	c0	br $b0.0, LBB36_5
;;
## BB#4:                                ## %lor.lhs.false
	c0	cmpeq $b0.0 = $r0.58, 255
;;
;;
	c0	br $b0.0, LBB36_12
;;
LBB36_5:                                ## %if.end.8
	c0	mov $r0.57 = -2147483648
;;
	c0	goto LBB36_12
;;
LBB36_6:                                ## %if.else
	c0	cmpgt $b0.0 = $r0.58, 126
;;
;;
	c0	br $b0.0, LBB36_9
;;
## BB#7:                                ## %if.then.10
	c0	or $r0.2 = $r0.58, $r0.60
	c0	mov $r0.57 = 0
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB36_12
;;
## BB#8:                                ## %if.then.12
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.3 = 0[$r0.2]
;;
;;
	c0	or $r0.3 = $r0.3, 1
;;
	c0	stw 0[$r0.2] = $r0.3
	c0	goto LBB36_12
;;
LBB36_9:                                ## %if.end.16
	c0	mov $r0.3 = 8
	c0	and $r0.2 = $r0.2, 31
;;
	c0	shl $r0.3 = $r0.60, $r0.3
	c0	mov $r0.4 = 158
;;
	c0	sub $r0.4 = $r0.4, $r0.58
;;
	c0	or $r0.3 = $r0.3, -2147483648
;;
	c0	shl $r0.5 = $r0.3, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.4
;;
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB36_11
;;
## BB#10:                               ## %if.then.21
	c0	mov $r0.3 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.3]
;;
;;
	c0	or $r0.4 = $r0.4, 1
;;
	c0	stw 0[$r0.3] = $r0.4
;;
LBB36_11:                               ## %if.end.23
	c0	mov $r0.3 = 0
	c0	cmpeq $b0.0 = $r0.59, 0
;;
	c0	sub $r0.3 = $r0.3, $r0.2
;;
	c0	slct $r0.57 = $b0.0, $r0.2, $r0.3
;;
LBB36_12:                               ## %cleanup
	c0	mov $r0.3 = $r0.57
	c0	ldw $l0.0 = 44[$r0.1]
;;
	c0	ldw $r0.60 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
.return ret($r0.3:u32)
	c0	ldw $r0.57 = 60[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

#.globl float32_to_float64
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_to_float64
float32_to_float64::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 60[$r0.1] = $r0.57
;;
	c0	stw 56[$r0.1] = $r0.58
;;
	c0	stw 52[$r0.1] = $r0.59
;;
	c0	stw 48[$r0.1] = $l0.0
	c0	mov $r0.58 = $r0.3
;;
.call extractFloat32Frac, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Frac
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat32Exp, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	stw 40[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat32Exp
;;
	c0	mov $r0.59 = $r0.3
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat32Sign, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	stw 44[$r0.1] = $r0.59
	c0	call $l0.0 = extractFloat32Sign
;;
	c0	cmpeq $b0.0 = $r0.59, 0
	c0	mov $r0.57 = $r0.3
;;
;;
	c0	brf $b0.0, LBB37_1
;;
## BB#5:                                ## %if.then.8
	c0	ldw $r0.3 = 40[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	brf $b0.0, LBB37_6
;;
## BB#7:                                ## %if.end.12
	c0	add $r0.5 = $r0.1, 40
	c0	add $r0.4 = $r0.1, 44
;;
.call normalizeFloat32Subnormal, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret()
	c0	call $l0.0 = normalizeFloat32Subnormal
;;
	c0	ldw $r0.2 = 44[$r0.1]
;;
;;
	c0	add $r0.2 = $r0.2, -1
;;
	c0	stw 44[$r0.1] = $r0.2
	c0	goto LBB37_8
;;
LBB37_1:                                ## %entry
	c0	cmpne $b0.0 = $r0.59, 255
;;
;;
	c0	br $b0.0, LBB37_8
;;
## BB#2:                                ## %if.then
	c0	ldw $r0.2 = 40[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB37_4
;;
## BB#3:                                ## %if.then.3
	c0	add $r0.3 = $r0.1, 16
	c0	mov $r0.4 = $r0.58
;;
.call float32ToCommonNaN, caller, arg($r0.3:u32,$r0.4:u32), ret()
	c0	call $l0.0 = float32ToCommonNaN
;;
	c0	ldw $r0.5 = 24[$r0.1]
;;
	c0	ldw $r0.3 = 16[$r0.1]
;;
	c0	ldw $r0.4 = 20[$r0.1]
;;
.call commonNaNToFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = commonNaNToFloat64
;;
	c0	goto LBB37_10
;;
LBB37_8:                                ## %if.end.13
	c0	ldw $r0.3 = 40[$r0.1]
	c0	mov $r0.5 = 3
;;
	c0	mov $r0.4 = 0
	c0	add $r0.6 = $r0.1, 36
;;
	c0	add $r0.7 = $r0.1, 32
;;
.call shift64Right, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = shift64Right
;;
	c0	ldw $r0.2 = 44[$r0.1]
;;
	c0	ldw $r0.6 = 32[$r0.1]
;;
	c0	ldw $r0.5 = 36[$r0.1]
	c0	mov $r0.3 = $r0.57
;;
	c0	add $r0.4 = $r0.2, 896
;;
	c0	goto LBB37_9
;;
LBB37_6:                                ## %if.then.10
	c0	mov $r0.4 = 0
	c0	mov $r0.3 = $r0.57
;;
	c0	mov $r0.5 = $r0.4
	c0	mov $r0.6 = $r0.4
;;
	c0	goto LBB37_9
;;
LBB37_4:                                ## %if.end
	c0	mov $r0.5 = 0
;;
	c0	mov $r0.4 = 2047
;;
	c0	mov $r0.3 = $r0.57
	c0	mov $r0.6 = $r0.5
;;
LBB37_9:                                ## %cleanup
.call packFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = packFloat64
;;
LBB37_10:                               ## %cleanup
	c0	ldw $l0.0 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
	c0	ldw $r0.57 = 60[$r0.1]
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @commonNaNToFloat64
commonNaNToFloat64::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $r0.57
;;
	c0	stw 24[$r0.1] = $l0.0
	c0	add $r0.6 = $r0.1, 16
;;
	c0	mov $r0.2 = 12
	c0	mov $r0.7 = $r0.4
;;
	c0	mov $r0.57 = $r0.3
	c0	mov $r0.4 = $r0.5
;;
	c0	mov $r0.3 = $r0.7
	c0	or $r0.7 = $r0.6, 4
;;
	c0	mov $r0.5 = $r0.2
;;
.call shift64Right, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = shift64Right
;;
	c0	ldw $r0.2 = 16[$r0.1]
	c0	mov $r0.3 = 31
;;
	c0	shl $r0.3 = $r0.57, $r0.3
;;
	c0	or $r0.2 = $r0.3, $r0.2
;;
	c0	or $r0.3 = $r0.2, 2146959360
;;
	c0	stw 16[$r0.1] = $r0.3
;;
	c0	ldw $r0.4 = 20[$r0.1]
;;
	c0	ldw $l0.0 = 24[$r0.1]
;;
	c0	ldw $r0.57 = 28[$r0.1]
;;
;;
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32ToCommonNaN
float32ToCommonNaN::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $r0.57
;;
	c0	stw 24[$r0.1] = $r0.58
;;
	c0	stw 20[$r0.1] = $l0.0
	c0	mov $r0.57 = $r0.3
;;
	c0	mov $r0.58 = $r0.4
;;
	c0	mov $r0.3 = $r0.58
;;
.call float32_is_signaling_nan, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = float32_is_signaling_nan
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB39_2
;;
## BB#1:                                ## %if.then
	c0	mov $r0.3 = 16
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
LBB39_2:                                ## %if.end
	c0	mov $r0.2 = 31
	c0	mov $r0.3 = 9
;;
	c0	shru $r0.2 = $r0.58, $r0.2
	c0	mov $r0.4 = 0
;;
	c0	stw 0[$r0.57] = $r0.2
	c0	shl $r0.2 = $r0.58, $r0.3
;;
	c0	stw 4[$r0.57] = $r0.2
;;
	c0	stw 8[$r0.57] = $r0.4
;;
	c0	ldw $l0.0 = 20[$r0.1]
;;
	c0	ldw $r0.58 = 24[$r0.1]
;;
	c0	ldw $r0.57 = 28[$r0.1]
;;
;;
.return ret()
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @normalizeFloat32Subnormal
normalizeFloat32Subnormal::
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
	c0	mov $r0.57 = $r0.3
;;
	c0	mov $r0.58 = $r0.5
	c0	mov $r0.59 = $r0.4
;;
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = countLeadingZeros32
;;
	c0	mov $r0.2 = 9
	c0	add $r0.4 = $r0.3, -8
;;
	c0	shl $r0.4 = $r0.57, $r0.4
	c0	sub $r0.2 = $r0.2, $r0.3
;;
	c0	stw 0[$r0.58] = $r0.4
;;
	c0	stw 0[$r0.59] = $r0.2
;;
	c0	ldw $l0.0 = 16[$r0.1]
;;
	c0	ldw $r0.59 = 20[$r0.1]
;;
	c0	ldw $r0.58 = 24[$r0.1]
;;
	c0	ldw $r0.57 = 28[$r0.1]
;;
.return ret()
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

#.globl float32_round_to_int
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_round_to_int
float32_round_to_int::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 60[$r0.1] = $r0.57
;;
	c0	stw 56[$r0.1] = $r0.58
;;
	c0	stw 52[$r0.1] = $r0.59
;;
	c0	stw 48[$r0.1] = $l0.0
	c0	mov $r0.57 = $r0.3
;;
.call extractFloat32Exp, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Exp
;;
	c0	mov $r0.58 = $r0.3
;;
	c0	cmplt $b0.0 = $r0.58, 150
;;
;;
	c0	br $b0.0, LBB41_6
;;
## BB#1:                                ## %if.then
	c0	cmpne $b0.0 = $r0.58, 255
;;
;;
	c0	br $b0.0, LBB41_2
;;
## BB#3:                                ## %land.lhs.true
	c0	mov $r0.3 = $r0.57
;;
.call extractFloat32Frac, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Frac
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB41_4
;;
## BB#5:                                ## %if.then.3
	c0	mov $r0.3 = $r0.57
	c0	mov $r0.4 = $r0.57
;;
.call propagateFloat32NaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = propagateFloat32NaN
;;
	c0	goto LBB41_25
;;
LBB41_6:                                ## %if.end.5
	c0	cmpgt $b0.0 = $r0.58, 126
;;
;;
	c0	br $b0.0, LBB41_18
;;
## BB#7:                                ## %if.then.7
	c0	and $r0.2 = $r0.57, 2147483647
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB41_8
;;
## BB#9:                                ## %if.end.10
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
	c0	mov $r0.3 = $r0.57
;;
	c0	mov $r0.59 = float_rounding_mode
;;
	c0	or $r0.4 = $r0.4, 1
;;
.call extractFloat32Sign, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
	c0	call $l0.0 = extractFloat32Sign
;;
	c0	ldw $r0.2 = 0[$r0.59]
	c0	mov $r0.59 = $r0.3
;;
;;
	c0	cmpeq $b0.0 = $r0.2, 3
;;
;;
	c0	br $b0.0, LBB41_15
;;
## BB#10:                               ## %if.end.10
	c0	cmpeq $b0.0 = $r0.2, 2
;;
;;
	c0	brf $b0.0, LBB41_11
;;
## BB#16:                               ## %sw.bb.21
	c0	cmpne $b0.0 = $r0.59, 0
;;
	c0	mov $r0.2 = -2147483648
;;
;;
	c0	slct $r0.3 = $b0.0, $r0.2, 1065353216
;;
	c0	goto LBB41_25
;;
LBB41_2:
	c0	mov $r0.3 = $r0.57
	c0	goto LBB41_25
;;
LBB41_18:                               ## %if.end.25
	c0	mov $r0.2 = float_rounding_mode
;;
	c0	mov $r0.5 = 150
	c0	ldw $r0.3 = 0[$r0.2]
;;
	c0	mov $r0.4 = 1
	c0	mov $r0.2 = $r0.57
;;
	c0	sub $r0.5 = $r0.5, $r0.58
;;
	c0	shl $r0.58 = $r0.4, $r0.5
	c0	cmpeq $b0.0 = $r0.3, 1
;;
;;
	c0	br $b0.0, LBB41_23
;;
## BB#19:                               ## %if.end.25
	c0	cmpne $b0.0 = $r0.3, 0
	c0	add $r0.59 = $r0.58, -1
;;
;;
	c0	br $b0.0, LBB41_22
;;
## BB#20:                               ## %if.then.29
	c0	shru $r0.2 = $r0.58, $r0.4
;;
	c0	add $r0.2 = $r0.2, $r0.57
;;
	c0	and $r0.3 = $r0.2, $r0.59
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB41_23
;;
## BB#21:                               ## %if.then.31
	c0	andc $r0.2 = $r0.58, $r0.2
	c0	goto LBB41_23
;;
LBB41_4:
	c0	mov $r0.3 = $r0.57
	c0	goto LBB41_25
;;
LBB41_8:
	c0	mov $r0.3 = $r0.57
	c0	goto LBB41_25
;;
LBB41_22:                               ## %if.then.35
	c0	cmpeq $b0.0 = $r0.3, 2
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	stw 44[$r0.1] = $r0.2
	c0	mov $r0.3 = $r0.57
;;
.call extractFloat32Sign, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Sign
;;
	c0	ldw $r0.2 = 44[$r0.1]
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	cmpeq $b0.0 = $r0.3, $r0.2
	c0	mov $r0.2 = 0
;;
;;
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.59
;;
	c0	add $r0.2 = $r0.2, $r0.57
;;
LBB41_23:                               ## %if.end.43
	c0	mov $r0.3 = 0
;;
	c0	sub $r0.3 = $r0.3, $r0.58
;;
	c0	and $r0.3 = $r0.2, $r0.3
;;
	c0	cmpeq $b0.0 = $r0.3, $r0.57
;;
;;
	c0	br $b0.0, LBB41_25
;;
## BB#24:                               ## %if.then.48
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
;;
;;
	c0	or $r0.4 = $r0.4, 1
;;
	c0	stw 0[$r0.2] = $r0.4
	c0	goto LBB41_25
;;
LBB41_15:                               ## %sw.bb.19
	c0	cmpne $b0.0 = $r0.59, 0
;;
	c0	mov $r0.2 = -1082130432
;;
;;
	c0	slct $r0.3 = $b0.0, $r0.2, 0
	c0	goto LBB41_25
;;
LBB41_11:                               ## %if.end.10
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB41_17
;;
## BB#12:                               ## %sw.bb
	c0	cmpne $b0.0 = $r0.58, 126
;;
;;
	c0	br $b0.0, LBB41_17
;;
## BB#13:                               ## %land.lhs.true.13
	c0	mov $r0.3 = $r0.57
;;
.call extractFloat32Frac, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Frac
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB41_17
;;
## BB#14:                               ## %if.then.16
	c0	mov $r0.5 = 0
	c0	mov $r0.4 = 127
;;
	c0	mov $r0.3 = $r0.59
;;
.call packFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = packFloat32
;;
	c0	goto LBB41_25
;;
LBB41_17:                               ## %sw.epilog
	c0	mov $r0.4 = 0
	c0	mov $r0.3 = $r0.59
;;
	c0	mov $r0.5 = $r0.4
;;
.call packFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = packFloat32
;;
LBB41_25:                               ## %cleanup
	c0	ldw $l0.0 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
	c0	ldw $r0.57 = 60[$r0.1]
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @propagateFloat32NaN
propagateFloat32NaN::
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
	c0	stw 40[$r0.1] = $l0.0
	c0	mov $r0.57 = $r0.3
;;
.call float32_is_signaling_nan, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	mov $r0.59 = $r0.4
	c0	call $l0.0 = float32_is_signaling_nan
;;
	c0	mov $r0.60 = $r0.3
	c0	mov $r0.3 = $r0.59
;;
.call float32_is_nan, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = float32_is_nan
;;
	c0	mov $r0.58 = $r0.3
	c0	mov $r0.3 = $r0.59
;;
.call float32_is_signaling_nan, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = float32_is_signaling_nan
;;
	c0	mov $r0.61 = $r0.3
;;
	c0	or $r0.2 = $r0.61, $r0.60
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB42_2
;;
## BB#1:                                ## %if.then
	c0	mov $r0.3 = 16
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
LBB42_2:                                ## %if.end
	c0	cmpne $b0.0 = $r0.61, 0
;;
	c0	or $r0.3 = $r0.59, 4194304
;;
;;
	c0	br $b0.0, LBB42_6
;;
## BB#3:                                ## %cond.false
	c0	cmpne $b0.0 = $r0.60, 0
;;
	c0	or $r0.2 = $r0.57, 4194304
;;
;;
	c0	brf $b0.0, LBB42_5
;;
## BB#4:
	c0	mov $r0.3 = $r0.2
	c0	goto LBB42_6
;;
LBB42_5:                                ## %cond.false.9
	c0	cmpne $b0.0 = $r0.58, 0
;;
;;
	c0	slct $r0.3 = $b0.0, $r0.3, $r0.2
;;
LBB42_6:                                ## %cond.end.15
	c0	ldw $l0.0 = 40[$r0.1]
;;
	c0	ldw $r0.61 = 44[$r0.1]
;;
	c0	ldw $r0.60 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
.return ret($r0.3:u32)
	c0	ldw $r0.57 = 60[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
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
	c0	stw 28[$r0.1] = $r0.57
;;
	c0	stw 24[$r0.1] = $r0.58
;;
	c0	stw 20[$r0.1] = $r0.59
;;
	c0	stw 16[$r0.1] = $l0.0
	c0	mov $r0.57 = $r0.3
;;
.call extractFloat32Sign, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	mov $r0.58 = $r0.4
	c0	call $l0.0 = extractFloat32Sign
;;
	c0	mov $r0.59 = $r0.3
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat32Sign, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Sign
;;
	c0	mov $r0.4 = $r0.58
	c0	cmpne $b0.0 = $r0.59, $r0.3
;;
;;
	c0	br $b0.0, LBB43_2
;;
## BB#1:                                ## %if.then
	c0	mov $r0.3 = $r0.57
	c0	mov $r0.5 = $r0.59
;;
.call addFloat32Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = addFloat32Sigs
;;
	c0	goto LBB43_3
;;
LBB43_2:                                ## %if.else
	c0	mov $r0.3 = $r0.57
	c0	mov $r0.5 = $r0.59
;;
.call subFloat32Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = subFloat32Sigs
;;
LBB43_3:                                ## %cleanup
	c0	ldw $l0.0 = 16[$r0.1]
;;
	c0	ldw $r0.59 = 20[$r0.1]
;;
	c0	ldw $r0.58 = 24[$r0.1]
;;
	c0	ldw $r0.57 = 28[$r0.1]
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @addFloat32Sigs
addFloat32Sigs::
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
	c0	mov $r0.58 = $r0.3
;;
	c0	mov $r0.60 = $r0.4
	c0	stw 20[$r0.1] = $r0.5
;;
.call extractFloat32Frac, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	mov $r0.57 = 6
	c0	call $l0.0 = extractFloat32Frac
;;
	c0	mov $r0.62 = $r0.3
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat32Exp, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Exp
;;
	c0	mov $r0.59 = $r0.3
	c0	mov $r0.3 = $r0.60
;;
.call extractFloat32Frac, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Frac
;;
	c0	mov $r0.63 = $r0.3
	c0	mov $r0.3 = $r0.60
;;
.call extractFloat32Exp, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Exp
;;
	c0	mov $r0.61 = $r0.3
	c0	shl $r0.2 = $r0.63, $r0.57
;;
	c0	sub $r0.4 = $r0.59, $r0.61
	c0	shl $r0.3 = $r0.62, $r0.57
;;
	c0	cmplt $b0.0 = $r0.4, 1
	c0	stw 28[$r0.1] = $r0.3
;;
	c0	stw 24[$r0.1] = $r0.2
;;
	c0	br $b0.0, LBB44_10
;;
## BB#1:                                ## %if.then
	c0	cmpne $b0.0 = $r0.59, 255
;;
;;
	c0	br $b0.0, LBB44_5
;;
## BB#2:                                ## %if.then.6
	c0	ldw $r0.2 = 28[$r0.1]
;;
LBB44_3:                                ## %if.then.6
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB44_4
;;
	c0	goto LBB44_26
;;
LBB44_10:                               ## %if.else.13
	c0	cmpgt $b0.0 = $r0.4, -1
;;
;;
	c0	brf $b0.0, LBB44_11
;;
## BB#19:                               ## %if.else.30
	c0	cmpeq $b0.0 = $r0.59, 0
;;
;;
	c0	brf $b0.0, LBB44_20
;;
## BB#22:                               ## %if.then.40
	c0	ldw $r0.5 = 28[$r0.1]
	c0	mov $r0.4 = 0
;;
	c0	ldw $r0.3 = 20[$r0.1]
;;
	c0	add $r0.2 = $r0.5, $r0.2
;;
	c0	shru $r0.5 = $r0.2, $r0.57
;;
.call packFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = packFloat32
;;
	c0	goto LBB44_25
;;
LBB44_5:                                ## %if.end.9
	c0	cmpne $b0.0 = $r0.61, 0
;;
;;
	c0	brf $b0.0, LBB44_6
;;
## BB#7:                                ## %if.else
	c0	or $r0.2 = $r0.2, 536870912
;;
	c0	stw 24[$r0.1] = $r0.2
	c0	goto LBB44_8
;;
LBB44_11:                               ## %if.then.15
	c0	cmpne $b0.0 = $r0.61, 255
;;
;;
	c0	br $b0.0, LBB44_15
;;
## BB#12:                               ## %if.then.17
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB44_13
;;
LBB44_4:                                ## %if.then.7
	c0	mov $r0.3 = $r0.58
	c0	mov $r0.4 = $r0.60
;;
.call propagateFloat32NaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = propagateFloat32NaN
;;
	c0	goto LBB44_25
;;
LBB44_20:                               ## %if.else.30
	c0	cmpne $b0.0 = $r0.59, 255
;;
;;
	c0	br $b0.0, LBB44_23
;;
## BB#21:                               ## %if.then.32
	c0	ldw $r0.3 = 28[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.3, $r0.2
	c0	goto LBB44_3
;;
LBB44_6:                                ## %if.then.11
	c0	add $r0.4 = $r0.4, -1
;;
LBB44_8:                                ## %if.end.12
	c0	ldw $r0.57 = 20[$r0.1]
;;
	c0	ldw $r0.3 = 24[$r0.1]
	c0	add $r0.5 = $r0.1, 24
;;
;;
.call shift32RightJamming, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret()
	c0	call $l0.0 = shift32RightJamming
;;
	c0	goto LBB44_9
;;
LBB44_15:                               ## %if.end.23
	c0	cmpne $b0.0 = $r0.59, 0
;;
;;
	c0	brf $b0.0, LBB44_16
;;
## BB#17:                               ## %if.else.26
	c0	ldw $r0.2 = 28[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.2, 536870912
;;
	c0	stw 28[$r0.1] = $r0.2
	c0	goto LBB44_18
;;
LBB44_23:                               ## %if.end.42
	c0	ldw $r0.3 = 28[$r0.1]
;;
;;
	c0	add $r0.2 = $r0.2, $r0.3
;;
	c0	add $r0.5 = $r0.2, 1073741824
;;
	c0	ldw $r0.57 = 20[$r0.1]
	c0	goto LBB44_24
;;
LBB44_13:                               ## %if.end.21
	c0	mov $r0.5 = 0
	c0	mov $r0.4 = 255
;;
	c0	ldw $r0.3 = 20[$r0.1]
;;
.call packFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = packFloat32
;;
	c0	goto LBB44_25
;;
LBB44_16:                               ## %if.then.25
	c0	add $r0.4 = $r0.4, 1
;;
LBB44_18:                               ## %if.end.28
	c0	ldw $r0.57 = 20[$r0.1]
;;
	c0	ldw $r0.3 = 28[$r0.1]
	c0	mov $r0.2 = 0
;;
	c0	add $r0.5 = $r0.1, 28
	c0	sub $r0.4 = $r0.2, $r0.4
;;
.call shift32RightJamming, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret()
	c0	call $l0.0 = shift32RightJamming
;;
	c0	mov $r0.59 = $r0.61
;;
LBB44_9:                                ## %if.end.46
	c0	ldw $r0.2 = 28[$r0.1]
	c0	mov $r0.3 = 1
;;
	c0	ldw $r0.4 = 24[$r0.1]
;;
	c0	or $r0.2 = $r0.2, 536870912
;;
	c0	mov $r0.6 = -1
	c0	add $r0.4 = $r0.2, $r0.4
;;
	c0	stw 28[$r0.1] = $r0.2
	c0	shl $r0.2 = $r0.4, $r0.3
;;
	c0	cmplt $b0.0 = $r0.2, 0
	c0	cmpgt $r0.3 = $r0.2, -1
;;
	c0	mtb $b0.1 = $r0.3
;;
	c0	slct $r0.5 = $b0.0, $r0.4, $r0.2
;;
	c0	slct $r0.2 = $b0.1, $r0.6, 0
;;
	c0	add $r0.59 = $r0.2, $r0.59
;;
LBB44_24:                               ## %roundAndPack
	c0	mov $r0.4 = $r0.59
	c0	mov $r0.3 = $r0.57
;;
.call roundAndPackFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = roundAndPackFloat32
;;
LBB44_25:                               ## %cleanup
	c0	mov $r0.58 = $r0.3
;;
LBB44_26:                               ## %cleanup
	c0	mov $r0.3 = $r0.58
	c0	ldw $l0.0 = 32[$r0.1]
;;
	c0	ldw $r0.63 = 36[$r0.1]
;;
	c0	ldw $r0.62 = 40[$r0.1]
;;
	c0	ldw $r0.61 = 44[$r0.1]
;;
	c0	ldw $r0.60 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
.return ret($r0.3:u32)
	c0	ldw $r0.57 = 60[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @subFloat32Sigs
subFloat32Sigs::
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
	c0	mov $r0.58 = $r0.3
;;
	c0	mov $r0.61 = $r0.4
	c0	stw 20[$r0.1] = $r0.5
;;
.call extractFloat32Frac, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	mov $r0.57 = 7
	c0	call $l0.0 = extractFloat32Frac
;;
	c0	mov $r0.62 = $r0.3
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat32Exp, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Exp
;;
	c0	mov $r0.60 = $r0.3
	c0	mov $r0.3 = $r0.61
;;
.call extractFloat32Frac, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Frac
;;
	c0	mov $r0.63 = $r0.3
	c0	mov $r0.3 = $r0.61
;;
.call extractFloat32Exp, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Exp
;;
	c0	mov $r0.59 = $r0.3
	c0	shl $r0.2 = $r0.63, $r0.57
;;
	c0	sub $r0.4 = $r0.60, $r0.59
	c0	shl $r0.3 = $r0.62, $r0.57
;;
	c0	cmpgt $b0.0 = $r0.4, 0
	c0	stw 28[$r0.1] = $r0.3
;;
	c0	stw 24[$r0.1] = $r0.2
;;
	c0	brf $b0.0, LBB45_1
;;
## BB#20:                               ## %aExpBigger
	c0	cmpne $b0.0 = $r0.60, 255
;;
;;
	c0	br $b0.0, LBB45_22
;;
## BB#21:                               ## %if.then.45
	c0	ldw $r0.2 = 28[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB45_5
;;
	c0	goto LBB45_29
;;
LBB45_1:                                ## %if.end
	c0	cmplt $b0.0 = $r0.4, 0
;;
;;
	c0	br $b0.0, LBB45_11
;;
## BB#2:                                ## %if.end.7
	c0	cmpeq $b0.0 = $r0.60, 0
;;
;;
	c0	brf $b0.0, LBB45_3
;;
## BB#7:                                ## %if.then.15
	c0	mov $r0.60 = 1
;;
	c0	mov $r0.59 = $r0.60
	c0	goto LBB45_8
;;
LBB45_22:                               ## %if.end.50
	c0	cmpne $b0.0 = $r0.59, 0
;;
;;
	c0	brf $b0.0, LBB45_23
;;
## BB#24:                               ## %if.else.54
	c0	or $r0.2 = $r0.2, 1073741824
;;
	c0	stw 24[$r0.1] = $r0.2
	c0	goto LBB45_25
;;
LBB45_11:                               ## %bExpBigger
	c0	cmpne $b0.0 = $r0.59, 255
;;
;;
	c0	br $b0.0, LBB45_15
;;
## BB#12:                               ## %if.then.27
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB45_5
;;
## BB#13:                               ## %if.end.31
	c0	ldw $r0.2 = 20[$r0.1]
;;
;;
	c0	xor $r0.3 = $r0.2, 1
	c0	mov $r0.4 = 255
;;
	c0	mov $r0.5 = 0
;;
.call packFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = packFloat32
;;
	c0	goto LBB45_28
;;
LBB45_3:                                ## %if.end.7
	c0	cmpne $b0.0 = $r0.60, 255
;;
;;
	c0	br $b0.0, LBB45_8
;;
## BB#4:                                ## %if.then.9
	c0	ldw $r0.3 = 28[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB45_6
;;
LBB45_5:                                ## %if.then.10
	c0	mov $r0.3 = $r0.58
	c0	mov $r0.4 = $r0.61
;;
.call propagateFloat32NaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = propagateFloat32NaN
;;
	c0	goto LBB45_28
;;
LBB45_8:                                ## %if.end.16
	c0	ldw $r0.2 = 28[$r0.1]
;;
	c0	ldw $r0.3 = 24[$r0.1]
;;
;;
	c0	cmpltu $b0.0 = $r0.3, $r0.2
	c0	ldw $r0.57 = 20[$r0.1]
;;
;;
	c0	br $b0.0, LBB45_26
;;
## BB#9:                                ## %if.end.19
	c0	cmpltu $b0.0 = $r0.2, $r0.3
;;
;;
	c0	br $b0.0, LBB45_19
;;
## BB#10:                               ## %if.end.22
	c0	mov $r0.2 = float_rounding_mode
;;
	c0	mov $r0.4 = 0
	c0	ldw $r0.2 = 0[$r0.2]
;;
	c0	mov $r0.5 = $r0.4
;;
	c0	cmpeq $b0.0 = $r0.2, 3
;;
;;
	c0	mfb $r0.3 = $b0.0
;;
.call packFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = packFloat32
;;
	c0	goto LBB45_28
;;
LBB45_23:                               ## %if.then.53
	c0	add $r0.4 = $r0.4, -1
;;
LBB45_25:                               ## %if.end.56
	c0	ldw $r0.57 = 20[$r0.1]
;;
	c0	ldw $r0.3 = 24[$r0.1]
	c0	add $r0.5 = $r0.1, 24
;;
;;
.call shift32RightJamming, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret()
	c0	call $l0.0 = shift32RightJamming
;;
	c0	ldw $r0.2 = 28[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.2, 1073741824
;;
	c0	stw 28[$r0.1] = $r0.2
;;
LBB45_26:                               ## %aBigger
	c0	ldw $r0.2 = 24[$r0.1]
;;
	c0	ldw $r0.3 = 28[$r0.1]
	c0	mov $r0.59 = $r0.60
;;
	c0	goto LBB45_27
;;
LBB45_15:                               ## %if.end.33
	c0	cmpne $b0.0 = $r0.60, 0
;;
;;
	c0	brf $b0.0, LBB45_16
;;
## BB#17:                               ## %if.else
	c0	ldw $r0.2 = 28[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.2, 1073741824
;;
	c0	stw 28[$r0.1] = $r0.2
	c0	goto LBB45_18
;;
LBB45_16:                               ## %if.then.36
	c0	add $r0.4 = $r0.4, 1
;;
LBB45_18:                               ## %if.end.38
	c0	ldw $r0.57 = 20[$r0.1]
;;
	c0	ldw $r0.3 = 28[$r0.1]
	c0	mov $r0.2 = 0
;;
	c0	add $r0.5 = $r0.1, 28
	c0	sub $r0.4 = $r0.2, $r0.4
;;
.call shift32RightJamming, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret()
	c0	call $l0.0 = shift32RightJamming
;;
	c0	ldw $r0.2 = 24[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.2, 1073741824
;;
	c0	stw 24[$r0.1] = $r0.2
;;
LBB45_19:                               ## %bBigger
	c0	ldw $r0.2 = 28[$r0.1]
;;
	c0	ldw $r0.3 = 24[$r0.1]
	c0	xor $r0.57 = $r0.57, 1
;;
LBB45_27:                               ## %normalizeRoundAndPack
	c0	sub $r0.5 = $r0.3, $r0.2
	c0	add $r0.4 = $r0.59, -1
;;
	c0	mov $r0.3 = $r0.57
;;
.call normalizeRoundAndPackFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = normalizeRoundAndPackFloat32
;;
LBB45_28:                               ## %cleanup
	c0	mov $r0.58 = $r0.3
;;
LBB45_29:                               ## %cleanup
	c0	mov $r0.3 = $r0.58
	c0	ldw $l0.0 = 32[$r0.1]
;;
	c0	ldw $r0.63 = 36[$r0.1]
;;
	c0	ldw $r0.62 = 40[$r0.1]
;;
	c0	ldw $r0.61 = 44[$r0.1]
;;
	c0	ldw $r0.60 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
.return ret($r0.3:u32)
	c0	ldw $r0.57 = 60[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
LBB45_6:                                ## %if.end.12
	c0	mov $r0.3 = 16
;;
	c0	mov $r0.58 = 2147483647
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
	c0	goto LBB45_29
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
	c0	stw 28[$r0.1] = $r0.57
;;
	c0	stw 24[$r0.1] = $r0.58
;;
	c0	stw 20[$r0.1] = $r0.59
;;
	c0	stw 16[$r0.1] = $l0.0
	c0	mov $r0.57 = $r0.3
;;
.call extractFloat32Sign, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	mov $r0.58 = $r0.4
	c0	call $l0.0 = extractFloat32Sign
;;
	c0	mov $r0.59 = $r0.3
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat32Sign, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Sign
;;
	c0	mov $r0.4 = $r0.58
	c0	cmpne $b0.0 = $r0.59, $r0.3
;;
;;
	c0	br $b0.0, LBB46_2
;;
## BB#1:                                ## %if.then
	c0	mov $r0.3 = $r0.57
	c0	mov $r0.5 = $r0.59
;;
.call subFloat32Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = subFloat32Sigs
;;
	c0	goto LBB46_3
;;
LBB46_2:                                ## %if.else
	c0	mov $r0.3 = $r0.57
	c0	mov $r0.5 = $r0.59
;;
.call addFloat32Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = addFloat32Sigs
;;
LBB46_3:                                ## %cleanup
	c0	ldw $l0.0 = 16[$r0.1]
;;
	c0	ldw $r0.59 = 20[$r0.1]
;;
	c0	ldw $r0.58 = 24[$r0.1]
;;
	c0	ldw $r0.57 = 28[$r0.1]
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

#.globl float32_mul
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_mul
float32_mul::
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
	c0	stw 44[$r0.1] = $l0.0
	c0	mov $r0.59 = $r0.3
;;
.call extractFloat32Frac, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	mov $r0.58 = $r0.4
	c0	call $l0.0 = extractFloat32Frac
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.59
;;
.call extractFloat32Exp, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	stw 32[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat32Exp
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.59
;;
.call extractFloat32Sign, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	stw 40[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat32Sign
;;
	c0	mov $r0.57 = $r0.3
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat32Frac, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Frac
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat32Exp, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	stw 28[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat32Exp
;;
	c0	mov $r0.60 = $r0.3
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat32Sign, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	stw 36[$r0.1] = $r0.60
	c0	call $l0.0 = extractFloat32Sign
;;
	c0	ldw $r0.2 = 40[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.2, 255
	c0	xor $r0.57 = $r0.3, $r0.57
;;
;;
	c0	br $b0.0, LBB47_10
;;
## BB#1:                                ## %if.then
	c0	ldw $r0.2 = 32[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB47_4
;;
## BB#2:                                ## %lor.lhs.false
	c0	ldw $r0.2 = 28[$r0.1]
	c0	cmpne $b0.0 = $r0.60, 255
;;
;;
	c0	br $b0.0, LBB47_5
;;
## BB#3:                                ## %lor.lhs.false
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB47_4
;;
LBB47_5:                                ## %if.end
	c0	or $r0.2 = $r0.2, $r0.60
	c0	goto LBB47_6
;;
LBB47_10:                               ## %if.end.14
	c0	cmpne $b0.0 = $r0.60, 255
;;
;;
	c0	br $b0.0, LBB47_13
;;
## BB#11:                               ## %if.then.16
	c0	ldw $r0.3 = 28[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB47_12
;;
LBB47_4:                                ## %if.then.8
	c0	mov $r0.3 = $r0.59
	c0	mov $r0.4 = $r0.58
;;
.call propagateFloat32NaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = propagateFloat32NaN
;;
	c0	goto LBB47_24
;;
LBB47_13:                               ## %if.end.26
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB47_17
;;
## BB#14:                               ## %if.then.28
	c0	ldw $r0.3 = 32[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	brf $b0.0, LBB47_15
;;
## BB#16:                               ## %if.end.32
	c0	add $r0.5 = $r0.1, 32
	c0	add $r0.4 = $r0.1, 40
;;
.call normalizeFloat32Subnormal, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret()
	c0	call $l0.0 = normalizeFloat32Subnormal
;;
LBB47_17:                               ## %if.end.33
	c0	ldw $r0.2 = 36[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB47_20
;;
## BB#18:                               ## %if.then.35
	c0	ldw $r0.3 = 28[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	brf $b0.0, LBB47_15
;;
## BB#19:                               ## %if.end.39
	c0	add $r0.5 = $r0.1, 28
	c0	add $r0.4 = $r0.1, 36
;;
.call normalizeFloat32Subnormal, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret()
	c0	call $l0.0 = normalizeFloat32Subnormal
;;
LBB47_20:                               ## %if.end.40
	c0	ldw $r0.2 = 32[$r0.1]
	c0	mov $r0.3 = 7
;;
	c0	ldw $r0.4 = 28[$r0.1]
	c0	mov $r0.7 = 8
;;
	c0	ldw $r0.8 = 36[$r0.1]
	c0	add $r0.5 = $r0.1, 24
;;
	c0	ldw $r0.9 = 40[$r0.1]
	c0	add $r0.6 = $r0.1, 20
;;
;;
	c0	add $r0.58 = $r0.8, $r0.9
	c0	shl $r0.2 = $r0.2, $r0.3
;;
	c0	shl $r0.4 = $r0.4, $r0.7
;;
	c0	or $r0.3 = $r0.2, 1073741824
;;
	c0	or $r0.4 = $r0.4, -2147483648
;;
	c0	stw 32[$r0.1] = $r0.3
;;
.call mul32To64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret()
	c0	stw 28[$r0.1] = $r0.4
	c0	call $l0.0 = mul32To64
;;
	c0	ldw $r0.2 = 20[$r0.1]
;;
	c0	ldw $r0.3 = 24[$r0.1]
;;
	c0	cmpne $b0.0 = $r0.2, 0
	c0	mov $r0.2 = 1
;;
;;
	c0	mfb $r0.4 = $b0.0
;;
	c0	or $r0.3 = $r0.4, $r0.3
;;
	c0	stw 24[$r0.1] = $r0.3
	c0	shl $r0.2 = $r0.3, $r0.2
;;
	c0	cmplt $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB47_21
;;
## BB#22:                               ## %if.then.49
	c0	add $r0.4 = $r0.58, -128
	c0	stw 24[$r0.1] = $r0.2
;;
	c0	goto LBB47_23
;;
LBB47_12:                               ## %if.end.20
	c0	ldw $r0.3 = 32[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.3, $r0.2
;;
LBB47_6:                                ## %if.end
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB47_7
;;
## BB#8:                                ## %if.end.12
	c0	mov $r0.5 = 0
	c0	mov $r0.4 = 255
;;
	c0	mov $r0.3 = $r0.57
;;
.call packFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = packFloat32
;;
	c0	goto LBB47_24
;;
LBB47_21:
	c0	add $r0.4 = $r0.58, -127
;;
LBB47_23:                               ## %if.end.51
	c0	ldw $r0.5 = 24[$r0.1]
	c0	mov $r0.3 = $r0.57
;;
;;
.call roundAndPackFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = roundAndPackFloat32
;;
	c0	goto LBB47_24
;;
LBB47_7:                                ## %if.then.11
	c0	mov $r0.3 = 16
;;
	c0	mov $r0.57 = 2147483647
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
	c0	goto LBB47_25
;;
LBB47_15:                               ## %if.then.30
	c0	mov $r0.4 = 0
	c0	mov $r0.3 = $r0.57
;;
	c0	mov $r0.5 = $r0.4
;;
.call packFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = packFloat32
;;
LBB47_24:                               ## %cleanup
	c0	mov $r0.57 = $r0.3
;;
LBB47_25:                               ## %cleanup
	c0	mov $r0.3 = $r0.57
	c0	ldw $l0.0 = 44[$r0.1]
;;
	c0	ldw $r0.60 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
.return ret($r0.3:u32)
	c0	ldw $r0.57 = 60[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @roundAndPackFloat32
roundAndPackFloat32::
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
	c0	stw 40[$r0.1] = $l0.0
;;
	c0	mov $r0.2 = float_rounding_mode
;;
	c0	ldw $r0.2 = 0[$r0.2]
	c0	mov $r0.57 = $r0.3
;;
;;
	c0	cmpeq $b0.1 = $r0.2, 0
	c0	stw 36[$r0.1] = $r0.5
;;
;;
	c0	br $b0.1, LBB48_1
;;
## BB#2:                                ## %if.then
	c0	cmpeq $b0.0 = $r0.2, 1
;;
;;
	c0	brf $b0.0, LBB48_4
;;
## BB#3:
	c0	mov $r0.58 = 0
	c0	goto LBB48_8
;;
LBB48_1:
	c0	mov $r0.58 = 64
	c0	goto LBB48_8
;;
LBB48_4:                                ## %if.else
	c0	cmpeq $b0.0 = $r0.57, 0
;;
;;
	c0	br $b0.0, LBB48_6
;;
## BB#5:                                ## %if.then.5
	c0	cmpeq $b0.0 = $r0.2, 2
	c0	goto LBB48_7
;;
LBB48_6:                                ## %if.else.9
	c0	cmpeq $b0.0 = $r0.2, 3
;;
LBB48_7:                                ## %if.end.16
	c0	mov $r0.2 = 0
;;
	c0	slct $r0.58 = $b0.0, $r0.2, 127
;;
LBB48_8:                                ## %if.end.16
	c0	ldw $r0.2 = 36[$r0.1]
	c0	zxth $r0.3 = $r0.4
;;
	c0	cmpltu $b0.0 = $r0.3, 253
;;
	c0	and $r0.60 = $r0.2, 127
;;
	c0	br $b0.0, LBB48_9
;;
## BB#10:                               ## %if.then.21
	c0	cmpgt $b0.0 = $r0.4, 253
;;
;;
	c0	br $b0.0, LBB48_13
;;
## BB#11:                               ## %lor.lhs.false
	c0	cmpne $b0.0 = $r0.4, 253
	c0	add $r0.2 = $r0.2, $r0.58
;;
;;
	c0	br $b0.0, LBB48_14
;;
## BB#12:                               ## %lor.lhs.false
	c0	cmpgt $b0.0 = $r0.2, -1
;;
;;
	c0	br $b0.0, LBB48_14
;;
LBB48_13:                               ## %if.then.28
	c0	mov $r0.3 = 9
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
	c0	mov $r0.5 = 0
	c0	mov $r0.4 = 255
;;
	c0	cmpeq $b0.0 = $r0.58, 0
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	stw 32[$r0.1] = $r0.2
	c0	mov $r0.3 = $r0.57
;;
.call packFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = packFloat32
;;
	c0	ldw $r0.2 = 32[$r0.1]
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	sub $r0.3 = $r0.3, $r0.2
	c0	goto LBB48_23
;;
LBB48_9:
	c0	mov $r0.59 = $r0.4
;;
LBB48_20:                               ## %if.end.51
	c0	cmpeq $b0.0 = $r0.60, 0
;;
;;
	c0	br $b0.0, LBB48_22
;;
## BB#21:                               ## %if.then.53
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.3 = 0[$r0.2]
;;
;;
	c0	or $r0.3 = $r0.3, 1
;;
	c0	stw 0[$r0.2] = $r0.3
;;
LBB48_22:                               ## %if.end.54
	c0	cmpeq $b0.0 = $r0.60, 64
	c0	ldw $r0.2 = 36[$r0.1]
;;
;;
	c0	mfb $r0.3 = $b0.0
	c0	mfb $r0.4 = $b0.1
;;
	c0	and $r0.3 = $r0.4, $r0.3
	c0	add $r0.2 = $r0.2, $r0.58
;;
	c0	mov $r0.4 = 7
	c0	orc $r0.5 = $r0.3, -2
;;
	c0	shru $r0.2 = $r0.2, $r0.4
	c0	mov $r0.4 = 0
;;
	c0	mov $r0.3 = $r0.57
	c0	and $r0.5 = $r0.2, $r0.5
;;
	c0	cmpeq $b0.0 = $r0.5, 0
	c0	stw 36[$r0.1] = $r0.5
;;
;;
	c0	slct $r0.4 = $b0.0, $r0.4, $r0.59
;;
.call packFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = packFloat32
;;
LBB48_23:                               ## %cleanup
	c0	ldw $l0.0 = 40[$r0.1]
;;
	c0	ldw $r0.61 = 44[$r0.1]
;;
	c0	ldw $r0.60 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
.return ret($r0.3:u32)
	c0	ldw $r0.57 = 60[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
LBB48_14:                               ## %if.end.31
	c0	cmpgt $b0.0 = $r0.4, -1
;;
;;
	c0	brf $b0.0, LBB48_16
;;
## BB#15:
	c0	mov $r0.59 = $r0.4
	c0	goto LBB48_20
;;
LBB48_16:                               ## %if.then.34
	c0	mfb $r0.3 = $b0.1
;;
	c0	stw 32[$r0.1] = $r0.3
;;
	c0	mov $r0.3 = float_detect_tininess
;;
	c0	cmplt $b0.0 = $r0.4, -1
	c0	ldw $r0.6 = 0[$r0.3]
;;
	c0	mov $r0.59 = 0
	c0	ldw $r0.3 = 36[$r0.1]
;;
	c0	add $r0.5 = $r0.1, 36
	c0	cmpgt $b0.1 = $r0.2, -1
;;
;;
	c0	mfb $r0.2 = $b0.1
;;
	c0	stw 28[$r0.1] = $r0.2
	c0	sub $r0.4 = $r0.59, $r0.4
;;
	c0	mfb $r0.60 = $b0.0
	c0	cmpeq $b0.0 = $r0.6, 1
;;
;;
.call shift32RightJamming, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret()
	c0	mfb $r0.61 = $b0.0
	c0	call $l0.0 = shift32RightJamming
;;
	c0	or $r0.2 = $r0.60, $r0.61
	c0	ldw $r0.3 = 28[$r0.1]
;;
	c0	mtb $b0.0 = $r0.3
;;
;;
	c0	mfb $r0.3 = $b0.0
;;
	c0	or $r0.2 = $r0.3, $r0.2
	c0	ldw $r0.3 = 36[$r0.1]
;;
	c0	and $r0.2 = $r0.2, 1
;;
	c0	and $r0.60 = $r0.3, 127
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB48_19
;;
## BB#17:                               ## %if.then.34
	c0	cmpeq $b0.0 = $r0.60, 0
;;
;;
	c0	br $b0.0, LBB48_19
;;
## BB#18:                               ## %if.then.48
	c0	mov $r0.3 = 4
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
LBB48_19:                               ## %if.end.51
	c0	ldw $r0.2 = 32[$r0.1]
;;
	c0	mtb $b0.1 = $r0.2
	c0	goto LBB48_20
;;
.endp

#.globl float32_div
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_div
float32_div::
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
	c0	mov $r0.59 = $r0.3
;;
.call extractFloat32Frac, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	mov $r0.58 = $r0.4
	c0	call $l0.0 = extractFloat32Frac
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.59
;;
.call extractFloat32Exp, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	stw 52[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat32Exp
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.59
;;
.call extractFloat32Sign, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	stw 60[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat32Sign
;;
	c0	mov $r0.57 = $r0.3
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat32Frac, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Frac
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat32Exp, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	stw 48[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat32Exp
;;
	c0	mov $r0.60 = $r0.3
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat32Sign, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	stw 56[$r0.1] = $r0.60
	c0	call $l0.0 = extractFloat32Sign
;;
	c0	ldw $r0.2 = 60[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.2, 255
	c0	xor $r0.57 = $r0.3, $r0.57
;;
;;
	c0	br $b0.0, LBB49_8
;;
## BB#1:                                ## %if.then
	c0	ldw $r0.2 = 52[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB49_2
;;
## BB#3:                                ## %if.end
	c0	cmpne $b0.0 = $r0.60, 255
;;
;;
	c0	br $b0.0, LBB49_6
;;
## BB#4:                                ## %if.then.9
	c0	ldw $r0.2 = 48[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB49_2
;;
	c0	goto LBB49_5
;;
LBB49_8:                                ## %if.end.16
	c0	cmpeq $b0.0 = $r0.60, 0
;;
;;
	c0	brf $b0.0, LBB49_9
;;
## BB#12:                               ## %if.then.26
	c0	ldw $r0.3 = 48[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	brf $b0.0, LBB49_13
;;
## BB#15:                               ## %if.end.33
	c0	add $r0.5 = $r0.1, 48
	c0	add $r0.4 = $r0.1, 56
;;
.call normalizeFloat32Subnormal, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret()
	c0	call $l0.0 = normalizeFloat32Subnormal
;;
	c0	goto LBB49_16
;;
LBB49_9:                                ## %if.end.16
	c0	cmpne $b0.0 = $r0.60, 255
;;
;;
	c0	br $b0.0, LBB49_16
;;
## BB#10:                               ## %if.then.18
	c0	ldw $r0.2 = 48[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB49_11
;;
LBB49_2:                                ## %if.then.6
	c0	mov $r0.3 = $r0.59
	c0	mov $r0.4 = $r0.58
;;
.call propagateFloat32NaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = propagateFloat32NaN
;;
	c0	goto LBB49_28
;;
LBB49_16:                               ## %if.end.34
	c0	ldw $r0.2 = 60[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB49_19
;;
## BB#17:                               ## %if.then.36
	c0	ldw $r0.3 = 52[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	brf $b0.0, LBB49_11
;;
## BB#18:                               ## %if.end.40
	c0	add $r0.5 = $r0.1, 52
	c0	add $r0.4 = $r0.1, 60
;;
.call normalizeFloat32Subnormal, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret()
	c0	call $l0.0 = normalizeFloat32Subnormal
;;
LBB49_19:                               ## %if.end.41
	c0	ldw $r0.2 = 52[$r0.1]
	c0	mov $r0.3 = 7
;;
	c0	ldw $r0.4 = 48[$r0.1]
	c0	mov $r0.5 = 8
;;
	c0	shl $r0.6 = $r0.2, $r0.3
	c0	mov $r0.2 = 1
;;
	c0	shl $r0.5 = $r0.4, $r0.5
	c0	ldw $r0.3 = 56[$r0.1]
;;
	c0	ldw $r0.4 = 60[$r0.1]
;;
;;
	c0	sub $r0.3 = $r0.4, $r0.3
;;
	c0	or $r0.4 = $r0.6, 1073741824
;;
	c0	or $r0.5 = $r0.5, -2147483648
;;
	c0	stw 52[$r0.1] = $r0.4
	c0	shl $r0.6 = $r0.4, $r0.2
;;
	c0	stw 48[$r0.1] = $r0.5
	c0	cmpgtu $b0.0 = $r0.5, $r0.6
;;
;;
	c0	brf $b0.0, LBB49_21
;;
## BB#20:
	c0	add $r0.58 = $r0.3, 125
	c0	goto LBB49_22
;;
LBB49_21:                               ## %if.then.47
	c0	shru $r0.2 = $r0.4, $r0.2
	c0	add $r0.58 = $r0.3, 126
;;
	c0	stw 52[$r0.1] = $r0.2
;;
LBB49_22:                               ## %if.end.48
	c0	ldw $r0.5 = 48[$r0.1]
	c0	mov $r0.4 = 0
;;
	c0	ldw $r0.3 = 52[$r0.1]
;;
.call estimateDiv64To32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = estimateDiv64To32
;;
	c0	mov $r0.59 = $r0.3
;;
	c0	and $r0.2 = $r0.59, 63
;;
	c0	cmpgtu $b0.0 = $r0.2, 2
;;
;;
	c0	br $b0.0, LBB49_27
;;
## BB#23:                               ## %if.then.51
	c0	ldw $r0.3 = 48[$r0.1]
	c0	add $r0.6 = $r0.1, 32
;;
	c0	add $r0.5 = $r0.1, 36
	c0	mov $r0.4 = $r0.59
;;
.call mul32To64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret()
	c0	call $l0.0 = mul32To64
;;
	c0	ldw $r0.6 = 32[$r0.1]
	c0	add $r0.7 = $r0.1, 44
;;
	c0	ldw $r0.5 = 36[$r0.1]
	c0	mov $r0.4 = 0
;;
	c0	ldw $r0.3 = 52[$r0.1]
	c0	add $r0.8 = $r0.1, 40
;;
;;
.call sub64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = sub64
;;
	c0	ldw $r0.3 = 44[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.3, -1
;;
;;
	c0	br $b0.0, LBB49_26
;;
## BB#24:                               ## %while.body.lr.ph
	c0	ldw $r0.60 = 48[$r0.1]
	c0	add $r0.61 = $r0.1, 44
;;
	c0	add $r0.62 = $r0.1, 40
	c0	mov $r0.63 = 0
;;
LBB49_25:                               ## %while.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.4 = 40[$r0.1]
	c0	mov $r0.7 = $r0.61
;;
	c0	mov $r0.6 = $r0.60
	c0	mov $r0.5 = $r0.63
;;
	c0	mov $r0.8 = $r0.62
;;
.call add64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = add64
;;
	c0	ldw $r0.3 = 44[$r0.1]
	c0	add $r0.59 = $r0.59, -1
;;
;;
	c0	cmplt $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB49_25
;;
LBB49_26:                               ## %while.end
	c0	ldw $r0.2 = 40[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	or $r0.59 = $r0.2, $r0.59
;;
LBB49_27:                               ## %if.end.55
	c0	mov $r0.4 = $r0.58
	c0	mov $r0.3 = $r0.57
;;
	c0	mov $r0.5 = $r0.59
;;
.call roundAndPackFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = roundAndPackFloat32
;;
	c0	goto LBB49_28
;;
LBB49_13:                               ## %if.then.28
	c0	ldw $r0.3 = 52[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.3, $r0.2
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB49_5
;;
## BB#14:                               ## %if.end.31
	c0	mov $r0.3 = 2
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
LBB49_6:                                ## %if.end.14
	c0	mov $r0.5 = 0
	c0	mov $r0.4 = 255
;;
	c0	mov $r0.3 = $r0.57
;;
.call packFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = packFloat32
;;
	c0	goto LBB49_28
;;
LBB49_11:                               ## %if.end.22
	c0	mov $r0.4 = 0
	c0	mov $r0.3 = $r0.57
;;
	c0	mov $r0.5 = $r0.4
;;
.call packFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = packFloat32
;;
LBB49_28:                               ## %cleanup
	c0	mov $r0.57 = $r0.3
;;
LBB49_29:                               ## %cleanup
	c0	mov $r0.3 = $r0.57
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
.return ret($r0.3:u32)
	c0	ldw $r0.57 = 92[$r0.1]
	c0	return $r0.1 = $r0.1, 96, $l0.0
;;
LBB49_5:                                ## %if.end.13
	c0	mov $r0.3 = 16
;;
	c0	mov $r0.57 = 2147483647
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
	c0	goto LBB49_29
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @estimateDiv64To32
estimateDiv64To32::
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
	c0	mov $r0.59 = $r0.5
;;
	c0	mov $r0.60 = $r0.3
;;
	c0	cmpleu $b0.0 = $r0.59, $r0.60
	c0	mov $r0.61 = $r0.4
;;
;;
	c0	br $b0.0, LBB50_1
;;
## BB#2:                                ## %if.end
	c0	mov $r0.63 = 16
;;
	c0	shru $r0.57 = $r0.59, $r0.63
;;
	c0	shl $r0.62 = $r0.57, $r0.63
;;
	c0	cmpleu $b0.0 = $r0.62, $r0.60
;;
;;
	c0	br $b0.0, LBB50_3
;;
## BB#4:                                ## %cond.false
	c0	cmplt $r0.2 = $r0.57, $r0.0
	c0	mov $r0.3 = 0
;;
	c0	shru $r0.4 = $r0.60, $r0.2
	c0	mtb $b0.0 = $r0.3
;;
	c0	shru $r0.5 = $r0.57, $r0.2
;;
	c0	addcg $r0.6, $b0.0 = $r0.4, $r0.4, $b0.0
	c0	mtb $b0.1 = $r0.3
;;
	c0	divs $r0.3, $b0.0 = $r0.0, $r0.5, $b0.0
;;
	c0	addcg $r0.4, $b0.1 = $r0.6, $r0.6, $b0.1
;;
	c0	addcg $r0.6, $b0.0 = $r0.4, $r0.4, $b0.0
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.5, $b0.1
;;
	c0	addcg $r0.4, $b0.1 = $r0.6, $r0.6, $b0.1
	c0	divs $r0.3, $b0.0 = $r0.3, $r0.5, $b0.0
;;
	c0	addcg $r0.6, $b0.0 = $r0.4, $r0.4, $b0.0
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.5, $b0.1
;;
	c0	addcg $r0.4, $b0.1 = $r0.6, $r0.6, $b0.1
	c0	divs $r0.3, $b0.0 = $r0.3, $r0.5, $b0.0
;;
	c0	addcg $r0.6, $b0.0 = $r0.4, $r0.4, $b0.0
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.5, $b0.1
;;
	c0	mtb $b0.2 = $r0.2
	c0	cmpgeu $r0.2 = $r0.60, $r0.57
;;
	c0	addcg $r0.4, $b0.1 = $r0.6, $r0.6, $b0.1
	c0	divs $r0.3, $b0.0 = $r0.3, $r0.5, $b0.0
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.5, $b0.1
	c0	addcg $r0.6, $b0.0 = $r0.4, $r0.4, $b0.0
;;
	c0	addcg $r0.4, $b0.1 = $r0.6, $r0.6, $b0.1
	c0	divs $r0.3, $b0.0 = $r0.3, $r0.5, $b0.0
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.5, $b0.1
	c0	addcg $r0.6, $b0.0 = $r0.4, $r0.4, $b0.0
;;
	c0	addcg $r0.4, $b0.1 = $r0.6, $r0.6, $b0.1
	c0	divs $r0.3, $b0.0 = $r0.3, $r0.5, $b0.0
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.5, $b0.1
	c0	addcg $r0.6, $b0.0 = $r0.4, $r0.4, $b0.0
;;
	c0	addcg $r0.4, $b0.1 = $r0.6, $r0.6, $b0.1
	c0	divs $r0.3, $b0.0 = $r0.3, $r0.5, $b0.0
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.5, $b0.1
	c0	addcg $r0.6, $b0.0 = $r0.4, $r0.4, $b0.0
;;
	c0	addcg $r0.4, $b0.1 = $r0.6, $r0.6, $b0.1
	c0	divs $r0.3, $b0.0 = $r0.3, $r0.5, $b0.0
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.5, $b0.1
	c0	addcg $r0.6, $b0.0 = $r0.4, $r0.4, $b0.0
;;
	c0	addcg $r0.4, $b0.1 = $r0.6, $r0.6, $b0.1
	c0	divs $r0.3, $b0.0 = $r0.3, $r0.5, $b0.0
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.5, $b0.1
	c0	addcg $r0.6, $b0.0 = $r0.4, $r0.4, $b0.0
;;
	c0	addcg $r0.4, $b0.1 = $r0.6, $r0.6, $b0.1
	c0	divs $r0.3, $b0.0 = $r0.3, $r0.5, $b0.0
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.5, $b0.1
	c0	addcg $r0.6, $b0.0 = $r0.4, $r0.4, $b0.0
;;
	c0	addcg $r0.4, $b0.1 = $r0.6, $r0.6, $b0.1
	c0	divs $r0.3, $b0.0 = $r0.3, $r0.5, $b0.0
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.5, $b0.1
	c0	addcg $r0.6, $b0.0 = $r0.4, $r0.4, $b0.0
;;
	c0	addcg $r0.4, $b0.1 = $r0.6, $r0.6, $b0.1
	c0	divs $r0.3, $b0.0 = $r0.3, $r0.5, $b0.0
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.5, $b0.1
	c0	addcg $r0.6, $b0.0 = $r0.4, $r0.4, $b0.0
;;
	c0	addcg $r0.4, $b0.1 = $r0.6, $r0.6, $b0.1
	c0	divs $r0.3, $b0.0 = $r0.3, $r0.5, $b0.0
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.5, $b0.1
	c0	addcg $r0.6, $b0.0 = $r0.4, $r0.4, $b0.0
;;
	c0	addcg $r0.4, $b0.1 = $r0.6, $r0.6, $b0.1
	c0	divs $r0.3, $b0.0 = $r0.3, $r0.5, $b0.0
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.5, $b0.1
	c0	addcg $r0.6, $b0.0 = $r0.4, $r0.4, $b0.0
;;
	c0	addcg $r0.4, $b0.1 = $r0.6, $r0.6, $b0.1
	c0	divs $r0.3, $b0.0 = $r0.3, $r0.5, $b0.0
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.5, $b0.1
	c0	addcg $r0.6, $b0.0 = $r0.4, $r0.4, $b0.0
;;
	c0	addcg $r0.4, $b0.1 = $r0.6, $r0.6, $b0.1
	c0	divs $r0.3, $b0.0 = $r0.3, $r0.5, $b0.0
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.5, $b0.1
	c0	addcg $r0.5, $b0.0 = $r0.4, $r0.4, $b0.0
;;
	c0	cmpge $b0.0 = $r0.3, $r0.0
	c0	addcg $r0.3, $b0.1 = $r0.5, $r0.5, $b0.1
;;
	c0	orc $r0.3 = $r0.3, $r0.0
;;
	c0	mfb $r0.4 = $b0.0
;;
	c0	sh1add $r0.3 = $r0.3, $r0.4
;;
	c0	slct $r0.2 = $b0.2, $r0.2, $r0.3
;;
	c0	shl $r0.58 = $r0.2, $r0.63
	c0	goto LBB50_5
;;
LBB50_1:
	c0	mov $r0.3 = -1
	c0	goto LBB50_12
;;
LBB50_3:
	c0	mov $r0.58 = -65536
;;
LBB50_5:                                ## %cond.end
	c0	add $r0.6 = $r0.1, 16
	c0	add $r0.5 = $r0.1, 20
;;
	c0	mov $r0.4 = $r0.58
	c0	mov $r0.3 = $r0.59
;;
.call mul32To64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret()
	c0	call $l0.0 = mul32To64
;;
	c0	ldw $r0.6 = 16[$r0.1]
	c0	add $r0.8 = $r0.1, 24
;;
	c0	ldw $r0.5 = 20[$r0.1]
	c0	add $r0.7 = $r0.1, 28
;;
	c0	mov $r0.3 = $r0.60
	c0	mov $r0.4 = $r0.61
;;
.call sub64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = sub64
;;
	c0	ldw $r0.3 = 28[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.3, -1
;;
;;
	c0	br $b0.0, LBB50_8
;;
## BB#6:                                ## %while.body.lr.ph
	c0	add $r0.60 = $r0.1, 24
	c0	shl $r0.59 = $r0.59, $r0.63
;;
	c0	add $r0.61 = $r0.1, 28
;;
LBB50_7:                                ## %while.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.4 = 24[$r0.1]
	c0	mov $r0.7 = $r0.61
;;
	c0	mov $r0.6 = $r0.59
	c0	mov $r0.5 = $r0.57
;;
	c0	mov $r0.8 = $r0.60
;;
.call add64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = add64
;;
	c0	ldw $r0.3 = 28[$r0.1]
;;
	c0	add $r0.58 = $r0.58, -65536
;;
;;
	c0	cmplt $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB50_7
;;
LBB50_8:                                ## %while.end
	c0	ldhu $r0.2 = 24[$r0.1]
	c0	shl $r0.3 = $r0.3, $r0.63
;;
;;
	c0	or $r0.2 = $r0.2, $r0.3
;;
	c0	cmpleu $b0.0 = $r0.62, $r0.2
	c0	stw 28[$r0.1] = $r0.2
;;
;;
	c0	br $b0.0, LBB50_9
;;
## BB#10:                               ## %cond.false.10
	c0	cmplt $r0.3 = $r0.57, $r0.0
	c0	mov $r0.4 = 0
;;
	c0	shru $r0.5 = $r0.2, $r0.3
	c0	mtb $b0.0 = $r0.4
;;
	c0	shru $r0.6 = $r0.57, $r0.3
;;
	c0	addcg $r0.7, $b0.0 = $r0.5, $r0.5, $b0.0
	c0	mtb $b0.1 = $r0.4
;;
	c0	divs $r0.4, $b0.0 = $r0.0, $r0.6, $b0.0
;;
	c0	addcg $r0.5, $b0.1 = $r0.7, $r0.7, $b0.1
;;
	c0	addcg $r0.7, $b0.0 = $r0.5, $r0.5, $b0.0
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.6, $b0.1
;;
	c0	addcg $r0.5, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.4, $b0.0 = $r0.4, $r0.6, $b0.0
;;
	c0	addcg $r0.7, $b0.0 = $r0.5, $r0.5, $b0.0
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.6, $b0.1
;;
	c0	addcg $r0.5, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.4, $b0.0 = $r0.4, $r0.6, $b0.0
;;
	c0	addcg $r0.7, $b0.0 = $r0.5, $r0.5, $b0.0
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.6, $b0.1
;;
	c0	mtb $b0.2 = $r0.3
	c0	cmpgeu $r0.2 = $r0.2, $r0.57
;;
	c0	addcg $r0.3, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.4, $b0.0 = $r0.4, $r0.6, $b0.0
;;
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.6, $b0.1
	c0	addcg $r0.5, $b0.0 = $r0.3, $r0.3, $b0.0
;;
	c0	addcg $r0.3, $b0.1 = $r0.5, $r0.5, $b0.1
	c0	divs $r0.4, $b0.0 = $r0.4, $r0.6, $b0.0
;;
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.6, $b0.1
	c0	addcg $r0.5, $b0.0 = $r0.3, $r0.3, $b0.0
;;
	c0	addcg $r0.3, $b0.1 = $r0.5, $r0.5, $b0.1
	c0	divs $r0.4, $b0.0 = $r0.4, $r0.6, $b0.0
;;
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.6, $b0.1
	c0	addcg $r0.5, $b0.0 = $r0.3, $r0.3, $b0.0
;;
	c0	addcg $r0.3, $b0.1 = $r0.5, $r0.5, $b0.1
	c0	divs $r0.4, $b0.0 = $r0.4, $r0.6, $b0.0
;;
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.6, $b0.1
	c0	addcg $r0.5, $b0.0 = $r0.3, $r0.3, $b0.0
;;
	c0	addcg $r0.3, $b0.1 = $r0.5, $r0.5, $b0.1
	c0	divs $r0.4, $b0.0 = $r0.4, $r0.6, $b0.0
;;
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.6, $b0.1
	c0	addcg $r0.5, $b0.0 = $r0.3, $r0.3, $b0.0
;;
	c0	addcg $r0.3, $b0.1 = $r0.5, $r0.5, $b0.1
	c0	divs $r0.4, $b0.0 = $r0.4, $r0.6, $b0.0
;;
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.6, $b0.1
	c0	addcg $r0.5, $b0.0 = $r0.3, $r0.3, $b0.0
;;
	c0	addcg $r0.3, $b0.1 = $r0.5, $r0.5, $b0.1
	c0	divs $r0.4, $b0.0 = $r0.4, $r0.6, $b0.0
;;
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.6, $b0.1
	c0	addcg $r0.5, $b0.0 = $r0.3, $r0.3, $b0.0
;;
	c0	addcg $r0.3, $b0.1 = $r0.5, $r0.5, $b0.1
	c0	divs $r0.4, $b0.0 = $r0.4, $r0.6, $b0.0
;;
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.6, $b0.1
	c0	addcg $r0.5, $b0.0 = $r0.3, $r0.3, $b0.0
;;
	c0	addcg $r0.3, $b0.1 = $r0.5, $r0.5, $b0.1
	c0	divs $r0.4, $b0.0 = $r0.4, $r0.6, $b0.0
;;
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.6, $b0.1
	c0	addcg $r0.5, $b0.0 = $r0.3, $r0.3, $b0.0
;;
	c0	addcg $r0.3, $b0.1 = $r0.5, $r0.5, $b0.1
	c0	divs $r0.4, $b0.0 = $r0.4, $r0.6, $b0.0
;;
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.6, $b0.1
	c0	addcg $r0.5, $b0.0 = $r0.3, $r0.3, $b0.0
;;
	c0	addcg $r0.3, $b0.1 = $r0.5, $r0.5, $b0.1
	c0	divs $r0.4, $b0.0 = $r0.4, $r0.6, $b0.0
;;
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.6, $b0.1
	c0	addcg $r0.5, $b0.0 = $r0.3, $r0.3, $b0.0
;;
	c0	addcg $r0.3, $b0.1 = $r0.5, $r0.5, $b0.1
	c0	divs $r0.4, $b0.0 = $r0.4, $r0.6, $b0.0
;;
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.6, $b0.1
	c0	addcg $r0.5, $b0.0 = $r0.3, $r0.3, $b0.0
;;
	c0	addcg $r0.3, $b0.1 = $r0.5, $r0.5, $b0.1
	c0	divs $r0.4, $b0.0 = $r0.4, $r0.6, $b0.0
;;
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.6, $b0.1
	c0	addcg $r0.5, $b0.0 = $r0.3, $r0.3, $b0.0
;;
	c0	cmpge $b0.0 = $r0.4, $r0.0
	c0	addcg $r0.3, $b0.1 = $r0.5, $r0.5, $b0.1
;;
	c0	orc $r0.3 = $r0.3, $r0.0
;;
	c0	mfb $r0.4 = $b0.0
;;
	c0	sh1add $r0.3 = $r0.3, $r0.4
;;
	c0	slct $r0.2 = $b0.2, $r0.2, $r0.3
	c0	goto LBB50_11
;;
LBB50_9:
	c0	mov $r0.2 = 65535
;;
LBB50_11:                               ## %cond.end.12
	c0	or $r0.3 = $r0.2, $r0.58
;;
LBB50_12:                               ## %cleanup
	c0	ldw $l0.0 = 32[$r0.1]
;;
	c0	ldw $r0.63 = 36[$r0.1]
;;
	c0	ldw $r0.62 = 40[$r0.1]
;;
	c0	ldw $r0.61 = 44[$r0.1]
;;
	c0	ldw $r0.60 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
.return ret($r0.3:u32)
	c0	ldw $r0.57 = 60[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

#.globl float32_rem
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_rem
float32_rem::
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
	c0	stw 40[$r0.1] = $l0.0
	c0	mov $r0.58 = $r0.3
;;
.call extractFloat32Frac, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	mov $r0.59 = $r0.4
	c0	call $l0.0 = extractFloat32Frac
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat32Exp, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	stw 28[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat32Exp
;;
	c0	mov $r0.60 = $r0.3
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat32Sign, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	stw 36[$r0.1] = $r0.60
	c0	call $l0.0 = extractFloat32Sign
;;
	c0	mov $r0.57 = $r0.3
	c0	mov $r0.3 = $r0.59
;;
.call extractFloat32Frac, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Frac
;;
	c0	cmpne $b0.0 = $r0.60, 255
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	stw 20[$r0.1] = $r0.2
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.59
;;
.call extractFloat32Exp, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	stw 24[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat32Exp
;;
	c0	stw 32[$r0.1] = $r0.3
;;
	c0	ldw $r0.2 = 20[$r0.1]
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
	c0	br $b0.0, LBB51_5
;;
## BB#1:                                ## %if.then
	c0	ldw $r0.2 = 28[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB51_4
;;
## BB#2:                                ## %lor.lhs.false
	c0	cmpne $b0.0 = $r0.3, 255
;;
;;
	c0	br $b0.0, LBB51_9
;;
## BB#3:                                ## %lor.lhs.false
	c0	ldw $r0.2 = 24[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB51_4
;;
	c0	goto LBB51_9
;;
LBB51_5:                                ## %if.end.10
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	brf $b0.0, LBB51_6
;;
## BB#8:                                ## %if.then.19
	c0	ldw $r0.3 = 24[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	brf $b0.0, LBB51_9
;;
## BB#10:                               ## %if.end.22
	c0	add $r0.5 = $r0.1, 24
	c0	add $r0.4 = $r0.1, 32
;;
.call normalizeFloat32Subnormal, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret()
	c0	call $l0.0 = normalizeFloat32Subnormal
;;
	c0	goto LBB51_11
;;
LBB51_6:                                ## %if.end.10
	c0	cmpne $b0.0 = $r0.3, 255
;;
;;
	c0	br $b0.0, LBB51_11
;;
## BB#7:                                ## %if.then.12
	c0	ldw $r0.2 = 24[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB51_38
;;
LBB51_4:                                ## %if.then.8
	c0	mov $r0.3 = $r0.58
	c0	mov $r0.4 = $r0.59
;;
.call propagateFloat32NaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = propagateFloat32NaN
;;
	c0	goto LBB51_37
;;
LBB51_11:                               ## %if.end.23
	c0	ldw $r0.2 = 36[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB51_14
;;
## BB#12:                               ## %if.then.25
	c0	ldw $r0.3 = 28[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB51_38
;;
## BB#13:                               ## %if.end.28
	c0	add $r0.5 = $r0.1, 28
	c0	add $r0.4 = $r0.1, 36
;;
.call normalizeFloat32Subnormal, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret()
	c0	call $l0.0 = normalizeFloat32Subnormal
;;
LBB51_14:                               ## %if.end.29
	c0	ldw $r0.4 = 28[$r0.1]
	c0	mov $r0.5 = 8
;;
	c0	ldw $r0.6 = 24[$r0.1]
;;
	c0	ldw $r0.3 = 36[$r0.1]
;;
	c0	ldw $r0.2 = 32[$r0.1]
	c0	shl $r0.7 = $r0.4, $r0.5
;;
	c0	shl $r0.5 = $r0.6, $r0.5
;;
	c0	sub $r0.4 = $r0.3, $r0.2
;;
	c0	or $r0.6 = $r0.7, -2147483648
;;
	c0	or $r0.5 = $r0.5, -2147483648
;;
	c0	stw 28[$r0.1] = $r0.6
	c0	cmpgt $b0.0 = $r0.4, -1
;;
	c0	stw 24[$r0.1] = $r0.5
;;
	c0	br $b0.0, LBB51_17
;;
## BB#15:                               ## %if.then.33
	c0	cmplt $b0.0 = $r0.4, -1
;;
;;
	c0	br $b0.0, LBB51_38
;;
## BB#16:                               ## %if.end.36
	c0	ldw $r0.5 = 28[$r0.1]
	c0	mov $r0.6 = 1
;;
;;
	c0	shru $r0.5 = $r0.5, $r0.6
;;
	c0	stw 28[$r0.1] = $r0.5
;;
LBB51_17:                               ## %if.end.37
	c0	ldw $r0.5 = 24[$r0.1]
;;
	c0	ldw $r0.6 = 28[$r0.1]
;;
;;
	c0	cmpltu $b0.0 = $r0.6, $r0.5
;;
;;
	c0	br $b0.0, LBB51_19
;;
## BB#18:                               ## %if.then.40
	c0	sub $r0.7 = $r0.6, $r0.5
;;
	c0	stw 28[$r0.1] = $r0.7
;;
LBB51_19:                               ## %if.end.42
	c0	cmplt $b0.0 = $r0.4, 33
;;
;;
	c0	br $b0.0, LBB51_20
;;
## BB#21:                               ## %while.body.lr.ph
	c0	ldw $r0.58 = 24[$r0.1]
	c0	mov $r0.4 = 2
;;
	c0	add $r0.5 = $r0.3, -2
	c0	ldw $r0.3 = 28[$r0.1]
;;
	c0	mov $r0.59 = 0
	c0	sub $r0.60 = $r0.5, $r0.2
;;
	c0	shru $r0.2 = $r0.58, $r0.4
;;
	c0	sub $r0.61 = $r0.59, $r0.2
;;
LBB51_22:                               ## %while.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	mov $r0.4 = $r0.59
	c0	mov $r0.5 = $r0.58
;;
.call estimateDiv64To32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = estimateDiv64To32
;;
	c0	add $r0.60 = $r0.60, -30
	c0	cmpgtu $b0.0 = $r0.3, 2
;;
	c0	add $r0.2 = $r0.3, -2
	c0	cmpgt $b0.1 = $r0.60, 30
;;
	c0	slct $r0.2 = $b0.0, $r0.2, 0
;;
	c0	mpyhs $r0.3 = $r0.2, $r0.61
	c0	mpylu $r0.4 = $r0.2, $r0.61
;;
;;
	c0	add $r0.3 = $r0.4, $r0.3
	c0	br $b0.1, LBB51_22
;;
## BB#23:                               ## %while.cond.while.end_crit_edge
	c0	add $r0.59 = $r0.60, -30
	c0	stw 28[$r0.1] = $r0.3
;;
	c0	goto LBB51_24
;;
LBB51_9:                                ## %if.end
	c0	mov $r0.3 = 16
;;
	c0	mov $r0.58 = 2147483647
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
	c0	goto LBB51_38
;;
LBB51_20:
	c0	cmpgeu $b0.0 = $r0.6, $r0.5
	c0	add $r0.59 = $r0.4, -32
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
LBB51_24:                               ## %while.end
	c0	ldw $r0.3 = 28[$r0.1]
	c0	cmplt $b0.0 = $r0.59, -31
;;
;;
	c0	br $b0.0, LBB51_26
;;
## BB#25:                               ## %if.then.55
	c0	ldw $r0.5 = 24[$r0.1]
	c0	mov $r0.58 = 0
;;
	c0	mov $r0.4 = $r0.58
;;
.call estimateDiv64To32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = estimateDiv64To32
;;
	c0	ldw $r0.2 = 24[$r0.1]
	c0	cmpgtu $b0.0 = $r0.3, 2
;;
	c0	add $r0.3 = $r0.3, -2
	c0	mov $r0.4 = 2
;;
	c0	sub $r0.5 = $r0.58, $r0.59
	c0	slct $r0.3 = $b0.0, $r0.3, 0
;;
	c0	ldw $r0.6 = 28[$r0.1]
	c0	shru $r0.4 = $r0.2, $r0.4
;;
	c0	shru $r0.2 = $r0.3, $r0.5
	c0	mov $r0.3 = 1
;;
	c0	mpyhs $r0.5 = $r0.2, $r0.4
	c0	mpylu $r0.7 = $r0.2, $r0.4
;;
	c0	add $r0.8 = $r0.59, 31
	c0	shru $r0.3 = $r0.6, $r0.3
;;
	c0	shl $r0.3 = $r0.3, $r0.8
	c0	stw 24[$r0.1] = $r0.4
;;
	c0	add $r0.4 = $r0.7, $r0.5
;;
	c0	sub $r0.3 = $r0.3, $r0.4
;;
	c0	stw 28[$r0.1] = $r0.3
	c0	goto LBB51_27
;;
LBB51_26:                               ## %if.else
	c0	ldw $r0.4 = 24[$r0.1]
	c0	mov $r0.5 = 2
;;
	c0	shru $r0.3 = $r0.3, $r0.5
;;
	c0	stw 28[$r0.1] = $r0.3
	c0	shru $r0.3 = $r0.4, $r0.5
;;
	c0	stw 24[$r0.1] = $r0.3
;;
LBB51_27:                               ## %do.body.preheader
	c0	ldw $r0.4 = 28[$r0.1]
	c0	mov $r0.6 = 1
;;
	c0	ldw $r0.5 = 24[$r0.1]
	c0	mov $r0.3 = 0
;;
	c0	shl $r0.8 = $r0.4, $r0.6
;;
	c0	shl $r0.7 = $r0.5, $r0.6
	c0	sub $r0.6 = $r0.3, $r0.8
;;
LBB51_28:                               ## %do.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	sub $r0.4 = $r0.4, $r0.5
	c0	add $r0.2 = $r0.2, 1
;;
	c0	add $r0.6 = $r0.6, $r0.7
	c0	cmpgt $b0.0 = $r0.4, -1
;;
;;
	c0	br $b0.0, LBB51_28
;;
## BB#29:                               ## %do.end
	c0	sub $r0.7 = $r0.5, $r0.6
	c0	stw 28[$r0.1] = $r0.4
;;
	c0	cmplt $b0.0 = $r0.7, 0
;;
;;
	c0	br $b0.0, LBB51_32
;;
## BB#30:                               ## %lor.lhs.false.81
	c0	and $r0.2 = $r0.2, 1
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB51_33
;;
## BB#31:                               ## %lor.lhs.false.81
	c0	cmpne $b0.0 = $r0.5, $r0.6
;;
;;
	c0	br $b0.0, LBB51_33
;;
LBB51_32:                               ## %if.then.86
	c0	add $r0.2 = $r0.5, $r0.4
;;
	c0	stw 28[$r0.1] = $r0.2
	c0	goto LBB51_34
;;
LBB51_33:                               ## %if.end.87thread-pre-split
	c0	ldw $r0.2 = 28[$r0.1]
;;
LBB51_34:                               ## %if.end.87
	c0	mov $r0.4 = 31
	c0	cmpgt $b0.0 = $r0.2, -1
;;
	c0	shru $r0.4 = $r0.2, $r0.4
;;
	c0	br $b0.0, LBB51_36
;;
## BB#35:                               ## %if.then.91
	c0	sub $r0.2 = $r0.3, $r0.2
;;
	c0	stw 28[$r0.1] = $r0.2
;;
LBB51_36:                               ## %if.end.93
	c0	ldw $r0.5 = 28[$r0.1]
	c0	xor $r0.3 = $r0.4, $r0.57
;;
	c0	ldw $r0.4 = 32[$r0.1]
;;
;;
.call normalizeRoundAndPackFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = normalizeRoundAndPackFloat32
;;
LBB51_37:                               ## %cleanup
	c0	mov $r0.58 = $r0.3
;;
LBB51_38:                               ## %cleanup
	c0	mov $r0.3 = $r0.58
	c0	ldw $l0.0 = 40[$r0.1]
;;
	c0	ldw $r0.61 = 44[$r0.1]
;;
	c0	ldw $r0.60 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
.return ret($r0.3:u32)
	c0	ldw $r0.57 = 60[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

#.globl float32_sqrt
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_sqrt
float32_sqrt::
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
	c0	mov $r0.57 = $r0.3
;;
.call extractFloat32Frac, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Frac
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.57
;;
.call extractFloat32Exp, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	stw 56[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat32Exp
;;
	c0	mov $r0.58 = $r0.3
	c0	mov $r0.3 = $r0.57
;;
.call extractFloat32Sign, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	stw 60[$r0.1] = $r0.58
	c0	call $l0.0 = extractFloat32Sign
;;
	c0	cmpne $b0.0 = $r0.58, 255
;;
;;
	c0	br $b0.0, LBB52_5
;;
## BB#1:                                ## %if.then
	c0	ldw $r0.2 = 56[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB52_3
;;
## BB#2:                                ## %if.then.3
	c0	mov $r0.4 = 0
	c0	mov $r0.3 = $r0.57
;;
.call propagateFloat32NaN, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = propagateFloat32NaN
;;
	c0	goto LBB52_21
;;
LBB52_5:                                ## %if.end.8
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB52_7
;;
## BB#6:                                ## %if.then.10
	c0	ldw $r0.2 = 56[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.2, $r0.58
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB52_4
;;
	c0	goto LBB52_22
;;
LBB52_3:                                ## %if.end
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB52_22
;;
LBB52_4:                                ## %if.end.7
	c0	mov $r0.3 = 16
;;
	c0	mov $r0.57 = 2147483647
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
	c0	goto LBB52_22
;;
LBB52_7:                                ## %if.end.14
	c0	cmpne $b0.0 = $r0.58, 0
;;
;;
	c0	br $b0.0, LBB52_11
;;
## BB#8:                                ## %if.then.16
	c0	ldw $r0.3 = 56[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB52_9
;;
## BB#10:                               ## %if.end.19
	c0	add $r0.5 = $r0.1, 56
	c0	add $r0.4 = $r0.1, 60
;;
.call normalizeFloat32Subnormal, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret()
	c0	call $l0.0 = normalizeFloat32Subnormal
;;
LBB52_11:                               ## %if.end.20
	c0	ldw $r0.2 = 56[$r0.1]
	c0	mov $r0.4 = 8
;;
	c0	ldw $r0.3 = 60[$r0.1]
;;
	c0	ldw $r0.5 = 60[$r0.1]
	c0	shl $r0.2 = $r0.2, $r0.4
;;
;;
	c0	add $r0.57 = $r0.5, -127
;;
	c0	or $r0.4 = $r0.2, -2147483648
;;
.call estimateSqrt32, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 56[$r0.1] = $r0.4
	c0	call $l0.0 = estimateSqrt32
;;
	c0	mov $r0.2 = 1
	c0	add $r0.4 = $r0.3, 2
;;
	c0	and $r0.5 = $r0.4, 126
	c0	stw 52[$r0.1] = $r0.4
;;
	c0	shr $r0.2 = $r0.57, $r0.2
	c0	cmpgtu $b0.0 = $r0.5, 5
;;
	c0	add $r0.58 = $r0.2, 126
;;
	c0	br $b0.0, LBB52_19
;;
## BB#12:                               ## %if.then.25
	c0	cmpltu $b0.0 = $r0.3, -2
;;
;;
	c0	br $b0.0, LBB52_14
;;
## BB#13:                               ## %if.then.27
	c0	mov $r0.2 = 2147483647
;;
	c0	stw 52[$r0.1] = $r0.2
	c0	goto LBB52_20
;;
LBB52_14:                               ## %if.else
	c0	ldw $r0.2 = 60[$r0.1]
	c0	add $r0.6 = $r0.1, 36
;;
	c0	ldw $r0.7 = 56[$r0.1]
	c0	add $r0.5 = $r0.1, 40
;;
	c0	ldw $r0.3 = 52[$r0.1]
;;
;;
	c0	mov $r0.4 = $r0.3
	c0	and $r0.2 = $r0.2, 1
;;
	c0	shru $r0.57 = $r0.7, $r0.2
;;
.call mul32To64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret()
	c0	stw 56[$r0.1] = $r0.57
	c0	call $l0.0 = mul32To64
;;
	c0	ldw $r0.6 = 36[$r0.1]
	c0	add $r0.8 = $r0.1, 44
;;
	c0	ldw $r0.5 = 40[$r0.1]
	c0	mov $r0.4 = 0
;;
	c0	add $r0.7 = $r0.1, 48
	c0	mov $r0.3 = $r0.57
;;
.call sub64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = sub64
;;
	c0	ldw $r0.2 = 48[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.2, -1
;;
;;
	c0	br $b0.0, LBB52_18
;;
## BB#15:                               ## %while.body.lr.ph
	c0	stw 32[$r0.1] = $r0.58
;;
	c0	ldw $r0.58 = 52[$r0.1]
	c0	add $r0.59 = $r0.1, 44
;;
	c0	mov $r0.60 = 1
	c0	add $r0.61 = $r0.1, 40
;;
	c0	mov $r0.62 = 0
	c0	add $r0.63 = $r0.1, 36
;;
	c0	add $r0.57 = $r0.1, 48
;;
LBB52_16:                               ## %while.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.58 = $r0.58, -1
	c0	mov $r0.6 = $r0.61
;;
	c0	mov $r0.5 = $r0.60
	c0	mov $r0.3 = $r0.62
;;
	c0	mov $r0.7 = $r0.63
	c0	mov $r0.4 = $r0.58
;;
.call shortShift64Left, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = shortShift64Left
;;
	c0	ldw $r0.2 = 36[$r0.1]
;;
	c0	ldw $r0.4 = 44[$r0.1]
;;
	c0	ldw $r0.5 = 40[$r0.1]
;;
	c0	ldw $r0.3 = 48[$r0.1]
	c0	mov $r0.8 = $r0.59
;;
	c0	mov $r0.7 = $r0.57
	c0	or $r0.6 = $r0.2, 1
;;
.call add64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	stw 36[$r0.1] = $r0.6
	c0	call $l0.0 = add64
;;
	c0	ldw $r0.2 = 48[$r0.1]
;;
;;
	c0	cmplt $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB52_16
;;
## BB#17:                               ## %while.cond.while.end_crit_edge
	c0	stw 52[$r0.1] = $r0.58
;;
	c0	ldw $r0.58 = 32[$r0.1]
;;
LBB52_18:                               ## %while.end
	c0	ldw $r0.3 = 44[$r0.1]
;;
	c0	ldw $r0.4 = 52[$r0.1]
;;
	c0	or $r0.2 = $r0.3, $r0.2
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	stw 52[$r0.1] = $r0.2
;;
LBB52_19:                               ## %if.end.36
	c0	ldw $r0.3 = 52[$r0.1]
	c0	mov $r0.4 = 1
;;
	c0	add $r0.5 = $r0.1, 52
;;
.call shift32RightJamming, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret()
	c0	call $l0.0 = shift32RightJamming
;;
LBB52_20:                               ## %roundAndPack
	c0	ldw $r0.5 = 52[$r0.1]
	c0	mov $r0.3 = 0
;;
	c0	mov $r0.4 = $r0.58
;;
.call roundAndPackFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = roundAndPackFloat32
;;
LBB52_21:                               ## %cleanup
	c0	mov $r0.57 = $r0.3
;;
LBB52_22:                               ## %cleanup
	c0	mov $r0.3 = $r0.57
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
.return ret($r0.3:u32)
	c0	ldw $r0.57 = 92[$r0.1]
	c0	return $r0.1 = $r0.1, 96, $l0.0
;;
LBB52_9:
	c0	mov $r0.57 = 0
	c0	goto LBB52_22
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @estimateSqrt32
estimateSqrt32::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $r0.57
;;
	c0	stw 24[$r0.1] = $l0.0
	c0	mov $r0.2 = 27
;;
	c0	and $r0.3 = $r0.3, 1
;;
	c0	cmpeq $b0.0 = $r0.3, 0
	c0	mov $r0.3 = 17
;;
	c0	shru $r0.2 = $r0.4, $r0.2
	c0	shru $r0.3 = $r0.4, $r0.3
;;
	c0	and $r0.2 = $r0.2, 15
	c0	brf $b0.0, LBB53_1
;;
## BB#3:                                ## %if.else
	c0	mov $r0.5 = estimateSqrt32.sqrtEvenAdjustments
;;
	c0	or $r0.3 = $r0.3, 32768
;;
	c0	sh1add $r0.2 = $r0.2, $r0.5
	c0	mov $r0.5 = 0
;;
	c0	ldhu $r0.2 = 0[$r0.2]
	c0	mtb $b0.0 = $r0.5
;;
;;
	c0	sub $r0.2 = $r0.3, $r0.2
	c0	mtb $b0.1 = $r0.5
;;
	c0	cmplt $r0.3 = $r0.2, $r0.0
;;
	c0	shru $r0.5 = $r0.4, $r0.3
	c0	shru $r0.6 = $r0.2, $r0.3
;;
	c0	addcg $r0.7, $b0.0 = $r0.5, $r0.5, $b0.0
;;
	c0	divs $r0.5, $b0.0 = $r0.0, $r0.6, $b0.0
	c0	addcg $r0.8, $b0.1 = $r0.7, $r0.7, $b0.1
;;
	c0	addcg $r0.7, $b0.0 = $r0.8, $r0.8, $b0.0
	c0	divs $r0.5, $b0.1 = $r0.5, $r0.6, $b0.1
;;
	c0	addcg $r0.8, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.5, $b0.0 = $r0.5, $r0.6, $b0.0
;;
	c0	addcg $r0.7, $b0.0 = $r0.8, $r0.8, $b0.0
	c0	divs $r0.5, $b0.1 = $r0.5, $r0.6, $b0.1
;;
	c0	addcg $r0.8, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.5, $b0.0 = $r0.5, $r0.6, $b0.0
;;
	c0	addcg $r0.7, $b0.0 = $r0.8, $r0.8, $b0.0
	c0	divs $r0.5, $b0.1 = $r0.5, $r0.6, $b0.1
;;
	c0	addcg $r0.8, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.5, $b0.0 = $r0.5, $r0.6, $b0.0
;;
	c0	addcg $r0.7, $b0.0 = $r0.8, $r0.8, $b0.0
	c0	divs $r0.5, $b0.1 = $r0.5, $r0.6, $b0.1
;;
	c0	addcg $r0.8, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.5, $b0.0 = $r0.5, $r0.6, $b0.0
;;
	c0	addcg $r0.7, $b0.0 = $r0.8, $r0.8, $b0.0
	c0	divs $r0.5, $b0.1 = $r0.5, $r0.6, $b0.1
;;
	c0	addcg $r0.8, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.5, $b0.0 = $r0.5, $r0.6, $b0.0
;;
	c0	addcg $r0.7, $b0.0 = $r0.8, $r0.8, $b0.0
	c0	divs $r0.5, $b0.1 = $r0.5, $r0.6, $b0.1
;;
	c0	addcg $r0.8, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.5, $b0.0 = $r0.5, $r0.6, $b0.0
;;
	c0	addcg $r0.7, $b0.0 = $r0.8, $r0.8, $b0.0
	c0	divs $r0.5, $b0.1 = $r0.5, $r0.6, $b0.1
;;
	c0	addcg $r0.8, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.5, $b0.0 = $r0.5, $r0.6, $b0.0
;;
	c0	addcg $r0.7, $b0.0 = $r0.8, $r0.8, $b0.0
	c0	divs $r0.5, $b0.1 = $r0.5, $r0.6, $b0.1
;;
	c0	addcg $r0.8, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.5, $b0.0 = $r0.5, $r0.6, $b0.0
;;
	c0	addcg $r0.7, $b0.0 = $r0.8, $r0.8, $b0.0
	c0	divs $r0.5, $b0.1 = $r0.5, $r0.6, $b0.1
;;
	c0	addcg $r0.8, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.5, $b0.0 = $r0.5, $r0.6, $b0.0
;;
	c0	addcg $r0.7, $b0.0 = $r0.8, $r0.8, $b0.0
	c0	divs $r0.5, $b0.1 = $r0.5, $r0.6, $b0.1
;;
	c0	addcg $r0.8, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.5, $b0.0 = $r0.5, $r0.6, $b0.0
;;
	c0	addcg $r0.7, $b0.0 = $r0.8, $r0.8, $b0.0
	c0	divs $r0.5, $b0.1 = $r0.5, $r0.6, $b0.1
;;
	c0	addcg $r0.8, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.5, $b0.0 = $r0.5, $r0.6, $b0.0
;;
	c0	addcg $r0.7, $b0.0 = $r0.8, $r0.8, $b0.0
	c0	divs $r0.5, $b0.1 = $r0.5, $r0.6, $b0.1
;;
	c0	addcg $r0.8, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.5, $b0.0 = $r0.5, $r0.6, $b0.0
;;
	c0	addcg $r0.7, $b0.0 = $r0.8, $r0.8, $b0.0
	c0	divs $r0.5, $b0.1 = $r0.5, $r0.6, $b0.1
;;
	c0	addcg $r0.8, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.5, $b0.0 = $r0.5, $r0.6, $b0.0
;;
	c0	addcg $r0.7, $b0.0 = $r0.8, $r0.8, $b0.0
	c0	divs $r0.5, $b0.1 = $r0.5, $r0.6, $b0.1
;;
	c0	addcg $r0.8, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.5, $b0.0 = $r0.5, $r0.6, $b0.0
;;
	c0	addcg $r0.7, $b0.0 = $r0.8, $r0.8, $b0.0
	c0	divs $r0.5, $b0.1 = $r0.5, $r0.6, $b0.1
;;
	c0	addcg $r0.8, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.5, $b0.0 = $r0.5, $r0.6, $b0.0
;;
	c0	divs $r0.5, $b0.1 = $r0.5, $r0.6, $b0.1
	c0	addcg $r0.6, $b0.0 = $r0.8, $r0.8, $b0.0
;;
	c0	cmpge $b0.0 = $r0.5, $r0.0
	c0	addcg $r0.5, $b0.1 = $r0.6, $r0.6, $b0.1
;;
	c0	mtb $b0.1 = $r0.3
	c0	orc $r0.3 = $r0.5, $r0.0
;;
	c0	mfb $r0.5 = $b0.0
	c0	cmpgeu $r0.6 = $r0.4, $r0.2
;;
	c0	sh1add $r0.3 = $r0.3, $r0.5
	c0	mov $r0.5 = 15
;;
	c0	slct $r0.3 = $b0.1, $r0.6, $r0.3
;;
	c0	mov $r0.6 = -32768
;;
	c0	add $r0.2 = $r0.2, $r0.3
;;
	c0	cmpgtu $b0.0 = $r0.2, 131071
;;
	c0	shl $r0.2 = $r0.2, $r0.5
;;
	c0	slct $r0.57 = $b0.0, $r0.6, $r0.2
;;
	c0	cmpgtu $b0.0 = $r0.57, $r0.4
;;
;;
	c0	br $b0.0, LBB53_2
;;
## BB#4:                                ## %if.then.17
	c0	mov $r0.2 = 1
;;
	c0	shr $r0.3 = $r0.4, $r0.2
	c0	goto LBB53_5
;;
LBB53_1:                                ## %if.then
	c0	mov $r0.5 = estimateSqrt32.sqrtOddAdjustments
;;
	c0	add $r0.3 = $r0.3, 16384
;;
	c0	sh1add $r0.2 = $r0.2, $r0.5
	c0	mov $r0.5 = 0
;;
	c0	ldhu $r0.2 = 0[$r0.2]
	c0	mtb $b0.0 = $r0.5
;;
;;
	c0	sub $r0.2 = $r0.3, $r0.2
	c0	mtb $b0.1 = $r0.5
;;
	c0	cmplt $r0.3 = $r0.2, $r0.0
;;
	c0	shru $r0.5 = $r0.2, $r0.3
	c0	shru $r0.6 = $r0.4, $r0.3
;;
	c0	addcg $r0.7, $b0.0 = $r0.6, $r0.6, $b0.0
;;
	c0	divs $r0.6, $b0.0 = $r0.0, $r0.5, $b0.0
	c0	addcg $r0.8, $b0.1 = $r0.7, $r0.7, $b0.1
;;
	c0	addcg $r0.7, $b0.0 = $r0.8, $r0.8, $b0.0
	c0	divs $r0.6, $b0.1 = $r0.6, $r0.5, $b0.1
;;
	c0	mov $r0.8 = 14
	c0	mov $r0.9 = 15
;;
	c0	mov $r0.10 = 1
	c0	cmpgeu $r0.11 = $r0.4, $r0.2
;;
	c0	shl $r0.2 = $r0.2, $r0.9
	c0	mtb $b0.2 = $r0.3
;;
	c0	shru $r0.4 = $r0.4, $r0.10
	c0	addcg $r0.3, $b0.1 = $r0.7, $r0.7, $b0.1
;;
	c0	divs $r0.6, $b0.0 = $r0.6, $r0.5, $b0.0
;;
	c0	divs $r0.6, $b0.1 = $r0.6, $r0.5, $b0.1
	c0	addcg $r0.7, $b0.0 = $r0.3, $r0.3, $b0.0
;;
	c0	addcg $r0.3, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.6, $b0.0 = $r0.6, $r0.5, $b0.0
;;
	c0	divs $r0.6, $b0.1 = $r0.6, $r0.5, $b0.1
	c0	addcg $r0.7, $b0.0 = $r0.3, $r0.3, $b0.0
;;
	c0	addcg $r0.3, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.6, $b0.0 = $r0.6, $r0.5, $b0.0
;;
	c0	divs $r0.6, $b0.1 = $r0.6, $r0.5, $b0.1
	c0	addcg $r0.7, $b0.0 = $r0.3, $r0.3, $b0.0
;;
	c0	addcg $r0.3, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.6, $b0.0 = $r0.6, $r0.5, $b0.0
;;
	c0	divs $r0.6, $b0.1 = $r0.6, $r0.5, $b0.1
	c0	addcg $r0.7, $b0.0 = $r0.3, $r0.3, $b0.0
;;
	c0	addcg $r0.3, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.6, $b0.0 = $r0.6, $r0.5, $b0.0
;;
	c0	divs $r0.6, $b0.1 = $r0.6, $r0.5, $b0.1
	c0	addcg $r0.7, $b0.0 = $r0.3, $r0.3, $b0.0
;;
	c0	addcg $r0.3, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.6, $b0.0 = $r0.6, $r0.5, $b0.0
;;
	c0	divs $r0.6, $b0.1 = $r0.6, $r0.5, $b0.1
	c0	addcg $r0.7, $b0.0 = $r0.3, $r0.3, $b0.0
;;
	c0	addcg $r0.3, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.6, $b0.0 = $r0.6, $r0.5, $b0.0
;;
	c0	divs $r0.6, $b0.1 = $r0.6, $r0.5, $b0.1
	c0	addcg $r0.7, $b0.0 = $r0.3, $r0.3, $b0.0
;;
	c0	addcg $r0.3, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.6, $b0.0 = $r0.6, $r0.5, $b0.0
;;
	c0	divs $r0.6, $b0.1 = $r0.6, $r0.5, $b0.1
	c0	addcg $r0.7, $b0.0 = $r0.3, $r0.3, $b0.0
;;
	c0	addcg $r0.3, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.6, $b0.0 = $r0.6, $r0.5, $b0.0
;;
	c0	divs $r0.6, $b0.1 = $r0.6, $r0.5, $b0.1
	c0	addcg $r0.7, $b0.0 = $r0.3, $r0.3, $b0.0
;;
	c0	addcg $r0.3, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.6, $b0.0 = $r0.6, $r0.5, $b0.0
;;
	c0	divs $r0.6, $b0.1 = $r0.6, $r0.5, $b0.1
	c0	addcg $r0.7, $b0.0 = $r0.3, $r0.3, $b0.0
;;
	c0	addcg $r0.3, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.6, $b0.0 = $r0.6, $r0.5, $b0.0
;;
	c0	divs $r0.6, $b0.1 = $r0.6, $r0.5, $b0.1
	c0	addcg $r0.7, $b0.0 = $r0.3, $r0.3, $b0.0
;;
	c0	addcg $r0.3, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.6, $b0.0 = $r0.6, $r0.5, $b0.0
;;
	c0	divs $r0.6, $b0.1 = $r0.6, $r0.5, $b0.1
	c0	addcg $r0.7, $b0.0 = $r0.3, $r0.3, $b0.0
;;
	c0	addcg $r0.3, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.6, $b0.0 = $r0.6, $r0.5, $b0.0
;;
	c0	divs $r0.6, $b0.1 = $r0.6, $r0.5, $b0.1
	c0	addcg $r0.7, $b0.0 = $r0.3, $r0.3, $b0.0
;;
	c0	addcg $r0.3, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.6, $b0.0 = $r0.6, $r0.5, $b0.0
;;
	c0	divs $r0.6, $b0.1 = $r0.6, $r0.5, $b0.1
	c0	addcg $r0.7, $b0.0 = $r0.3, $r0.3, $b0.0
;;
	c0	addcg $r0.3, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	divs $r0.6, $b0.0 = $r0.6, $r0.5, $b0.0
;;
	c0	divs $r0.5, $b0.1 = $r0.6, $r0.5, $b0.1
	c0	addcg $r0.6, $b0.0 = $r0.3, $r0.3, $b0.0
;;
	c0	cmpge $b0.0 = $r0.5, $r0.0
	c0	addcg $r0.3, $b0.1 = $r0.6, $r0.6, $b0.1
;;
	c0	orc $r0.3 = $r0.3, $r0.0
;;
	c0	mfb $r0.5 = $b0.0
;;
	c0	sh1add $r0.3 = $r0.3, $r0.5
;;
	c0	slct $r0.3 = $b0.2, $r0.11, $r0.3
;;
	c0	shl $r0.3 = $r0.3, $r0.8
;;
	c0	add $r0.57 = $r0.2, $r0.3
;;
LBB53_2:                                ## %if.end.19
	c0	mov $r0.2 = 0
	c0	mov $r0.3 = $r0.4
;;
	c0	mov $r0.5 = $r0.57
	c0	mov $r0.4 = $r0.2
;;
.call estimateDiv64To32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = estimateDiv64To32
;;
	c0	mov $r0.2 = 1
;;
	c0	shru $r0.4 = $r0.57, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	add $r0.3 = $r0.2, $r0.4
;;
LBB53_5:                                ## %cleanup
	c0	ldw $l0.0 = 24[$r0.1]
;;
	c0	ldw $r0.57 = 28[$r0.1]
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
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_eq
float32_eq::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $r0.57
;;
	c0	stw 24[$r0.1] = $r0.58
;;
	c0	stw 20[$r0.1] = $l0.0
	c0	mov $r0.58 = $r0.3
;;
.call extractFloat32Exp, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	mov $r0.57 = $r0.4
	c0	call $l0.0 = extractFloat32Exp
;;
	c0	cmpne $b0.0 = $r0.3, 255
;;
;;
	c0	br $b0.0, LBB54_2
;;
## BB#1:                                ## %land.lhs.true
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat32Frac, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Frac
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB54_4
;;
LBB54_2:                                ## %lor.lhs.false
	c0	mov $r0.3 = $r0.57
;;
.call extractFloat32Exp, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Exp
;;
	c0	cmpne $b0.0 = $r0.3, 255
;;
;;
	c0	br $b0.0, LBB54_8
;;
## BB#3:                                ## %land.lhs.true.4
	c0	mov $r0.3 = $r0.57
;;
.call extractFloat32Frac, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Frac
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB54_8
;;
LBB54_4:                                ## %if.then
	c0	mov $r0.3 = $r0.58
;;
.call float32_is_signaling_nan, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = float32_is_signaling_nan
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB54_7
;;
## BB#5:                                ## %lor.lhs.false.9
	c0	mov $r0.3 = $r0.57
;;
.call float32_is_signaling_nan, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = float32_is_signaling_nan
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB54_6
;;
LBB54_7:                                ## %if.then.12
	c0	mov $r0.3 = 16
	c0	mov $r0.57 = 0
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
	c0	goto LBB54_12
;;
LBB54_8:                                ## %if.end.13
	c0	cmpeq $b0.0 = $r0.58, $r0.57
;;
;;
	c0	brf $b0.0, LBB54_10
;;
## BB#9:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB54_11
;;
LBB54_10:                               ## %lor.rhs
	c0	or $r0.2 = $r0.57, $r0.58
;;
	c0	and $r0.2 = $r0.2, 2147483647
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
LBB54_11:                               ## %lor.end
	c0	mfb $r0.57 = $b0.0
;;
LBB54_12:                               ## %return
	c0	mov $r0.3 = $r0.57
	c0	ldw $l0.0 = 20[$r0.1]
;;
	c0	ldw $r0.58 = 24[$r0.1]
;;
	c0	ldw $r0.57 = 28[$r0.1]
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB54_6:
	c0	mov $r0.57 = 0
	c0	goto LBB54_12
;;
.endp

#.globl float32_le
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_le
float32_le::
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
	c0	mov $r0.57 = $r0.3
;;
.call extractFloat32Exp, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	mov $r0.58 = $r0.4
	c0	call $l0.0 = extractFloat32Exp
;;
	c0	cmpne $b0.0 = $r0.3, 255
;;
;;
	c0	br $b0.0, LBB55_2
;;
## BB#1:                                ## %land.lhs.true
	c0	mov $r0.3 = $r0.57
;;
.call extractFloat32Frac, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Frac
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB55_4
;;
LBB55_2:                                ## %lor.lhs.false
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat32Exp, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Exp
;;
	c0	cmpne $b0.0 = $r0.3, 255
;;
;;
	c0	br $b0.0, LBB55_5
;;
## BB#3:                                ## %land.lhs.true.4
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat32Frac, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Frac
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB55_5
;;
LBB55_4:                                ## %if.then
	c0	mov $r0.3 = 16
	c0	mov $r0.57 = 0
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
	c0	goto LBB55_11
;;
LBB55_5:                                ## %if.end
	c0	mov $r0.3 = $r0.57
;;
.call extractFloat32Sign, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Sign
;;
	c0	mov $r0.59 = $r0.3
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat32Sign, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Sign
;;
	c0	cmpeq $b0.0 = $r0.59, $r0.3
;;
;;
	c0	brf $b0.0, LBB55_6
;;
## BB#10:                               ## %if.end.13
	c0	cmpltu $b0.0 = $r0.57, $r0.58
	c0	cmpeq $b0.1 = $r0.57, $r0.58
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	cmpne $b0.0 = $r0.59, $r0.2
	c0	mfb $r0.2 = $b0.1
;;
;;
	c0	mfb $r0.3 = $b0.0
;;
	c0	or $r0.2 = $r0.2, $r0.3
;;
	c0	and $r0.57 = $r0.2, 1
	c0	goto LBB55_11
;;
LBB55_6:                                ## %if.then.10
	c0	cmpne $b0.0 = $r0.59, 0
;;
;;
	c0	brf $b0.0, LBB55_8
;;
## BB#7:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
	c0	mfb $r0.57 = $b0.0
	c0	goto LBB55_11
;;
LBB55_8:                                ## %lor.rhs
	c0	or $r0.2 = $r0.58, $r0.57
;;
	c0	and $r0.2 = $r0.2, 2147483647
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	mfb $r0.57 = $b0.0
;;
LBB55_11:                               ## %cleanup
	c0	mov $r0.3 = $r0.57
	c0	ldw $l0.0 = 16[$r0.1]
;;
	c0	ldw $r0.59 = 20[$r0.1]
;;
	c0	ldw $r0.58 = 24[$r0.1]
;;
	c0	ldw $r0.57 = 28[$r0.1]
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

#.globl float32_lt
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_lt
float32_lt::
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
	c0	mov $r0.57 = $r0.3
;;
.call extractFloat32Exp, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	mov $r0.58 = $r0.4
	c0	call $l0.0 = extractFloat32Exp
;;
	c0	cmpne $b0.0 = $r0.3, 255
;;
;;
	c0	br $b0.0, LBB56_2
;;
## BB#1:                                ## %land.lhs.true
	c0	mov $r0.3 = $r0.57
;;
.call extractFloat32Frac, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Frac
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB56_4
;;
LBB56_2:                                ## %lor.lhs.false
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat32Exp, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Exp
;;
	c0	cmpne $b0.0 = $r0.3, 255
;;
;;
	c0	br $b0.0, LBB56_5
;;
## BB#3:                                ## %land.lhs.true.4
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat32Frac, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Frac
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB56_5
;;
LBB56_4:                                ## %if.then
	c0	mov $r0.3 = 16
	c0	mov $r0.57 = 0
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
	c0	goto LBB56_11
;;
LBB56_5:                                ## %if.end
	c0	mov $r0.3 = $r0.57
;;
.call extractFloat32Sign, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Sign
;;
	c0	mov $r0.59 = $r0.3
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat32Sign, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Sign
;;
	c0	cmpeq $b0.0 = $r0.59, $r0.3
;;
;;
	c0	brf $b0.0, LBB56_6
;;
## BB#10:                               ## %if.end.13
	c0	cmpltu $b0.0 = $r0.57, $r0.58
	c0	cmpne $b0.1 = $r0.57, $r0.58
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	cmpne $b0.0 = $r0.59, $r0.2
	c0	mfb $r0.2 = $b0.1
;;
;;
	c0	mfb $r0.3 = $b0.0
;;
	c0	and $r0.2 = $r0.2, $r0.3
;;
	c0	and $r0.57 = $r0.2, 1
	c0	goto LBB56_11
;;
LBB56_6:                                ## %if.then.10
	c0	cmpeq $b0.0 = $r0.59, 0
;;
;;
	c0	br $b0.0, LBB56_7
;;
## BB#8:                                ## %land.rhs
	c0	or $r0.2 = $r0.58, $r0.57
;;
	c0	and $r0.2 = $r0.2, 2147483647
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	mfb $r0.57 = $b0.0
	c0	goto LBB56_11
;;
LBB56_7:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
	c0	mfb $r0.57 = $b0.0
;;
LBB56_11:                               ## %cleanup
	c0	mov $r0.3 = $r0.57
	c0	ldw $l0.0 = 16[$r0.1]
;;
	c0	ldw $r0.59 = 20[$r0.1]
;;
	c0	ldw $r0.58 = 24[$r0.1]
;;
	c0	ldw $r0.57 = 28[$r0.1]
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

#.globl float32_eq_signaling
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_eq_signaling
float32_eq_signaling::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $r0.57
;;
	c0	stw 24[$r0.1] = $r0.58
;;
	c0	stw 20[$r0.1] = $l0.0
	c0	mov $r0.57 = $r0.3
;;
.call extractFloat32Exp, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	mov $r0.58 = $r0.4
	c0	call $l0.0 = extractFloat32Exp
;;
	c0	cmpne $b0.0 = $r0.3, 255
;;
;;
	c0	br $b0.0, LBB57_2
;;
## BB#1:                                ## %land.lhs.true
	c0	mov $r0.3 = $r0.57
;;
.call extractFloat32Frac, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Frac
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB57_4
;;
LBB57_2:                                ## %lor.lhs.false
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat32Exp, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Exp
;;
	c0	cmpne $b0.0 = $r0.3, 255
;;
;;
	c0	br $b0.0, LBB57_5
;;
## BB#3:                                ## %land.lhs.true.4
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat32Frac, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Frac
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB57_5
;;
LBB57_4:                                ## %if.then
	c0	mov $r0.3 = 16
	c0	mov $r0.57 = 0
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
	c0	goto LBB57_9
;;
LBB57_5:                                ## %if.end
	c0	cmpeq $b0.0 = $r0.57, $r0.58
;;
;;
	c0	brf $b0.0, LBB57_7
;;
## BB#6:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB57_8
;;
LBB57_7:                                ## %lor.rhs
	c0	or $r0.2 = $r0.58, $r0.57
;;
	c0	and $r0.2 = $r0.2, 2147483647
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
LBB57_8:                                ## %lor.end
	c0	mfb $r0.57 = $b0.0
;;
LBB57_9:                                ## %return
	c0	mov $r0.3 = $r0.57
	c0	ldw $l0.0 = 20[$r0.1]
;;
	c0	ldw $r0.58 = 24[$r0.1]
;;
	c0	ldw $r0.57 = 28[$r0.1]
;;
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

#.globl float32_le_quiet
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_le_quiet
float32_le_quiet::
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
	c0	mov $r0.58 = $r0.3
;;
.call extractFloat32Exp, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	mov $r0.57 = $r0.4
	c0	call $l0.0 = extractFloat32Exp
;;
	c0	cmpne $b0.0 = $r0.3, 255
;;
;;
	c0	br $b0.0, LBB58_2
;;
## BB#1:                                ## %land.lhs.true
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat32Frac, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Frac
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB58_4
;;
LBB58_2:                                ## %lor.lhs.false
	c0	mov $r0.3 = $r0.57
;;
.call extractFloat32Exp, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Exp
;;
	c0	cmpne $b0.0 = $r0.3, 255
;;
;;
	c0	br $b0.0, LBB58_8
;;
## BB#3:                                ## %land.lhs.true.4
	c0	mov $r0.3 = $r0.57
;;
.call extractFloat32Frac, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Frac
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB58_8
;;
LBB58_4:                                ## %if.then
	c0	mov $r0.3 = $r0.58
;;
.call float32_is_signaling_nan, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = float32_is_signaling_nan
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB58_7
;;
## BB#5:                                ## %lor.lhs.false.9
	c0	mov $r0.3 = $r0.57
;;
.call float32_is_signaling_nan, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = float32_is_signaling_nan
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB58_6
;;
LBB58_7:                                ## %if.then.12
	c0	mov $r0.3 = 16
	c0	mov $r0.57 = 0
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
	c0	goto LBB58_14
;;
LBB58_8:                                ## %if.end.13
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat32Sign, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Sign
;;
	c0	mov $r0.59 = $r0.3
	c0	mov $r0.3 = $r0.57
;;
.call extractFloat32Sign, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Sign
;;
	c0	cmpeq $b0.0 = $r0.59, $r0.3
;;
;;
	c0	brf $b0.0, LBB58_9
;;
## BB#13:                               ## %if.end.20
	c0	cmpltu $b0.0 = $r0.58, $r0.57
	c0	cmpeq $b0.1 = $r0.58, $r0.57
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	cmpne $b0.0 = $r0.59, $r0.2
	c0	mfb $r0.2 = $b0.1
;;
;;
	c0	mfb $r0.3 = $b0.0
;;
	c0	or $r0.2 = $r0.2, $r0.3
;;
	c0	and $r0.57 = $r0.2, 1
	c0	goto LBB58_14
;;
LBB58_9:                                ## %if.then.17
	c0	cmpne $b0.0 = $r0.59, 0
;;
;;
	c0	brf $b0.0, LBB58_11
;;
## BB#10:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
	c0	mfb $r0.57 = $b0.0
	c0	goto LBB58_14
;;
LBB58_11:                               ## %lor.rhs
	c0	or $r0.2 = $r0.57, $r0.58
;;
	c0	and $r0.2 = $r0.2, 2147483647
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	mfb $r0.57 = $b0.0
	c0	goto LBB58_14
;;
LBB58_6:
	c0	mov $r0.57 = 0
;;
LBB58_14:                               ## %cleanup
	c0	mov $r0.3 = $r0.57
	c0	ldw $l0.0 = 16[$r0.1]
;;
	c0	ldw $r0.59 = 20[$r0.1]
;;
	c0	ldw $r0.58 = 24[$r0.1]
;;
	c0	ldw $r0.57 = 28[$r0.1]
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

#.globl float32_lt_quiet
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float32_lt_quiet
float32_lt_quiet::
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
	c0	mov $r0.58 = $r0.3
;;
.call extractFloat32Exp, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	mov $r0.57 = $r0.4
	c0	call $l0.0 = extractFloat32Exp
;;
	c0	cmpne $b0.0 = $r0.3, 255
;;
;;
	c0	br $b0.0, LBB59_2
;;
## BB#1:                                ## %land.lhs.true
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat32Frac, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Frac
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB59_4
;;
LBB59_2:                                ## %lor.lhs.false
	c0	mov $r0.3 = $r0.57
;;
.call extractFloat32Exp, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Exp
;;
	c0	cmpne $b0.0 = $r0.3, 255
;;
;;
	c0	br $b0.0, LBB59_8
;;
## BB#3:                                ## %land.lhs.true.4
	c0	mov $r0.3 = $r0.57
;;
.call extractFloat32Frac, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Frac
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB59_8
;;
LBB59_4:                                ## %if.then
	c0	mov $r0.3 = $r0.58
;;
.call float32_is_signaling_nan, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = float32_is_signaling_nan
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB59_7
;;
## BB#5:                                ## %lor.lhs.false.9
	c0	mov $r0.3 = $r0.57
;;
.call float32_is_signaling_nan, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = float32_is_signaling_nan
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB59_6
;;
LBB59_7:                                ## %if.then.12
	c0	mov $r0.3 = 16
	c0	mov $r0.57 = 0
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
	c0	goto LBB59_14
;;
LBB59_8:                                ## %if.end.13
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat32Sign, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Sign
;;
	c0	mov $r0.59 = $r0.3
	c0	mov $r0.3 = $r0.57
;;
.call extractFloat32Sign, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat32Sign
;;
	c0	cmpeq $b0.0 = $r0.59, $r0.3
;;
;;
	c0	brf $b0.0, LBB59_9
;;
## BB#13:                               ## %if.end.20
	c0	cmpltu $b0.0 = $r0.58, $r0.57
	c0	cmpne $b0.1 = $r0.58, $r0.57
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	cmpne $b0.0 = $r0.59, $r0.2
	c0	mfb $r0.2 = $b0.1
;;
;;
	c0	mfb $r0.3 = $b0.0
;;
	c0	and $r0.2 = $r0.2, $r0.3
;;
	c0	and $r0.57 = $r0.2, 1
	c0	goto LBB59_14
;;
LBB59_9:                                ## %if.then.17
	c0	cmpeq $b0.0 = $r0.59, 0
;;
;;
	c0	br $b0.0, LBB59_10
;;
## BB#11:                               ## %land.rhs
	c0	or $r0.2 = $r0.57, $r0.58
;;
	c0	and $r0.2 = $r0.2, 2147483647
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	mfb $r0.57 = $b0.0
	c0	goto LBB59_14
;;
LBB59_10:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
	c0	mfb $r0.57 = $b0.0
	c0	goto LBB59_14
;;
LBB59_6:
	c0	mov $r0.57 = 0
;;
LBB59_14:                               ## %cleanup
	c0	mov $r0.3 = $r0.57
	c0	ldw $l0.0 = 16[$r0.1]
;;
	c0	ldw $r0.59 = 20[$r0.1]
;;
	c0	ldw $r0.58 = 24[$r0.1]
;;
	c0	ldw $r0.57 = 28[$r0.1]
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

#.globl float64_to_int32
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_to_int32
float64_to_int32::
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
	c0	stw 44[$r0.1] = $l0.0
	c0	mov $r0.57 = $r0.3
;;
.call extractFloat64Frac1, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac1
;;
	c0	mov $r0.58 = $r0.3
	c0	mov $r0.3 = $r0.57
;;
.call extractFloat64Frac0, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac0
;;
	c0	mov $r0.59 = $r0.3
	c0	mov $r0.3 = $r0.57
;;
.call extractFloat64Exp, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Exp
;;
	c0	mov $r0.60 = $r0.3
	c0	mov $r0.3 = $r0.57
;;
.call extractFloat64Sign, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Sign
;;
	c0	add $r0.5 = $r0.60, -1043
;;
	c0	cmplt $b0.0 = $r0.5, 0
	c0	mov $r0.57 = $r0.3
;;
;;
	c0	br $b0.0, LBB60_5
;;
## BB#1:                                ## %if.then
	c0	cmplt $b0.0 = $r0.60, 1055
;;
;;
	c0	br $b0.0, LBB60_3
;;
## BB#2:                                ## %if.then.13
	c0	or $r0.2 = $r0.59, $r0.58
;;
	c0	cmpne $b0.0 = $r0.60, 2047
;;
	c0	cmpeq $b0.1 = $r0.2, 0
;;
;;
	c0	slct $r0.2 = $b0.1, $r0.57, 0
;;
	c0	slct $r0.57 = $b0.0, $r0.57, $r0.2
	c0	goto LBB60_18
;;
LBB60_5:                                ## %if.else
	c0	cmpne $b0.0 = $r0.58, 0
;;
	c0	cmpgt $b0.1 = $r0.60, 1021
;;
;;
	c0	mfb $r0.2 = $b0.0
	c0	br $b0.1, LBB60_7
;;
## BB#6:                                ## %if.then.24
	c0	or $r0.3 = $r0.60, $r0.59
	c0	mov $r0.4 = 0
;;
	c0	stw 40[$r0.1] = $r0.4
	c0	or $r0.2 = $r0.3, $r0.2
;;
	c0	stw 36[$r0.1] = $r0.2
	c0	goto LBB60_8
;;
LBB60_3:                                ## %if.end.16
	c0	or $r0.3 = $r0.59, 1048576
;;
	c0	add $r0.7 = $r0.1, 36
	c0	add $r0.6 = $r0.1, 40
;;
	c0	mov $r0.4 = $r0.58
;;
.call shortShift64Left, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = shortShift64Left
;;
	c0	ldw $r0.2 = 40[$r0.1]
;;
;;
	c0	cmpgtu $b0.0 = $r0.2, -2147483648
;;
;;
	c0	br $b0.0, LBB60_18
;;
## BB#4:                                ## %if.end.32thread-pre-split
	c0	ldw $r0.2 = 36[$r0.1]
	c0	goto LBB60_8
;;
LBB60_7:                                ## %if.else.27
	c0	mov $r0.3 = 1043
;;
	c0	and $r0.4 = $r0.5, 31
;;
	c0	or $r0.5 = $r0.59, 1048576
;;
	c0	sub $r0.3 = $r0.3, $r0.60
	c0	shl $r0.4 = $r0.5, $r0.4
;;
	c0	or $r0.2 = $r0.4, $r0.2
;;
	c0	stw 36[$r0.1] = $r0.2
	c0	shru $r0.3 = $r0.5, $r0.3
;;
	c0	stw 40[$r0.1] = $r0.3
;;
LBB60_8:                                ## %if.end.32
	c0	mov $r0.3 = float_rounding_mode
;;
	c0	ldw $r0.3 = 0[$r0.3]
;;
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	brf $b0.0, LBB60_9
;;
## BB#13:                               ## %if.else.48
	c0	cmpne $b0.0 = $r0.2, 0
	c0	ldw $r0.2 = 40[$r0.1]
;;
	c0	cmpeq $b0.1 = $r0.57, 0
;;
	c0	mfb $r0.4 = $b0.0
;;
	c0	stw 36[$r0.1] = $r0.4
	c0	br $b0.1, LBB60_15
;;
## BB#14:                               ## %if.then.52
	c0	cmpeq $b0.0 = $r0.3, 3
	c0	mov $r0.3 = 0
;;
;;
	c0	mfb $r0.5 = $b0.0
;;
	c0	and $r0.4 = $r0.4, $r0.5
;;
	c0	and $r0.4 = $r0.4, 1
;;
	c0	add $r0.2 = $r0.4, $r0.2
;;
	c0	sub $r0.58 = $r0.3, $r0.2
	c0	goto LBB60_16
;;
LBB60_9:                                ## %if.then.35
	c0	cmpgt $b0.0 = $r0.2, -1
;;
;;
	c0	br $b0.0, LBB60_12
;;
## BB#10:                               ## %if.then.38
	c0	ldw $r0.2 = 36[$r0.1]
;;
	c0	ldw $r0.3 = 40[$r0.1]
;;
	c0	and $r0.4 = $r0.2, 2147483647
;;
	c0	add $r0.2 = $r0.3, 1
	c0	cmpne $b0.0 = $r0.4, 0
;;
	c0	stw 40[$r0.1] = $r0.2
;;
	c0	br $b0.0, LBB60_12
;;
## BB#11:                               ## %if.then.42
	c0	and $r0.2 = $r0.2, -2
;;
	c0	stw 40[$r0.1] = $r0.2
;;
LBB60_12:                               ## %if.end.45
	c0	ldw $r0.2 = 40[$r0.1]
	c0	cmpne $b0.0 = $r0.57, 0
;;
	c0	mov $r0.3 = 0
;;
	c0	sub $r0.3 = $r0.3, $r0.2
;;
	c0	slct $r0.58 = $b0.0, $r0.3, $r0.2
	c0	goto LBB60_16
;;
LBB60_15:                               ## %if.else.57
	c0	cmpeq $b0.0 = $r0.3, 2
;;
;;
	c0	mfb $r0.3 = $b0.0
;;
	c0	and $r0.3 = $r0.4, $r0.3
;;
	c0	and $r0.3 = $r0.3, 1
;;
	c0	add $r0.58 = $r0.2, $r0.3
;;
LBB60_16:                               ## %if.end.63
	c0	cmpeq $b0.0 = $r0.58, 0
;;
;;
	c0	br $b0.0, LBB60_19
;;
## BB#17:                               ## %if.end.63
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.2 = $r0.58, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.57, $r0.2
;;
;;
	c0	br $b0.0, LBB60_19
;;
LBB60_18:                               ## %invalid
	c0	cmpne $b0.0 = $r0.57, 0
	c0	mov $r0.3 = 16
;;
	c0	mov $r0.2 = -2147483648
;;
	c0	slct $r0.58 = $b0.0, $r0.2, 2147483647
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
	c0	goto LBB60_21
;;
LBB60_19:                               ## %if.end.72
	c0	ldw $r0.2 = 36[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB60_21
;;
## BB#20:                               ## %if.then.74
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.3 = 0[$r0.2]
;;
;;
	c0	or $r0.3 = $r0.3, 1
;;
	c0	stw 0[$r0.2] = $r0.3
;;
LBB60_21:                               ## %cleanup
	c0	mov $r0.3 = $r0.58
	c0	ldw $l0.0 = 44[$r0.1]
;;
	c0	ldw $r0.60 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
.return ret($r0.3:u32)
	c0	ldw $r0.57 = 60[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

#.globl float64_to_int32_round_to_zero
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_to_int32_round_to_zero
float64_to_int32_round_to_zero::
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
	c0	stw 44[$r0.1] = $l0.0
	c0	mov $r0.57 = $r0.3
;;
.call extractFloat64Frac1, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac1
;;
	c0	mov $r0.58 = $r0.3
	c0	mov $r0.3 = $r0.57
;;
.call extractFloat64Frac0, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac0
;;
	c0	mov $r0.59 = $r0.3
	c0	mov $r0.3 = $r0.57
;;
.call extractFloat64Exp, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Exp
;;
	c0	mov $r0.60 = $r0.3
	c0	mov $r0.3 = $r0.57
;;
.call extractFloat64Sign, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Sign
;;
	c0	add $r0.5 = $r0.60, -1043
;;
	c0	cmplt $b0.0 = $r0.5, 0
	c0	mov $r0.57 = $r0.3
;;
;;
	c0	br $b0.0, LBB61_4
;;
## BB#1:                                ## %if.then
	c0	cmplt $b0.0 = $r0.60, 1055
;;
;;
	c0	br $b0.0, LBB61_3
;;
## BB#2:                                ## %if.then.13
	c0	or $r0.2 = $r0.59, $r0.58
;;
	c0	cmpne $b0.0 = $r0.60, 2047
;;
	c0	cmpeq $b0.1 = $r0.2, 0
;;
;;
	c0	slct $r0.2 = $b0.1, $r0.57, 0
;;
	c0	slct $r0.57 = $b0.0, $r0.57, $r0.2
	c0	goto LBB61_9
;;
LBB61_4:                                ## %if.else
	c0	cmpgt $b0.0 = $r0.60, 1022
;;
;;
	c0	br $b0.0, LBB61_6
;;
## BB#5:                                ## %if.then.19
	c0	or $r0.2 = $r0.59, $r0.58
	c0	mov $r0.58 = 0
;;
	c0	or $r0.2 = $r0.2, $r0.60
	c0	goto LBB61_11
;;
LBB61_3:                                ## %if.end.16
	c0	or $r0.3 = $r0.59, 1048576
;;
	c0	add $r0.7 = $r0.1, 36
	c0	add $r0.6 = $r0.1, 40
;;
	c0	mov $r0.4 = $r0.58
;;
.call shortShift64Left, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = shortShift64Left
;;
	c0	goto LBB61_7
;;
LBB61_6:                                ## %if.end.26
	c0	mov $r0.2 = 1043
;;
	c0	and $r0.3 = $r0.5, 31
;;
	c0	or $r0.4 = $r0.59, 1048576
;;
	c0	sub $r0.2 = $r0.2, $r0.60
	c0	shl $r0.3 = $r0.4, $r0.3
;;
	c0	or $r0.3 = $r0.3, $r0.58
;;
	c0	stw 36[$r0.1] = $r0.3
	c0	shru $r0.2 = $r0.4, $r0.2
;;
	c0	stw 40[$r0.1] = $r0.2
;;
LBB61_7:                                ## %if.end.30
	c0	ldw $r0.2 = 40[$r0.1]
	c0	cmpne $b0.0 = $r0.57, 0
;;
	c0	mov $r0.3 = 0
;;
	c0	cmpeq $b0.1 = $r0.2, 0
	c0	sub $r0.3 = $r0.3, $r0.2
;;
	c0	slct $r0.58 = $b0.0, $r0.3, $r0.2
;;
	c0	br $b0.1, LBB61_10
;;
## BB#8:                                ## %if.end.30
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.2 = $r0.58, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.57, $r0.2
;;
;;
	c0	br $b0.0, LBB61_10
;;
LBB61_9:                                ## %invalid
	c0	cmpne $b0.0 = $r0.57, 0
	c0	mov $r0.3 = 16
;;
	c0	mov $r0.2 = -2147483648
;;
	c0	slct $r0.58 = $b0.0, $r0.2, 2147483647
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
	c0	goto LBB61_13
;;
LBB61_10:                               ## %if.end.40
	c0	ldw $r0.2 = 36[$r0.1]
;;
LBB61_11:                               ## %if.end.40
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB61_13
;;
## BB#12:                               ## %if.then.42
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.3 = 0[$r0.2]
;;
;;
	c0	or $r0.3 = $r0.3, 1
;;
	c0	stw 0[$r0.2] = $r0.3
;;
LBB61_13:                               ## %cleanup
	c0	mov $r0.3 = $r0.58
	c0	ldw $l0.0 = 44[$r0.1]
;;
	c0	ldw $r0.60 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
.return ret($r0.3:u32)
	c0	ldw $r0.57 = 60[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

#.globl float64_to_float32
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_to_float32
float64_to_float32::
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
	c0	stw 68[$r0.1] = $l0.0
	c0	mov $r0.59 = $r0.4
;;
.call extractFloat64Frac1, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	mov $r0.60 = $r0.3
	c0	call $l0.0 = extractFloat64Frac1
;;
	c0	mov $r0.61 = $r0.3
	c0	mov $r0.3 = $r0.60
;;
.call extractFloat64Frac0, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac0
;;
	c0	mov $r0.62 = $r0.3
	c0	mov $r0.3 = $r0.60
;;
.call extractFloat64Exp, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Exp
;;
	c0	mov $r0.58 = $r0.3
	c0	mov $r0.3 = $r0.60
;;
.call extractFloat64Sign, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Sign
;;
	c0	cmpne $b0.0 = $r0.58, 2047
;;
	c0	mov $r0.57 = $r0.3
;;
	c0	br $b0.0, LBB62_4
;;
## BB#1:                                ## %if.then
	c0	or $r0.2 = $r0.62, $r0.61
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB62_3
;;
## BB#2:                                ## %if.then.12
	c0	add $r0.3 = $r0.1, 48
	c0	mov $r0.4 = $r0.60
;;
	c0	mov $r0.5 = $r0.59
;;
.call float64ToCommonNaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret()
	c0	call $l0.0 = float64ToCommonNaN
;;
	c0	ldw $r0.4 = 52[$r0.1]
;;
	c0	ldw $r0.3 = 48[$r0.1]
;;
.call commonNaNToFloat32, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = commonNaNToFloat32
;;
	c0	goto LBB62_7
;;
LBB62_4:                                ## %if.end.19
	c0	add $r0.7 = $r0.1, 64
	c0	add $r0.6 = $r0.1, 60
;;
	c0	mov $r0.5 = 22
	c0	cmpeq $b0.0 = $r0.58, 0
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	stw 44[$r0.1] = $r0.2
	c0	mov $r0.4 = $r0.61
;;
	c0	mov $r0.3 = $r0.62
;;
.call shift64RightJamming, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = shift64RightJamming
;;
	c0	ldw $r0.2 = 44[$r0.1]
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
	c0	br $b0.0, LBB62_6
;;
## BB#5:                                ## %if.then.21
	c0	ldw $r0.2 = 64[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.2, 1073741824
;;
	c0	stw 64[$r0.1] = $r0.2
;;
LBB62_6:                                ## %if.end.23
	c0	ldw $r0.5 = 64[$r0.1]
;;
	c0	add $r0.4 = $r0.58, -897
;;
	c0	mov $r0.3 = $r0.57
;;
.call roundAndPackFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = roundAndPackFloat32
;;
	c0	goto LBB62_7
;;
LBB62_3:                                ## %if.end
	c0	mov $r0.5 = 0
	c0	mov $r0.4 = 255
;;
	c0	mov $r0.3 = $r0.57
;;
.call packFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = packFloat32
;;
LBB62_7:                                ## %cleanup
	c0	ldw $l0.0 = 68[$r0.1]
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
.return ret($r0.3:u32)
	c0	ldw $r0.57 = 92[$r0.1]
	c0	return $r0.1 = $r0.1, 96, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @commonNaNToFloat32
commonNaNToFloat32::
## BB#0:                                ## %entry
	c0	mov $r0.2 = 9
	c0	mov $r0.5 = 31
;;
	c0	shl $r0.3 = $r0.3, $r0.5
	c0	shru $r0.2 = $r0.4, $r0.2
;;
	c0	or $r0.2 = $r0.3, $r0.2
;;
	c0	or $r0.3 = $r0.2, 2143289344
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64ToCommonNaN
float64ToCommonNaN::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 60[$r0.1] = $r0.57
;;
	c0	stw 56[$r0.1] = $r0.58
;;
	c0	stw 52[$r0.1] = $r0.59
;;
	c0	stw 48[$r0.1] = $l0.0
	c0	mov $r0.58 = $r0.4
;;
	c0	mov $r0.57 = $r0.3
	c0	mov $r0.59 = $r0.5
;;
	c0	mov $r0.3 = $r0.58
	c0	mov $r0.4 = $r0.59
;;
.call float64_is_signaling_nan, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = float64_is_signaling_nan
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB64_2
;;
## BB#1:                                ## %if.then
	c0	mov $r0.3 = 16
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
LBB64_2:                                ## %if.end
	c0	add $r0.2 = $r0.1, 32
	c0	mov $r0.8 = 31
;;
	c0	mov $r0.5 = 12
	c0	or $r0.6 = $r0.2, 4
;;
	c0	mov $r0.4 = $r0.59
	c0	mov $r0.3 = $r0.58
;;
	c0	add $r0.7 = $r0.2, 8
	c0	shru $r0.2 = $r0.58, $r0.8
;;
.call shortShift64Left, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	stw 32[$r0.1] = $r0.2
	c0	call $l0.0 = shortShift64Left
;;
	c0	ldw $r0.2 = 40[$r0.1]
;;
	c0	ldw $r0.3 = 32[$r0.1]
;;
	c0	ldw $r0.4 = 36[$r0.1]
;;
	c0	stw 8[$r0.57] = $r0.2
;;
	c0	stw 0[$r0.57] = $r0.3
;;
	c0	stw 4[$r0.57] = $r0.4
;;
	c0	ldw $l0.0 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
	c0	ldw $r0.57 = 60[$r0.1]
;;
.return ret()
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

#.globl float64_round_to_int
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_round_to_int
float64_round_to_int::
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
	c0	stw 36[$r0.1] = $l0.0
	c0	mov $r0.58 = $r0.3
;;
.call extractFloat64Exp, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	mov $r0.57 = $r0.4
	c0	call $l0.0 = extractFloat64Exp
;;
	c0	mov $r0.59 = $r0.3
;;
	c0	cmplt $b0.0 = $r0.59, 1043
;;
;;
	c0	br $b0.0, LBB65_16
;;
## BB#1:                                ## %if.then
	c0	cmplt $b0.0 = $r0.59, 1075
;;
;;
	c0	br $b0.0, LBB65_5
;;
## BB#2:                                ## %if.then.4
	c0	cmpne $b0.0 = $r0.59, 2047
;;
;;
	c0	br $b0.0, LBB65_48
;;
## BB#3:                                ## %land.lhs.true
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat64Frac0, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac0
;;
	c0	mov $r0.4 = $r0.57
	c0	mov $r0.59 = $r0.3
;;
.call extractFloat64Frac1, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac1
;;
	c0	or $r0.2 = $r0.3, $r0.59
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB65_48
;;
## BB#4:                                ## %if.then.12
	c0	mov $r0.5 = $r0.58
	c0	mov $r0.4 = $r0.57
;;
	c0	mov $r0.3 = $r0.58
	c0	mov $r0.6 = $r0.57
;;
.call propagateFloat64NaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = propagateFloat64NaN
;;
	c0	goto LBB65_26
;;
LBB65_16:                               ## %if.else.67
	c0	cmpgt $b0.0 = $r0.59, 1022
;;
;;
	c0	br $b0.0, LBB65_36
;;
## BB#17:                               ## %if.then.70
	c0	mov $r0.2 = 1
;;
	c0	shl $r0.2 = $r0.58, $r0.2
;;
	c0	or $r0.2 = $r0.2, $r0.57
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB65_48
;;
## BB#18:                               ## %if.end.78
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
	c0	mov $r0.3 = $r0.58
;;
	c0	mov $r0.60 = float_rounding_mode
;;
	c0	or $r0.4 = $r0.4, 1
;;
.call extractFloat64Sign, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
	c0	call $l0.0 = extractFloat64Sign
;;
	c0	ldw $r0.2 = 0[$r0.60]
	c0	mov $r0.60 = $r0.3
;;
;;
	c0	cmpeq $b0.0 = $r0.2, 3
;;
;;
	c0	br $b0.0, LBB65_27
;;
## BB#19:                               ## %if.end.78
	c0	cmpeq $b0.0 = $r0.2, 2
;;
;;
	c0	brf $b0.0, LBB65_20
;;
## BB#31:                               ## %sw.bb.101
	c0	cmpeq $b0.0 = $r0.60, 0
;;
;;
	c0	br $b0.0, LBB65_34
;;
## BB#32:                               ## %cond.true.103
	c0	mov $r0.4 = 0
	c0	mov $r0.3 = 1
;;
	c0	goto LBB65_33
;;
LBB65_5:                                ## %if.end.18
	c0	mov $r0.2 = float_rounding_mode
;;
	c0	mov $r0.3 = 1074
;;
	c0	ldw $r0.2 = 0[$r0.2]
	c0	mov $r0.4 = 2
;;
	c0	stw 24[$r0.1] = $r0.58
;;
	c0	stw 28[$r0.1] = $r0.57
	c0	sub $r0.3 = $r0.3, $r0.59
;;
	c0	shl $r0.62 = $r0.4, $r0.3
	c0	cmpeq $b0.0 = $r0.2, 1
;;
;;
	c0	br $b0.0, LBB65_15
;;
## BB#6:                                ## %if.end.18
	c0	add $r0.4 = $r0.1, 24
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	add $r0.59 = $r0.62, -1
	c0	or $r0.60 = $r0.4, 4
;;
	c0	br $b0.0, LBB65_13
;;
## BB#7:                                ## %if.then.22
	c0	cmpgtu $b0.0 = $r0.3, 30
;;
;;
	c0	br $b0.0, LBB65_10
;;
## BB#8:                                ## %if.then.24
	c0	ldw $r0.3 = 24[$r0.1]
	c0	mov $r0.2 = 1
;;
	c0	add $r0.7 = $r0.1, 24
	c0	mov $r0.5 = 0
;;
	c0	mov $r0.4 = $r0.57
	c0	mov $r0.8 = $r0.60
;;
	c0	shru $r0.6 = $r0.62, $r0.2
;;
.call add64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = add64
;;
	c0	ldw $r0.2 = 28[$r0.1]
;;
;;
	c0	and $r0.3 = $r0.2, $r0.59
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB65_15
;;
## BB#9:                                ## %if.then.31
	c0	andc $r0.2 = $r0.62, $r0.2
;;
	c0	stw 28[$r0.1] = $r0.2
	c0	goto LBB65_15
;;
LBB65_36:                               ## %if.end.109
	c0	mov $r0.2 = float_rounding_mode
;;
	c0	mov $r0.4 = 1043
;;
	c0	ldw $r0.2 = 0[$r0.2]
	c0	mov $r0.60 = 0
;;
	c0	mov $r0.3 = 1
	c0	stw 28[$r0.1] = $r0.60
;;
	c0	sub $r0.4 = $r0.4, $r0.59
	c0	stw 24[$r0.1] = $r0.58
;;
	c0	shl $r0.59 = $r0.3, $r0.4
	c0	cmpeq $b0.0 = $r0.2, 1
;;
;;
	c0	br $b0.0, LBB65_43
;;
## BB#37:                               ## %if.end.109
	c0	cmpne $b0.0 = $r0.2, 0
	c0	add $r0.61 = $r0.59, -1
;;
;;
	c0	br $b0.0, LBB65_40
;;
## BB#38:                               ## %if.then.118
	c0	shru $r0.2 = $r0.59, $r0.3
;;
	c0	add $r0.2 = $r0.2, $r0.58
;;
	c0	and $r0.3 = $r0.2, $r0.61
	c0	stw 24[$r0.1] = $r0.2
;;
	c0	or $r0.3 = $r0.3, $r0.57
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB65_43
;;
## BB#39:                               ## %if.then.127
	c0	andc $r0.2 = $r0.59, $r0.2
	c0	goto LBB65_42
;;
LBB65_13:                               ## %if.then.50
	c0	ldw $r0.61 = 24[$r0.1]
	c0	cmpeq $b0.0 = $r0.2, 2
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	stw 20[$r0.1] = $r0.2
	c0	mov $r0.3 = $r0.61
;;
.call extractFloat64Sign, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Sign
;;
	c0	ldw $r0.2 = 20[$r0.1]
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	cmpeq $b0.0 = $r0.3, $r0.2
;;
;;
	c0	br $b0.0, LBB65_15
;;
## BB#14:                               ## %if.then.56
	c0	add $r0.7 = $r0.1, 24
	c0	mov $r0.5 = 0
;;
	c0	mov $r0.3 = $r0.61
	c0	mov $r0.6 = $r0.59
;;
	c0	mov $r0.4 = $r0.57
	c0	mov $r0.8 = $r0.60
;;
.call add64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = add64
;;
	c0	goto LBB65_15
;;
LBB65_40:                               ## %if.then.135
	c0	cmpeq $b0.0 = $r0.2, 2
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	stw 20[$r0.1] = $r0.2
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat64Sign, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Sign
;;
	c0	ldw $r0.2 = 20[$r0.1]
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	cmpeq $b0.0 = $r0.3, $r0.2
;;
;;
	c0	br $b0.0, LBB65_43
;;
## BB#41:                               ## %if.then.143
	c0	cmpne $b0.0 = $r0.57, 0
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	or $r0.2 = $r0.2, $r0.58
;;
	c0	add $r0.2 = $r0.61, $r0.2
;;
LBB65_42:                               ## %if.end.153
	c0	stw 24[$r0.1] = $r0.2
;;
LBB65_43:                               ## %if.end.153
	c0	ldw $r0.2 = 24[$r0.1]
	c0	sub $r0.3 = $r0.60, $r0.59
;;
;;
	c0	and $r0.2 = $r0.2, $r0.3
;;
	c0	stw 24[$r0.1] = $r0.2
	c0	goto LBB65_44
;;
LBB65_27:                               ## %sw.bb.97
	c0	cmpeq $b0.0 = $r0.60, 0
;;
;;
	c0	br $b0.0, LBB65_29
;;
## BB#28:                               ## %cond.true
	c0	mov $r0.5 = 0
;;
	c0	mov $r0.4 = 1023
;;
	c0	mov $r0.3 = 1
	c0	goto LBB65_24
;;
LBB65_20:                               ## %if.end.78
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB65_35
;;
## BB#21:                               ## %sw.bb
	c0	cmpne $b0.0 = $r0.59, 1022
;;
;;
	c0	br $b0.0, LBB65_35
;;
## BB#22:                               ## %land.lhs.true.85
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat64Frac0, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac0
;;
	c0	mov $r0.4 = $r0.57
	c0	mov $r0.57 = $r0.3
;;
.call extractFloat64Frac1, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac1
;;
	c0	or $r0.2 = $r0.3, $r0.57
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB65_35
;;
## BB#23:                               ## %if.then.94
	c0	mov $r0.5 = 0
;;
	c0	mov $r0.4 = 1023
;;
	c0	mov $r0.3 = $r0.60
;;
LBB65_24:                               ## %cleanup
	c0	mov $r0.6 = $r0.5
	c0	goto LBB65_25
;;
LBB65_35:                               ## %sw.epilog
	c0	mov $r0.4 = 0
	c0	mov $r0.3 = $r0.60
;;
LBB65_33:                               ## %cleanup
	c0	mov $r0.5 = $r0.4
	c0	mov $r0.6 = $r0.4
;;
	c0	goto LBB65_25
;;
LBB65_10:                               ## %if.else
	c0	cmpgt $b0.0 = $r0.57, -1
;;
;;
	c0	br $b0.0, LBB65_15
;;
## BB#11:                               ## %if.then.37
	c0	ldw $r0.2 = 24[$r0.1]
;;
;;
	c0	add $r0.2 = $r0.2, 1
;;
	c0	stw 24[$r0.1] = $r0.2
;;
	c0	ldw $r0.3 = 28[$r0.1]
;;
;;
	c0	and $r0.3 = $r0.3, 2147483647
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB65_15
;;
## BB#12:                               ## %if.then.42
	c0	and $r0.2 = $r0.2, -2
;;
	c0	stw 24[$r0.1] = $r0.2
;;
LBB65_15:                               ## %if.end.63
	c0	ldw $r0.2 = 28[$r0.1]
	c0	mov $r0.3 = 0
;;
	c0	sub $r0.3 = $r0.3, $r0.62
;;
	c0	and $r0.2 = $r0.2, $r0.3
;;
	c0	stw 28[$r0.1] = $r0.2
;;
LBB65_44:                               ## %if.end.157
	c0	ldw $r0.2 = 28[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.2, $r0.57
;;
;;
	c0	br $b0.0, LBB65_46
;;
## BB#45:                               ## %lor.lhs.false
	c0	ldw $r0.2 = 24[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.58
;;
;;
	c0	br $b0.0, LBB65_47
;;
LBB65_46:                               ## %if.then.166
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.3 = 0[$r0.2]
;;
;;
	c0	or $r0.3 = $r0.3, 1
;;
	c0	stw 0[$r0.2] = $r0.3
;;
LBB65_47:                               ## %if.end.168
	c0	ldw $r0.57 = 28[$r0.1]
;;
	c0	ldw $r0.58 = 24[$r0.1]
	c0	goto LBB65_48
;;
LBB65_34:                               ## %cond.false.105
	c0	mov $r0.3 = 0
;;
	c0	mov $r0.4 = 1023
;;
	c0	mov $r0.5 = $r0.3
	c0	mov $r0.6 = $r0.3
;;
	c0	goto LBB65_25
;;
LBB65_29:                               ## %cond.false
	c0	mov $r0.3 = 0
;;
	c0	mov $r0.5 = $r0.3
	c0	mov $r0.4 = $r0.3
;;
	c0	mov $r0.6 = $r0.3
;;
LBB65_25:                               ## %cleanup
.call packFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = packFloat64
;;
LBB65_26:                               ## %cleanup
	c0	mov $r0.57 = $r0.3
	c0	mov $r0.58 = $r0.4
;;
LBB65_48:                               ## %cleanup
	c0	mov $r0.3 = $r0.57
	c0	mov $r0.4 = $r0.58
;;
	c0	ldw $l0.0 = 36[$r0.1]
;;
	c0	ldw $r0.62 = 40[$r0.1]
;;
	c0	ldw $r0.61 = 44[$r0.1]
;;
	c0	ldw $r0.60 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	ldw $r0.57 = 60[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @propagateFloat64NaN
propagateFloat64NaN::
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
	c0	mov $r0.58 = $r0.4
;;
	c0	mov $r0.59 = $r0.3
	c0	mov $r0.57 = $r0.6
;;
.call float64_is_signaling_nan, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	mov $r0.60 = $r0.5
	c0	call $l0.0 = float64_is_signaling_nan
;;
	c0	mov $r0.62 = $r0.3
	c0	mov $r0.4 = $r0.57
;;
	c0	mov $r0.3 = $r0.60
;;
.call float64_is_nan, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = float64_is_nan
;;
	c0	mov $r0.61 = $r0.3
	c0	mov $r0.4 = $r0.57
;;
	c0	mov $r0.3 = $r0.60
;;
.call float64_is_signaling_nan, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = float64_is_signaling_nan
;;
	c0	mov $r0.63 = $r0.3
;;
	c0	or $r0.2 = $r0.63, $r0.62
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB66_2
;;
## BB#1:                                ## %if.then
	c0	mov $r0.3 = 16
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
LBB66_2:                                ## %if.end
	c0	cmpne $b0.0 = $r0.63, 0
;;
	c0	or $r0.4 = $r0.60, 524288
;;
;;
	c0	br $b0.0, LBB66_6
;;
## BB#3:                                ## %cond.false
	c0	cmpne $b0.0 = $r0.62, 0
;;
	c0	or $r0.2 = $r0.59, 524288
;;
;;
	c0	brf $b0.0, LBB66_5
;;
## BB#4:
	c0	mov $r0.4 = $r0.2
	c0	mov $r0.57 = $r0.58
;;
	c0	goto LBB66_6
;;
LBB66_5:                                ## %cond.false.22
	c0	cmpeq $b0.0 = $r0.61, 0
;;
;;
	c0	slct $r0.57 = $b0.0, $r0.58, $r0.57
	c0	slct $r0.4 = $b0.0, $r0.2, $r0.4
;;
LBB66_6:                                ## %cond.end.27
	c0	mov $r0.3 = $r0.57
	c0	ldw $l0.0 = 32[$r0.1]
;;
	c0	ldw $r0.63 = 36[$r0.1]
;;
	c0	ldw $r0.62 = 40[$r0.1]
;;
	c0	ldw $r0.61 = 44[$r0.1]
;;
	c0	ldw $r0.60 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	ldw $r0.57 = 60[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

#.globl float64_add
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_add
float64_add::
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
	c0	stw 40[$r0.1] = $l0.0
	c0	mov $r0.57 = $r0.3
;;
	c0	mov $r0.59 = $r0.5
	c0	mov $r0.60 = $r0.6
;;
.call extractFloat64Sign, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	mov $r0.58 = $r0.4
	c0	call $l0.0 = extractFloat64Sign
;;
	c0	mov $r0.61 = $r0.3
	c0	mov $r0.3 = $r0.59
;;
.call extractFloat64Sign, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Sign
;;
	c0	mov $r0.6 = $r0.60
	c0	mov $r0.5 = $r0.59
;;
	c0	mov $r0.4 = $r0.58
	c0	cmpne $b0.0 = $r0.61, $r0.3
;;
;;
	c0	br $b0.0, LBB67_2
;;
## BB#1:                                ## %if.then
	c0	mov $r0.3 = $r0.57
	c0	mov $r0.7 = $r0.61
;;
.call addFloat64Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = addFloat64Sigs
;;
	c0	goto LBB67_3
;;
LBB67_2:                                ## %if.else
	c0	mov $r0.3 = $r0.57
	c0	mov $r0.7 = $r0.61
;;
.call subFloat64Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = subFloat64Sigs
;;
LBB67_3:                                ## %cleanup
	c0	ldw $l0.0 = 40[$r0.1]
;;
	c0	ldw $r0.61 = 44[$r0.1]
;;
	c0	ldw $r0.60 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	ldw $r0.57 = 60[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @addFloat64Sigs
addFloat64Sigs::
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
	c0	mov $r0.59 = $r0.4
;;
	c0	mov $r0.62 = $r0.5
	c0	mov $r0.61 = $r0.6
;;
	c0	stw 32[$r0.1] = $r0.7
	c0	mov $r0.60 = $r0.3
;;
.call extractFloat64Frac1, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac1
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.60
;;
.call extractFloat64Frac0, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 56[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat64Frac0
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.60
;;
.call extractFloat64Exp, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 60[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat64Exp
;;
	c0	mov $r0.4 = $r0.61
	c0	mov $r0.58 = $r0.3
;;
.call extractFloat64Frac1, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac1
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.62
;;
.call extractFloat64Frac0, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 48[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat64Frac0
;;
	c0	mov $r0.57 = $r0.3
	c0	mov $r0.3 = $r0.62
;;
.call extractFloat64Exp, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 52[$r0.1] = $r0.57
	c0	call $l0.0 = extractFloat64Exp
;;
	c0	mov $r0.63 = $r0.3
;;
	c0	sub $r0.6 = $r0.58, $r0.63
;;
	c0	cmplt $b0.0 = $r0.6, 1
;;
;;
	c0	br $b0.0, LBB68_9
;;
## BB#1:                                ## %if.then
	c0	cmpne $b0.0 = $r0.58, 2047
;;
;;
	c0	br $b0.0, LBB68_5
;;
## BB#2:                                ## %if.then.22
	c0	ldw $r0.2 = 60[$r0.1]
;;
	c0	ldw $r0.3 = 56[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.3, $r0.2
	c0	goto LBB68_3
;;
LBB68_9:                                ## %if.else.34
	c0	cmpgt $b0.0 = $r0.6, -1
;;
;;
	c0	brf $b0.0, LBB68_10
;;
## BB#20:                               ## %if.else.56
	c0	ldw $r0.6 = 48[$r0.1]
;;
	c0	cmpne $b0.0 = $r0.58, 2047
;;
	c0	ldw $r0.4 = 56[$r0.1]
;;
	c0	ldw $r0.3 = 60[$r0.1]
	c0	br $b0.0, LBB68_22
;;
## BB#21:                               ## %if.then.58
	c0	or $r0.2 = $r0.3, $r0.57
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
LBB68_3:                                ## %if.then.22
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB68_4
;;
	c0	goto LBB68_28
;;
LBB68_5:                                ## %if.end.29
	c0	cmpne $b0.0 = $r0.63, 0
;;
;;
	c0	brf $b0.0, LBB68_6
;;
## BB#7:                                ## %if.else
	c0	or $r0.2 = $r0.57, 1048576
;;
	c0	stw 52[$r0.1] = $r0.2
	c0	goto LBB68_8
;;
LBB68_10:                               ## %if.then.36
	c0	cmpne $b0.0 = $r0.63, 2047
;;
;;
	c0	br $b0.0, LBB68_14
;;
## BB#11:                               ## %if.then.38
	c0	ldw $r0.2 = 48[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.2, $r0.57
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB68_12
;;
LBB68_4:                                ## %if.then.23
	c0	mov $r0.5 = $r0.62
	c0	mov $r0.4 = $r0.59
;;
	c0	mov $r0.3 = $r0.60
	c0	mov $r0.6 = $r0.61
;;
.call propagateFloat64NaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = propagateFloat64NaN
;;
	c0	goto LBB68_27
;;
LBB68_22:                               ## %if.end.70
	c0	add $r0.8 = $r0.1, 40
	c0	add $r0.7 = $r0.1, 44
;;
	c0	cmpne $b0.0 = $r0.58, 0
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	stw 28[$r0.1] = $r0.2
	c0	mov $r0.5 = $r0.57
;;
.call add64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = add64
;;
	c0	ldw $r0.2 = 28[$r0.1]
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
	c0	brf $b0.0, LBB68_23
;;
## BB#24:                               ## %if.end.74
	c0	ldw $r0.2 = 44[$r0.1]
	c0	mov $r0.3 = 0
;;
	c0	stw 36[$r0.1] = $r0.3
;;
	c0	or $r0.2 = $r0.2, 2097152
;;
	c0	stw 44[$r0.1] = $r0.2
;;
	c0	ldw $r0.57 = 32[$r0.1]
	c0	goto LBB68_25
;;
LBB68_6:                                ## %if.then.31
	c0	add $r0.6 = $r0.6, -1
;;
LBB68_8:                                ## %if.end.33
	c0	ldw $r0.57 = 32[$r0.1]
;;
	c0	ldw $r0.4 = 48[$r0.1]
	c0	add $r0.9 = $r0.1, 36
;;
	c0	ldw $r0.3 = 52[$r0.1]
	c0	add $r0.7 = $r0.1, 52
;;
	c0	mov $r0.5 = 0
	c0	add $r0.8 = $r0.1, 48
;;
.call shift64ExtraRightJamming, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32,$r0.9:u32), ret()
	c0	call $l0.0 = shift64ExtraRightJamming
;;
	c0	goto LBB68_18
;;
LBB68_14:                               ## %if.end.49
	c0	cmpne $b0.0 = $r0.58, 0
	c0	ldw $r0.57 = 32[$r0.1]
;;
;;
	c0	brf $b0.0, LBB68_15
;;
## BB#16:                               ## %if.else.52
	c0	ldw $r0.2 = 60[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.2, 1048576
;;
	c0	stw 60[$r0.1] = $r0.2
	c0	goto LBB68_17
;;
LBB68_23:                               ## %if.then.72
	c0	ldw $r0.6 = 40[$r0.1]
	c0	mov $r0.4 = 0
;;
	c0	ldw $r0.5 = 44[$r0.1]
;;
	c0	ldw $r0.3 = 32[$r0.1]
;;
.call packFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = packFloat64
;;
	c0	goto LBB68_27
;;
LBB68_12:                               ## %if.end.47
	c0	mov $r0.5 = 0
;;
	c0	mov $r0.4 = 2047
;;
	c0	ldw $r0.3 = 32[$r0.1]
	c0	mov $r0.6 = $r0.5
;;
.call packFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = packFloat64
;;
	c0	goto LBB68_27
;;
LBB68_15:                               ## %if.then.51
	c0	add $r0.6 = $r0.6, 1
;;
LBB68_17:                               ## %if.end.54
	c0	mov $r0.5 = 0
	c0	ldw $r0.4 = 56[$r0.1]
;;
	c0	ldw $r0.3 = 60[$r0.1]
	c0	sub $r0.6 = $r0.5, $r0.6
;;
	c0	add $r0.7 = $r0.1, 60
	c0	add $r0.9 = $r0.1, 36
;;
	c0	add $r0.8 = $r0.1, 56
;;
.call shift64ExtraRightJamming, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32,$r0.9:u32), ret()
	c0	call $l0.0 = shift64ExtraRightJamming
;;
	c0	mov $r0.58 = $r0.63
;;
LBB68_18:                               ## %if.end.77
	c0	ldw $r0.2 = 60[$r0.1]
	c0	add $r0.8 = $r0.1, 40
;;
	c0	ldw $r0.6 = 48[$r0.1]
	c0	add $r0.7 = $r0.1, 44
;;
	c0	ldw $r0.5 = 52[$r0.1]
;;
	c0	ldw $r0.4 = 56[$r0.1]
;;
	c0	or $r0.3 = $r0.2, 1048576
;;
	c0	stw 60[$r0.1] = $r0.3
;;
.call add64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = add64
;;
	c0	ldw $r0.2 = 44[$r0.1]
;;
;;
	c0	cmpltu $b0.0 = $r0.2, 2097152
;;
;;
	c0	brf $b0.0, LBB68_25
;;
## BB#19:
	c0	add $r0.58 = $r0.58, -1
	c0	goto LBB68_26
;;
LBB68_25:                               ## %shiftRight1
	c0	ldw $r0.5 = 36[$r0.1]
	c0	add $r0.8 = $r0.1, 40
;;
	c0	ldw $r0.4 = 40[$r0.1]
	c0	add $r0.7 = $r0.1, 44
;;
	c0	ldw $r0.3 = 44[$r0.1]
	c0	mov $r0.6 = 1
;;
	c0	add $r0.9 = $r0.1, 36
;;
.call shift64ExtraRightJamming, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32,$r0.9:u32), ret()
	c0	call $l0.0 = shift64ExtraRightJamming
;;
LBB68_26:                               ## %roundAndPack
	c0	ldw $r0.7 = 36[$r0.1]
;;
	c0	ldw $r0.6 = 40[$r0.1]
;;
	c0	ldw $r0.5 = 44[$r0.1]
	c0	mov $r0.4 = $r0.58
;;
	c0	mov $r0.3 = $r0.57
;;
.call roundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = roundAndPackFloat64
;;
LBB68_27:                               ## %cleanup
	c0	mov $r0.59 = $r0.3
	c0	mov $r0.60 = $r0.4
;;
LBB68_28:                               ## %cleanup
	c0	mov $r0.3 = $r0.59
	c0	mov $r0.4 = $r0.60
;;
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
.return ret($r0.3:u32,$r0.4:u32)
	c0	ldw $r0.57 = 92[$r0.1]
	c0	return $r0.1 = $r0.1, 96, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-128, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @subFloat64Sigs
subFloat64Sigs::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -128
;;
	c0	stw 124[$r0.1] = $r0.57
;;
	c0	stw 120[$r0.1] = $r0.58
;;
	c0	stw 116[$r0.1] = $r0.59
;;
	c0	stw 112[$r0.1] = $r0.60
;;
	c0	stw 108[$r0.1] = $r0.61
;;
	c0	stw 104[$r0.1] = $r0.62
;;
	c0	stw 100[$r0.1] = $r0.63
;;
	c0	stw 96[$r0.1] = $l0.0
;;
	c0	stw 56[$r0.1] = $r0.4
	c0	add $r0.2 = $r0.1, 80
;;
	c0	stw 68[$r0.1] = $r0.2
	c0	mov $r0.58 = 10
;;
	c0	add $r0.57 = $r0.1, 92
	c0	add $r0.60 = $r0.1, 88
;;
	c0	mov $r0.59 = $r0.3
;;
	c0	stw 52[$r0.1] = $r0.59
	c0	mov $r0.62 = $r0.5
;;
	c0	stw 44[$r0.1] = $r0.62
	c0	mov $r0.63 = $r0.6
;;
	c0	stw 48[$r0.1] = $r0.63
;;
	c0	stw 60[$r0.1] = $r0.7
	c0	add $r0.61 = $r0.1, 84
;;
.call extractFloat64Frac1, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac1
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.59
;;
.call extractFloat64Frac0, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 88[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat64Frac0
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.59
;;
.call extractFloat64Exp, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 92[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat64Exp
;;
	c0	mov $r0.4 = $r0.63
	c0	mov $r0.59 = $r0.3
;;
.call extractFloat64Frac1, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac1
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.62
;;
.call extractFloat64Frac0, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 80[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat64Frac0
;;
	c0	mov $r0.63 = $r0.3
	c0	mov $r0.3 = $r0.62
;;
.call extractFloat64Exp, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 84[$r0.1] = $r0.63
	c0	call $l0.0 = extractFloat64Exp
;;
	c0	ldw $r0.4 = 88[$r0.1]
;;
	c0	ldw $r0.2 = 92[$r0.1]
	c0	mov $r0.7 = $r0.60
;;
	c0	mov $r0.60 = $r0.3
	c0	mov $r0.6 = $r0.57
;;
	c0	mov $r0.5 = $r0.58
	c0	sub $r0.57 = $r0.59, $r0.60
;;
	c0	mov $r0.3 = $r0.2
;;
.call shortShift64Left, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = shortShift64Left
;;
	c0	ldw $r0.4 = 80[$r0.1]
	c0	cmpgt $b0.0 = $r0.57, 0
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	stw 64[$r0.1] = $r0.2
	c0	mov $r0.6 = $r0.61
;;
	c0	mov $r0.5 = $r0.58
	c0	mov $r0.3 = $r0.63
;;
	c0	ldw $r0.7 = 68[$r0.1]
;;
;;
.call shortShift64Left, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = shortShift64Left
;;
	c0	ldw $r0.2 = 64[$r0.1]
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
	c0	brf $b0.0, LBB69_1
;;
## BB#24:                               ## %aExpBigger
	c0	cmpne $b0.0 = $r0.59, 2047
;;
;;
	c0	br $b0.0, LBB69_27
;;
## BB#25:                               ## %if.then.79
	c0	ldw $r0.2 = 92[$r0.1]
;;
	c0	ldw $r0.3 = 88[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB69_5
;;
## BB#26:
	c0	ldw $r0.57 = 56[$r0.1]
;;
	c0	ldw $r0.58 = 52[$r0.1]
	c0	goto LBB69_34
;;
LBB69_1:                                ## %if.end
	c0	cmplt $b0.0 = $r0.57, 0
;;
;;
	c0	br $b0.0, LBB69_15
;;
## BB#2:                                ## %if.end.23
	c0	cmpeq $b0.0 = $r0.59, 0
;;
;;
	c0	brf $b0.0, LBB69_3
;;
## BB#7:                                ## %if.then.39
	c0	mov $r0.59 = 1
;;
	c0	mov $r0.60 = $r0.59
	c0	goto LBB69_8
;;
LBB69_27:                               ## %if.end.89
	c0	cmpne $b0.0 = $r0.60, 0
;;
;;
	c0	brf $b0.0, LBB69_28
;;
## BB#29:                               ## %if.else.93
	c0	ldw $r0.2 = 84[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.2, 1073741824
;;
	c0	stw 84[$r0.1] = $r0.2
	c0	goto LBB69_30
;;
LBB69_15:                               ## %bExpBigger
	c0	cmpne $b0.0 = $r0.60, 2047
;;
;;
	c0	br $b0.0, LBB69_19
;;
## BB#16:                               ## %if.then.57
	c0	ldw $r0.2 = 84[$r0.1]
;;
	c0	ldw $r0.3 = 80[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB69_5
;;
## BB#17:                               ## %if.end.66
	c0	mov $r0.5 = 0
	c0	ldw $r0.2 = 60[$r0.1]
;;
;;
	c0	xor $r0.3 = $r0.2, 1
;;
	c0	mov $r0.4 = 2047
;;
	c0	mov $r0.6 = $r0.5
;;
.call packFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = packFloat64
;;
	c0	goto LBB69_33
;;
LBB69_3:                                ## %if.end.23
	c0	cmpne $b0.0 = $r0.59, 2047
;;
;;
	c0	br $b0.0, LBB69_8
;;
## BB#4:                                ## %if.then.25
	c0	ldw $r0.2 = 92[$r0.1]
;;
	c0	ldw $r0.3 = 88[$r0.1]
;;
	c0	ldw $r0.4 = 84[$r0.1]
;;
	c0	ldw $r0.5 = 80[$r0.1]
	c0	or $r0.2 = $r0.3, $r0.2
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	or $r0.2 = $r0.2, $r0.5
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB69_6
;;
LBB69_5:                                ## %if.then.28
	c0	ldw $r0.5 = 44[$r0.1]
;;
	c0	ldw $r0.4 = 56[$r0.1]
;;
	c0	ldw $r0.3 = 52[$r0.1]
;;
	c0	ldw $r0.6 = 48[$r0.1]
;;
;;
.call propagateFloat64NaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = propagateFloat64NaN
;;
	c0	goto LBB69_33
;;
LBB69_8:                                ## %if.end.40
	c0	ldw $r0.2 = 92[$r0.1]
;;
	c0	ldw $r0.3 = 84[$r0.1]
;;
;;
	c0	cmpltu $b0.0 = $r0.3, $r0.2
;;
;;
	c0	brf $b0.0, LBB69_10
;;
## BB#9:
	c0	ldw $r0.58 = 60[$r0.1]
	c0	goto LBB69_31
;;
LBB69_28:                               ## %if.then.92
	c0	add $r0.57 = $r0.57, -1
;;
LBB69_30:                               ## %if.end.95
	c0	ldw $r0.58 = 60[$r0.1]
;;
	c0	ldw $r0.4 = 80[$r0.1]
	c0	add $r0.7 = $r0.1, 80
;;
	c0	ldw $r0.3 = 84[$r0.1]
	c0	add $r0.6 = $r0.1, 84
;;
	c0	mov $r0.5 = $r0.57
;;
.call shift64RightJamming, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = shift64RightJamming
;;
	c0	ldw $r0.2 = 92[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.2, 1073741824
;;
	c0	stw 92[$r0.1] = $r0.2
;;
LBB69_31:                               ## %aBigger
	c0	ldw $r0.6 = 80[$r0.1]
	c0	add $r0.8 = $r0.1, 72
;;
	c0	ldw $r0.3 = 92[$r0.1]
	c0	add $r0.7 = $r0.1, 76
;;
	c0	ldw $r0.4 = 88[$r0.1]
;;
	c0	ldw $r0.5 = 84[$r0.1]
;;
;;
.call sub64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = sub64
;;
	c0	mov $r0.60 = $r0.59
	c0	goto LBB69_32
;;
LBB69_10:                               ## %if.end.43
	c0	cmpltu $b0.0 = $r0.2, $r0.3
;;
;;
	c0	brf $b0.0, LBB69_12
;;
## BB#11:
	c0	ldw $r0.58 = 60[$r0.1]
	c0	goto LBB69_23
;;
LBB69_19:                               ## %if.end.68
	c0	cmpne $b0.0 = $r0.59, 0
	c0	ldw $r0.58 = 60[$r0.1]
;;
;;
	c0	brf $b0.0, LBB69_20
;;
## BB#21:                               ## %if.else
	c0	ldw $r0.2 = 92[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.2, 1073741824
;;
	c0	stw 92[$r0.1] = $r0.2
	c0	goto LBB69_22
;;
LBB69_12:                               ## %if.end.46
	c0	ldw $r0.2 = 88[$r0.1]
;;
	c0	ldw $r0.3 = 80[$r0.1]
;;
;;
	c0	cmpltu $b0.0 = $r0.3, $r0.2
	c0	ldw $r0.58 = 60[$r0.1]
;;
;;
	c0	br $b0.0, LBB69_31
;;
## BB#13:                               ## %if.end.49
	c0	cmpltu $b0.0 = $r0.2, $r0.3
;;
;;
	c0	br $b0.0, LBB69_23
;;
## BB#14:                               ## %if.end.52
	c0	mov $r0.2 = float_rounding_mode
;;
	c0	mov $r0.4 = 0
	c0	ldw $r0.2 = 0[$r0.2]
;;
	c0	mov $r0.5 = $r0.4
	c0	mov $r0.6 = $r0.4
;;
	c0	cmpeq $b0.0 = $r0.2, 3
;;
;;
	c0	mfb $r0.3 = $b0.0
;;
.call packFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = packFloat64
;;
	c0	goto LBB69_33
;;
LBB69_20:                               ## %if.then.71
	c0	add $r0.57 = $r0.57, 1
;;
LBB69_22:                               ## %if.end.73
	c0	mov $r0.2 = 0
	c0	ldw $r0.4 = 88[$r0.1]
;;
	c0	ldw $r0.3 = 92[$r0.1]
	c0	add $r0.6 = $r0.1, 92
;;
	c0	add $r0.7 = $r0.1, 88
	c0	sub $r0.5 = $r0.2, $r0.57
;;
.call shift64RightJamming, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = shift64RightJamming
;;
	c0	ldw $r0.2 = 84[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.2, 1073741824
;;
	c0	stw 84[$r0.1] = $r0.2
;;
LBB69_23:                               ## %bBigger
	c0	ldw $r0.6 = 88[$r0.1]
	c0	add $r0.8 = $r0.1, 72
;;
	c0	ldw $r0.3 = 84[$r0.1]
	c0	add $r0.7 = $r0.1, 76
;;
	c0	ldw $r0.4 = 80[$r0.1]
;;
	c0	ldw $r0.5 = 92[$r0.1]
	c0	xor $r0.58 = $r0.58, 1
;;
;;
.call sub64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = sub64
;;
LBB69_32:                               ## %normalizeRoundAndPack
	c0	ldw $r0.6 = 72[$r0.1]
	c0	add $r0.4 = $r0.60, -11
;;
	c0	ldw $r0.5 = 76[$r0.1]
	c0	mov $r0.3 = $r0.58
;;
;;
.call normalizeRoundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = normalizeRoundAndPackFloat64
;;
LBB69_33:                               ## %cleanup
	c0	mov $r0.57 = $r0.3
	c0	mov $r0.58 = $r0.4
;;
LBB69_34:                               ## %cleanup
	c0	mov $r0.3 = $r0.57
	c0	mov $r0.4 = $r0.58
;;
	c0	ldw $l0.0 = 96[$r0.1]
;;
	c0	ldw $r0.63 = 100[$r0.1]
;;
	c0	ldw $r0.62 = 104[$r0.1]
;;
	c0	ldw $r0.61 = 108[$r0.1]
;;
	c0	ldw $r0.60 = 112[$r0.1]
;;
	c0	ldw $r0.59 = 116[$r0.1]
;;
	c0	ldw $r0.58 = 120[$r0.1]
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	ldw $r0.57 = 124[$r0.1]
	c0	return $r0.1 = $r0.1, 128, $l0.0
;;
LBB69_6:                                ## %if.end.34
	c0	mov $r0.3 = 16
	c0	mov $r0.57 = -1
;;
	c0	mov $r0.58 = 2147483647
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
	c0	goto LBB69_34
;;
.endp

#.globl float64_sub
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_sub
float64_sub::
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
	c0	stw 40[$r0.1] = $l0.0
	c0	mov $r0.57 = $r0.3
;;
	c0	mov $r0.59 = $r0.5
	c0	mov $r0.60 = $r0.6
;;
.call extractFloat64Sign, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	mov $r0.58 = $r0.4
	c0	call $l0.0 = extractFloat64Sign
;;
	c0	mov $r0.61 = $r0.3
	c0	mov $r0.3 = $r0.59
;;
.call extractFloat64Sign, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Sign
;;
	c0	mov $r0.6 = $r0.60
	c0	mov $r0.5 = $r0.59
;;
	c0	mov $r0.4 = $r0.58
	c0	cmpne $b0.0 = $r0.61, $r0.3
;;
;;
	c0	br $b0.0, LBB70_2
;;
## BB#1:                                ## %if.then
	c0	mov $r0.3 = $r0.57
	c0	mov $r0.7 = $r0.61
;;
.call subFloat64Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = subFloat64Sigs
;;
	c0	goto LBB70_3
;;
LBB70_2:                                ## %if.else
	c0	mov $r0.3 = $r0.57
	c0	mov $r0.7 = $r0.61
;;
.call addFloat64Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = addFloat64Sigs
;;
LBB70_3:                                ## %cleanup
	c0	ldw $l0.0 = 40[$r0.1]
;;
	c0	ldw $r0.61 = 44[$r0.1]
;;
	c0	ldw $r0.60 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	ldw $r0.57 = 60[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

#.globl float64_mul
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_mul
float64_mul::
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
	c0	stw 68[$r0.1] = $l0.0
	c0	mov $r0.58 = $r0.4
;;
	c0	mov $r0.60 = $r0.5
	c0	mov $r0.59 = $r0.6
;;
.call extractFloat64Frac1, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	mov $r0.61 = $r0.3
	c0	call $l0.0 = extractFloat64Frac1
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.61
;;
.call extractFloat64Frac0, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 52[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat64Frac0
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.61
;;
.call extractFloat64Exp, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 56[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat64Exp
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.61
;;
.call extractFloat64Sign, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 64[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat64Sign
;;
	c0	mov $r0.4 = $r0.59
	c0	mov $r0.57 = $r0.3
;;
.call extractFloat64Frac1, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac1
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.60
;;
.call extractFloat64Frac0, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 44[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat64Frac0
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.60
;;
.call extractFloat64Exp, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 48[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat64Exp
;;
	c0	mov $r0.62 = $r0.3
	c0	mov $r0.3 = $r0.60
;;
.call extractFloat64Sign, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 60[$r0.1] = $r0.62
	c0	call $l0.0 = extractFloat64Sign
;;
	c0	ldw $r0.2 = 64[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.2, 2047
;;
	c0	xor $r0.57 = $r0.3, $r0.57
;;
	c0	br $b0.0, LBB71_8
;;
## BB#1:                                ## %if.then
	c0	ldw $r0.2 = 56[$r0.1]
;;
	c0	ldw $r0.3 = 52[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.3, $r0.2
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB71_4
;;
## BB#2:                                ## %lor.lhs.false
	c0	cmpne $b0.0 = $r0.62, 2047
;;
;;
	c0	br $b0.0, LBB71_5
;;
## BB#3:                                ## %land.lhs.true
	c0	ldw $r0.2 = 48[$r0.1]
;;
	c0	ldw $r0.3 = 44[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB71_4
;;
LBB71_5:                                ## %if.end
	c0	ldw $r0.2 = 60[$r0.1]
;;
	c0	ldw $r0.3 = 48[$r0.1]
;;
	c0	ldw $r0.4 = 44[$r0.1]
;;
	c0	or $r0.2 = $r0.3, $r0.2
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB71_6
;;
	c0	goto LBB71_11
;;
LBB71_8:                                ## %if.end.42
	c0	cmpne $b0.0 = $r0.62, 2047
;;
;;
	c0	br $b0.0, LBB71_12
;;
## BB#9:                                ## %if.then.44
	c0	ldw $r0.3 = 48[$r0.1]
;;
	c0	ldw $r0.4 = 44[$r0.1]
;;
;;
	c0	or $r0.3 = $r0.4, $r0.3
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB71_10
;;
LBB71_4:                                ## %if.then.30
	c0	mov $r0.5 = $r0.60
	c0	mov $r0.4 = $r0.58
;;
	c0	mov $r0.3 = $r0.61
	c0	mov $r0.6 = $r0.59
;;
.call propagateFloat64NaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = propagateFloat64NaN
;;
	c0	goto LBB71_23
;;
LBB71_12:                               ## %if.end.62
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB71_16
;;
## BB#13:                               ## %if.then.64
	c0	ldw $r0.4 = 52[$r0.1]
;;
	c0	ldw $r0.3 = 56[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.4, $r0.3
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB71_14
;;
## BB#15:                               ## %if.end.69
	c0	add $r0.7 = $r0.1, 52
	c0	add $r0.6 = $r0.1, 56
;;
	c0	add $r0.5 = $r0.1, 64
;;
.call normalizeFloat64Subnormal, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = normalizeFloat64Subnormal
;;
LBB71_16:                               ## %if.end.70
	c0	ldw $r0.2 = 60[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB71_19
;;
## BB#17:                               ## %if.then.72
	c0	ldw $r0.4 = 44[$r0.1]
;;
	c0	ldw $r0.3 = 48[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.4, $r0.3
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB71_14
;;
## BB#18:                               ## %if.end.77
	c0	add $r0.7 = $r0.1, 44
	c0	add $r0.6 = $r0.1, 48
;;
	c0	add $r0.5 = $r0.1, 60
;;
.call normalizeFloat64Subnormal, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = normalizeFloat64Subnormal
;;
LBB71_19:                               ## %if.end.78
	c0	ldw $r0.2 = 56[$r0.1]
	c0	add $r0.7 = $r0.1, 44
;;
	c0	ldw $r0.3 = 48[$r0.1]
	c0	add $r0.6 = $r0.1, 48
;;
	c0	ldw $r0.4 = 44[$r0.1]
	c0	mov $r0.5 = 12
;;
	c0	ldw $r0.61 = 64[$r0.1]
;;
	c0	ldw $r0.62 = 60[$r0.1]
;;
	c0	or $r0.58 = $r0.2, 1048576
;;
.call shortShift64Left, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	stw 56[$r0.1] = $r0.58
	c0	call $l0.0 = shortShift64Left
;;
	c0	ldw $r0.6 = 44[$r0.1]
	c0	add $r0.10 = $r0.1, 28
;;
	c0	ldw $r0.5 = 48[$r0.1]
	c0	add $r0.59 = $r0.1, 36
;;
	c0	ldw $r0.4 = 52[$r0.1]
	c0	add $r0.9 = $r0.1, 32
;;
	c0	add $r0.60 = $r0.1, 40
	c0	mov $r0.3 = $r0.58
;;
	c0	mov $r0.7 = $r0.60
	c0	mov $r0.8 = $r0.59
;;
.call mul64To128, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32,$r0.9:u32,$r0.10:u32), ret()
	c0	call $l0.0 = mul64To128
;;
	c0	ldw $r0.6 = 52[$r0.1]
;;
	c0	ldw $r0.5 = 56[$r0.1]
;;
	c0	ldw $r0.3 = 40[$r0.1]
;;
	c0	ldw $r0.4 = 36[$r0.1]
	c0	mov $r0.8 = $r0.59
;;
	c0	mov $r0.7 = $r0.60
	c0	add $r0.58 = $r0.62, $r0.61
;;
.call add64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = add64
;;
	c0	ldw $r0.2 = 28[$r0.1]
;;
	c0	ldw $r0.4 = 32[$r0.1]
;;
	c0	ldw $r0.3 = 40[$r0.1]
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	cmpltu $b0.1 = $r0.3, 2097152
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	or $r0.5 = $r0.2, $r0.4
;;
	c0	stw 32[$r0.1] = $r0.5
	c0	br $b0.1, LBB71_20
;;
## BB#21:                               ## %if.then.84
	c0	ldw $r0.4 = 36[$r0.1]
	c0	add $r0.9 = $r0.1, 32
;;
	c0	add $r0.8 = $r0.1, 36
	c0	mov $r0.6 = 1
;;
	c0	add $r0.7 = $r0.1, 40
;;
	c0	add $r0.58 = $r0.58, -1023
;;
.call shift64ExtraRightJamming, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32,$r0.9:u32), ret()
	c0	call $l0.0 = shift64ExtraRightJamming
;;
	c0	goto LBB71_22
;;
LBB71_10:                               ## %if.end.53
	c0	ldw $r0.3 = 56[$r0.1]
;;
	c0	ldw $r0.4 = 52[$r0.1]
;;
	c0	or $r0.2 = $r0.3, $r0.2
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB71_11
;;
LBB71_6:                                ## %if.end.40
	c0	mov $r0.5 = 0
;;
	c0	mov $r0.4 = 2047
;;
	c0	mov $r0.3 = $r0.57
	c0	mov $r0.6 = $r0.5
;;
.call packFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = packFloat64
;;
	c0	goto LBB71_23
;;
LBB71_20:
	c0	add $r0.58 = $r0.58, -1024
;;
LBB71_22:                               ## %if.end.85
	c0	ldw $r0.7 = 32[$r0.1]
;;
	c0	ldw $r0.6 = 36[$r0.1]
;;
	c0	ldw $r0.5 = 40[$r0.1]
	c0	mov $r0.4 = $r0.58
;;
	c0	mov $r0.3 = $r0.57
;;
.call roundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = roundAndPackFloat64
;;
	c0	goto LBB71_23
;;
LBB71_11:                               ## %invalid
	c0	mov $r0.3 = 16
	c0	mov $r0.57 = -1
;;
	c0	mov $r0.58 = 2147483647
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
	c0	goto LBB71_24
;;
LBB71_14:                               ## %if.then.67
	c0	mov $r0.4 = 0
	c0	mov $r0.3 = $r0.57
;;
	c0	mov $r0.5 = $r0.4
	c0	mov $r0.6 = $r0.4
;;
.call packFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = packFloat64
;;
LBB71_23:                               ## %cleanup
	c0	mov $r0.57 = $r0.3
	c0	mov $r0.58 = $r0.4
;;
LBB71_24:                               ## %cleanup
	c0	mov $r0.3 = $r0.57
	c0	mov $r0.4 = $r0.58
;;
	c0	ldw $l0.0 = 68[$r0.1]
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
.return ret($r0.3:u32,$r0.4:u32)
	c0	ldw $r0.57 = 92[$r0.1]
	c0	return $r0.1 = $r0.1, 96, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @normalizeFloat64Subnormal
normalizeFloat64Subnormal::
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
	c0	stw 40[$r0.1] = $l0.0
	c0	mov $r0.61 = $r0.3
;;
	c0	cmpne $b0.0 = $r0.61, 0
	c0	mov $r0.57 = $r0.5
;;
	c0	mov $r0.59 = $r0.6
	c0	mov $r0.58 = $r0.7
;;
	c0	mov $r0.60 = $r0.4
	c0	brf $b0.0, LBB72_1
;;
## BB#5:                                ## %if.else.7
	c0	mov $r0.3 = $r0.61
;;
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = countLeadingZeros32
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.8 = 12
;;
	c0	add $r0.5 = $r0.2, -11
	c0	mov $r0.7 = $r0.58
;;
	c0	mov $r0.6 = $r0.59
	c0	mov $r0.4 = $r0.60
;;
	c0	mov $r0.3 = $r0.61
	c0	sub $r0.58 = $r0.8, $r0.2
;;
.call shortShift64Left, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = shortShift64Left
;;
	c0	goto LBB72_6
;;
LBB72_1:                                ## %if.then
	c0	mov $r0.3 = $r0.60
;;
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = countLeadingZeros32
;;
	c0	cmpgt $b0.0 = $r0.3, 10
	c0	add $r0.2 = $r0.3, -11
;;
;;
	c0	br $b0.0, LBB72_3
;;
## BB#2:                                ## %if.then.2
	c0	mov $r0.4 = 11
	c0	and $r0.2 = $r0.2, 31
;;
	c0	sub $r0.4 = $r0.4, $r0.3
	c0	shl $r0.2 = $r0.60, $r0.2
;;
	c0	shru $r0.4 = $r0.60, $r0.4
	c0	goto LBB72_4
;;
LBB72_3:                                ## %if.else
	c0	shl $r0.4 = $r0.60, $r0.2
	c0	mov $r0.2 = 0
;;
LBB72_4:                                ## %if.end
	c0	stw 0[$r0.59] = $r0.4
	c0	mov $r0.4 = -20
;;
	c0	stw 0[$r0.58] = $r0.2
	c0	sub $r0.58 = $r0.4, $r0.3
;;
LBB72_6:                                ## %if.end.11
	c0	stw 0[$r0.57] = $r0.58
;;
	c0	ldw $l0.0 = 40[$r0.1]
;;
	c0	ldw $r0.61 = 44[$r0.1]
;;
	c0	ldw $r0.60 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
.return ret()
	c0	ldw $r0.57 = 60[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @roundAndPackFloat64
roundAndPackFloat64::
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
	c0	stw 40[$r0.1] = $l0.0
;;
	c0	mov $r0.2 = float_rounding_mode
;;
	c0	ldw $r0.59 = 0[$r0.2]
	c0	mov $r0.58 = $r0.4
;;
	c0	mov $r0.57 = $r0.3
	c0	mov $r0.60 = 31
;;
	c0	stw 36[$r0.1] = $r0.5
	c0	cmpeq $b0.0 = $r0.59, 0
;;
	c0	stw 32[$r0.1] = $r0.6
;;
	c0	stw 28[$r0.1] = $r0.7
	c0	br $b0.0, LBB73_1
;;
## BB#2:                                ## %if.then
	c0	cmpeq $b0.0 = $r0.59, 1
;;
;;
	c0	brf $b0.0, LBB73_4
;;
## BB#3:
	c0	mov $r0.61 = 0
	c0	goto LBB73_8
;;
LBB73_1:
	c0	shru $r0.61 = $r0.7, $r0.60
	c0	goto LBB73_8
;;
LBB73_4:                                ## %if.else
	c0	cmpeq $b0.0 = $r0.57, 0
;;
;;
	c0	br $b0.0, LBB73_6
;;
## BB#5:                                ## %if.then.7
	c0	cmpeq $b0.0 = $r0.59, 3
	c0	goto LBB73_7
;;
LBB73_6:                                ## %if.else.11
	c0	cmpeq $b0.0 = $r0.59, 2
;;
LBB73_7:                                ## %if.end.19
	c0	cmpne $b0.1 = $r0.7, 0
	c0	mfb $r0.2 = $b0.0
;;
;;
	c0	mfb $r0.3 = $b0.1
;;
	c0	and $r0.2 = $r0.3, $r0.2
;;
	c0	and $r0.61 = $r0.2, 1
;;
LBB73_8:                                ## %if.end.19
	c0	zxth $r0.2 = $r0.58
;;
	c0	cmpltu $b0.0 = $r0.2, 2045
;;
;;
	c0	br $b0.0, LBB73_35
;;
## BB#9:                                ## %if.then.24
	c0	cmpgt $b0.0 = $r0.58, 2045
;;
;;
	c0	br $b0.0, LBB73_13
;;
## BB#10:                               ## %lor.lhs.false
	c0	cmpne $b0.0 = $r0.58, 2045
;;
;;
	c0	br $b0.0, LBB73_20
;;
## BB#11:                               ## %land.lhs.true
	c0	ldw $r0.6 = 32[$r0.1]
	c0	mov $r0.4 = -1
;;
	c0	ldw $r0.5 = 36[$r0.1]
;;
	c0	mov $r0.3 = 2097151
;;
;;
.call eq64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32)
	c0	call $l0.0 = eq64
;;
	c0	cmpeq $b0.0 = $r0.61, 0
;;
;;
	c0	br $b0.0, LBB73_35
;;
## BB#12:                               ## %land.lhs.true
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB73_35
;;
LBB73_13:                               ## %if.then.32
	c0	mov $r0.3 = 9
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
	c0	cmpeq $b0.0 = $r0.59, 1
;;
;;
	c0	br $b0.0, LBB73_18
;;
## BB#14:                               ## %lor.lhs.false.35
	c0	cmpeq $b0.0 = $r0.57, 0
;;
;;
	c0	br $b0.0, LBB73_16
;;
## BB#15:                               ## %lor.lhs.false.35
	c0	cmpeq $b0.0 = $r0.59, 2
;;
;;
	c0	br $b0.0, LBB73_18
;;
LBB73_16:                               ## %lor.lhs.false.40
	c0	cmpne $b0.0 = $r0.57, 0
;;
;;
	c0	br $b0.0, LBB73_19
;;
## BB#17:                               ## %lor.lhs.false.40
	c0	cmpne $b0.0 = $r0.59, 3
;;
;;
	c0	br $b0.0, LBB73_19
;;
LBB73_18:                               ## %if.then.45
	c0	mov $r0.6 = -1
;;
	c0	mov $r0.5 = 1048575
;;
	c0	mov $r0.4 = 2046
;;
	c0	goto LBB73_42
;;
LBB73_20:                               ## %if.end.49
	c0	cmpgt $b0.0 = $r0.58, -1
;;
;;
	c0	brf $b0.0, LBB73_21
;;
LBB73_35:                               ## %if.end.90thread-pre-split
	c0	ldw $r0.2 = 28[$r0.1]
;;
LBB73_36:                               ## %if.end.90
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB73_38
;;
## BB#37:                               ## %if.then.92
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.3 = 0[$r0.2]
;;
;;
	c0	or $r0.3 = $r0.3, 1
;;
	c0	stw 0[$r0.2] = $r0.3
;;
LBB73_38:                               ## %if.end.93
	c0	ldw $r0.4 = 32[$r0.1]
	c0	cmpeq $b0.0 = $r0.61, 0
;;
	c0	ldw $r0.3 = 36[$r0.1]
;;
	c0	br $b0.0, LBB73_40
;;
## BB#39:                               ## %if.then.95
	c0	add $r0.8 = $r0.1, 32
	c0	add $r0.7 = $r0.1, 36
;;
	c0	mov $r0.6 = 1
	c0	mov $r0.5 = 0
;;
.call add64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = add64
;;
	c0	ldw $r0.2 = 28[$r0.1]
;;
	c0	ldw $r0.3 = 32[$r0.1]
;;
	c0	and $r0.2 = $r0.2, 2147483647
;;
	c0	or $r0.2 = $r0.2, $r0.59
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	andc $r0.2 = $r0.2, $r0.3
;;
	c0	stw 32[$r0.1] = $r0.2
	c0	goto LBB73_41
;;
LBB73_40:                               ## %if.else.99
	c0	or $r0.2 = $r0.4, $r0.3
	c0	mov $r0.3 = 0
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	slct $r0.58 = $b0.0, $r0.3, $r0.58
;;
LBB73_41:                               ## %if.end.105
	c0	ldw $r0.6 = 32[$r0.1]
;;
	c0	ldw $r0.5 = 36[$r0.1]
	c0	mov $r0.4 = $r0.58
;;
LBB73_42:                               ## %cleanup
	c0	mov $r0.3 = $r0.57
;;
LBB73_43:                               ## %cleanup
.call packFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = packFloat64
;;
	c0	ldw $l0.0 = 40[$r0.1]
;;
	c0	ldw $r0.61 = 44[$r0.1]
;;
	c0	ldw $r0.60 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	ldw $r0.57 = 60[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
LBB73_21:                               ## %if.then.52
	c0	mov $r0.2 = -1
	c0	cmpeq $b0.0 = $r0.61, 0
;;
	c0	mtb $b0.1 = $r0.2
;;
	c0	br $b0.0, LBB73_22
;;
## BB#23:                               ## %if.then.52
	c0	mfb $r0.2 = $b0.1
;;
	c0	stw 24[$r0.1] = $r0.2
	c0	cmplt $b0.0 = $r0.58, -1
;;
;;
	c0	br $b0.0, LBB73_26
;;
## BB#24:                               ## %if.then.52
	c0	mov $r0.2 = float_detect_tininess
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
;;
	c0	cmpeq $b0.0 = $r0.2, 1
;;
;;
	c0	br $b0.0, LBB73_26
;;
## BB#25:                               ## %lor.rhs
	c0	ldw $r0.4 = 32[$r0.1]
;;
	c0	mov $r0.5 = 2097151
;;
	c0	ldw $r0.3 = 36[$r0.1]
	c0	mov $r0.6 = -1
;;
.call lt64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32)
	c0	call $l0.0 = lt64
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	stw 24[$r0.1] = $r0.2
	c0	goto LBB73_26
;;
LBB73_19:                               ## %if.end.47
	c0	mov $r0.5 = 0
;;
	c0	mov $r0.4 = 2047
;;
	c0	mov $r0.3 = $r0.57
	c0	mov $r0.6 = $r0.5
;;
	c0	goto LBB73_43
;;
LBB73_22:
	c0	mfb $r0.2 = $b0.1
;;
	c0	stw 24[$r0.1] = $r0.2
;;
LBB73_26:                               ## %lor.end
	c0	mov $r0.61 = 0
	c0	ldw $r0.3 = 36[$r0.1]
;;
	c0	ldw $r0.4 = 32[$r0.1]
	c0	add $r0.7 = $r0.1, 36
;;
	c0	ldw $r0.5 = 28[$r0.1]
	c0	add $r0.9 = $r0.1, 28
;;
	c0	add $r0.8 = $r0.1, 32
	c0	sub $r0.6 = $r0.61, $r0.58
;;
.call shift64ExtraRightJamming, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32,$r0.9:u32), ret()
	c0	call $l0.0 = shift64ExtraRightJamming
;;
	c0	ldw $r0.2 = 24[$r0.1]
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	cmpne $b0.0 = $r0.2, 1
;;
;;
	c0	br $b0.0, LBB73_29
;;
## BB#27:                               ## %lor.end
	c0	ldw $r0.2 = 28[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB73_29
;;
## BB#28:                               ## %if.then.65
	c0	mov $r0.3 = 4
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
LBB73_29:                               ## %if.end.66
	c0	cmpne $b0.0 = $r0.59, 0
;;
;;
	c0	brf $b0.0, LBB73_30
;;
## BB#31:                               ## %if.else.71
	c0	cmpeq $b0.0 = $r0.57, 0
;;
;;
	c0	br $b0.0, LBB73_34
;;
## BB#32:                               ## %if.then.73
	c0	ldw $r0.2 = 28[$r0.1]
	c0	cmpeq $b0.0 = $r0.59, 3
;;
	c0	goto LBB73_33
;;
LBB73_30:                               ## %if.then.68
	c0	ldw $r0.2 = 28[$r0.1]
	c0	mov $r0.58 = $r0.61
;;
;;
	c0	shru $r0.61 = $r0.2, $r0.60
	c0	goto LBB73_36
;;
LBB73_34:                               ## %if.else.80
	c0	ldw $r0.2 = 28[$r0.1]
	c0	cmpeq $b0.0 = $r0.59, 2
;;
LBB73_33:                               ## %if.end.90
	c0	cmpne $b0.1 = $r0.2, 0
	c0	mov $r0.58 = $r0.61
;;
	c0	mfb $r0.3 = $b0.0
;;
	c0	mfb $r0.4 = $b0.1
;;
	c0	and $r0.3 = $r0.3, $r0.4
;;
	c0	and $r0.61 = $r0.3, 1
	c0	goto LBB73_36
;;
.endp

#.globl float64_div
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-128, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_div
float64_div::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -128
;;
	c0	stw 124[$r0.1] = $r0.57
;;
	c0	stw 120[$r0.1] = $r0.58
;;
	c0	stw 116[$r0.1] = $r0.59
;;
	c0	stw 112[$r0.1] = $r0.60
;;
	c0	stw 108[$r0.1] = $r0.61
;;
	c0	stw 104[$r0.1] = $r0.62
;;
	c0	stw 100[$r0.1] = $r0.63
;;
	c0	stw 96[$r0.1] = $l0.0
	c0	mov $r0.59 = $r0.4
;;
	c0	mov $r0.60 = $r0.5
	c0	mov $r0.58 = $r0.6
;;
.call extractFloat64Frac1, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	mov $r0.61 = $r0.3
	c0	call $l0.0 = extractFloat64Frac1
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.61
;;
.call extractFloat64Frac0, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 80[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat64Frac0
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.61
;;
.call extractFloat64Exp, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 84[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat64Exp
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.61
;;
.call extractFloat64Sign, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 92[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat64Sign
;;
	c0	mov $r0.4 = $r0.58
	c0	mov $r0.57 = $r0.3
;;
.call extractFloat64Frac1, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac1
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.60
;;
.call extractFloat64Frac0, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 72[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat64Frac0
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.60
;;
.call extractFloat64Exp, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 76[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat64Exp
;;
	c0	mov $r0.62 = $r0.3
	c0	mov $r0.3 = $r0.60
;;
.call extractFloat64Sign, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 88[$r0.1] = $r0.62
	c0	call $l0.0 = extractFloat64Sign
;;
	c0	ldw $r0.2 = 92[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.2, 2047
;;
	c0	xor $r0.63 = $r0.3, $r0.57
;;
	c0	br $b0.0, LBB74_8
;;
## BB#1:                                ## %if.then
	c0	ldw $r0.2 = 84[$r0.1]
;;
	c0	ldw $r0.3 = 80[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB74_2
;;
## BB#3:                                ## %if.end
	c0	cmpne $b0.0 = $r0.62, 2047
;;
;;
	c0	br $b0.0, LBB74_6
;;
## BB#4:                                ## %if.then.34
	c0	ldw $r0.2 = 76[$r0.1]
;;
	c0	ldw $r0.3 = 72[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB74_2
;;
	c0	goto LBB74_14
;;
LBB74_8:                                ## %if.end.46
	c0	cmpeq $b0.0 = $r0.62, 0
;;
;;
	c0	brf $b0.0, LBB74_9
;;
## BB#12:                               ## %if.then.61
	c0	ldw $r0.4 = 72[$r0.1]
;;
	c0	ldw $r0.3 = 76[$r0.1]
;;
;;
	c0	or $r0.5 = $r0.4, $r0.3
;;
	c0	cmpne $b0.0 = $r0.5, 0
;;
;;
	c0	brf $b0.0, LBB74_13
;;
## BB#15:                               ## %if.end.73
	c0	add $r0.7 = $r0.1, 72
	c0	add $r0.6 = $r0.1, 76
;;
	c0	add $r0.5 = $r0.1, 88
;;
.call normalizeFloat64Subnormal, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = normalizeFloat64Subnormal
;;
	c0	goto LBB74_16
;;
LBB74_9:                                ## %if.end.46
	c0	cmpne $b0.0 = $r0.62, 2047
;;
;;
	c0	br $b0.0, LBB74_16
;;
## BB#10:                               ## %if.then.48
	c0	ldw $r0.2 = 76[$r0.1]
;;
	c0	ldw $r0.3 = 72[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB74_11
;;
LBB74_2:                                ## %if.then.27
	c0	mov $r0.5 = $r0.60
	c0	mov $r0.4 = $r0.59
;;
	c0	mov $r0.3 = $r0.61
	c0	mov $r0.6 = $r0.58
;;
.call propagateFloat64NaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = propagateFloat64NaN
;;
	c0	goto LBB74_33
;;
LBB74_16:                               ## %if.end.74
	c0	ldw $r0.2 = 92[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB74_19
;;
## BB#17:                               ## %if.then.76
	c0	ldw $r0.4 = 80[$r0.1]
;;
	c0	ldw $r0.3 = 84[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.4, $r0.3
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB74_11
;;
## BB#18:                               ## %if.end.81
	c0	add $r0.7 = $r0.1, 80
	c0	add $r0.6 = $r0.1, 84
;;
	c0	add $r0.5 = $r0.1, 92
;;
.call normalizeFloat64Subnormal, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = normalizeFloat64Subnormal
;;
LBB74_19:                               ## %if.end.82
	c0	ldw $r0.2 = 84[$r0.1]
	c0	mov $r0.58 = 11
;;
	c0	ldw $r0.4 = 80[$r0.1]
	c0	add $r0.6 = $r0.1, 84
;;
	c0	add $r0.7 = $r0.1, 80
	c0	ldw $r0.57 = 92[$r0.1]
;;
	c0	ldw $r0.60 = 88[$r0.1]
	c0	mov $r0.5 = $r0.58
;;
	c0	or $r0.3 = $r0.2, 1048576
;;
.call shortShift64Left, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = shortShift64Left
;;
	c0	ldw $r0.2 = 76[$r0.1]
	c0	add $r0.7 = $r0.1, 72
;;
	c0	ldw $r0.4 = 72[$r0.1]
	c0	add $r0.6 = $r0.1, 76
;;
	c0	mov $r0.5 = $r0.58
;;
	c0	or $r0.3 = $r0.2, 1048576
;;
.call shortShift64Left, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = shortShift64Left
;;
	c0	ldw $r0.58 = 80[$r0.1]
;;
	c0	ldw $r0.3 = 76[$r0.1]
;;
	c0	ldw $r0.4 = 72[$r0.1]
;;
	c0	ldw $r0.59 = 84[$r0.1]
	c0	sub $r0.57 = $r0.57, $r0.60
;;
;;
	c0	mov $r0.5 = $r0.59
	c0	mov $r0.6 = $r0.58
;;
.call le64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32)
	c0	call $l0.0 = le64
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB74_20
;;
## BB#21:                               ## %if.then.87
	c0	add $r0.7 = $r0.1, 80
	c0	add $r0.6 = $r0.1, 84
;;
	c0	mov $r0.5 = 1
	c0	mov $r0.3 = $r0.59
;;
	c0	mov $r0.4 = $r0.58
;;
	c0	add $r0.57 = $r0.57, 1022
;;
.call shift64Right, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = shift64Right
;;
	c0	goto LBB74_22
;;
LBB74_13:                               ## %if.then.64
	c0	ldw $r0.3 = 84[$r0.1]
;;
	c0	ldw $r0.4 = 80[$r0.1]
;;
	c0	or $r0.2 = $r0.3, $r0.2
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB74_14
;;
## BB#5:                                ## %if.end.71
	c0	mov $r0.3 = 2
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
LBB74_6:                                ## %if.end.44
	c0	mov $r0.5 = 0
;;
	c0	mov $r0.4 = 2047
;;
	c0	mov $r0.3 = $r0.63
	c0	mov $r0.6 = $r0.5
;;
.call packFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = packFloat64
;;
	c0	goto LBB74_33
;;
LBB74_11:                               ## %if.end.57
	c0	mov $r0.4 = 0
	c0	mov $r0.3 = $r0.63
;;
	c0	mov $r0.5 = $r0.4
	c0	mov $r0.6 = $r0.4
;;
.call packFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = packFloat64
;;
	c0	goto LBB74_33
;;
LBB74_20:
	c0	add $r0.57 = $r0.57, 1021
;;
LBB74_22:                               ## %if.end.88
	c0	ldw $r0.4 = 80[$r0.1]
;;
	c0	ldw $r0.59 = 76[$r0.1]
;;
	c0	ldw $r0.3 = 84[$r0.1]
	c0	add $r0.60 = $r0.1, 32
;;
	c0	add $r0.61 = $r0.1, 36
	c0	mov $r0.5 = $r0.59
;;
.call estimateDiv64To32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = estimateDiv64To32
;;
	c0	ldw $r0.4 = 72[$r0.1]
	c0	add $r0.6 = $r0.1, 40
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.8 = $r0.60
;;
	c0	mov $r0.7 = $r0.61
	c0	mov $r0.3 = $r0.59
;;
	c0	mov $r0.5 = $r0.2
	c0	stw 68[$r0.1] = $r0.2
;;
.call mul64By32To96, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = mul64By32To96
;;
	c0	ldw $r0.8 = 32[$r0.1]
	c0	add $r0.9 = $r0.1, 56
;;
	c0	ldw $r0.3 = 84[$r0.1]
	c0	mov $r0.5 = 0
;;
	c0	ldw $r0.6 = 40[$r0.1]
	c0	add $r0.10 = $r0.1, 52
;;
	c0	ldw $r0.4 = 80[$r0.1]
	c0	add $r0.58 = $r0.1, 48
;;
	c0	ldw $r0.7 = 36[$r0.1]
;;
	c0	stw 16[$r0.1] = $r0.58
;;
.call sub96, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32,$r0.9:u32,$r0.10:u32,$r0.11:u32), ret()
	c0	call $l0.0 = sub96
;;
	c0	ldw $r0.2 = 56[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.2, -1
;;
;;
	c0	br $b0.0, LBB74_26
;;
## BB#23:                               ## %while.body.lr.ph
	c0	stw 20[$r0.1] = $r0.57
;;
	c0	stw 24[$r0.1] = $r0.63
;;
	c0	ldw $r0.57 = 68[$r0.1]
;;
	c0	ldw $r0.59 = 76[$r0.1]
;;
	c0	ldw $r0.60 = 72[$r0.1]
	c0	add $r0.61 = $r0.1, 56
;;
	c0	add $r0.62 = $r0.1, 52
	c0	mov $r0.63 = 0
;;
LBB74_24:                               ## %while.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.5 = 48[$r0.1]
;;
	c0	ldw $r0.4 = 52[$r0.1]
;;
	c0	ldw $r0.3 = 56[$r0.1]
	c0	mov $r0.10 = $r0.62
;;
	c0	mov $r0.9 = $r0.61
	c0	mov $r0.8 = $r0.60
;;
	c0	mov $r0.7 = $r0.59
	c0	mov $r0.6 = $r0.63
;;
.call add96, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32,$r0.9:u32,$r0.10:u32,$r0.11:u32), ret()
	c0	stw 16[$r0.1] = $r0.58
	c0	call $l0.0 = add96
;;
	c0	ldw $r0.2 = 56[$r0.1]
	c0	add $r0.57 = $r0.57, -1
;;
;;
	c0	cmplt $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB74_24
;;
## BB#25:                               ## %while.cond.while.end_crit_edge
	c0	stw 68[$r0.1] = $r0.57
;;
	c0	ldw $r0.63 = 24[$r0.1]
;;
	c0	ldw $r0.57 = 20[$r0.1]
;;
LBB74_26:                               ## %while.end
	c0	ldw $r0.5 = 76[$r0.1]
;;
	c0	ldw $r0.4 = 48[$r0.1]
;;
	c0	ldw $r0.3 = 52[$r0.1]
;;
.call estimateDiv64To32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = estimateDiv64To32
;;
	c0	and $r0.2 = $r0.3, 1023
;;
	c0	stw 64[$r0.1] = $r0.3
	c0	cmpgtu $b0.0 = $r0.2, 4
;;
;;
	c0	br $b0.0, LBB74_32
;;
## BB#27:                               ## %if.then.93
	c0	ldw $r0.4 = 72[$r0.1]
	c0	add $r0.8 = $r0.1, 28
;;
	c0	ldw $r0.2 = 76[$r0.1]
	c0	add $r0.6 = $r0.1, 36
;;
	c0	add $r0.7 = $r0.1, 32
	c0	mov $r0.5 = $r0.3
;;
	c0	mov $r0.3 = $r0.2
;;
.call mul64By32To96, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = mul64By32To96
;;
	c0	ldw $r0.8 = 28[$r0.1]
	c0	add $r0.9 = $r0.1, 52
;;
	c0	ldw $r0.3 = 52[$r0.1]
	c0	mov $r0.5 = 0
;;
	c0	ldw $r0.6 = 36[$r0.1]
	c0	add $r0.10 = $r0.1, 48
;;
	c0	ldw $r0.4 = 48[$r0.1]
	c0	add $r0.58 = $r0.1, 44
;;
	c0	ldw $r0.7 = 32[$r0.1]
;;
	c0	stw 16[$r0.1] = $r0.58
;;
.call sub96, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32,$r0.9:u32,$r0.10:u32,$r0.11:u32), ret()
	c0	call $l0.0 = sub96
;;
	c0	ldw $r0.2 = 52[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.2, -1
;;
;;
	c0	br $b0.0, LBB74_31
;;
## BB#28:                               ## %while.body.96.lr.ph
	c0	stw 20[$r0.1] = $r0.57
;;
	c0	stw 24[$r0.1] = $r0.63
;;
	c0	ldw $r0.57 = 64[$r0.1]
;;
	c0	ldw $r0.59 = 76[$r0.1]
;;
	c0	ldw $r0.60 = 72[$r0.1]
	c0	add $r0.61 = $r0.1, 52
;;
	c0	add $r0.62 = $r0.1, 48
	c0	mov $r0.63 = 0
;;
LBB74_29:                               ## %while.body.96
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.5 = 44[$r0.1]
;;
	c0	ldw $r0.4 = 48[$r0.1]
;;
	c0	ldw $r0.3 = 52[$r0.1]
	c0	mov $r0.10 = $r0.62
;;
	c0	mov $r0.9 = $r0.61
	c0	mov $r0.8 = $r0.60
;;
	c0	mov $r0.7 = $r0.59
	c0	mov $r0.6 = $r0.63
;;
.call add96, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32,$r0.9:u32,$r0.10:u32,$r0.11:u32), ret()
	c0	stw 16[$r0.1] = $r0.58
	c0	call $l0.0 = add96
;;
	c0	ldw $r0.2 = 52[$r0.1]
	c0	add $r0.57 = $r0.57, -1
;;
;;
	c0	cmplt $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB74_29
;;
## BB#30:                               ## %while.cond.94.while.end.98_crit_edge
	c0	stw 64[$r0.1] = $r0.57
;;
	c0	ldw $r0.63 = 24[$r0.1]
;;
	c0	ldw $r0.57 = 20[$r0.1]
;;
LBB74_31:                               ## %while.end.98
	c0	ldw $r0.3 = 48[$r0.1]
;;
	c0	ldw $r0.4 = 44[$r0.1]
;;
	c0	ldw $r0.5 = 64[$r0.1]
	c0	or $r0.2 = $r0.3, $r0.2
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	or $r0.2 = $r0.2, $r0.5
;;
	c0	stw 64[$r0.1] = $r0.2
;;
LBB74_32:                               ## %if.end.103
	c0	ldw $r0.4 = 64[$r0.1]
	c0	mov $r0.6 = 11
;;
	c0	ldw $r0.3 = 68[$r0.1]
	c0	mov $r0.5 = 0
;;
	c0	add $r0.8 = $r0.1, 64
	c0	add $r0.7 = $r0.1, 68
;;
	c0	add $r0.9 = $r0.1, 60
;;
.call shift64ExtraRightJamming, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32,$r0.9:u32), ret()
	c0	call $l0.0 = shift64ExtraRightJamming
;;
	c0	ldw $r0.7 = 60[$r0.1]
;;
	c0	ldw $r0.6 = 64[$r0.1]
;;
	c0	ldw $r0.5 = 68[$r0.1]
	c0	mov $r0.4 = $r0.57
;;
	c0	mov $r0.3 = $r0.63
;;
.call roundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = roundAndPackFloat64
;;
LBB74_33:                               ## %cleanup
	c0	mov $r0.57 = $r0.3
	c0	mov $r0.58 = $r0.4
;;
LBB74_34:                               ## %cleanup
	c0	mov $r0.3 = $r0.57
	c0	mov $r0.4 = $r0.58
;;
	c0	ldw $l0.0 = 96[$r0.1]
;;
	c0	ldw $r0.63 = 100[$r0.1]
;;
	c0	ldw $r0.62 = 104[$r0.1]
;;
	c0	ldw $r0.61 = 108[$r0.1]
;;
	c0	ldw $r0.60 = 112[$r0.1]
;;
	c0	ldw $r0.59 = 116[$r0.1]
;;
	c0	ldw $r0.58 = 120[$r0.1]
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	ldw $r0.57 = 124[$r0.1]
	c0	return $r0.1 = $r0.1, 128, $l0.0
;;
LBB74_14:                               ## %invalid
	c0	mov $r0.3 = 16
	c0	mov $r0.57 = -1
;;
	c0	mov $r0.58 = 2147483647
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
	c0	goto LBB74_34
;;
.endp

#.globl float64_rem
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-128, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_rem
float64_rem::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -128
;;
	c0	stw 124[$r0.1] = $r0.57
;;
	c0	stw 120[$r0.1] = $r0.58
;;
	c0	stw 116[$r0.1] = $r0.59
;;
	c0	stw 112[$r0.1] = $r0.60
;;
	c0	stw 108[$r0.1] = $r0.61
;;
	c0	stw 104[$r0.1] = $r0.62
;;
	c0	stw 100[$r0.1] = $r0.63
;;
	c0	stw 96[$r0.1] = $l0.0
	c0	mov $r0.58 = $r0.4
;;
	c0	mov $r0.61 = $r0.5
	c0	mov $r0.60 = $r0.6
;;
.call extractFloat64Frac1, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	mov $r0.59 = $r0.3
	c0	call $l0.0 = extractFloat64Frac1
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.59
;;
.call extractFloat64Frac0, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 80[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat64Frac0
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.59
;;
.call extractFloat64Exp, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 84[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat64Exp
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.59
;;
.call extractFloat64Sign, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 92[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat64Sign
;;
	c0	mov $r0.4 = $r0.60
	c0	mov $r0.57 = $r0.3
;;
.call extractFloat64Frac1, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac1
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.61
;;
.call extractFloat64Frac0, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 72[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat64Frac0
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.61
;;
.call extractFloat64Exp, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 76[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat64Exp
;;
	c0	ldw $r0.2 = 92[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.2, 2047
;;
	c0	stw 88[$r0.1] = $r0.3
;;
	c0	br $b0.0, LBB75_5
;;
## BB#1:                                ## %if.then
	c0	ldw $r0.2 = 84[$r0.1]
;;
	c0	ldw $r0.4 = 80[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.4, $r0.2
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB75_4
;;
## BB#2:                                ## %lor.lhs.false
	c0	cmpne $b0.0 = $r0.3, 2047
;;
;;
	c0	br $b0.0, LBB75_9
;;
## BB#3:                                ## %land.lhs.true
	c0	ldw $r0.2 = 76[$r0.1]
;;
	c0	ldw $r0.3 = 72[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB75_4
;;
	c0	goto LBB75_9
;;
LBB75_5:                                ## %if.end.36
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	brf $b0.0, LBB75_6
;;
## BB#8:                                ## %if.then.50
	c0	ldw $r0.4 = 72[$r0.1]
;;
	c0	ldw $r0.3 = 76[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.4, $r0.3
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB75_9
;;
## BB#10:                               ## %if.end.56
	c0	add $r0.7 = $r0.1, 72
	c0	add $r0.6 = $r0.1, 76
;;
	c0	add $r0.5 = $r0.1, 88
;;
.call normalizeFloat64Subnormal, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = normalizeFloat64Subnormal
;;
	c0	goto LBB75_11
;;
LBB75_6:                                ## %if.end.36
	c0	cmpne $b0.0 = $r0.3, 2047
;;
;;
	c0	br $b0.0, LBB75_11
;;
## BB#7:                                ## %if.then.38
	c0	ldw $r0.2 = 76[$r0.1]
;;
	c0	ldw $r0.3 = 72[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB75_39
;;
LBB75_4:                                ## %if.then.30
	c0	mov $r0.5 = $r0.61
	c0	mov $r0.4 = $r0.58
;;
	c0	mov $r0.3 = $r0.59
	c0	mov $r0.6 = $r0.60
;;
.call propagateFloat64NaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = propagateFloat64NaN
;;
	c0	goto LBB75_38
;;
LBB75_11:                               ## %if.end.57
	c0	ldw $r0.2 = 92[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB75_14
;;
## BB#12:                               ## %if.then.59
	c0	ldw $r0.4 = 80[$r0.1]
;;
	c0	ldw $r0.3 = 84[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.4, $r0.3
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB75_39
;;
## BB#13:                               ## %if.end.63
	c0	add $r0.7 = $r0.1, 80
	c0	add $r0.6 = $r0.1, 84
;;
	c0	add $r0.5 = $r0.1, 92
;;
.call normalizeFloat64Subnormal, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = normalizeFloat64Subnormal
;;
LBB75_14:                               ## %if.end.64
	c0	ldw $r0.2 = 88[$r0.1]
;;
	c0	ldw $r0.63 = 92[$r0.1]
;;
;;
	c0	sub $r0.62 = $r0.63, $r0.2
;;
	c0	cmplt $b0.0 = $r0.62, -1
;;
;;
	c0	br $b0.0, LBB75_39
;;
## BB#15:                               ## %if.end.67
	c0	stw 40[$r0.1] = $r0.2
;;
	c0	stw 20[$r0.1] = $r0.57
;;
	c0	ldw $r0.2 = 84[$r0.1]
	c0	mov $r0.3 = 31
;;
	c0	stw 16[$r0.1] = $r0.3
;;
	c0	ldw $r0.4 = 80[$r0.1]
	c0	shru $r0.5 = $r0.62, $r0.3
;;
	c0	mov $r0.57 = 11
	c0	add $r0.7 = $r0.1, 80
;;
	c0	add $r0.6 = $r0.1, 84
;;
	c0	or $r0.3 = $r0.2, 1048576
;;
	c0	sub $r0.5 = $r0.57, $r0.5
;;
.call shortShift64Left, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = shortShift64Left
;;
	c0	ldw $r0.2 = 76[$r0.1]
	c0	add $r0.7 = $r0.1, 72
;;
	c0	ldw $r0.4 = 72[$r0.1]
	c0	add $r0.6 = $r0.1, 76
;;
	c0	mov $r0.5 = $r0.57
;;
	c0	or $r0.3 = $r0.2, 1048576
;;
.call shortShift64Left, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = shortShift64Left
;;
	c0	ldw $r0.61 = 80[$r0.1]
;;
	c0	ldw $r0.57 = 76[$r0.1]
;;
	c0	ldw $r0.59 = 72[$r0.1]
;;
	c0	ldw $r0.60 = 84[$r0.1]
;;
	c0	mov $r0.4 = $r0.59
;;
	c0	mov $r0.5 = $r0.60
	c0	mov $r0.3 = $r0.57
;;
	c0	mov $r0.6 = $r0.61
;;
.call le64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32)
	c0	call $l0.0 = le64
;;
	c0	mov $r0.58 = $r0.3
;;
	c0	cmpeq $b0.0 = $r0.58, 0
;;
;;
	c0	br $b0.0, LBB75_17
;;
## BB#16:                               ## %if.then.74
	c0	add $r0.8 = $r0.1, 80
	c0	add $r0.7 = $r0.1, 84
;;
	c0	mov $r0.4 = $r0.61
	c0	mov $r0.6 = $r0.59
;;
	c0	mov $r0.5 = $r0.57
	c0	mov $r0.3 = $r0.60
;;
.call sub64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = sub64
;;
LBB75_17:                               ## %if.end.75
	c0	cmplt $b0.0 = $r0.62, 33
;;
;;
	c0	br $b0.0, LBB75_18
;;
## BB#19:                               ## %while.body.lr.ph
	c0	add $r0.2 = $r0.63, -3
	c0	ldw $r0.3 = 76[$r0.1]
;;
;;
	c0	stw 44[$r0.1] = $r0.3
;;
	c0	ldw $r0.3 = 72[$r0.1]
;;
;;
	c0	stw 36[$r0.1] = $r0.3
	c0	add $r0.3 = $r0.1, 80
;;
	c0	stw 32[$r0.1] = $r0.3
	c0	add $r0.63 = $r0.1, 84
;;
	c0	mov $r0.57 = 29
	c0	add $r0.60 = $r0.1, 56
;;
	c0	add $r0.61 = $r0.1, 64
	c0	add $r0.62 = $r0.1, 60
;;
	c0	add $r0.3 = $r0.1, 68
;;
	c0	stw 28[$r0.1] = $r0.3
	c0	mov $r0.3 = 0
;;
	c0	stw 24[$r0.1] = $r0.3
;;
	c0	ldw $r0.3 = 40[$r0.1]
;;
;;
	c0	sub $r0.59 = $r0.2, $r0.3
;;
LBB75_20:                               ## %while.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.4 = 80[$r0.1]
;;
	c0	ldw $r0.3 = 84[$r0.1]
;;
	c0	ldw $r0.58 = 44[$r0.1]
;;
;;
	c0	stw 44[$r0.1] = $r0.58
	c0	mov $r0.5 = $r0.58
;;
.call estimateDiv64To32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = estimateDiv64To32
;;
	c0	cmpgtu $b0.0 = $r0.3, 4
	c0	add $r0.2 = $r0.3, -4
;;
	c0	mov $r0.7 = $r0.61
	c0	ldw $r0.6 = 28[$r0.1]
;;
	c0	ldw $r0.4 = 36[$r0.1]
	c0	mov $r0.8 = $r0.62
;;
	c0	mov $r0.3 = $r0.58
	c0	slct $r0.58 = $b0.0, $r0.2, 0
;;
	c0	mov $r0.5 = $r0.58
;;
.call mul64By32To96, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = mul64By32To96
;;
	c0	ldw $r0.5 = 60[$r0.1]
;;
	c0	ldw $r0.4 = 64[$r0.1]
;;
	c0	ldw $r0.3 = 68[$r0.1]
	c0	mov $r0.8 = $r0.62
;;
	c0	mov $r0.7 = $r0.61
	c0	mov $r0.6 = $r0.57
;;
	c0	mov $r0.9 = $r0.60
;;
.call shortShift96Left, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32,$r0.9:u32), ret()
	c0	call $l0.0 = shortShift96Left
;;
	c0	ldw $r0.4 = 80[$r0.1]
;;
	c0	ldw $r0.3 = 84[$r0.1]
	c0	mov $r0.6 = $r0.63
;;
	c0	mov $r0.5 = $r0.57
	c0	mov $r0.7 = $r0.60
;;
.call shortShift64Left, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = shortShift64Left
;;
	c0	add $r0.59 = $r0.59, -29
	c0	ldw $r0.5 = 64[$r0.1]
;;
	c0	ldw $r0.6 = 60[$r0.1]
;;
	c0	ldw $r0.3 = 84[$r0.1]
	c0	mov $r0.7 = $r0.63
;;
	c0	ldw $r0.4 = 24[$r0.1]
;;
	c0	ldw $r0.8 = 32[$r0.1]
	c0	cmpgt $b0.0 = $r0.59, 29
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
.call sub64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	stw 40[$r0.1] = $r0.2
	c0	call $l0.0 = sub64
;;
	c0	ldw $r0.2 = 40[$r0.1]
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
	c0	br $b0.0, LBB75_20
;;
## BB#21:                               ## %while.end.loopexit
	c0	add $r0.57 = $r0.59, -29
	c0	goto LBB75_22
;;
LBB75_9:                                ## %invalid
	c0	mov $r0.3 = 16
	c0	mov $r0.58 = -1
;;
	c0	mov $r0.59 = 2147483647
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
	c0	goto LBB75_39
;;
LBB75_18:
	c0	add $r0.57 = $r0.62, -32
;;
LBB75_22:                               ## %while.end
	c0	ldw $r0.4 = 80[$r0.1]
	c0	cmplt $b0.0 = $r0.57, -31
;;
	c0	ldw $r0.3 = 84[$r0.1]
;;
	c0	br $b0.0, LBB75_27
;;
## BB#23:                               ## %if.then.86
	c0	ldw $r0.5 = 76[$r0.1]
;;
;;
.call estimateDiv64To32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = estimateDiv64To32
;;
	c0	ldw $r0.4 = 72[$r0.1]
;;
	c0	ldw $r0.2 = 76[$r0.1]
	c0	add $r0.6 = $r0.1, 76
;;
	c0	mov $r0.5 = 8
	c0	cmpgtu $b0.0 = $r0.3, 4
;;
;;
	c0	mfb $r0.7 = $b0.0
;;
	c0	stw 44[$r0.1] = $r0.7
;;
	c0	add $r0.7 = $r0.1, 72
	c0	add $r0.58 = $r0.3, -4
;;
	c0	mov $r0.3 = $r0.2
;;
.call shift64Right, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = shift64Right
;;
	c0	mov $r0.2 = 0
	c0	ldw $r0.3 = 44[$r0.1]
;;
	c0	mtb $b0.0 = $r0.3
;;
;;
	c0	slct $r0.5 = $b0.0, $r0.58, 0
	c0	cmpgt $b0.0 = $r0.57, -25
;;
	c0	ldw $r0.4 = 80[$r0.1]
;;
	c0	ldw $r0.3 = 84[$r0.1]
	c0	sub $r0.2 = $r0.2, $r0.57
;;
	c0	shru $r0.58 = $r0.5, $r0.2
	c0	br $b0.0, LBB75_25
;;
## BB#24:                               ## %if.then.98
	c0	mov $r0.2 = -24
	c0	add $r0.7 = $r0.1, 80
;;
	c0	add $r0.6 = $r0.1, 84
	c0	sub $r0.5 = $r0.2, $r0.57
;;
.call shift64Right, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = shift64Right
;;
	c0	goto LBB75_26
;;
LBB75_27:                               ## %if.else.101
	c0	add $r0.7 = $r0.1, 80
	c0	add $r0.6 = $r0.1, 84
;;
	c0	mov $r0.57 = 8
;;
	c0	mov $r0.5 = $r0.57
;;
.call shift64Right, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = shift64Right
;;
	c0	ldw $r0.4 = 72[$r0.1]
	c0	add $r0.7 = $r0.1, 72
;;
	c0	ldw $r0.3 = 76[$r0.1]
	c0	add $r0.6 = $r0.1, 76
;;
	c0	mov $r0.5 = $r0.57
;;
.call shift64Right, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = shift64Right
;;
	c0	goto LBB75_28
;;
LBB75_25:                               ## %if.else
	c0	add $r0.5 = $r0.57, 24
	c0	add $r0.7 = $r0.1, 80
;;
	c0	add $r0.6 = $r0.1, 84
;;
.call shortShift64Left, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = shortShift64Left
;;
LBB75_26:                               ## %if.end.100
	c0	ldw $r0.4 = 72[$r0.1]
	c0	add $r0.8 = $r0.1, 60
;;
	c0	ldw $r0.3 = 76[$r0.1]
	c0	add $r0.6 = $r0.1, 68
;;
	c0	add $r0.7 = $r0.1, 64
	c0	mov $r0.5 = $r0.58
;;
.call mul64By32To96, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = mul64By32To96
;;
	c0	ldw $r0.6 = 60[$r0.1]
	c0	add $r0.8 = $r0.1, 80
;;
	c0	ldw $r0.4 = 80[$r0.1]
	c0	add $r0.7 = $r0.1, 84
;;
	c0	ldw $r0.3 = 84[$r0.1]
;;
	c0	ldw $r0.5 = 64[$r0.1]
;;
;;
.call sub64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = sub64
;;
LBB75_28:                               ## %do.body.preheader
	c0	ldw $r0.60 = 72[$r0.1]
;;
	c0	ldw $r0.61 = 76[$r0.1]
	c0	add $r0.62 = $r0.1, 80
;;
	c0	add $r0.63 = $r0.1, 84
;;
LBB75_29:                               ## %do.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.57 = 80[$r0.1]
;;
	c0	ldw $r0.59 = 84[$r0.1]
	c0	mov $r0.7 = $r0.63
;;
	c0	mov $r0.6 = $r0.60
	c0	mov $r0.5 = $r0.61
;;
	c0	mov $r0.8 = $r0.62
	c0	mov $r0.3 = $r0.59
;;
	c0	mov $r0.4 = $r0.57
;;
.call sub64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = sub64
;;
	c0	ldw $r0.3 = 84[$r0.1]
	c0	add $r0.58 = $r0.58, 1
;;
;;
	c0	cmpgt $b0.0 = $r0.3, -1
;;
;;
	c0	br $b0.0, LBB75_29
;;
## BB#30:                               ## %do.end
	c0	ldw $r0.4 = 80[$r0.1]
	c0	add $r0.8 = $r0.1, 52
;;
	c0	add $r0.7 = $r0.1, 48
	c0	mov $r0.5 = $r0.59
;;
	c0	mov $r0.6 = $r0.57
;;
.call add64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = add64
;;
	c0	ldw $r0.2 = 48[$r0.1]
;;
;;
	c0	cmplt $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB75_33
;;
## BB#31:                               ## %lor.lhs.false.107
	c0	and $r0.3 = $r0.58, 1
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB75_34
;;
## BB#32:                               ## %lor.lhs.false.107
	c0	ldw $r0.3 = 52[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.3, $r0.2
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB75_34
;;
LBB75_33:                               ## %if.then.113
	c0	stw 84[$r0.1] = $r0.59
;;
	c0	stw 80[$r0.1] = $r0.57
	c0	goto LBB75_35
;;
LBB75_34:                               ## %if.end.114thread-pre-split
	c0	ldw $r0.59 = 84[$r0.1]
;;
LBB75_35:                               ## %if.end.114
	c0	ldw $r0.2 = 16[$r0.1]
	c0	cmpgt $b0.0 = $r0.59, -1
;;
;;
	c0	shru $r0.57 = $r0.59, $r0.2
	c0	br $b0.0, LBB75_37
;;
## BB#36:                               ## %if.then.118
	c0	ldw $r0.6 = 80[$r0.1]
	c0	mov $r0.3 = 0
;;
	c0	add $r0.8 = $r0.1, 80
	c0	add $r0.7 = $r0.1, 84
;;
	c0	mov $r0.5 = $r0.59
	c0	mov $r0.4 = $r0.3
;;
.call sub64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = sub64
;;
LBB75_37:                               ## %if.end.119
	c0	ldw $r0.2 = 88[$r0.1]
;;
	c0	ldw $r0.3 = 20[$r0.1]
;;
;;
	c0	xor $r0.3 = $r0.57, $r0.3
	c0	ldw $r0.5 = 84[$r0.1]
;;
	c0	ldw $r0.6 = 80[$r0.1]
	c0	add $r0.4 = $r0.2, -4
;;
;;
.call normalizeRoundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = normalizeRoundAndPackFloat64
;;
LBB75_38:                               ## %cleanup
	c0	mov $r0.58 = $r0.3
	c0	mov $r0.59 = $r0.4
;;
LBB75_39:                               ## %cleanup
	c0	mov $r0.3 = $r0.58
	c0	mov $r0.4 = $r0.59
;;
	c0	ldw $l0.0 = 96[$r0.1]
;;
	c0	ldw $r0.63 = 100[$r0.1]
;;
	c0	ldw $r0.62 = 104[$r0.1]
;;
	c0	ldw $r0.61 = 108[$r0.1]
;;
	c0	ldw $r0.60 = 112[$r0.1]
;;
	c0	ldw $r0.59 = 116[$r0.1]
;;
	c0	ldw $r0.58 = 120[$r0.1]
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	ldw $r0.57 = 124[$r0.1]
	c0	return $r0.1 = $r0.1, 128, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @normalizeRoundAndPackFloat64
normalizeRoundAndPackFloat64::
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
	c0	stw 44[$r0.1] = $l0.0
	c0	cmpne $b0.0 = $r0.5, 0
;;
	c0	mov $r0.57 = $r0.3
	c0	mov $r0.58 = $r0.4
;;
	c0	stw 40[$r0.1] = $r0.5
;;
	c0	stw 36[$r0.1] = $r0.6
	c0	br $b0.0, LBB76_2
;;
## BB#1:                                ## %if.then
	c0	ldw $r0.2 = 36[$r0.1]
	c0	mov $r0.3 = 0
;;
	c0	add $r0.58 = $r0.58, -32
	c0	stw 36[$r0.1] = $r0.3
;;
	c0	stw 40[$r0.1] = $r0.2
;;
LBB76_2:                                ## %if.end
	c0	ldw $r0.60 = 40[$r0.1]
;;
;;
	c0	mov $r0.3 = $r0.60
;;
.call countLeadingZeros32, caller, arg($r0.3:u32), ret($r0.3:u32)
	c0	call $l0.0 = countLeadingZeros32
;;
	c0	mov $r0.2 = $r0.3
;;
	c0	add $r0.59 = $r0.2, -11
;;
	c0	cmplt $b0.0 = $r0.59, 0
;;
;;
	c0	br $b0.0, LBB76_4
;;
## BB#3:                                ## %if.then.3
	c0	ldw $r0.3 = 40[$r0.1]
	c0	mov $r0.2 = 0
;;
	c0	ldw $r0.4 = 36[$r0.1]
	c0	add $r0.6 = $r0.1, 40
;;
	c0	add $r0.7 = $r0.1, 36
	c0	mov $r0.5 = $r0.59
;;
.call shortShift64Left, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	stw 32[$r0.1] = $r0.2
	c0	call $l0.0 = shortShift64Left
;;
	c0	goto LBB76_5
;;
LBB76_4:                                ## %if.else
	c0	ldw $r0.4 = 36[$r0.1]
	c0	mov $r0.6 = 11
;;
	c0	add $r0.7 = $r0.1, 40
	c0	add $r0.8 = $r0.1, 36
;;
	c0	mov $r0.5 = 0
	c0	add $r0.9 = $r0.1, 32
;;
	c0	mov $r0.3 = $r0.60
	c0	sub $r0.6 = $r0.6, $r0.2
;;
.call shift64ExtraRightJamming, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32,$r0.9:u32), ret()
	c0	call $l0.0 = shift64ExtraRightJamming
;;
LBB76_5:                                ## %if.end.5
	c0	ldw $r0.7 = 32[$r0.1]
	c0	sub $r0.4 = $r0.58, $r0.59
;;
	c0	ldw $r0.6 = 36[$r0.1]
;;
	c0	ldw $r0.5 = 40[$r0.1]
	c0	mov $r0.3 = $r0.57
;;
;;
.call roundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = roundAndPackFloat64
;;
	c0	ldw $l0.0 = 44[$r0.1]
;;
	c0	ldw $r0.60 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	ldw $r0.57 = 60[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

#.globl float64_sqrt
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-128, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_sqrt
float64_sqrt::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -128
;;
	c0	stw 124[$r0.1] = $r0.57
;;
	c0	stw 120[$r0.1] = $r0.58
;;
	c0	stw 116[$r0.1] = $r0.59
;;
	c0	stw 112[$r0.1] = $r0.60
;;
	c0	stw 108[$r0.1] = $r0.61
;;
	c0	stw 104[$r0.1] = $r0.62
;;
	c0	stw 100[$r0.1] = $r0.63
;;
	c0	stw 96[$r0.1] = $l0.0
	c0	mov $r0.57 = $r0.4
;;
.call extractFloat64Frac1, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	mov $r0.58 = $r0.3
	c0	call $l0.0 = extractFloat64Frac1
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat64Frac0, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 84[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat64Frac0
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat64Exp, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 88[$r0.1] = $r0.2
	c0	call $l0.0 = extractFloat64Exp
;;
	c0	mov $r0.59 = $r0.3
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat64Sign, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	stw 92[$r0.1] = $r0.59
	c0	call $l0.0 = extractFloat64Sign
;;
	c0	cmpne $b0.0 = $r0.59, 2047
;;
;;
	c0	br $b0.0, LBB77_4
;;
## BB#1:                                ## %if.then
	c0	ldw $r0.2 = 88[$r0.1]
;;
	c0	ldw $r0.4 = 84[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.4, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB77_3
;;
## BB#2:                                ## %if.then.12
	c0	mov $r0.5 = $r0.58
	c0	mov $r0.4 = $r0.57
;;
	c0	mov $r0.3 = $r0.58
	c0	mov $r0.6 = $r0.57
;;
.call propagateFloat64NaN, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = propagateFloat64NaN
;;
	c0	goto LBB77_24
;;
LBB77_4:                                ## %if.end.21
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB77_7
;;
## BB#5:                                ## %if.then.23
	c0	ldw $r0.2 = 88[$r0.1]
;;
	c0	ldw $r0.3 = 84[$r0.1]
;;
	c0	or $r0.2 = $r0.2, $r0.59
;;
	c0	or $r0.2 = $r0.2, $r0.3
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB77_6
;;
	c0	goto LBB77_25
;;
LBB77_3:                                ## %if.end
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB77_25
;;
LBB77_6:                                ## %invalid
	c0	mov $r0.3 = 16
	c0	mov $r0.57 = -1
;;
	c0	mov $r0.58 = 2147483647
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
	c0	goto LBB77_25
;;
LBB77_7:                                ## %if.end.31
	c0	cmpne $b0.0 = $r0.59, 0
;;
;;
	c0	br $b0.0, LBB77_11
;;
## BB#8:                                ## %if.then.33
	c0	ldw $r0.4 = 84[$r0.1]
;;
	c0	ldw $r0.3 = 88[$r0.1]
;;
;;
	c0	or $r0.2 = $r0.4, $r0.3
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB77_9
;;
## BB#10:                               ## %if.end.38
	c0	add $r0.7 = $r0.1, 84
	c0	add $r0.6 = $r0.1, 88
;;
	c0	add $r0.5 = $r0.1, 92
;;
.call normalizeFloat64Subnormal, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = normalizeFloat64Subnormal
;;
LBB77_11:                               ## %if.end.39
	c0	ldw $r0.2 = 88[$r0.1]
	c0	add $r0.57 = $r0.1, 52
;;
	c0	ldw $r0.4 = 84[$r0.1]
	c0	add $r0.58 = $r0.1, 48
;;
	c0	ldw $r0.62 = 92[$r0.1]
	c0	mov $r0.5 = 11
;;
	c0	mov $r0.6 = $r0.57
	c0	mov $r0.7 = $r0.58
;;
	c0	or $r0.3 = $r0.2, 1048576
;;
.call shortShift64Left, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	stw 88[$r0.1] = $r0.3
	c0	call $l0.0 = shortShift64Left
;;
	c0	ldw $r0.4 = 52[$r0.1]
;;
	c0	ldw $r0.3 = 92[$r0.1]
;;
.call estimateSqrt32, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = estimateSqrt32
;;
	c0	ldw $r0.2 = 92[$r0.1]
	c0	mov $r0.61 = 1
;;
	c0	ldw $r0.4 = 84[$r0.1]
	c0	shru $r0.5 = $r0.3, $r0.61
;;
	c0	ldw $r0.3 = 88[$r0.1]
	c0	mov $r0.8 = 9
;;
	c0	add $r0.7 = $r0.1, 84
	c0	add $r0.6 = $r0.1, 88
;;
	c0	add $r0.59 = $r0.1, 64
	c0	add $r0.60 = $r0.1, 68
;;
	c0	and $r0.2 = $r0.2, 1
	c0	add $r0.63 = $r0.5, 1
;;
	c0	stw 80[$r0.1] = $r0.63
	c0	sub $r0.5 = $r0.8, $r0.2
;;
.call shortShift64Left, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = shortShift64Left
;;
	c0	ldw $r0.3 = 80[$r0.1]
	c0	mov $r0.5 = $r0.57
;;
	c0	mov $r0.6 = $r0.58
;;
	c0	mov $r0.4 = $r0.3
;;
.call mul32To64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret()
	c0	call $l0.0 = mul32To64
;;
	c0	ldw $r0.6 = 48[$r0.1]
;;
	c0	add $r0.2 = $r0.62, -1023
;;
	c0	ldw $r0.5 = 52[$r0.1]
;;
	c0	ldw $r0.4 = 84[$r0.1]
;;
	c0	ldw $r0.3 = 88[$r0.1]
	c0	mov $r0.8 = $r0.59
;;
	c0	mov $r0.7 = $r0.60
	c0	shr $r0.62 = $r0.2, $r0.61
;;
.call sub64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = sub64
;;
	c0	ldw $r0.2 = 68[$r0.1]
	c0	shl $r0.57 = $r0.63, $r0.61
;;
;;
	c0	cmpgt $b0.0 = $r0.2, -1
;;
;;
	c0	br $b0.0, LBB77_15
;;
## BB#12:                               ## %while.body.lr.ph
	c0	ldw $r0.63 = 80[$r0.1]
	c0	add $r0.58 = $r0.1, 68
;;
	c0	add $r0.59 = $r0.1, 64
	c0	mov $r0.60 = 0
;;
LBB77_13:                               ## %while.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.4 = 64[$r0.1]
	c0	add $r0.6 = $r0.57, -1
;;
	c0	ldw $r0.3 = 68[$r0.1]
	c0	mov $r0.7 = $r0.58
;;
	c0	mov $r0.5 = $r0.60
	c0	mov $r0.8 = $r0.59
;;
.call add64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = add64
;;
	c0	ldw $r0.2 = 68[$r0.1]
	c0	add $r0.57 = $r0.57, -2
;;
	c0	add $r0.63 = $r0.63, -1
;;
	c0	cmplt $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB77_13
;;
## BB#14:                               ## %while.cond.while.end_crit_edge
	c0	stw 80[$r0.1] = $r0.63
;;
LBB77_15:                               ## %while.end
	c0	ldw $r0.3 = 64[$r0.1]
	c0	mov $r0.4 = 0
;;
	c0	mov $r0.5 = $r0.57
;;
	c0	add $r0.63 = $r0.62, 1022
;;
.call estimateDiv64To32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = estimateDiv64To32
;;
	c0	and $r0.2 = $r0.3, 510
;;
	c0	stw 76[$r0.1] = $r0.3
	c0	cmpgtu $b0.0 = $r0.2, 5
;;
;;
	c0	br $b0.0, LBB77_23
;;
## BB#16:                               ## %if.then.55
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB77_18
;;
## BB#17:                               ## %if.then.57
	c0	stw 76[$r0.1] = $r0.61
;;
LBB77_18:                               ## %if.end.58
	c0	ldw $r0.58 = 76[$r0.1]
	c0	add $r0.5 = $r0.1, 48
;;
	c0	add $r0.59 = $r0.1, 44
	c0	mov $r0.3 = $r0.57
;;
	c0	mov $r0.6 = $r0.59
	c0	mov $r0.4 = $r0.58
;;
.call mul32To64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret()
	c0	call $l0.0 = mul32To64
;;
	c0	ldw $r0.6 = 44[$r0.1]
	c0	mov $r0.60 = 0
;;
	c0	ldw $r0.5 = 48[$r0.1]
	c0	add $r0.61 = $r0.1, 64
;;
	c0	ldw $r0.3 = 64[$r0.1]
	c0	add $r0.62 = $r0.1, 60
;;
	c0	mov $r0.7 = $r0.61
	c0	mov $r0.4 = $r0.60
;;
	c0	mov $r0.8 = $r0.62
;;
.call sub64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = sub64
;;
	c0	add $r0.6 = $r0.1, 40
	c0	mov $r0.5 = $r0.59
;;
	c0	mov $r0.4 = $r0.58
	c0	mov $r0.3 = $r0.58
;;
.call mul32To64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret()
	c0	call $l0.0 = mul32To64
;;
	c0	ldw $r0.8 = 40[$r0.1]
	c0	add $r0.58 = $r0.1, 56
;;
	c0	ldw $r0.7 = 44[$r0.1]
;;
	c0	ldw $r0.3 = 64[$r0.1]
;;
	c0	ldw $r0.4 = 60[$r0.1]
	c0	mov $r0.10 = $r0.62
;;
	c0	mov $r0.9 = $r0.61
	c0	mov $r0.5 = $r0.60
;;
	c0	mov $r0.6 = $r0.60
	c0	stw 16[$r0.1] = $r0.58
;;
.call sub96, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32,$r0.9:u32,$r0.10:u32,$r0.11:u32), ret()
	c0	call $l0.0 = sub96
;;
	c0	ldw $r0.2 = 64[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.2, -1
;;
;;
	c0	br $b0.0, LBB77_22
;;
## BB#19:                               ## %while.body.61.lr.ph
	c0	stw 28[$r0.1] = $r0.63
;;
	c0	ldw $r0.59 = 76[$r0.1]
	c0	add $r0.2 = $r0.1, 60
;;
	c0	stw 36[$r0.1] = $r0.2
	c0	mov $r0.61 = 0
;;
	c0	mov $r0.2 = 1
;;
	c0	stw 32[$r0.1] = $r0.2
	c0	add $r0.63 = $r0.1, 44
;;
	c0	mov $r0.62 = $r0.58
	c0	add $r0.58 = $r0.1, 40
;;
	c0	add $r0.60 = $r0.1, 64
;;
LBB77_20:                               ## %while.body.61
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.59 = $r0.59, -1
	c0	mov $r0.6 = $r0.63
;;
	c0	ldw $r0.5 = 32[$r0.1]
	c0	mov $r0.3 = $r0.61
;;
	c0	mov $r0.7 = $r0.58
	c0	mov $r0.4 = $r0.59
;;
.call shortShift64Left, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = shortShift64Left
;;
	c0	ldw $r0.2 = 40[$r0.1]
;;
	c0	ldw $r0.7 = 44[$r0.1]
;;
	c0	ldw $r0.5 = 56[$r0.1]
;;
	c0	ldw $r0.4 = 60[$r0.1]
;;
	c0	ldw $r0.3 = 64[$r0.1]
;;
	c0	ldw $r0.10 = 36[$r0.1]
	c0	mov $r0.9 = $r0.60
;;
	c0	mov $r0.6 = $r0.61
	c0	or $r0.2 = $r0.2, 1
;;
	c0	stw 40[$r0.1] = $r0.2
;;
	c0	ldw $r0.8 = 40[$r0.1]
	c0	or $r0.7 = $r0.7, $r0.57
;;
	c0	stw 44[$r0.1] = $r0.7
;;
.call add96, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32,$r0.9:u32,$r0.10:u32,$r0.11:u32), ret()
	c0	stw 16[$r0.1] = $r0.62
	c0	call $l0.0 = add96
;;
	c0	ldw $r0.2 = 64[$r0.1]
;;
;;
	c0	cmplt $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB77_20
;;
## BB#21:                               ## %while.cond.59.while.end.65_crit_edge
	c0	stw 76[$r0.1] = $r0.59
;;
	c0	ldw $r0.63 = 28[$r0.1]
;;
LBB77_22:                               ## %while.end.65
	c0	ldw $r0.3 = 60[$r0.1]
;;
	c0	ldw $r0.4 = 56[$r0.1]
;;
	c0	ldw $r0.5 = 76[$r0.1]
	c0	or $r0.2 = $r0.3, $r0.2
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	or $r0.2 = $r0.2, $r0.5
;;
	c0	stw 76[$r0.1] = $r0.2
;;
LBB77_23:                               ## %if.end.70
	c0	ldw $r0.4 = 76[$r0.1]
	c0	add $r0.7 = $r0.1, 80
;;
	c0	ldw $r0.3 = 80[$r0.1]
	c0	mov $r0.6 = 10
;;
	c0	add $r0.8 = $r0.1, 76
	c0	mov $r0.57 = 0
;;
	c0	add $r0.9 = $r0.1, 72
	c0	mov $r0.5 = $r0.57
;;
.call shift64ExtraRightJamming, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32,$r0.9:u32), ret()
	c0	call $l0.0 = shift64ExtraRightJamming
;;
	c0	ldw $r0.7 = 72[$r0.1]
;;
	c0	ldw $r0.6 = 76[$r0.1]
;;
	c0	ldw $r0.5 = 80[$r0.1]
	c0	mov $r0.4 = $r0.63
;;
	c0	mov $r0.3 = $r0.57
;;
.call roundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = roundAndPackFloat64
;;
LBB77_24:                               ## %cleanup
	c0	mov $r0.57 = $r0.3
	c0	mov $r0.58 = $r0.4
;;
LBB77_25:                               ## %cleanup
	c0	mov $r0.3 = $r0.57
	c0	mov $r0.4 = $r0.58
;;
	c0	ldw $l0.0 = 96[$r0.1]
;;
	c0	ldw $r0.63 = 100[$r0.1]
;;
	c0	ldw $r0.62 = 104[$r0.1]
;;
	c0	ldw $r0.61 = 108[$r0.1]
;;
	c0	ldw $r0.60 = 112[$r0.1]
;;
	c0	ldw $r0.59 = 116[$r0.1]
;;
	c0	ldw $r0.58 = 120[$r0.1]
;;
.return ret($r0.3:u32,$r0.4:u32)
	c0	ldw $r0.57 = 124[$r0.1]
	c0	return $r0.1 = $r0.1, 128, $l0.0
;;
LBB77_9:                                ## %if.then.36
	c0	mov $r0.3 = 0
;;
	c0	mov $r0.5 = $r0.3
	c0	mov $r0.4 = $r0.3
;;
	c0	mov $r0.6 = $r0.3
;;
.call packFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32,$r0.4:u32)
	c0	call $l0.0 = packFloat64
;;
	c0	goto LBB77_24
;;
.endp

#.globl float64_eq
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_eq
float64_eq::
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
	c0	stw 40[$r0.1] = $l0.0
	c0	mov $r0.58 = $r0.3
;;
	c0	mov $r0.57 = $r0.5
	c0	mov $r0.59 = $r0.6
;;
.call extractFloat64Exp, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	mov $r0.60 = $r0.4
	c0	call $l0.0 = extractFloat64Exp
;;
	c0	cmpne $b0.0 = $r0.3, 2047
;;
;;
	c0	br $b0.0, LBB78_2
;;
## BB#1:                                ## %land.lhs.true
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat64Frac0, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac0
;;
	c0	mov $r0.4 = $r0.60
	c0	mov $r0.61 = $r0.3
;;
.call extractFloat64Frac1, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac1
;;
	c0	or $r0.2 = $r0.3, $r0.61
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB78_4
;;
LBB78_2:                                ## %lor.lhs.false
	c0	mov $r0.3 = $r0.57
;;
.call extractFloat64Exp, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Exp
;;
	c0	cmpne $b0.0 = $r0.3, 2047
;;
;;
	c0	br $b0.0, LBB78_8
;;
## BB#3:                                ## %land.lhs.true.16
	c0	mov $r0.3 = $r0.57
;;
.call extractFloat64Frac0, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac0
;;
	c0	mov $r0.4 = $r0.59
	c0	mov $r0.61 = $r0.3
;;
.call extractFloat64Frac1, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac1
;;
	c0	or $r0.2 = $r0.3, $r0.61
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB78_8
;;
LBB78_4:                                ## %if.then
	c0	mov $r0.3 = $r0.58
	c0	mov $r0.4 = $r0.60
;;
.call float64_is_signaling_nan, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = float64_is_signaling_nan
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB78_7
;;
## BB#5:                                ## %lor.lhs.false.29
	c0	mov $r0.3 = $r0.57
	c0	mov $r0.4 = $r0.59
;;
.call float64_is_signaling_nan, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = float64_is_signaling_nan
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB78_6
;;
LBB78_7:                                ## %if.then.34
	c0	mov $r0.3 = 16
	c0	mov $r0.57 = 0
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
	c0	goto LBB78_15
;;
LBB78_8:                                ## %if.end.35
	c0	cmpne $b0.0 = $r0.60, $r0.59
;;
;;
	c0	br $b0.0, LBB78_9
;;
## BB#10:                               ## %land.rhs
	c0	cmpeq $b0.0 = $r0.58, $r0.57
;;
;;
	c0	brf $b0.0, LBB78_12
;;
## BB#11:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB78_14
;;
LBB78_12:                               ## %lor.rhs
	c0	cmpne $b0.0 = $r0.60, 0
;;
;;
	c0	brf $b0.0, LBB78_13
;;
LBB78_9:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
;;
LBB78_14:                               ## %land.end.49
	c0	mfb $r0.57 = $b0.0
;;
LBB78_15:                               ## %return
	c0	mov $r0.3 = $r0.57
	c0	ldw $l0.0 = 40[$r0.1]
;;
	c0	ldw $r0.61 = 44[$r0.1]
;;
	c0	ldw $r0.60 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
.return ret($r0.3:u32)
	c0	ldw $r0.57 = 60[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
LBB78_6:
	c0	mov $r0.57 = 0
	c0	goto LBB78_15
;;
LBB78_13:                               ## %land.rhs.44
	c0	or $r0.2 = $r0.57, $r0.58
;;
	c0	and $r0.2 = $r0.2, 2147483647
;;
	c0	cmpeq $b0.0 = $r0.2, 0
	c0	goto LBB78_14
;;
.endp

#.globl float64_le
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_le
float64_le::
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
	c0	stw 40[$r0.1] = $l0.0
	c0	mov $r0.58 = $r0.3
;;
	c0	mov $r0.60 = $r0.5
	c0	mov $r0.57 = $r0.6
;;
.call extractFloat64Exp, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	mov $r0.59 = $r0.4
	c0	call $l0.0 = extractFloat64Exp
;;
	c0	cmpne $b0.0 = $r0.3, 2047
;;
;;
	c0	br $b0.0, LBB79_2
;;
## BB#1:                                ## %land.lhs.true
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat64Frac0, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac0
;;
	c0	mov $r0.4 = $r0.59
	c0	mov $r0.61 = $r0.3
;;
.call extractFloat64Frac1, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac1
;;
	c0	or $r0.2 = $r0.3, $r0.61
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB79_4
;;
LBB79_2:                                ## %lor.lhs.false
	c0	mov $r0.3 = $r0.60
;;
.call extractFloat64Exp, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Exp
;;
	c0	cmpne $b0.0 = $r0.3, 2047
;;
;;
	c0	br $b0.0, LBB79_5
;;
## BB#3:                                ## %land.lhs.true.16
	c0	mov $r0.3 = $r0.60
;;
.call extractFloat64Frac0, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac0
;;
	c0	mov $r0.4 = $r0.57
	c0	mov $r0.61 = $r0.3
;;
.call extractFloat64Frac1, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac1
;;
	c0	or $r0.2 = $r0.3, $r0.61
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB79_5
;;
LBB79_4:                                ## %if.then
	c0	mov $r0.3 = 16
	c0	mov $r0.57 = 0
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
	c0	goto LBB79_14
;;
LBB79_5:                                ## %if.end
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat64Sign, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Sign
;;
	c0	mov $r0.61 = $r0.3
	c0	mov $r0.3 = $r0.60
;;
.call extractFloat64Sign, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Sign
;;
	c0	cmpeq $b0.0 = $r0.61, $r0.3
;;
;;
	c0	brf $b0.0, LBB79_6
;;
## BB#10:                               ## %if.end.42
	c0	cmpeq $b0.0 = $r0.61, 0
;;
;;
	c0	br $b0.0, LBB79_12
;;
## BB#11:                               ## %cond.true
	c0	mov $r0.5 = $r0.58
	c0	mov $r0.4 = $r0.57
;;
	c0	mov $r0.3 = $r0.60
	c0	mov $r0.6 = $r0.59
;;
	c0	goto LBB79_13
;;
LBB79_6:                                ## %if.then.32
	c0	cmpne $b0.0 = $r0.61, 0
;;
;;
	c0	brf $b0.0, LBB79_8
;;
## BB#7:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
	c0	mfb $r0.57 = $b0.0
	c0	goto LBB79_14
;;
LBB79_12:                               ## %cond.false
	c0	mov $r0.5 = $r0.60
	c0	mov $r0.4 = $r0.59
;;
	c0	mov $r0.3 = $r0.58
	c0	mov $r0.6 = $r0.57
;;
LBB79_13:                               ## %cleanup
.call le64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32)
	c0	call $l0.0 = le64
;;
	c0	mov $r0.57 = $r0.3
	c0	goto LBB79_14
;;
LBB79_8:                                ## %lor.rhs
	c0	or $r0.2 = $r0.60, $r0.58
	c0	mov $r0.3 = 1
;;
	c0	or $r0.4 = $r0.57, $r0.59
	c0	shl $r0.2 = $r0.2, $r0.3
;;
	c0	or $r0.2 = $r0.4, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	mfb $r0.57 = $b0.0
;;
LBB79_14:                               ## %cleanup
	c0	mov $r0.3 = $r0.57
	c0	ldw $l0.0 = 40[$r0.1]
;;
	c0	ldw $r0.61 = 44[$r0.1]
;;
	c0	ldw $r0.60 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
.return ret($r0.3:u32)
	c0	ldw $r0.57 = 60[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

#.globl float64_lt
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_lt
float64_lt::
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
	c0	stw 40[$r0.1] = $l0.0
	c0	mov $r0.58 = $r0.3
;;
	c0	mov $r0.60 = $r0.5
	c0	mov $r0.57 = $r0.6
;;
.call extractFloat64Exp, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	mov $r0.59 = $r0.4
	c0	call $l0.0 = extractFloat64Exp
;;
	c0	cmpne $b0.0 = $r0.3, 2047
;;
;;
	c0	br $b0.0, LBB80_2
;;
## BB#1:                                ## %land.lhs.true
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat64Frac0, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac0
;;
	c0	mov $r0.4 = $r0.59
	c0	mov $r0.61 = $r0.3
;;
.call extractFloat64Frac1, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac1
;;
	c0	or $r0.2 = $r0.3, $r0.61
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB80_4
;;
LBB80_2:                                ## %lor.lhs.false
	c0	mov $r0.3 = $r0.60
;;
.call extractFloat64Exp, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Exp
;;
	c0	cmpne $b0.0 = $r0.3, 2047
;;
;;
	c0	br $b0.0, LBB80_5
;;
## BB#3:                                ## %land.lhs.true.16
	c0	mov $r0.3 = $r0.60
;;
.call extractFloat64Frac0, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac0
;;
	c0	mov $r0.4 = $r0.57
	c0	mov $r0.61 = $r0.3
;;
.call extractFloat64Frac1, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac1
;;
	c0	or $r0.2 = $r0.3, $r0.61
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB80_5
;;
LBB80_4:                                ## %if.then
	c0	mov $r0.3 = 16
	c0	mov $r0.57 = 0
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
	c0	goto LBB80_14
;;
LBB80_5:                                ## %if.end
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat64Sign, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Sign
;;
	c0	mov $r0.61 = $r0.3
	c0	mov $r0.3 = $r0.60
;;
.call extractFloat64Sign, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Sign
;;
	c0	cmpeq $b0.0 = $r0.61, $r0.3
;;
;;
	c0	brf $b0.0, LBB80_6
;;
## BB#10:                               ## %if.end.42
	c0	cmpeq $b0.0 = $r0.61, 0
;;
;;
	c0	br $b0.0, LBB80_12
;;
## BB#11:                               ## %cond.true
	c0	mov $r0.5 = $r0.58
	c0	mov $r0.4 = $r0.57
;;
	c0	mov $r0.3 = $r0.60
	c0	mov $r0.6 = $r0.59
;;
	c0	goto LBB80_13
;;
LBB80_6:                                ## %if.then.32
	c0	cmpeq $b0.0 = $r0.61, 0
;;
;;
	c0	br $b0.0, LBB80_7
;;
## BB#8:                                ## %land.rhs
	c0	or $r0.2 = $r0.60, $r0.58
	c0	mov $r0.3 = 1
;;
	c0	or $r0.4 = $r0.57, $r0.59
	c0	shl $r0.2 = $r0.2, $r0.3
;;
	c0	or $r0.2 = $r0.4, $r0.2
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	mfb $r0.57 = $b0.0
	c0	goto LBB80_14
;;
LBB80_12:                               ## %cond.false
	c0	mov $r0.5 = $r0.60
	c0	mov $r0.4 = $r0.59
;;
	c0	mov $r0.3 = $r0.58
	c0	mov $r0.6 = $r0.57
;;
LBB80_13:                               ## %cleanup
.call lt64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32)
	c0	call $l0.0 = lt64
;;
	c0	mov $r0.57 = $r0.3
	c0	goto LBB80_14
;;
LBB80_7:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
	c0	mfb $r0.57 = $b0.0
;;
LBB80_14:                               ## %cleanup
	c0	mov $r0.3 = $r0.57
	c0	ldw $l0.0 = 40[$r0.1]
;;
	c0	ldw $r0.61 = 44[$r0.1]
;;
	c0	ldw $r0.60 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
.return ret($r0.3:u32)
	c0	ldw $r0.57 = 60[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

#.globl float64_eq_signaling
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_eq_signaling
float64_eq_signaling::
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
	c0	stw 40[$r0.1] = $l0.0
	c0	mov $r0.57 = $r0.3
;;
	c0	mov $r0.58 = $r0.5
	c0	mov $r0.60 = $r0.6
;;
.call extractFloat64Exp, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	mov $r0.59 = $r0.4
	c0	call $l0.0 = extractFloat64Exp
;;
	c0	cmpne $b0.0 = $r0.3, 2047
;;
;;
	c0	br $b0.0, LBB81_2
;;
## BB#1:                                ## %land.lhs.true
	c0	mov $r0.3 = $r0.57
;;
.call extractFloat64Frac0, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac0
;;
	c0	mov $r0.4 = $r0.59
	c0	mov $r0.61 = $r0.3
;;
.call extractFloat64Frac1, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac1
;;
	c0	or $r0.2 = $r0.3, $r0.61
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB81_4
;;
LBB81_2:                                ## %lor.lhs.false
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat64Exp, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Exp
;;
	c0	cmpne $b0.0 = $r0.3, 2047
;;
;;
	c0	br $b0.0, LBB81_5
;;
## BB#3:                                ## %land.lhs.true.16
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat64Frac0, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac0
;;
	c0	mov $r0.4 = $r0.60
	c0	mov $r0.61 = $r0.3
;;
.call extractFloat64Frac1, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac1
;;
	c0	or $r0.2 = $r0.3, $r0.61
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB81_5
;;
LBB81_4:                                ## %if.then
	c0	mov $r0.3 = 16
	c0	mov $r0.57 = 0
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
	c0	goto LBB81_12
;;
LBB81_5:                                ## %if.end
	c0	cmpne $b0.0 = $r0.59, $r0.60
;;
;;
	c0	br $b0.0, LBB81_6
;;
## BB#7:                                ## %land.rhs
	c0	cmpeq $b0.0 = $r0.57, $r0.58
;;
;;
	c0	brf $b0.0, LBB81_9
;;
## BB#8:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB81_11
;;
LBB81_9:                                ## %lor.rhs
	c0	cmpne $b0.0 = $r0.59, 0
;;
;;
	c0	brf $b0.0, LBB81_10
;;
LBB81_6:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
;;
LBB81_11:                               ## %land.end.38
	c0	mfb $r0.57 = $b0.0
;;
LBB81_12:                               ## %return
	c0	mov $r0.3 = $r0.57
	c0	ldw $l0.0 = 40[$r0.1]
;;
	c0	ldw $r0.61 = 44[$r0.1]
;;
	c0	ldw $r0.60 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
.return ret($r0.3:u32)
	c0	ldw $r0.57 = 60[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
LBB81_10:                               ## %land.rhs.33
	c0	or $r0.2 = $r0.58, $r0.57
;;
	c0	and $r0.2 = $r0.2, 2147483647
;;
	c0	cmpeq $b0.0 = $r0.2, 0
	c0	goto LBB81_11
;;
.endp

#.globl float64_le_quiet
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_le_quiet
float64_le_quiet::
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
	c0	stw 40[$r0.1] = $l0.0
	c0	mov $r0.60 = $r0.3
;;
	c0	mov $r0.58 = $r0.5
	c0	mov $r0.57 = $r0.6
;;
.call extractFloat64Exp, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	mov $r0.59 = $r0.4
	c0	call $l0.0 = extractFloat64Exp
;;
	c0	cmpne $b0.0 = $r0.3, 2047
;;
;;
	c0	br $b0.0, LBB82_2
;;
## BB#1:                                ## %land.lhs.true
	c0	mov $r0.3 = $r0.60
;;
.call extractFloat64Frac0, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac0
;;
	c0	mov $r0.4 = $r0.59
	c0	mov $r0.61 = $r0.3
;;
.call extractFloat64Frac1, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac1
;;
	c0	or $r0.2 = $r0.3, $r0.61
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB82_4
;;
LBB82_2:                                ## %lor.lhs.false
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat64Exp, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Exp
;;
	c0	cmpne $b0.0 = $r0.3, 2047
;;
;;
	c0	br $b0.0, LBB82_8
;;
## BB#3:                                ## %land.lhs.true.16
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat64Frac0, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac0
;;
	c0	mov $r0.4 = $r0.57
	c0	mov $r0.61 = $r0.3
;;
.call extractFloat64Frac1, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac1
;;
	c0	or $r0.2 = $r0.3, $r0.61
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB82_8
;;
LBB82_4:                                ## %if.then
	c0	mov $r0.3 = $r0.60
	c0	mov $r0.4 = $r0.59
;;
.call float64_is_signaling_nan, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = float64_is_signaling_nan
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB82_7
;;
## BB#5:                                ## %lor.lhs.false.29
	c0	mov $r0.3 = $r0.58
	c0	mov $r0.4 = $r0.57
;;
.call float64_is_signaling_nan, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = float64_is_signaling_nan
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB82_6
;;
LBB82_7:                                ## %if.then.34
	c0	mov $r0.3 = 16
	c0	mov $r0.57 = 0
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
	c0	goto LBB82_17
;;
LBB82_8:                                ## %if.end.35
	c0	mov $r0.3 = $r0.60
;;
.call extractFloat64Sign, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Sign
;;
	c0	mov $r0.61 = $r0.3
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat64Sign, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Sign
;;
	c0	cmpeq $b0.0 = $r0.61, $r0.3
;;
;;
	c0	brf $b0.0, LBB82_9
;;
## BB#13:                               ## %if.end.53
	c0	cmpeq $b0.0 = $r0.61, 0
;;
;;
	c0	br $b0.0, LBB82_15
;;
## BB#14:                               ## %cond.true
	c0	mov $r0.5 = $r0.60
	c0	mov $r0.4 = $r0.57
;;
	c0	mov $r0.3 = $r0.58
	c0	mov $r0.6 = $r0.59
;;
	c0	goto LBB82_16
;;
LBB82_9:                                ## %if.then.43
	c0	cmpne $b0.0 = $r0.61, 0
;;
;;
	c0	brf $b0.0, LBB82_11
;;
## BB#10:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
	c0	mfb $r0.57 = $b0.0
	c0	goto LBB82_17
;;
LBB82_15:                               ## %cond.false
	c0	mov $r0.5 = $r0.58
	c0	mov $r0.4 = $r0.59
;;
	c0	mov $r0.3 = $r0.60
	c0	mov $r0.6 = $r0.57
;;
LBB82_16:                               ## %cleanup
.call le64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32)
	c0	call $l0.0 = le64
;;
	c0	mov $r0.57 = $r0.3
	c0	goto LBB82_17
;;
LBB82_11:                               ## %lor.rhs
	c0	or $r0.2 = $r0.58, $r0.60
	c0	mov $r0.3 = 1
;;
	c0	or $r0.4 = $r0.57, $r0.59
	c0	shl $r0.2 = $r0.2, $r0.3
;;
	c0	or $r0.2 = $r0.4, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	mfb $r0.57 = $b0.0
	c0	goto LBB82_17
;;
LBB82_6:
	c0	mov $r0.57 = 0
;;
LBB82_17:                               ## %cleanup
	c0	mov $r0.3 = $r0.57
	c0	ldw $l0.0 = 40[$r0.1]
;;
	c0	ldw $r0.61 = 44[$r0.1]
;;
	c0	ldw $r0.60 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
.return ret($r0.3:u32)
	c0	ldw $r0.57 = 60[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

#.globl float64_lt_quiet
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @float64_lt_quiet
float64_lt_quiet::
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
	c0	stw 40[$r0.1] = $l0.0
	c0	mov $r0.60 = $r0.3
;;
	c0	mov $r0.58 = $r0.5
	c0	mov $r0.57 = $r0.6
;;
.call extractFloat64Exp, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	mov $r0.59 = $r0.4
	c0	call $l0.0 = extractFloat64Exp
;;
	c0	cmpne $b0.0 = $r0.3, 2047
;;
;;
	c0	br $b0.0, LBB83_2
;;
## BB#1:                                ## %land.lhs.true
	c0	mov $r0.3 = $r0.60
;;
.call extractFloat64Frac0, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac0
;;
	c0	mov $r0.4 = $r0.59
	c0	mov $r0.61 = $r0.3
;;
.call extractFloat64Frac1, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac1
;;
	c0	or $r0.2 = $r0.3, $r0.61
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB83_4
;;
LBB83_2:                                ## %lor.lhs.false
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat64Exp, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Exp
;;
	c0	cmpne $b0.0 = $r0.3, 2047
;;
;;
	c0	br $b0.0, LBB83_8
;;
## BB#3:                                ## %land.lhs.true.16
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat64Frac0, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac0
;;
	c0	mov $r0.4 = $r0.57
	c0	mov $r0.61 = $r0.3
;;
.call extractFloat64Frac1, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Frac1
;;
	c0	or $r0.2 = $r0.3, $r0.61
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB83_8
;;
LBB83_4:                                ## %if.then
	c0	mov $r0.3 = $r0.60
	c0	mov $r0.4 = $r0.59
;;
.call float64_is_signaling_nan, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = float64_is_signaling_nan
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB83_7
;;
## BB#5:                                ## %lor.lhs.false.29
	c0	mov $r0.3 = $r0.58
	c0	mov $r0.4 = $r0.57
;;
.call float64_is_signaling_nan, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = float64_is_signaling_nan
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB83_6
;;
LBB83_7:                                ## %if.then.34
	c0	mov $r0.3 = 16
	c0	mov $r0.57 = 0
;;
.call float_raise, caller, arg($r0.3:u32), ret()
	c0	call $l0.0 = float_raise
;;
	c0	goto LBB83_17
;;
LBB83_8:                                ## %if.end.35
	c0	mov $r0.3 = $r0.60
;;
.call extractFloat64Sign, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Sign
;;
	c0	mov $r0.61 = $r0.3
	c0	mov $r0.3 = $r0.58
;;
.call extractFloat64Sign, caller, arg($r0.3:u32,$r0.4:u32), ret($r0.3:u32)
	c0	call $l0.0 = extractFloat64Sign
;;
	c0	cmpeq $b0.0 = $r0.61, $r0.3
;;
;;
	c0	brf $b0.0, LBB83_9
;;
## BB#13:                               ## %if.end.53
	c0	cmpeq $b0.0 = $r0.61, 0
;;
;;
	c0	br $b0.0, LBB83_15
;;
## BB#14:                               ## %cond.true
	c0	mov $r0.5 = $r0.60
	c0	mov $r0.4 = $r0.57
;;
	c0	mov $r0.3 = $r0.58
	c0	mov $r0.6 = $r0.59
;;
	c0	goto LBB83_16
;;
LBB83_9:                                ## %if.then.43
	c0	cmpeq $b0.0 = $r0.61, 0
;;
;;
	c0	br $b0.0, LBB83_10
;;
## BB#11:                               ## %land.rhs
	c0	or $r0.2 = $r0.58, $r0.60
	c0	mov $r0.3 = 1
;;
	c0	or $r0.4 = $r0.57, $r0.59
	c0	shl $r0.2 = $r0.2, $r0.3
;;
	c0	or $r0.2 = $r0.4, $r0.2
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	mfb $r0.57 = $b0.0
	c0	goto LBB83_17
;;
LBB83_15:                               ## %cond.false
	c0	mov $r0.5 = $r0.58
	c0	mov $r0.4 = $r0.59
;;
	c0	mov $r0.3 = $r0.60
	c0	mov $r0.6 = $r0.57
;;
LBB83_16:                               ## %cleanup
.call lt64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32), ret($r0.3:u32)
	c0	call $l0.0 = lt64
;;
	c0	mov $r0.57 = $r0.3
	c0	goto LBB83_17
;;
LBB83_10:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
;;
;;
	c0	mfb $r0.57 = $b0.0
	c0	goto LBB83_17
;;
LBB83_6:
	c0	mov $r0.57 = 0
;;
LBB83_17:                               ## %cleanup
	c0	mov $r0.3 = $r0.57
	c0	ldw $l0.0 = 40[$r0.1]
;;
	c0	ldw $r0.61 = 44[$r0.1]
;;
	c0	ldw $r0.60 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
.return ret($r0.3:u32)
	c0	ldw $r0.57 = 60[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
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


.import add64
.type add64, @function
.import add96
.type add96, @function
.import addFloat32Sigs
.type addFloat32Sigs, @function
.import addFloat64Sigs
.type addFloat64Sigs, @function
.import commonNaNToFloat32
.type commonNaNToFloat32, @function
.import commonNaNToFloat64
.type commonNaNToFloat64, @function
.import countLeadingZeros32
.type countLeadingZeros32, @function
.import eq64
.type eq64, @function
.import estimateDiv64To32
.type estimateDiv64To32, @function
.import estimateSqrt32
.type estimateSqrt32, @function
.import extractFloat32Exp
.type extractFloat32Exp, @function
.import extractFloat32Frac
.type extractFloat32Frac, @function
.import extractFloat32Sign
.type extractFloat32Sign, @function
.import extractFloat64Exp
.type extractFloat64Exp, @function
.import extractFloat64Frac0
.type extractFloat64Frac0, @function
.import extractFloat64Frac1
.type extractFloat64Frac1, @function
.import extractFloat64Sign
.type extractFloat64Sign, @function
.import float32ToCommonNaN
.type float32ToCommonNaN, @function
.import float32_is_nan
.type float32_is_nan, @function
.import float32_is_signaling_nan
.type float32_is_signaling_nan, @function
.import float64ToCommonNaN
.type float64ToCommonNaN, @function
.import float64_is_nan
.type float64_is_nan, @function
.import float64_is_signaling_nan
.type float64_is_signaling_nan, @function
.import float_raise
.type float_raise, @function
.import le64
.type le64, @function
.import lt64
.type lt64, @function
.import mul32To64
.type mul32To64, @function
.import mul64By32To96
.type mul64By32To96, @function
.import mul64To128
.type mul64To128, @function
.import normalizeFloat32Subnormal
.type normalizeFloat32Subnormal, @function
.import normalizeFloat64Subnormal
.type normalizeFloat64Subnormal, @function
.import normalizeRoundAndPackFloat32
.type normalizeRoundAndPackFloat32, @function
.import normalizeRoundAndPackFloat64
.type normalizeRoundAndPackFloat64, @function
.import packFloat32
.type packFloat32, @function
.import packFloat64
.type packFloat64, @function
.import propagateFloat32NaN
.type propagateFloat32NaN, @function
.import propagateFloat64NaN
.type propagateFloat64NaN, @function
.import roundAndPackFloat32
.type roundAndPackFloat32, @function
.import roundAndPackFloat64
.type roundAndPackFloat64, @function
.import shift32RightJamming
.type shift32RightJamming, @function
.import shift64ExtraRightJamming
.type shift64ExtraRightJamming, @function
.import shift64Right
.type shift64Right, @function
.import shift64RightJamming
.type shift64RightJamming, @function
.import shortShift64Left
.type shortShift64Left, @function
.import shortShift96Left
.type shortShift96Left, @function
.import sub64
.type sub64, @function
.import sub96
.type sub96, @function
.import subFloat32Sigs
.type subFloat32Sigs, @function
.import subFloat64Sigs
.type subFloat64Sigs, @function
