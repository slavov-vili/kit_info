global f

f:
	push rbp
	mov rbp, rsp
	cmp rsi, 1
	jbe .l4
	cmp rsi, 2
	jbe .l3
	mov r8, [rdi]
	xor rcx, rcx
	mov rdx, rsi
.l0:
	inc rcx
	cmp rcx, rdx
	jae .l2
	mov rax, [rdi + 8 * rcx]
	cmp rax, r8
	jbe .l0
.l1:
	dec rdx
	cmp rdx, rcx
	jbe .l2
	mov rax, [rdi + 8 * rdx]
	cmp rax, r8
	ja .l1
	mov rax, [rdi + 8 * rcx]
	xchg rax, [rdi + 8 * rdx]
	mov [rdi + 8 * rcx], rax
	jmp .l0
.l2:
	dec rcx
	xchg r8, [rdi + 8 * rcx]
	mov [rdi], r8
	push rdi
	push rsi
	push rcx
	mov rsi, rcx
	call f
	pop rcx
	pop rsi
	pop rdi
	inc rcx
	sub rsi, rcx
	lea rdi, [rdi + rcx * 8]
	call f
	jmp .l4
.l3:
	mov rax, [rdi]
	mov rcx, [rdi + 8]
	cmp rax, rcx
	jbe .l4
	mov [rdi], rcx
	mov [rdi + 8], rax
.l4:
	leave
	ret
	

