.section .text

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @compare
compare::
## BB#0:                                ## %entry
	c0	ldbu $r0.11 = 0[$r0.4]
;;
	c0	ldbu $r0.12 = 0[$r0.3]
;;
;;
.return ret($r0.3:s32)
	c0	sub $r0.3 = $r0.12, $r0.11
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-1056, arg() ## @main
main::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -1056
;;
	c0	stw 1036[$r0.1] = $r0.57
;;
	c0	stw 1032[$r0.1] = $r0.58
;;
	c0	stw 1028[$r0.1] = $r0.59
;;
	c0	stw 1024[$r0.1] = $l0.0
	c0	mov $r0.4 = gQSortNum
;;
	c0	mov $r0.59 = 1000
	c0	add $r0.57 = $r0.1, 24
;;
	c0	mov $r0.3 = $r0.57
	c0	mov $r0.5 = $r0.59
;;
.call memcpy, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = memcpy
;;
	c0	mov $r0.58 = 1
	c0	mov $r0.6 = compare
	c0	mov $r0.3 = $r0.57
;;
	c0	mov $r0.4 = $r0.59
	c0	mov $r0.5 = $r0.58
;;
.call QSORT, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = QSORT
;;
	c0	ldb $r0.11 = 24[$r0.1]
;;
LBB1_2::                                ## %for.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.12 = $r0.57, $r0.58
	c0	zxtb $r0.13 = $r0.11
;;
	c0	ldbu $r0.11 = 0[$r0.12]
;;
;;
	c0	cmpgeu $b0.0 = $r0.11, $r0.13
;;
;;
	c0	brf $b0.0, LBB1_3
;;
## BB#1:                                ## %for.cond
                                        ##   in Loop: Header=BB1_2 Depth=1
	c0	add $r0.58 = $r0.58, 1
;;
	c0	cmpgt $b0.0 = $r0.58, 999
;;
;;
	c0	br $b0.0, LBB1_4
;;
	c0	goto LBB1_2
;;
LBB1_3::                                ## %if.then
	c0	mov $r0.57 = 15
	c0	mov $r0.3 = str2
;;
.call puts, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = puts
;;
	c0	goto LBB1_5
;;
LBB1_4::                                ## %for.end
	c0	mov $r0.57 = 66
	c0	mov $r0.3 = str
;;
.call puts, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = puts
;;
LBB1_5::                                ## %cleanup
	c0	mov $r0.3 = $r0.57
	c0	ldw $l0.0 = 1024[$r0.1]
;;
	c0	ldw $r0.59 = 1028[$r0.1]
;;
	c0	ldw $r0.58 = 1032[$r0.1]
;;
	c0	ldw $r0.57 = 1036[$r0.1]
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 1056, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @QSORT
QSORT::
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
	c0	stw 44[$r0.1] = $r0.61
;;
	c0	stw 40[$r0.1] = $r0.62
;;
	c0	stw 36[$r0.1] = $r0.63
;;
	c0	stw 32[$r0.1] = $l0.0
	c0	mov $r0.57 = $r0.3
	c0	cmplt $b0.0 = $r0.4, 2
;;
;;
	c0	br $b0.0, LBB2_26
;;
## BB#1:                                ## %if.end
	c0	mpyhs $r0.11 = $r0.5, $r0.4
	c0	mpylu $r0.12 = $r0.5, $r0.4
	c0	mov $r0.58 = qsz
;;
	c0	mov $r0.13 = 2
	c0	stw 0[$r0.58] = $r0.5
;;
	c0	shl $r0.13 = $r0.5, $r0.13
	c0	add $r0.14 = $r0.12, $r0.11
;;
	c0	stw 28[$r0.1] = $r0.14
	c0	mpyhs $r0.11 = $r0.5, 6
	c0	mpylu $r0.12 = $r0.5, 6
;;
	c0	mov $r0.59 = qcmp
;;
	c0	stw 0[$r0.59] = $r0.6
;;
	c0	add $r0.11 = $r0.12, $r0.11
	c0	mov $r0.60 = thresh
;;
	c0	stw 0[$r0.60] = $r0.13
	c0	add $r0.63 = $r0.57, $r0.14
;;
	c0	stw 24[$r0.1] = $r0.63
	c0	mov $r0.12 = mthresh
	c0	cmplt $b0.0 = $r0.4, 4
;;
	c0	stw 0[$r0.12] = $r0.11
	c0	mov $r0.11 = $r0.5
;;
	c0	br $b0.0, LBB2_3
;;
## BB#2:                                ## %if.then4
	c0	mov $r0.3 = $r0.57
	c0	ldw $r0.4 = 24[$r0.1]
;;
;;
.call qst, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = qst
;;
	c0	ldw $r0.12 = 0[$r0.60]
;;
	c0	ldw $r0.11 = 0[$r0.58]
;;
	c0	add $r0.63 = $r0.57, $r0.12
;;
LBB2_3::                                ## %if.end6
	c0	add $r0.61 = $r0.57, $r0.11
;;
	c0	cmpgeu $b0.0 = $r0.61, $r0.63
	c0	mov $r0.62 = $r0.57
;;
;;
	c0	br $b0.0, LBB2_15
;;
LBB2_4::                                ## %for.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.11 = 0[$r0.59]
	c0	mov $r0.3 = $r0.62
	c0	mov $r0.4 = $r0.61
;;
;;
.call $l0.0, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = $r0.11
;;
	c0	cmpgt $b0.0 = $r0.3, 0
	c0	ldw $r0.11 = 0[$r0.58]
;;
;;
	c0	slct $r0.62 = $b0.0, $r0.61, $r0.62
	c0	add $r0.61 = $r0.61, $r0.11
;;
	c0	cmpltu $b0.0 = $r0.61, $r0.63
;;
;;
	c0	br $b0.0, LBB2_4
;;
## BB#5:                                ## %for.end
	c0	cmpeq $b0.0 = $r0.62, $r0.57
;;
;;
	c0	br $b0.0, LBB2_15
;;
## BB#6:                                ## %if.then13
	c0	cmplt $b0.0 = $r0.11, 1
;;
;;
	c0	br $b0.0, LBB2_15
;;
## BB#7:                                ## %for.body17.preheader
	c0	add $r0.11 = $r0.57, $r0.11
	c0	add $r0.12 = $r0.57, 1
	c0	xor $r0.13 = $r0.57, -1
;;
	c0	maxu $r0.17 = $r0.11, $r0.12
;;
	c0	add $r0.16 = $r0.17, $r0.13
;;
	c0	cmpeq $b0.0 = $r0.16, -1
	c0	mov $r0.12 = $r0.62
	c0	mov $r0.13 = $r0.57
;;
;;
	c0	br $b0.0, LBB2_17
;;
## BB#8:                                ## %overflow.checked
	c0	sub $r0.14 = $r0.17, $r0.57
;;
	c0	and $r0.15 = $r0.14, -16
	c0	mov $r0.18 = 0
;;
	c0	cmpeq $b0.0 = $r0.15, 0
	c0	mov $r0.12 = $r0.62
	c0	mov $r0.13 = $r0.57
;;
;;
	c0	br $b0.0, LBB2_13
;;
## BB#9:                                ## %vector.memcheck
	c0	add $r0.12 = $r0.17, -1
;;
	c0	cmpgtu $b0.0 = $r0.62, $r0.12
;;
;;
	c0	br $b0.0, LBB2_11
;;
## BB#10:                               ## %vector.memcheck
	c0	add $r0.12 = $r0.62, $r0.16
;;
	c0	cmpgeu $b0.0 = $r0.12, $r0.57
	c0	mov $r0.12 = $r0.62
	c0	mov $r0.13 = $r0.57
;;
;;
	c0	br $b0.0, LBB2_13
;;
LBB2_11::                               ## %vector.body.preheader
	c0	add $r0.13 = $r0.57, $r0.15
	c0	add $r0.12 = $r0.62, $r0.15
	c0	and $r0.16 = $r0.14, -16
	c0	mov $r0.17 = $r0.57
;;
LBB2_12::                               ## %vector.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldb $r0.18 = 14[$r0.17]
;;
	c0	ldb $r0.19 = 12[$r0.17]
;;
	c0	ldb $r0.20 = 13[$r0.17]
	c0	add $r0.16 = $r0.16, -16
	c0	add $r0.21 = $r0.17, 16
	c0	add $r0.22 = $r0.62, 16
;;
	c0	ldb $r0.23 = 15[$r0.17]
	c0	cmpne $b0.0 = $r0.16, 0
;;
	c0	ldb $r0.24 = 0[$r0.17]
;;
	c0	ldb $r0.25 = 1[$r0.17]
;;
	c0	ldb $r0.26 = 2[$r0.17]
;;
	c0	ldb $r0.27 = 3[$r0.17]
;;
	c0	ldb $r0.28 = 4[$r0.17]
;;
	c0	ldb $r0.29 = 5[$r0.17]
;;
	c0	ldb $r0.30 = 6[$r0.17]
;;
	c0	ldb $r0.31 = 7[$r0.17]
;;
	c0	ldb $r0.32 = 8[$r0.17]
;;
	c0	ldb $r0.33 = 9[$r0.17]
;;
	c0	ldb $r0.34 = 10[$r0.17]
;;
	c0	ldb $r0.35 = 11[$r0.17]
;;
	c0	ldb $r0.36 = 13[$r0.62]
;;
	c0	ldb $r0.37 = 14[$r0.62]
;;
	c0	ldb $r0.38 = 6[$r0.62]
;;
	c0	ldb $r0.39 = 15[$r0.62]
;;
	c0	ldb $r0.40 = 0[$r0.62]
;;
	c0	ldb $r0.41 = 1[$r0.62]
;;
	c0	ldb $r0.42 = 2[$r0.62]
;;
	c0	ldb $r0.43 = 3[$r0.62]
;;
	c0	ldb $r0.44 = 4[$r0.62]
;;
	c0	ldb $r0.45 = 5[$r0.62]
;;
	c0	ldb $r0.46 = 7[$r0.62]
;;
	c0	ldb $r0.47 = 9[$r0.62]
;;
	c0	ldb $r0.48 = 8[$r0.62]
;;
	c0	ldb $r0.49 = 10[$r0.62]
;;
	c0	ldb $r0.50 = 11[$r0.62]
;;
	c0	ldb $r0.51 = 12[$r0.62]
;;
	c0	stb 15[$r0.62] = $r0.23
;;
	c0	stb 14[$r0.62] = $r0.18
;;
	c0	stb 13[$r0.62] = $r0.20
;;
	c0	stb 12[$r0.62] = $r0.19
;;
	c0	stb 11[$r0.62] = $r0.35
;;
	c0	stb 10[$r0.62] = $r0.34
;;
	c0	stb 9[$r0.62] = $r0.33
;;
	c0	stb 8[$r0.62] = $r0.32
;;
	c0	stb 7[$r0.62] = $r0.31
;;
	c0	stb 6[$r0.62] = $r0.30
;;
	c0	stb 5[$r0.62] = $r0.29
;;
	c0	stb 4[$r0.62] = $r0.28
;;
	c0	stb 3[$r0.62] = $r0.27
;;
	c0	stb 2[$r0.62] = $r0.26
;;
	c0	stb 1[$r0.62] = $r0.25
;;
	c0	stb 0[$r0.62] = $r0.24
;;
	c0	stb 15[$r0.17] = $r0.39
;;
	c0	stb 14[$r0.17] = $r0.37
;;
	c0	stb 13[$r0.17] = $r0.36
;;
	c0	stb 12[$r0.17] = $r0.51
;;
	c0	stb 11[$r0.17] = $r0.50
;;
	c0	stb 10[$r0.17] = $r0.49
;;
	c0	stb 9[$r0.17] = $r0.47
;;
	c0	stb 8[$r0.17] = $r0.48
;;
	c0	stb 7[$r0.17] = $r0.46
;;
	c0	stb 6[$r0.17] = $r0.38
;;
	c0	stb 5[$r0.17] = $r0.45
;;
	c0	stb 4[$r0.17] = $r0.44
;;
	c0	stb 3[$r0.17] = $r0.43
;;
	c0	stb 2[$r0.17] = $r0.42
;;
	c0	stb 1[$r0.17] = $r0.41
;;
	c0	stb 0[$r0.17] = $r0.40
	c0	mov $r0.62 = $r0.22
	c0	mov $r0.17 = $r0.21
	c0	mov $r0.18 = $r0.15
;;
	c0	br $b0.0, LBB2_12
;;
LBB2_13::                               ## %middle.block
	c0	cmpne $b0.0 = $r0.14, $r0.18
;;
;;
	c0	brf $b0.0, LBB2_14
;;
LBB2_17::                               ## %for.body17
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldb $r0.14 = 0[$r0.13]
	c0	add $r0.15 = $r0.13, 1
;;
	c0	cmpltu $b0.0 = $r0.15, $r0.11
	c0	ldb $r0.16 = 0[$r0.12]
;;
	c0	stb 0[$r0.12] = $r0.14
	c0	add $r0.12 = $r0.12, 1
;;
	c0	stb 0[$r0.13] = $r0.16
	c0	mov $r0.13 = $r0.15
	c0	br $b0.0, LBB2_17
;;
LBB2_14::                               ## %for.cond15.for.cond21.preheader.loopexit_crit_edge
	c0	ldw $r0.11 = 0[$r0.58]
;;
LBB2_15::                               ## %for.cond21.preheader
	c0	ldw $r0.12 = 28[$r0.1]
;;
;;
	c0	cmpge $b0.0 = $r0.11, $r0.12
;;
;;
	c0	br $b0.0, LBB2_26
;;
## BB#16:                               ## %while.cond.preheader.lr.ph
	c0	add $r0.12 = $r0.57, $r0.11
;;
LBB2_18::                               ## %while.cond.preheader
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB2_19 Depth 2
                                        ##     Child Loop BB2_23 Depth 2
                                        ##       Child Loop BB2_24 Depth 3
	c0	stw 28[$r0.1] = $r0.57
	c0	mov $r0.61 = $r0.11
	c0	mov $r0.57 = $r0.12
;;
	c0	ldw $r0.11 = 0[$r0.59]
	c0	sub $r0.63 = $r0.57, $r0.61
;;
	c0	mov $r0.3 = $r0.63
	c0	mov $r0.4 = $r0.57
;;
.call $l0.0, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = $r0.11
;;
	c0	cmplt $b0.0 = $r0.3, 1
	c0	mov $r0.60 = $r0.57
	c0	mov $r0.62 = $r0.61
;;
;;
	c0	br $b0.0, LBB2_20
;;
LBB2_19::                               ## %while.cond.while.cond_crit_edge
                                        ##   Parent Loop BB2_18 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	mov $r0.60 = $r0.63
	c0	ldw $r0.62 = 0[$r0.58]
;;
	c0	ldw $r0.11 = 0[$r0.59]
;;
	c0	sub $r0.63 = $r0.60, $r0.62
;;
	c0	mov $r0.3 = $r0.63
	c0	mov $r0.4 = $r0.57
;;
.call $l0.0, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = $r0.11
;;
	c0	cmpgt $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB2_19
;;
LBB2_20::                               ## %while.end
                                        ##   in Loop: Header=BB2_18 Depth=1
	c0	ldw $r0.11 = 0[$r0.58]
;;
;;
	c0	sub $r0.12 = $r0.11, $r0.62
;;
	c0	add $r0.12 = $r0.60, $r0.12
;;
	c0	cmpne $b0.0 = $r0.12, $r0.57
;;
;;
	c0	brf $b0.0, LBB2_21
;;
## BB#22:                               ## %if.then31
                                        ##   in Loop: Header=BB2_18 Depth=1
	c0	add $r0.13 = $r0.11, $r0.61
	c0	ldw $r0.14 = 28[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.13, $r0.14
;;
	c0	add $r0.13 = $r0.13, -1
;;
	c0	cmpltu $b0.0 = $r0.13, $r0.57
;;
;;
	c0	br $b0.0, LBB2_21
;;
LBB2_23::                               ## %for.body36
                                        ##   Parent Loop BB2_18 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB2_24 Depth 3
	c0	sub $r0.14 = $r0.13, $r0.11
	c0	ldb $r0.11 = 0[$r0.13]
;;
	c0	cmpltu $b0.0 = $r0.14, $r0.12
	c0	mov $r0.15 = $r0.13
;;
;;
	c0	br $b0.0, LBB2_25
;;
LBB2_24::                               ## %for.body41
                                        ##   Parent Loop BB2_18 Depth=1
                                        ##     Parent Loop BB2_23 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	c0	mov $r0.16 = $r0.14
;;
	c0	ldb $r0.14 = 0[$r0.16]
;;
;;
	c0	stb 0[$r0.15] = $r0.14
;;
	c0	ldw $r0.14 = 0[$r0.58]
;;
;;
	c0	sub $r0.14 = $r0.16, $r0.14
;;
	c0	cmpgeu $b0.0 = $r0.14, $r0.12
	c0	mov $r0.15 = $r0.16
;;
;;
	c0	br $b0.0, LBB2_24
;;
LBB2_25::                               ## %for.end42
                                        ##   in Loop: Header=BB2_23 Depth=2
	c0	stb 0[$r0.15] = $r0.11
;;
	c0	ldw $r0.11 = 0[$r0.58]
	c0	add $r0.13 = $r0.13, -1
;;
	c0	cmpltu $b0.0 = $r0.13, $r0.57
;;
;;
	c0	brf $b0.0, LBB2_23
;;
LBB2_21::                               ## %for.cond21.backedge
                                        ##   in Loop: Header=BB2_18 Depth=1
	c0	add $r0.12 = $r0.57, $r0.11
	c0	ldw $r0.13 = 24[$r0.1]
;;
;;
	c0	cmpltu $b0.0 = $r0.12, $r0.13
;;
;;
	c0	br $b0.0, LBB2_18
;;
LBB2_26::                               ## %for.end45
	c0	ldw $l0.0 = 32[$r0.1]
;;
	c0	ldw $r0.63 = 36[$r0.1]
;;
	c0	ldw $r0.62 = 40[$r0.1]
;;
	c0	ldw $r0.61 = 44[$r0.1]
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
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg() ## @qst
qst::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -96
;;
	c0	stw 76[$r0.1] = $r0.57
;;
	c0	stw 72[$r0.1] = $r0.58
;;
	c0	stw 68[$r0.1] = $r0.59
;;
	c0	stw 64[$r0.1] = $r0.60
;;
	c0	stw 60[$r0.1] = $r0.61
;;
	c0	stw 56[$r0.1] = $r0.62
;;
	c0	stw 52[$r0.1] = $r0.63
;;
	c0	stw 48[$r0.1] = $l0.0
	c0	sub $r0.59 = $r0.4, $r0.3
	c0	mov $r0.57 = qsz
;;
	c0	mov $r0.58 = 0
	c0	mov $r0.11 = 1
;;
	c0	stw 32[$r0.1] = $r0.11
	c0	mov $r0.11 = mthresh
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	mov $r0.61 = qcmp
;;
	c0	mov $r0.11 = thresh
;;
	c0	stw 40[$r0.1] = $r0.11
	c0	mov $r0.11 = $r0.4
	c0	mov $r0.12 = $r0.3
;;
LBB3_1::                                ## %do.body
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB3_10 Depth 2
                                        ##     Child Loop BB3_12 Depth 2
                                        ##     Child Loop BB3_14 Depth 2
                                        ##       Child Loop BB3_15 Depth 3
                                        ##       Child Loop BB3_19 Depth 3
                                        ##       Child Loop BB3_30 Depth 3
                                        ##       Child Loop BB3_32 Depth 3
	c0	mov $r0.18 = $r0.12
	c0	mov $r0.19 = $r0.11
	c0	ldw $r0.11 = 0[$r0.57]
	c0	cmplt $r0.12 = $r0.59, $r0.0
;;
	c0	sub $r0.13 = $r0.0, $r0.59
	c0	mtb $b0.0 = $r0.12
;;
	c0	cmplt $r0.14 = $r0.11, $r0.0
	c0	sub $r0.15 = $r0.0, $r0.11
;;
	c0	slct $r0.13 = $b0.0, $r0.13, $r0.59
	c0	mtb $b0.0 = $r0.14
	c0	mtb $b0.1 = $r0.58
;;
;;
	c0	addcg $r0.16, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	slct $r0.13 = $b0.0, $r0.15, $r0.11
	c0	mtb $b0.0 = $r0.58
;;
;;
	c0	addcg $r0.15, $b0.0 = $r0.16, $r0.16, $b0.0
	c0	divs $r0.16, $b0.1 = $r0.0, $r0.13, $b0.1
;;
	c0	divs $r0.16, $b0.0 = $r0.16, $r0.13, $b0.0
	c0	addcg $r0.17, $b0.1 = $r0.15, $r0.15, $b0.1
;;
	c0	divs $r0.15, $b0.1 = $r0.16, $r0.13, $b0.1
	c0	addcg $r0.16, $b0.0 = $r0.17, $r0.17, $b0.0
;;
	c0	divs $r0.15, $b0.0 = $r0.15, $r0.13, $b0.0
	c0	addcg $r0.17, $b0.1 = $r0.16, $r0.16, $b0.1
;;
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.13, $b0.1
	c0	addcg $r0.16, $b0.0 = $r0.17, $r0.17, $b0.0
;;
	c0	divs $r0.15, $b0.2 = $r0.15, $r0.13, $b0.0
	c0	addcg $r0.17, $b0.1 = $r0.16, $r0.16, $b0.1
	c0	cmpeq $b0.0 = $r0.12, $r0.14
;;
	c0	divs $r0.12, $b0.1 = $r0.15, $r0.13, $b0.1
	c0	addcg $r0.14, $b0.2 = $r0.17, $r0.17, $b0.2
;;
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.13, $b0.2
	c0	addcg $r0.15, $b0.1 = $r0.14, $r0.14, $b0.1
;;
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
	c0	addcg $r0.14, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.13, $b0.2
	c0	addcg $r0.15, $b0.1 = $r0.14, $r0.14, $b0.1
;;
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
	c0	addcg $r0.14, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.13, $b0.2
	c0	addcg $r0.15, $b0.1 = $r0.14, $r0.14, $b0.1
;;
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
	c0	addcg $r0.14, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.13, $b0.2
	c0	addcg $r0.15, $b0.1 = $r0.14, $r0.14, $b0.1
;;
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
	c0	addcg $r0.14, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.13, $b0.2
	c0	addcg $r0.15, $b0.1 = $r0.14, $r0.14, $b0.1
;;
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
	c0	addcg $r0.14, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.13, $b0.2
	c0	addcg $r0.15, $b0.1 = $r0.14, $r0.14, $b0.1
;;
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
	c0	addcg $r0.14, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.13, $b0.2
	c0	addcg $r0.15, $b0.1 = $r0.14, $r0.14, $b0.1
;;
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
	c0	addcg $r0.14, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.13, $b0.2
	c0	addcg $r0.15, $b0.1 = $r0.14, $r0.14, $b0.1
;;
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
	c0	addcg $r0.14, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.13, $b0.2
	c0	addcg $r0.15, $b0.1 = $r0.14, $r0.14, $b0.1
;;
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
	c0	addcg $r0.14, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.13, $b0.2
	c0	addcg $r0.15, $b0.1 = $r0.14, $r0.14, $b0.1
;;
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
	c0	addcg $r0.14, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.13, $b0.2
	c0	addcg $r0.15, $b0.1 = $r0.14, $r0.14, $b0.1
;;
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
	c0	addcg $r0.14, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.13, $b0.2
	c0	addcg $r0.15, $b0.1 = $r0.14, $r0.14, $b0.1
;;
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.13, $b0.1
	c0	addcg $r0.14, $b0.2 = $r0.15, $r0.15, $b0.2
;;
	c0	divs $r0.12, $b0.2 = $r0.12, $r0.13, $b0.2
	c0	addcg $r0.13, $b0.1 = $r0.14, $r0.14, $b0.1
;;
	c0	addcg $r0.14, $b0.1 = $r0.13, $r0.13, $b0.2
	c0	cmpge $r0.12 = $r0.12, $r0.0
	c0	ldw $r0.13 = 28[$r0.1]
;;
;;
	c0	ldw $r0.13 = 0[$r0.13]
	c0	orc $r0.14 = $r0.14, $r0.0
;;
;;
	c0	cmplt $b0.1 = $r0.59, $r0.13
	c0	sh1add $r0.12 = $r0.14, $r0.12
;;
	c0	sub $r0.13 = $r0.0, $r0.12
;;
	c0	slct $r0.12 = $b0.0, $r0.12, $r0.13
	c0	ldw $r0.13 = 32[$r0.1]
;;
;;
	c0	shr $r0.12 = $r0.12, $r0.13
;;
	c0	mpyhs $r0.13 = $r0.12, $r0.11
	c0	mpylu $r0.11 = $r0.12, $r0.11
;;
;;
	c0	add $r0.11 = $r0.11, $r0.13
;;
	c0	add $r0.60 = $r0.18, $r0.11
	c0	br $b0.1, LBB3_13
;;
## BB#2:                                ## %if.then
                                        ##   in Loop: Header=BB3_1 Depth=1
	c0	stw 24[$r0.1] = $r0.11
;;
	c0	ldw $r0.11 = 0[$r0.61]
	c0	mov $r0.3 = $r0.18
	c0	mov $r0.4 = $r0.60
	c0	mov $r0.62 = $r0.18
;;
	c0	mov $r0.63 = $r0.19
;;
.call $l0.0, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	stw 44[$r0.1] = $r0.63
	c0	call $l0.0 = $r0.11
;;
	c0	cmpgt $b0.0 = $r0.3, 0
	c0	ldw $r0.11 = 0[$r0.61]
;;
;;
	c0	slct $r0.59 = $b0.0, $r0.62, $r0.60
	c0	ldw $r0.12 = 0[$r0.57]
;;
;;
	c0	sub $r0.63 = $r0.63, $r0.12
	c0	mov $r0.3 = $r0.59
;;
	c0	mov $r0.4 = $r0.63
;;
.call $l0.0, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = $r0.11
;;
	c0	cmplt $b0.0 = $r0.3, 1
;;
;;
	c0	br $b0.0, LBB3_4
;;
## BB#3:                                ## %if.then8
                                        ##   in Loop: Header=BB3_1 Depth=1
	c0	cmpeq $b0.0 = $r0.59, $r0.62
	c0	ldw $r0.11 = 0[$r0.61]
;;
;;
	c0	slct $r0.59 = $b0.0, $r0.60, $r0.62
;;
	c0	mov $r0.3 = $r0.59
	c0	mov $r0.4 = $r0.63
;;
.call $l0.0, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = $r0.11
;;
	c0	cmplt $b0.0 = $r0.3, 0
;;
;;
	c0	slct $r0.59 = $b0.0, $r0.63, $r0.59
;;
LBB3_4::                                ## %if.end18
                                        ##   in Loop: Header=BB3_1 Depth=1
	c0	cmpeq $b0.0 = $r0.59, $r0.60
	c0	mov $r0.18 = $r0.62
	c0	ldw $r0.19 = 44[$r0.1]
;;
	c0	ldw $r0.17 = 24[$r0.1]
;;
	c0	br $b0.0, LBB3_13
;;
## BB#5:                                ## %if.then20
                                        ##   in Loop: Header=BB3_1 Depth=1
	c0	ldw $r0.12 = 0[$r0.57]
;;
;;
	c0	cmpeq $b0.0 = $r0.12, 0
	c0	mov $r0.11 = $r0.60
	c0	mov $r0.13 = $r0.59
	c0	mov $r0.14 = $r0.12
;;
;;
	c0	br $b0.0, LBB3_12
;;
## BB#6:                                ## %overflow.checked243
                                        ##   in Loop: Header=BB3_1 Depth=1
	c0	mov $r0.53 = $r0.19
	c0	mov $r0.52 = $r0.18
	c0	and $r0.15 = $r0.12, -16
	c0	mov $r0.18 = 0
;;
	c0	cmpeq $b0.0 = $r0.15, 0
	c0	mov $r0.11 = $r0.60
	c0	mov $r0.13 = $r0.59
	c0	mov $r0.14 = $r0.12
;;
;;
	c0	br $b0.0, LBB3_11
;;
## BB#7:                                ## %vector.memcheck253
                                        ##   in Loop: Header=BB3_1 Depth=1
	c0	add $r0.11 = $r0.12, $r0.59
	c0	add $r0.16 = $r0.52, $r0.17
;;
	c0	add $r0.11 = $r0.11, -1
;;
	c0	cmpgtu $b0.0 = $r0.16, $r0.11
;;
;;
	c0	br $b0.0, LBB3_9
;;
## BB#8:                                ## %vector.memcheck253
                                        ##   in Loop: Header=BB3_1 Depth=1
	c0	add $r0.11 = $r0.12, $r0.17
;;
	c0	add $r0.11 = $r0.11, $r0.52
;;
	c0	add $r0.11 = $r0.11, -1
;;
	c0	cmpleu $b0.0 = $r0.59, $r0.11
	c0	mov $r0.11 = $r0.60
	c0	mov $r0.13 = $r0.59
	c0	mov $r0.14 = $r0.12
;;
;;
	c0	br $b0.0, LBB3_11
;;
LBB3_9::                                ## %vector.body234.preheader
                                        ##   in Loop: Header=BB3_1 Depth=1
	c0	sub $r0.14 = $r0.12, $r0.15
	c0	add $r0.13 = $r0.59, $r0.15
	c0	add $r0.11 = $r0.17, $r0.15
;;
	c0	add $r0.11 = $r0.52, $r0.11
	c0	and $r0.17 = $r0.12, -16
;;
LBB3_10::                               ## %vector.body234
                                        ##   Parent Loop BB3_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldb $r0.18 = 14[$r0.59]
;;
	c0	ldb $r0.19 = 12[$r0.59]
;;
	c0	ldb $r0.20 = 13[$r0.59]
	c0	add $r0.17 = $r0.17, -16
	c0	add $r0.21 = $r0.59, 16
	c0	add $r0.22 = $r0.16, 16
;;
	c0	ldb $r0.23 = 15[$r0.59]
	c0	cmpne $b0.0 = $r0.17, 0
;;
	c0	ldb $r0.24 = 0[$r0.59]
;;
	c0	ldb $r0.25 = 1[$r0.59]
;;
	c0	ldb $r0.26 = 2[$r0.59]
;;
	c0	ldb $r0.27 = 3[$r0.59]
;;
	c0	ldb $r0.28 = 4[$r0.59]
;;
	c0	ldb $r0.29 = 5[$r0.59]
;;
	c0	ldb $r0.30 = 6[$r0.59]
;;
	c0	ldb $r0.31 = 7[$r0.59]
;;
	c0	ldb $r0.32 = 8[$r0.59]
;;
	c0	ldb $r0.33 = 9[$r0.59]
;;
	c0	ldb $r0.34 = 10[$r0.59]
;;
	c0	ldb $r0.35 = 11[$r0.59]
;;
	c0	ldb $r0.36 = 13[$r0.16]
;;
	c0	ldb $r0.37 = 14[$r0.16]
;;
	c0	ldb $r0.38 = 6[$r0.16]
;;
	c0	ldb $r0.39 = 15[$r0.16]
;;
	c0	ldb $r0.40 = 0[$r0.16]
;;
	c0	ldb $r0.41 = 1[$r0.16]
;;
	c0	ldb $r0.42 = 2[$r0.16]
;;
	c0	ldb $r0.43 = 3[$r0.16]
;;
	c0	ldb $r0.44 = 4[$r0.16]
;;
	c0	ldb $r0.45 = 5[$r0.16]
;;
	c0	ldb $r0.46 = 7[$r0.16]
;;
	c0	ldb $r0.47 = 9[$r0.16]
;;
	c0	ldb $r0.48 = 8[$r0.16]
;;
	c0	ldb $r0.49 = 10[$r0.16]
;;
	c0	ldb $r0.50 = 11[$r0.16]
;;
	c0	ldb $r0.51 = 12[$r0.16]
;;
	c0	stb 15[$r0.16] = $r0.23
;;
	c0	stb 14[$r0.16] = $r0.18
;;
	c0	stb 13[$r0.16] = $r0.20
;;
	c0	stb 12[$r0.16] = $r0.19
;;
	c0	stb 11[$r0.16] = $r0.35
;;
	c0	stb 10[$r0.16] = $r0.34
;;
	c0	stb 9[$r0.16] = $r0.33
;;
	c0	stb 8[$r0.16] = $r0.32
;;
	c0	stb 7[$r0.16] = $r0.31
;;
	c0	stb 6[$r0.16] = $r0.30
;;
	c0	stb 5[$r0.16] = $r0.29
;;
	c0	stb 4[$r0.16] = $r0.28
;;
	c0	stb 3[$r0.16] = $r0.27
;;
	c0	stb 2[$r0.16] = $r0.26
;;
	c0	stb 1[$r0.16] = $r0.25
;;
	c0	stb 0[$r0.16] = $r0.24
;;
	c0	stb 15[$r0.59] = $r0.39
;;
	c0	stb 14[$r0.59] = $r0.37
;;
	c0	stb 13[$r0.59] = $r0.36
;;
	c0	stb 12[$r0.59] = $r0.51
;;
	c0	stb 11[$r0.59] = $r0.50
;;
	c0	stb 10[$r0.59] = $r0.49
;;
	c0	stb 9[$r0.59] = $r0.47
;;
	c0	stb 8[$r0.59] = $r0.48
;;
	c0	stb 7[$r0.59] = $r0.46
;;
	c0	stb 6[$r0.59] = $r0.38
;;
	c0	stb 5[$r0.59] = $r0.45
;;
	c0	stb 4[$r0.59] = $r0.44
;;
	c0	stb 3[$r0.59] = $r0.43
;;
	c0	stb 2[$r0.59] = $r0.42
;;
	c0	stb 1[$r0.59] = $r0.41
;;
	c0	stb 0[$r0.59] = $r0.40
	c0	mov $r0.16 = $r0.22
	c0	mov $r0.59 = $r0.21
	c0	mov $r0.18 = $r0.15
;;
	c0	br $b0.0, LBB3_10
;;
LBB3_11::                               ## %middle.block235
                                        ##   in Loop: Header=BB3_1 Depth=1
	c0	cmpeq $b0.0 = $r0.12, $r0.18
	c0	mov $r0.18 = $r0.52
	c0	mov $r0.19 = $r0.53
;;
;;
	c0	br $b0.0, LBB3_13
;;
LBB3_12::                               ## %do.body21
                                        ##   Parent Loop BB3_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldb $r0.12 = 0[$r0.13]
;;
	c0	ldb $r0.15 = 0[$r0.11]
	c0	add $r0.14 = $r0.14, -1
;;
	c0	stb 0[$r0.11] = $r0.12
	c0	add $r0.12 = $r0.13, 1
	c0	cmpne $b0.0 = $r0.14, 0
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stb 0[$r0.13] = $r0.15
	c0	mov $r0.13 = $r0.12
;;
	c0	br $b0.0, LBB3_12
;;
LBB3_13::                               ## %if.end24
                                        ##   in Loop: Header=BB3_1 Depth=1
	c0	stw 44[$r0.1] = $r0.19
;;
	c0	stw 36[$r0.1] = $r0.18
;;
	c0	ldw $r0.11 = 0[$r0.57]
;;
;;
	c0	sub $r0.62 = $r0.19, $r0.11
	c0	mov $r0.59 = $r0.18
;;
LBB3_14::                               ## %while.cond.outer
                                        ##   Parent Loop BB3_1 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB3_15 Depth 3
                                        ##       Child Loop BB3_19 Depth 3
                                        ##       Child Loop BB3_30 Depth 3
                                        ##       Child Loop BB3_32 Depth 3
	c0	cmpgeu $b0.0 = $r0.59, $r0.60
;;
;;
	c0	br $b0.0, LBB3_16
;;
LBB3_15::                               ## %land.rhs
                                        ##   Parent Loop BB3_1 Depth=1
                                        ##     Parent Loop BB3_14 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	c0	ldw $r0.11 = 0[$r0.61]
	c0	mov $r0.3 = $r0.59
	c0	mov $r0.4 = $r0.60
;;
;;
.call $l0.0, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = $r0.11
;;
	c0	cmplt $b0.0 = $r0.3, 1
;;
;;
	c0	brf $b0.0, LBB3_16
;;
## BB#18:                               ## %while.body
                                        ##   in Loop: Header=BB3_15 Depth=3
	c0	ldw $r0.11 = 0[$r0.57]
;;
;;
	c0	add $r0.59 = $r0.59, $r0.11
;;
	c0	cmpltu $b0.0 = $r0.59, $r0.60
;;
;;
	c0	br $b0.0, LBB3_15
;;
LBB3_16::                               ## %while.cond32.preheader
                                        ##   in Loop: Header=BB3_14 Depth=2
	c0	mov $r0.63 = $r0.59
	c0	cmpgtu $b0.0 = $r0.62, $r0.60
;;
;;
	c0	brf $b0.0, LBB3_17
;;
LBB3_19::                               ## %while.body34
                                        ##   Parent Loop BB3_1 Depth=1
                                        ##     Parent Loop BB3_14 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	c0	ldw $r0.11 = 0[$r0.61]
	c0	mov $r0.3 = $r0.60
	c0	mov $r0.4 = $r0.62
;;
;;
.call $l0.0, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = $r0.11
;;
	c0	cmpgt $b0.0 = $r0.3, 0
	c0	ldw $r0.11 = 0[$r0.57]
;;
;;
	c0	br $b0.0, LBB3_21
;;
## BB#20:                               ## %if.then38
                                        ##   in Loop: Header=BB3_19 Depth=3
	c0	sub $r0.62 = $r0.62, $r0.11
;;
	c0	cmpgtu $b0.0 = $r0.62, $r0.60
;;
;;
	c0	br $b0.0, LBB3_19
;;
	c0	goto LBB3_23
;;
LBB3_17::                               ## %while.cond32.preheader.while.end48_crit_edge
                                        ##   in Loop: Header=BB3_14 Depth=2
	c0	ldw $r0.11 = 0[$r0.57]
;;
LBB3_23::                               ## %while.end48
                                        ##   in Loop: Header=BB3_14 Depth=2
	c0	cmpeq $b0.0 = $r0.63, $r0.60
;;
;;
	c0	br $b0.0, LBB3_33
;;
## BB#24:                               ## %if.else51
                                        ##   in Loop: Header=BB3_14 Depth=2
	c0	sub $r0.13 = $r0.62, $r0.11
	c0	mov $r0.12 = $r0.60
	c0	mov $r0.62 = $r0.63
	c0	mov $r0.59 = $r0.63
;;
LBB3_25::                               ## %swap
                                        ##   in Loop: Header=BB3_14 Depth=2
	c0	mov $r0.60 = $r0.62
	c0	mov $r0.62 = $r0.13
	c0	cmpeq $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB3_32
;;
## BB#26:                               ## %overflow.checked
                                        ##   in Loop: Header=BB3_14 Depth=2
	c0	and $r0.13 = $r0.11, -16
;;
	c0	cmpeq $b0.0 = $r0.13, 0
	c0	mov $r0.15 = $r0.63
	c0	mov $r0.14 = $r0.12
	c0	mov $r0.16 = $r0.11
;;
	c0	mov $r0.18 = $r0.58
;;
	c0	br $b0.0, LBB3_31
;;
## BB#27:                               ## %vector.memcheck
                                        ##   in Loop: Header=BB3_14 Depth=2
	c0	add $r0.14 = $r0.11, -1
;;
	c0	add $r0.15 = $r0.12, $r0.14
;;
	c0	cmpgtu $b0.0 = $r0.63, $r0.15
;;
;;
	c0	br $b0.0, LBB3_29
;;
## BB#28:                               ## %vector.memcheck
                                        ##   in Loop: Header=BB3_14 Depth=2
	c0	add $r0.14 = $r0.63, $r0.14
;;
	c0	cmpleu $b0.0 = $r0.12, $r0.14
	c0	mov $r0.15 = $r0.63
	c0	mov $r0.14 = $r0.12
	c0	mov $r0.16 = $r0.11
;;
	c0	mov $r0.18 = $r0.58
;;
	c0	br $b0.0, LBB3_31
;;
LBB3_29::                               ## %vector.body.preheader
                                        ##   in Loop: Header=BB3_14 Depth=2
	c0	add $r0.14 = $r0.12, $r0.13
	c0	sub $r0.16 = $r0.11, $r0.13
	c0	add $r0.15 = $r0.63, $r0.13
	c0	and $r0.17 = $r0.11, -16
;;
LBB3_30::                               ## %vector.body
                                        ##   Parent Loop BB3_1 Depth=1
                                        ##     Parent Loop BB3_14 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	c0	ldb $r0.18 = 14[$r0.12]
;;
	c0	ldb $r0.19 = 12[$r0.12]
;;
	c0	ldb $r0.20 = 13[$r0.12]
	c0	add $r0.17 = $r0.17, -16
	c0	add $r0.21 = $r0.12, 16
	c0	add $r0.22 = $r0.63, 16
;;
	c0	ldb $r0.23 = 15[$r0.12]
	c0	cmpne $b0.0 = $r0.17, 0
;;
	c0	ldb $r0.24 = 0[$r0.12]
;;
	c0	ldb $r0.25 = 1[$r0.12]
;;
	c0	ldb $r0.26 = 2[$r0.12]
;;
	c0	ldb $r0.27 = 3[$r0.12]
;;
	c0	ldb $r0.28 = 4[$r0.12]
;;
	c0	ldb $r0.29 = 5[$r0.12]
;;
	c0	ldb $r0.30 = 6[$r0.12]
;;
	c0	ldb $r0.31 = 7[$r0.12]
;;
	c0	ldb $r0.32 = 8[$r0.12]
;;
	c0	ldb $r0.33 = 9[$r0.12]
;;
	c0	ldb $r0.34 = 10[$r0.12]
;;
	c0	ldb $r0.35 = 11[$r0.12]
;;
	c0	ldb $r0.36 = 13[$r0.63]
;;
	c0	ldb $r0.37 = 14[$r0.63]
;;
	c0	ldb $r0.38 = 6[$r0.63]
;;
	c0	ldb $r0.39 = 15[$r0.63]
;;
	c0	ldb $r0.40 = 0[$r0.63]
;;
	c0	ldb $r0.41 = 1[$r0.63]
;;
	c0	ldb $r0.42 = 2[$r0.63]
;;
	c0	ldb $r0.43 = 3[$r0.63]
;;
	c0	ldb $r0.44 = 4[$r0.63]
;;
	c0	ldb $r0.45 = 5[$r0.63]
;;
	c0	ldb $r0.46 = 7[$r0.63]
;;
	c0	ldb $r0.47 = 9[$r0.63]
;;
	c0	ldb $r0.48 = 8[$r0.63]
;;
	c0	ldb $r0.49 = 10[$r0.63]
;;
	c0	ldb $r0.50 = 11[$r0.63]
;;
	c0	ldb $r0.51 = 12[$r0.63]
;;
	c0	stb 15[$r0.63] = $r0.23
;;
	c0	stb 14[$r0.63] = $r0.18
;;
	c0	stb 13[$r0.63] = $r0.20
;;
	c0	stb 12[$r0.63] = $r0.19
;;
	c0	stb 11[$r0.63] = $r0.35
;;
	c0	stb 10[$r0.63] = $r0.34
;;
	c0	stb 9[$r0.63] = $r0.33
;;
	c0	stb 8[$r0.63] = $r0.32
;;
	c0	stb 7[$r0.63] = $r0.31
;;
	c0	stb 6[$r0.63] = $r0.30
;;
	c0	stb 5[$r0.63] = $r0.29
;;
	c0	stb 4[$r0.63] = $r0.28
;;
	c0	stb 3[$r0.63] = $r0.27
;;
	c0	stb 2[$r0.63] = $r0.26
;;
	c0	stb 1[$r0.63] = $r0.25
;;
	c0	stb 0[$r0.63] = $r0.24
;;
	c0	stb 15[$r0.12] = $r0.39
;;
	c0	stb 14[$r0.12] = $r0.37
;;
	c0	stb 13[$r0.12] = $r0.36
;;
	c0	stb 12[$r0.12] = $r0.51
;;
	c0	stb 11[$r0.12] = $r0.50
;;
	c0	stb 10[$r0.12] = $r0.49
;;
	c0	stb 9[$r0.12] = $r0.47
;;
	c0	stb 8[$r0.12] = $r0.48
;;
	c0	stb 7[$r0.12] = $r0.46
;;
	c0	stb 6[$r0.12] = $r0.38
;;
	c0	stb 5[$r0.12] = $r0.45
;;
	c0	stb 4[$r0.12] = $r0.44
;;
	c0	stb 3[$r0.12] = $r0.43
;;
	c0	stb 2[$r0.12] = $r0.42
;;
	c0	stb 1[$r0.12] = $r0.41
;;
	c0	stb 0[$r0.12] = $r0.40
	c0	mov $r0.63 = $r0.22
	c0	mov $r0.12 = $r0.21
	c0	mov $r0.18 = $r0.13
;;
	c0	br $b0.0, LBB3_30
;;
LBB3_31::                               ## %middle.block
                                        ##   in Loop: Header=BB3_14 Depth=2
	c0	cmpeq $b0.0 = $r0.11, $r0.18
	c0	mov $r0.63 = $r0.15
	c0	mov $r0.12 = $r0.14
	c0	mov $r0.11 = $r0.16
;;
;;
	c0	br $b0.0, LBB3_14
;;
LBB3_32::                               ## %do.body55
                                        ##   Parent Loop BB3_1 Depth=1
                                        ##     Parent Loop BB3_14 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	c0	ldb $r0.13 = 0[$r0.12]
;;
	c0	ldb $r0.14 = 0[$r0.63]
	c0	add $r0.11 = $r0.11, -1
;;
	c0	stb 0[$r0.63] = $r0.13
	c0	add $r0.13 = $r0.12, 1
	c0	cmpeq $b0.0 = $r0.11, 0
	c0	add $r0.63 = $r0.63, 1
;;
	c0	stb 0[$r0.12] = $r0.14
	c0	mov $r0.12 = $r0.13
;;
	c0	br $b0.0, LBB3_14
;;
	c0	goto LBB3_32
;;
LBB3_21::                               ## %if.end41
                                        ##   in Loop: Header=BB3_14 Depth=2
	c0	add $r0.59 = $r0.63, $r0.11
	c0	cmpeq $b0.0 = $r0.63, $r0.60
	c0	mov $r0.13 = $r0.62
	c0	mov $r0.12 = $r0.62
;;
;;
	c0	br $b0.0, LBB3_25
;;
## BB#22:                               ## %if.else
                                        ##   in Loop: Header=BB3_14 Depth=2
	c0	sub $r0.13 = $r0.62, $r0.11
	c0	mov $r0.12 = $r0.62
	c0	mov $r0.62 = $r0.60
	c0	goto LBB3_25
;;
LBB3_33::                               ## %for.end
                                        ##   in Loop: Header=BB3_1 Depth=1
	c0	add $r0.62 = $r0.60, $r0.11
	c0	ldw $r0.13 = 36[$r0.1]
;;
;;
	c0	sub $r0.63 = $r0.60, $r0.13
	c0	ldw $r0.14 = 44[$r0.1]
;;
;;
	c0	sub $r0.59 = $r0.14, $r0.62
	c0	ldw $r0.11 = 40[$r0.1]
;;
;;
	c0	ldw $r0.11 = 0[$r0.11]
	c0	cmpgt $b0.0 = $r0.63, $r0.59
;;
;;
	c0	brf $b0.0, LBB3_34
;;
## BB#36:                               ## %if.else74
                                        ##   in Loop: Header=BB3_1 Depth=1
	c0	cmplt $b0.0 = $r0.59, $r0.11
	c0	mov $r0.11 = $r0.60
	c0	mov $r0.59 = $r0.63
	c0	mov $r0.12 = $r0.13
;;
;;
	c0	br $b0.0, LBB3_38
;;
	c0	goto LBB3_37
;;
LBB3_34::                               ## %if.then70
                                        ##   in Loop: Header=BB3_1 Depth=1
	c0	cmplt $b0.0 = $r0.63, $r0.11
	c0	mov $r0.11 = $r0.14
	c0	mov $r0.12 = $r0.62
;;
;;
	c0	br $b0.0, LBB3_38
;;
## BB#35:                               ## %if.then72
                                        ##   in Loop: Header=BB3_1 Depth=1
	c0	mov $r0.3 = $r0.13
	c0	mov $r0.4 = $r0.60
	c0	mov $r0.60 = $r0.14
;;
.call qst, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = qst
;;
	c0	mov $r0.11 = $r0.60
	c0	mov $r0.12 = $r0.62
	c0	goto LBB3_38
;;
LBB3_37::                               ## %if.then76
                                        ##   in Loop: Header=BB3_1 Depth=1
	c0	mov $r0.3 = $r0.62
	c0	mov $r0.4 = $r0.14
	c0	mov $r0.62 = $r0.13
;;
.call qst, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = qst
;;
	c0	mov $r0.11 = $r0.60
	c0	mov $r0.59 = $r0.63
	c0	mov $r0.12 = $r0.62
;;
LBB3_38::                               ## %do.cond79
                                        ##   in Loop: Header=BB3_1 Depth=1
	c0	ldw $r0.13 = 40[$r0.1]
;;
;;
	c0	ldw $r0.13 = 0[$r0.13]
;;
;;
	c0	cmpge $b0.0 = $r0.59, $r0.13
;;
;;
	c0	br $b0.0, LBB3_1
;;
## BB#39:                               ## %do.end81
	c0	ldw $l0.0 = 48[$r0.1]
;;
	c0	ldw $r0.63 = 52[$r0.1]
;;
	c0	ldw $r0.62 = 56[$r0.1]
;;
	c0	ldw $r0.61 = 60[$r0.1]
;;
	c0	ldw $r0.60 = 64[$r0.1]
;;
	c0	ldw $r0.59 = 68[$r0.1]
;;
	c0	ldw $r0.58 = 72[$r0.1]
;;
.return ret($r0.3:s32)
	c0	ldw $r0.57 = 76[$r0.1]
	c0	return $r0.1 = $r0.1, 96, $l0.0
;;
.endp

.section .data

gQSortNum::                             ## @gQSortNum
	.data1 57
	.data1 126
	.data1 223
	.data1 44
	.data1 11
	.data1 138
	.data1 251
	.data1 232
	.data1 143
	.data1 86
	.data1 215
	.data1 60
	.data1 83
	.data1 30
	.data1 115
	.data1 48
	.data1 87
	.data1 46
	.data1 49
	.data1 164
	.data1 101
	.data1 198
	.data1 235
	.data1 72
	.data1 31
	.data1 6
	.data1 57
	.data1 12
	.data1 227
	.data1 110
	.data1 157
	.data1 96
	.data1 25
	.data1 34
	.data1 191
	.data1 140
	.data1 43
	.data1 22
	.data1 37
	.data1 136
	.data1 175
	.data1 182
	.data1 183
	.data1 220
	.data1 115
	.data1 66
	.data1 173
	.data1 144
	.data1 137
	.data1 114
	.data1 81
	.data1 68
	.data1 69
	.data1 102
	.data1 203
	.data1 168
	.data1 193
	.data1 102
	.data1 167
	.data1 172
	.data1 3
	.data1 14
	.data1 67
	.data1 64
	.data1 249
	.data1 62
	.data1 159
	.data1 20
	.data1 75
	.data1 74
	.data1 187
	.data1 216
	.data1 207
	.data1 22
	.data1 151
	.data1 124
	.data1 109
	.data1 162
	.data1 51
	.data1 16
	.data1 151
	.data1 18
	.data1 143
	.data1 28
	.data1 37
	.data1 250
	.data1 171
	.data1 8
	.data1 95
	.data1 58
	.data1 135
	.data1 76
	.data1 221
	.data1 82
	.data1 221
	.data1 224
	.data1 217
	.data1 158
	.data1 127
	.data1 76
	.data1 107
	.data1 170
	.data1 155
	.data1 200
	.data1 239
	.data1 138
	.data1 119
	.data1 228
	.data1 77
	.data1 2
	.data1 237
	.data1 176
	.data1 183
	.data1 178
	.data1 111
	.data1 132
	.data1 5
	.data1 166
	.data1 139
	.data1 104
	.data1 129
	.data1 218
	.data1 103
	.data1 20
	.data1 189
	.data1 78
	.data1 3
	.data1 128
	.data1 185
	.data1 2
	.data1 95
	.data1 172
	.data1 139
	.data1 10
	.data1 123
	.data1 104
	.data1 241
	.data1 214
	.data1 169
	.data1 188
	.data1 211
	.data1 98
	.data1 13
	.data1 80
	.data1 41
	.data1 82
	.data1 177
	.data1 220
	.data1 229
	.data1 186
	.data1 149
	.data1 200
	.data1 159
	.data1 134
	.data1 71
	.data1 116
	.data1 99
	.data1 18
	.data1 29
	.data1 224
	.data1 103
	.data1 162
	.data1 193
	.data1 12
	.data1 171
	.data1 150
	.data1 165
	.data1 248
	.data1 209
	.data1 202
	.data1 201
	.data1 92
	.data1 13
	.data1 62
	.data1 211
	.data1 16
	.data1 247
	.data1 14
	.data1 209
	.data1 60
	.data1 59
	.data1 26
	.data1 181
	.data1 40
	.data1 191
	.data1 230
	.data1 39
	.data1 44
	.data1 125
	.data1 114
	.data1 195
	.data1 64
	.data1 135
	.data1 190
	.data1 225
	.data1 148
	.data1 53
	.data1 202
	.data1 197
	.data1 168
	.data1 79
	.data1 106
	.data1 23
	.data1 4
	.data1 19
	.data1 34
	.data1 77
	.data1 144
	.data1 23
	.data1 146
	.data1 241
	.data1 156
	.data1 91
	.data1 122
	.data1 43
	.data1 136
	.data1 223
	.data1 70
	.data1 249
	.data1 52
	.data1 163
	.data1 46
	.data1 93
	.data1 96
	.data1 89
	.data1 30
	.data1 255
	.data1 52
	.data1 21
	.data1 214
	.data1 229
	.data1 72
	.data1 111
	.data1 10
	.data1 9
	.data1 156
	.data1 205
	.data1 126
	.data1 147
	.data1 48
	.data1 55
	.data1 50
	.data1 239
	.data1 252
	.data1 133
	.data1 38
	.data1 11
	.data1 232
	.data1 1
	.data1 166
	.data1 25
	.data1 108
	.data1 61
	.data1 206
	.data1 125
	.data1 0
	.data1 199
	.data1 126
	.data1 223
	.data1 44
	.data1 11
	.data1 118
	.data1 251
	.data1 24
	.data1 113
	.data1 170
	.data1 215
	.data1 60
	.data1 83
	.data1 30
	.data1 115
	.data1 48
	.data1 169
	.data1 210
	.data1 49
	.data1 92
	.data1 101
	.data1 58
	.data1 21
	.data1 184
	.data1 225
	.data1 6
	.data1 199
	.data1 244
	.data1 227
	.data1 146
	.data1 99
	.data1 96
	.data1 25
	.data1 222
	.data1 65
	.data1 140
	.data1 213
	.data1 22
	.data1 219
	.data1 136
	.data1 175
	.data1 182
	.data1 73
	.data1 36
	.data1 141
	.data1 190
	.data1 83
	.data1 112
	.data1 137
	.data1 114
	.data1 175
	.data1 188
	.data1 187
	.data1 102
	.data1 53
	.data1 168
	.data1 193
	.data1 154
	.data1 167
	.data1 172
	.data1 3
	.data1 242
	.data1 67
	.data1 64
	.data1 7
	.data1 62
	.data1 159
	.data1 236
	.data1 75
	.data1 182
	.data1 187
	.data1 40
	.data1 49
	.data1 234
	.data1 105
	.data1 124
	.data1 109
	.data1 162
	.data1 205
	.data1 16
	.data1 105
	.data1 238
	.data1 143
	.data1 28
	.data1 37
	.data1 6
	.data1 85
	.data1 248
	.data1 161
	.data1 58
	.data1 121
	.data1 180
	.data1 221
	.data1 174
	.data1 221
	.data1 32
	.data1 217
	.data1 98
	.data1 129
	.data1 76
	.data1 149
	.data1 170
	.data1 101
	.data1 200
	.data1 239
	.data1 118
	.data1 137
	.data1 28
	.data1 179
	.data1 254
	.data1 19
	.data1 80
	.data1 183
	.data1 178
	.data1 145
	.data1 124
	.data1 251
	.data1 166
	.data1 139
	.data1 152
	.data1 129
	.data1 38
	.data1 153
	.data1 20
	.data1 189
	.data1 78
	.data1 3
	.data1 128
	.data1 71
	.data1 254
	.data1 95
	.data1 84
	.data1 139
	.data1 10
	.data1 123
	.data1 152
	.data1 241
	.data1 214
	.data1 169
	.data1 68
	.data1 211
	.data1 98
	.data1 13
	.data1 80
	.data1 215
	.data1 82
	.data1 79
	.data1 36
	.data1 229
	.data1 70
	.data1 149
	.data1 56
	.data1 159
	.data1 134
	.data1 185
	.data1 140
	.data1 99
	.data1 18
	.data1 29
	.data1 224
	.data1 153
	.data1 94
	.data1 63
	.data1 244
	.data1 85
	.data1 150
	.data1 91
	.data1 248
	.data1 209
	.data1 202
	.data1 55
	.data1 92
	.data1 243
	.data1 194
	.data1 211
	.data1 240
	.data1 247
	.data1 242
	.data1 209
	.data1 196
	.data1 197
	.data1 26
	.data1 75
	.data1 40
	.data1 191
	.data1 26
	.data1 39
	.data1 44
	.data1 131
	.data1 142
	.data1 195
	.data1 64
	.data1 121
	.data1 190
	.data1 225
	.data1 148
	.data1 53
	.data1 54
	.data1 197
	.data1 88
	.data1 79
	.data1 106
	.data1 233
	.data1 252
	.data1 19
	.data1 34
	.data1 77
	.data1 144
	.data1 233
	.data1 146
	.data1 241
	.data1 100
	.data1 91
	.data1 134
	.data1 43
	.data1 136
	.data1 33
	.data1 70
	.data1 249
	.data1 204
	.data1 163
	.data1 210
	.data1 163
	.data1 96
	.data1 89
	.data1 226
	.data1 1
	.data1 52
	.data1 235
	.data1 214
	.data1 27
	.data1 72
	.data1 111
	.data1 246
	.data1 247
	.data1 156
	.data1 51
	.data1 130
	.data1 109
	.data1 208
	.data1 55
	.data1 50
	.data1 17
	.data1 252
	.data1 123
	.data1 218
	.data1 245
	.data1 232
	.data1 255
	.data1 90
	.data1 231
	.data1 108
	.data1 195
	.data1 50
	.data1 125
	.data1 0
	.data1 199
	.data1 130
	.data1 223
	.data1 212
	.data1 11
	.data1 138
	.data1 251
	.data1 232
	.data1 143
	.data1 86
	.data1 215
	.data1 196
	.data1 83
	.data1 30
	.data1 141
	.data1 48
	.data1 87
	.data1 46
	.data1 207
	.data1 92
	.data1 155
	.data1 58
	.data1 235
	.data1 184
	.data1 31
	.data1 6
	.data1 199
	.data1 12
	.data1 29
	.data1 146
	.data1 157
	.data1 160
	.data1 231
	.data1 34
	.data1 191
	.data1 116
	.data1 213
	.data1 22
	.data1 37
	.data1 136
	.data1 175
	.data1 74
	.data1 183
	.data1 36
	.data1 115
	.data1 66
	.data1 173
	.data1 144
	.data1 137
	.data1 142
	.data1 175
	.data1 188
	.data1 69
	.data1 102
	.data1 53
	.data1 168
	.data1 193
	.data1 102
	.data1 89
	.data1 172
	.data1 253
	.data1 242
	.data1 67
	.data1 192
	.data1 7
	.data1 62
	.data1 159
	.data1 20
	.data1 181
	.data1 182
	.data1 187
	.data1 216
	.data1 207
	.data1 22
	.data1 105
	.data1 132
	.data1 109
	.data1 162
	.data1 205
	.data1 16
	.data1 151
	.data1 18
	.data1 113
	.data1 228
	.data1 37
	.data1 6
	.data1 85
	.data1 8
	.data1 161
	.data1 58
	.data1 135
	.data1 76
	.data1 35
	.data1 174
	.data1 35
	.data1 224
	.data1 39
	.data1 158
	.data1 127
	.data1 180
	.data1 149
	.data1 86
	.data1 155
	.data1 200
	.data1 239
	.data1 118
	.data1 119
	.data1 28
	.data1 77
	.data1 254
	.data1 19
	.data1 176
	.data1 183
	.data1 78
	.data1 145
	.data1 132
	.data1 5
	.data1 90
	.data1 117
	.data1 152
	.data1 127
	.data1 218
	.data1 153
	.data1 20
	.data1 67
	.data1 178
	.data1 3
	.data1 128
	.data1 185
	.data1 254
	.data1 95
	.data1 172
	.data1 139
	.data1 246
	.data1 123
	.data1 104
	.data1 15
	.data1 42
	.data1 169
	.data1 68
	.data1 211
	.data1 98
	.data1 243
	.data1 80
	.data1 41
	.data1 174
	.data1 79
	.data1 36
	.data1 27
	.data1 186
	.data1 107
	.data1 56
	.data1 97
	.data1 134
	.data1 71
	.data1 116
	.data1 157
	.data1 238
	.data1 227
	.data1 32
	.data1 153
	.data1 162
	.data1 193
	.data1 244
	.data1 171
	.data1 150
	.data1 165
	.data1 248
	.data1 209
	.data1 54
	.data1 55
	.data1 164
	.data1 13
	.data1 194
	.data1 45
	.data1 16
	.data1 247
	.data1 242
	.data1 47
	.data1 60
	.data1 59
	.data1 26
	.data1 75
	.data1 40
	.data1 65
	.data1 230
	.data1 217
	.data1 44
	.data1 131
	.data1 142
	.data1 195
	.data1 192
	.data1 121
	.data1 190
	.data1 225
	.data1 108
	.data1 203
	.data1 202
	.data1 197
	.data1 168
	.data1 177
	.data1 150
	.data1 233
	.data1 252
	.data1 19
	.data1 34
	.data1 77
	.data1 144
	.data1 23
	.data1 110
	.data1 15
	.data1 100
	.data1 91
	.data1 122
	.data1 213
	.data1 120
	.data1 223
	.data1 70
	.data1 7
	.data1 52
	.data1 93
	.data1 46
	.data1 93
	.data1 160
	.data1 167
	.data1 226
	.data1 255
	.data1 204
	.data1 21
	.data1 42
	.data1 229
	.data1 72
	.data1 111
	.data1 246
	.data1 9
	.data1 100
	.data1 205
	.data1 126
	.data1 147
	.data1 48
	.data1 55
	.data1 206
	.data1 239
	.data1 4
	.data1 133
	.data1 218
	.data1 245
	.data1 232
	.data1 255
	.data1 166
	.data1 231
	.data1 108
	.data1 195
	.data1 50
	.data1 131
	.data1 0
	.data1 57
	.data1 130
	.data1 223
	.data1 44
	.data1 245
	.data1 118
	.data1 251
	.data1 232
	.data1 113
	.data1 86
	.data1 215
	.data1 196
	.data1 83
	.data1 30
	.data1 141
	.data1 48
	.data1 87
	.data1 46
	.data1 207
	.data1 92
	.data1 155
	.data1 198
	.data1 235
	.data1 72
	.data1 31
	.data1 250
	.data1 57
	.data1 244
	.data1 29
	.data1 110
	.data1 99
	.data1 160
	.data1 231
	.data1 34
	.data1 65
	.data1 116
	.data1 43
	.data1 22
	.data1 219
	.data1 136
	.data1 175
	.data1 74
	.data1 73
	.data1 220
	.data1 141
	.data1 190
	.data1 83
	.data1 112
	.data1 137
	.data1 142
	.data1 81
	.data1 68
	.data1 69
	.data1 154
	.data1 203
	.data1 88
	.data1 63
	.data1 154
	.data1 89
	.data1 172
	.data1 3
	.data1 242
	.data1 67
	.data1 192
	.data1 249
	.data1 62
	.data1 159
	.data1 20
	.data1 181
	.data1 74
	.data1 69
	.data1 216
	.data1 49
	.data1 22
	.data1 105
	.data1 132
	.data1 109
	.data1 162
	.data1 205
	.data1 16
	.data1 151
	.data1 18
	.data1 113
	.data1 228
	.data1 219
	.data1 250
	.data1 171
	.data1 8
	.data1 95
	.data1 58
	.data1 135
	.data1 180
	.data1 35
	.data1 82
	.data1 221
	.data1 224
	.data1 39
	.data1 98
	.data1 129
	.data1 180
	.data1 107
	.data1 86
	.data1 101
	.data1 200
	.data1 239
	.data1 118
	.data1 119
	.data1 228
	.data1 179
	.data1 2
	.data1 237
	.data1 80
	.data1 183
	.data1 78
	.data1 111
	.data1 124
	.data1 5
	.data1 90
	.data1 117
	.data1 104
	.data1 127
	.data1 38
	.data1 153
	.data1 20
	.data1 67
	.data1 178
	.data1 253
	.data1 128
	.data1 185
	.data1 254
	.data1 95
	.data1 172
	.data1 117
	.data1 10
	.data1 123
	.data1 152
	.data1 241
	.data1 42
	.data1 87
	.data1 188
	.data1 211
	.data1 98
	.data1 243
	.data1 80
	.data1 215
	.data1 82
	.data1 79
	.data1 36
	.data1 27
	.data1 186
	.data1 107
	.data1 200
	.data1 159
	.data1 122
	.data1 71
	.data1 140
	.data1 157
	.data1 238
	.data1 29
	.data1 224
	.data1 153
	.data1 94
	.data1 63
	.data1 244
	.data1 85
	.data1 106
	.data1 91
	.data1 248
	.data1 47
	.data1 54
	.data1 201
	.data1 164
	.data1 243
	.data1 62
	.data1 211
	.data1 240
	.data1 247
	.data1 242
	.data1 47
	.data1 196
	.data1 197
	.data1 230
	.data1 181
	.data1 216
	.data1 65
	.data1 26
	.data1 217
	.data1 44
	.data1 125
	.data1 114
	.data1 195
	.data1 192
	.data1 135
	.data1 190
	.data1 31
	.data1 148
	.data1 203
	.data1 202
	.data1 59
	.data1 88
	.data1 79
	.data1 150
	.data1 233
	.data1 252
	.data1 19
	.data1 34
	.data1 77
	.data1 144
	.data1 233
	.data1 146
	.data1 15
	.data1 100
	.data1 165
	.data1 122
	.data1 213
	.data1 136
	.data1 223
	.data1 70
	.data1 249
	.data1 204
	.data1 93
	.data1 46
	.data1 93
	.data1 96
	.data1 167
	.data1 30
	.data1 1
	.data1 204
	.data1 21
	.data1 42
	.data1 27
	.data1 72

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

	.comm	qsz,4,4
	.comm	qcmp,4,4
	.comm	thresh,4,4
	.comm	mthresh,4,4
	.section	.data
	.align	4                       ## @str
str::
	.data1 45
	.data1 49
	.data1 0
.skip 5

	.align	4                       ## @str2
str2::
	.data1 54
	.data1 54
	.data1 54
	.data1 0
.skip 4

.import printf
.import puts
.import memcpy

