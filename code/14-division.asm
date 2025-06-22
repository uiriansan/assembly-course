section .data
section .text

global _start
_start:
    mov eax, 11
    mov ecx, 2
    mov edx, 0 ; the 'd' register will get the remainder. We must zero it out before the division to prevent unexpected result.
    div ecx ; unsigned division
    ; eax = eax / ecx = 5 ; edx = 1 (remainder)
    ; just as multiplication, division automatically uses the 'a' register as the destination
    ; the remainder goes to the 'd' register
    mov eax, 0xFF
    mov ecx, 2
    mov edx, 0 ; the 'd' register will get the remainder. We must zero it out before the division to prevent unexpected result.
    idiv ecx ; signed division
    ; eax = eax / ecx = 127
    ; in the example above, 'eax' value will be assumed to be '-1'
    ; this will result in a arithmetic exception
    ; mov eax, 0xFF - This loads 255 into EAX
    # mov ecx, 2 - This loads 2 into ECX (the divisor)
    # mov edx, 0 - This clears EDX (high part of dividend)
    # idiv ecx - This performs signed division of EDX:EAX by ECX
    # When idiv executes:
    # The dividend is the 64-bit value formed by EDX:EAX = 0x00000000:000000FF = 255
    # The divisor is ECX = 2
    # Since this is signed division, 255 ÷ 2 = 127 with remainder 1
    # The result is:
    # EAX (quotient) = 127
    # EDX (remainder) = 1
    # If you had used div instead of idiv (unsigned division), you would get the same result in this case since 255 is positive. However, the distinction becomes important with larger values or when dealing with negative numbers.
    # Note that 127 is indeed 255 ÷ 2 truncated toward zero, which is the standard behavior for integer division in most programming contexts.

    mov eax, 1
    int 80h
