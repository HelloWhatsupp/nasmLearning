global _start

section .text

nlstr db 10, 0

strlen:
	push	ebp
	mov	ebp, esp
	mov	ecx, [ebp + 8]
	xor	eax, eax
.again:
	cmp	byte [ecx + eax], 0
	jz	.quit
	inc	eax			; length
	jmp	short .again
.quit:
	mov	esp, ebp
	pop	ebp
	ret

print_str:
	push	ebp
	mov	ebp, esp
	push	ebx
	mov	ebx, [ebp + 8]		; argv
	push	ebx
	call	strlen
	add	esp, 4	
	%ifdef OS_LINUX
		mov	edx, eax	; edx now contains length
		mov	ecx, ebx	; ecx now contains address of the string
		mov	ebx, 1		; stdout
		mov	eax, 4		; system call to write
		int	80h
	%elifdef OS_FREEBSD
		push	eax		; string length
		push	ebx		; address of the string
		push	dword 1		; stdout
		mov	eax, 4		; system call to write
		push	eax
		int 80h
		add	esp, 16
	%else
		%error please define either OS_FREEBSD or OS_LINUX
	%endif
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret

_start:
	mov	ebx, [esp]		; argc
	mov	esi, esp
	add	esi, 4			; argv
.again:
	push	dword [esi]
	call	print_str
	add	esp, 4
	push	dword nlstr
	call	print_str
	add	esp, 4
	add	esi, 4			; argv
	dec	ebx
	jnz	.again

	%ifdef OS_LINUX
		mov	eax, 1
		mov	ebx, 0
		int	80h
	%elifdef OS_FREEBSD
		push	dword 0
		mov	eax, 1
		push	eax
		int	80h	
	%endif
