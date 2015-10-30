.section .text
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @IMG_sobel_c
IMG_sobel_c::
## BB#0:                                ## %entry
	c0	add $r0.11 = $r0.6, -2
;;
	c0	mpyhs $r0.12 = $r0.11, $r0.5
	c0	mpylu $r0.11 = $r0.11, $r0.5
;;
	c0	add $r0.12 = $r0.11, $r0.12
;;
	c0	cmplt $b0.0 = $r0.12, 3
;;
	c0	br $b0.0, LBB0_16
;;
## BB#1:                                ## %for.body.lr.ph
	c0	mov $r0.16 = 0
	c0	mov $r0.11 = 1
	c0	cmpeq $b0.0 = $r0.12, 2
;;
	c0	br $b0.0, LBB0_14
;;
## BB#2:                                ## %overflow.checked
	c0	add $r0.13 = $r0.12, -2
	c0	mov $r0.16 = 0
;;
	c0	and $r0.14 = $r0.13, -4
;;
	c0	cmpeq $b0.0 = $r0.14, 0
;;
	c0	br $b0.0, LBB0_13
;;
## BB#3:                                ## %vector.memcheck
	c0	add $r0.18 = $r0.4, $r0.13
	c0	add $r0.15 = $r0.4, 1
	c0	add $r0.17 = $r0.12, $r0.3
;;
	c0	cmpgeu $b0.0 = $r0.18, $r0.3
	c0	add $r0.19 = $r0.17, -3
;;
	c0	cmpleu $b0.1 = $r0.15, $r0.19
	c0	mfb $r0.19 = $b0.0
;;
	c0	mfb $r0.20 = $b0.1
;;
	c0	and $r0.19 = $r0.20, $r0.19
;;
	c0	mtb $b0.0 = $r0.19
;;
	c0	br $b0.0, LBB0_13
;;
## BB#4:                                ## %vector.memcheck
	c0	add $r0.19 = $r0.3, $r0.13
	c0	add $r0.20 = $r0.3, 1
;;
	c0	cmpleu $b0.0 = $r0.20, $r0.18
	c0	cmpleu $b0.1 = $r0.15, $r0.19
;;
	c0	mfb $r0.19 = $b0.0
	c0	mfb $r0.20 = $b0.1
;;
	c0	and $r0.19 = $r0.20, $r0.19
;;
	c0	mtb $b0.0 = $r0.19
;;
	c0	br $b0.0, LBB0_13
;;
## BB#5:                                ## %vector.memcheck
	c0	add $r0.17 = $r0.17, -1
	c0	add $r0.19 = $r0.3, 2
;;
	c0	cmpleu $b0.0 = $r0.19, $r0.18
	c0	cmpleu $b0.1 = $r0.15, $r0.17
;;
	c0	mfb $r0.17 = $b0.0
	c0	mfb $r0.19 = $b0.1
;;
	c0	and $r0.17 = $r0.19, $r0.17
;;
	c0	mtb $b0.0 = $r0.17
;;
	c0	br $b0.0, LBB0_13
;;
## BB#6:                                ## %vector.memcheck
	c0	add $r0.17 = $r0.6, -1
;;
	c0	mpylu $r0.19 = $r0.17, $r0.5
	c0	mpyhs $r0.17 = $r0.17, $r0.5
;;
	c0	add $r0.19 = $r0.19, $r0.17
	c0	add $r0.17 = $r0.3, $r0.5
;;
	c0	add $r0.19 = $r0.19, $r0.3
;;
	c0	add $r0.20 = $r0.19, -3
	c0	cmpleu $b0.0 = $r0.17, $r0.18
;;
	c0	cmpleu $b0.1 = $r0.15, $r0.20
	c0	mfb $r0.20 = $b0.0
;;
	c0	mfb $r0.21 = $b0.1
;;
	c0	and $r0.20 = $r0.21, $r0.20
;;
	c0	mtb $b0.0 = $r0.20
;;
	c0	br $b0.0, LBB0_13
;;
## BB#7:                                ## %vector.memcheck
	c0	add $r0.17 = $r0.17, 2
	c0	add $r0.19 = $r0.19, -1
;;
	c0	cmpleu $b0.0 = $r0.17, $r0.18
	c0	cmpleu $b0.1 = $r0.15, $r0.19
;;
	c0	mfb $r0.17 = $b0.0
	c0	mfb $r0.19 = $b0.1
;;
	c0	and $r0.17 = $r0.19, $r0.17
;;
	c0	mtb $b0.0 = $r0.17
;;
	c0	br $b0.0, LBB0_13
;;
## BB#8:                                ## %vector.memcheck
	c0	shl $r0.17 = $r0.5, $r0.11
	c0	mpylu $r0.19 = $r0.6, $r0.5
	c0	mpyhs $r0.20 = $r0.6, $r0.5
;;
	c0	add $r0.20 = $r0.19, $r0.20
	c0	add $r0.19 = $r0.3, $r0.17
;;
	c0	add $r0.20 = $r0.20, $r0.3
;;
	c0	add $r0.21 = $r0.20, -3
	c0	cmpleu $b0.0 = $r0.19, $r0.18
;;
	c0	cmpleu $b0.1 = $r0.15, $r0.21
	c0	mfb $r0.21 = $b0.0
;;
	c0	mfb $r0.22 = $b0.1
;;
	c0	and $r0.21 = $r0.22, $r0.21
;;
	c0	mtb $b0.0 = $r0.21
;;
	c0	br $b0.0, LBB0_13
;;
## BB#9:                                ## %vector.memcheck
	c0	or $r0.21 = $r0.17, 1
;;
	c0	add $r0.21 = $r0.3, $r0.21
	c0	add $r0.22 = $r0.20, -2
;;
	c0	cmpleu $b0.0 = $r0.21, $r0.18
	c0	cmpleu $b0.1 = $r0.15, $r0.22
;;
	c0	mfb $r0.21 = $b0.0
	c0	mfb $r0.22 = $b0.1
;;
	c0	and $r0.21 = $r0.22, $r0.21
;;
	c0	mtb $b0.0 = $r0.21
;;
	c0	br $b0.0, LBB0_13
;;
## BB#10:                               ## %vector.memcheck
	c0	add $r0.20 = $r0.20, -1
	c0	add $r0.19 = $r0.19, 2
;;
	c0	cmpleu $b0.0 = $r0.19, $r0.18
	c0	cmpleu $b0.1 = $r0.15, $r0.20
;;
	c0	mfb $r0.18 = $b0.0
	c0	mfb $r0.19 = $b0.1
;;
	c0	and $r0.18 = $r0.19, $r0.18
;;
	c0	mtb $b0.0 = $r0.18
;;
	c0	br $b0.0, LBB0_13
;;
## BB#11:                               ## %vector.ph
	c0	and $r0.18 = $r0.13, -4
	c0	mov $r0.19 = 0
	c0	mov $r0.20 = 31
;;
LBB0_12::                               ## %vector.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.16 = $r0.19, $r0.5
	c0	add $r0.21 = $r0.19, $r0.17
	c0	add $r0.22 = $r0.3, $r0.19
;;
	c0	add $r0.16 = $r0.3, $r0.16
;;
	c0	ldbu $r0.23 = 1[$r0.16]
	c0	add $r0.21 = $r0.3, $r0.21
;;
	c0	shl $r0.23 = $r0.23, $r0.11
	c0	ldbu $r0.24 = 0[$r0.16]
;;
	c0	shl $r0.24 = $r0.24, $r0.11
	c0	ldbu $r0.25 = 3[$r0.16]
;;
	c0	shl $r0.26 = $r0.25, $r0.11
	c0	ldbu $r0.27 = 5[$r0.22]
;;
	c0	ldbu $r0.28 = 0[$r0.22]
	c0	add $r0.29 = $r0.15, $r0.19
;;
	c0	ldbu $r0.30 = 4[$r0.16]
;;
	c0	ldbu $r0.31 = 2[$r0.16]
;;
	c0	shl $r0.32 = $r0.31, $r0.11
	c0	ldbu $r0.33 = 4[$r0.22]
;;
	c0	ldbu $r0.16 = 5[$r0.16]
	c0	add $r0.19 = $r0.19, 4
;;
	c0	ldbu $r0.34 = 0[$r0.21]
;;
	c0	ldbu $r0.35 = 1[$r0.22]
;;
	c0	sh1add $r0.36 = $r0.35, $r0.28
	c0	ldbu $r0.37 = 3[$r0.22]
;;
	c0	sub $r0.38 = $r0.27, $r0.37
	c0	sh1add $r0.39 = $r0.33, $r0.37
	c0	sub $r0.40 = $r0.37, $r0.35
	c0	ldbu $r0.22 = 2[$r0.22]
;;
	c0	sub $r0.41 = $r0.33, $r0.22
	c0	sh1add $r0.42 = $r0.37, $r0.22
	c0	sub $r0.28 = $r0.22, $r0.28
	c0	sh1add $r0.35 = $r0.22, $r0.35
;;
	c0	sub $r0.23 = $r0.40, $r0.23
	c0	add $r0.35 = $r0.35, $r0.37
	c0	sub $r0.24 = $r0.28, $r0.24
	c0	sub $r0.26 = $r0.38, $r0.26
;;
	c0	add $r0.27 = $r0.39, $r0.27
	c0	add $r0.28 = $r0.42, $r0.33
	c0	add $r0.22 = $r0.36, $r0.22
	c0	sub $r0.32 = $r0.41, $r0.32
;;
	c0	sh1add $r0.23 = $r0.25, $r0.23
	c0	sub $r0.22 = $r0.34, $r0.22
	c0	sh1add $r0.16 = $r0.16, $r0.26
	c0	sh1add $r0.24 = $r0.31, $r0.24
;;
	c0	sh1add $r0.25 = $r0.30, $r0.32
	c0	sub $r0.24 = $r0.24, $r0.34
	c0	ldbu $r0.26 = 1[$r0.21]
;;
	c0	sub $r0.30 = $r0.26, $r0.35
	c0	sh1add $r0.22 = $r0.26, $r0.22
	c0	sub $r0.23 = $r0.23, $r0.26
	c0	ldbu $r0.26 = 2[$r0.21]
;;
	c0	sub $r0.28 = $r0.26, $r0.28
	c0	sh1add $r0.30 = $r0.26, $r0.30
	c0	sub $r0.25 = $r0.25, $r0.26
	c0	add $r0.24 = $r0.24, $r0.26
;;
	c0	ldbu $r0.31 = 4[$r0.21]
	c0	add $r0.22 = $r0.22, $r0.26
	c0	shr $r0.26 = $r0.24, $r0.20
;;
	c0	add $r0.25 = $r0.25, $r0.31
	c0	ldbu $r0.32 = 3[$r0.21]
	c0	shr $r0.33 = $r0.22, $r0.20
	c0	add $r0.24 = $r0.24, $r0.26
;;
	c0	sub $r0.27 = $r0.32, $r0.27
	c0	sub $r0.16 = $r0.16, $r0.32
	c0	sh1add $r0.28 = $r0.32, $r0.28
	c0	add $r0.30 = $r0.30, $r0.32
;;
	c0	sh1add $r0.27 = $r0.31, $r0.27
	c0	add $r0.23 = $r0.23, $r0.32
	c0	add $r0.28 = $r0.28, $r0.31
	c0	ldbu $r0.21 = 5[$r0.21]
;;
	c0	add $r0.27 = $r0.27, $r0.21
	c0	add $r0.16 = $r0.16, $r0.21
	c0	shr $r0.21 = $r0.25, $r0.20
	c0	shr $r0.31 = $r0.28, $r0.20
;;
	c0	shr $r0.32 = $r0.16, $r0.20
	c0	shr $r0.34 = $r0.30, $r0.20
	c0	shr $r0.35 = $r0.23, $r0.20
	c0	shr $r0.36 = $r0.27, $r0.20
;;
	c0	add $r0.22 = $r0.22, $r0.33
	c0	add $r0.27 = $r0.27, $r0.36
	c0	add $r0.28 = $r0.28, $r0.31
	c0	add $r0.25 = $r0.25, $r0.21
;;
	c0	add $r0.16 = $r0.16, $r0.32
	c0	add $r0.30 = $r0.30, $r0.34
	c0	add $r0.23 = $r0.23, $r0.35
	c0	xor $r0.24 = $r0.24, $r0.26
;;
	c0	xor $r0.23 = $r0.23, $r0.35
	c0	xor $r0.22 = $r0.22, $r0.33
	c0	xor $r0.26 = $r0.30, $r0.34
	c0	xor $r0.27 = $r0.27, $r0.36
;;
	c0	xor $r0.28 = $r0.28, $r0.31
	c0	xor $r0.16 = $r0.16, $r0.32
	c0	xor $r0.21 = $r0.25, $r0.21
	c0	add $r0.22 = $r0.22, $r0.24
;;
	c0	add $r0.21 = $r0.28, $r0.21
	c0	add $r0.23 = $r0.26, $r0.23
	c0	add $r0.16 = $r0.27, $r0.16
	c0	min $r0.22 = $r0.22, 255
;;
	c0	min $r0.16 = $r0.16, 255
	c0	min $r0.21 = $r0.21, 255
	c0	min $r0.23 = $r0.23, 255
;;
	c0	stb 3[$r0.29] = $r0.16
;;
	c0	stb 2[$r0.29] = $r0.21
;;
	c0	stb 0[$r0.29] = $r0.22
	c0	cmpne $b0.0 = $r0.18, $r0.19
;;
	c0	stb 1[$r0.29] = $r0.23
	c0	mov $r0.16 = $r0.14
	c0	br $b0.0, LBB0_12
;;
LBB0_13::                               ## %middle.block
	c0	cmpeq $b0.0 = $r0.13, $r0.16
;;
	c0	br $b0.0, LBB0_16
;;
LBB0_14::                               ## %for.body.preheader
	c0	sh1add $r0.13 = $r0.5, $r0.16
	c0	add $r0.14 = $r0.16, $r0.5
	c0	add $r0.12 = $r0.12, -2
	c0	add $r0.15 = $r0.4, 1
;;
	c0	mov $r0.17 = 31
	c0	mov $r0.18 = -1
	c0	mov $r0.19 = $r0.3
;;
LBB0_15::                               ## %for.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.20 = $r0.19, $r0.14
	c0	add $r0.21 = $r0.19, $r0.16
;;
	c0	ldbu $r0.22 = 0[$r0.20]
;;
	c0	shl $r0.22 = $r0.22, $r0.11
	c0	ldbu $r0.23 = 1[$r0.21]
	c0	add $r0.24 = $r0.19, $r0.13
;;
	c0	ldbu $r0.25 = 0[$r0.21]
;;
	c0	sh1add $r0.23 = $r0.23, $r0.25
	c0	ldbu $r0.21 = 2[$r0.21]
;;
	c0	sub $r0.25 = $r0.21, $r0.25
	c0	add $r0.21 = $r0.23, $r0.21
	c0	ldbu $r0.20 = 2[$r0.20]
;;
	c0	sub $r0.22 = $r0.25, $r0.22
	c0	ldbu $r0.23 = 0[$r0.24]
;;
	c0	sh1add $r0.20 = $r0.20, $r0.22
	c0	sub $r0.21 = $r0.23, $r0.21
	c0	ldbu $r0.22 = 1[$r0.24]
;;
	c0	sub $r0.20 = $r0.20, $r0.23
	c0	sh1add $r0.21 = $r0.22, $r0.21
	c0	ldbu $r0.22 = 2[$r0.24]
;;
	c0	add $r0.20 = $r0.20, $r0.22
	c0	add $r0.21 = $r0.21, $r0.22
;;
	c0	shr $r0.22 = $r0.20, $r0.17
	c0	shr $r0.23 = $r0.21, $r0.17
;;
	c0	add $r0.20 = $r0.20, $r0.22
	c0	add $r0.21 = $r0.21, $r0.23
;;
	c0	xor $r0.20 = $r0.20, $r0.22
	c0	xor $r0.21 = $r0.21, $r0.23
	c0	add $r0.22 = $r0.16, $r0.15
	c0	add $r0.15 = $r0.15, 1
;;
	c0	add $r0.20 = $r0.21, $r0.20
	c0	add $r0.19 = $r0.19, 1
	c0	add $r0.12 = $r0.12, -1
;;
	c0	cmpgt $b0.0 = $r0.20, 255
	c0	cmpne $b0.1 = $r0.16, $r0.12
;;
	c0	slct $r0.20 = $b0.0, $r0.18, $r0.20
;;
	c0	stb 0[$r0.22] = $r0.20
	c0	br $b0.1, LBB0_15
;;
LBB0_16::                               ## %for.end
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-1088, arg() ## @main
main::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -1088
;;
	c0	stw 1068[$r0.1] = $l0.0
;;
	c0	stw 1064[$r0.1] = $r0.57
;;
	c0	stw 1060[$r0.1] = $r0.58
;;
	c0	stw 1056[$r0.1] = $r0.59
;;
	c0	stw 1052[$r0.1] = $r0.60
	c0	add $r0.11 = $r0.1, 28
	c0	mov $r0.12 = 0
;;
	c0	mov $r0.19 = 96
	c0	mov $r0.16 = 56
	c0	or $r0.13 = $r0.11, 1
	c0	mov $r0.18 = 193
;;
	c0	mov $r0.17 = 43
	c0	mov $r0.14 = in
	c0	mov $r0.58 = 1
;;
	c0	mov $r0.15 = 31
	c0	mov $r0.57 = -1
;;
LBB1_1::                                ## %for.body.i
                                        ## =>This Inner Loop Header: Depth=1
	c0	mov $r0.20 = $r0.16
	c0	mov $r0.21 = $r0.17
	c0	add $r0.17 = $r0.14, $r0.12
;;
	c0	ldbu $r0.16 = 32[$r0.17]
	c0	zxtb $r0.22 = $r0.20
	c0	zxtb $r0.19 = $r0.19
;;
	c0	sh1add $r0.22 = $r0.22, $r0.19
	c0	shl $r0.23 = $r0.16, $r0.58
	c0	ldbu $r0.16 = 2[$r0.17]
;;
	c0	sub $r0.19 = $r0.16, $r0.19
	c0	add $r0.22 = $r0.22, $r0.16
	c0	ldbu $r0.24 = 34[$r0.17]
	c0	zxtb $r0.18 = $r0.18
;;
	c0	sub $r0.19 = $r0.19, $r0.23
	c0	sub $r0.22 = $r0.18, $r0.22
;;
	c0	sh1add $r0.19 = $r0.24, $r0.19
	c0	zxtb $r0.23 = $r0.21
	c0	ldbu $r0.17 = 66[$r0.17]
;;
	c0	sub $r0.18 = $r0.19, $r0.18
	c0	sh1add $r0.19 = $r0.23, $r0.22
;;
	c0	add $r0.19 = $r0.19, $r0.17
	c0	add $r0.18 = $r0.18, $r0.17
;;
	c0	shr $r0.22 = $r0.18, $r0.15
	c0	shr $r0.23 = $r0.19, $r0.15
	c0	add $r0.24 = $r0.13, $r0.12
;;
	c0	add $r0.19 = $r0.19, $r0.23
	c0	add $r0.18 = $r0.18, $r0.22
;;
	c0	xor $r0.19 = $r0.19, $r0.23
	c0	xor $r0.18 = $r0.18, $r0.22
	c0	add $r0.12 = $r0.12, 1
;;
	c0	add $r0.18 = $r0.19, $r0.18
;;
	c0	cmpgt $b0.0 = $r0.18, 255
;;
	c0	slct $r0.18 = $b0.0, $r0.57, $r0.18
;;
	c0	stb 0[$r0.24] = $r0.18
	c0	cmpne $b0.0 = $r0.12, 958
	c0	mov $r0.18 = $r0.21
;;
	c0	mov $r0.19 = $r0.20
	c0	br $b0.0, LBB1_1
;;
LBB1_2::                                ## %for.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	mov $r0.12 = out_comp
;;
	c0	add $r0.12 = $r0.12, $r0.58
	c0	add $r0.13 = $r0.11, $r0.58
;;
	c0	ldbu $r0.59 = 0[$r0.12]
;;
	c0	ldbu $r0.60 = 0[$r0.13]
;;
	c0	cmpeq $b0.0 = $r0.60, $r0.59
;;
	c0	brf $b0.0, LBB1_3
;;
## BB#4:                                ## %for.inc
                                        ##   in Loop: Header=BB1_2 Depth=1
	c0	add $r0.58 = $r0.58, 1
;;
	c0	cmplt $b0.0 = $r0.58, 958
;;
	c0	br $b0.0, LBB1_2
;;
	c0	goto LBB1_5
;;
LBB1_3::                                ## %if.then
	c0	mov $r0.3 = str3
;;
.call puts, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = puts
;;
	c0	mov $r0.57 = 666
	c0	mov $r0.3 = .str1
;;
	c0	mov $r0.4 = $r0.60
	c0	mov $r0.5 = $r0.59
	c0	mov $r0.6 = $r0.58
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	goto LBB1_6
;;
LBB1_5::                                ## %for.end
	c0	mov $r0.3 = str
;;
.call puts, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = puts
;;
LBB1_6::                                ## %cleanup
	c0	mov $r0.3 = $r0.57
	c0	ldw $r0.60 = 1052[$r0.1]
;;
	c0	ldw $r0.59 = 1056[$r0.1]
;;
	c0	ldw $r0.58 = 1060[$r0.1]
;;
	c0	ldw $r0.57 = 1064[$r0.1]
;;
	c0	ldw $l0.0 = 1068[$r0.1]
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 1088, $l0.0
;;
.endp

.section .data
in::                                    ## @in
	.data1 96
	.data1 56
	.data1 122
	.data1 190
	.data1 246
	.data1 58
	.data1 183
	.data1 3
	.data1 62
	.data1 109
	.data1 43
	.data1 75
	.data1 35
	.data1 77
	.data1 47
	.data1 88
	.data1 8
	.data1 7
	.data1 242
	.data1 241
	.data1 15
	.data1 112
	.data1 88
	.data1 246
	.data1 152
	.data1 56
	.data1 31
	.data1 180
	.data1 8
	.data1 95
	.data1 67
	.data1 122
	.data1 203
	.data1 231
	.data1 164
	.data1 108
	.data1 155
	.data1 202
	.data1 229
	.data1 150
	.data1 1
	.data1 46
	.data1 150
	.data1 68
	.data1 28
	.data1 214
	.data1 148
	.data1 144
	.data1 160
	.data1 220
	.data1 175
	.data1 59
	.data1 33
	.data1 157
	.data1 142
	.data1 192
	.data1 145
	.data1 243
	.data1 207
	.data1 166
	.data1 7
	.data1 169
	.data1 114
	.data1 21
	.data1 193
	.data1 43
	.data1 119
	.data1 172
	.data1 108
	.data1 125
	.data1 196
	.data1 145
	.data1 162
	.data1 110
	.data1 76
	.data1 201
	.data1 179
	.data1 12
	.data1 110
	.data1 200
	.data1 167
	.data1 90
	.data1 154
	.data1 75
	.data1 131
	.data1 64
	.data1 58
	.data1 102
	.data1 203
	.data1 194
	.data1 206
	.data1 216
	.data1 72
	.data1 116
	.data1 89
	.data1 166
	.data1 11
	.data1 45
	.data1 251
	.data1 230
	.data1 177
	.data1 250
	.data1 223
	.data1 219
	.data1 231
	.data1 86
	.data1 86
	.data1 66
	.data1 48
	.data1 151
	.data1 68
	.data1 235
	.data1 229
	.data1 170
	.data1 186
	.data1 138
	.data1 125
	.data1 2
	.data1 228
	.data1 206
	.data1 14
	.data1 205
	.data1 37
	.data1 179
	.data1 20
	.data1 104
	.data1 128
	.data1 20
	.data1 112
	.data1 21
	.data1 57
	.data1 131
	.data1 178
	.data1 235
	.data1 187
	.data1 92
	.data1 154
	.data1 13
	.data1 188
	.data1 23
	.data1 219
	.data1 30
	.data1 158
	.data1 222
	.data1 35
	.data1 244
	.data1 24
	.data1 95
	.data1 87
	.data1 139
	.data1 21
	.data1 226
	.data1 35
	.data1 59
	.data1 220
	.data1 157
	.data1 177
	.data1 45
	.data1 112
	.data1 71
	.data1 183
	.data1 11
	.data1 57
	.data1 234
	.data1 183
	.data1 246
	.data1 227
	.data1 253
	.data1 130
	.data1 189
	.data1 133
	.data1 177
	.data1 253
	.data1 74
	.data1 6
	.data1 139
	.data1 39
	.data1 95
	.data1 188
	.data1 50
	.data1 90
	.data1 130
	.data1 85
	.data1 138
	.data1 208
	.data1 54
	.data1 250
	.data1 0
	.data1 104
	.data1 107
	.data1 177
	.data1 39
	.data1 170
	.data1 54
	.data1 2
	.data1 132
	.data1 8
	.data1 196
	.data1 221
	.data1 165
	.data1 102
	.data1 140
	.data1 186
	.data1 120
	.data1 220
	.data1 196
	.data1 1
	.data1 217
	.data1 186
	.data1 21
	.data1 173
	.data1 108
	.data1 204
	.data1 145
	.data1 43
	.data1 172
	.data1 222
	.data1 228
	.data1 135
	.data1 68
	.data1 130
	.data1 201
	.data1 202
	.data1 157
	.data1 16
	.data1 192
	.data1 157
	.data1 183
	.data1 237
	.data1 253
	.data1 49
	.data1 60
	.data1 16
	.data1 163
	.data1 98
	.data1 210
	.data1 194
	.data1 49
	.data1 26
	.data1 176
	.data1 164
	.data1 60
	.data1 243
	.data1 116
	.data1 246
	.data1 94
	.data1 32
	.data1 50
	.data1 21
	.data1 110
	.data1 141
	.data1 208
	.data1 69
	.data1 241
	.data1 67
	.data1 144
	.data1 177
	.data1 207
	.data1 17
	.data1 237
	.data1 175
	.data1 73
	.data1 104
	.data1 171
	.data1 71
	.data1 42
	.data1 134
	.data1 41
	.data1 245
	.data1 60
	.data1 215
	.data1 249
	.data1 174
	.data1 253
	.data1 151
	.data1 178
	.data1 32
	.data1 146
	.data1 187
	.data1 4
	.data1 62
	.data1 252
	.data1 17
	.data1 12
	.data1 251
	.data1 137
	.data1 166
	.data1 232
	.data1 84
	.data1 140
	.data1 103
	.data1 142
	.data1 148
	.data1 80
	.data1 10
	.data1 217
	.data1 211
	.data1 73
	.data1 46
	.data1 228
	.data1 191
	.data1 140
	.data1 192
	.data1 155
	.data1 158
	.data1 128
	.data1 161
	.data1 142
	.data1 147
	.data1 213
	.data1 133
	.data1 8
	.data1 31
	.data1 181
	.data1 30
	.data1 96
	.data1 234
	.data1 58
	.data1 120
	.data1 142
	.data1 195
	.data1 31
	.data1 166
	.data1 0
	.data1 229
	.data1 185
	.data1 158
	.data1 174
	.data1 124
	.data1 39
	.data1 97
	.data1 108
	.data1 103
	.data1 200
	.data1 94
	.data1 126
	.data1 62
	.data1 237
	.data1 24
	.data1 113
	.data1 149
	.data1 207
	.data1 6
	.data1 40
	.data1 130
	.data1 195
	.data1 185
	.data1 52
	.data1 92
	.data1 171
	.data1 68
	.data1 105
	.data1 197
	.data1 175
	.data1 215
	.data1 173
	.data1 235
	.data1 45
	.data1 173
	.data1 19
	.data1 10
	.data1 237
	.data1 40
	.data1 39
	.data1 52
	.data1 153
	.data1 57
	.data1 139
	.data1 84
	.data1 107
	.data1 5
	.data1 194
	.data1 112
	.data1 40
	.data1 197
	.data1 75
	.data1 45
	.data1 76
	.data1 237
	.data1 241
	.data1 152
	.data1 134
	.data1 144
	.data1 97
	.data1 35
	.data1 102
	.data1 2
	.data1 253
	.data1 236
	.data1 84
	.data1 190
	.data1 239
	.data1 69
	.data1 196
	.data1 138
	.data1 127
	.data1 112
	.data1 167
	.data1 216
	.data1 169
	.data1 170
	.data1 36
	.data1 111
	.data1 234
	.data1 106
	.data1 135
	.data1 74
	.data1 90
	.data1 234
	.data1 121
	.data1 192
	.data1 255
	.data1 230
	.data1 113
	.data1 228
	.data1 95
	.data1 163
	.data1 106
	.data1 46
	.data1 86
	.data1 50
	.data1 214
	.data1 90
	.data1 42
	.data1 245
	.data1 210
	.data1 144
	.data1 220
	.data1 98
	.data1 154
	.data1 196
	.data1 192
	.data1 6
	.data1 62
	.data1 95
	.data1 79
	.data1 205
	.data1 149
	.data1 30
	.data1 60
	.data1 128
	.data1 114
	.data1 58
	.data1 196
	.data1 142
	.data1 21
	.data1 201
	.data1 74
	.data1 14
	.data1 228
	.data1 100
	.data1 34
	.data1 4
	.data1 91
	.data1 8
	.data1 172
	.data1 226
	.data1 63
	.data1 65
	.data1 165
	.data1 82
	.data1 25
	.data1 132
	.data1 185
	.data1 50
	.data1 226
	.data1 220
	.data1 91
	.data1 224
	.data1 250
	.data1 201
	.data1 217
	.data1 182
	.data1 95
	.data1 100
	.data1 170
	.data1 216
	.data1 26
	.data1 199
	.data1 10
	.data1 44
	.data1 252
	.data1 171
	.data1 200
	.data1 169
	.data1 138
	.data1 81
	.data1 94
	.data1 213
	.data1 53
	.data1 166
	.data1 66
	.data1 136
	.data1 206
	.data1 161
	.data1 123
	.data1 245
	.data1 56
	.data1 240
	.data1 118
	.data1 234
	.data1 94
	.data1 210
	.data1 25
	.data1 86
	.data1 103
	.data1 70
	.data1 24
	.data1 12
	.data1 40
	.data1 101
	.data1 136
	.data1 198
	.data1 218
	.data1 12
	.data1 177
	.data1 107
	.data1 12
	.data1 189
	.data1 39
	.data1 148
	.data1 218
	.data1 198
	.data1 27
	.data1 76
	.data1 95
	.data1 163
	.data1 238
	.data1 23
	.data1 103
	.data1 160
	.data1 6
	.data1 53
	.data1 105
	.data1 194
	.data1 229
	.data1 39
	.data1 179
	.data1 231
	.data1 119
	.data1 114
	.data1 231
	.data1 44
	.data1 170
	.data1 162
	.data1 165
	.data1 142
	.data1 68
	.data1 145
	.data1 137
	.data1 211
	.data1 240
	.data1 233
	.data1 88
	.data1 170
	.data1 153
	.data1 230
	.data1 117
	.data1 17
	.data1 250
	.data1 96
	.data1 153
	.data1 246
	.data1 117
	.data1 8
	.data1 194
	.data1 33
	.data1 36
	.data1 241
	.data1 108
	.data1 80
	.data1 46
	.data1 82
	.data1 254
	.data1 163
	.data1 91
	.data1 137
	.data1 135
	.data1 58
	.data1 233
	.data1 99
	.data1 169
	.data1 28
	.data1 159
	.data1 154
	.data1 213
	.data1 90
	.data1 35
	.data1 158
	.data1 184
	.data1 115
	.data1 136
	.data1 152
	.data1 244
	.data1 250
	.data1 43
	.data1 171
	.data1 19
	.data1 118
	.data1 190
	.data1 124
	.data1 184
	.data1 136
	.data1 165
	.data1 244
	.data1 22
	.data1 83
	.data1 128
	.data1 68
	.data1 166
	.data1 23
	.data1 8
	.data1 41
	.data1 20
	.data1 31
	.data1 30
	.data1 113
	.data1 121
	.data1 221
	.data1 33
	.data1 189
	.data1 207
	.data1 82
	.data1 127
	.data1 135
	.data1 161
	.data1 179
	.data1 142
	.data1 102
	.data1 2
	.data1 73
	.data1 156
	.data1 144
	.data1 191
	.data1 152
	.data1 68
	.data1 160
	.data1 215
	.data1 195
	.data1 3
	.data1 154
	.data1 43
	.data1 46
	.data1 10
	.data1 43
	.data1 113
	.data1 101
	.data1 85
	.data1 52
	.data1 110
	.data1 60
	.data1 251
	.data1 137
	.data1 100
	.data1 54
	.data1 200
	.data1 245
	.data1 200
	.data1 42
	.data1 8
	.data1 129
	.data1 56
	.data1 35
	.data1 165
	.data1 245
	.data1 171
	.data1 136
	.data1 116
	.data1 159
	.data1 233
	.data1 124
	.data1 203
	.data1 82
	.data1 62
	.data1 135
	.data1 86
	.data1 177
	.data1 106
	.data1 117
	.data1 42
	.data1 173
	.data1 219
	.data1 126
	.data1 26
	.data1 75
	.data1 29
	.data1 166
	.data1 73
	.data1 170
	.data1 145
	.data1 102
	.data1 0
	.data1 68
	.data1 92
	.data1 140
	.data1 194
	.data1 116
	.data1 162
	.data1 95
	.data1 156
	.data1 55
	.data1 244
	.data1 6
	.data1 192
	.data1 54
	.data1 6
	.data1 41
	.data1 84
	.data1 3
	.data1 165
	.data1 216
	.data1 135
	.data1 163
	.data1 231
	.data1 172
	.data1 230
	.data1 76
	.data1 163
	.data1 43
	.data1 236
	.data1 111
	.data1 35
	.data1 112
	.data1 223
	.data1 247
	.data1 24
	.data1 11
	.data1 217
	.data1 211
	.data1 205
	.data1 37
	.data1 36
	.data1 178
	.data1 159
	.data1 232
	.data1 203
	.data1 13
	.data1 172
	.data1 29
	.data1 109
	.data1 106
	.data1 203
	.data1 22
	.data1 84
	.data1 221
	.data1 187
	.data1 205
	.data1 197
	.data1 210
	.data1 158
	.data1 77
	.data1 153
	.data1 10
	.data1 167
	.data1 80
	.data1 12
	.data1 227
	.data1 18
	.data1 41
	.data1 212
	.data1 219
	.data1 84
	.data1 228
	.data1 117
	.data1 86
	.data1 148
	.data1 171
	.data1 211
	.data1 159
	.data1 89
	.data1 106
	.data1 8
	.data1 44
	.data1 131
	.data1 182
	.data1 119
	.data1 37
	.data1 127
	.data1 234
	.data1 33
	.data1 39
	.data1 182
	.data1 147
	.data1 55
	.data1 68
	.data1 69
	.data1 13
	.data1 239
	.data1 78
	.data1 243
	.data1 109
	.data1 154
	.data1 85
	.data1 95
	.data1 161
	.data1 246
	.data1 109
	.data1 121
	.data1 214
	.data1 192
	.data1 180
	.data1 51
	.data1 25
	.data1 141
	.data1 146
	.data1 119
	.data1 64
	.data1 218
	.data1 66
	.data1 91
	.data1 11
	.data1 97
	.data1 145
	.data1 146
	.data1 133
	.data1 174
	.data1 230
	.data1 37
	.data1 176
	.data1 240
	.data1 129
	.data1 99
	.data1 96
	.data1 20
	.data1 7
	.data1 22
	.data1 103
	.data1 15
	.data1 61
	.data1 247
	.data1 242
	.data1 123
	.data1 20
	.data1 98
	.data1 50
	.data1 101
	.data1 229
	.data1 77
	.data1 62
	.data1 100
	.data1 252
	.data1 118
	.data1 55
	.data1 238
	.data1 90
	.data1 219
	.data1 172
	.data1 230
	.data1 182
	.data1 111
	.data1 64
	.data1 120
	.data1 197
	.data1 10
	.data1 138
	.data1 41
	.data1 187
	.data1 160
	.data1 60
	.data1 41
	.data1 16
	.data1 181
	.data1 134
	.data1 235
	.data1 135
	.data1 16
	.data1 188
	.data1 247
	.data1 107
	.data1 174
	.data1 53
	.data1 254
	.data1 27
	.data1 249
	.data1 118
	.data1 46
	.data1 201
	.data1 58
	.data1 144
	.data1 200
	.data1 126
	.data1 75
	.data1 198
	.data1 238
	.data1 96
	.data1 144
	.data1 114
	.data1 193
	.data1 55
	.data1 38
	.data1 40
	.data1 171
	.data1 45
	.data1 93
	.data1 27
	.data1 248
	.data1 213
	.data1 100
	.data1 191
	.data1 171
	.data1 110
	.data1 66
	.data1 176
	.data1 143
	.data1 103
	.data1 13
	.data1 209
	.data1 139
	.data1 38
	.data1 85
	.data1 184
	.data1 58
	.data1 4
	.data1 224
	.data1 73
	.data1 187
	.data1 156
	.data1 156
	.data1 160
	.data1 197
	.data1 69
	.data1 209
	.data1 52
	.data1 253
	.data1 220
	.data1 149
	.data1 56
	.data1 139
	.data1 198
	.data1 133
	.data1 68
	.data1 234
	.data1 52
	.data1 177
	.data1 52
	.data1 255
	.data1 169
	.data1 216
	.data1 80
	.data1 109
	.data1 184
	.data1 212
	.data1 173
	.data1 39
	.data1 18
	.data1 87
	.data1 210
	.data1 70
	.data1 192
	.data1 215
	.data1 157
	.data1 27
	.data1 172
	.data1 198
	.data1 103
	.data1 136
	.data1 101
	.data1 6
	.data1 102
	.data1 139
	.data1 34
	.data1 156
	.data1 83
	.data1 27
	.data1 7
	.data1 163
	.data1 76
	.data1 55
	.data1 167
	.data1 130
	.data1 251
	.data1 59
	.data1 201
	.data1 97
	.data1 246
	.data1 116
	.data1 111
	.data1 216
	.data1 104
	.data1 247
	.data1 19
	.data1 233
	.data1 241
	.data1 174
	.data1 51
	.data1 48
	.data1 203
	.data1 179
	.data1 16
	.data1 88
	.data1 45
	.data1 224
	.data1 177
	.data1 209
	.data1 243
	.data1 166
	.data1 46
	.data1 191
	.data1 126
	.data1 29
	.data1 42
	.data1 53
	.data1 216
	.data1 93
	.data1 160
	.data1 162
	.data1 28
	.data1 11
	.data1 227
	.data1 139
	.data1 20
	.data1 54
	.data1 223
	.data1 122
	.data1 35
	.data1 99
	.data1 164
	.data1 54
	.data1 101
	.data1 230
	.data1 37
	.data1 51
	.data1 20
	.data1 115

out_comp::                              ## @out_comp
	.data1 0
	.data1 194
	.data1 54
	.data1 255
	.data1 236
	.data1 182
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 232
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 74
	.data1 228
	.data1 255
	.data1 255
	.data1 100
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 234
	.data1 255
	.data1 148
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 94
	.data1 172
	.data1 188
	.data1 255
	.data1 255
	.data1 255
	.data1 74
	.data1 255
	.data1 255
	.data1 168
	.data1 198
	.data1 255
	.data1 96
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 170
	.data1 162
	.data1 255
	.data1 255
	.data1 255
	.data1 112
	.data1 255
	.data1 255
	.data1 224
	.data1 174
	.data1 255
	.data1 255
	.data1 112
	.data1 255
	.data1 92
	.data1 214
	.data1 255
	.data1 255
	.data1 255
	.data1 156
	.data1 255
	.data1 216
	.data1 246
	.data1 136
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 234
	.data1 212
	.data1 255
	.data1 182
	.data1 212
	.data1 44
	.data1 255
	.data1 94
	.data1 255
	.data1 255
	.data1 252
	.data1 110
	.data1 255
	.data1 184
	.data1 255
	.data1 226
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 242
	.data1 62
	.data1 112
	.data1 255
	.data1 148
	.data1 255
	.data1 255
	.data1 212
	.data1 255
	.data1 200
	.data1 190
	.data1 220
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 254
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 144
	.data1 255
	.data1 255
	.data1 240
	.data1 255
	.data1 255
	.data1 255
	.data1 134
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 224
	.data1 72
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 68
	.data1 255
	.data1 222
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 248
	.data1 255
	.data1 255
	.data1 196
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 206
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 136
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 194
	.data1 255
	.data1 60
	.data1 204
	.data1 230
	.data1 228
	.data1 250
	.data1 254
	.data1 255
	.data1 255
	.data1 255
	.data1 234
	.data1 255
	.data1 255
	.data1 80
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 140
	.data1 170
	.data1 84
	.data1 150
	.data1 255
	.data1 68
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 70
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 88
	.data1 255
	.data1 255
	.data1 118
	.data1 255
	.data1 120
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 142
	.data1 54
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 162
	.data1 255
	.data1 74
	.data1 255
	.data1 246
	.data1 255
	.data1 130
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 182
	.data1 255
	.data1 255
	.data1 255
	.data1 132
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 218
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 150
	.data1 255
	.data1 164
	.data1 255
	.data1 255
	.data1 208
	.data1 120
	.data1 255
	.data1 255
	.data1 255
	.data1 120
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 92
	.data1 255
	.data1 170
	.data1 255
	.data1 255
	.data1 144
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 124
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 224
	.data1 255
	.data1 255
	.data1 238
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 184
	.data1 138
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 186
	.data1 255
	.data1 254
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 58
	.data1 255
	.data1 255
	.data1 255
	.data1 226
	.data1 42
	.data1 255
	.data1 242
	.data1 255
	.data1 186
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 128
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 20
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 82
	.data1 96
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 232
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 132
	.data1 242
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 236
	.data1 255
	.data1 255
	.data1 230
	.data1 255
	.data1 255
	.data1 255
	.data1 216
	.data1 170
	.data1 255
	.data1 146
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 164
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 194
	.data1 255
	.data1 206
	.data1 234
	.data1 255
	.data1 190
	.data1 50
	.data1 244
	.data1 170
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 246
	.data1 255
	.data1 255
	.data1 255
	.data1 104
	.data1 255
	.data1 255
	.data1 255
	.data1 242
	.data1 255
	.data1 156
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 226
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 202
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 214
	.data1 198
	.data1 252
	.data1 255
	.data1 76
	.data1 255
	.data1 255
	.data1 255
	.data1 178
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 224
	.data1 118
	.data1 255
	.data1 132
	.data1 255
	.data1 255
	.data1 255
	.data1 190
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 86
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 140
	.data1 255
	.data1 190
	.data1 255
	.data1 255
	.data1 255
	.data1 132
	.data1 255
	.data1 255
	.data1 255
	.data1 104
	.data1 255
	.data1 255
	.data1 255
	.data1 208
	.data1 238
	.data1 226
	.data1 224
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 128
	.data1 34
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 250
	.data1 255
	.data1 255
	.data1 220
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 176
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 24
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 210
	.data1 255
	.data1 238
	.data1 100
	.data1 255
	.data1 255
	.data1 255
	.data1 228
	.data1 255
	.data1 106
	.data1 255
	.data1 255
	.data1 255
	.data1 168
	.data1 255
	.data1 255
	.data1 255
	.data1 62
	.data1 255
	.data1 255
	.data1 28
	.data1 255
	.data1 255
	.data1 255
	.data1 166
	.data1 255
	.data1 194
	.data1 120
	.data1 146
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 130
	.data1 255
	.data1 120
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 216
	.data1 255
	.data1 255
	.data1 88
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 100
	.data1 232
	.data1 204
	.data1 255
	.data1 88
	.data1 196
	.data1 174
	.data1 255
	.data1 255
	.data1 255
	.data1 186
	.data1 255
	.data1 108
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 216
	.data1 162
	.data1 255
	.data1 142
	.data1 86
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 186
	.data1 255
	.data1 148
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 100
	.data1 255
	.data1 244
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 252
	.data1 255
	.data1 255
	.data1 255
	.data1 110
	.data1 255
	.data1 255
	.data1 160
	.data1 196
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 94
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 232
	.data1 174
	.data1 255
	.data1 196
	.data1 178
	.data1 244
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 104
	.data1 255
	.data1 255
	.data1 255
	.data1 150
	.data1 255
	.data1 255
	.data1 240
	.data1 255
	.data1 64
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 66
	.data1 255
	.data1 234
	.data1 255
	.data1 255
	.data1 255
	.data1 112
	.data1 255
	.data1 255
	.data1 236
	.data1 255
	.data1 106
	.data1 255
	.data1 128
	.data1 200
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 172
	.data1 255
	.data1 255
	.data1 255
	.data1 248
	.data1 220
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 180
	.data1 255
	.data1 255
	.data1 90
	.data1 255
	.data1 255
	.data1 226
	.data1 255
	.data1 255
	.data1 255
	.data1 212
	.data1 255
	.data1 255
	.data1 255
	.data1 50
	.data1 204
	.data1 232
	.data1 140
	.data1 255
	.data1 224
	.data1 255
	.data1 132
	.data1 255
	.data1 208
	.data1 255
	.data1 255
	.data1 255
	.data1 190
	.data1 158
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 226
	.data1 255
	.data1 236
	.data1 255
	.data1 116
	.data1 255
	.data1 255
	.data1 255
	.data1 126
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 152
	.data1 255
	.data1 114
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 210
	.data1 202
	.data1 255
	.data1 255
	.data1 255
	.data1 144
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 128
	.data1 255
	.data1 198
	.data1 255
	.data1 252
	.data1 104
	.data1 226
	.data1 190
	.data1 255
	.data1 136
	.data1 255
	.data1 255
	.data1 255
	.data1 204
	.data1 255
	.data1 106
	.data1 255
	.data1 66
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 144
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 58
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 154
	.data1 52
	.data1 255
	.data1 254
	.data1 255
	.data1 255
	.data1 255
	.data1 192
	.data1 118
	.data1 224
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 132
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 132
	.data1 255
	.data1 255
	.data1 255
	.data1 234
	.data1 255
	.data1 152
	.data1 255
	.data1 206
	.data1 232
	.data1 255
	.data1 255
	.data1 250
	.data1 214
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 98

	.section	.data
.str1::                                 ## @.str1
	.data1 111
	.data1 117
	.data1 116
	.data1 58
	.data1 32
	.data1 37
	.data1 100
	.data1 44
	.data1 32
	.data1 111
	.data1 117
	.data1 116
	.data1 95
	.data1 99
	.data1 111
	.data1 109
	.data1 112
	.data1 58
	.data1 32
	.data1 37
	.data1 100
	.data1 44
	.data1 32
	.data1 105
	.data1 110
	.data1 100
	.data1 105
	.data1 99
	.data1 101
	.data1 58
	.data1 32
	.data1 37
	.data1 100
	.data1 10
	.data1 0

	.section	.data
	.align	2                       ## @str
str::
	.data1 45
	.data1 49
	.data1 0

	.align	2                       ## @str3
str3::
	.data1 54
	.data1 54
	.data1 54
	.data1 0


.import printf
.type printf, @function
.import puts
.type puts, @function
