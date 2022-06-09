;; asmgreet/strlen.asm ;;
global	strlen

section	.text
; procedure strlen
; [ebp + 8] == address of the string
strlen:
	push	ebp
	mov	ebp, esp
	xor	eax, eax
	mov	ecx, [ebp + 8]		; arg1
.lp:
	cmp	byte [ecx + eax], 0
	je	.quit
	inc	eax
	jmp	short .lp
.quit:
	mov	esp, ebp
	pop	ebp
	ret
