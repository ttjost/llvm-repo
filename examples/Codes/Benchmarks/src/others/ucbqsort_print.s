.section .text

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg()
compare::
	c0	ldbu $r0.2 = 0[$r0.4]
;;
	c0	ldbu $r0.3 = 0[$r0.3]
;;
;;
.return ret($r0.3:s32)
	c0	sub $r0.3 = $r0.3, $r0.2
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-1056, arg()
main::
	c0	add $r0.1 = $r0.1, -1056
;;
	c0	stw 1036[$r0.1] = $r0.57
;;
	c0	stw 1032[$r0.1] = $r0.58
;;
	c0	stw 1028[$r0.1] = $r0.59
;;
	c0	stw 1024[$r0.1] = $l0.0
	c0	mov $r0.4 = gQSortNum
;;
	c0	mov $r0.59 = 1000
	c0	add $r0.57 = $r0.1, 24
;;
.call memcpy, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	mov $r0.3 = $r0.57
	c0	mov $r0.5 = $r0.59
	c0	call $l0.0 = memcpy
;;
	c0	mov $r0.58 = 1
	c0	mov $r0.6 = compare
	c0	mov $r0.3 = $r0.57
;;
.call QSORT, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	mov $r0.4 = $r0.59
	c0	mov $r0.5 = $r0.58
	c0	call $l0.0 = QSORT
;;
	c0	ldb $r0.4 = 24[$r0.1]
	c0	mov $r0.2 = 15
	c0	mov $r0.5 = 66
;;
LBB1_2:
	c0	add $r0.3 = $r0.57, $r0.58
	c0	zxtb $r0.6 = $r0.4
;;
	c0	ldbu $r0.4 = 0[$r0.3]
;;
;;
	c0	cmpgeu $b0.0 = $r0.4, $r0.6
	c0	mov $r0.3 = $r0.2
;;
;;
	c0	brf $b0.0, LBB1_3
;;
	c0	add $r0.58 = $r0.58, 1
;;
	c0	cmpgt $b0.0 = $r0.58, 999
	c0	mov $r0.3 = $r0.5
;;
;;
	c0	brf $b0.0, LBB1_2
;;
LBB1_3:
	c0	ldw $l0.0 = 1024[$r0.1]
;;
	c0	ldw $r0.59 = 1028[$r0.1]
;;
	c0	ldw $r0.58 = 1032[$r0.1]
;;
	c0	ldw $r0.57 = 1036[$r0.1]
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 1056, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg()
QSORT::
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
	c0	cmplt $b0.0 = $r0.4, 2
;;
;;
	c0	br $b0.0, LBB2_26
;;
	c0	mpyhs $r0.2 = $r0.5, $r0.4
	c0	mpylu $r0.3 = $r0.5, $r0.4
	c0	mov $r0.61 = qsz
;;
	c0	mov $r0.7 = 2
	c0	stw 0[$r0.61] = $r0.5
;;
	c0	shl $r0.7 = $r0.5, $r0.7
	c0	add $r0.63 = $r0.3, $r0.2
	c0	mpyhs $r0.2 = $r0.5, 6
	c0	mpylu $r0.3 = $r0.5, 6
;;
	c0	mov $r0.62 = qcmp
;;
	c0	stw 0[$r0.62] = $r0.6
	c0	add $r0.2 = $r0.3, $r0.2
	c0	mov $r0.59 = thresh
;;
	c0	stw 0[$r0.59] = $r0.7
	c0	add $r0.58 = $r0.57, $r0.63
;;
	c0	stw 24[$r0.1] = $r0.58
	c0	mov $r0.3 = mthresh
	c0	cmplt $b0.0 = $r0.4, 4
;;
	c0	stw 0[$r0.3] = $r0.2
;;
	c0	br $b0.0, LBB2_3
;;
	c0	mov $r0.3 = $r0.57
	c0	ldw $r0.4 = 24[$r0.1]
	c0	nop
;;
;;
.call qst, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = qst
;;
	c0	ldw $r0.2 = 0[$r0.59]
;;
	c0	ldw $r0.5 = 0[$r0.61]
;;
	c0	add $r0.58 = $r0.57, $r0.2
;;
LBB2_3:
	c0	add $r0.60 = $r0.57, $r0.5
;;
	c0	cmpgeu $b0.0 = $r0.60, $r0.58
	c0	mov $r0.59 = $r0.57
;;
;;
	c0	br $b0.0, LBB2_15
;;
LBB2_4:
	c0	ldw $l0.0 = 0[$r0.62]
	c0	mov $r0.3 = $r0.59
	c0	mov $r0.4 = $r0.60
	c0	nop
;;
;;
.call $l0.0, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = $l0.0
;;
	c0	cmpgt $b0.0 = $r0.3, 0
	c0	ldw $r0.5 = 0[$r0.61]
;;
;;
	c0	slct $r0.59 = $b0.0, $r0.60, $r0.59
	c0	add $r0.60 = $r0.60, $r0.5
;;
	c0	cmpltu $b0.0 = $r0.60, $r0.58
;;
;;
	c0	br $b0.0, LBB2_4
;;
	c0	cmpeq $b0.0 = $r0.59, $r0.57
;;
;;
	c0	br $b0.0, LBB2_15
;;
	c0	cmplt $b0.0 = $r0.5, 1
;;
;;
	c0	br $b0.0, LBB2_15
;;
	c0	add $r0.2 = $r0.57, $r0.5
	c0	add $r0.3 = $r0.57, 1
	c0	xor $r0.4 = $r0.57, -1
;;
	c0	maxu $r0.8 = $r0.2, $r0.3
;;
	c0	add $r0.7 = $r0.8, $r0.4
;;
	c0	cmpeq $b0.0 = $r0.7, -1
	c0	mov $r0.3 = $r0.59
	c0	mov $r0.4 = $r0.57
;;
;;
	c0	br $b0.0, LBB2_17
;;
	c0	sub $r0.5 = $r0.8, $r0.57
;;
	c0	and $r0.6 = $r0.5, -4
	c0	mov $r0.9 = 0
;;
	c0	cmpeq $b0.0 = $r0.6, 0
	c0	mov $r0.3 = $r0.59
	c0	mov $r0.4 = $r0.57
;;
;;
	c0	br $b0.0, LBB2_13
;;
	c0	add $r0.3 = $r0.8, -1
;;
	c0	cmpgtu $b0.0 = $r0.59, $r0.3
;;
;;
	c0	br $b0.0, LBB2_11
;;
	c0	add $r0.3 = $r0.59, $r0.7
;;
	c0	cmpgeu $b0.0 = $r0.3, $r0.57
	c0	mov $r0.3 = $r0.59
	c0	mov $r0.4 = $r0.57
;;
;;
	c0	br $b0.0, LBB2_13
;;
LBB2_11:
	c0	add $r0.4 = $r0.57, $r0.6
	c0	add $r0.3 = $r0.59, $r0.6
	c0	and $r0.7 = $r0.5, -4
	c0	mov $r0.8 = $r0.57
;;
LBB2_12:
	c0	ldbu $r0.9 = 0[$r0.8]
;;
	c0	ldbu $r0.10 = 2[$r0.8]
;;
	c0	ldbu $r0.11 = 1[$r0.8]
	c0	add $r0.7 = $r0.7, -4
	c0	add $r0.12 = $r0.8, 4
	c0	add $r0.13 = $r0.59, 4
;;
	c0	ldbu $r0.14 = 3[$r0.8]
	c0	cmpne $b0.0 = $r0.7, 0
;;
	c0	ldbu $r0.15 = 1[$r0.59]
;;
	c0	ldbu $r0.16 = 0[$r0.59]
;;
	c0	ldbu $r0.17 = 3[$r0.59]
;;
	c0	ldbu $r0.18 = 2[$r0.59]
;;
	c0	stb 3[$r0.59] = $r0.14
;;
	c0	stb 2[$r0.59] = $r0.10
;;
	c0	stb 1[$r0.59] = $r0.11
;;
	c0	stb 0[$r0.59] = $r0.9
;;
	c0	stb 3[$r0.8] = $r0.17
;;
	c0	stb 2[$r0.8] = $r0.18
;;
	c0	stb 1[$r0.8] = $r0.15
;;
	c0	stb 0[$r0.8] = $r0.16
	c0	mov $r0.59 = $r0.13
	c0	mov $r0.8 = $r0.12
	c0	mov $r0.9 = $r0.6
;;
	c0	br $b0.0, LBB2_12
;;
LBB2_13:
	c0	cmpne $b0.0 = $r0.5, $r0.9
;;
;;
	c0	brf $b0.0, LBB2_14
;;
LBB2_17:
	c0	ldb $r0.5 = 0[$r0.4]
	c0	add $r0.6 = $r0.4, 1
;;
	c0	cmpltu $b0.0 = $r0.6, $r0.2
	c0	ldb $r0.7 = 0[$r0.3]
;;
	c0	stb 0[$r0.3] = $r0.5
	c0	add $r0.3 = $r0.3, 1
;;
	c0	stb 0[$r0.4] = $r0.7
	c0	mov $r0.4 = $r0.6
	c0	br $b0.0, LBB2_17
;;
LBB2_14:
	c0	ldw $r0.5 = 0[$r0.61]
;;
LBB2_15:
	c0	cmpge $b0.0 = $r0.5, $r0.63
;;
;;
	c0	br $b0.0, LBB2_26
;;
	c0	add $r0.2 = $r0.57, $r0.5
;;
LBB2_18:
	c0	stw 28[$r0.1] = $r0.57
	c0	mov $r0.60 = $r0.5
	c0	mov $r0.57 = $r0.2
;;
	c0	ldw $l0.0 = 0[$r0.62]
	c0	sub $r0.59 = $r0.57, $r0.60
;;
	c0	mov $r0.3 = $r0.59
	c0	mov $r0.4 = $r0.57
	c0	nop
;;
.call $l0.0, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = $l0.0
;;
	c0	cmplt $b0.0 = $r0.3, 1
	c0	mov $r0.58 = $r0.57
	c0	mov $r0.63 = $r0.60
;;
;;
	c0	br $b0.0, LBB2_20
;;
LBB2_19:
	c0	mov $r0.58 = $r0.59
	c0	ldw $r0.63 = 0[$r0.61]
;;
	c0	ldw $l0.0 = 0[$r0.62]
;;
	c0	sub $r0.59 = $r0.58, $r0.63
;;
.call $l0.0, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	mov $r0.3 = $r0.59
	c0	mov $r0.4 = $r0.57
	c0	call $l0.0 = $l0.0
;;
	c0	cmpgt $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB2_19
;;
LBB2_20:
	c0	ldw $r0.5 = 0[$r0.61]
;;
;;
	c0	sub $r0.2 = $r0.5, $r0.63
;;
	c0	add $r0.2 = $r0.58, $r0.2
;;
	c0	cmpne $b0.0 = $r0.2, $r0.57
;;
;;
	c0	brf $b0.0, LBB2_21
;;
	c0	add $r0.3 = $r0.5, $r0.60
	c0	ldw $r0.4 = 28[$r0.1]
;;
;;
	c0	add $r0.3 = $r0.3, $r0.4
;;
	c0	add $r0.3 = $r0.3, -1
;;
	c0	cmpltu $b0.0 = $r0.3, $r0.57
;;
;;
	c0	br $b0.0, LBB2_21
;;
LBB2_23:
	c0	sub $r0.5 = $r0.3, $r0.5
	c0	ldb $r0.4 = 0[$r0.3]
;;
	c0	cmpltu $b0.0 = $r0.5, $r0.2
	c0	mov $r0.6 = $r0.3
;;
;;
	c0	br $b0.0, LBB2_25
;;
LBB2_24:
	c0	mov $r0.7 = $r0.5
;;
	c0	ldb $r0.5 = 0[$r0.7]
;;
;;
	c0	stb 0[$r0.6] = $r0.5
;;
	c0	ldw $r0.5 = 0[$r0.61]
;;
;;
	c0	sub $r0.5 = $r0.7, $r0.5
;;
	c0	cmpgeu $b0.0 = $r0.5, $r0.2
	c0	mov $r0.6 = $r0.7
;;
;;
	c0	br $b0.0, LBB2_24
;;
LBB2_25:
	c0	stb 0[$r0.6] = $r0.4
;;
	c0	ldw $r0.5 = 0[$r0.61]
	c0	add $r0.3 = $r0.3, -1
;;
	c0	cmpltu $b0.0 = $r0.3, $r0.57
;;
;;
	c0	brf $b0.0, LBB2_23
;;
LBB2_21:
	c0	add $r0.2 = $r0.57, $r0.5
	c0	ldw $r0.3 = 24[$r0.1]
;;
;;
	c0	cmpltu $b0.0 = $r0.2, $r0.3
;;
;;
	c0	br $b0.0, LBB2_18
;;
LBB2_26:
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
.return ret($r0.3:s32)
	c0	ldw $r0.57 = 60[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg()
qst::
	c0	add $r0.1 = $r0.1, -96
;;
	c0	stw 76[$r0.1] = $r0.57
;;
	c0	stw 72[$r0.1] = $r0.58
;;
	c0	stw 68[$r0.1] = $r0.59
;;
	c0	stw 64[$r0.1] = $r0.60
;;
	c0	stw 60[$r0.1] = $r0.61
;;
	c0	stw 56[$r0.1] = $r0.62
;;
	c0	stw 52[$r0.1] = $r0.63
;;
	c0	stw 48[$r0.1] = $l0.0
	c0	sub $r0.57 = $r0.4, $r0.3
	c0	mov $r0.62 = qsz
;;
	c0	mov $r0.63 = 0
	c0	mov $r0.2 = 1
;;
	c0	stw 32[$r0.1] = $r0.2
	c0	mov $r0.2 = mthresh
;;
	c0	stw 28[$r0.1] = $r0.2
	c0	mov $r0.58 = qcmp
;;
	c0	mov $r0.2 = thresh
;;
	c0	stw 40[$r0.1] = $r0.2
;;
LBB3_1:
	c0	mov $r0.9 = $r0.3
	c0	mov $r0.10 = $r0.4
	c0	ldw $r0.2 = 0[$r0.62]
	c0	cmplt $r0.3 = $r0.57, $r0.0
;;
	c0	sub $r0.4 = $r0.0, $r0.57
	c0	mtb $b0.0 = $r0.3
;;
	c0	cmplt $r0.5 = $r0.2, $r0.0
	c0	sub $r0.6 = $r0.0, $r0.2
;;
	c0	slct $r0.4 = $b0.0, $r0.4, $r0.57
	c0	mtb $b0.0 = $r0.5
	c0	mtb $b0.1 = $r0.63
;;
;;
	c0	addcg $r0.7, $b0.1 = $r0.4, $r0.4, $b0.1
	c0	slct $r0.4 = $b0.0, $r0.6, $r0.2
	c0	mtb $b0.0 = $r0.63
;;
;;
	c0	addcg $r0.6, $b0.0 = $r0.7, $r0.7, $b0.0
	c0	divs $r0.7, $b0.1 = $r0.0, $r0.4, $b0.1
;;
	c0	divs $r0.7, $b0.0 = $r0.7, $r0.4, $b0.0
	c0	addcg $r0.8, $b0.1 = $r0.6, $r0.6, $b0.1
;;
	c0	divs $r0.6, $b0.1 = $r0.7, $r0.4, $b0.1
	c0	addcg $r0.7, $b0.0 = $r0.8, $r0.8, $b0.0
;;
	c0	divs $r0.6, $b0.0 = $r0.6, $r0.4, $b0.0
	c0	addcg $r0.8, $b0.1 = $r0.7, $r0.7, $b0.1
;;
	c0	divs $r0.6, $b0.1 = $r0.6, $r0.4, $b0.1
	c0	addcg $r0.7, $b0.0 = $r0.8, $r0.8, $b0.0
;;
	c0	divs $r0.6, $b0.2 = $r0.6, $r0.4, $b0.0
	c0	addcg $r0.8, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	cmpeq $b0.0 = $r0.3, $r0.5
;;
	c0	divs $r0.3, $b0.1 = $r0.6, $r0.4, $b0.1
	c0	addcg $r0.5, $b0.2 = $r0.8, $r0.8, $b0.2
;;
	c0	divs $r0.3, $b0.2 = $r0.3, $r0.4, $b0.2
	c0	addcg $r0.6, $b0.1 = $r0.5, $r0.5, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.4, $b0.1
	c0	addcg $r0.5, $b0.2 = $r0.6, $r0.6, $b0.2
;;
	c0	divs $r0.3, $b0.2 = $r0.3, $r0.4, $b0.2
	c0	addcg $r0.6, $b0.1 = $r0.5, $r0.5, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.4, $b0.1
	c0	addcg $r0.5, $b0.2 = $r0.6, $r0.6, $b0.2
;;
	c0	divs $r0.3, $b0.2 = $r0.3, $r0.4, $b0.2
	c0	addcg $r0.6, $b0.1 = $r0.5, $r0.5, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.4, $b0.1
	c0	addcg $r0.5, $b0.2 = $r0.6, $r0.6, $b0.2
;;
	c0	divs $r0.3, $b0.2 = $r0.3, $r0.4, $b0.2
	c0	addcg $r0.6, $b0.1 = $r0.5, $r0.5, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.4, $b0.1
	c0	addcg $r0.5, $b0.2 = $r0.6, $r0.6, $b0.2
;;
	c0	divs $r0.3, $b0.2 = $r0.3, $r0.4, $b0.2
	c0	addcg $r0.6, $b0.1 = $r0.5, $r0.5, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.4, $b0.1
	c0	addcg $r0.5, $b0.2 = $r0.6, $r0.6, $b0.2
;;
	c0	divs $r0.3, $b0.2 = $r0.3, $r0.4, $b0.2
	c0	addcg $r0.6, $b0.1 = $r0.5, $r0.5, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.4, $b0.1
	c0	addcg $r0.5, $b0.2 = $r0.6, $r0.6, $b0.2
;;
	c0	divs $r0.3, $b0.2 = $r0.3, $r0.4, $b0.2
	c0	addcg $r0.6, $b0.1 = $r0.5, $r0.5, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.4, $b0.1
	c0	addcg $r0.5, $b0.2 = $r0.6, $r0.6, $b0.2
;;
	c0	divs $r0.3, $b0.2 = $r0.3, $r0.4, $b0.2
	c0	addcg $r0.6, $b0.1 = $r0.5, $r0.5, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.4, $b0.1
	c0	addcg $r0.5, $b0.2 = $r0.6, $r0.6, $b0.2
;;
	c0	divs $r0.3, $b0.2 = $r0.3, $r0.4, $b0.2
	c0	addcg $r0.6, $b0.1 = $r0.5, $r0.5, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.4, $b0.1
	c0	addcg $r0.5, $b0.2 = $r0.6, $r0.6, $b0.2
;;
	c0	divs $r0.3, $b0.2 = $r0.3, $r0.4, $b0.2
	c0	addcg $r0.6, $b0.1 = $r0.5, $r0.5, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.4, $b0.1
	c0	addcg $r0.5, $b0.2 = $r0.6, $r0.6, $b0.2
;;
	c0	divs $r0.3, $b0.2 = $r0.3, $r0.4, $b0.2
	c0	addcg $r0.6, $b0.1 = $r0.5, $r0.5, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.4, $b0.1
	c0	addcg $r0.5, $b0.2 = $r0.6, $r0.6, $b0.2
;;
	c0	divs $r0.3, $b0.2 = $r0.3, $r0.4, $b0.2
	c0	addcg $r0.6, $b0.1 = $r0.5, $r0.5, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.4, $b0.1
	c0	addcg $r0.5, $b0.2 = $r0.6, $r0.6, $b0.2
;;
	c0	divs $r0.3, $b0.2 = $r0.3, $r0.4, $b0.2
	c0	addcg $r0.4, $b0.1 = $r0.5, $r0.5, $b0.1
;;
	c0	addcg $r0.5, $b0.1 = $r0.4, $r0.4, $b0.2
	c0	cmpge $r0.3 = $r0.3, $r0.0
	c0	ldw $r0.4 = 28[$r0.1]
;;
;;
	c0	ldw $r0.4 = 0[$r0.4]
	c0	orc $r0.5 = $r0.5, $r0.0
;;
;;
	c0	cmplt $b0.1 = $r0.57, $r0.4
	c0	sh1add $r0.3 = $r0.5, $r0.3
;;
	c0	sub $r0.4 = $r0.0, $r0.3
;;
	c0	slct $r0.3 = $b0.0, $r0.3, $r0.4
	c0	ldw $r0.4 = 32[$r0.1]
;;
;;
	c0	shr $r0.3 = $r0.3, $r0.4
;;
	c0	mpyhs $r0.4 = $r0.3, $r0.2
	c0	mpylu $r0.2 = $r0.3, $r0.2
;;
;;
	c0	add $r0.2 = $r0.2, $r0.4
;;
	c0	add $r0.59 = $r0.9, $r0.2
	c0	br $b0.1, LBB3_13
;;
	c0	stw 24[$r0.1] = $r0.2
;;
	c0	ldw $l0.0 = 0[$r0.58]
	c0	mov $r0.3 = $r0.9
	c0	mov $r0.4 = $r0.59
	c0	mov $r0.57 = $r0.9
;;
	c0	mov $r0.61 = $r0.10
;;
.call $l0.0, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	stw 44[$r0.1] = $r0.61
	c0	call $l0.0 = $l0.0
;;
	c0	cmpgt $b0.0 = $r0.3, 0
	c0	ldw $l0.0 = 0[$r0.58]
;;
;;
	c0	slct $r0.60 = $b0.0, $r0.57, $r0.59
	c0	ldw $r0.2 = 0[$r0.62]
;;
;;
	c0	sub $r0.61 = $r0.61, $r0.2
	c0	mov $r0.3 = $r0.60
;;
.call $l0.0, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	mov $r0.4 = $r0.61
	c0	call $l0.0 = $l0.0
;;
	c0	cmplt $b0.0 = $r0.3, 1
;;
;;
	c0	br $b0.0, LBB3_4
;;
	c0	cmpeq $b0.0 = $r0.60, $r0.57
	c0	ldw $l0.0 = 0[$r0.58]
;;
;;
	c0	slct $r0.60 = $b0.0, $r0.59, $r0.57
;;
.call $l0.0, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	mov $r0.3 = $r0.60
	c0	mov $r0.4 = $r0.61
	c0	call $l0.0 = $l0.0
;;
	c0	cmplt $b0.0 = $r0.3, 0
;;
;;
	c0	slct $r0.60 = $b0.0, $r0.61, $r0.60
;;
LBB3_4:
	c0	cmpeq $b0.0 = $r0.60, $r0.59
	c0	mov $r0.9 = $r0.57
	c0	ldw $r0.10 = 44[$r0.1]
;;
	c0	ldw $r0.8 = 24[$r0.1]
;;
	c0	br $b0.0, LBB3_13
;;
	c0	ldw $r0.3 = 0[$r0.62]
;;
;;
	c0	cmpeq $b0.0 = $r0.3, 0
	c0	mov $r0.2 = $r0.59
	c0	mov $r0.4 = $r0.60
	c0	mov $r0.5 = $r0.3
;;
;;
	c0	br $b0.0, LBB3_12
;;
	c0	mov $r0.20 = $r0.10
	c0	mov $r0.19 = $r0.9
	c0	and $r0.6 = $r0.3, -4
	c0	mov $r0.9 = 0
;;
	c0	cmpeq $b0.0 = $r0.6, 0
	c0	mov $r0.2 = $r0.59
	c0	mov $r0.4 = $r0.60
	c0	mov $r0.5 = $r0.3
;;
;;
	c0	br $b0.0, LBB3_11
;;
	c0	add $r0.2 = $r0.3, $r0.60
	c0	add $r0.7 = $r0.19, $r0.8
;;
	c0	add $r0.2 = $r0.2, -1
;;
	c0	cmpgtu $b0.0 = $r0.7, $r0.2
;;
;;
	c0	br $b0.0, LBB3_9
;;
	c0	add $r0.2 = $r0.3, $r0.8
;;
	c0	add $r0.2 = $r0.2, $r0.19
;;
	c0	add $r0.2 = $r0.2, -1
;;
	c0	cmpleu $b0.0 = $r0.60, $r0.2
	c0	mov $r0.2 = $r0.59
	c0	mov $r0.4 = $r0.60
	c0	mov $r0.5 = $r0.3
;;
;;
	c0	br $b0.0, LBB3_11
;;
LBB3_9:
	c0	sub $r0.5 = $r0.3, $r0.6
	c0	add $r0.4 = $r0.60, $r0.6
	c0	add $r0.2 = $r0.8, $r0.6
;;
	c0	add $r0.2 = $r0.19, $r0.2
	c0	and $r0.8 = $r0.3, -4
;;
LBB3_10:
	c0	ldbu $r0.9 = 0[$r0.60]
;;
	c0	ldbu $r0.10 = 2[$r0.60]
;;
	c0	ldbu $r0.11 = 1[$r0.60]
	c0	add $r0.8 = $r0.8, -4
	c0	add $r0.12 = $r0.60, 4
	c0	add $r0.13 = $r0.7, 4
;;
	c0	ldbu $r0.14 = 3[$r0.60]
	c0	cmpne $b0.0 = $r0.8, 0
;;
	c0	ldbu $r0.15 = 1[$r0.7]
;;
	c0	ldbu $r0.16 = 0[$r0.7]
;;
	c0	ldbu $r0.17 = 3[$r0.7]
;;
	c0	ldbu $r0.18 = 2[$r0.7]
;;
	c0	stb 3[$r0.7] = $r0.14
;;
	c0	stb 2[$r0.7] = $r0.10
;;
	c0	stb 1[$r0.7] = $r0.11
;;
	c0	stb 0[$r0.7] = $r0.9
;;
	c0	stb 3[$r0.60] = $r0.17
;;
	c0	stb 2[$r0.60] = $r0.18
;;
	c0	stb 1[$r0.60] = $r0.15
;;
	c0	stb 0[$r0.60] = $r0.16
	c0	mov $r0.7 = $r0.13
	c0	mov $r0.60 = $r0.12
	c0	mov $r0.9 = $r0.6
;;
	c0	br $b0.0, LBB3_10
;;
LBB3_11:
	c0	cmpeq $b0.0 = $r0.3, $r0.9
	c0	mov $r0.9 = $r0.19
	c0	mov $r0.10 = $r0.20
;;
;;
	c0	br $b0.0, LBB3_13
;;
LBB3_12:
	c0	ldb $r0.3 = 0[$r0.4]
;;
	c0	ldb $r0.6 = 0[$r0.2]
	c0	add $r0.5 = $r0.5, -1
;;
	c0	stb 0[$r0.2] = $r0.3
	c0	add $r0.3 = $r0.4, 1
	c0	cmpne $b0.0 = $r0.5, 0
	c0	add $r0.2 = $r0.2, 1
;;
	c0	stb 0[$r0.4] = $r0.6
	c0	mov $r0.4 = $r0.3
;;
	c0	br $b0.0, LBB3_12
;;
LBB3_13:
	c0	stw 44[$r0.1] = $r0.10
;;
	c0	stw 36[$r0.1] = $r0.9
;;
	c0	ldw $r0.2 = 0[$r0.62]
;;
;;
	c0	sub $r0.60 = $r0.10, $r0.2
	c0	mov $r0.61 = $r0.9
;;
LBB3_14:
	c0	cmpgeu $b0.0 = $r0.61, $r0.59
;;
;;
	c0	br $b0.0, LBB3_16
;;
LBB3_15:
	c0	ldw $l0.0 = 0[$r0.58]
	c0	mov $r0.3 = $r0.61
	c0	mov $r0.4 = $r0.59
	c0	nop
;;
;;
.call $l0.0, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = $l0.0
;;
	c0	cmplt $b0.0 = $r0.3, 1
;;
;;
	c0	brf $b0.0, LBB3_16
;;
	c0	ldw $r0.2 = 0[$r0.62]
;;
;;
	c0	add $r0.61 = $r0.61, $r0.2
;;
	c0	cmpltu $b0.0 = $r0.61, $r0.59
;;
;;
	c0	br $b0.0, LBB3_15
;;
LBB3_16:
	c0	mov $r0.57 = $r0.61
	c0	cmpgtu $b0.0 = $r0.60, $r0.59
;;
;;
	c0	brf $b0.0, LBB3_17
;;
LBB3_19:
	c0	ldw $l0.0 = 0[$r0.58]
	c0	mov $r0.3 = $r0.59
	c0	mov $r0.4 = $r0.60
	c0	nop
;;
;;
.call $l0.0, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = $l0.0
;;
	c0	cmpgt $b0.0 = $r0.3, 0
	c0	ldw $r0.2 = 0[$r0.62]
;;
;;
	c0	br $b0.0, LBB3_21
;;
	c0	sub $r0.60 = $r0.60, $r0.2
;;
	c0	cmpgtu $b0.0 = $r0.60, $r0.59
;;
;;
	c0	br $b0.0, LBB3_19
;;
	c0	goto LBB3_23
;;
LBB3_17:
	c0	ldw $r0.2 = 0[$r0.62]
;;
LBB3_23:
	c0	cmpeq $b0.0 = $r0.57, $r0.59
;;
;;
	c0	br $b0.0, LBB3_33
;;
	c0	sub $r0.4 = $r0.60, $r0.2
	c0	mov $r0.3 = $r0.59
	c0	mov $r0.60 = $r0.57
	c0	mov $r0.61 = $r0.57
;;
LBB3_25:
	c0	mov $r0.59 = $r0.60
	c0	mov $r0.60 = $r0.4
	c0	cmpeq $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB3_32
;;
	c0	and $r0.4 = $r0.2, -4
;;
	c0	cmpeq $b0.0 = $r0.4, 0
	c0	mov $r0.6 = $r0.57
	c0	mov $r0.5 = $r0.3
	c0	mov $r0.7 = $r0.2
;;
	c0	mov $r0.9 = $r0.63
;;
	c0	br $b0.0, LBB3_31
;;
	c0	add $r0.5 = $r0.2, -1
;;
	c0	add $r0.6 = $r0.3, $r0.5
;;
	c0	cmpgtu $b0.0 = $r0.57, $r0.6
;;
;;
	c0	br $b0.0, LBB3_29
;;
	c0	add $r0.5 = $r0.57, $r0.5
;;
	c0	cmpleu $b0.0 = $r0.3, $r0.5
	c0	mov $r0.6 = $r0.57
	c0	mov $r0.5 = $r0.3
	c0	mov $r0.7 = $r0.2
;;
	c0	mov $r0.9 = $r0.63
;;
	c0	br $b0.0, LBB3_31
;;
LBB3_29:
	c0	add $r0.5 = $r0.3, $r0.4
	c0	sub $r0.7 = $r0.2, $r0.4
	c0	add $r0.6 = $r0.57, $r0.4
	c0	and $r0.8 = $r0.2, -4
;;
LBB3_30:
	c0	ldbu $r0.9 = 0[$r0.3]
;;
	c0	ldbu $r0.10 = 2[$r0.3]
;;
	c0	ldbu $r0.11 = 1[$r0.3]
	c0	add $r0.8 = $r0.8, -4
	c0	add $r0.12 = $r0.3, 4
	c0	add $r0.13 = $r0.57, 4
;;
	c0	ldbu $r0.14 = 3[$r0.3]
	c0	cmpne $b0.0 = $r0.8, 0
;;
	c0	ldbu $r0.15 = 1[$r0.57]
;;
	c0	ldbu $r0.16 = 0[$r0.57]
;;
	c0	ldbu $r0.17 = 3[$r0.57]
;;
	c0	ldbu $r0.18 = 2[$r0.57]
;;
	c0	stb 3[$r0.57] = $r0.14
;;
	c0	stb 2[$r0.57] = $r0.10
;;
	c0	stb 1[$r0.57] = $r0.11
;;
	c0	stb 0[$r0.57] = $r0.9
;;
	c0	stb 3[$r0.3] = $r0.17
;;
	c0	stb 2[$r0.3] = $r0.18
;;
	c0	stb 1[$r0.3] = $r0.15
;;
	c0	stb 0[$r0.3] = $r0.16
	c0	mov $r0.57 = $r0.13
	c0	mov $r0.3 = $r0.12
	c0	mov $r0.9 = $r0.4
;;
	c0	br $b0.0, LBB3_30
;;
LBB3_31:
	c0	cmpeq $b0.0 = $r0.2, $r0.9
	c0	mov $r0.57 = $r0.6
	c0	mov $r0.3 = $r0.5
	c0	mov $r0.2 = $r0.7
;;
;;
	c0	br $b0.0, LBB3_14
;;
LBB3_32:
	c0	ldb $r0.4 = 0[$r0.3]
;;
	c0	ldb $r0.5 = 0[$r0.57]
	c0	add $r0.2 = $r0.2, -1
;;
	c0	stb 0[$r0.57] = $r0.4
	c0	add $r0.4 = $r0.3, 1
	c0	cmpeq $b0.0 = $r0.2, 0
	c0	add $r0.57 = $r0.57, 1
;;
	c0	stb 0[$r0.3] = $r0.5
	c0	mov $r0.3 = $r0.4
;;
	c0	br $b0.0, LBB3_14
;;
	c0	goto LBB3_32
;;
LBB3_21:
	c0	add $r0.61 = $r0.57, $r0.2
	c0	cmpeq $b0.0 = $r0.57, $r0.59
	c0	mov $r0.4 = $r0.60
	c0	mov $r0.3 = $r0.60
;;
;;
	c0	br $b0.0, LBB3_25
;;
	c0	sub $r0.4 = $r0.60, $r0.2
	c0	mov $r0.3 = $r0.60
	c0	mov $r0.60 = $r0.59
	c0	goto LBB3_25
;;
LBB3_33:
	c0	add $r0.60 = $r0.59, $r0.2
	c0	ldw $r0.5 = 36[$r0.1]
;;
;;
	c0	sub $r0.61 = $r0.59, $r0.5
	c0	ldw $r0.6 = 44[$r0.1]
;;
;;
	c0	sub $r0.57 = $r0.6, $r0.60
	c0	ldw $r0.2 = 40[$r0.1]
;;
;;
	c0	ldw $r0.2 = 0[$r0.2]
	c0	cmpgt $b0.0 = $r0.61, $r0.57
;;
;;
	c0	brf $b0.0, LBB3_34
;;
	c0	cmplt $b0.0 = $r0.57, $r0.2
	c0	mov $r0.4 = $r0.59
	c0	mov $r0.57 = $r0.61
	c0	mov $r0.3 = $r0.5
;;
;;
	c0	br $b0.0, LBB3_38
;;
	c0	goto LBB3_37
;;
LBB3_34:
	c0	cmplt $b0.0 = $r0.61, $r0.2
	c0	mov $r0.4 = $r0.6
	c0	mov $r0.3 = $r0.60
;;
;;
	c0	br $b0.0, LBB3_38
;;
.call qst, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	mov $r0.3 = $r0.5
	c0	mov $r0.4 = $r0.59
	c0	mov $r0.59 = $r0.6
	c0	call $l0.0 = qst
;;
	c0	mov $r0.4 = $r0.59
	c0	mov $r0.3 = $r0.60
	c0	goto LBB3_38
;;
LBB3_37:
.call qst, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	mov $r0.3 = $r0.60
	c0	mov $r0.4 = $r0.6
	c0	mov $r0.60 = $r0.5
	c0	call $l0.0 = qst
;;
	c0	mov $r0.4 = $r0.59
	c0	mov $r0.57 = $r0.61
	c0	mov $r0.3 = $r0.60
;;
LBB3_38:
	c0	ldw $r0.2 = 40[$r0.1]
;;
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
;;
	c0	cmpge $b0.0 = $r0.57, $r0.2
;;
;;
	c0	br $b0.0, LBB3_1
;;
	c0	ldw $l0.0 = 48[$r0.1]
;;
	c0	ldw $r0.63 = 52[$r0.1]
;;
	c0	ldw $r0.62 = 56[$r0.1]
;;
	c0	ldw $r0.61 = 60[$r0.1]
;;
	c0	ldw $r0.60 = 64[$r0.1]
;;
	c0	ldw $r0.59 = 68[$r0.1]
;;
	c0	ldw $r0.58 = 72[$r0.1]
;;
.return ret($r0.3:s32)
	c0	ldw $r0.57 = 76[$r0.1]
	c0	return $r0.1 = $r0.1, 96, $l0.0
;;
.endp

.section .data

gQSortNum:
	.data1 57
	.data1 126
	.data1 223
	.data1 44
	.data1 11
	.data1 138
	.data1 251
	.data1 232
	.data1 143
	.data1 86
	.data1 215
	.data1 60
	.data1 83
	.data1 30
	.data1 115
	.data1 48
	.data1 87
	.data1 46
	.data1 49
	.data1 164
	.data1 101
	.data1 198
	.data1 235
	.data1 72
	.data1 31
	.data1 6
	.data1 57
	.data1 12
	.data1 227
	.data1 110
	.data1 157
	.data1 96
	.data1 25
	.data1 34
	.data1 191
	.data1 140
	.data1 43
	.data1 22
	.data1 37
	.data1 136
	.data1 175
	.data1 182
	.data1 183
	.data1 220
	.data1 115
	.data1 66
	.data1 173
	.data1 144
	.data1 137
	.data1 114
	.data1 81
	.data1 68
	.data1 69
	.data1 102
	.data1 203
	.data1 168
	.data1 193
	.data1 102
	.data1 167
	.data1 172
	.data1 3
	.data1 14
	.data1 67
	.data1 64
	.data1 249
	.data1 62
	.data1 159
	.data1 20
	.data1 75
	.data1 74
	.data1 187
	.data1 216
	.data1 207
	.data1 22
	.data1 151
	.data1 124
	.data1 109
	.data1 162
	.data1 51
	.data1 16
	.data1 151
	.data1 18
	.data1 143
	.data1 28
	.data1 37
	.data1 250
	.data1 171
	.data1 8
	.data1 95
	.data1 58
	.data1 135
	.data1 76
	.data1 221
	.data1 82
	.data1 221
	.data1 224
	.data1 217
	.data1 158
	.data1 127
	.data1 76
	.data1 107
	.data1 170
	.data1 155
	.data1 200
	.data1 239
	.data1 138
	.data1 119
	.data1 228
	.data1 77
	.data1 2
	.data1 237
	.data1 176
	.data1 183
	.data1 178
	.data1 111
	.data1 132
	.data1 5
	.data1 166
	.data1 139
	.data1 104
	.data1 129
	.data1 218
	.data1 103
	.data1 20
	.data1 189
	.data1 78
	.data1 3
	.data1 128
	.data1 185
	.data1 2
	.data1 95
	.data1 172
	.data1 139
	.data1 10
	.data1 123
	.data1 104
	.data1 241
	.data1 214
	.data1 169
	.data1 188
	.data1 211
	.data1 98
	.data1 13
	.data1 80
	.data1 41
	.data1 82
	.data1 177
	.data1 220
	.data1 229
	.data1 186
	.data1 149
	.data1 200
	.data1 159
	.data1 134
	.data1 71
	.data1 116
	.data1 99
	.data1 18
	.data1 29
	.data1 224
	.data1 103
	.data1 162
	.data1 193
	.data1 12
	.data1 171
	.data1 150
	.data1 165
	.data1 248
	.data1 209
	.data1 202
	.data1 201
	.data1 92
	.data1 13
	.data1 62
	.data1 211
	.data1 16
	.data1 247
	.data1 14
	.data1 209
	.data1 60
	.data1 59
	.data1 26
	.data1 181
	.data1 40
	.data1 191
	.data1 230
	.data1 39
	.data1 44
	.data1 125
	.data1 114
	.data1 195
	.data1 64
	.data1 135
	.data1 190
	.data1 225
	.data1 148
	.data1 53
	.data1 202
	.data1 197
	.data1 168
	.data1 79
	.data1 106
	.data1 23
	.data1 4
	.data1 19
	.data1 34
	.data1 77
	.data1 144
	.data1 23
	.data1 146
	.data1 241
	.data1 156
	.data1 91
	.data1 122
	.data1 43
	.data1 136
	.data1 223
	.data1 70
	.data1 249
	.data1 52
	.data1 163
	.data1 46
	.data1 93
	.data1 96
	.data1 89
	.data1 30
	.data1 255
	.data1 52
	.data1 21
	.data1 214
	.data1 229
	.data1 72
	.data1 111
	.data1 10
	.data1 9
	.data1 156
	.data1 205
	.data1 126
	.data1 147
	.data1 48
	.data1 55
	.data1 50
	.data1 239
	.data1 252
	.data1 133
	.data1 38
	.data1 11
	.data1 232
	.data1 1
	.data1 166
	.data1 25
	.data1 108
	.data1 61
	.data1 206
	.data1 125
	.data1 0
	.data1 199
	.data1 126
	.data1 223
	.data1 44
	.data1 11
	.data1 118
	.data1 251
	.data1 24
	.data1 113
	.data1 170
	.data1 215
	.data1 60
	.data1 83
	.data1 30
	.data1 115
	.data1 48
	.data1 169
	.data1 210
	.data1 49
	.data1 92
	.data1 101
	.data1 58
	.data1 21
	.data1 184
	.data1 225
	.data1 6
	.data1 199
	.data1 244
	.data1 227
	.data1 146
	.data1 99
	.data1 96
	.data1 25
	.data1 222
	.data1 65
	.data1 140
	.data1 213
	.data1 22
	.data1 219
	.data1 136
	.data1 175
	.data1 182
	.data1 73
	.data1 36
	.data1 141
	.data1 190
	.data1 83
	.data1 112
	.data1 137
	.data1 114
	.data1 175
	.data1 188
	.data1 187
	.data1 102
	.data1 53
	.data1 168
	.data1 193
	.data1 154
	.data1 167
	.data1 172
	.data1 3
	.data1 242
	.data1 67
	.data1 64
	.data1 7
	.data1 62
	.data1 159
	.data1 236
	.data1 75
	.data1 182
	.data1 187
	.data1 40
	.data1 49
	.data1 234
	.data1 105
	.data1 124
	.data1 109
	.data1 162
	.data1 205
	.data1 16
	.data1 105
	.data1 238
	.data1 143
	.data1 28
	.data1 37
	.data1 6
	.data1 85
	.data1 248
	.data1 161
	.data1 58
	.data1 121
	.data1 180
	.data1 221
	.data1 174
	.data1 221
	.data1 32
	.data1 217
	.data1 98
	.data1 129
	.data1 76
	.data1 149
	.data1 170
	.data1 101
	.data1 200
	.data1 239
	.data1 118
	.data1 137
	.data1 28
	.data1 179
	.data1 254
	.data1 19
	.data1 80
	.data1 183
	.data1 178
	.data1 145
	.data1 124
	.data1 251
	.data1 166
	.data1 139
	.data1 152
	.data1 129
	.data1 38
	.data1 153
	.data1 20
	.data1 189
	.data1 78
	.data1 3
	.data1 128
	.data1 71
	.data1 254
	.data1 95
	.data1 84
	.data1 139
	.data1 10
	.data1 123
	.data1 152
	.data1 241
	.data1 214
	.data1 169
	.data1 68
	.data1 211
	.data1 98
	.data1 13
	.data1 80
	.data1 215
	.data1 82
	.data1 79
	.data1 36
	.data1 229
	.data1 70
	.data1 149
	.data1 56
	.data1 159
	.data1 134
	.data1 185
	.data1 140
	.data1 99
	.data1 18
	.data1 29
	.data1 224
	.data1 153
	.data1 94
	.data1 63
	.data1 244
	.data1 85
	.data1 150
	.data1 91
	.data1 248
	.data1 209
	.data1 202
	.data1 55
	.data1 92
	.data1 243
	.data1 194
	.data1 211
	.data1 240
	.data1 247
	.data1 242
	.data1 209
	.data1 196
	.data1 197
	.data1 26
	.data1 75
	.data1 40
	.data1 191
	.data1 26
	.data1 39
	.data1 44
	.data1 131
	.data1 142
	.data1 195
	.data1 64
	.data1 121
	.data1 190
	.data1 225
	.data1 148
	.data1 53
	.data1 54
	.data1 197
	.data1 88
	.data1 79
	.data1 106
	.data1 233
	.data1 252
	.data1 19
	.data1 34
	.data1 77
	.data1 144
	.data1 233
	.data1 146
	.data1 241
	.data1 100
	.data1 91
	.data1 134
	.data1 43
	.data1 136
	.data1 33
	.data1 70
	.data1 249
	.data1 204
	.data1 163
	.data1 210
	.data1 163
	.data1 96
	.data1 89
	.data1 226
	.data1 1
	.data1 52
	.data1 235
	.data1 214
	.data1 27
	.data1 72
	.data1 111
	.data1 246
	.data1 247
	.data1 156
	.data1 51
	.data1 130
	.data1 109
	.data1 208
	.data1 55
	.data1 50
	.data1 17
	.data1 252
	.data1 123
	.data1 218
	.data1 245
	.data1 232
	.data1 255
	.data1 90
	.data1 231
	.data1 108
	.data1 195
	.data1 50
	.data1 125
	.data1 0
	.data1 199
	.data1 130
	.data1 223
	.data1 212
	.data1 11
	.data1 138
	.data1 251
	.data1 232
	.data1 143
	.data1 86
	.data1 215
	.data1 196
	.data1 83
	.data1 30
	.data1 141
	.data1 48
	.data1 87
	.data1 46
	.data1 207
	.data1 92
	.data1 155
	.data1 58
	.data1 235
	.data1 184
	.data1 31
	.data1 6
	.data1 199
	.data1 12
	.data1 29
	.data1 146
	.data1 157
	.data1 160
	.data1 231
	.data1 34
	.data1 191
	.data1 116
	.data1 213
	.data1 22
	.data1 37
	.data1 136
	.data1 175
	.data1 74
	.data1 183
	.data1 36
	.data1 115
	.data1 66
	.data1 173
	.data1 144
	.data1 137
	.data1 142
	.data1 175
	.data1 188
	.data1 69
	.data1 102
	.data1 53
	.data1 168
	.data1 193
	.data1 102
	.data1 89
	.data1 172
	.data1 253
	.data1 242
	.data1 67
	.data1 192
	.data1 7
	.data1 62
	.data1 159
	.data1 20
	.data1 181
	.data1 182
	.data1 187
	.data1 216
	.data1 207
	.data1 22
	.data1 105
	.data1 132
	.data1 109
	.data1 162
	.data1 205
	.data1 16
	.data1 151
	.data1 18
	.data1 113
	.data1 228
	.data1 37
	.data1 6
	.data1 85
	.data1 8
	.data1 161
	.data1 58
	.data1 135
	.data1 76
	.data1 35
	.data1 174
	.data1 35
	.data1 224
	.data1 39
	.data1 158
	.data1 127
	.data1 180
	.data1 149
	.data1 86
	.data1 155
	.data1 200
	.data1 239
	.data1 118
	.data1 119
	.data1 28
	.data1 77
	.data1 254
	.data1 19
	.data1 176
	.data1 183
	.data1 78
	.data1 145
	.data1 132
	.data1 5
	.data1 90
	.data1 117
	.data1 152
	.data1 127
	.data1 218
	.data1 153
	.data1 20
	.data1 67
	.data1 178
	.data1 3
	.data1 128
	.data1 185
	.data1 254
	.data1 95
	.data1 172
	.data1 139
	.data1 246
	.data1 123
	.data1 104
	.data1 15
	.data1 42
	.data1 169
	.data1 68
	.data1 211
	.data1 98
	.data1 243
	.data1 80
	.data1 41
	.data1 174
	.data1 79
	.data1 36
	.data1 27
	.data1 186
	.data1 107
	.data1 56
	.data1 97
	.data1 134
	.data1 71
	.data1 116
	.data1 157
	.data1 238
	.data1 227
	.data1 32
	.data1 153
	.data1 162
	.data1 193
	.data1 244
	.data1 171
	.data1 150
	.data1 165
	.data1 248
	.data1 209
	.data1 54
	.data1 55
	.data1 164
	.data1 13
	.data1 194
	.data1 45
	.data1 16
	.data1 247
	.data1 242
	.data1 47
	.data1 60
	.data1 59
	.data1 26
	.data1 75
	.data1 40
	.data1 65
	.data1 230
	.data1 217
	.data1 44
	.data1 131
	.data1 142
	.data1 195
	.data1 192
	.data1 121
	.data1 190
	.data1 225
	.data1 108
	.data1 203
	.data1 202
	.data1 197
	.data1 168
	.data1 177
	.data1 150
	.data1 233
	.data1 252
	.data1 19
	.data1 34
	.data1 77
	.data1 144
	.data1 23
	.data1 110
	.data1 15
	.data1 100
	.data1 91
	.data1 122
	.data1 213
	.data1 120
	.data1 223
	.data1 70
	.data1 7
	.data1 52
	.data1 93
	.data1 46
	.data1 93
	.data1 160
	.data1 167
	.data1 226
	.data1 255
	.data1 204
	.data1 21
	.data1 42
	.data1 229
	.data1 72
	.data1 111
	.data1 246
	.data1 9
	.data1 100
	.data1 205
	.data1 126
	.data1 147
	.data1 48
	.data1 55
	.data1 206
	.data1 239
	.data1 4
	.data1 133
	.data1 218
	.data1 245
	.data1 232
	.data1 255
	.data1 166
	.data1 231
	.data1 108
	.data1 195
	.data1 50
	.data1 131
	.data1 0
	.data1 57
	.data1 130
	.data1 223
	.data1 44
	.data1 245
	.data1 118
	.data1 251
	.data1 232
	.data1 113
	.data1 86
	.data1 215
	.data1 196
	.data1 83
	.data1 30
	.data1 141
	.data1 48
	.data1 87
	.data1 46
	.data1 207
	.data1 92
	.data1 155
	.data1 198
	.data1 235
	.data1 72
	.data1 31
	.data1 250
	.data1 57
	.data1 244
	.data1 29
	.data1 110
	.data1 99
	.data1 160
	.data1 231
	.data1 34
	.data1 65
	.data1 116
	.data1 43
	.data1 22
	.data1 219
	.data1 136
	.data1 175
	.data1 74
	.data1 73
	.data1 220
	.data1 141
	.data1 190
	.data1 83
	.data1 112
	.data1 137
	.data1 142
	.data1 81
	.data1 68
	.data1 69
	.data1 154
	.data1 203
	.data1 88
	.data1 63
	.data1 154
	.data1 89
	.data1 172
	.data1 3
	.data1 242
	.data1 67
	.data1 192
	.data1 249
	.data1 62
	.data1 159
	.data1 20
	.data1 181
	.data1 74
	.data1 69
	.data1 216
	.data1 49
	.data1 22
	.data1 105
	.data1 132
	.data1 109
	.data1 162
	.data1 205
	.data1 16
	.data1 151
	.data1 18
	.data1 113
	.data1 228
	.data1 219
	.data1 250
	.data1 171
	.data1 8
	.data1 95
	.data1 58
	.data1 135
	.data1 180
	.data1 35
	.data1 82
	.data1 221
	.data1 224
	.data1 39
	.data1 98
	.data1 129
	.data1 180
	.data1 107
	.data1 86
	.data1 101
	.data1 200
	.data1 239
	.data1 118
	.data1 119
	.data1 228
	.data1 179
	.data1 2
	.data1 237
	.data1 80
	.data1 183
	.data1 78
	.data1 111
	.data1 124
	.data1 5
	.data1 90
	.data1 117
	.data1 104
	.data1 127
	.data1 38
	.data1 153
	.data1 20
	.data1 67
	.data1 178
	.data1 253
	.data1 128
	.data1 185
	.data1 254
	.data1 95
	.data1 172
	.data1 117
	.data1 10
	.data1 123
	.data1 152
	.data1 241
	.data1 42
	.data1 87
	.data1 188
	.data1 211
	.data1 98
	.data1 243
	.data1 80
	.data1 215
	.data1 82
	.data1 79
	.data1 36
	.data1 27
	.data1 186
	.data1 107
	.data1 200
	.data1 159
	.data1 122
	.data1 71
	.data1 140
	.data1 157
	.data1 238
	.data1 29
	.data1 224
	.data1 153
	.data1 94
	.data1 63
	.data1 244
	.data1 85
	.data1 106
	.data1 91
	.data1 248
	.data1 47
	.data1 54
	.data1 201
	.data1 164
	.data1 243
	.data1 62
	.data1 211
	.data1 240
	.data1 247
	.data1 242
	.data1 47
	.data1 196
	.data1 197
	.data1 230
	.data1 181
	.data1 216
	.data1 65
	.data1 26
	.data1 217
	.data1 44
	.data1 125
	.data1 114
	.data1 195
	.data1 192
	.data1 135
	.data1 190
	.data1 31
	.data1 148
	.data1 203
	.data1 202
	.data1 59
	.data1 88
	.data1 79
	.data1 150
	.data1 233
	.data1 252
	.data1 19
	.data1 34
	.data1 77
	.data1 144
	.data1 233
	.data1 146
	.data1 15
	.data1 100
	.data1 165
	.data1 122
	.data1 213
	.data1 136
	.data1 223
	.data1 70
	.data1 249
	.data1 204
	.data1 93
	.data1 46
	.data1 93
	.data1 96
	.data1 167
	.data1 30
	.data1 1
	.data1 204
	.data1 21
	.data1 42
	.data1 27
	.data1 72

	.local	qsz
	.comm	qsz,4,4
	.local	qcmp
	.comm	qcmp,4,4
	.local	thresh
	.comm	thresh,4,4
	.local	mthresh
	.comm	mthresh,4,4

