.section .text

	.file	"var_arg_v1_0.ll"
	.globl	FindMax
	.align	4
	.type	FindMax,@function
FindMax:                                ! @FindMax
! BB#0:                                 ! %entry
	save %sp, -120, %sp
	st %i5, [%fp+88]
	st %i4, [%fp+84]
	st %i3, [%fp+80]
	st %i2, [%fp+76]
	st %i1, [%fp+72]
	st %i0, [%fp+-4]
	add %fp, 72, %i0
	st %i0, [%fp+-20]
	add %fp, 76, %i0
	st %i0, [%fp+-20]
	ld [%fp+72], %i0
	st %i0, [%fp+-16]
	ba .LBB0_1
	mov	 1, %i0
.LBB0_5:                                ! %cond.end
                                        !   in Loop: Header=BB0_1 Depth=1
	st %i0, [%fp+-16]
	ld [%fp+-8], %i0
	add %i0, 1, %i0
.LBB0_1:                                ! %for.cond
                                        ! =>This Inner Loop Header: Depth=1
	st %i0, [%fp+-8]
	ld [%fp+-4], %i0
	ld [%fp+-8], %i1
	cmp %i1, %i0
	bge	 .LBB0_6
	nop
! BB#2:                                 ! %for.body
                                        !   in Loop: Header=BB0_1 Depth=1
	ld [%fp+-20], %i0
	add %i0, 4, %i1
	st %i1, [%fp+-20]
	ld [%i0], %i0
	st %i0, [%fp+-12]
	ld [%fp+-16], %i1
	cmp %i1, %i0
	ble	 .LBB0_4
	nop
! BB#3:                                 ! %cond.true
                                        !   in Loop: Header=BB0_1 Depth=1
	ba .LBB0_5
	ld [%fp+-16], %i0
.LBB0_4:                                ! %cond.false
                                        !   in Loop: Header=BB0_1 Depth=1
	ba .LBB0_5
	ld [%fp+-12], %i0
.LBB0_6:                                ! %for.end
	ld [%fp+-16], %i0
	ret
	restore
.Lfunc_end0:
	.size	FindMax, .Lfunc_end0-FindMax

	.globl	main
	.align	4
	.type	main,@function
main:                                   ! @main
! BB#0:                                 ! %entry
	save %sp, -104, %sp
	st %g0, [%fp+-4]
	mov	 4, %o0
	mov	 702, %o1
	mov	 422, %o2
	mov	 631, %o3
	call FindMax
	mov	 834, %o4
	mov	 %o0, %i0
	st %i0, [%fp+-8]
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
