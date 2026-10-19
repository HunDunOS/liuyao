#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""小链接.py —— 把【多个】「-对象」文件 + 运行时 拼成一个可执行文件

    python3 小链接.py 对象1.bin [对象2.bin …] 出文件 [--基址 0x10000]

  每个对象来自 `lyc -c -对象 源.ly -o 对象.bin`，它旁边有三个表：
      对象.bin.重定位    每行 <偏移> <类> <符号名>     （要补的位置）
      对象.bin.符号      每行 <符号> <区> <偏移>       （本对象定义了啥）
      对象.bin.符号.尺寸 一行 <文本长> <只读长> <未初长>

  区号：0 = .text  1 = .rodata  2 = .bss

  as / ld 只在【造运行时】那一步用一次（固定的引导基座）；
  你的代码从源码到可执行，全程不经过 as、不经过 ld。
"""
import os
import re
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)
B = os.path.join(ROOT, '构建', '中间')


def 找工具(env, 备选):
    v = os.environ.get(env, 备选)
    if subprocess.run(['sh', '-c', 'command -v ' + v], capture_output=True).returncode:
        return 备选.split('-')[-1]
    return v


AS = 找工具('AS', 'x86_64-alpine-linux-musl-as')
LD = 找工具('LD', 'x86_64-alpine-linux-musl-ld')
NM = 找工具('NM', 'x86_64-alpine-linux-musl-nm')
OC = 找工具('OC', 'x86_64-alpine-linux-musl-objcopy')
RE = 找工具('RE', 'x86_64-alpine-linux-musl-readelf')


def 能汇编():
    '''这台机器能不能汇编 x86-64？'''
    return subprocess.run(['sh', '-c', 'echo ".intel_syntax noprefix\\n.globl t\\nt: ret" | %s -o /dev/null' % AS],
                          capture_output=True).returncode == 0


def 造运行时(基址):
    S = os.path.join(ROOT, os.environ.get('RUNTIME_SRC', '宿主/宿主64.s'))
    O, E, D, M = (os.path.join(B, '宿主64.' + x) for x in ('o', 'elf', 'bin', '镜像'))
    os.makedirs(B, exist_ok=True)
    L = os.path.join(B, '宿主64.影')
    # ★ 有现成的运行时就直接用（Termux 上的 as 是 aarch64，汇编不了 x86-64）
    # ★ 不会汇编就用包里【预造好的】运行时（手机/苹果的 as 是 aarch64，汇编不了 x86-64）
    if not 能汇编():
        预 = os.path.join(ROOT, '宿主', '预造')
        if os.path.exists(os.path.join(预, '宿主64.elf')) or os.path.exists(os.path.join(预, '宿主64.elf')):
            import shutil
            os.makedirs(B, exist_ok=True)
            shutil.copy(os.path.join(预, '宿主64.elf'), E)
            shutil.copy(os.path.join(预, '宿主64.bin'), D)
        elif not (os.path.exists(D) and os.path.exists(E)):
            raise SystemExit('小链接：这台机器没有 x86-64 汇编器，包里也没带预造运行时（宿主/预造/）')
    else:
      open(L, 'w').write(
        'SECTIONS {\n  . = 0x%X;\n  .text : { *(.text) }\n  . = ALIGN(16);\n'
        '  .rodata : { *(.rodata*) }\n  . = ALIGN(16);\n  .data : { *(.data*) }\n  . = ALIGN(16);\n'
        '  .bss : { *(.bss*) *(COMMON) }\n  /DISCARD/ : { *(.comment) *(.note*) }\n}\n' % 基址)
      subprocess.run([AS, S, '-o', O], check=True)
      subprocess.run([LD, '-T', L, '-o', E, O], check=True)
      subprocess.run([OC, '-O', 'binary', E, D], check=True)
    out = subprocess.run([RE, '-S', E], capture_output=True, text=True).stdout
    bss = 0
    for m in re.finditer(r'\[\s*\d+\]\s+\.bss\s+\S+\s+([0-9a-f]+)\s+([0-9a-f]+)\s+([0-9a-f]+)', out):
        bss = int(m.group(3), 16)
    nm = subprocess.run([NM, '-n', E], capture_output=True, text=True).stdout
    符号 = {}
    for 行 in nm.split('\n'):
        p = 行.split()
        if len(p) == 3 and p[1] in 'TtRrDdBb':
            try: 符号[p[2]] = int(p[0], 16)
            except ValueError: pass
    return open(D, 'rb').read(), bss, 符号


def 读重定位(p):
    r = []
    if os.path.exists(p):
        for l in open(p, encoding='utf-8'):
            q = l.split()
            if len(q) >= 3: r.append((int(q[0]), int(q[1]), q[2]))
    return r


def 读定义(p):
    r = []
    if os.path.exists(p):
        for l in open(p, encoding='utf-8'):
            q = l.split()
            if len(q) >= 3: r.append((q[0], int(q[1]), int(q[2])))
    return r


def 读尺寸(p):
    if os.path.exists(p):
        return [int(x) for x in open(p).read().split()]
    return [0, 0, 0]


def 写ELF64(路径, 镜像, 基址, 入口, 内存长):
    页 = 0x1000
    头 = bytearray()
    头 += b'\x7fELF' + bytes([2, 1, 1, 0]) + bytes(8)
    头 += (2).to_bytes(2, 'little') + (0x3E).to_bytes(2, 'little') + (1).to_bytes(4, 'little')
    头 += 入口.to_bytes(8, 'little')
    头 += (64).to_bytes(8, 'little') + (0).to_bytes(8, 'little') + (0).to_bytes(4, 'little')
    头 += (64).to_bytes(2, 'little') + (56).to_bytes(2, 'little') + (1).to_bytes(2, 'little')
    头 += (64).to_bytes(2, 'little') + (0).to_bytes(2, 'little') + (0).to_bytes(2, 'little')
    头 += (1).to_bytes(4, 'little') + (7).to_bytes(4, 'little')
    头 += (页).to_bytes(8, 'little')
    头 += 基址.to_bytes(8, 'little') + 基址.to_bytes(8, 'little')
    头 += len(镜像).to_bytes(8, 'little') + 内存长.to_bytes(8, 'little')
    头 += (页).to_bytes(8, 'little')
    头 += bytes(页 - len(头))
    open(路径, 'wb').write(bytes(头) + 镜像)


def main():
    args = [a for a in sys.argv[1:] if not a.startswith('--')]
    if len(args) < 2:
        print(__doc__); return 1
    出 = args[-1]
    对象们 = args[:-1]
    基址 = 0x400000
    if '--基址' in sys.argv:
        基址 = int(sys.argv[sys.argv.index('--基址') + 1], 0)
    os.makedirs(B, exist_ok=True)

    # ── 1) 运行时（as+ld 造一次，固定基座）──
    运行镜像, 运行_bss, 全部符号 = 造运行时(基址)
    符号来源 = {}
    重复符号 = []
    允许重复 = '--允许重复' in sys.argv
    运行总长 = len(运行镜像) + 运行_bss
    镜像 = bytearray(运行镜像) + bytes(运行总长 - len(运行镜像))

    # ── 2) 排版：每个对象 text | rodata | bss ──
    排 = []
    位 = 基址 + 运行总长
    for o in 对象们:
        体 = open(o, 'rb').read()
        t, r, b = 读尺寸(o + '.符号.尺寸')
        文 = (位 + 15) & ~15
        只 = (文 + t + 3) & ~3
        未 = (只 + r + 15) & ~15
        排.append({'对象': o, '体': 体, 't': t, 'r': r, 'b': b, '本': {},
                   '文': 文, '只': 只, '未': 未, '重': 读重定位(o + '.重定位')})
        # ★ 每个对象先建自己的符号表（.Lstr0 这种本地标签必须各算各的）
        本 = {}
        for 名, 区, 偏 in 读定义(o + '.符号'):
            本[名] = [文, 只, 未][区] + 偏
        p2 = 排[-1]; p2['本'] = 本
        # 只有导出的名字（fn_ / g__）才进全局表
        for 名, 值 in 本.items():
            if 名.startswith(('fn_', 'g__')):
                if 名 in 全部符号:
                    重复符号.append((名, os.path.basename(o), 符号来源.get(名, '运行时')))
                else:
                    全部符号[名] = 值
                    符号来源[名] = os.path.basename(o)
        位 = 未 + b
    总内存 = 位 - 基址
    镜像 += bytes(总内存 - len(镜像))

    # ── 3) 写正文 ──
    for p in 排:
        # ★ 镜像下标从【基址】算，不是绝对地址
        文o = p['文'] - 基址
        只o = p['只'] - 基址
        while len(镜像) < 文o + p['t']: 镜像.append(0)
        镜像[文o:文o + p['t']] = p['体'][:p['t']]
        补 = (p['t'] + 3) & ~3
        镜像[只o:只o + p['r']] = p['体'][补:补 + p['r']]

    # ── 4) 回填 ──
    补了几笔, 缺 = 0, []
    for p in 排:
        for (处, 类, 名) in p['重']:
            t = p['本'].get(名)          # ★ 先找本对象的（本地标签）
            if t is None: t = 全部符号.get(名)
            if t is None:
                缺.append(名); continue
            位 = p['文'] + 处
            if 类 == 0:   v = t
            elif 类 == 1: v = t - (位 + 4)
            else:         v = t - (位 + 1)
            for k in range(4 if 类 != 2 else 1):
                镜像[位 - 基址 + k] = (v >> (8 * k)) & 255
            补了几笔 += 1

    # ── 5) 入口：_宿_入口 = 主（若在）否则第一个 fn_ ──
    入口函数 = None
    for 名 in ('fn__e4_b8_bb',):
        if 名 in 全部符号: 入口函数 = 全部符号[名]; break
    if 入口函数 is None:
        for 名 in 全部符号:
            if 名.startswith('fn_'): 入口函数 = 全部符号[名]; break
    if 入口函数 is not None and '_宿_入口' in 全部符号:
        位 = 全部符号['_宿_入口'] - 基址
        for k in range(8): 镜像[位 + k] = (入口函数 >> (8 * k)) & 255

    # ── 重复符号检查 ──
    if 重复符号:
        print('小链接：发现 %d 个重复符号（保留首次定义）：' % len(重复符号))
        已见 = set()
        for 名, 当前对象, 首次对象 in 重复符号:
            if 名 not in 已见:
                print('  %s  首次定义于 %s，重复于 %s' % (名, 首次对象, 当前对象))
                已见.add(名)
        if not 允许重复:
            print('错误：重复符号会导致调用混乱。加 --允许重复 可强制链接（保留首个定义）。')
            return 2

    import sys as _s
    if os.environ.get('LINK_DEBUG'):
        print('调试：基址%x 运行总长%x 总内存%x len镜像%x' % (基址, 运行总长, 总内存, len(镜像)), file=_s.stderr)
        for p2 in 排: print('  对象 %s text@%x rodata@%x bss@%x' % (p2['对象'].split('/')[-1], p2['文'], p2['只'], p2['未']), file=_s.stderr)
        print('  入口 _start=%s 主=%s' % (hex(全部符号.get('_start',0)), hex(入口函数 or 0)), file=_s.stderr)
    写ELF64(出, bytes(镜像), 基址, 全部符号.get('_start', 基址), 总内存)
    print('小链接：运行时 %d 字节 + %d 个对象 → %s' % (运行总长, len(排), 出))
    print('        回填 %d 笔%s' % (补了几笔, ('，缺符号：' + ' '.join(sorted(set(缺)))) if 缺 else '，无缺符号 ✓'))
    return 1 if 缺 else 0


if __name__ == '__main__':
    sys.exit(main())
