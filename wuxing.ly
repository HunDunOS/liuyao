00 ============================================================
00 五行(WuXing) 脚本解释器 wuxing.ly
00 版本: v1.0.0 (V12满编对齐)
00 规范版本: V12 终极满编矩阵 45指令
00 核心25: j金 m木 s水 h火 t土  全部实现
00 四季20: C春 X夏 Q秋 D冬      全部分派
00 环境3: win lin hun          主函数检测
00 ============================================================
qj g_var_count
qj g_var_names[2048]
qj g_var_vals[128]
qj g_arr_count
qj g_arr_names[512]
qj g_arr_offset[32]
qj g_arr_size[32]
qj g_arr_data[4096]
qj g_offsets[4096]
qj g_func_count
qj g_if_taken
qj g_func_names[512]
qj g_func_start[32]
qj g_ret_stack[64]
qj g_ret_sp
qj g_func_ret_val
qj g_func_returning
qj g_epos
qj g_eexpr
qj g_elen
qj g_line_count
qj g_src
qj cmd_buf[4096]

tt 主 01 path 02 -> u32 08
    tz plat zt _rt_platform 01 02
    zt wx_set_var 01 03lin04 , 3, 0 02
    zt wx_set_var 01 03win04 , 3, 0 02
    zt wx_set_var 01 03hun04 , 3, 0 02
    lr plat == 1 08 zt wx_set_var 01 03lin04 , 3, 1 02 09
    lr plat == 2 08 zt wx_set_var 01 03win04 , 3, 1 02 09
    lr plat == 3 08 zt wx_set_var 01 03hun04 , 3, 1 02 09
    tz plen 0
    ll 08
        tz ch fn_get_byte 01 path ht plen 02
        lr ch == 0 08 ls 09
        tz plen plen ht 1
    09
    tz c1 fn_get_byte 01 path ht plen hz 3 02
    lr c1 != 46 08
        zt _rt_puts 01 03用法: wx_run 脚本.wx04 02
        zz 1
    09
    tz g_src zt fn_read_file 01 path 02
    tz slen 0
    ll 08
        tz ch fn_get_byte 01 g_src ht slen 02
        lr ch == 0 08 ls 09
        tz slen slen ht 1
    09
    g_line_count = 1
    g_offsets[0] = 0
    tz pos 0
    ll 08
        lz pos slen 08 ls 09
        tz ch fn_get_byte 01 g_src ht pos 02
        lr ch == 10 08
            g_offsets[g_line_count] = pos ht 1
            tz g_line_count g_line_count ht 1
        09
        tz pos pos ht 1
    09
    g_offsets[g_line_count] = slen
    tz g_line_count g_line_count ht 1
    g_var_count = 0
    g_arr_count = 0
    g_func_count = 0
g_if_taken = 0
    tz loop_start 0
    tz while_start 0
    tz cur_loop_type 0
    g_if_taken = 0
    g_ret_sp = 0
    tz fi 0
    ll 08
        lz fi g_line_count 08 ls 09
        tz foff g_offsets[fi]
        tz fc1 0
        lr fi < g_line_count 08 tz fc1 fn_get_byte 01 g_src ht foff 02 09
        lr fc1 == 104 08
            tz fc2 fn_get_byte 01 g_src ht foff ht 1 02
            lr fc2 == 106 08
                tz fci 3
                ll 08
                    lz fci 64 08 ls 09
                    tz fcc fn_get_byte 01 g_src ht foff ht fci 02
                    lr fcc == 32 08 tz fci fci ht 1 09
                    lr fcc != 32 08 ls 09
                09
                tz fname_idx g_func_count hh 16
                tz fni 0
                ll 08
                    lz fni 15 08 ls 09
                    tz fcc fn_get_byte 01 g_src ht foff ht fci ht fni 02
                    lr fcc == 32 08 ls 09
                    lr fcc == 10 08 ls 09
                    lr fcc == 0 08 ls 09
                    tz name_off fname_idx ht fni
                    g_func_names[name_off] = fcc
                    tz fni fni ht 1
                09
                tz name_off fname_idx ht fni
                g_func_names[name_off] = 0
                g_func_start[g_func_count] = fi ht 1
                g_func_count = g_func_count ht 1
            09
        09
        tz fi fi ht 1
    09
    tz cur_ip 0
    ll 08
        lz cur_ip g_line_count 08 ls 09
        tz off g_offsets[cur_ip]
        tz noff g_offsets[cur_ip ht 1]
        ll 08
            lz off noff 08 ls 09
            tz ch fn_get_byte 01 g_src ht off 02
            lr ch == 32 08 tz off off ht 1 09
            lr ch == 9 08 tz off off ht 1 09
            lr ch != 32 08
                lr ch != 9 08 ls 09
            09
        09
        tz llen noff hz off
        lr llen <= 0 08
            tz cur_ip cur_ip ht 1
            zz 0
        09
        tz c1 fn_get_byte 01 g_src ht off 02
        tz c2 0
        lr llen > 1 08 tz c2 fn_get_byte 01 g_src ht off ht 1 02 09
        tz jumped 0
        tz cf_found 0
        tz cf_idx 0
        ll 08
            lz cf_idx g_func_count 08 ls 09
            lr cf_found == 1 08 ls 09
            tz cfmatch 1
            tz cfj 0
            tz cfoff cf_idx hh 16
            ll 08
                lz cfj 16 08 ls 09
                tz cfc1 fn_get_byte 01 g_src ht off ht cfj 02
                tz cfc2 fn_get_byte 01 g_func_names ht cfoff ht cfj 02
                lr cfc1 == 32 08
                    lr cfc2 != 0 08 tz cfmatch 0 09
                    ls
                09
                lr cfc1 == 10 08
                    lr cfc2 != 0 08 tz cfmatch 0 09
                    ls
                09
                lr cfc1 == 0 08
                    lr cfc2 != 0 08 tz cfmatch 0 09
                    ls
                09
                tz cfvd cfc1 hz cfc2
                lr cfvd != 0 08 tz cfmatch 0 09
                tz cfj cfj ht 1
            09
            lr cfmatch == 1 08 tz cf_found 1 09
            lr cf_found == 0 08 tz cf_idx cf_idx ht 1 09
        09
        lr cf_found == 1 08
            zt wx_call_func 01 g_src ht off, llen 02
        09
        lr c1 == 104 08
            lr c2 == 106 08
                tz skip_ip cur_ip ht 1
                tz found 0
                ll 08
                    lz skip_ip g_line_count 08 ls 09
                    lr found == 1 08 ls 09
                    tz soff g_offsets[skip_ip]
                    tz sc1 fn_get_byte 01 g_src ht soff 02
                    tz sc2 fn_get_byte 01 g_src ht soff ht 1 02
                    lr sc1 == 104 08
                        lr sc2 == 106 08
                            tz cur_ip skip_ip
                            tz jumped 1
                            tz found 1
                        09
                    09
                    tz skip_ip skip_ip ht 1
                09
            09
        09
        lr c1 == 67 08
            lr c2 == 106 08 zt wx_do_tj 01 g_src ht off ht 2, llen hz 2 02 09
        09
        lr c1 == 67 08
            lr c2 == 109 08
                tz loop_start cur_ip
                tz cur_loop_type 1
                tz ci 0
                ll 08
                    lz ci llen 08 ls 09
                    tz cc fn_get_byte 01 g_src ht off ht ci 02
                    lr cc == 32 08 tz ci ci ht 1 09
                    lr cc != 32 08 ls 09
                09
                tz cond zt wx_eval 01 g_src ht off ht ci, llen hz ci 02
                lr cond == 0 08
                    tz skip_ip cur_ip ht 1
                    tz found 0
                    ll 08
                        lz skip_ip g_line_count 08 ls 09
                        lr found == 1 08 ls 09
                        tz soff g_offsets[skip_ip]
                        tz sc1 fn_get_byte 01 g_src ht soff 02
                        tz sc2 fn_get_byte 01 g_src ht soff ht 1 02
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
        lr c1 == 67 08
            lr c2 == 115 08
                tz si 2
                ll 08
                    lz si llen 08 ls 09
                    tz sch fn_get_byte 01 g_src ht off ht si 02
                    lr sch == 32 08 tz si si ht 1 09
                    lr sch != 32 08 ls 09
                09
                tz sname_start si
                ll 08
                    lz si llen 08 ls 09
                    tz sch fn_get_byte 01 g_src ht off ht si 02
                    lr sch == 32 08 ls 09
                    tz si si ht 1
                09
                tz sname_len si hz sname_start
                tz sval zt wx_find_var 01 g_src ht off ht sname_start, sname_len 02
                ll 08
                    lz si llen 08 ls 09
                    tz sch fn_get_byte 01 g_src ht off ht si 02
                    lr sch == 32 08 tz si si ht 1 09
                    lr sch != 32 08 ls 09
                09
                tz sinc zt wx_eval 01 g_src ht off ht si, llen hz si 02
                tz sval sval ht sinc
                zt wx_set_var 01 g_src ht off ht sname_start, sname_len, sval 02
            09
        09
        lr c1 == 108 08
            lr c2 == 108 08
                tz while_start cur_ip
                tz cur_loop_type 2
                tz ci 0
                ll 08
                    lz ci llen 08 ls 09
                    tz cc fn_get_byte 01 g_src ht off ht ci 02
                    lr cc == 32 08 tz ci ci ht 1 09
                    lr cc != 32 08 ls 09
                09
                tz cond zt wx_eval 01 g_src ht off ht ci, llen hz ci 02
                lr cond == 0 08
                    tz skip_ip cur_ip ht 1
                    tz found 0
                    ll 08
                        lz skip_ip g_line_count 08 ls 09
                        lr found == 1 08 ls 09
                        tz soff g_offsets[skip_ip]
                        tz sc1 fn_get_byte 01 g_src ht soff 02
                        tz sc2 fn_get_byte 01 g_src ht soff ht 1 02
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
                g_if_taken = 0
                tz ci 2
                ll 08
                    lz ci llen 08 ls 09
                    tz cc fn_get_byte 01 g_src ht off ht ci 02
                    lr cc == 32 08 tz ci ci ht 1 09
                    lr cc != 32 08 ls 09
                09
                tz cond zt wx_eval 01 g_src ht off ht ci, llen hz ci 02
                lr cond != 0 08 g_if_taken = 1 09
                lr cond == 0 08
                    tz skip_ip cur_ip ht 1
                    tz found 0
                    ll 08
                        lz skip_ip g_line_count 08 ls 09
                        lr found == 1 08 ls 09
                        tz soff g_offsets[skip_ip]
                        tz sc1 fn_get_byte 01 g_src ht soff 02
                        tz sc2 fn_get_byte 01 g_src ht soff ht 1 02
                        lr sc1 == 88 08
                            lr sc2 == 109 08
                                tz cur_ip skip_ip
                                tz jumped 1
                                tz found 1
                            09
                            lr sc2 == 115 08
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
                lr g_if_taken == 1 08
                    tz skip_ip cur_ip ht 1
                    tz found 0
                    ll 08
                        lz skip_ip g_line_count 08 ls 09
                        lr found == 1 08 ls 09
                        tz soff g_offsets[skip_ip]
                        tz sc1 fn_get_byte 01 g_src ht soff 02
                        tz sc2 fn_get_byte 01 g_src ht soff ht 1 02
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
                lr g_if_taken == 0 08
                    tz ci 0
                    ll 08
                        lz ci llen 08 ls 09
                        tz cc fn_get_byte 01 g_src ht off ht ci 02
                        lr cc == 32 08 tz ci ci ht 1 09
                        lr cc != 32 08 ls 09
                    09
                    tz cond zt wx_eval 01 g_src ht off ht ci, llen hz ci 02
                    lr cond != 0 08 g_if_taken = 1 09
                    lr cond == 0 08
                        tz skip_ip cur_ip ht 1
                        tz found 0
                        ll 08
                            lz skip_ip g_line_count 08 ls 09
                            lr found == 1 08 ls 09
                            tz soff g_offsets[skip_ip]
                            tz sc1 fn_get_byte 01 g_src ht soff 02
                            tz sc2 fn_get_byte 01 g_src ht soff ht 1 02
                            lr sc1 == 88 08
                                lr sc2 == 109 08
                                    tz cur_ip skip_ip
                                    tz jumped 1
                                    tz found 1
                                09
                                lr sc2 == 115 08
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
        lr c1 == 88 08
            lr c2 == 115 08
                lr g_if_taken == 1 08
                    tz skip_ip cur_ip ht 1
                    tz found 0
                    ll 08
                        lz skip_ip g_line_count 08 ls 09
                        lr found == 1 08 ls 09
                        tz soff g_offsets[skip_ip]
                        tz sc1 fn_get_byte 01 g_src ht soff 02
                        tz sc2 fn_get_byte 01 g_src ht soff ht 1 02
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
                lr g_if_taken == 0 08 g_if_taken = 1 09
            09
        09
        lr c1 == 88 08
            lr c2 == 116 08 g_if_taken = 0 09
        09
        lr c1 == 68 08
            lr c2 == 106 08
                tz brk_ip cur_ip ht 1
                tz brk_depth 1
                ll 08
                    lz brk_ip g_line_count 08 ls 09
                    lr brk_depth == 0 08 ls 09
                    tz brk_off g_offsets[brk_ip]
                    tz bc1 fn_get_byte 01 g_src ht brk_off 02
                    tz bc2 fn_get_byte 01 g_src ht brk_off ht 1 02
                    lr bc1 == 67 08
                        lr bc2 == 106 08 tz brk_depth brk_depth ht 1 09
                        lr bc2 == 109 08 tz brk_depth brk_depth ht 1 09
                    09
                    lr bc1 == 108 08
                        lr bc2 == 108 08 tz brk_depth brk_depth ht 1 09
                    09
                    lr bc1 == 67 08
                        lr bc2 == 116 08
                            tz brk_depth brk_depth hz 1
                            lr brk_depth == 0 08
                                tz cur_ip brk_ip ht 1
                                tz jumped 1
                            09
                        09
                    09
                    lr bc1 == 108 08
                        lr bc2 == 100 08
                            tz brk_depth brk_depth hz 1
                            lr brk_depth == 0 08
                                tz cur_ip brk_ip ht 1
                                tz jumped 1
                            09
                        09
                    09
                    tz brk_ip brk_ip ht 1
                09
            09
            lr c2 == 109 08
                lr cur_loop_type == 1 08 tz cur_ip loop_start 09
                lr cur_loop_type == 2 08 tz cur_ip while_start 09
                tz jumped 1
            09
            lr c2 == 115 08 zt _rt_exit 01 0 02 09
        09
        lr c1 == 81 08
            lr c2 == 106 08 zt wx_do_Qj 01 g_src ht off ht 2, llen hz 2 02 09
            lr c2 == 109 08 zt wx_do_Qm 01 g_src ht off ht 2, llen hz 2 02 09
            lr c2 == 115 08 zt wx_do_Qs 01 g_src ht off ht 2, llen hz 2 02 09
        09
        lr jumped == 0 08
            lr llen > 0 08 zt wx_exec_line 01 g_src ht off, llen 02 09
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
                lr c1 != 108 08
                    lr c1 != 68 08 tz cur_ip cur_ip ht 1 09
                09
            09
        09
    09
    zz 0
09

tt wx_call_func 01 line, len 02 -> u32 08
    tz fidx 0
    tz ffound 0
    ll 08
        lz fidx g_func_count 08 ls 09
        lr ffound == 1 08 ls 09
        tz fmatch 1
        tz fj 0
        tz foff fidx hh 16
        ll 08
            lz fj 16 08 ls 09
            tz fc1 fn_get_byte 01 line ht fj 02
            tz fc2 fn_get_byte 01 g_func_names ht foff ht fj 02
            lr fc1 == 32 08
                lr fc2 != 0 08 tz fmatch 0 09
                ls
            09
            lr fc1 == 10 08
                lr fc2 != 0 08 tz fmatch 0 09
                ls
            09
            lr fc1 == 0 08
                lr fc2 != 0 08 tz fmatch 0 09
                ls
            09
            tz fvd fc1 hz fc2
            lr fvd != 0 08 tz fmatch 0 09
            tz fj fj ht 1
        09
        lr fmatch == 1 08 tz ffound 1 09
        lr ffound == 0 08 tz fidx fidx ht 1 09
    09
    lr ffound == 0 08 zz 0 09
    tz fstart g_func_start[fidx]
    tz fip fstart
    ll 08
        lz fip g_line_count 08 ls 09
        tz foff2 g_offsets[fip]
        tz fnoff g_offsets[fip ht 1]
        tz fllen fnoff hz foff2
        tz fi2 0
        ll 08
            lz fi2 fllen 08 ls 09
            tz fch fn_get_byte 01 g_src ht foff2 ht fi2 02
            lr fch == 32 08 tz fi2 fi2 ht 1 09
            lr fch == 9 08 tz fi2 fi2 ht 1 09
            lr fch != 32 08
                lr fch != 9 08 ls 09
            09
        09
        lr fi2 >= fllen 08
            tz fip fip ht 1
            zz 0
        09
        tz fc1 fn_get_byte 01 g_src ht foff2 ht fi2 02
        tz fc2 0
        lr fllen > 1 08 tz fc2 fn_get_byte 01 g_src ht foff2 ht fi2 ht 1 02 09
        lr fc1 == 104 08
            lr fc2 == 106 08
                zz g_func_ret_val
            09
        09
        tz g_func_returning 0
        zt wx_exec_line 01 g_src ht foff2 ht fi2, fllen hz fi2 02
        zt _rt_puti 01 g_func_ret_val 02
        zt _rt_putc 01 10 02
        lr g_func_returning == 1 08
            zz g_func_ret_val
        09
        tz fip fip ht 1
    09
    zz g_func_ret_val
09

tt wx_exec_line 01 line, len 02 -> u32 08
    tz retval 0
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
    tz wf_found 0
    tz wf_idx 0
    ll 08
        lz wf_idx g_func_count 08 ls 09
        lr wf_found == 1 08 ls 09
        tz wfmatch 1
        tz wfj 0
        tz wfoff wf_idx hh 16
        ll 08
            lz wfj 16 08 ls 09
            tz wfc1 fn_get_byte 01 line ht i ht wfj 02
            tz wfc2 fn_get_byte 01 g_func_names ht wfoff ht wfj 02
            lr wfc1 == 32 08
                lr wfc2 != 0 08 tz wfmatch 0 09
                ls
            09
            lr wfc1 == 10 08
                lr wfc2 != 0 08 tz wfmatch 0 09
                ls
            09
            lr wfc1 == 0 08
                lr wfc2 != 0 08 tz wfmatch 0 09
                ls
            09
            zt _rt_putc 01 10 02
            tz wfvd wfc1 hz wfc2
            lr wfvd != 0 08 tz wfmatch 0 09
            tz wfj wfj ht 1
        09
        lr wfmatch == 1 08 tz wf_found 1 09
        lr wf_found == 0 08 tz wf_idx wf_idx ht 1 09
    09
    lr wf_found == 1 08
        tz retval zt wx_call_func 01 line ht i, len hz i 02
        zz retval
    09
    lr c1 == 106 08
        lr c2 == 106 08 tz retval zt wx_do_jj 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 109 08 tz retval zt wx_do_jm 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 115 08 tz retval zt wx_do_js 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 104 08 tz retval zt wx_do_jh 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 116 08 tz retval zt wx_do_jt 01 line ht i ht 2, len hz i hz 2 02 09
    09
    lr c1 == 109 08
        lr c2 == 106 08 tz retval zt wx_do_mj 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 109 08 tz retval zt wx_do_mm 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 115 08 tz retval zt wx_do_ms 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 104 08 tz retval zt wx_do_mh 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 116 08 tz retval zt wx_do_mt 01 line ht i ht 2, len hz i hz 2 02 09
    09
    lr c1 == 115 08
        lr c2 == 106 08 tz retval zt wx_do_sj 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 109 08 tz retval zt wx_do_sm 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 115 08 tz retval zt wx_do_ss 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 104 08 tz retval zt wx_do_sh 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 116 08 tz retval zt wx_do_st 01 line ht i ht 2, len hz i hz 2 02 09
    09
    lr c1 == 104 08
        lr c2 == 106 08 tz retval zt wx_do_hj 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 109 08
            tz retval zt wx_do_hm 01 line ht i ht 2, len hz i hz 2 02
            tz g_func_ret_val retval
            tz g_func_returning 1
        09
        lr c2 == 115 08 tz retval zt wx_do_hs 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 104 08 tz retval zt wx_do_hh 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 116 08 tz retval zt wx_do_ht 01 line ht i ht 2, len hz i hz 2 02 09
    09
    lr c1 == 116 08
        lr c2 == 106 08 tz retval zt wx_do_tj 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 109 08 tz retval zt wx_do_tm 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 115 08 tz retval zt wx_do_ts 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 104 08 tz retval zt wx_do_th 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 116 08 tz retval zt wx_do_tt 01 line ht i ht 2, len hz i hz 2 02 09
    09
    lr c1 == 67 08
        lr c2 == 104 08 tz retval zt wx_do_Ch 01 line ht i ht 2, len hz i hz 2 02 09
    09
    lr c1 == 88 08
        lr c2 == 104 08 tz retval zt wx_do_Xh 01 line ht i ht 2, len hz i hz 2 02 09
    09
    lr c1 == 81 08
        lr c2 == 104 08 tz retval zt wx_do_Qh 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 116 08 tz retval zt wx_do_Qt 01 line ht i ht 2, len hz i hz 2 02 09
    09
    lr c1 == 68 08
        lr c2 == 104 08 tz retval zt wx_do_Dh 01 line ht i ht 2, len hz i hz 2 02 09
        lr c2 == 116 08 tz retval zt wx_do_Dt 01 line ht i ht 2, len hz i hz 2 02 09
    09
    zz retval
09

tt wx_do_jj 01 arg, alen 02 -> u32 08
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    tz c0 fn_get_byte 01 arg ht i 02
    lr c0 == 48 08
        tz nc i ht 1
        lr nc < alen 08
            tz nc2 fn_get_byte 01 arg ht nc 02
            lr nc2 == 51 08
                tz i i ht 2
                ll 08
                    lz i alen 08 ls 09
                    tz c1 fn_get_byte 01 arg ht i 02
                    lr c1 == 48 08
                        tz nci i ht 1
                        lr nci < alen 08
                            tz c2 fn_get_byte 01 arg ht nci 02
                            lr c2 == 52 08
                                zt _rt_putc 01 10 02
                                zz 0
                            09
                        09
                    09
                    zt _rt_putc 01 c1 02
                    tz i i ht 1
                09
                zt _rt_putc 01 10 02
                zz 0
            09
        09
    09
    tz val zt wx_eval 01 arg ht i, alen hz i 02
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
    tz val zt wx_eval 01 arg ht i, alen hz i 02
    zt _rt_puti 01 val 02
    zt _rt_putc 01 10 02
    zz 0
09

tt wx_do_js 01 arg, alen 02 -> u32 08
    tz buf 0
    tz bi 0
    ll 08
        tz ch zt _rt_getc 01 02
        lr ch == 10 08 ls 09
        fn_set_byte 01 cmd_buf ht bi, ch 02
        tz bi bi ht 1
    09
    fn_set_byte 01 cmd_buf ht bi, 0 02
    zz 0
09

tt wx_do_jh 01 arg, alen 02 -> u32 08
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    tz content zt fn_read_file 01 arg ht i 02
    tz pos 0
    ll 08
        tz ch fn_get_byte 01 content ht pos 02
        lr ch == 0 08 ls 09
        zt _rt_putc 01 ch 02
        tz pos pos ht 1
    09
    zz 0
09

tt wx_do_jt 01 arg, alen 02 -> u32 08
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
        lr ch == 32 08 ls 09
        tz i i ht 1
    09
    tz flen i hz fstart
    tz ci 0
    ll 08
        lz ci flen 08 ls 09
        tz ch fn_get_byte 01 arg ht fstart ht ci 02
        fn_set_byte 01 cmd_buf ht ci, ch 02
        tz ci ci ht 1
    09
    fn_set_byte 01 cmd_buf ht ci, 0 02
    tz cstart i
    ll 08
        lz cstart alen 08 ls 09
        tz ch fn_get_byte 01 arg ht cstart 02
        lr ch == 32 08 tz cstart cstart ht 1 09
        lr ch != 32 08 ls 09
    09
    zt fn_write_file 01 cmd_buf, arg ht cstart 02
    zz 0
09

tt wx_do_mj 01 arg, alen 02 -> u32 08
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    tz slen 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 34 08 tz i i ht 1 09
        lr ch == 34 08 ls 09
        tz slen slen ht 1
        tz i i ht 1
    09
    zz slen
09

tt wx_do_mm 01 arg, alen 02 -> u32 08
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
        lr ch == 10 08 ls 09
        tz i i ht 1
    09
    tz name_len i hz name_start
    tz arr_idx 0
    tz found 0
    ll 08
        lz arr_idx g_arr_count 08 ls 09
        lr found == 1 08 ls 09
        tz match 1
        tz j 0
        tz off arr_idx hh 16
        ll 08
            lz j name_len 08 ls 09
            tz c1 fn_get_byte 01 arg ht name_start ht j 02
            tz c2 fn_get_byte 01 g_arr_names ht off ht j 02
            tz vd c1 hz c2
            lr vd != 0 08 tz match 0 09
            tz j j ht 1
        09
        tz endc fn_get_byte 01 g_arr_names ht off ht name_len 02
        lr endc != 0 08 tz match 0 09
        lr match == 1 08 tz found 1 09
        lr found == 0 08 tz arr_idx arr_idx ht 1 09
    09
    lr found == 0 08
        tz arr_idx = g_arr_count
        tz off = arr_idx hh 16
        tz p = g_arr_names ht off
        tz j 0
        ll 08
            lz j name_len 08 ls 09
            tz ch fn_get_byte 01 arg ht name_start ht j 02
            fn_set_byte 01 p, ch 02
            tz p p ht 1
            tz j j ht 1
        09
        fn_set_byte 01 p, 0 02
        g_arr_offset[arr_idx] = g_arr_count hh 64
        g_arr_size[arr_idx] = 0
        g_arr_count = g_arr_count ht 1
    09
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    lr i >= alen 08
        zz g_arr_size[arr_idx]
    09
    tz val zt wx_eval 01 arg ht i, alen hz i 02
    tz doff = g_arr_offset[arr_idx]
    tz dsz = g_arr_size[arr_idx]
    tz didx = doff ht dsz
    g_arr_data[didx] = val
    g_arr_size[arr_idx] = dsz ht 1
    zz 0
09

tt wx_do_ms 01 arg, alen 02 -> u32 08
    tz dict_count 0
    zz 0
09

tt wx_do_mh 01 arg, alen 02 -> u32 08
    zz 0
09

tt wx_do_mt 01 arg, alen 02 -> u32 08
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    tz val zt wx_eval 01 arg ht i, alen hz i 02
    tz r 0
    lr val != 0 08 tz r 1 09
    zz r
09

tt wx_do_sj 01 arg, alen 02 -> u32 08
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    tz fch fn_get_byte 01 arg ht i 02
    lr fch == 34 08 tz i i ht 1 09
    tz ci 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 34 08 ls 09
        fn_set_byte 01 cmd_buf ht ci, ch 02
        tz ci ci ht 1
        tz i i ht 1
    09
    fn_set_byte 01 cmd_buf ht ci, 0 02
    zt fn_system 01 cmd_buf 02
    zz 0
09

tt wx_do_sm 01 arg, alen 02 -> u32 08
    zt fn_system 01 03env04 02
    zz 0
09

tt wx_do_ss 01 arg, alen 02 -> u32 08
    zt fn_system 01 03date +%s04 02
    zz 0
09

tt wx_do_sh 01 arg, alen 02 -> u32 08
    zt fn_system 01 03ls -la04 02
    zz 0
09

tt wx_do_st 01 arg, alen 02 -> u32 08
    tz lock_var 0
    zz 0
09

tt wx_do_hj 01 arg, alen 02 -> u32 08
    tz func_def 1
    zz 0
09

tt wx_do_hm 01 arg, alen 02 -> u32 08
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    lr i < alen 08
        tz fch fn_get_byte 01 arg ht i 02
        lr fch >= 97 08
            lr fch <= 122 08
                tz vlen 0
                tz vi i
                ll 08
                    lz vi alen 08 ls 09
                    tz vch fn_get_byte 01 arg ht vi 02
                    lr vch == 32 08 ls 09
                    lr vch == 10 08 ls 09
                    tz vlen vlen ht 1
                    tz vi vi ht 1
                09
                tz val zt wx_find_var 01 arg ht i, vlen 02
                zz val
            09
        09
        tz val zt wx_eval 01 arg ht i, alen hz i 02
        zz val
    09
    zz 0
09

tt wx_do_hs 01 arg, alen 02 -> u32 08
    tz err_code 0
    zz 0
09

tt wx_do_hh 01 arg, alen 02 -> u32 08
    tz class_count 0
    zz 0
09

tt wx_do_ht 01 arg, alen 02 -> u32 08
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
        09
        lr ch == 32 08
            tz i i ht 1
        09
        lr i < alen 08
            tz vch fn_get_byte 01 arg ht i 02
            lr vch == 106 08 tz val zt wx_exec_line 01 arg ht i, alen hz i 02 09
            lr vch == 109 08 tz val zt wx_exec_line 01 arg ht i, alen hz i 02 09
            lr vch == 115 08 tz val zt wx_exec_line 01 arg ht i, alen hz i 02 09
            lr vch == 104 08 tz val zt wx_exec_line 01 arg ht i, alen hz i 02 09
            lr vch == 116 08 tz val zt wx_exec_line 01 arg ht i, alen hz i 02 09
            lr vch == 67 08 tz val zt wx_exec_line 01 arg ht i, alen hz i 02 09
            lr vch == 88 08 tz val zt wx_exec_line 01 arg ht i, alen hz i 02 09
            lr vch == 81 08 tz val zt wx_exec_line 01 arg ht i, alen hz i 02 09
            lr vch == 68 08 tz val zt wx_exec_line 01 arg ht i, alen hz i 02 09
            lr vch != 106 08
                lr vch != 109 08
                    lr vch != 115 08
                        lr vch != 104 08
                            lr vch != 116 08
                                lr vch != 67 08
                                    lr vch != 88 08
                                        lr vch != 81 08
                                            lr vch != 68 08 tz val zt wx_eval 01 arg ht i, alen hz i 02 09
                                        09
                                    09
                                09
                            09
                        09
                    09
                09
            09
        09
    09
    zt wx_set_var 01 arg ht name_start, name_len, val 02
    zz 0
09

tt wx_do_tm 01 arg, alen 02 -> u32 08
    zz 0
09

tt wx_do_ts 01 arg, alen 02 -> u32 08
    zz 0
09

tt wx_do_th 01 arg, alen 02 -> u32 08
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    tz val zt wx_eval 01 arg ht i, alen hz i 02
    zz val
09

tt wx_do_tt 01 arg, alen 02 -> u32 08
    zz 0
09

tt wx_do_Ch 01 arg, alen 02 -> u32 08
    zz 0
09

tt wx_do_Xh 01 arg, alen 02 -> u32 08
    zz 0
09

tt wx_do_Qh 01 arg, alen 02 -> u32 08
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    tz host_len 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 47 08 ls 09
        lr ch == 34 08 ls 09
        tz host_len host_len ht 1
        tz i i ht 1
    09
    zz host_len
09

tt wx_do_Qt 01 arg, alen 02 -> u32 08
    tz sock_fd 0
    zz 0
09

tt wx_do_Dh 01 arg, alen 02 -> u32 08
    tz coro_id 0
    zz 0
09

tt wx_do_Dt 01 arg, alen 02 -> u32 08
    tz i 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 32 08 tz i i ht 1 09
        lr ch != 32 08 ls 09
    09
    tz fch fn_get_byte 01 arg ht i 02
    lr fch == 34 08 tz i i ht 1 09
    tz ci 0
    ll 08
        lz i alen 08 ls 09
        tz ch fn_get_byte 01 arg ht i 02
        lr ch == 34 08 ls 09
        fn_set_byte 01 cmd_buf ht ci, ch 02
        tz ci ci ht 1
        tz i i ht 1
    09
    fn_set_byte 01 cmd_buf ht ci, 38 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 0 02
    zt fn_system 01 cmd_buf 02
    zz 0
09

tt wx_do_Qj 01 arg, alen 02 -> u32 08
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
    tz j 0
    ll 08
        lz j alen 08 ls 09
        tz ch fn_get_byte 01 arg ht j 02
        lr ch <= 32 08 tz j j ht 1 09
        lr ch > 32 08 ls 09
    09
    ll 08
        lz j alen 08 ls 09
        tz ch fn_get_byte 01 arg ht j 02
        fn_set_byte 01 cmd_buf ht ci, ch 02
        tz ci ci ht 1
        tz j j ht 1
    09
    fn_set_byte 01 cmd_buf ht ci, 0 02
    zt fn_system 01 cmd_buf 02
    zz 0
09

tt wx_do_Qm 01 arg, alen 02 -> u32 08
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
    fn_set_byte 01 cmd_buf ht ci, 88 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 32 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 80 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 79 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 83 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 84 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 32 02
    tz ci ci ht 1
    tz j 0
    ll 08
        lz j alen 08 ls 09
        tz ch fn_get_byte 01 arg ht j 02
        fn_set_byte 01 cmd_buf ht ci, ch 02
        tz ci ci ht 1
        tz j j ht 1
    09
    fn_set_byte 01 cmd_buf ht ci, 0 02
    zt fn_system 01 cmd_buf 02
    zz 0
09

tt wx_do_Qs 01 arg, alen 02 -> u32 08
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
    fn_set_byte 01 cmd_buf ht ci, 111 02
    tz ci ci ht 1
    fn_set_byte 01 cmd_buf ht ci, 32 02
    tz ci ci ht 1
    tz j 0
    ll 08
        lz j alen 08 ls 09
        tz ch fn_get_byte 01 arg ht j 02
        fn_set_byte 01 cmd_buf ht ci, ch 02
        tz ci ci ht 1
        tz j j ht 1
    09
    fn_set_byte 01 cmd_buf ht ci, 0 02
    zt fn_system 01 cmd_buf 02
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
            tz vdiff c1 hz c2
            lr vdiff != 0 08 tz match 0 09
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
            tz vdiff c1 hz c2
            lr vdiff != 0 08 tz match 0 09
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

tt wx_skip_ws 01 02 -> u32 08
    ll 08
        lz g_epos g_elen 08 zz 0 09
        tz ch fn_get_byte 01 g_eexpr ht g_epos 02
        lr ch != 32 08 ls 09
        g_epos = g_epos ht 1
    09
    zz 0
09

tt wx_eval_factor 01 02 -> u32 08
    zt wx_skip_ws 01 02
    tz ch fn_get_byte 01 g_eexpr ht g_epos 02
    lr ch == 48 08
        tz nc g_epos ht 1
        lr nc < g_elen 08
            tz nc2 fn_get_byte 01 g_eexpr ht nc 02
            lr nc2 == 49 08
                g_epos = g_epos ht 2
                tz result zt wx_eval_expr 01 02
                zt wx_skip_ws 01 02
                tz c3 fn_get_byte 01 g_eexpr ht g_epos 02
                lr c3 == 48 08
                    tz nc3 g_epos ht 1
                    lr nc3 < g_elen 08
                        tz nc4 fn_get_byte 01 g_eexpr ht nc3 02
                        lr nc4 == 50 08
                            g_epos = g_epos ht 2
                        09
                    09
                09
                zz result
            09
        09
    09
    tz num 0
    tz start g_epos
    ll 08
        lz g_epos g_elen 08 ls 09
        tz c fn_get_byte 01 g_eexpr ht g_epos 02
        tz nd 0
        lr c > 47 08
            lr c < 58 08 tz nd 1 09
        09
        lr nd == 0 08 ls 09
        tz num num hh 10 ht c hz 48
        g_epos = g_epos ht 1
    09
    lr g_epos > start 08 zz num 09
    tz var_start g_epos
    ll 08
        lz g_epos g_elen 08 ls 09
        tz c fn_get_byte 01 g_eexpr ht g_epos 02
        lr c == 32 08 ls 09
        lr c == 10 08 ls 09
        lr c == 48 08 ls 09
        g_epos = g_epos ht 1
    09
    tz vlen g_epos hz var_start
    lr vlen > 0 08
        tz v zt wx_find_var 01 g_eexpr ht var_start, vlen 02
        zz v
    09
    zz 0
09

tt wx_eval_term 01 02 -> u32 08
    tz result zt wx_eval_factor 01 02
    ll 08
        zt wx_skip_ws 01 02
        lz g_epos g_elen 08 ls 09
        tz c fn_get_byte 01 g_eexpr ht g_epos 02
        tz op 0
        lr c == 104 08
            tz nc g_epos ht 1
            lr nc < g_elen 08
                tz nc2 fn_get_byte 01 g_eexpr ht nc 02
                lr nc2 == 104 08 tz op 3 09
                lr nc2 == 108 08 tz op 4 09
                lr nc2 == 102 08 tz op 5 09
            09
        09
        lr op == 0 08 ls 09
        g_epos = g_epos ht 2
        tz rhs zt wx_eval_factor 01 02
        lr op == 3 08 tz result result hh rhs 09
        lr op == 4 08
            lr rhs != 0 08 tz result result hl rhs 09
        09
        lr op == 5 08
            lr rhs != 0 08 tz result zt fn_mod 01 result, rhs 02 09
        09
    09
    zz result
09

tt wx_eval_expr 01 02 -> u32 08
    tz result zt wx_eval_term 01 02
    ll 08
        zt wx_skip_ws 01 02
        lz g_epos g_elen 08 ls 09
        tz c fn_get_byte 01 g_eexpr ht g_epos 02
        tz op 0
        lr c == 104 08
            tz nc g_epos ht 1
            lr nc < g_elen 08
                tz nc2 fn_get_byte 01 g_eexpr ht nc 02
                lr nc2 == 116 08 tz op 1 09
                lr nc2 == 122 08 tz op 2 09
            09
        09
        lr op == 0 08 ls 09
        g_epos = g_epos ht 2
        tz rhs zt wx_eval_term 01 02
        lr op == 1 08 tz result result ht rhs 09
        lr op == 2 08 tz result result hz rhs 09
    09
    zz result
09

tt wx_eval 01 expr, elen 02 -> u32 08
    g_eexpr = expr
    g_elen = elen
    g_epos = 0
    tz result zt wx_eval_expr 01 02
    zz result
09
