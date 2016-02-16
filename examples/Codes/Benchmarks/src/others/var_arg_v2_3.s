.section .text

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @FindMax
FindMax::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
	c0	mov $r0.2 = $r0.3
;;
	c0	add $r0.11 = $r0.1, 20
	c0	stw 44[$r0.1] = $r0.10
;;
	c0	stw 36[$r0.1] = $r0.8
;;
	c0	stw 32[$r0.1] = $r0.7
;;
	c0	stw 28[$r0.1] = $r0.6
;;
	c0	stw 24[$r0.1] = $r0.5
	c0	or $r0.3 = $r0.11, 4
;;
	c0	stw 20[$r0.1] = $r0.4
	c0	cmplt $b0.0 = $r0.2, 2
;;
	c0	stw 40[$r0.1] = $r0.9
;;
	c0	stw 16[$r0.1] = $r0.11
;;
	c0	stw 16[$r0.1] = $r0.3
;;
	c0	ldw $r0.3 = 20[$r0.1]
	c0	br $b0.0, LBB0_3
;;
## BB#1:                                ## %for.body.preheader
	c0	add $r0.2 = $r0.2, -1
	c0	add $r0.4 = $r0.11, 8
;;
LBB0_2:                                 ## %for.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	stw 16[$r0.1] = $r0.4
	c0	add $r0.2 = $r0.2, -1
;;
	c0	ldw $r0.5 = -4[$r0.4]
	c0	add $r0.4 = $r0.4, 4
;;
;;
	c0	max $r0.3 = $r0.3, $r0.5
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB0_2
;;
LBB0_3:                                 ## %for.end
.return ret($r0.3:s32)
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
	c0	stw 52[$r0.1] = $r0.59
;;
	c0	stw 48[$r0.1] = $r0.60
;;
	c0	stw 44[$r0.1] = $r0.61
;;
	c0	stw 40[$r0.1] = $l0.0
	c0	mov $r0.57 = 834
;;
	c0	mov $r0.58 = 631
	c0	mov $r0.3 = 4
;;
	c0	mov $r0.59 = 422
	c0	mov $r0.60 = 702
;;
	c0	mov $r0.4 = $r0.60
	c0	mov $r0.5 = $r0.59
	c0	mov $r0.6 = $r0.58
	c0	mov $r0.7 = $r0.57
;;
.call FindMax, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = FindMax
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.61 = .str
;;
	c0	mov $r0.3 = $r0.61
	c0	mov $r0.4 = $r0.2
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	mov $r0.10 = 772
	c0	mov $r0.3 = 7
;;
	c0	mov $r0.8 = 892
	c0	mov $r0.9 = 104
	c0	mov $r0.4 = $r0.60
;;
	c0	mov $r0.5 = $r0.59
	c0	mov $r0.6 = $r0.58
	c0	mov $r0.7 = $r0.57
;;
.call FindMax, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = FindMax
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.61
;;
	c0	mov $r0.4 = $r0.2
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	mov $r0.3 = 0
	c0	ldw $l0.0 = 40[$r0.1]
;;
	c0	ldw $r0.61 = 44[$r0.1]
;;
	c0	ldw $r0.60 = 48[$r0.1]
;;
	c0	ldw $r0.59 = 52[$r0.1]
;;
	c0	ldw $r0.58 = 56[$r0.1]
;;
.return ret($r0.3:s32)
	c0	ldw $r0.57 = 60[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

	.section	.data
.str:                                   ## @.str
	.data1 84
	.data1 104
	.data1 101
	.data1 32
	.data1 108
	.data1 97
	.data1 114
	.data1 103
	.data1 101
	.data1 115
	.data1 116
	.data1 32
	.data1 118
	.data1 97
	.data1 108
	.data1 117
	.data1 101
	.data1 32
	.data1 105
	.data1 115
	.data1 58
	.data1 32
	.data1 37
	.data1 100
	.data1 10
	.data1 0
.skip 6


.import printf
.type printf, @function
.import puts
.type puts, @function
