#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""斜杠改卦.py —— 把源码里的【除法斜杠】换成 hn

  为什么：数字标点 06 = 斜杠本身，用途是"换行/分隔符"。
  所以 `/` 在源码里不再是除法了 —— 除法一律写 hn。

  ★ 只换：不在字符串里、不在注释里、且两边是运算量的 `/`
    · 注释（@ # rd）里的不管
    · 字符串（"…"）里的不管
    · 文件路径之类的（已经不在上面两类里的）也当除法换
"""
import os
import re
import sys

注释头 = ('@', '#')


def 换行(line: str, 计数: list):
    out = []
    i, n = 0, len(line)
    while i < n:
        c = line[i]
        # 行注释
        if c in 注释头:
            out.append(line[i:])
            break
        # rd 行内注释
        if line.startswith('rd', i) and (i == 0 or not (line[i-1].isalnum() or line[i-1] == '_')) \
           and (i + 2 >= n or not (line[i+2].isalnum() or line[i+2] == '_')):
            out.append(line[i:])
            break
        # 字符串
        if c == '"':
            out.append(c)
            i += 1
            while i < n:
                if line[i] == '\\' and i + 1 < n:
                    out.append(line[i:i+2]); i += 2; continue
                out.append(line[i])
                if line[i] == '"':
                    i += 1; break
                i += 1
            continue
        # 除法斜杠 → hn（前面补空格，后面补空格）
        if c == '/':
            计数[0] += 1
            out.append(' hn ')
            i += 1
            continue
        out.append(c)
        i += 1
    return ''.join(out)


def main():
    dry = '-n' in sys.argv
    目标 = [a for a in sys.argv[1:] if not a.startswith('-')]
    if not 目标:
        print(__doc__); return 1
    文件 = []
    for a in 目标:
        if os.path.isdir(a):
            文件 += [os.path.join(r, f) for r, _, fs in os.walk(a) for f in fs if f.endswith('.ly')]
        else:
            文件.append(a)
    总 = [0]
    for p in sorted(文件):
        s = open(p, encoding='utf-8').read()
        新 = '\n'.join(换行(l, 总) for l in s.split('\n'))
        if 新 != s and not dry:
            open(p, 'w', encoding='utf-8').write(新)
        if 新 != s:
            print('  %s' % p)
    print('──── 换了 %d 个除法斜杠 %s' % (总[0], '（只报告）' if dry else '（已写盘）'))
    return 0


if __name__ == '__main__':
    sys.exit(main())
