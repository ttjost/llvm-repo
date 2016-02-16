.section .text
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @abs
abs::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 24[$r0.1] = $r0.3
	c0	cmpgt $b0.0 = $r0.3, -1
;;
	c0	br $b0.0, LBB0_2
;;
## BB#1:                                ## %if.then
	c0	ldw $r0.11 = 24[$r0.1]
	c0	mov $r0.12 = 0
;;
	c0	sub $r0.11 = $r0.12, $r0.11
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	goto LBB0_3
;;
LBB0_2::                                ## %if.else
	c0	ldw $r0.11 = 24[$r0.1]
;;
	c0	stw 28[$r0.1] = $r0.11
;;
LBB0_3::                                ## %return
.return ret($r0.3:s32)
	c0	ldw $r0.3 = 28[$r0.1]
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

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
	c0	mov $r0.11 = 16
;;
	c0	stw 28[$r0.1] = $r0.58
;;
	c0	stw 24[$r0.1] = $r0.11
;;
	c0	stw 20[$r0.1] = $r0.58
	c0	mov $r0.57 = scores
;;
	c0	mov $r0.59 = pix0
	c0	mov $r0.60 = pix1
;;
	c0	mov $r0.61 = pix2
	c0	mov $r0.62 = pix3
;;
	c0	mov $r0.63 = fenc
;;
LBB1_1::                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.11 = 20[$r0.1]
;;
	c0	cmpgt $b0.0 = $r0.11, 999
;;
	c0	br $b0.0, LBB1_3
;;
## BB#2:                                ## %for.inc
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.8 = 24[$r0.1]
	c0	mov $r0.3 = $r0.63
	c0	mov $r0.4 = $r0.59
	c0	mov $r0.5 = $r0.60
;;
	c0	mov $r0.6 = $r0.61
	c0	mov $r0.7 = $r0.62
	c0	mov $r0.9 = $r0.57
;;
.call x264_pixel_sad_x4_16x16, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = x264_pixel_sad_x4_16x16
;;
	c0	ldw $r0.11 = 20[$r0.1]
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 20[$r0.1] = $r0.11
	c0	goto LBB1_1
;;
LBB1_3::                                ## %for.end
	c0	stw 20[$r0.1] = $r0.58
	c0	mov $r0.11 = scores_temp
;;
LBB1_4::                                ## %for.cond1
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.12 = 20[$r0.1]
;;
	c0	cmpgt $b0.0 = $r0.12, 3
;;
	c0	br $b0.0, LBB1_8
;;
## BB#5:                                ## %for.body3
                                        ##   in Loop: Header=BB1_4 Depth=1
	c0	ldw $r0.12 = 20[$r0.1]
;;
	c0	sh2add $r0.13 = $r0.12, $r0.11
	c0	sh2add $r0.12 = $r0.12, $r0.57
;;
	c0	ldw $r0.13 = 0[$r0.13]
;;
	c0	ldw $r0.12 = 0[$r0.12]
;;
	c0	cmpeq $b0.0 = $r0.12, $r0.13
;;
	c0	brf $b0.0, LBB1_6
;;
## BB#7:                                ## %for.inc6
                                        ##   in Loop: Header=BB1_4 Depth=1
	c0	ldw $r0.12 = 20[$r0.1]
;;
	c0	add $r0.12 = $r0.12, 1
;;
	c0	stw 20[$r0.1] = $r0.12
	c0	goto LBB1_4
;;
LBB1_6::                                ## %if.then
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	mov $r0.3 = .str
	c0	call $l0.0 = printf
;;
	c0	mov $r0.11 = 666
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	goto LBB1_9
;;
LBB1_8::                                ## %for.end8
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	mov $r0.3 = .str1
	c0	call $l0.0 = printf
;;
	c0	mov $r0.11 = -1
;;
	c0	stw 28[$r0.1] = $r0.11
;;
LBB1_9::                                ## %return
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
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @x264_pixel_sad_x4_16x16
x264_pixel_sad_x4_16x16::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 60[$r0.1] = $l0.0
;;
	c0	stw 56[$r0.1] = $r0.57
;;
	c0	stw 52[$r0.1] = $r0.3
;;
	c0	stw 48[$r0.1] = $r0.4
;;
	c0	stw 44[$r0.1] = $r0.5
;;
	c0	stw 40[$r0.1] = $r0.6
;;
	c0	stw 36[$r0.1] = $r0.7
;;
	c0	stw 32[$r0.1] = $r0.8
;;
	c0	stw 28[$r0.1] = $r0.9
	c0	mov $r0.57 = 16
;;
	c0	ldw $r0.5 = 48[$r0.1]
;;
	c0	ldw $r0.3 = 52[$r0.1]
;;
	c0	ldw $r0.6 = 32[$r0.1]
	c0	mov $r0.4 = $r0.57
;;
.call x264_pixel_sad_16x16, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = x264_pixel_sad_16x16
;;
	c0	ldw $r0.11 = 28[$r0.1]
;;
	c0	stw 0[$r0.11] = $r0.3
;;
	c0	ldw $r0.6 = 32[$r0.1]
;;
	c0	ldw $r0.5 = 44[$r0.1]
;;
	c0	ldw $r0.3 = 52[$r0.1]
	c0	mov $r0.4 = $r0.57
;;
.call x264_pixel_sad_16x16, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = x264_pixel_sad_16x16
;;
	c0	ldw $r0.11 = 28[$r0.1]
;;
	c0	stw 4[$r0.11] = $r0.3
;;
	c0	ldw $r0.6 = 32[$r0.1]
;;
	c0	ldw $r0.5 = 40[$r0.1]
;;
	c0	ldw $r0.3 = 52[$r0.1]
	c0	mov $r0.4 = $r0.57
;;
.call x264_pixel_sad_16x16, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = x264_pixel_sad_16x16
;;
	c0	ldw $r0.11 = 28[$r0.1]
;;
	c0	stw 8[$r0.11] = $r0.3
;;
	c0	ldw $r0.6 = 32[$r0.1]
;;
	c0	ldw $r0.5 = 36[$r0.1]
;;
	c0	ldw $r0.3 = 52[$r0.1]
	c0	mov $r0.4 = $r0.57
;;
.call x264_pixel_sad_16x16, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = x264_pixel_sad_16x16
;;
	c0	ldw $r0.11 = 28[$r0.1]
;;
	c0	stw 12[$r0.11] = $r0.3
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
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @x264_pixel_sad_16x16
x264_pixel_sad_16x16::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 60[$r0.1] = $l0.0
;;
	c0	stw 56[$r0.1] = $r0.57
;;
	c0	stw 52[$r0.1] = $r0.3
;;
	c0	stw 48[$r0.1] = $r0.4
;;
	c0	stw 44[$r0.1] = $r0.5
;;
	c0	stw 40[$r0.1] = $r0.6
	c0	mov $r0.57 = 0
;;
	c0	stw 36[$r0.1] = $r0.57
;;
	c0	stw 28[$r0.1] = $r0.57
;;
LBB3_1::                                ## %for.cond
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB3_3 Depth 2
	c0	ldw $r0.11 = 28[$r0.1]
;;
	c0	cmpgt $b0.0 = $r0.11, 15
;;
	c0	br $b0.0, LBB3_8
;;
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB3_1 Depth=1
	c0	stw 32[$r0.1] = $r0.57
;;
LBB3_3::                                ## %for.cond1
                                        ##   Parent Loop BB3_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldw $r0.11 = 32[$r0.1]
;;
	c0	cmpgt $b0.0 = $r0.11, 15
;;
	c0	br $b0.0, LBB3_6
;;
## BB#4:                                ## %for.body3
                                        ##   in Loop: Header=BB3_3 Depth=2
	c0	ldw $r0.11 = 44[$r0.1]
;;
	c0	ldw $r0.12 = 52[$r0.1]
;;
	c0	ldw $r0.13 = 32[$r0.1]
;;
	c0	add $r0.11 = $r0.11, $r0.13
	c0	add $r0.12 = $r0.12, $r0.13
;;
	c0	ldbu $r0.11 = 0[$r0.11]
;;
	c0	ldbu $r0.12 = 0[$r0.12]
;;
.call abs, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	sub $r0.3 = $r0.12, $r0.11
	c0	call $l0.0 = abs
;;
	c0	ldw $r0.11 = 36[$r0.1]
;;
	c0	add $r0.11 = $r0.11, $r0.3
;;
	c0	stw 36[$r0.1] = $r0.11
;;
## BB#5:                                ## %for.inc
                                        ##   in Loop: Header=BB3_3 Depth=2
	c0	ldw $r0.11 = 32[$r0.1]
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 32[$r0.1] = $r0.11
	c0	goto LBB3_3
;;
LBB3_6::                                ## %for.end
                                        ##   in Loop: Header=BB3_1 Depth=1
	c0	ldw $r0.11 = 52[$r0.1]
;;
	c0	ldw $r0.12 = 48[$r0.1]
;;
	c0	add $r0.11 = $r0.11, $r0.12
;;
	c0	stw 52[$r0.1] = $r0.11
;;
	c0	ldw $r0.11 = 44[$r0.1]
;;
	c0	ldw $r0.12 = 40[$r0.1]
;;
	c0	add $r0.11 = $r0.11, $r0.12
;;
	c0	stw 44[$r0.1] = $r0.11
;;
## BB#7:                                ## %for.inc7
                                        ##   in Loop: Header=BB3_1 Depth=1
	c0	ldw $r0.11 = 28[$r0.1]
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	goto LBB3_1
;;
LBB3_8::                                ## %for.end9
	c0	ldw $r0.3 = 36[$r0.1]
;;
	c0	ldw $r0.57 = 56[$r0.1]
;;
	c0	ldw $l0.0 = 60[$r0.1]
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .data
fenc::                                  ## @fenc
	.data1 0
	.data1 1
	.data1 2
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 13
	.data1 14
	.data1 15
	.data1 0
	.data1 1
	.data1 2
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 13
	.data1 14
	.data1 15
	.data1 0
	.data1 1
	.data1 2
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 13
	.data1 14
	.data1 15
	.data1 0
	.data1 1
	.data1 2
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 13
	.data1 14
	.data1 15
	.data1 0
	.data1 1
	.data1 2
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 13
	.data1 14
	.data1 15
	.data1 0
	.data1 1
	.data1 2
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 13
	.data1 14
	.data1 15
	.data1 0
	.data1 1
	.data1 2
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 13
	.data1 14
	.data1 15
	.data1 0
	.data1 1
	.data1 2
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 13
	.data1 14
	.data1 15
	.data1 0
	.data1 1
	.data1 2
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 13
	.data1 14
	.data1 15
	.data1 0
	.data1 1
	.data1 2
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 13
	.data1 14
	.data1 15
	.data1 0
	.data1 1
	.data1 2
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 13
	.data1 14
	.data1 15
	.data1 0
	.data1 1
	.data1 2
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 13
	.data1 14
	.data1 15
	.data1 0
	.data1 1
	.data1 2
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 13
	.data1 14
	.data1 15
	.data1 0
	.data1 1
	.data1 2
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 13
	.data1 14
	.data1 15
	.data1 0
	.data1 1
	.data1 2
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 13
	.data1 14
	.data1 15
	.data1 0
	.data1 1
	.data1 2
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 13
	.data1 14
	.data1 15

pix0::                                  ## @pix0
	.data1 0
	.data1 11
	.data1 22
	.data1 33
	.data1 44
	.data1 55
	.data1 66
	.data1 77
	.data1 88
	.data1 99
	.data1 10
	.data1 111
	.data1 212
	.data1 13
	.data1 14
	.data1 15
	.data1 10
	.data1 21
	.data1 32
	.data1 43
	.data1 54
	.data1 65
	.data1 76
	.data1 87
	.data1 98
	.data1 9
	.data1 110
	.data1 211
	.data1 112
	.data1 13
	.data1 14
	.data1 15
	.data1 20
	.data1 31
	.data1 42
	.data1 53
	.data1 64
	.data1 75
	.data1 86
	.data1 97
	.data1 8
	.data1 19
	.data1 210
	.data1 55
	.data1 212
	.data1 13
	.data1 14
	.data1 15
	.data1 10
	.data1 21
	.data1 42
	.data1 34
	.data1 44
	.data1 55
	.data1 66
	.data1 77
	.data1 88
	.data1 99
	.data1 110
	.data1 211
	.data1 142
	.data1 13
	.data1 14
	.data1 15
	.data1 20
	.data1 41
	.data1 52
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 113
	.data1 149
	.data1 151
	.data1 30
	.data1 61
	.data1 62
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 18
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 123
	.data1 148
	.data1 152
	.data1 40
	.data1 71
	.data1 72
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 143
	.data1 146
	.data1 153
	.data1 50
	.data1 81
	.data1 82
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 28
	.data1 92
	.data1 10
	.data1 11
	.data1 12
	.data1 135
	.data1 142
	.data1 154
	.data1 60
	.data1 91
	.data1 92
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 137
	.data1 154
	.data1 155
	.data1 70
	.data1 1
	.data1 20
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 130
	.data1 11
	.data1 12
	.data1 138
	.data1 142
	.data1 156
	.data1 80
	.data1 21
	.data1 62
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 28
	.data1 9
	.data1 150
	.data1 11
	.data1 12
	.data1 193
	.data1 154
	.data1 157
	.data1 90
	.data1 31
	.data1 22
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 113
	.data1 174
	.data1 158
	.data1 0
	.data1 41
	.data1 2
	.data1 43
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 103
	.data1 11
	.data1 12
	.data1 133
	.data1 146
	.data1 159
	.data1 10
	.data1 11
	.data1 2
	.data1 23
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 113
	.data1 144
	.data1 115
	.data1 20
	.data1 31
	.data1 2
	.data1 33
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 18
	.data1 9
	.data1 101
	.data1 11
	.data1 12
	.data1 123
	.data1 142
	.data1 152
	.data1 30
	.data1 41
	.data1 2
	.data1 43
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 98
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 133
	.data1 141
	.data1 153

pix1::                                  ## @pix1
	.data1 0
	.data1 11
	.data1 22
	.data1 33
	.data1 44
	.data1 55
	.data1 66
	.data1 77
	.data1 88
	.data1 99
	.data1 10
	.data1 111
	.data1 12
	.data1 13
	.data1 14
	.data1 15
	.data1 10
	.data1 21
	.data1 32
	.data1 43
	.data1 54
	.data1 65
	.data1 76
	.data1 87
	.data1 98
	.data1 9
	.data1 110
	.data1 11
	.data1 12
	.data1 13
	.data1 14
	.data1 15
	.data1 20
	.data1 31
	.data1 42
	.data1 53
	.data1 64
	.data1 75
	.data1 86
	.data1 97
	.data1 8
	.data1 19
	.data1 120
	.data1 11
	.data1 12
	.data1 13
	.data1 14
	.data1 15
	.data1 10
	.data1 21
	.data1 42
	.data1 34
	.data1 44
	.data1 55
	.data1 66
	.data1 77
	.data1 88
	.data1 99
	.data1 110
	.data1 11
	.data1 142
	.data1 13
	.data1 14
	.data1 15
	.data1 60
	.data1 91
	.data1 92
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 13
	.data1 15
	.data1 115
	.data1 70
	.data1 1
	.data1 20
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 130
	.data1 11
	.data1 12
	.data1 13
	.data1 142
	.data1 126
	.data1 80
	.data1 21
	.data1 62
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 28
	.data1 9
	.data1 150
	.data1 11
	.data1 12
	.data1 193
	.data1 154
	.data1 117
	.data1 20
	.data1 41
	.data1 52
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 113
	.data1 149
	.data1 121
	.data1 30
	.data1 61
	.data1 62
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 18
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 123
	.data1 148
	.data1 92
	.data1 40
	.data1 71
	.data1 72
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 0
	.data1 10
	.data1 11
	.data1 12
	.data1 123
	.data1 146
	.data1 13
	.data1 50
	.data1 81
	.data1 82
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 2
	.data1 92
	.data1 10
	.data1 1
	.data1 12
	.data1 125
	.data1 142
	.data1 14
	.data1 90
	.data1 31
	.data1 22
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 13
	.data1 174
	.data1 18
	.data1 0
	.data1 41
	.data1 2
	.data1 43
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 103
	.data1 11
	.data1 12
	.data1 123
	.data1 146
	.data1 19
	.data1 10
	.data1 11
	.data1 2
	.data1 23
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 113
	.data1 14
	.data1 11
	.data1 20
	.data1 31
	.data1 2
	.data1 33
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 101
	.data1 11
	.data1 12
	.data1 13
	.data1 12
	.data1 12
	.data1 30
	.data1 41
	.data1 2
	.data1 43
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 92
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 13
	.data1 11
	.data1 13

pix2::                                  ## @pix2
	.data1 0
	.data1 11
	.data1 22
	.data1 33
	.data1 44
	.data1 55
	.data1 66
	.data1 77
	.data1 88
	.data1 99
	.data1 10
	.data1 111
	.data1 12
	.data1 13
	.data1 14
	.data1 15
	.data1 10
	.data1 21
	.data1 32
	.data1 43
	.data1 54
	.data1 65
	.data1 76
	.data1 87
	.data1 98
	.data1 9
	.data1 110
	.data1 11
	.data1 12
	.data1 13
	.data1 14
	.data1 15
	.data1 20
	.data1 31
	.data1 42
	.data1 53
	.data1 64
	.data1 75
	.data1 86
	.data1 97
	.data1 8
	.data1 19
	.data1 120
	.data1 11
	.data1 12
	.data1 13
	.data1 14
	.data1 15
	.data1 10
	.data1 21
	.data1 42
	.data1 34
	.data1 44
	.data1 55
	.data1 66
	.data1 77
	.data1 88
	.data1 99
	.data1 110
	.data1 11
	.data1 142
	.data1 13
	.data1 14
	.data1 15
	.data1 60
	.data1 91
	.data1 92
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 114
	.data1 122
	.data1 13
	.data1 15
	.data1 115
	.data1 70
	.data1 1
	.data1 20
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 130
	.data1 113
	.data1 121
	.data1 13
	.data1 142
	.data1 126
	.data1 80
	.data1 21
	.data1 62
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 28
	.data1 9
	.data1 150
	.data1 11
	.data1 12
	.data1 193
	.data1 154
	.data1 117
	.data1 20
	.data1 41
	.data1 52
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 113
	.data1 149
	.data1 121
	.data1 30
	.data1 61
	.data1 62
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 18
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 123
	.data1 168
	.data1 92
	.data1 40
	.data1 71
	.data1 72
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 0
	.data1 10
	.data1 11
	.data1 126
	.data1 123
	.data1 149
	.data1 13
	.data1 50
	.data1 81
	.data1 82
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 2
	.data1 92
	.data1 10
	.data1 1
	.data1 127
	.data1 125
	.data1 142
	.data1 14
	.data1 90
	.data1 31
	.data1 22
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
	.data1 129
	.data1 13
	.data1 194
	.data1 18
	.data1 0
	.data1 41
	.data1 2
	.data1 43
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 103
	.data1 11
	.data1 12
	.data1 193
	.data1 196
	.data1 19
	.data1 10
	.data1 11
	.data1 2
	.data1 23
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 113
	.data1 14
	.data1 11
	.data1 20
	.data1 31
	.data1 2
	.data1 33
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 101
	.data1 11
	.data1 12
	.data1 13
	.data1 12
	.data1 12
	.data1 30
	.data1 41
	.data1 2
	.data1 43
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 92
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 13
	.data1 11
	.data1 13

pix3::                                  ## @pix3
	.data1 0
	.data1 11
	.data1 22
	.data1 33
	.data1 44
	.data1 55
	.data1 66
	.data1 77
	.data1 88
	.data1 99
	.data1 10
	.data1 111
	.data1 12
	.data1 13
	.data1 14
	.data1 15
	.data1 10
	.data1 21
	.data1 32
	.data1 43
	.data1 54
	.data1 65
	.data1 76
	.data1 87
	.data1 98
	.data1 9
	.data1 110
	.data1 11
	.data1 12
	.data1 13
	.data1 14
	.data1 15
	.data1 20
	.data1 31
	.data1 42
	.data1 53
	.data1 64
	.data1 75
	.data1 86
	.data1 97
	.data1 8
	.data1 19
	.data1 120
	.data1 11
	.data1 12
	.data1 13
	.data1 14
	.data1 15
	.data1 10
	.data1 21
	.data1 42
	.data1 34
	.data1 44
	.data1 55
	.data1 66
	.data1 77
	.data1 88
	.data1 99
	.data1 110
	.data1 11
	.data1 142
	.data1 13
	.data1 14
	.data1 15
	.data1 60
	.data1 91
	.data1 92
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 114
	.data1 122
	.data1 13
	.data1 15
	.data1 115
	.data1 70
	.data1 1
	.data1 20
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 130
	.data1 113
	.data1 121
	.data1 13
	.data1 142
	.data1 126
	.data1 80
	.data1 21
	.data1 62
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 28
	.data1 9
	.data1 150
	.data1 11
	.data1 12
	.data1 193
	.data1 154
	.data1 117
	.data1 20
	.data1 41
	.data1 52
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 84
	.data1 95
	.data1 10
	.data1 11
	.data1 12
	.data1 113
	.data1 149
	.data1 121
	.data1 30
	.data1 61
	.data1 62
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 183
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 123
	.data1 168
	.data1 92
	.data1 40
	.data1 71
	.data1 72
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 0
	.data1 10
	.data1 11
	.data1 126
	.data1 123
	.data1 149
	.data1 13
	.data1 50
	.data1 81
	.data1 82
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 2
	.data1 92
	.data1 10
	.data1 1
	.data1 127
	.data1 125
	.data1 142
	.data1 14
	.data1 90
	.data1 31
	.data1 22
	.data1 3
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 92
	.data1 10
	.data1 11
	.data1 129
	.data1 13
	.data1 194
	.data1 18
	.data1 0
	.data1 41
	.data1 2
	.data1 43
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 91
	.data1 103
	.data1 11
	.data1 12
	.data1 193
	.data1 196
	.data1 19
	.data1 10
	.data1 11
	.data1 2
	.data1 23
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 113
	.data1 14
	.data1 11
	.data1 20
	.data1 31
	.data1 2
	.data1 33
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 8
	.data1 9
	.data1 101
	.data1 11
	.data1 12
	.data1 13
	.data1 12
	.data1 12
	.data1 30
	.data1 41
	.data1 2
	.data1 43
	.data1 4
	.data1 5
	.data1 6
	.data1 7
	.data1 92
	.data1 9
	.data1 10
	.data1 11
	.data1 12
	.data1 13
	.data1 11
	.data1 13

	.align	2                       ## @scores_temp
scores_temp::
	.data4	10370                   ## 0x2882
	.data4	7067                    ## 0x1b9b
	.data4	8000                    ## 0x1f40
	.data4	8492                    ## 0x212c

.section .bss .section .data
	.align	2                       ## @scores
scores::
	.skip	16

	.section	.data
.str::                                  ## @.str
	.data1 54
	.data1 54
	.data1 54
	.data1 10
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
