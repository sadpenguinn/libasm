section .text
global ft_strcpy

ft_strcpy:
    ; Аргументы функции:
    ;   rdi - указатель на исходную строку (источник)
    ;   rsi - указатель на буфер (назначение)

    xor rcx, rcx          ; Используем rcx как счетчик байт

copy_loop:
    mov al, [rdi + rcx]  ; Загружаем байт из источника
    mov [rsi + rcx], al  ; Сохраняем его в назначении

    inc rcx              ; Увеличиваем счетчик
    cmp byte [rdi + rcx], 0  ; Проверяем, достигли ли конца строки
    jnz copy_loop        ; Если нет, продолжаем копирование

    ret
