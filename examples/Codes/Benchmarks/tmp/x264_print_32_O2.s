.section .text
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @abs
abs::
## BB#0:                                ## %entry
	c0	mov $r0.11 = 31
;;
	c0	shr $r0.11 = $r0.3, $r0.11
;;
	c0	add $r0.12 = $r0.3, $r0.11
;;
.return ret($r0.3:s32)
	c0	xor $r0.3 = $r0.12, $r0.11
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @main
main::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $l0.0
;;
	c0	stw 24[$r0.1] = $r0.57
	c0	mov $r0.11 = 0
	c0	mov $r0.12 = pix0
;;
	c0	mov $r0.13 = fenc
	c0	mov $r0.14 = 31
;;
	c0	mov $r0.15 = pix1
	c0	mov $r0.16 = scores
;;
	c0	mov $r0.17 = pix2
	c0	mov $r0.18 = pix3
;;
	c0	mov $r0.19 = $r0.11
;;
LBB1_1::                                ## %for.cond1.preheader.i.i.preheader
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_6 Depth 2
                                        ##       Child Loop BB1_7 Depth 3
                                        ##     Child Loop BB1_10 Depth 2
                                        ##       Child Loop BB1_11 Depth 3
                                        ##     Child Loop BB1_14 Depth 2
                                        ##       Child Loop BB1_15 Depth 3
                                        ##     Child Loop BB1_18 Depth 2
                                        ##       Child Loop BB1_19 Depth 3
	c0	mov $r0.21 = $r0.11
	c0	mov $r0.20 = $r0.11
	c0	mov $r0.22 = $r0.13
	c0	mov $r0.23 = $r0.12
;;
LBB1_6::                                ## %for.cond1.preheader.i.i
                                        ##   Parent Loop BB1_1 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB1_7 Depth 3
	c0	mov $r0.24 = $r0.11
;;
LBB1_7::                                ## %for.body3.i.i
                                        ##   Parent Loop BB1_1 Depth=1
                                        ##     Parent Loop BB1_6 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	c0	add $r0.25 = $r0.23, $r0.24
	c0	add $r0.26 = $r0.22, $r0.24
;;
	c0	ldbu $r0.25 = 0[$r0.25]
	c0	add $r0.24 = $r0.24, 1
;;
	c0	ldbu $r0.26 = 0[$r0.26]
;;
	c0	sub $r0.25 = $r0.26, $r0.25
;;
	c0	shr $r0.26 = $r0.25, $r0.14
;;
	c0	add $r0.25 = $r0.25, $r0.26
;;
	c0	xor $r0.25 = $r0.25, $r0.26
	c0	cmpne $b0.0 = $r0.24, 16
;;
	c0	add $r0.20 = $r0.25, $r0.20
	c0	br $b0.0, LBB1_7
;;
## BB#8:                                ## %for.end.i.i
                                        ##   in Loop: Header=BB1_6 Depth=2
	c0	add $r0.21 = $r0.21, 1
	c0	add $r0.22 = $r0.22, 16
	c0	add $r0.23 = $r0.23, 16
;;
	c0	cmpne $b0.0 = $r0.21, 16
;;
	c0	br $b0.0, LBB1_6
;;
## BB#9:                                ## %x264_pixel_sad_16x16.exit.i
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	stw 0[$r0.16] = $r0.20
	c0	mov $r0.22 = $r0.11
	c0	mov $r0.21 = $r0.11
	c0	mov $r0.23 = $r0.13
;;
	c0	mov $r0.24 = $r0.15
;;
LBB1_10::                               ## %for.cond1.preheader.i53.i
                                        ##   Parent Loop BB1_1 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB1_11 Depth 3
	c0	mov $r0.25 = $r0.11
;;
LBB1_11::                               ## %for.body3.i66.i
                                        ##   Parent Loop BB1_1 Depth=1
                                        ##     Parent Loop BB1_10 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	c0	add $r0.26 = $r0.24, $r0.25
	c0	add $r0.27 = $r0.23, $r0.25
;;
	c0	ldbu $r0.26 = 0[$r0.26]
	c0	add $r0.25 = $r0.25, 1
;;
	c0	ldbu $r0.27 = 0[$r0.27]
;;
	c0	sub $r0.26 = $r0.27, $r0.26
;;
	c0	shr $r0.27 = $r0.26, $r0.14
;;
	c0	add $r0.26 = $r0.26, $r0.27
;;
	c0	xor $r0.26 = $r0.26, $r0.27
	c0	cmpne $b0.0 = $r0.25, 16
;;
	c0	add $r0.21 = $r0.26, $r0.21
	c0	br $b0.0, LBB1_11
;;
## BB#12:                               ## %for.end.i71.i
                                        ##   in Loop: Header=BB1_10 Depth=2
	c0	add $r0.22 = $r0.22, 1
	c0	add $r0.23 = $r0.23, 16
	c0	add $r0.24 = $r0.24, 16
;;
	c0	cmpne $b0.0 = $r0.22, 16
;;
	c0	br $b0.0, LBB1_10
;;
## BB#13:                               ## %x264_pixel_sad_16x16.exit72.i
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	stw 4[$r0.16] = $r0.21
	c0	mov $r0.23 = $r0.11
	c0	mov $r0.22 = $r0.11
	c0	mov $r0.24 = $r0.13
;;
	c0	mov $r0.25 = $r0.17
;;
LBB1_14::                               ## %for.cond1.preheader.i29.i
                                        ##   Parent Loop BB1_1 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB1_15 Depth 3
	c0	mov $r0.26 = $r0.11
;;
LBB1_15::                               ## %for.body3.i42.i
                                        ##   Parent Loop BB1_1 Depth=1
                                        ##     Parent Loop BB1_14 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	c0	add $r0.27 = $r0.25, $r0.26
	c0	add $r0.28 = $r0.24, $r0.26
;;
	c0	ldbu $r0.27 = 0[$r0.27]
	c0	add $r0.26 = $r0.26, 1
;;
	c0	ldbu $r0.28 = 0[$r0.28]
;;
	c0	sub $r0.27 = $r0.28, $r0.27
;;
	c0	shr $r0.28 = $r0.27, $r0.14
;;
	c0	add $r0.27 = $r0.27, $r0.28
;;
	c0	xor $r0.27 = $r0.27, $r0.28
	c0	cmpne $b0.0 = $r0.26, 16
;;
	c0	add $r0.22 = $r0.27, $r0.22
	c0	br $b0.0, LBB1_15
;;
## BB#16:                               ## %for.end.i47.i
                                        ##   in Loop: Header=BB1_14 Depth=2
	c0	add $r0.23 = $r0.23, 1
	c0	add $r0.24 = $r0.24, 16
	c0	add $r0.25 = $r0.25, 16
;;
	c0	cmpne $b0.0 = $r0.23, 16
;;
	c0	br $b0.0, LBB1_14
;;
## BB#17:                               ## %x264_pixel_sad_16x16.exit48.i
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	stw 8[$r0.16] = $r0.22
	c0	mov $r0.24 = $r0.11
	c0	mov $r0.23 = $r0.11
	c0	mov $r0.25 = $r0.13
;;
	c0	mov $r0.26 = $r0.18
;;
LBB1_18::                               ## %for.cond1.preheader.i5.i
                                        ##   Parent Loop BB1_1 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB1_19 Depth 3
	c0	mov $r0.27 = $r0.11
;;
LBB1_19::                               ## %for.body3.i18.i
                                        ##   Parent Loop BB1_1 Depth=1
                                        ##     Parent Loop BB1_18 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	c0	add $r0.28 = $r0.26, $r0.27
	c0	add $r0.29 = $r0.25, $r0.27
;;
	c0	ldbu $r0.28 = 0[$r0.28]
	c0	add $r0.27 = $r0.27, 1
;;
	c0	ldbu $r0.29 = 0[$r0.29]
;;
	c0	sub $r0.28 = $r0.29, $r0.28
;;
	c0	shr $r0.29 = $r0.28, $r0.14
;;
	c0	add $r0.28 = $r0.28, $r0.29
;;
	c0	xor $r0.28 = $r0.28, $r0.29
	c0	cmpne $b0.0 = $r0.27, 16
;;
	c0	add $r0.23 = $r0.28, $r0.23
	c0	br $b0.0, LBB1_19
;;
## BB#20:                               ## %for.end.i23.i
                                        ##   in Loop: Header=BB1_18 Depth=2
	c0	add $r0.24 = $r0.24, 1
	c0	add $r0.25 = $r0.25, 16
	c0	add $r0.26 = $r0.26, 16
;;
	c0	cmpne $b0.0 = $r0.24, 16
;;
	c0	br $b0.0, LBB1_18
;;
## BB#21:                               ## %x264_pixel_sad_x4_16x16.exit
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	add $r0.19 = $r0.19, 1
	c0	stw 12[$r0.16] = $r0.23
;;
	c0	cmpeq $b0.0 = $r0.19, 1000
;;
	c0	brf $b0.0, LBB1_1
;;
## BB#2:                                ## %for.cond1.preheader
	c0	mov $r0.11 = scores_temp
;;
	c0	ldw $r0.12 = 0[$r0.11]
;;
	c0	cmpne $b0.0 = $r0.20, $r0.12
;;
	c0	br $b0.0, LBB1_22
;;
## BB#3:                                ## %for.cond1.preheader
	c0	ldw $r0.12 = 4[$r0.11]
;;
	c0	cmpne $b0.0 = $r0.21, $r0.12
;;
	c0	br $b0.0, LBB1_22
;;
## BB#4:                                ## %for.cond1.preheader
	c0	ldw $r0.12 = 8[$r0.11]
;;
	c0	cmpne $b0.0 = $r0.22, $r0.12
;;
	c0	br $b0.0, LBB1_22
;;
## BB#5:                                ## %for.cond1.preheader
	c0	ldw $r0.11 = 12[$r0.11]
;;
	c0	cmpeq $b0.0 = $r0.23, $r0.11
;;
	c0	brf $b0.0, LBB1_22
;;
## BB#24:                               ## %for.cond1.3
	c0	mov $r0.57 = -1
	c0	mov $r0.3 = str
;;
.call puts, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = puts
;;
	c0	goto LBB1_23
;;
LBB1_22::                               ## %if.then
	c0	mov $r0.57 = 666
	c0	mov $r0.3 = str2
;;
.call puts, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = puts
;;
LBB1_23::                               ## %return
	c0	mov $r0.3 = $r0.57
	c0	ldw $r0.57 = 24[$r0.1]
;;
	c0	ldw $l0.0 = 28[$r0.1]
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
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
	.align	2                       ## @str
str::
	.data1 45
	.data1 49
	.data1 0

	.align	2                       ## @str2
str2::
	.data1 54
	.data1 54
	.data1 54
	.data1 0


.import printf
.type printf, @function
.import puts
.type puts, @function
