#!/usr/bin/env bash
# Insert a row at the TOP of the history table in <variant>/README.md.
#   scripts/reindex.sh <variant> <archived-filename> [note]
set -euo pipefail
cd "$(dirname "$0")/.."
dir="$1"; fname="$2"; note="${3:-}"
readme="$dir/README.md"
date_part="$(echo "$fname" | sed -E 's/^[0-9]{10}_([0-9]{4}-[0-9]{2}-[0-9]{2})_.*/\1/')"
[ -n "$note" ] || note="(no note)"
row="| $date_part | [\`$fname\`](history/$fname) | $note |"
# insert directly beneath the table's separator line so newest stays on top
awk -v row="$row" '
  /^\|---/ && !done { print; print row; done=1; next } { print }
' "$readme" > "$readme.tmp" && mv "$readme.tmp" "$readme"
echo "indexed -> $readme"
