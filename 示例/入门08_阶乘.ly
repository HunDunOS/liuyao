tt 主0102 -> u32 08
    rd factorial 1! to 10!
    tz h 1
    ll 08
        lz h 11 08 ls 09
        tz f 1
        tz d 1
        ll 08
            lz d h 08 ls 09
            f = f hh d
            d = d ht 1
        09
        st dt h
        st dd 03 ! =  04
        st dt f
        st dd 03 07 04
        h = h ht 1
    09
    zz 0
09
