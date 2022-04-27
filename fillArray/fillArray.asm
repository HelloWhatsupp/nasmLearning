%include "stud_io.inc"
global _start

section	.bss
array	resb	255

section .text
_start:	mov	cl, 255
	mov	ch, 255
	mov	edi, array
	mov	ebx, array
repeat:	mov	[edi], byte '&' 
	inc	edi
	dec	cl
	jnz	repeat
	jmp	print
print:	PUTCHAR	[ebx]
	inc	ebx
	dec	ch
	jnz print
	PUTCHAR 10
	FINISH
	
