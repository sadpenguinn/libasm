                  global     ft_strlen

		          section    .text

ft_strlen:
		          push       rbx                        ; Save rbx to stack by the convention
	              xor        rax, rax                   ; Clear rax
	              jmp        _loop                      ; Jump to _loop

_loop:
	              cmp       [rdi], byte 0               ; Check is the end of the string
	              jz        _end			            ; Jump to _end if we faced the end of the string
	              inc       rax                         ; Increment count
	              inc       rdi                         ; Increment pointer
	              jmp       _loop                       ; Next iteration

_end:
	              pop       rbx                         ; Restore stack to rbx
	              ret
