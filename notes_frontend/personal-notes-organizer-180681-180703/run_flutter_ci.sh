#!/usr/bin/env bash
set -euo pipefail

# Resolve workspace root (this script is at workspace root).
WORKSPACE_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$WORKSPACE_ROOT/notes_frontend"

if [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "[error] Flutter project not found at $APP_DIR"
  ls -la "$WORKSPACE_ROOT" || true
  exit 1
fi

echo "[ci] Changing directory to: $APP_DIR"
cd "$APP_DIR"

echo "[ci] flutter pub get"
flutter pub get

echo "[ci] flutter analyze"
flutter analyze

echo "[ci] flutter test"
CI=true flutter test --no-pub
