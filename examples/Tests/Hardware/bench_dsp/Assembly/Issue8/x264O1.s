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
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @main
main::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 44[$r0.1] = $r0.57
;;
	c0	stw 40[$r0.1] = $r0.58
;;
	c0	stw 36[$r0.1] = $l0.0
	c0	mov $r0.57 = 0
	c0	add $r0.58 = $r0.1, 20
;;
	c0	mov $r0.3 = $r0.58
;;
.call x264_pixel_sad_x4_16x16, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = x264_pixel_sad_x4_16x16
;;
	c0	mov $r0.11 = -1
;;
LBB1_1::                                ## %for.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.12 = 0[$r0.58]
;;
;;
	c0	cmpne $b0.0 = $r0.12, 1920
	c0	mov $r0.12 = $r0.57
;;
;;
	c0	br $b0.0, LBB1_3
;;
## BB#2:                                ## %for.inc
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	add $r0.57 = $r0.57, 1
	c0	add $r0.58 = $r0.58, 4
;;
	c0	cmplt $b0.0 = $r0.57, 4
	c0	mov $r0.12 = $r0.11
;;
;;
	c0	br $b0.0, LBB1_1
;;
LBB1_3::                                ## %return
	c0	mov $r0.3 = $r0.12
	c0	ldw $l0.0 = 36[$r0.1]
;;
	c0	ldw $r0.58 = 40[$r0.1]
;;
	c0	ldw $r0.57 = 44[$r0.1]
;;
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @x264_pixel_sad_x4_16x16
x264_pixel_sad_x4_16x16::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $r0.57
;;
	c0	stw 24[$r0.1] = $l0.0
	c0	mov $r0.57 = $r0.3
	c0	mov $r0.3 = pix0
;;
.call x264_pixel_sad_16x16, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = x264_pixel_sad_16x16
;;
	c0	mov $r0.11 = pix1
	c0	stw 0[$r0.57] = $r0.3
;;
	c0	mov $r0.3 = $r0.11
;;
.call x264_pixel_sad_16x16, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = x264_pixel_sad_16x16
;;
	c0	mov $r0.11 = pix2
	c0	stw 4[$r0.57] = $r0.3
;;
	c0	mov $r0.3 = $r0.11
;;
.call x264_pixel_sad_16x16, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = x264_pixel_sad_16x16
;;
	c0	mov $r0.11 = pix3
	c0	stw 8[$r0.57] = $r0.3
;;
	c0	mov $r0.3 = $r0.11
;;
.call x264_pixel_sad_16x16, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = x264_pixel_sad_16x16
;;
	c0	stw 12[$r0.57] = $r0.3
;;
	c0	ldw $l0.0 = 24[$r0.1]
;;
	c0	ldw $r0.57 = 28[$r0.1]
;;
;;
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @x264_pixel_sad_16x16
x264_pixel_sad_16x16::
## BB#0:                                ## %entry
	c0	mov $r0.11 = fenc
	c0	mov $r0.12 = 0
	c0	mov $r0.13 = 31
;;
	c0	mov $r0.15 = $r0.12
	c0	mov $r0.14 = $r0.12
	c0	mov $r0.16 = $r0.3
;;
LBB3_1::                                ## %for.cond1.preheader
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB3_2 Depth 2
	c0	mov $r0.17 = $r0.12
;;
LBB3_2::                                ## %for.body3
                                        ##   Parent Loop BB3_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	add $r0.18 = $r0.16, $r0.17
	c0	add $r0.19 = $r0.11, $r0.17
;;
	c0	ldbu $r0.18 = 0[$r0.18]
	c0	add $r0.17 = $r0.17, 1
;;
	c0	ldbu $r0.19 = 0[$r0.19]
	c0	cmpne $b0.0 = $r0.17, 16
;;
;;
	c0	sub $r0.18 = $r0.19, $r0.18
;;
	c0	shr $r0.19 = $r0.18, $r0.13
;;
	c0	add $r0.18 = $r0.18, $r0.19
;;
	c0	xor $r0.18 = $r0.18, $r0.19
;;
	c0	add $r0.14 = $r0.18, $r0.14
	c0	br $b0.0, LBB3_2
;;
## BB#3:                                ## %for.end
                                        ##   in Loop: Header=BB3_1 Depth=1
	c0	add $r0.15 = $r0.15, 1
	c0	add $r0.11 = $r0.11, 16
	c0	add $r0.16 = $r0.16, 16
;;
	c0	cmpne $b0.0 = $r0.15, 16
;;
;;
	c0	br $b0.0, LBB3_1
;;
## BB#4:                                ## %for.end9
.return ret($r0.3:s32)
	c0	mov $r0.3 = $r0.14
	c0	return $r0.1 = $r0.1, 0, $l0.0
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


