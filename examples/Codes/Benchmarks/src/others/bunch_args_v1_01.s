.section .text

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-0, arg() ## @func
func::
## BB#0:                                ## %entry
	c0	cmplt $r0.2 = $r0.3, $r0.0
	c0	cmplt $r0.11 = $r0.4, $r0.0
	c0	sub $r0.12 = $r0.0, $r0.3
	c0	sub $r0.13 = $r0.0, $r0.4
;;
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
	c0	ldw $r0.9 = 32[$r0.1]
;;
	c0	divs $r0.2, $b0.2 = $r0.2, $r0.4, $b0.2
	c0	addcg $r0.11, $b0.1 = $r0.3, $r0.3, $b0.1
;;
	c0	divs $r0.2, $b0.1 = $r0.2, $r0.4, $b0.1
	c0	addcg $r0.3, $b0.2 = $r0.11, $r0.11, $b0.2
;;
	c0	divs $r0.2, $b0.2 = $r0.2, $r0.4, $b0.2
	c0	addcg $r0.11, $b0.1 = $r0.3, $r0.3, $b0.1
	c0	mpylu $r0.3 = $r0.6, $r0.5
	c0	mpyhs $r0.5 = $r0.6, $r0.5
;;
	c0	divs $r0.2, $b0.1 = $r0.2, $r0.4, $b0.1
	c0	addcg $r0.6, $b0.2 = $r0.11, $r0.11, $b0.2
;;
	c0	divs $r0.2, $b0.2 = $r0.2, $r0.4, $b0.2
	c0	addcg $r0.11, $b0.1 = $r0.6, $r0.6, $b0.1
	c0	add $r0.6 = $r0.8, $r0.10
	c0	ldw $r0.8 = 36[$r0.1]
;;
	c0	divs $r0.2, $b0.1 = $r0.2, $r0.4, $b0.1
	c0	addcg $r0.10, $b0.2 = $r0.11, $r0.11, $b0.2
	c0	add $r0.6 = $r0.6, $r0.9
	c0	add $r0.3 = $r0.3, $r0.5
;;
	c0	divs $r0.2, $b0.2 = $r0.2, $r0.4, $b0.2
	c0	addcg $r0.5, $b0.1 = $r0.10, $r0.10, $b0.1
	c0	add $r0.6 = $r0.6, $r0.8
	c0	ldw $r0.8 = 40[$r0.1]
;;
	c0	divs $r0.2, $b0.1 = $r0.2, $r0.4, $b0.1
	c0	addcg $r0.9, $b0.2 = $r0.5, $r0.5, $b0.2
;;
	c0	add $r0.5 = $r0.6, $r0.8
	c0	divs $r0.2, $b0.2 = $r0.2, $r0.4, $b0.2
	c0	addcg $r0.6, $b0.1 = $r0.9, $r0.9, $b0.1
;;
	c0	divs $r0.2, $b0.1 = $r0.2, $r0.4, $b0.1
	c0	addcg $r0.4, $b0.2 = $r0.6, $r0.6, $b0.2
;;
	c0	addcg $r0.6, $b0.1 = $r0.4, $r0.4, $b0.1
	c0	cmpge $r0.2 = $r0.2, $r0.0
;;
	c0	orc $r0.4 = $r0.6, $r0.0
	c0	add $r0.3 = $r0.3, $r0.7
;;
	c0	sh1add $r0.2 = $r0.4, $r0.2
;;
	c0	sub $r0.4 = $r0.0, $r0.2
;;
	c0	slct $r0.2 = $b0.0, $r0.2, $r0.4
;;
	c0	add $r0.4 = $r0.5, $r0.2
	c0	add $r0.2 = $r0.3, $r0.2
;;
.return ret($r0.3:s32)
	c0	max $r0.3 = $r0.2, $r0.4
	c0	return $r0.1 = $r0.1, 0, $l0.0
;;
.endp

.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-96, arg() ## @main
main::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -96
;;
	c0	stw 76[$r0.1] = $r0.57
;;
	c0	stw 72[$r0.1] = $r0.58
;;
	c0	stw 68[$r0.1] = $r0.59
;;
	c0	stw 64[$r0.1] = $r0.60
;;
	c0	stw 60[$r0.1] = $r0.61
;;
	c0	stw 56[$r0.1] = $r0.62
;;
	c0	stw 52[$r0.1] = $r0.63
;;
	c0	stw 48[$r0.1] = $l0.0
	c0	mov $r0.2 = g
;;
	c0	stw 44[$r0.1] = $r0.2
	c0	mov $r0.59 = h
;;
	c0	mov $r0.3 = f
;;
	c0	stw 28[$r0.1] = $r0.3
	c0	mov $r0.4 = e
;;
	c0	stw 40[$r0.1] = $r0.4
;;
	c0	ldw $r0.9 = 0[$r0.2]
	c0	mov $r0.62 = d
;;
	c0	mov $r0.63 = c
	c0	mov $r0.2 = b
;;
	c0	stw 36[$r0.1] = $r0.2
;;
	c0	ldw $r0.7 = 0[$r0.4]
	c0	mov $r0.58 = a
;;
	c0	mov $r0.12 = k
;;
	c0	stw 32[$r0.1] = $r0.12
	c0	mov $r0.57 = j
;;
	c0	ldw $r0.4 = 0[$r0.2]
	c0	mov $r0.60 = i
;;
	c0	mov $r0.61 = .str
	c0	ldw $r0.10 = 0[$r0.59]
;;
	c0	ldw $r0.8 = 0[$r0.3]
;;
	c0	ldw $r0.3 = 0[$r0.58]
;;
	c0	ldw $r0.5 = 0[$r0.63]
;;
	c0	ldw $r0.6 = 0[$r0.62]
;;
	c0	ldw $r0.2 = 0[$r0.57]
;;
	c0	ldw $r0.11 = 0[$r0.60]
;;
	c0	ldw $r0.12 = 0[$r0.12]
;;
;;
	c0	stw 24[$r0.1] = $r0.12
;;
	c0	stw 20[$r0.1] = $r0.2
;;
.call func, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	stw 16[$r0.1] = $r0.11
	c0	call $l0.0 = func
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.61
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	mov $r0.4 = $r0.2
	c0	call $l0.0 = printf
;;
	c0	ldw $r0.10 = 0[$r0.59]
;;
	c0	ldw $r0.2 = 44[$r0.1]
;;
;;
	c0	ldw $r0.9 = 0[$r0.2]
;;
	c0	ldw $r0.2 = 28[$r0.1]
;;
;;
	c0	ldw $r0.8 = 0[$r0.2]
;;
	c0	ldw $r0.2 = 40[$r0.1]
;;
;;
	c0	ldw $r0.7 = 0[$r0.2]
;;
	c0	ldw $r0.6 = 0[$r0.62]
;;
	c0	ldw $r0.5 = 0[$r0.58]
;;
	c0	ldw $r0.4 = 0[$r0.63]
;;
	c0	ldw $r0.2 = 36[$r0.1]
;;
;;
	c0	ldw $r0.3 = 0[$r0.2]
;;
	c0	ldw $r0.2 = 0[$r0.57]
;;
	c0	ldw $r0.11 = 0[$r0.60]
;;
	c0	ldw $r0.12 = 32[$r0.1]
;;
;;
	c0	ldw $r0.12 = 0[$r0.12]
;;
;;
	c0	stw 24[$r0.1] = $r0.12
;;
	c0	stw 20[$r0.1] = $r0.2
;;
.call func, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	stw 16[$r0.1] = $r0.11
	c0	call $l0.0 = func
;;
	c0	mov $r0.2 = $r0.3
	c0	mov $r0.3 = $r0.61
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	mov $r0.4 = $r0.2
	c0	call $l0.0 = printf
;;
	c0	mov $r0.3 = 0
	c0	ldw $l0.0 = 48[$r0.1]
;;
	c0	ldw $r0.63 = 52[$r0.1]
;;
	c0	ldw $r0.62 = 56[$r0.1]
;;
	c0	ldw $r0.61 = 60[$r0.1]
;;
	c0	ldw $r0.60 = 64[$r0.1]
;;
	c0	ldw $r0.59 = 68[$r0.1]
;;
	c0	ldw $r0.58 = 72[$r0.1]
;;
.return ret($r0.3:s32)
	c0	ldw $r0.57 = 76[$r0.1]
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
	.data4	10                      ## 0xa

	.align	4                       ## @d
d:
	.data4	10                      ## 0xa

	.align	4                       ## @e
e:
	.data4	10                      ## 0xa

	.align	4                       ## @f
f:
	.data4	10                      ## 0xa

	.align	4                       ## @g
g:
	.data4	10                      ## 0xa

	.align	4                       ## @h
h:
	.data4	10                      ## 0xa

	.align	4                       ## @i
i:
	.data4	10                      ## 0xa

	.align	4                       ## @j
j:
	.data4	10                      ## 0xa

	.align	4                       ## @k
k:
	.data4	10                      ## 0xa

	.section	.data
.str:                                   ## @.str
	.data1 37
	.data1 100
	.data1 10
	.data1 0
.skip 4

.import printf
.import puts
