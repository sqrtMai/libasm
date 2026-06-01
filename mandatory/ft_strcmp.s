section .text
	global ft_strcmp

ft_strcmp:
	xor rax, rax

.loop:
	mov bl, [rdi + rax]
	mov dl, [rsi + rax]

	cmp bl, dl
	jne .diff

	cmp bl, 0
	je .end

	inc rax
	jmp .loop

.diff:
	movzx ebx, bl
	movzx edx, dl
	sub  ebx, edx
	mov rax, ebx
	ret
.end:
	xor rax, rax
	ret

