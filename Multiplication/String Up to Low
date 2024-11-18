section .data
    s1 db 'OMUPADHYAY'       ; Uppercase string to be converted
    len equ $ - s1            ; Length of s1

section .bss
    s2 resb 20               ; Reserve 20 bytes for lowercase string

section .text
    global _start

_start:
    mov ecx, len             ; Length of string1
    mov esi, s1              ; Load address of string1 into ESI
    mov edi, s2              ; Load address of s2 (destination) into EDI

UpptoLow:
    lodsb                    ; Load byte from string1 into AL
    or al, 20h               ; Convert uppercase to lowercase by setting bit 5
    stosb                    ; Store the converted byte in string2
    loop UpptoLow            ; Repeat until ECX becomes 0

    mov eax, 4               ; sys_write system call
    mov ebx, 1               ; File descriptor 1 (stdout)
    mov edx, 20              ; Length of message to write
    mov ecx, s2              ; Pointer to the converted string (s2)
    int 0x80                 ; Make the syscall

    mov eax, 1               ; sys_exit system call
    xor ebx, ebx             ; Exit code 0
    int 0x80                 ; Make the syscall
