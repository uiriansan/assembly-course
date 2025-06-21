section .data
    ; Defining a variable of 4 bytes or 32 bits (DD = Define Double) with the value 5 on the stack
    num DD 5

section .text

global _start
_start:
    mov eax, 1
    mov ebx, [num]
    int 80h
