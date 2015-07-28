	.text
	.file	"adpcm_coder.ll"
	.globl	main
	.align	2
	.type	main1,@function
main::                                  ## @main
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -16
	c0	stw 12[$r0.1] = $l0.0   ## 4-byte Folded Spill
	c0	stw 8[$r0.1] = $r0.6    ## 4-byte Folded Spill
	c0	mov $r0.58 = 0
	c0	stw 4[$r0.1] = $r0.58
	c0	mov $r0.59 = coder_state
	c0	stw 2[$r0.59] = $r0.58
	c0	stw 0[$r0.59] = $r0.58
	c0	mov $r0.60 = decoder_state
	c0	stw 2[$r0.60] = $r0.58
	c0	stw 0[$r0.60] = $r0.58
	c0	mov $r0.3 = pcmdata
	c0	mov $r0.58 = adpcmdata
	c0	mov $r0.5 = 10
	c0	mov $r0.4 = $r0.58
	c0	mov $r0.6 = $r0.59
	c0	call $l0.0 = adpcm_coder
	c0	ldw $r0.3 = 0[$r0.58]
	c0	ldw $r0.6 = 8[$r0.1]    ## 4-byte Folded Reload
	c0	ldw $l0.0 = 12[$r0.1]   ## 4-byte Folded Reload
	c0	return $r0.1 = $r0.1, 16, $l0.0
$func_end0::
	.size	main, ($func_end0)-main

	.globl	adpcm_coder
	.align	2
	.type	adpcm_coder1,@function
adpcm_coder::                           ## @adpcm_coder
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -104
	c0	stw 100[$r0.1] = $r0.18 ## 4-byte Folded Spill
	c0	stw 96[$r0.1] = $r0.17  ## 4-byte Folded Spill
	c0	stw 92[$r0.1] = $r0.16  ## 4-byte Folded Spill
	c0	stw 88[$r0.1] = $r0.15  ## 4-byte Folded Spill
	c0	stw 84[$r0.1] = $r0.14  ## 4-byte Folded Spill
	c0	stw 80[$r0.1] = $r0.13  ## 4-byte Folded Spill
	c0	stw 76[$r0.1] = $r0.12  ## 4-byte Folded Spill
	c0	stw 72[$r0.1] = $r0.11  ## 4-byte Folded Spill
	c0	stw 68[$r0.1] = $r0.6   ## 4-byte Folded Spill
	c0	stw 64[$r0.1] = $r0.3
	c0	stw 60[$r0.1] = $r0.4
	c0	stw 56[$r0.1] = $r0.5
	c0	stw 52[$r0.1] = $r0.6
	c0	ldw $r0.58 = 60[$r0.1]
	c0	stw 44[$r0.1] = $r0.58
	c0	ldw $r0.58 = 64[$r0.1]
	c0	stw 48[$r0.1] = $r0.58
	c0	ldw $r0.58 = 52[$r0.1]
	c0	ldw $r0.58 = 0[$r0.58]
	c0	stw 20[$r0.1] = $r0.58
	c0	ldw $r0.58 = 52[$r0.1]
	c0	ldw $r0.59 = 2[$r0.58]
	c0	stw 12[$r0.1] = $r0.59
	c0	mov $r0.58 = stepsizeTable
	c0	sh2add $r0.59 = $r0.59, $r0.58
	c0	ldw $r0.59 = 0[$r0.59]
	c0	stw 24[$r0.1] = $r0.59
	c0	mov $r0.59 = 1
	c0	stw 4[$r0.1] = $r0.59
	c0	mov $r0.60 = 0
	c0	mov $r0.61 = 3
	c0	mov $r0.62 = 4
	c0	mov $r0.63 = 32767
	c0	mov $r0.11 = indexTable
	c0	mov $r0.12 = 88
	c0	mov $r0.13 = -32768
	c0	mov $r0.14 = 8
LBB1_1::                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.15 = 56[$r0.1]
	c0	cmplt $b0.0 = $r0.15, 1
	c0	br $b0.0, LBB1_26
	c0	goto LBB1_2
LBB1_2::                                ## %for.body
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.15 = 48[$r0.1]
	c0	add $r0.16 = $r0.15, 2
	c0	stw 48[$r0.1] = $r0.16
	c0	ldw $r0.15 = 0[$r0.15]
	c0	stw 40[$r0.1] = $r0.15
	c0	ldw $r0.16 = 20[$r0.1]
	c0	sub $r0.15 = $r0.15, $r0.16
	c0	stw 28[$r0.1] = $r0.15
	c0	cmplt $b0.0 = $r0.15, 0
	c0	br $b0.0, LBB1_4
	c0	goto LBB1_3
LBB1_3::                                ## %if.then
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	stw 36[$r0.1] = $r0.60
	c0	goto LBB1_5
LBB1_4::                                ## %if.else
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	stw 36[$r0.1] = $r0.14
	c0	ldw $r0.15 = 28[$r0.1]
	c0	sub $r0.15 = $r0.60, $r0.15
	c0	stw 28[$r0.1] = $r0.15
LBB1_5::                                ## %if.end
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	stw 32[$r0.1] = $r0.60
	c0	ldw $r0.15 = 24[$r0.1]
	c0	shr $r0.15 = $r0.15, $r0.61
	c0	stw 16[$r0.1] = $r0.15
	c0	ldw $r0.15 = 24[$r0.1]
	c0	ldw $r0.16 = 28[$r0.1]
	c0	cmplt $b0.0 = $r0.16, $r0.15
	c0	br $b0.0, LBB1_7
	c0	goto LBB1_6
LBB1_6::                                ## %if.then10
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	stw 32[$r0.1] = $r0.62
	c0	ldw $r0.15 = 24[$r0.1]
	c0	ldw $r0.16 = 28[$r0.1]
	c0	sub $r0.15 = $r0.16, $r0.15
	c0	stw 28[$r0.1] = $r0.15
	c0	ldw $r0.15 = 24[$r0.1]
	c0	ldw $r0.16 = 16[$r0.1]
	c0	add $r0.15 = $r0.16, $r0.15
	c0	stw 16[$r0.1] = $r0.15
LBB1_7::                                ## %if.end12
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.15 = 24[$r0.1]
	c0	shr $r0.15 = $r0.15, $r0.59
	c0	stw 24[$r0.1] = $r0.15
	c0	ldw $r0.16 = 28[$r0.1]
	c0	cmplt $b0.0 = $r0.16, $r0.15
	c0	br $b0.0, LBB1_9
	c0	goto LBB1_8
LBB1_8::                                ## %if.then16
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.15 = 32[$r0.1]
	c0	or $r0.15 = $r0.15, 2
	c0	stw 32[$r0.1] = $r0.15
	c0	ldw $r0.15 = 24[$r0.1]
	c0	ldw $r0.16 = 28[$r0.1]
	c0	sub $r0.15 = $r0.16, $r0.15
	c0	stw 28[$r0.1] = $r0.15
	c0	ldw $r0.15 = 24[$r0.1]
	c0	ldw $r0.16 = 16[$r0.1]
	c0	add $r0.15 = $r0.16, $r0.15
	c0	stw 16[$r0.1] = $r0.15
LBB1_9::                                ## %if.end19
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.15 = 24[$r0.1]
	c0	shr $r0.15 = $r0.15, $r0.59
	c0	stw 24[$r0.1] = $r0.15
	c0	ldw $r0.16 = 28[$r0.1]
	c0	cmplt $b0.0 = $r0.16, $r0.15
	c0	br $b0.0, LBB1_11
	c0	goto LBB1_10
LBB1_10::                               ## %if.then23
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.15 = 32[$r0.1]
	c0	or $r0.15 = $r0.15, 1
	c0	stw 32[$r0.1] = $r0.15
	c0	ldw $r0.15 = 24[$r0.1]
	c0	ldw $r0.16 = 16[$r0.1]
	c0	add $r0.15 = $r0.16, $r0.15
	c0	stw 16[$r0.1] = $r0.15
LBB1_11::                               ## %if.end26
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.15 = 36[$r0.1]
	c0	cmpeq $b0.0 = $r0.15, 0
	c0	br $b0.0, LBB1_13
	c0	goto LBB1_12
LBB1_12::                               ## %if.then27
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.15 = 16[$r0.1]
	c0	ldw $r0.16 = 20[$r0.1]
	c0	sub $r0.15 = $r0.16, $r0.15
	c0	stw 20[$r0.1] = $r0.15
	c0	goto LBB1_14
LBB1_13::                               ## %if.else29
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.15 = 16[$r0.1]
	c0	ldw $r0.16 = 20[$r0.1]
	c0	add $r0.15 = $r0.16, $r0.15
	c0	stw 20[$r0.1] = $r0.15
LBB1_14::                               ## %if.end31
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.15 = 20[$r0.1]
	c0	cmplt $b0.0 = $r0.15, 32768
	c0	br $b0.0, LBB1_16
	c0	goto LBB1_15
LBB1_15::                               ## %if.then34
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	stw 20[$r0.1] = $r0.63
	c0	goto LBB1_18
LBB1_16::                               ## %if.else35
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.15 = 20[$r0.1]
	c0	cmpgt $b0.0 = $r0.15, -32769
	c0	br $b0.0, LBB1_18
	c0	goto LBB1_17
LBB1_17::                               ## %if.then38
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	stw 20[$r0.1] = $r0.13
LBB1_18::                               ## %if.end40
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.15 = 36[$r0.1]
	c0	ldw $r0.16 = 32[$r0.1]
	c0	or $r0.15 = $r0.16, $r0.15
	c0	stw 32[$r0.1] = $r0.15
	c0	sh2add $r0.15 = $r0.15, $r0.11
	c0	ldw $r0.15 = 0[$r0.15]
	c0	ldw $r0.16 = 12[$r0.1]
	c0	add $r0.15 = $r0.16, $r0.15
	c0	stw 12[$r0.1] = $r0.15
	c0	cmpgt $b0.0 = $r0.15, -1
	c0	br $b0.0, LBB1_20
	c0	goto LBB1_19
LBB1_19::                               ## %if.then46
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	stw 12[$r0.1] = $r0.60
LBB1_20::                               ## %if.end47
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.15 = 12[$r0.1]
	c0	cmplt $b0.0 = $r0.15, 89
	c0	br $b0.0, LBB1_22
	c0	goto LBB1_21
LBB1_21::                               ## %if.then50
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	stw 12[$r0.1] = $r0.12
LBB1_22::                               ## %if.end51
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.15 = 12[$r0.1]
	c0	sh2add $r0.15 = $r0.15, $r0.58
	c0	ldw $r0.15 = 0[$r0.15]
	c0	stw 24[$r0.1] = $r0.15
	c0	ldw $r0.15 = 4[$r0.1]
	c0	cmpeq $b0.0 = $r0.15, 0
	c0	br $b0.0, LBB1_24
	c0	goto LBB1_23
LBB1_23::                               ## %if.then54
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.15 = 32[$r0.1]
	c0	shl $r0.15 = $r0.15, $r0.62
	c0	and $r0.15 = $r0.15, 240
	c0	stw 8[$r0.1] = $r0.15
	c0	goto LBB1_25
LBB1_24::                               ## %if.else55
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.15 = 44[$r0.1]
	c0	add $r0.16 = $r0.15, 1
	c0	ldw $r0.17 = 8[$r0.1]
	c0	ldw $r0.18 = 32[$r0.1]
	c0	stw 44[$r0.1] = $r0.16
	c0	and $r0.16 = $r0.18, 15
	c0	or $r0.16 = $r0.16, $r0.17
	c0	stw 0[$r0.15] = $r0.16
LBB1_25::                               ## %for.inc
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.15 = 4[$r0.1]
	c0	cmpeq $b0.0 = $r0.15, 0
	c0	mfb $r0.15 = $b0.0
	c0	stw 4[$r0.1] = $r0.15
	c0	ldw $r0.15 = 56[$r0.1]
	c0	add $r0.15 = $r0.15, -1
	c0	stw 56[$r0.1] = $r0.15
	c0	goto LBB1_1
LBB1_26::                               ## %for.end
	c0	ldw $r0.58 = 4[$r0.1]
	c0	cmpne $b0.0 = $r0.58, 0
	c0	br $b0.0, LBB1_28
	c0	goto LBB1_27
LBB1_27::                               ## %if.then63
	c0	ldw $r0.58 = 44[$r0.1]
	c0	add $r0.59 = $r0.58, 1
	c0	ldw $r0.60 = 8[$r0.1]
	c0	stw 44[$r0.1] = $r0.59
	c0	stw 0[$r0.58] = $r0.60
LBB1_28::                               ## %if.end66
	c0	ldw $r0.58 = 52[$r0.1]
	c0	ldw $r0.59 = 20[$r0.1]
	c0	stw 0[$r0.58] = $r0.59
	c0	ldw $r0.58 = 52[$r0.1]
	c0	ldw $r0.59 = 12[$r0.1]
	c0	stw 2[$r0.58] = $r0.59
	c0	ldw $r0.6 = 68[$r0.1]   ## 4-byte Folded Reload
	c0	ldw $r0.11 = 72[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.12 = 76[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.13 = 80[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.14 = 84[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.15 = 88[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.16 = 92[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.17 = 96[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.18 = 100[$r0.1] ## 4-byte Folded Reload
	c0	return $r0.1 = $r0.1, 104, $l0.0
$func_end1::
	.size	adpcm_coder, ($func_end1)-adpcm_coder
.section .data
	.type	pcmdata3,@object        ## @pcmdata
	.data
	.globl	pcmdata
	.align	1
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
	.size	pcmdata, 20

	.type	adpcmdata_ref3,@object  ## @adpcmdata_ref
	.globl	adpcmdata_ref
adpcmdata_ref::
	.data1	0
	.data1	113
	.data1	130	
	.data1	0
	.data1	56	

	.type	pcmdata_2_ref3,@object  ## @pcmdata_2_ref
	.globl	pcmdata_2_ref
	.align	1
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
	.size	pcmdata_2_ref, 20

	.type	coder_state3,@object    ## @coder_state
	.comm	coder_state,4,2
	.type	decoder_state3,@object  ## @decoder_state
	.comm	decoder_state,4,2
	.type	adpcmdata3,@object      ## @adpcmdata
	.comm	adpcmdata,5,1
	.type	stepsizeTable3,@object  ## @stepsizeTable
	.align	2
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
	.size	stepsizeTable, 356

	.type	indexTable3,@object     ## @indexTable
	.align	2
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
	.size	indexTable, 64

	.type	pcmdata_23,@object      ## @pcmdata_2
	.comm	pcmdata_2,20,2
