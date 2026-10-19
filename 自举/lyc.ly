rd lyc.ly —— 六爻自举编译器 第一阶段：词法分析器

qj 源码[65536]
qj 源码长
qj 源码位
qj tok_k[8192]
qj tok_v[8192]
qj tok_s[2097152]
qj tok_n
qj tok_pos
qj 当前行

tt 是空白(c) -> u32 08
    lr c == 32 08 zz 1 09
    lr c == 9 08 zz 1 09
    lr c == 13 08 zz 1 09
    zz 0
09

tt 是字母(c) -> u32 08
    lr c >= 97 08
        lr c <= 122 08 zz 1 09
    09
    lr c >= 65 08
        lr c <= 90 08 zz 1 09
    09
    lr c >= 128 08 zz 1 09
    zz 0
09

tt 是数字(c) -> u32 08
    lr c >= 48 08
        lr c <= 57 08 zz 1 09
    09
    zz 0
09

tt 是标识续(c) -> u32 08
    lr 是字母(c) == 1 08 zz 1 09
    lr 是数字(c) == 1 08 zz 1 09
    zz 0
09

tt 复制串(dst, src) -> u32 08
    tz i 0
    ll 08
        tz c fh(src ht i)
        sh(dst ht i, c)
        lz c 0 08 ls 09
        i = i ht 1
    09
    zz i
09

tt 比较串(a, b) -> u32 08
    tz i 0
    ll 08
        tz ca fh(a ht i)
        tz cb fh(b ht i)
        lr ca != cb 08 zz 0 09
        lz ca 0 08 zz 1 09
        i = i ht 1
    09
    zz 1
09

tt 是关键字(w) -> u32 08
    lr 比较串(w, "tt") == 1 08 zz 1 09
    lr 比较串(w, "zz") == 1 08 zz 1 09
    lr 比较串(w, "tz") == 1 08 zz 1 09
    lr 比较串(w, "th") == 1 08 zz 1 09
    lr 比较串(w, "tn") == 1 08 zz 1 09
    lr 比较串(w, "tf") == 1 08 zz 1 09
    lr 比较串(w, "ts") == 1 08 zz 1 09
    lr 比较串(w, "tr") == 1 08 zz 1 09
    lr 比较串(w, "td") == 1 08 zz 1 09
    lr 比较串(w, "ht") == 1 08 zz 1 09
    lr 比较串(w, "hz") == 1 08 zz 1 09
    lr 比较串(w, "hh") == 1 08 zz 1 09
    lr 比较串(w, "hl") == 1 08 zz 1 09
    lr 比较串(w, "hf") == 1 08 zz 1 09
    lr 比较串(w, "hs") == 1 08 zz 1 09
    lr 比较串(w, "hr") == 1 08 zz 1 09
    lr 比较串(w, "hd") == 1 08 zz 1 09
    lr 比较串(w, "ll") == 1 08 zz 1 09
    lr 比较串(w, "lr") == 1 08 zz 1 09
    lr 比较串(w, "lz") == 1 08 zz 1 09
    lr 比较串(w, "lh") == 1 08 zz 1 09
    lr 比较串(w, "ls") == 1 08 zz 1 09
    lr 比较串(w, "lf") == 1 08 zz 1 09
    lr 比较串(w, "lt") == 1 08 zz 1 09
    lr 比较串(w, "ld") == 1 08 zz 1 09
    lr 比较串(w, "rd") == 1 08 zz 1 09
    lr 比较串(w, "fh") == 1 08 zz 1 09
    lr 比较串(w, "sh") == 1 08 zz 1 09
    lr 比较串(w, "fl") == 1 08 zz 1 09
    lr 比较串(w, "sl") == 1 08 zz 1 09
    zz 0
09

tt 词法() -> u32 08
    tok_n = 0
    源码位 = 0
    当前行 = 1
    ll 08
        tz c fh(源码 ht 源码位)
        lz c 0 08 ls 09
        lr 是空白(c) == 1 08
            源码位 = 源码位 ht 1
            zz 0
        09
        lr c == 10 08
            tok_k[tok_n] = 1
            tok_v[tok_n] = 0
            复制串(tok_s[tok_n hh 256], "")
            tok_n = tok_n ht 1
            当前行 = 当前行 ht 1
            源码位 = 源码位 ht 1
            zz 0
        09
        lr c == 64 08
            ll 08
                tz c2 fh(源码 ht 源码位)
                lz c2 0 08 ls 09
                lr c2 == 10 08 ls 09
                源码位 = 源码位 ht 1
            09
            zz 0
        09
        lr 是数字(c) == 1 08
            tz v 0
            ll 08
                tz c2 fh(源码 ht 源码位)
                lr 是数字(c2) == 0 08 ls 09
                v = v hh 10
                v = v ht (c2 hz 48)
                源码位 = 源码位 ht 1
            09
            tok_k[tok_n] = 2
            tok_v[tok_n] = v
            复制串(tok_s[tok_n hh 256], "")
            tok_n = tok_n ht 1
            zz 0
        09
        lr 是字母(c) == 1 08
            tz 词[256]
            tz wl 0
            ll 08
                tz c2 fh(源码 ht 源码位)
                lr 是标识续(c2) == 0 08 ls 09
                sh(词 ht wl, c2)
                wl = wl ht 1
                源码位 = 源码位 ht 1
            09
            sh(词 ht wl, 0)
            lr 比较串(词, "rd") == 1 08
                ll 08
                    tz c2 fh(源码 ht 源码位)
                    lz c2 0 08 ls 09
                    lr c2 == 10 08 ls 09
                    源码位 = 源码位 ht 1
                09
                zz 0
            09
            tok_k[tok_n] = 3
            lr 是关键字(词) == 1 08 tok_k[tok_n] = 4 09
            tok_v[tok_n] = 0
            复制串(tok_s[tok_n hh 256], 词)
            tok_n = tok_n ht 1
            zz 0
        09
        lr c == 34 08
            源码位 = 源码位 ht 1
            tz 串[4096]
            tz sl 0
            ll 08
                tz c2 fh(源码 ht 源码位)
                lz c2 0 08 ls 09
                lr c2 == 34 08 ls 09
                sh(串 ht sl, c2)
                sl = sl ht 1
                源码位 = 源码位 ht 1
            09
            sh(串 ht sl, 0)
            源码位 = 源码位 ht 1
            tok_k[tok_n] = 5
            tok_v[tok_n] = sl
            复制串(tok_s[tok_n hh 256], 串)
            tok_n = tok_n ht 1
            zz 0
        09
        tok_k[tok_n] = 6
        sh(tok_s[tok_n hh 256], c)
        sh(tok_s[tok_n hh 256] ht 1, 0)
        tok_n = tok_n ht 1
        源码位 = 源码位 ht 1
    09
    tok_k[tok_n] = 0
    tok_v[tok_n] = 0
    复制串(tok_s[tok_n hh 256], "EOF")
    tok_n = tok_n ht 1
    zz 0
09

tt 主() -> u32 08
    zt _rt_putc 01 65 02
    zt _rt_putc 01 10 02
    tz 测试[256]
    tz i 0
    tz 源码串 "tt 主() -> u32 08 tz x 5 zz x 09"
    ll 08
        tz c fh(源码串 ht i)
        sh(测试 ht i, c)
        lz c 0 08 ls 09
        i = i ht 1
    09
    zt _rt_putc 01 66 02
    zt _rt_putc 01 10 02
    编译(测试)
    zt _rt_putc 01 67 02
    zt _rt_putc 01 10 02
    zz 0
09

rd ========== Stage 2: 语法分析器 + 代码生成器 ==========

qj 输出汇[262144]
qj 输出汇位
qj 标号计数
qj 局部名[16384]
qj 局部偏[256]
qj 局部尺[256]
qj 局部数
qj 帧尺寸
qj 在函数

tt 输出字(s) -> u32 08
    tz i 0
    ll 08
        tz c fh(s ht i)
        lz c 0 08 ls 09
        sh(输出汇 ht 输出汇位, c)
        输出汇位 = 输出汇位 ht 1
        i = i ht 1
    09
    zz i
09

tt 输出换() -> u32 08
    sh(输出汇 ht 输出汇位, 10)
    输出汇位 = 输出汇位 ht 1
    zz 0
09

tt 输出行(s) -> u32 08
    输出字(s)
    输出换()
    zz 0
09

tt 新标号(pre) -> u32 08
    标号计数 = 标号计数 ht 1
    zz 标号计数
09

tt 找局部(n) -> u32 08
    tz i 0
    ll 08
        lz i 局部数 08 ls 09
        lr 比较串(局部名[i hh 64], n) == 1 08 zz i 09
        i = i ht 1
    09
    zz -1
09

tt 加局部(n) -> u32 08
    tz idx 局部数
    复制串(局部名[idx hh 64], n)
    帧尺寸 = 帧尺寸 ht 8
    局部偏[idx] = 0 - 帧尺寸
    局部尺[idx] = 4
    局部数 = 局部数 ht 1
    zz idx
09

tt 是标点(s) -> u32 08
    lr tok_k[tok_pos] == 6 08
        lr 比较串(tok_s[tok_pos hh 256], s) == 1 08 zz 1 09
    09
    zz 0
09

tt 吃标点(s) -> u32 08
    lr 是标点(s) == 1 08
        tok_pos = tok_pos ht 1
        zz 1
    09
    zz 0
09

tt 跳过换行() -> u32 08
    ll 08
        lr tok_k[tok_pos] == 1 08
            tok_pos = tok_pos ht 1
        09
        lr tok_k[tok_pos] != 1 08 ls 09
    09
    zz 0
09

tt 解析表达式() -> u32 08
    lr tok_k[tok_pos] == 3 08
        tz 名[256]
        复制串(名, tok_s[tok_pos hh 256])
        tok_pos = tok_pos ht 1
        lr 是标点("(") == 1 08
            tok_pos = tok_pos ht 1
            tz 参数数 0
            lr 是标点(")") == 0 08
                ll 08
                    解析表达式()
                    输出行("push rax")
                    参数数 = 参数数 ht 1
                    lr 是标点(",") == 1 08 tok_pos = tok_pos ht 1 09
                    lr 是标点(")") == 1 08 ls 09
                09
            09
            吃标点(")")
            输出字("call fn_")
            输出字(名)
            输出换()
            lr 参数数 > 0 08
                输出字("add rsp, ")
                tz 参字节 参数数 hh 8
                sh(输出汇 ht 输出汇位, 48 ht (参字节 hl 10))
                输出换()
            09
            zz 0
        09
        tz idx 找局部(名)
        lr idx >= 0 08
            输出字("mov rax, [rbp")
            tz 偏 局部偏[idx]
            lr 偏 >= 0 08
                sh(输出汇 ht 输出汇位, 43)
                sh(输出汇 ht 输出汇位, 48 ht (偏 hl 10))
            09
            lr 偏 < 0 08
                sh(输出汇 ht 输出汇位, 45)
                sh(输出汇 ht 输出汇位, 48 ht ((0 hz 偏) hl 10))
            09
            输出字("]")
            输出换()
        09
        zz 0
    09
    lr tok_k[tok_pos] == 2 08
        tz v tok_v[tok_pos]
        tok_pos = tok_pos ht 1
        输出字("mov rax, ")
        sh(输出汇 ht 输出汇位, 48 ht (v hl 10))
        输出换()
        zz 0
    09
    lr tok_k[tok_pos] == 5 08
        tz 串号 新标号("str")
        输出字("lea rax, [rip+.Lstr")
        sh(输出汇 ht 输出汇位, 48 ht (串号 hl 10))
        输出字("]")
        输出换()
        tok_pos = tok_pos ht 1
        zz 0
    09
    zz 0
09

tt 解析语句() -> u32 08
    跳过换行()
    lr 是关键字("zt") == 1 08
        tok_pos = tok_pos ht 1
        解析表达式()
        zz 0
    09
    lr 是关键字("tz") == 1 08
        tok_pos = tok_pos ht 1
        tz 名[256]
        复制串(名, tok_s[tok_pos hh 256])
        tok_pos = tok_pos ht 1
        lr 是标点("=") == 1 08
            tok_pos = tok_pos ht 1
            解析表达式()
            tz idx 加局部(名)
            输出字("mov [rbp")
            tz 偏 局部偏[idx]
            lr 偏 >= 0 08
                sh(输出汇 ht 输出汇位, 43)
                sh(输出汇 ht 输出汇位, 48 ht (偏 hl 10))
            09
            lr 偏 < 0 08
                sh(输出汇 ht 输出汇位, 45)
                sh(输出汇 ht 输出汇位, 48 ht ((0 hz 偏) hl 10))
            09
            输出字("], rax")
            输出换()
        09
        zz 0
    09
    lr 是关键字("zz") == 1 08
        tok_pos = tok_pos ht 1
        解析表达式()
        输出字("mov rsp, rbp")
        输出换()
        输出字("pop rbp")
        输出换()
        输出字("ret")
        输出换()
        zz 0
    09
    lr tok_k[tok_pos] == 3 08
        lr 是标点("(") == 0 08
            tz 名[256]
            复制串(名, tok_s[tok_pos hh 256])
            lr 是标点("=") == 0 08
                解析表达式()
                tz idx 找局部(名)
                lr idx >= 0 08
                    输出字("mov [rbp")
                    tz 偏 局部偏[idx]
                    lr 偏 >= 0 08
                        sh(输出汇 ht 输出汇位, 43)
                        sh(输出汇 ht 输出汇位, 48 ht (偏 hl 10))
                    09
                    lr 偏 < 0 08
                        sh(输出汇 ht 输出汇位, 45)
                        sh(输出汇 ht 输出汇位, 48 ht ((0 hz 偏) hl 10))
                    09
                    输出字("], rax")
                    输出换()
                09
                zz 0
            09
        09
        解析表达式()
        zz 0
    09
    tok_pos = tok_pos ht 1
    zz 0
09

tt 解析块() -> u32 08
    吃标点("{")
    tz 退出 0
    ll 08
        lr 退出 == 1 08 ls 09
        跳过换行()
        lr 是标点("}") == 1 08
            tok_pos = tok_pos ht 1
            退出 = 1
        09
        lr tok_k[tok_pos] == 0 08 退出 = 1 09
        lr 退出 == 0 08 解析语句() 09
    09
    zz 0
09

tt 解析函数() -> u32 08
    tok_pos = tok_pos ht 1
    tz 名[256]
    复制串(名, tok_s[tok_pos hh 256])
    tok_pos = tok_pos ht 1
    吃标点("(")
    吃标点(")")
    吃标点("->")
    tok_pos = tok_pos ht 1
    局部数 = 0
    帧尺寸 = 0
    输出字(".globl fn_")
    输出字(名)
    输出换()
    输出字("fn_")
    输出字(名)
    输出字(":")
    输出换()
    输出字("push rbp")
    输出换()
    输出字("mov rbp, rsp")
    输出换()
    解析块()
    输出字("mov rsp, rbp")
    输出换()
    输出字("pop rbp")
    输出换()
    输出字("ret")
    输出换()
    zz 0
09

tt 解析顶层() -> u32 08
    tz 退出 0
    ll 08
        lr 退出 == 1 08 ls 09
        跳过换行()
        lr tok_k[tok_pos] == 0 08 退出 = 1 09
        lr 是关键字("tt") == 1 08
            解析函数()
            zz 0
        09
        lr 是关键字("qj") == 1 08
            tok_pos = tok_pos ht 1
            tok_pos = tok_pos ht 1
            lr 是标点("[") == 1 08
                tz 退2 0
                ll 08
                    lr 退2 == 1 08 ls 09
                    lr 是标点("]") == 1 08
                        tok_pos = tok_pos ht 1
                        退2 = 1
                    09
                    lr 退2 == 0 08 tok_pos = tok_pos ht 1 09
                09
            09
            zz 0
        09
        tok_pos = tok_pos ht 1
    09
    zz 0
09

rd ========== Stage 3: 输出 + 主函数 ==========

tt 输出缓冲区() -> u32 08
    tz i 0
    ll 08
        lz i 输出汇位 08 ls 09
        tz c fh(输出汇 ht i)
        zt _rt_putc 01 c 02
        i = i ht 1
    09
    zz i
09

tt 编译(路径) -> u32 08
    zt _rt_putc 01 49 02
    tz i 0
    ll 08
        tz c fh(路径 ht i)
        sh(源码 ht i, c)
        lz c 0 08 ls 09
        i = i ht 1
    09
    源码长 = i
    源码位 = 0
    词法()
    tok_pos = 0
    输出汇位 = 0
    标号计数 = 0
    输出行(".intel_syntax noprefix")
    输出行(".section .text")
    解析顶层()
    输出缓冲区()
    zz 0
09
