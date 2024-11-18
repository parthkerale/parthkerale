section .data
    string db "ombhandari", 10   ; String to be converted to uppercase, 10h is the newline character
    len equ $ - string            ; Length of the string

section .text
    global _start

_start:
    mov ecx, string              ; Load the address of the string into ECX
    call toUpper                 ; Call the toUpper function to convert string to uppercase
    call print                   ; Call the print function to display the string

    mov eax, 1                   ; Exit system call number
    xor ebx, ebx                 ; Exit code 0
    int 0x80                     ; Invoke syscall to exit the program

toUpper:
    mov al, [ecx]                ; Load the current character from the string into AL
    cmp al, 0                    ; Compare AL with 0 (end of string)
    je done                      ; If it’s zero, jump to the end
    cmp al, 'a'                  ; Check if character is >= 'a'
    jb next_char                 ; If less than 'a', go to the next character
    cmp al, 'z'                  ; Check if character is <= 'z'
    ja next_char                 ; If greater than 'z', go to the next character
    sub al, 0x20                 ; Convert to uppercase (ASCII offset)
    mov [ecx], al                ; Store the converted character back into the string

next_char:
    inc ecx                      ; Move to the next character in the string
    jmp toUpper                  ; Repeat the process

done:
    ret                          ; Return from the toUpper function

print:
    mov eax, 4                   ; Syscall number for sys_write
    mov ebx, 1                   ; File descriptor 1 (stdout)
    mov edx, len                 ; Length of the string
    mov ecx, string              ; Address of the string to print
    int 0x80                     ; Invoke syscall to print the string

    ret
