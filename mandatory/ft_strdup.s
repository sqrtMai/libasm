global _start
extern malloc

section .data
	msg db "Hello"

section .text

ft_strlen:
	xor rax, rax
.loop:
	cmp byte [rdi + rax], 0
	je .end
	inc rax
	jmp .loop
.end:
	ret

ft_strdup:
	call ft_strlen
	cmp rax, 0
	je .ret

	push rdi
	mov rdi, rax
	add rdi, 1

	call malloc
	pop rdi
	cmp rax, 0
	je .ret

	xor rdx, rdx
.loop:
	cmp byte [rdi + rdx], 0
	je .end

	mov bl, [rdi + rdx]
	mov [rax + rdx], bl
	inc rdx
	jmp .loop
.ret:
	ret
.end:
	mov byte [rax + rdx], 0
	ret

_start:
	mov rdi, msg
	call ft_strdup
	mov rbx, rax
	mov rax, 1
	mov rdi, 1
	mov rsi, rbx
	mov rdx, 5
	syscall
	mov rax, 60
	mov rdi, 0
	syscall
