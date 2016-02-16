.section .text

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg()
main::
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
	c0	mov $r0.58 = 0
	c0	mov $r0.15 = coder_state
;;
	c0	stw 48[$r0.1] = $r0.15
	c0	mov $r0.26 = decoder_state
;;
	c0	stw 44[$r0.1] = $r0.26
	c0	mov $r0.11 = 10
;;
	c0	stw 40[$r0.1] = $r0.11
	c0	mov $r0.11 = pcmdata
;;
	c0	stw 36[$r0.1] = $r0.11
	c0	mov $r0.27 = adpcmdata
;;
	c0	stw 16[$r0.1] = $r0.27
	c0	mov $r0.11 = stepsizeTable
;;
	c0	stw 56[$r0.1] = $r0.11
	c0	mov $r0.11 = 11
;;
	c0	stw 32[$r0.1] = $r0.11
	c0	mov $r0.11 = pcmdata_2
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	mov $r0.11 = 29
;;
	c0	stw 24[$r0.1] = $r0.11
	c0	mov $r0.11 = 30
;;
	c0	stw 20[$r0.1] = $r0.11
	c0	mov $r0.62 = 1
	c0	mov $r0.57 = 3
	c0	mov $r0.59 = 31
;;
	c0	mov $r0.60 = 2
	c0	mov $r0.61 = indexTable
;;
	c0	mov $r0.63 = 32767
	c0	mov $r0.11 = 4
;;
	c0	stw 60[$r0.1] = $r0.11
	c0	mov $r0.13 = $r0.58
;;
LBB0_1::
	c0	stw 52[$r0.1] = $r0.13
;;
	c0	stb 2[$r0.15] = $r0.58
;;
	c0	sth 0[$r0.15] = $r0.58
;;
	c0	stb 2[$r0.26] = $r0.58
;;
	c0	sth 0[$r0.26] = $r0.58
;;
	c0	ldw $r0.3 = 36[$r0.1]
	c0	mov $r0.4 = $r0.27
;;
	c0	ldw $r0.5 = 40[$r0.1]
	c0	mov $r0.6 = $r0.15
;;
;;
.call adpcm_coder, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = adpcm_coder
;;
	c0	ldw $r0.30 = 20[$r0.1]
;;
	c0	ldw $r0.29 = 24[$r0.1]
;;
	c0	ldw $r0.26 = 44[$r0.1]
;;
;;
	c0	ldb $r0.11 = 2[$r0.26]
;;
	c0	ldw $r0.28 = 56[$r0.1]
;;
;;
	c0	sh2add $r0.13 = $r0.11, $r0.28
	c0	ldh $r0.12 = 0[$r0.26]
;;
	c0	ldw $r0.17 = 0[$r0.13]
;;
	c0	ldw $r0.13 = 32[$r0.1]
	c0	mov $r0.15 = $r0.58
;;
	c0	ldw $r0.16 = 28[$r0.1]
;;
	c0	ldw $r0.18 = 16[$r0.1]
;;
;;
	c0	mov $r0.14 = $r0.18
	c0	mov $r0.27 = $r0.18
;;
LBB0_2::
	c0	cmpne $b0.0 = $r0.15, 0
	c0	mov $r0.18 = $r0.19
;;
;;
	c0	br $b0.0, LBB0_4
;;
	c0	ldb $r0.18 = 0[$r0.14]
	c0	add $r0.14 = $r0.14, 1
;;
	c0	ldw $r0.19 = 60[$r0.1]
;;
;;
	c0	shru $r0.19 = $r0.18, $r0.19
;;
LBB0_4::
	c0	shl $r0.20 = $r0.19, $r0.29
	c0	shl $r0.21 = $r0.19, $r0.30
	c0	shr $r0.22 = $r0.17, $r0.62
	c0	shr $r0.23 = $r0.17, $r0.57
;;
	c0	and $r0.24 = $r0.19, 15
	c0	shr $r0.20 = $r0.20, $r0.59
	c0	shl $r0.25 = $r0.19, $r0.59
	c0	shr $r0.21 = $r0.21, $r0.59
;;
	c0	and $r0.20 = $r0.20, $r0.17
	c0	and $r0.21 = $r0.21, $r0.22
	c0	shr $r0.22 = $r0.25, $r0.59
	c0	shr $r0.17 = $r0.17, $r0.60
;;
	c0	add $r0.20 = $r0.20, $r0.23
	c0	and $r0.17 = $r0.22, $r0.17
	c0	and $r0.19 = $r0.19, 8
	c0	sh2add $r0.22 = $r0.24, $r0.61
;;
	c0	add $r0.20 = $r0.20, $r0.21
	c0	cmpeq $b0.0 = $r0.19, 0
;;
	c0	add $r0.17 = $r0.20, $r0.17
	c0	ldw $r0.19 = 0[$r0.22]
;;
	c0	sub $r0.20 = $r0.58, $r0.17
;;
	c0	add $r0.11 = $r0.19, $r0.11
	c0	slct $r0.17 = $b0.0, $r0.17, $r0.20
;;
	c0	max $r0.11 = $r0.11, 0
	c0	add $r0.12 = $r0.17, $r0.12
;;
	c0	min $r0.11 = $r0.11, 88
	c0	cmpeq $b0.0 = $r0.15, 0
;;
	c0	sh2add $r0.15 = $r0.11, $r0.28
	c0	cmpgt $b0.1 = $r0.12, 32767
;;
	c0	ldw $r0.17 = 0[$r0.15]
	c0	max $r0.12 = $r0.12, -32768
	c0	add $r0.13 = $r0.13, -1
;;
	c0	slct $r0.12 = $b0.1, $r0.63, $r0.12
	c0	mfb $r0.15 = $b0.0
	c0	cmpgt $b0.0 = $r0.13, 1
	c0	add $r0.20 = $r0.16, 2
;;
	c0	sth 0[$r0.16] = $r0.12
	c0	mov $r0.19 = $r0.18
	c0	mov $r0.16 = $r0.20
;;
	c0	br $b0.0, LBB0_2
;;
	c0	stw 56[$r0.1] = $r0.28
;;
	c0	ldw $r0.13 = 52[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.13, 1
	c0	sth 0[$r0.26] = $r0.12
;;
	c0	cmpne $b0.0 = $r0.13, 1000
	c0	stb 2[$r0.26] = $r0.11
;;
	c0	ldw $r0.15 = 48[$r0.1]
;;
	c0	br $b0.0, LBB0_1
;;
	c0	mov $r0.13 = -3
	c0	ldhu $r0.14 = 0[$r0.15]
;;
;;
	c0	cmpne $b0.0 = $r0.14, 32
;;
;;
	c0	br $b0.0, LBB0_12
;;
	c0	ldb $r0.14 = 2[$r0.15]
;;
;;
	c0	zxtb $r0.14 = $r0.14
;;
	c0	cmpne $b0.0 = $r0.14, 1
;;
;;
	c0	br $b0.0, LBB0_12
;;
	c0	zxth $r0.12 = $r0.12
	c0	mov $r0.13 = -2
;;
	c0	cmpne $b0.0 = $r0.12, 32
;;
;;
	c0	br $b0.0, LBB0_12
;;
	c0	zxtb $r0.11 = $r0.11
;;
	c0	cmpne $b0.0 = $r0.11, 1
;;
;;
	c0	br $b0.0, LBB0_12
;;
	c0	mov $r0.11 = pcmdata_2_ref
	c0	mov $r0.12 = pcmdata_2
;;
	c0	mov $r0.13 = 0
	c0	ldhu $r0.14 = 0[$r0.12]
;;
	c0	ldhu $r0.15 = 0[$r0.11]
;;
;;
	c0	cmpne $b0.0 = $r0.14, $r0.15
;;
;;
	c0	br $b0.0, LBB0_12
;;
	c0	mov $r0.13 = 101
	c0	ldhu $r0.14 = 2[$r0.12]
;;
	c0	ldhu $r0.15 = 2[$r0.11]
;;
;;
	c0	cmpeq $b0.0 = $r0.14, $r0.15
;;
;;
	c0	brf $b0.0, LBB0_12
;;
	c0	mov $r0.13 = 202
	c0	ldhu $r0.14 = 4[$r0.12]
;;
	c0	ldhu $r0.15 = 4[$r0.11]
;;
;;
	c0	cmpne $b0.0 = $r0.14, $r0.15
;;
;;
	c0	br $b0.0, LBB0_12
;;
	c0	mov $r0.13 = 303
	c0	ldhu $r0.14 = 6[$r0.12]
;;
	c0	ldhu $r0.15 = 6[$r0.11]
;;
;;
	c0	cmpne $b0.0 = $r0.14, $r0.15
;;
;;
	c0	br $b0.0, LBB0_12
;;
	c0	mov $r0.13 = 404
	c0	ldhu $r0.14 = 8[$r0.12]
;;
	c0	ldhu $r0.15 = 8[$r0.11]
;;
;;
	c0	cmpne $b0.0 = $r0.14, $r0.15
;;
;;
	c0	br $b0.0, LBB0_12
;;
	c0	mov $r0.13 = 505
	c0	ldhu $r0.14 = 10[$r0.12]
;;
	c0	ldhu $r0.15 = 10[$r0.11]
;;
;;
	c0	cmpne $b0.0 = $r0.14, $r0.15
;;
;;
	c0	br $b0.0, LBB0_12
;;
	c0	mov $r0.13 = 606
	c0	ldhu $r0.14 = 12[$r0.12]
;;
	c0	ldhu $r0.15 = 12[$r0.11]
;;
;;
	c0	cmpne $b0.0 = $r0.14, $r0.15
;;
;;
	c0	br $b0.0, LBB0_12
;;
	c0	mov $r0.13 = 707
	c0	ldhu $r0.14 = 14[$r0.12]
;;
	c0	ldhu $r0.15 = 14[$r0.11]
;;
;;
	c0	cmpne $b0.0 = $r0.14, $r0.15
;;
;;
	c0	br $b0.0, LBB0_12
;;
	c0	mov $r0.13 = 808
	c0	ldhu $r0.14 = 16[$r0.12]
;;
	c0	ldhu $r0.15 = 16[$r0.11]
;;
;;
	c0	cmpne $b0.0 = $r0.14, $r0.15
;;
;;
	c0	br $b0.0, LBB0_12
;;
	c0	mov $r0.13 = -1
	c0	ldhu $r0.12 = 18[$r0.12]
;;
	c0	ldhu $r0.11 = 18[$r0.11]
;;
;;
	c0	cmpeq $b0.0 = $r0.12, $r0.11
;;
;;
	c0	slct $r0.3 = $b0.0, $r0.13, 909
	c0	goto LBB0_13
;;
LBB0_12::
	c0	mov $r0.3 = $r0.13
;;
LBB0_13::
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
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg()
adpcm_coder::
	c0	ldb $r0.11 = 2[$r0.6]
;;
	c0	ldh $r0.14 = 0[$r0.6]
	c0	cmplt $b0.0 = $r0.5, 1
;;
;;
	c0	br $b0.0, LBB1_10
;;
	c0	mov $r0.12 = stepsizeTable
;;
	c0	sh2add $r0.13 = $r0.11, $r0.12
;;
	c0	ldw $r0.27 = 0[$r0.13]
	c0	add $r0.13 = $r0.5, 1
	c0	mov $r0.15 = 1
	c0	mov $r0.16 = 31
;;
	c0	mov $r0.17 = 0
	c0	mov $r0.18 = 3
	c0	mov $r0.19 = 2
;;
	c0	mov $r0.20 = indexTable
	c0	mov $r0.21 = 32767
;;
	c0	mov $r0.23 = 4
	c0	mov $r0.26 = $r0.15
	c0	mov $r0.24 = $r0.4
	c0	mov $r0.25 = $r0.3
;;
LBB1_2::
	c0	ldh $r0.28 = 0[$r0.25]
;;
;;
	c0	sub $r0.28 = $r0.28, $r0.14
;;
	c0	shr $r0.29 = $r0.28, $r0.16
;;
	c0	add $r0.30 = $r0.28, $r0.29
	c0	shr $r0.32 = $r0.27, $r0.18
	c0	shr $r0.33 = $r0.27, $r0.15
;;
	c0	xor $r0.34 = $r0.30, $r0.29
	c0	and $r0.30 = $r0.29, 8
;;
	c0	cmplt $b0.0 = $r0.34, $r0.27
;;
;;
	c0	slct $r0.35 = $b0.0, $r0.17, $r0.27
	c0	slct $r0.31 = $b0.0, $r0.17, 4
;;
	c0	add $r0.29 = $r0.35, $r0.32
	c0	sub $r0.32 = $r0.34, $r0.35
;;
	c0	cmplt $b0.0 = $r0.32, $r0.33
;;
;;
	c0	br $b0.0, LBB1_4
;;
	c0	or $r0.31 = $r0.31, 2
	c0	add $r0.29 = $r0.29, $r0.33
	c0	sub $r0.32 = $r0.32, $r0.33
;;
LBB1_4::
	c0	shr $r0.33 = $r0.27, $r0.19
;;
	c0	cmpge $b0.0 = $r0.32, $r0.33
	c0	or $r0.27 = $r0.31, $r0.30
;;
;;
	c0	mfb $r0.30 = $b0.0
	c0	cmplt $b0.0 = $r0.32, $r0.33
;;
	c0	or $r0.27 = $r0.27, $r0.30
;;
	c0	sh2add $r0.30 = $r0.27, $r0.20
	c0	slct $r0.31 = $b0.0, $r0.17, $r0.33
;;
	c0	ldw $r0.30 = 0[$r0.30]
	c0	add $r0.29 = $r0.31, $r0.29
	c0	cmpgt $b0.0 = $r0.28, -1
;;
	c0	sub $r0.28 = $r0.17, $r0.29
;;
	c0	add $r0.11 = $r0.30, $r0.11
	c0	slct $r0.28 = $b0.0, $r0.29, $r0.28
;;
	c0	max $r0.11 = $r0.11, 0
	c0	add $r0.14 = $r0.28, $r0.14
;;
	c0	min $r0.11 = $r0.11, 88
	c0	cmpeq $b0.0 = $r0.26, 0
;;
	c0	sh2add $r0.26 = $r0.11, $r0.12
	c0	cmpgt $b0.1 = $r0.14, 32767
;;
	c0	max $r0.14 = $r0.14, -32768
;;
	c0	br $b0.0, LBB1_6
;;
	c0	shl $r0.22 = $r0.27, $r0.23
;;
	c0	zxtb $r0.22 = $r0.22
	c0	goto LBB1_7
;;
LBB1_6::
	c0	and $r0.27 = $r0.27, 15
;;
	c0	or $r0.27 = $r0.27, $r0.22
	c0	add $r0.28 = $r0.24, 1
;;
	c0	stb 0[$r0.24] = $r0.27
	c0	mov $r0.24 = $r0.28
;;
LBB1_7::
	c0	add $r0.25 = $r0.25, 2
	c0	slct $r0.14 = $b0.1, $r0.21, $r0.14
	c0	ldw $r0.27 = 0[$r0.26]
	c0	add $r0.13 = $r0.13, -1
;;
	c0	mfb $r0.26 = $b0.0
	c0	cmpgt $b0.1 = $r0.13, 1
;;
;;
	c0	br $b0.1, LBB1_2
;;
	c0	br $b0.0, LBB1_10
;;
	c0	stb 0[$r0.24] = $r0.22
;;
LBB1_10::
	c0	sth 0[$r0.6] = $r0.14
;;
.return ret($r0.3:s32)
	c0	stb 2[$r0.6] = $r0.11
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg()
adpcm_decoder::
	c0	ldb $r0.11 = 2[$r0.6]
;;
	c0	ldh $r0.12 = 0[$r0.6]
	c0	cmplt $b0.0 = $r0.5, 1
;;
;;
	c0	br $b0.0, LBB2_5
;;
	c0	mov $r0.13 = stepsizeTable
;;
	c0	sh2add $r0.14 = $r0.11, $r0.13
;;
	c0	ldw $r0.25 = 0[$r0.14]
	c0	add $r0.14 = $r0.5, 1
	c0	mov $r0.15 = 0
	c0	mov $r0.16 = 29
;;
	c0	mov $r0.17 = 30
	c0	mov $r0.18 = 1
	c0	mov $r0.19 = 3
	c0	mov $r0.20 = 31
;;
	c0	mov $r0.21 = 2
	c0	mov $r0.22 = indexTable
;;
	c0	mov $r0.23 = 32767
	c0	mov $r0.24 = 4
	c0	mov $r0.27 = $r0.15
;;
	c0	mov $r0.28 = $r0.4
	c0	mov $r0.26 = $r0.3
;;
LBB2_2::
	c0	cmpne $b0.0 = $r0.27, 0
	c0	mov $r0.30 = $r0.29
;;
;;
	c0	br $b0.0, LBB2_4
;;
	c0	ldb $r0.30 = 0[$r0.26]
	c0	add $r0.26 = $r0.26, 1
;;
;;
	c0	shru $r0.29 = $r0.30, $r0.24
;;
LBB2_4::
	c0	shl $r0.31 = $r0.29, $r0.16
	c0	shl $r0.32 = $r0.29, $r0.17
	c0	shr $r0.33 = $r0.25, $r0.18
	c0	shr $r0.34 = $r0.25, $r0.19
;;
	c0	and $r0.35 = $r0.29, 15
	c0	shr $r0.31 = $r0.31, $r0.20
	c0	shl $r0.36 = $r0.29, $r0.20
	c0	shr $r0.32 = $r0.32, $r0.20
;;
	c0	and $r0.31 = $r0.31, $r0.25
	c0	and $r0.32 = $r0.32, $r0.33
	c0	shr $r0.33 = $r0.36, $r0.20
	c0	shr $r0.25 = $r0.25, $r0.21
;;
	c0	add $r0.31 = $r0.31, $r0.34
	c0	and $r0.25 = $r0.33, $r0.25
	c0	and $r0.29 = $r0.29, 8
	c0	sh2add $r0.33 = $r0.35, $r0.22
;;
	c0	add $r0.31 = $r0.31, $r0.32
	c0	cmpeq $b0.0 = $r0.29, 0
;;
	c0	add $r0.25 = $r0.31, $r0.25
	c0	ldw $r0.29 = 0[$r0.33]
;;
	c0	sub $r0.31 = $r0.15, $r0.25
;;
	c0	add $r0.11 = $r0.29, $r0.11
	c0	slct $r0.25 = $b0.0, $r0.25, $r0.31
;;
	c0	max $r0.11 = $r0.11, 0
	c0	add $r0.12 = $r0.25, $r0.12
;;
	c0	min $r0.11 = $r0.11, 88
	c0	cmpeq $b0.0 = $r0.27, 0
;;
	c0	sh2add $r0.25 = $r0.11, $r0.13
	c0	cmpgt $b0.1 = $r0.12, 32767
;;
	c0	ldw $r0.25 = 0[$r0.25]
	c0	max $r0.12 = $r0.12, -32768
	c0	add $r0.14 = $r0.14, -1
;;
	c0	slct $r0.12 = $b0.1, $r0.23, $r0.12
	c0	mfb $r0.27 = $b0.0
	c0	cmpgt $b0.0 = $r0.14, 1
	c0	add $r0.31 = $r0.28, 2
;;
	c0	sth 0[$r0.28] = $r0.12
	c0	mov $r0.29 = $r0.30
	c0	mov $r0.28 = $r0.31
;;
	c0	br $b0.0, LBB2_2
;;
LBB2_5::
	c0	sth 0[$r0.6] = $r0.12
;;
.return ret($r0.3:s32)
	c0	stb 2[$r0.6] = $r0.11
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .data

	.align	2
pcmdata::
	.data2	0
	.data2	0
	.data2	16
	.data2	16
	.data2	16
	.data2	24
	.data2	24
	.data2	24
	.data2	32
	.data2	32

adpcmdata_ref::
	.data1 0
	.data1 113
	.data1 130
	.data1 0
	.data1 56
.skip 3

	.align	4
pcmdata_2_ref::
	.data2	0
	.data2	0
	.data2	11
	.data2	17
	.data2	16
	.data2	23
	.data2	24
	.data2	25
	.data2	33
	.data2	32

	.comm	coder_state,4,2
	.comm	decoder_state,4,2
	.comm	adpcmdata,5,1
	.comm	pcmdata_2,20,2
.section .data
	.align	4
stepsizeTable::
	.data4	7
	.data4	8
	.data4	9
	.data4	10
	.data4	11
	.data4	12
	.data4	13
	.data4	14
	.data4	16
	.data4	17
	.data4	19
	.data4	21
	.data4	23
	.data4	25
	.data4	28
	.data4	31
	.data4	34
	.data4	37
	.data4	41
	.data4	45
	.data4	50
	.data4	55
	.data4	60
	.data4	66
	.data4	73
	.data4	80
	.data4	88
	.data4	97
	.data4	107
	.data4	118
	.data4	130
	.data4	143
	.data4	157
	.data4	173
	.data4	190
	.data4	209
	.data4	230
	.data4	253
	.data4	279
	.data4	307
	.data4	337
	.data4	371
	.data4	408
	.data4	449
	.data4	494
	.data4	544
	.data4	598
	.data4	658
	.data4	724
	.data4	796
	.data4	876
	.data4	963
	.data4	1060
	.data4	1166
	.data4	1282
	.data4	1411
	.data4	1552
	.data4	1707
	.data4	1878
	.data4	2066
	.data4	2272
	.data4	2499
	.data4	2749
	.data4	3024
	.data4	3327
	.data4	3660
	.data4	4026
	.data4	4428
	.data4	4871
	.data4	5358
	.data4	5894
	.data4	6484
	.data4	7132
	.data4	7845
	.data4	8630
	.data4	9493
	.data4	10442
	.data4	11487
	.data4	12635
	.data4	13899
	.data4	15289
	.data4	16818
	.data4	18500
	.data4	20350
	.data4	22385
	.data4	24623
	.data4	27086
	.data4	29794
	.data4	32767

	.align	4
indexTable::
	.data4	4294967295
	.data4	4294967295
	.data4	4294967295
	.data4	4294967295
	.data4	2
	.data4	4
	.data4	6
	.data4	8
	.data4	4294967295
	.data4	4294967295
	.data4	4294967295
	.data4	4294967295
	.data4	2
	.data4	4
	.data4	6
	.data4	8


