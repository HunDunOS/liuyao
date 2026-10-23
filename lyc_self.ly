00 ============================================================
00 六爻自举编译器 lyc_self.ly - 纯血六爻版 v0.3.0
00 规范版本: 六爻指令集 SPEC_v1.0 (64指令)
00 架构：dt全局 + tf表 + tt函数 | 目标: x86-64 裸奔无libc
00 状态: 完整自举版 - 支持tt/tz/st/zz/运算/赋值/循环/条件/函数调用/数组/指针
00 ============================================================

00 ---- 全局状态 ----
tz dtd      00 当前字符
tz dtt      00 token类型: 0=EOF 1=数字 2=字符串 3=标识符 4=标点 5=卦指令
tz dth      00 token数值
tz dtz      00 token串指针
tz dtu      00 token长度
tz dtf      00 关键字首字节
tz dts      00 关键字次字节
tz dtn      00 源码长度
tz dtl      00 行号
tz dtb      00 源码指针
tz dtend    00 源码结束指针
tz dtlab    00 标签计数器
tz dsn      00 字符串表计数
tz dnv      00 变量数
tz dfr      00 栈帧大小（预扫描用）
tz dloc     00 局部变量偏移计数器（实际解析用）
tz dtcurfn  00 当前函数名指针
tz dtcurfnl 00 当前函数名长度
tz dln      00 循环嵌套深度

00 ---- 表 ----
tf dsb[65536]: u8    00 源码缓冲
tf dtv[128]: u64     00 变量名表
tf dtw[128]: u64     00 变量偏移表
tf dtisparam[128]: u64  00 是否是参数（1=参数，0=局部）
tf dtvl[128]: u64    00 变量名长度表
tf dsv[256]: u64     00 字符串表
tf dsl[256]: u64     00 字符串长度表
tf dltop[16]: u64    00 循环开始标签栈
tf dlend[16]: u64    00 循环结束标签栈
tf gname[64]: u64    00 全局变量名表
tf gsize[64]: u64    00 全局变量大小(字节)
tf glen[64]: u64     00 全局变量名长度
tz gcount            00 全局变量数
tz infunc             00 是否在函数体内（1=是，0=否，用于区分全局/局部tz声明）
tf pname[16]: u64    00 参数名临时表
tf plen[16]: u64     00 参数名长度临时表
tz pcount            00 参数总数

00 ============================================================
00 基础工具
00 ============================================================

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
        i = i ht 1
    }
}

00 ============================================================
00 词法分析
00 ============================================================

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

    00 注释 (00)
    lr c == 48 {
        lr dtb ht 1 < dtend {
            tz na = dtb ht 1
            tz nr = fr na
            tz nc = nr hs 255
            lr nc == 48 {
                dtb = dtb ht 2
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
        }
    }

    00 数字
    lr ldh(c) == 1 { ldn(); zz 1 }

    00 字符串
    lr c == 34 { lst(); zz 1 }

    00 两字节卦指令
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

    00 标识符
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

    00 标点（单字符）
    dtt = 4
    dth = c
    dtz = 0
    dtu = 1
    dtb = dtb ht 1
    zz 1
}

00 ============================================================
00 变量表
00 ============================================================

tt lfv(name) -> u32 {
    tz i = 0
    tz j = 0
    tz vlen = 0
    tz match = 0
    00 先查局部变量表
    ll {
        lz i dnv { ls }
        vlen = dtvl[i]
        match = 1
        j = 0
        ll {
            lz j vlen { ls }
            tz aa = dtv[i] ht j
            tz ra = fr aa
            tz ca = ra hs 255
            tz bb = name ht j
            tz rb = fr bb
            tz cb = rb hs 255
            lr ca != cb { match = 0; ls }
            j = j ht 1
        }
        lr match == 1 { zz i }
        i = i ht 1
    }
    00 局部没找到，查全局变量表
    tz gi = 0
    ll {
        lz gi gcount { zz dnv }  00 全局也没找到，返回dnv

        vlen = glen[gi]
        match = 1
        j = 0
        ll {
            lz j vlen { ls }
            tz aa = gname[gi] ht j
            tz ra = fr aa
            tz ca = ra hs 255
            tz bb = name ht j
            tz rb = fr bb
            tz cb = rb hs 255

            lr ca != cb { match = 0; ls }
            j = j ht 1
        }

        lr match == 1 { zz dnv ht gi ht 1 }  00 全局变量返回dnv+gi+1
        gi = gi ht 1
    }
    zz dnv
}

tt lfoutvar(vi) -> u32 {
    00 全局变量（vi > dnv）
    lr vi > dnv {
        tz gi = vi hz dnv hz 1
        st dd "[g_"
        tz sf0 = dtcurfn
        tz sf1 = dtcurfnl
        dtcurfn = gname[gi]
        dtcurfnl = glen[gi]
        zt lfoutname()
        dtcurfn = sf0
        dtcurfnl = sf1
        st dd "]"
        zz 0
    }
    00 参数用[rbp+N]，局部变量用[rbp-N]
    lr dtisparam[vi] == 1 {
        st dd "[rbp+"
        st dt dtw[vi]
        st dd "]"
        zz 0
    }
    st dd "[rbp-"
    st dt dtw[vi]
    st dd "]"
    zz 0
}

00 ============================================================
00 预扫描：计算函数栈帧大小
00 ============================================================

tt lprescan() -> u32 {
    00 进入时当前token是{后面的第一个token
    tz depth = 1
    ll {
        lz dtt 0 { zz 0 }
        lr dtt == 4 { lr dth == 123 { depth = depth ht 1 } }
        lr dtt == 4 { lr dth == 125 {
            depth = depth hz 1
            lz depth 0 { zz 0 }
        } }
        lr dtt == 5 { lr dtf == 116 { lr dts == 122 {
            00 tz 声明，每个占8字节
            dfr = dfr ht 8
        } } }
        llt()
    }
}

00 ============================================================
00 基础输出
00 ============================================================

tt 出(c) -> u32 {
    00 输出一个字符到 stdout（用运行时 _rt_putc）
    zt _rt_putc(c)
    zz 0
}

00 ============================================================
00 函数名mangle输出
00 ============================================================

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

00 ============================================================
00 表达式解析
00 ============================================================

tt zzp() -> u32 {
    00 zt 函数调用前缀
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
    00 数字
    lr dtt == 1 {
        st dd "mov rax, "
        st dt dth
        st dd "\n"
        llt()
        zz 0
    }
    00 字符串
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
    00 fr 解引用
    lr dtt == 5 { lr dtf == 102 { lr dts == 114 {
        llt()
        zzd()
        st dd "mov rax, [rax]\n"
        zz 0
    } } }
    00 zf 取地址
    lr dtt == 5 { lr dtf == 122 { lr dts == 102 {
        llt()
        lr dtt == 3 {
            tz name = dtz
            llt()
            tz vi = lfv(name)
            lr vi < dnv {
                st dd "lea rax, "
                zt lfoutvar(vi)
                st dd "\n"
                zz 0
            }
        }
        st dd "mov rax, 0\n"
        zz 0
    } } }
    00 标识符/数组下标/函数调用
    lr dtt == 3 {
        tz name = dtz
        tz namelen = dtu
        llt()
        00 数组下标 arr[i]
        lr dtt == 4 { lr dth == 91 {
            llt()
            zzd()
            00 跳过 ]
            ll { lz dtt 0 { ls }; lr dtt == 4 { lr dth == 93 { llt(); ls } }; llt() }
            st dd "imul rax, 8\n"
            st dd "push rax\n"
            tz vi = lfv(name)
            lr vi < dnv {
                st dd "lea rax, "
                zt lfoutvar(vi)
                st dd "\n"
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
        00 函数调用 name(args)
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
            00 临时设置函数名用于mangle
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
        00 普通变量
        tz vi = lfv(name)
        lr vi != dnv {
            st dd "mov rax, "
            zt lfoutvar(vi)
            st dd "\n"
            zz 0
        }
        st dd "mov rax, 0\n"
        zz 0
    }
    00 未知，返回0
    llt()
    st dd "mov rax, 0\n"
    zz 0
}

tt zzd() -> u32 {
    zzp()
    ll {
        00 卦指令运算符（h_系, dh/dl）
        tz isop = 0
        lr dtt == 5 {
            lr dtf == 104 { tz isop = 1 }
            lr dtf == 100 { lr dts == 104 { tz isop = 1 } }
            lr dtf == 100 { lr dts == 108 { tz isop = 1 } }
        }
        00 比较运算符（标点）
        lr dtt == 4 {
            lr dth == 60 { tz isop = 1 }
            lr dth == 62 { tz isop = 1 }
            lr dth == 61 { tz isop = 1 }
            lr dth == 33 { tz isop = 1 }
        }
        lr isop == 0 { ls }

        00 比较运算符
        lr dtt == 4 {
            tz cmpop = dth
            llt()
            00 >= <= == !=
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

        00 卦指令运算符
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

00 ============================================================
00 语句处理
00 ============================================================

tt lzc() -> u32 {
    00 tz 变量声明
    llt()
    lr dtt != 3 { zz 0 }
    tz name = dtz
    tz namelen = dtu
    tz vi = dnv
    dtv[vi] = name
    dtvl[vi] = namelen
    dloc = dloc ht 8
    dtw[vi] = dloc
    dtisparam[vi] = 0
    dnv = dnv ht 1
    llt()
    00 = 赋值
    lr dtt == 4 { lr dth == 61 {
        llt()
        zzd()
        st dd "mov "
        zt lfoutvar(vi)
        st dd ", rax\n"
    } }
    zz 0
}

tt lzs() -> u32 {
    00 st 输出
    llt()
    lr dtt != 5 { zz 0 }
    lr dtf == 100 { lr dts == 100 {
        00 st dd 字符串
        llt()
        lr dtt == 2 {
            zzd()
            st dd "push rax\ncall _rt_puts\nadd rsp, 8\n"
        }
        zz 0
    } }
    lr dtf == 100 { lr dts == 116 {
        00 st dt 整数
        llt()
        zzd()
        st dd "push rax\ncall _rt_puti\nadd rsp, 8\n"
        zz 0
    } }
    zz 0
}

tt lzr() -> u32 {
    00 zz 返回
    llt()
    lr dtt == 1 {
        st dd "mov rax, "
        st dt dth
        st dd "\n"
        llt()
    }
    lr dtt != 4 { lr dth != 125 {
        00 返回表达式
        zzd()
    } }
    st dd "jmp .Lret_"
    zt lfoutname()
    st dd "\n"
    zz 0
}

tt lzassign() -> u32 {
    00 赋值语句：变量=表达式 或 数组[i]=表达式
    00 进入时当前token是标识符
    tz name = dtz
    tz namelen = dtu
    llt()
    00 数组下标 arr[i] = expr
    lr dtt == 4 { lr dth == 91 {
        llt()
        zzd()
        00 跳过 ]
        ll { lz dtt 0 { ls }; lr dtt == 4 { lr dth == 93 { llt(); ls } }; llt() }
        st dd "imul rax, 8\n"
        st dd "push rax\n"
        tz vi = lfv(name)
        lr vi < dnv {
            st dd "lea rax, "
            zt lfoutvar(vi)
            st dd "\n"
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
        00 跳过 =
        ll { lz dtt 0 { ls }; lr dtt == 4 { lr dth == 61 { llt(); ls } }; llt() }
        zzd()
        st dd "mov rcx, rax\npop rax\nmov [rax], rcx\n"
        zz 0
    } }
    00 普通变量赋值
    00 跳过 =
    ll { lz dtt 0 { ls }; lr dtt == 4 { lr dth == 61 { llt(); ls } }; llt() }
    zzd()
    tz vi = lfv(name)
    lr vi != dnv {
        st dd "mov "
        zt lfoutvar(vi)
        st dd ", rax\n"
    }
    zz 0
}

tt lzlr() -> u32 {
    00 lr 条件 { ... } [ld { ... }]
    llt()
    zzd()
    tz lab = dtlab
    dtlab = dtlab ht 1
    st dd "test rax, rax\njz .Lelse"
    st dt lab
    st dd "\n"
    00 跳过 {
    ll { lr dtt == 4 { lr dth == 123 { llt(); ls } }; llt() }
    00 then 块
    ll {
        lr dtt == 4 { lr dth == 125 { ls } }
        zzh()
    }
    llt()
    00 ld else
    lr dtt == 5 { lr dtf == 108 { lr dts == 100 {
        llt()
        tz lab2 = dtlab
        dtlab = dtlab ht 1
        st dd "jmp .Lendif"
        st dt lab2
        st dd "\n.Lelse"
        st dt lab
        st dd ":\n"
        00 跳过 {
        ll { lz dtt 0 { ls }; lr dtt == 4 { lr dth == 123 { llt(); ls } }; llt() }
        00 else 块
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
    00 lz 相等跳转 / lh 不等跳转
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
    00 跳过 {
    ll { lr dtt == 4 { lr dth == 123 { llt(); ls } }; llt() }
    00 块
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
    00 ll [条件] { ... }
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
    00 条件循环（不是 {）
    lr dtt != 4 {
        zzd()
        st dd "test rax, rax\njz .Lend"
        st dt end
        st dd "\n"
    }
    00 跳过 {
    ll { lr dtt == 4 { lr dth == 123 { llt(); ls } }; llt() }
    00 循环体
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

00 ============================================================
00 语句分派
00 ============================================================

tt zzh() -> u32 {
    lr dtt == 0 { zz 0 }

    00 tf 全局数组声明
    lr dtt == 5 { lr dtf == 116 { lr dts == 102 {
        llt()
        lr dtt == 3 {
            tz gi = gcount
            gname[gi] = dtz
            glen[gi] = dtu
            llt()
            00 跳过 [
            ll { lz dtt 0 { ls }; lr dtt == 4 { lr dth == 91 { llt(); ls } }; llt() }
            tz arrn = dth
            llt()
            00 跳过 ]
            ll { lz dtt 0 { ls }; lr dtt == 4 { lr dth == 93 { llt(); ls } }; llt() }
            00 跳过 : type
            ll { lz dtt 0 { ls }; lr dtt == 4 { lr dth == 58 { llt(); ls } }; llt() }
            llt()  00 跳过类型名
            gsize[gi] = arrn hh 8
            gcount = gcount ht 1
        }
        zz 0
    } } }
    00 tz 声明
    lr dtt == 5 { lr dtf == 116 { lr dts == 122 {
        lr infunc == 0 {
            00 全局tz变量：记录到全局表，.bss分配8字节
            llt()
            lr dtt == 3 {
                tz gi = gcount
                gname[gi] = dtz
                glen[gi] = dtu
                gsize[gi] = 8
                gcount = gcount ht 1
                llt()
                00 跳过 = 初始化（全局变量暂不支持初始化，跳过）
                lr dtt == 4 { lr dth == 61 {
                    ll { lz dtt 0 { ls }; lr dtt == 4 { lr dth == 10 { llt(); ls } }; llt() }
                } }
            }
            zz 0
        }
        lzc()
        zz 0
    } } }

    00 st 输出
    lr dtt == 5 { lr dtf == 115 { lr dts == 116 { lzs(); zz 0 } } }

    00 zz 返回
    lr dtt == 5 { lr dtf == 122 { lr dts == 122 { lzr(); zz 0 } } }

    00 lr 条件
    lr dtt == 5 { lr dtf == 108 { lr dts == 114 { lzlr(); zz 0 } } }

    00 lz 相等跳转
    lr dtt == 5 { lr dtf == 108 { lr dts == 122 { zt lzlz(0); zz 0 } } }

    00 lh 不等跳转
    lr dtt == 5 { lr dtf == 108 { lr dts == 104 { zt lzlz(1); zz 0 } } }

    00 ll 循环
    lr dtt == 5 { lr dtf == 108 { lr dts == 108 { lzll(); zz 0 } } }

    00 ls 跳出
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

    00 lf 继续
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

    00 zt 函数调用语句
    lr dtt == 5 { lr dtf == 122 { lr dts == 116 {
        llt()
        zzd()
        zz 0
    } } }

    00 zd 系统调用（简化：zd 1 cc = 输出字符）
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

    00 tt 函数定义
    lr dtt == 5 { lr dtf == 116 { lr dts == 116 {
        llt()
        tz save_dtb = dtb
        lr dtt == 3 {
            dtcurfn = dtz
            dtcurfnl = dtu
        }
        00 跳过参数列表
        ll { llt(); lr dtt == 4 { lr dth == 41 { ls } } }
        00 跳过返回类型 -> u32 {
        ll { llt(); lr dtt == 4 { lr dth == 123 { ls } } }
        llt()
        00 预扫描
        dfr = 0
        dnv = 0
        zt lprescan()
        00 恢复重新解析
        dtb = save_dtb
        llt()
        00 生成函数标签和序言
        st dd ".globl fn_"
        zt lfoutname()
        st dd "\nfn_"
        zt lfoutname()
        st dd ":\n"
        st dd "push rbp\nmov rbp, rsp\nsub rsp, "
        st dt dfr
        st dd "\n"
        dnv = 0
        00 解析参数列表
        pcount = 0
        llt()  00 跳过 (
        ll {
            lr dtt == 4 { lr dth == 41 { ls } }
            lr dtt == 3 {
                pname[pcount] = dtz
                plen[pcount] = dtu
                pcount = pcount ht 1
                llt()
            }
            lr dtt == 4 { lr dth == 44 { llt() } }
        }
        llt()  00 跳过 )
        00 参数加入变量表: 第i个参数偏移=16+8*(pcount-1-i)
        tz pi2 = 0
        ll {
            lz pi2 pcount { ls }
            dtv[dnv] = pname[pi2]
            dtvl[dnv] = plen[pi2]
            dtw[dnv] = 16 ht (8 hh (pcount hz 1 hz pi2))
            dtisparam[dnv] = 1
            dnv = dnv ht 1
            pi2 = pi2 ht 1
        }
        dloc = 0
        00 跳过返回类型
        ll { llt(); lr dtt == 4 { lr dth == 123 { ls } } }
        llt()
        00 解析函数体
        infunc = 1
        ll {
            lr dtt == 4 { lr dth == 125 {
                infunc = 0
                st dd ".Lret_"
                zt lfoutname()
                st dd ":\nmov rsp, rbp\npop rbp\nret\n"
                llt()
                zz 0
            } }
            zzh()
        }
        infunc = 0
        zz 0
    } } }

    00 赋值语句（标识符开头）
    lr dtt == 3 { lzassign(); zz 0 }

    00 未知，跳过
    llt()
    zz 0
}

00 ============================================================
00 主函数
00 ============================================================

tt 主(fname) -> u32 {
    00 从命令行参数读取源码文件
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

    00 吐汇编头部
    st dd ".intel_syntax noprefix\n.section .text\n"

    00 解析
    llt()
    ll {
        lz dtt 0 { ls }
        zzh()
    }

    00 输出 .bss 全局变量
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
    00 输出字符串表
    tz si = 0
    st dd ".section .rodata\n"
    ll {
        lz si dsn { ls }
        st dd ".Lstr"
        st dt si
        st dd ": .ascii \""
        00 输出字符串内容
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
