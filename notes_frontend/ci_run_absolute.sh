#!/usr/bin/env bash
# Absolute-path CI entry to always run from the Flutter app directory.
set -euo pipefail

APP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "CI (absolute): using app dir $APP_DIR"
cd "$APP_DIR"

echo "flutter pub get"
flutter pub get

echo "flutter analyze"
flutter analyze

echo "flutter test"
flutter test

echo "CI (absolute): done"
