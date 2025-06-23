; https://man7.org/linux/man-pages/man2/lseek.2.html

section .data
    pathname DD "/home/Code/uirian/assembly-course/code/files/lseek.txt"
section .bss
    buffer: resb 10
section .text

global main
main:
    mov eax, 5 ; syscall for sys_open file
    mov ebx, pathname
    mov ecx, 0
    int 80h

    ; lseek let's us move to a particular location in a file before reading it
    mov ebx, eax ; move file descriptor into ebx
    mov eax, 19 ; syscall for sys_lseek
    mov ecx, 20 ; offset
    mov edx, 0  ; whence
    int 80h

    mov eax, 3 ; syscall for sys_read file
    mov ecx, buffer
    mov edx, 10
    int 80h
    ; x/s 0x<address> -> 003,30,50
    ; altough it looks like 9 characters, we must consider the new line character at the end, so the offset is multiple of 10

    mov eax, 1
    mov ebx, 0
    int 80h
