#!/usr/bin/env python3
# SPDX-FileCopyrightText: 2024 Leftback
# SPDX-License-Identifier: BSD-3-Clause

import statistics
import sys

def calculate_statistics(numbers):
    # 平均値
    mean = round(statistics.mean(numbers), 3)

    # 中央値
    median = round(statistics.median(numbers), 3)

    # 最大値
    maximum = max(numbers)

    # 最小値
    minimum = min(numbers)

    # 範囲（最大値と最小値の差）
    range_value = round(maximum - minimum, 3)

    # 四分位数
    quantiles = statistics.quantiles(numbers, n=4)
    q1 = round(quantiles[0], 3)
    q2 = round(statistics.median(numbers), 3)
    q3 = round(quantiles[2], 3)

    # 四分位偏差
    quartile_deviation = round((q3 - q1) / 2, 3)

    # 分散
    variance = round(statistics.variance(numbers), 3)

    # 標準偏差
    stdev = round(statistics.stdev(numbers), 3)

    return {
        "平均値": mean,
        "中央値": median,
        "最大値": maximum,
        "最小値": minimum,
        "範囲": range_value,
        "第一四分位数": q1,
        "第二四分位数（中央値）": q2,
        "第三四分位数": q3,
        "四分位偏差": quartile_deviation,
        "分散": variance,
        "標準偏差": stdev
    }

def main():
    try:
        numbers_input = input().strip()
        numbers = list(map(int, numbers_input.split(',')))
        stats = calculate_statistics(numbers)

        for key, value in stats.items():
            print(f"{key}: {value}")
    except ValueError:
        print("入力エラー: 数列はカンマ区切りの整数で入力してください。")
        sys.exit(1)

if __name__ == "__main__":
    main()

