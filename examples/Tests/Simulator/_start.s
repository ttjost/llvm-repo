	.section .text
	.proc 
_start::
	c0	mov $r0.1 = __STACK_START
;;
	c0	call $l0.0 = main
;;
	c0	stop 
;;
	c0	nop
;;
	.endp

