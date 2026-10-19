tf g_var_names[2048]
tf g_var_vals[64]
tf g_line_offsets[1024]
tf g_loop_stack[64]
tf g_if_stack[64]
tf g_func_names[512]
tf g_func_start[32]
tf g_func_params[32]
tf cmd_buf[512]
tf g_safe[4096]
tz g_var_count
tz g_line_count
tz g_ip
tz g_next_ip
tz g_running
tz g_ret_val
tz g_if_target
tz g_func_count
tz g_src

tt 主 01 path 02 -> u32 08
 g_var_count = 0
 g_line_count = 0
 g_ip = 0
 g_next_ip = 0
 g_running = 1
 g_safe[4000] = 0
 g_if_target = 0
 g_func_count = 0
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
        zt _rt_puts 01 03用法: wuxing 脚本.wx04 02
        zz 1
    09
    zt wx_build_lines 01 src 02
    tz g_next_ip 0
    ll 08
        lr g_running == 0 08 ls 09
        tz cur_ip g_next_ip
        lz cur_ip g_line_count 08 ls 09
        tz off g_line_offsets[cur_ip]
        tz next_off g_line_offsets[cur_ip ht 1]
        lr next_off == 0 08
            ls
        09
        tz llen next_off hz off
        tz g_safe[4003] cur_ip ht 1
        lr llen > 0 08
            zt wx_exec_line 01 src ht off, llen, cur_ip 02
        09
        tz cur_ip g_safe[4003]
        tz g_next_ip cur_ip
    09
    zz 0
09

tt wx_build_lines 01 src 02 -> u32 08
    tz i 0
    tz line_count 1
    tz idx0 0
    tz val0 0
    g_line_offsets[idx0] = val0
    ll 08
        lz i 4096 08 ls 09
        tz ch fn_get_byte 01 src ht i 02
        lr ch == 0 08 ls 09
        lr ch == 10 08
            tz idx line_count
            tz val i ht 1
            g_line_offsets[idx] = val
            tz line_count line_count ht 1
        09
        tz i i ht 1
    09
    g_line_offsets[line_count] = i
    lr i == 0 08
        tz line_count 0
    09
    g_line_count = line_count
    zz 0
09

tt wx_exec_line 01 line, len, cip 02 -> u32 08
    g_safe[4003] = cip ht 1
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
    tz c2 fn_get_byte 01 line ht i ht 1 02
    lr c1 == 35 08 zz 0 09
    lr c1 == 106 08
        lr c2 == 106 08 zt wx_do_jj 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 109 08 zt wx_do_jm 01 line ht i ht 2, len hz i hz 2 02 09
    zz 0
    09
    lr c1 == 116 08
        lr c2 == 106 08 zt wx_do_tj 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 109 08 zt wx_do_tm 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 115 08 zt wx_do_ts 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 100 08 zt wx_do_td 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 116 08 zt wx_do_tt 01 02 09
    zz 0
    09
    lr c1 == 109 08
        lr c2 == 106 08 zt wx_do_mj 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 109 08 zt wx_do_mm 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 115 08 zt wx_do_ms 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 100 08 zt wx_do_md 01 line ht i ht 2, len hz i hz 2 02 09
    zz 0
    09
    lr c1 == 115 08
        lr c2 == 104 08 zt wx_do_sh 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 106 08 zt wx_do_sj 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 109 08 zt wx_do_sm 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 115 08 zt wx_do_ss 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 100 08 zt wx_do_sd 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 116 08 zt wx_do_st 01 line ht i ht 2, len hz i hz 2 02 09
    zz 0
    09
    lr c1 == 100 08
        lr c2 == 106 08 zt wx_do_dj 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 109 08 zt wx_do_dm 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 115 08 zt wx_do_ds 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 100 08 zt wx_do_dd 01 line ht i ht 2, len hz i hz 2 02 09
    zz 0
    09
    lr c1 == 67 08
        lr c2 == 106 08 zt wx_do_Cj 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 109 08
            tz carg line ht i ht 2
            tz calen len hz i hz 2
            tz cip cip
            zt wx_do_Cm 01 carg, calen, cip 02
    zz 0
        09
        lr c2 == 115 08 zt wx_do_Cs 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 100 08 zt wx_do_Cd 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 116 08 zt wx_do_Ct 01 02 09
    zz 0
    09
    lr c1 == 88 08
        lr c2 == 106 08 zt wx_do_Xj 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 109 08 zt wx_do_Xm 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 115 08 zt wx_do_Xs 01 02 09
        lr c2 == 116 08 zt wx_do_Xt 01 02 09
    zz 0
    09
    lr c1 == 68 08
        lr c2 == 106 08 zt wx_do_Dj 01 02 09
        lr c2 == 109 08 zt wx_do_Dm 01 02 09
        lr c2 == 115 08 zt wx_do_Ds 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 100 08 zt wx_do_Dd 01 line ht i ht 2, len hz i hz 2 02 09
    zz 0
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
        zz 0
    09
    tz val wx_eval 01 arg ht i, alen hz i 02
    zt _rt_puti 01 val 02
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
    tz vstart i
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 ls 09
        tz i i ht 1
    09
    tz vlen i hz vstart
    tz buf 0
    tz val wx_eval 01 arg ht i, alen hz i 02
    zt _rt_puti 01 val 02
    zt wx_set_var 01 arg ht vstart, vlen, 0 02
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
    zt wx_do_tj 01 arg, alen 02
    zz 0
09

tt wx_do_tt 01 02 -> u32 08
    tz g_next_ip g_safe[4000]
    zz 0
09

tt wx_do_mj 01 arg, alen 02 -> u32 08
    zt wx_do_math_op 01 arg, alen, 43 02
    zz 0
09

tt wx_do_mm 01 arg, alen 02 -> u32 08
    zt wx_do_math_op 01 arg, alen, 45 02
    zz 0
09

tt wx_do_ms 01 arg, alen 02 -> u32 08
    zt wx_do_math_op 01 arg, alen, 42 02
    zz 0
09

tt wx_do_md 01 arg, alen 02 -> u32 08
    zt wx_do_math_op 01 arg, alen, 47 02
    zz 0
09

tt wx_do_math_op 01 arg, alen, op 02 -> u32 08
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
        tz i i ht 1
    09
    tz name_len i hz name_start
    tz old wx_find_var 01 arg ht name_start, name_len 02
    tz val wx_eval 01 arg ht i, alen hz i 02
    tz result old
    lr op == 43 08 tz result old ht val 09
    lr op == 45 08 tz result old hz val 09
    lr op == 42 08 tz result old hh val 09
    lr op == 47 08
        lr val != 0 08 tz result old hl val 09
    09
    zt wx_set_var 01 arg ht name_start, name_len, result 02
    zz 0
09

tt wx_do_sh 01 arg, alen 02 -> u32 08
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
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

tt wx_do_sj 01 arg, alen 02 -> u32 08
    zt wx_do_cmp 01 arg, alen, 1 02
    zz 0
09

tt wx_do_sm 01 arg, alen 02 -> u32 08
    zt wx_do_cmp 01 arg, alen, 2 02
    zz 0
09

tt wx_do_ss 01 arg, alen 02 -> u32 08
    zt wx_do_cmp 01 arg, alen, 3 02
    zz 0
09

tt wx_do_sd 01 arg, alen 02 -> u32 08
    zt wx_do_cmp 01 arg, alen, 4 02
    zz 0
09

tt wx_do_st 01 arg, alen 02 -> u32 08
    zt wx_do_cmp 01 arg, alen, 5 02
    zz 0
09

tt wx_do_cmp 01 arg, alen, mode 02 -> u32 08
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
    tz a wx_eval 01 arg ht astart, alen2 02
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    tz b wx_eval 01 arg ht i, alen hz i 02
    tz result 0
    lr mode == 1 08 lr a == b 08 tz result 1 09 09
    lr mode == 2 08 lr a != b 08 tz result 1 09 09
    lr mode == 3 08 lr a > b 08 tz result 1 09 09
    lr mode == 4 08 lr a < b 08 tz result 1 09 09
    lr mode == 5 08 lr a >= b 08 tz result 1 09 09
    zt wx_set_var 01 arg ht rstart, rlen, result 02
    zz 0
09

tt wx_do_ds 01 arg, alen 02 -> u32 08
    tz cond wx_eval 01 arg, alen 02
    lr cond == 0 08
        tz end zt wx_find_end 01 g_ip 02
        tz g_next_ip end
    09
    lr cond != 0 08
        g_loop_stack[g_safe[4000]] = g_ip
    09
    zz 0
09

tt wx_do_dd 01 arg, alen 02 -> u32 08
    tz cond wx_eval 01 arg, alen 02
    lr cond == 0 08
        tz g_ip g_ip ht 1
    09
    zz 0
09

tt wx_do_Cj 01 arg, alen 02 -> u32 08
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
        lr ch == 32 08 ls 09
        tz i i ht 1
    09
    tz vlen i hz vstart
    tz start_val wx_eval 01 arg ht i, alen hz i 02
    zt wx_set_var 01 arg ht vstart, vlen, start_val 02
    zz 0
09

tt wx_do_Cm 01 arg, alen, cip 02 -> u32 08
    g_safe[4000] = cip
    tz cond wx_eval 01 arg, alen 02
    lr cond == 0 08
        tz end zt wx_find_end 01 cip 02
        g_next_ip = end
    09
    zz 0
09

tt wx_do_Cs 01 arg, alen 02 -> u32 08
    zz 0
09

tt wx_do_Cd 01 arg, alen 02 -> u32 08
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
        lr ch == 32 08 ls 09
        tz i i ht 1
    09
    tz vlen i hz vstart
    tz inc wx_eval 01 arg ht i, alen hz i 02
    tz old wx_find_var 01 arg ht vstart, vlen 02
    zt wx_set_var 01 arg ht vstart, vlen, old ht inc 02
    zz 0
09

tt wx_do_Ct 01 02 -> u32 08
    g_next_ip = g_safe[4000]
    zz 0
09

tt wx_do_Xj 01 arg, alen 02 -> u32 08
    tz cond wx_eval 01 arg, alen 02
    g_if_stack[g_if_target] = g_ip
    tz g_if_target g_if_target ht 1
    lr cond == 0 08
        tz end zt wx_find_end 01 g_ip 02
        tz g_next_ip end
    09
    zz 0
09

tt wx_do_Xm 01 arg, alen 02 -> u32 08
    tz cond wx_eval 01 arg, alen 02
    lr cond == 0 08
        tz end zt wx_find_end 01 g_ip 02
        tz g_next_ip end
    09
    zz 0
09

tt wx_do_Xs 01 02 -> u32 08
    zz 0
09

tt wx_do_Xt 01 02 -> u32 08
    tz skip 0
    lr g_if_target == 0 08 tz skip 1 09
    lr skip == 0 08
        tz g_if_target g_if_target hz 1
    09
    zz 0
09

tt wx_do_Dj 01 02 -> u32 08
    lr g_safe[4000] > 0 08
        tz end zt wx_find_end 01 g_loop_stack[g_safe[4000]] 02
        tz g_next_ip end
    09
    zz 0
09

tt wx_do_Dm 01 02 -> u32 08
    zz 0
09

tt wx_do_Ds 01 arg, alen 02 -> u32 08
    tz code wx_eval 01 arg, alen 02
    g_running = 0
    zz 0
09

tt wx_do_Dd 01 arg, alen 02 -> u32 08
    tz val wx_eval 01 arg, alen 02
    g_ret_val = val
    g_running = 0
    zz 0
09

tt wx_do_ts 01 arg, alen 02 -> u32 08
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    tz nstart i
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 ls 09
        lr ch == 40 08 ls 09
        tz i i ht 1
    09
    tz nlen i hz nstart
    tz idx g_func_count
    tz off idx hh 16
    tz j 0
    ll 08
        lz j nlen 08 ls 09
        tz ch fn_get_byte 01 arg ht nstart ht j 02
        fn_set_byte 01 g_func_names ht off ht j, ch 02
        tz j j ht 1
    09
    fn_set_byte 01 g_func_names ht off ht nlen, 0 02
    g_func_start[idx] = g_ip
    g_func_count = g_func_count ht 1
    tz end zt wx_find_end 01 g_ip 02
    tz g_next_ip end
    zz 0
09

tt wx_do_td 01 arg, alen 02 -> u32 08
    zt wx_do_tj 01 arg, alen 02
    zz 0
09

tt wx_do_dj 01 arg, alen 02 -> u32 08
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    tz nstart i
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 ls 09
        lr ch == 40 08 ls 09
        tz i i ht 1
    09
    tz nlen i hz nstart
    tz fi 0
    tz found 0
    ll 08
        lz fi g_func_count 08 ls 09
        tz match 1
        tz j 0
        tz off fi hh 16
        ll 08
            lz j nlen 08 ls 09
            tz c1 fn_get_byte 01 arg ht nstart ht j 02
            tz c2 fn_get_byte 01 g_func_names ht off ht j 02
            lr c1 != c2 08 tz match 0 09
            tz j j ht 1
        09
        lr match == 1 08
            tz found 1
            ls
        09
        tz fi fi ht 1
    09
    lr found == 1 08
        tz saved_ip g_ip
        tz saved_loop g_safe[4000]
        tz g_ip g_func_start[fi]
        ll 08
            lr g_running == 0 08 ls 09
            lz g_ip g_line_count 08 ls 09
            tz off2 g_line_offsets[g_ip]
            tz noff g_line_offsets[g_ip ht 1]
            lr noff == 0 08 tz noff 4096 09
            tz llen noff hz off2
            lr llen > 0 08
                zt wx_exec_line 01 g_src ht off2, llen 02
            09
            tz g_ip g_ip ht 1
        09
        tz g_ip saved_ip
        tz g_running 1
    09
    zz 0
09

tt wx_do_dm 01 arg, alen 02 -> u32 08
    tz val wx_eval 01 arg, alen 02
    g_ret_val = val
    g_running = 0
    zz 0
09

tt wx_find_end 01 start 02 -> u32 08
    tz depth 1
    tz ip start ht 1
    ll 08
        lz ip g_line_count 08 ls 09
        tz off g_line_offsets[ip]
        tz noff g_line_offsets[ip ht 1]
        lr noff == 0 08 tz noff 4096 09
        tz llen noff hz off
        tz i 0
        ll 08
            lz i llen 08 ls 09
            tz ch fn_get_byte 01 g_src ht off ht i 02
            lr ch == 32 08 tz i i ht 1 09
            lr ch != 32 08 ls 09
        09
        lr i < llen 08
            tz c1 fn_get_byte 01 g_src ht off ht i 02
            tz c2 fn_get_byte 01 g_src ht off ht i ht 1 02
            lr c1 == 116 08
                lr c2 == 116 08
                    tz depth depth hz 1
                    lr depth == 0 08 zz ip 09
                09
            09
            lr c1 == 100 08
                lr c2 == 115 08 tz depth depth ht 1 09
            09
            lr c1 == 67 08
                lr c2 == 106 08 tz depth depth ht 1 09
            09
            lr c1 == 88 08
                lr c2 == 106 08 tz depth depth ht 1 09
            09
            lr c1 == 116 08
                lr c2 == 115 08 tz depth depth ht 1 09
            09
        09
        tz ip ip ht 1
    09
    zz g_line_count
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
        lr match == 1 08
            zz g_var_vals[i]
        09
        tz i i ht 1
    09
    zz 0
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
        lr match == 1 08
            g_var_vals[i] = val
            zz 0
        09
        tz i i ht 1
    09
    tz idx g_var_count
    tz off idx hh 32
    tz p g_var_names ht off
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

tt wx_eval 01 expr, elen 02 -> u32 08
    tz i 0
    tz result 0
    tz cur_num 0
    tz op 43
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
                lr op == 43 08 tz result result ht cur_num 09
                lr op == 45 08 tz result result hz cur_num 09
                lr op == 42 08 tz result result hh cur_num 09
                lr op == 47 08
                    lr cur_num != 0 08 tz result result hl cur_num 09
                09
                tz op ch
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
    zz result
09

