.section .text

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @__delay
__delay::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $r0.3
;;
	##APP
	1:
	c0	 cmpeq 	$b0.0 = $r0.3, $r0.0
;;
;;
	c0	 brf 	$b0.0, 1b
	c0	 add 	$r0.3 = $r0.3, -1
;;

	##NO_APP
.return ret($r0.3:s32)
	c0	stw 28[$r0.1] = $r0.3
	c0	return $r0.1 = $r0.1, 32, $l0.0
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
	c0	mov $r0.57 = 0
	c0	mov $r0.3 = 1000
;;
.call __delay, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	stw 20[$r0.1] = $r0.57
	c0	call $l0.0 = __delay
;;
	c0	mov $r0.3 = $r0.57
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


