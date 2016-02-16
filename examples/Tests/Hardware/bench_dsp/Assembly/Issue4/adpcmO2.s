.section .text
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
	c0	stw 36[$r0.1] = $r0.59
;;
	c0	stw 32[$r0.1] = $r0.60
;;
	c0	stw 28[$r0.1] = $r0.61
;;
	c0	stw 24[$r0.1] = $l0.0
	c0	mov $r0.3 = pcmdata
	c0	mov $r0.60 = 10
;;
	c0	mov $r0.61 = adpcmdata
	c0	mov $r0.59 = coder_state
;;
	c0	mov $r0.4 = $r0.61
	c0	mov $r0.5 = $r0.60
	c0	mov $r0.6 = $r0.59
;;
.call adpcm_coder, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = adpcm_coder
;;
	c0	mov $r0.58 = decoder_state
	c0	mov $r0.57 = pcmdata_2
;;
	c0	mov $r0.3 = $r0.61
	c0	mov $r0.4 = $r0.57
	c0	mov $r0.5 = $r0.60
	c0	mov $r0.6 = $r0.58
;;
.call adpcm_decoder, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = adpcm_decoder
;;
	c0	ldhu $r0.12 = 0[$r0.59]
	c0	mov $r0.11 = -3
;;
;;
	c0	cmpne $b0.0 = $r0.12, 32
;;
;;
	c0	br $b0.0, LBB0_6
;;
## BB#1:                                ## %entry
	c0	ldb $r0.12 = 2[$r0.59]
;;
;;
	c0	zxtb $r0.12 = $r0.12
;;
	c0	cmpne $b0.0 = $r0.12, 1
;;
;;
	c0	br $b0.0, LBB0_6
;;
## BB#2:                                ## %if.end
	c0	mov $r0.11 = -2
	c0	ldhu $r0.12 = 0[$r0.58]
;;
;;
	c0	cmpne $b0.0 = $r0.12, 32
;;
;;
	c0	br $b0.0, LBB0_6
;;
## BB#3:                                ## %if.end
	c0	ldb $r0.12 = 2[$r0.58]
;;
;;
	c0	zxtb $r0.12 = $r0.12
;;
	c0	cmpne $b0.0 = $r0.12, 1
;;
;;
	c0	br $b0.0, LBB0_6
;;
## BB#4:                                ## %for.cond.preheader
	c0	mov $r0.12 = pcmdata_2_ref
	c0	mov $r0.11 = 0
	c0	ldhu $r0.13 = 0[$r0.57]
;;
	c0	ldhu $r0.14 = 0[$r0.12]
;;
;;
	c0	cmpne $b0.0 = $r0.13, $r0.14
;;
;;
	c0	br $b0.0, LBB0_6
;;
## BB#5:                                ## %for.inc
	c0	mov $r0.11 = 1
	c0	ldhu $r0.13 = 2[$r0.57]
;;
	c0	ldhu $r0.14 = 2[$r0.12]
;;
;;
	c0	cmpeq $b0.0 = $r0.13, $r0.14
;;
;;
	c0	brf $b0.0, LBB0_6
;;
## BB#8:                                ## %for.inc.1
	c0	mov $r0.11 = 2
	c0	ldhu $r0.13 = 4[$r0.57]
;;
	c0	ldhu $r0.14 = 4[$r0.12]
;;
;;
	c0	cmpne $b0.0 = $r0.13, $r0.14
;;
;;
	c0	br $b0.0, LBB0_6
;;
## BB#9:                                ## %for.inc.2
	c0	mov $r0.11 = 3
	c0	ldhu $r0.13 = 6[$r0.57]
;;
	c0	ldhu $r0.14 = 6[$r0.12]
;;
;;
	c0	cmpne $b0.0 = $r0.13, $r0.14
;;
;;
	c0	br $b0.0, LBB0_6
;;
## BB#10:                               ## %for.inc.3
	c0	mov $r0.11 = 4
	c0	ldhu $r0.13 = 8[$r0.57]
;;
	c0	ldhu $r0.14 = 8[$r0.12]
;;
;;
	c0	cmpne $b0.0 = $r0.13, $r0.14
;;
;;
	c0	br $b0.0, LBB0_6
;;
## BB#11:                               ## %for.inc.4
	c0	mov $r0.11 = 5
	c0	ldhu $r0.13 = 10[$r0.57]
;;
	c0	ldhu $r0.14 = 10[$r0.12]
;;
;;
	c0	cmpne $b0.0 = $r0.13, $r0.14
;;
;;
	c0	br $b0.0, LBB0_6
;;
## BB#12:                               ## %for.inc.5
	c0	mov $r0.11 = 6
	c0	ldhu $r0.13 = 12[$r0.57]
;;
	c0	ldhu $r0.14 = 12[$r0.12]
;;
;;
	c0	cmpne $b0.0 = $r0.13, $r0.14
;;
;;
	c0	br $b0.0, LBB0_6
;;
## BB#13:                               ## %for.inc.6
	c0	mov $r0.11 = 7
	c0	ldhu $r0.13 = 14[$r0.57]
;;
	c0	ldhu $r0.14 = 14[$r0.12]
;;
;;
	c0	cmpne $b0.0 = $r0.13, $r0.14
;;
;;
	c0	br $b0.0, LBB0_6
;;
## BB#14:                               ## %for.inc.7
	c0	mov $r0.11 = 8
	c0	ldhu $r0.13 = 16[$r0.57]
;;
	c0	ldhu $r0.14 = 16[$r0.12]
;;
;;
	c0	cmpne $b0.0 = $r0.13, $r0.14
;;
;;
	c0	br $b0.0, LBB0_6
;;
## BB#15:                               ## %for.inc.8
	c0	mov $r0.11 = -1
	c0	ldhu $r0.13 = 18[$r0.57]
;;
	c0	ldhu $r0.12 = 18[$r0.12]
;;
;;
	c0	cmpeq $b0.0 = $r0.13, $r0.12
;;
;;
	c0	slct $r0.3 = $b0.0, $r0.11, 9
	c0	goto LBB0_7
;;
LBB0_6::                                ## %return
	c0	mov $r0.3 = $r0.11
;;
LBB0_7::                                ## %return
	c0	ldw $l0.0 = 24[$r0.1]
;;
	c0	ldw $r0.61 = 28[$r0.1]
;;
	c0	ldw $r0.60 = 32[$r0.1]
;;
	c0	ldw $r0.59 = 36[$r0.1]
;;
	c0	ldw $r0.58 = 40[$r0.1]
;;
.return ret($r0.3:s32)
	c0	ldw $r0.57 = 44[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @adpcm_coder
adpcm_coder::
## BB#0:                                ## %entry
	c0	ldb $r0.11 = 2[$r0.6]
;;
	c0	ldh $r0.14 = 0[$r0.6]
	c0	cmplt $b0.0 = $r0.5, 1
;;
;;
	c0	br $b0.0, LBB1_10
;;
## BB#1:                                ## %for.body.lr.ph
	c0	mov $r0.12 = stepsizeTable
;;
	c0	sh2add $r0.13 = $r0.11, $r0.12
;;
	c0	ldw $r0.27 = 0[$r0.13]
	c0	add $r0.13 = $r0.5, 1
	c0	mov $r0.15 = 1
	c0	mov $r0.16 = 31
;;
	c0	mov $r0.17 = 0
	c0	mov $r0.18 = 3
	c0	mov $r0.19 = 2
;;
	c0	mov $r0.20 = indexTable
	c0	mov $r0.21 = 32767
;;
	c0	mov $r0.23 = 4
	c0	mov $r0.26 = $r0.15
	c0	mov $r0.24 = $r0.4
	c0	mov $r0.25 = $r0.3
;;
LBB1_2::                                ## %for.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldh $r0.28 = 0[$r0.25]
;;
;;
	c0	sub $r0.28 = $r0.28, $r0.14
;;
	c0	shr $r0.29 = $r0.28, $r0.16
;;
	c0	add $r0.30 = $r0.28, $r0.29
	c0	shr $r0.32 = $r0.27, $r0.18
	c0	shr $r0.33 = $r0.27, $r0.15
;;
	c0	xor $r0.34 = $r0.30, $r0.29
	c0	and $r0.30 = $r0.29, 8
;;
	c0	cmplt $b0.0 = $r0.34, $r0.27
;;
;;
	c0	slct $r0.35 = $b0.0, $r0.17, $r0.27
	c0	slct $r0.31 = $b0.0, $r0.17, 4
;;
	c0	add $r0.29 = $r0.35, $r0.32
	c0	sub $r0.32 = $r0.34, $r0.35
;;
	c0	cmplt $b0.0 = $r0.32, $r0.33
;;
;;
	c0	br $b0.0, LBB1_4
;;
## BB#3:                                ## %if.then16
                                        ##   in Loop: Header=BB1_2 Depth=1
	c0	or $r0.31 = $r0.31, 2
	c0	add $r0.29 = $r0.29, $r0.33
	c0	sub $r0.32 = $r0.32, $r0.33
;;
LBB1_4::                                ## %if.end19
                                        ##   in Loop: Header=BB1_2 Depth=1
	c0	shr $r0.33 = $r0.27, $r0.19
;;
	c0	cmpge $b0.0 = $r0.32, $r0.33
	c0	or $r0.27 = $r0.31, $r0.30
;;
;;
	c0	mfb $r0.30 = $b0.0
	c0	cmplt $b0.0 = $r0.32, $r0.33
;;
	c0	or $r0.27 = $r0.27, $r0.30
;;
	c0	sh2add $r0.30 = $r0.27, $r0.20
	c0	slct $r0.31 = $b0.0, $r0.17, $r0.33
;;
	c0	ldw $r0.30 = 0[$r0.30]
	c0	add $r0.29 = $r0.31, $r0.29
	c0	cmpgt $b0.0 = $r0.28, -1
;;
	c0	sub $r0.28 = $r0.17, $r0.29
;;
	c0	add $r0.11 = $r0.30, $r0.11
	c0	slct $r0.28 = $b0.0, $r0.29, $r0.28
;;
	c0	max $r0.11 = $r0.11, 0
	c0	add $r0.14 = $r0.28, $r0.14
;;
	c0	min $r0.11 = $r0.11, 88
	c0	cmpeq $b0.0 = $r0.26, 0
;;
	c0	sh2add $r0.26 = $r0.11, $r0.12
	c0	cmpgt $b0.1 = $r0.14, 32767
;;
	c0	max $r0.14 = $r0.14, -32768
;;
	c0	br $b0.0, LBB1_6
;;
## BB#5:                                ## %if.then54
                                        ##   in Loop: Header=BB1_2 Depth=1
	c0	shl $r0.22 = $r0.27, $r0.23
;;
	c0	zxtb $r0.22 = $r0.22
	c0	goto LBB1_7
;;
LBB1_6::                                ## %if.else55
                                        ##   in Loop: Header=BB1_2 Depth=1
	c0	and $r0.27 = $r0.27, 15
;;
	c0	or $r0.27 = $r0.27, $r0.22
	c0	add $r0.28 = $r0.24, 1
;;
	c0	stb 0[$r0.24] = $r0.27
	c0	mov $r0.24 = $r0.28
;;
LBB1_7::                                ## %if.end60
                                        ##   in Loop: Header=BB1_2 Depth=1
	c0	add $r0.25 = $r0.25, 2
	c0	slct $r0.14 = $b0.1, $r0.21, $r0.14
	c0	ldw $r0.27 = 0[$r0.26]
	c0	add $r0.13 = $r0.13, -1
;;
	c0	mfb $r0.26 = $b0.0
	c0	cmpgt $b0.1 = $r0.13, 1
;;
;;
	c0	br $b0.1, LBB1_2
;;
## BB#8:                                ## %for.end
	c0	br $b0.0, LBB1_10
;;
## BB#9:                                ## %if.then63
	c0	stb 0[$r0.24] = $r0.22
;;
LBB1_10::                               ## %if.end66
	c0	sth 0[$r0.6] = $r0.14
;;
.return ret($r0.3:s32)
	c0	stb 2[$r0.6] = $r0.11
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @adpcm_decoder
adpcm_decoder::
## BB#0:                                ## %entry
	c0	ldb $r0.11 = 2[$r0.6]
;;
	c0	ldh $r0.12 = 0[$r0.6]
	c0	cmplt $b0.0 = $r0.5, 1
;;
;;
	c0	br $b0.0, LBB2_5
;;
## BB#1:                                ## %for.body.lr.ph
	c0	mov $r0.13 = stepsizeTable
;;
	c0	sh2add $r0.14 = $r0.11, $r0.13
;;
	c0	ldw $r0.25 = 0[$r0.14]
	c0	add $r0.14 = $r0.5, 1
	c0	mov $r0.15 = 0
	c0	mov $r0.16 = 29
;;
	c0	mov $r0.17 = 30
	c0	mov $r0.18 = 1
	c0	mov $r0.19 = 3
	c0	mov $r0.20 = 31
;;
	c0	mov $r0.21 = 2
	c0	mov $r0.22 = indexTable
;;
	c0	mov $r0.23 = 32767
	c0	mov $r0.24 = 4
	c0	mov $r0.27 = $r0.15
;;
	c0	mov $r0.28 = $r0.4
	c0	mov $r0.26 = $r0.3
;;
LBB2_2::                                ## %for.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	cmpne $b0.0 = $r0.27, 0
	c0	mov $r0.30 = $r0.29
;;
;;
	c0	br $b0.0, LBB2_4
;;
## BB#3:                                ## %if.else
                                        ##   in Loop: Header=BB2_2 Depth=1
	c0	ldb $r0.30 = 0[$r0.26]
	c0	add $r0.26 = $r0.26, 1
;;
;;
	c0	shru $r0.29 = $r0.30, $r0.24
;;
LBB2_4::                                ## %if.end
                                        ##   in Loop: Header=BB2_2 Depth=1
	c0	shl $r0.31 = $r0.29, $r0.16
	c0	shl $r0.32 = $r0.29, $r0.17
	c0	shr $r0.33 = $r0.25, $r0.18
	c0	shr $r0.34 = $r0.25, $r0.19
;;
	c0	and $r0.35 = $r0.29, 15
	c0	shr $r0.31 = $r0.31, $r0.20
	c0	shl $r0.36 = $r0.29, $r0.20
	c0	shr $r0.32 = $r0.32, $r0.20
;;
	c0	and $r0.31 = $r0.31, $r0.25
	c0	and $r0.32 = $r0.32, $r0.33
	c0	shr $r0.33 = $r0.36, $r0.20
	c0	shr $r0.25 = $r0.25, $r0.21
;;
	c0	add $r0.31 = $r0.31, $r0.34
	c0	and $r0.25 = $r0.33, $r0.25
	c0	and $r0.29 = $r0.29, 8
	c0	sh2add $r0.33 = $r0.35, $r0.22
;;
	c0	add $r0.31 = $r0.31, $r0.32
	c0	cmpeq $b0.0 = $r0.29, 0
;;
	c0	add $r0.25 = $r0.31, $r0.25
	c0	ldw $r0.29 = 0[$r0.33]
;;
	c0	sub $r0.31 = $r0.15, $r0.25
;;
	c0	add $r0.11 = $r0.29, $r0.11
	c0	slct $r0.25 = $b0.0, $r0.25, $r0.31
;;
	c0	max $r0.11 = $r0.11, 0
	c0	add $r0.12 = $r0.25, $r0.12
;;
	c0	min $r0.11 = $r0.11, 88
	c0	cmpeq $b0.0 = $r0.27, 0
;;
	c0	sh2add $r0.25 = $r0.11, $r0.13
	c0	cmpgt $b0.1 = $r0.12, 32767
;;
	c0	ldw $r0.25 = 0[$r0.25]
	c0	max $r0.12 = $r0.12, -32768
	c0	add $r0.14 = $r0.14, -1
;;
	c0	slct $r0.12 = $b0.1, $r0.23, $r0.12
	c0	mfb $r0.27 = $b0.0
	c0	cmpgt $b0.0 = $r0.14, 1
	c0	add $r0.31 = $r0.28, 2
;;
	c0	sth 0[$r0.28] = $r0.12
	c0	mov $r0.29 = $r0.30
	c0	mov $r0.28 = $r0.31
;;
	c0	br $b0.0, LBB2_2
;;
LBB2_5::                                ## %for.end
	c0	sth 0[$r0.6] = $r0.12
;;
.return ret($r0.3:s32)
	c0	stb 2[$r0.6] = $r0.11
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .data
	.align	2                       ## @pcmdata
pcmdata::
	.data2	0                       ## 0x0
	.data2	0                       ## 0x0
	.data2	16                      ## 0x10
	.data2	16                      ## 0x10
	.data2	16                      ## 0x10
	.data2	24                      ## 0x18
	.data2	24                      ## 0x18
	.data2	24                      ## 0x18
	.data2	32                      ## 0x20
	.data2	32                      ## 0x20

adpcmdata_ref::                         ## @adpcmdata_ref
	.data1 0
	.data1 113
	.data1 130
	.data1 0
	.data1 56
.skip 3

	.align	2                       ## @pcmdata_2_ref
pcmdata_2_ref::
	.data2	0                       ## 0x0
	.data2	0                       ## 0x0
	.data2	11                      ## 0xb
	.data2	17                      ## 0x11
	.data2	16                      ## 0x10
	.data2	23                      ## 0x17
	.data2	24                      ## 0x18
	.data2	25                      ## 0x19
	.data2	33                      ## 0x21
	.data2	32                      ## 0x20

	.comm	adpcmdata,5,1           ## @adpcmdata
	.comm	coder_state,4,2         ## @coder_state
	.comm	pcmdata_2,20,2          ## @pcmdata_2
	.comm	decoder_state,4,2       ## @decoder_state
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


