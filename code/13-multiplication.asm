section .data
section .text

global _start
_start:
    mov al, 2
    mov bl, 3
    mul bl ; al = 6
    ; "MUL" automatically applies multiplication to the 'a' register,
    ; so we only provide the one it'll be multiplied by.
    ; The 'a' register is reffered to as a Accumulator.
    mov al, 0xFF  ; info register al -> 0xFF  -1
    mov bl, 2
    mul bl ; 'mul' is unsigned multiplication
    ; al = 0xfe  -2
    ; info register ah -> 0x1   1
    ; info register ax -> 0x1fe 510
    ; the example above results in a number bigger than the 8-bit register 'al' can store.
    ; interestingly, 'mul' expands the destination register to fit the result,
    ; in this case all the way through the 8-bit high register 'ah' to the 16-bit register 'ax'.
    ; This doesn't happens for addition
    mov al, 0xFF ; info register al -> 0xFF  -1
    mov bl, 2
    imul bl ; 'imul' is signed multiplication.
    ; info register al -> 0xFe  -2

    ; In both the last two examples, the value of 'al' is '-1', but the result is different.
    ; '-1' is the decimal value from signed 2's complement
    ; in the second example we're using unsigned multiplication, so x86 assumed '0xFF' as 255 since it can't be negative (-1).
    ; in the last example, 'imul' took the sign into consideration.

    mov eax, 1
    int 80h
