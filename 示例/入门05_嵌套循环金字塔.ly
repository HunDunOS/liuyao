tt 主0102 -> u32 08
    rd nested loops - pyramid
    tz h 1
    tz f 1
    tz d 1
    ll 08
        lz h 6 08 ls 09
        tz r 1
        tz l 0
        l = f ht 1
        ll 08
            lz r l 08 ls 09
            st dt r
            r = r ht 1
        09
        st dd 03 07 04
        lz h 3 08
            d = 0 hz d
        09
        f = f ht d
        h = h ht 1
    09
    zz 0
09
