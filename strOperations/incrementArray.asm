global _start

section .data
array	resd	256

section .text
_start:	mov	esi, array
	mov	edi, esi
	mov	ax, 256
	cld

lp:	lodsd	; take el from array and put into eax
	inc	eax
	stosd	; put eax value into array
	loop	lp
