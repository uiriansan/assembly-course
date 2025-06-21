section .data
    num  DB 1 ; Byte variable with value 1
    num2 DB 2 ; Byte variable with value 2
section .text

global _start
_start:
    ; mov ebx, [num]   ; Address: 0x804a000, Value: 0x201
    ; mov ecx, [num2]  ; Address: 0x804a001, Value: 0x201
    ; If we run the code above with gdb and type `info registers ebx`, we'll get the value 0x201
    ; That's because the values in the .data section are aligned side by side in the same 32-bit memory slot (cause we're using 32-bit asm),
    ; and by moving into `ebx` and `ecx` we're moving the entire 32-bits chunk.
    ; In this case, we're moving 01 and them 02, so we end up with the value 0x00000201, or simply 201.

    ; This is fixed by using the registers `bl` instead of `ebx` and `cl` instead of `ecx`, meaning we only want the 8 (l)ower bits (1 byte).
    ; eax; ebx, ecx, edx -> extended registers (4 bytes/32 bits)
    ; ax, bx, cx, dx     -> 16-bit registers (2 bytes)
    ; al, bl, cl, dl     -> low bits (1 byte)
    ; ah, bh, ch, dh     -> high bits (1 byte)
    ; So we can say the registers are actually named `a`, `b`, `c` and `d`, and the rest of the names refers to specific parts of the data.
    mov bh, [num]   ; Address: 0x804a000, Value: 0x1
    mov ch, [num2]  ; Address: 0x804a001, Value: 0x2
    ; In the example above:
    ;   info registers bl   -> 0x1, or 1 decimal
    ;   info registers ebx  -> 0x1
    ;   info registers cl   -> 0x2, or 2 decimal
    ;   info registers ecx  -> 0x2
    ; But if we use the high bits instead:
    ;   info registers bh   -> 0x1
    ;   info registers ebx  -> 0x100, or 256 decimal
    ;   info registers ch   -> 0x2
    ;   info registers ecx  -> 0x200, or 512 decimal
    ; Because `01` is going to the high 16 bits:
    ; 0000 0001   0000 0000 -> HIGH   LOW
    ; 0  0  0  0     0   0   0   1     0   0   0   0     0   0   0   0
    ;                            2^8   2^7 2^6 2^5 2^4   2³  2²  2¹  2^0
    ; 0001 0000 0000 = 1 * 2^8
    ; 0001 0000 0000 = 256

    mov eax, 1
    mov ebx, 0
    int 80h
