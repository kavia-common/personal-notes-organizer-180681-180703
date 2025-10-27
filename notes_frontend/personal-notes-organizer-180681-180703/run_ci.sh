#!/usr/bin/env bash
# Generic CI shim: detects Flutter app dir from .flutter_app_dir and runs checks there.
set -euo pipefail

ROOT_DIR="personal-notes-organizer-180681-180703"
POINTER_FILE="$ROOT_DIR/.flutter_app_dir"

if [ ! -f "$POINTER_FILE" ]; then
  echo "Error: $POINTER_FILE not found. Cannot determine Flutter app directory."
  exit 1
fi

APP_SUBDIR="$(cat "$POINTER_FILE" | tr -d '[:space:]')"
APP_DIR="$ROOT_DIR/$APP_SUBDIR"

if [ ! -f "$APP_DIR/pubspec.yaml" ] || [ ! -f "$APP_DIR/lib/main.dart" ]; then
  echo "Error: Flutter app not found at $APP_DIR (missing pubspec.yaml or lib/main.dart)."
  exit 2
fi

echo "Changing to Flutter app directory: $APP_DIR"
cd "$APP_DIR"

echo "Running flutter pub get..."
flutter pub get

echo "Running flutter analyze..."
flutter analyze

echo "Running flutter test..."
flutter test

echo "CI run completed."
