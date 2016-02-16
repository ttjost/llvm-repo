.section .text
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @main
main::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 60[$r0.1] = $l0.0
;;
	c0	stw 56[$r0.1] = $r0.57
;;
	c0	stw 52[$r0.1] = $r0.58
;;
	c0	stw 48[$r0.1] = $r0.59
;;
	c0	stw 44[$r0.1] = $r0.60
;;
	c0	stw 40[$r0.1] = $r0.61
;;
	c0	stw 36[$r0.1] = $r0.62
;;
	c0	stw 32[$r0.1] = $r0.63
	c0	mov $r0.58 = 0
;;
	c0	stw 28[$r0.1] = $r0.58
;;
	c0	stw 24[$r0.1] = $r0.58
	c0	mov $r0.59 = 285
;;
	c0	mov $r0.60 = in_data
	c0	mov $r0.57 = output
;;
	c0	mov $r0.61 = 700
	c0	mov $r0.62 = fir_int
;;
	c0	mov $r0.63 = 35
;;
LBB0_1::                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.11 = 24[$r0.1]
;;
	c0	cmpgt $b0.0 = $r0.11, 199
;;
	c0	br $b0.0, LBB0_3
;;
## BB#2:                                ## %for.inc
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	mov $r0.3 = $r0.60
	c0	mov $r0.4 = $r0.57
	c0	mov $r0.5 = $r0.61
	c0	mov $r0.6 = $r0.62
;;
	c0	mov $r0.7 = $r0.63
	c0	mov $r0.8 = $r0.59
;;
.call fir_filter_int, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = fir_filter_int
;;
	c0	ldw $r0.11 = 24[$r0.1]
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 24[$r0.1] = $r0.11
	c0	goto LBB0_1
;;
LBB0_3::                                ## %for.end
	c0	stw 24[$r0.1] = $r0.58
	c0	mov $r0.58 = out_data
;;
	c0	mov $r0.59 = .str
;;
LBB0_4::                                ## %for.cond1
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.11 = 24[$r0.1]
;;
	c0	cmpgt $b0.0 = $r0.11, 699
;;
	c0	br $b0.0, LBB0_8
;;
## BB#5:                                ## %for.body3
                                        ##   in Loop: Header=BB0_4 Depth=1
	c0	ldw $r0.11 = 24[$r0.1]
;;
	c0	sh2add $r0.12 = $r0.11, $r0.58
	c0	sh2add $r0.11 = $r0.11, $r0.57
;;
	c0	ldw $r0.12 = 0[$r0.12]
;;
	c0	ldw $r0.11 = 0[$r0.11]
;;
	c0	cmpeq $b0.0 = $r0.11, $r0.12
;;
	c0	br $b0.0, LBB0_7
;;
## BB#6:                                ## %if.then
                                        ##   in Loop: Header=BB0_4 Depth=1
	c0	ldw $r0.11 = 24[$r0.1]
;;
	c0	sh2add $r0.11 = $r0.11, $r0.57
;;
	c0	ldw $r0.4 = 0[$r0.11]
	c0	mov $r0.3 = $r0.59
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
LBB0_7::                                ## %for.inc7
                                        ##   in Loop: Header=BB0_4 Depth=1
	c0	ldw $r0.11 = 24[$r0.1]
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 24[$r0.1] = $r0.11
	c0	goto LBB0_4
;;
LBB0_8::                                ## %for.end9
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	mov $r0.3 = .str1
	c0	call $l0.0 = printf
;;
	c0	mov $r0.3 = -1
	c0	ldw $r0.63 = 32[$r0.1]
;;
	c0	ldw $r0.62 = 36[$r0.1]
;;
	c0	ldw $r0.61 = 40[$r0.1]
;;
	c0	ldw $r0.60 = 44[$r0.1]
;;
	c0	ldw $r0.59 = 48[$r0.1]
;;
	c0	ldw $r0.58 = 52[$r0.1]
;;
	c0	ldw $r0.57 = 56[$r0.1]
;;
	c0	ldw $l0.0 = 60[$r0.1]
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg() ## @fir_filter_int
fir_filter_int::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -96
;;
	c0	stw 76[$r0.1] = $r0.3
;;
	c0	stw 72[$r0.1] = $r0.4
;;
	c0	stw 68[$r0.1] = $r0.5
;;
	c0	stw 64[$r0.1] = $r0.6
;;
	c0	stw 60[$r0.1] = $r0.7
;;
	c0	stw 56[$r0.1] = $r0.8
	c0	mov $r0.11 = 1
;;
	c0	ldw $r0.12 = 64[$r0.1]
;;
	c0	stw 24[$r0.1] = $r0.12
;;
	c0	ldw $r0.12 = 60[$r0.1]
;;
	c0	add $r0.12 = $r0.12, 1
;;
	c0	shr $r0.12 = $r0.12, $r0.11
;;
	c0	stw 44[$r0.1] = $r0.12
;;
	c0	ldw $r0.12 = 68[$r0.1]
;;
	c0	ldw $r0.13 = 76[$r0.1]
;;
	c0	sh2add $r0.12 = $r0.12, $r0.13
;;
	c0	add $r0.12 = $r0.12, -4
;;
	c0	stw 16[$r0.1] = $r0.12
;;
	c0	ldw $r0.12 = 44[$r0.1]
;;
	c0	ldw $r0.13 = 76[$r0.1]
;;
	c0	sh2add $r0.12 = $r0.12, $r0.13
;;
	c0	add $r0.12 = $r0.12, -4
;;
	c0	stw 32[$r0.1] = $r0.12
	c0	mov $r0.12 = 0
;;
	c0	ldw $r0.13 = 44[$r0.1]
;;
	c0	stw 40[$r0.1] = $r0.13
;;
	c0	stw 52[$r0.1] = $r0.12
;;
LBB1_1::                                ## %for.cond
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_3 Depth 2
	c0	ldw $r0.12 = 68[$r0.1]
;;
	c0	ldw $r0.13 = 52[$r0.1]
;;
	c0	cmpge $b0.0 = $r0.13, $r0.12
;;
	c0	br $b0.0, LBB1_11
;;
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.12 = 32[$r0.1]
;;
	c0	stw 28[$r0.1] = $r0.12
;;
	c0	ldw $r0.12 = 24[$r0.1]
;;
	c0	stw 20[$r0.1] = $r0.12
	c0	add $r0.13 = $r0.12, 4
;;
	c0	stw 20[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 28[$r0.1]
;;
	c0	ldw $r0.12 = 0[$r0.12]
	c0	add $r0.14 = $r0.13, -4
;;
	c0	stw 28[$r0.1] = $r0.14
;;
	c0	ldw $r0.13 = 0[$r0.13]
;;
	c0	mpyhs $r0.14 = $r0.12, $r0.13
	c0	mpylu $r0.12 = $r0.12, $r0.13
;;
	c0	add $r0.12 = $r0.12, $r0.14
;;
	c0	stw 36[$r0.1] = $r0.12
;;
	c0	stw 48[$r0.1] = $r0.11
;;
LBB1_3::                                ## %for.cond5
                                        ##   Parent Loop BB1_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldw $r0.12 = 40[$r0.1]
;;
	c0	ldw $r0.13 = 48[$r0.1]
;;
	c0	cmpge $b0.0 = $r0.13, $r0.12
;;
	c0	br $b0.0, LBB1_5
;;
## BB#4:                                ## %for.inc
                                        ##   in Loop: Header=BB1_3 Depth=2
	c0	ldw $r0.12 = 20[$r0.1]
;;
	c0	add $r0.13 = $r0.12, 4
;;
	c0	stw 20[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 28[$r0.1]
;;
	c0	ldw $r0.12 = 0[$r0.12]
	c0	add $r0.14 = $r0.13, -4
;;
	c0	stw 28[$r0.1] = $r0.14
;;
	c0	ldw $r0.13 = 0[$r0.13]
;;
	c0	mpyhs $r0.14 = $r0.12, $r0.13
	c0	mpylu $r0.12 = $r0.12, $r0.13
	c0	ldw $r0.13 = 36[$r0.1]
;;
	c0	add $r0.12 = $r0.12, $r0.14
;;
	c0	add $r0.12 = $r0.13, $r0.12
;;
	c0	stw 36[$r0.1] = $r0.12
;;
	c0	ldw $r0.12 = 48[$r0.1]
;;
	c0	add $r0.12 = $r0.12, 1
;;
	c0	stw 48[$r0.1] = $r0.12
	c0	goto LBB1_3
;;
LBB1_5::                                ## %for.end
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.12 = 72[$r0.1]
;;
	c0	ldw $r0.13 = 36[$r0.1]
	c0	add $r0.14 = $r0.12, 4
;;
	c0	stw 72[$r0.1] = $r0.14
;;
	c0	stw 0[$r0.12] = $r0.13
;;
	c0	ldw $r0.12 = 16[$r0.1]
;;
	c0	ldw $r0.13 = 32[$r0.1]
;;
	c0	cmpne $b0.0 = $r0.13, $r0.12
;;
	c0	brf $b0.0, LBB1_6
;;
## BB#7:                                ## %if.else
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.12 = 60[$r0.1]
;;
	c0	ldw $r0.13 = 40[$r0.1]
;;
	c0	cmpge $b0.0 = $r0.13, $r0.12
;;
	c0	br $b0.0, LBB1_9
;;
	c0	goto LBB1_8
;;
LBB1_6::                                ## %if.then
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.12 = 40[$r0.1]
;;
	c0	add $r0.12 = $r0.12, -1
;;
	c0	stw 40[$r0.1] = $r0.12
;;
	c0	ldw $r0.12 = 24[$r0.1]
;;
	c0	add $r0.12 = $r0.12, 4
;;
	c0	stw 24[$r0.1] = $r0.12
	c0	goto LBB1_10
;;
LBB1_8::                                ## %if.then16
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.12 = 40[$r0.1]
;;
	c0	add $r0.12 = $r0.12, 1
;;
	c0	stw 40[$r0.1] = $r0.12
;;
LBB1_9::                                ## %if.end
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.12 = 32[$r0.1]
;;
	c0	add $r0.12 = $r0.12, 4
;;
	c0	stw 32[$r0.1] = $r0.12
;;
LBB1_10::                               ## %for.inc20
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.12 = 52[$r0.1]
;;
	c0	add $r0.12 = $r0.12, 1
;;
	c0	stw 52[$r0.1] = $r0.12
	c0	goto LBB1_1
;;
LBB1_11::                               ## %for.end22
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 96, $l0.0
;;
.endp

.section .data
	.align	2                       ## @fir_int
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

	.align	2                       ## @in_data
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

	.align	2                       ## @out_data
out_data::
	.data4	942                     ## 0x3ae
	.data4	4294965493              ## 0xfffff8f5
	.data4	4294966182              ## 0xfffffba6
	.data4	8498                    ## 0x2132
	.data4	25256                   ## 0x62a8
	.data4	39120                   ## 0x98d0
	.data4	38731                   ## 0x974b
	.data4	24653                   ## 0x604d
	.data4	9382                    ## 0x24a6
	.data4	2033                    ## 0x7f1
	.data4	2253                    ## 0x8cd
	.data4	1408                    ## 0x580
	.data4	4294965300              ## 0xfffff834
	.data4	4294967012              ## 0xfffffee4
	.data4	11511                   ## 0x2cf7
	.data4	26195                   ## 0x6653
	.data4	30697                   ## 0x77e9
	.data4	22742                   ## 0x58d6
	.data4	12462                   ## 0x30ae
	.data4	9656                    ## 0x25b8
	.data4	12940                   ## 0x328c
	.data4	13757                   ## 0x35bd
	.data4	11383                   ## 0x2c77
	.data4	11124                   ## 0x2b74
	.data4	15776                   ## 0x3da0
	.data4	20472                   ## 0x4ff8
	.data4	19023                   ## 0x4a4f
	.data4	11262                   ## 0x2bfe
	.data4	2325                    ## 0x915
	.data4	4294963797              ## 0xfffff255
	.data4	4294964061              ## 0xfffff35d
	.data4	3870                    ## 0xf1e
	.data4	13375                   ## 0x343f
	.data4	16894                   ## 0x41fe
	.data4	10712                   ## 0x29d8
	.data4	4294967162              ## 0xffffff7a
	.data4	4294964734              ## 0xfffff5fe
	.data4	8417                    ## 0x20e1
	.data4	25589                   ## 0x63f5
	.data4	37515                   ## 0x928b
	.data4	38743                   ## 0x9757
	.data4	31671                   ## 0x7bb7
	.data4	22504                   ## 0x57e8
	.data4	13445                   ## 0x3485
	.data4	5357                    ## 0x14ed
	.data4	4294966888              ## 0xfffffe68
	.data4	4294965749              ## 0xfffff9f5
	.data4	1333                    ## 0x535
	.data4	6016                    ## 0x1780
	.data4	10256                   ## 0x2810
	.data4	12948                   ## 0x3294
	.data4	14140                   ## 0x373c
	.data4	13516                   ## 0x34cc
	.data4	11793                   ## 0x2e11
	.data4	11004                   ## 0x2afc
	.data4	12227                   ## 0x2fc3
	.data4	15646                   ## 0x3d1e
	.data4	20755                   ## 0x5113
	.data4	25325                   ## 0x62ed
	.data4	27187                   ## 0x6a33
	.data4	25799                   ## 0x64c7
	.data4	22586                   ## 0x583a
	.data4	20210                   ## 0x4ef2
	.data4	18719                   ## 0x491f
	.data4	14396                   ## 0x383c
	.data4	7750                    ## 0x1e46
	.data4	6611                    ## 0x19d3
	.data4	15841                   ## 0x3de1
	.data4	30111                   ## 0x759f
	.data4	35128                   ## 0x8938
	.data4	25408                   ## 0x6340
	.data4	13441                   ## 0x3481
	.data4	10266                   ## 0x281a
	.data4	13862                   ## 0x3626
	.data4	12197                   ## 0x2fa5
	.data4	2450                    ## 0x992
	.data4	4294964178              ## 0xfffff3d2
	.data4	2172                    ## 0x87c
	.data4	10508                   ## 0x290c
	.data4	14046                   ## 0x36de
	.data4	13669                   ## 0x3565
	.data4	14608                   ## 0x3910
	.data4	14439                   ## 0x3867
	.data4	8785                    ## 0x2251
	.data4	1186                    ## 0x4a2
	.data4	2049                    ## 0x801
	.data4	10247                   ## 0x2807
	.data4	14672                   ## 0x3950
	.data4	9539                    ## 0x2543
	.data4	4117                    ## 0x1015
	.data4	8688                    ## 0x21f0
	.data4	21355                   ## 0x536b
	.data4	27742                   ## 0x6c5e
	.data4	21511                   ## 0x5407
	.data4	9601                    ## 0x2581
	.data4	4115                    ## 0x1013
	.data4	9699                    ## 0x25e3
	.data4	21006                   ## 0x520e
	.data4	26900                   ## 0x6914
	.data4	21963                   ## 0x55cb
	.data4	10680                   ## 0x29b8
	.data4	3316                    ## 0xcf4
	.data4	6950                    ## 0x1b26
	.data4	14457                   ## 0x3879
	.data4	14553                   ## 0x38d9
	.data4	6246                    ## 0x1866
	.data4	1470                    ## 0x5be
	.data4	11848                   ## 0x2e48
	.data4	28750                   ## 0x704e
	.data4	33822                   ## 0x841e
	.data4	21975                   ## 0x55d7
	.data4	6304                    ## 0x18a0
	.data4	2758                    ## 0xac6
	.data4	11026                   ## 0x2b12
	.data4	15771                   ## 0x3d9b
	.data4	10149                   ## 0x27a5
	.data4	3223                    ## 0xc97
	.data4	6199                    ## 0x1837
	.data4	17184                   ## 0x4320
	.data4	23404                   ## 0x5b6c
	.data4	18494                   ## 0x483e
	.data4	10096                   ## 0x2770
	.data4	8469                    ## 0x2115
	.data4	13080                   ## 0x3318
	.data4	15482                   ## 0x3c7a
	.data4	12982                   ## 0x32b6
	.data4	10445                   ## 0x28cd
	.data4	11732                   ## 0x2dd4
	.data4	14262                   ## 0x37b6
	.data4	12625                   ## 0x3151
	.data4	9532                    ## 0x253c
	.data4	12329                   ## 0x3029
	.data4	22979                   ## 0x59c3
	.data4	35279                   ## 0x89cf
	.data4	40222                   ## 0x9d1e
	.data4	33059                   ## 0x8123
	.data4	20399                   ## 0x4faf
	.data4	9694                    ## 0x25de
	.data4	4424                    ## 0x1148
	.data4	2070                    ## 0x816
	.data4	4294966933              ## 0xfffffe95
	.data4	4294967203              ## 0xffffffa3
	.data4	5613                    ## 0x15ed
	.data4	12924                   ## 0x327c
	.data4	15609                   ## 0x3cf9
	.data4	12430                   ## 0x308e
	.data4	9976                    ## 0x26f8
	.data4	14404                   ## 0x3844
	.data4	22443                   ## 0x57ab
	.data4	26379                   ## 0x670b
	.data4	24484                   ## 0x5fa4
	.data4	22707                   ## 0x58b3
	.data4	24373                   ## 0x5f35
	.data4	26274                   ## 0x66a2
	.data4	23076                   ## 0x5a24
	.data4	15047                   ## 0x3ac7
	.data4	9149                    ## 0x23bd
	.data4	9958                    ## 0x26e6
	.data4	14385                   ## 0x3831
	.data4	16122                   ## 0x3efa
	.data4	13537                   ## 0x34e1
	.data4	10802                   ## 0x2a32
	.data4	12110                   ## 0x2f4e
	.data4	15139                   ## 0x3b23
	.data4	14513                   ## 0x38b1
	.data4	10236                   ## 0x27fc
	.data4	8877                    ## 0x22ad
	.data4	15535                   ## 0x3caf
	.data4	25007                   ## 0x61af
	.data4	27507                   ## 0x6b73
	.data4	21663                   ## 0x549f
	.data4	14222                   ## 0x378e
	.data4	12994                   ## 0x32c2
	.data4	18396                   ## 0x47dc
	.data4	24979                   ## 0x6193
	.data4	29538                   ## 0x7362
	.data4	29442                   ## 0x7302
	.data4	21873                   ## 0x5571
	.data4	9453                    ## 0x24ed
	.data4	1181                    ## 0x49d
	.data4	2342                    ## 0x926
	.data4	9242                    ## 0x241a
	.data4	13711                   ## 0x358f
	.data4	12776                   ## 0x31e8
	.data4	14658                   ## 0x3942
	.data4	22307                   ## 0x5723
	.data4	27698                   ## 0x6c32
	.data4	24642                   ## 0x6042
	.data4	16318                   ## 0x3fbe
	.data4	10997                   ## 0x2af5
	.data4	10834                   ## 0x2a52
	.data4	12327                   ## 0x3027
	.data4	13361                   ## 0x3431
	.data4	16061                   ## 0x3ebd
	.data4	21320                   ## 0x5348
	.data4	24803                   ## 0x60e3
	.data4	25284                   ## 0x62c4
	.data4	26442                   ## 0x674a
	.data4	27175                   ## 0x6a27
	.data4	22951                   ## 0x59a7
	.data4	14111                   ## 0x371f
	.data4	8536                    ## 0x2158
	.data4	14085                   ## 0x3705
	.data4	25146                   ## 0x623a
	.data4	26724                   ## 0x6864
	.data4	15807                   ## 0x3dbf
	.data4	6302                    ## 0x189e
	.data4	10253                   ## 0x280d
	.data4	24471                   ## 0x5f97
	.data4	32298                   ## 0x7e2a
	.data4	24723                   ## 0x6093
	.data4	11607                   ## 0x2d57
	.data4	6974                    ## 0x1b3e
	.data4	13843                   ## 0x3613
	.data4	23132                   ## 0x5a5c
	.data4	27510                   ## 0x6b76
	.data4	26341                   ## 0x66e5
	.data4	23384                   ## 0x5b58
	.data4	22691                   ## 0x58a3
	.data4	24196                   ## 0x5e84
	.data4	26920                   ## 0x6928
	.data4	27967                   ## 0x6d3f
	.data4	24831                   ## 0x60ff
	.data4	19771                   ## 0x4d3b
	.data4	16642                   ## 0x4102
	.data4	15130                   ## 0x3b1a
	.data4	10996                   ## 0x2af4
	.data4	6767                    ## 0x1a6f
	.data4	9983                    ## 0x26ff
	.data4	20496                   ## 0x5010
	.data4	26714                   ## 0x685a
	.data4	20757                   ## 0x5115
	.data4	11161                   ## 0x2b99
	.data4	13863                   ## 0x3627
	.data4	27903                   ## 0x6cff
	.data4	34520                   ## 0x86d8
	.data4	25741                   ## 0x648d
	.data4	14059                   ## 0x36eb
	.data4	13097                   ## 0x3329
	.data4	19928                   ## 0x4dd8
	.data4	22527                   ## 0x57ff
	.data4	18768                   ## 0x4950
	.data4	17788                   ## 0x457c
	.data4	20767                   ## 0x511f
	.data4	20631                   ## 0x5097
	.data4	16770                   ## 0x4182
	.data4	17585                   ## 0x44b1
	.data4	23805                   ## 0x5cfd
	.data4	24244                   ## 0x5eb4
	.data4	13674                   ## 0x356a
	.data4	3847                    ## 0xf07
	.data4	9031                    ## 0x2347
	.data4	24352                   ## 0x5f20
	.data4	30082                   ## 0x7582
	.data4	20296                   ## 0x4f48
	.data4	8784                    ## 0x2250
	.data4	8070                    ## 0x1f86
	.data4	14444                   ## 0x386c
	.data4	17374                   ## 0x43de
	.data4	14080                   ## 0x3700
	.data4	11509                   ## 0x2cf5
	.data4	12866                   ## 0x3242
	.data4	14830                   ## 0x39ee
	.data4	14255                   ## 0x37af
	.data4	13255                   ## 0x33c7
	.data4	13219                   ## 0x33a3
	.data4	13538                   ## 0x34e2
	.data4	12979                   ## 0x32b3
	.data4	13573                   ## 0x3505
	.data4	14438                   ## 0x3866
	.data4	13649                   ## 0x3551
	.data4	10945                   ## 0x2ac1
	.data4	10091                   ## 0x276b
	.data4	13759                   ## 0x35bf
	.data4	17568                   ## 0x44a0
	.data4	12652                   ## 0x316c
	.data4	898                     ## 0x382
	.data4	4294962410              ## 0xffffecea
	.data4	2956                    ## 0xb8c
	.data4	14940                   ## 0x3a5c
	.data4	16289                   ## 0x3fa1
	.data4	6984                    ## 0x1b48
	.data4	3035                    ## 0xbdb
	.data4	11574                   ## 0x2d36
	.data4	19080                   ## 0x4a88
	.data4	11469                   ## 0x2ccd
	.data4	4294965735              ## 0xfffff9e7
	.data4	4294966650              ## 0xfffffd7a
	.data4	15678                   ## 0x3d3e
	.data4	27789                   ## 0x6c8d
	.data4	23711                   ## 0x5c9f
	.data4	14338                   ## 0x3802
	.data4	15121                   ## 0x3b11
	.data4	21656                   ## 0x5498
	.data4	21776                   ## 0x5510
	.data4	15653                   ## 0x3d25
	.data4	15468                   ## 0x3c6c
	.data4	22341                   ## 0x5745
	.data4	24666                   ## 0x605a
	.data4	14713                   ## 0x3979
	.data4	4179                    ## 0x1053
	.data4	7866                    ## 0x1eba
	.data4	22505                   ## 0x57e9
	.data4	30199                   ## 0x75f7
	.data4	23343                   ## 0x5b2f
	.data4	9909                    ## 0x26b5
	.data4	3917                    ## 0xf4d
	.data4	10414                   ## 0x28ae
	.data4	21582                   ## 0x544e
	.data4	26804                   ## 0x68b4
	.data4	22181                   ## 0x56a5
	.data4	12169                   ## 0x2f89
	.data4	5389                    ## 0x150d
	.data4	6464                    ## 0x1940
	.data4	11814                   ## 0x2e26
	.data4	15258                   ## 0x3b9a
	.data4	14666                   ## 0x394a
	.data4	12039                   ## 0x2f07
	.data4	10671                   ## 0x29af
	.data4	10934                   ## 0x2ab6
	.data4	13676                   ## 0x356c
	.data4	16107                   ## 0x3eeb
	.data4	14155                   ## 0x374b
	.data4	8472                    ## 0x2118
	.data4	8486                    ## 0x2126
	.data4	19045                   ## 0x4a65
	.data4	29651                   ## 0x73d3
	.data4	25111                   ## 0x6217
	.data4	7659                    ## 0x1deb
	.data4	4294966737              ## 0xfffffdd1
	.data4	12103                   ## 0x2f47
	.data4	28315                   ## 0x6e9b
	.data4	27134                   ## 0x69fe
	.data4	11258                   ## 0x2bfa
	.data4	3011                    ## 0xbc3
	.data4	9763                    ## 0x2623
	.data4	14980                   ## 0x3a84
	.data4	8829                    ## 0x227d
	.data4	3151                    ## 0xc4f
	.data4	11399                   ## 0x2c87
	.data4	25090                   ## 0x6202
	.data4	25802                   ## 0x64ca
	.data4	13237                   ## 0x33b5
	.data4	4725                    ## 0x1275
	.data4	7733                    ## 0x1e35
	.data4	11436                   ## 0x2cac
	.data4	10136                   ## 0x2798
	.data4	14027                   ## 0x36cb
	.data4	27373                   ## 0x6aed
	.data4	35386                   ## 0x8a3a
	.data4	24753                   ## 0x60b1
	.data4	7861                    ## 0x1eb5
	.data4	8524                    ## 0x214c
	.data4	26634                   ## 0x680a
	.data4	36788                   ## 0x8fb4
	.data4	26265                   ## 0x6699
	.data4	11841                   ## 0x2e41
	.data4	12666                   ## 0x317a
	.data4	22351                   ## 0x574f
	.data4	23153                   ## 0x5a71
	.data4	15317                   ## 0x3bd5
	.data4	14560                   ## 0x38e0
	.data4	22145                   ## 0x5681
	.data4	23838                   ## 0x5d1e
	.data4	14289                   ## 0x37d1
	.data4	10281                   ## 0x2829
	.data4	22828                   ## 0x592c
	.data4	38289                   ## 0x9591
	.data4	38179                   ## 0x9523
	.data4	25858                   ## 0x6502
	.data4	20182                   ## 0x4ed6
	.data4	26658                   ## 0x6822
	.data4	30602                   ## 0x778a
	.data4	26035                   ## 0x65b3
	.data4	22796                   ## 0x590c
	.data4	28248                   ## 0x6e58
	.data4	32313                   ## 0x7e39
	.data4	24156                   ## 0x5e5c
	.data4	12232                   ## 0x2fc8
	.data4	12731                   ## 0x31bb
	.data4	22919                   ## 0x5987
	.data4	24690                   ## 0x6072
	.data4	13919                   ## 0x365f
	.data4	8831                    ## 0x227f
	.data4	22049                   ## 0x5621
	.data4	40335                   ## 0x9d8f
	.data4	41166                   ## 0xa0ce
	.data4	26103                   ## 0x65f7
	.data4	16621                   ## 0x40ed
	.data4	24229                   ## 0x5ea5
	.data4	36676                   ## 0x8f44
	.data4	39212                   ## 0x992c
	.data4	34478                   ## 0x86ae
	.data4	35059                   ## 0x88f3
	.data4	39382                   ## 0x99d6
	.data4	35726                   ## 0x8b8e
	.data4	23685                   ## 0x5c85
	.data4	17931                   ## 0x460b
	.data4	26004                   ## 0x6594
	.data4	37503                   ## 0x927f
	.data4	36475                   ## 0x8e7b
	.data4	25537                   ## 0x63c1
	.data4	21163                   ## 0x52ab
	.data4	26205                   ## 0x665d
	.data4	27042                   ## 0x69a2
	.data4	13312                   ## 0x3400
	.data4	4294963734              ## 0xfffff216
	.data4	4294963482              ## 0xfffff11a
	.data4	12832                   ## 0x3220
	.data4	27198                   ## 0x6a3e
	.data4	27799                   ## 0x6c97
	.data4	23076                   ## 0x5a24
	.data4	23985                   ## 0x5db1
	.data4	26977                   ## 0x6961
	.data4	22973                   ## 0x59bd
	.data4	13908                   ## 0x3654
	.data4	11107                   ## 0x2b63
	.data4	14863                   ## 0x3a0f
	.data4	14465                   ## 0x3881
	.data4	6857                    ## 0x1ac9
	.data4	2646                    ## 0xa56
	.data4	11281                   ## 0x2c11
	.data4	26168                   ## 0x6638
	.data4	33133                   ## 0x816d
	.data4	31162                   ## 0x79ba
	.data4	27002                   ## 0x697a
	.data4	23514                   ## 0x5bda
	.data4	18455                   ## 0x4817
	.data4	13100                   ## 0x332c
	.data4	14900                   ## 0x3a34
	.data4	23978                   ## 0x5daa
	.data4	26424                   ## 0x6738
	.data4	14210                   ## 0x3782
	.data4	4294967189              ## 0xffffff95
	.data4	2974                    ## 0xb9e
	.data4	24667                   ## 0x605b
	.data4	44473                   ## 0xadb9
	.data4	42964                   ## 0xa7d4
	.data4	25554                   ## 0x63d2
	.data4	13303                   ## 0x33f7
	.data4	16143                   ## 0x3f0f
	.data4	24828                   ## 0x60fc
	.data4	26833                   ## 0x68d1
	.data4	21423                   ## 0x53af
	.data4	20148                   ## 0x4eb4
	.data4	26869                   ## 0x68f5
	.data4	34429                   ## 0x867d
	.data4	35548                   ## 0x8adc
	.data4	33921                   ## 0x8481
	.data4	36505                   ## 0x8e99
	.data4	40436                   ## 0x9df4
	.data4	35766                   ## 0x8bb6
	.data4	22560                   ## 0x5820
	.data4	12449                   ## 0x30a1
	.data4	12503                   ## 0x30d7
	.data4	14640                   ## 0x3930
	.data4	8789                    ## 0x2255
	.data4	62                      ## 0x3e
	.data4	1809                    ## 0x711
	.data4	11632                   ## 0x2d70
	.data4	15822                   ## 0x3dce
	.data4	8549                    ## 0x2165
	.data4	2713                    ## 0xa99
	.data4	10491                   ## 0x28fb
	.data4	23811                   ## 0x5d03
	.data4	26728                   ## 0x6868
	.data4	17524                   ## 0x4474
	.data4	9071                    ## 0x236f
	.data4	9520                    ## 0x2530
	.data4	11748                   ## 0x2de4
	.data4	7003                    ## 0x1b5b
	.data4	4294965922              ## 0xfffffaa2
	.data4	4294963971              ## 0xfffff303
	.data4	1832                    ## 0x728
	.data4	5270                    ## 0x1496
	.data4	2647                    ## 0xa57
	.data4	4294966390              ## 0xfffffc76
	.data4	371                     ## 0x173
	.data4	4366                    ## 0x110e
	.data4	3653                    ## 0xe45
	.data4	4294965492              ## 0xfffff8f4
	.data4	4294963120              ## 0xffffefb0
	.data4	2693                    ## 0xa85
	.data4	14346                   ## 0x380a
	.data4	22168                   ## 0x5698
	.data4	24690                   ## 0x6072
	.data4	26463                   ## 0x675f
	.data4	28112                   ## 0x6dd0
	.data4	23778                   ## 0x5ce2
	.data4	11182                   ## 0x2bae
	.data4	4294967056              ## 0xffffff10
	.data4	4294965949              ## 0xfffffabd
	.data4	3621                    ## 0xe25
	.data4	2309                    ## 0x905
	.data4	4294962504              ## 0xffffed48
	.data4	4294965232              ## 0xfffff7f0
	.data4	15572                   ## 0x3cd4
	.data4	30253                   ## 0x762d
	.data4	24375                   ## 0x5f37
	.data4	8082                    ## 0x1f92
	.data4	7937                    ## 0x1f01
	.data4	27466                   ## 0x6b4a
	.data4	40531                   ## 0x9e53
	.data4	27910                   ## 0x6d06
	.data4	6186                    ## 0x182a
	.data4	5921                    ## 0x1721
	.data4	27063                   ## 0x69b7
	.data4	39923                   ## 0x9bf3
	.data4	27714                   ## 0x6c42
	.data4	8291                    ## 0x2063
	.data4	7632                    ## 0x1dd0
	.data4	23482                   ## 0x5bba
	.data4	30741                   ## 0x7815
	.data4	17448                   ## 0x4428
	.data4	4294965727              ## 0xfffff9df
	.data4	4294960268              ## 0xffffe48c
	.data4	444                     ## 0x1bc
	.data4	6121                    ## 0x17e9
	.data4	3581                    ## 0xdfd
	.data4	4294966617              ## 0xfffffd59
	.data4	4294967217              ## 0xffffffb1
	.data4	3842                    ## 0xf02
	.data4	5082                    ## 0x13da
	.data4	2688                    ## 0xa80
	.data4	502                     ## 0x1f6
	.data4	355                     ## 0x163
	.data4	2137                    ## 0x859
	.data4	3432                    ## 0xd68
	.data4	3218                    ## 0xc92
	.data4	2196                    ## 0x894
	.data4	1919                    ## 0x77f
	.data4	3729                    ## 0xe91
	.data4	6543                    ## 0x198f
	.data4	6769                    ## 0x1a71
	.data4	4605                    ## 0x11fd
	.data4	3499                    ## 0xdab
	.data4	5661                    ## 0x161d
	.data4	7993                    ## 0x1f39
	.data4	5621                    ## 0x15f5
	.data4	4294967216              ## 0xffffffb0
	.data4	4294967263              ## 0xffffffdf
	.data4	10908                   ## 0x2a9c
	.data4	27275                   ## 0x6a8b
	.data4	35163                   ## 0x895b
	.data4	29825                   ## 0x7481
	.data4	20669                   ## 0x50bd
	.data4	20648                   ## 0x50a8
	.data4	29895                   ## 0x74c7
	.data4	35627                   ## 0x8b2b
	.data4	27595                   ## 0x6bcb
	.data4	13091                   ## 0x3323
	.data4	7292                    ## 0x1c7c
	.data4	15704                   ## 0x3d58
	.data4	26443                   ## 0x674b
	.data4	25870                   ## 0x650e
	.data4	14249                   ## 0x37a9
	.data4	4460                    ## 0x116c
	.data4	5515                    ## 0x158b
	.data4	14204                   ## 0x377c
	.data4	21865                   ## 0x5569
	.data4	26948                   ## 0x6944
	.data4	32217                   ## 0x7dd9
	.data4	37468                   ## 0x925c
	.data4	36201                   ## 0x8d69
	.data4	25216                   ## 0x6280
	.data4	9318                    ## 0x2466
	.data4	4294966213              ## 0xfffffbc5
	.data4	4294964941              ## 0xfffff6cd
	.data4	2788                    ## 0xae4
	.data4	7104                    ## 0x1bc0
	.data4	7381                    ## 0x1cd5
	.data4	6381                    ## 0x18ed
	.data4	7294                    ## 0x1c7e
	.data4	11134                   ## 0x2b7e
	.data4	15805                   ## 0x3dbd
	.data4	17555                   ## 0x4493
	.data4	19069                   ## 0x4a7d
	.data4	22771                   ## 0x58f3
	.data4	27983                   ## 0x6d4f
	.data4	28851                   ## 0x70b3
	.data4	22764                   ## 0x58ec
	.data4	14796                   ## 0x39cc
	.data4	12611                   ## 0x3143
	.data4	15488                   ## 0x3c80
	.data4	17667                   ## 0x4503
	.data4	16079                   ## 0x3ecf
	.data4	14853                   ## 0x3a05
	.data4	18276                   ## 0x4764
	.data4	24021                   ## 0x5dd5
	.data4	26618                   ## 0x67fa
	.data4	26107                   ## 0x65fb
	.data4	25357                   ## 0x630d
	.data4	25635                   ## 0x6423
	.data4	23657                   ## 0x5c69
	.data4	18559                   ## 0x487f
	.data4	14333                   ## 0x37fd
	.data4	14571                   ## 0x38eb
	.data4	17988                   ## 0x4644
	.data4	21200                   ## 0x52d0
	.data4	21436                   ## 0x53bc
	.data4	19204                   ## 0x4b04
	.data4	14535                   ## 0x38c7
	.data4	10788                   ## 0x2a24
	.data4	11607                   ## 0x2d57
	.data4	17512                   ## 0x4468
	.data4	22778                   ## 0x58fa
	.data4	19636                   ## 0x4cb4
	.data4	10239                   ## 0x27ff
	.data4	4158                    ## 0x103e
	.data4	6281                    ## 0x1889
	.data4	11754                   ## 0x2dea
	.data4	12823                   ## 0x3217
	.data4	11414                   ## 0x2c96
	.data4	16285                   ## 0x3f9d
	.data4	28319                   ## 0x6e9f
	.data4	37697                   ## 0x9341
	.data4	35805                   ## 0x8bdd
	.data4	27217                   ## 0x6a51
	.data4	24570                   ## 0x5ffa
	.data4	30075                   ## 0x757b
	.data4	33038                   ## 0x810e
	.data4	24553                   ## 0x5fe9
	.data4	10410                   ## 0x28aa
	.data4	3470                    ## 0xd8e
	.data4	8653                    ## 0x21cd
	.data4	18320                   ## 0x4790
	.data4	24591                   ## 0x600f
	.data4	27579                   ## 0x6bbb
	.data4	30191                   ## 0x75ef
	.data4	31376                   ## 0x7a90
	.data4	28251                   ## 0x6e5b
	.data4	22328                   ## 0x5738
	.data4	18890                   ## 0x49ca
	.data4	19644                   ## 0x4cbc
	.data4	20238                   ## 0x4f0e
	.data4	17000                   ## 0x4268
	.data4	11982                   ## 0x2ece
	.data4	9966                    ## 0x26ee
	.data4	13080                   ## 0x3318
	.data4	19700                   ## 0x4cf4
	.data4	26513                   ## 0x6791
	.data4	32122                   ## 0x7d7a
	.data4	33938                   ## 0x8492
	.data4	31334                   ## 0x7a66
	.data4	26104                   ## 0x65f8
	.data4	21202                   ## 0x52d2
	.data4	18025                   ## 0x4669
	.data4	15775                   ## 0x3d9f
	.data4	14526                   ## 0x38be
	.data4	16450                   ## 0x4042
	.data4	19160                   ## 0x4ad8
	.data4	17453                   ## 0x442d
	.data4	9147                    ## 0x23bb
	.data4	1484                    ## 0x5cc
	.data4	4580                    ## 0x11e4
	.data4	18149                   ## 0x46e5
	.data4	28742                   ## 0x7046
	.data4	25886                   ## 0x651e
	.data4	14943                   ## 0x3a5f
	.data4	9424                    ## 0x24d0
	.data4	13360                   ## 0x3430
	.data4	17830                   ## 0x45a6
	.data4	14791                   ## 0x39c7
	.data4	9866                    ## 0x268a
	.data4	13759                   ## 0x35bf
	.data4	25513                   ## 0x63a9
	.data4	33556                   ## 0x8314
	.data4	32216                   ## 0x7dd8
	.data4	27576                   ## 0x6bb8
	.data4	27793                   ## 0x6c91
	.data4	29556                   ## 0x7374
	.data4	24480                   ## 0x5fa0
	.data4	13054                   ## 0x32fe
	.data4	5203                    ## 0x1453
	.data4	8423                    ## 0x20e7
	.data4	19296                   ## 0x4b60
	.data4	28808                   ## 0x7088
	.data4	32311                   ## 0x7e37
	.data4	30788                   ## 0x7844
	.data4	27306                   ## 0x6aaa
	.data4	23856                   ## 0x5d30
	.data4	20453                   ## 0x4fe5
	.data4	16475                   ## 0x405b
	.data4	11830                   ## 0x2e36
	.data4	8010                    ## 0x1f4a
	.data4	8633                    ## 0x21b9
	.data4	15334                   ## 0x3be6
	.data4	24793                   ## 0x60d9
	.data4	31666                   ## 0x7bb2
	.data4	33337                   ## 0x8239
	.data4	31781                   ## 0x7c25
	.data4	30229                   ## 0x7615
	.data4	29116                   ## 0x71bc
	.data4	26424                   ## 0x6738
	.data4	21527                   ## 0x5417
	.data4	16693                   ## 0x4135
	.data4	14689                   ## 0x3961
	.data4	15517                   ## 0x3c9d
	.data4	16067                   ## 0x3ec3
	.data4	12574                   ## 0x311e
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0
	.data4	0                       ## 0x0

	.align	2                       ## @output
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
	.data1 48
	.data1 120
	.data1 37
	.data1 120
	.data1 44
	.data1 32
	.data1 0

.str1::                                 ## @.str1
	.data1 45
	.data1 49
	.data1 10
	.data1 0


.import printf
.type printf, @function
.import puts
.type puts, @function
