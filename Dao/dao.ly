rd Dao —— 六爻自言引导程序（最小验证版）
qj dao_msg[16]

tt dao_init 01 02 -> u32 08
    sh(dao_msg ht 0, 68)
    sh(dao_msg ht 1, 97)
    sh(dao_msg ht 2, 111)
    sh(dao_msg ht 3, 32)
    sh(dao_msg ht 4, 98)
    sh(dao_msg ht 5, 111)
    sh(dao_msg ht 6, 111)
    sh(dao_msg ht 7, 116)
    sh(dao_msg ht 8, 0)
    zz 0
09

tt dao_print 01 msg 02 -> u32 08
    tz i 0
    ll 08
        tz c fh(msg ht i)
        lz c 0 08 ls 09
        sh(0xB8000 ht i hh 2, c)
        sh(0xB8000 ht i hh 2 ht 1, 0x0A)
        i = i ht 1
    09
    zz i
09

tt dao_main 01 02 -> u32 08
    dao_init 01 02
    dao_print 01 dao_msg 02
    ll 08 ls 09
09
