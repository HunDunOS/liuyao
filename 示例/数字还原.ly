rd 数字还原 —— 把 01..09 还原成标点（用六爻写的，不用 Python）

qj 字符缓[2]: u32
qj 缓址: u32

rd 出一个字符（造个 1 字节的临时串）
tt 出一字(c: u32) -> u32 {
    wx {
        ^(缓址 ht 0) = c
        ^(缓址 ht 1) = 0
    }
    印串(缓址)
    zz 0
}

rd 两位数字 → 是不是某个标点码
tt 是码(c: u32, d: u32, 码: u32) -> u32 {
    zz (c hz 48) hh 10 ht (d hz 48) == 码
}

tt 主() -> u32 {
    tz 源: u32 = "tt 主0102 08 st dt 1 09"
    tz p: u32 = 0
    tz c: u32 = 0
    tz d: u32 = 0

    wx { 缓址 = 地址(字符缓) }

    ll {
        wx { c = ^(源 ht p) }
        lr c == 0 { ls }

        rd 数字开头：看两位是不是标点码
        lr c >= 48 {
            lr c <= 57 {
                wx { d = ^(源 ht p ht 1) }
                lr d >= 48 {
                    lr d <= 57 {
                        lr 是码(c, d, 1) { 出一字(40)  p = p ht 2  lf }
                        lr 是码(c, d, 2) { 出一字(41)  p = p ht 2  lf }
                        lr 是码(c, d, 3) { 出一字(34)  p = p ht 2  lf }
                        lr 是码(c, d, 4) { 出一字(34)  p = p ht 2  lf }
                        lr 是码(c, d, 6) { 出一字(10)  p = p ht 2  lf }
                        lr 是码(c, d, 7) { 出一字(123) p = p ht 2  lf }
                        lr 是码(c, d, 8) { 出一字(123) p = p ht 2  lf }
                        lr 是码(c, d, 9) { 出一字(125) p = p ht 2  lf }
                    }
                }
            }
        }

        出一字(c)
        p = p ht 1
    }

    出一字(10)
    zz 0
}
