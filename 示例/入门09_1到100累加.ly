tt 主0102 -> u32 08
    rd sum 1 to 100
    tz h 1
    tz f 0
    ll 08
        lz h 101 08 ls 09
        f = f ht h
        h = h ht 1
    09
    st dd 03 sum 1 to 100 =  04
    st dt f
    st dd 03 07 04
    zz 0
09
