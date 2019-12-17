global main
extern printf
extern scanf

section .data
exp: db "((-1)+(2+3))",0
flag: db 0
numtop: db 0
optop: db 0
before: db '0'
section .bss
num resb 20
op resb 20
section .text
	mov eax, exp
	mov ecx, [eax]
beglp:	cmp ecx, '0'
	jl L1
	cmp ecx, '9'
	jg L1
	jmp endlp
	mov ebx, [flag]
	cmp ebx, 0
	je POSNUM
	mov ebx, 0
	mov [flag], ebx
	mov ebx, [eax]
	mov ecx, '0'
	sub ecx, ebx
	add ecx, '0'
POSNUM:
	mov ebx, num
	add ebx, numtop
	mov [ebx], ecx
	mov ebx, numtop
	inc ebx
	mov [numtop],ebx 
	jmp endlp
L1:  
	cmp ecx, '('
	jne L2
	mov ebx, op
	add ebx, optop
	mov [ebx], ecx
	mov ebx, optop
	inc ebx
	mov [optop],ebx
	jmp endlp

L2:	
	cmp ecx, '+'
	jne L3
	mov ebx, op
	add ebx, optop
	mov [ebx],optop
	inc ebx
	mov [optop],ebx
	jmp endlp
L3:
	push eax
	push ecx
	cmp ecx, ')'
	mov ebx, op
	add ebx, optop
	mov eax, [ebx]
	cmp eax, '('
	je endcal
	;计算表达式部分
	mov ebx, op
	add ebx, optop
	dec ebx
	mov eax, [ebx]

	mov ebx, num
	add ebx, numtop
	dec ebx
	mov ecx, [ebx]
	dec ebx
	mov edx, [ebx]
	mov [numtop], ebx
	cmp eax, '-'
	je DOSUB
	add edx, ecx
	sub edx, '0'
	jmp endcal
DOSUB:
	sub edx, ecx
	add edx, '0'
	

endcal:
	mov [ebx],edx	;num.push(cal)
	inc ebx
	mov [numtop],ebx
	pop ecx
	pop eax
	jmp endlp

L4:
	mov ebx, [before]
	cmp ebx, '('
	je NEGOP
	mov ebx, op
	add ebx, optop
	mov [ebx],optop
	inc ebx
	mov [optop],ebx
	jmp endlp

NEGOP:
	mov ebx, [flag]
	mov ebx, 1
	mov [flag],ebx

endlp:	
	mov [before],ecx
	inc eax
	mov ecx, [eax]
	cmp ecx, 0
	jne beglp	


