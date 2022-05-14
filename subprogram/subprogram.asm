global	_start

section	.bss
string	resb 256

section	.text
fill_memory:
	mov	[edi], al
	inc	edi
	loop	fill_memory
_start:
	mov	al, '&'
	mov	ecx, 256
	mov	edi, string
	call	fill_memory
