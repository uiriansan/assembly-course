# Processor's modes of operation
- **Protected Mode: ** the native processor state;
- **Real Address Mode: ** implements early Intel programming environment with the ability to switch modes;
- **System Managemenet Mode: ** provides an operating system with mechanisms for power management and security;

## Protected Mode
Multiple processes can run, but their each given their own section of memory, so one process can't modify another's memory.

## Real Address Mode
Allows to directy access to hardware devices

## System Management Mode
Mostly used to create operating system specifically to certain chip

# Register fundamentals
- x86 is a 32-bit processor, so each register is 32 bits in size;
- Example registers: EAX, EBX, ECX, EDX;
  - You can access just 16 bits by dropping the E (it stands for 'extended') giving AX, BX, CX, DX
  - You can access 8-bit high: AH, BH, CH, DH;
  - You can access 8-bit low: AL, BL, CL, DL;

## Common registers conventions
These registers are usually used for:
> **Image 05-registers.png**
- EIP: The instruction pointer, points to the address of the next instruction;
- EFLAGS: Flags to denote the status of an operation:
  - CF (carry flag);
  - OF (overflow flag);
  - SF (sign flag);
  - ZF (zero flag);
  - AC (auxiliary flag);
  - PF (parity flag);
