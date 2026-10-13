#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
符号.py —— 数字标点：把「数字当符号」的源码还原成六爻源码

数字 → 符号（作者定稿）
    01 (      02 )      03 "      04 "
    05 ;      06 换行    07 反斜杠  08 {      09 }

★ 扫描规矩（两条）
   一、抓「一整串连续数字」，两位一组从左往右切：
         这一组在 01..09 里  →  它是标点
         不在                →  原样吐出来（数字字面量）
       所以  主0102 → 主()     256 → 25 不是码 → 原样 256

   二、紧挨着「码」的空格 = 分隔符，丢掉。
       所以  st dd 03 06 04  →  st dd "<换行>"      （没有多余空格）
       而   03hello world04  →  "hello world"      （中间那个空格不是紧挨码，保留）

★ 码在哪里都生效（引号里面也一样）—— 所以 03 06 04 里的 06 就是换行。

用法：
    python3 符号.py 源码.数字            # 还原后打印
    python3 符号.py 源码.数字 -o 出.ly   # 写到文件
"""
import sys

表 = {
    '01': '(',
    '02': ')',
    '03': '"',
    '04': '"',
    '05': ';',
    '06': '\n',     # 换行
    '07': '\\',     # 代码块开始（反斜杠本身）
    '08': '{',
    '09': '}',
}


def 还原(src: str) -> str:
    出 = []
    for 原行 in src.replace('\r\n', '\n').split('\n'):
        行 = []
        上个是码 = False
        i, n = 0, len(原行)
        while i < n:
            c = 原行[i]

            # rd 后面整段是注释，原样留
            if c == 'r' and 原行.startswith('rd', i):
                j = i + 2
                if j >= n or not (原行[j].isalnum() or 原行[j] == '_'):
                    行.append(原行[i:])
                    break

            # 空格：紧挨着码的丢掉
            if c == ' ':
                if 上个是码:
                    i += 1
                    continue
                行.append(' ')
                上个是码 = False
                i += 1
                continue

            # 数字串 → 两位一组切
            if c.isdigit():
                j = i
                while j < n and 原行[j].isdigit():
                    j += 1
                串 = 原行[i:j]
                k = 0
                while k < len(串):
                    块 = 串[k:k + 2]
                    if len(块) == 2 and 块 in 表:
                        行.append(表[块])
                        上个是码 = True
                    else:
                        行.append(块)
                        上个是码 = False
                    k += 2
                i = j
                continue

            行.append(c)
            上个是码 = False
            i += 1

        出.append(''.join(行))

    文 = '\n'.join(出)
    while ' ;' in 文:
        文 = 文.replace(' ;', ';')
    return 文


def main():
    参 = [a for a in sys.argv[1:] if not a.startswith('-')]
    if not 参:
        print(__doc__)
        return 1
    文 = 还原(open(参[0], encoding='utf-8').read())
    if '-o' in sys.argv:
        出 = sys.argv[sys.argv.index('-o') + 1]
        open(出, 'w', encoding='utf-8').write(文)
        print('已还原到 %s' % 出)
    else:
        print(文)
    return 0


if __name__ == '__main__':
    sys.exit(main())
