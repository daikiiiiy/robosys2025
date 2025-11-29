#!/bin/bash 
# SPDX-FileCopyrightText: 2025 Daiki Okamoto
# SPDX-License-Identifier: BSD-3-Clause

ng () {
	echo ${1}行目が違うよ
	res=1
}

res=0

out=$(./kadai - 30 15)
[ "${out}" = "15" ] || ng "$LINENO"

out=$(echo a | ./kadai)
[ "$?" = 1 ]
[ "${out}" = "" ] || ng "$LINENO"

out=$(echo | ./kadai)
[ "$?" = 1 ]
[ "${out}" = "" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res
