	.text
	.file	"dft.ll"
	.globl	cast_uint32
	.align	2
	.type	cast_uint32,@function
cast_uint32::                           ## @cast_uint32
## BB#0:                                ## %if.end
	c0	add $r0.1 = $r0.1, -16
	c0	add $r0.58 = $r0.1, 8
	c0	stw 8[$r0.1] = $r0.3
	c0	or $r0.58 = $r0.58, 4
	c0	stw 0[$r0.58] = $r0.4
	c0	stw 4[$r0.1] = $r0.4
	c0	mov $r0.3 = $r0.4
	c0	return $r0.1 = $r0.1, 16, $l0.0
$func_end0::
	.size	cast_uint32, ($func_end0)-cast_uint32

	.globl	cast_int32
	.align	2
	.type	cast_int32,@function
cast_int32::                            ## @cast_int32
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -16
	c0	add $r0.59 = $r0.1, 8
	c0	or $r0.58 = $r0.59, 4
	c0	stw 8[$r0.1] = $r0.3
	c0	stw 0[$r0.58] = $r0.4
	c0	mov $r0.60 = 0
	c0	or $r0.59 = $r0.59, 3
	c0	stw 4[$r0.1] = $r0.60
	c0	ldbu $r0.59 = 0[$r0.59]
	c0	and $r0.59 = $r0.59, 128
	c0	cmpeq $b0.0 = $r0.59, 0
	c0	br $b0.0, LBB1_3
	c0	goto LBB1_1
LBB1_1::                                ## %if.then
	c0	ldw $r0.59 = 8[$r0.1]
	c0	cmpne $b0.0 = $r0.59, -1
	c0	br $b0.0, LBB1_5
	c0	goto LBB1_2
LBB1_2::                                ## %if.then2
	c0	ldw $r0.58 = 0[$r0.58]
	c0	stw 4[$r0.1] = $r0.58
	c0	goto LBB1_5
LBB1_3::                                ## %if.else3
	c0	ldw $r0.59 = 8[$r0.1]
	c0	cmpne $b0.0 = $r0.59, 0
	c0	br $b0.0, LBB1_5
	c0	goto LBB1_4
LBB1_4::                                ## %if.then6
	c0	ldw $r0.58 = 0[$r0.58]
	c0	stw 4[$r0.1] = $r0.58
LBB1_5::                                ## %if.end10
	c0	ldw $r0.3 = 4[$r0.1]
	c0	return $r0.1 = $r0.1, 16, $l0.0
$func_end1::
	.size	cast_int32, ($func_end1)-cast_int32

	.globl	cast
	.align	2
	.type	cast,@function
cast::                                  ## @cast
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -16
	c0	add $r0.58 = $r0.1, 0
	c0	stw 12[$r0.1] = $r0.4
	c0	or $r0.58 = $r0.58, 4
	c0	stw 0[$r0.58] = $r0.4
	c0	ldw $r0.59 = 12[$r0.1]
	c0	cmpgt $b0.0 = $r0.59, -1
	c0	br $b0.0, LBB2_2
	c0	goto LBB2_1
LBB2_1::                                ## %if.then
	c0	mov $r0.59 = -1
	c0	stw 0[$r0.1] = $r0.59
	c0	goto LBB2_3
LBB2_2::                                ## %if.else
	c0	mov $r0.59 = 0
	c0	stw 0[$r0.1] = $r0.59
LBB2_3::                                ## %if.end
	c0	ldw $r0.59 = 0[$r0.1]
	c0	stw 0[$r0.3] = $r0.59
	c0	ldw $r0.58 = 0[$r0.58]
	c0	stw 4[$r0.3] = $r0.58
	c0	return $r0.1 = $r0.1, 16, $l0.0
$func_end2::
	.size	cast, ($func_end2)-cast

	.globl	add
	.align	2
	.type	add,@function
add::                                   ## @add
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -56
	c0	stw 52[$r0.1] = $r0.7   ## 4-byte Folded Spill
	c0	stw 48[$r0.1] = $r0.6   ## 4-byte Folded Spill
	c0	add $r0.58 = $r0.1, 40
	c0	stw 40[$r0.1] = $r0.4
	c0	or $r0.58 = $r0.58, 4
	c0	stw 0[$r0.58] = $r0.5
	c0	add $r0.59 = $r0.1, 32
	c0	stw 32[$r0.1] = $r0.6
	c0	or $r0.59 = $r0.59, 4
	c0	stw 0[$r0.59] = $r0.7
	c0	mov $r0.60 = 0
	c0	ldw $r0.58 = 0[$r0.58]
	c0	stw 28[$r0.1] = $r0.58
	c0	ldw $r0.58 = 40[$r0.1]
	c0	stw 24[$r0.1] = $r0.58
	c0	ldw $r0.58 = 0[$r0.59]
	c0	stw 20[$r0.1] = $r0.58
	c0	ldw $r0.58 = 32[$r0.1]
	c0	stw 16[$r0.1] = $r0.58
	c0	stw 8[$r0.1] = $r0.60
	c0	stw 12[$r0.1] = $r0.60
	c0	ldw $r0.58 = 20[$r0.1]
	c0	ldw $r0.59 = 28[$r0.1]
	c0	add $r0.58 = $r0.59, $r0.58
	c0	stw 12[$r0.1] = $r0.58
	c0	ldw $r0.59 = 28[$r0.1]
	c0	cmpltu $b0.0 = $r0.58, $r0.59
	c0	br $b0.0, LBB3_2
	c0	goto LBB3_1
LBB3_1::                                ## %lor.lhs.false
	c0	ldw $r0.58 = 20[$r0.1]
	c0	ldw $r0.59 = 12[$r0.1]
	c0	cmpgeu $b0.0 = $r0.59, $r0.58
	c0	br $b0.0, LBB3_3
	c0	goto LBB3_2
LBB3_2::                                ## %if.then
	c0	ldw $r0.58 = 8[$r0.1]
	c0	add $r0.58 = $r0.58, 1
	c0	stw 8[$r0.1] = $r0.58
LBB3_3::                                ## %if.end
	c0	ldw $r0.58 = 16[$r0.1]
	c0	add $r0.59 = $r0.1, 0
	c0	ldw $r0.60 = 24[$r0.1]
	c0	or $r0.59 = $r0.59, 4
	c0	add $r0.58 = $r0.60, $r0.58
	c0	ldw $r0.60 = 8[$r0.1]
	c0	add $r0.58 = $r0.60, $r0.58
	c0	stw 8[$r0.1] = $r0.58
	c0	ldw $r0.58 = 12[$r0.1]
	c0	stw 0[$r0.59] = $r0.58
	c0	ldw $r0.58 = 8[$r0.1]
	c0	stw 0[$r0.1] = $r0.58
	c0	stw 0[$r0.3] = $r0.58
	c0	ldw $r0.58 = 0[$r0.59]
	c0	stw 4[$r0.3] = $r0.58
	c0	ldw $r0.6 = 48[$r0.1]   ## 4-byte Folded Reload
	c0	ldw $r0.7 = 52[$r0.1]   ## 4-byte Folded Reload
	c0	return $r0.1 = $r0.1, 56, $l0.0
$func_end3::
	.size	add, ($func_end3)-add

	.globl	neg
	.align	2
	.type	neg,@function
neg::                                   ## @neg
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -40
	c0	stw 36[$r0.1] = $l0.0   ## 4-byte Folded Spill
	c0	stw 32[$r0.1] = $r0.13  ## 4-byte Folded Spill
	c0	stw 28[$r0.1] = $r0.12  ## 4-byte Folded Spill
	c0	stw 24[$r0.1] = $r0.11  ## 4-byte Folded Spill
	c0	stw 20[$r0.1] = $r0.7   ## 4-byte Folded Spill
	c0	stw 16[$r0.1] = $r0.6   ## 4-byte Folded Spill
	c0	mov $r0.11 = $r0.3
	c0	add $r0.58 = $r0.1, 8
	c0	stw 8[$r0.1] = $r0.4
	c0	or $r0.12 = $r0.58, 4
	c0	xor $r0.58 = $r0.5, 1
	c0	add $r0.59 = $r0.1, 0
	c0	mov $r0.4 = 1
	c0	stw 0[$r0.12] = $r0.5
	c0	stw 0[$r0.12] = $r0.58
	c0	or $r0.13 = $r0.59, 4
	c0	ldw $r0.58 = 8[$r0.1]
	c0	xor $r0.58 = $r0.58, 1
	c0	stw 8[$r0.1] = $r0.58
	c0	mov $r0.3 = $r0.59
	c0	call $l0.0 = cast
	c0	ldw $r0.7 = 0[$r0.13]
	c0	ldw $r0.5 = 0[$r0.12]
	c0	ldw $r0.4 = 8[$r0.1]
	c0	ldw $r0.6 = 0[$r0.1]
	c0	mov $r0.3 = $r0.11
	c0	call $l0.0 = add
	c0	ldw $r0.6 = 16[$r0.1]   ## 4-byte Folded Reload
	c0	ldw $r0.7 = 20[$r0.1]   ## 4-byte Folded Reload
	c0	ldw $r0.11 = 24[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.12 = 28[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.13 = 32[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $l0.0 = 36[$r0.1]   ## 4-byte Folded Reload
	c0	return $r0.1 = $r0.1, 40, $l0.0
$func_end4::
	.size	neg, ($func_end4)-neg

	.globl	abs
	.align	2
	.type	abs,@function
abs::                                   ## @abs
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -8
	c0	stw 0[$r0.1] = $r0.3
	c0	cmpgt $b0.0 = $r0.3, -1
	c0	br $b0.0, LBB5_2
	c0	goto LBB5_1
LBB5_1::                                ## %if.then
	c0	ldw $r0.58 = 0[$r0.1]
	c0	mov $r0.59 = 0
	c0	sub $r0.58 = $r0.59, $r0.58
	c0	stw 4[$r0.1] = $r0.58
	c0	goto LBB5_3
LBB5_2::                                ## %if.else
	c0	ldw $r0.58 = 0[$r0.1]
	c0	stw 4[$r0.1] = $r0.58
LBB5_3::                                ## %return
	c0	ldw $r0.3 = 4[$r0.1]
	c0	return $r0.1 = $r0.1, 8, $l0.0
$func_end5::
	.size	abs, ($func_end5)-abs

	.globl	ucast
	.align	2
	.type	ucast,@function
ucast::                                 ## @ucast
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -16
	c0	add $r0.58 = $r0.1, 0
	c0	stw 12[$r0.1] = $r0.4
	c0	or $r0.58 = $r0.58, 4
	c0	mov $r0.59 = 0
	c0	stw 0[$r0.58] = $r0.4
	c0	stw 0[$r0.1] = $r0.59
	c0	ldw $r0.58 = 0[$r0.58]
	c0	stw 0[$r0.3] = $r0.59
	c0	stw 4[$r0.3] = $r0.58
	c0	return $r0.1 = $r0.1, 16, $l0.0
$func_end6::
	.size	ucast, ($func_end6)-ucast

	.globl	sll
	.align	2
	.type	sll,@function
sll::                                   ## @sll
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -24
	c0	stw 20[$r0.1] = $r0.6   ## 4-byte Folded Spill
	c0	add $r0.58 = $r0.1, 8
	c0	stw 8[$r0.1] = $r0.4
	c0	or $r0.58 = $r0.58, 4
	c0	stw 0[$r0.58] = $r0.5
	c0	stb 4[$r0.1] = $r0.6
	c0	mov $r0.59 = 0
	c0	stw 0[$r0.1] = $r0.59
	c0	ldbu $r0.60 = 4[$r0.1]
	c0	cmpgt $b0.0 = $r0.60, 31
	c0	br $b0.0, LBB7_2
	c0	goto LBB7_1
LBB7_1::                                ## %if.then
	c0	ldw $r0.59 = 8[$r0.1]
	c0	mov $r0.60 = 32
	c0	ldbu $r0.61 = 4[$r0.1]
	c0	shl $r0.59 = $r0.59, $r0.61
	c0	stw 8[$r0.1] = $r0.59
	c0	ldbu $r0.59 = 4[$r0.1]
	c0	sub $r0.59 = $r0.60, $r0.59
	c0	ldw $r0.60 = 0[$r0.58]
	c0	shru $r0.59 = $r0.60, $r0.59
	c0	stw 0[$r0.1] = $r0.59
	c0	ldw $r0.60 = 8[$r0.1]
	c0	or $r0.59 = $r0.60, $r0.59
	c0	stw 8[$r0.1] = $r0.59
	c0	ldw $r0.59 = 0[$r0.58]
	c0	ldbu $r0.60 = 4[$r0.1]
	c0	shl $r0.59 = $r0.59, $r0.60
	c0	stw 0[$r0.58] = $r0.59
	c0	goto LBB7_3
LBB7_2::                                ## %if.else
	c0	ldbu $r0.60 = 4[$r0.1]
	c0	add $r0.60 = $r0.60, -32
	c0	ldw $r0.61 = 0[$r0.58]
	c0	shl $r0.60 = $r0.61, $r0.60
	c0	stw 8[$r0.1] = $r0.60
	c0	stw 0[$r0.58] = $r0.59
LBB7_3::                                ## %if.end
	c0	ldw $r0.59 = 8[$r0.1]
	c0	stw 0[$r0.3] = $r0.59
	c0	ldw $r0.58 = 0[$r0.58]
	c0	stw 4[$r0.3] = $r0.58
	c0	ldw $r0.6 = 20[$r0.1]   ## 4-byte Folded Reload
	c0	return $r0.1 = $r0.1, 24, $l0.0
$func_end7::
	.size	sll, ($func_end7)-sll

	.globl	sra
	.align	2
	.type	sra,@function
sra::                                   ## @sra
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -24
	c0	stw 20[$r0.1] = $r0.6   ## 4-byte Folded Spill
	c0	add $r0.58 = $r0.1, 8
	c0	stw 8[$r0.1] = $r0.4
	c0	or $r0.58 = $r0.58, 4
	c0	stw 0[$r0.58] = $r0.5
	c0	stb 4[$r0.1] = $r0.6
	c0	mov $r0.59 = 0
	c0	stw 0[$r0.1] = $r0.59
	c0	ldbu $r0.59 = 4[$r0.1]
	c0	cmpgt $b0.0 = $r0.59, 31
	c0	br $b0.0, LBB8_2
	c0	goto LBB8_1
LBB8_1::                                ## %if.then
	c0	ldbu $r0.59 = 4[$r0.1]
	c0	mov $r0.60 = 32
	c0	ldw $r0.61 = 0[$r0.58]
	c0	shru $r0.59 = $r0.61, $r0.59
	c0	stw 0[$r0.58] = $r0.59
	c0	ldbu $r0.59 = 4[$r0.1]
	c0	sub $r0.59 = $r0.60, $r0.59
	c0	ldw $r0.60 = 8[$r0.1]
	c0	shl $r0.59 = $r0.60, $r0.59
	c0	stw 0[$r0.1] = $r0.59
	c0	ldw $r0.60 = 0[$r0.58]
	c0	or $r0.59 = $r0.60, $r0.59
	c0	stw 0[$r0.58] = $r0.59
	c0	ldbu $r0.59 = 4[$r0.1]
	c0	ldw $r0.60 = 8[$r0.1]
	c0	shr $r0.59 = $r0.60, $r0.59
	c0	stw 8[$r0.1] = $r0.59
	c0	goto LBB8_3
LBB8_2::                                ## %if.else
	c0	ldbu $r0.59 = 4[$r0.1]
	c0	mov $r0.60 = -1
	c0	add $r0.59 = $r0.59, -32
	c0	ldw $r0.61 = 8[$r0.1]
	c0	shr $r0.59 = $r0.61, $r0.59
	c0	stw 0[$r0.58] = $r0.59
	c0	stw 8[$r0.1] = $r0.60
LBB8_3::                                ## %if.end
	c0	ldw $r0.59 = 8[$r0.1]
	c0	stw 0[$r0.3] = $r0.59
	c0	ldw $r0.58 = 0[$r0.58]
	c0	stw 4[$r0.3] = $r0.58
	c0	ldw $r0.6 = 20[$r0.1]   ## 4-byte Folded Reload
	c0	return $r0.1 = $r0.1, 24, $l0.0
$func_end8::
	.size	sra, ($func_end8)-sra

	.globl	umult
	.align	2
	.type	umult,@function
umult::                                 ## @umult
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -216
	c0	stw 212[$r0.1] = $l0.0  ## 4-byte Folded Spill
	c0	stw 208[$r0.1] = $r0.28 ## 4-byte Folded Spill
	c0	stw 204[$r0.1] = $r0.27 ## 4-byte Folded Spill
	c0	stw 200[$r0.1] = $r0.26 ## 4-byte Folded Spill
	c0	stw 196[$r0.1] = $r0.25 ## 4-byte Folded Spill
	c0	stw 192[$r0.1] = $r0.24 ## 4-byte Folded Spill
	c0	stw 188[$r0.1] = $r0.23 ## 4-byte Folded Spill
	c0	stw 184[$r0.1] = $r0.22 ## 4-byte Folded Spill
	c0	stw 180[$r0.1] = $r0.21 ## 4-byte Folded Spill
	c0	stw 176[$r0.1] = $r0.20 ## 4-byte Folded Spill
	c0	stw 172[$r0.1] = $r0.19 ## 4-byte Folded Spill
	c0	stw 168[$r0.1] = $r0.18 ## 4-byte Folded Spill
	c0	stw 164[$r0.1] = $r0.17 ## 4-byte Folded Spill
	c0	stw 160[$r0.1] = $r0.16 ## 4-byte Folded Spill
	c0	stw 156[$r0.1] = $r0.15 ## 4-byte Folded Spill
	c0	stw 152[$r0.1] = $r0.14 ## 4-byte Folded Spill
	c0	stw 148[$r0.1] = $r0.13 ## 4-byte Folded Spill
	c0	stw 144[$r0.1] = $r0.12 ## 4-byte Folded Spill
	c0	stw 140[$r0.1] = $r0.11 ## 4-byte Folded Spill
	c0	stw 136[$r0.1] = $r0.7  ## 4-byte Folded Spill
	c0	stw 132[$r0.1] = $r0.6  ## 4-byte Folded Spill
	c0	mov $r0.11 = $r0.3
	c0	stw 128[$r0.1] = $r0.4
	c0	stw 124[$r0.1] = $r0.5
	c0	add $r0.58 = $r0.1, 128
	c0	add $r0.59 = $r0.1, 124
	c0	add $r0.60 = $r0.1, 72
	c0	ldhu $r0.61 = 128[$r0.1]
	c0	or $r0.58 = $r0.58, 2
	c0	or $r0.59 = $r0.59, 2
	c0	add $r0.62 = $r0.1, 80
	c0	stw 120[$r0.1] = $r0.61
	c0	or $r0.13 = $r0.60, 4
	c0	or $r0.12 = $r0.62, 4
	c0	add $r0.14 = $r0.1, 56
	c0	ldhu $r0.58 = 0[$r0.58]
	c0	or $r0.15 = $r0.14, 4
	c0	mov $r0.16 = 16
	c0	add $r0.17 = $r0.1, 64
	c0	stw 116[$r0.1] = $r0.58
	c0	or $r0.18 = $r0.17, 4
	c0	add $r0.19 = $r0.1, 48
	c0	add $r0.20 = $r0.1, 32
	c0	ldhu $r0.58 = 124[$r0.1]
	c0	or $r0.21 = $r0.19, 4
	c0	or $r0.22 = $r0.20, 4
	c0	add $r0.23 = $r0.1, 40
	c0	stw 112[$r0.1] = $r0.58
	c0	or $r0.24 = $r0.23, 4
	c0	add $r0.25 = $r0.1, 24
	c0	ldhu $r0.58 = 0[$r0.59]
	c0	or $r0.26 = $r0.25, 4
	c0	stw 108[$r0.1] = $r0.58
	c0	ldw $r0.58 = 112[$r0.1]
	c0	ldw $r0.59 = 120[$r0.1]
	c0	mpyhs $r0.61 = $r0.59, $r0.58
	c0	mpylu $r0.58 = $r0.59, $r0.58
	c0	add $r0.58 = $r0.58, $r0.61
	c0	stw 104[$r0.1] = $r0.58
	c0	ldw $r0.58 = 108[$r0.1]
	c0	ldw $r0.59 = 120[$r0.1]
	c0	mpyhs $r0.61 = $r0.59, $r0.58
	c0	mpylu $r0.58 = $r0.59, $r0.58
	c0	add $r0.58 = $r0.58, $r0.61
	c0	stw 100[$r0.1] = $r0.58
	c0	add $r0.27 = $r0.1, 8
	c0	ldw $r0.58 = 116[$r0.1]
	c0	or $r0.28 = $r0.27, 4
	c0	ldw $r0.59 = 112[$r0.1]
	c0	mpyhs $r0.61 = $r0.58, $r0.59
	c0	mpylu $r0.58 = $r0.58, $r0.59
	c0	add $r0.58 = $r0.58, $r0.61
	c0	stw 96[$r0.1] = $r0.58
	c0	ldw $r0.58 = 108[$r0.1]
	c0	ldw $r0.59 = 116[$r0.1]
	c0	mpyhs $r0.61 = $r0.59, $r0.58
	c0	mpylu $r0.58 = $r0.59, $r0.58
	c0	add $r0.58 = $r0.58, $r0.61
	c0	stw 92[$r0.1] = $r0.58
	c0	ldw $r0.4 = 104[$r0.1]
	c0	mov $r0.3 = $r0.60
	c0	call $l0.0 = ucast
	c0	ldw $r0.58 = 0[$r0.13]
	c0	stw 0[$r0.12] = $r0.58
	c0	ldw $r0.58 = 72[$r0.1]
	c0	stw 80[$r0.1] = $r0.58
	c0	ldw $r0.4 = 100[$r0.1]
	c0	mov $r0.3 = $r0.14
	c0	call $l0.0 = ucast
	c0	ldw $r0.5 = 0[$r0.15]
	c0	mov $r0.13 = 32
	c0	add $r0.14 = $r0.1, 16
	c0	ldw $r0.4 = 56[$r0.1]
	c0	mov $r0.3 = $r0.17
	c0	mov $r0.6 = $r0.16
	c0	call $l0.0 = sll
	c0	ldw $r0.7 = 0[$r0.18]
	c0	or $r0.15 = $r0.14, 4
	c0	ldw $r0.5 = 0[$r0.12]
	c0	ldw $r0.4 = 80[$r0.1]
	c0	ldw $r0.6 = 64[$r0.1]
	c0	mov $r0.3 = $r0.19
	c0	call $l0.0 = add
	c0	ldw $r0.58 = 0[$r0.21]
	c0	stw 0[$r0.12] = $r0.58
	c0	ldw $r0.58 = 48[$r0.1]
	c0	stw 80[$r0.1] = $r0.58
	c0	ldw $r0.4 = 96[$r0.1]
	c0	mov $r0.3 = $r0.20
	c0	call $l0.0 = ucast
	c0	ldw $r0.5 = 0[$r0.22]
	c0	add $r0.17 = $r0.1, 0
	c0	ldw $r0.4 = 32[$r0.1]
	c0	mov $r0.3 = $r0.23
	c0	mov $r0.6 = $r0.16
	c0	call $l0.0 = sll
	c0	ldw $r0.7 = 0[$r0.24]
	c0	or $r0.16 = $r0.17, 4
	c0	ldw $r0.5 = 0[$r0.12]
	c0	ldw $r0.4 = 80[$r0.1]
	c0	ldw $r0.6 = 40[$r0.1]
	c0	mov $r0.3 = $r0.25
	c0	call $l0.0 = add
	c0	ldw $r0.58 = 0[$r0.26]
	c0	stw 0[$r0.12] = $r0.58
	c0	ldw $r0.58 = 24[$r0.1]
	c0	stw 80[$r0.1] = $r0.58
	c0	ldw $r0.4 = 92[$r0.1]
	c0	mov $r0.3 = $r0.27
	c0	call $l0.0 = ucast
	c0	ldw $r0.5 = 0[$r0.28]
	c0	ldw $r0.4 = 8[$r0.1]
	c0	mov $r0.3 = $r0.14
	c0	mov $r0.6 = $r0.13
	c0	call $l0.0 = sll
	c0	ldw $r0.7 = 0[$r0.15]
	c0	ldw $r0.5 = 0[$r0.12]
	c0	ldw $r0.6 = 16[$r0.1]
	c0	ldw $r0.4 = 80[$r0.1]
	c0	mov $r0.3 = $r0.17
	c0	call $l0.0 = add
	c0	ldw $r0.58 = 0[$r0.16]
	c0	stw 0[$r0.12] = $r0.58
	c0	ldw $r0.58 = 0[$r0.1]
	c0	stw 80[$r0.1] = $r0.58
	c0	ldw $r0.58 = 0[$r0.12]
	c0	stw 4[$r0.11] = $r0.58
	c0	ldw $r0.58 = 80[$r0.1]
	c0	stw 0[$r0.11] = $r0.58
	c0	ldw $r0.6 = 132[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.7 = 136[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.11 = 140[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.12 = 144[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.13 = 148[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.14 = 152[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.15 = 156[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.16 = 160[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.17 = 164[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.18 = 168[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.19 = 172[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.20 = 176[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.21 = 180[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.22 = 184[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.23 = 188[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.24 = 192[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.25 = 196[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.26 = 200[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.27 = 204[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.28 = 208[$r0.1] ## 4-byte Folded Reload
	c0	ldw $l0.0 = 212[$r0.1]  ## 4-byte Folded Reload
	c0	return $r0.1 = $r0.1, 216, $l0.0
$func_end9::
	.size	umult, ($func_end9)-umult

	.globl	mult
	.align	2
	.type	mult,@function
mult::                                  ## @mult
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -72
	c0	stw 68[$r0.1] = $l0.0   ## 4-byte Folded Spill
	c0	stw 64[$r0.1] = $r0.14  ## 4-byte Folded Spill
	c0	stw 60[$r0.1] = $r0.13  ## 4-byte Folded Spill
	c0	stw 56[$r0.1] = $r0.12  ## 4-byte Folded Spill
	c0	stw 52[$r0.1] = $r0.11  ## 4-byte Folded Spill
	c0	mov $r0.11 = $r0.3
	c0	stw 48[$r0.1] = $r0.4
	c0	stw 44[$r0.1] = $r0.5
	c0	mov $r0.58 = 0
	c0	mov $r0.59 = 31
	c0	add $r0.13 = $r0.1, 8
	c0	stw 20[$r0.1] = $r0.58
	c0	add $r0.58 = $r0.1, 32
	c0	or $r0.14 = $r0.13, 4
	c0	ldw $r0.60 = 48[$r0.1]
	c0	ldw $r0.61 = 44[$r0.1]
	c0	xor $r0.60 = $r0.60, $r0.61
	c0	shru $r0.59 = $r0.60, $r0.59
	c0	stw 20[$r0.1] = $r0.59
	c0	or $r0.12 = $r0.58, 4
	c0	ldw $r0.3 = 48[$r0.1]
	c0	call $l0.0 = abs
	c0	stw 28[$r0.1] = $r0.3
	c0	ldw $r0.3 = 44[$r0.1]
	c0	call $l0.0 = abs
	c0	mov $r0.58 = $r0.3
	c0	stw 24[$r0.1] = $r0.58
	c0	ldw $r0.4 = 28[$r0.1]
	c0	mov $r0.3 = $r0.13
	c0	mov $r0.5 = $r0.58
	c0	call $l0.0 = umult
	c0	ldw $r0.58 = 0[$r0.14]
	c0	stw 0[$r0.12] = $r0.58
	c0	ldw $r0.58 = 8[$r0.1]
	c0	stw 32[$r0.1] = $r0.58
	c0	ldw $r0.58 = 20[$r0.1]
	c0	cmpeq $b0.0 = $r0.58, 0
	c0	br $b0.0, LBB10_2
	c0	goto LBB10_1
LBB10_1::                               ## %if.then
	c0	ldw $r0.4 = 32[$r0.1]
	c0	add $r0.58 = $r0.1, 0
	c0	or $r0.13 = $r0.58, 4
	c0	ldw $r0.5 = 0[$r0.12]
	c0	mov $r0.3 = $r0.58
	c0	call $l0.0 = neg
	c0	ldw $r0.58 = 0[$r0.13]
	c0	stw 0[$r0.12] = $r0.58
	c0	ldw $r0.58 = 0[$r0.1]
	c0	stw 32[$r0.1] = $r0.58
LBB10_2::                               ## %if.end
	c0	ldw $r0.58 = 32[$r0.1]
	c0	stw 0[$r0.11] = $r0.58
	c0	ldw $r0.58 = 0[$r0.12]
	c0	stw 4[$r0.11] = $r0.58
	c0	ldw $r0.11 = 52[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.12 = 56[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.13 = 60[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.14 = 64[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $l0.0 = 68[$r0.1]   ## 4-byte Folded Reload
	c0	return $r0.1 = $r0.1, 72, $l0.0
$func_end10::
	.size	mult, ($func_end10)-mult

	.globl	sum_rot_block_row
	.align	2
	.type	sum_rot_block_row,@function
sum_rot_block_row::                     ## @sum_rot_block_row
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -192
	c0	stw 188[$r0.1] = $l0.0  ## 4-byte Folded Spill
	c0	stw 184[$r0.1] = $r0.34 ## 4-byte Folded Spill
	c0	stw 180[$r0.1] = $r0.33 ## 4-byte Folded Spill
	c0	stw 176[$r0.1] = $r0.32 ## 4-byte Folded Spill
	c0	stw 172[$r0.1] = $r0.31 ## 4-byte Folded Spill
	c0	stw 168[$r0.1] = $r0.30 ## 4-byte Folded Spill
	c0	stw 164[$r0.1] = $r0.29 ## 4-byte Folded Spill
	c0	stw 160[$r0.1] = $r0.28 ## 4-byte Folded Spill
	c0	stw 156[$r0.1] = $r0.27 ## 4-byte Folded Spill
	c0	stw 152[$r0.1] = $r0.26 ## 4-byte Folded Spill
	c0	stw 148[$r0.1] = $r0.25 ## 4-byte Folded Spill
	c0	stw 144[$r0.1] = $r0.24 ## 4-byte Folded Spill
	c0	stw 140[$r0.1] = $r0.23 ## 4-byte Folded Spill
	c0	stw 136[$r0.1] = $r0.22 ## 4-byte Folded Spill
	c0	stw 132[$r0.1] = $r0.21 ## 4-byte Folded Spill
	c0	stw 128[$r0.1] = $r0.20 ## 4-byte Folded Spill
	c0	stw 124[$r0.1] = $r0.19 ## 4-byte Folded Spill
	c0	stw 120[$r0.1] = $r0.18 ## 4-byte Folded Spill
	c0	stw 116[$r0.1] = $r0.17 ## 4-byte Folded Spill
	c0	stw 112[$r0.1] = $r0.16 ## 4-byte Folded Spill
	c0	stw 108[$r0.1] = $r0.15 ## 4-byte Folded Spill
	c0	stw 104[$r0.1] = $r0.14 ## 4-byte Folded Spill
	c0	stw 100[$r0.1] = $r0.13 ## 4-byte Folded Spill
	c0	stw 96[$r0.1] = $r0.12  ## 4-byte Folded Spill
	c0	stw 92[$r0.1] = $r0.11  ## 4-byte Folded Spill
	c0	stw 88[$r0.1] = $r0.6   ## 4-byte Folded Spill
	c0	stw 84[$r0.1] = $r0.3
	c0	mov $r0.11 = 0
	c0	stw 76[$r0.1] = $r0.11
	c0	mov $r0.12 = dft_waves_cos
	c0	mov $r0.13 = rowsums
	c0	add $r0.14 = $r0.1, 48
	c0	mov $r0.15 = 17
	c0	or $r0.16 = $r0.14, 4
	c0	add $r0.17 = $r0.1, 56
	c0	mov $r0.18 = dft_waves_sin
	c0	or $r0.19 = $r0.17, 4
	c0	add $r0.20 = $r0.1, 32
	c0	or $r0.21 = $r0.20, 4
	c0	add $r0.22 = $r0.1, 40
	c0	or $r0.23 = $r0.22, 4
	c0	mov $r0.24 = 12
	c0	add $r0.25 = $r0.1, 16
	c0	or $r0.26 = $r0.25, 4
	c0	add $r0.27 = $r0.1, 24
	c0	mov $r0.28 = 5
	c0	or $r0.29 = $r0.27, 4
	c0	add $r0.30 = $r0.1, 0
	c0	or $r0.31 = $r0.30, 4
	c0	add $r0.32 = $r0.1, 8
	c0	or $r0.33 = $r0.32, 4
LBB11_1::                               ## %for.cond
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB11_3 Depth 2
	c0	ldw $r0.58 = 76[$r0.1]
	c0	cmpgt $b0.0 = $r0.58, 3
	c0	br $b0.0, LBB11_6
	c0	goto LBB11_2
LBB11_2::                               ## %for.body
                                        ##   in Loop: Header=BB11_1 Depth=1
	c0	stw 72[$r0.1] = $r0.11
	c0	stw 68[$r0.1] = $r0.11
	c0	stw 80[$r0.1] = $r0.11
LBB11_3::                               ## %for.cond1
                                        ##   Parent Loop BB11_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldw $r0.58 = 80[$r0.1]
	c0	cmpgt $b0.0 = $r0.58, 23
	c0	br $b0.0, LBB11_5
	c0	goto LBB11_4
LBB11_4::                               ## %for.inc
                                        ##   in Loop: Header=BB11_3 Depth=2
	c0	ldw $r0.58 = 76[$r0.1]
	c0	mpylu $r0.59 = $r0.58, 24
	c0	ldw $r0.60 = 80[$r0.1]
	c0	mpyhs $r0.58 = $r0.58, 24
	c0	sh2add $r0.61 = $r0.60, $r0.13
	c0	add $r0.58 = $r0.59, $r0.58
	c0	ldw $r0.59 = 0[$r0.61]
	c0	add $r0.58 = $r0.60, $r0.58
	c0	shl $r0.4 = $r0.59, $r0.15
	c0	sh2add $r0.58 = $r0.58, $r0.12
	c0	ldw $r0.5 = 0[$r0.58]
	c0	mov $r0.3 = $r0.14
	c0	call $l0.0 = mult
	c0	ldw $r0.5 = 0[$r0.16]
	c0	ldw $r0.4 = 48[$r0.1]
	c0	mov $r0.3 = $r0.17
	c0	mov $r0.6 = $r0.15
	c0	call $l0.0 = sra
	c0	ldw $r0.4 = 0[$r0.19]
	c0	ldw $r0.3 = 56[$r0.1]
	c0	call $l0.0 = cast_int32
	c0	ldw $r0.58 = 72[$r0.1]
	c0	add $r0.58 = $r0.58, $r0.3
	c0	stw 72[$r0.1] = $r0.58
	c0	ldw $r0.58 = 76[$r0.1]
	c0	mpyhs $r0.59 = $r0.58, 24
	c0	ldw $r0.60 = 80[$r0.1]
	c0	sh2add $r0.61 = $r0.60, $r0.13
	c0	mpylu $r0.58 = $r0.58, 24
	c0	add $r0.58 = $r0.58, $r0.59
	c0	ldw $r0.59 = 0[$r0.61]
	c0	add $r0.58 = $r0.60, $r0.58
	c0	shl $r0.4 = $r0.59, $r0.15
	c0	sh2add $r0.58 = $r0.58, $r0.18
	c0	ldw $r0.5 = 0[$r0.58]
	c0	mov $r0.3 = $r0.20
	c0	call $l0.0 = mult
	c0	ldw $r0.5 = 0[$r0.21]
	c0	ldw $r0.4 = 32[$r0.1]
	c0	mov $r0.3 = $r0.22
	c0	mov $r0.6 = $r0.15
	c0	call $l0.0 = sra
	c0	ldw $r0.4 = 0[$r0.23]
	c0	ldw $r0.3 = 40[$r0.1]
	c0	call $l0.0 = cast_int32
	c0	ldw $r0.58 = 68[$r0.1]
	c0	add $r0.58 = $r0.58, $r0.3
	c0	stw 68[$r0.1] = $r0.58
	c0	ldw $r0.58 = 80[$r0.1]
	c0	add $r0.58 = $r0.58, 1
	c0	stw 80[$r0.1] = $r0.58
	c0	goto LBB11_3
LBB11_5::                               ## %for.inc28
                                        ##   in Loop: Header=BB11_1 Depth=1
	c0	ldw $r0.58 = 72[$r0.1]
	c0	shr $r0.58 = $r0.58, $r0.24
	c0	mov $r0.3 = $r0.25
	c0	mov $r0.4 = $r0.58
	c0	mov $r0.5 = $r0.58
	c0	call $l0.0 = mult
	c0	ldw $r0.4 = 16[$r0.1]
	c0	ldw $r0.5 = 0[$r0.26]
	c0	mov $r0.3 = $r0.27
	c0	mov $r0.6 = $r0.28
	c0	call $l0.0 = sra
	c0	ldw $r0.3 = 24[$r0.1]
	c0	ldw $r0.4 = 0[$r0.29]
	c0	call $l0.0 = cast_int32
	c0	mov $r0.34 = $r0.3
	c0	ldw $r0.58 = 68[$r0.1]
	c0	shr $r0.58 = $r0.58, $r0.24
	c0	mov $r0.3 = $r0.30
	c0	mov $r0.4 = $r0.58
	c0	mov $r0.5 = $r0.58
	c0	call $l0.0 = mult
	c0	ldw $r0.5 = 0[$r0.31]
	c0	ldw $r0.4 = 0[$r0.1]
	c0	mov $r0.3 = $r0.32
	c0	mov $r0.6 = $r0.28
	c0	call $l0.0 = sra
	c0	ldw $r0.4 = 0[$r0.33]
	c0	ldw $r0.3 = 8[$r0.1]
	c0	call $l0.0 = cast_int32
	c0	ldw $r0.58 = 76[$r0.1]
	c0	add $r0.59 = $r0.34, $r0.3
	c0	mpyhs $r0.60 = $r0.58, 96
	c0	ldw $r0.61 = 84[$r0.1]
	c0	mpylu $r0.58 = $r0.58, 96
	c0	add $r0.58 = $r0.58, $r0.60
	c0	add $r0.58 = $r0.61, $r0.58
	c0	stw 0[$r0.58] = $r0.59
	c0	ldw $r0.58 = 76[$r0.1]
	c0	add $r0.58 = $r0.58, 1
	c0	stw 76[$r0.1] = $r0.58
	c0	goto LBB11_1
LBB11_6::                               ## %for.end30
	c0	ldw $r0.6 = 88[$r0.1]   ## 4-byte Folded Reload
	c0	ldw $r0.11 = 92[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.12 = 96[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.13 = 100[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.14 = 104[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.15 = 108[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.16 = 112[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.17 = 116[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.18 = 120[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.19 = 124[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.20 = 128[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.21 = 132[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.22 = 136[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.23 = 140[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.24 = 144[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.25 = 148[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.26 = 152[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.27 = 156[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.28 = 160[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.29 = 164[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.30 = 168[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.31 = 172[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.32 = 176[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.33 = 180[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.34 = 184[$r0.1] ## 4-byte Folded Reload
	c0	ldw $l0.0 = 188[$r0.1]  ## 4-byte Folded Reload
	c0	return $r0.1 = $r0.1, 192, $l0.0
$func_end11::
	.size	sum_rot_block_row, ($func_end11)-sum_rot_block_row

	.globl	main
	.align	2
	.type	main,@function
main::                                  ## @main
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -24
	c0	stw 20[$r0.1] = $l0.0   ## 4-byte Folded Spill
	c0	stw 16[$r0.1] = $r0.12  ## 4-byte Folded Spill
	c0	stw 12[$r0.1] = $r0.11  ## 4-byte Folded Spill
	c0	mov $r0.12 = 0
	c0	stw 8[$r0.1] = $r0.12
	c0	stw 4[$r0.1] = $r0.12
	c0	mov $r0.11 = powers
LBB12_1::                               ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.58 = 4[$r0.1]
	c0	cmpgt $b0.0 = $r0.58, 199
	c0	br $b0.0, LBB12_3
	c0	goto LBB12_2
LBB12_2::                               ## %for.inc
                                        ##   in Loop: Header=BB12_1 Depth=1
	c0	mov $r0.3 = $r0.11
	c0	call $l0.0 = sum_rot_block_row
	c0	ldw $r0.58 = 4[$r0.1]
	c0	add $r0.58 = $r0.58, 1
	c0	stw 4[$r0.1] = $r0.58
	c0	goto LBB12_1
LBB12_3::                               ## %for.end
	c0	stw 4[$r0.1] = $r0.12
	c0	mov $r0.58 = powers_temp
LBB12_4::                               ## %for.cond1
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.59 = 4[$r0.1]
	c0	cmpgt $b0.0 = $r0.59, 3
	c0	br $b0.0, LBB12_8
	c0	goto LBB12_5
LBB12_5::                               ## %for.body3
                                        ##   in Loop: Header=BB12_4 Depth=1
	c0	ldw $r0.59 = 4[$r0.1]
	c0	mpylu $r0.60 = $r0.59, 96
	c0	mpyhs $r0.59 = $r0.59, 96
	c0	add $r0.59 = $r0.60, $r0.59
	c0	add $r0.60 = $r0.58, $r0.59
	c0	add $r0.59 = $r0.11, $r0.59
	c0	ldw $r0.60 = 0[$r0.60]
	c0	ldw $r0.59 = 0[$r0.59]
	c0	cmpeq $b0.0 = $r0.59, $r0.60
	c0	br $b0.0, LBB12_7
	c0	goto LBB12_6
LBB12_7::                               ## %for.inc8
                                        ##   in Loop: Header=BB12_4 Depth=1
	c0	ldw $r0.59 = 4[$r0.1]
	c0	add $r0.59 = $r0.59, 1
	c0	stw 4[$r0.1] = $r0.59
	c0	goto LBB12_4
LBB12_6::                               ## %if.then
	c0	ldw $r0.58 = 4[$r0.1]
	c0	mpyhs $r0.59 = $r0.58, 100
	c0	mpylu $r0.58 = $r0.58, 100
	c0	add $r0.58 = $r0.58, $r0.59
	c0	stw 8[$r0.1] = $r0.58
	c0	goto LBB12_9
LBB12_8::                               ## %for.end10
	c0	mov $r0.58 = -1
	c0	stw 8[$r0.1] = $r0.58
LBB12_9::                               ## %return
	c0	ldw $r0.3 = 8[$r0.1]
	c0	ldw $r0.11 = 12[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.12 = 16[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $l0.0 = 20[$r0.1]   ## 4-byte Folded Reload
	c0	return $r0.1 = $r0.1, 24, $l0.0
$func_end12::
	.size	main, ($func_end12)-main

	.type	rowsums,@object         ## @rowsums
	.section .data
	.globl	rowsums
	.align	2
rowsums::
	.data4	759                     ## 0x2f7
	.data4	776                     ## 0x308
	.data4	787                     ## 0x313
	.data4	795                     ## 0x31b
	.data4	797                     ## 0x31d
	.data4	796                     ## 0x31c
	.data4	801                     ## 0x321
	.data4	805                     ## 0x325
	.data4	800                     ## 0x320
	.data4	800                     ## 0x320
	.data4	799                     ## 0x31f
	.data4	801                     ## 0x321
	.data4	799                     ## 0x31f
	.data4	790                     ## 0x316
	.data4	781                     ## 0x30d
	.data4	775                     ## 0x307
	.data4	772                     ## 0x304
	.data4	769                     ## 0x301
	.data4	768                     ## 0x300
	.data4	767                     ## 0x2ff
	.data4	762                     ## 0x2fa
	.data4	761                     ## 0x2f9
	.data4	755                     ## 0x2f3
	.data4	751                     ## 0x2ef
	.size	rowsums, 96

	.type	powers,@object          ## @powers
	.bss
	.globl	powers
	.align	2
powers::
	.zero	384
	.size	powers, 384

	.type	powers_temp,@object     ## @powers_temp
	.data
	.globl	powers_temp
	.align	2
powers_temp::
	.data4	2436991                 ## 0x252f7f
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	63546                   ## 0xf83a
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	131381                  ## 0x20135
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	19272                   ## 0x4b48
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.size	powers_temp, 384

	.type	dft_waves_cos,@object   ## @dft_waves_cos
	.globl	dft_waves_cos
	.align	2
dft_waves_cos::
	.data4	131072                  ## 0x20000
	.data4	126606                  ## 0x1ee8e
	.data4	113512                  ## 0x1bb68
	.data4	92683                   ## 0x16a0b
	.data4	65537                   ## 0x10001
	.data4	33926                   ## 0x8486
	.data4	3                       ## 0x3
	.data4	4294933375              ## 0xffff7b7f
	.data4	4294901764              ## 0xffff0004
	.data4	4294874617              ## 0xfffe95f9
	.data4	4294853787              ## 0xfffe449b
	.data4	4294840691              ## 0xfffe1173
	.data4	4294836224              ## 0xfffe0000
	.data4	4294840688              ## 0xfffe1170
	.data4	4294853780              ## 0xfffe4494
	.data4	4294874607              ## 0xfffe95ef
	.data4	4294901752              ## 0xfffefff8
	.data4	4294933362              ## 0xffff7b72
	.data4	4294967285              ## 0xfffffff5
	.data4	33913                   ## 0x8479
	.data4	65526                   ## 0xfff6
	.data4	92673                   ## 0x16a01
	.data4	113505                  ## 0x1bb61
	.data4	126602                  ## 0x1ee8a
	.data4	131072                  ## 0x20000
	.data4	113512                  ## 0x1bb68
	.data4	65537                   ## 0x10001
	.data4	3                       ## 0x3
	.data4	4294901764              ## 0xffff0004
	.data4	4294853787              ## 0xfffe449b
	.data4	4294836224              ## 0xfffe0000
	.data4	4294853780              ## 0xfffe4494
	.data4	4294901752              ## 0xfffefff8
	.data4	4294967285              ## 0xfffffff5
	.data4	65526                   ## 0xfff6
	.data4	113505                  ## 0x1bb61
	.data4	131072                  ## 0x20000
	.data4	113518                  ## 0x1bb6e
	.data4	65549                   ## 0x1000d
	.data4	16                      ## 0x10
	.data4	4294901775              ## 0xffff000f
	.data4	4294853793              ## 0xfffe44a1
	.data4	4294836224              ## 0xfffe0000
	.data4	4294853773              ## 0xfffe448d
	.data4	4294901740              ## 0xfffeffec
	.data4	4294967272              ## 0xffffffe8
	.data4	65514                   ## 0xffea
	.data4	113499                  ## 0x1bb5b
	.data4	131072                  ## 0x20000
	.data4	92683                   ## 0x16a0b
	.data4	3                       ## 0x3
	.data4	4294874617              ## 0xfffe95f9
	.data4	4294836224              ## 0xfffe0000
	.data4	4294874607              ## 0xfffe95ef
	.data4	4294967285              ## 0xfffffff5
	.data4	92673                   ## 0x16a01
	.data4	131072                  ## 0x20000
	.data4	92692                   ## 0x16a14
	.data4	16                      ## 0x10
	.data4	4294874627              ## 0xfffe9603
	.data4	4294836224              ## 0xfffe0000
	.data4	4294874598              ## 0xfffe95e6
	.data4	4294967272              ## 0xffffffe8
	.data4	92664                   ## 0x169f8
	.data4	131071                  ## 0x1ffff
	.data4	92701                   ## 0x16a1d
	.data4	29                      ## 0x1d
	.data4	4294874636              ## 0xfffe960c
	.data4	4294836224              ## 0xfffe0000
	.data4	4294874589              ## 0xfffe95dd
	.data4	4294967259              ## 0xffffffdb
	.data4	92654                   ## 0x169ee
	.data4	131072                  ## 0x20000
	.data4	65537                   ## 0x10001
	.data4	4294901764              ## 0xffff0004
	.data4	4294836224              ## 0xfffe0000
	.data4	4294901752              ## 0xfffefff8
	.data4	65526                   ## 0xfff6
	.data4	131072                  ## 0x20000
	.data4	65549                   ## 0x1000d
	.data4	4294901775              ## 0xffff000f
	.data4	4294836224              ## 0xfffe0000
	.data4	4294901740              ## 0xfffeffec
	.data4	65514                   ## 0xffea
	.data4	131071                  ## 0x1ffff
	.data4	65560                   ## 0x10018
	.data4	4294901786              ## 0xffff001a
	.data4	4294836224              ## 0xfffe0000
	.data4	4294901729              ## 0xfffeffe1
	.data4	65503                   ## 0xffdf
	.data4	131071                  ## 0x1ffff
	.data4	65571                   ## 0x10023
	.data4	4294901797              ## 0xffff0025
	.data4	4294836224              ## 0xfffe0000
	.data4	4294901718              ## 0xfffeffd6
	.data4	65492                   ## 0xffd4
	.size	dft_waves_cos, 384

	.type	dft_waves_sin,@object   ## @dft_waves_sin
	.globl	dft_waves_sin
	.align	2
dft_waves_sin::
	.data4	0                       ## 0x0
	.data4	33923                   ## 0x8483
	.data4	65535                   ## 0xffff
	.data4	92680                   ## 0x16a08
	.data4	113510                  ## 0x1bb66
	.data4	126605                  ## 0x1ee8d
	.data4	131071                  ## 0x1ffff
	.data4	126606                  ## 0x1ee8e
	.data4	113514                  ## 0x1bb6a
	.data4	92685                   ## 0x16a0d
	.data4	65540                   ## 0x10004
	.data4	33929                   ## 0x8489
	.data4	6                       ## 0x6
	.data4	4294933379              ## 0xffff7b83
	.data4	4294901766              ## 0xffff0006
	.data4	4294874620              ## 0xfffe95fc
	.data4	4294853788              ## 0xfffe449c
	.data4	4294840692              ## 0xfffe1174
	.data4	4294836224              ## 0xfffe0000
	.data4	4294840687              ## 0xfffe116f
	.data4	4294853778              ## 0xfffe4492
	.data4	4294874605              ## 0xfffe95ed
	.data4	4294901749              ## 0xfffefff5
	.data4	4294933359              ## 0xffff7b6f
	.data4	0                       ## 0x0
	.data4	65535                   ## 0xffff
	.data4	113510                  ## 0x1bb66
	.data4	131071                  ## 0x1ffff
	.data4	113514                  ## 0x1bb6a
	.data4	65540                   ## 0x10004
	.data4	6                       ## 0x6
	.data4	4294901766              ## 0xffff0006
	.data4	4294853788              ## 0xfffe449c
	.data4	4294836224              ## 0xfffe0000
	.data4	4294853778              ## 0xfffe4492
	.data4	4294901749              ## 0xfffefff5
	.data4	4294967282              ## 0xfffffff2
	.data4	65523                   ## 0xfff3
	.data4	113504                  ## 0x1bb60
	.data4	131071                  ## 0x1ffff
	.data4	113520                  ## 0x1bb70
	.data4	65552                   ## 0x10010
	.data4	19                      ## 0x13
	.data4	4294901778              ## 0xffff0012
	.data4	4294853795              ## 0xfffe44a3
	.data4	4294836224              ## 0xfffe0000
	.data4	4294853772              ## 0xfffe448c
	.data4	4294901738              ## 0xfffeffea
	.data4	0                       ## 0x0
	.data4	92680                   ## 0x16a08
	.data4	131071                  ## 0x1ffff
	.data4	92685                   ## 0x16a0d
	.data4	6                       ## 0x6
	.data4	4294874620              ## 0xfffe95fc
	.data4	4294836224              ## 0xfffe0000
	.data4	4294874605              ## 0xfffe95ed
	.data4	4294967282              ## 0xfffffff2
	.data4	92671                   ## 0x169ff
	.data4	131071                  ## 0x1ffff
	.data4	92694                   ## 0x16a16
	.data4	19                      ## 0x13
	.data4	4294874629              ## 0xfffe9605
	.data4	4294836224              ## 0xfffe0000
	.data4	4294874596              ## 0xfffe95e4
	.data4	4294967269              ## 0xffffffe5
	.data4	92662                   ## 0x169f6
	.data4	131071                  ## 0x1ffff
	.data4	92704                   ## 0x16a20
	.data4	32                      ## 0x20
	.data4	4294874638              ## 0xfffe960e
	.data4	4294836224              ## 0xfffe0000
	.data4	4294874587              ## 0xfffe95db
	.data4	0                       ## 0x0
	.data4	113510                  ## 0x1bb66
	.data4	113514                  ## 0x1bb6a
	.data4	6                       ## 0x6
	.data4	4294853788              ## 0xfffe449c
	.data4	4294853778              ## 0xfffe4492
	.data4	4294967282              ## 0xfffffff2
	.data4	113504                  ## 0x1bb60
	.data4	113520                  ## 0x1bb70
	.data4	19                      ## 0x13
	.data4	4294853795              ## 0xfffe44a3
	.data4	4294853772              ## 0xfffe448c
	.data4	4294967269              ## 0xffffffe5
	.data4	113497                  ## 0x1bb59
	.data4	113527                  ## 0x1bb77
	.data4	32                      ## 0x20
	.data4	4294853801              ## 0xfffe44a9
	.data4	4294853765              ## 0xfffe4485
	.data4	4294967256              ## 0xffffffd8
	.data4	113491                  ## 0x1bb53
	.data4	113533                  ## 0x1bb7d
	.data4	45                      ## 0x2d
	.data4	4294853808              ## 0xfffe44b0
	.data4	4294853759              ## 0xfffe447f
	.size	dft_waves_sin, 384


