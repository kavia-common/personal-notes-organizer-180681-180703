#!/usr/bin/env bash
set -euo pipefail

echo "PWD: $(pwd)"
echo "Looking for pubspec.yaml in current and parent directories..."

check_dir() {
  local d="$1"
  if [ -f "$d/pubspec.yaml" ]; then
    echo "Found Flutter project root at: $d"
    ls -la "$d"
    exit 0
  fi
}

check_dir "."
check_dir ".."
check_dir "../.."

echo "pubspec.yaml not found near current directory."
echo "Expected root: personal-notes-organizer-180681-180703/notes_frontend"
exit 1
