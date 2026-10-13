#!/bin/sh
# 对拍字节.sh —— 两条路的机器码逐字节比（x86-64）
#
#   路 A（参考）： lyc 出 .s → x86_64-as → objcopy 抽出 .text
#   路 B（我们的）：lyc -bin -占位 → 直接吐字节
#
#   为什么 -占位：as 对 .globl 符号和跨节引用**不就地解析**，
#   一律留重定位占位。x86-64 用 RELA（加数在重定位表里），
#   所以字段本身一律留 0 —— 加 -占位 让两边走同一套规矩。
cd "$(dirname "$0")/.." || exit 1
R="$(pwd)"
B="$R/构建/中间/字节对拍"
mkdir -p "$B"
CC="${CC:-gcc}"
AS="${AS:-x86_64-alpine-linux-musl-as}"
OBJCOPY="${OBJCOPY:-x86_64-alpine-linux-musl-objcopy}"
command -v "$AS" >/dev/null 2>&1 || AS=as
command -v "$OBJCOPY" >/dev/null 2>&1 || OBJCOPY=objcopy

"$CC" -x c -O2 -w -o "$B/lyc" "$R/编译器/lyc.c" || exit 1

SAME=0; DIFF=0; FAIL=0; TOTAL=0
for f in "$R"/模块/*.ly "$R"/示例/*.ly; do
    [ -f "$f" ] || continue
    case "$f" in *六爻.ly) continue ;; esac     # 六爻字节转储不是源码
    b=$(basename "$f" .ly)
    "$B/lyc" -c "$f" -o "$B/$b.s" >/dev/null 2>&1 || { FAIL=$((FAIL+1)); printf '%-14s 出汇编失败\n' "$b"; continue; }
    "$AS" "$B/$b.s" -o "$B/$b.o" 2>/dev/null || { FAIL=$((FAIL+1)); printf '%-14s as 失败\n' "$b"; continue; }
    "$OBJCOPY" -O binary --only-section=.text "$B/$b.o" "$B/$b.参考.bin"
    "$B/lyc" -c -bin -占位 "$f" -o "$B/$b.我们.bin" >/dev/null 2>&1 || { FAIL=$((FAIL+1)); printf '%-14s -bin 失败\n' "$b"; continue; }
    N=$(stat -c%s "$B/$b.参考.bin")
    head -c "$N" "$B/$b.我们.bin" > "$B/$b.我们裁.bin"
    if cmp -s "$B/$b.参考.bin" "$B/$b.我们裁.bin"; then
        SAME=$((SAME+1)); TOTAL=$((TOTAL+N))
        printf '%-14s ★ %6d 字节 逐字节一致\n' "$b" "$N"
    else
        DIFF=$((DIFF+1))
        printf '%-14s ✗ 不同\n' "$b"
        cmp "$B/$b.参考.bin" "$B/$b.我们裁.bin"
    fi
done
echo "────────────────────────────────────────────"
echo "64 位机器码：一致 $SAME / 有差异 $DIFF / 失败 $FAIL   共 $TOTAL 字节"
[ "$DIFF" = 0 ] && [ "$FAIL" = 0 ]
