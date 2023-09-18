global ft_write
section .text
extern __errno_location

ft_write:
	mov rax, 1
	syscall
	cmp rax, 0
	jl errors
	ret

errors:
	neg rax
	mov rdi, rax
	call __errno_location
	mov [rax], rdi
	mov rax, -1
	ret
