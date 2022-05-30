global _start

%assign n 50

%rep 100
	db n
	%assign	n n+1
%endrep

_start:
	
