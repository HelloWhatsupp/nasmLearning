global	_start

%define arg1 [val]
%define arg2 [val + 1]
%define arg3 [val + 2]
%define arg4 [val + 3]
%define arg5 [val + 4]
%define arg6 [val + 5]
%define arg7 [val + 6]
%define arg8 [val + 7]
%define arg9 [val + 8]
%define arg10 [val + 9]

%define adrOfParam ebp + ecx

%macro	pcall 1-*
	%rep %0 - 1
		%rotate -1
		push	dword %1
	%endrep

	%rotate -1
	call	%1
	add	esp, (%0 - 1) * 4
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
	mov	bl,  [adrOfParam]		; read value from stack
	add	eax, ebx			; sum value with result
	add	ecx, 4				; increment on dword value
	cmp	ecx, 44
	jle	.again
.quit:
	quitCall\
		ebp, esp
_start:
	pcall	sum, arg1, arg2, arg3\
		, arg4, arg5, arg6\
		, arg7, arg8, arg9\
		, arg10
