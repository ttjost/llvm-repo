.section .text
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @compositing
compositing::
## BB#0:                                ## %entry
	c0	cmplt $b0.0 = $r0.6, 1
;;
	c0	br $b0.0, LBB0_10
;;
## BB#1:                                ## %for.body.lr.ph
	c0	mov $r0.18 = 0
	c0	cmpeq $b0.0 = $r0.6, 0
	c0	mov $r0.11 = $r0.3
	c0	mov $r0.12 = $r0.4
;;
	c0	mov $r0.13 = $r0.5
	c0	br $b0.0, LBB0_8
;;
## BB#2:                                ## %overflow.checked
	c0	and $r0.14 = $r0.6, -4
	c0	mov $r0.18 = 0
;;
	c0	cmpeq $b0.0 = $r0.14, 0
	c0	mov $r0.11 = $r0.3
	c0	mov $r0.12 = $r0.4
	c0	mov $r0.13 = $r0.5
;;
	c0	br $b0.0, LBB0_7
;;
## BB#3:                                ## %vector.memcheck
	c0	add $r0.15 = $r0.6, -1
;;
	c0	add $r0.16 = $r0.5, $r0.15
	c0	add $r0.11 = $r0.3, $r0.15
;;
	c0	cmpgeu $b0.0 = $r0.16, $r0.3
	c0	cmpgeu $b0.1 = $r0.11, $r0.5
;;
	c0	mfb $r0.11 = $b0.0
	c0	mfb $r0.12 = $b0.1
;;
	c0	and $r0.11 = $r0.12, $r0.11
;;
	c0	mtb $b0.0 = $r0.11
	c0	mov $r0.11 = $r0.3
	c0	mov $r0.12 = $r0.4
	c0	mov $r0.13 = $r0.5
;;
	c0	br $b0.0, LBB0_7
;;
## BB#4:                                ## %vector.memcheck
	c0	add $r0.11 = $r0.4, $r0.15
	c0	cmpgeu $b0.0 = $r0.16, $r0.4
;;
	c0	cmpgeu $b0.1 = $r0.11, $r0.5
	c0	mfb $r0.11 = $b0.0
;;
	c0	mfb $r0.12 = $b0.1
;;
	c0	and $r0.11 = $r0.12, $r0.11
;;
	c0	mtb $b0.0 = $r0.11
	c0	mov $r0.11 = $r0.3
	c0	mov $r0.12 = $r0.4
	c0	mov $r0.13 = $r0.5
;;
	c0	br $b0.0, LBB0_7
;;
## BB#5:                                ## %vector.ph
	c0	add $r0.12 = $r0.4, $r0.14
	c0	add $r0.13 = $r0.5, $r0.14
	c0	add $r0.11 = $r0.3, $r0.14
	c0	and $r0.15 = $r0.6, -4
;;
	c0	mov $r0.16 = 8
	c0	mov $r0.17 = $r0.3
	c0	mov $r0.19 = $r0.4
	c0	mov $r0.20 = $r0.5
;;
LBB0_6::                                ## %vector.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldbu $r0.18 = 2[$r0.17]
;;
	c0	ldbu $r0.21 = 0[$r0.17]
;;
	c0	ldbu $r0.22 = 1[$r0.17]
;;
	c0	ldbu $r0.23 = 3[$r0.17]
;;
	c0	ldbu $r0.24 = 2[$r0.19]
;;
	c0	sub $r0.18 = $r0.18, $r0.24
	c0	ldbu $r0.25 = 3[$r0.19]
;;
	c0	sub $r0.23 = $r0.23, $r0.25
	c0	ldbu $r0.26 = 0[$r0.19]
	c0	max $r0.18 = $r0.18, 0
;;
	c0	sub $r0.21 = $r0.21, $r0.26
	c0	ldbu $r0.27 = 1[$r0.19]
	c0	mpylu $r0.28 = $r0.18, $r0.7
	c0	mpyhs $r0.18 = $r0.18, $r0.7
;;
	c0	sub $r0.22 = $r0.22, $r0.27
	c0	add $r0.18 = $r0.28, $r0.18
	c0	max $r0.23 = $r0.23, 0
	c0	max $r0.21 = $r0.21, 0
;;
	c0	mpylu $r0.28 = $r0.23, $r0.7
	c0	mpylu $r0.29 = $r0.21, $r0.7
	c0	max $r0.22 = $r0.22, 0
	c0	shr $r0.18 = $r0.18, $r0.16
;;
	c0	mpyhs $r0.21 = $r0.21, $r0.7
	c0	mpylu $r0.30 = $r0.22, $r0.7
	c0	add $r0.18 = $r0.18, $r0.24
;;
	c0	mpyhs $r0.22 = $r0.22, $r0.7
	c0	mpyhs $r0.23 = $r0.23, $r0.7
	c0	add $r0.21 = $r0.29, $r0.21
;;
	c0	add $r0.23 = $r0.28, $r0.23
	c0	add $r0.22 = $r0.30, $r0.22
	c0	shr $r0.21 = $r0.21, $r0.16
	c0	add $r0.17 = $r0.17, 4
;;
	c0	shr $r0.22 = $r0.22, $r0.16
	c0	shr $r0.23 = $r0.23, $r0.16
	c0	add $r0.21 = $r0.21, $r0.26
	c0	min $r0.18 = $r0.18, 255
;;
	c0	add $r0.23 = $r0.23, $r0.25
	c0	add $r0.22 = $r0.22, $r0.27
	c0	min $r0.21 = $r0.21, 255
	c0	add $r0.24 = $r0.20, 4
;;
	c0	min $r0.23 = $r0.23, 255
	c0	min $r0.22 = $r0.22, 255
	c0	add $r0.19 = $r0.19, 4
	c0	add $r0.15 = $r0.15, -4
;;
	c0	stb 3[$r0.20] = $r0.23
;;
	c0	stb 2[$r0.20] = $r0.18
;;
	c0	stb 1[$r0.20] = $r0.22
;;
	c0	stb 0[$r0.20] = $r0.21
	c0	cmpne $b0.0 = $r0.15, 0
	c0	mov $r0.20 = $r0.24
	c0	mov $r0.18 = $r0.14
;;
	c0	br $b0.0, LBB0_6
;;
LBB0_7::                                ## %middle.block
	c0	cmpeq $b0.0 = $r0.18, $r0.6
;;
	c0	br $b0.0, LBB0_10
;;
LBB0_8::                                ## %for.body.preheader
	c0	sub $r0.14 = $r0.6, $r0.18
	c0	mov $r0.15 = 8
	c0	mov $r0.16 = -1
;;
LBB0_9::                                ## %for.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldbu $r0.17 = 0[$r0.11]
;;
	c0	ldbu $r0.18 = 0[$r0.12]
;;
	c0	sub $r0.17 = $r0.17, $r0.18
;;
	c0	max $r0.17 = $r0.17, 0
;;
	c0	mpyhs $r0.19 = $r0.17, $r0.7
	c0	mpylu $r0.17 = $r0.17, $r0.7
;;
	c0	add $r0.17 = $r0.17, $r0.19
;;
	c0	shr $r0.17 = $r0.17, $r0.15
	c0	add $r0.12 = $r0.12, 1
	c0	add $r0.19 = $r0.13, 1
	c0	add $r0.11 = $r0.11, 1
;;
	c0	add $r0.17 = $r0.17, $r0.18
	c0	add $r0.14 = $r0.14, -1
;;
	c0	cmpgt $b0.0 = $r0.17, 255
;;
	c0	slct $r0.17 = $b0.0, $r0.16, $r0.17
;;
	c0	stb 0[$r0.13] = $r0.17
	c0	cmpne $b0.0 = $r0.14, 0
	c0	mov $r0.13 = $r0.19
;;
	c0	br $b0.0, LBB0_9
;;
LBB0_10::                               ## %for.end
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
	c0	mov $r0.12 = fades
;;
	c0	mov $r0.13 = image2
	c0	mov $r0.14 = image1
;;
	c0	mov $r0.15 = 8
	c0	mov $r0.57 = imageR
	c0	mov $r0.16 = $r0.11
;;
LBB1_1::                                ## %for.body
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_2 Depth 2
	c0	add $r0.17 = $r0.12, $r0.16
;;
	c0	ldbu $r0.17 = 0[$r0.17]
	c0	mov $r0.18 = $r0.11
;;
LBB1_2::                                ## %vector.body
                                        ##   Parent Loop BB1_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	add $r0.19 = $r0.14, $r0.18
	c0	add $r0.20 = $r0.13, $r0.18
;;
	c0	ldbu $r0.21 = 3[$r0.19]
;;
	c0	ldbu $r0.22 = 0[$r0.19]
;;
	c0	ldbu $r0.23 = 1[$r0.19]
	c0	add $r0.24 = $r0.18, 4
;;
	c0	ldbu $r0.19 = 2[$r0.19]
	c0	add $r0.18 = $r0.57, $r0.18
;;
	c0	ldbu $r0.25 = 0[$r0.20]
;;
	c0	sub $r0.22 = $r0.22, $r0.25
	c0	ldbu $r0.26 = 3[$r0.20]
;;
	c0	sub $r0.21 = $r0.21, $r0.26
	c0	ldbu $r0.27 = 1[$r0.20]
	c0	max $r0.22 = $r0.22, 0
;;
	c0	sub $r0.23 = $r0.23, $r0.27
	c0	ldbu $r0.20 = 2[$r0.20]
	c0	mpylu $r0.28 = $r0.22, $r0.17
	c0	mpyhs $r0.22 = $r0.22, $r0.17
;;
	c0	sub $r0.19 = $r0.19, $r0.20
	c0	add $r0.22 = $r0.28, $r0.22
	c0	max $r0.21 = $r0.21, 0
	c0	max $r0.23 = $r0.23, 0
;;
	c0	mpylu $r0.28 = $r0.21, $r0.17
	c0	mpylu $r0.29 = $r0.23, $r0.17
	c0	max $r0.19 = $r0.19, 0
	c0	shr $r0.22 = $r0.22, $r0.15
;;
	c0	mpyhs $r0.23 = $r0.23, $r0.17
	c0	mpylu $r0.30 = $r0.19, $r0.17
	c0	add $r0.22 = $r0.22, $r0.25
;;
	c0	mpyhs $r0.19 = $r0.19, $r0.17
	c0	mpyhs $r0.21 = $r0.21, $r0.17
	c0	add $r0.23 = $r0.29, $r0.23
	c0	min $r0.22 = $r0.22, 255
;;
	c0	add $r0.21 = $r0.28, $r0.21
	c0	add $r0.19 = $r0.30, $r0.19
	c0	shr $r0.23 = $r0.23, $r0.15
;;
	c0	shr $r0.19 = $r0.19, $r0.15
	c0	shr $r0.21 = $r0.21, $r0.15
	c0	add $r0.23 = $r0.23, $r0.27
;;
	c0	add $r0.21 = $r0.21, $r0.26
	c0	add $r0.19 = $r0.19, $r0.20
	c0	min $r0.20 = $r0.23, 255
;;
	c0	stb 1[$r0.18] = $r0.20
	c0	min $r0.20 = $r0.21, 255
	c0	min $r0.19 = $r0.19, 255
;;
	c0	stb 0[$r0.18] = $r0.22
	c0	cmpne $b0.0 = $r0.24, 200
;;
	c0	stb 2[$r0.18] = $r0.19
;;
	c0	stb 3[$r0.18] = $r0.20
	c0	mov $r0.18 = $r0.24
	c0	br $b0.0, LBB1_2
;;
## BB#3:                                ## %compositing.exit
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	add $r0.16 = $r0.16, 1
;;
	c0	cmpne $b0.0 = $r0.16, 10
;;
	c0	br $b0.0, LBB1_1
;;
LBB1_4::                                ## %for.body3
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
	c0	cmpne $b0.0 = $r0.58, 200
	c0	mov $r0.11 = $r0.58
;;
	c0	br $b0.0, LBB1_4
;;
## BB#5:                                ## %for.end7
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
	.data1 177
	.data1 250
	.data1 223
	.data1 219
	.data1 231
	.data1 86
	.data1 86
	.data1 66
	.data1 48
	.data1 151
	.data1 68
	.data1 235
	.data1 229
	.data1 170
	.data1 186
	.data1 138
	.data1 125
	.data1 2
	.data1 228
	.data1 206
	.data1 14
	.data1 205
	.data1 37
	.data1 179
	.data1 20
	.data1 104
	.data1 128
	.data1 20
	.data1 112
	.data1 21
	.data1 57
	.data1 131
	.data1 178
	.data1 235
	.data1 187
	.data1 92
	.data1 154
	.data1 13
	.data1 188
	.data1 23
	.data1 219
	.data1 30
	.data1 158
	.data1 222
	.data1 35
	.data1 244
	.data1 24
	.data1 95
	.data1 87
	.data1 139
	.data1 21
	.data1 226
	.data1 35
	.data1 59
	.data1 220
	.data1 157
	.data1 177
	.data1 45
	.data1 112
	.data1 71
	.data1 183
	.data1 11
	.data1 57
	.data1 234
	.data1 183
	.data1 246
	.data1 227
	.data1 253
	.data1 130
	.data1 189
	.data1 133
	.data1 177
	.data1 253
	.data1 74
	.data1 6
	.data1 139
	.data1 39
	.data1 95
	.data1 188
	.data1 50
	.data1 90
	.data1 130
	.data1 85
	.data1 138
	.data1 208
	.data1 54
	.data1 250
	.data1 0
	.data1 104
	.data1 107
	.data1 177
	.data1 39
	.data1 170
	.data1 54
	.data1 2
	.data1 132
	.data1 8
	.data1 196
	.data1 221
	.data1 165

image2::                                ## @image2
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
	.data1 148
	.data1 161
	.data1 124
	.data1 111
	.data1 188
	.data1 192
	.data1 41
	.data1 126
	.data1 111
	.data1 87
	.data1 238
	.data1 168
	.data1 175
	.data1 83
	.data1 243
	.data1 109
	.data1 35
	.data1 243
	.data1 53
	.data1 226
	.data1 193
	.data1 102
	.data1 84
	.data1 249
	.data1 201
	.data1 177
	.data1 171
	.data1 6
	.data1 244
	.data1 214
	.data1 161
	.data1 126
	.data1 237
	.data1 50
	.data1 62
	.data1 1
	.data1 0
	.data1 38
	.data1 1
	.data1 153
	.data1 16
	.data1 249
	.data1 239
	.data1 68
	.data1 206
	.data1 253
	.data1 239
	.data1 175
	.data1 40
	.data1 239
	.data1 85
	.data1 68
	.data1 254
	.data1 163
	.data1 187
	.data1 102
	.data1 27
	.data1 224
	.data1 23
	.data1 251
	.data1 98
	.data1 136
	.data1 10
	.data1 42
	.data1 71
	.data1 252
	.data1 118
	.data1 101
	.data1 129
	.data1 190
	.data1 82
	.data1 169
	.data1 253
	.data1 87
	.data1 192
	.data1 4
	.data1 21
	.data1 122
	.data1 95
	.data1 88
	.data1 1
	.data1 105
	.data1 222
	.data1 93
	.data1 141
	.data1 151
	.data1 209
	.data1 235
	.data1 12
	.data1 142
	.data1 199
	.data1 121
	.data1 140
	.data1 18
	.data1 155
	.data1 224
	.data1 74
	.data1 134
	.data1 10
	.data1 101

imageR::                                ## @imageR
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
	.data1 156
	.data1 189
	.data1 244
	.data1 236
	.data1 36
	.data1 64
	.data1 183
	.data1 30
	.data1 133
	.data1 94
	.data1 44
	.data1 31
	.data1 142
	.data1 117
	.data1 1
	.data1 109
	.data1 21
	.data1 55
	.data1 34
	.data1 133
	.data1 247
	.data1 84
	.data1 94
	.data1 188
	.data1 92
	.data1 120
	.data1 74
	.data1 78
	.data1 63
	.data1 120
	.data1 101
	.data1 183
	.data1 45
	.data1 199
	.data1 124
	.data1 65
	.data1 76
	.data1 46
	.data1 80
	.data1 222
	.data1 158
	.data1 188
	.data1 117
	.data1 55
	.data1 135
	.data1 250
	.data1 124
	.data1 4
	.data1 140
	.data1 99
	.data1 84
	.data1 157
	.data1 93
	.data1 18
	.data1 237
	.data1 209
	.data1 21
	.data1 189
	.data1 29
	.data1 246
	.data1 191
	.data1 225
	.data1 199
	.data1 65
	.data1 27
	.data1 62
	.data1 57
	.data1 87
	.data1 162
	.data1 134
	.data1 214
	.data1 35
	.data1 200
	.data1 80
	.data1 244
	.data1 234
	.data1 128
	.data1 82
	.data1 7
	.data1 156
	.data1 5
	.data1 207
	.data1 254
	.data1 107
	.data1 214
	.data1 78
	.data1 237
	.data1 161
	.data1 1
	.data1 140
	.data1 235
	.data1 174
	.data1 164
	.data1 179
	.data1 61
	.data1 128
	.data1 176
	.data1 203
	.data1 179
	.data1 23
	.data1 240
	.data1 111
	.data1 82
	.data1 88
	.data1 73
	.data1 196
	.data1 50
	.data1 32
	.data1 67
	.data1 167
	.data1 169
	.data1 155
	.data1 199
	.data1 37
	.data1 169
	.data1 215
	.data1 42
	.data1 47
	.data1 102
	.data1 147
	.data1 106
	.data1 142
	.data1 59
	.data1 93
	.data1 182
	.data1 20
	.data1 206
	.data1 219
	.data1 51
	.data1 19
	.data1 113
	.data1 104
	.data1 253
	.data1 19
	.data1 203
	.data1 226
	.data1 107
	.data1 190
	.data1 183
	.data1 193
	.data1 150
	.data1 31
	.data1 107
	.data1 108
	.data1 28
	.data1 11
	.data1 221
	.data1 199
	.data1 33
	.data1 223
	.data1 97
	.data1 16
	.data1 150
	.data1 107
	.data1 150
	.data1 235
	.data1 189
	.data1 45
	.data1 131
	.data1 186
	.data1 236
	.data1 193
	.data1 252
	.data1 50
	.data1 144
	.data1 152
	.data1 74
	.data1 43
	.data1 116
	.data1 232
	.data1 10
	.data1 182
	.data1 67
	.data1 227
	.data1 85
	.data1 116
	.data1 75
	.data1 42
	.data1 33
	.data1 37
	.data1 131
	.data1 132
	.data1 230
	.data1 127
	.data1 207
	.data1 202
	.data1 132
	.data1 64
	.data1 129
	.data1 38

fades::                                 ## @fades
	.data1 76
	.data1 152
	.data1 133
	.data1 234
	.data1 240
	.data1 132
	.data1 138
	.data1 40
	.data1 166
	.data1 115

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
