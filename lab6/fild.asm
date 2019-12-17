extern printf
extern scanf
global main
section .bss
  num1: resb 4
  num2: resb 4
section .data
format_float: db "The result is %f", 10, 0
smg: db "%d,%d,%d,%d",0

x: dd 4
a: dd 1
b: dd 2
c: dd 3
main:

  push c
  push b
  push a
  push x
  push smg
  call scanf
  add esp, 20

  mov eax, [x]
  mov [num1],eax
  fild dword [num1]		;st0 = float(x)
  fsqrt				;stp = sqrt(x)
  mov ebx, [a]
  mov dword [num2], ebx		
  fild dword [num2]
  fmulp
  
  mov ebx, [b]
  mov dword [num2], ebx
  fild dword [num2]
  fild dword [num1]
  fyl2x
  faddp

  fild dword [num1]
  fsin
  mov ebx, [c]
  mov dword [num2], ebx
  fild dword [num2]
  fmulp 
  faddp

  sub esp, 8
  fstp qword [esp]
  push format_float
  call printf
  add esp, 12

ret
