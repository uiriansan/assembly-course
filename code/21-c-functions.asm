extern printf
extern exit
; These external functions will be linked later

section .data
    ; printf(fmt, msg);
    msg DD "Hello, there!", 0
    fmt DB "%s", 10, 0  ; '10' is a '\n'
section .text

global main
main:
    push msg ; place the data into the stack
    push fmt
    ; Stack is Last in, First out
    ; so we first add the message to the stack and then the format string in order for them
    ; to be collected by C in the correct order.
    ; First C gets fmt and then msg
    call printf

    push 0 ; Argument taken by exit(exit_code)
    call exit
