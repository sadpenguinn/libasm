                  global     ft_read
                  extern     __errno_location

		          section    .text
ft_read:                                                ; ssize_t ft_read(int fd, void *buf, size_t count)
		          mov		 rax, 0                     ; Systemcall for read
		          syscall                               ; Invoke OS
		          cmp        rax, 0                     ; Compare return value with 0
		          jl 		 ft_read_error              ; If less than 0, jump to error section
		          ret
ft_read_error:
                  neg        rax                        ; Negate rax due to errno expectations
		          mov		 rdi, rax                   ; Move return value to rdi
		          call       __errno_location wrt ..plt ; Call __errno_location, wrt ..plt means the address is relative to the plt
		          mov        [rax], rdi                 ; Move error to the address of rax extracted from __errno_location
		          mov		 rax, -1                    ; Explicitly set return value to -1
                  ret
