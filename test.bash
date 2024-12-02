#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Leftback
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo "NG at Line $1"
    res=1
}

res=0

### 正常な入力 ###
out=$(echo "1,2,3,4,5" | python3 calculate_stats.py)
[[ "$out" == *"平均値: 3.0"* ]] || ng "$LINENO"
[[ "$out" == *"最頻値: No unique mode"* ]] || ng "$LINENO"
[[ "$out" == *"中央値: 3.0"* ]] || ng "$LINENO"
[[ "$out" == *"最大値: 5.0"* ]] || ng "$LINENO"
[[ "$out" == *"最小値: 1.0"* ]] || ng "$LINENO"
[[ "$out" == *"範囲: 4.0"* ]] || ng "$LINENO"
[[ "$out" == *"第一四分位数: 2.0"* ]] || ng "$LINENO"
[[ "$out" == *"第二四分位数（中央値）: 3.0"* ]] || ng "$LINENO"
[[ "$out" == *"第三四分位数: 4.0"* ]] || ng "$LINENO"
[[ "$out" == *"四分位偏差: 2.0"* ]] || ng "$LINENO"
[[ "$out" == *"分散: 2.0"* ]] || ng "$LINENO"
[[ "$out" == *"標準偏差: 1.41"* ]] || ng "$LINENO"

### 異常な入力 ###
out=$(echo "あ" | python3 calculate_stats.py 2>&1)
[ "$?" -ne 1 ] && ng "$LINENO"
[[ "$out" == *"could not convert string to float"* ]] || ng "$LINENO"

out=$(echo "" | python3 calculate_stats.py 2>&1)
[ "$?" -ne 1 ] && ng "$LINENO"
[[ "$out" == *"could not convert string to float"* ]] || ng "$LINENO"

[ "$res" -eq 0 ] && echo "OK"
exit $res
