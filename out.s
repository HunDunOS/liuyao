# 由 六爻(liuyao) 编译器 lyc 生成
	.intel_syntax noprefix
	.section .multiboot, "a"
	.align 4
	.long 0x1BADB002
	.long 0x00000000
	.long 0xE4524FFE

	.section .text
	.globl _start
_start:
	mov rsp, offset _kernel_stack_top
	call _gfx_init
	call _rt_cls
	call fn__e4_b8_bb
.Lhang:
	cli
	hlt
	jmp .Lhang
	.globl fn__e4_b8_b2_e9_95_bf
fn__e4_b8_b2_e9_95_bf:
	push rbp
	mov rbp, rsp
	sub rsp, 64
	mov rax, 0
	mov rax, 0
	mov [rbp-64], rax
.Lltop1:
	lea rax, [rbp-64]
	mov rax, [rax]
	push rax
	mov rax, 65536
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse3
	jmp .Llend2
.Lelse3:
	lea rax, [rbp+16]
	mov rax, [rax]
	push rax
	lea rax, [rbp-64]
	mov rax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-32], rax
	lea rax, [rbp-32]
	mov rax, [rax]
	mov rax, [rax]
	mov [rbp-48], rax
	lea rax, [rbp-48]
	mov rax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse4
	jmp .Llend2
.Lelse4:
	lea rax, [rbp-64]
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-64], rax
	jmp .Lltop1
.Llend2:
	lea rax, [rbp-64]
	mov rax, [rax]
	jmp .Lret__e4_b8_b2_e9_95_bf
.Lret__e4_b8_b2_e9_95_bf:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn_is_digit
fn_is_digit:
	push rbp
	mov rbp, rsp
	mov rax, 0
	lea rax, [rbp+16]
	mov rax, [rax]
	push rax
	mov rax, 48
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setae al
	movzx rax, al
	test rax, rax
	jz .Lelse5
	lea rax, [rbp+16]
	mov rax, [rax]
	push rax
	mov rax, 57
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setbe al
	movzx rax, al
	test rax, rax
	jz .Lelse6
	mov rax, 1
	jmp .Lret_is_digit
.Lelse6:
.Lelse5:
	mov rax, 0
	jmp .Lret_is_digit
.Lret_is_digit:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn_is_alpha
fn_is_alpha:
	push rbp
	mov rbp, rsp
	mov rax, 0
	lea rax, [rbp+16]
	mov rax, [rax]
	push rax
	mov rax, 97
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setae al
	movzx rax, al
	test rax, rax
	jz .Lelse7
	lea rax, [rbp+16]
	mov rax, [rax]
	push rax
	mov rax, 122
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setbe al
	movzx rax, al
	test rax, rax
	jz .Lelse8
	mov rax, 1
	jmp .Lret_is_alpha
.Lelse8:
.Lelse7:
	lea rax, [rbp+16]
	mov rax, [rax]
	push rax
	mov rax, 65
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setae al
	movzx rax, al
	test rax, rax
	jz .Lelse9
	lea rax, [rbp+16]
	mov rax, [rax]
	push rax
	mov rax, 90
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setbe al
	movzx rax, al
	test rax, rax
	jz .Lelse10
	mov rax, 1
	jmp .Lret_is_alpha
.Lelse10:
.Lelse9:
	lea rax, [rbp+16]
	mov rax, [rax]
	push rax
	mov rax, 95
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse11
	mov rax, 1
	jmp .Lret_is_alpha
.Lelse11:
	mov rax, 0
	jmp .Lret_is_alpha
.Lret_is_alpha:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn_skip_ws
fn_skip_ws:
	push rbp
	mov rbp, rsp
	sub rsp, 96
	mov rax, 0
.Lltop12:
	lea rax, [rbp-80]
	mov rax, [rax]
	push rax
	mov rax, offset g_g_srclen
	mov rax, [rax]
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse14
	jmp .Llend13
.Lelse14:
	mov rax, offset g_g_src
	mov rax, [rax]
	push rax
	lea rax, [rbp-80]
	mov rax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 255
	mov rcx, rax
	pop rax
	and rax, rcx
	mov rax, [rax]
	mov [rbp-16], rax
	lea rax, [rbp-16]
	mov rax, [rax]
	push rax
	mov rax, 32
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse15
	lea rax, [rbp-80]
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-80], rax
.Lelse15:
	lea rax, [rbp-16]
	mov rax, [rax]
	push rax
	mov rax, 9
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse16
	lea rax, [rbp-80]
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-80], rax
.Lelse16:
	lea rax, [rbp-16]
	mov rax, [rax]
	push rax
	mov rax, 13
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse17
	lea rax, [rbp-80]
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-80], rax
.Lelse17:
	lea rax, [rbp-16]
	mov rax, [rax]
	push rax
	mov rax, 10
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse18
	lea rax, [rbp-80]
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-80], rax
	lea rax, [rbp-96]
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-96], rax
.Lelse18:
	lea rax, [rbp-16]
	mov rax, [rax]
	push rax
	mov rax, 32
	mov rcx, rax
	pop rax
	cmp rax, rcx
	je .Lelse19
	lea rax, [rbp-16]
	mov rax, [rax]
	push rax
	mov rax, 9
	mov rcx, rax
	pop rax
	cmp rax, rcx
	je .Lelse20
	lea rax, [rbp-16]
	mov rax, [rax]
	push rax
	mov rax, 13
	mov rcx, rax
	pop rax
	cmp rax, rcx
	je .Lelse21
	lea rax, [rbp-16]
	mov rax, [rax]
	push rax
	mov rax, 10
	mov rcx, rax
	pop rax
	cmp rax, rcx
	je .Lelse22
	jmp .Llend13
.Lelse22:
.Lelse21:
.Lelse20:
.Lelse19:
	jmp .Lltop12
.Llend13:
	mov rax, 0
	jmp .Lret_skip_ws
.Lret_skip_ws:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn_next_tok
fn_next_tok:
	push rbp
	mov rbp, rsp
	sub rsp, 432
	mov rax, 0
	push offset .Lstr0
	call _rt_puts
	add rsp, 8
	lea rax, [rbp-432]
	mov rax, [rax]
	push rax
	call _rt_puti
	add rsp, 8
	push offset .Lstr1
	call _rt_puts
	add rsp, 8
	call fn_skip_ws
	push offset .Lstr2
	call _rt_puts
	add rsp, 8
	lea rax, [rbp-432]
	mov rax, [rax]
	push rax
	call _rt_puti
	add rsp, 8
	push offset .Lstr3
	call _rt_puts
	add rsp, 8
	lea rax, [rbp-432]
	mov rax, [rax]
	push rax
	mov rax, offset g_g_srclen
	mov rax, [rax]
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse23
	mov rax, 0
	mov [rbp-400], rax
	mov rax, 0
	jmp .Lret_next_tok
.Lelse23:
	mov rax, offset g_g_src
	mov rax, [rax]
	push rax
	lea rax, [rbp-432]
	mov rax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 255
	mov rcx, rax
	pop rax
	and rax, rcx
	mov rax, [rax]
	mov [rbp-32], rax
	lea rax, [rbp-32]
	mov rax, [rax]
	push rax
	call fn_is_digit
	add rsp, 8
	test rax, rax
	jz .Lelse24
	mov rax, 0
	mov [rbp-96], rax
.Lltop25:
	lea rax, [rbp-432]
	mov rax, [rax]
	push rax
	mov rax, offset g_g_srclen
	mov rax, [rax]
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse27
	jmp .Llend26
.Lelse27:
	mov rax, offset g_g_src
	mov rax, [rax]
	push rax
	lea rax, [rbp-432]
	mov rax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 255
	mov rcx, rax
	pop rax
	and rax, rcx
	mov rax, [rax]
	mov [rbp-64], rax
	lea rax, [rbp-64]
	mov rax, [rax]
	push rax
	call fn_is_digit
	add rsp, 8
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse28
	jmp .Llend26
.Lelse28:
	lea rax, [rbp-96]
	mov rax, [rax]
	push rax
	mov rax, 10
	mov rcx, rax
	pop rax
	imul rax, rcx
	mov [rbp-96], rax
	lea rax, [rbp-96]
	mov rax, [rax]
	push rax
	lea rax, [rbp-64]
	mov rax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 48
	mov rcx, rax
	pop rax
	sub rax, rcx
	mov [rbp-96], rax
	lea rax, [rbp-432]
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-432], rax
	jmp .Lltop25
.Llend26:
	mov rax, 1
	mov [rbp-400], rax
	lea rax, [rbp-96]
	mov rax, [rax]
	mov [rbp-416], rax
	mov rax, 1
	jmp .Lret_next_tok
.Lelse24:
	lea rax, [rbp-32]
	mov rax, [rax]
	push rax
	mov rax, 34
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse29
	lea rax, [rbp-432]
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-432], rax
	lea rax, [rbp-432]
	mov rax, [rax]
	mov [rbp-288], rax
.Lltop30:
	lea rax, [rbp-432]
	mov rax, [rax]
	push rax
	mov rax, offset g_g_srclen
	mov rax, [rax]
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse32
	jmp .Llend31
.Lelse32:
	mov rax, offset g_g_src
	mov rax, [rax]
	push rax
	lea rax, [rbp-432]
	mov rax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 255
	mov rcx, rax
	pop rax
	and rax, rcx
	mov rax, [rax]
	mov [rbp-304], rax
	lea rax, [rbp-304]
	mov rax, [rax]
	push rax
	mov rax, 34
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse33
	jmp .Llend31
.Lelse33:
	lea rax, [rbp-432]
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-432], rax
	jmp .Lltop30
.Llend31:
	mov rax, 2
	mov [rbp-400], rax
	lea rax, [rbp-288]
	mov rax, [rax]
	mov [rbp-368], rax
	lea rax, [rbp-432]
	mov rax, [rax]
	push rax
	lea rax, [rbp-288]
	mov rax, [rax]
	mov rcx, rax
	pop rax
	sub rax, rcx
	mov [rbp-384], rax
	lea rax, [rbp-432]
	mov rax, [rax]
	push rax
	mov rax, offset g_g_srclen
	mov rax, [rax]
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setb al
	movzx rax, al
	test rax, rax
	jz .Lelse34
	lea rax, [rbp-432]
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-432], rax
.Lelse34:
	mov rax, 1
	jmp .Lret_next_tok
.Lelse29:
	lea rax, [rbp-32]
	mov rax, [rax]
	push rax
	call fn_is_alpha
	add rsp, 8
	test rax, rax
	jz .Lelse35
	lea rax, [rbp-432]
	mov rax, [rax]
	mov [rbp-288], rax
.Lltop36:
	lea rax, [rbp-432]
	mov rax, [rax]
	push rax
	mov rax, offset g_g_srclen
	mov rax, [rax]
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse38
	jmp .Llend37
.Lelse38:
	mov rax, offset g_g_src
	mov rax, [rax]
	push rax
	lea rax, [rbp-432]
	mov rax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 255
	mov rcx, rax
	pop rax
	and rax, rcx
	mov rax, [rax]
	mov [rbp-304], rax
	lea rax, [rbp-304]
	mov rax, [rax]
	push rax
	call fn_is_alpha
	add rsp, 8
	test rax, rax
	jz .Lelse39
	lea rax, [rbp-432]
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-432], rax
.Lelse39:
	lea rax, [rbp-304]
	mov rax, [rax]
	push rax
	call fn_is_digit
	add rsp, 8
	test rax, rax
	jz .Lelse40
	lea rax, [rbp-432]
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-432], rax
.Lelse40:
	lea rax, [rbp-304]
	mov rax, [rax]
	push rax
	call fn_is_alpha
	add rsp, 8
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse41
	lea rax, [rbp-304]
	mov rax, [rax]
	push rax
	call fn_is_digit
	add rsp, 8
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse42
	jmp .Llend37
.Lelse42:
.Lelse41:
	jmp .Lltop36
.Llend37:
	mov rax, 3
	mov [rbp-400], rax
	lea rax, [rbp-288]
	mov rax, [rax]
	mov [rbp-368], rax
	lea rax, [rbp-432]
	mov rax, [rax]
	push rax
	lea rax, [rbp-288]
	mov rax, [rax]
	mov rcx, rax
	pop rax
	sub rax, rcx
	mov [rbp-384], rax
	mov rax, 1
	jmp .Lret_next_tok
.Lelse35:
	mov rax, 5
	mov [rbp-400], rax
	lea rax, [rbp-32]
	mov rax, [rax]
	mov [rbp-416], rax
	lea rax, [rbp-432]
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-432], rax
	mov rax, 1
	jmp .Lret_next_tok
.Lret_next_tok:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn_emit
fn_emit:
	push rbp
	mov rbp, rsp
	sub rsp, 96
	mov rax, 0
	lea rax, [rbp+16]
	mov rax, [rax]
	push rax
	call fn__e4_b8_b2_e9_95_bf
	add rsp, 8
	mov [rbp-16], rax
	mov rax, 0
	mov [rbp-96], rax
.Lltop43:
	lea rax, [rbp-96]
	mov rax, [rax]
	push rax
	lea rax, [rbp-16]
	mov rax, [rax]
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse45
	jmp .Llend44
.Lelse45:
	lea rax, [rbp+16]
	mov rax, [rax]
	push rax
	lea rax, [rbp-96]
	mov rax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-48], rax
	lea rax, [rbp-48]
	mov rax, [rax]
	mov rax, [rax]
	mov [rbp-64], rax
	mov rax, offset g_g_out
	lea rax, [rbp-80]
	mov rax, [rax]
	cmp rax, 65536
	jb .Lbok46
	call _rt_oob
.Lbok46:
	imul rax, 8
	push rax
	mov rax, offset g_g_out
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-64]
	mov rax, [rax]
	mov rcx, rax
	pop rax
	mov [rax], rcx
	lea rax, [rbp-80]
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-80], rax
	lea rax, [rbp-96]
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-96], rax
	jmp .Lltop43
.Llend44:
	mov rax, 0
	jmp .Lret_emit
.Lret_emit:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn_emit_num
fn_emit_num:
	push rbp
	mov rbp, rsp
	sub rsp, 384
	mov rax, 0
	mov rax, 0
	mov [rbp-368], rax
	lea rax, [rbp+16]
	mov rax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse47
	lea rax, [rbp-256]
	mov rax, 0
	cmp rax, 16
	jb .Lbok48
	call _rt_oob
.Lbok48:
	imul rax, 8
	push rax
	lea rax, [rbp-256]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 48
	mov rcx, rax
	pop rax
	mov [rax], rcx
	mov rax, 1
	mov [rbp-368], rax
.Lelse47:
.Lltop49:
	lea rax, [rbp+16]
	mov rax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse51
	jmp .Llend50
.Lelse51:
	lea rax, [rbp+16]
	mov rax, [rax]
	push rax
	mov rax, 10
	mov rcx, rax
	pop rax
	xor rdx, rdx
	div rcx
	mov rax, rdx
	mov [rbp-320], rax
	lea rax, [rbp-320]
	mov rax, [rax]
	push rax
	mov rax, 48
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-320], rax
	lea rax, [rbp-256]
	lea rax, [rbp-368]
	mov rax, [rax]
	cmp rax, 16
	jb .Lbok52
	call _rt_oob
.Lbok52:
	imul rax, 8
	push rax
	lea rax, [rbp-256]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-320]
	mov rax, [rax]
	mov rcx, rax
	pop rax
	mov [rax], rcx
	lea rax, [rbp+16]
	mov rax, [rax]
	push rax
	mov rax, 10
	mov rcx, rax
	pop rax
	xor rdx, rdx
	div rcx
	mov [rbp+16], rax
	lea rax, [rbp-368]
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-368], rax
	jmp .Lltop49
.Llend50:
.Lltop53:
	lea rax, [rbp-368]
	mov rax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse55
	jmp .Llend54
.Lelse55:
	lea rax, [rbp-368]
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	sub rax, rcx
	mov [rbp-368], rax
	mov rax, offset g_g_out
	lea rax, [rbp-384]
	mov rax, [rax]
	cmp rax, 65536
	jb .Lbok56
	call _rt_oob
.Lbok56:
	imul rax, 8
	push rax
	mov rax, offset g_g_out
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-256]
	lea rax, [rbp-368]
	mov rax, [rax]
	cmp rax, 16
	jb .Lbok57
	call _rt_oob
.Lbok57:
	imul rax, 8
	push rax
	lea rax, [rbp-256]
	mov rcx, rax
	pop rax
	add rax, rcx
	mov rax, [rax]
	mov rcx, rax
	pop rax
	mov [rax], rcx
	lea rax, [rbp-384]
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-384], rax
	jmp .Lltop53
.Llend54:
	mov rax, 0
	jmp .Lret_emit_num
.Lret_emit_num:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn_parse_expr
fn_parse_expr:
	push rbp
	mov rbp, rsp
	sub rsp, 80
	mov rax, 0
	mov rax, offset g_tok_type
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse58
	mov rax, offset .Lstr4
	push rax
	call fn_emit
	add rsp, 8
	mov rax, offset g_tok_val
	mov rax, [rax]
	push rax
	call fn_emit_num
	add rsp, 8
	mov rax, offset .Lstr5
	push rax
	call fn_emit
	add rsp, 8
	call fn_next_tok
.Lelse58:
	mov rax, offset g_tok_type
	mov rax, [rax]
	push rax
	mov rax, 3
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse59
	mov rax, 0
	mov [rbp-64], rax
	mov rax, 0
	mov [rbp-48], rax
.Lltop60:
	lea rax, [rbp-64]
	mov rax, [rax]
	push rax
	mov rax, offset g_g_nvars
	mov rax, [rax]
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse62
	jmp .Llend61
.Lelse62:
	mov rax, offset g_g_vname
	lea rax, [rbp-64]
	mov rax, [rax]
	cmp rax, 64
	jb .Lbok63
	call _rt_oob
.Lbok63:
	imul rax, 8
	push rax
	mov rax, offset g_g_vname
	mov rcx, rax
	pop rax
	add rax, rcx
	mov rax, [rax]
	push rax
	mov rax, offset g_tok_str
	mov rax, [rax]
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse64
	mov rax, 1
	mov [rbp-48], rax
	jmp .Llend61
.Lelse64:
	lea rax, [rbp-64]
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-64], rax
	jmp .Lltop60
.Llend61:
	lea rax, [rbp-48]
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse65
	mov rax, offset g_g_voff
	lea rax, [rbp-64]
	mov rax, [rax]
	cmp rax, 64
	jb .Lbok66
	call _rt_oob
.Lbok66:
	imul rax, 8
	push rax
	mov rax, offset g_g_voff
	mov rcx, rax
	pop rax
	add rax, rcx
	mov rax, [rax]
	mov [rbp-80], rax
	mov rax, offset .Lstr6
	push rax
	call fn_emit
	add rsp, 8
	lea rax, [rbp-80]
	mov rax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setae al
	movzx rax, al
	test rax, rax
	jz .Lelse67
	mov rax, offset .Lstr7
	push rax
	call fn_emit
	add rsp, 8
.Lelse67:
	lea rax, [rbp-80]
	mov rax, [rax]
	push rax
	call fn_emit_num
	add rsp, 8
	mov rax, offset .Lstr8
	push rax
	call fn_emit
	add rsp, 8
.Lelse65:
	call fn_next_tok
.Lelse59:
.Lltop68:
	mov rax, offset g_tok_type
	mov rax, [rax]
	push rax
	mov rax, 5
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse70
	mov rax, offset g_tok_val
	mov rax, [rax]
	push rax
	mov rax, 43
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse71
	call fn_next_tok
	mov rax, offset .Lstr9
	push rax
	call fn_emit
	add rsp, 8
	call fn_parse_expr
	mov rax, offset .Lstr10
	push rax
	call fn_emit
	add rsp, 8
.Lelse71:
.Lelse70:
	mov rax, offset g_tok_type
	mov rax, [rax]
	push rax
	mov rax, 5
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse72
	mov rax, offset g_tok_val
	mov rax, [rax]
	push rax
	mov rax, 43
	mov rcx, rax
	pop rax
	cmp rax, rcx
	je .Lelse73
	jmp .Llend69
.Lelse73:
.Lelse72:
	mov rax, offset g_tok_type
	mov rax, [rax]
	push rax
	mov rax, 5
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .Lelse74
	jmp .Llend69
.Lelse74:
	jmp .Lltop68
.Llend69:
	mov rax, 0
	jmp .Lret_parse_expr
.Lret_parse_expr:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn_parse_stmt
fn_parse_stmt:
	push rbp
	mov rbp, rsp
	sub rsp, 128
	mov rax, 0
	mov rax, offset g_tok_type
	mov rax, [rax]
	push rax
	mov rax, 3
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .Lelse75
	mov rax, 0
	jmp .Lret_parse_stmt
.Lelse75:
	mov rax, offset g_tok_len
	mov rax, [rax]
	push rax
	mov rax, 2
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .Lelse76
	mov rax, 0
	jmp .Lret_parse_stmt
.Lelse76:
	mov rax, offset g_tok_str
	mov rax, [rax]
	mov rax, [rax]
	mov [rbp-16], rax
	mov rax, offset g_tok_str
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov rax, [rax]
	mov [rbp-32], rax
	lea rax, [rbp-16]
	mov rax, [rax]
	push rax
	mov rax, 115
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse77
	lea rax, [rbp-32]
	mov rax, [rax]
	push rax
	mov rax, 116
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse78
	call fn_next_tok
	mov rax, offset g_tok_type
	mov rax, [rax]
	push rax
	mov rax, 3
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse79
	mov rax, offset g_tok_len
	mov rax, [rax]
	push rax
	mov rax, 2
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse80
	mov rax, offset g_tok_str
	mov rax, [rax]
	mov rax, [rax]
	mov [rbp-48], rax
	mov rax, offset g_tok_str
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov rax, [rax]
	mov [rbp-64], rax
	lea rax, [rbp-48]
	mov rax, [rax]
	push rax
	mov rax, 100
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse81
	lea rax, [rbp-64]
	mov rax, [rax]
	push rax
	mov rax, 116
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse82
	call fn_next_tok
	call fn_parse_expr
	mov rax, offset .Lstr11
	push rax
	call fn_emit
	add rsp, 8
	mov rax, 0
	jmp .Lret_parse_stmt
.Lelse82:
.Lelse81:
	lea rax, [rbp-48]
	mov rax, [rax]
	push rax
	mov rax, 100
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse83
	lea rax, [rbp-64]
	mov rax, [rax]
	push rax
	mov rax, 100
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse84
	call fn_next_tok
	mov rax, offset g_tok_type
	mov rax, [rax]
	push rax
	mov rax, 2
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse85
	mov rax, offset .Lstr12
	push rax
	call fn_emit
	add rsp, 8
	call fn_next_tok
.Lelse85:
	mov rax, 0
	jmp .Lret_parse_stmt
.Lelse84:
.Lelse83:
.Lelse80:
.Lelse79:
	mov rax, 0
	jmp .Lret_parse_stmt
.Lelse78:
.Lelse77:
	lea rax, [rbp-16]
	mov rax, [rax]
	push rax
	mov rax, 116
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse86
	lea rax, [rbp-32]
	mov rax, [rax]
	push rax
	mov rax, 122
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse87
	call fn_next_tok
	mov rax, offset g_tok_type
	mov rax, [rax]
	push rax
	mov rax, 3
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse88
	lea rax, [rbp-112]
	mov rax, [rax]
	mov [rbp-80], rax
	mov rax, offset g_g_vname
	lea rax, [rbp-80]
	mov rax, [rax]
	cmp rax, 64
	jb .Lbok89
	call _rt_oob
.Lbok89:
	imul rax, 8
	push rax
	mov rax, offset g_g_vname
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, offset g_tok_str
	mov rax, [rax]
	mov rcx, rax
	pop rax
	mov [rax], rcx
	lea rax, [rbp-96]
	mov rax, [rax]
	push rax
	mov rax, 16
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-96], rax
	mov rax, offset g_g_voff
	lea rax, [rbp-80]
	mov rax, [rax]
	cmp rax, 64
	jb .Lbok90
	call _rt_oob
.Lbok90:
	imul rax, 8
	push rax
	mov rax, offset g_g_voff
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-96]
	mov rax, [rax]
	mov rcx, rax
	pop rax
	mov [rax], rcx
	lea rax, [rbp-112]
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-112], rax
	call fn_next_tok
	mov rax, offset g_tok_type
	mov rax, [rax]
	push rax
	mov rax, 5
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse91
	mov rax, offset g_tok_val
	mov rax, [rax]
	push rax
	mov rax, 61
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse92
	call fn_next_tok
	call fn_parse_expr
	mov rax, offset .Lstr13
	push rax
	call fn_emit
	add rsp, 8
	mov rax, offset g_g_voff
	lea rax, [rbp-80]
	mov rax, [rax]
	cmp rax, 64
	jb .Lbok93
	call _rt_oob
.Lbok93:
	imul rax, 8
	push rax
	mov rax, offset g_g_voff
	mov rcx, rax
	pop rax
	add rax, rcx
	mov rax, [rax]
	mov [rbp-128], rax
	lea rax, [rbp-128]
	mov rax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setae al
	movzx rax, al
	test rax, rax
	jz .Lelse94
	mov rax, offset .Lstr14
	push rax
	call fn_emit
	add rsp, 8
.Lelse94:
	lea rax, [rbp-128]
	mov rax, [rax]
	push rax
	call fn_emit_num
	add rsp, 8
	mov rax, offset .Lstr15
	push rax
	call fn_emit
	add rsp, 8
.Lelse92:
.Lelse91:
.Lelse88:
	mov rax, 0
	jmp .Lret_parse_stmt
.Lelse87:
.Lelse86:
	lea rax, [rbp-16]
	mov rax, [rax]
	push rax
	mov rax, 122
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse95
	lea rax, [rbp-32]
	mov rax, [rax]
	push rax
	mov rax, 122
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse96
	call fn_next_tok
	mov rax, offset g_tok_type
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse97
	mov rax, offset .Lstr16
	push rax
	call fn_emit
	add rsp, 8
	mov rax, offset g_tok_val
	mov rax, [rax]
	push rax
	call fn_emit_num
	add rsp, 8
	mov rax, offset .Lstr17
	push rax
	call fn_emit
	add rsp, 8
	call fn_next_tok
.Lelse97:
	mov rax, offset .Lstr18
	push rax
	call fn_emit
	add rsp, 8
	mov rax, 0
	jmp .Lret_parse_stmt
.Lelse96:
.Lelse95:
	call fn_next_tok
	mov rax, 0
	jmp .Lret_parse_stmt
.Lret_parse_stmt:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn__e4_b8_bb
fn__e4_b8_bb:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov rax, 0
	push offset .Lstr19
	call _rt_puts
	add rsp, 8
	mov rax, 0
	mov [g_g_pos], rax
	mov rax, 1
	mov [g_g_line], rax
	mov rax, 0
	mov [g_g_nvars], rax
	mov rax, 0
	mov [g_g_framesz], rax
	mov rax, 0
	mov [g_g_outpos], rax
	mov rax, offset .Lstr20
	mov [rbp-16], rax
	lea rax, [rbp-16]
	mov rax, [rax]
	mov [g_g_src], rax
	lea rax, [rbp-16]
	mov rax, [rax]
	push rax
	call fn__e4_b8_b2_e9_95_bf
	add rsp, 8
	mov [g_g_srclen], rax
	push offset .Lstr21
	call _rt_puts
	add rsp, 8
	mov rax, offset g_g_srclen
	mov rax, [rax]
	push rax
	call _rt_puti
	add rsp, 8
	push offset .Lstr22
	call _rt_puts
	add rsp, 8
	mov rax, offset g_g_src
	mov rax, [rax]
	push rax
	call _rt_puti
	add rsp, 8
	push offset .Lstr23
	call _rt_puts
	add rsp, 8
	mov rax, offset g_g_src
	mov rax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	add rax, rcx
	mov rax, [rax]
	mov [rbp-32], rax
	lea rax, [rbp-32]
	mov rax, [rax]
	push rax
	call _rt_puti
	add rsp, 8
	push offset .Lstr24
	call _rt_puts
	add rsp, 8
	push offset .Lstr25
	call _rt_puts
	add rsp, 8
	mov rax, offset g_g_srclen
	mov rax, [rax]
	push rax
	call _rt_puti
	add rsp, 8
	push offset .Lstr26
	call _rt_puts
	add rsp, 8
	mov rax, offset .Lstr27
	push rax
	call fn_emit
	add rsp, 8
	call fn_next_tok
	push offset .Lstr28
	call _rt_puts
	add rsp, 8
	mov rax, offset g_tok_type
	mov rax, [rax]
	push rax
	call _rt_puti
	add rsp, 8
	push offset .Lstr29
	call _rt_puts
	add rsp, 8
.Lltop98:
	mov rax, offset g_tok_type
	mov rax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse100
	jmp .Llend99
.Lelse100:
	call fn_parse_stmt
	jmp .Lltop98
.Llend99:
	mov rax, offset .Lstr30
	push rax
	call fn_emit
	add rsp, 8
	mov rax, offset g_g_framesz
	mov rax, [rax]
	push rax
	call fn_emit_num
	add rsp, 8
	mov rax, offset .Lstr31
	push rax
	call fn_emit
	add rsp, 8
	push offset .Lstr32
	call _rt_puts
	add rsp, 8
	mov rax, offset g_g_outpos
	mov rax, [rax]
	push rax
	call _rt_puti
	add rsp, 8
	push offset .Lstr33
	call _rt_puts
	add rsp, 8
	mov rax, 1
	push rax
	mov rax, offset g_g_out
	push rax
	mov rax, offset g_g_outpos
	mov rax, [rax]
	mov rdx, rax
	pop rsi
	pop rdi
	mov rax, 1
	syscall
	mov rax, 0
	jmp .Lret__e4_b8_bb
.Lret__e4_b8_bb:
	mov rsp, rbp
	pop rbp
	ret

	.section .bss
	.align 4
g_g_src:
	.space 8
g_g_srclen:
	.space 8
g_g_pos:
	.space 8
g_g_line:
	.space 8
g_tok_type:
	.space 8
g_tok_val:
	.space 8
g_tok_str:
	.space 8
g_tok_len:
	.space 8
g_g_out:
	.space 524288
g_g_outpos:
	.space 8
g_g_nvars:
	.space 8
g_g_framesz:
	.space 8
g_g_vname:
	.space 512
g_g_voff:
	.space 512

	.section .rodata
.Lstr0:
	.asciz "next_tok enter pos="
.Lstr1:
	.asciz "\n"
.Lstr2:
	.asciz "after skip_ws pos="
.Lstr3:
	.asciz "\n"
.Lstr4:
	.asciz "mov rax, "
.Lstr5:
	.asciz "\n"
.Lstr6:
	.asciz "mov rax, [rbp"
.Lstr7:
	.asciz "+"
.Lstr8:
	.asciz "]\n"
.Lstr9:
	.asciz "push rax\n"
.Lstr10:
	.asciz "mov rcx, rax\npop rax\nadd rax, rcx\n"
.Lstr11:
	.asciz "push rax\ncall _rt_puti\nadd rsp, 8\n"
.Lstr12:
	.asciz "push offset .Lstr0\ncall _rt_puts\nadd rsp, 8\n"
.Lstr13:
	.asciz "mov [rbp"
.Lstr14:
	.asciz "+"
.Lstr15:
	.asciz "], rax\n"
.Lstr16:
	.asciz "mov rax, "
.Lstr17:
	.asciz "\n"
.Lstr18:
	.asciz "jmp .Lret_main\n"
.Lstr19:
	.asciz "main start\n"
.Lstr20:
	.asciz "tt 主() -> u32 {\n  tz a = 10\n  tz b = 20\n  st dt a ht b\n  zz 0\n}\n"
.Lstr21:
	.asciz "srclen="
.Lstr22:
	.asciz " gsrc="
.Lstr23:
	.asciz " firstchar="
.Lstr24:
	.asciz "\n"
.Lstr25:
	.asciz "lyc_self v0.1: 编译 "
.Lstr26:
	.asciz " 字节\n"
.Lstr27:
	.asciz ".intel_syntax noprefix\n.section .text\n.globl fn_main\nfn_main:\npush rbp\nmov rbp, rsp\n"
.Lstr28:
	.asciz "first tok type="
.Lstr29:
	.asciz "\n"
.Lstr30:
	.asciz "sub rsp, "
.Lstr31:
	.asciz "\n.Lret_main:\nmov rsp, rbp\npop rbp\nret\n"
.Lstr32:
	.asciz "生成 "
.Lstr33:
	.asciz " 字节汇编\n"
	.section .text
