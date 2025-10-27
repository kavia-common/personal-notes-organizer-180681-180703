#!/usr/bin/env bash
# Default CI entrypoint for generic runners.
# Ensures Flutter commands run from the app directory.
set -euo pipefail

APP_DIR="personal-notes-organizer-180681-180703/notes_frontend"

echo "default_ci.sh: cd to $APP_DIR"
cd "$APP_DIR"

echo "default_ci.sh: flutter pub get"
flutter pub get

echo "default_ci.sh: flutter analyze"
flutter analyze

echo "default_ci.sh: flutter test"
flutter test

echo "default_ci.sh: done"
