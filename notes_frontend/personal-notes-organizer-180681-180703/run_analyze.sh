#!/usr/bin/env bash
set -euo pipefail

# Allow override via environment variable
APP_DIR="${FLUTTER_APP_DIR:-"$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/notes_frontend"}"

if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[analyze] ERROR: Could not find pubspec.yaml at: $APP_DIR"
  echo "[analyze] Set FLUTTER_APP_DIR to your Flutter project path."
  exit 1
fi

echo "[analyze] Using Flutter app at: $APP_DIR"
cd "$APP_DIR"

echo "[analyze] flutter pub get"
flutter pub get

echo "[analyze] flutter analyze"
flutter analyze
