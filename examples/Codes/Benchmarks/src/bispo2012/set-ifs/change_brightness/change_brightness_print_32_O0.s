.section .text
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @change_brightness
change_brightness::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 44[$r0.1] = $r0.3
;;
	c0	stw 40[$r0.1] = $r0.4
;;
	c0	stw 36[$r0.1] = $r0.5
;;
	c0	stb 32[$r0.1] = $r0.6
;;
	c0	ldb $r0.11 = 32[$r0.1]
;;
	c0	cmpgt $b0.0 = $r0.11, -1
;;
	c0	br $b0.0, LBB0_2
;;
## BB#1:                                ## %if.then
	c0	ldb $r0.11 = 32[$r0.1]
	c0	mov $r0.12 = 0
;;
	c0	sub $r0.11 = $r0.12, $r0.11
;;
	c0	stb 28[$r0.1] = $r0.11
	c0	goto LBB0_3
;;
LBB0_2::                                ## %if.else
	c0	ldb $r0.11 = 32[$r0.1]
;;
	c0	stb 28[$r0.1] = $r0.11
;;
LBB0_3::                                ## %if.end
	c0	mov $r0.11 = 0
;;
	c0	stw 24[$r0.1] = $r0.11
	c0	mov $r0.12 = 255
;;
LBB0_4::                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.13 = 36[$r0.1]
;;
	c0	ldw $r0.14 = 24[$r0.1]
;;
	c0	cmpge $b0.0 = $r0.14, $r0.13
;;
	c0	br $b0.0, LBB0_13
;;
## BB#5:                                ## %for.body
                                        ##   in Loop: Header=BB0_4 Depth=1
	c0	ldb $r0.13 = 32[$r0.1]
;;
	c0	cmplt $b0.0 = $r0.13, 1
;;
	c0	br $b0.0, LBB0_9
;;
## BB#6:                                ## %if.then9
                                        ##   in Loop: Header=BB0_4 Depth=1
	c0	ldw $r0.13 = 44[$r0.1]
;;
	c0	ldbu $r0.13 = 0[$r0.13]
;;
	c0	ldbu $r0.14 = 28[$r0.1]
;;
	c0	add $r0.13 = $r0.13, $r0.14
;;
	c0	stw 20[$r0.1] = $r0.13
	c0	cmplt $b0.0 = $r0.13, 256
;;
	c0	br $b0.0, LBB0_8
;;
## BB#7:                                ## %if.then14
                                        ##   in Loop: Header=BB0_4 Depth=1
	c0	stw 20[$r0.1] = $r0.12
;;
LBB0_8::                                ## %if.end15
                                        ##   in Loop: Header=BB0_4 Depth=1
	c0	ldw $r0.13 = 40[$r0.1]
;;
	c0	ldw $r0.14 = 20[$r0.1]
	c0	add $r0.15 = $r0.13, 1
;;
	c0	stw 40[$r0.1] = $r0.15
;;
	c0	stb 0[$r0.13] = $r0.14
	c0	goto LBB0_12
;;
LBB0_9::                                ## %if.else17
                                        ##   in Loop: Header=BB0_4 Depth=1
	c0	ldw $r0.13 = 44[$r0.1]
;;
	c0	ldbu $r0.13 = 0[$r0.13]
;;
	c0	ldbu $r0.14 = 28[$r0.1]
;;
	c0	sub $r0.13 = $r0.13, $r0.14
;;
	c0	stw 20[$r0.1] = $r0.13
	c0	cmpgt $b0.0 = $r0.13, -1
;;
	c0	br $b0.0, LBB0_11
;;
## BB#10:                               ## %if.then23
                                        ##   in Loop: Header=BB0_4 Depth=1
	c0	stw 20[$r0.1] = $r0.11
;;
LBB0_11::                               ## %if.end24
                                        ##   in Loop: Header=BB0_4 Depth=1
	c0	ldw $r0.13 = 40[$r0.1]
;;
	c0	ldw $r0.14 = 20[$r0.1]
	c0	add $r0.15 = $r0.13, 1
;;
	c0	stw 40[$r0.1] = $r0.15
;;
	c0	stb 0[$r0.13] = $r0.14
;;
LBB0_12::                               ## %for.inc
                                        ##   in Loop: Header=BB0_4 Depth=1
	c0	ldw $r0.13 = 24[$r0.1]
;;
	c0	add $r0.13 = $r0.13, 1
;;
	c0	stw 24[$r0.1] = $r0.13
;;
	c0	ldw $r0.13 = 44[$r0.1]
;;
	c0	add $r0.13 = $r0.13, 1
;;
	c0	stw 44[$r0.1] = $r0.13
	c0	goto LBB0_4
;;
LBB0_13::                               ## %for.end
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @main
main::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 44[$r0.1] = $l0.0
;;
	c0	stw 40[$r0.1] = $r0.57
;;
	c0	stw 36[$r0.1] = $r0.58
;;
	c0	stw 32[$r0.1] = $r0.59
;;
	c0	stw 28[$r0.1] = $r0.60
	c0	mov $r0.58 = 0
	c0	mov $r0.11 = 100
;;
	c0	stw 24[$r0.1] = $r0.58
;;
	c0	stw 16[$r0.1] = $r0.11
;;
	c0	stw 20[$r0.1] = $r0.58
	c0	mov $r0.59 = deltas
;;
	c0	mov $r0.60 = image1
	c0	mov $r0.57 = imageR
;;
LBB1_1::                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.11 = 20[$r0.1]
;;
	c0	cmpgt $b0.0 = $r0.11, 9
;;
	c0	br $b0.0, LBB1_4
;;
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.11 = 20[$r0.1]
;;
	c0	add $r0.11 = $r0.59, $r0.11
	c0	ldw $r0.5 = 16[$r0.1]
;;
	c0	ldb $r0.6 = 0[$r0.11]
	c0	mov $r0.3 = $r0.60
	c0	mov $r0.4 = $r0.57
;;
.call change_brightness, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = change_brightness
;;
## BB#3:                                ## %for.inc
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.11 = 20[$r0.1]
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 20[$r0.1] = $r0.11
	c0	goto LBB1_1
;;
LBB1_4::                                ## %for.end
	c0	stw 20[$r0.1] = $r0.58
	c0	mov $r0.58 = .str
;;
LBB1_5::                                ## %for.cond1
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.11 = 16[$r0.1]
;;
	c0	ldw $r0.12 = 20[$r0.1]
;;
	c0	cmpge $b0.0 = $r0.12, $r0.11
;;
	c0	br $b0.0, LBB1_8
;;
## BB#6:                                ## %for.body3
                                        ##   in Loop: Header=BB1_5 Depth=1
	c0	ldw $r0.11 = 20[$r0.1]
;;
	c0	add $r0.11 = $r0.57, $r0.11
;;
	c0	ldbu $r0.4 = 0[$r0.11]
	c0	mov $r0.3 = $r0.58
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
## BB#7:                                ## %for.inc5
                                        ##   in Loop: Header=BB1_5 Depth=1
	c0	ldw $r0.11 = 20[$r0.1]
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 20[$r0.1] = $r0.11
	c0	goto LBB1_5
;;
LBB1_8::                                ## %for.end7
	c0	mov $r0.3 = 0
	c0	ldw $r0.60 = 28[$r0.1]
;;
	c0	ldw $r0.59 = 32[$r0.1]
;;
	c0	ldw $r0.58 = 36[$r0.1]
;;
	c0	ldw $r0.57 = 40[$r0.1]
;;
	c0	ldw $l0.0 = 44[$r0.1]
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 64, $l0.0
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
