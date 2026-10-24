#!/bin/bash
pass=0
fail=0
test() {
  desc=$1
  code=$2
  echo "$code" > /tmp/t.ly
  ./lyc -c -obj /tmp/t.ly -o /tmp/t.bin 2>/dev/null
  python3 工具/小链接.py /tmp/t.bin /tmp/t 2>/dev/null
  chmod +x /tmp/t
  result=$(timeout 2 /tmp/t 2>&1)
  expected=$3
  if [ "$result" = "$expected" ]; then
    echo "✓ $desc"
    pass=$((pass+1))
  else
    echo "✗ $desc 期望=$expected 实际=$result"
    fail=$((fail+1))
  fi
}

test "数字打印" 'tt zhu 01 02 -> u64 08
    st dt 123
    zz 0
09' "123"

test "字符串打印" 'tt zhu 01 02 -> u64 08
    st dd 03hello world04
    zz 0
09' "hello world"

test "加法" 'tt zhu 01 02 -> u64 08
    tz a = 1
    tz b = 2
    tz c = a ht b
    st dt c
    zz 0
09' "3"

test "乘法优先级" 'tt zhu 01 02 -> u64 08
    tz a = 1 ht 2 hh 3
    st dt a
    zz 0
09' "7"

echo ""
echo "结果: $pass 通过, $fail 失败"
