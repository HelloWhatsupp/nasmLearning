%include 'stud_io.inc'
global _start

section .data
strng	db	'Hello, World!0'
ptrn	db	'H*Wor?!0'

section .text
match:
	push	ebp
	mov	ebp, esp
	sub	esp, 4
	
	push	esi
	mov	esi, [ebp + 8]		; put string to esi
	push	edi
	mov	edi, [ebp + 12]		; put pattern to edi
	
.again:
	cmp	byte [edi], '0'
	jne	.not_end
	cmp	byte [esi], '0'
	je	near .true
	jmp	.false
.not_end:
	cmp	byte [edi], '*'
	jne	.not_star
	mov	dword [ebp - 4], 0	; local var I for string shift
.star_loop:
	mov	eax, edi
	inc	eax
	push	eax
	mov	eax, esi
	add	eax, [ebp - 4]
	push	eax
	call	match
	add	esp, 8

	test	eax, eax
	jnz	.true
	add	eax, [ebp - 4]
	cmp	byte [esi + eax], '0'	; compare next char with 0
	je	.false
	inc	dword [ebp - 4]
	jmp	.star_loop
.not_star:
	mov	al, [edi]
	cmp	al, '?'
	je	.quest

	cmp	[esi], al
	jne	.false
.goon:
	inc	edi
	inc	esi
	jmp	near .again
.quest:
	cmp	byte [esi], '0'
	jne	.goon
.false:
	xor	eax, eax
	jmp	.quit
.true:
	mov	eax, 1
.quit:
	pop	edi
	pop	esi
	
	mov	esp, ebp
	pop	ebp
	ret
_start:
	push	dword ptrn
	push	dword strng
	call	match
	add	esp, 8

	add	eax, 48
	PUTCHAR	al
	PUTCHAR	10
	FINISH
