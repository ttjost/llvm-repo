.section .text
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @mul
mul::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $r0.3
;;
	c0	stw 24[$r0.1] = $r0.4
;;
	c0	ldw $r0.11 = 28[$r0.1]
;;
	c0	mpyhs $r0.12 = $r0.11, $r0.4
	c0	mpylu $r0.11 = $r0.11, $r0.4
;;
	c0	add $r0.11 = $r0.11, $r0.12
;;
	c0	mpyhs $r0.12 = $r0.11, 10
	c0	mpylu $r0.11 = $r0.11, 10
;;
.return ret($r0.3:s32)
	c0	add $r0.3 = $r0.11, $r0.12
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
	c0	stw 44[$r0.1] = $r0.57
;;
	c0	stw 40[$r0.1] = $r0.58
;;
	c0	stw 36[$r0.1] = $r0.59
;;
	c0	stw 32[$r0.1] = $l0.0
	c0	mov $r0.11 = 0
	c0	mov $r0.57 = 3
	c0	mov $r0.58 = 2
;;
	c0	stw 28[$r0.1] = $r0.11
	c0	mov $r0.3 = $r0.58
	c0	mov $r0.4 = $r0.57
;;
.call mul, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = mul
;;
	c0	mov $r0.59 = $r0.3
	c0	mov $r0.3 = $r0.58
	c0	mov $r0.4 = $r0.57
;;
.call mul, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = mul
;;
	c0	add $r0.3 = $r0.59, $r0.3
	c0	ldw $l0.0 = 32[$r0.1]
;;
	c0	ldw $r0.59 = 36[$r0.1]
;;
	c0	ldw $r0.58 = 40[$r0.1]
;;
.return ret($r0.3:s32)
	c0	ldw $r0.57 = 44[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp


