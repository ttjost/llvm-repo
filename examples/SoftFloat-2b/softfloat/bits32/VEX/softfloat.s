.section .text
#.globl shift32RightJamming
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @shift32RightJamming
shift32RightJamming::
## BB#0:                                ## %entry
	c0	cmpeq $b0.0 = $r0.4, 0
;;
	c0	br $b0.0, LBB0_4
;;
## BB#1:                                ## %if.else
	c0	cmpgt $b0.0 = $r0.4, 31
;;
	c0	br $b0.0, LBB0_3
;;
## BB#2:                                ## %if.then.2
	c0	mov $r0.2 = 0
	c0	shru $r0.6 = $r0.3, $r0.4
;;
	c0	sub $r0.2 = $r0.2, $r0.4
;;
	c0	and $r0.2 = $r0.2, 31
;;
	c0	shl $r0.2 = $r0.3, $r0.2
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	or $r0.3 = $r0.2, $r0.6
;;
.return ret()
	c0	stw 0[$r0.5] = $r0.3
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB0_3:                                 ## %if.else.4
	c0	cmpne $b0.0 = $r0.3, 0
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
	c0	br $b0.0, LBB1_1
;;
## BB#2:                                ## %if.else
	c0	mov $r0.2 = 0
	c0	cmpgt $b0.0 = $r0.5, 31
;;
	c0	br $b0.0, LBB1_4
;;
## BB#3:                                ## %if.then.2
	c0	sub $r0.2 = $r0.2, $r0.5
	c0	shru $r0.4 = $r0.4, $r0.5
;;
	c0	and $r0.2 = $r0.2, 31
;;
	c0	shl $r0.8 = $r0.3, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.5
;;
	c0	or $r0.4 = $r0.8, $r0.4
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
	c0	br $b0.0, LBB2_1
;;
## BB#2:                                ## %if.else
	c0	mov $r0.2 = 0
;;
	c0	sub $r0.8 = $r0.2, $r0.5
	c0	cmpgt $b0.0 = $r0.5, 31
;;
	c0	and $r0.8 = $r0.8, 31
	c0	br $b0.0, LBB2_4
;;
## BB#3:                                ## %if.then.2
	c0	shl $r0.9 = $r0.4, $r0.8
	c0	shl $r0.8 = $r0.3, $r0.8
	c0	shru $r0.4 = $r0.4, $r0.5
	c0	shru $r0.2 = $r0.3, $r0.5
;;
	c0	cmpne $b0.0 = $r0.9, 0
	c0	or $r0.3 = $r0.8, $r0.4
;;
	c0	mfb $r0.4 = $b0.0
;;
	c0	or $r0.4 = $r0.3, $r0.4
	c0	goto LBB2_10
;;
LBB2_1:
	c0	mov $r0.2 = $r0.3
	c0	goto LBB2_10
;;
LBB2_4:                                 ## %if.else.7
	c0	cmpne $b0.0 = $r0.5, 32
;;
	c0	br $b0.0, LBB2_7
;;
## BB#5:                                ## %if.then.10
	c0	cmpne $b0.0 = $r0.4, 0
	c0	goto LBB2_6
;;
LBB2_7:                                 ## %if.else.14
	c0	cmpgt $b0.0 = $r0.5, 63
;;
	c0	br $b0.0, LBB2_9
;;
## BB#8:                                ## %if.then.17
	c0	shl $r0.8 = $r0.3, $r0.8
	c0	and $r0.5 = $r0.5, 31
;;
	c0	or $r0.4 = $r0.8, $r0.4
;;
	c0	cmpne $b0.0 = $r0.4, 0
	c0	shru $r0.3 = $r0.3, $r0.5
;;
LBB2_6:                                 ## %if.end.31
	c0	mfb $r0.4 = $b0.0
;;
	c0	or $r0.4 = $r0.4, $r0.3
	c0	goto LBB2_10
;;
LBB2_9:                                 ## %if.else.25
	c0	or $r0.3 = $r0.4, $r0.3
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
	c0	mfb $r0.4 = $b0.0
;;
LBB2_10:                                ## %if.end.31
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
	c0	br $b0.0, LBB3_8
;;
## BB#1:                                ## %if.else
	c0	mov $r0.2 = 0
;;
	c0	sub $r0.10 = $r0.2, $r0.6
	c0	cmpgt $b0.0 = $r0.6, 31
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
	c0	br $b0.0, LBB3_7
;;
## BB#4:                                ## %if.else.8
	c0	or $r0.5 = $r0.5, $r0.4
	c0	cmpgt $b0.0 = $r0.6, 63
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
	c0	mov $r0.2 = 0
	c0	cmpeq $b0.1 = $r0.6, 64
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
	c0	shl $r0.2 = $r0.4, $r0.5
	c0	cmpeq $b0.0 = $r0.5, 0
;;
	c0	stw 0[$r0.7] = $r0.2
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
	c0	shl $r0.10 = $r0.4, $r0.6
	c0	shl $r0.2 = $r0.3, $r0.6
	c0	shl $r0.3 = $r0.5, $r0.6
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
	c0	or $r0.10 = $r0.5, $r0.10
	c0	or $r0.2 = $r0.4, $r0.2
;;
LBB5_2:                                 ## %if.end
	c0	stw 0[$r0.9] = $r0.3
;;
	c0	stw 0[$r0.8] = $r0.10
;;
.return ret()
	c0	stw 0[$r0.7] = $r0.2
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
	c0	add $r0.3 = $r0.6, $r0.3
	c0	ldw $r0.5 = 16[$r0.1]
;;
	c0	cmpltu $r0.6 = $r0.2, $r0.8
	c0	cmpltu $r0.7 = $r0.4, $r0.7
;;
	c0	add $r0.4 = $r0.6, $r0.4
	c0	add $r0.3 = $r0.3, $r0.7
;;
	c0	cmpltu $r0.6 = $r0.4, $r0.6
	c0	stw 0[$r0.5] = $r0.2
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
	c0	sub $r0.4 = $r0.4, $r0.6
;;
	c0	mtb $b0.0 = $r0.9
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
	c0	cmpltu $b0.0 = $r0.5, $r0.8
	c0	cmpltu $r0.11 = $r0.4, $r0.7
	c0	sub $r0.4 = $r0.4, $r0.7
	c0	sub $r0.3 = $r0.3, $r0.6
;;
	c0	mfb $r0.6 = $b0.0
	c0	mtb $b0.0 = $r0.11
;;
	c0	cmpltu $r0.7 = $r0.4, $r0.6
	c0	slct $r0.11 = $b0.0, $r0.2, 0
	c0	ldw $r0.12 = 16[$r0.1]
	c0	sub $r0.5 = $r0.5, $r0.8
;;
	c0	mtb $b0.0 = $r0.7
	c0	add $r0.3 = $r0.3, $r0.11
;;
	c0	slct $r0.2 = $b0.0, $r0.2, 0
	c0	stw 0[$r0.12] = $r0.5
	c0	sub $r0.4 = $r0.4, $r0.6
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
	c0	mpylu $r0.7 = $r0.7, $r0.8
	c0	mpylu $r0.8 = $r0.4, $r0.3
;;
	c0	add $r0.10 = $r0.11, $r0.10
	c0	add $r0.11 = $r0.12, $r0.13
	c0	mpyhs $r0.3 = $r0.4, $r0.3
	c0	add $r0.4 = $r0.7, $r0.9
;;
	c0	add $r0.3 = $r0.8, $r0.3
	c0	add $r0.7 = $r0.11, $r0.10
;;
	c0	cmpltu $r0.8 = $r0.7, $r0.11
	c0	shl $r0.9 = $r0.7, $r0.2
	c0	shru $r0.7 = $r0.7, $r0.2
;;
	c0	shl $r0.2 = $r0.8, $r0.2
	c0	add $r0.4 = $r0.9, $r0.4
;;
	c0	or $r0.2 = $r0.2, $r0.7
	c0	cmpltu $r0.7 = $r0.4, $r0.9
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
	c0	mpyhs $r0.16 = $r0.9, $r0.4
	c0	mpyhs $r0.17 = $r0.5, $r0.10
;;
	c0	mpylu $r0.18 = $r0.5, $r0.10
	c0	mpyhs $r0.19 = $r0.5, $r0.3
	c0	mpylu $r0.20 = $r0.5, $r0.3
	c0	add $r0.15 = $r0.15, $r0.16
	c0	add $r0.13 = $r0.14, $r0.13
	c0	mpyhs $r0.3 = $r0.9, $r0.3
	c0	mpylu $r0.14 = $r0.9, $r0.10
	c0	mpyhs $r0.9 = $r0.9, $r0.10
;;
	c0	add $r0.10 = $r0.18, $r0.17
	c0	add $r0.16 = $r0.20, $r0.19
	c0	add $r0.3 = $r0.12, $r0.3
	c0	mpylu $r0.12 = $r0.5, $r0.4
	c0	mpyhs $r0.4 = $r0.5, $r0.4
	c0	add $r0.9 = $r0.14, $r0.9
	c0	mpyhs $r0.14 = $r0.5, $r0.11
	c0	mpylu $r0.5 = $r0.5, $r0.11
;;
	c0	add $r0.11 = $r0.10, $r0.15
	c0	add $r0.13 = $r0.16, $r0.13
	c0	add $r0.4 = $r0.12, $r0.4
	c0	add $r0.5 = $r0.5, $r0.14
;;
	c0	cmpltu $r0.10 = $r0.11, $r0.10
	c0	shl $r0.12 = $r0.13, $r0.2
	c0	shl $r0.14 = $r0.11, $r0.2
	c0	shru $r0.11 = $r0.11, $r0.2
	c0	cmpltu $r0.15 = $r0.13, $r0.16
	c0	shru $r0.13 = $r0.13, $r0.2
;;
	c0	shl $r0.10 = $r0.10, $r0.2
	c0	add $r0.3 = $r0.12, $r0.3
	c0	add $r0.9 = $r0.14, $r0.9
	c0	shl $r0.2 = $r0.15, $r0.2
;;
	c0	or $r0.10 = $r0.10, $r0.11
	c0	add $r0.4 = $r0.3, $r0.4
	c0	cmpltu $r0.11 = $r0.9, $r0.14
	c0	or $r0.2 = $r0.2, $r0.13
	c0	cmpltu $r0.12 = $r0.3, $r0.12
;;
	c0	add $r0.4 = $r0.4, $r0.10
;;
	c0	add $r0.4 = $r0.4, $r0.11
	c0	add $r0.2 = $r0.2, $r0.5
;;
	c0	cmpltu $b0.0 = $r0.4, $r0.3
	c0	add $r0.2 = $r0.2, $r0.12
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
	c0	mpylu $r0.17 = $r0.6, $r0.11
	c0	mpyhs $r0.18 = $r0.6, $r0.11
	c0	mpyhs $r0.19 = $r0.12, $r0.4
	c0	mpylu $r0.20 = $r0.12, $r0.4
;;
	c0	mpyhs $r0.21 = $r0.5, $r0.4
	c0	mpylu $r0.22 = $r0.5, $r0.4
	c0	add $r0.17 = $r0.17, $r0.18
	c0	add $r0.18 = $r0.20, $r0.19
	c0	add $r0.15 = $r0.16, $r0.15
	c0	mpyhs $r0.16 = $r0.5, $r0.11
	c0	mpylu $r0.19 = $r0.5, $r0.11
	c0	mpyhs $r0.20 = $r0.5, $r0.3
;;
	c0	add $r0.21 = $r0.22, $r0.21
	c0	add $r0.18 = $r0.17, $r0.18
	c0	mpylu $r0.22 = $r0.5, $r0.3
	c0	mpyhs $r0.23 = $r0.13, $r0.14
	c0	mpylu $r0.24 = $r0.13, $r0.14
	c0	mpyhs $r0.25 = $r0.6, $r0.4
	c0	mpylu $r0.26 = $r0.6, $r0.4
	c0	mpylu $r0.27 = $r0.12, $r0.11
;;
	c0	add $r0.21 = $r0.15, $r0.21
	c0	mpyhs $r0.11 = $r0.12, $r0.11
	c0	cmpltu $r0.17 = $r0.18, $r0.17
	c0	add $r0.16 = $r0.19, $r0.16
	c0	mpylu $r0.19 = $r0.12, $r0.3
	c0	mpyhs $r0.28 = $r0.12, $r0.3
	c0	add $r0.20 = $r0.22, $r0.20
	c0	add $r0.22 = $r0.24, $r0.23
;;
	c0	shl $r0.23 = $r0.21, $r0.2
	c0	mpyhs $r0.24 = $r0.6, $r0.14
	c0	mpylu $r0.29 = $r0.6, $r0.14
	c0	add $r0.20 = $r0.22, $r0.20
	c0	mpyhs $r0.30 = $r0.5, $r0.14
	c0	mpylu $r0.5 = $r0.5, $r0.14
	c0	shl $r0.31 = $r0.18, $r0.2
	c0	add $r0.11 = $r0.27, $r0.11
;;
	c0	add $r0.16 = $r0.23, $r0.16
	c0	add $r0.25 = $r0.26, $r0.25
	c0	add $r0.19 = $r0.19, $r0.28
	c0	add $r0.24 = $r0.29, $r0.24
	c0	shru $r0.18 = $r0.18, $r0.2
	c0	shl $r0.17 = $r0.17, $r0.2
	c0	cmpltu $r0.15 = $r0.21, $r0.15
	c0	add $r0.11 = $r0.31, $r0.11
;;
	c0	add $r0.19 = $r0.24, $r0.19
	c0	mpylu $r0.26 = $r0.13, $r0.4
	c0	mpyhs $r0.4 = $r0.13, $r0.4
	c0	or $r0.17 = $r0.17, $r0.18
	c0	add $r0.18 = $r0.16, $r0.25
	c0	shl $r0.25 = $r0.20, $r0.2
	c0	add $r0.5 = $r0.5, $r0.30
	c0	mpyhs $r0.27 = $r0.12, $r0.14
;;
	c0	mpylu $r0.12 = $r0.12, $r0.14
	c0	add $r0.5 = $r0.25, $r0.5
	c0	add $r0.4 = $r0.26, $r0.4
	c0	cmpltu $r0.14 = $r0.19, $r0.24
	c0	shl $r0.15 = $r0.15, $r0.2
	c0	shru $r0.21 = $r0.21, $r0.2
	c0	add $r0.17 = $r0.18, $r0.17
	c0	cmpltu $r0.18 = $r0.11, $r0.31
;;
	c0	add $r0.17 = $r0.17, $r0.18
	c0	shru $r0.18 = $r0.19, $r0.2
	c0	shl $r0.14 = $r0.14, $r0.2
	c0	or $r0.15 = $r0.15, $r0.21
	c0	add $r0.4 = $r0.5, $r0.4
	c0	shl $r0.19 = $r0.19, $r0.2
	c0	add $r0.12 = $r0.12, $r0.27
	c0	mpylu $r0.21 = $r0.6, $r0.3
;;
	c0	mpyhs $r0.6 = $r0.6, $r0.3
	c0	add $r0.12 = $r0.19, $r0.12
	c0	cmpltu $r0.22 = $r0.20, $r0.22
	c0	cmpltu $b0.0 = $r0.17, $r0.16
	c0	add $r0.4 = $r0.4, $r0.15
	c0	cmpltu $r0.15 = $r0.16, $r0.23
	c0	or $r0.14 = $r0.14, $r0.18
	c0	mpyhs $r0.16 = $r0.13, $r0.3
;;
	c0	add $r0.6 = $r0.21, $r0.6
	c0	mpylu $r0.3 = $r0.13, $r0.3
	c0	add $r0.13 = $r0.17, $r0.12
	c0	shru $r0.18 = $r0.20, $r0.2
	c0	shl $r0.2 = $r0.22, $r0.2
	c0	mfb $r0.20 = $b0.0
	c0	add $r0.4 = $r0.4, $r0.15
	c0	cmpltu $r0.12 = $r0.12, $r0.19
;;
	c0	add $r0.6 = $r0.14, $r0.6
	c0	add $r0.4 = $r0.4, $r0.20
	c0	or $r0.2 = $r0.2, $r0.18
	c0	add $r0.3 = $r0.3, $r0.16
	c0	cmpltu $r0.14 = $r0.13, $r0.17
	c0	cmpltu $r0.15 = $r0.5, $r0.25
;;
	c0	add $r0.6 = $r0.6, $r0.12
	c0	cmpltu $b0.0 = $r0.4, $r0.5
	c0	add $r0.2 = $r0.2, $r0.3
;;
	c0	add $r0.3 = $r0.6, $r0.14
	c0	add $r0.2 = $r0.2, $r0.15
;;
	c0	add $r0.4 = $r0.3, $r0.4
	c0	mfb $r0.5 = $b0.0
	c0	stw 0[$r0.10] = $r0.11
;;
	c0	cmpltu $r0.3 = $r0.4, $r0.3
	c0	add $r0.2 = $r0.2, $r0.5
	c0	stw 0[$r0.9] = $r0.13
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
	c0	brf $b0.0, LBB14_2
;;
## BB#1:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB14_2:                                ## %lor.rhs
	c0	cmpleu $b0.0 = $r0.4, $r0.6
	c0	cmpeq $b0.1 = $r0.3, $r0.5
;;
	c0	mfb $r0.2 = $b0.0
	c0	mfb $r0.3 = $b0.1
;;
	c0	and $r0.2 = $r0.3, $r0.2
;;
	c0	mtb $b0.0 = $r0.2
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
	c0	brf $b0.0, LBB15_2
;;
## BB#1:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB15_2:                                ## %lor.rhs
	c0	cmpltu $b0.0 = $r0.4, $r0.6
	c0	cmpeq $b0.1 = $r0.3, $r0.5
;;
	c0	mfb $r0.2 = $b0.0
	c0	mfb $r0.3 = $b0.1
;;
	c0	and $r0.2 = $r0.3, $r0.2
;;
	c0	mtb $b0.0 = $r0.2
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
	c0	cmpne $b0.0 = $r0.3, 0
	c0	cmpeq $b0.1 = $r0.2, 2139095040
;;
	c0	mfb $r0.2 = $b0.0
	c0	mfb $r0.3 = $b0.1
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
	c0	br $b0.0, LBB20_1
;;
## BB#2:                                ## %land.rhs
	c0	cmpne $b0.0 = $r0.4, 0
;;
	c0	brf $b0.0, LBB20_4
;;
## BB#3:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
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
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB20_4:                                ## %lor.rhs
	c0	and $r0.2 = $r0.3, 1048575
;;
	c0	cmpne $b0.0 = $r0.2, 0
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
	c0	br $b0.0, LBB21_1
;;
## BB#2:                                ## %land.rhs
	c0	cmpne $b0.0 = $r0.4, 0
;;
	c0	brf $b0.0, LBB21_4
;;
## BB#3:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
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
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB21_4:                                ## %lor.rhs
	c0	and $r0.2 = $r0.3, 524287
;;
	c0	cmpne $b0.0 = $r0.2, 0
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
	c0	mov $r0.2 = 31
	c0	mov $r0.8 = 20
;;
	c0	shl $r0.5 = $r0.5, $r0.8
	c0	shl $r0.2 = $r0.4, $r0.2
;;
	c0	add $r0.2 = $r0.5, $r0.2
;;
	c0	add $r0.2 = $r0.2, $r0.6
;;
	c0	stw 0[$r0.3] = $r0.2
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.7
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
	c0	mov $r0.7 = 4
	c0	mov $r0.8 = countLeadingZeros32.countLeadingZerosHigh
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
	c0	slct $r0.4 = $b0.0, $r0.4, $r0.9
	c0	mfb $r0.10 = $b0.0
;;
	c0	cmpltu $b0.0 = $r0.4, 16777216
	c0	shl $r0.5 = $r0.4, $r0.5
;;
	c0	slct $r0.4 = $b0.0, $r0.5, $r0.4
;;
	c0	shru $r0.4 = $r0.4, $r0.6
	c0	shl $r0.5 = $r0.10, $r0.7
;;
	c0	and $r0.4 = $r0.4, 1020
	c0	or $r0.6 = $r0.5, 8
;;
	c0	add $r0.4 = $r0.8, $r0.4
	c0	slct $r0.5 = $b0.0, $r0.6, $r0.5
;;
	c0	ldw $r0.4 = 0[$r0.4]
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
	c0	cmpne $b0.0 = $r0.4, 0
;;
	c0	brf $b0.0, LBB32_1
;;
## BB#2:                                ## %if.end
	c0	mov $r0.2 = 31
	c0	mov $r0.5 = 16
	c0	mov $r0.6 = 8
	c0	mov $r0.7 = 22
	c0	mov $r0.8 = 4
;;
	c0	shr $r0.2 = $r0.4, $r0.2
;;
	c0	add $r0.9 = $r0.4, $r0.2
;;
	c0	xor $r0.2 = $r0.9, $r0.2
;;
	c0	cmpltu $b0.0 = $r0.2, 65536
	c0	shl $r0.5 = $r0.2, $r0.5
;;
	c0	slct $r0.5 = $b0.0, $r0.5, $r0.2
	c0	mfb $r0.9 = $b0.0
;;
	c0	cmpltu $b0.0 = $r0.5, 16777216
	c0	shl $r0.6 = $r0.5, $r0.6
;;
	c0	slct $r0.5 = $b0.0, $r0.6, $r0.5
;;
	c0	shru $r0.5 = $r0.5, $r0.7
	c0	mov $r0.6 = countLeadingZeros32.countLeadingZerosHigh
	c0	shl $r0.7 = $r0.9, $r0.8
;;
	c0	and $r0.5 = $r0.5, 1020
	c0	or $r0.8 = $r0.7, 8
;;
	c0	add $r0.5 = $r0.6, $r0.5
	c0	slct $r0.6 = $b0.0, $r0.8, $r0.7
;;
	c0	ldw $r0.5 = 0[$r0.5]
;;
	c0	add $r0.5 = $r0.5, $r0.6
	c0	and $r0.4 = $r0.4, -2147483648
;;
	c0	add $r0.7 = $r0.5, -11
;;
	c0	cmplt $b0.0 = $r0.7, 0
;;
	c0	br $b0.0, LBB32_4
;;
## BB#3:                                ## %if.then.5
	c0	mov $r0.6 = 0
	c0	shl $r0.2 = $r0.2, $r0.7
	c0	goto LBB32_8
;;
LBB32_1:                                ## %if.then
	c0	mov $r0.2 = 0
;;
	c0	stw 0[$r0.3] = $r0.2
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.2
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB32_4:                                ## %if.else
	c0	mov $r0.7 = 11
	c0	mov $r0.6 = 0
;;
	c0	sub $r0.7 = $r0.7, $r0.5
;;
	c0	cmpeq $b0.0 = $r0.7, 0
;;
	c0	br $b0.0, LBB32_8
;;
## BB#5:                                ## %if.else.i
	c0	cmpgt $b0.0 = $r0.7, 31
;;
	c0	br $b0.0, LBB32_7
;;
## BB#6:                                ## %if.then.2.i
	c0	sub $r0.6 = $r0.6, $r0.7
	c0	shru $r0.7 = $r0.2, $r0.7
;;
	c0	and $r0.6 = $r0.6, 31
;;
	c0	shl $r0.6 = $r0.2, $r0.6
	c0	mov $r0.2 = $r0.7
	c0	goto LBB32_8
;;
LBB32_7:                                ## %if.else.4.i
	c0	and $r0.6 = $r0.7, 31
;;
	c0	shru $r0.6 = $r0.2, $r0.6
	c0	cmplt $b0.0 = $r0.7, 64
	c0	mov $r0.2 = 0
;;
	c0	slct $r0.6 = $b0.0, $r0.6, 0
;;
LBB32_8:                                ## %if.end.7
	c0	mov $r0.7 = 1053
	c0	mov $r0.8 = 20
;;
	c0	sub $r0.5 = $r0.7, $r0.5
;;
	c0	shl $r0.5 = $r0.5, $r0.8
;;
	c0	add $r0.4 = $r0.5, $r0.4
;;
	c0	add $r0.2 = $r0.4, $r0.2
;;
	c0	stw 0[$r0.3] = $r0.2
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.6
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
	c0	and $r0.5 = $r0.3, 8388607
	c0	shru $r0.2 = $r0.3, $r0.8
;;
	c0	cmplt $b0.0 = $r0.7, 0
;;
	c0	br $b0.0, LBB33_8
;;
## BB#1:                                ## %if.then
	c0	cmpltu $b0.0 = $r0.4, 158
;;
	c0	br $b0.0, LBB33_7
;;
## BB#2:                                ## %if.then.4
	c0	cmpeq $b0.0 = $r0.3, -822083584
;;
	c0	br $b0.0, LBB33_6
;;
## BB#3:                                ## %if.then.6
	c0	mov $r0.6 = float_exception_flags
	c0	cmpeq $b0.0 = $r0.2, 0
	c0	mov $r0.3 = 2147483647
;;
	c0	ldw $r0.2 = 0[$r0.6]
;;
	c0	or $r0.2 = $r0.2, 16
;;
	c0	stw 0[$r0.6] = $r0.2
	c0	br $b0.0, LBB33_20
;;
## BB#4:                                ## %lor.lhs.false
	c0	cmpeq $b0.0 = $r0.5, 0
;;
	c0	br $b0.0, LBB33_6
;;
## BB#5:                                ## %lor.lhs.false
	c0	cmpeq $b0.0 = $r0.4, 255
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
	c0	br $b0.0, LBB33_10
;;
## BB#9:                                ## %if.then.17
	c0	mov $r0.3 = 0
	c0	or $r0.4 = $r0.4, $r0.5
	c0	goto LBB33_11
;;
LBB33_7:                                ## %if.end.11
	c0	or $r0.3 = $r0.5, 8388608
	c0	mov $r0.4 = 0
;;
	c0	shl $r0.3 = $r0.3, $r0.7
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	sub $r0.2 = $r0.4, $r0.3
;;
.return ret($r0.3:u32)
	c0	slct $r0.3 = $b0.0, $r0.3, $r0.2
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
	c0	br $b0.0, LBB33_13
;;
## BB#12:                               ## %if.then.25
	c0	mov $r0.5 = float_exception_flags
;;
	c0	ldw $r0.6 = 0[$r0.5]
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
	c0	cmpne $b0.0 = $r0.5, 0
;;
	c0	brf $b0.0, LBB33_14
;;
## BB#17:                               ## %if.else.42
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB33_19
;;
## BB#18:                               ## %if.then.45
	c0	cmpeq $b0.0 = $r0.5, 3
	c0	cmpne $b0.1 = $r0.4, 0
	c0	mov $r0.2 = 0
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
	c0	br $b0.0, LBB33_16
;;
## BB#15:                               ## %if.then.31
	c0	and $r0.4 = $r0.4, 2147483647
	c0	add $r0.3 = $r0.3, 1
;;
	c0	and $r0.5 = $r0.3, -2
	c0	cmpeq $b0.0 = $r0.4, 0
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
	c0	mov $r0.7 = 31
;;
	c0	shru $r0.6 = $r0.3, $r0.2
;;
	c0	zxtb $r0.4 = $r0.6
;;
	c0	add $r0.8 = $r0.4, -158
	c0	and $r0.5 = $r0.3, 8388607
	c0	shru $r0.2 = $r0.3, $r0.7
;;
	c0	cmplt $b0.0 = $r0.8, 0
;;
	c0	br $b0.0, LBB34_6
;;
## BB#1:                                ## %if.then
	c0	cmpeq $b0.0 = $r0.3, -822083584
;;
	c0	br $b0.0, LBB34_5
;;
## BB#2:                                ## %if.then.4
	c0	mov $r0.6 = float_exception_flags
	c0	cmpeq $b0.0 = $r0.2, 0
	c0	mov $r0.3 = 2147483647
;;
	c0	ldw $r0.2 = 0[$r0.6]
;;
	c0	or $r0.2 = $r0.2, 16
;;
	c0	stw 0[$r0.6] = $r0.2
	c0	br $b0.0, LBB34_12
;;
## BB#3:                                ## %lor.lhs.false
	c0	cmpeq $b0.0 = $r0.5, 0
;;
	c0	br $b0.0, LBB34_5
;;
## BB#4:                                ## %lor.lhs.false
	c0	cmpeq $b0.0 = $r0.4, 255
;;
	c0	br $b0.0, LBB34_12
;;
LBB34_5:                                ## %if.end.8
.return ret($r0.3:u32)
	c0	mov $r0.3 = -2147483648
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB34_6:                                ## %if.else
	c0	cmpgtu $b0.0 = $r0.4, 126
;;
	c0	br $b0.0, LBB34_9
;;
## BB#7:                                ## %if.then.10
	c0	or $r0.2 = $r0.4, $r0.5
	c0	mov $r0.3 = 0
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB34_12
;;
## BB#8:                                ## %if.then.12
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
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
	c0	sub $r0.4 = $r0.7, $r0.4
;;
	c0	shl $r0.5 = $r0.3, $r0.5
	c0	shru $r0.3 = $r0.3, $r0.4
;;
	c0	cmpeq $b0.0 = $r0.5, 0
;;
	c0	br $b0.0, LBB34_11
;;
## BB#10:                               ## %if.then.21
	c0	mov $r0.4 = float_exception_flags
;;
	c0	ldw $r0.5 = 0[$r0.4]
;;
	c0	or $r0.5 = $r0.5, 1
;;
	c0	stw 0[$r0.4] = $r0.5
;;
LBB34_11:                               ## %if.end.23
	c0	mov $r0.4 = 0
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	sub $r0.2 = $r0.4, $r0.3
;;
	c0	slct $r0.3 = $b0.0, $r0.3, $r0.2
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
	c0	mov $r0.5 = 23
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.5 = $r0.4, $r0.5
;;
	c0	zxtb $r0.7 = $r0.5
	c0	and $r0.6 = $r0.4, 8388607
	c0	shru $r0.5 = $r0.4, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.7, 0
;;
	c0	brf $b0.0, LBB35_1
;;
## BB#8:                                ## %if.then.6
	c0	cmpne $b0.0 = $r0.6, 0
;;
	c0	brf $b0.0, LBB35_9
;;
## BB#11:                               ## %if.end.9
	c0	mov $r0.7 = 16
	c0	cmpltu $b0.0 = $r0.6, 65536
	c0	mov $r0.8 = 8
	c0	mov $r0.9 = 22
	c0	mov $r0.10 = 4
	c0	mov $r0.11 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	shl $r0.4 = $r0.4, $r0.7
;;
	c0	slct $r0.4 = $b0.0, $r0.4, $r0.6
;;
	c0	cmpltu $b0.1 = $r0.4, 16777216
	c0	shl $r0.7 = $r0.4, $r0.8
;;
	c0	slct $r0.4 = $b0.1, $r0.7, $r0.4
	c0	mfb $r0.7 = $b0.0
;;
	c0	shru $r0.4 = $r0.4, $r0.9
	c0	shl $r0.7 = $r0.7, $r0.10
;;
	c0	and $r0.4 = $r0.4, 1020
	c0	or $r0.9 = $r0.7, 8
;;
	c0	add $r0.4 = $r0.11, $r0.4
	c0	slct $r0.7 = $b0.1, $r0.9, $r0.7
;;
	c0	ldw $r0.4 = 0[$r0.4]
;;
	c0	add $r0.4 = $r0.4, $r0.7
;;
	c0	add $r0.9 = $r0.4, -8
	c0	sub $r0.7 = $r0.8, $r0.4
;;
	c0	shl $r0.6 = $r0.6, $r0.9
	c0	goto LBB35_12
;;
LBB35_1:                                ## %entry
	c0	cmpne $b0.0 = $r0.7, 255
;;
	c0	br $b0.0, LBB35_12
;;
## BB#2:                                ## %if.then
	c0	cmpeq $b0.0 = $r0.6, 0
;;
	c0	br $b0.0, LBB35_7
;;
## BB#3:                                ## %if.then.3
	c0	and $r0.6 = $r0.4, 2143289344
;;
	c0	cmpne $b0.0 = $r0.6, 2139095040
;;
	c0	br $b0.0, LBB35_6
;;
## BB#4:                                ## %if.then.3
	c0	and $r0.6 = $r0.4, 4194303
;;
	c0	cmpeq $b0.0 = $r0.6, 0
;;
	c0	br $b0.0, LBB35_6
;;
## BB#5:                                ## %if.then.i
	c0	mov $r0.6 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.6]
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.6] = $r0.7
;;
LBB35_6:                                ## %float32ToCommonNaN.exit
	c0	mov $r0.6 = 3
	c0	shl $r0.2 = $r0.5, $r0.2
	c0	mov $r0.5 = 29
;;
	c0	shru $r0.6 = $r0.4, $r0.6
	c0	shl $r0.4 = $r0.4, $r0.5
;;
	c0	stw 0[$r0.3] = $r0.4
	c0	or $r0.2 = $r0.6, $r0.2
;;
	c0	or $r0.2 = $r0.2, 2146959360
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.2
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB35_12:                               ## %if.end.10
	c0	shl $r0.2 = $r0.5, $r0.2
	c0	mov $r0.4 = 3
	c0	mov $r0.5 = 20
	c0	mov $r0.8 = 29
;;
	c0	or $r0.2 = $r0.2, 939524096
	c0	shru $r0.4 = $r0.6, $r0.4
	c0	shl $r0.5 = $r0.7, $r0.5
;;
	c0	add $r0.2 = $r0.2, $r0.4
;;
	c0	add $r0.2 = $r0.2, $r0.5
;;
	c0	stw 0[$r0.3] = $r0.2
	c0	shl $r0.2 = $r0.6, $r0.8
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.2
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB35_9:                                ## %if.then.8
	c0	shl $r0.2 = $r0.5, $r0.2
	c0	mov $r0.4 = 0
	c0	goto LBB35_10
;;
LBB35_7:                                ## %if.end
	c0	shl $r0.2 = $r0.5, $r0.2
	c0	mov $r0.4 = 0
;;
	c0	or $r0.2 = $r0.2, 2146435072
;;
LBB35_10:                               ## %cleanup
	c0	stw 0[$r0.3] = $r0.2
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.4
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
	c0	br $b0.0, LBB36_8
;;
## BB#1:                                ## %if.then
	c0	and $r0.4 = $r0.3, 8388607
;;
	c0	cmpeq $b0.0 = $r0.4, 0
;;
	c0	br $b0.0, LBB36_27
;;
## BB#2:                                ## %if.then
	c0	cmpne $b0.0 = $r0.2, 255
;;
	c0	br $b0.0, LBB36_27
;;
## BB#3:                                ## %if.then.3
	c0	and $r0.4 = $r0.3, 2143289344
	c0	or $r0.2 = $r0.3, 4194304
;;
	c0	cmpne $b0.0 = $r0.4, 2139095040
;;
	c0	br $b0.0, LBB36_4
;;
## BB#5:                                ## %if.then.3
	c0	and $r0.3 = $r0.3, 4194303
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
	c0	br $b0.0, LBB36_6
;;
## BB#7:                                ## %cond.end.15.i
	c0	mov $r0.4 = float_exception_flags
	c0	mov $r0.3 = $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.4]
;;
	c0	or $r0.2 = $r0.2, 16
	c0	goto LBB36_26
;;
LBB36_8:                                ## %if.end.5
	c0	cmpgtu $b0.0 = $r0.2, 126
;;
	c0	br $b0.0, LBB36_19
;;
## BB#9:                                ## %if.then.7
	c0	and $r0.4 = $r0.3, 2147483647
;;
	c0	cmpeq $b0.0 = $r0.4, 0
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
	c0	or $r0.8 = $r0.8, 1
;;
	c0	cmpeq $b0.0 = $r0.6, 3
	c0	stw 0[$r0.7] = $r0.8
;;
	c0	br $b0.0, LBB36_16
;;
## BB#11:                               ## %if.end.10
	c0	cmpeq $b0.0 = $r0.6, 2
;;
	c0	brf $b0.0, LBB36_12
;;
## BB#17:                               ## %sw.bb.21
	c0	cmpne $b0.0 = $r0.5, 0
	c0	mov $r0.2 = -2147483648
;;
.return ret($r0.3:u32)
	c0	slct $r0.3 = $b0.0, $r0.2, 1065353216
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB36_19:                               ## %if.end.25
	c0	mov $r0.5 = 150
	c0	mov $r0.7 = float_rounding_mode
	c0	mov $r0.6 = 1
	c0	mov $r0.4 = $r0.3
;;
	c0	ldw $r0.7 = 0[$r0.7]
	c0	sub $r0.2 = $r0.5, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.7, 1
	c0	shl $r0.2 = $r0.6, $r0.2
;;
	c0	br $b0.0, LBB36_24
;;
## BB#20:                               ## %if.end.25
	c0	add $r0.5 = $r0.2, -1
	c0	cmpne $b0.0 = $r0.7, 0
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
	c0	mfb $r0.7 = $b0.0
;;
	c0	cmpeq $b0.0 = $r0.4, $r0.7
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
	c0	br $b0.0, LBB36_27
;;
## BB#25:                               ## %if.then.48
	c0	mov $r0.4 = float_exception_flags
;;
	c0	ldw $r0.5 = 0[$r0.4]
	c0	mov $r0.3 = $r0.2
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
.return ret($r0.3:u32)
	c0	slct $r0.3 = $b0.0, $r0.2, 0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB36_12:                               ## %if.end.10
	c0	cmpne $b0.0 = $r0.6, 0
;;
	c0	br $b0.0, LBB36_18
;;
## BB#13:                               ## %sw.bb
	c0	and $r0.3 = $r0.3, 8388607
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
	c0	br $b0.0, LBB36_18
;;
## BB#14:                               ## %sw.bb
	c0	cmpne $b0.0 = $r0.2, 126
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
	c0	shl $r0.6 = $r0.4, $r0.10
	c0	shl $r0.7 = $r0.3, $r0.10
;;
	c0	sub $r0.9 = $r0.2, $r0.8
	c0	and $r0.6 = $r0.6, 536870848
	c0	and $r0.7 = $r0.7, 536870848
;;
	c0	cmplt $b0.0 = $r0.9, 1
;;
	c0	br $b0.0, LBB38_13
;;
## BB#1:                                ## %if.then
	c0	cmpne $b0.0 = $r0.2, 255
;;
	c0	br $b0.0, LBB38_8
;;
## BB#2:                                ## %if.then.6
	c0	cmpeq $b0.0 = $r0.7, 0
;;
	c0	br $b0.0, LBB38_42
;;
## BB#3:                                ## %if.then.7
	c0	and $r0.6 = $r0.4, 4194303
	c0	and $r0.2 = $r0.3, 2143289344
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.5 = $r0.3, 4194303
;;
	c0	cmpeq $b0.0 = $r0.2, 2139095040
	c0	cmpeq $b0.1 = $r0.7, 2139095040
	c0	cmpne $b0.2 = $r0.6, 0
	c0	cmpne $b0.3 = $r0.5, 0
;;
	c0	mfb $r0.6 = $b0.0
	c0	mfb $r0.7 = $b0.1
	c0	mfb $r0.8 = $b0.2
	c0	mfb $r0.9 = $b0.3
;;
	c0	and $r0.7 = $r0.7, $r0.8
	c0	and $r0.6 = $r0.6, $r0.9
;;
	c0	mtb $b0.0 = $r0.7
	c0	mtb $b0.1 = $r0.6
;;
	c0	br $b0.1, LBB38_5
;;
## BB#4:                                ## %if.then.7
	c0	mfb $r0.6 = $b0.0
;;
	c0	cmpne $b0.1 = $r0.6, 1
;;
	c0	br $b0.1, LBB38_6
;;
LBB38_5:                                ## %if.then.i.152
	c0	mov $r0.6 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.6]
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.6] = $r0.7
;;
LBB38_6:                                ## %if.end.i.153
	c0	or $r0.6 = $r0.4, 4194304
	c0	brf $b0.0, LBB38_36
;;
## BB#7:
.return ret($r0.3:u32)
	c0	mov $r0.3 = $r0.6
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB38_13:                               ## %if.else.13
	c0	cmpgt $b0.0 = $r0.9, -1
;;
	c0	brf $b0.0, LBB38_14
;;
## BB#28:                               ## %if.else.30
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	brf $b0.0, LBB38_29
;;
## BB#37:                               ## %if.then.40
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
	c0	br $b0.0, LBB38_10
;;
## BB#9:                                ## %if.end.12.thread
	c0	or $r0.6 = $r0.6, 536870912
	c0	goto LBB38_11
;;
LBB38_14:                               ## %if.then.15
	c0	cmpne $b0.0 = $r0.8, 255
;;
	c0	br $b0.0, LBB38_23
;;
## BB#15:                               ## %if.then.17
	c0	cmpeq $b0.0 = $r0.6, 0
;;
	c0	br $b0.0, LBB38_22
;;
## BB#16:                               ## %if.then.19
	c0	and $r0.6 = $r0.4, 4194303
	c0	and $r0.2 = $r0.3, 2143289344
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.5 = $r0.3, 4194303
;;
	c0	cmpne $b0.0 = $r0.6, 0
	c0	cmpeq $b0.1 = $r0.7, 2139095040
	c0	cmpeq $b0.2 = $r0.2, 2139095040
	c0	cmpne $b0.3 = $r0.5, 0
;;
	c0	mfb $r0.6 = $b0.1
	c0	mfb $r0.7 = $b0.2
	c0	mfb $r0.8 = $b0.0
	c0	mfb $r0.9 = $b0.3
;;
	c0	and $r0.6 = $r0.6, $r0.8
	c0	and $r0.7 = $r0.7, $r0.9
;;
	c0	mtb $b0.0 = $r0.6
	c0	mtb $b0.1 = $r0.7
;;
	c0	br $b0.1, LBB38_18
;;
## BB#17:                               ## %if.then.19
	c0	mfb $r0.6 = $b0.0
;;
	c0	cmpne $b0.1 = $r0.6, 1
;;
	c0	br $b0.1, LBB38_19
;;
LBB38_18:                               ## %if.then.i.115
	c0	mov $r0.6 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.6]
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.6] = $r0.7
;;
LBB38_19:                               ## %if.end.i.116
	c0	or $r0.6 = $r0.4, 4194304
	c0	brf $b0.0, LBB38_21
;;
## BB#20:
.return ret($r0.3:u32)
	c0	mov $r0.3 = $r0.6
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB38_29:                               ## %if.else.30
	c0	cmpne $b0.0 = $r0.2, 255
;;
	c0	br $b0.0, LBB38_38
;;
## BB#30:                               ## %if.then.32
	c0	or $r0.2 = $r0.6, $r0.7
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB38_42
;;
## BB#31:                               ## %if.then.35
	c0	and $r0.6 = $r0.4, 4194303
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.2 = $r0.3, 2143289344
	c0	and $r0.5 = $r0.3, 4194303
;;
	c0	cmpeq $b0.0 = $r0.2, 2139095040
	c0	cmpeq $b0.1 = $r0.7, 2139095040
	c0	cmpne $b0.2 = $r0.6, 0
	c0	cmpne $b0.3 = $r0.5, 0
;;
	c0	mfb $r0.6 = $b0.0
	c0	mfb $r0.7 = $b0.1
	c0	mfb $r0.8 = $b0.2
	c0	mfb $r0.9 = $b0.3
;;
	c0	and $r0.7 = $r0.7, $r0.8
	c0	and $r0.6 = $r0.6, $r0.9
;;
	c0	mtb $b0.0 = $r0.7
	c0	mtb $b0.1 = $r0.6
;;
	c0	br $b0.1, LBB38_33
;;
## BB#32:                               ## %if.then.35
	c0	mfb $r0.6 = $b0.0
;;
	c0	cmpne $b0.1 = $r0.6, 1
;;
	c0	br $b0.1, LBB38_34
;;
LBB38_33:                               ## %if.then.i
	c0	mov $r0.6 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.6]
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.6] = $r0.7
;;
LBB38_34:                               ## %if.end.i
	c0	or $r0.6 = $r0.4, 4194304
	c0	brf $b0.0, LBB38_36
;;
## BB#35:
.return ret($r0.3:u32)
	c0	mov $r0.3 = $r0.6
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB38_10:                               ## %if.end.12
	c0	add $r0.9 = $r0.9, -1
;;
	c0	cmpeq $b0.0 = $r0.9, 0
;;
	c0	br $b0.0, LBB38_40
;;
LBB38_11:                               ## %if.else.i.126
	c0	cmpgt $b0.0 = $r0.9, 31
;;
	c0	br $b0.0, LBB38_39
;;
## BB#12:                               ## %if.then.2.i.133
	c0	mov $r0.3 = 0
;;
	c0	sub $r0.3 = $r0.3, $r0.9
;;
	c0	and $r0.3 = $r0.3, 31
;;
	c0	shl $r0.3 = $r0.6, $r0.3
	c0	shru $r0.4 = $r0.6, $r0.9
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
	c0	mfb $r0.3 = $b0.0
;;
	c0	or $r0.6 = $r0.3, $r0.4
	c0	goto LBB38_40
;;
LBB38_39:                               ## %if.else.4.i.136
	c0	cmpne $b0.0 = $r0.6, 0
;;
	c0	mfb $r0.6 = $b0.0
	c0	goto LBB38_40
;;
LBB38_36:                               ## %cond.false.i.157
	c0	or $r0.3 = $r0.3, 4194304
	c0	cmpeq $b0.0 = $r0.5, 0
	c0	and $r0.4 = $r0.4, 2147483647
	c0	cmpne $b0.1 = $r0.2, 2139095040
;;
	c0	cmpgtu $b0.2 = $r0.4, 2139095040
	c0	slct $r0.2 = $b0.0, $r0.6, $r0.3
;;
	c0	slct $r0.2 = $b0.1, $r0.6, $r0.2
;;
.return ret($r0.3:u32)
	c0	slct $r0.3 = $b0.2, $r0.2, $r0.3
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB38_23:                               ## %if.end.23
	c0	cmpeq $b0.0 = $r0.2, 0
	c0	or $r0.2 = $r0.7, 536870912
;;
	c0	mfb $r0.3 = $b0.0
	c0	slct $r0.7 = $b0.0, $r0.7, $r0.2
;;
	c0	add $r0.3 = $r0.9, $r0.3
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
	c0	br $b0.0, LBB38_24
;;
## BB#25:                               ## %if.else.i
	c0	cmplt $b0.0 = $r0.3, -31
;;
	c0	br $b0.0, LBB38_27
;;
## BB#26:                               ## %if.then.2.i
	c0	and $r0.4 = $r0.3, 31
	c0	mov $r0.9 = 0
	c0	mov $r0.2 = $r0.8
;;
	c0	shl $r0.4 = $r0.7, $r0.4
	c0	sub $r0.3 = $r0.9, $r0.3
;;
	c0	cmpne $b0.0 = $r0.4, 0
	c0	shru $r0.3 = $r0.7, $r0.3
;;
	c0	mfb $r0.4 = $b0.0
;;
	c0	or $r0.7 = $r0.4, $r0.3
	c0	goto LBB38_40
;;
LBB38_38:                               ## %if.end.42
	c0	or $r0.3 = $r0.7, 1073741824
;;
	c0	add $r0.6 = $r0.3, $r0.6
	c0	goto LBB38_41
;;
LBB38_22:                               ## %if.end.21
	c0	mov $r0.2 = 31
;;
	c0	shl $r0.2 = $r0.5, $r0.2
;;
.return ret($r0.3:u32)
	c0	or $r0.3 = $r0.2, 2139095040
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB38_24:
	c0	mov $r0.2 = $r0.8
	c0	goto LBB38_40
;;
LBB38_21:                               ## %cond.false.i.120
	c0	or $r0.3 = $r0.3, 4194304
	c0	cmpeq $b0.0 = $r0.5, 0
	c0	and $r0.4 = $r0.4, 2147483647
	c0	cmpne $b0.1 = $r0.2, 2139095040
;;
	c0	slct $r0.2 = $b0.0, $r0.6, $r0.3
	c0	cmpgtu $b0.0 = $r0.4, 2139095040
;;
	c0	slct $r0.2 = $b0.1, $r0.6, $r0.2
;;
.return ret($r0.3:u32)
	c0	slct $r0.3 = $b0.0, $r0.2, $r0.3
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB38_27:                               ## %if.else.4.i
	c0	cmpne $b0.0 = $r0.7, 0
	c0	mov $r0.2 = $r0.8
;;
	c0	mfb $r0.7 = $b0.0
;;
LBB38_40:                               ## %if.end.46
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
	c0	slct $r0.6 = $b0.0, $r0.3, $r0.4
;;
	c0	slct $r0.3 = $b0.1, $r0.7, 0
;;
	c0	add $r0.2 = $r0.3, $r0.2
;;
LBB38_41:                               ## %roundAndPack
	c0	mov $r0.4 = $r0.2
	c0	mov $r0.3 = $r0.5
	c0	mov $r0.5 = $r0.6
;;
.call roundAndPackFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = roundAndPackFloat32
;;
LBB38_42:                               ## %cleanup
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
	c0	shl $r0.2 = $r0.4, $r0.6
	c0	shl $r0.10 = $r0.3, $r0.6
;;
	c0	sub $r0.9 = $r0.8, $r0.7
	c0	and $r0.6 = $r0.2, 1073741696
	c0	and $r0.2 = $r0.10, 1073741696
;;
	c0	cmpgt $b0.0 = $r0.9, 0
;;
	c0	brf $b0.0, LBB39_1
;;
## BB#25:                               ## %aExpBigger
	c0	cmpne $b0.0 = $r0.8, 255
;;
	c0	br $b0.0, LBB39_27
;;
## BB#26:                               ## %if.then.45
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	brf $b0.0, LBB39_17
;;
	c0	goto LBB39_36
;;
LBB39_1:                                ## %if.end
	c0	cmplt $b0.0 = $r0.9, 0
;;
	c0	br $b0.0, LBB39_15
;;
## BB#2:                                ## %if.end.7
	c0	cmpeq $b0.0 = $r0.8, 0
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
	c0	br $b0.0, LBB39_29
;;
## BB#28:                               ## %if.end.56.thread
	c0	or $r0.6 = $r0.6, 1073741824
	c0	goto LBB39_30
;;
LBB39_15:                               ## %bExpBigger
	c0	cmpne $b0.0 = $r0.7, 255
;;
	c0	br $b0.0, LBB39_19
;;
## BB#16:                               ## %if.then.27
	c0	cmpeq $b0.0 = $r0.6, 0
;;
	c0	br $b0.0, LBB39_18
;;
LBB39_17:                               ## %if.then.29
	c0	and $r0.2 = $r0.4, 4194303
	c0	and $r0.5 = $r0.3, 2143289344
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.6 = $r0.3, 4194303
;;
	c0	cmpeq $b0.0 = $r0.5, 2139095040
	c0	cmpne $b0.1 = $r0.6, 0
	c0	cmpne $b0.2 = $r0.2, 0
	c0	cmpeq $b0.3 = $r0.7, 2139095040
;;
	c0	mfb $r0.2 = $b0.2
	c0	mfb $r0.7 = $b0.3
	c0	mfb $r0.8 = $b0.0
	c0	mfb $r0.9 = $b0.1
;;
	c0	and $r0.2 = $r0.7, $r0.2
	c0	and $r0.7 = $r0.8, $r0.9
;;
	c0	mtb $b0.0 = $r0.2
	c0	mtb $b0.1 = $r0.7
;;
	c0	brf $b0.1, LBB39_6
;;
	c0	goto LBB39_7
;;
LBB39_3:                                ## %if.end.7
	c0	cmpne $b0.0 = $r0.8, 255
;;
	c0	br $b0.0, LBB39_12
;;
## BB#4:                                ## %if.then.9
	c0	or $r0.2 = $r0.6, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB39_10
;;
## BB#5:                                ## %if.then.10
	c0	and $r0.2 = $r0.4, 4194303
	c0	and $r0.5 = $r0.3, 2143289344
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.6 = $r0.3, 4194303
;;
	c0	cmpeq $b0.0 = $r0.5, 2139095040
	c0	cmpeq $b0.1 = $r0.7, 2139095040
	c0	cmpne $b0.2 = $r0.2, 0
	c0	cmpne $b0.3 = $r0.6, 0
;;
	c0	mfb $r0.2 = $b0.0
	c0	mfb $r0.7 = $b0.1
	c0	mfb $r0.8 = $b0.2
	c0	mfb $r0.9 = $b0.3
;;
	c0	and $r0.7 = $r0.7, $r0.8
	c0	and $r0.2 = $r0.2, $r0.9
;;
	c0	mtb $b0.0 = $r0.7
	c0	mtb $b0.1 = $r0.2
;;
	c0	br $b0.1, LBB39_7
;;
LBB39_6:                                ## %if.then.10
	c0	mfb $r0.2 = $b0.0
;;
	c0	cmpne $b0.1 = $r0.2, 1
;;
	c0	br $b0.1, LBB39_8
;;
LBB39_7:                                ## %if.then.i.157
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.2]
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
	c0	or $r0.3 = $r0.3, 4194304
	c0	cmpeq $b0.0 = $r0.6, 0
	c0	and $r0.4 = $r0.4, 2147483647
	c0	cmpne $b0.1 = $r0.5, 2139095040
;;
	c0	cmpgtu $b0.2 = $r0.4, 2139095040
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
	c0	br $b0.0, LBB39_34
;;
## BB#13:                               ## %if.end.19
	c0	cmpltu $b0.0 = $r0.2, $r0.6
;;
	c0	br $b0.0, LBB39_24
;;
## BB#14:                               ## %if.end.22
	c0	mov $r0.2 = float_rounding_mode
	c0	mov $r0.3 = 31
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
	c0	cmpeq $b0.0 = $r0.2, 3
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
	c0	br $b0.0, LBB39_33
;;
LBB39_30:                               ## %if.else.i
	c0	cmpgt $b0.0 = $r0.9, 31
;;
	c0	br $b0.0, LBB39_32
;;
## BB#31:                               ## %if.then.2.i
	c0	mov $r0.3 = 0
;;
	c0	sub $r0.3 = $r0.3, $r0.9
;;
	c0	and $r0.3 = $r0.3, 31
;;
	c0	shl $r0.3 = $r0.6, $r0.3
	c0	shru $r0.4 = $r0.6, $r0.9
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
	c0	mfb $r0.3 = $b0.0
;;
	c0	or $r0.6 = $r0.3, $r0.4
	c0	goto LBB39_33
;;
LBB39_32:                               ## %if.else.4.i
	c0	cmpne $b0.0 = $r0.6, 0
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
	c0	mfb $r0.4 = $b0.0
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.3
;;
	c0	add $r0.3 = $r0.9, $r0.4
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
	c0	br $b0.0, LBB39_23
;;
## BB#20:                               ## %if.else.i.106
	c0	cmplt $b0.0 = $r0.3, -31
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
	c0	mfb $r0.10 = $b0.0
;;
	c0	slct $r0.3 = $b0.0, $r0.3, $r0.2
	c0	shl $r0.8 = $r0.10, $r0.8
;;
	c0	shl $r0.4 = $r0.3, $r0.4
	c0	cmpltu $b0.0 = $r0.3, 16777216
	c0	or $r0.10 = $r0.8, 8
;;
	c0	slct $r0.3 = $b0.0, $r0.4, $r0.3
	c0	slct $r0.4 = $b0.0, $r0.10, $r0.8
	c0	add $r0.7 = $r0.7, -1
;;
	c0	shru $r0.3 = $r0.3, $r0.6
;;
	c0	and $r0.3 = $r0.3, 1020
;;
	c0	add $r0.3 = $r0.9, $r0.3
;;
	c0	ldw $r0.3 = 0[$r0.3]
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
	c0	mov $r0.8 = 31
;;
	c0	xor $r0.3 = $r0.4, $r0.2
	c0	shru $r0.6 = $r0.2, $r0.5
	c0	shru $r0.10 = $r0.4, $r0.5
;;
	c0	zxtb $r0.9 = $r0.6
	c0	and $r0.7 = $r0.2, 8388607
	c0	and $r0.5 = $r0.4, 8388607
	c0	shru $r0.3 = $r0.3, $r0.8
	c0	zxtb $r0.6 = $r0.10
;;
	c0	cmpne $b0.0 = $r0.9, 255
;;
	c0	br $b0.0, LBB41_12
;;
## BB#1:                                ## %if.then
	c0	cmpne $b0.0 = $r0.7, 0
;;
	c0	br $b0.0, LBB41_4
;;
## BB#2:                                ## %lor.lhs.false
	c0	cmpeq $b0.0 = $r0.5, 0
;;
	c0	br $b0.0, LBB41_9
;;
## BB#3:                                ## %lor.lhs.false
	c0	cmpne $b0.0 = $r0.6, 255
;;
	c0	br $b0.0, LBB41_9
;;
LBB41_4:                                ## %if.then.8
	c0	and $r0.3 = $r0.4, 4194303
	c0	and $r0.5 = $r0.2, 2143289344
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.6 = $r0.2, 4194303
;;
	c0	cmpne $b0.0 = $r0.3, 0
	c0	cmpeq $b0.1 = $r0.7, 2139095040
	c0	cmpne $b0.2 = $r0.6, 0
	c0	cmpeq $b0.3 = $r0.5, 2139095040
;;
	c0	mfb $r0.3 = $b0.0
	c0	mfb $r0.7 = $b0.1
	c0	mfb $r0.8 = $b0.2
	c0	mfb $r0.9 = $b0.3
;;
	c0	and $r0.3 = $r0.7, $r0.3
	c0	and $r0.7 = $r0.9, $r0.8
;;
	c0	mtb $b0.0 = $r0.3
	c0	mtb $b0.1 = $r0.7
;;
	c0	br $b0.1, LBB41_6
;;
## BB#5:                                ## %if.then.8
	c0	mfb $r0.3 = $b0.0
;;
	c0	cmpne $b0.1 = $r0.3, 1
;;
	c0	br $b0.1, LBB41_7
;;
LBB41_6:                                ## %if.then.i.120
	c0	mov $r0.3 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.3]
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.3] = $r0.7
;;
LBB41_7:                                ## %if.end.i.121
	c0	or $r0.3 = $r0.4, 4194304
	c0	br $b0.0, LBB41_30
;;
## BB#8:                                ## %cond.false.i.125
	c0	or $r0.2 = $r0.2, 4194304
	c0	cmpeq $b0.0 = $r0.6, 0
	c0	and $r0.4 = $r0.4, 2147483647
	c0	cmpne $b0.1 = $r0.5, 2139095040
;;
	c0	slct $r0.5 = $b0.0, $r0.3, $r0.2
	c0	cmpgtu $b0.0 = $r0.4, 2139095040
;;
	c0	slct $r0.3 = $b0.1, $r0.3, $r0.5
;;
.return ret($r0.3:u32)
	c0	slct $r0.3 = $b0.0, $r0.3, $r0.2
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB41_12:                               ## %if.end.14
	c0	cmpne $b0.0 = $r0.6, 255
;;
	c0	br $b0.0, LBB41_21
;;
## BB#13:                               ## %if.then.16
	c0	cmpeq $b0.0 = $r0.5, 0
;;
	c0	br $b0.0, LBB41_19
;;
## BB#14:                               ## %if.then.18
	c0	and $r0.3 = $r0.4, 4194303
	c0	and $r0.5 = $r0.2, 2143289344
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.6 = $r0.2, 4194303
;;
	c0	cmpeq $b0.0 = $r0.5, 2139095040
	c0	cmpne $b0.1 = $r0.6, 0
	c0	cmpne $b0.2 = $r0.3, 0
	c0	cmpeq $b0.3 = $r0.7, 2139095040
;;
	c0	mfb $r0.3 = $b0.2
	c0	mfb $r0.7 = $b0.3
	c0	mfb $r0.8 = $b0.0
	c0	mfb $r0.9 = $b0.1
;;
	c0	and $r0.3 = $r0.7, $r0.3
	c0	and $r0.7 = $r0.8, $r0.9
;;
	c0	mtb $b0.0 = $r0.3
	c0	mtb $b0.1 = $r0.7
;;
	c0	br $b0.1, LBB41_16
;;
## BB#15:                               ## %if.then.18
	c0	mfb $r0.3 = $b0.0
;;
	c0	cmpne $b0.1 = $r0.3, 1
;;
	c0	br $b0.1, LBB41_17
;;
LBB41_16:                               ## %if.then.i
	c0	mov $r0.3 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.3]
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.3] = $r0.7
;;
LBB41_17:                               ## %if.end.i
	c0	or $r0.3 = $r0.4, 4194304
	c0	br $b0.0, LBB41_30
;;
## BB#18:                               ## %cond.false.i
	c0	or $r0.2 = $r0.2, 4194304
	c0	cmpeq $b0.0 = $r0.6, 0
	c0	and $r0.4 = $r0.4, 2147483647
	c0	cmpne $b0.1 = $r0.5, 2139095040
;;
	c0	cmpgtu $b0.2 = $r0.4, 2139095040
	c0	slct $r0.4 = $b0.0, $r0.3, $r0.2
;;
	c0	slct $r0.3 = $b0.1, $r0.3, $r0.4
;;
.return ret($r0.3:u32)
	c0	slct $r0.3 = $b0.2, $r0.3, $r0.2
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB41_21:                               ## %if.end.26
	c0	cmpne $b0.0 = $r0.9, 0
;;
	c0	br $b0.0, LBB41_25
;;
## BB#22:                               ## %if.then.28
	c0	cmpne $b0.0 = $r0.7, 0
;;
	c0	brf $b0.0, LBB41_23
;;
## BB#24:                               ## %if.end.32
	c0	mov $r0.9 = 16
	c0	cmpltu $b0.0 = $r0.7, 65536
	c0	mov $r0.10 = 8
	c0	mov $r0.11 = 22
	c0	mov $r0.12 = 4
	c0	mov $r0.13 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	shl $r0.2 = $r0.2, $r0.9
;;
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.7
;;
	c0	cmpltu $b0.1 = $r0.2, 16777216
	c0	shl $r0.9 = $r0.2, $r0.10
;;
	c0	slct $r0.2 = $b0.1, $r0.9, $r0.2
	c0	mfb $r0.9 = $b0.0
;;
	c0	shru $r0.2 = $r0.2, $r0.11
	c0	shl $r0.9 = $r0.9, $r0.12
;;
	c0	and $r0.2 = $r0.2, 1020
	c0	or $r0.10 = $r0.9, 8
;;
	c0	add $r0.2 = $r0.13, $r0.2
	c0	slct $r0.9 = $b0.1, $r0.10, $r0.9
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
	c0	add $r0.2 = $r0.2, $r0.9
	c0	mov $r0.9 = 9
;;
	c0	add $r0.10 = $r0.2, -8
	c0	sub $r0.9 = $r0.9, $r0.2
;;
	c0	shl $r0.7 = $r0.7, $r0.10
;;
LBB41_25:                               ## %if.end.33
	c0	cmpne $b0.0 = $r0.6, 0
;;
	c0	br $b0.0, LBB41_29
;;
## BB#26:                               ## %if.then.35
	c0	cmpne $b0.0 = $r0.5, 0
;;
	c0	brf $b0.0, LBB41_27
;;
## BB#28:                               ## %if.end.39
	c0	mov $r0.2 = 16
	c0	cmpltu $b0.0 = $r0.5, 65536
	c0	mov $r0.6 = 8
	c0	mov $r0.8 = 22
	c0	mov $r0.10 = 4
	c0	mov $r0.11 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	shl $r0.2 = $r0.4, $r0.2
;;
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.5
;;
	c0	cmpltu $b0.1 = $r0.2, 16777216
	c0	shl $r0.4 = $r0.2, $r0.6
;;
	c0	slct $r0.2 = $b0.1, $r0.4, $r0.2
	c0	mfb $r0.4 = $b0.0
;;
	c0	shru $r0.2 = $r0.2, $r0.8
	c0	shl $r0.4 = $r0.4, $r0.10
;;
	c0	and $r0.2 = $r0.2, 1020
	c0	or $r0.6 = $r0.4, 8
;;
	c0	add $r0.2 = $r0.11, $r0.2
	c0	slct $r0.4 = $b0.1, $r0.6, $r0.4
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
	c0	add $r0.2 = $r0.2, $r0.4
	c0	mov $r0.4 = 9
;;
	c0	add $r0.8 = $r0.2, -8
	c0	sub $r0.6 = $r0.4, $r0.2
;;
	c0	shl $r0.5 = $r0.5, $r0.8
;;
LBB41_29:                               ## %if.end.40
	c0	mov $r0.2 = 8
	c0	mov $r0.4 = 9
	c0	mov $r0.8 = 7
	c0	mov $r0.10 = 16
	c0	mov $r0.11 = 30
	c0	mov $r0.12 = 1
;;
	c0	shru $r0.13 = $r0.5, $r0.2
	c0	shru $r0.4 = $r0.7, $r0.4
	c0	shl $r0.7 = $r0.7, $r0.8
	c0	shl $r0.2 = $r0.5, $r0.2
;;
	c0	and $r0.5 = $r0.13, 32767
	c0	and $r0.4 = $r0.4, 49151
	c0	zxth $r0.2 = $r0.2
	c0	zxth $r0.7 = $r0.7
;;
	c0	or $r0.4 = $r0.4, 16384
	c0	or $r0.5 = $r0.5, 32768
	c0	mpyhs $r0.8 = $r0.2, $r0.7
	c0	mpylu $r0.13 = $r0.2, $r0.7
;;
	c0	mpylu $r0.14 = $r0.5, $r0.7
	c0	mpyhs $r0.7 = $r0.5, $r0.7
	c0	mpyhs $r0.15 = $r0.2, $r0.4
	c0	mpylu $r0.2 = $r0.2, $r0.4
	c0	mpyhs $r0.16 = $r0.5, $r0.4
	c0	mpylu $r0.4 = $r0.5, $r0.4
	c0	add $r0.5 = $r0.13, $r0.8
;;
	c0	add $r0.7 = $r0.14, $r0.7
	c0	add $r0.2 = $r0.2, $r0.15
	c0	add $r0.4 = $r0.4, $r0.16
	c0	add $r0.6 = $r0.6, $r0.9
;;
	c0	add $r0.2 = $r0.7, $r0.2
;;
	c0	cmpltu $r0.7 = $r0.2, $r0.7
	c0	shl $r0.8 = $r0.2, $r0.10
	c0	shru $r0.2 = $r0.2, $r0.10
;;
	c0	shl $r0.7 = $r0.7, $r0.10
	c0	add $r0.5 = $r0.8, $r0.5
;;
	c0	or $r0.2 = $r0.7, $r0.2
	c0	cmpne $b0.0 = $r0.5, 0
	c0	cmpltu $r0.5 = $r0.5, $r0.8
;;
	c0	add $r0.2 = $r0.2, $r0.4
	c0	mfb $r0.4 = $b0.0
;;
	c0	add $r0.2 = $r0.2, $r0.5
;;
	c0	or $r0.4 = $r0.2, $r0.4
;;
	c0	shl $r0.5 = $r0.4, $r0.12
	c0	shru $r0.2 = $r0.2, $r0.11
;;
	c0	and $r0.2 = $r0.2, 1
	c0	cmpgt $b0.0 = $r0.5, -1
;;
	c0	or $r0.2 = $r0.2, -128
	c0	slct $r0.5 = $b0.0, $r0.5, $r0.4
;;
	c0	add $r0.4 = $r0.6, $r0.2
;;
.call roundAndPackFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = roundAndPackFloat32
;;
LBB41_30:                               ## %cleanup
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB41_9:                                ## %if.end
	c0	or $r0.2 = $r0.6, $r0.5
	c0	goto LBB41_10
;;
LBB41_19:                               ## %if.end.20
	c0	or $r0.2 = $r0.9, $r0.7
;;
LBB41_10:                               ## %if.end
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	brf $b0.0, LBB41_11
;;
## BB#20:                               ## %if.end.12
	c0	shl $r0.2 = $r0.3, $r0.8
;;
.return ret($r0.3:u32)
	c0	or $r0.3 = $r0.2, 2139095040
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB41_11:                               ## %if.then.11
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
	c0	mov $r0.3 = 2147483647
;;
	c0	or $r0.4 = $r0.4, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB41_23:                               ## %if.then.30
.return ret($r0.3:u32)
	c0	shl $r0.3 = $r0.3, $r0.8
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB41_27:                               ## %if.then.37
.return ret($r0.3:u32)
	c0	shl $r0.3 = $r0.3, $r0.8
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
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB42_1
;;
## BB#2:                                ## %if.then
	c0	cmpeq $b0.1 = $r0.2, 1
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
	c0	br $b0.1, LBB42_19
;;
## BB#9:                                ## %if.then.21
	c0	cmpgt $b0.1 = $r0.4, 253
;;
	c0	br $b0.1, LBB42_12
;;
## BB#10:                               ## %lor.lhs.false
	c0	add $r0.7 = $r0.2, $r0.5
	c0	cmpne $b0.1 = $r0.4, 253
;;
	c0	br $b0.1, LBB42_13
;;
## BB#11:                               ## %lor.lhs.false
	c0	cmpgt $b0.1 = $r0.7, -1
;;
	c0	br $b0.1, LBB42_13
;;
LBB42_12:                               ## %if.then.28
	c0	mov $r0.4 = 31
	c0	mov $r0.5 = float_exception_flags
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	ldw $r0.2 = 0[$r0.5]
	c0	shl $r0.3 = $r0.3, $r0.4
	c0	mfb $r0.4 = $b0.0
;;
	c0	or $r0.2 = $r0.2, 9
	c0	or $r0.3 = $r0.3, 2139095040
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.5] = $r0.2
	c0	sub $r0.3 = $r0.3, $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB42_13:                               ## %if.end.31
	c0	cmpgt $b0.1 = $r0.4, -1
;;
	c0	br $b0.1, LBB42_19
;;
## BB#14:                               ## %if.else.i
	c0	mov $r0.6 = float_detect_tininess
	c0	cmplt $b0.1 = $r0.4, -1
	c0	cmpgt $b0.2 = $r0.7, -1
;;
	c0	ldw $r0.6 = 0[$r0.6]
	c0	mfb $r0.7 = $b0.1
	c0	mfb $r0.8 = $b0.2
;;
	c0	cmpeq $b0.1 = $r0.6, 1
;;
	c0	mfb $r0.6 = $b0.1
	c0	cmplt $b0.2 = $r0.4, -31
;;
	c0	or $r0.6 = $r0.7, $r0.6
;;
	c0	or $r0.6 = $r0.8, $r0.6
;;
	c0	mtb $b0.1 = $r0.6
	c0	br $b0.2, LBB42_16
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
	c0	mfb $r0.5 = $b0.2
;;
	c0	or $r0.5 = $r0.5, $r0.4
	c0	goto LBB42_17
;;
LBB42_16:                               ## %if.else.4.i
	c0	cmpne $b0.2 = $r0.5, 0
;;
	c0	mfb $r0.5 = $b0.2
;;
LBB42_17:                               ## %shift32RightJamming.exit
	c0	and $r0.6 = $r0.5, 127
	c0	mfb $r0.7 = $b0.1
	c0	mov $r0.4 = 0
;;
	c0	cmpne $b0.1 = $r0.6, 0
;;
	c0	mfb $r0.8 = $b0.1
;;
	c0	and $r0.7 = $r0.7, $r0.8
;;
	c0	and $r0.7 = $r0.7, 1
;;
	c0	cmpeq $b0.1 = $r0.7, 0
;;
	c0	br $b0.1, LBB42_19
;;
## BB#18:                               ## %if.then.48
	c0	mov $r0.7 = float_exception_flags
;;
	c0	ldw $r0.8 = 0[$r0.7]
;;
	c0	or $r0.8 = $r0.8, 4
;;
	c0	stw 0[$r0.7] = $r0.8
;;
LBB42_19:                               ## %if.end.51
	c0	cmpeq $b0.1 = $r0.6, 0
;;
	c0	br $b0.1, LBB42_21
;;
## BB#20:                               ## %if.then.53
	c0	mov $r0.7 = float_exception_flags
;;
	c0	ldw $r0.8 = 0[$r0.7]
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
	c0	shru $r0.8 = $r0.4, $r0.5
;;
	c0	zxtb $r0.10 = $r0.6
	c0	and $r0.6 = $r0.2, 8388607
	c0	and $r0.5 = $r0.4, 8388607
	c0	shru $r0.3 = $r0.3, $r0.7
	c0	zxtb $r0.8 = $r0.8
;;
	c0	cmpne $b0.0 = $r0.10, 255
;;
	c0	br $b0.0, LBB43_13
;;
## BB#1:                                ## %if.then
	c0	cmpeq $b0.0 = $r0.6, 0
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
	c0	cmpeq $b0.1 = $r0.7, 2139095040
	c0	cmpne $b0.2 = $r0.6, 0
	c0	cmpeq $b0.3 = $r0.5, 2139095040
;;
	c0	mfb $r0.3 = $b0.0
	c0	mfb $r0.7 = $b0.1
	c0	mfb $r0.8 = $b0.2
	c0	mfb $r0.9 = $b0.3
;;
	c0	and $r0.3 = $r0.7, $r0.3
	c0	and $r0.7 = $r0.9, $r0.8
;;
LBB43_3:                                ## %if.then.6
	c0	mtb $b0.0 = $r0.3
	c0	mtb $b0.1 = $r0.7
;;
	c0	br $b0.1, LBB43_5
;;
## BB#4:                                ## %if.then.6
	c0	mfb $r0.3 = $b0.0
;;
	c0	cmpne $b0.1 = $r0.3, 1
;;
	c0	br $b0.1, LBB43_6
;;
LBB43_5:                                ## %if.then.i.169
	c0	mov $r0.3 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.3]
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.3] = $r0.7
;;
LBB43_6:                                ## %if.end.i.170
	c0	or $r0.3 = $r0.4, 4194304
	c0	br $b0.0, LBB43_47
;;
## BB#7:                                ## %cond.false.i.174
	c0	or $r0.2 = $r0.2, 4194304
	c0	cmpeq $b0.0 = $r0.6, 0
	c0	and $r0.4 = $r0.4, 2147483647
	c0	cmpne $b0.1 = $r0.5, 2139095040
;;
	c0	slct $r0.5 = $b0.0, $r0.3, $r0.2
	c0	cmpgtu $b0.0 = $r0.4, 2139095040
;;
	c0	slct $r0.3 = $b0.1, $r0.3, $r0.5
;;
.return ret($r0.3:u32)
	c0	slct $r0.3 = $b0.0, $r0.3, $r0.2
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB43_13:                               ## %if.end.16
	c0	cmpeq $b0.0 = $r0.8, 0
;;
	c0	brf $b0.0, LBB43_14
;;
## BB#22:                               ## %if.then.26
	c0	cmpne $b0.0 = $r0.5, 0
;;
	c0	brf $b0.0, LBB43_23
;;
## BB#26:                               ## %if.end.33
	c0	mov $r0.8 = 16
	c0	cmpltu $b0.0 = $r0.5, 65536
	c0	mov $r0.9 = 8
	c0	mov $r0.11 = 22
	c0	mov $r0.12 = 4
	c0	mov $r0.13 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	shl $r0.4 = $r0.4, $r0.8
;;
	c0	slct $r0.4 = $b0.0, $r0.4, $r0.5
;;
	c0	cmpltu $b0.1 = $r0.4, 16777216
	c0	shl $r0.8 = $r0.4, $r0.9
;;
	c0	slct $r0.4 = $b0.1, $r0.8, $r0.4
	c0	mfb $r0.8 = $b0.0
;;
	c0	shru $r0.4 = $r0.4, $r0.11
	c0	shl $r0.8 = $r0.8, $r0.12
;;
	c0	and $r0.4 = $r0.4, 1020
	c0	or $r0.9 = $r0.8, 8
;;
	c0	add $r0.4 = $r0.13, $r0.4
	c0	slct $r0.8 = $b0.1, $r0.9, $r0.8
;;
	c0	ldw $r0.4 = 0[$r0.4]
;;
	c0	add $r0.4 = $r0.4, $r0.8
	c0	mov $r0.8 = 9
;;
	c0	add $r0.9 = $r0.4, -8
	c0	sub $r0.8 = $r0.8, $r0.4
;;
	c0	shl $r0.5 = $r0.5, $r0.9
	c0	goto LBB43_27
;;
LBB43_14:                               ## %if.end.16
	c0	cmpne $b0.0 = $r0.8, 255
;;
	c0	br $b0.0, LBB43_27
;;
## BB#15:                               ## %if.then.18
	c0	cmpeq $b0.0 = $r0.5, 0
;;
	c0	br $b0.0, LBB43_21
;;
## BB#16:                               ## %if.then.20
	c0	and $r0.3 = $r0.4, 4194303
	c0	and $r0.5 = $r0.2, 2143289344
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.6 = $r0.2, 4194303
;;
	c0	cmpne $b0.0 = $r0.3, 0
	c0	cmpeq $b0.1 = $r0.5, 2139095040
	c0	cmpeq $b0.2 = $r0.7, 2139095040
	c0	cmpne $b0.3 = $r0.6, 0
;;
	c0	mfb $r0.3 = $b0.2
	c0	mfb $r0.7 = $b0.1
	c0	mfb $r0.8 = $b0.0
	c0	mfb $r0.9 = $b0.3
;;
	c0	and $r0.3 = $r0.3, $r0.8
	c0	and $r0.7 = $r0.7, $r0.9
;;
	c0	mtb $b0.0 = $r0.3
	c0	mtb $b0.1 = $r0.7
;;
	c0	br $b0.1, LBB43_18
;;
## BB#17:                               ## %if.then.20
	c0	mfb $r0.3 = $b0.0
;;
	c0	cmpne $b0.1 = $r0.3, 1
;;
	c0	br $b0.1, LBB43_19
;;
LBB43_18:                               ## %if.then.i
	c0	mov $r0.3 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.3]
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.3] = $r0.7
;;
LBB43_19:                               ## %if.end.i.128
	c0	or $r0.3 = $r0.4, 4194304
	c0	br $b0.0, LBB43_47
;;
## BB#20:                               ## %cond.false.i.129
	c0	or $r0.2 = $r0.2, 4194304
	c0	cmpeq $b0.0 = $r0.6, 0
	c0	and $r0.4 = $r0.4, 2147483647
	c0	cmpne $b0.1 = $r0.5, 2139095040
;;
	c0	cmpgtu $b0.2 = $r0.4, 2139095040
	c0	slct $r0.4 = $b0.0, $r0.3, $r0.2
;;
	c0	slct $r0.3 = $b0.1, $r0.3, $r0.4
;;
.return ret($r0.3:u32)
	c0	slct $r0.3 = $b0.2, $r0.3, $r0.2
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB43_27:                               ## %if.end.34
	c0	cmpne $b0.0 = $r0.10, 0
;;
	c0	br $b0.0, LBB43_31
;;
## BB#28:                               ## %if.then.36
	c0	cmpne $b0.0 = $r0.6, 0
;;
	c0	brf $b0.0, LBB43_29
;;
## BB#30:                               ## %if.end.40
	c0	mov $r0.4 = 16
	c0	cmpltu $b0.0 = $r0.6, 65536
	c0	mov $r0.7 = 8
	c0	mov $r0.9 = 22
	c0	mov $r0.10 = 4
	c0	mov $r0.11 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	shl $r0.2 = $r0.2, $r0.4
;;
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.6
;;
	c0	cmpltu $b0.1 = $r0.2, 16777216
	c0	shl $r0.4 = $r0.2, $r0.7
;;
	c0	slct $r0.2 = $b0.1, $r0.4, $r0.2
	c0	mfb $r0.4 = $b0.0
;;
	c0	shru $r0.2 = $r0.2, $r0.9
	c0	shl $r0.4 = $r0.4, $r0.10
;;
	c0	and $r0.2 = $r0.2, 1020
	c0	or $r0.7 = $r0.4, 8
;;
	c0	add $r0.2 = $r0.11, $r0.2
	c0	slct $r0.4 = $b0.1, $r0.7, $r0.4
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
	c0	add $r0.2 = $r0.2, $r0.4
	c0	mov $r0.4 = 9
;;
	c0	add $r0.7 = $r0.2, -8
	c0	sub $r0.10 = $r0.4, $r0.2
;;
	c0	shl $r0.6 = $r0.6, $r0.7
;;
LBB43_31:                               ## %if.end.41
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
	c0	sub $r0.7 = $r0.10, $r0.8
;;
	c0	cmpleu $b0.0 = $r0.2, $r0.6
	c0	cmpgtu $b0.1 = $r0.2, $r0.6
;;
	c0	mfb $r0.6 = $b0.0
	c0	slct $r0.8 = $b0.1, $r0.11, 126
;;
	c0	shru $r0.6 = $r0.4, $r0.6
	c0	add $r0.4 = $r0.7, $r0.8
;;
	c0	cmpleu $b0.0 = $r0.2, $r0.6
;;
	c0	br $b0.0, LBB43_32
;;
## BB#33:                               ## %if.end.i
	c0	mov $r0.7 = 16
;;
	c0	shru $r0.8 = $r0.2, $r0.7
;;
	c0	shl $r0.13 = $r0.8, $r0.7
;;
	c0	cmpleu $b0.0 = $r0.13, $r0.6
;;
	c0	br $b0.0, LBB43_34
;;
## BB#35:                               ## %cond.false.i
	c0	cmplt $r0.10 = $r0.8, $r0.0
	c0	mov $r0.11 = 0
;;
	c0	shru $r0.12 = $r0.6, $r0.10
	c0	mtb $b0.0 = $r0.11
	c0	shru $r0.14 = $r0.8, $r0.10
	c0	mtb $b0.1 = $r0.11
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
	c0	cmpgeu $r0.15 = $r0.6, $r0.8
;;
	c0	addcg $r0.16, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.11, $b0.0 = $r0.11, $r0.14, $b0.0
;;
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.14, $b0.1
	c0	addcg $r0.12, $b0.0 = $r0.16, $r0.16, $b0.0
;;
	c0	addcg $r0.16, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.11, $b0.0 = $r0.11, $r0.14, $b0.0
	c0	mtb $b0.2 = $r0.10
;;
	c0	divs $r0.10, $b0.1 = $r0.11, $r0.14, $b0.1
	c0	addcg $r0.11, $b0.0 = $r0.16, $r0.16, $b0.0
;;
	c0	cmpge $b0.0 = $r0.10, $r0.0
	c0	addcg $r0.10, $b0.1 = $r0.11, $r0.11, $b0.1
;;
	c0	mfb $r0.11 = $b0.0
	c0	orc $r0.10 = $r0.10, $r0.0
;;
	c0	sh1add $r0.10 = $r0.10, $r0.11
;;
	c0	slct $r0.10 = $b0.2, $r0.15, $r0.10
;;
	c0	shl $r0.12 = $r0.10, $r0.7
	c0	goto LBB43_36
;;
LBB43_8:                                ## %if.end
	c0	cmpne $b0.0 = $r0.8, 255
;;
	c0	br $b0.0, LBB43_12
;;
## BB#9:                                ## %if.then.9
	c0	cmpeq $b0.0 = $r0.5, 0
;;
	c0	br $b0.0, LBB43_11
;;
## BB#10:                               ## %if.then.11
	c0	and $r0.3 = $r0.4, 4194303
	c0	and $r0.5 = $r0.2, 2143289344
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.6 = $r0.2, 4194303
;;
	c0	cmpeq $b0.0 = $r0.5, 2139095040
	c0	cmpne $b0.1 = $r0.6, 0
	c0	cmpne $b0.2 = $r0.3, 0
	c0	cmpeq $b0.3 = $r0.7, 2139095040
;;
	c0	mfb $r0.3 = $b0.2
	c0	mfb $r0.7 = $b0.3
	c0	mfb $r0.8 = $b0.0
	c0	mfb $r0.9 = $b0.1
;;
	c0	and $r0.3 = $r0.7, $r0.3
	c0	and $r0.7 = $r0.8, $r0.9
	c0	goto LBB43_3
;;
LBB43_32:
	c0	mov $r0.5 = -1
	c0	goto LBB43_46
;;
LBB43_23:                               ## %if.then.28
	c0	mov $r0.2 = float_exception_flags
	c0	or $r0.5 = $r0.10, $r0.6
;;
	c0	ldw $r0.4 = 0[$r0.2]
	c0	cmpne $b0.0 = $r0.5, 0
;;
	c0	brf $b0.0, LBB43_24
;;
## BB#25:                               ## %if.end.31
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
LBB43_34:
	c0	mov $r0.12 = -65536
;;
LBB43_36:                               ## %cond.end.i
	c0	shru $r0.14 = $r0.12, $r0.7
	c0	and $r0.11 = $r0.9, 65280
	c0	mov $r0.9 = -1
	c0	mov $r0.10 = 0
;;
	c0	mpylu $r0.15 = $r0.14, $r0.8
	c0	mpyhs $r0.16 = $r0.14, $r0.11
	c0	mpylu $r0.17 = $r0.14, $r0.11
;;
	c0	add $r0.16 = $r0.17, $r0.16
	c0	mpyhs $r0.14 = $r0.14, $r0.8
;;
	c0	add $r0.14 = $r0.15, $r0.14
	c0	shl $r0.15 = $r0.16, $r0.7
	c0	shru $r0.16 = $r0.16, $r0.7
;;
	c0	sub $r0.17 = $r0.6, $r0.14
	c0	cmpne $r0.18 = $r0.15, 0
	c0	sub $r0.14 = $r0.10, $r0.15
;;
	c0	sub $r0.15 = $r0.17, $r0.16
	c0	mtb $b0.0 = $r0.18
;;
	c0	slct $r0.16 = $b0.0, $r0.9, 0
;;
	c0	add $r0.15 = $r0.15, $r0.16
;;
	c0	cmpgt $b0.0 = $r0.15, -1
;;
	c0	br $b0.0, LBB43_39
;;
## BB#37:                               ## %while.body.lr.ph.i
	c0	mov $r0.16 = 24
;;
	c0	shl $r0.5 = $r0.5, $r0.16
;;
LBB43_38:                               ## %while.body.i
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
	c0	br $b0.0, LBB43_38
;;
LBB43_39:                               ## %while.end.i
	c0	shl $r0.5 = $r0.15, $r0.7
	c0	shru $r0.14 = $r0.14, $r0.7
;;
	c0	or $r0.5 = $r0.14, $r0.5
;;
	c0	cmpleu $b0.0 = $r0.13, $r0.5
;;
	c0	br $b0.0, LBB43_40
;;
## BB#41:                               ## %cond.false.10.i
	c0	cmplt $r0.13 = $r0.8, $r0.0
	c0	mov $r0.14 = 0
;;
	c0	shru $r0.15 = $r0.5, $r0.13
	c0	mtb $b0.0 = $r0.14
	c0	shru $r0.16 = $r0.8, $r0.13
	c0	mtb $b0.1 = $r0.14
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
	c0	cmpgeu $r0.5 = $r0.5, $r0.8
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
	c0	mtb $b0.2 = $r0.13
	c0	addcg $r0.13, $b0.0 = $r0.17, $r0.17, $b0.0
;;
	c0	cmpge $b0.0 = $r0.14, $r0.0
	c0	addcg $r0.14, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	mfb $r0.13 = $b0.0
	c0	orc $r0.14 = $r0.14, $r0.0
;;
	c0	sh1add $r0.13 = $r0.14, $r0.13
;;
	c0	slct $r0.5 = $b0.2, $r0.5, $r0.13
	c0	goto LBB43_42
;;
LBB43_40:
	c0	mov $r0.5 = 65535
;;
LBB43_42:                               ## %estimateDiv64To32.exit
	c0	or $r0.5 = $r0.5, $r0.12
;;
	c0	and $r0.12 = $r0.5, 63
;;
	c0	cmpgtu $b0.0 = $r0.12, 2
;;
	c0	br $b0.0, LBB43_46
;;
## BB#43:                               ## %if.then.51
	c0	shru $r0.12 = $r0.5, $r0.7
	c0	zxth $r0.13 = $r0.5
;;
	c0	mpyhs $r0.14 = $r0.12, $r0.11
	c0	mpylu $r0.15 = $r0.12, $r0.11
	c0	mpylu $r0.16 = $r0.13, $r0.8
	c0	mpyhs $r0.17 = $r0.13, $r0.8
	c0	mpylu $r0.18 = $r0.13, $r0.11
	c0	mpyhs $r0.11 = $r0.13, $r0.11
;;
	c0	add $r0.13 = $r0.15, $r0.14
	c0	add $r0.14 = $r0.16, $r0.17
	c0	add $r0.11 = $r0.18, $r0.11
	c0	mpylu $r0.15 = $r0.12, $r0.8
;;
	c0	add $r0.14 = $r0.13, $r0.14
;;
	c0	shl $r0.16 = $r0.14, $r0.7
	c0	mpyhs $r0.8 = $r0.12, $r0.8
;;
	c0	add $r0.8 = $r0.15, $r0.8
	c0	cmpltu $r0.12 = $r0.14, $r0.13
	c0	add $r0.11 = $r0.16, $r0.11
;;
	c0	sub $r0.8 = $r0.6, $r0.8
	c0	shru $r0.6 = $r0.14, $r0.7
	c0	shl $r0.7 = $r0.12, $r0.7
	c0	cmpltu $r0.12 = $r0.11, $r0.16
	c0	cmpne $r0.13 = $r0.11, 0
;;
	c0	or $r0.7 = $r0.7, $r0.6
	c0	mtb $b0.0 = $r0.12
	c0	mtb $b0.1 = $r0.13
	c0	sub $r0.6 = $r0.10, $r0.11
;;
	c0	sub $r0.7 = $r0.8, $r0.7
	c0	mfb $r0.8 = $b0.0
	c0	slct $r0.9 = $b0.1, $r0.9, 0
;;
	c0	add $r0.7 = $r0.7, $r0.8
;;
	c0	add $r0.7 = $r0.7, $r0.9
;;
	c0	cmpgt $b0.0 = $r0.7, -1
;;
	c0	br $b0.0, LBB43_45
;;
LBB43_44:                               ## %while.body
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
	c0	br $b0.0, LBB43_44
;;
LBB43_45:                               ## %while.end
	c0	cmpne $b0.0 = $r0.6, 0
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	or $r0.5 = $r0.2, $r0.5
;;
LBB43_46:                               ## %if.end.55
.call roundAndPackFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = roundAndPackFloat32
;;
LBB43_47:                               ## %cleanup
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB43_21:                               ## %if.end.22
.return ret($r0.3:u32)
	c0	shl $r0.3 = $r0.3, $r0.7
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB43_29:                               ## %if.then.38
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
	c0	or $r0.4 = $r0.4, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB43_24:                               ## %if.then.30
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
	c0	shru $r0.2 = $r0.4, $r0.2
;;
	c0	zxtb $r0.7 = $r0.5
	c0	and $r0.6 = $r0.4, 8388607
	c0	and $r0.5 = $r0.3, 8388607
	c0	zxtb $r0.2 = $r0.2
;;
	c0	cmpne $b0.0 = $r0.7, 255
;;
	c0	br $b0.0, LBB44_9
;;
## BB#1:                                ## %if.then
	c0	cmpne $b0.0 = $r0.5, 0
;;
	c0	br $b0.0, LBB44_4
;;
## BB#2:                                ## %lor.lhs.false
	c0	cmpeq $b0.0 = $r0.6, 0
;;
	c0	br $b0.0, LBB44_19
;;
## BB#3:                                ## %lor.lhs.false
	c0	cmpne $b0.0 = $r0.2, 255
;;
	c0	br $b0.0, LBB44_19
;;
LBB44_4:                                ## %if.then.8
	c0	and $r0.6 = $r0.4, 4194303
	c0	and $r0.2 = $r0.3, 2143289344
	c0	and $r0.7 = $r0.4, 2143289344
	c0	and $r0.5 = $r0.3, 4194303
;;
	c0	cmpeq $b0.0 = $r0.2, 2139095040
	c0	cmpeq $b0.1 = $r0.7, 2139095040
	c0	cmpne $b0.2 = $r0.6, 0
	c0	cmpne $b0.3 = $r0.5, 0
;;
	c0	mfb $r0.6 = $b0.0
	c0	mfb $r0.7 = $b0.1
	c0	mfb $r0.8 = $b0.2
	c0	mfb $r0.9 = $b0.3
;;
	c0	and $r0.7 = $r0.7, $r0.8
	c0	and $r0.6 = $r0.6, $r0.9
;;
	c0	mtb $b0.0 = $r0.7
	c0	mtb $b0.1 = $r0.6
;;
	c0	br $b0.1, LBB44_6
;;
## BB#5:                                ## %if.then.8
	c0	mfb $r0.6 = $b0.0
;;
	c0	cmpne $b0.1 = $r0.6, 1
;;
	c0	br $b0.1, LBB44_7
;;
LBB44_6:                                ## %if.then.i.250
	c0	mov $r0.6 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.6]
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.6] = $r0.7
;;
LBB44_7:                                ## %if.end.i.251
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
	c0	brf $b0.0, LBB44_10
;;
## BB#18:                               ## %if.then.19
	c0	cmpne $b0.0 = $r0.6, 0
;;
	c0	brf $b0.0, LBB44_19
;;
## BB#20:                               ## %if.end.22
	c0	mov $r0.2 = 16
	c0	cmpltu $b0.0 = $r0.6, 65536
	c0	mov $r0.8 = 8
	c0	mov $r0.9 = 22
	c0	mov $r0.10 = 4
	c0	mov $r0.11 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	shl $r0.2 = $r0.4, $r0.2
;;
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.6
;;
	c0	cmpltu $b0.1 = $r0.2, 16777216
	c0	shl $r0.4 = $r0.2, $r0.8
;;
	c0	slct $r0.2 = $b0.1, $r0.4, $r0.2
	c0	mfb $r0.4 = $b0.0
;;
	c0	shru $r0.2 = $r0.2, $r0.9
	c0	shl $r0.4 = $r0.4, $r0.10
;;
	c0	and $r0.2 = $r0.2, 1020
	c0	or $r0.8 = $r0.4, 8
;;
	c0	add $r0.2 = $r0.11, $r0.2
	c0	slct $r0.4 = $b0.1, $r0.8, $r0.4
;;
	c0	ldw $r0.2 = 0[$r0.2]
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
	c0	br $b0.0, LBB44_21
;;
## BB#11:                               ## %if.then.12
	c0	cmpeq $b0.0 = $r0.6, 0
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
	c0	cmpeq $b0.1 = $r0.2, 2139095040
	c0	cmpeq $b0.2 = $r0.7, 2139095040
	c0	cmpne $b0.3 = $r0.5, 0
;;
	c0	mfb $r0.6 = $b0.2
	c0	mfb $r0.7 = $b0.1
	c0	mfb $r0.8 = $b0.0
	c0	mfb $r0.9 = $b0.3
;;
	c0	and $r0.6 = $r0.6, $r0.8
	c0	and $r0.7 = $r0.7, $r0.9
;;
	c0	mtb $b0.0 = $r0.6
	c0	mtb $b0.1 = $r0.7
;;
	c0	br $b0.1, LBB44_14
;;
## BB#13:                               ## %if.then.14
	c0	mfb $r0.6 = $b0.0
;;
	c0	cmpne $b0.1 = $r0.6, 1
;;
	c0	br $b0.1, LBB44_15
;;
LBB44_14:                               ## %if.then.i
	c0	mov $r0.6 = float_exception_flags
;;
	c0	ldw $r0.7 = 0[$r0.6]
;;
	c0	or $r0.7 = $r0.7, 16
;;
	c0	stw 0[$r0.6] = $r0.7
;;
LBB44_15:                               ## %if.end.i.233
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
	c0	br $b0.0, LBB44_24
;;
## BB#22:                               ## %if.then.25
	c0	cmpeq $b0.0 = $r0.5, 0
;;
	c0	br $b0.0, LBB44_62
;;
## BB#23:                               ## %if.end.28
	c0	mov $r0.4 = 16
	c0	cmpltu $b0.0 = $r0.5, 65536
	c0	mov $r0.7 = 8
	c0	mov $r0.8 = 22
	c0	mov $r0.9 = 4
	c0	mov $r0.10 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	shl $r0.4 = $r0.3, $r0.4
;;
	c0	slct $r0.4 = $b0.0, $r0.4, $r0.5
;;
	c0	cmpltu $b0.1 = $r0.4, 16777216
	c0	shl $r0.7 = $r0.4, $r0.7
;;
	c0	slct $r0.4 = $b0.1, $r0.7, $r0.4
	c0	mfb $r0.7 = $b0.0
;;
	c0	shru $r0.4 = $r0.4, $r0.8
	c0	shl $r0.7 = $r0.7, $r0.9
;;
	c0	and $r0.4 = $r0.4, 1020
	c0	or $r0.8 = $r0.7, 8
;;
	c0	add $r0.4 = $r0.10, $r0.4
	c0	slct $r0.7 = $b0.1, $r0.8, $r0.7
;;
	c0	ldw $r0.4 = 0[$r0.4]
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
	c0	sub $r0.10 = $r0.7, $r0.2
;;
	c0	shl $r0.7 = $r0.5, $r0.4
	c0	shl $r0.8 = $r0.6, $r0.4
	c0	cmpgt $b0.0 = $r0.10, -1
;;
	c0	or $r0.5 = $r0.8, -2147483648
	c0	or $r0.7 = $r0.7, -2147483648
	c0	brf $b0.0, LBB44_25
;;
## BB#28:                               ## %if.end.37
	c0	cmpgeu $b0.0 = $r0.7, $r0.5
	c0	add $r0.9 = $r0.10, -32
	c0	cmplt $b0.1 = $r0.10, 33
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
	c0	mov $r0.20 = 24
;;
	c0	shru $r0.12 = $r0.5, $r0.10
;;
	c0	cmplt $r0.13 = $r0.12, $r0.0
	c0	mov $r0.14 = 65535
	c0	mov $r0.15 = -1
	c0	and $r0.16 = $r0.8, 65280
	c0	mov $r0.17 = -65536
;;
	c0	mov $r0.19 = $r0.9
	c0	shru $r0.9 = $r0.5, $r0.18
	c0	shl $r0.18 = $r0.6, $r0.20
	c0	shl $r0.20 = $r0.12, $r0.10
;;
	c0	sub $r0.21 = $r0.11, $r0.9
	c0	shru $r0.22 = $r0.12, $r0.13
	c0	mtb $b0.0 = $r0.13
;;
LBB44_31:                               ## %while.body
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB44_35 Depth 2
	c0	cmpleu $b0.1 = $r0.5, $r0.7
	c0	mov $r0.9 = $r0.15
;;
	c0	br $b0.1, LBB44_39
;;
## BB#32:                               ## %if.end.i.153
                                        ##   in Loop: Header=BB44_31 Depth=1
	c0	cmpleu $b0.1 = $r0.20, $r0.7
	c0	mov $r0.9 = $r0.17
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
	c0	mpylu $r0.24 = $r0.23, $r0.16
	c0	mpyhs $r0.25 = $r0.23, $r0.16
	c0	mpyhs $r0.26 = $r0.23, $r0.12
;;
	c0	add $r0.24 = $r0.24, $r0.25
	c0	mpylu $r0.23 = $r0.23, $r0.12
;;
	c0	add $r0.23 = $r0.23, $r0.26
	c0	shl $r0.25 = $r0.24, $r0.10
	c0	shru $r0.24 = $r0.24, $r0.10
;;
	c0	sub $r0.23 = $r0.7, $r0.23
	c0	cmpne $r0.26 = $r0.25, 0
	c0	sub $r0.7 = $r0.11, $r0.25
;;
	c0	sub $r0.23 = $r0.23, $r0.24
	c0	mtb $b0.1 = $r0.26
;;
	c0	slct $r0.24 = $b0.1, $r0.15, 0
;;
	c0	add $r0.23 = $r0.23, $r0.24
;;
	c0	cmpgt $b0.1 = $r0.23, -1
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
	c0	br $b0.1, LBB44_35
;;
LBB44_36:                               ## %while.end.i.192
                                        ##   in Loop: Header=BB44_31 Depth=1
	c0	shl $r0.24 = $r0.23, $r0.10
	c0	shru $r0.7 = $r0.7, $r0.10
	c0	mov $r0.23 = $r0.14
;;
	c0	or $r0.7 = $r0.7, $r0.24
;;
	c0	cmpleu $b0.1 = $r0.20, $r0.7
;;
	c0	br $b0.1, LBB44_38
;;
## BB#37:                               ## %cond.false.10.i.194
                                        ##   in Loop: Header=BB44_31 Depth=1
	c0	shru $r0.23 = $r0.7, $r0.13
	c0	mtb $b0.1 = $r0.11
	c0	mtb $b0.2 = $r0.11
;;
	c0	addcg $r0.24, $b0.1 = $r0.23, $r0.23, $b0.1
;;
	c0	divs $r0.23, $b0.1 = $r0.0, $r0.22, $b0.1
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.23, $b0.2 = $r0.23, $r0.22, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.23, $b0.1 = $r0.23, $r0.22, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.23, $b0.2 = $r0.23, $r0.22, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.23, $b0.1 = $r0.23, $r0.22, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.23, $b0.2 = $r0.23, $r0.22, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.23, $b0.1 = $r0.23, $r0.22, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.23, $b0.2 = $r0.23, $r0.22, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.23, $b0.1 = $r0.23, $r0.22, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.23, $b0.2 = $r0.23, $r0.22, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.23, $b0.1 = $r0.23, $r0.22, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.23, $b0.2 = $r0.23, $r0.22, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.23, $b0.1 = $r0.23, $r0.22, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.23, $b0.2 = $r0.23, $r0.22, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.23, $b0.1 = $r0.23, $r0.22, $b0.1
;;
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
	c0	divs $r0.23, $b0.2 = $r0.23, $r0.22, $b0.2
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.23, $b0.1 = $r0.23, $r0.22, $b0.1
;;
	c0	divs $r0.23, $b0.2 = $r0.23, $r0.22, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.23, $b0.1 = $r0.23, $r0.22, $b0.1
;;
	c0	divs $r0.23, $b0.2 = $r0.23, $r0.22, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.23, $b0.1 = $r0.23, $r0.22, $b0.1
;;
	c0	divs $r0.23, $b0.2 = $r0.23, $r0.22, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.23, $b0.1 = $r0.23, $r0.22, $b0.1
;;
	c0	divs $r0.23, $b0.2 = $r0.23, $r0.22, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.23, $b0.1 = $r0.23, $r0.22, $b0.1
;;
	c0	divs $r0.23, $b0.2 = $r0.23, $r0.22, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.23, $b0.1 = $r0.23, $r0.22, $b0.1
;;
	c0	divs $r0.23, $b0.2 = $r0.23, $r0.22, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.23, $b0.1 = $r0.23, $r0.22, $b0.1
;;
	c0	divs $r0.23, $b0.2 = $r0.23, $r0.22, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	addcg $r0.25, $b0.2 = $r0.24, $r0.24, $b0.2
	c0	divs $r0.23, $b0.1 = $r0.23, $r0.22, $b0.1
;;
	c0	divs $r0.23, $b0.2 = $r0.23, $r0.22, $b0.2
	c0	addcg $r0.24, $b0.1 = $r0.25, $r0.25, $b0.1
;;
	c0	cmpge $b0.1 = $r0.23, $r0.0
	c0	addcg $r0.23, $b0.2 = $r0.24, $r0.24, $b0.2
;;
	c0	orc $r0.23 = $r0.23, $r0.0
	c0	cmpgeu $r0.7 = $r0.7, $r0.12
	c0	mfb $r0.24 = $b0.1
;;
	c0	sh1add $r0.23 = $r0.23, $r0.24
;;
	c0	slct $r0.23 = $b0.0, $r0.7, $r0.23
;;
LBB44_38:                               ## %cond.end.12.i.197
                                        ##   in Loop: Header=BB44_31 Depth=1
	c0	or $r0.9 = $r0.23, $r0.9
;;
LBB44_39:                               ## %estimateDiv64To32.exit199
                                        ##   in Loop: Header=BB44_31 Depth=1
	c0	add $r0.7 = $r0.9, -2
	c0	cmpgtu $b0.1 = $r0.9, 2
	c0	add $r0.9 = $r0.19, -30
;;
	c0	slct $r0.23 = $b0.1, $r0.7, 0
	c0	cmpgt $b0.1 = $r0.19, 30
	c0	mov $r0.19 = $r0.9
;;
	c0	mpyhs $r0.7 = $r0.23, $r0.21
	c0	mpylu $r0.24 = $r0.23, $r0.21
;;
	c0	add $r0.7 = $r0.24, $r0.7
	c0	br $b0.1, LBB44_31
;;
	c0	goto LBB44_40
;;
LBB44_17:                               ## %cond.false.i.255
	c0	or $r0.3 = $r0.3, 4194304
	c0	cmpeq $b0.0 = $r0.5, 0
	c0	and $r0.4 = $r0.4, 2147483647
	c0	cmpne $b0.1 = $r0.2, 2139095040
;;
	c0	cmpgtu $b0.2 = $r0.4, 2139095040
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
	c0	or $r0.4 = $r0.4, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB44_25:                               ## %if.then.33
	c0	cmplt $b0.0 = $r0.10, -1
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
	c0	br $b0.0, LBB44_27
;;
## BB#41:                               ## %if.then.55
	c0	cmpleu $b0.0 = $r0.5, $r0.7
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
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
	c0	cmpgeu $r0.17 = $r0.7, $r0.10
;;
	c0	addcg $r0.18, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
	c0	addcg $r0.15, $b0.0 = $r0.18, $r0.18, $b0.0
;;
	c0	addcg $r0.18, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
	c0	mtb $b0.2 = $r0.11
;;
	c0	divs $r0.11, $b0.1 = $r0.14, $r0.16, $b0.1
	c0	addcg $r0.14, $b0.0 = $r0.18, $r0.18, $b0.0
;;
	c0	cmpge $b0.0 = $r0.11, $r0.0
	c0	addcg $r0.11, $b0.1 = $r0.14, $r0.14, $b0.1
;;
	c0	mfb $r0.14 = $b0.0
	c0	orc $r0.11 = $r0.11, $r0.0
;;
	c0	sh1add $r0.11 = $r0.11, $r0.14
;;
	c0	slct $r0.11 = $b0.2, $r0.17, $r0.11
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
	c0	mov $r0.16 = 0
;;
	c0	mpyhs $r0.17 = $r0.14, $r0.10
	c0	mpyhs $r0.18 = $r0.14, $r0.8
	c0	mpylu $r0.8 = $r0.14, $r0.8
;;
	c0	add $r0.8 = $r0.8, $r0.18
	c0	mpylu $r0.14 = $r0.14, $r0.10
;;
	c0	add $r0.14 = $r0.14, $r0.17
	c0	shl $r0.17 = $r0.8, $r0.13
	c0	shru $r0.18 = $r0.8, $r0.13
;;
	c0	sub $r0.14 = $r0.7, $r0.14
	c0	cmpne $r0.19 = $r0.17, 0
	c0	sub $r0.8 = $r0.16, $r0.17
;;
	c0	sub $r0.14 = $r0.14, $r0.18
	c0	mtb $b0.0 = $r0.19
;;
	c0	slct $r0.15 = $b0.0, $r0.15, 0
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	cmpgt $b0.0 = $r0.14, -1
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
	c0	cmpgeu $r0.6 = $r0.6, $r0.10
;;
	c0	divs $r0.10, $b0.1 = $r0.12, $r0.14, $b0.1
	c0	mtb $b0.2 = $r0.8
	c0	addcg $r0.8, $b0.0 = $r0.15, $r0.15, $b0.0
;;
	c0	cmpge $b0.0 = $r0.10, $r0.0
	c0	addcg $r0.10, $b0.1 = $r0.8, $r0.8, $b0.1
;;
	c0	mfb $r0.8 = $b0.0
	c0	orc $r0.10 = $r0.10, $r0.0
;;
	c0	sh1add $r0.8 = $r0.10, $r0.8
;;
	c0	slct $r0.6 = $b0.2, $r0.6, $r0.8
	c0	goto LBB44_52
;;
LBB44_50:
	c0	mov $r0.6 = 65535
;;
LBB44_52:                               ## %cond.end.12.i
	c0	or $r0.6 = $r0.6, $r0.11
;;
LBB44_53:                               ## %estimateDiv64To32.exit
	c0	mov $r0.8 = 0
	c0	add $r0.10 = $r0.6, -2
	c0	cmpgtu $b0.0 = $r0.6, 2
	c0	mov $r0.6 = 2
	c0	mov $r0.11 = 1
	c0	add $r0.12 = $r0.9, 31
;;
	c0	sub $r0.9 = $r0.8, $r0.9
	c0	slct $r0.10 = $b0.0, $r0.10, 0
	c0	shru $r0.8 = $r0.5, $r0.6
;;
	c0	shru $r0.23 = $r0.10, $r0.9
	c0	shru $r0.5 = $r0.7, $r0.11
;;
	c0	shl $r0.5 = $r0.5, $r0.12
	c0	mpyhs $r0.6 = $r0.23, $r0.8
	c0	mpylu $r0.7 = $r0.23, $r0.8
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
	c0	add $r0.23 = $r0.23, 1
;;
	c0	sub $r0.6 = $r0.5, $r0.8
;;
	c0	cmpgt $b0.0 = $r0.6, -1
;;
	c0	br $b0.0, LBB44_55
;;
## BB#56:                               ## %do.end
	c0	add $r0.8 = $r0.6, $r0.5
;;
	c0	cmplt $b0.0 = $r0.8, 0
;;
	c0	br $b0.0, LBB44_59
;;
## BB#57:                               ## %lor.lhs.false.81
	c0	mov $r0.7 = 1
	c0	cmpne $b0.0 = $r0.8, 0
;;
	c0	br $b0.0, LBB44_60
;;
## BB#58:                               ## %lor.lhs.false.81
	c0	and $r0.8 = $r0.23, 1
;;
	c0	cmpeq $b0.0 = $r0.8, 0
;;
	c0	br $b0.0, LBB44_60
;;
LBB44_59:                               ## %if.end.87
	c0	shru $r0.7 = $r0.5, $r0.9
	c0	cmpgt $b0.0 = $r0.5, -1
	c0	mov $r0.6 = $r0.5
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
	c0	mov $r0.9 = 4
	c0	mov $r0.10 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	shl $r0.6 = $r0.5, $r0.6
;;
	c0	slct $r0.6 = $b0.0, $r0.6, $r0.5
;;
	c0	shl $r0.4 = $r0.6, $r0.4
	c0	cmpltu $b0.1 = $r0.6, 16777216
;;
	c0	slct $r0.4 = $b0.1, $r0.4, $r0.6
	c0	mfb $r0.6 = $b0.0
;;
	c0	shru $r0.4 = $r0.4, $r0.8
	c0	shl $r0.6 = $r0.6, $r0.9
;;
	c0	and $r0.4 = $r0.4, 1020
	c0	or $r0.8 = $r0.6, 8
;;
	c0	add $r0.4 = $r0.10, $r0.4
	c0	slct $r0.6 = $b0.1, $r0.8, $r0.6
;;
	c0	ldw $r0.4 = 0[$r0.4]
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
	c0	and $r0.4 = $r0.3, 8388607
	c0	shru $r0.5 = $r0.3, $r0.2
;;
	c0	cmpne $b0.0 = $r0.7, 255
;;
	c0	br $b0.0, LBB45_9
;;
## BB#1:                                ## %if.then
	c0	cmpeq $b0.0 = $r0.4, 0
;;
	c0	br $b0.0, LBB45_7
;;
## BB#2:                                ## %if.then.3
	c0	and $r0.4 = $r0.3, 2143289344
	c0	or $r0.2 = $r0.3, 4194304
;;
	c0	cmpne $b0.0 = $r0.4, 2139095040
;;
	c0	br $b0.0, LBB45_3
;;
## BB#4:                                ## %if.then.3
	c0	and $r0.3 = $r0.3, 4194303
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
	c0	br $b0.0, LBB45_5
;;
## BB#6:                                ## %if.then.i.87
	c0	mov $r0.4 = float_exception_flags
	c0	mov $r0.3 = $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.4]
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
	c0	br $b0.0, LBB45_11
;;
## BB#10:                               ## %if.then.10
	c0	or $r0.2 = $r0.7, $r0.4
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	brf $b0.0, LBB45_8
;;
	c0	goto LBB45_41
;;
LBB45_7:                                ## %if.end
	c0	cmpeq $b0.0 = $r0.5, 0
;;
	c0	br $b0.0, LBB45_41
;;
LBB45_8:                                ## %if.end.7
	c0	mov $r0.2 = float_exception_flags
	c0	mov $r0.3 = 2147483647
;;
	c0	ldw $r0.4 = 0[$r0.2]
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
	c0	br $b0.0, LBB45_15
;;
## BB#12:                               ## %if.then.16
	c0	cmpeq $b0.0 = $r0.4, 0
;;
	c0	br $b0.0, LBB45_13
;;
## BB#14:                               ## %if.end.19
	c0	mov $r0.5 = 16
	c0	cmpltu $b0.0 = $r0.4, 65536
	c0	mov $r0.6 = 8
	c0	mov $r0.7 = 22
	c0	mov $r0.8 = 4
	c0	mov $r0.9 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	shl $r0.3 = $r0.3, $r0.5
;;
	c0	slct $r0.3 = $b0.0, $r0.3, $r0.4
;;
	c0	cmpltu $b0.1 = $r0.3, 16777216
	c0	shl $r0.5 = $r0.3, $r0.6
;;
	c0	slct $r0.3 = $b0.1, $r0.5, $r0.3
	c0	mfb $r0.5 = $b0.0
;;
	c0	shru $r0.3 = $r0.3, $r0.7
	c0	shl $r0.5 = $r0.5, $r0.8
;;
	c0	and $r0.3 = $r0.3, 1020
	c0	or $r0.6 = $r0.5, 8
;;
	c0	add $r0.3 = $r0.9, $r0.3
	c0	slct $r0.5 = $b0.1, $r0.6, $r0.5
;;
	c0	ldw $r0.3 = 0[$r0.3]
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
	c0	mov $r0.9 = 19
	c0	and $r0.6 = $r0.7, 1
	c0	mov $r0.5 = 17
	c0	mov $r0.3 = 1
	c0	add $r0.7 = $r0.7, -127
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
	c0	cmpgeu $r0.13 = $r0.7, $r0.8
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
;;
	c0	addcg $r0.10, $b0.2 = $r0.12, $r0.12, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.11, $b0.1
;;
	c0	addcg $r0.12, $b0.1 = $r0.10, $r0.10, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.11, $b0.2
;;
	c0	addcg $r0.10, $b0.2 = $r0.12, $r0.12, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.11, $b0.1
;;
	c0	addcg $r0.12, $b0.1 = $r0.10, $r0.10, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.11, $b0.2
	c0	mov $r0.10 = 15
;;
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.11, $b0.1
	c0	addcg $r0.14, $b0.2 = $r0.12, $r0.12, $b0.2
;;
	c0	addcg $r0.12, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.11, $b0.2
;;
	c0	addcg $r0.14, $b0.2 = $r0.12, $r0.12, $b0.2
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.11, $b0.1
	c0	mov $r0.12 = -32768
;;
	c0	addcg $r0.15, $b0.1 = $r0.14, $r0.14, $b0.1
	c0	divs $r0.9, $b0.2 = $r0.9, $r0.11, $b0.2
;;
	c0	divs $r0.9, $b0.1 = $r0.9, $r0.11, $b0.1
	c0	addcg $r0.11, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	addcg $r0.14, $b0.1 = $r0.11, $r0.11, $b0.1
;;
	c0	cmpge $b0.1 = $r0.9, $r0.0
	c0	orc $r0.9 = $r0.14, $r0.0
;;
	c0	mfb $r0.11 = $b0.1
;;
	c0	sh1add $r0.9 = $r0.9, $r0.11
;;
	c0	slct $r0.9 = $b0.0, $r0.13, $r0.9
;;
	c0	add $r0.8 = $r0.8, $r0.9
	c0	mov $r0.13 = $r0.7
;;
	c0	cmpgtu $b0.0 = $r0.8, 131071
	c0	shl $r0.8 = $r0.8, $r0.10
;;
	c0	slct $r0.8 = $b0.0, $r0.12, $r0.8
;;
	c0	cmpgtu $b0.0 = $r0.8, $r0.7
;;
	c0	br $b0.0, LBB45_17
;;
## BB#20:                               ## %if.then.17.i
	c0	shr $r0.9 = $r0.7, $r0.3
	c0	goto LBB45_32
;;
LBB45_16:                               ## %if.then.i
	c0	mov $r0.10 = estimateSqrt32.sqrtOddAdjustments
	c0	add $r0.9 = $r0.9, 16384
	c0	mov $r0.11 = 0
;;
	c0	sh1add $r0.8 = $r0.8, $r0.10
	c0	mtb $b0.0 = $r0.11
	c0	mtb $b0.1 = $r0.11
;;
	c0	ldhu $r0.8 = 0[$r0.8]
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
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	addcg $r0.13, $b0.0 = $r0.12, $r0.12, $b0.0
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
;;
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
	c0	addcg $r0.12, $b0.1 = $r0.13, $r0.13, $b0.1
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
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
	c0	addcg $r0.12, $b0.1 = $r0.13, $r0.13, $b0.1
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
	c0	divs $r0.10, $b0.0 = $r0.10, $r0.11, $b0.0
;;
	c0	addcg $r0.13, $b0.0 = $r0.12, $r0.12, $b0.0
	c0	divs $r0.10, $b0.1 = $r0.10, $r0.11, $b0.1
	c0	mov $r0.12 = 15
	c0	mov $r0.14 = 14
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
	c0	shl $r0.8 = $r0.8, $r0.12
	c0	mtb $b0.2 = $r0.9
;;
	c0	divs $r0.9, $b0.1 = $r0.10, $r0.11, $b0.1
	c0	addcg $r0.10, $b0.0 = $r0.15, $r0.15, $b0.0
;;
	c0	cmpge $b0.0 = $r0.9, $r0.0
	c0	addcg $r0.9, $b0.1 = $r0.10, $r0.10, $b0.1
;;
	c0	mfb $r0.10 = $b0.0
	c0	orc $r0.9 = $r0.9, $r0.0
;;
	c0	sh1add $r0.9 = $r0.9, $r0.10
;;
	c0	slct $r0.9 = $b0.2, $r0.16, $r0.9
;;
	c0	shl $r0.9 = $r0.9, $r0.14
;;
	c0	add $r0.8 = $r0.8, $r0.9
;;
LBB45_17:                               ## %if.end.19.i
	c0	cmpleu $b0.0 = $r0.8, $r0.13
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
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
	c0	cmpgeu $r0.17 = $r0.13, $r0.9
;;
	c0	addcg $r0.18, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.16, $b0.1
	c0	addcg $r0.15, $b0.0 = $r0.18, $r0.18, $b0.0
;;
	c0	addcg $r0.18, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.16, $b0.0
	c0	mtb $b0.2 = $r0.10
;;
	c0	divs $r0.10, $b0.1 = $r0.14, $r0.16, $b0.1
	c0	addcg $r0.14, $b0.0 = $r0.18, $r0.18, $b0.0
;;
	c0	cmpge $b0.0 = $r0.10, $r0.0
	c0	addcg $r0.10, $b0.1 = $r0.14, $r0.14, $b0.1
;;
	c0	mfb $r0.14 = $b0.0
	c0	orc $r0.10 = $r0.10, $r0.0
;;
	c0	sh1add $r0.10 = $r0.10, $r0.14
;;
	c0	slct $r0.10 = $b0.2, $r0.17, $r0.10
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
	c0	mov $r0.17 = 0
;;
	c0	mpyhs $r0.18 = $r0.14, $r0.9
	c0	mpyhs $r0.19 = $r0.14, $r0.15
	c0	mpylu $r0.15 = $r0.14, $r0.15
;;
	c0	add $r0.15 = $r0.15, $r0.19
	c0	mpylu $r0.14 = $r0.14, $r0.9
;;
	c0	add $r0.14 = $r0.14, $r0.18
	c0	shl $r0.18 = $r0.15, $r0.12
	c0	shru $r0.15 = $r0.15, $r0.12
;;
	c0	sub $r0.14 = $r0.13, $r0.14
	c0	cmpne $r0.19 = $r0.18, 0
	c0	sub $r0.13 = $r0.17, $r0.18
;;
	c0	sub $r0.14 = $r0.14, $r0.15
	c0	mtb $b0.0 = $r0.19
;;
	c0	slct $r0.15 = $b0.0, $r0.16, 0
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	cmpgt $b0.0 = $r0.14, -1
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
	c0	cmpgeu $r0.9 = $r0.12, $r0.9
;;
	c0	divs $r0.12, $b0.1 = $r0.13, $r0.15, $b0.1
	c0	mtb $b0.2 = $r0.11
	c0	addcg $r0.11, $b0.0 = $r0.16, $r0.16, $b0.0
;;
	c0	cmpge $b0.0 = $r0.12, $r0.0
	c0	addcg $r0.12, $b0.1 = $r0.11, $r0.11, $b0.1
;;
	c0	mfb $r0.11 = $b0.0
	c0	orc $r0.12 = $r0.12, $r0.0
;;
	c0	sh1add $r0.11 = $r0.12, $r0.11
;;
	c0	slct $r0.9 = $b0.2, $r0.9, $r0.11
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
	c0	br $b0.0, LBB45_39
;;
## BB#33:                               ## %if.then.25
	c0	cmpgtu $b0.0 = $r0.9, -3
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
	c0	add $r0.14 = $r0.14, $r0.15
	c0	mpylu $r0.15 = $r0.13, $r0.13
	c0	mpyhs $r0.13 = $r0.13, $r0.13
;;
	c0	add $r0.11 = $r0.16, $r0.11
;;
	c0	shl $r0.5 = $r0.11, $r0.5
	c0	mov $r0.16 = 0
	c0	add $r0.13 = $r0.15, $r0.13
	c0	shl $r0.15 = $r0.11, $r0.3
	c0	shru $r0.7 = $r0.11, $r0.7
;;
	c0	sub $r0.6 = $r0.6, $r0.13
	c0	add $r0.13 = $r0.5, $r0.14
	c0	zxth $r0.7 = $r0.7
	c0	cmpltu $b0.0 = $r0.15, $r0.11
;;
	c0	cmpltu $r0.11 = $r0.13, $r0.5
	c0	cmpne $r0.14 = $r0.13, 0
	c0	mfb $r0.15 = $b0.0
	c0	sub $r0.5 = $r0.16, $r0.13
;;
	c0	mtb $b0.0 = $r0.14
	c0	mtb $b0.1 = $r0.11
	c0	shl $r0.10 = $r0.15, $r0.10
;;
	c0	mfb $r0.11 = $b0.1
	c0	slct $r0.12 = $b0.0, $r0.12, 0
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
	c0	br $b0.0, LBB45_37
;;
LBB45_38:                               ## %while.end
	c0	or $r0.2 = $r0.5, $r0.6
;;
	c0	cmpne $b0.0 = $r0.2, 0
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
	c0	br $b0.0, LBB46_2
;;
## BB#1:                                ## %entry
	c0	and $r0.2 = $r0.3, 8388607
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB46_4
;;
LBB46_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 2139095040
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
	c0	br $b0.0, LBB46_9
;;
## BB#3:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 8388607
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB46_9
;;
LBB46_4:                                ## %if.then
	c0	and $r0.2 = $r0.3, 2143289344
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
	c0	br $b0.0, LBB46_6
;;
## BB#5:                                ## %if.then
	c0	and $r0.2 = $r0.3, 4194303
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB46_8
;;
LBB46_6:                                ## %lor.lhs.false.9
	c0	and $r0.2 = $r0.4, 2143289344
	c0	mov $r0.3 = 0
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
	c0	br $b0.0, LBB46_13
;;
## BB#7:                                ## %lor.lhs.false.9
	c0	and $r0.2 = $r0.4, 4194303
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB46_13
;;
LBB46_8:                                ## %if.then.12
	c0	mov $r0.2 = float_exception_flags
	c0	mov $r0.3 = 0
;;
	c0	ldw $r0.4 = 0[$r0.2]
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
	c0	br $b0.0, LBB47_2
;;
## BB#1:                                ## %entry
	c0	and $r0.2 = $r0.3, 8388607
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB47_4
;;
LBB47_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 2139095040
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
	c0	br $b0.0, LBB47_5
;;
## BB#3:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 8388607
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB47_5
;;
LBB47_4:                                ## %if.then
	c0	mov $r0.2 = float_exception_flags
	c0	mov $r0.3 = 0
;;
	c0	ldw $r0.4 = 0[$r0.2]
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
	c0	brf $b0.0, LBB47_6
;;
## BB#10:                               ## %if.end.13
	c0	cmpltu $b0.0 = $r0.3, $r0.4
	c0	cmpeq $b0.1 = $r0.3, $r0.4
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
	c0	brf $b0.0, LBB47_8
;;
## BB#7:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
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
	c0	br $b0.0, LBB48_2
;;
## BB#1:                                ## %entry
	c0	and $r0.2 = $r0.3, 8388607
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB48_4
;;
LBB48_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 2139095040
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
	c0	br $b0.0, LBB48_5
;;
## BB#3:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 8388607
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB48_5
;;
LBB48_4:                                ## %if.then
	c0	mov $r0.2 = float_exception_flags
	c0	mov $r0.3 = 0
;;
	c0	ldw $r0.4 = 0[$r0.2]
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
	c0	brf $b0.0, LBB48_6
;;
## BB#10:                               ## %if.end.13
	c0	cmpltu $b0.0 = $r0.3, $r0.4
	c0	cmpne $b0.1 = $r0.3, $r0.4
;;
	c0	mfb $r0.3 = $b0.0
	c0	mfb $r0.4 = $b0.1
;;
	c0	cmpne $b0.0 = $r0.2, $r0.3
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
	c0	br $b0.0, LBB48_7
;;
## BB#8:                                ## %land.rhs
	c0	or $r0.2 = $r0.4, $r0.3
;;
	c0	and $r0.2 = $r0.2, 2147483647
;;
	c0	cmpne $b0.0 = $r0.2, 0
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
	c0	br $b0.0, LBB49_2
;;
## BB#1:                                ## %entry
	c0	and $r0.2 = $r0.3, 8388607
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB49_4
;;
LBB49_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 2139095040
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
	c0	br $b0.0, LBB49_5
;;
## BB#3:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 8388607
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB49_5
;;
LBB49_4:                                ## %if.then
	c0	mov $r0.2 = float_exception_flags
	c0	mov $r0.3 = 0
;;
	c0	ldw $r0.4 = 0[$r0.2]
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
	c0	brf $b0.0, LBB49_7
;;
## BB#6:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
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
	c0	br $b0.0, LBB50_2
;;
## BB#1:                                ## %entry
	c0	and $r0.2 = $r0.3, 8388607
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB50_4
;;
LBB50_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 2139095040
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
	c0	br $b0.0, LBB50_9
;;
## BB#3:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 8388607
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB50_9
;;
LBB50_4:                                ## %if.then
	c0	and $r0.2 = $r0.3, 2143289344
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
	c0	br $b0.0, LBB50_6
;;
## BB#5:                                ## %if.then
	c0	and $r0.2 = $r0.3, 4194303
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB50_8
;;
LBB50_6:                                ## %lor.lhs.false.9
	c0	and $r0.2 = $r0.4, 2143289344
	c0	mov $r0.3 = 0
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
	c0	br $b0.0, LBB50_15
;;
## BB#7:                                ## %lor.lhs.false.9
	c0	and $r0.2 = $r0.4, 4194303
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB50_15
;;
LBB50_8:                                ## %if.then.12
	c0	mov $r0.2 = float_exception_flags
	c0	mov $r0.3 = 0
;;
	c0	ldw $r0.4 = 0[$r0.2]
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
	c0	brf $b0.0, LBB50_10
;;
## BB#14:                               ## %if.end.20
	c0	cmpltu $b0.0 = $r0.3, $r0.4
	c0	cmpeq $b0.1 = $r0.3, $r0.4
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
	c0	brf $b0.0, LBB50_12
;;
## BB#11:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
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
	c0	br $b0.0, LBB51_2
;;
## BB#1:                                ## %entry
	c0	and $r0.2 = $r0.3, 8388607
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB51_4
;;
LBB51_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 2139095040
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
	c0	br $b0.0, LBB51_9
;;
## BB#3:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.4, 8388607
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB51_9
;;
LBB51_4:                                ## %if.then
	c0	and $r0.2 = $r0.3, 2143289344
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
	c0	br $b0.0, LBB51_6
;;
## BB#5:                                ## %if.then
	c0	and $r0.2 = $r0.3, 4194303
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB51_8
;;
LBB51_6:                                ## %lor.lhs.false.9
	c0	and $r0.2 = $r0.4, 2143289344
	c0	mov $r0.3 = 0
;;
	c0	cmpne $b0.0 = $r0.2, 2139095040
;;
	c0	br $b0.0, LBB51_15
;;
## BB#7:                                ## %lor.lhs.false.9
	c0	and $r0.2 = $r0.4, 4194303
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB51_15
;;
LBB51_8:                                ## %if.then.12
	c0	mov $r0.2 = float_exception_flags
	c0	mov $r0.3 = 0
;;
	c0	ldw $r0.4 = 0[$r0.2]
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
	c0	brf $b0.0, LBB51_10
;;
## BB#14:                               ## %if.end.20
	c0	cmpltu $b0.0 = $r0.3, $r0.4
	c0	cmpne $b0.1 = $r0.3, $r0.4
;;
	c0	mfb $r0.3 = $b0.0
	c0	mfb $r0.4 = $b0.1
;;
	c0	cmpne $b0.0 = $r0.2, $r0.3
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
	c0	br $b0.0, LBB51_11
;;
## BB#12:                               ## %land.rhs
	c0	or $r0.2 = $r0.4, $r0.3
;;
	c0	and $r0.2 = $r0.2, 2147483647
;;
	c0	cmpne $b0.0 = $r0.2, 0
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
	c0	and $r0.9 = $r0.3, 1048575
	c0	shru $r0.2 = $r0.3, $r0.5
;;
	c0	cmplt $b0.0 = $r0.6, 0
;;
	c0	br $b0.0, LBB52_7
;;
## BB#1:                                ## %if.then
	c0	cmpltu $b0.0 = $r0.8, 1055
;;
	c0	br $b0.0, LBB52_3
;;
## BB#2:                                ## %if.then.13
	c0	or $r0.3 = $r0.9, $r0.4
	c0	cmpne $b0.0 = $r0.8, 2047
;;
	c0	cmpeq $b0.1 = $r0.3, 0
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
	c0	mfb $r0.4 = $b0.0
	c0	br $b0.1, LBB52_9
;;
## BB#8:                                ## %if.then.24
	c0	or $r0.6 = $r0.8, $r0.9
	c0	mov $r0.3 = 0
;;
	c0	or $r0.4 = $r0.6, $r0.4
	c0	goto LBB52_10
;;
LBB52_3:                                ## %if.end.16
	c0	or $r0.3 = $r0.9, 1048576
	c0	cmpeq $b0.0 = $r0.6, 0
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
	c0	br $b0.0, LBB52_19
;;
## BB#6:
	c0	shl $r0.4 = $r0.4, $r0.6
	c0	goto LBB52_10
;;
LBB52_9:                                ## %if.else.27
	c0	add $r0.3 = $r0.7, 13
	c0	or $r0.6 = $r0.9, 1048576
	c0	mov $r0.7 = 1043
;;
	c0	and $r0.3 = $r0.3, 31
	c0	sub $r0.7 = $r0.7, $r0.8
;;
	c0	shl $r0.8 = $r0.6, $r0.3
	c0	shru $r0.3 = $r0.6, $r0.7
;;
	c0	or $r0.4 = $r0.8, $r0.4
;;
LBB52_10:                               ## %if.end.32
	c0	mov $r0.6 = float_rounding_mode
;;
	c0	ldw $r0.6 = 0[$r0.6]
;;
	c0	cmpne $b0.0 = $r0.6, 0
;;
	c0	brf $b0.0, LBB52_11
;;
## BB#14:                               ## %if.else.48
	c0	cmpne $b0.0 = $r0.4, 0
	c0	cmpeq $b0.1 = $r0.2, 0
;;
	c0	mfb $r0.4 = $b0.0
	c0	br $b0.1, LBB52_16
;;
## BB#15:                               ## %if.then.52
	c0	cmpeq $b0.1 = $r0.6, 3
	c0	mfb $r0.6 = $b0.0
;;
	c0	mfb $r0.7 = $b0.1
;;
	c0	and $r0.6 = $r0.6, $r0.7
	c0	mov $r0.7 = 0
;;
	c0	and $r0.6 = $r0.6, 1
;;
	c0	add $r0.3 = $r0.3, $r0.6
;;
	c0	sub $r0.3 = $r0.7, $r0.3
	c0	goto LBB52_17
;;
LBB52_11:                               ## %if.then.35
	c0	cmpgt $b0.0 = $r0.4, -1
;;
	c0	br $b0.0, LBB52_13
;;
## BB#12:                               ## %if.then.38
	c0	and $r0.6 = $r0.4, 2147483647
	c0	add $r0.3 = $r0.3, 1
;;
	c0	and $r0.7 = $r0.3, -2
	c0	cmpeq $b0.0 = $r0.6, 0
;;
	c0	slct $r0.3 = $b0.0, $r0.7, $r0.3
;;
LBB52_13:                               ## %if.end.45
	c0	mov $r0.6 = 0
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	sub $r0.6 = $r0.6, $r0.3
;;
	c0	slct $r0.3 = $b0.0, $r0.6, $r0.3
	c0	goto LBB52_17
;;
LBB52_16:                               ## %if.else.57
	c0	cmpeq $b0.1 = $r0.6, 2
	c0	mfb $r0.6 = $b0.0
;;
	c0	mfb $r0.7 = $b0.1
;;
	c0	and $r0.6 = $r0.6, $r0.7
;;
	c0	and $r0.6 = $r0.6, 1
;;
	c0	add $r0.3 = $r0.6, $r0.3
;;
LBB52_17:                               ## %if.end.63
	c0	cmpeq $b0.0 = $r0.3, 0
;;
	c0	br $b0.0, LBB52_20
;;
## BB#18:                               ## %if.end.63
	c0	shru $r0.5 = $r0.3, $r0.5
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.5
;;
	c0	br $b0.0, LBB52_20
;;
LBB52_19:                               ## %invalid
	c0	mov $r0.4 = float_exception_flags
	c0	mov $r0.3 = -2147483648
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	ldw $r0.2 = 0[$r0.4]
	c0	slct $r0.3 = $b0.0, $r0.3, 2147483647
;;
	c0	or $r0.2 = $r0.2, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.4] = $r0.2
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB52_20:                               ## %if.end.72
	c0	cmpeq $b0.0 = $r0.4, 0
;;
	c0	br $b0.0, LBB52_22
;;
## BB#21:                               ## %if.then.74
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
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
	c0	and $r0.8 = $r0.3, 1048575
	c0	shru $r0.2 = $r0.3, $r0.5
;;
	c0	cmplt $b0.0 = $r0.9, 0
;;
	c0	br $b0.0, LBB53_5
;;
## BB#1:                                ## %if.then
	c0	cmpltu $b0.0 = $r0.6, 1055
;;
	c0	br $b0.0, LBB53_3
;;
## BB#2:                                ## %if.then.13
	c0	or $r0.3 = $r0.8, $r0.4
	c0	cmpne $b0.0 = $r0.6, 2047
;;
	c0	cmpeq $b0.1 = $r0.3, 0
;;
	c0	slct $r0.3 = $b0.1, $r0.2, 0
;;
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.3
	c0	goto LBB53_10
;;
LBB53_5:                                ## %if.else
	c0	cmpgtu $b0.0 = $r0.6, 1022
;;
	c0	br $b0.0, LBB53_7
;;
## BB#6:                                ## %if.then.19
	c0	or $r0.2 = $r0.8, $r0.4
	c0	mov $r0.3 = 0
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	brf $b0.0, LBB53_12
;;
	c0	goto LBB53_13
;;
LBB53_3:                                ## %if.end.16
	c0	or $r0.3 = $r0.8, 1048576
	c0	shl $r0.6 = $r0.4, $r0.9
	c0	cmpeq $b0.0 = $r0.9, 0
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
LBB53_7:                                ## %if.end.26
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
LBB53_8:                                ## %if.end.30
	c0	mov $r0.4 = 0
	c0	cmpne $b0.0 = $r0.2, 0
	c0	cmpeq $b0.1 = $r0.3, 0
;;
	c0	sub $r0.4 = $r0.4, $r0.3
;;
	c0	slct $r0.3 = $b0.0, $r0.4, $r0.3
	c0	br $b0.1, LBB53_11
;;
## BB#9:                                ## %if.end.30
	c0	shru $r0.4 = $r0.3, $r0.5
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.4
;;
	c0	br $b0.0, LBB53_11
;;
LBB53_10:                               ## %invalid
	c0	mov $r0.4 = float_exception_flags
	c0	mov $r0.3 = -2147483648
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	ldw $r0.2 = 0[$r0.4]
	c0	slct $r0.3 = $b0.0, $r0.3, 2147483647
;;
	c0	or $r0.2 = $r0.2, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.4] = $r0.2
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB53_11:                               ## %if.end.40
	c0	cmpeq $b0.0 = $r0.6, 0
;;
	c0	br $b0.0, LBB53_13
;;
LBB53_12:                               ## %if.then.42
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
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
	c0	and $r0.7 = $r0.2, 1048575
	c0	shru $r0.3 = $r0.2, $r0.5
;;
	c0	cmpne $b0.0 = $r0.8, 2047
;;
	c0	br $b0.0, LBB54_7
;;
## BB#1:                                ## %if.then
	c0	or $r0.7 = $r0.7, $r0.4
;;
	c0	cmpeq $b0.0 = $r0.7, 0
;;
	c0	br $b0.0, LBB54_6
;;
## BB#2:                                ## %if.then.12
	c0	and $r0.7 = $r0.2, 2146959360
;;
	c0	cmpne $b0.0 = $r0.7, 2146435072
;;
	c0	br $b0.0, LBB54_5
;;
## BB#3:                                ## %land.rhs.i.i
	c0	and $r0.7 = $r0.2, 524287
;;
	c0	or $r0.7 = $r0.7, $r0.4
;;
	c0	cmpeq $b0.0 = $r0.7, 0
;;
	c0	br $b0.0, LBB54_5
;;
## BB#4:                                ## %if.then.i
	c0	mov $r0.7 = float_exception_flags
;;
	c0	ldw $r0.8 = 0[$r0.7]
;;
	c0	or $r0.8 = $r0.8, 16
;;
	c0	stw 0[$r0.7] = $r0.8
;;
LBB54_5:                                ## %float64ToCommonNaN.exit
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
.return ret($r0.3:u32)
	c0	or $r0.3 = $r0.2, 2143289344
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB54_7:                                ## %if.end.19
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
	c0	mfb $r0.6 = $b0.1
	c0	or $r0.4 = $r0.5, $r0.4
;;
	c0	or $r0.4 = $r0.4, $r0.6
;;
	c0	or $r0.5 = $r0.4, 1073741824
;;
	c0	slct $r0.5 = $b0.0, $r0.4, $r0.5
	c0	mov $r0.4 = $r0.2
;;
.call roundAndPackFloat32, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32), ret($r0.3:u32)
	c0	call $l0.0 = roundAndPackFloat32
;;
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB54_6:                                ## %if.end
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
	c0	shru $r0.2 = $r0.4, $r0.2
;;
	c0	and $r0.2 = $r0.2, 2047
;;
	c0	cmpltu $b0.0 = $r0.2, 1043
;;
	c0	br $b0.0, LBB55_23
;;
## BB#1:                                ## %if.then
	c0	cmpltu $b0.0 = $r0.2, 1075
;;
	c0	br $b0.0, LBB55_13
;;
## BB#2:                                ## %if.then.4
	c0	cmpne $b0.0 = $r0.2, 2047
;;
	c0	br $b0.0, LBB55_25
;;
## BB#3:                                ## %land.lhs.true
	c0	and $r0.2 = $r0.4, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.5
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB55_25
;;
## BB#4:                                ## %if.then.12
	c0	and $r0.2 = $r0.4, 2146959360
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
	c0	br $b0.0, LBB55_5
;;
## BB#6:                                ## %land.rhs.i.59.i
	c0	cmpeq $b0.0 = $r0.5, 0
;;
	c0	br $b0.0, LBB55_8
;;
## BB#7:                                ## %if.then.thread.i
	c0	mov $r0.6 = float_exception_flags
	c0	or $r0.2 = $r0.4, 524288
;;
	c0	ldw $r0.4 = 0[$r0.6]
;;
	c0	or $r0.4 = $r0.4, 16
;;
	c0	stw 0[$r0.6] = $r0.4
	c0	goto LBB55_12
;;
LBB55_23:                               ## %if.else.66
	c0	cmpgtu $b0.0 = $r0.2, 1022
;;
	c0	br $b0.0, LBB55_41
;;
## BB#24:                               ## %if.then.69
	c0	mov $r0.6 = 1
;;
	c0	shl $r0.6 = $r0.4, $r0.6
;;
	c0	or $r0.6 = $r0.6, $r0.5
;;
	c0	cmpne $b0.0 = $r0.6, 0
;;
	c0	brf $b0.0, LBB55_25
;;
## BB#26:                               ## %if.end.77
	c0	mov $r0.9 = float_exception_flags
	c0	mov $r0.7 = float_rounding_mode
	c0	mov $r0.6 = 31
;;
	c0	ldw $r0.10 = 0[$r0.9]
;;
	c0	ldw $r0.8 = 0[$r0.7]
	c0	shru $r0.7 = $r0.4, $r0.6
	c0	or $r0.10 = $r0.10, 1
;;
	c0	cmpeq $b0.0 = $r0.8, 3
	c0	stw 0[$r0.9] = $r0.10
;;
	c0	br $b0.0, LBB55_32
;;
## BB#27:                               ## %if.end.77
	c0	cmpeq $b0.0 = $r0.8, 2
;;
	c0	brf $b0.0, LBB55_28
;;
## BB#37:                               ## %sw.bb.97
	c0	cmpeq $b0.0 = $r0.7, 0
;;
	c0	br $b0.0, LBB55_39
;;
## BB#38:                               ## %cond.true.99
	c0	mov $r0.2 = -2147483648
	c0	goto LBB55_34
;;
LBB55_25:                               ## %if.end
	c0	stw 0[$r0.3] = $r0.4
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.5
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB55_13:                               ## %if.end.17
	c0	mov $r0.8 = 1074
	c0	mov $r0.9 = float_rounding_mode
	c0	mov $r0.11 = 2
	c0	mov $r0.7 = $r0.5
	c0	mov $r0.6 = $r0.4
;;
	c0	ldw $r0.9 = 0[$r0.9]
	c0	sub $r0.10 = $r0.8, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.9, 1
	c0	shl $r0.2 = $r0.11, $r0.10
;;
	c0	br $b0.0, LBB55_22
;;
## BB#14:                               ## %if.end.17
	c0	add $r0.8 = $r0.2, -1
	c0	cmpne $b0.0 = $r0.9, 0
;;
	c0	br $b0.0, LBB55_20
;;
## BB#15:                               ## %if.then.21
	c0	cmpgtu $b0.0 = $r0.10, 30
;;
	c0	br $b0.0, LBB55_18
;;
## BB#16:                               ## %if.then.23
	c0	mov $r0.6 = 1
;;
	c0	shru $r0.6 = $r0.2, $r0.6
;;
	c0	add $r0.7 = $r0.6, $r0.5
;;
	c0	and $r0.8 = $r0.7, $r0.8
	c0	cmpltu $r0.6 = $r0.7, $r0.6
;;
	c0	add $r0.6 = $r0.6, $r0.4
	c0	cmpne $b0.0 = $r0.8, 0
;;
	c0	br $b0.0, LBB55_22
;;
## BB#17:                               ## %if.then.30
	c0	andc $r0.7 = $r0.2, $r0.7
	c0	goto LBB55_22
;;
LBB55_41:                               ## %if.end.102
	c0	mov $r0.7 = 1043
	c0	mov $r0.9 = float_rounding_mode
	c0	mov $r0.8 = 1
	c0	mov $r0.6 = $r0.4
;;
	c0	ldw $r0.9 = 0[$r0.9]
	c0	sub $r0.2 = $r0.7, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.9, 1
	c0	shl $r0.2 = $r0.8, $r0.2
;;
	c0	br $b0.0, LBB55_47
;;
## BB#42:                               ## %if.end.102
	c0	add $r0.7 = $r0.2, -1
	c0	cmpne $b0.0 = $r0.9, 0
;;
	c0	br $b0.0, LBB55_45
;;
## BB#43:                               ## %if.then.111
	c0	shru $r0.6 = $r0.2, $r0.8
;;
	c0	add $r0.6 = $r0.6, $r0.4
;;
	c0	and $r0.7 = $r0.6, $r0.7
;;
	c0	or $r0.7 = $r0.7, $r0.5
;;
	c0	cmpne $b0.0 = $r0.7, 0
;;
	c0	br $b0.0, LBB55_47
;;
## BB#44:                               ## %if.then.120
	c0	andc $r0.6 = $r0.2, $r0.6
	c0	goto LBB55_47
;;
LBB55_20:                               ## %if.then.49
	c0	cmpeq $b0.0 = $r0.9, 2
	c0	mov $r0.9 = 31
	c0	mov $r0.7 = $r0.5
	c0	mov $r0.6 = $r0.4
;;
	c0	mfb $r0.10 = $b0.0
	c0	shru $r0.9 = $r0.4, $r0.9
;;
	c0	cmpeq $b0.0 = $r0.9, $r0.10
;;
	c0	br $b0.0, LBB55_22
;;
## BB#21:                               ## %if.then.55
	c0	add $r0.7 = $r0.8, $r0.5
;;
	c0	cmpltu $r0.6 = $r0.7, $r0.8
;;
	c0	add $r0.6 = $r0.6, $r0.4
	c0	goto LBB55_22
;;
LBB55_45:                               ## %if.then.128
	c0	cmpeq $b0.0 = $r0.9, 2
	c0	mov $r0.8 = 31
	c0	mov $r0.6 = $r0.4
;;
	c0	mfb $r0.9 = $b0.0
	c0	shru $r0.8 = $r0.4, $r0.8
;;
	c0	cmpeq $b0.0 = $r0.8, $r0.9
;;
	c0	br $b0.0, LBB55_47
;;
## BB#46:                               ## %if.then.136
	c0	cmpne $b0.0 = $r0.5, 0
;;
	c0	mfb $r0.6 = $b0.0
;;
	c0	or $r0.6 = $r0.6, $r0.4
;;
	c0	add $r0.6 = $r0.7, $r0.6
;;
LBB55_47:                               ## %if.end.146
	c0	mov $r0.7 = 0
;;
	c0	sub $r0.2 = $r0.7, $r0.2
;;
	c0	and $r0.6 = $r0.6, $r0.2
	c0	goto LBB55_48
;;
LBB55_32:                               ## %sw.bb.95
	c0	cmpeq $b0.0 = $r0.7, 0
;;
	c0	br $b0.0, LBB55_36
;;
## BB#33:                               ## %cond.true
	c0	mov $r0.2 = -1074790400
	c0	goto LBB55_34
;;
LBB55_28:                               ## %if.end.77
	c0	cmpne $b0.0 = $r0.8, 0
;;
	c0	br $b0.0, LBB55_40
;;
## BB#29:                               ## %sw.bb
	c0	cmpne $b0.0 = $r0.2, 1022
;;
	c0	br $b0.0, LBB55_40
;;
## BB#30:                               ## %land.lhs.true.84
	c0	and $r0.2 = $r0.4, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.5
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB55_40
;;
## BB#31:                               ## %if.then.93
	c0	shl $r0.2 = $r0.7, $r0.6
	c0	mov $r0.4 = 0
;;
	c0	or $r0.2 = $r0.2, 1072693248
	c0	goto LBB55_35
;;
LBB55_40:                               ## %sw.epilog
	c0	shl $r0.2 = $r0.7, $r0.6
	c0	goto LBB55_34
;;
LBB55_5:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB55_9
;;
LBB55_18:                               ## %if.else
	c0	cmpgt $b0.0 = $r0.5, -1
	c0	mov $r0.7 = $r0.5
	c0	mov $r0.6 = $r0.4
;;
	c0	br $b0.0, LBB55_22
;;
## BB#19:                               ## %if.then.36
	c0	and $r0.6 = $r0.5, 2147483647
	c0	add $r0.8 = $r0.4, 1
	c0	mov $r0.7 = $r0.5
;;
	c0	and $r0.9 = $r0.8, -2
	c0	cmpeq $b0.0 = $r0.6, 0
;;
	c0	slct $r0.6 = $b0.0, $r0.9, $r0.8
;;
LBB55_22:                               ## %if.end.62
	c0	mov $r0.8 = 0
;;
	c0	sub $r0.2 = $r0.8, $r0.2
;;
	c0	and $r0.7 = $r0.7, $r0.2
;;
LBB55_48:                               ## %if.end.150
	c0	cmpne $b0.0 = $r0.7, $r0.5
;;
	c0	br $b0.0, LBB55_50
;;
## BB#49:                               ## %if.end.150
	c0	cmpeq $b0.0 = $r0.6, $r0.4
;;
	c0	br $b0.0, LBB55_51
;;
LBB55_50:                               ## %if.then.159
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
;;
	c0	or $r0.4 = $r0.4, 1
;;
	c0	stw 0[$r0.2] = $r0.4
;;
LBB55_51:                               ## %if.end.161
	c0	stw 4[$r0.3] = $r0.6
;;
.return ret()
	c0	stw 0[$r0.3] = $r0.7
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB55_39:                               ## %cond.false.100
	c0	mov $r0.2 = 1072693248
;;
LBB55_34:                               ## %cleanup
	c0	mov $r0.4 = 0
;;
LBB55_35:                               ## %cleanup
	c0	stw 0[$r0.3] = $r0.2
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB55_36:                               ## %cond.false
	c0	mov $r0.2 = 0
;;
	c0	stw 0[$r0.3] = $r0.2
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.2
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB55_8:                                ## %lor.rhs.i.i
	c0	and $r0.2 = $r0.4, 524287
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
LBB55_9:                                ## %float64_is_signaling_nan.exit.i
	c0	or $r0.2 = $r0.4, 524288
	c0	br $b0.0, LBB55_11
;;
## BB#10:                               ## %float64_is_signaling_nan.exit.i
	c0	mfb $r0.4 = $b0.0
;;
	c0	cmpne $b0.1 = $r0.4, 1
;;
	c0	br $b0.1, LBB55_12
;;
LBB55_11:                               ## %if.then.i
	c0	mov $r0.4 = float_exception_flags
;;
	c0	ldw $r0.6 = 0[$r0.4]
;;
	c0	or $r0.6 = $r0.6, 16
;;
	c0	stw 0[$r0.4] = $r0.6
;;
LBB55_12:                               ## %cond.false.i
	c0	stw 0[$r0.3] = $r0.2
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.5
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
	c0	shru $r0.9 = $r0.6, $r0.2
	c0	shru $r0.8 = $r0.4, $r0.2
;;
	c0	cmpne $b0.0 = $r0.8, $r0.9
;;
	c0	br $b0.0, LBB56_2
;;
## BB#1:                                ## %if.then
.call addFloat64Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = addFloat64Sigs
;;
.return ret()
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB56_2:                                ## %if.else
.call subFloat64Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = subFloat64Sigs
;;
.return ret()
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
	c0	shru $r0.9 = $r0.6, $r0.2
	c0	shru $r0.2 = $r0.4, $r0.2
;;
	c0	and $r0.12 = $r0.9, 2047
	c0	and $r0.2 = $r0.2, 2047
;;
	c0	sub $r0.13 = $r0.2, $r0.12
	c0	and $r0.11 = $r0.4, 1048575
	c0	and $r0.10 = $r0.6, 1048575
;;
	c0	cmplt $b0.0 = $r0.13, 1
;;
	c0	br $b0.0, LBB57_31
;;
## BB#1:                                ## %if.then
	c0	cmpne $b0.0 = $r0.2, 2047
;;
	c0	br $b0.0, LBB57_19
;;
## BB#2:                                ## %if.then.22
	c0	or $r0.2 = $r0.11, $r0.5
	c0	goto LBB57_3
;;
LBB57_31:                               ## %if.else.33
	c0	cmpgt $b0.0 = $r0.13, -1
;;
	c0	brf $b0.0, LBB57_32
;;
## BB#58:                               ## %if.else.53
	c0	cmpne $b0.0 = $r0.2, 2047
;;
	c0	br $b0.0, LBB57_61
;;
## BB#59:                               ## %if.then.55
	c0	or $r0.2 = $r0.11, $r0.5
;;
	c0	or $r0.2 = $r0.2, $r0.10
;;
	c0	or $r0.2 = $r0.2, $r0.7
;;
LBB57_3:                                ## %if.then.22
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB57_18
;;
## BB#4:                                ## %if.then.23
	c0	and $r0.2 = $r0.4, 2146959360
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
	c0	br $b0.0, LBB57_5
;;
## BB#6:                                ## %land.rhs.i.59.i.247
	c0	cmpne $b0.0 = $r0.5, 0
;;
	c0	brf $b0.0, LBB57_8
;;
## BB#7:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB57_9
;;
LBB57_19:                               ## %if.end.28
	c0	cmpeq $b0.0 = $r0.12, 0
;;
	c0	br $b0.0, LBB57_21
;;
## BB#20:                               ## %if.end.32.thread
	c0	mov $r0.4 = 0
	c0	or $r0.10 = $r0.10, 1048576
	c0	mov $r0.6 = $r0.13
	c0	goto LBB57_23
;;
LBB57_32:                               ## %if.then.35
	c0	cmpne $b0.0 = $r0.12, 2047
;;
	c0	br $b0.0, LBB57_48
;;
## BB#33:                               ## %if.then.37
	c0	or $r0.2 = $r0.10, $r0.7
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB57_47
;;
## BB#34:                               ## %if.then.40
	c0	and $r0.2 = $r0.4, 2146959360
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
	c0	br $b0.0, LBB57_35
;;
## BB#36:                               ## %land.rhs.i.59.i.162
	c0	cmpne $b0.0 = $r0.5, 0
;;
	c0	brf $b0.0, LBB57_38
;;
## BB#37:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB57_39
;;
LBB57_5:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB57_9
;;
LBB57_61:                               ## %if.end.66
	c0	add $r0.4 = $r0.7, $r0.5
	c0	add $r0.5 = $r0.10, $r0.11
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	cmpltu $r0.6 = $r0.4, $r0.7
;;
	c0	add $r0.5 = $r0.5, $r0.6
	c0	brf $b0.0, LBB57_62
;;
## BB#67:                               ## %if.end.69
	c0	or $r0.6 = $r0.5, 2097152
	c0	mov $r0.9 = 0
	c0	goto LBB57_68
;;
LBB57_21:                               ## %if.end.32
	c0	add $r0.6 = $r0.13, -1
;;
	c0	cmpeq $b0.0 = $r0.6, 0
;;
	c0	br $b0.0, LBB57_64
;;
## BB#22:
	c0	mov $r0.4 = 1
;;
LBB57_23:                               ## %if.else.i.212
	c0	sub $r0.4 = $r0.4, $r0.13
	c0	cmpgt $b0.0 = $r0.6, 31
;;
	c0	and $r0.9 = $r0.4, 31
	c0	br $b0.0, LBB57_25
;;
## BB#24:                               ## %if.then.2.i.218
	c0	shru $r0.12 = $r0.7, $r0.6
	c0	shl $r0.13 = $r0.10, $r0.9
	c0	shl $r0.9 = $r0.7, $r0.9
	c0	shru $r0.4 = $r0.10, $r0.6
	c0	mov $r0.7 = 0
;;
	c0	or $r0.10 = $r0.13, $r0.12
	c0	goto LBB57_30
;;
LBB57_25:                               ## %if.else.5.i.220
	c0	mov $r0.4 = 0
	c0	cmpeq $b0.0 = $r0.6, 32
;;
	c0	brf $b0.0, LBB57_27
;;
## BB#26:
	c0	mov $r0.9 = $r0.7
	c0	mov $r0.7 = $r0.4
	c0	goto LBB57_30
;;
LBB57_48:                               ## %if.end.46
	c0	cmpeq $b0.0 = $r0.2, 0
	c0	or $r0.2 = $r0.11, 1048576
	c0	mov $r0.9 = 0
;;
	c0	mfb $r0.4 = $b0.0
	c0	slct $r0.11 = $b0.0, $r0.11, $r0.2
;;
	c0	add $r0.13 = $r0.13, $r0.4
;;
	c0	cmpeq $b0.0 = $r0.13, 0
;;
	c0	br $b0.0, LBB57_49
;;
## BB#50:                               ## %if.else.i
	c0	sub $r0.2 = $r0.9, $r0.13
	c0	and $r0.6 = $r0.13, 31
	c0	cmplt $b0.0 = $r0.13, -31
;;
	c0	br $b0.0, LBB57_52
;;
## BB#51:                               ## %if.then.2.i
	c0	shru $r0.9 = $r0.5, $r0.2
	c0	shl $r0.13 = $r0.11, $r0.6
	c0	shl $r0.6 = $r0.5, $r0.6
	c0	shru $r0.4 = $r0.11, $r0.2
	c0	mov $r0.5 = 0
;;
	c0	or $r0.11 = $r0.13, $r0.9
	c0	goto LBB57_57
;;
LBB57_27:                               ## %if.else.8.i.222
	c0	cmpgt $b0.0 = $r0.6, 63
;;
	c0	br $b0.0, LBB57_29
;;
## BB#28:                               ## %if.then.11.i.226
	c0	and $r0.6 = $r0.6, 31
	c0	shl $r0.9 = $r0.10, $r0.9
;;
	c0	shru $r0.10 = $r0.10, $r0.6
	c0	goto LBB57_30
;;
LBB57_8:                                ## %lor.rhs.i.62.i.250
	c0	and $r0.2 = $r0.4, 524287
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
LBB57_9:                                ## %float64_is_signaling_nan.exit64.i.253
	c0	and $r0.2 = $r0.6, 2146959360
;;
	c0	cmpne $b0.1 = $r0.2, 2146435072
;;
	c0	br $b0.1, LBB57_10
;;
## BB#11:                               ## %land.rhs.i.i.263
	c0	cmpeq $b0.1 = $r0.7, 0
;;
	c0	brf $b0.1, LBB57_12
;;
## BB#13:                               ## %lor.rhs.i.i.270
	c0	and $r0.2 = $r0.6, 524287
;;
	c0	cmpne $b0.1 = $r0.2, 0
	c0	goto LBB57_14
;;
LBB57_10:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.1 = $r0.2
;;
LBB57_14:                               ## %float64_is_signaling_nan.exit.i.274
	c0	mfb $r0.9 = $b0.1
	c0	mfb $r0.8 = $b0.0
	c0	or $r0.2 = $r0.6, 524288
;;
	c0	or $r0.9 = $r0.8, $r0.9
;;
	c0	and $r0.9 = $r0.9, 1
;;
	c0	cmpeq $b0.0 = $r0.9, 0
;;
	c0	br $b0.0, LBB57_17
;;
## BB#15:                               ## %if.then.i.277
	c0	mov $r0.9 = float_exception_flags
;;
	c0	ldw $r0.11 = 0[$r0.9]
;;
	c0	or $r0.11 = $r0.11, 16
;;
	c0	stw 0[$r0.9] = $r0.11
	c0	br $b0.1, LBB57_16
;;
LBB57_17:                               ## %cond.false.i.285
	c0	or $r0.4 = $r0.4, 524288
	c0	cmpne $b0.0 = $r0.8, 1
;;
	c0	brf $b0.0, LBB57_18
;;
## BB#60:                               ## %cond.false.22.i.288
	c0	mov $r0.8 = 1
	c0	or $r0.9 = $r0.10, $r0.7
;;
	c0	shl $r0.6 = $r0.6, $r0.8
	c0	cmpne $b0.0 = $r0.9, 0
;;
	c0	cmpgtu $b0.1 = $r0.6, -2097153
	c0	mfb $r0.6 = $b0.0
;;
	c0	mfb $r0.8 = $b0.1
;;
	c0	and $r0.6 = $r0.8, $r0.6
;;
	c0	mtb $b0.0 = $r0.6
;;
	c0	mfb $r0.6 = $b0.0
;;
	c0	cmpne $b0.0 = $r0.6, 1
;;
	c0	brf $b0.0, LBB57_16
;;
	c0	goto LBB57_18
;;
LBB57_62:                               ## %if.then.68
	c0	mov $r0.2 = 31
;;
	c0	shl $r0.2 = $r0.8, $r0.2
;;
	c0	or $r0.2 = $r0.5, $r0.2
	c0	goto LBB57_63
;;
LBB57_64:
	c0	mov $r0.9 = 0
	c0	goto LBB57_65
;;
LBB57_29:                               ## %if.else.15.i.231
	c0	cmpne $b0.0 = $r0.10, 0
	c0	mov $r0.4 = 0
	c0	cmpeq $b0.1 = $r0.6, 64
;;
	c0	mfb $r0.6 = $b0.0
;;
	c0	slct $r0.9 = $b0.1, $r0.10, $r0.6
	c0	mov $r0.10 = $r0.4
;;
LBB57_30:                               ## %if.end.19.i.239
	c0	cmpne $b0.0 = $r0.7, 0
	c0	mov $r0.6 = $r0.10
;;
	c0	mfb $r0.7 = $b0.0
;;
	c0	or $r0.9 = $r0.7, $r0.9
	c0	mov $r0.10 = $r0.4
	c0	mov $r0.7 = $r0.6
;;
LBB57_65:                               ## %if.end.72
	c0	add $r0.4 = $r0.7, $r0.5
	c0	or $r0.5 = $r0.11, 1048576
;;
	c0	cmpltu $r0.6 = $r0.4, $r0.7
	c0	add $r0.5 = $r0.10, $r0.5
;;
	c0	add $r0.6 = $r0.5, $r0.6
;;
	c0	cmpltu $b0.0 = $r0.6, 2097152
;;
	c0	brf $b0.0, LBB57_68
;;
## BB#66:
	c0	add $r0.2 = $r0.2, -1
	c0	goto LBB57_69
;;
LBB57_68:                               ## %shiftRight1
	c0	mov $r0.5 = 31
	c0	cmpne $b0.0 = $r0.9, 0
	c0	mov $r0.7 = 1
;;
	c0	shl $r0.10 = $r0.6, $r0.5
	c0	shl $r0.5 = $r0.4, $r0.5
	c0	mfb $r0.9 = $b0.0
	c0	shru $r0.4 = $r0.4, $r0.7
	c0	shru $r0.6 = $r0.6, $r0.7
;;
	c0	or $r0.9 = $r0.9, $r0.5
	c0	or $r0.4 = $r0.4, $r0.10
;;
LBB57_69:                               ## %roundAndPack
	c0	mov $r0.7 = $r0.4
	c0	mov $r0.5 = $r0.2
	c0	mov $r0.4 = $r0.8
	c0	mov $r0.8 = $r0.9
;;
.call roundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = roundAndPackFloat64
;;
.return ret()
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB57_47:                               ## %if.end.45
	c0	mov $r0.2 = 31
	c0	mov $r0.4 = 0
;;
	c0	shl $r0.2 = $r0.8, $r0.2
;;
	c0	or $r0.2 = $r0.2, 2146435072
;;
LBB57_63:                               ## %cleanup
	c0	stw 0[$r0.3] = $r0.2
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.4
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB57_49:
	c0	mov $r0.2 = $r0.12
	c0	goto LBB57_65
;;
LBB57_35:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB57_39
;;
LBB57_52:                               ## %if.else.5.i
	c0	mov $r0.4 = 0
	c0	cmpeq $b0.0 = $r0.2, 32
;;
	c0	brf $b0.0, LBB57_54
;;
## BB#53:
	c0	mov $r0.6 = $r0.5
	c0	mov $r0.5 = $r0.4
	c0	goto LBB57_57
;;
LBB57_54:                               ## %if.else.8.i
	c0	cmplt $b0.0 = $r0.13, -63
;;
	c0	br $b0.0, LBB57_56
;;
## BB#55:                               ## %if.then.11.i
	c0	and $r0.2 = $r0.2, 31
	c0	shl $r0.6 = $r0.11, $r0.6
;;
	c0	shru $r0.11 = $r0.11, $r0.2
	c0	goto LBB57_57
;;
LBB57_38:                               ## %lor.rhs.i.62.i.165
	c0	and $r0.2 = $r0.4, 524287
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
LBB57_39:                               ## %float64_is_signaling_nan.exit64.i.168
	c0	and $r0.2 = $r0.6, 2146959360
;;
	c0	cmpne $b0.1 = $r0.2, 2146435072
;;
	c0	br $b0.1, LBB57_40
;;
## BB#41:                               ## %land.rhs.i.i.178
	c0	cmpeq $b0.1 = $r0.7, 0
;;
	c0	br $b0.1, LBB57_42
;;
LBB57_12:                               ## %if.then.thread.i.267
	c0	mov $r0.4 = float_exception_flags
;;
	c0	ldw $r0.5 = 0[$r0.4]
	c0	or $r0.2 = $r0.6, 524288
;;
	c0	or $r0.5 = $r0.5, 16
;;
	c0	stw 0[$r0.4] = $r0.5
;;
LBB57_16:                               ## %cond.true.i.283
	c0	stw 0[$r0.3] = $r0.2
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.7
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB57_40:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.1 = $r0.2
	c0	goto LBB57_43
;;
LBB57_42:                               ## %lor.rhs.i.i.185
	c0	and $r0.2 = $r0.6, 524287
;;
	c0	cmpne $b0.1 = $r0.2, 0
;;
LBB57_43:                               ## %float64_is_signaling_nan.exit.i.189
	c0	mfb $r0.9 = $b0.1
	c0	mfb $r0.8 = $b0.0
	c0	or $r0.2 = $r0.6, 524288
;;
	c0	or $r0.9 = $r0.8, $r0.9
;;
	c0	and $r0.9 = $r0.9, 1
;;
	c0	cmpeq $b0.0 = $r0.9, 0
;;
	c0	br $b0.0, LBB57_45
;;
## BB#44:                               ## %if.then.i.192
	c0	mov $r0.9 = float_exception_flags
;;
	c0	ldw $r0.10 = 0[$r0.9]
;;
	c0	or $r0.10 = $r0.10, 16
;;
	c0	stw 0[$r0.9] = $r0.10
	c0	br $b0.1, LBB57_16
;;
LBB57_45:                               ## %cond.false.i.200
	c0	or $r0.4 = $r0.4, 524288
	c0	cmpne $b0.0 = $r0.8, 1
;;
	c0	brf $b0.0, LBB57_18
;;
## BB#46:                               ## %cond.false.22.i.203
	c0	mov $r0.8 = 1
;;
	c0	shl $r0.6 = $r0.6, $r0.8
;;
	c0	cmpltu $b0.0 = $r0.6, -2097152
;;
	c0	brf $b0.0, LBB57_16
;;
LBB57_18:                               ## %cond.true.21.i.287
	c0	stw 0[$r0.3] = $r0.4
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.5
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB57_56:                               ## %if.else.15.i
	c0	cmpne $b0.0 = $r0.11, 0
	c0	mov $r0.4 = 0
	c0	cmpeq $b0.1 = $r0.2, 64
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	slct $r0.6 = $b0.1, $r0.11, $r0.2
	c0	mov $r0.11 = $r0.4
;;
LBB57_57:                               ## %if.end.19.i
	c0	cmpne $b0.0 = $r0.5, 0
	c0	mov $r0.5 = $r0.11
	c0	mov $r0.2 = $r0.12
	c0	mov $r0.11 = $r0.4
;;
	c0	mfb $r0.4 = $b0.0
;;
	c0	or $r0.9 = $r0.4, $r0.6
	c0	goto LBB57_65
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @subFloat64Sigs
subFloat64Sigs::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
	c0	mov $r0.9 = 20
	c0	mov $r0.11 = 10
	c0	mov $r0.10 = 22
	c0	and $r0.2 = $r0.6, 1048575
;;
	c0	shru $r0.12 = $r0.6, $r0.9
	c0	shru $r0.9 = $r0.4, $r0.9
	c0	shl $r0.15 = $r0.4, $r0.11
	c0	shru $r0.16 = $r0.7, $r0.10
	c0	shru $r0.17 = $r0.5, $r0.10
	c0	shl $r0.18 = $r0.2, $r0.11
;;
	c0	and $r0.13 = $r0.12, 2047
	c0	and $r0.14 = $r0.9, 2047
	c0	and $r0.12 = $r0.15, 1073740800
;;
	c0	sub $r0.15 = $r0.14, $r0.13
	c0	shl $r0.10 = $r0.5, $r0.11
	c0	shl $r0.11 = $r0.7, $r0.11
	c0	or $r0.9 = $r0.16, $r0.18
	c0	or $r0.12 = $r0.17, $r0.12
;;
	c0	cmpgt $b0.0 = $r0.15, 0
;;
	c0	brf $b0.0, LBB58_1
;;
## BB#42:                               ## %aExpBigger
	c0	cmpne $b0.0 = $r0.14, 2047
;;
	c0	br $b0.0, LBB58_45
;;
## BB#43:                               ## %if.then.75
	c0	or $r0.8 = $r0.12, $r0.10
;;
	c0	cmpeq $b0.0 = $r0.8, 0
;;
	c0	brf $b0.0, LBB58_5
;;
	c0	goto LBB58_19
;;
LBB58_1:                                ## %if.end
	c0	cmplt $b0.0 = $r0.15, 0
;;
	c0	br $b0.0, LBB58_27
;;
## BB#2:                                ## %if.end.23
	c0	cmpeq $b0.0 = $r0.14, 0
;;
	c0	brf $b0.0, LBB58_3
;;
## BB#21:                               ## %if.then.38
	c0	mov $r0.13 = 1
;;
	c0	mov $r0.14 = $r0.13
	c0	goto LBB58_22
;;
LBB58_45:                               ## %if.end.84
	c0	cmpeq $b0.0 = $r0.13, 0
;;
	c0	br $b0.0, LBB58_47
;;
## BB#46:                               ## %if.end.90.thread
	c0	mov $r0.4 = 0
	c0	or $r0.9 = $r0.9, 1073741824
	c0	mov $r0.2 = $r0.15
	c0	goto LBB58_49
;;
LBB58_27:                               ## %bExpBigger
	c0	cmpne $b0.0 = $r0.13, 2047
;;
	c0	br $b0.0, LBB58_30
;;
## BB#28:                               ## %if.then.55
	c0	or $r0.9 = $r0.9, $r0.11
;;
	c0	cmpeq $b0.0 = $r0.9, 0
;;
	c0	brf $b0.0, LBB58_5
;;
## BB#29:                               ## %if.end.63
	c0	mov $r0.2 = 31
	c0	mov $r0.4 = 0
;;
	c0	shl $r0.2 = $r0.8, $r0.2
;;
	c0	add $r0.2 = $r0.2, -1048576
;;
	c0	stw 0[$r0.3] = $r0.2
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.4
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB58_3:                                ## %if.end.23
	c0	cmpne $b0.0 = $r0.14, 2047
;;
	c0	br $b0.0, LBB58_22
;;
## BB#4:                                ## %if.then.25
	c0	or $r0.8 = $r0.12, $r0.10
;;
	c0	or $r0.8 = $r0.8, $r0.11
;;
	c0	or $r0.8 = $r0.8, $r0.9
;;
	c0	cmpeq $b0.0 = $r0.8, 0
;;
	c0	br $b0.0, LBB58_20
;;
LBB58_5:                                ## %if.then.28
	c0	and $r0.8 = $r0.4, 2146959360
;;
	c0	cmpne $b0.0 = $r0.8, 2146435072
;;
	c0	br $b0.0, LBB58_6
;;
## BB#7:                                ## %land.rhs.i.59.i.251
	c0	cmpne $b0.0 = $r0.5, 0
;;
	c0	brf $b0.0, LBB58_9
;;
## BB#8:
	c0	mov $r0.8 = -1
;;
	c0	mtb $b0.0 = $r0.8
	c0	goto LBB58_10
;;
LBB58_22:                               ## %if.end.39
	c0	cmpltu $b0.0 = $r0.9, $r0.12
;;
	c0	br $b0.0, LBB58_57
;;
## BB#23:                               ## %if.end.42
	c0	cmpltu $b0.0 = $r0.12, $r0.9
;;
	c0	br $b0.0, LBB58_41
;;
## BB#24:                               ## %if.end.45
	c0	cmpltu $b0.0 = $r0.11, $r0.10
;;
	c0	br $b0.0, LBB58_57
;;
## BB#25:                               ## %if.end.48
	c0	cmpltu $b0.0 = $r0.10, $r0.11
;;
	c0	br $b0.0, LBB58_41
;;
## BB#26:                               ## %if.end.51
	c0	mov $r0.2 = float_rounding_mode
	c0	mov $r0.4 = 31
	c0	mov $r0.5 = 0
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
	c0	cmpeq $b0.0 = $r0.2, 3
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	shl $r0.2 = $r0.2, $r0.4
;;
	c0	stw 0[$r0.3] = $r0.2
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.5
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB58_6:
	c0	mov $r0.8 = 0
;;
	c0	mtb $b0.0 = $r0.8
	c0	goto LBB58_10
;;
LBB58_47:                               ## %if.end.90
	c0	add $r0.2 = $r0.15, -1
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB58_56
;;
## BB#48:
	c0	mov $r0.4 = 1
;;
LBB58_49:                               ## %if.else.i
	c0	sub $r0.4 = $r0.4, $r0.15
	c0	cmpgt $b0.0 = $r0.2, 31
;;
	c0	and $r0.4 = $r0.4, 31
	c0	br $b0.0, LBB58_51
;;
## BB#50:                               ## %if.then.2.i
	c0	shl $r0.5 = $r0.11, $r0.4
	c0	shl $r0.4 = $r0.9, $r0.4
	c0	shru $r0.6 = $r0.11, $r0.2
	c0	shru $r0.9 = $r0.9, $r0.2
;;
	c0	cmpne $b0.0 = $r0.5, 0
	c0	or $r0.2 = $r0.4, $r0.6
;;
	c0	mfb $r0.4 = $b0.0
;;
	c0	or $r0.11 = $r0.2, $r0.4
	c0	goto LBB58_56
;;
LBB58_51:                               ## %if.else.7.i
	c0	cmpne $b0.0 = $r0.2, 32
;;
	c0	br $b0.0, LBB58_53
;;
## BB#52:                               ## %if.then.10.i
	c0	cmpne $b0.0 = $r0.11, 0
	c0	mov $r0.2 = 0
;;
	c0	mfb $r0.4 = $b0.0
;;
	c0	or $r0.11 = $r0.9, $r0.4
	c0	mov $r0.9 = $r0.2
	c0	goto LBB58_56
;;
LBB58_30:                               ## %if.end.64
	c0	cmpeq $b0.0 = $r0.14, 0
	c0	or $r0.2 = $r0.12, 1073741824
;;
	c0	mfb $r0.4 = $b0.0
	c0	slct $r0.2 = $b0.0, $r0.12, $r0.2
;;
	c0	add $r0.6 = $r0.15, $r0.4
;;
	c0	cmpeq $b0.0 = $r0.6, 0
;;
	c0	br $b0.0, LBB58_31
;;
## BB#32:                               ## %if.else.i.160
	c0	mov $r0.12 = 0
	c0	and $r0.5 = $r0.6, 31
	c0	cmplt $b0.0 = $r0.6, -31
;;
	c0	sub $r0.4 = $r0.12, $r0.6
	c0	br $b0.0, LBB58_34
;;
## BB#33:                               ## %if.then.2.i.169
	c0	shl $r0.6 = $r0.10, $r0.5
	c0	shl $r0.5 = $r0.2, $r0.5
	c0	shru $r0.7 = $r0.10, $r0.4
	c0	shru $r0.12 = $r0.2, $r0.4
;;
	c0	cmpne $b0.0 = $r0.6, 0
	c0	or $r0.2 = $r0.5, $r0.7
	c0	goto LBB58_36
;;
LBB58_53:                               ## %if.else.14.i
	c0	cmpgt $b0.0 = $r0.2, 63
;;
	c0	br $b0.0, LBB58_55
;;
## BB#54:                               ## %if.then.17.i
	c0	shl $r0.4 = $r0.9, $r0.4
	c0	and $r0.2 = $r0.2, 31
	c0	mov $r0.5 = 0
;;
	c0	shru $r0.2 = $r0.9, $r0.2
	c0	or $r0.4 = $r0.4, $r0.11
	c0	mov $r0.9 = $r0.5
;;
	c0	cmpne $b0.0 = $r0.4, 0
;;
	c0	mfb $r0.4 = $b0.0
;;
	c0	or $r0.11 = $r0.4, $r0.2
	c0	goto LBB58_56
;;
LBB58_9:                                ## %lor.rhs.i.62.i.254
	c0	and $r0.8 = $r0.4, 524287
;;
	c0	cmpne $b0.0 = $r0.8, 0
;;
LBB58_10:                               ## %float64_is_signaling_nan.exit64.i.257
	c0	and $r0.8 = $r0.6, 2146959360
;;
	c0	cmpne $b0.1 = $r0.8, 2146435072
;;
	c0	br $b0.1, LBB58_11
;;
## BB#12:                               ## %land.rhs.i.i.267
	c0	cmpeq $b0.1 = $r0.7, 0
;;
	c0	br $b0.1, LBB58_14
;;
## BB#13:                               ## %if.then.thread.i.271
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
	c0	or $r0.8 = $r0.6, 524288
;;
	c0	or $r0.4 = $r0.4, 16
;;
	c0	stw 0[$r0.2] = $r0.4
	c0	goto LBB58_17
;;
LBB58_11:
	c0	mov $r0.8 = 0
;;
	c0	mtb $b0.1 = $r0.8
	c0	goto LBB58_15
;;
LBB58_14:                               ## %lor.rhs.i.i.274
	c0	and $r0.8 = $r0.6, 524287
;;
	c0	cmpne $b0.1 = $r0.8, 0
;;
LBB58_15:                               ## %float64_is_signaling_nan.exit.i.278
	c0	mfb $r0.10 = $b0.1
	c0	mfb $r0.9 = $b0.0
	c0	or $r0.8 = $r0.6, 524288
;;
	c0	or $r0.10 = $r0.9, $r0.10
;;
	c0	and $r0.10 = $r0.10, 1
;;
	c0	cmpeq $b0.0 = $r0.10, 0
;;
	c0	br $b0.0, LBB58_18
;;
## BB#16:                               ## %if.then.i.281
	c0	mov $r0.10 = float_exception_flags
;;
	c0	ldw $r0.11 = 0[$r0.10]
;;
	c0	or $r0.11 = $r0.11, 16
;;
	c0	stw 0[$r0.10] = $r0.11
	c0	br $b0.1, LBB58_17
;;
LBB58_18:                               ## %cond.false.i.289
	c0	or $r0.4 = $r0.4, 524288
	c0	cmpne $b0.0 = $r0.9, 1
;;
	c0	brf $b0.0, LBB58_19
;;
## BB#44:                               ## %cond.false.22.i.292
	c0	mov $r0.9 = 1
	c0	or $r0.2 = $r0.2, $r0.7
;;
	c0	shl $r0.6 = $r0.6, $r0.9
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	cmpgtu $b0.1 = $r0.6, -2097153
	c0	mfb $r0.2 = $b0.0
;;
	c0	mfb $r0.6 = $b0.1
;;
	c0	and $r0.2 = $r0.6, $r0.2
;;
	c0	mtb $b0.0 = $r0.2
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	cmpne $b0.0 = $r0.2, 1
;;
	c0	br $b0.0, LBB58_19
;;
LBB58_17:                               ## %cond.true.i.287
	c0	stw 0[$r0.3] = $r0.8
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.7
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB58_19:                               ## %cond.true.21.i.291
	c0	stw 0[$r0.3] = $r0.4
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.5
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB58_55:                               ## %if.else.25.i
	c0	or $r0.2 = $r0.9, $r0.11
	c0	mov $r0.9 = 0
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	mfb $r0.11 = $b0.0
;;
LBB58_56:                               ## %shift64RightJamming.exit
	c0	or $r0.12 = $r0.12, 1073741824
;;
LBB58_57:                               ## %aBigger
	c0	mov $r0.13 = $r0.14
	c0	cmpltu $r0.2 = $r0.10, $r0.11
	c0	mov $r0.4 = -1
	c0	sub $r0.5 = $r0.12, $r0.9
;;
	c0	mtb $b0.0 = $r0.2
	c0	sub $r0.7 = $r0.10, $r0.11
	c0	goto LBB58_58
;;
LBB58_31:
	c0	mov $r0.12 = $r0.2
	c0	goto LBB58_40
;;
LBB58_20:                               ## %if.end.33
	c0	mov $r0.2 = float_exception_flags
	c0	mov $r0.4 = 2147483647
	c0	mov $r0.5 = -1
;;
	c0	ldw $r0.6 = 0[$r0.2]
;;
	c0	stw 0[$r0.3] = $r0.4
;;
	c0	stw 4[$r0.3] = $r0.5
	c0	or $r0.3 = $r0.6, 16
;;
.return ret()
	c0	stw 0[$r0.2] = $r0.3
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB58_34:                               ## %if.else.7.i.171
	c0	cmpne $b0.0 = $r0.4, 32
;;
	c0	br $b0.0, LBB58_37
;;
## BB#35:                               ## %if.then.10.i.175
	c0	cmpne $b0.0 = $r0.10, 0
;;
LBB58_36:                               ## %shift64RightJamming.exit192
	c0	mfb $r0.4 = $b0.0
;;
	c0	or $r0.10 = $r0.2, $r0.4
;;
LBB58_40:                               ## %shift64RightJamming.exit192
	c0	or $r0.9 = $r0.9, 1073741824
;;
LBB58_41:                               ## %bBigger
	c0	cmpltu $r0.2 = $r0.11, $r0.10
	c0	mov $r0.4 = -1
	c0	sub $r0.5 = $r0.9, $r0.12
	c0	sub $r0.7 = $r0.11, $r0.10
	c0	xor $r0.8 = $r0.8, 1
;;
	c0	mtb $b0.0 = $r0.2
;;
LBB58_58:                               ## %normalizeRoundAndPack
	c0	slct $r0.2 = $b0.0, $r0.4, 0
;;
	c0	add $r0.6 = $r0.5, $r0.2
	c0	add $r0.5 = $r0.13, -11
	c0	mov $r0.4 = $r0.8
;;
.call normalizeRoundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = normalizeRoundAndPackFloat64
;;
.return ret()
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB58_37:                               ## %if.else.14.i.177
	c0	cmplt $b0.0 = $r0.6, -63
;;
	c0	br $b0.0, LBB58_39
;;
## BB#38:                               ## %if.then.17.i.185
	c0	shl $r0.5 = $r0.2, $r0.5
	c0	and $r0.4 = $r0.4, 31
;;
	c0	or $r0.5 = $r0.5, $r0.10
	c0	shru $r0.2 = $r0.2, $r0.4
;;
	c0	cmpne $b0.0 = $r0.5, 0
;;
	c0	mfb $r0.4 = $b0.0
;;
	c0	or $r0.10 = $r0.4, $r0.2
	c0	goto LBB58_40
;;
LBB58_39:                               ## %if.else.25.i.189
	c0	or $r0.2 = $r0.2, $r0.10
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	mfb $r0.10 = $b0.0
	c0	goto LBB58_40
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
	c0	shru $r0.9 = $r0.6, $r0.2
	c0	shru $r0.8 = $r0.4, $r0.2
;;
	c0	cmpne $b0.0 = $r0.8, $r0.9
;;
	c0	br $b0.0, LBB59_2
;;
## BB#1:                                ## %if.then
.call subFloat64Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = subFloat64Sigs
;;
.return ret()
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB59_2:                                ## %if.else
.call addFloat64Sigs, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = addFloat64Sigs
;;
.return ret()
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
	c0	mov $r0.12 = 20
	c0	mov $r0.2 = $r0.4
	c0	mov $r0.9 = 31
;;
	c0	xor $r0.4 = $r0.6, $r0.2
	c0	shru $r0.8 = $r0.2, $r0.12
	c0	shru $r0.14 = $r0.6, $r0.12
;;
	c0	and $r0.10 = $r0.8, 2047
	c0	and $r0.11 = $r0.6, 1048575
	c0	and $r0.13 = $r0.2, 1048575
	c0	shru $r0.4 = $r0.4, $r0.9
;;
	c0	and $r0.8 = $r0.14, 2047
	c0	cmpne $b0.0 = $r0.10, 2047
;;
	c0	br $b0.0, LBB60_22
;;
## BB#1:                                ## %if.then
	c0	or $r0.10 = $r0.13, $r0.5
;;
	c0	cmpne $b0.0 = $r0.10, 0
;;
	c0	br $b0.0, LBB60_4
;;
## BB#2:                                ## %lor.lhs.false
	c0	or $r0.10 = $r0.11, $r0.7
	c0	cmpne $b0.0 = $r0.8, 2047
;;
	c0	br $b0.0, LBB60_20
;;
## BB#3:                                ## %lor.lhs.false
	c0	cmpeq $b0.0 = $r0.10, 0
;;
	c0	br $b0.0, LBB60_20
;;
LBB60_4:                                ## %if.then.30
	c0	and $r0.4 = $r0.2, 2146959360
;;
	c0	cmpne $b0.0 = $r0.4, 2146435072
;;
	c0	br $b0.0, LBB60_5
;;
## BB#6:                                ## %land.rhs.i.59.i.213
	c0	cmpne $b0.0 = $r0.5, 0
;;
	c0	brf $b0.0, LBB60_8
;;
## BB#7:
	c0	mov $r0.4 = -1
;;
	c0	mtb $b0.0 = $r0.4
	c0	goto LBB60_9
;;
LBB60_22:                               ## %if.end.40
	c0	cmpne $b0.0 = $r0.8, 2047
;;
	c0	br $b0.0, LBB60_39
;;
## BB#23:                               ## %if.then.42
	c0	or $r0.8 = $r0.11, $r0.7
;;
	c0	cmpeq $b0.0 = $r0.8, 0
;;
	c0	br $b0.0, LBB60_37
;;
## BB#24:                               ## %if.then.45
	c0	and $r0.4 = $r0.2, 2146959360
;;
	c0	cmpne $b0.0 = $r0.4, 2146435072
;;
	c0	br $b0.0, LBB60_25
;;
## BB#26:                               ## %land.rhs.i.59.i
	c0	cmpne $b0.0 = $r0.5, 0
;;
	c0	brf $b0.0, LBB60_28
;;
## BB#27:
	c0	mov $r0.4 = -1
;;
	c0	mtb $b0.0 = $r0.4
	c0	goto LBB60_29
;;
LBB60_39:                               ## %if.end.58
	c0	cmpne $b0.0 = $r0.10, 0
;;
	c0	br $b0.0, LBB60_51
;;
## BB#40:                               ## %if.then.60
	c0	or $r0.10 = $r0.13, $r0.5
;;
	c0	cmpne $b0.0 = $r0.10, 0
;;
	c0	brf $b0.0, LBB60_41
;;
## BB#43:                               ## %if.end.64
	c0	cmpne $b0.0 = $r0.13, 0
;;
	c0	brf $b0.0, LBB60_44
;;
## BB#48:                               ## %if.else.7.i.179
	c0	mov $r0.10 = 16
	c0	cmpltu $b0.0 = $r0.13, 65536
	c0	mov $r0.14 = 8
	c0	mov $r0.15 = 22
	c0	mov $r0.16 = 4
	c0	mov $r0.17 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	shl $r0.2 = $r0.2, $r0.10
	c0	mfb $r0.10 = $b0.0
;;
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.13
	c0	shl $r0.10 = $r0.10, $r0.16
;;
	c0	cmpltu $b0.0 = $r0.2, 16777216
	c0	shl $r0.14 = $r0.2, $r0.14
	c0	or $r0.16 = $r0.10, 8
;;
	c0	slct $r0.2 = $b0.0, $r0.14, $r0.2
	c0	slct $r0.10 = $b0.0, $r0.16, $r0.10
;;
	c0	shru $r0.2 = $r0.2, $r0.15
;;
	c0	and $r0.2 = $r0.2, 1020
;;
	c0	add $r0.2 = $r0.17, $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
	c0	add $r0.2 = $r0.2, $r0.10
;;
	c0	add $r0.10 = $r0.2, -11
;;
	c0	cmpeq $b0.0 = $r0.10, 0
;;
	c0	br $b0.0, LBB60_50
;;
## BB#49:                               ## %cond.false.i.i.185
	c0	mov $r0.14 = 11
	c0	shl $r0.13 = $r0.13, $r0.10
;;
	c0	sub $r0.14 = $r0.14, $r0.2
;;
	c0	and $r0.14 = $r0.14, 31
;;
	c0	shru $r0.14 = $r0.5, $r0.14
;;
	c0	or $r0.13 = $r0.14, $r0.13
;;
LBB60_50:                               ## %shortShift64Left.exit.i.188
	c0	mov $r0.14 = 12
	c0	shl $r0.5 = $r0.5, $r0.10
;;
	c0	sub $r0.10 = $r0.14, $r0.2
	c0	goto LBB60_51
;;
LBB60_5:
	c0	mov $r0.4 = 0
;;
	c0	mtb $b0.0 = $r0.4
	c0	goto LBB60_9
;;
LBB60_20:                               ## %if.end
	c0	or $r0.2 = $r0.10, $r0.8
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	brf $b0.0, LBB60_21
;;
	c0	goto LBB60_38
;;
LBB60_37:                               ## %if.end.50
	c0	or $r0.2 = $r0.13, $r0.5
;;
	c0	or $r0.2 = $r0.2, $r0.10
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	brf $b0.0, LBB60_38
;;
LBB60_21:                               ## %if.end.39
	c0	shl $r0.2 = $r0.4, $r0.9
	c0	mov $r0.4 = 0
;;
	c0	or $r0.2 = $r0.2, 2146435072
	c0	goto LBB60_42
;;
LBB60_25:
	c0	mov $r0.4 = 0
;;
	c0	mtb $b0.0 = $r0.4
	c0	goto LBB60_29
;;
LBB60_8:                                ## %lor.rhs.i.62.i.216
	c0	and $r0.4 = $r0.2, 524287
;;
	c0	cmpne $b0.0 = $r0.4, 0
;;
LBB60_9:                                ## %float64_is_signaling_nan.exit64.i.219
	c0	and $r0.4 = $r0.6, 2146959360
;;
	c0	cmpne $b0.1 = $r0.4, 2146435072
;;
	c0	br $b0.1, LBB60_10
;;
## BB#11:                               ## %land.rhs.i.i.229
	c0	cmpeq $b0.1 = $r0.7, 0
;;
	c0	brf $b0.1, LBB60_12
;;
## BB#13:                               ## %lor.rhs.i.i.236
	c0	and $r0.4 = $r0.6, 524287
;;
	c0	cmpne $b0.1 = $r0.4, 0
	c0	goto LBB60_14
;;
LBB60_10:
	c0	mov $r0.4 = 0
;;
	c0	mtb $b0.1 = $r0.4
;;
LBB60_14:                               ## %float64_is_signaling_nan.exit.i.240
	c0	mfb $r0.9 = $b0.1
	c0	mfb $r0.8 = $b0.0
	c0	or $r0.4 = $r0.6, 524288
;;
	c0	or $r0.9 = $r0.8, $r0.9
;;
	c0	and $r0.9 = $r0.9, 1
;;
	c0	cmpeq $b0.0 = $r0.9, 0
;;
	c0	br $b0.0, LBB60_17
;;
## BB#15:                               ## %if.then.i.243
	c0	mov $r0.9 = float_exception_flags
;;
	c0	ldw $r0.10 = 0[$r0.9]
;;
	c0	or $r0.10 = $r0.10, 16
;;
	c0	stw 0[$r0.9] = $r0.10
	c0	br $b0.1, LBB60_16
;;
LBB60_17:                               ## %cond.false.i.251
	c0	or $r0.2 = $r0.2, 524288
	c0	cmpne $b0.0 = $r0.8, 1
;;
	c0	brf $b0.0, LBB60_18
;;
## BB#19:                               ## %cond.false.22.i.254
	c0	mov $r0.8 = 1
	c0	or $r0.9 = $r0.11, $r0.7
;;
	c0	shl $r0.6 = $r0.6, $r0.8
	c0	cmpne $b0.0 = $r0.9, 0
;;
	c0	cmpgtu $b0.1 = $r0.6, -2097153
	c0	mfb $r0.6 = $b0.0
;;
	c0	mfb $r0.8 = $b0.1
;;
	c0	and $r0.6 = $r0.8, $r0.6
;;
	c0	mtb $b0.0 = $r0.6
;;
	c0	mfb $r0.6 = $b0.0
;;
	c0	cmpne $b0.0 = $r0.6, 1
;;
	c0	brf $b0.0, LBB60_16
;;
	c0	goto LBB60_18
;;
LBB60_38:                               ## %invalid
	c0	mov $r0.2 = float_exception_flags
	c0	mov $r0.4 = 2147483647
	c0	mov $r0.5 = -1
;;
	c0	ldw $r0.6 = 0[$r0.2]
;;
	c0	stw 0[$r0.3] = $r0.4
;;
	c0	stw 4[$r0.3] = $r0.5
	c0	or $r0.3 = $r0.6, 16
;;
.return ret()
	c0	stw 0[$r0.2] = $r0.3
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB60_28:                               ## %lor.rhs.i.62.i
	c0	and $r0.4 = $r0.2, 524287
;;
	c0	cmpne $b0.0 = $r0.4, 0
;;
LBB60_29:                               ## %float64_is_signaling_nan.exit64.i
	c0	and $r0.4 = $r0.6, 2146959360
;;
	c0	cmpne $b0.1 = $r0.4, 2146435072
;;
	c0	br $b0.1, LBB60_30
;;
## BB#31:                               ## %land.rhs.i.i
	c0	cmpeq $b0.1 = $r0.7, 0
;;
	c0	br $b0.1, LBB60_32
;;
LBB60_12:                               ## %if.then.thread.i.233
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.5 = 0[$r0.2]
	c0	or $r0.4 = $r0.6, 524288
;;
	c0	or $r0.5 = $r0.5, 16
;;
	c0	stw 0[$r0.2] = $r0.5
;;
LBB60_16:                               ## %cond.true.i.249
	c0	stw 0[$r0.3] = $r0.4
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.7
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB60_30:
	c0	mov $r0.4 = 0
;;
	c0	mtb $b0.1 = $r0.4
	c0	goto LBB60_33
;;
LBB60_32:                               ## %lor.rhs.i.i
	c0	and $r0.4 = $r0.6, 524287
;;
	c0	cmpne $b0.1 = $r0.4, 0
;;
LBB60_33:                               ## %float64_is_signaling_nan.exit.i
	c0	mfb $r0.9 = $b0.1
	c0	mfb $r0.8 = $b0.0
	c0	or $r0.4 = $r0.6, 524288
;;
	c0	or $r0.9 = $r0.8, $r0.9
;;
	c0	and $r0.9 = $r0.9, 1
;;
	c0	cmpeq $b0.0 = $r0.9, 0
;;
	c0	br $b0.0, LBB60_35
;;
## BB#34:                               ## %if.then.i.204
	c0	mov $r0.9 = float_exception_flags
;;
	c0	ldw $r0.10 = 0[$r0.9]
;;
	c0	or $r0.10 = $r0.10, 16
;;
	c0	stw 0[$r0.9] = $r0.10
	c0	br $b0.1, LBB60_16
;;
LBB60_35:                               ## %cond.false.i
	c0	or $r0.2 = $r0.2, 524288
	c0	cmpne $b0.0 = $r0.8, 1
;;
	c0	brf $b0.0, LBB60_18
;;
## BB#36:                               ## %cond.false.22.i
	c0	mov $r0.8 = 1
;;
	c0	shl $r0.6 = $r0.6, $r0.8
;;
	c0	cmpltu $b0.0 = $r0.6, -2097152
;;
	c0	brf $b0.0, LBB60_16
;;
LBB60_18:                               ## %cond.true.21.i.253
	c0	stw 0[$r0.3] = $r0.2
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.5
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB60_44:                               ## %if.then.i.153
	c0	mov $r0.2 = 16
	c0	cmpltu $b0.0 = $r0.5, 65536
	c0	mov $r0.10 = 8
	c0	mov $r0.13 = 22
	c0	mov $r0.14 = 4
	c0	mov $r0.15 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	shl $r0.2 = $r0.5, $r0.2
;;
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.5
;;
	c0	cmpltu $b0.1 = $r0.2, 16777216
	c0	shl $r0.10 = $r0.2, $r0.10
;;
	c0	slct $r0.2 = $b0.1, $r0.10, $r0.2
	c0	mfb $r0.10 = $b0.0
;;
	c0	shru $r0.2 = $r0.2, $r0.13
	c0	shl $r0.10 = $r0.10, $r0.14
;;
	c0	and $r0.2 = $r0.2, 1020
	c0	or $r0.13 = $r0.10, 8
;;
	c0	add $r0.2 = $r0.15, $r0.2
	c0	slct $r0.10 = $b0.1, $r0.13, $r0.10
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
	c0	add $r0.2 = $r0.2, $r0.10
;;
	c0	add $r0.10 = $r0.2, -11
	c0	cmpgt $b0.0 = $r0.2, 10
;;
	c0	br $b0.0, LBB60_46
;;
## BB#45:                               ## %if.then.2.i.158
	c0	mov $r0.13 = 11
	c0	and $r0.10 = $r0.10, 31
;;
	c0	sub $r0.13 = $r0.13, $r0.2
;;
	c0	shru $r0.13 = $r0.5, $r0.13
	c0	shl $r0.5 = $r0.5, $r0.10
	c0	goto LBB60_47
;;
LBB60_46:                               ## %if.else.i.160
	c0	mov $r0.14 = 0
	c0	shl $r0.13 = $r0.5, $r0.10
;;
	c0	mov $r0.5 = $r0.14
;;
LBB60_47:                               ## %if.end.i.163
	c0	mov $r0.10 = -20
;;
	c0	sub $r0.10 = $r0.10, $r0.2
;;
LBB60_51:                               ## %if.end.65
	c0	cmpne $b0.0 = $r0.8, 0
;;
	c0	br $b0.0, LBB60_61
;;
## BB#52:                               ## %if.then.67
	c0	or $r0.2 = $r0.11, $r0.7
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	brf $b0.0, LBB60_41
;;
## BB#53:                               ## %if.end.71
	c0	mov $r0.2 = 16
	c0	cmpne $b0.0 = $r0.11, 0
;;
	c0	brf $b0.0, LBB60_54
;;
## BB#58:                               ## %if.else.7.i
	c0	cmpltu $b0.0 = $r0.11, 65536
	c0	mov $r0.8 = 8
	c0	mov $r0.14 = 22
	c0	mov $r0.15 = 4
	c0	mov $r0.16 = countLeadingZeros32.countLeadingZerosHigh
	c0	shl $r0.2 = $r0.6, $r0.2
;;
	c0	mfb $r0.6 = $b0.0
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.11
;;
	c0	shl $r0.6 = $r0.6, $r0.15
	c0	cmpltu $b0.0 = $r0.2, 16777216
	c0	shl $r0.8 = $r0.2, $r0.8
;;
	c0	or $r0.15 = $r0.6, 8
	c0	slct $r0.2 = $b0.0, $r0.8, $r0.2
;;
	c0	slct $r0.6 = $b0.0, $r0.15, $r0.6
	c0	shru $r0.2 = $r0.2, $r0.14
;;
	c0	and $r0.2 = $r0.2, 1020
;;
	c0	add $r0.2 = $r0.16, $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
	c0	add $r0.2 = $r0.2, $r0.6
;;
	c0	add $r0.6 = $r0.2, -11
;;
	c0	cmpeq $b0.0 = $r0.6, 0
;;
	c0	br $b0.0, LBB60_60
;;
## BB#59:                               ## %cond.false.i.i
	c0	mov $r0.8 = 11
	c0	shl $r0.11 = $r0.11, $r0.6
;;
	c0	sub $r0.8 = $r0.8, $r0.2
;;
	c0	and $r0.8 = $r0.8, 31
;;
	c0	shru $r0.8 = $r0.7, $r0.8
;;
	c0	or $r0.11 = $r0.8, $r0.11
;;
LBB60_60:                               ## %shortShift64Left.exit.i
	c0	mov $r0.8 = 12
	c0	shl $r0.7 = $r0.7, $r0.6
;;
	c0	sub $r0.8 = $r0.8, $r0.2
	c0	goto LBB60_61
;;
LBB60_41:                               ## %if.then.63
	c0	shl $r0.2 = $r0.4, $r0.9
	c0	mov $r0.4 = 0
;;
LBB60_42:                               ## %cleanup
	c0	stw 0[$r0.3] = $r0.2
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.4
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB60_54:                               ## %if.then.i
	c0	cmpltu $b0.0 = $r0.7, 65536
	c0	mov $r0.6 = 8
	c0	mov $r0.8 = 22
	c0	mov $r0.11 = 4
	c0	mov $r0.14 = countLeadingZeros32.countLeadingZerosHigh
	c0	shl $r0.2 = $r0.7, $r0.2
;;
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.7
;;
	c0	cmpltu $b0.1 = $r0.2, 16777216
	c0	shl $r0.6 = $r0.2, $r0.6
;;
	c0	slct $r0.2 = $b0.1, $r0.6, $r0.2
	c0	mfb $r0.6 = $b0.0
;;
	c0	shru $r0.2 = $r0.2, $r0.8
	c0	shl $r0.6 = $r0.6, $r0.11
;;
	c0	and $r0.2 = $r0.2, 1020
	c0	or $r0.8 = $r0.6, 8
;;
	c0	add $r0.2 = $r0.14, $r0.2
	c0	slct $r0.6 = $b0.1, $r0.8, $r0.6
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
	c0	add $r0.2 = $r0.2, $r0.6
;;
	c0	add $r0.6 = $r0.2, -11
	c0	cmpgt $b0.0 = $r0.2, 10
;;
	c0	br $b0.0, LBB60_56
;;
## BB#55:                               ## %if.then.2.i
	c0	mov $r0.8 = 11
	c0	and $r0.6 = $r0.6, 31
;;
	c0	sub $r0.8 = $r0.8, $r0.2
;;
	c0	shru $r0.11 = $r0.7, $r0.8
	c0	shl $r0.7 = $r0.7, $r0.6
	c0	goto LBB60_57
;;
LBB60_56:                               ## %if.else.i
	c0	mov $r0.8 = 0
	c0	shl $r0.11 = $r0.7, $r0.6
;;
	c0	mov $r0.7 = $r0.8
;;
LBB60_57:                               ## %if.end.i
	c0	mov $r0.6 = -20
;;
	c0	sub $r0.8 = $r0.6, $r0.2
;;
LBB60_61:                               ## %if.end.72
	c0	mov $r0.2 = 12
	c0	mov $r0.6 = 4
	c0	mov $r0.14 = 16
	c0	shru $r0.12 = $r0.7, $r0.12
	c0	zxth $r0.15 = $r0.5
	c0	or $r0.16 = $r0.13, 1048576
	c0	zxth $r0.13 = $r0.13
;;
	c0	shl $r0.17 = $r0.11, $r0.2
	c0	shru $r0.11 = $r0.11, $r0.6
	c0	shru $r0.6 = $r0.7, $r0.6
	c0	shl $r0.2 = $r0.7, $r0.2
	c0	shru $r0.7 = $r0.5, $r0.14
	c0	shru $r0.18 = $r0.16, $r0.14
;;
	c0	zxth $r0.11 = $r0.11
	c0	zxth $r0.6 = $r0.6
	c0	zxth $r0.2 = $r0.2
	c0	zxth $r0.17 = $r0.17
;;
	c0	or $r0.12 = $r0.12, $r0.17
	c0	mpylu $r0.17 = $r0.2, $r0.7
	c0	mpyhs $r0.19 = $r0.2, $r0.7
	c0	mpylu $r0.20 = $r0.6, $r0.15
	c0	mpyhs $r0.21 = $r0.6, $r0.15
	c0	mpylu $r0.22 = $r0.11, $r0.15
	c0	mpyhs $r0.23 = $r0.11, $r0.15
;;
	c0	mpyhs $r0.24 = $r0.12, $r0.7
	c0	mpylu $r0.25 = $r0.12, $r0.7
	c0	add $r0.20 = $r0.20, $r0.21
	c0	add $r0.17 = $r0.17, $r0.19
	c0	add $r0.19 = $r0.22, $r0.23
	c0	mpyhs $r0.21 = $r0.12, $r0.15
	c0	mpylu $r0.22 = $r0.12, $r0.15
	c0	mpyhs $r0.23 = $r0.12, $r0.18
;;
	c0	add $r0.24 = $r0.25, $r0.24
	c0	add $r0.17 = $r0.20, $r0.17
	c0	mpylu $r0.25 = $r0.12, $r0.18
	c0	mpylu $r0.26 = $r0.11, $r0.13
	c0	mpyhs $r0.27 = $r0.11, $r0.13
	c0	mpylu $r0.28 = $r0.2, $r0.15
	c0	mpyhs $r0.15 = $r0.2, $r0.15
	c0	mpylu $r0.29 = $r0.2, $r0.18
;;
	c0	add $r0.19 = $r0.24, $r0.19
	c0	mpyhs $r0.30 = $r0.2, $r0.18
	c0	cmpltu $r0.20 = $r0.17, $r0.20
	c0	add $r0.23 = $r0.25, $r0.23
	c0	add $r0.25 = $r0.26, $r0.27
	c0	mpylu $r0.26 = $r0.6, $r0.7
	c0	mpyhs $r0.27 = $r0.6, $r0.7
	c0	mpyhs $r0.31 = $r0.6, $r0.13
;;
	c0	mpylu $r0.32 = $r0.6, $r0.13
	c0	shl $r0.33 = $r0.19, $r0.14
	c0	add $r0.21 = $r0.22, $r0.21
	c0	add $r0.22 = $r0.23, $r0.25
	c0	mpylu $r0.25 = $r0.12, $r0.13
	c0	mpyhs $r0.12 = $r0.12, $r0.13
	c0	shl $r0.34 = $r0.17, $r0.14
	c0	add $r0.15 = $r0.28, $r0.15
;;
	c0	add $r0.21 = $r0.33, $r0.21
	c0	add $r0.26 = $r0.26, $r0.27
	c0	shru $r0.17 = $r0.17, $r0.14
	c0	shl $r0.20 = $r0.20, $r0.14
	c0	add $r0.27 = $r0.32, $r0.31
	c0	add $r0.28 = $r0.29, $r0.30
	c0	add $r0.15 = $r0.34, $r0.15
	c0	cmpltu $r0.24 = $r0.19, $r0.24
;;
	c0	add $r0.28 = $r0.27, $r0.28
	c0	add $r0.12 = $r0.25, $r0.12
	c0	shl $r0.25 = $r0.22, $r0.14
	c0	or $r0.17 = $r0.20, $r0.17
	c0	add $r0.20 = $r0.21, $r0.26
	c0	mpyhs $r0.26 = $r0.11, $r0.7
	c0	mpylu $r0.7 = $r0.11, $r0.7
	c0	cmpltu $r0.29 = $r0.15, $r0.34
;;
	c0	add $r0.12 = $r0.25, $r0.12
	c0	add $r0.7 = $r0.7, $r0.26
	c0	cmpltu $r0.26 = $r0.28, $r0.27
	c0	add $r0.17 = $r0.20, $r0.17
	c0	mpyhs $r0.20 = $r0.2, $r0.13
	c0	mpylu $r0.2 = $r0.2, $r0.13
	c0	shru $r0.13 = $r0.19, $r0.14
	c0	shl $r0.19 = $r0.24, $r0.14
;;
	c0	add $r0.17 = $r0.17, $r0.29
	c0	mpylu $r0.24 = $r0.6, $r0.18
	c0	mpyhs $r0.6 = $r0.6, $r0.18
	c0	shl $r0.26 = $r0.26, $r0.14
	c0	shru $r0.27 = $r0.28, $r0.14
	c0	or $r0.13 = $r0.19, $r0.13
	c0	add $r0.7 = $r0.12, $r0.7
	c0	add $r0.2 = $r0.2, $r0.20
;;
	c0	shl $r0.19 = $r0.28, $r0.14
	c0	cmpltu $b0.0 = $r0.17, $r0.21
	c0	add $r0.6 = $r0.24, $r0.6
	c0	or $r0.20 = $r0.26, $r0.27
	c0	add $r0.7 = $r0.7, $r0.13
	c0	cmpltu $r0.13 = $r0.21, $r0.33
	c0	mpyhs $r0.21 = $r0.11, $r0.18
;;
	c0	add $r0.2 = $r0.19, $r0.2
;;
	c0	cmpltu $r0.19 = $r0.2, $r0.19
	c0	add $r0.6 = $r0.20, $r0.6
	c0	add $r0.20 = $r0.17, $r0.2
;;
	c0	add $r0.2 = $r0.6, $r0.19
	c0	add $r0.6 = $r0.7, $r0.13
	c0	mfb $r0.7 = $b0.0
	c0	cmpltu $r0.13 = $r0.20, $r0.17
	c0	mpylu $r0.11 = $r0.11, $r0.18
;;
	c0	add $r0.11 = $r0.11, $r0.21
;;
	c0	add $r0.11 = $r0.11, $r0.16
	c0	cmpltu $r0.16 = $r0.22, $r0.23
	c0	add $r0.6 = $r0.6, $r0.7
	c0	add $r0.2 = $r0.2, $r0.13
	c0	shru $r0.7 = $r0.22, $r0.14
	c0	cmpne $b0.0 = $r0.15, 0
;;
	c0	shl $r0.13 = $r0.16, $r0.14
	c0	cmpltu $r0.14 = $r0.12, $r0.25
	c0	mfb $r0.15 = $b0.0
;;
	c0	or $r0.7 = $r0.13, $r0.7
;;
	c0	add $r0.7 = $r0.11, $r0.7
	c0	add $r0.11 = $r0.2, $r0.6
;;
	c0	add $r0.13 = $r0.7, $r0.14
	c0	cmpltu $b0.0 = $r0.6, $r0.12
	c0	add $r0.7 = $r0.11, $r0.5
	c0	cmpltu $r0.2 = $r0.11, $r0.2
;;
	c0	mfb $r0.5 = $b0.0
	c0	cmpltu $r0.6 = $r0.7, $r0.11
;;
	c0	add $r0.5 = $r0.13, $r0.5
;;
	c0	add $r0.5 = $r0.5, $r0.2
	c0	add $r0.2 = $r0.8, $r0.10
	c0	or $r0.8 = $r0.20, $r0.15
;;
	c0	add $r0.6 = $r0.5, $r0.6
;;
	c0	cmpltu $b0.0 = $r0.6, 2097152
;;
	c0	br $b0.0, LBB60_62
;;
## BB#63:                               ## %if.then.78
	c0	cmpne $b0.0 = $r0.8, 0
	c0	mov $r0.8 = 1
	c0	shl $r0.10 = $r0.6, $r0.9
	c0	shl $r0.9 = $r0.7, $r0.9
	c0	add $r0.5 = $r0.2, -1023
;;
	c0	mfb $r0.2 = $b0.0
	c0	shru $r0.7 = $r0.7, $r0.8
	c0	shru $r0.6 = $r0.6, $r0.8
;;
	c0	or $r0.8 = $r0.9, $r0.2
	c0	or $r0.7 = $r0.10, $r0.7
;;
.call roundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = roundAndPackFloat64
;;
.return ret()
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB60_62:
	c0	add $r0.5 = $r0.2, -1024
;;
.call roundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = roundAndPackFloat64
;;
.return ret()
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
	c0	ldw $r0.9 = 0[$r0.2]
	c0	mov $r0.2 = 31
;;
	c0	cmpeq $b0.0 = $r0.9, 0
;;
	c0	br $b0.0, LBB61_1
;;
## BB#2:                                ## %if.then
	c0	cmpeq $b0.0 = $r0.9, 1
;;
	c0	brf $b0.0, LBB61_4
;;
## BB#3:
	c0	mov $r0.10 = 0
	c0	goto LBB61_8
;;
LBB61_1:
	c0	shru $r0.10 = $r0.8, $r0.2
	c0	goto LBB61_8
;;
LBB61_4:                                ## %if.else
	c0	cmpeq $b0.0 = $r0.4, 0
;;
	c0	br $b0.0, LBB61_6
;;
## BB#5:                                ## %if.then.7
	c0	cmpeq $b0.0 = $r0.9, 3
	c0	goto LBB61_7
;;
LBB61_6:                                ## %if.else.11
	c0	cmpeq $b0.0 = $r0.9, 2
;;
LBB61_7:                                ## %if.end.19
	c0	cmpne $b0.1 = $r0.8, 0
	c0	mfb $r0.10 = $b0.0
;;
	c0	mfb $r0.11 = $b0.1
;;
	c0	and $r0.10 = $r0.11, $r0.10
;;
	c0	and $r0.10 = $r0.10, 1
;;
LBB61_8:                                ## %if.end.19
	c0	zxth $r0.11 = $r0.5
;;
	c0	cmpltu $b0.0 = $r0.11, 2045
;;
	c0	br $b0.0, LBB61_41
;;
## BB#9:                                ## %if.then.24
	c0	cmpgt $b0.0 = $r0.5, 2045
;;
	c0	br $b0.0, LBB61_14
;;
## BB#10:                               ## %lor.lhs.false
	c0	cmpne $b0.0 = $r0.5, 2045
;;
	c0	br $b0.0, LBB61_22
;;
## BB#11:                               ## %land.lhs.true
	c0	mov $r0.5 = 2045
	c0	cmpne $b0.0 = $r0.6, 2097151
;;
	c0	br $b0.0, LBB61_41
;;
## BB#12:                               ## %land.lhs.true
	c0	cmpne $b0.0 = $r0.7, -1
;;
	c0	br $b0.0, LBB61_41
;;
## BB#13:                               ## %land.lhs.true
	c0	cmpeq $b0.0 = $r0.10, 0
;;
	c0	br $b0.0, LBB61_41
;;
LBB61_14:                               ## %if.then.32
	c0	mov $r0.5 = float_exception_flags
;;
	c0	ldw $r0.6 = 0[$r0.5]
	c0	cmpeq $b0.0 = $r0.9, 1
;;
	c0	or $r0.6 = $r0.6, 9
;;
	c0	stw 0[$r0.5] = $r0.6
	c0	br $b0.0, LBB61_19
;;
## BB#15:                               ## %lor.lhs.false.35
	c0	cmpeq $b0.0 = $r0.4, 0
;;
	c0	br $b0.0, LBB61_17
;;
## BB#16:                               ## %lor.lhs.false.35
	c0	cmpeq $b0.0 = $r0.9, 2
;;
	c0	br $b0.0, LBB61_19
;;
LBB61_17:                               ## %lor.lhs.false.40
	c0	cmpne $b0.0 = $r0.4, 0
;;
	c0	br $b0.0, LBB61_21
;;
## BB#18:                               ## %lor.lhs.false.40
	c0	cmpne $b0.0 = $r0.9, 3
;;
	c0	br $b0.0, LBB61_21
;;
LBB61_19:                               ## %if.then.45
	c0	shl $r0.2 = $r0.4, $r0.2
	c0	mov $r0.4 = -1
;;
	c0	or $r0.2 = $r0.2, 2146435071
;;
LBB61_20:                               ## %cleanup
	c0	stw 0[$r0.3] = $r0.2
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB61_22:                               ## %if.end.47
	c0	cmpgt $b0.0 = $r0.5, -1
;;
	c0	br $b0.0, LBB61_41
;;
## BB#23:                               ## %if.then.50
	c0	mov $r0.11 = -1
	c0	cmpltu $b0.1 = $r0.6, 2097151
;;
	c0	mtb $b0.0 = $r0.11
	c0	br $b0.1, LBB61_26
;;
## BB#24:                               ## %if.then.50
	c0	mov $r0.11 = float_detect_tininess
	c0	cmplt $b0.1 = $r0.5, -1
	c0	cmpeq $b0.2 = $r0.10, 0
;;
	c0	ldw $r0.10 = 0[$r0.11]
	c0	mfb $r0.11 = $b0.1
	c0	mfb $r0.12 = $b0.2
;;
	c0	cmpeq $b0.1 = $r0.10, 1
;;
	c0	mfb $r0.10 = $b0.1
;;
	c0	or $r0.10 = $r0.11, $r0.10
;;
	c0	or $r0.10 = $r0.12, $r0.10
;;
	c0	mtb $b0.1 = $r0.10
;;
	c0	br $b0.1, LBB61_26
;;
## BB#25:                               ## %lor.rhs.i
	c0	cmpne $b0.0 = $r0.7, -1
	c0	cmpeq $b0.1 = $r0.6, 2097151
;;
	c0	mfb $r0.10 = $b0.0
	c0	mfb $r0.11 = $b0.1
;;
	c0	and $r0.10 = $r0.11, $r0.10
;;
	c0	mtb $b0.0 = $r0.10
;;
LBB61_26:                               ## %if.else.i
	c0	mov $r0.11 = 0
	c0	cmplt $b0.1 = $r0.5, -31
	c0	and $r0.10 = $r0.5, 31
;;
	c0	sub $r0.12 = $r0.11, $r0.5
	c0	br $b0.1, LBB61_28
;;
## BB#27:                               ## %if.then.2.i
	c0	shru $r0.5 = $r0.7, $r0.12
	c0	shl $r0.13 = $r0.6, $r0.10
	c0	shru $r0.11 = $r0.6, $r0.12
	c0	shl $r0.7 = $r0.7, $r0.10
;;
	c0	or $r0.12 = $r0.5, $r0.13
	c0	goto LBB61_33
;;
LBB61_21:                               ## %if.end.46
	c0	shl $r0.2 = $r0.4, $r0.2
	c0	mov $r0.4 = 0
;;
	c0	or $r0.2 = $r0.2, 2146435072
	c0	goto LBB61_20
;;
LBB61_28:                               ## %if.else.5.i
	c0	cmpeq $b0.1 = $r0.12, 32
;;
	c0	brf $b0.1, LBB61_30
;;
## BB#29:
	c0	mov $r0.12 = $r0.6
	c0	goto LBB61_33
;;
LBB61_30:                               ## %if.else.8.i
	c0	or $r0.8 = $r0.8, $r0.7
	c0	cmplt $b0.1 = $r0.5, -63
;;
	c0	br $b0.1, LBB61_32
;;
## BB#31:                               ## %if.then.11.i
	c0	and $r0.5 = $r0.12, 31
	c0	shl $r0.7 = $r0.6, $r0.10
;;
	c0	shru $r0.12 = $r0.6, $r0.5
	c0	goto LBB61_33
;;
LBB61_32:                               ## %if.else.15.i
	c0	cmpne $b0.1 = $r0.6, 0
	c0	cmpeq $b0.2 = $r0.12, 64
	c0	mov $r0.11 = 0
;;
	c0	mfb $r0.5 = $b0.1
	c0	mov $r0.12 = $r0.11
;;
	c0	slct $r0.7 = $b0.2, $r0.6, $r0.5
;;
LBB61_33:                               ## %shift64ExtraRightJamming.exit
	c0	cmpne $b0.1 = $r0.8, 0
	c0	mfb $r0.5 = $b0.0
;;
	c0	mfb $r0.6 = $b0.1
;;
	c0	or $r0.8 = $r0.6, $r0.7
;;
	c0	cmpne $b0.0 = $r0.8, 0
;;
	c0	mfb $r0.10 = $b0.0
;;
	c0	and $r0.5 = $r0.5, $r0.10
;;
	c0	and $r0.5 = $r0.5, 1
;;
	c0	cmpeq $b0.0 = $r0.5, 0
;;
	c0	br $b0.0, LBB61_35
;;
## BB#34:                               ## %if.then.63
	c0	mov $r0.5 = float_exception_flags
;;
	c0	ldw $r0.6 = 0[$r0.5]
;;
	c0	or $r0.6 = $r0.6, 4
;;
	c0	stw 0[$r0.5] = $r0.6
;;
LBB61_35:                               ## %if.end.64
	c0	cmpne $b0.0 = $r0.9, 0
;;
	c0	brf $b0.0, LBB61_36
;;
## BB#37:                               ## %if.else.69
	c0	cmpeq $b0.0 = $r0.4, 0
;;
	c0	br $b0.0, LBB61_39
;;
## BB#38:                               ## %if.then.71
	c0	cmpeq $b0.0 = $r0.9, 3
	c0	goto LBB61_40
;;
LBB61_36:                               ## %if.then.66
	c0	shru $r0.10 = $r0.7, $r0.2
	c0	mov $r0.6 = $r0.11
	c0	mov $r0.5 = 0
	c0	mov $r0.7 = $r0.12
	c0	goto LBB61_41
;;
LBB61_39:                               ## %if.else.78
	c0	cmpeq $b0.0 = $r0.9, 2
;;
LBB61_40:                               ## %if.end.88
	c0	mov $r0.6 = $r0.11
	c0	mov $r0.5 = 0
	c0	mov $r0.7 = $r0.12
	c0	mfb $r0.11 = $b0.0
;;
	c0	and $r0.10 = $r0.11, $r0.10
;;
	c0	and $r0.10 = $r0.10, 1
;;
LBB61_41:                               ## %if.end.88
	c0	cmpeq $b0.0 = $r0.8, 0
;;
	c0	br $b0.0, LBB61_43
;;
## BB#42:                               ## %if.then.90
	c0	mov $r0.11 = float_exception_flags
;;
	c0	ldw $r0.12 = 0[$r0.11]
;;
	c0	or $r0.12 = $r0.12, 1
;;
	c0	stw 0[$r0.11] = $r0.12
;;
LBB61_43:                               ## %if.end.91
	c0	cmpeq $b0.0 = $r0.10, 0
;;
	c0	br $b0.0, LBB61_45
;;
## BB#44:                               ## %if.then.93
	c0	and $r0.8 = $r0.8, 2147483647
	c0	cmpeq $b0.0 = $r0.7, -1
	c0	add $r0.7 = $r0.7, 1
;;
	c0	or $r0.8 = $r0.8, $r0.9
	c0	mfb $r0.9 = $b0.0
;;
	c0	cmpeq $b0.0 = $r0.8, 0
	c0	add $r0.6 = $r0.9, $r0.6
;;
	c0	mfb $r0.8 = $b0.0
;;
	c0	andc $r0.7 = $r0.8, $r0.7
	c0	goto LBB61_46
;;
LBB61_45:                               ## %if.else.97
	c0	or $r0.8 = $r0.7, $r0.6
	c0	mov $r0.9 = 0
;;
	c0	cmpeq $b0.0 = $r0.8, 0
;;
	c0	slct $r0.5 = $b0.0, $r0.9, $r0.5
;;
LBB61_46:                               ## %if.end.103
	c0	shl $r0.2 = $r0.4, $r0.2
	c0	mov $r0.4 = 20
;;
	c0	shl $r0.4 = $r0.5, $r0.4
	c0	add $r0.2 = $r0.6, $r0.2
;;
	c0	add $r0.2 = $r0.2, $r0.4
;;
	c0	stw 0[$r0.3] = $r0.2
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.7
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
	c0	mov $r0.2 = 20
	c0	mov $r0.8 = $r0.4
	c0	mov $r0.11 = 31
;;
	c0	xor $r0.4 = $r0.6, $r0.8
	c0	shru $r0.9 = $r0.8, $r0.2
	c0	shru $r0.10 = $r0.6, $r0.2
;;
	c0	and $r0.12 = $r0.9, 2047
	c0	mov $r0.2 = $r0.5
	c0	and $r0.5 = $r0.6, 1048575
	c0	and $r0.9 = $r0.8, 1048575
	c0	shru $r0.4 = $r0.4, $r0.11
;;
	c0	and $r0.10 = $r0.10, 2047
	c0	cmpne $b0.0 = $r0.12, 2047
;;
	c0	br $b0.0, LBB62_34
;;
## BB#1:                                ## %if.then
	c0	or $r0.9 = $r0.9, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.9, 0
;;
	c0	br $b0.0, LBB62_18
;;
## BB#2:                                ## %if.then.27
	c0	and $r0.4 = $r0.8, 2146959360
;;
	c0	cmpne $b0.0 = $r0.4, 2146435072
;;
	c0	br $b0.0, LBB62_3
;;
## BB#4:                                ## %land.rhs.i.59.i.446
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	brf $b0.0, LBB62_6
;;
## BB#5:
	c0	mov $r0.4 = -1
;;
	c0	mtb $b0.0 = $r0.4
	c0	goto LBB62_7
;;
LBB62_34:                               ## %if.end.43
	c0	cmpeq $b0.0 = $r0.10, 0
;;
	c0	brf $b0.0, LBB62_35
;;
## BB#39:                               ## %if.then.56
	c0	or $r0.10 = $r0.5, $r0.7
;;
	c0	cmpne $b0.0 = $r0.10, 0
;;
	c0	brf $b0.0, LBB62_40
;;
## BB#43:                               ## %if.end.67
	c0	cmpne $b0.0 = $r0.5, 0
;;
	c0	brf $b0.0, LBB62_44
;;
## BB#48:                               ## %if.else.7.i.360
	c0	mov $r0.10 = 16
	c0	cmpltu $b0.0 = $r0.5, 65536
	c0	mov $r0.13 = 8
	c0	mov $r0.14 = 22
	c0	mov $r0.15 = 4
	c0	mov $r0.16 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	shl $r0.6 = $r0.6, $r0.10
	c0	mfb $r0.10 = $b0.0
;;
	c0	slct $r0.6 = $b0.0, $r0.6, $r0.5
	c0	shl $r0.10 = $r0.10, $r0.15
;;
	c0	cmpltu $b0.0 = $r0.6, 16777216
	c0	shl $r0.13 = $r0.6, $r0.13
	c0	or $r0.15 = $r0.10, 8
;;
	c0	slct $r0.6 = $b0.0, $r0.13, $r0.6
	c0	slct $r0.10 = $b0.0, $r0.15, $r0.10
;;
	c0	shru $r0.6 = $r0.6, $r0.14
;;
	c0	and $r0.6 = $r0.6, 1020
;;
	c0	add $r0.6 = $r0.16, $r0.6
;;
	c0	ldw $r0.6 = 0[$r0.6]
;;
	c0	add $r0.6 = $r0.6, $r0.10
;;
	c0	add $r0.10 = $r0.6, -11
;;
	c0	cmpeq $b0.0 = $r0.10, 0
;;
	c0	br $b0.0, LBB62_50
;;
## BB#49:                               ## %cond.false.i.i.366
	c0	mov $r0.13 = 11
	c0	shl $r0.5 = $r0.5, $r0.10
;;
	c0	sub $r0.13 = $r0.13, $r0.6
;;
	c0	and $r0.13 = $r0.13, 31
;;
	c0	shru $r0.13 = $r0.7, $r0.13
;;
	c0	or $r0.5 = $r0.13, $r0.5
;;
LBB62_50:                               ## %shortShift64Left.exit.i.369
	c0	mov $r0.13 = 12
	c0	shl $r0.7 = $r0.7, $r0.10
;;
	c0	sub $r0.10 = $r0.13, $r0.6
	c0	goto LBB62_51
;;
LBB62_35:                               ## %if.end.43
	c0	cmpne $b0.0 = $r0.10, 2047
;;
	c0	br $b0.0, LBB62_51
;;
## BB#36:                               ## %if.then.45
	c0	or $r0.5 = $r0.5, $r0.7
;;
	c0	cmpeq $b0.0 = $r0.5, 0
;;
	c0	brf $b0.0, LBB62_20
;;
	c0	goto LBB62_37
;;
LBB62_18:                               ## %if.end
	c0	cmpne $b0.0 = $r0.10, 2047
;;
	c0	br $b0.0, LBB62_33
;;
## BB#19:                               ## %if.then.33
	c0	or $r0.4 = $r0.5, $r0.7
;;
	c0	cmpeq $b0.0 = $r0.4, 0
;;
	c0	br $b0.0, LBB62_41
;;
LBB62_20:                               ## %if.then.36
	c0	and $r0.4 = $r0.8, 2146959360
;;
	c0	cmpne $b0.0 = $r0.4, 2146435072
;;
	c0	br $b0.0, LBB62_21
;;
## BB#22:                               ## %land.rhs.i.59.i.396
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	brf $b0.0, LBB62_24
;;
## BB#23:
	c0	mov $r0.4 = -1
;;
	c0	mtb $b0.0 = $r0.4
	c0	goto LBB62_25
;;
LBB62_3:
	c0	mov $r0.4 = 0
;;
	c0	mtb $b0.0 = $r0.4
	c0	goto LBB62_7
;;
LBB62_40:                               ## %if.then.59
	c0	or $r0.2 = $r0.9, $r0.2
;;
	c0	or $r0.2 = $r0.2, $r0.12
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	brf $b0.0, LBB62_41
;;
## BB#42:                               ## %if.end.66
	c0	mov $r0.2 = float_exception_flags
	c0	shl $r0.4 = $r0.4, $r0.11
	c0	mov $r0.5 = 0
;;
	c0	ldw $r0.6 = 0[$r0.2]
	c0	or $r0.4 = $r0.4, 2146435072
;;
	c0	stw 0[$r0.3] = $r0.4
;;
	c0	stw 4[$r0.3] = $r0.5
	c0	or $r0.3 = $r0.6, 2
;;
.return ret()
	c0	stw 0[$r0.2] = $r0.3
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB62_33:                               ## %if.end.42
	c0	shl $r0.2 = $r0.4, $r0.11
	c0	mov $r0.4 = 0
;;
	c0	or $r0.2 = $r0.2, 2146435072
	c0	goto LBB62_38
;;
LBB62_41:                               ## %invalid
	c0	mov $r0.2 = float_exception_flags
	c0	mov $r0.4 = 2147483647
	c0	mov $r0.5 = -1
;;
	c0	ldw $r0.6 = 0[$r0.2]
;;
	c0	stw 0[$r0.3] = $r0.4
;;
	c0	stw 4[$r0.3] = $r0.5
	c0	or $r0.3 = $r0.6, 16
;;
.return ret()
	c0	stw 0[$r0.2] = $r0.3
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB62_21:
	c0	mov $r0.4 = 0
;;
	c0	mtb $b0.0 = $r0.4
	c0	goto LBB62_25
;;
LBB62_6:                                ## %lor.rhs.i.62.i.449
	c0	and $r0.4 = $r0.8, 524287
;;
	c0	cmpne $b0.0 = $r0.4, 0
;;
LBB62_7:                                ## %float64_is_signaling_nan.exit64.i.452
	c0	and $r0.4 = $r0.6, 2146959360
;;
	c0	cmpne $b0.1 = $r0.4, 2146435072
;;
	c0	br $b0.1, LBB62_8
;;
## BB#9:                                ## %land.rhs.i.i.462
	c0	cmpeq $b0.1 = $r0.7, 0
;;
	c0	brf $b0.1, LBB62_10
;;
## BB#11:                               ## %lor.rhs.i.i.469
	c0	and $r0.4 = $r0.6, 524287
;;
	c0	cmpne $b0.1 = $r0.4, 0
	c0	goto LBB62_12
;;
LBB62_8:
	c0	mov $r0.4 = 0
;;
	c0	mtb $b0.1 = $r0.4
;;
LBB62_12:                               ## %float64_is_signaling_nan.exit.i.473
	c0	mfb $r0.10 = $b0.1
	c0	mfb $r0.9 = $b0.0
	c0	or $r0.4 = $r0.6, 524288
;;
	c0	or $r0.10 = $r0.9, $r0.10
;;
	c0	and $r0.10 = $r0.10, 1
;;
	c0	cmpeq $b0.0 = $r0.10, 0
;;
	c0	br $b0.0, LBB62_15
;;
## BB#13:                               ## %if.then.i.476
	c0	mov $r0.10 = float_exception_flags
;;
	c0	ldw $r0.11 = 0[$r0.10]
;;
	c0	or $r0.11 = $r0.11, 16
;;
	c0	stw 0[$r0.10] = $r0.11
	c0	br $b0.1, LBB62_14
;;
LBB62_15:                               ## %cond.false.i.484
	c0	or $r0.8 = $r0.8, 524288
	c0	cmpne $b0.0 = $r0.9, 1
;;
	c0	brf $b0.0, LBB62_16
;;
## BB#17:                               ## %cond.false.22.i.487
	c0	mov $r0.9 = 1
	c0	or $r0.5 = $r0.5, $r0.7
;;
	c0	shl $r0.6 = $r0.6, $r0.9
	c0	cmpne $b0.0 = $r0.5, 0
;;
	c0	cmpgtu $b0.1 = $r0.6, -2097153
	c0	mfb $r0.5 = $b0.0
;;
	c0	mfb $r0.6 = $b0.1
;;
	c0	and $r0.5 = $r0.6, $r0.5
;;
	c0	mtb $b0.0 = $r0.5
;;
	c0	mfb $r0.5 = $b0.0
;;
	c0	cmpne $b0.0 = $r0.5, 1
;;
	c0	brf $b0.0, LBB62_14
;;
	c0	goto LBB62_16
;;
LBB62_44:                               ## %if.then.i.334
	c0	mov $r0.5 = 16
	c0	cmpltu $b0.0 = $r0.7, 65536
	c0	mov $r0.6 = 8
	c0	mov $r0.10 = 22
	c0	mov $r0.13 = 4
	c0	mov $r0.14 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	shl $r0.5 = $r0.7, $r0.5
;;
	c0	slct $r0.5 = $b0.0, $r0.5, $r0.7
;;
	c0	cmpltu $b0.1 = $r0.5, 16777216
	c0	shl $r0.6 = $r0.5, $r0.6
;;
	c0	slct $r0.5 = $b0.1, $r0.6, $r0.5
	c0	mfb $r0.6 = $b0.0
;;
	c0	shru $r0.5 = $r0.5, $r0.10
	c0	shl $r0.6 = $r0.6, $r0.13
;;
	c0	and $r0.5 = $r0.5, 1020
	c0	or $r0.10 = $r0.6, 8
;;
	c0	add $r0.5 = $r0.14, $r0.5
	c0	slct $r0.6 = $b0.1, $r0.10, $r0.6
;;
	c0	ldw $r0.5 = 0[$r0.5]
;;
	c0	add $r0.6 = $r0.5, $r0.6
;;
	c0	add $r0.5 = $r0.6, -11
	c0	cmpgt $b0.0 = $r0.6, 10
;;
	c0	br $b0.0, LBB62_46
;;
## BB#45:                               ## %if.then.2.i.339
	c0	mov $r0.10 = 11
	c0	and $r0.13 = $r0.5, 31
;;
	c0	sub $r0.5 = $r0.10, $r0.6
;;
	c0	shru $r0.5 = $r0.7, $r0.5
	c0	shl $r0.7 = $r0.7, $r0.13
	c0	goto LBB62_47
;;
LBB62_46:                               ## %if.else.i.341
	c0	mov $r0.10 = 0
	c0	shl $r0.5 = $r0.7, $r0.5
;;
	c0	mov $r0.7 = $r0.10
;;
LBB62_47:                               ## %if.end.i.344
	c0	mov $r0.10 = -20
;;
	c0	sub $r0.10 = $r0.10, $r0.6
;;
LBB62_51:                               ## %if.end.68
	c0	cmpne $b0.0 = $r0.12, 0
;;
	c0	br $b0.0, LBB62_61
;;
## BB#52:                               ## %if.then.70
	c0	or $r0.6 = $r0.9, $r0.2
;;
	c0	cmpne $b0.0 = $r0.6, 0
;;
	c0	brf $b0.0, LBB62_37
;;
## BB#53:                               ## %if.end.74
	c0	mov $r0.6 = 16
	c0	cmpne $b0.0 = $r0.9, 0
;;
	c0	brf $b0.0, LBB62_54
;;
## BB#58:                               ## %if.else.7.i
	c0	cmpltu $b0.0 = $r0.9, 65536
	c0	mov $r0.12 = 8
	c0	mov $r0.13 = 22
	c0	mov $r0.14 = 4
	c0	mov $r0.15 = countLeadingZeros32.countLeadingZerosHigh
	c0	shl $r0.6 = $r0.8, $r0.6
;;
	c0	mfb $r0.8 = $b0.0
	c0	slct $r0.6 = $b0.0, $r0.6, $r0.9
;;
	c0	shl $r0.8 = $r0.8, $r0.14
	c0	cmpltu $b0.0 = $r0.6, 16777216
	c0	shl $r0.12 = $r0.6, $r0.12
;;
	c0	or $r0.14 = $r0.8, 8
	c0	slct $r0.6 = $b0.0, $r0.12, $r0.6
;;
	c0	slct $r0.8 = $b0.0, $r0.14, $r0.8
	c0	shru $r0.6 = $r0.6, $r0.13
;;
	c0	and $r0.6 = $r0.6, 1020
;;
	c0	add $r0.6 = $r0.15, $r0.6
;;
	c0	ldw $r0.6 = 0[$r0.6]
;;
	c0	add $r0.6 = $r0.6, $r0.8
;;
	c0	add $r0.8 = $r0.6, -11
;;
	c0	cmpeq $b0.0 = $r0.8, 0
;;
	c0	br $b0.0, LBB62_60
;;
## BB#59:                               ## %cond.false.i.i
	c0	mov $r0.12 = 11
	c0	shl $r0.9 = $r0.9, $r0.8
;;
	c0	sub $r0.12 = $r0.12, $r0.6
;;
	c0	and $r0.12 = $r0.12, 31
;;
	c0	shru $r0.12 = $r0.2, $r0.12
;;
	c0	or $r0.9 = $r0.12, $r0.9
;;
LBB62_60:                               ## %shortShift64Left.exit.i
	c0	mov $r0.12 = 12
	c0	shl $r0.2 = $r0.2, $r0.8
;;
	c0	sub $r0.12 = $r0.12, $r0.6
	c0	goto LBB62_61
;;
LBB62_37:                               ## %if.end.53
	c0	shl $r0.2 = $r0.4, $r0.11
	c0	mov $r0.4 = 0
;;
LBB62_38:                               ## %cleanup
	c0	stw 0[$r0.3] = $r0.2
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.4
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB62_24:                               ## %lor.rhs.i.62.i.399
	c0	and $r0.4 = $r0.8, 524287
;;
	c0	cmpne $b0.0 = $r0.4, 0
;;
LBB62_25:                               ## %float64_is_signaling_nan.exit64.i.402
	c0	and $r0.4 = $r0.6, 2146959360
;;
	c0	cmpne $b0.1 = $r0.4, 2146435072
;;
	c0	br $b0.1, LBB62_26
;;
## BB#27:                               ## %land.rhs.i.i.412
	c0	cmpeq $b0.1 = $r0.7, 0
;;
	c0	br $b0.1, LBB62_28
;;
LBB62_10:                               ## %if.then.thread.i.466
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.5 = 0[$r0.2]
	c0	or $r0.4 = $r0.6, 524288
;;
	c0	or $r0.5 = $r0.5, 16
;;
	c0	stw 0[$r0.2] = $r0.5
;;
LBB62_14:                               ## %cond.true.i.482
	c0	stw 0[$r0.3] = $r0.4
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.7
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB62_26:
	c0	mov $r0.4 = 0
;;
	c0	mtb $b0.1 = $r0.4
	c0	goto LBB62_29
;;
LBB62_28:                               ## %lor.rhs.i.i.419
	c0	and $r0.4 = $r0.6, 524287
;;
	c0	cmpne $b0.1 = $r0.4, 0
;;
LBB62_29:                               ## %float64_is_signaling_nan.exit.i.423
	c0	mfb $r0.9 = $b0.1
	c0	mfb $r0.5 = $b0.0
	c0	or $r0.4 = $r0.6, 524288
;;
	c0	or $r0.9 = $r0.5, $r0.9
;;
	c0	and $r0.9 = $r0.9, 1
;;
	c0	cmpeq $b0.0 = $r0.9, 0
;;
	c0	br $b0.0, LBB62_31
;;
## BB#30:                               ## %if.then.i.426
	c0	mov $r0.9 = float_exception_flags
;;
	c0	ldw $r0.10 = 0[$r0.9]
;;
	c0	or $r0.10 = $r0.10, 16
;;
	c0	stw 0[$r0.9] = $r0.10
	c0	br $b0.1, LBB62_14
;;
LBB62_31:                               ## %cond.false.i.434
	c0	or $r0.8 = $r0.8, 524288
	c0	cmpne $b0.0 = $r0.5, 1
;;
	c0	brf $b0.0, LBB62_16
;;
## BB#32:                               ## %cond.false.22.i.437
	c0	mov $r0.5 = 1
;;
	c0	shl $r0.5 = $r0.6, $r0.5
;;
	c0	cmpltu $b0.0 = $r0.5, -2097152
;;
	c0	brf $b0.0, LBB62_14
;;
LBB62_16:                               ## %cond.true.21.i.486
	c0	stw 0[$r0.3] = $r0.8
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.2
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB62_54:                               ## %if.then.i
	c0	cmpltu $b0.0 = $r0.2, 65536
	c0	mov $r0.8 = 8
	c0	mov $r0.9 = 22
	c0	mov $r0.12 = 4
	c0	mov $r0.13 = countLeadingZeros32.countLeadingZerosHigh
	c0	shl $r0.6 = $r0.2, $r0.6
;;
	c0	slct $r0.6 = $b0.0, $r0.6, $r0.2
;;
	c0	cmpltu $b0.1 = $r0.6, 16777216
	c0	shl $r0.8 = $r0.6, $r0.8
;;
	c0	slct $r0.6 = $b0.1, $r0.8, $r0.6
	c0	mfb $r0.8 = $b0.0
;;
	c0	shru $r0.6 = $r0.6, $r0.9
	c0	shl $r0.8 = $r0.8, $r0.12
;;
	c0	and $r0.6 = $r0.6, 1020
	c0	or $r0.9 = $r0.8, 8
;;
	c0	add $r0.6 = $r0.13, $r0.6
	c0	slct $r0.8 = $b0.1, $r0.9, $r0.8
;;
	c0	ldw $r0.6 = 0[$r0.6]
;;
	c0	add $r0.6 = $r0.6, $r0.8
;;
	c0	add $r0.8 = $r0.6, -11
	c0	cmpgt $b0.0 = $r0.6, 10
;;
	c0	br $b0.0, LBB62_56
;;
## BB#55:                               ## %if.then.2.i
	c0	mov $r0.9 = 11
	c0	and $r0.8 = $r0.8, 31
;;
	c0	sub $r0.9 = $r0.9, $r0.6
;;
	c0	shru $r0.9 = $r0.2, $r0.9
	c0	shl $r0.2 = $r0.2, $r0.8
	c0	goto LBB62_57
;;
LBB62_56:                               ## %if.else.i
	c0	mov $r0.12 = 0
	c0	shl $r0.9 = $r0.2, $r0.8
;;
	c0	mov $r0.2 = $r0.12
;;
LBB62_57:                               ## %if.end.i.315
	c0	mov $r0.8 = -20
;;
	c0	sub $r0.12 = $r0.8, $r0.6
;;
LBB62_61:                               ## %if.end.75
	c0	mov $r0.6 = 11
	c0	mov $r0.8 = 21
;;
	c0	shru $r0.15 = $r0.7, $r0.8
	c0	shru $r0.14 = $r0.2, $r0.8
	c0	shl $r0.5 = $r0.5, $r0.6
	c0	shl $r0.9 = $r0.9, $r0.6
;;
	c0	or $r0.13 = $r0.5, -2147483648
	c0	or $r0.5 = $r0.14, $r0.9
	c0	sub $r0.12 = $r0.12, $r0.10
	c0	shl $r0.9 = $r0.7, $r0.6
;;
	c0	or $r0.16 = $r0.5, -2147483648
	c0	or $r0.10 = $r0.15, $r0.13
;;
	c0	cmpltu $b0.0 = $r0.10, $r0.16
;;
	c0	br $b0.0, LBB62_64
;;
## BB#62:                               ## %lor.rhs.i
	c0	shl $r0.17 = $r0.2, $r0.6
	c0	add $r0.5 = $r0.12, 1021
;;
	c0	cmpgtu $b0.0 = $r0.9, $r0.17
;;
	c0	br $b0.0, LBB62_65
;;
## BB#63:                               ## %lor.rhs.i
	c0	cmpne $b0.0 = $r0.10, $r0.16
;;
	c0	br $b0.0, LBB62_65
;;
LBB62_64:                               ## %if.then.80
	c0	mov $r0.15 = 10
	c0	shl $r0.11 = $r0.14, $r0.11
	c0	mov $r0.14 = 1
	c0	add $r0.5 = $r0.12, 1022
;;
	c0	shl $r0.2 = $r0.2, $r0.15
	c0	shru $r0.16 = $r0.16, $r0.14
;;
	c0	and $r0.2 = $r0.2, 2147482624
;;
	c0	or $r0.17 = $r0.11, $r0.2
;;
LBB62_65:                               ## %if.end.81
	c0	mov $r0.2 = 16
	c0	cmpgtu $b0.0 = $r0.10, $r0.16
;;
	c0	shru $r0.11 = $r0.13, $r0.2
	c0	brf $b0.0, LBB62_66
;;
## BB#67:                               ## %if.end.i.239
	c0	shl $r0.14 = $r0.11, $r0.2
;;
	c0	cmpleu $b0.0 = $r0.14, $r0.16
;;
	c0	br $b0.0, LBB62_68
;;
## BB#69:                               ## %cond.false.i.242
	c0	cmplt $r0.12 = $r0.11, $r0.0
	c0	mov $r0.13 = 0
;;
	c0	shru $r0.15 = $r0.16, $r0.12
	c0	mtb $b0.0 = $r0.13
	c0	shru $r0.18 = $r0.11, $r0.12
	c0	mtb $b0.1 = $r0.13
;;
	c0	addcg $r0.13, $b0.0 = $r0.15, $r0.15, $b0.0
;;
	c0	divs $r0.15, $b0.0 = $r0.0, $r0.18, $b0.0
	c0	addcg $r0.19, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	addcg $r0.13, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.15, $r0.18, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.18, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.18, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.18, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.18, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.18, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.18, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.18, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.18, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.18, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.18, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.18, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.18, $b0.0
;;
	c0	addcg $r0.15, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.18, $b0.1
	c0	cmpgeu $r0.19 = $r0.16, $r0.11
;;
	c0	addcg $r0.20, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.18, $b0.0
;;
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.18, $b0.1
	c0	addcg $r0.15, $b0.0 = $r0.20, $r0.20, $b0.0
;;
	c0	addcg $r0.20, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.18, $b0.0
;;
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.18, $b0.1
	c0	mtb $b0.2 = $r0.12
	c0	addcg $r0.12, $b0.0 = $r0.20, $r0.20, $b0.0
;;
	c0	cmpge $b0.0 = $r0.13, $r0.0
	c0	addcg $r0.13, $b0.1 = $r0.12, $r0.12, $b0.1
;;
	c0	mfb $r0.12 = $b0.0
	c0	orc $r0.13 = $r0.13, $r0.0
;;
	c0	sh1add $r0.12 = $r0.13, $r0.12
;;
	c0	slct $r0.12 = $b0.2, $r0.19, $r0.12
;;
	c0	shl $r0.13 = $r0.12, $r0.2
	c0	goto LBB62_70
;;
LBB62_66:                               ## %if.end.81.estimateDiv64To32.exit285_crit_edge
	c0	zxth $r0.12 = $r0.10
	c0	mov $r0.13 = -1
	c0	goto LBB62_77
;;
LBB62_68:
	c0	mov $r0.13 = -65536
;;
LBB62_70:                               ## %cond.end.i.257
	c0	shru $r0.15 = $r0.13, $r0.2
	c0	zxth $r0.12 = $r0.10
	c0	mov $r0.18 = -1
;;
	c0	mpylu $r0.19 = $r0.15, $r0.11
	c0	mpyhs $r0.20 = $r0.15, $r0.12
	c0	mpylu $r0.21 = $r0.15, $r0.12
;;
	c0	add $r0.20 = $r0.21, $r0.20
	c0	mpyhs $r0.15 = $r0.15, $r0.11
;;
	c0	add $r0.15 = $r0.19, $r0.15
	c0	shl $r0.19 = $r0.20, $r0.2
	c0	shru $r0.20 = $r0.20, $r0.2
;;
	c0	sub $r0.21 = $r0.16, $r0.15
	c0	cmpltu $r0.22 = $r0.17, $r0.19
	c0	sub $r0.15 = $r0.17, $r0.19
;;
	c0	sub $r0.19 = $r0.21, $r0.20
	c0	mtb $b0.0 = $r0.22
;;
	c0	slct $r0.18 = $b0.0, $r0.18, 0
;;
	c0	add $r0.18 = $r0.19, $r0.18
;;
	c0	cmpgt $b0.0 = $r0.18, -1
;;
	c0	br $b0.0, LBB62_73
;;
## BB#71:                               ## %while.body.lr.ph.i.259
	c0	shl $r0.19 = $r0.10, $r0.2
;;
LBB62_72:                               ## %while.body.i.270
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.15 = $r0.15, $r0.19
	c0	add $r0.18 = $r0.18, $r0.11
	c0	add $r0.13 = $r0.13, -65536
;;
	c0	cmpltu $r0.20 = $r0.15, $r0.19
;;
	c0	add $r0.18 = $r0.18, $r0.20
;;
	c0	cmplt $b0.0 = $r0.18, 0
;;
	c0	br $b0.0, LBB62_72
;;
LBB62_73:                               ## %while.end.i.278
	c0	shl $r0.18 = $r0.18, $r0.2
	c0	shru $r0.15 = $r0.15, $r0.2
;;
	c0	or $r0.15 = $r0.15, $r0.18
;;
	c0	cmpleu $b0.0 = $r0.14, $r0.15
;;
	c0	br $b0.0, LBB62_74
;;
## BB#75:                               ## %cond.false.10.i.280
	c0	cmplt $r0.14 = $r0.11, $r0.0
	c0	mov $r0.18 = 0
;;
	c0	shru $r0.19 = $r0.15, $r0.14
	c0	mtb $b0.0 = $r0.18
	c0	shru $r0.20 = $r0.11, $r0.14
	c0	mtb $b0.1 = $r0.18
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
	c0	cmpgeu $r0.15 = $r0.15, $r0.11
;;
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.20, $b0.1
	c0	mtb $b0.2 = $r0.14
	c0	addcg $r0.14, $b0.0 = $r0.21, $r0.21, $b0.0
;;
	c0	cmpge $b0.0 = $r0.18, $r0.0
	c0	addcg $r0.18, $b0.1 = $r0.14, $r0.14, $b0.1
;;
	c0	mfb $r0.14 = $b0.0
	c0	orc $r0.18 = $r0.18, $r0.0
;;
	c0	sh1add $r0.14 = $r0.18, $r0.14
;;
	c0	slct $r0.14 = $b0.2, $r0.15, $r0.14
	c0	goto LBB62_76
;;
LBB62_74:
	c0	mov $r0.14 = 65535
;;
LBB62_76:                               ## %cond.end.12.i.283
	c0	or $r0.13 = $r0.14, $r0.13
;;
LBB62_77:                               ## %estimateDiv64To32.exit285
	c0	mov $r0.15 = 5
	c0	shru $r0.19 = $r0.13, $r0.2
	c0	zxth $r0.20 = $r0.13
	c0	and $r0.14 = $r0.9, 63488
	c0	mov $r0.18 = -1
;;
	c0	shru $r0.7 = $r0.7, $r0.15
	c0	mpylu $r0.15 = $r0.20, $r0.11
	c0	mpyhs $r0.21 = $r0.20, $r0.11
	c0	mpylu $r0.22 = $r0.19, $r0.12
	c0	mpyhs $r0.23 = $r0.19, $r0.12
	c0	mpylu $r0.24 = $r0.19, $r0.14
	c0	mpyhs $r0.25 = $r0.19, $r0.14
;;
	c0	zxth $r0.7 = $r0.7
	c0	add $r0.15 = $r0.15, $r0.21
	c0	add $r0.21 = $r0.22, $r0.23
	c0	add $r0.22 = $r0.24, $r0.25
	c0	mpyhs $r0.23 = $r0.20, $r0.12
	c0	mpylu $r0.24 = $r0.20, $r0.12
	c0	mpyhs $r0.25 = $r0.20, $r0.14
	c0	mpylu $r0.26 = $r0.20, $r0.14
;;
	c0	mpyhs $r0.27 = $r0.20, $r0.7
	c0	mpylu $r0.20 = $r0.20, $r0.7
	c0	add $r0.15 = $r0.21, $r0.15
	c0	mpylu $r0.28 = $r0.19, $r0.7
	c0	mpyhs $r0.29 = $r0.19, $r0.7
	c0	add $r0.23 = $r0.24, $r0.23
	c0	add $r0.24 = $r0.26, $r0.25
	c0	mpyhs $r0.25 = $r0.19, $r0.11
;;
	c0	add $r0.20 = $r0.20, $r0.27
	c0	shl $r0.26 = $r0.15, $r0.2
	c0	add $r0.27 = $r0.28, $r0.29
	c0	mpylu $r0.19 = $r0.19, $r0.11
	c0	cmpltu $r0.21 = $r0.15, $r0.21
	c0	shru $r0.28 = $r0.15, $r0.2
;;
	c0	add $r0.15 = $r0.22, $r0.20
	c0	add $r0.20 = $r0.26, $r0.23
;;
	c0	cmpltu $r0.22 = $r0.15, $r0.22
	c0	shl $r0.23 = $r0.15, $r0.2
	c0	shru $r0.15 = $r0.15, $r0.2
	c0	add $r0.27 = $r0.20, $r0.27
;;
	c0	shl $r0.22 = $r0.22, $r0.2
	c0	add $r0.24 = $r0.23, $r0.24
;;
	c0	or $r0.15 = $r0.22, $r0.15
	c0	cmpltu $r0.22 = $r0.24, $r0.23
;;
	c0	add $r0.23 = $r0.27, $r0.15
	c0	mov $r0.15 = 0
	c0	add $r0.19 = $r0.19, $r0.25
;;
	c0	sub $r0.16 = $r0.16, $r0.19
	c0	cmpne $b0.0 = $r0.24, 0
	c0	add $r0.19 = $r0.23, $r0.22
	c0	shl $r0.21 = $r0.21, $r0.2
	c0	cmpltu $r0.22 = $r0.20, $r0.26
;;
	c0	or $r0.21 = $r0.21, $r0.28
	c0	mtb $b0.1 = $r0.22
;;
	c0	sub $r0.21 = $r0.16, $r0.21
	c0	mfb $r0.22 = $b0.1
	c0	mfb $r0.23 = $b0.0
	c0	sub $r0.25 = $r0.17, $r0.19
	c0	sub $r0.16 = $r0.15, $r0.24
;;
	c0	add $r0.21 = $r0.21, $r0.22
	c0	cmpltu $r0.22 = $r0.17, $r0.19
	c0	cmpltu $r0.19 = $r0.19, $r0.20
	c0	cmpltu $r0.20 = $r0.25, $r0.23
	c0	sub $r0.17 = $r0.25, $r0.23
;;
	c0	mtb $b0.0 = $r0.19
	c0	mtb $b0.1 = $r0.22
	c0	mtb $b0.2 = $r0.20
;;
	c0	slct $r0.19 = $b0.0, $r0.18, 0
	c0	slct $r0.20 = $b0.1, $r0.18, 0
	c0	slct $r0.22 = $b0.2, $r0.18, 0
;;
	c0	add $r0.19 = $r0.21, $r0.19
;;
	c0	add $r0.19 = $r0.19, $r0.20
;;
	c0	add $r0.19 = $r0.19, $r0.22
;;
	c0	cmpgt $b0.0 = $r0.19, -1
;;
	c0	br $b0.0, LBB62_79
;;
LBB62_78:                               ## %while.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.16 = $r0.9, $r0.16
	c0	add $r0.20 = $r0.17, $r0.10
;;
	c0	cmpltu $r0.21 = $r0.16, $r0.9
	c0	add $r0.13 = $r0.13, -1
	c0	cmpltu $r0.17 = $r0.20, $r0.17
;;
	c0	add $r0.19 = $r0.17, $r0.19
	c0	add $r0.17 = $r0.21, $r0.20
;;
	c0	cmpltu $r0.20 = $r0.17, $r0.21
;;
	c0	add $r0.19 = $r0.19, $r0.20
;;
	c0	cmplt $b0.0 = $r0.19, 0
;;
	c0	br $b0.0, LBB62_78
;;
LBB62_79:                               ## %while.end
	c0	cmpleu $b0.0 = $r0.10, $r0.17
;;
	c0	br $b0.0, LBB62_93
;;
## BB#80:                               ## %if.end.i
	c0	shl $r0.20 = $r0.11, $r0.2
;;
	c0	cmpleu $b0.0 = $r0.20, $r0.17
;;
	c0	br $b0.0, LBB62_81
;;
## BB#82:                               ## %cond.false.i
	c0	cmplt $r0.18 = $r0.11, $r0.0
	c0	mov $r0.19 = 0
;;
	c0	shru $r0.21 = $r0.17, $r0.18
	c0	mtb $b0.0 = $r0.19
	c0	shru $r0.22 = $r0.11, $r0.18
	c0	mtb $b0.1 = $r0.19
;;
	c0	addcg $r0.19, $b0.0 = $r0.21, $r0.21, $b0.0
;;
	c0	divs $r0.21, $b0.0 = $r0.0, $r0.22, $b0.0
	c0	addcg $r0.23, $b0.1 = $r0.19, $r0.19, $b0.1
;;
	c0	addcg $r0.19, $b0.0 = $r0.23, $r0.23, $b0.0
	c0	divs $r0.21, $b0.1 = $r0.21, $r0.22, $b0.1
;;
	c0	addcg $r0.23, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.21, $r0.22, $b0.0
;;
	c0	addcg $r0.21, $b0.0 = $r0.23, $r0.23, $b0.0
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.22, $b0.1
;;
	c0	addcg $r0.23, $b0.1 = $r0.21, $r0.21, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.19, $r0.22, $b0.0
;;
	c0	addcg $r0.21, $b0.0 = $r0.23, $r0.23, $b0.0
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.22, $b0.1
;;
	c0	addcg $r0.23, $b0.1 = $r0.21, $r0.21, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.19, $r0.22, $b0.0
;;
	c0	addcg $r0.21, $b0.0 = $r0.23, $r0.23, $b0.0
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.22, $b0.1
;;
	c0	addcg $r0.23, $b0.1 = $r0.21, $r0.21, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.19, $r0.22, $b0.0
;;
	c0	addcg $r0.21, $b0.0 = $r0.23, $r0.23, $b0.0
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.22, $b0.1
;;
	c0	addcg $r0.23, $b0.1 = $r0.21, $r0.21, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.19, $r0.22, $b0.0
;;
	c0	addcg $r0.21, $b0.0 = $r0.23, $r0.23, $b0.0
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.22, $b0.1
;;
	c0	addcg $r0.23, $b0.1 = $r0.21, $r0.21, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.19, $r0.22, $b0.0
;;
	c0	addcg $r0.21, $b0.0 = $r0.23, $r0.23, $b0.0
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.22, $b0.1
;;
	c0	addcg $r0.23, $b0.1 = $r0.21, $r0.21, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.19, $r0.22, $b0.0
;;
	c0	addcg $r0.21, $b0.0 = $r0.23, $r0.23, $b0.0
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.22, $b0.1
;;
	c0	addcg $r0.23, $b0.1 = $r0.21, $r0.21, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.19, $r0.22, $b0.0
;;
	c0	addcg $r0.21, $b0.0 = $r0.23, $r0.23, $b0.0
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.22, $b0.1
;;
	c0	addcg $r0.23, $b0.1 = $r0.21, $r0.21, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.19, $r0.22, $b0.0
;;
	c0	addcg $r0.21, $b0.0 = $r0.23, $r0.23, $b0.0
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.22, $b0.1
;;
	c0	addcg $r0.23, $b0.1 = $r0.21, $r0.21, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.19, $r0.22, $b0.0
;;
	c0	addcg $r0.21, $b0.0 = $r0.23, $r0.23, $b0.0
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.22, $b0.1
;;
	c0	addcg $r0.23, $b0.1 = $r0.21, $r0.21, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.19, $r0.22, $b0.0
;;
	c0	addcg $r0.21, $b0.0 = $r0.23, $r0.23, $b0.0
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.22, $b0.1
;;
	c0	addcg $r0.23, $b0.1 = $r0.21, $r0.21, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.19, $r0.22, $b0.0
;;
	c0	addcg $r0.21, $b0.0 = $r0.23, $r0.23, $b0.0
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.22, $b0.1
;;
	c0	addcg $r0.23, $b0.1 = $r0.21, $r0.21, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.19, $r0.22, $b0.0
;;
	c0	addcg $r0.21, $b0.0 = $r0.23, $r0.23, $b0.0
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.22, $b0.1
	c0	cmpgeu $r0.23 = $r0.17, $r0.11
;;
	c0	addcg $r0.24, $b0.1 = $r0.21, $r0.21, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.19, $r0.22, $b0.0
;;
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.22, $b0.1
	c0	addcg $r0.21, $b0.0 = $r0.24, $r0.24, $b0.0
;;
	c0	addcg $r0.24, $b0.1 = $r0.21, $r0.21, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.19, $r0.22, $b0.0
	c0	mtb $b0.2 = $r0.18
;;
	c0	divs $r0.18, $b0.1 = $r0.19, $r0.22, $b0.1
	c0	addcg $r0.19, $b0.0 = $r0.24, $r0.24, $b0.0
;;
	c0	cmpge $b0.0 = $r0.18, $r0.0
	c0	addcg $r0.18, $b0.1 = $r0.19, $r0.19, $b0.1
;;
	c0	mfb $r0.19 = $b0.0
	c0	orc $r0.18 = $r0.18, $r0.0
;;
	c0	sh1add $r0.18 = $r0.18, $r0.19
;;
	c0	slct $r0.18 = $b0.2, $r0.23, $r0.18
;;
	c0	shl $r0.18 = $r0.18, $r0.2
	c0	goto LBB62_83
;;
LBB62_81:
	c0	mov $r0.18 = -65536
;;
LBB62_83:                               ## %cond.end.i
	c0	shru $r0.21 = $r0.18, $r0.2
	c0	mov $r0.19 = -1
;;
	c0	mpyhs $r0.22 = $r0.21, $r0.12
	c0	mpylu $r0.23 = $r0.21, $r0.12
	c0	mpylu $r0.24 = $r0.21, $r0.11
;;
	c0	add $r0.22 = $r0.23, $r0.22
	c0	mpyhs $r0.21 = $r0.21, $r0.11
;;
	c0	add $r0.21 = $r0.24, $r0.21
	c0	shl $r0.23 = $r0.22, $r0.2
	c0	shru $r0.22 = $r0.22, $r0.2
;;
	c0	sub $r0.24 = $r0.17, $r0.21
	c0	cmpltu $r0.25 = $r0.16, $r0.23
	c0	sub $r0.21 = $r0.16, $r0.23
;;
	c0	sub $r0.22 = $r0.24, $r0.22
	c0	mtb $b0.0 = $r0.25
;;
	c0	slct $r0.23 = $b0.0, $r0.19, 0
;;
	c0	add $r0.22 = $r0.22, $r0.23
;;
	c0	cmpgt $b0.0 = $r0.22, -1
;;
	c0	br $b0.0, LBB62_86
;;
## BB#84:                               ## %while.body.lr.ph.i
	c0	shl $r0.23 = $r0.10, $r0.2
;;
LBB62_85:                               ## %while.body.i
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.21 = $r0.21, $r0.23
	c0	add $r0.22 = $r0.22, $r0.11
	c0	add $r0.18 = $r0.18, -65536
;;
	c0	cmpltu $r0.24 = $r0.21, $r0.23
;;
	c0	add $r0.22 = $r0.22, $r0.24
;;
	c0	cmplt $b0.0 = $r0.22, 0
;;
	c0	br $b0.0, LBB62_85
;;
LBB62_86:                               ## %while.end.i
	c0	shl $r0.22 = $r0.22, $r0.2
	c0	shru $r0.21 = $r0.21, $r0.2
;;
	c0	or $r0.21 = $r0.21, $r0.22
;;
	c0	cmpleu $b0.0 = $r0.20, $r0.21
;;
	c0	br $b0.0, LBB62_87
;;
## BB#88:                               ## %cond.false.10.i
	c0	cmplt $r0.20 = $r0.11, $r0.0
	c0	mov $r0.22 = 0
;;
	c0	shru $r0.23 = $r0.21, $r0.20
	c0	mtb $b0.0 = $r0.22
	c0	shru $r0.24 = $r0.11, $r0.20
	c0	mtb $b0.1 = $r0.22
;;
	c0	addcg $r0.22, $b0.0 = $r0.23, $r0.23, $b0.0
;;
	c0	divs $r0.23, $b0.0 = $r0.0, $r0.24, $b0.0
	c0	addcg $r0.25, $b0.1 = $r0.22, $r0.22, $b0.1
;;
	c0	addcg $r0.22, $b0.0 = $r0.25, $r0.25, $b0.0
	c0	divs $r0.23, $b0.1 = $r0.23, $r0.24, $b0.1
;;
	c0	addcg $r0.25, $b0.1 = $r0.22, $r0.22, $b0.1
	c0	divs $r0.22, $b0.0 = $r0.23, $r0.24, $b0.0
;;
	c0	addcg $r0.23, $b0.0 = $r0.25, $r0.25, $b0.0
	c0	divs $r0.22, $b0.1 = $r0.22, $r0.24, $b0.1
;;
	c0	addcg $r0.25, $b0.1 = $r0.23, $r0.23, $b0.1
	c0	divs $r0.22, $b0.0 = $r0.22, $r0.24, $b0.0
;;
	c0	addcg $r0.23, $b0.0 = $r0.25, $r0.25, $b0.0
	c0	divs $r0.22, $b0.1 = $r0.22, $r0.24, $b0.1
;;
	c0	addcg $r0.25, $b0.1 = $r0.23, $r0.23, $b0.1
	c0	divs $r0.22, $b0.0 = $r0.22, $r0.24, $b0.0
;;
	c0	addcg $r0.23, $b0.0 = $r0.25, $r0.25, $b0.0
	c0	divs $r0.22, $b0.1 = $r0.22, $r0.24, $b0.1
;;
	c0	addcg $r0.25, $b0.1 = $r0.23, $r0.23, $b0.1
	c0	divs $r0.22, $b0.0 = $r0.22, $r0.24, $b0.0
;;
	c0	addcg $r0.23, $b0.0 = $r0.25, $r0.25, $b0.0
	c0	divs $r0.22, $b0.1 = $r0.22, $r0.24, $b0.1
;;
	c0	addcg $r0.25, $b0.1 = $r0.23, $r0.23, $b0.1
	c0	divs $r0.22, $b0.0 = $r0.22, $r0.24, $b0.0
;;
	c0	addcg $r0.23, $b0.0 = $r0.25, $r0.25, $b0.0
	c0	divs $r0.22, $b0.1 = $r0.22, $r0.24, $b0.1
;;
	c0	addcg $r0.25, $b0.1 = $r0.23, $r0.23, $b0.1
	c0	divs $r0.22, $b0.0 = $r0.22, $r0.24, $b0.0
;;
	c0	addcg $r0.23, $b0.0 = $r0.25, $r0.25, $b0.0
	c0	divs $r0.22, $b0.1 = $r0.22, $r0.24, $b0.1
;;
	c0	addcg $r0.25, $b0.1 = $r0.23, $r0.23, $b0.1
	c0	divs $r0.22, $b0.0 = $r0.22, $r0.24, $b0.0
;;
	c0	addcg $r0.23, $b0.0 = $r0.25, $r0.25, $b0.0
	c0	divs $r0.22, $b0.1 = $r0.22, $r0.24, $b0.1
;;
	c0	addcg $r0.25, $b0.1 = $r0.23, $r0.23, $b0.1
	c0	divs $r0.22, $b0.0 = $r0.22, $r0.24, $b0.0
;;
	c0	addcg $r0.23, $b0.0 = $r0.25, $r0.25, $b0.0
	c0	divs $r0.22, $b0.1 = $r0.22, $r0.24, $b0.1
;;
	c0	addcg $r0.25, $b0.1 = $r0.23, $r0.23, $b0.1
	c0	divs $r0.22, $b0.0 = $r0.22, $r0.24, $b0.0
;;
	c0	addcg $r0.23, $b0.0 = $r0.25, $r0.25, $b0.0
	c0	divs $r0.22, $b0.1 = $r0.22, $r0.24, $b0.1
;;
	c0	addcg $r0.25, $b0.1 = $r0.23, $r0.23, $b0.1
	c0	divs $r0.22, $b0.0 = $r0.22, $r0.24, $b0.0
;;
	c0	addcg $r0.23, $b0.0 = $r0.25, $r0.25, $b0.0
	c0	divs $r0.22, $b0.1 = $r0.22, $r0.24, $b0.1
;;
	c0	addcg $r0.25, $b0.1 = $r0.23, $r0.23, $b0.1
	c0	divs $r0.22, $b0.0 = $r0.22, $r0.24, $b0.0
;;
	c0	addcg $r0.23, $b0.0 = $r0.25, $r0.25, $b0.0
	c0	divs $r0.22, $b0.1 = $r0.22, $r0.24, $b0.1
;;
	c0	addcg $r0.25, $b0.1 = $r0.23, $r0.23, $b0.1
	c0	divs $r0.22, $b0.0 = $r0.22, $r0.24, $b0.0
;;
	c0	addcg $r0.23, $b0.0 = $r0.25, $r0.25, $b0.0
	c0	divs $r0.22, $b0.1 = $r0.22, $r0.24, $b0.1
;;
	c0	addcg $r0.25, $b0.1 = $r0.23, $r0.23, $b0.1
	c0	divs $r0.22, $b0.0 = $r0.22, $r0.24, $b0.0
;;
	c0	addcg $r0.23, $b0.0 = $r0.25, $r0.25, $b0.0
	c0	divs $r0.22, $b0.1 = $r0.22, $r0.24, $b0.1
;;
	c0	addcg $r0.25, $b0.1 = $r0.23, $r0.23, $b0.1
	c0	divs $r0.22, $b0.0 = $r0.22, $r0.24, $b0.0
;;
	c0	addcg $r0.23, $b0.0 = $r0.25, $r0.25, $b0.0
	c0	divs $r0.22, $b0.1 = $r0.22, $r0.24, $b0.1
;;
	c0	addcg $r0.25, $b0.1 = $r0.23, $r0.23, $b0.1
	c0	divs $r0.22, $b0.0 = $r0.22, $r0.24, $b0.0
	c0	cmpgeu $r0.21 = $r0.21, $r0.11
;;
	c0	divs $r0.22, $b0.1 = $r0.22, $r0.24, $b0.1
	c0	mtb $b0.2 = $r0.20
	c0	addcg $r0.20, $b0.0 = $r0.25, $r0.25, $b0.0
;;
	c0	cmpge $b0.0 = $r0.22, $r0.0
	c0	addcg $r0.22, $b0.1 = $r0.20, $r0.20, $b0.1
;;
	c0	mfb $r0.20 = $b0.0
	c0	orc $r0.22 = $r0.22, $r0.0
;;
	c0	sh1add $r0.20 = $r0.22, $r0.20
;;
	c0	slct $r0.20 = $b0.2, $r0.21, $r0.20
	c0	goto LBB62_89
;;
LBB62_87:
	c0	mov $r0.20 = 65535
;;
LBB62_89:                               ## %estimateDiv64To32.exit
	c0	or $r0.18 = $r0.20, $r0.18
;;
	c0	and $r0.20 = $r0.18, 1023
;;
	c0	cmpgtu $b0.0 = $r0.20, 4
;;
	c0	br $b0.0, LBB62_93
;;
## BB#90:                               ## %if.then.86
	c0	shru $r0.20 = $r0.18, $r0.2
	c0	zxth $r0.21 = $r0.18
;;
	c0	mpylu $r0.22 = $r0.20, $r0.14
	c0	mpyhs $r0.23 = $r0.20, $r0.14
	c0	mpyhs $r0.24 = $r0.21, $r0.7
	c0	mpylu $r0.25 = $r0.21, $r0.7
	c0	mpyhs $r0.26 = $r0.20, $r0.12
	c0	mpylu $r0.27 = $r0.20, $r0.12
;;
	c0	mpyhs $r0.28 = $r0.21, $r0.11
	c0	mpylu $r0.29 = $r0.21, $r0.11
	c0	add $r0.22 = $r0.22, $r0.23
	c0	add $r0.23 = $r0.25, $r0.24
	c0	add $r0.24 = $r0.27, $r0.26
	c0	mpylu $r0.25 = $r0.21, $r0.12
	c0	mpyhs $r0.12 = $r0.21, $r0.12
	c0	mpyhs $r0.26 = $r0.20, $r0.7
;;
	c0	add $r0.27 = $r0.29, $r0.28
	c0	add $r0.23 = $r0.22, $r0.23
	c0	mpylu $r0.7 = $r0.20, $r0.7
	c0	add $r0.12 = $r0.25, $r0.12
	c0	mpylu $r0.25 = $r0.21, $r0.14
	c0	mpyhs $r0.14 = $r0.21, $r0.14
	c0	mpylu $r0.21 = $r0.20, $r0.11
;;
	c0	add $r0.27 = $r0.24, $r0.27
	c0	cmpltu $r0.22 = $r0.23, $r0.22
	c0	add $r0.7 = $r0.7, $r0.26
;;
	c0	shl $r0.26 = $r0.27, $r0.2
	c0	add $r0.14 = $r0.25, $r0.14
	c0	shru $r0.25 = $r0.23, $r0.2
	c0	shl $r0.23 = $r0.23, $r0.2
	c0	shl $r0.22 = $r0.22, $r0.2
;;
	c0	add $r0.12 = $r0.26, $r0.12
	c0	add $r0.14 = $r0.23, $r0.14
	c0	or $r0.22 = $r0.22, $r0.25
;;
	c0	add $r0.7 = $r0.12, $r0.7
	c0	mpyhs $r0.11 = $r0.20, $r0.11
;;
	c0	add $r0.11 = $r0.21, $r0.11
	c0	cmpltu $r0.20 = $r0.14, $r0.23
	c0	add $r0.7 = $r0.7, $r0.22
;;
	c0	sub $r0.11 = $r0.17, $r0.11
	c0	cmpltu $r0.17 = $r0.27, $r0.24
	c0	shru $r0.21 = $r0.27, $r0.2
;;
	c0	shl $r0.2 = $r0.17, $r0.2
	c0	cmpltu $r0.17 = $r0.12, $r0.26
;;
	c0	or $r0.2 = $r0.2, $r0.21
	c0	add $r0.7 = $r0.7, $r0.20
	c0	cmpne $b0.0 = $r0.14, 0
	c0	mtb $b0.1 = $r0.17
;;
	c0	sub $r0.2 = $r0.11, $r0.2
	c0	mfb $r0.11 = $b0.1
	c0	cmpltu $r0.12 = $r0.7, $r0.12
	c0	cmpltu $r0.17 = $r0.16, $r0.7
	c0	mfb $r0.20 = $b0.0
	c0	sub $r0.7 = $r0.16, $r0.7
;;
	c0	add $r0.11 = $r0.2, $r0.11
	c0	mtb $b0.0 = $r0.12
	c0	mtb $b0.1 = $r0.17
	c0	cmpltu $r0.2 = $r0.7, $r0.20
;;
	c0	mtb $b0.2 = $r0.2
	c0	slct $r0.12 = $b0.0, $r0.19, 0
	c0	sub $r0.2 = $r0.15, $r0.14
	c0	sub $r0.7 = $r0.7, $r0.20
	c0	slct $r0.14 = $b0.1, $r0.19, 0
;;
	c0	slct $r0.15 = $b0.2, $r0.19, 0
	c0	add $r0.11 = $r0.11, $r0.12
;;
	c0	add $r0.11 = $r0.11, $r0.14
;;
	c0	add $r0.11 = $r0.11, $r0.15
;;
	c0	cmpgt $b0.0 = $r0.11, -1
;;
	c0	br $b0.0, LBB62_92
;;
LBB62_91:                               ## %while.body.89
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.2 = $r0.9, $r0.2
	c0	add $r0.12 = $r0.7, $r0.10
;;
	c0	cmpltu $r0.14 = $r0.2, $r0.9
	c0	add $r0.18 = $r0.18, -1
	c0	cmpltu $r0.7 = $r0.12, $r0.7
;;
	c0	add $r0.11 = $r0.7, $r0.11
	c0	add $r0.7 = $r0.14, $r0.12
;;
	c0	cmpltu $r0.12 = $r0.7, $r0.14
;;
	c0	add $r0.11 = $r0.11, $r0.12
;;
	c0	cmplt $b0.0 = $r0.11, 0
;;
	c0	br $b0.0, LBB62_91
;;
LBB62_92:                               ## %while.end.91
	c0	or $r0.7 = $r0.7, $r0.11
;;
	c0	or $r0.2 = $r0.7, $r0.2
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	or $r0.18 = $r0.2, $r0.18
;;
LBB62_93:                               ## %if.end.96
	c0	shru $r0.2 = $r0.18, $r0.6
	c0	shl $r0.7 = $r0.13, $r0.8
	c0	shl $r0.8 = $r0.18, $r0.8
	c0	shru $r0.6 = $r0.13, $r0.6
;;
	c0	or $r0.7 = $r0.2, $r0.7
;;
.call roundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = roundAndPackFloat64
;;
.return ret()
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
	c0	mov $r0.2 = 20
;;
	c0	shru $r0.8 = $r0.4, $r0.2
	c0	shru $r0.2 = $r0.6, $r0.2
;;
	c0	and $r0.8 = $r0.8, 2047
	c0	and $r0.9 = $r0.6, 1048575
	c0	and $r0.10 = $r0.4, 1048575
	c0	and $r0.2 = $r0.2, 2047
;;
	c0	cmpne $b0.0 = $r0.8, 2047
;;
	c0	br $b0.0, LBB63_20
;;
## BB#1:                                ## %if.then
	c0	or $r0.8 = $r0.10, $r0.5
;;
	c0	cmpne $b0.0 = $r0.8, 0
;;
	c0	br $b0.0, LBB63_4
;;
## BB#2:                                ## %lor.lhs.false
	c0	cmpne $b0.0 = $r0.2, 2047
;;
	c0	br $b0.0, LBB63_37
;;
## BB#3:                                ## %lor.lhs.false
	c0	or $r0.2 = $r0.9, $r0.7
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB63_37
;;
LBB63_4:                                ## %if.then.30
	c0	and $r0.2 = $r0.4, 2146959360
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
	c0	br $b0.0, LBB63_5
;;
## BB#6:                                ## %land.rhs.i.59.i.467
	c0	cmpne $b0.0 = $r0.5, 0
;;
	c0	brf $b0.0, LBB63_8
;;
## BB#7:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB63_9
;;
LBB63_20:                               ## %if.end.35
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	brf $b0.0, LBB63_21
;;
## BB#36:                               ## %if.then.48
	c0	or $r0.2 = $r0.9, $r0.7
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	brf $b0.0, LBB63_37
;;
## BB#38:                               ## %if.end.54
	c0	mov $r0.2 = 16
	c0	cmpne $b0.0 = $r0.9, 0
;;
	c0	brf $b0.0, LBB63_39
;;
## BB#43:                               ## %if.else.7.i.443
	c0	cmpltu $b0.0 = $r0.9, 65536
	c0	mov $r0.11 = 8
	c0	mov $r0.12 = 22
	c0	mov $r0.13 = 4
	c0	mov $r0.14 = countLeadingZeros32.countLeadingZerosHigh
	c0	shl $r0.2 = $r0.6, $r0.2
;;
	c0	mfb $r0.6 = $b0.0
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.9
;;
	c0	shl $r0.6 = $r0.6, $r0.13
	c0	cmpltu $b0.0 = $r0.2, 16777216
	c0	shl $r0.11 = $r0.2, $r0.11
;;
	c0	or $r0.13 = $r0.6, 8
	c0	slct $r0.2 = $b0.0, $r0.11, $r0.2
;;
	c0	slct $r0.6 = $b0.0, $r0.13, $r0.6
	c0	shru $r0.2 = $r0.2, $r0.12
;;
	c0	and $r0.2 = $r0.2, 1020
;;
	c0	add $r0.2 = $r0.14, $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
	c0	add $r0.2 = $r0.2, $r0.6
;;
	c0	add $r0.6 = $r0.2, -11
;;
	c0	cmpeq $b0.0 = $r0.6, 0
;;
	c0	br $b0.0, LBB63_45
;;
## BB#44:                               ## %cond.false.i.i.449
	c0	mov $r0.11 = 11
	c0	shl $r0.9 = $r0.9, $r0.6
;;
	c0	sub $r0.11 = $r0.11, $r0.2
;;
	c0	and $r0.11 = $r0.11, 31
;;
	c0	shru $r0.11 = $r0.7, $r0.11
;;
	c0	or $r0.9 = $r0.11, $r0.9
;;
LBB63_45:                               ## %shortShift64Left.exit.i.452
	c0	mov $r0.11 = 12
	c0	shl $r0.7 = $r0.7, $r0.6
;;
	c0	sub $r0.2 = $r0.11, $r0.2
	c0	goto LBB63_46
;;
LBB63_21:                               ## %if.end.35
	c0	cmpne $b0.0 = $r0.2, 2047
;;
	c0	br $b0.0, LBB63_46
;;
## BB#22:                               ## %if.then.37
	c0	or $r0.2 = $r0.9, $r0.7
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB63_18
;;
## BB#23:                               ## %if.then.40
	c0	and $r0.2 = $r0.4, 2146959360
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
	c0	br $b0.0, LBB63_24
;;
## BB#25:                               ## %land.rhs.i.59.i
	c0	cmpne $b0.0 = $r0.5, 0
;;
	c0	brf $b0.0, LBB63_27
;;
## BB#26:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB63_28
;;
LBB63_5:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB63_9
;;
LBB63_37:                               ## %invalid
	c0	mov $r0.2 = float_exception_flags
	c0	mov $r0.4 = 2147483647
	c0	mov $r0.5 = -1
;;
	c0	ldw $r0.6 = 0[$r0.2]
;;
	c0	stw 0[$r0.3] = $r0.4
;;
	c0	stw 4[$r0.3] = $r0.5
	c0	or $r0.3 = $r0.6, 16
;;
.return ret()
	c0	stw 0[$r0.2] = $r0.3
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB63_8:                                ## %lor.rhs.i.62.i.470
	c0	and $r0.2 = $r0.4, 524287
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
LBB63_9:                                ## %float64_is_signaling_nan.exit64.i.473
	c0	and $r0.2 = $r0.6, 2146959360
;;
	c0	cmpne $b0.1 = $r0.2, 2146435072
;;
	c0	br $b0.1, LBB63_10
;;
## BB#11:                               ## %land.rhs.i.i.483
	c0	cmpeq $b0.1 = $r0.7, 0
;;
	c0	brf $b0.1, LBB63_12
;;
## BB#13:                               ## %lor.rhs.i.i.490
	c0	and $r0.2 = $r0.6, 524287
;;
	c0	cmpne $b0.1 = $r0.2, 0
	c0	goto LBB63_14
;;
LBB63_10:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.1 = $r0.2
;;
LBB63_14:                               ## %float64_is_signaling_nan.exit.i.494
	c0	mfb $r0.10 = $b0.1
	c0	mfb $r0.8 = $b0.0
	c0	or $r0.2 = $r0.6, 524288
;;
	c0	or $r0.10 = $r0.8, $r0.10
;;
	c0	and $r0.10 = $r0.10, 1
;;
	c0	cmpeq $b0.0 = $r0.10, 0
;;
	c0	br $b0.0, LBB63_17
;;
## BB#15:                               ## %if.then.i.497
	c0	mov $r0.10 = float_exception_flags
;;
	c0	ldw $r0.11 = 0[$r0.10]
;;
	c0	or $r0.11 = $r0.11, 16
;;
	c0	stw 0[$r0.10] = $r0.11
	c0	br $b0.1, LBB63_16
;;
LBB63_17:                               ## %cond.false.i.505
	c0	or $r0.4 = $r0.4, 524288
	c0	cmpne $b0.0 = $r0.8, 1
;;
	c0	brf $b0.0, LBB63_18
;;
## BB#19:                               ## %cond.false.22.i.508
	c0	mov $r0.8 = 1
	c0	or $r0.9 = $r0.9, $r0.7
;;
	c0	shl $r0.6 = $r0.6, $r0.8
	c0	cmpne $b0.0 = $r0.9, 0
;;
	c0	cmpgtu $b0.1 = $r0.6, -2097153
	c0	mfb $r0.6 = $b0.0
;;
	c0	mfb $r0.8 = $b0.1
;;
	c0	and $r0.6 = $r0.8, $r0.6
;;
	c0	mtb $b0.0 = $r0.6
;;
	c0	mfb $r0.6 = $b0.0
;;
	c0	cmpne $b0.0 = $r0.6, 1
;;
	c0	brf $b0.0, LBB63_16
;;
	c0	goto LBB63_18
;;
LBB63_39:                               ## %if.then.i.417
	c0	cmpltu $b0.0 = $r0.7, 65536
	c0	mov $r0.6 = 8
	c0	mov $r0.9 = 22
	c0	mov $r0.11 = 4
	c0	mov $r0.12 = countLeadingZeros32.countLeadingZerosHigh
	c0	shl $r0.2 = $r0.7, $r0.2
;;
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.7
;;
	c0	cmpltu $b0.1 = $r0.2, 16777216
	c0	shl $r0.6 = $r0.2, $r0.6
;;
	c0	slct $r0.2 = $b0.1, $r0.6, $r0.2
	c0	mfb $r0.6 = $b0.0
;;
	c0	shru $r0.2 = $r0.2, $r0.9
	c0	shl $r0.6 = $r0.6, $r0.11
;;
	c0	and $r0.2 = $r0.2, 1020
	c0	or $r0.9 = $r0.6, 8
;;
	c0	add $r0.2 = $r0.12, $r0.2
	c0	slct $r0.6 = $b0.1, $r0.9, $r0.6
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
	c0	add $r0.2 = $r0.2, $r0.6
;;
	c0	add $r0.6 = $r0.2, -11
	c0	cmpgt $b0.0 = $r0.2, 10
;;
	c0	br $b0.0, LBB63_41
;;
## BB#40:                               ## %if.then.2.i.422
	c0	mov $r0.9 = 11
	c0	and $r0.6 = $r0.6, 31
;;
	c0	sub $r0.9 = $r0.9, $r0.2
;;
	c0	shru $r0.9 = $r0.7, $r0.9
	c0	shl $r0.7 = $r0.7, $r0.6
	c0	goto LBB63_42
;;
LBB63_24:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB63_28
;;
LBB63_41:                               ## %if.else.i.424
	c0	mov $r0.11 = 0
	c0	shl $r0.9 = $r0.7, $r0.6
;;
	c0	mov $r0.7 = $r0.11
;;
LBB63_42:                               ## %if.end.i.427
	c0	mov $r0.6 = -20
;;
	c0	sub $r0.2 = $r0.6, $r0.2
;;
LBB63_46:                               ## %if.end.55
	c0	cmpne $b0.0 = $r0.8, 0
;;
	c0	brf $b0.0, LBB63_48
;;
## BB#47:
	c0	mov $r0.6 = $r0.5
	c0	goto LBB63_58
;;
LBB63_48:                               ## %if.then.57
	c0	or $r0.6 = $r0.10, $r0.5
;;
	c0	cmpne $b0.0 = $r0.6, 0
;;
	c0	brf $b0.0, LBB63_18
;;
## BB#49:                               ## %if.end.61
	c0	mov $r0.6 = 16
	c0	cmpne $b0.0 = $r0.10, 0
;;
	c0	brf $b0.0, LBB63_50
;;
## BB#54:                               ## %if.else.7.i
	c0	cmpltu $b0.0 = $r0.10, 65536
	c0	mov $r0.8 = 8
	c0	mov $r0.11 = 22
	c0	mov $r0.12 = 4
	c0	mov $r0.13 = countLeadingZeros32.countLeadingZerosHigh
	c0	shl $r0.6 = $r0.4, $r0.6
;;
	c0	mfb $r0.14 = $b0.0
	c0	slct $r0.6 = $b0.0, $r0.6, $r0.10
;;
	c0	shl $r0.12 = $r0.14, $r0.12
	c0	cmpltu $b0.0 = $r0.6, 16777216
	c0	shl $r0.8 = $r0.6, $r0.8
;;
	c0	or $r0.14 = $r0.12, 8
	c0	slct $r0.6 = $b0.0, $r0.8, $r0.6
;;
	c0	slct $r0.8 = $b0.0, $r0.14, $r0.12
	c0	shru $r0.6 = $r0.6, $r0.11
;;
	c0	and $r0.6 = $r0.6, 1020
;;
	c0	add $r0.6 = $r0.13, $r0.6
;;
	c0	ldw $r0.6 = 0[$r0.6]
;;
	c0	add $r0.8 = $r0.6, $r0.8
;;
	c0	add $r0.6 = $r0.8, -11
;;
	c0	cmpeq $b0.0 = $r0.6, 0
;;
	c0	br $b0.0, LBB63_56
;;
## BB#55:                               ## %cond.false.i.i
	c0	mov $r0.11 = 11
	c0	shl $r0.10 = $r0.10, $r0.6
;;
	c0	sub $r0.11 = $r0.11, $r0.8
;;
	c0	and $r0.11 = $r0.11, 31
;;
	c0	shru $r0.11 = $r0.5, $r0.11
;;
	c0	or $r0.10 = $r0.11, $r0.10
;;
LBB63_56:                               ## %shortShift64Left.exit.i
	c0	mov $r0.11 = 12
	c0	shl $r0.6 = $r0.5, $r0.6
	c0	goto LBB63_57
;;
LBB63_50:                               ## %if.then.i
	c0	cmpltu $b0.0 = $r0.5, 65536
	c0	mov $r0.8 = 8
	c0	mov $r0.10 = 22
	c0	mov $r0.11 = 4
	c0	mov $r0.12 = countLeadingZeros32.countLeadingZerosHigh
	c0	shl $r0.6 = $r0.5, $r0.6
;;
	c0	slct $r0.6 = $b0.0, $r0.6, $r0.5
;;
	c0	cmpltu $b0.1 = $r0.6, 16777216
	c0	shl $r0.8 = $r0.6, $r0.8
;;
	c0	slct $r0.6 = $b0.1, $r0.8, $r0.6
	c0	mfb $r0.8 = $b0.0
;;
	c0	shru $r0.6 = $r0.6, $r0.10
	c0	shl $r0.8 = $r0.8, $r0.11
;;
	c0	and $r0.6 = $r0.6, 1020
	c0	or $r0.10 = $r0.8, 8
;;
	c0	add $r0.6 = $r0.12, $r0.6
	c0	slct $r0.8 = $b0.1, $r0.10, $r0.8
;;
	c0	ldw $r0.6 = 0[$r0.6]
;;
	c0	add $r0.8 = $r0.6, $r0.8
;;
	c0	add $r0.10 = $r0.8, -11
	c0	cmpgt $b0.0 = $r0.8, 10
;;
	c0	br $b0.0, LBB63_52
;;
## BB#51:                               ## %if.then.2.i.397
	c0	mov $r0.6 = 11
	c0	and $r0.10 = $r0.10, 31
;;
	c0	sub $r0.11 = $r0.6, $r0.8
	c0	shl $r0.6 = $r0.5, $r0.10
;;
	c0	shru $r0.10 = $r0.5, $r0.11
	c0	mov $r0.11 = -20
	c0	goto LBB63_57
;;
LBB63_27:                               ## %lor.rhs.i.62.i
	c0	and $r0.2 = $r0.4, 524287
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
LBB63_28:                               ## %float64_is_signaling_nan.exit64.i
	c0	and $r0.2 = $r0.6, 2146959360
;;
	c0	cmpne $b0.1 = $r0.2, 2146435072
;;
	c0	br $b0.1, LBB63_29
;;
## BB#30:                               ## %land.rhs.i.i
	c0	cmpeq $b0.1 = $r0.7, 0
;;
	c0	br $b0.1, LBB63_31
;;
LBB63_12:                               ## %if.then.thread.i.487
	c0	mov $r0.4 = float_exception_flags
;;
	c0	ldw $r0.5 = 0[$r0.4]
	c0	or $r0.2 = $r0.6, 524288
;;
	c0	or $r0.5 = $r0.5, 16
;;
	c0	stw 0[$r0.4] = $r0.5
;;
LBB63_16:                               ## %cond.true.i.503
	c0	stw 0[$r0.3] = $r0.2
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.7
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB63_29:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.1 = $r0.2
	c0	goto LBB63_32
;;
LBB63_31:                               ## %lor.rhs.i.i
	c0	and $r0.2 = $r0.6, 524287
;;
	c0	cmpne $b0.1 = $r0.2, 0
;;
LBB63_32:                               ## %float64_is_signaling_nan.exit.i
	c0	mfb $r0.9 = $b0.1
	c0	mfb $r0.8 = $b0.0
	c0	or $r0.2 = $r0.6, 524288
;;
	c0	or $r0.9 = $r0.8, $r0.9
;;
	c0	and $r0.9 = $r0.9, 1
;;
	c0	cmpeq $b0.0 = $r0.9, 0
;;
	c0	br $b0.0, LBB63_34
;;
## BB#33:                               ## %if.then.i.461
	c0	mov $r0.9 = float_exception_flags
;;
	c0	ldw $r0.10 = 0[$r0.9]
;;
	c0	or $r0.10 = $r0.10, 16
;;
	c0	stw 0[$r0.9] = $r0.10
	c0	br $b0.1, LBB63_16
;;
LBB63_34:                               ## %cond.false.i.463
	c0	or $r0.4 = $r0.4, 524288
	c0	cmpne $b0.0 = $r0.8, 1
;;
	c0	brf $b0.0, LBB63_18
;;
## BB#35:                               ## %cond.false.22.i
	c0	mov $r0.8 = 1
;;
	c0	shl $r0.6 = $r0.6, $r0.8
;;
	c0	cmpltu $b0.0 = $r0.6, -2097152
;;
	c0	brf $b0.0, LBB63_16
;;
	c0	goto LBB63_18
;;
LBB63_52:                               ## %if.else.i.399
	c0	mov $r0.6 = 0
	c0	shl $r0.10 = $r0.5, $r0.10
	c0	mov $r0.11 = -20
;;
LBB63_57:                               ## %if.end.62
	c0	sub $r0.8 = $r0.11, $r0.8
;;
LBB63_58:                               ## %if.end.62
	c0	sub $r0.13 = $r0.8, $r0.2
;;
	c0	cmpgt $b0.0 = $r0.13, -2
;;
	c0	br $b0.0, LBB63_59
;;
LBB63_18:                               ## %cond.true.21.i.507
	c0	stw 0[$r0.3] = $r0.4
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.5
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB63_59:                               ## %if.end.65
	c0	mov $r0.8 = 31
	c0	mov $r0.11 = 11
	c0	mov $r0.5 = 0
	c0	mov $r0.12 = 21
	c0	or $r0.14 = $r0.10, 1048576
;;
	c0	shru $r0.10 = $r0.13, $r0.8
	c0	shl $r0.9 = $r0.9, $r0.11
	c0	shru $r0.12 = $r0.7, $r0.12
	c0	shl $r0.18 = $r0.7, $r0.11
;;
	c0	or $r0.9 = $r0.9, -2147483648
	c0	sub $r0.11 = $r0.11, $r0.10
;;
	c0	shl $r0.10 = $r0.6, $r0.11
	c0	shl $r0.14 = $r0.14, $r0.11
	c0	sub $r0.15 = $r0.5, $r0.11
	c0	or $r0.11 = $r0.12, $r0.9
;;
	c0	and $r0.15 = $r0.15, 23
;;
	c0	shru $r0.6 = $r0.6, $r0.15
;;
	c0	or $r0.6 = $r0.6, $r0.14
;;
	c0	cmpgtu $b0.0 = $r0.6, $r0.11
;;
	c0	brf $b0.0, LBB63_61
;;
## BB#60:
	c0	mov $r0.28 = 1
	c0	goto LBB63_62
;;
LBB63_61:                               ## %le64.exit
	c0	cmpeq $b0.0 = $r0.6, $r0.11
	c0	cmpgeu $b0.1 = $r0.10, $r0.18
;;
	c0	mfb $r0.14 = $b0.0
	c0	mfb $r0.15 = $b0.1
;;
	c0	and $r0.14 = $r0.15, $r0.14
;;
	c0	and $r0.28 = $r0.14, 1
;;
	c0	cmpeq $b0.0 = $r0.28, 0
;;
	c0	br $b0.0, LBB63_63
;;
LBB63_62:                               ## %if.then.72
	c0	cmpltu $r0.14 = $r0.10, $r0.18
	c0	mov $r0.15 = -1
	c0	sub $r0.6 = $r0.6, $r0.11
	c0	sub $r0.10 = $r0.10, $r0.18
;;
	c0	mtb $b0.0 = $r0.14
;;
	c0	slct $r0.14 = $b0.0, $r0.15, 0
;;
	c0	add $r0.6 = $r0.6, $r0.14
;;
LBB63_63:                               ## %if.end.73
	c0	add $r0.14 = $r0.13, -32
	c0	cmplt $b0.0 = $r0.13, 33
;;
	c0	br $b0.0, LBB63_64
;;
## BB#65:                               ## %while.body.lr.ph
	c0	mov $r0.15 = 16
	c0	mov $r0.13 = 5
;;
	c0	shru $r0.16 = $r0.9, $r0.15
	c0	shru $r0.13 = $r0.7, $r0.13
;;
	c0	cmplt $r0.17 = $r0.16, $r0.0
	c0	and $r0.18 = $r0.18, 63488
	c0	zxth $r0.19 = $r0.11
	c0	mov $r0.20 = 0
	c0	mov $r0.21 = -65536
	c0	mov $r0.22 = -1
;;
	c0	mov $r0.23 = 65535
	c0	shl $r0.24 = $r0.11, $r0.15
	c0	shl $r0.25 = $r0.16, $r0.15
	c0	zxth $r0.26 = $r0.13
	c0	shru $r0.27 = $r0.16, $r0.17
	c0	mtb $b0.0 = $r0.17
;;
LBB63_66:                               ## %while.body
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB63_70 Depth 2
	c0	cmpleu $b0.1 = $r0.11, $r0.6
	c0	mov $r0.13 = $r0.22
;;
	c0	br $b0.1, LBB63_74
;;
## BB#67:                               ## %if.end.i.318
                                        ##   in Loop: Header=BB63_66 Depth=1
	c0	cmpleu $b0.1 = $r0.25, $r0.6
	c0	mov $r0.13 = $r0.21
;;
	c0	br $b0.1, LBB63_69
;;
## BB#68:                               ## %cond.false.i.321
                                        ##   in Loop: Header=BB63_66 Depth=1
	c0	shru $r0.13 = $r0.6, $r0.17
	c0	mtb $b0.1 = $r0.20
	c0	mtb $b0.2 = $r0.20
	c0	cmpgeu $r0.28 = $r0.6, $r0.16
;;
	c0	addcg $r0.29, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	divs $r0.13, $b0.1 = $r0.0, $r0.27, $b0.1
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
;;
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.27, $b0.2
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.27, $b0.1
;;
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.27, $b0.2
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.27, $b0.1
;;
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.27, $b0.2
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.27, $b0.1
;;
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.27, $b0.2
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.27, $b0.1
;;
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.27, $b0.2
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.27, $b0.1
;;
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.27, $b0.2
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.27, $b0.1
;;
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.27, $b0.2
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.27, $b0.1
;;
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.27, $b0.2
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.27, $b0.1
;;
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.27, $b0.2
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.27, $b0.1
;;
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.27, $b0.2
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.27, $b0.1
;;
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.27, $b0.2
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.27, $b0.1
;;
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.27, $b0.2
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.27, $b0.1
;;
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.27, $b0.2
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.27, $b0.1
;;
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.27, $b0.2
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.27, $b0.1
;;
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.27, $b0.2
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
;;
	c0	addcg $r0.30, $b0.2 = $r0.29, $r0.29, $b0.2
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.27, $b0.1
;;
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.27, $b0.2
	c0	addcg $r0.29, $b0.1 = $r0.30, $r0.30, $b0.1
;;
	c0	cmpge $b0.1 = $r0.13, $r0.0
	c0	addcg $r0.13, $b0.2 = $r0.29, $r0.29, $b0.2
;;
	c0	orc $r0.13 = $r0.13, $r0.0
	c0	mfb $r0.29 = $b0.1
;;
	c0	sh1add $r0.13 = $r0.13, $r0.29
;;
	c0	slct $r0.13 = $b0.0, $r0.28, $r0.13
;;
	c0	shl $r0.13 = $r0.13, $r0.15
;;
LBB63_69:                               ## %cond.end.i.336
                                        ##   in Loop: Header=BB63_66 Depth=1
	c0	shru $r0.28 = $r0.13, $r0.15
;;
	c0	mpylu $r0.29 = $r0.28, $r0.19
	c0	mpyhs $r0.30 = $r0.28, $r0.19
	c0	mpyhs $r0.31 = $r0.28, $r0.16
;;
	c0	add $r0.29 = $r0.29, $r0.30
	c0	mpylu $r0.28 = $r0.28, $r0.16
;;
	c0	add $r0.28 = $r0.28, $r0.31
	c0	shl $r0.30 = $r0.29, $r0.15
	c0	shru $r0.29 = $r0.29, $r0.15
;;
	c0	sub $r0.31 = $r0.6, $r0.28
	c0	cmpltu $r0.32 = $r0.10, $r0.30
	c0	sub $r0.28 = $r0.10, $r0.30
;;
	c0	sub $r0.29 = $r0.31, $r0.29
	c0	mtb $b0.1 = $r0.32
;;
	c0	slct $r0.30 = $b0.1, $r0.22, 0
;;
	c0	add $r0.29 = $r0.29, $r0.30
;;
	c0	cmpgt $b0.1 = $r0.29, -1
;;
	c0	br $b0.1, LBB63_71
;;
LBB63_70:                               ## %while.body.i.349
                                        ##   Parent Loop BB63_66 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	add $r0.28 = $r0.28, $r0.24
	c0	add $r0.29 = $r0.29, $r0.16
	c0	add $r0.13 = $r0.13, -65536
;;
	c0	cmpltu $r0.30 = $r0.28, $r0.24
;;
	c0	add $r0.29 = $r0.29, $r0.30
;;
	c0	cmplt $b0.1 = $r0.29, 0
;;
	c0	br $b0.1, LBB63_70
;;
LBB63_71:                               ## %while.end.i.357
                                        ##   in Loop: Header=BB63_66 Depth=1
	c0	shl $r0.30 = $r0.29, $r0.15
	c0	shru $r0.28 = $r0.28, $r0.15
	c0	mov $r0.29 = $r0.23
;;
	c0	or $r0.28 = $r0.28, $r0.30
;;
	c0	cmpleu $b0.1 = $r0.25, $r0.28
;;
	c0	br $b0.1, LBB63_73
;;
## BB#72:                               ## %cond.false.10.i.359
                                        ##   in Loop: Header=BB63_66 Depth=1
	c0	shru $r0.29 = $r0.28, $r0.17
	c0	mtb $b0.1 = $r0.20
	c0	mtb $b0.2 = $r0.20
;;
	c0	addcg $r0.30, $b0.1 = $r0.29, $r0.29, $b0.1
;;
	c0	divs $r0.29, $b0.1 = $r0.0, $r0.27, $b0.1
	c0	addcg $r0.31, $b0.2 = $r0.30, $r0.30, $b0.2
;;
	c0	addcg $r0.30, $b0.1 = $r0.31, $r0.31, $b0.1
	c0	divs $r0.29, $b0.2 = $r0.29, $r0.27, $b0.2
;;
	c0	addcg $r0.31, $b0.2 = $r0.30, $r0.30, $b0.2
	c0	divs $r0.29, $b0.1 = $r0.29, $r0.27, $b0.1
;;
	c0	addcg $r0.30, $b0.1 = $r0.31, $r0.31, $b0.1
	c0	divs $r0.29, $b0.2 = $r0.29, $r0.27, $b0.2
;;
	c0	addcg $r0.31, $b0.2 = $r0.30, $r0.30, $b0.2
	c0	divs $r0.29, $b0.1 = $r0.29, $r0.27, $b0.1
;;
	c0	addcg $r0.30, $b0.1 = $r0.31, $r0.31, $b0.1
	c0	divs $r0.29, $b0.2 = $r0.29, $r0.27, $b0.2
;;
	c0	addcg $r0.31, $b0.2 = $r0.30, $r0.30, $b0.2
	c0	divs $r0.29, $b0.1 = $r0.29, $r0.27, $b0.1
;;
	c0	addcg $r0.30, $b0.1 = $r0.31, $r0.31, $b0.1
	c0	divs $r0.29, $b0.2 = $r0.29, $r0.27, $b0.2
;;
	c0	addcg $r0.31, $b0.2 = $r0.30, $r0.30, $b0.2
	c0	divs $r0.29, $b0.1 = $r0.29, $r0.27, $b0.1
;;
	c0	addcg $r0.30, $b0.1 = $r0.31, $r0.31, $b0.1
	c0	divs $r0.29, $b0.2 = $r0.29, $r0.27, $b0.2
;;
	c0	addcg $r0.31, $b0.2 = $r0.30, $r0.30, $b0.2
	c0	divs $r0.29, $b0.1 = $r0.29, $r0.27, $b0.1
;;
	c0	addcg $r0.30, $b0.1 = $r0.31, $r0.31, $b0.1
	c0	divs $r0.29, $b0.2 = $r0.29, $r0.27, $b0.2
;;
	c0	addcg $r0.31, $b0.2 = $r0.30, $r0.30, $b0.2
	c0	divs $r0.29, $b0.1 = $r0.29, $r0.27, $b0.1
;;
	c0	addcg $r0.30, $b0.1 = $r0.31, $r0.31, $b0.1
	c0	divs $r0.29, $b0.2 = $r0.29, $r0.27, $b0.2
;;
	c0	addcg $r0.31, $b0.2 = $r0.30, $r0.30, $b0.2
	c0	divs $r0.29, $b0.1 = $r0.29, $r0.27, $b0.1
;;
	c0	addcg $r0.30, $b0.1 = $r0.31, $r0.31, $b0.1
	c0	divs $r0.29, $b0.2 = $r0.29, $r0.27, $b0.2
;;
	c0	addcg $r0.31, $b0.2 = $r0.30, $r0.30, $b0.2
	c0	divs $r0.29, $b0.1 = $r0.29, $r0.27, $b0.1
;;
	c0	divs $r0.29, $b0.2 = $r0.29, $r0.27, $b0.2
	c0	addcg $r0.30, $b0.1 = $r0.31, $r0.31, $b0.1
;;
	c0	addcg $r0.31, $b0.2 = $r0.30, $r0.30, $b0.2
	c0	divs $r0.29, $b0.1 = $r0.29, $r0.27, $b0.1
;;
	c0	divs $r0.29, $b0.2 = $r0.29, $r0.27, $b0.2
	c0	addcg $r0.30, $b0.1 = $r0.31, $r0.31, $b0.1
;;
	c0	addcg $r0.31, $b0.2 = $r0.30, $r0.30, $b0.2
	c0	divs $r0.29, $b0.1 = $r0.29, $r0.27, $b0.1
;;
	c0	divs $r0.29, $b0.2 = $r0.29, $r0.27, $b0.2
	c0	addcg $r0.30, $b0.1 = $r0.31, $r0.31, $b0.1
;;
	c0	addcg $r0.31, $b0.2 = $r0.30, $r0.30, $b0.2
	c0	divs $r0.29, $b0.1 = $r0.29, $r0.27, $b0.1
;;
	c0	divs $r0.29, $b0.2 = $r0.29, $r0.27, $b0.2
	c0	addcg $r0.30, $b0.1 = $r0.31, $r0.31, $b0.1
;;
	c0	addcg $r0.31, $b0.2 = $r0.30, $r0.30, $b0.2
	c0	divs $r0.29, $b0.1 = $r0.29, $r0.27, $b0.1
;;
	c0	divs $r0.29, $b0.2 = $r0.29, $r0.27, $b0.2
	c0	addcg $r0.30, $b0.1 = $r0.31, $r0.31, $b0.1
;;
	c0	addcg $r0.31, $b0.2 = $r0.30, $r0.30, $b0.2
	c0	divs $r0.29, $b0.1 = $r0.29, $r0.27, $b0.1
;;
	c0	divs $r0.29, $b0.2 = $r0.29, $r0.27, $b0.2
	c0	addcg $r0.30, $b0.1 = $r0.31, $r0.31, $b0.1
;;
	c0	addcg $r0.31, $b0.2 = $r0.30, $r0.30, $b0.2
	c0	divs $r0.29, $b0.1 = $r0.29, $r0.27, $b0.1
;;
	c0	divs $r0.29, $b0.2 = $r0.29, $r0.27, $b0.2
	c0	addcg $r0.30, $b0.1 = $r0.31, $r0.31, $b0.1
;;
	c0	addcg $r0.31, $b0.2 = $r0.30, $r0.30, $b0.2
	c0	divs $r0.29, $b0.1 = $r0.29, $r0.27, $b0.1
;;
	c0	divs $r0.29, $b0.2 = $r0.29, $r0.27, $b0.2
	c0	addcg $r0.30, $b0.1 = $r0.31, $r0.31, $b0.1
;;
	c0	cmpge $b0.1 = $r0.29, $r0.0
	c0	addcg $r0.29, $b0.2 = $r0.30, $r0.30, $b0.2
;;
	c0	orc $r0.29 = $r0.29, $r0.0
	c0	cmpgeu $r0.28 = $r0.28, $r0.16
	c0	mfb $r0.30 = $b0.1
;;
	c0	sh1add $r0.29 = $r0.29, $r0.30
;;
	c0	slct $r0.29 = $b0.0, $r0.28, $r0.29
;;
LBB63_73:                               ## %cond.end.12.i.362
                                        ##   in Loop: Header=BB63_66 Depth=1
	c0	or $r0.13 = $r0.29, $r0.13
;;
LBB63_74:                               ## %estimateDiv64To32.exit364
                                        ##   in Loop: Header=BB63_66 Depth=1
	c0	add $r0.28 = $r0.13, -4
	c0	cmpgtu $b0.1 = $r0.13, 4
	c0	mov $r0.29 = 29
	c0	mov $r0.30 = 3
	c0	add $r0.13 = $r0.14, -29
;;
	c0	slct $r0.28 = $b0.1, $r0.28, 0
;;
	c0	zxth $r0.31 = $r0.28
	c0	shru $r0.32 = $r0.28, $r0.15
;;
	c0	mpylu $r0.33 = $r0.32, $r0.18
	c0	mpyhs $r0.34 = $r0.32, $r0.18
	c0	mpylu $r0.35 = $r0.32, $r0.19
	c0	mpyhs $r0.36 = $r0.32, $r0.19
	c0	mpylu $r0.37 = $r0.31, $r0.16
	c0	mpyhs $r0.38 = $r0.31, $r0.16
;;
	c0	mpyhs $r0.39 = $r0.31, $r0.26
	c0	mpylu $r0.40 = $r0.31, $r0.26
	c0	add $r0.35 = $r0.35, $r0.36
	c0	add $r0.36 = $r0.37, $r0.38
	c0	add $r0.33 = $r0.33, $r0.34
	c0	mpylu $r0.34 = $r0.31, $r0.19
	c0	mpyhs $r0.37 = $r0.31, $r0.19
	c0	mpyhs $r0.38 = $r0.31, $r0.18
;;
	c0	add $r0.39 = $r0.40, $r0.39
	c0	add $r0.35 = $r0.35, $r0.36
	c0	mpylu $r0.31 = $r0.31, $r0.18
	c0	mpylu $r0.36 = $r0.32, $r0.26
;;
	c0	add $r0.39 = $r0.33, $r0.39
	c0	mpyhs $r0.40 = $r0.32, $r0.26
	c0	add $r0.34 = $r0.34, $r0.37
;;
	c0	cmpltu $r0.33 = $r0.39, $r0.33
	c0	shl $r0.37 = $r0.35, $r0.15
	c0	add $r0.31 = $r0.31, $r0.38
	c0	add $r0.36 = $r0.36, $r0.40
	c0	shru $r0.38 = $r0.39, $r0.15
	c0	shl $r0.39 = $r0.39, $r0.15
;;
	c0	shl $r0.33 = $r0.33, $r0.15
	c0	add $r0.34 = $r0.37, $r0.34
	c0	add $r0.31 = $r0.39, $r0.31
;;
	c0	or $r0.33 = $r0.33, $r0.38
	c0	add $r0.36 = $r0.34, $r0.36
	c0	cmpltu $r0.38 = $r0.31, $r0.39
;;
	c0	add $r0.33 = $r0.36, $r0.33
	c0	cmpgt $b0.1 = $r0.14, 29
	c0	shl $r0.6 = $r0.6, $r0.29
	c0	shru $r0.10 = $r0.10, $r0.30
;;
	c0	add $r0.33 = $r0.33, $r0.38
	c0	mov $r0.14 = $r0.13
	c0	or $r0.6 = $r0.6, $r0.10
	c0	mpyhs $r0.10 = $r0.32, $r0.16
	c0	mpylu $r0.32 = $r0.32, $r0.16
;;
	c0	add $r0.10 = $r0.32, $r0.10
	c0	shru $r0.32 = $r0.35, $r0.15
	c0	shru $r0.31 = $r0.31, $r0.30
	c0	shl $r0.35 = $r0.33, $r0.29
;;
	c0	add $r0.10 = $r0.32, $r0.10
	c0	cmpltu $r0.32 = $r0.34, $r0.37
;;
	c0	add $r0.32 = $r0.10, $r0.32
	c0	cmpltu $b0.2 = $r0.33, $r0.34
	c0	shru $r0.30 = $r0.33, $r0.30
;;
	c0	mfb $r0.33 = $b0.2
	c0	or $r0.10 = $r0.35, $r0.31
;;
	c0	cmpne $r0.31 = $r0.10, 0
	c0	sub $r0.10 = $r0.20, $r0.10
	c0	add $r0.32 = $r0.32, $r0.33
;;
	c0	mtb $b0.2 = $r0.31
	c0	shl $r0.29 = $r0.32, $r0.29
;;
	c0	slct $r0.31 = $b0.2, $r0.22, 0
	c0	or $r0.29 = $r0.29, $r0.30
;;
	c0	add $r0.6 = $r0.31, $r0.6
;;
	c0	sub $r0.6 = $r0.6, $r0.29
	c0	br $b0.1, LBB63_66
;;
	c0	goto LBB63_75
;;
LBB63_64:
	c0	mov $r0.13 = $r0.14
;;
LBB63_75:                               ## %while.end
	c0	cmplt $b0.0 = $r0.13, -31
;;
	c0	br $b0.0, LBB63_97
;;
## BB#76:                               ## %if.then.84
	c0	cmpleu $b0.0 = $r0.11, $r0.6
;;
	c0	br $b0.0, LBB63_77
;;
## BB#78:                               ## %if.end.i
	c0	mov $r0.17 = 16
;;
	c0	shru $r0.14 = $r0.9, $r0.17
;;
	c0	shl $r0.16 = $r0.14, $r0.17
;;
	c0	cmpleu $b0.0 = $r0.16, $r0.6
;;
	c0	br $b0.0, LBB63_79
;;
## BB#80:                               ## %cond.false.i.239
	c0	cmplt $r0.15 = $r0.14, $r0.0
	c0	mov $r0.18 = 0
;;
	c0	shru $r0.19 = $r0.6, $r0.15
	c0	mtb $b0.0 = $r0.18
	c0	shru $r0.20 = $r0.14, $r0.15
	c0	mtb $b0.1 = $r0.18
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
	c0	divs $r0.18, $b0.0 = $r0.18, $r0.20, $b0.0
;;
	c0	addcg $r0.19, $b0.0 = $r0.21, $r0.21, $b0.0
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.20, $b0.1
	c0	cmpgeu $r0.21 = $r0.6, $r0.14
;;
	c0	addcg $r0.22, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.18, $b0.0 = $r0.18, $r0.20, $b0.0
;;
	c0	divs $r0.18, $b0.1 = $r0.18, $r0.20, $b0.1
	c0	addcg $r0.19, $b0.0 = $r0.22, $r0.22, $b0.0
;;
	c0	addcg $r0.22, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.18, $b0.0 = $r0.18, $r0.20, $b0.0
	c0	mtb $b0.2 = $r0.15
;;
	c0	divs $r0.15, $b0.1 = $r0.18, $r0.20, $b0.1
	c0	addcg $r0.18, $b0.0 = $r0.22, $r0.22, $b0.0
;;
	c0	cmpge $b0.0 = $r0.15, $r0.0
	c0	addcg $r0.15, $b0.1 = $r0.18, $r0.18, $b0.1
;;
	c0	mfb $r0.18 = $b0.0
	c0	orc $r0.15 = $r0.15, $r0.0
;;
	c0	sh1add $r0.15 = $r0.15, $r0.18
;;
	c0	slct $r0.15 = $b0.2, $r0.21, $r0.15
;;
	c0	shl $r0.15 = $r0.15, $r0.17
	c0	goto LBB63_81
;;
LBB63_97:                               ## %if.else.99
	c0	mov $r0.9 = 3
	c0	mov $r0.13 = 8
	c0	mov $r0.14 = 24
;;
	c0	shl $r0.7 = $r0.7, $r0.9
	c0	shl $r0.12 = $r0.12, $r0.14
	c0	shru $r0.10 = $r0.10, $r0.13
	c0	shru $r0.11 = $r0.11, $r0.13
	c0	shru $r0.9 = $r0.6, $r0.13
	c0	shl $r0.6 = $r0.6, $r0.14
;;
	c0	and $r0.7 = $r0.7, 16777208
	c0	or $r0.10 = $r0.6, $r0.10
;;
	c0	or $r0.12 = $r0.12, $r0.7
	c0	goto LBB63_98
;;
LBB63_77:
	c0	mov $r0.15 = -1
	c0	goto LBB63_88
;;
LBB63_79:
	c0	mov $r0.15 = -65536
;;
LBB63_81:                               ## %cond.end.i
	c0	shru $r0.18 = $r0.15, $r0.17
	c0	zxth $r0.19 = $r0.11
	c0	mov $r0.20 = -1
;;
	c0	mpyhs $r0.21 = $r0.18, $r0.14
	c0	mpyhs $r0.22 = $r0.18, $r0.19
	c0	mpylu $r0.19 = $r0.18, $r0.19
;;
	c0	add $r0.19 = $r0.19, $r0.22
	c0	mpylu $r0.18 = $r0.18, $r0.14
;;
	c0	add $r0.18 = $r0.18, $r0.21
	c0	shl $r0.21 = $r0.19, $r0.17
	c0	shru $r0.19 = $r0.19, $r0.17
;;
	c0	sub $r0.22 = $r0.6, $r0.18
	c0	cmpltu $r0.23 = $r0.10, $r0.21
	c0	sub $r0.18 = $r0.10, $r0.21
;;
	c0	sub $r0.19 = $r0.22, $r0.19
	c0	mtb $b0.0 = $r0.23
;;
	c0	slct $r0.20 = $b0.0, $r0.20, 0
;;
	c0	add $r0.19 = $r0.19, $r0.20
;;
	c0	cmpgt $b0.0 = $r0.19, -1
;;
	c0	br $b0.0, LBB63_84
;;
## BB#82:                               ## %while.body.lr.ph.i
	c0	shl $r0.20 = $r0.11, $r0.17
;;
LBB63_83:                               ## %while.body.i
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.18 = $r0.18, $r0.20
	c0	add $r0.19 = $r0.19, $r0.14
	c0	add $r0.15 = $r0.15, -65536
;;
	c0	cmpltu $r0.21 = $r0.18, $r0.20
;;
	c0	add $r0.19 = $r0.19, $r0.21
;;
	c0	cmplt $b0.0 = $r0.19, 0
;;
	c0	br $b0.0, LBB63_83
;;
LBB63_84:                               ## %while.end.i
	c0	shl $r0.19 = $r0.19, $r0.17
	c0	shru $r0.17 = $r0.18, $r0.17
;;
	c0	or $r0.17 = $r0.17, $r0.19
;;
	c0	cmpleu $b0.0 = $r0.16, $r0.17
;;
	c0	br $b0.0, LBB63_85
;;
## BB#86:                               ## %cond.false.10.i
	c0	cmplt $r0.16 = $r0.14, $r0.0
	c0	mov $r0.18 = 0
;;
	c0	shru $r0.19 = $r0.17, $r0.16
	c0	mtb $b0.0 = $r0.18
	c0	shru $r0.20 = $r0.14, $r0.16
	c0	mtb $b0.1 = $r0.18
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
	c0	cmpgeu $r0.14 = $r0.17, $r0.14
;;
	c0	divs $r0.17, $b0.1 = $r0.18, $r0.20, $b0.1
	c0	mtb $b0.2 = $r0.16
	c0	addcg $r0.16, $b0.0 = $r0.21, $r0.21, $b0.0
;;
	c0	cmpge $b0.0 = $r0.17, $r0.0
	c0	addcg $r0.17, $b0.1 = $r0.16, $r0.16, $b0.1
;;
	c0	mfb $r0.16 = $b0.0
	c0	orc $r0.17 = $r0.17, $r0.0
;;
	c0	sh1add $r0.16 = $r0.17, $r0.16
;;
	c0	slct $r0.14 = $b0.2, $r0.14, $r0.16
	c0	goto LBB63_87
;;
LBB63_85:
	c0	mov $r0.14 = 65535
;;
LBB63_87:                               ## %cond.end.12.i
	c0	or $r0.15 = $r0.14, $r0.15
;;
LBB63_88:                               ## %estimateDiv64To32.exit
	c0	mov $r0.16 = 3
	c0	mov $r0.14 = 24
	c0	cmpgtu $b0.0 = $r0.15, 4
	c0	add $r0.17 = $r0.15, -4
	c0	sub $r0.18 = $r0.5, $r0.13
	c0	mov $r0.15 = 8
	c0	cmpgt $b0.1 = $r0.13, -25
;;
	c0	shru $r0.11 = $r0.11, $r0.15
	c0	shl $r0.15 = $r0.7, $r0.16
	c0	shl $r0.7 = $r0.12, $r0.14
	c0	slct $r0.12 = $b0.0, $r0.17, 0
;;
	c0	and $r0.16 = $r0.15, 16777208
	c0	shru $r0.28 = $r0.12, $r0.18
;;
	c0	or $r0.12 = $r0.7, $r0.16
	c0	br $b0.1, LBB63_94
;;
## BB#89:                               ## %if.then.96
	c0	mov $r0.7 = -24
;;
	c0	sub $r0.7 = $r0.7, $r0.13
;;
	c0	cmpeq $b0.0 = $r0.7, 0
;;
	c0	br $b0.0, LBB63_90
;;
## BB#91:                               ## %if.else.i
	c0	cmpgt $b0.0 = $r0.7, 31
;;
	c0	br $b0.0, LBB63_93
;;
## BB#92:                               ## %if.then.2.i
	c0	sub $r0.13 = $r0.5, $r0.7
;;
	c0	and $r0.13 = $r0.13, 31
;;
	c0	shl $r0.13 = $r0.6, $r0.13
	c0	shru $r0.10 = $r0.10, $r0.7
	c0	shru $r0.6 = $r0.6, $r0.7
;;
	c0	or $r0.7 = $r0.13, $r0.10
	c0	goto LBB63_96
;;
LBB63_94:                               ## %if.else
	c0	add $r0.16 = $r0.13, 24
;;
	c0	shl $r0.7 = $r0.10, $r0.16
	c0	cmpeq $b0.0 = $r0.16, 0
;;
	c0	br $b0.0, LBB63_96
;;
## BB#95:                               ## %cond.false.i
	c0	mov $r0.17 = -24
	c0	shl $r0.6 = $r0.6, $r0.16
;;
	c0	sub $r0.13 = $r0.17, $r0.13
;;
	c0	and $r0.13 = $r0.13, 31
;;
	c0	shru $r0.10 = $r0.10, $r0.13
;;
	c0	or $r0.6 = $r0.10, $r0.6
	c0	goto LBB63_96
;;
LBB63_90:
	c0	mov $r0.7 = $r0.10
	c0	goto LBB63_96
;;
LBB63_93:                               ## %if.else.4.i
	c0	and $r0.10 = $r0.7, 31
;;
	c0	shru $r0.10 = $r0.6, $r0.10
	c0	cmplt $b0.0 = $r0.7, 64
	c0	mov $r0.6 = $r0.5
;;
	c0	slct $r0.7 = $b0.0, $r0.10, 0
;;
LBB63_96:                               ## %if.end.98
	c0	mov $r0.10 = 16
	c0	and $r0.13 = $r0.15, 65528
	c0	zxth $r0.15 = $r0.28
	c0	shru $r0.9 = $r0.9, $r0.14
	c0	zxth $r0.14 = $r0.11
;;
	c0	shru $r0.16 = $r0.28, $r0.10
	c0	shru $r0.17 = $r0.12, $r0.10
	c0	mpylu $r0.18 = $r0.15, $r0.13
	c0	mpyhs $r0.19 = $r0.15, $r0.13
	c0	mpylu $r0.20 = $r0.15, $r0.9
	c0	mpyhs $r0.9 = $r0.15, $r0.9
	c0	mpylu $r0.21 = $r0.15, $r0.14
	c0	mpyhs $r0.22 = $r0.15, $r0.14
;;
	c0	mpylu $r0.23 = $r0.16, $r0.13
	c0	mpyhs $r0.13 = $r0.16, $r0.13
	c0	mpyhs $r0.24 = $r0.15, $r0.17
	c0	mpylu $r0.15 = $r0.15, $r0.17
	c0	mpylu $r0.25 = $r0.16, $r0.14
	c0	mpyhs $r0.14 = $r0.16, $r0.14
	c0	add $r0.18 = $r0.18, $r0.19
	c0	add $r0.9 = $r0.20, $r0.9
;;
	c0	add $r0.13 = $r0.23, $r0.13
	c0	add $r0.15 = $r0.15, $r0.24
	c0	add $r0.14 = $r0.25, $r0.14
	c0	mpylu $r0.19 = $r0.16, $r0.17
	c0	mpyhs $r0.16 = $r0.16, $r0.17
	c0	add $r0.17 = $r0.21, $r0.22
	c0	mov $r0.20 = -1
;;
	c0	add $r0.15 = $r0.13, $r0.15
	c0	add $r0.16 = $r0.19, $r0.16
;;
	c0	shl $r0.19 = $r0.15, $r0.10
	c0	add $r0.16 = $r0.16, $r0.17
	c0	add $r0.9 = $r0.14, $r0.9
	c0	cmpltu $r0.13 = $r0.15, $r0.13
	c0	shru $r0.14 = $r0.15, $r0.10
;;
	c0	shl $r0.9 = $r0.9, $r0.10
	c0	shl $r0.10 = $r0.13, $r0.10
	c0	add $r0.13 = $r0.19, $r0.18
;;
	c0	add $r0.9 = $r0.16, $r0.9
	c0	cmpltu $r0.15 = $r0.13, $r0.19
	c0	cmpltu $r0.16 = $r0.7, $r0.13
	c0	or $r0.10 = $r0.10, $r0.14
;;
	c0	mtb $b0.0 = $r0.15
	c0	mtb $b0.1 = $r0.16
	c0	add $r0.9 = $r0.9, $r0.10
;;
	c0	mfb $r0.10 = $b0.0
;;
	c0	sub $r0.9 = $r0.10, $r0.9
	c0	sub $r0.10 = $r0.7, $r0.13
	c0	slct $r0.7 = $b0.1, $r0.20, 0
;;
	c0	add $r0.6 = $r0.9, $r0.6
;;
	c0	add $r0.9 = $r0.6, $r0.7
;;
LBB63_98:                               ## %do.body.preheader
	c0	shru $r0.4 = $r0.4, $r0.8
	c0	mov $r0.13 = -1
;;
LBB63_99:                               ## %do.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	mov $r0.7 = $r0.10
	c0	mov $r0.6 = $r0.9
;;
	c0	cmpltu $r0.9 = $r0.7, $r0.12
	c0	sub $r0.14 = $r0.6, $r0.11
	c0	add $r0.28 = $r0.28, 1
	c0	sub $r0.10 = $r0.7, $r0.12
;;
	c0	mtb $b0.0 = $r0.9
;;
	c0	slct $r0.9 = $b0.0, $r0.13, 0
;;
	c0	add $r0.9 = $r0.14, $r0.9
;;
	c0	cmpgt $b0.0 = $r0.9, -1
;;
	c0	br $b0.0, LBB63_99
;;
## BB#100:                              ## %do.end
	c0	add $r0.12 = $r0.10, $r0.7
	c0	add $r0.11 = $r0.9, $r0.6
;;
	c0	cmpltu $r0.14 = $r0.12, $r0.10
;;
	c0	add $r0.14 = $r0.11, $r0.14
;;
	c0	cmplt $b0.0 = $r0.14, 0
;;
	c0	br $b0.0, LBB63_103
;;
## BB#101:                              ## %lor.lhs.false.105
	c0	and $r0.15 = $r0.28, 1
	c0	mov $r0.11 = 1
;;
	c0	cmpeq $b0.0 = $r0.15, 0
;;
	c0	br $b0.0, LBB63_104
;;
## BB#102:                              ## %lor.lhs.false.105
	c0	or $r0.12 = $r0.14, $r0.12
;;
	c0	cmpne $b0.0 = $r0.12, 0
;;
	c0	br $b0.0, LBB63_104
;;
LBB63_103:                              ## %if.end.112
	c0	mov $r0.9 = $r0.6
	c0	shru $r0.11 = $r0.6, $r0.8
	c0	cmpgt $b0.0 = $r0.6, -1
	c0	mov $r0.10 = $r0.7
;;
	c0	br $b0.0, LBB63_105
;;
LBB63_104:                              ## %if.then.116
	c0	cmpne $r0.6 = $r0.10, 0
	c0	sub $r0.7 = $r0.5, $r0.10
;;
	c0	mtb $b0.0 = $r0.6
;;
	c0	slct $r0.5 = $b0.0, $r0.13, 0
;;
	c0	sub $r0.6 = $r0.5, $r0.9
;;
LBB63_105:                              ## %if.end.117
	c0	xor $r0.4 = $r0.11, $r0.4
	c0	add $r0.5 = $r0.2, -4
;;
.call normalizeRoundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32), ret()
	c0	call $l0.0 = normalizeRoundAndPackFloat64
;;
.return ret()
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
	c0	mov $r0.10 = 4
	c0	mov $r0.11 = countLeadingZeros32.countLeadingZerosHigh
	c0	cmpeq $b0.0 = $r0.6, 0
;;
	c0	slct $r0.6 = $b0.0, $r0.7, $r0.6
;;
	c0	cmpltu $b0.1 = $r0.6, 65536
	c0	shl $r0.2 = $r0.6, $r0.2
;;
	c0	slct $r0.2 = $b0.1, $r0.2, $r0.6
	c0	mfb $r0.12 = $b0.1
;;
	c0	shl $r0.8 = $r0.2, $r0.8
	c0	cmpltu $b0.1 = $r0.2, 16777216
	c0	shl $r0.10 = $r0.12, $r0.10
;;
	c0	slct $r0.2 = $b0.1, $r0.8, $r0.2
	c0	or $r0.8 = $r0.10, 8
;;
	c0	shru $r0.2 = $r0.2, $r0.9
	c0	slct $r0.9 = $b0.1, $r0.8, $r0.10
;;
	c0	and $r0.2 = $r0.2, 1020
	c0	mov $r0.8 = 0
;;
	c0	add $r0.2 = $r0.11, $r0.2
	c0	add $r0.11 = $r0.5, -32
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
	c0	add $r0.10 = $r0.2, $r0.9
;;
	c0	add $r0.2 = $r0.10, -11
	c0	slct $r0.5 = $b0.0, $r0.11, $r0.5
	c0	slct $r0.9 = $b0.0, $r0.8, $r0.7
;;
	c0	cmplt $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB64_3
;;
## BB#1:                                ## %if.then.3
	c0	shl $r0.7 = $r0.9, $r0.2
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB64_13
;;
## BB#2:                                ## %cond.false.i
	c0	mov $r0.11 = 11
;;
	c0	sub $r0.10 = $r0.11, $r0.10
;;
	c0	and $r0.10 = $r0.10, 31
	c0	shl $r0.6 = $r0.6, $r0.2
;;
	c0	shru $r0.9 = $r0.9, $r0.10
;;
.call roundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	or $r0.6 = $r0.9, $r0.6
	c0	sub $r0.5 = $r0.5, $r0.2
	c0	add $r0.1 = $r0.1, 0
	c0	call $l0.0 = roundAndPackFloat64
;;
.return ret()
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB64_3:                                ## %if.else
	c0	mov $r0.7 = 11
;;
	c0	sub $r0.11 = $r0.7, $r0.10
;;
	c0	cmpeq $b0.0 = $r0.11, 0
;;
	c0	br $b0.0, LBB64_4
;;
## BB#5:                                ## %if.else.i
	c0	sub $r0.7 = $r0.8, $r0.11
	c0	cmpgt $b0.0 = $r0.11, 31
;;
	c0	and $r0.7 = $r0.7, 31
	c0	br $b0.0, LBB64_7
;;
## BB#6:                                ## %if.then.2.i
	c0	shru $r0.8 = $r0.9, $r0.11
	c0	shl $r0.12 = $r0.6, $r0.7
	c0	shl $r0.7 = $r0.9, $r0.7
	c0	shru $r0.10 = $r0.6, $r0.11
	c0	mov $r0.9 = 0
;;
	c0	or $r0.6 = $r0.12, $r0.8
	c0	goto LBB64_12
;;
LBB64_4:
.call roundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	mov $r0.7 = $r0.9
	c0	sub $r0.5 = $r0.5, $r0.2
	c0	add $r0.1 = $r0.1, 0
	c0	call $l0.0 = roundAndPackFloat64
;;
.return ret()
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB64_7:                                ## %if.else.5.i
	c0	mov $r0.10 = 0
	c0	cmpeq $b0.0 = $r0.11, 32
;;
	c0	brf $b0.0, LBB64_9
;;
## BB#8:
	c0	mov $r0.7 = $r0.9
	c0	mov $r0.9 = $r0.10
	c0	goto LBB64_12
;;
LBB64_9:                                ## %if.else.8.i
	c0	cmpgt $b0.0 = $r0.11, 63
;;
	c0	br $b0.0, LBB64_11
;;
## BB#10:                               ## %if.then.11.i
	c0	and $r0.8 = $r0.11, 31
	c0	shl $r0.7 = $r0.6, $r0.7
;;
	c0	shru $r0.6 = $r0.6, $r0.8
	c0	goto LBB64_12
;;
LBB64_11:                               ## %if.else.15.i
	c0	cmpne $b0.0 = $r0.6, 0
	c0	mov $r0.10 = 0
	c0	cmpeq $b0.1 = $r0.11, 64
;;
	c0	mfb $r0.7 = $b0.0
;;
	c0	slct $r0.7 = $b0.1, $r0.6, $r0.7
	c0	mov $r0.6 = $r0.10
;;
LBB64_12:                               ## %if.end.19.i
	c0	cmpne $b0.0 = $r0.9, 0
;;
	c0	mfb $r0.8 = $b0.0
;;
	c0	or $r0.8 = $r0.8, $r0.7
	c0	mov $r0.7 = $r0.6
	c0	mov $r0.6 = $r0.10
;;
LBB64_13:                               ## %if.end.5
.call roundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	sub $r0.5 = $r0.5, $r0.2
	c0	add $r0.1 = $r0.1, 0
	c0	call $l0.0 = roundAndPackFloat64
;;
.return ret()
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
	c0	mov $r0.6 = 20
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.6 = $r0.4, $r0.6
;;
	c0	and $r0.7 = $r0.6, 2047
	c0	and $r0.6 = $r0.4, 1048575
	c0	shru $r0.8 = $r0.4, $r0.2
;;
	c0	cmpne $b0.0 = $r0.7, 2047
;;
	c0	br $b0.0, LBB65_13
;;
## BB#1:                                ## %if.then
	c0	or $r0.2 = $r0.6, $r0.5
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB65_11
;;
## BB#2:                                ## %if.then.12
	c0	and $r0.2 = $r0.4, 2146959360
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
	c0	br $b0.0, LBB65_3
;;
## BB#4:                                ## %land.rhs.i.59.i
	c0	cmpeq $b0.0 = $r0.5, 0
;;
	c0	br $b0.0, LBB65_6
;;
## BB#5:                                ## %if.then.thread.i
	c0	mov $r0.6 = float_exception_flags
	c0	or $r0.2 = $r0.4, 524288
;;
	c0	ldw $r0.4 = 0[$r0.6]
;;
	c0	or $r0.4 = $r0.4, 16
;;
	c0	stw 0[$r0.6] = $r0.4
	c0	goto LBB65_10
;;
LBB65_13:                               ## %if.end.20
	c0	cmpeq $b0.0 = $r0.8, 0
;;
	c0	br $b0.0, LBB65_16
;;
## BB#14:                               ## %if.then.22
	c0	or $r0.2 = $r0.6, $r0.5
;;
	c0	or $r0.2 = $r0.2, $r0.7
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB65_15
;;
	c0	goto LBB65_12
;;
LBB65_11:                               ## %if.end
	c0	cmpne $b0.0 = $r0.8, 0
;;
	c0	brf $b0.0, LBB65_12
;;
LBB65_15:                               ## %invalid
	c0	mov $r0.2 = float_exception_flags
	c0	mov $r0.4 = 2147483647
	c0	mov $r0.5 = -1
;;
	c0	ldw $r0.6 = 0[$r0.2]
;;
	c0	stw 0[$r0.3] = $r0.4
;;
	c0	stw 4[$r0.3] = $r0.5
	c0	or $r0.3 = $r0.6, 16
;;
.return ret()
	c0	stw 0[$r0.2] = $r0.3
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB65_16:                               ## %if.end.30
	c0	cmpne $b0.0 = $r0.7, 0
;;
	c0	br $b0.0, LBB65_27
;;
## BB#17:                               ## %if.then.32
	c0	or $r0.7 = $r0.6, $r0.5
;;
	c0	cmpne $b0.0 = $r0.7, 0
;;
	c0	brf $b0.0, LBB65_18
;;
## BB#19:                               ## %if.end.36
	c0	cmpne $b0.0 = $r0.6, 0
;;
	c0	brf $b0.0, LBB65_20
;;
## BB#24:                               ## %if.else.7.i
	c0	mov $r0.7 = 16
	c0	cmpltu $b0.0 = $r0.6, 65536
	c0	mov $r0.8 = 8
	c0	mov $r0.9 = 22
	c0	mov $r0.10 = 4
	c0	mov $r0.11 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	shl $r0.4 = $r0.4, $r0.7
	c0	mfb $r0.7 = $b0.0
;;
	c0	slct $r0.4 = $b0.0, $r0.4, $r0.6
	c0	shl $r0.7 = $r0.7, $r0.10
;;
	c0	cmpltu $b0.0 = $r0.4, 16777216
	c0	shl $r0.8 = $r0.4, $r0.8
	c0	or $r0.10 = $r0.7, 8
;;
	c0	slct $r0.4 = $b0.0, $r0.8, $r0.4
	c0	slct $r0.7 = $b0.0, $r0.10, $r0.7
;;
	c0	shru $r0.4 = $r0.4, $r0.9
;;
	c0	and $r0.4 = $r0.4, 1020
;;
	c0	add $r0.4 = $r0.11, $r0.4
;;
	c0	ldw $r0.4 = 0[$r0.4]
;;
	c0	add $r0.4 = $r0.4, $r0.7
;;
	c0	add $r0.7 = $r0.4, -11
;;
	c0	cmpeq $b0.0 = $r0.7, 0
;;
	c0	br $b0.0, LBB65_26
;;
## BB#25:                               ## %cond.false.i.i
	c0	mov $r0.8 = 11
	c0	shl $r0.6 = $r0.6, $r0.7
;;
	c0	sub $r0.8 = $r0.8, $r0.4
;;
	c0	and $r0.8 = $r0.8, 31
;;
	c0	shru $r0.8 = $r0.5, $r0.8
;;
	c0	or $r0.6 = $r0.8, $r0.6
;;
LBB65_26:                               ## %shortShift64Left.exit.i
	c0	mov $r0.8 = 12
	c0	shl $r0.5 = $r0.5, $r0.7
;;
	c0	sub $r0.7 = $r0.8, $r0.4
	c0	goto LBB65_27
;;
LBB65_12:                               ## %if.then.18
	c0	stw 0[$r0.3] = $r0.4
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.5
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB65_3:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB65_7
;;
LBB65_6:                                ## %lor.rhs.i.i
	c0	and $r0.2 = $r0.4, 524287
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
LBB65_7:                                ## %float64_is_signaling_nan.exit.i
	c0	or $r0.2 = $r0.4, 524288
	c0	br $b0.0, LBB65_9
;;
## BB#8:                                ## %float64_is_signaling_nan.exit.i
	c0	mfb $r0.4 = $b0.0
;;
	c0	cmpne $b0.1 = $r0.4, 1
;;
	c0	br $b0.1, LBB65_10
;;
LBB65_9:                                ## %if.then.i.274
	c0	mov $r0.4 = float_exception_flags
;;
	c0	ldw $r0.6 = 0[$r0.4]
;;
	c0	or $r0.6 = $r0.6, 16
;;
	c0	stw 0[$r0.4] = $r0.6
;;
LBB65_10:                               ## %cond.false.i.276
	c0	stw 0[$r0.3] = $r0.2
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.5
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB65_18:                               ## %if.then.35
	c0	mov $r0.2 = 0
;;
	c0	stw 0[$r0.3] = $r0.2
;;
.return ret()
	c0	stw 4[$r0.3] = $r0.2
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
LBB65_20:                               ## %if.then.i.258
	c0	mov $r0.4 = 16
	c0	cmpltu $b0.0 = $r0.5, 65536
	c0	mov $r0.6 = 8
	c0	mov $r0.7 = 22
	c0	mov $r0.8 = 4
	c0	mov $r0.9 = countLeadingZeros32.countLeadingZerosHigh
;;
	c0	shl $r0.4 = $r0.5, $r0.4
;;
	c0	slct $r0.4 = $b0.0, $r0.4, $r0.5
;;
	c0	cmpltu $b0.1 = $r0.4, 16777216
	c0	shl $r0.6 = $r0.4, $r0.6
;;
	c0	slct $r0.4 = $b0.1, $r0.6, $r0.4
	c0	mfb $r0.6 = $b0.0
;;
	c0	shru $r0.4 = $r0.4, $r0.7
	c0	shl $r0.6 = $r0.6, $r0.8
;;
	c0	and $r0.4 = $r0.4, 1020
	c0	or $r0.7 = $r0.6, 8
;;
	c0	add $r0.4 = $r0.9, $r0.4
	c0	slct $r0.6 = $b0.1, $r0.7, $r0.6
;;
	c0	ldw $r0.4 = 0[$r0.4]
;;
	c0	add $r0.4 = $r0.4, $r0.6
;;
	c0	add $r0.6 = $r0.4, -11
	c0	cmpgt $b0.0 = $r0.4, 10
;;
	c0	br $b0.0, LBB65_22
;;
## BB#21:                               ## %if.then.2.i
	c0	mov $r0.7 = 11
	c0	and $r0.8 = $r0.6, 31
;;
	c0	sub $r0.6 = $r0.7, $r0.4
;;
	c0	shru $r0.6 = $r0.5, $r0.6
	c0	shl $r0.5 = $r0.5, $r0.8
	c0	goto LBB65_23
;;
LBB65_22:                               ## %if.else.i.263
	c0	mov $r0.7 = 0
	c0	shl $r0.6 = $r0.5, $r0.6
;;
	c0	mov $r0.5 = $r0.7
;;
LBB65_23:                               ## %if.end.i.264
	c0	mov $r0.7 = -20
;;
	c0	sub $r0.7 = $r0.7, $r0.4
;;
LBB65_27:                               ## %if.end.37
	c0	mov $r0.4 = 16
	c0	mov $r0.9 = 21
	c0	or $r0.8 = $r0.6, 1048576
	c0	mov $r0.11 = 11
	c0	mov $r0.12 = 6
	c0	and $r0.10 = $r0.7, 1
;;
	c0	shru $r0.13 = $r0.6, $r0.4
	c0	shru $r0.12 = $r0.8, $r0.12
	c0	add $r0.7 = $r0.7, -1023
	c0	mov $r0.6 = 1
	c0	shru $r0.9 = $r0.5, $r0.9
	c0	shl $r0.14 = $r0.8, $r0.11
	c0	cmpeq $b0.0 = $r0.10, 0
;;
	c0	and $r0.11 = $r0.13, 15
	c0	and $r0.12 = $r0.12, 32767
	c0	or $r0.9 = $r0.9, $r0.14
	c0	brf $b0.0, LBB65_28
;;
## BB#31:                               ## %if.else.i
	c0	mov $r0.13 = estimateSqrt32.sqrtEvenAdjustments
	c0	or $r0.12 = $r0.12, 32768
	c0	mov $r0.14 = 0
;;
	c0	sh1add $r0.11 = $r0.11, $r0.13
	c0	mtb $b0.0 = $r0.14
	c0	mtb $b0.1 = $r0.14
;;
	c0	ldhu $r0.11 = 0[$r0.11]
;;
	c0	sub $r0.11 = $r0.12, $r0.11
;;
	c0	cmplt $r0.12 = $r0.11, $r0.0
;;
	c0	shru $r0.13 = $r0.9, $r0.12
	c0	shru $r0.14 = $r0.11, $r0.12
;;
	c0	addcg $r0.15, $b0.0 = $r0.13, $r0.13, $b0.0
;;
	c0	addcg $r0.13, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.0, $r0.14, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.13, $r0.13, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.15, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.14, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.14, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.14, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.14, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.14, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.14, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.14, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.14, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.14, $b0.0
	c0	cmpgeu $r0.16 = $r0.9, $r0.11
	c0	mtb $b0.0 = $r0.12
;;
	c0	divs $r0.12, $b0.1 = $r0.13, $r0.14, $b0.1
	c0	addcg $r0.13, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.14, $b0.2
;;
	c0	addcg $r0.13, $b0.2 = $r0.15, $r0.15, $b0.2
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.14, $b0.2
;;
	c0	addcg $r0.13, $b0.2 = $r0.15, $r0.15, $b0.2
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.14, $b0.2
;;
	c0	addcg $r0.13, $b0.2 = $r0.15, $r0.15, $b0.2
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.14, $b0.2
	c0	mov $r0.13 = 15
;;
	c0	addcg $r0.17, $b0.2 = $r0.15, $r0.15, $b0.2
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.14, $b0.2
;;
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.14, $b0.1
	c0	addcg $r0.17, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	addcg $r0.15, $b0.1 = $r0.17, $r0.17, $b0.1
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.14, $b0.2
;;
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.14, $b0.1
	c0	addcg $r0.14, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	addcg $r0.15, $b0.1 = $r0.14, $r0.14, $b0.1
;;
	c0	cmpge $b0.1 = $r0.12, $r0.0
	c0	orc $r0.12 = $r0.15, $r0.0
;;
	c0	mfb $r0.14 = $b0.1
;;
	c0	sh1add $r0.12 = $r0.12, $r0.14
;;
	c0	slct $r0.12 = $b0.0, $r0.16, $r0.12
;;
	c0	add $r0.11 = $r0.11, $r0.12
	c0	mov $r0.12 = -32768
;;
	c0	cmpgtu $b0.0 = $r0.11, 131071
	c0	shl $r0.11 = $r0.11, $r0.13
;;
	c0	slct $r0.11 = $b0.0, $r0.12, $r0.11
;;
	c0	cmpgtu $b0.0 = $r0.11, $r0.9
;;
	c0	br $b0.0, LBB65_29
;;
## BB#32:                               ## %if.then.17.i
	c0	shr $r0.9 = $r0.9, $r0.6
	c0	goto LBB65_44
;;
LBB65_28:                               ## %if.then.i
	c0	mov $r0.13 = estimateSqrt32.sqrtOddAdjustments
	c0	add $r0.12 = $r0.12, 16384
	c0	mov $r0.14 = 0
;;
	c0	sh1add $r0.11 = $r0.11, $r0.13
	c0	mtb $b0.0 = $r0.14
	c0	mtb $b0.1 = $r0.14
;;
	c0	ldhu $r0.11 = 0[$r0.11]
;;
	c0	sub $r0.11 = $r0.12, $r0.11
;;
	c0	cmplt $r0.12 = $r0.11, $r0.0
;;
	c0	shru $r0.13 = $r0.9, $r0.12
	c0	shru $r0.14 = $r0.11, $r0.12
;;
	c0	addcg $r0.15, $b0.0 = $r0.13, $r0.13, $b0.0
;;
	c0	addcg $r0.13, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.0, $r0.14, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.13, $r0.13, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.15, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.14, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.14, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.14, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.14, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.14, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.14, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.14, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.14, $b0.1
;;
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.14, $b0.0
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
;;
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.14, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.14, $b0.1
;;
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.14, $b0.0
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
;;
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.14, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.14, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.14, $b0.1
;;
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.14, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.14, $b0.1
	c0	mov $r0.15 = 14
;;
	c0	addcg $r0.17, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.14, $b0.0
;;
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.14, $b0.1
	c0	addcg $r0.16, $b0.0 = $r0.17, $r0.17, $b0.0
;;
	c0	addcg $r0.17, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.13, $b0.0 = $r0.13, $r0.14, $b0.0
	c0	mov $r0.16 = 15
	c0	cmpgeu $r0.18 = $r0.9, $r0.11
;;
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.14, $b0.1
	c0	mtb $b0.2 = $r0.12
	c0	addcg $r0.12, $b0.0 = $r0.17, $r0.17, $b0.0
;;
	c0	cmpge $b0.0 = $r0.13, $r0.0
	c0	addcg $r0.13, $b0.1 = $r0.12, $r0.12, $b0.1
;;
	c0	mfb $r0.12 = $b0.0
	c0	orc $r0.13 = $r0.13, $r0.0
;;
	c0	sh1add $r0.12 = $r0.13, $r0.12
;;
	c0	slct $r0.12 = $b0.2, $r0.18, $r0.12
	c0	shl $r0.11 = $r0.11, $r0.16
	c0	shru $r0.9 = $r0.9, $r0.6
;;
	c0	shl $r0.12 = $r0.12, $r0.15
;;
	c0	add $r0.11 = $r0.11, $r0.12
;;
LBB65_29:                               ## %if.end.19.i
	c0	cmpleu $b0.0 = $r0.11, $r0.9
;;
	c0	br $b0.0, LBB65_30
;;
## BB#33:                               ## %if.end.i.201
	c0	shru $r0.12 = $r0.11, $r0.4
;;
	c0	shl $r0.14 = $r0.12, $r0.4
;;
	c0	cmpleu $b0.0 = $r0.14, $r0.9
;;
	c0	br $b0.0, LBB65_34
;;
## BB#35:                               ## %cond.false.i.204
	c0	cmplt $r0.13 = $r0.12, $r0.0
	c0	mov $r0.15 = 0
;;
	c0	shru $r0.16 = $r0.9, $r0.13
	c0	mtb $b0.0 = $r0.15
	c0	shru $r0.17 = $r0.12, $r0.13
	c0	mtb $b0.1 = $r0.15
;;
	c0	addcg $r0.15, $b0.0 = $r0.16, $r0.16, $b0.0
;;
	c0	divs $r0.16, $b0.0 = $r0.0, $r0.17, $b0.0
	c0	addcg $r0.18, $b0.1 = $r0.15, $r0.15, $b0.1
;;
	c0	addcg $r0.15, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.16, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
	c0	cmpgeu $r0.18 = $r0.9, $r0.12
;;
	c0	addcg $r0.19, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.17, $b0.0
;;
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
	c0	addcg $r0.16, $b0.0 = $r0.19, $r0.19, $b0.0
;;
	c0	addcg $r0.19, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.17, $b0.0
;;
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
	c0	addcg $r0.16, $b0.0 = $r0.19, $r0.19, $b0.0
;;
	c0	cmpge $b0.0 = $r0.15, $r0.0
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
;;
	c0	mtb $b0.1 = $r0.13
	c0	mfb $r0.13 = $b0.0
	c0	orc $r0.15 = $r0.15, $r0.0
;;
	c0	sh1add $r0.13 = $r0.15, $r0.13
;;
	c0	slct $r0.13 = $b0.1, $r0.18, $r0.13
;;
	c0	shl $r0.13 = $r0.13, $r0.4
	c0	goto LBB65_36
;;
LBB65_30:
	c0	mov $r0.9 = 2147483647
	c0	goto LBB65_43
;;
LBB65_34:
	c0	mov $r0.13 = -65536
;;
LBB65_36:                               ## %cond.end.i.219
	c0	shru $r0.15 = $r0.13, $r0.4
	c0	zxth $r0.16 = $r0.11
	c0	mov $r0.17 = -1
	c0	mov $r0.18 = 0
;;
	c0	mpyhs $r0.19 = $r0.15, $r0.12
	c0	mpyhs $r0.20 = $r0.15, $r0.16
	c0	mpylu $r0.16 = $r0.15, $r0.16
;;
	c0	add $r0.16 = $r0.16, $r0.20
	c0	mpylu $r0.15 = $r0.15, $r0.12
;;
	c0	add $r0.15 = $r0.15, $r0.19
	c0	shl $r0.19 = $r0.16, $r0.4
	c0	shru $r0.16 = $r0.16, $r0.4
;;
	c0	sub $r0.15 = $r0.9, $r0.15
	c0	cmpne $r0.20 = $r0.19, 0
	c0	sub $r0.9 = $r0.18, $r0.19
;;
	c0	sub $r0.15 = $r0.15, $r0.16
	c0	mtb $b0.0 = $r0.20
;;
	c0	slct $r0.16 = $b0.0, $r0.17, 0
;;
	c0	add $r0.15 = $r0.15, $r0.16
;;
	c0	cmpgt $b0.0 = $r0.15, -1
;;
	c0	br $b0.0, LBB65_39
;;
## BB#37:                               ## %while.body.lr.ph.i.221
	c0	shl $r0.16 = $r0.11, $r0.4
;;
LBB65_38:                               ## %while.body.i.232
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.9 = $r0.9, $r0.16
	c0	add $r0.15 = $r0.15, $r0.12
	c0	add $r0.13 = $r0.13, -65536
;;
	c0	cmpltu $r0.17 = $r0.9, $r0.16
;;
	c0	add $r0.15 = $r0.15, $r0.17
;;
	c0	cmplt $b0.0 = $r0.15, 0
;;
	c0	br $b0.0, LBB65_38
;;
LBB65_39:                               ## %while.end.i.240
	c0	shl $r0.15 = $r0.15, $r0.4
	c0	shru $r0.9 = $r0.9, $r0.4
;;
	c0	or $r0.9 = $r0.9, $r0.15
;;
	c0	cmpleu $b0.0 = $r0.14, $r0.9
;;
	c0	br $b0.0, LBB65_40
;;
## BB#41:                               ## %cond.false.10.i.242
	c0	cmplt $r0.14 = $r0.12, $r0.0
	c0	mov $r0.15 = 0
;;
	c0	shru $r0.16 = $r0.9, $r0.14
	c0	mtb $b0.0 = $r0.15
	c0	shru $r0.17 = $r0.12, $r0.14
	c0	mtb $b0.1 = $r0.15
;;
	c0	addcg $r0.15, $b0.0 = $r0.16, $r0.16, $b0.0
;;
	c0	divs $r0.16, $b0.0 = $r0.0, $r0.17, $b0.0
	c0	addcg $r0.18, $b0.1 = $r0.15, $r0.15, $b0.1
;;
	c0	addcg $r0.15, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.16, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.17, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.18, $r0.18, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.17, $b0.1
;;
	c0	addcg $r0.18, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.17, $b0.0
	c0	cmpgeu $r0.9 = $r0.9, $r0.12
;;
	c0	divs $r0.12, $b0.1 = $r0.15, $r0.17, $b0.1
	c0	mtb $b0.2 = $r0.14
	c0	addcg $r0.14, $b0.0 = $r0.18, $r0.18, $b0.0
;;
	c0	cmpge $b0.0 = $r0.12, $r0.0
	c0	addcg $r0.12, $b0.1 = $r0.14, $r0.14, $b0.1
;;
	c0	mfb $r0.14 = $b0.0
	c0	orc $r0.12 = $r0.12, $r0.0
;;
	c0	sh1add $r0.12 = $r0.12, $r0.14
;;
	c0	slct $r0.9 = $b0.2, $r0.9, $r0.12
	c0	goto LBB65_42
;;
LBB65_40:
	c0	mov $r0.9 = 65535
;;
LBB65_42:                               ## %cond.end.12.i.245
	c0	or $r0.9 = $r0.9, $r0.13
;;
	c0	shru $r0.9 = $r0.9, $r0.6
;;
LBB65_43:                               ## %estimateDiv64To32.exit247
	c0	shru $r0.11 = $r0.11, $r0.6
;;
	c0	add $r0.9 = $r0.9, $r0.11
;;
LBB65_44:                               ## %estimateSqrt32.exit
	c0	shru $r0.9 = $r0.9, $r0.6
	c0	mov $r0.14 = 9
	c0	mov $r0.13 = 17
	c0	mov $r0.11 = 0
	c0	mov $r0.12 = 15
	c0	mov $r0.15 = -1
;;
	c0	add $r0.9 = $r0.9, 1
	c0	sub $r0.10 = $r0.14, $r0.10
;;
	c0	shru $r0.14 = $r0.9, $r0.4
	c0	zxth $r0.16 = $r0.9
	c0	sub $r0.17 = $r0.11, $r0.10
	c0	shl $r0.18 = $r0.5, $r0.10
	c0	shl $r0.8 = $r0.8, $r0.10
;;
	c0	mpylu $r0.10 = $r0.14, $r0.16
	c0	mpyhs $r0.19 = $r0.14, $r0.16
	c0	mpyhs $r0.20 = $r0.16, $r0.16
	c0	mpylu $r0.16 = $r0.16, $r0.16
	c0	and $r0.17 = $r0.17, 31
	c0	mpylu $r0.21 = $r0.14, $r0.14
	c0	mpyhs $r0.14 = $r0.14, $r0.14
;;
	c0	add $r0.10 = $r0.10, $r0.19
	c0	add $r0.16 = $r0.16, $r0.20
	c0	shru $r0.5 = $r0.5, $r0.17
	c0	add $r0.14 = $r0.21, $r0.14
;;
	c0	shl $r0.17 = $r0.10, $r0.13
	c0	shl $r0.19 = $r0.10, $r0.6
;;
	c0	add $r0.16 = $r0.17, $r0.16
	c0	shru $r0.20 = $r0.10, $r0.12
	c0	or $r0.5 = $r0.5, $r0.8
	c0	cmpltu $b0.0 = $r0.19, $r0.10
;;
	c0	cmpltu $r0.8 = $r0.16, $r0.17
	c0	cmpltu $r0.10 = $r0.18, $r0.16
	c0	mfb $r0.17 = $b0.0
	c0	zxth $r0.19 = $r0.20
	c0	sub $r0.5 = $r0.5, $r0.14
;;
	c0	mtb $b0.0 = $r0.10
	c0	mtb $b0.1 = $r0.8
	c0	shl $r0.10 = $r0.17, $r0.4
;;
	c0	mfb $r0.8 = $b0.1
	c0	slct $r0.14 = $b0.0, $r0.15, 0
;;
	c0	add $r0.17 = $r0.5, $r0.8
	c0	shr $r0.5 = $r0.7, $r0.6
	c0	shl $r0.7 = $r0.9, $r0.6
	c0	sub $r0.8 = $r0.18, $r0.16
	c0	or $r0.10 = $r0.10, $r0.19
;;
	c0	add $r0.14 = $r0.17, $r0.14
;;
	c0	sub $r0.10 = $r0.14, $r0.10
;;
	c0	cmpgt $b0.0 = $r0.10, -1
;;
	c0	br $b0.0, LBB65_46
;;
LBB65_45:                               ## %while.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.14 = $r0.7, -1
	c0	add $r0.9 = $r0.9, -1
	c0	add $r0.7 = $r0.7, -2
;;
	c0	add $r0.8 = $r0.14, $r0.8
;;
	c0	cmpltu $r0.14 = $r0.8, $r0.14
;;
	c0	add $r0.10 = $r0.14, $r0.10
;;
	c0	cmplt $b0.0 = $r0.10, 0
;;
	c0	br $b0.0, LBB65_45
;;
LBB65_46:                               ## %while.end
	c0	add $r0.5 = $r0.5, 1022
	c0	cmpleu $b0.0 = $r0.7, $r0.8
;;
	c0	br $b0.0, LBB65_61
;;
## BB#47:                               ## %if.end.i
	c0	shru $r0.10 = $r0.7, $r0.4
;;
	c0	shl $r0.17 = $r0.10, $r0.4
;;
	c0	cmpleu $b0.0 = $r0.17, $r0.8
;;
	c0	br $b0.0, LBB65_48
;;
## BB#49:                               ## %cond.false.i
	c0	cmplt $r0.14 = $r0.10, $r0.0
	c0	mov $r0.15 = 0
;;
	c0	shru $r0.16 = $r0.8, $r0.14
	c0	mtb $b0.0 = $r0.15
	c0	shru $r0.18 = $r0.10, $r0.14
	c0	mtb $b0.1 = $r0.15
;;
	c0	addcg $r0.15, $b0.0 = $r0.16, $r0.16, $b0.0
;;
	c0	divs $r0.16, $b0.0 = $r0.0, $r0.18, $b0.0
	c0	addcg $r0.19, $b0.1 = $r0.15, $r0.15, $b0.1
;;
	c0	addcg $r0.15, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.16, $b0.1 = $r0.16, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.16, $r0.18, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.18, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.18, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.18, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.18, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.18, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.18, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.18, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.18, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.18, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.18, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.18, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.18, $b0.1
;;
	c0	addcg $r0.19, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.18, $b0.0
;;
	c0	addcg $r0.16, $b0.0 = $r0.19, $r0.19, $b0.0
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.18, $b0.1
	c0	cmpgeu $r0.19 = $r0.8, $r0.10
;;
	c0	addcg $r0.20, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.18, $b0.0
;;
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.18, $b0.1
	c0	addcg $r0.16, $b0.0 = $r0.20, $r0.20, $b0.0
;;
	c0	addcg $r0.20, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.18, $b0.0
;;
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.18, $b0.1
	c0	addcg $r0.16, $b0.0 = $r0.20, $r0.20, $b0.0
;;
	c0	cmpge $b0.0 = $r0.15, $r0.0
	c0	mtb $b0.2 = $r0.14
	c0	addcg $r0.14, $b0.1 = $r0.16, $r0.16, $b0.1
;;
	c0	mfb $r0.15 = $b0.0
	c0	orc $r0.14 = $r0.14, $r0.0
;;
	c0	sh1add $r0.14 = $r0.14, $r0.15
;;
	c0	slct $r0.14 = $b0.2, $r0.19, $r0.14
;;
	c0	shl $r0.15 = $r0.14, $r0.4
	c0	goto LBB65_50
;;
LBB65_48:
	c0	mov $r0.15 = -65536
;;
LBB65_50:                               ## %cond.end.i
	c0	shru $r0.18 = $r0.15, $r0.4
	c0	and $r0.16 = $r0.7, 65534
	c0	mov $r0.14 = -1
;;
	c0	mpylu $r0.19 = $r0.18, $r0.10
	c0	mpyhs $r0.20 = $r0.18, $r0.16
	c0	mpylu $r0.21 = $r0.18, $r0.16
;;
	c0	add $r0.20 = $r0.21, $r0.20
	c0	mpyhs $r0.18 = $r0.18, $r0.10
;;
	c0	add $r0.18 = $r0.19, $r0.18
	c0	shl $r0.19 = $r0.20, $r0.4
	c0	shru $r0.20 = $r0.20, $r0.4
;;
	c0	sub $r0.21 = $r0.8, $r0.18
	c0	cmpne $r0.22 = $r0.19, 0
	c0	sub $r0.18 = $r0.11, $r0.19
;;
	c0	sub $r0.19 = $r0.21, $r0.20
	c0	mtb $b0.0 = $r0.22
;;
	c0	slct $r0.20 = $b0.0, $r0.14, 0
;;
	c0	add $r0.19 = $r0.19, $r0.20
;;
	c0	cmpgt $b0.0 = $r0.19, -1
;;
	c0	br $b0.0, LBB65_53
;;
## BB#51:                               ## %while.body.lr.ph.i
	c0	shl $r0.20 = $r0.7, $r0.4
;;
LBB65_52:                               ## %while.body.i
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.18 = $r0.18, $r0.20
	c0	add $r0.19 = $r0.19, $r0.10
	c0	add $r0.15 = $r0.15, -65536
;;
	c0	cmpltu $r0.21 = $r0.18, $r0.20
;;
	c0	add $r0.19 = $r0.19, $r0.21
;;
	c0	cmplt $b0.0 = $r0.19, 0
;;
	c0	br $b0.0, LBB65_52
;;
LBB65_53:                               ## %while.end.i
	c0	shl $r0.19 = $r0.19, $r0.4
	c0	shru $r0.18 = $r0.18, $r0.4
;;
	c0	or $r0.18 = $r0.18, $r0.19
;;
	c0	cmpleu $b0.0 = $r0.17, $r0.18
;;
	c0	br $b0.0, LBB65_54
;;
## BB#55:                               ## %cond.false.10.i
	c0	cmplt $r0.17 = $r0.10, $r0.0
	c0	mov $r0.19 = 0
;;
	c0	shru $r0.20 = $r0.18, $r0.17
	c0	mtb $b0.0 = $r0.19
	c0	shru $r0.21 = $r0.10, $r0.17
	c0	mtb $b0.1 = $r0.19
;;
	c0	addcg $r0.19, $b0.0 = $r0.20, $r0.20, $b0.0
;;
	c0	divs $r0.20, $b0.0 = $r0.0, $r0.21, $b0.0
	c0	addcg $r0.22, $b0.1 = $r0.19, $r0.19, $b0.1
;;
	c0	addcg $r0.19, $b0.0 = $r0.22, $r0.22, $b0.0
	c0	divs $r0.20, $b0.1 = $r0.20, $r0.21, $b0.1
;;
	c0	addcg $r0.22, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.20, $r0.21, $b0.0
;;
	c0	addcg $r0.20, $b0.0 = $r0.22, $r0.22, $b0.0
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.21, $b0.1
;;
	c0	addcg $r0.22, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.19, $r0.21, $b0.0
;;
	c0	addcg $r0.20, $b0.0 = $r0.22, $r0.22, $b0.0
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.21, $b0.1
;;
	c0	addcg $r0.22, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.19, $r0.21, $b0.0
;;
	c0	addcg $r0.20, $b0.0 = $r0.22, $r0.22, $b0.0
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.21, $b0.1
;;
	c0	addcg $r0.22, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.19, $r0.21, $b0.0
;;
	c0	addcg $r0.20, $b0.0 = $r0.22, $r0.22, $b0.0
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.21, $b0.1
;;
	c0	addcg $r0.22, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.19, $r0.21, $b0.0
;;
	c0	addcg $r0.20, $b0.0 = $r0.22, $r0.22, $b0.0
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.21, $b0.1
;;
	c0	addcg $r0.22, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.19, $r0.21, $b0.0
;;
	c0	addcg $r0.20, $b0.0 = $r0.22, $r0.22, $b0.0
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.21, $b0.1
;;
	c0	addcg $r0.22, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.19, $r0.21, $b0.0
;;
	c0	addcg $r0.20, $b0.0 = $r0.22, $r0.22, $b0.0
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.21, $b0.1
;;
	c0	addcg $r0.22, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.19, $r0.21, $b0.0
;;
	c0	addcg $r0.20, $b0.0 = $r0.22, $r0.22, $b0.0
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.21, $b0.1
;;
	c0	addcg $r0.22, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.19, $r0.21, $b0.0
;;
	c0	addcg $r0.20, $b0.0 = $r0.22, $r0.22, $b0.0
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.21, $b0.1
;;
	c0	addcg $r0.22, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.19, $r0.21, $b0.0
;;
	c0	addcg $r0.20, $b0.0 = $r0.22, $r0.22, $b0.0
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.21, $b0.1
;;
	c0	addcg $r0.22, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.19, $r0.21, $b0.0
;;
	c0	addcg $r0.20, $b0.0 = $r0.22, $r0.22, $b0.0
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.21, $b0.1
;;
	c0	addcg $r0.22, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.19, $r0.21, $b0.0
;;
	c0	addcg $r0.20, $b0.0 = $r0.22, $r0.22, $b0.0
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.21, $b0.1
;;
	c0	addcg $r0.22, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.19, $r0.21, $b0.0
;;
	c0	addcg $r0.20, $b0.0 = $r0.22, $r0.22, $b0.0
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.21, $b0.1
;;
	c0	addcg $r0.22, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.19, $r0.21, $b0.0
;;
	c0	addcg $r0.20, $b0.0 = $r0.22, $r0.22, $b0.0
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.21, $b0.1
;;
	c0	addcg $r0.22, $b0.1 = $r0.20, $r0.20, $b0.1
	c0	divs $r0.19, $b0.0 = $r0.19, $r0.21, $b0.0
	c0	cmpgeu $r0.18 = $r0.18, $r0.10
;;
	c0	divs $r0.19, $b0.1 = $r0.19, $r0.21, $b0.1
	c0	mtb $b0.2 = $r0.17
	c0	addcg $r0.17, $b0.0 = $r0.22, $r0.22, $b0.0
;;
	c0	cmpge $b0.0 = $r0.19, $r0.0
	c0	addcg $r0.19, $b0.1 = $r0.17, $r0.17, $b0.1
;;
	c0	mfb $r0.17 = $b0.0
	c0	orc $r0.19 = $r0.19, $r0.0
;;
	c0	sh1add $r0.17 = $r0.19, $r0.17
;;
	c0	slct $r0.17 = $b0.2, $r0.18, $r0.17
	c0	goto LBB65_56
;;
LBB65_54:
	c0	mov $r0.17 = 65535
;;
LBB65_56:                               ## %estimateDiv64To32.exit
	c0	or $r0.15 = $r0.17, $r0.15
;;
	c0	and $r0.17 = $r0.15, 510
;;
	c0	cmpgtu $b0.0 = $r0.17, 5
;;
	c0	br $b0.0, LBB65_61
;;
## BB#57:                               ## %if.then.53
	c0	cmpeq $b0.0 = $r0.15, 0
;;
	c0	slct $r0.17 = $b0.0, $r0.6, $r0.15
;;
	c0	zxth $r0.18 = $r0.17
	c0	shru $r0.19 = $r0.17, $r0.4
;;
	c0	mpylu $r0.20 = $r0.19, $r0.18
	c0	mpyhs $r0.21 = $r0.19, $r0.18
	c0	mpylu $r0.22 = $r0.18, $r0.10
	c0	mpyhs $r0.23 = $r0.18, $r0.10
	c0	mpyhs $r0.24 = $r0.19, $r0.16
	c0	mpylu $r0.25 = $r0.19, $r0.16
;;
	c0	add $r0.20 = $r0.20, $r0.21
	c0	mpylu $r0.21 = $r0.18, $r0.18
	c0	mpyhs $r0.26 = $r0.18, $r0.18
	c0	add $r0.24 = $r0.25, $r0.24
	c0	add $r0.22 = $r0.22, $r0.23
	c0	mpyhs $r0.23 = $r0.18, $r0.16
	c0	mpylu $r0.16 = $r0.18, $r0.16
	c0	mpyhs $r0.18 = $r0.19, $r0.19
;;
	c0	shl $r0.6 = $r0.20, $r0.6
	c0	add $r0.22 = $r0.24, $r0.22
	c0	shl $r0.13 = $r0.20, $r0.13
	c0	add $r0.21 = $r0.21, $r0.26
	c0	mpylu $r0.25 = $r0.19, $r0.19
	c0	mpyhs $r0.26 = $r0.19, $r0.10
;;
	c0	cmpltu $b0.0 = $r0.6, $r0.20
	c0	mpylu $r0.6 = $r0.19, $r0.10
	c0	add $r0.10 = $r0.16, $r0.23
	c0	shru $r0.12 = $r0.20, $r0.12
	c0	shl $r0.16 = $r0.22, $r0.4
	c0	add $r0.19 = $r0.13, $r0.21
;;
	c0	mfb $r0.20 = $b0.0
	c0	add $r0.6 = $r0.6, $r0.26
	c0	add $r0.18 = $r0.25, $r0.18
	c0	cmpltu $r0.21 = $r0.22, $r0.24
	c0	zxth $r0.12 = $r0.12
	c0	cmpltu $r0.13 = $r0.19, $r0.13
	c0	add $r0.10 = $r0.16, $r0.10
;;
	c0	shl $r0.20 = $r0.20, $r0.4
	c0	sub $r0.6 = $r0.8, $r0.6
	c0	shru $r0.8 = $r0.22, $r0.4
	c0	shl $r0.4 = $r0.21, $r0.4
	c0	cmpne $r0.21 = $r0.10, 0
	c0	cmpltu $r0.16 = $r0.10, $r0.16
	c0	add $r0.13 = $r0.13, $r0.18
;;
	c0	or $r0.12 = $r0.20, $r0.12
	c0	cmpne $b0.0 = $r0.19, 0
	c0	sub $r0.10 = $r0.11, $r0.10
	c0	or $r0.4 = $r0.4, $r0.8
	c0	mtb $b0.1 = $r0.21
	c0	mtb $b0.2 = $r0.16
;;
	c0	sub $r0.4 = $r0.6, $r0.4
	c0	mfb $r0.6 = $b0.2
	c0	add $r0.8 = $r0.13, $r0.12
	c0	mfb $r0.12 = $b0.0
	c0	slct $r0.13 = $b0.1, $r0.14, 0
;;
	c0	sub $r0.16 = $r0.10, $r0.8
	c0	cmpgtu $r0.8 = $r0.8, $r0.10
	c0	add $r0.10 = $r0.4, $r0.6
;;
	c0	mtb $b0.0 = $r0.8
	c0	cmpltu $r0.4 = $r0.16, $r0.12
;;
	c0	mtb $b0.1 = $r0.4
	c0	sub $r0.4 = $r0.11, $r0.19
	c0	sub $r0.6 = $r0.16, $r0.12
	c0	add $r0.8 = $r0.10, $r0.13
	c0	slct $r0.10 = $b0.0, $r0.14, 0
;;
	c0	slct $r0.11 = $b0.1, $r0.14, 0
	c0	add $r0.8 = $r0.8, $r0.10
;;
	c0	add $r0.8 = $r0.8, $r0.11
;;
	c0	cmpgt $b0.0 = $r0.8, -1
;;
	c0	br $b0.0, LBB65_60
;;
## BB#58:                               ## %while.body.59.preheader
	c0	maxu $r0.10 = $r0.15, 1
;;
	c0	sh1add $r0.10 = $r0.10, $r0.14
;;
LBB65_59:                               ## %while.body.59
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.17 = $r0.17, -1
	c0	add $r0.4 = $r0.10, $r0.4
;;
	c0	shru $r0.11 = $r0.17, $r0.2
;;
	c0	or $r0.11 = $r0.11, $r0.7
	c0	cmpltu $r0.12 = $r0.4, $r0.10
;;
	c0	add $r0.6 = $r0.11, $r0.6
	c0	add $r0.10 = $r0.10, -2
;;
	c0	cmpltu $r0.11 = $r0.6, $r0.11
	c0	add $r0.6 = $r0.12, $r0.6
;;
	c0	add $r0.8 = $r0.11, $r0.8
	c0	cmpltu $r0.11 = $r0.6, $r0.12
;;
	c0	add $r0.8 = $r0.8, $r0.11
;;
	c0	cmplt $b0.0 = $r0.8, 0
;;
	c0	br $b0.0, LBB65_59
;;
LBB65_60:                               ## %while.end.63
	c0	or $r0.2 = $r0.6, $r0.8
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	mfb $r0.2 = $b0.0
;;
	c0	or $r0.15 = $r0.2, $r0.17
;;
LBB65_61:                               ## %if.end.68
	c0	mov $r0.2 = 22
	c0	mov $r0.7 = 10
	c0	mov $r0.4 = 0
;;
	c0	shru $r0.6 = $r0.9, $r0.7
	c0	shru $r0.7 = $r0.15, $r0.7
	c0	shl $r0.8 = $r0.15, $r0.2
	c0	shl $r0.2 = $r0.9, $r0.2
;;
	c0	or $r0.7 = $r0.7, $r0.2
;;
.call roundAndPackFloat64, caller, arg($r0.3:u32,$r0.4:u32,$r0.5:u32,$r0.6:u32,$r0.7:u32,$r0.8:u32), ret()
	c0	call $l0.0 = roundAndPackFloat64
;;
.return ret()
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
	c0	br $b0.0, LBB66_2
;;
## BB#1:                                ## %land.lhs.true
	c0	and $r0.2 = $r0.3, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB66_4
;;
LBB66_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.5, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
	c0	br $b0.0, LBB66_9
;;
## BB#3:                                ## %land.lhs.true.16
	c0	and $r0.2 = $r0.5, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB66_9
;;
LBB66_4:                                ## %if.then
	c0	and $r0.2 = $r0.3, 2146959360
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
	c0	br $b0.0, LBB66_6
;;
## BB#5:                                ## %land.rhs.i.73
	c0	and $r0.2 = $r0.3, 524287
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB66_8
;;
LBB66_6:                                ## %lor.lhs.false.29
	c0	and $r0.2 = $r0.5, 2146959360
	c0	mov $r0.3 = 0
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
	c0	br $b0.0, LBB66_16
;;
## BB#7:                                ## %land.rhs.i
	c0	and $r0.2 = $r0.5, 524287
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB66_16
;;
LBB66_8:                                ## %if.then.34
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
	c0	mov $r0.3 = 0
;;
	c0	or $r0.4 = $r0.4, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB66_9:                                ## %if.end.35
	c0	cmpne $b0.0 = $r0.4, $r0.6
;;
	c0	br $b0.0, LBB66_10
;;
## BB#11:                               ## %land.rhs
	c0	cmpeq $b0.0 = $r0.3, $r0.5
;;
	c0	brf $b0.0, LBB66_13
;;
## BB#12:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB66_15
;;
LBB66_13:                               ## %lor.rhs
	c0	cmpne $b0.0 = $r0.4, 0
;;
	c0	brf $b0.0, LBB66_14
;;
LBB66_10:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
;;
LBB66_15:                               ## %land.end.49
	c0	mfb $r0.3 = $b0.0
;;
LBB66_16:                               ## %return
.return ret($r0.3:u32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB66_14:                               ## %land.rhs.44
	c0	or $r0.2 = $r0.5, $r0.3
;;
	c0	and $r0.2 = $r0.2, 2147483647
;;
	c0	cmpeq $b0.0 = $r0.2, 0
	c0	goto LBB66_15
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
	c0	br $b0.0, LBB67_2
;;
## BB#1:                                ## %land.lhs.true
	c0	and $r0.2 = $r0.3, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB67_4
;;
LBB67_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.5, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
	c0	br $b0.0, LBB67_5
;;
## BB#3:                                ## %land.lhs.true.16
	c0	and $r0.2 = $r0.5, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB67_5
;;
LBB67_4:                                ## %if.then
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
	c0	mov $r0.3 = 0
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
	c0	brf $b0.0, LBB67_6
;;
## BB#9:                                ## %if.end.42
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB67_12
;;
## BB#10:                               ## %cond.true
	c0	cmpltu $b0.0 = $r0.5, $r0.3
;;
	c0	br $b0.0, LBB67_7
;;
## BB#11:                               ## %lor.rhs.i.86
	c0	cmpleu $b0.0 = $r0.6, $r0.4
	c0	cmpeq $b0.1 = $r0.5, $r0.3
	c0	goto LBB67_14
;;
LBB67_6:                                ## %if.then.32
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB67_7
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
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB67_12:                               ## %cond.false
	c0	cmpltu $b0.0 = $r0.3, $r0.5
;;
	c0	brf $b0.0, LBB67_13
;;
LBB67_7:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB67_13:                               ## %lor.rhs.i
	c0	cmpleu $b0.0 = $r0.4, $r0.6
	c0	cmpeq $b0.1 = $r0.3, $r0.5
;;
LBB67_14:                               ## %le64.exit
	c0	mfb $r0.2 = $b0.0
	c0	mfb $r0.3 = $b0.1
;;
	c0	and $r0.2 = $r0.3, $r0.2
;;
	c0	mtb $b0.0 = $r0.2
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
	c0	br $b0.0, LBB68_2
;;
## BB#1:                                ## %land.lhs.true
	c0	and $r0.2 = $r0.3, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB68_4
;;
LBB68_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.5, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
	c0	br $b0.0, LBB68_5
;;
## BB#3:                                ## %land.lhs.true.16
	c0	and $r0.2 = $r0.5, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB68_5
;;
LBB68_4:                                ## %if.then
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
	c0	mov $r0.3 = 0
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
	c0	brf $b0.0, LBB68_6
;;
## BB#9:                                ## %if.end.42
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB68_13
;;
## BB#10:                               ## %cond.true
	c0	cmpltu $b0.0 = $r0.5, $r0.3
;;
	c0	br $b0.0, LBB68_11
;;
## BB#12:                               ## %lor.rhs.i.86
	c0	cmpltu $b0.0 = $r0.6, $r0.4
	c0	cmpeq $b0.1 = $r0.5, $r0.3
	c0	goto LBB68_15
;;
LBB68_6:                                ## %if.then.32
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB68_7
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
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB68_13:                               ## %cond.false
	c0	cmpltu $b0.0 = $r0.3, $r0.5
;;
	c0	brf $b0.0, LBB68_14
;;
LBB68_11:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
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
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB68_14:                               ## %lor.rhs.i
	c0	cmpltu $b0.0 = $r0.4, $r0.6
	c0	cmpeq $b0.1 = $r0.3, $r0.5
;;
LBB68_15:                               ## %lt64.exit
	c0	mfb $r0.2 = $b0.0
	c0	mfb $r0.3 = $b0.1
;;
	c0	and $r0.2 = $r0.3, $r0.2
;;
	c0	mtb $b0.0 = $r0.2
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
	c0	br $b0.0, LBB69_2
;;
## BB#1:                                ## %land.lhs.true
	c0	and $r0.2 = $r0.3, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB69_4
;;
LBB69_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.5, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
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
	c0	br $b0.0, LBB69_5
;;
LBB69_4:                                ## %if.then
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
	c0	mov $r0.3 = 0
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
	c0	br $b0.0, LBB69_6
;;
## BB#7:                                ## %land.rhs
	c0	cmpeq $b0.0 = $r0.3, $r0.5
;;
	c0	brf $b0.0, LBB69_9
;;
## BB#8:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB69_9:                                ## %lor.rhs
	c0	cmpne $b0.0 = $r0.4, 0
;;
	c0	brf $b0.0, LBB69_10
;;
LBB69_6:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
;;
.return ret($r0.3:u32)
	c0	mfb $r0.3 = $b0.0
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB69_10:                               ## %land.rhs.33
	c0	or $r0.2 = $r0.5, $r0.3
;;
	c0	and $r0.2 = $r0.2, 2147483647
;;
	c0	cmpeq $b0.0 = $r0.2, 0
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
	c0	br $b0.0, LBB70_2
;;
## BB#1:                                ## %land.lhs.true
	c0	and $r0.2 = $r0.3, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB70_4
;;
LBB70_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.5, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
	c0	br $b0.0, LBB70_9
;;
## BB#3:                                ## %land.lhs.true.16
	c0	and $r0.2 = $r0.5, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB70_9
;;
LBB70_4:                                ## %if.then
	c0	and $r0.2 = $r0.3, 2146959360
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
	c0	br $b0.0, LBB70_6
;;
## BB#5:                                ## %land.rhs.i.112
	c0	and $r0.2 = $r0.3, 524287
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB70_8
;;
LBB70_6:                                ## %lor.lhs.false.29
	c0	and $r0.2 = $r0.5, 2146959360
	c0	mov $r0.3 = 0
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
	c0	br $b0.0, LBB70_20
;;
## BB#7:                                ## %land.rhs.i
	c0	and $r0.2 = $r0.5, 524287
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB70_20
;;
LBB70_8:                                ## %if.then.34
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
	c0	mov $r0.3 = 0
;;
	c0	or $r0.4 = $r0.4, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB70_9:                                ## %if.end.35
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.7 = $r0.5, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.7
;;
	c0	brf $b0.0, LBB70_10
;;
## BB#13:                               ## %if.end.53
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB70_16
;;
## BB#14:                               ## %cond.true
	c0	cmpltu $b0.0 = $r0.5, $r0.3
;;
	c0	br $b0.0, LBB70_11
;;
## BB#15:                               ## %lor.rhs.i.101
	c0	cmpleu $b0.0 = $r0.6, $r0.4
	c0	cmpeq $b0.1 = $r0.5, $r0.3
	c0	goto LBB70_18
;;
LBB70_10:                               ## %if.then.43
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB70_11
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
	c0	goto LBB70_19
;;
LBB70_16:                               ## %cond.false
	c0	cmpltu $b0.0 = $r0.3, $r0.5
;;
	c0	brf $b0.0, LBB70_17
;;
LBB70_11:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB70_19
;;
LBB70_17:                               ## %lor.rhs.i
	c0	cmpleu $b0.0 = $r0.4, $r0.6
	c0	cmpeq $b0.1 = $r0.3, $r0.5
;;
LBB70_18:                               ## %le64.exit
	c0	mfb $r0.2 = $b0.0
	c0	mfb $r0.3 = $b0.1
;;
	c0	and $r0.2 = $r0.3, $r0.2
;;
	c0	mtb $b0.0 = $r0.2
;;
LBB70_19:                               ## %le64.exit
	c0	mfb $r0.3 = $b0.0
;;
LBB70_20:                               ## %cleanup
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
	c0	br $b0.0, LBB71_2
;;
## BB#1:                                ## %land.lhs.true
	c0	and $r0.2 = $r0.3, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB71_4
;;
LBB71_2:                                ## %lor.lhs.false
	c0	and $r0.2 = $r0.5, 2146435072
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
	c0	br $b0.0, LBB71_9
;;
## BB#3:                                ## %land.lhs.true.16
	c0	and $r0.2 = $r0.5, 1048575
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB71_9
;;
LBB71_4:                                ## %if.then
	c0	and $r0.2 = $r0.3, 2146959360
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
	c0	br $b0.0, LBB71_6
;;
## BB#5:                                ## %land.rhs.i.112
	c0	and $r0.2 = $r0.3, 524287
;;
	c0	or $r0.2 = $r0.2, $r0.4
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB71_8
;;
LBB71_6:                                ## %lor.lhs.false.29
	c0	and $r0.2 = $r0.5, 2146959360
	c0	mov $r0.3 = 0
;;
	c0	cmpne $b0.0 = $r0.2, 2146435072
;;
	c0	br $b0.0, LBB71_21
;;
## BB#7:                                ## %land.rhs.i
	c0	and $r0.2 = $r0.5, 524287
;;
	c0	or $r0.2 = $r0.2, $r0.6
;;
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB71_21
;;
LBB71_8:                                ## %if.then.34
	c0	mov $r0.2 = float_exception_flags
;;
	c0	ldw $r0.4 = 0[$r0.2]
	c0	mov $r0.3 = 0
;;
	c0	or $r0.4 = $r0.4, 16
;;
.return ret($r0.3:u32)
	c0	stw 0[$r0.2] = $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB71_9:                                ## %if.end.35
	c0	mov $r0.2 = 31
;;
	c0	shru $r0.7 = $r0.5, $r0.2
	c0	shru $r0.2 = $r0.3, $r0.2
;;
	c0	cmpeq $b0.0 = $r0.2, $r0.7
;;
	c0	brf $b0.0, LBB71_10
;;
## BB#13:                               ## %if.end.53
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB71_17
;;
## BB#14:                               ## %cond.true
	c0	cmpltu $b0.0 = $r0.5, $r0.3
;;
	c0	br $b0.0, LBB71_15
;;
## BB#16:                               ## %lor.rhs.i.101
	c0	cmpltu $b0.0 = $r0.6, $r0.4
	c0	cmpeq $b0.1 = $r0.5, $r0.3
	c0	goto LBB71_19
;;
LBB71_10:                               ## %if.then.43
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	br $b0.0, LBB71_11
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
	c0	goto LBB71_20
;;
LBB71_17:                               ## %cond.false
	c0	cmpltu $b0.0 = $r0.3, $r0.5
;;
	c0	brf $b0.0, LBB71_18
;;
LBB71_15:
	c0	mov $r0.2 = -1
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB71_20
;;
LBB71_11:
	c0	mov $r0.2 = 0
;;
	c0	mtb $b0.0 = $r0.2
	c0	goto LBB71_20
;;
LBB71_18:                               ## %lor.rhs.i
	c0	cmpltu $b0.0 = $r0.4, $r0.6
	c0	cmpeq $b0.1 = $r0.3, $r0.5
;;
LBB71_19:                               ## %lt64.exit
	c0	mfb $r0.2 = $b0.0
	c0	mfb $r0.3 = $b0.1
;;
	c0	and $r0.2 = $r0.3, $r0.2
;;
	c0	mtb $b0.0 = $r0.2
;;
LBB71_20:                               ## %lt64.exit
	c0	mfb $r0.3 = $b0.0
;;
LBB71_21:                               ## %cleanup
.return ret($r0.3:u32)
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
