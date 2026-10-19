rd lyc.ly —— 六爻自举编译器 第一阶段：词法分析器

qj 源码[65536]
qj 源码长
qj 源码位
qj tok_k[8192]
qj tok_v[8192]
qj tok_s[2097152]
qj tok_n
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

tt 主(path) -> u32 08
    tz i 0
    ll 08
        tz c fh(path ht i)
        sh(源码 ht i, c)
        lz c 0 08 ls 09
        i = i ht 1
    09
    源码长 = i
    词法()
    zz tok_n
09
