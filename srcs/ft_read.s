global ft_read
section .text
extern __errno_location

ft_read:
	mov rax, 0
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
