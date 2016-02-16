.section .text

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @memset
memset::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 44[$r0.1] = $r0.3
;;
	c0	stw 40[$r0.1] = $r0.4
;;
	c0	stw 36[$r0.1] = $r0.5
;;
	c0	ldw $r0.11 = 44[$r0.1]
;;
;;
	c0	stw 32[$r0.1] = $r0.11
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	mtb $b0.0 = $r0.0
;;
LBB0_1::                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldbu $r0.11 = 31[$r0.1]
;;
;;
	c0	and $r0.11 = $r0.11, 3
;;
	c0	cmpeq $b0.2 = $r0.11, 0
	c0	mfb $r0.11 = $b0.0
;;
	c0	mtb $b0.1 = $r0.11
;;
	c0	br $b0.2, LBB0_3
;;
## BB#2:                                ## %land.rhs
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.11 = 36[$r0.1]
;;
;;
	c0	cmpne $b0.1 = $r0.11, 0
;;
LBB0_3::                                ## %land.end
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	mfb $r0.11 = $b0.1
;;
	c0	cmpne $b0.1 = $r0.11, 1
;;
;;
	c0	br $b0.1, LBB0_6
;;
## BB#4:                                ## %for.body
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.11 = 28[$r0.1]
;;
	c0	ldw $r0.12 = 40[$r0.1]
;;
;;
	c0	stb 0[$r0.11] = $r0.12
;;
## BB#5:                                ## %for.inc
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.11 = 36[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, -1
;;
	c0	stw 36[$r0.1] = $r0.11
;;
	c0	ldw $r0.11 = 28[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	goto LBB0_1
;;
LBB0_6::                                ## %for.end
	c0	ldw $r0.11 = 28[$r0.1]
;;
;;
	c0	stw 32[$r0.1] = $r0.11
;;
	c0	ldw $r0.11 = 36[$r0.1]
;;
;;
	c0	cmpltu $b0.0 = $r0.11, 4
;;
;;
	c0	br $b0.0, LBB0_12
;;
## BB#7:                                ## %if.then
	c0	ldw $r0.11 = 40[$r0.1]
	c0	mov $r0.12 = 16
	c0	mov $r0.13 = 24
	c0	mov $r0.14 = 8
;;
;;
	c0	shl $r0.12 = $r0.11, $r0.12
	c0	shl $r0.13 = $r0.11, $r0.13
	c0	shl $r0.14 = $r0.11, $r0.14
;;
	c0	or $r0.12 = $r0.13, $r0.12
;;
	c0	or $r0.12 = $r0.12, $r0.14
;;
	c0	or $r0.11 = $r0.12, $r0.11
;;
	c0	stw 24[$r0.1] = $r0.11
;;
	c0	ldw $r0.11 = 32[$r0.1]
;;
;;
	c0	stw 20[$r0.1] = $r0.11
;;
LBB0_8::                                ## %for.cond7
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.11 = 36[$r0.1]
;;
;;
	c0	cmpltu $b0.0 = $r0.11, 4
;;
;;
	c0	br $b0.0, LBB0_11
;;
## BB#9:                                ## %for.body10
                                        ##   in Loop: Header=BB0_8 Depth=1
	c0	ldw $r0.11 = 20[$r0.1]
;;
	c0	ldw $r0.12 = 24[$r0.1]
;;
;;
	c0	stw 0[$r0.11] = $r0.12
;;
## BB#10:                               ## %for.inc11
                                        ##   in Loop: Header=BB0_8 Depth=1
	c0	ldw $r0.11 = 36[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, -4
;;
	c0	stw 36[$r0.1] = $r0.11
;;
	c0	ldw $r0.11 = 20[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 4
;;
	c0	stw 20[$r0.1] = $r0.11
	c0	goto LBB0_8
;;
LBB0_11::                               ## %for.end13
	c0	ldw $r0.11 = 20[$r0.1]
;;
;;
	c0	stw 32[$r0.1] = $r0.11
;;
LBB0_12::                               ## %if.end
	c0	ldw $r0.11 = 32[$r0.1]
;;
;;
	c0	stw 16[$r0.1] = $r0.11
;;
LBB0_13::                               ## %for.cond15
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.11 = 36[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB0_16
;;
## BB#14:                               ## %for.body18
                                        ##   in Loop: Header=BB0_13 Depth=1
	c0	ldw $r0.11 = 16[$r0.1]
;;
	c0	ldw $r0.12 = 40[$r0.1]
;;
;;
	c0	stb 0[$r0.11] = $r0.12
;;
## BB#15:                               ## %for.inc20
                                        ##   in Loop: Header=BB0_13 Depth=1
	c0	ldw $r0.11 = 36[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, -1
;;
	c0	stw 36[$r0.1] = $r0.11
;;
	c0	ldw $r0.11 = 16[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 16[$r0.1] = $r0.11
	c0	goto LBB0_13
;;
LBB0_16::                               ## %for.end23
.return ret($r0.3:s32)
	c0	ldw $r0.3 = 44[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp


