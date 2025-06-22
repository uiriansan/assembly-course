section .data
    x DD 3.14
    y DD 2.1
section .text

global _start
_start:
    movss xmm0, [x]
    movss xmm1, [y]
    ; 'MOV' with Scalar Single Precision
    ; Scalar meaning we are moving a single decimal value
    ; Single Precision meaning it's a 32-bit floating point

    ; 'xmm0' is a special register flor floating point numbers (there are 'xmm0' all the way to 'xmm15').
    addss xmm0, xmm1 ; add two floating point values
    ; p $xmm0.v4_float[0] = 5.23999977
    ; floats are not perfectly precise
    ; in C, the right way to compare floats is if(a-b < 0.0001)

    mov eax, 1
    int 80h
