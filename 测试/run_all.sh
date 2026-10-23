#!/bin/bash
pass=0
fail=0
test() {
  expected=$1
  code=$2
  echo "$code" > 测试/t.wx
  result=$(./测试/wx 测试/t.wx 2>&1)
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
test "9" "jj 9"
test "10" "jj 10"
test "99" "jj 99"
test "100" "jj 100"
test "1000" "jj 1000"
test "12345" "jj 12345"

echo "=== 加减 ==="
test "2" "jj 1 ht 1"
test "0" "jj 5 hz 5"
test "5" "jj 10 hz 5"
test "100" "jj 50 ht 50"
test "999" "jj 1000 hz 1"

echo "=== 乘除 ==="
test "0" "jj 0 hh 100"
test "100" "jj 1 hh 100"
test "49" "jj 7 hh 7"
test "1" "jj 10 hl 10"
test "3" "jj 9 hl 3"
test "0" "jj 5 hl 10"

echo "=== 取模 ==="
test "0" "jj 10 hf 10"
test "1" "jj 10 hf 3"
test "2" "jj 10 hf 4"
test "0" "jj 100 hf 10"
test "5" "jj 100 hf 15"

echo "=== 优先级 ==="
test "7" "jj 1 ht 2 hh 3"
test "9" "jj 01 1 ht 2 02 hh 3"
test "22" "jj 2 ht 3 hh 4 hz 5"
test "14" "jj 2 ht 3 hh 4"
test "11" "jj 2 hh 3 ht 5"
test "8" "jj 2 hh 3 ht 2"
test "7" "jj 2 ht 3 hl 3"
test "5" "jj 10 hz 3 hh 2"
test "1" "jj 10 hf 3 ht 1 hz 1"

echo "=== 括号嵌套 ==="
test "27" "jj 01 01 1 ht 2 02 hh 3 02 ht 6"
test "1" "jj 01 01 01 1 ht 1 02 hh 1 02 ht 1 02"
test "30" "jj 01 2 ht 3 02 hh 01 4 ht 2 02 hl 1"
test "6" "jj 2 hh 01 1 ht 2 02"
test "14" "jj 01 2 ht 01 3 hh 4 02 02"

echo "=== 连续运算 ==="
test "15" "jj 1 ht 2 ht 3 ht 4 ht 5"
test "120" "jj 1 hh 2 hh 3 hh 4 hh 5"
test "9" "jj 100 hl 10 hl 2 hl 5"
test "0" "jj 10 hz 1 hz 2 hz 3 hz 4"

echo "=== 混合复杂 ==="
test "10" "jj 1 ht 2 hh 3 ht 4 hz 1"
test "1" "jj 01 5 ht 3 02 hf 7"
test "16" "jj 01 2 hh 3 ht 1 02 hh 2"
test "0" "jj 01 10 hl 2 02 hz 01 3 hh 5 02"
test "2" "jj 01 01 1 ht 1 02 hh 1 02 ht 01 1 ht 1 02"

echo ""
echo "=== 结果: $pass 通过, $fail 失败 ==="
