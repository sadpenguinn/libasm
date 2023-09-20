                  global     ft_strcmp

		          section    .text

ft_strcmp:
		          push       rbx                        ; Save rbx to stack by the convention
	              xor        rax, rax                   ; Clear rax
	              ;xor        rcx, rcx                   ; Clear rcx
	              jmp        _loop                      ; Jump to _loop

_loop:
	              mov        cl, [rdi]                  ; Move byte from rdi to cl (ecx)
	              mov        al, [rsi]                  ; Move byte from rsi to al (eax)
	              inc        rdi                        ; Increment first pointer
	              inc        rsi                        ; Increment second pointer
	              jmp        ft_strcmp_compare

ft_strcmp_compare:
	              cmp        cl, 0                      ; Check if we faced end of the first string
	              je         ft_strcmp_diff
	              cmp        al, cl
	              je         _loop
	              jne        ft_strcmp_diff

ft_strcmp_diff:
	              sub        al, cl                      ; cl - al
	              jc         ft_strcmp_overflow          ; If JC is set, then the subtraction resulted in a borrow
	              neg        rax                         ; Negate the result, the first string is less than the second
	              pop        rbx                         ; Restore stack to rbx
	              ret

ft_strcmp_overflow:
	mov dl, 255 ; 0xFF Maximum value of a byte
	sub dl, al ; 0xFF - al
	mov al, dl ; Move the result to al
	inc rax
		              pop        rbx                         ; Restore stack to rbx
	ret
