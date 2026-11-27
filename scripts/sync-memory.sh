#!/usr/bin/env bash
# Mirror TayTay's Bot memory notes into memory/. Usage: scripts/sync-memory.sh [memory_dir]
# Copies the Markdown notes; skips state/ (working state) and files/ (the song catalog lives in data/).
set -euo pipefail
src="${1:-$HOME/memory/taytay_b9f97e}"
dest="$(cd "$(dirname "$0")/.." && pwd)/memory"
rm -rf "$dest"
mkdir -p "$dest"
cd "$src"
find . -name '*.md' -not -path './state/*' -not -path './files/*' -not -path './.git/*' -print0 |
  while IFS= read -r -d '' f; do
    mkdir -p "$dest/$(dirname "$f")"
    cp "$f" "$dest/$f"
  done
cmp -s files/taylor-swift/songs.json "$dest/../data/songs.json" || echo "note: data/songs.json differs from memory catalog" >&2
cmp -s files/taylor-swift/songs.csv "$dest/../data/songs.csv" || echo "note: data/songs.csv differs from memory catalog" >&2
