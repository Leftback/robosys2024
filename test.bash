#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Leftback
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo NG at Line $1
    res=1
}

res=0

### NORMAL INPUT ###
out=$(seq 5 | ./statistics)
[ "${out}" = 15 ] || ng $LINENO

### STRANGE INPUT ###
out=$(echo あ | ./statistics)
[ "$?" = 1 ]      || ng $LINENO
[ "${out}" = "" ] || ng $LINENO

out=$(echo | ./statistics)
[ "$?" = 1 ]      || ng $LINENO
[ "${out}" = "" ] || ng $LINENO

[ "$res" = 0 ] && echo OK
exit $res
