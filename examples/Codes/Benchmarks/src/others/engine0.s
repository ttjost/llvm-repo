.section .text

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg() ## @engine
engine::
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
	c0	stw 56[$r0.1] = $r0.11
	c0	mov $r0.11 = ival
;;
	c0	stw 32[$r0.1] = $r0.11
	c0	mov $r0.11 = 60000
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	mov $r0.59 = 1374389535
	c0	mov $r0.60 = 3
;;
	c0	mov $r0.61 = rpm_vfi_tab
	c0	mov $r0.62 = tab2
;;
	c0	mov $r0.63 = tab1
	c0	mov $r0.57 = rpm2
;;
	c0	mov $r0.58 = rpm1
	c0	mov $r0.11 = debug_val
;;
	c0	stw 44[$r0.1] = $r0.11
	c0	mov $r0.11 = debug_base
;;
	c0	stw 40[$r0.1] = $r0.11
	c0	mov $r0.11 = inter_val
;;
	c0	stw 24[$r0.1] = $r0.11
	c0	mov $r0.11 = debug_interval
;;
	c0	stw 36[$r0.1] = $r0.11
;;
LBB0_1::                                ## %for.cond
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_3 Depth 2
                                        ##       Child Loop BB0_5 Depth 3
	c0	ldw $r0.11 = 56[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.11, 254
;;
;;
	c0	br $b0.0, LBB0_12
;;
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.11 = 56[$r0.1]
;;
	c0	ldw $r0.12 = 32[$r0.1]
;;
;;
	c0	stb 0[$r0.12] = $r0.11
;;
	c0	ldw $r0.11 = 28[$r0.1]
;;
;;
	c0	stw 48[$r0.1] = $r0.11
;;
LBB0_3::                                ## %while.cond
                                        ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB0_5 Depth 3
	c0	ldw $r0.11 = 48[$r0.1]
;;
;;
	c0	cmpltu $b0.0 = $r0.11, 4001
;;
;;
	c0	br $b0.0, LBB0_11
;;
## BB#4:                                ## %while.body
                                        ##   in Loop: Header=BB0_3 Depth=2
	c0	ldw $r0.3 = 48[$r0.1]
;;
.call edge_to_rpm, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = edge_to_rpm
;;
	c0	stw 52[$r0.1] = $r0.3
;;
	c0	ldw $r0.11 = 48[$r0.1]
;;
;;
	c0	mpylhu $r0.12 = $r0.59, $r0.11
	c0	mpyllu $r0.13 = $r0.11, 1374389535
;;
	c0	mpylhu $r0.14 = $r0.11, 1374389535
;;
	c0	shru $r0.13 = $r0.13, 16
	c0	mpyhhu $r0.15 = $r0.11, 1374389535
;;
	c0	add $r0.13 = $r0.14, $r0.13
;;
	c0	zxth $r0.14 = $r0.13
	c0	shru $r0.13 = $r0.13, 16
;;
	c0	add $r0.12 = $r0.12, $r0.14
	c0	add $r0.13 = $r0.15, $r0.13
;;
	c0	shru $r0.12 = $r0.12, 16
;;
	c0	add $r0.12 = $r0.13, $r0.12
;;
	c0	shru $r0.12 = $r0.12, $r0.60
;;
	c0	sub $r0.11 = $r0.11, $r0.12
;;
	c0	stw 48[$r0.1] = $r0.11
;;
	c0	stw 60[$r0.1] = $r0.61
;;
LBB0_5::                                ## %while.cond3
                                        ##   Parent Loop BB0_1 Depth=1
                                        ##     Parent Loop BB0_3 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	c0	ldw $r0.11 = 60[$r0.1]
;;
	c0	ldw $r0.12 = 52[$r0.1]
;;
	c0	ldhu $r0.11 = 0[$r0.11]
;;
;;
	c0	cmpge $b0.0 = $r0.11, $r0.12
;;
;;
	c0	br $b0.0, LBB0_7
;;
## BB#6:                                ## %while.body7
                                        ##   in Loop: Header=BB0_5 Depth=3
	c0	ldw $r0.11 = 60[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 8
;;
	c0	stw 60[$r0.1] = $r0.11
	c0	goto LBB0_5
;;
LBB0_7::                                ## %while.end
                                        ##   in Loop: Header=BB0_3 Depth=2
	c0	ldw $r0.11 = 60[$r0.1]
;;
	c0	ldw $r0.12 = 52[$r0.1]
;;
	c0	ldhu $r0.11 = 0[$r0.11]
;;
;;
	c0	cmpne $b0.0 = $r0.11, $r0.12
;;
;;
	c0	br $b0.0, LBB0_9
;;
## BB#8:                                ## %if.then
                                        ##   in Loop: Header=BB0_3 Depth=2
	c0	ldw $r0.11 = 60[$r0.1]
;;
;;
	c0	ldw $r0.11 = 4[$r0.11]
;;
;;
	c0	stw 0[$r0.62] = $r0.11
;;
	c0	stw 0[$r0.63] = $r0.11
;;
	c0	ldh $r0.11 = 54[$r0.1]
;;
;;
	c0	sth 0[$r0.57] = $r0.11
;;
	c0	sth 0[$r0.58] = $r0.11
	c0	goto LBB0_10
;;
LBB0_9::                                ## %if.else
                                        ##   in Loop: Header=BB0_3 Depth=2
	c0	ldw $r0.11 = 60[$r0.1]
;;
;;
	c0	ldw $r0.11 = 4[$r0.11]
;;
;;
	c0	stw 0[$r0.62] = $r0.11
;;
	c0	ldw $r0.11 = 60[$r0.1]
;;
;;
	c0	ldh $r0.11 = 0[$r0.11]
;;
;;
	c0	sth 0[$r0.57] = $r0.11
;;
	c0	ldw $r0.11 = 60[$r0.1]
;;
;;
	c0	add $r0.12 = $r0.11, -8
;;
	c0	stw 60[$r0.1] = $r0.12
;;
	c0	ldw $r0.11 = -4[$r0.11]
;;
;;
	c0	stw 0[$r0.63] = $r0.11
;;
	c0	ldw $r0.11 = 60[$r0.1]
;;
;;
	c0	ldh $r0.11 = 0[$r0.11]
;;
;;
	c0	sth 0[$r0.58] = $r0.11
;;
LBB0_10::                               ## %if.end
                                        ##   in Loop: Header=BB0_3 Depth=2
.call interpolate, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = interpolate
;;
	c0	goto LBB0_3
;;
LBB0_11::                               ## %for.inc
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.11 = 52[$r0.1]
;;
	c0	ldw $r0.13 = 44[$r0.1]
;;
;;
	c0	stw 44[$r0.1] = $r0.13
;;
	c0	ldw $r0.12 = 0[$r0.13]
;;
;;
	c0	add $r0.11 = $r0.12, $r0.11
;;
	c0	stw 0[$r0.13] = $r0.11
;;
	c0	ldw $r0.13 = 40[$r0.1]
;;
;;
	c0	stw 40[$r0.1] = $r0.13
;;
	c0	ldw $r0.11 = 0[$r0.13]
;;
	c0	ldw $r0.12 = 56[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, $r0.12
;;
	c0	stw 0[$r0.13] = $r0.11
;;
	c0	ldw $r0.13 = 36[$r0.1]
;;
;;
	c0	stw 36[$r0.1] = $r0.13
;;
	c0	ldw $r0.11 = 0[$r0.13]
;;
	c0	ldw $r0.12 = 24[$r0.1]
;;
;;
	c0	ldhu $r0.12 = 0[$r0.12]
;;
;;
	c0	add $r0.11 = $r0.11, $r0.12
;;
	c0	stw 0[$r0.13] = $r0.11
;;
	c0	ldw $r0.11 = 56[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 10
;;
	c0	stw 56[$r0.1] = $r0.11
	c0	goto LBB0_1
;;
LBB0_12::                               ## %for.end
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
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @edge_to_rpm
edge_to_rpm::
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
	c0	stw 44[$r0.1] = $l0.0
	c0	mov $r0.11 = $r0.3
;;
	c0	stw 40[$r0.1] = $r0.11
	c0	mov $r0.3 = 1
	c0	add $r0.57 = $r0.1, 28
	c0	add $r0.58 = $r0.1, 32
;;
	c0	mov $r0.4 = $r0.11
	c0	mov $r0.5 = $r0.58
	c0	mov $r0.6 = $r0.57
;;
.call fdiv_func, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = fdiv_func
;;
	c0	ldw $r0.11 = 32[$r0.1]
	c0	add $r0.12 = $r0.0, -961111563
;;
	c0	mov $r0.13 = 961111563
;;
;;
	c0	mpylu $r0.14 = $r0.11, 458
	c0	mpyhs $r0.11 = $r0.11, 458
;;
	c0	cmplt $r0.59 = $r0.0, 961111563
;;
	c0	add $r0.11 = $r0.14, $r0.11
	c0	mtb $b0.0 = $r0.59
;;
;;
	c0	slct $r0.60 = $b0.0, $r0.13, $r0.12
	c0	stw 36[$r0.1] = $r0.11
;;
	c0	ldw $r0.4 = 40[$r0.1]
;;
	c0	ldw $r0.3 = 28[$r0.1]
	c0	mov $r0.5 = $r0.58
	c0	mov $r0.6 = $r0.57
;;
;;
.call fdiv_func, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = fdiv_func
;;
	c0	ldw $r0.11 = 32[$r0.1]
	c0	mov $r0.12 = 31
;;
;;
	c0	sub $r0.13 = $r0.0, $r0.11
	c0	cmplt $r0.14 = $r0.0, $r0.11
;;
	c0	mtb $b0.0 = $r0.14
;;
;;
	c0	slct $r0.11 = $b0.0, $r0.11, $r0.13
;;
	c0	mpyllu $r0.13 = $r0.11, $r0.60
	c0	mpylhu $r0.15 = $r0.11, $r0.60
;;
;;
	c0	shru $r0.13 = $r0.13, 16
	c0	mpyhhu $r0.11 = $r0.11, $r0.60
;;
	c0	add $r0.13 = $r0.15, $r0.13
	c0	mov $r0.16 = 5
	c0	ldw $r0.17 = 36[$r0.1]
;;
	c0	zxth $r0.13 = $r0.13
;;
	c0	add $r0.13 = $r0.15, $r0.13
;;
	c0	shru $r0.13 = $r0.13, 16
;;
	c0	add $r0.11 = $r0.11, $r0.13
;;
	c0	orc $r0.13 = $r0.11, $r0.0
	c0	mtb $b0.0 = $r0.14
;;
;;
	c0	slct $r0.11 = $b0.0, $r0.11, $r0.13
;;
	c0	orc $r0.13 = $r0.11, $r0.0
	c0	mtb $b0.0 = $r0.59
;;
;;
	c0	slct $r0.11 = $b0.0, $r0.11, $r0.13
;;
	c0	shru $r0.12 = $r0.11, $r0.12
	c0	shr $r0.11 = $r0.11, $r0.16
;;
	c0	add $r0.11 = $r0.11, $r0.12
;;
	c0	add $r0.11 = $r0.17, $r0.11
;;
	c0	stw 36[$r0.1] = $r0.11
	c0	mov $r0.3 = $r0.11
;;
	c0	ldw $l0.0 = 44[$r0.1]
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

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @interpolate
interpolate::
## BB#0:                                ## %entry
	c0	mov $r0.13 = tab1
	c0	mov $r0.11 = tabptr
;;
	c0	ldw $r0.12 = 0[$r0.13]
;;
;;
	c0	stw 0[$r0.11] = $r0.12
	c0	mov $r0.12 = ival
;;
LBB2_1::                                ## %while.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.14 = 0[$r0.11]
;;
	c0	ldbu $r0.15 = 0[$r0.12]
;;
	c0	ldbu $r0.14 = 0[$r0.14]
;;
;;
	c0	cmpge $b0.0 = $r0.14, $r0.15
;;
;;
	c0	br $b0.0, LBB2_3
;;
## BB#2:                                ## %while.body
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	ldw $r0.14 = 0[$r0.11]
;;
;;
	c0	add $r0.14 = $r0.14, 6
;;
	c0	stw 0[$r0.11] = $r0.14
	c0	goto LBB2_1
;;
LBB2_3::                                ## %while.end
	c0	ldw $r0.14 = 0[$r0.11]
;;
	c0	ldbu $r0.15 = 0[$r0.12]
;;
	c0	ldbu $r0.14 = 0[$r0.14]
;;
;;
	c0	cmpne $b0.0 = $r0.14, $r0.15
;;
;;
	c0	br $b0.0, LBB2_5
;;
## BB#4:                                ## %if.then
	c0	mov $r0.14 = inter1
	c0	ldw $r0.15 = 0[$r0.11]
;;
;;
	c0	ldh $r0.15 = 2[$r0.15]
;;
;;
	c0	sth 0[$r0.14] = $r0.15
	c0	goto LBB2_6
;;
LBB2_5::                                ## %if.else
	c0	ldw $r0.14 = 0[$r0.11]
	c0	mov $r0.15 = inter1
;;
;;
	c0	add $r0.16 = $r0.14, -6
;;
	c0	stw 0[$r0.11] = $r0.16
;;
	c0	ldbu $r0.16 = 0[$r0.12]
;;
	c0	ldbu $r0.17 = -6[$r0.14]
;;
	c0	ldhu $r0.18 = -2[$r0.14]
;;
	c0	sub $r0.16 = $r0.16, $r0.17
;;
	c0	mpyhs $r0.17 = $r0.16, $r0.18
	c0	mpylu $r0.16 = $r0.16, $r0.18
	c0	ldh $r0.14 = -4[$r0.14]
;;
;;
	c0	add $r0.16 = $r0.16, $r0.17
;;
	c0	add $r0.14 = $r0.14, $r0.16
;;
	c0	sth 0[$r0.15] = $r0.14
;;
LBB2_6::                                ## %if.end
	c0	mov $r0.14 = tab2
	c0	ldw $r0.13 = 0[$r0.13]
;;
	c0	ldw $r0.15 = 0[$r0.14]
;;
;;
	c0	cmpne $b0.0 = $r0.15, $r0.13
;;
;;
	c0	brf $b0.0, LBB2_7
;;
## BB#8:                                ## %if.else19
	c0	ldw $r0.13 = 0[$r0.14]
;;
;;
	c0	stw 0[$r0.11] = $r0.13
;;
LBB2_9::                                ## %while.cond20
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.13 = 0[$r0.11]
;;
	c0	ldbu $r0.14 = 0[$r0.12]
;;
	c0	ldbu $r0.13 = 0[$r0.13]
;;
;;
	c0	cmpge $b0.0 = $r0.13, $r0.14
;;
;;
	c0	br $b0.0, LBB2_11
;;
## BB#10:                               ## %while.body26
                                        ##   in Loop: Header=BB2_9 Depth=1
	c0	ldw $r0.13 = 0[$r0.11]
;;
;;
	c0	add $r0.13 = $r0.13, 6
;;
	c0	stw 0[$r0.11] = $r0.13
	c0	goto LBB2_9
;;
LBB2_11::                               ## %while.end28
	c0	ldw $r0.13 = 0[$r0.11]
;;
	c0	ldbu $r0.14 = 0[$r0.12]
;;
	c0	ldbu $r0.13 = 0[$r0.13]
;;
;;
	c0	cmpne $b0.0 = $r0.13, $r0.14
;;
;;
	c0	br $b0.0, LBB2_13
;;
## BB#12:                               ## %if.then34
	c0	mov $r0.12 = inter2
	c0	ldw $r0.11 = 0[$r0.11]
;;
;;
	c0	ldh $r0.11 = 2[$r0.11]
;;
;;
	c0	sth 0[$r0.12] = $r0.11
	c0	goto LBB2_14
;;
LBB2_7::                                ## %if.then18
	c0	mov $r0.11 = inter1
	c0	mov $r0.12 = inter_val
;;
	c0	ldh $r0.11 = 0[$r0.11]
;;
;;
	c0	sth 0[$r0.12] = $r0.11
	c0	goto LBB2_18
;;
LBB2_13::                               ## %if.else36
	c0	ldw $r0.13 = 0[$r0.11]
	c0	mov $r0.14 = inter2
;;
;;
	c0	add $r0.15 = $r0.13, -6
;;
	c0	stw 0[$r0.11] = $r0.15
;;
	c0	ldbu $r0.11 = 0[$r0.12]
;;
	c0	ldbu $r0.12 = -6[$r0.13]
;;
	c0	ldhu $r0.15 = -2[$r0.13]
;;
	c0	sub $r0.11 = $r0.11, $r0.12
;;
	c0	mpyhs $r0.12 = $r0.11, $r0.15
	c0	mpylu $r0.11 = $r0.11, $r0.15
	c0	ldh $r0.13 = -4[$r0.13]
;;
;;
	c0	add $r0.11 = $r0.11, $r0.12
;;
	c0	add $r0.11 = $r0.13, $r0.11
;;
	c0	sth 0[$r0.14] = $r0.11
;;
LBB2_14::                               ## %if.end49
	c0	mov $r0.14 = rpm1
	c0	mov $r0.15 = rpm2
;;
	c0	mov $r0.11 = rpm_delta
	c0	mov $r0.12 = inter2
;;
	c0	ldhu $r0.16 = 0[$r0.14]
	c0	mov $r0.13 = inter1
;;
	c0	ldh $r0.17 = 0[$r0.15]
;;
;;
	c0	sub $r0.16 = $r0.17, $r0.16
;;
	c0	sth 0[$r0.11] = $r0.16
;;
	c0	ldhu $r0.16 = 0[$r0.13]
;;
	c0	ldhu $r0.17 = 0[$r0.12]
;;
;;
	c0	cmple $b0.0 = $r0.17, $r0.16
;;
;;
	c0	br $b0.0, LBB2_16
;;
## BB#15:                               ## %if.then58
	c0	mov $r0.15 = inter_delta
	c0	ldh $r0.12 = 0[$r0.12]
;;
	c0	mov $r0.16 = rpm
	c0	mov $r0.17 = offset
;;
	c0	ldhu $r0.18 = 0[$r0.13]
	c0	mov $r0.19 = inter_temp
;;
;;
	c0	sub $r0.12 = $r0.12, $r0.18
;;
	c0	sth 0[$r0.15] = $r0.12
;;
	c0	ldhu $r0.12 = 0[$r0.14]
;;
	c0	ldh $r0.14 = 0[$r0.16]
;;
;;
	c0	sub $r0.12 = $r0.14, $r0.12
;;
	c0	sth 0[$r0.17] = $r0.12
;;
	c0	ldh $r0.12 = 0[$r0.13]
;;
;;
	c0	sth 0[$r0.19] = $r0.12
	c0	goto LBB2_17
;;
LBB2_16::                               ## %if.else67
	c0	mov $r0.14 = inter_delta
	c0	mov $r0.16 = rpm
;;
	c0	ldh $r0.13 = 0[$r0.13]
	c0	mov $r0.17 = offset
;;
	c0	ldhu $r0.18 = 0[$r0.12]
	c0	mov $r0.19 = inter_temp
;;
;;
	c0	sub $r0.13 = $r0.13, $r0.18
;;
	c0	sth 0[$r0.14] = $r0.13
;;
	c0	ldhu $r0.13 = 0[$r0.16]
;;
	c0	ldh $r0.14 = 0[$r0.15]
;;
;;
	c0	sub $r0.13 = $r0.14, $r0.13
;;
	c0	sth 0[$r0.17] = $r0.13
;;
	c0	ldh $r0.12 = 0[$r0.12]
;;
;;
	c0	sth 0[$r0.19] = $r0.12
;;
LBB2_17::                               ## %if.end76
	c0	mov $r0.12 = inter_delta
	c0	mov $r0.13 = offset
;;
	c0	mov $r0.14 = big_temp
	c0	ldhu $r0.12 = 0[$r0.12]
	c0	mov $r0.15 = 0
;;
	c0	ldhu $r0.13 = 0[$r0.13]
	c0	mov $r0.16 = inter_val
;;
;;
	c0	mpylu $r0.17 = $r0.13, $r0.12
	c0	mpyhs $r0.12 = $r0.13, $r0.12
	c0	mov $r0.13 = inter_temp
;;
;;
	c0	add $r0.12 = $r0.17, $r0.12
;;
	c0	stw 0[$r0.14] = $r0.12
;;
	c0	ldhu $r0.11 = 0[$r0.11]
;;
;;
	c0	cmplt $r0.14 = $r0.11, $r0.0
;;
	c0	shru $r0.17 = $r0.12, $r0.14
	c0	shru $r0.18 = $r0.11, $r0.14
	c0	mtb $b0.0 = $r0.15
;;
;;
	c0	addcg $r0.19, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	mtb $b0.1 = $r0.15
;;
;;
	c0	addcg $r0.15, $b0.1 = $r0.19, $r0.19, $b0.1
	c0	divs $r0.17, $b0.0 = $r0.0, $r0.18, $b0.0
;;
	c0	divs $r0.17, $b0.1 = $r0.17, $r0.18, $b0.1
	c0	addcg $r0.19, $b0.0 = $r0.15, $r0.15, $b0.0
;;
	c0	divs $r0.15, $b0.0 = $r0.17, $r0.18, $b0.0
	c0	addcg $r0.17, $b0.1 = $r0.19, $r0.19, $b0.1
;;
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.18, $b0.1
	c0	addcg $r0.19, $b0.0 = $r0.17, $r0.17, $b0.0
;;
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.18, $b0.0
	c0	addcg $r0.17, $b0.1 = $r0.19, $r0.19, $b0.1
;;
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.18, $b0.1
	c0	addcg $r0.19, $b0.0 = $r0.17, $r0.17, $b0.0
;;
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.18, $b0.0
	c0	addcg $r0.17, $b0.1 = $r0.19, $r0.19, $b0.1
;;
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.18, $b0.1
	c0	addcg $r0.19, $b0.0 = $r0.17, $r0.17, $b0.0
;;
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.18, $b0.0
	c0	addcg $r0.17, $b0.1 = $r0.19, $r0.19, $b0.1
;;
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.18, $b0.1
	c0	addcg $r0.19, $b0.0 = $r0.17, $r0.17, $b0.0
;;
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.18, $b0.0
	c0	addcg $r0.17, $b0.1 = $r0.19, $r0.19, $b0.1
;;
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.18, $b0.1
	c0	addcg $r0.19, $b0.0 = $r0.17, $r0.17, $b0.0
;;
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.18, $b0.0
	c0	addcg $r0.17, $b0.1 = $r0.19, $r0.19, $b0.1
;;
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.18, $b0.1
	c0	addcg $r0.19, $b0.0 = $r0.17, $r0.17, $b0.0
;;
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.18, $b0.0
	c0	addcg $r0.17, $b0.1 = $r0.19, $r0.19, $b0.1
;;
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.18, $b0.1
	c0	addcg $r0.19, $b0.0 = $r0.17, $r0.17, $b0.0
;;
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.18, $b0.0
	c0	addcg $r0.17, $b0.1 = $r0.19, $r0.19, $b0.1
;;
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.18, $b0.1
	c0	addcg $r0.19, $b0.0 = $r0.17, $r0.17, $b0.0
	c0	cmpgeu $r0.11 = $r0.12, $r0.11
;;
	c0	divs $r0.12, $b0.0 = $r0.15, $r0.18, $b0.0
	c0	addcg $r0.15, $b0.1 = $r0.19, $r0.19, $b0.1
;;
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.18, $b0.1
	c0	addcg $r0.17, $b0.2 = $r0.15, $r0.15, $b0.0
	c0	mtb $b0.0 = $r0.14
;;
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.18, $b0.2
	c0	addcg $r0.14, $b0.1 = $r0.17, $r0.17, $b0.1
;;
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.18, $b0.1
	c0	addcg $r0.15, $b0.2 = $r0.14, $r0.14, $b0.2
;;
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.18, $b0.2
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
;;
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.18, $b0.1
	c0	addcg $r0.15, $b0.2 = $r0.14, $r0.14, $b0.2
;;
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.18, $b0.2
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
;;
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.18, $b0.1
	c0	addcg $r0.15, $b0.2 = $r0.14, $r0.14, $b0.2
;;
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.18, $b0.2
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
;;
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.18, $b0.1
	c0	addcg $r0.15, $b0.2 = $r0.14, $r0.14, $b0.2
;;
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.18, $b0.2
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
;;
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.18, $b0.1
	c0	addcg $r0.15, $b0.2 = $r0.14, $r0.14, $b0.2
;;
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.18, $b0.2
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
;;
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.18, $b0.1
	c0	addcg $r0.15, $b0.2 = $r0.14, $r0.14, $b0.2
;;
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
;;
	c0	cmpge $b0.1 = $r0.12, $r0.0
	c0	orc $r0.12 = $r0.14, $r0.0
;;
;;
	c0	mfb $r0.14 = $b0.1
;;
	c0	sh1add $r0.12 = $r0.12, $r0.14
;;
	c0	slct $r0.11 = $b0.0, $r0.11, $r0.12
;;
	c0	sth 0[$r0.16] = $r0.11
;;
	c0	ldh $r0.11 = 0[$r0.16]
;;
	c0	ldhu $r0.12 = 0[$r0.13]
;;
;;
	c0	add $r0.11 = $r0.11, $r0.12
;;
	c0	sth 0[$r0.16] = $r0.11
;;
LBB2_18::                               ## %if.end86
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @fdiv_func
fdiv_func::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 44[$r0.1] = $r0.3
;;
	c0	stw 40[$r0.1] = $r0.4
;;
	c0	stw 36[$r0.1] = $r0.5
;;
	c0	stw 32[$r0.1] = $r0.6
	c0	mov $r0.11 = 16
	c0	mov $r0.12 = 0
;;
	c0	ldw $r0.13 = 44[$r0.1]
;;
;;
	c0	shl $r0.11 = $r0.13, $r0.11
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	cmplt $r0.13 = $r0.11, $r0.0
	c0	sub $r0.14 = $r0.0, $r0.11
;;
	c0	mtb $b0.0 = $r0.13
	c0	ldw $r0.15 = 40[$r0.1]
;;
;;
	c0	slct $r0.11 = $b0.0, $r0.14, $r0.11
	c0	cmplt $r0.14 = $r0.15, $r0.0
	c0	sub $r0.16 = $r0.0, $r0.15
	c0	mtb $b0.0 = $r0.12
;;
;;
	c0	addcg $r0.17, $b0.1 = $r0.11, $r0.11, $b0.0
	c0	mtb $b0.2 = $r0.14
	c0	cmpeq $b0.0 = $r0.13, $r0.14
	c0	mtb $b0.3 = $r0.12
;;
;;
	c0	addcg $r0.11, $b0.3 = $r0.17, $r0.17, $b0.3
	c0	slct $r0.12 = $b0.2, $r0.16, $r0.15
;;
	c0	divs $r0.13, $b0.1 = $r0.0, $r0.12, $b0.1
;;
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.12, $b0.3
	c0	addcg $r0.14, $b0.1 = $r0.11, $r0.11, $b0.1
;;
	c0	divs $r0.11, $b0.1 = $r0.13, $r0.12, $b0.1
	c0	addcg $r0.13, $b0.2 = $r0.14, $r0.14, $b0.2
;;
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.12, $b0.2
	c0	addcg $r0.14, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.12, $b0.1
	c0	addcg $r0.13, $b0.2 = $r0.14, $r0.14, $b0.2
;;
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.12, $b0.2
	c0	addcg $r0.14, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.12, $b0.1
	c0	addcg $r0.13, $b0.2 = $r0.14, $r0.14, $b0.2
;;
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.12, $b0.2
	c0	addcg $r0.14, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.12, $b0.1
	c0	addcg $r0.13, $b0.2 = $r0.14, $r0.14, $b0.2
	c0	ldw $r0.14 = 36[$r0.1]
;;
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.12, $b0.2
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.12, $b0.1
	c0	addcg $r0.13, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.12, $b0.2
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.12, $b0.1
	c0	addcg $r0.13, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.12, $b0.2
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.12, $b0.1
	c0	addcg $r0.13, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.12, $b0.2
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.12, $b0.1
	c0	addcg $r0.13, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.12, $b0.2
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.12, $b0.1
	c0	addcg $r0.13, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.12, $b0.2
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.12, $b0.1
	c0	addcg $r0.13, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.12, $b0.2
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.12, $b0.1
	c0	addcg $r0.13, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.12, $b0.2
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.12, $b0.1
	c0	addcg $r0.13, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.12, $b0.2
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.12, $b0.1
	c0	addcg $r0.13, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.12, $b0.2
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.12, $b0.1
	c0	addcg $r0.13, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.12, $b0.2
	c0	addcg $r0.15, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	divs $r0.11, $b0.1 = $r0.11, $r0.12, $b0.1
	c0	addcg $r0.13, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	divs $r0.11, $b0.2 = $r0.11, $r0.12, $b0.2
	c0	addcg $r0.12, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	addcg $r0.13, $b0.1 = $r0.12, $r0.12, $b0.2
	c0	cmpge $r0.11 = $r0.11, $r0.0
;;
	c0	orc $r0.12 = $r0.13, $r0.0
;;
	c0	sh1add $r0.11 = $r0.12, $r0.11
;;
	c0	sub $r0.12 = $r0.0, $r0.11
;;
	c0	slct $r0.11 = $b0.0, $r0.11, $r0.12
;;
	c0	stw 0[$r0.14] = $r0.11
;;
	c0	ldw $r0.11 = 36[$r0.1]
;;
	c0	ldw $r0.12 = 40[$r0.1]
;;
	c0	ldw $r0.11 = 0[$r0.11]
;;
	c0	ldw $r0.13 = 28[$r0.1]
;;
	c0	mpyhs $r0.14 = $r0.11, $r0.12
	c0	mpylu $r0.11 = $r0.11, $r0.12
	c0	ldw $r0.12 = 32[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, $r0.14
;;
	c0	sub $r0.11 = $r0.13, $r0.11
;;
.return ret($r0.3:s32)
	c0	stw 0[$r0.12] = $r0.11
	c0	return $r0.1 = $r0.1, 64, $l0.0
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
	c0	stw 24[$r0.1] = $l0.0
	c0	mov $r0.11 = 0
	c0	mov $r0.57 = debug_val
;;
.call engine, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	stw 20[$r0.1] = $r0.11
	c0	call $l0.0 = engine
;;
	c0	ldw $r0.11 = 0[$r0.57]
;;
;;
	c0	cmpne $b0.0 = $r0.11, 191932
;;
;;
	c0	br $b0.0, LBB4_3
;;
## BB#1:                                ## %lor.lhs.false
	c0	mov $r0.11 = debug_base
;;
	c0	ldw $r0.11 = 0[$r0.11]
;;
;;
	c0	cmpne $b0.0 = $r0.11, 3250
;;
;;
	c0	br $b0.0, LBB4_3
;;
## BB#2:                                ## %lor.lhs.false2
	c0	mov $r0.11 = debug_interval
;;
	c0	ldw $r0.11 = 0[$r0.11]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 418230
;;
;;
	c0	br $b0.0, LBB4_4
;;
LBB4_3::                                ## %if.then
	c0	mov $r0.3 = .str
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	mov $r0.11 = 15
;;
	c0	stw 20[$r0.1] = $r0.11
	c0	goto LBB4_5
;;
LBB4_4::                                ## %if.end
	c0	mov $r0.3 = .str1
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	mov $r0.11 = 66
;;
	c0	stw 20[$r0.1] = $r0.11
;;
LBB4_5::                                ## %return
	c0	ldw $r0.3 = 20[$r0.1]
;;
	c0	ldw $l0.0 = 24[$r0.1]
;;
	c0	ldw $r0.57 = 28[$r0.1]
;;
;;
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .data

	.align	2                       ## @vaf_fi_tab0
vaf_fi_tab0::
	.data1	0                       ## 0x0
	.skip	1
	.data2	2400                    ## 0x960
	.data2	20                      ## 0x14
	.data1	50                      ## 0x32
	.skip	1
	.data2	3400                    ## 0xd48
	.data2	115                     ## 0x73
	.data1	100                     ## 0x64
	.skip	1
	.data2	9150                    ## 0x23be
	.data2	120                     ## 0x78
	.data1	150                     ## 0x96
	.skip	1
	.data2	15150                   ## 0x3b2e
	.data2	100                     ## 0x64
	.data1	200                     ## 0xc8
	.skip	1
	.data2	20150                   ## 0x4eb6
	.data2	100                     ## 0x64
	.data1	255                     ## 0xff
	.skip	1
	.data2	25650                   ## 0x6432
	.data2	0                       ## 0x0

	.align	2                       ## @vaf_fi_tab1000
vaf_fi_tab1000::
	.data1	0                       ## 0x0
	.skip	1
	.data2	2500                    ## 0x9c4
	.data2	20                      ## 0x14
	.data1	50                      ## 0x32
	.skip	1
	.data2	3500                    ## 0xdac
	.data2	40                      ## 0x28
	.data1	75                      ## 0x4b
	.skip	1
	.data2	4500                    ## 0x1194
	.data2	150                     ## 0x96
	.data1	100                     ## 0x64
	.skip	1
	.data2	8250                    ## 0x203a
	.data2	200                     ## 0xc8
	.data1	200                     ## 0xc8
	.skip	1
	.data2	28250                   ## 0x6e5a
	.data2	200                     ## 0xc8
	.data1	255                     ## 0xff
	.skip	1
	.data2	39250                   ## 0x9952
	.data2	0                       ## 0x0

	.align	2                       ## @vaf_fi_tab1500
vaf_fi_tab1500::
	.data1	0                       ## 0x0
	.skip	1
	.data2	2600                    ## 0xa28
	.data2	20                      ## 0x14
	.data1	50                      ## 0x32
	.skip	1
	.data2	3600                    ## 0xe10
	.data2	40                      ## 0x28
	.data1	75                      ## 0x4b
	.skip	1
	.data2	4600                    ## 0x11f8
	.data2	200                     ## 0xc8
	.data1	100                     ## 0x64
	.skip	1
	.data2	9600                    ## 0x2580
	.data2	150                     ## 0x96
	.data1	150                     ## 0x96
	.skip	1
	.data2	17100                   ## 0x42cc
	.data2	100                     ## 0x64
	.data1	200                     ## 0xc8
	.skip	1
	.data2	22100                   ## 0x5654
	.data2	200                     ## 0xc8
	.data1	255                     ## 0xff
	.skip	1
	.data2	33100                   ## 0x814c
	.data2	0                       ## 0x0

	.align	2                       ## @vaf_fi_tab2000
vaf_fi_tab2000::
	.data1	0                       ## 0x0
	.skip	1
	.data2	2500                    ## 0x9c4
	.data2	10                      ## 0xa
	.data1	50                      ## 0x32
	.skip	1
	.data2	3000                    ## 0xbb8
	.data2	30                      ## 0x1e
	.data1	100                     ## 0x64
	.skip	1
	.data2	4500                    ## 0x1194
	.data2	120                     ## 0x78
	.data1	125                     ## 0x7d
	.skip	1
	.data2	7500                    ## 0x1d4c
	.data2	180                     ## 0xb4
	.data1	150                     ## 0x96
	.skip	1
	.data2	12000                   ## 0x2ee0
	.data2	300                     ## 0x12c
	.data1	175                     ## 0xaf
	.skip	1
	.data2	19500                   ## 0x4c2c
	.data2	400                     ## 0x190
	.data1	200                     ## 0xc8
	.skip	1
	.data2	29500                   ## 0x733c
	.data2	300                     ## 0x12c
	.data1	255                     ## 0xff
	.skip	1
	.data2	46000                   ## 0xb3b0
	.data2	0                       ## 0x0

	.align	2                       ## @vaf_fi_tab4000
vaf_fi_tab4000::
	.data1	0                       ## 0x0
	.skip	1
	.data2	2500                    ## 0x9c4
	.data2	10                      ## 0xa
	.data1	50                      ## 0x32
	.skip	1
	.data2	3000                    ## 0xbb8
	.data2	30                      ## 0x1e
	.data1	100                     ## 0x64
	.skip	1
	.data2	4500                    ## 0x1194
	.data2	180                     ## 0xb4
	.data1	125                     ## 0x7d
	.skip	1
	.data2	9000                    ## 0x2328
	.data2	250                     ## 0xfa
	.data1	150                     ## 0x96
	.skip	1
	.data2	15250                   ## 0x3b92
	.data2	300                     ## 0x12c
	.data1	175                     ## 0xaf
	.skip	1
	.data2	22750                   ## 0x58de
	.data2	300                     ## 0x12c
	.data1	200                     ## 0xc8
	.skip	1
	.data2	30250                   ## 0x762a
	.data2	300                     ## 0x12c
	.data1	255                     ## 0xff
	.skip	1
	.data2	46750                   ## 0xb69e
	.data2	0                       ## 0x0

	.align	2                       ## @vaf_fi_tab4500
vaf_fi_tab4500::
	.data1	0                       ## 0x0
	.skip	1
	.data2	2500                    ## 0x9c4
	.data2	10                      ## 0xa
	.data1	50                      ## 0x32
	.skip	1
	.data2	3000                    ## 0xbb8
	.data2	30                      ## 0x1e
	.data1	100                     ## 0x64
	.skip	1
	.data2	4500                    ## 0x1194
	.data2	180                     ## 0xb4
	.data1	125                     ## 0x7d
	.skip	1
	.data2	9000                    ## 0x2328
	.data2	250                     ## 0xfa
	.data1	150                     ## 0x96
	.skip	1
	.data2	15250                   ## 0x3b92
	.data2	325                     ## 0x145
	.data1	175                     ## 0xaf
	.skip	1
	.data2	23375                   ## 0x5b4f
	.data2	325                     ## 0x145
	.data1	200                     ## 0xc8
	.skip	1
	.data2	31500                   ## 0x7b0c
	.data2	300                     ## 0x12c
	.data1	255                     ## 0xff
	.skip	1
	.data2	48000                   ## 0xbb80
	.data2	0                       ## 0x0

	.align	2                       ## @vaf_fi_tab5000
vaf_fi_tab5000::
	.data1	0                       ## 0x0
	.skip	1
	.data2	2500                    ## 0x9c4
	.data2	10                      ## 0xa
	.data1	50                      ## 0x32
	.skip	1
	.data2	3000                    ## 0xbb8
	.data2	30                      ## 0x1e
	.data1	100                     ## 0x64
	.skip	1
	.data2	4500                    ## 0x1194
	.data2	180                     ## 0xb4
	.data1	125                     ## 0x7d
	.skip	1
	.data2	9000                    ## 0x2328
	.data2	200                     ## 0xc8
	.data1	150                     ## 0x96
	.skip	1
	.data2	14000                   ## 0x36b0
	.data2	300                     ## 0x12c
	.data1	175                     ## 0xaf
	.skip	1
	.data2	21500                   ## 0x53fc
	.data2	300                     ## 0x12c
	.data1	200                     ## 0xc8
	.skip	1
	.data2	29000                   ## 0x7148
	.data2	300                     ## 0x12c
	.data1	255                     ## 0xff
	.skip	1
	.data2	45500                   ## 0xb1bc
	.data2	0                       ## 0x0

	.align	2                       ## @vaf_fi_tab8000
vaf_fi_tab8000::
	.data1	0                       ## 0x0
	.skip	1
	.data2	2500                    ## 0x9c4
	.data2	10                      ## 0xa
	.data1	50                      ## 0x32
	.skip	1
	.data2	3000                    ## 0xbb8
	.data2	30                      ## 0x1e
	.data1	100                     ## 0x64
	.skip	1
	.data2	4500                    ## 0x1194
	.data2	180                     ## 0xb4
	.data1	150                     ## 0x96
	.skip	1
	.data2	13500                   ## 0x34bc
	.data2	275                     ## 0x113
	.data1	175                     ## 0xaf
	.skip	1
	.data2	20375                   ## 0x4f97
	.data2	280                     ## 0x118
	.data1	200                     ## 0xc8
	.skip	1
	.data2	27375                   ## 0x6aef
	.data2	290                     ## 0x122
	.data1	225                     ## 0xe1
	.skip	1
	.data2	34625                   ## 0x8741
	.data2	300                     ## 0x12c
	.data1	255                     ## 0xff
	.skip	1
	.data2	43625                   ## 0xaa69
	.data2	0                       ## 0x0

	.section	.data
	.align	4                       ## @rpm_vfi_tab
rpm_vfi_tab::
	.data2	0                       ## 0x0
	.skip	2
	.data4	vaf_fi_tab0
	.data2	1000                    ## 0x3e8
	.skip	2
	.data4	vaf_fi_tab1000
	.data2	1500                    ## 0x5dc
	.skip	2
	.data4	vaf_fi_tab1500
	.data2	2000                    ## 0x7d0
	.skip	2
	.data4	vaf_fi_tab2000
	.data2	4000                    ## 0xfa0
	.skip	2
	.data4	vaf_fi_tab4000
	.data2	4500                    ## 0x1194
	.skip	2
	.data4	vaf_fi_tab4500
	.data2	5000                    ## 0x1388
	.skip	2
	.data4	vaf_fi_tab5000
	.data2	8000                    ## 0x1f40
	.skip	2
	.data4	vaf_fi_tab8000

	.comm	ival,1,1                ## @ival
	.comm	tab2,4,4                ## @tab2
	.comm	tab1,4,4                ## @tab1
	.comm	rpm2,2,2                ## @rpm2
	.comm	rpm1,2,2                ## @rpm1
	.comm	debug_val,4,4           ## @debug_val
	.comm	debug_base,4,4          ## @debug_base
	.comm	inter_val,2,2           ## @inter_val
	.comm	debug_interval,4,4      ## @debug_interval
	.comm	tabptr,4,4              ## @tabptr
	.comm	inter1,2,2              ## @inter1
	.comm	inter2,2,2              ## @inter2
	.comm	rpm_delta,2,2           ## @rpm_delta
	.comm	inter_delta,2,2         ## @inter_delta
	.comm	rpm,2,2                 ## @rpm
	.comm	offset,2,2              ## @offset
	.comm	inter_temp,2,2          ## @inter_temp
	.comm	big_temp,4,4            ## @big_temp
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
.import puts
