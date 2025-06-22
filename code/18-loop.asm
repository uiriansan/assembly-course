section .data
    list DB 1,2,3,4
section .text

global _start
_start:
    mov eax, 0 ; use the 'a' register (accumulator) as index
    mov cl, 0 ; the 'c' register will keep track of the sum of the values in the list. They're small numbers, so 'cl' is enough
loop:
    mov bl, [list + eax]
    add cl, bl
    inc eax ; increment instruction
    cmp eax, 4
    je end
    jmp loop
end:
    mov eax, 1
    mov ebx, 0
    int 80h
