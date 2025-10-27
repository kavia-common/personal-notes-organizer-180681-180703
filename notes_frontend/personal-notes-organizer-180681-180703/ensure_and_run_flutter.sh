#!/usr/bin/env bash
# Robust CI entrypoint: find Flutter app, verify it, cd, then run pub get/analyze/test.
set -euo pipefail

ROOT_DIR="personal-notes-organizer-180681-180703"
APP_DIR="$ROOT_DIR/notes_frontend"

# Fallback to discovery if expected path is missing
if [ ! -f "$APP_DIR/pubspec.yaml" ] || [ ! -f "$APP_DIR/lib/main.dart" ]; then
  if [ -f "$ROOT_DIR/find_flutter_app_dir.sh" ]; then
    APP_DIR="$(bash "$ROOT_DIR/find_flutter_app_dir.sh")"
  fi
fi

if [ -z "${APP_DIR:-}" ] || [ ! -f "$APP_DIR/pubspec.yaml" ] || [ ! -f "$APP_DIR/lib/main.dart" ]; then
  echo "Error: Could not determine Flutter app directory. Looked at $ROOT_DIR/notes_frontend and discovery."
  exit 1
fi

echo "Using Flutter app at: $APP_DIR"
cd "$APP_DIR"

echo "Running: flutter pub get"
flutter pub get

echo "Running: flutter analyze"
flutter analyze

echo "Running: flutter test"
flutter test

echo "Flutter checks completed successfully."
