extern test

section .data
section .text

global main
main:
    push 5
    push 10
    call test

    ; since our function 'test' returns a value, this value is stored in 'eax'
    mov ebx, eax ; move the value to ebx to use it as the exit code
    mov eax, 1
    int 80h
    ; gcc -no-pie -m32 22-c-custom-functions.o C/text.c -o 22-c-custom-functions
