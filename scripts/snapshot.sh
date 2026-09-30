#!/usr/bin/env bash
# Archive the CURRENT pdf of a variant into its history/ folder before it is changed.
#
#   scripts/snapshot.sh <variant> ["note describing this version"]
#   scripts/snapshot.sh all       ["note"]
#
# Filenames are prefixed with a 10-digit DESCENDING sort key so that GitHub's
# ascending file listing shows the newest version at the top. See AGENTS.md.
set -euo pipefail
cd "$(dirname "$0")/.."

snapshot_one() {
  local dir="$1" note="${2:-}"
  local pdf
  pdf="$(find "$dir" -maxdepth 1 -name '*.pdf' | head -1)"
  [ -n "$pdf" ] || { echo "no PDF in $dir/" >&2; return 1; }
  local base today datenum comp seq key dest
  base="$(basename "$pdf" .pdf)"
  today="$(date +%F)"
  datenum="$(date +%Y%m%d)"
  comp=$(( 99999999 - 10#$datenum ))                       # newer date -> smaller number
  seq=$(( 99 - $(find "$dir/history" -name "${comp}*.pdf" | wc -l | tr -d ' ') ))
  key="${comp}$(printf '%02d' "$seq")"                     # later same day -> smaller number
  dest="$dir/history/${key}_${today}_${base}.pdf"
  cp "$pdf" "$dest"
  echo "archived -> $dest"
  "$(dirname "$0")/reindex.sh" "$dir" "$(basename "$dest")" "$note"
}

case "${1:-all}" in
  all) snapshot_one swe "${2:-}"; snapshot_one quant-trading "${2:-}" ;;
  swe|quant-trading) snapshot_one "$1" "${2:-}" ;;
  *) echo "usage: $0 <swe|quant-trading|all> [note]" >&2; exit 1 ;;
esac
