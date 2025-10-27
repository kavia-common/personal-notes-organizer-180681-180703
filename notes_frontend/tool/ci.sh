#!/usr/bin/env bash
set -euo pipefail

# Ensure we are at the Flutter project root.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
cd "$PROJECT_ROOT"

echo "[ci] Project root: $PROJECT_ROOT"
echo "[ci] Flutter version:"
flutter --version || true

echo "[ci] pub get"
flutter pub get

echo "[ci] analyze"
flutter analyze

echo "[ci] test"
CI=true flutter test --no-pub
