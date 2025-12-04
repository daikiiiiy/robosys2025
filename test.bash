#!/bin/bash 
# SPDX-FileCopyrightText: 2025 Daiki Okamoto 
# SPDX-License-Identifier: BSD-3-Clause 

ng () {
    echo "$1行目が違うよ"
    res=1
}
res=0

out=$(./kadai 2 4)
[ "${out}" = 8.0 ] || ng "$LINENO"

out=$(./kadai -2 3)
[ "${out}" = -6.0 ] || ng "$LINENO"

out=$(./kadai 2 a 2>/dev/null)
[ "$?" = 1 ] || ng "$LINENO" 
[ "${out}" = "" ] || ng "$LINENO"

[ "$res" = 0 ] && echo OK
exit $res
