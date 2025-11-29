#!/usr/bin/python3
# SPDX-FileCopyrightText: 2025 Daiki Okamoto
# SPDX-License-Identifier: BSD-3-Clause

import sys

op = sys.argv[1]
nums = list(map(float, sys.argv[2:]))

result = nums[0]

for n in nums[1:]:
    if op == "+": result += n
    elif op == "-": result -= n
    elif op in ("x","*"): result *= n
    elif op == "/": result /= n

print(result)
