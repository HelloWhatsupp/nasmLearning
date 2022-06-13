;; asmgreet/putstr.asm ;;
%include 'kernel.inc'			; need kernel macro
global	putstr				; module describes putstr
extern	strlen				; module uses strlen

section	.text
; procedure putstr
; [ebp + 8] == address of the string
putstr:
	push	ebp			; usual start of the subprogram
	mov	ebp, esp
	push	dword [ebp + 8]		
	call	strlen			; call strlen with param (return len into eax)
	add	esp, 4			; remove param from stack
	kernel	4, 1, [ebp + 8], eax	; use macro for system call
	mov	esp, ebp		; usual return from subprogram
	pop	ebp
	ret
