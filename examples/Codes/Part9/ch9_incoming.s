	.text
	.file	"ch9_incoming.ll"
	.globl	_Z5sum_iiii
	.align	2
	.type	_Z5sum_iiii,@function
_Z5sum_iiii::                           ## @_Z5sum_iiii
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -16
	c0	stw 12[$r0.1] = $r0.3
	c0	stw 8[$r0.1] = $r0.4
	c0	stw 4[$r0.1] = $r0.5
	c0	ldw $r0.58 = 8[$r0.1]
	c0	ldw $r0.59 = 12[$r0.1]
	c0	add $r0.58 = $r0.59, $r0.58
	c0	add $r0.58 = $r0.58, $r0.5
	c0	stw 0[$r0.1] = $r0.58
	c0	mov $r0.3 = $r0.58
	c0	return $r0.1 = $r0.1, 16, $l0.0
$func_end0::
	.size	_Z5sum_iiii, ($func_end0)-_Z5sum_iiii

	.globl	main
	.align	2
	.type	main,@function
main::                                  ## @main
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -8
	c0	stw 4[$r0.1] = $l0.0    ## 4-byte Folded Spill
	c0	mov $r0.58 = 0
	c0	stw 0[$r0.1] = $r0.58
	c0	mov $r0.3 = 10
	c0	mov $r0.4 = 20
	c0	mov $r0.5 = 25
	c0	call $l0.0 = _Z5sum_iiii
	c0	ldw $l0.0 = 4[$r0.1]    ## 4-byte Folded Reload
	c0	return $r0.1 = $r0.1, 8, $l0.0
$func_end1::
	.size	main, ($func_end1)-main


