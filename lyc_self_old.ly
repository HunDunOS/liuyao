@ 六爻自举编译器 v0.1 - 最小完整版
@ 语法：C风格函数调用 func(args)，中缀运算 a ht b

@ ---- 全局状态 ----
tz g_src
tz g_srclen
tz g_pos
tz g_line
tz tok_type
tz tok_val
tz tok_str
tz tok_len
tz g_out [65536]: u8
tz g_outpos
tz g_nvars
tz g_framesz
tz g_vname [64]
tz g_voff [64]

@ ============================================================
@ 工具函数
@ ============================================================

tt 串长(s) -> u32 {
    tz i = 0
    ll {
        tz addr = s ht i
        tz rawc3 = fr addr
        tz c = rawc3 hs 255
        lz c 0 { zz i }
        tz i = i ht 1
    }
}

tt is_digit(c) -> u32 {
    lr c >= 48 { lr c <= 57 { zz 1 } }
    zz 0
}

tt is_alpha(c) -> u32 {
    lr c >= 97 { lr c <= 122 { zz 1 } }
    lr c >= 65 { lr c <= 90 { zz 1 } }
    lr c == 95 { zz 1 }
    lr c >= 128 { zz 1 }
    zz 0
}

@ ============================================================
@ 词法分析
@ ============================================================

tt skip_ws() -> u32 {
    ll {
        lr g_pos == g_srclen { ls }
        tz addr = g_src ht g_pos
        tz rawc = fr addr
        tz c = rawc hs 255
        tz is_ws = 0
        lr c == 32 { is_ws = 1 }
        lr c == 9 { is_ws = 1 }
        lr c == 10 { is_ws = 1; g_line = g_line ht 1 }
        lr c == 13 { is_ws = 1 }
        lr is_ws == 1 { g_pos = g_pos ht 1 }
        lr is_ws == 0 { ls }
    }
    zz 0
}

tt next_tok() -> u32 {
    skip_ws()
    lz g_pos g_srclen { tok_type = 0; zz 0 }
    tz addr = g_src ht g_pos
    tz rawc = fr addr
    tz c = rawc hs 255

    @ 数字
    lr is_digit(c) {
        tz val = 0
        ll {
        ls
            lz g_pos g_srclen { ls }
            tz addrd = g_src ht g_pos
            tz rawd = fr addrd
            tz d = rawd hs 255
            lr is_digit(d) == 0 { ls }
            val = val hh 10
            val = val ht d hz 48
            g_pos = g_pos ht 1
        }
        tok_type = 1
        tok_val = val
        zz 1
    }

    @ 字符串
    lr c == 34 {
        g_pos = g_pos ht 1
        tz start_off = g_pos
        tz start = g_src ht g_pos
        ll {
        ls
            lz g_pos g_srclen { ls }
            tz addrch = g_src ht g_pos
            tz rawch = fr addrch
            tz ch = rawch hs 255
            lr ch == 34 { ls }
            g_pos = g_pos ht 1
        }
        tok_type = 2
        tok_str = start
        tok_len = g_pos hz start_off
        lr g_pos < g_srclen { g_pos = g_pos ht 1 }
        zz 1
    }

    @ 标识符
    lr is_alpha(c) {
        tz start_off = g_pos
        tz start = g_src ht g_pos
        ll {
        ls
            lz g_pos g_srclen { ls }
            tz addrch = g_src ht g_pos
            tz rawch = fr addrch
            tz ch = rawch hs 255
            lr is_alpha(ch) { g_pos = g_pos ht 1 }
            lr is_digit(ch) { g_pos = g_pos ht 1 }
            lz is_alpha(ch) 0 { lz is_digit(ch) 0 { ls } }
        }
        tok_type = 3
        tok_str = start
        tok_len = g_pos hz start_off
        zz 1
    }

    @ 标点
    tok_type = 5
    tok_val = c
    g_pos = g_pos ht 1
    zz 1
}

@ ============================================================
@ 代码生成
@ ============================================================

tt emit(s) -> u32 {
    st dd s
    zz 0
}

tt emit_num(n) -> u32 {
    st dt n
    zz 0
}

@ ============================================================
@ 表达式解析（最小：数字/变量/加法）
@ ============================================================

tt parse_expr() -> u32 {
    lr tok_type == 1 {
        emit("mov rax, ")
        emit_num(tok_val)
        emit("\n")
        next_tok()

    }
    lr tok_type == 3 {
        tz vi = 0
        found = 0
        ll {
        ls
            lz vi g_nvars { ls }
            lr g_vname[vi] == tok_str { tz found = 1; ls }
            tz vi = vi ht 1
        }
        lr found == 1 {
            tz off = g_voff[vi]
            emit("mov rax, [rbp")
            lr off >= 0 { emit("+") }
            emit_num(off)
            emit("]\n")
        }
        next_tok()
    }
    ll {
        lr tok_type != 5 { ls }
        lr tok_val != 43 { ls }
        next_tok()
        emit("push rax\n")
        parse_expr()
        emit("mov rcx, rax\npop rax\nadd rax, rcx\n")
    }
    zz 0
}

@ ============================================================
@ 语句解析
@ ============================================================

tt parse_stmt() -> u32 {
    @ st dt 整数输出
    lr tok_type != 3 { next_tok(); zz 0 }
    lr tok_len != 2 { next_tok(); zz 0 }
    tz raw0 = fr tok_str
    tz k0 = raw0 hs 255
    tz addr1 = tok_str ht 1
    tz raw1 = fr addr1
    tz k1 = raw1 hs 255
    st dd "K0="; st dt k0; st dd " K1="; st dt k1; st dd " pos="; st dt g_pos; st dd "\n"

    @ st
    lr k0 == 115 { lr k1 == 116 {
        next_tok()
        lr tok_type == 3 { lr tok_len == 2 {
            tz raws0 = fr tok_str
            tz s0 = raws0 hs 255
            tz addrs1 = tok_str ht 1
            tz raws1 = fr addrs1
            tz s1 = raws1 hs 255
            lr s0 == 100 { lr s1 == 116 {
                next_tok()
                parse_expr()
                emit("push rax\ncall _rt_puti\nadd rsp, 8\n")
                zz 0
            } }
            lr s0 == 100 { lr s1 == 100 {
                next_tok()
                lr tok_type == 2 {
                    emit("push offset .Lstr0\ncall _rt_puts\nadd rsp, 8\n")
                    next_tok()
                }
                zz 0
            } }
        } }
        zz 0
    } }

    @ tz
    lr k0 == 116 { lr k1 == 122 {

        next_tok()
        lr tok_type == 3 {
            tz vi = g_nvars
            g_vname[vi] = tok_str
            g_framesz = g_framesz ht 16
            g_voff[vi] = g_framesz
            g_nvars = g_nvars ht 1
            next_tok()
            lh tok_type 5 { zz 0 }
            lh tok_val 61 { zz 0 }
            next_tok()
            parse_expr()
            st dd "mov [rbp+"
            st dt g_voff[vi]
            st dd "], rax\n"
        }
        zz 0
    } }

    @ zz
    lr k0 == 122 { lr k1 == 122 {
        next_tok()
        lr tok_type == 1 {
            emit("mov rax, ")
            emit_num(tok_val)
            emit("\n")
            next_tok()
        }
        emit("jmp .Lret_main\n")
        zz 0
    } }

    @ 未知，跳过
    next_tok()
    zz 0
}

@ ============================================================
@ 主函数
@ ============================================================

tt 主(argc, argv) -> u32 {
    @ 初始化
    g_pos = 0
    g_line = 1
    g_nvars = 0
    g_framesz = 0
    g_outpos = 0

    @ 测试源码
    tz test_src = "tt 主() -> u32 {\n  tz a = 10\n  tz b = 20\n  st dt a ht b\n  zz 0\n}\n"
    g_src = test_src
    tz dbg_addr = g_src
    tz dbg_raw = fr dbg_addr
    tz dbg_c = dbg_raw hs 255
    g_srclen = 串长(test_src)
    st dd "SRCLEN="; st dt g_srclen; st dd "\n"
    tz dbi = 0
    ll { lz dbi 40 { ls } tz dba = g_src ht dbi tz dbr = fr dba tz dbc = dbr hs 255 st dt dbc tz dbi = dbi ht 1 }
    st dd "\n"


    @ 输出汇编头部
    emit(".intel_syntax noprefix\n.section .text\n.globl fn_main\nfn_main:\npush rbp\nmov rbp, rsp\n")

    @ 解析
    st dd "MAIN ty="; st dt tok_type; st dd " len="; st dt tok_len; st dd " pos="; st dt g_pos; st dd "\n"
    next_tok()
    ll {
        lz tok_type 0 { ls }
        parse_stmt()
    }

    @ 结语
    emit("sub rsp, ")
    emit_num(g_framesz)
    emit("\n.Lret_main:\nmov rsp, rbp\npop rbp\nret\n")


    zz 0
}
