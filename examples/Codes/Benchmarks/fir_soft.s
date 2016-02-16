.section .text

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-128, arg() ## @main
main::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -128
;;
	c0	stw 108[$r0.1] = $r0.57
;;
	c0	stw 104[$r0.1] = $r0.58
;;
	c0	stw 100[$r0.1] = $r0.59
;;
	c0	stw 96[$r0.1] = $r0.60
;;
	c0	stw 92[$r0.1] = $r0.61
;;
	c0	stw 88[$r0.1] = $r0.62
;;
	c0	stw 84[$r0.1] = $r0.63
;;
	c0	stw 80[$r0.1] = $l0.0
	c0	mov $r0.60 = 0
;;
	c0	stw 40[$r0.1] = $r0.60
	c0	mov $r0.11 = in_data
	c0	mov $r0.12 = 18
;;
	c0	stw 32[$r0.1] = $r0.12
	c0	mov $r0.59 = output
;;
	c0	stw 36[$r0.1] = $r0.59
	c0	add $r0.12 = $r0.11, 68
;;
	c0	stw 28[$r0.1] = $r0.12
	c0	mov $r0.12 = fir_int
;;
	c0	stw 24[$r0.1] = $r0.12
	c0	mov $r0.12 = 31
;;
	c0	stw 60[$r0.1] = $r0.12
	c0	mov $r0.12 = 8
;;
	c0	stw 56[$r0.1] = $r0.12
	c0	add $r0.61 = $r0.11, 2796
	c0	mov $r0.11 = -1
;;
	c0	stw 64[$r0.1] = $r0.11
	c0	mov $r0.11 = 285
;;
	c0	stw 52[$r0.1] = $r0.11
	c0	mov $r0.11 = .str2
;;
	c0	stw 48[$r0.1] = $r0.11
	c0	mov $r0.11 = out_data
;;
	c0	stw 20[$r0.1] = $r0.11
	c0	mov $r0.11 = $r0.60
;;
LBB0_1::                                ## %for.body.i.preheader
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_2 Depth 2
                                        ##       Child Loop BB0_4 Depth 3
	c0	stw 44[$r0.1] = $r0.11
;;
	c0	ldw $r0.57 = 24[$r0.1]
;;
	c0	ldw $r0.58 = 28[$r0.1]
;;
	c0	ldw $r0.62 = 32[$r0.1]
;;
LBB0_2::                                ## %for.body.i
                                        ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB0_4 Depth 3
	c0	ldw $r0.11 = 0[$r0.57]
	c0	add $r0.20 = $r0.57, 4
;;
	c0	ldw $r0.12 = 0[$r0.58]
;;
	c0	mpyhs $r0.13 = $r0.12, $r0.11
	c0	mpylu $r0.11 = $r0.12, $r0.11
;;
	c0	add $r0.11 = $r0.11, $r0.13
	c0	cmplt $b0.0 = $r0.62, 2
;;
	c0	br $b0.0, LBB0_5
;;
## BB#3:                                ## %for.body7.i.preheader
                                        ##   in Loop: Header=BB0_2 Depth=2
	c0	add $r0.12 = $r0.62, -1
	c0	add $r0.13 = $r0.58, -4
	c0	mov $r0.14 = $r0.20
;;
LBB0_4::                                ## %for.body7.i
                                        ##   Parent Loop BB0_1 Depth=1
                                        ##     Parent Loop BB0_2 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	c0	ldw $r0.15 = 0[$r0.13]
;;
	c0	ldw $r0.16 = 0[$r0.14]
;;
	c0	mpylu $r0.17 = $r0.15, $r0.16
	c0	mpyhs $r0.15 = $r0.15, $r0.16
	c0	add $r0.14 = $r0.14, 4
	c0	add $r0.13 = $r0.13, -4
;;
	c0	add $r0.15 = $r0.17, $r0.15
	c0	add $r0.12 = $r0.12, -1
;;
	c0	add $r0.11 = $r0.15, $r0.11
	c0	cmpne $b0.0 = $r0.12, 0
;;
	c0	br $b0.0, LBB0_4
;;
LBB0_5::                                ## %for.end.i
                                        ##   in Loop: Header=BB0_2 Depth=2
	c0	mpyhs $r0.12 = $r0.11, -437031759
	c0	mpylu $r0.13 = $r0.11, -437031759
;;
	c0	add $r0.12 = $r0.13, $r0.12
	c0	cmplt $b0.0 = $r0.62, 35
;;
	c0	add $r0.12 = $r0.12, $r0.11
	c0	ldw $r0.13 = 60[$r0.1]
;;
	c0	shru $r0.13 = $r0.12, $r0.13
	c0	ldw $r0.14 = 56[$r0.1]
;;
	c0	shr $r0.12 = $r0.12, $r0.14
	c0	cmpeq $b0.1 = $r0.58, $r0.61
;;
	c0	mfb $r0.14 = $b0.1
;;
	c0	stw 76[$r0.1] = $r0.14
;;
	c0	mfb $r0.14 = $b0.0
	c0	add $r0.63 = $r0.12, $r0.13
	c0	ldw $r0.12 = 64[$r0.1]
;;
	c0	slct $r0.12 = $b0.1, $r0.12, $r0.14
;;
	c0	stw 68[$r0.1] = $r0.12
;;
	c0	ldw $r0.3 = 48[$r0.1]
	c0	mov $r0.4 = $r0.11
;;
	c0	ldw $r0.5 = 52[$r0.1]
	c0	mov $r0.6 = $r0.63
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	stw 72[$r0.1] = $r0.20
	c0	call $l0.0 = printf
;;
	c0	ldw $r0.11 = 68[$r0.1]
;;
	c0	add $r0.62 = $r0.11, $r0.62
	c0	add $r0.11 = $r0.58, 4
	c0	ldw $r0.12 = 76[$r0.1]
;;
	c0	mtb $b0.0 = $r0.12
;;
	c0	slct $r0.58 = $b0.0, $r0.61, $r0.11
	c0	stw 0[$r0.59] = $r0.63
	c0	add $r0.60 = $r0.60, 1
;;
	c0	ldw $r0.11 = 72[$r0.1]
;;
	c0	slct $r0.57 = $b0.0, $r0.11, $r0.57
	c0	add $r0.59 = $r0.59, 4
	c0	cmpne $b0.0 = $r0.60, 700
;;
	c0	br $b0.0, LBB0_2
;;
## BB#6:                                ## %fir_filter_int.exit
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.11 = 44[$r0.1]
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	cmpeq $b0.0 = $r0.11, 200
	c0	ldw $r0.60 = 40[$r0.1]
;;
	c0	ldw $r0.59 = 36[$r0.1]
	c0	brf $b0.0, LBB0_1
;;
LBB0_8::                                ## %for.body3
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.15 = 20[$r0.1]
;;
	c0	ldw $r0.11 = 0[$r0.15]
;;
	c0	ldw $r0.12 = 0[$r0.59]
;;
	c0	cmpeq $b0.0 = $r0.12, $r0.11
;;
	c0	brf $b0.0, LBB0_9
;;
## BB#7:                                ## %for.cond1
                                        ##   in Loop: Header=BB0_8 Depth=1
	c0	add $r0.60 = $r0.60, 1
	c0	add $r0.59 = $r0.59, 4
	c0	add $r0.15 = $r0.15, 4
;;
	c0	stw 20[$r0.1] = $r0.15
	c0	cmpgt $b0.0 = $r0.60, 699
;;
	c0	br $b0.0, LBB0_10
;;
	c0	goto LBB0_8
;;
LBB0_9::                                ## %if.then
	c0	mov $r0.57 = 666
	c0	mov $r0.3 = .str
;;
	c0	mov $r0.4 = $r0.12
	c0	mov $r0.5 = $r0.11
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	goto LBB0_11
;;
LBB0_10::                               ## %for.end10
	c0	mov $r0.3 = str
;;
.call puts, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = puts
;;
	c0	ldw $r0.57 = 64[$r0.1]
;;
LBB0_11::                               ## %return
	c0	mov $r0.3 = $r0.57
	c0	ldw $l0.0 = 80[$r0.1]
;;
	c0	ldw $r0.63 = 84[$r0.1]
;;
	c0	ldw $r0.62 = 88[$r0.1]
;;
	c0	ldw $r0.61 = 92[$r0.1]
;;
	c0	ldw $r0.60 = 96[$r0.1]
;;
	c0	ldw $r0.59 = 100[$r0.1]
;;
	c0	ldw $r0.58 = 104[$r0.1]
;;
.return ret($r0.3:s32)
	c0	ldw $r0.57 = 108[$r0.1]
	c0	return $r0.1 = $r0.1, 128, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg() ## @fir_filter_int
fir_filter_int::
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
	c0	mov $r0.11 = $r0.5
;;
	c0	stw 44[$r0.1] = $r0.11
	c0	cmplt $b0.0 = $r0.11, 1
;;
	c0	br $b0.0, LBB1_6
;;
## BB#1:                                ## %for.body.lr.ph
	c0	ldw $r0.11 = 44[$r0.1]
;;
	c0	sh2add $r0.11 = $r0.11, $r0.3
	c0	add $r0.12 = $r0.7, 1
	c0	mov $r0.13 = 1
;;
	c0	shr $r0.58 = $r0.12, $r0.13
	c0	add $r0.11 = $r0.11, -4
;;
	c0	stw 36[$r0.1] = $r0.11
	c0	sh2add $r0.11 = $r0.58, $r0.3
	c0	mov $r0.60 = 0
;;
	c0	stw 40[$r0.1] = $r0.60
;;
	c0	stw 40[$r0.1] = $r0.60
	c0	add $r0.61 = $r0.11, -4
	c0	cmplt $r0.12 = $r0.8, $r0.0
;;
	c0	stw 32[$r0.1] = $r0.12
	c0	sub $r0.11 = $r0.0, $r0.8
	c0	mtb $b0.0 = $r0.12
;;
	c0	slct $r0.63 = $b0.0, $r0.11, $r0.8
	c0	mov $r0.11 = -1
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	mov $r0.11 = .str2
;;
	c0	stw 24[$r0.1] = $r0.11
	c0	mov $r0.59 = $r0.4
	c0	mov $r0.57 = $r0.6
;;
LBB1_2::                                ## %for.body
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_4 Depth 2
	c0	ldw $r0.12 = 0[$r0.57]
	c0	add $r0.11 = $r0.57, 4
;;
	c0	ldw $r0.13 = 0[$r0.61]
;;
	c0	mpyhs $r0.14 = $r0.13, $r0.12
	c0	mpylu $r0.12 = $r0.13, $r0.12
;;
	c0	add $r0.12 = $r0.12, $r0.14
	c0	cmplt $b0.0 = $r0.58, 2
;;
	c0	br $b0.0, LBB1_5
;;
## BB#3:                                ## %for.body7.preheader
                                        ##   in Loop: Header=BB1_2 Depth=1
	c0	add $r0.13 = $r0.58, -1
	c0	add $r0.14 = $r0.61, -4
	c0	mov $r0.15 = $r0.11
;;
LBB1_4::                                ## %for.body7
                                        ##   Parent Loop BB1_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldw $r0.16 = 0[$r0.14]
;;
	c0	ldw $r0.17 = 0[$r0.15]
;;
	c0	mpylu $r0.18 = $r0.16, $r0.17
	c0	mpyhs $r0.16 = $r0.16, $r0.17
	c0	add $r0.15 = $r0.15, 4
	c0	add $r0.14 = $r0.14, -4
;;
	c0	add $r0.16 = $r0.18, $r0.16
	c0	add $r0.13 = $r0.13, -1
;;
	c0	add $r0.12 = $r0.16, $r0.12
	c0	cmpne $b0.0 = $r0.13, 0
;;
	c0	br $b0.0, LBB1_4
;;
LBB1_5::                                ## %for.end
                                        ##   in Loop: Header=BB1_2 Depth=1
	c0	cmplt $r0.13 = $r0.12, $r0.0
	c0	sub $r0.14 = $r0.0, $r0.12
;;
	c0	mtb $b0.0 = $r0.13
;;
	c0	slct $r0.14 = $b0.0, $r0.14, $r0.12
	c0	ldw $r0.16 = 40[$r0.1]
;;
	c0	mtb $b0.0 = $r0.16
;;
	c0	addcg $r0.15, $b0.0 = $r0.14, $r0.14, $b0.0
	c0	mtb $b0.1 = $r0.16
;;
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	divs $r0.15, $b0.0 = $r0.0, $r0.63, $b0.0
;;
	c0	divs $r0.15, $b0.1 = $r0.15, $r0.63, $b0.1
	c0	addcg $r0.16, $b0.0 = $r0.14, $r0.14, $b0.0
;;
	c0	divs $r0.14, $b0.0 = $r0.15, $r0.63, $b0.0
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.63, $b0.1
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
;;
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.63, $b0.0
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.63, $b0.1
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
;;
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.63, $b0.0
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.63, $b0.1
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
;;
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.63, $b0.0
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.63, $b0.1
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
;;
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.63, $b0.0
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.63, $b0.1
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
;;
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.63, $b0.0
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.63, $b0.1
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
;;
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.63, $b0.0
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.63, $b0.1
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
;;
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.63, $b0.0
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.63, $b0.1
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
;;
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.63, $b0.0
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.63, $b0.1
	c0	addcg $r0.16, $b0.0 = $r0.15, $r0.15, $b0.0
;;
	c0	divs $r0.14, $b0.0 = $r0.14, $r0.63, $b0.0
	c0	addcg $r0.15, $b0.1 = $r0.16, $r0.16, $b0.1
;;
	c0	divs $r0.14, $b0.1 = $r0.14, $r0.63, $b0.1
	c0	addcg $r0.16, $b0.2 = $r0.15, $r0.15, $b0.0
	c0	ldw $r0.15 = 32[$r0.1]
;;
	c0	cmpeq $b0.0 = $r0.13, $r0.15
	c0	divs $r0.13, $b0.2 = $r0.14, $r0.63, $b0.2
	c0	addcg $r0.14, $b0.1 = $r0.16, $r0.16, $b0.1
;;
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.63, $b0.1
	c0	addcg $r0.15, $b0.2 = $r0.14, $r0.14, $b0.2
;;
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.63, $b0.2
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
;;
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.63, $b0.1
	c0	addcg $r0.15, $b0.2 = $r0.14, $r0.14, $b0.2
	c0	cmplt $b0.3 = $r0.58, $r0.7
;;
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.63, $b0.2
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
;;
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.63, $b0.1
	c0	addcg $r0.15, $b0.2 = $r0.14, $r0.14, $b0.2
;;
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.63, $b0.2
	c0	addcg $r0.14, $b0.1 = $r0.15, $r0.15, $b0.1
;;
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.63, $b0.1
	c0	addcg $r0.15, $b0.2 = $r0.14, $r0.14, $b0.2
	c0	ldw $r0.14 = 36[$r0.1]
;;
	c0	cmpeq $b0.4 = $r0.61, $r0.14
	c0	mfb $r0.14 = $b0.3
	c0	divs $r0.13, $b0.2 = $r0.13, $r0.63, $b0.2
	c0	addcg $r0.16, $b0.1 = $r0.15, $r0.15, $b0.1
;;
	c0	divs $r0.13, $b0.1 = $r0.13, $r0.63, $b0.1
	c0	addcg $r0.15, $b0.2 = $r0.16, $r0.16, $b0.2
;;
	c0	addcg $r0.16, $b0.1 = $r0.15, $r0.15, $b0.1
	c0	cmpge $r0.13 = $r0.13, $r0.0
	c0	ldw $r0.15 = 28[$r0.1]
;;
	c0	slct $r0.14 = $b0.4, $r0.15, $r0.14
	c0	orc $r0.15 = $r0.16, $r0.0
;;
	c0	add $r0.58 = $r0.58, $r0.14
	c0	add $r0.14 = $r0.61, 4
	c0	sh1add $r0.13 = $r0.15, $r0.13
;;
	c0	slct $r0.61 = $b0.4, $r0.61, $r0.14
	c0	sub $r0.14 = $r0.0, $r0.13
;;
	c0	slct $r0.62 = $b0.0, $r0.13, $r0.14
	c0	slct $r0.57 = $b0.4, $r0.11, $r0.57
	c0	ldw $r0.3 = 24[$r0.1]
	c0	mov $r0.4 = $r0.12
;;
	c0	mov $r0.5 = $r0.8
	c0	mov $r0.6 = $r0.62
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	stw 0[$r0.59] = $r0.62
	c0	add $r0.59 = $r0.59, 4
	c0	add $r0.60 = $r0.60, 1
;;
	c0	ldw $r0.11 = 44[$r0.1]
;;
	c0	cmpne $b0.0 = $r0.60, $r0.11
;;
	c0	br $b0.0, LBB1_2
;;
LBB1_6::                                ## %for.end23
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

	.align	4                       ## @fir_int
fir_int::
	.data4	4294967294              ## 0xfffffffe
	.data4	1                       ## 0x1
	.data4	4                       ## 0x4
	.data4	3                       ## 0x3
	.data4	4294967294              ## 0xfffffffe
	.data4	4294967292              ## 0xfffffffc
	.data4	2                       ## 0x2
	.data4	7                       ## 0x7
	.data4	0                       ## 0x0
	.data4	4294967287              ## 0xfffffff7
	.data4	4294967292              ## 0xfffffffc
	.data4	12                      ## 0xc
	.data4	11                      ## 0xb
	.data4	4294967282              ## 0xfffffff2
	.data4	4294967270              ## 0xffffffe6
	.data4	15                      ## 0xf
	.data4	89                      ## 0x59
	.data4	127                     ## 0x7f
	.data4	89                      ## 0x59
	.data4	15                      ## 0xf
	.data4	4294967270              ## 0xffffffe6
	.data4	4294967282              ## 0xfffffff2
	.data4	11                      ## 0xb
	.data4	12                      ## 0xc
	.data4	4294967292              ## 0xfffffffc
	.data4	4294967287              ## 0xfffffff7
	.data4	0                       ## 0x0
	.data4	7                       ## 0x7
	.data4	2                       ## 0x2
	.data4	4294967292              ## 0xfffffffc
	.data4	4294967294              ## 0xfffffffe
	.data4	3                       ## 0x3
	.data4	4                       ## 0x4
	.data4	1                       ## 0x1
	.data4	4294967294              ## 0xfffffffe
	.data4	0                       ## 0x0

	.align	4                       ## @in_data
in_data::
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	127                     ## 0x7f
	.data4	121                     ## 0x79
	.data4	114                     ## 0x72
	.data4	121                     ## 0x79
	.data4	13                      ## 0xd
	.data4	13                      ## 0xd
	.data4	0                       ## 0x0
	.data4	3                       ## 0x3
	.data4	5                       ## 0x5
	.data4	2                       ## 0x2
	.data4	3                       ## 0x3
	.data4	127                     ## 0x7f
	.data4	127                     ## 0x7f
	.data4	2                       ## 0x2
	.data4	126                     ## 0x7e
	.data4	0                       ## 0x0
	.data4	1                       ## 0x1
	.data4	126                     ## 0x7e
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	127                     ## 0x7f
	.data4	0                       ## 0x0
	.data4	127                     ## 0x7f
	.data4	0                       ## 0x0
	.data4	2                       ## 0x2
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	3                       ## 0x3
	.data4	1                       ## 0x1
	.data4	127                     ## 0x7f
	.data4	1                       ## 0x1
	.data4	0                       ## 0x0
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	125                     ## 0x7d
	.data4	123                     ## 0x7b
	.data4	115                     ## 0x73
	.data4	106                     ## 0x6a
	.data4	119                     ## 0x77
	.data4	16                      ## 0x10
	.data4	14                      ## 0xe
	.data4	1                       ## 0x1
	.data4	5                       ## 0x5
	.data4	5                       ## 0x5
	.data4	5                       ## 0x5
	.data4	5                       ## 0x5
	.data4	125                     ## 0x7d
	.data4	0                       ## 0x0
	.data4	2                       ## 0x2
	.data4	125                     ## 0x7d
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	126                     ## 0x7e
	.data4	1                       ## 0x1
	.data4	126                     ## 0x7e
	.data4	127                     ## 0x7f
	.data4	3                       ## 0x3
	.data4	124                     ## 0x7c
	.data4	126                     ## 0x7e
	.data4	6                       ## 0x6
	.data4	0                       ## 0x0
	.data4	126                     ## 0x7e
	.data4	3                       ## 0x3
	.data4	2                       ## 0x2
	.data4	127                     ## 0x7f
	.data4	126                     ## 0x7e
	.data4	127                     ## 0x7f
	.data4	2                       ## 0x2
	.data4	1                       ## 0x1
	.data4	127                     ## 0x7f
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	0                       ## 0x0
	.data4	3                       ## 0x3
	.data4	0                       ## 0x0
	.data4	127                     ## 0x7f
	.data4	2                       ## 0x2
	.data4	0                       ## 0x0
	.data4	127                     ## 0x7f
	.data4	3                       ## 0x3
	.data4	1                       ## 0x1
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	125                     ## 0x7d
	.data4	0                       ## 0x0
	.data4	3                       ## 0x3
	.data4	0                       ## 0x0
	.data4	126                     ## 0x7e
	.data4	127                     ## 0x7f
	.data4	2                       ## 0x2
	.data4	1                       ## 0x1
	.data4	126                     ## 0x7e
	.data4	0                       ## 0x0
	.data4	3                       ## 0x3
	.data4	127                     ## 0x7f
	.data4	125                     ## 0x7d
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	127                     ## 0x7f
	.data4	0                       ## 0x0
	.data4	5                       ## 0x5
	.data4	0                       ## 0x0
	.data4	127                     ## 0x7f
	.data4	2                       ## 0x2
	.data4	126                     ## 0x7e
	.data4	127                     ## 0x7f
	.data4	2                       ## 0x2
	.data4	1                       ## 0x1
	.data4	0                       ## 0x0
	.data4	126                     ## 0x7e
	.data4	0                       ## 0x0
	.data4	5                       ## 0x5
	.data4	0                       ## 0x0
	.data4	127                     ## 0x7f
	.data4	0                       ## 0x0
	.data4	126                     ## 0x7e
	.data4	1                       ## 0x1
	.data4	0                       ## 0x0
	.data4	125                     ## 0x7d
	.data4	1                       ## 0x1
	.data4	3                       ## 0x3
	.data4	127                     ## 0x7f
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	126                     ## 0x7e
	.data4	2                       ## 0x2
	.data4	3                       ## 0x3
	.data4	126                     ## 0x7e
	.data4	125                     ## 0x7d
	.data4	114                     ## 0x72
	.data4	104                     ## 0x68
	.data4	113                     ## 0x71
	.data4	5                       ## 0x5
	.data4	12                      ## 0xc
	.data4	7                       ## 0x7
	.data4	2                       ## 0x2
	.data4	6                       ## 0x6
	.data4	13                      ## 0xd
	.data4	5                       ## 0x5
	.data4	125                     ## 0x7d
	.data4	3                       ## 0x3
	.data4	2                       ## 0x2
	.data4	127                     ## 0x7f
	.data4	0                       ## 0x0
	.data4	121                     ## 0x79
	.data4	122                     ## 0x7a
	.data4	3                       ## 0x3
	.data4	126                     ## 0x7e
	.data4	125                     ## 0x7d
	.data4	0                       ## 0x0
	.data4	125                     ## 0x7d
	.data4	2                       ## 0x2
	.data4	1                       ## 0x1
	.data4	125                     ## 0x7d
	.data4	8                       ## 0x8
	.data4	3                       ## 0x3
	.data4	124                     ## 0x7c
	.data4	6                       ## 0x6
	.data4	0                       ## 0x0
	.data4	122                     ## 0x7a
	.data4	6                       ## 0x6
	.data4	2                       ## 0x2
	.data4	124                     ## 0x7c
	.data4	3                       ## 0x3
	.data4	126                     ## 0x7e
	.data4	121                     ## 0x79
	.data4	6                       ## 0x6
	.data4	5                       ## 0x5
	.data4	116                     ## 0x74
	.data4	127                     ## 0x7f
	.data4	13                      ## 0xd
	.data4	122                     ## 0x7a
	.data4	120                     ## 0x78
	.data4	6                       ## 0x6
	.data4	5                       ## 0x5
	.data4	1                       ## 0x1
	.data4	0                       ## 0x0
	.data4	125                     ## 0x7d
	.data4	1                       ## 0x1
	.data4	4                       ## 0x4
	.data4	124                     ## 0x7c
	.data4	127                     ## 0x7f
	.data4	3                       ## 0x3
	.data4	127                     ## 0x7f
	.data4	5                       ## 0x5
	.data4	3                       ## 0x3
	.data4	122                     ## 0x7a
	.data4	6                       ## 0x6
	.data4	10                      ## 0xa
	.data4	118                     ## 0x76
	.data4	124                     ## 0x7c
	.data4	10                      ## 0xa
	.data4	124                     ## 0x7c
	.data4	127                     ## 0x7f
	.data4	6                       ## 0x6
	.data4	121                     ## 0x79
	.data4	3                       ## 0x3
	.data4	12                      ## 0xc
	.data4	117                     ## 0x75
	.data4	120                     ## 0x78
	.data4	10                      ## 0xa
	.data4	0                       ## 0x0
	.data4	121                     ## 0x79
	.data4	3                       ## 0x3
	.data4	126                     ## 0x7e
	.data4	124                     ## 0x7c
	.data4	6                       ## 0x6
	.data4	0                       ## 0x0
	.data4	121                     ## 0x79
	.data4	2                       ## 0x2
	.data4	126                     ## 0x7e
	.data4	127                     ## 0x7f
	.data4	6                       ## 0x6
	.data4	118                     ## 0x76
	.data4	127                     ## 0x7f
	.data4	13                      ## 0xd
	.data4	121                     ## 0x79
	.data4	127                     ## 0x7f
	.data4	6                       ## 0x6
	.data4	121                     ## 0x79
	.data4	6                       ## 0x6
	.data4	3                       ## 0x3
	.data4	113                     ## 0x71
	.data4	6                       ## 0x6
	.data4	10                      ## 0xa
	.data4	115                     ## 0x73
	.data4	127                     ## 0x7f
	.data4	10                      ## 0xa
	.data4	0                       ## 0x0
	.data4	127                     ## 0x7f
	.data4	122                     ## 0x7a
	.data4	124                     ## 0x7c
	.data4	10                      ## 0xa
	.data4	0                       ## 0x0
	.data4	117                     ## 0x75
	.data4	127                     ## 0x7f
	.data4	12                      ## 0xc
	.data4	10                      ## 0xa
	.data4	124                     ## 0x7c
	.data4	121                     ## 0x79
	.data4	9                       ## 0x9
	.data4	13                      ## 0xd
	.data4	125                     ## 0x7d
	.data4	122                     ## 0x7a
	.data4	5                       ## 0x5
	.data4	11                      ## 0xb
	.data4	10                      ## 0xa
	.data4	121                     ## 0x79
	.data4	124                     ## 0x7c
	.data4	22                      ## 0x16
	.data4	3                       ## 0x3
	.data4	114                     ## 0x72
	.data4	13                      ## 0xd
	.data4	7                       ## 0x7
	.data4	121                     ## 0x79
	.data4	12                      ## 0xc
	.data4	7                       ## 0x7
	.data4	122                     ## 0x7a
	.data4	11                      ## 0xb
	.data4	7                       ## 0x7
	.data4	122                     ## 0x7a
	.data4	10                      ## 0xa
	.data4	7                       ## 0x7
	.data4	121                     ## 0x79
	.data4	10                      ## 0xa
	.data4	5                       ## 0x5
	.data4	117                     ## 0x75
	.data4	6                       ## 0x6
	.data4	5                       ## 0x5
	.data4	121                     ## 0x79
	.data4	5                       ## 0x5
	.data4	6                       ## 0x6
	.data4	1                       ## 0x1
	.data4	6                       ## 0x6
	.data4	0                       ## 0x0
	.data4	122                     ## 0x7a
	.data4	2                       ## 0x2
	.data4	7                       ## 0x7
	.data4	3                       ## 0x3
	.data4	125                     ## 0x7d
	.data4	1                       ## 0x1
	.data4	10                      ## 0xa
	.data4	7                       ## 0x7
	.data4	2                       ## 0x2
	.data4	127                     ## 0x7f
	.data4	127                     ## 0x7f
	.data4	9                       ## 0x9
	.data4	7                       ## 0x7
	.data4	121                     ## 0x79
	.data4	121                     ## 0x79
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	125                     ## 0x7d
	.data4	122                     ## 0x7a
	.data4	6                       ## 0x6
	.data4	12                      ## 0xc
	.data4	6                       ## 0x6
	.data4	125                     ## 0x7d
	.data4	127                     ## 0x7f
	.data4	13                      ## 0xd
	.data4	7                       ## 0x7
	.data4	121                     ## 0x79
	.data4	1                       ## 0x1
	.data4	6                       ## 0x6
	.data4	127                     ## 0x7f
	.data4	127                     ## 0x7f
	.data4	2                       ## 0x2
	.data4	3                       ## 0x3
	.data4	1                       ## 0x1
	.data4	126                     ## 0x7e
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	125                     ## 0x7d
	.data4	1                       ## 0x1
	.data4	0                       ## 0x0
	.data4	125                     ## 0x7d
	.data4	6                       ## 0x6
	.data4	3                       ## 0x3
	.data4	125                     ## 0x7d
	.data4	5                       ## 0x5
	.data4	7                       ## 0x7
	.data4	127                     ## 0x7f
	.data4	124                     ## 0x7c
	.data4	1                       ## 0x1
	.data4	6                       ## 0x6
	.data4	6                       ## 0x6
	.data4	124                     ## 0x7c
	.data4	122                     ## 0x7a
	.data4	7                       ## 0x7
	.data4	10                      ## 0xa
	.data4	0                       ## 0x0
	.data4	120                     ## 0x78
	.data4	1                       ## 0x1
	.data4	8                       ## 0x8
	.data4	0                       ## 0x0
	.data4	121                     ## 0x79
	.data4	122                     ## 0x7a
	.data4	4                       ## 0x4
	.data4	10                      ## 0xa
	.data4	0                       ## 0x0
	.data4	120                     ## 0x78
	.data4	1                       ## 0x1
	.data4	6                       ## 0x6
	.data4	122                     ## 0x7a
	.data4	117                     ## 0x75
	.data4	122                     ## 0x7a
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	121                     ## 0x79
	.data4	118                     ## 0x76
	.data4	127                     ## 0x7f
	.data4	7                       ## 0x7
	.data4	0                       ## 0x0
	.data4	122                     ## 0x7a
	.data4	125                     ## 0x7d
	.data4	2                       ## 0x2
	.data4	4                       ## 0x4
	.data4	124                     ## 0x7c
	.data4	122                     ## 0x7a
	.data4	2                       ## 0x2
	.data4	5                       ## 0x5
	.data4	124                     ## 0x7c
	.data4	122                     ## 0x7a
	.data4	125                     ## 0x7d
	.data4	127                     ## 0x7f
	.data4	0                       ## 0x0
	.data4	120                     ## 0x78
	.data4	117                     ## 0x75
	.data4	127                     ## 0x7f
	.data4	0                       ## 0x0
	.data4	121                     ## 0x79
	.data4	120                     ## 0x78
	.data4	121                     ## 0x79
	.data4	1                       ## 0x1
	.data4	3                       ## 0x3
	.data4	121                     ## 0x79
	.data4	121                     ## 0x79
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	127                     ## 0x7f
	.data4	127                     ## 0x7f
	.data4	121                     ## 0x79
	.data4	127                     ## 0x7f
	.data4	2                       ## 0x2
	.data4	122                     ## 0x7a
	.data4	124                     ## 0x7c
	.data4	125                     ## 0x7d
	.data4	124                     ## 0x7c
	.data4	127                     ## 0x7f
	.data4	125                     ## 0x7d
	.data4	121                     ## 0x79
	.data4	125                     ## 0x7d
	.data4	0                       ## 0x0
	.data4	121                     ## 0x79
	.data4	122                     ## 0x7a
	.data4	124                     ## 0x7c
	.data4	125                     ## 0x7d
	.data4	0                       ## 0x0
	.data4	125                     ## 0x7d
	.data4	125                     ## 0x7d
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	125                     ## 0x7d
	.data4	125                     ## 0x7d
	.data4	0                       ## 0x0
	.data4	125                     ## 0x7d
	.data4	126                     ## 0x7e
	.data4	0                       ## 0x0
	.data4	126                     ## 0x7e
	.data4	3                       ## 0x3
	.data4	3                       ## 0x3
	.data4	125                     ## 0x7d
	.data4	1                       ## 0x1
	.data4	5                       ## 0x5
	.data4	0                       ## 0x0
	.data4	126                     ## 0x7e
	.data4	125                     ## 0x7d
	.data4	127                     ## 0x7f
	.data4	3                       ## 0x3
	.data4	125                     ## 0x7d
	.data4	121                     ## 0x79
	.data4	1                       ## 0x1
	.data4	2                       ## 0x2
	.data4	125                     ## 0x7d
	.data4	127                     ## 0x7f
	.data4	1                       ## 0x1
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	127                     ## 0x7f
	.data4	127                     ## 0x7f
	.data4	126                     ## 0x7e
	.data4	127                     ## 0x7f
	.data4	0                       ## 0x0
	.data4	127                     ## 0x7f
	.data4	0                       ## 0x0
	.data4	124                     ## 0x7c
	.data4	125                     ## 0x7d
	.data4	0                       ## 0x0
	.data4	121                     ## 0x79
	.data4	120                     ## 0x78
	.data4	124                     ## 0x7c
	.data4	124                     ## 0x7c
	.data4	123                     ## 0x7b
	.data4	123                     ## 0x7b
	.data4	125                     ## 0x7d
	.data4	127                     ## 0x7f
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	127                     ## 0x7f
	.data4	0                       ## 0x0
	.data4	1                       ## 0x1
	.data4	2                       ## 0x2
	.data4	0                       ## 0x0
	.data4	127                     ## 0x7f
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	127                     ## 0x7f
	.data4	126                     ## 0x7e
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	127                     ## 0x7f
	.data4	0                       ## 0x0
	.data4	2                       ## 0x2
	.data4	1                       ## 0x1
	.data4	2                       ## 0x2
	.data4	6                       ## 0x6
	.data4	5                       ## 0x5
	.data4	3                       ## 0x3
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	5                       ## 0x5
	.data4	2                       ## 0x2
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	3                       ## 0x3
	.data4	0                       ## 0x0
	.data4	125                     ## 0x7d
	.data4	127                     ## 0x7f
	.data4	0                       ## 0x0
	.data4	127                     ## 0x7f
	.data4	126                     ## 0x7e
	.data4	0                       ## 0x0
	.data4	2                       ## 0x2
	.data4	3                       ## 0x3
	.data4	2                       ## 0x2
	.data4	1                       ## 0x1
	.data4	2                       ## 0x2
	.data4	3                       ## 0x3
	.data4	1                       ## 0x1
	.data4	124                     ## 0x7c
	.data4	125                     ## 0x7d
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	126                     ## 0x7e
	.data4	124                     ## 0x7c
	.data4	127                     ## 0x7f
	.data4	1                       ## 0x1
	.data4	0                       ## 0x0
	.data4	126                     ## 0x7e
	.data4	124                     ## 0x7c
	.data4	127                     ## 0x7f
	.data4	1                       ## 0x1
	.data4	0                       ## 0x0
	.data4	126                     ## 0x7e
	.data4	127                     ## 0x7f
	.data4	2                       ## 0x2
	.data4	3                       ## 0x3
	.data4	1                       ## 0x1
	.data4	0                       ## 0x0
	.data4	4                       ## 0x4
	.data4	6                       ## 0x6
	.data4	5                       ## 0x5
	.data4	6                       ## 0x6
	.data4	7                       ## 0x7
	.data4	10                      ## 0xa
	.data4	10                      ## 0xa
	.data4	4                       ## 0x4
	.data4	2                       ## 0x2
	.data4	5                       ## 0x5
	.data4	8                       ## 0x8
	.data4	9                       ## 0x9
	.data4	8                       ## 0x8
	.data4	7                       ## 0x7
	.data4	12                      ## 0xc
	.data4	20                      ## 0x14
	.data4	20                      ## 0x14
	.data4	16                      ## 0x10
	.data4	14                      ## 0xe
	.data4	20                      ## 0x14
	.data4	21                      ## 0x15
	.data4	15                      ## 0xf
	.data4	9                       ## 0x9
	.data4	7                       ## 0x7
	.data4	4                       ## 0x4
	.data4	126                     ## 0x7e
	.data4	118                     ## 0x76
	.data4	100                     ## 0x64
	.data4	65                      ## 0x41
	.data4	72                      ## 0x48
	.data4	125                     ## 0x7d
	.data4	108                     ## 0x6c
	.data4	61                      ## 0x3d
	.data4	103                     ## 0x67
	.data4	16                      ## 0x10
	.data4	6                       ## 0x6
	.data4	125                     ## 0x7d
	.data4	117                     ## 0x75
	.data4	7                       ## 0x7
	.data4	29                      ## 0x1d
	.data4	0                       ## 0x0
	.data4	108                     ## 0x6c
	.data4	2                       ## 0x2
	.data4	125                     ## 0x7d
	.data4	120                     ## 0x78
	.data4	119                     ## 0x77
	.data4	111                     ## 0x6f
	.data4	119                     ## 0x77
	.data4	1                       ## 0x1
	.data4	0                       ## 0x0
	.data4	2                       ## 0x2
	.data4	7                       ## 0x7
	.data4	10                      ## 0xa
	.data4	28                      ## 0x1c
	.data4	28                      ## 0x1c
	.data4	23                      ## 0x17
	.data4	35                      ## 0x23
	.data4	47                      ## 0x2f
	.data4	65                      ## 0x41
	.data4	67                      ## 0x43
	.data4	79                      ## 0x4f
	.data4	85                      ## 0x55
	.data4	88                      ## 0x58
	.data4	126                     ## 0x7e
	.data4	2                       ## 0x2
	.data4	76                      ## 0x4c
	.data4	16                      ## 0x10
	.data4	105                     ## 0x69
	.data4	44                      ## 0x2c
	.data4	13                      ## 0xd
	.data4	116                     ## 0x74
	.data4	42                      ## 0x2a
	.data4	116                     ## 0x74
	.data4	99                      ## 0x63
	.data4	41                      ## 0x29
	.data4	124                     ## 0x7c
	.data4	94                      ## 0x5e
	.data4	33                      ## 0x21
	.data4	53                      ## 0x35
	.data4	70                      ## 0x46
	.data4	36                      ## 0x24
	.data4	103                     ## 0x67
	.data4	53                      ## 0x35
	.data4	60                      ## 0x3c
	.data4	60                      ## 0x3c
	.data4	38                      ## 0x26
	.data4	38                      ## 0x26
	.data4	47                      ## 0x2f
	.data4	71                      ## 0x47
	.data4	100                     ## 0x64
	.data4	4                       ## 0x4
	.data4	19                      ## 0x13
	.data4	24                      ## 0x18
	.data4	39                      ## 0x27
	.data4	43                      ## 0x2b
	.data4	48                      ## 0x30
	.data4	27                      ## 0x1b
	.data4	127                     ## 0x7f
	.data4	120                     ## 0x78
	.data4	114                     ## 0x72
	.data4	104                     ## 0x68
	.data4	92                      ## 0x5c
	.data4	90                      ## 0x5a
	.data4	104                     ## 0x68
	.data4	124                     ## 0x7c
	.data4	3                       ## 0x3
	.data4	13                      ## 0xd
	.data4	38                      ## 0x26
	.data4	65                      ## 0x41
	.data4	81                      ## 0x51
	.data4	90                      ## 0x5a
	.data4	106                     ## 0x6a
	.data4	108                     ## 0x6c
	.data4	84                      ## 0x54
	.data4	120                     ## 0x78
	.data4	9                       ## 0x9
	.data4	69                      ## 0x45
	.data4	121                     ## 0x79
	.data4	31                      ## 0x1f
	.data4	11                      ## 0xb
	.data4	46                      ## 0x2e
	.data4	96                      ## 0x60
	.data4	11                      ## 0xb
	.data4	102                     ## 0x66
	.data4	127                     ## 0x7f
	.data4	104                     ## 0x68
	.data4	119                     ## 0x77
	.data4	78                      ## 0x4e
	.data4	70                      ## 0x46
	.data4	74                      ## 0x4a
	.data4	59                      ## 0x3b
	.data4	18                      ## 0x12
	.data4	91                      ## 0x5b
	.data4	55                      ## 0x37
	.data4	49                      ## 0x31
	.data4	33                      ## 0x21
	.data4	11                      ## 0xb
	.data4	18                      ## 0x12
	.data4	46                      ## 0x2e
	.data4	87                      ## 0x57
	.data4	126                     ## 0x7e
	.data4	25                      ## 0x19
	.data4	34                      ## 0x22
	.data4	43                      ## 0x2b
	.data4	63                      ## 0x3f
	.data4	58                      ## 0x3a
	.data4	37                      ## 0x25
	.data4	11                      ## 0xb
	.data4	121                     ## 0x79
	.data4	113                     ## 0x71
	.data4	104                     ## 0x68
	.data4	97                      ## 0x61
	.data4	92                      ## 0x5c
	.data4	102                     ## 0x66
	.data4	114                     ## 0x72
	.data4	6                       ## 0x6
	.data4	22                      ## 0x16
	.data4	41                      ## 0x29
	.data4	65                      ## 0x41
	.data4	94                      ## 0x5e
	.data4	109                     ## 0x6d
	.data4	102                     ## 0x66
	.data4	96                      ## 0x60
	.data4	110                     ## 0x6e
	.data4	23                      ## 0x17
	.data4	72                      ## 0x48
	.data4	54                      ## 0x36
	.data4	18                      ## 0x12
	.data4	23                      ## 0x17
	.data4	47                      ## 0x2f
	.data4	99                      ## 0x63
	.data4	120                     ## 0x78
	.data4	92                      ## 0x5c
	.data4	119                     ## 0x77
	.data4	108                     ## 0x6c
	.data4	117                     ## 0x75
	.data4	65                      ## 0x41
	.data4	73                      ## 0x49
	.data4	79                      ## 0x4f
	.data4	59                      ## 0x3b
	.data4	11                      ## 0xb
	.data4	84                      ## 0x54
	.data4	55                      ## 0x37
	.data4	0                       ## 0x0

	.align	4                       ## @out_data
out_data::
	.data4	3                       ## 0x3
	.data4	4294967290              ## 0xfffffffa
	.data4	4294967293              ## 0xfffffffd
	.data4	29                      ## 0x1d
	.data4	88                      ## 0x58
	.data4	137                     ## 0x89
	.data4	135                     ## 0x87
	.data4	86                      ## 0x56
	.data4	32                      ## 0x20
	.data4	7                       ## 0x7
	.data4	7                       ## 0x7
	.data4	4                       ## 0x4
	.data4	4294967289              ## 0xfffffff9
	.data4	0                       ## 0x0
	.data4	40                      ## 0x28
	.data4	91                      ## 0x5b
	.data4	107                     ## 0x6b
	.data4	79                      ## 0x4f
	.data4	43                      ## 0x2b
	.data4	33                      ## 0x21
	.data4	45                      ## 0x2d
	.data4	48                      ## 0x30
	.data4	39                      ## 0x27
	.data4	39                      ## 0x27
	.data4	55                      ## 0x37
	.data4	71                      ## 0x47
	.data4	66                      ## 0x42
	.data4	39                      ## 0x27
	.data4	8                       ## 0x8
	.data4	4294967284              ## 0xfffffff4
	.data4	4294967285              ## 0xfffffff5
	.data4	13                      ## 0xd
	.data4	46                      ## 0x2e
	.data4	59                      ## 0x3b
	.data4	37                      ## 0x25
	.data4	0                       ## 0x0
	.data4	4294967288              ## 0xfffffff8
	.data4	29                      ## 0x1d
	.data4	89                      ## 0x59
	.data4	131                     ## 0x83
	.data4	135                     ## 0x87
	.data4	111                     ## 0x6f
	.data4	78                      ## 0x4e
	.data4	47                      ## 0x2f
	.data4	18                      ## 0x12
	.data4	4294967295              ## 0xffffffff
	.data4	4294967291              ## 0xfffffffb
	.data4	4                       ## 0x4
	.data4	21                      ## 0x15
	.data4	35                      ## 0x23
	.data4	45                      ## 0x2d
	.data4	49                      ## 0x31
	.data4	47                      ## 0x2f
	.data4	41                      ## 0x29
	.data4	38                      ## 0x26
	.data4	42                      ## 0x2a
	.data4	54                      ## 0x36
	.data4	72                      ## 0x48
	.data4	88                      ## 0x58
	.data4	95                      ## 0x5f
	.data4	90                      ## 0x5a
	.data4	79                      ## 0x4f
	.data4	70                      ## 0x46
	.data4	65                      ## 0x41
	.data4	50                      ## 0x32
	.data4	27                      ## 0x1b
	.data4	23                      ## 0x17
	.data4	55                      ## 0x37
	.data4	105                     ## 0x69
	.data4	123                     ## 0x7b
	.data4	89                      ## 0x59
	.data4	47                      ## 0x2f
	.data4	36                      ## 0x24
	.data4	48                      ## 0x30
	.data4	42                      ## 0x2a
	.data4	8                       ## 0x8
	.data4	4294967286              ## 0xfffffff6
	.data4	7                       ## 0x7
	.data4	36                      ## 0x24
	.data4	49                      ## 0x31
	.data4	47                      ## 0x2f
	.data4	51                      ## 0x33
	.data4	50                      ## 0x32
	.data4	30                      ## 0x1e
	.data4	4                       ## 0x4
	.data4	7                       ## 0x7
	.data4	35                      ## 0x23
	.data4	51                      ## 0x33
	.data4	33                      ## 0x21
	.data4	14                      ## 0xe
	.data4	30                      ## 0x1e
	.data4	74                      ## 0x4a
	.data4	97                      ## 0x61
	.data4	75                      ## 0x4b
	.data4	33                      ## 0x21
	.data4	14                      ## 0xe
	.data4	34                      ## 0x22
	.data4	73                      ## 0x49
	.data4	94                      ## 0x5e
	.data4	77                      ## 0x4d
	.data4	37                      ## 0x25
	.data4	11                      ## 0xb
	.data4	24                      ## 0x18
	.data4	50                      ## 0x32
	.data4	51                      ## 0x33
	.data4	21                      ## 0x15
	.data4	5                       ## 0x5
	.data4	41                      ## 0x29
	.data4	100                     ## 0x64
	.data4	118                     ## 0x76
	.data4	77                      ## 0x4d
	.data4	22                      ## 0x16
	.data4	9                       ## 0x9
	.data4	38                      ## 0x26
	.data4	55                      ## 0x37
	.data4	35                      ## 0x23
	.data4	11                      ## 0xb
	.data4	21                      ## 0x15
	.data4	60                      ## 0x3c
	.data4	82                      ## 0x52
	.data4	64                      ## 0x40
	.data4	35                      ## 0x23
	.data4	29                      ## 0x1d
	.data4	45                      ## 0x2d
	.data4	54                      ## 0x36
	.data4	45                      ## 0x2d
	.data4	36                      ## 0x24
	.data4	41                      ## 0x29
	.data4	50                      ## 0x32
	.data4	44                      ## 0x2c
	.data4	33                      ## 0x21
	.data4	43                      ## 0x2b
	.data4	80                      ## 0x50
	.data4	123                     ## 0x7b
	.data4	141                     ## 0x8d
	.data4	115                     ## 0x73
	.data4	71                      ## 0x47
	.data4	34                      ## 0x22
	.data4	15                      ## 0xf
	.data4	7                       ## 0x7
	.data4	4294967295              ## 0xffffffff
	.data4	0                       ## 0x0
	.data4	19                      ## 0x13
	.data4	45                      ## 0x2d
	.data4	54                      ## 0x36
	.data4	43                      ## 0x2b
	.data4	35                      ## 0x23
	.data4	50                      ## 0x32
	.data4	78                      ## 0x4e
	.data4	92                      ## 0x5c
	.data4	85                      ## 0x55
	.data4	79                      ## 0x4f
	.data4	85                      ## 0x55
	.data4	92                      ## 0x5c
	.data4	80                      ## 0x50
	.data4	52                      ## 0x34
	.data4	32                      ## 0x20
	.data4	34                      ## 0x22
	.data4	50                      ## 0x32
	.data4	56                      ## 0x38
	.data4	47                      ## 0x2f
	.data4	37                      ## 0x25
	.data4	42                      ## 0x2a
	.data4	53                      ## 0x35
	.data4	50                      ## 0x32
	.data4	35                      ## 0x23
	.data4	31                      ## 0x1f
	.data4	54                      ## 0x36
	.data4	87                      ## 0x57
	.data4	96                      ## 0x60
	.data4	76                      ## 0x4c
	.data4	49                      ## 0x31
	.data4	45                      ## 0x2d
	.data4	64                      ## 0x40
	.data4	87                      ## 0x57
	.data4	103                     ## 0x67
	.data4	103                     ## 0x67
	.data4	76                      ## 0x4c
	.data4	33                      ## 0x21
	.data4	4                       ## 0x4
	.data4	8                       ## 0x8
	.data4	32                      ## 0x20
	.data4	48                      ## 0x30
	.data4	44                      ## 0x2c
	.data4	51                      ## 0x33
	.data4	78                      ## 0x4e
	.data4	97                      ## 0x61
	.data4	86                      ## 0x56
	.data4	57                      ## 0x39
	.data4	38                      ## 0x26
	.data4	38                      ## 0x26
	.data4	43                      ## 0x2b
	.data4	46                      ## 0x2e
	.data4	56                      ## 0x38
	.data4	74                      ## 0x4a
	.data4	87                      ## 0x57
	.data4	88                      ## 0x58
	.data4	92                      ## 0x5c
	.data4	95                      ## 0x5f
	.data4	80                      ## 0x50
	.data4	49                      ## 0x31
	.data4	29                      ## 0x1d
	.data4	49                      ## 0x31
	.data4	88                      ## 0x58
	.data4	93                      ## 0x5d
	.data4	55                      ## 0x37
	.data4	22                      ## 0x16
	.data4	35                      ## 0x23
	.data4	85                      ## 0x55
	.data4	113                     ## 0x71
	.data4	86                      ## 0x56
	.data4	40                      ## 0x28
	.data4	24                      ## 0x18
	.data4	48                      ## 0x30
	.data4	81                      ## 0x51
	.data4	96                      ## 0x60
	.data4	92                      ## 0x5c
	.data4	82                      ## 0x52
	.data4	79                      ## 0x4f
	.data4	84                      ## 0x54
	.data4	94                      ## 0x5e
	.data4	98                      ## 0x62
	.data4	87                      ## 0x57
	.data4	69                      ## 0x45
	.data4	58                      ## 0x3a
	.data4	53                      ## 0x35
	.data4	38                      ## 0x26
	.data4	23                      ## 0x17
	.data4	35                      ## 0x23
	.data4	71                      ## 0x47
	.data4	93                      ## 0x5d
	.data4	72                      ## 0x48
	.data4	39                      ## 0x27
	.data4	48                      ## 0x30
	.data4	97                      ## 0x61
	.data4	121                     ## 0x79
	.data4	90                      ## 0x5a
	.data4	49                      ## 0x31
	.data4	45                      ## 0x2d
	.data4	69                      ## 0x45
	.data4	79                      ## 0x4f
	.data4	65                      ## 0x41
	.data4	62                      ## 0x3e
	.data4	72                      ## 0x48
	.data4	72                      ## 0x48
	.data4	58                      ## 0x3a
	.data4	61                      ## 0x3d
	.data4	83                      ## 0x53
	.data4	85                      ## 0x55
	.data4	47                      ## 0x2f
	.data4	13                      ## 0xd
	.data4	31                      ## 0x1f
	.data4	85                      ## 0x55
	.data4	105                     ## 0x69
	.data4	71                      ## 0x47
	.data4	30                      ## 0x1e
	.data4	28                      ## 0x1c
	.data4	50                      ## 0x32
	.data4	60                      ## 0x3c
	.data4	49                      ## 0x31
	.data4	40                      ## 0x28
	.data4	45                      ## 0x2d
	.data4	52                      ## 0x34
	.data4	50                      ## 0x32
	.data4	46                      ## 0x2e
	.data4	46                      ## 0x2e
	.data4	47                      ## 0x2f
	.data4	45                      ## 0x2d
	.data4	47                      ## 0x2f
	.data4	50                      ## 0x32
	.data4	47                      ## 0x2f
	.data4	38                      ## 0x26
	.data4	35                      ## 0x23
	.data4	48                      ## 0x30
	.data4	61                      ## 0x3d
	.data4	44                      ## 0x2c
	.data4	3                       ## 0x3
	.data4	4294967279              ## 0xffffffef
	.data4	10                      ## 0xa
	.data4	52                      ## 0x34
	.data4	57                      ## 0x39
	.data4	24                      ## 0x18
	.data4	10                      ## 0xa
	.data4	40                      ## 0x28
	.data4	66                      ## 0x42
	.data4	40                      ## 0x28
	.data4	4294967291              ## 0xfffffffb
	.data4	4294967294              ## 0xfffffffe
	.data4	55                      ## 0x37
	.data4	97                      ## 0x61
	.data4	83                      ## 0x53
	.data4	50                      ## 0x32
	.data4	53                      ## 0x35
	.data4	75                      ## 0x4b
	.data4	76                      ## 0x4c
	.data4	54                      ## 0x36
	.data4	54                      ## 0x36
	.data4	78                      ## 0x4e
	.data4	86                      ## 0x56
	.data4	51                      ## 0x33
	.data4	14                      ## 0xe
	.data4	27                      ## 0x1b
	.data4	78                      ## 0x4e
	.data4	105                     ## 0x69
	.data4	81                      ## 0x51
	.data4	34                      ## 0x22
	.data4	13                      ## 0xd
	.data4	36                      ## 0x24
	.data4	75                      ## 0x4b
	.data4	94                      ## 0x5e
	.data4	77                      ## 0x4d
	.data4	42                      ## 0x2a
	.data4	18                      ## 0x12
	.data4	22                      ## 0x16
	.data4	41                      ## 0x29
	.data4	53                      ## 0x35
	.data4	51                      ## 0x33
	.data4	42                      ## 0x2a
	.data4	37                      ## 0x25
	.data4	38                      ## 0x26
	.data4	47                      ## 0x2f
	.data4	56                      ## 0x38
	.data4	49                      ## 0x31
	.data4	29                      ## 0x1d
	.data4	29                      ## 0x1d
	.data4	66                      ## 0x42
	.data4	104                     ## 0x68
	.data4	88                      ## 0x58
	.data4	26                      ## 0x1a
	.data4	4294967295              ## 0xffffffff
	.data4	42                      ## 0x2a
	.data4	99                      ## 0x63
	.data4	95                      ## 0x5f
	.data4	39                      ## 0x27
	.data4	10                      ## 0xa
	.data4	34                      ## 0x22
	.data4	52                      ## 0x34
	.data4	30                      ## 0x1e
	.data4	11                      ## 0xb
	.data4	39                      ## 0x27
	.data4	88                      ## 0x58
	.data4	90                      ## 0x5a
	.data4	46                      ## 0x2e
	.data4	16                      ## 0x10
	.data4	27                      ## 0x1b
	.data4	40                      ## 0x28
	.data4	35                      ## 0x23
	.data4	49                      ## 0x31
	.data4	96                      ## 0x60
	.data4	124                     ## 0x7c
	.data4	86                      ## 0x56
	.data4	27                      ## 0x1b
	.data4	29                      ## 0x1d
	.data4	93                      ## 0x5d
	.data4	129                     ## 0x81
	.data4	92                      ## 0x5c
	.data4	41                      ## 0x29
	.data4	44                      ## 0x2c
	.data4	78                      ## 0x4e
	.data4	81                      ## 0x51
	.data4	53                      ## 0x35
	.data4	51                      ## 0x33
	.data4	77                      ## 0x4d
	.data4	83                      ## 0x53
	.data4	50                      ## 0x32
	.data4	36                      ## 0x24
	.data4	80                      ## 0x50
	.data4	134                     ## 0x86
	.data4	133                     ## 0x85
	.data4	90                      ## 0x5a
	.data4	70                      ## 0x46
	.data4	93                      ## 0x5d
	.data4	107                     ## 0x6b
	.data4	91                      ## 0x5b
	.data4	79                      ## 0x4f
	.data4	99                      ## 0x63
	.data4	113                     ## 0x71
	.data4	84                      ## 0x54
	.data4	42                      ## 0x2a
	.data4	44                      ## 0x2c
	.data4	80                      ## 0x50
	.data4	86                      ## 0x56
	.data4	48                      ## 0x30
	.data4	30                      ## 0x1e
	.data4	77                      ## 0x4d
	.data4	141                     ## 0x8d
	.data4	144                     ## 0x90
	.data4	91                      ## 0x5b
	.data4	58                      ## 0x3a
	.data4	85                      ## 0x55
	.data4	128                     ## 0x80
	.data4	137                     ## 0x89
	.data4	120                     ## 0x78
	.data4	123                     ## 0x7b
	.data4	138                     ## 0x8a
	.data4	125                     ## 0x7d
	.data4	83                      ## 0x53
	.data4	62                      ## 0x3e
	.data4	91                      ## 0x5b
	.data4	131                     ## 0x83
	.data4	127                     ## 0x7f
	.data4	89                      ## 0x59
	.data4	74                      ## 0x4a
	.data4	91                      ## 0x5b
	.data4	94                      ## 0x5e
	.data4	46                      ## 0x2e
	.data4	4294967284              ## 0xfffffff4
	.data4	4294967283              ## 0xfffffff3
	.data4	45                      ## 0x2d
	.data4	95                      ## 0x5f
	.data4	97                      ## 0x61
	.data4	80                      ## 0x50
	.data4	84                      ## 0x54
	.data4	94                      ## 0x5e
	.data4	80                      ## 0x50
	.data4	48                      ## 0x30
	.data4	38                      ## 0x26
	.data4	52                      ## 0x34
	.data4	50                      ## 0x32
	.data4	24                      ## 0x18
	.data4	9                       ## 0x9
	.data4	39                      ## 0x27
	.data4	91                      ## 0x5b
	.data4	116                     ## 0x74
	.data4	109                     ## 0x6d
	.data4	94                      ## 0x5e
	.data4	82                      ## 0x52
	.data4	64                      ## 0x40
	.data4	45                      ## 0x2d
	.data4	52                      ## 0x34
	.data4	84                      ## 0x54
	.data4	92                      ## 0x5c
	.data4	49                      ## 0x31
	.data4	0                       ## 0x0
	.data4	10                      ## 0xa
	.data4	86                      ## 0x56
	.data4	156                     ## 0x9c
	.data4	150                     ## 0x96
	.data4	89                      ## 0x59
	.data4	46                      ## 0x2e
	.data4	56                      ## 0x38
	.data4	87                      ## 0x57
	.data4	94                      ## 0x5e
	.data4	75                      ## 0x4b
	.data4	70                      ## 0x46
	.data4	94                      ## 0x5e
	.data4	120                     ## 0x78
	.data4	124                     ## 0x7c
	.data4	119                     ## 0x77
	.data4	128                     ## 0x80
	.data4	141                     ## 0x8d
	.data4	125                     ## 0x7d
	.data4	79                      ## 0x4f
	.data4	43                      ## 0x2b
	.data4	43                      ## 0x2b
	.data4	51                      ## 0x33
	.data4	30                      ## 0x1e
	.data4	0                       ## 0x0
	.data4	6                       ## 0x6
	.data4	40                      ## 0x28
	.data4	55                      ## 0x37
	.data4	29                      ## 0x1d
	.data4	9                       ## 0x9
	.data4	36                      ## 0x24
	.data4	83                      ## 0x53
	.data4	93                      ## 0x5d
	.data4	61                      ## 0x3d
	.data4	31                      ## 0x1f
	.data4	33                      ## 0x21
	.data4	41                      ## 0x29
	.data4	24                      ## 0x18
	.data4	4294967292              ## 0xfffffffc
	.data4	4294967285              ## 0xfffffff5
	.data4	6                       ## 0x6
	.data4	18                      ## 0x12
	.data4	9                       ## 0x9
	.data4	4294967293              ## 0xfffffffd
	.data4	1                       ## 0x1
	.data4	15                      ## 0xf
	.data4	12                      ## 0xc
	.data4	4294967290              ## 0xfffffffa
	.data4	4294967282              ## 0xfffffff2
	.data4	9                       ## 0x9
	.data4	50                      ## 0x32
	.data4	77                      ## 0x4d
	.data4	86                      ## 0x56
	.data4	92                      ## 0x5c
	.data4	98                      ## 0x62
	.data4	83                      ## 0x53
	.data4	39                      ## 0x27
	.data4	0                       ## 0x0
	.data4	4294967292              ## 0xfffffffc
	.data4	12                      ## 0xc
	.data4	8                       ## 0x8
	.data4	4294967280              ## 0xfffffff0
	.data4	4294967289              ## 0xfffffff9
	.data4	54                      ## 0x36
	.data4	106                     ## 0x6a
	.data4	85                      ## 0x55
	.data4	28                      ## 0x1c
	.data4	27                      ## 0x1b
	.data4	96                      ## 0x60
	.data4	142                     ## 0x8e
	.data4	97                      ## 0x61
	.data4	21                      ## 0x15
	.data4	20                      ## 0x14
	.data4	94                      ## 0x5e
	.data4	140                     ## 0x8c
	.data4	97                      ## 0x61
	.data4	29                      ## 0x1d
	.data4	26                      ## 0x1a
	.data4	82                      ## 0x52
	.data4	107                     ## 0x6b
	.data4	61                      ## 0x3d
	.data4	4294967291              ## 0xfffffffb
	.data4	4294967272              ## 0xffffffe8
	.data4	1                       ## 0x1
	.data4	21                      ## 0x15
	.data4	12                      ## 0xc
	.data4	4294967294              ## 0xfffffffe
	.data4	0                       ## 0x0
	.data4	13                      ## 0xd
	.data4	17                      ## 0x11
	.data4	9                       ## 0x9
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	7                       ## 0x7
	.data4	12                      ## 0xc
	.data4	11                      ## 0xb
	.data4	7                       ## 0x7
	.data4	6                       ## 0x6
	.data4	13                      ## 0xd
	.data4	22                      ## 0x16
	.data4	23                      ## 0x17
	.data4	16                      ## 0x10
	.data4	12                      ## 0xc
	.data4	19                      ## 0x13
	.data4	28                      ## 0x1c
	.data4	19                      ## 0x13
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	38                      ## 0x26
	.data4	95                      ## 0x5f
	.data4	123                     ## 0x7b
	.data4	104                     ## 0x68
	.data4	72                      ## 0x48
	.data4	72                      ## 0x48
	.data4	104                     ## 0x68
	.data4	125                     ## 0x7d
	.data4	96                      ## 0x60
	.data4	45                      ## 0x2d
	.data4	25                      ## 0x19
	.data4	55                      ## 0x37
	.data4	92                      ## 0x5c
	.data4	90                      ## 0x5a
	.data4	49                      ## 0x31
	.data4	15                      ## 0xf
	.data4	19                      ## 0x13
	.data4	49                      ## 0x31
	.data4	76                      ## 0x4c
	.data4	94                      ## 0x5e
	.data4	113                     ## 0x71
	.data4	131                     ## 0x83
	.data4	127                     ## 0x7f
	.data4	88                      ## 0x58
	.data4	32                      ## 0x20
	.data4	4294967293              ## 0xfffffffd
	.data4	4294967288              ## 0xfffffff8
	.data4	9                       ## 0x9
	.data4	24                      ## 0x18
	.data4	25                      ## 0x19
	.data4	22                      ## 0x16
	.data4	25                      ## 0x19
	.data4	39                      ## 0x27
	.data4	55                      ## 0x37
	.data4	61                      ## 0x3d
	.data4	66                      ## 0x42
	.data4	79                      ## 0x4f
	.data4	98                      ## 0x62
	.data4	101                     ## 0x65
	.data4	79                      ## 0x4f
	.data4	51                      ## 0x33
	.data4	44                      ## 0x2c
	.data4	54                      ## 0x36
	.data4	61                      ## 0x3d
	.data4	56                      ## 0x38
	.data4	52                      ## 0x34
	.data4	64                      ## 0x40
	.data4	84                      ## 0x54
	.data4	93                      ## 0x5d
	.data4	91                      ## 0x5b
	.data4	88                      ## 0x58
	.data4	89                      ## 0x59
	.data4	83                      ## 0x53
	.data4	65                      ## 0x41
	.data4	50                      ## 0x32
	.data4	51                      ## 0x33
	.data4	63                      ## 0x3f
	.data4	74                      ## 0x4a
	.data4	75                      ## 0x4b
	.data4	67                      ## 0x43
	.data4	51                      ## 0x33
	.data4	37                      ## 0x25
	.data4	40                      ## 0x28
	.data4	61                      ## 0x3d
	.data4	79                      ## 0x4f
	.data4	68                      ## 0x44
	.data4	35                      ## 0x23
	.data4	14                      ## 0xe
	.data4	22                      ## 0x16
	.data4	41                      ## 0x29
	.data4	44                      ## 0x2c
	.data4	40                      ## 0x28
	.data4	57                      ## 0x39
	.data4	99                      ## 0x63
	.data4	132                     ## 0x84
	.data4	125                     ## 0x7d
	.data4	95                      ## 0x5f
	.data4	86                      ## 0x56
	.data4	105                     ## 0x69
	.data4	115                     ## 0x73
	.data4	86                      ## 0x56
	.data4	36                      ## 0x24
	.data4	12                      ## 0xc
	.data4	30                      ## 0x1e
	.data4	64                      ## 0x40
	.data4	86                      ## 0x56
	.data4	96                      ## 0x60
	.data4	105                     ## 0x69
	.data4	110                     ## 0x6e
	.data4	99                      ## 0x63
	.data4	78                      ## 0x4e
	.data4	66                      ## 0x42
	.data4	68                      ## 0x44
	.data4	71                      ## 0x47
	.data4	59                      ## 0x3b
	.data4	42                      ## 0x2a
	.data4	34                      ## 0x22
	.data4	45                      ## 0x2d
	.data4	69                      ## 0x45
	.data4	93                      ## 0x5d
	.data4	112                     ## 0x70
	.data4	119                     ## 0x77
	.data4	109                     ## 0x6d
	.data4	91                      ## 0x5b
	.data4	74                      ## 0x4a
	.data4	63                      ## 0x3f
	.data4	55                      ## 0x37
	.data4	50                      ## 0x32
	.data4	57                      ## 0x39
	.data4	67                      ## 0x43
	.data4	61                      ## 0x3d
	.data4	32                      ## 0x20
	.data4	5                       ## 0x5
	.data4	16                      ## 0x10
	.data4	63                      ## 0x3f
	.data4	100                     ## 0x64
	.data4	90                      ## 0x5a
	.data4	52                      ## 0x34
	.data4	33                      ## 0x21
	.data4	46                      ## 0x2e
	.data4	62                      ## 0x3e
	.data4	51                      ## 0x33
	.data4	34                      ## 0x22
	.data4	48                      ## 0x30
	.data4	89                      ## 0x59
	.data4	117                     ## 0x75
	.data4	113                     ## 0x71
	.data4	96                      ## 0x60
	.data4	97                      ## 0x61
	.data4	103                     ## 0x67
	.data4	85                      ## 0x55
	.data4	45                      ## 0x2d
	.data4	18                      ## 0x12
	.data4	29                      ## 0x1d
	.data4	67                      ## 0x43
	.data4	101                     ## 0x65
	.data4	113                     ## 0x71
	.data4	108                     ## 0x6c
	.data4	95                      ## 0x5f
	.data4	83                      ## 0x53
	.data4	71                      ## 0x47
	.data4	57                      ## 0x39
	.data4	41                      ## 0x29
	.data4	28                      ## 0x1c
	.data4	30                      ## 0x1e
	.data4	53                      ## 0x35
	.data4	86                      ## 0x56
	.data4	111                     ## 0x6f
	.data4	116                     ## 0x74
	.data4	111                     ## 0x6f
	.data4	106                     ## 0x6a
	.data4	102                     ## 0x66
	.data4	92                      ## 0x5c
	.data4	75                      ## 0x4b
	.data4	58                      ## 0x3a
	.data4	51                      ## 0x33
	.data4	54                      ## 0x36
	.data4	56                      ## 0x38
	.data4	44                      ## 0x2c
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

	.align	4                       ## @output
output::
	.data4	1                       ## 0x1
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
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	1                       ## 0x1

	.section	.data
.str::                                  ## @.str
	.data1 37
	.data1 100
	.data1 32
	.data1 33
	.data1 61
	.data1 32
	.data1 37
	.data1 100
	.data1 10
	.data1 0
.skip 6

.str2::                                 ## @.str2
	.data1 37
	.data1 100
	.data1 32
	.data1 32
	.data1 32
	.data1 37
	.data1 100
	.data1 32
	.data1 32
	.data1 32
	.data1 32
	.data1 37
	.data1 100
	.data1 10
	.data1 0
.skip 1

	.section	.data
	.align	4                       ## @str
str::
	.data1 45
	.data1 49
	.data1 0
.skip 5

.import printf
.import puts
