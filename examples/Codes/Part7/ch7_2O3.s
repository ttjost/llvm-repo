.section .text
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @main
main::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $l0.0
;;                                      ## 4-byte Folded Spill
	c0	stw 24[$r0.1] = $r0.57
;;                                      ## 4-byte Folded Spill
	c0	stw 20[$r0.1] = $r0.58
;;                                      ## 4-byte Folded Spill
	c0	stw 16[$r0.1] = $r0.59
	c0	mov $r0.11 = b
	c0	mov $r0.12 = 8
	c0	mov $r0.13 = 24
;;
	c0	mov $r0.57 = .str
	c0	ldw $r0.11 = 0[$r0.11]
;;
	c0	shru $r0.4 = $r0.11, $r0.13
;;
	c0	shru $r0.11 = $r0.11, $r0.12
	c0	mov $r0.58 = 125
	c0	mov $r0.59 = 96
;;
	c0	and $r0.5 = $r0.11, 255
	c0	mov $r0.3 = $r0.57
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	mov $r0.3 = $r0.57
;;
	c0	mov $r0.4 = $r0.59
;;
	c0	mov $r0.5 = $r0.58
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	mov $r0.3 = 0
	c0	ldw $r0.59 = 16[$r0.1]
;;
	c0	ldw $r0.58 = 20[$r0.1]
;;                                      ## 4-byte Folded Reload
	c0	ldw $r0.57 = 24[$r0.1]
;;                                      ## 4-byte Folded Reload
	c0	ldw $l0.0 = 28[$r0.1]
;;                                      ## 4-byte Folded Reload
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .data
	.align	2                       ## @b
b::
	.data1 97
	.data1 98
	.data1 99
	.data1 0

	.section	.rodata.str1.1,"aMS",@progbits,1
.str::                                  ## @.str
	.data1 37
	.data1 99
	.data1 32
	.data1 37
	.data1 99
	.data1 10
	.data1 0


