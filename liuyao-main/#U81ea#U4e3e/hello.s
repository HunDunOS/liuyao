# 由 六爻(liuyao) 编译器 lyc 生成
	.intel_syntax noprefix

	.section .text
	.globl fn__e4_b8_bb
fn__e4_b8_bb:
	push rbp
	mov rbp, rsp
	mov rax, 0
	mov rax, 65
	push rax
	call fn__rt_putc
	add rsp, 8
	mov rax, 10
	push rax
	call fn__rt_putc
	add rsp, 8
	mov rax, 0
	jmp .Lret__e4_b8_bb
.Lret__e4_b8_bb:
	mov rsp, rbp
	pop rbp
	ret
