global _start

section .data
string	dd	8, 3, 9, 2, 3, 8, 2, 7, 4, 9, 5, 4, 2, 1, 3, 4, 0

section	.text
_start:	xor	ecx, ecx
	xor	ebx, ebx
	mov	esi, string
lp:	mov	bl, [esi+ecx]
	cmp	bl, 0
	je	lpquit
	push	ebx
	inc	ecx
	jmp	lp
lpquit:	jecxz	done
	mov	edi, esi
lp2:	pop	ebx
	mov	[edi], bl
	inc	edi
	loop	lp2
done:
