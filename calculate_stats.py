#!/usr/bin/env python3
# SPDX-FileCopyrightText: 2024 Leftback
# SPDX-License-Identifier: BSD-3-Clause

from statistics import mean, median, mode, StatisticsError

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
        "第一四分位数": round(percentile(nums, 25), 2),
        "第二四分位数（中央値）": round(percentile(nums, 50), 2),
        "第三四分位数": round(percentile(nums, 75), 2),
        "四分位偏差": round(percentile(nums, 75) - percentile(nums, 25), 2),
        "分散": round(variance(nums), 2),
        "標準偏差": round(stdev(nums), 2)
    }

    for key, value in stats.items():
        print(f"{key}: {value}")

def percentile(data, percentile):
    size = len(data)
    sorted_data = sorted(data)
    index = (size - 1) * percentile / 100
    floor_index = int(index)
    ceil_index = floor_index + 1
    if ceil_index >= size:
        return sorted_data[floor_index]
    return sorted_data[floor_index] * (ceil_index - index) + sorted_data[ceil_index] * (index - floor_index)

def variance(data):
    m = mean(data)
    return sum((x - m) ** 2 for x in data) / len(data)

def stdev(data):
    return variance(data) ** 0.5

# Example usage
numbers = input("数列をカンマ区切りで入力: ")
calculate_statistics(numbers)
