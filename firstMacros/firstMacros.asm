%macro	pcall0	1
	call	%1
%endmacro
pcall0	sub

%macro	pcall1	2		; 2 - count of macros' parameters
	push	%2
	call	%1
	add	esp, 4
%endmacro
pcall1	myproc, str

%macro	pcall2	3
	push	%3
	push	%2
	call	%1
	add	esp, 8
%endmacro
pcall2	prog, eax, ecx

%macro	pcall3	4
	push	%4
	push	%3
	push	%2
	call	%1
	add	esp, 12
%endmacro
pcall3	sum, 1, 2, 3

%macro	pcall4	5
	push	%5
	push	%4
	push	%3
	push	%2
	call	%1
	add	esp, 16
%endmacro
pcall5	figure, [x], [y], [width], [height]

%macro	pcall5	6
	push	%6
	push	%5
	push	%4
	push	%3
	push	%2
	call	%1
	add	esp, 20
%endmacro
pcall6	writeFile, eax, ebx, byte 3, pos, [status]

%macro	pcall6	7
	push	%7
	push	%6
	push	%5
	push	%4
	push	%3
	push	%2
	call	%1
	add	esp, 24
%endmacro
pcall6	readFile, [date], eax, ebx, byte 3, pos, [status]

%macro	pcall7	8
	push	%8
	push	%7
	push	%6
	push	%5
	push	%4
	push	%3
	push	%2
	call	%1
	add	esp, 28
%endmacro
pcall7	killProcesses, explorer, paint, windows10, steam\
, live, oxygen, communication


%macro	pcall8	9
	push	%9
	push	%8
	push	%7
	push	%6
	push	%5
	push	%4
	push	%3
	push	%2
	call	%1
	add	esp, 32
%endmacro
pcall8	clearRegisters, eax, ebx, ecx, edx, esi, edi, esp, ebp
