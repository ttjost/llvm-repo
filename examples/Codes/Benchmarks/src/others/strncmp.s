.section .text

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @strncmp
strncmp::
## BB#0:                                ## %entry
	c0	mov $r0.11 = 0
	c0	cmpeq $b0.0 = $r0.5, 0
	c0	mov $r0.12 = $r0.5
	c0	mov $r0.13 = $r0.4
;;
	c0	mov $r0.14 = $r0.3
;;
	c0	br $b0.0, LBB0_5
;;
LBB0_1:                                 ## %for.body
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldbu $r0.16 = 0[$r0.13]
;;
	c0	ldbu $r0.15 = 0[$r0.14]
;;
;;
	c0	cmpeq $b0.0 = $r0.15, $r0.16
;;
;;
	c0	brf $b0.0, LBB0_2
;;
## BB#3:                                ## %if.else
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	cmpeq $b0.0 = $r0.15, 0
;;
;;
	c0	br $b0.0, LBB0_5
;;
## BB#4:                                ## %for.inc
                                        ##   in Loop: Header=BB0_1 Depth=1
	c0	add $r0.12 = $r0.12, -1
	c0	add $r0.14 = $r0.14, 1
	c0	add $r0.13 = $r0.13, 1
;;
	c0	cmpne $b0.0 = $r0.12, 0
;;
;;
	c0	br $b0.0, LBB0_1
;;
	c0	goto LBB0_5
;;
LBB0_2:                                 ## %if.then
	c0	cmpltu $b0.0 = $r0.15, $r0.16
	c0	mov $r0.11 = -1
;;
;;
	c0	slct $r0.11 = $b0.0, $r0.11, 1
;;
LBB0_5:                                 ## %return
.return ret($r0.3:s32)
	c0	mov $r0.3 = $r0.11
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp


