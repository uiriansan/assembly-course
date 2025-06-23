section .bss
    buffer resb 1024
section .data
    pathname DD "/home/uirian/.config/fish/config.fish", 0
section .text

global main
main:
    mov eax, 5 ; syscall 5 = sys_open file
    ; this syscall takes 3 arguments. We can check those in the syscall table and what they mean in the man page for open:
    ; https://faculty.nps.edu/cseagle/assembly/sys_call.html
    ; https://man7.org/linux/man-pages/man2/open.2.html
    ; the last arguments is only needed when creating files, so we're skipping it
    mov ebx, pathname ; first argument is the path. The syscall expects a pointer to a char, which is exactly the case here, instead of moving the value with '[pathname]'
    mov ecx, 0 ; second argument is the flag. '0' is READONLY
    ; the result of this syscall will be in 'eax'. It'll be the File Descriptor, an integer value that can be used later with other syscalls to address that file.
    int 80h

    mov ebx, eax ; move the file descriptor into 'ebx', which is perfect because the first argument for the next syscall is precisely the file description that goes into 'ebx'.
    mov eax, 3 ; syscall 3 = sys_read file
    mov ecx, buffer ; second argument is a char* to the buffer where the file is gonna be read into
    mov edx, 1024 ; third argument is how many bytes we wanna read into buffer
    int 80h
    ; x/s 0x804c03c -> "1024 bytes from the file"
    ; 'x/s' is for string printing in gdb
    ; eax contains how many characters were read from the file if the file.length >= 'edx' (how many bytes we asked to read)
    ; eax will be 0 if it reached the end of the file

    mov eax, 1
    mov ebx, 0
    int 80h
