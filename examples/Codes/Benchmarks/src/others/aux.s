.section .text

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @func
sum_args::
## BB#0:                                ## %entry
	c0	add $r0.3 = $r0.3, $r0.4
	c0	add $r0.5 = $r0.5, $r0.6
;;
.return ret($r0.3:s32)
	c0	add $r0.3 = $r0.3, $r0.5
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

