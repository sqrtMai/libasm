extern __errno_location

section .text
	global ft_read

ft_read:
	mov rax, 0
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
