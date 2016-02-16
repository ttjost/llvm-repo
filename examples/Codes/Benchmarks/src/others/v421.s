.section .text

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @getdata
getdata::
## BB#0:                                ## %entry
	c0	mov $r0.14 = gE
	c0	mov $r0.11 = gP
;;
	c0	ldw $r0.15 = 0[$r0.14]
;;
	c0	ldw $r0.13 = 0[$r0.11]
;;
;;
	c0	cmpltu $b0.0 = $r0.13, $r0.15
;;
;;
	c0	br $b0.0, LBB0_5
;;
## BB#1:                                ## %if.then
	c0	cmpne $b0.0 = $r0.15, 0
;;
;;
	c0	brf $b0.0, LBB0_2
;;
## BB#3:                                ## %if.end
	c0	mov $r0.12 = -6
	c0	cmpgtu $b0.0 = $r0.13, $r0.15
;;
;;
	c0	br $b0.0, LBB0_6
;;
## BB#4:                                ## %if.end4
	c0	mov $r0.12 = -5
	c0	add $r0.13 = $r0.13, 1
;;
	c0	stw 0[$r0.11] = $r0.13
	c0	goto LBB0_6
;;
LBB0_2::                                ## %if.then1
	c0	mov $r0.13 = inbuf
	c0	mov $r0.12 = -1
;;
	c0	stw 0[$r0.11] = $r0.13
	c0	add $r0.11 = $r0.13, 7554
;;
	c0	stw 0[$r0.14] = $r0.11
	c0	goto LBB0_6
;;
LBB0_5::                                ## %if.end5
	c0	add $r0.12 = $r0.13, 1
;;
	c0	stw 0[$r0.11] = $r0.12
;;
	c0	ldbu $r0.12 = 0[$r0.13]
;;
LBB0_6::                                ## %return
.return ret($r0.3:s32)
	c0	mov $r0.3 = $r0.12
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @getcode
getcode::
## BB#0:                                ## %entry
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	brf $b0.0, LBB1_1
;;
## BB#2:                                ## %if.end
	c0	mov $r0.12 = codedone
;;
	c0	ldw $r0.13 = 0[$r0.12]
;;
;;
	c0	cmpeq $b0.0 = $r0.13, 0
;;
;;
	c0	br $b0.0, LBB1_5
;;
## BB#3:                                ## %if.then1
	c0	mov $r0.11 = -6
	c0	cmplt $b0.0 = $r0.13, 0
;;
;;
	c0	br $b0.0, LBB1_8
;;
## BB#4:                                ## %if.end4
	c0	mov $r0.11 = -1
	c0	mov $r0.13 = 0
;;
	c0	stw 0[$r0.12] = $r0.13
	c0	goto LBB1_8
;;
LBB1_1::                                ## %if.then
	c0	mov $r0.12 = baddr
	c0	mov $r0.11 = 0
;;
	c0	ldw $r0.13 = 0[$r0.12]
;;
;;
	c0	add $r0.13 = $r0.13, 7
;;
	c0	and $r0.13 = $r0.13, -8
;;
	c0	stw 0[$r0.12] = $r0.13
	c0	goto LBB1_8
;;
LBB1_5::                                ## %if.end5
	c0	mov $r0.11 = baddr
	c0	mov $r0.14 = eaddr
;;
	c0	ldw $r0.13 = 0[$r0.11]
;;
	c0	ldw $r0.14 = 0[$r0.14]
;;
;;
	c0	cmpltu $b0.0 = $r0.13, $r0.14
;;
;;
	c0	br $b0.0, LBB1_7
;;
## BB#6:                                ## %if.then7
	c0	mov $r0.11 = -5
	c0	mov $r0.13 = -1
;;
	c0	stw 0[$r0.12] = $r0.13
	c0	goto LBB1_8
;;
LBB1_7::                                ## %if.end8
	c0	mov $r0.12 = 3
	c0	mov $r0.14 = codebuf
	c0	mov $r0.15 = 8
;;
	c0	shru $r0.12 = $r0.13, $r0.12
	c0	and $r0.16 = $r0.13, 7
	c0	mov $r0.17 = 32
;;
	c0	add $r0.12 = $r0.14, $r0.12
;;
	c0	ldb $r0.14 = 0[$r0.12]
	c0	sub $r0.17 = $r0.17, $r0.3
	c0	add $r0.13 = $r0.13, $r0.3
;;
;;
	c0	shl $r0.14 = $r0.14, $r0.15
	c0	ldbu $r0.18 = 1[$r0.12]
;;
	c0	ldbu $r0.12 = 2[$r0.12]
;;
	c0	or $r0.14 = $r0.14, $r0.18
;;
	c0	shl $r0.14 = $r0.14, $r0.15
;;
	c0	or $r0.12 = $r0.14, $r0.12
;;
	c0	shl $r0.12 = $r0.12, $r0.15
;;
	c0	shl $r0.12 = $r0.12, $r0.16
	c0	stw 0[$r0.11] = $r0.13
;;
	c0	shru $r0.11 = $r0.12, $r0.17
;;
LBB1_8::                                ## %return
.return ret($r0.3:s32)
	c0	mov $r0.3 = $r0.11
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @putcode
putcode::
## BB#0:                                ## %entry
	c0	cmpne $b0.0 = $r0.3, -5
;;
;;
	c0	br $b0.0, LBB2_2
;;
## BB#1:                                ## %if.then
	c0	mov $r0.11 = baddr
	c0	mov $r0.12 = eaddr
;;
	c0	mov $r0.13 = 0
	c0	ldw $r0.14 = 0[$r0.11]
	c0	mov $r0.15 = codedone
;;
	c0	mov $r0.16 = 1
;;
	c0	add $r0.14 = $r0.14, 7
;;
	c0	and $r0.14 = $r0.14, -8
;;
	c0	stw 0[$r0.12] = $r0.14
;;
	c0	stw 0[$r0.11] = $r0.13
;;
	c0	stw 0[$r0.15] = $r0.16
	c0	goto LBB2_8
;;
LBB2_2::                                ## %if.end
	c0	cmpne $b0.0 = $r0.4, 0
;;
;;
	c0	brf $b0.0, LBB2_3
;;
## BB#4:                                ## %if.end5
	c0	cmpne $b0.0 = $r0.3, 1
;;
;;
	c0	br $b0.0, LBB2_7
;;
## BB#5:                                ## %if.end5
	c0	cmpeq $b0.0 = $r0.4, 8
;;
;;
	c0	br $b0.0, LBB2_7
;;
## BB#6:                                ## %land.lhs.true8
	c0	mov $r0.11 = baddr
;;
	c0	ldbu $r0.11 = 3[$r0.11]
;;
;;
	c0	and $r0.11 = $r0.11, 7
;;
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB2_8
;;
	c0	goto LBB2_7
;;
LBB2_3::                                ## %if.then2
	c0	mov $r0.11 = baddr
	c0	mov $r0.12 = 3
;;
	c0	mov $r0.13 = codebuf
	c0	mov $r0.14 = 0
	c0	ldw $r0.15 = 0[$r0.11]
;;
;;
	c0	add $r0.15 = $r0.15, 7
;;
	c0	shru $r0.12 = $r0.15, $r0.12
	c0	and $r0.15 = $r0.15, -8
;;
	c0	stw 0[$r0.11] = $r0.15
	c0	add $r0.11 = $r0.13, $r0.12
;;
	c0	stb 0[$r0.11] = $r0.14
	c0	goto LBB2_8
;;
LBB2_7::                                ## %if.end12
	c0	mov $r0.11 = baddr
	c0	mov $r0.12 = 24
;;
	c0	ldw $r0.13 = 0[$r0.11]
	c0	sub $r0.12 = $r0.12, $r0.4
	c0	mov $r0.14 = 3
;;
	c0	mov $r0.15 = codebuf
;;
;;
	c0	shru $r0.14 = $r0.13, $r0.14
	c0	and $r0.13 = $r0.13, 7
;;
	c0	sub $r0.12 = $r0.12, $r0.13
	c0	add $r0.13 = $r0.15, $r0.14
	c0	mov $r0.14 = 8
	c0	mov $r0.15 = 16
;;
	c0	shl $r0.12 = $r0.3, $r0.12
;;
	c0	stb 2[$r0.13] = $r0.12
	c0	shru $r0.14 = $r0.12, $r0.14
	c0	shru $r0.12 = $r0.12, $r0.15
;;
	c0	stb 1[$r0.13] = $r0.14
;;
	c0	ldb $r0.14 = 0[$r0.13]
;;
;;
	c0	or $r0.12 = $r0.12, $r0.14
;;
	c0	stb 0[$r0.13] = $r0.12
;;
	c0	ldw $r0.12 = 0[$r0.11]
;;
;;
	c0	add $r0.12 = $r0.12, $r0.4
;;
	c0	stw 0[$r0.11] = $r0.12
;;
LBB2_8::                                ## %return
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @putdata
putdata::
## BB#0:                                ## %entry
	c0	cmpeq $b0.0 = $r0.3, -5
;;
;;
	c0	br $b0.0, LBB3_2
;;
## BB#1:                                ## %if.end
	c0	mov $r0.11 = eout
;;
	c0	ldw $r0.12 = 0[$r0.11]
;;
;;
	c0	add $r0.13 = $r0.12, 1
;;
	c0	stw 0[$r0.11] = $r0.13
;;
	c0	stb 0[$r0.12] = $r0.3
;;
LBB3_2::                                ## %return
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @init_dict
init_dict::
## BB#0:                                ## %entry
	c0	mov $r0.12 = dict
	c0	mov $r0.11 = -6144
;;
LBB4_1::                                ## %for.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.13 = 0[$r0.12]
	c0	and $r0.14 = $r0.11, 522240
;;
;;
	c0	and $r0.13 = $r0.13, -4194304
;;
	c0	stw 0[$r0.12] = $r0.13
	c0	add $r0.11 = $r0.11, 2048
	c0	add $r0.13 = $r0.12, 8
;;
	c0	ldw $r0.15 = 4[$r0.12]
	c0	cmpne $b0.0 = $r0.11, 4190208
;;
;;
	c0	and $r0.15 = $r0.15, -524288
;;
	c0	or $r0.14 = $r0.15, $r0.14
;;
	c0	stw 4[$r0.12] = $r0.14
	c0	mov $r0.12 = $r0.13
	c0	br $b0.0, LBB4_1
;;
## BB#2:                                ## %for.end
	c0	mov $r0.11 = c1
	c0	mov $r0.12 = 259
;;
	c0	mov $r0.13 = c2
	c0	mov $r0.14 = 9
	c0	stw 0[$r0.11] = $r0.12
;;
	c0	mov $r0.11 = c3
	c0	mov $r0.12 = 512
;;
	c0	mov $r0.15 = escape
	c0	stw 0[$r0.13] = $r0.14
	c0	mov $r0.13 = 0
;;
	c0	stw 0[$r0.11] = $r0.12
	c0	mov $r0.11 = compress
;;
	c0	stw 0[$r0.15] = $r0.13
	c0	mov $r0.12 = last
;;
	c0	stw 0[$r0.11] = $r0.13
;;
.return ret($r0.3:s32)
	c0	stw 0[$r0.12] = $r0.13
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @search_dict
search_dict::
## BB#0:                                ## %entry
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	brf $b0.0, LBB5_1
;;
## BB#2:                                ## %if.end
	c0	mov $r0.11 = dict
;;
	c0	sh3add $r0.14 = $r0.3, $r0.11
	c0	mov $r0.12 = 11
	c0	mov $r0.13 = 0
;;
	c0	ldw $r0.14 = 0[$r0.14]
;;
;;
	c0	shru $r0.14 = $r0.14, $r0.12
;;
	c0	and $r0.14 = $r0.14, 2047
;;
	c0	cmpeq $b0.0 = $r0.14, 0
	c0	mov $r0.16 = $r0.13
;;
;;
	c0	br $b0.0, LBB5_7
;;
## BB#3:                                ## %for.body.lr.ph
	c0	mov $r0.15 = last
;;
	c0	ldw $r0.15 = 0[$r0.15]
;;
LBB5_4::                                ## %for.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	cmpeq $b0.0 = $r0.14, $r0.15
;;
;;
	c0	br $b0.0, LBB5_6
;;
## BB#5:                                ## %land.lhs.true
                                        ##   in Loop: Header=BB5_4 Depth=1
	c0	sh3add $r0.16 = $r0.14, $r0.11
;;
	c0	ldw $r0.16 = 4[$r0.16]
;;
;;
	c0	shru $r0.16 = $r0.16, $r0.12
;;
	c0	zxtb $r0.16 = $r0.16
;;
	c0	cmpeq $b0.0 = $r0.16, $r0.4
	c0	mov $r0.16 = $r0.14
;;
;;
	c0	br $b0.0, LBB5_7
;;
LBB5_6::                                ## %for.inc
                                        ##   in Loop: Header=BB5_4 Depth=1
	c0	sh3add $r0.14 = $r0.14, $r0.11
;;
	c0	ldw $r0.14 = 4[$r0.14]
;;
;;
	c0	and $r0.14 = $r0.14, 2047
;;
	c0	cmpne $b0.0 = $r0.14, 0
	c0	mov $r0.16 = $r0.13
;;
;;
	c0	br $b0.0, LBB5_4
;;
	c0	goto LBB5_7
;;
LBB5_1::                                ## %if.then
	c0	add $r0.16 = $r0.4, 3
;;
LBB5_7::                                ## %return
.return ret($r0.3:s32)
	c0	mov $r0.3 = $r0.16
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @add_dict
add_dict::
## BB#0:                                ## %entry
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB6_14
;;
## BB#1:                                ## %if.end
	c0	mov $r0.14 = c1
	c0	mov $r0.11 = dict
;;
	c0	mov $r0.12 = 11
	c0	ldw $r0.13 = 0[$r0.14]
;;
	c0	shl $r0.16 = $r0.4, $r0.12
;;
	c0	sh3add $r0.13 = $r0.13, $r0.11
	c0	and $r0.17 = $r0.3, 2047
	c0	sh3add $r0.18 = $r0.3, $r0.11
;;
	c0	ldw $r0.19 = 4[$r0.13]
	c0	add $r0.15 = $r0.13, 8
;;
;;
	c0	and $r0.19 = $r0.19, -522241
;;
	c0	or $r0.16 = $r0.19, $r0.16
;;
	c0	stw 4[$r0.13] = $r0.16
;;
	c0	ldw $r0.16 = 0[$r0.13]
	c0	mov $r0.19 = last
;;
;;
	c0	and $r0.16 = $r0.16, -4194304
;;
	c0	or $r0.16 = $r0.16, $r0.17
;;
	c0	stw 0[$r0.13] = $r0.16
;;
	c0	ldw $r0.16 = 0[$r0.18]
;;
	c0	ldw $r0.17 = 4[$r0.13]
;;
	c0	shru $r0.16 = $r0.16, $r0.12
;;
	c0	and $r0.16 = $r0.16, 2047
	c0	and $r0.17 = $r0.17, -2048
;;
	c0	or $r0.16 = $r0.17, $r0.16
;;
	c0	stw 4[$r0.13] = $r0.16
;;
	c0	ldw $r0.13 = 0[$r0.14]
;;
	c0	ldw $r0.16 = 0[$r0.18]
;;
	c0	shl $r0.13 = $r0.13, $r0.12
;;
	c0	and $r0.13 = $r0.13, 4192256
	c0	and $r0.16 = $r0.16, -4192257
;;
	c0	or $r0.13 = $r0.16, $r0.13
;;
	c0	stw 0[$r0.18] = $r0.13
;;
	c0	ldw $r0.13 = 0[$r0.14]
;;
;;
	c0	stw 0[$r0.19] = $r0.13
	c0	add $r0.16 = $r0.11, 16384
;;
	c0	add $r0.17 = $r0.11, 2072
;;
LBB6_2::                                ## %while.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	mov $r0.13 = $r0.15
;;
	c0	ldw $r0.15 = 0[$r0.13]
;;
;;
	c0	and $r0.15 = $r0.15, 4192256
;;
	c0	cmpeq $b0.0 = $r0.15, 0
;;
;;
	c0	br $b0.0, LBB6_4
;;
## BB#3:                                ## %while.body
                                        ##   in Loop: Header=BB6_2 Depth=1
	c0	add $r0.15 = $r0.13, 8
	c0	goto LBB6_2
;;
LBB6_4::                                ## %while.end
                                        ##   in Loop: Header=BB6_2 Depth=1
	c0	cmpgeu $b0.0 = $r0.13, $r0.16
	c0	mov $r0.15 = $r0.17
;;
;;
	c0	br $b0.0, LBB6_2
;;
## BB#5:                                ## %for.end
	c0	sub $r0.15 = $r0.13, $r0.11
	c0	mov $r0.16 = 3
;;
	c0	shr $r0.15 = $r0.15, $r0.16
;;
	c0	stw 0[$r0.14] = $r0.15
;;
	c0	ldw $r0.14 = 0[$r0.13]
;;
;;
	c0	and $r0.14 = $r0.14, 2047
;;
	c0	cmpeq $b0.0 = $r0.14, 0
;;
;;
	c0	br $b0.0, LBB6_14
;;
## BB#6:                                ## %if.then32
	c0	sh3add $r0.14 = $r0.14, $r0.11
;;
	c0	ldw $r0.14 = 0[$r0.14]
;;
;;
	c0	shru $r0.14 = $r0.14, $r0.12
;;
	c0	and $r0.16 = $r0.14, 2047
;;
	c0	cmpeq $b0.0 = $r0.16, 0
;;
;;
	c0	br $b0.0, LBB6_8
;;
## BB#7:                                ## %if.then32
	c0	cmpne $b0.0 = $r0.16, $r0.15
;;
;;
	c0	brf $b0.0, LBB6_8
;;
LBB6_9::                                ## %for.inc
                                        ## =>This Inner Loop Header: Depth=1
	c0	mov $r0.17 = $r0.16
;;
	c0	sh3add $r0.14 = $r0.17, $r0.11
;;
	c0	ldw $r0.16 = 4[$r0.14]
;;
;;
	c0	and $r0.16 = $r0.16, 2047
;;
	c0	cmpeq $b0.0 = $r0.16, 0
;;
;;
	c0	br $b0.0, LBB6_11
;;
## BB#10:                               ## %for.inc
                                        ##   in Loop: Header=BB6_9 Depth=1
	c0	cmpne $b0.0 = $r0.16, $r0.15
;;
;;
	c0	br $b0.0, LBB6_9
;;
LBB6_11::                               ## %for.end49
	c0	ldw $r0.15 = 4[$r0.13]
	c0	cmpeq $b0.0 = $r0.17, 0
;;
;;
	c0	and $r0.15 = $r0.15, 2047
	c0	br $b0.0, LBB6_13
;;
## BB#12:                               ## %if.then51
	c0	ldw $r0.11 = 4[$r0.14]
;;
;;
	c0	and $r0.11 = $r0.11, -2048
;;
	c0	or $r0.11 = $r0.11, $r0.15
;;
	c0	stw 4[$r0.14] = $r0.11
	c0	goto LBB6_14
;;
LBB6_8::                                ## %for.end49.thread
	c0	ldw $r0.14 = 4[$r0.13]
;;
;;
	c0	and $r0.15 = $r0.14, 2047
;;
LBB6_13::                               ## %if.else
	c0	ldw $r0.13 = 0[$r0.13]
;;
;;
	c0	and $r0.13 = $r0.13, 2047
	c0	shl $r0.12 = $r0.15, $r0.12
;;
	c0	sh3add $r0.11 = $r0.13, $r0.11
;;
	c0	ldw $r0.13 = 0[$r0.11]
;;
;;
	c0	and $r0.13 = $r0.13, -4192257
;;
	c0	or $r0.12 = $r0.13, $r0.12
;;
	c0	stw 0[$r0.11] = $r0.12
;;
LBB6_14::                               ## %if.end73
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @checksize_dict
checksize_dict::
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
	c0	mov $r0.57 = c3
;;
	c0	mov $r0.58 = c1
	c0	ldw $r0.11 = 0[$r0.57]
;;
	c0	ldw $r0.12 = 0[$r0.58]
;;
;;
	c0	cmplt $b0.0 = $r0.12, $r0.11
;;
;;
	c0	br $b0.0, LBB7_2
;;
LBB7_1::                                ## %while.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	mov $r0.59 = c2
	c0	mov $r0.3 = 2
	c0	mov $r0.60 = 1
;;
	c0	ldw $r0.4 = 0[$r0.59]
;;
;;
.call putcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putcode
;;
	c0	ldw $r0.11 = 0[$r0.59]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 0[$r0.59] = $r0.11
;;
	c0	ldw $r0.11 = 0[$r0.57]
;;
;;
	c0	shl $r0.11 = $r0.11, $r0.60
;;
	c0	stw 0[$r0.57] = $r0.11
;;
	c0	ldw $r0.12 = 0[$r0.58]
;;
;;
	c0	cmpge $b0.0 = $r0.12, $r0.11
;;
;;
	c0	br $b0.0, LBB7_1
;;
LBB7_2::                                ## %while.end
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

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg() ## @encode
encode::
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
	c0	mov $r0.62 = 0
	c0	mov $r0.58 = compress
;;
	c0	mov $r0.59 = c2
	c0	mov $r0.11 = 1
;;
	c0	stw 60[$r0.1] = $r0.11
	c0	mov $r0.61 = -5
	c0	mov $r0.11 = 8
;;
	c0	stw 44[$r0.1] = $r0.11
	c0	mov $r0.11 = c3
;;
	c0	stw 24[$r0.1] = $r0.11
	c0	mov $r0.11 = escape
;;
	c0	stw 52[$r0.1] = $r0.11
	c0	mov $r0.11 = 2
;;
	c0	stw 20[$r0.1] = $r0.11
	c0	mov $r0.11 = 31
;;
	c0	stw 36[$r0.1] = $r0.11
	c0	mov $r0.11 = 24
;;
	c0	stw 32[$r0.1] = $r0.11
;;
	c0	stw 56[$r0.1] = $r0.62
	c0	mov $r0.57 = $r0.62
;;
	c0	stw 48[$r0.1] = $r0.62
	c0	mov $r0.60 = $r0.62
;;
	c0	stw 28[$r0.1] = $r0.62
;;
LBB8_1::                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
.call getdata, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = getdata
;;
	c0	mov $r0.63 = $r0.3
;;
	c0	cmpgt $b0.0 = $r0.63, -5
;;
;;
	c0	br $b0.0, LBB8_4
;;
## BB#2:                                ## %for.cond
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	cmpeq $b0.0 = $r0.63, -5
;;
;;
	c0	brf $b0.0, LBB8_3
;;
## BB#9:                                ## %sw.bb2
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	cmpeq $b0.0 = $r0.57, 0
;;
;;
	c0	br $b0.0, LBB8_12
;;
## BB#10:                               ## %sw.bb2
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.11 = 0[$r0.58]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB8_12
;;
## BB#11:                               ## %if.then4
                                        ##   in Loop: Header=BB8_1 Depth=1
.call checksize_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = checksize_dict
;;
	c0	ldw $r0.4 = 0[$r0.59]
	c0	mov $r0.3 = $r0.57
;;
;;
.call putcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putcode
;;
	c0	ldw $r0.4 = 0[$r0.59]
;;
	c0	ldw $r0.3 = 60[$r0.1]
;;
;;
.call putcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putcode
;;
LBB8_12::                               ## %if.end5
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	mov $r0.3 = $r0.61
	c0	mov $r0.4 = $r0.62
;;
.call putcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putcode
;;
	c0	goto LBB8_1
;;
LBB8_4::                                ## %for.cond
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	add $r0.11 = $r0.63, 4
;;
	c0	cmpltu $b0.0 = $r0.11, 2
;;
;;
	c0	br $b0.0, LBB8_1
;;
## BB#5:                                ## %for.cond
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	cmpeq $b0.0 = $r0.63, -1
;;
;;
	c0	brf $b0.0, LBB8_6
;;
## BB#8:                                ## %sw.bb1
                                        ##   in Loop: Header=BB8_1 Depth=1
.call init_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = init_dict
;;
	c0	goto LBB8_1
;;
LBB8_3::                                ## %for.cond
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	cmpeq $b0.0 = $r0.63, -6
;;
;;
	c0	br $b0.0, LBB8_7
;;
	c0	goto LBB8_13
;;
LBB8_6::                                ## %for.cond
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	cmpne $b0.0 = $r0.63, -2
;;
;;
	c0	brf $b0.0, LBB8_7
;;
LBB8_13::                               ## %sw.epilog
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	cmplt $b0.0 = $r0.60, 2049
;;
;;
	c0	br $b0.0, LBB8_28
;;
## BB#14:                               ## %if.then7
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.11 = 0[$r0.58]
;;
	c0	ldw $r0.12 = 48[$r0.1]
;;
;;
	c0	cmpge $b0.0 = $r0.60, $r0.12
;;
;;
	c0	br $b0.0, LBB8_24
;;
## BB#15:                               ## %if.then9
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB8_21
;;
## BB#16:                               ## %if.then11
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	cmpeq $b0.0 = $r0.57, 0
;;
;;
	c0	br $b0.0, LBB8_18
;;
## BB#17:                               ## %if.then13
                                        ##   in Loop: Header=BB8_1 Depth=1
.call checksize_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = checksize_dict
;;
	c0	ldw $r0.4 = 0[$r0.59]
	c0	mov $r0.3 = $r0.57
;;
;;
.call putcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putcode
;;
LBB8_18::                               ## %if.end14
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	zxtb $r0.60 = $r0.63
	c0	mov $r0.3 = $r0.57
;;
	c0	mov $r0.4 = $r0.60
;;
.call search_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = search_dict
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB8_20
;;
## BB#19:                               ## %if.then17
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	mov $r0.3 = $r0.57
	c0	mov $r0.4 = $r0.60
;;
.call add_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = add_dict
;;
LBB8_20::                               ## %if.end38.thread
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.4 = 0[$r0.59]
	c0	mov $r0.3 = $r0.62
;;
;;
.call putcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putcode
;;
	c0	mov $r0.3 = $r0.62
	c0	mov $r0.4 = $r0.62
;;
.call putcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putcode
;;
	c0	stw 0[$r0.58] = $r0.62
;;
	c0	ldw $r0.60 = 44[$r0.1]
;;
	c0	stw 48[$r0.1] = $r0.62
	c0	mov $r0.57 = $r0.62
;;
	c0	stw 56[$r0.1] = $r0.62
	c0	goto LBB8_29
;;
LBB8_24::                               ## %if.else27
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	cmpne $b0.0 = $r0.11, 0
	c0	stw 48[$r0.1] = $r0.62
	c0	mov $r0.60 = $r0.62
;;
;;
	c0	br $b0.0, LBB8_28
;;
## BB#25:                               ## %if.then29
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	zxtb $r0.60 = $r0.63
	c0	mov $r0.3 = $r0.57
;;
	c0	mov $r0.4 = $r0.60
;;
.call search_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = search_dict
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB8_27
;;
## BB#26:                               ## %if.then33
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	mov $r0.3 = $r0.57
	c0	mov $r0.4 = $r0.60
;;
.call add_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = add_dict
;;
LBB8_27::                               ## %if.end38.thread109
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.11 = 52[$r0.1]
;;
;;
	c0	ldw $r0.3 = 0[$r0.11]
;;
	c0	ldw $r0.60 = 44[$r0.1]
;;
;;
	c0	stw 44[$r0.1] = $r0.60
	c0	mov $r0.4 = $r0.60
;;
.call putcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putcode
;;
	c0	mov $r0.3 = $r0.62
	c0	mov $r0.4 = $r0.60
;;
.call putcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putcode
;;
	c0	ldw $r0.11 = 60[$r0.1]
;;
;;
	c0	stw 0[$r0.58] = $r0.11
;;
	c0	stw 48[$r0.1] = $r0.62
	c0	mov $r0.57 = $r0.62
;;
	c0	stw 56[$r0.1] = $r0.62
	c0	goto LBB8_31
;;
LBB8_21::                               ## %if.else
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.12 = 28[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.12, 1
	c0	cmplt $b0.0 = $r0.12, 4
	c0	stw 48[$r0.1] = $r0.62
	c0	mov $r0.60 = $r0.62
;;
	c0	stw 28[$r0.1] = $r0.11
;;
	c0	br $b0.0, LBB8_28
;;
## BB#22:                               ## %if.else
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.12 = 24[$r0.1]
;;
;;
	c0	ldw $r0.12 = 0[$r0.12]
;;
;;
	c0	cmplt $b0.0 = $r0.12, 513
	c0	stw 48[$r0.1] = $r0.62
	c0	mov $r0.60 = $r0.62
;;
	c0	stw 28[$r0.1] = $r0.11
;;
	c0	br $b0.0, LBB8_28
;;
## BB#23:                               ## %if.then24
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.11 = 52[$r0.1]
;;
;;
	c0	ldw $r0.3 = 0[$r0.11]
;;
	c0	ldw $r0.57 = 44[$r0.1]
;;
;;
	c0	stw 44[$r0.1] = $r0.57
	c0	mov $r0.4 = $r0.57
;;
.call putcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putcode
;;
	c0	ldw $r0.3 = 20[$r0.1]
	c0	mov $r0.4 = $r0.57
;;
;;
.call putcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putcode
;;
.call init_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = init_dict
;;
	c0	stw 56[$r0.1] = $r0.62
	c0	mov $r0.57 = $r0.62
;;
	c0	stw 48[$r0.1] = $r0.62
	c0	mov $r0.60 = $r0.62
;;
	c0	stw 28[$r0.1] = $r0.62
;;
LBB8_28::                               ## %if.end38
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.11 = 0[$r0.58]
	c0	add $r0.60 = $r0.60, 8
;;
;;
	c0	cmpne $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB8_31
;;
LBB8_29::                               ## %if.then40
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	mov $r0.3 = $r0.63
	c0	ldw $r0.4 = 44[$r0.1]
;;
;;
.call putcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putcode
;;
	c0	ldw $r0.11 = 52[$r0.1]
;;
;;
	c0	ldw $r0.11 = 0[$r0.11]
;;
;;
	c0	cmpne $b0.0 = $r0.63, $r0.11
;;
;;
	c0	br $b0.0, LBB8_31
;;
## BB#30:                               ## %if.then43
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.3 = 60[$r0.1]
;;
	c0	ldw $r0.4 = 44[$r0.1]
;;
;;
.call putcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putcode
;;
LBB8_31::                               ## %if.end45
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.11 = 52[$r0.1]
;;
;;
	c0	ldw $r0.11 = 0[$r0.11]
;;
;;
	c0	cmpne $b0.0 = $r0.63, $r0.11
;;
;;
	c0	br $b0.0, LBB8_33
;;
## BB#32:                               ## %if.then48
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	add $r0.11 = $r0.11, 51
	c0	ldw $r0.12 = 36[$r0.1]
;;
;;
	c0	shr $r0.12 = $r0.11, $r0.12
	c0	ldw $r0.13 = 32[$r0.1]
;;
;;
	c0	shru $r0.12 = $r0.12, $r0.13
;;
	c0	add $r0.12 = $r0.11, $r0.12
;;
	c0	and $r0.12 = $r0.12, -256
;;
	c0	sub $r0.11 = $r0.11, $r0.12
	c0	ldw $r0.12 = 52[$r0.1]
;;
;;
	c0	stw 0[$r0.12] = $r0.11
;;
LBB8_33::                               ## %if.end50
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	zxtb $r0.11 = $r0.63
;;
	c0	stw 40[$r0.1] = $r0.11
	c0	mov $r0.3 = $r0.57
	c0	mov $r0.4 = $r0.11
;;
.call search_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = search_dict
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB8_35
;;
## BB#34:                               ## %if.then54
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.11 = 56[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 56[$r0.1] = $r0.11
	c0	mov $r0.57 = $r0.3
	c0	goto LBB8_1
;;
LBB8_35::                               ## %if.end56
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.11 = 40[$r0.1]
;;
;;
	c0	stw 40[$r0.1] = $r0.11
	c0	cmpeq $b0.0 = $r0.57, 0
;;
;;
	c0	br $b0.0, LBB8_38
;;
## BB#36:                               ## %if.end56
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.11 = 0[$r0.58]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB8_38
;;
## BB#37:                               ## %if.then60
                                        ##   in Loop: Header=BB8_1 Depth=1
.call checksize_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = checksize_dict
;;
	c0	ldw $r0.4 = 0[$r0.59]
	c0	mov $r0.3 = $r0.57
;;
;;
.call putcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putcode
;;
LBB8_38::                               ## %if.end62
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.12 = 0[$r0.59]
;;
	c0	ldw $r0.11 = 56[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.11, 249
;;
;;
	c0	br $b0.0, LBB8_40
;;
## BB#39:                               ## %if.then66
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	mov $r0.3 = $r0.57
	c0	ldw $r0.4 = 40[$r0.1]
	c0	mov $r0.57 = $r0.12
;;
;;
.call add_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = add_dict
;;
	c0	mov $r0.12 = $r0.57
;;
LBB8_40::                               ## %if.end68
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.11 = 48[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.12, $r0.11
;;
	c0	stw 48[$r0.1] = $r0.11
	c0	add $r0.57 = $r0.63, 3
;;
	c0	ldw $r0.11 = 60[$r0.1]
;;
;;
	c0	stw 56[$r0.1] = $r0.11
	c0	goto LBB8_1
;;
LBB8_7::                                ## %sw.bb
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
.entry caller, sp=$r0.1, rl=$l0.0, asize=-128, arg() ## @decode
decode::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -128
;;
	c0	stw 108[$r0.1] = $r0.57
;;
	c0	stw 104[$r0.1] = $r0.58
;;
	c0	stw 100[$r0.1] = $r0.59
;;
	c0	stw 96[$r0.1] = $r0.60
;;
	c0	stw 92[$r0.1] = $r0.61
;;
	c0	stw 88[$r0.1] = $r0.62
;;
	c0	stw 84[$r0.1] = $r0.63
;;
	c0	stw 80[$r0.1] = $l0.0
	c0	mov $r0.61 = 0
;;
	c0	stw 60[$r0.1] = $r0.61
;;
	c0	stw 60[$r0.1] = $r0.61
	c0	mov $r0.58 = compress
;;
	c0	mov $r0.59 = c2
	c0	mov $r0.60 = -5
;;
	c0	mov $r0.11 = escape
;;
	c0	stw 76[$r0.1] = $r0.11
	c0	mov $r0.11 = 8
;;
	c0	stw 32[$r0.1] = $r0.11
	c0	mov $r0.11 = 31
;;
	c0	stw 68[$r0.1] = $r0.11
	c0	mov $r0.11 = 24
;;
	c0	stw 64[$r0.1] = $r0.11
	c0	mov $r0.11 = 1
;;
	c0	stw 40[$r0.1] = $r0.11
	c0	mov $r0.11 = decode.str
;;
	c0	stw 72[$r0.1] = $r0.11
	c0	add $r0.11 = $r0.11, 250
;;
	c0	stw 44[$r0.1] = $r0.11
	c0	mov $r0.11 = 249
;;
	c0	stw 36[$r0.1] = $r0.11
	c0	mov $r0.11 = c3
;;
	c0	stw 56[$r0.1] = $r0.11
	c0	mov $r0.11 = dict
;;
	c0	stw 52[$r0.1] = $r0.11
	c0	mov $r0.11 = 11
;;
	c0	stw 48[$r0.1] = $r0.11
;;
LBB9_1::                                ## %for.cond
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB9_16 Depth 2
                                        ##     Child Loop BB9_20 Depth 2
	c0	mov $r0.63 = $r0.61
	c0	ldw $r0.11 = 0[$r0.58]
;;
	c0	ldw $r0.12 = 0[$r0.59]
;;
	c0	cmpne $b0.0 = $r0.11, 0
;;
;;
	c0	slct $r0.3 = $b0.0, $r0.12, 8
;;
.call getcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = getcode
;;
	c0	mov $r0.57 = $r0.3
;;
	c0	cmpgt $b0.0 = $r0.57, -5
;;
;;
	c0	br $b0.0, LBB9_4
;;
## BB#2:                                ## %for.cond
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	cmpeq $b0.0 = $r0.57, -5
;;
;;
	c0	brf $b0.0, LBB9_3
;;
## BB#8:                                ## %sw.bb3
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	mov $r0.3 = $r0.60
;;
.call putdata, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putdata
;;
	c0	mov $r0.61 = $r0.63
	c0	goto LBB9_1
;;
LBB9_4::                                ## %for.cond
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	add $r0.11 = $r0.57, 4
;;
	c0	cmpltu $b0.0 = $r0.11, 2
	c0	mov $r0.61 = $r0.63
;;
;;
	c0	br $b0.0, LBB9_1
;;
## BB#5:                                ## %for.cond
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	cmpeq $b0.0 = $r0.57, -2
;;
;;
	c0	br $b0.0, LBB9_32
;;
## BB#6:                                ## %for.cond
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	cmpne $b0.0 = $r0.57, -1
;;
;;
	c0	br $b0.0, LBB9_9
;;
## BB#7:                                ## %sw.bb2
                                        ##   in Loop: Header=BB9_1 Depth=1
.call init_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = init_dict
;;
	c0	mov $r0.61 = $r0.63
	c0	goto LBB9_1
;;
LBB9_3::                                ## %for.cond
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	cmpeq $b0.0 = $r0.57, -6
;;
;;
	c0	br $b0.0, LBB9_32
;;
LBB9_9::                                ## %sw.epilog
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	mov $r0.61 = $r0.57
	c0	ldw $r0.11 = 0[$r0.58]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB9_23
;;
## BB#10:                               ## %if.then
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	cmpeq $b0.0 = $r0.57, 2
;;
;;
	c0	br $b0.0, LBB9_15
;;
## BB#11:                               ## %if.then
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	cmpeq $b0.0 = $r0.57, 1
;;
;;
	c0	brf $b0.0, LBB9_12
;;
## BB#14:                               ## %sw.bb8
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.3 = 60[$r0.1]
;;
.call getcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = getcode
;;
	c0	mov $r0.3 = $r0.60
;;
.call putdata, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putdata
;;
	c0	mov $r0.61 = $r0.63
	c0	goto LBB9_1
;;
LBB9_23::                               ## %if.else
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.11 = 76[$r0.1]
;;
;;
	c0	ldw $r0.11 = 0[$r0.11]
;;
;;
	c0	cmpne $b0.0 = $r0.57, $r0.11
;;
;;
	c0	br $b0.0, LBB9_30
;;
## BB#24:                               ## %if.then35
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.3 = 32[$r0.1]
;;
.call getcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = getcode
;;
	c0	cmpeq $b0.0 = $r0.3, 2
;;
;;
	c0	br $b0.0, LBB9_28
;;
## BB#25:                               ## %if.then35
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	cmpeq $b0.0 = $r0.3, 1
;;
;;
	c0	brf $b0.0, LBB9_26
;;
## BB#29:                               ## %sw.epilog40
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.13 = 76[$r0.1]
;;
;;
	c0	stw 76[$r0.1] = $r0.13
;;
	c0	ldw $r0.11 = 0[$r0.13]
;;
;;
	c0	add $r0.11 = $r0.11, 51
	c0	ldw $r0.12 = 68[$r0.1]
;;
;;
	c0	shr $r0.12 = $r0.11, $r0.12
	c0	ldw $r0.14 = 64[$r0.1]
;;
;;
	c0	shru $r0.12 = $r0.12, $r0.14
;;
	c0	add $r0.12 = $r0.11, $r0.12
;;
	c0	and $r0.12 = $r0.12, -256
;;
	c0	sub $r0.11 = $r0.11, $r0.12
;;
	c0	stw 0[$r0.13] = $r0.11
;;
LBB9_30::                               ## %if.end43
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	mov $r0.3 = $r0.61
;;
.call putdata, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putdata
;;
	c0	zxtb $r0.62 = $r0.57
	c0	mov $r0.3 = $r0.63
;;
	c0	mov $r0.4 = $r0.62
;;
.call search_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = search_dict
;;
	c0	cmpne $b0.0 = $r0.3, 0
	c0	mov $r0.61 = $r0.3
;;
;;
	c0	br $b0.0, LBB9_1
;;
## BB#31:                               ## %if.end48
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	add $r0.61 = $r0.57, 3
	c0	mov $r0.3 = $r0.63
	c0	mov $r0.4 = $r0.62
;;
.call add_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = add_dict
;;
	c0	goto LBB9_1
;;
LBB9_15::                               ## %sw.bb10
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.11 = 0[$r0.59]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 0[$r0.59] = $r0.11
;;
	c0	ldw $r0.13 = 56[$r0.1]
;;
;;
	c0	stw 56[$r0.1] = $r0.13
;;
	c0	ldw $r0.11 = 0[$r0.13]
;;
	c0	ldw $r0.12 = 40[$r0.1]
;;
;;
	c0	shl $r0.11 = $r0.11, $r0.12
;;
	c0	stw 0[$r0.13] = $r0.11
	c0	mov $r0.61 = $r0.63
	c0	goto LBB9_1
;;
LBB9_12::                               ## %if.then
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	cmpne $b0.0 = $r0.57, 0
	c0	ldw $r0.11 = 36[$r0.1]
;;
	c0	ldw $r0.12 = 44[$r0.1]
	c0	mov $r0.13 = $r0.61
;;
	c0	ldw $r0.15 = 52[$r0.1]
;;
	c0	ldw $r0.16 = 48[$r0.1]
	c0	br $b0.0, LBB9_16
;;
## BB#13:                               ## %sw.bb6
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	stw 48[$r0.1] = $r0.16
;;
	c0	stw 52[$r0.1] = $r0.15
;;
	c0	ldw $r0.57 = 60[$r0.1]
;;
;;
	c0	mov $r0.3 = $r0.57
;;
.call getcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = getcode
;;
	c0	stw 0[$r0.58] = $r0.57
	c0	mov $r0.61 = $r0.63
	c0	goto LBB9_1
;;
LBB9_16::                               ## %for.body
                                        ##   Parent Loop BB9_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	mov $r0.57 = $r0.11
	c0	sh3add $r0.13 = $r0.13, $r0.15
;;
	c0	ldw $r0.11 = 4[$r0.13]
	c0	add $r0.62 = $r0.12, -1
;;
;;
	c0	shru $r0.14 = $r0.11, $r0.16
	c0	add $r0.11 = $r0.57, -1
;;
	c0	stb -1[$r0.12] = $r0.14
;;
	c0	ldw $r0.12 = 0[$r0.13]
;;
;;
	c0	and $r0.13 = $r0.12, 2047
;;
	c0	cmpne $b0.0 = $r0.13, 0
	c0	mov $r0.12 = $r0.62
;;
;;
	c0	br $b0.0, LBB9_16
;;
## BB#17:                               ## %for.end
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	stw 48[$r0.1] = $r0.16
;;
	c0	stw 52[$r0.1] = $r0.15
;;
	c0	ldbu $r0.11 = 0[$r0.62]
;;
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	mov $r0.3 = $r0.63
	c0	mov $r0.4 = $r0.11
;;
.call search_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = search_dict
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB9_19
;;
## BB#18:                               ## %if.then19
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	mov $r0.3 = $r0.63
	c0	ldw $r0.4 = 28[$r0.1]
;;
;;
.call add_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = add_dict
;;
LBB9_19::                               ## %for.cond20.preheader
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.11 = 44[$r0.1]
;;
;;
	c0	cmpgeu $b0.0 = $r0.62, $r0.11
;;
;;
	c0	br $b0.0, LBB9_1
;;
LBB9_20::                               ## %for.body22
                                        ##   Parent Loop BB9_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldw $r0.11 = 72[$r0.1]
;;
;;
	c0	add $r0.62 = $r0.11, $r0.57
;;
	c0	ldbu $r0.3 = 0[$r0.62]
;;
;;
.call putdata, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putdata
;;
	c0	ldw $r0.11 = 76[$r0.1]
;;
;;
	c0	ldw $r0.11 = 0[$r0.11]
;;
	c0	ldbu $r0.12 = 0[$r0.62]
;;
;;
	c0	cmpne $b0.0 = $r0.12, $r0.11
;;
;;
	c0	br $b0.0, LBB9_22
;;
## BB#21:                               ## %if.then27
                                        ##   in Loop: Header=BB9_20 Depth=2
	c0	add $r0.11 = $r0.11, 51
	c0	ldw $r0.12 = 68[$r0.1]
;;
;;
	c0	shr $r0.12 = $r0.11, $r0.12
	c0	ldw $r0.13 = 64[$r0.1]
;;
;;
	c0	shru $r0.12 = $r0.12, $r0.13
;;
	c0	add $r0.12 = $r0.11, $r0.12
;;
	c0	and $r0.12 = $r0.12, -256
;;
	c0	sub $r0.11 = $r0.11, $r0.12
	c0	ldw $r0.12 = 76[$r0.1]
;;
;;
	c0	stw 0[$r0.12] = $r0.11
;;
LBB9_22::                               ## %for.inc29
                                        ##   in Loop: Header=BB9_20 Depth=2
	c0	add $r0.57 = $r0.57, 1
;;
	c0	cmpeq $b0.0 = $r0.57, 250
;;
;;
	c0	br $b0.0, LBB9_1
;;
	c0	goto LBB9_20
;;
LBB9_28::                               ## %sw.bb38
                                        ##   in Loop: Header=BB9_1 Depth=1
.call init_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = init_dict
;;
	c0	ldw $r0.61 = 60[$r0.1]
	c0	goto LBB9_1
;;
LBB9_26::                               ## %if.then35
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	cmpne $b0.0 = $r0.3, 0
	c0	mov $r0.61 = $r0.63
;;
;;
	c0	br $b0.0, LBB9_1
;;
## BB#27:                               ## %sw.bb37
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.11 = 40[$r0.1]
;;
;;
	c0	stw 0[$r0.58] = $r0.11
	c0	mov $r0.61 = $r0.63
	c0	goto LBB9_1
;;
LBB9_32::                               ## %return
	c0	ldw $l0.0 = 80[$r0.1]
;;
	c0	ldw $r0.63 = 84[$r0.1]
;;
	c0	ldw $r0.62 = 88[$r0.1]
;;
	c0	ldw $r0.61 = 92[$r0.1]
;;
	c0	ldw $r0.60 = 96[$r0.1]
;;
	c0	ldw $r0.59 = 100[$r0.1]
;;
	c0	ldw $r0.58 = 104[$r0.1]
;;
.return ret($r0.3:s32)
	c0	ldw $r0.57 = 108[$r0.1]
	c0	return $r0.1 = $r0.1, 128, $l0.0
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
	c0	mov $r0.11 = gE
	c0	mov $r0.12 = 0
;;
	c0	mov $r0.13 = gP
	c0	mov $r0.14 = compress
;;
	c0	stw 0[$r0.11] = $r0.12
	c0	mov $r0.11 = escape
;;
	c0	mov $r0.15 = eaddr
	c0	mov $r0.16 = baddr
;;
	c0	stw 0[$r0.13] = $r0.12
	c0	mov $r0.13 = codedone
;;
	c0	mov $r0.57 = eout
	c0	mov $r0.58 = outbuf
;;
	c0	stw 0[$r0.14] = $r0.12
;;
	c0	stw 0[$r0.11] = $r0.12
;;
	c0	stw 0[$r0.15] = $r0.12
;;
	c0	stw 0[$r0.16] = $r0.12
	c0	mov $r0.59 = inbuf
;;
	c0	stw 0[$r0.13] = $r0.12
;;
.call encode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	stw 0[$r0.57] = $r0.58
	c0	call $l0.0 = encode
;;
.call decode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = decode
;;
	c0	add $r0.11 = $r0.59, 7554
;;
LBB10_1::                               ## %for.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldbu $r0.12 = 0[$r0.58]
;;
	c0	ldbu $r0.13 = 0[$r0.59]
;;
;;
	c0	cmpne $b0.0 = $r0.13, $r0.12
;;
;;
	c0	br $b0.0, LBB10_3
;;
## BB#2:                                ## %for.inc
                                        ##   in Loop: Header=BB10_1 Depth=1
	c0	add $r0.59 = $r0.59, 1
	c0	add $r0.58 = $r0.58, 1
;;
	c0	cmpltu $b0.0 = $r0.59, $r0.11
;;
;;
	c0	br $b0.0, LBB10_1
;;
LBB10_3::                               ## %for.end
	c0	ldw $r0.11 = 0[$r0.57]
;;
;;
	c0	cmpeq $b0.0 = $r0.58, $r0.11
;;
;;
	c0	br $b0.0, LBB10_5
;;
## BB#4:                                ## %if.then7
	c0	mov $r0.57 = 15
	c0	mov $r0.3 = str2
;;
.call puts, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = puts
;;
	c0	goto LBB10_6
;;
LBB10_5::                               ## %if.else
	c0	mov $r0.57 = 66
	c0	mov $r0.3 = str
;;
.call puts, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = puts
;;
LBB10_6::                               ## %return
	c0	mov $r0.3 = $r0.57
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

inbuf::                                 ## @inbuf
	.data1 37
	.data1 33
	.data1 80
	.data1 83
	.data1 45
	.data1 65
	.data1 100
	.data1 111
	.data1 98
	.data1 101
	.data1 45
	.data1 50
	.data1 46
	.data1 48
	.data1 10
	.data1 37
	.data1 37
	.data1 67
	.data1 114
	.data1 101
	.data1 97
	.data1 116
	.data1 111
	.data1 114
	.data1 58
	.data1 32
	.data1 100
	.data1 118
	.data1 105
	.data1 112
	.data1 115
	.data1 107
	.data1 32
	.data1 53
	.data1 46
	.data1 53
	.data1 56
	.data1 97
	.data1 32
	.data1 67
	.data1 111
	.data1 112
	.data1 121
	.data1 114
	.data1 105
	.data1 103
	.data1 104
	.data1 116
	.data1 32
	.data1 49
	.data1 57
	.data1 56
	.data1 54
	.data1 44
	.data1 32
	.data1 49
	.data1 57
	.data1 57
	.data1 52
	.data1 32
	.data1 82
	.data1 97
	.data1 100
	.data1 105
	.data1 99
	.data1 97
	.data1 108
	.data1 32
	.data1 69
	.data1 121
	.data1 101
	.data1 32
	.data1 83
	.data1 111
	.data1 102
	.data1 116
	.data1 119
	.data1 97
	.data1 114
	.data1 101
	.data1 10
	.data1 37
	.data1 37
	.data1 84
	.data1 105
	.data1 116
	.data1 108
	.data1 101
	.data1 58
	.data1 32
	.data1 115
	.data1 101
	.data1 115
	.data1 116
	.data1 101
	.data1 109
	.data1 112
	.data1 108
	.data1 97
	.data1 116
	.data1 101
	.data1 46
	.data1 100
	.data1 118
	.data1 105
	.data1 10
	.data1 37
	.data1 37
	.data1 80
	.data1 97
	.data1 103
	.data1 101
	.data1 115
	.data1 58
	.data1 32
	.data1 49
	.data1 10
	.data1 37
	.data1 37
	.data1 80
	.data1 97
	.data1 103
	.data1 101
	.data1 79
	.data1 114
	.data1 100
	.data1 101
	.data1 114
	.data1 58
	.data1 32
	.data1 65
	.data1 115
	.data1 99
	.data1 101
	.data1 110
	.data1 100
	.data1 10
	.data1 37
	.data1 37
	.data1 66
	.data1 111
	.data1 117
	.data1 110
	.data1 100
	.data1 105
	.data1 110
	.data1 103
	.data1 66
	.data1 111
	.data1 120
	.data1 58
	.data1 32
	.data1 48
	.data1 32
	.data1 48
	.data1 32
	.data1 54
	.data1 49
	.data1 50
	.data1 32
	.data1 55
	.data1 57
	.data1 50
	.data1 10
	.data1 37
	.data1 37
	.data1 68
	.data1 111
	.data1 99
	.data1 117
	.data1 109
	.data1 101
	.data1 110
	.data1 116
	.data1 70
	.data1 111
	.data1 110
	.data1 116
	.data1 115
	.data1 58
	.data1 32
	.data1 84
	.data1 105
	.data1 109
	.data1 101
	.data1 115
	.data1 45
	.data1 66
	.data1 111
	.data1 108
	.data1 100
	.data1 32
	.data1 84
	.data1 105
	.data1 109
	.data1 101
	.data1 115
	.data1 45
	.data1 82
	.data1 111
	.data1 109
	.data1 97
	.data1 110
	.data1 32
	.data1 84
	.data1 105
	.data1 109
	.data1 101
	.data1 115
	.data1 45
	.data1 66
	.data1 111
	.data1 108
	.data1 100
	.data1 73
	.data1 116
	.data1 97
	.data1 108
	.data1 105
	.data1 99
	.data1 32
	.data1 84
	.data1 105
	.data1 109
	.data1 101
	.data1 115
	.data1 45
	.data1 73
	.data1 116
	.data1 97
	.data1 108
	.data1 105
	.data1 99
	.data1 10
	.data1 37
	.data1 37
	.data1 68
	.data1 111
	.data1 99
	.data1 117
	.data1 109
	.data1 101
	.data1 110
	.data1 116
	.data1 80
	.data1 97
	.data1 112
	.data1 101
	.data1 114
	.data1 83
	.data1 105
	.data1 122
	.data1 101
	.data1 115
	.data1 58
	.data1 32
	.data1 76
	.data1 101
	.data1 116
	.data1 116
	.data1 101
	.data1 114
	.data1 10
	.data1 37
	.data1 37
	.data1 69
	.data1 110
	.data1 100
	.data1 67
	.data1 111
	.data1 109
	.data1 109
	.data1 101
	.data1 110
	.data1 116
	.data1 115
	.data1 10
	.data1 37
	.data1 68
	.data1 86
	.data1 73
	.data1 80
	.data1 83
	.data1 67
	.data1 111
	.data1 109
	.data1 109
	.data1 97
	.data1 110
	.data1 100
	.data1 76
	.data1 105
	.data1 110
	.data1 101
	.data1 58
	.data1 32
	.data1 100
	.data1 118
	.data1 105
	.data1 112
	.data1 115
	.data1 32
	.data1 115
	.data1 101
	.data1 115
	.data1 116
	.data1 101
	.data1 109
	.data1 112
	.data1 108
	.data1 97
	.data1 116
	.data1 101
	.data1 46
	.data1 100
	.data1 118
	.data1 105
	.data1 10
	.data1 37
	.data1 68
	.data1 86
	.data1 73
	.data1 80
	.data1 83
	.data1 80
	.data1 97
	.data1 114
	.data1 97
	.data1 109
	.data1 101
	.data1 116
	.data1 101
	.data1 114
	.data1 115
	.data1 58
	.data1 32
	.data1 100
	.data1 112
	.data1 105
	.data1 61
	.data1 51
	.data1 48
	.data1 48
	.data1 44
	.data1 32
	.data1 99
	.data1 111
	.data1 109
	.data1 112
	.data1 114
	.data1 101
	.data1 115
	.data1 115
	.data1 101
	.data1 100
	.data1 44
	.data1 32
	.data1 99
	.data1 111
	.data1 109
	.data1 109
	.data1 101
	.data1 110
	.data1 116
	.data1 115
	.data1 32
	.data1 114
	.data1 101
	.data1 109
	.data1 111
	.data1 118
	.data1 101
	.data1 100
	.data1 10
	.data1 37
	.data1 68
	.data1 86
	.data1 73
	.data1 80
	.data1 83
	.data1 83
	.data1 111
	.data1 117
	.data1 114
	.data1 99
	.data1 101
	.data1 58
	.data1 32
	.data1 32
	.data1 84
	.data1 101
	.data1 88
	.data1 32
	.data1 111
	.data1 117
	.data1 116
	.data1 112
	.data1 117
	.data1 116
	.data1 32
	.data1 49
	.data1 57
	.data1 57
	.data1 54
	.data1 46
	.data1 48
	.data1 49
	.data1 46
	.data1 50
	.data1 53
	.data1 58
	.data1 50
	.data1 50
	.data1 48
	.data1 52
	.data1 10
	.data1 37
	.data1 37
	.data1 66
	.data1 101
	.data1 103
	.data1 105
	.data1 110
	.data1 80
	.data1 114
	.data1 111
	.data1 99
	.data1 83
	.data1 101
	.data1 116
	.data1 58
	.data1 32
	.data1 116
	.data1 101
	.data1 120
	.data1 99
	.data1 46
	.data1 112
	.data1 114
	.data1 111
	.data1 10
	.data1 47
	.data1 84
	.data1 101
	.data1 88
	.data1 68
	.data1 105
	.data1 99
	.data1 116
	.data1 32
	.data1 50
	.data1 53
	.data1 48
	.data1 32
	.data1 100
	.data1 105
	.data1 99
	.data1 116
	.data1 32
	.data1 100
	.data1 101
	.data1 102
	.data1 32
	.data1 84
	.data1 101
	.data1 88
	.data1 68
	.data1 105
	.data1 99
	.data1 116
	.data1 32
	.data1 98
	.data1 101
	.data1 103
	.data1 105
	.data1 110
	.data1 32
	.data1 47
	.data1 78
	.data1 123
	.data1 100
	.data1 101
	.data1 102
	.data1 125
	.data1 100
	.data1 101
	.data1 102
	.data1 32
	.data1 47
	.data1 66
	.data1 123
	.data1 98
	.data1 105
	.data1 110
	.data1 100
	.data1 32
	.data1 100
	.data1 101
	.data1 102
	.data1 125
	.data1 78
	.data1 32
	.data1 47
	.data1 83
	.data1 123
	.data1 101
	.data1 120
	.data1 99
	.data1 104
	.data1 125
	.data1 78
	.data1 10
	.data1 47
	.data1 88
	.data1 123
	.data1 83
	.data1 32
	.data1 78
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 84
	.data1 82
	.data1 123
	.data1 116
	.data1 114
	.data1 97
	.data1 110
	.data1 115
	.data1 108
	.data1 97
	.data1 116
	.data1 101
	.data1 125
	.data1 78
	.data1 32
	.data1 47
	.data1 105
	.data1 115
	.data1 108
	.data1 115
	.data1 32
	.data1 102
	.data1 97
	.data1 108
	.data1 115
	.data1 101
	.data1 32
	.data1 78
	.data1 32
	.data1 47
	.data1 118
	.data1 115
	.data1 105
	.data1 122
	.data1 101
	.data1 32
	.data1 49
	.data1 49
	.data1 32
	.data1 55
	.data1 50
	.data1 32
	.data1 109
	.data1 117
	.data1 108
	.data1 32
	.data1 78
	.data1 32
	.data1 47
	.data1 104
	.data1 115
	.data1 105
	.data1 122
	.data1 101
	.data1 32
	.data1 56
	.data1 46
	.data1 53
	.data1 32
	.data1 55
	.data1 50
	.data1 10
	.data1 109
	.data1 117
	.data1 108
	.data1 32
	.data1 78
	.data1 32
	.data1 47
	.data1 108
	.data1 97
	.data1 110
	.data1 100
	.data1 112
	.data1 108
	.data1 117
	.data1 115
	.data1 57
	.data1 48
	.data1 123
	.data1 102
	.data1 97
	.data1 108
	.data1 115
	.data1 101
	.data1 125
	.data1 100
	.data1 101
	.data1 102
	.data1 32
	.data1 47
	.data1 64
	.data1 114
	.data1 105
	.data1 103
	.data1 105
	.data1 110
	.data1 123
	.data1 105
	.data1 115
	.data1 108
	.data1 115
	.data1 123
	.data1 91
	.data1 48
	.data1 32
	.data1 108
	.data1 97
	.data1 110
	.data1 100
	.data1 112
	.data1 108
	.data1 117
	.data1 115
	.data1 57
	.data1 48
	.data1 123
	.data1 49
	.data1 32
	.data1 45
	.data1 49
	.data1 125
	.data1 123
	.data1 45
	.data1 49
	.data1 32
	.data1 49
	.data1 125
	.data1 10
	.data1 105
	.data1 102
	.data1 101
	.data1 108
	.data1 115
	.data1 101
	.data1 32
	.data1 48
	.data1 32
	.data1 48
	.data1 32
	.data1 48
	.data1 93
	.data1 99
	.data1 111
	.data1 110
	.data1 99
	.data1 97
	.data1 116
	.data1 125
	.data1 105
	.data1 102
	.data1 32
	.data1 55
	.data1 50
	.data1 32
	.data1 82
	.data1 101
	.data1 115
	.data1 111
	.data1 108
	.data1 117
	.data1 116
	.data1 105
	.data1 111
	.data1 110
	.data1 32
	.data1 100
	.data1 105
	.data1 118
	.data1 32
	.data1 55
	.data1 50
	.data1 32
	.data1 86
	.data1 82
	.data1 101
	.data1 115
	.data1 111
	.data1 108
	.data1 117
	.data1 116
	.data1 105
	.data1 111
	.data1 110
	.data1 32
	.data1 100
	.data1 105
	.data1 118
	.data1 32
	.data1 110
	.data1 101
	.data1 103
	.data1 32
	.data1 115
	.data1 99
	.data1 97
	.data1 108
	.data1 101
	.data1 10
	.data1 105
	.data1 115
	.data1 108
	.data1 115
	.data1 123
	.data1 108
	.data1 97
	.data1 110
	.data1 100
	.data1 112
	.data1 108
	.data1 117
	.data1 115
	.data1 57
	.data1 48
	.data1 123
	.data1 86
	.data1 82
	.data1 101
	.data1 115
	.data1 111
	.data1 108
	.data1 117
	.data1 116
	.data1 105
	.data1 111
	.data1 110
	.data1 32
	.data1 55
	.data1 50
	.data1 32
	.data1 100
	.data1 105
	.data1 118
	.data1 32
	.data1 118
	.data1 115
	.data1 105
	.data1 122
	.data1 101
	.data1 32
	.data1 109
	.data1 117
	.data1 108
	.data1 32
	.data1 48
	.data1 32
	.data1 101
	.data1 120
	.data1 99
	.data1 104
	.data1 125
	.data1 123
	.data1 82
	.data1 101
	.data1 115
	.data1 111
	.data1 108
	.data1 117
	.data1 116
	.data1 105
	.data1 111
	.data1 110
	.data1 32
	.data1 45
	.data1 55
	.data1 50
	.data1 32
	.data1 100
	.data1 105
	.data1 118
	.data1 10
	.data1 104
	.data1 115
	.data1 105
	.data1 122
	.data1 101
	.data1 32
	.data1 109
	.data1 117
	.data1 108
	.data1 32
	.data1 48
	.data1 125
	.data1 105
	.data1 102
	.data1 101
	.data1 108
	.data1 115
	.data1 101
	.data1 32
	.data1 84
	.data1 82
	.data1 125
	.data1 105
	.data1 102
	.data1 32
	.data1 82
	.data1 101
	.data1 115
	.data1 111
	.data1 108
	.data1 117
	.data1 116
	.data1 105
	.data1 111
	.data1 110
	.data1 32
	.data1 86
	.data1 82
	.data1 101
	.data1 115
	.data1 111
	.data1 108
	.data1 117
	.data1 116
	.data1 105
	.data1 111
	.data1 110
	.data1 32
	.data1 118
	.data1 115
	.data1 105
	.data1 122
	.data1 101
	.data1 32
	.data1 45
	.data1 55
	.data1 50
	.data1 32
	.data1 100
	.data1 105
	.data1 118
	.data1 32
	.data1 49
	.data1 32
	.data1 97
	.data1 100
	.data1 100
	.data1 32
	.data1 109
	.data1 117
	.data1 108
	.data1 10
	.data1 84
	.data1 82
	.data1 91
	.data1 109
	.data1 97
	.data1 116
	.data1 114
	.data1 105
	.data1 120
	.data1 32
	.data1 99
	.data1 117
	.data1 114
	.data1 114
	.data1 101
	.data1 110
	.data1 116
	.data1 109
	.data1 97
	.data1 116
	.data1 114
	.data1 105
	.data1 120
	.data1 123
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 114
	.data1 111
	.data1 117
	.data1 110
	.data1 100
	.data1 32
	.data1 115
	.data1 117
	.data1 98
	.data1 32
	.data1 97
	.data1 98
	.data1 115
	.data1 32
	.data1 48
	.data1 46
	.data1 48
	.data1 48
	.data1 48
	.data1 48
	.data1 49
	.data1 32
	.data1 108
	.data1 116
	.data1 123
	.data1 114
	.data1 111
	.data1 117
	.data1 110
	.data1 100
	.data1 125
	.data1 105
	.data1 102
	.data1 125
	.data1 10
	.data1 102
	.data1 111
	.data1 114
	.data1 97
	.data1 108
	.data1 108
	.data1 32
	.data1 114
	.data1 111
	.data1 117
	.data1 110
	.data1 100
	.data1 32
	.data1 101
	.data1 120
	.data1 99
	.data1 104
	.data1 32
	.data1 114
	.data1 111
	.data1 117
	.data1 110
	.data1 100
	.data1 32
	.data1 101
	.data1 120
	.data1 99
	.data1 104
	.data1 93
	.data1 115
	.data1 101
	.data1 116
	.data1 109
	.data1 97
	.data1 116
	.data1 114
	.data1 105
	.data1 120
	.data1 125
	.data1 78
	.data1 32
	.data1 47
	.data1 64
	.data1 108
	.data1 97
	.data1 110
	.data1 100
	.data1 115
	.data1 99
	.data1 97
	.data1 112
	.data1 101
	.data1 123
	.data1 47
	.data1 105
	.data1 115
	.data1 108
	.data1 115
	.data1 32
	.data1 116
	.data1 114
	.data1 117
	.data1 101
	.data1 32
	.data1 78
	.data1 125
	.data1 66
	.data1 10
	.data1 47
	.data1 64
	.data1 109
	.data1 97
	.data1 110
	.data1 117
	.data1 97
	.data1 108
	.data1 102
	.data1 101
	.data1 101
	.data1 100
	.data1 123
	.data1 115
	.data1 116
	.data1 97
	.data1 116
	.data1 117
	.data1 115
	.data1 100
	.data1 105
	.data1 99
	.data1 116
	.data1 32
	.data1 47
	.data1 109
	.data1 97
	.data1 110
	.data1 117
	.data1 97
	.data1 108
	.data1 102
	.data1 101
	.data1 101
	.data1 100
	.data1 32
	.data1 116
	.data1 114
	.data1 117
	.data1 101
	.data1 32
	.data1 112
	.data1 117
	.data1 116
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 64
	.data1 99
	.data1 111
	.data1 112
	.data1 105
	.data1 101
	.data1 115
	.data1 123
	.data1 47
	.data1 35
	.data1 99
	.data1 111
	.data1 112
	.data1 105
	.data1 101
	.data1 115
	.data1 32
	.data1 88
	.data1 125
	.data1 66
	.data1 10
	.data1 47
	.data1 70
	.data1 77
	.data1 97
	.data1 116
	.data1 91
	.data1 49
	.data1 32
	.data1 48
	.data1 32
	.data1 48
	.data1 32
	.data1 45
	.data1 49
	.data1 32
	.data1 48
	.data1 32
	.data1 48
	.data1 93
	.data1 78
	.data1 32
	.data1 47
	.data1 70
	.data1 66
	.data1 66
	.data1 91
	.data1 48
	.data1 32
	.data1 48
	.data1 32
	.data1 48
	.data1 32
	.data1 48
	.data1 93
	.data1 78
	.data1 32
	.data1 47
	.data1 110
	.data1 110
	.data1 32
	.data1 48
	.data1 32
	.data1 78
	.data1 32
	.data1 47
	.data1 73
	.data1 69
	.data1 32
	.data1 48
	.data1 32
	.data1 78
	.data1 32
	.data1 47
	.data1 99
	.data1 116
	.data1 114
	.data1 32
	.data1 48
	.data1 32
	.data1 78
	.data1 32
	.data1 47
	.data1 100
	.data1 102
	.data1 45
	.data1 116
	.data1 97
	.data1 105
	.data1 108
	.data1 123
	.data1 10
	.data1 47
	.data1 110
	.data1 110
	.data1 32
	.data1 56
	.data1 32
	.data1 100
	.data1 105
	.data1 99
	.data1 116
	.data1 32
	.data1 78
	.data1 32
	.data1 110
	.data1 110
	.data1 32
	.data1 98
	.data1 101
	.data1 103
	.data1 105
	.data1 110
	.data1 32
	.data1 47
	.data1 70
	.data1 111
	.data1 110
	.data1 116
	.data1 84
	.data1 121
	.data1 112
	.data1 101
	.data1 32
	.data1 51
	.data1 32
	.data1 78
	.data1 32
	.data1 47
	.data1 70
	.data1 111
	.data1 110
	.data1 116
	.data1 77
	.data1 97
	.data1 116
	.data1 114
	.data1 105
	.data1 120
	.data1 32
	.data1 102
	.data1 110
	.data1 116
	.data1 114
	.data1 120
	.data1 32
	.data1 78
	.data1 32
	.data1 47
	.data1 70
	.data1 111
	.data1 110
	.data1 116
	.data1 66
	.data1 66
	.data1 111
	.data1 120
	.data1 32
	.data1 70
	.data1 66
	.data1 66
	.data1 32
	.data1 78
	.data1 10
	.data1 115
	.data1 116
	.data1 114
	.data1 105
	.data1 110
	.data1 103
	.data1 32
	.data1 47
	.data1 98
	.data1 97
	.data1 115
	.data1 101
	.data1 32
	.data1 88
	.data1 32
	.data1 97
	.data1 114
	.data1 114
	.data1 97
	.data1 121
	.data1 32
	.data1 47
	.data1 66
	.data1 105
	.data1 116
	.data1 77
	.data1 97
	.data1 112
	.data1 115
	.data1 32
	.data1 88
	.data1 32
	.data1 47
	.data1 66
	.data1 117
	.data1 105
	.data1 108
	.data1 100
	.data1 67
	.data1 104
	.data1 97
	.data1 114
	.data1 123
	.data1 67
	.data1 104
	.data1 97
	.data1 114
	.data1 66
	.data1 117
	.data1 105
	.data1 108
	.data1 100
	.data1 101
	.data1 114
	.data1 125
	.data1 78
	.data1 32
	.data1 47
	.data1 69
	.data1 110
	.data1 99
	.data1 111
	.data1 100
	.data1 105
	.data1 110
	.data1 103
	.data1 32
	.data1 73
	.data1 69
	.data1 32
	.data1 78
	.data1 10
	.data1 101
	.data1 110
	.data1 100
	.data1 32
	.data1 100
	.data1 117
	.data1 112
	.data1 123
	.data1 47
	.data1 102
	.data1 111
	.data1 111
	.data1 32
	.data1 115
	.data1 101
	.data1 116
	.data1 102
	.data1 111
	.data1 110
	.data1 116
	.data1 125
	.data1 50
	.data1 32
	.data1 97
	.data1 114
	.data1 114
	.data1 97
	.data1 121
	.data1 32
	.data1 99
	.data1 111
	.data1 112
	.data1 121
	.data1 32
	.data1 99
	.data1 118
	.data1 120
	.data1 32
	.data1 78
	.data1 32
	.data1 108
	.data1 111
	.data1 97
	.data1 100
	.data1 32
	.data1 48
	.data1 32
	.data1 110
	.data1 110
	.data1 32
	.data1 112
	.data1 117
	.data1 116
	.data1 32
	.data1 47
	.data1 99
	.data1 116
	.data1 114
	.data1 32
	.data1 48
	.data1 32
	.data1 78
	.data1 91
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 100
	.data1 102
	.data1 123
	.data1 10
	.data1 47
	.data1 115
	.data1 102
	.data1 32
	.data1 49
	.data1 32
	.data1 78
	.data1 32
	.data1 47
	.data1 102
	.data1 110
	.data1 116
	.data1 114
	.data1 120
	.data1 32
	.data1 70
	.data1 77
	.data1 97
	.data1 116
	.data1 32
	.data1 78
	.data1 32
	.data1 100
	.data1 102
	.data1 45
	.data1 116
	.data1 97
	.data1 105
	.data1 108
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 100
	.data1 102
	.data1 115
	.data1 123
	.data1 100
	.data1 105
	.data1 118
	.data1 32
	.data1 47
	.data1 115
	.data1 102
	.data1 32
	.data1 88
	.data1 32
	.data1 47
	.data1 102
	.data1 110
	.data1 116
	.data1 114
	.data1 120
	.data1 91
	.data1 115
	.data1 102
	.data1 32
	.data1 48
	.data1 32
	.data1 48
	.data1 32
	.data1 115
	.data1 102
	.data1 32
	.data1 110
	.data1 101
	.data1 103
	.data1 32
	.data1 48
	.data1 32
	.data1 48
	.data1 93
	.data1 10
	.data1 78
	.data1 32
	.data1 100
	.data1 102
	.data1 45
	.data1 116
	.data1 97
	.data1 105
	.data1 108
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 69
	.data1 123
	.data1 112
	.data1 111
	.data1 112
	.data1 32
	.data1 110
	.data1 110
	.data1 32
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 100
	.data1 101
	.data1 102
	.data1 105
	.data1 110
	.data1 101
	.data1 102
	.data1 111
	.data1 110
	.data1 116
	.data1 32
	.data1 115
	.data1 101
	.data1 116
	.data1 102
	.data1 111
	.data1 110
	.data1 116
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 99
	.data1 104
	.data1 45
	.data1 119
	.data1 105
	.data1 100
	.data1 116
	.data1 104
	.data1 123
	.data1 99
	.data1 104
	.data1 45
	.data1 100
	.data1 97
	.data1 116
	.data1 97
	.data1 32
	.data1 100
	.data1 117
	.data1 112
	.data1 10
	.data1 108
	.data1 101
	.data1 110
	.data1 103
	.data1 116
	.data1 104
	.data1 32
	.data1 53
	.data1 32
	.data1 115
	.data1 117
	.data1 98
	.data1 32
	.data1 103
	.data1 101
	.data1 116
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 99
	.data1 104
	.data1 45
	.data1 104
	.data1 101
	.data1 105
	.data1 103
	.data1 104
	.data1 116
	.data1 123
	.data1 99
	.data1 104
	.data1 45
	.data1 100
	.data1 97
	.data1 116
	.data1 97
	.data1 32
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 108
	.data1 101
	.data1 110
	.data1 103
	.data1 116
	.data1 104
	.data1 32
	.data1 52
	.data1 32
	.data1 115
	.data1 117
	.data1 98
	.data1 32
	.data1 103
	.data1 101
	.data1 116
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 99
	.data1 104
	.data1 45
	.data1 120
	.data1 111
	.data1 102
	.data1 102
	.data1 123
	.data1 10
	.data1 49
	.data1 50
	.data1 56
	.data1 32
	.data1 99
	.data1 104
	.data1 45
	.data1 100
	.data1 97
	.data1 116
	.data1 97
	.data1 32
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 108
	.data1 101
	.data1 110
	.data1 103
	.data1 116
	.data1 104
	.data1 32
	.data1 51
	.data1 32
	.data1 115
	.data1 117
	.data1 98
	.data1 32
	.data1 103
	.data1 101
	.data1 116
	.data1 32
	.data1 115
	.data1 117
	.data1 98
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 99
	.data1 104
	.data1 45
	.data1 121
	.data1 111
	.data1 102
	.data1 102
	.data1 123
	.data1 99
	.data1 104
	.data1 45
	.data1 100
	.data1 97
	.data1 116
	.data1 97
	.data1 32
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 108
	.data1 101
	.data1 110
	.data1 103
	.data1 116
	.data1 104
	.data1 32
	.data1 50
	.data1 32
	.data1 115
	.data1 117
	.data1 98
	.data1 10
	.data1 103
	.data1 101
	.data1 116
	.data1 32
	.data1 49
	.data1 50
	.data1 55
	.data1 32
	.data1 115
	.data1 117
	.data1 98
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 99
	.data1 104
	.data1 45
	.data1 100
	.data1 120
	.data1 123
	.data1 99
	.data1 104
	.data1 45
	.data1 100
	.data1 97
	.data1 116
	.data1 97
	.data1 32
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 108
	.data1 101
	.data1 110
	.data1 103
	.data1 116
	.data1 104
	.data1 32
	.data1 49
	.data1 32
	.data1 115
	.data1 117
	.data1 98
	.data1 32
	.data1 103
	.data1 101
	.data1 116
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 99
	.data1 104
	.data1 45
	.data1 105
	.data1 109
	.data1 97
	.data1 103
	.data1 101
	.data1 123
	.data1 99
	.data1 104
	.data1 45
	.data1 100
	.data1 97
	.data1 116
	.data1 97
	.data1 10
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 116
	.data1 121
	.data1 112
	.data1 101
	.data1 32
	.data1 47
	.data1 115
	.data1 116
	.data1 114
	.data1 105
	.data1 110
	.data1 103
	.data1 116
	.data1 121
	.data1 112
	.data1 101
	.data1 32
	.data1 110
	.data1 101
	.data1 123
	.data1 99
	.data1 116
	.data1 114
	.data1 32
	.data1 103
	.data1 101
	.data1 116
	.data1 32
	.data1 47
	.data1 99
	.data1 116
	.data1 114
	.data1 32
	.data1 99
	.data1 116
	.data1 114
	.data1 32
	.data1 49
	.data1 32
	.data1 97
	.data1 100
	.data1 100
	.data1 32
	.data1 78
	.data1 125
	.data1 105
	.data1 102
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 105
	.data1 100
	.data1 32
	.data1 48
	.data1 32
	.data1 78
	.data1 32
	.data1 47
	.data1 114
	.data1 119
	.data1 32
	.data1 48
	.data1 32
	.data1 78
	.data1 10
	.data1 47
	.data1 114
	.data1 99
	.data1 32
	.data1 48
	.data1 32
	.data1 78
	.data1 32
	.data1 47
	.data1 103
	.data1 112
	.data1 32
	.data1 48
	.data1 32
	.data1 78
	.data1 32
	.data1 47
	.data1 99
	.data1 112
	.data1 32
	.data1 48
	.data1 32
	.data1 78
	.data1 32
	.data1 47
	.data1 71
	.data1 32
	.data1 48
	.data1 32
	.data1 78
	.data1 32
	.data1 47
	.data1 115
	.data1 102
	.data1 32
	.data1 48
	.data1 32
	.data1 78
	.data1 32
	.data1 47
	.data1 67
	.data1 104
	.data1 97
	.data1 114
	.data1 66
	.data1 117
	.data1 105
	.data1 108
	.data1 100
	.data1 101
	.data1 114
	.data1 123
	.data1 115
	.data1 97
	.data1 118
	.data1 101
	.data1 32
	.data1 51
	.data1 32
	.data1 49
	.data1 32
	.data1 114
	.data1 111
	.data1 108
	.data1 108
	.data1 32
	.data1 83
	.data1 32
	.data1 100
	.data1 117
	.data1 112
	.data1 10
	.data1 47
	.data1 98
	.data1 97
	.data1 115
	.data1 101
	.data1 32
	.data1 103
	.data1 101
	.data1 116
	.data1 32
	.data1 50
	.data1 32
	.data1 105
	.data1 110
	.data1 100
	.data1 101
	.data1 120
	.data1 32
	.data1 103
	.data1 101
	.data1 116
	.data1 32
	.data1 83
	.data1 32
	.data1 47
	.data1 66
	.data1 105
	.data1 116
	.data1 77
	.data1 97
	.data1 112
	.data1 115
	.data1 32
	.data1 103
	.data1 101
	.data1 116
	.data1 32
	.data1 83
	.data1 32
	.data1 103
	.data1 101
	.data1 116
	.data1 32
	.data1 47
	.data1 99
	.data1 104
	.data1 45
	.data1 100
	.data1 97
	.data1 116
	.data1 97
	.data1 32
	.data1 88
	.data1 32
	.data1 112
	.data1 111
	.data1 112
	.data1 32
	.data1 47
	.data1 99
	.data1 116
	.data1 114
	.data1 32
	.data1 48
	.data1 32
	.data1 78
	.data1 32
	.data1 99
	.data1 104
	.data1 45
	.data1 100
	.data1 120
	.data1 10
	.data1 48
	.data1 32
	.data1 99
	.data1 104
	.data1 45
	.data1 120
	.data1 111
	.data1 102
	.data1 102
	.data1 32
	.data1 99
	.data1 104
	.data1 45
	.data1 121
	.data1 111
	.data1 102
	.data1 102
	.data1 32
	.data1 99
	.data1 104
	.data1 45
	.data1 104
	.data1 101
	.data1 105
	.data1 103
	.data1 104
	.data1 116
	.data1 32
	.data1 115
	.data1 117
	.data1 98
	.data1 32
	.data1 99
	.data1 104
	.data1 45
	.data1 120
	.data1 111
	.data1 102
	.data1 102
	.data1 32
	.data1 99
	.data1 104
	.data1 45
	.data1 119
	.data1 105
	.data1 100
	.data1 116
	.data1 104
	.data1 32
	.data1 97
	.data1 100
	.data1 100
	.data1 32
	.data1 99
	.data1 104
	.data1 45
	.data1 121
	.data1 111
	.data1 102
	.data1 102
	.data1 10
	.data1 115
	.data1 101
	.data1 116
	.data1 99
	.data1 97
	.data1 99
	.data1 104
	.data1 101
	.data1 100
	.data1 101
	.data1 118
	.data1 105
	.data1 99
	.data1 101
	.data1 32
	.data1 99
	.data1 104
	.data1 45
	.data1 119
	.data1 105
	.data1 100
	.data1 116
	.data1 104
	.data1 32
	.data1 99
	.data1 104
	.data1 45
	.data1 104
	.data1 101
	.data1 105
	.data1 103
	.data1 104
	.data1 116
	.data1 32
	.data1 116
	.data1 114
	.data1 117
	.data1 101
	.data1 91
	.data1 49
	.data1 32
	.data1 48
	.data1 32
	.data1 48
	.data1 32
	.data1 45
	.data1 49
	.data1 32
	.data1 45
	.data1 46
	.data1 49
	.data1 32
	.data1 99
	.data1 104
	.data1 45
	.data1 120
	.data1 111
	.data1 102
	.data1 102
	.data1 32
	.data1 115
	.data1 117
	.data1 98
	.data1 32
	.data1 99
	.data1 104
	.data1 45
	.data1 121
	.data1 111
	.data1 102
	.data1 102
	.data1 10
	.data1 46
	.data1 49
	.data1 32
	.data1 115
	.data1 117
	.data1 98
	.data1 93
	.data1 47
	.data1 105
	.data1 100
	.data1 32
	.data1 99
	.data1 104
	.data1 45
	.data1 105
	.data1 109
	.data1 97
	.data1 103
	.data1 101
	.data1 32
	.data1 78
	.data1 32
	.data1 47
	.data1 114
	.data1 119
	.data1 32
	.data1 99
	.data1 104
	.data1 45
	.data1 119
	.data1 105
	.data1 100
	.data1 116
	.data1 104
	.data1 32
	.data1 55
	.data1 32
	.data1 97
	.data1 100
	.data1 100
	.data1 32
	.data1 56
	.data1 32
	.data1 105
	.data1 100
	.data1 105
	.data1 118
	.data1 32
	.data1 115
	.data1 116
	.data1 114
	.data1 105
	.data1 110
	.data1 103
	.data1 32
	.data1 78
	.data1 32
	.data1 47
	.data1 114
	.data1 99
	.data1 32
	.data1 48
	.data1 32
	.data1 78
	.data1 32
	.data1 47
	.data1 103
	.data1 112
	.data1 32
	.data1 48
	.data1 32
	.data1 78
	.data1 10
	.data1 47
	.data1 99
	.data1 112
	.data1 32
	.data1 48
	.data1 32
	.data1 78
	.data1 123
	.data1 114
	.data1 99
	.data1 32
	.data1 48
	.data1 32
	.data1 110
	.data1 101
	.data1 123
	.data1 114
	.data1 99
	.data1 32
	.data1 49
	.data1 32
	.data1 115
	.data1 117
	.data1 98
	.data1 32
	.data1 47
	.data1 114
	.data1 99
	.data1 32
	.data1 88
	.data1 32
	.data1 114
	.data1 119
	.data1 125
	.data1 123
	.data1 71
	.data1 125
	.data1 105
	.data1 102
	.data1 101
	.data1 108
	.data1 115
	.data1 101
	.data1 125
	.data1 105
	.data1 109
	.data1 97
	.data1 103
	.data1 101
	.data1 109
	.data1 97
	.data1 115
	.data1 107
	.data1 32
	.data1 114
	.data1 101
	.data1 115
	.data1 116
	.data1 111
	.data1 114
	.data1 101
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 71
	.data1 123
	.data1 123
	.data1 105
	.data1 100
	.data1 10
	.data1 103
	.data1 112
	.data1 32
	.data1 103
	.data1 101
	.data1 116
	.data1 32
	.data1 47
	.data1 103
	.data1 112
	.data1 32
	.data1 103
	.data1 112
	.data1 32
	.data1 49
	.data1 32
	.data1 97
	.data1 100
	.data1 100
	.data1 32
	.data1 78
	.data1 32
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 49
	.data1 56
	.data1 32
	.data1 109
	.data1 111
	.data1 100
	.data1 32
	.data1 83
	.data1 32
	.data1 49
	.data1 56
	.data1 32
	.data1 105
	.data1 100
	.data1 105
	.data1 118
	.data1 32
	.data1 112
	.data1 108
	.data1 32
	.data1 83
	.data1 32
	.data1 103
	.data1 101
	.data1 116
	.data1 32
	.data1 101
	.data1 120
	.data1 101
	.data1 99
	.data1 125
	.data1 108
	.data1 111
	.data1 111
	.data1 112
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 97
	.data1 100
	.data1 118
	.data1 123
	.data1 99
	.data1 112
	.data1 10
	.data1 97
	.data1 100
	.data1 100
	.data1 32
	.data1 47
	.data1 99
	.data1 112
	.data1 32
	.data1 88
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 99
	.data1 104
	.data1 103
	.data1 123
	.data1 114
	.data1 119
	.data1 32
	.data1 99
	.data1 112
	.data1 32
	.data1 105
	.data1 100
	.data1 32
	.data1 103
	.data1 112
	.data1 32
	.data1 52
	.data1 32
	.data1 105
	.data1 110
	.data1 100
	.data1 101
	.data1 120
	.data1 32
	.data1 103
	.data1 101
	.data1 116
	.data1 105
	.data1 110
	.data1 116
	.data1 101
	.data1 114
	.data1 118
	.data1 97
	.data1 108
	.data1 32
	.data1 112
	.data1 117
	.data1 116
	.data1 105
	.data1 110
	.data1 116
	.data1 101
	.data1 114
	.data1 118
	.data1 97
	.data1 108
	.data1 32
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 103
	.data1 112
	.data1 32
	.data1 97
	.data1 100
	.data1 100
	.data1 10
	.data1 47
	.data1 103
	.data1 112
	.data1 32
	.data1 88
	.data1 32
	.data1 97
	.data1 100
	.data1 118
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 110
	.data1 100
	.data1 123
	.data1 47
	.data1 99
	.data1 112
	.data1 32
	.data1 48
	.data1 32
	.data1 78
	.data1 32
	.data1 114
	.data1 119
	.data1 32
	.data1 101
	.data1 120
	.data1 105
	.data1 116
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 108
	.data1 115
	.data1 104
	.data1 123
	.data1 114
	.data1 119
	.data1 32
	.data1 99
	.data1 112
	.data1 32
	.data1 50
	.data1 32
	.data1 99
	.data1 111
	.data1 112
	.data1 121
	.data1 32
	.data1 103
	.data1 101
	.data1 116
	.data1 32
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 48
	.data1 32
	.data1 101
	.data1 113
	.data1 123
	.data1 112
	.data1 111
	.data1 112
	.data1 32
	.data1 49
	.data1 125
	.data1 123
	.data1 10
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 50
	.data1 53
	.data1 53
	.data1 32
	.data1 101
	.data1 113
	.data1 123
	.data1 112
	.data1 111
	.data1 112
	.data1 32
	.data1 50
	.data1 53
	.data1 52
	.data1 125
	.data1 123
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 97
	.data1 100
	.data1 100
	.data1 32
	.data1 50
	.data1 53
	.data1 53
	.data1 32
	.data1 97
	.data1 110
	.data1 100
	.data1 32
	.data1 83
	.data1 32
	.data1 49
	.data1 32
	.data1 97
	.data1 110
	.data1 100
	.data1 32
	.data1 111
	.data1 114
	.data1 125
	.data1 105
	.data1 102
	.data1 101
	.data1 108
	.data1 115
	.data1 101
	.data1 125
	.data1 105
	.data1 102
	.data1 101
	.data1 108
	.data1 115
	.data1 101
	.data1 32
	.data1 112
	.data1 117
	.data1 116
	.data1 32
	.data1 49
	.data1 10
	.data1 97
	.data1 100
	.data1 118
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 114
	.data1 115
	.data1 104
	.data1 123
	.data1 114
	.data1 119
	.data1 32
	.data1 99
	.data1 112
	.data1 32
	.data1 50
	.data1 32
	.data1 99
	.data1 111
	.data1 112
	.data1 121
	.data1 32
	.data1 103
	.data1 101
	.data1 116
	.data1 32
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 48
	.data1 32
	.data1 101
	.data1 113
	.data1 123
	.data1 112
	.data1 111
	.data1 112
	.data1 32
	.data1 49
	.data1 50
	.data1 56
	.data1 125
	.data1 123
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 50
	.data1 53
	.data1 53
	.data1 32
	.data1 101
	.data1 113
	.data1 123
	.data1 112
	.data1 111
	.data1 112
	.data1 32
	.data1 49
	.data1 50
	.data1 55
	.data1 125
	.data1 123
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 50
	.data1 10
	.data1 105
	.data1 100
	.data1 105
	.data1 118
	.data1 32
	.data1 83
	.data1 32
	.data1 49
	.data1 50
	.data1 56
	.data1 32
	.data1 97
	.data1 110
	.data1 100
	.data1 32
	.data1 111
	.data1 114
	.data1 125
	.data1 105
	.data1 102
	.data1 101
	.data1 108
	.data1 115
	.data1 101
	.data1 125
	.data1 105
	.data1 102
	.data1 101
	.data1 108
	.data1 115
	.data1 101
	.data1 32
	.data1 112
	.data1 117
	.data1 116
	.data1 32
	.data1 49
	.data1 32
	.data1 97
	.data1 100
	.data1 118
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 99
	.data1 108
	.data1 114
	.data1 123
	.data1 114
	.data1 119
	.data1 32
	.data1 99
	.data1 112
	.data1 32
	.data1 50
	.data1 32
	.data1 105
	.data1 110
	.data1 100
	.data1 101
	.data1 120
	.data1 32
	.data1 115
	.data1 116
	.data1 114
	.data1 105
	.data1 110
	.data1 103
	.data1 10
	.data1 112
	.data1 117
	.data1 116
	.data1 105
	.data1 110
	.data1 116
	.data1 101
	.data1 114
	.data1 118
	.data1 97
	.data1 108
	.data1 32
	.data1 97
	.data1 100
	.data1 118
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 115
	.data1 101
	.data1 116
	.data1 123
	.data1 114
	.data1 119
	.data1 32
	.data1 99
	.data1 112
	.data1 32
	.data1 102
	.data1 105
	.data1 108
	.data1 108
	.data1 115
	.data1 116
	.data1 114
	.data1 32
	.data1 48
	.data1 32
	.data1 52
	.data1 32
	.data1 105
	.data1 110
	.data1 100
	.data1 101
	.data1 120
	.data1 32
	.data1 103
	.data1 101
	.data1 116
	.data1 105
	.data1 110
	.data1 116
	.data1 101
	.data1 114
	.data1 118
	.data1 97
	.data1 108
	.data1 32
	.data1 112
	.data1 117
	.data1 116
	.data1 105
	.data1 110
	.data1 116
	.data1 101
	.data1 114
	.data1 118
	.data1 97
	.data1 108
	.data1 10
	.data1 97
	.data1 100
	.data1 118
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 102
	.data1 105
	.data1 108
	.data1 108
	.data1 115
	.data1 116
	.data1 114
	.data1 32
	.data1 49
	.data1 56
	.data1 32
	.data1 115
	.data1 116
	.data1 114
	.data1 105
	.data1 110
	.data1 103
	.data1 32
	.data1 48
	.data1 32
	.data1 49
	.data1 32
	.data1 49
	.data1 55
	.data1 123
	.data1 50
	.data1 32
	.data1 99
	.data1 111
	.data1 112
	.data1 121
	.data1 32
	.data1 50
	.data1 53
	.data1 53
	.data1 32
	.data1 112
	.data1 117
	.data1 116
	.data1 32
	.data1 112
	.data1 111
	.data1 112
	.data1 125
	.data1 102
	.data1 111
	.data1 114
	.data1 32
	.data1 78
	.data1 32
	.data1 47
	.data1 112
	.data1 108
	.data1 91
	.data1 123
	.data1 97
	.data1 100
	.data1 118
	.data1 32
	.data1 49
	.data1 32
	.data1 99
	.data1 104
	.data1 103
	.data1 125
	.data1 10
	.data1 123
	.data1 97
	.data1 100
	.data1 118
	.data1 32
	.data1 49
	.data1 32
	.data1 99
	.data1 104
	.data1 103
	.data1 32
	.data1 110
	.data1 100
	.data1 125
	.data1 123
	.data1 49
	.data1 32
	.data1 97
	.data1 100
	.data1 100
	.data1 32
	.data1 99
	.data1 104
	.data1 103
	.data1 125
	.data1 123
	.data1 49
	.data1 32
	.data1 97
	.data1 100
	.data1 100
	.data1 32
	.data1 99
	.data1 104
	.data1 103
	.data1 32
	.data1 110
	.data1 100
	.data1 125
	.data1 123
	.data1 97
	.data1 100
	.data1 118
	.data1 32
	.data1 108
	.data1 115
	.data1 104
	.data1 125
	.data1 123
	.data1 97
	.data1 100
	.data1 118
	.data1 32
	.data1 108
	.data1 115
	.data1 104
	.data1 32
	.data1 110
	.data1 100
	.data1 125
	.data1 123
	.data1 97
	.data1 100
	.data1 118
	.data1 32
	.data1 114
	.data1 115
	.data1 104
	.data1 125
	.data1 123
	.data1 10
	.data1 97
	.data1 100
	.data1 118
	.data1 32
	.data1 114
	.data1 115
	.data1 104
	.data1 32
	.data1 110
	.data1 100
	.data1 125
	.data1 123
	.data1 49
	.data1 32
	.data1 97
	.data1 100
	.data1 100
	.data1 32
	.data1 97
	.data1 100
	.data1 118
	.data1 125
	.data1 123
	.data1 47
	.data1 114
	.data1 99
	.data1 32
	.data1 88
	.data1 32
	.data1 110
	.data1 100
	.data1 125
	.data1 123
	.data1 49
	.data1 32
	.data1 97
	.data1 100
	.data1 100
	.data1 32
	.data1 115
	.data1 101
	.data1 116
	.data1 125
	.data1 123
	.data1 49
	.data1 32
	.data1 97
	.data1 100
	.data1 100
	.data1 32
	.data1 99
	.data1 108
	.data1 114
	.data1 125
	.data1 123
	.data1 97
	.data1 100
	.data1 118
	.data1 32
	.data1 50
	.data1 32
	.data1 99
	.data1 104
	.data1 103
	.data1 125
	.data1 123
	.data1 97
	.data1 100
	.data1 118
	.data1 32
	.data1 50
	.data1 10
	.data1 99
	.data1 104
	.data1 103
	.data1 32
	.data1 110
	.data1 100
	.data1 125
	.data1 123
	.data1 112
	.data1 111
	.data1 112
	.data1 32
	.data1 110
	.data1 100
	.data1 125
	.data1 93
	.data1 100
	.data1 117
	.data1 112
	.data1 123
	.data1 98
	.data1 105
	.data1 110
	.data1 100
	.data1 32
	.data1 112
	.data1 111
	.data1 112
	.data1 125
	.data1 102
	.data1 111
	.data1 114
	.data1 97
	.data1 108
	.data1 108
	.data1 32
	.data1 78
	.data1 32
	.data1 47
	.data1 68
	.data1 123
	.data1 47
	.data1 99
	.data1 99
	.data1 32
	.data1 88
	.data1 32
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 116
	.data1 121
	.data1 112
	.data1 101
	.data1 32
	.data1 47
	.data1 115
	.data1 116
	.data1 114
	.data1 105
	.data1 110
	.data1 103
	.data1 116
	.data1 121
	.data1 112
	.data1 101
	.data1 32
	.data1 110
	.data1 101
	.data1 123
	.data1 93
	.data1 10
	.data1 125
	.data1 105
	.data1 102
	.data1 32
	.data1 110
	.data1 110
	.data1 32
	.data1 47
	.data1 98
	.data1 97
	.data1 115
	.data1 101
	.data1 32
	.data1 103
	.data1 101
	.data1 116
	.data1 32
	.data1 99
	.data1 99
	.data1 32
	.data1 99
	.data1 116
	.data1 114
	.data1 32
	.data1 112
	.data1 117
	.data1 116
	.data1 32
	.data1 110
	.data1 110
	.data1 32
	.data1 47
	.data1 66
	.data1 105
	.data1 116
	.data1 77
	.data1 97
	.data1 112
	.data1 115
	.data1 32
	.data1 103
	.data1 101
	.data1 116
	.data1 32
	.data1 83
	.data1 32
	.data1 99
	.data1 116
	.data1 114
	.data1 32
	.data1 83
	.data1 32
	.data1 115
	.data1 102
	.data1 32
	.data1 49
	.data1 32
	.data1 110
	.data1 101
	.data1 123
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 100
	.data1 117
	.data1 112
	.data1 10
	.data1 108
	.data1 101
	.data1 110
	.data1 103
	.data1 116
	.data1 104
	.data1 32
	.data1 49
	.data1 32
	.data1 115
	.data1 117
	.data1 98
	.data1 32
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 50
	.data1 32
	.data1 105
	.data1 110
	.data1 100
	.data1 101
	.data1 120
	.data1 32
	.data1 83
	.data1 32
	.data1 103
	.data1 101
	.data1 116
	.data1 32
	.data1 115
	.data1 102
	.data1 32
	.data1 100
	.data1 105
	.data1 118
	.data1 32
	.data1 112
	.data1 117
	.data1 116
	.data1 125
	.data1 105
	.data1 102
	.data1 32
	.data1 112
	.data1 117
	.data1 116
	.data1 32
	.data1 47
	.data1 99
	.data1 116
	.data1 114
	.data1 32
	.data1 99
	.data1 116
	.data1 114
	.data1 32
	.data1 49
	.data1 32
	.data1 97
	.data1 100
	.data1 100
	.data1 32
	.data1 78
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 73
	.data1 123
	.data1 10
	.data1 99
	.data1 99
	.data1 32
	.data1 49
	.data1 32
	.data1 97
	.data1 100
	.data1 100
	.data1 32
	.data1 68
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 98
	.data1 111
	.data1 112
	.data1 123
	.data1 117
	.data1 115
	.data1 101
	.data1 114
	.data1 100
	.data1 105
	.data1 99
	.data1 116
	.data1 32
	.data1 47
	.data1 98
	.data1 111
	.data1 112
	.data1 45
	.data1 104
	.data1 111
	.data1 111
	.data1 107
	.data1 32
	.data1 107
	.data1 110
	.data1 111
	.data1 119
	.data1 110
	.data1 123
	.data1 98
	.data1 111
	.data1 112
	.data1 45
	.data1 104
	.data1 111
	.data1 111
	.data1 107
	.data1 125
	.data1 105
	.data1 102
	.data1 32
	.data1 47
	.data1 83
	.data1 73
	.data1 32
	.data1 115
	.data1 97
	.data1 118
	.data1 101
	.data1 32
	.data1 78
	.data1 32
	.data1 64
	.data1 114
	.data1 105
	.data1 103
	.data1 105
	.data1 110
	.data1 10
	.data1 48
	.data1 32
	.data1 48
	.data1 32
	.data1 109
	.data1 111
	.data1 118
	.data1 101
	.data1 116
	.data1 111
	.data1 32
	.data1 47
	.data1 86
	.data1 32
	.data1 109
	.data1 97
	.data1 116
	.data1 114
	.data1 105
	.data1 120
	.data1 32
	.data1 99
	.data1 117
	.data1 114
	.data1 114
	.data1 101
	.data1 110
	.data1 116
	.data1 109
	.data1 97
	.data1 116
	.data1 114
	.data1 105
	.data1 120
	.data1 32
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 49
	.data1 32
	.data1 103
	.data1 101
	.data1 116
	.data1 32
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 109
	.data1 117
	.data1 108
	.data1 32
	.data1 101
	.data1 120
	.data1 99
	.data1 104
	.data1 32
	.data1 48
	.data1 32
	.data1 103
	.data1 101
	.data1 116
	.data1 32
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 109
	.data1 117
	.data1 108
	.data1 10
	.data1 97
	.data1 100
	.data1 100
	.data1 32
	.data1 46
	.data1 57
	.data1 57
	.data1 32
	.data1 108
	.data1 116
	.data1 123
	.data1 47
	.data1 81
	.data1 86
	.data1 125
	.data1 123
	.data1 47
	.data1 82
	.data1 86
	.data1 125
	.data1 105
	.data1 102
	.data1 101
	.data1 108
	.data1 115
	.data1 101
	.data1 32
	.data1 108
	.data1 111
	.data1 97
	.data1 100
	.data1 32
	.data1 100
	.data1 101
	.data1 102
	.data1 32
	.data1 112
	.data1 111
	.data1 112
	.data1 32
	.data1 112
	.data1 111
	.data1 112
	.data1 125
	.data1 78
	.data1 32
	.data1 47
	.data1 101
	.data1 111
	.data1 112
	.data1 123
	.data1 83
	.data1 73
	.data1 32
	.data1 114
	.data1 101
	.data1 115
	.data1 116
	.data1 111
	.data1 114
	.data1 101
	.data1 32
	.data1 117
	.data1 115
	.data1 101
	.data1 114
	.data1 100
	.data1 105
	.data1 99
	.data1 116
	.data1 10
	.data1 47
	.data1 101
	.data1 111
	.data1 112
	.data1 45
	.data1 104
	.data1 111
	.data1 111
	.data1 107
	.data1 32
	.data1 107
	.data1 110
	.data1 111
	.data1 119
	.data1 110
	.data1 123
	.data1 101
	.data1 111
	.data1 112
	.data1 45
	.data1 104
	.data1 111
	.data1 111
	.data1 107
	.data1 125
	.data1 105
	.data1 102
	.data1 32
	.data1 115
	.data1 104
	.data1 111
	.data1 119
	.data1 112
	.data1 97
	.data1 103
	.data1 101
	.data1 125
	.data1 78
	.data1 32
	.data1 47
	.data1 64
	.data1 115
	.data1 116
	.data1 97
	.data1 114
	.data1 116
	.data1 123
	.data1 117
	.data1 115
	.data1 101
	.data1 114
	.data1 100
	.data1 105
	.data1 99
	.data1 116
	.data1 32
	.data1 47
	.data1 115
	.data1 116
	.data1 97
	.data1 114
	.data1 116
	.data1 45
	.data1 104
	.data1 111
	.data1 111
	.data1 107
	.data1 10
	.data1 107
	.data1 110
	.data1 111
	.data1 119
	.data1 110
	.data1 123
	.data1 115
	.data1 116
	.data1 97
	.data1 114
	.data1 116
	.data1 45
	.data1 104
	.data1 111
	.data1 111
	.data1 107
	.data1 125
	.data1 105
	.data1 102
	.data1 32
	.data1 112
	.data1 111
	.data1 112
	.data1 32
	.data1 47
	.data1 86
	.data1 82
	.data1 101
	.data1 115
	.data1 111
	.data1 108
	.data1 117
	.data1 116
	.data1 105
	.data1 111
	.data1 110
	.data1 32
	.data1 88
	.data1 32
	.data1 47
	.data1 82
	.data1 101
	.data1 115
	.data1 111
	.data1 108
	.data1 117
	.data1 116
	.data1 105
	.data1 111
	.data1 110
	.data1 32
	.data1 88
	.data1 32
	.data1 49
	.data1 48
	.data1 48
	.data1 48
	.data1 32
	.data1 100
	.data1 105
	.data1 118
	.data1 32
	.data1 47
	.data1 68
	.data1 86
	.data1 73
	.data1 109
	.data1 97
	.data1 103
	.data1 32
	.data1 88
	.data1 10
	.data1 47
	.data1 73
	.data1 69
	.data1 32
	.data1 50
	.data1 53
	.data1 54
	.data1 32
	.data1 97
	.data1 114
	.data1 114
	.data1 97
	.data1 121
	.data1 32
	.data1 78
	.data1 32
	.data1 48
	.data1 32
	.data1 49
	.data1 32
	.data1 50
	.data1 53
	.data1 53
	.data1 123
	.data1 73
	.data1 69
	.data1 32
	.data1 83
	.data1 32
	.data1 49
	.data1 32
	.data1 115
	.data1 116
	.data1 114
	.data1 105
	.data1 110
	.data1 103
	.data1 32
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 48
	.data1 32
	.data1 51
	.data1 32
	.data1 105
	.data1 110
	.data1 100
	.data1 101
	.data1 120
	.data1 32
	.data1 112
	.data1 117
	.data1 116
	.data1 32
	.data1 99
	.data1 118
	.data1 110
	.data1 32
	.data1 112
	.data1 117
	.data1 116
	.data1 125
	.data1 102
	.data1 111
	.data1 114
	.data1 10
	.data1 54
	.data1 53
	.data1 55
	.data1 56
	.data1 49
	.data1 46
	.data1 55
	.data1 54
	.data1 32
	.data1 100
	.data1 105
	.data1 118
	.data1 32
	.data1 47
	.data1 118
	.data1 115
	.data1 105
	.data1 122
	.data1 101
	.data1 32
	.data1 88
	.data1 32
	.data1 54
	.data1 53
	.data1 55
	.data1 56
	.data1 49
	.data1 46
	.data1 55
	.data1 54
	.data1 32
	.data1 100
	.data1 105
	.data1 118
	.data1 32
	.data1 47
	.data1 104
	.data1 115
	.data1 105
	.data1 122
	.data1 101
	.data1 32
	.data1 88
	.data1 125
	.data1 78
	.data1 32
	.data1 47
	.data1 112
	.data1 123
	.data1 115
	.data1 104
	.data1 111
	.data1 119
	.data1 125
	.data1 78
	.data1 32
	.data1 47
	.data1 82
	.data1 77
	.data1 97
	.data1 116
	.data1 91
	.data1 49
	.data1 32
	.data1 48
	.data1 32
	.data1 48
	.data1 32
	.data1 45
	.data1 49
	.data1 32
	.data1 48
	.data1 10
	.data1 48
	.data1 93
	.data1 78
	.data1 32
	.data1 47
	.data1 66
	.data1 68
	.data1 111
	.data1 116
	.data1 32
	.data1 50
	.data1 54
	.data1 48
	.data1 32
	.data1 115
	.data1 116
	.data1 114
	.data1 105
	.data1 110
	.data1 103
	.data1 32
	.data1 78
	.data1 32
	.data1 47
	.data1 114
	.data1 117
	.data1 108
	.data1 101
	.data1 120
	.data1 32
	.data1 48
	.data1 32
	.data1 78
	.data1 32
	.data1 47
	.data1 114
	.data1 117
	.data1 108
	.data1 101
	.data1 121
	.data1 32
	.data1 48
	.data1 32
	.data1 78
	.data1 32
	.data1 47
	.data1 118
	.data1 123
	.data1 47
	.data1 114
	.data1 117
	.data1 108
	.data1 101
	.data1 121
	.data1 32
	.data1 88
	.data1 32
	.data1 47
	.data1 114
	.data1 117
	.data1 108
	.data1 101
	.data1 120
	.data1 32
	.data1 88
	.data1 32
	.data1 86
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 86
	.data1 10
	.data1 123
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 82
	.data1 86
	.data1 32
	.data1 115
	.data1 116
	.data1 97
	.data1 116
	.data1 117
	.data1 115
	.data1 100
	.data1 105
	.data1 99
	.data1 116
	.data1 32
	.data1 98
	.data1 101
	.data1 103
	.data1 105
	.data1 110
	.data1 32
	.data1 47
	.data1 112
	.data1 114
	.data1 111
	.data1 100
	.data1 117
	.data1 99
	.data1 116
	.data1 32
	.data1 119
	.data1 104
	.data1 101
	.data1 114
	.data1 101
	.data1 123
	.data1 112
	.data1 111
	.data1 112
	.data1 32
	.data1 112
	.data1 114
	.data1 111
	.data1 100
	.data1 117
	.data1 99
	.data1 116
	.data1 32
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 108
	.data1 101
	.data1 110
	.data1 103
	.data1 116
	.data1 104
	.data1 32
	.data1 55
	.data1 32
	.data1 103
	.data1 101
	.data1 123
	.data1 48
	.data1 32
	.data1 55
	.data1 10
	.data1 103
	.data1 101
	.data1 116
	.data1 105
	.data1 110
	.data1 116
	.data1 101
	.data1 114
	.data1 118
	.data1 97
	.data1 108
	.data1 32
	.data1 100
	.data1 117
	.data1 112
	.data1 40
	.data1 68
	.data1 105
	.data1 115
	.data1 112
	.data1 108
	.data1 97
	.data1 121
	.data1 41
	.data1 101
	.data1 113
	.data1 32
	.data1 101
	.data1 120
	.data1 99
	.data1 104
	.data1 32
	.data1 48
	.data1 32
	.data1 52
	.data1 32
	.data1 103
	.data1 101
	.data1 116
	.data1 105
	.data1 110
	.data1 116
	.data1 101
	.data1 114
	.data1 118
	.data1 97
	.data1 108
	.data1 40
	.data1 78
	.data1 101
	.data1 88
	.data1 84
	.data1 41
	.data1 101
	.data1 113
	.data1 32
	.data1 111
	.data1 114
	.data1 125
	.data1 123
	.data1 112
	.data1 111
	.data1 112
	.data1 32
	.data1 102
	.data1 97
	.data1 108
	.data1 115
	.data1 101
	.data1 125
	.data1 10
	.data1 105
	.data1 102
	.data1 101
	.data1 108
	.data1 115
	.data1 101
	.data1 125
	.data1 123
	.data1 102
	.data1 97
	.data1 108
	.data1 115
	.data1 101
	.data1 125
	.data1 105
	.data1 102
	.data1 101
	.data1 108
	.data1 115
	.data1 101
	.data1 32
	.data1 101
	.data1 110
	.data1 100
	.data1 123
	.data1 123
	.data1 103
	.data1 115
	.data1 97
	.data1 118
	.data1 101
	.data1 32
	.data1 84
	.data1 82
	.data1 32
	.data1 45
	.data1 46
	.data1 49
	.data1 32
	.data1 46
	.data1 49
	.data1 32
	.data1 84
	.data1 82
	.data1 32
	.data1 49
	.data1 32
	.data1 49
	.data1 32
	.data1 115
	.data1 99
	.data1 97
	.data1 108
	.data1 101
	.data1 32
	.data1 114
	.data1 117
	.data1 108
	.data1 101
	.data1 120
	.data1 32
	.data1 114
	.data1 117
	.data1 108
	.data1 101
	.data1 121
	.data1 32
	.data1 102
	.data1 97
	.data1 108
	.data1 115
	.data1 101
	.data1 10
	.data1 82
	.data1 77
	.data1 97
	.data1 116
	.data1 123
	.data1 66
	.data1 68
	.data1 111
	.data1 116
	.data1 125
	.data1 105
	.data1 109
	.data1 97
	.data1 103
	.data1 101
	.data1 109
	.data1 97
	.data1 115
	.data1 107
	.data1 32
	.data1 103
	.data1 114
	.data1 101
	.data1 115
	.data1 116
	.data1 111
	.data1 114
	.data1 101
	.data1 125
	.data1 125
	.data1 123
	.data1 123
	.data1 103
	.data1 115
	.data1 97
	.data1 118
	.data1 101
	.data1 32
	.data1 84
	.data1 82
	.data1 32
	.data1 45
	.data1 46
	.data1 49
	.data1 32
	.data1 46
	.data1 49
	.data1 32
	.data1 84
	.data1 82
	.data1 32
	.data1 114
	.data1 117
	.data1 108
	.data1 101
	.data1 120
	.data1 32
	.data1 114
	.data1 117
	.data1 108
	.data1 101
	.data1 121
	.data1 32
	.data1 115
	.data1 99
	.data1 97
	.data1 108
	.data1 101
	.data1 32
	.data1 49
	.data1 32
	.data1 49
	.data1 10
	.data1 102
	.data1 97
	.data1 108
	.data1 115
	.data1 101
	.data1 32
	.data1 82
	.data1 77
	.data1 97
	.data1 116
	.data1 123
	.data1 66
	.data1 68
	.data1 111
	.data1 116
	.data1 125
	.data1 105
	.data1 109
	.data1 97
	.data1 103
	.data1 101
	.data1 109
	.data1 97
	.data1 115
	.data1 107
	.data1 32
	.data1 103
	.data1 114
	.data1 101
	.data1 115
	.data1 116
	.data1 111
	.data1 114
	.data1 101
	.data1 125
	.data1 125
	.data1 105
	.data1 102
	.data1 101
	.data1 108
	.data1 115
	.data1 101
	.data1 32
	.data1 66
	.data1 32
	.data1 47
	.data1 81
	.data1 86
	.data1 123
	.data1 103
	.data1 115
	.data1 97
	.data1 118
	.data1 101
	.data1 32
	.data1 110
	.data1 101
	.data1 119
	.data1 112
	.data1 97
	.data1 116
	.data1 104
	.data1 32
	.data1 116
	.data1 114
	.data1 97
	.data1 110
	.data1 115
	.data1 102
	.data1 111
	.data1 114
	.data1 109
	.data1 10
	.data1 114
	.data1 111
	.data1 117
	.data1 110
	.data1 100
	.data1 32
	.data1 101
	.data1 120
	.data1 99
	.data1 104
	.data1 32
	.data1 114
	.data1 111
	.data1 117
	.data1 110
	.data1 100
	.data1 32
	.data1 101
	.data1 120
	.data1 99
	.data1 104
	.data1 32
	.data1 105
	.data1 116
	.data1 114
	.data1 97
	.data1 110
	.data1 115
	.data1 102
	.data1 111
	.data1 114
	.data1 109
	.data1 32
	.data1 109
	.data1 111
	.data1 118
	.data1 101
	.data1 116
	.data1 111
	.data1 32
	.data1 114
	.data1 117
	.data1 108
	.data1 101
	.data1 120
	.data1 32
	.data1 48
	.data1 32
	.data1 114
	.data1 108
	.data1 105
	.data1 110
	.data1 101
	.data1 116
	.data1 111
	.data1 32
	.data1 48
	.data1 32
	.data1 114
	.data1 117
	.data1 108
	.data1 101
	.data1 121
	.data1 32
	.data1 110
	.data1 101
	.data1 103
	.data1 10
	.data1 114
	.data1 108
	.data1 105
	.data1 110
	.data1 101
	.data1 116
	.data1 111
	.data1 32
	.data1 114
	.data1 117
	.data1 108
	.data1 101
	.data1 120
	.data1 32
	.data1 110
	.data1 101
	.data1 103
	.data1 32
	.data1 48
	.data1 32
	.data1 114
	.data1 108
	.data1 105
	.data1 110
	.data1 101
	.data1 116
	.data1 111
	.data1 32
	.data1 102
	.data1 105
	.data1 108
	.data1 108
	.data1 32
	.data1 103
	.data1 114
	.data1 101
	.data1 115
	.data1 116
	.data1 111
	.data1 114
	.data1 101
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 97
	.data1 123
	.data1 109
	.data1 111
	.data1 118
	.data1 101
	.data1 116
	.data1 111
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 100
	.data1 101
	.data1 108
	.data1 116
	.data1 97
	.data1 32
	.data1 48
	.data1 32
	.data1 78
	.data1 32
	.data1 47
	.data1 116
	.data1 97
	.data1 105
	.data1 108
	.data1 10
	.data1 123
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 47
	.data1 100
	.data1 101
	.data1 108
	.data1 116
	.data1 97
	.data1 32
	.data1 88
	.data1 32
	.data1 48
	.data1 32
	.data1 114
	.data1 109
	.data1 111
	.data1 118
	.data1 101
	.data1 116
	.data1 111
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 77
	.data1 123
	.data1 83
	.data1 32
	.data1 112
	.data1 32
	.data1 100
	.data1 101
	.data1 108
	.data1 116
	.data1 97
	.data1 32
	.data1 97
	.data1 100
	.data1 100
	.data1 32
	.data1 116
	.data1 97
	.data1 105
	.data1 108
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 98
	.data1 123
	.data1 83
	.data1 32
	.data1 112
	.data1 32
	.data1 116
	.data1 97
	.data1 105
	.data1 108
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 99
	.data1 123
	.data1 45
	.data1 52
	.data1 32
	.data1 77
	.data1 125
	.data1 10
	.data1 66
	.data1 32
	.data1 47
	.data1 100
	.data1 123
	.data1 45
	.data1 51
	.data1 32
	.data1 77
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 101
	.data1 123
	.data1 45
	.data1 50
	.data1 32
	.data1 77
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 102
	.data1 123
	.data1 45
	.data1 49
	.data1 32
	.data1 77
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 103
	.data1 123
	.data1 48
	.data1 32
	.data1 77
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 104
	.data1 123
	.data1 49
	.data1 32
	.data1 77
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 105
	.data1 123
	.data1 50
	.data1 32
	.data1 77
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 106
	.data1 123
	.data1 51
	.data1 32
	.data1 77
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 107
	.data1 123
	.data1 10
	.data1 52
	.data1 32
	.data1 77
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 119
	.data1 123
	.data1 48
	.data1 32
	.data1 114
	.data1 109
	.data1 111
	.data1 118
	.data1 101
	.data1 116
	.data1 111
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 108
	.data1 123
	.data1 112
	.data1 32
	.data1 45
	.data1 52
	.data1 32
	.data1 119
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 109
	.data1 123
	.data1 112
	.data1 32
	.data1 45
	.data1 51
	.data1 32
	.data1 119
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 110
	.data1 123
	.data1 112
	.data1 32
	.data1 45
	.data1 50
	.data1 32
	.data1 119
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 111
	.data1 123
	.data1 112
	.data1 32
	.data1 45
	.data1 49
	.data1 32
	.data1 119
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 113
	.data1 123
	.data1 10
	.data1 112
	.data1 32
	.data1 49
	.data1 32
	.data1 119
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 114
	.data1 123
	.data1 112
	.data1 32
	.data1 50
	.data1 32
	.data1 119
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 115
	.data1 123
	.data1 112
	.data1 32
	.data1 51
	.data1 32
	.data1 119
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 116
	.data1 123
	.data1 112
	.data1 32
	.data1 52
	.data1 32
	.data1 119
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 120
	.data1 123
	.data1 48
	.data1 32
	.data1 83
	.data1 32
	.data1 114
	.data1 109
	.data1 111
	.data1 118
	.data1 101
	.data1 116
	.data1 111
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 121
	.data1 123
	.data1 51
	.data1 32
	.data1 50
	.data1 32
	.data1 114
	.data1 111
	.data1 108
	.data1 108
	.data1 32
	.data1 112
	.data1 10
	.data1 97
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 98
	.data1 111
	.data1 115
	.data1 123
	.data1 47
	.data1 83
	.data1 83
	.data1 32
	.data1 115
	.data1 97
	.data1 118
	.data1 101
	.data1 32
	.data1 78
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 101
	.data1 111
	.data1 115
	.data1 123
	.data1 83
	.data1 83
	.data1 32
	.data1 114
	.data1 101
	.data1 115
	.data1 116
	.data1 111
	.data1 114
	.data1 101
	.data1 125
	.data1 66
	.data1 32
	.data1 101
	.data1 110
	.data1 100
	.data1 10
	.data1 37
	.data1 37
	.data1 69
	.data1 110
	.data1 100
	.data1 80
	.data1 114
	.data1 111
	.data1 99
	.data1 83
	.data1 101
	.data1 116
	.data1 10
	.data1 37
	.data1 37
	.data1 66
	.data1 101
	.data1 103
	.data1 105
	.data1 110
	.data1 80
	.data1 114
	.data1 111
	.data1 99
	.data1 83
	.data1 101
	.data1 116
	.data1 58
	.data1 32
	.data1 116
	.data1 101
	.data1 120
	.data1 112
	.data1 115
	.data1 46
	.data1 112
	.data1 114
	.data1 111
	.data1 10
	.data1 84
	.data1 101
	.data1 88
	.data1 68
	.data1 105
	.data1 99
	.data1 116
	.data1 32
	.data1 98
	.data1 101
	.data1 103
	.data1 105
	.data1 110
	.data1 32
	.data1 47
	.data1 114
	.data1 102
	.data1 123
	.data1 102
	.data1 105
	.data1 110
	.data1 100
	.data1 102
	.data1 111
	.data1 110
	.data1 116
	.data1 32
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 108
	.data1 101
	.data1 110
	.data1 103
	.data1 116
	.data1 104
	.data1 32
	.data1 49
	.data1 32
	.data1 97
	.data1 100
	.data1 100
	.data1 32
	.data1 100
	.data1 105
	.data1 99
	.data1 116
	.data1 32
	.data1 98
	.data1 101
	.data1 103
	.data1 105
	.data1 110
	.data1 123
	.data1 49
	.data1 32
	.data1 105
	.data1 110
	.data1 100
	.data1 101
	.data1 120
	.data1 32
	.data1 47
	.data1 70
	.data1 73
	.data1 68
	.data1 32
	.data1 110
	.data1 101
	.data1 32
	.data1 50
	.data1 10
	.data1 105
	.data1 110
	.data1 100
	.data1 101
	.data1 120
	.data1 32
	.data1 47
	.data1 85
	.data1 110
	.data1 105
	.data1 113
	.data1 117
	.data1 101
	.data1 73
	.data1 68
	.data1 32
	.data1 110
	.data1 101
	.data1 32
	.data1 97
	.data1 110
	.data1 100
	.data1 123
	.data1 100
	.data1 101
	.data1 102
	.data1 125
	.data1 123
	.data1 112
	.data1 111
	.data1 112
	.data1 32
	.data1 112
	.data1 111
	.data1 112
	.data1 125
	.data1 105
	.data1 102
	.data1 101
	.data1 108
	.data1 115
	.data1 101
	.data1 125
	.data1 102
	.data1 111
	.data1 114
	.data1 97
	.data1 108
	.data1 108
	.data1 91
	.data1 49
	.data1 32
	.data1 105
	.data1 110
	.data1 100
	.data1 101
	.data1 120
	.data1 32
	.data1 48
	.data1 32
	.data1 54
	.data1 32
	.data1 45
	.data1 49
	.data1 32
	.data1 114
	.data1 111
	.data1 108
	.data1 108
	.data1 10
	.data1 101
	.data1 120
	.data1 101
	.data1 99
	.data1 32
	.data1 48
	.data1 32
	.data1 101
	.data1 120
	.data1 99
	.data1 104
	.data1 32
	.data1 53
	.data1 32
	.data1 45
	.data1 49
	.data1 32
	.data1 114
	.data1 111
	.data1 108
	.data1 108
	.data1 32
	.data1 86
	.data1 82
	.data1 101
	.data1 115
	.data1 111
	.data1 108
	.data1 117
	.data1 116
	.data1 105
	.data1 111
	.data1 110
	.data1 32
	.data1 82
	.data1 101
	.data1 115
	.data1 111
	.data1 108
	.data1 117
	.data1 116
	.data1 105
	.data1 111
	.data1 110
	.data1 32
	.data1 100
	.data1 105
	.data1 118
	.data1 32
	.data1 109
	.data1 117
	.data1 108
	.data1 32
	.data1 110
	.data1 101
	.data1 103
	.data1 32
	.data1 48
	.data1 32
	.data1 48
	.data1 93
	.data1 47
	.data1 77
	.data1 101
	.data1 116
	.data1 114
	.data1 105
	.data1 99
	.data1 115
	.data1 10
	.data1 101
	.data1 120
	.data1 99
	.data1 104
	.data1 32
	.data1 100
	.data1 101
	.data1 102
	.data1 32
	.data1 100
	.data1 105
	.data1 99
	.data1 116
	.data1 32
	.data1 98
	.data1 101
	.data1 103
	.data1 105
	.data1 110
	.data1 32
	.data1 69
	.data1 110
	.data1 99
	.data1 111
	.data1 100
	.data1 105
	.data1 110
	.data1 103
	.data1 123
	.data1 101
	.data1 120
	.data1 99
	.data1 104
	.data1 32
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 116
	.data1 121
	.data1 112
	.data1 101
	.data1 32
	.data1 47
	.data1 105
	.data1 110
	.data1 116
	.data1 101
	.data1 103
	.data1 101
	.data1 114
	.data1 116
	.data1 121
	.data1 112
	.data1 101
	.data1 32
	.data1 110
	.data1 101
	.data1 123
	.data1 112
	.data1 111
	.data1 112
	.data1 32
	.data1 112
	.data1 111
	.data1 112
	.data1 32
	.data1 49
	.data1 32
	.data1 115
	.data1 117
	.data1 98
	.data1 10
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 48
	.data1 32
	.data1 108
	.data1 101
	.data1 123
	.data1 112
	.data1 111
	.data1 112
	.data1 125
	.data1 123
	.data1 91
	.data1 125
	.data1 105
	.data1 102
	.data1 101
	.data1 108
	.data1 115
	.data1 101
	.data1 125
	.data1 123
	.data1 70
	.data1 111
	.data1 110
	.data1 116
	.data1 77
	.data1 97
	.data1 116
	.data1 114
	.data1 105
	.data1 120
	.data1 32
	.data1 48
	.data1 32
	.data1 103
	.data1 101
	.data1 116
	.data1 32
	.data1 100
	.data1 105
	.data1 118
	.data1 32
	.data1 77
	.data1 101
	.data1 116
	.data1 114
	.data1 105
	.data1 99
	.data1 115
	.data1 32
	.data1 48
	.data1 32
	.data1 103
	.data1 101
	.data1 116
	.data1 32
	.data1 100
	.data1 105
	.data1 118
	.data1 32
	.data1 100
	.data1 101
	.data1 102
	.data1 125
	.data1 10
	.data1 105
	.data1 102
	.data1 101
	.data1 108
	.data1 115
	.data1 101
	.data1 125
	.data1 102
	.data1 111
	.data1 114
	.data1 97
	.data1 108
	.data1 108
	.data1 32
	.data1 77
	.data1 101
	.data1 116
	.data1 114
	.data1 105
	.data1 99
	.data1 115
	.data1 32
	.data1 47
	.data1 77
	.data1 101
	.data1 116
	.data1 114
	.data1 105
	.data1 99
	.data1 115
	.data1 32
	.data1 99
	.data1 117
	.data1 114
	.data1 114
	.data1 101
	.data1 110
	.data1 116
	.data1 100
	.data1 105
	.data1 99
	.data1 116
	.data1 32
	.data1 101
	.data1 110
	.data1 100
	.data1 32
	.data1 100
	.data1 101
	.data1 102
	.data1 91
	.data1 50
	.data1 32
	.data1 105
	.data1 110
	.data1 100
	.data1 101
	.data1 120
	.data1 32
	.data1 99
	.data1 117
	.data1 114
	.data1 114
	.data1 101
	.data1 110
	.data1 116
	.data1 100
	.data1 105
	.data1 99
	.data1 116
	.data1 10
	.data1 101
	.data1 110
	.data1 100
	.data1 32
	.data1 100
	.data1 101
	.data1 102
	.data1 105
	.data1 110
	.data1 101
	.data1 102
	.data1 111
	.data1 110
	.data1 116
	.data1 32
	.data1 51
	.data1 32
	.data1 45
	.data1 49
	.data1 32
	.data1 114
	.data1 111
	.data1 108
	.data1 108
	.data1 32
	.data1 109
	.data1 97
	.data1 107
	.data1 101
	.data1 102
	.data1 111
	.data1 110
	.data1 116
	.data1 32
	.data1 47
	.data1 115
	.data1 101
	.data1 116
	.data1 102
	.data1 111
	.data1 110
	.data1 116
	.data1 32
	.data1 108
	.data1 111
	.data1 97
	.data1 100
	.data1 93
	.data1 99
	.data1 118
	.data1 120
	.data1 32
	.data1 100
	.data1 101
	.data1 102
	.data1 125
	.data1 100
	.data1 101
	.data1 102
	.data1 10
	.data1 47
	.data1 79
	.data1 98
	.data1 108
	.data1 105
	.data1 113
	.data1 117
	.data1 101
	.data1 83
	.data1 108
	.data1 97
	.data1 110
	.data1 116
	.data1 123
	.data1 100
	.data1 117
	.data1 112
	.data1 32
	.data1 115
	.data1 105
	.data1 110
	.data1 32
	.data1 83
	.data1 32
	.data1 99
	.data1 111
	.data1 115
	.data1 32
	.data1 100
	.data1 105
	.data1 118
	.data1 32
	.data1 110
	.data1 101
	.data1 103
	.data1 125
	.data1 66
	.data1 32
	.data1 47
	.data1 83
	.data1 108
	.data1 97
	.data1 110
	.data1 116
	.data1 70
	.data1 111
	.data1 110
	.data1 116
	.data1 123
	.data1 52
	.data1 32
	.data1 105
	.data1 110
	.data1 100
	.data1 101
	.data1 120
	.data1 32
	.data1 109
	.data1 117
	.data1 108
	.data1 32
	.data1 97
	.data1 100
	.data1 100
	.data1 125
	.data1 100
	.data1 101
	.data1 102
	.data1 10
	.data1 47
	.data1 69
	.data1 120
	.data1 116
	.data1 101
	.data1 110
	.data1 100
	.data1 70
	.data1 111
	.data1 110
	.data1 116
	.data1 123
	.data1 51
	.data1 32
	.data1 45
	.data1 49
	.data1 32
	.data1 114
	.data1 111
	.data1 108
	.data1 108
	.data1 32
	.data1 109
	.data1 117
	.data1 108
	.data1 32
	.data1 101
	.data1 120
	.data1 99
	.data1 104
	.data1 125
	.data1 100
	.data1 101
	.data1 102
	.data1 32
	.data1 47
	.data1 82
	.data1 101
	.data1 69
	.data1 110
	.data1 99
	.data1 111
	.data1 100
	.data1 101
	.data1 70
	.data1 111
	.data1 110
	.data1 116
	.data1 123
	.data1 47
	.data1 69
	.data1 110
	.data1 99
	.data1 111
	.data1 100
	.data1 105
	.data1 110
	.data1 103
	.data1 32
	.data1 101
	.data1 120
	.data1 99
	.data1 104
	.data1 32
	.data1 100
	.data1 101
	.data1 102
	.data1 125
	.data1 100
	.data1 101
	.data1 102
	.data1 10
	.data1 101
	.data1 110
	.data1 100
	.data1 10
	.data1 37
	.data1 37
	.data1 69
	.data1 110
	.data1 100
	.data1 80
	.data1 114
	.data1 111
	.data1 99
	.data1 83
	.data1 101
	.data1 116
	.data1 10
	.data1 84
	.data1 101
	.data1 88
	.data1 68
	.data1 105
	.data1 99
	.data1 116
	.data1 32
	.data1 98
	.data1 101
	.data1 103
	.data1 105
	.data1 110
	.data1 32
	.data1 52
	.data1 48
	.data1 50
	.data1 53
	.data1 56
	.data1 52
	.data1 51
	.data1 49
	.data1 32
	.data1 53
	.data1 50
	.data1 48
	.data1 57
	.data1 57
	.data1 49
	.data1 52
	.data1 54
	.data1 32
	.data1 49
	.data1 48
	.data1 48
	.data1 48
	.data1 32
	.data1 51
	.data1 48
	.data1 48
	.data1 32
	.data1 51
	.data1 48
	.data1 48
	.data1 32
	.data1 40
	.data1 115
	.data1 101
	.data1 115
	.data1 116
	.data1 101
	.data1 109
	.data1 112
	.data1 108
	.data1 97
	.data1 116
	.data1 101
	.data1 46
	.data1 100
	.data1 118
	.data1 105
	.data1 41
	.data1 10
	.data1 64
	.data1 115
	.data1 116
	.data1 97
	.data1 114
	.data1 116
	.data1 32
	.data1 47
	.data1 70
	.data1 97
	.data1 32
	.data1 49
	.data1 51
	.data1 57
	.data1 91
	.data1 57
	.data1 32
	.data1 49
	.data1 51
	.data1 32
	.data1 51
	.data1 91
	.data1 49
	.data1 55
	.data1 32
	.data1 49
	.data1 55
	.data1 32
	.data1 52
	.data1 91
	.data1 57
	.data1 32
	.data1 49
	.data1 55
	.data1 32
	.data1 49
	.data1 91
	.data1 49
	.data1 49
	.data1 32
	.data1 49
	.data1 53
	.data1 32
	.data1 51
	.data1 91
	.data1 49
	.data1 53
	.data1 32
	.data1 49
	.data1 50
	.data1 91
	.data1 50
	.data1 48
	.data1 10
	.data1 51
	.data1 55
	.data1 91
	.data1 56
	.data1 32
	.data1 52
	.data1 54
	.data1 91
	.data1 123
	.data1 125
	.data1 49
	.data1 49
	.data1 32
	.data1 51
	.data1 51
	.data1 46
	.data1 51
	.data1 51
	.data1 51
	.data1 51
	.data1 51
	.data1 52
	.data1 32
	.data1 47
	.data1 84
	.data1 105
	.data1 109
	.data1 101
	.data1 115
	.data1 45
	.data1 82
	.data1 111
	.data1 109
	.data1 97
	.data1 110
	.data1 32
	.data1 114
	.data1 102
	.data1 32
	.data1 47
	.data1 70
	.data1 98
	.data1 32
	.data1 49
	.data1 32
	.data1 53
	.data1 48
	.data1 32
	.data1 100
	.data1 102
	.data1 60
	.data1 49
	.data1 50
	.data1 49
	.data1 56
	.data1 49
	.data1 50
	.data1 55
	.data1 56
	.data1 49
	.data1 50
	.data1 57
	.data1 56
	.data1 49
	.data1 50
	.data1 49
	.data1 56
	.data1 65
	.data1 67
	.data1 49
	.data1 50
	.data1 10
	.data1 70
	.data1 70
	.data1 48
	.data1 56
	.data1 49
	.data1 48
	.data1 55
	.data1 68
	.data1 56
	.data1 70
	.data1 48
	.data1 70
	.data1 62
	.data1 52
	.data1 57
	.data1 32
	.data1 68
	.data1 32
	.data1 69
	.data1 32
	.data1 47
	.data1 70
	.data1 99
	.data1 32
	.data1 49
	.data1 32
	.data1 49
	.data1 54
	.data1 32
	.data1 100
	.data1 102
	.data1 60
	.data1 69
	.data1 65
	.data1 48
	.data1 51
	.data1 67
	.data1 48
	.data1 69
	.data1 65
	.data1 48
	.data1 70
	.data1 70
	.data1 48
	.data1 69
	.data1 65
	.data1 49
	.data1 70
	.data1 70
	.data1 56
	.data1 69
	.data1 65
	.data1 51
	.data1 70
	.data1 70
	.data1 67
	.data1 69
	.data1 65
	.data1 55
	.data1 70
	.data1 70
	.data1 69
	.data1 65
	.data1 50
	.data1 66
	.data1 53
	.data1 70
	.data1 67
	.data1 65
	.data1 52
	.data1 69
	.data1 65
	.data1 10
	.data1 55
	.data1 70
	.data1 70
	.data1 69
	.data1 65
	.data1 50
	.data1 69
	.data1 65
	.data1 51
	.data1 70
	.data1 70
	.data1 67
	.data1 69
	.data1 65
	.data1 49
	.data1 70
	.data1 70
	.data1 56
	.data1 69
	.data1 65
	.data1 48
	.data1 70
	.data1 70
	.data1 48
	.data1 69
	.data1 65
	.data1 48
	.data1 51
	.data1 67
	.data1 48
	.data1 49
	.data1 48
	.data1 49
	.data1 48
	.data1 55
	.data1 69
	.data1 57
	.data1 49
	.data1 49
	.data1 53
	.data1 62
	.data1 49
	.data1 53
	.data1 32
	.data1 68
	.data1 32
	.data1 69
	.data1 32
	.data1 47
	.data1 70
	.data1 100
	.data1 32
	.data1 49
	.data1 10
	.data1 53
	.data1 48
	.data1 32
	.data1 100
	.data1 102
	.data1 60
	.data1 49
	.data1 50
	.data1 48
	.data1 67
	.data1 49
	.data1 50
	.data1 49
	.data1 67
	.data1 49
	.data1 50
	.data1 69
	.data1 67
	.data1 49
	.data1 50
	.data1 48
	.data1 67
	.data1 65
	.data1 70
	.data1 69
	.data1 65
	.data1 70
	.data1 70
	.data1 67
	.data1 48
	.data1 48
	.data1 65
	.data1 49
	.data1 51
	.data1 55
	.data1 68
	.data1 57
	.data1 50
	.data1 49
	.data1 49
	.data1 62
	.data1 52
	.data1 57
	.data1 32
	.data1 68
	.data1 32
	.data1 69
	.data1 32
	.data1 47
	.data1 70
	.data1 101
	.data1 32
	.data1 56
	.data1 49
	.data1 91
	.data1 50
	.data1 51
	.data1 10
	.data1 53
	.data1 50
	.data1 91
	.data1 50
	.data1 49
	.data1 32
	.data1 49
	.data1 91
	.data1 51
	.data1 48
	.data1 32
	.data1 50
	.data1 49
	.data1 32
	.data1 50
	.data1 49
	.data1 32
	.data1 49
	.data1 50
	.data1 32
	.data1 49
	.data1 54
	.data1 32
	.data1 49
	.data1 52
	.data1 32
	.data1 50
	.data1 49
	.data1 32
	.data1 50
	.data1 49
	.data1 32
	.data1 50
	.data1 49
	.data1 32
	.data1 50
	.data1 49
	.data1 32
	.data1 51
	.data1 50
	.data1 32
	.data1 49
	.data1 50
	.data1 32
	.data1 50
	.data1 49
	.data1 32
	.data1 49
	.data1 91
	.data1 49
	.data1 50
	.data1 32
	.data1 50
	.data1 49
	.data1 10
	.data1 50
	.data1 49
	.data1 32
	.data1 49
	.data1 52
	.data1 32
	.data1 49
	.data1 56
	.data1 32
	.data1 50
	.data1 49
	.data1 32
	.data1 49
	.data1 56
	.data1 32
	.data1 50
	.data1 49
	.data1 32
	.data1 49
	.data1 56
	.data1 32
	.data1 51
	.data1 91
	.data1 49
	.data1 52
	.data1 32
	.data1 49
	.data1 91
	.data1 49
	.data1 52
	.data1 32
	.data1 54
	.data1 91
	.data1 50
	.data1 53
	.data1 32
	.data1 49
	.data1 91
	.data1 50
	.data1 56
	.data1 32
	.data1 56
	.data1 91
	.data1 49
	.data1 52
	.data1 32
	.data1 51
	.data1 91
	.data1 50
	.data1 53
	.data1 32
	.data1 49
	.data1 55
	.data1 91
	.data1 50
	.data1 49
	.data1 10
	.data1 49
	.data1 91
	.data1 50
	.data1 49
	.data1 32
	.data1 50
	.data1 91
	.data1 49
	.data1 48
	.data1 32
	.data1 49
	.data1 91
	.data1 49
	.data1 48
	.data1 32
	.data1 50
	.data1 91
	.data1 49
	.data1 52
	.data1 32
	.data1 49
	.data1 52
	.data1 32
	.data1 52
	.data1 48
	.data1 91
	.data1 123
	.data1 125
	.data1 51
	.data1 54
	.data1 32
	.data1 52
	.data1 49
	.data1 46
	.data1 54
	.data1 54
	.data1 54
	.data1 54
	.data1 54
	.data1 57
	.data1 32
	.data1 47
	.data1 84
	.data1 105
	.data1 109
	.data1 101
	.data1 115
	.data1 45
	.data1 82
	.data1 111
	.data1 109
	.data1 97
	.data1 110
	.data1 10
	.data1 114
	.data1 102
	.data1 32
	.data1 47
	.data1 70
	.data1 102
	.data1 32
	.data1 49
	.data1 51
	.data1 53
	.data1 91
	.data1 49
	.data1 56
	.data1 32
	.data1 51
	.data1 91
	.data1 49
	.data1 50
	.data1 32
	.data1 49
	.data1 54
	.data1 32
	.data1 49
	.data1 54
	.data1 32
	.data1 49
	.data1 91
	.data1 50
	.data1 49
	.data1 32
	.data1 50
	.data1 49
	.data1 32
	.data1 50
	.data1 49
	.data1 32
	.data1 51
	.data1 48
	.data1 32
	.data1 49
	.data1 50
	.data1 32
	.data1 50
	.data1 91
	.data1 49
	.data1 50
	.data1 32
	.data1 50
	.data1 49
	.data1 32
	.data1 50
	.data1 49
	.data1 10
	.data1 49
	.data1 50
	.data1 32
	.data1 49
	.data1 56
	.data1 32
	.data1 49
	.data1 91
	.data1 49
	.data1 56
	.data1 32
	.data1 50
	.data1 49
	.data1 32
	.data1 50
	.data1 49
	.data1 32
	.data1 49
	.data1 50
	.data1 91
	.data1 50
	.data1 51
	.data1 32
	.data1 53
	.data1 91
	.data1 50
	.data1 56
	.data1 32
	.data1 50
	.data1 54
	.data1 91
	.data1 50
	.data1 49
	.data1 32
	.data1 52
	.data1 91
	.data1 49
	.data1 48
	.data1 32
	.data1 52
	.data1 54
	.data1 91
	.data1 123
	.data1 125
	.data1 50
	.data1 49
	.data1 32
	.data1 52
	.data1 49
	.data1 46
	.data1 54
	.data1 54
	.data1 54
	.data1 54
	.data1 54
	.data1 57
	.data1 10
	.data1 47
	.data1 84
	.data1 105
	.data1 109
	.data1 101
	.data1 115
	.data1 45
	.data1 73
	.data1 116
	.data1 97
	.data1 108
	.data1 105
	.data1 99
	.data1 32
	.data1 114
	.data1 102
	.data1 32
	.data1 47
	.data1 70
	.data1 103
	.data1 32
	.data1 49
	.data1 55
	.data1 49
	.data1 91
	.data1 50
	.data1 53
	.data1 32
	.data1 50
	.data1 51
	.data1 32
	.data1 50
	.data1 56
	.data1 32
	.data1 49
	.data1 52
	.data1 91
	.data1 50
	.data1 56
	.data1 32
	.data1 50
	.data1 56
	.data1 32
	.data1 50
	.data1 56
	.data1 32
	.data1 54
	.data1 53
	.data1 91
	.data1 123
	.data1 125
	.data1 54
	.data1 10
	.data1 52
	.data1 49
	.data1 46
	.data1 54
	.data1 54
	.data1 54
	.data1 54
	.data1 54
	.data1 57
	.data1 32
	.data1 47
	.data1 84
	.data1 105
	.data1 109
	.data1 101
	.data1 115
	.data1 45
	.data1 66
	.data1 111
	.data1 108
	.data1 100
	.data1 73
	.data1 116
	.data1 97
	.data1 108
	.data1 105
	.data1 99
	.data1 32
	.data1 114
	.data1 102
	.data1 32
	.data1 47
	.data1 70
	.data1 104
	.data1 32
	.data1 49
	.data1 51
	.data1 52
	.data1 91
	.data1 50
	.data1 53
	.data1 32
	.data1 51
	.data1 91
	.data1 50
	.data1 53
	.data1 32
	.data1 49
	.data1 52
	.data1 32
	.data1 49
	.data1 57
	.data1 10
	.data1 49
	.data1 55
	.data1 32
	.data1 49
	.data1 91
	.data1 50
	.data1 53
	.data1 32
	.data1 50
	.data1 53
	.data1 32
	.data1 50
	.data1 53
	.data1 32
	.data1 51
	.data1 57
	.data1 32
	.data1 49
	.data1 52
	.data1 32
	.data1 50
	.data1 91
	.data1 49
	.data1 52
	.data1 32
	.data1 50
	.data1 53
	.data1 32
	.data1 50
	.data1 91
	.data1 50
	.data1 50
	.data1 32
	.data1 50
	.data1 53
	.data1 32
	.data1 50
	.data1 50
	.data1 32
	.data1 49
	.data1 91
	.data1 50
	.data1 50
	.data1 32
	.data1 54
	.data1 91
	.data1 51
	.data1 48
	.data1 32
	.data1 54
	.data1 91
	.data1 50
	.data1 56
	.data1 10
	.data1 50
	.data1 91
	.data1 50
	.data1 56
	.data1 32
	.data1 49
	.data1 91
	.data1 51
	.data1 54
	.data1 32
	.data1 52
	.data1 52
	.data1 32
	.data1 51
	.data1 91
	.data1 49
	.data1 55
	.data1 32
	.data1 49
	.data1 91
	.data1 51
	.data1 54
	.data1 32
	.data1 49
	.data1 91
	.data1 51
	.data1 48
	.data1 32
	.data1 51
	.data1 54
	.data1 32
	.data1 51
	.data1 51
	.data1 32
	.data1 49
	.data1 91
	.data1 51
	.data1 54
	.data1 32
	.data1 49
	.data1 55
	.data1 91
	.data1 49
	.data1 52
	.data1 32
	.data1 50
	.data1 91
	.data1 49
	.data1 50
	.data1 32
	.data1 52
	.data1 52
	.data1 91
	.data1 123
	.data1 125
	.data1 50
	.data1 57
	.data1 10
	.data1 53
	.data1 48
	.data1 46
	.data1 48
	.data1 48
	.data1 48
	.data1 48
	.data1 48
	.data1 49
	.data1 32
	.data1 47
	.data1 84
	.data1 105
	.data1 109
	.data1 101
	.data1 115
	.data1 45
	.data1 82
	.data1 111
	.data1 109
	.data1 97
	.data1 110
	.data1 32
	.data1 114
	.data1 102
	.data1 32
	.data1 47
	.data1 70
	.data1 105
	.data1 32
	.data1 49
	.data1 51
	.data1 52
	.data1 91
	.data1 51
	.data1 48
	.data1 32
	.data1 51
	.data1 91
	.data1 51
	.data1 51
	.data1 32
	.data1 50
	.data1 48
	.data1 32
	.data1 50
	.data1 51
	.data1 32
	.data1 50
	.data1 55
	.data1 32
	.data1 49
	.data1 91
	.data1 51
	.data1 51
	.data1 10
	.data1 51
	.data1 48
	.data1 32
	.data1 51
	.data1 51
	.data1 32
	.data1 53
	.data1 48
	.data1 32
	.data1 49
	.data1 55
	.data1 32
	.data1 50
	.data1 91
	.data1 49
	.data1 55
	.data1 32
	.data1 50
	.data1 91
	.data1 50
	.data1 48
	.data1 32
	.data1 50
	.data1 55
	.data1 32
	.data1 51
	.data1 51
	.data1 32
	.data1 50
	.data1 55
	.data1 32
	.data1 49
	.data1 91
	.data1 51
	.data1 48
	.data1 32
	.data1 49
	.data1 50
	.data1 91
	.data1 52
	.data1 48
	.data1 32
	.data1 51
	.data1 51
	.data1 32
	.data1 52
	.data1 51
	.data1 32
	.data1 49
	.data1 91
	.data1 51
	.data1 55
	.data1 10
	.data1 54
	.data1 91
	.data1 50
	.data1 51
	.data1 32
	.data1 51
	.data1 91
	.data1 52
	.data1 48
	.data1 32
	.data1 50
	.data1 91
	.data1 52
	.data1 48
	.data1 32
	.data1 49
	.data1 52
	.data1 91
	.data1 51
	.data1 48
	.data1 32
	.data1 51
	.data1 48
	.data1 32
	.data1 51
	.data1 48
	.data1 32
	.data1 52
	.data1 57
	.data1 91
	.data1 123
	.data1 125
	.data1 50
	.data1 54
	.data1 32
	.data1 53
	.data1 57
	.data1 46
	.data1 57
	.data1 57
	.data1 57
	.data1 57
	.data1 55
	.data1 52
	.data1 32
	.data1 47
	.data1 84
	.data1 105
	.data1 109
	.data1 101
	.data1 115
	.data1 45
	.data1 66
	.data1 111
	.data1 108
	.data1 100
	.data1 10
	.data1 114
	.data1 102
	.data1 32
	.data1 101
	.data1 110
	.data1 100
	.data1 10
	.data1 37
	.data1 37
	.data1 69
	.data1 110
	.data1 100
	.data1 80
	.data1 114
	.data1 111
	.data1 108
	.data1 111
	.data1 103
	.data1 10
	.data1 37
	.data1 37
	.data1 66
	.data1 101
	.data1 103
	.data1 105
	.data1 110
	.data1 83
	.data1 101
	.data1 116
	.data1 117
	.data1 112
	.data1 10
	.data1 37
	.data1 37
	.data1 70
	.data1 101
	.data1 97
	.data1 116
	.data1 117
	.data1 114
	.data1 101
	.data1 58
	.data1 32
	.data1 42
	.data1 82
	.data1 101
	.data1 115
	.data1 111
	.data1 108
	.data1 117
	.data1 116
	.data1 105
	.data1 111
	.data1 110
	.data1 32
	.data1 51
	.data1 48
	.data1 48
	.data1 100
	.data1 112
	.data1 105
	.data1 10
	.data1 84
	.data1 101
	.data1 88
	.data1 68
	.data1 105
	.data1 99
	.data1 116
	.data1 32
	.data1 98
	.data1 101
	.data1 103
	.data1 105
	.data1 110
	.data1 10
	.data1 37
	.data1 37
	.data1 80
	.data1 97
	.data1 112
	.data1 101
	.data1 114
	.data1 83
	.data1 105
	.data1 122
	.data1 101
	.data1 58
	.data1 32
	.data1 76
	.data1 101
	.data1 116
	.data1 116
	.data1 101
	.data1 114
	.data1 10
	.data1 37
	.data1 37
	.data1 66
	.data1 101
	.data1 103
	.data1 105
	.data1 110
	.data1 80
	.data1 97
	.data1 112
	.data1 101
	.data1 114
	.data1 83
	.data1 105
	.data1 122
	.data1 101
	.data1 58
	.data1 32
	.data1 76
	.data1 101
	.data1 116
	.data1 116
	.data1 101
	.data1 114
	.data1 10
	.data1 108
	.data1 101
	.data1 116
	.data1 116
	.data1 101
	.data1 114
	.data1 10
	.data1 37
	.data1 37
	.data1 69
	.data1 110
	.data1 100
	.data1 80
	.data1 97
	.data1 112
	.data1 101
	.data1 114
	.data1 83
	.data1 105
	.data1 122
	.data1 101
	.data1 10
	.data1 10
	.data1 37
	.data1 37
	.data1 69
	.data1 110
	.data1 100
	.data1 83
	.data1 101
	.data1 116
	.data1 117
	.data1 112
	.data1 10
	.data1 37
	.data1 37
	.data1 80
	.data1 97
	.data1 103
	.data1 101
	.data1 58
	.data1 32
	.data1 49
	.data1 32
	.data1 49
	.data1 10
	.data1 49
	.data1 32
	.data1 48
	.data1 32
	.data1 98
	.data1 111
	.data1 112
	.data1 32
	.data1 55
	.data1 56
	.data1 55
	.data1 32
	.data1 49
	.data1 55
	.data1 52
	.data1 32
	.data1 97
	.data1 32
	.data1 70
	.data1 105
	.data1 40
	.data1 83
	.data1 69
	.data1 83
	.data1 41
	.data1 49
	.data1 53
	.data1 32
	.data1 98
	.data1 40
	.data1 80
	.data1 97
	.data1 112
	.data1 101
	.data1 114
	.data1 41
	.data1 102
	.data1 40
	.data1 84
	.data1 41
	.data1 45
	.data1 53
	.data1 32
	.data1 98
	.data1 40
	.data1 101
	.data1 109
	.data1 112
	.data1 108
	.data1 97
	.data1 116
	.data1 101
	.data1 41
	.data1 57
	.data1 49
	.data1 52
	.data1 10
	.data1 50
	.data1 57
	.data1 53
	.data1 32
	.data1 121
	.data1 32
	.data1 70
	.data1 104
	.data1 40
	.data1 65
	.data1 117
	.data1 116
	.data1 104
	.data1 111
	.data1 114
	.data1 41
	.data1 49
	.data1 49
	.data1 32
	.data1 98
	.data1 40
	.data1 78
	.data1 97
	.data1 109
	.data1 101
	.data1 41
	.data1 57
	.data1 51
	.data1 50
	.data1 32
	.data1 52
	.data1 49
	.data1 49
	.data1 32
	.data1 121
	.data1 40
	.data1 68
	.data1 101
	.data1 112
	.data1 97
	.data1 114
	.data1 116
	.data1 109
	.data1 101
	.data1 110
	.data1 116
	.data1 41
	.data1 56
	.data1 49
	.data1 55
	.data1 32
	.data1 52
	.data1 54
	.data1 57
	.data1 10
	.data1 121
	.data1 40
	.data1 77
	.data1 111
	.data1 116
	.data1 111
	.data1 114
	.data1 111
	.data1 108
	.data1 97
	.data1 41
	.data1 104
	.data1 40
	.data1 71
	.data1 114
	.data1 111
	.data1 117
	.data1 112
	.data1 47
	.data1 83
	.data1 101
	.data1 99
	.data1 116
	.data1 111
	.data1 114
	.data1 41
	.data1 57
	.data1 48
	.data1 51
	.data1 32
	.data1 53
	.data1 50
	.data1 55
	.data1 32
	.data1 121
	.data1 40
	.data1 67
	.data1 105
	.data1 116
	.data1 121
	.data1 41
	.data1 109
	.data1 40
	.data1 44
	.data1 41
	.data1 103
	.data1 40
	.data1 83
	.data1 116
	.data1 97
	.data1 116
	.data1 101
	.data1 41
	.data1 103
	.data1 40
	.data1 90
	.data1 73
	.data1 80
	.data1 41
	.data1 57
	.data1 48
	.data1 51
	.data1 10
	.data1 53
	.data1 56
	.data1 53
	.data1 32
	.data1 121
	.data1 40
	.data1 69
	.data1 109
	.data1 97
	.data1 105
	.data1 108
	.data1 41
	.data1 103
	.data1 40
	.data1 65
	.data1 100
	.data1 100
	.data1 114
	.data1 101
	.data1 115
	.data1 115
	.data1 41
	.data1 52
	.data1 48
	.data1 56
	.data1 32
	.data1 55
	.data1 52
	.data1 56
	.data1 32
	.data1 121
	.data1 32
	.data1 70
	.data1 103
	.data1 40
	.data1 65
	.data1 66
	.data1 83
	.data1 84
	.data1 82
	.data1 65
	.data1 67
	.data1 84
	.data1 41
	.data1 48
	.data1 32
	.data1 56
	.data1 51
	.data1 57
	.data1 32
	.data1 121
	.data1 32
	.data1 70
	.data1 102
	.data1 40
	.data1 84
	.data1 104
	.data1 101
	.data1 41
	.data1 104
	.data1 40
	.data1 116
	.data1 101
	.data1 120
	.data1 116
	.data1 41
	.data1 103
	.data1 40
	.data1 111
	.data1 102
	.data1 41
	.data1 10
	.data1 102
	.data1 40
	.data1 116
	.data1 104
	.data1 101
	.data1 41
	.data1 104
	.data1 40
	.data1 97
	.data1 98
	.data1 115
	.data1 116
	.data1 114
	.data1 97
	.data1 99
	.data1 116
	.data1 41
	.data1 102
	.data1 40
	.data1 103
	.data1 111
	.data1 101
	.data1 115
	.data1 41
	.data1 104
	.data1 40
	.data1 104
	.data1 101
	.data1 114
	.data1 41
	.data1 110
	.data1 40
	.data1 101
	.data1 46
	.data1 41
	.data1 50
	.data1 51
	.data1 32
	.data1 98
	.data1 40
	.data1 78
	.data1 111
	.data1 41
	.data1 49
	.data1 51
	.data1 32
	.data1 98
	.data1 40
	.data1 109
	.data1 111
	.data1 114
	.data1 41
	.data1 110
	.data1 40
	.data1 101
	.data1 41
	.data1 103
	.data1 40
	.data1 116
	.data1 104
	.data1 97
	.data1 110
	.data1 41
	.data1 102
	.data1 40
	.data1 51
	.data1 41
	.data1 104
	.data1 10
	.data1 40
	.data1 105
	.data1 110
	.data1 99
	.data1 104
	.data1 101
	.data1 115
	.data1 41
	.data1 103
	.data1 40
	.data1 111
	.data1 102
	.data1 41
	.data1 48
	.data1 32
	.data1 56
	.data1 56
	.data1 57
	.data1 32
	.data1 121
	.data1 40
	.data1 97
	.data1 98
	.data1 115
	.data1 116
	.data1 114
	.data1 97
	.data1 99
	.data1 116
	.data1 41
	.data1 99
	.data1 40
	.data1 116
	.data1 101
	.data1 120
	.data1 116
	.data1 41
	.data1 105
	.data1 40
	.data1 112
	.data1 108
	.data1 101
	.data1 97
	.data1 115
	.data1 101
	.data1 46
	.data1 41
	.data1 48
	.data1 32
	.data1 49
	.data1 48
	.data1 50
	.data1 57
	.data1 10
	.data1 121
	.data1 32
	.data1 70
	.data1 105
	.data1 40
	.data1 49
	.data1 41
	.data1 54
	.data1 48
	.data1 32
	.data1 98
	.data1 40
	.data1 73
	.data1 110
	.data1 116
	.data1 114
	.data1 41
	.data1 111
	.data1 40
	.data1 111
	.data1 100
	.data1 117
	.data1 99
	.data1 116
	.data1 105
	.data1 111
	.data1 110
	.data1 41
	.data1 48
	.data1 32
	.data1 49
	.data1 49
	.data1 52
	.data1 54
	.data1 32
	.data1 121
	.data1 40
	.data1 50
	.data1 41
	.data1 103
	.data1 40
	.data1 66
	.data1 111
	.data1 100
	.data1 121
	.data1 41
	.data1 49
	.data1 52
	.data1 32
	.data1 98
	.data1 40
	.data1 83
	.data1 101
	.data1 99
	.data1 116
	.data1 105
	.data1 111
	.data1 110
	.data1 115
	.data1 41
	.data1 48
	.data1 10
	.data1 49
	.data1 50
	.data1 51
	.data1 57
	.data1 32
	.data1 121
	.data1 32
	.data1 70
	.data1 101
	.data1 40
	.data1 84
	.data1 104
	.data1 105
	.data1 115
	.data1 41
	.data1 100
	.data1 40
	.data1 105
	.data1 115
	.data1 41
	.data1 102
	.data1 40
	.data1 97
	.data1 41
	.data1 105
	.data1 40
	.data1 98
	.data1 111
	.data1 100
	.data1 121
	.data1 41
	.data1 101
	.data1 40
	.data1 112
	.data1 97
	.data1 114
	.data1 97
	.data1 103
	.data1 114
	.data1 97
	.data1 112
	.data1 104
	.data1 46
	.data1 41
	.data1 49
	.data1 54
	.data1 32
	.data1 98
	.data1 40
	.data1 73
	.data1 116
	.data1 41
	.data1 49
	.data1 48
	.data1 10
	.data1 98
	.data1 40
	.data1 105
	.data1 115
	.data1 41
	.data1 104
	.data1 40
	.data1 110
	.data1 111
	.data1 116
	.data1 41
	.data1 102
	.data1 40
	.data1 118
	.data1 101
	.data1 114
	.data1 121
	.data1 41
	.data1 104
	.data1 40
	.data1 108
	.data1 111
	.data1 110
	.data1 103
	.data1 44
	.data1 41
	.data1 102
	.data1 40
	.data1 98
	.data1 117
	.data1 116
	.data1 41
	.data1 103
	.data1 40
	.data1 108
	.data1 111
	.data1 110
	.data1 103
	.data1 41
	.data1 103
	.data1 40
	.data1 101
	.data1 110
	.data1 111
	.data1 117
	.data1 103
	.data1 104
	.data1 41
	.data1 48
	.data1 32
	.data1 49
	.data1 50
	.data1 56
	.data1 57
	.data1 10
	.data1 121
	.data1 40
	.data1 116
	.data1 111
	.data1 41
	.data1 103
	.data1 40
	.data1 109
	.data1 97
	.data1 107
	.data1 101
	.data1 41
	.data1 104
	.data1 40
	.data1 105
	.data1 116
	.data1 41
	.data1 101
	.data1 40
	.data1 92
	.data1 50
	.data1 53
	.data1 54
	.data1 116
	.data1 41
	.data1 104
	.data1 40
	.data1 111
	.data1 110
	.data1 41
	.data1 103
	.data1 40
	.data1 109
	.data1 117
	.data1 108
	.data1 116
	.data1 105
	.data1 112
	.data1 108
	.data1 101
	.data1 41
	.data1 102
	.data1 40
	.data1 108
	.data1 105
	.data1 110
	.data1 101
	.data1 115
	.data1 46
	.data1 41
	.data1 49
	.data1 50
	.data1 53
	.data1 10
	.data1 49
	.data1 51
	.data1 51
	.data1 57
	.data1 32
	.data1 121
	.data1 40
	.data1 84
	.data1 104
	.data1 105
	.data1 115
	.data1 41
	.data1 103
	.data1 40
	.data1 105
	.data1 115
	.data1 41
	.data1 104
	.data1 40
	.data1 97
	.data1 110
	.data1 111
	.data1 116
	.data1 104
	.data1 101
	.data1 114
	.data1 41
	.data1 102
	.data1 40
	.data1 98
	.data1 111
	.data1 100
	.data1 121
	.data1 41
	.data1 103
	.data1 40
	.data1 112
	.data1 97
	.data1 114
	.data1 97
	.data1 103
	.data1 114
	.data1 97
	.data1 104
	.data1 46
	.data1 41
	.data1 49
	.data1 53
	.data1 32
	.data1 98
	.data1 40
	.data1 73
	.data1 116
	.data1 41
	.data1 57
	.data1 10
	.data1 98
	.data1 40
	.data1 105
	.data1 115
	.data1 41
	.data1 103
	.data1 40
	.data1 109
	.data1 117
	.data1 99
	.data1 104
	.data1 41
	.data1 105
	.data1 40
	.data1 108
	.data1 111
	.data1 110
	.data1 103
	.data1 101
	.data1 114
	.data1 41
	.data1 101
	.data1 40
	.data1 92
	.data1 92
	.data1 40
	.data1 119
	.data1 101
	.data1 108
	.data1 108
	.data1 44
	.data1 41
	.data1 48
	.data1 32
	.data1 49
	.data1 51
	.data1 56
	.data1 56
	.data1 32
	.data1 121
	.data1 40
	.data1 97
	.data1 41
	.data1 106
	.data1 40
	.data1 108
	.data1 105
	.data1 116
	.data1 116
	.data1 108
	.data1 101
	.data1 41
	.data1 100
	.data1 40
	.data1 108
	.data1 111
	.data1 110
	.data1 103
	.data1 101
	.data1 114
	.data1 41
	.data1 105
	.data1 40
	.data1 97
	.data1 116
	.data1 41
	.data1 103
	.data1 10
	.data1 40
	.data1 108
	.data1 101
	.data1 97
	.data1 115
	.data1 116
	.data1 92
	.data1 92
	.data1 41
	.data1 44
	.data1 41
	.data1 104
	.data1 40
	.data1 97
	.data1 110
	.data1 100
	.data1 41
	.data1 102
	.data1 40
	.data1 105
	.data1 116
	.data1 41
	.data1 102
	.data1 40
	.data1 114
	.data1 101
	.data1 113
	.data1 117
	.data1 105
	.data1 114
	.data1 101
	.data1 115
	.data1 41
	.data1 104
	.data1 40
	.data1 97
	.data1 116
	.data1 41
	.data1 104
	.data1 40
	.data1 108
	.data1 101
	.data1 97
	.data1 115
	.data1 116
	.data1 41
	.data1 102
	.data1 40
	.data1 51
	.data1 41
	.data1 103
	.data1 40
	.data1 108
	.data1 105
	.data1 110
	.data1 101
	.data1 115
	.data1 41
	.data1 103
	.data1 40
	.data1 116
	.data1 111
	.data1 41
	.data1 103
	.data1 40
	.data1 92
	.data1 50
	.data1 53
	.data1 54
	.data1 116
	.data1 41
	.data1 103
	.data1 10
	.data1 40
	.data1 116
	.data1 104
	.data1 101
	.data1 41
	.data1 48
	.data1 32
	.data1 49
	.data1 52
	.data1 51
	.data1 56
	.data1 32
	.data1 121
	.data1 40
	.data1 99
	.data1 111
	.data1 110
	.data1 116
	.data1 101
	.data1 110
	.data1 116
	.data1 41
	.data1 102
	.data1 40
	.data1 111
	.data1 102
	.data1 41
	.data1 103
	.data1 40
	.data1 105
	.data1 116
	.data1 46
	.data1 41
	.data1 50
	.data1 49
	.data1 50
	.data1 32
	.data1 49
	.data1 52
	.data1 50
	.data1 51
	.data1 32
	.data1 121
	.data1 32
	.data1 70
	.data1 100
	.data1 40
	.data1 49
	.data1 41
	.data1 52
	.data1 50
	.data1 32
	.data1 49
	.data1 53
	.data1 50
	.data1 49
	.data1 10
	.data1 121
	.data1 32
	.data1 70
	.data1 99
	.data1 40
	.data1 92
	.data1 48
	.data1 49
	.data1 55
	.data1 41
	.data1 50
	.data1 48
	.data1 32
	.data1 98
	.data1 32
	.data1 70
	.data1 101
	.data1 40
	.data1 84
	.data1 104
	.data1 105
	.data1 115
	.data1 41
	.data1 49
	.data1 48
	.data1 32
	.data1 98
	.data1 40
	.data1 105
	.data1 115
	.data1 41
	.data1 103
	.data1 40
	.data1 97
	.data1 41
	.data1 104
	.data1 40
	.data1 98
	.data1 117
	.data1 108
	.data1 108
	.data1 101
	.data1 116
	.data1 46
	.data1 41
	.data1 48
	.data1 32
	.data1 49
	.data1 54
	.data1 54
	.data1 49
	.data1 32
	.data1 121
	.data1 10
	.data1 70
	.data1 105
	.data1 40
	.data1 51
	.data1 41
	.data1 54
	.data1 48
	.data1 32
	.data1 98
	.data1 40
	.data1 82
	.data1 101
	.data1 102
	.data1 101
	.data1 114
	.data1 41
	.data1 111
	.data1 40
	.data1 101
	.data1 110
	.data1 99
	.data1 101
	.data1 115
	.data1 41
	.data1 50
	.data1 49
	.data1 32
	.data1 49
	.data1 55
	.data1 53
	.data1 52
	.data1 32
	.data1 121
	.data1 32
	.data1 70
	.data1 101
	.data1 40
	.data1 91
	.data1 49
	.data1 93
	.data1 92
	.data1 92
	.data1 41
	.data1 41
	.data1 57
	.data1 32
	.data1 98
	.data1 40
	.data1 82
	.data1 101
	.data1 102
	.data1 101
	.data1 114
	.data1 101
	.data1 110
	.data1 99
	.data1 101
	.data1 115
	.data1 41
	.data1 106
	.data1 40
	.data1 105
	.data1 110
	.data1 41
	.data1 101
	.data1 40
	.data1 73
	.data1 69
	.data1 69
	.data1 69
	.data1 41
	.data1 104
	.data1 10
	.data1 40
	.data1 115
	.data1 116
	.data1 97
	.data1 110
	.data1 100
	.data1 97
	.data1 114
	.data1 100
	.data1 41
	.data1 102
	.data1 40
	.data1 102
	.data1 111
	.data1 114
	.data1 109
	.data1 97
	.data1 116
	.data1 46
	.data1 41
	.data1 112
	.data1 32
	.data1 48
	.data1 32
	.data1 50
	.data1 53
	.data1 49
	.data1 49
	.data1 32
	.data1 52
	.data1 49
	.data1 50
	.data1 32
	.data1 50
	.data1 32
	.data1 118
	.data1 32
	.data1 52
	.data1 50
	.data1 32
	.data1 50
	.data1 53
	.data1 51
	.data1 56
	.data1 32
	.data1 97
	.data1 32
	.data1 70
	.data1 98
	.data1 40
	.data1 49
	.data1 41
	.data1 54
	.data1 48
	.data1 10
	.data1 50
	.data1 53
	.data1 53
	.data1 48
	.data1 32
	.data1 121
	.data1 32
	.data1 70
	.data1 97
	.data1 40
	.data1 84
	.data1 104
	.data1 105
	.data1 115
	.data1 41
	.data1 101
	.data1 40
	.data1 105
	.data1 115
	.data1 41
	.data1 104
	.data1 40
	.data1 97
	.data1 41
	.data1 102
	.data1 40
	.data1 102
	.data1 111
	.data1 111
	.data1 116
	.data1 110
	.data1 111
	.data1 116
	.data1 101
	.data1 46
	.data1 41
	.data1 112
	.data1 32
	.data1 101
	.data1 111
	.data1 112
	.data1 10
	.data1 37
	.data1 37
	.data1 84
	.data1 114
	.data1 97
	.data1 105
	.data1 108
	.data1 101
	.data1 114
	.data1 10
	.data1 101
	.data1 110
	.data1 100
	.data1 10
	.data1 117
	.data1 115
	.data1 101
	.data1 114
	.data1 100
	.data1 105
	.data1 99
	.data1 116
	.data1 32
	.data1 47
	.data1 101
	.data1 110
	.data1 100
	.data1 45
	.data1 104
	.data1 111
	.data1 111
	.data1 107
	.data1 32
	.data1 107
	.data1 110
	.data1 111
	.data1 119
	.data1 110
	.data1 123
	.data1 101
	.data1 110
	.data1 100
	.data1 45
	.data1 104
	.data1 111
	.data1 111
	.data1 107
	.data1 125
	.data1 105
	.data1 102
	.data1 10
	.data1 37
	.data1 37
	.data1 69
	.data1 79
	.data1 70
	.data1 0
.skip 6

	.comm	outbuf,8192,1           ## @outbuf
	.section	.data
	.align	4                       ## @eout
eout::
	.data4	outbuf

	.comm	gP,4,4
	.comm	gE,4,4
	.comm	baddr,4,4               ## @baddr
	.comm	codedone,4,4            ## @codedone
	.comm	eaddr,4,4               ## @eaddr
	.comm	codebuf,8192,1          ## @codebuf
	.comm	dict,16392,4            ## @dict
	.comm	c1,4,4                  ## @c1
	.comm	c2,4,4                  ## @c2
	.comm	c3,4,4                  ## @c3
	.comm	escape,4,4              ## @escape
	.comm	compress,4,4            ## @compress
	.comm	last,4,4                ## @last
	.comm	decode.str,251,1
	.section	.data
.str::                                  ## @.str
	.data1 54
	.data1 54
	.data1 54
	.data1 10
	.data1 0
.skip 3

.str1::                                 ## @.str1
	.data1 45
	.data1 49
	.data1 10
	.data1 0
.skip 4

	.comm	p0,4,4                  ## @p0
	.comm	p1,4,4                  ## @p1
	.comm	p2,4,4                  ## @p2
	.section	.data
	.align	4                       ## @str
str::
	.data1 45
	.data1 49
	.data1 0
.skip 5

	.align	4                       ## @str2
str2::
	.data1 54
	.data1 54
	.data1 54
	.data1 0
.skip 4

.import printf
.import puts
.import memset
