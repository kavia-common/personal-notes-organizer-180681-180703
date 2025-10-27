#!/usr/bin/env bash
# Conventional CI entry script: run Flutter checks from the correct app directory.
set -euo pipefail

APP_DIR="personal-notes-organizer-180681-180703/notes_frontend"

echo "CI: Switching to Flutter app directory: $APP_DIR"
cd "$APP_DIR"

echo "CI: flutter pub get"
flutter pub get

echo "CI: flutter analyze"
flutter analyze

echo "CI: flutter test"
flutter test

echo "CI: Completed."
