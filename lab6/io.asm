extern printf

%macro pabc 1	; a simple print macro
	section .data
.str	db %1,0	;%1是要打印的字符串
	section .text

	mov rdi, pfmt	;address of format string
	mov rsi, .str
	movq xmm0, qword [a];first floating point in fmt
	movq xmm1, qword [b];second floating point in fmt
	movq xmm2, qword [c]
	mov rax, 3
	call printf
%endmacro

section .data

a:	dq	3.0
b:	dq	4.0
i:	dq	8.0
pfmt:	db "%s, a=%e, b=%e,c=%e",10,0
sfmt:	db "%e",0
section .bss
c:	resq 	1

section .text
global main
main:
	push rbp
	mov rdi, sfmt
	mov 
	pabc "c=5.0"

	pop rbp
	mov rax, 0
	ret
