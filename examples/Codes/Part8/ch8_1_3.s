	.text
	.file	"/Users/ttjost/Dropbox/Universidade/Mestrado/llvm/examples/Codes/Part8/ch8_1_3.ll"
	.globl	main
	.align	2
	.type	main,@function
main::                                  ## @main
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -16
	c0	mov $r0.58 = 0
	c0	stw 12[$r0.1] = $r0.58
	c0	mov $r0.59 = 5
	c0	stw 4[$r0.1] = $r0.59
	c0	stw 0[$r0.1] = $r0.58
LBB0_1::                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.59 = 0[$r0.1]
	c0	cmpne $b0.0 = $r0.59, 3
	c0	br $b0.0, LBB0_3
	c0	goto LBB0_2
LBB0_2::                                ## %for.inc
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.59 = 0[$r0.1]
	c0	ldw $r0.60 = 8[$r0.1]
	c0	add $r0.59 = $r0.60, $r0.59
	c0	stw 8[$r0.1] = $r0.59
	c0	ldw $r0.59 = 0[$r0.1]
	c0	add $r0.59 = $r0.59, 1
	c0	stw 0[$r0.1] = $r0.59
	c0	goto LBB0_1
LBB0_3::                                ## %for.end
	c0	stw 0[$r0.1] = $r0.58
LBB0_4::                                ## %for.cond1
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.59 = 0[$r0.1]
	c0	cmpeq $b0.0 = $r0.59, 3
	c0	br $b0.0, LBB0_6
	c0	goto LBB0_5
LBB0_5::                                ## %for.inc5
                                        ##   in Loop: Header=BB0_4 Depth=1
	c0	ldw $r0.59 = 0[$r0.1]
	c0	ldw $r0.60 = 8[$r0.1]
	c0	add $r0.59 = $r0.60, $r0.59
	c0	stw 8[$r0.1] = $r0.59
	c0	ldw $r0.59 = 0[$r0.1]
	c0	add $r0.59 = $r0.59, 1
	c0	stw 0[$r0.1] = $r0.59
	c0	goto LBB0_4
LBB0_6::                                ## %for.end7
	c0	stw 0[$r0.1] = $r0.58
LBB0_7::                                ## %for.cond8
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.59 = 0[$r0.1]
	c0	cmplt $b0.0 = $r0.59, 4
	c0	br $b0.0, LBB0_9
	c0	goto LBB0_8
LBB0_8::                                ## %for.inc12
                                        ##   in Loop: Header=BB0_7 Depth=1
	c0	ldw $r0.59 = 0[$r0.1]
	c0	ldw $r0.60 = 8[$r0.1]
	c0	add $r0.59 = $r0.60, $r0.59
	c0	stw 8[$r0.1] = $r0.59
	c0	ldw $r0.59 = 0[$r0.1]
	c0	add $r0.59 = $r0.59, 1
	c0	stw 0[$r0.1] = $r0.59
	c0	goto LBB0_7
LBB0_9::                                ## %for.end14
	c0	stw 0[$r0.1] = $r0.58
LBB0_10::                               ## %for.cond15
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.59 = 0[$r0.1]
	c0	cmplt $b0.0 = $r0.59, 4
	c0	br $b0.0, LBB0_12
	c0	goto LBB0_11
LBB0_11::                               ## %for.inc19
                                        ##   in Loop: Header=BB0_10 Depth=1
	c0	ldw $r0.59 = 0[$r0.1]
	c0	ldw $r0.60 = 8[$r0.1]
	c0	add $r0.59 = $r0.60, $r0.59
	c0	stw 8[$r0.1] = $r0.59
	c0	ldw $r0.59 = 0[$r0.1]
	c0	add $r0.59 = $r0.59, 1
	c0	stw 0[$r0.1] = $r0.59
	c0	goto LBB0_10
LBB0_12::                               ## %for.end21
	c0	stw 0[$r0.1] = $r0.58
LBB0_13::                               ## %for.cond22
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.59 = 4[$r0.1]
	c0	ldw $r0.60 = 0[$r0.1]
	c0	cmpne $b0.0 = $r0.60, $r0.59
	c0	br $b0.0, LBB0_15
	c0	goto LBB0_14
LBB0_14::                               ## %for.inc26
                                        ##   in Loop: Header=BB0_13 Depth=1
	c0	ldw $r0.59 = 8[$r0.1]
	c0	add $r0.59 = $r0.59, 1
	c0	stw 8[$r0.1] = $r0.59
	c0	ldw $r0.59 = 0[$r0.1]
	c0	add $r0.59 = $r0.59, 1
	c0	stw 0[$r0.1] = $r0.59
	c0	goto LBB0_13
LBB0_15::                               ## %for.end28
	c0	stw 0[$r0.1] = $r0.58
LBB0_16::                               ## %for.cond29
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.59 = 4[$r0.1]
	c0	ldw $r0.60 = 0[$r0.1]
	c0	cmpeq $b0.0 = $r0.60, $r0.59
	c0	br $b0.0, LBB0_18
	c0	goto LBB0_17
LBB0_17::                               ## %for.inc33
                                        ##   in Loop: Header=BB0_16 Depth=1
	c0	ldw $r0.59 = 8[$r0.1]
	c0	add $r0.59 = $r0.59, 1
	c0	stw 8[$r0.1] = $r0.59
	c0	ldw $r0.59 = 0[$r0.1]
	c0	add $r0.59 = $r0.59, 1
	c0	stw 0[$r0.1] = $r0.59
	c0	goto LBB0_16
LBB0_18::                               ## %for.end35
	c0	stw 0[$r0.1] = $r0.58
LBB0_19::                               ## %for.cond36
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.59 = 4[$r0.1]
	c0	ldw $r0.60 = 0[$r0.1]
	c0	cmpge $b0.0 = $r0.60, $r0.59
	c0	br $b0.0, LBB0_21
	c0	goto LBB0_20
LBB0_20::                               ## %for.inc40
                                        ##   in Loop: Header=BB0_19 Depth=1
	c0	ldw $r0.59 = 8[$r0.1]
	c0	add $r0.59 = $r0.59, 1
	c0	stw 8[$r0.1] = $r0.59
	c0	ldw $r0.59 = 0[$r0.1]
	c0	add $r0.59 = $r0.59, 1
	c0	stw 0[$r0.1] = $r0.59
	c0	goto LBB0_19
LBB0_21::                               ## %for.end42
	c0	mov $r0.59 = 7
	c0	stw 0[$r0.1] = $r0.59
LBB0_22::                               ## %for.cond43
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.60 = 4[$r0.1]
	c0	ldw $r0.61 = 0[$r0.1]
	c0	cmple $b0.0 = $r0.61, $r0.60
	c0	br $b0.0, LBB0_24
	c0	goto LBB0_23
LBB0_23::                               ## %for.inc46
                                        ##   in Loop: Header=BB0_22 Depth=1
	c0	ldw $r0.60 = 8[$r0.1]
	c0	add $r0.60 = $r0.60, -1
	c0	stw 8[$r0.1] = $r0.60
	c0	ldw $r0.60 = 0[$r0.1]
	c0	add $r0.60 = $r0.60, -1
	c0	stw 0[$r0.1] = $r0.60
	c0	goto LBB0_22
LBB0_24::                               ## %for.end48
	c0	stw 0[$r0.1] = $r0.58
LBB0_25::                               ## %for.cond49
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.58 = 4[$r0.1]
	c0	ldw $r0.60 = 0[$r0.1]
	c0	cmpgt $b0.0 = $r0.60, $r0.58
	c0	br $b0.0, LBB0_27
	c0	goto LBB0_26
LBB0_26::                               ## %for.inc53
                                        ##   in Loop: Header=BB0_25 Depth=1
	c0	ldw $r0.58 = 8[$r0.1]
	c0	add $r0.58 = $r0.58, 1
	c0	stw 8[$r0.1] = $r0.58
	c0	ldw $r0.58 = 0[$r0.1]
	c0	add $r0.58 = $r0.58, 1
	c0	stw 0[$r0.1] = $r0.58
	c0	goto LBB0_25
LBB0_27::                               ## %label_1
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_28 Depth 2
                                        ##     Child Loop BB0_30 Depth 2
	c0	stw 0[$r0.1] = $r0.59
LBB0_28::                               ## %for.cond56
                                        ##   Parent Loop BB0_27 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldw $r0.58 = 4[$r0.1]
	c0	ldw $r0.60 = 0[$r0.1]
	c0	cmplt $b0.0 = $r0.60, $r0.58
	c0	br $b0.0, LBB0_30
	c0	goto LBB0_29
LBB0_29::                               ## %for.inc60
                                        ##   in Loop: Header=BB0_28 Depth=2
	c0	ldw $r0.58 = 8[$r0.1]
	c0	add $r0.58 = $r0.58, -1
	c0	stw 8[$r0.1] = $r0.58
	c0	ldw $r0.58 = 0[$r0.1]
	c0	add $r0.58 = $r0.58, -1
	c0	stw 0[$r0.1] = $r0.58
	c0	goto LBB0_28
LBB0_30::                               ## %while.cond
                                        ##   Parent Loop BB0_27 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldw $r0.58 = 0[$r0.1]
	c0	cmpgt $b0.0 = $r0.58, 6
	c0	br $b0.0, LBB0_33
	c0	goto LBB0_31
LBB0_31::                               ## %while.body
                                        ##   in Loop: Header=BB0_30 Depth=2
	c0	ldw $r0.58 = 8[$r0.1]
	c0	add $r0.58 = $r0.58, 1
	c0	stw 8[$r0.1] = $r0.58
	c0	ldw $r0.58 = 0[$r0.1]
	c0	add $r0.58 = $r0.58, 1
	c0	stw 0[$r0.1] = $r0.58
	c0	ldw $r0.58 = 8[$r0.1]
	c0	cmpgt $b0.0 = $r0.58, 3
	c0	br $b0.0, LBB0_30
	c0	goto LBB0_32
LBB0_32::                               ## %if.else
                                        ##   in Loop: Header=BB0_30 Depth=2
	c0	ldw $r0.58 = 8[$r0.1]
	c0	cmpne $b0.0 = $r0.58, 3
	c0	br $b0.0, LBB0_30
	c0	goto LBB0_33
LBB0_33::                               ## %while.end
                                        ##   in Loop: Header=BB0_27 Depth=1
	c0	ldw $r0.58 = 8[$r0.1]
	c0	cmpeq $b0.0 = $r0.58, 3
	c0	br $b0.0, LBB0_27
	c0	goto LBB0_34
LBB0_34::                               ## %if.end72
	c0	ldw $r0.58 = 8[$r0.1]
	c0	cmpeq $b0.0 = $r0.58, 2
	c0	br $b0.0, LBB0_37
	c0	goto LBB0_35
LBB0_37::                               ## %sw.bb74
	c0	ldw $r0.58 = 8[$r0.1]
	c0	add $r0.58 = $r0.58, 2
	c0	stw 8[$r0.1] = $r0.58
	c0	goto LBB0_39
LBB0_35::                               ## %if.end72
	c0	cmpne $b0.0 = $r0.58, 1
	c0	br $b0.0, LBB0_38
	c0	goto LBB0_36
LBB0_36::                               ## %sw.bb
	c0	ldw $r0.58 = 8[$r0.1]
	c0	add $r0.58 = $r0.58, 1
	c0	stw 8[$r0.1] = $r0.58
	c0	goto LBB0_39
LBB0_38::                               ## %sw.default
	c0	ldw $r0.58 = 8[$r0.1]
	c0	add $r0.58 = $r0.58, 8
	c0	stw 8[$r0.1] = $r0.58
LBB0_39::                               ## %sw.epilog
	c0	ldw $r0.3 = 8[$r0.1]
	c0	return $r0.1 = $r0.1, 16, $l0.0
$func_end0::
	.size	main, ($func_end0)-main


