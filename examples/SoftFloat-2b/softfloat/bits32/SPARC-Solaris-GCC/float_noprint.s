	#.text
#.globl main
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32) ## @main
main::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $r0.57
;;
	c0	stw 24[$r0.1] = $r0.58
	c0	mov $r0.2 = b
	c0	mov $r0.3 = a
;;
	c0	ldw $r0.4 = 0[$r0.2]
;;
	c0	ldw $r0.3 = 0[$r0.3]
	c0	mov $r0.58 = c
	c0	mov $r0.57 = 0
;;
.call float32_mul, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = float32_mul
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.57
;;
	c0	stw 0[$r0.58] = $r0.2
;;
	c0	ldw $r0.58 = 24[$r0.1]
;;
.return ret($r0.3:s32)
	c0	ldw $r0.57 = 28[$r0.1]
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .data
#.globl a                               ## @a
	.align	4
a:
	.data4	1067030938              ## float 1.20000005

#.globl b                               ## @b
	.align	4
b:
	.data4	1075419546              ## float 2.4000001

	.comm	c,4,4                   ## @c

.import float32_mul
.type float32_mul, @function
