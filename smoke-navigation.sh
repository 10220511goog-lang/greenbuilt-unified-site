#!/usr/bin/env bash
set -euo pipefail

BASE_URL="${1:-http://127.0.0.1:4173}"
TMP_DIR="${TMPDIR:-/tmp}/greenbuilt-smoke"
mkdir -p "$TMP_DIR"

render_page() {
  local path="$1"
  local name="${path#/}"
  [[ -n "$name" ]] || name="home"
  local output="$TMP_DIR/${name//\//_}.html"
  chromium \
    --headless \
    --no-sandbox \
    --disable-gpu \
    --disable-dev-shm-usage \
    --virtual-time-budget=5000 \
    --dump-dom "$BASE_URL$path" > "$output" 2> "$TMP_DIR/${name//\//_}.log"
  echo "$output"
}

home_dom="$(render_page /)"
lab_dom="$(render_page /lab)"
sim_dom="$(render_page /micp-sim)"

grep -q "GreenBuilt" "$home_dom"
grep -q "MICP 生化自癒模擬器" "$home_dom"
grep -q "返回首頁" "$lab_dom"
grep -q "返回首頁" "$sim_dom"
grep -q 'href="/"' "$lab_dom"
grep -q 'href="/"' "$sim_dom"

echo "PASS: 首頁載入並包含 MICP 模擬器入口"
echo "PASS: /lab 載入並包含返回首頁連結"
echo "PASS: /micp-sim 載入並包含返回首頁連結"
