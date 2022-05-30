%include '../hello/stud_io.inc'
global _start

%ifdef LOWERCASE_PRINT			; defines directive for condition

%assign caseDiff 65
%assign case 97

%elifdef UPPERCASE_PRINT

%assign caseDiff 97 
%assign case 65

%else
PRINT	'will be used standart print'
%endif

testStr	db	'Hello World', 10

section .text

_start:
	xor	al, al
	mov	esi, testStr
again:
	mov	al, [esi]	
	inc	esi

	cmp	al, 10
	je	writeCh

	cmp	al, 97
	%ifdef LOWERCASE_PRINT
	jae	writeCh	
	sub	al, caseDiff
	add	al, case
	%elifdef UPPERCASE_PRINT
	jb	writeCh
	sub	al, caseDiff 
	add	al, case
	%endif
	
writeCh:
	PUTCHAR	al
	cmp	al, 10
	jne	again
	FINISH
