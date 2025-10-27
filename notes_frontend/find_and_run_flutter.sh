#!/usr/bin/env bash
set -euo pipefail

# Find the Flutter project by searching for pubspec.yaml that contains "flutter:"
WORKSPACE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR=""
while IFS= read -r -d '' file; do
  if grep -q "^flutter:" "$file"; then
    APP_DIR="$(dirname "$file")"
    break
  fi
done < <(find "$WORKSPACE_ROOT" -maxdepth 3 -name pubspec.yaml -print0)

if [ -z "$APP_DIR" ]; then
  echo "[find_and_run_flutter] ERROR: Could not locate a Flutter project (pubspec.yaml with flutter:)."
  exit 1
fi

echo "[find_and_run_flutter] Found Flutter project at: $APP_DIR"
cd "$APP_DIR"

echo "[find_and_run_flutter] flutter pub get"
flutter pub get

echo "[find_and_run_flutter] flutter analyze"
flutter analyze

echo "[find_and_run_flutter] flutter test"
CI=true flutter test --no-pub
