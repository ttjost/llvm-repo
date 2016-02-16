.section .text
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @adpcm_decoder
adpcm_decoder::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 60[$r0.1] = $r0.3
;;
	c0	stw 56[$r0.1] = $r0.4
	c0	mov $r0.11 = 0
;;
	c0	stw 32[$r0.1] = $r0.11
;;
	c0	mov $r0.12 = stepsizeTable
;;
	c0	stw 24[$r0.1] = $r0.11
;;
	c0	stw 16[$r0.1] = $r0.11
;;
	c0	ldw $r0.13 = 24[$r0.1]
;;
;;
	c0	sh2add $r0.13 = $r0.13, $r0.12
;;
	c0	ldw $r0.13 = 0[$r0.13]
;;
;;
	c0	stw 36[$r0.1] = $r0.13
;;
	c0	stw 20[$r0.1] = $r0.11
;;
	c0	stw 52[$r0.1] = $r0.11
;;
	c0	stw 48[$r0.1] = $r0.11
;;
	c0	mov $r0.13 = indexTable
;;
	c0	mov $r0.14 = 88
	c0	mov $r0.15 = 3
;;
	c0	mov $r0.16 = 32767
;;
	c0	mov $r0.17 = -32768
;;
	c0	mov $r0.18 = 1
	c0	mov $r0.19 = 2
;;
	c0	mov $r0.20 = 4
;;
LBB0_1::                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.21 = 48[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.21, 1023
;;
;;
	c0	br $b0.0, LBB0_23
;;
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 20[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.21, 0
;;
;;
	c0	br $b0.0, LBB0_4
;;
## BB#3:                                ## %if.then
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 16[$r0.1]
;;
;;
	c0	and $r0.21 = $r0.21, 15
;;
	c0	stw 40[$r0.1] = $r0.21
	c0	goto LBB0_5
;;
LBB0_4::                                ## %if.else
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 60[$r0.1]
;;
	c0	ldw $r0.22 = 52[$r0.1]
;;
;;
	c0	sh1add $r0.21 = $r0.22, $r0.21
;;
	c0	ldh $r0.21 = 0[$r0.21]
;;
;;
	c0	stw 16[$r0.1] = $r0.21
;;
	c0	ldw $r0.21 = 52[$r0.1]
;;
;;
	c0	add $r0.21 = $r0.21, 1
;;
	c0	stw 52[$r0.1] = $r0.21
;;
	c0	ldw $r0.21 = 16[$r0.1]
;;
;;
	c0	shru $r0.21 = $r0.21, $r0.20
;;
	c0	and $r0.21 = $r0.21, 15
;;
	c0	stw 40[$r0.1] = $r0.21
;;
LBB0_5::                                ## %if.end
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 20[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.21, 0
;;
;;
	c0	mfb $r0.21 = $b0.0
;;
	c0	stw 20[$r0.1] = $r0.21
;;
	c0	ldw $r0.21 = 40[$r0.1]
;;
	c0	ldw $r0.22 = 24[$r0.1]
;;
	c0	sh2add $r0.21 = $r0.21, $r0.13
;;
	c0	ldw $r0.21 = 0[$r0.21]
;;
;;
	c0	add $r0.21 = $r0.22, $r0.21
;;
	c0	stw 24[$r0.1] = $r0.21
	c0	cmpgt $b0.0 = $r0.21, -1
;;
;;
	c0	br $b0.0, LBB0_7
;;
## BB#6:                                ## %if.then7
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	stw 24[$r0.1] = $r0.11
;;
LBB0_7::                                ## %if.end8
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 24[$r0.1]
;;
;;
	c0	cmplt $b0.0 = $r0.21, 89
;;
;;
	c0	br $b0.0, LBB0_9
;;
## BB#8:                                ## %if.then11
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	stw 24[$r0.1] = $r0.14
;;
LBB0_9::                                ## %if.end12
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 40[$r0.1]
;;
;;
	c0	and $r0.21 = $r0.21, 8
;;
	c0	stw 44[$r0.1] = $r0.21
;;
	c0	ldw $r0.21 = 40[$r0.1]
;;
;;
	c0	and $r0.21 = $r0.21, 7
;;
	c0	stw 40[$r0.1] = $r0.21
;;
	c0	ldw $r0.21 = 36[$r0.1]
;;
;;
	c0	shr $r0.21 = $r0.21, $r0.15
;;
	c0	stw 28[$r0.1] = $r0.21
;;
	c0	ldbu $r0.21 = 43[$r0.1]
;;
;;
	c0	and $r0.21 = $r0.21, 4
;;
	c0	cmpeq $b0.0 = $r0.21, 0
;;
;;
	c0	br $b0.0, LBB0_11
;;
## BB#10:                               ## %if.then18
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 28[$r0.1]
;;
	c0	ldw $r0.22 = 36[$r0.1]
;;
;;
	c0	add $r0.21 = $r0.21, $r0.22
;;
	c0	stw 28[$r0.1] = $r0.21
	c0	goto LBB0_15
;;
LBB0_11::                               ## %if.else20
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldbu $r0.21 = 43[$r0.1]
;;
;;
	c0	and $r0.21 = $r0.21, 2
;;
	c0	cmpeq $b0.0 = $r0.21, 0
;;
;;
	c0	br $b0.0, LBB0_13
;;
## BB#12:                               ## %if.then23
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 36[$r0.1]
;;
	c0	ldw $r0.22 = 28[$r0.1]
;;
	c0	shr $r0.21 = $r0.21, $r0.18
;;
	c0	add $r0.21 = $r0.22, $r0.21
;;
	c0	stw 28[$r0.1] = $r0.21
	c0	goto LBB0_15
;;
LBB0_13::                               ## %if.else26
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 40[$r0.1]
;;
;;
	c0	and $r0.21 = $r0.21, 1
;;
	c0	cmpeq $b0.0 = $r0.21, 0
;;
;;
	c0	br $b0.0, LBB0_15
;;
## BB#14:                               ## %if.then29
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 36[$r0.1]
;;
	c0	ldw $r0.22 = 28[$r0.1]
;;
	c0	shr $r0.21 = $r0.21, $r0.19
;;
	c0	add $r0.21 = $r0.22, $r0.21
;;
	c0	stw 28[$r0.1] = $r0.21
;;
LBB0_15::                               ## %if.end34
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 44[$r0.1]
;;
;;
	c0	cmpeq $b0.0 = $r0.21, 0
;;
;;
	c0	br $b0.0, LBB0_17
;;
## BB#16:                               ## %if.then36
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 32[$r0.1]
;;
	c0	ldw $r0.22 = 28[$r0.1]
;;
;;
	c0	sub $r0.21 = $r0.21, $r0.22
;;
	c0	stw 32[$r0.1] = $r0.21
	c0	goto LBB0_18
;;
LBB0_17::                               ## %if.else37
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 32[$r0.1]
;;
	c0	ldw $r0.22 = 28[$r0.1]
;;
;;
	c0	add $r0.21 = $r0.21, $r0.22
;;
	c0	stw 32[$r0.1] = $r0.21
;;
LBB0_18::                               ## %if.end39
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 32[$r0.1]
;;
;;
	c0	cmplt $b0.0 = $r0.21, 32768
;;
;;
	c0	br $b0.0, LBB0_20
;;
## BB#19:                               ## %if.then42
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	stw 32[$r0.1] = $r0.16
	c0	goto LBB0_22
;;
LBB0_20::                               ## %if.else43
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 32[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.21, -32769
;;
;;
	c0	br $b0.0, LBB0_22
;;
## BB#21:                               ## %if.then46
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	stw 32[$r0.1] = $r0.17
;;
LBB0_22::                               ## %for.inc
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.21 = 24[$r0.1]
;;
;;
	c0	sh2add $r0.21 = $r0.21, $r0.12
;;
	c0	ldw $r0.21 = 0[$r0.21]
;;
;;
	c0	stw 36[$r0.1] = $r0.21
;;
	c0	ldw $r0.21 = 56[$r0.1]
;;
	c0	ldw $r0.22 = 48[$r0.1]
;;
	c0	ldw $r0.23 = 32[$r0.1]
;;
	c0	add $r0.21 = $r0.21, $r0.22
;;
	c0	stb 0[$r0.21] = $r0.23
;;
	c0	ldw $r0.21 = 48[$r0.1]
;;
;;
	c0	add $r0.21 = $r0.21, 1
;;
	c0	stw 48[$r0.1] = $r0.21
	c0	goto LBB0_1
;;
LBB0_23::                               ## %for.end
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-1088, arg() ## @main
main::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -1088
;;
	c0	stw 1068[$r0.1] = $r0.57
;;
	c0	stw 1064[$r0.1] = $r0.58
;;
	c0	stw 1060[$r0.1] = $l0.0
;;
	c0	mov $r0.58 = 0
	c0	add $r0.57 = $r0.1, 32
;;
	c0	stw 1056[$r0.1] = $r0.58
;;
	c0	mov $r0.3 = indata
;;
	c0	mov $r0.4 = $r0.57
;;
.call adpcm_decoder, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = adpcm_decoder
;;
	c0	stw 28[$r0.1] = $r0.58
;;
	c0	mov $r0.11 = outdata_ref
;;
LBB1_1::                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.12 = 28[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.12, 1023
;;
;;
	c0	br $b0.0, LBB1_5
;;
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.12 = 28[$r0.1]
;;
;;
	c0	add $r0.13 = $r0.57, $r0.12
	c0	add $r0.12 = $r0.11, $r0.12
;;
	c0	ldb $r0.13 = 0[$r0.13]
;;
	c0	ldb $r0.12 = 0[$r0.12]
;;
;;
	c0	cmpeq $b0.0 = $r0.12, $r0.13
;;
;;
	c0	brf $b0.0, LBB1_3
;;
## BB#4:                                ## %for.inc
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.12 = 28[$r0.1]
;;
;;
	c0	add $r0.12 = $r0.12, 1
;;
	c0	stw 28[$r0.1] = $r0.12
	c0	goto LBB1_1
;;
LBB1_3::                                ## %if.then
	c0	ldw $r0.11 = 28[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 10
;;
	c0	stw 1056[$r0.1] = $r0.11
;;
	c0	goto LBB1_6
;;
LBB1_5::                                ## %for.end
	c0	mov $r0.11 = -1
;;
	c0	stw 1056[$r0.1] = $r0.11
;;
LBB1_6::                                ## %return
	c0	ldw $r0.3 = 1056[$r0.1]
;;
	c0	ldw $l0.0 = 1060[$r0.1]
;;
	c0	ldw $r0.58 = 1064[$r0.1]
;;
	c0	ldw $r0.57 = 1068[$r0.1]
;;
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 1088, $l0.0
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

outdata_ref::                           ## @outdata_ref
	.data1 7
	.data1 8
	.data1 15
	.data1 14
	.data1 25
	.data1 13
	.data1 2
	.data1 239
	.data1 205
	.data1 23
	.data1 96
	.data1 30
	.data1 226
	.data1 69
	.data1 92
	.data1 199
	.data1 40
	.data1 136
	.data1 164
	.data1 171
	.data1 70
	.data1 209
	.data1 53
	.data1 154
	.data1 15
	.data1 99
	.data1 142
	.data1 238
	.data1 17
	.data1 146
	.data1 18
	.data1 218
	.data1 246
	.data1 244
	.data1 222
	.data1 94
	.data1 73
	.data1 111
	.data1 24
	.data1 125
	.data1 70
	.data1 192
	.data1 199
	.data1 198
	.data1 255
	.data1 0
	.data1 18
	.data1 16
	.data1 18
	.data1 134
	.data1 255
	.data1 250
	.data1 255
	.data1 146
	.data1 148
	.data1 130
	.data1 129
	.data1 245
	.data1 255
	.data1 1
	.data1 255
	.data1 255
	.data1 255
	.data1 1
	.data1 19
	.data1 0
	.data1 0
	.data1 254
	.data1 0
	.data1 238
	.data1 255
	.data1 1
	.data1 3
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 254
	.data1 0
	.data1 238
	.data1 237
	.data1 255
	.data1 255
	.data1 203
	.data1 205
	.data1 187
	.data1 255
	.data1 255
	.data1 255
	.data1 17
	.data1 0
	.data1 254
	.data1 0
	.data1 238
	.data1 240
	.data1 124
	.data1 92
	.data1 97
	.data1 2
	.data1 0
	.data1 0
	.data1 0
	.data1 254
	.data1 65
	.data1 97
	.data1 113
	.data1 167
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 255
	.data1 0
	.data1 172
	.data1 0
	.data1 254
	.data1 0
	.data1 0
	.data1 0
	.data1 238
	.data1 237
	.data1 255
	.data1 1
	.data1 93
	.data1 100
	.data1 255
	.data1 255
	.data1 255
	.data1 1
	.data1 255
	.data1 188
	.data1 156
	.data1 255
	.data1 255
	.data1 1
	.data1 19
	.data1 17
	.data1 19
	.data1 17
	.data1 19
	.data1 0
	.data1 254
	.data1 0
	.data1 164
	.data1 132
	.data1 160
	.data1 255
	.data1 1
	.data1 255
	.data1 1
	.data1 0
	.data1 0
	.data1 0
	.data1 32
	.data1 37
	.data1 0
	.data1 7
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 7
	.data1 255
	.data1 1
	.data1 93
	.data1 61
	.data1 113
	.data1 180
	.data1 123
	.data1 151
	.data1 246
	.data1 255
	.data1 255
	.data1 89
	.data1 255
	.data1 255
	.data1 1
	.data1 3
	.data1 0
	.data1 254
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 238
	.data1 239
	.data1 221
	.data1 255
	.data1 255
	.data1 1
	.data1 68
	.data1 75
	.data1 255
	.data1 66
	.data1 98
	.data1 46
	.data1 0
	.data1 0
	.data1 0
	.data1 254
	.data1 0
	.data1 164
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 254
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 239
	.data1 255
	.data1 255
	.data1 255
	.data1 1
	.data1 3
	.data1 0
	.data1 254
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 76
	.data1 0
	.data1 255
	.data1 188
	.data1 0
	.data1 254
	.data1 0
	.data1 0
	.data1 255
	.data1 0
	.data1 0
	.data1 0
	.data1 254
	.data1 236
	.data1 238
	.data1 171
	.data1 87
	.data1 255
	.data1 255
	.data1 0
	.data1 116
	.data1 173
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 91
	.data1 34
	.data1 255
	.data1 89
	.data1 7
	.data1 187
	.data1 189
	.data1 0
	.data1 0
	.data1 52
	.data1 0
	.data1 0
	.data1 0
	.data1 57
	.data1 0
	.data1 0
	.data1 0
	.data1 254
	.data1 236
	.data1 238
	.data1 0
	.data1 164
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 254
	.data1 187
	.data1 180
	.data1 178
	.data1 176
	.data1 36
	.data1 255
	.data1 1
	.data1 255
	.data1 255
	.data1 0
	.data1 67
	.data1 239
	.data1 255
	.data1 1
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 89
	.data1 236
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 164
	.data1 196
	.data1 144
	.data1 142
	.data1 141
	.data1 255
	.data1 255
	.data1 1
	.data1 255
	.data1 255
	.data1 66
	.data1 98
	.data1 82
	.data1 243
	.data1 245
	.data1 0
	.data1 7
	.data1 0
	.data1 254
	.data1 0
	.data1 254
	.data1 0
	.data1 0
	.data1 0
	.data1 189
	.data1 157
	.data1 0
	.data1 0
	.data1 238
	.data1 240
	.data1 148
	.data1 0
	.data1 0
	.data1 254
	.data1 0
	.data1 140
	.data1 147
	.data1 148
	.data1 215
	.data1 247
	.data1 255
	.data1 255
	.data1 1
	.data1 3
	.data1 0
	.data1 254
	.data1 187
	.data1 255
	.data1 1
	.data1 117
	.data1 149
	.data1 255
	.data1 255
	.data1 0
	.data1 67
	.data1 60
	.data1 59
	.data1 248
	.data1 255
	.data1 1
	.data1 3
	.data1 143
	.data1 200
	.data1 252
	.data1 253
	.data1 255
	.data1 1
	.data1 68
	.data1 240
	.data1 12
	.data1 255
	.data1 1
	.data1 68
	.data1 100
	.data1 255
	.data1 255
	.data1 255
	.data1 198
	.data1 255
	.data1 255
	.data1 198
	.data1 146
	.data1 255
	.data1 1
	.data1 0
	.data1 0
	.data1 238
	.data1 255
	.data1 255
	.data1 0
	.data1 18
	.data1 20
	.data1 0
	.data1 7
	.data1 8
	.data1 0
	.data1 0
	.data1 0
	.data1 254
	.data1 253
	.data1 161
	.data1 154
	.data1 156
	.data1 0
	.data1 0
	.data1 16
	.data1 111
	.data1 113
	.data1 0
	.data1 254
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 164
	.data1 196
	.data1 168
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 254
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 0
	.data1 255
	.data1 248
	.data1 250
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 254
	.data1 138
	.data1 0
	.data1 255
	.data1 0
	.data1 0
	.data1 0
	.data1 238
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 254
	.data1 162
	.data1 194
	.data1 142
	.data1 50
	.data1 107
	.data1 79
	.data1 245
	.data1 98
	.data1 255
	.data1 17
	.data1 15
	.data1 33
	.data1 31
	.data1 220
	.data1 255
	.data1 255
	.data1 89
	.data1 171
	.data1 179
	.data1 164
	.data1 212
	.data1 254
	.data1 22
	.data1 169
	.data1 167
	.data1 255
	.data1 255
	.data1 1
	.data1 255
	.data1 255
	.data1 1
	.data1 255
	.data1 139
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 1
	.data1 2
	.data1 0
	.data1 0
	.data1 255
	.data1 237
	.data1 255
	.data1 1
	.data1 255
	.data1 255
	.data1 255
	.data1 91
	.data1 148
	.data1 120
	.data1 66
	.data1 213
	.data1 161
	.data1 159
	.data1 67
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 254
	.data1 0
	.data1 238
	.data1 239
	.data1 50
	.data1 18
	.data1 70
	.data1 255
	.data1 255
	.data1 66
	.data1 9
	.data1 255
	.data1 255
	.data1 91
	.data1 84
	.data1 82
	.data1 255
	.data1 17
	.data1 0
	.data1 254
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 238
	.data1 240
	.data1 173
	.data1 205
	.data1 210
	.data1 8
	.data1 182
	.data1 140
	.data1 125
	.data1 244
	.data1 8
	.data1 23
	.data1 231
	.data1 224
	.data1 0
	.data1 254
	.data1 162
	.data1 219
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 95
	.data1 0
	.data1 0
	.data1 238
	.data1 255
	.data1 0
	.data1 18
	.data1 16
	.data1 255
	.data1 0
	.data1 18
	.data1 20
	.data1 2
	.data1 255
	.data1 255
	.data1 255
	.data1 223
	.data1 171
	.data1 173
	.data1 0
	.data1 254
	.data1 236
	.data1 238
	.data1 171
	.data1 164
	.data1 0
	.data1 254
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
	.data1 140
	.data1 0
	.data1 16
	.data1 34
	.data1 0
	.data1 0
	.data1 189
	.data1 0
	.data1 254
	.data1 255
	.data1 255
	.data1 255
	.data1 115
	.data1 255
	.data1 203
	.data1 205
	.data1 187
	.data1 185
	.data1 203
	.data1 255
	.data1 255
	.data1 17
	.data1 19
	.data1 208
	.data1 176
	.data1 228
	.data1 229
	.data1 89
	.data1 82
	.data1 0
	.data1 254
	.data1 162
	.data1 155
	.data1 0
	.data1 238
	.data1 237
	.data1 121
	.data1 114
	.data1 112
	.data1 114
	.data1 206
	.data1 34
	.data1 0
	.data1 0
	.data1 0
	.data1 254
	.data1 0
	.data1 254
	.data1 236
	.data1 255
	.data1 255
	.data1 255
	.data1 1
	.data1 255
	.data1 255
	.data1 1
	.data1 2
	.data1 240
	.data1 242
	.data1 240
	.data1 242
	.data1 240
	.data1 2
	.data1 0
	.data1 0
	.data1 254
	.data1 114
	.data1 121
	.data1 119
	.data1 211
	.data1 255
	.data1 1
	.data1 0
	.data1 255
	.data1 237
	.data1 235
	.data1 95
	.data1 38
	.data1 255
	.data1 160
	.data1 192
	.data1 164
	.data1 218
	.data1 136
	.data1 255
	.data1 255
	.data1 1
	.data1 3
	.data1 0
	.data1 7
	.data1 255
	.data1 255
	.data1 1
	.data1 19
	.data1 17
	.data1 19
	.data1 37
	.data1 0
	.data1 254
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 189
	.data1 0
	.data1 0
	.data1 0
	.data1 254
	.data1 187
	.data1 244
	.data1 216
	.data1 0
	.data1 0
	.data1 254
	.data1 114
	.data1 146
	.data1 198
	.data1 255
	.data1 255
	.data1 1
	.data1 93
	.data1 125
	.data1 109
	.data1 127
	.data1 209
	.data1 29
	.data1 255
	.data1 255
	.data1 1
	.data1 141
	.data1 255
	.data1 1
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 198
	.data1 146
	.data1 255
	.data1 255
	.data1 1
	.data1 190
	.data1 183
	.data1 255
	.data1 1
	.data1 0
	.data1 0
	.data1 0
	.data1 254
	.data1 90
	.data1 0
	.data1 0
	.data1 95
	.data1 97
	.data1 237
	.data1 244
	.data1 242
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 248
	.data1 0
	.data1 0
	.data1 0
	.data1 254
	.data1 255
	.data1 1
	.data1 19
	.data1 0
	.data1 0
	.data1 254
	.data1 255
	.data1 1
	.data1 255
	.data1 0
	.data1 67
	.data1 255
	.data1 1
	.data1 255
	.data1 255
	.data1 66
	.data1 255
	.data1 1
	.data1 2
	.data1 69
	.data1 0
	.data1 0
	.data1 0
	.data1 174
	.data1 250
	.data1 89
	.data1 91
	.data1 0
	.data1 0
	.data1 238
	.data1 240
	.data1 100
	.data1 107
	.data1 255
	.data1 1
	.data1 255
	.data1 1
	.data1 19
	.data1 0
	.data1 238
	.data1 240
	.data1 0
	.data1 255
	.data1 0
	.data1 0
	.data1 0
	.data1 254
	.data1 255
	.data1 255
	.data1 17
	.data1 255
	.data1 255
	.data1 1
	.data1 3
	.data1 192
	.data1 199
	.data1 201
	.data1 134
	.data1 127
	.data1 125
	.data1 255
	.data1 255
	.data1 255
	.data1 248
	.data1 255
	.data1 255
	.data1 1
	.data1 190
	.data1 158
	.data1 106
	.data1 104
	.data1 106
	.data1 104
	.data1 196
	.data1 253
	.data1 201
	.data1 0
	.data1 254
	.data1 252
	.data1 88
	.data1 56
	.data1 4
	.data1 242
	.data1 0
	.data1 255
	.data1 139
	.data1 146
	.data1 144
	.data1 162
	.data1 160
	.data1 162
	.data1 160
	.data1 162
	.data1 0
	.data1 0
	.data1 0
	.data1 238
	.data1 236
	.data1 254
	.data1 252
	.data1 0
	.data1 0
	.data1 140
	.data1 147
	.data1 145
	.data1 255
	.data1 223
	.data1 171
	.data1 153
	.data1 154
	.data1 172
	.data1 170
	.data1 152
	.data1 154
	.data1 156
	.data1 138
	.data1 140
	.data1 24
	.data1 0
	.data1 0
	.data1 254
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 1
	.data1 141
	.data1 84
	.data1 56
	.data1 217
	.data1 0
	.data1 254
	.data1 187
	.data1 180
	.data1 178
	.data1 176
	.data1 243
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 83
	.data1 78
	.data1 255
	.data1 223
	.data1 207
	.data1 117
	.data1 255
	.data1 179
	.data1 177
	.data1 195
	.data1 0
	.data1 254
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
	.data1 7
	.data1 255
	.data1 1
	.data1 255
	.data1 255
	.data1 1
	.data1 68
	.data1 0
	.data1 0
	.data1 164
	.data1 0
	.data1 0
	.data1 238
	.data1 237
	.data1 48
	.data1 80
	.data1 28
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 0
	.data1 109
	.data1 17
	.data1 24
	.data1 26
	.data1 0
	.data1 254
	.data1 252
	.data1 255
	.data1 1
	.data1 255
	.data1 255
	.data1 255
	.data1 115
	.data1 58
	.data1 6
	.data1 0
	.data1 0
	.data1 164
	.data1 171
	.data1 173
	.data1 0
	.data1 254
	.data1 252
	.data1 112
	.data1 105
	.data1 104
	.data1 86
	.data1 255
	.data1 1
	.data1 3
	.data1 241
	.data1 243
	.data1 0
	.data1 254
	.data1 162
	.data1 246
	.data1 42
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 255
	.data1 115
	.data1 172
	.data1 120
	.data1 53
	.data1 252
	.data1 255
	.data1 255
	.data1 0
	.data1 116


