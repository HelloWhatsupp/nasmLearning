global _start

%macro PRINT 2
	mov	eax, 4
	mov	ebx, 1
	mov	ecx, %1
	mov	edx, %2
	int	80h
%endmacro
%macro pcall 1-*
	%rep %0 - 1
		%rotate -1
		push	dword %1
	%endrep

	%rotate	-1
	call	%1
	add	esp, (%0 - 1) * 4
%endmacro

section .bss
rawBuff resb 256
rawBuffSize equ $-rawBuff
buffer resb 256
bufferSize resb 1

fileDescriptor resd 1

section .data
readErrMsg db 'A error occured during reading standart input', 10
readErrMsgSize equ $-readErrMsg

writeErrMsg db 'A error occured during writing standart output', 10
writeErrMsgSize equ $-writeErrMsg

fileDir db './dataFromBuffer.txt'


section .text
chkSize:
	push	ebp
	mov	ebp, esp
	mov	eax, [ebp + 8]
	mov	ebx, [ebp + 12]
.compare:
	cmp	eax, 0
	jz	.EOF
	cmp	eax, ebx
.EOF:
.quit:
	mov	esp, ebp
	pop	ebp
	ret
writeErr:
	PRINT	writeErrMsg, writeErrMsgSize
	jmp	quit
readErr:
	PRINT readErrMsg, readErrMsgSize

cleanBuff:
	push	ebp
	mov	ebp, esp

	mov	ecx, [ebp + 8]
	mov	esi, [ebp + 12]
	mov	edi, [ebp + 16]
	xor	al, al
.lp:
	mov	bl, [esi]
	mov	[edi], bl
	inc	esi
	inc	edi
	inc	al
	loop	.lp
.quit:
	mov	esp, ebp
	pop	ebp
	mov	[bufferSize], al
	ret
quit:
	mov	eax, 1
	mov	ebx, 1
	int	80h

_start:
	mov	eax, 3
	mov	ebx, 0
	mov	ecx, rawBuff
	mov	edx, rawBuffSize
	int	80h
	cmp	eax, fffff000h
	jle	readErr
	;pcall	chkSize, rawBuffSize, eax
	pcall	cleanBuff, eax, rawBuff, buffer
	
	mov	eax, 5
	mov	ebx, fileDir 
	mov	ecx, 241h
	mov	edx, 0666q
	mov	[fileDescriptor], eax
	
	mov	eax, 4
	mov	ebx, [fileDescriptor]
	mov	ecx, buffer
	mov	edx, [bufferSize]

	pcall	quit
