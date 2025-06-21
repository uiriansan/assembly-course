section .bss  ; stands for Block Starting Symbol. User for reserving space in memory.
    num RESB 3 ; reserves 3 bytes ('B' for byte). The logic applies to other sizes (RESW, RESD, etc)
section .data
    num2 DB 3 DUP(2) ; This is a trick to initialize values in the .data section with a default value. In this case, we're defining 3 bytes and assigning the value 2 to all of them.
section .text

global _start
_start:
    ; mov [num], 1    ; We can't do this because x86 has no comprehension of the sizes of theses components.
    mov bl, 1         ; ...so first we put the data in a register
    mov [num], bl     ; And now it knows this is 1 byte, because 'bl' is a 1 byte register. This move the value 1 into the first byte we allocated out of 3.
    mov [num+1], bl   ; and this moves 1 into the second byte we allocated. Note that the "+" here will always be in bytes, even if we reserved a different size. So if we reserved a (W)ord (16 bits / 2 bytes), we'll have to do [num+2] to move to the next slot, and then [num+4] for the next...
    mov [num+2], bl   ; 1 into the 3rd and final slot we reserved.

    mov eax, 1
    int 80h
