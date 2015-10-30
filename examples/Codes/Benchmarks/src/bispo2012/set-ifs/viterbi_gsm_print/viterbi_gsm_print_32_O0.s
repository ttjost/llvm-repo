.section .text
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg() ## @vitgsm
vitgsm::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -96
;;
	c0	stw 92[$r0.1] = $l0.0
;;
	c0	stw 88[$r0.1] = $r0.57
;;
	c0	stw 84[$r0.1] = $r0.3
;;
	c0	stw 80[$r0.1] = $r0.4
;;
	c0	stw 76[$r0.1] = $r0.5
;;
	c0	stw 72[$r0.1] = $r0.6
;;
	c0	stw 68[$r0.1] = $r0.7
;;
	c0	stw 64[$r0.1] = $r0.8
	c0	mov $r0.11 = 0
;;
	c0	stw 56[$r0.1] = $r0.11
	c0	mov $r0.12 = 1
;;
LBB0_1::                                ## %for.cond
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_3 Depth 2
                                        ##       Child Loop BB0_5 Depth 3
                                        ##     Child Loop BB0_12 Depth 2
	c0	ldw $r0.13 = 84[$r0.1]
;;
	c0	ldw $r0.14 = 56[$r0.1]
;;
	c0	cmpge $b0.0 = $r0.14, $r0.13
;;
	c0	br $b0.0, LBB0_15
;;
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.13 = 64[$r0.1]
;;
	c0	ldw $r0.14 = 56[$r0.1]
;;
	c0	sh2add $r0.13 = $r0.14, $r0.13
;;
	c0	ldh $r0.14 = 2[$r0.13]
;;
	c0	ldh $r0.13 = 0[$r0.13]
;;
	c0	add $r0.13 = $r0.13, $r0.14
;;
	c0	stw 36[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 64[$r0.1]
;;
	c0	ldw $r0.14 = 56[$r0.1]
;;
	c0	sh2add $r0.13 = $r0.14, $r0.13
;;
	c0	ldh $r0.14 = 2[$r0.13]
;;
	c0	ldh $r0.13 = 0[$r0.13]
;;
	c0	sub $r0.13 = $r0.13, $r0.14
;;
	c0	stw 32[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 68[$r0.1]
;;
	c0	ldh $r0.14 = 38[$r0.1]
;;
	c0	sth 4[$r0.13] = $r0.14
;;
	c0	ldw $r0.13 = 68[$r0.1]
;;
	c0	sth 0[$r0.13] = $r0.14
;;
	c0	ldw $r0.13 = 36[$r0.1]
;;
	c0	sub $r0.13 = $r0.11, $r0.13
	c0	ldw $r0.14 = 68[$r0.1]
;;
	c0	sth 6[$r0.14] = $r0.13
;;
	c0	ldw $r0.14 = 68[$r0.1]
;;
	c0	sth 2[$r0.14] = $r0.13
;;
	c0	ldw $r0.13 = 68[$r0.1]
;;
	c0	ldh $r0.14 = 34[$r0.1]
;;
	c0	sth 12[$r0.13] = $r0.14
;;
	c0	ldw $r0.13 = 68[$r0.1]
;;
	c0	sth 8[$r0.13] = $r0.14
;;
	c0	ldw $r0.13 = 32[$r0.1]
;;
	c0	sub $r0.13 = $r0.11, $r0.13
	c0	ldw $r0.14 = 68[$r0.1]
;;
	c0	sth 14[$r0.14] = $r0.13
;;
	c0	ldw $r0.14 = 68[$r0.1]
;;
	c0	sth 10[$r0.14] = $r0.13
;;
	c0	stw 52[$r0.1] = $r0.11
;;
LBB0_3::                                ## %for.cond26
                                        ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB0_5 Depth 3
	c0	ldw $r0.13 = 52[$r0.1]
;;
	c0	cmpgt $b0.0 = $r0.13, 7
;;
	c0	br $b0.0, LBB0_11
;;
## BB#4:                                ## %for.body29
                                        ##   in Loop: Header=BB0_3 Depth=2
	c0	ldw $r0.13 = 68[$r0.1]
;;
	c0	ldw $r0.14 = 52[$r0.1]
;;
	c0	sh1add $r0.13 = $r0.14, $r0.13
;;
	c0	ldh $r0.13 = 0[$r0.13]
;;
	c0	stw 28[$r0.1] = $r0.13
;;
	c0	stw 48[$r0.1] = $r0.11
;;
LBB0_5::                                ## %for.cond32
                                        ##   Parent Loop BB0_1 Depth=1
                                        ##     Parent Loop BB0_3 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	c0	ldw $r0.13 = 48[$r0.1]
;;
	c0	cmpgt $b0.0 = $r0.13, 15
;;
	c0	br $b0.0, LBB0_10
;;
## BB#6:                                ## %for.body35
                                        ##   in Loop: Header=BB0_5 Depth=3
	c0	ldw $r0.13 = 80[$r0.1]
;;
	c0	ldw $r0.14 = 52[$r0.1]
;;
	c0	sh2add $r0.13 = $r0.14, $r0.13
	c0	ldw $r0.14 = 28[$r0.1]
;;
	c0	ldh $r0.13 = 0[$r0.13]
;;
	c0	add $r0.13 = $r0.13, $r0.14
;;
	c0	stw 44[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 52[$r0.1]
;;
	c0	ldw $r0.14 = 80[$r0.1]
;;
	c0	sh2add $r0.13 = $r0.13, $r0.14
	c0	ldw $r0.14 = 28[$r0.1]
;;
	c0	ldh $r0.13 = 2[$r0.13]
;;
	c0	sub $r0.13 = $r0.13, $r0.14
;;
	c0	stw 40[$r0.1] = $r0.13
;;
	c0	ldw $r0.14 = 44[$r0.1]
;;
	c0	cmple $b0.0 = $r0.13, $r0.14
;;
	c0	br $b0.0, LBB0_8
;;
## BB#7:                                ## %cond.true
                                        ##   in Loop: Header=BB0_5 Depth=3
	c0	ldw $r0.13 = 40[$r0.1]
	c0	goto LBB0_9
;;
LBB0_8::                                ## %cond.false
                                        ##   in Loop: Header=BB0_5 Depth=3
	c0	ldw $r0.13 = 44[$r0.1]
;;
LBB0_9::                                ## %for.inc
                                        ##   in Loop: Header=BB0_5 Depth=3
	c0	ldw $r0.14 = 48[$r0.1]
;;
	c0	ldw $r0.15 = 52[$r0.1]
;;
	c0	add $r0.14 = $r0.15, $r0.14
	c0	ldw $r0.15 = 76[$r0.1]
;;
	c0	sh1add $r0.14 = $r0.14, $r0.15
;;
	c0	sth 0[$r0.14] = $r0.13
;;
	c0	ldw $r0.13 = 56[$r0.1]
;;
	c0	ldw $r0.14 = 72[$r0.1]
;;
	c0	sh1add $r0.13 = $r0.13, $r0.14
	c0	ldw $r0.14 = 44[$r0.1]
;;
	c0	ldh $r0.15 = 0[$r0.13]
;;
	c0	ldw $r0.16 = 40[$r0.1]
	c0	shl $r0.15 = $r0.15, $r0.12
;;
	c0	cmpgt $b0.0 = $r0.16, $r0.14
;;
	c0	mfb $r0.14 = $b0.0
;;
	c0	or $r0.14 = $r0.15, $r0.14
;;
	c0	sth 0[$r0.13] = $r0.14
;;
	c0	ldw $r0.13 = 28[$r0.1]
;;
	c0	sub $r0.13 = $r0.11, $r0.13
;;
	c0	stw 28[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 48[$r0.1]
;;
	c0	add $r0.13 = $r0.13, 8
;;
	c0	stw 48[$r0.1] = $r0.13
	c0	goto LBB0_5
;;
LBB0_10::                               ## %for.inc58
                                        ##   in Loop: Header=BB0_3 Depth=2
	c0	ldw $r0.13 = 52[$r0.1]
;;
	c0	add $r0.13 = $r0.13, 1
;;
	c0	stw 52[$r0.1] = $r0.13
	c0	goto LBB0_3
;;
LBB0_11::                               ## %for.end59
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	stw 52[$r0.1] = $r0.11
;;
LBB0_12::                               ## %for.cond60
                                        ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldw $r0.13 = 52[$r0.1]
;;
	c0	cmpgt $b0.0 = $r0.13, 7
;;
	c0	br $b0.0, LBB0_14
;;
## BB#13:                               ## %for.inc70
                                        ##   in Loop: Header=BB0_12 Depth=2
	c0	ldw $r0.13 = 80[$r0.1]
;;
	c0	ldw $r0.14 = 52[$r0.1]
;;
	c0	sh1add $r0.13 = $r0.14, $r0.13
;;
	c0	ldh $r0.13 = 0[$r0.13]
;;
	c0	stw 60[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 76[$r0.1]
;;
	c0	ldw $r0.14 = 52[$r0.1]
;;
	c0	sh1add $r0.13 = $r0.14, $r0.13
	c0	ldw $r0.15 = 80[$r0.1]
;;
	c0	sh1add $r0.14 = $r0.14, $r0.15
	c0	ldh $r0.13 = 0[$r0.13]
;;
	c0	sth 0[$r0.14] = $r0.13
;;
	c0	ldw $r0.13 = 76[$r0.1]
;;
	c0	ldw $r0.14 = 52[$r0.1]
;;
	c0	sh1add $r0.13 = $r0.14, $r0.13
	c0	ldw $r0.14 = 60[$r0.1]
;;
	c0	sth 0[$r0.13] = $r0.14
;;
	c0	ldw $r0.13 = 52[$r0.1]
;;
	c0	add $r0.13 = $r0.13, 1
;;
	c0	stw 52[$r0.1] = $r0.13
	c0	goto LBB0_12
;;
LBB0_14::                               ## %for.inc73
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.13 = 56[$r0.1]
;;
	c0	add $r0.13 = $r0.13, 1
;;
	c0	stw 56[$r0.1] = $r0.13
	c0	goto LBB0_1
;;
LBB0_15::                               ## %for.end75
	c0	stw 24[$r0.1] = $r0.11
	c0	mov $r0.57 = .str
;;
LBB0_16::                               ## %for.cond76
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.11 = 24[$r0.1]
;;
	c0	cmpgt $b0.0 = $r0.11, 23
;;
	c0	br $b0.0, LBB0_18
;;
## BB#17:                               ## %for.inc82
                                        ##   in Loop: Header=BB0_16 Depth=1
	c0	ldw $r0.11 = 80[$r0.1]
;;
	c0	ldw $r0.12 = 24[$r0.1]
;;
	c0	sh1add $r0.11 = $r0.12, $r0.11
;;
	c0	ldh $r0.4 = 0[$r0.11]
	c0	mov $r0.3 = $r0.57
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	ldw $r0.11 = 24[$r0.1]
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 24[$r0.1] = $r0.11
	c0	goto LBB0_16
;;
LBB0_18::                               ## %for.end84
	c0	ldw $r0.57 = 88[$r0.1]
;;
	c0	ldw $l0.0 = 92[$r0.1]
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 96, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-480, arg() ## @main
main::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -480
;;
	c0	stw 476[$r0.1] = $l0.0
;;
	c0	stw 472[$r0.1] = $r0.57
	c0	mov $r0.57 = 0
	c0	mov $r0.11 = 189
;;
	c0	mov $r0.4 = old
	c0	mov $r0.8 = sd
;;
	c0	stw 468[$r0.1] = $r0.57
	c0	add $r0.6 = $r0.1, 40
;;
	c0	stw 20[$r0.1] = $r0.11
	c0	add $r0.7 = $r0.1, 24
	c0	add $r0.5 = $r0.1, 420
;;
	c0	mov $r0.3 = $r0.11
;;
.call vitgsm, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = vitgsm
;;
	c0	mov $r0.3 = $r0.57
	c0	ldw $r0.57 = 472[$r0.1]
;;
	c0	ldw $l0.0 = 476[$r0.1]
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 480, $l0.0
;;
.endp

.section .data
	.align	1                       ## @old
old::
	.data2	46176                   ## 0xb460
	.data2	20792                   ## 0x5138
	.data2	52090                   ## 0xcb7a
	.data2	28862                   ## 0x70be
	.data2	51702                   ## 0xc9f6
	.data2	61498                   ## 0xf03a
	.data2	28855                   ## 0x70b7
	.data2	9475                    ## 0x2503
	.data2	47678                   ## 0xba3e
	.data2	42861                   ## 0xa76d
	.data2	52523                   ## 0xcd2b
	.data2	61515                   ## 0xf04b
	.data2	49699                   ## 0xc223
	.data2	59725                   ## 0xe94d
	.data2	37679                   ## 0x932f
	.data2	3928                    ## 0xf58
	.data2	6920                    ## 0x1b08
	.data2	45319                   ## 0xb107
	.data2	46322                   ## 0xb4f2
	.data2	53489                   ## 0xd0f1
	.data2	25103                   ## 0x620f
	.data2	37488                   ## 0x9270
	.data2	26456                   ## 0x6758
	.data2	43254                   ## 0xa8f6

	.align	1                       ## @sd
sd::
	.data2	46176                   ## 0xb460
	.data2	20792                   ## 0x5138
	.data2	52090                   ## 0xcb7a
	.data2	28862                   ## 0x70be
	.data2	51702                   ## 0xc9f6
	.data2	61498                   ## 0xf03a
	.data2	28855                   ## 0x70b7
	.data2	9475                    ## 0x2503
	.data2	47678                   ## 0xba3e
	.data2	42861                   ## 0xa76d
	.data2	52523                   ## 0xcd2b
	.data2	61515                   ## 0xf04b
	.data2	49699                   ## 0xc223
	.data2	59725                   ## 0xe94d
	.data2	37679                   ## 0x932f
	.data2	3928                    ## 0xf58
	.data2	6920                    ## 0x1b08
	.data2	45319                   ## 0xb107
	.data2	46322                   ## 0xb4f2
	.data2	53489                   ## 0xd0f1
	.data2	25103                   ## 0x620f
	.data2	37488                   ## 0x9270
	.data2	26456                   ## 0x6758
	.data2	43254                   ## 0xa8f6
	.data2	44952                   ## 0xaf98
	.data2	21816                   ## 0x5538
	.data2	61215                   ## 0xef1f
	.data2	57524                   ## 0xe0b4
	.data2	8968                    ## 0x2308
	.data2	36703                   ## 0x8f5f
	.data2	40003                   ## 0x9c43
	.data2	30842                   ## 0x787a
	.data2	59083                   ## 0xe6cb
	.data2	62183                   ## 0xf2e7
	.data2	38820                   ## 0x97a4
	.data2	3692                    ## 0xe6c
	.data2	61595                   ## 0xf09b
	.data2	17098                   ## 0x42ca
	.data2	26341                   ## 0x66e5
	.data2	56982                   ## 0xde96
	.data2	513                     ## 0x201
	.data2	9006                    ## 0x232e
	.data2	19094                   ## 0x4a96
	.data2	12356                   ## 0x3044
	.data2	44316                   ## 0xad1c
	.data2	14550                   ## 0x38d6
	.data2	55956                   ## 0xda94
	.data2	50320                   ## 0xc490
	.data2	24992                   ## 0x61a0
	.data2	19420                   ## 0x4bdc
	.data2	33967                   ## 0x84af
	.data2	6715                    ## 0x1a3b
	.data2	50721                   ## 0xc621
	.data2	24989                   ## 0x619d
	.data2	53646                   ## 0xd18e
	.data2	39616                   ## 0x9ac0
	.data2	57745                   ## 0xe191
	.data2	499                     ## 0x1f3
	.data2	37839                   ## 0x93cf
	.data2	1190                    ## 0x4a6
	.data2	55559                   ## 0xd907
	.data2	7081                    ## 0x1ba9
	.data2	25970                   ## 0x6572
	.data2	42773                   ## 0xa715
	.data2	17857                   ## 0x45c1
	.data2	15403                   ## 0x3c2b
	.data2	6007                    ## 0x1777
	.data2	17068                   ## 0x42ac
	.data2	26476                   ## 0x676c
	.data2	3709                    ## 0xe7d
	.data2	63428                   ## 0xf7c4
	.data2	41873                   ## 0xa391
	.data2	46754                   ## 0xb6a2
	.data2	21870                   ## 0x556e
	.data2	4428                    ## 0x114c
	.data2	18633                   ## 0x48c9
	.data2	39859                   ## 0x9bb3
	.data2	54540                   ## 0xd50c
	.data2	51822                   ## 0xca6e
	.data2	44232                   ## 0xacc8
	.data2	19879                   ## 0x4da7
	.data2	57178                   ## 0xdf5a
	.data2	34202                   ## 0x859a
	.data2	843                     ## 0x34b
	.data2	7555                    ## 0x1d83
	.data2	30784                   ## 0x7840
	.data2	10298                   ## 0x283a
	.data2	32870                   ## 0x8066
	.data2	45515                   ## 0xb1cb
	.data2	17602                   ## 0x44c2
	.data2	43982                   ## 0xabce
	.data2	31960                   ## 0x7cd8
	.data2	63048                   ## 0xf648
	.data2	47476                   ## 0xb974
	.data2	7513                    ## 0x1d59
	.data2	2982                    ## 0xba6
	.data2	50187                   ## 0xc40b
	.data2	15405                   ## 0x3c2d
	.data2	44795                   ## 0xaefb
	.data2	54502                   ## 0xd4e6
	.data2	34225                   ## 0x85b1
	.data2	11514                   ## 0x2cfa
	.data2	49119                   ## 0xbfdf
	.data2	18907                   ## 0x49db
	.data2	23527                   ## 0x5be7
	.data2	2646                    ## 0xa56
	.data2	65110                   ## 0xfe56
	.data2	34370                   ## 0x8642
	.data2	34352                   ## 0x8630
	.data2	9367                    ## 0x2497
	.data2	2116                    ## 0x844
	.data2	29419                   ## 0x72eb
	.data2	5093                    ## 0x13e5
	.data2	38058                   ## 0x94aa
	.data2	11706                   ## 0x2dba
	.data2	64906                   ## 0xfd8a
	.data2	8573                    ## 0x217d
	.data2	27138                   ## 0x6a02
	.data2	14820                   ## 0x39e4
	.data2	31182                   ## 0x79ce
	.data2	9742                    ## 0x260e
	.data2	17357                   ## 0x43cd
	.data2	26149                   ## 0x6625
	.data2	32691                   ## 0x7fb3
	.data2	5396                    ## 0x1514
	.data2	51560                   ## 0xc968
	.data2	56192                   ## 0xdb80
	.data2	56084                   ## 0xdb14
	.data2	22640                   ## 0x5870
	.data2	46613                   ## 0xb615
	.data2	26169                   ## 0x6639
	.data2	24707                   ## 0x6083
	.data2	59058                   ## 0xe6b2
	.data2	27627                   ## 0x6beb
	.data2	16315                   ## 0x3fbb
	.data2	47964                   ## 0xbb5c
	.data2	63898                   ## 0xf99a
	.data2	16909                   ## 0x420d
	.data2	4796                    ## 0x12bc
	.data2	35095                   ## 0x8917
	.data2	10459                   ## 0x28db
	.data2	542                     ## 0x21e
	.data2	40350                   ## 0x9d9e
	.data2	21982                   ## 0x55de
	.data2	60707                   ## 0xed23
	.data2	18676                   ## 0x48f4
	.data2	38680                   ## 0x9718
	.data2	20063                   ## 0x4e5f
	.data2	53079                   ## 0xcf57
	.data2	48779                   ## 0xbe8b
	.data2	47381                   ## 0xb915
	.data2	47842                   ## 0xbae2
	.data2	51235                   ## 0xc823
	.data2	22843                   ## 0x593b
	.data2	5596                    ## 0x15dc
	.data2	38813                   ## 0x979d
	.data2	37809                   ## 0x93b1
	.data2	8237                    ## 0x202d
	.data2	7024                    ## 0x1b70
	.data2	56903                   ## 0xde47
	.data2	64951                   ## 0xfdb7
	.data2	8459                    ## 0x210b
	.data2	59705                   ## 0xe939
	.data2	21738                   ## 0x54ea
	.data2	27063                   ## 0x69b7
	.data2	36086                   ## 0x8cf6
	.data2	56291                   ## 0xdbe3
	.data2	62973                   ## 0xf5fd
	.data2	7042                    ## 0x1b82
	.data2	12477                   ## 0x30bd
	.data2	29573                   ## 0x7385
	.data2	17841                   ## 0x45b1
	.data2	1021                    ## 0x3fd
	.data2	48202                   ## 0xbc4a
	.data2	63494                   ## 0xf806
	.data2	10379                   ## 0x288b
	.data2	5671                    ## 0x1627
	.data2	36191                   ## 0x8d5f
	.data2	32700                   ## 0x7fbc
	.data2	3890                    ## 0xf32
	.data2	26714                   ## 0x685a
	.data2	61826                   ## 0xf182
	.data2	15445                   ## 0x3c55
	.data2	35722                   ## 0x8b8a
	.data2	42448                   ## 0xa5d0
	.data2	4918                    ## 0x1336
	.data2	12794                   ## 0x31fa
	.data2	41728                   ## 0xa300
	.data2	37992                   ## 0x9468
	.data2	1643                    ## 0x66b
	.data2	48305                   ## 0xbcb1
	.data2	29223                   ## 0x7227
	.data2	45738                   ## 0xb2aa
	.data2	43062                   ## 0xa836
	.data2	34818                   ## 0x8802
	.data2	62852                   ## 0xf584
	.data2	12808                   ## 0x3208
	.data2	17860                   ## 0x45c4
	.data2	56541                   ## 0xdcdd
	.data2	2981                    ## 0xba5
	.data2	53606                   ## 0xd166
	.data2	16012                   ## 0x3e8c
	.data2	27066                   ## 0x69ba
	.data2	1144                    ## 0x478
	.data2	23516                   ## 0x5bdc
	.data2	5572                    ## 0x15c4
	.data2	59649                   ## 0xe901
	.data2	20953                   ## 0x51d9
	.data2	53178                   ## 0xcfba
	.data2	42773                   ## 0xa715
	.data2	18861                   ## 0x49ad
	.data2	11628                   ## 0x2d6c
	.data2	29132                   ## 0x71cc
	.data2	29329                   ## 0x7291
	.data2	15915                   ## 0x3e2b
	.data2	18348                   ## 0x47ac
	.data2	20702                   ## 0x50de
	.data2	13284                   ## 0x33e4
	.data2	21895                   ## 0x5587
	.data2	54340                   ## 0xd444
	.data2	64898                   ## 0xfd82
	.data2	14537                   ## 0x38c9
	.data2	714                     ## 0x2ca
	.data2	34717                   ## 0x879d
	.data2	31248                   ## 0x7a10
	.data2	10944                   ## 0x2ac0
	.data2	13981                   ## 0x369d
	.data2	22967                   ## 0x59b7
	.data2	42733                   ## 0xa6ed
	.data2	16381                   ## 0x3ffd
	.data2	28465                   ## 0x6f31
	.data2	8764                    ## 0x223c
	.data2	44816                   ## 0xaf10
	.data2	1955                    ## 0x7a3
	.data2	25186                   ## 0x6262
	.data2	25042                   ## 0x61d2
	.data2	14530                   ## 0x38c2
	.data2	17713                   ## 0x4531
	.data2	42522                   ## 0xa61a
	.data2	52400                   ## 0xccb0
	.data2	24228                   ## 0x5ea4
	.data2	36668                   ## 0x8f3c
	.data2	64243                   ## 0xfaf3
	.data2	27252                   ## 0x6a74
	.data2	46326                   ## 0xb4f6
	.data2	42334                   ## 0xa55e
	.data2	7456                    ## 0x1d20
	.data2	24370                   ## 0x5f32
	.data2	57109                   ## 0xdf15
	.data2	45422                   ## 0xb16e
	.data2	16269                   ## 0x3f8d
	.data2	45520                   ## 0xb1d0
	.data2	31045                   ## 0x7945
	.data2	59377                   ## 0xe7f1
	.data2	38211                   ## 0x9543
	.data2	41872                   ## 0xa390
	.data2	23217                   ## 0x5ab1
	.data2	15311                   ## 0x3bcf
	.data2	36113                   ## 0x8d11
	.data2	27885                   ## 0x6ced
	.data2	29615                   ## 0x73af
	.data2	6473                    ## 0x1949
	.data2	41832                   ## 0xa368
	.data2	29611                   ## 0x73ab
	.data2	52295                   ## 0xcc47
	.data2	23594                   ## 0x5c2a
	.data2	61062                   ## 0xee86
	.data2	20009                   ## 0x4e29
	.data2	26357                   ## 0x66f5
	.data2	62780                   ## 0xf53c
	.data2	51415                   ## 0xc8d7
	.data2	10233                   ## 0x27f9
	.data2	2990                    ## 0xbae
	.data2	62205                   ## 0xf2fd
	.data2	15767                   ## 0x3d97
	.data2	23474                   ## 0x5bb2
	.data2	16160                   ## 0x3f20
	.data2	57746                   ## 0xe192
	.data2	7099                    ## 0x1bbb
	.data2	22020                   ## 0x5604
	.data2	59966                   ## 0xea3e
	.data2	46588                   ## 0xb5fc
	.data2	54033                   ## 0xd311
	.data2	5644                    ## 0x160c
	.data2	30203                   ## 0x75fb
	.data2	47241                   ## 0xb889
	.data2	32678                   ## 0x7fa6
	.data2	57064                   ## 0xdee8
	.data2	24404                   ## 0x5f54
	.data2	8844                    ## 0x228c
	.data2	51047                   ## 0xc767
	.data2	61070                   ## 0xee8e
	.data2	34708                   ## 0x8794
	.data2	25424                   ## 0x6350
	.data2	28170                   ## 0x6e0a
	.data2	19929                   ## 0x4dd9
	.data2	50387                   ## 0xc4d3
	.data2	16457                   ## 0x4049
	.data2	49966                   ## 0xc32e
	.data2	3556                    ## 0xde4
	.data2	30399                   ## 0x76bf
	.data2	17548                   ## 0x448c
	.data2	20160                   ## 0x4ec0
	.data2	34459                   ## 0x869b
	.data2	9118                    ## 0x239e
	.data2	13184                   ## 0x3380
	.data2	24481                   ## 0x5fa1
	.data2	27278                   ## 0x6a8e
	.data2	24979                   ## 0x6193
	.data2	29397                   ## 0x72d5
	.data2	24709                   ## 0x6085
	.data2	50184                   ## 0xc408
	.data2	36895                   ## 0x901f
	.data2	40885                   ## 0x9fb5
	.data2	5918                    ## 0x171e
	.data2	12128                   ## 0x2f60
	.data2	9706                    ## 0x25ea
	.data2	49978                   ## 0xc33a
	.data2	12664                   ## 0x3178
	.data2	59022                   ## 0xe68e
	.data2	38595                   ## 0x96c3
	.data2	55839                   ## 0xda1f
	.data2	50598                   ## 0xc5a6
	.data2	29184                   ## 0x7200
	.data2	5605                    ## 0x15e5
	.data2	41913                   ## 0xa3b9
	.data2	42910                   ## 0xa79e
	.data2	4782                    ## 0x12ae
	.data2	47228                   ## 0xb87c
	.data2	60455                   ## 0xec27
	.data2	47457                   ## 0xb961
	.data2	14700                   ## 0x396c
	.data2	48231                   ## 0xbc67
	.data2	50632                   ## 0xc5c8
	.data2	39262                   ## 0x995e
	.data2	40830                   ## 0x9f7e
	.data2	63294                   ## 0xf73e
	.data2	26093                   ## 0x65ed
	.data2	21272                   ## 0x5318
	.data2	54385                   ## 0xd471
	.data2	45461                   ## 0xb195
	.data2	39119                   ## 0x98cf
	.data2	62982                   ## 0xf606
	.data2	21800                   ## 0x5528
	.data2	29314                   ## 0x7282
	.data2	195                     ## 0xc3
	.data2	14009                   ## 0x36b9
	.data2	32820                   ## 0x8034
	.data2	32604                   ## 0x7f5c
	.data2	38059                   ## 0x94ab
	.data2	32324                   ## 0x7e44
	.data2	64361                   ## 0xfb69
	.data2	5061                    ## 0x13c5
	.data2	4527                    ## 0x11af
	.data2	3031                    ## 0xbd7
	.data2	24237                   ## 0x5ead
	.data2	38379                   ## 0x95eb
	.data2	21549                   ## 0x542d
	.data2	3245                    ## 0xcad
	.data2	14355                   ## 0x3813
	.data2	19210                   ## 0x4b0a
	.data2	52205                   ## 0xcbed
	.data2	52776                   ## 0xce28
	.data2	48423                   ## 0xbd27
	.data2	20532                   ## 0x5034
	.data2	32665                   ## 0x7f99
	.data2	28217                   ## 0x6e39
	.data2	48523                   ## 0xbd8b
	.data2	56148                   ## 0xdb54
	.data2	21355                   ## 0x536b
	.data2	44549                   ## 0xae05
	.data2	43714                   ## 0xaac2
	.data2	2160                    ## 0x870
	.data2	34600                   ## 0x8728
	.data2	51909                   ## 0xcac5
	.data2	51531                   ## 0xc94b
	.data2	46893                   ## 0xb72d
	.data2	40780                   ## 0x9f4c
	.data2	33005                   ## 0x80ed

	.section	.data
.str::                                  ## @.str
	.data1 37
	.data1 100
	.data1 44
	.data1 32
	.data1 0


.import printf
.type printf, @function
.import puts
.type puts, @function
