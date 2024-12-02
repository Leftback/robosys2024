#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Leftback
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "NG at Line $1"
    res=1
}

res=0

### NORMAL INPUT ###
out=$(echo "1,2,3,4,5" | python3 statistics_command.py)
expected="平均値: 3.0
中央値: 3.0
最大値: 5
最小値: 1
範囲: 4.0
第一四分位数: 1.5
第二四分位数（中央値）: 3.0
第三四分位数: 4.5
四分位偏差: 1.5
分散: 2.5
標準偏差: 1.581"

if [ "$out" != "$expected" ]; then
    echo -e "Expected:\n$expected"
    echo -e "Got:\n$out"
    ng $LINENO
fi

### STRANGE INPUT ###
out=$(echo "あ" | python3 statistics_command.py 2>&1)
if [ "$?" -ne 1 ]; then
    ng $LINENO
fi
if [[ "$out" != *"入力エラー: 数列はカンマ区切りの整数で入力してください。"* ]]; then
    ng $LINENO
fi

out=$(echo "" | python3 statistics_command.py 2>&1)
if [ "$?" -ne 1 ]; then
    ng $LINENO
fi
if [[ "$out" != *"入力エラー: 数列はカンマ区切りの整数で入力してください。"* ]]; then
    ng $LINENO
fi

[ "$res" -eq 0 ] && echo "OK"
exit $res

