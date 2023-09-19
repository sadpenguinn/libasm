section .text
global ft_read

ft_read:
    ; Аргументы функции:
    ;   rdi - файловый дескриптор (stdin = 0)
    ;   rsi - указатель на буфер
    ;   rdx - количество байт для чтения

    mov rax, 0          ; номер системного вызова для read
    syscall             ; вызвать системный вызов

    ret
