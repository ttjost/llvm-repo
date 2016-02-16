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
	c0	stw 60[$r0.1] = $r0.6
;;
	c0	stw 64[$r0.1] = $r0.7
;;
	c0	stw 68[$r0.1] = $r0.8
;;
	c0	stw 72[$r0.1] = $r0.9
;;
	c0	stw 48[$r0.1] = $r0.3
;;
	c0	stw 32[$r0.1] = $r0.2
;;
	c0	stw 32[$r0.1] = $r0.4
;;
	c0	ldw $r0.2 = 52[$r0.1]
	c0	mov $r0.3 = 1
;;
;;
	c0	stw 36[$r0.1] = $r0.2
;;
	c0	stw 44[$r0.1] = $r0.3
;;
LBB0_1:                                 ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.2 = 48[$r0.1]
;;
	c0	ldw $r0.3 = 44[$r0.1]
;;
;;
	c0	cmpge $b0.0 = $r0.3, $r0.2
;;
;;
	c0	br $b0.0, LBB0_7
;;
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.2 = 32[$r0.1]
;;
;;
	c0	add $r0.3 = $r0.2, 4
;;
	c0	stw 32[$r0.1] = $r0.3
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
;;
	c0	stw 40[$r0.1] = $r0.2
;;
	c0	ldw $r0.3 = 36[$r0.1]
;;
;;
	c0	cmple $b0.0 = $r0.3, $r0.2
;;
;;
	c0	br $b0.0, LBB0_4
;;
## BB#3:                                ## %cond.true
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.2 = 36[$r0.1]
	c0	goto LBB0_5
;;
LBB0_4:                                 ## %cond.false
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.2 = 40[$r0.1]
;;
LBB0_5:                                 ## %cond.end
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	stw 36[$r0.1] = $r0.2
;;
## BB#6:                                ## %for.inc
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	ldw $r0.2 = 44[$r0.1]
;;
;;
	c0	add $r0.2 = $r0.2, 1
;;
	c0	stw 44[$r0.1] = $r0.2
	c0	goto LBB0_1
;;
LBB0_7:                                 ## %for.end
.return ret($r0.3:s32)
	c0	ldw $r0.3 = 36[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg() ## @main
main::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -96
;;
	c0	stw 92[$r0.1] = $r0.57
;;
	c0	stw 88[$r0.1] = $r0.58
;;
	c0	stw 84[$r0.1] = $r0.59
;;
	c0	stw 80[$r0.1] = $r0.60
;;
	c0	stw 76[$r0.1] = $r0.61
;;
	c0	stw 72[$r0.1] = $r0.62
;;
	c0	stw 68[$r0.1] = $r0.63
;;
	c0	stw 64[$r0.1] = $l0.0
	c0	mov $r0.2 = 0
;;
	c0	stw 52[$r0.1] = $r0.2
	c0	mov $r0.58 = 834
;;
	c0	mov $r0.59 = 631
	c0	mov $r0.60 = 422
;;
	c0	stw 60[$r0.1] = $r0.2
	c0	mov $r0.61 = 702
	c0	mov $r0.3 = 4
;;
	c0	mov $r0.4 = $r0.61
	c0	mov $r0.5 = $r0.60
	c0	mov $r0.6 = $r0.59
	c0	mov $r0.7 = $r0.58
;;
.call FindMax, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = FindMax
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.62 = .str
;;
	c0	stw 56[$r0.1] = $r0.2
	c0	mov $r0.3 = $r0.62
	c0	mov $r0.4 = $r0.2
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	mov $r0.10 = 772
;;
	c0	stw 48[$r0.1] = $r0.10
	c0	mov $r0.3 = 7
	c0	mov $r0.9 = 104
;;
	c0	stw 44[$r0.1] = $r0.9
	c0	mov $r0.63 = 892
	c0	mov $r0.4 = $r0.61
;;
	c0	mov $r0.5 = $r0.60
	c0	mov $r0.6 = $r0.59
	c0	mov $r0.7 = $r0.58
	c0	mov $r0.8 = $r0.63
;;
.call FindMax, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = FindMax
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.57 = 100
;;
	c0	stw 56[$r0.1] = $r0.2
	c0	mov $r0.3 = $r0.62
	c0	mov $r0.4 = $r0.2
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	mov $r0.2 = 102
	c0	mov $r0.4 = 101
;;
	c0	stw 24[$r0.1] = $r0.2
	c0	mov $r0.3 = 10
;;
	c0	stw 16[$r0.1] = $r0.57
;;
	c0	stw 20[$r0.1] = $r0.4
	c0	mov $r0.4 = $r0.61
	c0	mov $r0.5 = $r0.60
	c0	mov $r0.6 = $r0.59
;;
	c0	mov $r0.7 = $r0.58
	c0	mov $r0.8 = $r0.63
	c0	ldw $r0.9 = 44[$r0.1]
;;
	c0	ldw $r0.10 = 48[$r0.1]
;;
;;
.call FindMax, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = FindMax
;;
	c0	mov $r0.2 = $r0.3
;;
	c0	stw 56[$r0.1] = $r0.2
	c0	mov $r0.3 = $r0.62
	c0	mov $r0.4 = $r0.2
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	ldw $r0.3 = 52[$r0.1]
;;
	c0	ldw $l0.0 = 64[$r0.1]
;;
	c0	ldw $r0.63 = 68[$r0.1]
;;
	c0	ldw $r0.62 = 72[$r0.1]
;;
	c0	ldw $r0.61 = 76[$r0.1]
;;
	c0	ldw $r0.60 = 80[$r0.1]
;;
	c0	ldw $r0.59 = 84[$r0.1]
;;
	c0	ldw $r0.58 = 88[$r0.1]
;;
.return ret($r0.3:s32)
	c0	ldw $r0.57 = 92[$r0.1]
	c0	return $r0.1 = $r0.1, 96, $l0.0
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
