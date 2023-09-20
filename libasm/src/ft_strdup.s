                  global     ft_strdup
                  extern     malloc
                  extern     ft_strlen
                  extern     ft_strcpy

		          section    .text

ft_strdup:
		          cmp        rdi, 0                     ; Check if ptr is NULL
		          je	 	 ft_strdup_error            ; Return with error if ptr is NULL
		          push	     rdi			            ; Place ptr on the stack, becase ft_strlen can use rdi
		          jmp        ft_strdup_length

ft_strdup_length:
		          call       ft_strlen
		          inc		 rax		                ; Add 1 to length for null terminator
		          mov		 rdi, rax               	; Save length to rdi for malloc
		          jmp        ft_strdup_alloc

ft_strdup_alloc:
		          call       malloc wrt ..plt
		          pop		 rsi			            ; Remove first argument from stack and place it on next register
		          cmp		 rax, 0		                ; Check the result of malloc
		          je		 ft_strdup_error	     	; If malloc failed, return with error
		          jmp        ft_strdup_copy

ft_strdup_copy:
		          mov        rdi, rax	                ; Save malloc result to rdi for return
		          push       rdx			; Stack alignment
		          call       ft_strcpy
		          pop        rdx			; Stack alignment
		          ret

ft_strdup_error:
		          xor        rax, rax
		          ret