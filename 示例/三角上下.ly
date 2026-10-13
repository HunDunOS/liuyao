tt 主() -> u32 {
    tz i: u32 = 1

    ll {
        lr i > 3 { ls }
        tz j: u32 = 1
        ll {
            lr j > i { ls }
            st dt j
            j = j ht 1
        }
        st dd "\n"
        i = i ht 1
    }

    i = 2
    ll {
        lr i < 1 { ls }
        tz j: u32 = 1
        ll {
            lr j > i { ls }
            st dt j
            j = j ht 1
        }
        st dd "\n"
        i = i hz 1
    }

    zz 0
}
