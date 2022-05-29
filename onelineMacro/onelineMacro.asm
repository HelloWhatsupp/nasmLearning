global _start

%define	thenumber 25			; defines oneline macro which will be sub-
					; stituted as a number

%define	mkvar dd thenumber		; defines one macro at another which execute
					; when macro will be used 

%xdefine mkvar2 dd thenumber		; defines one macro at another which execute
					; immedietaly (dd 25)

%assign var 16				; macrovariable init with assign macro gets 
					; result of arithmetic expression
%assign var var+5			; gets var = 21

section .data
var1	mkvar

%define thenumber 37

var2	mkvar

section .text
_start:
