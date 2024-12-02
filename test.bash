#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Leftback
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "NG at Line $1"
    res=1
}

res=0

### NORMAL INPUT ###
out=$(echo "1,2,3,4,5" | python3 statistics_with_test.py)
expected="平均値: 3
最頻値: No unique mode
中央値: 3
最大値: 5
最小値: 1
範囲: 4
第一四分位数: 1.5
第二四分位数（中央値）: 3
第三四分位数: 4.5
四分位偏差: 1.5
分散: 2.5
標準偏差: 1.58"

if [ "$out" != "$expected" ]; then
    echo "Expected:\n$expected"
    echo "Got:\n$out"
    ng $LINENO
fi

### STRANGE INPUT ###
out=$(echo "あ" | python3 statistics_with_test.py 2>&1)
if [ "$?" -ne 1 ]; then
    ng $LINENO
fi
if [[ "$out" != *"入力エラー: 数列はカンマ区切りの整数で入力してください。"* ]]; then
    ng $LINENO
fi

out=$(echo "" | python3 statistics_with_test.py 2>&1)
if [ "$?" -ne 1 ]; then
    ng $LINENO
fi
if [[ "$out" != *"入力エラー: 数列はカンマ区切りの整数で入力してください。"* ]]; then
    ng $LINENO
fi

[ "$res" -eq 0 ] && echo "OK"
exit $res

