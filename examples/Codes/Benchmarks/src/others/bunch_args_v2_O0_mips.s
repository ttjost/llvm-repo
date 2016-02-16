.section .text

	.abicalls
	.section	.mdebug.abi32,"",@progbits
	.nan	legacy
	.file	"bunch_args_v2_O0.ll"
.section .text

	.globl	func
	.align	2
	.type	func,@function
	.set	nomicromips
	.set	nomips16
	.ent	func
func:                                   # @func
	.frame	$fp,64,$ra
	.mask 	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# BB#0:                                 # %entry
	addiu	$sp, $sp, -64
	sw	$fp, 60($sp)            # 4-byte Folded Spill
	move	 $fp, $sp
	lw	$1, 104($fp)
	lw	$2, 100($fp)
	lw	$3, 96($fp)
	lw	$8, 92($fp)
	lw	$9, 88($fp)
	lw	$10, 84($fp)
	lw	$11, 80($fp)
	sw	$4, 52($fp)
	sw	$5, 48($fp)
	sw	$6, 44($fp)
	sw	$7, 40($fp)
	sw	$11, 36($fp)
	sw	$10, 32($fp)
	sw	$9, 28($fp)
	sw	$8, 24($fp)
	sw	$3, 20($fp)
	sb	$2, 16($fp)
	sh	$1, 12($fp)
	lw	$1, 48($fp)
	lw	$2, 52($fp)
	div	$zero, $2, $1
	teq	$1, $zero, 7
	mflo	$1
	lw	$2, 40($fp)
	lw	$3, 44($fp)
	mul	$2, $3, $2
	addu	$1, $1, $2
	lw	$2, 36($fp)
	addu	$1, $1, $2
	sw	$1, 8($fp)
	lw	$1, 48($fp)
	lw	$2, 52($fp)
	div	$zero, $2, $1
	teq	$1, $zero, 7
	mflo	$1
	lw	$2, 32($fp)
	addu	$1, $1, $2
	lw	$2, 28($fp)
	addu	$1, $1, $2
	lw	$2, 24($fp)
	addu	$1, $1, $2
	lw	$2, 20($fp)
	addu	$1, $1, $2
	lh	$2, 12($fp)
	lb	$3, 16($fp)
	addu	$1, $1, $3
	addu	$1, $1, $2
	sw	$1, 4($fp)
	lw	$2, 8($fp)
	slt	$1, $1, $2
	beqz	$1, $BB0_2
	nop
# BB#1:                                 # %if.then
	lw	$1, 8($fp)
	b	$BB0_3
	sw	$1, 56($fp)
$BB0_2:                                 # %if.end
	lw	$1, 4($fp)
	sw	$1, 56($fp)
$BB0_3:                                 # %return
	lw	$2, 56($fp)
	move	 $sp, $fp
	lw	$fp, 60($sp)            # 4-byte Folded Reload
	jr	$ra
	addiu	$sp, $sp, 64
	.set	at
	.set	macro
	.set	reorder
	.end	func
$func_end0:
	.size	func, ($func_end0)-func

	.globl	main
	.align	2
	.type	main,@function
	.set	nomicromips
	.set	nomips16
	.ent	main
main:                                   # @main
	.frame	$fp,112,$ra
	.mask 	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# BB#0:                                 # %entry
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -112
	sw	$ra, 108($sp)           # 4-byte Folded Spill
	sw	$fp, 104($sp)           # 4-byte Folded Spill
	sw	$23, 100($sp)           # 4-byte Folded Spill
	sw	$22, 96($sp)            # 4-byte Folded Spill
	sw	$21, 92($sp)            # 4-byte Folded Spill
	sw	$20, 88($sp)            # 4-byte Folded Spill
	sw	$19, 84($sp)            # 4-byte Folded Spill
	sw	$18, 80($sp)            # 4-byte Folded Spill
	sw	$17, 76($sp)            # 4-byte Folded Spill
	sw	$16, 72($sp)            # 4-byte Folded Spill
	move	 $fp, $sp
	addu	$16, $2, $25
	lw	$9, %got(h)($16)
	sw	$9, 64($fp)             # 4-byte Folded Spill
	lw	$8, %got(g)($16)
	sw	$8, 60($fp)             # 4-byte Folded Spill
	lw	$3, %got(f)($16)
	sw	$3, 56($fp)             # 4-byte Folded Spill
	lw	$2, %got(e)($16)
	sw	$2, 52($fp)             # 4-byte Folded Spill
	lw	$22, %got(a)($16)
	lw	$1, %got(b)($16)
	sw	$1, 68($fp)             # 4-byte Folded Spill
	lw	$18, %got(c)($16)
	lw	$19, %got(d)($16)
	lw	$7, 0($19)
	lw	$6, 0($18)
	lw	$5, 0($1)
	lw	$4, 0($22)
	lw	$1, 0($2)
	lw	$2, 0($3)
	lw	$3, 0($8)
	lw	$8, 0($9)
	lw	$20, %got(i)($16)
	lw	$9, 0($20)
	lw	$21, %got(j)($16)
	lb	$10, 0($21)
	lw	$23, %got(k)($16)
	lh	$11, 0($23)
	sw	$11, 40($sp)
	sw	$10, 36($sp)
	sw	$9, 32($sp)
	sw	$8, 28($sp)
	sw	$3, 24($sp)
	sw	$2, 20($sp)
	sw	$1, 16($sp)
	lw	$25, %call16(func)($16)
	jalr	$25
	move	 $gp, $16
	lw	$1, %got($.str)($16)
	addiu	$17, $1, %lo($.str)
	lw	$25, %call16(printf)($16)
	move	 $4, $17
	move	 $5, $2
	jalr	$25
	move	 $gp, $16
	lw	$7, 0($19)
	lw	$6, 0($22)
	lw	$5, 0($18)
	lw	$1, 68($fp)             # 4-byte Folded Reload
	lw	$4, 0($1)
	lw	$1, 52($fp)             # 4-byte Folded Reload
	lw	$1, 0($1)
	lw	$2, 56($fp)             # 4-byte Folded Reload
	lw	$2, 0($2)
	lw	$3, 60($fp)             # 4-byte Folded Reload
	lw	$3, 0($3)
	lw	$8, 64($fp)             # 4-byte Folded Reload
	lw	$8, 0($8)
	lw	$9, 0($20)
	lb	$10, 0($21)
	lh	$11, 0($23)
	sw	$11, 40($sp)
	sw	$10, 36($sp)
	sw	$9, 32($sp)
	sw	$8, 28($sp)
	sw	$3, 24($sp)
	sw	$2, 20($sp)
	sw	$1, 16($sp)
	lw	$25, %call16(func)($16)
	jalr	$25
	nop
	lw	$25, %call16(printf)($16)
	move	 $4, $17
	jalr	$25
	move	 $5, $2
	addiu	$2, $zero, 0
	move	 $sp, $fp
	lw	$16, 72($sp)            # 4-byte Folded Reload
	lw	$17, 76($sp)            # 4-byte Folded Reload
	lw	$18, 80($sp)            # 4-byte Folded Reload
	lw	$19, 84($sp)            # 4-byte Folded Reload
	lw	$20, 88($sp)            # 4-byte Folded Reload
	lw	$21, 92($sp)            # 4-byte Folded Reload
	lw	$22, 96($sp)            # 4-byte Folded Reload
	lw	$23, 100($sp)           # 4-byte Folded Reload
	lw	$fp, 104($sp)           # 4-byte Folded Reload
	lw	$ra, 108($sp)           # 4-byte Folded Reload
	jr	$ra
	addiu	$sp, $sp, 112
	.set	at
	.set	macro
	.set	reorder
	.end	main
$func_end1:
	.size	main, ($func_end1)-main

	.type	a,@object               # @a
.section .data

	.globl	a
	.align	2
a:
	.4byte	100                     # 0x64
	.size	a, 4

	.type	b,@object               # @b
	.globl	b
	.align	2
b:
	.4byte	2                       # 0x2
	.size	b, 4

	.type	c,@object               # @c
	.globl	c
	.align	2
c:
	.4byte	10                      # 0xa
	.size	c, 4

	.type	d,@object               # @d
	.globl	d
	.align	2
d:
	.4byte	10                      # 0xa
	.size	d, 4

	.type	e,@object               # @e
	.globl	e
	.align	2
e:
	.4byte	10                      # 0xa
	.size	e, 4

	.type	f,@object               # @f
	.globl	f
	.align	2
f:
	.4byte	10                      # 0xa
	.size	f, 4

	.type	g,@object               # @g
	.globl	g
	.align	2
g:
	.4byte	10                      # 0xa
	.size	g, 4

	.type	h,@object               # @h
	.globl	h
	.align	2
h:
	.4byte	10                      # 0xa
	.size	h, 4

	.type	i,@object               # @i
	.globl	i
	.align	2
i:
	.4byte	10                      # 0xa
	.size	i, 4

	.type	j,@object               # @j
	.globl	j
j:
	.byte	10                      # 0xa
	.size	j, 1

	.type	k,@object               # @k
	.globl	k
	.align	1
k:
	.2byte	65526                   # 0xfff6
	.size	k, 2

	.type	$.str,@object           # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
$.str:
	.asciz	"%d\n"
	.size	$.str, 4


	.ident	"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"
	.section	".note.GNU-stack","",@progbits
.section .text

