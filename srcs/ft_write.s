                  global     ft_write
                  extern     __errno_location

		          section    .text
ft_write:
		          push       rbx                        ; Save rbx to stack by the convention
		          mov		 rax, 1                     ; Systemcall for write
		          syscall                               ; Invoke OS
		          cmp        rax, 0                     ; Compare return value with 0
		          jl 		 ft_write_error             ; If less than 0, jump to error section
		          pop        rbx                        ; Restore stack to rbx
		          ret
ft_write_error:
                  neg        rax                        ; Negate rax due to errno expectations
		          mov		 rdi, rax                   ; Move return value to rdi
		          call       __errno_location wrt ..plt ; Call __errno_location, wrt ..plt means the address is relative to the plt
		          mov        [rax], rdi                 ; Move edo to the address of rax extracted from __errno_location
		          mov		 rax, -1                    ; Explicitly set return value to -1
		          pop        rbx                        ; Restore stack to rbx
                  ret
