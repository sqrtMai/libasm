extern __errno_location

section .text
	global ft_write

ft_write:
	mov rax, 1
	syscall
	cmp rax, 0
	js .fail
	ret
.fail:
	neg rax
	mov rdx, rax
	call __errno_location
	mov [rax], edx
	mov rax, -1
	ret

