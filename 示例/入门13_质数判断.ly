tt 主0102 -> u32 08
    rd prime check 2 to 30
    tz h 2
    ll 08
        lz h 31 08 ls 09
        tz f 0
        tz d 2
        ll 08
            lz d h 08 ls 09
            tz r 0
            r = h hf d
            lz r 0 08 f = 1 09
            d = d ht 1
        09
        lz f 0 08
            st dt h
            st dd 03  prime 07 04
        09
        h = h ht 1
    09
    zz 0
09
