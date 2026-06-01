extern malloc

section .text
	global ft_list_push_front

ft_list_push_front:
	push rdi
	push rsi

	mov rdi, 16

	call malloc
	test rax, rax
	jz .end

	pop rsi
	pop rdi

	mov rdx, [rdi]
	mov [rax + 8], rdx
	mov [rax], rsi
	mov [rdi], rax

.end:
	ret
