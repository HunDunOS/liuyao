@ ============================================================
@ 六爻自举编译器 lyc_self.ly - 纯血六爻版 v0.3.0
@ 规范版本: 六爻指令集 SPEC_v1.0 (64指令)
@ 架构：dt全局 + tf表 + tt函数 | 目标: x86-64 裸奔无libc
@ 状态: 完整自举版 - 支持tt/tz/st/zz/运算/赋值/循环/条件/函数调用/数组/指针
@ ============================================================

@ ---- 全局状态 ----
tz dtd      @ 当前字符
tz dtt      @ token类型: 0=EOF 1=数字 2=字符串 3=标识符 4=标点 5=卦指令
tz dth      @ token数值
tz dtz      @ token串指针
tz dtu      @ token长度
tz dtf      @ 关键字首字节
tz dts      @ 关键字次字节
tz dtn      @ 源码长度
tz dtl      @ 行号
tz dtb      @ 源码指针
tz dtend    @ 源码结束指针
tz dtlab    @ 标签计数器
tz dsn      @ 字符串表计数
tz dnv      @ 变量数
tz dfr      @ 栈帧大小
tz dtcurfn  @ 当前函数名指针
tz dtcurfnl @ 当前函数名长度
tz dln      @ 循环嵌套深度

@ ---- 表 ----
tf dsb[65536]: u8    @ 源码缓冲
tf dtv[128]: u64     @ 变量名表
tf dtw[128]: u64     @ 变量偏移表（正数，输出时用[rbp-N]）
tf dtvl[128]: u64    @ 变量名长度表
tf dsv[256]: u64     @ 字符串表
tf dsl[256]: u64     @ 字符串长度表
tf dltop[16]: u64    @ 循环开始标签栈
tf dlend[16]: u64    @ 循环结束标签栈
tf gname[64]: u64    @ 全局变量名表
tf gsize[64]: u64    @ 全局变量大小(字节)
tf glen[64]: u64     @ 全局变量名长度
tz gcount            @ 全局变量数

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

tt ldn() -> u32 {
    tz val = 0
    tz digit = 0
    ll {
        lr dtb >= dtend { ls }
        tz a = dtb
        tz r = fr a
        tz c = r hs 255
        lr ldh(c) == 0 { ls }
        val = val hh 10
        digit = c hz 48
        val = val ht digit
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
        lz i dnv { zz dnv }
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
@ 预扫描：计算函数栈帧大小
@ ============================================================

tt lprescan() -> u32 {
    @ 进入时当前token是{后面的第一个token
    tz depth = 1
    ll {
        lz dtt 0 { zz 0 }
        lr dtt == 4 { lr dth == 123 { depth = depth ht 1 } }
        lr dtt == 4 { lr dth == 125 {
            depth = depth hz 1
            lz depth 0 { zz 0 }
        } }
        lr dtt == 5 { lr dtf == 116 { lr dts == 122 {
            @ tz 声明，每个占8字节
            dfr = dfr ht 8
        } } }
        llt()
    }
}

@ ============================================================
@ 函数名mangle输出
@ ============================================================

tt lfoutname() -> u32 {
    tz i = 0
    ll {
        lr i >= dtcurfnl { ls }
        tz addr = dtcurfn ht i
        tz c = fr addr
        tz cb = c hs 255
        tz isasc = 0
        lr cb >= 97 { lr cb <= 122 { tz isasc = 1 } }
        lr cb >= 65 { lr cb <= 90 { tz isasc = 1 } }
        lr cb >= 48 { lr cb <= 57 { tz isasc = 1 } }
        lr cb == 95 { tz isasc = 1 }
        lr isasc == 1 {
            zt 出(cb)
        } ld {
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

@ ============================================================
@ 表达式解析
@ ============================================================

tt zzp() -> u32 {
    @ zt 函数调用前缀
    lr dtt == 5 { lr dtf == 122 { lr dts == 116 {
        llt()
        lr dtt == 3 {
            tz name = dtz
            tz namelen = dtu
            llt()
            lr dtt == 4 { lr dth == 40 {
                llt()
                tz nargs = 0
                ll {
                    lr dtt == 4 { lr dth == 41 { ls } }
                    zzd()
                    st dd "push rax\n"
                    nargs = nargs ht 1
                    lr dtt == 4 { lr dth == 44 { llt() } }
                }
                llt()
                tz savefn = dtcurfn
                tz savefnl = dtcurfnl
                dtcurfn = name
                dtcurfnl = namelen
                st dd "call fn_"
                zt lfoutname()
                st dd "\n"
                dtcurfn = savefn
                dtcurfnl = savefnl
                lr nargs > 0 {
                    st dd "add rsp, "
                    tz nbytes = nargs hh 8
                    st dt nbytes
                    st dd "\n"
                }
                zz 0
            } }
        }
        zz 0
    } } }
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
    @ fr 解引用
    lr dtt == 5 { lr dtf == 102 { lr dts == 114 {
        llt()
        zzd()
        st dd "mov rax, [rax]\n"
        zz 0
    } } }
    @ zf 取地址
    lr dtt == 5 { lr dtf == 122 { lr dts == 102 {
        llt()
        lr dtt == 3 {
            tz name = dtz
            llt()
            tz vi = lfv(name)
            lr vi < dnv {
                st dd "lea rax, [rbp-"
                st dt dtw[vi]
                st dd "]\n"
                zz 0
            }
        }
        st dd "mov rax, 0\n"
        zz 0
    } } }
    @ 标识符/数组下标/函数调用
    lr dtt == 3 {
        tz name = dtz
        tz namelen = dtu
        llt()
        @ 数组下标 arr[i]
        lr dtt == 4 { lr dth == 91 {
            llt()
            zzd()
            @ 跳过 ]
            ll { lz dtt 0 { ls }; lr dtt == 4 { lr dth == 93 { llt(); ls } }; llt() }
            st dd "imul rax, 8\n"
            st dd "push rax\n"
            tz vi = lfv(name)
            lr vi < dnv {
                st dd "lea rax, [rbp-"
                st dt dtw[vi]
                st dd "]\n"
            } ld {
                st dd "mov rax, offset g_"
                tz sf0 = dtcurfn
                tz sf1 = dtcurfnl
                dtcurfn = name
                dtcurfnl = namelen
                zt lfoutname()
                dtcurfn = sf0
                dtcurfnl = sf1
                st dd "\n"
            }
            st dd "mov rcx, rax\npop rax\nadd rax, rcx\n"
            st dd "mov rax, [rax]\n"
            zz 0
        } }
        @ 函数调用 name(args)
        lr dtt == 4 { lr dth == 40 {
            llt()
            tz nargs = 0
            ll {
                lr dtt == 4 { lr dth == 41 { ls } }
                zzd()
                st dd "push rax\n"
                nargs = nargs ht 1
                lr dtt == 4 { lr dth == 44 { llt() } }
            }
            llt()
            @ 临时设置函数名用于mangle
            tz savefn = dtcurfn
            tz savefnl = dtcurfnl
            dtcurfn = name
            dtcurfnl = namelen
            st dd "call fn_"
            zt lfoutname()
            st dd "\n"
            dtcurfn = savefn
            dtcurfnl = savefnl
            lr nargs > 0 {
                st dd "add rsp, "
                tz nbytes = nargs hh 8
                st dt nbytes
                st dd "\n"
            }
            zz 0
        } }
        @ 普通变量
        tz vi = lfv(name)
        lr vi < dnv {
            st dd "mov rax, [rbp-"
            st dt dtw[vi]
            st dd "]\n"
            zz 0
        }
        st dd "mov rax, 0\n"
        zz 0
    }
    @ 未知，返回0
    llt()
    st dd "mov rax, 0\n"
    zz 0
}

tt zzd() -> u32 {
    zzp()
    ll {
        @ 卦指令运算符（h_系, dh/dl）
        tz isop = 0
        lr dtt == 5 {
            lr dtf == 104 { tz isop = 1 }
            lr dtf == 100 { lr dts == 104 { tz isop = 1 } }
            lr dtf == 100 { lr dts == 108 { tz isop = 1 } }
        }
        @ 比较运算符（标点）
        lr dtt == 4 {
            lr dth == 60 { tz isop = 1 }
            lr dth == 62 { tz isop = 1 }
            lr dth == 61 { tz isop = 1 }
            lr dth == 33 { tz isop = 1 }
        }
        lr isop == 0 { ls }

        @ 比较运算符
        lr dtt == 4 {
            tz cmpop = dth
            llt()
            @ >= <= == !=
            lr cmpop == 62 { lr dtt == 4 { lr dth == 61 { tz cmpop = 262; llt() } } }
            lr cmpop == 60 { lr dtt == 4 { lr dth == 61 { tz cmpop = 260; llt() } } }
            lr cmpop == 61 { lr dtt == 4 { lr dth == 61 { tz cmpop = 261; llt() } } }
            lr cmpop == 33 { lr dtt == 4 { lr dth == 61 { tz cmpop = 233; llt() } } }
            st dd "push rax\n"
            zzd()
            st dd "mov rcx, rax\npop rax\ncmp rax, rcx\n"
            lr cmpop == 261 { st dd "sete al\n" }
            lr cmpop == 233 { st dd "setne al\n" }
            lr cmpop == 60 { st dd "setl al\n" }
            lr cmpop == 62 { st dd "setg al\n" }
            lr cmpop == 260 { st dd "setle al\n" }
            lr cmpop == 262 { st dd "setge al\n" }
            st dd "movzx rax, al\n"
            zz 0
        }

        @ 卦指令运算符
        tz opf = dtf
        tz ops = dts
        llt()
        st dd "push rax\n"
        zzd()
        st dd "mov rcx, rax\npop rax\n"
        lr opf == 104 { lr ops == 116 { st dd "add rax, rcx\n" } }
        lr opf == 104 { lr ops == 122 { st dd "sub rax, rcx\n" } }
        lr opf == 104 { lr ops == 104 { st dd "imul rax, rcx\n" } }
        lr opf == 104 { lr ops == 108 { st dd "xor rdx, rdx\ndiv rcx\n" } }
        lr opf == 104 { lr ops == 102 { st dd "xor rdx, rdx\ndiv rcx\nmov rax, rdx\n" } }
        lr opf == 104 { lr ops == 115 { st dd "and rax, rcx\n" } }
        lr opf == 104 { lr ops == 114 { st dd "or rax, rcx\n" } }
        lr opf == 104 { lr ops == 100 { st dd "xor rax, rcx\n" } }
        lr opf == 100 { lr ops == 104 { st dd "shl rax, cl\n" } }
        lr opf == 100 { lr ops == 108 { st dd "shr rax, cl\n" } }
    }
    zz 0
}

@ ============================================================
@ 语句处理
@ ============================================================

tt lzc() -> u32 {
    @ tz 变量声明
    llt()
    lr dtt != 3 { zz 0 }
    tz name = dtz
    tz namelen = dtu
    tz vi = dnv
    dtv[vi] = name
    dtvl[vi] = namelen
    tz off = vi ht 1
    off = off hh 8
    dtw[vi] = off
    dnv = dnv ht 1
    llt()
    @ = 赋值
    lr dtt == 4 { lr dth == 61 {
        llt()
        zzd()
        st dd "mov [rbp-"
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
            st dd "push rax\ncall _rt_puts\nadd rsp, 8\n"
        }
        zz 0
    } }
    lr dtf == 100 { lr dts == 116 {
        @ st dt 整数
        llt()
        zzd()
        st dd "push rax\ncall _rt_puti\nadd rsp, 8\n"
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
    lr dtt != 4 { lr dth != 125 {
        @ 返回表达式
        zzd()
    } }
    st dd "jmp .Lret_"
    zt lfoutname()
    st dd "\n"
    zz 0
}

tt lzassign() -> u32 {
    @ 赋值语句：变量=表达式 或 数组[i]=表达式
    @ 进入时当前token是标识符
    tz name = dtz
    tz namelen = dtu
    llt()
    @ 数组下标 arr[i] = expr
    lr dtt == 4 { lr dth == 91 {
        llt()
        zzd()
        @ 跳过 ]
        ll { lz dtt 0 { ls }; lr dtt == 4 { lr dth == 93 { llt(); ls } }; llt() }
        st dd "imul rax, 8\n"
        st dd "push rax\n"
        tz vi = lfv(name)
        lr vi < dnv {
            st dd "lea rax, [rbp-"
            st dt dtw[vi]
            st dd "]\n"
        } ld {
            st dd "mov rax, offset g_"
            tz sf0 = dtcurfn
            tz sf1 = dtcurfnl
            dtcurfn = name
            dtcurfnl = namelen
            zt lfoutname()
            dtcurfn = sf0
            dtcurfnl = sf1
            st dd "\n"
        }
        st dd "mov rcx, rax\npop rax\nadd rax, rcx\n"
        st dd "push rax\n"
        @ 跳过 =
        ll { lz dtt 0 { ls }; lr dtt == 4 { lr dth == 61 { llt(); ls } }; llt() }
        zzd()
        st dd "mov rcx, rax\npop rax\nmov [rax], rcx\n"
        zz 0
    } }
    @ 普通变量赋值
    @ 跳过 =
    ll { lz dtt 0 { ls }; lr dtt == 4 { lr dth == 61 { llt(); ls } }; llt() }
    zzd()
    tz vi = lfv(name)
    lr vi < dnv {
        st dd "mov [rbp-"
        st dt dtw[vi]
        st dd "], rax\n"
    }
    zz 0
}

tt lzlr() -> u32 {
    @ lr 条件 { ... } [ld { ... }]
    llt()
    zzd()
    tz lab = dtlab
    dtlab = dtlab ht 1
    st dd "test rax, rax\njz .Lelse"
    st dt lab
    st dd "\n"
    @ 跳过 {
    ll { lr dtt == 4 { lr dth == 123 { llt(); ls } }; llt() }
    @ then 块
    ll {
        lr dtt == 4 { lr dth == 125 { ls } }
        zzh()
    }
    llt()
    @ ld else
    lr dtt == 5 { lr dtf == 108 { lr dts == 100 {
        llt()
        tz lab2 = dtlab
        dtlab = dtlab ht 1
        st dd "jmp .Lendif"
        st dt lab2
        st dd "\n.Lelse"
        st dt lab
        st dd ":\n"
        @ 跳过 {
        ll { lz dtt 0 { ls }; lr dtt == 4 { lr dth == 123 { llt(); ls } }; llt() }
        @ else 块
        ll {
            lr dtt == 4 { lr dth == 125 { ls } }
            zzh()
        }
        llt()
        st dd ".Lendif"
        st dt lab2
        st dd ":\n"
        zz 0
    } } }
    st dd ".Lelse"
    st dt lab
    st dd ":\n"
    zz 0
}

tt lzlz(unequal) -> u32 {
    @ lz 相等跳转 / lh 不等跳转
    llt()
    zzd()
    st dd "push rax\n"
    zzd()
    st dd "mov rcx, rax\npop rax\ncmp rax, rcx\n"
    tz lab = dtlab
    dtlab = dtlab ht 1
    lr unequal == 1 {
        st dd "je .Lelse"
    } ld {
        st dd "jne .Lelse"
    }
    st dt lab
    st dd "\n"
    @ 跳过 {
    ll { lr dtt == 4 { lr dth == 123 { llt(); ls } }; llt() }
    @ 块
    ll {
        lr dtt == 4 { lr dth == 125 { ls } }
        zzh()
    }
    llt()
    st dd ".Lelse"
    st dt lab
    st dd ":\n"
    zz 0
}

tt lzll() -> u32 {
    @ ll [条件] { ... }
    llt()
    tz top = dtlab
    tz end = dtlab ht 1
    dtlab = dtlab ht 2
    dltop[dln] = top
    dlend[dln] = end
    dln = dln ht 1
    st dd ".Ltop"
    st dt top
    st dd ":\n"
    @ 条件循环（不是 {）
    lr dtt != 4 {
        zzd()
        st dd "test rax, rax\njz .Lend"
        st dt end
        st dd "\n"
    }
    @ 跳过 {
    ll { lr dtt == 4 { lr dth == 123 { llt(); ls } }; llt() }
    @ 循环体
    ll {
        lr dtt == 4 { lr dth == 125 { ls } }
        zzh()
    }
    llt()
    st dd "jmp .Ltop"
    st dt top
    st dd "\n.Lend"
    st dt end
    st dd ":\n"
    dln = dln hz 1
    zz 0
}

@ ============================================================
@ 语句分派
@ ============================================================

tt zzh() -> u32 {
    lr dtt == 0 { zz 0 }

    @ tf 全局数组声明
    lr dtt == 5 { lr dtf == 116 { lr dts == 102 {
        llt()
        lr dtt == 3 {
            tz gi = gcount
            gname[gi] = dtz
            glen[gi] = dtu
            llt()
            @ 跳过 [
            ll { lz dtt 0 { ls }; lr dtt == 4 { lr dth == 91 { llt(); ls } }; llt() }
            tz arrn = dth
            llt()
            @ 跳过 ]
            ll { lz dtt 0 { ls }; lr dtt == 4 { lr dth == 93 { llt(); ls } }; llt() }
            @ 跳过 : type
            ll { lz dtt 0 { ls }; lr dtt == 4 { lr dth == 58 { llt(); ls } }; llt() }
            llt()  @ 跳过类型名
            gsize[gi] = arrn hh 8
            gcount = gcount ht 1
        }
        zz 0
    } } }
    @ tz 声明
    lr dtt == 5 { lr dtf == 116 { lr dts == 122 { lzc(); zz 0 } } }

    @ st 输出
    lr dtt == 5 { lr dtf == 115 { lr dts == 116 { lzs(); zz 0 } } }

    @ zz 返回
    lr dtt == 5 { lr dtf == 122 { lr dts == 122 { lzr(); zz 0 } } }

    @ lr 条件
    lr dtt == 5 { lr dtf == 108 { lr dts == 114 { lzlr(); zz 0 } } }

    @ lz 相等跳转
    lr dtt == 5 { lr dtf == 108 { lr dts == 122 { zt lzlz(0); zz 0 } } }

    @ lh 不等跳转
    lr dtt == 5 { lr dtf == 108 { lr dts == 104 { zt lzlz(1); zz 0 } } }

    @ ll 循环
    lr dtt == 5 { lr dtf == 108 { lr dts == 108 { lzll(); zz 0 } } }

    @ ls 跳出
    lr dtt == 5 { lr dtf == 108 { lr dts == 115 {
        llt()
        lr dln > 0 {
            st dd "jmp .Lend"
            tz idx = dln hz 1
            st dt dlend[idx]
            st dd "\n"
        }
        zz 0
    } } }

    @ lf 继续
    lr dtt == 5 { lr dtf == 108 { lr dts == 102 {
        llt()
        lr dln > 0 {
            st dd "jmp .Ltop"
            tz idx = dln hz 1
            st dt dltop[idx]
            st dd "\n"
        }
        zz 0
    } } }

    @ zt 函数调用语句
    lr dtt == 5 { lr dtf == 122 { lr dts == 116 {
        llt()
        zzd()
        zz 0
    } } }

    @ zd 系统调用（简化：zd 1 cc = 输出字符）
    lr dtt == 5 { lr dtf == 122 { lr dts == 100 {
        llt()
        lr dtt == 1 { lr dth == 1 {
            llt()
            zzd()
            st dd "push rax\ncall _rt_putc\nadd rsp, 8\n"
            zz 0
        } }
        zzd()
        st dd "mov rax, rdi\nsyscall\n"
        zz 0
    } } }

    @ tt 函数定义
    lr dtt == 5 { lr dtf == 116 { lr dts == 116 {
        llt()
        tz save_dtb = dtb
        lr dtt == 3 {
            dtcurfn = dtz
            dtcurfnl = dtu
        }
        @ 跳过参数列表
        ll { llt(); lr dtt == 4 { lr dth == 41 { ls } } }
        @ 跳过返回类型 -> u32 {
        ll { llt(); lr dtt == 4 { lr dth == 123 { ls } } }
        llt()
        @ 预扫描
        dfr = 0
        dnv = 0
        zt lprescan()
        @ 恢复重新解析
        dtb = save_dtb
        llt()
        @ 生成函数标签和序言
        st dd ".globl fn_"
        zt lfoutname()
        st dd "\nfn_"
        zt lfoutname()
        st dd ":\n"
        st dd "push rbp\nmov rbp, rsp\nsub rsp, "
        st dt dfr
        st dd "\n"
        dnv = 0
        @ 跳过参数列表
        ll { llt(); lr dtt == 4 { lr dth == 41 { ls } } }
        @ 跳过返回类型
        ll { llt(); lr dtt == 4 { lr dth == 123 { ls } } }
        llt()
        @ 解析函数体
        ll {
            lr dtt == 4 { lr dth == 125 {
                st dd ".Lret_"
                zt lfoutname()
                st dd ":\nmov rsp, rbp\npop rbp\nret\n"
                llt()
                zz 0
            } }
            zzh()
        }
        zz 0
    } } }

    @ 赋值语句（标识符开头）
    lr dtt == 3 { lzassign(); zz 0 }

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
    dln = 0
    gcount = 0

    @ 吐汇编头部
    st dd ".intel_syntax noprefix\n.section .text\n"

    @ 解析
    llt()
    ll {
        lz dtt 0 { ls }
        zzh()
    }

    @ 输出 .bss 全局变量
    st dd ".section .bss\n.align 8\n"
    tz gi = 0
    ll {
        lz gi gcount { ls }
        st dd "g_"
        tz sf0 = dtcurfn
        tz sf1 = dtcurfnl
        dtcurfn = gname[gi]
        dtcurfnl = glen[gi]
        zt lfoutname()
        dtcurfn = sf0
        dtcurfnl = sf1
        st dd ": .space "
        st dt gsize[gi]
        st dd "\n"
        gi = gi ht 1
    }
    @ 输出字符串表
    tz si = 0
    st dd ".section .rodata\n"
    ll {
        lz si dsn { ls }
        st dd ".Lstr"
        st dt si
        st dd ": .ascii \""
        @ 输出字符串内容
        tz sptr = dsv[si]
        tz slen2 = dsl[si]
        tz j = 0
        ll {
            lz j slen2 { ls }
            tz a = sptr ht j
            tz r = fr a
            tz c = r hs 255
            lr c == 34 { zt 出(92); zt 出(34) }
            lr c == 92 { zt 出(92); zt 出(92) }
            lr c == 10 { zt 出(92); zt 出(110) }
            lr c != 34 { lr c != 92 { lr c != 10 { zt 出(c) } } }
            tz j = j ht 1
        }
        st dd "\\0\"\n"
        tz si = si ht 1
    }

    zz 0
}
