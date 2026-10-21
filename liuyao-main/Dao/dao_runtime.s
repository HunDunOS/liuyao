# Dao裸机运行时 —— 64位，无Linux依赖
	.intel_syntax noprefix
	.section .text
	.globl _start
_start:
	mov rsp, offset _kernel_stack_top
	xor rbp, rbp
	call qword ptr [rip+_宿_入口]
.hang:
	hlt
	jmp .hang

# 六爻内置指令
	.globl fn_fh, fn_fl, fn_sh, fn_sl
	.globl fn_CPUID, fn_net_tx, fn_zflh, fn_zflz
fn_fh:
	push rbp
	mov rbp, rsp
	mov rax, [rbp+16]
	mov eax, [rax]
	pop rbp
	ret
fn_sh:
	push rbp
	mov rbp, rsp
	mov rcx, [rbp+16]
	mov rax, [rbp+24]
	mov [rax], rcx
	pop rbp
	ret
fn_fl:
fn_sl:
fn_CPUID:
fn_net_tx:
fn_zflh:
fn_zflz:
	xor eax, eax
	ret

	.globl _kernel_stack_top
	.section .bss
	.align 16
	.skip 8192
_kernel_stack_top:

	.section .data
	.globl _宿_入口
_宿_入口: .quad 0
