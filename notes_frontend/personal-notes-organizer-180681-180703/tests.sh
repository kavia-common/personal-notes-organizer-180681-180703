#!/usr/bin/env bash
# Repository-root test entry for CI environments.
# Ensures Flutter tests run from the correct app directory.
set -euo pipefail

APP_DIR="personal-notes-organizer-180681-180703/notes_frontend"

echo "tests.sh: cd to $APP_DIR"
cd "$APP_DIR"

echo "tests.sh: flutter pub get"
flutter pub get

echo "tests.sh: flutter test"
flutter test
