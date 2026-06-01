extern malloc

section .text
	global ft_list_push_front

ft_list_push_front:
	push rdi
	push rsi

	mov rdi, 16
	call malloc
	pop rsi
	pop rdi
	test rax, rax
	jz .end

	mov [rax], rsi ; ajouter data
	mov rdx, [rdi]
	mov [rax + 8], rdx
	mov [rdi], rax

.end:
	ret
