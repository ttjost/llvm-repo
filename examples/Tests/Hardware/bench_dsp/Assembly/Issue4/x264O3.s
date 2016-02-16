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
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @main
main::
## BB#0:                                ## %entry
	c0	mov $r0.14 = 0
	c0	mov $r0.15 = pix0
;;
	c0	mov $r0.11 = fenc
	c0	mov $r0.12 = 31
	c0	mov $r0.13 = $r0.14
;;
LBB1_1::                                ## %vector.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.16 = $r0.11, $r0.14
	c0	add $r0.17 = $r0.15, $r0.14
	c0	add $r0.14 = $r0.14, 16
;;
	c0	ldbu $r0.18 = 0[$r0.16]
;;
	c0	ldbu $r0.19 = 0[$r0.17]
;;
	c0	ldbu $r0.20 = 7[$r0.16]
;;
	c0	sub $r0.18 = $r0.18, $r0.19
;;
	c0	shr $r0.19 = $r0.18, $r0.12
	c0	ldbu $r0.21 = 1[$r0.17]
;;
	c0	add $r0.18 = $r0.18, $r0.19
	c0	ldbu $r0.22 = 1[$r0.16]
;;
	c0	xor $r0.18 = $r0.18, $r0.19
	c0	ldbu $r0.19 = 5[$r0.17]
;;
	c0	sub $r0.21 = $r0.22, $r0.21
	c0	add $r0.13 = $r0.18, $r0.13
	c0	ldbu $r0.18 = 3[$r0.16]
;;
	c0	shr $r0.22 = $r0.21, $r0.12
;;
	c0	add $r0.21 = $r0.21, $r0.22
	c0	ldbu $r0.23 = 3[$r0.17]
;;
	c0	xor $r0.21 = $r0.21, $r0.22
	c0	ldbu $r0.22 = 2[$r0.17]
;;
	c0	sub $r0.18 = $r0.18, $r0.23
;;
	c0	shr $r0.23 = $r0.18, $r0.12
	c0	ldbu $r0.24 = 2[$r0.16]
;;
	c0	add $r0.18 = $r0.18, $r0.23
	c0	ldbu $r0.25 = 4[$r0.16]
;;
	c0	sub $r0.22 = $r0.24, $r0.22
	c0	xor $r0.18 = $r0.18, $r0.23
	c0	ldbu $r0.23 = 6[$r0.16]
;;
	c0	shr $r0.24 = $r0.22, $r0.12
;;
	c0	add $r0.22 = $r0.22, $r0.24
	c0	ldbu $r0.26 = 6[$r0.17]
;;
	c0	xor $r0.22 = $r0.22, $r0.24
	c0	ldbu $r0.24 = 4[$r0.17]
;;
	c0	sub $r0.23 = $r0.23, $r0.26
;;
	c0	sub $r0.24 = $r0.25, $r0.24
	c0	ldbu $r0.25 = 5[$r0.16]
	c0	shr $r0.26 = $r0.23, $r0.12
;;
;;
	c0	sub $r0.19 = $r0.25, $r0.19
	c0	ldbu $r0.25 = 7[$r0.17]
	c0	shr $r0.27 = $r0.24, $r0.12
	c0	add $r0.23 = $r0.23, $r0.26
;;
	c0	ldbu $r0.28 = 10[$r0.17]
;;
	c0	sub $r0.20 = $r0.20, $r0.25
	c0	shr $r0.25 = $r0.19, $r0.12
	c0	add $r0.24 = $r0.24, $r0.27
	c0	ldbu $r0.29 = 11[$r0.17]
;;
	c0	shr $r0.30 = $r0.20, $r0.12
	c0	add $r0.19 = $r0.19, $r0.25
	c0	xor $r0.23 = $r0.23, $r0.26
	c0	ldbu $r0.26 = 9[$r0.17]
;;
	c0	add $r0.20 = $r0.20, $r0.30
	c0	xor $r0.19 = $r0.19, $r0.25
	c0	xor $r0.24 = $r0.24, $r0.27
	c0	ldbu $r0.25 = 8[$r0.16]
;;
	c0	xor $r0.20 = $r0.20, $r0.30
	c0	add $r0.19 = $r0.19, $r0.21
	c0	add $r0.21 = $r0.23, $r0.22
	c0	ldbu $r0.22 = 8[$r0.17]
;;
	c0	add $r0.18 = $r0.20, $r0.18
	c0	add $r0.13 = $r0.24, $r0.13
;;
	c0	sub $r0.20 = $r0.25, $r0.22
	c0	ldbu $r0.22 = 11[$r0.16]
;;
	c0	shr $r0.23 = $r0.20, $r0.12
	c0	ldbu $r0.24 = 9[$r0.16]
;;
	c0	sub $r0.22 = $r0.22, $r0.29
	c0	add $r0.20 = $r0.20, $r0.23
	c0	ldbu $r0.25 = 10[$r0.16]
;;
	c0	sub $r0.24 = $r0.24, $r0.26
	c0	shr $r0.26 = $r0.22, $r0.12
	c0	ldbu $r0.27 = 15[$r0.17]
;;
	c0	sub $r0.25 = $r0.25, $r0.28
	c0	shr $r0.28 = $r0.24, $r0.12
	c0	add $r0.22 = $r0.22, $r0.26
	c0	ldbu $r0.29 = 13[$r0.16]
;;
	c0	shr $r0.30 = $r0.25, $r0.12
	c0	add $r0.24 = $r0.24, $r0.28
	c0	xor $r0.22 = $r0.22, $r0.26
	c0	ldbu $r0.26 = 13[$r0.17]
;;
	c0	add $r0.25 = $r0.25, $r0.30
	c0	xor $r0.24 = $r0.24, $r0.28
	c0	xor $r0.20 = $r0.20, $r0.23
	c0	ldbu $r0.23 = 14[$r0.17]
;;
	c0	sub $r0.26 = $r0.29, $r0.26
	c0	xor $r0.25 = $r0.25, $r0.30
	c0	add $r0.13 = $r0.20, $r0.13
	c0	ldbu $r0.20 = 15[$r0.16]
;;
	c0	shr $r0.28 = $r0.26, $r0.12
	c0	add $r0.21 = $r0.25, $r0.21
	c0	add $r0.18 = $r0.22, $r0.18
	c0	ldbu $r0.22 = 14[$r0.16]
;;
	c0	sub $r0.20 = $r0.20, $r0.27
	c0	add $r0.25 = $r0.26, $r0.28
	c0	add $r0.19 = $r0.24, $r0.19
	c0	ldbu $r0.17 = 12[$r0.17]
;;
	c0	sub $r0.22 = $r0.22, $r0.23
	c0	shr $r0.23 = $r0.20, $r0.12
	c0	xor $r0.24 = $r0.25, $r0.28
	c0	ldbu $r0.16 = 12[$r0.16]
;;
	c0	shr $r0.25 = $r0.22, $r0.12
	c0	add $r0.20 = $r0.20, $r0.23
	c0	add $r0.19 = $r0.24, $r0.19
;;
	c0	sub $r0.16 = $r0.16, $r0.17
	c0	add $r0.17 = $r0.22, $r0.25
	c0	xor $r0.20 = $r0.20, $r0.23
;;
	c0	cmpne $b0.0 = $r0.14, 256
	c0	shr $r0.22 = $r0.16, $r0.12
	c0	xor $r0.17 = $r0.17, $r0.25
;;
	c0	add $r0.18 = $r0.20, $r0.18
	c0	add $r0.16 = $r0.16, $r0.22
	c0	add $r0.17 = $r0.17, $r0.21
;;
	c0	add $r0.18 = $r0.19, $r0.18
	c0	xor $r0.16 = $r0.16, $r0.22
;;
	c0	add $r0.13 = $r0.16, $r0.13
;;
	c0	add $r0.13 = $r0.13, $r0.17
;;
	c0	add $r0.13 = $r0.13, $r0.18
	c0	br $b0.0, LBB1_1
;;
## BB#2:                                ## %overflow.checked15.preheader
	c0	mov $r0.15 = 0
	c0	mov $r0.16 = pix1
;;
	c0	mov $r0.14 = $r0.15
;;
LBB1_3::                                ## %vector.body11
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.17 = $r0.11, $r0.15
	c0	add $r0.18 = $r0.16, $r0.15
	c0	add $r0.15 = $r0.15, 16
;;
	c0	ldbu $r0.19 = 0[$r0.17]
;;
	c0	ldbu $r0.20 = 0[$r0.18]
;;
	c0	ldbu $r0.21 = 7[$r0.17]
;;
	c0	sub $r0.19 = $r0.19, $r0.20
;;
	c0	shr $r0.20 = $r0.19, $r0.12
	c0	ldbu $r0.22 = 1[$r0.18]
;;
	c0	add $r0.19 = $r0.19, $r0.20
	c0	ldbu $r0.23 = 1[$r0.17]
;;
	c0	xor $r0.19 = $r0.19, $r0.20
	c0	ldbu $r0.20 = 5[$r0.18]
;;
	c0	sub $r0.22 = $r0.23, $r0.22
	c0	add $r0.14 = $r0.19, $r0.14
	c0	ldbu $r0.19 = 3[$r0.17]
;;
	c0	shr $r0.23 = $r0.22, $r0.12
;;
	c0	add $r0.22 = $r0.22, $r0.23
	c0	ldbu $r0.24 = 3[$r0.18]
;;
	c0	xor $r0.22 = $r0.22, $r0.23
	c0	ldbu $r0.23 = 2[$r0.18]
;;
	c0	sub $r0.19 = $r0.19, $r0.24
;;
	c0	shr $r0.24 = $r0.19, $r0.12
	c0	ldbu $r0.25 = 2[$r0.17]
;;
	c0	add $r0.19 = $r0.19, $r0.24
	c0	ldbu $r0.26 = 4[$r0.17]
;;
	c0	sub $r0.23 = $r0.25, $r0.23
	c0	xor $r0.19 = $r0.19, $r0.24
	c0	ldbu $r0.24 = 6[$r0.17]
;;
	c0	shr $r0.25 = $r0.23, $r0.12
;;
	c0	add $r0.23 = $r0.23, $r0.25
	c0	ldbu $r0.27 = 6[$r0.18]
;;
	c0	xor $r0.23 = $r0.23, $r0.25
	c0	ldbu $r0.25 = 4[$r0.18]
;;
	c0	sub $r0.24 = $r0.24, $r0.27
;;
	c0	sub $r0.25 = $r0.26, $r0.25
	c0	ldbu $r0.26 = 5[$r0.17]
	c0	shr $r0.27 = $r0.24, $r0.12
;;
;;
	c0	sub $r0.20 = $r0.26, $r0.20
	c0	ldbu $r0.26 = 7[$r0.18]
	c0	shr $r0.28 = $r0.25, $r0.12
	c0	add $r0.24 = $r0.24, $r0.27
;;
	c0	ldbu $r0.29 = 10[$r0.18]
;;
	c0	sub $r0.21 = $r0.21, $r0.26
	c0	shr $r0.26 = $r0.20, $r0.12
	c0	add $r0.25 = $r0.25, $r0.28
	c0	ldbu $r0.30 = 11[$r0.18]
;;
	c0	shr $r0.31 = $r0.21, $r0.12
	c0	add $r0.20 = $r0.20, $r0.26
	c0	xor $r0.24 = $r0.24, $r0.27
	c0	ldbu $r0.27 = 9[$r0.18]
;;
	c0	add $r0.21 = $r0.21, $r0.31
	c0	xor $r0.20 = $r0.20, $r0.26
	c0	xor $r0.25 = $r0.25, $r0.28
	c0	ldbu $r0.26 = 8[$r0.17]
;;
	c0	xor $r0.21 = $r0.21, $r0.31
	c0	add $r0.20 = $r0.20, $r0.22
	c0	add $r0.22 = $r0.24, $r0.23
	c0	ldbu $r0.23 = 8[$r0.18]
;;
	c0	add $r0.19 = $r0.21, $r0.19
	c0	add $r0.14 = $r0.25, $r0.14
;;
	c0	sub $r0.21 = $r0.26, $r0.23
	c0	ldbu $r0.23 = 11[$r0.17]
;;
	c0	shr $r0.24 = $r0.21, $r0.12
	c0	ldbu $r0.25 = 9[$r0.17]
;;
	c0	sub $r0.23 = $r0.23, $r0.30
	c0	add $r0.21 = $r0.21, $r0.24
	c0	ldbu $r0.26 = 10[$r0.17]
;;
	c0	sub $r0.25 = $r0.25, $r0.27
	c0	shr $r0.27 = $r0.23, $r0.12
	c0	ldbu $r0.28 = 15[$r0.18]
;;
	c0	sub $r0.26 = $r0.26, $r0.29
	c0	shr $r0.29 = $r0.25, $r0.12
	c0	add $r0.23 = $r0.23, $r0.27
	c0	ldbu $r0.30 = 13[$r0.17]
;;
	c0	shr $r0.31 = $r0.26, $r0.12
	c0	add $r0.25 = $r0.25, $r0.29
	c0	xor $r0.23 = $r0.23, $r0.27
	c0	ldbu $r0.27 = 13[$r0.18]
;;
	c0	add $r0.26 = $r0.26, $r0.31
	c0	xor $r0.25 = $r0.25, $r0.29
	c0	xor $r0.21 = $r0.21, $r0.24
	c0	ldbu $r0.24 = 14[$r0.18]
;;
	c0	sub $r0.27 = $r0.30, $r0.27
	c0	xor $r0.26 = $r0.26, $r0.31
	c0	add $r0.14 = $r0.21, $r0.14
	c0	ldbu $r0.21 = 15[$r0.17]
;;
	c0	shr $r0.29 = $r0.27, $r0.12
	c0	add $r0.22 = $r0.26, $r0.22
	c0	add $r0.19 = $r0.23, $r0.19
	c0	ldbu $r0.23 = 14[$r0.17]
;;
	c0	sub $r0.21 = $r0.21, $r0.28
	c0	add $r0.26 = $r0.27, $r0.29
	c0	add $r0.20 = $r0.25, $r0.20
	c0	ldbu $r0.18 = 12[$r0.18]
;;
	c0	sub $r0.23 = $r0.23, $r0.24
	c0	shr $r0.24 = $r0.21, $r0.12
	c0	xor $r0.25 = $r0.26, $r0.29
	c0	ldbu $r0.17 = 12[$r0.17]
;;
	c0	shr $r0.26 = $r0.23, $r0.12
	c0	add $r0.21 = $r0.21, $r0.24
	c0	add $r0.20 = $r0.25, $r0.20
;;
	c0	sub $r0.17 = $r0.17, $r0.18
	c0	add $r0.18 = $r0.23, $r0.26
	c0	xor $r0.21 = $r0.21, $r0.24
;;
	c0	cmpne $b0.0 = $r0.15, 256
	c0	shr $r0.23 = $r0.17, $r0.12
	c0	xor $r0.18 = $r0.18, $r0.26
;;
	c0	add $r0.19 = $r0.21, $r0.19
	c0	add $r0.17 = $r0.17, $r0.23
	c0	add $r0.18 = $r0.18, $r0.22
;;
	c0	add $r0.19 = $r0.20, $r0.19
	c0	xor $r0.17 = $r0.17, $r0.23
;;
	c0	add $r0.14 = $r0.17, $r0.14
;;
	c0	add $r0.14 = $r0.14, $r0.18
;;
	c0	add $r0.14 = $r0.14, $r0.19
	c0	br $b0.0, LBB1_3
;;
## BB#4:                                ## %overflow.checked41.preheader
	c0	mov $r0.16 = 0
	c0	mov $r0.17 = pix2
;;
	c0	mov $r0.15 = $r0.16
;;
LBB1_5::                                ## %vector.body37
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.18 = $r0.11, $r0.16
	c0	add $r0.19 = $r0.17, $r0.16
	c0	add $r0.16 = $r0.16, 16
;;
	c0	ldbu $r0.20 = 0[$r0.18]
;;
	c0	ldbu $r0.21 = 0[$r0.19]
;;
	c0	ldbu $r0.22 = 7[$r0.18]
;;
	c0	sub $r0.20 = $r0.20, $r0.21
;;
	c0	shr $r0.21 = $r0.20, $r0.12
	c0	ldbu $r0.23 = 1[$r0.19]
;;
	c0	add $r0.20 = $r0.20, $r0.21
	c0	ldbu $r0.24 = 1[$r0.18]
;;
	c0	xor $r0.20 = $r0.20, $r0.21
	c0	ldbu $r0.21 = 5[$r0.19]
;;
	c0	sub $r0.23 = $r0.24, $r0.23
	c0	add $r0.15 = $r0.20, $r0.15
	c0	ldbu $r0.20 = 3[$r0.18]
;;
	c0	shr $r0.24 = $r0.23, $r0.12
;;
	c0	add $r0.23 = $r0.23, $r0.24
	c0	ldbu $r0.25 = 3[$r0.19]
;;
	c0	xor $r0.23 = $r0.23, $r0.24
	c0	ldbu $r0.24 = 2[$r0.19]
;;
	c0	sub $r0.20 = $r0.20, $r0.25
;;
	c0	shr $r0.25 = $r0.20, $r0.12
	c0	ldbu $r0.26 = 2[$r0.18]
;;
	c0	add $r0.20 = $r0.20, $r0.25
	c0	ldbu $r0.27 = 4[$r0.18]
;;
	c0	sub $r0.24 = $r0.26, $r0.24
	c0	xor $r0.20 = $r0.20, $r0.25
	c0	ldbu $r0.25 = 6[$r0.18]
;;
	c0	shr $r0.26 = $r0.24, $r0.12
;;
	c0	add $r0.24 = $r0.24, $r0.26
	c0	ldbu $r0.28 = 6[$r0.19]
;;
	c0	xor $r0.24 = $r0.24, $r0.26
	c0	ldbu $r0.26 = 4[$r0.19]
;;
	c0	sub $r0.25 = $r0.25, $r0.28
;;
	c0	sub $r0.26 = $r0.27, $r0.26
	c0	ldbu $r0.27 = 5[$r0.18]
	c0	shr $r0.28 = $r0.25, $r0.12
;;
;;
	c0	sub $r0.21 = $r0.27, $r0.21
	c0	ldbu $r0.27 = 7[$r0.19]
	c0	shr $r0.29 = $r0.26, $r0.12
	c0	add $r0.25 = $r0.25, $r0.28
;;
	c0	ldbu $r0.30 = 10[$r0.19]
;;
	c0	sub $r0.22 = $r0.22, $r0.27
	c0	shr $r0.27 = $r0.21, $r0.12
	c0	add $r0.26 = $r0.26, $r0.29
	c0	ldbu $r0.31 = 11[$r0.19]
;;
	c0	shr $r0.32 = $r0.22, $r0.12
	c0	add $r0.21 = $r0.21, $r0.27
	c0	xor $r0.25 = $r0.25, $r0.28
	c0	ldbu $r0.28 = 9[$r0.19]
;;
	c0	add $r0.22 = $r0.22, $r0.32
	c0	xor $r0.21 = $r0.21, $r0.27
	c0	xor $r0.26 = $r0.26, $r0.29
	c0	ldbu $r0.27 = 8[$r0.18]
;;
	c0	xor $r0.22 = $r0.22, $r0.32
	c0	add $r0.21 = $r0.21, $r0.23
	c0	add $r0.23 = $r0.25, $r0.24
	c0	ldbu $r0.24 = 8[$r0.19]
;;
	c0	add $r0.20 = $r0.22, $r0.20
	c0	add $r0.15 = $r0.26, $r0.15
;;
	c0	sub $r0.22 = $r0.27, $r0.24
	c0	ldbu $r0.24 = 11[$r0.18]
;;
	c0	shr $r0.25 = $r0.22, $r0.12
	c0	ldbu $r0.26 = 9[$r0.18]
;;
	c0	sub $r0.24 = $r0.24, $r0.31
	c0	add $r0.22 = $r0.22, $r0.25
	c0	ldbu $r0.27 = 10[$r0.18]
;;
	c0	sub $r0.26 = $r0.26, $r0.28
	c0	shr $r0.28 = $r0.24, $r0.12
	c0	ldbu $r0.29 = 15[$r0.19]
;;
	c0	sub $r0.27 = $r0.27, $r0.30
	c0	shr $r0.30 = $r0.26, $r0.12
	c0	add $r0.24 = $r0.24, $r0.28
	c0	ldbu $r0.31 = 13[$r0.18]
;;
	c0	shr $r0.32 = $r0.27, $r0.12
	c0	add $r0.26 = $r0.26, $r0.30
	c0	xor $r0.24 = $r0.24, $r0.28
	c0	ldbu $r0.28 = 13[$r0.19]
;;
	c0	add $r0.27 = $r0.27, $r0.32
	c0	xor $r0.26 = $r0.26, $r0.30
	c0	xor $r0.22 = $r0.22, $r0.25
	c0	ldbu $r0.25 = 14[$r0.19]
;;
	c0	sub $r0.28 = $r0.31, $r0.28
	c0	xor $r0.27 = $r0.27, $r0.32
	c0	add $r0.15 = $r0.22, $r0.15
	c0	ldbu $r0.22 = 15[$r0.18]
;;
	c0	shr $r0.30 = $r0.28, $r0.12
	c0	add $r0.23 = $r0.27, $r0.23
	c0	add $r0.20 = $r0.24, $r0.20
	c0	ldbu $r0.24 = 14[$r0.18]
;;
	c0	sub $r0.22 = $r0.22, $r0.29
	c0	add $r0.27 = $r0.28, $r0.30
	c0	add $r0.21 = $r0.26, $r0.21
	c0	ldbu $r0.19 = 12[$r0.19]
;;
	c0	sub $r0.24 = $r0.24, $r0.25
	c0	shr $r0.25 = $r0.22, $r0.12
	c0	xor $r0.26 = $r0.27, $r0.30
	c0	ldbu $r0.18 = 12[$r0.18]
;;
	c0	shr $r0.27 = $r0.24, $r0.12
	c0	add $r0.22 = $r0.22, $r0.25
	c0	add $r0.21 = $r0.26, $r0.21
;;
	c0	sub $r0.18 = $r0.18, $r0.19
	c0	add $r0.19 = $r0.24, $r0.27
	c0	xor $r0.22 = $r0.22, $r0.25
;;
	c0	cmpne $b0.0 = $r0.16, 256
	c0	shr $r0.24 = $r0.18, $r0.12
	c0	xor $r0.19 = $r0.19, $r0.27
;;
	c0	add $r0.20 = $r0.22, $r0.20
	c0	add $r0.18 = $r0.18, $r0.24
	c0	add $r0.19 = $r0.19, $r0.23
;;
	c0	add $r0.20 = $r0.21, $r0.20
	c0	xor $r0.18 = $r0.18, $r0.24
;;
	c0	add $r0.15 = $r0.18, $r0.15
;;
	c0	add $r0.15 = $r0.15, $r0.19
;;
	c0	add $r0.15 = $r0.15, $r0.20
	c0	br $b0.0, LBB1_5
;;
## BB#6:                                ## %overflow.checked67.preheader
	c0	mov $r0.16 = 0
	c0	mov $r0.17 = pix3
;;
	c0	mov $r0.18 = $r0.16
;;
LBB1_7::                                ## %vector.body63
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.19 = $r0.11, $r0.16
	c0	add $r0.20 = $r0.17, $r0.16
	c0	add $r0.16 = $r0.16, 16
;;
	c0	ldbu $r0.21 = 0[$r0.19]
;;
	c0	ldbu $r0.22 = 0[$r0.20]
;;
	c0	ldbu $r0.23 = 7[$r0.19]
;;
	c0	sub $r0.21 = $r0.21, $r0.22
;;
	c0	shr $r0.22 = $r0.21, $r0.12
	c0	ldbu $r0.24 = 1[$r0.20]
;;
	c0	add $r0.21 = $r0.21, $r0.22
	c0	ldbu $r0.25 = 1[$r0.19]
;;
	c0	xor $r0.21 = $r0.21, $r0.22
	c0	ldbu $r0.22 = 5[$r0.20]
;;
	c0	sub $r0.24 = $r0.25, $r0.24
	c0	add $r0.18 = $r0.21, $r0.18
	c0	ldbu $r0.21 = 3[$r0.19]
;;
	c0	shr $r0.25 = $r0.24, $r0.12
;;
	c0	add $r0.24 = $r0.24, $r0.25
	c0	ldbu $r0.26 = 3[$r0.20]
;;
	c0	xor $r0.24 = $r0.24, $r0.25
	c0	ldbu $r0.25 = 2[$r0.20]
;;
	c0	sub $r0.21 = $r0.21, $r0.26
;;
	c0	shr $r0.26 = $r0.21, $r0.12
	c0	ldbu $r0.27 = 2[$r0.19]
;;
	c0	add $r0.21 = $r0.21, $r0.26
	c0	ldbu $r0.28 = 4[$r0.19]
;;
	c0	sub $r0.25 = $r0.27, $r0.25
	c0	xor $r0.21 = $r0.21, $r0.26
	c0	ldbu $r0.26 = 6[$r0.19]
;;
	c0	shr $r0.27 = $r0.25, $r0.12
;;
	c0	add $r0.25 = $r0.25, $r0.27
	c0	ldbu $r0.29 = 6[$r0.20]
;;
	c0	xor $r0.25 = $r0.25, $r0.27
	c0	ldbu $r0.27 = 4[$r0.20]
;;
	c0	sub $r0.26 = $r0.26, $r0.29
;;
	c0	sub $r0.27 = $r0.28, $r0.27
	c0	ldbu $r0.28 = 5[$r0.19]
	c0	shr $r0.29 = $r0.26, $r0.12
;;
;;
	c0	sub $r0.22 = $r0.28, $r0.22
	c0	ldbu $r0.28 = 7[$r0.20]
	c0	shr $r0.30 = $r0.27, $r0.12
	c0	add $r0.26 = $r0.26, $r0.29
;;
	c0	ldbu $r0.31 = 10[$r0.20]
;;
	c0	sub $r0.23 = $r0.23, $r0.28
	c0	shr $r0.28 = $r0.22, $r0.12
	c0	add $r0.27 = $r0.27, $r0.30
	c0	ldbu $r0.32 = 11[$r0.20]
;;
	c0	shr $r0.33 = $r0.23, $r0.12
	c0	add $r0.22 = $r0.22, $r0.28
	c0	xor $r0.26 = $r0.26, $r0.29
	c0	ldbu $r0.29 = 9[$r0.20]
;;
	c0	add $r0.23 = $r0.23, $r0.33
	c0	xor $r0.22 = $r0.22, $r0.28
	c0	xor $r0.27 = $r0.27, $r0.30
	c0	ldbu $r0.28 = 8[$r0.19]
;;
	c0	xor $r0.23 = $r0.23, $r0.33
	c0	add $r0.22 = $r0.22, $r0.24
	c0	add $r0.24 = $r0.26, $r0.25
	c0	ldbu $r0.25 = 8[$r0.20]
;;
	c0	add $r0.21 = $r0.23, $r0.21
	c0	add $r0.18 = $r0.27, $r0.18
;;
	c0	sub $r0.23 = $r0.28, $r0.25
	c0	ldbu $r0.25 = 11[$r0.19]
;;
	c0	shr $r0.26 = $r0.23, $r0.12
	c0	ldbu $r0.27 = 9[$r0.19]
;;
	c0	sub $r0.25 = $r0.25, $r0.32
	c0	add $r0.23 = $r0.23, $r0.26
	c0	ldbu $r0.28 = 10[$r0.19]
;;
	c0	sub $r0.27 = $r0.27, $r0.29
	c0	shr $r0.29 = $r0.25, $r0.12
	c0	ldbu $r0.30 = 15[$r0.20]
;;
	c0	sub $r0.28 = $r0.28, $r0.31
	c0	shr $r0.31 = $r0.27, $r0.12
	c0	add $r0.25 = $r0.25, $r0.29
	c0	ldbu $r0.32 = 13[$r0.19]
;;
	c0	shr $r0.33 = $r0.28, $r0.12
	c0	add $r0.27 = $r0.27, $r0.31
	c0	xor $r0.25 = $r0.25, $r0.29
	c0	ldbu $r0.29 = 13[$r0.20]
;;
	c0	add $r0.28 = $r0.28, $r0.33
	c0	xor $r0.27 = $r0.27, $r0.31
	c0	xor $r0.23 = $r0.23, $r0.26
	c0	ldbu $r0.26 = 14[$r0.20]
;;
	c0	sub $r0.29 = $r0.32, $r0.29
	c0	xor $r0.28 = $r0.28, $r0.33
	c0	add $r0.18 = $r0.23, $r0.18
	c0	ldbu $r0.23 = 15[$r0.19]
;;
	c0	shr $r0.31 = $r0.29, $r0.12
	c0	add $r0.24 = $r0.28, $r0.24
	c0	add $r0.21 = $r0.25, $r0.21
	c0	ldbu $r0.25 = 14[$r0.19]
;;
	c0	sub $r0.23 = $r0.23, $r0.30
	c0	add $r0.28 = $r0.29, $r0.31
	c0	add $r0.22 = $r0.27, $r0.22
	c0	ldbu $r0.20 = 12[$r0.20]
;;
	c0	sub $r0.25 = $r0.25, $r0.26
	c0	shr $r0.26 = $r0.23, $r0.12
	c0	xor $r0.27 = $r0.28, $r0.31
	c0	ldbu $r0.19 = 12[$r0.19]
;;
	c0	shr $r0.28 = $r0.25, $r0.12
	c0	add $r0.23 = $r0.23, $r0.26
	c0	add $r0.22 = $r0.27, $r0.22
;;
	c0	sub $r0.19 = $r0.19, $r0.20
	c0	add $r0.20 = $r0.25, $r0.28
	c0	xor $r0.23 = $r0.23, $r0.26
;;
	c0	cmpne $b0.0 = $r0.16, 256
	c0	shr $r0.25 = $r0.19, $r0.12
	c0	xor $r0.20 = $r0.20, $r0.28
;;
	c0	add $r0.21 = $r0.23, $r0.21
	c0	add $r0.19 = $r0.19, $r0.25
	c0	add $r0.20 = $r0.20, $r0.24
;;
	c0	add $r0.21 = $r0.22, $r0.21
	c0	xor $r0.19 = $r0.19, $r0.25
;;
	c0	add $r0.18 = $r0.19, $r0.18
;;
	c0	add $r0.18 = $r0.18, $r0.20
;;
	c0	add $r0.18 = $r0.18, $r0.21
	c0	br $b0.0, LBB1_7
;;
## BB#8:                                ## %x264_pixel_sad_x4_16x16.exit
	c0	mov $r0.11 = 0
	c0	cmpne $b0.0 = $r0.13, 1920
;;
;;
	c0	br $b0.0, LBB1_10
;;
## BB#9:                                ## %for.inc
	c0	mov $r0.11 = 1
	c0	cmpeq $b0.0 = $r0.14, 1920
;;
;;
	c0	brf $b0.0, LBB1_10
;;
## BB#11:                               ## %for.inc.1
	c0	mov $r0.11 = 2
	c0	cmpne $b0.0 = $r0.15, 1920
;;
;;
	c0	br $b0.0, LBB1_10
;;
## BB#12:                               ## %for.inc.2
	c0	cmpeq $b0.0 = $r0.18, 1920
	c0	mov $r0.11 = -1
;;
;;
.return ret($r0.3:s32)
	c0	slct $r0.3 = $b0.0, $r0.11, 3
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
LBB1_10::                               ## %return
.return ret($r0.3:s32)
	c0	mov $r0.3 = $r0.11
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


