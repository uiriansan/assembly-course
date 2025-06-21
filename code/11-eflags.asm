section .data
section .text

global _start
_start:
    ; mov eax, 1
    ; mov ebx, 2
    ; add eax, ebx ; the first register is the destination. after: eax = 3, ebx = 2
    ; After the operation above, the 'eflags' register is = 0x206.
    ; This register consists of a set of bits where each bit represents a flag about the last operation executed, in this case 'add'.
    ; gdb shows the decoded short-form of these flags. In this case it is `[ PF IF ]`
    ; 'PF' is the Parity Flag. It is set to 1 when the operation is an odd number, and 0 when even.
    ; The result here is '3', which is an odd number, so the flag was set to 1 and that's why is shows up here.
    ; 'IF' is the Iterrupt enable Flag. It is set to 1 when we allow for interrupts to be done in owr system.

    mov al, 0b11111111 ; '0b' means binary; '0x' means hex
    mov bl, 0b0001
    add al, bl ; al = 0; bl = 1
    ; In the example above, we're adding 8 bit to 4 bits into a 8 bits (1 byte) register.
    ; This addition will carry a '1' all the way across to the 9th bit (remember that when the top-most bit is 1, it means negative)
    ; but since the register only has 8 bits, this 1 goes into the eflags
    ; info register eflags = [ CF PF AF ZF IF ]
    ; 'CF' is the Carry Flag. If set to 1, there's a carry from the previous operation that did not fit into the register.
    ; 'ZF' is the Zero Flag. Set to 1 when the result of the operation is 0. (al = 0)
    adc ah, 0 ; ADD with carry. Here we're basically getting the carry from the eflags register and adding 0 to it, resulting in the carry itself going into 'ah'.
    ; We're using 'ah' because those are the next 8 bits in our 'a' register.
    ; info register ah = 0x1, or 1
    ; info register eax = 0x100, or 255
    ; the highest value that fit inside 8 bits is 255, and since we added and extra 1 (the carry) into the next 8 bits of the 'a' register, now we got 256.

    int 80h
