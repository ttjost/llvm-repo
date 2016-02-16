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
	c0	mov $r0.11 = baddr
;;
	c0	ldw $r0.12 = 0[$r0.11]
	c0	cmpne $b0.0 = $r0.3, 1
;;
;;
	c0	and $r0.13 = $r0.12, 7
	c0	br $b0.0, LBB2_7
;;
## BB#5:                                ## %if.end5
	c0	cmpeq $b0.0 = $r0.4, 8
;;
;;
	c0	br $b0.0, LBB2_7
;;
## BB#6:                                ## %if.end5
	c0	cmpeq $b0.0 = $r0.13, 0
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
	c0	mov $r0.14 = 24
	c0	mov $r0.15 = 3
	c0	mov $r0.16 = codebuf
;;
	c0	sub $r0.14 = $r0.14, $r0.4
	c0	shru $r0.15 = $r0.12, $r0.15
;;
	c0	sub $r0.13 = $r0.14, $r0.13
	c0	add $r0.14 = $r0.16, $r0.15
	c0	mov $r0.15 = 8
	c0	mov $r0.16 = 16
;;
	c0	shl $r0.13 = $r0.3, $r0.13
;;
	c0	stb 2[$r0.14] = $r0.13
	c0	shru $r0.15 = $r0.13, $r0.15
	c0	shru $r0.13 = $r0.13, $r0.16
;;
	c0	stb 1[$r0.14] = $r0.15
	c0	add $r0.12 = $r0.12, $r0.4
;;
	c0	ldb $r0.15 = 0[$r0.14]
;;
;;
	c0	or $r0.13 = $r0.13, $r0.15
;;
	c0	stb 0[$r0.14] = $r0.13
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
	c0	and $r0.16 = $r0.14, 2047
;;
	c0	cmpeq $b0.0 = $r0.16, 0
	c0	mov $r0.17 = $r0.13
;;
;;
	c0	br $b0.0, LBB5_8
;;
## BB#3:                                ## %for.body.lr.ph
	c0	mov $r0.14 = last
;;
	c0	ldw $r0.14 = 0[$r0.14]
;;
;;
	c0	sh3add $r0.15 = $r0.14, $r0.11
;;
	c0	add $r0.15 = $r0.15, 4
;;
LBB5_4::                                ## %for.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	cmpne $b0.0 = $r0.16, $r0.14
;;
;;
	c0	br $b0.0, LBB5_6
;;
## BB#5:                                ## %for.body.for.inc_crit_edge
                                        ##   in Loop: Header=BB5_4 Depth=1
	c0	ldw $r0.18 = 0[$r0.15]
	c0	goto LBB5_7
;;
LBB5_6::                                ## %land.lhs.true
                                        ##   in Loop: Header=BB5_4 Depth=1
	c0	sh3add $r0.17 = $r0.16, $r0.11
;;
	c0	ldw $r0.18 = 4[$r0.17]
;;
;;
	c0	shru $r0.17 = $r0.18, $r0.12
;;
	c0	zxtb $r0.17 = $r0.17
;;
	c0	cmpeq $b0.0 = $r0.17, $r0.4
	c0	mov $r0.17 = $r0.16
;;
;;
	c0	br $b0.0, LBB5_8
;;
LBB5_7::                                ## %for.inc
                                        ##   in Loop: Header=BB5_4 Depth=1
	c0	and $r0.16 = $r0.18, 2047
;;
	c0	cmpne $b0.0 = $r0.16, 0
	c0	mov $r0.17 = $r0.13
;;
;;
	c0	br $b0.0, LBB5_4
;;
	c0	goto LBB5_8
;;
LBB5_1::                                ## %if.then
	c0	add $r0.17 = $r0.4, 3
;;
LBB5_8::                                ## %return
.return ret($r0.3:s32)
	c0	mov $r0.3 = $r0.17
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
	c0	mov $r0.13 = c1
	c0	mov $r0.12 = dict
;;
	c0	ldw $r0.14 = 0[$r0.13]
	c0	and $r0.15 = $r0.3, 2047
	c0	sh3add $r0.16 = $r0.3, $r0.12
;;
;;
	c0	sh3add $r0.17 = $r0.14, $r0.12
	c0	mov $r0.11 = 11
;;
	c0	ldw $r0.18 = 0[$r0.17]
	c0	shl $r0.19 = $r0.4, $r0.11
	c0	shl $r0.20 = $r0.14, $r0.11
;;
;;
	c0	and $r0.18 = $r0.18, -4194304
	c0	ldw $r0.21 = 4[$r0.17]
;;
	c0	or $r0.15 = $r0.18, $r0.15
;;
	c0	and $r0.18 = $r0.21, -524288
	c0	stw 0[$r0.17] = $r0.15
;;
	c0	or $r0.18 = $r0.18, $r0.19
	c0	and $r0.19 = $r0.20, 4192256
	c0	add $r0.15 = $r0.17, 8
;;
	c0	ldw $r0.20 = 0[$r0.16]
	c0	mov $r0.21 = last
;;
;;
	c0	shru $r0.22 = $r0.20, $r0.11
	c0	and $r0.20 = $r0.20, -4192257
;;
	c0	or $r0.19 = $r0.20, $r0.19
	c0	and $r0.20 = $r0.22, 2047
;;
	c0	or $r0.18 = $r0.18, $r0.20
;;
	c0	stw 4[$r0.17] = $r0.18
;;
	c0	stw 0[$r0.16] = $r0.19
;;
	c0	stw 0[$r0.21] = $r0.14
	c0	add $r0.16 = $r0.12, 16384
;;
	c0	add $r0.17 = $r0.12, 2072
;;
LBB6_2::                                ## %while.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	mov $r0.14 = $r0.15
;;
	c0	ldw $r0.15 = 0[$r0.14]
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
	c0	add $r0.15 = $r0.14, 8
	c0	goto LBB6_2
;;
LBB6_4::                                ## %while.end
                                        ##   in Loop: Header=BB6_2 Depth=1
	c0	cmpgeu $b0.0 = $r0.14, $r0.16
	c0	mov $r0.15 = $r0.17
;;
;;
	c0	br $b0.0, LBB6_2
;;
## BB#5:                                ## %for.end
	c0	sub $r0.15 = $r0.14, $r0.12
	c0	mov $r0.16 = 3
;;
	c0	shr $r0.16 = $r0.15, $r0.16
;;
	c0	stw 0[$r0.13] = $r0.16
;;
	c0	ldw $r0.13 = 0[$r0.14]
;;
;;
	c0	and $r0.13 = $r0.13, 2047
;;
	c0	cmpeq $b0.0 = $r0.13, 0
;;
;;
	c0	br $b0.0, LBB6_14
;;
## BB#6:                                ## %if.then32
	c0	sh3add $r0.13 = $r0.13, $r0.12
;;
	c0	ldw $r0.15 = 0[$r0.13]
;;
;;
	c0	shru $r0.17 = $r0.15, $r0.11
;;
	c0	and $r0.18 = $r0.17, 2047
;;
	c0	cmpeq $b0.0 = $r0.18, 0
;;
;;
	c0	br $b0.0, LBB6_8
;;
## BB#7:                                ## %if.then32
	c0	cmpne $b0.0 = $r0.18, $r0.16
;;
;;
	c0	brf $b0.0, LBB6_8
;;
LBB6_9::                                ## %for.inc
                                        ## =>This Inner Loop Header: Depth=1
	c0	mov $r0.19 = $r0.18
;;
	c0	sh3add $r0.17 = $r0.19, $r0.12
;;
	c0	ldw $r0.18 = 4[$r0.17]
;;
;;
	c0	and $r0.18 = $r0.18, 2047
;;
	c0	cmpeq $b0.0 = $r0.18, 0
;;
;;
	c0	br $b0.0, LBB6_11
;;
## BB#10:                               ## %for.inc
                                        ##   in Loop: Header=BB6_9 Depth=1
	c0	cmpne $b0.0 = $r0.18, $r0.16
;;
;;
	c0	br $b0.0, LBB6_9
;;
LBB6_11::                               ## %for.end49
	c0	ldw $r0.12 = 4[$r0.14]
	c0	cmpeq $b0.0 = $r0.19, 0
;;
;;
	c0	and $r0.12 = $r0.12, 2047
	c0	br $b0.0, LBB6_13
;;
## BB#12:                               ## %if.then51
	c0	ldw $r0.11 = 4[$r0.17]
;;
;;
	c0	and $r0.11 = $r0.11, -2048
;;
	c0	or $r0.11 = $r0.11, $r0.12
;;
	c0	stw 4[$r0.17] = $r0.11
	c0	goto LBB6_14
;;
LBB6_8::                                ## %for.end49.thread
	c0	ldw $r0.12 = 4[$r0.14]
;;
;;
	c0	and $r0.12 = $r0.12, 2047
;;
LBB6_13::                               ## %if.else
	c0	shl $r0.11 = $r0.12, $r0.11
	c0	and $r0.12 = $r0.15, -4192257
;;
	c0	or $r0.11 = $r0.12, $r0.11
;;
	c0	stw 0[$r0.13] = $r0.11
;;
LBB6_14::                               ## %if.end73
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @checksize_dict
checksize_dict::
## BB#0:                                ## %entry
	c0	mov $r0.11 = c3
	c0	mov $r0.13 = c1
;;
	c0	ldw $r0.12 = 0[$r0.11]
;;
	c0	ldw $r0.13 = 0[$r0.13]
;;
;;
	c0	cmplt $b0.0 = $r0.13, $r0.12
;;
;;
	c0	br $b0.0, LBB7_7
;;
## BB#1:                                ## %while.body.lr.ph
	c0	mov $r0.14 = c2
	c0	mov $r0.15 = baddr
;;
	c0	mov $r0.17 = 24
	c0	ldw $r0.16 = 0[$r0.14]
;;
	c0	ldw $r0.18 = 0[$r0.15]
;;
	c0	sub $r0.17 = $r0.17, $r0.16
	c0	mov $r0.19 = 3
	c0	mov $r0.20 = codebuf
;;
	c0	mov $r0.21 = 0
	c0	mov $r0.22 = 1
	c0	mov $r0.23 = 2
	c0	mov $r0.24 = 8
;;
	c0	mov $r0.25 = 16
;;
LBB7_2::                                ## %while.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	cmpne $b0.0 = $r0.16, 0
;;
;;
	c0	br $b0.0, LBB7_4
;;
## BB#3:                                ## %if.then2.i
                                        ##   in Loop: Header=BB7_2 Depth=1
	c0	add $r0.26 = $r0.18, 7
;;
	c0	and $r0.18 = $r0.26, -8
	c0	shru $r0.26 = $r0.26, $r0.19
;;
	c0	stw 0[$r0.15] = $r0.18
	c0	add $r0.26 = $r0.20, $r0.26
;;
	c0	stb 0[$r0.26] = $r0.21
	c0	goto LBB7_5
;;
LBB7_4::                                ## %if.end5.i
                                        ##   in Loop: Header=BB7_2 Depth=1
	c0	and $r0.26 = $r0.18, 7
	c0	shru $r0.27 = $r0.18, $r0.19
;;
	c0	sub $r0.26 = $r0.17, $r0.26
;;
	c0	shl $r0.26 = $r0.23, $r0.26
	c0	add $r0.27 = $r0.20, $r0.27
;;
	c0	stb 2[$r0.27] = $r0.26
	c0	shru $r0.28 = $r0.26, $r0.24
	c0	shru $r0.26 = $r0.26, $r0.25
;;
	c0	stb 1[$r0.27] = $r0.28
;;
	c0	ldb $r0.28 = 0[$r0.27]
	c0	add $r0.18 = $r0.16, $r0.18
;;
;;
	c0	or $r0.26 = $r0.28, $r0.26
;;
	c0	stb 0[$r0.27] = $r0.26
;;
	c0	stw 0[$r0.15] = $r0.18
;;
LBB7_5::                                ## %putcode.exit
                                        ##   in Loop: Header=BB7_2 Depth=1
	c0	shl $r0.12 = $r0.12, $r0.22
	c0	add $r0.17 = $r0.17, -1
	c0	add $r0.16 = $r0.16, 1
;;
	c0	cmpge $b0.0 = $r0.13, $r0.12
;;
;;
	c0	br $b0.0, LBB7_2
;;
## BB#6:                                ## %while.cond.while.end_crit_edge
	c0	stw 0[$r0.14] = $r0.16
;;
	c0	stw 0[$r0.11] = $r0.12
;;
LBB7_7::                                ## %while.end
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-160, arg() ## @encode
encode::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -160
;;
	c0	stw 140[$r0.1] = $r0.57
;;
	c0	stw 136[$r0.1] = $r0.58
;;
	c0	stw 132[$r0.1] = $r0.59
;;
	c0	stw 128[$r0.1] = $r0.60
;;
	c0	stw 124[$r0.1] = $r0.61
;;
	c0	stw 120[$r0.1] = $r0.62
;;
	c0	stw 116[$r0.1] = $r0.63
;;
	c0	stw 112[$r0.1] = $l0.0
	c0	mov $r0.23 = 0
;;
	c0	stw 96[$r0.1] = $r0.23
;;
	c0	stw 96[$r0.1] = $r0.23
	c0	mov $r0.59 = gE
;;
	c0	stw 24[$r0.1] = $r0.59
	c0	mov $r0.24 = gP
;;
	c0	mov $r0.25 = compress
;;
	c0	stw 92[$r0.1] = $r0.25
;;
	c0	stw 92[$r0.1] = $r0.25
	c0	mov $r0.26 = c2
;;
	c0	stw 88[$r0.1] = $r0.26
;;
	c0	stw 88[$r0.1] = $r0.26
	c0	mov $r0.62 = baddr
	c0	mov $r0.63 = 3
;;
	c0	mov $r0.57 = codebuf
	c0	mov $r0.27 = 8
;;
	c0	stw 84[$r0.1] = $r0.27
;;
	c0	stw 84[$r0.1] = $r0.27
	c0	mov $r0.28 = c3
;;
	c0	stw 80[$r0.1] = $r0.28
;;
	c0	stw 80[$r0.1] = $r0.28
	c0	mov $r0.29 = c1
;;
	c0	stw 76[$r0.1] = $r0.29
;;
	c0	stw 76[$r0.1] = $r0.29
	c0	mov $r0.30 = dict
;;
	c0	stw 72[$r0.1] = $r0.30
;;
	c0	stw 72[$r0.1] = $r0.30
	c0	mov $r0.31 = 11
;;
	c0	stw 68[$r0.1] = $r0.31
;;
	c0	stw 68[$r0.1] = $r0.31
	c0	mov $r0.32 = last
;;
	c0	stw 64[$r0.1] = $r0.32
;;
	c0	stw 64[$r0.1] = $r0.32
	c0	mov $r0.33 = 24
;;
	c0	stw 60[$r0.1] = $r0.33
;;
	c0	stw 60[$r0.1] = $r0.33
	c0	mov $r0.58 = 16
	c0	mov $r0.34 = 1
;;
	c0	stw 56[$r0.1] = $r0.34
;;
	c0	stw 56[$r0.1] = $r0.34
	c0	mov $r0.61 = 2
	c0	mov $r0.35 = escape
;;
	c0	stw 52[$r0.1] = $r0.35
;;
	c0	stw 52[$r0.1] = $r0.35
	c0	mov $r0.36 = eaddr
;;
	c0	stw 48[$r0.1] = $r0.36
;;
	c0	stw 48[$r0.1] = $r0.36
	c0	mov $r0.37 = codedone
;;
	c0	stw 44[$r0.1] = $r0.37
;;
	c0	stw 44[$r0.1] = $r0.37
	c0	mov $r0.11 = -6144
;;
	c0	stw 20[$r0.1] = $r0.11
	c0	mov $r0.38 = 259
;;
	c0	stw 108[$r0.1] = $r0.38
;;
	c0	stw 108[$r0.1] = $r0.38
	c0	mov $r0.39 = 9
;;
	c0	stw 104[$r0.1] = $r0.39
;;
	c0	stw 104[$r0.1] = $r0.39
	c0	mov $r0.40 = 512
;;
	c0	stw 100[$r0.1] = $r0.40
;;
	c0	stw 100[$r0.1] = $r0.40
	c0	mov $r0.12 = $r0.23
	c0	mov $r0.11 = $r0.23
	c0	mov $r0.42 = $r0.23
;;
	c0	mov $r0.41 = $r0.23
	c0	stw 36[$r0.1] = $r0.23
;;
LBB8_1::                                ## %for.cond.outer
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB8_2 Depth 2
                                        ##       Child Loop BB8_15 Depth 3
                                        ##       Child Loop BB8_10 Depth 3
                                        ##     Child Loop BB8_69 Depth 2
                                        ##     Child Loop BB8_63 Depth 2
                                        ##     Child Loop BB8_35 Depth 2
                                        ##     Child Loop BB8_48 Depth 2
                                        ##     Child Loop BB8_88 Depth 2
                                        ##     Child Loop BB8_97 Depth 2
	c0	ldw $r0.14 = 0[$r0.59]
;;
	c0	ldw $r0.13 = 0[$r0.24]
;;
;;
	c0	cmpltu $b0.0 = $r0.13, $r0.14
;;
;;
	c0	br $b0.0, LBB8_8
;;
LBB8_2::                                ## %if.then.i
                                        ##   Parent Loop BB8_1 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB8_15 Depth 3
                                        ##       Child Loop BB8_10 Depth 3
	c0	cmpne $b0.0 = $r0.14, 0
;;
;;
	c0	brf $b0.0, LBB8_3
;;
## BB#4:                                ## %if.end.i
                                        ##   in Loop: Header=BB8_2 Depth=2
	c0	cmpgtu $b0.0 = $r0.13, $r0.14
;;
;;
	c0	br $b0.0, LBB8_9
;;
## BB#5:                                ## %getdata.exit.thread555
                                        ##   in Loop: Header=BB8_2 Depth=2
	c0	add $r0.13 = $r0.13, 1
;;
	c0	stw 0[$r0.24] = $r0.13
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB8_7
;;
## BB#6:                                ## %getdata.exit.thread555
                                        ##   in Loop: Header=BB8_2 Depth=2
	c0	ldw $r0.15 = 0[$r0.25]
;;
;;
	c0	cmpne $b0.0 = $r0.15, 0
;;
;;
	c0	brf $b0.0, LBB8_7
;;
## BB#13:                               ## %if.then4
                                        ##   in Loop: Header=BB8_2 Depth=2
	c0	ldw $r0.17 = 0[$r0.29]
;;
	c0	ldw $r0.16 = 0[$r0.28]
;;
	c0	ldw $r0.15 = 0[$r0.26]
;;
	c0	cmplt $b0.0 = $r0.17, $r0.16
;;
;;
	c0	br $b0.0, LBB8_20
;;
## BB#14:                               ## %while.body.lr.ph.i214
                                        ##   in Loop: Header=BB8_2 Depth=2
	c0	ldw $r0.19 = 0[$r0.62]
	c0	sub $r0.18 = $r0.33, $r0.15
;;
LBB8_15::                               ## %while.body.i218
                                        ##   Parent Loop BB8_1 Depth=1
                                        ##     Parent Loop BB8_2 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	c0	cmpne $b0.0 = $r0.15, 0
;;
;;
	c0	br $b0.0, LBB8_17
;;
## BB#16:                               ## %if.then2.i.i223
                                        ##   in Loop: Header=BB8_15 Depth=3
	c0	add $r0.20 = $r0.19, 7
;;
	c0	and $r0.19 = $r0.20, -8
	c0	shru $r0.20 = $r0.20, $r0.63
	c0	mov $r0.21 = 0
;;
	c0	stw 0[$r0.62] = $r0.19
	c0	add $r0.20 = $r0.57, $r0.20
;;
	c0	stb 0[$r0.20] = $r0.21
	c0	goto LBB8_18
;;
LBB8_17::                               ## %if.end5.i.i242
                                        ##   in Loop: Header=BB8_15 Depth=3
	c0	and $r0.20 = $r0.19, 7
	c0	shru $r0.21 = $r0.19, $r0.63
;;
	c0	sub $r0.20 = $r0.18, $r0.20
;;
	c0	shl $r0.20 = $r0.61, $r0.20
	c0	add $r0.21 = $r0.57, $r0.21
	c0	mov $r0.22 = 8
;;
	c0	stb 2[$r0.21] = $r0.20
	c0	shru $r0.22 = $r0.20, $r0.22
	c0	shru $r0.20 = $r0.20, $r0.58
;;
	c0	stb 1[$r0.21] = $r0.22
;;
	c0	ldb $r0.22 = 0[$r0.21]
	c0	add $r0.19 = $r0.15, $r0.19
;;
;;
	c0	or $r0.20 = $r0.22, $r0.20
;;
	c0	stb 0[$r0.21] = $r0.20
;;
	c0	stw 0[$r0.62] = $r0.19
;;
LBB8_18::                               ## %putcode.exit.i246
                                        ##   in Loop: Header=BB8_15 Depth=3
	c0	mov $r0.20 = 1
;;
	c0	shl $r0.16 = $r0.16, $r0.20
	c0	add $r0.18 = $r0.18, -1
	c0	add $r0.15 = $r0.15, 1
;;
	c0	cmpge $b0.0 = $r0.17, $r0.16
;;
;;
	c0	br $b0.0, LBB8_15
;;
## BB#19:                               ## %while.cond.while.end_crit_edge.i247
                                        ##   in Loop: Header=BB8_2 Depth=2
	c0	stw 0[$r0.26] = $r0.15
;;
	c0	stw 0[$r0.28] = $r0.16
;;
LBB8_20::                               ## %if.end.i379
                                        ##   in Loop: Header=BB8_2 Depth=2
	c0	cmpeq $b0.0 = $r0.15, 0
;;
;;
	c0	br $b0.0, LBB8_25
;;
## BB#21:                               ## %if.end5.i391
                                        ##   in Loop: Header=BB8_2 Depth=2
	c0	ldw $r0.16 = 0[$r0.62]
	c0	cmpne $b0.0 = $r0.11, 1
;;
;;
	c0	and $r0.17 = $r0.16, 7
	c0	br $b0.0, LBB8_24
;;
## BB#22:                               ## %if.end5.i391
                                        ##   in Loop: Header=BB8_2 Depth=2
	c0	cmpeq $b0.0 = $r0.15, 8
;;
;;
	c0	br $b0.0, LBB8_24
;;
## BB#23:                               ## %if.end5.i391
                                        ##   in Loop: Header=BB8_2 Depth=2
	c0	cmpeq $b0.0 = $r0.17, 0
;;
;;
	c0	br $b0.0, LBB8_26
;;
LBB8_24::                               ## %if.end12.i410
                                        ##   in Loop: Header=BB8_2 Depth=2
	c0	sub $r0.18 = $r0.33, $r0.15
	c0	shru $r0.19 = $r0.16, $r0.63
;;
	c0	sub $r0.17 = $r0.18, $r0.17
;;
	c0	shl $r0.17 = $r0.11, $r0.17
	c0	add $r0.18 = $r0.57, $r0.19
	c0	mov $r0.19 = 8
;;
	c0	stb 2[$r0.18] = $r0.17
	c0	shru $r0.19 = $r0.17, $r0.19
	c0	shru $r0.17 = $r0.17, $r0.58
;;
	c0	stb 1[$r0.18] = $r0.19
	c0	add $r0.16 = $r0.16, $r0.15
;;
	c0	ldb $r0.19 = 0[$r0.18]
;;
;;
	c0	or $r0.17 = $r0.19, $r0.17
;;
	c0	stb 0[$r0.18] = $r0.17
;;
	c0	stw 0[$r0.62] = $r0.16
;;
LBB8_26::                               ## %if.end5.i531
                                        ##   in Loop: Header=BB8_2 Depth=2
	c0	and $r0.17 = $r0.16, 7
	c0	cmpeq $b0.0 = $r0.15, 8
;;
;;
	c0	br $b0.0, LBB8_28
;;
## BB#27:                               ## %if.end5.i531
                                        ##   in Loop: Header=BB8_2 Depth=2
	c0	cmpeq $b0.0 = $r0.17, 0
;;
;;
	c0	br $b0.0, LBB8_29
;;
	c0	goto LBB8_28
;;
LBB8_3::                                ## %getdata.exit.thread554
                                        ##   in Loop: Header=BB8_2 Depth=2
	c0	mov $r0.15 = inbuf
	c0	mov $r0.14 = dict
;;
	c0	mov $r0.13 = -6144
	c0	stw 0[$r0.24] = $r0.15
;;
	c0	add $r0.15 = $r0.15, 7554
;;
	c0	stw 0[$r0.59] = $r0.15
;;
LBB8_10::                               ## %for.body.i
                                        ##   Parent Loop BB8_1 Depth=1
                                        ##     Parent Loop BB8_2 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	c0	ldw $r0.15 = 0[$r0.14]
	c0	and $r0.16 = $r0.13, 522240
;;
;;
	c0	and $r0.15 = $r0.15, -4194304
;;
	c0	stw 0[$r0.14] = $r0.15
	c0	add $r0.13 = $r0.13, 2048
	c0	add $r0.15 = $r0.14, 8
;;
	c0	ldw $r0.17 = 4[$r0.14]
	c0	cmpne $b0.0 = $r0.13, 4190208
;;
;;
	c0	and $r0.17 = $r0.17, -524288
;;
	c0	or $r0.16 = $r0.17, $r0.16
;;
	c0	stw 4[$r0.14] = $r0.16
	c0	mov $r0.14 = $r0.15
	c0	br $b0.0, LBB8_10
;;
	c0	goto LBB8_11
;;
LBB8_7::                                ## %getdata.exit.thread555.if.end5_crit_edge
                                        ##   in Loop: Header=BB8_2 Depth=2
	c0	ldw $r0.16 = 0[$r0.62]
	c0	goto LBB8_29
;;
LBB8_25::                               ## %if.then2.i526
                                        ##   in Loop: Header=BB8_2 Depth=2
	c0	mov $r0.15 = 0
	c0	ldw $r0.16 = 0[$r0.62]
;;
;;
	c0	add $r0.16 = $r0.16, 7
;;
	c0	shru $r0.17 = $r0.16, $r0.63
	c0	and $r0.16 = $r0.16, -8
;;
	c0	add $r0.17 = $r0.57, $r0.17
;;
	c0	stb 0[$r0.17] = $r0.15
;;
	c0	stw 0[$r0.62] = $r0.16
;;
	c0	stb 0[$r0.17] = $r0.15
	c0	goto LBB8_29
;;
LBB8_28::                               ## %if.end12.i550
                                        ##   in Loop: Header=BB8_2 Depth=2
	c0	sub $r0.18 = $r0.33, $r0.15
	c0	shru $r0.19 = $r0.16, $r0.63
;;
	c0	sub $r0.17 = $r0.18, $r0.17
	c0	mov $r0.18 = 1
;;
	c0	shl $r0.17 = $r0.18, $r0.17
	c0	add $r0.18 = $r0.57, $r0.19
	c0	mov $r0.19 = 8
;;
	c0	stb 2[$r0.18] = $r0.17
	c0	shru $r0.19 = $r0.17, $r0.19
	c0	shru $r0.17 = $r0.17, $r0.58
;;
	c0	stb 1[$r0.18] = $r0.19
	c0	add $r0.16 = $r0.16, $r0.15
;;
	c0	ldb $r0.15 = 0[$r0.18]
;;
;;
	c0	or $r0.15 = $r0.15, $r0.17
;;
	c0	stb 0[$r0.18] = $r0.15
;;
	c0	stw 0[$r0.62] = $r0.16
;;
LBB8_29::                               ## %if.end5
                                        ##   in Loop: Header=BB8_2 Depth=2
	c0	add $r0.15 = $r0.16, 7
	c0	mov $r0.16 = 0
;;
	c0	and $r0.15 = $r0.15, -8
;;
	c0	stw 0[$r0.36] = $r0.15
	c0	mov $r0.15 = 1
;;
	c0	stw 0[$r0.62] = $r0.16
;;
	c0	stw 0[$r0.37] = $r0.15
	c0	goto LBB8_12
;;
LBB8_11::                               ## %init_dict.exit
                                        ##   in Loop: Header=BB8_2 Depth=2
	c0	stw 0[$r0.29] = $r0.38
;;
	c0	stw 0[$r0.26] = $r0.39
	c0	mov $r0.13 = 0
;;
	c0	stw 0[$r0.28] = $r0.40
;;
	c0	stw 0[$r0.35] = $r0.13
;;
	c0	stw 0[$r0.25] = $r0.13
;;
	c0	stw 0[$r0.32] = $r0.13
;;
	c0	ldw $r0.14 = 0[$r0.59]
;;
	c0	ldw $r0.13 = 0[$r0.24]
;;
LBB8_12::                               ## %for.cond.backedge
                                        ##   in Loop: Header=BB8_2 Depth=2
	c0	cmpltu $b0.0 = $r0.13, $r0.14
;;
;;
	c0	brf $b0.0, LBB8_2
;;
LBB8_8::                                ## %getdata.exit
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	add $r0.14 = $r0.13, 1
;;
	c0	stw 0[$r0.24] = $r0.14
	c0	cmpgt $b0.0 = $r0.41, 2048
;;
	c0	ldbu $r0.20 = 0[$r0.13]
;;
	c0	brf $b0.0, LBB8_78
;;
## BB#30:                               ## %if.then7
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.13 = 0[$r0.25]
	c0	cmpge $b0.0 = $r0.41, $r0.42
;;
;;
	c0	br $b0.0, LBB8_65
;;
## BB#31:                               ## %if.then9
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	cmpeq $b0.0 = $r0.13, 0
;;
;;
	c0	br $b0.0, LBB8_57
;;
## BB#32:                               ## %if.then11
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB8_53
;;
## BB#33:                               ## %if.then13
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.14 = 0[$r0.29]
;;
	c0	ldw $r0.13 = 0[$r0.28]
;;
	c0	ldw $r0.12 = 0[$r0.26]
;;
	c0	cmplt $b0.0 = $r0.14, $r0.13
;;
;;
	c0	br $b0.0, LBB8_40
;;
## BB#34:                               ## %while.body.lr.ph.i482
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.16 = 0[$r0.62]
	c0	sub $r0.15 = $r0.33, $r0.12
;;
LBB8_35::                               ## %while.body.i486
                                        ##   Parent Loop BB8_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	cmpne $b0.0 = $r0.12, 0
;;
;;
	c0	br $b0.0, LBB8_37
;;
## BB#36:                               ## %if.then2.i.i491
                                        ##   in Loop: Header=BB8_35 Depth=2
	c0	add $r0.17 = $r0.16, 7
;;
	c0	and $r0.16 = $r0.17, -8
	c0	shru $r0.17 = $r0.17, $r0.63
;;
	c0	stw 0[$r0.62] = $r0.16
	c0	add $r0.17 = $r0.57, $r0.17
;;
	c0	stb 0[$r0.17] = $r0.23
	c0	goto LBB8_38
;;
LBB8_37::                               ## %if.end5.i.i510
                                        ##   in Loop: Header=BB8_35 Depth=2
	c0	and $r0.17 = $r0.16, 7
	c0	shru $r0.18 = $r0.16, $r0.63
;;
	c0	sub $r0.17 = $r0.15, $r0.17
;;
	c0	shl $r0.17 = $r0.61, $r0.17
	c0	add $r0.18 = $r0.57, $r0.18
;;
	c0	stb 2[$r0.18] = $r0.17
	c0	shru $r0.19 = $r0.17, $r0.27
	c0	shru $r0.17 = $r0.17, $r0.58
;;
	c0	stb 1[$r0.18] = $r0.19
;;
	c0	ldb $r0.19 = 0[$r0.18]
	c0	add $r0.16 = $r0.12, $r0.16
;;
;;
	c0	or $r0.17 = $r0.19, $r0.17
;;
	c0	stb 0[$r0.18] = $r0.17
;;
	c0	stw 0[$r0.62] = $r0.16
;;
LBB8_38::                               ## %putcode.exit.i514
                                        ##   in Loop: Header=BB8_35 Depth=2
	c0	shl $r0.13 = $r0.13, $r0.34
	c0	add $r0.15 = $r0.15, -1
	c0	add $r0.12 = $r0.12, 1
;;
	c0	cmpge $b0.0 = $r0.14, $r0.13
;;
;;
	c0	br $b0.0, LBB8_35
;;
## BB#39:                               ## %while.cond.while.end_crit_edge.i515
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	stw 0[$r0.26] = $r0.12
;;
	c0	stw 0[$r0.28] = $r0.13
;;
LBB8_40::                               ## %if.end.i446
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	cmpne $b0.0 = $r0.12, 0
;;
;;
	c0	brf $b0.0, LBB8_41
;;
## BB#42:                               ## %if.end5.i458
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.13 = 0[$r0.62]
	c0	cmpne $b0.0 = $r0.11, 1
;;
;;
	c0	and $r0.14 = $r0.13, 7
	c0	br $b0.0, LBB8_45
;;
## BB#43:                               ## %if.end5.i458
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	cmpeq $b0.0 = $r0.12, 8
;;
;;
	c0	br $b0.0, LBB8_45
;;
## BB#44:                               ## %if.end5.i458
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	cmpeq $b0.0 = $r0.14, 0
;;
;;
	c0	br $b0.0, LBB8_46
;;
	c0	goto LBB8_45
;;
LBB8_78::                               ## %if.end38
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.13 = 0[$r0.25]
	c0	add $r0.41 = $r0.41, 8
;;
;;
	c0	cmpeq $b0.0 = $r0.13, 0
;;
;;
	c0	br $b0.0, LBB8_80
;;
	c0	goto LBB8_79
;;
LBB8_65::                               ## %if.else27
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	cmpne $b0.0 = $r0.13, 0
	c0	mov $r0.41 = $r0.27
	c0	mov $r0.42 = $r0.23
;;
;;
	c0	br $b0.0, LBB8_79
;;
## BB#66:                               ## %if.then29
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB8_74
;;
## BB#67:                               ## %if.end.i258
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	sh3add $r0.12 = $r0.11, $r0.30
;;
	c0	ldw $r0.12 = 0[$r0.12]
;;
;;
	c0	shru $r0.12 = $r0.12, $r0.31
;;
	c0	and $r0.14 = $r0.12, 2047
;;
	c0	cmpeq $b0.0 = $r0.14, 0
;;
;;
	c0	br $b0.0, LBB8_73
;;
## BB#68:                               ## %for.body.lr.ph.i261
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.12 = 0[$r0.32]
;;
;;
	c0	sh3add $r0.13 = $r0.12, $r0.30
;;
	c0	add $r0.13 = $r0.13, 4
;;
LBB8_69::                               ## %for.body.i264
                                        ##   Parent Loop BB8_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	cmpne $b0.0 = $r0.14, $r0.12
;;
;;
	c0	br $b0.0, LBB8_71
;;
## BB#70:                               ## %for.body.for.inc_crit_edge.i266
                                        ##   in Loop: Header=BB8_69 Depth=2
	c0	ldw $r0.14 = 0[$r0.13]
	c0	goto LBB8_72
;;
LBB8_71::                               ## %land.lhs.true.i271
                                        ##   in Loop: Header=BB8_69 Depth=2
	c0	sh3add $r0.14 = $r0.14, $r0.30
;;
	c0	ldw $r0.14 = 4[$r0.14]
;;
;;
	c0	shru $r0.15 = $r0.14, $r0.31
;;
	c0	zxtb $r0.15 = $r0.15
;;
	c0	cmpeq $b0.0 = $r0.15, $r0.20
;;
;;
	c0	br $b0.0, LBB8_74
;;
LBB8_72::                               ## %for.inc.i275
                                        ##   in Loop: Header=BB8_69 Depth=2
	c0	and $r0.14 = $r0.14, 2047
;;
	c0	cmpne $b0.0 = $r0.14, 0
;;
;;
	c0	br $b0.0, LBB8_69
;;
LBB8_73::                               ## %if.then33
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	mov $r0.3 = $r0.11
	c0	mov $r0.4 = $r0.20
	c0	stw 96[$r0.1] = $r0.23
;;
	c0	stw 104[$r0.1] = $r0.39
;;
	c0	stw 100[$r0.1] = $r0.40
	c0	mov $r0.60 = $r0.24
;;
	c0	stw 92[$r0.1] = $r0.25
;;
	c0	stw 88[$r0.1] = $r0.26
;;
	c0	stw 84[$r0.1] = $r0.27
;;
	c0	stw 80[$r0.1] = $r0.28
;;
	c0	stw 76[$r0.1] = $r0.29
;;
	c0	stw 72[$r0.1] = $r0.30
;;
	c0	stw 68[$r0.1] = $r0.31
;;
	c0	stw 64[$r0.1] = $r0.32
;;
	c0	stw 60[$r0.1] = $r0.33
;;
	c0	stw 56[$r0.1] = $r0.34
;;
	c0	stw 52[$r0.1] = $r0.35
;;
	c0	stw 48[$r0.1] = $r0.36
;;
	c0	stw 44[$r0.1] = $r0.37
;;
.call add_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	stw 40[$r0.1] = $r0.20
	c0	call $l0.0 = add_dict
;;
	c0	ldw $r0.20 = 40[$r0.1]
;;
	c0	ldw $r0.37 = 44[$r0.1]
;;
	c0	ldw $r0.36 = 48[$r0.1]
;;
	c0	ldw $r0.35 = 52[$r0.1]
;;
	c0	ldw $r0.34 = 56[$r0.1]
;;
	c0	ldw $r0.33 = 60[$r0.1]
;;
	c0	ldw $r0.32 = 64[$r0.1]
;;
	c0	ldw $r0.31 = 68[$r0.1]
;;
	c0	ldw $r0.30 = 72[$r0.1]
;;
	c0	ldw $r0.29 = 76[$r0.1]
;;
	c0	ldw $r0.28 = 80[$r0.1]
;;
	c0	ldw $r0.27 = 84[$r0.1]
;;
	c0	ldw $r0.26 = 88[$r0.1]
;;
	c0	ldw $r0.25 = 92[$r0.1]
	c0	mov $r0.24 = $r0.60
;;
	c0	ldw $r0.40 = 100[$r0.1]
;;
	c0	ldw $r0.39 = 104[$r0.1]
;;
	c0	ldw $r0.38 = 108[$r0.1]
;;
	c0	ldw $r0.23 = 96[$r0.1]
;;
LBB8_74::                               ## %if.end35
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.12 = 0[$r0.35]
;;
	c0	ldw $r0.11 = 0[$r0.62]
;;
	c0	cmpne $b0.0 = $r0.12, -5
;;
;;
	c0	br $b0.0, LBB8_76
;;
## BB#75:                               ## %if.then.i186
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	add $r0.11 = $r0.11, 7
;;
	c0	and $r0.11 = $r0.11, -8
;;
	c0	stw 0[$r0.36] = $r0.11
;;
	c0	stw 0[$r0.62] = $r0.23
;;
	c0	stw 0[$r0.37] = $r0.34
	c0	mov $r0.11 = $r0.23
	c0	goto LBB8_77
;;
LBB8_57::                               ## %if.else
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.14 = 36[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.14, 1
	c0	cmplt $b0.0 = $r0.14, 4
	c0	mov $r0.41 = $r0.27
;;
	c0	stw 36[$r0.1] = $r0.13
	c0	mov $r0.42 = $r0.23
;;
	c0	br $b0.0, LBB8_80
;;
## BB#58:                               ## %if.else
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.14 = 0[$r0.28]
;;
;;
	c0	cmplt $b0.0 = $r0.14, 513
	c0	mov $r0.41 = $r0.27
	c0	stw 36[$r0.1] = $r0.13
;;
	c0	mov $r0.42 = $r0.23
;;
	c0	br $b0.0, LBB8_80
;;
## BB#59:                               ## %if.then24
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.12 = 0[$r0.35]
;;
	c0	ldw $r0.11 = 0[$r0.62]
;;
	c0	cmpne $b0.0 = $r0.12, -5
;;
;;
	c0	br $b0.0, LBB8_61
;;
## BB#60:                               ## %if.then.i318
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	add $r0.11 = $r0.11, 7
;;
	c0	and $r0.11 = $r0.11, -8
;;
	c0	stw 0[$r0.36] = $r0.11
;;
	c0	stw 0[$r0.62] = $r0.23
;;
	c0	stw 0[$r0.37] = $r0.34
	c0	mov $r0.11 = $r0.23
	c0	goto LBB8_62
;;
LBB8_76::                               ## %if.end.i187
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	and $r0.13 = $r0.11, 7
;;
	c0	sub $r0.13 = $r0.58, $r0.13
	c0	shru $r0.14 = $r0.11, $r0.63
;;
	c0	shl $r0.12 = $r0.12, $r0.13
	c0	add $r0.13 = $r0.57, $r0.14
;;
	c0	stb 2[$r0.13] = $r0.12
	c0	shru $r0.14 = $r0.12, $r0.27
	c0	shru $r0.12 = $r0.12, $r0.58
;;
	c0	stb 1[$r0.13] = $r0.14
	c0	add $r0.11 = $r0.11, 8
;;
	c0	ldb $r0.14 = 0[$r0.13]
;;
;;
	c0	or $r0.12 = $r0.14, $r0.12
;;
	c0	stb 0[$r0.13] = $r0.12
;;
	c0	stw 0[$r0.62] = $r0.11
;;
LBB8_77::                               ## %putcode.exit210
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	add $r0.12 = $r0.11, 8
	c0	shru $r0.11 = $r0.11, $r0.63
;;
	c0	add $r0.11 = $r0.11, $r0.57
;;
	c0	stb 2[$r0.11] = $r0.23
;;
	c0	stb 1[$r0.11] = $r0.23
;;
	c0	stw 0[$r0.62] = $r0.12
;;
	c0	stw 0[$r0.25] = $r0.34
	c0	mov $r0.41 = $r0.27
	c0	mov $r0.42 = $r0.23
	c0	mov $r0.11 = $r0.23
;;
	c0	mov $r0.12 = $r0.23
	c0	mov $r0.13 = $r0.34
;;
LBB8_79::                               ## %if.end38.if.end45_crit_edge
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.15 = 0[$r0.35]
	c0	goto LBB8_82
;;
LBB8_41::                               ## %if.then2.i451
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.12 = 0[$r0.62]
;;
;;
	c0	add $r0.12 = $r0.12, 7
;;
	c0	shru $r0.13 = $r0.12, $r0.63
	c0	and $r0.12 = $r0.12, -8
;;
	c0	stw 0[$r0.62] = $r0.12
	c0	add $r0.12 = $r0.57, $r0.13
;;
	c0	stb 0[$r0.12] = $r0.23
	c0	goto LBB8_46
;;
LBB8_45::                               ## %if.end12.i477
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	sub $r0.15 = $r0.33, $r0.12
	c0	shru $r0.16 = $r0.13, $r0.63
;;
	c0	sub $r0.14 = $r0.15, $r0.14
;;
	c0	shl $r0.14 = $r0.11, $r0.14
	c0	add $r0.15 = $r0.57, $r0.16
;;
	c0	stb 2[$r0.15] = $r0.14
	c0	shru $r0.16 = $r0.14, $r0.27
	c0	shru $r0.14 = $r0.14, $r0.58
;;
	c0	stb 1[$r0.15] = $r0.16
	c0	add $r0.12 = $r0.13, $r0.12
;;
	c0	ldb $r0.13 = 0[$r0.15]
;;
;;
	c0	or $r0.13 = $r0.13, $r0.14
;;
	c0	stb 0[$r0.15] = $r0.13
;;
	c0	stw 0[$r0.62] = $r0.12
;;
LBB8_46::                               ## %if.end.i421
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	sh3add $r0.12 = $r0.11, $r0.30
;;
	c0	ldw $r0.12 = 0[$r0.12]
;;
;;
	c0	shru $r0.12 = $r0.12, $r0.31
;;
	c0	and $r0.14 = $r0.12, 2047
;;
	c0	cmpeq $b0.0 = $r0.14, 0
;;
;;
	c0	br $b0.0, LBB8_52
;;
## BB#47:                               ## %for.body.lr.ph.i424
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.12 = 0[$r0.32]
;;
;;
	c0	sh3add $r0.13 = $r0.12, $r0.30
;;
	c0	add $r0.13 = $r0.13, 4
;;
LBB8_48::                               ## %for.body.i427
                                        ##   Parent Loop BB8_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	cmpne $b0.0 = $r0.14, $r0.12
;;
;;
	c0	br $b0.0, LBB8_50
;;
## BB#49:                               ## %for.body.for.inc_crit_edge.i429
                                        ##   in Loop: Header=BB8_48 Depth=2
	c0	ldw $r0.14 = 0[$r0.13]
	c0	goto LBB8_51
;;
LBB8_50::                               ## %land.lhs.true.i434
                                        ##   in Loop: Header=BB8_48 Depth=2
	c0	sh3add $r0.14 = $r0.14, $r0.30
;;
	c0	ldw $r0.14 = 4[$r0.14]
;;
;;
	c0	shru $r0.15 = $r0.14, $r0.31
;;
	c0	zxtb $r0.15 = $r0.15
;;
	c0	cmpeq $b0.0 = $r0.15, $r0.20
;;
;;
	c0	br $b0.0, LBB8_53
;;
LBB8_51::                               ## %for.inc.i438
                                        ##   in Loop: Header=BB8_48 Depth=2
	c0	and $r0.14 = $r0.14, 2047
;;
	c0	cmpne $b0.0 = $r0.14, 0
;;
;;
	c0	br $b0.0, LBB8_48
;;
LBB8_52::                               ## %if.then17
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	mov $r0.3 = $r0.11
	c0	mov $r0.4 = $r0.20
	c0	stw 108[$r0.1] = $r0.38
	c0	mov $r0.60 = $r0.24
;;
.call add_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	stw 40[$r0.1] = $r0.20
	c0	call $l0.0 = add_dict
;;
	c0	ldw $r0.20 = 40[$r0.1]
;;
	c0	ldw $r0.37 = 44[$r0.1]
;;
	c0	ldw $r0.36 = 48[$r0.1]
;;
	c0	ldw $r0.35 = 52[$r0.1]
;;
	c0	ldw $r0.34 = 56[$r0.1]
;;
	c0	ldw $r0.33 = 60[$r0.1]
;;
	c0	ldw $r0.32 = 64[$r0.1]
;;
	c0	ldw $r0.31 = 68[$r0.1]
;;
	c0	ldw $r0.30 = 72[$r0.1]
;;
	c0	ldw $r0.29 = 76[$r0.1]
;;
	c0	ldw $r0.28 = 80[$r0.1]
;;
	c0	ldw $r0.27 = 84[$r0.1]
;;
	c0	ldw $r0.26 = 88[$r0.1]
;;
	c0	ldw $r0.25 = 92[$r0.1]
	c0	mov $r0.24 = $r0.60
;;
	c0	ldw $r0.40 = 100[$r0.1]
;;
	c0	ldw $r0.39 = 104[$r0.1]
;;
	c0	ldw $r0.38 = 108[$r0.1]
;;
	c0	ldw $r0.23 = 96[$r0.1]
;;
LBB8_53::                               ## %if.end19
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.12 = 0[$r0.26]
;;
	c0	ldw $r0.11 = 0[$r0.62]
;;
	c0	cmpne $b0.0 = $r0.12, 0
;;
;;
	c0	br $b0.0, LBB8_55
;;
## BB#54:                               ## %if.then2.i355
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	add $r0.12 = $r0.11, 7
;;
	c0	and $r0.11 = $r0.12, -8
	c0	shru $r0.12 = $r0.12, $r0.63
;;
	c0	stw 0[$r0.62] = $r0.11
	c0	add $r0.12 = $r0.57, $r0.12
;;
	c0	stb 0[$r0.12] = $r0.23
	c0	goto LBB8_56
;;
LBB8_55::                               ## %if.end5.i359
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	shru $r0.13 = $r0.11, $r0.63
;;
	c0	add $r0.13 = $r0.13, $r0.57
	c0	add $r0.11 = $r0.11, $r0.12
;;
	c0	stb 2[$r0.13] = $r0.23
;;
	c0	stb 1[$r0.13] = $r0.23
;;
	c0	stw 0[$r0.62] = $r0.11
;;
LBB8_56::                               ## %putcode.exit373
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	add $r0.11 = $r0.11, 7
;;
	c0	and $r0.12 = $r0.11, -8
	c0	shru $r0.11 = $r0.11, $r0.63
;;
	c0	stw 0[$r0.62] = $r0.12
	c0	add $r0.11 = $r0.57, $r0.11
;;
	c0	stb 0[$r0.11] = $r0.23
;;
	c0	stw 0[$r0.25] = $r0.23
	c0	mov $r0.41 = $r0.27
	c0	mov $r0.42 = $r0.23
	c0	mov $r0.11 = $r0.23
;;
	c0	mov $r0.12 = $r0.23
	c0	goto LBB8_80
;;
LBB8_61::                               ## %if.end.i319
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	and $r0.13 = $r0.11, 7
;;
	c0	sub $r0.13 = $r0.58, $r0.13
	c0	shru $r0.14 = $r0.11, $r0.63
;;
	c0	shl $r0.12 = $r0.12, $r0.13
	c0	add $r0.13 = $r0.57, $r0.14
;;
	c0	stb 2[$r0.13] = $r0.12
	c0	shru $r0.14 = $r0.12, $r0.27
	c0	shru $r0.12 = $r0.12, $r0.58
;;
	c0	stb 1[$r0.13] = $r0.14
	c0	add $r0.11 = $r0.11, 8
;;
	c0	ldb $r0.14 = 0[$r0.13]
;;
;;
	c0	or $r0.12 = $r0.14, $r0.12
;;
	c0	stb 0[$r0.13] = $r0.12
;;
	c0	stw 0[$r0.62] = $r0.11
;;
LBB8_62::                               ## %putcode.exit342
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	and $r0.12 = $r0.11, 7
	c0	shru $r0.13 = $r0.11, $r0.63
;;
	c0	sub $r0.12 = $r0.58, $r0.12
;;
	c0	shl $r0.12 = $r0.61, $r0.12
	c0	add $r0.13 = $r0.57, $r0.13
;;
	c0	stb 2[$r0.13] = $r0.12
	c0	shru $r0.14 = $r0.12, $r0.27
	c0	shru $r0.12 = $r0.12, $r0.58
;;
	c0	stb 1[$r0.13] = $r0.14
	c0	add $r0.11 = $r0.11, 8
;;
	c0	ldb $r0.14 = 0[$r0.13]
;;
;;
	c0	or $r0.12 = $r0.12, $r0.14
;;
	c0	stb 0[$r0.13] = $r0.12
;;
	c0	stw 0[$r0.62] = $r0.11
;;
	c0	ldw $r0.11 = 20[$r0.1]
	c0	mov $r0.12 = $r0.30
;;
LBB8_63::                               ## %for.body.i291
                                        ##   Parent Loop BB8_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
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
	c0	br $b0.0, LBB8_63
;;
## BB#64:                               ## %init_dict.exit292
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	stw 0[$r0.29] = $r0.38
;;
	c0	stw 0[$r0.26] = $r0.39
;;
	c0	stw 0[$r0.28] = $r0.40
;;
	c0	stw 0[$r0.35] = $r0.23
;;
	c0	stw 0[$r0.25] = $r0.23
;;
	c0	stw 0[$r0.32] = $r0.23
	c0	mov $r0.41 = $r0.27
;;
	c0	stw 36[$r0.1] = $r0.23
	c0	mov $r0.42 = $r0.23
	c0	mov $r0.11 = $r0.23
	c0	mov $r0.12 = $r0.23
;;
LBB8_80::                               ## %if.then40
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.14 = 0[$r0.62]
;;
;;
	c0	shru $r0.13 = $r0.14, $r0.63
	c0	and $r0.15 = $r0.14, 7
	c0	add $r0.16 = $r0.14, 8
;;
	c0	sub $r0.15 = $r0.58, $r0.15
	c0	add $r0.13 = $r0.57, $r0.13
;;
	c0	shl $r0.15 = $r0.20, $r0.15
;;
	c0	stb 2[$r0.13] = $r0.15
	c0	shru $r0.17 = $r0.15, $r0.27
	c0	shru $r0.15 = $r0.15, $r0.58
;;
	c0	stb 1[$r0.13] = $r0.17
;;
	c0	ldb $r0.17 = 0[$r0.13]
;;
;;
	c0	or $r0.15 = $r0.15, $r0.17
;;
	c0	stb 0[$r0.13] = $r0.15
;;
	c0	stw 0[$r0.62] = $r0.16
;;
	c0	ldw $r0.15 = 0[$r0.35]
;;
;;
	c0	cmpne $b0.0 = $r0.20, $r0.15
	c0	mov $r0.13 = $r0.23
;;
;;
	c0	br $b0.0, LBB8_82
;;
## BB#81:                               ## %if.then43
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	and $r0.13 = $r0.16, 7
	c0	shru $r0.15 = $r0.16, $r0.63
;;
	c0	sub $r0.13 = $r0.58, $r0.13
;;
	c0	shl $r0.13 = $r0.34, $r0.13
	c0	add $r0.15 = $r0.57, $r0.15
;;
	c0	stb 2[$r0.15] = $r0.13
	c0	shru $r0.16 = $r0.13, $r0.27
	c0	shru $r0.13 = $r0.13, $r0.58
;;
	c0	stb 1[$r0.15] = $r0.16
	c0	add $r0.14 = $r0.14, 16
;;
	c0	ldb $r0.16 = 0[$r0.15]
;;
;;
	c0	or $r0.13 = $r0.13, $r0.16
;;
	c0	stb 0[$r0.15] = $r0.13
;;
	c0	stw 0[$r0.62] = $r0.14
	c0	mov $r0.13 = $r0.23
	c0	mov $r0.15 = $r0.20
;;
LBB8_82::                               ## %if.end45
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	cmpne $b0.0 = $r0.20, $r0.15
;;
;;
	c0	br $b0.0, LBB8_84
;;
## BB#83:                               ## %if.then48
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	add $r0.14 = $r0.20, 51
;;
	c0	zxtb $r0.14 = $r0.14
;;
	c0	stw 0[$r0.35] = $r0.14
;;
LBB8_84::                               ## %if.end50
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	cmpne $b0.0 = $r0.11, 0
;;
;;
	c0	brf $b0.0, LBB8_85
;;
## BB#86:                               ## %if.end.i113
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	mov $r0.14 = dict
;;
	c0	sh3add $r0.15 = $r0.11, $r0.14
;;
	c0	ldw $r0.15 = 0[$r0.15]
;;
;;
	c0	shru $r0.15 = $r0.15, $r0.31
;;
	c0	and $r0.15 = $r0.15, 2047
;;
	c0	cmpeq $b0.0 = $r0.15, 0
;;
;;
	c0	br $b0.0, LBB8_93
;;
## BB#87:                               ## %for.body.lr.ph.i
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.16 = 0[$r0.32]
;;
;;
	c0	sh3add $r0.17 = $r0.16, $r0.14
;;
	c0	add $r0.17 = $r0.17, 4
;;
LBB8_88::                               ## %for.body.i115
                                        ##   Parent Loop BB8_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	cmpne $b0.0 = $r0.15, $r0.16
;;
;;
	c0	br $b0.0, LBB8_90
;;
## BB#89:                               ## %for.body.for.inc_crit_edge.i
                                        ##   in Loop: Header=BB8_88 Depth=2
	c0	ldw $r0.18 = 0[$r0.17]
	c0	goto LBB8_91
;;
LBB8_90::                               ## %land.lhs.true.i
                                        ##   in Loop: Header=BB8_88 Depth=2
	c0	sh3add $r0.18 = $r0.15, $r0.14
;;
	c0	ldw $r0.18 = 4[$r0.18]
;;
;;
	c0	shru $r0.19 = $r0.18, $r0.31
;;
	c0	zxtb $r0.19 = $r0.19
;;
	c0	cmpeq $b0.0 = $r0.19, $r0.20
;;
;;
	c0	br $b0.0, LBB8_92
;;
LBB8_91::                               ## %for.inc.i
                                        ##   in Loop: Header=BB8_88 Depth=2
	c0	and $r0.15 = $r0.18, 2047
;;
	c0	cmpeq $b0.0 = $r0.15, 0
;;
;;
	c0	brf $b0.0, LBB8_88
;;
LBB8_93::                               ## %if.end56
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	cmpne $b0.0 = $r0.13, 0
;;
;;
	c0	brf $b0.0, LBB8_94
;;
## BB#95:                               ## %if.then60
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.14 = 0[$r0.29]
;;
	c0	ldw $r0.13 = 0[$r0.28]
;;
	c0	ldw $r0.60 = 0[$r0.26]
;;
	c0	cmplt $b0.0 = $r0.14, $r0.13
;;
;;
	c0	br $b0.0, LBB8_102
;;
## BB#96:                               ## %while.body.lr.ph.i
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.16 = 0[$r0.62]
	c0	sub $r0.15 = $r0.33, $r0.60
;;
LBB8_97::                               ## %while.body.i
                                        ##   Parent Loop BB8_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	cmpne $b0.0 = $r0.60, 0
;;
;;
	c0	br $b0.0, LBB8_99
;;
## BB#98:                               ## %if.then2.i.i
                                        ##   in Loop: Header=BB8_97 Depth=2
	c0	add $r0.17 = $r0.16, 7
;;
	c0	and $r0.16 = $r0.17, -8
	c0	shru $r0.17 = $r0.17, $r0.63
	c0	mov $r0.18 = 0
;;
	c0	stw 0[$r0.62] = $r0.16
	c0	add $r0.17 = $r0.57, $r0.17
;;
	c0	stb 0[$r0.17] = $r0.18
	c0	goto LBB8_100
;;
LBB8_99::                               ## %if.end5.i.i
                                        ##   in Loop: Header=BB8_97 Depth=2
	c0	and $r0.17 = $r0.16, 7
	c0	shru $r0.18 = $r0.16, $r0.63
;;
	c0	sub $r0.17 = $r0.15, $r0.17
;;
	c0	shl $r0.17 = $r0.61, $r0.17
	c0	add $r0.18 = $r0.57, $r0.18
	c0	mov $r0.19 = 8
;;
	c0	stb 2[$r0.18] = $r0.17
	c0	shru $r0.19 = $r0.17, $r0.19
	c0	shru $r0.17 = $r0.17, $r0.58
;;
	c0	stb 1[$r0.18] = $r0.19
;;
	c0	ldb $r0.19 = 0[$r0.18]
	c0	add $r0.16 = $r0.60, $r0.16
;;
;;
	c0	or $r0.17 = $r0.19, $r0.17
;;
	c0	stb 0[$r0.18] = $r0.17
;;
	c0	stw 0[$r0.62] = $r0.16
;;
LBB8_100::                              ## %putcode.exit.i
                                        ##   in Loop: Header=BB8_97 Depth=2
	c0	mov $r0.17 = 1
;;
	c0	shl $r0.13 = $r0.13, $r0.17
	c0	add $r0.15 = $r0.15, -1
	c0	add $r0.60 = $r0.60, 1
;;
	c0	cmpge $b0.0 = $r0.14, $r0.13
;;
;;
	c0	br $b0.0, LBB8_97
;;
## BB#101:                              ## %while.cond.while.end_crit_edge.i
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	stw 0[$r0.26] = $r0.60
;;
	c0	stw 0[$r0.28] = $r0.13
;;
LBB8_102::                              ## %if.end.i100
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	cmpne $b0.0 = $r0.60, 0
;;
;;
	c0	brf $b0.0, LBB8_103
;;
## BB#104:                              ## %if.end5.i101
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.13 = 0[$r0.62]
	c0	cmpne $b0.0 = $r0.11, 1
;;
;;
	c0	and $r0.14 = $r0.13, 7
	c0	br $b0.0, LBB8_107
;;
## BB#105:                              ## %if.end5.i101
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	cmpeq $b0.0 = $r0.60, 8
;;
;;
	c0	br $b0.0, LBB8_107
;;
## BB#106:                              ## %if.end5.i101
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	cmpeq $b0.0 = $r0.14, 0
;;
;;
	c0	br $b0.0, LBB8_108
;;
	c0	goto LBB8_107
;;
LBB8_85::                               ## %if.then.i110
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	add $r0.15 = $r0.20, 3
;;
LBB8_92::                               ## %if.then54
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	add $r0.12 = $r0.12, 1
	c0	mov $r0.11 = $r0.15
	c0	goto LBB8_1
;;
LBB8_94::                               ## %if.end56.if.end62_crit_edge
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.60 = 0[$r0.26]
	c0	goto LBB8_108
;;
LBB8_103::                              ## %if.then2.i
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	mov $r0.60 = 0
	c0	ldw $r0.13 = 0[$r0.62]
;;
;;
	c0	add $r0.13 = $r0.13, 7
;;
	c0	shru $r0.14 = $r0.13, $r0.63
	c0	and $r0.13 = $r0.13, -8
;;
	c0	stw 0[$r0.62] = $r0.13
	c0	add $r0.13 = $r0.57, $r0.14
;;
	c0	stb 0[$r0.13] = $r0.60
	c0	goto LBB8_108
;;
LBB8_107::                              ## %if.end12.i
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	sub $r0.15 = $r0.33, $r0.60
	c0	shru $r0.16 = $r0.13, $r0.63
;;
	c0	sub $r0.14 = $r0.15, $r0.14
;;
	c0	shl $r0.14 = $r0.11, $r0.14
	c0	add $r0.15 = $r0.57, $r0.16
	c0	mov $r0.16 = 8
;;
	c0	stb 2[$r0.15] = $r0.14
	c0	shru $r0.16 = $r0.14, $r0.16
	c0	shru $r0.14 = $r0.14, $r0.58
;;
	c0	stb 1[$r0.15] = $r0.16
	c0	add $r0.13 = $r0.13, $r0.60
;;
	c0	ldb $r0.16 = 0[$r0.15]
;;
;;
	c0	or $r0.14 = $r0.16, $r0.14
;;
	c0	stb 0[$r0.15] = $r0.14
;;
	c0	stw 0[$r0.62] = $r0.13
;;
LBB8_108::                              ## %if.end62
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	cmpgt $b0.0 = $r0.12, 249
;;
;;
	c0	br $b0.0, LBB8_110
;;
## BB#109:                              ## %if.then66
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	mov $r0.3 = $r0.11
	c0	mov $r0.4 = $r0.20
	c0	mov $r0.59 = $r0.24
	c0	stw 40[$r0.1] = $r0.20
;;
	c0	stw 32[$r0.1] = $r0.41
;;
.call add_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	stw 28[$r0.1] = $r0.42
	c0	call $l0.0 = add_dict
;;
	c0	ldw $r0.42 = 28[$r0.1]
;;
	c0	ldw $r0.41 = 32[$r0.1]
;;
	c0	ldw $r0.20 = 40[$r0.1]
;;
	c0	ldw $r0.37 = 44[$r0.1]
;;
	c0	ldw $r0.36 = 48[$r0.1]
;;
	c0	ldw $r0.35 = 52[$r0.1]
;;
	c0	ldw $r0.34 = 56[$r0.1]
;;
	c0	ldw $r0.33 = 60[$r0.1]
;;
	c0	ldw $r0.32 = 64[$r0.1]
;;
	c0	ldw $r0.31 = 68[$r0.1]
;;
	c0	ldw $r0.30 = 72[$r0.1]
;;
	c0	ldw $r0.29 = 76[$r0.1]
;;
	c0	ldw $r0.28 = 80[$r0.1]
;;
	c0	ldw $r0.27 = 84[$r0.1]
;;
	c0	ldw $r0.26 = 88[$r0.1]
;;
	c0	ldw $r0.25 = 92[$r0.1]
	c0	mov $r0.24 = $r0.59
;;
	c0	ldw $r0.23 = 96[$r0.1]
;;
	c0	ldw $r0.59 = 24[$r0.1]
;;
LBB8_110::                              ## %if.end68
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	add $r0.42 = $r0.60, $r0.42
	c0	add $r0.11 = $r0.20, 3
	c0	mov $r0.12 = 1
	c0	ldw $r0.38 = 108[$r0.1]
;;
	c0	ldw $r0.39 = 104[$r0.1]
;;
	c0	ldw $r0.40 = 100[$r0.1]
	c0	goto LBB8_1
;;
LBB8_9::                                ## %sw.bb
	c0	ldw $l0.0 = 112[$r0.1]
;;
	c0	ldw $r0.63 = 116[$r0.1]
;;
	c0	ldw $r0.62 = 120[$r0.1]
;;
	c0	ldw $r0.61 = 124[$r0.1]
;;
	c0	ldw $r0.60 = 128[$r0.1]
;;
	c0	ldw $r0.59 = 132[$r0.1]
;;
	c0	ldw $r0.58 = 136[$r0.1]
;;
.return ret($r0.3:s32)
	c0	ldw $r0.57 = 140[$r0.1]
	c0	return $r0.1 = $r0.1, 160, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-160, arg() ## @decode
decode::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -160
;;
	c0	stw 140[$r0.1] = $r0.57
;;
	c0	stw 136[$r0.1] = $r0.58
;;
	c0	stw 132[$r0.1] = $r0.59
;;
	c0	stw 128[$r0.1] = $r0.60
;;
	c0	stw 124[$r0.1] = $r0.61
;;
	c0	stw 120[$r0.1] = $r0.62
;;
	c0	stw 116[$r0.1] = $r0.63
;;
	c0	stw 112[$r0.1] = $l0.0
	c0	mov $r0.61 = 0
	c0	mov $r0.20 = compress
;;
	c0	stw 96[$r0.1] = $r0.20
	c0	mov $r0.59 = c2
;;
	c0	mov $r0.60 = baddr
	c0	mov $r0.21 = escape
;;
	c0	stw 92[$r0.1] = $r0.21
	c0	mov $r0.40 = codedone
;;
	c0	stw 32[$r0.1] = $r0.40
	c0	mov $r0.22 = eaddr
;;
	c0	stw 88[$r0.1] = $r0.22
	c0	mov $r0.23 = 3
;;
	c0	stw 28[$r0.1] = $r0.23
	c0	mov $r0.24 = codebuf
;;
	c0	stw 84[$r0.1] = $r0.24
	c0	mov $r0.25 = 8
;;
	c0	stw 20[$r0.1] = $r0.25
	c0	mov $r0.26 = 24
;;
	c0	stw 80[$r0.1] = $r0.26
	c0	mov $r0.27 = dict
;;
	c0	stw 76[$r0.1] = $r0.27
	c0	mov $r0.28 = -6144
;;
	c0	stw 72[$r0.1] = $r0.28
	c0	mov $r0.29 = c1
;;
	c0	stw 68[$r0.1] = $r0.29
	c0	mov $r0.30 = 259
;;
	c0	stw 64[$r0.1] = $r0.30
	c0	mov $r0.31 = 9
;;
	c0	stw 60[$r0.1] = $r0.31
	c0	mov $r0.32 = c3
;;
	c0	stw 56[$r0.1] = $r0.32
	c0	mov $r0.33 = 512
;;
	c0	stw 52[$r0.1] = $r0.33
	c0	mov $r0.34 = last
;;
	c0	stw 48[$r0.1] = $r0.34
	c0	mov $r0.11 = 31
;;
	c0	stw 24[$r0.1] = $r0.11
	c0	mov $r0.35 = 1
;;
	c0	stw 16[$r0.1] = $r0.35
	c0	mov $r0.11 = -1
;;
	c0	stw 100[$r0.1] = $r0.11
	c0	mov $r0.36 = 251
;;
	c0	stw 44[$r0.1] = $r0.36
	c0	mov $r0.37 = 11
;;
	c0	stw 40[$r0.1] = $r0.37
	c0	mov $r0.11 = eout
;;
	c0	stw 108[$r0.1] = $r0.11
	c0	mov $r0.11 = decode.str
;;
	c0	stw 104[$r0.1] = $r0.11
	c0	add $r0.38 = $r0.11, 250
;;
	c0	stw 36[$r0.1] = $r0.38
	c0	mov $r0.62 = 32
	c0	mov $r0.58 = $r0.61
;;
LBB9_1::                                ## %for.condthread-pre-split
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB9_2 Depth 2
                                        ##       Child Loop BB9_14 Depth 3
                                        ##       Child Loop BB9_48 Depth 3
                                        ##     Child Loop BB9_24 Depth 2
                                        ##     Child Loop BB9_28 Depth 2
                                        ##     Child Loop BB9_35 Depth 2
                                        ##     Child Loop BB9_57 Depth 2
	c0	ldw $r0.12 = 0[$r0.20]
	c0	mov $r0.11 = $r0.58
;;
LBB9_2::                                ## %for.cond
                                        ##   Parent Loop BB9_1 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB9_14 Depth 3
                                        ##       Child Loop BB9_48 Depth 3
	c0	ldw $r0.14 = 0[$r0.59]
	c0	cmpne $b0.0 = $r0.12, 0
;;
;;
	c0	slct $r0.13 = $b0.0, $r0.14, 8
;;
	c0	cmpne $b0.0 = $r0.13, 0
;;
;;
	c0	brf $b0.0, LBB9_3
;;
## BB#4:                                ## %if.end.i
                                        ##   in Loop: Header=BB9_2 Depth=2
	c0	ldw $r0.15 = 0[$r0.40]
;;
;;
	c0	cmpeq $b0.0 = $r0.15, 0
;;
;;
	c0	br $b0.0, LBB9_7
;;
## BB#5:                                ## %if.then1.i
                                        ##   in Loop: Header=BB9_2 Depth=2
	c0	cmplt $b0.0 = $r0.15, 0
;;
;;
	c0	br $b0.0, LBB9_62
;;
## BB#6:                                ## %getcode.exit.thread170
                                        ##   in Loop: Header=BB9_2 Depth=2
	c0	stw 0[$r0.40] = $r0.61
	c0	mov $r0.15 = $r0.28
	c0	mov $r0.16 = $r0.27
;;
LBB9_14::                               ## %for.body.i
                                        ##   Parent Loop BB9_1 Depth=1
                                        ##     Parent Loop BB9_2 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	c0	ldw $r0.12 = 0[$r0.16]
	c0	and $r0.13 = $r0.15, 522240
;;
;;
	c0	and $r0.12 = $r0.12, -4194304
;;
	c0	stw 0[$r0.16] = $r0.12
	c0	add $r0.15 = $r0.15, 2048
	c0	add $r0.12 = $r0.16, 8
;;
	c0	ldw $r0.14 = 4[$r0.16]
	c0	cmpne $b0.0 = $r0.15, 4190208
;;
;;
	c0	and $r0.14 = $r0.14, -524288
;;
	c0	or $r0.13 = $r0.14, $r0.13
;;
	c0	stw 4[$r0.16] = $r0.13
	c0	mov $r0.16 = $r0.12
	c0	br $b0.0, LBB9_14
;;
## BB#15:                               ## %init_dict.exit
                                        ##   in Loop: Header=BB9_2 Depth=2
	c0	stw 0[$r0.29] = $r0.30
;;
	c0	stw 0[$r0.59] = $r0.31
;;
	c0	stw 0[$r0.32] = $r0.33
;;
	c0	stw 0[$r0.21] = $r0.61
;;
	c0	stw 0[$r0.20] = $r0.61
;;
	c0	stw 0[$r0.34] = $r0.61
	c0	mov $r0.12 = $r0.61
	c0	goto LBB9_2
;;
LBB9_3::                                ## %getcode.exit.thread
                                        ##   in Loop: Header=BB9_2 Depth=2
	c0	ldw $r0.13 = 0[$r0.60]
;;
;;
	c0	add $r0.13 = $r0.13, 7
;;
	c0	and $r0.13 = $r0.13, -8
;;
	c0	stw 0[$r0.60] = $r0.13
	c0	mov $r0.57 = $r0.61
;;
LBB9_16::                               ## %sw.epilog
                                        ##   in Loop: Header=BB9_2 Depth=2
	c0	cmpeq $b0.0 = $r0.12, 0
;;
;;
	c0	br $b0.0, LBB9_38
;;
## BB#17:                               ## %if.then
                                        ##   in Loop: Header=BB9_2 Depth=2
	c0	cmpeq $b0.0 = $r0.57, 2
;;
;;
	c0	br $b0.0, LBB9_22
;;
## BB#18:                               ## %if.then
                                        ##   in Loop: Header=BB9_2 Depth=2
	c0	cmpeq $b0.0 = $r0.57, 1
;;
;;
	c0	br $b0.0, LBB9_21
;;
## BB#19:                               ## %if.then
                                        ##   in Loop: Header=BB9_2 Depth=2
	c0	cmpne $b0.0 = $r0.57, 0
;;
;;
	c0	br $b0.0, LBB9_23
;;
## BB#20:                               ## %sw.bb6
                                        ##   in Loop: Header=BB9_2 Depth=2
	c0	add $r0.12 = $r0.13, 7
;;
	c0	and $r0.12 = $r0.12, -8
;;
	c0	stw 0[$r0.60] = $r0.12
;;
	c0	stw 0[$r0.20] = $r0.61
	c0	mov $r0.12 = $r0.61
	c0	goto LBB9_2
;;
LBB9_7::                                ## %if.end5.i
                                        ##   in Loop: Header=BB9_2 Depth=2
	c0	ldw $r0.15 = 0[$r0.60]
;;
	c0	ldw $r0.16 = 0[$r0.22]
;;
;;
	c0	cmpltu $b0.0 = $r0.15, $r0.16
;;
;;
	c0	brf $b0.0, LBB9_8
;;
## BB#9:                                ## %getcode.exit
                                        ##   in Loop: Header=BB9_2 Depth=2
	c0	and $r0.16 = $r0.15, 7
	c0	shru $r0.17 = $r0.15, $r0.23
;;
	c0	add $r0.17 = $r0.24, $r0.17
	c0	sub $r0.18 = $r0.62, $r0.13
	c0	add $r0.13 = $r0.15, $r0.13
;;
	c0	ldb $r0.15 = 0[$r0.17]
;;
	c0	ldbu $r0.19 = 1[$r0.17]
;;
	c0	shl $r0.15 = $r0.15, $r0.25
;;
	c0	or $r0.15 = $r0.15, $r0.19
	c0	ldbu $r0.17 = 2[$r0.17]
;;
	c0	shl $r0.15 = $r0.15, $r0.25
;;
	c0	or $r0.15 = $r0.15, $r0.17
;;
	c0	shl $r0.15 = $r0.15, $r0.25
;;
	c0	shl $r0.15 = $r0.15, $r0.16
;;
	c0	shru $r0.57 = $r0.15, $r0.18
	c0	stw 0[$r0.60] = $r0.13
;;
	c0	cmpgt $b0.0 = $r0.57, -3
;;
;;
	c0	br $b0.0, LBB9_12
;;
## BB#10:                               ## %getcode.exit
                                        ##   in Loop: Header=BB9_2 Depth=2
	c0	add $r0.15 = $r0.57, 5
;;
	c0	cmpltu $b0.0 = $r0.15, 3
	c0	mov $r0.58 = $r0.11
;;
;;
	c0	br $b0.0, LBB9_1
;;
## BB#11:                               ## %getcode.exit
                                        ##   in Loop: Header=BB9_2 Depth=2
	c0	cmpeq $b0.0 = $r0.57, -6
;;
;;
	c0	br $b0.0, LBB9_62
;;
	c0	goto LBB9_16
;;
LBB9_38::                               ## %if.else
                                        ##   in Loop: Header=BB9_2 Depth=2
	c0	ldw $r0.12 = 0[$r0.21]
;;
;;
	c0	cmpne $b0.0 = $r0.57, $r0.12
;;
;;
	c0	br $b0.0, LBB9_51
;;
## BB#39:                               ## %if.then35
                                        ##   in Loop: Header=BB9_2 Depth=2
	c0	ldw $r0.12 = 0[$r0.40]
;;
;;
	c0	cmpeq $b0.0 = $r0.12, 0
;;
;;
	c0	brf $b0.0, LBB9_40
;;
## BB#42:                               ## %if.end5.i105
                                        ##   in Loop: Header=BB9_2 Depth=2
	c0	ldw $r0.12 = 0[$r0.22]
;;
;;
	c0	cmpltu $b0.0 = $r0.13, $r0.12
;;
;;
	c0	brf $b0.0, LBB9_43
;;
## BB#44:                               ## %getcode.exit127
                                        ##   in Loop: Header=BB9_2 Depth=2
	c0	and $r0.12 = $r0.13, 7
	c0	shru $r0.14 = $r0.13, $r0.23
;;
	c0	add $r0.14 = $r0.24, $r0.14
	c0	add $r0.13 = $r0.13, 8
;;
	c0	ldb $r0.15 = 0[$r0.14]
;;
	c0	ldbu $r0.16 = 1[$r0.14]
;;
	c0	shl $r0.15 = $r0.15, $r0.25
;;
	c0	or $r0.15 = $r0.15, $r0.16
	c0	ldbu $r0.14 = 2[$r0.14]
;;
	c0	shl $r0.15 = $r0.15, $r0.25
;;
	c0	or $r0.14 = $r0.15, $r0.14
;;
	c0	shl $r0.14 = $r0.14, $r0.25
;;
	c0	shl $r0.12 = $r0.14, $r0.12
;;
	c0	shru $r0.14 = $r0.12, $r0.26
;;
	c0	cmpeq $b0.0 = $r0.14, 2
	c0	stw 0[$r0.60] = $r0.13
	c0	mov $r0.12 = $r0.28
	c0	mov $r0.13 = $r0.27
;;
;;
	c0	br $b0.0, LBB9_48
;;
## BB#45:                               ## %getcode.exit127
                                        ##   in Loop: Header=BB9_2 Depth=2
	c0	cmpeq $b0.0 = $r0.14, 1
;;
;;
	c0	br $b0.0, LBB9_50
;;
## BB#46:                               ## %getcode.exit127
                                        ##   in Loop: Header=BB9_2 Depth=2
	c0	cmpne $b0.0 = $r0.14, 0
	c0	mov $r0.58 = $r0.11
;;
;;
	c0	br $b0.0, LBB9_1
;;
## BB#47:                               ## %sw.bb37
                                        ##   in Loop: Header=BB9_2 Depth=2
	c0	stw 0[$r0.20] = $r0.35
	c0	mov $r0.12 = $r0.35
	c0	goto LBB9_2
;;
LBB9_12::                               ## %getcode.exit
                                        ##   in Loop: Header=BB9_2 Depth=2
	c0	cmpeq $b0.0 = $r0.57, -2
;;
;;
	c0	br $b0.0, LBB9_62
;;
## BB#13:                               ## %getcode.exit
                                        ##   in Loop: Header=BB9_2 Depth=2
	c0	cmpne $b0.0 = $r0.57, -1
	c0	mov $r0.15 = $r0.28
	c0	mov $r0.16 = $r0.27
;;
;;
	c0	br $b0.0, LBB9_16
;;
	c0	goto LBB9_14
;;
LBB9_48::                               ## %for.body.i97
                                        ##   Parent Loop BB9_1 Depth=1
                                        ##     Parent Loop BB9_2 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	c0	ldw $r0.11 = 0[$r0.13]
	c0	and $r0.14 = $r0.12, 522240
;;
;;
	c0	and $r0.11 = $r0.11, -4194304
;;
	c0	stw 0[$r0.13] = $r0.11
	c0	add $r0.12 = $r0.12, 2048
	c0	add $r0.11 = $r0.13, 8
;;
	c0	ldw $r0.15 = 4[$r0.13]
	c0	cmpne $b0.0 = $r0.12, 4190208
;;
;;
	c0	and $r0.15 = $r0.15, -524288
;;
	c0	or $r0.14 = $r0.15, $r0.14
;;
	c0	stw 4[$r0.13] = $r0.14
	c0	mov $r0.13 = $r0.11
	c0	br $b0.0, LBB9_48
;;
## BB#49:                               ## %init_dict.exit98
                                        ##   in Loop: Header=BB9_2 Depth=2
	c0	stw 0[$r0.29] = $r0.30
;;
	c0	stw 0[$r0.59] = $r0.31
;;
	c0	stw 0[$r0.32] = $r0.33
;;
	c0	stw 0[$r0.21] = $r0.61
;;
	c0	stw 0[$r0.20] = $r0.61
;;
	c0	stw 0[$r0.34] = $r0.61
	c0	mov $r0.12 = $r0.61
	c0	mov $r0.11 = $r0.61
	c0	goto LBB9_2
;;
LBB9_8::                                ## %getcode.exit.thread171
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.12 = 100[$r0.1]
;;
;;
	c0	stw 0[$r0.40] = $r0.12
	c0	mov $r0.58 = $r0.11
	c0	goto LBB9_1
;;
LBB9_40::                               ## %if.then1.i102
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	cmplt $b0.0 = $r0.12, 0
	c0	mov $r0.58 = $r0.11
;;
;;
	c0	br $b0.0, LBB9_1
;;
## BB#41:                               ## %if.end4.i103
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	stw 0[$r0.40] = $r0.61
	c0	mov $r0.58 = $r0.11
	c0	goto LBB9_1
;;
LBB9_43::                               ## %if.then7.i106
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.12 = 100[$r0.1]
;;
;;
	c0	stw 0[$r0.40] = $r0.12
	c0	mov $r0.58 = $r0.11
	c0	goto LBB9_1
;;
LBB9_22::                               ## %sw.bb10
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	add $r0.12 = $r0.14, 1
;;
	c0	stw 0[$r0.59] = $r0.12
;;
	c0	ldw $r0.12 = 0[$r0.32]
;;
;;
	c0	shl $r0.12 = $r0.12, $r0.35
;;
	c0	stw 0[$r0.32] = $r0.12
	c0	mov $r0.58 = $r0.11
	c0	goto LBB9_1
;;
LBB9_21::                               ## %sw.bb8
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	add $r0.12 = $r0.13, 7
;;
	c0	and $r0.12 = $r0.12, -8
;;
	c0	stw 0[$r0.60] = $r0.12
	c0	mov $r0.58 = $r0.11
	c0	goto LBB9_1
;;
LBB9_23::                               ## %for.body.loopexit
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	mov $r0.13 = $r0.38
	c0	mov $r0.14 = $r0.57
;;
LBB9_24::                               ## %for.body
                                        ##   Parent Loop BB9_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	sh3add $r0.14 = $r0.14, $r0.27
;;
	c0	ldw $r0.12 = 4[$r0.14]
	c0	add $r0.63 = $r0.13, -1
;;
;;
	c0	shru $r0.12 = $r0.12, $r0.37
;;
	c0	stb -1[$r0.13] = $r0.12
;;
	c0	ldw $r0.13 = 0[$r0.14]
;;
;;
	c0	and $r0.14 = $r0.13, 2047
;;
	c0	cmpne $b0.0 = $r0.14, 0
	c0	mov $r0.13 = $r0.63
;;
;;
	c0	br $b0.0, LBB9_24
;;
## BB#25:                               ## %for.end
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB9_33
;;
## BB#26:                               ## %if.end.i140
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	sh3add $r0.13 = $r0.11, $r0.27
;;
	c0	ldw $r0.13 = 0[$r0.13]
;;
;;
	c0	shru $r0.13 = $r0.13, $r0.37
;;
	c0	and $r0.15 = $r0.13, 2047
;;
	c0	cmpeq $b0.0 = $r0.15, 0
;;
;;
	c0	br $b0.0, LBB9_32
;;
## BB#27:                               ## %for.body.lr.ph.i143
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.13 = 0[$r0.34]
;;
;;
	c0	sh3add $r0.14 = $r0.13, $r0.27
;;
	c0	add $r0.14 = $r0.14, 4
;;
LBB9_28::                               ## %for.body.i146
                                        ##   Parent Loop BB9_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	cmpne $b0.0 = $r0.15, $r0.13
;;
;;
	c0	br $b0.0, LBB9_30
;;
## BB#29:                               ## %for.body.for.inc_crit_edge.i148
                                        ##   in Loop: Header=BB9_28 Depth=2
	c0	ldw $r0.15 = 0[$r0.14]
	c0	goto LBB9_31
;;
LBB9_30::                               ## %land.lhs.true.i153
                                        ##   in Loop: Header=BB9_28 Depth=2
	c0	sh3add $r0.15 = $r0.15, $r0.27
;;
	c0	ldw $r0.15 = 4[$r0.15]
	c0	zxtb $r0.16 = $r0.12
;;
;;
	c0	shru $r0.17 = $r0.15, $r0.37
;;
	c0	zxtb $r0.17 = $r0.17
;;
	c0	cmpeq $b0.0 = $r0.17, $r0.16
;;
;;
	c0	br $b0.0, LBB9_33
;;
LBB9_31::                               ## %for.inc.i157
                                        ##   in Loop: Header=BB9_28 Depth=2
	c0	and $r0.15 = $r0.15, 2047
;;
	c0	cmpne $b0.0 = $r0.15, 0
;;
;;
	c0	br $b0.0, LBB9_28
;;
LBB9_32::                               ## %if.then19
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	zxtb $r0.4 = $r0.12
	c0	mov $r0.3 = $r0.11
	c0	mov $r0.58 = $r0.23
;;
.call add_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = add_dict
;;
	c0	ldw $r0.40 = 32[$r0.1]
;;
	c0	ldw $r0.38 = 36[$r0.1]
;;
	c0	ldw $r0.37 = 40[$r0.1]
;;
	c0	ldw $r0.36 = 44[$r0.1]
;;
	c0	ldw $r0.35 = 16[$r0.1]
;;
	c0	ldw $r0.34 = 48[$r0.1]
;;
	c0	ldw $r0.33 = 52[$r0.1]
;;
	c0	ldw $r0.32 = 56[$r0.1]
;;
	c0	ldw $r0.31 = 60[$r0.1]
;;
	c0	ldw $r0.30 = 64[$r0.1]
;;
	c0	ldw $r0.29 = 68[$r0.1]
;;
	c0	ldw $r0.28 = 72[$r0.1]
;;
	c0	ldw $r0.27 = 76[$r0.1]
;;
	c0	ldw $r0.26 = 80[$r0.1]
;;
	c0	ldw $r0.25 = 20[$r0.1]
;;
	c0	ldw $r0.24 = 84[$r0.1]
	c0	mov $r0.23 = $r0.58
;;
	c0	ldw $r0.22 = 88[$r0.1]
;;
	c0	ldw $r0.21 = 92[$r0.1]
;;
	c0	ldw $r0.20 = 96[$r0.1]
;;
LBB9_33::                               ## %for.cond20.preheader
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	cmpgeu $b0.0 = $r0.63, $r0.38
	c0	mov $r0.58 = $r0.57
;;
;;
	c0	br $b0.0, LBB9_1
;;
## BB#34:                               ## %for.body22.preheader
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	add $r0.11 = $r0.63, -250
;;
LBB9_35::                               ## %for.body22
                                        ##   Parent Loop BB9_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldw $r0.15 = 108[$r0.1]
;;
;;
	c0	stw 108[$r0.1] = $r0.15
;;
	c0	ldw $r0.12 = 0[$r0.15]
;;
	c0	ldb $r0.13 = 250[$r0.11]
;;
	c0	add $r0.14 = $r0.12, 1
;;
	c0	stw 0[$r0.15] = $r0.14
;;
	c0	stb 0[$r0.12] = $r0.13
;;
	c0	ldbu $r0.12 = 250[$r0.11]
;;
	c0	ldw $r0.13 = 0[$r0.21]
;;
;;
	c0	cmpne $b0.0 = $r0.12, $r0.13
;;
;;
	c0	br $b0.0, LBB9_37
;;
## BB#36:                               ## %if.then27
                                        ##   in Loop: Header=BB9_35 Depth=2
	c0	add $r0.12 = $r0.12, 51
;;
	c0	zxtb $r0.12 = $r0.12
;;
	c0	stw 0[$r0.21] = $r0.12
;;
LBB9_37::                               ## %for.inc29
                                        ##   in Loop: Header=BB9_35 Depth=2
	c0	add $r0.11 = $r0.11, 1
	c0	ldw $r0.12 = 104[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.12, $r0.11
	c0	mov $r0.58 = $r0.57
;;
;;
	c0	br $b0.0, LBB9_1
;;
	c0	goto LBB9_35
;;
LBB9_50::                               ## %sw.epilog40
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	add $r0.12 = $r0.57, 51
	c0	ldw $r0.13 = 24[$r0.1]
;;
;;
	c0	shr $r0.13 = $r0.12, $r0.13
;;
	c0	shru $r0.13 = $r0.13, $r0.26
;;
	c0	add $r0.13 = $r0.12, $r0.13
;;
	c0	and $r0.13 = $r0.13, -256
;;
	c0	sub $r0.12 = $r0.12, $r0.13
;;
	c0	stw 0[$r0.21] = $r0.12
;;
LBB9_51::                               ## %if.end43
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	cmpeq $b0.0 = $r0.57, -5
	c0	mov $r0.12 = $r0.36
;;
;;
	c0	br $b0.0, LBB9_53
;;
## BB#52:                               ## %if.end.i83
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.14 = 108[$r0.1]
;;
;;
	c0	stw 108[$r0.1] = $r0.14
;;
	c0	ldw $r0.12 = 0[$r0.14]
;;
;;
	c0	add $r0.13 = $r0.12, 1
;;
	c0	stw 0[$r0.14] = $r0.13
;;
	c0	stb 0[$r0.12] = $r0.57
	c0	mov $r0.12 = $r0.57
;;
LBB9_53::                               ## %putdata.exit
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	cmpne $b0.0 = $r0.11, 0
;;
;;
	c0	brf $b0.0, LBB9_54
;;
## BB#55:                               ## %if.end.i76
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	mov $r0.63 = $r0.35
	c0	sh3add $r0.13 = $r0.11, $r0.27
;;
	c0	ldw $r0.13 = 0[$r0.13]
;;
;;
	c0	shru $r0.13 = $r0.13, $r0.37
;;
	c0	and $r0.58 = $r0.13, 2047
;;
	c0	cmpeq $b0.0 = $r0.58, 0
;;
;;
	c0	br $b0.0, LBB9_61
;;
## BB#56:                               ## %for.body.lr.ph.i
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.13 = 0[$r0.34]
;;
;;
	c0	sh3add $r0.14 = $r0.13, $r0.27
;;
	c0	add $r0.14 = $r0.14, 4
;;
LBB9_57::                               ## %for.body.i78
                                        ##   Parent Loop BB9_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	cmpne $b0.0 = $r0.58, $r0.13
	c0	mov $r0.35 = $r0.63
;;
;;
	c0	br $b0.0, LBB9_59
;;
## BB#58:                               ## %for.body.for.inc_crit_edge.i
                                        ##   in Loop: Header=BB9_57 Depth=2
	c0	ldw $r0.15 = 0[$r0.14]
	c0	goto LBB9_60
;;
LBB9_59::                               ## %land.lhs.true.i
                                        ##   in Loop: Header=BB9_57 Depth=2
	c0	sh3add $r0.15 = $r0.58, $r0.27
;;
	c0	ldw $r0.15 = 4[$r0.15]
	c0	zxtb $r0.16 = $r0.12
;;
;;
	c0	shru $r0.17 = $r0.15, $r0.37
;;
	c0	zxtb $r0.17 = $r0.17
;;
	c0	cmpeq $b0.0 = $r0.17, $r0.16
;;
;;
	c0	br $b0.0, LBB9_1
;;
LBB9_60::                               ## %for.inc.i
                                        ##   in Loop: Header=BB9_57 Depth=2
	c0	mov $r0.63 = $r0.35
	c0	and $r0.58 = $r0.15, 2047
;;
	c0	cmpne $b0.0 = $r0.58, 0
;;
;;
	c0	br $b0.0, LBB9_57
;;
LBB9_61::                               ## %if.end48
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	add $r0.58 = $r0.57, 3
	c0	zxtb $r0.4 = $r0.12
	c0	mov $r0.3 = $r0.11
	c0	stw 96[$r0.1] = $r0.20
;;
	c0	stw 92[$r0.1] = $r0.21
;;
	c0	stw 88[$r0.1] = $r0.22
;;
	c0	stw 84[$r0.1] = $r0.24
	c0	mov $r0.57 = $r0.25
;;
	c0	stw 80[$r0.1] = $r0.26
;;
	c0	stw 76[$r0.1] = $r0.27
;;
	c0	stw 72[$r0.1] = $r0.28
;;
	c0	stw 68[$r0.1] = $r0.29
;;
	c0	stw 64[$r0.1] = $r0.30
;;
	c0	stw 60[$r0.1] = $r0.31
;;
	c0	stw 56[$r0.1] = $r0.32
;;
	c0	stw 52[$r0.1] = $r0.33
;;
	c0	stw 48[$r0.1] = $r0.34
;;
	c0	stw 44[$r0.1] = $r0.36
;;
	c0	stw 40[$r0.1] = $r0.37
;;
	c0	stw 36[$r0.1] = $r0.38
;;
.call add_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	stw 32[$r0.1] = $r0.40
	c0	call $l0.0 = add_dict
;;
	c0	ldw $r0.40 = 32[$r0.1]
;;
	c0	ldw $r0.38 = 36[$r0.1]
;;
	c0	ldw $r0.37 = 40[$r0.1]
;;
	c0	ldw $r0.36 = 44[$r0.1]
;;
	c0	ldw $r0.34 = 48[$r0.1]
;;
	c0	ldw $r0.33 = 52[$r0.1]
;;
	c0	ldw $r0.32 = 56[$r0.1]
;;
	c0	ldw $r0.31 = 60[$r0.1]
;;
	c0	ldw $r0.30 = 64[$r0.1]
;;
	c0	ldw $r0.29 = 68[$r0.1]
;;
	c0	ldw $r0.28 = 72[$r0.1]
;;
	c0	ldw $r0.27 = 76[$r0.1]
;;
	c0	ldw $r0.26 = 80[$r0.1]
	c0	mov $r0.25 = $r0.57
;;
	c0	ldw $r0.24 = 84[$r0.1]
;;
	c0	ldw $r0.23 = 28[$r0.1]
;;
	c0	ldw $r0.22 = 88[$r0.1]
;;
	c0	ldw $r0.21 = 92[$r0.1]
;;
	c0	ldw $r0.20 = 96[$r0.1]
	c0	mov $r0.35 = $r0.63
	c0	goto LBB9_1
;;
LBB9_54::                               ## %if.then.i74
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	zxtb $r0.11 = $r0.57
;;
	c0	add $r0.58 = $r0.11, 3
	c0	goto LBB9_1
;;
LBB9_62::                               ## %return
	c0	ldw $l0.0 = 112[$r0.1]
;;
	c0	ldw $r0.63 = 116[$r0.1]
;;
	c0	ldw $r0.62 = 120[$r0.1]
;;
	c0	ldw $r0.61 = 124[$r0.1]
;;
	c0	ldw $r0.60 = 128[$r0.1]
;;
	c0	ldw $r0.59 = 132[$r0.1]
;;
	c0	ldw $r0.58 = 136[$r0.1]
;;
.return ret($r0.3:s32)
	c0	ldw $r0.57 = 140[$r0.1]
	c0	return $r0.1 = $r0.1, 160, $l0.0
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


