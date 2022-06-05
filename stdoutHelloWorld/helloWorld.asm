global _start


section	.data
outStr	db	'Hello, World!', 10
strLen	equ	$-outStr

section .text

_start:
	mov	eax, 4				; call system write
	mov	ebx, 1				; use standart output
	mov	ecx, outStr			; address of string
	mov	edx, strLen			; len of string
	int	80h				; program interrupt

	mov	eax, 1				; call system _exit
	mov	ebx, 0				; code of succesfull work
	int	80h
