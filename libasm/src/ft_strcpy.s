                  global     ft_strcpy

                  section    .text

ft_strcpy:                                              ; char *ft_strcpy(char *dest, char *src)
                  mov        rax, rdi                   ; Move first argument (dest) to rax
                  jmp        _loop                      ; Jump to _loop

_loop:
                  cmp        [rsi], byte 0              ; Check if we faced the end of the source string
                  jz         _end                       ; If we faced the end of the source string, jump to _end
                  movsb                                 ; Move byte from rsi to rdi and increment both pointers
                  jmp        _loop                      ; Next iteration

_end:
                  mov       byte [rdi], 0               ; Set the end of the dest string to \0
                  ret
