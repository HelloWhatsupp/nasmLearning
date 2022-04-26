%include "stud_io.inc"
global _start

section	.bss
array	resb	255

section .text
_start:	mov	cl, 255
	mov	ch, 255
	mov	edi, array
	mov	ebx, array
	mov	al, '&'
repeat:	mov	[edi], al
	inc	edi
	dec	cl
	jnz	repeat
	PUTCHAR	[ebx]
	inc	ebx
	dec	ch
	FINISH
	
