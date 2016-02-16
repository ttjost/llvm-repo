.section .text
.section .text 
.proc 
.entry caller, sp=$r0.1, rl=$l0.0, asize=-64, arg() ## @main
main::
## BB#0:                                ## %entry
	c0	add $r0.1 = $r0.1, -64
;;
	c0	stw 60[$r0.1] = $l0.0
;;                                      ## 4-byte Folded Spill
	c0	stw 56[$r0.1] = $r0.57
;;                                      ## 4-byte Folded Spill
	c0	stw 52[$r0.1] = $r0.58
	c0	mov $r0.57 = 0
	c0	mov $r0.11 = b
	c0	mov $r0.12 = _ZZ4mainE5date1
;;
	c0	mov $r0.13 = 16
	c0	stw 48[$r0.1] = $r0.57
	c0	mov $r0.58 = .str
;;
	c0	ldb $r0.14 = 1[$r0.11]
;;
	c0	stb 44[$r0.1] = $r0.14
;;
	c0	ldb $r0.14 = 1[$r0.11]
;;
	c0	stb 40[$r0.1] = $r0.14
;;
	c0	ldhu $r0.14 = 0[$r0.12]
;;
	c0	shl $r0.14 = $r0.14, $r0.13
	c0	ldhu $r0.15 = 4[$r0.12]
;;
	c0	shl $r0.13 = $r0.15, $r0.13
;;
	c0	ldhu $r0.15 = 2[$r0.12]
;;
	c0	or $r0.14 = $r0.14, $r0.15
	c0	ldhu $r0.12 = 6[$r0.12]
;;
	c0	or $r0.12 = $r0.13, $r0.12
	c0	stw 32[$r0.1] = $r0.14
;;
	c0	stw 36[$r0.1] = $r0.12
;;
	c0	ldb $r0.12 = 34[$r0.1]
;;
	c0	stb 28[$r0.1] = $r0.12
;;
	c0	ldb $r0.12 = 38[$r0.1]
;;
	c0	stb 24[$r0.1] = $r0.12
;;
	c0	ldbu $r0.5 = 2[$r0.11]
;;
	c0	ldbu $r0.4 = 0[$r0.11]
;;
	c0	mov $r0.3 = $r0.58
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	ldb $r0.5 = 24[$r0.1]
;;
	c0	ldb $r0.4 = 28[$r0.1]
;;
	c0	mov $r0.3 = $r0.58
;;
.call printf, caller, arg($r0.3:u32, $r0.4:u32, $r0.5:u32, $r0.6:u32, $r0.7:u32, $r0.8:u32, $r0.9:u32, $r0.10:u32), ret()
	c0	call $l0.0 = printf
;;
	c0	mov $r0.3 = $r0.57
;;
	c0	ldw $r0.58 = 52[$r0.1]
;;                                      ## 4-byte Folded Reload
	c0	ldw $r0.57 = 56[$r0.1]
;;                                      ## 4-byte Folded Reload
	c0	ldw $l0.0 = 60[$r0.1]
;;                                      ## 4-byte Folded Reload
.return ret($r0.3:s32)
	c0	return $r0.1 = $r0.1, 64, $l0.0
;;
.endp

.section .data
b::                                     ## @b
	.data1 97
	.data1 98
	.data1 99
	.data1 0

	.section	.data
	.align	1                       ## @_ZZ4mainE5date1
_ZZ4mainE5date1::
	.data2	2012                    ## 0x7dc
	.data1	96                      ## 0x60
	.data1	25                      ## 0x19
	.data1	9                       ## 0x9
	.data1	40                      ## 0x28
	.data1	125                     ## 0x7d
	.skip	1

	.section	.data
.str::                                  ## @.str
	.data1 37
	.data1 99
	.data1 32
	.data1 37
	.data1 99
	.data1 10
	.data1 0

.import printf
.type printf, @function
