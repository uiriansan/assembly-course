section .data ; stores variables
section .text ; actual code

global _start
_start: ; label
    mov eax, 1 ; What syscall we want to do. 1 means exit the program
    mov ebx, 1 ; The exit code
    int 80h    ; Interrupt to exec the syscall. 'h' stands for hex, so that's 80 in hexadecimal
