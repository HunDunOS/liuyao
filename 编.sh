#!/bin/sh
# ══════════════════════════════════════════════════════════════════
#  六爻 —— 一条命令：源码 → 可执行 → 跑
#
#      sh 编.sh 示例/三角.ly            编 + 链 + 跑
#      sh 编.sh 示例/三角.ly -只编       只编，不跑
#
#  跨平台：Linux / macOS / Windows(Git Bash) / Android(Termux) / 任意 Unix
#    · 编译器是纯 C，任何 C 编译器都能编
#    · 程序是 x86-64 机器码
#      - x86-64 电脑：原生跑
#      - 手机 / 苹果 M 芯片：用 qemu-x86_64 跑（装法见 怎么学.txt）
# ══════════════════════════════════════════════════════════════════
set -e
R="$(cd "$(dirname "$0")" && pwd)"
B="$R/构建/中间"
mkdir -p "$B"

# ── 找工具（各平台名字不一样，都试一遍）──
findtool() { for x in "$@"; do command -v "$x" >/dev/null 2>&1 && { echo "$x"; return; }; done; }
CC="${CC:-$(findtool cc gcc clang tcc)}"
PY="${PY:-$(findtool python3 python)}"
[ -n "$CC" ] || { echo "✗ 找不到 C 编译器（装 gcc 或 clang）"; exit 1; }
[ -n "$PY" ] || { echo "✗ 找不到 python3"; exit 1; }

SRC="$1"
[ -f "$SRC" ] || { echo "用法: sh 编.sh 程序.ly"; exit 1; }

echo "[1/3] 编编译器（$CC）"
[ -x "$B/lyc" ] && [ "$B/lyc" -nt "$R/编译器/lyc.c" ] || \
    "$CC" -x c -O2 -w -o "$B/lyc" "$R/编译器/lyc.c"

echo "[2/3] 编源码 → 可重定位对象"
"$B/lyc" -c -对象 "$SRC" -o "$B/对象.bin"

echo "[3/3] 链接（不用 as、不用 ld）"
# 先把预造好的运行时放进中间目录（手机/苹果上没有 x86-64 汇编器）
cp -f "$R/宿主/预造/宿主64.elf" "$R/宿主/预造/宿主64.bin" "$B/" 2>/dev/null || true
"$PY" "$R/工具/小链接.py" "$B/对象.bin" "$B/程序"
chmod +x "$B/程序" 2>/dev/null || true

[ "$2" = "-只编" ] && { echo "→ $B/程序"; exit 0; }

echo "── 跑 ──"
if "$B/程序" 2>/dev/null; then :
elif command -v qemu-x86_64 >/dev/null 2>&1; then
    qemu-x86_64 "$B/程序"
else
    echo "✗ 这台机器跑不了 x86-64 程序。"
    echo "  手机/Termux:  pkg install qemu-user-x86-64"
    echo "  苹果(装了 brew): brew install qemu"
    echo "  或者直接抄走 $B/程序 到 x86-64 电脑上跑"
fi
