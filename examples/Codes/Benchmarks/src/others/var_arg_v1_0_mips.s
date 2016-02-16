.section .text

	.abicalls
	.section	.mdebug.abi32,"",@progbits
	.nan	legacy
	.file	"var_arg_v1_0.ll"
.section .text

	.globl	FindMax
	.align	2
	.type	FindMax,@function
	.set	nomicromips
	.set	nomips16
	.ent	FindMax
FindMax:                                # @FindMax
	.frame	$fp,24,$ra
	.mask 	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# BB#0:                                 # %entry
	addiu	$sp, $sp, -24
	sw	$fp, 20($sp)            # 4-byte Folded Spill
	move	 $fp, $sp
	sw	$7, 36($fp)
	sw	$6, 32($fp)
	sw	$5, 28($fp)
	sw	$4, 16($fp)
	addiu	$1, $fp, 28
	sw	$1, 0($fp)
	addiu	$1, $1, 4
	sw	$1, 0($fp)
	lw	$1, 28($fp)
	sw	$1, 4($fp)
	addiu	$1, $zero, 1
	b	$BB0_2
	sw	$1, 12($fp)
$BB0_1:                                 # %cond.end
                                        #   in Loop: Header=BB0_2 Depth=1
	sw	$2, 4($fp)
	lw	$1, 12($fp)
	addiu	$1, $1, 1
	sw	$1, 12($fp)
$BB0_2:                                 # %for.cond
                                        # =>This Inner Loop Header: Depth=1
	lw	$1, 16($fp)
	lw	$2, 12($fp)
	slt	$1, $2, $1
	beqz	$1, $BB0_6
	nop
# BB#3:                                 # %for.body
                                        #   in Loop: Header=BB0_2 Depth=1
	lw	$1, 0($fp)
	addiu	$2, $1, 4
	sw	$2, 0($fp)
	lw	$1, 0($1)
	sw	$1, 8($fp)
	lw	$2, 4($fp)
	slt	$1, $1, $2
	beqz	$1, $BB0_5
	nop
# BB#4:                                 # %cond.true
                                        #   in Loop: Header=BB0_2 Depth=1
	b	$BB0_1
	lw	$2, 4($fp)
$BB0_5:                                 # %cond.false
                                        #   in Loop: Header=BB0_2 Depth=1
	b	$BB0_1
	lw	$2, 8($fp)
$BB0_6:                                 # %for.end
	lw	$2, 4($fp)
	move	 $sp, $fp
	lw	$fp, 20($sp)            # 4-byte Folded Reload
	jr	$ra
	addiu	$sp, $sp, 24
	.set	at
	.set	macro
	.set	reorder
	.end	FindMax
$func_end0:
	.size	FindMax, ($func_end0)-FindMax

	.globl	main
	.align	2
	.type	main,@function
	.set	nomicromips
	.set	nomips16
	.ent	main
main:                                   # @main
	.frame	$fp,48,$ra
	.mask 	0xc0010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	.set	noat
# BB#0:                                 # %entry
	lui	$2, %hi(_gp_disp)
	addiu	$2, $2, %lo(_gp_disp)
	addiu	$sp, $sp, -48
	sw	$ra, 44($sp)            # 4-byte Folded Spill
	sw	$fp, 40($sp)            # 4-byte Folded Spill
	sw	$16, 36($sp)            # 4-byte Folded Spill
	move	 $fp, $sp
	addu	$16, $2, $25
	sw	$zero, 32($fp)
	addiu	$1, $zero, 834
	sw	$1, 16($sp)
	lw	$25, %call16(FindMax)($16)
	addiu	$4, $zero, 4
	addiu	$5, $zero, 702
	addiu	$6, $zero, 422
	addiu	$7, $zero, 631
	jalr	$25
	move	 $gp, $16
	sw	$2, 28($fp)
	lw	$1, %got($.str)($16)
	addiu	$4, $1, %lo($.str)
	lw	$25, %call16(printf)($16)
	move	 $5, $2
	jalr	$25
	move	 $gp, $16
	addiu	$2, $zero, 0
	move	 $sp, $fp
	lw	$16, 36($sp)            # 4-byte Folded Reload
	lw	$fp, 40($sp)            # 4-byte Folded Reload
	lw	$ra, 44($sp)            # 4-byte Folded Reload
	jr	$ra
	addiu	$sp, $sp, 48
	.set	at
	.set	macro
	.set	reorder
	.end	main
$func_end1:
	.size	main, ($func_end1)-main

	.type	$.str,@object           # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
$.str:
	.asciz	"The largest value is: %d\n"
	.size	$.str, 26


	.ident	"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"
	.section	".note.GNU-stack","",@progbits
.section .text

