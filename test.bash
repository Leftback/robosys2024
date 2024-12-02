#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Leftback
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "NG at Line $1"
    res=1
}

res=0

### 正常な入力 ###
out=$(echo "1,2,3,4,5" | python3 statistics.py)
expected="平均値: 3.0
最頻値: No unique mode
中央値: 3.0
最大値: 5.0
最小値: 1.0
範囲: 4.0
第一四分位数: 2.0
第二四分位数（中央値）: 3.0
第三四分位数: 4.0
四分位偏差: 2.0
分散: 2.0
標準偏差: 1.4142135623730951"

if [ "$out" != "$expected" ]; then
    echo -e "Expected:\n$expected"
    echo -e "Got:\n$out"
    ng $LINENO
fi

### 異常な入力 ###
out=$(echo "あ" | python3 statistics.py 2>&1)
if [ "$?" -ne 1 ]; then
    ng $LINENO
fi
if [[ "$out" != *"could not convert string to float"* ]]; then
    ng $LINENO
fi

out=$(echo "" | python3 statistics.py 2>&1)
if [ "$?" -ne 1 ]; then
    ng $LINENO
fi
if [[ "$out" != *"could not convert string to float"* ]]; then
    ng $LINENO
fi

[ "$res" -eq 0 ] && echo "OK"
exit $res
