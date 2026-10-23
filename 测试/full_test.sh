#!/bin/bash
pass=0
fail=0
test() {
  expected=$1
  code=$2
  echo "$code" > 测试/t.wx
  result=$(timeout 2 ./测试/wx 测试/t.wx 2>&1)
  if [ "$result" = "$expected" ]; then
    echo "✓ $code = $expected"
    pass=$((pass+1))
  else
    echo "✗ $code 期望=$expected 实际=$result"
    fail=$((fail+1))
  fi
}

echo "=== 数字 ==="
test "0" "jj 0"
test "1" "jj 1"
test "123" "jj 123"
test "9999" "jj 9999"

echo "=== 表达式 ==="
test "3" "jj 1 ht 2"
test "2" "jj 5 hz 3"
test "20" "jj 4 hh 5"
test "5" "jj 10 hl 2"
test "1" "jj 10 hf 3"
test "7" "jj 1 ht 2 hh 3"
test "9" "jj 01 1 ht 2 02 hh 3"
test "14" "jj 2 ht 3 hh 4"
test "24" "jj 2 hh 3 hh 4"

echo "=== 比较 ==="
test "1" "jj 1 lt 2"
test "0" "jj 2 lt 1"
test "1" "jj 2 gt 1"
test "0" "jj 2 gt 3"
test "1" "jj 2 eq 2"
test "0" "jj 2 eq 3"
test "1" "jj 2 ne 3"
test "0" "jj 2 ne 2"

echo "=== 变量 ==="
test "42" $'tj a 42\njj a'
test "30" $'tj a 10\ntj b 20\njj a ht b'
test "100" $'tj x 5\ntj y 20\njj x hh y'
test "10" $'tj n 100\ntj n n hl 10\njj n'

echo "=== 字符串 ==="
test "hello" $'jj 03hello04'
test "a b c" $'jj 03a b c04'

echo "=== if ==="
test "yes" $'Xj 1\njj 03yes04\nXt'
test "" $'Xj 0\njj 03yes04\nXt'
test "else" $'Xj 0\njj 03yes04\nXs\njj 03else04\nXt'
test "yes" $'Xj 5 gt 3\njj 03yes04\nXt'
test "else" $'Xj 5 lt 3\njj 03yes04\nXs\njj 03else04\nXt'

echo "=== while ==="
test "0" $'tj i 0\nll i lt 1\njj i\nld'
test "0\n1" $'tj i 0\nll i lt 2\njj i\ntj i i ht 1\nld'
test "0\n1\n2" $'tj i 0\nll i lt 3\njj i\ntj i i ht 1\nld'

echo ""
echo "=== 结果: $pass 通过, $fail 失败 ==="
