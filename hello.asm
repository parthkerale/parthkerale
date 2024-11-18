section .data
    hello db 'Hello, World!',0  ; null-terminated string

section .text
    global _start

_start:
    ; Write the string to stdout (file descriptor 1)
    mov eax, 4           ; syscall number for sys_write
    mov ebx, 1           ; file descriptor (stdout)
    mov ecx, hello       ; pointer to the string
    mov edx, 13          ; length of the string
    int 0x80             ; call kernel

    ; Exit the program (exit code 0)
    mov eax, 1           ; syscall number for sys_exit
    xor ebx, ebx         ; exit code 0
    int 0x80             ; call kernel
