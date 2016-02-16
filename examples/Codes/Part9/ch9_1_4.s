	.text
	.file	"/Users/ttjost/Dropbox/Universidade/Mestrado/llvm/examples/Codes/Part9/ch9_1_4.ll"
	.globl	_Z8multiplyii
	.align	2
	.type	_Z8multiplyii,@function
_Z8multiplyii::                         ## @_Z8multiplyii
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -8
	c0	stw 4[$r0.1] = $r0.3
	c0	stw 0[$r0.1] = $r0.4
	c0	ldw $r0.58 = 4[$r0.1]
	c0	mpyhs $r0.59 = $r0.58, $r0.4
	c0	mpylu $r0.58 = $r0.58, $r0.4
	c0	add $r0.3 = $r0.58, $r0.59
	c0	return $r0.1 = $r0.1, 8, $l0.0
$func_end0::
	.size	_Z8multiplyii, ($func_end0)-_Z8multiplyii

	.globl	_Z3addii
	.align	2
	.type	_Z3addii,@function
_Z3addii::                              ## @_Z3addii
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -8
	c0	stw 4[$r0.1] = $r0.3
	c0	stw 0[$r0.1] = $r0.4
	c0	ldw $r0.58 = 4[$r0.1]
	c0	add $r0.3 = $r0.58, $r0.4
	c0	return $r0.1 = $r0.1, 8, $l0.0
$func_end1::
	.size	_Z3addii, ($func_end1)-_Z3addii

	.globl	_Z4maddiii
	.align	2
	.type	_Z4maddiii,@function
_Z4maddiii::                            ## @_Z4maddiii
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -16
	c0	stw 12[$r0.1] = $l0.0   ## 4-byte Folded Spill
	c0	stw 8[$r0.1] = $r0.3
	c0	stw 4[$r0.1] = $r0.4
	c0	stw 0[$r0.1] = $r0.5
	c0	ldw $r0.4 = 4[$r0.1]
	c0	ldw $r0.3 = 8[$r0.1]
	c0	call $l0.0 = _Z8multiplyii
	c0	mov $r0.4 = $r0.3
	c0	mov $r0.3 = $r0.5
	c0	call $l0.0 = _Z3addii
	c0	ldw $l0.0 = 12[$r0.1]   ## 4-byte Folded Reload
	c0	return $r0.1 = $r0.1, 16, $l0.0
$func_end2::
	.size	_Z4maddiii, ($func_end2)-_Z4maddiii

	.globl	_Z9test_maddv
	.align	2
	.type	_Z9test_maddv,@function
_Z9test_maddv::                         ## @_Z9test_maddv
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -16
	c0	stw 12[$r0.1] = $l0.0   ## 4-byte Folded Spill
	c0	mov $r0.58 = 5
	c0	stw 8[$r0.1] = $r0.58
	c0	mov $r0.3 = 1
	c0	mov $r0.4 = 2
	c0	mov $r0.5 = $r0.58
	c0	call $l0.0 = _Z4maddiii
	c0	stw 4[$r0.1] = $r0.3
	c0	ldw $l0.0 = 12[$r0.1]   ## 4-byte Folded Reload
	c0	return $r0.1 = $r0.1, 16, $l0.0
$func_end3::
	.size	_Z9test_maddv, ($func_end3)-_Z9test_maddv

	.globl	main
	.align	2
	.type	main,@function
main::                                  ## @main
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -24
	c0	stw 20[$r0.1] = $l0.0   ## 4-byte Folded Spill
	c0	stw 16[$r0.1] = $r0.11  ## 4-byte Folded Spill
	c0	mov $r0.58 = 0
	c0	stw 12[$r0.1] = $r0.58
	c0	mov $r0.11 = 2
	c0	mov $r0.4 = 3
	c0	mov $r0.3 = $r0.11
	c0	call $l0.0 = _Z8multiplyii
	c0	stw 8[$r0.1] = $r0.3
	c0	mov $r0.3 = $r0.11
	c0	mov $r0.4 = $r0.11
	c0	call $l0.0 = _Z3addii
	c0	stw 4[$r0.1] = $r0.3
	c0	call $l0.0 = _Z9test_maddv
	c0	stw 0[$r0.1] = $r0.3
	c0	ldw $r0.58 = 4[$r0.1]
	c0	ldw $r0.59 = 8[$r0.1]
	c0	add $r0.58 = $r0.59, $r0.58
	c0	add $r0.3 = $r0.58, $r0.3
	c0	ldw $r0.11 = 16[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $l0.0 = 20[$r0.1]   ## 4-byte Folded Reload
	c0	return $r0.1 = $r0.1, 24, $l0.0
$func_end4::
	.size	main, ($func_end4)-main


