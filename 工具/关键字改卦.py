#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""关键字改卦.py —— 把带 n 的关键字全换成带 l 的（作者定的新规范）

    旧 → 新     含义
    nn → ll     循环开头
    nr → lr     条件分支
    ns → ls     循环跳出
    nf → lf     循环继续
    nd → ld     开关分支
    nt → lt     无条件跳转
    nz → lz     相等跳转
    nh → lh     不等跳转
    tn → tl     定义结构体
    hn → hl     除法
    fn → fl     读端口
    sn → sl     写端口
    rn → rl     类型检查
    dn → dl     布尔值

  ★ 规矩：只换【代码里】的，不动字符串、不动注释（@ # rd 后面）。
  ★ 整词匹配：`nn` 不会被 `nnn` 里的部分命中。
"""
import os
import re
import sys

改 = {
    'nn': 'll', 'nr': 'lr', 'ns': 'ls', 'nf': 'lf', 'nd': 'ld',
    'nt': 'lt', 'nz': 'lz', 'nh': 'lh',
    'tn': 'tl', 'hn': 'hl', 'fn': 'fl', 'sn': 'sl', 'rn': 'rl', 'dn': 'dl',
}
注释头 = ('@', '#')


def 换行(line: str, 计数: dict):
    out = []
    i, n = 0, len(line)
    while i < n:
        c = line[i]
        if c in 注释头:
            out.append(line[i:])
            break
        if line.startswith('rd', i) and (i == 0 or not (line[i-1].isalnum() or line[i-1] == '_')) \
           and (i + 2 >= n or not (line[i+2].isalnum() or line[i+2] == '_')):
            out.append(line[i:])
            break
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
        # 整词匹配两字母关键字
        if c.isalpha() and c.isascii():
            j = i
            while j < n and line[j].isalpha() and line[j].isascii():
                j += 1
            词 = line[i:j]
            # 只换整个标识符正好是关键字的情形
            if len(词) == 2 and 词 in 改:
                新 = 改[词]
                计数[词] = 计数.get(词, 0) + 1
                out.append(新)
            else:
                out.append(词)
            i = j
            continue
        out.append(c)
        i += 1
    return ''.join(out)


def 扫(路径, 后缀='.ly'):
    文件 = []
    for a in 路径:
        if os.path.isdir(a):
            文件 += [os.path.join(r, f) for r, _, fs in os.walk(a) for f in fs if f.endswith(后缀)]
        elif a.endswith(后缀):
            文件.append(a)
    return sorted(文件)


def main():
    dry = '-n' in sys.argv
    if '-xy' in sys.argv:
        后缀 = '.xy'
    else:
        后缀 = '.ly'
    目标 = [a for a in sys.argv[1:] if not a.startswith('-')]
    if not 目标:
        print(__doc__); return 1
    总 = {}
    for p in 扫(目标, 后缀):
        s = open(p, encoding='utf-8').read()
        新 = '\n'.join(换行(l, 总) for l in s.split('\n'))
        if 新 != s and not dry:
            open(p, 'w', encoding='utf-8').write(新)
    for k, v in sorted(总.items(), key=lambda x: -x[1]):
        print('   %s → %s   %d 处' % (k, 改[k], v))
    print('──── 合计 %d 处 %s' % (sum(总.values()), '（只报告）' if dry else '（已写盘）'))
    return 0


if __name__ == '__main__':
    sys.exit(main())
