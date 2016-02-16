	.text
	.file	"/Users/ttjost/Dropbox/Universidade/Mestrado/llvm/examples/Codes/Part8/ch8_1_4.ll"
	.globl	main
	.align	2
	.type	main,@function
main::                                  ## @main
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -8
	c0	mov $r0.58 = 0
	c0	stw 4[$r0.1] = $r0.58
	c0	mov $r0.59 = 3
	c0	stw 0[$r0.1] = $r0.59
	c0	mtb $b0.0 = $r0.58
	c0	br $b0.0, LBB0_2
	c0	goto LBB0_1
LBB0_1::                                ## %if.then
	c0	ldw $r0.58 = 0[$r0.1]
	c0	add $r0.58 = $r0.58, 1
	c0	stw 0[$r0.1] = $r0.58
LBB0_2::                                ## %L1
	c0	ldw $r0.58 = 0[$r0.1]
	c0	add $r0.58 = $r0.58, -1
	c0	stw 0[$r0.1] = $r0.58
	c0	mov $r0.3 = $r0.58
	c0	return $r0.1 = $r0.1, 8, $l0.0
$func_end0::
	.size	main, ($func_end0)-main


