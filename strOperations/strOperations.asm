%include "stud_io.inc"
global _start

section .data
buf	resb 1024
section .text
_start:	xor	al, al
	mov	edi, buf
	mov	ecx, 1024
	cld
lp:	stosb
	loop lp
