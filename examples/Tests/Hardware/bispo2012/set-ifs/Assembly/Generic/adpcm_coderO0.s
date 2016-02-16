.section .text
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg() ## @adpcm_coder
adpcm_coder::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -96
;;
	c0	stw 76[$r0.1] = $r0.3
;;
	c0	stw 72[$r0.1] = $r0.4
	c0	mov $r0.11 = 0
	c0	mov $r0.12 = stepsizeTable
;;
	c0	stw 48[$r0.1] = $r0.11
;;
	c0	stw 40[$r0.1] = $r0.11
;;
	c0	stw 32[$r0.1] = $r0.11
	c0	mov $r0.13 = 1
;;
	c0	ldw $r0.14 = 40[$r0.1]
;;
;;
	c0	sh2add $r0.14 = $r0.14, $r0.12
;;
	c0	ldw $r0.14 = 0[$r0.14]
;;
;;
	c0	stw 52[$r0.1] = $r0.14
;;
	c0	stw 36[$r0.1] = $r0.13
;;
	c0	stw 68[$r0.1] = $r0.11
;;
	c0	stw 64[$r0.1] = $r0.11
	c0	mov $r0.14 = 28
	c0	mov $r0.15 = 3
	c0	mov $r0.16 = 4
	c0	mov $r0.17 = 32767
	c0	mov $r0.18 = indexTable
;;
	c0	mov $r0.19 = 88
	c0	mov $r0.20 = -32768
;;
LBB0_1::                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.21 = 64[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.21, 1023
;;
;;
	c0	br $b0.0, LBB0_25
;;
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 76[$r0.1]
;;
	c0	ldw $r0.22 = 64[$r0.1]
;;
;;
	c0	sh1add $r0.21 = $r0.22, $r0.21
;;
	c0	ldh $r0.21 = 0[$r0.21]
;;
;;
	c0	stw 24[$r0.1] = $r0.21
;;
	c0	ldw $r0.22 = 48[$r0.1]
;;
;;
	c0	sub $r0.21 = $r0.21, $r0.22
;;
	c0	shru $r0.22 = $r0.21, $r0.14
	c0	stw 28[$r0.1] = $r0.21
;;
	c0	and $r0.21 = $r0.22, 8
;;
	c0	stw 60[$r0.1] = $r0.21
	c0	cmpeq $b0.0 = $r0.21, 0
;;
;;
	c0	br $b0.0, LBB0_4
;;
## BB#3:                                ## %if.then
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 28[$r0.1]
;;
;;
	c0	sub $r0.21 = $r0.11, $r0.21
;;
	c0	stw 28[$r0.1] = $r0.21
;;
LBB0_4::                                ## %if.end
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	stw 56[$r0.1] = $r0.11
;;
	c0	ldw $r0.21 = 52[$r0.1]
;;
;;
	c0	shr $r0.21 = $r0.21, $r0.15
;;
	c0	stw 44[$r0.1] = $r0.21
;;
	c0	ldw $r0.21 = 52[$r0.1]
;;
	c0	ldw $r0.22 = 28[$r0.1]
;;
;;
	c0	cmplt $b0.0 = $r0.22, $r0.21
;;
;;
	c0	br $b0.0, LBB0_6
;;
## BB#5:                                ## %if.then7
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	stw 56[$r0.1] = $r0.16
;;
	c0	ldw $r0.21 = 28[$r0.1]
;;
	c0	ldw $r0.22 = 52[$r0.1]
;;
;;
	c0	sub $r0.21 = $r0.21, $r0.22
;;
	c0	stw 28[$r0.1] = $r0.21
;;
	c0	ldw $r0.21 = 44[$r0.1]
;;
	c0	ldw $r0.22 = 52[$r0.1]
;;
;;
	c0	add $r0.21 = $r0.21, $r0.22
;;
	c0	stw 44[$r0.1] = $r0.21
;;
LBB0_6::                                ## %if.end9
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 52[$r0.1]
;;
;;
	c0	shr $r0.21 = $r0.21, $r0.13
;;
	c0	stw 52[$r0.1] = $r0.21
;;
	c0	ldw $r0.22 = 28[$r0.1]
;;
;;
	c0	cmplt $b0.0 = $r0.22, $r0.21
;;
;;
	c0	br $b0.0, LBB0_8
;;
## BB#7:                                ## %if.then13
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 56[$r0.1]
;;
;;
	c0	or $r0.21 = $r0.21, 2
;;
	c0	stw 56[$r0.1] = $r0.21
;;
	c0	ldw $r0.21 = 28[$r0.1]
;;
	c0	ldw $r0.22 = 52[$r0.1]
;;
;;
	c0	sub $r0.21 = $r0.21, $r0.22
;;
	c0	stw 28[$r0.1] = $r0.21
;;
	c0	ldw $r0.21 = 44[$r0.1]
;;
	c0	ldw $r0.22 = 52[$r0.1]
;;
;;
	c0	add $r0.21 = $r0.21, $r0.22
;;
	c0	stw 44[$r0.1] = $r0.21
;;
LBB0_8::                                ## %if.end16
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 52[$r0.1]
;;
;;
	c0	shr $r0.21 = $r0.21, $r0.13
;;
	c0	stw 52[$r0.1] = $r0.21
;;
	c0	ldw $r0.22 = 28[$r0.1]
;;
;;
	c0	cmplt $b0.0 = $r0.22, $r0.21
;;
;;
	c0	br $b0.0, LBB0_10
;;
## BB#9:                                ## %if.then20
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 56[$r0.1]
;;
;;
	c0	or $r0.21 = $r0.21, 1
;;
	c0	stw 56[$r0.1] = $r0.21
;;
	c0	ldw $r0.21 = 44[$r0.1]
;;
	c0	ldw $r0.22 = 52[$r0.1]
;;
;;
	c0	add $r0.21 = $r0.21, $r0.22
;;
	c0	stw 44[$r0.1] = $r0.21
;;
LBB0_10::                               ## %if.end23
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 60[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.21, 0
;;
;;
	c0	br $b0.0, LBB0_12
;;
## BB#11:                               ## %if.then25
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 48[$r0.1]
;;
	c0	ldw $r0.22 = 44[$r0.1]
;;
;;
	c0	sub $r0.21 = $r0.21, $r0.22
;;
	c0	stw 48[$r0.1] = $r0.21
	c0	goto LBB0_13
;;
LBB0_12::                               ## %if.else
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 48[$r0.1]
;;
	c0	ldw $r0.22 = 44[$r0.1]
;;
;;
	c0	add $r0.21 = $r0.21, $r0.22
;;
	c0	stw 48[$r0.1] = $r0.21
;;
LBB0_13::                               ## %if.end28
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 48[$r0.1]
;;
;;
	c0	cmplt $b0.0 = $r0.21, 32768
;;
;;
	c0	br $b0.0, LBB0_15
;;
## BB#14:                               ## %if.then31
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	stw 48[$r0.1] = $r0.17
	c0	goto LBB0_17
;;
LBB0_15::                               ## %if.else32
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 48[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.21, -32769
;;
;;
	c0	br $b0.0, LBB0_17
;;
## BB#16:                               ## %if.then35
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	stw 48[$r0.1] = $r0.20
;;
LBB0_17::                               ## %if.end37
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 60[$r0.1]
;;
	c0	ldw $r0.22 = 56[$r0.1]
;;
;;
	c0	or $r0.21 = $r0.22, $r0.21
;;
	c0	sh2add $r0.22 = $r0.21, $r0.18
	c0	stw 56[$r0.1] = $r0.21
;;
	c0	ldw $r0.21 = 0[$r0.22]
;;
	c0	ldw $r0.22 = 40[$r0.1]
;;
;;
	c0	add $r0.21 = $r0.22, $r0.21
;;
	c0	stw 40[$r0.1] = $r0.21
	c0	cmpgt $b0.0 = $r0.21, -1
;;
;;
	c0	br $b0.0, LBB0_19
;;
## BB#18:                               ## %if.then43
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	stw 40[$r0.1] = $r0.11
;;
LBB0_19::                               ## %if.end44
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 40[$r0.1]
;;
;;
	c0	cmplt $b0.0 = $r0.21, 89
;;
;;
	c0	br $b0.0, LBB0_21
;;
## BB#20:                               ## %if.then47
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	stw 40[$r0.1] = $r0.19
;;
LBB0_21::                               ## %if.end48
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 40[$r0.1]
;;
;;
	c0	sh2add $r0.21 = $r0.21, $r0.12
;;
	c0	ldw $r0.21 = 0[$r0.21]
;;
;;
	c0	stw 52[$r0.1] = $r0.21
;;
	c0	ldw $r0.21 = 36[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.21, 0
;;
;;
	c0	br $b0.0, LBB0_23
;;
## BB#22:                               ## %if.then51
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 56[$r0.1]
;;
;;
	c0	shl $r0.21 = $r0.21, $r0.16
;;
	c0	zxtb $r0.21 = $r0.21
;;
	c0	stw 32[$r0.1] = $r0.21
	c0	goto LBB0_24
;;
LBB0_23::                               ## %if.else52
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 56[$r0.1]
;;
	c0	ldw $r0.22 = 72[$r0.1]
;;
	c0	and $r0.21 = $r0.21, 15
	c0	ldw $r0.23 = 68[$r0.1]
;;
	c0	ldw $r0.24 = 32[$r0.1]
;;
	c0	add $r0.22 = $r0.22, $r0.23
;;
	c0	or $r0.21 = $r0.21, $r0.24
;;
	c0	stb 0[$r0.22] = $r0.21
;;
	c0	ldw $r0.21 = 68[$r0.1]
;;
;;
	c0	add $r0.21 = $r0.21, 1
;;
	c0	stw 68[$r0.1] = $r0.21
;;
LBB0_24::                               ## %for.inc
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 36[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.21, 0
;;
;;
	c0	mfb $r0.21 = $b0.0
;;
	c0	stw 36[$r0.1] = $r0.21
;;
	c0	ldw $r0.21 = 64[$r0.1]
;;
;;
	c0	add $r0.21 = $r0.21, 1
;;
	c0	stw 64[$r0.1] = $r0.21
	c0	goto LBB0_1
;;
LBB0_25::                               ## %for.end
	c0	ldw $r0.11 = 36[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.11, 0
;;
;;
	c0	br $b0.0, LBB0_27
;;
## BB#26:                               ## %if.then61
	c0	ldw $r0.11 = 72[$r0.1]
;;
	c0	ldw $r0.12 = 68[$r0.1]
;;
	c0	ldw $r0.13 = 32[$r0.1]
;;
	c0	add $r0.11 = $r0.11, $r0.12
;;
	c0	stb 0[$r0.11] = $r0.13
;;
LBB0_27::                               ## %if.end64
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 96, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-576, arg() ## @main
main::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -576
;;
	c0	stw 556[$r0.1] = $r0.57
;;
	c0	stw 552[$r0.1] = $r0.58
;;
	c0	stw 548[$r0.1] = $l0.0
	c0	mov $r0.58 = 0
	c0	add $r0.57 = $r0.1, 28
	c0	mov $r0.3 = indata
;;
	c0	stw 544[$r0.1] = $r0.58
	c0	mov $r0.4 = $r0.57
;;
.call adpcm_coder, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = adpcm_coder
;;
	c0	stw 24[$r0.1] = $r0.58
	c0	mov $r0.11 = outres
;;
LBB1_1::                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.12 = 24[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.12, 512
;;
;;
	c0	br $b0.0, LBB1_5
;;
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.12 = 24[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.57, $r0.12
;;
	c0	sh2add $r0.12 = $r0.12, $r0.11
	c0	ldb $r0.13 = 0[$r0.13]
;;
	c0	ldw $r0.12 = 0[$r0.12]
;;
;;
	c0	cmpeq $b0.0 = $r0.12, $r0.13
;;
;;
	c0	brf $b0.0, LBB1_3
;;
## BB#4:                                ## %for.inc
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.12 = 24[$r0.1]
;;
;;
	c0	add $r0.12 = $r0.12, 1
;;
	c0	stw 24[$r0.1] = $r0.12
	c0	goto LBB1_1
;;
LBB1_3::                                ## %if.then
	c0	ldw $r0.11 = 24[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 10
;;
	c0	stw 544[$r0.1] = $r0.11
	c0	goto LBB1_6
;;
LBB1_5::                                ## %for.end
	c0	mov $r0.11 = -1
;;
	c0	stw 544[$r0.1] = $r0.11
;;
LBB1_6::                                ## %return
	c0	ldw $r0.3 = 544[$r0.1]
;;
	c0	ldw $l0.0 = 548[$r0.1]
;;
	c0	ldw $r0.58 = 552[$r0.1]
;;
	c0	ldw $r0.57 = 556[$r0.1]
;;
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 576, $l0.0
;;
.endp

.section .data
	.align	2                       ## @indata
indata::
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
	.data2	57073                   ## 0xdef1
	.data2	15512                   ## 0x3c98
	.data2	11654                   ## 0x2d86
	.data2	40336                   ## 0x9d90
	.data2	62049                   ## 0xf261
	.data2	60707                   ## 0xed23
	.data2	11366                   ## 0x2c66
	.data2	49666                   ## 0xc202
	.data2	61437                   ## 0xeffd
	.data2	49900                   ## 0xc2ec
	.data2	57940                   ## 0xe254
	.data2	15806                   ## 0x3dbe
	.data2	18415                   ## 0x47ef
	.data2	42053                   ## 0xa445
	.data2	32708                   ## 0x7fc4
	.data2	8842                    ## 0x228a
	.data2	55679                   ## 0xd97f
	.data2	3696                    ## 0xe70
	.data2	60583                   ## 0xeca7
	.data2	63192                   ## 0xf6d8
	.data2	49065                   ## 0xbfa9
	.data2	10410                   ## 0x28aa
	.data2	31012                   ## 0x7924
	.data2	43631                   ## 0xaa6f
	.data2	53994                   ## 0xd2ea
	.data2	33642                   ## 0x836a
	.data2	25991                   ## 0x6587
	.data2	45386                   ## 0xb14a
	.data2	62554                   ## 0xf45a
	.data2	2026                    ## 0x7ea
	.data2	30073                   ## 0x7579
	.data2	26816                   ## 0x68c0
	.data2	30207                   ## 0x75ff
	.data2	56294                   ## 0xdbe6
	.data2	625                     ## 0x271
	.data2	10980                   ## 0x2ae4
	.data2	13407                   ## 0x345f
	.data2	15779                   ## 0x3da3
	.data2	16746                   ## 0x416a
	.data2	46126                   ## 0xb42e
	.data2	13654                   ## 0x3556
	.data2	39986                   ## 0x9c32
	.data2	45014                   ## 0xafd6
	.data2	48986                   ## 0xbf5a
	.data2	57386                   ## 0xe02a
	.data2	28661                   ## 0x6ff5
	.data2	56274                   ## 0xdbd2
	.data2	64400                   ## 0xfb90
	.data2	8924                    ## 0x22dc
	.data2	38754                   ## 0x9762
	.data2	64410                   ## 0xfb9a
	.data2	49348                   ## 0xc0c4
	.data2	6336                    ## 0x18c0
	.data2	15366                   ## 0x3c06
	.data2	2110                    ## 0x83e
	.data2	9823                    ## 0x265f
	.data2	1615                    ## 0x64f
	.data2	33741                   ## 0x83cd
	.data2	20373                   ## 0x4f95
	.data2	24606                   ## 0x601e
	.data2	48700                   ## 0xbe3c
	.data2	37504                   ## 0x9280
	.data2	45426                   ## 0xb172
	.data2	34106                   ## 0x853a
	.data2	50116                   ## 0xc3c4
	.data2	40846                   ## 0x9f8e
	.data2	64533                   ## 0xfc15
	.data2	9673                    ## 0x25c9
	.data2	48714                   ## 0xbe4a
	.data2	9230                    ## 0x240e
	.data2	7140                    ## 0x1be4
	.data2	21092                   ## 0x5264
	.data2	4642                    ## 0x1222
	.data2	25860                   ## 0x6504
	.data2	4699                    ## 0x125b
	.data2	64008                   ## 0xfa08
	.data2	45740                   ## 0xb2ac
	.data2	56802                   ## 0xdde2
	.data2	59455                   ## 0xe83f
	.data2	49729                   ## 0xc241
	.data2	33189                   ## 0x81a5
	.data2	20306                   ## 0x4f52
	.data2	3865                    ## 0xf19
	.data2	48516                   ## 0xbd84
	.data2	53177                   ## 0xcfb9
	.data2	30258                   ## 0x7632
	.data2	58850                   ## 0xe5e2
	.data2	41948                   ## 0xa3dc
	.data2	53851                   ## 0xd25b
	.data2	44768                   ## 0xaee0
	.data2	21754                   ## 0x54fa
	.data2	29129                   ## 0x71c9
	.data2	8921                    ## 0x22d9
	.data2	2230                    ## 0x8b6
	.data2	46431                   ## 0xb55f
	.data2	37220                   ## 0x9164
	.data2	39594                   ## 0x9aaa
	.data2	36312                   ## 0x8dd8
	.data2	30490                   ## 0x771a
	.data2	61895                   ## 0xf1c7
	.data2	8458                    ## 0x210a
	.data2	49964                   ## 0xc32c
	.data2	15100                   ## 0x3afc
	.data2	45227                   ## 0xb0ab
	.data2	15816                   ## 0x3dc8
	.data2	42153                   ## 0xa4a9
	.data2	21386                   ## 0x538a
	.data2	14929                   ## 0x3a51
	.data2	34142                   ## 0x855e
	.data2	41429                   ## 0xa1d5
	.data2	57653                   ## 0xe135
	.data2	934                     ## 0x3a6
	.data2	12866                   ## 0x3242
	.data2	24200                   ## 0x5e88
	.data2	64974                   ## 0xfdce
	.data2	17057                   ## 0x42a1
	.data2	32635                   ## 0x7f7b
	.data2	15349                   ## 0x3bf5
	.data2	43832                   ## 0xab38
	.data2	18672                   ## 0x48f0
	.data2	39030                   ## 0x9876
	.data2	60906                   ## 0xedea
	.data2	31070                   ## 0x795e
	.data2	25810                   ## 0x64d2
	.data2	12825                   ## 0x3219
	.data2	41046                   ## 0xa056
	.data2	5991                    ## 0x1767
	.data2	27718                   ## 0x6c46
	.data2	8472                    ## 0x2118
	.data2	28940                   ## 0x710c
	.data2	17448                   ## 0x4428
	.data2	22117                   ## 0x5665
	.data2	33160                   ## 0x8188
	.data2	16838                   ## 0x41c6
	.data2	53722                   ## 0xd1da
	.data2	34572                   ## 0x870c
	.data2	17329                   ## 0x43b1
	.data2	9835                    ## 0x266b
	.data2	45324                   ## 0xb10c
	.data2	45245                   ## 0xb0bd
	.data2	12839                   ## 0x3227
	.data2	62356                   ## 0xf394
	.data2	14042                   ## 0x36da
	.data2	28870                   ## 0x70c6
	.data2	50459                   ## 0xc51b
	.data2	45388                   ## 0xb14c
	.data2	4703                    ## 0x125f
	.data2	2467                    ## 0x9a3
	.data2	22254                   ## 0x56ee
	.data2	62999                   ## 0xf617
	.data2	42343                   ## 0xa567
	.data2	57248                   ## 0xdfa0
	.data2	36358                   ## 0x8e06
	.data2	28213                   ## 0x6e35
	.data2	46185                   ## 0xb469
	.data2	39874                   ## 0x9bc2
	.data2	4069                    ## 0xfe5
	.data2	4903                    ## 0x1327
	.data2	41395                   ## 0xa1b3
	.data2	6375                    ## 0x18e7
	.data2	53623                   ## 0xd177
	.data2	55154                   ## 0xd772
	.data2	42983                   ## 0xa7e7
	.data2	32556                   ## 0x7f2c
	.data2	39082                   ## 0x98aa
	.data2	51874                   ## 0xcaa2
	.data2	51109                   ## 0xc7a5
	.data2	12686                   ## 0x318e
	.data2	33604                   ## 0x8344
	.data2	63889                   ## 0xf991
	.data2	23689                   ## 0x5c89
	.data2	29139                   ## 0x71d3
	.data2	42736                   ## 0xa6f0
	.data2	36585                   ## 0x8ee9
	.data2	36184                   ## 0x8d58
	.data2	57002                   ## 0xdeaa
	.data2	7833                    ## 0x1e99
	.data2	63462                   ## 0xf7e6
	.data2	2933                    ## 0xb75
	.data2	12305                   ## 0x3011
	.data2	6394                    ## 0x18fa
	.data2	4448                    ## 0x1160
	.data2	54681                   ## 0xd599
	.data2	54774                   ## 0xd5f6
	.data2	48245                   ## 0xbc75
	.data2	41224                   ## 0xa108
	.data2	61890                   ## 0xf1c2
	.data2	23841                   ## 0x5d21
	.data2	62500                   ## 0xf424
	.data2	40689                   ## 0x9ef1
	.data2	21100                   ## 0x526c
	.data2	48720                   ## 0xbe50
	.data2	31278                   ## 0x7a2e
	.data2	4946                    ## 0x1352
	.data2	23294                   ## 0x5afe
	.data2	64419                   ## 0xfba3
	.data2	45915                   ## 0xb35b
	.data2	35977                   ## 0x8c89
	.data2	46983                   ## 0xb787
	.data2	45114                   ## 0xb03a
	.data2	12265                   ## 0x2fe9
	.data2	29027                   ## 0x7163
	.data2	31657                   ## 0x7ba9
	.data2	30236                   ## 0x761c
	.data2	58783                   ## 0xe59f
	.data2	45978                   ## 0xb39a
	.data2	48341                   ## 0xbcd5
	.data2	18010                   ## 0x465a
	.data2	30499                   ## 0x7723
	.data2	42654                   ## 0xa69e
	.data2	7096                    ## 0x1bb8
	.data2	14195                   ## 0x3773
	.data2	7304                    ## 0x1c88
	.data2	65176                   ## 0xfe98
	.data2	61684                   ## 0xf0f4
	.data2	15866                   ## 0x3dfa
	.data2	299                     ## 0x12b
	.data2	15275                   ## 0x3bab
	.data2	4371                    ## 0x1113
	.data2	54134                   ## 0xd376
	.data2	10942                   ## 0x2abe
	.data2	1404                    ## 0x57c
	.data2	23480                   ## 0x5bb8
	.data2	42888                   ## 0xa788
	.data2	15781                   ## 0x3da5
	.data2	15092                   ## 0x3af4
	.data2	35350                   ## 0x8a16
	.data2	48979                   ## 0xbf53
	.data2	45696                   ## 0xb280
	.data2	47684                   ## 0xba44
	.data2	61606                   ## 0xf0a6
	.data2	42775                   ## 0xa717
	.data2	20744                   ## 0x5108
	.data2	9513                    ## 0x2529
	.data2	10260                   ## 0x2814
	.data2	39455                   ## 0x9a1f
	.data2	1054                    ## 0x41e
	.data2	9585                    ## 0x2571
	.data2	53625                   ## 0xd179
	.data2	50397                   ## 0xc4dd
	.data2	23329                   ## 0x5b21
	.data2	62909                   ## 0xf5bd
	.data2	59855                   ## 0xe9cf
	.data2	1362                    ## 0x552
	.data2	19583                   ## 0x4c7f
	.data2	12935                   ## 0x3287
	.data2	24737                   ## 0x60a1
	.data2	52659                   ## 0xcdb3
	.data2	3470                    ## 0xd8e
	.data2	14182                   ## 0x3766
	.data2	58882                   ## 0xe602
	.data2	3401                    ## 0xd49
	.data2	5020                    ## 0x139c
	.data2	35984                   ## 0x8c90
	.data2	9151                    ## 0x23bf
	.data2	17304                   ## 0x4398
	.data2	37444                   ## 0x9244
	.data2	10400                   ## 0x28a0
	.data2	54743                   ## 0xd5d7
	.data2	8643                    ## 0x21c3
	.data2	2819                    ## 0xb03
	.data2	35482                   ## 0x8a9a
	.data2	30251                   ## 0x762b
	.data2	24110                   ## 0x5e2e
	.data2	49674                   ## 0xc20a
	.data2	61483                   ## 0xf02b
	.data2	28529                   ## 0x6f71
	.data2	40549                   ## 0x9e65
	.data2	11349                   ## 0x2c55
	.data2	11316                   ## 0x2c34
	.data2	2926                    ## 0xb6e
	.data2	39740                   ## 0x9b3c
	.data2	43771                   ## 0xaafb
	.data2	57737                   ## 0xe189
	.data2	36964                   ## 0x9064
	.data2	58166                   ## 0xe336
	.data2	10184                   ## 0x27c8
	.data2	9717                    ## 0x25f5
	.data2	16840                   ## 0x41c8
	.data2	57130                   ## 0xdf2a
	.data2	26376                   ## 0x6708
	.data2	53633                   ## 0xd181
	.data2	14392                   ## 0x3838
	.data2	64803                   ## 0xfd23
	.data2	8869                    ## 0x22a5
	.data2	65013                   ## 0xfdf5
	.data2	17579                   ## 0x44ab
	.data2	9608                    ## 0x2588
	.data2	17012                   ## 0x4274
	.data2	31391                   ## 0x7a9f
	.data2	21225                   ## 0x52e9
	.data2	56956                   ## 0xde7c
	.data2	50635                   ## 0xc5cb
	.data2	14418                   ## 0x3852
	.data2	65342                   ## 0xff3e
	.data2	49543                   ## 0xc187
	.data2	12886                   ## 0x3256
	.data2	61873                   ## 0xf1b1
	.data2	21354                   ## 0x536a
	.data2	10101                   ## 0x2775
	.data2	39978                   ## 0x9c2a
	.data2	37805                   ## 0x93ad
	.data2	57051                   ## 0xdedb
	.data2	11902                   ## 0x2e7e
	.data2	39706                   ## 0x9b1a
	.data2	10827                   ## 0x2a4b
	.data2	40477                   ## 0x9e1d
	.data2	32422                   ## 0x7ea6
	.data2	49481                   ## 0xc149
	.data2	21930                   ## 0x55aa
	.data2	26001                   ## 0x6591
	.data2	28774                   ## 0x7066
	.data2	26368                   ## 0x6700
	.data2	35652                   ## 0x8b44
	.data2	50012                   ## 0xc35c
	.data2	31116                   ## 0x798c
	.data2	57282                   ## 0xdfc2
	.data2	42868                   ## 0xa774
	.data2	36002                   ## 0x8ca2
	.data2	1119                    ## 0x45f
	.data2	27804                   ## 0x6c9c
	.data2	37687                   ## 0x9337
	.data2	35316                   ## 0x89f4
	.data2	5382                    ## 0x1506
	.data2	32704                   ## 0x7fc0
	.data2	566                     ## 0x236
	.data2	63238                   ## 0xf706
	.data2	24873                   ## 0x6129
	.data2	9556                    ## 0x2554
	.data2	36099                   ## 0x8d03
	.data2	51621                   ## 0xc9a5
	.data2	48600                   ## 0xbdd8
	.data2	42375                   ## 0xa587
	.data2	43939                   ## 0xaba3
	.data2	62439                   ## 0xf3e7
	.data2	1964                    ## 0x7ac
	.data2	46054                   ## 0xb3e6
	.data2	21580                   ## 0x544c
	.data2	5539                    ## 0x15a3
	.data2	59691                   ## 0xe92b
	.data2	49132                   ## 0xbfec
	.data2	17007                   ## 0x426f
	.data2	20771                   ## 0x5123
	.data2	9072                    ## 0x2370
	.data2	15071                   ## 0x3adf
	.data2	10743                   ## 0x29f7
	.data2	14104                   ## 0x3718
	.data2	15627                   ## 0x3d0b
	.data2	59097                   ## 0xe6d9
	.data2	23251                   ## 0x5ad3
	.data2	64973                   ## 0xfdcd
	.data2	47909                   ## 0xbb25
	.data2	33572                   ## 0x8324
	.data2	39090                   ## 0x98b2
	.data2	30623                   ## 0x779f
	.data2	18664                   ## 0x48e8
	.data2	27083                   ## 0x69cb
	.data2	11021                   ## 0x2b0d
	.data2	31916                   ## 0x7cac
	.data2	28957                   ## 0x711d
	.data2	62061                   ## 0xf26d
	.data2	26986                   ## 0x696a
	.data2	48075                   ## 0xbbcb
	.data2	52758                   ## 0xce16
	.data2	44628                   ## 0xae54
	.data2	18397                   ## 0x47dd
	.data2	9915                    ## 0x26bb
	.data2	54221                   ## 0xd3cd
	.data2	53701                   ## 0xd1c5
	.data2	42962                   ## 0xa7d2
	.data2	28062                   ## 0x6d9e
	.data2	38989                   ## 0x984d
	.data2	24217                   ## 0x5e99
	.data2	28938                   ## 0x710a
	.data2	15783                   ## 0x3da7
	.data2	15952                   ## 0x3e50
	.data2	58380                   ## 0xe40c
	.data2	46819                   ## 0xb6e3
	.data2	14098                   ## 0x3712
	.data2	58921                   ## 0xe629
	.data2	59348                   ## 0xe7d4
	.data2	28123                   ## 0x6ddb
	.data2	52820                   ## 0xce54
	.data2	18660                   ## 0x48e4
	.data2	19573                   ## 0x4c75
	.data2	30038                   ## 0x7556
	.data2	35988                   ## 0x8c94
	.data2	25003                   ## 0x61ab
	.data2	18643                   ## 0x48d3
	.data2	63903                   ## 0xf99f
	.data2	25433                   ## 0x6359
	.data2	51562                   ## 0xc96a
	.data2	50440                   ## 0xc508
	.data2	29228                   ## 0x722c
	.data2	1923                    ## 0x783
	.data2	43190                   ## 0xa8b6
	.data2	12407                   ## 0x3077
	.data2	49189                   ## 0xc025
	.data2	34687                   ## 0x877f
	.data2	25578                   ## 0x63ea
	.data2	9505                    ## 0x2521
	.data2	12583                   ## 0x3127
	.data2	37046                   ## 0x90b6
	.data2	26003                   ## 0x6593
	.data2	27703                   ## 0x6c37
	.data2	27204                   ## 0x6a44
	.data2	6213                    ## 0x1845
	.data2	43789                   ## 0xab0d
	.data2	14319                   ## 0x37ef
	.data2	32590                   ## 0x7f4e
	.data2	23283                   ## 0x5af3
	.data2	63341                   ## 0xf76d
	.data2	42650                   ## 0xa69a
	.data2	47701                   ## 0xba55
	.data2	26719                   ## 0x685f
	.data2	53409                   ## 0xd0a1
	.data2	58102                   ## 0xe2f6
	.data2	55149                   ## 0xd76d
	.data2	44409                   ## 0xad79
	.data2	43734                   ## 0xaad6
	.data2	30144                   ## 0x75c0
	.data2	47284                   ## 0xb8b4
	.data2	12851                   ## 0x3233
	.data2	58905                   ## 0xe619
	.data2	40077                   ## 0x9c8d
	.data2	54930                   ## 0xd692
	.data2	32375                   ## 0x7e77
	.data2	33344                   ## 0x8240
	.data2	47578                   ## 0xb9da
	.data2	61506                   ## 0xf042
	.data2	23131                   ## 0x5a5b
	.data2	44299                   ## 0xad0b
	.data2	12897                   ## 0x3261
	.data2	49297                   ## 0xc091
	.data2	56722                   ## 0xdd92
	.data2	36485                   ## 0x8e85
	.data2	19374                   ## 0x4bae
	.data2	47846                   ## 0xbae6
	.data2	33317                   ## 0x8225
	.data2	63408                   ## 0xf7b0
	.data2	57328                   ## 0xdff0
	.data2	5249                    ## 0x1481
	.data2	11875                   ## 0x2e63
	.data2	55136                   ## 0xd760
	.data2	64276                   ## 0xfb14
	.data2	40455                   ## 0x9e07
	.data2	27158                   ## 0x6a16
	.data2	39271                   ## 0x9967
	.data2	46351                   ## 0xb50f
	.data2	12605                   ## 0x313d
	.data2	13047                   ## 0x32f7
	.data2	54258                   ## 0xd3f2
	.data2	56699                   ## 0xdd7b
	.data2	46868                   ## 0xb714
	.data2	9314                    ## 0x2462
	.data2	59186                   ## 0xe732
	.data2	19557                   ## 0x4c65
	.data2	2533                    ## 0x9e5
	.data2	58957                   ## 0xe64d
	.data2	29502                   ## 0x733e
	.data2	60516                   ## 0xec64
	.data2	14332                   ## 0x37fc
	.data2	6006                    ## 0x1776
	.data2	51255                   ## 0xc837
	.data2	53742                   ## 0xd1ee
	.data2	59994                   ## 0xea5a
	.data2	9947                    ## 0x26db
	.data2	46252                   ## 0xb4ac
	.data2	62438                   ## 0xf3e6
	.data2	62390                   ## 0xf3b6
	.data2	53359                   ## 0xd06f
	.data2	22080                   ## 0x5640
	.data2	22904                   ## 0x5978
	.data2	19397                   ## 0x4bc5
	.data2	12554                   ## 0x310a
	.data2	53386                   ## 0xd08a
	.data2	53545                   ## 0xd129
	.data2	64187                   ## 0xfabb
	.data2	42400                   ## 0xa5a0
	.data2	3644                    ## 0xe3c
	.data2	34089                   ## 0x8529
	.data2	47376                   ## 0xb910
	.data2	59829                   ## 0xe9b5
	.data2	61574                   ## 0xf086
	.data2	235                     ## 0xeb
	.data2	18311                   ## 0x4787
	.data2	10512                   ## 0x2910
	.data2	37052                   ## 0x90bc
	.data2	31735                   ## 0x7bf7
	.data2	50027                   ## 0xc36b
	.data2	63662                   ## 0xf8ae
	.data2	30773                   ## 0x7835
	.data2	32254                   ## 0x7dfe
	.data2	31515                   ## 0x7b1b
	.data2	27385                   ## 0x6af9
	.data2	62070                   ## 0xf276
	.data2	12334                   ## 0x302e
	.data2	1737                    ## 0x6c9
	.data2	45882                   ## 0xb33a
	.data2	56720                   ## 0xdd90
	.data2	61384                   ## 0xefc8
	.data2	43390                   ## 0xa97e
	.data2	3147                    ## 0xc4b
	.data2	40134                   ## 0x9cc6
	.data2	62958                   ## 0xf5ee
	.data2	15968                   ## 0x3e60
	.data2	54928                   ## 0xd690
	.data2	4466                    ## 0x1172
	.data2	10433                   ## 0x28c1
	.data2	13879                   ## 0x3637
	.data2	8486                    ## 0x2126
	.data2	48680                   ## 0xbe28
	.data2	27051                   ## 0x69ab
	.data2	26925                   ## 0x692d
	.data2	4701                    ## 0x125d
	.data2	30747                   ## 0x781b
	.data2	62712                   ## 0xf4f8
	.data2	49365                   ## 0xc0d5
	.data2	58212                   ## 0xe364
	.data2	19135                   ## 0x4abf
	.data2	42667                   ## 0xa6ab
	.data2	65134                   ## 0xfe6e
	.data2	25410                   ## 0x6342
	.data2	29104                   ## 0x71b0
	.data2	14479                   ## 0x388f
	.data2	8551                    ## 0x2167
	.data2	13581                   ## 0x350d
	.data2	36049                   ## 0x8cd1
	.data2	52619                   ## 0xcd8b
	.data2	12838                   ## 0x3226
	.data2	15701                   ## 0x3d55
	.data2	29368                   ## 0x72b8
	.data2	24122                   ## 0x5e3a
	.data2	29956                   ## 0x7504
	.data2	62176                   ## 0xf2e0
	.data2	17737                   ## 0x4549
	.data2	55995                   ## 0xdabb
	.data2	18844                   ## 0x499c
	.data2	34460                   ## 0x869c
	.data2	44192                   ## 0xaca0
	.data2	5573                    ## 0x15c5
	.data2	14917                   ## 0x3a45
	.data2	5841                    ## 0x16d1
	.data2	23604                   ## 0x5c34
	.data2	52477                   ## 0xccfd
	.data2	65500                   ## 0xffdc
	.data2	24981                   ## 0x6195
	.data2	17976                   ## 0x4638
	.data2	25227                   ## 0x628b
	.data2	32198                   ## 0x7dc6
	.data2	43653                   ## 0xaa85
	.data2	8516                    ## 0x2144
	.data2	7146                    ## 0x1bea
	.data2	64052                   ## 0xfa34
	.data2	51121                   ## 0xc7b1
	.data2	9268                    ## 0x2434
	.data2	63999                   ## 0xf9ff
	.data2	5801                    ## 0x16a9
	.data2	35288                   ## 0x89d8
	.data2	7248                    ## 0x1c50
	.data2	32365                   ## 0x7e6d
	.data2	19640                   ## 0x4cb8
	.data2	62420                   ## 0xf3d4
	.data2	16813                   ## 0x41ad
	.data2	61991                   ## 0xf227
	.data2	62226                   ## 0xf312
	.data2	62807                   ## 0xf557
	.data2	28114                   ## 0x6dd2
	.data2	326                     ## 0x146
	.data2	3776                    ## 0xec0
	.data2	40151                   ## 0x9cd7
	.data2	39069                   ## 0x989d
	.data2	49179                   ## 0xc01b
	.data2	29868                   ## 0x74ac
	.data2	62662                   ## 0xf4c6
	.data2	48999                   ## 0xbf67
	.data2	28040                   ## 0x6d88
	.data2	65381                   ## 0xff65
	.data2	6                       ## 0x6
	.data2	39526                   ## 0x9a66
	.data2	34443                   ## 0x868b
	.data2	56610                   ## 0xdd22
	.data2	35228                   ## 0x899c
	.data2	50259                   ## 0xc453
	.data2	65307                   ## 0xff1b
	.data2	14855                   ## 0x3a07
	.data2	48035                   ## 0xbba3
	.data2	14412                   ## 0x384c
	.data2	46135                   ## 0xb437
	.data2	51879                   ## 0xcaa7
	.data2	45442                   ## 0xb182
	.data2	18939                   ## 0x49fb
	.data2	27451                   ## 0x6b3b
	.data2	64201                   ## 0xfac9
	.data2	31073                   ## 0x7961
	.data2	31734                   ## 0x7bf6
	.data2	62068                   ## 0xf274
	.data2	50287                   ## 0xc46f
	.data2	14552                   ## 0x38d8
	.data2	55400                   ## 0xd868
	.data2	14071                   ## 0x36f7
	.data2	29459                   ## 0x7313
	.data2	26857                   ## 0x68e9
	.data2	45041                   ## 0xaff1
	.data2	25518                   ## 0x63ae
	.data2	55091                   ## 0xd733
	.data2	23856                   ## 0x5d30
	.data2	58059                   ## 0xe2cb
	.data2	23987                   ## 0x5db3
	.data2	44560                   ## 0xae10
	.data2	35416                   ## 0x8a58
	.data2	6189                    ## 0x182d
	.data2	12768                   ## 0x31e0
	.data2	16817                   ## 0x41b1
	.data2	16337                   ## 0x3fd1
	.data2	34803                   ## 0x87f3
	.data2	18342                   ## 0x47a6
	.data2	34094                   ## 0x852e
	.data2	51391                   ## 0xc8bf
	.data2	14974                   ## 0x3a7e
	.data2	27933                   ## 0x6d1d
	.data2	12586                   ## 0x312a
	.data2	10293                   ## 0x2835
	.data2	58072                   ## 0xe2d8
	.data2	4189                    ## 0x105d
	.data2	42144                   ## 0xa4a0
	.data2	58530                   ## 0xe4a2
	.data2	46876                   ## 0xb71c
	.data2	14859                   ## 0x3a0b
	.data2	36323                   ## 0x8de3
	.data2	38539                   ## 0x968b
	.data2	60180                   ## 0xeb14
	.data2	7478                    ## 0x1d36
	.data2	40927                   ## 0x9fdf
	.data2	11898                   ## 0x2e7a
	.data2	45347                   ## 0xb123
	.data2	20579                   ## 0x5063
	.data2	55204                   ## 0xd7a4
	.data2	9782                    ## 0x2636
	.data2	58725                   ## 0xe565
	.data2	998                     ## 0x3e6
	.data2	5669                    ## 0x1625
	.data2	4403                    ## 0x1133
	.data2	50964                   ## 0xc714
	.data2	51571                   ## 0xc973

	.align	4                       ## @stepsizeTable
stepsizeTable::
	.data4	7                       ## 0x7
	.data4	8                       ## 0x8
	.data4	9                       ## 0x9
	.data4	10                      ## 0xa
	.data4	11                      ## 0xb
	.data4	12                      ## 0xc
	.data4	13                      ## 0xd
	.data4	14                      ## 0xe
	.data4	16                      ## 0x10
	.data4	17                      ## 0x11
	.data4	19                      ## 0x13
	.data4	21                      ## 0x15
	.data4	23                      ## 0x17
	.data4	25                      ## 0x19
	.data4	28                      ## 0x1c
	.data4	31                      ## 0x1f
	.data4	34                      ## 0x22
	.data4	37                      ## 0x25
	.data4	41                      ## 0x29
	.data4	45                      ## 0x2d
	.data4	50                      ## 0x32
	.data4	55                      ## 0x37
	.data4	60                      ## 0x3c
	.data4	66                      ## 0x42
	.data4	73                      ## 0x49
	.data4	80                      ## 0x50
	.data4	88                      ## 0x58
	.data4	97                      ## 0x61
	.data4	107                     ## 0x6b
	.data4	118                     ## 0x76
	.data4	130                     ## 0x82
	.data4	143                     ## 0x8f
	.data4	157                     ## 0x9d
	.data4	173                     ## 0xad
	.data4	190                     ## 0xbe
	.data4	209                     ## 0xd1
	.data4	230                     ## 0xe6
	.data4	253                     ## 0xfd
	.data4	279                     ## 0x117
	.data4	307                     ## 0x133
	.data4	337                     ## 0x151
	.data4	371                     ## 0x173
	.data4	408                     ## 0x198
	.data4	449                     ## 0x1c1
	.data4	494                     ## 0x1ee
	.data4	544                     ## 0x220
	.data4	598                     ## 0x256
	.data4	658                     ## 0x292
	.data4	724                     ## 0x2d4
	.data4	796                     ## 0x31c
	.data4	876                     ## 0x36c
	.data4	963                     ## 0x3c3
	.data4	1060                    ## 0x424
	.data4	1166                    ## 0x48e
	.data4	1282                    ## 0x502
	.data4	1411                    ## 0x583
	.data4	1552                    ## 0x610
	.data4	1707                    ## 0x6ab
	.data4	1878                    ## 0x756
	.data4	2066                    ## 0x812
	.data4	2272                    ## 0x8e0
	.data4	2499                    ## 0x9c3
	.data4	2749                    ## 0xabd
	.data4	3024                    ## 0xbd0
	.data4	3327                    ## 0xcff
	.data4	3660                    ## 0xe4c
	.data4	4026                    ## 0xfba
	.data4	4428                    ## 0x114c
	.data4	4871                    ## 0x1307
	.data4	5358                    ## 0x14ee
	.data4	5894                    ## 0x1706
	.data4	6484                    ## 0x1954
	.data4	7132                    ## 0x1bdc
	.data4	7845                    ## 0x1ea5
	.data4	8630                    ## 0x21b6
	.data4	9493                    ## 0x2515
	.data4	10442                   ## 0x28ca
	.data4	11487                   ## 0x2cdf
	.data4	12635                   ## 0x315b
	.data4	13899                   ## 0x364b
	.data4	15289                   ## 0x3bb9
	.data4	16818                   ## 0x41b2
	.data4	18500                   ## 0x4844
	.data4	20350                   ## 0x4f7e
	.data4	22385                   ## 0x5771
	.data4	24623                   ## 0x602f
	.data4	27086                   ## 0x69ce
	.data4	29794                   ## 0x7462
	.data4	32767                   ## 0x7fff

	.align	4                       ## @indexTable
indexTable::
	.data4	4294967295              ## 0xffffffff
	.data4	4294967295              ## 0xffffffff
	.data4	4294967295              ## 0xffffffff
	.data4	4294967295              ## 0xffffffff
	.data4	2                       ## 0x2
	.data4	4                       ## 0x4
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	4294967295              ## 0xffffffff
	.data4	4294967295              ## 0xffffffff
	.data4	4294967295              ## 0xffffffff
	.data4	4294967295              ## 0xffffffff
	.data4	2                       ## 0x2
	.data4	4                       ## 0x4
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8

	.align	4                       ## @outres
outres::
	.data4	4294967287              ## 0xfffffff7
	.data4	4294967287              ## 0xfffffff7
	.data4	4294967295              ## 0xffffffff
	.data4	119                     ## 0x77
	.data4	4294967295              ## 0xffffffff
	.data4	2                       ## 0x2
	.data4	4294967219              ## 0xffffffb3
	.data4	4294967285              ## 0xfffffff5
	.data4	11                      ## 0xb
	.data4	4294967169              ## 0xffffff81
	.data4	110                     ## 0x6e
	.data4	109                     ## 0x6d
	.data4	4294967174              ## 0xffffff86
	.data4	4294967224              ## 0xffffffb8
	.data4	46                      ## 0x2e
	.data4	7                       ## 0x7
	.data4	4294967232              ## 0xffffffc0
	.data4	4294967221              ## 0xffffffb5
	.data4	4294967187              ## 0xffffff93
	.data4	13                      ## 0xd
	.data4	16                      ## 0x10
	.data4	24                      ## 0x18
	.data4	4294967268              ## 0xffffffe4
	.data4	4294967209              ## 0xffffffa9
	.data4	104                     ## 0x68
	.data4	4294967284              ## 0xfffffff4
	.data4	4294967205              ## 0xffffffa5
	.data4	4294967241              ## 0xffffffc9
	.data4	32                      ## 0x20
	.data4	4294967236              ## 0xffffffc4
	.data4	4294967186              ## 0xffffff92
	.data4	47                      ## 0x2f
	.data4	72                      ## 0x48
	.data4	4294967169              ## 0xffffff81
	.data4	28                      ## 0x1c
	.data4	4294967179              ## 0xffffff8b
	.data4	7                       ## 0x7
	.data4	4294967185              ## 0xffffff91
	.data4	4294967265              ## 0xffffffe1
	.data4	4294967176              ## 0xffffff88
	.data4	107                     ## 0x6b
	.data4	4294967220              ## 0xffffffb4
	.data4	18                      ## 0x12
	.data4	4294967215              ## 0xffffffaf
	.data4	21                      ## 0x15
	.data4	4294967254              ## 0xffffffd6
	.data4	4294967226              ## 0xffffffba
	.data4	56                      ## 0x38
	.data4	4294967222              ## 0xffffffb6
	.data4	4294967233              ## 0xffffffc1
	.data4	4294967205              ## 0xffffffa5
	.data4	4294967221              ## 0xffffffb5
	.data4	11                      ## 0xb
	.data4	4294967180              ## 0xffffff8c
	.data4	5                       ## 0x5
	.data4	4294967171              ## 0xffffff83
	.data4	4294967229              ## 0xffffffbd
	.data4	73                      ## 0x49
	.data4	18                      ## 0x12
	.data4	4294967186              ## 0xffffff92
	.data4	4294967233              ## 0xffffffc1
	.data4	17                      ## 0x11
	.data4	4294967259              ## 0xffffffdb
	.data4	24                      ## 0x18
	.data4	109                     ## 0x6d
	.data4	80                      ## 0x50
	.data4	4294967236              ## 0xffffffc4
	.data4	4294967196              ## 0xffffff9c
	.data4	18                      ## 0x12
	.data4	4294967197              ## 0xffffff9d
	.data4	72                      ## 0x48
	.data4	4294967222              ## 0xffffffb6
	.data4	4294967219              ## 0xffffffb3
	.data4	4294967269              ## 0xffffffe5
	.data4	4294967240              ## 0xffffffc8
	.data4	8                       ## 0x8
	.data4	7                       ## 0x7
	.data4	4294967212              ## 0xffffffac
	.data4	4                       ## 0x4
	.data4	4294967177              ## 0xffffff89
	.data4	1                       ## 0x1
	.data4	4294967205              ## 0xffffffa5
	.data4	15                      ## 0xf
	.data4	32                      ## 0x20
	.data4	16                      ## 0x10
	.data4	58                      ## 0x3a
	.data4	4294967228              ## 0xffffffbc
	.data4	50                      ## 0x32
	.data4	4294967199              ## 0xffffff9f
	.data4	107                     ## 0x6b
	.data4	60                      ## 0x3c
	.data4	46                      ## 0x2e
	.data4	4                       ## 0x4
	.data4	12                      ## 0xc
	.data4	4294967171              ## 0xffffff83
	.data4	4294967207              ## 0xffffffa7
	.data4	4294967256              ## 0xffffffd8
	.data4	4294967188              ## 0xffffff94
	.data4	16                      ## 0x10
	.data4	4294967217              ## 0xffffffb1
	.data4	4294967205              ## 0xffffffa5
	.data4	27                      ## 0x1b
	.data4	59                      ## 0x3b
	.data4	4294967189              ## 0xffffff95
	.data4	4294967241              ## 0xffffffc9
	.data4	88                      ## 0x58
	.data4	16                      ## 0x10
	.data4	4294967200              ## 0xffffffa0
	.data4	9                       ## 0x9
	.data4	47                      ## 0x2f
	.data4	2                       ## 0x2
	.data4	4294967213              ## 0xffffffad
	.data4	122                     ## 0x7a
	.data4	1                       ## 0x1
	.data4	4294967284              ## 0xfffffff4
	.data4	26                      ## 0x1a
	.data4	4294967235              ## 0xffffffc3
	.data4	32                      ## 0x20
	.data4	4294967184              ## 0xffffff90
	.data4	4294967280              ## 0xfffffff0
	.data4	94                      ## 0x5e
	.data4	51                      ## 0x33
	.data4	4294967288              ## 0xfffffff8
	.data4	66                      ## 0x42
	.data4	4294967241              ## 0xffffffc9
	.data4	76                      ## 0x4c
	.data4	108                     ## 0x6c
	.data4	4294967200              ## 0xffffffa0
	.data4	104                     ## 0x68
	.data4	4294967271              ## 0xffffffe7
	.data4	4294967178              ## 0xffffff8a
	.data4	4294967238              ## 0xffffffc6
	.data4	4294967252              ## 0xffffffd4
	.data4	4294967219              ## 0xffffffb3
	.data4	12                      ## 0xc
	.data4	4294967187              ## 0xffffff93
	.data4	4294967177              ## 0xffffff89
	.data4	49                      ## 0x31
	.data4	4294967198              ## 0xffffff9e
	.data4	34                      ## 0x22
	.data4	4294967257              ## 0xffffffd9
	.data4	18                      ## 0x12
	.data4	63                      ## 0x3f
	.data4	93                      ## 0x5d
	.data4	73                      ## 0x49
	.data4	4294967217              ## 0xffffffb1
	.data4	4294967239              ## 0xffffffc7
	.data4	9                       ## 0x9
	.data4	4294967235              ## 0xffffffc3
	.data4	4294967234              ## 0xffffffc2
	.data4	57                      ## 0x39
	.data4	15                      ## 0xf
	.data4	48                      ## 0x30
	.data4	16                      ## 0x10
	.data4	4294967169              ## 0xffffff81
	.data4	4294967199              ## 0xffffff9f
	.data4	4294967200              ## 0xffffffa0
	.data4	64                      ## 0x40
	.data4	12                      ## 0xc
	.data4	58                      ## 0x3a
	.data4	4294967202              ## 0xffffffa2
	.data4	4294967191              ## 0xffffff97
	.data4	4294967196              ## 0xffffff9c
	.data4	3                       ## 0x3
	.data4	4294967218              ## 0xffffffb2
	.data4	4294967206              ## 0xffffffa6
	.data4	4294967232              ## 0xffffffc0
	.data4	4294967184              ## 0xffffff90
	.data4	53                      ## 0x35
	.data4	4294967180              ## 0xffffff8c
	.data4	4294967192              ## 0xffffff98
	.data4	51                      ## 0x33
	.data4	29                      ## 0x1d
	.data4	30                      ## 0x1e
	.data4	126                     ## 0x7e
	.data4	107                     ## 0x6b
	.data4	0                       ## 0x0
	.data4	4294967171              ## 0xffffff83
	.data4	4294967284              ## 0xfffffff4
	.data4	4294967201              ## 0xffffffa1
	.data4	12                      ## 0xc
	.data4	4294967176              ## 0xffffff88
	.data4	97                      ## 0x61
	.data4	4294967182              ## 0xffffff8e
	.data4	4                       ## 0x4
	.data4	4294967248              ## 0xffffffd0
	.data4	44                      ## 0x2c
	.data4	40                      ## 0x28
	.data4	4294967177              ## 0xffffff89
	.data4	4294967188              ## 0xffffff94
	.data4	72                      ## 0x48
	.data4	4294967250              ## 0xffffffd2
	.data4	4294967170              ## 0xffffff82
	.data4	4294967233              ## 0xffffffc1
	.data4	4294967185              ## 0xffffff91
	.data4	64                      ## 0x40
	.data4	4294967286              ## 0xfffffff6
	.data4	4294967210              ## 0xffffffaa
	.data4	41                      ## 0x29
	.data4	11                      ## 0xb
	.data4	98                      ## 0x62
	.data4	4294967281              ## 0xfffffff1
	.data4	4294967207              ## 0xffffffa7
	.data4	4294967250              ## 0xffffffd2
	.data4	4                       ## 0x4
	.data4	4294967168              ## 0xffffff80
	.data4	4294967248              ## 0xffffffd0
	.data4	16                      ## 0x10
	.data4	0                       ## 0x0
	.data4	4294967284              ## 0xfffffff4
	.data4	4294967248              ## 0xffffffd0
	.data4	16                      ## 0x10
	.data4	108                     ## 0x6c
	.data4	1                       ## 0x1
	.data4	4294967251              ## 0xffffffd3
	.data4	4294967203              ## 0xffffffa3
	.data4	26                      ## 0x1a
	.data4	25                      ## 0x19
	.data4	4294967286              ## 0xfffffff6
	.data4	13                      ## 0xd
	.data4	4294967184              ## 0xffffff90
	.data4	4294967186              ## 0xffffff92
	.data4	4294967188              ## 0xffffff94
	.data4	45                      ## 0x2d
	.data4	56                      ## 0x38
	.data4	43                      ## 0x2b
	.data4	75                      ## 0x4b
	.data4	4294967179              ## 0xffffff8b
	.data4	32                      ## 0x20
	.data4	4294967212              ## 0xffffffac
	.data4	112                     ## 0x70
	.data4	4294967216              ## 0xffffffb0
	.data4	124                     ## 0x7c
	.data4	4294967202              ## 0xffffffa2
	.data4	4294967190              ## 0xffffff96
	.data4	10                      ## 0xa
	.data4	4294967179              ## 0xffffff8b
	.data4	4294967184              ## 0xffffff90
	.data4	4294967191              ## 0xffffff97
	.data4	4294967169              ## 0xffffff81
	.data4	4294967221              ## 0xffffffb5
	.data4	4294967236              ## 0xffffffc4
	.data4	4294967253              ## 0xffffffd5
	.data4	4294967182              ## 0xffffff8e
	.data4	17                      ## 0x11
	.data4	17                      ## 0x11
	.data4	44                      ## 0x2c
	.data4	34                      ## 0x22
	.data4	4294967215              ## 0xffffffaf
	.data4	77                      ## 0x4d
	.data4	36                      ## 0x24
	.data4	4294967177              ## 0xffffff89
	.data4	4294967251              ## 0xffffffd3
	.data4	59                      ## 0x3b
	.data4	58                      ## 0x3a
	.data4	31                      ## 0x1f
	.data4	59                      ## 0x3b
	.data4	4294967223              ## 0xffffffb7
	.data4	4294967179              ## 0xffffff8b
	.data4	4294967173              ## 0xffffff85
	.data4	4294967202              ## 0xffffffa2
	.data4	47                      ## 0x2f
	.data4	4294967171              ## 0xffffff83
	.data4	4294967171              ## 0xffffff83
	.data4	4294967243              ## 0xffffffcb
	.data4	43                      ## 0x2b
	.data4	123                     ## 0x7b
	.data4	4294967172              ## 0xffffff84
	.data4	4294967179              ## 0xffffff8b
	.data4	74                      ## 0x4a
	.data4	9                       ## 0x9
	.data4	126                     ## 0x7e
	.data4	16                      ## 0x10
	.data4	63                      ## 0x3f
	.data4	51                      ## 0x33
	.data4	31                      ## 0x1f
	.data4	4294967192              ## 0xffffff98
	.data4	50                      ## 0x32
	.data4	4294967184              ## 0xffffff90
	.data4	24                      ## 0x18
	.data4	4294967180              ## 0xffffff8c
	.data4	4294967177              ## 0xffffff89
	.data4	4294967207              ## 0xffffffa7
	.data4	59                      ## 0x3b
	.data4	4294967238              ## 0xffffffc6
	.data4	4294967238              ## 0xffffffc6
	.data4	4294967218              ## 0xffffffb2
	.data4	4294967227              ## 0xffffffbb
	.data4	4294967186              ## 0xffffff92
	.data4	4294967175              ## 0xffffff87
	.data4	32                      ## 0x20
	.data4	4294967181              ## 0xffffff8d
	.data4	4294967192              ## 0xffffff98
	.data4	81                      ## 0x51
	.data4	4294967267              ## 0xffffffe3
	.data4	8                       ## 0x8
	.data4	4294967192              ## 0xffffff98
	.data4	59                      ## 0x3b
	.data4	58                      ## 0x3a
	.data4	4294967237              ## 0xffffffc5
	.data4	4294967187              ## 0xffffff93
	.data4	4294967283              ## 0xfffffff3
	.data4	14                      ## 0xe
	.data4	24                      ## 0x18
	.data4	1                       ## 0x1
	.data4	4294967207              ## 0xffffffa7
	.data4	4294967184              ## 0xffffff90
	.data4	4294967251              ## 0xffffffd3
	.data4	27                      ## 0x1b
	.data4	4294967174              ## 0xffffff86
	.data4	4294967208              ## 0xffffffa8
	.data4	3                       ## 0x3
	.data4	4294967186              ## 0xffffff92
	.data4	4294967281              ## 0xfffffff1
	.data4	27                      ## 0x1b
	.data4	16                      ## 0x10
	.data4	4294967268              ## 0xffffffe4
	.data4	30                      ## 0x1e
	.data4	74                      ## 0x4a
	.data4	40                      ## 0x28
	.data4	4294967255              ## 0xffffffd7
	.data4	4294967181              ## 0xffffff8d
	.data4	20                      ## 0x14
	.data4	4294967268              ## 0xffffffe4
	.data4	4294967177              ## 0xffffff89
	.data4	4294967216              ## 0xffffffb0
	.data4	44                      ## 0x2c
	.data4	51                      ## 0x33
	.data4	4294967169              ## 0xffffff81
	.data4	4294967253              ## 0xffffffd5
	.data4	4294967235              ## 0xffffffc3
	.data4	4294967201              ## 0xffffffa1
	.data4	4294967187              ## 0xffffff93
	.data4	4294967202              ## 0xffffffa2
	.data4	42                      ## 0x2a
	.data4	4294967289              ## 0xfffffff9
	.data4	73                      ## 0x49
	.data4	4294967204              ## 0xffffffa4
	.data4	4294967186              ## 0xffffff92
	.data4	4294967197              ## 0xffffff9d
	.data4	4294967170              ## 0xffffff82
	.data4	62                      ## 0x3e
	.data4	76                      ## 0x4c
	.data4	125                     ## 0x7d
	.data4	64                      ## 0x40
	.data4	8                       ## 0x8
	.data4	4294967280              ## 0xfffffff0
	.data4	92                      ## 0x5c
	.data4	4294967193              ## 0xffffff99
	.data4	67                      ## 0x43
	.data4	4294967288              ## 0xfffffff8
	.data4	82                      ## 0x52
	.data4	4294967224              ## 0xffffffb8
	.data4	74                      ## 0x4a
	.data4	4294967249              ## 0xffffffd1
	.data4	4294967176              ## 0xffffff88
	.data4	3                       ## 0x3
	.data4	12                      ## 0xc
	.data4	122                     ## 0x7a
	.data4	4294967193              ## 0xffffff99
	.data4	80                      ## 0x50
	.data4	4294967185              ## 0xffffff91
	.data4	4294967185              ## 0xffffff91
	.data4	4294967180              ## 0xffffff8c
	.data4	91                      ## 0x5b
	.data4	4294967194              ## 0xffffff9a
	.data4	7                       ## 0x7
	.data4	1                       ## 0x1
	.data4	4294967203              ## 0xffffffa3
	.data4	4294967182              ## 0xffffff8e
	.data4	61                      ## 0x3d
	.data4	9                       ## 0x9
	.data4	105                     ## 0x69
	.data4	4294967208              ## 0xffffffa8
	.data4	4294967191              ## 0xffffff97
	.data4	4294967254              ## 0xffffffd6
	.data4	10                      ## 0xa
	.data4	11                      ## 0xb
	.data4	4294967206              ## 0xffffffa6
	.data4	4294967200              ## 0xffffffa0
	.data4	76                      ## 0x4c
	.data4	56                      ## 0x38
	.data4	47                      ## 0x2f
	.data4	72                      ## 0x48
	.data4	4294967203              ## 0xffffffa3
	.data4	4294967264              ## 0xffffffe0
	.data4	91                      ## 0x5b
	.data4	4294967221              ## 0xffffffb5
	.data4	4294967225              ## 0xffffffb9
	.data4	121                     ## 0x79
	.data4	14                      ## 0xe
	.data4	96                      ## 0x60
	.data4	4294967178              ## 0xffffff8a
	.data4	4294967236              ## 0xffffffc4
	.data4	41                      ## 0x29
	.data4	4294967227              ## 0xffffffbb
	.data4	23                      ## 0x17
	.data4	4294967232              ## 0xffffffc0
	.data4	4294967177              ## 0xffffff89
	.data4	7                       ## 0x7
	.data4	4294967235              ## 0xffffffc3
	.data4	4294967210              ## 0xffffffaa
	.data4	23                      ## 0x17
	.data4	4294967281              ## 0xfffffff1
	.data4	35                      ## 0x23
	.data4	4294967284              ## 0xfffffff4
	.data4	4294967216              ## 0xffffffb0
	.data4	4294967207              ## 0xffffffa7
	.data4	4294967241              ## 0xffffffc9
	.data4	73                      ## 0x49
	.data4	32                      ## 0x20
	.data4	4294967217              ## 0xffffffb1
	.data4	4294967239              ## 0xffffffc7
	.data4	4294967248              ## 0xffffffd0
	.data4	72                      ## 0x48
	.data4	4294967200              ## 0xffffffa0
	.data4	4294967205              ## 0xffffffa5
	.data4	4294967186              ## 0xffffff92
	.data4	4294967208              ## 0xffffffa8
	.data4	91                      ## 0x5b
	.data4	41                      ## 0x29
	.data4	4294967216              ## 0xffffffb0
	.data4	19                      ## 0x13
	.data4	4294967282              ## 0xfffffff2
	.data4	4294967177              ## 0xffffff89
	.data4	80                      ## 0x50
	.data4	4294967177              ## 0xffffff89
	.data4	4294967224              ## 0xffffffb8
	.data4	44                      ## 0x2c
	.data4	77                      ## 0x4d
	.data4	17                      ## 0x11
	.data4	1                       ## 0x1
	.data4	41                      ## 0x29
	.data4	4294967286              ## 0xfffffff6
	.data4	4294967249              ## 0xffffffd1
	.data4	64                      ## 0x40
	.data4	4294967176              ## 0xffffff88
	.data4	4294967233              ## 0xffffffc1
	.data4	4294967195              ## 0xffffff9b
	.data4	32                      ## 0x20
	.data4	4294967222              ## 0xffffffb6
	.data4	4294967235              ## 0xffffffc3
	.data4	44                      ## 0x2c
	.data4	17                      ## 0x11
	.data4	9                       ## 0x9
	.data4	4294967238              ## 0xffffffc6
	.data4	11                      ## 0xb
	.data4	76                      ## 0x4c
	.data4	4294967185              ## 0xffffff91
	.data4	62                      ## 0x3e
	.data4	35                      ## 0x23
	.data4	10                      ## 0xa
	.data4	4294967168              ## 0xffffff80
	.data4	4294967281              ## 0xfffffff1
	.data4	56                      ## 0x38
	.data4	40                      ## 0x28
	.data4	14                      ## 0xe
	.data4	43                      ## 0x2b
	.data4	63                      ## 0x3f
	.data4	19                      ## 0x13
	.data4	8                       ## 0x8
	.data4	47                      ## 0x2f
	.data4	19                      ## 0x13
	.data4	4294967168              ## 0xffffff80
	.data4	31                      ## 0x1f
	.data4	16                      ## 0x10
	.data4	4294967194              ## 0xffffff9a
	.data4	73                      ## 0x49
	.data4	30                      ## 0x1e
	.data4	66                      ## 0x42
	.data4	4294967195              ## 0xffffff9b
	.data4	59                      ## 0x3b
	.data4	8                       ## 0x8
	.data4	123                     ## 0x7b
	.data4	12                      ## 0xc
	.data4	1                       ## 0x1
	.data4	108                     ## 0x6c
	.data4	4294967190              ## 0xffffff96
	.data4	4294967224              ## 0xffffffb8
	.data4	4294967224              ## 0xffffffb8
	.data4	60                      ## 0x3c
	.data4	34                      ## 0x22
	.data4	63                      ## 0x3f
	.data4	76                      ## 0x4c
	.data4	8                       ## 0x8
	.data4	81                      ## 0x51
	.data4	4294967236              ## 0xffffffc4
	.data4	4294967180              ## 0xffffff8c
	.data4	4294967188              ## 0xffffff94
	.data4	4294967219              ## 0xffffffb3
	.data4	40                      ## 0x28
	.data4	4294967284              ## 0xfffffff4
	.data4	4294967236              ## 0xffffffc4
	.data4	4294967220              ## 0xffffffb4
	.data4	4294967257              ## 0xffffffd9
	.data4	65                      ## 0x41
	.data4	8                       ## 0x8
	.data4	4294967285              ## 0xfffffff5
	.data4	4294967249              ## 0xffffffd1
	.data4	65                      ## 0x41
	.data4	4294967200              ## 0xffffffa0
	.data4	4294967218              ## 0xffffffb2
	.data4	4294967250              ## 0xffffffd2
	.data4	4294967205              ## 0xffffffa5
	.data4	4294967248              ## 0xffffffd0
	.data4	49                      ## 0x31
	.data4	4294967252              ## 0xffffffd4
	.data4	4294967221              ## 0xffffffb5
	.data4	4294967234              ## 0xffffffc2
	.data4	4294967184              ## 0xffffff90
	.data4	24                      ## 0x18
	.data4	4294967224              ## 0xffffffb8
	.data4	0                       ## 0x0


