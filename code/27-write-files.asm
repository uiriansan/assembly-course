section .data
section .bss
section .text

global main
main:

    mov eax, 1
    mov ebx, 0
    int 80h
