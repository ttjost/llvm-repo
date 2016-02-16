.section .text

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @getdata
getdata::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
	c0	mov $r0.12 = gE
;;
	c0	mov $r0.11 = gP
	c0	ldw $r0.13 = 0[$r0.12]
;;
	c0	ldw $r0.14 = 0[$r0.11]
;;
;;
	c0	cmpltu $b0.0 = $r0.14, $r0.13
;;
;;
	c0	br $b0.0, LBB0_6
;;
## BB#1:                                ## %if.then
	c0	ldw $r0.13 = 0[$r0.12]
;;
;;
	c0	cmpne $b0.0 = $r0.13, 0
;;
;;
	c0	brf $b0.0, LBB0_2
;;
## BB#3:                                ## %if.end
	c0	ldw $r0.12 = 0[$r0.12]
;;
	c0	ldw $r0.13 = 0[$r0.11]
;;
;;
	c0	cmpleu $b0.0 = $r0.13, $r0.12
;;
;;
	c0	br $b0.0, LBB0_5
;;
## BB#4:                                ## %if.then3
	c0	mov $r0.11 = -6
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	goto LBB0_7
;;
LBB0_2::                                ## %if.then1
	c0	mov $r0.13 = inbuf
	c0	mov $r0.14 = -1
;;
	c0	stw 0[$r0.11] = $r0.13
	c0	add $r0.11 = $r0.13, 7554
;;
	c0	stw 0[$r0.12] = $r0.11
;;
	c0	stw 28[$r0.1] = $r0.14
	c0	goto LBB0_7
;;
LBB0_5::                                ## %if.end4
	c0	mov $r0.12 = -5
	c0	ldw $r0.13 = 0[$r0.11]
;;
;;
	c0	add $r0.13 = $r0.13, 1
;;
	c0	stw 0[$r0.11] = $r0.13
;;
	c0	stw 28[$r0.1] = $r0.12
	c0	goto LBB0_7
;;
LBB0_6::                                ## %if.end5
	c0	ldw $r0.12 = 0[$r0.11]
;;
;;
	c0	add $r0.13 = $r0.12, 1
;;
	c0	stw 0[$r0.11] = $r0.13
;;
	c0	ldbu $r0.11 = 0[$r0.12]
;;
;;
	c0	stw 28[$r0.1] = $r0.11
;;
LBB0_7::                                ## %return
.return ret($r0.3:s32)
	c0	ldw $r0.3 = 28[$r0.1]
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @getcode
getcode::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
	c0	cmpne $b0.0 = $r0.3, 0
;;
	c0	stw 24[$r0.1] = $r0.3
;;
	c0	brf $b0.0, LBB1_1
;;
## BB#2:                                ## %if.end
	c0	mov $r0.12 = codedone
;;
	c0	ldw $r0.11 = 0[$r0.12]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB1_6
;;
## BB#3:                                ## %if.then1
	c0	ldw $r0.11 = 0[$r0.12]
;;
;;
	c0	cmpgt $b0.0 = $r0.11, -1
;;
;;
	c0	brf $b0.0, LBB1_4
;;
## BB#5:                                ## %if.end4
	c0	mov $r0.11 = 0
	c0	mov $r0.13 = -1
;;
	c0	stw 0[$r0.12] = $r0.11
;;
	c0	stw 28[$r0.1] = $r0.13
	c0	goto LBB1_9
;;
LBB1_1::                                ## %if.then
	c0	mov $r0.11 = baddr
	c0	mov $r0.12 = 0
;;
	c0	ldw $r0.13 = 0[$r0.11]
;;
;;
	c0	add $r0.13 = $r0.13, 7
;;
	c0	and $r0.13 = $r0.13, -8
;;
	c0	stw 0[$r0.11] = $r0.13
;;
	c0	stw 28[$r0.1] = $r0.12
	c0	goto LBB1_9
;;
LBB1_6::                                ## %if.end5
	c0	mov $r0.13 = eaddr
	c0	mov $r0.11 = baddr
;;
	c0	ldw $r0.13 = 0[$r0.13]
;;
	c0	ldw $r0.14 = 0[$r0.11]
;;
;;
	c0	cmpltu $b0.0 = $r0.14, $r0.13
;;
;;
	c0	br $b0.0, LBB1_8
;;
## BB#7:                                ## %if.then7
	c0	mov $r0.11 = -1
	c0	mov $r0.13 = -5
;;
	c0	stw 0[$r0.12] = $r0.11
;;
	c0	stw 28[$r0.1] = $r0.13
	c0	goto LBB1_9
;;
LBB1_4::                                ## %if.then3
	c0	mov $r0.11 = -6
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	goto LBB1_9
;;
LBB1_8::                                ## %if.end8
	c0	mov $r0.12 = 3
	c0	mov $r0.13 = codebuf
	c0	mov $r0.14 = 8
;;
	c0	ldw $r0.15 = 0[$r0.11]
	c0	mov $r0.16 = 32
;;
;;
	c0	shru $r0.12 = $r0.15, $r0.12
;;
	c0	add $r0.12 = $r0.13, $r0.12
;;
	c0	stw 20[$r0.1] = $r0.12
;;
	c0	ldb $r0.13 = 0[$r0.12]
;;
	c0	ldbu $r0.15 = 1[$r0.12]
;;
	c0	shl $r0.13 = $r0.13, $r0.14
;;
	c0	or $r0.13 = $r0.13, $r0.15
	c0	ldbu $r0.12 = 2[$r0.12]
;;
	c0	shl $r0.13 = $r0.13, $r0.14
;;
	c0	or $r0.12 = $r0.13, $r0.12
;;
	c0	shl $r0.12 = $r0.12, $r0.14
;;
	c0	stw 16[$r0.1] = $r0.12
;;
	c0	ldw $r0.13 = 0[$r0.11]
;;
;;
	c0	and $r0.13 = $r0.13, 7
;;
	c0	shl $r0.12 = $r0.12, $r0.13
;;
	c0	stw 16[$r0.1] = $r0.12
;;
	c0	ldw $r0.13 = 24[$r0.1]
;;
;;
	c0	sub $r0.13 = $r0.16, $r0.13
;;
	c0	shru $r0.12 = $r0.12, $r0.13
;;
	c0	stw 16[$r0.1] = $r0.12
;;
	c0	ldw $r0.12 = 0[$r0.11]
;;
	c0	ldw $r0.13 = 24[$r0.1]
;;
;;
	c0	add $r0.12 = $r0.12, $r0.13
;;
	c0	stw 0[$r0.11] = $r0.12
;;
	c0	ldw $r0.11 = 16[$r0.1]
;;
;;
	c0	stw 28[$r0.1] = $r0.11
;;
LBB1_9::                                ## %return
.return ret($r0.3:s32)
	c0	ldw $r0.3 = 28[$r0.1]
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @putcode
putcode::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $r0.3
;;
	c0	stw 24[$r0.1] = $r0.4
;;
	c0	ldw $r0.11 = 28[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.11, -5
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
	c0	ldw $r0.11 = 24[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.11, 0
;;
;;
	c0	brf $b0.0, LBB2_3
;;
## BB#4:                                ## %if.end5
	c0	ldw $r0.11 = 24[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 8
;;
;;
	c0	br $b0.0, LBB2_7
;;
## BB#5:                                ## %land.lhs.true
	c0	ldw $r0.11 = 28[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.11, 1
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
	c0	ldw $r0.14 = 0[$r0.11]
	c0	mov $r0.15 = 0
;;
;;
	c0	add $r0.14 = $r0.14, 7
;;
	c0	and $r0.14 = $r0.14, -8
;;
	c0	stw 0[$r0.11] = $r0.14
	c0	shru $r0.11 = $r0.14, $r0.12
;;
	c0	add $r0.11 = $r0.13, $r0.11
;;
	c0	stb 0[$r0.11] = $r0.15
	c0	goto LBB2_8
;;
LBB2_7::                                ## %if.end12
	c0	mov $r0.11 = baddr
	c0	mov $r0.12 = 3
;;
	c0	mov $r0.13 = codebuf
	c0	mov $r0.14 = 24
	c0	ldw $r0.15 = 0[$r0.11]
;;
	c0	mov $r0.16 = 8
;;
	c0	shru $r0.12 = $r0.15, $r0.12
;;
	c0	add $r0.12 = $r0.13, $r0.12
;;
	c0	stw 20[$r0.1] = $r0.12
;;
	c0	ldw $r0.12 = 0[$r0.11]
;;
	c0	ldw $r0.13 = 24[$r0.1]
;;
	c0	and $r0.12 = $r0.12, 7
;;
	c0	sub $r0.13 = $r0.14, $r0.13
	c0	ldw $r0.14 = 28[$r0.1]
;;
	c0	sub $r0.12 = $r0.13, $r0.12
;;
	c0	shl $r0.12 = $r0.14, $r0.12
;;
	c0	stw 28[$r0.1] = $r0.12
;;
	c0	ldw $r0.13 = 20[$r0.1]
;;
;;
	c0	stb 2[$r0.13] = $r0.12
;;
	c0	ldw $r0.12 = 28[$r0.1]
;;
;;
	c0	shru $r0.12 = $r0.12, $r0.16
;;
	c0	stw 28[$r0.1] = $r0.12
;;
	c0	ldw $r0.13 = 20[$r0.1]
;;
;;
	c0	stb 1[$r0.13] = $r0.12
;;
	c0	ldw $r0.12 = 28[$r0.1]
;;
;;
	c0	shru $r0.12 = $r0.12, $r0.16
;;
	c0	stw 28[$r0.1] = $r0.12
;;
	c0	ldw $r0.13 = 20[$r0.1]
;;
;;
	c0	ldb $r0.14 = 0[$r0.13]
;;
;;
	c0	or $r0.12 = $r0.14, $r0.12
;;
	c0	stb 0[$r0.13] = $r0.12
;;
	c0	ldw $r0.12 = 0[$r0.11]
;;
	c0	ldw $r0.13 = 24[$r0.1]
;;
;;
	c0	add $r0.12 = $r0.12, $r0.13
;;
	c0	stw 0[$r0.11] = $r0.12
;;
LBB2_8::                                ## %return
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @putdata
putdata::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
	c0	cmpeq $b0.0 = $r0.3, -5
;;
	c0	stw 28[$r0.1] = $r0.3
;;
	c0	br $b0.0, LBB3_2
;;
## BB#1:                                ## %if.end
	c0	mov $r0.11 = eout
	c0	ldw $r0.12 = 28[$r0.1]
;;
	c0	ldw $r0.13 = 0[$r0.11]
;;
;;
	c0	add $r0.14 = $r0.13, 1
;;
	c0	stw 0[$r0.11] = $r0.14
;;
	c0	stb 0[$r0.13] = $r0.12
;;
LBB3_2::                                ## %return
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @init_dict
init_dict::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
	c0	mov $r0.11 = dict
	c0	mov $r0.12 = -3
;;
	c0	stw 28[$r0.1] = $r0.11
;;
	c0	stw 24[$r0.1] = $r0.12
	c0	add $r0.11 = $r0.11, 16392
	c0	mov $r0.12 = 11
;;
LBB4_1::                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.13 = 28[$r0.1]
;;
;;
	c0	cmpgeu $b0.0 = $r0.13, $r0.11
;;
;;
	c0	br $b0.0, LBB4_4
;;
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB4_1 Depth=1
	c0	ldw $r0.13 = 28[$r0.1]
;;
;;
	c0	ldw $r0.14 = 0[$r0.13]
;;
;;
	c0	and $r0.14 = $r0.14, -2048
;;
	c0	stw 0[$r0.13] = $r0.14
;;
	c0	ldw $r0.13 = 28[$r0.1]
;;
;;
	c0	ldw $r0.14 = 0[$r0.13]
;;
;;
	c0	and $r0.14 = $r0.14, -4192257
;;
	c0	stw 0[$r0.13] = $r0.14
;;
	c0	ldw $r0.13 = 28[$r0.1]
;;
;;
	c0	ldw $r0.14 = 4[$r0.13]
;;
;;
	c0	and $r0.14 = $r0.14, -2048
;;
	c0	stw 4[$r0.13] = $r0.14
;;
	c0	ldw $r0.13 = 28[$r0.1]
;;
	c0	ldbu $r0.14 = 27[$r0.1]
;;
	c0	ldw $r0.15 = 4[$r0.13]
;;
	c0	shl $r0.14 = $r0.14, $r0.12
;;
	c0	and $r0.15 = $r0.15, -522241
;;
	c0	or $r0.14 = $r0.15, $r0.14
;;
	c0	stw 4[$r0.13] = $r0.14
;;
## BB#3:                                ## %for.inc
                                        ##   in Loop: Header=BB4_1 Depth=1
	c0	ldw $r0.13 = 28[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.13, 8
;;
	c0	stw 28[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 24[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.13, 1
;;
	c0	stw 24[$r0.1] = $r0.13
	c0	goto LBB4_1
;;
LBB4_4::                                ## %for.end
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
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @search_dict
search_dict::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 24[$r0.1] = $r0.3
;;
	c0	stb 20[$r0.1] = $r0.4
;;
	c0	ldw $r0.11 = 24[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.11, 0
;;
;;
	c0	brf $b0.0, LBB5_1
;;
## BB#2:                                ## %if.end
	c0	ldw $r0.13 = 24[$r0.1]
	c0	mov $r0.11 = dict
	c0	mov $r0.12 = 11
;;
;;
	c0	sh3add $r0.13 = $r0.13, $r0.11
;;
	c0	ldw $r0.13 = 0[$r0.13]
;;
;;
	c0	shru $r0.13 = $r0.13, $r0.12
;;
	c0	and $r0.13 = $r0.13, 2047
;;
	c0	stw 16[$r0.1] = $r0.13
	c0	mov $r0.13 = last
;;
LBB5_3::                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.14 = 16[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.14, 0
;;
;;
	c0	br $b0.0, LBB5_8
;;
## BB#4:                                ## %for.body
                                        ##   in Loop: Header=BB5_3 Depth=1
	c0	ldw $r0.14 = 16[$r0.1]
;;
	c0	ldw $r0.15 = 0[$r0.13]
;;
;;
	c0	cmpeq $b0.0 = $r0.14, $r0.15
;;
;;
	c0	br $b0.0, LBB5_7
;;
## BB#5:                                ## %land.lhs.true
                                        ##   in Loop: Header=BB5_3 Depth=1
	c0	ldw $r0.14 = 16[$r0.1]
;;
;;
	c0	sh3add $r0.14 = $r0.14, $r0.11
	c0	ldbu $r0.15 = 20[$r0.1]
;;
	c0	ldw $r0.14 = 4[$r0.14]
;;
;;
	c0	shru $r0.14 = $r0.14, $r0.12
;;
	c0	zxtb $r0.14 = $r0.14
;;
	c0	cmpne $b0.0 = $r0.14, $r0.15
;;
;;
	c0	brf $b0.0, LBB5_6
;;
LBB5_7::                                ## %for.inc
                                        ##   in Loop: Header=BB5_3 Depth=1
	c0	ldw $r0.14 = 16[$r0.1]
;;
;;
	c0	sh3add $r0.14 = $r0.14, $r0.11
;;
	c0	ldw $r0.14 = 4[$r0.14]
;;
;;
	c0	and $r0.14 = $r0.14, 2047
;;
	c0	stw 16[$r0.1] = $r0.14
	c0	goto LBB5_3
;;
LBB5_1::                                ## %if.then
	c0	ldbu $r0.11 = 20[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 3
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	goto LBB5_9
;;
LBB5_6::                                ## %if.then11
	c0	ldw $r0.11 = 16[$r0.1]
;;
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	goto LBB5_9
;;
LBB5_8::                                ## %for.end
	c0	mov $r0.11 = 0
;;
	c0	stw 28[$r0.1] = $r0.11
;;
LBB5_9::                                ## %return
.return ret($r0.3:s32)
	c0	ldw $r0.3 = 28[$r0.1]
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @add_dict
add_dict::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 44[$r0.1] = $r0.3
;;
	c0	stb 40[$r0.1] = $r0.4
;;
	c0	ldw $r0.11 = 44[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB6_14
;;
## BB#1:                                ## %if.end
	c0	mov $r0.13 = c1
	c0	mov $r0.11 = dict
;;
	c0	mov $r0.12 = 11
	c0	ldw $r0.14 = 0[$r0.13]
	c0	mov $r0.15 = last
;;
;;
	c0	sh3add $r0.14 = $r0.14, $r0.11
;;
	c0	stw 36[$r0.1] = $r0.14
;;
	c0	ldw $r0.16 = 4[$r0.14]
;;
	c0	ldbu $r0.17 = 40[$r0.1]
;;
	c0	and $r0.16 = $r0.16, -522241
;;
	c0	shl $r0.17 = $r0.17, $r0.12
;;
	c0	or $r0.16 = $r0.16, $r0.17
;;
	c0	stw 4[$r0.14] = $r0.16
;;
	c0	ldw $r0.14 = 44[$r0.1]
;;
	c0	ldw $r0.16 = 36[$r0.1]
;;
	c0	and $r0.14 = $r0.14, 2047
;;
	c0	ldw $r0.17 = 0[$r0.16]
;;
;;
	c0	and $r0.17 = $r0.17, -2048
;;
	c0	or $r0.14 = $r0.17, $r0.14
;;
	c0	stw 0[$r0.16] = $r0.14
;;
	c0	ldw $r0.14 = 36[$r0.1]
;;
;;
	c0	ldw $r0.16 = 0[$r0.14]
;;
;;
	c0	and $r0.16 = $r0.16, -4192257
;;
	c0	stw 0[$r0.14] = $r0.16
;;
	c0	ldw $r0.14 = 44[$r0.1]
;;
	c0	ldw $r0.16 = 36[$r0.1]
;;
	c0	sh3add $r0.14 = $r0.14, $r0.11
;;
	c0	ldw $r0.14 = 0[$r0.14]
;;
	c0	ldw $r0.17 = 4[$r0.16]
;;
	c0	shru $r0.14 = $r0.14, $r0.12
;;
	c0	and $r0.14 = $r0.14, 2047
	c0	and $r0.17 = $r0.17, -2048
;;
	c0	or $r0.14 = $r0.17, $r0.14
;;
	c0	stw 4[$r0.16] = $r0.14
;;
	c0	ldw $r0.14 = 44[$r0.1]
;;
	c0	ldw $r0.16 = 0[$r0.13]
;;
	c0	sh3add $r0.14 = $r0.14, $r0.11
;;
	c0	ldw $r0.17 = 0[$r0.14]
	c0	and $r0.16 = $r0.16, 2047
;;
	c0	shl $r0.16 = $r0.16, $r0.12
;;
	c0	and $r0.17 = $r0.17, -4192257
;;
	c0	or $r0.16 = $r0.17, $r0.16
;;
	c0	stw 0[$r0.14] = $r0.16
;;
	c0	ldw $r0.14 = 0[$r0.13]
;;
;;
	c0	stw 0[$r0.15] = $r0.14
;;
	c0	ldw $r0.14 = 36[$r0.1]
;;
;;
	c0	add $r0.14 = $r0.14, 8
;;
	c0	stw 36[$r0.1] = $r0.14
	c0	add $r0.14 = $r0.11, 16384
;;
	c0	add $r0.15 = $r0.11, 2072
;;
LBB6_2::                                ## %while.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.16 = 36[$r0.1]
;;
;;
	c0	ldw $r0.16 = 0[$r0.16]
;;
;;
	c0	shru $r0.16 = $r0.16, $r0.12
;;
	c0	and $r0.16 = $r0.16, 2047
;;
	c0	cmpeq $b0.0 = $r0.16, 0
;;
;;
	c0	br $b0.0, LBB6_4
;;
## BB#3:                                ## %while.body
                                        ##   in Loop: Header=BB6_2 Depth=1
	c0	ldw $r0.16 = 36[$r0.1]
;;
;;
	c0	add $r0.16 = $r0.16, 8
;;
	c0	stw 36[$r0.1] = $r0.16
	c0	goto LBB6_2
;;
LBB6_4::                                ## %while.end
                                        ##   in Loop: Header=BB6_2 Depth=1
	c0	ldw $r0.16 = 36[$r0.1]
;;
;;
	c0	cmpltu $b0.0 = $r0.16, $r0.14
;;
;;
	c0	br $b0.0, LBB6_6
;;
## BB#5:                                ## %if.end28
                                        ##   in Loop: Header=BB6_2 Depth=1
	c0	stw 36[$r0.1] = $r0.15
	c0	goto LBB6_2
;;
LBB6_6::                                ## %for.end
	c0	ldw $r0.14 = 36[$r0.1]
	c0	mov $r0.15 = 3
;;
;;
	c0	sub $r0.14 = $r0.14, $r0.11
;;
	c0	shr $r0.14 = $r0.14, $r0.15
;;
	c0	stw 24[$r0.1] = $r0.14
;;
	c0	stw 0[$r0.13] = $r0.14
;;
	c0	ldw $r0.13 = 36[$r0.1]
;;
;;
	c0	ldhu $r0.13 = 2[$r0.13]
;;
;;
	c0	and $r0.13 = $r0.13, 2047
;;
	c0	cmpeq $b0.0 = $r0.13, 0
;;
;;
	c0	br $b0.0, LBB6_14
;;
## BB#7:                                ## %if.then32
	c0	ldw $r0.13 = 36[$r0.1]
;;
;;
	c0	ldw $r0.13 = 0[$r0.13]
	c0	mov $r0.14 = 0
;;
;;
	c0	and $r0.13 = $r0.13, 2047
;;
	c0	sh3add $r0.13 = $r0.13, $r0.11
;;
	c0	ldw $r0.13 = 0[$r0.13]
;;
;;
	c0	shru $r0.13 = $r0.13, $r0.12
;;
	c0	and $r0.13 = $r0.13, 2047
;;
	c0	stw 32[$r0.1] = $r0.13
;;
	c0	stw 28[$r0.1] = $r0.14
;;
LBB6_8::                                ## %for.cond39
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.13 = 32[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.13, 0
;;
;;
	c0	br $b0.0, LBB6_11
;;
## BB#9:                                ## %for.body
                                        ##   in Loop: Header=BB6_8 Depth=1
	c0	ldw $r0.13 = 24[$r0.1]
;;
	c0	ldw $r0.14 = 32[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.14, $r0.13
;;
;;
	c0	br $b0.0, LBB6_11
;;
## BB#10:                               ## %for.inc
                                        ##   in Loop: Header=BB6_8 Depth=1
	c0	ldw $r0.13 = 32[$r0.1]
;;
;;
	c0	stw 28[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 32[$r0.1]
;;
;;
	c0	sh3add $r0.13 = $r0.13, $r0.11
;;
	c0	ldw $r0.13 = 4[$r0.13]
;;
;;
	c0	and $r0.13 = $r0.13, 2047
;;
	c0	stw 32[$r0.1] = $r0.13
	c0	goto LBB6_8
;;
LBB6_11::                               ## %for.end49
	c0	ldw $r0.13 = 28[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.13, 0
;;
;;
	c0	br $b0.0, LBB6_13
;;
## BB#12:                               ## %if.then51
	c0	ldw $r0.12 = 28[$r0.1]
;;
	c0	ldw $r0.13 = 36[$r0.1]
;;
	c0	sh3add $r0.11 = $r0.12, $r0.11
;;
	c0	ldw $r0.12 = 4[$r0.13]
;;
	c0	ldw $r0.13 = 4[$r0.11]
;;
	c0	and $r0.12 = $r0.12, 2047
;;
	c0	and $r0.13 = $r0.13, -2048
;;
	c0	or $r0.12 = $r0.13, $r0.12
;;
	c0	stw 4[$r0.11] = $r0.12
	c0	goto LBB6_14
;;
LBB6_13::                               ## %if.else
	c0	ldw $r0.13 = 36[$r0.1]
;;
;;
	c0	ldw $r0.14 = 0[$r0.13]
;;
	c0	ldw $r0.13 = 4[$r0.13]
;;
	c0	and $r0.14 = $r0.14, 2047
;;
	c0	sh3add $r0.11 = $r0.14, $r0.11
	c0	and $r0.13 = $r0.13, 2047
;;
	c0	ldw $r0.14 = 0[$r0.11]
	c0	shl $r0.12 = $r0.13, $r0.12
;;
;;
	c0	and $r0.13 = $r0.14, -4192257
;;
	c0	or $r0.12 = $r0.13, $r0.12
;;
	c0	stw 0[$r0.11] = $r0.12
;;
LBB6_14::                               ## %if.end73
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 64, $l0.0
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
	c0	stw 28[$r0.1] = $r0.61
;;
	c0	stw 24[$r0.1] = $l0.0
	c0	mov $r0.57 = c3
;;
	c0	mov $r0.58 = c1
	c0	mov $r0.59 = c2
;;
	c0	mov $r0.60 = 2
	c0	mov $r0.61 = 1
;;
LBB7_1::                                ## %while.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.11 = 0[$r0.57]
;;
	c0	ldw $r0.12 = 0[$r0.58]
;;
;;
	c0	cmplt $b0.0 = $r0.12, $r0.11
;;
;;
	c0	br $b0.0, LBB7_3
;;
## BB#2:                                ## %while.body
                                        ##   in Loop: Header=BB7_1 Depth=1
	c0	ldw $r0.4 = 0[$r0.59]
	c0	mov $r0.3 = $r0.60
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
	c0	shl $r0.11 = $r0.11, $r0.61
;;
	c0	stw 0[$r0.57] = $r0.11
	c0	goto LBB7_1
;;
LBB7_3::                                ## %while.end
	c0	ldw $l0.0 = 24[$r0.1]
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
	c0	mov $r0.57 = 0
;;
	c0	stw 40[$r0.1] = $r0.57
;;
	c0	stw 44[$r0.1] = $r0.57
;;
	c0	stw 56[$r0.1] = $r0.57
;;
	c0	stw 52[$r0.1] = $r0.57
;;
	c0	stw 36[$r0.1] = $r0.57
	c0	mov $r0.58 = compress
;;
	c0	mov $r0.59 = c2
	c0	mov $r0.60 = 1
	c0	mov $r0.61 = -5
;;
	c0	mov $r0.11 = c3
;;
	c0	stw 24[$r0.1] = $r0.11
	c0	mov $r0.63 = escape
	c0	mov $r0.62 = 8
;;
	c0	mov $r0.11 = 2
;;
	c0	stw 20[$r0.1] = $r0.11
	c0	mov $r0.11 = 31
;;
	c0	stw 32[$r0.1] = $r0.11
	c0	mov $r0.11 = 24
;;
	c0	stw 28[$r0.1] = $r0.11
;;
LBB8_1::                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
.call getdata, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = getdata
;;
	c0	cmpgt $b0.0 = $r0.3, -5
	c0	stw 48[$r0.1] = $r0.3
;;
;;
	c0	br $b0.0, LBB8_4
;;
## BB#2:                                ## %for.cond
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	cmpeq $b0.0 = $r0.3, -5
;;
;;
	c0	brf $b0.0, LBB8_3
;;
## BB#9:                                ## %sw.bb2
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.11 = 56[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB8_12
;;
## BB#10:                               ## %if.then
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
	c0	ldw $r0.3 = 56[$r0.1]
;;
	c0	ldw $r0.4 = 0[$r0.59]
;;
;;
.call putcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putcode
;;
	c0	ldw $r0.4 = 0[$r0.59]
	c0	mov $r0.3 = $r0.60
;;
;;
.call putcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putcode
;;
LBB8_12::                               ## %if.end5
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	mov $r0.3 = $r0.61
	c0	mov $r0.4 = $r0.57
;;
.call putcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putcode
;;
	c0	goto LBB8_1
;;
LBB8_4::                                ## %for.cond
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	add $r0.11 = $r0.3, 4
;;
	c0	cmpltu $b0.0 = $r0.11, 2
;;
;;
	c0	br $b0.0, LBB8_1
;;
## BB#5:                                ## %for.cond
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	cmpeq $b0.0 = $r0.3, -1
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
	c0	cmpeq $b0.0 = $r0.3, -6
;;
;;
	c0	br $b0.0, LBB8_7
;;
	c0	goto LBB8_13
;;
LBB8_6::                                ## %for.cond
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	cmpne $b0.0 = $r0.3, -2
;;
;;
	c0	brf $b0.0, LBB8_7
;;
LBB8_13::                               ## %sw.epilog
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.11 = 40[$r0.1]
;;
;;
	c0	cmplt $b0.0 = $r0.11, 2049
;;
;;
	c0	br $b0.0, LBB8_29
;;
## BB#14:                               ## %if.then7
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.11 = 44[$r0.1]
;;
	c0	ldw $r0.12 = 40[$r0.1]
;;
;;
	c0	cmpge $b0.0 = $r0.12, $r0.11
;;
;;
	c0	br $b0.0, LBB8_24
;;
## BB#15:                               ## %if.then9
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.11 = 0[$r0.58]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB8_21
;;
## BB#16:                               ## %if.then11
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.11 = 56[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB8_18
;;
## BB#17:                               ## %if.then13
                                        ##   in Loop: Header=BB8_1 Depth=1
.call checksize_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = checksize_dict
;;
	c0	ldw $r0.3 = 56[$r0.1]
;;
	c0	ldw $r0.4 = 0[$r0.59]
;;
;;
.call putcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putcode
;;
LBB8_18::                               ## %if.end14
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldbu $r0.4 = 51[$r0.1]
;;
	c0	ldw $r0.3 = 56[$r0.1]
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
	c0	ldbu $r0.4 = 51[$r0.1]
;;
	c0	ldw $r0.3 = 56[$r0.1]
;;
;;
.call add_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = add_dict
;;
LBB8_20::                               ## %if.end19
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.4 = 0[$r0.59]
	c0	mov $r0.3 = $r0.57
;;
;;
.call putcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putcode
;;
	c0	mov $r0.3 = $r0.57
	c0	mov $r0.4 = $r0.57
;;
.call putcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putcode
;;
	c0	stw 0[$r0.58] = $r0.57
;;
	c0	stw 56[$r0.1] = $r0.57
;;
	c0	stw 52[$r0.1] = $r0.57
	c0	goto LBB8_28
;;
LBB8_24::                               ## %if.else27
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.11 = 0[$r0.58]
;;
;;
	c0	cmpne $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB8_28
;;
## BB#25:                               ## %if.then29
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldbu $r0.4 = 51[$r0.1]
;;
	c0	ldw $r0.3 = 56[$r0.1]
;;
.call search_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = search_dict
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB8_27
;;
	c0	goto LBB8_26
;;
LBB8_21::                               ## %if.else
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.11 = 36[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 36[$r0.1] = $r0.11
	c0	cmplt $b0.0 = $r0.11, 5
;;
;;
	c0	br $b0.0, LBB8_28
;;
## BB#22:                               ## %land.lhs.true
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.11 = 24[$r0.1]
;;
;;
	c0	ldw $r0.11 = 0[$r0.11]
;;
;;
	c0	cmplt $b0.0 = $r0.11, 513
;;
;;
	c0	br $b0.0, LBB8_28
;;
## BB#23:                               ## %if.then24
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	stw 36[$r0.1] = $r0.57
;;
	c0	ldw $r0.3 = 0[$r0.63]
	c0	mov $r0.4 = $r0.62
;;
;;
.call putcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putcode
;;
	c0	ldw $r0.3 = 20[$r0.1]
	c0	mov $r0.4 = $r0.62
;;
;;
.call putcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putcode
;;
.call init_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = init_dict
;;
	c0	stw 56[$r0.1] = $r0.57
;;
	c0	stw 52[$r0.1] = $r0.57
	c0	goto LBB8_28
;;
LBB8_26::                               ## %if.then33
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldbu $r0.4 = 51[$r0.1]
;;
	c0	ldw $r0.3 = 56[$r0.1]
;;
;;
.call add_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = add_dict
;;
LBB8_27::                               ## %if.end35
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.3 = 0[$r0.63]
	c0	mov $r0.4 = $r0.62
;;
;;
.call putcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putcode
;;
	c0	mov $r0.3 = $r0.57
	c0	mov $r0.4 = $r0.62
;;
.call putcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putcode
;;
	c0	stw 0[$r0.58] = $r0.60
;;
	c0	stw 56[$r0.1] = $r0.57
;;
	c0	stw 52[$r0.1] = $r0.57
;;
LBB8_28::                               ## %if.end37
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	stw 40[$r0.1] = $r0.57
;;
	c0	stw 44[$r0.1] = $r0.57
;;
LBB8_29::                               ## %if.end38
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.11 = 40[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 8
;;
	c0	stw 40[$r0.1] = $r0.11
;;
	c0	ldw $r0.11 = 0[$r0.58]
;;
;;
	c0	cmpne $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB8_32
;;
## BB#30:                               ## %if.then40
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.3 = 48[$r0.1]
	c0	mov $r0.4 = $r0.62
;;
;;
.call putcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putcode
;;
	c0	ldw $r0.11 = 48[$r0.1]
;;
	c0	ldw $r0.12 = 0[$r0.63]
;;
;;
	c0	cmpne $b0.0 = $r0.11, $r0.12
;;
;;
	c0	br $b0.0, LBB8_32
;;
## BB#31:                               ## %if.then43
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	mov $r0.3 = $r0.60
	c0	mov $r0.4 = $r0.62
;;
.call putcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putcode
;;
LBB8_32::                               ## %if.end45
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.11 = 48[$r0.1]
;;
	c0	ldw $r0.12 = 0[$r0.63]
;;
;;
	c0	cmpne $b0.0 = $r0.11, $r0.12
;;
;;
	c0	br $b0.0, LBB8_34
;;
## BB#33:                               ## %if.then48
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.11 = 0[$r0.63]
;;
;;
	c0	add $r0.11 = $r0.11, 51
	c0	ldw $r0.12 = 32[$r0.1]
;;
;;
	c0	shr $r0.12 = $r0.11, $r0.12
	c0	ldw $r0.13 = 28[$r0.1]
;;
;;
	c0	shru $r0.12 = $r0.12, $r0.13
;;
	c0	add $r0.12 = $r0.11, $r0.12
;;
	c0	and $r0.12 = $r0.12, -256
;;
	c0	sub $r0.11 = $r0.11, $r0.12
;;
	c0	stw 0[$r0.63] = $r0.11
;;
LBB8_34::                               ## %if.end50
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldbu $r0.4 = 51[$r0.1]
;;
	c0	ldw $r0.3 = 56[$r0.1]
;;
.call search_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = search_dict
;;
	c0	cmpeq $b0.0 = $r0.3, 0
	c0	stw 60[$r0.1] = $r0.3
;;
;;
	c0	br $b0.0, LBB8_36
;;
## BB#35:                               ## %if.then54
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.11 = 60[$r0.1]
;;
;;
	c0	stw 56[$r0.1] = $r0.11
;;
	c0	ldw $r0.11 = 52[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 52[$r0.1] = $r0.11
	c0	goto LBB8_1
;;
LBB8_36::                               ## %if.end56
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.11 = 56[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB8_39
;;
## BB#37:                               ## %if.then58
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.11 = 0[$r0.58]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB8_39
;;
## BB#38:                               ## %if.then60
                                        ##   in Loop: Header=BB8_1 Depth=1
.call checksize_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = checksize_dict
;;
	c0	ldw $r0.3 = 56[$r0.1]
;;
	c0	ldw $r0.4 = 0[$r0.59]
;;
;;
.call putcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putcode
;;
LBB8_39::                               ## %if.end62
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.11 = 44[$r0.1]
;;
	c0	ldw $r0.12 = 0[$r0.59]
;;
;;
	c0	add $r0.11 = $r0.11, $r0.12
;;
	c0	stw 44[$r0.1] = $r0.11
;;
	c0	ldw $r0.11 = 52[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.11, 249
;;
;;
	c0	br $b0.0, LBB8_41
;;
## BB#40:                               ## %if.then66
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldbu $r0.4 = 51[$r0.1]
;;
	c0	ldw $r0.3 = 56[$r0.1]
;;
;;
.call add_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = add_dict
;;
LBB8_41::                               ## %if.end68
                                        ##   in Loop: Header=BB8_1 Depth=1
	c0	ldw $r0.11 = 48[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 3
;;
	c0	stw 56[$r0.1] = $r0.11
;;
	c0	stw 52[$r0.1] = $r0.60
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
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg() ## @decode
decode::
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
	c0	mov $r0.11 = 0
;;
	c0	stw 36[$r0.1] = $r0.11
;;
	c0	stw 36[$r0.1] = $r0.11
;;
	c0	stw 56[$r0.1] = $r0.11
	c0	mov $r0.58 = compress
	c0	mov $r0.59 = 8
;;
	c0	mov $r0.60 = c2
	c0	mov $r0.61 = -5
;;
	c0	mov $r0.11 = c3
;;
	c0	stw 32[$r0.1] = $r0.11
	c0	mov $r0.11 = 1
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	mov $r0.11 = decode.str
;;
	c0	add $r0.63 = $r0.11, 250
;;
	c0	stw 20[$r0.1] = $r0.63
	c0	mov $r0.62 = dict
	c0	mov $r0.11 = 11
;;
	c0	stw 24[$r0.1] = $r0.11
	c0	mov $r0.57 = escape
	c0	mov $r0.11 = 31
;;
	c0	stw 44[$r0.1] = $r0.11
	c0	mov $r0.11 = 24
;;
	c0	stw 40[$r0.1] = $r0.11
;;
LBB9_1::                                ## %for.cond
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB9_19 Depth 2
                                        ##     Child Loop BB9_23 Depth 2
	c0	ldw $r0.11 = 0[$r0.58]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 0
	c0	mov $r0.11 = $r0.59
;;
;;
	c0	br $b0.0, LBB9_3
;;
## BB#2:                                ## %cond.true
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.11 = 0[$r0.60]
;;
LBB9_3::                                ## %cond.end
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	mov $r0.3 = $r0.11
;;
.call getcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = getcode
;;
	c0	cmpgt $b0.0 = $r0.3, -5
	c0	stw 52[$r0.1] = $r0.3
;;
;;
	c0	br $b0.0, LBB9_6
;;
## BB#4:                                ## %cond.end
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	cmpeq $b0.0 = $r0.3, -5
;;
;;
	c0	brf $b0.0, LBB9_5
;;
## BB#10:                               ## %sw.bb3
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	mov $r0.3 = $r0.61
;;
.call putdata, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putdata
;;
	c0	goto LBB9_1
;;
LBB9_6::                                ## %cond.end
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	add $r0.11 = $r0.3, 4
;;
	c0	cmpltu $b0.0 = $r0.11, 2
;;
;;
	c0	br $b0.0, LBB9_1
;;
## BB#7:                                ## %cond.end
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	cmpeq $b0.0 = $r0.3, -2
;;
;;
	c0	br $b0.0, LBB9_38
;;
## BB#8:                                ## %cond.end
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	cmpne $b0.0 = $r0.3, -1
;;
;;
	c0	br $b0.0, LBB9_11
;;
## BB#9:                                ## %sw.bb2
                                        ##   in Loop: Header=BB9_1 Depth=1
.call init_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = init_dict
;;
	c0	goto LBB9_1
;;
LBB9_5::                                ## %cond.end
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	cmpeq $b0.0 = $r0.3, -6
;;
;;
	c0	br $b0.0, LBB9_38
;;
LBB9_11::                               ## %sw.epilog
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.11 = 0[$r0.58]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB9_28
;;
## BB#12:                               ## %if.then
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.11 = 52[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 2
;;
;;
	c0	br $b0.0, LBB9_17
;;
## BB#13:                               ## %if.then
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	cmpeq $b0.0 = $r0.11, 1
;;
;;
	c0	brf $b0.0, LBB9_14
;;
## BB#16:                               ## %sw.bb8
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.3 = 36[$r0.1]
;;
.call getcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = getcode
;;
	c0	stw 52[$r0.1] = $r0.3
	c0	mov $r0.3 = $r0.61
;;
.call putdata, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putdata
;;
	c0	goto LBB9_1
;;
LBB9_28::                               ## %if.else
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.11 = 52[$r0.1]
;;
	c0	ldw $r0.12 = 0[$r0.57]
;;
;;
	c0	cmpne $b0.0 = $r0.11, $r0.12
;;
;;
	c0	br $b0.0, LBB9_35
;;
## BB#29:                               ## %if.then35
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	mov $r0.3 = $r0.59
;;
.call getcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = getcode
;;
	c0	cmpeq $b0.0 = $r0.3, 2
;;
;;
	c0	br $b0.0, LBB9_33
;;
## BB#30:                               ## %if.then35
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	cmpeq $b0.0 = $r0.3, 1
;;
;;
	c0	brf $b0.0, LBB9_31
;;
## BB#34:                               ## %sw.epilog41
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.11 = 0[$r0.57]
;;
;;
	c0	add $r0.11 = $r0.11, 51
	c0	ldw $r0.12 = 44[$r0.1]
;;
;;
	c0	shr $r0.12 = $r0.11, $r0.12
	c0	ldw $r0.13 = 40[$r0.1]
;;
;;
	c0	shru $r0.12 = $r0.12, $r0.13
;;
	c0	add $r0.12 = $r0.11, $r0.12
;;
	c0	and $r0.12 = $r0.12, -256
;;
	c0	sub $r0.11 = $r0.11, $r0.12
;;
	c0	stw 0[$r0.57] = $r0.11
;;
LBB9_35::                               ## %if.end44
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.3 = 52[$r0.1]
;;
;;
.call putdata, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putdata
;;
	c0	ldbu $r0.4 = 55[$r0.1]
;;
	c0	ldw $r0.3 = 56[$r0.1]
;;
.call search_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = search_dict
;;
	c0	cmpeq $b0.0 = $r0.3, 0
	c0	stw 60[$r0.1] = $r0.3
;;
;;
	c0	br $b0.0, LBB9_37
;;
## BB#36:                               ## %if.then48
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.11 = 60[$r0.1]
;;
;;
	c0	stw 56[$r0.1] = $r0.11
	c0	goto LBB9_1
;;
LBB9_17::                               ## %sw.bb10
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.11 = 0[$r0.60]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 0[$r0.60] = $r0.11
;;
	c0	ldw $r0.12 = 32[$r0.1]
;;
;;
	c0	stw 32[$r0.1] = $r0.12
;;
	c0	ldw $r0.11 = 0[$r0.12]
;;
	c0	ldw $r0.13 = 28[$r0.1]
;;
;;
	c0	shl $r0.11 = $r0.11, $r0.13
;;
	c0	stw 0[$r0.12] = $r0.11
	c0	goto LBB9_1
;;
LBB9_14::                               ## %if.then
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	cmpne $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB9_18
;;
## BB#15:                               ## %sw.bb6
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.63 = 36[$r0.1]
;;
;;
	c0	mov $r0.3 = $r0.63
;;
.call getcode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = getcode
;;
	c0	stw 52[$r0.1] = $r0.3
;;
	c0	stw 0[$r0.58] = $r0.63
;;
	c0	ldw $r0.63 = 20[$r0.1]
	c0	goto LBB9_1
;;
LBB9_18::                               ## %sw.default11
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	stw 48[$r0.1] = $r0.63
;;
	c0	ldw $r0.11 = 52[$r0.1]
;;
;;
	c0	stw 60[$r0.1] = $r0.11
;;
	c0	ldw $r0.14 = 24[$r0.1]
;;
LBB9_19::                               ## %for.cond12
                                        ##   Parent Loop BB9_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldw $r0.11 = 60[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB9_21
;;
## BB#20:                               ## %for.inc
                                        ##   in Loop: Header=BB9_19 Depth=2
	c0	ldw $r0.11 = 60[$r0.1]
;;
;;
	c0	sh3add $r0.11 = $r0.11, $r0.62
	c0	ldw $r0.12 = 48[$r0.1]
;;
	c0	ldw $r0.11 = 4[$r0.11]
;;
	c0	add $r0.13 = $r0.12, -1
;;
	c0	shru $r0.11 = $r0.11, $r0.14
	c0	stw 48[$r0.1] = $r0.13
;;
	c0	stb -1[$r0.12] = $r0.11
;;
	c0	ldw $r0.11 = 60[$r0.1]
;;
;;
	c0	sh3add $r0.11 = $r0.11, $r0.62
;;
	c0	ldw $r0.11 = 0[$r0.11]
;;
;;
	c0	and $r0.11 = $r0.11, 2047
;;
	c0	stw 60[$r0.1] = $r0.11
	c0	goto LBB9_19
;;
LBB9_21::                               ## %for.end
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	stw 24[$r0.1] = $r0.14
;;
	c0	ldw $r0.11 = 48[$r0.1]
;;
	c0	ldw $r0.3 = 56[$r0.1]
;;
	c0	ldbu $r0.4 = 0[$r0.11]
;;
;;
.call search_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = search_dict
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB9_23
;;
## BB#22:                               ## %if.then19
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.11 = 48[$r0.1]
;;
	c0	ldw $r0.3 = 56[$r0.1]
;;
	c0	ldbu $r0.4 = 0[$r0.11]
;;
;;
.call add_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = add_dict
;;
LBB9_23::                               ## %for.cond20
                                        ##   Parent Loop BB9_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldw $r0.11 = 48[$r0.1]
;;
;;
	c0	cmpgeu $b0.0 = $r0.11, $r0.63
;;
;;
	c0	br $b0.0, LBB9_27
;;
## BB#24:                               ## %for.body22
                                        ##   in Loop: Header=BB9_23 Depth=2
	c0	ldw $r0.11 = 48[$r0.1]
;;
;;
	c0	ldbu $r0.3 = 0[$r0.11]
;;
;;
.call putdata, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = putdata
;;
	c0	ldw $r0.11 = 48[$r0.1]
;;
	c0	ldw $r0.12 = 0[$r0.57]
;;
	c0	ldbu $r0.11 = 0[$r0.11]
;;
;;
	c0	cmpne $b0.0 = $r0.11, $r0.12
;;
;;
	c0	br $b0.0, LBB9_26
;;
## BB#25:                               ## %if.then27
                                        ##   in Loop: Header=BB9_23 Depth=2
	c0	ldw $r0.11 = 0[$r0.57]
;;
;;
	c0	add $r0.11 = $r0.11, 51
	c0	ldw $r0.12 = 44[$r0.1]
;;
;;
	c0	shr $r0.12 = $r0.11, $r0.12
	c0	ldw $r0.13 = 40[$r0.1]
;;
;;
	c0	shru $r0.12 = $r0.12, $r0.13
;;
	c0	add $r0.12 = $r0.11, $r0.12
;;
	c0	and $r0.12 = $r0.12, -256
;;
	c0	sub $r0.11 = $r0.11, $r0.12
;;
	c0	stw 0[$r0.57] = $r0.11
;;
LBB9_26::                               ## %for.inc29
                                        ##   in Loop: Header=BB9_23 Depth=2
	c0	ldw $r0.11 = 48[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 48[$r0.1] = $r0.11
	c0	goto LBB9_23
;;
LBB9_27::                               ## %for.end31
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.11 = 52[$r0.1]
;;
;;
	c0	stw 56[$r0.1] = $r0.11
	c0	goto LBB9_1
;;
LBB9_37::                               ## %if.end49
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldbu $r0.4 = 55[$r0.1]
;;
	c0	ldw $r0.3 = 56[$r0.1]
;;
;;
.call add_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = add_dict
;;
	c0	ldw $r0.11 = 52[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 3
;;
	c0	stw 56[$r0.1] = $r0.11
	c0	goto LBB9_1
;;
LBB9_33::                               ## %sw.bb38
                                        ##   in Loop: Header=BB9_1 Depth=1
.call init_dict, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = init_dict
;;
	c0	ldw $r0.11 = 36[$r0.1]
;;
;;
	c0	stw 56[$r0.1] = $r0.11
	c0	goto LBB9_1
;;
LBB9_31::                               ## %if.then35
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB9_1
;;
## BB#32:                               ## %sw.bb37
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.11 = 28[$r0.1]
;;
;;
	c0	stw 0[$r0.58] = $r0.11
	c0	goto LBB9_1
;;
LBB9_38::                               ## %return
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
	c0	stw 32[$r0.1] = $l0.0
	c0	mov $r0.11 = 0
	c0	mov $r0.12 = gE
;;
	c0	mov $r0.13 = gP
	c0	mov $r0.14 = compress
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	mov $r0.15 = escape
;;
	c0	mov $r0.16 = eaddr
	c0	mov $r0.17 = baddr
;;
	c0	stw 0[$r0.12] = $r0.11
	c0	mov $r0.12 = codedone
;;
	c0	mov $r0.57 = eout
	c0	mov $r0.58 = outbuf
;;
	c0	stw 0[$r0.13] = $r0.11
;;
	c0	stw 0[$r0.14] = $r0.11
	c0	mov $r0.59 = inbuf
;;
	c0	stw 0[$r0.15] = $r0.11
;;
	c0	stw 0[$r0.16] = $r0.11
;;
	c0	stw 0[$r0.17] = $r0.11
;;
	c0	stw 0[$r0.12] = $r0.11
;;
.call encode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	stw 0[$r0.57] = $r0.58
	c0	call $l0.0 = encode
;;
.call decode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = decode
;;
	c0	stw 24[$r0.1] = $r0.59
;;
	c0	stw 20[$r0.1] = $r0.58
;;
	c0	ldw $r0.11 = 24[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 7554
;;
	c0	stw 16[$r0.1] = $r0.11
;;
LBB10_1::                               ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.11 = 16[$r0.1]
;;
	c0	ldw $r0.12 = 24[$r0.1]
;;
;;
	c0	cmpgeu $b0.0 = $r0.12, $r0.11
;;
;;
	c0	br $b0.0, LBB10_4
;;
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB10_1 Depth=1
	c0	ldw $r0.11 = 20[$r0.1]
;;
	c0	ldw $r0.12 = 24[$r0.1]
;;
	c0	ldbu $r0.11 = 0[$r0.11]
;;
	c0	ldbu $r0.12 = 0[$r0.12]
;;
;;
	c0	cmpne $b0.0 = $r0.12, $r0.11
;;
;;
	c0	br $b0.0, LBB10_4
;;
## BB#3:                                ## %for.inc
                                        ##   in Loop: Header=BB10_1 Depth=1
	c0	ldw $r0.11 = 24[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 24[$r0.1] = $r0.11
;;
	c0	ldw $r0.11 = 20[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 20[$r0.1] = $r0.11
	c0	goto LBB10_1
;;
LBB10_4::                               ## %for.end
	c0	ldw $r0.11 = 20[$r0.1]
;;
	c0	ldw $r0.12 = 0[$r0.57]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, $r0.12
;;
;;
	c0	br $b0.0, LBB10_6
;;
## BB#5:                                ## %if.then7
	c0	mov $r0.3 = .str
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	mov $r0.11 = 15
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	goto LBB10_7
;;
LBB10_6::                               ## %if.else
	c0	mov $r0.3 = .str1
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	mov $r0.11 = 66
;;
	c0	stw 28[$r0.1] = $r0.11
;;
LBB10_7::                               ## %return
	c0	ldw $r0.3 = 28[$r0.1]
;;
	c0	ldw $l0.0 = 32[$r0.1]
;;
	c0	ldw $r0.59 = 36[$r0.1]
;;
	c0	ldw $r0.58 = 40[$r0.1]
;;
	c0	ldw $r0.57 = 44[$r0.1]
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 64, $l0.0
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
.import printf
.import puts
.import memset
