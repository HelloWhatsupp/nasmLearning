%macro zeromem 2
push dword %2			; if we using registers when calling macro at
				; 23 line we can safe ourself thanks to pushing
				; params into stack and then pop it into
				; registers again
push dword %1
pop	eax
pop	ecx
%%lp:				; if we call 'zeromem' twice or more times, we 
				; need to use %% to prevent us from using
				; the same label name after deployment macro
	mov	byte [eax], 0
	inc	eax
	loop	%%lp
%endmacro

section .bss
array resb 256
arr_size equ $-array

section .text
_start:
	mov	eax, array
	mov	ecx, arr_size
	zeromem eax, ecx	; at this place we use registers that
				; we need to push into stack
