#!/usr/bin/env bash
# Universal CI entry: discover Flutter app dir and run checks.
set -euo pipefail

ROOT="personal-notes-organizer-180681-180703"
APP_DIR="$ROOT/notes_frontend"

# Try explicit path first
if [ ! -f "$APP_DIR/pubspec.yaml" ] || [ ! -f "$APP_DIR/lib/main.dart" ]; then
  # Fallback: discovery
  if [ -f "$ROOT/find_flutter_app_dir.sh" ]; then
    APP_DIR="$(bash "$ROOT/find_flutter_app_dir.sh")"
  fi
fi

if [ -z "${APP_DIR:-}" ] || [ ! -f "$APP_DIR/pubspec.yaml" ] || [ ! -f "$APP_DIR/lib/main.dart" ]; then
  echo "ERROR: Could not determine Flutter app directory."
  echo "Hint: Expected at $ROOT/notes_frontend"
  echo "Manual steps:"
  echo "  cd $ROOT/notes_frontend && flutter pub get && flutter analyze && flutter test"
  exit 5
fi

echo "CI: Using Flutter app at: $APP_DIR"
cd "$APP_DIR"

echo "flutter pub get"
flutter pub get
echo "flutter analyze"
flutter analyze
echo "flutter test"
flutter test

echo "CI: Mobile checks completed."
