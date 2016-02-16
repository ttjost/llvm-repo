.section .text
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg() ## @jpeg_fdct_islow
jpeg_fdct_islow::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -96
;;
	c0	stw 92[$r0.1] = $r0.3
	c0	mov $r0.12 = 7
;;
	c0	stw 20[$r0.1] = $r0.3
;;
	c0	stw 16[$r0.1] = $r0.12
	c0	mov $r0.11 = 1
;;
	c0	mov $r0.13 = 12
;;
LBB0_1::                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.14 = 16[$r0.1]
;;
;;
	c0	cmplt $b0.0 = $r0.14, 0
;;
;;
	c0	br $b0.0, LBB0_3
;;
## BB#2:                                ## %for.inc
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.14 = 20[$r0.1]
;;
;;
	c0	ldw $r0.15 = 28[$r0.14]
;;
	c0	ldw $r0.14 = 0[$r0.14]
;;
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	stw 88[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 20[$r0.1]
;;
;;
	c0	ldw $r0.15 = 28[$r0.14]
;;
	c0	ldw $r0.14 = 0[$r0.14]
;;
;;
	c0	sub $r0.14 = $r0.14, $r0.15
;;
	c0	stw 60[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 20[$r0.1]
;;
;;
	c0	ldw $r0.15 = 24[$r0.14]
;;
	c0	ldw $r0.14 = 4[$r0.14]
;;
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	stw 84[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 20[$r0.1]
;;
;;
	c0	ldw $r0.15 = 24[$r0.14]
;;
	c0	ldw $r0.14 = 4[$r0.14]
;;
;;
	c0	sub $r0.14 = $r0.14, $r0.15
;;
	c0	stw 64[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 20[$r0.1]
;;
;;
	c0	ldw $r0.15 = 20[$r0.14]
;;
	c0	ldw $r0.14 = 8[$r0.14]
;;
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	stw 80[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 20[$r0.1]
;;
;;
	c0	ldw $r0.15 = 20[$r0.14]
;;
	c0	ldw $r0.14 = 8[$r0.14]
;;
;;
	c0	sub $r0.14 = $r0.14, $r0.15
;;
	c0	stw 68[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 20[$r0.1]
;;
;;
	c0	ldw $r0.15 = 16[$r0.14]
;;
	c0	ldw $r0.14 = 12[$r0.14]
;;
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	stw 76[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 20[$r0.1]
;;
;;
	c0	ldw $r0.15 = 16[$r0.14]
;;
	c0	ldw $r0.14 = 12[$r0.14]
;;
;;
	c0	sub $r0.14 = $r0.14, $r0.15
;;
	c0	stw 72[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 76[$r0.1]
;;
	c0	ldw $r0.15 = 88[$r0.1]
;;
;;
	c0	add $r0.14 = $r0.15, $r0.14
;;
	c0	stw 56[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 76[$r0.1]
;;
	c0	ldw $r0.15 = 88[$r0.1]
;;
;;
	c0	sub $r0.14 = $r0.15, $r0.14
;;
	c0	stw 44[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 80[$r0.1]
;;
	c0	ldw $r0.15 = 84[$r0.1]
;;
;;
	c0	add $r0.14 = $r0.15, $r0.14
;;
	c0	stw 52[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 80[$r0.1]
;;
	c0	ldw $r0.15 = 84[$r0.1]
;;
;;
	c0	sub $r0.14 = $r0.15, $r0.14
;;
	c0	stw 48[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 52[$r0.1]
;;
	c0	ldw $r0.15 = 56[$r0.1]
;;
	c0	ldw $r0.16 = 20[$r0.1]
;;
	c0	add $r0.14 = $r0.15, $r0.14
;;
	c0	shl $r0.14 = $r0.14, $r0.11
;;
	c0	stw 0[$r0.16] = $r0.14
;;
	c0	ldw $r0.14 = 52[$r0.1]
;;
	c0	ldw $r0.15 = 56[$r0.1]
;;
	c0	ldw $r0.16 = 20[$r0.1]
;;
	c0	sub $r0.14 = $r0.15, $r0.14
;;
	c0	shl $r0.14 = $r0.14, $r0.11
;;
	c0	stw 16[$r0.16] = $r0.14
;;
	c0	ldw $r0.14 = 44[$r0.1]
;;
	c0	ldw $r0.15 = 48[$r0.1]
;;
;;
	c0	add $r0.14 = $r0.15, $r0.14
;;
	c0	mpyhs $r0.15 = $r0.14, 4433
;;
	c0	mpylu $r0.14 = $r0.14, 4433
;;
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	stw 40[$r0.1] = $r0.14
;;
	c0	ldw $r0.15 = 44[$r0.1]
;;
	c0	ldw $r0.16 = 20[$r0.1]
;;
	c0	mpyhs $r0.17 = $r0.15, 6270
;;
	c0	mpylu $r0.15 = $r0.15, 6270
;;
;;
	c0	add $r0.15 = $r0.15, $r0.17
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	add $r0.14 = $r0.14, 2048
;;
	c0	shr $r0.14 = $r0.14, $r0.13
;;
	c0	stw 8[$r0.16] = $r0.14
;;
	c0	ldw $r0.14 = 48[$r0.1]
;;
	c0	ldw $r0.15 = 40[$r0.1]
;;
	c0	mpyhs $r0.16 = $r0.14, -15137
;;
	c0	mpylu $r0.14 = $r0.14, -15137
;;
	c0	ldw $r0.17 = 20[$r0.1]
;;
	c0	add $r0.14 = $r0.14, $r0.16
;;
	c0	add $r0.14 = $r0.15, $r0.14
;;
	c0	add $r0.14 = $r0.14, 2048
;;
	c0	shr $r0.14 = $r0.14, $r0.13
;;
	c0	stw 24[$r0.17] = $r0.14
;;
	c0	ldw $r0.14 = 60[$r0.1]
;;
	c0	ldw $r0.15 = 72[$r0.1]
;;
;;
	c0	add $r0.14 = $r0.15, $r0.14
;;
	c0	stw 40[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 64[$r0.1]
;;
	c0	ldw $r0.15 = 68[$r0.1]
;;
;;
	c0	add $r0.14 = $r0.15, $r0.14
;;
	c0	stw 36[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 64[$r0.1]
;;
	c0	ldw $r0.15 = 72[$r0.1]
;;
;;
	c0	add $r0.14 = $r0.15, $r0.14
;;
	c0	stw 32[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 60[$r0.1]
;;
	c0	ldw $r0.15 = 68[$r0.1]
;;
;;
	c0	add $r0.14 = $r0.15, $r0.14
;;
	c0	stw 28[$r0.1] = $r0.14
;;
	c0	ldw $r0.15 = 32[$r0.1]
;;
;;
	c0	add $r0.14 = $r0.15, $r0.14
;;
	c0	mpyhs $r0.15 = $r0.14, 9633
;;
	c0	mpylu $r0.14 = $r0.14, 9633
;;
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	stw 24[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 72[$r0.1]
;;
;;
	c0	mpyhs $r0.15 = $r0.14, 2446
;;
	c0	mpylu $r0.14 = $r0.14, 2446
;;
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	stw 72[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 68[$r0.1]
;;
;;
	c0	mpyhs $r0.15 = $r0.14, 16819
;;
	c0	mpylu $r0.14 = $r0.14, 16819
;;
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	stw 68[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 64[$r0.1]
;;
;;
	c0	mpyhs $r0.15 = $r0.14, 25172
;;
	c0	mpylu $r0.14 = $r0.14, 25172
;;
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	stw 64[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 60[$r0.1]
;;
;;
	c0	mpyhs $r0.15 = $r0.14, 12299
;;
	c0	mpylu $r0.14 = $r0.14, 12299
;;
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	stw 60[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 40[$r0.1]
;;
;;
	c0	mpyhs $r0.15 = $r0.14, -7373
;;
	c0	mpylu $r0.14 = $r0.14, -7373
;;
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	stw 40[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 36[$r0.1]
;;
;;
	c0	mpyhs $r0.15 = $r0.14, -20995
;;
	c0	mpylu $r0.14 = $r0.14, -20995
;;
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	stw 36[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 32[$r0.1]
;;
;;
	c0	mpyhs $r0.15 = $r0.14, -16069
;;
	c0	mpylu $r0.14 = $r0.14, -16069
;;
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	stw 32[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 28[$r0.1]
;;
;;
	c0	mpyhs $r0.15 = $r0.14, -3196
;;
	c0	mpylu $r0.14 = $r0.14, -3196
;;
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	stw 28[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 32[$r0.1]
;;
	c0	ldw $r0.15 = 24[$r0.1]
;;
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	stw 32[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 28[$r0.1]
;;
	c0	ldw $r0.15 = 24[$r0.1]
;;
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	stw 28[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 72[$r0.1]
;;
	c0	ldw $r0.15 = 40[$r0.1]
;;
	c0	ldw $r0.16 = 32[$r0.1]
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	add $r0.14 = $r0.14, $r0.16
	c0	ldw $r0.15 = 20[$r0.1]
;;
	c0	add $r0.14 = $r0.14, 2048
;;
	c0	shr $r0.14 = $r0.14, $r0.13
;;
	c0	stw 28[$r0.15] = $r0.14
;;
	c0	ldw $r0.14 = 68[$r0.1]
;;
	c0	ldw $r0.15 = 36[$r0.1]
;;
	c0	ldw $r0.16 = 28[$r0.1]
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	add $r0.14 = $r0.14, $r0.16
	c0	ldw $r0.15 = 20[$r0.1]
;;
	c0	add $r0.14 = $r0.14, 2048
;;
	c0	shr $r0.14 = $r0.14, $r0.13
;;
	c0	stw 20[$r0.15] = $r0.14
;;
	c0	ldw $r0.14 = 64[$r0.1]
;;
	c0	ldw $r0.15 = 36[$r0.1]
;;
	c0	ldw $r0.16 = 32[$r0.1]
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	add $r0.14 = $r0.14, $r0.16
	c0	ldw $r0.15 = 20[$r0.1]
;;
	c0	add $r0.14 = $r0.14, 2048
;;
	c0	shr $r0.14 = $r0.14, $r0.13
;;
	c0	stw 12[$r0.15] = $r0.14
;;
	c0	ldw $r0.14 = 60[$r0.1]
;;
	c0	ldw $r0.15 = 40[$r0.1]
;;
	c0	ldw $r0.16 = 28[$r0.1]
;;
	c0	add $r0.14 = $r0.14, $r0.15
;;
	c0	add $r0.14 = $r0.14, $r0.16
	c0	ldw $r0.15 = 20[$r0.1]
;;
	c0	add $r0.14 = $r0.14, 2048
;;
	c0	shr $r0.14 = $r0.14, $r0.13
;;
	c0	stw 4[$r0.15] = $r0.14
;;
	c0	ldw $r0.14 = 20[$r0.1]
;;
;;
	c0	add $r0.14 = $r0.14, 32
;;
	c0	stw 20[$r0.1] = $r0.14
;;
	c0	ldw $r0.14 = 16[$r0.1]
;;
;;
	c0	add $r0.14 = $r0.14, -1
;;
	c0	stw 16[$r0.1] = $r0.14
	c0	goto LBB0_1
;;
LBB0_3::                                ## %for.end
	c0	ldw $r0.13 = 92[$r0.1]
;;
;;
	c0	stw 20[$r0.1] = $r0.13
;;
	c0	stw 16[$r0.1] = $r0.12
	c0	mov $r0.12 = 14
;;
LBB0_4::                                ## %for.cond77
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.13 = 16[$r0.1]
;;
;;
	c0	cmplt $b0.0 = $r0.13, 0
;;
;;
	c0	br $b0.0, LBB0_6
;;
## BB#5:                                ## %for.inc164
                                        ##   in Loop: Header=BB0_4 Depth=1
	c0	ldw $r0.13 = 20[$r0.1]
;;
;;
	c0	ldw $r0.14 = 224[$r0.13]
;;
	c0	ldw $r0.13 = 0[$r0.13]
;;
;;
	c0	add $r0.13 = $r0.13, $r0.14
;;
	c0	stw 88[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 20[$r0.1]
;;
;;
	c0	ldw $r0.14 = 224[$r0.13]
;;
	c0	ldw $r0.13 = 0[$r0.13]
;;
;;
	c0	sub $r0.13 = $r0.13, $r0.14
;;
	c0	stw 60[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 20[$r0.1]
;;
;;
	c0	ldw $r0.14 = 192[$r0.13]
;;
	c0	ldw $r0.13 = 32[$r0.13]
;;
;;
	c0	add $r0.13 = $r0.13, $r0.14
;;
	c0	stw 84[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 20[$r0.1]
;;
;;
	c0	ldw $r0.14 = 192[$r0.13]
;;
	c0	ldw $r0.13 = 32[$r0.13]
;;
;;
	c0	sub $r0.13 = $r0.13, $r0.14
;;
	c0	stw 64[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 20[$r0.1]
;;
;;
	c0	ldw $r0.14 = 160[$r0.13]
;;
	c0	ldw $r0.13 = 64[$r0.13]
;;
;;
	c0	add $r0.13 = $r0.13, $r0.14
;;
	c0	stw 80[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 20[$r0.1]
;;
;;
	c0	ldw $r0.14 = 160[$r0.13]
;;
	c0	ldw $r0.13 = 64[$r0.13]
;;
;;
	c0	sub $r0.13 = $r0.13, $r0.14
;;
	c0	stw 68[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 20[$r0.1]
;;
;;
	c0	ldw $r0.14 = 128[$r0.13]
;;
	c0	ldw $r0.13 = 96[$r0.13]
;;
;;
	c0	add $r0.13 = $r0.13, $r0.14
;;
	c0	stw 76[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 20[$r0.1]
;;
;;
	c0	ldw $r0.14 = 128[$r0.13]
;;
	c0	ldw $r0.13 = 96[$r0.13]
;;
;;
	c0	sub $r0.13 = $r0.13, $r0.14
;;
	c0	stw 72[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 76[$r0.1]
;;
	c0	ldw $r0.14 = 88[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.14, $r0.13
;;
	c0	stw 56[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 76[$r0.1]
;;
	c0	ldw $r0.14 = 88[$r0.1]
;;
;;
	c0	sub $r0.13 = $r0.14, $r0.13
;;
	c0	stw 44[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 80[$r0.1]
;;
	c0	ldw $r0.14 = 84[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.14, $r0.13
;;
	c0	stw 52[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 80[$r0.1]
;;
	c0	ldw $r0.14 = 84[$r0.1]
;;
;;
	c0	sub $r0.13 = $r0.14, $r0.13
;;
	c0	stw 48[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 52[$r0.1]
;;
	c0	ldw $r0.14 = 56[$r0.1]
;;
	c0	ldw $r0.15 = 20[$r0.1]
;;
	c0	add $r0.13 = $r0.14, $r0.13
;;
	c0	add $r0.13 = $r0.13, 1
;;
	c0	shr $r0.13 = $r0.13, $r0.11
;;
	c0	stw 0[$r0.15] = $r0.13
;;
	c0	ldw $r0.13 = 52[$r0.1]
;;
	c0	ldw $r0.14 = 56[$r0.1]
;;
	c0	ldw $r0.15 = 20[$r0.1]
;;
	c0	sub $r0.13 = $r0.14, $r0.13
;;
	c0	add $r0.13 = $r0.13, 1
;;
	c0	shr $r0.13 = $r0.13, $r0.11
;;
	c0	stw 128[$r0.15] = $r0.13
;;
	c0	ldw $r0.13 = 44[$r0.1]
;;
	c0	ldw $r0.14 = 48[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.14, $r0.13
;;
	c0	mpyhs $r0.14 = $r0.13, 4433
;;
	c0	mpylu $r0.13 = $r0.13, 4433
;;
;;
	c0	add $r0.13 = $r0.13, $r0.14
;;
	c0	stw 40[$r0.1] = $r0.13
;;
	c0	ldw $r0.14 = 44[$r0.1]
;;
	c0	ldw $r0.15 = 20[$r0.1]
;;
	c0	mpyhs $r0.16 = $r0.14, 6270
;;
	c0	mpylu $r0.14 = $r0.14, 6270
;;
;;
	c0	add $r0.14 = $r0.14, $r0.16
;;
	c0	add $r0.13 = $r0.13, $r0.14
;;
	c0	add $r0.13 = $r0.13, 8192
;;
	c0	shr $r0.13 = $r0.13, $r0.12
;;
	c0	stw 64[$r0.15] = $r0.13
;;
	c0	ldw $r0.13 = 48[$r0.1]
;;
	c0	ldw $r0.14 = 40[$r0.1]
;;
	c0	mpyhs $r0.15 = $r0.13, -15137
;;
	c0	mpylu $r0.13 = $r0.13, -15137
;;
	c0	ldw $r0.16 = 20[$r0.1]
;;
	c0	add $r0.13 = $r0.13, $r0.15
;;
	c0	add $r0.13 = $r0.14, $r0.13
;;
	c0	add $r0.13 = $r0.13, 8192
;;
	c0	shr $r0.13 = $r0.13, $r0.12
;;
	c0	stw 192[$r0.16] = $r0.13
;;
	c0	ldw $r0.13 = 60[$r0.1]
;;
	c0	ldw $r0.14 = 72[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.14, $r0.13
;;
	c0	stw 40[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 64[$r0.1]
;;
	c0	ldw $r0.14 = 68[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.14, $r0.13
;;
	c0	stw 36[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 64[$r0.1]
;;
	c0	ldw $r0.14 = 72[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.14, $r0.13
;;
	c0	stw 32[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 60[$r0.1]
;;
	c0	ldw $r0.14 = 68[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.14, $r0.13
;;
	c0	stw 28[$r0.1] = $r0.13
;;
	c0	ldw $r0.14 = 32[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.14, $r0.13
;;
	c0	mpyhs $r0.14 = $r0.13, 9633
;;
	c0	mpylu $r0.13 = $r0.13, 9633
;;
;;
	c0	add $r0.13 = $r0.13, $r0.14
;;
	c0	stw 24[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 72[$r0.1]
;;
;;
	c0	mpyhs $r0.14 = $r0.13, 2446
;;
	c0	mpylu $r0.13 = $r0.13, 2446
;;
;;
	c0	add $r0.13 = $r0.13, $r0.14
;;
	c0	stw 72[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 68[$r0.1]
;;
;;
	c0	mpyhs $r0.14 = $r0.13, 16819
;;
	c0	mpylu $r0.13 = $r0.13, 16819
;;
;;
	c0	add $r0.13 = $r0.13, $r0.14
;;
	c0	stw 68[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 64[$r0.1]
;;
;;
	c0	mpyhs $r0.14 = $r0.13, 25172
;;
	c0	mpylu $r0.13 = $r0.13, 25172
;;
;;
	c0	add $r0.13 = $r0.13, $r0.14
;;
	c0	stw 64[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 60[$r0.1]
;;
;;
	c0	mpyhs $r0.14 = $r0.13, 12299
;;
	c0	mpylu $r0.13 = $r0.13, 12299
;;
;;
	c0	add $r0.13 = $r0.13, $r0.14
;;
	c0	stw 60[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 40[$r0.1]
;;
;;
	c0	mpyhs $r0.14 = $r0.13, -7373
;;
	c0	mpylu $r0.13 = $r0.13, -7373
;;
;;
	c0	add $r0.13 = $r0.13, $r0.14
;;
	c0	stw 40[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 36[$r0.1]
;;
;;
	c0	mpyhs $r0.14 = $r0.13, -20995
;;
	c0	mpylu $r0.13 = $r0.13, -20995
;;
;;
	c0	add $r0.13 = $r0.13, $r0.14
;;
	c0	stw 36[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 32[$r0.1]
;;
;;
	c0	mpyhs $r0.14 = $r0.13, -16069
;;
	c0	mpylu $r0.13 = $r0.13, -16069
;;
;;
	c0	add $r0.13 = $r0.13, $r0.14
;;
	c0	stw 32[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 28[$r0.1]
;;
;;
	c0	mpyhs $r0.14 = $r0.13, -3196
;;
	c0	mpylu $r0.13 = $r0.13, -3196
;;
;;
	c0	add $r0.13 = $r0.13, $r0.14
;;
	c0	stw 28[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 32[$r0.1]
;;
	c0	ldw $r0.14 = 24[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.13, $r0.14
;;
	c0	stw 32[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 28[$r0.1]
;;
	c0	ldw $r0.14 = 24[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.13, $r0.14
;;
	c0	stw 28[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 72[$r0.1]
;;
	c0	ldw $r0.14 = 40[$r0.1]
;;
	c0	ldw $r0.15 = 32[$r0.1]
;;
	c0	add $r0.13 = $r0.13, $r0.14
;;
	c0	add $r0.13 = $r0.13, $r0.15
	c0	ldw $r0.14 = 20[$r0.1]
;;
	c0	add $r0.13 = $r0.13, 8192
;;
	c0	shr $r0.13 = $r0.13, $r0.12
;;
	c0	stw 224[$r0.14] = $r0.13
;;
	c0	ldw $r0.13 = 68[$r0.1]
;;
	c0	ldw $r0.14 = 36[$r0.1]
;;
	c0	ldw $r0.15 = 28[$r0.1]
;;
	c0	add $r0.13 = $r0.13, $r0.14
;;
	c0	add $r0.13 = $r0.13, $r0.15
	c0	ldw $r0.14 = 20[$r0.1]
;;
	c0	add $r0.13 = $r0.13, 8192
;;
	c0	shr $r0.13 = $r0.13, $r0.12
;;
	c0	stw 160[$r0.14] = $r0.13
;;
	c0	ldw $r0.13 = 64[$r0.1]
;;
	c0	ldw $r0.14 = 36[$r0.1]
;;
	c0	ldw $r0.15 = 32[$r0.1]
;;
	c0	add $r0.13 = $r0.13, $r0.14
;;
	c0	add $r0.13 = $r0.13, $r0.15
	c0	ldw $r0.14 = 20[$r0.1]
;;
	c0	add $r0.13 = $r0.13, 8192
;;
	c0	shr $r0.13 = $r0.13, $r0.12
;;
	c0	stw 96[$r0.14] = $r0.13
;;
	c0	ldw $r0.13 = 60[$r0.1]
;;
	c0	ldw $r0.14 = 40[$r0.1]
;;
	c0	ldw $r0.15 = 28[$r0.1]
;;
	c0	add $r0.13 = $r0.13, $r0.14
;;
	c0	add $r0.13 = $r0.13, $r0.15
	c0	ldw $r0.14 = 20[$r0.1]
;;
	c0	add $r0.13 = $r0.13, 8192
;;
	c0	shr $r0.13 = $r0.13, $r0.12
;;
	c0	stw 32[$r0.14] = $r0.13
;;
	c0	ldw $r0.13 = 20[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.13, 4
;;
	c0	stw 20[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 16[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.13, -1
;;
	c0	stw 16[$r0.1] = $r0.13
	c0	goto LBB0_4
;;
LBB0_6::                                ## %for.end166
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 96, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @main
main::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 44[$r0.1] = $r0.57
;;
	c0	stw 40[$r0.1] = $r0.58
;;
	c0	stw 36[$r0.1] = $l0.0
	c0	mov $r0.57 = 0
;;
	c0	mov $r0.58 = data
;;
	c0	stw 32[$r0.1] = $r0.57
	c0	mov $r0.3 = $r0.58
;;
.call jpeg_fdct_islow, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = jpeg_fdct_islow
;;
	c0	mov $r0.11 = i
;;
	c0	ldw $r0.11 = 0[$r0.11]
;;
;;
	c0	cmpne $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB1_9
;;
## BB#1:                                ## %if.then
	c0	stw 28[$r0.1] = $r0.57
	c0	mov $r0.11 = 5
;;
	c0	mov $r0.12 = data_ref
;;
LBB1_2::                                ## %for.cond
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_4 Depth 2
	c0	ldw $r0.13 = 28[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.13, 7
;;
;;
	c0	br $b0.0, LBB1_9
;;
## BB#3:                                ## %for.body
                                        ##   in Loop: Header=BB1_2 Depth=1
	c0	stw 24[$r0.1] = $r0.57
;;
LBB1_4::                                ## %for.cond2
                                        ##   Parent Loop BB1_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldw $r0.13 = 24[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.13, 7
;;
;;
	c0	br $b0.0, LBB1_8
;;
## BB#5:                                ## %for.body4
                                        ##   in Loop: Header=BB1_4 Depth=2
	c0	ldw $r0.13 = 28[$r0.1]
;;
;;
	c0	shl $r0.13 = $r0.13, $r0.11
;;
	c0	add $r0.14 = $r0.12, $r0.13
	c0	ldw $r0.15 = 24[$r0.1]
;;
	c0	add $r0.13 = $r0.58, $r0.13
;;
	c0	sh2add $r0.14 = $r0.15, $r0.14
	c0	sh2add $r0.13 = $r0.15, $r0.13
;;
	c0	ldw $r0.14 = 0[$r0.14]
;;
	c0	ldw $r0.13 = 0[$r0.13]
;;
;;
	c0	cmpeq $b0.0 = $r0.13, $r0.14
;;
;;
	c0	brf $b0.0, LBB1_6
;;
## BB#7:                                ## %for.inc
                                        ##   in Loop: Header=BB1_4 Depth=2
	c0	ldw $r0.13 = 24[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.13, 1
;;
	c0	stw 24[$r0.1] = $r0.13
	c0	goto LBB1_4
;;
LBB1_8::                                ## %for.inc10
                                        ##   in Loop: Header=BB1_2 Depth=1
	c0	ldw $r0.13 = 28[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.13, 1
;;
	c0	stw 28[$r0.1] = $r0.13
	c0	goto LBB1_2
;;
LBB1_6::                                ## %if.then9
	c0	ldw $r0.11 = 24[$r0.1]
;;
	c0	ldw $r0.12 = 28[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.12, $r0.11
;;
	c0	stw 32[$r0.1] = $r0.11
	c0	goto LBB1_10
;;
LBB1_9::                                ## %if.end13
	c0	mov $r0.11 = -1
;;
	c0	stw 32[$r0.1] = $r0.11
;;
LBB1_10::                               ## %return
	c0	ldw $r0.3 = 32[$r0.1]
;;
	c0	ldw $l0.0 = 36[$r0.1]
;;
	c0	ldw $r0.58 = 40[$r0.1]
;;
	c0	ldw $r0.57 = 44[$r0.1]
;;
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .data
	.align	4                       ## @data
data::
	.data4	1                       ## 0x1
	.data4	2                       ## 0x2
	.data4	3                       ## 0x3
	.data4	4                       ## 0x4
	.data4	5                       ## 0x5
	.data4	6                       ## 0x6
	.data4	7                       ## 0x7
	.data4	8                       ## 0x8
	.data4	11                      ## 0xb
	.data4	22                      ## 0x16
	.data4	33                      ## 0x21
	.data4	40                      ## 0x28
	.data4	51                      ## 0x33
	.data4	62                      ## 0x3e
	.data4	73                      ## 0x49
	.data4	84                      ## 0x54
	.data4	12                      ## 0xc
	.data4	23                      ## 0x17
	.data4	34                      ## 0x22
	.data4	41                      ## 0x29
	.data4	52                      ## 0x34
	.data4	63                      ## 0x3f
	.data4	74                      ## 0x4a
	.data4	85                      ## 0x55
	.data4	13                      ## 0xd
	.data4	24                      ## 0x18
	.data4	35                      ## 0x23
	.data4	42                      ## 0x2a
	.data4	53                      ## 0x35
	.data4	64                      ## 0x40
	.data4	75                      ## 0x4b
	.data4	86                      ## 0x56
	.data4	14                      ## 0xe
	.data4	25                      ## 0x19
	.data4	36                      ## 0x24
	.data4	43                      ## 0x2b
	.data4	54                      ## 0x36
	.data4	65                      ## 0x41
	.data4	76                      ## 0x4c
	.data4	87                      ## 0x57
	.data4	15                      ## 0xf
	.data4	26                      ## 0x1a
	.data4	37                      ## 0x25
	.data4	44                      ## 0x2c
	.data4	55                      ## 0x37
	.data4	66                      ## 0x42
	.data4	77                      ## 0x4d
	.data4	88                      ## 0x58
	.data4	16                      ## 0x10
	.data4	27                      ## 0x1b
	.data4	38                      ## 0x26
	.data4	45                      ## 0x2d
	.data4	56                      ## 0x38
	.data4	67                      ## 0x43
	.data4	78                      ## 0x4e
	.data4	89                      ## 0x59
	.data4	17                      ## 0x11
	.data4	28                      ## 0x1c
	.data4	39                      ## 0x27
	.data4	46                      ## 0x2e
	.data4	57                      ## 0x39
	.data4	68                      ## 0x44
	.data4	79                      ## 0x4f
	.data4	80                      ## 0x50

	.align	4                       ## @data_ref
data_ref::
	.data4	2826                    ## 0xb0a
	.data4	4294965983              ## 0xfffffadf
	.data4	22                      ## 0x16
	.data4	4294967145              ## 0xffffff69
	.data4	4294967258              ## 0xffffffda
	.data4	4294967251              ## 0xffffffd3
	.data4	9                       ## 0x9
	.data4	10                      ## 0xa
	.data4	4294966704              ## 0xfffffdb0
	.data4	215                     ## 0xd7
	.data4	11                      ## 0xb
	.data4	12                      ## 0xc
	.data4	19                      ## 0x13
	.data4	4294967295              ## 0xffffffff
	.data4	4                       ## 0x4
	.data4	4294967290              ## 0xfffffffa
	.data4	4294966849              ## 0xfffffe41
	.data4	239                     ## 0xef
	.data4	4294967272              ## 0xffffffe8
	.data4	43                      ## 0x2b
	.data4	4294967288              ## 0xfffffff8
	.data4	20                      ## 0x14
	.data4	4294967287              ## 0xfffffff7
	.data4	3                       ## 0x3
	.data4	4294966902              ## 0xfffffe76
	.data4	182                     ## 0xb6
	.data4	9                       ## 0x9
	.data4	11                      ## 0xb
	.data4	16                      ## 0x10
	.data4	4294967295              ## 0xffffffff
	.data4	4                       ## 0x4
	.data4	4294967291              ## 0xfffffffb
	.data4	4294966954              ## 0xfffffeaa
	.data4	183                     ## 0xb7
	.data4	4294967278              ## 0xffffffee
	.data4	33                      ## 0x21
	.data4	4294967290              ## 0xfffffffa
	.data4	15                      ## 0xf
	.data4	4294967289              ## 0xfffffff9
	.data4	2                       ## 0x2
	.data4	4294967038              ## 0xfffffefe
	.data4	122                     ## 0x7a
	.data4	6                       ## 0x6
	.data4	7                       ## 0x7
	.data4	11                      ## 0xb
	.data4	4294967295              ## 0xffffffff
	.data4	2                       ## 0x2
	.data4	4294967293              ## 0xfffffffd
	.data4	4294967111              ## 0xffffff47
	.data4	99                      ## 0x63
	.data4	4294967286              ## 0xfffffff6
	.data4	18                      ## 0x12
	.data4	4294967293              ## 0xfffffffd
	.data4	8                       ## 0x8
	.data4	4294967292              ## 0xfffffffc
	.data4	1                       ## 0x1
	.data4	4294967206              ## 0xffffffa6
	.data4	43                      ## 0x2b
	.data4	2                       ## 0x2
	.data4	2                       ## 0x2
	.data4	4                       ## 0x4
	.data4	0                       ## 0x0
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff

.section .bss
	.align	4                       ## @i
i::
	.data4	0                       ## 0x0

	.align	4                       ## @a
a::
	.data4	0                       ## 0x0


