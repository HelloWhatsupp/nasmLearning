section .data

fibonacci
%assign i 1
%assign j 1

%rep 100000
	%if j > 100000
		%exitrep
	%endif

	dd j
	%assign j j + i
	%assign i j - i
%endrep
fib_count equ ($-fibonacci)/4
