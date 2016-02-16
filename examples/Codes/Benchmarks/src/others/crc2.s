.section .text

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @icrc1
icrc1::
## BB#0:                                ## %entry
	c0	mov $r0.11 = 8
;;
	c0	shl $r0.11 = $r0.4, $r0.11
;;
	c0	xor $r0.11 = $r0.11, $r0.3
	c0	mov $r0.12 = 1
;;
	c0	shl $r0.13 = $r0.11, $r0.12
	c0	and $r0.11 = $r0.11, 32768
;;
	c0	cmpeq $b0.0 = $r0.11, 0
	c0	xor $r0.11 = $r0.13, 4129
;;
;;
	c0	slct $r0.11 = $b0.0, $r0.13, $r0.11
;;
	c0	shl $r0.13 = $r0.11, $r0.12
	c0	and $r0.11 = $r0.11, 32768
;;
	c0	cmpeq $b0.0 = $r0.11, 0
	c0	xor $r0.11 = $r0.13, 4129
;;
;;
	c0	slct $r0.11 = $b0.0, $r0.13, $r0.11
;;
	c0	shl $r0.13 = $r0.11, $r0.12
	c0	and $r0.11 = $r0.11, 32768
;;
	c0	cmpeq $b0.0 = $r0.11, 0
	c0	xor $r0.11 = $r0.13, 4129
;;
;;
	c0	slct $r0.11 = $b0.0, $r0.13, $r0.11
;;
	c0	shl $r0.13 = $r0.11, $r0.12
	c0	and $r0.11 = $r0.11, 32768
;;
	c0	cmpeq $b0.0 = $r0.11, 0
	c0	xor $r0.11 = $r0.13, 4129
;;
;;
	c0	slct $r0.11 = $b0.0, $r0.13, $r0.11
;;
	c0	shl $r0.13 = $r0.11, $r0.12
	c0	and $r0.11 = $r0.11, 32768
;;
	c0	cmpeq $b0.0 = $r0.11, 0
	c0	xor $r0.11 = $r0.13, 4129
;;
;;
	c0	slct $r0.11 = $b0.0, $r0.13, $r0.11
;;
	c0	shl $r0.13 = $r0.11, $r0.12
	c0	and $r0.11 = $r0.11, 32768
;;
	c0	cmpeq $b0.0 = $r0.11, 0
	c0	xor $r0.11 = $r0.13, 4129
;;
;;
	c0	slct $r0.11 = $b0.0, $r0.13, $r0.11
;;
	c0	shl $r0.13 = $r0.11, $r0.12
	c0	and $r0.11 = $r0.11, 32768
;;
	c0	cmpeq $b0.0 = $r0.11, 0
	c0	xor $r0.11 = $r0.13, 4129
;;
;;
	c0	slct $r0.11 = $b0.0, $r0.13, $r0.11
;;
	c0	shl $r0.12 = $r0.11, $r0.12
	c0	and $r0.11 = $r0.11, 32768
;;
	c0	cmpeq $b0.0 = $r0.11, 0
	c0	xor $r0.11 = $r0.12, 4129
;;
;;
	c0	slct $r0.11 = $b0.0, $r0.12, $r0.11
;;
.return ret($r0.3:s32)
	c0	zxth $r0.3 = $r0.11
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @icrc
icrc::
## BB#0:                                ## %entry
	c0	mov $r0.11 = $r0.3
	c0	mov $r0.13 = icrc.init
;;
	c0	ldb $r0.12 = 0[$r0.13]
;;
;;
	c0	mtb $b0.0 = $r0.12
;;
;;
	c0	br $b0.0, LBB1_3
;;
## BB#1:                                ## %if.then
	c0	mov $r0.18 = 0
	c0	mov $r0.17 = icrc.icrctb
	c0	mov $r0.12 = 1
;;
	c0	stb 0[$r0.13] = $r0.12
	c0	mov $r0.13 = 9
	c0	mov $r0.14 = icrc.it
;;
	c0	mov $r0.15 = 4
	c0	mov $r0.16 = icrc.rchr
;;
LBB1_2::                                ## %vector.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	and $r0.22 = $r0.18, 128
	c0	add $r0.20 = $r0.18, 3
	c0	add $r0.19 = $r0.18, 1
	c0	add $r0.21 = $r0.18, 2
;;
	c0	and $r0.23 = $r0.20, 128
	c0	and $r0.24 = $r0.19, 128
	c0	and $r0.25 = $r0.21, 128
	c0	cmpeq $b0.0 = $r0.22, 0
;;
	c0	cmpeq $b0.1 = $r0.25, 0
	c0	cmpeq $b0.2 = $r0.24, 0
	c0	cmpeq $b0.3 = $r0.23, 0
	c0	shl $r0.22 = $r0.20, $r0.13
;;
	c0	shl $r0.23 = $r0.21, $r0.13
	c0	shl $r0.24 = $r0.18, $r0.13
	c0	shl $r0.25 = $r0.19, $r0.13
;;
	c0	xor $r0.26 = $r0.22, 4129
	c0	xor $r0.27 = $r0.25, 4129
;;
	c0	xor $r0.28 = $r0.23, 4129
	c0	xor $r0.29 = $r0.24, 4129
;;
	c0	slct $r0.22 = $b0.3, $r0.22, $r0.26
	c0	slct $r0.23 = $b0.1, $r0.23, $r0.28
	c0	slct $r0.24 = $b0.0, $r0.24, $r0.29
	c0	slct $r0.25 = $b0.2, $r0.25, $r0.27
;;
	c0	and $r0.26 = $r0.22, 32768
	c0	and $r0.27 = $r0.25, 32768
;;
	c0	and $r0.28 = $r0.23, 32768
	c0	and $r0.29 = $r0.24, 32768
;;
	c0	cmpeq $b0.0 = $r0.26, 0
	c0	cmpeq $b0.1 = $r0.29, 0
	c0	cmpeq $b0.2 = $r0.27, 0
	c0	cmpeq $b0.3 = $r0.28, 0
;;
	c0	shl $r0.22 = $r0.22, $r0.12
	c0	shl $r0.23 = $r0.23, $r0.12
	c0	shl $r0.24 = $r0.24, $r0.12
	c0	shl $r0.25 = $r0.25, $r0.12
;;
	c0	xor $r0.26 = $r0.22, 4129
	c0	xor $r0.27 = $r0.25, 4129
;;
	c0	xor $r0.28 = $r0.23, 4129
	c0	xor $r0.29 = $r0.24, 4129
;;
	c0	slct $r0.22 = $b0.0, $r0.22, $r0.26
	c0	slct $r0.24 = $b0.1, $r0.24, $r0.29
	c0	slct $r0.25 = $b0.2, $r0.25, $r0.27
	c0	slct $r0.23 = $b0.3, $r0.23, $r0.28
;;
	c0	and $r0.26 = $r0.22, 32768
	c0	and $r0.27 = $r0.23, 32768
;;
	c0	and $r0.28 = $r0.24, 32768
	c0	and $r0.29 = $r0.25, 32768
;;
	c0	shl $r0.22 = $r0.22, $r0.12
	c0	shl $r0.24 = $r0.24, $r0.12
	c0	shl $r0.25 = $r0.25, $r0.12
	c0	shl $r0.23 = $r0.23, $r0.12
;;
	c0	cmpeq $b0.0 = $r0.26, 0
	c0	cmpeq $b0.1 = $r0.27, 0
	c0	cmpeq $b0.2 = $r0.28, 0
	c0	cmpeq $b0.3 = $r0.29, 0
;;
	c0	xor $r0.26 = $r0.24, 4129
	c0	xor $r0.27 = $r0.25, 4129
;;
	c0	xor $r0.28 = $r0.22, 4129
	c0	xor $r0.29 = $r0.23, 4129
;;
	c0	slct $r0.24 = $b0.2, $r0.24, $r0.26
	c0	slct $r0.23 = $b0.1, $r0.23, $r0.29
	c0	slct $r0.25 = $b0.3, $r0.25, $r0.27
	c0	slct $r0.22 = $b0.0, $r0.22, $r0.28
;;
	c0	and $r0.26 = $r0.24, 32768
	c0	and $r0.27 = $r0.22, 32768
;;
	c0	and $r0.28 = $r0.23, 32768
	c0	and $r0.29 = $r0.25, 32768
;;
	c0	shl $r0.24 = $r0.24, $r0.12
	c0	shl $r0.23 = $r0.23, $r0.12
	c0	shl $r0.25 = $r0.25, $r0.12
	c0	shl $r0.22 = $r0.22, $r0.12
;;
	c0	cmpeq $b0.0 = $r0.26, 0
	c0	cmpeq $b0.1 = $r0.27, 0
	c0	cmpeq $b0.2 = $r0.28, 0
	c0	cmpeq $b0.3 = $r0.29, 0
;;
	c0	xor $r0.26 = $r0.23, 4129
	c0	xor $r0.27 = $r0.25, 4129
;;
	c0	xor $r0.28 = $r0.24, 4129
	c0	xor $r0.29 = $r0.22, 4129
;;
	c0	slct $r0.23 = $b0.2, $r0.23, $r0.26
	c0	slct $r0.22 = $b0.1, $r0.22, $r0.29
	c0	slct $r0.25 = $b0.3, $r0.25, $r0.27
	c0	slct $r0.24 = $b0.0, $r0.24, $r0.28
;;
	c0	and $r0.26 = $r0.23, 32768
	c0	and $r0.27 = $r0.24, 32768
;;
	c0	and $r0.28 = $r0.22, 32768
	c0	and $r0.29 = $r0.25, 32768
;;
	c0	shl $r0.23 = $r0.23, $r0.12
	c0	shl $r0.22 = $r0.22, $r0.12
	c0	shl $r0.25 = $r0.25, $r0.12
	c0	shl $r0.24 = $r0.24, $r0.12
;;
	c0	cmpeq $b0.0 = $r0.26, 0
	c0	cmpeq $b0.1 = $r0.27, 0
	c0	cmpeq $b0.2 = $r0.28, 0
	c0	cmpeq $b0.3 = $r0.29, 0
;;
	c0	xor $r0.26 = $r0.22, 4129
	c0	xor $r0.27 = $r0.25, 4129
;;
	c0	xor $r0.28 = $r0.23, 4129
	c0	xor $r0.29 = $r0.24, 4129
;;
	c0	slct $r0.22 = $b0.2, $r0.22, $r0.26
	c0	slct $r0.24 = $b0.1, $r0.24, $r0.29
	c0	slct $r0.25 = $b0.3, $r0.25, $r0.27
	c0	slct $r0.23 = $b0.0, $r0.23, $r0.28
;;
	c0	and $r0.26 = $r0.22, 32768
	c0	and $r0.27 = $r0.23, 32768
;;
	c0	and $r0.28 = $r0.24, 32768
	c0	and $r0.29 = $r0.25, 32768
;;
	c0	shl $r0.22 = $r0.22, $r0.12
	c0	shl $r0.24 = $r0.24, $r0.12
	c0	shl $r0.25 = $r0.25, $r0.12
	c0	shl $r0.23 = $r0.23, $r0.12
;;
	c0	cmpeq $b0.0 = $r0.26, 0
	c0	cmpeq $b0.1 = $r0.27, 0
	c0	cmpeq $b0.2 = $r0.28, 0
	c0	cmpeq $b0.3 = $r0.29, 0
;;
	c0	xor $r0.26 = $r0.24, 4129
	c0	xor $r0.27 = $r0.25, 4129
;;
	c0	xor $r0.28 = $r0.22, 4129
	c0	xor $r0.29 = $r0.23, 4129
;;
	c0	slct $r0.24 = $b0.2, $r0.24, $r0.26
	c0	slct $r0.23 = $b0.1, $r0.23, $r0.29
	c0	slct $r0.25 = $b0.3, $r0.25, $r0.27
	c0	slct $r0.22 = $b0.0, $r0.22, $r0.28
;;
	c0	and $r0.26 = $r0.24, 32768
	c0	and $r0.27 = $r0.22, 32768
;;
	c0	and $r0.28 = $r0.23, 32768
	c0	and $r0.29 = $r0.25, 32768
;;
	c0	shl $r0.24 = $r0.24, $r0.12
	c0	shl $r0.23 = $r0.23, $r0.12
	c0	shl $r0.25 = $r0.25, $r0.12
	c0	shl $r0.22 = $r0.22, $r0.12
;;
	c0	cmpeq $b0.0 = $r0.26, 0
	c0	cmpeq $b0.1 = $r0.27, 0
	c0	cmpeq $b0.2 = $r0.28, 0
	c0	cmpeq $b0.3 = $r0.29, 0
;;
	c0	xor $r0.26 = $r0.23, 4129
	c0	xor $r0.27 = $r0.25, 4129
;;
	c0	xor $r0.28 = $r0.24, 4129
	c0	xor $r0.29 = $r0.22, 4129
;;
	c0	slct $r0.23 = $b0.2, $r0.23, $r0.26
	c0	slct $r0.22 = $b0.1, $r0.22, $r0.29
	c0	slct $r0.25 = $b0.3, $r0.25, $r0.27
	c0	slct $r0.24 = $b0.0, $r0.24, $r0.28
;;
	c0	and $r0.26 = $r0.19, 15
	c0	and $r0.27 = $r0.20, 15
	c0	and $r0.28 = $r0.21, 15
	c0	and $r0.29 = $r0.18, 15
;;
	c0	and $r0.30 = $r0.24, 32768
	c0	shl $r0.24 = $r0.24, $r0.12
	c0	shl $r0.31 = $r0.25, $r0.12
;;
	c0	shl $r0.32 = $r0.22, $r0.12
	c0	shl $r0.33 = $r0.23, $r0.12
	c0	and $r0.23 = $r0.23, 32768
;;
	c0	and $r0.22 = $r0.22, 32768
	c0	and $r0.25 = $r0.25, 32768
;;
	c0	cmpeq $b0.0 = $r0.30, 0
	c0	cmpeq $b0.1 = $r0.25, 0
	c0	cmpeq $b0.2 = $r0.22, 0
	c0	cmpeq $b0.3 = $r0.23, 0
;;
	c0	xor $r0.22 = $r0.24, 4129
	c0	xor $r0.23 = $r0.33, 4129
;;
	c0	xor $r0.25 = $r0.31, 4129
	c0	xor $r0.30 = $r0.32, 4129
;;
	c0	slct $r0.22 = $b0.0, $r0.24, $r0.22
	c0	slct $r0.24 = $b0.2, $r0.32, $r0.30
	c0	slct $r0.23 = $b0.3, $r0.33, $r0.23
	c0	slct $r0.25 = $b0.1, $r0.31, $r0.25
;;
	c0	add $r0.30 = $r0.18, 4
	c0	shru $r0.21 = $r0.21, $r0.15
	c0	add $r0.28 = $r0.14, $r0.28
	c0	add $r0.27 = $r0.14, $r0.27
;;
	c0	add $r0.29 = $r0.14, $r0.29
	c0	add $r0.26 = $r0.14, $r0.26
	c0	shru $r0.20 = $r0.20, $r0.15
	c0	shru $r0.31 = $r0.18, $r0.15
;;
	c0	shru $r0.19 = $r0.19, $r0.15
	c0	add $r0.21 = $r0.14, $r0.21
;;
	c0	add $r0.19 = $r0.14, $r0.19
	c0	add $r0.20 = $r0.14, $r0.20
	c0	add $r0.31 = $r0.14, $r0.31
	c0	ldb $r0.28 = 0[$r0.28]
;;
	c0	ldb $r0.27 = 0[$r0.27]
;;
	c0	shl $r0.28 = $r0.28, $r0.15
	c0	add $r0.18 = $r0.16, $r0.18
	c0	cmpne $b0.0 = $r0.30, 256
;;
	c0	ldb $r0.29 = 0[$r0.29]
	c0	shl $r0.27 = $r0.27, $r0.15
	c0	add $r0.32 = $r0.17, 8
;;
	c0	sth 2[$r0.17] = $r0.25
;;
	c0	shl $r0.25 = $r0.29, $r0.15
	c0	sth 6[$r0.17] = $r0.24
;;
	c0	sth 4[$r0.17] = $r0.23
;;
	c0	sth 0[$r0.17] = $r0.22
;;
	c0	ldb $r0.17 = 0[$r0.26]
;;
	c0	ldb $r0.20 = 0[$r0.20]
;;
	c0	shl $r0.17 = $r0.17, $r0.15
;;
	c0	or $r0.20 = $r0.27, $r0.20
	c0	ldb $r0.22 = 0[$r0.31]
;;
	c0	stb 3[$r0.18] = $r0.20
;;
	c0	or $r0.20 = $r0.25, $r0.22
;;
	c0	stb 0[$r0.18] = $r0.20
;;
	c0	ldb $r0.19 = 0[$r0.19]
;;
	c0	ldb $r0.20 = 0[$r0.21]
;;
	c0	or $r0.17 = $r0.17, $r0.19
;;
	c0	stb 1[$r0.18] = $r0.17
	c0	or $r0.17 = $r0.28, $r0.20
;;
	c0	stb 2[$r0.18] = $r0.17
	c0	mov $r0.17 = $r0.32
	c0	mov $r0.18 = $r0.30
	c0	br $b0.0, LBB1_2
;;
LBB1_3::                                ## %if.end
	c0	cmplt $b0.0 = $r0.6, 0
;;
;;
	c0	br $b0.0, LBB1_5
;;
## BB#4:                                ## %if.then17
	c0	mov $r0.11 = 8
	c0	zxtb $r0.12 = $r0.6
;;
	c0	shl $r0.11 = $r0.6, $r0.11
;;
	c0	or $r0.11 = $r0.12, $r0.11
	c0	goto LBB1_7
;;
LBB1_5::                                ## %if.else
	c0	cmpgt $b0.0 = $r0.7, -1
;;
;;
	c0	br $b0.0, LBB1_7
;;
## BB#6:                                ## %if.then27
	c0	mov $r0.12 = 8
	c0	zxtb $r0.13 = $r0.11
	c0	mov $r0.14 = icrc.rchr
;;
	c0	shru $r0.11 = $r0.11, $r0.12
	c0	add $r0.13 = $r0.14, $r0.13
;;
	c0	add $r0.11 = $r0.14, $r0.11
	c0	ldb $r0.13 = 0[$r0.13]
;;
	c0	ldbu $r0.11 = 0[$r0.11]
;;
	c0	shl $r0.12 = $r0.13, $r0.12
;;
	c0	or $r0.11 = $r0.12, $r0.11
;;
LBB1_7::                                ## %for.cond45.preheader
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB1_13
;;
## BB#8:                                ## %for.body49.lr.ph
	c0	mov $r0.16 = 1
	c0	cmpgt $b0.0 = $r0.7, -1
	c0	mov $r0.12 = icrc.rchr
;;
	c0	mov $r0.13 = 8
	c0	mov $r0.14 = icrc.icrctb
	c0	mov $r0.15 = $r0.16
;;
LBB1_9::                                ## %for.body49
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.16 = $r0.4, $r0.16
;;
	c0	ldbu $r0.16 = 0[$r0.16]
	c0	br $b0.0, LBB1_11
;;
## BB#10:                               ## %if.then52
                                        ##   in Loop: Header=BB1_9 Depth=1
	c0	add $r0.16 = $r0.12, $r0.16
;;
	c0	ldbu $r0.16 = 0[$r0.16]
	c0	and $r0.17 = $r0.11, 65280
;;
	c0	shru $r0.17 = $r0.17, $r0.13
;;
	c0	xor $r0.16 = $r0.16, $r0.17
	c0	goto LBB1_12
;;
LBB1_11::                               ## %if.else63
                                        ##   in Loop: Header=BB1_9 Depth=1
	c0	and $r0.17 = $r0.11, 65280
;;
	c0	shru $r0.17 = $r0.17, $r0.13
;;
	c0	xor $r0.16 = $r0.16, $r0.17
;;
LBB1_12::                               ## %if.end73
                                        ##   in Loop: Header=BB1_9 Depth=1
	c0	sh1add $r0.16 = $r0.16, $r0.14
	c0	add $r0.15 = $r0.15, 1
;;
	c0	ldh $r0.17 = 0[$r0.16]
	c0	shl $r0.11 = $r0.11, $r0.13
	c0	zxth $r0.16 = $r0.15
;;
;;
	c0	xor $r0.11 = $r0.17, $r0.11
	c0	cmpleu $b0.1 = $r0.16, $r0.5
;;
;;
	c0	br $b0.1, LBB1_9
;;
LBB1_13::                               ## %for.end86
	c0	cmpgt $b0.0 = $r0.7, -1
;;
;;
	c0	br $b0.0, LBB1_15
;;
## BB#14:                               ## %if.else90
	c0	and $r0.12 = $r0.11, 65280
	c0	mov $r0.13 = 8
	c0	zxtb $r0.11 = $r0.11
;;
	c0	mov $r0.14 = icrc.rchr
	c0	shru $r0.12 = $r0.12, $r0.13
;;
	c0	add $r0.11 = $r0.14, $r0.11
	c0	add $r0.12 = $r0.14, $r0.12
;;
	c0	ldb $r0.11 = 0[$r0.11]
;;
	c0	ldbu $r0.12 = 0[$r0.12]
;;
	c0	shl $r0.11 = $r0.11, $r0.13
;;
	c0	or $r0.11 = $r0.11, $r0.12
;;
LBB1_15::                               ## %if.end106
.return ret($r0.3:s32)
	c0	zxth $r0.3 = $r0.11
	c0	return $r0.1 = $r0.1, 0, $l0.0
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
	c0	stw 20[$r0.1] = $l0.0
	c0	mov $r0.57 = aa
	c0	mov $r0.58 = 1
;;
	c0	mov $r0.11 = 0
	c0	mov $r0.5 = 40
	c0	ldw $r0.4 = 0[$r0.57]
;;
	c0	mov $r0.3 = $r0.11
	c0	mov $r0.6 = $r0.11
	c0	mov $r0.7 = $r0.58
;;
.call icrc, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = icrc
;;
	c0	ldw $r0.4 = 0[$r0.57]
	c0	mov $r0.5 = 42
	c0	mov $r0.6 = -1
	c0	mov $r0.7 = $r0.58
;;
;;
.call icrc, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = icrc
;;
	c0	cmpeq $b0.0 = $r0.3, 268
;;
;;
	c0	br $b0.0, LBB2_2
;;
## BB#1:                                ## %if.then
	c0	mov $r0.57 = 15
	c0	mov $r0.3 = str3
;;
.call puts, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = puts
;;
	c0	goto LBB2_3
;;
LBB2_2::                                ## %if.else
	c0	mov $r0.57 = 66
	c0	mov $r0.3 = str
;;
.call puts, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = puts
;;
LBB2_3::                                ## %return
	c0	mov $r0.3 = $r0.57
	c0	ldw $l0.0 = 20[$r0.1]
;;
	c0	ldw $r0.58 = 24[$r0.1]
;;
	c0	ldw $r0.57 = 28[$r0.1]
;;
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

	.section	.data
.str::                                  ## @.str
	.data1 97
	.data1 115
	.data1 100
	.data1 102
	.data1 102
	.data1 101
	.data1 97
	.data1 103
	.data1 101
	.data1 119
	.data1 97
	.data1 72
	.data1 65
	.data1 70
	.data1 69
	.data1 70
	.data1 97
	.data1 101
	.data1 68
	.data1 115
	.data1 70
	.data1 69
	.data1 97
	.data1 119
	.data1 70
	.data1 100
	.data1 115
	.data1 70
	.data1 97
	.data1 101
	.data1 102
	.data1 97
	.data1 101
	.data1 101
	.data1 114
	.data1 100
	.data1 106
	.data1 103
	.data1 112
	.data1 105
	.data1 109
	.data1 50
	.data1 51
	.data1 0
.skip 4

	.section	.data
	.align	4                       ## @aa
aa::
	.data4	.str


	.comm	icrc.icrctb,512,2

	.comm	icrc.init,1,1

	.comm	icrc.rchr,256,1
	.section	.data
icrc.it::                               ## @icrc.it
	.data1 0
	.data1 8
	.data1 4
	.data1 12
	.data1 2
	.data1 10
	.data1 6
	.data1 14
	.data1 1
	.data1 9
	.data1 5
	.data1 13
	.data1 3
	.data1 11
	.data1 7
	.data1 15

	.section	.data
.str1::                                 ## @.str1
	.data1 54
	.data1 54
	.data1 54
	.data1 10
	.data1 0
.skip 3

.str2::                                 ## @.str2
	.data1 45
	.data1 49
	.data1 10
	.data1 0
.skip 4


	.align	4                       ## @str
str::
	.data1 45
	.data1 49
	.data1 0
.skip 5

	.align	4                       ## @str3
str3::
	.data1 54
	.data1 54
	.data1 54
	.data1 0
.skip 4

.import printf
.import puts
