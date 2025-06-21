https://www.youtube.com/playlist?list=PL2EF13wm-hWCoj6tUBGUmrkJmH1972dBB

Assembling:
```bash
$ nasm -f elf -o file.o file.s
$ ld -m elf_i386 -o file file.o
```

GDB:
```bash
layout asm
break _start
run
stepi
info registers <register>
x/x 0x<address>
# We can display more memory slots by specifing the number:
x/3x 0x<address> # Returns 3 memory slots starting from that address
```
Use intel syntax in GDB:
```bash
echo "set disassembly-flavor intel" > ~/.gdbinit
```
