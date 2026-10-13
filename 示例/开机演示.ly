# 开机演示 —— 中英对照（屏幕显示 ASCII 部分，串口显示完整）
qj 表[8]: u32

tt 主() -> u32 {
    印("=== LiuYao / 六爻 ===\n")
    印("language  version v0.4\n")
    印("compiler  written in C, rebuilt by clang\n")
    印("kernel    built by the LiuYao compiler itself\n")
    印("--- self test ---\n")

    表[0] = 6
    表[1] = 7
    印("array     6 * 7 = ")
    印(表[0] * 表[1])
    印("   [ok]\n")
    印("bit and   12 wy 10 = ")
    印(12 hs 10)
    印("   [ok]\n")
    印("bit or    12 wh 3  = ")
    印(12 hr 3)
    印("   [ok]\n")
    印("xor       12 yh 10 = ")
    印(12 hd 10)
    印("   [ok]\n")
    印("shift     1 << 5   = ")
    印(1 << 5)
    印("   [ok]\n")

    th 串: *u8 = "12345"
    tz i: u32 = 0
    tz 和: u32 = 0
    ll {
        wx {
            lr ^(串 + i) == 0 { ls }
            和 = 和 + (^(串 + i) - 48)
        }
        i = i + 1
    }
    th 和2: u32 = 和
    印("pointer   walk string, sum = ")
    印(和2)
    印("   [ok]\n")
    印("=== all tests passed / 全部通过 ===\n")
    zz 0
}
