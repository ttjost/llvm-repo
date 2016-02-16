.section .text

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @err_corr
err_corr::
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
;;
	c0	stw 28[$r0.1] = $r0.3
	c0	mov $r0.57 = hexword
;;
.call find_syndromes, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	mov $r0.58 = s1
	c0	stw 0[$r0.57] = $r0.3
	c0	call $l0.0 = find_syndromes
;;
	c0	ldb $r0.11 = 0[$r0.58]
;;
;;
	c0	cmpne $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB0_3
;;
## BB#1:                                ## %land.lhs.true
	c0	mov $r0.11 = s3
;;
	c0	ldb $r0.11 = 0[$r0.11]
;;
;;
	c0	cmpne $b0.0 = $r0.11, 0
;;
;;
	c0	brf $b0.0, LBB0_2
;;
LBB0_3:                                 ## %if.else
.call normalized_locator, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = normalized_locator
;;
	c0	stb 24[$r0.1] = $r0.3
;;
	c0	ldb $r0.11 = 24[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.11, 0
;;
;;
	c0	brf $b0.0, LBB0_4
;;
## BB#5:                                ## %if.else9
	c0	ldb $r0.11 = 24[$r0.1]
	c0	mov $r0.12 = roots
;;
;;
	c0	add $r0.11 = $r0.12, $r0.11
;;
	c0	ldb $r0.11 = 0[$r0.11]
;;
;;
	c0	stb 16[$r0.1] = $r0.11
;;
	c0	ldb $r0.11 = 16[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.11, -1
;;
;;
	c0	brf $b0.0, LBB0_6
;;
## BB#7:                                ## %if.else16
	c0	mov $r0.59 = alpha_inv
	c0	ldb $r0.11 = 16[$r0.1]
;;
	c0	ldb $r0.12 = 0[$r0.58]
;;
;;
	c0	add $r0.12 = $r0.59, $r0.12
;;
	c0	ldb $r0.12 = 0[$r0.12]
;;
;;
	c0	add $r0.11 = $r0.12, $r0.11
;;
	c0	stb 16[$r0.1] = $r0.11
;;
LBB0_8:                                 ## %while.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldb $r0.11 = 16[$r0.1]
;;
;;
	c0	cmplt $b0.0 = $r0.11, 31
;;
;;
	c0	br $b0.0, LBB0_10
;;
## BB#9:                                ## %while.body
                                        ##   in Loop: Header=BB0_8 Depth=1
	c0	ldb $r0.11 = 16[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, -31
;;
	c0	stb 16[$r0.1] = $r0.11
	c0	goto LBB0_8
;;
LBB0_10:                                ## %while.end
	c0	ldb $r0.3 = 16[$r0.1]
;;
;;
.call fix_bit, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = fix_bit
;;
	c0	ldb $r0.11 = 16[$r0.1]
	c0	mov $r0.12 = alpha
;;
;;
	c0	add $r0.11 = $r0.12, $r0.11
	c0	ldb $r0.12 = 0[$r0.58]
	c0	mov $r0.58 = parity
;;
	c0	ldb $r0.11 = 0[$r0.11]
;;
;;
	c0	xor $r0.11 = $r0.12, $r0.11
;;
	c0	stb 20[$r0.1] = $r0.11
;;
	c0	ldb $r0.11 = 20[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.59, $r0.11
;;
	c0	ldb $r0.11 = 0[$r0.11]
;;
;;
	c0	stb 20[$r0.1] = $r0.11
;;
	c0	ldb $r0.3 = 20[$r0.1]
;;
;;
.call fix_bit, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = fix_bit
;;
	c0	ldw $r0.11 = 0[$r0.58]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB0_12
;;
## BB#11:                               ## %if.then34
	c0	mov $r0.11 = error_code
	c0	mov $r0.12 = 3
;;
	c0	stw 0[$r0.11] = $r0.12
	c0	goto LBB0_13
;;
LBB0_4:                                 ## %if.then8
	c0	mov $r0.11 = alpha_inv
	c0	ldb $r0.12 = 0[$r0.58]
	c0	mov $r0.58 = 1
;;
;;
	c0	add $r0.11 = $r0.11, $r0.12
;;
	c0	ldb $r0.11 = 0[$r0.11]
	c0	mov $r0.59 = error_code
;;
;;
	c0	stb 16[$r0.1] = $r0.11
;;
	c0	ldb $r0.3 = 16[$r0.1]
;;
;;
.call fix_bit, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = fix_bit
;;
	c0	stw 0[$r0.59] = $r0.58
	c0	goto LBB0_13
;;
LBB0_6:                                 ## %if.then15
	c0	mov $r0.11 = error_code
	c0	mov $r0.12 = 4
;;
	c0	stw 0[$r0.11] = $r0.12
	c0	goto LBB0_13
;;
LBB0_2:                                 ## %if.then
	c0	mov $r0.11 = error_code
	c0	mov $r0.12 = 0
;;
	c0	stw 0[$r0.11] = $r0.12
	c0	goto LBB0_13
;;
LBB0_12:                                ## %if.else35
	c0	mov $r0.11 = error_code
	c0	mov $r0.12 = 2
;;
	c0	stw 0[$r0.11] = $r0.12
;;
LBB0_13:                                ## %if.end38
	c0	ldw $r0.3 = 0[$r0.57]
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

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @find_syndromes
find_syndromes::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
	c0	mov $r0.13 = -2147483648
;;
	c0	mov $r0.11 = s1
	c0	mov $r0.15 = 0
;;
	c0	mov $r0.12 = s3
	c0	stw 28[$r0.1] = $r0.13
;;
	c0	mov $r0.14 = hexword
	c0	stb 0[$r0.11] = $r0.15
;;
	c0	stb 0[$r0.12] = $r0.15
	c0	mov $r0.13 = parity
;;
	c0	ldw $r0.15 = 0[$r0.14]
	c0	mov $r0.16 = 30
;;
;;
	c0	and $r0.15 = $r0.15, 1
;;
	c0	stw 0[$r0.13] = $r0.15
;;
	c0	stw 24[$r0.1] = $r0.16
	c0	mov $r0.15 = alpha
;;
	c0	mov $r0.16 = alpha3
	c0	mov $r0.17 = 1
;;
LBB1_1:                                 ## %while.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.18 = 24[$r0.1]
;;
;;
	c0	cmplt $b0.0 = $r0.18, 0
;;
;;
	c0	br $b0.0, LBB1_5
;;
## BB#2:                                ## %while.body
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.18 = 28[$r0.1]
;;
	c0	ldw $r0.19 = 0[$r0.14]
;;
;;
	c0	and $r0.18 = $r0.19, $r0.18
;;
	c0	cmpeq $b0.0 = $r0.18, 0
;;
;;
	c0	br $b0.0, LBB1_4
;;
## BB#3:                                ## %if.then
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.18 = 24[$r0.1]
;;
;;
	c0	add $r0.18 = $r0.15, $r0.18
	c0	ldb $r0.19 = 0[$r0.11]
;;
	c0	ldb $r0.18 = 0[$r0.18]
;;
;;
	c0	xor $r0.18 = $r0.19, $r0.18
;;
	c0	stb 0[$r0.11] = $r0.18
;;
	c0	ldw $r0.18 = 24[$r0.1]
;;
	c0	ldb $r0.19 = 0[$r0.12]
;;
	c0	add $r0.18 = $r0.16, $r0.18
;;
	c0	ldb $r0.18 = 0[$r0.18]
;;
;;
	c0	xor $r0.18 = $r0.19, $r0.18
;;
	c0	stb 0[$r0.12] = $r0.18
;;
	c0	ldw $r0.18 = 0[$r0.13]
;;
;;
	c0	add $r0.18 = $r0.18, 1
;;
	c0	stw 0[$r0.13] = $r0.18
;;
LBB1_4:                                 ## %if.end
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.18 = 28[$r0.1]
;;
;;
	c0	shru $r0.18 = $r0.18, $r0.17
;;
	c0	stw 28[$r0.1] = $r0.18
;;
	c0	ldw $r0.18 = 24[$r0.1]
;;
;;
	c0	add $r0.18 = $r0.18, -1
;;
	c0	stw 24[$r0.1] = $r0.18
	c0	goto LBB1_1
;;
LBB1_5:                                 ## %while.end
	c0	ldw $r0.11 = 0[$r0.13]
;;
;;
	c0	and $r0.11 = $r0.11, 1
;;
.return ret($r0.3:s32)
	c0	stw 0[$r0.13] = $r0.11
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @normalized_locator
normalized_locator::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
	c0	mov $r0.11 = s1
;;
	c0	mov $r0.12 = alpha_inv
	c0	mov $r0.13 = s3
;;
	c0	ldb $r0.11 = 0[$r0.11]
;;
;;
	c0	add $r0.11 = $r0.12, $r0.11
;;
	c0	ldb $r0.11 = 0[$r0.11]
;;
;;
	c0	stb 28[$r0.1] = $r0.11
;;
	c0	ldb $r0.11 = 0[$r0.13]
;;
	c0	ldb $r0.13 = 28[$r0.1]
;;
	c0	add $r0.11 = $r0.12, $r0.11
;;
	c0	ldb $r0.11 = 0[$r0.11]
;;
;;
	c0	sub $r0.11 = $r0.11, $r0.13
;;
	c0	sub $r0.11 = $r0.11, $r0.13
;;
	c0	sub $r0.11 = $r0.11, $r0.13
;;
	c0	stb 24[$r0.1] = $r0.11
;;
LBB2_1:                                 ## %while.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldb $r0.11 = 24[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.11, -1
;;
;;
	c0	br $b0.0, LBB2_3
;;
## BB#2:                                ## %while.body
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	ldb $r0.11 = 24[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 31
;;
	c0	stb 24[$r0.1] = $r0.11
	c0	goto LBB2_1
;;
LBB2_3:                                 ## %while.end
	c0	ldb $r0.11 = 24[$r0.1]
	c0	mov $r0.12 = alpha
;;
;;
	c0	add $r0.11 = $r0.12, $r0.11
;;
	c0	ldb $r0.11 = 0[$r0.11]
;;
;;
.return ret($r0.3:s32)
	c0	xor $r0.3 = $r0.11, 1
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @fix_bit
fix_bit::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stb 28[$r0.1] = $r0.3
	c0	add $r0.11 = $r0.3, 1
	c0	mov $r0.12 = hexword
;;
	c0	mov $r0.13 = 1
	c0	stb 28[$r0.1] = $r0.11
;;
	c0	ldb $r0.11 = 28[$r0.1]
;;
	c0	ldw $r0.14 = 0[$r0.12]
;;
	c0	shl $r0.11 = $r0.13, $r0.11
;;
	c0	xor $r0.11 = $r0.14, $r0.11
;;
.return ret($r0.3:s32)
	c0	stw 0[$r0.12] = $r0.11
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @comp32
comp32::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $r0.3
;;
	c0	stw 24[$r0.1] = $r0.4
	c0	mov $r0.11 = 0
;;
	c0	ldw $r0.12 = 28[$r0.1]
	c0	mov $r0.13 = 4
;;
;;
	c0	xor $r0.12 = $r0.12, $r0.4
;;
	c0	stw 28[$r0.1] = $r0.12
;;
	c0	stw 16[$r0.1] = $r0.11
;;
	c0	stw 20[$r0.1] = $r0.13
	c0	mov $r0.11 = err_tab
	c0	mov $r0.12 = 8
;;
LBB4_1:                                 ## %while.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.13 = 20[$r0.1]
;;
;;
	c0	cmplt $b0.0 = $r0.13, 1
;;
;;
	c0	br $b0.0, LBB4_3
;;
## BB#2:                                ## %while.body
                                        ##   in Loop: Header=BB4_1 Depth=1
	c0	ldbu $r0.13 = 31[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.11, $r0.13
	c0	ldw $r0.14 = 16[$r0.1]
;;
	c0	ldbu $r0.13 = 0[$r0.13]
;;
;;
	c0	add $r0.13 = $r0.14, $r0.13
;;
	c0	stw 16[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 28[$r0.1]
;;
;;
	c0	shru $r0.13 = $r0.13, $r0.12
;;
	c0	stw 28[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 20[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.13, -1
;;
	c0	stw 20[$r0.1] = $r0.13
	c0	goto LBB4_1
;;
LBB4_3:                                 ## %while.end
.return ret($r0.3:s32)
	c0	ldw $r0.3 = 16[$r0.1]
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg() ## @sync_find
sync_find::
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
	c0	stw 60[$r0.1] = $r0.61
;;
	c0	stw 56[$r0.1] = $r0.62
;;
	c0	stw 52[$r0.1] = $l0.0
;;
	c0	stw 44[$r0.1] = $r0.3
	c0	mov $r0.11 = 18
;;
	c0	stw 36[$r0.1] = $r0.11
;;
	c0	ldw $r0.11 = 44[$r0.1]
;;
;;
	c0	add $r0.12 = $r0.11, 4
;;
	c0	stw 44[$r0.1] = $r0.12
;;
	c0	ldw $r0.11 = 0[$r0.11]
;;
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	mov $r0.57 = 0
	c0	mov $r0.58 = 1045145627
;;
	c0	mov $r0.59 = -1431655766
	c0	mov $r0.60 = 19
	c0	mov $r0.61 = 31
;;
	c0	mov $r0.62 = 1
;;
LBB5_1:                                 ## %while.cond
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB5_3 Depth 2
	c0	ldw $r0.11 = 36[$r0.1]
;;
;;
	c0	cmplt $b0.0 = $r0.11, 1
;;
;;
	c0	br $b0.0, LBB5_11
;;
## BB#2:                                ## %while.body
                                        ##   in Loop: Header=BB5_1 Depth=1
	c0	ldw $r0.11 = 44[$r0.1]
;;
;;
	c0	add $r0.12 = $r0.11, 4
;;
	c0	stw 44[$r0.1] = $r0.12
;;
	c0	ldw $r0.11 = 0[$r0.11]
;;
;;
	c0	stw 24[$r0.1] = $r0.11
;;
	c0	stw 32[$r0.1] = $r0.57
;;
LBB5_3:                                 ## %while.cond2
                                        ##   Parent Loop BB5_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldw $r0.11 = 32[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.11, 31
;;
;;
	c0	br $b0.0, LBB5_10
;;
## BB#4:                                ## %while.body4
                                        ##   in Loop: Header=BB5_3 Depth=2
	c0	ldw $r0.3 = 28[$r0.1]
	c0	mov $r0.4 = $r0.58
;;
.call comp32, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = comp32
;;
	c0	cmpgt $b0.0 = $r0.3, 2
	c0	stw 40[$r0.1] = $r0.3
;;
;;
	c0	brf $b0.0, LBB5_5
;;
## BB#6:                                ## %if.end
                                        ##   in Loop: Header=BB5_3 Depth=2
	c0	ldw $r0.3 = 28[$r0.1]
	c0	mov $r0.4 = $r0.59
;;
.call comp32, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = comp32
;;
	c0	cmplt $b0.0 = $r0.3, 3
	c0	stw 40[$r0.1] = $r0.3
;;
;;
	c0	br $b0.0, LBB5_8
;;
## BB#7:                                ## %lor.lhs.false
                                        ##   in Loop: Header=BB5_3 Depth=2
	c0	ldw $r0.11 = 40[$r0.1]
;;
;;
	c0	cmplt $b0.0 = $r0.11, 30
;;
;;
	c0	brf $b0.0, LBB5_8
;;
## BB#9:                                ## %if.end12
                                        ##   in Loop: Header=BB5_3 Depth=2
	c0	ldw $r0.11 = 24[$r0.1]
;;
;;
	c0	shru $r0.11 = $r0.11, $r0.61
	c0	ldw $r0.12 = 28[$r0.1]
;;
;;
	c0	shl $r0.12 = $r0.12, $r0.62
;;
	c0	or $r0.11 = $r0.12, $r0.11
;;
	c0	stw 28[$r0.1] = $r0.11
;;
	c0	ldw $r0.11 = 24[$r0.1]
;;
;;
	c0	shl $r0.11 = $r0.11, $r0.62
;;
	c0	stw 24[$r0.1] = $r0.11
;;
	c0	ldw $r0.11 = 32[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 32[$r0.1] = $r0.11
	c0	goto LBB5_3
;;
LBB5_8:                                 ## %if.then9
                                        ##   in Loop: Header=BB5_1 Depth=1
	c0	ldw $r0.11 = 32[$r0.1]
;;
	c0	ldw $r0.12 = 24[$r0.1]
;;
;;
	c0	shru $r0.11 = $r0.12, $r0.11
;;
	c0	stw 28[$r0.1] = $r0.11
;;
	c0	stw 36[$r0.1] = $r0.60
;;
LBB5_10:                                ## %while.end
                                        ##   in Loop: Header=BB5_1 Depth=1
	c0	ldw $r0.11 = 36[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, -1
;;
	c0	stw 36[$r0.1] = $r0.11
	c0	goto LBB5_1
;;
LBB5_5:                                 ## %if.then
	c0	ldw $r0.11 = 44[$r0.1]
;;
;;
	c0	stw 48[$r0.1] = $r0.11
	c0	goto LBB5_12
;;
LBB5_11:                                ## %while.end13
	c0	stw 48[$r0.1] = $r0.57
;;
LBB5_12:                                ## %return
	c0	ldw $r0.3 = 48[$r0.1]
;;
	c0	ldw $l0.0 = 52[$r0.1]
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

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @addr_corr
addr_corr::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 44[$r0.1] = $r0.57
;;
	c0	stw 40[$r0.1] = $l0.0
;;
	c0	stw 32[$r0.1] = $r0.3
	c0	mov $r0.11 = 173902
	c0	mov $r0.57 = 13
;;
	c0	stw 20[$r0.1] = $r0.11
;;
	c0	ldw $r0.11 = 32[$r0.1]
;;
;;
	c0	shru $r0.11 = $r0.11, $r0.57
;;
	c0	stw 24[$r0.1] = $r0.11
;;
	c0	ldw $r0.4 = 20[$r0.1]
	c0	mov $r0.3 = $r0.11
;;
;;
.call comp32, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = comp32
;;
	c0	cmplt $b0.0 = $r0.3, 3
	c0	stw 28[$r0.1] = $r0.3
;;
;;
	c0	br $b0.0, LBB6_2
;;
## BB#1:                                ## %if.then
	c0	mov $r0.11 = 119386
;;
	c0	stw 20[$r0.1] = $r0.11
;;
	c0	ldw $r0.3 = 24[$r0.1]
	c0	mov $r0.4 = $r0.11
;;
.call comp32, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = comp32
;;
	c0	stw 28[$r0.1] = $r0.3
;;
LBB6_2:                                 ## %if.end
	c0	ldw $r0.11 = 28[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.11, 2
;;
;;
	c0	br $b0.0, LBB6_8
;;
## BB#3:                                ## %if.then3
	c0	ldw $r0.3 = 32[$r0.1]
;;
.call err_corr, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = err_corr
;;
	c0	mov $r0.11 = error_code
	c0	stw 32[$r0.1] = $r0.3
;;
	c0	ldw $r0.12 = 0[$r0.11]
;;
;;
	c0	cmpgt $b0.0 = $r0.12, 2
;;
;;
	c0	br $b0.0, LBB6_8
;;
## BB#4:                                ## %if.then6
	c0	ldw $r0.11 = 0[$r0.11]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB6_6
;;
## BB#5:                                ## %if.then8
	c0	ldw $r0.11 = 32[$r0.1]
;;
;;
	c0	shru $r0.11 = $r0.11, $r0.57
;;
	c0	stw 24[$r0.1] = $r0.11
;;
	c0	ldw $r0.4 = 20[$r0.1]
	c0	mov $r0.3 = $r0.11
;;
;;
.call comp32, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = comp32
;;
	c0	stw 28[$r0.1] = $r0.3
;;
LBB6_6:                                 ## %if.end11
	c0	ldw $r0.11 = 28[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB6_8
;;
## BB#7:                                ## %if.then13
	c0	ldw $r0.11 = 32[$r0.1]
	c0	mov $r0.12 = 11
	c0	mov $r0.13 = func
;;
	c0	mov $r0.14 = 1
;;
	c0	shru $r0.11 = $r0.11, $r0.12
;;
	c0	and $r0.11 = $r0.11, 3
;;
	c0	stw 0[$r0.13] = $r0.11
;;
	c0	stw 36[$r0.1] = $r0.14
	c0	goto LBB6_9
;;
LBB6_8:                                 ## %if.end18
	c0	mov $r0.11 = 0
;;
	c0	stw 36[$r0.1] = $r0.11
;;
LBB6_9:                                 ## %return
	c0	ldw $r0.3 = 36[$r0.1]
;;
	c0	ldw $l0.0 = 40[$r0.1]
;;
	c0	ldw $r0.57 = 44[$r0.1]
;;
;;
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @num_proc
num_proc::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 44[$r0.1] = $r0.3
;;
	c0	stw 40[$r0.1] = $r0.4
	c0	mov $r0.11 = 5
	c0	mov $r0.12 = 0
;;
	c0	stw 36[$r0.1] = $r0.11
;;
	c0	stw 32[$r0.1] = $r0.12
	c0	mov $r0.11 = error_code
;;
	c0	mov $r0.12 = msg
	c0	mov $r0.13 = 128
;;
LBB7_1:                                 ## %while.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.14 = 36[$r0.1]
;;
;;
	c0	cmplt $b0.0 = $r0.14, 1
;;
;;
	c0	br $b0.0, LBB7_8
;;
## BB#2:                                ## %while.body
                                        ##   in Loop: Header=BB7_1 Depth=1
	c0	ldw $r0.14 = 32[$r0.1]
;;
	c0	ldw $r0.15 = 40[$r0.1]
;;
;;
	c0	shru $r0.14 = $r0.15, $r0.14
;;
	c0	and $r0.14 = $r0.14, 15
;;
	c0	stb 28[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 0[$r0.11]
;;
;;
	c0	cmpgt $b0.0 = $r0.14, 2
;;
;;
	c0	br $b0.0, LBB7_6
;;
## BB#3:                                ## %if.then
                                        ##   in Loop: Header=BB7_1 Depth=1
	c0	ldbu $r0.14 = 28[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.14, 9
;;
;;
	c0	br $b0.0, LBB7_5
;;
## BB#4:                                ## %if.then6
                                        ##   in Loop: Header=BB7_1 Depth=1
	c0	ldb $r0.14 = 28[$r0.1]
;;
	c0	ldw $r0.15 = 44[$r0.1]
;;
	c0	add $r0.14 = $r0.14, 48
;;
	c0	add $r0.15 = $r0.12, $r0.15
;;
	c0	stb 0[$r0.15] = $r0.14
	c0	goto LBB7_7
;;
LBB7_5:                                 ## %if.else
                                        ##   in Loop: Header=BB7_1 Depth=1
	c0	ldw $r0.14 = 44[$r0.1]
;;
;;
	c0	add $r0.14 = $r0.12, $r0.14
	c0	ldb $r0.15 = 28[$r0.1]
;;
;;
	c0	stb 0[$r0.14] = $r0.15
	c0	goto LBB7_7
;;
LBB7_6:                                 ## %if.else10
                                        ##   in Loop: Header=BB7_1 Depth=1
	c0	ldw $r0.14 = 44[$r0.1]
;;
;;
	c0	add $r0.14 = $r0.12, $r0.14
;;
	c0	stb 0[$r0.14] = $r0.13
;;
LBB7_7:                                 ## %if.end12
                                        ##   in Loop: Header=BB7_1 Depth=1
	c0	ldw $r0.14 = 32[$r0.1]
;;
;;
	c0	add $r0.14 = $r0.14, 4
;;
	c0	stw 32[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 44[$r0.1]
;;
;;
	c0	add $r0.14 = $r0.14, 1
;;
	c0	stw 44[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 36[$r0.1]
;;
;;
	c0	add $r0.14 = $r0.14, -1
;;
	c0	stw 36[$r0.1] = $r0.14
	c0	goto LBB7_1
;;
LBB7_8:                                 ## %while.end
.return ret($r0.3:s32)
	c0	ldw $r0.3 = 44[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @alpha_proc
alpha_proc::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 44[$r0.1] = $r0.3
;;
	c0	stw 40[$r0.1] = $r0.4
	c0	mov $r0.13 = 3
	c0	mov $r0.12 = 0
;;
	c0	mov $r0.11 = alpha_count
	c0	stw 28[$r0.1] = $r0.13
;;
	c0	stw 24[$r0.1] = $r0.12
;;
	c0	ldw $r0.13 = 0[$r0.11]
;;
;;
	c0	cmplt $b0.0 = $r0.13, 1
;;
;;
	c0	br $b0.0, LBB8_5
;;
## BB#1:                                ## %if.then
	c0	mov $r0.13 = 7
	c0	mov $r0.14 = error_code
	c0	ldw $r0.15 = 0[$r0.11]
;;
;;
	c0	sub $r0.13 = $r0.13, $r0.15
;;
	c0	stw 36[$r0.1] = $r0.13
;;
	c0	ldw $r0.15 = 40[$r0.1]
;;
;;
	c0	shl $r0.13 = $r0.15, $r0.13
;;
	c0	stb 32[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 0[$r0.14]
;;
;;
	c0	cmpgt $b0.0 = $r0.13, 2
;;
;;
	c0	br $b0.0, LBB8_3
;;
## BB#2:                                ## %if.then3
	c0	ldw $r0.13 = 44[$r0.1]
	c0	mov $r0.14 = msg
;;
;;
	c0	add $r0.13 = $r0.14, $r0.13
	c0	ldb $r0.14 = 32[$r0.1]
;;
	c0	ldb $r0.15 = 0[$r0.13]
;;
;;
	c0	or $r0.14 = $r0.15, $r0.14
;;
	c0	and $r0.14 = $r0.14, 127
;;
	c0	stb 0[$r0.13] = $r0.14
	c0	goto LBB8_4
;;
LBB8_3:                                 ## %if.else
	c0	ldw $r0.13 = 44[$r0.1]
	c0	mov $r0.14 = msg
;;
;;
	c0	add $r0.13 = $r0.14, $r0.13
	c0	mov $r0.14 = 128
;;
	c0	stb 0[$r0.13] = $r0.14
;;
LBB8_4:                                 ## %if.end
	c0	ldw $r0.13 = 44[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.13, 1
;;
	c0	stw 44[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 0[$r0.11]
;;
;;
	c0	stw 24[$r0.1] = $r0.13
;;
LBB8_5:                                 ## %while.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.13 = 28[$r0.1]
;;
;;
	c0	cmplt $b0.0 = $r0.13, 1
;;
;;
	c0	br $b0.0, LBB8_10
;;
## BB#6:                                ## %while.body
                                        ##   in Loop: Header=BB8_5 Depth=1
	c0	mov $r0.13 = error_code
;;
	c0	ldw $r0.13 = 0[$r0.13]
;;
;;
	c0	cmpgt $b0.0 = $r0.13, 2
;;
;;
	c0	br $b0.0, LBB8_8
;;
## BB#7:                                ## %if.then14
                                        ##   in Loop: Header=BB8_5 Depth=1
	c0	ldw $r0.13 = 24[$r0.1]
	c0	mov $r0.14 = msg
;;
	c0	ldw $r0.15 = 40[$r0.1]
;;
	c0	ldw $r0.16 = 44[$r0.1]
;;
	c0	shru $r0.13 = $r0.15, $r0.13
;;
	c0	add $r0.14 = $r0.14, $r0.16
	c0	and $r0.13 = $r0.13, 127
;;
	c0	stb 0[$r0.14] = $r0.13
	c0	goto LBB8_9
;;
LBB8_8:                                 ## %if.else18
                                        ##   in Loop: Header=BB8_5 Depth=1
	c0	ldw $r0.13 = 44[$r0.1]
	c0	mov $r0.14 = msg
;;
;;
	c0	add $r0.13 = $r0.14, $r0.13
	c0	mov $r0.14 = 128
;;
	c0	stb 0[$r0.13] = $r0.14
;;
LBB8_9:                                 ## %if.end20
                                        ##   in Loop: Header=BB8_5 Depth=1
	c0	ldw $r0.13 = 24[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.13, 7
;;
	c0	stw 24[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 44[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.13, 1
;;
	c0	stw 44[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 28[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.13, -1
;;
	c0	stw 28[$r0.1] = $r0.13
	c0	goto LBB8_5
;;
LBB8_10:                                ## %while.end
	c0	ldw $r0.13 = 44[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.13, -1
;;
	c0	stw 44[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 0[$r0.11]
;;
;;
	c0	cmpne $b0.0 = $r0.13, 6
;;
;;
	c0	br $b0.0, LBB8_12
;;
## BB#11:                               ## %if.then25
	c0	stw 0[$r0.11] = $r0.12
	c0	goto LBB8_13
;;
LBB8_12:                                ## %if.else26
	c0	ldw $r0.12 = 0[$r0.11]
;;
;;
	c0	add $r0.12 = $r0.12, 1
;;
	c0	stw 0[$r0.11] = $r0.12
;;
LBB8_13:                                ## %if.end28
.return ret($r0.3:s32)
	c0	ldw $r0.3 = 44[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
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
;;
	c0	stw 56[$r0.1] = $r0.3
	c0	mov $r0.57 = 0
;;
	c0	stw 52[$r0.1] = $r0.57
;;
	c0	stw 48[$r0.1] = $r0.57
	c0	mov $r0.58 = 1
;;
	c0	stw 44[$r0.1] = $r0.57
;;
	c0	stw 36[$r0.1] = $r0.58
	c0	mov $r0.59 = 1045145627
;;
	c0	mov $r0.60 = error_code
	c0	mov $r0.11 = 13
;;
	c0	stw 24[$r0.1] = $r0.11
	c0	mov $r0.62 = 173902
;;
	c0	mov $r0.11 = 119386
;;
	c0	stw 20[$r0.1] = $r0.11
	c0	mov $r0.63 = 11
	c0	mov $r0.61 = func
;;
LBB9_1:                                 ## %while.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.11 = 56[$r0.1]
;;
;;
	c0	add $r0.12 = $r0.11, 4
;;
	c0	stw 56[$r0.1] = $r0.12
;;
	c0	ldw $r0.11 = 0[$r0.11]
;;
;;
	c0	stw 28[$r0.1] = $r0.11
;;
	c0	ldw $r0.11 = 48[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.11, 16
;;
;;
	c0	br $b0.0, LBB9_8
;;
## BB#2:                                ## %if.then
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.3 = 28[$r0.1]
	c0	mov $r0.4 = $r0.59
;;
.call comp32, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = comp32
;;
	c0	cmpgt $b0.0 = $r0.3, 2
	c0	stw 40[$r0.1] = $r0.3
;;
;;
	c0	br $b0.0, LBB9_4
;;
## BB#3:                                ## %if.then2
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	stw 44[$r0.1] = $r0.57
	c0	goto LBB9_7
;;
LBB9_8:                                 ## %if.else7
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.11 = 36[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB9_13
;;
## BB#9:                                ## %if.then8
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.11 = 48[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 6
;;
;;
	c0	br $b0.0, LBB9_11
;;
## BB#10:                               ## %lor.lhs.false
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.11 = 48[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.11, 7
;;
;;
	c0	br $b0.0, LBB9_25
;;
LBB9_11:                                ## %if.then11
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.3 = 28[$r0.1]
;;
.call addr_corr, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = addr_corr
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB9_25
;;
## BB#12:                               ## %if.then14
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	stw 36[$r0.1] = $r0.57
	c0	goto LBB9_25
;;
LBB9_4:                                 ## %if.else
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.11 = 44[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.11, 1
;;
;;
	c0	brf $b0.0, LBB9_5
;;
## BB#6:                                ## %if.else5
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.11 = 44[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 44[$r0.1] = $r0.11
;;
LBB9_7:                                 ## %if.end6
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	stw 48[$r0.1] = $r0.57
	c0	goto LBB9_1
;;
LBB9_13:                                ## %if.else17
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.3 = 28[$r0.1]
;;
.call err_corr, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = err_corr
;;
	c0	stw 28[$r0.1] = $r0.3
;;
	c0	ldw $r0.11 = 48[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 6
;;
;;
	c0	br $b0.0, LBB9_15
;;
## BB#14:                               ## %lor.lhs.false20
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.11 = 48[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.11, 7
;;
;;
	c0	br $b0.0, LBB9_20
;;
LBB9_15:                                ## %if.then22
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	stw 40[$r0.1] = $r0.58
;;
	c0	ldw $r0.11 = 0[$r0.60]
;;
;;
	c0	cmpgt $b0.0 = $r0.11, 2
;;
;;
	c0	br $b0.0, LBB9_18
;;
## BB#16:                               ## %if.then24
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.11 = 28[$r0.1]
;;
	c0	ldw $r0.12 = 24[$r0.1]
;;
;;
	c0	shru $r0.11 = $r0.11, $r0.12
;;
	c0	stw 32[$r0.1] = $r0.11
	c0	mov $r0.3 = $r0.11
	c0	mov $r0.4 = $r0.62
;;
.call comp32, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = comp32
;;
	c0	cmpeq $b0.0 = $r0.3, 0
	c0	stw 40[$r0.1] = $r0.3
;;
;;
	c0	br $b0.0, LBB9_18
;;
## BB#17:                               ## %if.then27
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.3 = 32[$r0.1]
;;
	c0	ldw $r0.4 = 20[$r0.1]
;;
;;
.call comp32, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = comp32
;;
	c0	stw 40[$r0.1] = $r0.3
;;
LBB9_18:                                ## %if.end30
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.11 = 40[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.11, 0
;;
;;
	c0	brf $b0.0, LBB9_19
;;
LBB9_20:                                ## %if.end34
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.11 = 28[$r0.1]
;;
;;
	c0	shru $r0.11 = $r0.11, $r0.63
;;
	c0	and $r0.11 = $r0.11, 1048575
;;
	c0	stw 28[$r0.1] = $r0.11
;;
	c0	ldw $r0.11 = 0[$r0.61]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 3
;;
;;
	c0	brf $b0.0, LBB9_21
;;
## BB#23:                               ## %sw.bb37
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.4 = 28[$r0.1]
;;
	c0	ldw $r0.3 = 52[$r0.1]
;;
.call alpha_proc, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = alpha_proc
;;
	c0	stw 52[$r0.1] = $r0.3
	c0	goto LBB9_25
;;
LBB9_21:                                ## %if.end34
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	cmpne $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB9_24
;;
## BB#22:                               ## %sw.bb
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.4 = 28[$r0.1]
;;
	c0	ldw $r0.3 = 52[$r0.1]
;;
.call num_proc, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = num_proc
;;
	c0	stw 52[$r0.1] = $r0.3
;;
LBB9_25:                                ## %if.end39
                                        ##   in Loop: Header=BB9_1 Depth=1
	c0	ldw $r0.11 = 48[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 48[$r0.1] = $r0.11
	c0	goto LBB9_1
;;
LBB9_5:                                 ## %if.then4
	c0	ldw $r0.11 = 52[$r0.1]
;;
;;
	c0	stw 60[$r0.1] = $r0.11
	c0	goto LBB9_26
;;
LBB9_24:                                ## %sw.default
	c0	stw 60[$r0.1] = $r0.57
	c0	goto LBB9_26
;;
LBB9_19:                                ## %if.then32
	c0	ldw $r0.11 = 52[$r0.1]
;;
;;
	c0	stw 60[$r0.1] = $r0.11
;;
LBB9_26:                                ## %return
	c0	ldw $r0.3 = 60[$r0.1]
;;
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
	c0	stw 40[$r0.1] = $l0.0
	c0	mov $r0.57 = 0
;;
	c0	stw 36[$r0.1] = $r0.57
;;
	c0	stw 20[$r0.1] = $r0.57
	c0	mov $r0.58 = alpha_count
;;
	c0	mov $r0.59 = alpha_data
	c0	mov $r0.60 = func
;;
	c0	mov $r0.61 = numeric_data
;;
LBB10_1:                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.11 = 20[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.11, 1
;;
;;
	c0	br $b0.0, LBB10_11
;;
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB10_1 Depth=1
	c0	stw 0[$r0.58] = $r0.57
;;
	c0	ldw $r0.11 = 20[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB10_4
;;
## BB#3:                                ## %if.then
                                        ##   in Loop: Header=BB10_1 Depth=1
	c0	stw 32[$r0.1] = $r0.61
	c0	goto LBB10_5
;;
LBB10_4:                                ## %if.else
                                        ##   in Loop: Header=BB10_1 Depth=1
	c0	stw 32[$r0.1] = $r0.59
;;
LBB10_5:                                ## %if.end
                                        ##   in Loop: Header=BB10_1 Depth=1
	c0	ldw $r0.3 = 32[$r0.1]
;;
.call sync_find, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = sync_find
;;
	c0	cmpeq $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB10_9
;;
## BB#6:                                ## %if.then2
                                        ##   in Loop: Header=BB10_1 Depth=1
	c0	ldw $r0.3 = 32[$r0.1]
;;
.call sync_find, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = sync_find
;;
.call msg_proc, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = msg_proc
;;
	c0	stw 28[$r0.1] = $r0.3
;;
	c0	ldw $r0.11 = 0[$r0.60]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB10_10
;;
## BB#7:                                ## %if.else7
                                        ##   in Loop: Header=BB10_1 Depth=1
	c0	ldw $r0.11 = 0[$r0.60]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 3
;;
;;
	c0	brf $b0.0, LBB10_8
;;
LBB10_10:                               ## %for.inc
                                        ##   in Loop: Header=BB10_1 Depth=1
	c0	ldw $r0.11 = 20[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 20[$r0.1] = $r0.11
	c0	goto LBB10_1
;;
LBB10_11:                               ## %for.end
	c0	mov $r0.5 = 27
	c0	mov $r0.3 = msg
;;
	c0	mov $r0.4 = .str
;;
.call strncmp, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = strncmp
;;
	c0	cmpne $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB10_14
;;
## BB#12:                               ## %land.lhs.true
	c0	ldw $r0.11 = 28[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.11, 88
;;
;;
	c0	br $b0.0, LBB10_14
;;
## BB#13:                               ## %if.then18
	c0	mov $r0.11 = 66
;;
	c0	stw 36[$r0.1] = $r0.11
	c0	goto LBB10_15
;;
LBB10_9:                                ## %if.else13
	c0	mov $r0.11 = 15
;;
	c0	stw 36[$r0.1] = $r0.11
	c0	goto LBB10_15
;;
LBB10_8:                                ## %if.else10
	c0	mov $r0.11 = 15
;;
	c0	stw 36[$r0.1] = $r0.11
	c0	goto LBB10_15
;;
LBB10_14:                               ## %if.else19
	c0	mov $r0.11 = 15
;;
	c0	stw 36[$r0.1] = $r0.11
;;
LBB10_15:                               ## %return
	c0	ldw $r0.3 = 36[$r0.1]
;;
	c0	ldw $l0.0 = 40[$r0.1]
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


