.section .text

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @abs
abs::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
	c0	cmpgt $b0.0 = $r0.3, -1
;;
	c0	stw 28[$r0.1] = $r0.3
;;
	c0	br $b0.0, LBB0_2
;;
## BB#1:                                ## %cond.true
	c0	ldw $r0.2 = 28[$r0.1]
	c0	mov $r0.3 = 0
;;
;;
	c0	sub $r0.3 = $r0.3, $r0.2
	c0	goto LBB0_3
;;
LBB0_2:                                 ## %cond.false
	c0	ldw $r0.3 = 28[$r0.1]
;;
LBB0_3:                                 ## %cond.end
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @memcpy
memcpy::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 60[$r0.1] = $r0.3
;;
	c0	stw 56[$r0.1] = $r0.4
;;
	c0	stw 52[$r0.1] = $r0.5
;;
	c0	ldw $r0.2 = 60[$r0.1]
;;
;;
	c0	stw 48[$r0.1] = $r0.2
;;
	c0	ldw $r0.2 = 56[$r0.1]
;;
;;
	c0	stw 44[$r0.1] = $r0.2
;;
LBB1_1:                                 ## %while.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.2 = 52[$r0.1]
;;
;;
	c0	add $r0.3 = $r0.2, -1
	c0	cmpeq $b0.0 = $r0.2, 0
;;
	c0	stw 52[$r0.1] = $r0.3
;;
	c0	br $b0.0, LBB1_3
;;
## BB#2:                                ## %while.body
                                        ##   in Loop: Header=BB1_1 Depth=1
	c0	ldw $r0.2 = 44[$r0.1]
;;
	c0	ldw $r0.3 = 48[$r0.1]
;;
	c0	ldb $r0.2 = 0[$r0.2]
;;
;;
	c0	stb 0[$r0.3] = $r0.2
;;
	c0	ldw $r0.2 = 48[$r0.1]
;;
;;
	c0	add $r0.2 = $r0.2, 1
;;
	c0	stw 48[$r0.1] = $r0.2
;;
	c0	ldw $r0.2 = 44[$r0.1]
;;
;;
	c0	add $r0.2 = $r0.2, 1
;;
	c0	stw 44[$r0.1] = $r0.2
	c0	goto LBB1_1
;;
LBB1_3:                                 ## %while.end
.return ret($r0.3:s32)
	c0	ldw $r0.3 = 60[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @strncmp
strncmp::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 56[$r0.1] = $r0.3
;;
	c0	stw 52[$r0.1] = $r0.4
;;
	c0	stw 48[$r0.1] = $r0.5
	c0	mov $r0.2 = 0
;;
	c0	stw 44[$r0.1] = $r0.2
;;
LBB2_1:                                 ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.3 = 48[$r0.1]
;;
	c0	ldw $r0.4 = 44[$r0.1]
;;
;;
	c0	cmpgeu $b0.0 = $r0.4, $r0.3
;;
;;
	c0	br $b0.0, LBB2_7
;;
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	ldw $r0.3 = 52[$r0.1]
;;
	c0	ldw $r0.4 = 56[$r0.1]
;;
	c0	ldw $r0.5 = 44[$r0.1]
;;
;;
	c0	add $r0.3 = $r0.3, $r0.5
	c0	add $r0.4 = $r0.4, $r0.5
;;
	c0	ldb $r0.3 = 0[$r0.3]
;;
	c0	ldb $r0.4 = 0[$r0.4]
;;
;;
	c0	cmpge $b0.0 = $r0.4, $r0.3
;;
;;
	c0	brf $b0.0, LBB2_3
;;
## BB#4:                                ## %if.else
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	ldw $r0.3 = 52[$r0.1]
;;
	c0	ldw $r0.4 = 56[$r0.1]
;;
	c0	ldw $r0.5 = 44[$r0.1]
;;
;;
	c0	add $r0.3 = $r0.3, $r0.5
	c0	add $r0.4 = $r0.4, $r0.5
;;
	c0	ldb $r0.3 = 0[$r0.3]
;;
	c0	ldb $r0.4 = 0[$r0.4]
;;
;;
	c0	cmple $b0.0 = $r0.4, $r0.3
;;
;;
	c0	brf $b0.0, LBB2_5
;;
## BB#6:                                ## %for.inc
                                        ##   in Loop: Header=BB2_1 Depth=1
	c0	ldw $r0.3 = 44[$r0.1]
;;
;;
	c0	add $r0.3 = $r0.3, 1
;;
	c0	stw 44[$r0.1] = $r0.3
	c0	goto LBB2_1
;;
LBB2_3:                                 ## %if.then
	c0	mov $r0.2 = -1
;;
	c0	stw 60[$r0.1] = $r0.2
	c0	goto LBB2_8
;;
LBB2_5:                                 ## %if.then11
	c0	mov $r0.2 = 1
;;
	c0	stw 60[$r0.1] = $r0.2
	c0	goto LBB2_8
;;
LBB2_7:                                 ## %for.end
	c0	stw 60[$r0.1] = $r0.2
;;
LBB2_8:                                 ## %return
.return ret($r0.3:s32)
	c0	ldw $r0.3 = 60[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @rand
rand::
## BB#0:                                ## %entry
	c0	mov $r0.2 = rand.next
;;
	c0	ldw $r0.3 = 0[$r0.2]
;;
;;
	c0	mpyhs $r0.4 = $r0.3, 1103515245
	c0	mpylu $r0.3 = $r0.3, 1103515245
;;
;;
	c0	add $r0.3 = $r0.3, $r0.4
;;
	c0	add $r0.3 = $r0.3, 12345
;;
	c0	stw 0[$r0.2] = $r0.3
;;
	c0	ldhu $r0.2 = 0[$r0.2]
;;
;;
.return ret($r0.3:s32)
	c0	and $r0.3 = $r0.2, 32767
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-192, arg() ## @encode
encode::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -192
;;
	c0	stw 188[$r0.1] = $r0.57
;;
	c0	stw 184[$r0.1] = $r0.58
;;
	c0	stw 180[$r0.1] = $r0.59
;;
	c0	stw 176[$r0.1] = $r0.60
;;
	c0	stw 172[$r0.1] = $r0.61
;;
	c0	stw 168[$r0.1] = $r0.62
;;
	c0	stw 164[$r0.1] = $r0.63
;;
	c0	stw 160[$r0.1] = $l0.0
;;
	c0	stw 156[$r0.1] = $r0.3
;;
	c0	stw 152[$r0.1] = $r0.4
	c0	mov $r0.2 = h
	c0	mov $r0.3 = tqmf
;;
	c0	stw 144[$r0.1] = $r0.2
	c0	add $r0.2 = $r0.3, 4
;;
	c0	stw 140[$r0.1] = $r0.3
;;
	c0	stw 140[$r0.1] = $r0.2
;;
	c0	ldw $r0.2 = 144[$r0.1]
;;
	c0	ldw $r0.3 = 0[$r0.3]
;;
	c0	add $r0.4 = $r0.2, 4
;;
	c0	stw 144[$r0.1] = $r0.4
;;
	c0	ldw $r0.4 = 0[$r0.2]
	c0	mov $r0.2 = 0
;;
;;
	c0	mpyhs $r0.5 = $r0.3, $r0.4
	c0	mpylu $r0.3 = $r0.3, $r0.4
;;
;;
	c0	add $r0.3 = $r0.3, $r0.5
;;
	c0	stw 132[$r0.1] = $r0.3
;;
	c0	ldw $r0.3 = 140[$r0.1]
;;
;;
	c0	add $r0.4 = $r0.3, 4
;;
	c0	stw 140[$r0.1] = $r0.4
;;
	c0	ldw $r0.4 = 144[$r0.1]
;;
	c0	ldw $r0.3 = 0[$r0.3]
;;
	c0	add $r0.5 = $r0.4, 4
;;
	c0	stw 144[$r0.1] = $r0.5
;;
	c0	ldw $r0.4 = 0[$r0.4]
;;
;;
	c0	mpyhs $r0.5 = $r0.3, $r0.4
	c0	mpylu $r0.3 = $r0.3, $r0.4
;;
;;
	c0	add $r0.3 = $r0.3, $r0.5
;;
	c0	stw 128[$r0.1] = $r0.3
;;
	c0	stw 148[$r0.1] = $r0.2
;;
LBB4_1:                                 ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.3 = 148[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.3, 9
;;
;;
	c0	br $b0.0, LBB4_4
;;
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB4_1 Depth=1
	c0	ldw $r0.3 = 140[$r0.1]
;;
;;
	c0	add $r0.4 = $r0.3, 4
;;
	c0	stw 140[$r0.1] = $r0.4
;;
	c0	ldw $r0.4 = 144[$r0.1]
;;
	c0	ldw $r0.3 = 0[$r0.3]
;;
	c0	add $r0.5 = $r0.4, 4
;;
	c0	stw 144[$r0.1] = $r0.5
;;
	c0	ldw $r0.4 = 0[$r0.4]
;;
	c0	ldw $r0.5 = 132[$r0.1]
;;
	c0	mpyhs $r0.6 = $r0.3, $r0.4
	c0	mpylu $r0.3 = $r0.3, $r0.4
;;
;;
	c0	add $r0.3 = $r0.3, $r0.6
;;
	c0	add $r0.3 = $r0.5, $r0.3
;;
	c0	stw 132[$r0.1] = $r0.3
;;
	c0	ldw $r0.3 = 140[$r0.1]
;;
;;
	c0	add $r0.4 = $r0.3, 4
;;
	c0	stw 140[$r0.1] = $r0.4
;;
	c0	ldw $r0.4 = 144[$r0.1]
;;
	c0	ldw $r0.3 = 0[$r0.3]
;;
	c0	add $r0.5 = $r0.4, 4
;;
	c0	stw 144[$r0.1] = $r0.5
;;
	c0	ldw $r0.4 = 0[$r0.4]
;;
	c0	ldw $r0.5 = 128[$r0.1]
;;
	c0	mpyhs $r0.6 = $r0.3, $r0.4
	c0	mpylu $r0.3 = $r0.3, $r0.4
;;
;;
	c0	add $r0.3 = $r0.3, $r0.6
;;
	c0	add $r0.3 = $r0.5, $r0.3
;;
	c0	stw 128[$r0.1] = $r0.3
;;
## BB#3:                                ## %for.inc
                                        ##   in Loop: Header=BB4_1 Depth=1
	c0	ldw $r0.3 = 148[$r0.1]
;;
;;
	c0	add $r0.3 = $r0.3, 1
;;
	c0	stw 148[$r0.1] = $r0.3
	c0	goto LBB4_1
;;
LBB4_4:                                 ## %for.end
	c0	ldw $r0.3 = 140[$r0.1]
;;
;;
	c0	add $r0.4 = $r0.3, 4
;;
	c0	stw 140[$r0.1] = $r0.4
;;
	c0	ldw $r0.4 = 144[$r0.1]
;;
	c0	ldw $r0.3 = 0[$r0.3]
;;
	c0	add $r0.5 = $r0.4, 4
;;
	c0	stw 144[$r0.1] = $r0.5
;;
	c0	ldw $r0.4 = 0[$r0.4]
;;
	c0	ldw $r0.5 = 132[$r0.1]
;;
	c0	mpyhs $r0.6 = $r0.3, $r0.4
	c0	mpylu $r0.3 = $r0.3, $r0.4
;;
;;
	c0	add $r0.3 = $r0.3, $r0.6
;;
	c0	add $r0.3 = $r0.5, $r0.3
;;
	c0	stw 132[$r0.1] = $r0.3
;;
	c0	ldw $r0.3 = 140[$r0.1]
;;
	c0	ldw $r0.4 = 144[$r0.1]
;;
	c0	ldw $r0.3 = 0[$r0.3]
;;
	c0	add $r0.5 = $r0.4, 4
;;
	c0	stw 144[$r0.1] = $r0.5
;;
	c0	ldw $r0.4 = 0[$r0.4]
;;
	c0	ldw $r0.5 = 128[$r0.1]
;;
	c0	mpyhs $r0.6 = $r0.3, $r0.4
	c0	mpylu $r0.3 = $r0.3, $r0.4
;;
;;
	c0	add $r0.3 = $r0.3, $r0.6
;;
	c0	add $r0.3 = $r0.5, $r0.3
;;
	c0	stw 128[$r0.1] = $r0.3
;;
	c0	ldw $r0.3 = 140[$r0.1]
;;
;;
	c0	add $r0.3 = $r0.3, -8
;;
	c0	stw 136[$r0.1] = $r0.3
;;
	c0	stw 148[$r0.1] = $r0.2
;;
LBB4_5:                                 ## %for.cond19
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.2 = 148[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.2, 21
;;
;;
	c0	br $b0.0, LBB4_8
;;
## BB#6:                                ## %for.body21
                                        ##   in Loop: Header=BB4_5 Depth=1
	c0	ldw $r0.2 = 136[$r0.1]
;;
;;
	c0	add $r0.3 = $r0.2, -4
;;
	c0	stw 136[$r0.1] = $r0.3
;;
	c0	ldw $r0.3 = 140[$r0.1]
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
	c0	add $r0.4 = $r0.3, -4
;;
	c0	stw 140[$r0.1] = $r0.4
;;
	c0	stw 0[$r0.3] = $r0.2
;;
## BB#7:                                ## %for.inc24
                                        ##   in Loop: Header=BB4_5 Depth=1
	c0	ldw $r0.2 = 148[$r0.1]
;;
;;
	c0	add $r0.2 = $r0.2, 1
;;
	c0	stw 148[$r0.1] = $r0.2
	c0	goto LBB4_5
;;
LBB4_8:                                 ## %for.end26
	c0	ldw $r0.2 = 140[$r0.1]
	c0	mov $r0.60 = 15
;;
	c0	stw 88[$r0.1] = $r0.60
	c0	mov $r0.8 = xl
;;
	c0	stw 48[$r0.1] = $r0.8
	c0	mov $r0.5 = xh
;;
	c0	stw 84[$r0.1] = $r0.5
	c0	mov $r0.6 = delay_bpl
;;
	c0	stw 28[$r0.1] = $r0.6
	c0	mov $r0.7 = delay_dltx
;;
	c0	stw 20[$r0.1] = $r0.7
	c0	mov $r0.63 = szl
	c0	mov $r0.59 = rlt2
;;
	c0	stw 68[$r0.1] = $r0.59
	c0	add $r0.3 = $r0.2, -4
;;
	c0	ldw $r0.4 = 156[$r0.1]
;;
	c0	stw 140[$r0.1] = $r0.3
	c0	mov $r0.3 = rlt1
;;
	c0	stw 96[$r0.1] = $r0.3
	c0	mov $r0.57 = al2
;;
	c0	stw 24[$r0.1] = $r0.57
	c0	mov $r0.58 = al1
	c0	mov $r0.3 = spl
;;
	c0	stw 112[$r0.1] = $r0.3
	c0	mov $r0.61 = sl
;;
	c0	stw 40[$r0.1] = $r0.61
	c0	mov $r0.3 = el
;;
	c0	stw 64[$r0.1] = $r0.3
	c0	mov $r0.3 = detl
;;
	c0	stw 16[$r0.1] = $r0.3
;;
	c0	stw 0[$r0.2] = $r0.4
	c0	mov $r0.2 = qq4_code4_table
;;
	c0	stw 100[$r0.1] = $r0.2
	c0	mov $r0.62 = il
;;
	c0	stw 92[$r0.1] = $r0.62
	c0	mov $r0.2 = dlt
;;
	c0	stw 36[$r0.1] = $r0.2
	c0	mov $r0.2 = nbl
;;
	c0	stw 32[$r0.1] = $r0.2
	c0	mov $r0.2 = 8
;;
	c0	stw 44[$r0.1] = $r0.2
	c0	mov $r0.2 = plt
;;
	c0	stw 52[$r0.1] = $r0.2
	c0	mov $r0.2 = plt2
;;
	c0	stw 60[$r0.1] = $r0.2
;;
	c0	ldw $r0.2 = 140[$r0.1]
	c0	mov $r0.3 = plt1
;;
	c0	stw 56[$r0.1] = $r0.3
	c0	mov $r0.3 = rlt
;;
	c0	stw 72[$r0.1] = $r0.3
;;
	c0	ldw $r0.3 = 152[$r0.1]
	c0	mov $r0.4 = delay_dhx
;;
	c0	stw 80[$r0.1] = $r0.4
;;
	c0	stw 0[$r0.2] = $r0.3
;;
	c0	ldw $r0.2 = 128[$r0.1]
;;
	c0	ldw $r0.3 = 132[$r0.1]
	c0	mov $r0.4 = delay_bph
;;
	c0	stw 76[$r0.1] = $r0.4
;;
	c0	add $r0.2 = $r0.3, $r0.2
;;
	c0	shr $r0.2 = $r0.2, $r0.60
;;
	c0	stw 0[$r0.8] = $r0.2
;;
	c0	ldw $r0.2 = 128[$r0.1]
;;
	c0	ldw $r0.3 = 132[$r0.1]
	c0	mov $r0.4 = szh
;;
	c0	stw 104[$r0.1] = $r0.4
;;
	c0	stw 104[$r0.1] = $r0.4
	c0	sub $r0.2 = $r0.3, $r0.2
;;
	c0	shr $r0.2 = $r0.2, $r0.60
;;
	c0	stw 0[$r0.5] = $r0.2
	c0	mov $r0.3 = $r0.6
	c0	mov $r0.4 = $r0.7
;;
.call filtez, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = filtez
;;
	c0	mov $r0.2 = ah2
;;
	c0	stw 116[$r0.1] = $r0.2
;;
	c0	stw 116[$r0.1] = $r0.2
;;
	c0	stw 0[$r0.63] = $r0.3
;;
	c0	ldw $r0.6 = 0[$r0.57]
;;
	c0	ldw $r0.5 = 0[$r0.59]
;;
	c0	ldw $r0.4 = 0[$r0.58]
	c0	mov $r0.57 = $r0.58
;;
	c0	ldw $r0.2 = 96[$r0.1]
;;
;;
	c0	ldw $r0.3 = 0[$r0.2]
;;
.call filtep, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = filtep
;;
	c0	mov $r0.2 = rh2
;;
	c0	stw 120[$r0.1] = $r0.2
;;
	c0	stw 120[$r0.1] = $r0.2
;;
	c0	ldw $r0.2 = 112[$r0.1]
;;
;;
	c0	stw 0[$r0.2] = $r0.3
;;
	c0	ldw $r0.2 = 0[$r0.63]
	c0	mov $r0.4 = ah1
;;
	c0	stw 108[$r0.1] = $r0.4
;;
	c0	stw 108[$r0.1] = $r0.4
	c0	add $r0.2 = $r0.2, $r0.3
;;
	c0	stw 0[$r0.61] = $r0.2
;;
	c0	ldw $r0.3 = 48[$r0.1]
;;
;;
	c0	ldw $r0.3 = 0[$r0.3]
	c0	mov $r0.4 = rh1
;;
	c0	stw 112[$r0.1] = $r0.4
;;
	c0	stw 112[$r0.1] = $r0.4
	c0	sub $r0.3 = $r0.3, $r0.2
;;
	c0	ldw $r0.2 = 64[$r0.1]
;;
;;
	c0	stw 0[$r0.2] = $r0.3
;;
	c0	ldw $r0.58 = 16[$r0.1]
;;
;;
	c0	ldw $r0.4 = 0[$r0.58]
;;
;;
.call quantl, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = quantl
;;
	c0	mov $r0.2 = sph
;;
	c0	stw 64[$r0.1] = $r0.2
;;
	c0	stw 0[$r0.62] = $r0.3
	c0	and $r0.2 = $r0.3, -4
;;
	c0	ldw $r0.3 = 100[$r0.1]
;;
;;
	c0	add $r0.2 = $r0.3, $r0.2
	c0	ldw $r0.3 = 0[$r0.58]
;;
	c0	ldw $r0.2 = 0[$r0.2]
	c0	mov $r0.4 = sh
;;
	c0	stw 100[$r0.1] = $r0.4
;;
	c0	stw 100[$r0.1] = $r0.4
	c0	mpylu $r0.4 = $r0.3, $r0.2
	c0	mpyhs $r0.2 = $r0.3, $r0.2
	c0	mov $r0.3 = eh
;;
	c0	stw 48[$r0.1] = $r0.3
;;
	c0	add $r0.2 = $r0.4, $r0.2
;;
	c0	shr $r0.2 = $r0.2, $r0.60
	c0	ldw $r0.61 = 36[$r0.1]
;;
;;
	c0	stw 0[$r0.61] = $r0.2
;;
	c0	ldw $r0.60 = 32[$r0.1]
;;
;;
	c0	ldw $r0.4 = 0[$r0.60]
;;
	c0	ldw $r0.3 = 0[$r0.62]
;;
.call logscl, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = logscl
;;
	c0	stw 0[$r0.60] = $r0.3
;;
	c0	ldw $r0.4 = 44[$r0.1]
;;
;;
.call scalel, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = scalel
;;
	c0	stw 0[$r0.58] = $r0.3
;;
	c0	ldw $r0.2 = 0[$r0.63]
;;
	c0	ldw $r0.3 = 0[$r0.61]
;;
;;
	c0	add $r0.2 = $r0.3, $r0.2
	c0	ldw $r0.58 = 52[$r0.1]
;;
;;
	c0	stw 0[$r0.58] = $r0.2
;;
	c0	ldw $r0.3 = 0[$r0.61]
;;
	c0	ldw $r0.4 = 20[$r0.1]
;;
	c0	ldw $r0.5 = 28[$r0.1]
;;
;;
.call upzero, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = upzero
;;
	c0	ldw $r0.62 = 60[$r0.1]
;;
;;
	c0	ldw $r0.7 = 0[$r0.62]
;;
	c0	ldw $r0.63 = 56[$r0.1]
;;
;;
	c0	ldw $r0.6 = 0[$r0.63]
;;
	c0	ldw $r0.5 = 0[$r0.58]
	c0	mov $r0.60 = $r0.58
;;
	c0	ldw $r0.59 = 24[$r0.1]
;;
;;
	c0	ldw $r0.4 = 0[$r0.59]
;;
	c0	ldw $r0.3 = 0[$r0.57]
;;
.call uppol2, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = uppol2
;;
	c0	mov $r0.2 = $r0.3
;;
	c0	stw 0[$r0.59] = $r0.2
;;
	c0	ldw $r0.6 = 0[$r0.63]
;;
	c0	ldw $r0.5 = 0[$r0.60]
;;
	c0	ldw $r0.3 = 0[$r0.57]
	c0	mov $r0.4 = $r0.2
;;
.call uppol1, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = uppol1
;;
	c0	stw 0[$r0.57] = $r0.3
;;
	c0	ldw $r0.2 = 0[$r0.61]
;;
	c0	ldw $r0.3 = 40[$r0.1]
;;
;;
	c0	ldw $r0.3 = 0[$r0.3]
;;
;;
	c0	add $r0.2 = $r0.3, $r0.2
	c0	ldw $r0.4 = 72[$r0.1]
;;
;;
	c0	stw 0[$r0.4] = $r0.2
;;
	c0	ldw $r0.3 = 96[$r0.1]
;;
;;
	c0	ldw $r0.2 = 0[$r0.3]
;;
	c0	ldw $r0.5 = 68[$r0.1]
;;
;;
	c0	stw 0[$r0.5] = $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.4]
;;
;;
	c0	stw 0[$r0.3] = $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.63]
;;
;;
	c0	stw 0[$r0.62] = $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.60]
;;
;;
	c0	stw 0[$r0.63] = $r0.2
;;
	c0	ldw $r0.3 = 76[$r0.1]
;;
	c0	ldw $r0.4 = 80[$r0.1]
;;
;;
.call filtez, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = filtez
;;
	c0	ldw $r0.57 = 104[$r0.1]
;;
;;
	c0	stw 0[$r0.57] = $r0.3
;;
	c0	ldw $r0.2 = 116[$r0.1]
;;
;;
	c0	ldw $r0.6 = 0[$r0.2]
;;
	c0	ldw $r0.2 = 120[$r0.1]
;;
;;
	c0	ldw $r0.5 = 0[$r0.2]
;;
	c0	ldw $r0.2 = 108[$r0.1]
;;
;;
	c0	ldw $r0.4 = 0[$r0.2]
;;
	c0	ldw $r0.2 = 112[$r0.1]
;;
;;
	c0	ldw $r0.3 = 0[$r0.2]
;;
.call filtep, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = filtep
;;
	c0	ldw $r0.5 = 48[$r0.1]
;;
	c0	ldw $r0.2 = 64[$r0.1]
;;
;;
	c0	stw 0[$r0.2] = $r0.3
;;
	c0	ldw $r0.2 = 0[$r0.57]
;;
;;
	c0	add $r0.2 = $r0.3, $r0.2
	c0	ldw $r0.3 = 100[$r0.1]
;;
;;
	c0	stw 0[$r0.3] = $r0.2
;;
	c0	ldw $r0.3 = 84[$r0.1]
;;
;;
	c0	ldw $r0.3 = 0[$r0.3]
;;
;;
	c0	sub $r0.2 = $r0.3, $r0.2
;;
	c0	stw 0[$r0.5] = $r0.2
	c0	cmplt $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB4_10
;;
## BB#9:                                ## %if.then
	c0	mov $r0.2 = ih
	c0	mov $r0.3 = 3
;;
	c0	stw 0[$r0.2] = $r0.3
	c0	goto LBB4_11
;;
LBB4_10:                                ## %if.else
	c0	mov $r0.2 = ih
	c0	mov $r0.3 = 1
;;
	c0	stw 0[$r0.2] = $r0.3
;;
LBB4_11:                                ## %if.end
	c0	mov $r0.62 = deth
	c0	mov $r0.2 = 12
;;
	c0	ldw $r0.3 = 0[$r0.62]
;;
;;
	c0	mpyhs $r0.4 = $r0.3, 564
	c0	mpylu $r0.3 = $r0.3, 564
;;
;;
	c0	add $r0.3 = $r0.3, $r0.4
;;
	c0	shr $r0.2 = $r0.3, $r0.2
;;
	c0	stw 124[$r0.1] = $r0.2
;;
	c0	ldw $r0.3 = 0[$r0.5]
;;
.call abs, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = abs
;;
	c0	ldw $r0.2 = 124[$r0.1]
;;
;;
	c0	cmple $b0.0 = $r0.3, $r0.2
;;
;;
	c0	br $b0.0, LBB4_13
;;
## BB#12:                               ## %if.then52
	c0	mov $r0.2 = ih
;;
	c0	ldw $r0.3 = 0[$r0.2]
;;
;;
	c0	add $r0.3 = $r0.3, -1
;;
	c0	stw 0[$r0.2] = $r0.3
;;
LBB4_13:                                ## %if.end53
	c0	mov $r0.60 = ih
	c0	mov $r0.2 = qq2_code2_table
	c0	mov $r0.61 = nbh
	c0	mov $r0.63 = dh
;;
	c0	mov $r0.57 = 10
	c0	ldw $r0.3 = 0[$r0.60]
	c0	mov $r0.58 = ph
	c0	mov $r0.4 = delay_bph
;;
	c0	stw 80[$r0.1] = $r0.4
	c0	mov $r0.4 = delay_dhx
;;
	c0	stw 72[$r0.1] = $r0.4
	c0	mov $r0.4 = ph2
;;
	c0	stw 76[$r0.1] = $r0.4
	c0	mov $r0.59 = ph1
	c0	sh2add $r0.2 = $r0.3, $r0.2
;;
	c0	ldw $r0.3 = 0[$r0.62]
	c0	mov $r0.4 = yh
;;
	c0	stw 84[$r0.1] = $r0.4
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
;;
	c0	mpylu $r0.4 = $r0.3, $r0.2
	c0	mpyhs $r0.2 = $r0.3, $r0.2
	c0	mov $r0.3 = 6
;;
	c0	stw 96[$r0.1] = $r0.3
;;
	c0	add $r0.2 = $r0.4, $r0.2
	c0	ldw $r0.3 = 88[$r0.1]
;;
;;
	c0	shr $r0.2 = $r0.2, $r0.3
;;
	c0	stw 0[$r0.63] = $r0.2
;;
	c0	ldw $r0.4 = 0[$r0.61]
;;
	c0	ldw $r0.3 = 0[$r0.60]
;;
.call logsch, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = logsch
;;
	c0	stw 0[$r0.61] = $r0.3
	c0	mov $r0.4 = $r0.57
;;
.call scalel, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = scalel
;;
	c0	stw 0[$r0.62] = $r0.3
;;
	c0	ldw $r0.2 = 104[$r0.1]
;;
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
	c0	ldw $r0.3 = 0[$r0.63]
;;
;;
	c0	add $r0.2 = $r0.3, $r0.2
;;
	c0	stw 0[$r0.58] = $r0.2
;;
	c0	ldw $r0.3 = 0[$r0.63]
;;
	c0	ldw $r0.4 = 72[$r0.1]
;;
	c0	ldw $r0.5 = 80[$r0.1]
;;
;;
.call upzero, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = upzero
;;
	c0	ldw $r0.62 = 76[$r0.1]
;;
;;
	c0	ldw $r0.7 = 0[$r0.62]
;;
	c0	ldw $r0.6 = 0[$r0.59]
;;
	c0	ldw $r0.5 = 0[$r0.58]
;;
	c0	ldw $r0.57 = 116[$r0.1]
;;
;;
	c0	ldw $r0.4 = 0[$r0.57]
;;
	c0	ldw $r0.61 = 108[$r0.1]
;;
;;
	c0	ldw $r0.3 = 0[$r0.61]
;;
.call uppol2, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = uppol2
;;
	c0	mov $r0.2 = $r0.3
;;
	c0	stw 0[$r0.57] = $r0.2
;;
	c0	ldw $r0.6 = 0[$r0.59]
;;
	c0	ldw $r0.5 = 0[$r0.58]
;;
	c0	ldw $r0.3 = 0[$r0.61]
	c0	mov $r0.4 = $r0.2
;;
.call uppol1, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = uppol1
;;
	c0	stw 0[$r0.61] = $r0.3
;;
	c0	ldw $r0.2 = 0[$r0.63]
;;
	c0	ldw $r0.3 = 100[$r0.1]
;;
;;
	c0	ldw $r0.3 = 0[$r0.3]
;;
;;
	c0	add $r0.2 = $r0.3, $r0.2
	c0	ldw $r0.5 = 84[$r0.1]
;;
;;
	c0	stw 0[$r0.5] = $r0.2
;;
	c0	ldw $r0.4 = 112[$r0.1]
;;
;;
	c0	ldw $r0.2 = 0[$r0.4]
;;
	c0	ldw $r0.3 = 120[$r0.1]
;;
;;
	c0	stw 0[$r0.3] = $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.5]
;;
;;
	c0	stw 0[$r0.4] = $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.59]
;;
;;
	c0	stw 0[$r0.62] = $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.58]
;;
;;
	c0	stw 0[$r0.59] = $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.60]
;;
	c0	ldw $r0.3 = 92[$r0.1]
;;
;;
	c0	ldw $r0.3 = 0[$r0.3]
;;
	c0	ldw $r0.4 = 96[$r0.1]
;;
;;
	c0	shl $r0.2 = $r0.2, $r0.4
;;
	c0	or $r0.3 = $r0.3, $r0.2
	c0	ldw $l0.0 = 160[$r0.1]
;;
	c0	ldw $r0.63 = 164[$r0.1]
;;
	c0	ldw $r0.62 = 168[$r0.1]
;;
	c0	ldw $r0.61 = 172[$r0.1]
;;
	c0	ldw $r0.60 = 176[$r0.1]
;;
	c0	ldw $r0.59 = 180[$r0.1]
;;
	c0	ldw $r0.58 = 184[$r0.1]
;;
.return ret($r0.3:s32)
	c0	ldw $r0.57 = 188[$r0.1]
	c0	return $r0.1 = $r0.1, 192, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @filtez
filtez::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $r0.3
;;
	c0	stw 24[$r0.1] = $r0.4
;;
	c0	ldw $r0.2 = 28[$r0.1]
	c0	mov $r0.3 = 1
;;
;;
	c0	add $r0.4 = $r0.2, 4
;;
	c0	stw 28[$r0.1] = $r0.4
;;
	c0	ldw $r0.4 = 24[$r0.1]
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
	c0	add $r0.5 = $r0.4, 4
;;
	c0	stw 24[$r0.1] = $r0.5
;;
	c0	ldw $r0.4 = 0[$r0.4]
;;
;;
	c0	mpyhs $r0.5 = $r0.2, $r0.4
	c0	mpylu $r0.2 = $r0.2, $r0.4
;;
;;
	c0	add $r0.2 = $r0.2, $r0.5
;;
	c0	stw 16[$r0.1] = $r0.2
;;
	c0	stw 20[$r0.1] = $r0.3
;;
LBB5_1:                                 ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.2 = 20[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.2, 5
;;
;;
	c0	br $b0.0, LBB5_4
;;
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB5_1 Depth=1
	c0	ldw $r0.2 = 28[$r0.1]
;;
;;
	c0	add $r0.3 = $r0.2, 4
;;
	c0	stw 28[$r0.1] = $r0.3
;;
	c0	ldw $r0.3 = 24[$r0.1]
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
	c0	add $r0.4 = $r0.3, 4
;;
	c0	stw 24[$r0.1] = $r0.4
;;
	c0	ldw $r0.3 = 0[$r0.3]
;;
	c0	ldw $r0.4 = 16[$r0.1]
;;
	c0	mpyhs $r0.5 = $r0.2, $r0.3
	c0	mpylu $r0.2 = $r0.2, $r0.3
;;
;;
	c0	add $r0.2 = $r0.2, $r0.5
;;
	c0	add $r0.2 = $r0.4, $r0.2
;;
	c0	stw 16[$r0.1] = $r0.2
;;
## BB#3:                                ## %for.inc
                                        ##   in Loop: Header=BB5_1 Depth=1
	c0	ldw $r0.2 = 20[$r0.1]
;;
;;
	c0	add $r0.2 = $r0.2, 1
;;
	c0	stw 20[$r0.1] = $r0.2
	c0	goto LBB5_1
;;
LBB5_4:                                 ## %for.end
	c0	ldw $r0.2 = 16[$r0.1]
	c0	mov $r0.3 = 14
;;
;;
.return ret($r0.3:s32)
	c0	shr $r0.3 = $r0.2, $r0.3
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @filtep
filtep::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 60[$r0.1] = $r0.3
;;
	c0	stw 56[$r0.1] = $r0.4
;;
	c0	stw 52[$r0.1] = $r0.5
;;
	c0	stw 48[$r0.1] = $r0.6
	c0	mov $r0.2 = 1
;;
	c0	ldw $r0.3 = 60[$r0.1]
	c0	mov $r0.4 = 15
;;
;;
	c0	shl $r0.3 = $r0.3, $r0.2
;;
	c0	stw 44[$r0.1] = $r0.3
;;
	c0	ldw $r0.5 = 56[$r0.1]
;;
;;
	c0	mpyhs $r0.6 = $r0.5, $r0.3
	c0	mpylu $r0.3 = $r0.5, $r0.3
;;
;;
	c0	add $r0.3 = $r0.3, $r0.6
;;
	c0	stw 44[$r0.1] = $r0.3
;;
	c0	ldw $r0.3 = 52[$r0.1]
;;
;;
	c0	shl $r0.2 = $r0.3, $r0.2
;;
	c0	stw 40[$r0.1] = $r0.2
;;
	c0	ldw $r0.3 = 48[$r0.1]
;;
	c0	ldw $r0.5 = 44[$r0.1]
;;
	c0	mpyhs $r0.6 = $r0.3, $r0.2
	c0	mpylu $r0.2 = $r0.3, $r0.2
;;
;;
	c0	add $r0.2 = $r0.2, $r0.6
;;
	c0	add $r0.2 = $r0.5, $r0.2
;;
.return ret($r0.3:s32)
	c0	shr $r0.3 = $r0.2, $r0.4
	c0	stw 44[$r0.1] = $r0.2
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @quantl
quantl::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 60[$r0.1] = $l0.0
;;
	c0	stw 56[$r0.1] = $r0.3
;;
	c0	stw 52[$r0.1] = $r0.4
;;
	c0	ldw $r0.3 = 56[$r0.1]
;;
.call abs, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = abs
;;
	c0	mov $r0.2 = 0
	c0	stw 40[$r0.1] = $r0.3
;;
	c0	stw 44[$r0.1] = $r0.2
	c0	mov $r0.2 = decis_levl
	c0	mov $r0.3 = 15
;;
LBB7_1:                                 ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.4 = 44[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.4, 29
;;
;;
	c0	br $b0.0, LBB7_4
;;
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB7_1 Depth=1
	c0	ldw $r0.4 = 44[$r0.1]
;;
;;
	c0	sh2add $r0.4 = $r0.4, $r0.2
	c0	ldw $r0.5 = 52[$r0.1]
;;
	c0	ldw $r0.4 = 0[$r0.4]
;;
;;
	c0	mpylu $r0.6 = $r0.4, $r0.5
	c0	mpyhs $r0.4 = $r0.4, $r0.5
;;
;;
	c0	add $r0.4 = $r0.6, $r0.4
;;
	c0	shr $r0.4 = $r0.4, $r0.3
;;
	c0	stw 36[$r0.1] = $r0.4
;;
	c0	ldw $r0.5 = 40[$r0.1]
;;
;;
	c0	cmple $b0.0 = $r0.5, $r0.4
;;
;;
	c0	br $b0.0, LBB7_4
;;
## BB#3:                                ## %for.inc
                                        ##   in Loop: Header=BB7_1 Depth=1
	c0	ldw $r0.4 = 44[$r0.1]
;;
;;
	c0	add $r0.4 = $r0.4, 1
;;
	c0	stw 44[$r0.1] = $r0.4
	c0	goto LBB7_1
;;
LBB7_4:                                 ## %for.end
	c0	ldw $r0.2 = 56[$r0.1]
;;
;;
	c0	cmplt $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB7_6
;;
## BB#5:                                ## %if.then3
	c0	ldw $r0.2 = 44[$r0.1]
	c0	mov $r0.3 = quant26bt_pos
;;
;;
	c0	sh2add $r0.2 = $r0.2, $r0.3
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
;;
	c0	stw 48[$r0.1] = $r0.2
	c0	goto LBB7_7
;;
LBB7_6:                                 ## %if.else
	c0	ldw $r0.2 = 44[$r0.1]
	c0	mov $r0.3 = quant26bt_neg
;;
;;
	c0	sh2add $r0.2 = $r0.2, $r0.3
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
;;
	c0	stw 48[$r0.1] = $r0.2
;;
LBB7_7:                                 ## %if.end6
	c0	ldw $r0.3 = 48[$r0.1]
;;
	c0	ldw $l0.0 = 60[$r0.1]
;;
;;
;;
;;
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @logscl
logscl::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
	c0	mpyhs $r0.2 = $r0.4, 127
	c0	mpylu $r0.5 = $r0.4, 127
;;
	c0	stw 28[$r0.1] = $r0.3
;;
	c0	add $r0.2 = $r0.5, $r0.2
	c0	mov $r0.3 = 7
	c0	mov $r0.5 = wl_code_table
;;
	c0	shr $r0.2 = $r0.2, $r0.3
	c0	stw 24[$r0.1] = $r0.4
;;
	c0	stw 20[$r0.1] = $r0.2
;;
	c0	ldw $r0.3 = 28[$r0.1]
;;
;;
	c0	and $r0.3 = $r0.3, -4
;;
	c0	add $r0.3 = $r0.5, $r0.3
;;
	c0	ldw $r0.3 = 0[$r0.3]
;;
;;
	c0	add $r0.2 = $r0.2, $r0.3
;;
	c0	stw 24[$r0.1] = $r0.2
	c0	cmpgt $b0.0 = $r0.2, -1
;;
;;
	c0	br $b0.0, LBB8_2
;;
## BB#1:                                ## %if.then
	c0	mov $r0.2 = 0
;;
	c0	stw 24[$r0.1] = $r0.2
;;
LBB8_2:                                 ## %if.end
	c0	ldw $r0.2 = 24[$r0.1]
;;
;;
	c0	cmplt $b0.0 = $r0.2, 18433
;;
;;
	c0	br $b0.0, LBB8_4
;;
## BB#3:                                ## %if.then3
	c0	mov $r0.2 = 18432
;;
	c0	stw 24[$r0.1] = $r0.2
;;
LBB8_4:                                 ## %if.end4
.return ret($r0.3:s32)
	c0	ldw $r0.3 = 24[$r0.1]
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @scalel
scalel::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 60[$r0.1] = $r0.3
;;
	c0	stw 56[$r0.1] = $r0.4
	c0	mov $r0.2 = 6
	c0	mov $r0.3 = 11
	c0	mov $r0.4 = ilb_table
;;
	c0	ldw $r0.5 = 60[$r0.1]
	c0	mov $r0.6 = 3
;;
;;
	c0	shru $r0.2 = $r0.5, $r0.2
;;
	c0	and $r0.2 = $r0.2, 31
;;
	c0	stw 52[$r0.1] = $r0.2
;;
	c0	ldw $r0.2 = 60[$r0.1]
;;
;;
	c0	shr $r0.2 = $r0.2, $r0.3
;;
	c0	stw 48[$r0.1] = $r0.2
;;
	c0	ldw $r0.3 = 52[$r0.1]
;;
	c0	ldw $r0.5 = 56[$r0.1]
;;
	c0	sh2add $r0.3 = $r0.3, $r0.4
;;
	c0	add $r0.4 = $r0.5, 1
	c0	ldw $r0.3 = 0[$r0.3]
;;
	c0	sub $r0.2 = $r0.4, $r0.2
;;
	c0	shr $r0.2 = $r0.3, $r0.2
;;
.return ret($r0.3:s32)
	c0	shl $r0.3 = $r0.2, $r0.6
	c0	stw 44[$r0.1] = $r0.2
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @upzero
upzero::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 60[$r0.1] = $r0.3
;;
	c0	stw 56[$r0.1] = $r0.4
;;
	c0	stw 52[$r0.1] = $r0.5
;;
	c0	ldw $r0.2 = 60[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.2, 0
;;
;;
	c0	brf $b0.0, LBB10_1
;;
## BB#4:                                ## %if.else
	c0	mov $r0.2 = 0
;;
	c0	stw 48[$r0.1] = $r0.2
	c0	mov $r0.2 = 128
	c0	mov $r0.3 = 8
	c0	mov $r0.4 = -128
;;
LBB10_5:                                ## %for.cond3
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.5 = 48[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.5, 5
;;
;;
	c0	br $b0.0, LBB10_10
;;
## BB#6:                                ## %for.body5
                                        ##   in Loop: Header=BB10_5 Depth=1
	c0	ldw $r0.5 = 56[$r0.1]
;;
	c0	ldw $r0.6 = 48[$r0.1]
;;
	c0	ldw $r0.7 = 60[$r0.1]
;;
	c0	sh2add $r0.5 = $r0.6, $r0.5
;;
	c0	ldw $r0.5 = 0[$r0.5]
;;
;;
	c0	mpyhs $r0.6 = $r0.7, $r0.5
	c0	mpylu $r0.5 = $r0.7, $r0.5
;;
;;
	c0	add $r0.5 = $r0.5, $r0.6
;;
	c0	cmplt $b0.0 = $r0.5, 0
;;
;;
	c0	br $b0.0, LBB10_8
;;
## BB#7:                                ## %if.then9
                                        ##   in Loop: Header=BB10_5 Depth=1
	c0	stw 44[$r0.1] = $r0.2
	c0	goto LBB10_9
;;
LBB10_8:                                ## %if.else10
                                        ##   in Loop: Header=BB10_5 Depth=1
	c0	stw 44[$r0.1] = $r0.4
;;
LBB10_9:                                ## %for.inc15
                                        ##   in Loop: Header=BB10_5 Depth=1
	c0	ldw $r0.5 = 52[$r0.1]
;;
	c0	ldw $r0.6 = 48[$r0.1]
;;
;;
	c0	sh2add $r0.5 = $r0.6, $r0.5
;;
	c0	ldw $r0.5 = 0[$r0.5]
;;
;;
	c0	mpylu $r0.6 = $r0.5, 255
	c0	mpyhs $r0.5 = $r0.5, 255
;;
;;
	c0	add $r0.5 = $r0.6, $r0.5
;;
	c0	shr $r0.5 = $r0.5, $r0.3
;;
	c0	stw 40[$r0.1] = $r0.5
;;
	c0	ldw $r0.6 = 44[$r0.1]
;;
	c0	ldw $r0.7 = 52[$r0.1]
;;
	c0	add $r0.5 = $r0.6, $r0.5
	c0	ldw $r0.6 = 48[$r0.1]
;;
;;
	c0	sh2add $r0.6 = $r0.6, $r0.7
;;
	c0	stw 0[$r0.6] = $r0.5
;;
	c0	ldw $r0.5 = 48[$r0.1]
;;
;;
	c0	add $r0.5 = $r0.5, 1
;;
	c0	stw 48[$r0.1] = $r0.5
	c0	goto LBB10_5
;;
LBB10_1:                                ## %if.then
	c0	mov $r0.2 = 0
;;
	c0	stw 48[$r0.1] = $r0.2
	c0	mov $r0.2 = 8
;;
LBB10_2:                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.3 = 48[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.3, 5
;;
;;
	c0	br $b0.0, LBB10_10
;;
## BB#3:                                ## %for.inc
                                        ##   in Loop: Header=BB10_2 Depth=1
	c0	ldw $r0.3 = 52[$r0.1]
;;
	c0	ldw $r0.4 = 48[$r0.1]
;;
;;
	c0	sh2add $r0.3 = $r0.4, $r0.3
;;
	c0	ldw $r0.4 = 0[$r0.3]
;;
;;
	c0	mpylu $r0.5 = $r0.4, 255
	c0	mpyhs $r0.4 = $r0.4, 255
;;
;;
	c0	add $r0.4 = $r0.5, $r0.4
;;
	c0	shr $r0.4 = $r0.4, $r0.2
;;
	c0	stw 0[$r0.3] = $r0.4
;;
	c0	ldw $r0.3 = 48[$r0.1]
;;
;;
	c0	add $r0.3 = $r0.3, 1
;;
	c0	stw 48[$r0.1] = $r0.3
	c0	goto LBB10_2
;;
LBB10_10:                               ## %if.end18
	c0	ldw $r0.2 = 56[$r0.1]
;;
;;
	c0	ldw $r0.3 = 16[$r0.2]
;;
;;
	c0	stw 20[$r0.2] = $r0.3
;;
	c0	ldw $r0.2 = 56[$r0.1]
;;
;;
	c0	ldw $r0.3 = 12[$r0.2]
;;
;;
	c0	stw 16[$r0.2] = $r0.3
;;
	c0	ldw $r0.2 = 56[$r0.1]
;;
;;
	c0	ldw $r0.3 = 8[$r0.2]
;;
;;
	c0	stw 12[$r0.2] = $r0.3
;;
	c0	ldw $r0.2 = 56[$r0.1]
;;
;;
	c0	ldw $r0.3 = 0[$r0.2]
;;
;;
	c0	stw 4[$r0.2] = $r0.3
;;
	c0	ldw $r0.2 = 56[$r0.1]
;;
	c0	ldw $r0.3 = 60[$r0.1]
;;
;;
.return ret($r0.3:s32)
	c0	stw 0[$r0.2] = $r0.3
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @uppol2
uppol2::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 60[$r0.1] = $r0.3
;;
	c0	stw 56[$r0.1] = $r0.4
;;
	c0	stw 52[$r0.1] = $r0.5
;;
	c0	stw 48[$r0.1] = $r0.6
;;
	c0	stw 44[$r0.1] = $r0.7
	c0	mov $r0.2 = 2
;;
	c0	ldw $r0.3 = 60[$r0.1]
;;
;;
	c0	shl $r0.2 = $r0.3, $r0.2
;;
	c0	stw 40[$r0.1] = $r0.2
;;
	c0	ldw $r0.2 = 48[$r0.1]
;;
	c0	ldw $r0.3 = 52[$r0.1]
;;
;;
	c0	mpyhs $r0.4 = $r0.3, $r0.2
	c0	mpylu $r0.2 = $r0.3, $r0.2
;;
;;
	c0	add $r0.2 = $r0.2, $r0.4
;;
	c0	cmplt $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB11_2
;;
## BB#1:                                ## %if.then
	c0	ldw $r0.2 = 40[$r0.1]
	c0	mov $r0.3 = 0
;;
;;
	c0	sub $r0.2 = $r0.3, $r0.2
;;
	c0	stw 40[$r0.1] = $r0.2
;;
LBB11_2:                                ## %if.end
	c0	ldw $r0.3 = 40[$r0.1]
	c0	mov $r0.2 = 7
;;
;;
	c0	shr $r0.3 = $r0.3, $r0.2
;;
	c0	stw 40[$r0.1] = $r0.3
;;
	c0	ldw $r0.3 = 44[$r0.1]
;;
	c0	ldw $r0.4 = 52[$r0.1]
;;
;;
	c0	mpyhs $r0.5 = $r0.4, $r0.3
	c0	mpylu $r0.3 = $r0.4, $r0.3
;;
;;
	c0	add $r0.3 = $r0.3, $r0.5
;;
	c0	cmplt $b0.0 = $r0.3, 0
;;
;;
	c0	br $b0.0, LBB11_4
;;
## BB#3:                                ## %if.then4
	c0	ldw $r0.3 = 40[$r0.1]
;;
;;
	c0	add $r0.3 = $r0.3, 128
;;
	c0	stw 36[$r0.1] = $r0.3
	c0	goto LBB11_5
;;
LBB11_4:                                ## %if.else
	c0	ldw $r0.3 = 40[$r0.1]
;;
;;
	c0	add $r0.3 = $r0.3, -128
;;
	c0	stw 36[$r0.1] = $r0.3
;;
LBB11_5:                                ## %if.end6
	c0	ldw $r0.3 = 56[$r0.1]
;;
;;
	c0	mpyhs $r0.4 = $r0.3, 127
	c0	mpylu $r0.3 = $r0.3, 127
	c0	ldw $r0.5 = 36[$r0.1]
;;
;;
	c0	add $r0.3 = $r0.3, $r0.4
;;
	c0	shr $r0.2 = $r0.3, $r0.2
;;
	c0	add $r0.2 = $r0.5, $r0.2
;;
	c0	stw 32[$r0.1] = $r0.2
	c0	cmplt $b0.0 = $r0.2, 12289
;;
;;
	c0	br $b0.0, LBB11_7
;;
## BB#6:                                ## %if.then11
	c0	mov $r0.2 = 12288
;;
	c0	stw 32[$r0.1] = $r0.2
;;
LBB11_7:                                ## %if.end12
	c0	ldw $r0.2 = 32[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.2, -12289
;;
;;
	c0	br $b0.0, LBB11_9
;;
## BB#8:                                ## %if.then14
	c0	mov $r0.2 = -12288
;;
	c0	stw 32[$r0.1] = $r0.2
;;
LBB11_9:                                ## %if.end15
.return ret($r0.3:s32)
	c0	ldw $r0.3 = 32[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @uppol1
uppol1::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 60[$r0.1] = $r0.3
;;
	c0	stw 56[$r0.1] = $r0.4
;;
	c0	stw 52[$r0.1] = $r0.5
;;
	c0	stw 48[$r0.1] = $r0.6
	c0	mov $r0.2 = 8
;;
	c0	ldw $r0.3 = 60[$r0.1]
;;
;;
	c0	mpyhs $r0.4 = $r0.3, 255
	c0	mpylu $r0.3 = $r0.3, 255
;;
;;
	c0	add $r0.3 = $r0.3, $r0.4
;;
	c0	shr $r0.2 = $r0.3, $r0.2
;;
	c0	stw 44[$r0.1] = $r0.2
;;
	c0	ldw $r0.2 = 48[$r0.1]
;;
	c0	ldw $r0.3 = 52[$r0.1]
;;
;;
	c0	mpyhs $r0.4 = $r0.3, $r0.2
	c0	mpylu $r0.2 = $r0.3, $r0.2
;;
;;
	c0	add $r0.2 = $r0.2, $r0.4
;;
	c0	cmplt $b0.0 = $r0.2, 0
;;
;;
	c0	br $b0.0, LBB12_2
;;
## BB#1:                                ## %if.then
	c0	ldw $r0.2 = 44[$r0.1]
;;
;;
	c0	add $r0.2 = $r0.2, 192
;;
	c0	stw 36[$r0.1] = $r0.2
	c0	goto LBB12_3
;;
LBB12_2:                                ## %if.else
	c0	ldw $r0.2 = 44[$r0.1]
;;
;;
	c0	add $r0.2 = $r0.2, -192
;;
	c0	stw 36[$r0.1] = $r0.2
;;
LBB12_3:                                ## %if.end
	c0	ldw $r0.2 = 56[$r0.1]
	c0	mov $r0.3 = 15360
;;
;;
	c0	sub $r0.2 = $r0.3, $r0.2
;;
	c0	stw 40[$r0.1] = $r0.2
;;
	c0	ldw $r0.3 = 36[$r0.1]
;;
;;
	c0	cmple $b0.0 = $r0.3, $r0.2
;;
;;
	c0	br $b0.0, LBB12_5
;;
## BB#4:                                ## %if.then4
	c0	ldw $r0.2 = 40[$r0.1]
;;
;;
	c0	stw 36[$r0.1] = $r0.2
;;
LBB12_5:                                ## %if.end5
	c0	ldw $r0.3 = 40[$r0.1]
	c0	mov $r0.2 = 0
;;
;;
	c0	sub $r0.3 = $r0.2, $r0.3
	c0	ldw $r0.4 = 36[$r0.1]
;;
;;
	c0	cmpge $b0.0 = $r0.4, $r0.3
;;
;;
	c0	br $b0.0, LBB12_7
;;
## BB#6:                                ## %if.then8
	c0	ldw $r0.3 = 40[$r0.1]
;;
;;
	c0	sub $r0.2 = $r0.2, $r0.3
;;
	c0	stw 36[$r0.1] = $r0.2
;;
LBB12_7:                                ## %if.end10
.return ret($r0.3:s32)
	c0	ldw $r0.3 = 36[$r0.1]
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @logsch
logsch::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
	c0	mpyhs $r0.2 = $r0.4, 127
	c0	mpylu $r0.5 = $r0.4, 127
;;
	c0	stw 28[$r0.1] = $r0.3
;;
	c0	add $r0.2 = $r0.5, $r0.2
	c0	mov $r0.3 = 7
	c0	mov $r0.5 = wh_code_table
;;
	c0	shr $r0.2 = $r0.2, $r0.3
	c0	stw 24[$r0.1] = $r0.4
;;
	c0	stw 20[$r0.1] = $r0.2
;;
	c0	ldw $r0.3 = 28[$r0.1]
;;
;;
	c0	sh2add $r0.3 = $r0.3, $r0.5
;;
	c0	ldw $r0.3 = 0[$r0.3]
;;
;;
	c0	add $r0.2 = $r0.2, $r0.3
;;
	c0	stw 24[$r0.1] = $r0.2
	c0	cmpgt $b0.0 = $r0.2, -1
;;
;;
	c0	br $b0.0, LBB13_2
;;
## BB#1:                                ## %if.then
	c0	mov $r0.2 = 0
;;
	c0	stw 24[$r0.1] = $r0.2
;;
LBB13_2:                                ## %if.end
	c0	ldw $r0.2 = 24[$r0.1]
;;
;;
	c0	cmplt $b0.0 = $r0.2, 22529
;;
;;
	c0	br $b0.0, LBB13_4
;;
## BB#3:                                ## %if.then2
	c0	mov $r0.2 = 22528
;;
	c0	stw 24[$r0.1] = $r0.2
;;
LBB13_4:                                ## %if.end3
.return ret($r0.3:s32)
	c0	ldw $r0.3 = 24[$r0.1]
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-256, arg() ## @decode
decode::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -256
;;
	c0	stw 252[$r0.1] = $r0.57
;;
	c0	stw 248[$r0.1] = $r0.58
;;
	c0	stw 244[$r0.1] = $r0.59
;;
	c0	stw 240[$r0.1] = $r0.60
;;
	c0	stw 236[$r0.1] = $r0.61
;;
	c0	stw 232[$r0.1] = $r0.62
;;
	c0	stw 228[$r0.1] = $r0.63
;;
	c0	stw 224[$r0.1] = $l0.0
;;
	c0	stw 220[$r0.1] = $r0.3
;;
	c0	stw 216[$r0.1] = $r0.4
	c0	mov $r0.58 = ilr
	c0	mov $r0.2 = 6
	c0	mov $r0.5 = ih
;;
	c0	stw 80[$r0.1] = $r0.5
	c0	mov $r0.6 = dec_del_bpl
;;
	c0	stw 40[$r0.1] = $r0.6
	c0	mov $r0.7 = dec_del_dltx
;;
	c0	stw 36[$r0.1] = $r0.7
	c0	mov $r0.61 = dec_szl
	c0	mov $r0.57 = dec_rlt2
;;
	c0	stw 56[$r0.1] = $r0.57
;;
	c0	ldw $r0.3 = 220[$r0.1]
	c0	mov $r0.4 = dec_rlt1
;;
	c0	stw 152[$r0.1] = $r0.4
	c0	mov $r0.63 = dec_al2
	c0	mov $r0.4 = dec_al1
;;
	c0	stw 32[$r0.1] = $r0.4
	c0	mov $r0.4 = dec_spl
;;
	c0	stw 132[$r0.1] = $r0.4
	c0	mov $r0.4 = dec_sl
;;
	c0	stw 176[$r0.1] = $r0.4
	c0	mov $r0.4 = qq4_code4_table
;;
	c0	stw 148[$r0.1] = $r0.4
	c0	mov $r0.62 = dec_detl
	c0	and $r0.3 = $r0.3, 63
	c0	mov $r0.4 = 15
;;
	c0	stw 180[$r0.1] = $r0.4
;;
	c0	stw 180[$r0.1] = $r0.4
	c0	mov $r0.4 = il
;;
	c0	stw 140[$r0.1] = $r0.4
	c0	mov $r0.59 = dec_dlt
	c0	mov $r0.4 = qq6_code6_table
;;
	c0	stw 136[$r0.1] = $r0.4
	c0	mov $r0.4 = dl
;;
	c0	stw 88[$r0.1] = $r0.4
	c0	mov $r0.4 = rl
;;
	c0	stw 172[$r0.1] = $r0.4
	c0	mov $r0.4 = dec_nbl
;;
	c0	stw 44[$r0.1] = $r0.4
;;
	c0	stw 0[$r0.58] = $r0.3
	c0	mov $r0.3 = 8
;;
	c0	stw 48[$r0.1] = $r0.3
	c0	mov $r0.3 = dec_plt
;;
	c0	stw 52[$r0.1] = $r0.3
	c0	mov $r0.3 = dec_plt2
;;
	c0	stw 60[$r0.1] = $r0.3
	c0	mov $r0.60 = dec_plt1
	c0	mov $r0.3 = dec_rlt
;;
	c0	stw 64[$r0.1] = $r0.3
	c0	mov $r0.3 = dec_del_bph
;;
	c0	stw 156[$r0.1] = $r0.3
	c0	mov $r0.3 = dec_del_dhx
;;
	c0	stw 72[$r0.1] = $r0.3
;;
	c0	ldw $r0.3 = 220[$r0.1]
	c0	mov $r0.4 = dec_szh
;;
	c0	stw 84[$r0.1] = $r0.4
	c0	mov $r0.4 = dec_rh2
;;
	c0	stw 168[$r0.1] = $r0.4
	c0	mov $r0.4 = dec_rh1
;;
	c0	stw 164[$r0.1] = $r0.4
	c0	mov $r0.4 = dec_ah2
;;
	c0	stw 68[$r0.1] = $r0.4
	c0	mov $r0.4 = dec_ah1
;;
	c0	stw 76[$r0.1] = $r0.4
	c0	mov $r0.4 = dec_sph
;;
	c0	stw 92[$r0.1] = $r0.4
	c0	mov $r0.4 = dec_sh
;;
	c0	stw 160[$r0.1] = $r0.4
	c0	shr $r0.2 = $r0.3, $r0.2
	c0	mov $r0.3 = qq2_code2_table
;;
	c0	stw 100[$r0.1] = $r0.3
	c0	mov $r0.3 = dec_deth
;;
	c0	stw 96[$r0.1] = $r0.3
	c0	mov $r0.3 = dec_nbh
;;
	c0	stw 108[$r0.1] = $r0.3
	c0	mov $r0.3 = dec_dh
;;
	c0	stw 104[$r0.1] = $r0.3
	c0	mov $r0.3 = 10
;;
	c0	stw 112[$r0.1] = $r0.3
	c0	mov $r0.3 = dec_ph
;;
	c0	stw 124[$r0.1] = $r0.3
	c0	mov $r0.3 = dec_ph2
;;
	c0	stw 128[$r0.1] = $r0.3
;;
	c0	stw 0[$r0.5] = $r0.2
	c0	mov $r0.3 = $r0.6
	c0	mov $r0.4 = $r0.7
;;
.call filtez, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = filtez
;;
	c0	mov $r0.2 = dec_ph1
;;
	c0	stw 120[$r0.1] = $r0.2
;;
	c0	stw 0[$r0.61] = $r0.3
;;
	c0	ldw $r0.6 = 0[$r0.63]
;;
	c0	ldw $r0.5 = 0[$r0.57]
;;
	c0	ldw $r0.57 = 32[$r0.1]
;;
;;
	c0	ldw $r0.4 = 0[$r0.57]
;;
	c0	ldw $r0.2 = 152[$r0.1]
;;
;;
	c0	ldw $r0.3 = 0[$r0.2]
;;
.call filtep, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = filtep
;;
	c0	mov $r0.2 = rh
;;
	c0	stw 144[$r0.1] = $r0.2
;;
	c0	ldw $r0.2 = 132[$r0.1]
;;
;;
	c0	stw 0[$r0.2] = $r0.3
;;
	c0	ldw $r0.2 = 0[$r0.61]
	c0	mov $r0.4 = xd
;;
	c0	stw 132[$r0.1] = $r0.4
;;
	c0	add $r0.2 = $r0.3, $r0.2
	c0	ldw $r0.6 = 176[$r0.1]
;;
;;
	c0	stw 176[$r0.1] = $r0.6
;;
	c0	stw 0[$r0.6] = $r0.2
	c0	mov $r0.7 = $r0.58
;;
	c0	ldw $r0.2 = 0[$r0.7]
;;
	c0	ldw $r0.3 = 0[$r0.62]
;;
	c0	and $r0.2 = $r0.2, -4
	c0	ldw $r0.4 = 148[$r0.1]
;;
;;
	c0	add $r0.2 = $r0.4, $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.2]
	c0	mov $r0.4 = xs
;;
	c0	stw 116[$r0.1] = $r0.4
;;
	c0	mpylu $r0.4 = $r0.3, $r0.2
	c0	mpyhs $r0.2 = $r0.3, $r0.2
	c0	mov $r0.3 = h
;;
	c0	stw 148[$r0.1] = $r0.3
;;
	c0	add $r0.2 = $r0.4, $r0.2
	c0	ldw $r0.5 = 180[$r0.1]
;;
;;
	c0	shr $r0.2 = $r0.2, $r0.5
;;
	c0	stw 0[$r0.59] = $r0.2
;;
	c0	ldw $r0.2 = 140[$r0.1]
;;
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
	c0	ldw $r0.3 = 0[$r0.62]
;;
	c0	ldw $r0.4 = 136[$r0.1]
;;
;;
	c0	sh2add $r0.2 = $r0.2, $r0.4
;;
	c0	ldw $r0.2 = 0[$r0.2]
	c0	mov $r0.4 = accumc
;;
	c0	stw 140[$r0.1] = $r0.4
;;
	c0	mpylu $r0.4 = $r0.3, $r0.2
	c0	mpyhs $r0.2 = $r0.3, $r0.2
	c0	mov $r0.3 = accumd
;;
	c0	stw 136[$r0.1] = $r0.3
;;
	c0	add $r0.2 = $r0.4, $r0.2
;;
	c0	shr $r0.2 = $r0.2, $r0.5
	c0	ldw $r0.3 = 88[$r0.1]
;;
;;
	c0	stw 0[$r0.3] = $r0.2
;;
	c0	ldw $r0.3 = 0[$r0.6]
	c0	mov $r0.4 = 0
;;
	c0	stw 88[$r0.1] = $r0.4
;;
	c0	add $r0.2 = $r0.2, $r0.3
	c0	ldw $r0.3 = 172[$r0.1]
;;
;;
	c0	stw 0[$r0.3] = $r0.2
;;
	c0	ldw $r0.58 = 44[$r0.1]
;;
;;
	c0	ldw $r0.4 = 0[$r0.58]
;;
	c0	ldw $r0.3 = 0[$r0.7]
;;
.call logscl, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = logscl
;;
	c0	stw 0[$r0.58] = $r0.3
;;
	c0	ldw $r0.4 = 48[$r0.1]
;;
;;
.call scalel, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = scalel
;;
	c0	stw 0[$r0.62] = $r0.3
;;
	c0	ldw $r0.2 = 0[$r0.61]
;;
	c0	ldw $r0.3 = 0[$r0.59]
;;
;;
	c0	add $r0.2 = $r0.3, $r0.2
	c0	ldw $r0.58 = 52[$r0.1]
;;
;;
	c0	stw 0[$r0.58] = $r0.2
;;
	c0	ldw $r0.3 = 0[$r0.59]
;;
	c0	ldw $r0.4 = 36[$r0.1]
;;
	c0	ldw $r0.5 = 40[$r0.1]
;;
;;
.call upzero, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = upzero
;;
	c0	ldw $r0.61 = 60[$r0.1]
;;
;;
	c0	ldw $r0.7 = 0[$r0.61]
;;
	c0	ldw $r0.6 = 0[$r0.60]
;;
	c0	ldw $r0.5 = 0[$r0.58]
	c0	mov $r0.62 = $r0.63
;;
	c0	ldw $r0.4 = 0[$r0.62]
;;
	c0	ldw $r0.3 = 0[$r0.57]
;;
.call uppol2, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = uppol2
;;
	c0	mov $r0.2 = $r0.3
;;
	c0	stw 0[$r0.62] = $r0.2
;;
	c0	ldw $r0.6 = 0[$r0.60]
;;
	c0	ldw $r0.5 = 0[$r0.58]
;;
	c0	ldw $r0.3 = 0[$r0.57]
	c0	mov $r0.4 = $r0.2
;;
.call uppol1, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = uppol1
;;
	c0	stw 0[$r0.57] = $r0.3
;;
	c0	ldw $r0.2 = 0[$r0.59]
;;
	c0	ldw $r0.3 = 176[$r0.1]
;;
;;
	c0	ldw $r0.3 = 0[$r0.3]
;;
;;
	c0	add $r0.2 = $r0.3, $r0.2
	c0	ldw $r0.4 = 64[$r0.1]
;;
;;
	c0	stw 0[$r0.4] = $r0.2
;;
	c0	ldw $r0.3 = 152[$r0.1]
;;
;;
	c0	ldw $r0.2 = 0[$r0.3]
;;
	c0	ldw $r0.5 = 56[$r0.1]
;;
;;
	c0	stw 0[$r0.5] = $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.4]
;;
;;
	c0	stw 0[$r0.3] = $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.60]
;;
;;
	c0	stw 0[$r0.61] = $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.58]
;;
;;
	c0	stw 0[$r0.60] = $r0.2
;;
	c0	ldw $r0.3 = 156[$r0.1]
;;
	c0	ldw $r0.62 = 72[$r0.1]
;;
;;
	c0	mov $r0.4 = $r0.62
;;
.call filtez, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = filtez
;;
	c0	ldw $r0.57 = 84[$r0.1]
;;
;;
	c0	stw 0[$r0.57] = $r0.3
;;
	c0	ldw $r0.61 = 68[$r0.1]
;;
;;
	c0	ldw $r0.6 = 0[$r0.61]
;;
	c0	ldw $r0.2 = 168[$r0.1]
;;
;;
	c0	ldw $r0.5 = 0[$r0.2]
;;
	c0	ldw $r0.60 = 76[$r0.1]
;;
;;
	c0	ldw $r0.4 = 0[$r0.60]
;;
	c0	ldw $r0.2 = 164[$r0.1]
;;
;;
	c0	ldw $r0.3 = 0[$r0.2]
;;
.call filtep, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = filtep
;;
	c0	ldw $r0.2 = 92[$r0.1]
;;
;;
	c0	stw 0[$r0.2] = $r0.3
;;
	c0	ldw $r0.2 = 0[$r0.57]
;;
;;
	c0	add $r0.2 = $r0.3, $r0.2
	c0	ldw $r0.3 = 160[$r0.1]
;;
;;
	c0	stw 0[$r0.3] = $r0.2
;;
	c0	ldw $r0.5 = 80[$r0.1]
;;
;;
	c0	ldw $r0.2 = 0[$r0.5]
;;
	c0	ldw $r0.59 = 96[$r0.1]
;;
;;
	c0	ldw $r0.3 = 0[$r0.59]
;;
	c0	ldw $r0.4 = 100[$r0.1]
;;
;;
	c0	sh2add $r0.2 = $r0.2, $r0.4
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
;;
	c0	mpylu $r0.4 = $r0.3, $r0.2
	c0	mpyhs $r0.2 = $r0.3, $r0.2
;;
;;
	c0	add $r0.2 = $r0.4, $r0.2
	c0	ldw $r0.3 = 180[$r0.1]
;;
;;
	c0	shr $r0.2 = $r0.2, $r0.3
	c0	ldw $r0.63 = 104[$r0.1]
;;
;;
	c0	stw 0[$r0.63] = $r0.2
;;
	c0	ldw $r0.58 = 108[$r0.1]
;;
;;
	c0	ldw $r0.4 = 0[$r0.58]
;;
	c0	ldw $r0.3 = 0[$r0.5]
;;
.call logsch, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = logsch
;;
	c0	stw 0[$r0.58] = $r0.3
;;
	c0	ldw $r0.4 = 112[$r0.1]
;;
;;
.call scalel, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = scalel
;;
	c0	stw 0[$r0.59] = $r0.3
;;
	c0	ldw $r0.2 = 0[$r0.57]
	c0	mov $r0.57 = $r0.63
;;
	c0	ldw $r0.3 = 0[$r0.57]
;;
;;
	c0	add $r0.2 = $r0.3, $r0.2
	c0	ldw $r0.59 = 124[$r0.1]
;;
;;
	c0	stw 0[$r0.59] = $r0.2
;;
	c0	ldw $r0.3 = 0[$r0.57]
	c0	mov $r0.4 = $r0.62
;;
	c0	ldw $r0.5 = 156[$r0.1]
;;
;;
.call upzero, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = upzero
;;
	c0	ldw $r0.62 = 128[$r0.1]
;;
;;
	c0	ldw $r0.7 = 0[$r0.62]
;;
	c0	ldw $r0.63 = 120[$r0.1]
;;
;;
	c0	ldw $r0.6 = 0[$r0.63]
;;
	c0	ldw $r0.5 = 0[$r0.59]
;;
	c0	ldw $r0.4 = 0[$r0.61]
;;
	c0	ldw $r0.3 = 0[$r0.60]
;;
.call uppol2, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = uppol2
;;
	c0	mov $r0.2 = $r0.3
;;
	c0	stw 0[$r0.61] = $r0.2
;;
	c0	ldw $r0.6 = 0[$r0.63]
;;
	c0	ldw $r0.5 = 0[$r0.59]
;;
	c0	ldw $r0.3 = 0[$r0.60]
	c0	mov $r0.4 = $r0.2
;;
.call uppol1, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = uppol1
;;
	c0	ldw $r0.9 = 88[$r0.1]
;;
	c0	ldw $r0.8 = 116[$r0.1]
;;
	c0	ldw $r0.7 = 132[$r0.1]
;;
	c0	stw 0[$r0.60] = $r0.3
;;
	c0	ldw $r0.2 = 0[$r0.57]
;;
	c0	ldw $r0.3 = 160[$r0.1]
;;
;;
	c0	ldw $r0.3 = 0[$r0.3]
;;
;;
	c0	add $r0.2 = $r0.3, $r0.2
	c0	ldw $r0.5 = 144[$r0.1]
;;
;;
	c0	stw 0[$r0.5] = $r0.2
;;
	c0	ldw $r0.3 = 164[$r0.1]
;;
;;
	c0	ldw $r0.2 = 0[$r0.3]
;;
	c0	ldw $r0.4 = 168[$r0.1]
;;
;;
	c0	stw 0[$r0.4] = $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.5]
;;
;;
	c0	stw 0[$r0.3] = $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.63]
;;
;;
	c0	stw 0[$r0.62] = $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.59]
;;
;;
	c0	stw 0[$r0.63] = $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.5]
;;
	c0	ldw $r0.4 = 172[$r0.1]
;;
;;
	c0	ldw $r0.3 = 0[$r0.4]
;;
;;
	c0	sub $r0.2 = $r0.3, $r0.2
;;
	c0	stw 0[$r0.7] = $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.5]
;;
	c0	ldw $r0.3 = 0[$r0.4]
;;
;;
	c0	add $r0.2 = $r0.3, $r0.2
;;
	c0	stw 0[$r0.8] = $r0.2
;;
	c0	ldw $r0.2 = 148[$r0.1]
;;
;;
	c0	stw 200[$r0.1] = $r0.2
;;
	c0	ldw $r0.2 = 140[$r0.1]
;;
;;
	c0	stw 196[$r0.1] = $r0.2
;;
	c0	ldw $r0.2 = 136[$r0.1]
;;
;;
	c0	stw 188[$r0.1] = $r0.2
;;
	c0	ldw $r0.2 = 200[$r0.1]
;;
	c0	ldw $r0.3 = 0[$r0.7]
;;
	c0	add $r0.4 = $r0.2, 4
;;
	c0	stw 200[$r0.1] = $r0.4
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
;;
	c0	mpyhs $r0.4 = $r0.3, $r0.2
	c0	mpylu $r0.2 = $r0.3, $r0.2
;;
;;
	c0	add $r0.2 = $r0.2, $r0.4
;;
	c0	stw 208[$r0.1] = $r0.2
;;
	c0	ldw $r0.2 = 200[$r0.1]
;;
	c0	ldw $r0.3 = 0[$r0.8]
;;
	c0	add $r0.4 = $r0.2, 4
;;
	c0	stw 200[$r0.1] = $r0.4
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
;;
	c0	mpyhs $r0.4 = $r0.3, $r0.2
	c0	mpylu $r0.2 = $r0.3, $r0.2
;;
;;
	c0	add $r0.2 = $r0.2, $r0.4
;;
	c0	stw 204[$r0.1] = $r0.2
;;
	c0	stw 212[$r0.1] = $r0.9
;;
LBB14_1:                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.2 = 212[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.2, 9
;;
;;
	c0	br $b0.0, LBB14_4
;;
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB14_1 Depth=1
	c0	ldw $r0.2 = 196[$r0.1]
;;
;;
	c0	add $r0.3 = $r0.2, 4
;;
	c0	stw 196[$r0.1] = $r0.3
;;
	c0	ldw $r0.3 = 200[$r0.1]
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
	c0	add $r0.4 = $r0.3, 4
;;
	c0	stw 200[$r0.1] = $r0.4
;;
	c0	ldw $r0.3 = 0[$r0.3]
;;
	c0	ldw $r0.4 = 208[$r0.1]
;;
	c0	mpyhs $r0.5 = $r0.2, $r0.3
	c0	mpylu $r0.2 = $r0.2, $r0.3
;;
;;
	c0	add $r0.2 = $r0.2, $r0.5
;;
	c0	add $r0.2 = $r0.4, $r0.2
;;
	c0	stw 208[$r0.1] = $r0.2
;;
	c0	ldw $r0.2 = 188[$r0.1]
;;
;;
	c0	add $r0.3 = $r0.2, 4
;;
	c0	stw 188[$r0.1] = $r0.3
;;
	c0	ldw $r0.3 = 200[$r0.1]
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
	c0	add $r0.4 = $r0.3, 4
;;
	c0	stw 200[$r0.1] = $r0.4
;;
	c0	ldw $r0.3 = 0[$r0.3]
;;
	c0	ldw $r0.4 = 204[$r0.1]
;;
	c0	mpyhs $r0.5 = $r0.2, $r0.3
	c0	mpylu $r0.2 = $r0.2, $r0.3
;;
;;
	c0	add $r0.2 = $r0.2, $r0.5
;;
	c0	add $r0.2 = $r0.4, $r0.2
;;
	c0	stw 204[$r0.1] = $r0.2
;;
## BB#3:                                ## %for.inc
                                        ##   in Loop: Header=BB14_1 Depth=1
	c0	ldw $r0.2 = 212[$r0.1]
;;
;;
	c0	add $r0.2 = $r0.2, 1
;;
	c0	stw 212[$r0.1] = $r0.2
	c0	goto LBB14_1
;;
LBB14_4:                                ## %for.end
	c0	ldw $r0.2 = 196[$r0.1]
	c0	mov $r0.3 = 14
;;
	c0	ldw $r0.4 = 200[$r0.1]
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
	c0	add $r0.5 = $r0.4, 4
;;
	c0	stw 200[$r0.1] = $r0.5
;;
	c0	ldw $r0.4 = 0[$r0.4]
;;
	c0	ldw $r0.5 = 208[$r0.1]
;;
	c0	mpyhs $r0.6 = $r0.2, $r0.4
	c0	mpylu $r0.2 = $r0.2, $r0.4
;;
;;
	c0	add $r0.2 = $r0.2, $r0.6
;;
	c0	add $r0.2 = $r0.5, $r0.2
;;
	c0	stw 208[$r0.1] = $r0.2
;;
	c0	ldw $r0.2 = 188[$r0.1]
;;
	c0	ldw $r0.4 = 200[$r0.1]
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
	c0	add $r0.5 = $r0.4, 4
;;
	c0	stw 200[$r0.1] = $r0.5
;;
	c0	ldw $r0.4 = 0[$r0.4]
;;
	c0	ldw $r0.5 = 204[$r0.1]
;;
	c0	mpyhs $r0.6 = $r0.2, $r0.4
	c0	mpylu $r0.2 = $r0.2, $r0.4
;;
;;
	c0	add $r0.2 = $r0.2, $r0.6
;;
	c0	add $r0.2 = $r0.5, $r0.2
;;
	c0	stw 204[$r0.1] = $r0.2
;;
	c0	ldw $r0.2 = 208[$r0.1]
;;
	c0	ldw $r0.4 = 216[$r0.1]
;;
	c0	shr $r0.2 = $r0.2, $r0.3
;;
	c0	stw 4[$r0.4] = $r0.2
;;
	c0	ldw $r0.2 = 204[$r0.1]
;;
	c0	ldw $r0.4 = 216[$r0.1]
;;
	c0	shr $r0.2 = $r0.2, $r0.3
;;
	c0	stw 8[$r0.4] = $r0.2
;;
	c0	ldw $r0.2 = 196[$r0.1]
;;
;;
	c0	add $r0.2 = $r0.2, -4
;;
	c0	stw 192[$r0.1] = $r0.2
;;
	c0	ldw $r0.2 = 188[$r0.1]
;;
;;
	c0	add $r0.2 = $r0.2, -4
;;
	c0	stw 184[$r0.1] = $r0.2
;;
	c0	stw 212[$r0.1] = $r0.9
;;
LBB14_5:                                ## %for.cond49
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.2 = 212[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.2, 9
;;
;;
	c0	br $b0.0, LBB14_8
;;
## BB#6:                                ## %for.body51
                                        ##   in Loop: Header=BB14_5 Depth=1
	c0	ldw $r0.2 = 192[$r0.1]
;;
;;
	c0	add $r0.3 = $r0.2, -4
;;
	c0	stw 192[$r0.1] = $r0.3
;;
	c0	ldw $r0.3 = 196[$r0.1]
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
	c0	add $r0.4 = $r0.3, -4
;;
	c0	stw 196[$r0.1] = $r0.4
;;
	c0	stw 0[$r0.3] = $r0.2
;;
	c0	ldw $r0.2 = 184[$r0.1]
;;
;;
	c0	add $r0.3 = $r0.2, -4
;;
	c0	stw 184[$r0.1] = $r0.3
;;
	c0	ldw $r0.3 = 188[$r0.1]
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
	c0	add $r0.4 = $r0.3, -4
;;
	c0	stw 188[$r0.1] = $r0.4
;;
	c0	stw 0[$r0.3] = $r0.2
;;
## BB#7:                                ## %for.inc56
                                        ##   in Loop: Header=BB14_5 Depth=1
	c0	ldw $r0.2 = 212[$r0.1]
;;
;;
	c0	add $r0.2 = $r0.2, 1
;;
	c0	stw 212[$r0.1] = $r0.2
	c0	goto LBB14_5
;;
LBB14_8:                                ## %for.end58
	c0	ldw $r0.2 = 196[$r0.1]
;;
	c0	ldw $r0.3 = 0[$r0.7]
;;
;;
	c0	stw 0[$r0.2] = $r0.3
;;
	c0	ldw $r0.2 = 0[$r0.8]
;;
	c0	ldw $r0.3 = 188[$r0.1]
;;
;;
	c0	stw 0[$r0.3] = $r0.2
;;
	c0	ldw $l0.0 = 224[$r0.1]
;;
	c0	ldw $r0.63 = 228[$r0.1]
;;
	c0	ldw $r0.62 = 232[$r0.1]
;;
	c0	ldw $r0.61 = 236[$r0.1]
;;
	c0	ldw $r0.60 = 240[$r0.1]
;;
	c0	ldw $r0.59 = 244[$r0.1]
;;
	c0	ldw $r0.58 = 248[$r0.1]
;;
.return ret($r0.3:s32)
	c0	ldw $r0.57 = 252[$r0.1]
	c0	return $r0.1 = $r0.1, 256, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @reset
reset::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
	c0	mov $r0.2 = dec_detl
	c0	mov $r0.3 = 32
	c0	mov $r0.4 = detl
	c0	mov $r0.5 = dec_deth
;;
	c0	mov $r0.6 = 8
	c0	mov $r0.7 = deth
	c0	mov $r0.8 = rlt2
	c0	mov $r0.9 = rlt1
	c0	stw 0[$r0.2] = $r0.3
;;
	c0	mov $r0.10 = plt2
	c0	mov $r0.11 = plt1
	c0	mov $r0.12 = al2
	c0	mov $r0.13 = al1
;;
	c0	mov $r0.14 = nbl
	c0	mov $r0.15 = rh2
	c0	mov $r0.16 = rh1
	c0	stw 0[$r0.4] = $r0.3
;;
	c0	mov $r0.3 = ph2
	c0	mov $r0.4 = ph1
	c0	mov $r0.17 = ah2
	c0	mov $r0.18 = ah1
;;
	c0	mov $r0.19 = nbh
	c0	mov $r0.2 = 0
	c0	mov $r0.20 = dec_rlt2
	c0	stw 0[$r0.5] = $r0.6
	c0	mov $r0.5 = dec_rlt1
;;
	c0	mov $r0.21 = dec_plt2
	c0	mov $r0.22 = dec_plt1
	c0	mov $r0.23 = dec_al2
	c0	mov $r0.24 = dec_al1
;;
	c0	stw 0[$r0.7] = $r0.6
;;
	c0	stw 0[$r0.8] = $r0.2
;;
	c0	stw 0[$r0.9] = $r0.2
	c0	mov $r0.6 = dec_nbl
;;
	c0	stw 0[$r0.10] = $r0.2
;;
	c0	stw 0[$r0.11] = $r0.2
;;
	c0	stw 0[$r0.12] = $r0.2
;;
	c0	stw 0[$r0.13] = $r0.2
	c0	mov $r0.7 = dec_rh2
;;
	c0	stw 0[$r0.14] = $r0.2
;;
	c0	stw 0[$r0.15] = $r0.2
;;
	c0	stw 0[$r0.16] = $r0.2
;;
	c0	stw 0[$r0.3] = $r0.2
	c0	mov $r0.3 = dec_rh1
;;
	c0	stw 0[$r0.4] = $r0.2
;;
	c0	stw 0[$r0.17] = $r0.2
;;
	c0	stw 0[$r0.18] = $r0.2
;;
	c0	stw 0[$r0.19] = $r0.2
	c0	mov $r0.4 = dec_ph2
;;
	c0	stw 0[$r0.20] = $r0.2
;;
	c0	stw 0[$r0.5] = $r0.2
;;
	c0	stw 0[$r0.21] = $r0.2
;;
	c0	stw 0[$r0.22] = $r0.2
	c0	mov $r0.5 = dec_ph1
;;
	c0	stw 0[$r0.23] = $r0.2
;;
	c0	stw 0[$r0.24] = $r0.2
;;
	c0	stw 0[$r0.6] = $r0.2
;;
	c0	stw 0[$r0.7] = $r0.2
	c0	mov $r0.6 = dec_ah2
;;
	c0	stw 0[$r0.3] = $r0.2
;;
	c0	stw 0[$r0.4] = $r0.2
;;
	c0	stw 0[$r0.5] = $r0.2
	c0	mov $r0.3 = dec_ah1
;;
	c0	stw 0[$r0.6] = $r0.2
	c0	mov $r0.4 = dec_nbh
;;
	c0	stw 0[$r0.3] = $r0.2
;;
	c0	stw 0[$r0.4] = $r0.2
;;
	c0	stw 28[$r0.1] = $r0.2
	c0	mov $r0.3 = delay_dltx
	c0	mov $r0.4 = delay_dhx
	c0	mov $r0.5 = dec_del_dltx
;;
	c0	mov $r0.6 = dec_del_dhx
;;
LBB15_1:                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.7 = 28[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.7, 5
;;
;;
	c0	br $b0.0, LBB15_4
;;
## BB#2:                                ## %for.body
                                        ##   in Loop: Header=BB15_1 Depth=1
	c0	ldw $r0.7 = 28[$r0.1]
;;
;;
	c0	sh2add $r0.7 = $r0.7, $r0.3
;;
	c0	stw 0[$r0.7] = $r0.2
;;
	c0	ldw $r0.7 = 28[$r0.1]
;;
;;
	c0	sh2add $r0.7 = $r0.7, $r0.4
;;
	c0	stw 0[$r0.7] = $r0.2
;;
	c0	ldw $r0.7 = 28[$r0.1]
;;
;;
	c0	sh2add $r0.7 = $r0.7, $r0.5
;;
	c0	stw 0[$r0.7] = $r0.2
;;
	c0	ldw $r0.7 = 28[$r0.1]
;;
;;
	c0	sh2add $r0.7 = $r0.7, $r0.6
;;
	c0	stw 0[$r0.7] = $r0.2
;;
## BB#3:                                ## %for.inc
                                        ##   in Loop: Header=BB15_1 Depth=1
	c0	ldw $r0.7 = 28[$r0.1]
;;
;;
	c0	add $r0.7 = $r0.7, 1
;;
	c0	stw 28[$r0.1] = $r0.7
	c0	goto LBB15_1
;;
LBB15_4:                                ## %for.end
	c0	stw 28[$r0.1] = $r0.2
	c0	mov $r0.3 = delay_bpl
	c0	mov $r0.4 = delay_bph
	c0	mov $r0.5 = dec_del_bpl
;;
	c0	mov $r0.6 = dec_del_bph
;;
LBB15_5:                                ## %for.cond4
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.7 = 28[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.7, 5
;;
;;
	c0	br $b0.0, LBB15_8
;;
## BB#6:                                ## %for.body6
                                        ##   in Loop: Header=BB15_5 Depth=1
	c0	ldw $r0.7 = 28[$r0.1]
;;
;;
	c0	sh2add $r0.7 = $r0.7, $r0.3
;;
	c0	stw 0[$r0.7] = $r0.2
;;
	c0	ldw $r0.7 = 28[$r0.1]
;;
;;
	c0	sh2add $r0.7 = $r0.7, $r0.4
;;
	c0	stw 0[$r0.7] = $r0.2
;;
	c0	ldw $r0.7 = 28[$r0.1]
;;
;;
	c0	sh2add $r0.7 = $r0.7, $r0.5
;;
	c0	stw 0[$r0.7] = $r0.2
;;
	c0	ldw $r0.7 = 28[$r0.1]
;;
;;
	c0	sh2add $r0.7 = $r0.7, $r0.6
;;
	c0	stw 0[$r0.7] = $r0.2
;;
## BB#7:                                ## %for.inc11
                                        ##   in Loop: Header=BB15_5 Depth=1
	c0	ldw $r0.7 = 28[$r0.1]
;;
;;
	c0	add $r0.7 = $r0.7, 1
;;
	c0	stw 28[$r0.1] = $r0.7
	c0	goto LBB15_5
;;
LBB15_8:                                ## %for.end13
	c0	stw 28[$r0.1] = $r0.2
	c0	mov $r0.3 = tqmf
;;
LBB15_9:                                ## %for.cond14
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.4 = 28[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.4, 22
;;
;;
	c0	br $b0.0, LBB15_12
;;
## BB#10:                               ## %for.body16
                                        ##   in Loop: Header=BB15_9 Depth=1
	c0	ldw $r0.4 = 28[$r0.1]
;;
;;
	c0	sh2add $r0.4 = $r0.4, $r0.3
;;
	c0	stw 0[$r0.4] = $r0.2
;;
## BB#11:                               ## %for.inc18
                                        ##   in Loop: Header=BB15_9 Depth=1
	c0	ldw $r0.4 = 28[$r0.1]
;;
;;
	c0	add $r0.4 = $r0.4, 1
;;
	c0	stw 28[$r0.1] = $r0.4
	c0	goto LBB15_9
;;
LBB15_12:                               ## %for.end20
	c0	stw 28[$r0.1] = $r0.2
	c0	mov $r0.3 = accumc
	c0	mov $r0.4 = accumd
;;
LBB15_13:                               ## %for.cond21
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.5 = 28[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.5, 10
;;
;;
	c0	br $b0.0, LBB15_16
;;
## BB#14:                               ## %for.body23
                                        ##   in Loop: Header=BB15_13 Depth=1
	c0	ldw $r0.5 = 28[$r0.1]
;;
;;
	c0	sh2add $r0.5 = $r0.5, $r0.3
;;
	c0	stw 0[$r0.5] = $r0.2
;;
	c0	ldw $r0.5 = 28[$r0.1]
;;
;;
	c0	sh2add $r0.5 = $r0.5, $r0.4
;;
	c0	stw 0[$r0.5] = $r0.2
;;
## BB#15:                               ## %for.inc26
                                        ##   in Loop: Header=BB15_13 Depth=1
	c0	ldw $r0.5 = 28[$r0.1]
;;
;;
	c0	add $r0.5 = $r0.5, 1
;;
	c0	stw 28[$r0.1] = $r0.5
	c0	goto LBB15_13
;;
LBB15_16:                               ## %for.end28
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @invqxl
invqxl::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 60[$r0.1] = $r0.3
;;
	c0	stw 56[$r0.1] = $r0.4
;;
	c0	stw 52[$r0.1] = $r0.5
;;
	c0	stw 48[$r0.1] = $r0.6
	c0	add $r0.2 = $r0.6, -1
;;
	c0	ldw $r0.3 = 60[$r0.1]
;;
	c0	ldw $r0.4 = 52[$r0.1]
;;
	c0	shr $r0.2 = $r0.3, $r0.2
;;
	c0	sh2add $r0.2 = $r0.2, $r0.4
	c0	ldw $r0.3 = 56[$r0.1]
;;
	c0	ldw $r0.2 = 0[$r0.2]
	c0	mov $r0.4 = 15
;;
;;
	c0	mpylu $r0.5 = $r0.3, $r0.2
	c0	mpyhs $r0.2 = $r0.3, $r0.2
;;
;;
	c0	add $r0.2 = $r0.5, $r0.2
;;
.return ret($r0.3:s32)
	c0	shr $r0.3 = $r0.2, $r0.4
	c0	stw 44[$r0.1] = $r0.2
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @invqah
invqah::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $r0.3
;;
	c0	stw 24[$r0.1] = $r0.4
	c0	mov $r0.2 = qq2_code2_table
	c0	mov $r0.3 = 15
;;
	c0	ldw $r0.5 = 28[$r0.1]
;;
;;
	c0	sh2add $r0.2 = $r0.5, $r0.2
;;
	c0	ldw $r0.2 = 0[$r0.2]
;;
;;
	c0	mpyhs $r0.5 = $r0.4, $r0.2
	c0	mpylu $r0.2 = $r0.4, $r0.2
;;
;;
	c0	add $r0.2 = $r0.2, $r0.5
;;
	c0	shr $r0.3 = $r0.2, $r0.3
;;
.return ret($r0.3:s32)
	c0	stw 20[$r0.1] = $r0.3
	c0	return $r0.1 = $r0.1, 32, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg() ## @main
main::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -96
;;
	c0	stw 92[$r0.1] = $r0.57
;;
	c0	stw 88[$r0.1] = $r0.58
;;
	c0	stw 84[$r0.1] = $r0.59
;;
	c0	stw 80[$r0.1] = $r0.60
;;
	c0	stw 76[$r0.1] = $r0.61
;;
	c0	stw 72[$r0.1] = $l0.0
	c0	mov $r0.57 = 0
	c0	mov $r0.58 = 10
;;
.call reset, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	stw 68[$r0.1] = $r0.57
	c0	call $l0.0 = reset
;;
	c0	stw 48[$r0.1] = $r0.58
	c0	mov $r0.2 = 100
;;
	c0	stw 44[$r0.1] = $r0.2
;;
	c0	stw 52[$r0.1] = $r0.57
	c0	mov $r0.58 = 31
	c0	mov $r0.59 = 1
	c0	mov $r0.60 = main.compressed
	c0	add $r0.57 = $r0.1, 56
	c0	mov $r0.61 = main.result
;;
LBB18_1:                                ## %for.cond
                                        ## =>This Inner Loop Header: Depth=1
	c0	ldw $r0.2 = 52[$r0.1]
;;
;;
	c0	cmpgt $b0.0 = $r0.2, 99
;;
;;
	c0	br $b0.0, LBB18_3
;;
## BB#2:                                ## %for.inc
                                        ##   in Loop: Header=BB18_1 Depth=1
	c0	ldw $r0.2 = 52[$r0.1]
;;
;;
	c0	shru $r0.3 = $r0.2, $r0.58
;;
	c0	add $r0.2 = $r0.2, $r0.3
;;
	c0	shl $r0.2 = $r0.2, $r0.59
;;
	c0	and $r0.2 = $r0.2, -4
;;
	c0	add $r0.2 = $r0.60, $r0.2
;;
	c0	ldw $r0.3 = 0[$r0.2]
	c0	mov $r0.4 = $r0.57
;;
;;
.call decode, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = decode
;;
	c0	ldw $r0.2 = 52[$r0.1]
;;
	c0	ldw $r0.3 = 60[$r0.1]
;;
	c0	sh2add $r0.2 = $r0.2, $r0.61
;;
	c0	stw 0[$r0.2] = $r0.3
;;
	c0	ldw $r0.2 = 52[$r0.1]
;;
	c0	ldw $r0.3 = 64[$r0.1]
;;
	c0	sh2add $r0.2 = $r0.2, $r0.61
;;
	c0	stw 4[$r0.2] = $r0.3
;;
	c0	ldw $r0.2 = 52[$r0.1]
;;
;;
	c0	add $r0.2 = $r0.2, 2
;;
	c0	stw 52[$r0.1] = $r0.2
	c0	goto LBB18_1
;;
LBB18_3:                                ## %for.end
	c0	ldw $r0.2 = 60[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.2, 11113
;;
;;
	c0	br $b0.0, LBB18_6
;;
## BB#4:                                ## %land.lhs.true
	c0	ldw $r0.2 = 64[$r0.1]
;;
;;
	c0	cmpne $b0.0 = $r0.2, -11197
;;
;;
	c0	br $b0.0, LBB18_6
;;
## BB#5:                                ## %if.then
	c0	mov $r0.2 = 66
;;
	c0	stw 68[$r0.1] = $r0.2
	c0	goto LBB18_7
;;
LBB18_6:                                ## %if.else
	c0	mov $r0.2 = 15
;;
	c0	stw 68[$r0.1] = $r0.2
;;
LBB18_7:                                ## %return
	c0	ldw $r0.3 = 68[$r0.1]
;;
	c0	ldw $l0.0 = 72[$r0.1]
;;
	c0	ldw $r0.61 = 76[$r0.1]
;;
	c0	ldw $r0.60 = 80[$r0.1]
;;
	c0	ldw $r0.59 = 84[$r0.1]
;;
	c0	ldw $r0.58 = 88[$r0.1]
;;
.return ret($r0.3:s32)
	c0	ldw $r0.57 = 92[$r0.1]
	c0	return $r0.1 = $r0.1, 96, $l0.0
;;
.endp

.section .data

	.align	4                       ## @rand.next
rand.next:
	.data4	1                       ## 0x1

	.align	4                       ## @h
h:
	.data4	12                      ## 0xc
	.data4	4294967252              ## 0xffffffd4
	.data4	4294967252              ## 0xffffffd4
	.data4	212                     ## 0xd4
	.data4	48                      ## 0x30
	.data4	4294966672              ## 0xfffffd90
	.data4	128                     ## 0x80
	.data4	1448                    ## 0x5a8
	.data4	4294966456              ## 0xfffffcb8
	.data4	4294964076              ## 0xfffff36c
	.data4	3804                    ## 0xedc
	.data4	15504                   ## 0x3c90
	.data4	15504                   ## 0x3c90
	.data4	3804                    ## 0xedc
	.data4	4294964076              ## 0xfffff36c
	.data4	4294966456              ## 0xfffffcb8
	.data4	1448                    ## 0x5a8
	.data4	128                     ## 0x80
	.data4	4294966672              ## 0xfffffd90
	.data4	48                      ## 0x30
	.data4	212                     ## 0xd4
	.data4	4294967252              ## 0xffffffd4
	.data4	4294967252              ## 0xffffffd4
	.data4	12                      ## 0xc

	.align	4                       ## @qq4_code4_table
qq4_code4_table:
	.data4	0                       ## 0x0
	.data4	4294946840              ## 0xffffb018
	.data4	4294954400              ## 0xffffcda0
	.data4	4294958328              ## 0xffffdcf8
	.data4	4294961008              ## 0xffffe770
	.data4	4294963056              ## 0xffffef70
	.data4	4294964712              ## 0xfffff5e8
	.data4	4294966096              ## 0xfffffb50
	.data4	20456                   ## 0x4fe8
	.data4	12896                   ## 0x3260
	.data4	8968                    ## 0x2308
	.data4	6288                    ## 0x1890
	.data4	4240                    ## 0x1090
	.data4	2584                    ## 0xa18
	.data4	1200                    ## 0x4b0
	.data4	0                       ## 0x0

	.align	4                       ## @qq5_code5_table
qq5_code5_table:
	.data4	4294967016              ## 0xfffffee8
	.data4	4294967016              ## 0xfffffee8
	.data4	4294943944              ## 0xffffa4c8
	.data4	4294949736              ## 0xffffbb68
	.data4	4294953176              ## 0xffffc8d8
	.data4	4294955632              ## 0xffffd270
	.data4	4294957544              ## 0xffffd9e8
	.data4	4294959112              ## 0xffffe008
	.data4	4294960432              ## 0xffffe530
	.data4	4294961584              ## 0xffffe9b0
	.data4	4294962600              ## 0xffffeda8
	.data4	4294963512              ## 0xfffff138
	.data4	4294964336              ## 0xfffff470
	.data4	4294965088              ## 0xfffff760
	.data4	4294965776              ## 0xfffffa10
	.data4	4294966416              ## 0xfffffc90
	.data4	23352                   ## 0x5b38
	.data4	17560                   ## 0x4498
	.data4	14120                   ## 0x3728
	.data4	11664                   ## 0x2d90
	.data4	9752                    ## 0x2618
	.data4	8184                    ## 0x1ff8
	.data4	6864                    ## 0x1ad0
	.data4	5712                    ## 0x1650
	.data4	4696                    ## 0x1258
	.data4	3784                    ## 0xec8
	.data4	2960                    ## 0xb90
	.data4	2208                    ## 0x8a0
	.data4	1520                    ## 0x5f0
	.data4	880                     ## 0x370
	.data4	280                     ## 0x118
	.data4	4294967016              ## 0xfffffee8

	.align	4                       ## @qq6_code6_table
qq6_code6_table:
	.data4	4294967160              ## 0xffffff78
	.data4	4294967160              ## 0xffffff78
	.data4	4294967160              ## 0xffffff78
	.data4	4294967160              ## 0xffffff78
	.data4	4294942488              ## 0xffff9f18
	.data4	4294945392              ## 0xffffaa70
	.data4	4294948288              ## 0xffffb5c0
	.data4	4294950592              ## 0xffffbec0
	.data4	4294952312              ## 0xffffc578
	.data4	4294953784              ## 0xffffcb38
	.data4	4294955016              ## 0xffffd008
	.data4	4294956104              ## 0xffffd448
	.data4	4294957064              ## 0xffffd808
	.data4	4294957936              ## 0xffffdb70
	.data4	4294958720              ## 0xffffde80
	.data4	4294959440              ## 0xffffe150
	.data4	4294960104              ## 0xffffe3e8
	.data4	4294960720              ## 0xffffe650
	.data4	4294961296              ## 0xffffe890
	.data4	4294961840              ## 0xffffeab0
	.data4	4294962352              ## 0xffffecb0
	.data4	4294962832              ## 0xffffee90
	.data4	4294963288              ## 0xfffff058
	.data4	4294963720              ## 0xfffff208
	.data4	4294964128              ## 0xfffff3a0
	.data4	4294964520              ## 0xfffff528
	.data4	4294964896              ## 0xfffff6a0
	.data4	4294965264              ## 0xfffff810
	.data4	4294965608              ## 0xfffff968
	.data4	4294965936              ## 0xfffffab0
	.data4	4294966256              ## 0xfffffbf0
	.data4	4294966568              ## 0xfffffd28
	.data4	24808                   ## 0x60e8
	.data4	21904                   ## 0x5590
	.data4	19008                   ## 0x4a40
	.data4	16704                   ## 0x4140
	.data4	14984                   ## 0x3a88
	.data4	13512                   ## 0x34c8
	.data4	12280                   ## 0x2ff8
	.data4	11192                   ## 0x2bb8
	.data4	10232                   ## 0x27f8
	.data4	9360                    ## 0x2490
	.data4	8576                    ## 0x2180
	.data4	7856                    ## 0x1eb0
	.data4	7192                    ## 0x1c18
	.data4	6576                    ## 0x19b0
	.data4	6000                    ## 0x1770
	.data4	5456                    ## 0x1550
	.data4	4944                    ## 0x1350
	.data4	4464                    ## 0x1170
	.data4	4008                    ## 0xfa8
	.data4	3576                    ## 0xdf8
	.data4	3168                    ## 0xc60
	.data4	2776                    ## 0xad8
	.data4	2400                    ## 0x960
	.data4	2032                    ## 0x7f0
	.data4	1688                    ## 0x698
	.data4	1360                    ## 0x550
	.data4	1040                    ## 0x410
	.data4	728                     ## 0x2d8
	.data4	432                     ## 0x1b0
	.data4	136                     ## 0x88
	.data4	4294966864              ## 0xfffffe50
	.data4	4294967160              ## 0xffffff78

	.align	4                       ## @wl_code_table
wl_code_table:
	.data4	4294967236              ## 0xffffffc4
	.data4	3042                    ## 0xbe2
	.data4	1198                    ## 0x4ae
	.data4	538                     ## 0x21a
	.data4	334                     ## 0x14e
	.data4	172                     ## 0xac
	.data4	58                      ## 0x3a
	.data4	4294967266              ## 0xffffffe2
	.data4	3042                    ## 0xbe2
	.data4	1198                    ## 0x4ae
	.data4	538                     ## 0x21a
	.data4	334                     ## 0x14e
	.data4	172                     ## 0xac
	.data4	58                      ## 0x3a
	.data4	4294967266              ## 0xffffffe2
	.data4	4294967236              ## 0xffffffc4

	.align	4                       ## @wl_table
wl_table:
	.data4	4294967236              ## 0xffffffc4
	.data4	4294967266              ## 0xffffffe2
	.data4	58                      ## 0x3a
	.data4	172                     ## 0xac
	.data4	334                     ## 0x14e
	.data4	538                     ## 0x21a
	.data4	1198                    ## 0x4ae
	.data4	3042                    ## 0xbe2

	.align	4                       ## @ilb_table
ilb_table:
	.data4	2048                    ## 0x800
	.data4	2093                    ## 0x82d
	.data4	2139                    ## 0x85b
	.data4	2186                    ## 0x88a
	.data4	2233                    ## 0x8b9
	.data4	2282                    ## 0x8ea
	.data4	2332                    ## 0x91c
	.data4	2383                    ## 0x94f
	.data4	2435                    ## 0x983
	.data4	2489                    ## 0x9b9
	.data4	2543                    ## 0x9ef
	.data4	2599                    ## 0xa27
	.data4	2656                    ## 0xa60
	.data4	2714                    ## 0xa9a
	.data4	2774                    ## 0xad6
	.data4	2834                    ## 0xb12
	.data4	2896                    ## 0xb50
	.data4	2960                    ## 0xb90
	.data4	3025                    ## 0xbd1
	.data4	3091                    ## 0xc13
	.data4	3158                    ## 0xc56
	.data4	3228                    ## 0xc9c
	.data4	3298                    ## 0xce2
	.data4	3371                    ## 0xd2b
	.data4	3444                    ## 0xd74
	.data4	3520                    ## 0xdc0
	.data4	3597                    ## 0xe0d
	.data4	3676                    ## 0xe5c
	.data4	3756                    ## 0xeac
	.data4	3838                    ## 0xefe
	.data4	3922                    ## 0xf52
	.data4	4008                    ## 0xfa8

	.align	4                       ## @decis_levl
decis_levl:
	.data4	280                     ## 0x118
	.data4	576                     ## 0x240
	.data4	880                     ## 0x370
	.data4	1200                    ## 0x4b0
	.data4	1520                    ## 0x5f0
	.data4	1864                    ## 0x748
	.data4	2208                    ## 0x8a0
	.data4	2584                    ## 0xa18
	.data4	2960                    ## 0xb90
	.data4	3376                    ## 0xd30
	.data4	3784                    ## 0xec8
	.data4	4240                    ## 0x1090
	.data4	4696                    ## 0x1258
	.data4	5200                    ## 0x1450
	.data4	5712                    ## 0x1650
	.data4	6288                    ## 0x1890
	.data4	6864                    ## 0x1ad0
	.data4	7520                    ## 0x1d60
	.data4	8184                    ## 0x1ff8
	.data4	8968                    ## 0x2308
	.data4	9752                    ## 0x2618
	.data4	10712                   ## 0x29d8
	.data4	11664                   ## 0x2d90
	.data4	12896                   ## 0x3260
	.data4	14120                   ## 0x3728
	.data4	15840                   ## 0x3de0
	.data4	17560                   ## 0x4498
	.data4	20456                   ## 0x4fe8
	.data4	23352                   ## 0x5b38
	.data4	32767                   ## 0x7fff

	.align	4                       ## @quant26bt_pos
quant26bt_pos:
	.data4	61                      ## 0x3d
	.data4	60                      ## 0x3c
	.data4	59                      ## 0x3b
	.data4	58                      ## 0x3a
	.data4	57                      ## 0x39
	.data4	56                      ## 0x38
	.data4	55                      ## 0x37
	.data4	54                      ## 0x36
	.data4	53                      ## 0x35
	.data4	52                      ## 0x34
	.data4	51                      ## 0x33
	.data4	50                      ## 0x32
	.data4	49                      ## 0x31
	.data4	48                      ## 0x30
	.data4	47                      ## 0x2f
	.data4	46                      ## 0x2e
	.data4	45                      ## 0x2d
	.data4	44                      ## 0x2c
	.data4	43                      ## 0x2b
	.data4	42                      ## 0x2a
	.data4	41                      ## 0x29
	.data4	40                      ## 0x28
	.data4	39                      ## 0x27
	.data4	38                      ## 0x26
	.data4	37                      ## 0x25
	.data4	36                      ## 0x24
	.data4	35                      ## 0x23
	.data4	34                      ## 0x22
	.data4	33                      ## 0x21
	.data4	32                      ## 0x20
	.data4	32                      ## 0x20

	.align	4                       ## @quant26bt_neg
quant26bt_neg:
	.data4	63                      ## 0x3f
	.data4	62                      ## 0x3e
	.data4	31                      ## 0x1f
	.data4	30                      ## 0x1e
	.data4	29                      ## 0x1d
	.data4	28                      ## 0x1c
	.data4	27                      ## 0x1b
	.data4	26                      ## 0x1a
	.data4	25                      ## 0x19
	.data4	24                      ## 0x18
	.data4	23                      ## 0x17
	.data4	22                      ## 0x16
	.data4	21                      ## 0x15
	.data4	20                      ## 0x14
	.data4	19                      ## 0x13
	.data4	18                      ## 0x12
	.data4	17                      ## 0x11
	.data4	16                      ## 0x10
	.data4	15                      ## 0xf
	.data4	14                      ## 0xe
	.data4	13                      ## 0xd
	.data4	12                      ## 0xc
	.data4	11                      ## 0xb
	.data4	10                      ## 0xa
	.data4	9                       ## 0x9
	.data4	8                       ## 0x8
	.data4	7                       ## 0x7
	.data4	6                       ## 0x6
	.data4	5                       ## 0x5
	.data4	4                       ## 0x4
	.data4	4                       ## 0x4

	.align	4                       ## @qq2_code2_table
qq2_code2_table:
	.data4	4294959888              ## 0xffffe310
	.data4	4294965680              ## 0xfffff9b0
	.data4	7408                    ## 0x1cf0
	.data4	1616                    ## 0x650

	.align	4                       ## @wh_code_table
wh_code_table:
	.data4	798                     ## 0x31e
	.data4	4294967082              ## 0xffffff2a
	.data4	798                     ## 0x31e
	.data4	4294967082              ## 0xffffff2a

	.comm	tqmf,96,4               ## @tqmf
	.comm	xl,4,4                  ## @xl
	.comm	xh,4,4                  ## @xh
	.comm	delay_bpl,24,4          ## @delay_bpl
	.comm	delay_dltx,24,4         ## @delay_dltx
	.comm	szl,4,4                 ## @szl
	.comm	rlt1,4,4                ## @rlt1
	.comm	al1,4,4                 ## @al1
	.comm	rlt2,4,4                ## @rlt2
	.comm	al2,4,4                 ## @al2
	.comm	spl,4,4                 ## @spl
	.comm	sl,4,4                  ## @sl
	.comm	el,4,4                  ## @el
	.comm	detl,4,4                ## @detl
	.comm	il,4,4                  ## @il
	.comm	dlt,4,4                 ## @dlt
	.comm	nbl,4,4                 ## @nbl
	.comm	plt,4,4                 ## @plt
	.comm	plt1,4,4                ## @plt1
	.comm	plt2,4,4                ## @plt2
	.comm	rlt,4,4                 ## @rlt
	.comm	delay_bph,24,4          ## @delay_bph
	.comm	delay_dhx,24,4          ## @delay_dhx
	.comm	szh,4,4                 ## @szh
	.comm	rh1,4,4                 ## @rh1
	.comm	ah1,4,4                 ## @ah1
	.comm	rh2,4,4                 ## @rh2
	.comm	ah2,4,4                 ## @ah2
	.comm	sph,4,4                 ## @sph
	.comm	sh,4,4                  ## @sh
	.comm	eh,4,4                  ## @eh
	.comm	ih,4,4                  ## @ih
	.comm	deth,4,4                ## @deth
	.comm	dh,4,4                  ## @dh
	.comm	nbh,4,4                 ## @nbh
	.comm	ph,4,4                  ## @ph
	.comm	ph1,4,4                 ## @ph1
	.comm	ph2,4,4                 ## @ph2
	.comm	yh,4,4                  ## @yh
	.comm	ilr,4,4                 ## @ilr
	.comm	dec_del_bpl,24,4        ## @dec_del_bpl
	.comm	dec_del_dltx,24,4       ## @dec_del_dltx
	.comm	dec_szl,4,4             ## @dec_szl
	.comm	dec_rlt1,4,4            ## @dec_rlt1
	.comm	dec_al1,4,4             ## @dec_al1
	.comm	dec_rlt2,4,4            ## @dec_rlt2
	.comm	dec_al2,4,4             ## @dec_al2
	.comm	dec_spl,4,4             ## @dec_spl
	.comm	dec_sl,4,4              ## @dec_sl
	.comm	dec_detl,4,4            ## @dec_detl
	.comm	dec_dlt,4,4             ## @dec_dlt
	.comm	dl,4,4                  ## @dl
	.comm	rl,4,4                  ## @rl
	.comm	dec_nbl,4,4             ## @dec_nbl
	.comm	dec_plt,4,4             ## @dec_plt
	.comm	dec_plt1,4,4            ## @dec_plt1
	.comm	dec_plt2,4,4            ## @dec_plt2
	.comm	dec_rlt,4,4             ## @dec_rlt
	.comm	dec_del_bph,24,4        ## @dec_del_bph
	.comm	dec_del_dhx,24,4        ## @dec_del_dhx
	.comm	dec_szh,4,4             ## @dec_szh
	.comm	dec_rh1,4,4             ## @dec_rh1
	.comm	dec_ah1,4,4             ## @dec_ah1
	.comm	dec_rh2,4,4             ## @dec_rh2
	.comm	dec_ah2,4,4             ## @dec_ah2
	.comm	dec_sph,4,4             ## @dec_sph
	.comm	dec_sh,4,4              ## @dec_sh
	.comm	dec_deth,4,4            ## @dec_deth
	.comm	dec_dh,4,4              ## @dec_dh
	.comm	dec_nbh,4,4             ## @dec_nbh
	.comm	dec_ph,4,4              ## @dec_ph
	.comm	dec_ph1,4,4             ## @dec_ph1
	.comm	dec_ph2,4,4             ## @dec_ph2
	.comm	rh,4,4                  ## @rh
	.comm	xd,4,4                  ## @xd
	.comm	xs,4,4                  ## @xs
	.comm	accumc,44,4             ## @accumc
	.comm	accumd,44,4             ## @accumd
	.local	main.compressed         ## @main.compressed
	.comm	main.compressed,400,4
	.local	main.result             ## @main.result
	.comm	main.result,400,4
	.align	4                       ## @main.test_data
main.test_data:
	.data4	68                      ## 0x44
	.data4	68                      ## 0x44
	.data4	68                      ## 0x44
	.data4	68                      ## 0x44
	.data4	68                      ## 0x44
	.data4	68                      ## 0x44
	.data4	68                      ## 0x44
	.data4	68                      ## 0x44
	.data4	68                      ## 0x44
	.data4	68                      ## 0x44
	.data4	68                      ## 0x44
	.data4	68                      ## 0x44
	.data4	68                      ## 0x44
	.data4	68                      ## 0x44
	.data4	68                      ## 0x44
	.data4	68                      ## 0x44
	.data4	68                      ## 0x44
	.data4	67                      ## 0x43
	.data4	67                      ## 0x43
	.data4	67                      ## 0x43
	.data4	67                      ## 0x43
	.data4	67                      ## 0x43
	.data4	67                      ## 0x43
	.data4	67                      ## 0x43
	.data4	66                      ## 0x42
	.data4	66                      ## 0x42
	.data4	66                      ## 0x42
	.data4	66                      ## 0x42
	.data4	66                      ## 0x42
	.data4	66                      ## 0x42
	.data4	65                      ## 0x41
	.data4	65                      ## 0x41
	.data4	65                      ## 0x41
	.data4	65                      ## 0x41
	.data4	65                      ## 0x41
	.data4	64                      ## 0x40
	.data4	64                      ## 0x40
	.data4	64                      ## 0x40
	.data4	64                      ## 0x40
	.data4	64                      ## 0x40
	.data4	64                      ## 0x40
	.data4	64                      ## 0x40
	.data4	64                      ## 0x40
	.data4	63                      ## 0x3f
	.data4	63                      ## 0x3f
	.data4	63                      ## 0x3f
	.data4	63                      ## 0x3f
	.data4	63                      ## 0x3f
	.data4	62                      ## 0x3e
	.data4	62                      ## 0x3e
	.data4	62                      ## 0x3e
	.data4	62                      ## 0x3e
	.data4	62                      ## 0x3e
	.data4	62                      ## 0x3e
	.data4	61                      ## 0x3d
	.data4	61                      ## 0x3d
	.data4	61                      ## 0x3d
	.data4	61                      ## 0x3d
	.data4	61                      ## 0x3d
	.data4	61                      ## 0x3d
	.data4	60                      ## 0x3c
	.data4	60                      ## 0x3c
	.data4	60                      ## 0x3c
	.data4	60                      ## 0x3c
	.data4	60                      ## 0x3c
	.data4	60                      ## 0x3c
	.data4	60                      ## 0x3c
	.data4	60                      ## 0x3c
	.data4	60                      ## 0x3c
	.data4	59                      ## 0x3b
	.data4	59                      ## 0x3b
	.data4	59                      ## 0x3b
	.data4	59                      ## 0x3b
	.data4	59                      ## 0x3b
	.data4	59                      ## 0x3b
	.data4	59                      ## 0x3b
	.data4	59                      ## 0x3b
	.data4	59                      ## 0x3b
	.data4	59                      ## 0x3b
	.data4	59                      ## 0x3b
	.data4	59                      ## 0x3b
	.data4	59                      ## 0x3b
	.data4	59                      ## 0x3b
	.data4	59                      ## 0x3b
	.data4	59                      ## 0x3b
	.data4	59                      ## 0x3b
	.data4	59                      ## 0x3b
	.data4	59                      ## 0x3b
	.data4	59                      ## 0x3b
	.data4	59                      ## 0x3b
	.data4	59                      ## 0x3b
	.data4	59                      ## 0x3b
	.data4	60                      ## 0x3c
	.data4	60                      ## 0x3c
	.data4	60                      ## 0x3c
	.data4	60                      ## 0x3c
	.data4	60                      ## 0x3c
	.data4	60                      ## 0x3c
	.data4	60                      ## 0x3c
	.data4	60                      ## 0x3c

	.comm	rs,4,4                  ## @rs
	.comm	yl,4,4                  ## @yl
	.comm	dec_yh,4,4              ## @dec_yh
	.comm	dec_rh,4,4              ## @dec_rh

