#!/bin/bash -xv
# SPDX-FileCopyrightText: 2024 Leftback

out=$(seq 5 | ./plus)

[ "${out}" = 15 ]

