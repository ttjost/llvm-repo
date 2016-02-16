.section .text
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @abs
abs::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
	c0	cmpgt $b0.0 = $r0.3, -1
;;
	c0	stw 24[$r0.1] = $r0.3
;;
	c0	br $b0.0, LBB0_2
;;
## BB#1:                                ## %if.then
	c0	ldw $r0.11 = 24[$r0.1]
	c0	mov $r0.12 = 0
;;
;;
	c0	sub $r0.11 = $r0.12, $r0.11
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	goto LBB0_3
;;
LBB0_2::                                ## %if.else
	c0	ldw $r0.11 = 24[$r0.1]
;;
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
	c0	stw 60[$r0.1] = $r0.57
;;
	c0	stw 56[$r0.1] = $r0.58
;;
	c0	stw 52[$r0.1] = $l0.0
	c0	mov $r0.58 = 0
;;
	c0	mov $r0.11 = 16
	c0	stw 48[$r0.1] = $r0.58
;;
	c0	add $r0.57 = $r0.1, 32
	c0	stw 28[$r0.1] = $r0.11
;;
	c0	mov $r0.4 = pix0
;;
	c0	mov $r0.5 = pix1
;;
	c0	mov $r0.6 = pix2
;;
	c0	mov $r0.7 = pix3
;;
	c0	mov $r0.3 = fenc
;;
	c0	mov $r0.8 = $r0.11
	c0	mov $r0.9 = $r0.57
;;
.call x264_pixel_sad_x4_16x16, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = x264_pixel_sad_x4_16x16
;;
	c0	stw 24[$r0.1] = $r0.58
;;
LBB1_1::                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.11 = 24[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.11, 3
;;
;;
	c0	br $b0.0, LBB1_5
;;
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.11 = 24[$r0.1]
;;
;;
	c0	sh2add $r0.11 = $r0.11, $r0.57
;;
	c0	ldw $r0.11 = 0[$r0.11]
;;
;;
	c0	cmpeq $b0.0 = $r0.11, 1920
;;
;;
	c0	brf $b0.0, LBB1_3
;;
## BB#4:                                ## %for.inc
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.11 = 24[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 24[$r0.1] = $r0.11
	c0	goto LBB1_1
;;
LBB1_3::                                ## %if.then
	c0	ldw $r0.11 = 24[$r0.1]
;;
;;
	c0	stw 48[$r0.1] = $r0.11
	c0	goto LBB1_6
;;
LBB1_5::                                ## %for.end
	c0	mov $r0.11 = -1
;;
	c0	stw 48[$r0.1] = $r0.11
;;
LBB1_6::                                ## %return
	c0	ldw $r0.3 = 48[$r0.1]
;;
	c0	ldw $l0.0 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
	c0	ldw $r0.57 = 60[$r0.1]
;;
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
	c0	stw 60[$r0.1] = $r0.57
;;
	c0	stw 56[$r0.1] = $l0.0
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
;;
.call x264_pixel_sad_16x16, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = x264_pixel_sad_16x16
;;
	c0	ldw $r0.11 = 28[$r0.1]
;;
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
;;
	c0	stw 12[$r0.11] = $r0.3
;;
	c0	ldw $l0.0 = 56[$r0.1]
;;
	c0	ldw $r0.57 = 60[$r0.1]
;;
;;
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
	c0	stw 60[$r0.1] = $r0.57
;;
	c0	stw 56[$r0.1] = $l0.0
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
;;
	c0	cmpgt $b0.0 = $r0.11, 15
;;
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
;;
	c0	cmpgt $b0.0 = $r0.11, 15
;;
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
;;
	c0	add $r0.11 = $r0.11, $r0.13
	c0	add $r0.12 = $r0.12, $r0.13
;;
	c0	ldbu $r0.11 = 0[$r0.11]
;;
	c0	ldbu $r0.12 = 0[$r0.12]
;;
;;
	c0	sub $r0.3 = $r0.12, $r0.11
;;
.call abs, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = abs
;;
	c0	ldw $r0.11 = 36[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, $r0.3
;;
	c0	stw 36[$r0.1] = $r0.11
;;
## BB#5:                                ## %for.inc
                                        ##   in Loop: Header=BB3_3 Depth=2
	c0	ldw $r0.11 = 32[$r0.1]
;;
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
;;
	c0	add $r0.11 = $r0.11, $r0.12
;;
	c0	stw 52[$r0.1] = $r0.11
;;
	c0	ldw $r0.11 = 44[$r0.1]
;;
	c0	ldw $r0.12 = 40[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, $r0.12
;;
	c0	stw 44[$r0.1] = $r0.11
;;
## BB#7:                                ## %for.inc7
                                        ##   in Loop: Header=BB3_1 Depth=1
	c0	ldw $r0.11 = 28[$r0.1]
;;
;;
	c0	add $r0.11 = $r0.11, 1
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	goto LBB3_1
;;
LBB3_8::                                ## %for.end9
	c0	ldw $r0.3 = 36[$r0.1]
;;
	c0	ldw $l0.0 = 56[$r0.1]
;;
	c0	ldw $r0.57 = 60[$r0.1]
;;
;;
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

.section .bss
pix0::                                  ## @pix0
	.skip	256

pix1::                                  ## @pix1
	.skip	256

pix2::                                  ## @pix2
	.skip	256

pix3::                                  ## @pix3
	.skip	256


