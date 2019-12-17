extern scanf
extern printf
section .bss
n resb 4
section .data
pmsg db '%ld',10,0
smsg db '%d',0

section .text

global main
main:
	sub rsp, 8

	mov rdi, smsg
	mov rsi, n
	mov al , 0
	call scanf

	add rsp, 8

	mov rcx, [n]
	call fact
	
	

output:

	sub rsp ,8

	mov rdi, pmsg	;第一个参数
	mov rsi, rax	;第二个参数
	mov al, 0	;不使用mmx
	call printf

	add rsp,8
	ret 
	
fact:
	cmp rcx, 1
	jg cal
	;0!=1
	mov rax, 1
	ret
cal:	
	dec rcx
	call fact
mul:	inc rcx
	mul rcx		;rax = rax * ecx	;rdx = 0
	ret 


