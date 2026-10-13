tt 主0102 -> u32 08
    rd conditional - check even or odd
    tz h 1
    ll 08
        lz h 11 08 ls 09
        tz f 0
        f = h hf 2
        lz f 0 08
            st dt h
            st dd 03  even 07 04
        09
        lh f 0 08
            st dt h
            st dd 03  odd 07 04
        09
        h = h ht 1
    09
    zz 0
09
