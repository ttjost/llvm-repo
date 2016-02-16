	.section .text
	.proc 
_start::

	c0	mov $r0.1 = __STACK_START
/*	c0	mov $r0.1 = 0x1000      either use __STACK_START or some manually chosen value for stack pointer  */
;;
	c0	call $l0.0 = main
;;
	c0	stop 
;;
	c0	nop
;;
	.endp

