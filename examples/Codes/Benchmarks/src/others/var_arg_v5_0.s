.section .text

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @FindMax
FindMax::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 76[$r0.1] = $r0.10
;;
	c0	stw 56[$r0.1] = $r0.5
	c0	add $r0.2 = $r0.1, 52
;;
	c0	stw 52[$r0.1] = $r0.4
	c0	or $r0.4 = $r0.2, 4
;;
	c0	stw 64[$r0.1] = $r0.7
;;
	c0	stw 68[$r0.1] = $r0.8
;;
	c0	stw 72[$r0.1] = $r0.9
;;
	c0	stw 60[$r0.1] = $r0.6
;;
	c0	stw 48[$r0.1] = $r0.3
;;
	c0	stw 32[$r0.1] = $r0.2
;;
	c0	stw 32[$r0.1] = $r0.4
;;
	c0	ldw $r0.3 = 52[$r0.1]
;;
;;
.return ret($r0.3:s32)
	c0	stw 36[$r0.1] = $r0.3
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-128, arg() ## @main
main::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -128
;;
	c0	stw 124[$r0.1] = $r0.57
;;
	c0	stw 120[$r0.1] = $r0.58
;;
	c0	stw 116[$r0.1] = $r0.59
;;
	c0	stw 112[$r0.1] = $r0.60
;;
	c0	stw 108[$r0.1] = $r0.61
;;
	c0	stw 104[$r0.1] = $r0.62
;;
	c0	stw 100[$r0.1] = $r0.63
;;
	c0	stw 96[$r0.1] = $l0.0
	c0	mov $r0.2 = 0
;;
	c0	stw 84[$r0.1] = $r0.2
	c0	mov $r0.7 = 834
;;
	c0	stw 56[$r0.1] = $r0.7
	c0	mov $r0.6 = 631
;;
	c0	stw 52[$r0.1] = $r0.6
	c0	mov $r0.63 = 422
;;
	c0	stw 92[$r0.1] = $r0.2
	c0	mov $r0.4 = 702
;;
	c0	stw 28[$r0.1] = $r0.4
	c0	mov $r0.3 = 4
;;
	c0	stw 80[$r0.1] = $r0.3
	c0	mov $r0.60 = $r0.4
	c0	mov $r0.5 = $r0.63
	c0	mov $r0.58 = $r0.6
;;
.call FindMax, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	mov $r0.57 = $r0.7
	c0	call $l0.0 = FindMax
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = .str
;;
	c0	stw 32[$r0.1] = $r0.3
;;
	c0	stw 88[$r0.1] = $r0.2
	c0	mov $r0.62 = $r0.3
	c0	mov $r0.4 = $r0.2
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	mov $r0.10 = 772
;;
	c0	stw 36[$r0.1] = $r0.10
	c0	mov $r0.9 = 104
;;
	c0	stw 60[$r0.1] = $r0.9
	c0	mov $r0.8 = 892
	c0	mov $r0.3 = 7
;;
	c0	stw 76[$r0.1] = $r0.3
	c0	mov $r0.4 = $r0.60
	c0	mov $r0.5 = $r0.63
	c0	mov $r0.6 = $r0.58
;;
	c0	mov $r0.60 = $r0.58
	c0	mov $r0.7 = $r0.57
	c0	mov $r0.59 = $r0.57
	c0	mov $r0.58 = $r0.8
;;
.call FindMax, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	mov $r0.57 = $r0.9
	c0	call $l0.0 = FindMax
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.61 = 100
;;
	c0	stw 72[$r0.1] = $r0.61
;;
	c0	stw 88[$r0.1] = $r0.2
	c0	mov $r0.3 = $r0.62
	c0	mov $r0.4 = $r0.2
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	stw 16[$r0.1] = $r0.61
	c0	mov $r0.2 = 102
;;
	c0	stw 64[$r0.1] = $r0.2
	c0	mov $r0.3 = 101
;;
	c0	stw 44[$r0.1] = $r0.3
	c0	mov $r0.62 = 10
;;
	c0	stw 24[$r0.1] = $r0.2
	c0	mov $r0.2 = 3
;;
	c0	stw 48[$r0.1] = $r0.2
	c0	mov $r0.2 = 11
;;
	c0	stw 68[$r0.1] = $r0.2
	c0	mov $r0.2 = 9
;;
	c0	stw 40[$r0.1] = $r0.2
;;
	c0	stw 20[$r0.1] = $r0.3
	c0	mov $r0.3 = $r0.62
;;
	c0	ldw $r0.61 = 28[$r0.1]
;;
;;
	c0	mov $r0.4 = $r0.61
	c0	mov $r0.5 = $r0.63
	c0	mov $r0.6 = $r0.60
	c0	mov $r0.7 = $r0.59
;;
	c0	mov $r0.8 = $r0.58
	c0	mov $r0.9 = $r0.57
	c0	ldw $r0.60 = 36[$r0.1]
;;
;;
	c0	mov $r0.10 = $r0.60
;;
.call FindMax, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = FindMax
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.59 = 5
;;
	c0	stw 88[$r0.1] = $r0.2
;;
	c0	ldw $r0.57 = 32[$r0.1]
;;
;;
	c0	mov $r0.3 = $r0.57
	c0	mov $r0.4 = $r0.2
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	mov $r0.2 = 8
	c0	mov $r0.3 = 12
	c0	mov $r0.4 = 6
;;
	c0	stw 64[$r0.1] = $r0.3
	c0	mov $r0.3 = 20
;;
	c0	stw 56[$r0.1] = $r0.62
;;
	c0	ldw $r0.5 = 40[$r0.1]
;;
;;
	c0	stw 52[$r0.1] = $r0.5
;;
	c0	stw 48[$r0.1] = $r0.2
;;
	c0	ldw $r0.2 = 76[$r0.1]
;;
;;
	c0	stw 44[$r0.1] = $r0.2
;;
	c0	stw 40[$r0.1] = $r0.4
;;
	c0	stw 36[$r0.1] = $r0.59
;;
	c0	ldw $r0.2 = 80[$r0.1]
;;
;;
	c0	stw 32[$r0.1] = $r0.2
;;
	c0	ldw $r0.2 = 48[$r0.1]
;;
;;
	c0	stw 28[$r0.1] = $r0.2
;;
	c0	ldw $r0.2 = 64[$r0.1]
;;
;;
	c0	stw 24[$r0.1] = $r0.2
;;
	c0	ldw $r0.2 = 44[$r0.1]
;;
;;
	c0	stw 20[$r0.1] = $r0.2
;;
	c0	ldw $r0.2 = 72[$r0.1]
;;
;;
	c0	stw 16[$r0.1] = $r0.2
;;
	c0	ldw $r0.2 = 68[$r0.1]
;;
;;
	c0	stw 60[$r0.1] = $r0.2
	c0	mov $r0.4 = $r0.61
	c0	mov $r0.5 = $r0.63
;;
	c0	ldw $r0.6 = 52[$r0.1]
;;
	c0	ldw $r0.7 = 56[$r0.1]
	c0	mov $r0.8 = $r0.58
;;
	c0	ldw $r0.9 = 60[$r0.1]
	c0	mov $r0.10 = $r0.60
;;
;;
.call FindMax, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = FindMax
;;
	c0	mov $r0.2 = $r0.3
;;
	c0	stw 88[$r0.1] = $r0.2
	c0	mov $r0.3 = $r0.57
	c0	mov $r0.4 = $r0.2
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	ldw $r0.3 = 84[$r0.1]
;;
	c0	ldw $l0.0 = 96[$r0.1]
;;
	c0	ldw $r0.63 = 100[$r0.1]
;;
	c0	ldw $r0.62 = 104[$r0.1]
;;
	c0	ldw $r0.61 = 108[$r0.1]
;;
	c0	ldw $r0.60 = 112[$r0.1]
;;
	c0	ldw $r0.59 = 116[$r0.1]
;;
	c0	ldw $r0.58 = 120[$r0.1]
;;
.return ret($r0.3:s32)
	c0	ldw $r0.57 = 124[$r0.1]
	c0	return $r0.1 = $r0.1, 128, $l0.0
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
