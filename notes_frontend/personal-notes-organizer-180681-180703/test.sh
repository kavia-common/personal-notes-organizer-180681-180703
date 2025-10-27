#!/usr/bin/env bash
set -euo pipefail

APP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/notes_frontend"

if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[test.sh] ERROR: Could not find Flutter project at $APP_DIR"
  exit 1
fi

echo "[test.sh] Switching to: $APP_DIR"
cd "$APP_DIR"

echo "[test.sh] flutter pub get"
flutter pub get

echo "[test.sh] flutter test"
CI=true flutter test --no-pub
