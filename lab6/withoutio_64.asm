;先不处理io简单很多
;这个程序可以按照期望的运行
global main

section .data
a: dq 1.00
b: dq 2.00
c: dq 3.00
x: dq 4.00

section .bss
res: resq 1

section .text

main:
fld qword [x]	;load x at st0
fsqrt		;st0 = sqrt(x)
fmul qword [a]	;st0 = a * sqrt(x)

fld qword [b]
fld qword [x]	;load x at new_st0
fyl2x		;st0 = b*log(x) and pop so that the result ends up in st0
faddp 		;add and pop st0 = b*log(x) + a*sqrt(x)

fld qword [x]	;load x at st0
fsin		;st0 = sin(x)
fmul qword [c]	;st0 = c*sin(x)
faddp 		;add and pop st0 = c*sin(x) + b*log(x) + a*sqrt(x)
fstp qword [res]

mov eax, 1
xor ebx, ebx
int 0x80
