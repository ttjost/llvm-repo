	.text
	.file	"/Users/ttjost/Dropbox/Universidade/Mestrado/llvm/examples/Codes/Part8/ch8_1_2.ll"
	.globl	main
	.align	2
	.type	main,@function
main::                                  ## @main
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -16
	c0	mov $r0.58 = 0
	c0	stw 12[$r0.1] = $r0.58
	c0	stw 8[$r0.1] = $r0.58
	c0	mov $r0.58 = 1
	c0	stw 4[$r0.1] = $r0.58
	c0	add $r0.58 = $r0.1, 8
	c0	stw 0[$r0.1] = $r0.58
	c0	ldw $r0.58 = 8[$r0.1]
	c0	cmpeq $b0.0 = $r0.58, 0
	c0	mfb $r0.58 = $b0.0
	c0	stw 4[$r0.1] = $r0.58
	c0	br $b0.0, LBB0_2
	c0	goto LBB0_1
LBB0_2::                                ## %if.else
	c0	ldw $r0.58 = 4[$r0.1]
	c0	cmpgt $b0.0 = $r0.58, -1
	c0	br $b0.0, LBB0_4
	c0	goto LBB0_3
LBB0_4::                                ## %if.else3
	c0	ldw $r0.58 = 4[$r0.1]
	c0	cmplt $b0.0 = $r0.58, 1
	c0	br $b0.0, LBB0_6
	c0	goto LBB0_5
LBB0_5::                                ## %if.then5
	c0	ldw $r0.58 = 8[$r0.1]
	c0	add $r0.58 = $r0.58, 1
	c0	stw 8[$r0.1] = $r0.58
	c0	goto LBB0_8
LBB0_1::                                ## %if.then
	c0	ldw $r0.58 = 4[$r0.1]
	c0	ldw $r0.59 = 8[$r0.1]
	c0	add $r0.58 = $r0.59, $r0.58
	c0	stw 8[$r0.1] = $r0.58
	c0	goto LBB0_8
LBB0_3::                                ## %if.then2
	c0	ldw $r0.58 = 8[$r0.1]
	c0	add $r0.58 = $r0.58, -1
	c0	stw 8[$r0.1] = $r0.58
	c0	goto LBB0_8
LBB0_6::                                ## %if.else7
	c0	ldw $r0.58 = 4[$r0.1]
	c0	cmpeq $b0.0 = $r0.58, 0
	c0	br $b0.0, LBB0_8
	c0	goto LBB0_7
LBB0_7::                                ## %if.then9
	c0	ldw $r0.58 = 4[$r0.1]
	c0	ldw $r0.59 = 8[$r0.1]
	c0	sub $r0.58 = $r0.59, $r0.58
	c0	stw 8[$r0.1] = $r0.58
LBB0_8::                                ## %if.end13
	c0	ldw $r0.3 = 8[$r0.1]
	c0	return $r0.1 = $r0.1, 16, $l0.0
$func_end0::
	.size	main, ($func_end0)-main


