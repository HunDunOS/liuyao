#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""对拍词法.py —— stage0（C）和 stage1（六爻）的词法流逐行比

    python3 工具/对拍词法.py 源码.ly [更多.ly ...]

两边都吐同一种格式：
    <行号> <类别> <内容>
stage0 用 lyc -词法；stage1 是 编译器/词法.ly + 一段包壳的主函数。
"""
import os
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
B = os.path.join(ROOT, '构建', '中间', '词法对拍')
CC = os.environ.get('CC', 'gcc')


def 转义(s):
    o = []
    for ch in s:
        if ch == '\\':
            o.append('\\\\')
        elif ch == '"':
            o.append('\\"')
        elif ch == '\n':
            o.append('\\n')
        elif ch == '\t':
            o.append('\\t')
        else:
            o.append(ch)
    return ''.join(o)


def 造stage1(源文本, 出):
    """★ 源码可能上万字节，一个字符串字面量塞不下（编译器上限 8184），
       所以按 3000 字节一块分开放，程序启动时再拼进源池。"""
    头 = open(os.path.join(ROOT, '编译器', '词法.ly'), encoding='utf-8').read()
    块 = [源文本[i:i + 3000] for i in range(0, len(源文本), 3000)] or ['']
    拼 = '\n'.join('    拼("%s")' % 转义(k) for k in 块)
    尾 = ('\n\ntt 装源() -> u32 {\n'
          '    wx { 源池址 = 地址(源池) }\n'
          '    源池顶 = 0\n' + 拼 + '\n    zz 0\n}\n'
          '\ntt 主() -> u32 {\n    数字符初始化()\n    装源()\n    分析源池()\n    zz 0\n}\n')
    open(出, 'w', encoding='utf-8').write(头 + 尾)


def 跑指令(e):
    """★ 这里是 aarch64 沙箱，x86-64 二进制必须显式走 qemu；
       Arch 那种原生 x86-64 机器上直接跑就行。"""
    import platform
    if platform.machine() in ('x86_64', 'amd64'):
        return [e]
    return ['qemu-x86_64', e]


def 找工具(env, 备选):
    v = os.environ.get(env, 备选)
    if subprocess.run(['sh', '-c', 'command -v ' + v], capture_output=True).returncode:
        return 备选.split('-')[-1]
    return v


def main():
    os.makedirs(B, exist_ok=True)
    lyc = os.path.join(B, 'lyc')
    if not os.path.exists(lyc) or os.path.getmtime(lyc) < os.path.getmtime(
            os.path.join(ROOT, '编译器', 'lyc.c')):
        subprocess.run([CC, '-x', 'c', '-O2', '-w', '-o', lyc,
                        os.path.join(ROOT, '编译器', 'lyc.c')], check=True)
    asm = 找工具('AS', 'x86_64-alpine-linux-musl-as')

    同 = 异 = 失败 = 0
    for f in sys.argv[1:]:
        b = os.path.basename(f).replace('.ly', '')
        r0 = subprocess.run([lyc, '-词法', f], capture_output=True, text=True)
        if r0.returncode:
            失败 += 1
            print('%-14s stage0 失败' % b)
            continue
        壳 = os.path.join(B, b + '.测.ly')
        造stage1(open(f, encoding='utf-8').read(), 壳)
        # ★ 直接出「可重定位对象」，不经 as、不经 ld
        对 = os.path.join(B, b + '.bin')
        r1 = subprocess.run([lyc, '-c', '-对象', 壳, '-o', 对],
                            capture_output=True, text=True)
        if r1.returncode:
            失败 += 1
            print('%-14s stage1 编译失败：%s' % (b, r1.stderr.strip()[:90]))
            continue
        e = os.path.join(B, b)
        subprocess.run(['python3', os.path.join(HERE, '小链接.py'), 对, e],
                       check=True, capture_output=True)
        os.chmod(e, 0o755)
        r1 = subprocess.run(跑指令(e), capture_output=True, text=True)

        a = r0.stdout.split('\n')
        c = r1.stdout.split('\n')
        if a == c:
            同 += 1
            print('%-14s ★ %d 行记号流逐行一致' % (b, len(a)))
        else:
            异 += 1
            n = min(len(a), len(c))
            k = next((i for i in range(n) if a[i] != c[i]), n)
            print('%-14s ✗ 第 %d 行起不同（%d vs %d 行）' % (b, k + 1, len(a), len(c)))
            for i in range(max(0, k - 2), min(n, k + 3)):
                print('      stage0: %-28r stage1: %r' % (a[i], c[i]))
    print('─' * 50)
    print('一致 %d / 不同 %d / 失败 %d' % (同, 异, 失败))
    return 0 if 异 == 0 and 失败 == 0 else 1


if __name__ == '__main__':
    sys.exit(main())
