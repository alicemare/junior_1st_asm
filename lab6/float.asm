extern printf
extern scanf

section .data
x dd 0
a dd 1.0
b dd 1.0
c dd 1.0

smsg db '%f',0
pmsg db '%f',10,0

section .text

global main
main:
;scanf x
mov eax, var
fld dword [eax]
sub esp, 8
fstp qword [esp]
push pmsg
call printf
add esp, 12
ret
