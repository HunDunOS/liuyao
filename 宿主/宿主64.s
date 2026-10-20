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
	mov rsi, [rsp+16]                     # argv[1]
	lea rdi, [rip+_arg_buf]              # 目标缓冲区
	test rsi, rsi
	jz .arg_done
.arg_copy:
	mov al, [rsi]
	mov [rdi], al
	test al, al
	jz .arg_done
	inc rsi
	inc rdi
	jmp .arg_copy
.arg_done:
	lea rax, [rip+_arg_buf]              # 缓冲区地址
	mov rsp, offset _kernel_stack_top      # 换成我们自己的低地址栈
	push rax                              # 压栈作为主函数第一个参数
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

# ── 平台检测：1=Linux 2=Windows 3=hundunOS ──
	.globl _rt_platform
_rt_platform:
	mov eax, 1
	ret
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

# ── 六爻内置指令（fh/fl/sh/sl等）的宿主实现 ──────────────────────────────
# 调用约定：栈传参，第i个参数在 [rbp+16+8*i]，返回值在 rax
	.globl fn_fh, fn_fl, fn_sh, fn_sl
	.globl fn_CPUID, fn_net_tx, fn_zflh, fn_zflz
	.globl fn__e8_af_bb_e9_94_ae_e7_9b_98
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
fn__e8_af_bb_e9_94_ae_e7_9b_98:
	xor eax, eax
	ret

	.section .data
	.align 8
	.globl _宿_入口
_宿_入口:	.quad 0

	.section .rodata
_宿_越界:	.ascii "数组下标超出范围\n"
_宿_越界尾:

	.section .bss
	.align 8
_arg_buf:	.space 256
	.align 16
_宿_字节:	.space 8
	.align 16
_宿_数尾:	.space 40
	.align 16
_kernel_stack:	.space 262144
_kernel_stack_top:

# ── fn_get_argv1() —— 返回命令行第一个参数（脚本路径）──────────
	.globl fn_get_argv1
fn_get_argv1:
	mov rax, [rip+_argv1_buf]
	ret

	.section .bss
	.align 8
_argv1_buf:	.space 8
	.section .text

# ── fn_system(cmd) —— 执行shell命令 ──────────────────────────────
	.globl fn_system
fn_system:
	push rbp
	mov rbp, rsp
	push rbx
	push r12
	push r13
	mov r12, [rbp+16]		# cmd字符串

	# fork()
	mov rax, 57
	syscall
	cmp rax, 0
	je .sys_child

	# parent: wait4(pid, NULL, 0, NULL)
	mov rdi, rax
	xor rsi, rsi
	xor rdx, rdx
	xor r10, r10
	mov rax, 61
	syscall
	jmp .sys_done

.sys_child:
	# 构造 argv = ["/bin/sh", "-c", cmd, NULL]
	lea rax, [rip+.sys_argv]
	mov qword ptr [rax], offset .sys_sh
	mov qword ptr [rax+8], offset .sys_c
	mov [rax+16], r12
	mov qword ptr [rax+24], 0

	# execve("/bin/sh", argv, NULL)
	lea rdi, [rip+.sys_sh]
	lea rsi, [rip+.sys_argv]
	xor rdx, rdx
	mov rax, 59
	syscall

	# execve失败，exit(1)
	mov rdi, 1
	mov rax, 60
	syscall

.sys_done:
	pop r13
	pop r12
	pop rbx
	pop rbp
	ret

	.section .data
	.align 8
.sys_sh:	.asciz "/bin/sh"
.sys_c:		.asciz "-c"
.sys_argv:	.quad 0, 0, 0, 0
	.section .text

# ── fn_read_file(path) —— 读取文件到缓冲区，返回内容地址 ──────────
	.globl fn_read_file
fn_read_file:
	push rbp
	mov rbp, rsp
	push rbx
	push r12
	mov r12, [rbp+16]		# path

	# open(path, O_RDONLY=0)
	mov rdi, r12
	xor rsi, rsi
	xor rdx, rdx
	mov rax, 2
	syscall
	cmp rax, 0
	jl .rf_fail
	mov rbx, rax			# fd

	# 读取到 _rf_buf (最多4096字节)
	mov rdi, rbx
	lea rsi, [rip+_rf_buf]
	mov rdx, 4095
	xor rax, rax
	syscall
	mov rbx, rax			# 读取字节数

	# 字符串结尾加0
	lea rdi, [rip+_rf_buf]
	mov byte ptr [rdi+rbx], 0

	# close
	mov rdi, rbx
	mov rax, 3
	syscall

	lea rax, [rip+_rf_buf]
	jmp .rf_done

.rf_fail:
	xor rax, rax
.rf_done:
	pop r12
	pop rbx
	pop rbp
	ret

	.section .bss
	.align 8
	.align 8
_rf_buf:	.space 4096
_input_buf:	.space 1024
	.section .text

# ── 小链接别名（fn_前缀）──────────────────────────────────────
	.globl fn__rt_putc, fn__rt_puts, fn__rt_puti, fn__rt_exit, fn__rt_sleep
	.set fn__rt_putc, _rt_putc
	.set fn__rt_puts, _rt_puts
	.set fn__rt_puti, _rt_puti
	.set fn__rt_exit, _rt_exit
	.set fn__rt_sleep, _rt_sleep
	.globl fn__rt_platform
	.set fn__rt_platform, _rt_platform
	.globl fn__rt_getc, fn__rt_getkey, fn__rt_cls, fn__rt_goto, fn__rt_scroll, fn__rt_oob
	.set fn__rt_getc, _rt_getc
	.set fn__rt_getkey, _rt_getkey
	.set fn__rt_cls, _rt_cls
	.set fn__rt_goto, _rt_goto
	.set fn__rt_scroll, _rt_scroll
	.set fn__rt_oob, _rt_oob
	.globl fn_fn_fh, fn_fn_sh, fn_fn_fl, fn_fn_sl
	.set fn_fn_fh, fn_fh
	.set fn_fn_sh, fn_sh
	.set fn_fn_fl, fn_fl
	.set fn_fn_sl, fn_sl
	.globl fn_fn_system, fn_fn_read_file, fn_fn_get_argv1, fn_fn_read_stdin
	.set fn_fn_get_argv1, fn_get_argv1
	.set fn_fn_system, fn_system
	.set fn_fn_read_file, fn_read_file
	.set fn_fn_read_stdin, fn_read_stdin
	.set fn_fn_write_file, fn_write_file
	.set fn_fn_mod, fn_mod

# ── fn_test() —— 测试用，返回42 ──────────────────────────────────
	.globl fn_test
fn_test:
	mov rax, 42
	ret
	.globl fn_fn_test
	.set fn_fn_test, fn_test

# ── fn_fn_get_byte(addr) —— 读取1字节 ─────────────────────────
	.globl fn_fn_get_byte
fn_fn_get_byte:
	push rbp
	mov rbp, rsp
	mov rax, [rbp+16]
	movzx eax, byte ptr [rax]
	pop rbp
	ret

# ── fn_mod(a, b) —— 取模 a % b ─────────────────────────────────
	.globl fn_mod
fn_mod:
	push rbp
	mov rbp, rsp
	mov rax, [rbp+24]		# a (第一个参数)
	mov rcx, [rbp+16]		# b (第二个参数)
	xor rdx, rdx
	idiv rcx
	mov rax, rdx
	leave
	ret

# ── fn_write_file(path, content) —— 写文件 ─────────────────────
	.globl fn_write_file
fn_write_file:
	push rbp
	mov rbp, rsp
	push rbx
	push r12
	push r13
	mov r12, [rbp+16]		# content (第二个参数，先push的在高地址)
	mov r13, [rbp+24]		# path (第一个参数)
	# open(path, O_WRONLY|O_CREAT|O_TRUNC=0x41, 0644)
	mov rdi, r13
	mov rsi, 0x41
	mov rdx, 0x1a4
	mov rax, 2
	syscall
	cmp rax, 0
	jl .wf_fail
	mov rbx, rax			# fd
	# 计算content长度
	mov rdi, r12
	xor rcx, rcx
.wf_len:
	cmp byte ptr [rdi+rcx], 0
	je .wf_len_done
	inc rcx
	jmp .wf_len
.wf_len_done:
	# write(fd, content, len)
	mov rdi, rbx
	mov rsi, r12
	mov rdx, rcx
	mov rax, 1
	syscall
	# close
	mov rdi, rbx
	mov rax, 3
	syscall
	mov rax, 1
	jmp .wf_done
.wf_fail:
	xor rax, rax
.wf_done:
	pop r13
	pop r12
	pop rbx
	leave
	ret

# ── fn_read_stdin() —— 从stdin读一行到_input_buf，返回地址 ──────
	.globl fn_read_stdin
fn_read_stdin:
	push rbp
	mov rbp, rsp
	mov rdi, 0
	lea rsi, [rip+_input_buf]
	mov rdx, 1024
	xor rax, rax
	syscall
	lea rax, [rip+_input_buf]
	leave
	ret

# ── fn_fn_set_byte(addr, val) —— 写1字节 ──────────────────────
	.globl fn_fn_set_byte
fn_fn_set_byte:
	push rbp
	mov rbp, rsp
	mov rcx, [rbp+16]
	mov rax, [rbp+24]
	mov [rax], cl
	pop rbp
	ret

# ── _rt_exit(code) —— 退出进程 ─────────────────────────────────────────────
	.globl _rt_exit
_rt_exit:
	push rbp
	mov rbp, rsp
	mov rdi, [rbp+16]
	mov rax, 60
	syscall
	pop rbp
	ret

# ── _rt_sleep(ms) —— 休眠毫秒 ──────────────────────────────────────────────
	.globl _rt_sleep
_rt_sleep:
	push rbp
	mov rbp, rsp
	sub rsp, 16
	mov rax, [rbp+16]
	mov rcx, 1000
	xor rdx, rdx
	div rcx
	mov [rbp-16], rax
	mov rax, rdx
	mov rcx, 1000000
	mul rcx
	mov [rbp-8], rax
	lea rdi, [rbp-16]
	xor rsi, rsi
	mov rax, 35
	syscall
	leave
	ret
