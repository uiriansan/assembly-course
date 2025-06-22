section .data
section .text

global _start
_start:
    mov eax, 5
    mov ebx, 2
    sub eax, ebx ; eax = eax - ebx
    ; eax = 2

    mov eax, 3
    mov ebx, 5
    sub eax, ebx
    ; eax = -2
    ; info register eax -> eax  0xfffffffe   -2
    ; this hex value could also be interpreted as a really larga number,
    ; but gdb knows it's actually a negative number because of the eflags:
    ; info register eflags -> eflags    0x293   [ CF AF SF IF ]
    ; 'CF' is the carry flag, but it also serves the indicates borrowing in subtraction, which is happening is this case.
    ; 'SF' is the Sign Flag. If set to 1, the operation produced a negative output
    mov ebx, 2
    add eax, ebx
    ; eax = 0 (-2 + 2 = 0)
    ; if we think about it, the hex value of the previous subtraction was 'fffffffe' (-2).
    ; if we add 2 to this, the 'e' at the end turns into 'f' and then wraps back to 0.

    mov eax, 1
    int 80h
