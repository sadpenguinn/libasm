global ft_strdup
section .text

extern __errno_location
extern ft_strlen
extern ft_strcpy
extern malloc

ft_strdup:
	call ft_strlen
	mov rbx, rdi
	mov rdi, rax
	call malloc
	cmp rax, 0
	je error
	mov rdi, rax
	mov rsi, rbx
	call ft_strcpy
	ret

error:
	call __errno_location
	mov rdi, 12 ;put here the errno value
	mov [rax], rdi
	mov rax, 0
	ret
