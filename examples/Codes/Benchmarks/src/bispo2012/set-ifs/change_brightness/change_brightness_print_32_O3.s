.section .text
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @change_brightness
change_brightness::
## BB#0:                                ## %entry
	c0	cmplt $b0.0 = $r0.5, 1
;;
	c0	br $b0.0, LBB0_20
;;
## BB#1:                                ## %for.body.lr.ph
	c0	mov $r0.11 = 7
;;
	c0	shr $r0.11 = $r0.6, $r0.11
;;
	c0	add $r0.12 = $r0.6, $r0.11
	c0	cmpgt $b0.0 = $r0.6, 0
;;
	c0	xor $r0.11 = $r0.12, $r0.11
;;
	c0	zxtb $r0.11 = $r0.11
	c0	brf $b0.0, LBB0_2
;;
## BB#10:                               ## %for.inc.us.preheader
	c0	mov $r0.15 = 0
	c0	cmpeq $b0.0 = $r0.5, 0
	c0	mov $r0.12 = $r0.3
	c0	mov $r0.13 = $r0.4
;;
	c0	br $b0.0, LBB0_17
;;
## BB#11:                               ## %overflow.checked82
	c0	and $r0.14 = $r0.5, -4
	c0	mov $r0.15 = 0
;;
	c0	cmpeq $b0.0 = $r0.14, 0
	c0	mov $r0.12 = $r0.3
	c0	mov $r0.13 = $r0.4
;;
	c0	br $b0.0, LBB0_16
;;
## BB#12:                               ## %vector.memcheck89
	c0	add $r0.12 = $r0.5, -1
;;
	c0	add $r0.13 = $r0.3, $r0.12
;;
	c0	cmpltu $b0.0 = $r0.13, $r0.4
;;
	c0	br $b0.0, LBB0_14
;;
## BB#13:                               ## %vector.memcheck89
	c0	add $r0.12 = $r0.4, $r0.12
;;
	c0	cmpgeu $b0.0 = $r0.12, $r0.3
	c0	mov $r0.12 = $r0.3
	c0	mov $r0.13 = $r0.4
;;
	c0	br $b0.0, LBB0_16
;;
LBB0_14::                               ## %vector.ph72
	c0	add $r0.13 = $r0.4, $r0.14
	c0	add $r0.12 = $r0.3, $r0.14
	c0	and $r0.16 = $r0.5, -4
	c0	mov $r0.17 = $r0.3
;;
	c0	mov $r0.18 = $r0.4
;;
LBB0_15::                               ## %vector.body73
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldbu $r0.15 = 2[$r0.17]
;;
	c0	ldbu $r0.19 = 0[$r0.17]
;;
	c0	add $r0.19 = $r0.19, $r0.11
	c0	add $r0.15 = $r0.15, $r0.11
	c0	ldbu $r0.20 = 1[$r0.17]
;;
	c0	add $r0.20 = $r0.20, $r0.11
	c0	ldbu $r0.21 = 3[$r0.17]
;;
	c0	add $r0.21 = $r0.21, $r0.11
;;
	c0	min $r0.21 = $r0.21, 255
	c0	add $r0.22 = $r0.18, 4
	c0	min $r0.15 = $r0.15, 255
	c0	min $r0.19 = $r0.19, 255
;;
	c0	add $r0.17 = $r0.17, 4
	c0	min $r0.20 = $r0.20, 255
	c0	add $r0.16 = $r0.16, -4
	c0	stb 3[$r0.18] = $r0.21
;;
	c0	stb 2[$r0.18] = $r0.15
;;
	c0	stb 1[$r0.18] = $r0.20
;;
	c0	stb 0[$r0.18] = $r0.19
	c0	cmpne $b0.0 = $r0.16, 0
	c0	mov $r0.18 = $r0.22
	c0	mov $r0.15 = $r0.14
;;
	c0	br $b0.0, LBB0_15
;;
LBB0_16::                               ## %middle.block74
	c0	cmpeq $b0.0 = $r0.15, $r0.5
;;
	c0	br $b0.0, LBB0_20
;;
LBB0_17::                               ## %for.inc.us.preheader136
	c0	sub $r0.14 = $r0.5, $r0.15
	c0	mov $r0.15 = -1
;;
LBB0_18::                               ## %for.inc.us
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldbu $r0.16 = 0[$r0.12]
;;
	c0	add $r0.16 = $r0.16, $r0.11
	c0	add $r0.14 = $r0.14, -1
;;
	c0	cmpgt $b0.0 = $r0.16, 255
	c0	add $r0.17 = $r0.13, 1
	c0	add $r0.12 = $r0.12, 1
;;
	c0	slct $r0.16 = $b0.0, $r0.15, $r0.16
;;
	c0	stb 0[$r0.13] = $r0.16
	c0	cmpeq $b0.0 = $r0.14, 0
	c0	mov $r0.13 = $r0.17
;;
	c0	br $b0.0, LBB0_20
;;
	c0	goto LBB0_18
;;
LBB0_2::                                ## %for.inc.preheader
	c0	mov $r0.15 = 0
	c0	cmpne $b0.0 = $r0.5, 0
	c0	mov $r0.12 = $r0.3
	c0	mov $r0.13 = $r0.4
;;
	c0	brf $b0.0, LBB0_3
;;
## BB#4:                                ## %overflow.checked
	c0	and $r0.14 = $r0.5, -4
	c0	mov $r0.15 = 0
;;
	c0	cmpeq $b0.0 = $r0.14, 0
	c0	mov $r0.12 = $r0.3
	c0	mov $r0.13 = $r0.4
;;
	c0	br $b0.0, LBB0_9
;;
## BB#5:                                ## %vector.memcheck
	c0	add $r0.12 = $r0.5, -1
;;
	c0	add $r0.13 = $r0.3, $r0.12
;;
	c0	cmpltu $b0.0 = $r0.13, $r0.4
;;
	c0	br $b0.0, LBB0_7
;;
## BB#6:                                ## %vector.memcheck
	c0	add $r0.12 = $r0.4, $r0.12
;;
	c0	cmpgeu $b0.0 = $r0.12, $r0.3
	c0	mov $r0.12 = $r0.3
	c0	mov $r0.13 = $r0.4
;;
	c0	br $b0.0, LBB0_9
;;
LBB0_7::                                ## %vector.ph
	c0	add $r0.13 = $r0.4, $r0.14
	c0	add $r0.12 = $r0.3, $r0.14
	c0	and $r0.16 = $r0.5, -4
	c0	mov $r0.17 = $r0.3
;;
	c0	mov $r0.18 = $r0.4
;;
LBB0_8::                                ## %vector.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldbu $r0.15 = 2[$r0.17]
;;
	c0	ldbu $r0.19 = 0[$r0.17]
;;
	c0	sub $r0.19 = $r0.19, $r0.11
	c0	sub $r0.15 = $r0.15, $r0.11
	c0	ldbu $r0.20 = 1[$r0.17]
;;
	c0	sub $r0.20 = $r0.20, $r0.11
	c0	ldbu $r0.21 = 3[$r0.17]
;;
	c0	sub $r0.21 = $r0.21, $r0.11
;;
	c0	max $r0.21 = $r0.21, 0
	c0	add $r0.22 = $r0.18, 4
	c0	max $r0.15 = $r0.15, 0
	c0	max $r0.19 = $r0.19, 0
;;
	c0	add $r0.17 = $r0.17, 4
	c0	max $r0.20 = $r0.20, 0
	c0	add $r0.16 = $r0.16, -4
	c0	stb 3[$r0.18] = $r0.21
;;
	c0	stb 2[$r0.18] = $r0.15
;;
	c0	stb 1[$r0.18] = $r0.20
;;
	c0	stb 0[$r0.18] = $r0.19
	c0	cmpne $b0.0 = $r0.16, 0
	c0	mov $r0.18 = $r0.22
	c0	mov $r0.15 = $r0.14
;;
	c0	br $b0.0, LBB0_8
;;
LBB0_9::                                ## %middle.block
	c0	cmpeq $b0.0 = $r0.15, $r0.5
;;
	c0	br $b0.0, LBB0_20
;;
LBB0_3::                                ## %for.inc.preheader137
	c0	sub $r0.14 = $r0.5, $r0.15
;;
LBB0_19::                               ## %for.inc
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldbu $r0.15 = 0[$r0.12]
;;
	c0	sub $r0.15 = $r0.15, $r0.11
	c0	add $r0.14 = $r0.14, -1
	c0	add $r0.12 = $r0.12, 1
	c0	add $r0.16 = $r0.13, 1
;;
	c0	max $r0.15 = $r0.15, 0
;;
	c0	stb 0[$r0.13] = $r0.15
	c0	cmpne $b0.0 = $r0.14, 0
	c0	mov $r0.13 = $r0.16
;;
	c0	br $b0.0, LBB0_19
;;
LBB0_20::                               ## %for.end
.return ret($r0.3:s32)
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
;;
	c0	stw 20[$r0.1] = $r0.58
	c0	mov $r0.11 = 0
	c0	mov $r0.12 = deltas
;;
	c0	mov $r0.13 = 7
	c0	mov $r0.14 = image1
;;
	c0	mov $r0.57 = imageR
	c0	mov $r0.15 = $r0.11
;;
LBB1_1::                                ## %for.body
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_2 Depth 2
                                        ##     Child Loop BB1_3 Depth 2
	c0	add $r0.16 = $r0.12, $r0.15
;;
	c0	ldb $r0.16 = 0[$r0.16]
;;
	c0	shr $r0.17 = $r0.16, $r0.13
;;
	c0	add $r0.18 = $r0.16, $r0.17
;;
	c0	xor $r0.17 = $r0.18, $r0.17
	c0	cmpgt $b0.0 = $r0.16, 0
;;
	c0	zxtb $r0.16 = $r0.17
	c0	mov $r0.17 = $r0.11
	c0	mov $r0.18 = $r0.11
	c0	brf $b0.0, LBB1_2
;;
LBB1_3::                                ## %vector.body
                                        ##   Parent Loop BB1_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	add $r0.17 = $r0.14, $r0.18
;;
	c0	ldbu $r0.19 = 3[$r0.17]
;;
	c0	add $r0.19 = $r0.19, $r0.16
	c0	ldbu $r0.20 = 2[$r0.17]
	c0	add $r0.21 = $r0.18, 4
;;
	c0	add $r0.20 = $r0.20, $r0.16
	c0	ldbu $r0.22 = 0[$r0.17]
	c0	add $r0.18 = $r0.57, $r0.18
	c0	min $r0.19 = $r0.19, 255
;;
	c0	add $r0.22 = $r0.22, $r0.16
	c0	ldbu $r0.17 = 1[$r0.17]
	c0	min $r0.20 = $r0.20, 255
;;
	c0	add $r0.17 = $r0.17, $r0.16
	c0	min $r0.22 = $r0.22, 255
;;
	c0	min $r0.17 = $r0.17, 255
	c0	stb 3[$r0.18] = $r0.19
;;
	c0	stb 2[$r0.18] = $r0.20
	c0	cmpne $b0.0 = $r0.21, 100
;;
	c0	stb 0[$r0.18] = $r0.22
;;
	c0	stb 1[$r0.18] = $r0.17
	c0	mov $r0.18 = $r0.21
	c0	br $b0.0, LBB1_3
;;
	c0	goto LBB1_4
;;
LBB1_2::                                ## %vector.body44
                                        ##   Parent Loop BB1_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	add $r0.18 = $r0.14, $r0.17
;;
	c0	ldbu $r0.19 = 3[$r0.18]
;;
	c0	sub $r0.19 = $r0.19, $r0.16
	c0	ldbu $r0.20 = 2[$r0.18]
	c0	add $r0.21 = $r0.17, 4
;;
	c0	sub $r0.20 = $r0.20, $r0.16
	c0	ldbu $r0.22 = 0[$r0.18]
	c0	add $r0.17 = $r0.57, $r0.17
	c0	max $r0.19 = $r0.19, 0
;;
	c0	sub $r0.22 = $r0.22, $r0.16
	c0	ldbu $r0.18 = 1[$r0.18]
	c0	max $r0.20 = $r0.20, 0
;;
	c0	sub $r0.18 = $r0.18, $r0.16
	c0	max $r0.22 = $r0.22, 0
;;
	c0	max $r0.18 = $r0.18, 0
	c0	stb 3[$r0.17] = $r0.19
;;
	c0	stb 2[$r0.17] = $r0.20
	c0	cmpeq $b0.0 = $r0.21, 100
;;
	c0	stb 0[$r0.17] = $r0.22
;;
	c0	stb 1[$r0.17] = $r0.18
	c0	mov $r0.17 = $r0.21
	c0	brf $b0.0, LBB1_2
;;
LBB1_4::                                ## %change_brightness.exit
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	add $r0.15 = $r0.15, 1
;;
	c0	cmpne $b0.0 = $r0.15, 10
;;
	c0	br $b0.0, LBB1_1
;;
LBB1_5::                                ## %for.body3
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.58 = $r0.11, 1
	c0	mov $r0.3 = .str
	c0	add $r0.11 = $r0.57, $r0.11
;;
	c0	ldbu $r0.4 = 0[$r0.11]
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	cmpne $b0.0 = $r0.58, 100
	c0	mov $r0.11 = $r0.58
;;
	c0	br $b0.0, LBB1_5
;;
## BB#6:                                ## %for.end7
	c0	mov $r0.3 = 0
	c0	ldw $r0.58 = 20[$r0.1]
;;
	c0	ldw $r0.57 = 24[$r0.1]
;;
	c0	ldw $l0.0 = 28[$r0.1]
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .data
image1::                                ## @image1
	.data1 96
	.data1 56
	.data1 122
	.data1 190
	.data1 246
	.data1 58
	.data1 183
	.data1 3
	.data1 62
	.data1 109
	.data1 43
	.data1 75
	.data1 35
	.data1 77
	.data1 47
	.data1 88
	.data1 8
	.data1 7
	.data1 242
	.data1 241
	.data1 15
	.data1 112
	.data1 88
	.data1 246
	.data1 152
	.data1 56
	.data1 31
	.data1 180
	.data1 8
	.data1 95
	.data1 67
	.data1 122
	.data1 203
	.data1 231
	.data1 164
	.data1 108
	.data1 155
	.data1 202
	.data1 229
	.data1 150
	.data1 1
	.data1 46
	.data1 150
	.data1 68
	.data1 28
	.data1 214
	.data1 148
	.data1 144
	.data1 160
	.data1 220
	.data1 175
	.data1 59
	.data1 33
	.data1 157
	.data1 142
	.data1 192
	.data1 145
	.data1 243
	.data1 207
	.data1 166
	.data1 7
	.data1 169
	.data1 114
	.data1 21
	.data1 193
	.data1 43
	.data1 119
	.data1 172
	.data1 108
	.data1 125
	.data1 196
	.data1 145
	.data1 162
	.data1 110
	.data1 76
	.data1 201
	.data1 179
	.data1 12
	.data1 110
	.data1 200
	.data1 167
	.data1 90
	.data1 154
	.data1 75
	.data1 131
	.data1 64
	.data1 58
	.data1 102
	.data1 203
	.data1 194
	.data1 206
	.data1 216
	.data1 72
	.data1 116
	.data1 89
	.data1 166
	.data1 11
	.data1 45
	.data1 251
	.data1 230

imageR::                                ## @imageR
	.data1 115
	.data1 216
	.data1 111
	.data1 146
	.data1 252
	.data1 240
	.data1 229
	.data1 221
	.data1 213
	.data1 104
	.data1 114
	.data1 18
	.data1 186
	.data1 126
	.data1 180
	.data1 228
	.data1 177
	.data1 252
	.data1 169
	.data1 59
	.data1 129
	.data1 152
	.data1 61
	.data1 54
	.data1 100
	.data1 158
	.data1 36
	.data1 115
	.data1 251
	.data1 204
	.data1 234
	.data1 141
	.data1 129
	.data1 124
	.data1 71
	.data1 230
	.data1 67
	.data1 8
	.data1 183
	.data1 165
	.data1 79
	.data1 105
	.data1 74
	.data1 2
	.data1 107
	.data1 33
	.data1 184
	.data1 192
	.data1 73
	.data1 91
	.data1 184
	.data1 251
	.data1 248
	.data1 79
	.data1 145
	.data1 35
	.data1 156
	.data1 235
	.data1 240
	.data1 72
	.data1 97
	.data1 175
	.data1 252
	.data1 151
	.data1 172
	.data1 216
	.data1 168
	.data1 36
	.data1 147
	.data1 192
	.data1 71
	.data1 233
	.data1 143
	.data1 132
	.data1 101
	.data1 14
	.data1 112
	.data1 231
	.data1 211
	.data1 106
	.data1 144
	.data1 117
	.data1 3
	.data1 73
	.data1 75
	.data1 235
	.data1 150
	.data1 111
	.data1 174
	.data1 213
	.data1 51
	.data1 93
	.data1 109
	.data1 121
	.data1 154
	.data1 210
	.data1 26
	.data1 243
	.data1 248
	.data1 148

deltas::                                ## @deltas
	.data1 57
	.data1 248
	.data1 144
	.data1 23
	.data1 234
	.data1 205
	.data1 92
	.data1 78
	.data1 15
	.data1 121

	.section	.data
.str::                                  ## @.str
	.data1 37
	.data1 108
	.data1 117
	.data1 44
	.data1 32
	.data1 0


.import printf
.type printf, @function
.import puts
.type puts, @function
