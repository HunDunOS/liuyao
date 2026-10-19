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
	.globl fn__e6_98_af_e7_a9_ba_e7_99_bd
fn__e6_98_af_e7_a9_ba_e7_99_bd:
	push rbp
	mov rbp, rsp
	mov rax, 0
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, 32
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse1
	mov rax, 1
	jmp .Lret__e6_98_af_e7_a9_ba_e7_99_bd
.Lelse1:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, 9
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse2
	mov rax, 1
	jmp .Lret__e6_98_af_e7_a9_ba_e7_99_bd
.Lelse2:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, 13
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse3
	mov rax, 1
	jmp .Lret__e6_98_af_e7_a9_ba_e7_99_bd
.Lelse3:
	mov rax, 0
	jmp .Lret__e6_98_af_e7_a9_ba_e7_99_bd
.Lret__e6_98_af_e7_a9_ba_e7_99_bd:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn__e6_98_af_e5_ad_97_e6_af_8d
fn__e6_98_af_e5_ad_97_e6_af_8d:
	push rbp
	mov rbp, rsp
	mov rax, 0
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, 97
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setge al
	movzx rax, al
	test rax, rax
	jz .Lelse4
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, 122
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setle al
	movzx rax, al
	test rax, rax
	jz .Lelse5
	mov rax, 1
	jmp .Lret__e6_98_af_e5_ad_97_e6_af_8d
.Lelse5:
.Lelse4:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, 65
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setge al
	movzx rax, al
	test rax, rax
	jz .Lelse6
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, 90
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setle al
	movzx rax, al
	test rax, rax
	jz .Lelse7
	mov rax, 1
	jmp .Lret__e6_98_af_e5_ad_97_e6_af_8d
.Lelse7:
.Lelse6:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, 128
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setge al
	movzx rax, al
	test rax, rax
	jz .Lelse8
	mov rax, 1
	jmp .Lret__e6_98_af_e5_ad_97_e6_af_8d
.Lelse8:
	mov rax, 0
	jmp .Lret__e6_98_af_e5_ad_97_e6_af_8d
.Lret__e6_98_af_e5_ad_97_e6_af_8d:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn__e6_98_af_e6_95_b0_e5_ad_97
fn__e6_98_af_e6_95_b0_e5_ad_97:
	push rbp
	mov rbp, rsp
	mov rax, 0
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, 48
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setge al
	movzx rax, al
	test rax, rax
	jz .Lelse9
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, 57
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setle al
	movzx rax, al
	test rax, rax
	jz .Lelse10
	mov rax, 1
	jmp .Lret__e6_98_af_e6_95_b0_e5_ad_97
.Lelse10:
.Lelse9:
	mov rax, 0
	jmp .Lret__e6_98_af_e6_95_b0_e5_ad_97
.Lret__e6_98_af_e6_95_b0_e5_ad_97:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn__e6_98_af_e6_a0_87_e8_af_86_e7_bb_ad
fn__e6_98_af_e6_a0_87_e8_af_86_e7_bb_ad:
	push rbp
	mov rbp, rsp
	mov rax, 0
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	call fn__e6_98_af_e5_ad_97_e6_af_8d
	add rsp, 8
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse11
	mov rax, 1
	jmp .Lret__e6_98_af_e6_a0_87_e8_af_86_e7_bb_ad
.Lelse11:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	call fn__e6_98_af_e6_95_b0_e5_ad_97
	add rsp, 8
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse12
	mov rax, 1
	jmp .Lret__e6_98_af_e6_a0_87_e8_af_86_e7_bb_ad
.Lelse12:
	mov rax, 0
	jmp .Lret__e6_98_af_e6_a0_87_e8_af_86_e7_bb_ad
.Lret__e6_98_af_e6_a0_87_e8_af_86_e7_bb_ad:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn__e5_a4_8d_e5_88_b6_e4_b8_b2
fn__e5_a4_8d_e5_88_b6_e4_b8_b2:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rax, 0
	mov rax, 0
	mov [rbp-8], rax
.Lltop13:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	lea rax, [rbp-8]
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	call fn_fh
	add rsp, 8
	mov [rbp-16], rax
	lea rax, [rbp+24]
	mov eax, [rax]
	push rax
	lea rax, [rbp-8]
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-16]
	mov eax, [rax]
	push rax
	call fn_sh
	add rsp, 16
	lea rax, [rbp-16]
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse15
	jmp .Llend14
.Lelse15:
	lea rax, [rbp-8]
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-8], rax
	jmp .Lltop13
.Llend14:
	lea rax, [rbp-8]
	mov eax, [rax]
	jmp .Lret__e5_a4_8d_e5_88_b6_e4_b8_b2
.Lret__e5_a4_8d_e5_88_b6_e4_b8_b2:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn__e6_af_94_e8_be_83_e4_b8_b2
fn__e6_af_94_e8_be_83_e4_b8_b2:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	mov rax, 0
	mov rax, 0
	mov [rbp-8], rax
.Lltop16:
	lea rax, [rbp+24]
	mov eax, [rax]
	push rax
	lea rax, [rbp-8]
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	call fn_fh
	add rsp, 8
	mov [rbp-16], rax
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	lea rax, [rbp-8]
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	call fn_fh
	add rsp, 8
	mov [rbp-24], rax
	lea rax, [rbp-16]
	mov eax, [rax]
	push rax
	lea rax, [rbp-24]
	mov eax, [rax]
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .Lelse18
	mov rax, 0
	jmp .Lret__e6_af_94_e8_be_83_e4_b8_b2
.Lelse18:
	lea rax, [rbp-16]
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse19
	mov rax, 1
	jmp .Lret__e6_af_94_e8_be_83_e4_b8_b2
.Lelse19:
	lea rax, [rbp-8]
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-8], rax
	jmp .Lltop16
.Llend17:
	mov rax, 1
	jmp .Lret__e6_af_94_e8_be_83_e4_b8_b2
.Lret__e6_af_94_e8_be_83_e4_b8_b2:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
fn__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97:
	push rbp
	mov rbp, rsp
	mov rax, 0
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr0
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse20
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse20:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr1
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse21
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse21:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr2
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse22
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse22:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr3
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse23
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse23:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr4
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse24
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse24:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr5
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse25
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse25:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr6
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse26
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse26:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr7
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse27
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse27:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr8
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse28
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse28:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr9
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse29
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse29:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr10
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse30
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse30:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr11
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse31
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse31:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr12
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse32
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse32:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr13
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse33
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse33:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr14
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse34
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse34:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr15
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse35
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse35:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr16
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse36
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse36:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr17
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse37
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse37:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr18
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse38
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse38:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr19
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse39
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse39:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr20
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse40
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse40:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr21
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse41
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse41:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr22
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse42
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse42:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr23
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse43
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse43:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr24
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse44
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse44:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr25
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse45
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse45:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr26
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse46
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse46:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr27
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse47
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse47:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr28
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse48
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse48:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr29
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse49
	mov rax, 1
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lelse49:
	mov rax, 0
	jmp .Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
.Lret__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn__e8_af_8d_e6_b3_95
fn__e8_af_8d_e6_b3_95:
	push rbp
	mov rbp, rsp
	sub rsp, 34896
	mov rax, 0
	mov rax, 0
	mov dword ptr [g_tok_n], eax
	mov rax, 0
	mov dword ptr [g__e6_ba_90_e7_a0_81_e4_bd_8d], eax
	mov rax, 1
	mov dword ptr [g__e5_bd_93_e5_89_8d_e8_a1_8c], eax
.Lltop50:
	mov rax, offset g__e6_ba_90_e7_a0_81
	push rax
	mov rax, offset g__e6_ba_90_e7_a0_81_e4_bd_8d
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	call fn_fh
	add rsp, 8
	mov [rbp-8], rax
	lea rax, [rbp-8]
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse52
	jmp .Llend51
.Lelse52:
	lea rax, [rbp-8]
	mov eax, [rax]
	push rax
	call fn__e6_98_af_e7_a9_ba_e7_99_bd
	add rsp, 8
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse53
	mov rax, offset g__e6_ba_90_e7_a0_81_e4_bd_8d
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g__e6_ba_90_e7_a0_81_e4_bd_8d], eax
	mov rax, 0
	jmp .Lret__e8_af_8d_e6_b3_95
.Lelse53:
	lea rax, [rbp-8]
	mov eax, [rax]
	push rax
	mov rax, 10
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse54
	mov rax, offset g_tok_k
	mov rax, offset g_tok_n
	mov eax, [rax]
	cmp rax, 8192
	jb .Lbok55
	call _rt_oob
.Lbok55:
	imul rax, 4
	push rax
	mov rax, offset g_tok_k
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	mov [rax], ecx
	mov rax, offset g_tok_v
	mov rax, offset g_tok_n
	mov eax, [rax]
	cmp rax, 8192
	jb .Lbok56
	call _rt_oob
.Lbok56:
	imul rax, 4
	push rax
	mov rax, offset g_tok_v
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	mov [rax], ecx
	mov rax, offset g_tok_s
	mov rax, offset g_tok_n
	mov eax, [rax]
	push rax
	mov rax, 256
	mov rcx, rax
	pop rax
	imul rax, rcx
	cmp rax, 2097152
	jb .Lbok57
	call _rt_oob
.Lbok57:
	imul rax, 4
	push rax
	mov rax, offset g_tok_s
	mov rcx, rax
	pop rax
	add rax, rcx
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr30
	push rax
	call fn__e5_a4_8d_e5_88_b6_e4_b8_b2
	add rsp, 16
	mov rax, offset g_tok_n
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_n], eax
	mov rax, offset g__e5_bd_93_e5_89_8d_e8_a1_8c
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g__e5_bd_93_e5_89_8d_e8_a1_8c], eax
	mov rax, offset g__e6_ba_90_e7_a0_81_e4_bd_8d
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g__e6_ba_90_e7_a0_81_e4_bd_8d], eax
	mov rax, 0
	jmp .Lret__e8_af_8d_e6_b3_95
.Lelse54:
	lea rax, [rbp-8]
	mov eax, [rax]
	push rax
	mov rax, 64
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse58
.Lltop59:
	mov rax, offset g__e6_ba_90_e7_a0_81
	push rax
	mov rax, offset g__e6_ba_90_e7_a0_81_e4_bd_8d
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	call fn_fh
	add rsp, 8
	mov [rbp-34888], rax
	lea rax, [rbp-34888]
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse61
	jmp .Llend60
.Lelse61:
	lea rax, [rbp-34888]
	mov eax, [rax]
	push rax
	mov rax, 10
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse62
	jmp .Llend60
.Lelse62:
	mov rax, offset g__e6_ba_90_e7_a0_81_e4_bd_8d
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g__e6_ba_90_e7_a0_81_e4_bd_8d], eax
	jmp .Lltop59
.Llend60:
	mov rax, 0
	jmp .Lret__e8_af_8d_e6_b3_95
.Lelse58:
	lea rax, [rbp-8]
	mov eax, [rax]
	push rax
	call fn__e6_98_af_e6_95_b0_e5_ad_97
	add rsp, 8
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse63
	mov rax, 0
	mov [rbp-24], rax
.Lltop64:
	mov rax, offset g__e6_ba_90_e7_a0_81
	push rax
	mov rax, offset g__e6_ba_90_e7_a0_81_e4_bd_8d
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	call fn_fh
	add rsp, 8
	mov [rbp-34888], rax
	lea rax, [rbp-34888]
	mov eax, [rax]
	push rax
	call fn__e6_98_af_e6_95_b0_e5_ad_97
	add rsp, 8
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse66
	jmp .Llend65
.Lelse66:
	lea rax, [rbp-24]
	mov eax, [rax]
	push rax
	mov rax, 10
	mov rcx, rax
	pop rax
	imul rax, rcx
	mov [rbp-24], rax
	lea rax, [rbp-24]
	mov eax, [rax]
	push rax
	lea rax, [rbp-34888]
	mov eax, [rax]
	push rax
	mov rax, 48
	mov rcx, rax
	pop rax
	sub rax, rcx
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-24], rax
	mov rax, offset g__e6_ba_90_e7_a0_81_e4_bd_8d
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g__e6_ba_90_e7_a0_81_e4_bd_8d], eax
	jmp .Lltop64
.Llend65:
	mov rax, offset g_tok_k
	mov rax, offset g_tok_n
	mov eax, [rax]
	cmp rax, 8192
	jb .Lbok67
	call _rt_oob
.Lbok67:
	imul rax, 4
	push rax
	mov rax, offset g_tok_k
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 2
	mov rcx, rax
	pop rax
	mov [rax], ecx
	mov rax, offset g_tok_v
	mov rax, offset g_tok_n
	mov eax, [rax]
	cmp rax, 8192
	jb .Lbok68
	call _rt_oob
.Lbok68:
	imul rax, 4
	push rax
	mov rax, offset g_tok_v
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-24]
	mov eax, [rax]
	mov rcx, rax
	pop rax
	mov [rax], ecx
	mov rax, offset g_tok_s
	mov rax, offset g_tok_n
	mov eax, [rax]
	push rax
	mov rax, 256
	mov rcx, rax
	pop rax
	imul rax, rcx
	cmp rax, 2097152
	jb .Lbok69
	call _rt_oob
.Lbok69:
	imul rax, 4
	push rax
	mov rax, offset g_tok_s
	mov rcx, rax
	pop rax
	add rax, rcx
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr31
	push rax
	call fn__e5_a4_8d_e5_88_b6_e4_b8_b2
	add rsp, 16
	mov rax, offset g_tok_n
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_n], eax
	mov rax, 0
	jmp .Lret__e8_af_8d_e6_b3_95
.Lelse63:
	lea rax, [rbp-8]
	mov eax, [rax]
	push rax
	call fn__e6_98_af_e5_ad_97_e6_af_8d
	add rsp, 8
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse70
	mov rax, 0
	mov [rbp-2088], rax
.Lltop71:
	mov rax, offset g__e6_ba_90_e7_a0_81
	push rax
	mov rax, offset g__e6_ba_90_e7_a0_81_e4_bd_8d
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	call fn_fh
	add rsp, 8
	mov [rbp-34888], rax
	lea rax, [rbp-34888]
	mov eax, [rax]
	push rax
	call fn__e6_98_af_e6_a0_87_e8_af_86_e7_bb_ad
	add rsp, 8
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse73
	jmp .Llend72
.Lelse73:
	lea rax, [rbp-2080]
	push rax
	lea rax, [rbp-2088]
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-34888]
	mov eax, [rax]
	push rax
	call fn_sh
	add rsp, 16
	lea rax, [rbp-2088]
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-2088], rax
	mov rax, offset g__e6_ba_90_e7_a0_81_e4_bd_8d
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g__e6_ba_90_e7_a0_81_e4_bd_8d], eax
	jmp .Lltop71
.Llend72:
	lea rax, [rbp-2080]
	push rax
	lea rax, [rbp-2088]
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 0
	push rax
	call fn_sh
	add rsp, 16
	lea rax, [rbp-2080]
	push rax
	mov rax, offset .Lstr32
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse74
.Lltop75:
	mov rax, offset g__e6_ba_90_e7_a0_81
	push rax
	mov rax, offset g__e6_ba_90_e7_a0_81_e4_bd_8d
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	call fn_fh
	add rsp, 8
	mov [rbp-34888], rax
	lea rax, [rbp-34888]
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse77
	jmp .Llend76
.Lelse77:
	lea rax, [rbp-34888]
	mov eax, [rax]
	push rax
	mov rax, 10
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse78
	jmp .Llend76
.Lelse78:
	mov rax, offset g__e6_ba_90_e7_a0_81_e4_bd_8d
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g__e6_ba_90_e7_a0_81_e4_bd_8d], eax
	jmp .Lltop75
.Llend76:
	mov rax, 0
	jmp .Lret__e8_af_8d_e6_b3_95
.Lelse74:
	mov rax, offset g_tok_k
	mov rax, offset g_tok_n
	mov eax, [rax]
	cmp rax, 8192
	jb .Lbok79
	call _rt_oob
.Lbok79:
	imul rax, 4
	push rax
	mov rax, offset g_tok_k
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 3
	mov rcx, rax
	pop rax
	mov [rax], ecx
	lea rax, [rbp-2080]
	push rax
	call fn__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
	add rsp, 8
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse80
	mov rax, offset g_tok_k
	mov rax, offset g_tok_n
	mov eax, [rax]
	cmp rax, 8192
	jb .Lbok81
	call _rt_oob
.Lbok81:
	imul rax, 4
	push rax
	mov rax, offset g_tok_k
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 4
	mov rcx, rax
	pop rax
	mov [rax], ecx
.Lelse80:
	mov rax, offset g_tok_v
	mov rax, offset g_tok_n
	mov eax, [rax]
	cmp rax, 8192
	jb .Lbok82
	call _rt_oob
.Lbok82:
	imul rax, 4
	push rax
	mov rax, offset g_tok_v
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	mov [rax], ecx
	mov rax, offset g_tok_s
	mov rax, offset g_tok_n
	mov eax, [rax]
	push rax
	mov rax, 256
	mov rcx, rax
	pop rax
	imul rax, rcx
	cmp rax, 2097152
	jb .Lbok83
	call _rt_oob
.Lbok83:
	imul rax, 4
	push rax
	mov rax, offset g_tok_s
	mov rcx, rax
	pop rax
	add rax, rcx
	mov eax, [rax]
	push rax
	lea rax, [rbp-2080]
	push rax
	call fn__e5_a4_8d_e5_88_b6_e4_b8_b2
	add rsp, 16
	mov rax, offset g_tok_n
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_n], eax
	mov rax, 0
	jmp .Lret__e8_af_8d_e6_b3_95
.Lelse70:
	lea rax, [rbp-8]
	mov eax, [rax]
	push rax
	mov rax, 34
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse84
	mov rax, offset g__e6_ba_90_e7_a0_81_e4_bd_8d
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g__e6_ba_90_e7_a0_81_e4_bd_8d], eax
	mov rax, 0
	mov [rbp-34880], rax
.Lltop85:
	mov rax, offset g__e6_ba_90_e7_a0_81
	push rax
	mov rax, offset g__e6_ba_90_e7_a0_81_e4_bd_8d
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	call fn_fh
	add rsp, 8
	mov [rbp-34888], rax
	lea rax, [rbp-34888]
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse87
	jmp .Llend86
.Lelse87:
	lea rax, [rbp-34888]
	mov eax, [rax]
	push rax
	mov rax, 34
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse88
	jmp .Llend86
.Lelse88:
	lea rax, [rbp-34872]
	push rax
	lea rax, [rbp-34880]
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-34888]
	mov eax, [rax]
	push rax
	call fn_sh
	add rsp, 16
	lea rax, [rbp-34880]
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-34880], rax
	mov rax, offset g__e6_ba_90_e7_a0_81_e4_bd_8d
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g__e6_ba_90_e7_a0_81_e4_bd_8d], eax
	jmp .Lltop85
.Llend86:
	lea rax, [rbp-34872]
	push rax
	lea rax, [rbp-34880]
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 0
	push rax
	call fn_sh
	add rsp, 16
	mov rax, offset g__e6_ba_90_e7_a0_81_e4_bd_8d
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g__e6_ba_90_e7_a0_81_e4_bd_8d], eax
	mov rax, offset g_tok_k
	mov rax, offset g_tok_n
	mov eax, [rax]
	cmp rax, 8192
	jb .Lbok89
	call _rt_oob
.Lbok89:
	imul rax, 4
	push rax
	mov rax, offset g_tok_k
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 5
	mov rcx, rax
	pop rax
	mov [rax], ecx
	mov rax, offset g_tok_v
	mov rax, offset g_tok_n
	mov eax, [rax]
	cmp rax, 8192
	jb .Lbok90
	call _rt_oob
.Lbok90:
	imul rax, 4
	push rax
	mov rax, offset g_tok_v
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-34880]
	mov eax, [rax]
	mov rcx, rax
	pop rax
	mov [rax], ecx
	mov rax, offset g_tok_s
	mov rax, offset g_tok_n
	mov eax, [rax]
	push rax
	mov rax, 256
	mov rcx, rax
	pop rax
	imul rax, rcx
	cmp rax, 2097152
	jb .Lbok91
	call _rt_oob
.Lbok91:
	imul rax, 4
	push rax
	mov rax, offset g_tok_s
	mov rcx, rax
	pop rax
	add rax, rcx
	mov eax, [rax]
	push rax
	lea rax, [rbp-34872]
	push rax
	call fn__e5_a4_8d_e5_88_b6_e4_b8_b2
	add rsp, 16
	mov rax, offset g_tok_n
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_n], eax
	mov rax, 0
	jmp .Lret__e8_af_8d_e6_b3_95
.Lelse84:
	mov rax, offset g_tok_k
	mov rax, offset g_tok_n
	mov eax, [rax]
	cmp rax, 8192
	jb .Lbok92
	call _rt_oob
.Lbok92:
	imul rax, 4
	push rax
	mov rax, offset g_tok_k
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 6
	mov rcx, rax
	pop rax
	mov [rax], ecx
	mov rax, offset g_tok_s
	mov rax, offset g_tok_n
	mov eax, [rax]
	push rax
	mov rax, 256
	mov rcx, rax
	pop rax
	imul rax, rcx
	cmp rax, 2097152
	jb .Lbok93
	call _rt_oob
.Lbok93:
	imul rax, 4
	push rax
	mov rax, offset g_tok_s
	mov rcx, rax
	pop rax
	add rax, rcx
	mov eax, [rax]
	push rax
	lea rax, [rbp-8]
	mov eax, [rax]
	push rax
	call fn_sh
	add rsp, 16
	mov rax, offset g_tok_s
	mov rax, offset g_tok_n
	mov eax, [rax]
	push rax
	mov rax, 256
	mov rcx, rax
	pop rax
	imul rax, rcx
	cmp rax, 2097152
	jb .Lbok94
	call _rt_oob
.Lbok94:
	imul rax, 4
	push rax
	mov rax, offset g_tok_s
	mov rcx, rax
	pop rax
	add rax, rcx
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 0
	push rax
	call fn_sh
	add rsp, 16
	mov rax, offset g_tok_n
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_n], eax
	mov rax, offset g__e6_ba_90_e7_a0_81_e4_bd_8d
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g__e6_ba_90_e7_a0_81_e4_bd_8d], eax
	jmp .Lltop50
.Llend51:
	mov rax, offset g_tok_k
	mov rax, offset g_tok_n
	mov eax, [rax]
	cmp rax, 8192
	jb .Lbok95
	call _rt_oob
.Lbok95:
	imul rax, 4
	push rax
	mov rax, offset g_tok_k
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	mov [rax], ecx
	mov rax, offset g_tok_v
	mov rax, offset g_tok_n
	mov eax, [rax]
	cmp rax, 8192
	jb .Lbok96
	call _rt_oob
.Lbok96:
	imul rax, 4
	push rax
	mov rax, offset g_tok_v
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	mov [rax], ecx
	mov rax, offset g_tok_s
	mov rax, offset g_tok_n
	mov eax, [rax]
	push rax
	mov rax, 256
	mov rcx, rax
	pop rax
	imul rax, rcx
	cmp rax, 2097152
	jb .Lbok97
	call _rt_oob
.Lbok97:
	imul rax, 4
	push rax
	mov rax, offset g_tok_s
	mov rcx, rax
	pop rax
	add rax, rcx
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr33
	push rax
	call fn__e5_a4_8d_e5_88_b6_e4_b8_b2
	add rsp, 16
	mov rax, offset g_tok_n
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_n], eax
	mov rax, 0
	jmp .Lret__e8_af_8d_e6_b3_95
.Lret__e8_af_8d_e6_b3_95:
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
	mov [rbp-8], rax
.Lltop98:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	lea rax, [rbp-8]
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	call fn_fh
	add rsp, 8
	mov [rbp-16], rax
	mov rax, offset g__e6_ba_90_e7_a0_81
	push rax
	lea rax, [rbp-8]
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-16]
	mov eax, [rax]
	push rax
	call fn_sh
	add rsp, 16
	lea rax, [rbp-16]
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse100
	jmp .Llend99
.Lelse100:
	lea rax, [rbp-8]
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-8], rax
	jmp .Lltop98
.Llend99:
	lea rax, [rbp-8]
	mov eax, [rax]
	mov dword ptr [g__e6_ba_90_e7_a0_81_e9_95_bf], eax
	call fn__e8_af_8d_e6_b3_95
	mov rax, offset g_tok_n
	mov eax, [rax]
	jmp .Lret__e4_b8_bb
.Lret__e4_b8_bb:
	mov rsp, rbp
	pop rbp
	ret

	.section .bss
	.align 4
g__e6_ba_90_e7_a0_81:
	.space 262144
g__e6_ba_90_e7_a0_81_e9_95_bf:
	.space 4
g__e6_ba_90_e7_a0_81_e4_bd_8d:
	.space 4
g_tok_k:
	.space 32768
g_tok_v:
	.space 32768
g_tok_s:
	.space 8388608
g_tok_n:
	.space 4
g__e5_bd_93_e5_89_8d_e8_a1_8c:
	.space 4

	.section .rodata
.Lstr0:
	.asciz "tt"
.Lstr1:
	.asciz "zz"
.Lstr2:
	.asciz "tz"
.Lstr3:
	.asciz "th"
.Lstr4:
	.asciz "tn"
.Lstr5:
	.asciz "tf"
.Lstr6:
	.asciz "ts"
.Lstr7:
	.asciz "tr"
.Lstr8:
	.asciz "td"
.Lstr9:
	.asciz "ht"
.Lstr10:
	.asciz "hz"
.Lstr11:
	.asciz "hh"
.Lstr12:
	.asciz "hl"
.Lstr13:
	.asciz "hf"
.Lstr14:
	.asciz "hs"
.Lstr15:
	.asciz "hr"
.Lstr16:
	.asciz "hd"
.Lstr17:
	.asciz "ll"
.Lstr18:
	.asciz "lr"
.Lstr19:
	.asciz "lz"
.Lstr20:
	.asciz "lh"
.Lstr21:
	.asciz "ls"
.Lstr22:
	.asciz "lf"
.Lstr23:
	.asciz "lt"
.Lstr24:
	.asciz "ld"
.Lstr25:
	.asciz "rd"
.Lstr26:
	.asciz "fh"
.Lstr27:
	.asciz "sh"
.Lstr28:
	.asciz "fl"
.Lstr29:
	.asciz "sl"
.Lstr30:
	.asciz ""
.Lstr31:
	.asciz ""
.Lstr32:
	.asciz "rd"
.Lstr33:
	.asciz "EOF"
	.section .text
