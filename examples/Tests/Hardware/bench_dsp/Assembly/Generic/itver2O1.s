.section .text
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-2080, arg() ## @itver2
itver2::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -2080
;;
	c0	stw 2076[$r0.1] = $r0.57
	c0	zxth $r0.11 = $r0.3
;;
	c0	cmpne $b0.0 = $r0.11, 0
;;
;;
	c0	brf $b0.0, LBB0_1
;;
## BB#2:                                ## %for.body.preheader
	c0	add $r0.12 = $r0.4, 4
	c0	add $r0.13 = $r0.4, 1020
	c0	mov $r0.14 = 0
	c0	mov $r0.15 = zsin2_fixed
	c0	mov $r0.16 = zcos2_fixed
;;
	c0	mov $r0.17 = 1
	c0	mov $r0.19 = 16
	c0	mov $r0.20 = bitrev
	c0	mov $r0.21 = 256
	c0	add $r0.22 = $r0.1, 1052
;;
	c0	add $r0.18 = $r0.1, 28
	c0	mov $r0.23 = 15
;;
LBB0_3::                                ## %for.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.24 = -4[$r0.12]
	c0	add $r0.25 = $r0.15, $r0.14
	c0	add $r0.26 = $r0.16, $r0.14
;;
	c0	ldw $r0.27 = -4[$r0.13]
;;
	c0	zxth $r0.28 = $r0.24
	c0	ldw $r0.25 = 0[$r0.25]
;;
	c0	shr $r0.24 = $r0.24, $r0.19
	c0	shr $r0.29 = $r0.27, $r0.19
	c0	add $r0.30 = $r0.20, $r0.14
;;
	c0	zxth $r0.27 = $r0.27
	c0	ldw $r0.31 = 0[$r0.12]
	c0	zxth $r0.32 = $r0.25
;;
	c0	shr $r0.25 = $r0.25, $r0.19
	c0	mpyhs $r0.33 = $r0.24, $r0.32
	c0	mpylu $r0.34 = $r0.24, $r0.32
	c0	ldw $r0.26 = 0[$r0.26]
;;
	c0	mpylu $r0.35 = $r0.28, $r0.25
	c0	mpyhs $r0.36 = $r0.28, $r0.25
	c0	shl $r0.37 = $r0.25, $r0.17
	c0	shr $r0.38 = $r0.31, $r0.19
;;
	c0	zxth $r0.31 = $r0.31
	c0	mpylu $r0.39 = $r0.37, $r0.24
	c0	mpyhs $r0.40 = $r0.37, $r0.24
	c0	add $r0.33 = $r0.34, $r0.33
;;
	c0	mpylu $r0.34 = $r0.38, $r0.32
	c0	mpyhs $r0.41 = $r0.38, $r0.32
	c0	ldw $r0.42 = 0[$r0.13]
	c0	add $r0.35 = $r0.35, $r0.36
;;
	c0	zxth $r0.36 = $r0.26
;;
	c0	mpyhs $r0.43 = $r0.29, $r0.36
	c0	mpyhs $r0.44 = $r0.24, $r0.36
	c0	mpylu $r0.45 = $r0.29, $r0.36
	c0	mpylu $r0.46 = $r0.24, $r0.36
	c0	add $r0.39 = $r0.39, $r0.40
	c0	shr $r0.33 = $r0.33, $r0.23
	c0	add $r0.34 = $r0.34, $r0.41
	c0	shr $r0.35 = $r0.35, $r0.23
;;
	c0	mpylu $r0.40 = $r0.37, $r0.38
	c0	mpylu $r0.41 = $r0.29, $r0.32
;;
	c0	mpyhs $r0.37 = $r0.37, $r0.38
	c0	mpyhs $r0.47 = $r0.29, $r0.32
	c0	add $r0.33 = $r0.39, $r0.33
;;
	c0	add $r0.39 = $r0.45, $r0.43
;;
	c0	add $r0.43 = $r0.46, $r0.44
	c0	shr $r0.34 = $r0.34, $r0.23
;;
	c0	mpylu $r0.44 = $r0.31, $r0.25
	c0	mpyhs $r0.45 = $r0.31, $r0.25
	c0	mpyhs $r0.46 = $r0.27, $r0.25
	c0	mpyhs $r0.48 = $r0.38, $r0.36
	c0	add $r0.41 = $r0.41, $r0.47
	c0	add $r0.33 = $r0.33, $r0.35
;;
	c0	shr $r0.35 = $r0.43, $r0.23
	c0	shr $r0.39 = $r0.39, $r0.23
;;
	c0	mpylu $r0.43 = $r0.38, $r0.36
	c0	mpylu $r0.47 = $r0.27, $r0.25
	c0	add $r0.44 = $r0.44, $r0.45
;;
	c0	mpyhs $r0.45 = $r0.29, $r0.25
	c0	add $r0.37 = $r0.40, $r0.37
;;
	c0	mpylu $r0.40 = $r0.29, $r0.25
	c0	sub $r0.33 = $r0.39, $r0.33
;;
	c0	shr $r0.39 = $r0.41, $r0.23
;;
	c0	add $r0.41 = $r0.43, $r0.48
;;
	c0	add $r0.43 = $r0.47, $r0.46
	c0	shr $r0.44 = $r0.44, $r0.23
	c0	add $r0.34 = $r0.37, $r0.34
;;
	c0	shr $r0.37 = $r0.42, $r0.19
	c0	add $r0.40 = $r0.40, $r0.45
	c0	shr $r0.26 = $r0.26, $r0.19
;;
	c0	zxth $r0.42 = $r0.42
	c0	mpylu $r0.45 = $r0.28, $r0.26
;;
	c0	mpyhs $r0.28 = $r0.28, $r0.26
	c0	mpylu $r0.46 = $r0.37, $r0.36
	c0	mpylu $r0.47 = $r0.27, $r0.26
	c0	shl $r0.48 = $r0.26, $r0.17
	c0	shr $r0.41 = $r0.41, $r0.23
	c0	shr $r0.43 = $r0.43, $r0.23
	c0	add $r0.34 = $r0.34, $r0.44
;;
	c0	mpylu $r0.44 = $r0.48, $r0.29
	c0	mpyhs $r0.27 = $r0.27, $r0.26
;;
	c0	mpyhs $r0.29 = $r0.48, $r0.29
	c0	add $r0.28 = $r0.45, $r0.28
	c0	mpyhs $r0.36 = $r0.37, $r0.36
	c0	ldh $r0.30 = 0[$r0.30]
;;
	c0	mpylu $r0.45 = $r0.31, $r0.26
;;
	c0	mpyhs $r0.31 = $r0.31, $r0.26
	c0	mpylu $r0.49 = $r0.37, $r0.32
	c0	shr $r0.28 = $r0.28, $r0.23
	c0	mpylu $r0.50 = $r0.24, $r0.26
	c0	add $r0.29 = $r0.44, $r0.29
	c0	add $r0.27 = $r0.47, $r0.27
	c0	add $r0.36 = $r0.46, $r0.36
;;
	c0	mpyhs $r0.24 = $r0.24, $r0.26
	c0	mpyhs $r0.32 = $r0.37, $r0.32
	c0	mpyhs $r0.44 = $r0.42, $r0.25
	c0	mpyhs $r0.46 = $r0.48, $r0.37
;;
	c0	add $r0.31 = $r0.45, $r0.31
	c0	add $r0.28 = $r0.28, $r0.35
;;
	c0	shr $r0.35 = $r0.36, $r0.23
	c0	add $r0.29 = $r0.33, $r0.29
;;
	c0	mpylu $r0.33 = $r0.42, $r0.25
	c0	mpyhs $r0.36 = $r0.42, $r0.26
	c0	mpylu $r0.45 = $r0.48, $r0.37
;;
	c0	mpylu $r0.42 = $r0.42, $r0.26
	c0	add $r0.24 = $r0.50, $r0.24
	c0	add $r0.28 = $r0.28, $r0.39
	c0	add $r0.32 = $r0.49, $r0.32
	c0	shr $r0.27 = $r0.27, $r0.23
	c0	shr $r0.31 = $r0.31, $r0.23
;;
	c0	mpylu $r0.39 = $r0.37, $r0.25
	c0	mpylu $r0.47 = $r0.38, $r0.26
;;
	c0	mpyhs $r0.25 = $r0.37, $r0.25
	c0	mpyhs $r0.26 = $r0.38, $r0.26
;;
	c0	add $r0.37 = $r0.45, $r0.46
	c0	add $r0.24 = $r0.40, $r0.24
	c0	sh2add $r0.38 = $r0.30, $r0.22
	c0	add $r0.28 = $r0.28, $r0.43
	c0	add $r0.27 = $r0.29, $r0.27
;;
	c0	sub $r0.29 = $r0.35, $r0.34
	c0	shr $r0.32 = $r0.32, $r0.23
	c0	add $r0.33 = $r0.33, $r0.44
	c0	add $r0.31 = $r0.31, $r0.41
;;
	c0	add $r0.34 = $r0.42, $r0.36
	c0	sh2add $r0.35 = $r0.30, $r0.21
	c0	stw 0[$r0.38] = $r0.27
	c0	add $r0.25 = $r0.39, $r0.25
;;
	c0	add $r0.27 = $r0.18, $r0.35
	c0	add $r0.26 = $r0.47, $r0.26
	c0	sh1add $r0.24 = $r0.24, $r0.28
;;
	c0	add $r0.28 = $r0.31, $r0.32
;;
	c0	shr $r0.31 = $r0.34, $r0.23
	c0	shr $r0.32 = $r0.33, $r0.23
	c0	add $r0.29 = $r0.29, $r0.37
	c0	stw 0[$r0.27] = $r0.24
;;
	c0	add $r0.24 = $r0.25, $r0.26
;;
	c0	add $r0.25 = $r0.22, $r0.35
	c0	add $r0.26 = $r0.28, $r0.32
	c0	sh2add $r0.27 = $r0.30, $r0.18
	c0	add $r0.14 = $r0.14, 4
	c0	add $r0.13 = $r0.13, -16
;;
	c0	add $r0.28 = $r0.29, $r0.31
	c0	sh1add $r0.24 = $r0.24, $r0.26
	c0	cmpeq $b0.0 = $r0.14, 256
	c0	add $r0.12 = $r0.12, 16
;;
	c0	stw 0[$r0.25] = $r0.28
;;
	c0	stw 0[$r0.27] = $r0.24
	c0	brf $b0.0, LBB0_3
;;
## BB#5:                                ## %if.end.loopexit
	c0	mov $r0.22 = 64
	c0	mov $r0.13 = 3
	c0	mov $r0.16 = 2
	c0	add $r0.17 = $r0.18, 256
	c0	goto LBB0_7
;;
LBB0_1::                                ## %for.body170.preheader
	c0	add $r0.12 = $r0.4, 1020
	c0	mov $r0.13 = 0
	c0	mov $r0.14 = bitrev
	c0	mov $r0.15 = zcos1_fixed
;;
	c0	mov $r0.18 = zsin1_fixed
	c0	mov $r0.19 = 16
	c0	mov $r0.16 = 1
	c0	mov $r0.20 = 15
	c0	add $r0.21 = $r0.1, 1052
	c0	add $r0.17 = $r0.1, 28
;;
	c0	mov $r0.22 = $r0.4
;;
LBB0_4::                                ## %for.body170
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.23 = $r0.15, $r0.13
	c0	ldw $r0.24 = 0[$r0.12]
	c0	add $r0.25 = $r0.18, $r0.13
;;
	c0	ldw $r0.23 = 0[$r0.23]
;;
	c0	zxth $r0.26 = $r0.24
	c0	ldw $r0.25 = 0[$r0.25]
;;
	c0	zxth $r0.27 = $r0.23
	c0	shr $r0.24 = $r0.24, $r0.19
;;
	c0	shr $r0.23 = $r0.23, $r0.19
	c0	mpylu $r0.28 = $r0.27, $r0.24
	c0	mpyhs $r0.29 = $r0.27, $r0.24
;;
	c0	mpylu $r0.30 = $r0.24, $r0.23
	c0	mpyhs $r0.31 = $r0.23, $r0.26
	c0	ldw $r0.32 = 0[$r0.22]
	c0	zxth $r0.33 = $r0.25
;;
	c0	shr $r0.25 = $r0.25, $r0.19
	c0	mpylu $r0.34 = $r0.23, $r0.26
	c0	mpyhs $r0.35 = $r0.24, $r0.23
	c0	add $r0.28 = $r0.28, $r0.29
;;
	c0	mpyhs $r0.29 = $r0.33, $r0.24
	c0	mpylu $r0.36 = $r0.33, $r0.24
	c0	zxth $r0.37 = $r0.32
;;
	c0	shr $r0.32 = $r0.32, $r0.19
	c0	ldh $r0.38 = 0[$r0.14]
;;
	c0	mpyhs $r0.39 = $r0.33, $r0.32
	c0	mpylu $r0.40 = $r0.23, $r0.37
;;
	c0	mpylu $r0.33 = $r0.33, $r0.32
	c0	mpyhs $r0.41 = $r0.23, $r0.37
	c0	add $r0.31 = $r0.34, $r0.31
	c0	shr $r0.28 = $r0.28, $r0.20
	c0	add $r0.30 = $r0.30, $r0.35
	c0	add $r0.29 = $r0.36, $r0.29
;;
	c0	mpylu $r0.34 = $r0.27, $r0.32
;;
	c0	mpyhs $r0.27 = $r0.27, $r0.32
	c0	mpylu $r0.35 = $r0.32, $r0.25
	c0	mpyhs $r0.36 = $r0.32, $r0.25
	c0	add $r0.33 = $r0.33, $r0.39
	c0	shr $r0.31 = $r0.31, $r0.20
;;
	c0	add $r0.39 = $r0.40, $r0.41
	c0	sh1add $r0.28 = $r0.30, $r0.28
;;
	c0	add $r0.27 = $r0.34, $r0.27
	c0	mpylu $r0.30 = $r0.25, $r0.26
;;
	c0	mpyhs $r0.34 = $r0.25, $r0.37
	c0	mpyhs $r0.26 = $r0.25, $r0.26
;;
	c0	mpylu $r0.37 = $r0.25, $r0.37
	c0	add $r0.28 = $r0.28, $r0.31
;;
	c0	shr $r0.31 = $r0.39, $r0.20
	c0	shr $r0.33 = $r0.33, $r0.20
	c0	shr $r0.27 = $r0.27, $r0.20
;;
	c0	mpylu $r0.39 = $r0.25, $r0.24
	c0	mpyhs $r0.40 = $r0.23, $r0.32
;;
	c0	mpyhs $r0.24 = $r0.25, $r0.24
	c0	mpylu $r0.23 = $r0.23, $r0.32
;;
	c0	add $r0.25 = $r0.35, $r0.36
	c0	add $r0.26 = $r0.30, $r0.26
	c0	shr $r0.29 = $r0.29, $r0.20
;;
	c0	shl $r0.25 = $r0.25, $r0.16
	c0	add $r0.27 = $r0.31, $r0.27
	c0	sub $r0.28 = $r0.28, $r0.33
	c0	add $r0.30 = $r0.37, $r0.34
	c0	shr $r0.26 = $r0.26, $r0.20
	c0	add $r0.24 = $r0.39, $r0.24
	c0	add $r0.23 = $r0.23, $r0.40
;;
	c0	sh2add $r0.31 = $r0.38, $r0.21
	c0	sub $r0.25 = $r0.28, $r0.25
	c0	add $r0.27 = $r0.27, $r0.29
;;
	c0	shr $r0.28 = $r0.30, $r0.20
	c0	add $r0.23 = $r0.24, $r0.23
	c0	add $r0.13 = $r0.13, 4
;;
	c0	add $r0.24 = $r0.27, $r0.26
	c0	sub $r0.25 = $r0.25, $r0.28
;;
	c0	sh2add $r0.26 = $r0.38, $r0.17
	c0	add $r0.22 = $r0.22, 8
	c0	cmpeq $b0.0 = $r0.13, 512
	c0	add $r0.14 = $r0.14, 2
	c0	add $r0.12 = $r0.12, -8
	c0	stw 0[$r0.31] = $r0.25
	c0	sh1add $r0.23 = $r0.23, $r0.24
;;
	c0	stw 0[$r0.26] = $r0.23
;;
	c0	brf $b0.0, LBB0_4
;;
## BB#6:                                ## %if.end.loopexit1238
	c0	mov $r0.22 = 128
	c0	mov $r0.13 = 4
;;
LBB0_7::                                ## %if.end
	c0	mpyhs $r0.15 = $r0.22, $r0.16
	c0	mpylu $r0.18 = $r0.22, $r0.16
	c0	add $r0.19 = $r0.13, 1
	c0	add $r0.14 = $r0.13, 2
	c0	mov $r0.12 = 16
;;
;;
	c0	add $r0.18 = $r0.18, $r0.15
;;
	c0	shl $r0.15 = $r0.19, $r0.14
	c0	cmpeq $b0.0 = $r0.18, 0
;;
;;
	c0	br $b0.0, LBB0_10
;;
## BB#8:                                ## %for.body288.lr.ph
	c0	add $r0.19 = $r0.1, 1052
;;
	c0	sh2add $r0.20 = $r0.22, $r0.19
	c0	mov $r0.26 = 0
	c0	mov $r0.21 = 4
	c0	mov $r0.23 = 8
	c0	add $r0.24 = $r0.1, 28
	c0	mov $r0.25 = 12
;;
LBB0_9::                                ## %for.body288
                                        ## =>This Inner Loop Header: Depth=1
	c0	cmpge $b0.0 = $r0.26, $r0.22
;;
;;
	c0	slct $r0.27 = $b0.0, $r0.22, 0
;;
	c0	sub $r0.27 = $r0.26, $r0.27
	c0	slct $r0.19 = $b0.0, $r0.20, $r0.19
	c0	slct $r0.17 = $b0.0, $r0.24, $r0.17
;;
	c0	sxth $r0.27 = $r0.27
;;
	c0	sh2add $r0.28 = $r0.27, $r0.21
	c0	sh2add $r0.29 = $r0.27, $r0.19
	c0	sh2add $r0.30 = $r0.27, $r0.23
	c0	sh2add $r0.31 = $r0.27, $r0.25
;;
	c0	sh2add $r0.27 = $r0.27, $r0.17
	c0	shl $r0.26 = $r0.26, $r0.12
	c0	add $r0.32 = $r0.19, $r0.28
;;
	c0	add $r0.28 = $r0.17, $r0.28
	c0	add $r0.33 = $r0.19, $r0.30
;;
	c0	add $r0.30 = $r0.17, $r0.30
	c0	add $r0.34 = $r0.19, $r0.31
	c0	ldw $r0.35 = 0[$r0.29]
;;
	c0	add $r0.31 = $r0.17, $r0.31
	c0	add $r0.26 = $r0.26, 262144
	c0	ldw $r0.36 = 0[$r0.32]
;;
	c0	shr $r0.26 = $r0.26, $r0.12
;;
	c0	add $r0.37 = $r0.36, $r0.35
	c0	ldw $r0.38 = 0[$r0.28]
;;
	c0	sub $r0.35 = $r0.35, $r0.36
;;
	c0	ldw $r0.36 = 0[$r0.27]
	c0	cmplt $b0.0 = $r0.26, $r0.18
;;
;;
	c0	add $r0.39 = $r0.38, $r0.36
	c0	ldw $r0.40 = 0[$r0.33]
;;
	c0	sub $r0.36 = $r0.36, $r0.38
;;
	c0	add $r0.38 = $r0.40, $r0.37
	c0	ldw $r0.41 = 0[$r0.30]
	c0	add $r0.42 = $r0.36, $r0.40
;;
	c0	sub $r0.37 = $r0.37, $r0.40
	c0	sub $r0.36 = $r0.36, $r0.40
;;
	c0	add $r0.40 = $r0.41, $r0.39
	c0	ldw $r0.43 = 0[$r0.34]
	c0	sub $r0.44 = $r0.35, $r0.41
;;
	c0	sub $r0.39 = $r0.39, $r0.41
	c0	add $r0.35 = $r0.41, $r0.35
;;
	c0	add $r0.38 = $r0.38, $r0.43
	c0	ldw $r0.41 = 0[$r0.31]
;;
	c0	stw 0[$r0.29] = $r0.38
;;
	c0	add $r0.29 = $r0.40, $r0.41
	c0	add $r0.38 = $r0.44, $r0.41
;;
	c0	sub $r0.40 = $r0.42, $r0.43
	c0	sub $r0.37 = $r0.37, $r0.43
	c0	sub $r0.39 = $r0.39, $r0.41
	c0	sub $r0.35 = $r0.35, $r0.41
	c0	add $r0.36 = $r0.36, $r0.43
	c0	stw 0[$r0.27] = $r0.29
;;
	c0	stw 0[$r0.32] = $r0.38
;;
	c0	stw 0[$r0.28] = $r0.40
;;
	c0	stw 0[$r0.33] = $r0.37
;;
	c0	stw 0[$r0.30] = $r0.39
;;
	c0	stw 0[$r0.34] = $r0.35
;;
	c0	stw 0[$r0.31] = $r0.36
	c0	br $b0.0, LBB0_9
;;
LBB0_10::                               ## %for.end392
	c0	mpyhs $r0.17 = $r0.15, $r0.16
	c0	mpylu $r0.18 = $r0.15, $r0.16
;;
;;
	c0	add $r0.17 = $r0.18, $r0.17
;;
	c0	cmpeq $b0.0 = $r0.17, 0
;;
;;
	c0	br $b0.0, LBB0_13
;;
## BB#11:                               ## %for.body409.lr.ph
	c0	xor $r0.18 = $r0.13, 15
	c0	mov $r0.19 = 13
	c0	mov $r0.20 = 32767
;;
	c0	sub $r0.19 = $r0.19, $r0.13
	c0	shru $r0.21 = $r0.20, $r0.18
;;
	c0	shru $r0.18 = $r0.20, $r0.19
;;
	c0	shl $r0.20 = $r0.21, $r0.12
	c0	sxth $r0.19 = $r0.21
	c0	cmpeq $b0.0 = $r0.16, 2
	c0	cmpeq $b0.1 = $r0.11, 0
;;
	c0	add $r0.16 = $r0.1, 28
;;
	c0	sh2add $r0.21 = $r0.22, $r0.16
	c0	xor $r0.23 = $r0.20, -1
;;
	c0	slct $r0.20 = $b0.1, $r0.16, $r0.21
;;
	c0	shr $r0.21 = $r0.23, $r0.12
;;
	c0	add $r0.23 = $r0.1, 1052
	c0	mfb $r0.24 = $b0.0
;;
	c0	sh2add $r0.22 = $r0.22, $r0.23
	c0	mov $r0.25 = 0
	c0	mov $r0.26 = 4
	c0	mov $r0.27 = xcos_fixed
	c0	mov $r0.28 = xsin_fixed
	c0	mov $r0.29 = 1
;;
	c0	mov $r0.30 = 15
;;
LBB0_12::                               ## %for.body409
                                        ## =>This Inner Loop Header: Depth=1
	c0	cmpgeu $b0.0 = $r0.25, $r0.15
;;
;;
	c0	slct $r0.31 = $b0.0, $r0.15, 0
;;
	c0	sub $r0.31 = $r0.25, $r0.31
;;
	c0	and $r0.32 = $r0.31, $r0.18
;;
	c0	shru $r0.31 = $r0.31, $r0.14
;;
	c0	shr $r0.33 = $r0.19, $r0.31
	c0	sub $r0.34 = $r0.13, $r0.31
	c0	add $r0.35 = $r0.31, 3
	c0	sxth $r0.32 = $r0.32
	c0	shr $r0.36 = $r0.21, $r0.31
;;
	c0	shl $r0.31 = $r0.26, $r0.31
	c0	slct $r0.23 = $b0.0, $r0.22, $r0.23
	c0	and $r0.33 = $r0.32, $r0.33
	c0	shr $r0.34 = $r0.32, $r0.34
;;
	c0	and $r0.32 = $r0.32, $r0.36
	c0	shl $r0.33 = $r0.33, $r0.35
;;
	c0	shl $r0.32 = $r0.32, $r0.24
	c0	slct $r0.20 = $b0.0, $r0.16, $r0.20
	c0	add $r0.33 = $r0.33, $r0.34
;;
	c0	sxth $r0.32 = $r0.32
;;
	c0	sh2add $r0.34 = $r0.32, $r0.27
	c0	sxth $r0.33 = $r0.33
;;
	c0	sh2add $r0.32 = $r0.32, $r0.28
	c0	add $r0.31 = $r0.33, $r0.31
	c0	ldw $r0.34 = 0[$r0.34]
	c0	sh2add $r0.35 = $r0.33, $r0.23
;;
	c0	sh2add $r0.33 = $r0.33, $r0.20
	c0	sxth $r0.31 = $r0.31
	c0	ldw $r0.32 = 0[$r0.32]
;;
	c0	shr $r0.36 = $r0.34, $r0.12
;;
	c0	zxth $r0.34 = $r0.34
	c0	sh2add $r0.37 = $r0.31, $r0.23
;;
	c0	sh2add $r0.31 = $r0.31, $r0.20
	c0	shl $r0.38 = $r0.36, $r0.29
	c0	shr $r0.39 = $r0.32, $r0.12
;;
	c0	zxth $r0.32 = $r0.32
	c0	ldw $r0.40 = 0[$r0.35]
	c0	add $r0.25 = $r0.25, 1
;;
	c0	ldw $r0.41 = 0[$r0.37]
	c0	shl $r0.42 = $r0.39, $r0.29
;;
	c0	ldw $r0.43 = 0[$r0.31]
;;
	c0	shr $r0.44 = $r0.41, $r0.12
;;
	c0	zxth $r0.41 = $r0.41
	c0	mpylu $r0.45 = $r0.44, $r0.34
	c0	mpyhs $r0.46 = $r0.44, $r0.34
	c0	mpylu $r0.47 = $r0.44, $r0.32
;;
	c0	mpyhs $r0.48 = $r0.41, $r0.36
	c0	shr $r0.49 = $r0.43, $r0.12
;;
	c0	zxth $r0.43 = $r0.43
	c0	ldw $r0.50 = 0[$r0.33]
	c0	mpylu $r0.51 = $r0.41, $r0.36
	c0	mpylu $r0.52 = $r0.49, $r0.32
	c0	mpylu $r0.53 = $r0.38, $r0.44
	c0	mpyhs $r0.54 = $r0.49, $r0.32
	c0	add $r0.45 = $r0.45, $r0.46
;;
	c0	mpyhs $r0.46 = $r0.38, $r0.44
	c0	mpyhs $r0.32 = $r0.44, $r0.32
	c0	mpylu $r0.55 = $r0.43, $r0.39
	c0	mpylu $r0.56 = $r0.42, $r0.44
;;
	c0	add $r0.48 = $r0.51, $r0.48
	c0	shr $r0.45 = $r0.45, $r0.30
;;
	c0	add $r0.51 = $r0.52, $r0.54
;;
	c0	mpyhs $r0.52 = $r0.49, $r0.34
	c0	mpyhs $r0.54 = $r0.43, $r0.39
;;
	c0	mpylu $r0.34 = $r0.49, $r0.34
	c0	mpylu $r0.57 = $r0.41, $r0.39
	c0	add $r0.32 = $r0.47, $r0.32
	c0	add $r0.46 = $r0.53, $r0.46
;;
	c0	shr $r0.47 = $r0.51, $r0.30
	c0	shr $r0.48 = $r0.48, $r0.30
;;
	c0	mpylu $r0.51 = $r0.42, $r0.49
	c0	mpyhs $r0.44 = $r0.42, $r0.44
;;
	c0	mpyhs $r0.42 = $r0.42, $r0.49
	c0	mpyhs $r0.39 = $r0.41, $r0.39
;;
	c0	add $r0.41 = $r0.46, $r0.45
	c0	add $r0.34 = $r0.34, $r0.52
;;
	c0	add $r0.45 = $r0.55, $r0.54
	c0	shr $r0.32 = $r0.32, $r0.30
	c0	mpyhs $r0.46 = $r0.43, $r0.36
	c0	mpyhs $r0.52 = $r0.38, $r0.49
;;
	c0	mpylu $r0.36 = $r0.43, $r0.36
	c0	mpylu $r0.38 = $r0.38, $r0.49
;;
	c0	add $r0.43 = $r0.56, $r0.44
	c0	add $r0.42 = $r0.51, $r0.42
	c0	add $r0.39 = $r0.57, $r0.39
;;
	c0	shr $r0.44 = $r0.45, $r0.30
	c0	add $r0.36 = $r0.36, $r0.46
	c0	add $r0.42 = $r0.42, $r0.47
	c0	add $r0.32 = $r0.43, $r0.32
	c0	add $r0.38 = $r0.38, $r0.52
	c0	shr $r0.39 = $r0.39, $r0.30
	c0	shr $r0.34 = $r0.34, $r0.30
	c0	add $r0.41 = $r0.41, $r0.48
;;
	c0	shr $r0.36 = $r0.36, $r0.30
	c0	sub $r0.43 = $r0.40, $r0.41
	c0	add $r0.34 = $r0.38, $r0.34
;;
	c0	add $r0.38 = $r0.42, $r0.44
	c0	add $r0.32 = $r0.32, $r0.39
;;
	c0	add $r0.39 = $r0.41, $r0.40
;;
	c0	add $r0.40 = $r0.43, $r0.38
	c0	sub $r0.41 = $r0.50, $r0.32
	c0	add $r0.34 = $r0.34, $r0.36
;;
	c0	sub $r0.36 = $r0.39, $r0.38
	c0	add $r0.32 = $r0.32, $r0.50
	c0	cmpne $b0.0 = $r0.17, $r0.25
	c0	stw 0[$r0.35] = $r0.40
;;
	c0	sub $r0.35 = $r0.41, $r0.34
	c0	add $r0.32 = $r0.32, $r0.34
;;
	c0	stw 0[$r0.33] = $r0.35
;;
	c0	stw 0[$r0.37] = $r0.36
;;
	c0	stw 0[$r0.31] = $r0.32
	c0	br $b0.0, LBB0_12
;;
LBB0_13::                               ## %for.end579
	c0	mov $r0.13 = 0
	c0	cmpeq $b0.0 = $r0.11, 0
;;
	c0	mov $r0.11 = $r0.13
	c0	mov $r0.14 = $r0.13
;;
	c0	br $b0.0, LBB0_15
;;
LBB0_14::                               ## %for.body586
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.14 = $r0.1, 1052
	c0	mov $r0.15 = zcos2_fixed
	c0	mov $r0.16 = zsin2_fixed
	c0	add $r0.17 = $r0.1, 28
	c0	mov $r0.18 = 1
;;
	c0	add $r0.19 = $r0.15, $r0.11
	c0	add $r0.14 = $r0.14, $r0.11
	c0	add $r0.16 = $r0.16, $r0.11
;;
	c0	add $r0.15 = $r0.17, $r0.11
;;
	c0	mov $r0.17 = 15
	c0	ldw $r0.19 = 0[$r0.19]
;;
	c0	ldw $r0.20 = 0[$r0.14]
;;
	c0	zxth $r0.21 = $r0.19
;;
	c0	shr $r0.19 = $r0.19, $r0.12
	c0	add $r0.11 = $r0.11, 4
;;
	c0	shl $r0.22 = $r0.19, $r0.18
	c0	ldw $r0.23 = 256[$r0.15]
	c0	shr $r0.24 = $r0.20, $r0.12
;;
	c0	zxth $r0.20 = $r0.20
	c0	mpylu $r0.25 = $r0.24, $r0.21
	c0	mpyhs $r0.26 = $r0.24, $r0.21
	c0	ldw $r0.27 = 256[$r0.14]
;;
	c0	mpyhs $r0.28 = $r0.20, $r0.19
	c0	mpylu $r0.29 = $r0.22, $r0.24
	c0	shr $r0.30 = $r0.23, $r0.12
;;
	c0	zxth $r0.23 = $r0.23
	c0	mpyhs $r0.31 = $r0.22, $r0.24
	c0	ldw $r0.16 = 0[$r0.16]
	c0	mpylu $r0.32 = $r0.20, $r0.19
	c0	add $r0.25 = $r0.25, $r0.26
;;
	c0	mpylu $r0.26 = $r0.30, $r0.21
	c0	mpyhs $r0.33 = $r0.30, $r0.21
	c0	shr $r0.34 = $r0.27, $r0.12
;;
	c0	zxth $r0.27 = $r0.27
	c0	mpyhs $r0.35 = $r0.34, $r0.21
	c0	mpylu $r0.36 = $r0.34, $r0.21
	c0	shr $r0.25 = $r0.25, $r0.17
;;
	c0	mpylu $r0.37 = $r0.27, $r0.19
	c0	ldw $r0.38 = 0[$r0.15]
	c0	mpyhs $r0.39 = $r0.27, $r0.19
	c0	add $r0.28 = $r0.32, $r0.28
	c0	add $r0.29 = $r0.29, $r0.31
;;
	c0	mpyhs $r0.31 = $r0.22, $r0.34
;;
	c0	mpylu $r0.22 = $r0.22, $r0.34
	c0	mpylu $r0.32 = $r0.23, $r0.19
	c0	add $r0.35 = $r0.36, $r0.35
	c0	add $r0.25 = $r0.29, $r0.25
;;
	c0	mpyhs $r0.29 = $r0.23, $r0.19
	c0	shr $r0.28 = $r0.28, $r0.17
	c0	add $r0.36 = $r0.37, $r0.39
;;
	c0	mpyhs $r0.37 = $r0.30, $r0.19
	c0	add $r0.25 = $r0.25, $r0.28
;;
	c0	mpylu $r0.28 = $r0.30, $r0.19
	c0	add $r0.26 = $r0.26, $r0.33
	c0	add $r0.22 = $r0.22, $r0.31
;;
	c0	shr $r0.31 = $r0.35, $r0.17
	c0	shr $r0.33 = $r0.36, $r0.17
;;
	c0	zxth $r0.35 = $r0.16
;;
	c0	mpyhs $r0.36 = $r0.30, $r0.35
	c0	mpyhs $r0.39 = $r0.24, $r0.35
	c0	mpylu $r0.40 = $r0.30, $r0.35
	c0	mpylu $r0.41 = $r0.24, $r0.35
	c0	add $r0.22 = $r0.22, $r0.31
	c0	add $r0.29 = $r0.32, $r0.29
	c0	shr $r0.26 = $r0.26, $r0.17
;;
	c0	shr $r0.31 = $r0.38, $r0.12
;;
	c0	add $r0.32 = $r0.40, $r0.36
;;
	c0	mpylu $r0.36 = $r0.31, $r0.35
	c0	add $r0.39 = $r0.41, $r0.39
	c0	mpyhs $r0.40 = $r0.31, $r0.35
;;
	c0	mpyhs $r0.41 = $r0.34, $r0.35
;;
	c0	mpylu $r0.35 = $r0.34, $r0.35
	c0	add $r0.28 = $r0.28, $r0.37
	c0	add $r0.22 = $r0.22, $r0.33
	c0	shr $r0.32 = $r0.32, $r0.17
;;
	c0	shr $r0.33 = $r0.39, $r0.17
	c0	mpylu $r0.37 = $r0.31, $r0.21
;;
	c0	mpyhs $r0.21 = $r0.31, $r0.21
	c0	add $r0.36 = $r0.36, $r0.40
	c0	add $r0.35 = $r0.35, $r0.41
	c0	mpyhs $r0.39 = $r0.31, $r0.19
	c0	shr $r0.16 = $r0.16, $r0.12
;;
	c0	mpylu $r0.40 = $r0.20, $r0.16
;;
	c0	mpyhs $r0.20 = $r0.20, $r0.16
	c0	mpyhs $r0.41 = $r0.23, $r0.16
	c0	mpylu $r0.42 = $r0.27, $r0.16
	c0	shl $r0.18 = $r0.16, $r0.18
	c0	sub $r0.25 = $r0.25, $r0.32
;;
	c0	shr $r0.32 = $r0.35, $r0.17
	c0	add $r0.21 = $r0.37, $r0.21
;;
	c0	mpylu $r0.35 = $r0.18, $r0.30
	c0	mpyhs $r0.27 = $r0.27, $r0.16
;;
	c0	mpyhs $r0.30 = $r0.18, $r0.30
	c0	add $r0.20 = $r0.40, $r0.20
	c0	mpylu $r0.23 = $r0.23, $r0.16
	c0	shr $r0.36 = $r0.36, $r0.17
	c0	shr $r0.29 = $r0.29, $r0.17
	c0	shr $r0.21 = $r0.21, $r0.17
	c0	mpyhs $r0.37 = $r0.24, $r0.16
;;
	c0	shr $r0.20 = $r0.20, $r0.17
	c0	mpylu $r0.24 = $r0.24, $r0.16
;;
	c0	add $r0.23 = $r0.23, $r0.41
	c0	add $r0.27 = $r0.42, $r0.27
	c0	mpyhs $r0.40 = $r0.18, $r0.31
	c0	add $r0.30 = $r0.35, $r0.30
;;
	c0	mpylu $r0.18 = $r0.18, $r0.31
	c0	add $r0.20 = $r0.20, $r0.33
	c0	shr $r0.23 = $r0.23, $r0.17
	c0	shr $r0.27 = $r0.27, $r0.17
	c0	sub $r0.25 = $r0.25, $r0.30
	c0	add $r0.24 = $r0.24, $r0.37
;;
	c0	mpylu $r0.30 = $r0.31, $r0.19
;;
	c0	mpyhs $r0.31 = $r0.34, $r0.16
	c0	mpylu $r0.33 = $r0.34, $r0.16
	c0	add $r0.20 = $r0.20, $r0.26
;;
	c0	add $r0.26 = $r0.27, $r0.32
	c0	sub $r0.23 = $r0.25, $r0.23
	c0	add $r0.18 = $r0.18, $r0.40
	c0	add $r0.24 = $r0.28, $r0.24
	c0	sub $r0.22 = $r0.22, $r0.36
;;
	c0	zxth $r0.25 = $r0.38
	c0	add $r0.27 = $r0.30, $r0.39
;;
	c0	mpylu $r0.28 = $r0.25, $r0.16
	c0	mpyhs $r0.30 = $r0.25, $r0.19
;;
	c0	mpyhs $r0.16 = $r0.25, $r0.16
	c0	mpylu $r0.19 = $r0.25, $r0.19
	c0	add $r0.20 = $r0.20, $r0.29
;;
	c0	add $r0.25 = $r0.33, $r0.31
	c0	sub $r0.18 = $r0.22, $r0.18
	c0	add $r0.21 = $r0.26, $r0.21
;;
	c0	add $r0.19 = $r0.19, $r0.30
	c0	add $r0.16 = $r0.28, $r0.16
	c0	sh1add $r0.20 = $r0.24, $r0.20
	c0	add $r0.22 = $r0.27, $r0.25
	c0	stw 0[$r0.14] = $r0.23
;;
	c0	shr $r0.16 = $r0.16, $r0.17
;;
	c0	shr $r0.17 = $r0.19, $r0.17
	c0	cmpeq $b0.0 = $r0.11, 256
	c0	stw 256[$r0.15] = $r0.20
;;
	c0	add $r0.17 = $r0.21, $r0.17
	c0	sub $r0.16 = $r0.18, $r0.16
;;
	c0	stw 256[$r0.14] = $r0.16
;;
	c0	sh1add $r0.14 = $r0.22, $r0.17
;;
	c0	stw 0[$r0.15] = $r0.14
	c0	br $b0.0, LBB0_16
;;
	c0	goto LBB0_14
;;
LBB0_15::                               ## %for.body751
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.11 = $r0.1, 1052
	c0	mov $r0.15 = zcos1_fixed
	c0	mov $r0.16 = zsin1_fixed
	c0	add $r0.17 = $r0.1, 28
	c0	mov $r0.18 = 1
;;
	c0	mov $r0.19 = 15
	c0	add $r0.15 = $r0.15, $r0.14
	c0	add $r0.11 = $r0.11, $r0.14
	c0	add $r0.16 = $r0.16, $r0.14
	c0	add $r0.17 = $r0.17, $r0.14
;;
	c0	add $r0.14 = $r0.14, 4
	c0	ldw $r0.15 = 0[$r0.15]
;;
	c0	ldw $r0.20 = 0[$r0.11]
;;
	c0	zxth $r0.21 = $r0.15
;;
	c0	shr $r0.15 = $r0.15, $r0.12
	c0	cmpne $b0.0 = $r0.14, 512
	c0	ldw $r0.22 = 0[$r0.17]
	c0	shr $r0.23 = $r0.20, $r0.12
;;
	c0	zxth $r0.20 = $r0.20
	c0	mpylu $r0.24 = $r0.21, $r0.23
	c0	mpyhs $r0.25 = $r0.21, $r0.23
	c0	ldw $r0.16 = 0[$r0.16]
;;
	c0	mpyhs $r0.26 = $r0.15, $r0.20
	c0	mpylu $r0.27 = $r0.23, $r0.15
	c0	zxth $r0.28 = $r0.22
;;
	c0	shr $r0.22 = $r0.22, $r0.12
	c0	mpyhs $r0.29 = $r0.23, $r0.15
	c0	mpylu $r0.30 = $r0.15, $r0.20
	c0	mpylu $r0.31 = $r0.15, $r0.28
;;
	c0	mpylu $r0.32 = $r0.21, $r0.22
	c0	add $r0.24 = $r0.24, $r0.25
;;
	c0	zxth $r0.25 = $r0.16
;;
	c0	shr $r0.16 = $r0.16, $r0.12
	c0	mpylu $r0.33 = $r0.25, $r0.22
	c0	mpyhs $r0.21 = $r0.21, $r0.22
	c0	mpyhs $r0.34 = $r0.25, $r0.22
	c0	mpyhs $r0.35 = $r0.15, $r0.28
	c0	add $r0.27 = $r0.27, $r0.29
	c0	add $r0.26 = $r0.30, $r0.26
	c0	shr $r0.24 = $r0.24, $r0.19
;;
	c0	mpylu $r0.29 = $r0.22, $r0.16
	c0	mpylu $r0.30 = $r0.25, $r0.23
	c0	mpyhs $r0.36 = $r0.22, $r0.16
;;
	c0	mpyhs $r0.25 = $r0.25, $r0.23
	c0	add $r0.33 = $r0.33, $r0.34
	c0	add $r0.31 = $r0.31, $r0.35
	c0	sh1add $r0.24 = $r0.27, $r0.24
	c0	add $r0.21 = $r0.32, $r0.21
;;
	c0	mpylu $r0.27 = $r0.16, $r0.28
	c0	mpyhs $r0.32 = $r0.16, $r0.20
;;
	c0	mpyhs $r0.28 = $r0.16, $r0.28
	c0	mpylu $r0.20 = $r0.16, $r0.20
	c0	shr $r0.26 = $r0.26, $r0.19
	c0	add $r0.29 = $r0.29, $r0.36
	c0	shr $r0.33 = $r0.33, $r0.19
	c0	shr $r0.21 = $r0.21, $r0.19
	c0	mpyhs $r0.34 = $r0.15, $r0.22
	c0	shr $r0.31 = $r0.31, $r0.19
;;
	c0	mpylu $r0.15 = $r0.15, $r0.22
;;
	c0	add $r0.22 = $r0.24, $r0.26
;;
	c0	mpyhs $r0.24 = $r0.16, $r0.23
	c0	add $r0.25 = $r0.30, $r0.25
;;
	c0	mpylu $r0.16 = $r0.16, $r0.23
	c0	add $r0.20 = $r0.20, $r0.32
	c0	shl $r0.18 = $r0.29, $r0.18
	c0	add $r0.21 = $r0.31, $r0.21
	c0	sub $r0.22 = $r0.22, $r0.33
;;
	c0	shr $r0.23 = $r0.25, $r0.19
;;
	c0	add $r0.25 = $r0.27, $r0.28
	c0	add $r0.15 = $r0.15, $r0.34
	c0	shr $r0.20 = $r0.20, $r0.19
	c0	add $r0.16 = $r0.16, $r0.24
;;
	c0	shr $r0.19 = $r0.25, $r0.19
	c0	add $r0.21 = $r0.21, $r0.23
	c0	sub $r0.18 = $r0.22, $r0.18
	c0	add $r0.15 = $r0.16, $r0.15
;;
	c0	add $r0.16 = $r0.21, $r0.20
	c0	sub $r0.18 = $r0.18, $r0.19
;;
	c0	stw 0[$r0.11] = $r0.18
;;
	c0	sh1add $r0.11 = $r0.15, $r0.16
;;
	c0	stw 0[$r0.17] = $r0.11
	c0	br $b0.0, LBB0_15
;;
LBB0_16::                               ## %for.body838
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.11 = $r0.1, 1052
;;
	c0	add $r0.11 = $r0.11, $r0.13
	c0	add $r0.12 = $r0.1, 28
	c0	add $r0.14 = $r0.4, $r0.13
	c0	add $r0.15 = $r0.13, 4
;;
	c0	add $r0.12 = $r0.12, $r0.13
	c0	ldw $r0.11 = 0[$r0.11]
	c0	cmpne $b0.0 = $r0.15, 512
;;
;;
	c0	stw 0[$r0.14] = $r0.11
;;
	c0	ldw $r0.11 = 0[$r0.12]
;;
;;
	c0	stw 512[$r0.14] = $r0.11
	c0	mov $r0.13 = $r0.15
	c0	br $b0.0, LBB0_16
;;
## BB#17:                               ## %for.end850
.return ret($r0.3:s32)
	c0	ldw $r0.57 = 2076[$r0.1]
	c0	return $r0.1 = $r0.1, 2080, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @main
main::
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
	c0	mov $r0.11 = bswitch
	c0	mov $r0.57 = tcbuf_out
	c0	mov $r0.58 = 0
	c0	mov $r0.59 = tcbuf
;;
	c0	ldh $r0.3 = 0[$r0.11]
	c0	mov $r0.4 = $r0.59
	c0	mov $r0.5 = $r0.58
	c0	mov $r0.6 = $r0.58
;;
;;
.call itver2, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = itver2
;;
	c0	mov $r0.11 = -1
;;
LBB1_1::                                ## %for.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.12 = 0[$r0.57]
;;
	c0	ldw $r0.13 = 0[$r0.59]
;;
;;
	c0	cmpne $b0.0 = $r0.13, $r0.12
;;
	c0	mov $r0.12 = $r0.58
;;
	c0	br $b0.0, LBB1_3
;;
## BB#2:                                ## %for.inc
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	add $r0.58 = $r0.58, 1
	c0	add $r0.59 = $r0.59, 4
	c0	add $r0.57 = $r0.57, 4
;;
	c0	cmplt $b0.0 = $r0.58, 256
	c0	mov $r0.12 = $r0.11
;;
;;
	c0	br $b0.0, LBB1_1
;;
LBB1_3::                                ## %return
	c0	mov $r0.3 = $r0.12
	c0	ldw $l0.0 = 16[$r0.1]
;;
	c0	ldw $r0.59 = 20[$r0.1]
;;
	c0	ldw $r0.58 = 24[$r0.1]
;;
	c0	ldw $r0.57 = 28[$r0.1]
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .data
	.align	4                       ## @zcos1_fixed
zcos1_fixed::
	.data4	2147486175              ## 0x800009df
	.data4	2147688301              ## 0x80031f6d
	.data4	2148213800              ## 0x800b2428
	.data4	2149062592              ## 0x801817c0
	.data4	2150234549              ## 0x8029f9b5
	.data4	2151729495              ## 0x8040c957
	.data4	2153547204              ## 0x805c85c4
	.data4	2155687404              ## 0x807d2dec
	.data4	2158149771              ## 0x80a2c08b
	.data4	2160933936              ## 0x80cd3c30
	.data4	2164039478              ## 0x80fc9f36
	.data4	2167465929              ## 0x8130e7c9
	.data4	2171212775              ## 0x816a13e7
	.data4	2175279450              ## 0x81a8215a
	.data4	2179665342              ## 0x81eb0dbe
	.data4	2184369791              ## 0x8232d67f
	.data4	2189392089              ## 0x827f78d9
	.data4	2194731478              ## 0x82d0f1d6
	.data4	2200387155              ## 0x83273e53
	.data4	2206358268              ## 0x83825afc
	.data4	2212643918              ## 0x83e2444e
	.data4	2219243158              ## 0x8446f696
	.data4	2226154994              ## 0x84b06df2
	.data4	2233378386              ## 0x851ea652
	.data4	2240912246              ## 0x85919b76
	.data4	2248755439              ## 0x860948ef
	.data4	2256906784              ## 0x8685aa20
	.data4	2265365053              ## 0x8706ba3d
	.data4	2274128973              ## 0x878c744d
	.data4	2283197224              ## 0x8816d328
	.data4	2292568440              ## 0x88a5d178
	.data4	2302241210              ## 0x893969ba
	.data4	2312214077              ## 0x89d1963d
	.data4	2322485539              ## 0x8a6e5123
	.data4	2333054050              ## 0x8b0f9462
	.data4	2343918018              ## 0x8bb559c2
	.data4	2355075806              ## 0x8c5f9ade
	.data4	2366525736              ## 0x8d0e5128
	.data4	2378266081              ## 0x8dc175e1
	.data4	2390295075              ## 0x8e790223
	.data4	2402610905              ## 0x8f34eed9
	.data4	2415211717              ## 0x8ff534c5
	.data4	2428095613              ## 0x90b9cc7d
	.data4	2441260653              ## 0x9182ae6d
	.data4	2454704855              ## 0x924fd2d7
	.data4	2468426194              ## 0x932131d2
	.data4	2482422603              ## 0x93f6c34b
	.data4	2496691974              ## 0x94d07f06
	.data4	2511232159              ## 0x95ae5c9f
	.data4	2526040968              ## 0x96905388
	.data4	2541116171              ## 0x97765b0b
	.data4	2556455497              ## 0x98606a49
	.data4	2572056637              ## 0x994e783d
	.data4	2587917241              ## 0x9a407bb9
	.data4	2604034920              ## 0x9b366b68
	.data4	2620407248              ## 0x9c303dd0
	.data4	2637031758              ## 0x9d2de94e
	.data4	2653905947              ## 0x9e2f641b
	.data4	2671027274              ## 0x9f34a44a
	.data4	2688393160              ## 0xa03d9fc8
	.data4	2706000991              ## 0xa14a4c5f
	.data4	2723848114              ## 0xa25a9fb2
	.data4	2741931841              ## 0xa36e8f41
	.data4	2760249450              ## 0xa486106a
	.data4	2778798182              ## 0xa5a11866
	.data4	2797575244              ## 0xa6bf9c4c
	.data4	2816577807              ## 0xa7e1910f
	.data4	2835803010              ## 0xa906eb82
	.data4	2855247958              ## 0xaa2fa056
	.data4	2874909723              ## 0xab5ba41b
	.data4	2894785343              ## 0xac8aeb3f
	.data4	2914871825              ## 0xadbd6a11
	.data4	2935166144              ## 0xaef314c0
	.data4	2955665245              ## 0xb02bdf5d
	.data4	2976366039              ## 0xb167bdd7
	.data4	2997265410              ## 0xb2a6a402
	.data4	3018360210              ## 0xb3e88592
	.data4	3039647263              ## 0xb52d561f
	.data4	3061123362              ## 0xb6750922
	.data4	3082785273              ## 0xb7bf91f9
	.data4	3104629734              ## 0xb90ce3e6
	.data4	3126653456              ## 0xba5cf210
	.data4	3148853122              ## 0xbbafaf82
	.data4	3171225389              ## 0xbd050f2d
	.data4	3193766886              ## 0xbe5d03e6
	.data4	3216474221              ## 0xbfb7806d
	.data4	3239343972              ## 0xc1147764
	.data4	3262372697              ## 0xc273db59
	.data4	3285556926              ## 0xc3d59ebe
	.data4	3308893169              ## 0xc539b3f1
	.data4	3332377911              ## 0xc6a00d37
	.data4	3356007616              ## 0xc8089cc0
	.data4	3379778724              ## 0xc97354a4
	.data4	3403687657              ## 0xcae026e9
	.data4	3427730812              ## 0xcc4f057c
	.data4	3451904571              ## 0xcdbfe23b
	.data4	3476205292              ## 0xcf32aeec
	.data4	3500629315              ## 0xd0a75d43
	.data4	3525172962              ## 0xd21ddee2
	.data4	3549832538              ## 0xd396255a
	.data4	3574604328              ## 0xd5102228
	.data4	3599484603              ## 0xd68bc6bb
	.data4	3624469614              ## 0xd809046e
	.data4	3649555600              ## 0xd987cc90
	.data4	3674738783              ## 0xdb08105f
	.data4	3700015369              ## 0xdc89c109
	.data4	3725381554              ## 0xde0ccfb2
	.data4	3750833515              ## 0xdf912d6b
	.data4	3776367422              ## 0xe116cb3e
	.data4	3801979427              ## 0xe29d9a23
	.data4	3827665675              ## 0xe4258b0b
	.data4	3853422297              ## 0xe5ae8ed9
	.data4	3879245413              ## 0xe7389665
	.data4	3905131136              ## 0xe8c39280
	.data4	3931075567              ## 0xea4f73ef
	.data4	3957074798              ## 0xebdc2b6e
	.data4	3983124915              ## 0xed69a9b3
	.data4	4009221995              ## 0xeef7df6b
	.data4	4035362106              ## 0xf086bd3a
	.data4	4061541313              ## 0xf21633c1
	.data4	4087755673              ## 0xf3a63399
	.data4	4114001238              ## 0xf536ad56
	.data4	4140274057              ## 0xf6c79189
	.data4	4166570171              ## 0xf858d0bb
	.data4	4192885622              ## 0xf9ea5b76
	.data4	4219216445              ## 0xfb7c223d
	.data4	4245558677              ## 0xfd0e1595
	.data4	4271908349              ## 0xfea025fd

	.align	4                       ## @zsin1_fixed
zsin1_fixed::
	.data4	4291673099              ## 0xffcdbc0b
	.data4	4265320450              ## 0xfe3ba002
	.data4	4238972266              ## 0xfca9956a
	.data4	4212632515              ## 0xfb17abc3
	.data4	4186305163              ## 0xf985f28b
	.data4	4159994175              ## 0xf7f4793f
	.data4	4133703513              ## 0xf6634f59
	.data4	4107437138              ## 0xf4d28452
	.data4	4081199003              ## 0xf342279b
	.data4	4054993061              ## 0xf1b248a5
	.data4	4028823259              ## 0xf022f6db
	.data4	4002693537              ## 0xee9441a1
	.data4	3976607830              ## 0xed063856
	.data4	3950570067              ## 0xeb78ea53
	.data4	3924584169              ## 0xe9ec66e9
	.data4	3898654049              ## 0xe860bd61
	.data4	3872783613              ## 0xe6d5fcfd
	.data4	3846976756              ## 0xe54c34f4
	.data4	3821237364              ## 0xe3c37474
	.data4	3795569315              ## 0xe23bcaa3
	.data4	3769976473              ## 0xe0b54699
	.data4	3744462693              ## 0xdf2ff765
	.data4	3719031816              ## 0xddabec08
	.data4	3693687674              ## 0xdc29337a
	.data4	3668434082              ## 0xdaa7dca2
	.data4	3643274844              ## 0xd927f65c
	.data4	3618213748              ## 0xd7a98f74
	.data4	3593254568              ## 0xd62cb6a8
	.data4	3568401064              ## 0xd4b17aa8
	.data4	3543656979              ## 0xd337ea13
	.data4	3519026037              ## 0xd1c01375
	.data4	3494511950              ## 0xd04a054e
	.data4	3470118409              ## 0xced5ce09
	.data4	3445849086              ## 0xcd637bfe
	.data4	3421707638              ## 0xcbf31d76
	.data4	3397697699              ## 0xca84c0a3
	.data4	3373822886              ## 0xc91873a6
	.data4	3350086794              ## 0xc7ae448a
	.data4	3326492997              ## 0xc6464145
	.data4	3303045049              ## 0xc4e077b9
	.data4	3279746481              ## 0xc37cf5b1
	.data4	3256600801              ## 0xc21bc8e1
	.data4	3233611496              ## 0xc0bcfee8
	.data4	3210782026              ## 0xbf60a54a
	.data4	3188115832              ## 0xbe06c978
	.data4	3165616324              ## 0xbcaf78c4
	.data4	3143286893              ## 0xbb5ac06d
	.data4	3121130901              ## 0xba08ad95
	.data4	3099151684              ## 0xb8b94d44
	.data4	3077352553              ## 0xb76cac69
	.data4	3055736790              ## 0xb622d7d6
	.data4	3034307651              ## 0xb4dbdc43
	.data4	3013068362              ## 0xb397c64a
	.data4	2992022122              ## 0xb256a26a
	.data4	2971172102              ## 0xb1187d06
	.data4	2950521440              ## 0xafdd6260
	.data4	2930073246              ## 0xaea55e9e
	.data4	2909830601              ## 0xad707dc9
	.data4	2889796552              ## 0xac3ecbc8
	.data4	2869974116              ## 0xab105464
	.data4	2850366280              ## 0xa9e52348
	.data4	2830975995              ## 0xa8bd43fb
	.data4	2811806181              ## 0xa798c1e5
	.data4	2792859727              ## 0xa677a84f
	.data4	2774139484              ## 0xa55a025c
	.data4	2755648272              ## 0xa43fdb10
	.data4	2737388876              ## 0xa3293d4c
	.data4	2719364046              ## 0xa21633ce
	.data4	2701576495              ## 0xa106c92f
	.data4	2684028904              ## 0x9ffb07e8
	.data4	2666723913              ## 0x9ef2fa49
	.data4	2649664131              ## 0x9deeaa83
	.data4	2632852125              ## 0x9cee229d
	.data4	2616290427              ## 0x9bf16c7b
	.data4	2599981532              ## 0x9af891dc
	.data4	2583927895              ## 0x9a039c57
	.data4	2568131935              ## 0x9912955f
	.data4	2552596030              ## 0x9825863e
	.data4	2537322519              ## 0x973c7817
	.data4	2522313704              ## 0x965773e8
	.data4	2507571843              ## 0x95768283
	.data4	2493099158              ## 0x9499ac96
	.data4	2478897827              ## 0x93c0faa3
	.data4	2464969990              ## 0x92ec7506
	.data4	2451317743              ## 0x921c23ef
	.data4	2437943144              ## 0x91500f68
	.data4	2424848205              ## 0x90883f4d
	.data4	2412034900              ## 0x8fc4bb54
	.data4	2399505157              ## 0x8f058b05
	.data4	2387260864              ## 0x8e4ab5c0
	.data4	2375303864              ## 0x8d9442b8
	.data4	2363635959              ## 0x8ce238f7
	.data4	2352258905              ## 0x8c349f59
	.data4	2341174415              ## 0x8b8b7c8f
	.data4	2330384160              ## 0x8ae6d720
	.data4	2319889764              ## 0x8a46b564
	.data4	2309692807              ## 0x89ab1d87
	.data4	2299794825              ## 0x89141589
	.data4	2290197309              ## 0x8881a33d
	.data4	2280901704              ## 0x87f3cc48
	.data4	2271909410              ## 0x876a9622
	.data4	2263221781              ## 0x86e60615
	.data4	2254840125              ## 0x8666213d
	.data4	2246765705              ## 0x85eaec89
	.data4	2238999736              ## 0x85746cb8
	.data4	2231543389              ## 0x8502a65d
	.data4	2224397786              ## 0x84959dda
	.data4	2217564002              ## 0x842d5762
	.data4	2211043068              ## 0x83c9d6fc
	.data4	2204835966              ## 0x836b207e
	.data4	2198943629              ## 0x8311378d
	.data4	2193366946              ## 0x82bc1fa2
	.data4	2188106757              ## 0x826bdc05
	.data4	2183163852              ## 0x82206fcc
	.data4	2178538978              ## 0x81d9dde2
	.data4	2174232830              ## 0x819828fe
	.data4	2170246056              ## 0x815b53a8
	.data4	2166579258              ## 0x8123603a
	.data4	2163232988              ## 0x80f050dc
	.data4	2160207748              ## 0x80c22784
	.data4	2157503996              ## 0x8098e5fc
	.data4	2155122138              ## 0x80748dda
	.data4	2153062532              ## 0x80552084
	.data4	2151325490              ## 0x803a9f32
	.data4	2149911272              ## 0x80250ae8
	.data4	2148820091              ## 0x8014647b
	.data4	2148052113              ## 0x8008ac91
	.data4	2147607452              ## 0x8001e39c

	.align	4                       ## @zcos2_fixed
zcos2_fixed::
	.data4	2147493755              ## 0x8000277b
	.data4	2148302221              ## 0x800c7d8d
	.data4	2150403758              ## 0x802c8eae
	.data4	2153797099              ## 0x806055eb
	.data4	2158480202              ## 0x80a7cb4a
	.data4	2164450244              ## 0x8102e3c4
	.data4	2171703631              ## 0x8171914f
	.data4	2180235991              ## 0x81f3c2d7
	.data4	2190042187              ## 0x8289644b
	.data4	2201116312              ## 0x83325e98
	.data4	2213451693              ## 0x83ee97ad
	.data4	2227040902              ## 0x84bdf286
	.data4	2241875752              ## 0x85a04f28
	.data4	2257947308              ## 0x86958aac
	.data4	2275245889              ## 0x879d7f41
	.data4	2293761074              ## 0x88b80432
	.data4	2313481711              ## 0x89e4edef
	.data4	2334395921              ## 0x8b240e11
	.data4	2356491106              ## 0x8c753362
	.data4	2379753956              ## 0x8dd829e4
	.data4	2404170460              ## 0x8f4cbadc
	.data4	2429725908              ## 0x90d2acd4
	.data4	2456404909              ## 0x9269c3ad
	.data4	2484191390              ## 0x9411c09e
	.data4	2513068615              ## 0x95ca6247
	.data4	2543019189              ## 0x979364b5
	.data4	2574025072              ## 0x996c8170
	.data4	2606067585              ## 0x9b556f81
	.data4	2639127429              ## 0x9d4de385
	.data4	2673184689              ## 0x9f558fb1
	.data4	2708218850              ## 0xa16c23e2
	.data4	2744208808              ## 0xa3914da8
	.data4	2781132886              ## 0xa5c4b856
	.data4	2818968841              ## 0xa8060d09
	.data4	2857693882              ## 0xaa54f2ba
	.data4	2897284683              ## 0xacb10e4b
	.data4	2937717396              ## 0xaf1a0294
	.data4	2978967665              ## 0xb18f7071
	.data4	3021010643              ## 0xb410f6d3
	.data4	3063821006              ## 0xb69e32ce
	.data4	3107372964              ## 0xb936bfa4
	.data4	3151640285              ## 0xbbda36dd
	.data4	3196596304              ## 0xbe883050
	.data4	3242213940              ## 0xc1404234
	.data4	3288465715              ## 0xc4020133
	.data4	3335323769              ## 0xc6cd0079
	.data4	3382759877              ## 0xc9a0d1c5
	.data4	3430745464              ## 0xcc7d0578
	.data4	3479251627              ## 0xcf612aab
	.data4	3528249145              ## 0xd24ccf39
	.data4	3577708507              ## 0xd53f7fdb
	.data4	3627599918              ## 0xd838c82e
	.data4	3677893326              ## 0xdb3832ce
	.data4	3728558436              ## 0xde3d4964
	.data4	3779564730              ## 0xe14794ba
	.data4	3830881484              ## 0xe4569ccc
	.data4	3882477785              ## 0xe769e8d9
	.data4	3934322554              ## 0xea80ff7a
	.data4	3986384563              ## 0xed9b66b3
	.data4	4038632450              ## 0xf0b8a402
	.data4	4091034743              ## 0xf3d83c77
	.data4	4143559878              ## 0xf6f9b4c6
	.data4	4196176215              ## 0xfa1c9157
	.data4	4248852060              ## 0xfd40565c

	.align	4                       ## @zsin2_fixed
zsin2_fixed::
	.data4	4288378910              ## 0xff9b781e
	.data4	4235679255              ## 0xfc775617
	.data4	4183015313              ## 0xf953bf91
	.data4	4130418807              ## 0xf6313077
	.data4	4077921419              ## 0xf310248b
	.data4	4025554771              ## 0xeff11753
	.data4	3973350407              ## 0xecd48407
	.data4	3921339773              ## 0xe9bae57d
	.data4	3869554199              ## 0xe6a4b617
	.data4	3818024877              ## 0xe3926fad
	.data4	3766782848              ## 0xe0848b80
	.data4	3715858977              ## 0xdd7b8221
	.data4	3665283939              ## 0xda77cb63
	.data4	3615088199              ## 0xd779de47
	.data4	3565301993              ## 0xd48230e9
	.data4	3515955310              ## 0xd191386e
	.data4	3467077875              ## 0xcea768f3
	.data4	3418699129              ## 0xcbc53579
	.data4	3370848215              ## 0xc8eb0fd7
	.data4	3323553955              ## 0xc61968a3
	.data4	3276844838              ## 0xc350af26
	.data4	3230749000              ## 0xc0915148
	.data4	3185294208              ## 0xbddbbb80
	.data4	3140507841              ## 0xbb3058c1
	.data4	3096416877              ## 0xb88f926d
	.data4	3053047875              ## 0xb5f9d043
	.data4	3010426959              ## 0xb36f784f
	.data4	2968579802              ## 0xb0f0eeda
	.data4	2927531612              ## 0xae7e965c
	.data4	2887307113              ## 0xac18cf69
	.data4	2847930537              ## 0xa9bff8a9
	.data4	2809425601              ## 0xa7746ec1
	.data4	2771815500              ## 0xa5368c4c
	.data4	2735122888              ## 0xa306a9c8
	.data4	2699369869              ## 0xa0e51d8d
	.data4	2664577978              ## 0x9ed23bba
	.data4	2630768172              ## 0x9cce562c
	.data4	2597960818              ## 0x9ad9bc72
	.data4	2566175677              ## 0x98f4bbbd
	.data4	2535431895              ## 0x971f9ed7
	.data4	2505747992              ## 0x955aae18
	.data4	2477141847              ## 0x93a62f57
	.data4	2449630693              ## 0x920265e5
	.data4	2423231100              ## 0x906f927c
	.data4	2397958971              ## 0x8eedf33b
	.data4	2373829530              ## 0x8d7dc39a
	.data4	2350857309              ## 0x8c1f3c5d
	.data4	2329056148              ## 0x8ad29394
	.data4	2308439178              ## 0x8997fc8a
	.data4	2289018819              ## 0x886fa7c3
	.data4	2270806768              ## 0x8759c2f0
	.data4	2253813995              ## 0x865678eb
	.data4	2238050737              ## 0x8565f1b1
	.data4	2223526488              ## 0x84885258
	.data4	2210249998              ## 0x83bdbd0e
	.data4	2198229264              ## 0x83065110
	.data4	2187471526              ## 0x82622aa6
	.data4	2177983265              ## 0x81d16321
	.data4	2169770196              ## 0x815410d4
	.data4	2162837267              ## 0x80ea4713
	.data4	2157188652              ## 0x8094162c
	.data4	2152827756              ## 0x80518b6c
	.data4	2149757204              ## 0x8022b114
	.data4	2147978847              ## 0x80078e5f

	.align	4                       ## @xcos_fixed
xcos_fixed::
	.data4	2147483648              ## 0x80000000
	.data4	2150070387              ## 0x80277873
	.data4	2157824369              ## 0x809dc971
	.data4	2170726916              ## 0x8162aa04
	.data4	2188746945              ## 0x8275a0c1
	.data4	2211841042              ## 0x83d60412
	.data4	2239953573              ## 0x8582faa5
	.data4	2273016813              ## 0x877b7bed
	.data4	2310951108              ## 0x89be50c4
	.data4	2353665072              ## 0x8c4a1430
	.data4	2401055802              ## 0x8f1d343a
	.data4	2453009132              ## 0x9235f2ec
	.data4	2509399900              ## 0x9592675c
	.data4	2570092257              ## 0x99307ee1
	.data4	2634939988              ## 0x9d0dfe54
	.data4	2703786871              ## 0xa1288377
	.data4	2776467047              ## 0xa57d8667
	.data4	2852805422              ## 0xaa0a5b2e
	.data4	2932618092              ## 0xaecc336c
	.data4	3015712781              ## 0xb3c0200d
	.data4	3101889306              ## 0xb8e3131a
	.data4	3190940060              ## 0xbe31e19c
	.data4	3282650512              ## 0xc3a94590
	.data4	3376799725              ## 0xc945dfed
	.data4	3473160883              ## 0xcf043ab3
	.data4	3571501845              ## 0xd4e0cb15
	.data4	3671585699              ## 0xdad7f3a3
	.data4	3773171333              ## 0xe0e60685
	.data4	3876014020              ## 0xe70747c4
	.data4	3979866002              ## 0xed37ef92
	.data4	4084477090              ## 0xf3742ca2
	.data4	4189595268              ## 0xf9b82684
	.data4	0                       ## 0x0
	.data4	105372028               ## 0x647d97c
	.data4	210490206               ## 0xc8bd35e
	.data4	315101294               ## 0x12c8106e
	.data4	418953276               ## 0x18f8b83c
	.data4	521795963               ## 0x1f19f97b
	.data4	623381597               ## 0x25280c5d
	.data4	723465451               ## 0x2b1f34eb
	.data4	821806413               ## 0x30fbc54d
	.data4	918167571               ## 0x36ba2013
	.data4	1012316784              ## 0x3c56ba70
	.data4	1104027236              ## 0x41ce1e64
	.data4	1193077990              ## 0x471cece6
	.data4	1279254515              ## 0x4c3fdff3
	.data4	1362349204              ## 0x5133cc94
	.data4	1442161874              ## 0x55f5a4d2
	.data4	1518500249              ## 0x5a827999
	.data4	1591180425              ## 0x5ed77c89
	.data4	1660027308              ## 0x62f201ac
	.data4	1724875039              ## 0x66cf811f
	.data4	1785567396              ## 0x6a6d98a4
	.data4	1841958164              ## 0x6dca0d14
	.data4	1893911494              ## 0x70e2cbc6
	.data4	1941302224              ## 0x73b5ebd0
	.data4	1984016188              ## 0x7641af3c
	.data4	2021950483              ## 0x78848413
	.data4	2055013723              ## 0x7a7d055b
	.data4	2083126254              ## 0x7c29fbee
	.data4	2106220351              ## 0x7d8a5f3f
	.data4	2124240380              ## 0x7e9d55fc
	.data4	2137142927              ## 0x7f62368f
	.data4	2144896909              ## 0x7fd8878d

	.align	4                       ## @xsin_fixed
xsin_fixed::
	.data4	0                       ## 0x0
	.data4	4189595268              ## 0xf9b82684
	.data4	4084477090              ## 0xf3742ca2
	.data4	3979866002              ## 0xed37ef92
	.data4	3876014020              ## 0xe70747c4
	.data4	3773171333              ## 0xe0e60685
	.data4	3671585699              ## 0xdad7f3a3
	.data4	3571501845              ## 0xd4e0cb15
	.data4	3473160883              ## 0xcf043ab3
	.data4	3376799725              ## 0xc945dfed
	.data4	3282650512              ## 0xc3a94590
	.data4	3190940060              ## 0xbe31e19c
	.data4	3101889306              ## 0xb8e3131a
	.data4	3015712781              ## 0xb3c0200d
	.data4	2932618092              ## 0xaecc336c
	.data4	2852805422              ## 0xaa0a5b2e
	.data4	2776467047              ## 0xa57d8667
	.data4	2703786871              ## 0xa1288377
	.data4	2634939988              ## 0x9d0dfe54
	.data4	2570092257              ## 0x99307ee1
	.data4	2509399900              ## 0x9592675c
	.data4	2453009132              ## 0x9235f2ec
	.data4	2401055802              ## 0x8f1d343a
	.data4	2353665072              ## 0x8c4a1430
	.data4	2310951108              ## 0x89be50c4
	.data4	2273016813              ## 0x877b7bed
	.data4	2239953573              ## 0x8582faa5
	.data4	2211841042              ## 0x83d60412
	.data4	2188746945              ## 0x8275a0c1
	.data4	2170726916              ## 0x8162aa04
	.data4	2157824369              ## 0x809dc971
	.data4	2150070387              ## 0x80277873
	.data4	2147483648              ## 0x80000000
	.data4	2150070387              ## 0x80277873
	.data4	2157824369              ## 0x809dc971
	.data4	2170726916              ## 0x8162aa04
	.data4	2188746945              ## 0x8275a0c1
	.data4	2211841042              ## 0x83d60412
	.data4	2239953573              ## 0x8582faa5
	.data4	2273016813              ## 0x877b7bed
	.data4	2310951108              ## 0x89be50c4
	.data4	2353665072              ## 0x8c4a1430
	.data4	2401055802              ## 0x8f1d343a
	.data4	2453009132              ## 0x9235f2ec
	.data4	2509399900              ## 0x9592675c
	.data4	2570092257              ## 0x99307ee1
	.data4	2634939988              ## 0x9d0dfe54
	.data4	2703786871              ## 0xa1288377
	.data4	2776467047              ## 0xa57d8667
	.data4	2852805422              ## 0xaa0a5b2e
	.data4	2932618092              ## 0xaecc336c
	.data4	3015712781              ## 0xb3c0200d
	.data4	3101889306              ## 0xb8e3131a
	.data4	3190940060              ## 0xbe31e19c
	.data4	3282650512              ## 0xc3a94590
	.data4	3376799725              ## 0xc945dfed
	.data4	3473160883              ## 0xcf043ab3
	.data4	3571501845              ## 0xd4e0cb15
	.data4	3671585699              ## 0xdad7f3a3
	.data4	3773171333              ## 0xe0e60685
	.data4	3876014020              ## 0xe70747c4
	.data4	3979866002              ## 0xed37ef92
	.data4	4084477090              ## 0xf3742ca2
	.data4	4189595268              ## 0xf9b82684

	.align	2                       ## @bitrev
bitrev::
	.data2	0                       ## 0x0
	.data2	64                      ## 0x40
	.data2	32                      ## 0x20
	.data2	96                      ## 0x60
	.data2	16                      ## 0x10
	.data2	80                      ## 0x50
	.data2	48                      ## 0x30
	.data2	112                     ## 0x70
	.data2	8                       ## 0x8
	.data2	72                      ## 0x48
	.data2	40                      ## 0x28
	.data2	104                     ## 0x68
	.data2	24                      ## 0x18
	.data2	88                      ## 0x58
	.data2	56                      ## 0x38
	.data2	120                     ## 0x78
	.data2	4                       ## 0x4
	.data2	68                      ## 0x44
	.data2	36                      ## 0x24
	.data2	100                     ## 0x64
	.data2	20                      ## 0x14
	.data2	84                      ## 0x54
	.data2	52                      ## 0x34
	.data2	116                     ## 0x74
	.data2	12                      ## 0xc
	.data2	76                      ## 0x4c
	.data2	44                      ## 0x2c
	.data2	108                     ## 0x6c
	.data2	28                      ## 0x1c
	.data2	92                      ## 0x5c
	.data2	60                      ## 0x3c
	.data2	124                     ## 0x7c
	.data2	2                       ## 0x2
	.data2	66                      ## 0x42
	.data2	34                      ## 0x22
	.data2	98                      ## 0x62
	.data2	18                      ## 0x12
	.data2	82                      ## 0x52
	.data2	50                      ## 0x32
	.data2	114                     ## 0x72
	.data2	10                      ## 0xa
	.data2	74                      ## 0x4a
	.data2	42                      ## 0x2a
	.data2	106                     ## 0x6a
	.data2	26                      ## 0x1a
	.data2	90                      ## 0x5a
	.data2	58                      ## 0x3a
	.data2	122                     ## 0x7a
	.data2	6                       ## 0x6
	.data2	70                      ## 0x46
	.data2	38                      ## 0x26
	.data2	102                     ## 0x66
	.data2	22                      ## 0x16
	.data2	86                      ## 0x56
	.data2	54                      ## 0x36
	.data2	118                     ## 0x76
	.data2	14                      ## 0xe
	.data2	78                      ## 0x4e
	.data2	46                      ## 0x2e
	.data2	110                     ## 0x6e
	.data2	30                      ## 0x1e
	.data2	94                      ## 0x5e
	.data2	62                      ## 0x3e
	.data2	126                     ## 0x7e
	.data2	1                       ## 0x1
	.data2	65                      ## 0x41
	.data2	33                      ## 0x21
	.data2	97                      ## 0x61
	.data2	17                      ## 0x11
	.data2	81                      ## 0x51
	.data2	49                      ## 0x31
	.data2	113                     ## 0x71
	.data2	9                       ## 0x9
	.data2	73                      ## 0x49
	.data2	41                      ## 0x29
	.data2	105                     ## 0x69
	.data2	25                      ## 0x19
	.data2	89                      ## 0x59
	.data2	57                      ## 0x39
	.data2	121                     ## 0x79
	.data2	5                       ## 0x5
	.data2	69                      ## 0x45
	.data2	37                      ## 0x25
	.data2	101                     ## 0x65
	.data2	21                      ## 0x15
	.data2	85                      ## 0x55
	.data2	53                      ## 0x35
	.data2	117                     ## 0x75
	.data2	13                      ## 0xd
	.data2	77                      ## 0x4d
	.data2	45                      ## 0x2d
	.data2	109                     ## 0x6d
	.data2	29                      ## 0x1d
	.data2	93                      ## 0x5d
	.data2	61                      ## 0x3d
	.data2	125                     ## 0x7d
	.data2	3                       ## 0x3
	.data2	67                      ## 0x43
	.data2	35                      ## 0x23
	.data2	99                      ## 0x63
	.data2	19                      ## 0x13
	.data2	83                      ## 0x53
	.data2	51                      ## 0x33
	.data2	115                     ## 0x73
	.data2	11                      ## 0xb
	.data2	75                      ## 0x4b
	.data2	43                      ## 0x2b
	.data2	107                     ## 0x6b
	.data2	27                      ## 0x1b
	.data2	91                      ## 0x5b
	.data2	59                      ## 0x3b
	.data2	123                     ## 0x7b
	.data2	7                       ## 0x7
	.data2	71                      ## 0x47
	.data2	39                      ## 0x27
	.data2	103                     ## 0x67
	.data2	23                      ## 0x17
	.data2	87                      ## 0x57
	.data2	55                      ## 0x37
	.data2	119                     ## 0x77
	.data2	15                      ## 0xf
	.data2	79                      ## 0x4f
	.data2	47                      ## 0x2f
	.data2	111                     ## 0x6f
	.data2	31                      ## 0x1f
	.data2	95                      ## 0x5f
	.data2	63                      ## 0x3f
	.data2	127                     ## 0x7f

	.align	2                       ## @chantab
chantab::
	.data2	0                       ## 0x0
	.data2	2                       ## 0x2
	.data2	5                       ## 0x5
	.data2	65535                   ## 0xffff
	.data2	65535                   ## 0xffff
	.data2	65535                   ## 0xffff
	.data2	1                       ## 0x1
	.data2	5                       ## 0x5
	.data2	65535                   ## 0xffff
	.data2	65535                   ## 0xffff
	.data2	65535                   ## 0xffff
	.data2	65535                   ## 0xffff
	.data2	0                       ## 0x0
	.data2	2                       ## 0x2
	.data2	5                       ## 0x5
	.data2	65535                   ## 0xffff
	.data2	65535                   ## 0xffff
	.data2	65535                   ## 0xffff
	.data2	0                       ## 0x0
	.data2	1                       ## 0x1
	.data2	2                       ## 0x2
	.data2	5                       ## 0x5
	.data2	65535                   ## 0xffff
	.data2	65535                   ## 0xffff
	.data2	0                       ## 0x0
	.data2	2                       ## 0x2
	.data2	3                       ## 0x3
	.data2	5                       ## 0x5
	.data2	65535                   ## 0xffff
	.data2	65535                   ## 0xffff
	.data2	0                       ## 0x0
	.data2	1                       ## 0x1
	.data2	2                       ## 0x2
	.data2	3                       ## 0x3
	.data2	5                       ## 0x5
	.data2	65535                   ## 0xffff
	.data2	0                       ## 0x0
	.data2	2                       ## 0x2
	.data2	3                       ## 0x3
	.data2	4                       ## 0x4
	.data2	5                       ## 0x5
	.data2	65535                   ## 0xffff
	.data2	0                       ## 0x0
	.data2	1                       ## 0x1
	.data2	2                       ## 0x2
	.data2	3                       ## 0x3
	.data2	4                       ## 0x4
	.data2	5                       ## 0x5

.section .bss
	.align	2                       ## @bswitch
bswitch::
	.data2	0                       ## 0x0

.section .data
	.align	4                       ## @tcbuf
tcbuf::
	.data4	4294966923              ## 0xfffffe8b
	.data4	85                      ## 0x55
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0

	.align	4                       ## @tcbuf_out
tcbuf_out::
	.data4	0                       ## 0x0
	.data4	5                       ## 0x5
	.data4	12                      ## 0xc
	.data4	24                      ## 0x18
	.data4	28                      ## 0x1c
	.data4	37                      ## 0x25
	.data4	46                      ## 0x2e
	.data4	57                      ## 0x39
	.data4	58                      ## 0x3a
	.data4	70                      ## 0x46
	.data4	74                      ## 0x4a
	.data4	85                      ## 0x55
	.data4	92                      ## 0x5c
	.data4	100                     ## 0x64
	.data4	109                     ## 0x6d
	.data4	116                     ## 0x74
	.data4	116                     ## 0x74
	.data4	119                     ## 0x77
	.data4	130                     ## 0x82
	.data4	142                     ## 0x8e
	.data4	144                     ## 0x90
	.data4	150                     ## 0x96
	.data4	161                     ## 0xa1
	.data4	170                     ## 0xaa
	.data4	173                     ## 0xad
	.data4	176                     ## 0xb0
	.data4	184                     ## 0xb8
	.data4	194                     ## 0xc2
	.data4	202                     ## 0xca
	.data4	204                     ## 0xcc
	.data4	214                     ## 0xd6
	.data4	222                     ## 0xde
	.data4	218                     ## 0xda
	.data4	211                     ## 0xd3
	.data4	219                     ## 0xdb
	.data4	231                     ## 0xe7
	.data4	233                     ## 0xe9
	.data4	238                     ## 0xee
	.data4	249                     ## 0xf9
	.data4	255                     ## 0xff
	.data4	254                     ## 0xfe
	.data4	254                     ## 0xfe
	.data4	262                     ## 0x106
	.data4	269                     ## 0x10d
	.data4	275                     ## 0x113
	.data4	276                     ## 0x114
	.data4	285                     ## 0x11d
	.data4	291                     ## 0x123
	.data4	291                     ## 0x123
	.data4	282                     ## 0x11a
	.data4	289                     ## 0x121
	.data4	298                     ## 0x12a
	.data4	299                     ## 0x12b
	.data4	301                     ## 0x12d
	.data4	306                     ## 0x132
	.data4	313                     ## 0x139
	.data4	313                     ## 0x139
	.data4	310                     ## 0x136
	.data4	314                     ## 0x13a
	.data4	316                     ## 0x13c
	.data4	323                     ## 0x143
	.data4	321                     ## 0x141
	.data4	326                     ## 0x146
	.data4	330                     ## 0x14a
	.data4	321                     ## 0x141
	.data4	310                     ## 0x136
	.data4	314                     ## 0x13a
	.data4	315                     ## 0x13b
	.data4	318                     ## 0x13e
	.data4	316                     ## 0x13c
	.data4	319                     ## 0x13f
	.data4	319                     ## 0x13f
	.data4	321                     ## 0x141
	.data4	314                     ## 0x13a
	.data4	320                     ## 0x140
	.data4	318                     ## 0x13e
	.data4	323                     ## 0x143
	.data4	319                     ## 0x13f
	.data4	321                     ## 0x141
	.data4	320                     ## 0x140
	.data4	324                     ## 0x144
	.data4	318                     ## 0x13e
	.data4	317                     ## 0x13d
	.data4	318                     ## 0x13e
	.data4	319                     ## 0x13f
	.data4	316                     ## 0x13c
	.data4	316                     ## 0x13c
	.data4	314                     ## 0x13a
	.data4	316                     ## 0x13c
	.data4	315                     ## 0x13b
	.data4	312                     ## 0x138
	.data4	310                     ## 0x136
	.data4	311                     ## 0x137
	.data4	309                     ## 0x135
	.data4	307                     ## 0x133
	.data4	306                     ## 0x132
	.data4	309                     ## 0x135
	.data4	314                     ## 0x13a
	.data4	310                     ## 0x136
	.data4	304                     ## 0x130
	.data4	306                     ## 0x132
	.data4	305                     ## 0x131
	.data4	300                     ## 0x12c
	.data4	297                     ## 0x129
	.data4	301                     ## 0x12d
	.data4	301                     ## 0x12d
	.data4	299                     ## 0x12b
	.data4	294                     ## 0x126
	.data4	294                     ## 0x126
	.data4	293                     ## 0x125
	.data4	288                     ## 0x120
	.data4	286                     ## 0x11e
	.data4	291                     ## 0x123
	.data4	298                     ## 0x12a
	.data4	294                     ## 0x126
	.data4	287                     ## 0x11f
	.data4	289                     ## 0x121
	.data4	290                     ## 0x122
	.data4	285                     ## 0x11d
	.data4	279                     ## 0x117
	.data4	282                     ## 0x11a
	.data4	287                     ## 0x11f
	.data4	285                     ## 0x11d
	.data4	280                     ## 0x118
	.data4	279                     ## 0x117
	.data4	281                     ## 0x119
	.data4	276                     ## 0x114
	.data4	273                     ## 0x111
	.data4	4294967008              ## 0xfffffee0
	.data4	4294966989              ## 0xfffffecd
	.data4	4294966992              ## 0xfffffed0
	.data4	4294966996              ## 0xfffffed4
	.data4	4294966995              ## 0xfffffed3
	.data4	4294966995              ## 0xfffffed3
	.data4	4294966999              ## 0xfffffed7
	.data4	4294967000              ## 0xfffffed8
	.data4	4294966999              ## 0xfffffed7
	.data4	4294966990              ## 0xfffffece
	.data4	4294966995              ## 0xfffffed3
	.data4	4294966996              ## 0xfffffed4
	.data4	4294967001              ## 0xfffffed9
	.data4	4294966995              ## 0xfffffed3
	.data4	4294966999              ## 0xfffffed7
	.data4	4294966999              ## 0xfffffed7
	.data4	4294966996              ## 0xfffffed4
	.data4	4294966986              ## 0xfffffeca
	.data4	4294966988              ## 0xfffffecc
	.data4	4294966990              ## 0xfffffece
	.data4	4294966991              ## 0xfffffecf
	.data4	4294966986              ## 0xfffffeca
	.data4	4294966988              ## 0xfffffecc
	.data4	4294966990              ## 0xfffffece
	.data4	4294966990              ## 0xfffffece
	.data4	4294966982              ## 0xfffffec6
	.data4	4294966982              ## 0xfffffec6
	.data4	4294966983              ## 0xfffffec7
	.data4	4294966987              ## 0xfffffecb
	.data4	4294966981              ## 0xfffffec5
	.data4	4294966984              ## 0xfffffec8
	.data4	4294966985              ## 0xfffffec9
	.data4	4294966980              ## 0xfffffec4
	.data4	4294966974              ## 0xfffffebe
	.data4	4294966975              ## 0xfffffebf
	.data4	4294966972              ## 0xfffffebc
	.data4	4294966973              ## 0xfffffebd
	.data4	4294966970              ## 0xfffffeba
	.data4	4294966972              ## 0xfffffebc
	.data4	4294966969              ## 0xfffffeb9
	.data4	4294966970              ## 0xfffffeba
	.data4	4294966964              ## 0xfffffeb4
	.data4	4294966967              ## 0xfffffeb7
	.data4	4294966964              ## 0xfffffeb4
	.data4	4294966966              ## 0xfffffeb6
	.data4	4294966963              ## 0xfffffeb3
	.data4	4294966962              ## 0xfffffeb2
	.data4	4294966961              ## 0xfffffeb1
	.data4	4294966966              ## 0xfffffeb6
	.data4	4294966964              ## 0xfffffeb4
	.data4	4294966963              ## 0xfffffeb3
	.data4	4294966959              ## 0xfffffeaf
	.data4	4294966961              ## 0xfffffeb1
	.data4	4294966962              ## 0xfffffeb2
	.data4	4294966961              ## 0xfffffeb1
	.data4	4294966958              ## 0xfffffeae
	.data4	4294966962              ## 0xfffffeb2
	.data4	4294966963              ## 0xfffffeb3
	.data4	4294966962              ## 0xfffffeb2
	.data4	4294966959              ## 0xfffffeaf
	.data4	4294966961              ## 0xfffffeb1
	.data4	4294966963              ## 0xfffffeb3
	.data4	4294966960              ## 0xfffffeb0
	.data4	4294966960              ## 0xfffffeb0
	.data4	4294966970              ## 0xfffffeba
	.data4	4294966984              ## 0xfffffec8
	.data4	4294966983              ## 0xfffffec7
	.data4	4294966978              ## 0xfffffec2
	.data4	4294966982              ## 0xfffffec6
	.data4	4294966984              ## 0xfffffec8
	.data4	4294966981              ## 0xfffffec5
	.data4	4294966979              ## 0xfffffec3
	.data4	4294966986              ## 0xfffffeca
	.data4	4294966992              ## 0xfffffed0
	.data4	4294966992              ## 0xfffffed0
	.data4	4294966991              ## 0xfffffecf
	.data4	4294966992              ## 0xfffffed0
	.data4	4294966996              ## 0xfffffed4
	.data4	4294966996              ## 0xfffffed4
	.data4	4294966996              ## 0xfffffed4
	.data4	4294967007              ## 0xfffffedf
	.data4	4294967020              ## 0xfffffeec
	.data4	4294967018              ## 0xfffffeea
	.data4	4294967015              ## 0xfffffee7
	.data4	4294967022              ## 0xfffffeee
	.data4	4294967028              ## 0xfffffef4
	.data4	4294967027              ## 0xfffffef3
	.data4	4294967027              ## 0xfffffef3
	.data4	4294967032              ## 0xfffffef8
	.data4	4294967045              ## 0xffffff05
	.data4	4294967045              ## 0xffffff05
	.data4	4294967046              ## 0xffffff06
	.data4	4294967048              ## 0xffffff08
	.data4	4294967057              ## 0xffffff11
	.data4	4294967057              ## 0xffffff11
	.data4	4294967060              ## 0xffffff14
	.data4	4294967073              ## 0xffffff21
	.data4	4294967093              ## 0xffffff35
	.data4	4294967095              ## 0xffffff37
	.data4	4294967096              ## 0xffffff38
	.data4	4294967102              ## 0xffffff3e
	.data4	4294967111              ## 0xffffff47
	.data4	4294967110              ## 0xffffff46
	.data4	4294967116              ## 0xffffff4c
	.data4	4294967124              ## 0xffffff54
	.data4	4294967137              ## 0xffffff61
	.data4	4294967138              ## 0xffffff62
	.data4	4294967144              ## 0xffffff68
	.data4	4294967148              ## 0xffffff6c
	.data4	4294967158              ## 0xffffff76
	.data4	4294967160              ## 0xffffff78
	.data4	4294967167              ## 0xffffff7f
	.data4	4294967173              ## 0xffffff85
	.data4	4294967188              ## 0xffffff94
	.data4	4294967193              ## 0xffffff99
	.data4	4294967199              ## 0xffffff9f
	.data4	4294967205              ## 0xffffffa5
	.data4	4294967213              ## 0xffffffad
	.data4	4294967220              ## 0xffffffb4
	.data4	4294967227              ## 0xffffffbb
	.data4	4294967232              ## 0xffffffc0
	.data4	4294967243              ## 0xffffffcb
	.data4	4294967249              ## 0xffffffd1
	.data4	4294967259              ## 0xffffffdb
	.data4	4294967262              ## 0xffffffde
	.data4	4294967271              ## 0xffffffe7
	.data4	4294967278              ## 0xffffffee
	.data4	4294967286              ## 0xfffffff6

	.align	2                       ## @acmod
acmod::
	.data2	7                       ## 0x7

	.align	2                       ## @channum
channum::
	.data2	5                       ## 0x5

.section .bss
	.align	4                       ## @slct
slct::
	.data4	0                       ## 0x0


