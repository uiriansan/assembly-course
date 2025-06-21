section .data
    char  DB 'A'             ; Single character (1 byte) stored as ASCII (65)
    list  DB 1,2,3,4         ; List with 4 items, each of 1 byte. We don't where the list ends because it is align side by side in memory.
    tlist DB 1,2,3,4,5,-1    ; List with 5 items, each of 1 byte. The '-1' is a null terminator so we know when the list ends.
    str1  DB "ABCdef", 0     ; A string is also a list, in this case with 6 characters 1 byte each. The '0' is the null terminator.
    str2  DB "GHIjkl", 0
section .text

global _start
_start:
    mov al, [char]
    mov bl, [tlist]
    mov cl, [str1]
    mov dl, [str2]

    mov eax, 1
    mov ebx, 0
    int 80h
