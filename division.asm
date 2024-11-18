section .data
    dividend db 0x1A       ; Dividend (example: 1Ah)
    divisor  db 0x05       ; Divisor (example: 05h)
    quotient db 0          ; Memory location to store the quotient
    remainder db 0         ; Memory location to store the remainder

section .bss

section .text
    global _start          ; Entry point for the program

_start:
    mov al, [dividend]     ; Load dividend into AL
    mov bl, [divisor]      ; Load divisor into BL

    xor ah, ah             ; Clear AH to ensure AH:AL is the dividend

    div bl                 ; Divide AX by BL, quotient in AL, remainder in AH

    mov [quotient], al     ; Store the quotient in memory
    mov [remainder], ah    ; Store the remainder in memory

    mov eax, 1             ; Syscall number for exit (sys_exit)
    xor ebx, ebx           ; Exit code 0
    int 0x80               ; Invoke syscall
