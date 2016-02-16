.section .text

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-32, arg() ## @func
func::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -32
;;
	c0	stw 28[$r0.1] = $r0.57
;;
	c0	stw 24[$r0.1] = $r0.58
;;
	c0	stw 20[$r0.1] = $l0.0
	c0	cmplt $r0.2 = $r0.3, $r0.0
	c0	cmplt $r0.11 = $r0.4, $r0.0
	c0	sub $r0.12 = $r0.0, $r0.3
;;
	c0	sub $r0.13 = $r0.0, $r0.4
	c0	mtb $b0.0 = $r0.2
	c0	mtb $b0.1 = $r0.11
	c0	mov $r0.14 = 0
;;
;;
	c0	slct $r0.3 = $b0.0, $r0.12, $r0.3
	c0	slct $r0.4 = $b0.1, $r0.13, $r0.4
	c0	mtb $b0.0 = $r0.14
;;
;;
	c0	addcg $r0.12, $b0.0 = $r0.3, $r0.3, $b0.0
	c0	mtb $b0.1 = $r0.14
;;
;;
	c0	addcg $r0.3, $b0.1 = $r0.12, $r0.12, $b0.1
	c0	divs $r0.12, $b0.0 = $r0.0, $r0.4, $b0.0
;;
	c0	divs $r0.12, $b0.1 = $r0.12, $r0.4, $b0.1
	c0	addcg $r0.13, $b0.0 = $r0.3, $r0.3, $b0.0
;;
	c0	divs $r0.3, $b0.0 = $r0.12, $r0.4, $b0.0
	c0	addcg $r0.12, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.4, $b0.1
	c0	addcg $r0.13, $b0.0 = $r0.12, $r0.12, $b0.0
;;
	c0	divs $r0.3, $b0.0 = $r0.3, $r0.4, $b0.0
	c0	addcg $r0.12, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.4, $b0.1
	c0	addcg $r0.13, $b0.0 = $r0.12, $r0.12, $b0.0
;;
	c0	divs $r0.3, $b0.0 = $r0.3, $r0.4, $b0.0
	c0	addcg $r0.12, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.4, $b0.1
	c0	addcg $r0.13, $b0.0 = $r0.12, $r0.12, $b0.0
;;
	c0	divs $r0.3, $b0.0 = $r0.3, $r0.4, $b0.0
	c0	addcg $r0.12, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.4, $b0.1
	c0	addcg $r0.13, $b0.0 = $r0.12, $r0.12, $b0.0
;;
	c0	divs $r0.3, $b0.0 = $r0.3, $r0.4, $b0.0
	c0	addcg $r0.12, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.4, $b0.1
	c0	addcg $r0.13, $b0.0 = $r0.12, $r0.12, $b0.0
;;
	c0	divs $r0.3, $b0.0 = $r0.3, $r0.4, $b0.0
	c0	addcg $r0.12, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.4, $b0.1
	c0	addcg $r0.13, $b0.0 = $r0.12, $r0.12, $b0.0
;;
	c0	divs $r0.3, $b0.0 = $r0.3, $r0.4, $b0.0
	c0	addcg $r0.12, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.4, $b0.1
	c0	addcg $r0.13, $b0.0 = $r0.12, $r0.12, $b0.0
;;
	c0	divs $r0.3, $b0.0 = $r0.3, $r0.4, $b0.0
	c0	addcg $r0.12, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.4, $b0.1
	c0	addcg $r0.13, $b0.0 = $r0.12, $r0.12, $b0.0
;;
	c0	divs $r0.3, $b0.0 = $r0.3, $r0.4, $b0.0
	c0	addcg $r0.12, $b0.1 = $r0.13, $r0.13, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.4, $b0.1
	c0	addcg $r0.13, $b0.0 = $r0.12, $r0.12, $b0.0
;;
	c0	divs $r0.3, $b0.2 = $r0.3, $r0.4, $b0.0
	c0	addcg $r0.12, $b0.1 = $r0.13, $r0.13, $b0.1
	c0	add $r0.8 = $r0.9, $r0.8
	c0	cmpeq $b0.0 = $r0.2, $r0.11
;;
	c0	divs $r0.2, $b0.1 = $r0.3, $r0.4, $b0.1
	c0	addcg $r0.3, $b0.2 = $r0.12, $r0.12, $b0.2
	c0	ldw $r0.9 = 48[$r0.1]
;;
	c0	divs $r0.2, $b0.2 = $r0.2, $r0.4, $b0.2
	c0	addcg $r0.11, $b0.1 = $r0.3, $r0.3, $b0.1
;;
	c0	divs $r0.2, $b0.1 = $r0.2, $r0.4, $b0.1
	c0	addcg $r0.3, $b0.2 = $r0.11, $r0.11, $b0.2
	c0	add $r0.8 = $r0.8, $r0.10
;;
	c0	divs $r0.2, $b0.2 = $r0.2, $r0.4, $b0.2
	c0	addcg $r0.10, $b0.1 = $r0.3, $r0.3, $b0.1
	c0	add $r0.3 = $r0.8, $r0.9
;;
	c0	divs $r0.2, $b0.1 = $r0.2, $r0.4, $b0.1
	c0	addcg $r0.8, $b0.2 = $r0.10, $r0.10, $b0.2
	c0	mpylu $r0.9 = $r0.6, $r0.5
	c0	mpyhs $r0.5 = $r0.6, $r0.5
;;
	c0	divs $r0.2, $b0.2 = $r0.2, $r0.4, $b0.2
	c0	addcg $r0.6, $b0.1 = $r0.8, $r0.8, $b0.1
	c0	ldw $r0.8 = 52[$r0.1]
;;
	c0	add $r0.5 = $r0.9, $r0.5
	c0	divs $r0.2, $b0.1 = $r0.2, $r0.4, $b0.1
	c0	addcg $r0.9, $b0.2 = $r0.6, $r0.6, $b0.2
;;
	c0	add $r0.3 = $r0.3, $r0.8
	c0	divs $r0.2, $b0.2 = $r0.2, $r0.4, $b0.2
	c0	addcg $r0.6, $b0.1 = $r0.9, $r0.9, $b0.1
	c0	ldw $r0.8 = 56[$r0.1]
;;
	c0	divs $r0.2, $b0.1 = $r0.2, $r0.4, $b0.1
	c0	addcg $r0.9, $b0.2 = $r0.6, $r0.6, $b0.2
;;
	c0	add $r0.6 = $r0.3, $r0.8
	c0	divs $r0.2, $b0.2 = $r0.2, $r0.4, $b0.2
	c0	addcg $r0.3, $b0.1 = $r0.9, $r0.9, $b0.1
;;
	c0	divs $r0.2, $b0.1 = $r0.2, $r0.4, $b0.1
	c0	addcg $r0.4, $b0.2 = $r0.3, $r0.3, $b0.2
;;
	c0	addcg $r0.3, $b0.1 = $r0.4, $r0.4, $b0.1
	c0	cmpge $r0.2 = $r0.2, $r0.0
;;
	c0	orc $r0.4 = $r0.3, $r0.0
	c0	add $r0.5 = $r0.5, $r0.7
	c0	mov $r0.3 = .str
;;
	c0	sh1add $r0.2 = $r0.4, $r0.2
;;
	c0	sub $r0.4 = $r0.0, $r0.2
;;
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.4
;;
	c0	add $r0.57 = $r0.6, $r0.2
	c0	add $r0.58 = $r0.5, $r0.2
;;
	c0	mov $r0.4 = $r0.58
	c0	mov $r0.5 = $r0.57
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	max $r0.3 = $r0.58, $r0.57
	c0	ldw $l0.0 = 20[$r0.1]
;;
	c0	ldw $r0.58 = 24[$r0.1]
;;
	c0	ldw $r0.57 = 28[$r0.1]
;;
;;
.return ret($r0.3:s32)
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
	c0	stw 72[$r0.1] = $r0.62
;;
	c0	stw 68[$r0.1] = $r0.63
;;
	c0	stw 64[$r0.1] = $l0.0
	c0	mov $r0.2 = a
;;
	c0	stw 60[$r0.1] = $r0.2
	c0	mov $r0.63 = b
	c0	mov $r0.57 = 0
;;
	c0	mov $r0.9 = f
;;
	c0	stw 36[$r0.1] = $r0.9
;;
	c0	ldw $r0.2 = 0[$r0.2]
	c0	mov $r0.8 = g
;;
	c0	stw 32[$r0.1] = $r0.8
	c0	mov $r0.58 = c
;;
	c0	mov $r0.12 = h
;;
	c0	stw 44[$r0.1] = $r0.12
;;
	c0	ldw $r0.3 = 0[$r0.63]
	c0	cmplt $r0.4 = $r0.2, $r0.0
	c0	sub $r0.5 = $r0.0, $r0.2
;;
	c0	mov $r0.11 = d
;;
	c0	stw 52[$r0.1] = $r0.11
	c0	mtb $b0.0 = $r0.4
;;
	c0	cmplt $r0.6 = $r0.3, $r0.0
	c0	sub $r0.7 = $r0.0, $r0.3
	c0	ldw $r0.8 = 0[$r0.8]
;;
	c0	slct $r0.2 = $b0.0, $r0.5, $r0.2
	c0	mtb $b0.0 = $r0.6
	c0	ldw $r0.5 = 0[$r0.9]
;;
	c0	mov $r0.10 = i
;;
	c0	stw 48[$r0.1] = $r0.10
	c0	mtb $b0.1 = $r0.57
;;
;;
	c0	addcg $r0.9, $b0.1 = $r0.2, $r0.2, $b0.1
	c0	slct $r0.2 = $b0.0, $r0.7, $r0.3
	c0	add $r0.3 = $r0.8, $r0.5
	c0	ldw $r0.5 = 0[$r0.12]
;;
	c0	mtb $b0.0 = $r0.57
;;
;;
	c0	addcg $r0.7, $b0.0 = $r0.9, $r0.9, $b0.0
	c0	divs $r0.8, $b0.1 = $r0.0, $r0.2, $b0.1
	c0	ldw $r0.9 = 0[$r0.11]
	c0	add $r0.3 = $r0.3, $r0.5
;;
	c0	divs $r0.5, $b0.2 = $r0.8, $r0.2, $b0.0
	c0	addcg $r0.8, $b0.1 = $r0.7, $r0.7, $b0.1
	c0	ldw $r0.7 = 0[$r0.58]
	c0	cmpeq $b0.0 = $r0.4, $r0.6
;;
	c0	divs $r0.4, $b0.1 = $r0.5, $r0.2, $b0.1
	c0	addcg $r0.5, $b0.2 = $r0.8, $r0.8, $b0.2
;;
	c0	mpylu $r0.6 = $r0.9, $r0.7
	c0	mpyhs $r0.7 = $r0.9, $r0.7
	c0	divs $r0.4, $b0.2 = $r0.4, $r0.2, $b0.2
	c0	addcg $r0.8, $b0.1 = $r0.5, $r0.5, $b0.1
;;
	c0	ldw $r0.5 = 0[$r0.10]
	c0	mov $r0.62 = j
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.2, $b0.1
;;
	c0	addcg $r0.9, $b0.2 = $r0.8, $r0.8, $b0.2
;;
	c0	add $r0.3 = $r0.3, $r0.5
	c0	ldb $r0.5 = 0[$r0.62]
	c0	divs $r0.4, $b0.2 = $r0.4, $r0.2, $b0.2
	c0	addcg $r0.8, $b0.1 = $r0.9, $r0.9, $b0.1
;;
	c0	add $r0.6 = $r0.6, $r0.7
;;
	c0	add $r0.9 = $r0.3, $r0.5
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.2, $b0.1
	c0	addcg $r0.5, $b0.2 = $r0.8, $r0.8, $b0.2
;;
	c0	mov $r0.10 = e
;;
	c0	stw 40[$r0.1] = $r0.10
	c0	mov $r0.3 = k
;;
	c0	stw 56[$r0.1] = $r0.3
	c0	divs $r0.4, $b0.2 = $r0.4, $r0.2, $b0.2
	c0	addcg $r0.7, $b0.1 = $r0.5, $r0.5, $b0.1
;;
	c0	ldh $r0.5 = 0[$r0.3]
	c0	mov $r0.3 = .str
;;
	c0	stw 28[$r0.1] = $r0.3
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.2, $b0.1
	c0	addcg $r0.8, $b0.2 = $r0.7, $r0.7, $b0.2
;;
	c0	ldw $r0.7 = 0[$r0.10]
	c0	add $r0.9 = $r0.9, $r0.5
	c0	divs $r0.4, $b0.2 = $r0.4, $r0.2, $b0.2
	c0	addcg $r0.5, $b0.1 = $r0.8, $r0.8, $b0.1
;;
;;
	c0	add $r0.6 = $r0.6, $r0.7
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.2, $b0.1
	c0	addcg $r0.7, $b0.2 = $r0.5, $r0.5, $b0.2
;;
	c0	mov $r0.59 = .str1
	c0	divs $r0.4, $b0.2 = $r0.4, $r0.2, $b0.2
	c0	addcg $r0.5, $b0.1 = $r0.7, $r0.7, $b0.1
;;
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.2, $b0.1
	c0	addcg $r0.7, $b0.2 = $r0.5, $r0.5, $b0.2
;;
	c0	divs $r0.4, $b0.2 = $r0.4, $r0.2, $b0.2
	c0	addcg $r0.5, $b0.1 = $r0.7, $r0.7, $b0.1
;;
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.2, $b0.1
	c0	addcg $r0.7, $b0.2 = $r0.5, $r0.5, $b0.2
;;
	c0	divs $r0.4, $b0.2 = $r0.4, $r0.2, $b0.2
	c0	addcg $r0.5, $b0.1 = $r0.7, $r0.7, $b0.1
;;
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.2, $b0.1
	c0	addcg $r0.7, $b0.2 = $r0.5, $r0.5, $b0.2
;;
	c0	divs $r0.4, $b0.2 = $r0.4, $r0.2, $b0.2
	c0	addcg $r0.5, $b0.1 = $r0.7, $r0.7, $b0.1
;;
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.2, $b0.1
	c0	addcg $r0.7, $b0.2 = $r0.5, $r0.5, $b0.2
;;
	c0	divs $r0.4, $b0.2 = $r0.4, $r0.2, $b0.2
	c0	addcg $r0.5, $b0.1 = $r0.7, $r0.7, $b0.1
;;
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.2, $b0.1
	c0	addcg $r0.7, $b0.2 = $r0.5, $r0.5, $b0.2
;;
	c0	divs $r0.4, $b0.2 = $r0.4, $r0.2, $b0.2
	c0	addcg $r0.5, $b0.1 = $r0.7, $r0.7, $b0.1
;;
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.2, $b0.1
	c0	addcg $r0.7, $b0.2 = $r0.5, $r0.5, $b0.2
;;
	c0	divs $r0.4, $b0.2 = $r0.4, $r0.2, $b0.2
	c0	addcg $r0.5, $b0.1 = $r0.7, $r0.7, $b0.1
;;
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.2, $b0.1
	c0	addcg $r0.7, $b0.2 = $r0.5, $r0.5, $b0.2
;;
	c0	divs $r0.4, $b0.2 = $r0.4, $r0.2, $b0.2
	c0	addcg $r0.5, $b0.1 = $r0.7, $r0.7, $b0.1
;;
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.2, $b0.1
	c0	addcg $r0.7, $b0.2 = $r0.5, $r0.5, $b0.2
;;
	c0	divs $r0.4, $b0.2 = $r0.4, $r0.2, $b0.2
	c0	addcg $r0.5, $b0.1 = $r0.7, $r0.7, $b0.1
;;
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.2, $b0.1
	c0	addcg $r0.7, $b0.2 = $r0.5, $r0.5, $b0.2
;;
	c0	divs $r0.4, $b0.2 = $r0.4, $r0.2, $b0.2
	c0	addcg $r0.5, $b0.1 = $r0.7, $r0.7, $b0.1
;;
	c0	divs $r0.4, $b0.1 = $r0.4, $r0.2, $b0.1
	c0	addcg $r0.7, $b0.2 = $r0.5, $r0.5, $b0.2
;;
	c0	divs $r0.2, $b0.2 = $r0.4, $r0.2, $b0.2
	c0	addcg $r0.4, $b0.1 = $r0.7, $r0.7, $b0.1
;;
	c0	addcg $r0.5, $b0.1 = $r0.4, $r0.4, $b0.2
	c0	cmpge $r0.2 = $r0.2, $r0.0
;;
	c0	orc $r0.4 = $r0.5, $r0.0
;;
	c0	sh1add $r0.2 = $r0.4, $r0.2
;;
	c0	sub $r0.4 = $r0.0, $r0.2
;;
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.4
;;
	c0	add $r0.60 = $r0.9, $r0.2
	c0	add $r0.61 = $r0.6, $r0.2
;;
	c0	mov $r0.4 = $r0.61
	c0	mov $r0.5 = $r0.60
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	max $r0.4 = $r0.61, $r0.60
	c0	mov $r0.3 = $r0.59
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	ldw $r0.2 = 0[$r0.58]
;;
	c0	ldw $r0.3 = 0[$r0.63]
;;
	c0	cmplt $r0.4 = $r0.2, $r0.0
	c0	sub $r0.5 = $r0.0, $r0.2
;;
	c0	sub $r0.6 = $r0.0, $r0.3
	c0	mtb $b0.0 = $r0.4
	c0	cmplt $r0.7 = $r0.3, $r0.0
;;
;;
	c0	slct $r0.2 = $b0.0, $r0.5, $r0.2
	c0	mtb $b0.0 = $r0.7
	c0	mtb $b0.1 = $r0.57
;;
;;
	c0	addcg $r0.5, $b0.1 = $r0.2, $r0.2, $b0.1
	c0	slct $r0.2 = $b0.0, $r0.6, $r0.3
	c0	mtb $b0.0 = $r0.57
;;
;;
	c0	addcg $r0.3, $b0.0 = $r0.5, $r0.5, $b0.0
	c0	divs $r0.5, $b0.1 = $r0.0, $r0.2, $b0.1
;;
	c0	divs $r0.5, $b0.0 = $r0.5, $r0.2, $b0.0
	c0	addcg $r0.6, $b0.1 = $r0.3, $r0.3, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.5, $r0.2, $b0.1
	c0	addcg $r0.5, $b0.0 = $r0.6, $r0.6, $b0.0
;;
	c0	divs $r0.3, $b0.0 = $r0.3, $r0.2, $b0.0
	c0	addcg $r0.6, $b0.1 = $r0.5, $r0.5, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.2, $b0.1
	c0	addcg $r0.5, $b0.0 = $r0.6, $r0.6, $b0.0
	c0	ldw $r0.6 = 32[$r0.1]
;;
;;
	c0	ldw $r0.6 = 0[$r0.6]
	c0	divs $r0.3, $b0.0 = $r0.3, $r0.2, $b0.0
	c0	addcg $r0.8, $b0.1 = $r0.5, $r0.5, $b0.1
;;
	c0	ldw $r0.5 = 36[$r0.1]
;;
;;
	c0	ldw $r0.5 = 0[$r0.5]
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.2, $b0.1
	c0	addcg $r0.9, $b0.0 = $r0.8, $r0.8, $b0.0
;;
;;
	c0	add $r0.5 = $r0.6, $r0.5
	c0	divs $r0.3, $b0.0 = $r0.3, $r0.2, $b0.0
	c0	addcg $r0.6, $b0.1 = $r0.9, $r0.9, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.2, $b0.1
	c0	addcg $r0.8, $b0.0 = $r0.6, $r0.6, $b0.0
	c0	ldw $r0.6 = 44[$r0.1]
;;
;;
	c0	ldw $r0.6 = 0[$r0.6]
	c0	divs $r0.3, $b0.0 = $r0.3, $r0.2, $b0.0
	c0	addcg $r0.9, $b0.1 = $r0.8, $r0.8, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.2, $b0.1
	c0	addcg $r0.8, $b0.0 = $r0.9, $r0.9, $b0.0
	c0	ldw $r0.9 = 52[$r0.1]
;;
;;
	c0	ldw $r0.9 = 0[$r0.9]
	c0	add $r0.5 = $r0.5, $r0.6
	c0	divs $r0.3, $b0.0 = $r0.3, $r0.2, $b0.0
	c0	addcg $r0.6, $b0.1 = $r0.8, $r0.8, $b0.1
;;
	c0	ldw $r0.8 = 60[$r0.1]
;;
;;
	c0	ldw $r0.8 = 0[$r0.8]
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.2, $b0.1
	c0	addcg $r0.10, $b0.0 = $r0.6, $r0.6, $b0.0
;;
;;
	c0	mpylu $r0.6 = $r0.9, $r0.8
	c0	mpyhs $r0.8 = $r0.9, $r0.8
	c0	divs $r0.3, $b0.0 = $r0.3, $r0.2, $b0.0
	c0	addcg $r0.9, $b0.1 = $r0.10, $r0.10, $b0.1
;;
	c0	ldw $r0.10 = 48[$r0.1]
;;
;;
	c0	ldw $r0.10 = 0[$r0.10]
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.2, $b0.1
	c0	addcg $r0.11, $b0.2 = $r0.9, $r0.9, $b0.0
	c0	cmpeq $b0.0 = $r0.4, $r0.7
;;
;;
	c0	add $r0.4 = $r0.5, $r0.10
	c0	divs $r0.3, $b0.2 = $r0.3, $r0.2, $b0.2
	c0	addcg $r0.5, $b0.1 = $r0.11, $r0.11, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.2, $b0.1
	c0	addcg $r0.7, $b0.2 = $r0.5, $r0.5, $b0.2
	c0	ldb $r0.5 = 0[$r0.62]
;;
	c0	divs $r0.3, $b0.2 = $r0.3, $r0.2, $b0.2
	c0	addcg $r0.9, $b0.1 = $r0.7, $r0.7, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.2, $b0.1
	c0	addcg $r0.7, $b0.2 = $r0.9, $r0.9, $b0.2
	c0	add $r0.6 = $r0.6, $r0.8
	c0	add $r0.4 = $r0.4, $r0.5
;;
	c0	divs $r0.3, $b0.2 = $r0.3, $r0.2, $b0.2
	c0	addcg $r0.5, $b0.1 = $r0.7, $r0.7, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.2, $b0.1
	c0	addcg $r0.7, $b0.2 = $r0.5, $r0.5, $b0.2
	c0	ldw $r0.5 = 40[$r0.1]
;;
;;
	c0	ldw $r0.5 = 0[$r0.5]
	c0	divs $r0.3, $b0.2 = $r0.3, $r0.2, $b0.2
	c0	addcg $r0.8, $b0.1 = $r0.7, $r0.7, $b0.1
;;
	c0	ldw $r0.7 = 56[$r0.1]
;;
;;
	c0	ldh $r0.7 = 0[$r0.7]
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.2, $b0.1
	c0	addcg $r0.9, $b0.2 = $r0.8, $r0.8, $b0.2
	c0	add $r0.5 = $r0.6, $r0.5
;;
;;
	c0	add $r0.4 = $r0.4, $r0.7
	c0	divs $r0.3, $b0.2 = $r0.3, $r0.2, $b0.2
	c0	addcg $r0.6, $b0.1 = $r0.9, $r0.9, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.2, $b0.1
	c0	addcg $r0.7, $b0.2 = $r0.6, $r0.6, $b0.2
;;
	c0	divs $r0.3, $b0.2 = $r0.3, $r0.2, $b0.2
	c0	addcg $r0.6, $b0.1 = $r0.7, $r0.7, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.2, $b0.1
	c0	addcg $r0.7, $b0.2 = $r0.6, $r0.6, $b0.2
;;
	c0	divs $r0.3, $b0.2 = $r0.3, $r0.2, $b0.2
	c0	addcg $r0.6, $b0.1 = $r0.7, $r0.7, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.2, $b0.1
	c0	addcg $r0.7, $b0.2 = $r0.6, $r0.6, $b0.2
;;
	c0	divs $r0.3, $b0.2 = $r0.3, $r0.2, $b0.2
	c0	addcg $r0.6, $b0.1 = $r0.7, $r0.7, $b0.1
;;
	c0	divs $r0.3, $b0.1 = $r0.3, $r0.2, $b0.1
	c0	addcg $r0.7, $b0.2 = $r0.6, $r0.6, $b0.2
;;
	c0	divs $r0.2, $b0.2 = $r0.3, $r0.2, $b0.2
	c0	addcg $r0.3, $b0.1 = $r0.7, $r0.7, $b0.1
;;
	c0	addcg $r0.6, $b0.1 = $r0.3, $r0.3, $b0.2
	c0	cmpge $r0.2 = $r0.2, $r0.0
;;
	c0	orc $r0.3 = $r0.6, $r0.0
;;
	c0	sh1add $r0.2 = $r0.3, $r0.2
;;
	c0	sub $r0.3 = $r0.0, $r0.2
;;
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.3
;;
	c0	add $r0.60 = $r0.4, $r0.2
	c0	add $r0.61 = $r0.5, $r0.2
	c0	ldw $r0.3 = 28[$r0.1]
;;
	c0	mov $r0.4 = $r0.61
	c0	mov $r0.5 = $r0.60
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	max $r0.4 = $r0.61, $r0.60
	c0	mov $r0.3 = $r0.59
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	mov $r0.3 = $r0.57
	c0	ldw $l0.0 = 64[$r0.1]
;;
	c0	ldw $r0.63 = 68[$r0.1]
;;
	c0	ldw $r0.62 = 72[$r0.1]
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

	.align	4                       ## @a
a:
	.data4	100                     ## 0x64

	.align	4                       ## @b
b:
	.data4	2                       ## 0x2

	.align	4                       ## @c
c:
	.data4	101                     ## 0x65

	.align	4                       ## @d
d:
	.data4	106                     ## 0x6a

	.align	4                       ## @e
e:
	.data4	110                     ## 0x6e

	.align	4                       ## @f
f:
	.data4	116                     ## 0x74

	.align	4                       ## @g
g:
	.data4	111                     ## 0x6f

	.align	4                       ## @h
h:
	.data4	121                     ## 0x79

	.align	4                       ## @i
i:
	.data4	131                     ## 0x83

j:                                      ## @j
	.data1	141                     ## 0x8d

	.align	2                       ## @k
k:
	.data2	65526                   ## 0xfff6

	.section	.data
.str:                                   ## @.str
	.data1 37
	.data1 100
	.data1 32
	.data1 32
	.data1 37
	.data1 100
	.data1 32
	.data1 32
	.data1 32
	.data1 61
	.data1 62
	.data1 32
	.data1 32
	.data1 32
	.data1 0
.skip 1

.str1:                                  ## @.str1
	.data1 37
	.data1 100
	.data1 10
	.data1 0
.skip 4


.import printf
.type printf, @function
.import puts
.type puts, @function
