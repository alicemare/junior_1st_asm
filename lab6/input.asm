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
sfmt db "%d,%d,%d,%d",0
pfmt db "%d,%d,%d,%d",10,0
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

	push rsp
	mov rdi, pfmt
	mov rsi, [x]
	mov rdx, [a]
	mov rcx, [b]
	mov r8, [c]
	call printf
	pop rsp
