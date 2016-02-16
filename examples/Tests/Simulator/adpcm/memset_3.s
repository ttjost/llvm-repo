.section .text

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @memset
memset::
## BB#0:                                ## %entry
	c0	cmpeq $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB0_6
;;
## BB#1:                                ## %while.body.lr.ph
	c0	and $r0.7 = $r0.5, -4
	c0	mov $r0.10 = 0
;;
	c0	cmpeq $b0.0 = $r0.7, 0
	c0	mov $r0.6 = $r0.3
	c0	mov $r0.2 = $r0.5
;;
;;
	c0	br $b0.0, LBB0_4
;;
## BB#2:                                ## %vector.ph
	c0	sub $r0.2 = $r0.5, $r0.7
	c0	add $r0.6 = $r0.3, $r0.7
	c0	and $r0.8 = $r0.5, -4
	c0	mov $r0.9 = $r0.3
;;
LBB0_3:                                 ## %vector.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.8 = $r0.8, -4
	c0	stb 0[$r0.9] = $r0.4
;;
	c0	stb 1[$r0.9] = $r0.4
	c0	cmpne $b0.0 = $r0.8, 0
	c0	add $r0.10 = $r0.9, 4
;;
	c0	stb 2[$r0.9] = $r0.4
;;
	c0	stb 3[$r0.9] = $r0.4
	c0	mov $r0.9 = $r0.10
	c0	mov $r0.10 = $r0.7
	c0	br $b0.0, LBB0_3
;;
LBB0_4:                                 ## %middle.block
	c0	cmpeq $b0.0 = $r0.10, $r0.5
;;
;;
	c0	br $b0.0, LBB0_6
;;
LBB0_5:                                 ## %while.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	add $r0.2 = $r0.2, -1
	c0	add $r0.5 = $r0.6, 1
;;
	c0	cmpne $b0.0 = $r0.2, 0
	c0	stb 0[$r0.6] = $r0.4
	c0	mov $r0.6 = $r0.5
;;
;;
	c0	br $b0.0, LBB0_5
;;
LBB0_6:                                 ## %while.end
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp


