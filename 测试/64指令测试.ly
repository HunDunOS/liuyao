00 64个指令全部测试程序

00 ---- t类指令 ----
ts g_test = 0
tf g_arr[8]: u64
th g_const = 100
tr g_enum = 0
td g_bool = 1
tl g_struct = 0

00 ---- 函数 ----
tt test_func 01 a u64 b u64 02 -> u64  08
    ht a b
    zz 0
 09

tt zhu 01 fname 02 -> u64  08
    00 tz 定义变量
    tz x = 0
    tz y = 0

    00 ---- h类运算 ----
    x = ht 1 2
    x = hz 5 3
    x = hh 2 3
    x = hl 10 2
    x = hf 10 3
    x = hs 12 10
    x = hr 12 10
    x = hd 12 10

    00 ---- d类数据 ----
    tz num = dt 42
    tz null = dz 0
    tz shl = dh 1 4
    tz shr = dl 16 2
    tz not = dr 255
    tz str = dd 03hello04

    00 ---- f类输入 ----
    tz c = ft 0
    tz mem = fh x
    tz arr = ff g_arr 0
    tz ptr = fr x
    tz not = fd x

    00 ---- s类输出 ----
    st dd 03test04
    st dt x
    sd dd 03debug04

    00 ---- z类函数 ----
    tz r = zt test_func 01 1 2 02
    zz 0
 09
