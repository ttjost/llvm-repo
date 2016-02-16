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
	c0	mov $r0.60 = coder_state
;;
	c0	mov $r0.59 = decoder_state
	c0	mov $r0.61 = pcmdata
;;
	c0	mov $r0.62 = adpcmdata
	c0	mov $r0.63 = 10
;;
	c0	mov $r0.57 = pcmdata_2
;;
LBB0_1::                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.11 = 24[$r0.1]
;;
	c0	cmpgt $b0.0 = $r0.11, 999
;;
	c0	br $b0.0, LBB0_3
;;
## BB#2:                                ## %for.inc
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	stb 2[$r0.60] = $r0.58
;;
	c0	sth 0[$r0.60] = $r0.58
;;
	c0	stb 2[$r0.59] = $r0.58
;;
	c0	sth 0[$r0.59] = $r0.58
	c0	mov $r0.3 = $r0.61
	c0	mov $r0.4 = $r0.62
	c0	mov $r0.5 = $r0.63
;;
	c0	mov $r0.6 = $r0.60
;;
.call adpcm_coder, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = adpcm_coder
;;
	c0	mov $r0.3 = $r0.62
	c0	mov $r0.4 = $r0.57
	c0	mov $r0.5 = $r0.63
	c0	mov $r0.6 = $r0.59
;;
.call adpcm_decoder, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = adpcm_decoder
;;
	c0	ldw $r0.11 = 24[$r0.1]
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 24[$r0.1] = $r0.11
	c0	goto LBB0_1
;;
LBB0_3::                                ## %for.end
	c0	ldh $r0.11 = 0[$r0.60]
;;
	c0	cmpne $b0.0 = $r0.11, 32
;;
	c0	br $b0.0, LBB0_5
;;
## BB#4:                                ## %lor.lhs.false
	c0	ldb $r0.11 = 2[$r0.60]
;;
	c0	cmpeq $b0.0 = $r0.11, 1
;;
	c0	br $b0.0, LBB0_6
;;
LBB0_5::                                ## %if.then
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	mov $r0.3 = .str
	c0	call $l0.0 = printf
;;
	c0	mov $r0.11 = -3
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	goto LBB0_15
;;
LBB0_6::                                ## %if.end
	c0	ldh $r0.11 = 0[$r0.59]
;;
	c0	cmpne $b0.0 = $r0.11, 32
;;
	c0	br $b0.0, LBB0_8
;;
## BB#7:                                ## %lor.lhs.false9
	c0	ldb $r0.11 = 2[$r0.59]
;;
	c0	cmpeq $b0.0 = $r0.11, 1
;;
	c0	br $b0.0, LBB0_9
;;
LBB0_8::                                ## %if.then13
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	mov $r0.3 = .str1
	c0	call $l0.0 = printf
;;
	c0	mov $r0.11 = -2
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	goto LBB0_15
;;
LBB0_9::                                ## %if.end15
	c0	stw 24[$r0.1] = $r0.58
	c0	mov $r0.11 = pcmdata_2_ref
;;
LBB0_10::                               ## %for.cond16
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.12 = 24[$r0.1]
;;
	c0	cmpgt $b0.0 = $r0.12, 9
;;
	c0	br $b0.0, LBB0_14
;;
## BB#11:                               ## %for.body19
                                        ##   in Loop: Header=BB0_10 Depth=1
	c0	ldw $r0.12 = 24[$r0.1]
;;
	c0	sh1add $r0.13 = $r0.12, $r0.11
	c0	sh1add $r0.12 = $r0.12, $r0.57
;;
	c0	ldh $r0.13 = 0[$r0.13]
;;
	c0	ldh $r0.12 = 0[$r0.12]
;;
	c0	cmpeq $b0.0 = $r0.12, $r0.13
;;
	c0	brf $b0.0, LBB0_12
;;
## BB#13:                               ## %for.inc28
                                        ##   in Loop: Header=BB0_10 Depth=1
	c0	ldw $r0.12 = 24[$r0.1]
;;
	c0	add $r0.12 = $r0.12, 1
;;
	c0	stw 24[$r0.1] = $r0.12
	c0	goto LBB0_10
;;
LBB0_12::                               ## %if.then25
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	mov $r0.3 = .str2
	c0	call $l0.0 = printf
;;
	c0	mov $r0.11 = 666
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	goto LBB0_15
;;
LBB0_14::                               ## %for.end30
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	mov $r0.3 = .str3
	c0	call $l0.0 = printf
;;
	c0	mov $r0.11 = -1
;;
	c0	stw 28[$r0.1] = $r0.11
;;
LBB0_15::                               ## %return
	c0	ldw $r0.3 = 28[$r0.1]
;;
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
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg() ## @adpcm_coder
adpcm_coder::
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
	c0	mov $r0.11 = stepsizeTable
;;
	c0	ldw $r0.12 = 72[$r0.1]
;;
	c0	stw 56[$r0.1] = $r0.12
;;
	c0	ldw $r0.12 = 76[$r0.1]
;;
	c0	stw 60[$r0.1] = $r0.12
;;
	c0	ldw $r0.12 = 64[$r0.1]
;;
	c0	ldh $r0.12 = 0[$r0.12]
;;
	c0	stw 32[$r0.1] = $r0.12
;;
	c0	ldw $r0.12 = 64[$r0.1]
;;
	c0	ldb $r0.12 = 2[$r0.12]
;;
	c0	sh2add $r0.13 = $r0.12, $r0.11
	c0	stw 24[$r0.1] = $r0.12
;;
	c0	ldw $r0.13 = 0[$r0.13]
	c0	mov $r0.12 = 1
;;
	c0	stw 36[$r0.1] = $r0.13
;;
	c0	stw 16[$r0.1] = $r0.12
	c0	mov $r0.13 = 0
	c0	mov $r0.14 = 3
	c0	mov $r0.15 = 4
;;
	c0	mov $r0.16 = 32767
	c0	mov $r0.17 = indexTable
;;
	c0	mov $r0.18 = 88
	c0	mov $r0.19 = -32768
	c0	mov $r0.20 = 8
;;
LBB1_1::                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.21 = 68[$r0.1]
;;
	c0	cmplt $b0.0 = $r0.21, 1
;;
	c0	br $b0.0, LBB1_26
;;
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.21 = 60[$r0.1]
;;
	c0	add $r0.22 = $r0.21, 2
;;
	c0	stw 60[$r0.1] = $r0.22
;;
	c0	ldh $r0.21 = 0[$r0.21]
;;
	c0	stw 52[$r0.1] = $r0.21
;;
	c0	ldw $r0.22 = 32[$r0.1]
;;
	c0	sub $r0.21 = $r0.21, $r0.22
;;
	c0	stw 40[$r0.1] = $r0.21
	c0	cmplt $b0.0 = $r0.21, 0
;;
	c0	br $b0.0, LBB1_4
;;
## BB#3:                                ## %if.then
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	stw 48[$r0.1] = $r0.13
	c0	goto LBB1_5
;;
LBB1_4::                                ## %if.else
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	stw 48[$r0.1] = $r0.20
;;
	c0	ldw $r0.21 = 40[$r0.1]
;;
	c0	sub $r0.21 = $r0.13, $r0.21
;;
	c0	stw 40[$r0.1] = $r0.21
;;
LBB1_5::                                ## %if.end
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	stw 44[$r0.1] = $r0.13
;;
	c0	ldw $r0.21 = 36[$r0.1]
;;
	c0	shr $r0.21 = $r0.21, $r0.14
;;
	c0	stw 28[$r0.1] = $r0.21
;;
	c0	ldw $r0.21 = 36[$r0.1]
;;
	c0	ldw $r0.22 = 40[$r0.1]
;;
	c0	cmplt $b0.0 = $r0.22, $r0.21
;;
	c0	br $b0.0, LBB1_7
;;
## BB#6:                                ## %if.then10
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	stw 44[$r0.1] = $r0.15
;;
	c0	ldw $r0.21 = 40[$r0.1]
;;
	c0	ldw $r0.22 = 36[$r0.1]
;;
	c0	sub $r0.21 = $r0.21, $r0.22
;;
	c0	stw 40[$r0.1] = $r0.21
;;
	c0	ldw $r0.21 = 28[$r0.1]
;;
	c0	ldw $r0.22 = 36[$r0.1]
;;
	c0	add $r0.21 = $r0.21, $r0.22
;;
	c0	stw 28[$r0.1] = $r0.21
;;
LBB1_7::                                ## %if.end12
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.21 = 36[$r0.1]
;;
	c0	shr $r0.21 = $r0.21, $r0.12
;;
	c0	stw 36[$r0.1] = $r0.21
;;
	c0	ldw $r0.22 = 40[$r0.1]
;;
	c0	cmplt $b0.0 = $r0.22, $r0.21
;;
	c0	br $b0.0, LBB1_9
;;
## BB#8:                                ## %if.then16
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.21 = 44[$r0.1]
;;
	c0	or $r0.21 = $r0.21, 2
;;
	c0	stw 44[$r0.1] = $r0.21
;;
	c0	ldw $r0.21 = 40[$r0.1]
;;
	c0	ldw $r0.22 = 36[$r0.1]
;;
	c0	sub $r0.21 = $r0.21, $r0.22
;;
	c0	stw 40[$r0.1] = $r0.21
;;
	c0	ldw $r0.21 = 28[$r0.1]
;;
	c0	ldw $r0.22 = 36[$r0.1]
;;
	c0	add $r0.21 = $r0.21, $r0.22
;;
	c0	stw 28[$r0.1] = $r0.21
;;
LBB1_9::                                ## %if.end19
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.21 = 36[$r0.1]
;;
	c0	shr $r0.21 = $r0.21, $r0.12
;;
	c0	stw 36[$r0.1] = $r0.21
;;
	c0	ldw $r0.22 = 40[$r0.1]
;;
	c0	cmplt $b0.0 = $r0.22, $r0.21
;;
	c0	br $b0.0, LBB1_11
;;
## BB#10:                               ## %if.then23
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.21 = 44[$r0.1]
;;
	c0	or $r0.21 = $r0.21, 1
;;
	c0	stw 44[$r0.1] = $r0.21
;;
	c0	ldw $r0.21 = 28[$r0.1]
;;
	c0	ldw $r0.22 = 36[$r0.1]
;;
	c0	add $r0.21 = $r0.21, $r0.22
;;
	c0	stw 28[$r0.1] = $r0.21
;;
LBB1_11::                               ## %if.end26
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.21 = 48[$r0.1]
;;
	c0	cmpeq $b0.0 = $r0.21, 0
;;
	c0	br $b0.0, LBB1_13
;;
## BB#12:                               ## %if.then27
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.21 = 32[$r0.1]
;;
	c0	ldw $r0.22 = 28[$r0.1]
;;
	c0	sub $r0.21 = $r0.21, $r0.22
;;
	c0	stw 32[$r0.1] = $r0.21
	c0	goto LBB1_14
;;
LBB1_13::                               ## %if.else29
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.21 = 32[$r0.1]
;;
	c0	ldw $r0.22 = 28[$r0.1]
;;
	c0	add $r0.21 = $r0.21, $r0.22
;;
	c0	stw 32[$r0.1] = $r0.21
;;
LBB1_14::                               ## %if.end31
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.21 = 32[$r0.1]
;;
	c0	cmplt $b0.0 = $r0.21, 32768
;;
	c0	br $b0.0, LBB1_16
;;
## BB#15:                               ## %if.then34
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	stw 32[$r0.1] = $r0.16
	c0	goto LBB1_18
;;
LBB1_16::                               ## %if.else35
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.21 = 32[$r0.1]
;;
	c0	cmpgt $b0.0 = $r0.21, -32769
;;
	c0	br $b0.0, LBB1_18
;;
## BB#17:                               ## %if.then38
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	stw 32[$r0.1] = $r0.19
;;
LBB1_18::                               ## %if.end40
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.21 = 48[$r0.1]
;;
	c0	ldw $r0.22 = 44[$r0.1]
;;
	c0	or $r0.21 = $r0.22, $r0.21
;;
	c0	sh2add $r0.22 = $r0.21, $r0.17
	c0	stw 44[$r0.1] = $r0.21
;;
	c0	ldw $r0.21 = 0[$r0.22]
;;
	c0	ldw $r0.22 = 24[$r0.1]
;;
	c0	add $r0.21 = $r0.22, $r0.21
;;
	c0	stw 24[$r0.1] = $r0.21
	c0	cmpgt $b0.0 = $r0.21, -1
;;
	c0	br $b0.0, LBB1_20
;;
## BB#19:                               ## %if.then46
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	stw 24[$r0.1] = $r0.13
;;
LBB1_20::                               ## %if.end47
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.21 = 24[$r0.1]
;;
	c0	cmplt $b0.0 = $r0.21, 89
;;
	c0	br $b0.0, LBB1_22
;;
## BB#21:                               ## %if.then50
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	stw 24[$r0.1] = $r0.18
;;
LBB1_22::                               ## %if.end51
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.21 = 24[$r0.1]
;;
	c0	sh2add $r0.21 = $r0.21, $r0.11
;;
	c0	ldw $r0.21 = 0[$r0.21]
;;
	c0	stw 36[$r0.1] = $r0.21
;;
	c0	ldw $r0.21 = 16[$r0.1]
;;
	c0	cmpeq $b0.0 = $r0.21, 0
;;
	c0	br $b0.0, LBB1_24
;;
## BB#23:                               ## %if.then54
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.21 = 44[$r0.1]
;;
	c0	shl $r0.21 = $r0.21, $r0.15
;;
	c0	zxtb $r0.21 = $r0.21
;;
	c0	stw 20[$r0.1] = $r0.21
	c0	goto LBB1_25
;;
LBB1_24::                               ## %if.else55
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.21 = 44[$r0.1]
;;
	c0	ldw $r0.22 = 56[$r0.1]
	c0	and $r0.21 = $r0.21, 15
;;
	c0	ldw $r0.23 = 20[$r0.1]
	c0	add $r0.24 = $r0.22, 1
;;
	c0	or $r0.21 = $r0.21, $r0.23
	c0	stw 56[$r0.1] = $r0.24
;;
	c0	stb 0[$r0.22] = $r0.21
;;
LBB1_25::                               ## %for.inc
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.21 = 16[$r0.1]
;;
	c0	cmpeq $b0.0 = $r0.21, 0
;;
	c0	mfb $r0.21 = $b0.0
;;
	c0	stw 16[$r0.1] = $r0.21
;;
	c0	ldw $r0.21 = 68[$r0.1]
;;
	c0	add $r0.21 = $r0.21, -1
;;
	c0	stw 68[$r0.1] = $r0.21
	c0	goto LBB1_1
;;
LBB1_26::                               ## %for.end
	c0	ldw $r0.11 = 16[$r0.1]
;;
	c0	cmpne $b0.0 = $r0.11, 0
;;
	c0	br $b0.0, LBB1_28
;;
## BB#27:                               ## %if.then63
	c0	ldw $r0.11 = 56[$r0.1]
;;
	c0	ldw $r0.12 = 20[$r0.1]
	c0	add $r0.13 = $r0.11, 1
;;
	c0	stw 56[$r0.1] = $r0.13
;;
	c0	stb 0[$r0.11] = $r0.12
;;
LBB1_28::                               ## %if.end66
	c0	ldw $r0.11 = 64[$r0.1]
;;
	c0	ldw $r0.12 = 32[$r0.1]
;;
	c0	sth 0[$r0.11] = $r0.12
;;
	c0	ldw $r0.11 = 64[$r0.1]
;;
	c0	ldw $r0.12 = 24[$r0.1]
;;
.return ret($r0.3:s32)
	c0	stb 2[$r0.11] = $r0.12
	c0	return $r0.1 = $r0.1, 96, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg() ## @adpcm_decoder
adpcm_decoder::
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
	c0	mov $r0.11 = stepsizeTable
;;
	c0	ldw $r0.12 = 72[$r0.1]
;;
	c0	stw 56[$r0.1] = $r0.12
;;
	c0	ldw $r0.12 = 76[$r0.1]
;;
	c0	stw 60[$r0.1] = $r0.12
;;
	c0	ldw $r0.12 = 64[$r0.1]
;;
	c0	ldh $r0.12 = 0[$r0.12]
;;
	c0	stw 44[$r0.1] = $r0.12
;;
	c0	ldw $r0.12 = 64[$r0.1]
;;
	c0	ldb $r0.12 = 2[$r0.12]
;;
	c0	sh2add $r0.13 = $r0.12, $r0.11
	c0	stw 36[$r0.1] = $r0.12
;;
	c0	ldw $r0.13 = 0[$r0.13]
	c0	mov $r0.12 = 0
;;
	c0	stw 48[$r0.1] = $r0.13
;;
	c0	stw 28[$r0.1] = $r0.12
	c0	mov $r0.13 = 3
	c0	mov $r0.14 = 1
	c0	mov $r0.15 = 2
;;
	c0	mov $r0.16 = 32767
	c0	mov $r0.17 = indexTable
;;
	c0	mov $r0.18 = 88
	c0	mov $r0.19 = -32768
	c0	mov $r0.20 = 4
;;
LBB2_1::                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.21 = 68[$r0.1]
;;
	c0	cmplt $b0.0 = $r0.21, 1
;;
	c0	br $b0.0, LBB2_23
;;
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	ldw $r0.21 = 28[$r0.1]
;;
	c0	cmpeq $b0.0 = $r0.21, 0
;;
	c0	br $b0.0, LBB2_4
;;
## BB#3:                                ## %if.then
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	ldw $r0.21 = 32[$r0.1]
;;
	c0	and $r0.21 = $r0.21, 15
;;
	c0	stw 52[$r0.1] = $r0.21
	c0	goto LBB2_5
;;
LBB2_4::                                ## %if.else
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	ldw $r0.21 = 60[$r0.1]
;;
	c0	add $r0.22 = $r0.21, 1
;;
	c0	stw 60[$r0.1] = $r0.22
;;
	c0	ldb $r0.21 = 0[$r0.21]
;;
	c0	shru $r0.22 = $r0.21, $r0.20
	c0	stw 32[$r0.1] = $r0.21
;;
	c0	and $r0.21 = $r0.22, 15
;;
	c0	stw 52[$r0.1] = $r0.21
;;
LBB2_5::                                ## %if.end
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	ldw $r0.21 = 28[$r0.1]
;;
	c0	cmpeq $b0.0 = $r0.21, 0
;;
	c0	mfb $r0.21 = $b0.0
;;
	c0	stw 28[$r0.1] = $r0.21
;;
	c0	ldw $r0.21 = 48[$r0.1]
;;
	c0	shr $r0.21 = $r0.21, $r0.13
;;
	c0	stw 40[$r0.1] = $r0.21
;;
	c0	ldbu $r0.21 = 55[$r0.1]
;;
	c0	and $r0.21 = $r0.21, 4
;;
	c0	cmpeq $b0.0 = $r0.21, 0
;;
	c0	br $b0.0, LBB2_7
;;
## BB#6:                                ## %if.then10
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	ldw $r0.21 = 40[$r0.1]
;;
	c0	ldw $r0.22 = 48[$r0.1]
;;
	c0	add $r0.21 = $r0.21, $r0.22
;;
	c0	stw 40[$r0.1] = $r0.21
;;
LBB2_7::                                ## %if.end11
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	ldbu $r0.21 = 55[$r0.1]
;;
	c0	and $r0.21 = $r0.21, 2
;;
	c0	cmpeq $b0.0 = $r0.21, 0
;;
	c0	br $b0.0, LBB2_9
;;
## BB#8:                                ## %if.then14
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	ldw $r0.21 = 48[$r0.1]
;;
	c0	shr $r0.21 = $r0.21, $r0.14
	c0	ldw $r0.22 = 40[$r0.1]
;;
	c0	add $r0.21 = $r0.22, $r0.21
;;
	c0	stw 40[$r0.1] = $r0.21
;;
LBB2_9::                                ## %if.end17
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	ldw $r0.21 = 52[$r0.1]
;;
	c0	and $r0.21 = $r0.21, 1
;;
	c0	cmpeq $b0.0 = $r0.21, 0
;;
	c0	br $b0.0, LBB2_11
;;
## BB#10:                               ## %if.then20
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	ldw $r0.21 = 48[$r0.1]
;;
	c0	shr $r0.21 = $r0.21, $r0.15
	c0	ldw $r0.22 = 40[$r0.1]
;;
	c0	add $r0.21 = $r0.22, $r0.21
;;
	c0	stw 40[$r0.1] = $r0.21
;;
LBB2_11::                               ## %if.end23
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	ldbu $r0.21 = 55[$r0.1]
;;
	c0	and $r0.21 = $r0.21, 8
;;
	c0	cmpeq $b0.0 = $r0.21, 0
;;
	c0	br $b0.0, LBB2_13
;;
## BB#12:                               ## %if.then26
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	ldw $r0.21 = 44[$r0.1]
;;
	c0	ldw $r0.22 = 40[$r0.1]
;;
	c0	sub $r0.21 = $r0.21, $r0.22
;;
	c0	stw 44[$r0.1] = $r0.21
	c0	goto LBB2_14
;;
LBB2_13::                               ## %if.else27
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	ldw $r0.21 = 44[$r0.1]
;;
	c0	ldw $r0.22 = 40[$r0.1]
;;
	c0	add $r0.21 = $r0.21, $r0.22
;;
	c0	stw 44[$r0.1] = $r0.21
;;
LBB2_14::                               ## %if.end29
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	ldw $r0.21 = 44[$r0.1]
;;
	c0	cmplt $b0.0 = $r0.21, 32768
;;
	c0	br $b0.0, LBB2_16
;;
## BB#15:                               ## %if.then32
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	stw 44[$r0.1] = $r0.16
	c0	goto LBB2_18
;;
LBB2_16::                               ## %if.else33
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	ldw $r0.21 = 44[$r0.1]
;;
	c0	cmpgt $b0.0 = $r0.21, -32769
;;
	c0	br $b0.0, LBB2_18
;;
## BB#17:                               ## %if.then36
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	stw 44[$r0.1] = $r0.19
;;
LBB2_18::                               ## %if.end38
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	ldw $r0.21 = 52[$r0.1]
;;
	c0	sh2add $r0.21 = $r0.21, $r0.17
	c0	ldw $r0.22 = 36[$r0.1]
;;
	c0	ldw $r0.21 = 0[$r0.21]
;;
	c0	add $r0.21 = $r0.22, $r0.21
;;
	c0	stw 36[$r0.1] = $r0.21
	c0	cmpgt $b0.0 = $r0.21, -1
;;
	c0	br $b0.0, LBB2_20
;;
## BB#19:                               ## %if.then43
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	stw 36[$r0.1] = $r0.12
;;
LBB2_20::                               ## %if.end44
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	ldw $r0.21 = 36[$r0.1]
;;
	c0	cmplt $b0.0 = $r0.21, 89
;;
	c0	br $b0.0, LBB2_22
;;
## BB#21:                               ## %if.then47
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	stw 36[$r0.1] = $r0.18
;;
LBB2_22::                               ## %for.inc
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	ldw $r0.21 = 36[$r0.1]
;;
	c0	sh2add $r0.21 = $r0.21, $r0.11
;;
	c0	ldw $r0.21 = 0[$r0.21]
;;
	c0	stw 48[$r0.1] = $r0.21
;;
	c0	ldw $r0.21 = 56[$r0.1]
;;
	c0	ldw $r0.22 = 44[$r0.1]
	c0	add $r0.23 = $r0.21, 2
;;
	c0	stw 56[$r0.1] = $r0.23
;;
	c0	sth 0[$r0.21] = $r0.22
;;
	c0	ldw $r0.21 = 68[$r0.1]
;;
	c0	add $r0.21 = $r0.21, -1
;;
	c0	stw 68[$r0.1] = $r0.21
	c0	goto LBB2_1
;;
LBB2_23::                               ## %for.end
	c0	ldw $r0.11 = 64[$r0.1]
;;
	c0	ldw $r0.12 = 44[$r0.1]
;;
	c0	sth 0[$r0.11] = $r0.12
;;
	c0	ldw $r0.11 = 64[$r0.1]
;;
	c0	ldw $r0.12 = 36[$r0.1]
;;
.return ret($r0.3:s32)
	c0	stb 2[$r0.11] = $r0.12
	c0	return $r0.1 = $r0.1, 96, $l0.0
;;
.endp

.section .data
	.align	1                       ## @pcmdata
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

	.align	1                       ## @pcmdata_2_ref
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

	.comm	coder_state,4,2         ## @coder_state
	.comm	decoder_state,4,2       ## @decoder_state
	.comm	adpcmdata,5,1           ## @adpcmdata
	.comm	pcmdata_2,20,2          ## @pcmdata_2
	.section	.data
.str::                                  ## @.str
	.data1 45
	.data1 51
	.data1 10
	.data1 0

.str1::                                 ## @.str1
	.data1 45
	.data1 50
	.data1 10
	.data1 0

.str2::                                 ## @.str2
	.data1 54
	.data1 54
	.data1 54
	.data1 10
	.data1 0

.str3::                                 ## @.str3
	.data1 45
	.data1 49
	.data1 10
	.data1 0

.section .data
	.align	2                       ## @stepsizeTable
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

	.align	2                       ## @indexTable
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


.import printf
.type printf, @function
.import puts
.type puts, @function
