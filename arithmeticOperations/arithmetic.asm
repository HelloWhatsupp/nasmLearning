%include "stud_io.inc"
global	_start

section .text
_start:	mov	eax, 4294967295
	mov	ebx, 4294967295
	mov	ecx, 4294967295
	mov	edx, 4294967295
	add	eax, ecx
	adc	ebx, edx
	PRINT	'Hi'	
	PUTCHAR	10
	FINISH
