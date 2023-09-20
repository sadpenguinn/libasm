                  global     ft_strcmp

                  section    .text

ft_strcmp:                                              ; char *ft_strdup(const char *s)
                  xor        rax, rax                   ; Clear rax
                  jmp        _loop                      ; Jump to _loop

_loop:
                   mov        cl, [rdi]                 ; Move byte from rdi to cl (ecx)
                   mov        al, [rsi]                 ; Move byte from rsi to al (eax)
                   inc        rdi                       ; Increment first pointer
                   inc        rsi                       ; Increment second pointer

                   cmp        cl, 0                     ; Check if we faced end of the first string
                   je         ft_strcmp_diff            ; If we faced end of the first string, return the difference
                   cmp        al, cl
                   je         _loop
                   jne        ft_strcmp_diff

ft_strcmp_diff:
                   sub        al, cl                    ; Second - first
                   jc         ft_strcmp_of              ; If JC is set, then the subtraction resulted in a borrow
                   neg        rax                       ; Negate the result, the first string is less than the second
                   ret

ft_strcmp_of:
                   mov        dl, 255                   ; 0xFF Maximum value of a byte
                   sub        dl, al                    ; 0xFF - al, we got a value as we don't faced borrowing
                   mov        al, dl                    ; Move the result to al
                   inc        rax                       ; Increment, becase ASCII starts from 0
                   ret
