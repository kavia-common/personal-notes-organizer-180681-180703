#!/usr/bin/env bash
set -euo pipefail

APP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/notes_frontend"

if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[analyze.sh] ERROR: Could not find Flutter project at $APP_DIR"
  exit 1
fi

echo "[analyze.sh] Switching to: $APP_DIR"
cd "$APP_DIR"

echo "[analyze.sh] flutter pub get"
flutter pub get

echo "[analyze.sh] flutter analyze"
flutter analyze
