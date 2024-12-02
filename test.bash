#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Leftback
# SPDX-License-Identifier: BSD-3-Clause

# テストケースを実行する関数
run_test() {
    input="$1"
    expected_output="$2"
    out=$(echo "$input" | ./calculate_stats.py)
    [ "$out" != *"$expected_output"* ] || ng "$LINENO"
}

# テストケース
run_test "1,2,3,4,5" "平均値: 3.0"
run_test "1,1,1,1,1" "最頻値: 1.0"
run_test "1,2,3,4,5" "中央値: 3.0"
run_test "1,2,3,4,5" "最大値: 5.0"
run_test "1,2,3,4,5" "最小値: 1.0"
run_test "1,2,3,4,5" "範囲: 4.0"
run_test "1,2,3,4,5" "第一四分位数: 1.5"
run_test "1,2,3,4,5" "第二四分位数（中央値）: 3.0"
run_test "1,2,3,4,5" "第三四分位数: 4.5"
run_test "1,2,3,4,5" "四分位偏差: 3.0"
run_test "1,2,3,4,5" "分散: 2.5"
run_test "1,2,3,4,5" "標準偏差: 1.58"

