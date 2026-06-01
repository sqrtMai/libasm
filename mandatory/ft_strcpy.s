section .text:
	global ft_strcpy

ft_strcpy:
	xor rax, rax
.loop:
	mov dl, [rsi + rax] ; rsi = src
	mov [rdi + rax], dl ; rdi = dest
	cmp dl, 0
	je .end
	inc rax
	jmp .loop
.end:
	mov rax, rdi
	ret
