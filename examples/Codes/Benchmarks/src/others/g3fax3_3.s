.section .text

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @memset
memset::
## BB#0:                                ## %entry
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB0_6
;;
## BB#1:                                ## %while.body.lr.ph
	c0	and $r0.13 = $r0.5, -32
	c0	mov $r0.16 = 0
;;
	c0	cmpeq $b0.0 = $r0.13, 0
	c0	mov $r0.12 = $r0.3
	c0	mov $r0.11 = $r0.5
;;
;;
	c0	br $b0.0, LBB0_4
;;
## BB#2:                                ## %vector.ph
	c0	sub $r0.11 = $r0.5, $r0.13
	c0	add $r0.12 = $r0.3, $r0.13
	c0	and $r0.14 = $r0.5, -32
	c0	add $r0.15 = $r0.3, 16
;;
LBB0_3:                                 ## %vector.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.14 = $r0.14, -32
	c0	stb -15[$r0.15] = $r0.4
;;
	c0	stb -16[$r0.15] = $r0.4
;;
	c0	stb -14[$r0.15] = $r0.4
;;
	c0	stb -13[$r0.15] = $r0.4
;;
	c0	stb -12[$r0.15] = $r0.4
;;
	c0	stb -11[$r0.15] = $r0.4
;;
	c0	stb -10[$r0.15] = $r0.4
;;
	c0	stb -9[$r0.15] = $r0.4
;;
	c0	stb -8[$r0.15] = $r0.4
;;
	c0	stb -7[$r0.15] = $r0.4
;;
	c0	stb -6[$r0.15] = $r0.4
;;
	c0	stb -5[$r0.15] = $r0.4
;;
	c0	stb -4[$r0.15] = $r0.4
;;
	c0	stb -3[$r0.15] = $r0.4
;;
	c0	stb -2[$r0.15] = $r0.4
	c0	cmpne $b0.0 = $r0.14, 0
	c0	add $r0.16 = $r0.15, 32
;;
	c0	stb -1[$r0.15] = $r0.4
;;
	c0	stb 15[$r0.15] = $r0.4
;;
	c0	stb 14[$r0.15] = $r0.4
;;
	c0	stb 13[$r0.15] = $r0.4
;;
	c0	stb 12[$r0.15] = $r0.4
;;
	c0	stb 11[$r0.15] = $r0.4
;;
	c0	stb 10[$r0.15] = $r0.4
;;
	c0	stb 9[$r0.15] = $r0.4
;;
	c0	stb 8[$r0.15] = $r0.4
;;
	c0	stb 7[$r0.15] = $r0.4
;;
	c0	stb 6[$r0.15] = $r0.4
;;
	c0	stb 5[$r0.15] = $r0.4
;;
	c0	stb 4[$r0.15] = $r0.4
;;
	c0	stb 3[$r0.15] = $r0.4
;;
	c0	stb 2[$r0.15] = $r0.4
;;
	c0	stb 1[$r0.15] = $r0.4
;;
	c0	stb 0[$r0.15] = $r0.4
	c0	mov $r0.15 = $r0.16
	c0	mov $r0.16 = $r0.13
	c0	br $b0.0, LBB0_3
;;
LBB0_4:                                 ## %middle.block
	c0	cmpeq $b0.0 = $r0.16, $r0.5
;;
;;
	c0	br $b0.0, LBB0_6
;;
LBB0_5:                                 ## %while.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.11 = $r0.11, -1
	c0	add $r0.13 = $r0.12, 1
;;
	c0	cmpne $b0.0 = $r0.11, 0
	c0	stb 0[$r0.12] = $r0.4
	c0	mov $r0.12 = $r0.13
;;
;;
	c0	br $b0.0, LBB0_5
;;
LBB0_6:                                 ## %while.end
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @getbit
getbit::
## BB#0:                                ## %entry
	c0	mov $r0.11 = bitsleft
;;
	c0	ldw $r0.12 = 0[$r0.11]
;;
;;
	c0	add $r0.13 = $r0.12, -1
	c0	cmplt $b0.0 = $r0.12, 1
;;
	c0	stw 0[$r0.11] = $r0.13
;;
	c0	br $b0.0, LBB1_2
;;
## BB#1:                                ## %entry.if.end3_crit_edge
	c0	mov $r0.11 = lastbyte
;;
	c0	ldw $r0.12 = 0[$r0.11]
	c0	goto LBB1_5
;;
LBB1_2:                                 ## %if.then
	c0	mov $r0.13 = nextbyte
	c0	mov $r0.14 = fax
;;
	c0	ldw $r0.12 = 0[$r0.13]
	c0	add $r0.14 = $r0.14, 1792
;;
;;
	c0	cmpltu $b0.0 = $r0.12, $r0.14
;;
;;
	c0	br $b0.0, LBB1_4
;;
## BB#3:                                ## %if.then2
	c0	mov $r0.12 = 0
	c0	mov $r0.11 = lastbyte
;;
	c0	mov $r0.13 = eof
	c0	mov $r0.14 = 1
	c0	stw 0[$r0.11] = $r0.12
;;
	c0	stb 0[$r0.13] = $r0.14
	c0	goto LBB1_5
;;
LBB1_4:                                 ## %if.else
	c0	add $r0.14 = $r0.12, 1
	c0	mov $r0.15 = lastbyte
;;
	c0	stw 0[$r0.13] = $r0.14
	c0	mov $r0.13 = 7
;;
	c0	ldbu $r0.12 = 0[$r0.12]
;;
;;
	c0	stw 0[$r0.15] = $r0.12
;;
	c0	stw 0[$r0.11] = $r0.13
;;
LBB1_5:                                 ## %if.end3
	c0	mov $r0.11 = 1
	c0	mov $r0.13 = lastbyte
;;
	c0	shru $r0.11 = $r0.12, $r0.11
;;
.return ret($r0.3:s32)
	c0	stw 0[$r0.13] = $r0.11
	c0	and $r0.3 = $r0.12, 1
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @skiptoeol
skiptoeol::
## BB#0:                                ## %entry
	c0	mov $r0.18 = 0
	c0	mov $r0.11 = bitsleft
;;
	c0	mov $r0.12 = nextbyte
	c0	mov $r0.13 = fax
;;
	c0	add $r0.13 = $r0.13, 1792
	c0	mov $r0.14 = lastbyte
;;
	c0	mov $r0.19 = 7
	c0	mov $r0.15 = eof
	c0	mov $r0.16 = 1
;;
	c0	mov $r0.20 = $r0.18
;;
LBB2_2:                                 ## %for.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.21 = 0[$r0.11]
;;
;;
	c0	add $r0.17 = $r0.21, -1
	c0	cmplt $b0.0 = $r0.21, 1
;;
	c0	stw 0[$r0.11] = $r0.17
;;
	c0	br $b0.0, LBB2_4
;;
## BB#3:                                ## %entry.if.end3_crit_edge.i
                                        ##   in Loop: Header=BB2_2 Depth=1
	c0	ldw $r0.21 = 0[$r0.14]
	c0	goto LBB2_7
;;
LBB2_4:                                 ## %if.then.i
                                        ##   in Loop: Header=BB2_2 Depth=1
	c0	ldw $r0.21 = 0[$r0.12]
;;
;;
	c0	cmpltu $b0.0 = $r0.21, $r0.13
;;
;;
	c0	brf $b0.0, LBB2_5
;;
## BB#6:                                ## %if.else.i
                                        ##   in Loop: Header=BB2_2 Depth=1
	c0	add $r0.17 = $r0.21, 1
;;
	c0	stw 0[$r0.12] = $r0.17
;;
	c0	ldbu $r0.21 = 0[$r0.21]
;;
;;
	c0	stw 0[$r0.14] = $r0.21
;;
	c0	stw 0[$r0.11] = $r0.19
	c0	mov $r0.17 = $r0.19
;;
LBB2_7:                                 ## %getbit.exit
                                        ##   in Loop: Header=BB2_2 Depth=1
	c0	and $r0.22 = $r0.21, 1
	c0	shru $r0.21 = $r0.21, $r0.16
;;
	c0	cmpeq $b0.0 = $r0.22, 0
	c0	stw 0[$r0.14] = $r0.21
;;
;;
	c0	br $b0.0, LBB2_1
;;
	c0	goto LBB2_2
;;
LBB2_5:                                 ## %getbit.exit.thread
                                        ##   in Loop: Header=BB2_2 Depth=1
	c0	stb 0[$r0.15] = $r0.16
;;
	c0	stw 0[$r0.14] = $r0.18
;;
LBB2_1:                                 ## %select.unfold
                                        ##   in Loop: Header=BB2_2 Depth=1
	c0	add $r0.20 = $r0.20, 1
;;
	c0	cmpgt $b0.0 = $r0.20, 10
;;
;;
	c0	br $b0.0, LBB2_8
;;
	c0	goto LBB2_2
;;
LBB2_11:                                ## %getbit.exit17.thread
                                        ##   in Loop: Header=BB2_8 Depth=1
	c0	mov $r0.17 = 0
	c0	stb 0[$r0.15] = $r0.16
;;
	c0	stw 0[$r0.14] = $r0.17
	c0	mov $r0.17 = $r0.18
;;
LBB2_8:                                 ## %while.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.18 = $r0.17, -1
	c0	cmplt $b0.0 = $r0.17, 1
;;
	c0	stw 0[$r0.11] = $r0.18
;;
	c0	br $b0.0, LBB2_10
;;
## BB#9:                                ## %entry.if.end3_crit_edge.i8
                                        ##   in Loop: Header=BB2_8 Depth=1
	c0	ldw $r0.19 = 0[$r0.14]
	c0	mov $r0.17 = $r0.18
	c0	goto LBB2_13
;;
LBB2_10:                                ## %if.then.i10
                                        ##   in Loop: Header=BB2_8 Depth=1
	c0	ldw $r0.19 = 0[$r0.12]
;;
;;
	c0	cmpltu $b0.0 = $r0.19, $r0.13
;;
;;
	c0	brf $b0.0, LBB2_11
;;
## BB#12:                               ## %if.else.i14
                                        ##   in Loop: Header=BB2_8 Depth=1
	c0	add $r0.18 = $r0.19, 1
	c0	mov $r0.17 = 7
;;
	c0	stw 0[$r0.12] = $r0.18
;;
	c0	ldbu $r0.19 = 0[$r0.19]
;;
;;
	c0	stw 0[$r0.14] = $r0.19
;;
	c0	stw 0[$r0.11] = $r0.17
;;
LBB2_13:                                ## %getbit.exit17
                                        ##   in Loop: Header=BB2_8 Depth=1
	c0	and $r0.18 = $r0.19, 1
	c0	shru $r0.19 = $r0.19, $r0.16
;;
	c0	cmpeq $b0.0 = $r0.18, 0
	c0	stw 0[$r0.14] = $r0.19
;;
;;
	c0	br $b0.0, LBB2_8
;;
## BB#14:                               ## %while.end
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @rowout
rowout::
## BB#0:                                ## %entry
	c0	mov $r0.11 = sum
;;
	c0	ldw $r0.12 = 0[$r0.11]
	c0	cmplt $b0.0 = $r0.4, 1
;;
;;
	c0	br $b0.0, LBB3_8
;;
## BB#1:                                ## %for.body.preheader
	c0	mov $r0.16 = 0
	c0	cmpeq $b0.0 = $r0.4, 0
	c0	mov $r0.13 = $r0.3
;;
;;
	c0	br $b0.0, LBB3_6
;;
## BB#2:                                ## %overflow.checked
	c0	mov $r0.16 = 0
	c0	and $r0.14 = $r0.4, -8
;;
	c0	cmpeq $b0.0 = $r0.14, 0
	c0	mov $r0.13 = $r0.3
	c0	mov $r0.17 = $r0.16
	c0	mov $r0.18 = $r0.16
;;
	c0	mov $r0.19 = $r0.16
	c0	mov $r0.15 = $r0.16
	c0	mov $r0.20 = $r0.16
	c0	mov $r0.21 = $r0.16
;;
	c0	mov $r0.22 = $r0.16
	c0	br $b0.0, LBB3_5
;;
## BB#3:                                ## %vector.body.preheader
	c0	add $r0.13 = $r0.3, $r0.14
	c0	mov $r0.15 = 0
	c0	and $r0.23 = $r0.4, -8
	c0	add $r0.24 = $r0.3, 4
;;
	c0	mov $r0.17 = $r0.16
	c0	mov $r0.18 = $r0.16
	c0	mov $r0.19 = $r0.16
	c0	mov $r0.20 = $r0.15
;;
	c0	mov $r0.21 = $r0.15
	c0	mov $r0.22 = $r0.15
;;
LBB3_4:                                 ## %vector.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldbu $r0.16 = 2[$r0.24]
;;
	c0	ldbu $r0.25 = -4[$r0.24]
;;
	c0	ldbu $r0.26 = -3[$r0.24]
;;
	c0	add $r0.12 = $r0.25, $r0.12
	c0	ldbu $r0.25 = 0[$r0.24]
;;
	c0	add $r0.17 = $r0.26, $r0.17
	c0	ldbu $r0.26 = -2[$r0.24]
	c0	add $r0.21 = $r0.16, $r0.21
;;
	c0	add $r0.15 = $r0.25, $r0.15
	c0	add $r0.23 = $r0.23, -8
	c0	ldbu $r0.16 = 3[$r0.24]
;;
	c0	add $r0.18 = $r0.26, $r0.18
	c0	ldbu $r0.25 = 1[$r0.24]
;;
	c0	ldbu $r0.26 = -1[$r0.24]
	c0	add $r0.22 = $r0.16, $r0.22
;;
	c0	add $r0.20 = $r0.25, $r0.20
	c0	cmpne $b0.0 = $r0.23, 0
;;
	c0	add $r0.19 = $r0.26, $r0.19
	c0	add $r0.24 = $r0.24, 8
	c0	mov $r0.16 = $r0.14
;;
	c0	br $b0.0, LBB3_4
;;
LBB3_5:                                 ## %middle.block
	c0	add $r0.12 = $r0.15, $r0.12
	c0	add $r0.14 = $r0.20, $r0.17
	c0	add $r0.15 = $r0.21, $r0.18
	c0	add $r0.17 = $r0.22, $r0.19
;;
	c0	add $r0.12 = $r0.12, $r0.15
	c0	add $r0.14 = $r0.14, $r0.17
;;
	c0	add $r0.12 = $r0.12, $r0.14
	c0	cmpeq $b0.0 = $r0.16, $r0.4
;;
;;
	c0	br $b0.0, LBB3_8
;;
LBB3_6:                                 ## %for.body.preheader38
	c0	sub $r0.14 = $r0.4, $r0.16
;;
LBB3_7:                                 ## %for.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.14 = $r0.14, -1
	c0	ldbu $r0.15 = 0[$r0.13]
	c0	add $r0.13 = $r0.13, 1
;;
;;
	c0	add $r0.12 = $r0.15, $r0.12
	c0	cmpne $b0.0 = $r0.14, 0
;;
;;
	c0	br $b0.0, LBB3_7
;;
LBB3_8:                                 ## %for.end
.return ret($r0.3:s32)
	c0	stw 0[$r0.11] = $r0.12
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg() ## @main
main::
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
	c0	mov $r0.24 = eof
;;
	c0	stw 28[$r0.1] = $r0.24
	c0	mov $r0.13 = 0
	c0	mov $r0.11 = sum
;;
	c0	stw 44[$r0.1] = $r0.11
	c0	mov $r0.59 = lastbyte
;;
	c0	stb 0[$r0.24] = $r0.13
;;
	c0	stw 0[$r0.11] = $r0.13
	c0	mtb $b0.0 = $r0.0
	c0	mov $r0.60 = bitsleft
;;
	c0	stw 0[$r0.59] = $r0.13
	c0	mov $r0.11 = fax
;;
	c0	stw 0[$r0.60] = $r0.13
	c0	mov $r0.61 = nextbyte
;;
	c0	stw 0[$r0.61] = $r0.11
	c0	add $r0.14 = $r0.11, 1792
	c0	mov $r0.16 = 7
;;
	c0	mov $r0.62 = 1
	c0	mov $r0.12 = $r0.13
	c0	mov $r0.15 = $r0.13
	c0	mov $r0.17 = $r0.13
;;
LBB4_2:                                 ## %for.cond.outer.for.cond.outer.split_crit_edge.i
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB4_3 Depth 2
	c0	mov $r0.18 = $r0.15
;;
LBB4_3:                                 ## %for.body.i
                                        ##   Parent Loop BB4_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	add $r0.15 = $r0.18, -1
	c0	cmpgt $b0.1 = $r0.18, 0
;;
	c0	stw 0[$r0.60] = $r0.15
;;
	c0	br $b0.1, LBB4_7
;;
## BB#4:                                ## %if.then.i.i
                                        ##   in Loop: Header=BB4_3 Depth=2
	c0	cmpltu $b0.1 = $r0.11, $r0.14
;;
;;
	c0	brf $b0.1, LBB4_5
;;
## BB#6:                                ## %if.else.i.i
                                        ##   in Loop: Header=BB4_3 Depth=2
	c0	add $r0.15 = $r0.11, 1
;;
	c0	stw 0[$r0.61] = $r0.15
;;
	c0	ldbu $r0.12 = 0[$r0.11]
;;
;;
	c0	stw 0[$r0.59] = $r0.12
;;
	c0	stw 0[$r0.60] = $r0.16
	c0	mov $r0.11 = $r0.15
	c0	mov $r0.15 = $r0.16
;;
LBB4_7:                                 ## %getbit.exit.i
                                        ##   in Loop: Header=BB4_3 Depth=2
	c0	and $r0.18 = $r0.12, 1
	c0	shru $r0.12 = $r0.12, $r0.62
;;
	c0	cmpeq $b0.1 = $r0.18, 0
	c0	stw 0[$r0.59] = $r0.12
	c0	mov $r0.18 = $r0.15
;;
;;
	c0	br $b0.1, LBB4_1
;;
	c0	goto LBB4_3
;;
LBB4_5:                                 ## %getbit.exit.thread.i
                                        ##   in Loop: Header=BB4_2 Depth=1
	c0	stb 0[$r0.24] = $r0.62
;;
	c0	stw 0[$r0.59] = $r0.13
	c0	mov $r0.12 = $r0.13
;;
LBB4_1:                                 ## %select.unfold.i
                                        ##   in Loop: Header=BB4_2 Depth=1
	c0	add $r0.17 = $r0.17, 1
;;
	c0	cmpeq $b0.1 = $r0.17, 11
;;
;;
	c0	br $b0.1, LBB4_11
;;
	c0	goto LBB4_2
;;
LBB4_10:                                ## %getbit.exit17.thread.i
                                        ##   in Loop: Header=BB4_11 Depth=1
	c0	mtb $b0.0 = $r0.0
	c0	mov $r0.14 = 1
	c0	mov $r0.12 = 0
;;
	c0	stb 0[$r0.24] = $r0.14
;;
	c0	stw 0[$r0.59] = $r0.12
	c0	mov $r0.15 = $r0.13
;;
LBB4_11:                                ## %while.cond.i.outer
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB4_8 Depth 2
	c0	goto LBB4_8
;;
LBB4_8:                                 ## %while.cond.i
                                        ##   Parent Loop BB4_11 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	add $r0.13 = $r0.15, -1
	c0	cmpgt $b0.1 = $r0.15, 0
;;
	c0	stw 0[$r0.60] = $r0.13
;;
	c0	br $b0.1, LBB4_13
;;
## BB#9:                                ## %if.then.i10.i
                                        ##   in Loop: Header=BB4_8 Depth=2
	c0	mov $r0.12 = fax
;;
	c0	add $r0.12 = $r0.12, 1792
;;
	c0	cmpltu $b0.1 = $r0.11, $r0.12
;;
;;
	c0	brf $b0.1, LBB4_10
;;
## BB#12:                               ## %if.else.i14.i
                                        ##   in Loop: Header=BB4_8 Depth=2
	c0	add $r0.14 = $r0.11, 1
	c0	mov $r0.13 = 7
;;
	c0	stw 0[$r0.61] = $r0.14
;;
	c0	ldbu $r0.12 = 0[$r0.11]
;;
;;
	c0	stw 0[$r0.59] = $r0.12
;;
	c0	stw 0[$r0.60] = $r0.13
	c0	mov $r0.11 = $r0.14
;;
LBB4_13:                                ## %getbit.exit17.i
                                        ##   in Loop: Header=BB4_8 Depth=2
	c0	and $r0.14 = $r0.12, 1
	c0	shru $r0.12 = $r0.12, $r0.62
;;
	c0	cmpeq $b0.1 = $r0.14, 0
	c0	stw 0[$r0.59] = $r0.12
	c0	mov $r0.15 = $r0.13
;;
;;
	c0	br $b0.1, LBB4_8
;;
## BB#14:                               ## %for.cond.preheader
	c0	mov $r0.63 = 0
	c0	br $b0.0, LBB4_92
;;
LBB4_15:                                ## %for.body
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB4_29 Depth 2
                                        ##       Child Loop BB4_30 Depth 3
                                        ##     Child Loop BB4_61 Depth 2
                                        ##       Child Loop BB4_62 Depth 3
                                        ##     Child Loop BB4_70 Depth 2
                                        ##       Child Loop BB4_67 Depth 3
                                        ##     Child Loop BB4_39 Depth 2
                                        ##       Child Loop BB4_40 Depth 3
                                        ##     Child Loop BB4_48 Depth 2
                                        ##       Child Loop BB4_45 Depth 3
                                        ##     Child Loop BB4_89 Depth 2
	c0	mov $r0.57 = $r0.24
	c0	mov $r0.3 = str4
;;
	c0	ldw $r0.12 = 0[$r0.60]
;;
;;
	c0	add $r0.11 = $r0.12, -1
	c0	cmplt $b0.0 = $r0.12, 1
;;
	c0	stw 0[$r0.60] = $r0.11
;;
	c0	br $b0.0, LBB4_17
;;
## BB#16:                               ## %entry.if.end3_crit_edge.i273
                                        ##   in Loop: Header=BB4_15 Depth=1
	c0	ldw $r0.12 = 0[$r0.59]
	c0	mov $r0.24 = $r0.57
	c0	goto LBB4_20
;;
LBB4_17:                                ## %if.then.i275
                                        ##   in Loop: Header=BB4_15 Depth=1
	c0	mov $r0.13 = fax
	c0	ldw $r0.12 = 0[$r0.61]
;;
	c0	add $r0.13 = $r0.13, 1792
;;
	c0	cmpltu $b0.0 = $r0.12, $r0.13
;;
;;
	c0	br $b0.0, LBB4_19
;;
## BB#18:                               ## %if.then2.i276
                                        ##   in Loop: Header=BB4_15 Depth=1
	c0	mov $r0.12 = 0
	c0	mov $r0.13 = 1
;;
	c0	stw 0[$r0.59] = $r0.12
	c0	mov $r0.24 = $r0.57
;;
	c0	stb 0[$r0.24] = $r0.13
	c0	goto LBB4_20
;;
LBB4_19:                                ## %if.else.i279
                                        ##   in Loop: Header=BB4_15 Depth=1
	c0	add $r0.13 = $r0.12, 1
	c0	mov $r0.11 = 7
;;
	c0	stw 0[$r0.61] = $r0.13
;;
	c0	ldbu $r0.12 = 0[$r0.12]
;;
;;
	c0	stw 0[$r0.59] = $r0.12
;;
	c0	stw 0[$r0.60] = $r0.11
	c0	mov $r0.24 = $r0.57
;;
LBB4_20:                                ## %getbit.exit282
                                        ##   in Loop: Header=BB4_15 Depth=1
	c0	shl $r0.13 = $r0.12, $r0.62
	c0	shru $r0.14 = $r0.12, $r0.62
	c0	cmpgt $b0.0 = $r0.11, 0
;;
	c0	stw 0[$r0.59] = $r0.14
	c0	and $r0.13 = $r0.13, 2
	c0	add $r0.12 = $r0.11, -1
;;
	c0	stw 0[$r0.60] = $r0.12
	c0	br $b0.0, LBB4_24
;;
## BB#21:                               ## %if.then.i262
                                        ##   in Loop: Header=BB4_15 Depth=1
	c0	mov $r0.14 = fax
	c0	ldw $r0.11 = 0[$r0.61]
;;
	c0	add $r0.14 = $r0.14, 1792
;;
	c0	cmpltu $b0.0 = $r0.11, $r0.14
;;
;;
	c0	br $b0.0, LBB4_23
;;
## BB#22:                               ## %if.then2.i263
                                        ##   in Loop: Header=BB4_15 Depth=1
	c0	mov $r0.14 = 0
	c0	mov $r0.11 = 1
;;
	c0	stw 0[$r0.59] = $r0.14
;;
	c0	stb 0[$r0.24] = $r0.11
	c0	goto LBB4_24
;;
LBB4_23:                                ## %if.else.i266
                                        ##   in Loop: Header=BB4_15 Depth=1
	c0	add $r0.14 = $r0.11, 1
	c0	mov $r0.12 = 7
;;
	c0	stw 0[$r0.61] = $r0.14
;;
	c0	ldbu $r0.14 = 0[$r0.11]
;;
;;
	c0	stw 0[$r0.59] = $r0.14
;;
	c0	stw 0[$r0.60] = $r0.12
;;
LBB4_24:                                ## %getbit.exit269
                                        ##   in Loop: Header=BB4_15 Depth=1
	c0	shru $r0.15 = $r0.14, $r0.62
	c0	and $r0.11 = $r0.14, 1
;;
	c0	or $r0.11 = $r0.11, $r0.13
	c0	cmpgt $b0.0 = $r0.12, 0
	c0	stw 0[$r0.59] = $r0.15
;;
	c0	shl $r0.11 = $r0.11, $r0.62
	c0	add $r0.12 = $r0.12, -1
;;
	c0	stw 0[$r0.60] = $r0.12
	c0	br $b0.0, LBB4_28
;;
## BB#25:                               ## %if.then.i249
                                        ##   in Loop: Header=BB4_15 Depth=1
	c0	mov $r0.14 = fax
	c0	ldw $r0.13 = 0[$r0.61]
;;
	c0	add $r0.14 = $r0.14, 1792
;;
	c0	cmpltu $b0.0 = $r0.13, $r0.14
;;
;;
	c0	br $b0.0, LBB4_27
;;
## BB#26:                               ## %if.then2.i250
                                        ##   in Loop: Header=BB4_15 Depth=1
	c0	mov $r0.15 = 0
	c0	mov $r0.13 = 1
;;
	c0	stw 0[$r0.59] = $r0.15
;;
	c0	stb 0[$r0.24] = $r0.13
	c0	goto LBB4_28
;;
LBB4_27:                                ## %if.else.i253
                                        ##   in Loop: Header=BB4_15 Depth=1
	c0	add $r0.14 = $r0.13, 1
	c0	mov $r0.12 = 7
;;
	c0	stw 0[$r0.61] = $r0.14
;;
	c0	ldbu $r0.15 = 0[$r0.13]
;;
;;
	c0	stw 0[$r0.59] = $r0.15
;;
	c0	stw 0[$r0.60] = $r0.12
;;
LBB4_28:                                ## %getbit.exit256
                                        ##   in Loop: Header=BB4_15 Depth=1
	c0	mov $r0.14 = g3white
	c0	shru $r0.58 = $r0.15, $r0.62
;;
	c0	stw 0[$r0.59] = $r0.58
	c0	and $r0.13 = $r0.15, 1
;;
	c0	ldb $r0.17 = 0[$r0.24]
	c0	or $r0.16 = $r0.13, $r0.11
	c0	add $r0.15 = $r0.14, 2304
;;
	c0	mov $r0.11 = 0
;;
	c0	mtb $b0.2 = $r0.17
	c0	mov $r0.17 = $r0.11
	c0	mov $r0.20 = $r0.11
;;
LBB4_29:                                ## %for.cond10.outer
                                        ##   Parent Loop BB4_15 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB4_30 Depth 3
	c0	mfb $r0.13 = $b0.2
;;
	c0	mtb $b0.0 = $r0.13
;;
LBB4_30:                                ## %for.cond10
                                        ##   Parent Loop BB4_15 Depth=1
                                        ##     Parent Loop BB4_29 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	c0	mov $r0.13 = $r0.63
	c0	br $b0.0, LBB4_88
;;
## BB#31:                               ## %for.body13
                                        ##   in Loop: Header=BB4_30 Depth=3
	c0	mtb $b0.0 = $r0.0
	c0	shl $r0.13 = $r0.16, $r0.62
	c0	add $r0.57 = $r0.12, -1
	c0	cmpgt $b0.1 = $r0.12, 0
;;
	c0	stw 0[$r0.60] = $r0.57
	c0	and $r0.12 = $r0.13, 510
;;
	c0	br $b0.1, LBB4_35
;;
## BB#32:                               ## %if.then.i236
                                        ##   in Loop: Header=BB4_30 Depth=3
	c0	mov $r0.16 = fax
	c0	ldw $r0.13 = 0[$r0.61]
;;
	c0	add $r0.16 = $r0.16, 1792
;;
	c0	cmpltu $b0.1 = $r0.13, $r0.16
;;
;;
	c0	br $b0.1, LBB4_34
;;
## BB#33:                               ## %if.then2.i237
                                        ##   in Loop: Header=BB4_30 Depth=3
	c0	mtb $b0.2 = $r0.0
	c0	mov $r0.58 = 0
;;
	c0	stw 0[$r0.59] = $r0.58
	c0	mov $r0.13 = 1
;;
	c0	stb 0[$r0.24] = $r0.13
	c0	mfb $r0.13 = $b0.2
;;
	c0	mtb $b0.0 = $r0.13
	c0	goto LBB4_35
;;
LBB4_34:                                ## %if.else.i240
                                        ##   in Loop: Header=BB4_30 Depth=3
	c0	add $r0.16 = $r0.13, 1
;;
	c0	stw 0[$r0.61] = $r0.16
	c0	mov $r0.57 = 7
;;
	c0	ldbu $r0.58 = 0[$r0.13]
;;
;;
	c0	stw 0[$r0.59] = $r0.58
;;
	c0	stw 0[$r0.60] = $r0.57
;;
LBB4_35:                                ## %getbit.exit243
                                        ##   in Loop: Header=BB4_30 Depth=3
	c0	and $r0.13 = $r0.58, 1
;;
	c0	or $r0.16 = $r0.13, $r0.12
	c0	shru $r0.58 = $r0.58, $r0.62
;;
	c0	zxtb $r0.13 = $r0.16
	c0	stw 0[$r0.59] = $r0.58
;;
	c0	add $r0.12 = $r0.14, $r0.13
;;
	c0	ldbu $r0.12 = 0[$r0.12]
;;
;;
	c0	cmpne $b0.1 = $r0.12, 0
;;
;;
	c0	br $b0.1, LBB4_51
;;
## BB#36:                               ## %if.then
                                        ##   in Loop: Header=BB4_30 Depth=3
	c0	add $r0.14 = $r0.14, 256
;;
	c0	cmpltu $b0.1 = $r0.14, $r0.15
	c0	mov $r0.12 = $r0.57
;;
;;
	c0	br $b0.1, LBB4_30
;;
	c0	goto LBB4_37
;;
LBB4_51:                                ## %if.end29
                                        ##   in Loop: Header=BB4_29 Depth=2
	c0	add $r0.13 = $r0.12, -1
;;
	c0	cmplt $b0.0 = $r0.13, 64
;;
;;
	c0	br $b0.0, LBB4_57
;;
## BB#52:                               ## %if.then32
                                        ##   in Loop: Header=BB4_29 Depth=2
	c0	cmplt $b0.0 = $r0.13, 254
;;
;;
	c0	brf $b0.0, LBB4_53
;;
## BB#56:                               ## %if.end44
                                        ##   in Loop: Header=BB4_29 Depth=2
	c0	mov $r0.13 = 6
;;
	c0	shl $r0.12 = $r0.12, $r0.13
;;
	c0	add $r0.11 = $r0.11, $r0.12
;;
	c0	add $r0.11 = $r0.11, -4160
	c0	mov $r0.13 = $r0.17
	c0	goto LBB4_74
;;
LBB4_57:                                ## %if.else46
                                        ##   in Loop: Header=BB4_29 Depth=2
	c0	add $r0.13 = $r0.13, $r0.11
;;
	c0	add $r0.14 = $r0.13, $r0.20
	c0	mov $r0.15 = 1728
;;
	c0	sub $r0.15 = $r0.15, $r0.20
	c0	cmpgt $b0.0 = $r0.14, 1728
;;
;;
	c0	slct $r0.13 = $b0.0, $r0.15, $r0.13
;;
	c0	cmplt $b0.0 = $r0.13, 1
;;
;;
	c0	br $b0.0, LBB4_59
;;
## BB#58:                               ## %for.body58.lr.ph
                                        ##   in Loop: Header=BB4_29 Depth=2
	c0	mov $r0.13 = 0
;;
	c0	sub $r0.11 = $r0.13, $r0.11
;;
	c0	sub $r0.11 = $r0.11, $r0.20
;;
	c0	sub $r0.11 = $r0.11, $r0.12
	c0	mov $r0.12 = rowbuf
;;
	c0	max $r0.11 = $r0.11, -1729
	c0	add $r0.3 = $r0.12, $r0.20
;;
	c0	add $r0.12 = $r0.20, $r0.11
;;
	c0	cmpgt $b0.0 = $r0.12, -2
	c0	add $r0.12 = $r0.12, 1
;;
;;
	c0	slct $r0.12 = $b0.0, $r0.12, -1
;;
	c0	sub $r0.13 = $r0.12, $r0.20
	c0	sub $r0.12 = $r0.12, $r0.11
;;
	c0	stw 32[$r0.1] = $r0.12
	c0	sub $r0.5 = $r0.13, $r0.11
	c0	mov $r0.4 = $r0.17
	c0	mfb $r0.11 = $b0.2
;;
	c0	stw 40[$r0.1] = $r0.11
;;
.call memset, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	stw 36[$r0.1] = $r0.17
	c0	call $l0.0 = memset
;;
	c0	ldw $r0.17 = 36[$r0.1]
;;
	c0	ldw $r0.20 = 32[$r0.1]
;;
	c0	ldw $r0.11 = 40[$r0.1]
;;
	c0	mtb $b0.2 = $r0.11
	c0	ldw $r0.24 = 28[$r0.1]
;;
LBB4_59:                                ## %for.end
                                        ##   in Loop: Header=BB4_29 Depth=2
	c0	mov $r0.11 = 0
	c0	cmpgt $b0.0 = $r0.20, 1727
;;
;;
	c0	br $b0.0, LBB4_61
;;
## BB#73:                               ## %if.end65
                                        ##   in Loop: Header=BB4_29 Depth=2
	c0	cmpeq $b0.0 = $r0.17, 0
	c0	mov $r0.11 = 0
;;
;;
	c0	mfb $r0.13 = $b0.0
;;
LBB4_74:                                ## %if.end68
                                        ##   in Loop: Header=BB4_29 Depth=2
	c0	add $r0.12 = $r0.57, -1
	c0	cmpgt $b0.0 = $r0.57, 0
;;
	c0	stw 0[$r0.60] = $r0.12
	c0	mov $r0.15 = $r0.58
;;
	c0	br $b0.0, LBB4_78
;;
## BB#75:                               ## %if.then.i147
                                        ##   in Loop: Header=BB4_29 Depth=2
	c0	mov $r0.15 = fax
	c0	ldw $r0.14 = 0[$r0.61]
;;
	c0	add $r0.15 = $r0.15, 1792
;;
	c0	cmpltu $b0.0 = $r0.14, $r0.15
;;
;;
	c0	br $b0.0, LBB4_77
;;
## BB#76:                               ## %if.then2.i148
                                        ##   in Loop: Header=BB4_29 Depth=2
	c0	mtb $b0.2 = $r0.0
	c0	mov $r0.15 = 0
;;
	c0	stw 0[$r0.59] = $r0.15
	c0	mov $r0.14 = 1
;;
	c0	stb 0[$r0.24] = $r0.14
	c0	goto LBB4_78
;;
LBB4_77:                                ## %if.else.i151
                                        ##   in Loop: Header=BB4_29 Depth=2
	c0	add $r0.15 = $r0.14, 1
	c0	mov $r0.12 = 7
;;
	c0	stw 0[$r0.61] = $r0.15
;;
	c0	ldbu $r0.15 = 0[$r0.14]
;;
;;
	c0	stw 0[$r0.59] = $r0.15
;;
	c0	stw 0[$r0.60] = $r0.12
;;
LBB4_78:                                ## %getbit.exit154
                                        ##   in Loop: Header=BB4_29 Depth=2
	c0	mov $r0.14 = g3black
	c0	shru $r0.58 = $r0.15, $r0.62
	c0	and $r0.16 = $r0.15, 1
;;
	c0	cmpeq $b0.0 = $r0.13, 1
	c0	add $r0.15 = $r0.14, 3072
	c0	stw 0[$r0.59] = $r0.58
;;
	c0	mov $r0.17 = $r0.62
;;
	c0	br $b0.0, LBB4_29
;;
## BB#79:                               ## %if.else74
                                        ##   in Loop: Header=BB4_29 Depth=2
	c0	mov $r0.17 = 1
;;
	c0	shl $r0.15 = $r0.16, $r0.17
	c0	add $r0.14 = $r0.12, -1
	c0	cmpgt $b0.0 = $r0.12, 0
;;
	c0	stw 0[$r0.60] = $r0.14
;;
	c0	br $b0.0, LBB4_83
;;
## BB#80:                               ## %if.then.i134
                                        ##   in Loop: Header=BB4_29 Depth=2
	c0	mov $r0.16 = fax
	c0	ldw $r0.12 = 0[$r0.61]
;;
	c0	add $r0.16 = $r0.16, 1792
;;
	c0	cmpltu $b0.0 = $r0.12, $r0.16
;;
;;
	c0	br $b0.0, LBB4_82
;;
## BB#81:                               ## %if.then2.i135
                                        ##   in Loop: Header=BB4_29 Depth=2
	c0	mtb $b0.2 = $r0.0
	c0	mov $r0.58 = 0
;;
	c0	stw 0[$r0.59] = $r0.58
;;
	c0	stb 0[$r0.24] = $r0.17
	c0	goto LBB4_83
;;
LBB4_82:                                ## %if.else.i138
                                        ##   in Loop: Header=BB4_29 Depth=2
	c0	add $r0.16 = $r0.12, 1
	c0	mov $r0.14 = 7
;;
	c0	stw 0[$r0.61] = $r0.16
;;
	c0	ldbu $r0.58 = 0[$r0.12]
;;
;;
	c0	stw 0[$r0.59] = $r0.58
;;
	c0	stw 0[$r0.60] = $r0.14
;;
LBB4_83:                                ## %getbit.exit141
                                        ##   in Loop: Header=BB4_29 Depth=2
	c0	and $r0.12 = $r0.58, 1
;;
	c0	or $r0.12 = $r0.12, $r0.15
;;
	c0	shl $r0.12 = $r0.12, $r0.17
	c0	shru $r0.18 = $r0.58, $r0.17
	c0	cmpgt $b0.0 = $r0.14, 0
;;
	c0	stw 0[$r0.59] = $r0.18
	c0	and $r0.16 = $r0.12, 6
	c0	add $r0.12 = $r0.14, -1
;;
	c0	stw 0[$r0.60] = $r0.12
	c0	br $b0.0, LBB4_87
;;
## BB#84:                               ## %if.then.i
                                        ##   in Loop: Header=BB4_29 Depth=2
	c0	mov $r0.15 = fax
	c0	ldw $r0.14 = 0[$r0.61]
;;
	c0	add $r0.15 = $r0.15, 1792
;;
	c0	cmpltu $b0.0 = $r0.14, $r0.15
;;
;;
	c0	br $b0.0, LBB4_86
;;
## BB#85:                               ## %if.then2.i
                                        ##   in Loop: Header=BB4_29 Depth=2
	c0	mtb $b0.2 = $r0.0
	c0	mov $r0.18 = 0
;;
	c0	stw 0[$r0.59] = $r0.18
;;
	c0	stb 0[$r0.24] = $r0.17
	c0	goto LBB4_87
;;
LBB4_86:                                ## %if.else.i
                                        ##   in Loop: Header=BB4_29 Depth=2
	c0	add $r0.15 = $r0.14, 1
	c0	mov $r0.12 = 7
;;
	c0	stw 0[$r0.61] = $r0.15
;;
	c0	ldbu $r0.18 = 0[$r0.14]
;;
;;
	c0	stw 0[$r0.59] = $r0.18
;;
	c0	stw 0[$r0.60] = $r0.12
;;
LBB4_87:                                ## %getbit.exit
                                        ##   in Loop: Header=BB4_29 Depth=2
	c0	mov $r0.14 = g3white
;;
	c0	add $r0.15 = $r0.14, 2304
	c0	and $r0.19 = $r0.18, 1
;;
	c0	or $r0.16 = $r0.19, $r0.16
	c0	shru $r0.58 = $r0.18, $r0.17
;;
	c0	stw 0[$r0.59] = $r0.58
	c0	mov $r0.17 = $r0.13
	c0	goto LBB4_29
;;
LBB4_37:                                ## %if.end
                                        ##   in Loop: Header=BB4_15 Depth=1
	c0	mov $r0.11 = 0
	c0	cmpeq $b0.0 = $r0.13, 1
;;
;;
	c0	brf $b0.0, LBB4_39
;;
LBB4_53:                                ## %if.then35
                                        ##   in Loop: Header=BB4_15 Depth=1
	c0	mov $r0.13 = 0
	c0	cmpne $b0.0 = $r0.20, 0
;;
;;
	c0	br $b0.0, LBB4_88
;;
## BB#54:                               ## %if.else
                                        ##   in Loop: Header=BB4_15 Depth=1
	c0	add $r0.13 = $r0.63, 1
	c0	cmplt $b0.0 = $r0.63, 2
;;
;;
	c0	br $b0.0, LBB4_88
;;
## BB#55:                               ## %if.then41
                                        ##   in Loop: Header=BB4_15 Depth=1
	c0	mtb $b0.2 = $r0.0
	c0	mov $r0.11 = 1
;;
	c0	stb 0[$r0.24] = $r0.11
	c0	goto LBB4_88
;;
LBB4_39:                                ## %for.cond.outer.for.cond.outer.split_crit_edge.i198
                                        ##   Parent Loop BB4_15 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB4_40 Depth 3
	c0	mov $r0.12 = $r0.57
;;
LBB4_40:                                ## %for.body.i201
                                        ##   Parent Loop BB4_15 Depth=1
                                        ##     Parent Loop BB4_39 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	c0	add $r0.57 = $r0.12, -1
	c0	cmpgt $b0.0 = $r0.12, 0
;;
	c0	stw 0[$r0.60] = $r0.57
;;
	c0	br $b0.0, LBB4_44
;;
## BB#41:                               ## %if.then.i.i205
                                        ##   in Loop: Header=BB4_40 Depth=3
	c0	mov $r0.13 = fax
	c0	ldw $r0.12 = 0[$r0.61]
;;
	c0	add $r0.13 = $r0.13, 1792
;;
	c0	cmpltu $b0.0 = $r0.12, $r0.13
;;
;;
	c0	brf $b0.0, LBB4_42
;;
## BB#43:                               ## %if.else.i.i209
                                        ##   in Loop: Header=BB4_40 Depth=3
	c0	add $r0.13 = $r0.12, 1
	c0	mov $r0.57 = 7
;;
	c0	stw 0[$r0.61] = $r0.13
;;
	c0	ldbu $r0.58 = 0[$r0.12]
;;
;;
	c0	stw 0[$r0.59] = $r0.58
;;
	c0	stw 0[$r0.60] = $r0.57
;;
LBB4_44:                                ## %getbit.exit.i214
                                        ##   in Loop: Header=BB4_40 Depth=3
	c0	and $r0.12 = $r0.58, 1
	c0	mov $r0.13 = 1
;;
	c0	shru $r0.58 = $r0.58, $r0.13
	c0	cmpeq $b0.0 = $r0.12, 0
;;
	c0	stw 0[$r0.59] = $r0.58
	c0	mov $r0.12 = $r0.57
;;
	c0	br $b0.0, LBB4_38
;;
	c0	goto LBB4_40
;;
LBB4_42:                                ## %getbit.exit.thread.i206
                                        ##   in Loop: Header=BB4_39 Depth=2
	c0	mtb $b0.2 = $r0.0
	c0	mov $r0.12 = 1
	c0	mov $r0.58 = 0
;;
	c0	stb 0[$r0.24] = $r0.12
;;
	c0	stw 0[$r0.59] = $r0.58
;;
LBB4_38:                                ## %select.unfold.i196
                                        ##   in Loop: Header=BB4_39 Depth=2
	c0	add $r0.11 = $r0.11, 1
;;
	c0	cmpeq $b0.0 = $r0.11, 11
;;
;;
	c0	br $b0.0, LBB4_48
;;
	c0	goto LBB4_39
;;
LBB4_61:                                ## %for.cond.outer.for.cond.outer.split_crit_edge.i160
                                        ##   Parent Loop BB4_15 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB4_62 Depth 3
	c0	mov $r0.12 = $r0.57
;;
LBB4_62:                                ## %for.body.i163
                                        ##   Parent Loop BB4_15 Depth=1
                                        ##     Parent Loop BB4_61 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	c0	add $r0.57 = $r0.12, -1
	c0	cmpgt $b0.0 = $r0.12, 0
;;
	c0	stw 0[$r0.60] = $r0.57
;;
	c0	br $b0.0, LBB4_66
;;
## BB#63:                               ## %if.then.i.i167
                                        ##   in Loop: Header=BB4_62 Depth=3
	c0	mov $r0.13 = fax
	c0	ldw $r0.12 = 0[$r0.61]
;;
	c0	add $r0.13 = $r0.13, 1792
;;
	c0	cmpltu $b0.0 = $r0.12, $r0.13
;;
;;
	c0	brf $b0.0, LBB4_64
;;
## BB#65:                               ## %if.else.i.i171
                                        ##   in Loop: Header=BB4_62 Depth=3
	c0	add $r0.13 = $r0.12, 1
	c0	mov $r0.57 = 7
;;
	c0	stw 0[$r0.61] = $r0.13
;;
	c0	ldbu $r0.58 = 0[$r0.12]
;;
;;
	c0	stw 0[$r0.59] = $r0.58
;;
	c0	stw 0[$r0.60] = $r0.57
;;
LBB4_66:                                ## %getbit.exit.i176
                                        ##   in Loop: Header=BB4_62 Depth=3
	c0	and $r0.12 = $r0.58, 1
	c0	shru $r0.58 = $r0.58, $r0.62
;;
	c0	cmpeq $b0.0 = $r0.12, 0
	c0	stw 0[$r0.59] = $r0.58
	c0	mov $r0.12 = $r0.57
;;
;;
	c0	br $b0.0, LBB4_60
;;
	c0	goto LBB4_62
;;
LBB4_64:                                ## %getbit.exit.thread.i168
                                        ##   in Loop: Header=BB4_61 Depth=2
	c0	mtb $b0.2 = $r0.0
	c0	mov $r0.58 = 0
	c0	stb 0[$r0.24] = $r0.62
;;
	c0	stw 0[$r0.59] = $r0.58
;;
LBB4_60:                                ## %select.unfold.i158
                                        ##   in Loop: Header=BB4_61 Depth=2
	c0	add $r0.11 = $r0.11, 1
;;
	c0	cmpeq $b0.0 = $r0.11, 11
;;
;;
	c0	br $b0.0, LBB4_70
;;
	c0	goto LBB4_61
;;
LBB4_47:                                ## %getbit.exit17.thread.i222
                                        ##   in Loop: Header=BB4_48 Depth=2
	c0	mtb $b0.2 = $r0.0
	c0	mov $r0.12 = 1
	c0	mov $r0.58 = 0
;;
	c0	stb 0[$r0.24] = $r0.12
;;
	c0	stw 0[$r0.59] = $r0.58
	c0	mov $r0.57 = $r0.11
;;
LBB4_48:                                ## %while.cond.i217.outer
                                        ##   Parent Loop BB4_15 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB4_45 Depth 3
	c0	goto LBB4_45
;;
LBB4_45:                                ## %while.cond.i217
                                        ##   Parent Loop BB4_15 Depth=1
                                        ##     Parent Loop BB4_48 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	c0	add $r0.11 = $r0.57, -1
	c0	cmpgt $b0.0 = $r0.57, 0
;;
	c0	stw 0[$r0.60] = $r0.11
;;
	c0	br $b0.0, LBB4_50
;;
## BB#46:                               ## %if.then.i10.i221
                                        ##   in Loop: Header=BB4_45 Depth=3
	c0	mov $r0.13 = fax
	c0	ldw $r0.12 = 0[$r0.61]
;;
	c0	add $r0.13 = $r0.13, 1792
;;
	c0	cmpltu $b0.0 = $r0.12, $r0.13
;;
;;
	c0	brf $b0.0, LBB4_47
;;
## BB#49:                               ## %if.else.i14.i225
                                        ##   in Loop: Header=BB4_45 Depth=3
	c0	add $r0.13 = $r0.12, 1
	c0	mov $r0.11 = 7
;;
	c0	stw 0[$r0.61] = $r0.13
;;
	c0	ldbu $r0.58 = 0[$r0.12]
;;
;;
	c0	stw 0[$r0.59] = $r0.58
;;
	c0	stw 0[$r0.60] = $r0.11
;;
LBB4_50:                                ## %getbit.exit17.i229
                                        ##   in Loop: Header=BB4_45 Depth=3
	c0	and $r0.12 = $r0.58, 1
	c0	mov $r0.13 = 1
;;
	c0	shru $r0.58 = $r0.58, $r0.13
	c0	cmpeq $b0.0 = $r0.12, 0
;;
	c0	stw 0[$r0.59] = $r0.58
	c0	mov $r0.57 = $r0.11
	c0	mov $r0.13 = $r0.63
;;
	c0	br $b0.0, LBB4_45
;;
	c0	goto LBB4_88
;;
LBB4_69:                                ## %getbit.exit17.thread.i184
                                        ##   in Loop: Header=BB4_70 Depth=2
	c0	mtb $b0.2 = $r0.0
	c0	mov $r0.58 = 0
	c0	stb 0[$r0.24] = $r0.62
;;
	c0	stw 0[$r0.59] = $r0.58
	c0	mov $r0.57 = $r0.11
;;
LBB4_70:                                ## %while.cond.i179.outer
                                        ##   Parent Loop BB4_15 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB4_67 Depth 3
	c0	goto LBB4_67
;;
LBB4_67:                                ## %while.cond.i179
                                        ##   Parent Loop BB4_15 Depth=1
                                        ##     Parent Loop BB4_70 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	c0	add $r0.11 = $r0.57, -1
	c0	cmpgt $b0.0 = $r0.57, 0
;;
	c0	stw 0[$r0.60] = $r0.11
;;
	c0	br $b0.0, LBB4_72
;;
## BB#68:                               ## %if.then.i10.i183
                                        ##   in Loop: Header=BB4_67 Depth=3
	c0	mov $r0.13 = fax
	c0	ldw $r0.12 = 0[$r0.61]
;;
	c0	add $r0.13 = $r0.13, 1792
;;
	c0	cmpltu $b0.0 = $r0.12, $r0.13
;;
;;
	c0	brf $b0.0, LBB4_69
;;
## BB#71:                               ## %if.else.i14.i187
                                        ##   in Loop: Header=BB4_67 Depth=3
	c0	add $r0.13 = $r0.12, 1
	c0	mov $r0.11 = 7
;;
	c0	stw 0[$r0.61] = $r0.13
;;
	c0	ldbu $r0.58 = 0[$r0.12]
;;
;;
	c0	stw 0[$r0.59] = $r0.58
;;
	c0	stw 0[$r0.60] = $r0.11
;;
LBB4_72:                                ## %getbit.exit17.i191
                                        ##   in Loop: Header=BB4_67 Depth=3
	c0	and $r0.12 = $r0.58, 1
	c0	shru $r0.58 = $r0.58, $r0.62
;;
	c0	cmpeq $b0.0 = $r0.12, 0
	c0	stw 0[$r0.59] = $r0.58
	c0	mov $r0.57 = $r0.11
	c0	mov $r0.13 = $r0.63
;;
;;
	c0	br $b0.0, LBB4_67
;;
LBB4_88:                                ## %for.end88
                                        ##   in Loop: Header=BB4_15 Depth=1
	c0	mov $r0.12 = 0
	c0	ldw $r0.25 = 44[$r0.1]
;;
;;
	c0	ldw $r0.11 = 0[$r0.25]
	c0	mov $r0.14 = $r0.12
	c0	mov $r0.15 = $r0.12
	c0	mov $r0.16 = $r0.12
;;
	c0	mov $r0.17 = $r0.12
	c0	mov $r0.18 = $r0.12
	c0	mov $r0.19 = $r0.12
	c0	mov $r0.20 = $r0.12
;;
LBB4_89:                                ## %vector.body
                                        ##   Parent Loop BB4_15 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	mov $r0.21 = rowbuf
;;
	c0	add $r0.21 = $r0.21, $r0.12
;;
	c0	ldbu $r0.22 = 0[$r0.21]
;;
	c0	ldbu $r0.23 = 6[$r0.21]
;;
	c0	add $r0.11 = $r0.22, $r0.11
	c0	add $r0.12 = $r0.12, 8
	c0	ldbu $r0.22 = 2[$r0.21]
;;
	c0	add $r0.19 = $r0.23, $r0.19
	c0	ldbu $r0.23 = 7[$r0.21]
;;
	c0	add $r0.15 = $r0.22, $r0.15
	c0	cmpne $b0.0 = $r0.12, 1728
;;
	c0	add $r0.20 = $r0.23, $r0.20
	c0	ldbu $r0.22 = 3[$r0.21]
;;
	c0	ldbu $r0.23 = 5[$r0.21]
;;
	c0	add $r0.16 = $r0.22, $r0.16
;;
	c0	add $r0.18 = $r0.23, $r0.18
	c0	ldbu $r0.22 = 4[$r0.21]
;;
	c0	ldbu $r0.21 = 1[$r0.21]
;;
	c0	add $r0.17 = $r0.22, $r0.17
;;
	c0	add $r0.14 = $r0.21, $r0.14
	c0	br $b0.0, LBB4_89
;;
## BB#90:                               ## %middle.block
                                        ##   in Loop: Header=BB4_15 Depth=1
	c0	mfb $r0.12 = $b0.2
	c0	add $r0.11 = $r0.17, $r0.11
	c0	add $r0.14 = $r0.18, $r0.14
	c0	add $r0.15 = $r0.19, $r0.15
;;
	c0	add $r0.16 = $r0.20, $r0.16
	c0	cmpne $r0.12 = $r0.12, 1
	c0	add $r0.11 = $r0.11, $r0.15
;;
	c0	add $r0.14 = $r0.14, $r0.16
	c0	mtb $b0.0 = $r0.12
;;
	c0	add $r0.11 = $r0.11, $r0.14
;;
	c0	stw 0[$r0.25] = $r0.11
	c0	mov $r0.63 = $r0.13
	c0	br $b0.0, LBB4_15
;;
## BB#91:                               ## %for.end91
	c0	cmpeq $b0.0 = $r0.11, 11296
;;
;;
	c0	br $b0.0, LBB4_93
;;
LBB4_92:                                ## %if.then94
	c0	mov $r0.57 = 15
	c0	mov $r0.3 = str3
;;
	c0	goto LBB4_94
;;
LBB4_93:                                ## %if.else96
	c0	mov $r0.57 = 66
	c0	mov $r0.3 = str
;;
LBB4_94:                                ## %return
	c0	mov $r0.3 = $r0.57
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

fax:                                    ## @fax
	.data1 73
	.data1 73
	.data1 42
	.data1 0
	.data1 147
	.data1 161
	.data1 0
	.data1 0
	.data1 0
	.data1 128
	.data1 178
	.data1 89
	.data1 1
	.data1 0
	.data1 128
	.data1 178
	.data1 89
	.data1 1
	.data1 0
	.data1 128
	.data1 178
	.data1 89
	.data1 1
	.data1 0
	.data1 128
	.data1 178
	.data1 89
	.data1 1
	.data1 0
	.data1 128
	.data1 169
	.data1 154
	.data1 127
	.data1 116
	.data1 243
	.data1 21
	.data1 103
	.data1 112
	.data1 197
	.data1 28
	.data1 114
	.data1 16
	.data1 62
	.data1 232
	.data1 242
	.data1 129
	.data1 111
	.data1 112
	.data1 100
	.data1 112
	.data1 135
	.data1 31
	.data1 164
	.data1 231
	.data1 43
	.data1 67
	.data1 14
	.data1 126
	.data1 144
	.data1 131
	.data1 52
	.data1 56
	.data1 2
	.data1 146
	.data1 209
	.data1 158
	.data1 239
	.data1 243
	.data1 29
	.data1 220
	.data1 193
	.data1 229
	.data1 240
	.data1 131
	.data1 244
	.data1 124
	.data1 63
	.data1 129
	.data1 130
	.data1 55
	.data1 68
	.data1 39
	.data1 133
	.data1 52
	.data1 184
	.data1 131
	.data1 31
	.data1 122
	.data1 144
	.data1 140
	.data1 54
	.data1 120
	.data1 67
	.data1 118
	.data1 195
	.data1 193
	.data1 16
	.data1 190
	.data1 158
	.data1 1
	.data1 0
	.data1 128
	.data1 169
	.data1 242
	.data1 185
	.data1 191
	.data1 123
	.data1 62
	.data1 216
	.data1 136
	.data1 193
	.data1 206
	.data1 243
	.data1 125
	.data1 254
	.data1 153
	.data1 214
	.data1 149
	.data1 179
	.data1 43
	.data1 247
	.data1 160
	.data1 47
	.data1 243
	.data1 125
	.data1 190
	.data1 251
	.data1 172
	.data1 250
	.data1 221
	.data1 243
	.data1 125
	.data1 190
	.data1 207
	.data1 207
	.data1 43
	.data1 230
	.data1 247
	.data1 121
	.data1 159
	.data1 239
	.data1 243
	.data1 243
	.data1 136
	.data1 229
	.data1 243
	.data1 125
	.data1 190
	.data1 207
	.data1 247
	.data1 147
	.data1 234
	.data1 121
	.data1 190
	.data1 174
	.data1 60
	.data1 223
	.data1 95
	.data1 230
	.data1 247
	.data1 196
	.data1 252
	.data1 158
	.data1 152
	.data1 239
	.data1 243
	.data1 183
	.data1 207
	.data1 151
	.data1 207
	.data1 63
	.data1 235
	.data1 25
	.data1 0
	.data1 128
	.data1 169
	.data1 218
	.data1 247
	.data1 125
	.data1 159
	.data1 223
	.data1 223
	.data1 224
	.data1 125
	.data1 249
	.data1 224
	.data1 253
	.data1 60
	.data1 223
	.data1 231
	.data1 247
	.data1 62
	.data1 245
	.data1 254
	.data1 178
	.data1 159
	.data1 189
	.data1 236
	.data1 247
	.data1 160
	.data1 47
	.data1 243
	.data1 125
	.data1 190
	.data1 239
	.data1 251
	.data1 190
	.data1 234
	.data1 121
	.data1 159
	.data1 239
	.data1 243
	.data1 125
	.data1 196
	.data1 138
	.data1 151
	.data1 151
	.data1 249
	.data1 62
	.data1 63
	.data1 47
	.data1 31
	.data1 49
	.data1 223
	.data1 231
	.data1 251
	.data1 124
	.data1 63
	.data1 169
	.data1 158
	.data1 231
	.data1 235
	.data1 202
	.data1 243
	.data1 253
	.data1 101
	.data1 190
	.data1 191
	.data1 156
	.data1 237
	.data1 47
	.data1 243
	.data1 125
	.data1 254
	.data1 246
	.data1 249
	.data1 242
	.data1 179
	.data1 123
	.data1 95
	.data1 207
	.data1 0
	.data1 128
	.data1 169
	.data1 186
	.data1 239
	.data1 125
	.data1 254
	.data1 237
	.data1 51
	.data1 94
	.data1 204
	.data1 56
	.data1 207
	.data1 247
	.data1 249
	.data1 121
	.data1 208
	.data1 137
	.data1 123
	.data1 197
	.data1 125
	.data1 67
	.data1 208
	.data1 95
	.data1 230
	.data1 251
	.data1 124
	.data1 191
	.data1 239
	.data1 85
	.data1 207
	.data1 251
	.data1 124
	.data1 159
	.data1 239
	.data1 35
	.data1 86
	.data1 188
	.data1 188
	.data1 204
	.data1 247
	.data1 249
	.data1 249
	.data1 106
	.data1 240
	.data1 124
	.data1 159
	.data1 239
	.data1 243
	.data1 253
	.data1 164
	.data1 122
	.data1 158
	.data1 175
	.data1 43
	.data1 207
	.data1 119
	.data1 72
	.data1 117
	.data1 191
	.data1 124
	.data1 251
	.data1 190
	.data1 226
	.data1 158
	.data1 191
	.data1 125
	.data1 190
	.data1 252
	.data1 219
	.data1 207
	.data1 235
	.data1 25
	.data1 0
	.data1 128
	.data1 169
	.data1 186
	.data1 239
	.data1 125
	.data1 126
	.data1 62
	.data1 131
	.data1 231
	.data1 229
	.data1 55
	.data1 120
	.data1 158
	.data1 195
	.data1 27
	.data1 158
	.data1 7
	.data1 157
	.data1 127
	.data1 131
	.data1 191
	.data1 151
	.data1 81
	.data1 225
	.data1 13
	.data1 239
	.data1 249
	.data1 126
	.data1 223
	.data1 171
	.data1 158
	.data1 119
	.data1 120
	.data1 207
	.data1 111
	.data1 8
	.data1 159
	.data1 12
	.data1 233
	.data1 23
	.data1 112
	.data1 159
	.data1 159
	.data1 95
	.data1 86
	.data1 192
	.data1 123
	.data1 190
	.data1 131
	.data1 251
	.data1 73
	.data1 245
	.data1 60
	.data1 95
	.data1 87
	.data1 133
	.data1 19
	.data1 19
	.data1 31
	.data1 188
	.data1 239
	.data1 123
	.data1 135
	.data1 19
	.data1 103
	.data1 200
	.data1 110
	.data1 56
	.data1 226
	.data1 190
	.data1 207
	.data1 235
	.data1 25
	.data1 0
	.data1 128
	.data1 169
	.data1 154
	.data1 239
	.data1 224
	.data1 121
	.data1 224
	.data1 17
	.data1 43
	.data1 70
	.data1 188
	.data1 156
	.data1 7
	.data1 61
	.data1 159
	.data1 207
	.data1 206
	.data1 231
	.data1 171
	.data1 145
	.data1 95
	.data1 238
	.data1 243
	.data1 124
	.data1 159
	.data1 175
	.data1 122
	.data1 222
	.data1 239
	.data1 243
	.data1 252
	.data1 229
	.data1 60
	.data1 234
	.data1 254
	.data1 50
	.data1 223
	.data1 231
	.data1 231
	.data1 137
	.data1 201
	.data1 47
	.data1 243
	.data1 125
	.data1 190
	.data1 159
	.data1 84
	.data1 207
	.data1 243
	.data1 117
	.data1 230
	.data1 151
	.data1 243
	.data1 121
	.data1 190
	.data1 239
	.data1 223
	.data1 62
	.data1 63
	.data1 159
	.data1 231
	.data1 111
	.data1 31
	.data1 120
	.data1 255
	.data1 206
	.data1 235
	.data1 25
	.data1 0
	.data1 128
	.data1 169
	.data1 154
	.data1 239
	.data1 243
	.data1 243
	.data1 192
	.data1 35
	.data1 86
	.data1 140
	.data1 120
	.data1 57
	.data1 15
	.data1 122
	.data1 6
	.data1 63
	.data1 103
	.data1 240
	.data1 101
	.data1 228
	.data1 151
	.data1 239
	.data1 155
	.data1 239
	.data1 243
	.data1 85
	.data1 207
	.data1 251
	.data1 247
	.data1 205
	.data1 95
	.data1 206
	.data1 163
	.data1 238
	.data1 47
	.data1 243
	.data1 125
	.data1 126
	.data1 158
	.data1 207
	.data1 120
	.data1 153
	.data1 239
	.data1 243
	.data1 253
	.data1 164
	.data1 122
	.data1 158
	.data1 175
	.data1 51
	.data1 191
	.data1 156
	.data1 207
	.data1 243
	.data1 221
	.data1 121
	.data1 159
	.data1 159
	.data1 207
	.data1 243
	.data1 183
	.data1 15
	.data1 236
	.data1 124
	.data1 94
	.data1 207
	.data1 0
	.data1 128
	.data1 169
	.data1 154
	.data1 239
	.data1 243
	.data1 243
	.data1 192
	.data1 231
	.data1 249
	.data1 138
	.data1 229
	.data1 47
	.data1 243
	.data1 65
	.data1 151
	.data1 15
	.data1 124
	.data1 159
	.data1 71
	.data1 125
	.data1 57
	.data1 223
	.data1 243
	.data1 125
	.data1 190
	.data1 234
	.data1 119
	.data1 159
	.data1 239
	.data1 249
	.data1 62
	.data1 63
	.data1 175
	.data1 152
	.data1 223
	.data1 231
	.data1 125
	.data1 190
	.data1 207
	.data1 207
	.data1 231
	.data1 129
	.data1 95
	.data1 230
	.data1 251
	.data1 124
	.data1 63
	.data1 169
	.data1 158
	.data1 231
	.data1 235
	.data1 210
	.data1 247
	.data1 121
	.data1 126
	.data1 158
	.data1 239
	.data1 243
	.data1 125
	.data1 126
	.data1 62
	.data1 207
	.data1 223
	.data1 190
	.data1 220
	.data1 121
	.data1 126
	.data1 94
	.data1 207
	.data1 0
	.data1 128
	.data1 169
	.data1 154
	.data1 239
	.data1 243
	.data1 243
	.data1 100
	.data1 200
	.data1 65
	.data1 192
	.data1 144
	.data1 67
	.data1 51
	.data1 154
	.data1 33
	.data1 232
	.data1 144
	.data1 101
	.data1 224
	.data1 15
	.data1 69
	.data1 127
	.data1 153
	.data1 223
	.data1 144
	.data1 158
	.data1 175
	.data1 12
	.data1 185
	.data1 249
	.data1 13
	.data1 57
	.data1 8
	.data1 159
	.data1 12
	.data1 201
	.data1 104
	.data1 207
	.data1 111
	.data1 8
	.data1 63
	.data1 131
	.data1 203
	.data1 175
	.data1 32
	.data1 61
	.data1 223
	.data1 193
	.data1 19
	.data1 229
	.data1 28
	.data1 162
	.data1 147
	.data1 162
	.data1 25
	.data1 37
	.data1 230
	.data1 144
	.data1 131
	.data1 28
	.data1 132
	.data1 207
	.data1 33
	.data1 187
	.data1 151
	.data1 155
	.data1 67
	.data1 14
	.data1 162
	.data1 55
	.data1 0
	.data1 128
	.data1 178
	.data1 89
	.data1 1
	.data1 0
	.data1 128
	.data1 178
	.data1 89
	.data1 1
	.data1 0
	.data1 128
	.data1 178
	.data1 89
	.data1 1
	.data1 0
	.data1 128
	.data1 178
	.data1 89
	.data1 1
	.data1 0
	.data1 128
	.data1 178
	.data1 89
	.data1 1
	.data1 0
	.data1 128
	.data1 91
	.data1 202
	.data1 92
	.data1 56
	.data1 20
	.data1 129
	.data1 98
	.data1 133
	.data1 131
	.data1 21
	.data1 103
	.data1 151
	.data1 4
	.data1 230
	.data1 138
	.data1 158
	.data1 114
	.data1 42
	.data1 176
	.data1 208
	.data1 81
	.data1 97
	.data1 211
	.data1 176
	.data1 9
	.data1 228
	.data1 17
	.data1 71
	.data1 2
	.data1 30
	.data1 16
	.data1 28
	.data1 146
	.data1 65
	.data1 127
	.data1 152
	.data1 197
	.data1 160
	.data1 28
	.data1 29
	.data1 52
	.data1 131
	.data1 103
	.data1 124
	.data1 120
	.data1 208
	.data1 1
	.data1 251
	.data1 160
	.data1 84
	.data1 56
	.data1 32
	.data1 141
	.data1 7
	.data1 25
	.data1 52
	.data1 131
	.data1 100
	.data1 240
	.data1 5
	.data1 34
	.data1 208
	.data1 195
	.data1 7
	.data1 155
	.data1 65
	.data1 6
	.data1 29
	.data1 148
	.data1 128
	.data1 121
	.data1 5
	.data1 243
	.data1 3
	.data1 29
	.data1 6
	.data1 66
	.data1 128
	.data1 158
	.data1 145
	.data1 65
	.data1 7
	.data1 116
	.data1 251
	.data1 1
	.data1 0
	.data1 128
	.data1 169
	.data1 192
	.data1 64
	.data1 132
	.data1 6
	.data1 75
	.data1 156
	.data1 177
	.data1 144
	.data1 38
	.data1 176
	.data1 112
	.data1 21
	.data1 150
	.data1 130
	.data1 133
	.data1 142
	.data1 14
	.data1 139
	.data1 134
	.data1 249
	.data1 65
	.data1 6
	.data1 226
	.data1 72
	.data1 192
	.data1 3
	.data1 22
	.data1 25
	.data1 59
	.data1 250
	.data1 48
	.data1 139
	.data1 65
	.data1 57
	.data1 226
	.data1 72
	.data1 134
	.data1 145
	.data1 209
	.data1 65
	.data1 27
	.data1 63
	.data1 108
	.data1 6
	.data1 197
	.data1 224
	.data1 10
	.data1 227
	.data1 112
	.data1 199
	.data1 135
	.data1 52
	.data1 146
	.data1 193
	.data1 11
	.data1 42
	.data1 71
	.data1 97
	.data1 244
	.data1 240
	.data1 161
	.data1 131
	.data1 52
	.data1 122
	.data1 232
	.data1 32
	.data1 2
	.data1 22
	.data1 11
	.data1 108
	.data1 6
	.data1 116
	.data1 24
	.data1 230
	.data1 25
	.data1 230
	.data1 15
	.data1 105
	.data1 116
	.data1 64
	.data1 183
	.data1 31
	.data1 0
	.data1 128
	.data1 105
	.data1 1
	.data1 161
	.data1 168
	.data1 130
	.data1 186
	.data1 28
	.data1 230
	.data1 72
	.data1 252
	.data1 56
	.data1 7
	.data1 102
	.data1 110
	.data1 82
	.data1 88
	.data1 232
	.data1 84
	.data1 64
	.data1 60
	.data1 24
	.data1 15
	.data1 57
	.data1 196
	.data1 145
	.data1 128
	.data1 7
	.data1 16
	.data1 5
	.data1 13
	.data1 252
	.data1 48
	.data1 43
	.data1 71
	.data1 56
	.data1 16
	.data1 5
	.data1 59
	.data1 250
	.data1 232
	.data1 160
	.data1 141
	.data1 30
	.data1 108
	.data1 26
	.data1 61
	.data1 116
	.data1 144
	.data1 21
	.data1 44
	.data1 6
	.data1 236
	.data1 15
	.data1 163
	.data1 160
	.data1 114
	.data1 136
	.data1 64
	.data1 2
	.data1 25
	.data1 244
	.data1 209
	.data1 70
	.data1 6
	.data1 29
	.data1 148
	.data1 64
	.data1 27
	.data1 89
	.data1 208
	.data1 70
	.data1 7
	.data1 65
	.data1 192
	.data1 102
	.data1 96
	.data1 115
	.data1 80
	.data1 71
	.data1 6
	.data1 116
	.data1 251
	.data1 1
	.data1 0
	.data1 128
	.data1 9
	.data1 134
	.data1 129
	.data1 138
	.data1 174
	.data1 208
	.data1 7
	.data1 29
	.data1 235
	.data1 133
	.data1 176
	.data1 41
	.data1 91
	.data1 21
	.data1 22
	.data1 58
	.data1 13
	.data1 82
	.data1 193
	.data1 124
	.data1 32
	.data1 131
	.data1 52
	.data1 50
	.data1 104
	.data1 3
	.data1 81
	.data1 208
	.data1 64
	.data1 7
	.data1 117
	.data1 168
	.data1 163
	.data1 114
	.data1 148
	.data1 131
	.data1 46
	.data1 168
	.data1 241
	.data1 227
	.data1 67
	.data1 27
	.data1 29
	.data1 176
	.data1 15
	.data1 26
	.data1 208
	.data1 65
	.data1 87
	.data1 152
	.data1 61
	.data1 176
	.data1 63
	.data1 232
	.data1 25
	.data1 197
	.data1 192
	.data1 51
	.data1 108
	.data1 6
	.data1 125
	.data1 116
	.data1 208
	.data1 195
	.data1 135
	.data1 9
	.data1 116
	.data1 208
	.data1 5
	.data1 29
	.data1 60
	.data1 40
	.data1 29
	.data1 109
	.data1 100
	.data1 144
	.data1 70
	.data1 6
	.data1 238
	.data1 232
	.data1 32
	.data1 118
	.data1 24
	.data1 0
	.data1 128
	.data1 105
	.data1 29
	.data1 7
	.data1 193
	.data1 2
	.data1 89
	.data1 32
	.data1 5
	.data1 6
	.data1 195
	.data1 43
	.data1 33
	.data1 104
	.data1 240
	.data1 167
	.data1 12
	.data1 11
	.data1 29
	.data1 4
	.data1 169
	.data1 16
	.data1 28
	.data1 57
	.data1 164
	.data1 33
	.data1 13
	.data1 9
	.data1 164
	.data1 97
	.data1 254
	.data1 176
	.data1 24
	.data1 212
	.data1 161
	.data1 142
	.data1 49
	.data1 40
	.data1 7
	.data1 93
	.data1 224
	.data1 192
	.data1 143
	.data1 7
	.data1 105
	.data1 244
	.data1 96
	.data1 51
	.data1 104
	.data1 67
	.data1 222
	.data1 114
	.data1 16
	.data1 28
	.data1 228
	.data1 193
	.data1 126
	.data1 56
	.data1 112
	.data1 70
	.data1 17
	.data1 32
	.data1 7
	.data1 155
	.data1 65
	.data1 31
	.data1 9
	.data1 100
	.data1 208
	.data1 65
	.data1 9
	.data1 124
	.data1 232
	.data1 2
	.data1 196
	.data1 131
	.data1 47
	.data1 200
	.data1 32
	.data1 129
	.data1 28
	.data1 18
	.data1 160
	.data1 24
	.data1 212
	.data1 190
	.data1 0
	.data1 128
	.data1 169
	.data1 2
	.data1 67
	.data1 2
	.data1 250
	.data1 34
	.data1 28
	.data1 225
	.data1 32
	.data1 140
	.data1 106
	.data1 225
	.data1 213
	.data1 144
	.data1 129
	.data1 1
	.data1 13
	.data1 11
	.data1 29
	.data1 10
	.data1 169
	.data1 16
	.data1 71
	.data1 14
	.data1 54
	.data1 3
	.data1 246
	.data1 70
	.data1 28
	.data1 57
	.data1 216
	.data1 52
	.data1 26
	.data1 72
	.data1 160
	.data1 114
	.data1 148
	.data1 3
	.data1 145
	.data1 97
	.data1 126
	.data1 104
	.data1 163
	.data1 131
	.data1 30
	.data1 108
	.data1 6
	.data1 29
	.data1 4
	.data1 8
	.data1 218
	.data1 240
	.data1 7
	.data1 251
	.data1 225
	.data1 64
	.data1 31
	.data1 43
	.data1 160
	.data1 3
	.data1 155
	.data1 65
	.data1 31
	.data1 109
	.data1 100
	.data1 208
	.data1 65
	.data1 9
	.data1 116
	.data1 16
	.data1 24
	.data1 140
	.data1 12
	.data1 99
	.data1 65
	.data1 15
	.data1 13
	.data1 228
	.data1 208
	.data1 1
	.data1 251
	.data1 128
	.data1 219
	.data1 51
	.data1 0
	.data1 128
	.data1 9
	.data1 3
	.data1 58
	.data1 4
	.data1 22
	.data1 48
	.data1 8
	.data1 71
	.data1 129
	.data1 25
	.data1 217
	.data1 205
	.data1 25
	.data1 2
	.data1 13
	.data1 11
	.data1 93
	.data1 9
	.data1 173
	.data1 145
	.data1 64
	.data1 14
	.data1 230
	.data1 15
	.data1 139
	.data1 65
	.data1 2
	.data1 105
	.data1 176
	.data1 55
	.data1 110
	.data1 164
	.data1 177
	.data1 28
	.data1 229
	.data1 168
	.data1 163
	.data1 15
	.data1 139
	.data1 131
	.data1 69
	.data1 35
	.data1 131
	.data1 6
	.data1 116
	.data1 144
	.data1 193
	.data1 88
	.data1 144
	.data1 134
	.data1 102
	.data1 116
	.data1 208
	.data1 67
	.data1 113
	.data1 36
	.data1 163
	.data1 100
	.data1 164
	.data1 33
	.data1 56
	.data1 100
	.data1 208
	.data1 71
	.data1 27
	.data1 105
	.data1 100
	.data1 80
	.data1 2
	.data1 29
	.data1 116
	.data1 1
	.data1 226
	.data1 97
	.data1 44
	.data1 232
	.data1 32
	.data1 129
	.data1 102
	.data1 180
	.data1 193
	.data1 62
	.data1 48
	.data1 236
	.data1 15
	.data1 0
	.data1 128
	.data1 137
	.data1 14
	.data1 3
	.data1 12
	.data1 10
	.data1 98
	.data1 92
	.data1 56
	.data1 230
	.data1 194
	.data1 67
	.data1 166
	.data1 79
	.data1 142
	.data1 207
	.data1 132
	.data1 148
	.data1 97
	.data1 174
	.data1 171
	.data1 34
	.data1 43
	.data1 36
	.data1 32
	.data1 7
	.data1 6
	.data1 7
	.data1 227
	.data1 144
	.data1 70
	.data1 28
	.data1 50
	.data1 136
	.data1 35
	.data1 141
	.data1 27
	.data1 173
	.data1 145
	.data1 130
	.data1 54
	.data1 122
	.data1 176
	.data1 105
	.data1 88
	.data1 28
	.data1 58
	.data1 104
	.data1 67
	.data1 14
	.data1 22
	.data1 135
	.data1 229
	.data1 144
	.data1 129
	.data1 100
	.data1 116
	.data1 208
	.data1 131
	.data1 249
	.data1 33
	.data1 18
	.data1 180
	.data1 209
	.data1 65
	.data1 15
	.data1 63
	.data1 218
	.data1 200
	.data1 160
	.data1 131
	.data1 10
	.data1 164
	.data1 17
	.data1 24
	.data1 9
	.data1 100
	.data1 192
	.data1 87
	.data1 116
	.data1 144
	.data1 64
	.data1 14
	.data1 105
	.data1 216
	.data1 28
	.data1 184
	.data1 61
	.data1 3
	.data1 0
	.data1 128
	.data1 9
	.data1 130
	.data1 96
	.data1 193
	.data1 130
	.data1 128
	.data1 35
	.data1 225
	.data1 7
	.data1 3
	.data1 131
	.data1 131
	.data1 164
	.data1 96
	.data1 97
	.data1 175
	.data1 105
	.data1 16
	.data1 142
	.data1 84
	.data1 112
	.data1 142
	.data1 54
	.data1 44
	.data1 30
	.data1 117
	.data1 116
	.data1 112
	.data1 163
	.data1 53
	.data1 82
	.data1 144
	.data1 70
	.data1 2
	.data1 25
	.data1 180
	.data1 97
	.data1 254
	.data1 232
	.data1 160
	.data1 13
	.data1 121
	.data1 32
	.data1 14
	.data1 169
	.data1 145
	.data1 131
	.data1 100
	.data1 116
	.data1 144
	.data1 134
	.data1 205
	.data1 32
	.data1 242
	.data1 7
	.data1 26
	.data1 232
	.data1 160
	.data1 135
	.data1 54
	.data1 50
	.data1 144
	.data1 64
	.data1 6
	.data1 17
	.data1 104
	.data1 35
	.data1 48
	.data1 210
	.data1 72
	.data1 35
	.data1 8
	.data1 124
	.data1 104
	.data1 35
	.data1 131
	.data1 52
	.data1 40
	.data1 6
	.data1 196
	.data1 94
	.data1 0
	.data1 128
	.data1 73
	.data1 77
	.data1 88
	.data1 194
	.data1 97
	.data1 67
	.data1 128
	.data1 0
	.data1 65
	.data1 31
	.data1 138
	.data1 11
	.data1 12
	.data1 11
	.data1 21
	.data1 88
	.data1 176
	.data1 83
	.data1 135
	.data1 11
	.data1 129
	.data1 5
	.data1 58
	.data1 64
	.data1 100
	.data1 220
	.data1 160
	.data1 115
	.data1 124
	.data1 232
	.data1 32
	.data1 25
	.data1 244
	.data1 71
	.data1 106
	.data1 228
	.data1 144
	.data1 130
	.data1 14
	.data1 18
	.data1 96
	.data1 31
	.data1 164
	.data1 6
	.data1 162
	.data1 209
	.data1 65
	.data1 31
	.data1 22
	.data1 7
	.data1 155
	.data1 1
	.data1 31
	.data1 216
	.data1 44
	.data1 72
	.data1 35
	.data1 141
	.data1 210
	.data1 145
	.data1 64
	.data1 6
	.data1 29
	.data1 100
	.data1 96
	.data1 115
	.data1 40
	.data1 230
	.data1 238
	.data1 252
	.data1 227
	.data1 194
	.data1 61
	.data1 72
	.data1 225
	.data1 119
	.data1 82
	.data1 2
	.data1 0
	.data1 128
	.data1 73
	.data1 34
	.data1 240
	.data1 2
	.data1 24
	.data1 28
	.data1 4
	.data1 24
	.data1 90
	.data1 92
	.data1 243
	.data1 195
	.data1 28
	.data1 26
	.data1 22
	.data1 166
	.data1 104
	.data1 46
	.data1 252
	.data1 88
	.data1 192
	.data1 57
	.data1 33
	.data1 208
	.data1 71
	.data1 11
	.data1 58
	.data1 136
	.data1 67
	.data1 6
	.data1 105
	.data1 164
	.data1 6
	.data1 99
	.data1 208
	.data1 65
	.data1 31
	.data1 230
	.data1 15
	.data1 139
	.data1 131
	.data1 209
	.data1 176
	.data1 88
	.data1 193
	.data1 30
	.data1 160
	.data1 195
	.data1 176
	.data1 57
	.data1 36
	.data1 144
	.data1 65
	.data1 28
	.data1 62
	.data1 40
	.data1 18
	.data1 131
	.data1 181
	.data1 150
	.data1 11
	.data1 37
	.data1 104
	.data1 0
	.data1 128
	.data1 9
	.data1 10
	.data1 45
	.data1 48
	.data1 93
	.data1 224
	.data1 192
	.data1 185
	.data1 112
	.data1 44
	.data1 225
	.data1 71
	.data1 79
	.data1 202
	.data1 48
	.data1 55
	.data1 199
	.data1 24
	.data1 230
	.data1 167
	.data1 163
	.data1 140
	.data1 15
	.data1 99
	.data1 192
	.data1 31
	.data1 29
	.data1 180
	.data1 192
	.data1 16
	.data1 96
	.data1 60
	.data1 140
	.data1 134
	.data1 121
	.data1 5
	.data1 155
	.data1 1
	.data1 157
	.data1 128
	.data1 69
	.data1 134
	.data1 197
	.data1 160
	.data1 13
	.data1 29
	.data1 112
	.data1 194
	.data1 222
	.data1 28
	.data1 143
	.data1 22
	.data1 195
	.data1 60
	.data1 148
	.data1 148
	.data1 1
	.data1 0
	.data1 128
	.data1 9
	.data1 4
	.data1 228
	.data1 133
	.data1 35
	.data1 14
	.data1 163
	.data1 96
	.data1 92
	.data1 72
	.data1 15
	.data1 42
	.data1 241
	.data1 99
	.data1 18
	.data1 88
	.data1 54
	.data1 67
	.data1 45
	.data1 121
	.data1 153
	.data1 97
	.data1 164
	.data1 134
	.data1 114
	.data1 240
	.data1 1
	.data1 29
	.data1 3
	.data1 243
	.data1 7
	.data1 157
	.data1 128
	.data1 57
	.data1 7
	.data1 226
	.data1 208
	.data1 65
	.data1 6
	.data1 12
	.data1 206
	.data1 5
	.data1 141
	.data1 223
	.data1 129
	.data1 215
	.data1 112
	.data1 72
	.data1 130
	.data1 2
	.data1 0
	.data1 128
	.data1 137
	.data1 26
	.data1 22
	.data1 13
	.data1 25
	.data1 194
	.data1 113
	.data1 17
	.data1 46
	.data1 69
	.data1 220
	.data1 1
	.data1 89
	.data1 42
	.data1 244
	.data1 164
	.data1 4
	.data1 19
	.data1 176
	.data1 22
	.data1 194
	.data1 101
	.data1 70
	.data1 155
	.data1 113
	.data1 76
	.data1 128
	.data1 195
	.data1 160
	.data1 175
	.data1 224
	.data1 25
	.data1 29
	.data1 100
	.data1 64
	.data1 23
	.data1 34
	.data1 158
	.data1 66
	.data1 185
	.data1 24
	.data1 204
	.data1 167
	.data1 4
	.data1 5
	.data1 0
	.data1 128
	.data1 137
	.data1 10
	.data1 232
	.data1 56
	.data1 252
	.data1 64
	.data1 128
	.data1 145
	.data1 130
	.data1 130
	.data1 233
	.data1 133

	.local	bitsleft                ## @bitsleft
	.comm	bitsleft,4,4
	.section	.data.rel,"aw",@progbits
	.align	4                       ## @nextbyte
nextbyte:
	.data4	fax

	.local	lastbyte                ## @lastbyte
	.comm	lastbyte,4,4
	.local	eof                     ## @eof
	.comm	eof,1,1
	.local	sum                     ## @sum
	.comm	sum,4,4
.section .data
g3white:                                ## @g3white
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 3
	.data1 4
	.data1 0
	.data1 0
	.data1 5
	.data1 6
	.data1 0
	.data1 7
	.data1 8
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 11
	.data1 12
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 67
	.data1 9
	.data1 10
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 66
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 14
	.data1 0
	.data1 0
	.data1 0
	.data1 2
	.data1 13
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 68
	.data1 91
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 17
	.data1 18
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 15
	.data1 16
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 23
	.data1 24
	.data1 0
	.data1 0
	.data1 0
	.data1 21
	.data1 0
	.data1 0
	.data1 0
	.data1 20
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 27
	.data1 0
	.data1 0
	.data1 0
	.data1 22
	.data1 29
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 28
	.data1 0
	.data1 0
	.data1 19
	.data1 25
	.data1 0
	.data1 0
	.data1 26
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 69
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 30
	.data1 31
	.data1 46
	.data1 47
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 48
	.data1 49
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 34
	.data1 35
	.data1 36
	.data1 37
	.data1 38
	.data1 39
	.data1 0
	.data1 0
	.data1 32
	.data1 33
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 54
	.data1 55
	.data1 0
	.data1 0
	.data1 40
	.data1 41
	.data1 42
	.data1 43
	.data1 44
	.data1 45
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 62
	.data1 63
	.data1 64
	.data1 1
	.data1 70
	.data1 71
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 60
	.data1 61
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 50
	.data1 51
	.data1 52
	.data1 53
	.data1 0
	.data1 0
	.data1 56
	.data1 57
	.data1 58
	.data1 59
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 72
	.data1 73
	.data1 0
	.data1 75
	.data1 74
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 88
	.data1 89
	.data1 90
	.data1 92
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 76
	.data1 77
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 78
	.data1 79
	.data1 80
	.data1 81
	.data1 82
	.data1 83
	.data1 84
	.data1 85
	.data1 86
	.data1 87
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 255
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 93
	.data1 0
	.data1 0
	.data1 0
	.data1 94
	.data1 95
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 255
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 96
	.data1 97
	.data1 98
	.data1 99
	.data1 100
	.data1 101
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 102
	.data1 103
	.data1 104
	.data1 105
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0

	.local	rowbuf                  ## @rowbuf
	.comm	rowbuf,1728,1
g3black:                                ## @g3black
	.data1 0
	.data1 0
	.data1 4
	.data1 3
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 2
	.data1 5
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 7
	.data1 6
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 8
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 10
	.data1 9
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 11
	.data1 12
	.data1 0
	.data1 13
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 14
	.data1 0
	.data1 0
	.data1 15
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 16
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 19
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 66
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 17
	.data1 18
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 1
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 255
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 93
	.data1 0
	.data1 0
	.data1 0
	.data1 94
	.data1 95
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 25
	.data1 26
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 24
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 23
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 20
	.data1 21
	.data1 0
	.data1 0
	.data1 0
	.data1 22
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 255
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 96
	.data1 97
	.data1 98
	.data1 99
	.data1 100
	.data1 101
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 102
	.data1 103
	.data1 104
	.data1 105
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 53
	.data1 0
	.data1 0
	.data1 56
	.data1 57
	.data1 0
	.data1 0
	.data1 60
	.data1 61
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 70
	.data1 71
	.data1 72
	.data1 0
	.data1 54
	.data1 55
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 51
	.data1 52
	.data1 45
	.data1 46
	.data1 47
	.data1 48
	.data1 58
	.data1 59
	.data1 62
	.data1 69
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 49
	.data1 50
	.data1 63
	.data1 64
	.data1 31
	.data1 32
	.data1 33
	.data1 34
	.data1 41
	.data1 42
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 67
	.data1 68
	.data1 27
	.data1 28
	.data1 29
	.data1 30
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 35
	.data1 36
	.data1 37
	.data1 38
	.data1 39
	.data1 40
	.data1 0
	.data1 0
	.data1 43
	.data1 44
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 255
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 75
	.data1 76
	.data1 77
	.data1 78
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 85
	.data1 86
	.data1 87
	.data1 88
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 89
	.data1 90
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 91
	.data1 92
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 73
	.data1 74
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 79
	.data1 80
	.data1 81
	.data1 82
	.data1 83
	.data1 84
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0

	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	4                       ## @str
str:
	.data1 45
	.data1 49
	.data1 0
.skip 5

	.align	4                       ## @str3
str3:
	.data1 54
	.data1 54
	.data1 54
	.data1 0
.skip 4

	.align	4                       ## @str4
str4:
	.data1 104
	.data1 101
	.data1 114
	.data1 101
	.data1 0
.skip 3


