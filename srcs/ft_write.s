section .text
global ft_write

ft_write:
    ; Аргументы функции:
    ;   rdi - файловый дескриптор (stdout = 1)
    ;   rsi - указатель на данные
    ;   rdx - размер данных

    mov rax, 1          ; номер системного вызова для write
    syscall             ; вызвать системный вызов

    ret
