.section .text

	.file	"var_arg_v1_1.ll"
	.globl	FindMax
	.align	4
	.type	FindMax,@function
FindMax:                                ! @FindMax
! BB#0:                                 ! %entry
	save %sp, -104, %sp
	mov	 %i0, %g2
	st %i5, [%fp+88]
	st %i4, [%fp+84]
	st %i3, [%fp+80]
	st %i2, [%fp+76]
	st %i1, [%fp+72]
	add %fp, 72, %i0
	st %i0, [%fp+-4]
	add %fp, 76, %i0
	st %i0, [%fp+-4]
	cmp %g2, 2
	bl	 .LBB0_5
	ld [%fp+72], %i0
! BB#1:                                 ! %for.body.preheader
	add %g2, -1, %i1
.LBB0_2:                                ! %for.body
                                        ! =>This Inner Loop Header: Depth=1
	ld [%fp+-4], %i2
	add %i2, 4, %i3
	st %i3, [%fp+-4]
	ld [%i2], %i2
	cmp %i0, %i2
	bg	 .LBB0_4
	nop
! BB#3:                                 ! %for.body
                                        !   in Loop: Header=BB0_2 Depth=1
	mov	 %i2, %i0
.LBB0_4:                                ! %for.body
                                        !   in Loop: Header=BB0_2 Depth=1
	add %i1, -1, %i1
	cmp %i1, 0
	bne	 .LBB0_2
	nop
.LBB0_5:                                ! %for.end
	ret
	restore
.Lfunc_end0:
	.size	FindMax, .Lfunc_end0-FindMax

	.globl	main
	.align	4
	.type	main,@function
main:                                   ! @main
! BB#0:                                 ! %entry
	save %sp, -96, %sp
	mov	 4, %o0
	mov	 702, %o1
	mov	 422, %o2
	mov	 631, %o3
	call FindMax
	mov	 834, %o4
	mov	 %o0, %i0
	sethi %hi(.L.str), %i1
	add %i1, %lo(.L.str), %o0
	call printf
	mov	 %i0, %o1
	ret
	restore %g0, 0, %o0
.Lfunc_end1:
	.size	main, .Lfunc_end1-main

	.type	.L.str,@object          ! @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"The largest value is: %d\n"
	.size	.L.str, 26


	.ident	"clang version 3.7.0 (trunk 251312) (llvm/trunk 234885)"
	.section	".note.GNU-stack"
