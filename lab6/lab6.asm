;; input and output in x64
extern scanf
extern printf


section .bss
n resb 4
section .data
x dq 0
a dq 0
b dq 0
c dq 0
res dq 1
sfmt db "%d,%d,%d,%d",0
pfmt db "%e",10,0
section .text
global main
main:
	;不push和pop rsp会段错误
	push rsp
	mov rdi, sfmt
	mov rsi, x
	mov rdx, a
	mov rcx, b
	mov r8, c
	mov rax, 0
	call scanf
	pop rsp
	fld qword [x]	;load x at st0
	fsqrt		;st0 = sqrt(x)
	fmul qword [a]	;st0 = a * sqrt(x)

	fld qword [b]
	fld qword [x]	;load x at new_st0
	fyl2x		;st0 = b*log(x) and pop, the result ends up in st0
	faddp 		;add and pop st0 = b*log(x) + a*sqrt(x)

	fld qword [x]	;load x at st0
	fsin		;st0 = sin(x)
	fmul qword [c]	;st0 = c*sin(x)
	faddp 		;add and pop st0 = c*sin(x) + b*log(x) + a*sqrt(x)
	fstp qword [res]

	push rsp
	mov rdi, pfmt
	movq xmm0, qword [res]
	mov rax, 1
	call printf
	pop rsp
