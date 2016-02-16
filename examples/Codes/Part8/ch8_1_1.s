	.text
	.file	"/Users/ttjost/Dropbox/Universidade/Mestrado/llvm/examples/Codes/Part8/ch8_1_1.ll"
	.globl	_Z13test_control1v
	.align	2
	.type	_Z13test_control1v,@function
_Z13test_control1v::                    ## @_Z13test_control1v
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -40
	c0	mov $r0.58 = 0
	c0	stw 36[$r0.1] = $r0.58
	c0	mov $r0.58 = 1
	c0	stw 32[$r0.1] = $r0.58
	c0	mov $r0.58 = 2
	c0	stw 28[$r0.1] = $r0.58
	c0	mov $r0.58 = 3
	c0	stw 24[$r0.1] = $r0.58
	c0	mov $r0.58 = 4
	c0	stw 20[$r0.1] = $r0.58
	c0	mov $r0.58 = 5
	c0	stw 16[$r0.1] = $r0.58
	c0	mov $r0.58 = 6
	c0	stw 12[$r0.1] = $r0.58
	c0	mov $r0.58 = 7
	c0	stw 8[$r0.1] = $r0.58
	c0	mov $r0.58 = 8
	c0	stw 4[$r0.1] = $r0.58
	c0	mov $r0.58 = 9
	c0	stw 0[$r0.1] = $r0.58
	c0	ldw $r0.58 = 36[$r0.1]
	c0	cmpne $b0.0 = $r0.58, 0
	c0	br $b0.0, LBB0_2
	c0	goto LBB0_1
LBB0_1::                                ## %if.then
	c0	ldw $r0.58 = 36[$r0.1]
	c0	add $r0.58 = $r0.58, 1
	c0	stw 36[$r0.1] = $r0.58
LBB0_2::                                ## %if.end
	c0	ldw $r0.58 = 32[$r0.1]
	c0	cmpeq $b0.0 = $r0.58, 0
	c0	br $b0.0, LBB0_4
	c0	goto LBB0_3
LBB0_3::                                ## %if.then2
	c0	ldw $r0.58 = 32[$r0.1]
	c0	add $r0.58 = $r0.58, 1
	c0	stw 32[$r0.1] = $r0.58
LBB0_4::                                ## %if.end4
	c0	ldw $r0.58 = 28[$r0.1]
	c0	cmplt $b0.0 = $r0.58, 1
	c0	br $b0.0, LBB0_6
	c0	goto LBB0_5
LBB0_5::                                ## %if.then6
	c0	ldw $r0.58 = 28[$r0.1]
	c0	add $r0.58 = $r0.58, 1
	c0	stw 28[$r0.1] = $r0.58
LBB0_6::                                ## %if.end8
	c0	ldw $r0.58 = 24[$r0.1]
	c0	cmplt $b0.0 = $r0.58, 0
	c0	br $b0.0, LBB0_8
	c0	goto LBB0_7
LBB0_7::                                ## %if.then10
	c0	ldw $r0.58 = 24[$r0.1]
	c0	add $r0.58 = $r0.58, 1
	c0	stw 24[$r0.1] = $r0.58
LBB0_8::                                ## %if.end12
	c0	ldw $r0.58 = 20[$r0.1]
	c0	cmpgt $b0.0 = $r0.58, -1
	c0	br $b0.0, LBB0_10
	c0	goto LBB0_9
LBB0_9::                                ## %if.then14
	c0	ldw $r0.58 = 20[$r0.1]
	c0	add $r0.58 = $r0.58, 1
	c0	stw 20[$r0.1] = $r0.58
LBB0_10::                               ## %if.end16
	c0	ldw $r0.58 = 16[$r0.1]
	c0	cmpgt $b0.0 = $r0.58, 0
	c0	br $b0.0, LBB0_12
	c0	goto LBB0_11
LBB0_11::                               ## %if.then18
	c0	ldw $r0.58 = 16[$r0.1]
	c0	add $r0.58 = $r0.58, 1
	c0	stw 16[$r0.1] = $r0.58
LBB0_12::                               ## %if.end20
	c0	ldw $r0.58 = 12[$r0.1]
	c0	cmpgt $b0.0 = $r0.58, 1
	c0	br $b0.0, LBB0_14
	c0	goto LBB0_13
LBB0_13::                               ## %if.then22
	c0	ldw $r0.58 = 12[$r0.1]
	c0	add $r0.58 = $r0.58, 1
	c0	stw 12[$r0.1] = $r0.58
LBB0_14::                               ## %if.end24
	c0	ldw $r0.58 = 8[$r0.1]
	c0	cmplt $b0.0 = $r0.58, 1
	c0	br $b0.0, LBB0_16
	c0	goto LBB0_15
LBB0_15::                               ## %if.then26
	c0	ldw $r0.58 = 8[$r0.1]
	c0	add $r0.58 = $r0.58, 1
	c0	stw 8[$r0.1] = $r0.58
LBB0_16::                               ## %if.end28
	c0	ldw $r0.58 = 8[$r0.1]
	c0	ldw $r0.59 = 4[$r0.1]
	c0	cmpge $b0.0 = $r0.59, $r0.58
	c0	br $b0.0, LBB0_18
	c0	goto LBB0_17
LBB0_17::                               ## %if.then30
	c0	ldw $r0.58 = 4[$r0.1]
	c0	add $r0.58 = $r0.58, 1
	c0	stw 4[$r0.1] = $r0.58
LBB0_18::                               ## %if.end32
	c0	ldw $r0.58 = 32[$r0.1]
	c0	ldw $r0.59 = 36[$r0.1]
	c0	cmpeq $b0.0 = $r0.59, $r0.58
	c0	br $b0.0, LBB0_20
	c0	goto LBB0_19
LBB0_19::                               ## %if.then34
	c0	ldw $r0.58 = 0[$r0.1]
	c0	add $r0.58 = $r0.58, 1
	c0	stw 0[$r0.1] = $r0.58
LBB0_20::                               ## %if.end36
	c0	ldw $r0.58 = 32[$r0.1]
	c0	ldw $r0.59 = 36[$r0.1]
	c0	add $r0.58 = $r0.59, $r0.58
	c0	ldw $r0.59 = 28[$r0.1]
	c0	add $r0.58 = $r0.58, $r0.59
	c0	ldw $r0.59 = 24[$r0.1]
	c0	add $r0.58 = $r0.58, $r0.59
	c0	ldw $r0.59 = 20[$r0.1]
	c0	add $r0.58 = $r0.58, $r0.59
	c0	ldw $r0.59 = 16[$r0.1]
	c0	add $r0.58 = $r0.58, $r0.59
	c0	ldw $r0.59 = 12[$r0.1]
	c0	add $r0.58 = $r0.58, $r0.59
	c0	ldw $r0.59 = 8[$r0.1]
	c0	add $r0.58 = $r0.58, $r0.59
	c0	ldw $r0.59 = 4[$r0.1]
	c0	add $r0.58 = $r0.58, $r0.59
	c0	ldw $r0.59 = 0[$r0.1]
	c0	add $r0.3 = $r0.58, $r0.59
	c0	return $r0.1 = $r0.1, 40, $l0.0
$func_end0::
	.size	_Z13test_control1v, ($func_end0)-_Z13test_control1v

	.globl	main
	.align	2
	.type	main,@function
main::                                  ## @main
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -8
	c0	stw 4[$r0.1] = $l0.0    ## 4-byte Folded Spill
	c0	mov $r0.58 = 0
	c0	stw 0[$r0.1] = $r0.58
	c0	call $l0.0 = _Z13test_control1v
	c0	ldw $l0.0 = 4[$r0.1]    ## 4-byte Folded Reload
	c0	return $r0.1 = $r0.1, 8, $l0.0
$func_end1::
	.size	main, ($func_end1)-main


