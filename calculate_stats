#!/usr/bin/env python3
# SPDX-FileCopyrightText: 2024 Leftback
# SPDX-License-Identifier: BSD-3-Clause

from statistics import mean, median, mode, StatisticsError, variance, stdev

def calculate_statistics(numbers):
    nums = [float(num) for num in numbers.split(',')]

    try:
        mode_val = mode(nums)
    except StatisticsError:
        mode_val = "No unique mode"

    stats = {
        "平均値": round(mean(nums), 2),
        "最頻値": mode_val,
        "中央値": round(median(nums), 2),
        "最大値": round(max(nums), 2),
        "最小値": round(min(nums), 2),
        "範囲": round(max(nums) - min(nums), 2),
        "分散": round(variance(nums), 2),
        "標準偏差": round(stdev(nums), 2)
    }

    for key, value in stats.items():
        print(f"{key}: {value}")

# Example usage
numbers = input("数列をカンマ区切りで入力: ")
calculate_statistics(numbers)
