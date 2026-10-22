hjhhjhjhsection .text
	global ft_list_remove_if


;	rdi =	t_list **begin_list
;	rsi =	void *data_ref
;	rdx =	int cmp()
;	rcx =	void free_fct(void *param)


check_first_node:

	mov r12, rdi
	mov r13, rsi
	mov r14, rdx
	mov r15, rcx

	mov rax, [rdi]
	mov rdi, [rax]

	call rdx

	mov rdi, r12
	mov rsi, r13
	mov rdx, r14
	mov rcx, r15

	ret

point_first_to_next:

	mov r12, rdi

	mov rbx, [rdi]
	cmp byte [rbx + 8], 0
	je .remove_and_return
	mov rdi, [rbx + 8]

	mov r12, rdi

.remove_and_return:
	mov rdi, rbx
	call rcx
	mov rdi, r12
	ret

ft_list_remove_if:
	cmp byte [rdi], 0
	je .end
	call check_first_node
	test rax, rax
	jz .remove_first
	; jmp .remove_other

.remove_first:
	call point_first_to_next
; .remove_other:

.end:
	ret
