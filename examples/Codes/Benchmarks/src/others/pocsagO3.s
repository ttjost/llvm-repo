.section .text

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
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @memcpy
memcpy::
## BB#0:                                ## %entry
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB1_8
;;
## BB#1:                                ## %overflow.checked
	c0	and $r0.14 = $r0.5, -32
	c0	mov $r0.18 = 0
;;
	c0	cmpeq $b0.0 = $r0.14, 0
	c0	mov $r0.11 = $r0.4
	c0	mov $r0.12 = $r0.3
	c0	mov $r0.13 = $r0.5
;;
;;
	c0	br $b0.0, LBB1_6
;;
## BB#2:                                ## %vector.memcheck
	c0	add $r0.11 = $r0.5, -1
;;
	c0	add $r0.12 = $r0.4, $r0.11
;;
	c0	cmpltu $b0.0 = $r0.12, $r0.3
;;
;;
	c0	br $b0.0, LBB1_4
;;
## BB#3:                                ## %vector.memcheck
	c0	add $r0.11 = $r0.3, $r0.11
;;
	c0	cmpgeu $b0.0 = $r0.11, $r0.4
	c0	mov $r0.11 = $r0.4
	c0	mov $r0.12 = $r0.3
	c0	mov $r0.13 = $r0.5
;;
;;
	c0	br $b0.0, LBB1_6
;;
LBB1_4:                                 ## %vector.body.preheader
	c0	add $r0.11 = $r0.4, $r0.14
	c0	add $r0.12 = $r0.3, $r0.14
	c0	sub $r0.13 = $r0.5, $r0.14
	c0	add $r0.17 = $r0.4, 16
	c0	add $r0.16 = $r0.3, 16
	c0	and $r0.15 = $r0.5, -32
;;
LBB1_5:                                 ## %vector.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldb $r0.18 = -1[$r0.17]
;;
	c0	ldb $r0.19 = -16[$r0.17]
	c0	add $r0.15 = $r0.15, -32
;;
	c0	ldb $r0.20 = -15[$r0.17]
	c0	cmpne $b0.0 = $r0.15, 0
	c0	add $r0.21 = $r0.17, 32
	c0	add $r0.22 = $r0.16, 32
;;
	c0	ldb $r0.23 = -14[$r0.17]
;;
	c0	ldb $r0.24 = -13[$r0.17]
;;
	c0	ldb $r0.25 = -12[$r0.17]
;;
	c0	ldb $r0.26 = -11[$r0.17]
;;
	c0	ldb $r0.27 = -10[$r0.17]
;;
	c0	ldb $r0.28 = -9[$r0.17]
;;
	c0	ldb $r0.29 = -8[$r0.17]
;;
	c0	ldb $r0.30 = -7[$r0.17]
;;
	c0	ldb $r0.31 = -6[$r0.17]
;;
	c0	ldb $r0.32 = -2[$r0.17]
;;
	c0	ldb $r0.33 = -3[$r0.17]
;;
	c0	ldb $r0.34 = -4[$r0.17]
;;
	c0	ldb $r0.35 = -5[$r0.17]
;;
	c0	ldb $r0.36 = 12[$r0.17]
;;
	c0	ldb $r0.37 = 0[$r0.17]
;;
	c0	ldb $r0.38 = 1[$r0.17]
;;
	c0	ldb $r0.39 = 2[$r0.17]
;;
	c0	ldb $r0.40 = 3[$r0.17]
;;
	c0	ldb $r0.41 = 4[$r0.17]
;;
	c0	ldb $r0.42 = 5[$r0.17]
;;
	c0	ldb $r0.43 = 7[$r0.17]
;;
	c0	ldb $r0.44 = 9[$r0.17]
;;
	c0	ldb $r0.45 = 6[$r0.17]
;;
	c0	ldb $r0.46 = 11[$r0.17]
;;
	c0	ldb $r0.47 = 13[$r0.17]
;;
	c0	ldb $r0.48 = 15[$r0.17]
;;
	c0	ldb $r0.49 = 10[$r0.17]
;;
	c0	ldb $r0.50 = 14[$r0.17]
;;
	c0	ldb $r0.17 = 8[$r0.17]
;;
	c0	stb -1[$r0.16] = $r0.18
;;
	c0	stb -2[$r0.16] = $r0.32
;;
	c0	stb -3[$r0.16] = $r0.33
;;
	c0	stb -4[$r0.16] = $r0.34
;;
	c0	stb -5[$r0.16] = $r0.35
;;
	c0	stb -6[$r0.16] = $r0.31
;;
	c0	stb -7[$r0.16] = $r0.30
;;
	c0	stb -8[$r0.16] = $r0.29
;;
	c0	stb -9[$r0.16] = $r0.28
;;
	c0	stb -10[$r0.16] = $r0.27
;;
	c0	stb -11[$r0.16] = $r0.26
;;
	c0	stb -12[$r0.16] = $r0.25
;;
	c0	stb -13[$r0.16] = $r0.24
;;
	c0	stb -14[$r0.16] = $r0.23
;;
	c0	stb -15[$r0.16] = $r0.20
;;
	c0	stb -16[$r0.16] = $r0.19
;;
	c0	stb 15[$r0.16] = $r0.48
;;
	c0	stb 14[$r0.16] = $r0.50
;;
	c0	stb 13[$r0.16] = $r0.47
;;
	c0	stb 12[$r0.16] = $r0.36
;;
	c0	stb 11[$r0.16] = $r0.46
;;
	c0	stb 10[$r0.16] = $r0.49
;;
	c0	stb 9[$r0.16] = $r0.44
;;
	c0	stb 8[$r0.16] = $r0.17
;;
	c0	stb 7[$r0.16] = $r0.43
;;
	c0	stb 6[$r0.16] = $r0.45
;;
	c0	stb 5[$r0.16] = $r0.42
;;
	c0	stb 4[$r0.16] = $r0.41
;;
	c0	stb 3[$r0.16] = $r0.40
;;
	c0	stb 2[$r0.16] = $r0.39
;;
	c0	stb 1[$r0.16] = $r0.38
;;
	c0	stb 0[$r0.16] = $r0.37
	c0	mov $r0.17 = $r0.21
	c0	mov $r0.16 = $r0.22
	c0	mov $r0.18 = $r0.14
	c0	br $b0.0, LBB1_5
;;
LBB1_6:                                 ## %middle.block
	c0	cmpeq $b0.0 = $r0.18, $r0.5
;;
;;
	c0	br $b0.0, LBB1_8
;;
LBB1_7:                                 ## %while.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.13 = $r0.13, -1
	c0	ldb $r0.14 = 0[$r0.11]
;;
	c0	cmpne $b0.0 = $r0.13, 0
	c0	add $r0.15 = $r0.12, 1
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stb 0[$r0.12] = $r0.14
	c0	mov $r0.12 = $r0.15
;;
	c0	br $b0.0, LBB1_7
;;
LBB1_8:                                 ## %while.end
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @strncmp
strncmp::
## BB#0:                                ## %entry
	c0	mov $r0.11 = 0
	c0	cmpeq $b0.0 = $r0.5, 0
;;
	c0	mov $r0.12 = $r0.11
	c0	mov $r0.13 = $r0.11
;;
	c0	br $b0.0, LBB2_4
;;
LBB2_2:                                 ## %for.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.13 = $r0.4, $r0.12
	c0	add $r0.15 = $r0.3, $r0.12
;;
	c0	ldb $r0.14 = 0[$r0.13]
	c0	mov $r0.13 = -1
;;
	c0	ldb $r0.15 = 0[$r0.15]
;;
;;
	c0	cmplt $b0.0 = $r0.15, $r0.14
;;
;;
	c0	br $b0.0, LBB2_4
;;
## BB#3:                                ## %if.else
                                        ##   in Loop: Header=BB2_2 Depth=1
	c0	mov $r0.13 = 1
	c0	cmple $b0.0 = $r0.15, $r0.14
;;
;;
	c0	brf $b0.0, LBB2_4
;;
## BB#1:                                ## %for.cond
                                        ##   in Loop: Header=BB2_2 Depth=1
	c0	add $r0.12 = $r0.12, 1
;;
	c0	cmpgeu $b0.0 = $r0.12, $r0.5
	c0	mov $r0.13 = $r0.11
;;
;;
	c0	brf $b0.0, LBB2_2
;;
LBB2_4:                                 ## %return
.return ret($r0.3:s32)
	c0	mov $r0.3 = $r0.13
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @rand
rand::
## BB#0:                                ## %entry
	c0	mov $r0.11 = rand.next
	c0	mov $r0.12 = 16
;;
	c0	ldw $r0.13 = 0[$r0.11]
;;
;;
	c0	mpyhs $r0.14 = $r0.13, 1103515245
	c0	mpylu $r0.13 = $r0.13, 1103515245
;;
;;
	c0	add $r0.13 = $r0.13, $r0.14
;;
	c0	add $r0.13 = $r0.13, 12345
;;
	c0	shru $r0.12 = $r0.13, $r0.12
	c0	stw 0[$r0.11] = $r0.13
;;
.return ret($r0.3:s32)
	c0	and $r0.3 = $r0.12, 32767
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @err_corr
err_corr::
## BB#0:                                ## %entry
	c0	mov $r0.11 = $r0.3
	c0	mov $r0.12 = hexword
	c0	mov $r0.18 = 0
	c0	mov $r0.16 = s1
;;
	c0	stw 0[$r0.12] = $r0.11
	c0	mov $r0.17 = -2147483648
;;
	c0	stb 0[$r0.16] = $r0.18
	c0	mov $r0.21 = s3
	c0	mov $r0.22 = 30
;;
	c0	stb 0[$r0.21] = $r0.18
	c0	and $r0.20 = $r0.11, 1
	c0	mov $r0.19 = parity
;;
	c0	stw 0[$r0.19] = $r0.20
	c0	mov $r0.13 = 1
	c0	mov $r0.14 = alpha
	c0	mov $r0.23 = alpha3
	c0	mov $r0.15 = $r0.18
;;
LBB4_1:                                 ## %while.body.i
                                        ## =>This Inner Loop Header: Depth=1
	c0	and $r0.24 = $r0.17, $r0.11
;;
	c0	cmpeq $b0.0 = $r0.24, 0
;;
;;
	c0	br $b0.0, LBB4_3
;;
## BB#2:                                ## %if.then.i
                                        ##   in Loop: Header=BB4_1 Depth=1
	c0	add $r0.24 = $r0.14, $r0.22
	c0	add $r0.25 = $r0.23, $r0.22
;;
	c0	ldb $r0.24 = 0[$r0.24]
;;
;;
	c0	xor $r0.15 = $r0.24, $r0.15
	c0	ldb $r0.24 = 0[$r0.25]
;;
	c0	stb 0[$r0.16] = $r0.15
;;
	c0	xor $r0.18 = $r0.24, $r0.18
	c0	add $r0.20 = $r0.20, 1
;;
	c0	stb 0[$r0.21] = $r0.18
;;
	c0	stw 0[$r0.19] = $r0.20
;;
LBB4_3:                                 ## %if.end.i
                                        ##   in Loop: Header=BB4_1 Depth=1
	c0	add $r0.24 = $r0.22, -1
	c0	shru $r0.17 = $r0.17, $r0.13
	c0	cmpgt $b0.0 = $r0.22, 0
;;
	c0	mov $r0.22 = $r0.24
;;
	c0	br $b0.0, LBB4_1
;;
## BB#4:                                ## %find_syndromes.exit
	c0	or $r0.16 = $r0.18, $r0.15
;;
	c0	zxtb $r0.16 = $r0.16
	c0	and $r0.17 = $r0.20, 1
;;
	c0	stw 0[$r0.19] = $r0.17
	c0	cmpne $b0.0 = $r0.16, 0
;;
;;
	c0	brf $b0.0, LBB4_5
;;
## BB#6:                                ## %if.else
	c0	sxtb $r0.19 = $r0.15
	c0	mov $r0.16 = alpha_inv
;;
	c0	add $r0.19 = $r0.16, $r0.19
	c0	sxtb $r0.20 = $r0.18
	c0	mov $r0.22 = 30
	c0	mov $r0.23 = 0
	c0	mov $r0.18 = 4
;;
	c0	add $r0.20 = $r0.16, $r0.20
	c0	ldb $r0.21 = 0[$r0.19]
	c0	mpylu $r0.19 = $r0.23, 4229
	c0	mpyhs $r0.24 = $r0.23, 4229
	c0	mpylu $r0.25 = $r0.23, 2114
;;
	c0	mpyhs $r0.23 = $r0.23, 2114
;;
	c0	mpyhs $r0.26 = $r0.21, 3
	c0	mpylu $r0.27 = $r0.21, 3
	c0	ldb $r0.28 = 0[$r0.20]
	c0	add $r0.20 = $r0.19, $r0.24
;;
	c0	add $r0.19 = $r0.25, $r0.23
;;
	c0	sub $r0.23 = $r0.22, $r0.28
	c0	add $r0.22 = $r0.27, $r0.26
;;
	c0	sub $r0.24 = $r0.28, $r0.22
;;
	c0	sxtb $r0.24 = $r0.24
;;
	c0	cmpgt $b0.0 = $r0.24, 0
	c0	zxtb $r0.24 = $r0.22
;;
;;
	c0	slct $r0.25 = $b0.0, $r0.28, $r0.22
;;
	c0	add $r0.23 = $r0.23, $r0.25
;;
	c0	zxtb $r0.25 = $r0.23
;;
	c0	mpyhs $r0.26 = $r0.25, 4229
	c0	mpylu $r0.27 = $r0.25, 4229
	c0	mpyhs $r0.29 = $r0.25, 2114
	c0	mpylu $r0.30 = $r0.25, 2114
;;
;;
	c0	add $r0.26 = $r0.27, $r0.26
	c0	add $r0.27 = $r0.30, $r0.29
;;
	c0	shru $r0.26 = $r0.26, 16
;;
	c0	add $r0.26 = $r0.20, $r0.26
;;
	c0	zxth $r0.29 = $r0.26
	c0	shru $r0.26 = $r0.26, 16
;;
	c0	add $r0.27 = $r0.27, $r0.29
;;
	c0	shru $r0.27 = $r0.27, 16
;;
	c0	add $r0.27 = $r0.19, $r0.27
;;
	c0	add $r0.26 = $r0.27, $r0.26
;;
	c0	sub $r0.27 = $r0.25, $r0.26
;;
	c0	shru $r0.27 = $r0.27, $r0.13
;;
	c0	add $r0.26 = $r0.27, $r0.26
;;
	c0	shru $r0.26 = $r0.26, $r0.18
;;
	c0	mpyhs $r0.27 = $r0.26, 31
	c0	mpylu $r0.26 = $r0.26, 31
;;
;;
	c0	add $r0.26 = $r0.26, $r0.27
;;
	c0	sub $r0.25 = $r0.25, $r0.26
;;
	c0	sub $r0.23 = $r0.23, $r0.25
;;
	c0	add $r0.23 = $r0.23, $r0.28
;;
	c0	zxtb $r0.25 = $r0.23
;;
	c0	cmpne $b0.0 = $r0.25, $r0.24
;;
;;
	c0	br $b0.0, LBB4_8
;;
## BB#7:                                ## %if.then8
	c0	add $r0.14 = $r0.21, 1
;;
	c0	sxtb $r0.14 = $r0.14
	c0	mov $r0.15 = error_code
;;
	c0	shl $r0.14 = $r0.13, $r0.14
;;
	c0	xor $r0.11 = $r0.14, $r0.11
;;
	c0	stw 0[$r0.12] = $r0.11
;;
	c0	stw 0[$r0.15] = $r0.13
	c0	goto LBB4_13
;;
LBB4_5:                                 ## %if.then
	c0	mov $r0.12 = error_code
	c0	mov $r0.13 = 0
;;
	c0	stw 0[$r0.12] = $r0.13
	c0	goto LBB4_13
;;
LBB4_8:                                 ## %if.else9
	c0	sub $r0.22 = $r0.23, $r0.22
	c0	mov $r0.23 = 1437226410
;;
	c0	sxtb $r0.22 = $r0.22
;;
	c0	add $r0.22 = $r0.14, $r0.22
;;
	c0	ldb $r0.22 = 0[$r0.22]
;;
;;
	c0	xor $r0.22 = $r0.22, 1
;;
	c0	shru $r0.23 = $r0.23, $r0.22
;;
	c0	and $r0.23 = $r0.23, 1
;;
	c0	cmpeq $r0.23 = $r0.23, 0
;;
	c0	mtb $b0.0 = $r0.23
;;
;;
	c0	br $b0.0, LBB4_10
;;
## BB#9:                                ## %if.then15
	c0	mov $r0.12 = error_code
;;
	c0	stw 0[$r0.12] = $r0.18
	c0	goto LBB4_13
;;
LBB4_10:                                ## %if.else16
	c0	mov $r0.23 = roots
;;
	c0	add $r0.22 = $r0.23, $r0.22
;;
	c0	ldb $r0.22 = 0[$r0.22]
;;
;;
	c0	add $r0.21 = $r0.22, $r0.21
;;
	c0	sxtb $r0.22 = $r0.21
	c0	xor $r0.23 = $r0.21, -1
;;
	c0	cmplt $b0.0 = $r0.22, 30
;;
;;
	c0	slct $r0.22 = $b0.0, $r0.23, -31
;;
	c0	add $r0.22 = $r0.21, $r0.22
;;
	c0	add $r0.22 = $r0.22, 31
;;
	c0	zxtb $r0.23 = $r0.22
;;
	c0	mpyhs $r0.24 = $r0.23, 4229
	c0	mpylu $r0.25 = $r0.23, 4229
	c0	mpyhs $r0.26 = $r0.23, 2114
	c0	mpylu $r0.27 = $r0.23, 2114
;;
;;
	c0	add $r0.24 = $r0.25, $r0.24
	c0	add $r0.25 = $r0.27, $r0.26
;;
	c0	shru $r0.24 = $r0.24, 16
;;
	c0	add $r0.20 = $r0.20, $r0.24
;;
	c0	zxth $r0.24 = $r0.20
	c0	shru $r0.20 = $r0.20, 16
;;
	c0	add $r0.24 = $r0.25, $r0.24
;;
	c0	shru $r0.24 = $r0.24, 16
;;
	c0	add $r0.19 = $r0.19, $r0.24
;;
	c0	add $r0.19 = $r0.19, $r0.20
;;
	c0	sub $r0.20 = $r0.23, $r0.19
;;
	c0	shru $r0.20 = $r0.20, $r0.13
;;
	c0	add $r0.19 = $r0.20, $r0.19
;;
	c0	shru $r0.18 = $r0.19, $r0.18
;;
	c0	mpyhs $r0.19 = $r0.18, 31
	c0	mpylu $r0.18 = $r0.18, 31
	c0	cmpeq $b0.0 = $r0.17, 0
;;
;;
	c0	add $r0.17 = $r0.18, $r0.19
;;
	c0	sub $r0.17 = $r0.23, $r0.17
;;
	c0	sub $r0.17 = $r0.17, $r0.22
;;
	c0	add $r0.17 = $r0.21, $r0.17
;;
	c0	sxtb $r0.18 = $r0.17
	c0	add $r0.17 = $r0.17, 1
;;
	c0	add $r0.14 = $r0.14, $r0.18
	c0	sxtb $r0.17 = $r0.17
;;
	c0	ldb $r0.14 = 0[$r0.14]
	c0	shl $r0.17 = $r0.13, $r0.17
;;
;;
	c0	xor $r0.14 = $r0.14, $r0.15
	c0	xor $r0.11 = $r0.17, $r0.11
;;
	c0	sxtb $r0.14 = $r0.14
;;
	c0	add $r0.14 = $r0.16, $r0.14
;;
	c0	ldb $r0.14 = 0[$r0.14]
;;
;;
	c0	add $r0.14 = $r0.14, 1
;;
	c0	sxtb $r0.14 = $r0.14
;;
	c0	shl $r0.13 = $r0.13, $r0.14
;;
	c0	xor $r0.11 = $r0.13, $r0.11
;;
	c0	stw 0[$r0.12] = $r0.11
	c0	br $b0.0, LBB4_12
;;
## BB#11:                               ## %if.then34
	c0	mov $r0.12 = error_code
	c0	mov $r0.13 = 3
;;
	c0	stw 0[$r0.12] = $r0.13
	c0	goto LBB4_13
;;
LBB4_12:                                ## %if.else35
	c0	mov $r0.12 = error_code
	c0	mov $r0.13 = 2
;;
	c0	stw 0[$r0.12] = $r0.13
;;
LBB4_13:                                ## %if.end38
.return ret($r0.3:s32)
	c0	mov $r0.3 = $r0.11
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @find_syndromes
find_syndromes::
## BB#0:                                ## %entry
	c0	mov $r0.11 = 0
	c0	mov $r0.12 = s1
	c0	mov $r0.13 = s3
	c0	mov $r0.16 = hexword
;;
	c0	stb 0[$r0.12] = $r0.11
	c0	mov $r0.14 = -2147483648
	c0	mov $r0.18 = 30
;;
	c0	stb 0[$r0.13] = $r0.11
	c0	mov $r0.15 = parity
;;
	c0	ldw $r0.17 = 0[$r0.16]
;;
;;
	c0	and $r0.16 = $r0.17, 1
;;
	c0	stw 0[$r0.15] = $r0.16
	c0	mov $r0.19 = 1
	c0	mov $r0.20 = alpha
	c0	mov $r0.21 = alpha3
	c0	mov $r0.22 = $r0.11
;;
LBB5_1:                                 ## %while.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	and $r0.23 = $r0.17, $r0.14
;;
	c0	cmpeq $b0.0 = $r0.23, 0
;;
;;
	c0	br $b0.0, LBB5_3
;;
## BB#2:                                ## %if.then
                                        ##   in Loop: Header=BB5_1 Depth=1
	c0	add $r0.23 = $r0.20, $r0.18
	c0	add $r0.24 = $r0.21, $r0.18
;;
	c0	ldb $r0.23 = 0[$r0.23]
;;
;;
	c0	xor $r0.22 = $r0.22, $r0.23
	c0	ldb $r0.23 = 0[$r0.24]
;;
	c0	stb 0[$r0.12] = $r0.22
;;
	c0	xor $r0.11 = $r0.11, $r0.23
	c0	add $r0.16 = $r0.16, 1
;;
	c0	stb 0[$r0.13] = $r0.11
;;
	c0	stw 0[$r0.15] = $r0.16
;;
LBB5_3:                                 ## %if.end
                                        ##   in Loop: Header=BB5_1 Depth=1
	c0	add $r0.23 = $r0.18, -1
	c0	shru $r0.14 = $r0.14, $r0.19
	c0	cmpgt $b0.0 = $r0.18, 0
;;
	c0	mov $r0.18 = $r0.23
;;
	c0	br $b0.0, LBB5_1
;;
## BB#4:                                ## %while.end
	c0	and $r0.11 = $r0.16, 1
;;
.return ret($r0.3:s32)
	c0	stw 0[$r0.15] = $r0.11
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @normalized_locator
normalized_locator::
## BB#0:                                ## %entry
	c0	mov $r0.11 = s1
	c0	mov $r0.12 = s3
	c0	mov $r0.13 = alpha_inv
	c0	mov $r0.14 = 0
	c0	mov $r0.15 = 1
;;
	c0	mov $r0.16 = 4
	c0	ldb $r0.11 = 0[$r0.11]
	c0	mpylu $r0.17 = $r0.14, 4229
	c0	mpyhs $r0.18 = $r0.14, 4229
	c0	mpylu $r0.19 = $r0.14, 2114
;;
	c0	mpyhs $r0.14 = $r0.14, 2114
;;
	c0	add $r0.11 = $r0.13, $r0.11
	c0	ldb $r0.12 = 0[$r0.12]
	c0	add $r0.17 = $r0.17, $r0.18
;;
	c0	add $r0.14 = $r0.19, $r0.14
;;
	c0	add $r0.12 = $r0.13, $r0.12
	c0	ldb $r0.11 = 0[$r0.11]
;;
	c0	ldb $r0.12 = 0[$r0.12]
;;
	c0	mpyhs $r0.13 = $r0.11, 3
	c0	mpylu $r0.11 = $r0.11, 3
	c0	mov $r0.18 = alpha
;;
;;
	c0	add $r0.11 = $r0.11, $r0.13
;;
	c0	sub $r0.13 = $r0.12, $r0.11
;;
	c0	sxtb $r0.13 = $r0.13
;;
	c0	cmpgt $b0.0 = $r0.13, 0
;;
;;
	c0	slct $r0.13 = $b0.0, $r0.12, $r0.11
;;
	c0	add $r0.13 = $r0.13, 30
;;
	c0	sub $r0.12 = $r0.13, $r0.12
;;
	c0	zxtb $r0.12 = $r0.12
;;
	c0	mpyhs $r0.19 = $r0.12, 4229
	c0	mpylu $r0.20 = $r0.12, 4229
	c0	mpyhs $r0.21 = $r0.12, 2114
	c0	mpylu $r0.22 = $r0.12, 2114
;;
;;
	c0	add $r0.19 = $r0.20, $r0.19
	c0	add $r0.20 = $r0.22, $r0.21
;;
	c0	shru $r0.19 = $r0.19, 16
;;
	c0	add $r0.17 = $r0.17, $r0.19
;;
	c0	zxth $r0.19 = $r0.17
	c0	shru $r0.17 = $r0.17, 16
;;
	c0	add $r0.19 = $r0.20, $r0.19
;;
	c0	shru $r0.19 = $r0.19, 16
;;
	c0	add $r0.14 = $r0.14, $r0.19
;;
	c0	add $r0.14 = $r0.14, $r0.17
;;
	c0	sub $r0.17 = $r0.12, $r0.14
;;
	c0	shru $r0.15 = $r0.17, $r0.15
;;
	c0	add $r0.14 = $r0.15, $r0.14
;;
	c0	shru $r0.14 = $r0.14, $r0.16
;;
	c0	mpyhs $r0.15 = $r0.14, 31
	c0	mpylu $r0.14 = $r0.14, 31
;;
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	sub $r0.12 = $r0.12, $r0.14
;;
	c0	sub $r0.12 = $r0.13, $r0.12
;;
	c0	sub $r0.11 = $r0.12, $r0.11
;;
	c0	sxtb $r0.11 = $r0.11
;;
	c0	add $r0.11 = $r0.18, $r0.11
;;
	c0	ldb $r0.11 = 0[$r0.11]
;;
;;
.return ret($r0.3:s32)
	c0	xor $r0.3 = $r0.11, 1
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @fix_bit
fix_bit::
## BB#0:                                ## %entry
	c0	add $r0.11 = $r0.3, 1
	c0	mov $r0.12 = hexword
	c0	mov $r0.13 = 1
;;
	c0	sxtb $r0.11 = $r0.11
	c0	ldw $r0.14 = 0[$r0.12]
;;
	c0	shl $r0.11 = $r0.13, $r0.11
;;
	c0	xor $r0.11 = $r0.14, $r0.11
;;
.return ret($r0.3:s32)
	c0	stw 0[$r0.12] = $r0.11
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @comp32
comp32::
## BB#0:                                ## %entry
	c0	xor $r0.11 = $r0.4, $r0.3
	c0	mov $r0.12 = 8
	c0	mov $r0.13 = 16
	c0	mov $r0.14 = 24
	c0	mov $r0.15 = err_tab
;;
	c0	shru $r0.12 = $r0.11, $r0.12
	c0	shru $r0.13 = $r0.11, $r0.13
	c0	zxtb $r0.16 = $r0.11
	c0	shru $r0.11 = $r0.11, $r0.14
;;
	c0	add $r0.14 = $r0.15, $r0.16
	c0	zxtb $r0.12 = $r0.12
	c0	zxtb $r0.13 = $r0.13
	c0	add $r0.11 = $r0.15, $r0.11
;;
	c0	add $r0.12 = $r0.15, $r0.12
	c0	add $r0.13 = $r0.15, $r0.13
	c0	ldbu $r0.14 = 0[$r0.14]
;;
	c0	ldbu $r0.12 = 0[$r0.12]
;;
	c0	ldbu $r0.13 = 0[$r0.13]
;;
	c0	add $r0.12 = $r0.12, $r0.14
;;
	c0	add $r0.12 = $r0.13, $r0.12
	c0	ldbu $r0.11 = 0[$r0.11]
;;
;;
.return ret($r0.3:s32)
	c0	add $r0.3 = $r0.11, $r0.12
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @sync_find
sync_find::
## BB#0:                                ## %entry
	c0	ldw $r0.14 = 0[$r0.3]
	c0	add $r0.23 = $r0.3, 4
	c0	mov $r0.11 = 18
	c0	mov $r0.12 = 0
	c0	mov $r0.13 = 8
	c0	mov $r0.15 = 16
	c0	mov $r0.16 = 24
;;
	c0	mov $r0.17 = err_tab
	c0	mov $r0.18 = 31
	c0	mov $r0.19 = 1
	c0	mov $r0.20 = $r0.11
;;
LBB9_1:                                 ## %while.body
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB9_2 Depth 2
	c0	ldw $r0.22 = 0[$r0.23]
	c0	add $r0.21 = $r0.23, 4
	c0	mov $r0.23 = $r0.12
;;
LBB9_2:                                 ## %while.body4
                                        ##   Parent Loop BB9_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	xor $r0.24 = $r0.14, 1045145627
;;
	c0	shru $r0.25 = $r0.24, $r0.13
	c0	shru $r0.26 = $r0.24, $r0.15
	c0	zxtb $r0.27 = $r0.24
	c0	shru $r0.24 = $r0.24, $r0.16
;;
	c0	add $r0.27 = $r0.17, $r0.27
	c0	zxtb $r0.25 = $r0.25
	c0	zxtb $r0.26 = $r0.26
	c0	add $r0.24 = $r0.17, $r0.24
;;
	c0	add $r0.25 = $r0.17, $r0.25
	c0	add $r0.26 = $r0.17, $r0.26
	c0	ldbu $r0.27 = 0[$r0.27]
;;
	c0	ldbu $r0.25 = 0[$r0.25]
;;
	c0	ldbu $r0.26 = 0[$r0.26]
;;
	c0	add $r0.25 = $r0.25, $r0.27
;;
	c0	add $r0.25 = $r0.25, $r0.26
	c0	ldbu $r0.24 = 0[$r0.24]
;;
;;
	c0	add $r0.24 = $r0.25, $r0.24
;;
	c0	cmplt $b0.0 = $r0.24, 3
;;
;;
	c0	br $b0.0, LBB9_7
;;
## BB#3:                                ## %if.end
                                        ##   in Loop: Header=BB9_2 Depth=2
	c0	xor $r0.24 = $r0.14, -1431655766
;;
	c0	shru $r0.25 = $r0.24, $r0.13
	c0	shru $r0.26 = $r0.24, $r0.15
	c0	zxtb $r0.27 = $r0.24
	c0	shru $r0.24 = $r0.24, $r0.16
;;
	c0	add $r0.27 = $r0.17, $r0.27
	c0	zxtb $r0.25 = $r0.25
	c0	zxtb $r0.26 = $r0.26
	c0	add $r0.24 = $r0.17, $r0.24
;;
	c0	add $r0.25 = $r0.17, $r0.25
	c0	add $r0.26 = $r0.17, $r0.26
	c0	ldbu $r0.27 = 0[$r0.27]
;;
	c0	ldbu $r0.25 = 0[$r0.25]
;;
	c0	ldbu $r0.26 = 0[$r0.26]
;;
	c0	add $r0.25 = $r0.27, $r0.25
;;
	c0	add $r0.25 = $r0.25, $r0.26
	c0	ldbu $r0.24 = 0[$r0.24]
;;
;;
	c0	add $r0.24 = $r0.25, $r0.24
;;
	c0	add $r0.24 = $r0.24, -3
;;
	c0	cmpltu $b0.0 = $r0.24, 27
;;
;;
	c0	brf $b0.0, LBB9_4
;;
## BB#5:                                ## %if.else
                                        ##   in Loop: Header=BB9_2 Depth=2
	c0	add $r0.23 = $r0.23, 1
	c0	shru $r0.24 = $r0.22, $r0.18
	c0	shl $r0.14 = $r0.14, $r0.19
	c0	shl $r0.22 = $r0.22, $r0.19
;;
	c0	cmplt $b0.0 = $r0.23, 32
	c0	or $r0.14 = $r0.24, $r0.14
;;
;;
	c0	br $b0.0, LBB9_2
;;
## BB#6:                                ## %while.end
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	add $r0.22 = $r0.20, -1
	c0	cmpgt $b0.0 = $r0.20, 1
;;
	c0	mov $r0.20 = $r0.22
	c0	mov $r0.23 = $r0.21
	c0	mov $r0.21 = $r0.12
;;
	c0	br $b0.0, LBB9_1
;;
	c0	goto LBB9_7
;;
LBB9_4:                                 ## %while.end.thread
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	shru $r0.14 = $r0.22, $r0.23
	c0	mov $r0.20 = $r0.11
	c0	mov $r0.23 = $r0.21
	c0	goto LBB9_1
;;
LBB9_7:                                 ## %return
.return ret($r0.3:s32)
	c0	mov $r0.3 = $r0.21
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @addr_corr
addr_corr::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 44[$r0.1] = $r0.57
;;
	c0	stw 40[$r0.1] = $r0.58
;;
	c0	stw 36[$r0.1] = $r0.59
;;
	c0	stw 32[$r0.1] = $r0.60
;;
	c0	stw 28[$r0.1] = $r0.61
;;
	c0	stw 24[$r0.1] = $r0.62
;;
	c0	stw 20[$r0.1] = $l0.0
	c0	mov $r0.58 = 13
;;
	c0	shru $r0.11 = $r0.3, $r0.58
	c0	mov $r0.59 = 8
	c0	mov $r0.60 = 16
	c0	mov $r0.57 = err_tab
	c0	mov $r0.61 = 173902
;;
	c0	xor $r0.12 = $r0.11, 173902
;;
	c0	shru $r0.13 = $r0.12, $r0.59
	c0	shru $r0.14 = $r0.12, $r0.60
	c0	zxtb $r0.12 = $r0.12
;;
	c0	add $r0.12 = $r0.57, $r0.12
	c0	zxtb $r0.13 = $r0.13
	c0	add $r0.14 = $r0.57, $r0.14
;;
	c0	add $r0.13 = $r0.57, $r0.13
	c0	ldbu $r0.12 = 0[$r0.12]
;;
	c0	ldbu $r0.13 = 0[$r0.13]
;;
	c0	ldbu $r0.14 = 0[$r0.14]
;;
	c0	add $r0.12 = $r0.13, $r0.12
;;
	c0	add $r0.62 = $r0.12, $r0.14
;;
	c0	cmplt $b0.0 = $r0.62, 3
;;
;;
	c0	br $b0.0, LBB10_2
;;
## BB#1:                                ## %if.end
	c0	xor $r0.11 = $r0.11, 119386
;;
	c0	shru $r0.12 = $r0.11, $r0.59
	c0	shru $r0.13 = $r0.11, $r0.60
	c0	zxtb $r0.11 = $r0.11
;;
	c0	add $r0.14 = $r0.57, $r0.11
	c0	zxtb $r0.12 = $r0.12
	c0	add $r0.13 = $r0.57, $r0.13
	c0	mov $r0.11 = 0
	c0	mov $r0.61 = 119386
;;
	c0	add $r0.12 = $r0.57, $r0.12
	c0	ldbu $r0.14 = 0[$r0.14]
;;
	c0	ldbu $r0.12 = 0[$r0.12]
;;
	c0	ldbu $r0.13 = 0[$r0.13]
;;
	c0	add $r0.12 = $r0.12, $r0.14
;;
	c0	add $r0.62 = $r0.12, $r0.13
;;
	c0	cmpgt $b0.0 = $r0.62, 2
;;
;;
	c0	br $b0.0, LBB10_7
;;
LBB10_2:                                ## %if.then3
.call err_corr, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = err_corr
;;
	c0	mov $r0.12 = error_code
	c0	mov $r0.11 = 0
;;
	c0	ldw $r0.12 = 0[$r0.12]
;;
;;
	c0	cmpgt $b0.0 = $r0.12, 2
;;
;;
	c0	br $b0.0, LBB10_7
;;
## BB#3:                                ## %if.then6
	c0	cmpeq $b0.0 = $r0.12, 0
;;
;;
	c0	br $b0.0, LBB10_5
;;
## BB#4:                                ## %if.then8
	c0	shru $r0.12 = $r0.3, $r0.58
;;
	c0	xor $r0.12 = $r0.12, $r0.61
;;
	c0	shru $r0.13 = $r0.12, $r0.59
	c0	shru $r0.14 = $r0.12, $r0.60
	c0	zxtb $r0.12 = $r0.12
;;
	c0	add $r0.12 = $r0.57, $r0.12
	c0	zxtb $r0.13 = $r0.13
	c0	add $r0.14 = $r0.57, $r0.14
;;
	c0	add $r0.13 = $r0.57, $r0.13
	c0	ldbu $r0.12 = 0[$r0.12]
;;
	c0	ldbu $r0.13 = 0[$r0.13]
;;
	c0	ldbu $r0.14 = 0[$r0.14]
;;
	c0	add $r0.12 = $r0.13, $r0.12
;;
	c0	add $r0.62 = $r0.12, $r0.14
;;
LBB10_5:                                ## %if.end11
	c0	cmpne $b0.0 = $r0.62, 0
;;
;;
	c0	br $b0.0, LBB10_7
;;
## BB#6:                                ## %if.then13
	c0	mov $r0.11 = 11
;;
	c0	shru $r0.12 = $r0.3, $r0.11
	c0	mov $r0.11 = 1
	c0	mov $r0.13 = func
;;
	c0	and $r0.12 = $r0.12, 3
;;
	c0	stw 0[$r0.13] = $r0.12
;;
LBB10_7:                                ## %return
	c0	mov $r0.3 = $r0.11
	c0	ldw $l0.0 = 20[$r0.1]
;;
	c0	ldw $r0.62 = 24[$r0.1]
;;
	c0	ldw $r0.61 = 28[$r0.1]
;;
	c0	ldw $r0.60 = 32[$r0.1]
;;
	c0	ldw $r0.59 = 36[$r0.1]
;;
	c0	ldw $r0.58 = 40[$r0.1]
;;
.return ret($r0.3:s32)
	c0	ldw $r0.57 = 44[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @num_proc
num_proc::
## BB#0:                                ## %entry
	c0	mov $r0.11 = error_code
;;
	c0	ldw $r0.11 = 0[$r0.11]
;;
;;
	c0	cmpgt $b0.0 = $r0.11, 2
;;
;;
	c0	br $b0.0, LBB11_5
;;
## BB#1:                                ## %if.then.us
	c0	and $r0.11 = $r0.4, 15
;;
	c0	cmpltu $b0.0 = $r0.11, 10
;;
;;
	c0	brf $b0.0, LBB11_2
;;
## BB#3:                                ## %if.then6.us
	c0	mov $r0.12 = msg
;;
	c0	add $r0.12 = $r0.12, $r0.3
	c0	or $r0.11 = $r0.11, 48
;;
	c0	stb 0[$r0.12] = $r0.11
	c0	goto LBB11_6
;;
LBB11_5:                                ## %if.end12.4
	c0	mov $r0.11 = msg
;;
	c0	add $r0.11 = $r0.11, $r0.3
	c0	mov $r0.12 = 128
;;
	c0	stb 3[$r0.11] = $r0.12
;;
	c0	stb 2[$r0.11] = $r0.12
;;
	c0	stb 1[$r0.11] = $r0.12
;;
	c0	stb 0[$r0.11] = $r0.12
;;
	c0	stb 4[$r0.11] = $r0.12
	c0	goto LBB11_4
;;
LBB11_2:                                ## %if.else.us
	c0	mov $r0.12 = msg
;;
	c0	add $r0.12 = $r0.12, $r0.3
;;
	c0	stb 0[$r0.12] = $r0.11
;;
LBB11_6:                                ## %if.then.us.1
	c0	mov $r0.11 = 4
;;
	c0	shru $r0.11 = $r0.4, $r0.11
;;
	c0	and $r0.11 = $r0.11, 15
	c0	add $r0.12 = $r0.3, 1
;;
	c0	cmpltu $b0.0 = $r0.11, 10
;;
;;
	c0	br $b0.0, LBB11_8
;;
## BB#7:                                ## %if.else.us.1
	c0	mov $r0.13 = msg
;;
	c0	add $r0.12 = $r0.13, $r0.12
;;
	c0	stb 0[$r0.12] = $r0.11
	c0	goto LBB11_9
;;
LBB11_8:                                ## %if.then6.us.1
	c0	mov $r0.13 = msg
;;
	c0	add $r0.12 = $r0.13, $r0.12
	c0	or $r0.11 = $r0.11, 48
;;
	c0	stb 0[$r0.12] = $r0.11
;;
LBB11_9:                                ## %if.then.us.2
	c0	mov $r0.11 = 8
;;
	c0	shru $r0.11 = $r0.4, $r0.11
;;
	c0	and $r0.11 = $r0.11, 15
	c0	add $r0.12 = $r0.3, 2
;;
	c0	cmpltu $b0.0 = $r0.11, 10
;;
;;
	c0	br $b0.0, LBB11_11
;;
## BB#10:                               ## %if.else.us.2
	c0	mov $r0.13 = msg
;;
	c0	add $r0.12 = $r0.13, $r0.12
;;
	c0	stb 0[$r0.12] = $r0.11
	c0	goto LBB11_12
;;
LBB11_11:                               ## %if.then6.us.2
	c0	mov $r0.13 = msg
;;
	c0	add $r0.12 = $r0.13, $r0.12
	c0	or $r0.11 = $r0.11, 48
;;
	c0	stb 0[$r0.12] = $r0.11
;;
LBB11_12:                               ## %if.then.us.3
	c0	mov $r0.11 = 12
;;
	c0	shru $r0.11 = $r0.4, $r0.11
;;
	c0	and $r0.11 = $r0.11, 15
	c0	add $r0.12 = $r0.3, 3
;;
	c0	cmpltu $b0.0 = $r0.11, 10
;;
;;
	c0	br $b0.0, LBB11_14
;;
## BB#13:                               ## %if.else.us.3
	c0	mov $r0.13 = msg
;;
	c0	add $r0.12 = $r0.13, $r0.12
;;
	c0	stb 0[$r0.12] = $r0.11
	c0	goto LBB11_15
;;
LBB11_14:                               ## %if.then6.us.3
	c0	mov $r0.13 = msg
;;
	c0	add $r0.12 = $r0.13, $r0.12
	c0	or $r0.11 = $r0.11, 48
;;
	c0	stb 0[$r0.12] = $r0.11
;;
LBB11_15:                               ## %if.then.us.4
	c0	mov $r0.11 = 16
;;
	c0	shru $r0.11 = $r0.4, $r0.11
;;
	c0	and $r0.11 = $r0.11, 15
	c0	add $r0.12 = $r0.3, 4
;;
	c0	cmpltu $b0.0 = $r0.11, 10
;;
;;
	c0	brf $b0.0, LBB11_16
;;
## BB#17:                               ## %if.then6.us.4
	c0	mov $r0.13 = msg
;;
	c0	add $r0.12 = $r0.13, $r0.12
	c0	or $r0.11 = $r0.11, 48
;;
	c0	stb 0[$r0.12] = $r0.11
	c0	goto LBB11_4
;;
LBB11_16:                               ## %if.else.us.4
	c0	mov $r0.13 = msg
;;
	c0	add $r0.12 = $r0.13, $r0.12
;;
	c0	stb 0[$r0.12] = $r0.11
;;
LBB11_4:                                ## %while.end
.return ret($r0.3:s32)
	c0	add $r0.3 = $r0.3, 5
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @alpha_proc
alpha_proc::
## BB#0:                                ## %entry
	c0	mov $r0.11 = alpha_count
	c0	mov $r0.13 = error_code
	c0	mov $r0.15 = 0
;;
	c0	ldw $r0.12 = 0[$r0.11]
;;
	c0	ldw $r0.14 = 0[$r0.13]
;;
	c0	cmplt $b0.0 = $r0.12, 1
	c0	mov $r0.13 = $r0.3
;;
;;
	c0	br $b0.0, LBB12_4
;;
## BB#1:                                ## %if.then
	c0	mov $r0.15 = 128
	c0	cmpgt $b0.0 = $r0.14, 2
;;
;;
	c0	br $b0.0, LBB12_3
;;
## BB#2:                                ## %if.then3
	c0	mov $r0.13 = msg
;;
	c0	add $r0.13 = $r0.13, $r0.3
	c0	mov $r0.15 = 7
;;
	c0	sub $r0.15 = $r0.15, $r0.12
	c0	ldb $r0.13 = 0[$r0.13]
;;
	c0	shl $r0.15 = $r0.4, $r0.15
;;
	c0	or $r0.13 = $r0.13, $r0.15
;;
	c0	and $r0.15 = $r0.13, 127
;;
LBB12_3:                                ## %if.end
	c0	mov $r0.16 = msg
	c0	add $r0.13 = $r0.3, 1
;;
	c0	add $r0.16 = $r0.16, $r0.3
;;
	c0	stb 0[$r0.16] = $r0.15
	c0	mov $r0.15 = $r0.12
;;
LBB12_4:                                ## %while.cond.preheader
	c0	cmplt $b0.0 = $r0.14, 3
;;
;;
	c0	brf $b0.0, LBB12_6
;;
## BB#7:                                ## %if.end20.us.2
	c0	shru $r0.14 = $r0.4, $r0.15
	c0	add $r0.16 = $r0.15, 7
	c0	add $r0.15 = $r0.15, 14
	c0	mov $r0.17 = msg
;;
	c0	shru $r0.16 = $r0.4, $r0.16
	c0	shru $r0.15 = $r0.4, $r0.15
	c0	add $r0.17 = $r0.17, $r0.13
	c0	and $r0.14 = $r0.14, 127
;;
	c0	stb 0[$r0.17] = $r0.14
	c0	and $r0.14 = $r0.16, 127
	c0	and $r0.15 = $r0.15, 127
;;
	c0	stb 1[$r0.17] = $r0.14
;;
	c0	stb 2[$r0.17] = $r0.15
	c0	goto LBB12_5
;;
LBB12_6:                                ## %if.end20.2
	c0	mov $r0.14 = msg
;;
	c0	add $r0.14 = $r0.14, $r0.13
	c0	mov $r0.15 = 128
;;
	c0	stb 1[$r0.14] = $r0.15
;;
	c0	stb 0[$r0.14] = $r0.15
;;
	c0	stb 2[$r0.14] = $r0.15
;;
LBB12_5:                                ## %while.end
	c0	cmpeq $b0.0 = $r0.12, 6
	c0	add $r0.12 = $r0.12, 1
	c0	mov $r0.14 = 0
;;
;;
	c0	slct $r0.12 = $b0.0, $r0.14, $r0.12
;;
.return ret($r0.3:s32)
	c0	stw 0[$r0.11] = $r0.12
	c0	add $r0.3 = $r0.13, 2
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg() ## @msg_proc
msg_proc::
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
	c0	mov $r0.58 = 1
	c0	mov $r0.59 = 0
	c0	mov $r0.11 = 8
;;
	c0	stw 60[$r0.1] = $r0.11
	c0	mov $r0.11 = 16
;;
	c0	stw 56[$r0.1] = $r0.11
	c0	mov $r0.11 = 24
;;
	c0	stw 48[$r0.1] = $r0.11
	c0	mov $r0.61 = err_tab
	c0	mov $r0.11 = error_code
;;
	c0	stw 44[$r0.1] = $r0.11
	c0	mov $r0.11 = 13
;;
	c0	stw 24[$r0.1] = $r0.11
	c0	mov $r0.11 = func
;;
	c0	stw 40[$r0.1] = $r0.11
	c0	mov $r0.11 = 11
;;
	c0	stw 36[$r0.1] = $r0.11
	c0	mov $r0.11 = alpha_count
;;
	c0	stw 32[$r0.1] = $r0.11
	c0	mov $r0.11 = 128
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	mov $r0.11 = msg
;;
	c0	stw 52[$r0.1] = $r0.11
	c0	mov $r0.11 = 7
;;
	c0	stw 20[$r0.1] = $r0.11
	c0	mov $r0.63 = $r0.3
	c0	mov $r0.62 = $r0.59
	c0	mov $r0.57 = $r0.59
	c0	mov $r0.60 = $r0.59
;;
LBB13_1:                                ## %while.body.outer
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.11 = 0[$r0.63]
	c0	add $r0.12 = $r0.63, 4
	c0	cmpne $b0.0 = $r0.57, 16
;;
;;
	c0	br $b0.0, LBB13_6
;;
## BB#2:                                ## %if.then.lr.ph
                                        ##   in Loop: Header=BB13_1 Depth=1
	c0	xor $r0.11 = $r0.11, 1045145627
	c0	ldw $r0.12 = 60[$r0.1]
;;
;;
	c0	shru $r0.12 = $r0.11, $r0.12
	c0	ldw $r0.13 = 56[$r0.1]
;;
;;
	c0	shru $r0.13 = $r0.11, $r0.13
	c0	zxtb $r0.14 = $r0.11
	c0	ldw $r0.15 = 48[$r0.1]
;;
;;
	c0	shru $r0.11 = $r0.11, $r0.15
	c0	add $r0.14 = $r0.61, $r0.14
	c0	zxtb $r0.12 = $r0.12
	c0	zxtb $r0.13 = $r0.13
;;
	c0	add $r0.11 = $r0.61, $r0.11
	c0	add $r0.12 = $r0.61, $r0.12
	c0	add $r0.13 = $r0.61, $r0.13
	c0	ldbu $r0.14 = 0[$r0.14]
;;
	c0	ldbu $r0.12 = 0[$r0.12]
;;
	c0	ldbu $r0.13 = 0[$r0.13]
;;
	c0	add $r0.12 = $r0.12, $r0.14
;;
	c0	add $r0.12 = $r0.12, $r0.13
	c0	ldbu $r0.11 = 0[$r0.11]
;;
;;
	c0	add $r0.11 = $r0.12, $r0.11
;;
	c0	cmpgt $b0.0 = $r0.11, 2
	c0	mov $r0.13 = $r0.59
;;
;;
	c0	brf $b0.0, LBB13_3
;;
## BB#4:                                ## %if.else
                                        ##   in Loop: Header=BB13_1 Depth=1
	c0	cmpeq $b0.0 = $r0.60, 1
	c0	mov $r0.14 = $r0.62
;;
;;
	c0	br $b0.0, LBB13_25
;;
## BB#5:                                ## %if.else5
                                        ##   in Loop: Header=BB13_1 Depth=1
	c0	add $r0.13 = $r0.60, 1
;;
LBB13_3:                                ## %while.body.backedge
                                        ##   in Loop: Header=BB13_1 Depth=1
	c0	ldw $r0.11 = 4[$r0.63]
	c0	add $r0.12 = $r0.63, 8
	c0	mov $r0.60 = $r0.13
	c0	mov $r0.57 = $r0.59
;;
LBB13_6:                                ## %if.else7
                                        ##   in Loop: Header=BB13_1 Depth=1
	c0	mov $r0.63 = $r0.12
	c0	cmpeq $b0.0 = $r0.58, 0
;;
;;
	c0	br $b0.0, LBB13_9
;;
## BB#7:                                ## %if.then8
                                        ##   in Loop: Header=BB13_1 Depth=1
	c0	and $r0.12 = $r0.57, -2
;;
	c0	cmpne $b0.0 = $r0.12, 6
;;
;;
	c0	br $b0.0, LBB13_24
;;
## BB#8:                                ## %if.then11
                                        ##   in Loop: Header=BB13_1 Depth=1
	c0	mov $r0.3 = $r0.11
;;
.call addr_corr, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = addr_corr
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	slct $r0.58 = $b0.0, $r0.58, 0
	c0	goto LBB13_24
;;
LBB13_9:                                ## %if.else17
                                        ##   in Loop: Header=BB13_1 Depth=1
	c0	mov $r0.3 = $r0.11
;;
.call err_corr, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = err_corr
;;
	c0	ldw $r0.11 = 44[$r0.1]
;;
;;
	c0	ldw $r0.11 = 0[$r0.11]
	c0	and $r0.12 = $r0.57, -2
;;
	c0	cmpne $b0.0 = $r0.12, 6
;;
;;
	c0	br $b0.0, LBB13_13
;;
## BB#10:                               ## %if.else17
                                        ##   in Loop: Header=BB13_1 Depth=1
	c0	cmpgt $b0.0 = $r0.11, 2
;;
;;
	c0	br $b0.0, LBB13_13
;;
## BB#11:                               ## %if.then24
                                        ##   in Loop: Header=BB13_1 Depth=1
	c0	ldw $r0.12 = 24[$r0.1]
;;
;;
	c0	shru $r0.12 = $r0.3, $r0.12
;;
	c0	xor $r0.13 = $r0.12, 173902
	c0	ldw $r0.14 = 60[$r0.1]
;;
;;
	c0	shru $r0.14 = $r0.13, $r0.14
	c0	zxtb $r0.15 = $r0.13
	c0	ldw $r0.16 = 56[$r0.1]
;;
;;
	c0	shru $r0.13 = $r0.13, $r0.16
	c0	add $r0.15 = $r0.61, $r0.15
	c0	zxtb $r0.14 = $r0.14
;;
	c0	add $r0.13 = $r0.61, $r0.13
	c0	add $r0.14 = $r0.61, $r0.14
	c0	ldbu $r0.15 = 0[$r0.15]
;;
	c0	ldbu $r0.14 = 0[$r0.14]
;;
	c0	ldbu $r0.13 = 0[$r0.13]
;;
	c0	add $r0.14 = $r0.15, $r0.14
;;
	c0	sub $r0.14 = $r0.59, $r0.14
;;
	c0	cmpeq $b0.0 = $r0.13, $r0.14
	c0	mov $r0.14 = $r0.62
;;
;;
	c0	br $b0.0, LBB13_25
;;
## BB#12:                               ## %if.end30
                                        ##   in Loop: Header=BB13_1 Depth=1
	c0	xor $r0.12 = $r0.12, 119386
	c0	ldw $r0.13 = 60[$r0.1]
;;
;;
	c0	shru $r0.13 = $r0.12, $r0.13
	c0	zxtb $r0.14 = $r0.12
	c0	ldw $r0.15 = 56[$r0.1]
;;
;;
	c0	shru $r0.12 = $r0.12, $r0.15
	c0	add $r0.14 = $r0.61, $r0.14
	c0	zxtb $r0.13 = $r0.13
;;
	c0	add $r0.12 = $r0.61, $r0.12
	c0	add $r0.13 = $r0.61, $r0.13
	c0	ldbu $r0.14 = 0[$r0.14]
;;
	c0	ldbu $r0.13 = 0[$r0.13]
;;
	c0	ldbu $r0.12 = 0[$r0.12]
;;
	c0	add $r0.13 = $r0.14, $r0.13
;;
	c0	sub $r0.13 = $r0.59, $r0.13
;;
	c0	cmpeq $b0.0 = $r0.12, $r0.13
	c0	mov $r0.14 = $r0.62
;;
;;
	c0	br $b0.0, LBB13_25
;;
LBB13_13:                               ## %if.end34
                                        ##   in Loop: Header=BB13_1 Depth=1
	c0	ldw $r0.12 = 40[$r0.1]
;;
;;
	c0	ldw $r0.12 = 0[$r0.12]
;;
	c0	ldw $r0.13 = 36[$r0.1]
;;
;;
	c0	shru $r0.13 = $r0.3, $r0.13
;;
	c0	and $r0.13 = $r0.13, 1048575
	c0	cmpeq $b0.0 = $r0.12, 3
;;
;;
	c0	brf $b0.0, LBB13_14
;;
## BB#16:                               ## %sw.bb37
                                        ##   in Loop: Header=BB13_1 Depth=1
	c0	ldw $r0.12 = 32[$r0.1]
;;
;;
	c0	ldw $r0.12 = 0[$r0.12]
;;
;;
	c0	cmplt $b0.0 = $r0.12, 1
	c0	mov $r0.14 = $r0.59
;;
;;
	c0	br $b0.0, LBB13_20
;;
## BB#17:                               ## %if.then.i
                                        ##   in Loop: Header=BB13_1 Depth=1
	c0	cmpgt $b0.0 = $r0.11, 2
	c0	ldw $r0.14 = 28[$r0.1]
;;
;;
	c0	br $b0.0, LBB13_19
;;
## BB#18:                               ## %if.then3.i
                                        ##   in Loop: Header=BB13_1 Depth=1
	c0	ldw $r0.14 = 52[$r0.1]
;;
;;
	c0	add $r0.14 = $r0.14, $r0.62
	c0	ldw $r0.15 = 20[$r0.1]
;;
;;
	c0	sub $r0.15 = $r0.15, $r0.12
	c0	ldb $r0.14 = 0[$r0.14]
;;
	c0	shl $r0.15 = $r0.13, $r0.15
;;
	c0	or $r0.14 = $r0.14, $r0.15
;;
	c0	and $r0.14 = $r0.14, 127
;;
LBB13_19:                               ## %if.end.i
                                        ##   in Loop: Header=BB13_1 Depth=1
	c0	add $r0.15 = $r0.62, 1
	c0	ldw $r0.16 = 52[$r0.1]
;;
;;
	c0	add $r0.16 = $r0.16, $r0.62
;;
	c0	stb 0[$r0.16] = $r0.14
	c0	mov $r0.62 = $r0.15
	c0	mov $r0.14 = $r0.12
;;
LBB13_20:                               ## %while.cond.preheader.i
                                        ##   in Loop: Header=BB13_1 Depth=1
	c0	cmplt $b0.0 = $r0.11, 3
;;
;;
	c0	br $b0.0, LBB13_22
;;
## BB#21:                               ## %if.end20.2.i
                                        ##   in Loop: Header=BB13_1 Depth=1
	c0	add $r0.11 = $r0.62, 2
	c0	ldw $r0.14 = 52[$r0.1]
;;
;;
	c0	stw 52[$r0.1] = $r0.14
	c0	add $r0.13 = $r0.14, $r0.11
	c0	add $r0.14 = $r0.14, $r0.62
;;
	c0	ldw $r0.15 = 28[$r0.1]
;;
;;
	c0	stw 28[$r0.1] = $r0.15
;;
	c0	stb 1[$r0.14] = $r0.15
;;
	c0	stb 0[$r0.14] = $r0.15
;;
	c0	stb 0[$r0.13] = $r0.15
	c0	mov $r0.62 = $r0.11
	c0	goto LBB13_23
;;
LBB13_14:                               ## %if.end34
                                        ##   in Loop: Header=BB13_1 Depth=1
	c0	cmpne $b0.0 = $r0.12, 0
	c0	mov $r0.14 = $r0.59
;;
;;
	c0	br $b0.0, LBB13_25
;;
## BB#15:                               ## %sw.bb
                                        ##   in Loop: Header=BB13_1 Depth=1
	c0	mov $r0.3 = $r0.62
	c0	mov $r0.4 = $r0.13
;;
.call num_proc, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = num_proc
;;
	c0	mov $r0.62 = $r0.3
	c0	mov $r0.58 = $r0.59
	c0	goto LBB13_24
;;
LBB13_22:                               ## %if.end20.us.2.i
                                        ##   in Loop: Header=BB13_1 Depth=1
	c0	shru $r0.11 = $r0.13, $r0.14
	c0	add $r0.15 = $r0.14, 7
;;
	c0	shru $r0.15 = $r0.13, $r0.15
	c0	add $r0.14 = $r0.14, 14
	c0	and $r0.11 = $r0.11, 127
	c0	add $r0.16 = $r0.62, 2
;;
	c0	shru $r0.13 = $r0.13, $r0.14
	c0	ldw $r0.17 = 52[$r0.1]
;;
;;
	c0	stw 52[$r0.1] = $r0.17
	c0	add $r0.14 = $r0.17, $r0.62
	c0	add $r0.17 = $r0.17, $r0.16
	c0	and $r0.15 = $r0.15, 127
;;
	c0	stb 0[$r0.14] = $r0.11
	c0	and $r0.11 = $r0.13, 127
;;
	c0	stb 1[$r0.14] = $r0.15
;;
	c0	stb 0[$r0.17] = $r0.11
	c0	mov $r0.62 = $r0.16
;;
LBB13_23:                               ## %alpha_proc.exit
                                        ##   in Loop: Header=BB13_1 Depth=1
	c0	cmpeq $b0.0 = $r0.12, 6
	c0	add $r0.11 = $r0.12, 1
;;
;;
	c0	slct $r0.11 = $b0.0, $r0.59, $r0.11
	c0	ldw $r0.12 = 32[$r0.1]
;;
;;
	c0	stw 0[$r0.12] = $r0.11
	c0	mov $r0.58 = $r0.59
;;
LBB13_24:                               ## %if.end39
                                        ##   in Loop: Header=BB13_1 Depth=1
	c0	add $r0.57 = $r0.57, 1
	c0	goto LBB13_1
;;
LBB13_25:                               ## %return
	c0	mov $r0.3 = $r0.14
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
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @main
main::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 44[$r0.1] = $r0.57
;;
	c0	stw 40[$r0.1] = $r0.58
;;
	c0	stw 36[$r0.1] = $r0.59
;;
	c0	stw 32[$r0.1] = $r0.60
;;
	c0	stw 28[$r0.1] = $l0.0
	c0	mov $r0.59 = alpha_count
	c0	mov $r0.57 = 0
	c0	mov $r0.3 = numeric_data
	c0	mov $r0.58 = 15
;;
.call sync_find, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	stw 0[$r0.59] = $r0.57
	c0	call $l0.0 = sync_find
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB14_8
;;
## BB#1:                                ## %if.then2
.call msg_proc, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = msg_proc
;;
	c0	mov $r0.60 = func
;;
	c0	ldw $r0.11 = 0[$r0.60]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB14_3
;;
## BB#2:                                ## %if.then2
	c0	cmpne $b0.0 = $r0.11, 3
;;
;;
	c0	br $b0.0, LBB14_8
;;
LBB14_3:                                ## %for.inc
	c0	mov $r0.3 = alpha_data
	c0	stw 0[$r0.59] = $r0.57
;;
.call sync_find, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = sync_find
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB14_8
;;
## BB#9:                                ## %if.then2.1
.call msg_proc, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = msg_proc
;;
	c0	ldw $r0.11 = 0[$r0.60]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB14_5
;;
## BB#10:                               ## %if.then2.1
	c0	cmpeq $b0.0 = $r0.11, 3
;;
;;
	c0	brf $b0.0, LBB14_8
;;
LBB14_5:                                ## %for.body.i
                                        ## =>This Inner Loop Header: Depth=1
	c0	mov $r0.11 = .str
	c0	mov $r0.12 = msg
;;
	c0	add $r0.11 = $r0.11, $r0.57
	c0	mtb $b0.0 = $r0.0
	c0	add $r0.12 = $r0.12, $r0.57
;;
	c0	ldb $r0.11 = 0[$r0.11]
;;
	c0	ldb $r0.12 = 0[$r0.12]
;;
;;
	c0	cmplt $b0.1 = $r0.12, $r0.11
;;
;;
	c0	br $b0.1, LBB14_7
;;
## BB#6:                                ## %if.else.i
                                        ##   in Loop: Header=BB14_5 Depth=1
	c0	cmple $b0.1 = $r0.12, $r0.11
;;
;;
	c0	brf $b0.1, LBB14_7
;;
## BB#4:                                ## %for.cond.i
                                        ##   in Loop: Header=BB14_5 Depth=1
	c0	add $r0.57 = $r0.57, 1
;;
	c0	cmpgtu $b0.1 = $r0.57, 26
;;
;;
	c0	brf $b0.1, LBB14_5
;;
LBB14_7:                                ## %strncmp.exit
	c0	cmpeq $b0.1 = $r0.3, 88
	c0	mov $r0.11 = 66
;;
	c0	slct $r0.11 = $b0.0, $r0.11, 15
;;
	c0	slct $r0.58 = $b0.1, $r0.11, 15
;;
LBB14_8:                                ## %return
	c0	mov $r0.3 = $r0.58
	c0	ldw $l0.0 = 28[$r0.1]
;;
	c0	ldw $r0.60 = 32[$r0.1]
;;
	c0	ldw $r0.59 = 36[$r0.1]
;;
	c0	ldw $r0.58 = 40[$r0.1]
;;
.return ret($r0.3:s32)
	c0	ldw $r0.57 = 44[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .data

	.align	4                       ## @rand.next
rand.next:
	.data4	1                       ## 0x1

	.comm	hexword,4,4             ## @hexword
	.comm	s1,1,1                  ## @s1
	.comm	s3,1,1                  ## @s3
	.comm	error_code,4,4          ## @error_code
.section .data
alpha_inv:                              ## @alpha_inv
	.data1 0
	.data1 0
	.data1 1
	.data1 18
	.data1 2
	.data1 5
	.data1 19
	.data1 11
	.data1 3
	.data1 29
	.data1 6
	.data1 27
	.data1 20
	.data1 8
	.data1 12
	.data1 23
	.data1 4
	.data1 10
	.data1 30
	.data1 17
	.data1 7
	.data1 22
	.data1 28
	.data1 26
	.data1 21
	.data1 25
	.data1 9
	.data1 16
	.data1 13
	.data1 14
	.data1 24
	.data1 15

roots:                                  ## @roots
	.data1 0
	.data1 128
	.data1 3
	.data1 128
	.data1 6
	.data1 128
	.data1 1
	.data1 128
	.data1 128
	.data1 7
	.data1 128
	.data1 13
	.data1 128
	.data1 15
	.data1 128
	.data1 26
	.data1 12
	.data1 128
	.data1 11
	.data1 128
	.data1 2
	.data1 128
	.data1 8
	.data1 128
	.data1 128
	.data1 9
	.data1 128
	.data1 17
	.data1 128
	.data1 4
	.data1 128
	.data1 21

alpha:                                  ## @alpha
	.data1 1
	.data1 2
	.data1 4
	.data1 8
	.data1 16
	.data1 5
	.data1 10
	.data1 20
	.data1 13
	.data1 26
	.data1 17
	.data1 7
	.data1 14
	.data1 28
	.data1 29
	.data1 31
	.data1 27
	.data1 19
	.data1 3
	.data1 6
	.data1 12
	.data1 24
	.data1 21
	.data1 15
	.data1 30
	.data1 25
	.data1 23
	.data1 11
	.data1 22
	.data1 9
	.data1 18
.skip 1

	.comm	parity,4,4              ## @parity
alpha3:                                 ## @alpha3
	.data1 1
	.data1 8
	.data1 10
	.data1 26
	.data1 14
	.data1 31
	.data1 3
	.data1 24
	.data1 30
	.data1 11
	.data1 18
	.data1 4
	.data1 5
	.data1 13
	.data1 7
	.data1 29
	.data1 19
	.data1 12
	.data1 15
	.data1 23
	.data1 9
	.data1 2
	.data1 16
	.data1 20
	.data1 17
	.data1 28
	.data1 27
	.data1 6
	.data1 21
	.data1 25
	.data1 22
.skip 1

.section .bss

	.align	4                       ## @alpha_count
alpha_count:
	.data4	0                       ## 0x0

.section .data
err_tab:                                ## @err_tab
	.data1 0
	.data1 1
	.data1 1
	.data1 2
	.data1 1
	.data1 2
	.data1 2
	.data1 3
	.data1 1
	.data1 2
	.data1 2
	.data1 3
	.data1 2
	.data1 3
	.data1 3
	.data1 4
	.data1 1
	.data1 2
	.data1 2
	.data1 3
	.data1 2
	.data1 3
	.data1 3
	.data1 4
	.data1 2
	.data1 3
	.data1 3
	.data1 4
	.data1 3
	.data1 4
	.data1 4
	.data1 5
	.data1 1
	.data1 2
	.data1 2
	.data1 3
	.data1 2
	.data1 3
	.data1 3
	.data1 4
	.data1 2
	.data1 3
	.data1 3
	.data1 4
	.data1 3
	.data1 4
	.data1 4
	.data1 5
	.data1 2
	.data1 3
	.data1 3
	.data1 4
	.data1 3
	.data1 4
	.data1 4
	.data1 5
	.data1 3
	.data1 4
	.data1 4
	.data1 5
	.data1 4
	.data1 5
	.data1 5
	.data1 6
	.data1 1
	.data1 2
	.data1 2
	.data1 3
	.data1 2
	.data1 3
	.data1 3
	.data1 4
	.data1 2
	.data1 3
	.data1 3
	.data1 4
	.data1 3
	.data1 4
	.data1 4
	.data1 5
	.data1 2
	.data1 3
	.data1 3
	.data1 4
	.data1 3
	.data1 4
	.data1 4
	.data1 5
	.data1 3
	.data1 4
	.data1 4
	.data1 5
	.data1 4
	.data1 5
	.data1 5
	.data1 6
	.data1 2
	.data1 3
	.data1 3
	.data1 4
	.data1 3
	.data1 4
	.data1 4
	.data1 5
	.data1 3
	.data1 4
	.data1 4
	.data1 5
	.data1 4
	.data1 5
	.data1 5
	.data1 6
	.data1 3
	.data1 4
	.data1 4
	.data1 5
	.data1 4
	.data1 5
	.data1 5
	.data1 6
	.data1 4
	.data1 5
	.data1 5
	.data1 6
	.data1 5
	.data1 6
	.data1 6
	.data1 7
	.data1 1
	.data1 2
	.data1 2
	.data1 3
	.data1 2
	.data1 3
	.data1 3
	.data1 4
	.data1 2
	.data1 3
	.data1 3
	.data1 4
	.data1 3
	.data1 4
	.data1 4
	.data1 5
	.data1 2
	.data1 3
	.data1 3
	.data1 4
	.data1 3
	.data1 4
	.data1 4
	.data1 5
	.data1 3
	.data1 4
	.data1 4
	.data1 5
	.data1 4
	.data1 5
	.data1 5
	.data1 6
	.data1 2
	.data1 3
	.data1 3
	.data1 4
	.data1 3
	.data1 4
	.data1 4
	.data1 5
	.data1 3
	.data1 4
	.data1 4
	.data1 5
	.data1 4
	.data1 5
	.data1 5
	.data1 6
	.data1 3
	.data1 4
	.data1 4
	.data1 5
	.data1 4
	.data1 5
	.data1 5
	.data1 6
	.data1 4
	.data1 5
	.data1 5
	.data1 6
	.data1 5
	.data1 6
	.data1 6
	.data1 7
	.data1 2
	.data1 3
	.data1 3
	.data1 4
	.data1 3
	.data1 4
	.data1 4
	.data1 5
	.data1 3
	.data1 4
	.data1 4
	.data1 5
	.data1 4
	.data1 5
	.data1 5
	.data1 6
	.data1 3
	.data1 4
	.data1 4
	.data1 5
	.data1 4
	.data1 5
	.data1 5
	.data1 6
	.data1 4
	.data1 5
	.data1 5
	.data1 6
	.data1 5
	.data1 6
	.data1 6
	.data1 7
	.data1 3
	.data1 4
	.data1 4
	.data1 5
	.data1 4
	.data1 5
	.data1 5
	.data1 6
	.data1 4
	.data1 5
	.data1 5
	.data1 6
	.data1 5
	.data1 6
	.data1 6
	.data1 7
	.data1 4
	.data1 5
	.data1 5
	.data1 6
	.data1 5
	.data1 6
	.data1 6
	.data1 7
	.data1 5
	.data1 6
	.data1 6
	.data1 7
	.data1 6
	.data1 7
	.data1 7
	.data1 8

	.comm	func,4,4                ## @func
	.comm	msg,256,1               ## @msg
.section .data

	.align	4                       ## @alpha_data
alpha_data:
	.data4	2861181610              ## 0xaa8a2aaa
	.data4	1431639365              ## 0x55551545
	.data4	290805077               ## 0x11555555
	.data4	2862754474              ## 0xaaa22aaa
	.data4	713730730               ## 0x2a8aaaaa
	.data4	1430345045              ## 0x55415555
	.data4	2947197610              ## 0xafaaaaaa
	.data4	4116010325              ## 0xf5555555
	.data4	2854922922              ## 0xaa2aaaaa
	.data4	1431655775              ## 0x5555555f
	.data4	1347769685              ## 0x50555555
	.data4	1364546885              ## 0x51555545
	.data4	2863270570              ## 0xaaaa0aaa
	.data4	715827880               ## 0x2aaaaaa8
	.data4	2866981546              ## 0xaae2aaaa
	.data4	1431635262              ## 0x5555053e
	.data4	1269369600              ## 0x4ba90b00
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	978016306               ## 0x3a4b5832
	.data4	3281396014              ## 0xc396212e
	.data4	2567380998              ## 0x99072006
	.data4	3867719790              ## 0xe688b86e
	.data4	2398875742              ## 0x8efbf05e
	.data4	2430969246              ## 0x90e5a59e
	.data4	4045468215              ## 0xf120f237
	.data4	3822949214              ## 0xe3dd935e
	.data4	3283175117              ## 0xc3b146cd
	.data4	1040951323              ## 0x3e0ba81b
	.data4	2539601517              ## 0x975f3e6d
	.data4	3536740030              ## 0xd2ce5ebe
	.data4	4213342632              ## 0xfb2281a8
	.data4	2285563561              ## 0x883aeea9
	.data4	4217492487              ## 0xfb61d407
	.data4	3930165701              ## 0xea4191c5
	.data4	3922701243              ## 0xe9cfabbb
	.data4	2535595595              ## 0x97221e4b
	.data4	2801563828              ## 0xa6fc78b4
	.data4	2358866632              ## 0x8c9972c8
	.data4	2612109561              ## 0x9bb1a0f9
	.data4	3694675919              ## 0xdc3847cf
	.data4	3905204705              ## 0xe8c4b1e1
	.data4	3284864805              ## 0xc3cb0f25
	.data4	2544253266              ## 0x97a63952
	.data4	2316193065              ## 0x8a0e4d29
	.data4	1045145627              ## 0x3e4ba81b
	.data4	2384146634              ## 0x8e1b30ca
	.data4	3148934394              ## 0xbbb0ecfa
	.data4	3001936319              ## 0xb2ede9bf
	.data4	3822307545              ## 0xe3d3c8d9
	.data4	3417637872              ## 0xcbb503f0
	.data4	2275360507              ## 0x879f3efb
	.data4	2388458222              ## 0x8e5cfaee
	.data4	1424611541              ## 0x54e9d8d5

	.align	4                       ## @numeric_data
numeric_data:
	.data4	2861181610              ## 0xaa8a2aaa
	.data4	1431639365              ## 0x55551545
	.data4	290805077               ## 0x11555555
	.data4	2862754474              ## 0xaaa22aaa
	.data4	713730730               ## 0x2a8aaaaa
	.data4	1430345045              ## 0x55415555
	.data4	2947197610              ## 0xafaaaaaa
	.data4	4116010325              ## 0xf5555555
	.data4	2854922922              ## 0xaa2aaaaa
	.data4	1431655775              ## 0x5555555f
	.data4	1347769685              ## 0x50555555
	.data4	1364546885              ## 0x51555545
	.data4	2863270570              ## 0xaaaa0aaa
	.data4	715827880               ## 0x2aaaaaa8
	.data4	2866981546              ## 0xaae2aaaa
	.data4	1431635262              ## 0x5555053e
	.data4	1266686720              ## 0x4b801b00
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	940262823               ## 0x380b45a7
	.data4	3199730875              ## 0xbeb804bb
	.data4	3295187589              ## 0xc4689285
	.data4	3756173339              ## 0xdfe2a81b
	.data4	3865343143              ## 0xe66474a7
	.data4	3865470929              ## 0xe66667d1
	.data4	3865454545              ## 0xe66627d1
	.data4	3865470929              ## 0xe66667d1
	.data4	3865470929              ## 0xe66667d1
	.data4	1045137435              ## 0x3e4b881b
	.data4	3865470929              ## 0xe66667d1
	.data4	3865470929              ## 0xe66667d1
	.data4	3865470929              ## 0xe66667d1
	.data4	3865470929              ## 0xe66667d1
	.data4	3865470929              ## 0xe66667d1
	.data4	3865470929              ## 0xe66667d1
	.data4	1424546261              ## 0x54e8d9d5

	.section	.rodata.str1.1,"aMS",@progbits,1
.str:                                   ## @.str
	.data1 68
	.data1 101
	.data1 97
	.data1 114
	.data1 32
	.data1 102
	.data1 101
	.data1 108
	.data1 108
	.data1 111
	.data1 119
	.data1 32
	.data1 65
	.data1 67
	.data1 80
	.data1 32
	.data1 98
	.data1 101
	.data1 110
	.data1 99
	.data1 104
	.data1 109
	.data1 97
	.data1 114
	.data1 107
	.data1 101
	.data1 114
	.data1 0
.skip 4


