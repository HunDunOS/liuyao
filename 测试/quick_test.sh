#!/bin/bash
pass=0
fail=0
test() {
  expected=$1
  code=$2
  echo "$code" > 测试/t.wx
  result=$(timeout 2 ./测试/wx 测试/t.wx 2>&1)
  if [ "$result" = "$expected" ]; then
    echo "✓ $3"
    pass=$((pass+1))
  else
    echo "✗ $3 期望=$expected 实际=$result"
    fail=$((fail+1))
  fi
}

test "123" "jj 123" "数字打印"
test "hello" $'jj 03hello04' "字符串打印"
test "30" $'tj a 10\ntj b 20\njj a ht b' "变量相加"
test "7" "jj 1 ht 2 hh 3" "优先级"
test "9" "jj 01 1 ht 2 02 hh 3" "括号"
test "1" "jj 5 gt 3" "比较gt"
test "0" "jj 5 lt 3" "比较lt假"
test "1" "jj 5 eq 5" "比较eq"
test "yes" $'Xj 5 gt 3\njj 03yes04\nXt' "if真"
test "else" $'Xj 5 lt 3\njj 03yes04\nXs\njj 03else04\nXt' "if else"
test "0\n1\n2" $'tj i 0\nll i lt 3\njj i\ntj i i ht 1\nld' "while循环"
test "10" $'tj i 0\ntj s 0\nll i lt 5\ntj s s ht i\ntj i i ht 1\nld\njj s' "循环累加"
test "0\n1\n2\n3" $'tj i 0\nll i lt 10\njj i\nXj i eq 3\nDj\nXt\ntj i i ht 1\nld' "break"

echo ""
echo "结果: $pass 通过, $fail 失败"
