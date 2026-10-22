@ ============================================================
@ 六爻自举编译器 lyc_self.ly - 纯血六爻版 v0.2.0
@ 规范版本: 六爻指令集 SPEC_v1.0 (64指令)
@ 架构：dt全局 + tf表 + tt函数 | 状态: tz/st/zz/tt+中缀运算验证通过
@ 待办: 自举闭环(自己编译自己) + 完整64指令
@ ---- 全局状态 ----
tz dtd      @ 当前字符
tz dtt      @ token类型: 0=EOF 1=数字 2=字符串 3=标识符 4=标点 5=卦指令
tz dth      @ token数值
tz dtz      @ token串指针
tz dtu      @ token长度
tz dtf      @ 关键字首字节
tz dts      @ 关键字次字节
tz dtu1     @ 关键字比较临时1
tz dtu2     @ 关键字比较临时2
tz dtq      @ 串比较临时1
tz dtr      @ 串比较临时2
tz dtn      @ 源码长度
tz dtl      @ 行号
tz dtb      @ 源码指针
tz dtlab    @ 标签计数器
tz dtlend   @ 循环结束标签
tz dsn      @ 字符串表计数
tz dnv      @ 变量数
tz dfr      @ 栈帧大小
tz dtmp     @ 临时长度
tz dtend    @ 源码结束指针
tz dtcurfn  @ 当前函数名指针
tz dtcurfnl @ 当前函数名长度

@ ---- 表 ----
tf dsb[65536]: u8    @ 源码缓冲
tf dtv[128]: u64          @ 变量名表
tf dtw[128]: u64
tf dtvl[128]: u64          @ 变量偏移表
tf dsv[256]: u64          @ 字符串表
tf dsl[256]: u64          @ 字符串长度表
tf dtfnbuf[256]: u8    @ 函数名mangle缓冲区

@ ============================================================
@ 基础工具
@ ============================================================

tt lds(s) -> u32 {
    tz i = 0
    ll {
        tz a = s ht i
        tz r = fr a
        tz c = r hs 255
        lz c 0 { zz i }
        tz i = i ht 1
    }
}

tt ldh(c) -> u32 {
    lr c >= 48 { lr c <= 57 { zz 1 } }
    zz 0
}

tt lsl(c) -> u32 {
    lr c >= 97 { lr c <= 122 { zz 1 } }
    lr c >= 65 { lr c <= 90 { zz 1 } }
    lr c >= 48 { lr c <= 57 { zz 1 } }
    lr c == 95 { zz 1 }
    lr c >= 128 { zz 1 }
    zz 0
}

tt lsg(c) -> u32 {
    lr c == 116 { zz 1 }
    lr c == 122 { zz 1 }
    lr c == 104 { zz 1 }
    lr c == 108 { zz 1 }
    lr c == 102 { zz 1 }
    lr c == 115 { zz 1 }
    lr c == 114 { zz 1 }
    lr c == 100 { zz 1 }
    zz 0
}

tt ltm(a, b) -> u32 {
    tz i = 0
    ll {
        tz aa = a ht i
        tz ra = fr aa
        tz ca = ra hs 255
        tz bb = b ht i
        tz rb = fr bb
        tz cb = rb hs 255
        lr ca != cb { zz 0 }
        lz ca 0 { zz 1 }
        tz i = i ht 1
    }
}

tt ltk(a, b) -> u32 {
    tz ra = fr a
    tz ca = ra hs 255
    lr ca != dtf { zz 0 }
    tz a1 = a ht 1
    tz rb = fr a1
    tz cb = rb hs 255
    lr cb != dts { zz 0 }
    zz 1
}

@ ============================================================
@ 词法分析
@ ============================================================

tt lft() -> u32 {
    ll {
        lr dtb >= dtend { zz 0 }
        tz a = dtb
        tz r = fr a
        tz c = r hs 255
        lr c == 32 { dtb = dtb ht 1 }
        lr c == 9 { dtb = dtb ht 1 }
        lr c == 10 { dtb = dtb ht 1; dtl = dtl ht 1 }
        lr c == 13 { dtb = dtb ht 1 }
        lr c != 32 { lr c != 9 { lr c != 10 { lr c != 13 { ls } } } }
    }
    zz 0
}

tt lln(c) -> u32 {
    lr c == 48 { zz 35 }
    lr c == 49 { zz 40 }
    lr c == 50 { zz 41 }
    lr c == 51 { zz 34 }
    lr c == 52 { zz 34 }
    lr c == 53 { zz 59 }
    lr c == 54 { zz 47 }
    lr c == 55 { zz 92 }
    lr c == 56 { zz 123 }
    lr c == 57 { zz 125 }
    zz c
}

tt ldn() -> u32 {
    tz val = 0
    ll {
        lr dtb >= dtend { ls }
        tz a = dtb
        tz r = fr a
        tz c = r hs 255
        lr ldh(c) == 0 { ls }
        tz val = val hh 10
        tz digit = c hz 48
        tz val = val ht digit
        dtb = dtb ht 1
    }
    dtt = 1
    dth = val
    dtz = 0
    dtu = 0
    zz 1
}

tt lst() -> u32 {
    tz start = dtb
    dtb = dtb ht 1
    ll {
        lr dtb >= dtend { ls }
        tz a = dtb
        tz r = fr a
        tz c = r hs 255
        lr c == 34 { ls }
        lr c == 92 { dtb = dtb ht 1 }
        dtb = dtb ht 1
    }
    dtb = dtb ht 1
    dtt = 2
    dtz = start
    dtu = dtb hz start
    dth = 0
    zz 1
}

tt llt() -> u32 {
    lft()
    lr dtb >= dtend { dtt = 0; zz 0 }
    tz a = dtb
    tz r = fr a
    tz c = r hs 255
    dtd = c

    @ 数字
    lr ldh(c) == 1 { ldn(); zz 1 }

    @ 字符串
    lr c == 34 { lst(); zz 1 }

    @ 注释
    lr c == 35 {
        ll {
            lr dtb >= dtend { ls }
            tz a2 = dtb
            tz r2 = fr a2
            tz c2 = r2 hs 255
            lr c2 == 10 { ls }
            dtb = dtb ht 1
        }
        llt()
        zz 1
    }

    @ 两字节卦指令
    lr lsg(c) == 1 {
        tz a3 = dtb ht 1
        tz r3 = fr a3
        tz c3 = r3 hs 255
        lr lsg(c3) == 1 {
            dtf = c
            dts = c3
            dtz = dtb
            dtu = 2
            dtt = 5
            dtb = dtb ht 2
            zz 1
        }
    }

    @ 标识符
    lr lsl(c) == 1 {
        tz start = dtb
        ll {
            lr dtb >= dtend { ls }
            tz a4 = dtb
            tz r4 = fr a4
            tz c4 = r4 hs 255
            lr lsl(c4) == 0 { ls }
            dtb = dtb ht 1
        }
        dtz = start
        dtu = dtb hz start
        dtt = 3
        dth = 0
        zz 1
    }

    @ 标点（单字符）
    dtt = 4
    dth = c
    dtz = 0
    dtu = 1
    dtb = dtb ht 1
    zz 1
}

@ ============================================================
@ 变量表
@ ============================================================

tt lfv(name) -> u32 {
    tz i = 0
    ll {
        lz i dnv { zz -1 }
        tz vlen = dtvl[i]
        tz match = 1
        tz j = 0
        ll {
            lz j vlen { ls }
            tz aa = dtv[i] ht j
            tz ra = fr aa
            tz ca = ra hs 255
            tz bb = name ht j
            tz rb = fr bb
            tz cb = rb hs 255
            lr ca != cb { match = 0; ls }
            tz j = j ht 1
        }
        lr match == 1 { zz i }
        tz i = i ht 1
    }
}

@ ============================================================
@ 表达式解析（最小版：数字/变量/加法/函数调用/fr解引用）
@ ============================================================

tt zzp() -> u32 {
    @ 数字
    lr dtt == 1 {
        st dd "mov rax, "
        st dt dth
        st dd "\n"
        llt()
        zz 0
    }
    @ 字符串
    lr dtt == 2 {
        tz idx = dsn
        dsv[idx] = dtz
        dsl[idx] = dtu
        dsn = dsn ht 1
        st dd "lea rax, [rip + .Lstr"
        st dt idx
        st dd "]\n"
        llt()
        zz 0
    }
    @ 标识符/函数调用
    lr dtt == 3 {
        tz name = dtz
        llt()
        lr dtt == 4 { lr dth == 40 {
            llt()
            lr dtt == 4 { lr dth == 41 {
                llt()
                st dd "call fn_"
                tz i = 0
                ll {
                    tz a = name ht i
                    tz r = fr a
                    tz cc = r hs 255
                    lz cc 0 { ls }
                    zd 1 cc
                    tz i = i ht 1
                }
                st dd "\n"
                zz 0
            } }
            zz 0
        } }
        tz vi = lfv(name)
        lr vi >= 0 {
            st dd "mov rax, [rbp+"
            st dt dtw[vi]
            st dd "]\n"
            zz 0
        }
        st dd "mov rax, 0\n"
        zz 0
    }
    @ fr解引用
    lr dtt == 5 {
        lr dtf == 102 { lr dts == 114 {
            llt()
            zzd()
            st dd "mov rax, [rax]\n"
            zz 0
        } }
    }
    zz 0
}

tt zzd() -> u32 {
    zzp()
    ll {
        lr dtt != 5 { ls }
        lr dtf != 104 { ls }
        tz op = dts
        llt()
        st dd "push rax\n"
        zzd()
        st dd "mov rcx, rax\npop rax\n"
        lr op == 116 { st dd "add rax, rcx\n" }
        lr op == 122 { st dd "sub rax, rcx\n" }
        lr op == 104 { st dd "imul rax, rcx\n" }
        lr op == 108 { st dd "xor rdx, rdx\ndiv rcx\n" }
        lr op == 102 { st dd "xor rdx, rdx\ndiv rcx\nmov rax, rdx\n" }
        lr op == 115 { st dd "and rax, rcx\n" }
        lr op == 114 { st dd "or rax, rcx\n" }
        lr op == 100 { st dd "xor rax, rcx\n" }
    }
    zz 0
}

@ ============================================================
@ 语句处理
@ ============================================================

tt lfoutname() -> u32 {
    @ 输出mangle后的函数名：ASCII字母数字下划线直接输出，其他输出_xx
    tz i = 0
    ll {
        lr i >= dtcurfnl { ls }
        tz addr = dtcurfn ht i
        tz c = fr addr
        tz cb = c hs 255
        @ 判断是否为ASCII字母数字下划线
        tz isasc = 0
        lr cb >= 97 { lr cb <= 122 { tz isasc = 1 } }
        lr cb >= 65 { lr cb <= 90 { tz isasc = 1 } }
        lr cb >= 48 { lr cb <= 57 { tz isasc = 1 } }
        lr cb == 95 { tz isasc = 1 }
        lr isasc == 1 {
            zt 出(cb)
        } ld {
            @ 非ASCII：输出下划线+两位十六进制
            zt 出(95)
            tz hi = cb dl 4
            tz lo = cb hs 15
            lr hi < 10 { zt 出(hi ht 48) }
            lr hi >= 10 { zt 出(hi ht 87) }
            lr lo < 10 { zt 出(lo ht 48) }
            lr lo >= 10 { zt 出(lo ht 87) }
        }
        i = i ht 1
    }
    zz i
}

tt lzc() -> u32 {
    @ tz 变量声明
    llt()
    lr dtt != 3 { zz 0 }
    tz name = dtz
    tz namelen = dtu
    tz vi = dnv
    dtv[vi] = name
    dtvl[vi] = namelen
    dfr = dfr ht 16
    dtw[vi] = dfr
    dnv = dnv ht 1
    llt()
    @ = 赋值
    lr dtt == 4 { lr dth == 61 {
        llt()
        zzd()
        st dd "mov [rbp+"
        st dt dtw[vi]
        st dd "], rax\n"
    } }
    zz 0
}

tt lzs() -> u32 {
    @ st 输出
    llt()
    lr dtt != 5 { zz 0 }
    lr dtf == 100 { lr dts == 100 {
        @ st dd 字符串
        llt()
        lr dtt == 2 {
            zzd()
            st dd "mov rdi, rax\ncall _rt_puts\n"
        }
        zz 0
    } }
    lr dtf == 100 { lr dts == 116 {
        @ st dt 整数
        llt()
        zzd()
        st dd "mov rdi, rax\ncall _rt_puti\n"
        zz 0
    } }
    zz 0
}

tt lzr() -> u32 {
    @ zz 返回
    llt()
    lr dtt == 1 {
        st dd "mov rax, "
        st dt dth
        st dd "\n"
        llt()
    }
    st dd "jmp .Lret_"
    zt lfoutname()
    st dd "\n"
    zz 0
}

@ ============================================================
@ 语句分派
@ ============================================================

tt zzh() -> u32 {
    lr dtt == 0 { zz 0 }

    @ tz 声明
    lr dtt == 5 { lr dtf == 116 { lr dts == 122 { lzc(); zz 0 } } }

    @ st 输出
    lr dtt == 5 { lr dtf == 115 { lr dts == 116 { lzs(); zz 0 } } }

    @ zz 返回
    lr dtt == 5 { lr dtf == 122 { lr dts == 122 { lzr(); zz 0 } } }

    @ tt 函数定义：生成标签+序言，解析体，生成结语
    lr dtt == 5 { lr dtf == 116 { lr dts == 116 {
        llt()
        @ 函数名
        lr dtt == 3 {
            dtcurfn = dtz
            dtcurfnl = dtu
            @ 生成函数标签 fn_<name>
            st dd ".globl fn_"
            zt lfoutname()
            st dd "\nfn_"
            zt lfoutname()
            st dd ":\n"
            st dd "push rbp\nmov rbp, rsp\n"
            dfr = 0
            dnv = 0
        }
        @ 跳过参数列表
        ll {
            llt()
            lr dtt == 4 { lr dth == 41 { ls } }
        }
        @ 跳过返回类型 -> u32
        ll {
            llt()
            lr dtt == 4 { lr dth == 123 { ls } }
        }
        llt()
        @ 解析函数体
        ll {
            lr dtt == 4 { lr dth == 125 {
                @ 结语
                st dd "sub rsp, "
                st dt dfr
                st dd "\n.Lret_"
                zt lfoutname()
                st dd ":\nmov rsp, rbp\npop rbp\nret\n"
                llt()
                zz 0
            } }
            zzh()
        }
        zz 0
    } } }

    @ 未知，跳过
    llt()
    zz 0
}

@ ============================================================
@ 主函数
@ ============================================================

tt 主(fname) -> u32 {
    @ 从命令行参数读取源码文件
    tz slen = 0
    tz src = zt _rt_slurp(fname, zf slen)
    lz src 0 { zz 1 }

    dtb = src
    dtn = slen
    dtend = src ht slen
    dtl = 1
    dtlab = 0
    dsn = 0
    dnv = 0
    dfr = 0

    @ 吐汇编头部
    st dd ".intel_syntax noprefix\n.section .text\n"

    @ 解析
    llt()
    ll {
        lz dtt 0 { ls }
        zzh()
    }

    zz 0
}

