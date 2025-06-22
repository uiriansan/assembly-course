section .data
    x DD 3.14
    y DD 2.1
section .text

global _start
_start:
    movss xmm0, [x]
    movss xmm1, [y]
    ucomiss xmm0, xmm1 ; compare two floating point numbers
    ja greater
    ;   'ja' Jump Above. Same as jg (jump greater) >
    ;   'jae' Jump Above Equals. Same as jge (jump greater equals) >=
    ;   'je' Jump Equals. Same as ints ==
    ;   'jbe' Jump Below Equals. Same as jle (jump lesser equals) <=
    ;   'jb' Jump Below. Same as jl (jump lesser) <
    jmp end

greater:
end:
    mov eax, 1
    int 80h
