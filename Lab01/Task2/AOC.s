	.build_version macos, 26, 0	sdk_version 26, 4
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #48
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, #0                          ; =0x0
	str	w8, [sp, #16]                   ; 4-byte Folded Spill
	stur	wzr, [x29, #-4]
	adrp	x0, l_.str@PAGE
	add	x0, x0, l_.str@PAGEOFF
	bl	_printf
	mov	x9, sp
	sub	x8, x29, #8
	str	x8, [x9]
	adrp	x0, l_.str.1@PAGE
	add	x0, x0, l_.str.1@PAGEOFF
	bl	_scanf
	ldur	s0, [x29, #-8]
	fcvt	d1, s0
	mov	x8, #34414                      ; =0x866e
	movk	x8, #61467, lsl #16
	movk	x8, #8697, lsl #32
	movk	x8, #16409, lsl #48
	fmov	d0, x8
	fmul	d0, d0, d1
	ldur	s1, [x29, #-8]
	fcvt	d1, s1
	fmul	d0, d0, d1
	fcvt	s0, d0
	stur	s0, [x29, #-12]
	ldur	s0, [x29, #-12]
	fcvt	d0, s0
	mov	x8, sp
	str	d0, [x8]
	adrp	x0, l_.str.2@PAGE
	add	x0, x0, l_.str.2@PAGEOFF
	bl	_printf
	ldr	w0, [sp, #16]                   ; 4-byte Folded Reload
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	add	sp, sp, #48
	ret
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"Enter the radius of the circle: "

l_.str.1:                               ; @.str.1
	.asciz	"%f"

l_.str.2:                               ; @.str.2
	.asciz	"Area of the circle is %f\n "

.subsections_via_symbols
