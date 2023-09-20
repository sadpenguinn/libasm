                  global     ft_strdup
                  extern     malloc
                  extern     ft_strlen
                  extern     ft_strcpy

		          section    .text

ft_strdup:                                              ; char *ft_strdup(const char *s);
		          cmp        rdi, 0                     ; Check if ptr is NULL
		          je	 	 ft_strdup_error            ; Return with error if ptr is NULL
		          push	     rdi			            ; Place ptr on the stack, becase ft_strlen will use rdi

		          call       ft_strlen
		          inc		 rax		                ; Add 1 to length for null terminator
		          mov		 rdi, rax               	; Save length to rdi for malloc

		          call       malloc wrt ..plt
		          cmp		 rax, 0		                ; Check the result of malloc
		          je		 ft_strdup_error	     	; If malloc failed, return with error

		          mov        rdi, rax	                ; Save malloc result to rdi for ft_strcpy
		          call       ft_strcpy
		          pop        rdi                        ; Remove first argument from stack and place it back to rdi
		          ret

ft_strdup_error:
		          xor        rax, rax                   ; Nullify return value
		          ret