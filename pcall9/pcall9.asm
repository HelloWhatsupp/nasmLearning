global	_start

%macro	pcall2	3 
	push	%3
	push	%2
	call	%1
	add	esp, 4 
%endmacro
%macro	quitCall 2
	mov	%2, %1
	pop	%1
	ret
%endmacro



section	.data
a	equ 7
val	db	12, 37, 3, 6, 54, 80, 15, 2, 16

section	.text
sum:
	push	ebp
	mov	ebp, esp
	
	xor	eax, eax
	xor	ebx, ebx
	xor	ecx, ecx
	mov	ecx, 8
.again:
	mov	ebx, [ebp + 8]		; read value from stack
	add	eax, ebx			; sum value with result
	add	ecx, 4				; increment on dword value
	cmp	ecx, 12
	je	.quit
	jmp	.again
.quit:
	quitCall\
		ebp, esp	
_start:
	pcall2	sum, dword [val], dword [val + 1]
