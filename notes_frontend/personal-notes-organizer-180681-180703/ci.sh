#!/usr/bin/env bash
set -euo pipefail

# Workspace-level CI entrypoint.
# Ensures Flutter commands run inside the Flutter app directory.

APP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/notes_frontend"

if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[ci] ERROR: Flutter project not found at $APP_DIR"
  exit 1
fi

echo "[ci] Switching to $APP_DIR"
cd "$APP_DIR"

echo "[ci] flutter pub get"
flutter pub get

echo "[ci] flutter analyze"
flutter analyze

echo "[ci] flutter test"
CI=true flutter test --no-pub
