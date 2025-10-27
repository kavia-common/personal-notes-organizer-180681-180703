#!/usr/bin/env bash
# Conventional build entry for CI environments.
# Ensures Flutter commands execute from the app directory.
set -euo pipefail

APP_DIR="personal-notes-organizer-180681-180703/notes_frontend"

echo "build.sh: switching to $APP_DIR"
cd "$APP_DIR"

echo "build.sh: flutter pub get"
flutter pub get

echo "build.sh: flutter analyze"
flutter analyze

echo "build.sh: flutter test"
flutter test

echo "build.sh: done"
