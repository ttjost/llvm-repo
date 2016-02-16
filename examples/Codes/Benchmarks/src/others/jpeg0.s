.section .text

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @getbit
getbit::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
	c0	mov $r0.11 = bitsleft
;;
	c0	ldw $r0.12 = 0[$r0.11]
;;
;;
	c0	add $r0.12 = $r0.12, -1
;;
	c0	stw 0[$r0.11] = $r0.12
	c0	cmpgt $b0.0 = $r0.12, -1
;;
;;
	c0	br $b0.0, LBB0_4
;;
## BB#1:                                ## %if.then
	c0	mov $r0.12 = nextlong
	c0	mov $r0.13 = huffbits
;;
	c0	ldw $r0.14 = 0[$r0.12]
	c0	add $r0.13 = $r0.13, 2404
;;
;;
	c0	cmpltu $b0.0 = $r0.14, $r0.13
;;
;;
	c0	br $b0.0, LBB0_3
;;
## BB#2:                                ## %if.then2
	c0	mov $r0.11 = lastlong
	c0	mov $r0.12 = 0
;;
	c0	stw 0[$r0.11] = $r0.12
	c0	goto LBB0_4
;;
LBB0_3::                                ## %if.else
	c0	mov $r0.13 = lastlong
	c0	ldw $r0.14 = 0[$r0.12]
;;
;;
	c0	add $r0.15 = $r0.14, 4
;;
	c0	stw 0[$r0.12] = $r0.15
;;
	c0	ldw $r0.12 = 0[$r0.14]
	c0	mov $r0.14 = 31
;;
;;
	c0	stw 0[$r0.13] = $r0.12
;;
	c0	stw 0[$r0.11] = $r0.14
;;
LBB0_4::                                ## %if.end3
	c0	mov $r0.11 = lastlong
	c0	mov $r0.12 = 31
	c0	mov $r0.13 = 1
;;
	c0	ldw $r0.14 = 0[$r0.11]
;;
;;
	c0	shru $r0.12 = $r0.14, $r0.12
;;
	c0	stw 28[$r0.1] = $r0.12
;;
	c0	ldw $r0.12 = 0[$r0.11]
;;
;;
	c0	shl $r0.12 = $r0.12, $r0.13
;;
	c0	stw 0[$r0.11] = $r0.12
;;
.return ret($r0.3:s32)
	c0	ldw $r0.3 = 28[$r0.1]
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @huff_dc_dec
huff_dc_dec::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 60[$r0.1] = $r0.57
;;
	c0	stw 56[$r0.1] = $r0.58
;;
	c0	stw 52[$r0.1] = $r0.59
;;
	c0	stw 48[$r0.1] = $l0.0
;;
	c0	stw 44[$r0.1] = $r0.3
	c0	mov $r0.57 = 1
;;
.call getbit, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	stw 32[$r0.1] = $r0.57
	c0	call $l0.0 = getbit
;;
	c0	stw 24[$r0.1] = $r0.3
	c0	mov $r0.58 = maxcode_dc
;;
LBB1_1::                                ## %while.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.11 = 32[$r0.1]
;;
;;
	c0	sh2add $r0.11 = $r0.11, $r0.58
	c0	ldw $r0.12 = 24[$r0.1]
;;
	c0	ldw $r0.11 = 0[$r0.11]
;;
;;
	c0	cmple $b0.0 = $r0.12, $r0.11
;;
;;
	c0	br $b0.0, LBB1_3
;;
## BB#2:                                ## %while.body
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.11 = 32[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 32[$r0.1] = $r0.11
;;
.call getbit, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	ldw $r0.59 = 24[$r0.1]
	c0	call $l0.0 = getbit
;;
;;
	c0	sh1add $r0.11 = $r0.59, $r0.3
;;
	c0	stw 24[$r0.1] = $r0.11
	c0	goto LBB1_1
;;
LBB1_3::                                ## %while.end
	c0	ldw $r0.11 = 32[$r0.1]
	c0	mov $r0.12 = valptr_dc
;;
	c0	mov $r0.13 = mincode_dc
	c0	mov $r0.14 = val_dc_lum
;;
;;
	c0	add $r0.11 = $r0.12, $r0.11
;;
	c0	ldbu $r0.11 = 0[$r0.11]
	c0	mov $r0.12 = 0
;;
;;
	c0	stw 28[$r0.1] = $r0.11
;;
	c0	ldw $r0.15 = 32[$r0.1]
;;
	c0	ldw $r0.16 = 24[$r0.1]
;;
	c0	sh2add $r0.13 = $r0.15, $r0.13
;;
	c0	add $r0.11 = $r0.11, $r0.16
	c0	ldw $r0.13 = 0[$r0.13]
;;
;;
	c0	sub $r0.11 = $r0.11, $r0.13
;;
	c0	add $r0.13 = $r0.14, $r0.11
	c0	stw 28[$r0.1] = $r0.11
;;
	c0	ldbu $r0.11 = 0[$r0.13]
;;
;;
	c0	stw 36[$r0.1] = $r0.11
;;
	c0	ldw $r0.11 = 44[$r0.1]
;;
;;
	c0	stw 0[$r0.11] = $r0.12
;;
	c0	stw 40[$r0.1] = $r0.12
;;
LBB1_4::                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.11 = 36[$r0.1]
;;
	c0	ldw $r0.12 = 40[$r0.1]
;;
;;
	c0	cmpge $b0.0 = $r0.12, $r0.11
;;
;;
	c0	br $b0.0, LBB1_7
;;
## BB#5:                                ## %for.body
                                        ##   in Loop: Header=BB1_4 Depth=1
	c0	ldw $r0.11 = 44[$r0.1]
;;
;;
.call getbit, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	ldw $r0.58 = 0[$r0.11]
	c0	call $l0.0 = getbit
;;
	c0	ldw $r0.11 = 44[$r0.1]
;;
	c0	sh1add $r0.12 = $r0.58, $r0.3
;;
	c0	stw 0[$r0.11] = $r0.12
;;
## BB#6:                                ## %for.inc
                                        ##   in Loop: Header=BB1_4 Depth=1
	c0	ldw $r0.11 = 40[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 40[$r0.1] = $r0.11
	c0	goto LBB1_4
;;
LBB1_7::                                ## %for.end
	c0	ldw $r0.11 = 36[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, -1
;;
	c0	shl $r0.11 = $r0.57, $r0.11
;;
	c0	stw 40[$r0.1] = $r0.11
	c0	mov $r0.11 = -1
;;
LBB1_8::                                ## %while.cond15
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.12 = 44[$r0.1]
;;
	c0	ldw $r0.13 = 40[$r0.1]
;;
	c0	ldw $r0.12 = 0[$r0.12]
;;
;;
	c0	cmpge $b0.0 = $r0.12, $r0.13
;;
;;
	c0	br $b0.0, LBB1_10
;;
## BB#9:                                ## %while.body18
                                        ##   in Loop: Header=BB1_8 Depth=1
	c0	ldw $r0.12 = 36[$r0.1]
;;
;;
	c0	shl $r0.12 = $r0.11, $r0.12
;;
	c0	add $r0.12 = $r0.12, 1
;;
	c0	stw 40[$r0.1] = $r0.12
;;
	c0	ldw $r0.13 = 44[$r0.1]
;;
;;
	c0	ldw $r0.14 = 0[$r0.13]
;;
;;
	c0	add $r0.12 = $r0.14, $r0.12
;;
	c0	stw 0[$r0.13] = $r0.12
	c0	goto LBB1_8
;;
LBB1_10::                               ## %while.end22
	c0	ldw $l0.0 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
	c0	ldw $r0.57 = 60[$r0.1]
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-384, arg() ## @huff_ac_dec
huff_ac_dec::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -384
;;
	c0	stw 364[$r0.1] = $r0.57
;;
	c0	stw 360[$r0.1] = $r0.58
;;
	c0	stw 356[$r0.1] = $r0.59
;;
	c0	stw 352[$r0.1] = $r0.60
;;
	c0	stw 348[$r0.1] = $r0.61
;;
	c0	stw 344[$r0.1] = $r0.62
;;
	c0	stw 340[$r0.1] = $r0.63
;;
	c0	stw 336[$r0.1] = $l0.0
;;
	c0	stw 332[$r0.1] = $r0.3
	c0	mov $r0.59 = 0
;;
	c0	stw 292[$r0.1] = $r0.59
	c0	mov $r0.57 = 1
;;
	c0	mov $r0.60 = maxcode_ac
	c0	mov $r0.11 = valptr_ac
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	mov $r0.11 = mincode_ac
;;
	c0	stw 24[$r0.1] = $r0.11
	c0	mov $r0.11 = val_ac_lum
;;
	c0	stw 20[$r0.1] = $r0.11
	c0	mov $r0.61 = 4
	c0	add $r0.58 = $r0.1, 32
	c0	mov $r0.62 = -1
;;
	c0	mov $r0.11 = 63
;;
	c0	stw 16[$r0.1] = $r0.11
;;
LBB2_1::                                ## %while.cond
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_3 Depth 2
                                        ##     Child Loop BB2_21 Depth 2
                                        ##     Child Loop BB2_18 Depth 2
                                        ##     Child Loop BB2_8 Depth 2
                                        ##     Child Loop BB2_11 Depth 2
                                        ##     Child Loop BB2_14 Depth 2
	c0	ldw $r0.11 = 292[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.11, 62
;;
;;
	c0	br $b0.0, LBB2_23
;;
## BB#2:                                ## %while.body
                                        ##   in Loop: Header=BB2_1 Depth=1
.call getbit, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	stw 304[$r0.1] = $r0.57
	c0	call $l0.0 = getbit
;;
	c0	stw 296[$r0.1] = $r0.3
;;
LBB2_3::                                ## %while.cond1
                                        ##   Parent Loop BB2_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldw $r0.11 = 304[$r0.1]
;;
;;
	c0	sh2add $r0.11 = $r0.11, $r0.60
	c0	ldw $r0.12 = 296[$r0.1]
;;
	c0	ldw $r0.11 = 0[$r0.11]
;;
;;
	c0	cmple $b0.0 = $r0.12, $r0.11
;;
;;
	c0	br $b0.0, LBB2_5
;;
## BB#4:                                ## %while.body3
                                        ##   in Loop: Header=BB2_3 Depth=2
	c0	ldw $r0.11 = 304[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 304[$r0.1] = $r0.11
;;
.call getbit, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	ldw $r0.63 = 296[$r0.1]
	c0	call $l0.0 = getbit
;;
;;
	c0	sh1add $r0.11 = $r0.63, $r0.3
;;
	c0	stw 296[$r0.1] = $r0.11
	c0	goto LBB2_3
;;
LBB2_5::                                ## %while.end
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	ldw $r0.11 = 304[$r0.1]
;;
	c0	ldw $r0.12 = 28[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.12, $r0.11
;;
	c0	ldbu $r0.11 = 0[$r0.11]
;;
;;
	c0	stw 300[$r0.1] = $r0.11
;;
	c0	ldw $r0.12 = 304[$r0.1]
;;
	c0	ldw $r0.13 = 296[$r0.1]
;;
	c0	ldw $r0.14 = 24[$r0.1]
;;
;;
	c0	sh2add $r0.12 = $r0.12, $r0.14
	c0	add $r0.11 = $r0.11, $r0.13
;;
	c0	ldw $r0.12 = 0[$r0.12]
;;
;;
	c0	sub $r0.11 = $r0.11, $r0.12
	c0	ldw $r0.12 = 20[$r0.1]
;;
;;
	c0	add $r0.12 = $r0.12, $r0.11
	c0	stw 300[$r0.1] = $r0.11
;;
	c0	ldbu $r0.11 = 0[$r0.12]
;;
;;
	c0	stw 316[$r0.1] = $r0.11
	c0	and $r0.11 = $r0.11, 15
;;
	c0	stw 308[$r0.1] = $r0.11
;;
	c0	ldw $r0.11 = 316[$r0.1]
;;
;;
	c0	shr $r0.11 = $r0.11, $r0.61
;;
	c0	stw 312[$r0.1] = $r0.11
;;
	c0	ldw $r0.11 = 316[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB2_20
;;
## BB#6:                                ## %if.then
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	ldw $r0.11 = 316[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 240
;;
;;
	c0	br $b0.0, LBB2_17
;;
## BB#7:                                ## %if.then15
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	stw 328[$r0.1] = $r0.59
;;
LBB2_8::                                ## %for.cond
                                        ##   Parent Loop BB2_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldw $r0.11 = 312[$r0.1]
;;
	c0	ldw $r0.12 = 328[$r0.1]
;;
;;
	c0	cmpge $b0.0 = $r0.12, $r0.11
;;
;;
	c0	br $b0.0, LBB2_10
;;
## BB#9:                                ## %for.inc
                                        ##   in Loop: Header=BB2_8 Depth=2
	c0	ldw $r0.11 = 292[$r0.1]
;;
;;
	c0	sh2add $r0.11 = $r0.11, $r0.58
;;
	c0	stw 0[$r0.11] = $r0.59
;;
	c0	ldw $r0.11 = 292[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 292[$r0.1] = $r0.11
;;
	c0	ldw $r0.11 = 328[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 328[$r0.1] = $r0.11
	c0	goto LBB2_8
;;
LBB2_20::                               ## %if.else51
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	ldw $r0.11 = 292[$r0.1]
;;
	c0	ldw $r0.12 = 16[$r0.1]
;;
;;
	c0	sub $r0.11 = $r0.12, $r0.11
;;
	c0	stw 320[$r0.1] = $r0.11
;;
	c0	stw 328[$r0.1] = $r0.59
;;
LBB2_21::                               ## %for.cond53
                                        ##   Parent Loop BB2_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldw $r0.11 = 320[$r0.1]
;;
	c0	ldw $r0.12 = 328[$r0.1]
;;
;;
	c0	cmpge $b0.0 = $r0.12, $r0.11
;;
;;
	c0	br $b0.0, LBB2_1
;;
## BB#22:                               ## %for.inc59
                                        ##   in Loop: Header=BB2_21 Depth=2
	c0	ldw $r0.11 = 292[$r0.1]
;;
;;
	c0	sh2add $r0.11 = $r0.11, $r0.58
;;
	c0	stw 0[$r0.11] = $r0.59
;;
	c0	ldw $r0.11 = 292[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 292[$r0.1] = $r0.11
;;
	c0	ldw $r0.11 = 328[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 328[$r0.1] = $r0.11
	c0	goto LBB2_21
;;
LBB2_17::                               ## %if.else
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	stw 328[$r0.1] = $r0.59
;;
LBB2_18::                               ## %for.cond42
                                        ##   Parent Loop BB2_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldw $r0.11 = 328[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.11, 15
;;
;;
	c0	br $b0.0, LBB2_1
;;
## BB#19:                               ## %for.inc48
                                        ##   in Loop: Header=BB2_18 Depth=2
	c0	ldw $r0.11 = 292[$r0.1]
;;
;;
	c0	sh2add $r0.11 = $r0.11, $r0.58
;;
	c0	stw 0[$r0.11] = $r0.59
;;
	c0	ldw $r0.11 = 292[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 292[$r0.1] = $r0.11
;;
	c0	ldw $r0.11 = 328[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 328[$r0.1] = $r0.11
	c0	goto LBB2_18
;;
LBB2_10::                               ## %for.end
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	stw 288[$r0.1] = $r0.59
;;
	c0	stw 328[$r0.1] = $r0.59
;;
LBB2_11::                               ## %for.cond20
                                        ##   Parent Loop BB2_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldw $r0.11 = 308[$r0.1]
;;
	c0	ldw $r0.12 = 328[$r0.1]
;;
;;
	c0	cmpge $b0.0 = $r0.12, $r0.11
;;
;;
	c0	br $b0.0, LBB2_13
;;
## BB#12:                               ## %for.inc27
                                        ##   in Loop: Header=BB2_11 Depth=2
.call getbit, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	ldw $r0.63 = 288[$r0.1]
	c0	call $l0.0 = getbit
;;
;;
	c0	sh1add $r0.11 = $r0.63, $r0.3
;;
	c0	stw 288[$r0.1] = $r0.11
;;
	c0	ldw $r0.11 = 328[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 328[$r0.1] = $r0.11
	c0	goto LBB2_11
;;
LBB2_13::                               ## %for.end29
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	ldw $r0.11 = 308[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, -1
;;
	c0	shl $r0.11 = $r0.57, $r0.11
;;
	c0	stw 328[$r0.1] = $r0.11
;;
LBB2_14::                               ## %while.cond32
                                        ##   Parent Loop BB2_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldw $r0.11 = 328[$r0.1]
;;
	c0	ldw $r0.12 = 288[$r0.1]
;;
;;
	c0	cmpge $b0.0 = $r0.12, $r0.11
;;
;;
	c0	br $b0.0, LBB2_16
;;
## BB#15:                               ## %while.body35
                                        ##   in Loop: Header=BB2_14 Depth=2
	c0	ldw $r0.11 = 308[$r0.1]
;;
;;
	c0	shl $r0.11 = $r0.62, $r0.11
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 328[$r0.1] = $r0.11
;;
	c0	ldw $r0.12 = 288[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.12, $r0.11
;;
	c0	stw 288[$r0.1] = $r0.11
	c0	goto LBB2_14
;;
LBB2_16::                               ## %while.end39
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	ldw $r0.11 = 292[$r0.1]
;;
;;
	c0	sh2add $r0.11 = $r0.11, $r0.58
	c0	ldw $r0.12 = 288[$r0.1]
;;
;;
	c0	stw 0[$r0.11] = $r0.12
;;
	c0	ldw $r0.11 = 292[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 292[$r0.1] = $r0.11
	c0	goto LBB2_1
;;
LBB2_23::                               ## %while.end63
	c0	stw 328[$r0.1] = $r0.59
	c0	mov $r0.11 = zz_tbl
;;
LBB2_24::                               ## %for.cond64
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.12 = 328[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.12, 30
;;
;;
	c0	br $b0.0, LBB2_26
;;
## BB#25:                               ## %for.inc73
                                        ##   in Loop: Header=BB2_24 Depth=1
	c0	ldw $r0.12 = 328[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.12, $r0.11
	c0	sh2add $r0.12 = $r0.12, $r0.58
	c0	ldw $r0.14 = 332[$r0.1]
;;
	c0	ldbu $r0.13 = 1[$r0.13]
;;
	c0	ldw $r0.12 = 0[$r0.12]
;;
	c0	sh1add $r0.13 = $r0.13, $r0.14
;;
	c0	sth 0[$r0.13] = $r0.12
;;
	c0	ldw $r0.12 = 328[$r0.1]
;;
;;
	c0	add $r0.12 = $r0.12, 1
;;
	c0	stw 328[$r0.1] = $r0.12
	c0	goto LBB2_24
;;
LBB2_26::                               ## %for.end75
	c0	mov $r0.12 = 31
;;
	c0	stw 324[$r0.1] = $r0.12
;;
	c0	stw 328[$r0.1] = $r0.12
;;
LBB2_27::                               ## %for.cond76
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.12 = 328[$r0.1]
;;
;;
	c0	cmplt $b0.0 = $r0.12, 1
;;
;;
	c0	br $b0.0, LBB2_29
;;
## BB#28:                               ## %for.inc86
                                        ##   in Loop: Header=BB2_27 Depth=1
	c0	ldw $r0.12 = 328[$r0.1]
;;
;;
	c0	add $r0.12 = $r0.11, $r0.12
	c0	ldw $r0.13 = 324[$r0.1]
;;
	c0	ldbu $r0.12 = 0[$r0.12]
;;
	c0	sh2add $r0.13 = $r0.13, $r0.58
;;
	c0	shl $r0.12 = $r0.12, $r0.57
	c0	ldw $r0.14 = 332[$r0.1]
;;
	c0	ldw $r0.13 = 0[$r0.13]
;;
	c0	sub $r0.12 = $r0.14, $r0.12
;;
	c0	sth 126[$r0.12] = $r0.13
;;
	c0	ldw $r0.12 = 328[$r0.1]
;;
;;
	c0	add $r0.12 = $r0.12, -1
;;
	c0	stw 328[$r0.1] = $r0.12
;;
	c0	ldw $r0.12 = 324[$r0.1]
;;
;;
	c0	add $r0.12 = $r0.12, 1
;;
	c0	stw 324[$r0.1] = $r0.12
	c0	goto LBB2_27
;;
LBB2_29::                               ## %for.end88
	c0	ldw $r0.11 = 332[$r0.1]
;;
	c0	ldw $r0.12 = 280[$r0.1]
;;
;;
	c0	sth 126[$r0.11] = $r0.12
;;
	c0	ldw $l0.0 = 336[$r0.1]
;;
	c0	ldw $r0.63 = 340[$r0.1]
;;
	c0	ldw $r0.62 = 344[$r0.1]
;;
	c0	ldw $r0.61 = 348[$r0.1]
;;
	c0	ldw $r0.60 = 352[$r0.1]
;;
	c0	ldw $r0.59 = 356[$r0.1]
;;
	c0	ldw $r0.58 = 360[$r0.1]
;;
.return ret($r0.3:s32)
	c0	ldw $r0.57 = 364[$r0.1]
	c0	return $r0.1 = $r0.1, 384, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-160, arg() ## @fast_idct_8
fast_idct_8::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -160
;;
	c0	stw 140[$r0.1] = $r0.3
;;
	c0	stw 136[$r0.1] = $r0.4
	c0	mov $r0.13 = 14
	c0	mov $r0.12 = 2
;;
	c0	ldw $r0.14 = 140[$r0.1]
	c0	mov $r0.11 = 17
;;
;;
	c0	ldh $r0.14 = 0[$r0.14]
;;
;;
	c0	stw 60[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 140[$r0.1]
;;
	c0	ldw $r0.15 = 136[$r0.1]
;;
;;
	c0	sh1add $r0.14 = $r0.15, $r0.14
;;
	c0	ldh $r0.14 = 0[$r0.14]
;;
;;
	c0	stw 56[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 140[$r0.1]
;;
	c0	ldw $r0.15 = 136[$r0.1]
;;
;;
	c0	sh2add $r0.14 = $r0.15, $r0.14
;;
	c0	ldh $r0.14 = 0[$r0.14]
;;
;;
	c0	stw 52[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 136[$r0.1]
;;
	c0	ldw $r0.15 = 140[$r0.1]
;;
	c0	mpyhs $r0.16 = $r0.14, 3
	c0	mpylu $r0.14 = $r0.14, 3
;;
;;
	c0	add $r0.14 = $r0.14, $r0.16
;;
	c0	sh1add $r0.14 = $r0.14, $r0.15
;;
	c0	ldh $r0.14 = 0[$r0.14]
;;
;;
	c0	stw 48[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 140[$r0.1]
;;
	c0	ldw $r0.15 = 136[$r0.1]
;;
;;
	c0	sh3add $r0.14 = $r0.15, $r0.14
;;
	c0	ldh $r0.14 = 0[$r0.14]
;;
;;
	c0	stw 44[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 136[$r0.1]
;;
	c0	ldw $r0.15 = 140[$r0.1]
;;
	c0	mpyhs $r0.16 = $r0.14, 5
	c0	mpylu $r0.14 = $r0.14, 5
;;
;;
	c0	add $r0.14 = $r0.14, $r0.16
;;
	c0	sh1add $r0.14 = $r0.14, $r0.15
;;
	c0	ldh $r0.14 = 0[$r0.14]
;;
;;
	c0	stw 40[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 136[$r0.1]
;;
	c0	ldw $r0.15 = 140[$r0.1]
;;
	c0	mpyhs $r0.16 = $r0.14, 6
	c0	mpylu $r0.14 = $r0.14, 6
;;
;;
	c0	add $r0.14 = $r0.14, $r0.16
;;
	c0	sh1add $r0.14 = $r0.14, $r0.15
;;
	c0	ldh $r0.14 = 0[$r0.14]
;;
;;
	c0	stw 36[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 136[$r0.1]
;;
	c0	ldw $r0.15 = 140[$r0.1]
;;
	c0	mpyhs $r0.16 = $r0.14, 7
	c0	mpylu $r0.14 = $r0.14, 7
;;
;;
	c0	add $r0.14 = $r0.14, $r0.16
;;
	c0	sh1add $r0.14 = $r0.14, $r0.15
;;
	c0	ldh $r0.14 = 0[$r0.14]
;;
;;
	c0	stw 32[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 44[$r0.1]
;;
	c0	ldw $r0.15 = 60[$r0.1]
;;
;;
	c0	add $r0.14 = $r0.15, $r0.14
;;
	c0	mpyhs $r0.15 = $r0.14, 46341
	c0	mpylu $r0.14 = $r0.14, 46341
;;
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	stw 132[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 44[$r0.1]
;;
	c0	ldw $r0.15 = 60[$r0.1]
;;
;;
	c0	sub $r0.14 = $r0.15, $r0.14
;;
	c0	mpyhs $r0.15 = $r0.14, 46341
	c0	mpylu $r0.14 = $r0.14, 46341
;;
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	stw 128[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 36[$r0.1]
;;
	c0	ldw $r0.15 = 52[$r0.1]
;;
	c0	mpyhs $r0.16 = $r0.14, 60547
	c0	mpylu $r0.14 = $r0.14, 60547
;;
	c0	mpylu $r0.17 = $r0.15, 25080
	c0	mpyhs $r0.15 = $r0.15, 25080
;;
	c0	add $r0.14 = $r0.14, $r0.16
;;
	c0	add $r0.15 = $r0.17, $r0.15
;;
	c0	sub $r0.14 = $r0.15, $r0.14
;;
	c0	stw 124[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 52[$r0.1]
;;
	c0	ldw $r0.15 = 36[$r0.1]
;;
	c0	mpyhs $r0.16 = $r0.14, 60547
	c0	mpylu $r0.14 = $r0.14, 60547
;;
	c0	mpylu $r0.17 = $r0.15, 25080
	c0	mpyhs $r0.15 = $r0.15, 25080
;;
	c0	add $r0.14 = $r0.14, $r0.16
;;
	c0	add $r0.15 = $r0.17, $r0.15
;;
	c0	add $r0.14 = $r0.15, $r0.14
;;
	c0	stw 120[$r0.1] = $r0.14
;;
	c0	ldw $r0.15 = 132[$r0.1]
;;
;;
	c0	add $r0.14 = $r0.15, $r0.14
;;
	c0	stw 116[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 124[$r0.1]
;;
	c0	ldw $r0.15 = 128[$r0.1]
;;
;;
	c0	add $r0.14 = $r0.15, $r0.14
;;
	c0	stw 112[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 124[$r0.1]
;;
	c0	ldw $r0.15 = 128[$r0.1]
;;
;;
	c0	sub $r0.14 = $r0.15, $r0.14
;;
	c0	stw 108[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 120[$r0.1]
;;
	c0	ldw $r0.15 = 132[$r0.1]
;;
;;
	c0	sub $r0.14 = $r0.15, $r0.14
;;
	c0	stw 104[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 40[$r0.1]
;;
	c0	ldw $r0.15 = 48[$r0.1]
;;
;;
	c0	add $r0.14 = $r0.15, $r0.14
;;
	c0	mpyhs $r0.15 = $r0.14, 46341
	c0	mpylu $r0.14 = $r0.14, 46341
;;
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	add $r0.14 = $r0.14, 8192
;;
	c0	shr $r0.14 = $r0.14, $r0.13
;;
	c0	stw 100[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 40[$r0.1]
;;
	c0	ldw $r0.15 = 48[$r0.1]
;;
;;
	c0	sub $r0.14 = $r0.15, $r0.14
;;
	c0	mpyhs $r0.15 = $r0.14, 46341
	c0	mpylu $r0.14 = $r0.14, 46341
;;
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	add $r0.14 = $r0.14, 8192
;;
	c0	shr $r0.13 = $r0.14, $r0.13
;;
	c0	stw 96[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 100[$r0.1]
;;
	c0	ldw $r0.14 = 56[$r0.1]
;;
;;
	c0	sh2add $r0.13 = $r0.14, $r0.13
;;
	c0	stw 92[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 96[$r0.1]
;;
	c0	ldw $r0.14 = 32[$r0.1]
;;
;;
	c0	sh2add $r0.13 = $r0.14, $r0.13
;;
	c0	stw 88[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 56[$r0.1]
;;
	c0	ldw $r0.14 = 100[$r0.1]
;;
	c0	shl $r0.13 = $r0.13, $r0.12
;;
	c0	sub $r0.13 = $r0.13, $r0.14
;;
	c0	stw 84[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 32[$r0.1]
;;
	c0	ldw $r0.14 = 96[$r0.1]
;;
	c0	shl $r0.12 = $r0.13, $r0.12
;;
	c0	sub $r0.12 = $r0.12, $r0.14
;;
	c0	stw 80[$r0.1] = $r0.12
;;
	c0	ldw $r0.12 = 88[$r0.1]
;;
	c0	ldw $r0.13 = 92[$r0.1]
;;
	c0	mpyhs $r0.14 = $r0.12, 3196
	c0	mpylu $r0.12 = $r0.12, 3196
;;
	c0	mpylu $r0.15 = $r0.13, 16069
	c0	mpyhs $r0.13 = $r0.13, 16069
;;
	c0	add $r0.12 = $r0.12, $r0.14
;;
	c0	add $r0.13 = $r0.15, $r0.13
;;
	c0	add $r0.12 = $r0.13, $r0.12
;;
	c0	stw 76[$r0.1] = $r0.12
;;
	c0	ldw $r0.12 = 88[$r0.1]
;;
	c0	ldw $r0.13 = 92[$r0.1]
;;
	c0	mpyhs $r0.14 = $r0.12, 16069
	c0	mpylu $r0.12 = $r0.12, 16069
;;
	c0	mpylu $r0.15 = $r0.13, 3196
	c0	mpyhs $r0.13 = $r0.13, 3196
;;
	c0	add $r0.12 = $r0.12, $r0.14
;;
	c0	add $r0.13 = $r0.15, $r0.13
;;
	c0	sub $r0.12 = $r0.13, $r0.12
;;
	c0	stw 72[$r0.1] = $r0.12
;;
	c0	ldw $r0.12 = 80[$r0.1]
;;
	c0	ldw $r0.13 = 84[$r0.1]
;;
	c0	mpyhs $r0.14 = $r0.12, 13623
	c0	mpylu $r0.12 = $r0.12, 13623
;;
	c0	mpylu $r0.15 = $r0.13, 9102
	c0	mpyhs $r0.13 = $r0.13, 9102
;;
	c0	add $r0.12 = $r0.12, $r0.14
;;
	c0	add $r0.13 = $r0.15, $r0.13
;;
	c0	add $r0.12 = $r0.13, $r0.12
;;
	c0	stw 68[$r0.1] = $r0.12
;;
	c0	ldw $r0.12 = 80[$r0.1]
;;
	c0	ldw $r0.13 = 84[$r0.1]
;;
	c0	mpyhs $r0.14 = $r0.12, 9102
	c0	mpylu $r0.12 = $r0.12, 9102
;;
	c0	mpylu $r0.15 = $r0.13, 13623
	c0	mpyhs $r0.13 = $r0.13, 13623
;;
	c0	add $r0.12 = $r0.12, $r0.14
;;
	c0	add $r0.13 = $r0.15, $r0.13
;;
	c0	sub $r0.12 = $r0.13, $r0.12
;;
	c0	stw 64[$r0.1] = $r0.12
;;
	c0	ldw $r0.12 = 76[$r0.1]
;;
	c0	ldw $r0.13 = 116[$r0.1]
;;
	c0	ldw $r0.14 = 140[$r0.1]
;;
	c0	add $r0.12 = $r0.13, $r0.12
;;
	c0	add $r0.12 = $r0.12, 65536
;;
	c0	shr $r0.12 = $r0.12, $r0.11
;;
	c0	sth 0[$r0.14] = $r0.12
;;
	c0	ldw $r0.12 = 112[$r0.1]
;;
	c0	ldw $r0.13 = 64[$r0.1]
;;
	c0	ldw $r0.14 = 140[$r0.1]
;;
	c0	add $r0.12 = $r0.12, $r0.13
;;
	c0	add $r0.12 = $r0.12, 65536
	c0	ldw $r0.13 = 136[$r0.1]
;;
	c0	shr $r0.12 = $r0.12, $r0.11
;;
	c0	sh1add $r0.13 = $r0.13, $r0.14
;;
	c0	sth 0[$r0.13] = $r0.12
;;
	c0	ldw $r0.12 = 108[$r0.1]
;;
	c0	ldw $r0.13 = 68[$r0.1]
;;
	c0	ldw $r0.14 = 140[$r0.1]
;;
	c0	add $r0.12 = $r0.12, $r0.13
;;
	c0	add $r0.12 = $r0.12, 65536
	c0	ldw $r0.13 = 136[$r0.1]
;;
	c0	shr $r0.12 = $r0.12, $r0.11
;;
	c0	sh2add $r0.13 = $r0.13, $r0.14
;;
	c0	sth 0[$r0.13] = $r0.12
;;
	c0	ldw $r0.12 = 136[$r0.1]
;;
	c0	ldw $r0.13 = 104[$r0.1]
;;
	c0	mpyhs $r0.14 = $r0.12, 3
	c0	mpylu $r0.12 = $r0.12, 3
	c0	ldw $r0.15 = 72[$r0.1]
;;
;;
	c0	add $r0.12 = $r0.12, $r0.14
	c0	add $r0.13 = $r0.13, $r0.15
	c0	ldw $r0.14 = 140[$r0.1]
;;
	c0	add $r0.13 = $r0.13, 65536
;;
	c0	sh1add $r0.12 = $r0.12, $r0.14
	c0	shr $r0.13 = $r0.13, $r0.11
;;
	c0	sth 0[$r0.12] = $r0.13
;;
	c0	ldw $r0.12 = 104[$r0.1]
;;
	c0	ldw $r0.13 = 72[$r0.1]
;;
	c0	ldw $r0.14 = 140[$r0.1]
;;
	c0	sub $r0.12 = $r0.12, $r0.13
;;
	c0	add $r0.12 = $r0.12, 65536
	c0	ldw $r0.13 = 136[$r0.1]
;;
	c0	shr $r0.12 = $r0.12, $r0.11
;;
	c0	sh3add $r0.13 = $r0.13, $r0.14
;;
	c0	sth 0[$r0.13] = $r0.12
;;
	c0	ldw $r0.12 = 136[$r0.1]
;;
	c0	ldw $r0.13 = 108[$r0.1]
;;
	c0	mpyhs $r0.14 = $r0.12, 5
	c0	mpylu $r0.12 = $r0.12, 5
	c0	ldw $r0.15 = 68[$r0.1]
;;
;;
	c0	add $r0.12 = $r0.12, $r0.14
	c0	sub $r0.13 = $r0.13, $r0.15
	c0	ldw $r0.14 = 140[$r0.1]
;;
	c0	add $r0.13 = $r0.13, 65536
;;
	c0	sh1add $r0.12 = $r0.12, $r0.14
	c0	shr $r0.13 = $r0.13, $r0.11
;;
	c0	sth 0[$r0.12] = $r0.13
;;
	c0	ldw $r0.12 = 136[$r0.1]
;;
	c0	ldw $r0.13 = 112[$r0.1]
;;
	c0	mpyhs $r0.14 = $r0.12, 6
	c0	mpylu $r0.12 = $r0.12, 6
	c0	ldw $r0.15 = 64[$r0.1]
;;
;;
	c0	add $r0.12 = $r0.12, $r0.14
	c0	sub $r0.13 = $r0.13, $r0.15
	c0	ldw $r0.14 = 140[$r0.1]
;;
	c0	add $r0.13 = $r0.13, 65536
;;
	c0	sh1add $r0.12 = $r0.12, $r0.14
	c0	shr $r0.13 = $r0.13, $r0.11
;;
	c0	sth 0[$r0.12] = $r0.13
;;
	c0	ldw $r0.12 = 136[$r0.1]
;;
	c0	ldw $r0.13 = 116[$r0.1]
;;
	c0	mpyhs $r0.14 = $r0.12, 7
	c0	mpylu $r0.12 = $r0.12, 7
	c0	ldw $r0.15 = 76[$r0.1]
;;
;;
	c0	add $r0.12 = $r0.12, $r0.14
	c0	sub $r0.13 = $r0.13, $r0.15
	c0	ldw $r0.14 = 140[$r0.1]
;;
	c0	add $r0.13 = $r0.13, 65536
;;
	c0	sh1add $r0.12 = $r0.12, $r0.14
	c0	shr $r0.11 = $r0.13, $r0.11
;;
.return ret($r0.3:s32)
	c0	sth 0[$r0.12] = $r0.11
	c0	return $r0.1 = $r0.1, 160, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @j_rev_dct
j_rev_dct::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 44[$r0.1] = $r0.57
;;
	c0	stw 40[$r0.1] = $r0.58
;;
	c0	stw 36[$r0.1] = $l0.0
;;
	c0	stw 32[$r0.1] = $r0.3
	c0	mov $r0.57 = 0
;;
	c0	stw 28[$r0.1] = $r0.57
	c0	mov $r0.58 = 1
;;
LBB4_1::                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.11 = 28[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.11, 7
;;
;;
	c0	br $b0.0, LBB4_4
;;
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB4_1 Depth=1
	c0	ldw $r0.11 = 32[$r0.1]
;;
	c0	ldw $r0.12 = 28[$r0.1]
;;
;;
	c0	sh4add $r0.3 = $r0.12, $r0.11
	c0	mov $r0.4 = $r0.58
;;
.call fast_idct_8, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = fast_idct_8
;;
## BB#3:                                ## %for.inc
                                        ##   in Loop: Header=BB4_1 Depth=1
	c0	ldw $r0.11 = 28[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	goto LBB4_1
;;
LBB4_4::                                ## %for.end
	c0	stw 28[$r0.1] = $r0.57
	c0	mov $r0.57 = 8
;;
LBB4_5::                                ## %for.cond1
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.11 = 28[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.11, 7
;;
;;
	c0	br $b0.0, LBB4_8
;;
## BB#6:                                ## %for.body3
                                        ##   in Loop: Header=BB4_5 Depth=1
	c0	ldw $r0.11 = 32[$r0.1]
;;
	c0	ldw $r0.12 = 28[$r0.1]
;;
;;
	c0	sh1add $r0.3 = $r0.12, $r0.11
	c0	mov $r0.4 = $r0.57
;;
.call fast_idct_8, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = fast_idct_8
;;
## BB#7:                                ## %for.inc5
                                        ##   in Loop: Header=BB4_5 Depth=1
	c0	ldw $r0.11 = 28[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	goto LBB4_5
;;
LBB4_8::                                ## %for.end7
	c0	ldw $l0.0 = 36[$r0.1]
;;
	c0	ldw $r0.58 = 40[$r0.1]
;;
	c0	ldw $r0.57 = 44[$r0.1]
;;
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @dquantz_lum
dquantz_lum::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $r0.3
	c0	mov $r0.11 = 0
;;
	c0	stw 24[$r0.1] = $r0.11
	c0	mov $r0.11 = qtbl_lum
;;
LBB5_1::                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.12 = 24[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.12, 63
;;
;;
	c0	br $b0.0, LBB5_4
;;
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB5_1 Depth=1
	c0	ldw $r0.12 = 28[$r0.1]
;;
	c0	ldw $r0.13 = 24[$r0.1]
;;
;;
	c0	add $r0.14 = $r0.11, $r0.13
	c0	sh1add $r0.12 = $r0.13, $r0.12
;;
	c0	ldbu $r0.13 = 0[$r0.14]
;;
	c0	ldh $r0.14 = 0[$r0.12]
;;
;;
	c0	mpylu $r0.15 = $r0.14, $r0.13
	c0	mpyhs $r0.13 = $r0.14, $r0.13
;;
;;
	c0	add $r0.13 = $r0.15, $r0.13
;;
	c0	sth 0[$r0.12] = $r0.13
;;
## BB#3:                                ## %for.inc
                                        ##   in Loop: Header=BB5_1 Depth=1
	c0	ldw $r0.12 = 24[$r0.1]
;;
;;
	c0	add $r0.12 = $r0.12, 1
;;
	c0	stw 24[$r0.1] = $r0.12
	c0	goto LBB5_1
;;
LBB5_4::                                ## %for.end
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg() ## @main
main::
## BB#0:                                ## %entry
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
	c0	stw 60[$r0.1] = $l0.0
	c0	mov $r0.57 = 0
	c0	mov $r0.11 = lastlong
;;
	c0	mov $r0.12 = bitsleft
	c0	mov $r0.13 = huffbits
;;
	c0	stw 56[$r0.1] = $r0.57
;;
	c0	stw 0[$r0.11] = $r0.57
	c0	mov $r0.11 = nextlong
;;
	c0	stw 0[$r0.12] = $r0.57
;;
	c0	stw 0[$r0.11] = $r0.13
;;
	c0	stw 28[$r0.1] = $r0.57
;;
	c0	stw 52[$r0.1] = $r0.57
	c0	add $r0.60 = $r0.1, 24
	c0	mov $r0.59 = 7
;;
	c0	mov $r0.58 = dct_data
;;
LBB6_1::                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.11 = 52[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.11, 599
;;
;;
	c0	br $b0.0, LBB6_3
;;
## BB#2:                                ## %for.inc
                                        ##   in Loop: Header=BB6_1 Depth=1
	c0	mov $r0.3 = $r0.60
;;
.call huff_dc_dec, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = huff_dc_dec
;;
	c0	ldw $r0.11 = 52[$r0.1]
;;
;;
	c0	shl $r0.11 = $r0.11, $r0.59
	c0	ldw $r0.12 = 24[$r0.1]
;;
	c0	ldw $r0.13 = 28[$r0.1]
	c0	add $r0.11 = $r0.58, $r0.11
;;
;;
	c0	add $r0.12 = $r0.12, $r0.13
;;
	c0	sth 0[$r0.11] = $r0.12
;;
	c0	ldw $r0.11 = 52[$r0.1]
;;
;;
	c0	shl $r0.11 = $r0.11, $r0.59
;;
	c0	add $r0.11 = $r0.58, $r0.11
;;
	c0	ldh $r0.11 = 0[$r0.11]
;;
;;
	c0	stw 28[$r0.1] = $r0.11
;;
	c0	ldw $r0.11 = 52[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 52[$r0.1] = $r0.11
	c0	goto LBB6_1
;;
LBB6_3::                                ## %for.end
	c0	stw 52[$r0.1] = $r0.57
;;
LBB6_4::                                ## %for.cond6
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.11 = 52[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.11, 599
;;
;;
	c0	br $b0.0, LBB6_6
;;
## BB#5:                                ## %for.inc12
                                        ##   in Loop: Header=BB6_4 Depth=1
	c0	ldw $r0.11 = 52[$r0.1]
;;
;;
	c0	shl $r0.11 = $r0.11, $r0.59
;;
	c0	add $r0.3 = $r0.58, $r0.11
;;
.call huff_ac_dec, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = huff_ac_dec
;;
	c0	ldw $r0.11 = 52[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 52[$r0.1] = $r0.11
	c0	goto LBB6_4
;;
LBB6_6::                                ## %for.end14
	c0	stw 32[$r0.1] = $r0.58
;;
	c0	stw 52[$r0.1] = $r0.57
;;
LBB6_7::                                ## %for.cond15
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.11 = 52[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.11, 599
;;
;;
	c0	br $b0.0, LBB6_9
;;
## BB#8:                                ## %for.inc20
                                        ##   in Loop: Header=BB6_7 Depth=1
	c0	ldw $r0.11 = 52[$r0.1]
;;
;;
	c0	shl $r0.11 = $r0.11, $r0.59
	c0	ldw $r0.12 = 32[$r0.1]
;;
;;
	c0	add $r0.3 = $r0.12, $r0.11
;;
.call dquantz_lum, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = dquantz_lum
;;
	c0	ldw $r0.11 = 52[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 52[$r0.1] = $r0.11
	c0	goto LBB6_7
;;
LBB6_9::                                ## %for.end22
	c0	stw 32[$r0.1] = $r0.58
;;
	c0	stw 52[$r0.1] = $r0.57
;;
LBB6_10::                               ## %for.cond23
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.11 = 52[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.11, 599
;;
;;
	c0	br $b0.0, LBB6_12
;;
## BB#11:                               ## %for.inc29
                                        ##   in Loop: Header=BB6_10 Depth=1
	c0	ldw $r0.11 = 52[$r0.1]
;;
;;
	c0	shl $r0.11 = $r0.11, $r0.59
	c0	ldw $r0.12 = 32[$r0.1]
;;
;;
	c0	add $r0.3 = $r0.12, $r0.11
;;
.call j_rev_dct, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = j_rev_dct
;;
	c0	ldw $r0.11 = 52[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 52[$r0.1] = $r0.11
	c0	goto LBB6_10
;;
LBB6_12::                               ## %for.end31
	c0	mov $r0.11 = 38400
;;
	c0	stw 20[$r0.1] = $r0.11
;;
	c0	stw 16[$r0.1] = $r0.57
;;
	c0	stw 36[$r0.1] = $r0.57
;;
	c0	stw 52[$r0.1] = $r0.57
	c0	mov $r0.11 = ncols
	c0	mov $r0.12 = 3
;;
LBB6_13::                               ## %for.cond32
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB6_15 Depth 2
                                        ##       Child Loop BB6_17 Depth 3
                                        ##         Child Loop BB6_19 Depth 4
	c0	ldw $r0.13 = 20[$r0.1]
;;
	c0	ldw $r0.14 = 52[$r0.1]
;;
;;
	c0	cmpge $b0.0 = $r0.14, $r0.13
;;
;;
	c0	br $b0.0, LBB6_24
;;
## BB#14:                               ## %for.body35
                                        ##   in Loop: Header=BB6_13 Depth=1
	c0	stw 48[$r0.1] = $r0.57
;;
LBB6_15::                               ## %for.cond36
                                        ##   Parent Loop BB6_13 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB6_17 Depth 3
                                        ##         Child Loop BB6_19 Depth 4
	c0	ldw $r0.13 = 48[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.13, 63
;;
;;
	c0	br $b0.0, LBB6_23
;;
## BB#16:                               ## %for.body39
                                        ##   in Loop: Header=BB6_15 Depth=2
	c0	stw 44[$r0.1] = $r0.57
;;
LBB6_17::                               ## %for.cond40
                                        ##   Parent Loop BB6_13 Depth=1
                                        ##     Parent Loop BB6_15 Depth=2
                                        ## =>    This Loop Header: Depth=3
                                        ##         Child Loop BB6_19 Depth 4
	c0	ldw $r0.13 = 44[$r0.1]
;;
	c0	ldw $r0.14 = 0[$r0.11]
;;
;;
	c0	shl $r0.14 = $r0.14, $r0.12
;;
	c0	cmpge $b0.0 = $r0.13, $r0.14
;;
;;
	c0	br $b0.0, LBB6_22
;;
## BB#18:                               ## %for.body44
                                        ##   in Loop: Header=BB6_17 Depth=3
	c0	stw 40[$r0.1] = $r0.57
;;
LBB6_19::                               ## %for.cond45
                                        ##   Parent Loop BB6_13 Depth=1
                                        ##     Parent Loop BB6_15 Depth=2
                                        ##       Parent Loop BB6_17 Depth=3
                                        ## =>      This Inner Loop Header: Depth=4
	c0	ldw $r0.13 = 40[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.13, 7
;;
;;
	c0	br $b0.0, LBB6_21
;;
## BB#20:                               ## %for.inc56
                                        ##   in Loop: Header=BB6_19 Depth=4
	c0	ldw $r0.13 = 44[$r0.1]
;;
	c0	ldw $r0.14 = 40[$r0.1]
;;
	c0	ldw $r0.15 = 48[$r0.1]
;;
	c0	add $r0.13 = $r0.14, $r0.13
;;
	c0	add $r0.13 = $r0.13, $r0.15
	c0	ldw $r0.14 = 52[$r0.1]
;;
	c0	ldw $r0.15 = 16[$r0.1]
;;
	c0	add $r0.13 = $r0.13, $r0.14
;;
	c0	sh1add $r0.13 = $r0.13, $r0.58
;;
	c0	ldh $r0.13 = 0[$r0.13]
;;
;;
	c0	add $r0.13 = $r0.13, $r0.15
;;
	c0	add $r0.13 = $r0.13, 64
;;
	c0	stw 16[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 40[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.13, 1
;;
	c0	stw 40[$r0.1] = $r0.13
	c0	goto LBB6_19
;;
LBB6_21::                               ## %for.inc59
                                        ##   in Loop: Header=BB6_17 Depth=3
	c0	ldw $r0.13 = 44[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.13, 64
;;
	c0	stw 44[$r0.1] = $r0.13
	c0	goto LBB6_17
;;
LBB6_22::                               ## %for.inc62
                                        ##   in Loop: Header=BB6_15 Depth=2
	c0	ldw $r0.13 = 48[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.13, 8
;;
	c0	stw 48[$r0.1] = $r0.13
	c0	goto LBB6_15
;;
LBB6_23::                               ## %for.inc65
                                        ##   in Loop: Header=BB6_13 Depth=1
	c0	ldw $r0.13 = 52[$r0.1]
;;
	c0	ldw $r0.14 = 0[$r0.11]
;;
;;
	c0	sh3add $r0.13 = $r0.14, $r0.13
;;
	c0	stw 52[$r0.1] = $r0.13
	c0	goto LBB6_13
;;
LBB6_24::                               ## %for.end68
	c0	ldw $r0.11 = 16[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 2598822
;;
;;
	c0	br $b0.0, LBB6_26
;;
## BB#25:                               ## %if.then
	c0	mov $r0.3 = .str
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	mov $r0.11 = 15
;;
	c0	stw 56[$r0.1] = $r0.11
	c0	goto LBB6_27
;;
LBB6_26::                               ## %if.else
	c0	mov $r0.3 = .str1
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	mov $r0.11 = 66
;;
	c0	stw 56[$r0.1] = $r0.11
;;
LBB6_27::                               ## %return
	c0	ldw $r0.3 = 56[$r0.1]
;;
	c0	ldw $l0.0 = 60[$r0.1]
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

	.align	4                       ## @ncols
ncols::
	.data4	240                     ## 0xf0

	.align	4                       ## @nrows
nrows::
	.data4	160                     ## 0xa0

	.align	4                       ## @huffbits
huffbits::
	.data4	3547756150              ## 0xd3767676
	.data4	2903208832              ## 0xad0b7380
	.data4	134744098               ## 0x8080822
	.data4	573943150               ## 0x2235ad6e
	.data4	1465576700              ## 0x575aecfc
	.data4	3176814183              ## 0xbd5a5667
	.data4	67391764                ## 0x4045114
	.data4	272910005               ## 0x104446b5
	.data4	2915691301              ## 0xadc9eb25
	.data4	2744101202              ## 0xa38fa952
	.data4	1526727176              ## 0x5b000208
	.data4	944833606               ## 0x38510446
	.data4	3045968618              ## 0xb58dcaea
	.data4	1689225127              ## 0x64af87a7
	.data4	1514864649              ## 0x5a4b0009
	.data4	489181901               ## 0x1d2852cd
	.data4	4155017357              ## 0xf7a8888d
	.data4	1666946004              ## 0x635b93d4
	.data4	741907061               ## 0x2c389a75
	.data4	3714319029              ## 0xdd6402b5
	.data4	416868159               ## 0x18d8e73f
	.data4	1916866843              ## 0x7241111b
	.data4	611045236               ## 0x246bcf74
	.data4	2869309084              ## 0xab062e9c
	.data4	631506661               ## 0x25a406e5
	.data4	1183653018              ## 0x468d1c9a
	.data4	3604021505              ## 0xd6d10101
	.data4	821712267               ## 0x30fa558b
	.data4	256779995               ## 0xf4e26db
	.data4	1082860135              ## 0x408b2267
	.data4	2830125488              ## 0xa8b049b0
	.data4	2971699498              ## 0xb120892a
	.data4	1651796766              ## 0x62746b1e
	.data4	378739048               ## 0x16931968
	.data4	1416510901              ## 0x546e3db5
	.data4	2078443085              ## 0x7be2864d
	.data4	579613259               ## 0x228c324b
	.data4	1531304093              ## 0x5b45d89d
	.data4	416038150               ## 0x18cc3d06
	.data4	3312210490              ## 0xc56c523a
	.data4	1925484429              ## 0x72c48f8d
	.data4	1842948803              ## 0x6dd92ac3
	.data4	736148204               ## 0x2be0baec
	.data4	1585475093              ## 0x5e806e15
	.data4	4102740131              ## 0xf48ad8a3
	.data4	725217452               ## 0x2b39f0ac
	.data4	2360425450              ## 0x8cb13bea
	.data4	3345098989              ## 0xc76228ed
	.data4	2922313880              ## 0xae2ef898
	.data4	935865866               ## 0x37c82e0a
	.data4	362357522               ## 0x15992312
	.data4	1152842064              ## 0x44b6f950
	.data4	109954526               ## 0x68dc5de
	.data4	1457610101              ## 0x56e15d75
	.data4	2072645262              ## 0x7b8a0e8e
	.data4	2878352475              ## 0xab902c5b
	.data4	1820336675              ## 0x6c802223
	.data4	1912013574              ## 0x71f70306
	.data4	3958070353              ## 0xebeb5c51
	.data4	4197303395              ## 0xfa2dc463
	.data4	3337103650              ## 0xc6e82922
	.data4	2294725049              ## 0x88c6b9b9
	.data4	459375982               ## 0x1b61856e
	.data4	1255609818              ## 0x4ad715da
	.data4	4073129557              ## 0xf2c70655
	.data4	1152738761              ## 0x44b565c9
	.data4	581051217               ## 0x22a22351
	.data4	3646611847              ## 0xd95ae187
	.data4	1784330086              ## 0x6a5ab766
	.data4	3583094115              ## 0xd591ad63
	.data4	1793546583              ## 0x6ae75957
	.data4	2990605345              ## 0xb2410421
	.data4	3112938008              ## 0xb98baa18
	.data4	3055987635              ## 0xb626abb3
	.data4	2796082736              ## 0xa6a8d630
	.data4	1279910939              ## 0x4c49e41b
	.data4	629650609               ## 0x2587b4b1
	.data4	159753240               ## 0x985a418
	.data4	3553568490              ## 0xd3cf26ea
	.data4	2184328763              ## 0x8232363b
	.data4	79578838                ## 0x4be46d6
	.data4	1504914084              ## 0x59b32aa4
	.data4	2025456015              ## 0x78ba018f
	.data4	1034786609              ## 0x3dad9731
	.data4	298654494               ## 0x11cd1b1e
	.data4	1835864456              ## 0x6d6d1188
	.data4	965915923               ## 0x3992b513
	.data4	1061958245              ## 0x3f4c3265
	.data4	3669301248              ## 0xdab51800
	.data4	3870506630              ## 0xe6b33e86
	.data4	2740620004              ## 0xa35a8ae4
	.data4	1360215898              ## 0x51133f5a
	.data4	1164696746              ## 0x456bdcaa
	.data4	956634648               ## 0x39051618
	.data4	1903567459              ## 0x71762263
	.data4	1230713606              ## 0x495b3306
	.data4	3884586413              ## 0xe78a15ad
	.data4	266191997               ## 0xfddc47d
	.data4	3445289274              ## 0xcd5af13a
	.data4	3504953311              ## 0xd0e957df
	.data4	3951557557              ## 0xeb87fbb5
	.data4	1718840479              ## 0x66736c9f
	.data4	1255128422              ## 0x4acfbd66
	.data4	3018807799              ## 0xb3ef59f7
	.data4	2899733301              ## 0xacd66b35
	.data4	2597152426              ## 0x9acd66aa
	.data4	2870301765              ## 0xab155445
	.data4	289836314               ## 0x11468d1a
	.data4	896944531               ## 0x35764993
	.data4	2478843668              ## 0x93c02714
	.data4	2729532104              ## 0xa2b15ac8
	.data4	4257507325              ## 0xfdc467fd
	.data4	2951303281              ## 0xafe95071
	.data4	855468410               ## 0x32fd697a
	.data4	1442314965              ## 0x55f7fad5
	.data4	4199911935              ## 0xfa5591ff
	.data4	1180592949              ## 0x465e6b35
	.data4	2597152435              ## 0x9acd66b3
	.data4	1436208469              ## 0x559acd55
	.data4	1431655761              ## 0x55555551
	.data4	2739309850              ## 0xa3468d1a
	.data4	3154073726              ## 0xbbff587e
	.data4	2794771187              ## 0xa694d2f3
	.data4	1523253154              ## 0x5acaffa2
	.data4	704605311               ## 0x29ff6c7f
	.data4	592551902               ## 0x23519fde
	.data4	2815858597              ## 0xa7d697a5
	.data4	1602086115              ## 0x5f7de4e3
	.data4	3042516980              ## 0xb5591ff4
	.data4	1911925974              ## 0x71f5acd6
	.data4	1798675114              ## 0x6b359aaa
	.data4	3446060810              ## 0xcd66b70a
	.data4	4078385352              ## 0xf31738c8
	.data4	2899662178              ## 0xacd55562
	.data4	2974044579              ## 0xb14451a3
	.data4	1183652540              ## 0x468d1abc
	.data4	4284217498              ## 0xff5bf89a
	.data4	110213549               ## 0x691b9ad
	.data4	1550238975              ## 0x5c66c4ff
	.data4	3190372497              ## 0xbe293891
	.data4	2125768586              ## 0x7eb4a78a
	.data4	3204318038              ## 0xbefe0356
	.data4	670506893               ## 0x27f71f8d
	.data4	1722460981              ## 0x66aaab35
	.data4	1389110023              ## 0x52cc2307
	.data4	3114888740              ## 0xb9a96e24
	.data4	1015254945              ## 0x3c838fa1
	.data4	2738618232              ## 0xa33bff78
	.data4	4269060913              ## 0xfe74b331
	.data4	1030372274              ## 0x3d6a3bb2
	.data4	2381517381              ## 0x8df31245
	.data4	1159907457              ## 0x4522c881
	.data4	2498844042              ## 0x94f1558a
	.data4	2890994792              ## 0xac511468
	.data4	3517138607              ## 0xd1a346af
	.data4	2144796198              ## 0x7fd6fe26
	.data4	2820330574              ## 0xa81ad44e
	.data4	1818225193              ## 0x6c5fea29
	.data4	2129848278              ## 0x7ef2e7d6
	.data4	2476780511              ## 0x93a0abdf
	.data4	3132449407              ## 0xbab5627f
	.data4	1960794794              ## 0x74df5aaa
	.data4	2863369117              ## 0xaaab8b9d
	.data4	2225272302              ## 0x84a2f5ee
	.data4	1772480258              ## 0x69a5e702
	.data4	2649910069              ## 0x9df26b35
	.data4	432120441               ## 0x19c1a279
	.data4	2876998412              ## 0xab7b830c
	.data4	2156903034              ## 0x808fba7a
	.data4	2323651027              ## 0x8a8019d3
	.data4	1952674037              ## 0x746370f5
	.data4	2938260605              ## 0xaf224c7d
	.data4	3755392137              ## 0xdfd6bc89
	.data4	1069055802              ## 0x3fb87f3a
	.data4	4062576359              ## 0xf225fee7
	.data4	3948898199              ## 0xeb5f6797
	.data4	4221545755              ## 0xfb9fad1b
	.data4	2038413419              ## 0x797fb86b
	.data4	3975353229              ## 0xecf3138d
	.data4	2222694036              ## 0x847b9e94
	.data4	745684950               ## 0x2c723fd6
	.data4	1627371846              ## 0x60ffb946
	.data4	3506672695              ## 0xd1039437
	.data4	169595651               ## 0xa1bd303
	.data4	1070505673              ## 0x3fce9ec9
	.data4	1363751699              ## 0x51493313
	.data4	3960733615              ## 0xec13ffaf
	.data4	1474300366              ## 0x57e009ce
	.data4	239500586               ## 0xe467d2a
	.data4	2868615993              ## 0xaafb9b39
	.data4	672159869               ## 0x2810587d
	.data4	1765731678              ## 0x693eed5e
	.data4	2141937581              ## 0x7fab5fad
	.data4	1486852542              ## 0x589f91be
	.data4	3042269607              ## 0xb55559a7
	.data4	1839750096              ## 0x6da85bd0
	.data4	1405750035              ## 0x53ca0b13
	.data4	3705099084              ## 0xdcd7534c
	.data4	722742044               ## 0x2b142b1c
	.data4	1957351982              ## 0x74aad22e
	.data4	430078834               ## 0x19a27b72
	.data4	1188153364              ## 0x46d1c814
	.data4	1619769983              ## 0x608bba7f
	.data4	3821534315              ## 0xe3c7fc6b
	.data4	3381395065              ## 0xc98bfe79
	.data4	4293117948              ## 0xffe3c7fc
	.data4	1808437246              ## 0x6bca8ffe
	.data4	2039469756              ## 0x798fd6bc
	.data4	3053380351              ## 0xb5fee2ff
	.data4	3744837895              ## 0xdf35b107
	.data4	4029152754              ## 0xf027fdf2
	.data4	721959712               ## 0x2b083b20
	.data4	4228214609              ## 0xfc056f51
	.data4	4232085045              ## 0xfc407e35
	.data4	3866771435              ## 0xe67a3feb
	.data4	1288456158              ## 0x4ccc47de
	.data4	670149615               ## 0x27f1abef
	.data4	4122971402              ## 0xf5bf8d0a
	.data4	2882432293              ## 0xabce6d25
	.data4	4285971754              ## 0xff76bd2a
	.data4	871533244               ## 0x33f28abc
	.data4	3860985259              ## 0xe621f5ab
	.data4	512751018               ## 0x1e8ff5aa
	.data4	2863375243              ## 0xaaaba38b
	.data4	1996116459              ## 0x76fa51eb
	.data4	1369851257              ## 0x51a64579
	.data4	1503727163              ## 0x59a10e3b
	.data4	1350732864              ## 0x50828c40
	.data4	177549768               ## 0xa9531c8
	.data4	2869373298              ## 0xab072972
	.data4	810076359               ## 0x3048c8c7
	.data4	344748930               ## 0x148c7382
	.data4	1945478698              ## 0x73f5a62a
	.data4	2737049546              ## 0xa3240fca
	.data4	2591572455              ## 0x9a7841e7
	.data4	4183284269              ## 0xf957da2d
	.data4	4257214362              ## 0xfdbfef9a
	.data4	331512447               ## 0x13c27a7f
	.data4	711694420               ## 0x2a6b9854
	.data4	4065322335              ## 0xf24fe55f
	.data4	1804016073              ## 0x6b8719c9
	.data4	4238880869              ## 0xfca83065
	.data4	205132186               ## 0xc3a119a
	.data4	1855291390              ## 0x6e957ffe
	.data4	3153308331              ## 0xbbf3aaab
	.data4	2683893399              ## 0x9ff8f697
	.data4	4258487673              ## 0xfdd35d79
	.data4	2832190295              ## 0xa8cfcb57
	.data4	1556347093              ## 0x5cc3f8d5
	.data4	2449211269              ## 0x91fbff85
	.data4	1723028819              ## 0x66b35553
	.data4	788044103               ## 0x2ef89947
	.data4	1900365949              ## 0x7145487d
	.data4	2813225057              ## 0xa7ae6861
	.data4	381476285               ## 0x16bcddbd
	.data4	1423068301              ## 0x54d24c8d
	.data4	1167329897              ## 0x45940a69
	.data4	1674457938              ## 0x63ce3352
	.data4	2429186394              ## 0x90ca715a
	.data4	1954123961              ## 0x747990b9
	.data4	3892778175              ## 0xe80714bf
	.data4	2018886082              ## 0x7855c1c2
	.data4	2848397737              ## 0xa9c719a9
	.data4	1105173633              ## 0x41df9c81
	.data4	1560869262              ## 0x5d08f98e
	.data4	1038759389              ## 0x3dea35dd
	.data4	3370667868              ## 0xc8e84f5c
	.data4	1405527136              ## 0x53c6a460
	.data4	4048488732              ## 0xf14f091c
	.data4	2207940734              ## 0x839a807e
	.data4	3795648372              ## 0xe23cff74
	.data4	1400155459              ## 0x5374ad43
	.data4	4252493653              ## 0xfd77e755
	.data4	1408462624              ## 0x53f36f20
	.data4	4284798826              ## 0xff64d76a
	.data4	2365366958              ## 0x8cfca2ae
	.data4	2144640941              ## 0x7fd49fad
	.data4	1495243263              ## 0x591f99ff
	.data4	178965844               ## 0xaaacd54
	.data4	3428135100              ## 0xcc5530bc
	.data4	333351595               ## 0x13de8aab
	.data4	3356091835              ## 0xc809e5bb
	.data4	2590570254              ## 0x9a68f70e
	.data4	683989476               ## 0x28c4d9e4
	.data4	2472435231              ## 0x935e5e1f
	.data4	3533969667              ## 0xd2a41903
	.data4	109187145               ## 0x6821049
	.data4	66364994                ## 0x3f4a642
	.data4	3418882202              ## 0xcbc8009a
	.data4	3004711431              ## 0xb3184207
	.data4	1848145173              ## 0x6e287515
	.data4	1891356672              ## 0x70bbd000
	.data4	1909273088              ## 0x71cd3200
	.data4	3630319668              ## 0xd8624834
	.data4	3507282016              ## 0xd10ce060
	.data4	1673407026              ## 0x63be2a32
	.data4	1104806255              ## 0x41da016f
	.data4	1364080644              ## 0x514e3804
	.data4	4238867886              ## 0xfca7fdae
	.data4	709760800               ## 0x2a4e1720
	.data4	486148736               ## 0x1cfa0a80
	.data4	3859037866              ## 0xe6043eaa
	.data4	699093272               ## 0x29ab5118
	.data4	2485103957              ## 0x941fad55
	.data4	1271672830              ## 0x4bcc2ffe
	.data4	3925759448              ## 0xe9fe55d8
	.data4	3561481237              ## 0xd447e415
	.data4	1912513749              ## 0x71fea4d5
	.data4	2583288809              ## 0x99f9dbe9
	.data4	1504499028              ## 0x59acd554
	.data4	2344185897              ## 0x8bb97029
	.data4	2485328470              ## 0x94231a56
	.data4	2858811833              ## 0xaa6601b9
	.data4	885356737               ## 0x34c578c1
	.data4	2688067855              ## 0xa038a90f
	.data4	2774196265              ## 0xa55ae029
	.data4	4114403562              ## 0xf53cd0ea
	.data4	700522580               ## 0x29c12054
	.data4	3518754839              ## 0xd1bbf017
	.data4	2324618816              ## 0x8a8ede40
	.data4	3882998973              ## 0xe771dcbd
	.data4	2168285227              ## 0x813d682b
	.data4	2853349431              ## 0xaa12a837
	.data4	2053553319              ## 0x7a66bca7
	.data4	1879878217              ## 0x700caa49
	.data4	4107225720              ## 0xf4cf4a78
	.data4	2755406968              ## 0xa43c2c78
	.data4	4232397834              ## 0xfc45440a
	.data4	3296758800              ## 0xc4808c10
	.data4	831141289               ## 0x318a35a9
	.data4	2142180692              ## 0x7faf1554
	.data4	4240884733              ## 0xfcc6c3fd
	.data4	2470879551              ## 0x9346a13f
	.data4	548114421               ## 0x20ab8ff5
	.data4	760645623               ## 0x2d5687f7
	.data4	2918492842              ## 0xadf4aaaa
	.data4	2861851023              ## 0xaa94618f
	.data4	884325122               ## 0x34b5bb02
	.data4	2607377564              ## 0x9b696c9c
	.data4	1371961541              ## 0x51c678c5
	.data4	115511578               ## 0x6e2911a
	.data4	1500950486              ## 0x5976afd6
	.data4	3165723562              ## 0xbcb11baa
	.data4	2414792939              ## 0x8feed0eb
	.data4	1571523242              ## 0x5dab8aaa
	.data4	2855562067              ## 0xaa346b53
	.data4	4284230313              ## 0xff5c2aa9
	.data4	3203005015              ## 0xbee9fa57
	.data4	2906682136              ## 0xad407318
	.data4	2852115639              ## 0xa9ffd4b7
	.data4	3534569430              ## 0xd2ad3fd6
	.data4	2678412906              ## 0x9fa5566a
	.data4	2836708229              ## 0xa914bb85
	.data4	491367400               ## 0x1d49abe8
	.data4	436799545               ## 0x1a090839
	.data4	552877748               ## 0x20f43eb4
	.data4	237707505               ## 0xe2b20f1
	.data4	1582885376              ## 0x5e58ea00
	.data4	2912868602              ## 0xad9ed8fa
	.data4	1463932589              ## 0x5741d6ad
	.data4	294578435               ## 0x118ee903
	.data4	854822414               ## 0x32f38e0e
	.data4	709868559               ## 0x2a4fbc0f
	.data4	2085948074              ## 0x7c550aaa
	.data4	2862770390              ## 0xaaa268d6
	.data4	2852043115              ## 0xa9feb96b
	.data4	899298426               ## 0x359a347a
	.data4	2595700667              ## 0x9ab73fbb
	.data4	355465894               ## 0x152ffaa6
	.data4	4199919610              ## 0xfa55affa
	.data4	4022512298              ## 0xefc2aaaa
	.data4	879303714               ## 0x34691c22
	.data4	210982646               ## 0xc9356f6
	.data4	1645460878              ## 0x6213bd8e
	.data4	3871821642              ## 0xe6c74f4a
	.data4	3129494661              ## 0xba884c85
	.data4	468776617               ## 0x1bf0f6a9
	.data4	3782745868              ## 0xe1781f0c
	.data4	955017242               ## 0x38ec681a
	.data4	256701578               ## 0xf4cf48a
	.data4	1684246023              ## 0x64638e07
	.data4	2908466720              ## 0xad5bae20
	.data4	1614486160              ## 0x603b1a90
	.data4	2429040833              ## 0x90c838c1
	.data4	356690611               ## 0x1542aab3
	.data4	1387354313              ## 0x52b158c9
	.data4	1368648017              ## 0x5193e951
	.data4	1214533061              ## 0x48644dc5
	.data4	1993421901              ## 0x76d1344d
	.data4	1788865367              ## 0x6a9feb57
	.data4	4054502739              ## 0xf1aacd53
	.data4	2112091563              ## 0x7de3f5ab
	.data4	1677439314              ## 0x63fbb152
	.data4	2141941669              ## 0x7fab6fa5
	.data4	1535094303              ## 0x5b7fae1f
	.data4	1252691510              ## 0x4aaa8e36
	.data4	2441257161              ## 0x9182a0c9
	.data4	896336577               ## 0x356d02c1
	.data4	503786622               ## 0x1e072c7e
	.data4	4059409009              ## 0xf1f5aa71
	.data4	3955796258              ## 0xebc8a922
	.data4	1494706944              ## 0x59176b00
	.data4	1163717103              ## 0x455ce9ef
	.data4	422387499               ## 0x192d1f2b
	.data4	3896150561              ## 0xe83a8a21
	.data4	2265362923              ## 0x8706b1eb
	.data4	1353636039              ## 0x50aed8c7
	.data4	3207924217              ## 0xbf3509f9
	.data4	410768512               ## 0x187bd480
	.data4	3843007846              ## 0xe50fa566
	.data4	2179117913              ## 0x81e2b359
	.data4	2899391898              ## 0xacd1359a
	.data4	646204611               ## 0x26844cc3
	.data4	563606445               ## 0x2197f3ad
	.data4	1493875815              ## 0x590abc67
	.data4	712220295               ## 0x2a739e87
	.data4	3914701341              ## 0xe9559a1d
	.data4	1778318205              ## 0x69fefb7d
	.data4	1792605932              ## 0x6ad8feec
	.data4	1409264495              ## 0x53ffab6f
	.data4	2774245343              ## 0xa55b9fdf
	.data4	761703917               ## 0x2d66aded
	.data4	3732140784              ## 0xde73f2f0
	.data4	2745775364              ## 0xa3a93504
	.data4	151183687               ## 0x902e147
	.data4	1036642923              ## 0x3dc9ea6b
	.data4	902885710               ## 0x35d0f14e
	.data4	3696690278              ## 0xdc570466
	.data4	2295156586              ## 0x88cd4f6a
	.data4	2458706701              ## 0x928ce30d
	.data4	3928539222              ## 0xea28c056
	.data4	1840386208              ## 0x6db210a0
	.data4	1999970925              ## 0x7735226d
	.data4	3240064244              ## 0xc11f74f4
	.data4	2823689662              ## 0xa84e15be
	.data4	3035368111              ## 0xb4ec0aaf
	.data4	1868781984              ## 0x6f6359a0
	.data4	2024593130              ## 0x78acd6ea
	.data4	4189917157              ## 0xf9bd0fe5
	.data4	1483730615              ## 0x586feeb7
	.data4	3848166567              ## 0xe55e5ca7
	.data4	4267294717              ## 0xfe59bffd
	.data4	4066953919              ## 0xf268cabf
	.data4	3726613830              ## 0xde1f9d46
	.data4	54832128                ## 0x344ac00
	.data4	962508203               ## 0x395eb5ab
	.data4	1972105726              ## 0x758bf1fe
	.data4	2505313611              ## 0x95540d4b
	.data4	4273340070              ## 0xfeb5fea6
	.data4	2911891141              ## 0xad8feec5
	.data4	937193381               ## 0x37dc6fa5
	.data4	1107212650              ## 0x41feb96a
	.data4	3469527943              ## 0xcecccb87
	.data4	2474961981              ## 0x9384ec3d
	.data4	1744871424              ## 0x6800a000
	.data4	805654991               ## 0x300551cf
	.data4	2905720659              ## 0xad31c753
	.data4	1491578166              ## 0x58e7ad36
	.data4	1437739910              ## 0x55b22b86
	.data4	420757933               ## 0x191441ad
	.data4	1381049809              ## 0x525125d1
	.data4	1345864079              ## 0x5038418f
	.data4	3333203677              ## 0xc6aca6dd
	.data4	1813088221              ## 0x6c1187dd
	.data4	3771862127              ## 0xe0d20c6f
	.data4	44395969                ## 0x2a56dc1
	.data4	238145347               ## 0xe31cf43
	.data4	1156665530              ## 0x44f150ba
	.data4	117830016               ## 0x705f180
	.data4	999084186               ## 0x3b8cd09a
	.data4	314584177               ## 0x12c02c71
	.data4	2678469625              ## 0x9fa633f9
	.data4	452138111               ## 0x1af3147f
	.data4	1954365464              ## 0x747d4018
	.data4	2812102848              ## 0xa79d48c0
	.data4	2540303640              ## 0x9769f518
	.data4	2834191728              ## 0xa8ee5570
	.data4	607897214               ## 0x243bc67e
	.data4	4140590059              ## 0xf6cc63eb
	.data4	1294318320              ## 0x4d25baf0
	.data4	3309208662              ## 0xc53e8456
	.data4	1962015792              ## 0x74f1fc30
	.data4	267913391               ## 0xff808af
	.data4	1054652116              ## 0x3edcb6d4
	.data4	1979056214              ## 0x75f60056
	.data4	2955961087              ## 0xb03062ff
	.data4	2172603085              ## 0x817f4acd
	.data4	1723028351              ## 0x66b3537f
	.data4	2927622029              ## 0xae7ff78d
	.data4	1534970431              ## 0x5b7dca3f
	.data4	1962748745              ## 0x74fd2b49
	.data4	2972891294              ## 0xb132b89e
	.data4	1078079453              ## 0x40422fdd
	.data4	515124000               ## 0x1eb42b20
	.data4	1966455165              ## 0x7535b97d
	.data4	1164189318              ## 0x45641e86
	.data4	2600907315              ## 0x9b06b233
	.data4	3600782882              ## 0xd69f9622
	.data4	2204973479              ## 0x836d39a7
	.data4	996355134               ## 0x3b632c3e
	.data4	2507840356              ## 0x957a9b64
	.data4	3477778796              ## 0xcf4ab16c
	.data4	1221323315              ## 0x48cbea33
	.data4	1238671201              ## 0x49d49f61
	.data4	1375843354              ## 0x5201b41a
	.data4	1855314570              ## 0x6e95da8a
	.data4	2518682250              ## 0x96200a8a
	.data4	1605543689              ## 0x5fb2a709
	.data4	2627632490              ## 0x9c9e7d6a
	.data4	466134297               ## 0x1bc8a519
	.data4	119495287               ## 0x71f5a77
	.data4	1112902811              ## 0x42558c9b
	.data4	1911061246              ## 0x71e87afe
	.data4	342761757               ## 0x146e211d
	.data4	1484653197              ## 0x587e028d
	.data4	3693344923              ## 0xdc23f89b
	.data4	4071173677              ## 0xf2a92e2d
	.data4	2641419208              ## 0x9d70dbc8
	.data4	2909381438              ## 0xad69a33e
	.data4	1217240193              ## 0x488d9c81
	.data4	3153034773              ## 0xbbef7e15
	.data4	2597147871              ## 0x9acd54df
	.data4	3957325283              ## 0xebdffde3
	.data4	1459365185              ## 0x56fc2541
	.data4	530391118               ## 0x1f9d204e
	.data4	3724449042              ## 0xddfe9512
	.data4	2218830384              ## 0x8440aa30
	.data4	122316743               ## 0x74a67c7
	.data4	61674386                ## 0x3ad1392
	.data4	1942815281              ## 0x73cd0231
	.data4	2203658872              ## 0x83592a78
	.data4	874854593               ## 0x342538c1
	.data4	2722557070              ## 0xa246ec8e
	.data4	4106697939              ## 0xf4c73cd3
	.data4	1983177952              ## 0x7634e4e0
	.data4	64140544                ## 0x3d2b500
	.data4	907164291               ## 0x36123a83
	.data4	1449655588              ## 0x5667fd24
	.data4	1942033821              ## 0x73c1159d
	.data4	2737284986              ## 0xa327a77a
	.data4	2493350030              ## 0x949d808e
	.data4	2577650363              ## 0x99a3d2bb
	.data4	1375881671              ## 0x520249c7
	.data4	1852469237              ## 0x6e6a6ff5
	.data4	2139662385              ## 0x7f88a831
	.data4	2482168809              ## 0x93f2e3e9
	.data4	1183271476              ## 0x46874a34
	.data4	1800667030              ## 0x6b53ff96
	.data4	2140140704              ## 0x7f8ff4a0
	.data4	1798675103              ## 0x6b359a9f
	.data4	4252762044              ## 0xfd7bffbc
	.data4	1793060565              ## 0x6adfeed5
	.data4	2623213582              ## 0x9c5b100e
	.data4	3885190397              ## 0xe7934cfd
	.data4	2238100313              ## 0x8566b359
	.data4	2900538183              ## 0xace2b347
	.data4	2319232581              ## 0x8a3cae45
	.data4	26550963                ## 0x19522b3
	.data4	2441304008              ## 0x918357c8
	.data4	1119321301              ## 0x42b77cd5
	.data4	2982527505              ## 0xb1c5c211
	.data4	1275135006              ## 0x4c01041e
	.data4	2258202888              ## 0x86997108
	.data4	199968391               ## 0xbeb4687
	.data4	1250946842              ## 0x4a8fef1a
	.data4	2476001114              ## 0x9394c75a
	.data4	1428483335              ## 0x5524ed07
	.data4	3874193882              ## 0xe6eb81da
	.data4	2537244398              ## 0x973b46ee
	.data4	3186341146              ## 0xbdebb51a
	.data4	900333515               ## 0x35a9ffcb
	.data4	1070070354              ## 0x3fc7fa52
	.data4	3262886140              ## 0xc27bb0fc
	.data4	675454630               ## 0x28429ea6
	.data4	2194030471              ## 0x82c63f87
	.data4	4087549369              ## 0xf3a30db9
	.data4	959497807               ## 0x3930c64f
	.data4	2840676497              ## 0xa9514891
	.data4	704209729               ## 0x29f96341
	.data4	4098966080              ## 0xf4514240
	.data4	152954934               ## 0x91de836
	.data4	2041368629              ## 0x79acd035
	.data4	1432176168              ## 0x555d4628
	.data4	2007103487              ## 0x77a1f7ff
	.data4	176133699               ## 0xa7f9643
	.data4	3899320695              ## 0xe86ae977
	.data4	1148948800              ## 0x447b9140
	.data4	3968868064              ## 0xec901ee0
	.data4	3867265538              ## 0xe681ca02
	.data4	734810277               ## 0x2bcc50a5
	.data4	2043570377              ## 0x79ce68c9
	.data4	3980542862              ## 0xed42438e
	.data4	2485463667              ## 0x94252a73
	.data4	2331182248              ## 0x8af304a8
	.data4	1986049957              ## 0x7660b7a5
	.data4	1082095820              ## 0x407f78cc
	.data4	2710960694              ## 0xa195fa36
	.data4	2026189092              ## 0x78c53124
	.data4	3841302634              ## 0xe4f5a06a
	.data4	2309835692              ## 0x89ad4bac
	.data4	2140140704              ## 0x7f8ff4a0

	.comm	bitsleft,4,4
	.section	.data
	.align	4                       ## @nextlong
nextlong::
	.data4	huffbits

	.comm	lastlong,4,4
.section .data

val_dc_lum::                            ## @val_dc_lum
	.data1 0
	.data1 1
	.data1 2
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
.skip 4

val_ac_lum::                            ## @val_ac_lum
	.data1 1
	.data1 2
	.data1 3
	.data1 0
	.data1 4
	.data1 17
	.data1 5
	.data1 18
	.data1 33
	.data1 49
	.data1 65
	.data1 6
	.data1 19
	.data1 81
	.data1 97
	.data1 7
	.data1 34
	.data1 113
	.data1 20
	.data1 50
	.data1 129
	.data1 145
	.data1 161
	.data1 8
	.data1 35
	.data1 66
	.data1 177
	.data1 193
	.data1 21
	.data1 82
	.data1 209
	.data1 240
	.data1 36
	.data1 51
	.data1 98
	.data1 114
	.data1 130
	.data1 9
	.data1 10
	.data1 22
	.data1 23
	.data1 24
	.data1 25
	.data1 26
	.data1 37
	.data1 38
	.data1 39
	.data1 40
	.data1 41
	.data1 42
	.data1 52
	.data1 53
	.data1 54
	.data1 55
	.data1 56
	.data1 57
	.data1 58
	.data1 67
	.data1 68
	.data1 69
	.data1 70
	.data1 71
	.data1 72
	.data1 73
	.data1 74
	.data1 83
	.data1 84
	.data1 85
	.data1 86
	.data1 87
	.data1 88
	.data1 89
	.data1 90
	.data1 99
	.data1 100
	.data1 101
	.data1 102
	.data1 103
	.data1 104
	.data1 105
	.data1 106
	.data1 115
	.data1 116
	.data1 117
	.data1 118
	.data1 119
	.data1 120
	.data1 121
	.data1 122
	.data1 131
	.data1 132
	.data1 133
	.data1 134
	.data1 135
	.data1 136
	.data1 137
	.data1 138
	.data1 146
	.data1 147
	.data1 148
	.data1 149
	.data1 150
	.data1 151
	.data1 152
	.data1 153
	.data1 154
	.data1 162
	.data1 163
	.data1 164
	.data1 165
	.data1 166
	.data1 167
	.data1 168
	.data1 169
	.data1 170
	.data1 178
	.data1 179
	.data1 180
	.data1 181
	.data1 182
	.data1 183
	.data1 184
	.data1 185
	.data1 186
	.data1 194
	.data1 195
	.data1 196
	.data1 197
	.data1 198
	.data1 199
	.data1 200
	.data1 201
	.data1 202
	.data1 210
	.data1 211
	.data1 212
	.data1 213
	.data1 214
	.data1 215
	.data1 216
	.data1 217
	.data1 218
	.data1 225
	.data1 226
	.data1 227
	.data1 228
	.data1 229
	.data1 230
	.data1 231
	.data1 232
	.data1 233
	.data1 234
	.data1 241
	.data1 242
	.data1 243
	.data1 244
	.data1 245
	.data1 246
	.data1 247
	.data1 248
	.data1 249
	.data1 250
.skip 6

zz_tbl::                                ## @zz_tbl
	.data1 0
	.data1 1
	.data1 8
	.data1 16
	.data1 9
	.data1 2
	.data1 3
	.data1 10
	.data1 17
	.data1 24
	.data1 32
	.data1 25
	.data1 18
	.data1 11
	.data1 4
	.data1 5
	.data1 12
	.data1 19
	.data1 26
	.data1 33
	.data1 40
	.data1 48
	.data1 41
	.data1 34
	.data1 27
	.data1 20
	.data1 13
	.data1 6
	.data1 7
	.data1 14
	.data1 21
	.data1 28

	.align	4                       ## @mincode_dc
mincode_dc::
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	2                       ## 0x2
	.data4	14                      ## 0xe
	.data4	30                      ## 0x1e
	.data4	62                      ## 0x3e
	.data4	126                     ## 0x7e
	.data4	254                     ## 0xfe
	.data4	510                     ## 0x1fe

	.align	4                       ## @maxcode_dc
maxcode_dc::
	.data4	0                       ## 0x0
	.data4	4294967295              ## 0xffffffff
	.data4	0                       ## 0x0
	.data4	6                       ## 0x6
	.data4	14                      ## 0xe
	.data4	30                      ## 0x1e
	.data4	62                      ## 0x3e
	.data4	126                     ## 0x7e
	.data4	254                     ## 0xfe
	.data4	511                     ## 0x1ff

valptr_dc::                             ## @valptr_dc
	.data1 0
	.data1 0
	.data1 0
	.data1 1
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
.skip 6

	.align	4                       ## @mincode_ac
mincode_ac::
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	4                       ## 0x4
	.data4	10                      ## 0xa
	.data4	26                      ## 0x1a
	.data4	58                      ## 0x3a
	.data4	120                     ## 0x78
	.data4	248                     ## 0xf8
	.data4	502                     ## 0x1f6
	.data4	1014                    ## 0x3f6
	.data4	2038                    ## 0x7f6
	.data4	4084                    ## 0xff4
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	32704                   ## 0x7fc0
	.data4	65410                   ## 0xff82

	.align	4                       ## @maxcode_ac
maxcode_ac::
	.data4	0                       ## 0x0
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	4                       ## 0x4
	.data4	12                      ## 0xc
	.data4	28                      ## 0x1c
	.data4	59                      ## 0x3b
	.data4	123                     ## 0x7b
	.data4	250                     ## 0xfa
	.data4	506                     ## 0x1fa
	.data4	1018                    ## 0x3fa
	.data4	2041                    ## 0x7f9
	.data4	4087                    ## 0xff7
	.data4	4294967295              ## 0xffffffff
	.data4	4294967295              ## 0xffffffff
	.data4	32704                   ## 0x7fc0
	.data4	65535                   ## 0xffff

valptr_ac::                             ## @valptr_ac
	.data1 0
	.data1 0
	.data1 0
	.data1 2
	.data1 3
	.data1 6
	.data1 9
	.data1 11
	.data1 15
	.data1 18
	.data1 23
	.data1 28
	.data1 32
	.data1 0
	.data1 0
	.data1 36
	.data1 37
.skip 7

qtbl_lum::                              ## @qtbl_lum
	.data1 16
	.data1 11
	.data1 10
	.data1 16
	.data1 24
	.data1 40
	.data1 51
	.data1 61
	.data1 12
	.data1 12
	.data1 14
	.data1 19
	.data1 26
	.data1 58
	.data1 60
	.data1 55
	.data1 14
	.data1 13
	.data1 16
	.data1 24
	.data1 40
	.data1 57
	.data1 69
	.data1 56
	.data1 14
	.data1 17
	.data1 22
	.data1 29
	.data1 51
	.data1 87
	.data1 80
	.data1 62
	.data1 18
	.data1 22
	.data1 37
	.data1 56
	.data1 68
	.data1 109
	.data1 103
	.data1 77
	.data1 24
	.data1 35
	.data1 55
	.data1 64
	.data1 81
	.data1 104
	.data1 113
	.data1 92
	.data1 49
	.data1 64
	.data1 78
	.data1 87
	.data1 103
	.data1 121
	.data1 120
	.data1 101
	.data1 72
	.data1 92
	.data1 95
	.data1 98
	.data1 112
	.data1 100
	.data1 103
	.data1 99

	.comm	dct_data,76800,2
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

.import printf
