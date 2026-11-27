#!/usr/bin/env bash
# Mirror TayTay's Bot memory notes into memory/. Usage: scripts/sync-memory.sh [memory_dir]
# Copies the Markdown notes; skips state/ (working state) and files/ (the song catalog lives in data/).
set -euo pipefail
src="${1:-$HOME/memory/taytay_b9f97e}"
repo="$(cd "$(dirname "$0")/.." && pwd)"
dest="$repo/memory"
cd "$src"
tmp="$(mktemp -d "$repo/.memory.XXXXXX")"
trap 'rm -rf "$tmp"' EXIT
chmod 755 "$tmp"
find . -name '*.md' -not -path './state/*' -not -path './files/*' -not -path './.git/*' -print0 |
  while IFS= read -r -d '' f; do
    mkdir -p "$tmp/$(dirname "$f")"
    cp "$f" "$tmp/$f"
  done
rm -rf "$dest"
mv "$tmp" "$dest"
cmp -s files/taylor-swift/songs.json "$repo/data/songs.json" || echo "note: data/songs.json differs from memory catalog" >&2
cmp -s files/taylor-swift/songs.csv "$repo/data/songs.csv" || echo "note: data/songs.csv differs from memory catalog" >&2
