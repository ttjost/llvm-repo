	.text
	.file	"adpcm_wrongO3.ll"
	.globl	main
	.align	2
	.type	main,@function
main::                                  ## @main
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -120
	c0	stw 116[$r0.1] = $l0.0  ## 4-byte Folded Spill
	c0	stw 112[$r0.1] = $r0.38 ## 4-byte Folded Spill
	c0	stw 108[$r0.1] = $r0.37 ## 4-byte Folded Spill
	c0	stw 104[$r0.1] = $r0.36 ## 4-byte Folded Spill
	c0	stw 100[$r0.1] = $r0.35 ## 4-byte Folded Spill
	c0	stw 96[$r0.1] = $r0.34  ## 4-byte Folded Spill
	c0	stw 92[$r0.1] = $r0.33  ## 4-byte Folded Spill
	c0	stw 88[$r0.1] = $r0.32  ## 4-byte Folded Spill
	c0	stw 84[$r0.1] = $r0.31  ## 4-byte Folded Spill
	c0	stw 80[$r0.1] = $r0.30  ## 4-byte Folded Spill
	c0	stw 76[$r0.1] = $r0.29  ## 4-byte Folded Spill
	c0	stw 72[$r0.1] = $r0.28  ## 4-byte Folded Spill
	c0	stw 68[$r0.1] = $r0.27  ## 4-byte Folded Spill
	c0	stw 64[$r0.1] = $r0.26  ## 4-byte Folded Spill
	c0	stw 60[$r0.1] = $r0.25  ## 4-byte Folded Spill
	c0	stw 56[$r0.1] = $r0.24  ## 4-byte Folded Spill
	c0	stw 52[$r0.1] = $r0.23  ## 4-byte Folded Spill
	c0	stw 48[$r0.1] = $r0.22  ## 4-byte Folded Spill
	c0	stw 44[$r0.1] = $r0.21  ## 4-byte Folded Spill
	c0	stw 40[$r0.1] = $r0.20  ## 4-byte Folded Spill
	c0	stw 36[$r0.1] = $r0.19  ## 4-byte Folded Spill
	c0	stw 32[$r0.1] = $r0.18  ## 4-byte Folded Spill
	c0	stw 28[$r0.1] = $r0.17  ## 4-byte Folded Spill
	c0	stw 24[$r0.1] = $r0.16  ## 4-byte Folded Spill
	c0	stw 20[$r0.1] = $r0.15  ## 4-byte Folded Spill
	c0	stw 16[$r0.1] = $r0.14  ## 4-byte Folded Spill
	c0	stw 12[$r0.1] = $r0.13  ## 4-byte Folded Spill
	c0	stw 8[$r0.1] = $r0.12   ## 4-byte Folded Spill
	c0	stw 4[$r0.1] = $r0.11   ## 4-byte Folded Spill
	c0	stw 0[$r0.1] = $r0.6    ## 4-byte Folded Spill
	c0	mov $r0.12 = 0
	c0	mov $r0.11 = coder_state
	c0	mov $r0.13 = decoder_state
	c0	mov $r0.14 = 10
	c0	mov $r0.15 = pcmdata
	c0	mov $r0.16 = adpcmdata
	c0	mov $r0.17 = stepsizeTable
	c0	mov $r0.18 = 11
	c0	mov $r0.19 = pcmdata_2
	c0	mov $r0.20 = 29
	c0	mov $r0.21 = 30
	c0	mov $r0.22 = 1
	c0	mov $r0.23 = 3
	c0	mov $r0.24 = 31
	c0	mov $r0.25 = 2
	c0	mov $r0.26 = indexTable
	c0	mov $r0.27 = 32767
	c0	mov $r0.28 = 4
	c0	mov $r0.29 = $r0.12
LBB0_1::                                ## %for.body
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_2 Depth 2
	c0	stb 2[$r0.11] = $r0.12
	c0	sth 0[$r0.11] = $r0.12
	c0	stb 2[$r0.13] = $r0.12
	c0	sth 0[$r0.13] = $r0.12
	c0	mov $r0.3 = $r0.15
	c0	mov $r0.4 = $r0.16
	c0	mov $r0.5 = $r0.14
	c0	mov $r0.6 = $r0.11
	c0	call $l0.0 = adpcm_coder
	c0	ldb $r0.58 = 2[$r0.13]
	c0	sh2add $r0.60 = $r0.58, $r0.17
	c0	ldh $r0.59 = 0[$r0.13]
	c0	ldw $r0.30 = 0[$r0.60]
	c0	mov $r0.60 = $r0.18
	c0	mov $r0.62 = $r0.12
                                        ## implicit-def: Reg32
	c0	mov $r0.63 = $r0.19
	c0	mov $r0.61 = $r0.16
LBB0_2::                                ## %for.body.i
                                        ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	cmpne $b0.0 = $r0.62, 0
	c0	mov $r0.31 = $r0.32
	c0	br $b0.0, LBB0_4
	c0	goto LBB0_3
LBB0_3::                                ## %if.else.i
                                        ##   in Loop: Header=BB0_2 Depth=2
	c0	ldb $r0.31 = 0[$r0.61]
	c0	add $r0.61 = $r0.61, 1
	c0	shru $r0.32 = $r0.31, $r0.28
LBB0_4::                                ## %if.end.i
                                        ##   in Loop: Header=BB0_2 Depth=2
	c0	shl $r0.33 = $r0.32, $r0.20
	c0	shl $r0.34 = $r0.32, $r0.21
	c0	shr $r0.35 = $r0.30, $r0.22
	c0	shr $r0.36 = $r0.30, $r0.23
	c0	shr $r0.33 = $r0.33, $r0.24
	c0	shr $r0.34 = $r0.34, $r0.24
	c0	shl $r0.37 = $r0.32, $r0.24
	c0	shr $r0.38 = $r0.30, $r0.25
	c0	and $r0.30 = $r0.33, $r0.30
	c0	shr $r0.33 = $r0.37, $r0.24
	c0	and $r0.34 = $r0.34, $r0.35
	c0	and $r0.35 = $r0.32, 15
	c0	add $r0.30 = $r0.30, $r0.36
	c0	and $r0.33 = $r0.33, $r0.38
	c0	and $r0.32 = $r0.32, 8
	c0	sh2add $r0.35 = $r0.35, $r0.26
	c0	add $r0.30 = $r0.30, $r0.34
	c0	add $r0.30 = $r0.30, $r0.33
	c0	ldw $r0.33 = 0[$r0.35]
	c0	cmpeq $b0.0 = $r0.32, 0
	c0	sub $r0.32 = $r0.12, $r0.30
	c0	add $r0.58 = $r0.33, $r0.58
	c0	slct $r0.30 = $b0.0, $r0.30, $r0.32
	c0	max $r0.58 = $r0.58, 0
	c0	cmpeq $b0.0 = $r0.62, 0
	c0	add $r0.59 = $r0.30, $r0.59
	c0	min $r0.58 = $r0.58, 88
	c0	sh2add $r0.62 = $r0.58, $r0.17
	c0	cmpgt $b0.1 = $r0.59, 32767
	c0	max $r0.59 = $r0.59, -32768
	c0	slct $r0.59 = $b0.1, $r0.27, $r0.59
	c0	add $r0.33 = $r0.63, 2
	c0	ldw $r0.30 = 0[$r0.62]
	c0	mfb $r0.62 = $b0.0
	c0	sth 0[$r0.63] = $r0.59
	c0	add $r0.60 = $r0.60, -1
	c0	cmpgt $b0.0 = $r0.60, 1
	c0	mov $r0.32 = $r0.31
	c0	mov $r0.63 = $r0.33
	c0	br $b0.0, LBB0_2
	c0	goto LBB0_5
LBB0_5::                                ## %adpcm_decoder.exit
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	add $r0.29 = $r0.29, 1
	c0	sth 0[$r0.13] = $r0.59
	c0	stb 2[$r0.13] = $r0.58
	c0	cmpne $b0.0 = $r0.29, 1000
	c0	br $b0.0, LBB0_1
	c0	goto LBB0_6
LBB0_6::                                ## %for.end
	c0	mov $r0.60 = -3
	c0	ldhu $r0.61 = 0[$r0.11]
	c0	cmpne $b0.0 = $r0.61, 32
	c0	br $b0.0, LBB0_12
	c0	goto LBB0_7
LBB0_7::                                ## %for.end
	c0	ldbu $r0.61 = 2[$r0.11]
	c0	and $r0.61 = $r0.61, 255
	c0	cmpne $b0.0 = $r0.61, 1
	c0	br $b0.0, LBB0_12
	c0	goto LBB0_8
LBB0_8::                                ## %if.end
	c0	and $r0.59 = $r0.59, 65535
	c0	mov $r0.60 = -2
	c0	cmpne $b0.0 = $r0.59, 32
	c0	br $b0.0, LBB0_12
	c0	goto LBB0_9
LBB0_9::                                ## %if.end
	c0	and $r0.58 = $r0.58, 255
	c0	cmpne $b0.0 = $r0.58, 1
	c0	br $b0.0, LBB0_12
	c0	goto LBB0_10
LBB0_10::                               ## %for.cond15.preheader
	c0	mov $r0.58 = pcmdata_2_ref
	c0	mov $r0.59 = pcmdata_2
	c0	mov $r0.60 = 0
	c0	ldhu $r0.61 = 0[$r0.59]
	c0	ldhu $r0.62 = 0[$r0.58]
	c0	cmpne $b0.0 = $r0.61, $r0.62
	c0	br $b0.0, LBB0_12
	c0	goto LBB0_11
LBB0_11::                               ## %for.inc26
	c0	mov $r0.60 = 101
	c0	ldhu $r0.61 = 2[$r0.59]
	c0	ldhu $r0.62 = 2[$r0.58]
	c0	cmpeq $b0.0 = $r0.61, $r0.62
	c0	br $b0.0, LBB0_14
	c0	goto LBB0_12
LBB0_14::                               ## %for.inc26.1
	c0	mov $r0.60 = 202
	c0	ldhu $r0.61 = 4[$r0.59]
	c0	ldhu $r0.62 = 4[$r0.58]
	c0	cmpne $b0.0 = $r0.61, $r0.62
	c0	br $b0.0, LBB0_12
	c0	goto LBB0_15
LBB0_15::                               ## %for.inc26.2
	c0	mov $r0.60 = 303
	c0	ldhu $r0.61 = 6[$r0.59]
	c0	ldhu $r0.62 = 6[$r0.58]
	c0	cmpne $b0.0 = $r0.61, $r0.62
	c0	br $b0.0, LBB0_12
	c0	goto LBB0_16
LBB0_16::                               ## %for.inc26.3
	c0	mov $r0.60 = 404
	c0	ldhu $r0.61 = 8[$r0.59]
	c0	ldhu $r0.62 = 8[$r0.58]
	c0	cmpne $b0.0 = $r0.61, $r0.62
	c0	br $b0.0, LBB0_12
	c0	goto LBB0_17
LBB0_17::                               ## %for.inc26.4
	c0	mov $r0.60 = 505
	c0	ldhu $r0.61 = 10[$r0.59]
	c0	ldhu $r0.62 = 10[$r0.58]
	c0	cmpne $b0.0 = $r0.61, $r0.62
	c0	br $b0.0, LBB0_12
	c0	goto LBB0_18
LBB0_18::                               ## %for.inc26.5
	c0	mov $r0.60 = 606
	c0	ldhu $r0.61 = 12[$r0.59]
	c0	ldhu $r0.62 = 12[$r0.58]
	c0	cmpne $b0.0 = $r0.61, $r0.62
	c0	br $b0.0, LBB0_12
	c0	goto LBB0_19
LBB0_19::                               ## %for.inc26.6
	c0	mov $r0.60 = 707
	c0	ldhu $r0.61 = 14[$r0.59]
	c0	ldhu $r0.62 = 14[$r0.58]
	c0	cmpne $b0.0 = $r0.61, $r0.62
	c0	br $b0.0, LBB0_12
	c0	goto LBB0_20
LBB0_20::                               ## %for.inc26.7
	c0	mov $r0.60 = 808
	c0	ldhu $r0.61 = 16[$r0.59]
	c0	ldhu $r0.62 = 16[$r0.58]
	c0	cmpne $b0.0 = $r0.61, $r0.62
	c0	br $b0.0, LBB0_12
	c0	goto LBB0_21
LBB0_21::                               ## %for.inc26.8
	c0	mov $r0.60 = -1
	c0	ldhu $r0.59 = 18[$r0.59]
	c0	ldhu $r0.58 = 18[$r0.58]
	c0	cmpeq $b0.0 = $r0.59, $r0.58
	c0	slct $r0.3 = $b0.0, $r0.60, 909
	c0	goto LBB0_13
LBB0_12::                               ## %return
	c0	mov $r0.3 = $r0.60
LBB0_13::                               ## %return
	c0	ldw $r0.6 = 0[$r0.1]    ## 4-byte Folded Reload
	c0	ldw $r0.11 = 4[$r0.1]   ## 4-byte Folded Reload
	c0	ldw $r0.12 = 8[$r0.1]   ## 4-byte Folded Reload
	c0	ldw $r0.13 = 12[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.14 = 16[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.15 = 20[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.16 = 24[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.17 = 28[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.18 = 32[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.19 = 36[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.20 = 40[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.21 = 44[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.22 = 48[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.23 = 52[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.24 = 56[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.25 = 60[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.26 = 64[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.27 = 68[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.28 = 72[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.29 = 76[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.30 = 80[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.31 = 84[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.32 = 88[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.33 = 92[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.34 = 96[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.35 = 100[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.36 = 104[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.37 = 108[$r0.1] ## 4-byte Folded Reload
	c0	ldw $r0.38 = 112[$r0.1] ## 4-byte Folded Reload
	c0	ldw $l0.0 = 116[$r0.1]  ## 4-byte Folded Reload
	c0	return $r0.1 = $r0.1, 120, $l0.0
$func_end0::
	.size	main, ($func_end0)-main

	.globl	adpcm_coder
	.align	2
	.type	adpcm_coder,@function
adpcm_coder::                           ## @adpcm_coder
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -80
	c0	stw 76[$r0.1] = $r0.29  ## 4-byte Folded Spill
	c0	stw 72[$r0.1] = $r0.28  ## 4-byte Folded Spill
	c0	stw 68[$r0.1] = $r0.27  ## 4-byte Folded Spill
	c0	stw 64[$r0.1] = $r0.26  ## 4-byte Folded Spill
	c0	stw 60[$r0.1] = $r0.25  ## 4-byte Folded Spill
	c0	stw 56[$r0.1] = $r0.24  ## 4-byte Folded Spill
	c0	stw 52[$r0.1] = $r0.23  ## 4-byte Folded Spill
	c0	stw 48[$r0.1] = $r0.22  ## 4-byte Folded Spill
	c0	stw 44[$r0.1] = $r0.21  ## 4-byte Folded Spill
	c0	stw 40[$r0.1] = $r0.20  ## 4-byte Folded Spill
	c0	stw 36[$r0.1] = $r0.19  ## 4-byte Folded Spill
	c0	stw 32[$r0.1] = $r0.18  ## 4-byte Folded Spill
	c0	stw 28[$r0.1] = $r0.17  ## 4-byte Folded Spill
	c0	stw 24[$r0.1] = $r0.16  ## 4-byte Folded Spill
	c0	stw 20[$r0.1] = $r0.15  ## 4-byte Folded Spill
	c0	stw 16[$r0.1] = $r0.14  ## 4-byte Folded Spill
	c0	stw 12[$r0.1] = $r0.13  ## 4-byte Folded Spill
	c0	stw 8[$r0.1] = $r0.12   ## 4-byte Folded Spill
	c0	stw 4[$r0.1] = $r0.11   ## 4-byte Folded Spill
	c0	stw 0[$r0.1] = $r0.6    ## 4-byte Folded Spill
	c0	ldb $r0.58 = 2[$r0.6]
	c0	ldh $r0.61 = 0[$r0.6]
	c0	cmplt $b0.0 = $r0.5, 1
	c0	br $b0.0, LBB1_10
	c0	goto LBB1_1
LBB1_1::                                ## %for.body.lr.ph
	c0	mov $r0.59 = stepsizeTable
	c0	sh2add $r0.60 = $r0.58, $r0.59
	c0	ldw $r0.21 = 0[$r0.60]
	c0	add $r0.60 = $r0.5, 1
	c0	mov $r0.62 = 1
	c0	mov $r0.63 = 31
	c0	mov $r0.11 = 3
	c0	mov $r0.12 = 0
	c0	mov $r0.13 = 2
	c0	mov $r0.14 = indexTable
	c0	mov $r0.15 = 32767
	c0	mov $r0.17 = 4
	c0	mov $r0.20 = $r0.62
                                        ## implicit-def: Reg16
	c0	mov $r0.18 = $r0.4
	c0	mov $r0.19 = $r0.3
LBB1_2::                                ## %for.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldh $r0.22 = 0[$r0.19]
	c0	sub $r0.22 = $r0.22, $r0.61
	c0	shr $r0.23 = $r0.22, $r0.63
	c0	add $r0.25 = $r0.22, $r0.23
	c0	shr $r0.26 = $r0.21, $r0.11
	c0	shr $r0.27 = $r0.21, $r0.62
	c0	and $r0.24 = $r0.23, 8
	c0	xor $r0.28 = $r0.25, $r0.23
	c0	cmplt $b0.0 = $r0.28, $r0.21
	c0	slct $r0.29 = $b0.0, $r0.12, $r0.21
	c0	slct $r0.25 = $b0.0, $r0.12, 4
	c0	add $r0.23 = $r0.29, $r0.26
	c0	sub $r0.26 = $r0.28, $r0.29
	c0	cmplt $b0.0 = $r0.26, $r0.27
	c0	br $b0.0, LBB1_4
	c0	goto LBB1_3
LBB1_3::                                ## %if.then16
                                        ##   in Loop: Header=BB1_2 Depth=1
	c0	or $r0.25 = $r0.25, 2
	c0	add $r0.23 = $r0.23, $r0.27
	c0	sub $r0.26 = $r0.26, $r0.27
LBB1_4::                                ## %if.end19
                                        ##   in Loop: Header=BB1_2 Depth=1
	c0	shr $r0.21 = $r0.21, $r0.13
	c0	cmpge $b0.0 = $r0.26, $r0.21
	c0	or $r0.24 = $r0.25, $r0.24
	c0	mfb $r0.25 = $b0.0
	c0	cmplt $b0.0 = $r0.26, $r0.21
	c0	or $r0.24 = $r0.24, $r0.25
	c0	slct $r0.21 = $b0.0, $r0.12, $r0.21
	c0	sh2add $r0.25 = $r0.24, $r0.14
	c0	add $r0.21 = $r0.21, $r0.23
	c0	sub $r0.23 = $r0.12, $r0.21
	c0	ldw $r0.25 = 0[$r0.25]
	c0	add $r0.58 = $r0.25, $r0.58
	c0	cmpgt $b0.0 = $r0.22, -1
	c0	slct $r0.21 = $b0.0, $r0.21, $r0.23
	c0	max $r0.58 = $r0.58, 0
	c0	add $r0.61 = $r0.21, $r0.61
	c0	min $r0.58 = $r0.58, 88
	c0	sh2add $r0.21 = $r0.58, $r0.59
	c0	cmpgt $b0.1 = $r0.61, 32767
	c0	max $r0.61 = $r0.61, -32768
	c0	cmpeq $b0.0 = $r0.20, 0
	c0	br $b0.0, LBB1_6
	c0	goto LBB1_5
LBB1_5::                                ## %if.then54
                                        ##   in Loop: Header=BB1_2 Depth=1
	c0	shl $r0.16 = $r0.24, $r0.17
	c0	and $r0.16 = $r0.16, 240
	c0	goto LBB1_7
LBB1_6::                                ## %if.else55
                                        ##   in Loop: Header=BB1_2 Depth=1
	c0	and $r0.20 = $r0.24, 15
	c0	or $r0.20 = $r0.20, $r0.16
	c0	add $r0.22 = $r0.18, 1
	c0	stb 0[$r0.18] = $r0.20
	c0	mov $r0.18 = $r0.22
LBB1_7::                                ## %if.end60
                                        ##   in Loop: Header=BB1_2 Depth=1
	c0	add $r0.19 = $r0.19, 2
	c0	slct $r0.61 = $b0.1, $r0.15, $r0.61
	c0	ldw $r0.21 = 0[$r0.21]
	c0	add $r0.60 = $r0.60, -1
	c0	mfb $r0.20 = $b0.0
	c0	cmpgt $b0.1 = $r0.60, 1
	c0	br $b0.1, LBB1_2
	c0	goto LBB1_8
LBB1_8::                                ## %for.end
	c0	br $b0.0, LBB1_10
	c0	goto LBB1_9
LBB1_9::                                ## %if.then63
	c0	stb 0[$r0.18] = $r0.16
LBB1_10::                               ## %if.end66
	c0	sth 0[$r0.6] = $r0.61
	c0	stb 2[$r0.6] = $r0.58
	c0	ldw $r0.6 = 0[$r0.1]    ## 4-byte Folded Reload
	c0	ldw $r0.11 = 4[$r0.1]   ## 4-byte Folded Reload
	c0	ldw $r0.12 = 8[$r0.1]   ## 4-byte Folded Reload
	c0	ldw $r0.13 = 12[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.14 = 16[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.15 = 20[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.16 = 24[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.17 = 28[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.18 = 32[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.19 = 36[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.20 = 40[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.21 = 44[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.22 = 48[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.23 = 52[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.24 = 56[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.25 = 60[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.26 = 64[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.27 = 68[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.28 = 72[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.29 = 76[$r0.1]  ## 4-byte Folded Reload
	c0	return $r0.1 = $r0.1, 80, $l0.0
$func_end1::
	.size	adpcm_coder, ($func_end1)-adpcm_coder

	.globl	adpcm_decoder
	.align	2
	.type	adpcm_decoder,@function
adpcm_decoder::                         ## @adpcm_decoder
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -88
	c0	stw 84[$r0.1] = $r0.30  ## 4-byte Folded Spill
	c0	stw 80[$r0.1] = $r0.29  ## 4-byte Folded Spill
	c0	stw 76[$r0.1] = $r0.28  ## 4-byte Folded Spill
	c0	stw 72[$r0.1] = $r0.27  ## 4-byte Folded Spill
	c0	stw 68[$r0.1] = $r0.26  ## 4-byte Folded Spill
	c0	stw 64[$r0.1] = $r0.25  ## 4-byte Folded Spill
	c0	stw 60[$r0.1] = $r0.24  ## 4-byte Folded Spill
	c0	stw 56[$r0.1] = $r0.23  ## 4-byte Folded Spill
	c0	stw 52[$r0.1] = $r0.22  ## 4-byte Folded Spill
	c0	stw 48[$r0.1] = $r0.21  ## 4-byte Folded Spill
	c0	stw 44[$r0.1] = $r0.20  ## 4-byte Folded Spill
	c0	stw 40[$r0.1] = $r0.19  ## 4-byte Folded Spill
	c0	stw 36[$r0.1] = $r0.18  ## 4-byte Folded Spill
	c0	stw 32[$r0.1] = $r0.17  ## 4-byte Folded Spill
	c0	stw 28[$r0.1] = $r0.16  ## 4-byte Folded Spill
	c0	stw 24[$r0.1] = $r0.15  ## 4-byte Folded Spill
	c0	stw 20[$r0.1] = $r0.14  ## 4-byte Folded Spill
	c0	stw 16[$r0.1] = $r0.13  ## 4-byte Folded Spill
	c0	stw 12[$r0.1] = $r0.12  ## 4-byte Folded Spill
	c0	stw 8[$r0.1] = $r0.11   ## 4-byte Folded Spill
	c0	stw 4[$r0.1] = $r0.6    ## 4-byte Folded Spill
	c0	ldb $r0.58 = 2[$r0.6]
	c0	ldh $r0.59 = 0[$r0.6]
	c0	cmplt $b0.0 = $r0.5, 1
	c0	br $b0.0, LBB2_5
	c0	goto LBB2_1
LBB2_1::                                ## %for.body.lr.ph
	c0	mov $r0.60 = stepsizeTable
	c0	sh2add $r0.61 = $r0.58, $r0.60
	c0	ldw $r0.21 = 0[$r0.61]
	c0	add $r0.61 = $r0.5, 1
	c0	mov $r0.62 = 0
	c0	mov $r0.63 = 29
	c0	mov $r0.11 = 30
	c0	mov $r0.12 = 1
	c0	mov $r0.13 = 3
	c0	mov $r0.14 = 31
	c0	mov $r0.15 = 2
	c0	mov $r0.16 = indexTable
	c0	mov $r0.17 = 32767
	c0	mov $r0.18 = 4
	c0	mov $r0.20 = $r0.62
                                        ## implicit-def: Reg23
	c0	mov $r0.22 = $r0.4
	c0	mov $r0.19 = $r0.3
LBB2_2::                                ## %for.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	cmpne $b0.0 = $r0.20, 0
	c0	mov $r0.24 = $r0.23
	c0	br $b0.0, LBB2_4
	c0	goto LBB2_3
LBB2_3::                                ## %if.else
                                        ##   in Loop: Header=BB2_2 Depth=1
	c0	ldb $r0.24 = 0[$r0.19]
	c0	add $r0.19 = $r0.19, 1
	c0	shru $r0.23 = $r0.24, $r0.18
LBB2_4::                                ## %if.end
                                        ##   in Loop: Header=BB2_2 Depth=1
	c0	shl $r0.25 = $r0.23, $r0.63
	c0	shl $r0.26 = $r0.23, $r0.11
	c0	shr $r0.27 = $r0.21, $r0.12
	c0	shr $r0.28 = $r0.21, $r0.13
	c0	shr $r0.25 = $r0.25, $r0.14
	c0	shr $r0.26 = $r0.26, $r0.14
	c0	shl $r0.29 = $r0.23, $r0.14
	c0	shr $r0.30 = $r0.21, $r0.15
	c0	and $r0.21 = $r0.25, $r0.21
	c0	shr $r0.25 = $r0.29, $r0.14
	c0	and $r0.26 = $r0.26, $r0.27
	c0	and $r0.27 = $r0.23, 15
	c0	add $r0.21 = $r0.21, $r0.28
	c0	and $r0.25 = $r0.25, $r0.30
	c0	and $r0.23 = $r0.23, 8
	c0	sh2add $r0.27 = $r0.27, $r0.16
	c0	add $r0.21 = $r0.21, $r0.26
	c0	add $r0.21 = $r0.21, $r0.25
	c0	ldw $r0.25 = 0[$r0.27]
	c0	cmpeq $b0.0 = $r0.23, 0
	c0	sub $r0.23 = $r0.62, $r0.21
	c0	add $r0.58 = $r0.25, $r0.58
	c0	slct $r0.21 = $b0.0, $r0.21, $r0.23
	c0	max $r0.58 = $r0.58, 0
	c0	cmpeq $b0.0 = $r0.20, 0
	c0	add $r0.59 = $r0.21, $r0.59
	c0	min $r0.58 = $r0.58, 88
	c0	sh2add $r0.20 = $r0.58, $r0.60
	c0	cmpgt $b0.1 = $r0.59, 32767
	c0	max $r0.59 = $r0.59, -32768
	c0	slct $r0.59 = $b0.1, $r0.17, $r0.59
	c0	add $r0.25 = $r0.22, 2
	c0	ldw $r0.21 = 0[$r0.20]
	c0	mfb $r0.20 = $b0.0
	c0	sth 0[$r0.22] = $r0.59
	c0	add $r0.61 = $r0.61, -1
	c0	cmpgt $b0.0 = $r0.61, 1
	c0	mov $r0.23 = $r0.24
	c0	mov $r0.22 = $r0.25
	c0	br $b0.0, LBB2_2
	c0	goto LBB2_5
LBB2_5::                                ## %for.end
	c0	sth 0[$r0.6] = $r0.59
	c0	stb 2[$r0.6] = $r0.58
	c0	ldw $r0.6 = 4[$r0.1]    ## 4-byte Folded Reload
	c0	ldw $r0.11 = 8[$r0.1]   ## 4-byte Folded Reload
	c0	ldw $r0.12 = 12[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.13 = 16[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.14 = 20[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.15 = 24[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.16 = 28[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.17 = 32[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.18 = 36[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.19 = 40[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.20 = 44[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.21 = 48[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.22 = 52[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.23 = 56[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.24 = 60[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.25 = 64[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.26 = 68[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.27 = 72[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.28 = 76[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.29 = 80[$r0.1]  ## 4-byte Folded Reload
	c0	ldw $r0.30 = 84[$r0.1]  ## 4-byte Folded Reload
	c0	return $r0.1 = $r0.1, 88, $l0.0
$func_end2::
	.size	adpcm_decoder, ($func_end2)-adpcm_decoder

	.type	pcmdata,@object         ## @pcmdata
	.section .data
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

	.type	adpcmdata_ref,@object   ## @adpcmdata_ref
	.globl	adpcmdata_ref
adpcmdata_ref::
	.data1	0
	.data1	113
	.data1	130	
	.data1	0
	.data1	56
	.size	adpcmdata_ref, 5

	.type	pcmdata_2_ref,@object   ## @pcmdata_2_ref
	.globl	pcmdata_2_ref
	.align	2
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
	.data2	3                       ## 0x3
	.size	pcmdata_2_ref, 20

	.type	coder_state,@object     ## @coder_state
	.comm	coder_state,4,2
	.type	decoder_state,@object   ## @decoder_state
	.comm	decoder_state,4,2
	.type	adpcmdata,@object       ## @adpcmdata
	.comm	adpcmdata,5,1
	.type	pcmdata_2,@object       ## @pcmdata_2
	.comm	pcmdata_2,20,2
	.type	stepsizeTable,@object   ## @stepsizeTable
	.section	.rodata,"a",@progbits
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

	.type	indexTable,@object      ## @indexTable
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


