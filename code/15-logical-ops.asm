section .data
section .text

global _start
_start:
    mov eax, 0b1010
    mov ebx, 0b1100
    and eax, ebx
    ; eax  = 1000
    mov eax, 0b1010
    mov ebx, 0b1100
    or eax, ebx
    ; eax = 1110
    not eax ; the bits will flip
    ; eax = -15, or 0xfffffff1
    ; that's because 'not' flip all of the bits, even the ones that are not part of the value.
    ; we can use 'and' to flip everything back except for the bits we care about (the last 4):
    and eax, 0x0000000F ; It can be just '0xF' since it will automatically fill the rest with zeros.
    ; eax = 1, or 0001 -> now it's correct
    ; this is known as a mask
    ; sets the first 28 bits to 0 and the last 4 to 1
    ; this will clear the first 28 bits that were flipped early
    mov eax, 0b1010
    mov ebx, 0b1100
    xor eax, ebx
    ; eax = 0b0110
    ; only flip the bit to 1 when only one of the bits is 1 and the other is 0

    mov eax, 1
    int 80h
