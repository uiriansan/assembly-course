section .data
section .text

global main

; Procedures are functions:
addTwo:
    add eax, ebx
    ret ; return back to the location the function was called from
    ; 'esp' is the stack pointer register (current stack position)
    ; info register esp -> 0xffffd1b8   0xffffd1b8
    ; x/x 0xffffd1b8    -> 0x08049182
    ; '0x08049182' is the address of the 'mov ebx, eax' instruction
    ; When 'call' is executed, this address is put into the stack and then 'ret' takes (pop) the address and brings us back to it.

main:
    mov eax, 4
    mov ebx, 1
    call addTwo
    mov ebx, eax

    mov eax, 1
    int 80h
