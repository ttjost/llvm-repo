.section .text

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @fir_original
fir_original::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $l0.0
	c0	cmplt $b0.0 = $r0.5, 1
;;
	c0	br $b0.0, LBB0_11
;;
## BB#1:                                ## %for.cond1.preheader.lr.ph
	c0	cmplt $b0.0 = $r0.6, 1
;;
	c0	br $b0.0, LBB0_3
;;
## BB#2:                                ## %for.body3.lr.ph.us.preheader
	c0	sh2add $r0.11 = $r0.6, $r0.3
	c0	and $r0.12 = $r0.6, -8
;;
	c0	add $r0.13 = $r0.11, -12
	c0	add $r0.14 = $r0.4, 16
	c0	mov $r0.15 = 0
	c0	cmpne $b0.0 = $r0.6, 0
	c0	mov $r0.16 = 2
	c0	cmpeq $b0.1 = $r0.12, 0
;;
	c0	mov $r0.19 = $r0.15
;;
LBB0_6::                                ## %for.body3.lr.ph.us
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_9 Depth 2
                                        ##     Child Loop BB0_5 Depth 2
	c0	mov $r0.17 = $r0.19
	c0	mov $r0.18 = $r0.15
	c0	mov $r0.29 = $r0.15
	c0	brf $b0.0, LBB0_7
;;
## BB#8:                                ## %overflow.checked
                                        ##   in Loop: Header=BB0_6 Depth=1
	c0	mov $r0.28 = $r0.14
	c0	mov $r0.27 = $r0.13
	c0	mov $r0.26 = $r0.12
	c0	mov $r0.18 = $r0.15
	c0	mov $r0.19 = $r0.15
	c0	mov $r0.20 = $r0.15
	c0	mov $r0.21 = $r0.15
	c0	mov $r0.22 = $r0.15
;;
	c0	mov $r0.23 = $r0.15
	c0	mov $r0.24 = $r0.15
	c0	mov $r0.25 = $r0.15
	c0	mov $r0.29 = $r0.15
	c0	br $b0.1, LBB0_10
;;
LBB0_9::                                ## %vector.body
                                        ##   Parent Loop BB0_6 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldw $r0.29 = 8[$r0.28]
;;
	c0	ldw $r0.30 = -8[$r0.27]
;;
	c0	ldw $r0.31 = -12[$r0.27]
;;
	c0	mpyhs $r0.32 = $r0.31, $r0.29
	c0	mpylu $r0.29 = $r0.31, $r0.29
	c0	ldw $r0.31 = 4[$r0.28]
;;
	c0	mpylu $r0.33 = $r0.30, $r0.31
	c0	mpyhs $r0.30 = $r0.30, $r0.31
	c0	add $r0.29 = $r0.29, $r0.32
	c0	ldw $r0.31 = -4[$r0.27]
;;
	c0	ldw $r0.32 = 0[$r0.28]
	c0	add $r0.30 = $r0.33, $r0.30
	c0	add $r0.24 = $r0.29, $r0.24
;;
	c0	mpylu $r0.29 = $r0.31, $r0.32
	c0	mpyhs $r0.31 = $r0.31, $r0.32
	c0	ldw $r0.32 = 0[$r0.27]
	c0	add $r0.23 = $r0.30, $r0.23
;;
	c0	add $r0.29 = $r0.29, $r0.31
	c0	ldw $r0.30 = 8[$r0.27]
	c0	add $r0.31 = $r0.28, 32
	c0	add $r0.33 = $r0.27, -32
	c0	add $r0.26 = $r0.26, -8
;;
	c0	add $r0.22 = $r0.29, $r0.22
	c0	ldw $r0.29 = -4[$r0.28]
;;
	c0	mpyhs $r0.34 = $r0.32, $r0.29
	c0	mpylu $r0.29 = $r0.32, $r0.29
	c0	ldw $r0.32 = 12[$r0.28]
;;
	c0	add $r0.29 = $r0.29, $r0.34
	c0	ldw $r0.34 = -16[$r0.27]
;;
	c0	mpyhs $r0.35 = $r0.34, $r0.32
	c0	mpylu $r0.32 = $r0.34, $r0.32
	c0	ldw $r0.34 = -12[$r0.28]
	c0	add $r0.21 = $r0.29, $r0.21
;;
	c0	mpylu $r0.29 = $r0.30, $r0.34
	c0	mpyhs $r0.30 = $r0.30, $r0.34
	c0	add $r0.32 = $r0.32, $r0.35
	c0	ldw $r0.34 = -16[$r0.28]
;;
	c0	add $r0.29 = $r0.29, $r0.30
	c0	ldw $r0.30 = 12[$r0.27]
	c0	add $r0.25 = $r0.32, $r0.25
;;
	c0	mpylu $r0.32 = $r0.30, $r0.34
	c0	mpyhs $r0.30 = $r0.30, $r0.34
	c0	ldw $r0.28 = -8[$r0.28]
	c0	add $r0.19 = $r0.29, $r0.19
;;
	c0	add $r0.29 = $r0.32, $r0.30
	c0	ldw $r0.27 = 4[$r0.27]
;;
	c0	mpyhs $r0.30 = $r0.27, $r0.28
	c0	mpylu $r0.27 = $r0.27, $r0.28
	c0	add $r0.18 = $r0.29, $r0.18
;;
	c0	add $r0.27 = $r0.27, $r0.30
;;
	c0	add $r0.20 = $r0.27, $r0.20
	c0	cmpne $b0.2 = $r0.26, 0
	c0	mov $r0.28 = $r0.31
	c0	mov $r0.27 = $r0.33
	c0	mov $r0.29 = $r0.12
;;
	c0	br $b0.2, LBB0_9
;;
LBB0_10::                               ## %middle.block
                                        ##   in Loop: Header=BB0_6 Depth=1
	c0	add $r0.18 = $r0.22, $r0.18
	c0	add $r0.19 = $r0.23, $r0.19
	c0	add $r0.20 = $r0.24, $r0.20
	c0	add $r0.21 = $r0.25, $r0.21
;;
	c0	add $r0.18 = $r0.18, $r0.20
	c0	add $r0.19 = $r0.19, $r0.21
;;
	c0	add $r0.18 = $r0.18, $r0.19
	c0	cmpeq $b0.2 = $r0.29, $r0.6
;;
	c0	br $b0.2, LBB0_4
;;
LBB0_7::                                ## %for.body3.us.preheader
                                        ##   in Loop: Header=BB0_6 Depth=1
	c0	shl $r0.20 = $r0.29, $r0.16
	c0	sh2add $r0.19 = $r0.29, $r0.4
;;
	c0	sub $r0.20 = $r0.11, $r0.20
	c0	sub $r0.21 = $r0.6, $r0.29
;;
LBB0_5::                                ## %for.body3.us
                                        ##   Parent Loop BB0_6 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldw $r0.22 = 0[$r0.19]
;;
	c0	ldw $r0.23 = 0[$r0.20]
;;
	c0	mpylu $r0.24 = $r0.23, $r0.22
	c0	mpyhs $r0.22 = $r0.23, $r0.22
	c0	add $r0.19 = $r0.19, 4
	c0	add $r0.20 = $r0.20, -4
	c0	add $r0.21 = $r0.21, -1
;;
	c0	add $r0.22 = $r0.24, $r0.22
;;
	c0	add $r0.18 = $r0.22, $r0.18
	c0	cmpeq $b0.2 = $r0.21, 0
;;
	c0	brf $b0.2, LBB0_5
;;
LBB0_4::                                ## %for.end.us
                                        ##   in Loop: Header=BB0_6 Depth=1
	c0	add $r0.13 = $r0.13, 4
	c0	add $r0.11 = $r0.11, 4
	c0	add $r0.19 = $r0.17, 1
	c0	sh2add $r0.17 = $r0.17, $r0.7
;;
	c0	cmpeq $b0.2 = $r0.19, $r0.5
	c0	stw 0[$r0.17] = $r0.18
;;
	c0	br $b0.2, LBB0_11
;;
	c0	goto LBB0_6
;;
LBB0_3::                                ## %for.cond1.preheader.lr.ph.for.cond1.preheader.lr.ph.split_crit_edge
	c0	mov $r0.11 = 2
;;
	c0	shl $r0.5 = $r0.5, $r0.11
	c0	mov $r0.4 = 0
	c0	mov $r0.3 = $r0.7
;;
LBB0_11::                               ## %for.end9
	c0	ldw $l0.0 = 28[$r0.1]
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @main
main::
## BB#0:                                ## %entry
	c0	mov $r0.27 = c
	c0	mov $r0.11 = 0
;;
	c0	ldw $r0.12 = 56[$r0.27]
;;
	c0	ldw $r0.13 = 52[$r0.27]
;;
	c0	ldw $r0.14 = 48[$r0.27]
;;
	c0	ldw $r0.15 = 44[$r0.27]
;;
	c0	ldw $r0.16 = 40[$r0.27]
;;
	c0	ldw $r0.17 = 36[$r0.27]
;;
	c0	ldw $r0.18 = 32[$r0.27]
;;
	c0	ldw $r0.19 = 28[$r0.27]
;;
	c0	ldw $r0.20 = 24[$r0.27]
;;
	c0	ldw $r0.21 = 20[$r0.27]
;;
	c0	ldw $r0.22 = 16[$r0.27]
;;
	c0	ldw $r0.23 = 12[$r0.27]
;;
	c0	ldw $r0.24 = 8[$r0.27]
;;
	c0	ldw $r0.25 = 60[$r0.27]
;;
	c0	ldw $r0.26 = 0[$r0.27]
;;
	c0	ldw $r0.27 = 4[$r0.27]
	c0	mov $r0.28 = $r0.11
;;
LBB1_1::                                ## %vector.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	mov $r0.29 = x
;;
	c0	add $r0.29 = $r0.29, $r0.28
;;
	c0	ldw $r0.30 = 76[$r0.29]
;;
	c0	mpyhs $r0.31 = $r0.30, $r0.26
	c0	mpylu $r0.30 = $r0.30, $r0.26
	c0	ldw $r0.32 = 72[$r0.29]
;;
	c0	mpylu $r0.33 = $r0.32, $r0.27
	c0	mpyhs $r0.34 = $r0.32, $r0.26
	c0	mpyhs $r0.35 = $r0.32, $r0.27
	c0	mpylu $r0.32 = $r0.32, $r0.26
	c0	add $r0.30 = $r0.30, $r0.31
;;
	c0	add $r0.31 = $r0.32, $r0.34
	c0	add $r0.32 = $r0.33, $r0.35
;;
	c0	add $r0.30 = $r0.32, $r0.30
	c0	ldw $r0.32 = 68[$r0.29]
;;
	c0	mpyhs $r0.33 = $r0.32, $r0.27
	c0	mpylu $r0.34 = $r0.32, $r0.26
	c0	mpylu $r0.35 = $r0.32, $r0.27
	c0	mpyhs $r0.36 = $r0.32, $r0.26
	c0	mpylu $r0.37 = $r0.32, $r0.24
	c0	mpyhs $r0.32 = $r0.32, $r0.24
;;
	c0	add $r0.34 = $r0.34, $r0.36
	c0	add $r0.33 = $r0.35, $r0.33
	c0	add $r0.32 = $r0.37, $r0.32
;;
	c0	add $r0.31 = $r0.33, $r0.31
	c0	add $r0.30 = $r0.32, $r0.30
	c0	ldw $r0.32 = 64[$r0.29]
;;
	c0	mpylu $r0.33 = $r0.32, $r0.26
	c0	mpylu $r0.35 = $r0.32, $r0.27
	c0	mpyhs $r0.36 = $r0.32, $r0.26
	c0	mpyhs $r0.37 = $r0.32, $r0.27
	c0	mpyhs $r0.38 = $r0.32, $r0.24
	c0	mpylu $r0.39 = $r0.32, $r0.24
	c0	ldw $r0.40 = 60[$r0.29]
;;
	c0	mpylu $r0.41 = $r0.40, $r0.27
	c0	mpyhs $r0.42 = $r0.40, $r0.27
	c0	mpyhs $r0.43 = $r0.40, $r0.24
	c0	add $r0.35 = $r0.35, $r0.37
	c0	mpylu $r0.37 = $r0.40, $r0.24
	c0	add $r0.33 = $r0.33, $r0.36
	c0	mpylu $r0.36 = $r0.32, $r0.23
	c0	add $r0.38 = $r0.39, $r0.38
;;
	c0	add $r0.39 = $r0.41, $r0.42
	c0	mpyhs $r0.32 = $r0.32, $r0.23
	c0	mpylu $r0.41 = $r0.40, $r0.23
	c0	add $r0.34 = $r0.35, $r0.34
	c0	mpyhs $r0.35 = $r0.40, $r0.23
	c0	add $r0.37 = $r0.37, $r0.43
	c0	add $r0.31 = $r0.38, $r0.31
;;
	c0	add $r0.33 = $r0.39, $r0.33
	c0	add $r0.34 = $r0.37, $r0.34
	c0	mpyhs $r0.37 = $r0.40, $r0.22
	c0	add $r0.32 = $r0.36, $r0.32
	c0	mpylu $r0.36 = $r0.40, $r0.22
	c0	add $r0.35 = $r0.41, $r0.35
	c0	ldw $r0.38 = 56[$r0.29]
;;
	c0	mpylu $r0.39 = $r0.38, $r0.24
	c0	mpyhs $r0.40 = $r0.38, $r0.24
	c0	mpyhs $r0.41 = $r0.38, $r0.23
	c0	mpylu $r0.42 = $r0.38, $r0.23
	c0	mpylu $r0.43 = $r0.38, $r0.22
	c0	mpyhs $r0.44 = $r0.38, $r0.22
	c0	add $r0.31 = $r0.35, $r0.31
	c0	add $r0.30 = $r0.32, $r0.30
;;
	c0	add $r0.32 = $r0.39, $r0.40
	c0	add $r0.35 = $r0.42, $r0.41
	c0	add $r0.39 = $r0.43, $r0.44
	c0	add $r0.36 = $r0.36, $r0.37
;;
	c0	add $r0.32 = $r0.32, $r0.33
	c0	add $r0.33 = $r0.35, $r0.34
	c0	add $r0.30 = $r0.36, $r0.30
	c0	add $r0.31 = $r0.39, $r0.31
	c0	mpyhs $r0.34 = $r0.38, $r0.21
	c0	mpylu $r0.35 = $r0.38, $r0.21
	c0	ldw $r0.36 = 52[$r0.29]
;;
	c0	mpylu $r0.37 = $r0.36, $r0.23
	c0	mpyhs $r0.38 = $r0.36, $r0.23
	c0	mpyhs $r0.39 = $r0.36, $r0.22
	c0	mpylu $r0.40 = $r0.36, $r0.22
	c0	mpylu $r0.41 = $r0.36, $r0.21
	c0	mpyhs $r0.42 = $r0.36, $r0.21
	c0	add $r0.34 = $r0.35, $r0.34
;;
	c0	add $r0.35 = $r0.37, $r0.38
	c0	add $r0.37 = $r0.40, $r0.39
	c0	add $r0.38 = $r0.41, $r0.42
	c0	add $r0.30 = $r0.34, $r0.30
;;
	c0	add $r0.32 = $r0.35, $r0.32
	c0	mpylu $r0.34 = $r0.36, $r0.20
	c0	add $r0.33 = $r0.37, $r0.33
	c0	mpyhs $r0.35 = $r0.36, $r0.20
	c0	add $r0.31 = $r0.38, $r0.31
	c0	ldw $r0.36 = 48[$r0.29]
;;
	c0	mpylu $r0.37 = $r0.36, $r0.22
	c0	mpyhs $r0.38 = $r0.36, $r0.22
	c0	mpyhs $r0.39 = $r0.36, $r0.21
	c0	mpylu $r0.40 = $r0.36, $r0.21
	c0	mpylu $r0.41 = $r0.36, $r0.20
	c0	mpyhs $r0.42 = $r0.36, $r0.20
	c0	add $r0.34 = $r0.34, $r0.35
;;
	c0	add $r0.35 = $r0.37, $r0.38
	c0	add $r0.37 = $r0.40, $r0.39
	c0	add $r0.38 = $r0.41, $r0.42
	c0	add $r0.30 = $r0.34, $r0.30
;;
	c0	add $r0.32 = $r0.35, $r0.32
	c0	add $r0.33 = $r0.37, $r0.33
	c0	add $r0.31 = $r0.38, $r0.31
	c0	mpyhs $r0.34 = $r0.36, $r0.19
	c0	mpylu $r0.35 = $r0.36, $r0.19
	c0	ldw $r0.36 = 44[$r0.29]
;;
	c0	mpylu $r0.37 = $r0.36, $r0.21
	c0	mpyhs $r0.38 = $r0.36, $r0.21
	c0	mpyhs $r0.39 = $r0.36, $r0.20
	c0	mpylu $r0.40 = $r0.36, $r0.20
	c0	mpylu $r0.41 = $r0.36, $r0.19
	c0	mpyhs $r0.42 = $r0.36, $r0.19
	c0	add $r0.34 = $r0.35, $r0.34
;;
	c0	add $r0.35 = $r0.37, $r0.38
	c0	add $r0.37 = $r0.40, $r0.39
	c0	add $r0.38 = $r0.41, $r0.42
	c0	add $r0.30 = $r0.34, $r0.30
;;
	c0	add $r0.32 = $r0.35, $r0.32
	c0	add $r0.33 = $r0.37, $r0.33
	c0	add $r0.31 = $r0.38, $r0.31
	c0	mpyhs $r0.34 = $r0.36, $r0.18
	c0	mpylu $r0.35 = $r0.36, $r0.18
	c0	ldw $r0.36 = 40[$r0.29]
;;
	c0	mpylu $r0.37 = $r0.36, $r0.20
	c0	mpyhs $r0.38 = $r0.36, $r0.20
	c0	mpyhs $r0.39 = $r0.36, $r0.19
	c0	mpylu $r0.40 = $r0.36, $r0.19
	c0	mpylu $r0.41 = $r0.36, $r0.18
	c0	mpyhs $r0.42 = $r0.36, $r0.18
	c0	add $r0.34 = $r0.35, $r0.34
;;
	c0	add $r0.35 = $r0.37, $r0.38
	c0	add $r0.37 = $r0.40, $r0.39
	c0	add $r0.38 = $r0.41, $r0.42
	c0	add $r0.30 = $r0.34, $r0.30
;;
	c0	add $r0.32 = $r0.35, $r0.32
	c0	add $r0.33 = $r0.37, $r0.33
	c0	add $r0.31 = $r0.38, $r0.31
	c0	mpyhs $r0.34 = $r0.36, $r0.17
	c0	mpylu $r0.35 = $r0.36, $r0.17
	c0	ldw $r0.36 = 36[$r0.29]
;;
	c0	mpylu $r0.37 = $r0.36, $r0.19
	c0	mpyhs $r0.38 = $r0.36, $r0.19
	c0	mpyhs $r0.39 = $r0.36, $r0.18
	c0	mpylu $r0.40 = $r0.36, $r0.18
	c0	mpylu $r0.41 = $r0.36, $r0.17
	c0	mpyhs $r0.42 = $r0.36, $r0.17
	c0	add $r0.34 = $r0.35, $r0.34
;;
	c0	add $r0.35 = $r0.37, $r0.38
	c0	add $r0.37 = $r0.40, $r0.39
	c0	add $r0.38 = $r0.41, $r0.42
	c0	add $r0.30 = $r0.34, $r0.30
;;
	c0	add $r0.32 = $r0.35, $r0.32
	c0	add $r0.33 = $r0.37, $r0.33
	c0	add $r0.31 = $r0.38, $r0.31
	c0	mpyhs $r0.34 = $r0.36, $r0.16
	c0	mpylu $r0.35 = $r0.36, $r0.16
	c0	ldw $r0.36 = 32[$r0.29]
;;
	c0	mpylu $r0.37 = $r0.36, $r0.18
	c0	mpyhs $r0.38 = $r0.36, $r0.18
	c0	mpyhs $r0.39 = $r0.36, $r0.17
	c0	mpylu $r0.40 = $r0.36, $r0.17
	c0	mpylu $r0.41 = $r0.36, $r0.16
	c0	mpyhs $r0.42 = $r0.36, $r0.16
	c0	add $r0.34 = $r0.35, $r0.34
;;
	c0	add $r0.35 = $r0.37, $r0.38
	c0	add $r0.37 = $r0.40, $r0.39
	c0	add $r0.38 = $r0.41, $r0.42
	c0	add $r0.30 = $r0.34, $r0.30
;;
	c0	add $r0.32 = $r0.35, $r0.32
	c0	add $r0.33 = $r0.37, $r0.33
	c0	add $r0.31 = $r0.38, $r0.31
	c0	mpyhs $r0.34 = $r0.36, $r0.15
	c0	mpylu $r0.35 = $r0.36, $r0.15
	c0	ldw $r0.36 = 28[$r0.29]
;;
	c0	mpylu $r0.37 = $r0.36, $r0.17
	c0	mpyhs $r0.38 = $r0.36, $r0.17
	c0	mpyhs $r0.39 = $r0.36, $r0.16
	c0	mpylu $r0.40 = $r0.36, $r0.16
	c0	mpylu $r0.41 = $r0.36, $r0.15
	c0	mpyhs $r0.42 = $r0.36, $r0.15
	c0	add $r0.34 = $r0.35, $r0.34
;;
	c0	add $r0.35 = $r0.37, $r0.38
	c0	add $r0.37 = $r0.40, $r0.39
	c0	add $r0.38 = $r0.41, $r0.42
	c0	add $r0.30 = $r0.34, $r0.30
;;
	c0	add $r0.32 = $r0.35, $r0.32
	c0	add $r0.33 = $r0.37, $r0.33
	c0	add $r0.31 = $r0.38, $r0.31
	c0	mpyhs $r0.34 = $r0.36, $r0.14
	c0	mpylu $r0.35 = $r0.36, $r0.14
	c0	ldw $r0.36 = 24[$r0.29]
;;
	c0	mpylu $r0.37 = $r0.36, $r0.16
	c0	mpyhs $r0.38 = $r0.36, $r0.16
	c0	mpyhs $r0.39 = $r0.36, $r0.15
	c0	mpylu $r0.40 = $r0.36, $r0.15
	c0	mpylu $r0.41 = $r0.36, $r0.14
	c0	mpyhs $r0.42 = $r0.36, $r0.14
	c0	add $r0.34 = $r0.35, $r0.34
;;
	c0	add $r0.35 = $r0.37, $r0.38
	c0	add $r0.37 = $r0.40, $r0.39
	c0	add $r0.38 = $r0.41, $r0.42
	c0	add $r0.30 = $r0.34, $r0.30
;;
	c0	add $r0.32 = $r0.35, $r0.32
	c0	add $r0.33 = $r0.37, $r0.33
	c0	mpyhs $r0.34 = $r0.36, $r0.13
	c0	mpylu $r0.35 = $r0.36, $r0.13
	c0	add $r0.31 = $r0.38, $r0.31
	c0	ldw $r0.36 = 20[$r0.29]
;;
	c0	mpylu $r0.37 = $r0.36, $r0.15
	c0	mpyhs $r0.38 = $r0.36, $r0.15
	c0	mpyhs $r0.39 = $r0.36, $r0.14
	c0	mpylu $r0.40 = $r0.36, $r0.14
	c0	mpylu $r0.41 = $r0.36, $r0.13
	c0	mpyhs $r0.42 = $r0.36, $r0.13
	c0	add $r0.34 = $r0.35, $r0.34
;;
	c0	add $r0.35 = $r0.37, $r0.38
	c0	add $r0.37 = $r0.40, $r0.39
	c0	add $r0.38 = $r0.41, $r0.42
	c0	mpylu $r0.39 = $r0.36, $r0.12
	c0	mpyhs $r0.36 = $r0.36, $r0.12
	c0	add $r0.30 = $r0.34, $r0.30
	c0	ldw $r0.34 = 4[$r0.29]
;;
	c0	add $r0.32 = $r0.35, $r0.32
	c0	add $r0.33 = $r0.37, $r0.33
	c0	add $r0.35 = $r0.39, $r0.36
	c0	mpylu $r0.36 = $r0.34, $r0.25
	c0	add $r0.31 = $r0.38, $r0.31
	c0	mpyhs $r0.34 = $r0.34, $r0.25
	c0	ldw $r0.37 = 12[$r0.29]
;;
	c0	mpylu $r0.38 = $r0.37, $r0.13
	c0	mpyhs $r0.39 = $r0.37, $r0.13
	c0	mpyhs $r0.40 = $r0.37, $r0.12
	c0	mpylu $r0.41 = $r0.37, $r0.12
	c0	mpyhs $r0.42 = $r0.37, $r0.25
	c0	mpylu $r0.37 = $r0.37, $r0.25
	c0	add $r0.34 = $r0.36, $r0.34
	c0	add $r0.35 = $r0.35, $r0.30
;;
	c0	add $r0.36 = $r0.38, $r0.39
	c0	add $r0.38 = $r0.41, $r0.40
	c0	add $r0.37 = $r0.37, $r0.42
	c0	ldw $r0.39 = 8[$r0.29]
	c0	mov $r0.30 = y
;;
	c0	mpylu $r0.40 = $r0.39, $r0.12
	c0	mpyhs $r0.41 = $r0.39, $r0.12
	c0	mpylu $r0.42 = $r0.39, $r0.25
	c0	mpyhs $r0.39 = $r0.39, $r0.25
	c0	ldw $r0.29 = 16[$r0.29]
;;
	c0	mpylu $r0.43 = $r0.29, $r0.14
	c0	mpyhs $r0.44 = $r0.29, $r0.14
	c0	mpylu $r0.45 = $r0.29, $r0.13
	c0	mpyhs $r0.46 = $r0.29, $r0.13
	c0	mpyhs $r0.47 = $r0.29, $r0.12
	c0	mpylu $r0.48 = $r0.29, $r0.12
	c0	add $r0.40 = $r0.40, $r0.41
	c0	add $r0.39 = $r0.42, $r0.39
;;
	c0	add $r0.41 = $r0.43, $r0.44
	c0	add $r0.42 = $r0.45, $r0.46
	c0	add $r0.43 = $r0.48, $r0.47
	c0	mpyhs $r0.44 = $r0.29, $r0.25
	c0	mpylu $r0.29 = $r0.29, $r0.25
	c0	add $r0.45 = $r0.30, $r0.28
;;
	c0	add $r0.32 = $r0.41, $r0.32
	c0	add $r0.33 = $r0.42, $r0.33
	c0	add $r0.31 = $r0.43, $r0.31
	c0	add $r0.29 = $r0.29, $r0.44
;;
	c0	add $r0.32 = $r0.36, $r0.32
	c0	add $r0.33 = $r0.38, $r0.33
	c0	add $r0.35 = $r0.29, $r0.35
	c0	add $r0.31 = $r0.37, $r0.31
	c0	add $r0.28 = $r0.28, 16
	c0	mov $r0.29 = y_ref
;;
	c0	add $r0.32 = $r0.40, $r0.32
	c0	add $r0.33 = $r0.39, $r0.33
;;
	c0	add $r0.32 = $r0.34, $r0.32
	c0	stw 12[$r0.45] = $r0.35
;;
	c0	stw 8[$r0.45] = $r0.31
;;
	c0	stw 4[$r0.45] = $r0.33
;;
	c0	stw 0[$r0.45] = $r0.32
	c0	cmpne $b0.0 = $r0.28, 1088
;;
	c0	br $b0.0, LBB1_1
;;
LBB1_2::                                ## %for.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.12 = 0[$r0.29]
;;
	c0	ldw $r0.13 = 0[$r0.30]
;;
	c0	cmpeq $b0.0 = $r0.13, $r0.12
;;
	c0	brf $b0.0, LBB1_3
;;
## BB#4:                                ## %for.inc
                                        ##   in Loop: Header=BB1_2 Depth=1
	c0	add $r0.11 = $r0.11, 1
	c0	add $r0.30 = $r0.30, 4
	c0	add $r0.29 = $r0.29, 4
	c0	mov $r0.12 = -1
;;
	c0	cmplt $b0.0 = $r0.11, 256
;;
	c0	br $b0.0, LBB1_2
;;
	c0	goto LBB1_5
;;
LBB1_3::                                ## %if.then
	c0	add $r0.12 = $r0.11, 10
;;
LBB1_5::                                ## %return
.return ret($r0.3:s32)
	c0	mov $r0.3 = $r0.12
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .data

	.align	4                       ## @c
c::
	.data4	2                       ## 0x2
	.data4	4                       ## 0x4
	.data4	4                       ## 0x4
	.data4	2                       ## 0x2
	.data4	4                       ## 0x4
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	4                       ## 0x4
	.data4	2                       ## 0x2
	.data4	4                       ## 0x4
	.data4	4                       ## 0x4
	.data4	2                       ## 0x2
	.data4	4                       ## 0x4
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	4                       ## 0x4

	.align	4                       ## @x
x::
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
	.data4	3139482720              ## 0xbb20b460
	.data4	3571011896              ## 0xd4d95138
	.data4	1033096058              ## 0x3d93cb7a
	.data4	2604232894              ## 0x9b3970be
	.data4	2737687030              ## 0xa32dc9f6
	.data4	1327362106              ## 0x4f1df03a
	.data4	2364108983              ## 0x8ce970b7
	.data4	502539523               ## 0x1df42503
	.data4	2566437438              ## 0x98f8ba3e
	.data4	3356665709              ## 0xc812a76d
	.data4	1431162155              ## 0x554dcd2b
	.data4	1085665355              ## 0x40b5f04b
	.data4	1654374947              ## 0x629bc223
	.data4	2632968525              ## 0x9cefe94d
	.data4	4229862191              ## 0xfc1e932f
	.data4	4221177688              ## 0xfb9a0f58
	.data4	3776060168              ## 0xe1121b08
	.data4	99135751                ## 0x5e8b107
	.data4	4042634482              ## 0xf0f5b4f2
	.data4	755814641               ## 0x2d0cd0f1
	.data4	1180918287              ## 0x4663620f
	.data4	1344049776              ## 0x501c9270
	.data4	553609048               ## 0x20ff6758
	.data4	1580443894              ## 0x5e33a8f6
	.data4	629649304               ## 0x2587af98
	.data4	3028702520              ## 0xb4865538
	.data4	99807007                ## 0x5f2ef1f
	.data4	5955764                 ## 0x5ae0b4
	.data4	2348229384              ## 0x8bf72308
	.data4	39620447                ## 0x25c8f5f
	.data4	4142439491              ## 0xf6e89c43
	.data4	2417850490              ## 0x901d787a
	.data4	448784075               ## 0x1abfe6cb
	.data4	1086124775              ## 0x40bcf2e7
	.data4	2684983204              ## 0xa00997a4
	.data4	1227951724              ## 0x49310e6c
	.data4	1764356251              ## 0x6929f09b
	.data4	64111306                ## 0x3d242ca
	.data4	3334235877              ## 0xc6bc66e5
	.data4	4194885270              ## 0xfa08de96
	.data4	4255121921              ## 0xfda00201
	.data4	2955944750              ## 0xb030232e
	.data4	2092649110              ## 0x7cbb4a96
	.data4	3726651460              ## 0xde203044
	.data4	3205082396              ## 0xbf09ad1c
	.data4	4213127382              ## 0xfb1f38d6
	.data4	3148864148              ## 0xbbafda94
	.data4	2448278672              ## 0x91edc490
	.data4	3510264224              ## 0xd13a61a0
	.data4	55004124                ## 0x3474bdc
	.data4	3603006639              ## 0xd6c184af
	.data4	1770461755              ## 0x69871a3b
	.data4	2262156833              ## 0x86d5c621
	.data4	3117179293              ## 0xb9cc619d
	.data4	3862614414              ## 0xe63ad18e
	.data4	4229143232              ## 0xfc139ac0
	.data4	575267217               ## 0x2249e191
	.data4	2345599475              ## 0x8bcf01f3
	.data4	356750287               ## 0x154393cf
	.data4	798819494               ## 0x2f9d04a6
	.data4	4202944775              ## 0xfa83d907
	.data4	1318001577              ## 0x4e8f1ba9
	.data4	3102500210              ## 0xb8ec6572
	.data4	2882250517              ## 0xabcba715
	.data4	3071034817              ## 0xb70c45c1
	.data4	276053035               ## 0x10743c2b
	.data4	615126903               ## 0x24aa1777
	.data4	1542603436              ## 0x5bf242ac
	.data4	1988388716              ## 0x7684676c
	.data4	1177882237              ## 0x46350e7d
	.data4	19265476                ## 0x125f7c4
	.data4	2864096145              ## 0xaab6a391
	.data4	307082914               ## 0x124db6a2
	.data4	2961397102              ## 0xb083556e
	.data4	1496453452              ## 0x5932114c
	.data4	3504425161              ## 0xd0e148c9
	.data4	1455004595              ## 0x56b99bb3
	.data4	2604717324              ## 0x9b40d50c
	.data4	3690908270              ## 0xdbfeca6e
	.data4	4004490440              ## 0xeeafacc8
	.data4	4172762535              ## 0xf8b74da7
	.data4	3197427546              ## 0xbe94df5a
	.data4	3718350234              ## 0xdda1859a
	.data4	2292843339              ## 0x88aa034b
	.data4	2631015811              ## 0x9cd21d83
	.data4	193034304               ## 0xb817840
	.data4	768747578               ## 0x2dd2283a
	.data4	1337360486              ## 0x4fb68066
	.data4	934457803               ## 0x37b2b1cb
	.data4	873612482               ## 0x341244c2
	.data4	3669994446              ## 0xdabfabce
	.data4	355564760               ## 0x15317cd8
	.data4	41547336                ## 0x279f648
	.data4	1781447028              ## 0x6a2eb974
	.data4	2973375833              ## 0xb13a1d59
	.data4	1081281446              ## 0x40730ba6
	.data4	3312763915              ## 0xc574c40b
	.data4	4072422445              ## 0xf2bc3c2d
	.data4	3060969211              ## 0xb672aefb
	.data4	2963264742              ## 0xb09fd4e6
	.data4	907249073               ## 0x361385b1
	.data4	206843130               ## 0xc542cfa
	.data4	3363356639              ## 0xc878bfdf
	.data4	1697401307              ## 0x652c49db
	.data4	4060175335              ## 0xf2015be7
	.data4	3298626134              ## 0xc49d0a56
	.data4	61144662                ## 0x3a4fe56
	.data4	2656470594              ## 0x9e568642
	.data4	1693091376              ## 0x64ea8630
	.data4	2627019927              ## 0x9c952497
	.data4	3667003460              ## 0xda920844
	.data4	105673451               ## 0x64c72eb
	.data4	3376026597              ## 0xc93a13e5
	.data4	3994064042              ## 0xee1094aa
	.data4	4266929594              ## 0xfe542dba
	.data4	1358495114              ## 0x50f8fd8a
	.data4	3792904573              ## 0xe213217d
	.data4	2056481282              ## 0x7a936a02
	.data4	731396580               ## 0x2b9839e4
	.data4	617380302               ## 0x24cc79ce
	.data4	4132054542              ## 0xf64a260e
	.data4	818693069               ## 0x30cc43cd
	.data4	3110823461              ## 0xb96b6625
	.data4	3884023731              ## 0xe7817fb3
	.data4	2909213972              ## 0xad671514
	.data4	1233308008              ## 0x4982c968
	.data4	3454851968              ## 0xcdecdb80
	.data4	2820725524              ## 0xa820db14
	.data4	1895913584              ## 0x71015870
	.data4	1376826901              ## 0x5210b615
	.data4	1984652857              ## 0x764b6639
	.data4	412901507               ## 0x189c6083
	.data4	3662866098              ## 0xda52e6b2
	.data4	2025024491              ## 0x78b36beb
	.data4	2155364283              ## 0x80783fbb
	.data4	3061955420              ## 0xb681bb5c
	.data4	4260362650              ## 0xfdeff99a
	.data4	2439987725              ## 0x916f420d
	.data4	4162982588              ## 0xf82212bc
	.data4	2428733719              ## 0x90c38917
	.data4	1516579035              ## 0x5a6528db
	.data4	1612513822              ## 0x601d021e
	.data4	203005342               ## 0xc199d9e
	.data4	3383252446              ## 0xc9a855de
	.data4	307621155               ## 0x1255ed23
	.data4	13453556                ## 0xcd48f4
	.data4	125015832               ## 0x7739718
	.data4	483675743               ## 0x1cd44e5f
	.data4	2077347671              ## 0x7bd1cf57
	.data4	37011083                ## 0x234be8b
	.data4	4174493973              ## 0xf8d1b915
	.data4	2069609186              ## 0x7b5bbae2
	.data4	4248225827              ## 0xfd36c823
	.data4	1502566715              ## 0x598f593b
	.data4	3296138716              ## 0xc47715dc
	.data4	3088684957              ## 0xb819979d
	.data4	2153485233              ## 0x805b93b1
	.data4	2744655917              ## 0xa398202d
	.data4	1097472880              ## 0x416a1b70
	.data4	1449582151              ## 0x5666de47
	.data4	1327824311              ## 0x4f24fdb7
	.data4	3189121291              ## 0xbe16210b
	.data4	3643337017              ## 0xd928e939
	.data4	3120846058              ## 0xba0454ea
	.data4	223701431               ## 0xd5569b7
	.data4	810978550               ## 0x30568cf6
	.data4	43703267                ## 0x29adbe3
	.data4	835843581               ## 0x31d1f5fd
	.data4	1519786882              ## 0x5a961b82
	.data4	3522638013              ## 0xd1f730bd
	.data4	372536197               ## 0x16347385
	.data4	3977004465              ## 0xed0c45b1
	.data4	3652060157              ## 0xd9ae03fd
	.data4	3588471882              ## 0xd5e3bc4a
	.data4	15792134                ## 0xf0f806
	.data4	3178834059              ## 0xbd79288b
	.data4	1322391079              ## 0x4ed21627
	.data4	3063647583              ## 0xb69b8d5f
	.data4	2283241404              ## 0x88177fbc
	.data4	1299386162              ## 0x4d730f32
	.data4	3946276954              ## 0xeb37685a
	.data4	1341976962              ## 0x4ffcf182
	.data4	1190607957              ## 0x46f73c55
	.data4	4032465802              ## 0xf05a8b8a
	.data4	3754927568              ## 0xdfcfa5d0
	.data4	3308131126              ## 0xc52e1336
	.data4	2619421178              ## 0x9c2131fa
	.data4	2346951424              ## 0x8be3a300
	.data4	3902575720              ## 0xe89c9468
	.data4	638256747               ## 0x260b066b
	.data4	191085745               ## 0xb63bcb1
	.data4	4197806631              ## 0xfa357227
	.data4	2777658026              ## 0xa58fb2aa
	.data4	1375971382              ## 0x5203a836
	.data4	2133755906              ## 0x7f2e8802
	.data4	891811204               ## 0x3527f584
	.data4	2176266760              ## 0x81b73208
	.data4	2110473668              ## 0x7dcb45c4
	.data4	2236341469              ## 0x854bdcdd
	.data4	861211557               ## 0x33550ba5
	.data4	1573507430              ## 0x5dc9d166
	.data4	1625767564              ## 0x60e73e8c
	.data4	2051434938              ## 0x7a4669ba
	.data4	2372863096              ## 0x8d6f0478
	.data4	3023526876              ## 0xb4375bdc
	.data4	927536580               ## 0x374915c4
	.data4	1386277121              ## 0x52a0e901
	.data4	1184911833              ## 0x46a051d9
	.data4	50057146                ## 0x2fbcfba
	.data4	4109608725              ## 0xf4f3a715
	.data4	3010939309              ## 0xb37749ad
	.data4	3269274988              ## 0xc2dd2d6c
	.data4	3201266124              ## 0xbecf71cc
	.data4	3178394257              ## 0xbd727291
	.data4	2608283179              ## 0x9b773e2b
	.data4	2068400044              ## 0x7b4947ac
	.data4	1009668318              ## 0x3c2e50de
	.data4	2447717348              ## 0x91e533e4
	.data4	1670927751              ## 0x63985587
	.data4	408998980               ## 0x1860d444
	.data4	3914726786              ## 0xe955fd82
	.data4	1439774921              ## 0x55d138c9
	.data4	718930634               ## 0x2ada02ca
	.data4	2494924701              ## 0x94b5879d
	.data4	16808464                ## 0x1007a10
	.data4	2550999744              ## 0x980d2ac0
	.data4	1137718941              ## 0x43d0369d
	.data4	252008887               ## 0xf0559b7
	.data4	3834619629              ## 0xe48fa6ed
	.data4	3241361405              ## 0xc1333ffd
	.data4	1278046001              ## 0x4c2d6f31
	.data4	947528252               ## 0x387a223c
	.data4	1842130704              ## 0x6dccaf10
	.data4	1599145891              ## 0x5f5107a3
	.data4	2953011810              ## 0xb0036262
	.data4	1631478226              ## 0x613e61d2
	.data4	1754478786              ## 0x689338c2
	.data4	2924168497              ## 0xae4b4531
	.data4	1516348954              ## 0x5a61a61a
	.data4	730123440               ## 0x2b84ccb0
	.data4	2885181092              ## 0xabf85ea4
	.data4	1491046204              ## 0x58df8f3c
	.data4	3180067571              ## 0xbd8bfaf3
	.data4	3638913652              ## 0xd8e56a74
	.data4	3841570038              ## 0xe4f9b4f6
	.data4	3600065886              ## 0xd694a55e
	.data4	2490899744              ## 0x94781d20
	.data4	13393714                ## 0xcc5f32
	.data4	2193678101              ## 0x82c0df15
	.data4	176533870               ## 0xa85b16e
	.data4	1339899789              ## 0x4fdd3f8d
	.data4	2783162832              ## 0xa5e3b1d0
	.data4	2320267589              ## 0x8a4c7945
	.data4	2634278897              ## 0x9d03e7f1
	.data4	4179465539              ## 0xf91d9543
	.data4	86156176                ## 0x522a390

	.align	4                       ## @y_ref
y_ref::
	.data4	1983998144              ## 0x764168c0
	.data4	2520085488              ## 0x963573f0
	.data4	3138366804              ## 0xbb0fad54
	.data4	4134059268              ## 0xf668bd04
	.data4	1069938876              ## 0x3fc5f8bc
	.data4	3701936088              ## 0xdca70fd8
	.data4	800580802               ## 0x2fb7e4c2
	.data4	1889808274              ## 0x70a42f92
	.data4	2208037312              ## 0x839bf9c0
	.data4	3413542260              ## 0xcb768574
	.data4	2867073680              ## 0xaae41290
	.data4	3688784444              ## 0xdbde623c
	.data4	3813119752              ## 0xe3479708
	.data4	271803794               ## 0x10336592
	.data4	917382532               ## 0x36ae2584
	.data4	851793868               ## 0x32c557cc
	.data4	3204596978              ## 0xbf0244f2
	.data4	3147465260              ## 0xbb9a822c
	.data4	1464369876              ## 0x574882d4
	.data4	2283885554              ## 0x882153f2
	.data4	2610770534              ## 0x9b9d3266
	.data4	1155995158              ## 0x44e71616
	.data4	2101554326              ## 0x7d432c96
	.data4	4126646586              ## 0xf5f7a13a
	.data4	116511064               ## 0x6f1d158
	.data4	729534344               ## 0x2b7bcf88
	.data4	4247399204              ## 0xfd2a2b24
	.data4	1290403922              ## 0x4cea0052
	.data4	1732570274              ## 0x6744eca2
	.data4	2966384548              ## 0xb0cf6fa4
	.data4	3805878610              ## 0xe2d91952
	.data4	1569794154              ## 0x5d91286a
	.data4	3123502420              ## 0xba2cdd54
	.data4	4190436280              ## 0xf9c4fbb8
	.data4	1571614010              ## 0x5daced3a
	.data4	1477913470              ## 0x58172b7e
	.data4	3932142062              ## 0xea5fb9ee
	.data4	3840498546              ## 0xe4e95b72
	.data4	3085818256              ## 0xb7edd990
	.data4	1806425722              ## 0x6babde7a
	.data4	3840752024              ## 0xe4ed3998
	.data4	356817696               ## 0x15449b20
	.data4	2255356624              ## 0x866e02d0
	.data4	988775842               ## 0x3aef85a2
	.data4	1282116484              ## 0x4c6b8b84
	.data4	1960120828              ## 0x74d511fc
	.data4	2656454808              ## 0x9e564898
	.data4	2280916140              ## 0x87f404ac
	.data4	3251790338              ## 0xc1d26202
	.data4	3840846936              ## 0xe4eeac58
	.data4	3178128084              ## 0xbd6e62d4
	.data4	473486114               ## 0x1c38d322
	.data4	3006493152              ## 0xb33371e0
	.data4	3558644218              ## 0xd41c99fa
	.data4	1086427908              ## 0x40c19304
	.data4	1795814540              ## 0x6b09f48c
	.data4	741582260               ## 0x2c33a5b4
	.data4	2764546110              ## 0xa4c7a03e
	.data4	2589272448              ## 0x9a552980
	.data4	49165494                ## 0x2ee34b6
	.data4	924599518               ## 0x371c44de
	.data4	432492658               ## 0x19c75072
	.data4	2226790066              ## 0x84ba1eb2
	.data4	424994804               ## 0x1954e7f4
	.data4	730812190               ## 0x2b8f4f1e
	.data4	2183684602              ## 0x822861fa
	.data4	2392260694              ## 0x8e970056
	.data4	376926040               ## 0x16776f58
	.data4	1163807628              ## 0x455e4b8c
	.data4	2144759986              ## 0x7fd670b2
	.data4	349926080               ## 0x14db72c0
	.data4	174506234               ## 0xa66c0fa
	.data4	3199650806              ## 0xbeb6cbf6
	.data4	2843434748              ## 0xa97b5efc
	.data4	4095903252              ## 0xf4228614
	.data4	2743153724              ## 0xa381343c
	.data4	1623974956              ## 0x60cbe42c
	.data4	3536493622              ## 0xd2ca9c36
	.data4	886906762               ## 0x34dd1f8a
	.data4	504418804               ## 0x1e10d1f4
	.data4	1096275232              ## 0x4157d520
	.data4	2610073300              ## 0x9b928ed4
	.data4	238139054               ## 0xe31b6ae
	.data4	2023123144              ## 0x789668c8
	.data4	2781162562              ## 0xa5c52c42
	.data4	1767006904              ## 0x695262b8
	.data4	1695721118              ## 0x6512a69e
	.data4	71935336                ## 0x449a568
	.data4	2055378624              ## 0x7a8296c0
	.data4	3300293476              ## 0xc4b67b64
	.data4	1004557144              ## 0x3be05358
	.data4	1905946290              ## 0x719a6eb2
	.data4	1777903774              ## 0x69f8a89e
	.data4	541182528               ## 0x2041ca40
	.data4	1862296284              ## 0x6f0062dc
	.data4	1090766374              ## 0x4103c626
	.data4	2530007106              ## 0x96ccd842
	.data4	1938704600              ## 0x738e48d8
	.data4	4029106836              ## 0xf0274a94
	.data4	3443813362              ## 0xcd446bf2
	.data4	3297832274              ## 0xc490ed52
	.data4	988993302               ## 0x3af2d716
	.data4	145059942               ## 0x8a57066
	.data4	4178937676              ## 0xf915874c
	.data4	78783570                ## 0x4b22452
	.data4	4060134796              ## 0xf200bd8c
	.data4	3604815902              ## 0xd6dd201e
	.data4	733713080               ## 0x2bbb92b8
	.data4	3211740574              ## 0xbf6f459e
	.data4	3962508218              ## 0xec2f13ba
	.data4	1343919248              ## 0x501a9490
	.data4	961661998               ## 0x3951cc2e
	.data4	1573974240              ## 0x5dd0f0e0
	.data4	2788051496              ## 0xa62e4a28
	.data4	3797636332              ## 0xe25b54ec
	.data4	3648285044              ## 0xd9746974
	.data4	1712544784              ## 0x66135c10
	.data4	2948733158              ## 0xafc218e6
	.data4	4112918000              ## 0xf52625f0
	.data4	1827786832              ## 0x6cf1d050
	.data4	1000654600              ## 0x3ba4c708
	.data4	3315863940              ## 0xc5a41184
	.data4	3513306932              ## 0xd168cf34
	.data4	1299124946              ## 0x4d6f12d2
	.data4	3671057010              ## 0xdacfe272
	.data4	2161448350              ## 0x80d5159e
	.data4	4200920162              ## 0xfa64f462
	.data4	1013968778              ## 0x3c6fef8a
	.data4	173894464               ## 0xa5d6b40
	.data4	1223160012              ## 0x48e7f0cc
	.data4	285819514               ## 0x1109427a
	.data4	2247529936              ## 0x85f695d0
	.data4	250362316               ## 0xeec39cc
	.data4	1563645738              ## 0x5d33572a
	.data4	2343055622              ## 0x8ba83106
	.data4	301166068               ## 0x11f36df4
	.data4	2691892526              ## 0xa073052e
	.data4	1904052062              ## 0x717d875e
	.data4	2983303024              ## 0xb1d19770
	.data4	855713176               ## 0x33012598
	.data4	2924681828              ## 0xae531a64
	.data4	1771557120              ## 0x6997d100
	.data4	2066241066              ## 0x7b28562a
	.data4	74268628                ## 0x46d3fd4
	.data4	2509719474              ## 0x959747b2
	.data4	1485061846              ## 0x58843ed6
	.data4	2086753292              ## 0x7c61540c
	.data4	1632725402              ## 0x6151699a
	.data4	1131297740              ## 0x436e3bcc
	.data4	1864606960              ## 0x6f23a4f0
	.data4	2334986098              ## 0x8b2d0f72
	.data4	4001747402              ## 0xee85d1ca
	.data4	128162058               ## 0x7a3990a
	.data4	2685293344              ## 0xa00e5320
	.data4	77661078                ## 0x4a10396
	.data4	2641937808              ## 0x9d78c590
	.data4	2345598160              ## 0x8bcefcd0
	.data4	1310567164              ## 0x4e1daafc
	.data4	3184140732              ## 0xbdca21bc
	.data4	4202418340              ## 0xfa7bd0a4
	.data4	2955164312              ## 0xb0243a98
	.data4	2236668506              ## 0x8550da5a
	.data4	4016414336              ## 0xef659e80
	.data4	1239064940              ## 0x49daa16c
	.data4	1782844272              ## 0x6a440b70
	.data4	1713043806              ## 0x661af95e
	.data4	2018595608              ## 0x78515318
	.data4	4027838826              ## 0xf013f16a
	.data4	3776999684              ## 0xe1207104
	.data4	902614248               ## 0x35cccce8
	.data4	1914237574              ## 0x7218f286
	.data4	651211100               ## 0x26d0b15c
	.data4	3606842618              ## 0xd6fc0cfa
	.data4	3618663582              ## 0xd7b06c9e
	.data4	1545163490              ## 0x5c1952e2
	.data4	364493176               ## 0x15b9b978
	.data4	868199480               ## 0x33bfac38
	.data4	1838222692              ## 0x6d910d64
	.data4	1745291934              ## 0x68070a9e
	.data4	3490725326              ## 0xd0103dce
	.data4	2723497468              ## 0xa25545fc
	.data4	3888983928              ## 0xe7cd2f78
	.data4	1245290934              ## 0x4a39a1b6
	.data4	2045855326              ## 0x79f1465e
	.data4	1735110490              ## 0x676baf5a
	.data4	146108600               ## 0x8b570b8
	.data4	753964804               ## 0x2cf09704
	.data4	913337212               ## 0x36706b7c
	.data4	3539616314              ## 0xd2fa423a
	.data4	2967356142              ## 0xb0de42ee
	.data4	467368304               ## 0x1bdb7970
	.data4	4265219564              ## 0xfe3a15ec
	.data4	605010134               ## 0x240fb8d6
	.data4	1445905924              ## 0x562ec604
	.data4	3229766960              ## 0xc0825530
	.data4	3778118478              ## 0xe131834e
	.data4	3689643202              ## 0xdbeb7cc2
	.data4	2983921220              ## 0xb1db0644
	.data4	750761248               ## 0x2cbfb520
	.data4	2156056116              ## 0x8082ce34
	.data4	102017622               ## 0x614aa56
	.data4	2652626596              ## 0x9e1bdea4
	.data4	2320594910              ## 0x8a5177de
	.data4	98908794                ## 0x5e53a7a
	.data4	3675654108              ## 0xdb1607dc
	.data4	2941959936              ## 0xaf5abf00
	.data4	3919165736              ## 0xe999b928
	.data4	72222088                ## 0x44e0588
	.data4	2394566856              ## 0x8eba30c8
	.data4	1907070534              ## 0x71ab9646
	.data4	1778192142              ## 0x69fd0f0e
	.data4	1243085436              ## 0x4a17fa7c
	.data4	2232890646              ## 0x85173516
	.data4	3201507552              ## 0xbed320e0
	.data4	668949290               ## 0x27df5b2a
	.data4	3232238206              ## 0xc0a80a7e
	.data4	1198320728              ## 0x476cec58
	.data4	4273724102              ## 0xfebbdac6
	.data4	2467590128              ## 0x93146ff0
	.data4	1171990778              ## 0x45db28fa
	.data4	1456291124              ## 0x56cd3d34
	.data4	941610466               ## 0x381fd5e2
	.data4	548260336               ## 0x20adc9f0
	.data4	2081270756              ## 0x7c0dabe4
	.data4	2595854444              ## 0x9ab9986c
	.data4	3310466114              ## 0xc551b442
	.data4	140680454               ## 0x8629d06
	.data4	2723180524              ## 0xa2506fec
	.data4	424994878               ## 0x1954e83e
	.data4	2909996622              ## 0xad73064e
	.data4	2086892952              ## 0x7c637598
	.data4	2741240008              ## 0xa36400c8
	.data4	2575119270              ## 0x997d33a6
	.data4	2970242332              ## 0xb10a4d1c
	.data4	1581166078              ## 0x5e3eadfe
	.data4	4082500988              ## 0xf356057c
	.data4	3105109380              ## 0xb9143584
	.data4	3989758116              ## 0xedcee0a4
	.data4	4035901314              ## 0xf08ef782
	.data4	220278914               ## 0xd213082
	.data4	384968696               ## 0x16f227f8
	.data4	3164928504              ## 0xbca4f9f8
	.data4	3212916696              ## 0xbf8137d8
	.data4	796128290               ## 0x2f73f422
	.data4	3832677264              ## 0xe4720390
	.data4	2049450408              ## 0x7a2821a8
	.data4	2245196358              ## 0x85d2fa46
	.data4	1573272232              ## 0x5dc63aa8
	.data4	976908946               ## 0x3a3a7292
	.data4	3922084288              ## 0xe9c641c0
	.data4	79607006                ## 0x4beb4de
	.data4	3978977948              ## 0xed2a629c
	.data4	3671767090              ## 0xdadab832
	.data4	3109133408              ## 0xb9519c60
	.data4	2942247364              ## 0xaf5f21c4
	.data4	2261368586              ## 0x86c9bf0a
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

	.comm	y,1088,4                ## @y

