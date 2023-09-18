section .text
global ft_strcmp

ft_strcmp:
	mov rcx, 0
	mov rax, 0

loop:
	mov cl, [rdi]
	mov al, [rsi]
	inc rdi
	inc rsi
	jmp check

check:
	cmp cl, 0
	je ret_diff
	cmp al, cl
	je loop
	jne ret_diff

ret_diff:
	sub al, cl
	jc correct_overflow
	neg rax
	ret

correct_overflow:
	mov dl, 255
	sub dl, al
	mov al, dl
	inc rax
	ret
