section .data
    s1 db "Hello world!", 0      ; First string
    lens1 equ $ - s1              ; Length of s1

    s2 db "Hello, world", 0       ; Second string
    lens2 equ $ - s2              ; Length of s2

    msg_eq db "Strings are equal", 0  ; Message for equal strings
    len_eq equ $ - msg_eq            ; Length of the message

    msg_neq db "Strings are not equal", 0  ; Message for unequal strings
    len_neq equ $ - msg_neq             ; Length of the message

section .text
    global _start

_start:
    ; Compare strings s1 and s2
    mov esi, s1                    ; Load address of s1 into esi
    mov edi, s2                    ; Load address of s2 into edi
    mov ecx, lens2                 ; Set length of s2 into ecx

    repe cmpsb                      ; Compare the strings byte by byte

    je equal                        ; Jump to equal if strings are the same

    ; If strings are not equal, display "Strings are not equal"
    mov eax, 4                      ; Syscall for write
    mov ebx, 1                      ; File descriptor (stdout)
    mov ecx, msg_neq                ; Message to write
    mov edx, len_neq                ; Message length
    int 0x80                         ; Make the syscall
    jmp exit                        ; Exit the program

equal:
    ; If strings are equal, display "Strings are equal"
    mov eax, 4                      ; Syscall for write
    mov ebx, 1                      ; File descriptor (stdout)
    mov ecx, msg_eq                 ; Message to write
    mov edx, len_eq                 ; Message length
    int 0x80                         ; Make the syscall

exit:
    mov eax, 1                      ; Syscall for exit
    xor ebx, ebx                    ; Exit code 0
    int 0x80                         ; Make the syscall
