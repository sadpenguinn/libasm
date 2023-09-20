                  global     ft_strdup
                  extern     malloc
                  extern     ft_strlen
                  extern     ft_strcpy

                  section    .text

ft_strdup:
                  push       rdi                   ; Place ptr on the stack, becase ft_strlen can use rdi

                  call       ft_strlen
                  inc        rax                   ; Add 1 to length for null terminator
                  mov        rdi, rax              ; Save length to rdi for malloc

                  call       malloc wrt ..plt
                  pop        rsi                   ; Remove first argument from stack and place it on next register
                  cmp        rax, 0                ; Check the result of malloc
                  je         ft_strdup_error       ; If malloc failed, return with error
  
                  mov        rdi, rax              ; Save malloc result to rdi for return
                  call       ft_strcpy
                  ret

ft_strdup_error:
                  xor        rax, rax              ; Nullify return value
                  ret