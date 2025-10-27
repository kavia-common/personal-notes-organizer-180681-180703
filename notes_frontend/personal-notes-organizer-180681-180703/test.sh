#!/usr/bin/env bash
# Common CI test entry that runs Flutter checks from the correct app directory.
set -euo pipefail

APP_DIR="personal-notes-organizer-180681-180703/notes_frontend"

echo "test.sh: switching to $APP_DIR"
cd "$APP_DIR"

echo "test.sh: flutter pub get"
flutter pub get

echo "test.sh: flutter analyze"
flutter analyze

echo "test.sh: flutter test"
flutter test

echo "test.sh: done"
