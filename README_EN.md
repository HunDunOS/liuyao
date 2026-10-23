# Wuxing Script Language Interpreter

## Introduction
A scripting language interpreter, V12 ultimate matrix, 45 instructions + platform detection.

## Punctuation Encoding
```
01 = (    02 = )    03 = "    04 = "    05 = ;
06 = /    07 = \    08 = {    09 = }    00 = #
```

## Core Matrix 5×5 = 25

### j Metal (I/O & Text Stream)
| Opcode | Trigram | Function |
|--------|---------|----------|
| jj | Jin-Jin | Print |
| jm | Jin-Mu | Formatted output |
| js | Jin-Shui | User input |
| jh | Jin-Huo | Read file |
| jt | Jin-Tu | Write file |

### m Wood (Data Structure & Serialization)
| Opcode | Trigram | Function |
|--------|---------|----------|
| mj | Mu-Jin | String operations |
| mm | Mu-Mu | List operations |
| ms | Mu-Shui | Dict / Map |
| mh | Mu-Huo | JSON serialize |
| mt | Mu-Tu | Type conversion |

### s Water (System & Concurrency)
| Opcode | Trigram | Function |
|--------|---------|----------|
| sj | Shui-Jin | Run shell command |
| sm | Shui-Mu | Environment variables |
| ss | Shui-Shui | System time |
| sh | Shui-Huo | Directory walk |
| st | Shui-Tu | Thread lock / semaphore |

### h Fire (OOP & Metaprogramming)
| Opcode | Trigram | Function |
|--------|---------|----------|
| hj | Huo-Jin | Define function |
| hm | Huo-Mu | Return / yield |
| hs | Huo-Shui | Try-catch exception |
| hh | Huo-Huo | Define class |
| ht | Huo-Tu | Import module / FFI |

### t Earth (Advanced Memory & Regex)
| Opcode | Trigram | Function |
|--------|---------|----------|
| tj | Tu-Jin | Variable declaration |
| tm | Tu-Mu | Regex match |
| ts | Tu-Shui | Context manager (with) |
| th | Tu-Huo | Reference / deref / weakref |
| tt | Tu-Tu | GC / manual free |

## Four Seasons Control Matrix 4×5 = 20

### C Spring (Loops)
| Opcode | Trigram | Function |
|--------|---------|----------|
| Cj | Chun-Jin | for loop start |
| Cm | Chun-Mu | loop condition |
| Cs | Chun-Shui | loop step (i++) |
| Ch | Chun-Huo | for-each iterator |
| Ct | Chun-Tu | loop end |

### X Summer (Branching)
| Opcode | Trigram | Function |
|--------|---------|----------|
| Xj | Xia-Jin | if |
| Xm | Xia-Mu | else if |
| Xs | Xia-Shui | else |
| Xh | Xia-Huo | match / switch |
| Xt | Xia-Tu | branch end |

### Q Autumn (Network)
| Opcode | Trigram | Function |
|--------|---------|----------|
| Qj | Qiu-Jin | HTTP GET |
| Qm | Qiu-Mu | HTTP POST / upload |
| Qs | Qiu-Shui | File download / resume |
| Qh | Qiu-Huo | URL parse / headers |
| Qt | Qiu-Tu | Raw Socket / TCP / UDP |

### D Winter (Async & Process)
| Opcode | Trigram | Function |
|--------|---------|----------|
| Dj | Dong-Jin | break |
| Dm | Dong-Mu | continue |
| Ds | Dong-Shui | exit program |
| Dh | Dong-Huo | async / await |
| Dt | Dong-Tu | subprocess / multiprocess |

## Platform Detection
- win — detect Windows
- lin — detect Linux
- hun — detect HundunOS

## Version
v1.0.0 — V12 full matrix aligned
