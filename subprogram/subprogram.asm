%include 'stud_io.inc'
global	_start

section	.bss
string	resb 256

section	.text
fill_memory:
	push	ebp
	mov	ebp, esp
	mov	edi, [ebp + 8]
	mov	ecx, [ebp + 12]
	mov	al, [ebp + 16]
.start:
	mov	[edi], al
	inc	edi
	loop	.start
.end:
	mov	esp, ebp
	pop	ebp
	ret

show_str:
	PUTCHAR	byte [esi]
	inc	esi
	loop	show_str
	PUTCHAR	10
	ret
_start:
	push	'&'
	push	256
	push	string
	call	fill_memory
	add	esp, 12

	mov	esi, string
	mov	ecx, 256
	call	show_str
	FINISH
