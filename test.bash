#!/bin/bash 

# SPDX-FileCopyrightText: 2025 Daiki Okamoto
# SPDX-License-Identifier: BSD-3-Clause

ng () {
	echo ${1}行目が違うよ
	res=1
}

res=0

out=$(./ unit 160 -u cm)
[ "${out}" = "1.6 m" ] || ng "$LINENO"

out=$(./ unit 700 -u g)
[ "${out}" = "0.7 kg" ] || ng "$LINENO"

out=$(./ unit 20 -u c)
[ "${out}" = "68.0 F" ] || ng "$LINENO"

[ "${res}" = 0 ] && echo OK
exit $res
