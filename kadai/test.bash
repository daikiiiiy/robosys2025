#!/usr/bin/env bash

# ====== 設定 ======
SCRIPT="main.py"   # Pythonファイル名 (必要に応じ変更)
IMAGE="test.jpg"   # テスト用画像 (プロジェクトに置く想定)

# ====== 実行チェック ======
echo "[INFO] Running image classification test..."

if [ ! -f "$IMAGE" ]; then
    echo "[ERROR] Test image '$IMAGE' not found."
    echo "Download or place a sample image named 'test.jpg' in this directory."
    exit 1
fi

python3 "$SCRIPT" "$IMAGE"

STATUS=$?

# ====== 結果出力 ======
if [ $STATUS -eq 0 ]; then
    echo "[SUCCESS] Script executed successfully."
else
    echo "[FAILED] Script returned an error (exit code: $STATUS)."
fi

exit $STATUS

