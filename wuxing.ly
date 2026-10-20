qj g_var_count
qj g_var_names[2048]
qj g_var_vals[64]
qj cmd_buf[1024]
qj g_offsets[256]
qj g_arr_count
qj g_arr_names[1024]
qj g_arr_offset[32]
qj g_arr_size[32]
qj g_arr_vals[256]
qj if_taken
qj while_start

tt 主 01 path 02 -> u32 08
 g_var_count = 0
    g_arr_count = 0
    tz plat zt _rt_platform 01 02
    zt wx_set_var 01 03lin04, 3, 0 02
    zt wx_set_var 01 03win04, 3, 0 02
    zt wx_set_var 01 03hun04, 3, 0 02
    lr plat == 1 08 zt wx_set_var 01 03lin04, 3, 1 02 09
    lr plat == 2 08 zt wx_set_var 01 03win04, 3, 1 02 09
    lr plat == 3 08 zt wx_set_var 01 03hun04, 3, 1 02 09
    tz plen 0
    ll 08
        tz ch fn_get_byte 01 path ht plen 02
        lr ch == 0 08 ls 09
        tz plen plen ht 1
    09
    tz ok 0
    lr plen >= 3 08
        tz c1 fn_get_byte 01 path ht plen hz 3 02
        tz c2 fn_get_byte 01 path ht plen hz 2 02
        tz c3 fn_get_byte 01 path ht plen hz 1 02
        lr c1 == 46 08
            lr c2 == 119 08
                lr c3 == 120 08
                    tz ok 1
                09
            09
        09
    09
    lr ok == 0 08
        zt _rt_puts 01 03错误: 脚本必须是 .wx 后缀04 02
        zz 1
    09
    tz src 0
    src = fn_read_file 01 path 02
    lr src == 0 08
        zt _rt_puts 01 03用法: wx_run 脚本.wx04 02
        zz 1
    09
    tz pos 0
    tz lc 1
    g_offsets[0] = 0
    ll 08
        lz pos 4096 08 ls 09
        tz c fn_get_byte 01 src ht pos 02
        lr c == 0 08 ls 09
        lr c == 10 08
            tz npos pos ht 1
            ll 08
                tz nc fn_get_byte 01 src ht npos 02
                lr nc == 0 08 ls 09
                lr nc == 32 08 tz npos npos ht 1 09
                lr nc == 9 08 tz npos npos ht 1 09
                lr nc != 32 08
                    lr nc != 9 08 ls 09
                09
            09
            g_offsets[lc] = npos
            tz lc lc ht 1
        09
        tz pos pos ht 1
    09
    tz cur_ip 0
    tz loop_start 0
    tz jumped 0
    ll 08
        lz cur_ip lc 08 ls 09
        tz off g_offsets[cur_ip]
        tz noff g_offsets[cur_ip ht 1]
        lr noff == 0 08 tz noff 4096 09
        tz llen noff hz off
        tz c1 fn_get_byte 01 src ht off 02
        tz c2 0
        lr llen > 1 08 tz c2 fn_get_byte 01 src ht off ht 1 02 09
        lr c1 == 67 08
            lr c2 == 109 08
                tz loop_start cur_ip
                tz ci 0
                ll 08
                    lz ci llen 08 ls 09
                    tz cc fn_get_byte 01 src ht off ht ci 02
                    lr cc == 32 08 tz ci ci ht 1 09
                    lr cc != 32 08 ls 09
                09
                tz cond zt wx_eval 01 src ht off ht ci, llen hz ci 02
                lr cond == 0 08
                    tz skip_ip cur_ip ht 1
                    tz found 0
                    ll 08
                        lz skip_ip lc 08 ls 09
                        lr found == 1 08 ls 09
                        tz soff g_offsets[skip_ip]
                        tz sc1 fn_get_byte 01 src ht soff 02
                        tz sc2 fn_get_byte 01 src ht soff ht 1 02
                        lr sc1 == 67 08
                            lr sc2 == 116 08
                                tz cur_ip skip_ip ht 1
                                tz jumped 1
                                tz found 1
                            09
                        09
                        tz skip_ip skip_ip ht 1
                    09
                09
            09
        09
        lr c1 == 108 08
            lr c2 == 108 08
                tz while_start cur_ip
                tz ci 0
                ll 08
                    lz ci llen 08 ls 09
                    tz cc fn_get_byte 01 src ht off ht ci 02
                    lr cc == 32 08 tz ci ci ht 1 09
                    lr cc != 32 08 ls 09
                09
                tz cond zt wx_eval 01 src ht off ht ci, llen hz ci 02
                lr cond == 0 08
                    tz skip_ip cur_ip ht 1
                    tz found 0
                    ll 08
                        lz skip_ip lc 08 ls 09
                        lr found == 1 08 ls 09
                        tz soff g_offsets[skip_ip]
                        tz sc1 fn_get_byte 01 src ht soff 02
                        tz sc2 fn_get_byte 01 src ht soff ht 1 02
                        lr sc1 == 108 08
                            lr sc2 == 100 08
                                tz cur_ip skip_ip ht 1
                                tz jumped 1
                                tz found 1
                            09
                        09
                        tz skip_ip skip_ip ht 1
                    09
                09
            09
        09
        lr c1 == 88 08
            lr c2 == 106 08
                tz if_taken 0
                tz ci 0
                ll 08
                    lz ci llen 08 ls 09
                    tz cc fn_get_byte 01 src ht off ht ci 02
                    lr cc == 32 08 tz ci ci ht 1 09
                    lr cc != 32 08 ls 09
                09
                tz cond zt wx_eval 01 src ht off ht ci, llen hz ci 02
                lr cond != 0 08
                    tz if_taken 1
                09
                lr cond == 0 08
                    tz skip_ip cur_ip ht 1
                    tz found 0
                    ll 08
                        lz skip_ip lc 08 ls 09
                        lr found == 1 08 ls 09
                        tz soff g_offsets[skip_ip]
                        tz sc1 fn_get_byte 01 src ht soff 02
                        tz sc2 fn_get_byte 01 src ht soff ht 1 02
                        lr sc1 == 88 08
                            lr sc2 == 109 08
                                tz cur_ip skip_ip
                                tz jumped 1
                                tz found 1
                            09
                            lr sc2 == 116 08
                                tz cur_ip skip_ip ht 1
                                tz jumped 1
                                tz found 1
                            09
                        09
                        tz skip_ip skip_ip ht 1
                    09
                09
            09
        09
        lr c1 == 88 08
            lr c2 == 109 08
                lr if_taken == 1 08
                    tz skip_ip cur_ip ht 1
                    tz found 0
                    ll 08
                        lz skip_ip lc 08 ls 09
                        lr found == 1 08 ls 09
                        tz soff g_offsets[skip_ip]
                        tz sc1 fn_get_byte 01 src ht soff 02
                        tz sc2 fn_get_byte 01 src ht soff ht 1 02
                        lr sc1 == 88 08
                            lr sc2 == 116 08
                                tz cur_ip skip_ip ht 1
                                tz jumped 1
                                tz found 1
                            09
                        09
                        tz skip_ip skip_ip ht 1
                    09
                09
                lr if_taken == 0 08
                    tz ci 0
                    ll 08
                        lz ci llen 08 ls 09
                        tz cc fn_get_byte 01 src ht off ht ci 02
                        lr cc == 32 08 tz ci ci ht 1 09
                        lr cc != 32 08 ls 09
                    09
                    tz cond zt wx_eval 01 src ht off ht ci, llen hz ci 02
                    lr cond != 0 08
                        tz if_taken 1
                    09
                    lr cond == 0 08
                        tz skip_ip cur_ip ht 1
                        tz found 0
                        ll 08
                            lz skip_ip lc 08 ls 09
                            lr found == 1 08 ls 09
                            tz soff g_offsets[skip_ip]
                            tz sc1 fn_get_byte 01 src ht soff 02
                            tz sc2 fn_get_byte 01 src ht soff ht 1 02
                            lr sc1 == 88 08
                                lr sc2 == 109 08
                                    tz cur_ip skip_ip
                                    tz jumped 1
                                    tz found 1
                                09
                                lr sc2 == 116 08
                                    tz cur_ip skip_ip ht 1
                                    tz jumped 1
                                    tz found 1
                                09
                            09
                            tz skip_ip skip_ip ht 1
                        09
                    09
                09
            09
        09
        lr c1 == 68 08
            lr c2 == 106 08
                tz skip_ip cur_ip ht 1
                tz found 0
                ll 08
                    lz skip_ip lc 08 ls 09
                    lr found == 1 08 ls 09
                    tz soff g_offsets[skip_ip]
                    tz sc1 fn_get_byte 01 src ht soff 02
                    tz sc2 fn_get_byte 01 src ht soff ht 1 02
                    lr sc1 == 67 08
                        lr sc2 == 116 08
                            tz cur_ip skip_ip ht 1
                            tz jumped 1
                            tz found 1
                        09
                    09
                    tz skip_ip skip_ip ht 1
                09
            09
        09
        lr c1 == 68 08
            lr c2 == 109 08
                tz cur_ip loop_start
                tz jumped 1
            09
        09
        lr c1 == 108 08
            lr c2 == 100 08
                tz cur_ip while_start
                tz jumped 1
            09
        09
        lr c1 == 68 08
            lr c2 == 115 08
                zz 0
            09
        09
        lr llen > 0 08
            zt wx_exec_line 01 src ht off, llen 02
        09
        lr jumped == 0 08
            lr c1 == 67 08
                lr c2 == 116 08 tz cur_ip loop_start 09
                lr c2 != 116 08 tz cur_ip cur_ip ht 1 09
            09
            lr c1 == 108 08
                lr c2 == 100 08 tz cur_ip while_start 09
                lr c2 != 100 08 tz cur_ip cur_ip ht 1 09
            09
            lr c1 != 67 08
                lr c1 != 108 08 tz cur_ip cur_ip ht 1 09
            09
        09
        tz jumped 0
    09
    zz 0
09
tt wx_exec_line 01 line, len 02 -> u32 08
    tz i 0
    ll 08
        lz i len 08 ls 09
        tz ch fn_get_byte 01 line ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch == 9 08 tz i i ht 1 09
        lr ch != 32 08
            lr ch != 9 08 ls 09
        09
    09
    lr i >= len 08 zz 0 09
    tz c1 fn_get_byte 01 line ht i 02
    tz c2 0
    lr len > i ht 1 08 tz c2 fn_get_byte 01 line ht i ht 1 02 09
    lr c1 == 106 08
        lr c2 == 106 08
            zt wx_do_jj 01 line ht i ht 2, len hz i hz 2 02
            zz 0
        09
        lr c2 == 109 08
            zt wx_do_jm 01 line ht i ht 2, len hz i hz 2 02
            zz 0
        09
        lr c2 == 100 08
            zt wx_do_jd 01 line ht i ht 2, len hz i hz 2 02
            zz 0
        09
        lr c2 == 116 08
            zt wx_do_jr 01 line ht i ht 2, len hz i hz 2 02
            zz 0
        09
    09
    lr c1 == 116 08
        lr c2 == 106 08
            zt wx_do_tj 01 line ht i ht 2, len hz i hz 2 02
            zz 0
        09
        lr c2 == 109 08
            zt wx_do_tm 01 line ht i ht 2, len hz i hz 2 02
            zz 0
        09
        lr c2 == 115 08
            zt wx_do_rf 01 line ht i ht 2, len hz i hz 2 02
            zz 0
        09
        lr c2 == 100 08
            zt wx_do_wf 01 line ht i ht 2, len hz i hz 2 02
            zz 0
        09
    09
    lr c1 == 115 08
        lr c2 == 104 08
            zt wx_do_shell 01 line ht i ht 2, len hz i hz 2 02
            zz 0
        09
        lr c2 == 106 08
            zt wx_do_cmp 01 line ht i ht 2, len hz i hz 2, 0 02
            zz 0
        09
        lr c2 == 109 08
            zt wx_do_cmp 01 line ht i ht 2, len hz i hz 2, 1 02
            zz 0
        09
        lr c2 == 115 08
            zt wx_do_cmp 01 line ht i ht 2, len hz i hz 2, 2 02
            zz 0
        09
        lr c2 == 100 08
            zt wx_do_sd 01 line ht i ht 2, len hz i hz 2 02
            zz 0
        09
        lr c2 == 116 08
            zt wx_do_cmp 01 line ht i ht 2, len hz i hz 2, 3 02
            zz 0
        09
    09
    lr c1 == 109 08
        lr c2 == 106 08
            zt wx_do_mj 01 line ht i ht 2, len hz i hz 2 02
            zz 0
        09
        lr c2 == 109 08
            zt wx_do_math_assign 01 line ht i ht 2, len hz i hz 2, 0 02
            zz 0
        09
        lr c2 == 115 08
            zt wx_do_math_assign 01 line ht i ht 2, len hz i hz 2, 1 02
            zz 0
        09
        lr c2 == 100 08
            zt wx_do_math_assign 01 line ht i ht 2, len hz i hz 2, 2 02
            zz 0
        09
        lr c2 == 116 08
            zt wx_do_mod_assign 01 line ht i ht 2, len hz i hz 2 02
            zz 0
        09
    09
    lr c1 == 100 08
        lr c2 == 106 08
            zt wx_do_dj 01 line ht i ht 2, len hz i hz 2 02
            zz 0
        09
        lr c2 == 109 08
            zt wx_do_dm 01 line ht i ht 2, len hz i hz 2 02
            zz 0
        09
        lr c2 == 115 08
            zt wx_do_ds 01 line ht i ht 2, len hz i hz 2 02
            zz 0
        09
        lr c2 == 100 08
            zt wx_do_dd 01 line ht i ht 2, len hz i hz 2 02
            zz 0
        09
        lr c2 == 116 08
            zt wx_do_dt 01 line ht i ht 2, len hz i hz 2 02
            zz 0
        09
    09
    lr c1 == 67 08
        lr c2 == 100 08
            zt wx_do_Cd 01 line ht i ht 2, len hz i hz 2 02
            zz 0
        09
    09
    lr c1 == 102 08
        lr c2 == 102 08
            zt wx_do_ff 01 line ht i ht 2, len hz i hz 2 02
            zz 0
        09
        lr c2 == 116 08
            zt wx_do_ft 01 line ht i ht 2, len hz i hz 2 02
            zz 0
        09
    09
    lr c1 == 68 08
        lr c2 == 100 08
            zt wx_do_Dd 01 line ht i ht 2, len hz i hz 2 02
            zz 0
        09
    09
    lr c1 == 81 08
        lr c2 == 106 08
            zt wx_do_Qj 01 line ht i ht 2, len hz i hz 2 02
            zz 0
        09
        lr c2 == 109 08
            zt wx_do_Qm 01 line ht i ht 2, len hz i hz 2 02
            zz 0
        09
        lr c2 == 115 08
            zt wx_do_Qs 01 line ht i ht 2, len hz i hz 2 02
            zz 0
        09
    09
    zz 0
09

tt wx_do_jj 01 arg, alen 02 -> u32 08
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    lr i >= alen 08 zz 0 09
    tz first fn_get_byte 01 arg ht i 02
    lr first == 34 08
        tz i i ht 1
        ll 08
            lz i alen 08 ls 09
            tz ch fn_get_byte 01 arg ht i 02
            lr ch == 34 08 ls 09
            zt _rt_putc 01 ch 02
            tz i i ht 1
        09
        zt _rt_putc 01 10 02
        zz 0
    09
    tz val wx_eval 01 arg ht i, alen hz i 02
    zt _rt_puti 01 val 02
    zt _rt_putc 01 10 02
    zz 0
09

tt wx_do_jm 01 arg, alen 02 -> u32 08
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    lr i >= alen 08 zz 0 09
    tz first fn_get_byte 01 arg ht i 02
    lr first == 34 08
        tz i i ht 1
        ll 08
            lz i alen 08 ls 09
            tz ch fn_get_byte 01 arg ht i 02
            lr ch == 34 08 ls 09
            zt _rt_putc 01 ch 02
            tz i i ht 1
        09
        zz 0
    09
    tz val wx_eval 01 arg ht i, alen hz i 02
    zt _rt_puti 01 val 02
    zz 0
09

tt wx_do_jd 01 arg, alen 02 -> u32 08
    zz 0
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 tz i i ht 1 09
        lr ch > 32 08 ls 09
    09
    tz pstart i
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 ls 09
        tz i i ht 1
    09
    tz plen i hz pstart
    tz val zt wx_eval 01 arg ht pstart, plen 02
    zt _rt_putc 01 val 02
    zz 0
09

tt wx_do_tj 01 arg, alen 02 -> u32 08
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    tz name_start i
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 ls 09
        lr ch == 61 08 ls 09
        tz i i ht 1
    09
    tz name_len i hz name_start
    tz val 0
    lr i < alen 08
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 61 08
            tz i i ht 1
            tz val wx_eval 01 arg ht i, alen hz i 02
        09
        lr ch == 32 08
            tz i i ht 1
            tz val wx_eval 01 arg ht i, alen hz i 02
        09
    09
    zt wx_set_var 01 arg ht name_start, name_len, val 02
    zz 0
09

tt wx_do_tm 01 arg, alen 02 -> u32 08
    zz 0
    zt wx_do_tj 01 arg, alen 02
    zz 0
09

tt wx_do_shell 01 arg, alen 02 -> u32 08
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    tz cmd_start i
    tz ci 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 34 08
            tz i i ht 1
            ll 08
                lz i alen 08 ls 09
                tz ch2 fn_get_byte 01 arg ht i 02
                lr ch2 == 34 08 ls 09
                fn_set_byte 01 cmd_buf ht ci, ch2 02
                tz ci ci ht 1
                tz i i ht 1
            09
            ls
        09
        fn_set_byte 01 cmd_buf ht ci, ch 02
        tz ci ci ht 1
        tz i i ht 1
    09
    fn_set_byte 01 cmd_buf ht ci, 0 02
    zt fn_system 01 cmd_buf 02
    zz 0
09

tt wx_do_jr 01 arg, alen 02 -> u32 08
    zz 0
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    tz vstart i
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 ls 09
        tz i i ht 1
    09
    tz vlen i hz vstart
    tz buf zt fn_read_stdin 01 02
    tz result 0
    tz neg 0
    tz pi 0
    ll 08
        tz ch fn_get_byte 01 buf ht pi 02
        lr ch == 0 08 ls 09
        lr ch == 10 08 ls 09
        lr ch == 45 08 tz neg 1 09
        lr ch >= 48 08
            lr ch <= 57 08
                tz digit ch hz 48
                tz result result hh 10
                tz result result ht digit
            09
        09
        tz pi pi ht 1
    09
    lr neg == 1 08 tz result 0 hz result 09
    zt wx_set_var 01 arg ht vstart, vlen, result 02
    zz 0
09

tt wx_do_sd 01 arg, alen 02 -> u32 08
    zz 0
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    tz rstart i
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 ls 09
        tz i i ht 1
    09
    tz rlen i hz rstart
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    tz astart i
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 ls 09
        tz i i ht 1
    09
    tz alen2 i hz astart
    tz a zt wx_eval 01 arg ht astart, alen2 02
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    tz b zt wx_eval 01 arg ht i, alen hz i 02
    tz result 0
    lr a < b 08 tz result 1 09
    zt wx_set_var 01 arg ht rstart, rlen, result 02
    zz 0
09

tt wx_do_cmp 01 arg, alen, mode 02 -> u32 08
    zz 0
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    tz rstart i
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 ls 09
        tz i i ht 1
    09
    tz rlen i hz rstart
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    tz astart i
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 ls 09
        tz i i ht 1
    09
    tz alen2 i hz astart
    tz a zt wx_eval 01 arg ht astart, alen2 02
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    tz b zt wx_eval 01 arg ht i, alen hz i 02
    tz result 0
    lr mode == 0 08 lr a == b 08 tz result 1 09 09
    lr mode == 1 08 lr a != b 08 tz result 1 09 09
    lr mode == 2 08 lr a > b 08 tz result 1 09 09
    lr mode == 3 08 lr a >= b 08 tz result 1 09 09
    zt wx_set_var 01 arg ht rstart, rlen, result 02
    zz 0
09

tt wx_do_mj 01 arg, alen 02 -> u32 08
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 tz i i ht 1 09
        lr ch > 32 08 ls 09
    09
    tz vstart i
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 ls 09
        tz i i ht 1
    09
    tz vlen i hz vstart
    tz old zt wx_find_var 01 arg ht vstart, vlen 02
    tz val zt wx_eval 01 arg ht i, alen hz i 02
    zt wx_set_var 01 arg ht vstart, vlen, old ht val 02
    zz 0
09

tt wx_do_math_assign 01 arg, alen, mode 02 -> u32 08
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 tz i i ht 1 09
        lr ch > 32 08 ls 09
    09
    tz vstart i
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 ls 09
        tz i i ht 1
    09
    tz vlen i hz vstart
    tz old zt wx_find_var 01 arg ht vstart, vlen 02
    tz val zt wx_eval 01 arg ht i, alen hz i 02
    tz newval old
    lr mode == 0 08 tz newval old hz val 09
    lr mode == 1 08 tz newval old hh val 09
    lr mode == 2 08 tz newval old hl val 09
    zt wx_set_var 01 arg ht vstart, vlen, newval 02
    zz 0
09

tt wx_do_mod_assign 01 arg, alen 02 -> u32 08
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 tz i i ht 1 09
        lr ch > 32 08 ls 09
    09
    tz vstart i
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 ls 09
        tz i i ht 1
    09
    tz vlen i hz vstart
    tz old zt wx_find_var 01 arg ht vstart, vlen 02
    tz val zt wx_eval 01 arg ht i, alen hz i 02
    tz newval old
    lr val != 0 08 tz newval zt fn_mod 01 old, val 02 09
    zt wx_set_var 01 arg ht vstart, vlen, newval 02
    zz 0
09
tt wx_do_Cd 01 arg, alen 02 -> u32 08
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 tz i i ht 1 09
        lr ch > 32 08 ls 09
    09
    tz vstart i
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 ls 09
        tz i i ht 1
    09
    tz vlen i hz vstart
    tz old zt wx_find_var 01 arg ht vstart, vlen 02
    tz inc zt wx_eval 01 arg ht i, alen hz i 02
    zt wx_set_var 01 arg ht vstart, vlen, old ht inc 02
    zz 0
09

tt wx_do_rf 01 arg, alen 02 -> u32 08
    zz 0
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    tz fstart i
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 ls 09
        tz i i ht 1
    09
    tz flen i hz fstart
    tz j 0
    ll 08
        lz j flen 08 ls 09
        tz ch fn_get_byte 01 arg ht fstart ht j 02
        fn_set_byte 01 cmd_buf ht j, ch 02
        tz j j ht 1
    09
    fn_set_byte 01 cmd_buf ht j, 0 02
    tz src zt fn_read_file 01 cmd_buf 02
    tz pos 0
    ll 08
        tz ch fn_get_byte 01 src ht pos 02
        lr ch == 0 08 ls 09
        zt _rt_putc 01 ch 02
        tz pos pos ht 1
    09
    zz 0
09

tt wx_do_wf 01 arg, alen 02 -> u32 08
    zz 0
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    tz fstart i
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 ls 09
        tz i i ht 1
    09
    tz flen i hz fstart
    tz j 0
    ll 08
        lz j flen 08 ls 09
        tz ch fn_get_byte 01 arg ht fstart ht j 02
        fn_set_byte 01 cmd_buf ht j, ch 02
        tz j j ht 1
    09
    fn_set_byte 01 cmd_buf ht j, 0 02
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    tz cstart i
    tz clen alen hz i
    tz k 0
    ll 08
        lz k clen 08 ls 09
        tz ch fn_get_byte 01 arg ht cstart ht k 02
        fn_set_byte 01 cmd_buf ht 256 ht k, ch 02
        tz k k ht 1
    09
    fn_set_byte 01 cmd_buf ht 256 ht k, 0 02
    zt fn_write_file 01 cmd_buf, cmd_buf ht 256 02
    zz 0
09

tt wx_do_Qj 01 arg, alen 02 -> u32 08
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    tz code zt wx_eval 01 arg ht i, alen hz i 02
    zt _rt_exit 01 code 02
    zz 0
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 tz i i ht 1 09
        lr ch > 32 08 ls 09
    09
    tz ustart i
    tz ulen alen hz i
    tz ci 0
    fn_set_byte 01 cmd_buf ht ci, 99 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 117 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 114 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 108 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 32 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 45 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 115 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 32 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 45 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 109 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 32 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 49 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 48 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 32 02
    tz ci ci ht 1
    tz j 0
    ll 08
        lz j ulen 08 ls 09
        tz ch fn_get_byte 01 arg ht ustart ht j 02
        fn_set_byte 01 cmd_buf ht ci, ch 02
        tz ci ci ht 1
        tz j j ht 1
    09
    fn_set_byte 01 cmd_buf ht ci, 32 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 62 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 32 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 47 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 116 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 109 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 112 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 47 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 119 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 120 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 95 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 110 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 101 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 116 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 46 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 116 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 109 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 112 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 0 02
    zt fn_system 01 cmd_buf 02
    tz src zt fn_read_file 01 03/tmp/wx_net.tmp04 02
    tz pos 0
    ll 08
        tz ch fn_get_byte 01 src ht pos 02
        lr ch == 0 08 ls 09
        zt _rt_putc 01 ch 02
        tz pos pos ht 1
    09
    zz 0
09

tt wx_do_Qm 01 arg, alen 02 -> u32 08
    zz 0
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 tz i i ht 1 09
        lr ch > 32 08 ls 09
    09
    tz ustart i
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 ls 09
        tz i i ht 1
    09
    tz ulen i hz ustart
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 tz i i ht 1 09
        lr ch > 32 08 ls 09
    09
    tz fstart i
    tz flen alen hz i
    tz ci 0
    fn_set_byte 01 cmd_buf ht ci, 99 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 117 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 114 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 108 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 32 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 45 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 115 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 32 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 45 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 109 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 32 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 49 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 48 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 32 02
    tz ci ci ht 1
    tz j 0
    ll 08
        lz j ulen 08 ls 09
        tz ch fn_get_byte 01 arg ht ustart ht j 02
        fn_set_byte 01 cmd_buf ht ci, ch 02
        tz ci ci ht 1
        tz j j ht 1
    09
    fn_set_byte 01 cmd_buf ht ci, 32 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 45 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 111 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 32 02
    tz ci ci ht 1
    tz k 0
    ll 08
        lz k flen 08 ls 09
        tz ch fn_get_byte 01 arg ht fstart ht k 02
        fn_set_byte 01 cmd_buf ht ci, ch 02
        tz ci ci ht 1
        tz k k ht 1
    09
    fn_set_byte 01 cmd_buf ht ci, 0 02
    zt fn_system 01 cmd_buf 02
    zt _rt_puts 01 03download ok04 02
    zz 0
09

tt wx_do_Qs 01 arg, alen 02 -> u32 08
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 tz i i ht 1 09
        lr ch > 32 08 ls 09
    09
    tz ustart i
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 ls 09
        tz i i ht 1
    09
    tz ulen i hz ustart
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 tz i i ht 1 09
        lr ch > 32 08 ls 09
    09
    tz dstart i
    tz dlen alen hz i
    tz ci 0
    fn_set_byte 01 cmd_buf ht ci, 99 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 117 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 114 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 108 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 32 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 45 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 109 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 32 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 49 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 48 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 32 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 45 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 100 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 32 02
    tz ci ci ht 1
    tz j 0
    ll 08
        lz j dlen 08 ls 09
        tz ch fn_get_byte 01 arg ht dstart ht j 02
        fn_set_byte 01 cmd_buf ht ci, ch 02
        tz ci ci ht 1
        tz j j ht 1
    09
    fn_set_byte 01 cmd_buf ht ci, 32 02
    tz ci ci ht 1
    tz k 0
    ll 08
        lz k ulen 08 ls 09
        tz ch fn_get_byte 01 arg ht ustart ht k 02
        fn_set_byte 01 cmd_buf ht ci, ch 02
        tz ci ci ht 1
        tz k k ht 1
    09
    fn_set_byte 01 cmd_buf ht ci, 32 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 62 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 32 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 47 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 116 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 109 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 112 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 47 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 119 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 120 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 95 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 112 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 111 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 115 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 116 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 46 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 116 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 109 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 112 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 0 02
    zt fn_system 01 cmd_buf 02
    tz src zt fn_read_file 01 03/tmp/wx_post.tmp04 02
    tz pos 0
    ll 08
        tz ch fn_get_byte 01 src ht pos 02
        lr ch == 0 08 ls 09
        zt _rt_putc 01 ch 02
        tz pos pos ht 1
    09
    zz 0
09

tt wx_do_Dd 01 arg, alen 02 -> u32 08
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    tz ms zt wx_eval 01 arg ht i, alen hz i 02
    zt _rt_sleep 01 ms 02
    zz 0
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 tz i i ht 1 09
        lr ch > 32 08 ls 09
    09
    tz ms zt wx_eval 01 arg ht i, alen hz i 02
    tz counter 0
    tz loops ms hh 100000
    ll 08
        lz counter loops 08 ls 09
        tz counter counter ht 1
    09
    zz 0
09

tt wx_do_dt 01 arg, alen 02 -> u32 08
    zz 0
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 tz i i ht 1 09
        lr ch > 32 08 ls 09
    09
    tz vstart i
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 ls 09
        tz i i ht 1
    09
    tz vlen i hz vstart
    zt wx_set_var 01 arg ht vstart, vlen, 0 02
    zz 0
09

tt wx_do_dj 01 arg, alen 02 -> u32 08
    zz 0
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 tz i i ht 1 09
        lr ch > 32 08 ls 09
    09
    tz vstart i
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 ls 09
        tz i i ht 1
    09
    tz vlen i hz vstart
    tz old zt wx_find_var 01 arg ht vstart, vlen 02
    tz newval old hz 1
    zt wx_set_var 01 arg ht vstart, vlen, newval 02
    zz 0
09
tt wx_find_arr 01 name, nlen 02 -> u32 08
    tz i 0
    ll 08
        lz i g_arr_count 08 ls 09
        tz match 1
        tz j 0
        tz off i hh 32
        ll 08
            lz j nlen 08 ls 09
            tz c1 fn_get_byte 01 name ht j 02
            tz c2 fn_get_byte 01 g_arr_names ht off ht j 02
            lr c1 != c2 08 tz match 0 09
            tz j j ht 1
        09
        tz endc fn_get_byte 01 g_arr_names ht off ht nlen 02
        lr endc != 0 08 tz match 0 09
        lr match == 1 08
            zz i
        09
        tz i i ht 1
    09
    zz 0 hz 1
09

tt wx_do_dm 01 arg, alen 02 -> u32 08
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 tz i i ht 1 09
        lr ch > 32 08 ls 09
    09
    tz nstart i
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 ls 09
        tz i i ht 1
    09
    tz nlen i hz nstart
    tz sz zt wx_eval 01 arg ht i, alen hz i 02
    tz idx g_arr_count
    tz off idx hh 32
    tz p g_arr_names ht off
    tz j 0
    ll 08
        lz j nlen 08 ls 09
        tz ch fn_get_byte 01 arg ht nstart ht j 02
        fn_set_byte 01 p, ch 02
        tz p p ht 1
        tz j j ht 1
    09
    fn_set_byte 01 p, 0 02
    tz base 0
    lr idx > 0 08
        tz prev idx hz 1
        tz base g_arr_offset[prev]
        tz psz g_arr_size[prev]
        tz base base ht psz
    09
    g_arr_offset[idx] = base
    g_arr_size[idx] = sz
    g_arr_count = g_arr_count ht 1
    zz 0
09

tt wx_do_ds 01 arg, alen 02 -> u32 08
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 tz i i ht 1 09
        lr ch > 32 08 ls 09
    09
    tz nstart i
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 ls 09
        tz i i ht 1
    09
    tz nlen i hz nstart
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 tz i i ht 1 09
        lr ch > 32 08 ls 09
    09
    tz pstart i
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 ls 09
        tz i i ht 1
    09
    tz plen i hz pstart
    tz idx zt wx_eval 01 arg ht pstart, plen 02
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 tz i i ht 1 09
        lr ch > 32 08 ls 09
    09
    tz vstart i
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 ls 09
        tz i i ht 1
    09
    tz vlen i hz vstart
    tz val zt wx_eval 01 arg ht vstart, vlen 02
    tz ai zt wx_find_arr 01 arg ht nstart, nlen 02
    lr ai < 0 08 zz 0 09
    tz base g_arr_offset[ai]
    tz pos base ht idx
    g_arr_vals[pos] = val
    zz 0
09

tt wx_do_dd 01 arg, alen 02 -> u32 08
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    tz val zt wx_eval 01 arg ht i, alen hz i 02
    zt _rt_puti 01 val 02
    zz 0
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 tz i i ht 1 09
        lr ch > 32 08 ls 09
    09
    tz nstart i
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 ls 09
        tz i i ht 1
    09
    tz nlen i hz nstart
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 tz i i ht 1 09
        lr ch > 32 08 ls 09
    09
    tz pstart i
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 ls 09
        tz i i ht 1
    09
    tz plen i hz pstart
    tz idx zt wx_eval 01 arg ht pstart, plen 02
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 tz i i ht 1 09
        lr ch > 32 08 ls 09
    09
    tz rstart i
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 ls 09
        tz i i ht 1
    09
    tz rlen i hz rstart
    tz ai zt wx_find_arr 01 arg ht nstart, nlen 02
    lr ai < 0 08 zz 0 09
    tz base g_arr_offset[ai]
    tz pos base ht idx
    tz val g_arr_vals[pos]
    zt wx_set_var 01 arg ht rstart, rlen, val 02
    zz 0
09

tt wx_find_var 01 name, nlen 02 -> u32 08
    tz i 0
    ll 08
        lz i g_var_count 08 ls 09
        tz match 1
        tz j 0
        tz off i hh 32
        ll 08
            lz j nlen 08 ls 09
            tz c1 fn_get_byte 01 name ht j 02
            tz c2 fn_get_byte 01 g_var_names ht off ht j 02
            lr c1 != c2 08 tz match 0 09
            tz j j ht 1
        09
        tz endc fn_get_byte 01 g_var_names ht off ht nlen 02
        lr endc != 0 08 tz match 0 09
        lr match == 1 08
            zz g_var_vals[i]
        09
        tz i i ht 1
    09
    zz 0
09

tt wx_eval 01 expr, elen 02 -> u32 08
    tz i 0
    tz result 0
    tz cur_num 0
    tz op 43
    tz left 0
    ll 08
        lz i elen 08 ls 09
        tz ch fn_get_byte 01 expr ht i 02
        tz done 0
        tz is_d 0
        lr ch > 47 08
            lr ch < 58 08 tz is_d 1 09
        09
        lr is_d == 1 08
            tz cur_num cur_num hh 10 ht ch hz 48
            tz done 1
        09
        lr done == 0 08
            lr ch == 104 08
                tz ni i ht 1
                lr ni < elen 08
                    tz nc fn_get_byte 01 expr ht ni 02
                    tz is_wx 0
                    lr nc == 116 08 tz is_wx 1 09
                    lr nc == 122 08 tz is_wx 1 09
                    lr nc == 104 08 tz is_wx 1 09
                    lr nc == 108 08 tz is_wx 1 09
                    lr nc == 109 08 tz is_wx 1 09
                    lr is_wx == 1 08
                        lr op == 43 08 tz result result ht cur_num 09
                        lr op == 45 08 tz result result hz cur_num 09
                        lr op == 42 08 tz result result hh cur_num 09
                        lr op == 47 08
                            lr cur_num != 0 08 tz result result hl cur_num 09
                        09
                        lr op == 37 08
                            lr cur_num != 0 08 tz result zt fn_mod 01 result, cur_num 02 09
                        09
                        lr nc == 116 08 tz op 43 09
                        lr nc == 122 08 tz op 45 09
                        lr nc == 104 08 tz op 42 09
                        lr nc == 108 08 tz op 47 09
                        lr nc == 109 08 tz op 37 09
                        tz cur_num 0
                        tz i i ht 1
                        tz done 1
                    09
                09
            09
        09
        lr done == 0 08
            tz is_var 0
            lr ch > 96 08
                lr ch < 123 08 tz is_var 1 09
            09
            lr ch > 64 08
                lr ch < 91 08 tz is_var 1 09
            09
            lr is_var == 1 08
                tz vs i
                ll 08
                    lz i elen 08 ls 09
                    tz vc fn_get_byte 01 expr ht i 02
                    tz va 0
                    lr vc > 47 08
                        lr vc < 58 08 tz va 1 09
                    09
                    lr vc > 96 08
                        lr vc < 123 08 tz va 1 09
                    09
                    lr vc > 64 08
                        lr vc < 91 08 tz va 1 09
                    09
                    lr va == 0 08 ls 09
                    tz i i ht 1
                09
                tz vl i hz vs
                tz cur_num wx_find_var 01 expr ht vs, vl 02
                tz i i hz 1
                tz done 1
            09
        09
        lr done == 0 08
            lr ch != 32 08
                lr ch == 61 08
                    tz ni i ht 1
                    lr ni < elen 08
                        tz nc fn_get_byte 01 expr ht ni 02
                        lr nc == 61 08 tz i i ht 1 09
                    09
                09
                lr op == 43 08 tz result result ht cur_num 09
                lr op == 45 08 tz result result hz cur_num 09
                lr op == 42 08 tz result result hh cur_num 09
                lr op == 47 08
                    lr cur_num != 0 08 tz result result hl cur_num 09
                09
                lr op == 37 08
                    lr cur_num != 0 08 tz result zt fn_mod 01 result, cur_num 02 09
                09
                lr op == 60 08
                    tz left result
                    tz result 0
                    lr left < cur_num 08 tz result 1 09
                09
                lr op == 62 08
                    tz left result
                    tz result 0
                    lr left > cur_num 08 tz result 1 09
                09
                lr op == 61 08
                    tz left result
                    tz result 0
                    lr left == cur_num 08 tz result 1 09
                09
                lr op == 44 08
                    tz left result
                    tz result 0
                    lr left <= cur_num 08 tz result 1 09
                09
                lr op == 46 08
                    tz left result
                    tz result 0
                    lr left >= cur_num 08 tz result 1 09
                09
                tz op ch
                lr ch == 60 08
                    tz ni i ht 1
                    lr ni < elen 08
                        tz nc fn_get_byte 01 expr ht ni 02
                        lr nc == 61 08 tz op 44 09
                        lr nc == 61 08 tz i i ht 1 09
                    09
                09
                lr ch == 62 08
                    tz ni i ht 1
                    lr ni < elen 08
                        tz nc fn_get_byte 01 expr ht ni 02
                        lr nc == 61 08 tz op 46 09
                        lr nc == 61 08 tz i i ht 1 09
                    09
                09
                tz cur_num 0
            09
        09
        tz i i ht 1
    09
    lr op == 43 08 tz result result ht cur_num 09
    lr op == 45 08 tz result result hz cur_num 09
    lr op == 42 08 tz result result hh cur_num 09
    lr op == 47 08
        lr cur_num != 0 08 tz result result hl cur_num 09
    09
    lr op == 37 08
        lr cur_num != 0 08 tz result zt fn_mod 01 result, cur_num 02 09
    09
    lr op == 60 08
        tz left result
        tz result 0
        lr left < cur_num 08 tz result 1 09
    09
    lr op == 62 08
        tz left result
        tz result 0
        lr left > cur_num 08 tz result 1 09
    09
    lr op == 61 08
        tz left result
        tz result 0
        lr left == cur_num 08 tz result 1 09
    09
    lr op == 44 08
        tz left result
        tz result 0
        lr left <= cur_num 08 tz result 1 09
    09
    lr op == 46 08
        tz left result
        tz result 0
        lr left >= cur_num 08 tz result 1 09
    09
    zz result
09

tt wx_set_var 01 name, nlen, val 02 -> u32 08
    tz i 0
    ll 08
        lz i g_var_count 08 ls 09
        tz match 1
        tz j 0
        tz off i hh 32
        ll 08
            lz j nlen 08 ls 09
            tz c1 fn_get_byte 01 name ht j 02
            tz c2 fn_get_byte 01 g_var_names ht off ht j 02
            lr c1 != c2 08 tz match 0 09
            tz j j ht 1
        09
        tz endc fn_get_byte 01 g_var_names ht off ht nlen 02
        lr endc != 0 08 tz match 0 09
        lr match == 1 08
            g_var_vals[i] = val
            zz 0
        09
        tz i i ht 1
    09
    tz idx g_var_count
    tz offset idx hh 32
    tz p g_var_names ht offset
    tz j 0
    ll 08
        lz j nlen 08 ls 09
        tz ch fn_get_byte 01 name ht j 02
        fn_set_byte 01 p, ch 02
        tz p p ht 1
        tz j j ht 1
    09
    fn_set_byte 01 p, 0 02
    g_var_vals[idx] = val
    g_var_count = g_var_count ht 1
    zz 0
09

tt wx_do_ff 01 arg, alen 02 -> u32 08
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 tz i i ht 1 09
        lr ch > 32 08 ls 09
    09
    tz nstart i
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 ls 09
        tz i i ht 1
    09
    tz nlen i hz nstart
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 tz i i ht 1 09
        lr ch > 32 08 ls 09
    09
    tz pstart i
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch <= 32 08 ls 09
        tz i i ht 1
    09
    tz plen i hz pstart
    tz idx zt wx_eval 01 arg ht pstart, plen 02
    tz ai zt wx_find_arr 01 arg ht nstart, nlen 02
    lr ai < 0 08 zz 0 09
    tz base g_arr_offset[ai]
    tz pos base ht idx
    tz val g_arr_vals[pos]
    zt _rt_puti 01 val 02
    zz 0
09

tt wx_do_ft 01 arg, alen 02 -> u32 08
    tz ch zt _rt_getc 01 02
    zt _rt_putc 01 ch 02
    zz 0
09
