section .data
section .text

global _start
_start:
    mov eax, 5
    mov ebx, 2
    sub eax, ebx

    mov eax, 1
    int 80h
