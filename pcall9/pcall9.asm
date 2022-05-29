global	_start

%macro	pcall10	11 
	push	%11
	push	%10
	push	%9
	push	%8
	push	%7
	push	%6
	push	%5
	push	%4
	push	%3
	push	%2
	call	%1
	add	esp, 40 
%endmacro
%macro	quitCall 2
	mov	%2, %1
	pop	%1
	ret
%endmacro



section	.data
a	equ 7
val	db	12, 37, 3, 6, 54, 80, 15, 2, 16, 5

section	.text
sum:
	push	ebp
	mov	ebp, esp
	
	xor	eax, eax
	xor	ebx, ebx
	xor	ecx, ecx
	mov	ecx, 8
.again:
	mov	bl,  [ebp + ecx]		; read value from stack
	add	eax, ebx			; sum value with result
	add	ecx, 4				; increment on dword value
	cmp	ecx, 44
	jle	.again
.quit:
	quitCall\
		ebp, esp
_start:
	pcall10	sum, dword [val], dword [val + 1], dword [val + 2]\
		, dword [val + 3], dword [val + 4], dword [val + 5]\
		, dword [val + 6], dword [val + 7], dword [val + 8]\
		, dword [val + 9]
