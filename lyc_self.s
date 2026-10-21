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
	sub rsp, 80
	mov rax, 0
	mov rax, 0
	mov [rbp-80], rax
.Lltop1:
	lea rax, [rbp-80]
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
	lea rax, [rbp-80]
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
	mov rax, 255
	mov rcx, rax
	pop rax
	and rax, rcx
	mov [rbp-64], rax
	lea rax, [rbp-64]
	mov rax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse4
	jmp .Llend2
.Lelse4:
	lea rax, [rbp-80]
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-80], rax
	jmp .Lltop1
.Llend2:
	lea rax, [rbp-80]
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
	lea rax, [rbp+16]
	mov rax, [rax]
	push rax
	mov rax, 128
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setae al
	movzx rax, al
	test rax, rax
	jz .Lelse12
	mov rax, 1
	jmp .Lret_is_alpha
.Lelse12:
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
	sub rsp, 48
	mov rax, 0
.Lltop13:
	mov rax, offset g_g_pos
	mov rax, [rax]
	push rax
	mov rax, offset g_g_srclen
	mov rax, [rax]
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse15
	jmp .Llend14
.Lelse15:
	mov rax, offset g_g_src
	mov rax, [rax]
	push rax
	mov rax, offset g_g_pos
	mov rax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	mov rax, [rax]
	mov [rbp-16], rax
	lea rax, [rbp-16]
	mov rax, [rax]
	push rax
	mov rax, 255
	mov rcx, rax
	pop rax
	and rax, rcx
	mov [rbp-32], rax
	mov rax, 0
	mov [rbp-48], rax
	lea rax, [rbp-32]
	mov rax, [rax]
	push rax
	mov rax, 32
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse16
	mov rax, 1
	mov [rbp-48], rax
.Lelse16:
	lea rax, [rbp-32]
	mov rax, [rax]
	push rax
	mov rax, 9
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse17
	mov rax, 1
	mov [rbp-48], rax
.Lelse17:
	lea rax, [rbp-32]
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
	mov rax, 1
	mov [rbp-48], rax
	mov rax, offset g_g_line
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [g_g_line], rax
.Lelse18:
	lea rax, [rbp-32]
	mov rax, [rax]
	push rax
	mov rax, 13
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse19
	mov rax, 1
	mov [rbp-48], rax
.Lelse19:
	lea rax, [rbp-32]
	mov rax, [rax]
	push rax
	call _rt_puti
	add rsp, 8
	push offset .Lstr0
	call _rt_puts
	add rsp, 8
	lea rax, [rbp-48]
	mov rax, [rax]
	push rax
	call _rt_puti
	add rsp, 8
	push offset .Lstr1
	call _rt_puts
	add rsp, 8
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
	jz .Lelse20
	mov rax, offset g_g_pos
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [g_g_pos], rax
.Lelse20:
	lea rax, [rbp-48]
	mov rax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse21
	jmp .Llend14
.Lelse21:
	jmp .Lltop13
.Llend14:
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
	sub rsp, 208
	mov rax, 0
	call fn_skip_ws
	mov rax, offset g_g_pos
	mov rax, [rax]
	push rax
	mov rax, offset g_g_srclen
	mov rax, [rax]
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse22
	mov rax, 0
	mov [g_tok_type], rax
	mov rax, 0
	jmp .Lret_next_tok
.Lelse22:
	mov rax, offset g_g_src
	mov rax, [rax]
	push rax
	mov rax, offset g_g_pos
	mov rax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	mov rax, [rax]
	mov [rbp-16], rax
	lea rax, [rbp-16]
	mov rax, [rax]
	push rax
	mov rax, 255
	mov rcx, rax
	pop rax
	and rax, rcx
	mov [rbp-32], rax
	lea rax, [rbp-32]
	mov rax, [rax]
	push rax
	call fn_is_digit
	add rsp, 8
	test rax, rax
	jz .Lelse23
	mov rax, 0
	mov [rbp-48], rax
.Lltop24:
	mov rax, offset g_g_pos
	mov rax, [rax]
	push rax
	mov rax, offset g_g_srclen
	mov rax, [rax]
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse26
	jmp .Llend25
.Lelse26:
	mov rax, offset g_g_src
	mov rax, [rax]
	push rax
	mov rax, offset g_g_pos
	mov rax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	mov rax, [rax]
	mov [rbp-64], rax
	lea rax, [rbp-64]
	mov rax, [rax]
	push rax
	mov rax, 255
	mov rcx, rax
	pop rax
	and rax, rcx
	mov [rbp-80], rax
	lea rax, [rbp-80]
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
	jz .Lelse27
	jmp .Llend25
.Lelse27:
	lea rax, [rbp-48]
	mov rax, [rax]
	push rax
	mov rax, 10
	mov rcx, rax
	pop rax
	imul rax, rcx
	mov [rbp-48], rax
	lea rax, [rbp-48]
	mov rax, [rax]
	push rax
	lea rax, [rbp-80]
	mov rax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 48
	mov rcx, rax
	pop rax
	sub rax, rcx
	mov [rbp-48], rax
	mov rax, offset g_g_pos
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [g_g_pos], rax
	jmp .Lltop24
.Llend25:
	mov rax, 1
	mov [g_tok_type], rax
	lea rax, [rbp-48]
	mov rax, [rax]
	mov [g_tok_val], rax
	mov rax, 1
	jmp .Lret_next_tok
.Lelse23:
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
	jz .Lelse28
	mov rax, offset g_g_pos
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [g_g_pos], rax
	mov rax, offset g_g_pos
	mov rax, [rax]
	mov [rbp-160], rax
	mov rax, offset g_g_src
	mov rax, [rax]
	push rax
	mov rax, offset g_g_pos
	mov rax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-176], rax
.Lltop29:
	mov rax, offset g_g_pos
	mov rax, [rax]
	push rax
	mov rax, offset g_g_srclen
	mov rax, [rax]
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse31
	jmp .Llend30
.Lelse31:
	mov rax, offset g_g_src
	mov rax, [rax]
	push rax
	mov rax, offset g_g_pos
	mov rax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	mov rax, [rax]
	mov [rbp-192], rax
	lea rax, [rbp-192]
	mov rax, [rax]
	push rax
	mov rax, 255
	mov rcx, rax
	pop rax
	and rax, rcx
	mov [rbp-208], rax
	lea rax, [rbp-208]
	mov rax, [rax]
	push rax
	mov rax, 34
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse32
	jmp .Llend30
.Lelse32:
	mov rax, offset g_g_pos
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [g_g_pos], rax
	jmp .Lltop29
.Llend30:
	mov rax, 2
	mov [g_tok_type], rax
	lea rax, [rbp-176]
	mov rax, [rax]
	mov [g_tok_str], rax
	mov rax, offset g_g_pos
	mov rax, [rax]
	push rax
	lea rax, [rbp-160]
	mov rax, [rax]
	mov rcx, rax
	pop rax
	sub rax, rcx
	mov [g_tok_len], rax
	mov rax, offset g_g_pos
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
	jz .Lelse33
	mov rax, offset g_g_pos
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [g_g_pos], rax
.Lelse33:
	mov rax, 1
	jmp .Lret_next_tok
.Lelse28:
	lea rax, [rbp-32]
	mov rax, [rax]
	push rax
	call fn_is_alpha
	add rsp, 8
	test rax, rax
	jz .Lelse34
	mov rax, offset g_g_pos
	mov rax, [rax]
	mov [rbp-160], rax
	mov rax, offset g_g_src
	mov rax, [rax]
	push rax
	mov rax, offset g_g_pos
	mov rax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-176], rax
.Lltop35:
	mov rax, offset g_g_pos
	mov rax, [rax]
	push rax
	mov rax, offset g_g_srclen
	mov rax, [rax]
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse37
	jmp .Llend36
.Lelse37:
	mov rax, offset g_g_src
	mov rax, [rax]
	push rax
	mov rax, offset g_g_pos
	mov rax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	mov rax, [rax]
	mov [rbp-192], rax
	lea rax, [rbp-192]
	mov rax, [rax]
	push rax
	mov rax, 255
	mov rcx, rax
	pop rax
	and rax, rcx
	mov [rbp-208], rax
	lea rax, [rbp-208]
	mov rax, [rax]
	push rax
	call fn_is_alpha
	add rsp, 8
	test rax, rax
	jz .Lelse38
	mov rax, offset g_g_pos
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [g_g_pos], rax
.Lelse38:
	lea rax, [rbp-208]
	mov rax, [rax]
	push rax
	call fn_is_digit
	add rsp, 8
	test rax, rax
	jz .Lelse39
	mov rax, offset g_g_pos
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [g_g_pos], rax
.Lelse39:
	lea rax, [rbp-208]
	mov rax, [rax]
	push rax
	call fn_is_alpha
	add rsp, 8
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse40
	lea rax, [rbp-208]
	mov rax, [rax]
	push rax
	call fn_is_digit
	add rsp, 8
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse41
	jmp .Llend36
.Lelse41:
.Lelse40:
	jmp .Lltop35
.Llend36:
	mov rax, 3
	mov [g_tok_type], rax
	lea rax, [rbp-176]
	mov rax, [rax]
	mov [g_tok_str], rax
	mov rax, offset g_g_pos
	mov rax, [rax]
	push rax
	lea rax, [rbp-160]
	mov rax, [rax]
	mov rcx, rax
	pop rax
	sub rax, rcx
	mov [g_tok_len], rax
	mov rax, 1
	jmp .Lret_next_tok
.Lelse34:
	mov rax, 5
	mov [g_tok_type], rax
	lea rax, [rbp-32]
	mov rax, [rax]
	mov [g_tok_val], rax
	mov rax, offset g_g_pos
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [g_g_pos], rax
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
	mov rax, 0
	lea rax, [rbp+16]
	mov rax, [rax]
	push rax
	call _rt_puts
	add rsp, 8
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
	mov rax, 0
	lea rax, [rbp+16]
	mov rax, [rax]
	push rax
	call _rt_puti
	add rsp, 8
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
	sub rsp, 64
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
	jz .Lelse42
	mov rax, offset .Lstr2
	push rax
	call fn_emit
	add rsp, 8
	mov rax, offset g_tok_val
	mov rax, [rax]
	push rax
	call fn_emit_num
	add rsp, 8
	mov rax, offset .Lstr3
	push rax
	call fn_emit
	add rsp, 8
	call fn_next_tok
.Lelse42:
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
	jz .Lelse43
	mov rax, 0
	mov [rbp-48], rax
	mov rax, 0
	mov [rbp-32], rax
.Lltop44:
	lea rax, [rbp-48]
	mov rax, [rax]
	push rax
	mov rax, offset g_g_nvars
	mov rax, [rax]
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse46
	jmp .Llend45
.Lelse46:
	mov rax, offset g_g_vname
	lea rax, [rbp-48]
	mov rax, [rax]
	cmp rax, 64
	jb .Lbok47
	call _rt_oob
.Lbok47:
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
	jz .Lelse48
	mov rax, 1
	mov [rbp-32], rax
	jmp .Llend45
.Lelse48:
	lea rax, [rbp-48]
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-48], rax
	jmp .Lltop44
.Llend45:
	lea rax, [rbp-32]
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse49
	mov rax, offset g_g_voff
	lea rax, [rbp-48]
	mov rax, [rax]
	cmp rax, 64
	jb .Lbok50
	call _rt_oob
.Lbok50:
	imul rax, 8
	push rax
	mov rax, offset g_g_voff
	mov rcx, rax
	pop rax
	add rax, rcx
	mov rax, [rax]
	mov [rbp-64], rax
	mov rax, offset .Lstr4
	push rax
	call fn_emit
	add rsp, 8
	lea rax, [rbp-64]
	mov rax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setae al
	movzx rax, al
	test rax, rax
	jz .Lelse51
	mov rax, offset .Lstr5
	push rax
	call fn_emit
	add rsp, 8
.Lelse51:
	lea rax, [rbp-64]
	mov rax, [rax]
	push rax
	call fn_emit_num
	add rsp, 8
	mov rax, offset .Lstr6
	push rax
	call fn_emit
	add rsp, 8
.Lelse49:
	call fn_next_tok
.Lelse43:
.Lltop52:
	mov rax, offset g_tok_type
	mov rax, [rax]
	push rax
	mov rax, 5
	mov rcx, rax
	pop rax
	cmp rax, rcx
	je .Lelse54
	jmp .Llend53
.Lelse54:
	mov rax, offset g_tok_val
	mov rax, [rax]
	push rax
	mov rax, 43
	mov rcx, rax
	pop rax
	cmp rax, rcx
	je .Lelse55
	jmp .Llend53
.Lelse55:
	call fn_next_tok
	mov rax, offset .Lstr7
	push rax
	call fn_emit
	add rsp, 8
	call fn_parse_expr
	mov rax, offset .Lstr8
	push rax
	call fn_emit
	add rsp, 8
	jmp .Lltop52
.Llend53:
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
	sub rsp, 160
	mov rax, 0
	push offset .Lstr9
	call _rt_puts
	add rsp, 8
	mov rax, offset g_tok_type
	mov rax, [rax]
	push rax
	call _rt_puti
	add rsp, 8
	mov rax, offset .Lstr10
	push rax
	call _rt_puti
	add rsp, 8
	mov rax, offset g_tok_len
	mov rax, [rax]
	push rax
	call _rt_puti
	add rsp, 8
	mov rax, offset .Lstr11
	push rax
	call _rt_puti
	add rsp, 8
	mov rax, offset g_tok_type
	mov rax, [rax]
	push rax
	call _rt_puti
	add rsp, 8
	mov rax, offset g_tok_len
	mov rax, [rax]
	push rax
	call _rt_puti
	add rsp, 8
	push offset .Lstr12
	call _rt_puts
	add rsp, 8
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
	jz .Lelse56
	call fn_next_tok
	mov rax, 0
	jmp .Lret_parse_stmt
.Lelse56:
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
	jz .Lelse57
	call fn_next_tok
	mov rax, 0
	jmp .Lret_parse_stmt
.Lelse57:
	mov rax, offset g_tok_str
	mov rax, [rax]
	mov rax, [rax]
	mov [rbp-16], rax
	lea rax, [rbp-16]
	mov rax, [rax]
	push rax
	mov rax, 255
	mov rcx, rax
	pop rax
	and rax, rcx
	mov [rbp-32], rax
	mov rax, offset g_tok_str
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov rax, [rax]
	mov [rbp-48], rax
	lea rax, [rbp-48]
	mov rax, [rax]
	push rax
	mov rax, 255
	mov rcx, rax
	pop rax
	and rax, rcx
	mov [rbp-64], rax
	lea rax, [rbp-32]
	mov rax, [rax]
	push rax
	mov rax, 115
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse58
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
	jz .Lelse59
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
	jz .Lelse60
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
	jz .Lelse61
	mov rax, offset g_tok_str
	mov rax, [rax]
	mov rax, [rax]
	mov [rbp-80], rax
	lea rax, [rbp-80]
	mov rax, [rax]
	push rax
	mov rax, 255
	mov rcx, rax
	pop rax
	and rax, rcx
	mov [rbp-96], rax
	mov rax, offset g_tok_str
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov rax, [rax]
	mov [rbp-112], rax
	lea rax, [rbp-112]
	mov rax, [rax]
	push rax
	mov rax, 255
	mov rcx, rax
	pop rax
	and rax, rcx
	mov [rbp-128], rax
	lea rax, [rbp-96]
	mov rax, [rax]
	push rax
	mov rax, 100
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse62
	lea rax, [rbp-128]
	mov rax, [rax]
	push rax
	mov rax, 116
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse63
	call fn_next_tok
	call fn_parse_expr
	mov rax, offset .Lstr13
	push rax
	call fn_emit
	add rsp, 8
	mov rax, 0
	jmp .Lret_parse_stmt
.Lelse63:
.Lelse62:
	lea rax, [rbp-96]
	mov rax, [rax]
	push rax
	mov rax, 100
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse64
	lea rax, [rbp-128]
	mov rax, [rax]
	push rax
	mov rax, 100
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse65
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
	jz .Lelse66
	mov rax, offset .Lstr14
	push rax
	call fn_emit
	add rsp, 8
	call fn_next_tok
.Lelse66:
	mov rax, 0
	jmp .Lret_parse_stmt
.Lelse65:
.Lelse64:
.Lelse61:
.Lelse60:
	mov rax, 0
	jmp .Lret_parse_stmt
.Lelse59:
.Lelse58:
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
	jz .Lelse67
	lea rax, [rbp-64]
	mov rax, [rax]
	push rax
	mov rax, 122
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse68
	lea rax, [rbp-32]
	mov rax, [rax]
	push rax
	call _rt_puti
	add rsp, 8
	lea rax, [rbp-64]
	mov rax, [rax]
	push rax
	call _rt_puti
	add rsp, 8
	push offset .Lstr15
	call _rt_puts
	add rsp, 8
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
	jz .Lelse69
	mov rax, offset g_g_nvars
	mov rax, [rax]
	mov [rbp-144], rax
	mov rax, offset g_g_vname
	lea rax, [rbp-144]
	mov rax, [rax]
	cmp rax, 64
	jb .Lbok70
	call _rt_oob
.Lbok70:
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
	mov rax, offset g_g_framesz
	mov rax, [rax]
	push rax
	mov rax, 16
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [g_g_framesz], rax
	mov rax, offset g_g_voff
	lea rax, [rbp-144]
	mov rax, [rax]
	cmp rax, 64
	jb .Lbok71
	call _rt_oob
.Lbok71:
	imul rax, 8
	push rax
	mov rax, offset g_g_voff
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, offset g_g_framesz
	mov rax, [rax]
	mov rcx, rax
	pop rax
	mov [rax], rcx
	mov rax, offset g_g_nvars
	mov rax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [g_g_nvars], rax
	call fn_next_tok
	mov rax, offset g_tok_type
	mov rax, [rax]
	push rax
	mov rax, 5
	mov rcx, rax
	pop rax
	cmp rax, rcx
	je .Lelse72
	mov rax, 0
	jmp .Lret_parse_stmt
.Lelse72:
	mov rax, offset g_tok_val
	mov rax, [rax]
	push rax
	mov rax, 61
	mov rcx, rax
	pop rax
	cmp rax, rcx
	je .Lelse73
	mov rax, 0
	jmp .Lret_parse_stmt
.Lelse73:
	call fn_next_tok
	call fn_parse_expr
	mov rax, offset .Lstr16
	push rax
	call fn_emit
	add rsp, 8
	mov rax, offset g_g_voff
	lea rax, [rbp-144]
	mov rax, [rax]
	cmp rax, 64
	jb .Lbok74
	call _rt_oob
.Lbok74:
	imul rax, 8
	push rax
	mov rax, offset g_g_voff
	mov rcx, rax
	pop rax
	add rax, rcx
	mov rax, [rax]
	mov [rbp-160], rax
	lea rax, [rbp-160]
	mov rax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setae al
	movzx rax, al
	test rax, rax
	jz .Lelse75
	mov rax, offset .Lstr17
	push rax
	call fn_emit
	add rsp, 8
.Lelse75:
	lea rax, [rbp-160]
	mov rax, [rax]
	push rax
	call fn_emit_num
	add rsp, 8
	mov rax, offset .Lstr18
	push rax
	call fn_emit
	add rsp, 8
.Lelse69:
	mov rax, 0
	jmp .Lret_parse_stmt
.Lelse68:
.Lelse67:
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
	jz .Lelse76
	lea rax, [rbp-64]
	mov rax, [rax]
	push rax
	mov rax, 122
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse77
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
	jz .Lelse78
	mov rax, offset .Lstr19
	push rax
	call fn_emit
	add rsp, 8
	mov rax, offset g_tok_val
	mov rax, [rax]
	push rax
	call fn_emit_num
	add rsp, 8
	mov rax, offset .Lstr20
	push rax
	call fn_emit
	add rsp, 8
	call fn_next_tok
.Lelse78:
	mov rax, offset .Lstr21
	push rax
	call fn_emit
	add rsp, 8
	mov rax, 0
	jmp .Lret_parse_stmt
.Lelse77:
.Lelse76:
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
	sub rsp, 16
	mov rax, 0
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
	mov rax, offset .Lstr22
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
	push offset .Lstr23
	call _rt_puts
	add rsp, 8
	mov rax, offset g_g_srclen
	mov rax, [rax]
	push rax
	call _rt_puti
	add rsp, 8
	push offset .Lstr24
	call _rt_puts
	add rsp, 8
	mov rax, offset .Lstr25
	push rax
	call fn_emit
	add rsp, 8
	call fn_next_tok
.Lltop79:
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
	jz .Lelse81
	jmp .Llend80
.Lelse81:
	push offset .Lstr26
	call _rt_puts
	add rsp, 8
	mov rax, offset g_tok_type
	mov rax, [rax]
	push rax
	call _rt_puti
	add rsp, 8
	mov rax, offset .Lstr27
	push rax
	call _rt_puti
	add rsp, 8
	call fn_parse_stmt
	push offset .Lstr28
	call _rt_puts
	add rsp, 8
	mov rax, offset g_tok_type
	mov rax, [rax]
	push rax
	call _rt_puti
	add rsp, 8
	mov rax, offset .Lstr29
	push rax
	call _rt_puti
	add rsp, 8
	jmp .Lltop79
.Llend80:
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
	.space 262144
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
	.asciz " isws="
.Lstr1:
	.asciz "\n"
.Lstr2:
	.asciz "mov rax, "
.Lstr3:
	.asciz "\n"
.Lstr4:
	.asciz "mov rax, [rbp"
.Lstr5:
	.asciz "+"
.Lstr6:
	.asciz "]\n"
.Lstr7:
	.asciz "push rax\n"
.Lstr8:
	.asciz "mov rcx, rax\npop rax\nadd rax, rcx\n"
.Lstr9:
	.asciz "PS="
.Lstr10:
	.asciz ","
.Lstr11:
	.asciz "\n"
.Lstr12:
	.asciz "\n"
.Lstr13:
	.asciz "push rax\ncall _rt_puti\nadd rsp, 8\n"
.Lstr14:
	.asciz "push offset .Lstr0\ncall _rt_puts\nadd rsp, 8\n"
.Lstr15:
	.asciz "\n"
.Lstr16:
	.asciz "mov [rbp"
.Lstr17:
	.asciz "+"
.Lstr18:
	.asciz "], rax\n"
.Lstr19:
	.asciz "mov rax, "
.Lstr20:
	.asciz "\n"
.Lstr21:
	.asciz "jmp .Lret_main\n"
.Lstr22:
	.asciz "tt 主() -> u32 {\n  tz a = 10\n  tz b = 20\n  st dt a ht b\n  zz 0\n}\n"
.Lstr23:
	.asciz "lyc_self v0.1: 编译 "
.Lstr24:
	.asciz " 字节\n"
.Lstr25:
	.asciz ".intel_syntax noprefix\n.section .text\n.globl fn_main\nfn_main:\npush rbp\nmov rbp, rsp\n"
.Lstr26:
	.asciz "BEFORE ty="
.Lstr27:
	.asciz "\n"
.Lstr28:
	.asciz "AFTER ty="
.Lstr29:
	.asciz "\n"
.Lstr30:
	.asciz "sub rsp, "
.Lstr31:
	.asciz "\n.Lret_main:\nmov rsp, rbp\npop rbp\nret\n"
.Lstr32:
	.asciz "--- 生成汇编结束 ---\n"
	.section .text
