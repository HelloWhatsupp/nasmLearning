global _start

section .bss
InStr	resb	14
strLen	equ	$-InStr

section .text

_start:
	mov	eax, 3
	mov	ebx, 0
	mov	ecx, InStr
	mov	edx, strLen
	int	80h
	
	mov	eax, 4
	mov	ebx, 1
	mov	ecx, InStr
	mov	edx, strLen
	int	80h
	
	mov	eax, 1
	mov	ebx, 0
	int	80h
