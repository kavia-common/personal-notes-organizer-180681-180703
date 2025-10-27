#!/usr/bin/env bash
# Unified CI entrypoint to run Flutter checks from repo root.
# This script changes into the app directory and runs pub get, analyze, and tests.
set -euo pipefail

APP_DIR="personal-notes-organizer-180681-180703/notes_frontend"

if [ ! -d "$APP_DIR" ] || [ ! -f "$APP_DIR/pubspec.yaml" ]; then
  echo "Error: Flutter app directory not found: $APP_DIR"
  exit 1
fi

echo "Changing directory to: $APP_DIR"
cd "$APP_DIR"

echo "Running flutter pub get..."
flutter pub get

echo "Running flutter analyze..."
flutter analyze

echo "Running flutter test..."
flutter test

echo "All mobile checks completed successfully."
