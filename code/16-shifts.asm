section .data
section .text

global _start
_start:
    mov eax, 2 ; equivalent to 0b0010
    shr eax, 1 ; '1' is how many places we want to shift
    ; eax = 0b0001, or 1
    ; 'shr' is shift right
    ; the missing '0' at the end goes into the carry flag
    ; shifting to the right is the same as dividing by 2
    mov eax, 10 ; or 0b1010
    shr eax, 1
    ; eax = 0b0101, or 5
    mov eax, 12 ; or 0b1100
    shr eax, 2 ; shift twice
    ; eax = 0b0011, or 3
    ; basically, it shifts once resulting in 0b0110 (6), and then shifts again (dividing by 2 again) resulting in 0b0011 (3).
    ; Is preferred to use shift to divide by 2, and 'div' otherwise.

    mov eax, 2 ; 0b0010
    shl eax, 1 ; shift left
    ; eax = 0b0100, or 4
    ; obviously, shift left is the same as multiplying by 2

    ; There is also 'sar' and 'sal' (Arithmetic Shift Right and Arithmetic Shift Left)
    ; They work the same, except they preserve the sign (signed shift).

    mov eax, 1
    int 80h
