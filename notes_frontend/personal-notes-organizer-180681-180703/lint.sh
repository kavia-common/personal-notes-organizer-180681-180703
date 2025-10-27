#!/usr/bin/env bash
# Repository-root lint entrypoint for CI environments.
# Ensures Flutter analysis runs from the correct app directory.
set -euo pipefail

APP_DIR="personal-notes-organizer-180681-180703/notes_frontend"

echo "lint.sh: cd to $APP_DIR"
cd "$APP_DIR"

echo "lint.sh: flutter pub get"
flutter pub get

echo "lint.sh: flutter analyze"
flutter analyze
