;; asmgreet/quit.asm ;;
global quit
%include 'kernel.inc'

section .text
quit:
	kernel	1, 0
