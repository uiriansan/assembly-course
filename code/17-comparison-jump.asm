section .data
section .text

global _start
_start:
    mov eax, 3
    mov ebx, 2
    cmp eax, ebx ; compare
    ; this will subtract 'ebx' from 'eax' (3 - 2), use the result to set the eflags and discard the result.
    jl .lesser ; Jump if Less (eax < ebx)
    ; We also have:
    ;   'je' Jump Equals
    ;   'jne' Jump Not Equals
    ;   'jg' Jump greater
    ;   'jge' Jump Greater or Equals
    ;   'jle' Jump Less or Equals
    ;   'jz' Jump if Zero (does the same as 'je', since the result of the subtraction will be 0 anyways).
    ;   'jnz' Jump Not Zero
    jmp .notlesser ; 'jmp' will always be executed (if the above operation isn't, in which case this line will be skipped).
    ; In this example, the program will jump to '.notlesser' since 'eax' is greater than 'ebx'.

.lesser:
.notlesser:
    mov eax, 1
    int 80h
