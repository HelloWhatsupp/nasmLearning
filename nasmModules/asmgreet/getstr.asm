;; asmgreet/getstr.asm ;;
global	getstr
%include 'kernel.inc'

section	.text
; arg1 ([ebp + 8]) - buffer address
; arg2 ([ebp + 12]) - buffer length
getstr:
	push	ebp
	mov	ebp, esp
	xor	ecx, ecx		; current length
	mov	edx, [ebp + 8]
.again:
	inc	ecx
	cmp	ecx, [ebp + 12]		; compare with buffer length
	je	.quit
	push	ecx
	push	edx
	kernel	3, 0, edx, 1		; read 1 symbol into buffer
	pop	edx
	pop	ecx
	cmp	eax, 1
	jne	.quit
	cmp	byte [edx], 10
	je	.quit
	inc	edx
	jmp	.again
.quit:
	mov	byte [edx], 0
	mov	esp, ebp
	pop	ebp
	ret
