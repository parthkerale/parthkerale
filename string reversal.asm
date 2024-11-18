section .data
    msg db "ombhandari", 0
    len equ $-msg

section .bss
    rstring resb 14

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80

    mov esi, msg
    mov edi, rstring

reverse_loop:
    lodsb
    cmp al, 0
    je reverse_done
    dec edi
    mov [edi], al
    jmp reverse_loop

reverse_done:
    mov byte [edi], 0

    mov eax, 4
    mov ebx, 1
    mov ecx, rstring
    mov edx, len
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80
