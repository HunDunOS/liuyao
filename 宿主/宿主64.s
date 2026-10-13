# ══════════════════════════════════════════════════════════════════════
#  宿主64.s —— 六爻 64 位程序的「Linux 宿主运行时」
#
#  六爻编译出来的模块只管算，所有跟外界打交道的事（打印、读键、图形）
#  由这里的符号提供。约定和内核版一样，只是换成 64 位 + Linux 系统调用。
#
#  调用约定（栈传参，8 字节一槽）：
#     调用方： push 参数…  call 符号  add rsp, 8*n
#     被调方： push rbp / mov rbp, rsp 之后，第 i 个参数在 [rbp+16+8*i]
#
#  x86-64 系统调用号： read=0  write=1  exit=60
# ══════════════════════════════════════════════════════════════════════
	.intel_syntax noprefix

	.section .text
	.globl _start
_start:
	mov rsp, offset _kernel_stack_top      # 换成我们自己的低地址栈（不用内核给的）
	xor rbp, rbp
	call qword ptr [rip+_宿_入口]           # 入口地址由小链接.py 填
	mov edi, eax
	mov eax, 60
	syscall

# ── 写一段字节到标准输出 ────────────────────────────────────────────────
# 内部用： rsi=地址  rdx=长度
_宿_写:
	mov eax, 1
	mov edi, 1
	syscall
	ret

# ── _rt_putc(c) —— 输出一个字节（屏幕/串口 → 这里就是 stdout）────────────
	.globl _rt_putc
_rt_putc:
	push rbp
	mov rbp, rsp
	push rsi
	push rdx
	mov rax, [rbp+16]
	mov byte ptr [rip+_宿_字节], al
	lea rsi, [rip+_宿_字节]
	mov edx, 1
	call _宿_写
	pop rdx
	pop rsi
	pop rbp
	ret

# ── _rt_puts(s) —— 输出一个以 0 结尾的字符串 ────────────────────────────
	.globl _rt_puts
_rt_puts:
	push rbp
	mov rbp, rsp
	push rsi
	push rdx
	mov rsi, [rbp+16]
	xor rdx, rdx
0:	cmp byte ptr [rsi+rdx], 0
	je 1f
	inc rdx
	jmp 0b
1:	call _宿_写
	pop rdx
	pop rsi
	pop rbp
	ret

# ── _rt_puti(n) —— 输出一个 32 位十进制数 ───────────────────────────────
	.globl _rt_puti
_rt_puti:
	push rbp
	mov rbp, rsp
	push rbx
	push rsi
	push rdx
	mov eax, [rbp+16]
	mov ebx, 10
	lea rsi, [rip+_宿_数尾]
	mov byte ptr [rsi], 0
	test eax, eax
	jns 2f
	neg eax
	push rax
	mov rax, 45
	mov byte ptr [rip+_宿_字节], al
	lea rsi, [rip+_宿_字节]
	mov edx, 1
	call _宿_写
	pop rax
	lea rsi, [rip+_宿_数尾]
2:	xor edx, edx
	div ebx
	add dl, 48
	dec rsi
	mov [rsi], dl
	test eax, eax
	jnz 2b
	lea rdx, [rip+_宿_数尾]
	sub rdx, rsi
	call _宿_写
	pop rdx
	pop rsi
	pop rbx
	pop rbp
	ret

# ── 宿主上没有屏幕/图形 —— 全给空实现，让链接过得去 ────────────────────
	.globl _rt_cls, _rt_goto, _rt_scroll, _rt_getkey, _kernel_stack_top
_rt_cls:
_rt_goto:
_rt_scroll:
_rt_getkey:
	mov eax, 0
	ret

# ── _rt_getc() —— 读一个字节（阻塞），没有就返回 0 ──────────────────────
	.globl _rt_getc
_rt_getc:
	mov eax, 0
	xor edi, edi
	lea rsi, [rip+_宿_字节]
	mov edx, 1
	syscall
	cmp rax, 1
	jne 3f
	movzx eax, byte ptr [rip+_宿_字节]
	ret
3:	xor eax, eax
	ret

# ── _rt_oob —— 数组越界：报一句然后退出 ────────────────────────────────
	.globl _rt_oob
_rt_oob:
	lea rsi, [rip+_宿_越界]
	mov edx, _宿_越界尾 - _宿_越界
	call _宿_写
	mov edi, 1
	mov eax, 60
	syscall

# ── 图形一整套：宿主上全是空实现 ───────────────────────────────────────
	.globl _gfx_init, _gfx_px, _gfx_fill, _gfx_frame, _gfx_fillblend
	.globl _gfx_text, _gfx_num, _gfx_hex, _gfx_getpx, _gfx_getw, _gfx_geth
	.globl _gfx_getfb, _gfx_getmem, _gfx_scrollup, _gfx_scrollrect
	.globl _gfx_msx, _gfx_msy, _gfx_msbtn, _gfx_ms, _gfx_key, _gfx_sleep
	.globl _gfx_sec, _gfx_min, _gfx_hour
_gfx_init:
_gfx_px:
_gfx_fill:
_gfx_frame:
_gfx_fillblend:
_gfx_text:
_gfx_num:
_gfx_hex:
_gfx_getpx:
_gfx_getw:
_gfx_geth:
_gfx_getfb:
_gfx_getmem:
_gfx_scrollup:
_gfx_scrollrect:
_gfx_msx:
_gfx_msy:
_gfx_msbtn:
_gfx_ms:
_gfx_key:
_gfx_sleep:
_gfx_sec:
_gfx_min:
_gfx_hour:
	mov eax, 0
	ret

# ── 机器原语（宿主上给假值）────────────────────────────────────────────
	.globl _pr_in8, _pr_in16, _pr_in32, _pr_out8, _pr_out16, _pr_out32
	.globl _pr_ld8, _pr_ld32, _pr_cpuid, _pr_halt
	.globl _pr_ca, _pr_cb, _pr_cc, _pr_cd, _pr_call
_pr_in8:
_pr_in16:
_pr_in32:
_pr_ld8:
_pr_ld32:
_pr_ca:
_pr_cb:
_pr_cc:
_pr_cd:
_pr_call:
	xor eax, eax
	ret
_pr_out8:
_pr_out16:
_pr_out32:
	ret
_pr_cpuid:
	ret
_pr_halt:
	mov edi, 0
	mov eax, 60
	syscall

	.section .data
	.align 8
	.globl _宿_入口
_宿_入口:	.quad 0

	.section .rodata
_宿_越界:	.ascii "数组下标超出范围\n"
_宿_越界尾:

	.section .bss
	.align 16
_宿_字节:	.space 8
	.align 16
_宿_数尾:	.space 40
	.align 16
_kernel_stack:	.space 262144
_kernel_stack_top:
