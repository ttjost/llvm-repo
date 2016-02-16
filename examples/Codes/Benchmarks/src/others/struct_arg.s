.section .text

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @st200_clone
st200_clone::
## BB#0:                                ## %entry
	c0	add $r0.2 = $r0.4, $r0.3
;;
	c0	add $r0.2 = $r0.2, $r0.7
	c0	ldw $r0.3 = 32[$r0.1]
;;
	c0	add $r0.2 = $r0.2, $r0.8
;;
	c0	add $r0.2 = $r0.2, $r0.9
	c0	ldw $r0.4 = 0[$r0.5]
;;
	c0	add $r0.2 = $r0.2, $r0.10
	c0	cmpeq $b0.0 = $r0.3, 0
	c0	mov $r0.3 = 1
	c0	ldw $r0.5 = 0[$r0.6]
;;
	c0	add $r0.2 = $r0.2, $r0.4
;;
	c0	slct $r0.3 = $b0.0, $r0.3, 2
	c0	add $r0.2 = $r0.2, $r0.5
;;
.return ret($r0.3:s32)
	c0	shl $r0.3 = $r0.2, $r0.3
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
	c0	stw 28[$r0.1] = $r0.57
;;
	c0	stw 24[$r0.1] = $l0.0
	c0	mov $r0.57 = .str
;;
	c0	mov $r0.4 = 242218
	c0	mov $r0.3 = $r0.57
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	mov $r0.4 = 484436
	c0	mov $r0.3 = $r0.57
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	mov $r0.3 = 1
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

	.section	.rodata.str1.1,"aMS",@progbits,1
.str:                                   ## @.str
	.data1 37
	.data1 100
	.data1 10
	.data1 10
	.data1 0
.skip 3


