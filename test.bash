#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Leftback
# SPDX-License-Identifier: BSD-3-Clause

ng() {
    echo NG at line ${1}
    res=1
}

res=0

# 正常なインプット
out=$(echo 1 | ./PCCS_color)
[ "${out}" = "1:pR/紫みの赤" ] || ng ${LINENO}

out=$(echo 2 | ./PCCS_color)
[ "${out}" = "2:R/赤" ] || ng ${LINENO}

out=$(echo 3 | ./PCCS_color)
[ "${out}" = "3:yR/黄みの赤" ] || ng ${LINENO}

out=$(echo 4 | ./PCCS_color)
[ "${out}" = "4:rO/赤みのだいだい" ] || ng ${LINENO}

out=$(echo 5 | ./PCCS_color)
[ "${out}" = "5:O/だいだい" ] || ng ${LINENO}

out=$(echo 6 | ./PCCS_color)
[ "${out}" = "6:yO/黄みのだいだい" ] || ng ${LINENO}

out=$(echo 7 | ./PCCS_color)
[ "${out}" = "7:rY/赤みの黄" ] || ng ${LINENO}

out=$(echo 8 | ./PCCS_color)
[ "${out}" = "8:Y/黄" ] || ng ${LINENO}

out=$(echo 9 | ./PCCS_color)
[ "${out}" = "9:gY/緑みの黄" ] || ng ${LINENO}

out=$(echo 10 | ./PCCS_color)
[ "${out}" = "10:YG/黄緑" ] || ng ${LINENO}

out=$(echo 11 | ./PCCS_color)
[ "${out}" = "11:yG/黄みの緑" ] || ng ${LINENO}

out=$(echo 12 | ./PCCS_color)
[ "${out}" = "12:G/緑" ] || ng ${LINENO}

out=$(echo 13 | ./PCCS_color)
[ "${out}" = "13:bG/青みの緑" ] || ng ${LINENO}

out=$(echo 14 | ./PCCS_color)
[ "${out}" = "14:BG/青緑" ] || ng ${LINENO}

out=$(echo 15 | ./PCCS_color)
[ "${out}" = "15:BG/青緑" ] || ng ${LINENO}

out=$(echo 16 | ./PCCS_color)
[ "${out}" = "16:gB/緑みの青" ] || ng ${LINENO}

out=$(echo 17 | ./PCCS_color)
[ "${out}" = "17:B/青" ] || ng ${LINENO}

out=$(echo 18 | ./PCCS_color)
[ "${out}" = "18:B/青" ] || ng ${LINENO}

out=$(echo 19 | ./PCCS_color)
[ "${out}" = "19:pB/紫みの青" ] || ng ${LINENO}

out=$(echo 20 | ./PCCS_color)
[ "${out}" = "20:V/青紫" ] || ng ${LINENO}

out=$(echo 21 | ./PCCS_color)
[ "${out}" = "21:bP/青みの紫" ] || ng ${LINENO}

out=$(echo 22 | ./PCCS_color)
[ "${out}" = "22:P/紫" ] || ng ${LINENO}

out=$(echo 23 | ./PCCS_color)
[ "${out}" = "23:rP/赤みの紫" ] || ng ${LINENO}

out=$(echo 24 | ./PCCS_color)
[ "${out}" = "24:RP/赤紫" ] || ng ${LINENO}

# 異常なインプット
out=$(echo 25 | ./PCCS_color)
[ "${out}" = "入力が範囲外です。1～24の数値を入力してください。" ] || ng ${LINENO}

out=$(echo 0 | ./PCCS_color)
[ "${out}" = "入力が範囲外です。1～24の数値を入力してください。" ] || ng ${LINENO}

out=$(echo -1 | ./PCCS_color)
[ "${out}" = "入力が範囲外です。1～24の数値を入力してください。" ] || ng ${LINENO}

out=$(echo 1.5 | ./PCCS_color)
[ "${out}" = "無効な入力です。数値を入力してください。" ] || ng ${LINENO}

out=$(echo a | ./PCCS_color)
[ "${out}" = "無効な入力です。数値を入力してください。" ] || ng ${LINENO}

out=$(echo "" | ./PCCS_color)
[ "${out}" = "無効な入力です。数値を入力してください。" ] || ng ${LINENO}

out=$(echo " " | ./PCCS_color)
[ "${out}" = "無効な入力です。数値を入力してください。" ] || ng ${LINENO}

# 全角数字のインプット
out=$(echo １ | ./PCCS_color)
[ "${out}" = "1:pR/紫みの赤" ] || ng ${LINENO}

out=$(echo ２ | ./PCCS_color)
[ "${out}" = "2:R/赤" ] || ng ${LINENO}

out=$(echo ２５ | ./PCCS_color)
[ "${out}" = "入力が範囲外です。1～24の数値を入力してください。" ] || ng ${LINENO}

out=$(echo ０ | ./PCCS_color)
[ "${out}" = "入力が範囲外です。1～24の数値を入力してください。" ] || ng ${LINENO}
