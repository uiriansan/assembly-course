section .data
section .text

global main

addTwo:
    ; When 'call' is executed, the return address is pushed into the stack on top of the values 4 and 1
    ; The stack pointer will be pointing to the stack address, since it is on top of the stack
    push ebp ; first we push ebp into the stack
    mov ebp, esp ; then we move the return address into ebp to make sure they both point to the same address
    mov eax, [ebp+8] ; and now we use 'ebp' as the reference pointer for the other data in the stack
    ; each memory slot in the stack is +4 away from 'ebp' (our reference pointer)
    ; right now the stack looks like this:
    ;
    ;         |                |
    ;         |----------------|
    ; ebp+0   |      ebp       |  <- Stack Pointer
    ;         |----------------|
    ; ebp+4   | return address |
    ;         |----------------|
    ; ebp+8   |       1        |
    ;         |----------------|
    ; ebp+12  |       4        |
    ;         |----------------|

    mov ebx, [ebp+12]
    add eax, ebx

    ; Before 'ret', we need to move the Stack Pointer so that it points to the return address again:
    pop ebp ; simply pop the value into ebp
    ret

main:
    ; We use the stack to pass data to function when it's too big for the registers or don't have registers available.
    push 4
    push 1
    call addTwo
    mov ebx, eax

    mov eax, 1
    int 80h
