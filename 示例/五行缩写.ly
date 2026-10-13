@ 五行类型 —— 只用首字母缩写（中文只在文档里给人看）

qj 整数: J          @ 就是 qj 整数: u32
qj 串: M            @ 指针
qj 字节: S          @ 1 字节
qj 结构: H
qj 空: T

tt 加(a: JS, b: JS) -> JS {
    zz a ht b
}

tt 主() -> T {
    tz a: J = 3
    tz b: JS = 4
    tz p: MH = "指针"
    印("a ht b = ")
    印(加(a, b))
    印("\n")
    zz 0
}
