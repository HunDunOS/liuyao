# Liuyao / Bagua Language Compiler

## Introduction
A pure imperative compiled language for x86-64 bare metal, 64 instructions full set, pure numeric encoding.

## Punctuation Encoding (00-09)
```
00 = #    01 = (    02 = )    03 = "    04 = "
05 = ;    06 = /    07 = \    08 = {    09 = }
```

## 64 Instruction Set

### t_ Declaration (8)
| Opcode | Trigram | Function |
|--------|---------|----------|
| tt | Qian-Qian | Define function |
| tz | Qian-Dui | Define stack variable |
| th | Qian-Li | Define read-only constant |
| tl | Qian-Zhen | Define struct blueprint |
| tf | Qian-Xun | Define array |
| ts | Qian-Kan | Define global variable |
| tr | Qian-Gen | Define enum type |
| td | Qian-Kun | Define boolean type |

### z_ Function (8)
| Opcode | Trigram | Function |
|--------|---------|----------|
| zt | Ze-Tian | Call function |
| zz | Dui-Dui | Return / pop stack frame |
| zh | Ze-Huo | Label definition |
| zl | Ze-Lei | Function pointer / callback |
| zf | Ze-Feng | Get address of variable |
| zs | Ze-Shui | Inline assembly block |
| zr | Ze-Shan | Assert / throw exception |
| zd | Ze-Di | System call |

### h_ Arithmetic (8)
| Opcode | Trigram | Function |
|--------|---------|----------|
| ht | Huo-Tian | Addition |
| hz | Huo-Ze | Subtraction |
| hh | Li-Li | Multiplication |
| hl | Huo-Lei | Division |
| hf | Huo-Feng | Modulo |
| hs | Huo-Shui | Bitwise AND |
| hr | Huo-Shan | Bitwise OR |
| hd | Huo-Di | Bitwise XOR |

### l_ Control Flow (8)
| Opcode | Trigram | Function |
|--------|---------|----------|
| lt | Lei-Tian | Unconditional jump |
| lz | Lei-Ze | Jump if equal |
| lh | Lei-Huo | Jump if not equal |
| ll | Zhen-Zhen | Loop start / condition |
| lf | Lei-Feng | Loop increment / continue |
| ls | Lei-Shui | Break loop |
| lr | Lei-Shan | If branch |
| ld | Lei-Di | Switch / jump table |

### f_ Input (8)
| Opcode | Trigram | Function |
|--------|---------|----------|
| ft | Feng-Tian | Read stdin |
| fz | Feng-Ze | Read file stream |
| fh | Feng-Huo | Read memory address |
| fl | Feng-Lei | Read hardware IO port |
| ff | Xun-Xun | Read array element |
| fs | Feng-Shui | Read struct member |
| fr | Feng-Shan | Dereference |
| fd | Feng-Di | Logical NOT |

### s_ Output (8)
| Opcode | Trigram | Function |
|--------|---------|----------|
| st | Shui-Tian | Write stdout |
| sz | Shui-Ze | Write file stream |
| sh | Shui-Huo | Write memory address |
| sl | Shui-Lei | Write hardware IO port |
| sf | Shui-Feng | Write array element |
| ss | Kan-Kan | Write struct member |
| sr | Shui-Shan | Pointer write |
| sd | Shui-Di | Debug / log output |

### r_ Memory (8)
| Opcode | Trigram | Function |
|--------|---------|----------|
| rt | Shan-Tian | Enter scope |
| rz | Shan-Ze | Exit scope |
| rh | Shan-Huo | Type cast |
| rl | Shan-Lei | Runtime type check |
| rf | Shan-Feng | Memset (zero) |
| rs | Shan-Shui | Free memory |
| rr | Gen-Gen | Malloc (heap alloc) |
| rd | Shan-Di | Memcpy |

### d_ Data (8)
| Opcode | Trigram | Function |
|--------|---------|----------|
| dt | Di-Tian | Integer literal |
| dz | Di-Ze | Null value |
| dh | Di-Huo | Left shift |
| dl | Di-Lei | Right shift |
| df | Di-Feng | Array literal |
| ds | Di-Shui | Struct literal |
| dr | Di-Shan | Bitwise NOT |
| dd | Kun-Kun | String literal |

## Build
```
cc -O2 -o lyc lyc.c
./lyc -c -obj source.ly -o output.bin
python3 tools/link.py output.bin executable
```

## Version
v0.8.0 — 64 instructions full set, self-hosted
