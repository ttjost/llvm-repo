.section .text
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @matrix_mul
matrix_mul::
## BB#0:                                ## %entry
	c0	mov $r0.11 = 0
	c0	mov $r0.12 = a
;;
	c0	mov $r0.13 = b
	c0	mov $r0.14 = 10
;;
	c0	mov $r0.15 = c
	c0	mov $r0.16 = $r0.11
;;
LBB0_1::                                ## %for.cond1.preheader
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB0_2 Depth 2
                                        ##       Child Loop BB0_3 Depth 3
	c0	mov $r0.17 = $r0.13
	c0	mov $r0.18 = $r0.11
;;
LBB0_2::                                ## %for.cond4.preheader
                                        ##   Parent Loop BB0_1 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB0_3 Depth 3
	c0	mov $r0.20 = $r0.12
	c0	mov $r0.21 = $r0.17
	c0	mov $r0.22 = $r0.14
	c0	mov $r0.19 = $r0.11
;;
LBB0_3::                                ## %for.body6
                                        ##   Parent Loop BB0_1 Depth=1
                                        ##     Parent Loop BB0_2 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	c0	ldw $r0.23 = 0[$r0.20]
;;
	c0	ldw $r0.24 = 0[$r0.21]
;;
	c0	mpylu $r0.25 = $r0.24, $r0.23
	c0	mpyhs $r0.23 = $r0.24, $r0.23
	c0	add $r0.20 = $r0.20, 4
	c0	add $r0.21 = $r0.21, 40
;;
	c0	add $r0.23 = $r0.25, $r0.23
	c0	add $r0.22 = $r0.22, -1
;;
	c0	add $r0.19 = $r0.23, $r0.19
	c0	cmpne $b0.0 = $r0.22, 0
;;
	c0	br $b0.0, LBB0_3
;;
## BB#4:                                ## %for.end
                                        ##   in Loop: Header=BB0_2 Depth=2
	c0	mpyhs $r0.20 = $r0.16, 40
	c0	mpylu $r0.21 = $r0.16, 40
;;
	c0	add $r0.20 = $r0.21, $r0.20
;;
	c0	add $r0.20 = $r0.15, $r0.20
	c0	add $r0.21 = $r0.18, 1
	c0	add $r0.17 = $r0.17, 4
;;
	c0	sh2add $r0.18 = $r0.18, $r0.20
;;
	c0	stw 0[$r0.18] = $r0.19
	c0	cmpne $b0.0 = $r0.21, 10
	c0	mov $r0.18 = $r0.21
;;
	c0	br $b0.0, LBB0_2
;;
## BB#5:                                ## %for.inc15
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	add $r0.16 = $r0.16, 1
	c0	add $r0.12 = $r0.12, 40
;;
	c0	cmpne $b0.0 = $r0.16, 10
;;
	c0	br $b0.0, LBB0_1
;;
## BB#6:                                ## %for.end17
.return ret($r0.3:s32)
	c0	mov $r0.3 = 0
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
	c0	stw 44[$r0.1] = $l0.0
;;
	c0	stw 40[$r0.1] = $r0.57
;;
	c0	stw 36[$r0.1] = $r0.58
;;
	c0	stw 32[$r0.1] = $r0.59
;;
	c0	stw 28[$r0.1] = $r0.60
	c0	mov $r0.60 = 1000
	c0	mov $r0.57 = 0
;;
	c0	mov $r0.58 = result
	c0	mov $r0.59 = c
;;
LBB1_1::                                ## %for.body
                                        ## =>This Inner Loop Header: Depth=1
.call matrix_mul, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	add $r0.60 = $r0.60, -1
	c0	call $l0.0 = matrix_mul
;;
	c0	cmpne $b0.0 = $r0.60, 0
	c0	mov $r0.11 = $r0.57
;;
	c0	br $b0.0, LBB1_1
;;
LBB1_2::                                ## %for.cond4.preheader
                                        ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB1_4 Depth 2
	c0	mov $r0.12 = $r0.59
	c0	mov $r0.13 = $r0.58
	c0	mov $r0.14 = $r0.57
;;
LBB1_4::                                ## %for.body6
                                        ##   Parent Loop BB1_2 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	c0	ldw $r0.15 = 0[$r0.13]
;;
	c0	ldw $r0.16 = 0[$r0.12]
;;
	c0	cmpeq $b0.0 = $r0.16, $r0.15
;;
	c0	brf $b0.0, LBB1_5
;;
## BB#3:                                ## %for.cond4
                                        ##   in Loop: Header=BB1_4 Depth=2
	c0	add $r0.14 = $r0.14, 1
	c0	add $r0.12 = $r0.12, 4
	c0	add $r0.13 = $r0.13, 4
;;
	c0	cmpgt $b0.0 = $r0.14, 9
;;
	c0	brf $b0.0, LBB1_4
;;
## BB#6:                                ## %for.inc15
                                        ##   in Loop: Header=BB1_2 Depth=1
	c0	add $r0.11 = $r0.11, 1
	c0	add $r0.59 = $r0.59, 40
	c0	add $r0.58 = $r0.58, 40
;;
	c0	cmplt $b0.0 = $r0.11, 10
;;
	c0	br $b0.0, LBB1_2
;;
	c0	goto LBB1_7
;;
LBB1_5::                                ## %if.then
	c0	mov $r0.57 = 666
	c0	mov $r0.3 = str2
;;
.call puts, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = puts
;;
	c0	goto LBB1_8
;;
LBB1_7::                                ## %for.end17
	c0	mov $r0.57 = -1
	c0	mov $r0.3 = str
;;
.call puts, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = puts
;;
LBB1_8::                                ## %return
	c0	mov $r0.3 = $r0.57
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
	.align	2                       ## @a
a::
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1

	.align	2                       ## @b
b::
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	4294967295              ## 0xffffffff
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1
	.data4	1                       ## 0x1

.section .bss .section .data
	.align	2                       ## @c
c::
	.skip	400

.section .data
	.align	2                       ## @result
result::
	.data4	8                       ## 0x8
	.data4	4                       ## 0x4
	.data4	4                       ## 0x4
	.data4	0                       ## 0x0
	.data4	2                       ## 0x2
	.data4	4                       ## 0x4
	.data4	2                       ## 0x2
	.data4	4                       ## 0x4
	.data4	6                       ## 0x6
	.data4	4                       ## 0x4
	.data4	6                       ## 0x6
	.data4	10                      ## 0xa
	.data4	10                      ## 0xa
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	10                      ## 0xa
	.data4	8                       ## 0x8
	.data4	10                      ## 0xa
	.data4	6                       ## 0x6
	.data4	10                      ## 0xa
	.data4	10                      ## 0xa
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	10                      ## 0xa
	.data4	8                       ## 0x8
	.data4	10                      ## 0xa
	.data4	6                       ## 0x6
	.data4	10                      ## 0xa
	.data4	10                      ## 0xa
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	10                      ## 0xa
	.data4	8                       ## 0x8
	.data4	10                      ## 0xa
	.data4	2                       ## 0x2
	.data4	6                       ## 0x6
	.data4	6                       ## 0x6
	.data4	2                       ## 0x2
	.data4	8                       ## 0x8
	.data4	2                       ## 0x2
	.data4	4                       ## 0x4
	.data4	6                       ## 0x6
	.data4	4                       ## 0x4
	.data4	6                       ## 0x6
	.data4	4                       ## 0x4
	.data4	8                       ## 0x8
	.data4	8                       ## 0x8
	.data4	4                       ## 0x4
	.data4	6                       ## 0x6
	.data4	4                       ## 0x4
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	4                       ## 0x4
	.data4	8                       ## 0x8
	.data4	8                       ## 0x8
	.data4	4                       ## 0x4
	.data4	6                       ## 0x6
	.data4	4                       ## 0x4
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	4                       ## 0x4
	.data4	8                       ## 0x8
	.data4	8                       ## 0x8
	.data4	4                       ## 0x4
	.data4	6                       ## 0x6
	.data4	4                       ## 0x4
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	6                       ## 0x6
	.data4	10                      ## 0xa
	.data4	10                      ## 0xa
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	10                      ## 0xa
	.data4	8                       ## 0x8
	.data4	10                      ## 0xa
	.data4	6                       ## 0x6
	.data4	10                      ## 0xa
	.data4	10                      ## 0xa
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	6                       ## 0x6
	.data4	8                       ## 0x8
	.data4	10                      ## 0xa
	.data4	8                       ## 0x8
	.data4	10                      ## 0xa

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
