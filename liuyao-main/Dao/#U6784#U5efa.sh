#!/bin/bash
# Dao自言引导 —— 构建脚本
# 用法: bash 构建.sh
set -e
cd "$(dirname "$0")"

echo "[1/5] 编译lyc编译器"
gcc lyc.c -o lyc -O2

echo "[2/5] 编译六爻Dao引导程序 → dao.o"
./lyc -c -对象 dao.ly -o dao.o

echo "[3/5] 链接裸机运行时 → dao (ELF)"
RUNTIME_SRC=dao_runtime.s python3 小链接.py dao.o dao

echo "[4/5] 提取纯二进制 dao.bin"
python3 -c "
f=open('dao','rb'); d=f.read(); f.close()
open('dao.bin','wb').write(d[4096:])
print(f'  dao.bin: {len(d)-4096}字节')
"

echo "[5/5] 汇编boot1 + 拼接可启动镜像"
as --32 boot1.S -o boot1.o
ld -m elf_i386 -T boot1.ld boot1.o -o boot1.elf
objcopy -O binary boot1.elf boot1.bin
cat boot1.bin dao.bin > dao.img
truncate -s 1474560 dao.img

echo ""
echo "构建完成: dao.img (1.44MB软盘镜像)"
echo "运行: qemu-system-x86_64 -fda dao.img -m 256"
echo ""
echo "预期: 屏幕左上角显示绿色 'Dao boot'"
