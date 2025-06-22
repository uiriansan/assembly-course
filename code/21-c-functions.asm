extern printf
extern exit
; These external functions will be linked later

section .data
    ; printf(fmt, msg);
    msg DD "Hello, there!", 0
    msg2 DD "Hey", 0
    val DB 0b1010
    fmt DB "%s %s %d", 10, 0  ; '10' is a '\n'
section .text

global main
main:
    push val  ; place the data into the stack
    push msg2
    push msg
    push fmt
    ; Stack is Last in, First out
    ; so we first add the variables to the stack and then the format string in order for them
    ; to be collected by C in the correct order.
    ; First C gets fmt and then the variables
    call printf

    push 0 ; Argument taken by exit(exit_code)
    call exit
