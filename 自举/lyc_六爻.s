# 由 六爻(liuyao) 编译器 lyc 生成
	.intel_syntax noprefix

	.section .text
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
	push rax
	mov rax, 255
	mov rcx, rax
	pop rax
	and rax, rcx
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
	push rax
	mov rax, 255
	mov rcx, rax
	pop rax
	and rax, rcx
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
	push rax
	mov rax, 255
	mov rcx, rax
	pop rax
	and rax, rcx
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
	sub rsp, 34928
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
	push rax
	mov rax, 255
	mov rcx, rax
	pop rax
	and rax, rcx
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
	jmp .Lltop50
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
	push rax
	mov rax, offset g_tok_n
	mov eax, [rax]
	push rax
	mov rax, 256
	mov rcx, rax
	pop rax
	imul rax, rcx
	mov rcx, rax
	pop rax
	add rax, rcx
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
	jmp .Lltop50
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
	jz .Lelse57
.Lltop58:
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
	push rax
	mov rax, 255
	mov rcx, rax
	pop rax
	and rax, rcx
	mov [rbp-34920], rax
	lea rax, [rbp-34920]
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse60
	jmp .Llend59
.Lelse60:
	lea rax, [rbp-34920]
	mov eax, [rax]
	push rax
	mov rax, 10
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse61
	jmp .Llend59
.Lelse61:
	mov rax, offset g__e6_ba_90_e7_a0_81_e4_bd_8d
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g__e6_ba_90_e7_a0_81_e4_bd_8d], eax
	jmp .Lltop58
.Llend59:
.Lelse57:
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
	jz .Lelse62
	mov rax, 0
	mov [rbp-24], rax
	mov rax, 0
	mov [rbp-32], rax
.Lltop63:
	lea rax, [rbp-32]
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse65
	jmp .Llend64
.Lelse65:
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
	push rax
	mov rax, 255
	mov rcx, rax
	pop rax
	and rax, rcx
	mov [rbp-34920], rax
	lea rax, [rbp-34920]
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
	mov rax, 1
	mov [rbp-32], rax
.Lelse66:
	lea rax, [rbp-32]
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse67
	lea rax, [rbp-24]
	mov eax, [rax]
	push rax
	lea rax, [rbp-34920]
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
.Lelse67:
	jmp .Lltop63
.Llend64:
	mov rax, offset g_tok_k
	mov rax, offset g_tok_n
	mov eax, [rax]
	cmp rax, 8192
	jb .Lbok68
	call _rt_oob
.Lbok68:
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
	jb .Lbok69
	call _rt_oob
.Lbok69:
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
	push rax
	mov rax, offset g_tok_n
	mov eax, [rax]
	push rax
	mov rax, 256
	mov rcx, rax
	pop rax
	imul rax, rcx
	mov rcx, rax
	pop rax
	add rax, rcx
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
	jmp .Lltop50
.Lelse62:
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
	mov [rbp-2096], rax
	mov rax, 0
	mov [rbp-2104], rax
.Lltop71:
	lea rax, [rbp-2104]
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse73
	jmp .Llend72
.Lelse73:
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
	push rax
	mov rax, 255
	mov rcx, rax
	pop rax
	and rax, rcx
	mov [rbp-34920], rax
	lea rax, [rbp-34920]
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
	jz .Lelse74
	mov rax, 1
	mov [rbp-2104], rax
.Lelse74:
	lea rax, [rbp-2104]
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse75
	lea rax, [rbp-2088]
	push rax
	lea rax, [rbp-2096]
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-34920]
	mov eax, [rax]
	push rax
	call fn_sh
	add rsp, 16
	lea rax, [rbp-2096]
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-2096], rax
	mov rax, offset g__e6_ba_90_e7_a0_81_e4_bd_8d
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g__e6_ba_90_e7_a0_81_e4_bd_8d], eax
.Lelse75:
	jmp .Lltop71
.Llend72:
	lea rax, [rbp-2088]
	push rax
	lea rax, [rbp-2096]
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 0
	push rax
	call fn_sh
	add rsp, 16
	lea rax, [rbp-2088]
	push rax
	mov rax, offset .Lstr32
	push rax
	call fn__e6_af_94_e8_be_83_e4_b8_b2
	add rsp, 16
	mov [rbp-2120], rax
	lea rax, [rbp-2120]
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse76
.Lltop77:
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
	push rax
	mov rax, 255
	mov rcx, rax
	pop rax
	and rax, rcx
	mov [rbp-34920], rax
	lea rax, [rbp-34920]
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse79
	jmp .Llend78
.Lelse79:
	lea rax, [rbp-34920]
	mov eax, [rax]
	push rax
	mov rax, 10
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse80
	jmp .Llend78
.Lelse80:
	mov rax, offset g__e6_ba_90_e7_a0_81_e4_bd_8d
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g__e6_ba_90_e7_a0_81_e4_bd_8d], eax
	jmp .Lltop77
.Llend78:
.Lelse76:
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
	mov rax, 3
	mov rcx, rax
	pop rax
	mov [rax], ecx
	lea rax, [rbp-2088]
	push rax
	call fn__e6_98_af_e5_85_b3_e9_94_ae_e5_ad_97
	add rsp, 8
	mov [rbp-2136], rax
	lea rax, [rbp-2136]
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse82
	mov rax, offset g_tok_k
	mov rax, offset g_tok_n
	mov eax, [rax]
	cmp rax, 8192
	jb .Lbok83
	call _rt_oob
.Lbok83:
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
.Lelse82:
	mov rax, offset g_tok_v
	mov rax, offset g_tok_n
	mov eax, [rax]
	cmp rax, 8192
	jb .Lbok84
	call _rt_oob
.Lbok84:
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
	push rax
	mov rax, offset g_tok_n
	mov eax, [rax]
	push rax
	mov rax, 256
	mov rcx, rax
	pop rax
	imul rax, rcx
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-2088]
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
	jmp .Lltop50
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
	jz .Lelse85
	mov rax, offset g__e6_ba_90_e7_a0_81_e4_bd_8d
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g__e6_ba_90_e7_a0_81_e4_bd_8d], eax
	mov rax, 0
	mov [rbp-34912], rax
.Lltop86:
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
	push rax
	mov rax, 255
	mov rcx, rax
	pop rax
	and rax, rcx
	mov [rbp-34920], rax
	lea rax, [rbp-34920]
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse88
	jmp .Llend87
.Lelse88:
	lea rax, [rbp-34920]
	mov eax, [rax]
	push rax
	mov rax, 34
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse89
	jmp .Llend87
.Lelse89:
	lea rax, [rbp-34904]
	push rax
	lea rax, [rbp-34912]
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-34920]
	mov eax, [rax]
	push rax
	call fn_sh
	add rsp, 16
	lea rax, [rbp-34912]
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-34912], rax
	mov rax, offset g__e6_ba_90_e7_a0_81_e4_bd_8d
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g__e6_ba_90_e7_a0_81_e4_bd_8d], eax
	jmp .Lltop86
.Llend87:
	lea rax, [rbp-34904]
	push rax
	lea rax, [rbp-34912]
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
	jb .Lbok90
	call _rt_oob
.Lbok90:
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
	jb .Lbok91
	call _rt_oob
.Lbok91:
	imul rax, 4
	push rax
	mov rax, offset g_tok_v
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-34912]
	mov eax, [rax]
	mov rcx, rax
	pop rax
	mov [rax], ecx
	mov rax, offset g_tok_s
	push rax
	mov rax, offset g_tok_n
	mov eax, [rax]
	push rax
	mov rax, 256
	mov rcx, rax
	pop rax
	imul rax, rcx
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-34904]
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
	jmp .Lltop50
.Lelse85:
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
	push rax
	mov rax, offset g_tok_n
	mov eax, [rax]
	push rax
	mov rax, 256
	mov rcx, rax
	pop rax
	imul rax, rcx
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-8]
	mov eax, [rax]
	push rax
	call fn_sh
	add rsp, 16
	mov rax, offset g_tok_s
	push rax
	mov rax, offset g_tok_n
	mov eax, [rax]
	push rax
	mov rax, 256
	mov rcx, rax
	pop rax
	imul rax, rcx
	mov rcx, rax
	pop rax
	add rax, rcx
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
	jb .Lbok93
	call _rt_oob
.Lbok93:
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
	jb .Lbok94
	call _rt_oob
.Lbok94:
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
	push rax
	mov rax, offset g_tok_n
	mov eax, [rax]
	push rax
	mov rax, 256
	mov rcx, rax
	pop rax
	imul rax, rcx
	mov rcx, rax
	pop rax
	add rax, rcx
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
	sub rsp, 2080
	mov rax, 0
	mov rax, 0
	mov [rbp-2056], rax
	mov rax, offset .Lstr34
	mov [rbp-2064], rax
.Lltop95:
	lea rax, [rbp-2064]
	mov eax, [rax]
	push rax
	lea rax, [rbp-2056]
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	call fn_fh
	add rsp, 8
	push rax
	mov rax, 255
	mov rcx, rax
	pop rax
	and rax, rcx
	mov [rbp-2072], rax
	lea rax, [rbp-2048]
	push rax
	lea rax, [rbp-2056]
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-2072]
	mov eax, [rax]
	push rax
	call fn_sh
	add rsp, 16
	lea rax, [rbp-2072]
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse97
	jmp .Llend96
.Lelse97:
	lea rax, [rbp-2056]
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-2056], rax
	jmp .Lltop95
.Llend96:
	lea rax, [rbp-2048]
	push rax
	call fn__e7_bc_96_e8_af_91
	add rsp, 8
	mov rax, 0
	jmp .Lret__e4_b8_bb
.Lret__e4_b8_bb:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn__e8_be_93_e5_87_ba_e5_ad_97
fn__e8_be_93_e5_87_ba_e5_ad_97:
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
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87
	push rax
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87_e4_bd_8d
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
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87_e4_bd_8d
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g__e8_be_93_e5_87_ba_e6_b1_87_e4_bd_8d], eax
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
	jmp .Lret__e8_be_93_e5_87_ba_e5_ad_97
.Lret__e8_be_93_e5_87_ba_e5_ad_97:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn__e8_be_93_e5_87_ba_e6_8d_a2
fn__e8_be_93_e5_87_ba_e6_8d_a2:
	push rbp
	mov rbp, rsp
	mov rax, 0
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87
	push rax
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87_e4_bd_8d
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 10
	push rax
	call fn_sh
	add rsp, 16
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87_e4_bd_8d
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g__e8_be_93_e5_87_ba_e6_b1_87_e4_bd_8d], eax
	mov rax, 0
	jmp .Lret__e8_be_93_e5_87_ba_e6_8d_a2
.Lret__e8_be_93_e5_87_ba_e6_8d_a2:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn__e8_be_93_e5_87_ba_e8_a1_8c
fn__e8_be_93_e5_87_ba_e8_a1_8c:
	push rbp
	mov rbp, rsp
	mov rax, 0
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	call fn__e8_be_93_e5_87_ba_e5_ad_97
	add rsp, 8
	call fn__e8_be_93_e5_87_ba_e6_8d_a2
	mov rax, 0
	jmp .Lret__e8_be_93_e5_87_ba_e8_a1_8c
.Lret__e8_be_93_e5_87_ba_e8_a1_8c:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn__e6_96_b0_e6_a0_87_e5_8f_b7
fn__e6_96_b0_e6_a0_87_e5_8f_b7:
	push rbp
	mov rbp, rsp
	mov rax, 0
	mov rax, offset g__e6_a0_87_e5_8f_b7_e8_ae_a1_e6_95_b0
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g__e6_a0_87_e5_8f_b7_e8_ae_a1_e6_95_b0], eax
	mov rax, offset g__e6_a0_87_e5_8f_b7_e8_ae_a1_e6_95_b0
	mov eax, [rax]
	jmp .Lret__e6_96_b0_e6_a0_87_e5_8f_b7
.Lret__e6_96_b0_e6_a0_87_e5_8f_b7:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn__e6_89_be_e5_b1_80_e9_83_a8
fn__e6_89_be_e5_b1_80_e9_83_a8:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rax, 0
	mov rax, 0
	mov [rbp-8], rax
.Lltop101:
	lea rax, [rbp-8]
	mov eax, [rax]
	push rax
	mov rax, offset g__e5_b1_80_e9_83_a8_e6_95_b0
	mov eax, [rax]
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse103
	jmp .Llend102
.Lelse103:
	mov rax, offset g__e5_b1_80_e9_83_a8_e5_90_8d
	push rax
	lea rax, [rbp-8]
	mov eax, [rax]
	push rax
	mov rax, 64
	mov rcx, rax
	pop rax
	imul rax, rcx
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp+16]
	mov eax, [rax]
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
	jz .Lelse104
	lea rax, [rbp-8]
	mov eax, [rax]
	jmp .Lret__e6_89_be_e5_b1_80_e9_83_a8
.Lelse104:
	lea rax, [rbp-8]
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-8], rax
	jmp .Lltop101
.Llend102:
	mov rax, 1
	neg rax
	jmp .Lret__e6_89_be_e5_b1_80_e9_83_a8
.Lret__e6_89_be_e5_b1_80_e9_83_a8:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn__e5_8a_a0_e5_b1_80_e9_83_a8
fn__e5_8a_a0_e5_b1_80_e9_83_a8:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rax, 0
	mov rax, offset g__e5_b1_80_e9_83_a8_e6_95_b0
	mov eax, [rax]
	mov [rbp-8], rax
	mov rax, offset g__e5_b1_80_e9_83_a8_e5_90_8d
	push rax
	lea rax, [rbp-8]
	mov eax, [rax]
	push rax
	mov rax, 64
	mov rcx, rax
	pop rax
	imul rax, rcx
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	call fn__e5_a4_8d_e5_88_b6_e4_b8_b2
	add rsp, 16
	mov rax, offset g__e5_b8_a7_e5_b0_ba_e5_af_b8
	mov eax, [rax]
	push rax
	mov rax, 8
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g__e5_b8_a7_e5_b0_ba_e5_af_b8], eax
	mov rax, offset g__e5_b1_80_e9_83_a8_e5_81_8f
	lea rax, [rbp-8]
	mov eax, [rax]
	cmp rax, 256
	jb .Lbok105
	call _rt_oob
.Lbok105:
	imul rax, 4
	push rax
	mov rax, offset g__e5_b1_80_e9_83_a8_e5_81_8f
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 0
	push rax
	mov rax, offset g__e5_b8_a7_e5_b0_ba_e5_af_b8
	mov eax, [rax]
	mov rcx, rax
	pop rax
	sub rax, rcx
	mov rcx, rax
	pop rax
	mov [rax], ecx
	mov rax, offset g__e5_b1_80_e9_83_a8_e5_b0_ba
	lea rax, [rbp-8]
	mov eax, [rax]
	cmp rax, 256
	jb .Lbok106
	call _rt_oob
.Lbok106:
	imul rax, 4
	push rax
	mov rax, offset g__e5_b1_80_e9_83_a8_e5_b0_ba
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 4
	mov rcx, rax
	pop rax
	mov [rax], ecx
	mov rax, offset g__e5_b1_80_e9_83_a8_e6_95_b0
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g__e5_b1_80_e9_83_a8_e6_95_b0], eax
	lea rax, [rbp-8]
	mov eax, [rax]
	jmp .Lret__e5_8a_a0_e5_b1_80_e9_83_a8
.Lret__e5_8a_a0_e5_b1_80_e9_83_a8:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn__e6_98_af_e6_a0_87_e7_82_b9
fn__e6_98_af_e6_a0_87_e7_82_b9:
	push rbp
	mov rbp, rsp
	mov rax, 0
	mov rax, offset g_tok_k
	mov rax, offset g_tok_pos
	mov eax, [rax]
	cmp rax, 8192
	jb .Lbok107
	call _rt_oob
.Lbok107:
	imul rax, 4
	push rax
	mov rax, offset g_tok_k
	mov rcx, rax
	pop rax
	add rax, rcx
	mov eax, [rax]
	push rax
	mov rax, 6
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse108
	mov rax, offset g_tok_s
	push rax
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 256
	mov rcx, rax
	pop rax
	imul rax, rcx
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp+16]
	mov eax, [rax]
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
	jz .Lelse109
	mov rax, 1
	jmp .Lret__e6_98_af_e6_a0_87_e7_82_b9
.Lelse109:
.Lelse108:
	mov rax, 0
	jmp .Lret__e6_98_af_e6_a0_87_e7_82_b9
.Lret__e6_98_af_e6_a0_87_e7_82_b9:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn__e5_90_83_e6_a0_87_e7_82_b9
fn__e5_90_83_e6_a0_87_e7_82_b9:
	push rbp
	mov rbp, rsp
	mov rax, 0
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	call fn__e6_98_af_e6_a0_87_e7_82_b9
	add rsp, 8
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse110
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_pos], eax
	mov rax, 1
	jmp .Lret__e5_90_83_e6_a0_87_e7_82_b9
.Lelse110:
	mov rax, 0
	jmp .Lret__e5_90_83_e6_a0_87_e7_82_b9
.Lret__e5_90_83_e6_a0_87_e7_82_b9:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn__e8_b7_b3_e8_bf_87_e6_8d_a2_e8_a1_8c
fn__e8_b7_b3_e8_bf_87_e6_8d_a2_e8_a1_8c:
	push rbp
	mov rbp, rsp
	mov rax, 0
.Lltop111:
	mov rax, offset g_tok_k
	mov rax, offset g_tok_pos
	mov eax, [rax]
	cmp rax, 8192
	jb .Lbok113
	call _rt_oob
.Lbok113:
	imul rax, 4
	push rax
	mov rax, offset g_tok_k
	mov rcx, rax
	pop rax
	add rax, rcx
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse114
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_pos], eax
.Lelse114:
	mov rax, offset g_tok_k
	mov rax, offset g_tok_pos
	mov eax, [rax]
	cmp rax, 8192
	jb .Lbok115
	call _rt_oob
.Lbok115:
	imul rax, 4
	push rax
	mov rax, offset g_tok_k
	mov rcx, rax
	pop rax
	add rax, rcx
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .Lelse116
	jmp .Llend112
.Lelse116:
	jmp .Lltop111
.Llend112:
	mov rax, 0
	jmp .Lret__e8_b7_b3_e8_bf_87_e6_8d_a2_e8_a1_8c
.Lret__e8_b7_b3_e8_bf_87_e6_8d_a2_e8_a1_8c:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn__e5_8f_96_e4_bc_98_e5_85_88_e7_ba_a7
fn__e5_8f_96_e4_bc_98_e5_85_88_e7_ba_a7:
	push rbp
	mov rbp, rsp
	mov rax, 0
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr35
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
	jz .Lelse117
	mov rax, 10
	jmp .Lret__e5_8f_96_e4_bc_98_e5_85_88_e7_ba_a7
.Lelse117:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr36
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
	jz .Lelse118
	mov rax, 10
	jmp .Lret__e5_8f_96_e4_bc_98_e5_85_88_e7_ba_a7
.Lelse118:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr37
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
	jz .Lelse119
	mov rax, 10
	jmp .Lret__e5_8f_96_e4_bc_98_e5_85_88_e7_ba_a7
.Lelse119:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr38
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
	jz .Lelse120
	mov rax, 9
	jmp .Lret__e5_8f_96_e4_bc_98_e5_85_88_e7_ba_a7
.Lelse120:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr39
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
	jz .Lelse121
	mov rax, 9
	jmp .Lret__e5_8f_96_e4_bc_98_e5_85_88_e7_ba_a7
.Lelse121:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr40
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
	jz .Lelse122
	mov rax, 5
	jmp .Lret__e5_8f_96_e4_bc_98_e5_85_88_e7_ba_a7
.Lelse122:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr41
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
	jz .Lelse123
	mov rax, 4
	jmp .Lret__e5_8f_96_e4_bc_98_e5_85_88_e7_ba_a7
.Lelse123:
	lea rax, [rbp+16]
	mov eax, [rax]
	push rax
	mov rax, offset .Lstr42
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
	jz .Lelse124
	mov rax, 3
	jmp .Lret__e5_8f_96_e4_bc_98_e5_85_88_e7_ba_a7
.Lelse124:
	mov rax, 0
	jmp .Lret__e5_8f_96_e4_bc_98_e5_85_88_e7_ba_a7
.Lret__e5_8f_96_e4_bc_98_e5_85_88_e7_ba_a7:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn__e6_98_af_e8_bf_90_e7_ae_97_e7_ac_a6
fn__e6_98_af_e8_bf_90_e7_ae_97_e7_ac_a6:
	push rbp
	mov rbp, rsp
	sub rsp, 2048
	mov rax, 0
	mov rax, offset g_tok_k
	mov rax, offset g_tok_pos
	mov eax, [rax]
	cmp rax, 8192
	jb .Lbok125
	call _rt_oob
.Lbok125:
	imul rax, 4
	push rax
	mov rax, offset g_tok_k
	mov rcx, rax
	pop rax
	add rax, rcx
	mov eax, [rax]
	push rax
	mov rax, 4
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setne al
	movzx rax, al
	test rax, rax
	jz .Lelse126
	mov rax, 0
	jmp .Lret__e6_98_af_e8_bf_90_e7_ae_97_e7_ac_a6
.Lelse126:
	lea rax, [rbp-2048]
	push rax
	mov rax, offset g_tok_s
	push rax
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 256
	mov rcx, rax
	pop rax
	imul rax, rcx
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	call fn__e5_a4_8d_e5_88_b6_e4_b8_b2
	add rsp, 16
	lea rax, [rbp-2048]
	push rax
	call fn__e5_8f_96_e4_bc_98_e5_85_88_e7_ba_a7
	add rsp, 8
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setg al
	movzx rax, al
	test rax, rax
	jz .Lelse127
	mov rax, 1
	jmp .Lret__e6_98_af_e8_bf_90_e7_ae_97_e7_ac_a6
.Lelse127:
	mov rax, 0
	jmp .Lret__e6_98_af_e8_bf_90_e7_ae_97_e7_ac_a6
.Lret__e6_98_af_e8_bf_90_e7_ae_97_e7_ac_a6:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn__e8_a7_a3_e6_9e_90_e8_a1_a8_e8_be_be_e5_bc_8f
fn__e8_a7_a3_e6_9e_90_e8_a1_a8_e8_be_be_e5_bc_8f:
	push rbp
	mov rbp, rsp
	sub rsp, 2064
	mov rax, 0
	call fn__e8_a7_a3_e6_9e_90_e5_9f_ba_e6_9c_ac_e5_bc_8f
.Lltop128:
	call fn__e6_98_af_e8_bf_90_e7_ae_97_e7_ac_a6
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse130
	jmp .Llend129
.Lelse130:
	lea rax, [rbp-2048]
	push rax
	mov rax, offset g_tok_s
	push rax
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 256
	mov rcx, rax
	pop rax
	imul rax, rcx
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	call fn__e5_a4_8d_e5_88_b6_e4_b8_b2
	add rsp, 16
	lea rax, [rbp-2048]
	push rax
	call fn__e5_8f_96_e4_bc_98_e5_85_88_e7_ba_a7
	add rsp, 8
	mov [rbp-2056], rax
	lea rax, [rbp-2056]
	mov eax, [rax]
	push rax
	lea rax, [rbp+16]
	mov eax, [rax]
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setl al
	movzx rax, al
	test rax, rax
	jz .Lelse131
	jmp .Llend129
.Lelse131:
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_pos], eax
	mov rax, offset .Lstr43
	push rax
	call fn__e8_be_93_e5_87_ba_e8_a1_8c
	add rsp, 8
	lea rax, [rbp-2056]
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	call fn__e8_a7_a3_e6_9e_90_e8_a1_a8_e8_be_be_e5_bc_8f
	add rsp, 8
	mov rax, offset .Lstr44
	push rax
	call fn__e8_be_93_e5_87_ba_e8_a1_8c
	add rsp, 8
	lea rax, [rbp-2048]
	push rax
	mov rax, offset .Lstr45
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
	jz .Lelse132
	mov rax, offset .Lstr46
	push rax
	call fn__e8_be_93_e5_87_ba_e8_a1_8c
	add rsp, 8
.Lelse132:
	lea rax, [rbp-2048]
	push rax
	mov rax, offset .Lstr47
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
	jz .Lelse133
	mov rax, offset .Lstr48
	push rax
	call fn__e8_be_93_e5_87_ba_e8_a1_8c
	add rsp, 8
.Lelse133:
	lea rax, [rbp-2048]
	push rax
	mov rax, offset .Lstr49
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
	jz .Lelse134
	mov rax, offset .Lstr50
	push rax
	call fn__e8_be_93_e5_87_ba_e8_a1_8c
	add rsp, 8
.Lelse134:
	mov rax, offset .Lstr51
	push rax
	call fn__e8_be_93_e5_87_ba_e8_a1_8c
	add rsp, 8
	jmp .Lltop128
.Llend129:
	mov rax, 0
	jmp .Lret__e8_a7_a3_e6_9e_90_e8_a1_a8_e8_be_be_e5_bc_8f
.Lret__e8_a7_a3_e6_9e_90_e8_a1_a8_e8_be_be_e5_bc_8f:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn__e8_a7_a3_e6_9e_90_e5_9f_ba_e6_9c_ac_e5_bc_8f
fn__e8_a7_a3_e6_9e_90_e5_9f_ba_e6_9c_ac_e5_bc_8f:
	push rbp
	mov rbp, rsp
	sub rsp, 2096
	mov rax, 0
	mov rax, offset .Lstr52
	push rax
	call fn__e6_98_af_e6_a0_87_e7_82_b9
	add rsp, 8
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse135
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_pos], eax
	mov rax, 0
	push rax
	call fn__e8_a7_a3_e6_9e_90_e8_a1_a8_e8_be_be_e5_bc_8f
	add rsp, 8
	mov rax, offset .Lstr53
	push rax
	call fn__e5_90_83_e6_a0_87_e7_82_b9
	add rsp, 8
	mov rax, 0
	jmp .Lret__e8_a7_a3_e6_9e_90_e5_9f_ba_e6_9c_ac_e5_bc_8f
.Lelse135:
	mov rax, offset g_tok_k
	mov rax, offset g_tok_pos
	mov eax, [rax]
	cmp rax, 8192
	jb .Lbok136
	call _rt_oob
.Lbok136:
	imul rax, 4
	push rax
	mov rax, offset g_tok_k
	mov rcx, rax
	pop rax
	add rax, rcx
	mov eax, [rax]
	push rax
	mov rax, 3
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse137
	lea rax, [rbp-2048]
	push rax
	mov rax, offset g_tok_s
	push rax
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 256
	mov rcx, rax
	pop rax
	imul rax, rcx
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	call fn__e5_a4_8d_e5_88_b6_e4_b8_b2
	add rsp, 16
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_pos], eax
	mov rax, offset .Lstr54
	push rax
	call fn__e6_98_af_e6_a0_87_e7_82_b9
	add rsp, 8
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse138
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_pos], eax
	mov rax, 0
	mov [rbp-2056], rax
	mov rax, offset .Lstr55
	push rax
	call fn__e6_98_af_e6_a0_87_e7_82_b9
	add rsp, 8
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse139
.Lltop140:
	mov rax, 0
	push rax
	call fn__e8_a7_a3_e6_9e_90_e8_a1_a8_e8_be_be_e5_bc_8f
	add rsp, 8
	mov rax, offset .Lstr56
	push rax
	call fn__e8_be_93_e5_87_ba_e8_a1_8c
	add rsp, 8
	lea rax, [rbp-2056]
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-2056], rax
	mov rax, offset .Lstr57
	push rax
	call fn__e6_98_af_e6_a0_87_e7_82_b9
	add rsp, 8
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse142
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_pos], eax
.Lelse142:
	mov rax, offset .Lstr58
	push rax
	call fn__e6_98_af_e6_a0_87_e7_82_b9
	add rsp, 8
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse143
	jmp .Llend141
.Lelse143:
	jmp .Lltop140
.Llend141:
.Lelse139:
	mov rax, offset .Lstr59
	push rax
	call fn__e5_90_83_e6_a0_87_e7_82_b9
	add rsp, 8
	mov rax, offset .Lstr60
	push rax
	call fn__e8_be_93_e5_87_ba_e5_ad_97
	add rsp, 8
	lea rax, [rbp-2048]
	push rax
	call fn__e8_be_93_e5_87_ba_e5_ad_97
	add rsp, 8
	call fn__e8_be_93_e5_87_ba_e6_8d_a2
	lea rax, [rbp-2056]
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setg al
	movzx rax, al
	test rax, rax
	jz .Lelse144
	mov rax, offset .Lstr61
	push rax
	call fn__e8_be_93_e5_87_ba_e5_ad_97
	add rsp, 8
	lea rax, [rbp-2056]
	mov eax, [rax]
	push rax
	mov rax, 8
	mov rcx, rax
	pop rax
	imul rax, rcx
	mov [rbp-2064], rax
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87
	push rax
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87_e4_bd_8d
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 48
	push rax
	lea rax, [rbp-2064]
	mov eax, [rax]
	push rax
	mov rax, 10
	mov rcx, rax
	pop rax
	xor rdx, rdx
	div rcx
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	call fn_sh
	add rsp, 16
	call fn__e8_be_93_e5_87_ba_e6_8d_a2
.Lelse144:
	mov rax, 0
	jmp .Lret__e8_a7_a3_e6_9e_90_e5_9f_ba_e6_9c_ac_e5_bc_8f
.Lelse138:
	lea rax, [rbp-2048]
	push rax
	call fn__e6_89_be_e5_b1_80_e9_83_a8
	add rsp, 8
	mov [rbp-2072], rax
	lea rax, [rbp-2072]
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setge al
	movzx rax, al
	test rax, rax
	jz .Lelse145
	mov rax, offset g__e5_b1_80_e9_83_a8_e6_95_b0_e7_bb_84_e6_88_90
	lea rax, [rbp-2072]
	mov eax, [rax]
	cmp rax, 256
	jb .Lbok146
	call _rt_oob
.Lbok146:
	imul rax, 4
	push rax
	mov rax, offset g__e5_b1_80_e9_83_a8_e6_95_b0_e7_bb_84_e6_88_90
	mov rcx, rax
	pop rax
	add rax, rcx
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse147
	mov rax, offset .Lstr62
	push rax
	call fn__e8_be_93_e5_87_ba_e5_ad_97
	add rsp, 8
.Lelse147:
	mov rax, offset g__e5_b1_80_e9_83_a8_e6_95_b0_e7_bb_84_e6_88_90
	lea rax, [rbp-2072]
	mov eax, [rax]
	cmp rax, 256
	jb .Lbok148
	call _rt_oob
.Lbok148:
	imul rax, 4
	push rax
	mov rax, offset g__e5_b1_80_e9_83_a8_e6_95_b0_e7_bb_84_e6_88_90
	mov rcx, rax
	pop rax
	add rax, rcx
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse149
	mov rax, offset .Lstr63
	push rax
	call fn__e8_be_93_e5_87_ba_e5_ad_97
	add rsp, 8
.Lelse149:
	mov rax, offset g__e5_b1_80_e9_83_a8_e5_81_8f
	lea rax, [rbp-2072]
	mov eax, [rax]
	cmp rax, 256
	jb .Lbok150
	call _rt_oob
.Lbok150:
	imul rax, 4
	push rax
	mov rax, offset g__e5_b1_80_e9_83_a8_e5_81_8f
	mov rcx, rax
	pop rax
	add rax, rcx
	mov eax, [rax]
	mov [rbp-2080], rax
	lea rax, [rbp-2080]
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setge al
	movzx rax, al
	test rax, rax
	jz .Lelse151
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87
	push rax
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87_e4_bd_8d
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 43
	push rax
	call fn_sh
	add rsp, 16
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87
	push rax
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87_e4_bd_8d
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 48
	push rax
	lea rax, [rbp-2080]
	mov eax, [rax]
	push rax
	mov rax, 10
	mov rcx, rax
	pop rax
	xor rdx, rdx
	div rcx
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	call fn_sh
	add rsp, 16
.Lelse151:
	lea rax, [rbp-2080]
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setl al
	movzx rax, al
	test rax, rax
	jz .Lelse152
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87
	push rax
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87_e4_bd_8d
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 45
	push rax
	call fn_sh
	add rsp, 16
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87
	push rax
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87_e4_bd_8d
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 48
	push rax
	mov rax, 0
	push rax
	lea rax, [rbp-2080]
	mov eax, [rax]
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
	mov rax, 10
	mov rcx, rax
	pop rax
	xor rdx, rdx
	div rcx
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	call fn_sh
	add rsp, 16
.Lelse152:
	mov rax, offset .Lstr64
	push rax
	call fn__e8_be_93_e5_87_ba_e5_ad_97
	add rsp, 8
	call fn__e8_be_93_e5_87_ba_e6_8d_a2
.Lelse145:
	mov rax, 0
	jmp .Lret__e8_a7_a3_e6_9e_90_e5_9f_ba_e6_9c_ac_e5_bc_8f
.Lelse137:
	mov rax, offset g_tok_k
	mov rax, offset g_tok_pos
	mov eax, [rax]
	cmp rax, 8192
	jb .Lbok153
	call _rt_oob
.Lbok153:
	imul rax, 4
	push rax
	mov rax, offset g_tok_k
	mov rcx, rax
	pop rax
	add rax, rcx
	mov eax, [rax]
	push rax
	mov rax, 2
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse154
	mov rax, offset g_tok_v
	mov rax, offset g_tok_pos
	mov eax, [rax]
	cmp rax, 8192
	jb .Lbok155
	call _rt_oob
.Lbok155:
	imul rax, 4
	push rax
	mov rax, offset g_tok_v
	mov rcx, rax
	pop rax
	add rax, rcx
	mov eax, [rax]
	mov [rbp-2088], rax
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_pos], eax
	mov rax, offset .Lstr65
	push rax
	call fn__e8_be_93_e5_87_ba_e5_ad_97
	add rsp, 8
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87
	push rax
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87_e4_bd_8d
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 48
	push rax
	lea rax, [rbp-2088]
	mov eax, [rax]
	push rax
	mov rax, 10
	mov rcx, rax
	pop rax
	xor rdx, rdx
	div rcx
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	call fn_sh
	add rsp, 16
	call fn__e8_be_93_e5_87_ba_e6_8d_a2
	mov rax, 0
	jmp .Lret__e8_a7_a3_e6_9e_90_e5_9f_ba_e6_9c_ac_e5_bc_8f
.Lelse154:
	mov rax, offset g_tok_k
	mov rax, offset g_tok_pos
	mov eax, [rax]
	cmp rax, 8192
	jb .Lbok156
	call _rt_oob
.Lbok156:
	imul rax, 4
	push rax
	mov rax, offset g_tok_k
	mov rcx, rax
	pop rax
	add rax, rcx
	mov eax, [rax]
	push rax
	mov rax, 5
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse157
	mov rax, offset .Lstr66
	push rax
	call fn__e6_96_b0_e6_a0_87_e5_8f_b7
	add rsp, 8
	mov [rbp-2096], rax
	mov rax, offset .Lstr67
	push rax
	call fn__e8_be_93_e5_87_ba_e5_ad_97
	add rsp, 8
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87
	push rax
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87_e4_bd_8d
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 48
	push rax
	lea rax, [rbp-2096]
	mov eax, [rax]
	push rax
	mov rax, 10
	mov rcx, rax
	pop rax
	xor rdx, rdx
	div rcx
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	call fn_sh
	add rsp, 16
	mov rax, offset .Lstr68
	push rax
	call fn__e8_be_93_e5_87_ba_e5_ad_97
	add rsp, 8
	call fn__e8_be_93_e5_87_ba_e6_8d_a2
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_pos], eax
	mov rax, 0
	jmp .Lret__e8_a7_a3_e6_9e_90_e5_9f_ba_e6_9c_ac_e5_bc_8f
.Lelse157:
	mov rax, 0
	jmp .Lret__e8_a7_a3_e6_9e_90_e5_9f_ba_e6_9c_ac_e5_bc_8f
.Lret__e8_a7_a3_e6_9e_90_e5_9f_ba_e6_9c_ac_e5_bc_8f:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn__e8_a7_a3_e6_9e_90_e8_af_ad_e5_8f_a5
fn__e8_a7_a3_e6_9e_90_e8_af_ad_e5_8f_a5:
	push rbp
	mov rbp, rsp
	sub rsp, 4176
	mov rax, 0
	call fn__e8_b7_b3_e8_bf_87_e6_8d_a2_e8_a1_8c
	mov rax, offset .Lstr69
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
	jz .Lelse158
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_pos], eax
	mov rax, 0
	push rax
	call fn__e8_a7_a3_e6_9e_90_e8_a1_a8_e8_be_be_e5_bc_8f
	add rsp, 8
	mov rax, 0
	jmp .Lret__e8_a7_a3_e6_9e_90_e8_af_ad_e5_8f_a5
.Lelse158:
	mov rax, offset .Lstr70
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
	jz .Lelse159
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_pos], eax
	lea rax, [rbp-4160]
	push rax
	mov rax, offset g_tok_s
	push rax
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 256
	mov rcx, rax
	pop rax
	imul rax, rcx
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	call fn__e5_a4_8d_e5_88_b6_e4_b8_b2
	add rsp, 16
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_pos], eax
	mov rax, 0
	mov [rbp-2056], rax
	mov rax, offset .Lstr71
	push rax
	call fn__e6_98_af_e6_a0_87_e7_82_b9
	add rsp, 8
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse160
	mov rax, 1
	mov [rbp-2056], rax
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_pos], eax
	mov rax, 0
	mov [rbp-2064], rax
.Lltop161:
	lea rax, [rbp-2064]
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse163
	jmp .Llend162
.Lelse163:
	mov rax, offset .Lstr72
	push rax
	call fn__e6_98_af_e6_a0_87_e7_82_b9
	add rsp, 8
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse164
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_pos], eax
	mov rax, 1
	mov [rbp-2064], rax
.Lelse164:
	lea rax, [rbp-2064]
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse165
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_pos], eax
.Lelse165:
	jmp .Lltop161
.Llend162:
.Lelse160:
	mov rax, offset .Lstr73
	push rax
	call fn__e6_98_af_e6_a0_87_e7_82_b9
	add rsp, 8
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse166
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_pos], eax
	mov rax, 0
	push rax
	call fn__e8_a7_a3_e6_9e_90_e8_a1_a8_e8_be_be_e5_bc_8f
	add rsp, 8
	lea rax, [rbp-4160]
	push rax
	call fn__e5_8a_a0_e5_b1_80_e9_83_a8
	add rsp, 8
	mov [rbp-4168], rax
	mov rax, offset g__e5_b1_80_e9_83_a8_e6_95_b0_e7_bb_84_e6_88_90
	lea rax, [rbp-4168]
	mov eax, [rax]
	cmp rax, 256
	jb .Lbok167
	call _rt_oob
.Lbok167:
	imul rax, 4
	push rax
	mov rax, offset g__e5_b1_80_e9_83_a8_e6_95_b0_e7_bb_84_e6_88_90
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-2056]
	mov eax, [rax]
	mov rcx, rax
	pop rax
	mov [rax], ecx
	mov rax, offset .Lstr74
	push rax
	call fn__e8_be_93_e5_87_ba_e5_ad_97
	add rsp, 8
	mov rax, offset g__e5_b1_80_e9_83_a8_e5_81_8f
	lea rax, [rbp-4168]
	mov eax, [rax]
	cmp rax, 256
	jb .Lbok168
	call _rt_oob
.Lbok168:
	imul rax, 4
	push rax
	mov rax, offset g__e5_b1_80_e9_83_a8_e5_81_8f
	mov rcx, rax
	pop rax
	add rax, rcx
	mov eax, [rax]
	mov [rbp-4176], rax
	lea rax, [rbp-4176]
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setge al
	movzx rax, al
	test rax, rax
	jz .Lelse169
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87
	push rax
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87_e4_bd_8d
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 43
	push rax
	call fn_sh
	add rsp, 16
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87
	push rax
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87_e4_bd_8d
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 48
	push rax
	lea rax, [rbp-4176]
	mov eax, [rax]
	push rax
	mov rax, 10
	mov rcx, rax
	pop rax
	xor rdx, rdx
	div rcx
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	call fn_sh
	add rsp, 16
.Lelse169:
	lea rax, [rbp-4176]
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setl al
	movzx rax, al
	test rax, rax
	jz .Lelse170
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87
	push rax
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87_e4_bd_8d
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 45
	push rax
	call fn_sh
	add rsp, 16
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87
	push rax
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87_e4_bd_8d
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 48
	push rax
	mov rax, 0
	push rax
	lea rax, [rbp-4176]
	mov eax, [rax]
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
	mov rax, 10
	mov rcx, rax
	pop rax
	xor rdx, rdx
	div rcx
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	call fn_sh
	add rsp, 16
.Lelse170:
	mov rax, offset .Lstr75
	push rax
	call fn__e8_be_93_e5_87_ba_e5_ad_97
	add rsp, 8
	call fn__e8_be_93_e5_87_ba_e6_8d_a2
	mov rax, 0
	jmp .Lret__e8_a7_a3_e6_9e_90_e8_af_ad_e5_8f_a5
.Lelse166:
	mov rax, 0
	mov [rbp-2088], rax
	mov rax, offset g_tok_k
	mov rax, offset g_tok_pos
	mov eax, [rax]
	cmp rax, 8192
	jb .Lbok171
	call _rt_oob
.Lbok171:
	imul rax, 4
	push rax
	mov rax, offset g_tok_k
	mov rcx, rax
	pop rax
	add rax, rcx
	mov eax, [rax]
	push rax
	mov rax, 2
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse172
	mov rax, 1
	mov [rbp-2088], rax
.Lelse172:
	mov rax, offset g_tok_k
	mov rax, offset g_tok_pos
	mov eax, [rax]
	cmp rax, 8192
	jb .Lbok173
	call _rt_oob
.Lbok173:
	imul rax, 4
	push rax
	mov rax, offset g_tok_k
	mov rcx, rax
	pop rax
	add rax, rcx
	mov eax, [rax]
	push rax
	mov rax, 3
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse174
	mov rax, 1
	mov [rbp-2088], rax
.Lelse174:
	mov rax, offset g_tok_k
	mov rax, offset g_tok_pos
	mov eax, [rax]
	cmp rax, 8192
	jb .Lbok175
	call _rt_oob
.Lbok175:
	imul rax, 4
	push rax
	mov rax, offset g_tok_k
	mov rcx, rax
	pop rax
	add rax, rcx
	mov eax, [rax]
	push rax
	mov rax, 5
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse176
	mov rax, 1
	mov [rbp-2088], rax
.Lelse176:
	lea rax, [rbp-2088]
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse177
	mov rax, 0
	push rax
	call fn__e8_a7_a3_e6_9e_90_e8_a1_a8_e8_be_be_e5_bc_8f
	add rsp, 8
	lea rax, [rbp-4160]
	push rax
	call fn__e5_8a_a0_e5_b1_80_e9_83_a8
	add rsp, 8
	mov [rbp-4168], rax
	mov rax, offset g__e5_b1_80_e9_83_a8_e6_95_b0_e7_bb_84_e6_88_90
	lea rax, [rbp-4168]
	mov eax, [rax]
	cmp rax, 256
	jb .Lbok178
	call _rt_oob
.Lbok178:
	imul rax, 4
	push rax
	mov rax, offset g__e5_b1_80_e9_83_a8_e6_95_b0_e7_bb_84_e6_88_90
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-2056]
	mov eax, [rax]
	mov rcx, rax
	pop rax
	mov [rax], ecx
	mov rax, offset .Lstr76
	push rax
	call fn__e8_be_93_e5_87_ba_e5_ad_97
	add rsp, 8
	mov rax, offset g__e5_b1_80_e9_83_a8_e5_81_8f
	lea rax, [rbp-4168]
	mov eax, [rax]
	cmp rax, 256
	jb .Lbok179
	call _rt_oob
.Lbok179:
	imul rax, 4
	push rax
	mov rax, offset g__e5_b1_80_e9_83_a8_e5_81_8f
	mov rcx, rax
	pop rax
	add rax, rcx
	mov eax, [rax]
	mov [rbp-4176], rax
	lea rax, [rbp-4176]
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setge al
	movzx rax, al
	test rax, rax
	jz .Lelse180
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87
	push rax
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87_e4_bd_8d
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 43
	push rax
	call fn_sh
	add rsp, 16
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87
	push rax
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87_e4_bd_8d
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 48
	push rax
	lea rax, [rbp-4176]
	mov eax, [rax]
	push rax
	mov rax, 10
	mov rcx, rax
	pop rax
	xor rdx, rdx
	div rcx
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	call fn_sh
	add rsp, 16
.Lelse180:
	lea rax, [rbp-4176]
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setl al
	movzx rax, al
	test rax, rax
	jz .Lelse181
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87
	push rax
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87_e4_bd_8d
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 45
	push rax
	call fn_sh
	add rsp, 16
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87
	push rax
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87_e4_bd_8d
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 48
	push rax
	mov rax, 0
	push rax
	lea rax, [rbp-4176]
	mov eax, [rax]
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
	mov rax, 10
	mov rcx, rax
	pop rax
	xor rdx, rdx
	div rcx
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	call fn_sh
	add rsp, 16
.Lelse181:
	mov rax, offset .Lstr77
	push rax
	call fn__e8_be_93_e5_87_ba_e5_ad_97
	add rsp, 8
	call fn__e8_be_93_e5_87_ba_e6_8d_a2
	mov rax, 0
	jmp .Lret__e8_a7_a3_e6_9e_90_e8_af_ad_e5_8f_a5
.Lelse177:
	lea rax, [rbp-4160]
	push rax
	call fn__e5_8a_a0_e5_b1_80_e9_83_a8
	add rsp, 8
	mov [rbp-4168], rax
	mov rax, offset g__e5_b1_80_e9_83_a8_e6_95_b0_e7_bb_84_e6_88_90
	lea rax, [rbp-4168]
	mov eax, [rax]
	cmp rax, 256
	jb .Lbok182
	call _rt_oob
.Lbok182:
	imul rax, 4
	push rax
	mov rax, offset g__e5_b1_80_e9_83_a8_e6_95_b0_e7_bb_84_e6_88_90
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	lea rax, [rbp-2056]
	mov eax, [rax]
	mov rcx, rax
	pop rax
	mov [rax], ecx
	mov rax, 0
	jmp .Lret__e8_a7_a3_e6_9e_90_e8_af_ad_e5_8f_a5
.Lelse159:
	mov rax, offset .Lstr78
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
	jz .Lelse183
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_pos], eax
	mov rax, 0
	push rax
	call fn__e8_a7_a3_e6_9e_90_e8_a1_a8_e8_be_be_e5_bc_8f
	add rsp, 8
	mov rax, offset .Lstr79
	push rax
	call fn__e8_be_93_e5_87_ba_e5_ad_97
	add rsp, 8
	call fn__e8_be_93_e5_87_ba_e6_8d_a2
	mov rax, offset .Lstr80
	push rax
	call fn__e8_be_93_e5_87_ba_e5_ad_97
	add rsp, 8
	call fn__e8_be_93_e5_87_ba_e6_8d_a2
	mov rax, offset .Lstr81
	push rax
	call fn__e8_be_93_e5_87_ba_e5_ad_97
	add rsp, 8
	call fn__e8_be_93_e5_87_ba_e6_8d_a2
	mov rax, 0
	jmp .Lret__e8_a7_a3_e6_9e_90_e8_af_ad_e5_8f_a5
.Lelse183:
	mov rax, offset g_tok_k
	mov rax, offset g_tok_pos
	mov eax, [rax]
	cmp rax, 8192
	jb .Lbok184
	call _rt_oob
.Lbok184:
	imul rax, 4
	push rax
	mov rax, offset g_tok_k
	mov rcx, rax
	pop rax
	add rax, rcx
	mov eax, [rax]
	push rax
	mov rax, 3
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse185
	mov rax, offset .Lstr82
	push rax
	call fn__e6_98_af_e6_a0_87_e7_82_b9
	add rsp, 8
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse186
	lea rax, [rbp-4160]
	push rax
	mov rax, offset g_tok_s
	push rax
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 256
	mov rcx, rax
	pop rax
	imul rax, rcx
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	call fn__e5_a4_8d_e5_88_b6_e4_b8_b2
	add rsp, 16
	mov rax, offset .Lstr83
	push rax
	call fn__e6_98_af_e6_a0_87_e7_82_b9
	add rsp, 8
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse187
	mov rax, 0
	push rax
	call fn__e8_a7_a3_e6_9e_90_e8_a1_a8_e8_be_be_e5_bc_8f
	add rsp, 8
	lea rax, [rbp-4160]
	push rax
	call fn__e6_89_be_e5_b1_80_e9_83_a8
	add rsp, 8
	mov [rbp-4168], rax
	lea rax, [rbp-4168]
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setge al
	movzx rax, al
	test rax, rax
	jz .Lelse188
	mov rax, offset .Lstr84
	push rax
	call fn__e8_be_93_e5_87_ba_e5_ad_97
	add rsp, 8
	mov rax, offset g__e5_b1_80_e9_83_a8_e5_81_8f
	lea rax, [rbp-4168]
	mov eax, [rax]
	cmp rax, 256
	jb .Lbok189
	call _rt_oob
.Lbok189:
	imul rax, 4
	push rax
	mov rax, offset g__e5_b1_80_e9_83_a8_e5_81_8f
	mov rcx, rax
	pop rax
	add rax, rcx
	mov eax, [rax]
	mov [rbp-4176], rax
	lea rax, [rbp-4176]
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setge al
	movzx rax, al
	test rax, rax
	jz .Lelse190
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87
	push rax
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87_e4_bd_8d
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 43
	push rax
	call fn_sh
	add rsp, 16
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87
	push rax
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87_e4_bd_8d
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 48
	push rax
	lea rax, [rbp-4176]
	mov eax, [rax]
	push rax
	mov rax, 10
	mov rcx, rax
	pop rax
	xor rdx, rdx
	div rcx
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	call fn_sh
	add rsp, 16
.Lelse190:
	lea rax, [rbp-4176]
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	setl al
	movzx rax, al
	test rax, rax
	jz .Lelse191
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87
	push rax
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87_e4_bd_8d
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 45
	push rax
	call fn_sh
	add rsp, 16
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87
	push rax
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87_e4_bd_8d
	mov eax, [rax]
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	mov rax, 48
	push rax
	mov rax, 0
	push rax
	lea rax, [rbp-4176]
	mov eax, [rax]
	mov rcx, rax
	pop rax
	sub rax, rcx
	push rax
	mov rax, 10
	mov rcx, rax
	pop rax
	xor rdx, rdx
	div rcx
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	call fn_sh
	add rsp, 16
.Lelse191:
	mov rax, offset .Lstr85
	push rax
	call fn__e8_be_93_e5_87_ba_e5_ad_97
	add rsp, 8
	call fn__e8_be_93_e5_87_ba_e6_8d_a2
.Lelse188:
	mov rax, 0
	jmp .Lret__e8_a7_a3_e6_9e_90_e8_af_ad_e5_8f_a5
.Lelse187:
.Lelse186:
	mov rax, 0
	push rax
	call fn__e8_a7_a3_e6_9e_90_e8_a1_a8_e8_be_be_e5_bc_8f
	add rsp, 8
	mov rax, 0
	jmp .Lret__e8_a7_a3_e6_9e_90_e8_af_ad_e5_8f_a5
.Lelse185:
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_pos], eax
	mov rax, 0
	jmp .Lret__e8_a7_a3_e6_9e_90_e8_af_ad_e5_8f_a5
.Lret__e8_a7_a3_e6_9e_90_e8_af_ad_e5_8f_a5:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn__e8_a7_a3_e6_9e_90_e5_9d_97
fn__e8_a7_a3_e6_9e_90_e5_9d_97:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rax, 0
	mov rax, offset .Lstr86
	push rax
	call fn__e5_90_83_e6_a0_87_e7_82_b9
	add rsp, 8
	mov rax, 0
	mov [rbp-8], rax
.Lltop192:
	lea rax, [rbp-8]
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse194
	jmp .Llend193
.Lelse194:
	call fn__e8_b7_b3_e8_bf_87_e6_8d_a2_e8_a1_8c
	mov rax, offset .Lstr87
	push rax
	call fn__e6_98_af_e6_a0_87_e7_82_b9
	add rsp, 8
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse195
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_pos], eax
	mov rax, 1
	mov [rbp-8], rax
.Lelse195:
	mov rax, offset g_tok_k
	mov rax, offset g_tok_pos
	mov eax, [rax]
	cmp rax, 8192
	jb .Lbok196
	call _rt_oob
.Lbok196:
	imul rax, 4
	push rax
	mov rax, offset g_tok_k
	mov rcx, rax
	pop rax
	add rax, rcx
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse197
	mov rax, 1
	mov [rbp-8], rax
.Lelse197:
	lea rax, [rbp-8]
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse198
	call fn__e8_a7_a3_e6_9e_90_e8_af_ad_e5_8f_a5
.Lelse198:
	jmp .Lltop192
	jmp .Lltop192
.Llend193:
	mov rax, 0
	jmp .Lret__e8_a7_a3_e6_9e_90_e5_9d_97
.Lret__e8_a7_a3_e6_9e_90_e5_9d_97:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn__e8_a7_a3_e6_9e_90_e5_87_bd_e6_95_b0
fn__e8_a7_a3_e6_9e_90_e5_87_bd_e6_95_b0:
	push rbp
	mov rbp, rsp
	sub rsp, 2048
	mov rax, 0
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_pos], eax
	lea rax, [rbp-2048]
	push rax
	mov rax, offset g_tok_s
	push rax
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 256
	mov rcx, rax
	pop rax
	imul rax, rcx
	mov rcx, rax
	pop rax
	add rax, rcx
	push rax
	call fn__e5_a4_8d_e5_88_b6_e4_b8_b2
	add rsp, 16
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_pos], eax
	mov rax, offset .Lstr88
	push rax
	call fn__e5_90_83_e6_a0_87_e7_82_b9
	add rsp, 8
	mov rax, offset .Lstr89
	push rax
	call fn__e5_90_83_e6_a0_87_e7_82_b9
	add rsp, 8
	mov rax, offset .Lstr90
	push rax
	call fn__e5_90_83_e6_a0_87_e7_82_b9
	add rsp, 8
	mov rax, offset .Lstr91
	push rax
	call fn__e5_90_83_e6_a0_87_e7_82_b9
	add rsp, 8
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_pos], eax
	mov rax, 0
	mov dword ptr [g__e5_b1_80_e9_83_a8_e6_95_b0], eax
	mov rax, 0
	mov dword ptr [g__e5_b8_a7_e5_b0_ba_e5_af_b8], eax
	mov rax, offset .Lstr92
	push rax
	call fn__e8_be_93_e5_87_ba_e5_ad_97
	add rsp, 8
	lea rax, [rbp-2048]
	push rax
	call fn__e8_be_93_e5_87_ba_e5_ad_97
	add rsp, 8
	call fn__e8_be_93_e5_87_ba_e6_8d_a2
	mov rax, offset .Lstr93
	push rax
	call fn__e8_be_93_e5_87_ba_e5_ad_97
	add rsp, 8
	lea rax, [rbp-2048]
	push rax
	call fn__e8_be_93_e5_87_ba_e5_ad_97
	add rsp, 8
	mov rax, offset .Lstr94
	push rax
	call fn__e8_be_93_e5_87_ba_e5_ad_97
	add rsp, 8
	call fn__e8_be_93_e5_87_ba_e6_8d_a2
	mov rax, offset .Lstr95
	push rax
	call fn__e8_be_93_e5_87_ba_e5_ad_97
	add rsp, 8
	call fn__e8_be_93_e5_87_ba_e6_8d_a2
	mov rax, offset .Lstr96
	push rax
	call fn__e8_be_93_e5_87_ba_e5_ad_97
	add rsp, 8
	call fn__e8_be_93_e5_87_ba_e6_8d_a2
	call fn__e8_a7_a3_e6_9e_90_e5_9d_97
	mov rax, offset .Lstr97
	push rax
	call fn__e8_be_93_e5_87_ba_e5_ad_97
	add rsp, 8
	call fn__e8_be_93_e5_87_ba_e6_8d_a2
	mov rax, offset .Lstr98
	push rax
	call fn__e8_be_93_e5_87_ba_e5_ad_97
	add rsp, 8
	call fn__e8_be_93_e5_87_ba_e6_8d_a2
	mov rax, offset .Lstr99
	push rax
	call fn__e8_be_93_e5_87_ba_e5_ad_97
	add rsp, 8
	call fn__e8_be_93_e5_87_ba_e6_8d_a2
	mov rax, 0
	jmp .Lret__e8_a7_a3_e6_9e_90_e5_87_bd_e6_95_b0
.Lret__e8_a7_a3_e6_9e_90_e5_87_bd_e6_95_b0:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn__e8_a7_a3_e6_9e_90_e9_a1_b6_e5_b1_82
fn__e8_a7_a3_e6_9e_90_e9_a1_b6_e5_b1_82:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rax, 0
	mov rax, 0
	mov [rbp-8], rax
.Lltop199:
	lea rax, [rbp-8]
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse201
	jmp .Llend200
.Lelse201:
	call fn__e8_b7_b3_e8_bf_87_e6_8d_a2_e8_a1_8c
	mov rax, offset g_tok_k
	mov rax, offset g_tok_pos
	mov eax, [rax]
	cmp rax, 8192
	jb .Lbok202
	call _rt_oob
.Lbok202:
	imul rax, 4
	push rax
	mov rax, offset g_tok_k
	mov rcx, rax
	pop rax
	add rax, rcx
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse203
	mov rax, 1
	mov [rbp-8], rax
.Lelse203:
	mov rax, offset .Lstr100
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
	jz .Lelse204
	call fn__e8_a7_a3_e6_9e_90_e5_87_bd_e6_95_b0
	mov rax, 0
	jmp .Lret__e8_a7_a3_e6_9e_90_e9_a1_b6_e5_b1_82
.Lelse204:
	mov rax, offset .Lstr101
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
	jz .Lelse205
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_pos], eax
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_pos], eax
	mov rax, offset .Lstr102
	push rax
	call fn__e6_98_af_e6_a0_87_e7_82_b9
	add rsp, 8
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse206
	mov rax, 0
	mov [rbp-16], rax
.Lltop207:
	lea rax, [rbp-16]
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse209
	jmp .Llend208
.Lelse209:
	mov rax, offset .Lstr103
	push rax
	call fn__e6_98_af_e6_a0_87_e7_82_b9
	add rsp, 8
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse210
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_pos], eax
	mov rax, 1
	mov [rbp-16], rax
.Lelse210:
	lea rax, [rbp-16]
	mov eax, [rax]
	push rax
	mov rax, 0
	mov rcx, rax
	pop rax
	cmp rax, rcx
	sete al
	movzx rax, al
	test rax, rax
	jz .Lelse211
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_pos], eax
.Lelse211:
	jmp .Lltop207
.Llend208:
.Lelse206:
	mov rax, 0
	jmp .Lret__e8_a7_a3_e6_9e_90_e9_a1_b6_e5_b1_82
.Lelse205:
	mov rax, offset g_tok_pos
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov dword ptr [g_tok_pos], eax
	jmp .Lltop199
.Llend200:
	mov rax, 0
	jmp .Lret__e8_a7_a3_e6_9e_90_e9_a1_b6_e5_b1_82
.Lret__e8_a7_a3_e6_9e_90_e9_a1_b6_e5_b1_82:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn__e8_be_93_e5_87_ba_e7_bc_93_e5_86_b2_e5_8c_ba
fn__e8_be_93_e5_87_ba_e7_bc_93_e5_86_b2_e5_8c_ba:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rax, 0
	mov rax, 0
	mov [rbp-8], rax
.Lltop212:
	lea rax, [rbp-8]
	mov eax, [rax]
	push rax
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87_e4_bd_8d
	mov eax, [rax]
	mov rcx, rax
	pop rax
	cmp rax, rcx
	jne .Lelse214
	jmp .Llend213
.Lelse214:
	mov rax, offset g__e8_be_93_e5_87_ba_e6_b1_87
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
	lea rax, [rbp-16]
	mov eax, [rax]
	push rax
	call fn__rt_putc
	add rsp, 8
	lea rax, [rbp-8]
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-8], rax
	jmp .Lltop212
.Llend213:
	lea rax, [rbp-8]
	mov eax, [rax]
	jmp .Lret__e8_be_93_e5_87_ba_e7_bc_93_e5_86_b2_e5_8c_ba
.Lret__e8_be_93_e5_87_ba_e7_bc_93_e5_86_b2_e5_8c_ba:
	mov rsp, rbp
	pop rbp
	ret

	.globl fn__e7_bc_96_e8_af_91
fn__e7_bc_96_e8_af_91:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rax, 0
	mov rax, 0
	mov [rbp-8], rax
.Lltop215:
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
	push rax
	mov rax, 255
	mov rcx, rax
	pop rax
	and rax, rcx
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
	jne .Lelse217
	jmp .Llend216
.Lelse217:
	lea rax, [rbp-8]
	mov eax, [rax]
	push rax
	mov rax, 1
	mov rcx, rax
	pop rax
	add rax, rcx
	mov [rbp-8], rax
	jmp .Lltop215
.Llend216:
	lea rax, [rbp-8]
	mov eax, [rax]
	mov dword ptr [g__e6_ba_90_e7_a0_81_e9_95_bf], eax
	mov rax, 0
	mov dword ptr [g__e6_ba_90_e7_a0_81_e4_bd_8d], eax
	call fn__e8_af_8d_e6_b3_95
	mov rax, 0
	mov dword ptr [g_tok_pos], eax
	mov rax, 0
	mov dword ptr [g__e8_be_93_e5_87_ba_e6_b1_87_e4_bd_8d], eax
	mov rax, 0
	mov dword ptr [g__e6_a0_87_e5_8f_b7_e8_ae_a1_e6_95_b0], eax
	mov rax, offset .Lstr104
	push rax
	call fn__e8_be_93_e5_87_ba_e8_a1_8c
	add rsp, 8
	mov rax, offset .Lstr105
	push rax
	call fn__e8_be_93_e5_87_ba_e8_a1_8c
	add rsp, 8
	call fn__e8_a7_a3_e6_9e_90_e9_a1_b6_e5_b1_82
	call fn__e8_be_93_e5_87_ba_e7_bc_93_e5_86_b2_e5_8c_ba
	mov rax, 0
	jmp .Lret__e7_bc_96_e8_af_91
.Lret__e7_bc_96_e8_af_91:
	mov rsp, rbp
	pop rbp
	ret

	.section .bss
	.align 4
	.comm g__e6_ba_90_e7_a0_81, 262144, 4
	.comm g__e6_ba_90_e7_a0_81_e9_95_bf, 4, 4
	.comm g__e6_ba_90_e7_a0_81_e4_bd_8d, 4, 4
	.comm g_tok_k, 32768, 4
	.comm g_tok_v, 32768, 4
	.comm g_tok_s, 8388608, 4
	.comm g_tok_n, 4, 4
	.comm g_tok_pos, 4, 4
	.comm g__e5_bd_93_e5_89_8d_e8_a1_8c, 4, 4
	.comm g__e8_be_93_e5_87_ba_e6_b1_87, 1048576, 4
	.comm g__e8_be_93_e5_87_ba_e6_b1_87_e4_bd_8d, 4, 4
	.comm g__e6_a0_87_e5_8f_b7_e8_ae_a1_e6_95_b0, 4, 4
	.comm g__e5_b1_80_e9_83_a8_e5_90_8d, 65536, 4
	.comm g__e5_b1_80_e9_83_a8_e5_81_8f, 1024, 4
	.comm g__e5_b1_80_e9_83_a8_e5_b0_ba, 1024, 4
	.comm g__e5_b1_80_e9_83_a8_e6_95_b0_e7_bb_84_e6_88_90, 1024, 4
	.comm g__e5_b1_80_e9_83_a8_e6_95_b0, 4, 4
	.comm g__e5_b8_a7_e5_b0_ba_e5_af_b8, 4, 4
	.comm g__e5_9c_a8_e5_87_bd_e6_95_b0, 4, 4

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
.Lstr34:
	.asciz "tt 主() -> u32 {tz x 3 ht 4 zz x }"
.Lstr35:
	.asciz "hh"
.Lstr36:
	.asciz "hl"
.Lstr37:
	.asciz "hf"
.Lstr38:
	.asciz "ht"
.Lstr39:
	.asciz "hz"
.Lstr40:
	.asciz "hs"
.Lstr41:
	.asciz "hd"
.Lstr42:
	.asciz "hr"
.Lstr43:
	.asciz "push rax"
.Lstr44:
	.asciz "pop rcx"
.Lstr45:
	.asciz "ht"
.Lstr46:
	.asciz "add rcx, rax"
.Lstr47:
	.asciz "hz"
.Lstr48:
	.asciz "sub rcx, rax"
.Lstr49:
	.asciz "hh"
.Lstr50:
	.asciz "imul rcx, rax"
.Lstr51:
	.asciz "mov rax, rcx"
.Lstr52:
	.asciz "("
.Lstr53:
	.asciz ")"
.Lstr54:
	.asciz "("
.Lstr55:
	.asciz ")"
.Lstr56:
	.asciz "push rax"
.Lstr57:
	.asciz ","
.Lstr58:
	.asciz ")"
.Lstr59:
	.asciz ")"
.Lstr60:
	.asciz "call fn_"
.Lstr61:
	.asciz "add rsp, "
.Lstr62:
	.asciz "lea rax, [rbp"
.Lstr63:
	.asciz "mov rax, [rbp"
.Lstr64:
	.asciz "]"
.Lstr65:
	.asciz "mov rax, "
.Lstr66:
	.asciz "str"
.Lstr67:
	.asciz "lea rax, [rip+.Lstr"
.Lstr68:
	.asciz "]"
.Lstr69:
	.asciz "zt"
.Lstr70:
	.asciz "tz"
.Lstr71:
	.asciz "["
.Lstr72:
	.asciz "]"
.Lstr73:
	.asciz "="
.Lstr74:
	.asciz "mov [rbp"
.Lstr75:
	.asciz "], rax"
.Lstr76:
	.asciz "mov [rbp"
.Lstr77:
	.asciz "], rax"
.Lstr78:
	.asciz "zz"
.Lstr79:
	.asciz "mov rsp, rbp"
.Lstr80:
	.asciz "pop rbp"
.Lstr81:
	.asciz "ret"
.Lstr82:
	.asciz "("
.Lstr83:
	.asciz "="
.Lstr84:
	.asciz "mov [rbp"
.Lstr85:
	.asciz "], rax"
.Lstr86:
	.asciz "{"
.Lstr87:
	.asciz "}"
.Lstr88:
	.asciz "("
.Lstr89:
	.asciz ")"
.Lstr90:
	.asciz "-"
.Lstr91:
	.asciz ">"
.Lstr92:
	.asciz ".globl fn_"
.Lstr93:
	.asciz "fn_"
.Lstr94:
	.asciz ":"
.Lstr95:
	.asciz "push rbp"
.Lstr96:
	.asciz "mov rbp, rsp"
.Lstr97:
	.asciz "mov rsp, rbp"
.Lstr98:
	.asciz "pop rbp"
.Lstr99:
	.asciz "ret"
.Lstr100:
	.asciz "tt"
.Lstr101:
	.asciz "qj"
.Lstr102:
	.asciz "["
.Lstr103:
	.asciz "]"
.Lstr104:
	.asciz ".intel_syntax noprefix"
.Lstr105:
	.asciz ".section .text"
	.section .text
