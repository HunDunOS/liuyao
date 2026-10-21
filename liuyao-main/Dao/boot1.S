/* Dao boot1 — 16→32→64位引导扇区，GNU as Intel语法 */
    .code16
    .intel_syntax noprefix
    .section .boot1, "ax"
    .globl _start

_start:
    cli
    ljmp 0, 1f
1:
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00

    /* 开A20 */
    in al, 0x92
    or al, 2
    out 0x92, al

    /* 读后续扇区到0x10000 */
    mov si, offset dap
    mov ah, 0x42
    int 0x13

    /* 切32位 */
    lgdt gdt_ptr
    mov eax, cr0
    or eax, 1
    mov cr0, eax
    ljmp 8, pm32

    .code32
pm32:
    mov ax, 16
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov esp, 0x7C00

    /* 搬dao.bin 0x10000→0x400000 */
    mov esi, 0x10000
    mov edi, 0x400000
    mov ecx, 2304
    rep movsd

    /* 页表 */
    mov dword ptr [0x1000], 0x2003
    mov dword ptr [0x2000], 0x3003
    mov dword ptr [0x3000], 0x00000083

    mov eax, cr4
    or eax, 0x20
    mov cr4, eax
    mov eax, 0x1000
    mov cr3, eax
    mov ecx, 0xC0000080
    rdmsr
    or eax, 0x100
    wrmsr
    mov eax, cr0
    or eax, 0x80000000
    mov cr0, eax
    ljmp 8, pm64

    .code64
pm64:
    mov rsp, 0x7C00
    jmp 0x400000

dap:
    .byte 0x10, 0
    .word 18
    .long 0x10000
    .quad 1

    .p2align 2
gdt:
    .quad 0
    .quad 0x0020980000000000
    .quad 0x0000920000000000
gdt_ptr:
    .word gdt_ptr - gdt - 1
    .long gdt

    .org 510
    .word 0xAA55
